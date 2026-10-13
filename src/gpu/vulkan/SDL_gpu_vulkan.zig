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
pub extern fn SDL_setenv_unsafe_REAL(name: [*c]const u8, value: [*c]const u8, overwrite: c_int) c_int;
pub extern fn SDL_memcmp_REAL(s1: ?*const anyopaque, s2: ?*const anyopaque, len: usize) c_int;
pub extern fn SDL_strlen_REAL(str: [*c]const u8) usize;
pub extern fn SDL_utf8strlcpy_REAL(dst: [*c]u8, src: [*c]const u8, dst_bytes: usize) usize;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
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
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub extern fn SDL_GetError_REAL() [*c]const u8;
pub const SDL_PropertiesID = Uint32;
pub extern fn SDL_CreateProperties_REAL() SDL_PropertiesID;
pub extern fn SDL_CopyProperties_REAL(src: SDL_PropertiesID, dst: SDL_PropertiesID) bool;
pub extern fn SDL_SetPointerProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: ?*anyopaque) bool;
pub extern fn SDL_SetStringProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: [*c]const u8) bool;
pub extern fn SDL_HasProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8) bool;
pub extern fn SDL_GetPointerProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: ?*anyopaque) ?*anyopaque;
pub extern fn SDL_GetStringProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: [*c]const u8) [*c]const u8;
pub extern fn SDL_GetNumberProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: Sint64) Sint64;
pub extern fn SDL_GetBooleanProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: bool) bool;
pub extern fn SDL_ClearProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8) bool;
pub extern fn SDL_DestroyProperties_REAL(props: SDL_PropertiesID) void;
pub const SDL_ThreadID = Uint64;
pub const SDL_TLSID = SDL_AtomicInt;
pub extern fn SDL_GetCurrentThreadID_REAL() SDL_ThreadID;
pub const struct_SDL_Mutex = opaque {
};
pub const SDL_Mutex = struct_SDL_Mutex;
pub extern fn SDL_CreateMutex_REAL() ?*SDL_Mutex;
pub extern fn SDL_LockMutex_REAL(mutex: ?*SDL_Mutex) void;
pub extern fn SDL_UnlockMutex_REAL(mutex: ?*SDL_Mutex) void;
pub extern fn SDL_DestroyMutex_REAL(mutex: ?*SDL_Mutex) void;
pub const struct_SDL_RWLock = opaque {
};
pub const SDL_RWLock = struct_SDL_RWLock;
pub extern fn SDL_LockRWLockForReading_REAL(rwlock: ?*SDL_RWLock) void;
pub extern fn SDL_LockRWLockForWriting_REAL(rwlock: ?*SDL_RWLock) void;
pub extern fn SDL_UnlockRWLock_REAL(rwlock: ?*SDL_RWLock) void;
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
pub const struct_SDL_FColor = extern struct {
    r: f32 = 0,
    g: f32 = 0,
    b: f32 = 0,
    a: f32 = 0,
};
pub const SDL_FColor = struct_SDL_FColor;
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
pub const SDL_FLIP_HORIZONTAL: c_int = 1;
pub const SDL_FLIP_VERTICAL: c_int = 2;
pub const enum_SDL_FlipMode = c_uint;
pub const SDL_FlipMode = enum_SDL_FlipMode;
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
pub extern fn SDL_GetWindowID_REAL(window: [*c]SDL_Window) SDL_WindowID;
pub extern fn SDL_GetWindowProperties_REAL(window: [*c]SDL_Window) SDL_PropertiesID;
pub extern fn SDL_GetWindowSizeInPixels_REAL(window: [*c]SDL_Window, w: [*c]c_int, h: [*c]c_int) bool;
pub extern fn SDL_SyncWindow_REAL(window: [*c]SDL_Window) bool;
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
pub const enum_SDL_MouseWheelDirection = c_uint;
pub const SDL_MouseWheelDirection = enum_SDL_MouseWheelDirection;
pub const SDL_MouseButtonFlags = Uint32;
pub const SDL_NotificationID = Uint32;
pub const SDL_TouchID = Uint64;
pub const SDL_FingerID = Uint64;
pub const SDL_PenID = Uint32;
pub const SDL_PenInputFlags = Uint32;
pub const enum_SDL_PenAxis = c_uint;
pub const SDL_PenAxis = enum_SDL_PenAxis;
pub const enum_SDL_PenDeviceType = c_int;
pub const SDL_PenDeviceType = enum_SDL_PenDeviceType;
pub const SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED: c_int = 519;
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
pub const SDL_EventFilter = ?*const fn (userdata: ?*anyopaque, event: [*c]SDL_Event) callconv(.c) bool;
pub const SDL_GPUDevice = struct_SDL_GPUDevice;
pub const struct_SDL_GPURenderer = opaque {
};
pub const SDL_GPURenderer = struct_SDL_GPURenderer;
pub const struct_XrSwapchain_T = opaque {
};
pub const XrSwapchain = ?*struct_XrSwapchain_T;
pub const struct_SDL_GPUTexture = opaque {};
pub const SDL_GPUTexture = struct_SDL_GPUTexture;
pub const XR_SUCCESS: c_int = 0;
pub const XR_ERROR_RUNTIME_FAILURE: c_int = -2;
pub const XR_ERROR_HANDLE_INVALID: c_int = -12;
pub const enum_XrResult = c_int;
pub const XrResult = enum_XrResult;
pub const SDL_GPUShaderFormat = Uint32;
pub const struct_SDL_GPUComputePipelineCreateInfo = extern struct {
    code_size: usize = 0,
    code: [*c]const Uint8 = null,
    entrypoint: [*c]const u8 = null,
    format: SDL_GPUShaderFormat = 0,
    num_samplers: Uint32 = 0,
    num_readonly_storage_textures: Uint32 = 0,
    num_readonly_storage_buffers: Uint32 = 0,
    num_readwrite_storage_textures: Uint32 = 0,
    num_readwrite_storage_buffers: Uint32 = 0,
    num_uniform_buffers: Uint32 = 0,
    threadcount_x: Uint32 = 0,
    threadcount_y: Uint32 = 0,
    threadcount_z: Uint32 = 0,
    props: SDL_PropertiesID = 0,
};
pub const SDL_GPUComputePipelineCreateInfo = struct_SDL_GPUComputePipelineCreateInfo;
pub const struct_SDL_GPUComputePipeline = opaque {};
pub const SDL_GPUComputePipeline = struct_SDL_GPUComputePipeline;
pub const struct_SDL_GPUShader = opaque {};
pub const SDL_GPUShader = struct_SDL_GPUShader;
pub const enum_SDL_GPUVertexInputRate = c_uint;
pub const SDL_GPUVertexInputRate = enum_SDL_GPUVertexInputRate;
pub const struct_SDL_GPUVertexBufferDescription = extern struct {
    slot: Uint32 = 0,
    pitch: Uint32 = 0,
    input_rate: SDL_GPUVertexInputRate = @import("std").mem.zeroes(SDL_GPUVertexInputRate),
    instance_step_rate: Uint32 = 0,
};
pub const SDL_GPUVertexBufferDescription = struct_SDL_GPUVertexBufferDescription;
pub const SDL_GPU_VERTEXELEMENTFORMAT_HALF4: c_int = 30;
pub const enum_SDL_GPUVertexElementFormat = c_uint;
pub const SDL_GPUVertexElementFormat = enum_SDL_GPUVertexElementFormat;
pub const struct_SDL_GPUVertexAttribute = extern struct {
    location: Uint32 = 0,
    buffer_slot: Uint32 = 0,
    format: SDL_GPUVertexElementFormat = @import("std").mem.zeroes(SDL_GPUVertexElementFormat),
    offset: Uint32 = 0,
};
pub const SDL_GPUVertexAttribute = struct_SDL_GPUVertexAttribute;
pub const struct_SDL_GPUVertexInputState = extern struct {
    vertex_buffer_descriptions: [*c]const SDL_GPUVertexBufferDescription = null,
    num_vertex_buffers: Uint32 = 0,
    vertex_attributes: [*c]const SDL_GPUVertexAttribute = null,
    num_vertex_attributes: Uint32 = 0,
};
pub const SDL_GPUVertexInputState = struct_SDL_GPUVertexInputState;
pub const enum_SDL_GPUPrimitiveType = c_uint;
pub const SDL_GPUPrimitiveType = enum_SDL_GPUPrimitiveType;
pub const SDL_GPU_FILLMODE_FILL: c_int = 0;
pub const SDL_GPU_FILLMODE_LINE: c_int = 1;
pub const enum_SDL_GPUFillMode = c_uint;
pub const SDL_GPUFillMode = enum_SDL_GPUFillMode;
pub const enum_SDL_GPUCullMode = c_uint;
pub const SDL_GPUCullMode = enum_SDL_GPUCullMode;
pub const enum_SDL_GPUFrontFace = c_uint;
pub const SDL_GPUFrontFace = enum_SDL_GPUFrontFace;
pub const struct_SDL_GPURasterizerState = extern struct {
    fill_mode: SDL_GPUFillMode = @import("std").mem.zeroes(SDL_GPUFillMode),
    cull_mode: SDL_GPUCullMode = @import("std").mem.zeroes(SDL_GPUCullMode),
    front_face: SDL_GPUFrontFace = @import("std").mem.zeroes(SDL_GPUFrontFace),
    depth_bias_constant_factor: f32 = 0,
    depth_bias_clamp: f32 = 0,
    depth_bias_slope_factor: f32 = 0,
    enable_depth_bias: bool = false,
    enable_depth_clip: bool = false,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
};
pub const SDL_GPURasterizerState = struct_SDL_GPURasterizerState;
pub const SDL_GPU_SAMPLECOUNT_1: c_int = 0;
pub const enum_SDL_GPUSampleCount = c_uint;
pub const SDL_GPUSampleCount = enum_SDL_GPUSampleCount;
pub const struct_SDL_GPUMultisampleState = extern struct {
    sample_count: SDL_GPUSampleCount = @import("std").mem.zeroes(SDL_GPUSampleCount),
    sample_mask: Uint32 = 0,
    enable_mask: bool = false,
    enable_alpha_to_coverage: bool = false,
    padding2: Uint8 = 0,
    padding3: Uint8 = 0,
};
pub const SDL_GPUMultisampleState = struct_SDL_GPUMultisampleState;
pub const SDL_GPU_COMPAREOP_ALWAYS: c_int = 8;
pub const enum_SDL_GPUCompareOp = c_uint;
pub const SDL_GPUCompareOp = enum_SDL_GPUCompareOp;
pub const SDL_GPU_STENCILOP_DECREMENT_AND_WRAP: c_int = 8;
pub const enum_SDL_GPUStencilOp = c_uint;
pub const SDL_GPUStencilOp = enum_SDL_GPUStencilOp;
pub const struct_SDL_GPUStencilOpState = extern struct {
    fail_op: SDL_GPUStencilOp = @import("std").mem.zeroes(SDL_GPUStencilOp),
    pass_op: SDL_GPUStencilOp = @import("std").mem.zeroes(SDL_GPUStencilOp),
    depth_fail_op: SDL_GPUStencilOp = @import("std").mem.zeroes(SDL_GPUStencilOp),
    compare_op: SDL_GPUCompareOp = @import("std").mem.zeroes(SDL_GPUCompareOp),
};
pub const SDL_GPUStencilOpState = struct_SDL_GPUStencilOpState;
pub const struct_SDL_GPUDepthStencilState = extern struct {
    compare_op: SDL_GPUCompareOp = @import("std").mem.zeroes(SDL_GPUCompareOp),
    back_stencil_state: SDL_GPUStencilOpState = @import("std").mem.zeroes(SDL_GPUStencilOpState),
    front_stencil_state: SDL_GPUStencilOpState = @import("std").mem.zeroes(SDL_GPUStencilOpState),
    compare_mask: Uint8 = 0,
    write_mask: Uint8 = 0,
    enable_depth_test: bool = false,
    enable_depth_write: bool = false,
    enable_stencil_test: bool = false,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
    padding3: Uint8 = 0,
};
pub const SDL_GPUDepthStencilState = struct_SDL_GPUDepthStencilState;
pub const SDL_GPU_TEXTUREFORMAT_INVALID: c_int = 0;
pub const SDL_GPU_TEXTUREFORMAT_A8_UNORM: c_int = 1;
pub const SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM: c_int = 4;
pub const SDL_GPU_TEXTUREFORMAT_R10G10B10A2_UNORM: c_int = 8;
pub const SDL_GPU_TEXTUREFORMAT_B4G4R4A4_UNORM: c_int = 11;
pub const SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM: c_int = 12;
pub const SDL_GPU_TEXTUREFORMAT_R16G16B16A16_FLOAT: c_int = 29;
pub const SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM_SRGB: c_int = 52;
pub const SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM_SRGB: c_int = 53;
pub const SDL_GPU_TEXTUREFORMAT_D16_UNORM: c_int = 58;
pub const SDL_GPU_TEXTUREFORMAT_D24_UNORM: c_int = 59;
pub const SDL_GPU_TEXTUREFORMAT_D32_FLOAT: c_int = 60;
pub const SDL_GPU_TEXTUREFORMAT_D24_UNORM_S8_UINT: c_int = 61;
pub const SDL_GPU_TEXTUREFORMAT_D32_FLOAT_S8_UINT: c_int = 62;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_12x12_FLOAT: c_int = 104;
pub const enum_SDL_GPUTextureFormat = c_uint;
pub const SDL_GPUTextureFormat = enum_SDL_GPUTextureFormat;
pub const SDL_GPU_BLENDFACTOR_SRC_ALPHA_SATURATE: c_int = 13;
pub const enum_SDL_GPUBlendFactor = c_uint;
pub const SDL_GPUBlendFactor = enum_SDL_GPUBlendFactor;
pub const SDL_GPU_BLENDOP_MAX: c_int = 5;
pub const enum_SDL_GPUBlendOp = c_uint;
pub const SDL_GPUBlendOp = enum_SDL_GPUBlendOp;
pub const SDL_GPUColorComponentFlags = Uint8;
pub const struct_SDL_GPUColorTargetBlendState = extern struct {
    src_color_blendfactor: SDL_GPUBlendFactor = @import("std").mem.zeroes(SDL_GPUBlendFactor),
    dst_color_blendfactor: SDL_GPUBlendFactor = @import("std").mem.zeroes(SDL_GPUBlendFactor),
    color_blend_op: SDL_GPUBlendOp = @import("std").mem.zeroes(SDL_GPUBlendOp),
    src_alpha_blendfactor: SDL_GPUBlendFactor = @import("std").mem.zeroes(SDL_GPUBlendFactor),
    dst_alpha_blendfactor: SDL_GPUBlendFactor = @import("std").mem.zeroes(SDL_GPUBlendFactor),
    alpha_blend_op: SDL_GPUBlendOp = @import("std").mem.zeroes(SDL_GPUBlendOp),
    color_write_mask: SDL_GPUColorComponentFlags = 0,
    enable_blend: bool = false,
    enable_color_write_mask: bool = false,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
};
pub const SDL_GPUColorTargetBlendState = struct_SDL_GPUColorTargetBlendState;
pub const struct_SDL_GPUColorTargetDescription = extern struct {
    format: SDL_GPUTextureFormat = @import("std").mem.zeroes(SDL_GPUTextureFormat),
    blend_state: SDL_GPUColorTargetBlendState = @import("std").mem.zeroes(SDL_GPUColorTargetBlendState),
};
pub const SDL_GPUColorTargetDescription = struct_SDL_GPUColorTargetDescription;
pub const struct_SDL_GPUGraphicsPipelineTargetInfo = extern struct {
    color_target_descriptions: [*c]const SDL_GPUColorTargetDescription = null,
    num_color_targets: Uint32 = 0,
    depth_stencil_format: SDL_GPUTextureFormat = @import("std").mem.zeroes(SDL_GPUTextureFormat),
    has_depth_stencil_target: bool = false,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
    padding3: Uint8 = 0,
};
pub const SDL_GPUGraphicsPipelineTargetInfo = struct_SDL_GPUGraphicsPipelineTargetInfo;
pub const struct_SDL_GPUGraphicsPipelineCreateInfo = extern struct {
    vertex_shader: ?*SDL_GPUShader = null,
    fragment_shader: ?*SDL_GPUShader = null,
    vertex_input_state: SDL_GPUVertexInputState = @import("std").mem.zeroes(SDL_GPUVertexInputState),
    primitive_type: SDL_GPUPrimitiveType = @import("std").mem.zeroes(SDL_GPUPrimitiveType),
    rasterizer_state: SDL_GPURasterizerState = @import("std").mem.zeroes(SDL_GPURasterizerState),
    multisample_state: SDL_GPUMultisampleState = @import("std").mem.zeroes(SDL_GPUMultisampleState),
    depth_stencil_state: SDL_GPUDepthStencilState = @import("std").mem.zeroes(SDL_GPUDepthStencilState),
    target_info: SDL_GPUGraphicsPipelineTargetInfo = @import("std").mem.zeroes(SDL_GPUGraphicsPipelineTargetInfo),
    props: SDL_PropertiesID = 0,
};
pub const SDL_GPUGraphicsPipelineCreateInfo = struct_SDL_GPUGraphicsPipelineCreateInfo;
pub const struct_SDL_GPUGraphicsPipeline = opaque {};
pub const SDL_GPUGraphicsPipeline = struct_SDL_GPUGraphicsPipeline;
pub const enum_SDL_GPUFilter = c_uint;
pub const SDL_GPUFilter = enum_SDL_GPUFilter;
pub const enum_SDL_GPUSamplerMipmapMode = c_uint;
pub const SDL_GPUSamplerMipmapMode = enum_SDL_GPUSamplerMipmapMode;
pub const enum_SDL_GPUSamplerAddressMode = c_uint;
pub const SDL_GPUSamplerAddressMode = enum_SDL_GPUSamplerAddressMode;
pub const struct_SDL_GPUSamplerCreateInfo = extern struct {
    min_filter: SDL_GPUFilter = @import("std").mem.zeroes(SDL_GPUFilter),
    mag_filter: SDL_GPUFilter = @import("std").mem.zeroes(SDL_GPUFilter),
    mipmap_mode: SDL_GPUSamplerMipmapMode = @import("std").mem.zeroes(SDL_GPUSamplerMipmapMode),
    address_mode_u: SDL_GPUSamplerAddressMode = @import("std").mem.zeroes(SDL_GPUSamplerAddressMode),
    address_mode_v: SDL_GPUSamplerAddressMode = @import("std").mem.zeroes(SDL_GPUSamplerAddressMode),
    address_mode_w: SDL_GPUSamplerAddressMode = @import("std").mem.zeroes(SDL_GPUSamplerAddressMode),
    mip_lod_bias: f32 = 0,
    max_anisotropy: f32 = 0,
    compare_op: SDL_GPUCompareOp = @import("std").mem.zeroes(SDL_GPUCompareOp),
    min_lod: f32 = 0,
    max_lod: f32 = 0,
    enable_anisotropy: bool = false,
    enable_compare: bool = false,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
    props: SDL_PropertiesID = 0,
};
pub const SDL_GPUSamplerCreateInfo = struct_SDL_GPUSamplerCreateInfo;
pub const struct_SDL_GPUSampler = opaque {};
pub const SDL_GPUSampler = struct_SDL_GPUSampler;
pub const SDL_GPU_SHADERSTAGE_VERTEX: c_int = 0;
pub const SDL_GPU_SHADERSTAGE_FRAGMENT: c_int = 1;
pub const enum_SDL_GPUShaderStage = c_uint;
pub const SDL_GPUShaderStage = enum_SDL_GPUShaderStage;
pub const struct_SDL_GPUShaderCreateInfo = extern struct {
    code_size: usize = 0,
    code: [*c]const Uint8 = null,
    entrypoint: [*c]const u8 = null,
    format: SDL_GPUShaderFormat = 0,
    stage: SDL_GPUShaderStage = @import("std").mem.zeroes(SDL_GPUShaderStage),
    num_samplers: Uint32 = 0,
    num_storage_textures: Uint32 = 0,
    num_storage_buffers: Uint32 = 0,
    num_uniform_buffers: Uint32 = 0,
    props: SDL_PropertiesID = 0,
};
pub const SDL_GPUShaderCreateInfo = struct_SDL_GPUShaderCreateInfo;
pub const SDL_GPU_TEXTURETYPE_2D: c_int = 0;
pub const SDL_GPU_TEXTURETYPE_2D_ARRAY: c_int = 1;
pub const SDL_GPU_TEXTURETYPE_3D: c_int = 2;
pub const SDL_GPU_TEXTURETYPE_CUBE: c_int = 3;
pub const SDL_GPU_TEXTURETYPE_CUBE_ARRAY: c_int = 4;
pub const enum_SDL_GPUTextureType = c_uint;
pub const SDL_GPUTextureType = enum_SDL_GPUTextureType;
pub const SDL_GPUTextureUsageFlags = Uint32;
pub const struct_SDL_GPUTextureCreateInfo = extern struct {
    type: SDL_GPUTextureType = @import("std").mem.zeroes(SDL_GPUTextureType),
    format: SDL_GPUTextureFormat = @import("std").mem.zeroes(SDL_GPUTextureFormat),
    usage: SDL_GPUTextureUsageFlags = 0,
    width: Uint32 = 0,
    height: Uint32 = 0,
    layer_count_or_depth: Uint32 = 0,
    num_levels: Uint32 = 0,
    sample_count: SDL_GPUSampleCount = @import("std").mem.zeroes(SDL_GPUSampleCount),
    props: SDL_PropertiesID = 0,
};
pub const SDL_GPUTextureCreateInfo = struct_SDL_GPUTextureCreateInfo;
pub const SDL_GPUBufferUsageFlags = Uint32;
pub const struct_SDL_GPUBuffer = opaque {};
pub const SDL_GPUBuffer = struct_SDL_GPUBuffer;
pub const enum_SDL_GPUTransferBufferUsage = c_uint;
pub const SDL_GPUTransferBufferUsage = enum_SDL_GPUTransferBufferUsage;
pub const struct_SDL_GPUTransferBuffer = opaque {};
pub const SDL_GPUTransferBuffer = struct_SDL_GPUTransferBuffer;
pub const XR_TYPE_EXTENSION_PROPERTIES: c_int = 2;
pub const XR_TYPE_INSTANCE_CREATE_INFO: c_int = 3;
pub const XR_TYPE_SYSTEM_GET_INFO: c_int = 4;
pub const XR_TYPE_GRAPHICS_BINDING_VULKAN_KHR: c_int = 1000025000;
pub const XR_TYPE_VULKAN_INSTANCE_CREATE_INFO_KHR: c_int = 1000090000;
pub const XR_TYPE_VULKAN_DEVICE_CREATE_INFO_KHR: c_int = 1000090001;
pub const XR_TYPE_VULKAN_GRAPHICS_DEVICE_GET_INFO_KHR: c_int = 1000090003;
pub const XR_TYPE_SWAPCHAIN_IMAGE_VULKAN2_KHR: c_int = 1000025001;
pub const XR_TYPE_GRAPHICS_REQUIREMENTS_VULKAN2_KHR: c_int = 1000025002;
pub const enum_XrStructureType = c_uint;
pub const XrStructureType = enum_XrStructureType;
pub const XrFlags64 = u64;
pub const XrSessionCreateFlags = XrFlags64;
pub const XrSystemId = u64;
pub const struct_XrSessionCreateInfo = extern struct {
    type: XrStructureType = @import("std").mem.zeroes(XrStructureType),
    next: ?*const anyopaque = null,
    createFlags: XrSessionCreateFlags = 0,
    systemId: XrSystemId = 0,
};
pub const XrSessionCreateInfo = struct_XrSessionCreateInfo;
pub const struct_XrSession_T = opaque {
};
pub const XrSession = ?*struct_XrSession_T;
pub const XrSwapchainCreateFlags = XrFlags64;
pub const XrSwapchainUsageFlags = XrFlags64;
pub const struct_XrSwapchainCreateInfo = extern struct {
    type: XrStructureType = @import("std").mem.zeroes(XrStructureType),
    next: ?*const anyopaque = null,
    createFlags: XrSwapchainCreateFlags = 0,
    usageFlags: XrSwapchainUsageFlags = 0,
    format: i64 = 0,
    sampleCount: u32 = 0,
    width: u32 = 0,
    height: u32 = 0,
    faceCount: u32 = 0,
    arraySize: u32 = 0,
    mipCount: u32 = 0,
};
pub const XrSwapchainCreateInfo = struct_XrSwapchainCreateInfo;
pub const struct_SDL_GPUCommandBuffer = opaque {
};
pub const SDL_GPUCommandBuffer = struct_SDL_GPUCommandBuffer;
pub const SDL_GPU_LOADOP_CLEAR: c_int = 1;
pub const SDL_GPU_LOADOP_DONT_CARE: c_int = 2;
pub const enum_SDL_GPULoadOp = c_uint;
pub const SDL_GPULoadOp = enum_SDL_GPULoadOp;
pub const SDL_GPU_STOREOP_STORE: c_int = 0;
pub const SDL_GPU_STOREOP_DONT_CARE: c_int = 1;
pub const SDL_GPU_STOREOP_RESOLVE: c_int = 2;
pub const SDL_GPU_STOREOP_RESOLVE_AND_STORE: c_int = 3;
pub const enum_SDL_GPUStoreOp = c_uint;
pub const SDL_GPUStoreOp = enum_SDL_GPUStoreOp;
pub const struct_SDL_GPUColorTargetInfo = extern struct {
    texture: ?*SDL_GPUTexture = null,
    mip_level: Uint32 = 0,
    layer_or_depth_plane: Uint32 = 0,
    clear_color: SDL_FColor = @import("std").mem.zeroes(SDL_FColor),
    load_op: SDL_GPULoadOp = @import("std").mem.zeroes(SDL_GPULoadOp),
    store_op: SDL_GPUStoreOp = @import("std").mem.zeroes(SDL_GPUStoreOp),
    resolve_texture: ?*SDL_GPUTexture = null,
    resolve_mip_level: Uint32 = 0,
    resolve_layer: Uint32 = 0,
    cycle: bool = false,
    cycle_resolve_texture: bool = false,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
};
pub const SDL_GPUColorTargetInfo = struct_SDL_GPUColorTargetInfo;
pub const struct_SDL_GPUDepthStencilTargetInfo = extern struct {
    texture: ?*SDL_GPUTexture = null,
    clear_depth: f32 = 0,
    load_op: SDL_GPULoadOp = @import("std").mem.zeroes(SDL_GPULoadOp),
    store_op: SDL_GPUStoreOp = @import("std").mem.zeroes(SDL_GPUStoreOp),
    stencil_load_op: SDL_GPULoadOp = @import("std").mem.zeroes(SDL_GPULoadOp),
    stencil_store_op: SDL_GPUStoreOp = @import("std").mem.zeroes(SDL_GPUStoreOp),
    cycle: bool = false,
    clear_stencil: Uint8 = 0,
    mip_level: Uint8 = 0,
    layer: Uint8 = 0,
};
pub const SDL_GPUDepthStencilTargetInfo = struct_SDL_GPUDepthStencilTargetInfo;
pub const struct_SDL_GPUViewport = extern struct {
    x: f32 = 0,
    y: f32 = 0,
    w: f32 = 0,
    h: f32 = 0,
    min_depth: f32 = 0,
    max_depth: f32 = 0,
};
pub const SDL_GPUViewport = struct_SDL_GPUViewport;
pub const struct_SDL_GPUBufferBinding = extern struct {
    buffer: ?*SDL_GPUBuffer = null,
    offset: Uint32 = 0,
};
pub const SDL_GPUBufferBinding = struct_SDL_GPUBufferBinding;
pub const enum_SDL_GPUIndexElementSize = c_uint;
pub const SDL_GPUIndexElementSize = enum_SDL_GPUIndexElementSize;
pub const struct_SDL_GPUTextureSamplerBinding = extern struct {
    texture: ?*SDL_GPUTexture = null,
    sampler: ?*SDL_GPUSampler = null,
};
pub const SDL_GPUTextureSamplerBinding = struct_SDL_GPUTextureSamplerBinding;
pub const struct_SDL_GPUStorageTextureReadWriteBinding = extern struct {
    texture: ?*SDL_GPUTexture = null,
    mip_level: Uint32 = 0,
    layer: Uint32 = 0,
    cycle: bool = false,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
    padding3: Uint8 = 0,
};
pub const SDL_GPUStorageTextureReadWriteBinding = struct_SDL_GPUStorageTextureReadWriteBinding;
pub const struct_SDL_GPUStorageBufferReadWriteBinding = extern struct {
    buffer: ?*SDL_GPUBuffer = null,
    cycle: bool = false,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
    padding3: Uint8 = 0,
};
pub const SDL_GPUStorageBufferReadWriteBinding = struct_SDL_GPUStorageBufferReadWriteBinding;
pub const struct_SDL_GPUTextureTransferInfo = extern struct {
    transfer_buffer: ?*SDL_GPUTransferBuffer = null,
    offset: Uint32 = 0,
    pixels_per_row: Uint32 = 0,
    rows_per_layer: Uint32 = 0,
};
pub const SDL_GPUTextureTransferInfo = struct_SDL_GPUTextureTransferInfo;
pub const struct_SDL_GPUTextureRegion = extern struct {
    texture: ?*SDL_GPUTexture = null,
    mip_level: Uint32 = 0,
    layer: Uint32 = 0,
    x: Uint32 = 0,
    y: Uint32 = 0,
    z: Uint32 = 0,
    w: Uint32 = 0,
    h: Uint32 = 0,
    d: Uint32 = 0,
};
pub const SDL_GPUTextureRegion = struct_SDL_GPUTextureRegion;
pub const struct_SDL_GPUTransferBufferLocation = extern struct {
    transfer_buffer: ?*SDL_GPUTransferBuffer = null,
    offset: Uint32 = 0,
};
pub const SDL_GPUTransferBufferLocation = struct_SDL_GPUTransferBufferLocation;
pub const struct_SDL_GPUBufferRegion = extern struct {
    buffer: ?*SDL_GPUBuffer = null,
    offset: Uint32 = 0,
    size: Uint32 = 0,
};
pub const SDL_GPUBufferRegion = struct_SDL_GPUBufferRegion;
pub const struct_SDL_GPUTextureLocation = extern struct {
    texture: ?*SDL_GPUTexture = null,
    mip_level: Uint32 = 0,
    layer: Uint32 = 0,
    x: Uint32 = 0,
    y: Uint32 = 0,
    z: Uint32 = 0,
};
pub const SDL_GPUTextureLocation = struct_SDL_GPUTextureLocation;
pub const struct_SDL_GPUBufferLocation = extern struct {
    buffer: ?*SDL_GPUBuffer = null,
    offset: Uint32 = 0,
};
pub const SDL_GPUBufferLocation = struct_SDL_GPUBufferLocation;
pub const struct_SDL_GPUBlitRegion = extern struct {
    texture: ?*SDL_GPUTexture = null,
    mip_level: Uint32 = 0,
    layer_or_depth_plane: Uint32 = 0,
    x: Uint32 = 0,
    y: Uint32 = 0,
    w: Uint32 = 0,
    h: Uint32 = 0,
};
pub const SDL_GPUBlitRegion = struct_SDL_GPUBlitRegion;
pub const struct_SDL_GPUBlitInfo = extern struct {
    source: SDL_GPUBlitRegion = @import("std").mem.zeroes(SDL_GPUBlitRegion),
    destination: SDL_GPUBlitRegion = @import("std").mem.zeroes(SDL_GPUBlitRegion),
    load_op: SDL_GPULoadOp = @import("std").mem.zeroes(SDL_GPULoadOp),
    clear_color: SDL_FColor = @import("std").mem.zeroes(SDL_FColor),
    flip_mode: SDL_FlipMode = @import("std").mem.zeroes(SDL_FlipMode),
    filter: SDL_GPUFilter = @import("std").mem.zeroes(SDL_GPUFilter),
    cycle: bool = false,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
    padding3: Uint8 = 0,
};
pub const SDL_GPUBlitInfo = struct_SDL_GPUBlitInfo;
pub const SDL_GPU_SWAPCHAINCOMPOSITION_SDR: c_int = 0;
pub const SDL_GPU_SWAPCHAINCOMPOSITION_SDR_LINEAR: c_int = 1;
pub const SDL_GPU_SWAPCHAINCOMPOSITION_HDR_EXTENDED_LINEAR: c_int = 2;
pub const SDL_GPU_SWAPCHAINCOMPOSITION_HDR10_ST2084: c_int = 3;
pub const enum_SDL_GPUSwapchainComposition = c_uint;
pub const SDL_GPUSwapchainComposition = enum_SDL_GPUSwapchainComposition;
pub const SDL_GPU_PRESENTMODE_VSYNC: c_int = 0;
pub const SDL_GPU_PRESENTMODE_MAILBOX: c_int = 2;
pub const enum_SDL_GPUPresentMode = c_uint;
pub const SDL_GPUPresentMode = enum_SDL_GPUPresentMode;
pub const struct_SDL_GPUFence = opaque {};
pub const SDL_GPUFence = struct_SDL_GPUFence;
pub const struct_SDL_GPUDevice = extern struct {
    DestroyDevice: ?*const fn (device: [*c]SDL_GPUDevice) callconv(.c) void = null,
    DestroyXRSwapchain: ?*const fn (device: ?*SDL_GPURenderer, swapchain: XrSwapchain, swapchainImages: [*c]?*SDL_GPUTexture) callconv(.c) XrResult = null,
    GetDeviceProperties: ?*const fn (device: [*c]SDL_GPUDevice) callconv(.c) SDL_PropertiesID = null,
    CreateComputePipeline: ?*const fn (driverData: ?*SDL_GPURenderer, createinfo: [*c]const SDL_GPUComputePipelineCreateInfo) callconv(.c) ?*SDL_GPUComputePipeline = null,
    CreateGraphicsPipeline: ?*const fn (driverData: ?*SDL_GPURenderer, createinfo: [*c]const SDL_GPUGraphicsPipelineCreateInfo) callconv(.c) ?*SDL_GPUGraphicsPipeline = null,
    CreateSampler: ?*const fn (driverData: ?*SDL_GPURenderer, createinfo: [*c]const SDL_GPUSamplerCreateInfo) callconv(.c) ?*SDL_GPUSampler = null,
    CreateShader: ?*const fn (driverData: ?*SDL_GPURenderer, createinfo: [*c]const SDL_GPUShaderCreateInfo) callconv(.c) ?*SDL_GPUShader = null,
    CreateTexture: ?*const fn (driverData: ?*SDL_GPURenderer, createinfo: [*c]const SDL_GPUTextureCreateInfo) callconv(.c) ?*SDL_GPUTexture = null,
    CreateBuffer: ?*const fn (driverData: ?*SDL_GPURenderer, usageFlags: SDL_GPUBufferUsageFlags, size: Uint32, debugName: [*c]const u8) callconv(.c) ?*SDL_GPUBuffer = null,
    CreateTransferBuffer: ?*const fn (driverData: ?*SDL_GPURenderer, usage: SDL_GPUTransferBufferUsage, size: Uint32, debugName: [*c]const u8) callconv(.c) ?*SDL_GPUTransferBuffer = null,
    CreateXRSession: ?*const fn (driverData: ?*SDL_GPURenderer, createinfo: [*c]const XrSessionCreateInfo, session: [*c]XrSession) callconv(.c) XrResult = null,
    GetXRSwapchainFormats: ?*const fn (driverData: ?*SDL_GPURenderer, session: XrSession, num_formats: [*c]c_int) callconv(.c) [*c]SDL_GPUTextureFormat = null,
    CreateXRSwapchain: ?*const fn (driverData: ?*SDL_GPURenderer, session: XrSession, createinfo: [*c]const XrSwapchainCreateInfo, format: SDL_GPUTextureFormat, swapchain: [*c]XrSwapchain, textures: [*c][*c]?*SDL_GPUTexture) callconv(.c) XrResult = null,
    SetBufferName: ?*const fn (driverData: ?*SDL_GPURenderer, buffer: ?*SDL_GPUBuffer, text: [*c]const u8) callconv(.c) void = null,
    SetTextureName: ?*const fn (driverData: ?*SDL_GPURenderer, texture: ?*SDL_GPUTexture, text: [*c]const u8) callconv(.c) void = null,
    InsertDebugLabel: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, text: [*c]const u8) callconv(.c) void = null,
    PushDebugGroup: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, name: [*c]const u8) callconv(.c) void = null,
    PopDebugGroup: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer) callconv(.c) void = null,
    ReleaseTexture: ?*const fn (driverData: ?*SDL_GPURenderer, texture: ?*SDL_GPUTexture) callconv(.c) void = null,
    ReleaseSampler: ?*const fn (driverData: ?*SDL_GPURenderer, sampler: ?*SDL_GPUSampler) callconv(.c) void = null,
    ReleaseBuffer: ?*const fn (driverData: ?*SDL_GPURenderer, buffer: ?*SDL_GPUBuffer) callconv(.c) void = null,
    ReleaseTransferBuffer: ?*const fn (driverData: ?*SDL_GPURenderer, transferBuffer: ?*SDL_GPUTransferBuffer) callconv(.c) void = null,
    ReleaseShader: ?*const fn (driverData: ?*SDL_GPURenderer, shader: ?*SDL_GPUShader) callconv(.c) void = null,
    ReleaseComputePipeline: ?*const fn (driverData: ?*SDL_GPURenderer, computePipeline: ?*SDL_GPUComputePipeline) callconv(.c) void = null,
    ReleaseGraphicsPipeline: ?*const fn (driverData: ?*SDL_GPURenderer, graphicsPipeline: ?*SDL_GPUGraphicsPipeline) callconv(.c) void = null,
    BeginRenderPass: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, colorTargetInfos: [*c]const SDL_GPUColorTargetInfo, numColorTargets: Uint32, depthStencilTargetInfo: [*c]const SDL_GPUDepthStencilTargetInfo) callconv(.c) void = null,
    BindGraphicsPipeline: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, graphicsPipeline: ?*SDL_GPUGraphicsPipeline) callconv(.c) void = null,
    SetViewport: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, viewport: [*c]const SDL_GPUViewport) callconv(.c) void = null,
    SetScissor: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, scissor: [*c]const SDL_Rect) callconv(.c) void = null,
    SetBlendConstants: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, blendConstants: SDL_FColor) callconv(.c) void = null,
    SetStencilReference: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, reference: Uint8) callconv(.c) void = null,
    BindVertexBuffers: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, firstSlot: Uint32, bindings: [*c]const SDL_GPUBufferBinding, numBindings: Uint32) callconv(.c) void = null,
    BindIndexBuffer: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, binding: [*c]const SDL_GPUBufferBinding, indexElementSize: SDL_GPUIndexElementSize) callconv(.c) void = null,
    BindVertexSamplers: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, firstSlot: Uint32, textureSamplerBindings: [*c]const SDL_GPUTextureSamplerBinding, numBindings: Uint32) callconv(.c) void = null,
    BindVertexStorageTextures: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, firstSlot: Uint32, storageTextures: [*c]const ?*SDL_GPUTexture, numBindings: Uint32) callconv(.c) void = null,
    BindVertexStorageBuffers: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, firstSlot: Uint32, storageBuffers: [*c]const ?*SDL_GPUBuffer, numBindings: Uint32) callconv(.c) void = null,
    BindFragmentSamplers: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, firstSlot: Uint32, textureSamplerBindings: [*c]const SDL_GPUTextureSamplerBinding, numBindings: Uint32) callconv(.c) void = null,
    BindFragmentStorageTextures: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, firstSlot: Uint32, storageTextures: [*c]const ?*SDL_GPUTexture, numBindings: Uint32) callconv(.c) void = null,
    BindFragmentStorageBuffers: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, firstSlot: Uint32, storageBuffers: [*c]const ?*SDL_GPUBuffer, numBindings: Uint32) callconv(.c) void = null,
    PushVertexUniformData: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, slotIndex: Uint32, data: ?*const anyopaque, length: Uint32) callconv(.c) void = null,
    PushFragmentUniformData: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, slotIndex: Uint32, data: ?*const anyopaque, length: Uint32) callconv(.c) void = null,
    DrawIndexedPrimitives: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, numIndices: Uint32, numInstances: Uint32, firstIndex: Uint32, vertexOffset: Sint32, firstInstance: Uint32) callconv(.c) void = null,
    DrawPrimitives: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, numVertices: Uint32, numInstances: Uint32, firstVertex: Uint32, firstInstance: Uint32) callconv(.c) void = null,
    DrawPrimitivesIndirect: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, buffer: ?*SDL_GPUBuffer, offset: Uint32, drawCount: Uint32) callconv(.c) void = null,
    DrawIndexedPrimitivesIndirect: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, buffer: ?*SDL_GPUBuffer, offset: Uint32, drawCount: Uint32) callconv(.c) void = null,
    EndRenderPass: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer) callconv(.c) void = null,
    BeginComputePass: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, storageTextureBindings: [*c]const SDL_GPUStorageTextureReadWriteBinding, numStorageTextureBindings: Uint32, storageBufferBindings: [*c]const SDL_GPUStorageBufferReadWriteBinding, numStorageBufferBindings: Uint32) callconv(.c) void = null,
    BindComputePipeline: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, computePipeline: ?*SDL_GPUComputePipeline) callconv(.c) void = null,
    BindComputeSamplers: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, firstSlot: Uint32, textureSamplerBindings: [*c]const SDL_GPUTextureSamplerBinding, numBindings: Uint32) callconv(.c) void = null,
    BindComputeStorageTextures: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, firstSlot: Uint32, storageTextures: [*c]const ?*SDL_GPUTexture, numBindings: Uint32) callconv(.c) void = null,
    BindComputeStorageBuffers: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, firstSlot: Uint32, storageBuffers: [*c]const ?*SDL_GPUBuffer, numBindings: Uint32) callconv(.c) void = null,
    PushComputeUniformData: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, slotIndex: Uint32, data: ?*const anyopaque, length: Uint32) callconv(.c) void = null,
    DispatchCompute: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, groupcountX: Uint32, groupcountY: Uint32, groupcountZ: Uint32) callconv(.c) void = null,
    DispatchComputeIndirect: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, buffer: ?*SDL_GPUBuffer, offset: Uint32) callconv(.c) void = null,
    EndComputePass: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer) callconv(.c) void = null,
    MapTransferBuffer: ?*const fn (device: ?*SDL_GPURenderer, transferBuffer: ?*SDL_GPUTransferBuffer, cycle: bool) callconv(.c) ?*anyopaque = null,
    UnmapTransferBuffer: ?*const fn (device: ?*SDL_GPURenderer, transferBuffer: ?*SDL_GPUTransferBuffer) callconv(.c) void = null,
    BeginCopyPass: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer) callconv(.c) void = null,
    UploadToTexture: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, source: [*c]const SDL_GPUTextureTransferInfo, destination: [*c]const SDL_GPUTextureRegion, cycle: bool) callconv(.c) void = null,
    UploadToBuffer: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, source: [*c]const SDL_GPUTransferBufferLocation, destination: [*c]const SDL_GPUBufferRegion, cycle: bool) callconv(.c) void = null,
    CopyTextureToTexture: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, source: [*c]const SDL_GPUTextureLocation, destination: [*c]const SDL_GPUTextureLocation, w: Uint32, h: Uint32, d: Uint32, cycle: bool) callconv(.c) void = null,
    CopyBufferToBuffer: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, source: [*c]const SDL_GPUBufferLocation, destination: [*c]const SDL_GPUBufferLocation, size: Uint32, cycle: bool) callconv(.c) void = null,
    GenerateMipmaps: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, texture: ?*SDL_GPUTexture) callconv(.c) void = null,
    DownloadFromTexture: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, source: [*c]const SDL_GPUTextureRegion, destination: [*c]const SDL_GPUTextureTransferInfo) callconv(.c) void = null,
    DownloadFromBuffer: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, source: [*c]const SDL_GPUBufferRegion, destination: [*c]const SDL_GPUTransferBufferLocation) callconv(.c) void = null,
    EndCopyPass: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer) callconv(.c) void = null,
    Blit: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, info: [*c]const SDL_GPUBlitInfo) callconv(.c) void = null,
    SupportsSwapchainComposition: ?*const fn (driverData: ?*SDL_GPURenderer, window: [*c]SDL_Window, swapchainComposition: SDL_GPUSwapchainComposition) callconv(.c) bool = null,
    SupportsPresentMode: ?*const fn (driverData: ?*SDL_GPURenderer, window: [*c]SDL_Window, presentMode: SDL_GPUPresentMode) callconv(.c) bool = null,
    ClaimWindow: ?*const fn (driverData: ?*SDL_GPURenderer, window: [*c]SDL_Window) callconv(.c) bool = null,
    ReleaseWindow: ?*const fn (driverData: ?*SDL_GPURenderer, window: [*c]SDL_Window) callconv(.c) void = null,
    SetSwapchainParameters: ?*const fn (driverData: ?*SDL_GPURenderer, window: [*c]SDL_Window, swapchainComposition: SDL_GPUSwapchainComposition, presentMode: SDL_GPUPresentMode) callconv(.c) bool = null,
    SetAllowedFramesInFlight: ?*const fn (driverData: ?*SDL_GPURenderer, allowedFramesInFlight: Uint32) callconv(.c) bool = null,
    GetSwapchainTextureFormat: ?*const fn (driverData: ?*SDL_GPURenderer, window: [*c]SDL_Window) callconv(.c) SDL_GPUTextureFormat = null,
    AcquireCommandBuffer: ?*const fn (driverData: ?*SDL_GPURenderer) callconv(.c) ?*SDL_GPUCommandBuffer = null,
    AcquireSwapchainTexture: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, window: [*c]SDL_Window, swapchainTexture: [*c]?*SDL_GPUTexture, swapchainTextureWidth: [*c]Uint32, swapchainTextureHeight: [*c]Uint32) callconv(.c) bool = null,
    WaitForSwapchain: ?*const fn (driverData: ?*SDL_GPURenderer, window: [*c]SDL_Window) callconv(.c) bool = null,
    WaitAndAcquireSwapchainTexture: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, window: [*c]SDL_Window, swapchainTexture: [*c]?*SDL_GPUTexture, swapchainTextureWidth: [*c]Uint32, swapchainTextureHeight: [*c]Uint32) callconv(.c) bool = null,
    Submit: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer) callconv(.c) bool = null,
    SubmitAndAcquireFence: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer) callconv(.c) ?*SDL_GPUFence = null,
    Cancel: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer) callconv(.c) bool = null,
    Wait: ?*const fn (driverData: ?*SDL_GPURenderer) callconv(.c) bool = null,
    WaitForFences: ?*const fn (driverData: ?*SDL_GPURenderer, waitAll: bool, fences: [*c]const ?*SDL_GPUFence, numFences: Uint32) callconv(.c) bool = null,
    QueryFence: ?*const fn (driverData: ?*SDL_GPURenderer, fence: ?*SDL_GPUFence) callconv(.c) bool = null,
    ReleaseFence: ?*const fn (driverData: ?*SDL_GPURenderer, fence: ?*SDL_GPUFence) callconv(.c) void = null,
    SupportsTextureFormat: ?*const fn (driverData: ?*SDL_GPURenderer, format: SDL_GPUTextureFormat, @"type": SDL_GPUTextureType, usage: SDL_GPUTextureUsageFlags) callconv(.c) bool = null,
    SupportsSampleCount: ?*const fn (driverData: ?*SDL_GPURenderer, format: SDL_GPUTextureFormat, desiredSampleCount: SDL_GPUSampleCount) callconv(.c) bool = null,
    driverData: ?*SDL_GPURenderer = null,
    backend: [*c]const u8 = null,
    shader_formats: SDL_GPUShaderFormat = 0,
    debug_mode: bool = false,
    default_enable_depth_clip: bool = false,
    validate_feature_depth_clamp_disabled: bool = false,
    validate_feature_anisotropy_disabled: bool = false,
    max_viewport_width: Uint32 = 0,
    max_viewport_height: Uint32 = 0,
};
pub const struct_SDL_GPUIndirectDrawCommand = extern struct {
    num_vertices: Uint32 = 0,
    num_instances: Uint32 = 0,
    first_vertex: Uint32 = 0,
    first_instance: Uint32 = 0,
};
pub const SDL_GPUIndirectDrawCommand = struct_SDL_GPUIndirectDrawCommand;
pub const struct_SDL_GPUIndexedIndirectDrawCommand = extern struct {
    num_indices: Uint32 = 0,
    num_instances: Uint32 = 0,
    first_index: Uint32 = 0,
    vertex_offset: Sint32 = 0,
    first_instance: Uint32 = 0,
};
pub const SDL_GPUIndexedIndirectDrawCommand = struct_SDL_GPUIndexedIndirectDrawCommand;
pub const struct_SDL_GPUVulkanOptions = extern struct {
    vulkan_api_version: Uint32 = 0,
    feature_list: ?*anyopaque = null,
    vulkan_10_physical_device_features: ?*anyopaque = null,
    device_extension_count: Uint32 = 0,
    device_extension_names: [*c][*c]const u8 = null,
    instance_extension_count: Uint32 = 0,
    instance_extension_names: [*c][*c]const u8 = null,
};
pub const SDL_GPUVulkanOptions = struct_SDL_GPUVulkanOptions;
pub const struct_SDL_SharedObject = opaque {
};
pub const SDL_SharedObject = struct_SDL_SharedObject;
pub const SDL_LOG_CATEGORY_GPU: c_int = 9;
pub extern fn SDL_LogVerbose_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_LogDebug_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_LogInfo_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_LogWarn_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_LogError_REAL(category: c_int, fmt: [*c]const u8, ...) void;
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
pub const struct_SDL_HashTable = opaque {
};
pub const SDL_HashTable = struct_SDL_HashTable;
pub const SDL_HashCallback = ?*const fn (userdata: ?*anyopaque, key: ?*const anyopaque) callconv(.c) Uint32;
pub const SDL_HashKeyMatchCallback = ?*const fn (userdata: ?*anyopaque, a: ?*const anyopaque, b: ?*const anyopaque) callconv(.c) bool;
pub const SDL_HashDestroyCallback = ?*const fn (userdata: ?*anyopaque, key: ?*const anyopaque, value: ?*const anyopaque) callconv(.c) void;
pub const SDL_HashTableIterateCallback = ?*const fn (userdata: ?*anyopaque, table: ?*const SDL_HashTable, key: ?*const anyopaque, value: ?*const anyopaque) callconv(.c) bool;
pub extern fn SDL_CreateHashTable(estimated_capacity: c_int, threadsafe: bool, hash: SDL_HashCallback, keymatch: SDL_HashKeyMatchCallback, destroy: SDL_HashDestroyCallback, userdata: ?*anyopaque) ?*SDL_HashTable;
pub extern fn SDL_DestroyHashTable(table: ?*SDL_HashTable) void;
pub extern fn SDL_InsertIntoHashTable(table: ?*SDL_HashTable, key: ?*const anyopaque, value: ?*const anyopaque, replace: bool) bool;
pub extern fn SDL_FindInHashTable(table: ?*const SDL_HashTable, key: ?*const anyopaque, value: [*c]?*const anyopaque) bool;
pub extern fn SDL_RemoveFromHashTable(table: ?*SDL_HashTable, key: ?*const anyopaque) bool;
pub extern fn SDL_IterateHashTable(table: ?*const SDL_HashTable, callback: SDL_HashTableIterateCallback, userdata: ?*anyopaque) bool;
pub const VkBool32 = u32;
pub const VkDeviceSize = u64;
pub const VkFlags = u32;
pub const VkSampleMask = u32;
pub const struct_VkInstance_T = opaque {
};
pub const VkInstance = ?*struct_VkInstance_T;
pub const struct_VkPhysicalDevice_T = opaque {};
pub const VkPhysicalDevice = ?*struct_VkPhysicalDevice_T;
pub const struct_VkDevice_T = opaque {};
pub const VkDevice = ?*struct_VkDevice_T;
pub const struct_VkQueue_T = opaque {};
pub const VkQueue = ?*struct_VkQueue_T;
pub const struct_VkSemaphore_T = opaque {};
pub const VkSemaphore = ?*struct_VkSemaphore_T;
pub const struct_VkCommandBuffer_T = opaque {};
pub const VkCommandBuffer = ?*struct_VkCommandBuffer_T;
pub const struct_VkFence_T = opaque {};
pub const VkFence = ?*struct_VkFence_T;
pub const struct_VkDeviceMemory_T = opaque {};
pub const VkDeviceMemory = ?*struct_VkDeviceMemory_T;
pub const struct_VkBuffer_T = opaque {};
pub const VkBuffer = ?*struct_VkBuffer_T;
pub const struct_VkImage_T = opaque {};
pub const VkImage = ?*struct_VkImage_T;
pub const struct_VkImageView_T = opaque {};
pub const VkImageView = ?*struct_VkImageView_T;
pub const struct_VkCommandPool_T = opaque {};
pub const VkCommandPool = ?*struct_VkCommandPool_T;
pub const struct_VkRenderPass_T = opaque {};
pub const VkRenderPass = ?*struct_VkRenderPass_T;
pub const struct_VkFramebuffer_T = opaque {};
pub const VkFramebuffer = ?*struct_VkFramebuffer_T;
pub const struct_VkBufferView_T = opaque {};
pub const VkBufferView = ?*struct_VkBufferView_T;
pub const struct_VkShaderModule_T = opaque {};
pub const VkShaderModule = ?*struct_VkShaderModule_T;
pub const struct_VkPipelineCache_T = opaque {};
pub const VkPipelineCache = ?*struct_VkPipelineCache_T;
pub const struct_VkPipeline_T = opaque {};
pub const VkPipeline = ?*struct_VkPipeline_T;
pub const struct_VkPipelineLayout_T = opaque {};
pub const VkPipelineLayout = ?*struct_VkPipelineLayout_T;
pub const struct_VkDescriptorSetLayout_T = opaque {};
pub const VkDescriptorSetLayout = ?*struct_VkDescriptorSetLayout_T;
pub const struct_VkSampler_T = opaque {};
pub const VkSampler = ?*struct_VkSampler_T;
pub const struct_VkDescriptorSet_T = opaque {};
pub const VkDescriptorSet = ?*struct_VkDescriptorSet_T;
pub const struct_VkDescriptorPool_T = opaque {};
pub const VkDescriptorPool = ?*struct_VkDescriptorPool_T;
pub const VK_SUCCESS: c_int = 0;
pub const VK_NOT_READY: c_int = 1;
pub const VK_INCOMPLETE: c_int = 5;
pub const VK_ERROR_OUT_OF_HOST_MEMORY: c_int = -1;
pub const VK_ERROR_OUT_OF_DEVICE_MEMORY: c_int = -2;
pub const VK_ERROR_INITIALIZATION_FAILED: c_int = -3;
pub const VK_ERROR_DEVICE_LOST: c_int = -4;
pub const VK_ERROR_LAYER_NOT_PRESENT: c_int = -6;
pub const VK_ERROR_EXTENSION_NOT_PRESENT: c_int = -7;
pub const VK_ERROR_FEATURE_NOT_PRESENT: c_int = -8;
pub const VK_ERROR_INCOMPATIBLE_DRIVER: c_int = -9;
pub const VK_ERROR_TOO_MANY_OBJECTS: c_int = -10;
pub const VK_ERROR_FRAGMENTED_POOL: c_int = -12;
pub const VK_ERROR_OUT_OF_POOL_MEMORY: c_int = -1000069000;
pub const VK_ERROR_SURFACE_LOST_KHR: c_int = -1000000000;
pub const VK_ERROR_NATIVE_WINDOW_IN_USE_KHR: c_int = -1000000001;
pub const VK_SUBOPTIMAL_KHR: c_int = 1000001003;
pub const VK_ERROR_OUT_OF_DATE_KHR: c_int = -1000001004;
pub const VK_ERROR_INVALID_SHADER_NV: c_int = -1000012000;
pub const VK_ERROR_FULL_SCREEN_EXCLUSIVE_MODE_LOST_EXT: c_int = -1000255000;
pub const enum_VkResult = c_int;
pub const VkResult = enum_VkResult;
pub const VK_STRUCTURE_TYPE_APPLICATION_INFO: c_int = 0;
pub const VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO: c_int = 1;
pub const VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO: c_int = 2;
pub const VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO: c_int = 3;
pub const VK_STRUCTURE_TYPE_SUBMIT_INFO: c_int = 4;
pub const VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO: c_int = 5;
pub const VK_STRUCTURE_TYPE_FENCE_CREATE_INFO: c_int = 8;
pub const VK_STRUCTURE_TYPE_SEMAPHORE_CREATE_INFO: c_int = 9;
pub const VK_STRUCTURE_TYPE_BUFFER_CREATE_INFO: c_int = 12;
pub const VK_STRUCTURE_TYPE_IMAGE_CREATE_INFO: c_int = 14;
pub const VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO: c_int = 15;
pub const VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO: c_int = 16;
pub const VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO: c_int = 18;
pub const VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_STATE_CREATE_INFO: c_int = 19;
pub const VK_STRUCTURE_TYPE_PIPELINE_INPUT_ASSEMBLY_STATE_CREATE_INFO: c_int = 20;
pub const VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_STATE_CREATE_INFO: c_int = 22;
pub const VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_STATE_CREATE_INFO: c_int = 23;
pub const VK_STRUCTURE_TYPE_PIPELINE_MULTISAMPLE_STATE_CREATE_INFO: c_int = 24;
pub const VK_STRUCTURE_TYPE_PIPELINE_DEPTH_STENCIL_STATE_CREATE_INFO: c_int = 25;
pub const VK_STRUCTURE_TYPE_PIPELINE_COLOR_BLEND_STATE_CREATE_INFO: c_int = 26;
pub const VK_STRUCTURE_TYPE_PIPELINE_DYNAMIC_STATE_CREATE_INFO: c_int = 27;
pub const VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_CREATE_INFO: c_int = 28;
pub const VK_STRUCTURE_TYPE_COMPUTE_PIPELINE_CREATE_INFO: c_int = 29;
pub const VK_STRUCTURE_TYPE_PIPELINE_LAYOUT_CREATE_INFO: c_int = 30;
pub const VK_STRUCTURE_TYPE_SAMPLER_CREATE_INFO: c_int = 31;
pub const VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_CREATE_INFO: c_int = 32;
pub const VK_STRUCTURE_TYPE_DESCRIPTOR_POOL_CREATE_INFO: c_int = 33;
pub const VK_STRUCTURE_TYPE_DESCRIPTOR_SET_ALLOCATE_INFO: c_int = 34;
pub const VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET: c_int = 35;
pub const VK_STRUCTURE_TYPE_FRAMEBUFFER_CREATE_INFO: c_int = 37;
pub const VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO: c_int = 38;
pub const VK_STRUCTURE_TYPE_COMMAND_POOL_CREATE_INFO: c_int = 39;
pub const VK_STRUCTURE_TYPE_COMMAND_BUFFER_ALLOCATE_INFO: c_int = 40;
pub const VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO: c_int = 42;
pub const VK_STRUCTURE_TYPE_RENDER_PASS_BEGIN_INFO: c_int = 43;
pub const VK_STRUCTURE_TYPE_BUFFER_MEMORY_BARRIER: c_int = 44;
pub const VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER: c_int = 45;
pub const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FEATURES_2: c_int = 1000059000;
pub const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROPERTIES_2: c_int = 1000059001;
pub const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROTECTED_MEMORY_FEATURES: c_int = 1000145001;
pub const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_16BIT_STORAGE_FEATURES: c_int = 1000083000;
pub const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTERS_FEATURES: c_int = 1000120000;
pub const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SAMPLER_YCBCR_CONVERSION_FEATURES: c_int = 1000156004;
pub const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTIVIEW_FEATURES: c_int = 1000053001;
pub const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_DRAW_PARAMETERS_FEATURES: c_int = 1000063000;
pub const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_1_FEATURES: c_int = 49;
pub const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_2_FEATURES: c_int = 51;
pub const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_3_FEATURES: c_int = 53;
pub const VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR: c_int = 1000001000;
pub const VK_STRUCTURE_TYPE_PRESENT_INFO_KHR: c_int = 1000001001;
pub const VK_STRUCTURE_TYPE_DEBUG_UTILS_OBJECT_NAME_INFO_EXT: c_int = 1000128000;
pub const VK_STRUCTURE_TYPE_DEBUG_UTILS_LABEL_EXT: c_int = 1000128002;
pub const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_FEATURES_KHR: c_int = 1000163000;
pub const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_DRIVER_PROPERTIES_MSFT: c_int = 1000530000;
pub const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DRIVER_PROPERTIES_KHR: c_int = 1000196000;
pub const enum_VkStructureType = c_uint;
pub const VkStructureType = enum_VkStructureType;
pub const VK_OBJECT_TYPE_BUFFER: c_int = 9;
pub const VK_OBJECT_TYPE_IMAGE: c_int = 10;
pub const VK_OBJECT_TYPE_SHADER_MODULE: c_int = 15;
pub const VK_OBJECT_TYPE_PIPELINE: c_int = 19;
pub const VK_OBJECT_TYPE_SAMPLER: c_int = 21;
pub const enum_VkObjectType = c_uint;
pub const VkObjectType = enum_VkObjectType;
pub const enum_VkSystemAllocationScope = c_uint;
pub const VkSystemAllocationScope = enum_VkSystemAllocationScope;
pub const enum_VkInternalAllocationType = c_uint;
pub const VkInternalAllocationType = enum_VkInternalAllocationType;
pub const VK_FORMAT_UNDEFINED: c_int = 0;
pub const VK_FORMAT_B4G4R4A4_UNORM_PACK16: c_int = 3;
pub const VK_FORMAT_R5G6B5_UNORM_PACK16: c_int = 4;
pub const VK_FORMAT_A1R5G5B5_UNORM_PACK16: c_int = 8;
pub const VK_FORMAT_R8_UNORM: c_int = 9;
pub const VK_FORMAT_R8_SNORM: c_int = 10;
pub const VK_FORMAT_R8_UINT: c_int = 13;
pub const VK_FORMAT_R8_SINT: c_int = 14;
pub const VK_FORMAT_R8G8_UNORM: c_int = 16;
pub const VK_FORMAT_R8G8_SNORM: c_int = 17;
pub const VK_FORMAT_R8G8_UINT: c_int = 20;
pub const VK_FORMAT_R8G8_SINT: c_int = 21;
pub const VK_FORMAT_R8G8B8A8_UNORM: c_int = 37;
pub const VK_FORMAT_R8G8B8A8_SNORM: c_int = 38;
pub const VK_FORMAT_R8G8B8A8_UINT: c_int = 41;
pub const VK_FORMAT_R8G8B8A8_SINT: c_int = 42;
pub const VK_FORMAT_R8G8B8A8_SRGB: c_int = 43;
pub const VK_FORMAT_B8G8R8A8_UNORM: c_int = 44;
pub const VK_FORMAT_B8G8R8A8_SRGB: c_int = 50;
pub const VK_FORMAT_A2B10G10R10_UNORM_PACK32: c_int = 64;
pub const VK_FORMAT_R16_UNORM: c_int = 70;
pub const VK_FORMAT_R16_SNORM: c_int = 71;
pub const VK_FORMAT_R16_UINT: c_int = 74;
pub const VK_FORMAT_R16_SINT: c_int = 75;
pub const VK_FORMAT_R16_SFLOAT: c_int = 76;
pub const VK_FORMAT_R16G16_UNORM: c_int = 77;
pub const VK_FORMAT_R16G16_SNORM: c_int = 78;
pub const VK_FORMAT_R16G16_UINT: c_int = 81;
pub const VK_FORMAT_R16G16_SINT: c_int = 82;
pub const VK_FORMAT_R16G16_SFLOAT: c_int = 83;
pub const VK_FORMAT_R16G16B16A16_UNORM: c_int = 91;
pub const VK_FORMAT_R16G16B16A16_SNORM: c_int = 92;
pub const VK_FORMAT_R16G16B16A16_UINT: c_int = 95;
pub const VK_FORMAT_R16G16B16A16_SINT: c_int = 96;
pub const VK_FORMAT_R16G16B16A16_SFLOAT: c_int = 97;
pub const VK_FORMAT_R32_UINT: c_int = 98;
pub const VK_FORMAT_R32_SINT: c_int = 99;
pub const VK_FORMAT_R32_SFLOAT: c_int = 100;
pub const VK_FORMAT_R32G32_UINT: c_int = 101;
pub const VK_FORMAT_R32G32_SINT: c_int = 102;
pub const VK_FORMAT_R32G32_SFLOAT: c_int = 103;
pub const VK_FORMAT_R32G32B32_UINT: c_int = 104;
pub const VK_FORMAT_R32G32B32_SINT: c_int = 105;
pub const VK_FORMAT_R32G32B32_SFLOAT: c_int = 106;
pub const VK_FORMAT_R32G32B32A32_UINT: c_int = 107;
pub const VK_FORMAT_R32G32B32A32_SINT: c_int = 108;
pub const VK_FORMAT_R32G32B32A32_SFLOAT: c_int = 109;
pub const VK_FORMAT_B10G11R11_UFLOAT_PACK32: c_int = 122;
pub const VK_FORMAT_D16_UNORM: c_int = 124;
pub const VK_FORMAT_X8_D24_UNORM_PACK32: c_int = 125;
pub const VK_FORMAT_D32_SFLOAT: c_int = 126;
pub const VK_FORMAT_D24_UNORM_S8_UINT: c_int = 129;
pub const VK_FORMAT_D32_SFLOAT_S8_UINT: c_int = 130;
pub const VK_FORMAT_BC1_RGBA_UNORM_BLOCK: c_int = 133;
pub const VK_FORMAT_BC1_RGBA_SRGB_BLOCK: c_int = 134;
pub const VK_FORMAT_BC2_UNORM_BLOCK: c_int = 135;
pub const VK_FORMAT_BC2_SRGB_BLOCK: c_int = 136;
pub const VK_FORMAT_BC3_UNORM_BLOCK: c_int = 137;
pub const VK_FORMAT_BC3_SRGB_BLOCK: c_int = 138;
pub const VK_FORMAT_BC4_UNORM_BLOCK: c_int = 139;
pub const VK_FORMAT_BC5_UNORM_BLOCK: c_int = 141;
pub const VK_FORMAT_BC6H_UFLOAT_BLOCK: c_int = 143;
pub const VK_FORMAT_BC6H_SFLOAT_BLOCK: c_int = 144;
pub const VK_FORMAT_BC7_UNORM_BLOCK: c_int = 145;
pub const VK_FORMAT_BC7_SRGB_BLOCK: c_int = 146;
pub const VK_FORMAT_ASTC_4x4_UNORM_BLOCK: c_int = 157;
pub const VK_FORMAT_ASTC_4x4_SRGB_BLOCK: c_int = 158;
pub const VK_FORMAT_ASTC_5x4_UNORM_BLOCK: c_int = 159;
pub const VK_FORMAT_ASTC_5x4_SRGB_BLOCK: c_int = 160;
pub const VK_FORMAT_ASTC_5x5_UNORM_BLOCK: c_int = 161;
pub const VK_FORMAT_ASTC_5x5_SRGB_BLOCK: c_int = 162;
pub const VK_FORMAT_ASTC_6x5_UNORM_BLOCK: c_int = 163;
pub const VK_FORMAT_ASTC_6x5_SRGB_BLOCK: c_int = 164;
pub const VK_FORMAT_ASTC_6x6_UNORM_BLOCK: c_int = 165;
pub const VK_FORMAT_ASTC_6x6_SRGB_BLOCK: c_int = 166;
pub const VK_FORMAT_ASTC_8x5_UNORM_BLOCK: c_int = 167;
pub const VK_FORMAT_ASTC_8x5_SRGB_BLOCK: c_int = 168;
pub const VK_FORMAT_ASTC_8x6_UNORM_BLOCK: c_int = 169;
pub const VK_FORMAT_ASTC_8x6_SRGB_BLOCK: c_int = 170;
pub const VK_FORMAT_ASTC_8x8_UNORM_BLOCK: c_int = 171;
pub const VK_FORMAT_ASTC_8x8_SRGB_BLOCK: c_int = 172;
pub const VK_FORMAT_ASTC_10x5_UNORM_BLOCK: c_int = 173;
pub const VK_FORMAT_ASTC_10x5_SRGB_BLOCK: c_int = 174;
pub const VK_FORMAT_ASTC_10x6_UNORM_BLOCK: c_int = 175;
pub const VK_FORMAT_ASTC_10x6_SRGB_BLOCK: c_int = 176;
pub const VK_FORMAT_ASTC_10x8_UNORM_BLOCK: c_int = 177;
pub const VK_FORMAT_ASTC_10x8_SRGB_BLOCK: c_int = 178;
pub const VK_FORMAT_ASTC_10x10_UNORM_BLOCK: c_int = 179;
pub const VK_FORMAT_ASTC_10x10_SRGB_BLOCK: c_int = 180;
pub const VK_FORMAT_ASTC_12x10_UNORM_BLOCK: c_int = 181;
pub const VK_FORMAT_ASTC_12x10_SRGB_BLOCK: c_int = 182;
pub const VK_FORMAT_ASTC_12x12_UNORM_BLOCK: c_int = 183;
pub const VK_FORMAT_ASTC_12x12_SRGB_BLOCK: c_int = 184;
pub const VK_FORMAT_ASTC_12x12_SFLOAT_BLOCK: c_int = 1000066013;
pub const VK_FORMAT_ASTC_4x4_SFLOAT_BLOCK_EXT: c_int = 1000066000;
pub const VK_FORMAT_ASTC_5x4_SFLOAT_BLOCK_EXT: c_int = 1000066001;
pub const VK_FORMAT_ASTC_5x5_SFLOAT_BLOCK_EXT: c_int = 1000066002;
pub const VK_FORMAT_ASTC_6x5_SFLOAT_BLOCK_EXT: c_int = 1000066003;
pub const VK_FORMAT_ASTC_6x6_SFLOAT_BLOCK_EXT: c_int = 1000066004;
pub const VK_FORMAT_ASTC_8x5_SFLOAT_BLOCK_EXT: c_int = 1000066005;
pub const VK_FORMAT_ASTC_8x6_SFLOAT_BLOCK_EXT: c_int = 1000066006;
pub const VK_FORMAT_ASTC_8x8_SFLOAT_BLOCK_EXT: c_int = 1000066007;
pub const VK_FORMAT_ASTC_10x5_SFLOAT_BLOCK_EXT: c_int = 1000066008;
pub const VK_FORMAT_ASTC_10x6_SFLOAT_BLOCK_EXT: c_int = 1000066009;
pub const VK_FORMAT_ASTC_10x8_SFLOAT_BLOCK_EXT: c_int = 1000066010;
pub const VK_FORMAT_ASTC_10x10_SFLOAT_BLOCK_EXT: c_int = 1000066011;
pub const VK_FORMAT_ASTC_12x10_SFLOAT_BLOCK_EXT: c_int = 1000066012;
pub const enum_VkFormat = c_uint;
pub const VkFormat = enum_VkFormat;
pub const VK_IMAGE_TILING_OPTIMAL: c_int = 0;
pub const enum_VkImageTiling = c_uint;
pub const VkImageTiling = enum_VkImageTiling;
pub const VK_IMAGE_TYPE_2D: c_int = 1;
pub const VK_IMAGE_TYPE_3D: c_int = 2;
pub const enum_VkImageType = c_uint;
pub const VkImageType = enum_VkImageType;
pub const VK_PHYSICAL_DEVICE_TYPE_INTEGRATED_GPU: c_int = 1;
pub const VK_PHYSICAL_DEVICE_TYPE_DISCRETE_GPU: c_int = 2;
pub const VK_PHYSICAL_DEVICE_TYPE_VIRTUAL_GPU: c_int = 3;
pub const enum_VkPhysicalDeviceType = c_uint;
pub const VkPhysicalDeviceType = enum_VkPhysicalDeviceType;
pub const VK_SHARING_MODE_EXCLUSIVE: c_int = 0;
pub const enum_VkSharingMode = c_uint;
pub const VkSharingMode = enum_VkSharingMode;
pub const VK_IMAGE_LAYOUT_UNDEFINED: c_int = 0;
pub const VK_IMAGE_LAYOUT_GENERAL: c_int = 1;
pub const VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL: c_int = 2;
pub const VK_IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL: c_int = 3;
pub const VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL: c_int = 5;
pub const VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL: c_int = 6;
pub const VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL: c_int = 7;
pub const VK_IMAGE_LAYOUT_PRESENT_SRC_KHR: c_int = 1000001002;
pub const enum_VkImageLayout = c_uint;
pub const VkImageLayout = enum_VkImageLayout;
pub const VK_COMPONENT_SWIZZLE_IDENTITY: c_int = 0;
pub const VK_COMPONENT_SWIZZLE_ZERO: c_int = 1;
pub const VK_COMPONENT_SWIZZLE_R: c_int = 3;
pub const VK_COMPONENT_SWIZZLE_G: c_int = 4;
pub const VK_COMPONENT_SWIZZLE_B: c_int = 5;
pub const VK_COMPONENT_SWIZZLE_A: c_int = 6;
pub const enum_VkComponentSwizzle = c_uint;
pub const VkComponentSwizzle = enum_VkComponentSwizzle;
pub const VK_IMAGE_VIEW_TYPE_2D: c_int = 1;
pub const VK_IMAGE_VIEW_TYPE_3D: c_int = 2;
pub const VK_IMAGE_VIEW_TYPE_CUBE: c_int = 3;
pub const VK_IMAGE_VIEW_TYPE_2D_ARRAY: c_int = 5;
pub const VK_IMAGE_VIEW_TYPE_CUBE_ARRAY: c_int = 6;
pub const enum_VkImageViewType = c_uint;
pub const VkImageViewType = enum_VkImageViewType;
pub const VK_COMMAND_BUFFER_LEVEL_PRIMARY: c_int = 0;
pub const enum_VkCommandBufferLevel = c_uint;
pub const VkCommandBufferLevel = enum_VkCommandBufferLevel;
pub const VK_INDEX_TYPE_UINT16: c_int = 0;
pub const VK_INDEX_TYPE_UINT32: c_int = 1;
pub const enum_VkIndexType = c_uint;
pub const VkIndexType = enum_VkIndexType;
pub const VK_BORDER_COLOR_FLOAT_TRANSPARENT_BLACK: c_int = 0;
pub const enum_VkBorderColor = c_uint;
pub const VkBorderColor = enum_VkBorderColor;
pub const VK_FILTER_NEAREST: c_int = 0;
pub const VK_FILTER_LINEAR: c_int = 1;
pub const enum_VkFilter = c_uint;
pub const VkFilter = enum_VkFilter;
pub const VK_SAMPLER_ADDRESS_MODE_REPEAT: c_int = 0;
pub const VK_SAMPLER_ADDRESS_MODE_MIRRORED_REPEAT: c_int = 1;
pub const VK_SAMPLER_ADDRESS_MODE_CLAMP_TO_EDGE: c_int = 2;
pub const enum_VkSamplerAddressMode = c_uint;
pub const VkSamplerAddressMode = enum_VkSamplerAddressMode;
pub const VK_COMPARE_OP_NEVER: c_int = 0;
pub const VK_COMPARE_OP_LESS: c_int = 1;
pub const VK_COMPARE_OP_EQUAL: c_int = 2;
pub const VK_COMPARE_OP_LESS_OR_EQUAL: c_int = 3;
pub const VK_COMPARE_OP_GREATER: c_int = 4;
pub const VK_COMPARE_OP_NOT_EQUAL: c_int = 5;
pub const VK_COMPARE_OP_GREATER_OR_EQUAL: c_int = 6;
pub const VK_COMPARE_OP_ALWAYS: c_int = 7;
pub const enum_VkCompareOp = c_uint;
pub const VkCompareOp = enum_VkCompareOp;
pub const VK_SAMPLER_MIPMAP_MODE_NEAREST: c_int = 0;
pub const VK_SAMPLER_MIPMAP_MODE_LINEAR: c_int = 1;
pub const enum_VkSamplerMipmapMode = c_uint;
pub const VkSamplerMipmapMode = enum_VkSamplerMipmapMode;
pub const VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER: c_int = 1;
pub const VK_DESCRIPTOR_TYPE_SAMPLED_IMAGE: c_int = 2;
pub const VK_DESCRIPTOR_TYPE_STORAGE_IMAGE: c_int = 3;
pub const VK_DESCRIPTOR_TYPE_STORAGE_BUFFER: c_int = 7;
pub const VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER_DYNAMIC: c_int = 8;
pub const enum_VkDescriptorType = c_uint;
pub const VkDescriptorType = enum_VkDescriptorType;
pub const VK_PIPELINE_BIND_POINT_GRAPHICS: c_int = 0;
pub const VK_PIPELINE_BIND_POINT_COMPUTE: c_int = 1;
pub const enum_VkPipelineBindPoint = c_uint;
pub const VkPipelineBindPoint = enum_VkPipelineBindPoint;
pub const VK_BLEND_FACTOR_ZERO: c_int = 0;
pub const VK_BLEND_FACTOR_ONE: c_int = 1;
pub const VK_BLEND_FACTOR_SRC_COLOR: c_int = 2;
pub const VK_BLEND_FACTOR_ONE_MINUS_SRC_COLOR: c_int = 3;
pub const VK_BLEND_FACTOR_DST_COLOR: c_int = 4;
pub const VK_BLEND_FACTOR_ONE_MINUS_DST_COLOR: c_int = 5;
pub const VK_BLEND_FACTOR_SRC_ALPHA: c_int = 6;
pub const VK_BLEND_FACTOR_ONE_MINUS_SRC_ALPHA: c_int = 7;
pub const VK_BLEND_FACTOR_DST_ALPHA: c_int = 8;
pub const VK_BLEND_FACTOR_ONE_MINUS_DST_ALPHA: c_int = 9;
pub const VK_BLEND_FACTOR_CONSTANT_COLOR: c_int = 10;
pub const VK_BLEND_FACTOR_ONE_MINUS_CONSTANT_COLOR: c_int = 11;
pub const VK_BLEND_FACTOR_SRC_ALPHA_SATURATE: c_int = 14;
pub const enum_VkBlendFactor = c_uint;
pub const VkBlendFactor = enum_VkBlendFactor;
pub const VK_BLEND_OP_ADD: c_int = 0;
pub const VK_BLEND_OP_SUBTRACT: c_int = 1;
pub const VK_BLEND_OP_REVERSE_SUBTRACT: c_int = 2;
pub const VK_BLEND_OP_MIN: c_int = 3;
pub const VK_BLEND_OP_MAX: c_int = 4;
pub const enum_VkBlendOp = c_uint;
pub const VkBlendOp = enum_VkBlendOp;
pub const VK_DYNAMIC_STATE_VIEWPORT: c_int = 0;
pub const VK_DYNAMIC_STATE_SCISSOR: c_int = 1;
pub const VK_DYNAMIC_STATE_BLEND_CONSTANTS: c_int = 4;
pub const VK_DYNAMIC_STATE_STENCIL_REFERENCE: c_int = 8;
pub const enum_VkDynamicState = c_uint;
pub const VkDynamicState = enum_VkDynamicState;
pub const VK_FRONT_FACE_COUNTER_CLOCKWISE: c_int = 0;
pub const VK_FRONT_FACE_CLOCKWISE: c_int = 1;
pub const enum_VkFrontFace = c_uint;
pub const VkFrontFace = enum_VkFrontFace;
pub const enum_VkLogicOp = c_uint;
pub const VkLogicOp = enum_VkLogicOp;
pub const VK_STENCIL_OP_KEEP: c_int = 0;
pub const VK_STENCIL_OP_ZERO: c_int = 1;
pub const VK_STENCIL_OP_REPLACE: c_int = 2;
pub const VK_STENCIL_OP_INCREMENT_AND_CLAMP: c_int = 3;
pub const VK_STENCIL_OP_DECREMENT_AND_CLAMP: c_int = 4;
pub const VK_STENCIL_OP_INVERT: c_int = 5;
pub const VK_STENCIL_OP_INCREMENT_AND_WRAP: c_int = 6;
pub const VK_STENCIL_OP_DECREMENT_AND_WRAP: c_int = 7;
pub const enum_VkStencilOp = c_uint;
pub const VkStencilOp = enum_VkStencilOp;
pub const VK_VERTEX_INPUT_RATE_VERTEX: c_int = 0;
pub const VK_VERTEX_INPUT_RATE_INSTANCE: c_int = 1;
pub const enum_VkVertexInputRate = c_uint;
pub const VkVertexInputRate = enum_VkVertexInputRate;
pub const VK_PRIMITIVE_TOPOLOGY_POINT_LIST: c_int = 0;
pub const VK_PRIMITIVE_TOPOLOGY_LINE_LIST: c_int = 1;
pub const VK_PRIMITIVE_TOPOLOGY_LINE_STRIP: c_int = 2;
pub const VK_PRIMITIVE_TOPOLOGY_TRIANGLE_LIST: c_int = 3;
pub const VK_PRIMITIVE_TOPOLOGY_TRIANGLE_STRIP: c_int = 4;
pub const enum_VkPrimitiveTopology = c_uint;
pub const VkPrimitiveTopology = enum_VkPrimitiveTopology;
pub const VK_POLYGON_MODE_FILL: c_int = 0;
pub const VK_POLYGON_MODE_LINE: c_int = 1;
pub const enum_VkPolygonMode = c_uint;
pub const VkPolygonMode = enum_VkPolygonMode;
pub const VK_ATTACHMENT_LOAD_OP_LOAD: c_int = 0;
pub const VK_ATTACHMENT_LOAD_OP_CLEAR: c_int = 1;
pub const VK_ATTACHMENT_LOAD_OP_DONT_CARE: c_int = 2;
pub const enum_VkAttachmentLoadOp = c_uint;
pub const VkAttachmentLoadOp = enum_VkAttachmentLoadOp;
pub const VK_ATTACHMENT_STORE_OP_STORE: c_int = 0;
pub const VK_ATTACHMENT_STORE_OP_DONT_CARE: c_int = 1;
pub const enum_VkAttachmentStoreOp = c_uint;
pub const VkAttachmentStoreOp = enum_VkAttachmentStoreOp;
pub const VK_SUBPASS_CONTENTS_INLINE: c_int = 0;
pub const enum_VkSubpassContents = c_uint;
pub const VkSubpassContents = enum_VkSubpassContents;
pub const VkFormatFeatureFlags = VkFlags;
pub const VK_IMAGE_CREATE_CUBE_COMPATIBLE_BIT: c_int = 16;
pub const VK_IMAGE_CREATE_2D_ARRAY_COMPATIBLE_BIT: c_int = 32;
pub const VkImageCreateFlags = VkFlags;
pub const VK_SAMPLE_COUNT_1_BIT: c_int = 1;
pub const VK_SAMPLE_COUNT_2_BIT: c_int = 2;
pub const VK_SAMPLE_COUNT_4_BIT: c_int = 4;
pub const VK_SAMPLE_COUNT_8_BIT: c_int = 8;
pub const enum_VkSampleCountFlagBits = c_uint;
pub const VkSampleCountFlagBits = enum_VkSampleCountFlagBits;
pub const VkSampleCountFlags = VkFlags;
pub const VK_IMAGE_USAGE_TRANSFER_SRC_BIT: c_int = 1;
pub const VK_IMAGE_USAGE_TRANSFER_DST_BIT: c_int = 2;
pub const VK_IMAGE_USAGE_SAMPLED_BIT: c_int = 4;
pub const VK_IMAGE_USAGE_STORAGE_BIT: c_int = 8;
pub const VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT: c_int = 16;
pub const VK_IMAGE_USAGE_DEPTH_STENCIL_ATTACHMENT_BIT: c_int = 32;
pub const VkImageUsageFlags = VkFlags;
pub const VK_INSTANCE_CREATE_ENUMERATE_PORTABILITY_BIT_KHR: c_int = 1;
pub const VkInstanceCreateFlags = VkFlags;
pub const VK_MEMORY_HEAP_DEVICE_LOCAL_BIT: c_int = 1;
pub const VkMemoryHeapFlags = VkFlags;
pub const VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT: c_int = 1;
pub const VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT: c_int = 2;
pub const VK_MEMORY_PROPERTY_HOST_COHERENT_BIT: c_int = 4;
pub const VK_MEMORY_PROPERTY_HOST_CACHED_BIT: c_int = 8;
pub const VkMemoryPropertyFlags = VkFlags;
pub const VK_QUEUE_GRAPHICS_BIT: c_int = 1;
pub const VK_QUEUE_COMPUTE_BIT: c_int = 2;
pub const VK_QUEUE_TRANSFER_BIT: c_int = 4;
pub const VkQueueFlags = VkFlags;
pub const VK_SHADER_STAGE_VERTEX_BIT: c_int = 1;
pub const VK_SHADER_STAGE_FRAGMENT_BIT: c_int = 16;
pub const VK_SHADER_STAGE_COMPUTE_BIT: c_int = 32;
pub const enum_VkShaderStageFlagBits = c_uint;
pub const VkShaderStageFlagBits = enum_VkShaderStageFlagBits;
pub const VkShaderStageFlags = VkFlags;
pub const VkDeviceCreateFlags = VkFlags;
pub const VkDeviceQueueCreateFlags = VkFlags;
pub const VK_PIPELINE_STAGE_TOP_OF_PIPE_BIT: c_int = 1;
pub const VK_PIPELINE_STAGE_DRAW_INDIRECT_BIT: c_int = 2;
pub const VK_PIPELINE_STAGE_VERTEX_INPUT_BIT: c_int = 4;
pub const VK_PIPELINE_STAGE_VERTEX_SHADER_BIT: c_int = 8;
pub const VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT: c_int = 128;
pub const VK_PIPELINE_STAGE_EARLY_FRAGMENT_TESTS_BIT: c_int = 256;
pub const VK_PIPELINE_STAGE_LATE_FRAGMENT_TESTS_BIT: c_int = 512;
pub const VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT: c_int = 1024;
pub const VK_PIPELINE_STAGE_COMPUTE_SHADER_BIT: c_int = 2048;
pub const VK_PIPELINE_STAGE_TRANSFER_BIT: c_int = 4096;
pub const VK_PIPELINE_STAGE_BOTTOM_OF_PIPE_BIT: c_int = 8192;
pub const VkPipelineStageFlags = VkFlags;
pub const VkMemoryMapFlags = VkFlags;
pub const VK_IMAGE_ASPECT_COLOR_BIT: c_int = 1;
pub const VK_IMAGE_ASPECT_DEPTH_BIT: c_int = 2;
pub const VK_IMAGE_ASPECT_STENCIL_BIT: c_int = 4;
pub const VkImageAspectFlags = VkFlags;
pub const VkFenceCreateFlags = VkFlags;
pub const VkSemaphoreCreateFlags = VkFlags;
pub const VkQueryPipelineStatisticFlags = VkFlags;
pub const VkBufferCreateFlags = VkFlags;
pub const VK_BUFFER_USAGE_TRANSFER_SRC_BIT: c_int = 1;
pub const VK_BUFFER_USAGE_TRANSFER_DST_BIT: c_int = 2;
pub const VK_BUFFER_USAGE_UNIFORM_BUFFER_BIT: c_int = 16;
pub const VK_BUFFER_USAGE_STORAGE_BUFFER_BIT: c_int = 32;
pub const VK_BUFFER_USAGE_INDEX_BUFFER_BIT: c_int = 64;
pub const VK_BUFFER_USAGE_VERTEX_BUFFER_BIT: c_int = 128;
pub const VK_BUFFER_USAGE_INDIRECT_BUFFER_BIT: c_int = 256;
pub const VkBufferUsageFlags = VkFlags;
pub const VkImageViewCreateFlags = VkFlags;
pub const VK_ACCESS_INDIRECT_COMMAND_READ_BIT: c_int = 1;
pub const VK_ACCESS_INDEX_READ_BIT: c_int = 2;
pub const VK_ACCESS_VERTEX_ATTRIBUTE_READ_BIT: c_int = 4;
pub const VK_ACCESS_SHADER_READ_BIT: c_int = 32;
pub const VK_ACCESS_SHADER_WRITE_BIT: c_int = 64;
pub const VK_ACCESS_COLOR_ATTACHMENT_READ_BIT: c_int = 128;
pub const VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT: c_int = 256;
pub const VK_ACCESS_DEPTH_STENCIL_ATTACHMENT_READ_BIT: c_int = 512;
pub const VK_ACCESS_DEPTH_STENCIL_ATTACHMENT_WRITE_BIT: c_int = 1024;
pub const VK_ACCESS_TRANSFER_READ_BIT: c_int = 2048;
pub const VK_ACCESS_TRANSFER_WRITE_BIT: c_int = 4096;
pub const VkAccessFlags = VkFlags;
pub const VkDependencyFlags = VkFlags;
pub const VK_COMMAND_POOL_CREATE_RESET_COMMAND_BUFFER_BIT: c_int = 2;
pub const VkCommandPoolCreateFlags = VkFlags;
pub const VkCommandPoolResetFlags = VkFlags;
pub const VkQueryControlFlags = VkFlags;
pub const VK_COMMAND_BUFFER_USAGE_ONE_TIME_SUBMIT_BIT: c_int = 1;
pub const VkCommandBufferUsageFlags = VkFlags;
pub const VK_COMMAND_BUFFER_RESET_RELEASE_RESOURCES_BIT: c_int = 1;
pub const VkCommandBufferResetFlags = VkFlags;
pub const VkShaderModuleCreateFlags = VkFlags;
pub const VkPipelineCacheCreateFlags = VkFlags;
pub const VkPipelineCreateFlags = VkFlags;
pub const VkPipelineLayoutCreateFlags = VkFlags;
pub const VkPipelineShaderStageCreateFlags = VkFlags;
pub const VkSamplerCreateFlags = VkFlags;
pub const VkDescriptorPoolCreateFlags = VkFlags;
pub const VkDescriptorPoolResetFlags = VkFlags;
pub const VkDescriptorSetLayoutCreateFlags = VkFlags;
pub const VkColorComponentFlags = VkFlags;
pub const VK_CULL_MODE_NONE: c_int = 0;
pub const VK_CULL_MODE_FRONT_BIT: c_int = 1;
pub const VK_CULL_MODE_BACK_BIT: c_int = 2;
pub const VK_CULL_MODE_FRONT_AND_BACK: c_int = 3;
pub const VkCullModeFlags = VkFlags;
pub const VkPipelineColorBlendStateCreateFlags = VkFlags;
pub const VkPipelineDepthStencilStateCreateFlags = VkFlags;
pub const VkPipelineDynamicStateCreateFlags = VkFlags;
pub const VkPipelineInputAssemblyStateCreateFlags = VkFlags;
pub const VkPipelineMultisampleStateCreateFlags = VkFlags;
pub const VkPipelineRasterizationStateCreateFlags = VkFlags;
pub const VkPipelineTessellationStateCreateFlags = VkFlags;
pub const VkPipelineVertexInputStateCreateFlags = VkFlags;
pub const VkPipelineViewportStateCreateFlags = VkFlags;
pub const VkAttachmentDescriptionFlags = VkFlags;
pub const VkFramebufferCreateFlags = VkFlags;
pub const VkRenderPassCreateFlags = VkFlags;
pub const VkSubpassDescriptionFlags = VkFlags;
pub const VK_STENCIL_FACE_FRONT_AND_BACK: c_int = 3;
pub const VkStencilFaceFlags = VkFlags;
pub const struct_VkExtent2D = extern struct {
    width: u32 = 0,
    height: u32 = 0,
};
pub const VkExtent2D = struct_VkExtent2D;
pub const struct_VkExtent3D = extern struct {
    width: u32 = 0,
    height: u32 = 0,
    depth: u32 = 0,
};
pub const VkExtent3D = struct_VkExtent3D;
pub const struct_VkOffset2D = extern struct {
    x: i32 = 0,
    y: i32 = 0,
};
pub const VkOffset2D = struct_VkOffset2D;
pub const struct_VkOffset3D = extern struct {
    x: i32 = 0,
    y: i32 = 0,
    z: i32 = 0,
};
pub const VkOffset3D = struct_VkOffset3D;
pub const struct_VkRect2D = extern struct {
    offset: VkOffset2D = @import("std").mem.zeroes(VkOffset2D),
    extent: VkExtent2D = @import("std").mem.zeroes(VkExtent2D),
};
pub const VkRect2D = struct_VkRect2D;
pub const struct_VkBaseOutStructure = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: [*c]struct_VkBaseOutStructure = null,
};
pub const VkBaseOutStructure = struct_VkBaseOutStructure;
pub const PFN_vkAllocationFunction = ?*const fn (pUserData: ?*anyopaque, size: usize, alignment: usize, allocationScope: VkSystemAllocationScope) callconv(.c) ?*anyopaque;
pub const PFN_vkFreeFunction = ?*const fn (pUserData: ?*anyopaque, pMemory: ?*anyopaque) callconv(.c) void;
pub const PFN_vkInternalAllocationNotification = ?*const fn (pUserData: ?*anyopaque, size: usize, allocationType: VkInternalAllocationType, allocationScope: VkSystemAllocationScope) callconv(.c) void;
pub const PFN_vkInternalFreeNotification = ?*const fn (pUserData: ?*anyopaque, size: usize, allocationType: VkInternalAllocationType, allocationScope: VkSystemAllocationScope) callconv(.c) void;
pub const PFN_vkReallocationFunction = ?*const fn (pUserData: ?*anyopaque, pOriginal: ?*anyopaque, size: usize, alignment: usize, allocationScope: VkSystemAllocationScope) callconv(.c) ?*anyopaque;
pub const PFN_vkVoidFunction = ?*const fn () callconv(.c) void;
pub const struct_VkAllocationCallbacks = extern struct {
    pUserData: ?*anyopaque = null,
    pfnAllocation: PFN_vkAllocationFunction = null,
    pfnReallocation: PFN_vkReallocationFunction = null,
    pfnFree: PFN_vkFreeFunction = null,
    pfnInternalAllocation: PFN_vkInternalAllocationNotification = null,
    pfnInternalFree: PFN_vkInternalFreeNotification = null,
};
pub const VkAllocationCallbacks = struct_VkAllocationCallbacks;
pub const struct_VkApplicationInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    pApplicationName: [*c]const u8 = null,
    applicationVersion: u32 = 0,
    pEngineName: [*c]const u8 = null,
    engineVersion: u32 = 0,
    apiVersion: u32 = 0,
};
pub const VkApplicationInfo = struct_VkApplicationInfo;
pub const struct_VkFormatProperties = extern struct {
    linearTilingFeatures: VkFormatFeatureFlags = 0,
    optimalTilingFeatures: VkFormatFeatureFlags = 0,
    bufferFeatures: VkFormatFeatureFlags = 0,
};
pub const VkFormatProperties = struct_VkFormatProperties;
pub const struct_VkImageFormatProperties = extern struct {
    maxExtent: VkExtent3D = @import("std").mem.zeroes(VkExtent3D),
    maxMipLevels: u32 = 0,
    maxArrayLayers: u32 = 0,
    sampleCounts: VkSampleCountFlags = 0,
    maxResourceSize: VkDeviceSize = 0,
};
pub const VkImageFormatProperties = struct_VkImageFormatProperties;
pub const struct_VkInstanceCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkInstanceCreateFlags = 0,
    pApplicationInfo: [*c]const VkApplicationInfo = null,
    enabledLayerCount: u32 = 0,
    ppEnabledLayerNames: [*c]const [*c]const u8 = null,
    enabledExtensionCount: u32 = 0,
    ppEnabledExtensionNames: [*c]const [*c]const u8 = null,
};
pub const VkInstanceCreateInfo = struct_VkInstanceCreateInfo;
pub const struct_VkMemoryHeap = extern struct {
    size: VkDeviceSize = 0,
    flags: VkMemoryHeapFlags = 0,
};
pub const VkMemoryHeap = struct_VkMemoryHeap;
pub const struct_VkMemoryType = extern struct {
    propertyFlags: VkMemoryPropertyFlags = 0,
    heapIndex: u32 = 0,
};
pub const VkMemoryType = struct_VkMemoryType;
pub const struct_VkPhysicalDeviceFeatures = extern struct {
    robustBufferAccess: VkBool32 = 0,
    fullDrawIndexUint32: VkBool32 = 0,
    imageCubeArray: VkBool32 = 0,
    independentBlend: VkBool32 = 0,
    geometryShader: VkBool32 = 0,
    tessellationShader: VkBool32 = 0,
    sampleRateShading: VkBool32 = 0,
    dualSrcBlend: VkBool32 = 0,
    logicOp: VkBool32 = 0,
    multiDrawIndirect: VkBool32 = 0,
    drawIndirectFirstInstance: VkBool32 = 0,
    depthClamp: VkBool32 = 0,
    depthBiasClamp: VkBool32 = 0,
    fillModeNonSolid: VkBool32 = 0,
    depthBounds: VkBool32 = 0,
    wideLines: VkBool32 = 0,
    largePoints: VkBool32 = 0,
    alphaToOne: VkBool32 = 0,
    multiViewport: VkBool32 = 0,
    samplerAnisotropy: VkBool32 = 0,
    textureCompressionETC2: VkBool32 = 0,
    textureCompressionASTC_LDR: VkBool32 = 0,
    textureCompressionBC: VkBool32 = 0,
    occlusionQueryPrecise: VkBool32 = 0,
    pipelineStatisticsQuery: VkBool32 = 0,
    vertexPipelineStoresAndAtomics: VkBool32 = 0,
    fragmentStoresAndAtomics: VkBool32 = 0,
    shaderTessellationAndGeometryPointSize: VkBool32 = 0,
    shaderImageGatherExtended: VkBool32 = 0,
    shaderStorageImageExtendedFormats: VkBool32 = 0,
    shaderStorageImageMultisample: VkBool32 = 0,
    shaderStorageImageReadWithoutFormat: VkBool32 = 0,
    shaderStorageImageWriteWithoutFormat: VkBool32 = 0,
    shaderUniformBufferArrayDynamicIndexing: VkBool32 = 0,
    shaderSampledImageArrayDynamicIndexing: VkBool32 = 0,
    shaderStorageBufferArrayDynamicIndexing: VkBool32 = 0,
    shaderStorageImageArrayDynamicIndexing: VkBool32 = 0,
    shaderClipDistance: VkBool32 = 0,
    shaderCullDistance: VkBool32 = 0,
    shaderFloat64: VkBool32 = 0,
    shaderInt64: VkBool32 = 0,
    shaderInt16: VkBool32 = 0,
    shaderResourceResidency: VkBool32 = 0,
    shaderResourceMinLod: VkBool32 = 0,
    sparseBinding: VkBool32 = 0,
    sparseResidencyBuffer: VkBool32 = 0,
    sparseResidencyImage2D: VkBool32 = 0,
    sparseResidencyImage3D: VkBool32 = 0,
    sparseResidency2Samples: VkBool32 = 0,
    sparseResidency4Samples: VkBool32 = 0,
    sparseResidency8Samples: VkBool32 = 0,
    sparseResidency16Samples: VkBool32 = 0,
    sparseResidencyAliased: VkBool32 = 0,
    variableMultisampleRate: VkBool32 = 0,
    inheritedQueries: VkBool32 = 0,
};
pub const VkPhysicalDeviceFeatures = struct_VkPhysicalDeviceFeatures;
pub const struct_VkPhysicalDeviceLimits = extern struct {
    maxImageDimension1D: u32 = 0,
    maxImageDimension2D: u32 = 0,
    maxImageDimension3D: u32 = 0,
    maxImageDimensionCube: u32 = 0,
    maxImageArrayLayers: u32 = 0,
    maxTexelBufferElements: u32 = 0,
    maxUniformBufferRange: u32 = 0,
    maxStorageBufferRange: u32 = 0,
    maxPushConstantsSize: u32 = 0,
    maxMemoryAllocationCount: u32 = 0,
    maxSamplerAllocationCount: u32 = 0,
    bufferImageGranularity: VkDeviceSize = 0,
    sparseAddressSpaceSize: VkDeviceSize = 0,
    maxBoundDescriptorSets: u32 = 0,
    maxPerStageDescriptorSamplers: u32 = 0,
    maxPerStageDescriptorUniformBuffers: u32 = 0,
    maxPerStageDescriptorStorageBuffers: u32 = 0,
    maxPerStageDescriptorSampledImages: u32 = 0,
    maxPerStageDescriptorStorageImages: u32 = 0,
    maxPerStageDescriptorInputAttachments: u32 = 0,
    maxPerStageResources: u32 = 0,
    maxDescriptorSetSamplers: u32 = 0,
    maxDescriptorSetUniformBuffers: u32 = 0,
    maxDescriptorSetUniformBuffersDynamic: u32 = 0,
    maxDescriptorSetStorageBuffers: u32 = 0,
    maxDescriptorSetStorageBuffersDynamic: u32 = 0,
    maxDescriptorSetSampledImages: u32 = 0,
    maxDescriptorSetStorageImages: u32 = 0,
    maxDescriptorSetInputAttachments: u32 = 0,
    maxVertexInputAttributes: u32 = 0,
    maxVertexInputBindings: u32 = 0,
    maxVertexInputAttributeOffset: u32 = 0,
    maxVertexInputBindingStride: u32 = 0,
    maxVertexOutputComponents: u32 = 0,
    maxTessellationGenerationLevel: u32 = 0,
    maxTessellationPatchSize: u32 = 0,
    maxTessellationControlPerVertexInputComponents: u32 = 0,
    maxTessellationControlPerVertexOutputComponents: u32 = 0,
    maxTessellationControlPerPatchOutputComponents: u32 = 0,
    maxTessellationControlTotalOutputComponents: u32 = 0,
    maxTessellationEvaluationInputComponents: u32 = 0,
    maxTessellationEvaluationOutputComponents: u32 = 0,
    maxGeometryShaderInvocations: u32 = 0,
    maxGeometryInputComponents: u32 = 0,
    maxGeometryOutputComponents: u32 = 0,
    maxGeometryOutputVertices: u32 = 0,
    maxGeometryTotalOutputComponents: u32 = 0,
    maxFragmentInputComponents: u32 = 0,
    maxFragmentOutputAttachments: u32 = 0,
    maxFragmentDualSrcAttachments: u32 = 0,
    maxFragmentCombinedOutputResources: u32 = 0,
    maxComputeSharedMemorySize: u32 = 0,
    maxComputeWorkGroupCount: [3]u32 = @import("std").mem.zeroes([3]u32),
    maxComputeWorkGroupInvocations: u32 = 0,
    maxComputeWorkGroupSize: [3]u32 = @import("std").mem.zeroes([3]u32),
    subPixelPrecisionBits: u32 = 0,
    subTexelPrecisionBits: u32 = 0,
    mipmapPrecisionBits: u32 = 0,
    maxDrawIndexedIndexValue: u32 = 0,
    maxDrawIndirectCount: u32 = 0,
    maxSamplerLodBias: f32 = 0,
    maxSamplerAnisotropy: f32 = 0,
    maxViewports: u32 = 0,
    maxViewportDimensions: [2]u32 = @import("std").mem.zeroes([2]u32),
    viewportBoundsRange: [2]f32 = @import("std").mem.zeroes([2]f32),
    viewportSubPixelBits: u32 = 0,
    minMemoryMapAlignment: usize = 0,
    minTexelBufferOffsetAlignment: VkDeviceSize = 0,
    minUniformBufferOffsetAlignment: VkDeviceSize = 0,
    minStorageBufferOffsetAlignment: VkDeviceSize = 0,
    minTexelOffset: i32 = 0,
    maxTexelOffset: u32 = 0,
    minTexelGatherOffset: i32 = 0,
    maxTexelGatherOffset: u32 = 0,
    minInterpolationOffset: f32 = 0,
    maxInterpolationOffset: f32 = 0,
    subPixelInterpolationOffsetBits: u32 = 0,
    maxFramebufferWidth: u32 = 0,
    maxFramebufferHeight: u32 = 0,
    maxFramebufferLayers: u32 = 0,
    framebufferColorSampleCounts: VkSampleCountFlags = 0,
    framebufferDepthSampleCounts: VkSampleCountFlags = 0,
    framebufferStencilSampleCounts: VkSampleCountFlags = 0,
    framebufferNoAttachmentsSampleCounts: VkSampleCountFlags = 0,
    maxColorAttachments: u32 = 0,
    sampledImageColorSampleCounts: VkSampleCountFlags = 0,
    sampledImageIntegerSampleCounts: VkSampleCountFlags = 0,
    sampledImageDepthSampleCounts: VkSampleCountFlags = 0,
    sampledImageStencilSampleCounts: VkSampleCountFlags = 0,
    storageImageSampleCounts: VkSampleCountFlags = 0,
    maxSampleMaskWords: u32 = 0,
    timestampComputeAndGraphics: VkBool32 = 0,
    timestampPeriod: f32 = 0,
    maxClipDistances: u32 = 0,
    maxCullDistances: u32 = 0,
    maxCombinedClipAndCullDistances: u32 = 0,
    discreteQueuePriorities: u32 = 0,
    pointSizeRange: [2]f32 = @import("std").mem.zeroes([2]f32),
    lineWidthRange: [2]f32 = @import("std").mem.zeroes([2]f32),
    pointSizeGranularity: f32 = 0,
    lineWidthGranularity: f32 = 0,
    strictLines: VkBool32 = 0,
    standardSampleLocations: VkBool32 = 0,
    optimalBufferCopyOffsetAlignment: VkDeviceSize = 0,
    optimalBufferCopyRowPitchAlignment: VkDeviceSize = 0,
    nonCoherentAtomSize: VkDeviceSize = 0,
};
pub const VkPhysicalDeviceLimits = struct_VkPhysicalDeviceLimits;
pub const struct_VkPhysicalDeviceMemoryProperties = extern struct {
    memoryTypeCount: u32 = 0,
    memoryTypes: [32]VkMemoryType = @import("std").mem.zeroes([32]VkMemoryType),
    memoryHeapCount: u32 = 0,
    memoryHeaps: [16]VkMemoryHeap = @import("std").mem.zeroes([16]VkMemoryHeap),
};
pub const VkPhysicalDeviceMemoryProperties = struct_VkPhysicalDeviceMemoryProperties;
pub const struct_VkPhysicalDeviceSparseProperties = extern struct {
    residencyStandard2DBlockShape: VkBool32 = 0,
    residencyStandard2DMultisampleBlockShape: VkBool32 = 0,
    residencyStandard3DBlockShape: VkBool32 = 0,
    residencyAlignedMipSize: VkBool32 = 0,
    residencyNonResidentStrict: VkBool32 = 0,
};
pub const VkPhysicalDeviceSparseProperties = struct_VkPhysicalDeviceSparseProperties;
pub const struct_VkPhysicalDeviceProperties = extern struct {
    apiVersion: u32 = 0,
    driverVersion: u32 = 0,
    vendorID: u32 = 0,
    deviceID: u32 = 0,
    deviceType: VkPhysicalDeviceType = @import("std").mem.zeroes(VkPhysicalDeviceType),
    deviceName: [256]u8 = @import("std").mem.zeroes([256]u8),
    pipelineCacheUUID: [16]u8 = @import("std").mem.zeroes([16]u8),
    limits: VkPhysicalDeviceLimits = @import("std").mem.zeroes(VkPhysicalDeviceLimits),
    sparseProperties: VkPhysicalDeviceSparseProperties = @import("std").mem.zeroes(VkPhysicalDeviceSparseProperties),
};
pub const VkPhysicalDeviceProperties = struct_VkPhysicalDeviceProperties;
pub const struct_VkQueueFamilyProperties = extern struct {
    queueFlags: VkQueueFlags = 0,
    queueCount: u32 = 0,
    timestampValidBits: u32 = 0,
    minImageTransferGranularity: VkExtent3D = @import("std").mem.zeroes(VkExtent3D),
};
pub const VkQueueFamilyProperties = struct_VkQueueFamilyProperties;
pub const struct_VkDeviceQueueCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkDeviceQueueCreateFlags = 0,
    queueFamilyIndex: u32 = 0,
    queueCount: u32 = 0,
    pQueuePriorities: [*c]const f32 = null,
};
pub const VkDeviceQueueCreateInfo = struct_VkDeviceQueueCreateInfo;
pub const struct_VkDeviceCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkDeviceCreateFlags = 0,
    queueCreateInfoCount: u32 = 0,
    pQueueCreateInfos: [*c]const VkDeviceQueueCreateInfo = null,
    enabledLayerCount: u32 = 0,
    ppEnabledLayerNames: [*c]const [*c]const u8 = null,
    enabledExtensionCount: u32 = 0,
    ppEnabledExtensionNames: [*c]const [*c]const u8 = null,
    pEnabledFeatures: [*c]const VkPhysicalDeviceFeatures = null,
};
pub const VkDeviceCreateInfo = struct_VkDeviceCreateInfo;
pub const struct_VkExtensionProperties = extern struct {
    extensionName: [256]u8 = @import("std").mem.zeroes([256]u8),
    specVersion: u32 = 0,
};
pub const VkExtensionProperties = struct_VkExtensionProperties;
pub const struct_VkLayerProperties = extern struct {
    layerName: [256]u8 = @import("std").mem.zeroes([256]u8),
    specVersion: u32 = 0,
    implementationVersion: u32 = 0,
    description: [256]u8 = @import("std").mem.zeroes([256]u8),
};
pub const VkLayerProperties = struct_VkLayerProperties;
pub const struct_VkSubmitInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    waitSemaphoreCount: u32 = 0,
    pWaitSemaphores: [*c]const VkSemaphore = null,
    pWaitDstStageMask: [*c]const VkPipelineStageFlags = null,
    commandBufferCount: u32 = 0,
    pCommandBuffers: [*c]const VkCommandBuffer = null,
    signalSemaphoreCount: u32 = 0,
    pSignalSemaphores: [*c]const VkSemaphore = null,
};
pub const VkSubmitInfo = struct_VkSubmitInfo;
pub const struct_VkMemoryAllocateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    allocationSize: VkDeviceSize = 0,
    memoryTypeIndex: u32 = 0,
};
pub const VkMemoryAllocateInfo = struct_VkMemoryAllocateInfo;
pub const struct_VkMemoryRequirements = extern struct {
    size: VkDeviceSize = 0,
    alignment: VkDeviceSize = 0,
    memoryTypeBits: u32 = 0,
};
pub const VkMemoryRequirements = struct_VkMemoryRequirements;
pub const struct_VkFenceCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkFenceCreateFlags = 0,
};
pub const VkFenceCreateInfo = struct_VkFenceCreateInfo;
pub const struct_VkSemaphoreCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkSemaphoreCreateFlags = 0,
};
pub const VkSemaphoreCreateInfo = struct_VkSemaphoreCreateInfo;
pub const struct_VkBufferCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkBufferCreateFlags = 0,
    size: VkDeviceSize = 0,
    usage: VkBufferUsageFlags = 0,
    sharingMode: VkSharingMode = @import("std").mem.zeroes(VkSharingMode),
    queueFamilyIndexCount: u32 = 0,
    pQueueFamilyIndices: [*c]const u32 = null,
};
pub const VkBufferCreateInfo = struct_VkBufferCreateInfo;
pub const struct_VkImageCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkImageCreateFlags = 0,
    imageType: VkImageType = @import("std").mem.zeroes(VkImageType),
    format: VkFormat = @import("std").mem.zeroes(VkFormat),
    extent: VkExtent3D = @import("std").mem.zeroes(VkExtent3D),
    mipLevels: u32 = 0,
    arrayLayers: u32 = 0,
    samples: VkSampleCountFlagBits = @import("std").mem.zeroes(VkSampleCountFlagBits),
    tiling: VkImageTiling = @import("std").mem.zeroes(VkImageTiling),
    usage: VkImageUsageFlags = 0,
    sharingMode: VkSharingMode = @import("std").mem.zeroes(VkSharingMode),
    queueFamilyIndexCount: u32 = 0,
    pQueueFamilyIndices: [*c]const u32 = null,
    initialLayout: VkImageLayout = @import("std").mem.zeroes(VkImageLayout),
};
pub const VkImageCreateInfo = struct_VkImageCreateInfo;
pub const struct_VkComponentMapping = extern struct {
    r: VkComponentSwizzle = @import("std").mem.zeroes(VkComponentSwizzle),
    g: VkComponentSwizzle = @import("std").mem.zeroes(VkComponentSwizzle),
    b: VkComponentSwizzle = @import("std").mem.zeroes(VkComponentSwizzle),
    a: VkComponentSwizzle = @import("std").mem.zeroes(VkComponentSwizzle),
};
pub const VkComponentMapping = struct_VkComponentMapping;
pub const struct_VkImageSubresourceRange = extern struct {
    aspectMask: VkImageAspectFlags = 0,
    baseMipLevel: u32 = 0,
    levelCount: u32 = 0,
    baseArrayLayer: u32 = 0,
    layerCount: u32 = 0,
};
pub const VkImageSubresourceRange = struct_VkImageSubresourceRange;
pub const struct_VkImageViewCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkImageViewCreateFlags = 0,
    image: VkImage = null,
    viewType: VkImageViewType = @import("std").mem.zeroes(VkImageViewType),
    format: VkFormat = @import("std").mem.zeroes(VkFormat),
    components: VkComponentMapping = @import("std").mem.zeroes(VkComponentMapping),
    subresourceRange: VkImageSubresourceRange = @import("std").mem.zeroes(VkImageSubresourceRange),
};
pub const VkImageViewCreateInfo = struct_VkImageViewCreateInfo;
pub const struct_VkCommandPoolCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkCommandPoolCreateFlags = 0,
    queueFamilyIndex: u32 = 0,
};
pub const VkCommandPoolCreateInfo = struct_VkCommandPoolCreateInfo;
pub const struct_VkCommandBufferAllocateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    commandPool: VkCommandPool = null,
    level: VkCommandBufferLevel = @import("std").mem.zeroes(VkCommandBufferLevel),
    commandBufferCount: u32 = 0,
};
pub const VkCommandBufferAllocateInfo = struct_VkCommandBufferAllocateInfo;
pub const struct_VkCommandBufferInheritanceInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    renderPass: VkRenderPass = null,
    subpass: u32 = 0,
    framebuffer: VkFramebuffer = null,
    occlusionQueryEnable: VkBool32 = 0,
    queryFlags: VkQueryControlFlags = 0,
    pipelineStatistics: VkQueryPipelineStatisticFlags = 0,
};
pub const VkCommandBufferInheritanceInfo = struct_VkCommandBufferInheritanceInfo;
pub const struct_VkCommandBufferBeginInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkCommandBufferUsageFlags = 0,
    pInheritanceInfo: [*c]const VkCommandBufferInheritanceInfo = null,
};
pub const VkCommandBufferBeginInfo = struct_VkCommandBufferBeginInfo;
pub const struct_VkBufferCopy = extern struct {
    srcOffset: VkDeviceSize = 0,
    dstOffset: VkDeviceSize = 0,
    size: VkDeviceSize = 0,
};
pub const VkBufferCopy = struct_VkBufferCopy;
pub const struct_VkImageSubresourceLayers = extern struct {
    aspectMask: VkImageAspectFlags = 0,
    mipLevel: u32 = 0,
    baseArrayLayer: u32 = 0,
    layerCount: u32 = 0,
};
pub const VkImageSubresourceLayers = struct_VkImageSubresourceLayers;
pub const struct_VkBufferImageCopy = extern struct {
    bufferOffset: VkDeviceSize = 0,
    bufferRowLength: u32 = 0,
    bufferImageHeight: u32 = 0,
    imageSubresource: VkImageSubresourceLayers = @import("std").mem.zeroes(VkImageSubresourceLayers),
    imageOffset: VkOffset3D = @import("std").mem.zeroes(VkOffset3D),
    imageExtent: VkExtent3D = @import("std").mem.zeroes(VkExtent3D),
};
pub const VkBufferImageCopy = struct_VkBufferImageCopy;
pub const struct_VkImageCopy = extern struct {
    srcSubresource: VkImageSubresourceLayers = @import("std").mem.zeroes(VkImageSubresourceLayers),
    srcOffset: VkOffset3D = @import("std").mem.zeroes(VkOffset3D),
    dstSubresource: VkImageSubresourceLayers = @import("std").mem.zeroes(VkImageSubresourceLayers),
    dstOffset: VkOffset3D = @import("std").mem.zeroes(VkOffset3D),
    extent: VkExtent3D = @import("std").mem.zeroes(VkExtent3D),
};
pub const VkImageCopy = struct_VkImageCopy;
pub const struct_VkBufferMemoryBarrier = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    srcAccessMask: VkAccessFlags = 0,
    dstAccessMask: VkAccessFlags = 0,
    srcQueueFamilyIndex: u32 = 0,
    dstQueueFamilyIndex: u32 = 0,
    buffer: VkBuffer = null,
    offset: VkDeviceSize = 0,
    size: VkDeviceSize = 0,
};
pub const VkBufferMemoryBarrier = struct_VkBufferMemoryBarrier;
pub const struct_VkImageMemoryBarrier = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    srcAccessMask: VkAccessFlags = 0,
    dstAccessMask: VkAccessFlags = 0,
    oldLayout: VkImageLayout = @import("std").mem.zeroes(VkImageLayout),
    newLayout: VkImageLayout = @import("std").mem.zeroes(VkImageLayout),
    srcQueueFamilyIndex: u32 = 0,
    dstQueueFamilyIndex: u32 = 0,
    image: VkImage = null,
    subresourceRange: VkImageSubresourceRange = @import("std").mem.zeroes(VkImageSubresourceRange),
};
pub const VkImageMemoryBarrier = struct_VkImageMemoryBarrier;
pub const struct_VkMemoryBarrier = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    srcAccessMask: VkAccessFlags = 0,
    dstAccessMask: VkAccessFlags = 0,
};
pub const VkMemoryBarrier = struct_VkMemoryBarrier;
pub const struct_VkShaderModuleCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkShaderModuleCreateFlags = 0,
    codeSize: usize = 0,
    pCode: [*c]const u32 = null,
};
pub const VkShaderModuleCreateInfo = struct_VkShaderModuleCreateInfo;
pub const struct_VkPipelineCacheCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkPipelineCacheCreateFlags = 0,
    initialDataSize: usize = 0,
    pInitialData: ?*const anyopaque = null,
};
pub const VkPipelineCacheCreateInfo = struct_VkPipelineCacheCreateInfo;
pub const struct_VkSpecializationMapEntry = extern struct {
    constantID: u32 = 0,
    offset: u32 = 0,
    size: usize = 0,
};
pub const VkSpecializationMapEntry = struct_VkSpecializationMapEntry;
pub const struct_VkSpecializationInfo = extern struct {
    mapEntryCount: u32 = 0,
    pMapEntries: [*c]const VkSpecializationMapEntry = null,
    dataSize: usize = 0,
    pData: ?*const anyopaque = null,
};
pub const VkSpecializationInfo = struct_VkSpecializationInfo;
pub const struct_VkPipelineShaderStageCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkPipelineShaderStageCreateFlags = 0,
    stage: VkShaderStageFlagBits = @import("std").mem.zeroes(VkShaderStageFlagBits),
    module: VkShaderModule = null,
    pName: [*c]const u8 = null,
    pSpecializationInfo: [*c]const VkSpecializationInfo = null,
};
pub const VkPipelineShaderStageCreateInfo = struct_VkPipelineShaderStageCreateInfo;
pub const struct_VkComputePipelineCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkPipelineCreateFlags = 0,
    stage: VkPipelineShaderStageCreateInfo = @import("std").mem.zeroes(VkPipelineShaderStageCreateInfo),
    layout: VkPipelineLayout = null,
    basePipelineHandle: VkPipeline = null,
    basePipelineIndex: i32 = 0,
};
pub const VkComputePipelineCreateInfo = struct_VkComputePipelineCreateInfo;
pub const struct_VkPushConstantRange = extern struct {
    stageFlags: VkShaderStageFlags = 0,
    offset: u32 = 0,
    size: u32 = 0,
};
pub const VkPushConstantRange = struct_VkPushConstantRange;
pub const struct_VkPipelineLayoutCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkPipelineLayoutCreateFlags = 0,
    setLayoutCount: u32 = 0,
    pSetLayouts: [*c]const VkDescriptorSetLayout = null,
    pushConstantRangeCount: u32 = 0,
    pPushConstantRanges: [*c]const VkPushConstantRange = null,
};
pub const VkPipelineLayoutCreateInfo = struct_VkPipelineLayoutCreateInfo;
pub const struct_VkSamplerCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkSamplerCreateFlags = 0,
    magFilter: VkFilter = @import("std").mem.zeroes(VkFilter),
    minFilter: VkFilter = @import("std").mem.zeroes(VkFilter),
    mipmapMode: VkSamplerMipmapMode = @import("std").mem.zeroes(VkSamplerMipmapMode),
    addressModeU: VkSamplerAddressMode = @import("std").mem.zeroes(VkSamplerAddressMode),
    addressModeV: VkSamplerAddressMode = @import("std").mem.zeroes(VkSamplerAddressMode),
    addressModeW: VkSamplerAddressMode = @import("std").mem.zeroes(VkSamplerAddressMode),
    mipLodBias: f32 = 0,
    anisotropyEnable: VkBool32 = 0,
    maxAnisotropy: f32 = 0,
    compareEnable: VkBool32 = 0,
    compareOp: VkCompareOp = @import("std").mem.zeroes(VkCompareOp),
    minLod: f32 = 0,
    maxLod: f32 = 0,
    borderColor: VkBorderColor = @import("std").mem.zeroes(VkBorderColor),
    unnormalizedCoordinates: VkBool32 = 0,
};
pub const VkSamplerCreateInfo = struct_VkSamplerCreateInfo;
pub const struct_VkCopyDescriptorSet = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    srcSet: VkDescriptorSet = null,
    srcBinding: u32 = 0,
    srcArrayElement: u32 = 0,
    dstSet: VkDescriptorSet = null,
    dstBinding: u32 = 0,
    dstArrayElement: u32 = 0,
    descriptorCount: u32 = 0,
};
pub const VkCopyDescriptorSet = struct_VkCopyDescriptorSet;
pub const struct_VkDescriptorBufferInfo = extern struct {
    buffer: VkBuffer = null,
    offset: VkDeviceSize = 0,
    range: VkDeviceSize = 0,
};
pub const VkDescriptorBufferInfo = struct_VkDescriptorBufferInfo;
pub const struct_VkDescriptorImageInfo = extern struct {
    sampler: VkSampler = null,
    imageView: VkImageView = null,
    imageLayout: VkImageLayout = @import("std").mem.zeroes(VkImageLayout),
};
pub const VkDescriptorImageInfo = struct_VkDescriptorImageInfo;
pub const struct_VkDescriptorPoolSize = extern struct {
    type: VkDescriptorType = @import("std").mem.zeroes(VkDescriptorType),
    descriptorCount: u32 = 0,
};
pub const VkDescriptorPoolSize = struct_VkDescriptorPoolSize;
pub const struct_VkDescriptorPoolCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkDescriptorPoolCreateFlags = 0,
    maxSets: u32 = 0,
    poolSizeCount: u32 = 0,
    pPoolSizes: [*c]const VkDescriptorPoolSize = null,
};
pub const VkDescriptorPoolCreateInfo = struct_VkDescriptorPoolCreateInfo;
pub const struct_VkDescriptorSetAllocateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    descriptorPool: VkDescriptorPool = null,
    descriptorSetCount: u32 = 0,
    pSetLayouts: [*c]const VkDescriptorSetLayout = null,
};
pub const VkDescriptorSetAllocateInfo = struct_VkDescriptorSetAllocateInfo;
pub const struct_VkDescriptorSetLayoutBinding = extern struct {
    binding: u32 = 0,
    descriptorType: VkDescriptorType = @import("std").mem.zeroes(VkDescriptorType),
    descriptorCount: u32 = 0,
    stageFlags: VkShaderStageFlags = 0,
    pImmutableSamplers: [*c]const VkSampler = null,
};
pub const VkDescriptorSetLayoutBinding = struct_VkDescriptorSetLayoutBinding;
pub const struct_VkDescriptorSetLayoutCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkDescriptorSetLayoutCreateFlags = 0,
    bindingCount: u32 = 0,
    pBindings: [*c]const VkDescriptorSetLayoutBinding = null,
};
pub const VkDescriptorSetLayoutCreateInfo = struct_VkDescriptorSetLayoutCreateInfo;
pub const struct_VkWriteDescriptorSet = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    dstSet: VkDescriptorSet = null,
    dstBinding: u32 = 0,
    dstArrayElement: u32 = 0,
    descriptorCount: u32 = 0,
    descriptorType: VkDescriptorType = @import("std").mem.zeroes(VkDescriptorType),
    pImageInfo: [*c]const VkDescriptorImageInfo = null,
    pBufferInfo: [*c]const VkDescriptorBufferInfo = null,
    pTexelBufferView: [*c]const VkBufferView = null,
};
pub const VkWriteDescriptorSet = struct_VkWriteDescriptorSet;
pub const union_VkClearColorValue = extern union {
    float32: [4]f32,
    int32: [4]i32,
    uint32: [4]u32,
};
pub const VkClearColorValue = union_VkClearColorValue;
pub const struct_VkStencilOpState = extern struct {
    failOp: VkStencilOp = @import("std").mem.zeroes(VkStencilOp),
    passOp: VkStencilOp = @import("std").mem.zeroes(VkStencilOp),
    depthFailOp: VkStencilOp = @import("std").mem.zeroes(VkStencilOp),
    compareOp: VkCompareOp = @import("std").mem.zeroes(VkCompareOp),
    compareMask: u32 = 0,
    writeMask: u32 = 0,
    reference: u32 = 0,
};
pub const VkStencilOpState = struct_VkStencilOpState;
pub const struct_VkVertexInputAttributeDescription = extern struct {
    location: u32 = 0,
    binding: u32 = 0,
    format: VkFormat = @import("std").mem.zeroes(VkFormat),
    offset: u32 = 0,
};
pub const VkVertexInputAttributeDescription = struct_VkVertexInputAttributeDescription;
pub const struct_VkVertexInputBindingDescription = extern struct {
    binding: u32 = 0,
    stride: u32 = 0,
    inputRate: VkVertexInputRate = @import("std").mem.zeroes(VkVertexInputRate),
};
pub const VkVertexInputBindingDescription = struct_VkVertexInputBindingDescription;
pub const struct_VkViewport = extern struct {
    x: f32 = 0,
    y: f32 = 0,
    width: f32 = 0,
    height: f32 = 0,
    minDepth: f32 = 0,
    maxDepth: f32 = 0,
};
pub const VkViewport = struct_VkViewport;
pub const struct_VkPipelineColorBlendAttachmentState = extern struct {
    blendEnable: VkBool32 = 0,
    srcColorBlendFactor: VkBlendFactor = @import("std").mem.zeroes(VkBlendFactor),
    dstColorBlendFactor: VkBlendFactor = @import("std").mem.zeroes(VkBlendFactor),
    colorBlendOp: VkBlendOp = @import("std").mem.zeroes(VkBlendOp),
    srcAlphaBlendFactor: VkBlendFactor = @import("std").mem.zeroes(VkBlendFactor),
    dstAlphaBlendFactor: VkBlendFactor = @import("std").mem.zeroes(VkBlendFactor),
    alphaBlendOp: VkBlendOp = @import("std").mem.zeroes(VkBlendOp),
    colorWriteMask: VkColorComponentFlags = 0,
};
pub const VkPipelineColorBlendAttachmentState = struct_VkPipelineColorBlendAttachmentState;
pub const struct_VkPipelineColorBlendStateCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkPipelineColorBlendStateCreateFlags = 0,
    logicOpEnable: VkBool32 = 0,
    logicOp: VkLogicOp = @import("std").mem.zeroes(VkLogicOp),
    attachmentCount: u32 = 0,
    pAttachments: [*c]const VkPipelineColorBlendAttachmentState = null,
    blendConstants: [4]f32 = @import("std").mem.zeroes([4]f32),
};
pub const VkPipelineColorBlendStateCreateInfo = struct_VkPipelineColorBlendStateCreateInfo;
pub const struct_VkPipelineDepthStencilStateCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkPipelineDepthStencilStateCreateFlags = 0,
    depthTestEnable: VkBool32 = 0,
    depthWriteEnable: VkBool32 = 0,
    depthCompareOp: VkCompareOp = @import("std").mem.zeroes(VkCompareOp),
    depthBoundsTestEnable: VkBool32 = 0,
    stencilTestEnable: VkBool32 = 0,
    front: VkStencilOpState = @import("std").mem.zeroes(VkStencilOpState),
    back: VkStencilOpState = @import("std").mem.zeroes(VkStencilOpState),
    minDepthBounds: f32 = 0,
    maxDepthBounds: f32 = 0,
};
pub const VkPipelineDepthStencilStateCreateInfo = struct_VkPipelineDepthStencilStateCreateInfo;
pub const struct_VkPipelineDynamicStateCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkPipelineDynamicStateCreateFlags = 0,
    dynamicStateCount: u32 = 0,
    pDynamicStates: [*c]const VkDynamicState = null,
};
pub const VkPipelineDynamicStateCreateInfo = struct_VkPipelineDynamicStateCreateInfo;
pub const struct_VkPipelineInputAssemblyStateCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkPipelineInputAssemblyStateCreateFlags = 0,
    topology: VkPrimitiveTopology = @import("std").mem.zeroes(VkPrimitiveTopology),
    primitiveRestartEnable: VkBool32 = 0,
};
pub const VkPipelineInputAssemblyStateCreateInfo = struct_VkPipelineInputAssemblyStateCreateInfo;
pub const struct_VkPipelineMultisampleStateCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkPipelineMultisampleStateCreateFlags = 0,
    rasterizationSamples: VkSampleCountFlagBits = @import("std").mem.zeroes(VkSampleCountFlagBits),
    sampleShadingEnable: VkBool32 = 0,
    minSampleShading: f32 = 0,
    pSampleMask: [*c]const VkSampleMask = null,
    alphaToCoverageEnable: VkBool32 = 0,
    alphaToOneEnable: VkBool32 = 0,
};
pub const VkPipelineMultisampleStateCreateInfo = struct_VkPipelineMultisampleStateCreateInfo;
pub const struct_VkPipelineRasterizationStateCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkPipelineRasterizationStateCreateFlags = 0,
    depthClampEnable: VkBool32 = 0,
    rasterizerDiscardEnable: VkBool32 = 0,
    polygonMode: VkPolygonMode = @import("std").mem.zeroes(VkPolygonMode),
    cullMode: VkCullModeFlags = 0,
    frontFace: VkFrontFace = @import("std").mem.zeroes(VkFrontFace),
    depthBiasEnable: VkBool32 = 0,
    depthBiasConstantFactor: f32 = 0,
    depthBiasClamp: f32 = 0,
    depthBiasSlopeFactor: f32 = 0,
    lineWidth: f32 = 0,
};
pub const VkPipelineRasterizationStateCreateInfo = struct_VkPipelineRasterizationStateCreateInfo;
pub const struct_VkPipelineTessellationStateCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkPipelineTessellationStateCreateFlags = 0,
    patchControlPoints: u32 = 0,
};
pub const VkPipelineTessellationStateCreateInfo = struct_VkPipelineTessellationStateCreateInfo;
pub const struct_VkPipelineVertexInputStateCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkPipelineVertexInputStateCreateFlags = 0,
    vertexBindingDescriptionCount: u32 = 0,
    pVertexBindingDescriptions: [*c]const VkVertexInputBindingDescription = null,
    vertexAttributeDescriptionCount: u32 = 0,
    pVertexAttributeDescriptions: [*c]const VkVertexInputAttributeDescription = null,
};
pub const VkPipelineVertexInputStateCreateInfo = struct_VkPipelineVertexInputStateCreateInfo;
pub const struct_VkPipelineViewportStateCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkPipelineViewportStateCreateFlags = 0,
    viewportCount: u32 = 0,
    pViewports: [*c]const VkViewport = null,
    scissorCount: u32 = 0,
    pScissors: [*c]const VkRect2D = null,
};
pub const VkPipelineViewportStateCreateInfo = struct_VkPipelineViewportStateCreateInfo;
pub const struct_VkGraphicsPipelineCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkPipelineCreateFlags = 0,
    stageCount: u32 = 0,
    pStages: [*c]const VkPipelineShaderStageCreateInfo = null,
    pVertexInputState: [*c]const VkPipelineVertexInputStateCreateInfo = null,
    pInputAssemblyState: [*c]const VkPipelineInputAssemblyStateCreateInfo = null,
    pTessellationState: [*c]const VkPipelineTessellationStateCreateInfo = null,
    pViewportState: [*c]const VkPipelineViewportStateCreateInfo = null,
    pRasterizationState: [*c]const VkPipelineRasterizationStateCreateInfo = null,
    pMultisampleState: [*c]const VkPipelineMultisampleStateCreateInfo = null,
    pDepthStencilState: [*c]const VkPipelineDepthStencilStateCreateInfo = null,
    pColorBlendState: [*c]const VkPipelineColorBlendStateCreateInfo = null,
    pDynamicState: [*c]const VkPipelineDynamicStateCreateInfo = null,
    layout: VkPipelineLayout = null,
    renderPass: VkRenderPass = null,
    subpass: u32 = 0,
    basePipelineHandle: VkPipeline = null,
    basePipelineIndex: i32 = 0,
};
pub const VkGraphicsPipelineCreateInfo = struct_VkGraphicsPipelineCreateInfo;
pub const struct_VkAttachmentDescription = extern struct {
    flags: VkAttachmentDescriptionFlags = 0,
    format: VkFormat = @import("std").mem.zeroes(VkFormat),
    samples: VkSampleCountFlagBits = @import("std").mem.zeroes(VkSampleCountFlagBits),
    loadOp: VkAttachmentLoadOp = @import("std").mem.zeroes(VkAttachmentLoadOp),
    storeOp: VkAttachmentStoreOp = @import("std").mem.zeroes(VkAttachmentStoreOp),
    stencilLoadOp: VkAttachmentLoadOp = @import("std").mem.zeroes(VkAttachmentLoadOp),
    stencilStoreOp: VkAttachmentStoreOp = @import("std").mem.zeroes(VkAttachmentStoreOp),
    initialLayout: VkImageLayout = @import("std").mem.zeroes(VkImageLayout),
    finalLayout: VkImageLayout = @import("std").mem.zeroes(VkImageLayout),
};
pub const VkAttachmentDescription = struct_VkAttachmentDescription;
pub const struct_VkAttachmentReference = extern struct {
    attachment: u32 = 0,
    layout: VkImageLayout = @import("std").mem.zeroes(VkImageLayout),
};
pub const VkAttachmentReference = struct_VkAttachmentReference;
pub const struct_VkFramebufferCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkFramebufferCreateFlags = 0,
    renderPass: VkRenderPass = null,
    attachmentCount: u32 = 0,
    pAttachments: [*c]const VkImageView = null,
    width: u32 = 0,
    height: u32 = 0,
    layers: u32 = 0,
};
pub const VkFramebufferCreateInfo = struct_VkFramebufferCreateInfo;
pub const struct_VkSubpassDependency = extern struct {
    srcSubpass: u32 = 0,
    dstSubpass: u32 = 0,
    srcStageMask: VkPipelineStageFlags = 0,
    dstStageMask: VkPipelineStageFlags = 0,
    srcAccessMask: VkAccessFlags = 0,
    dstAccessMask: VkAccessFlags = 0,
    dependencyFlags: VkDependencyFlags = 0,
};
pub const VkSubpassDependency = struct_VkSubpassDependency;
pub const struct_VkSubpassDescription = extern struct {
    flags: VkSubpassDescriptionFlags = 0,
    pipelineBindPoint: VkPipelineBindPoint = @import("std").mem.zeroes(VkPipelineBindPoint),
    inputAttachmentCount: u32 = 0,
    pInputAttachments: [*c]const VkAttachmentReference = null,
    colorAttachmentCount: u32 = 0,
    pColorAttachments: [*c]const VkAttachmentReference = null,
    pResolveAttachments: [*c]const VkAttachmentReference = null,
    pDepthStencilAttachment: [*c]const VkAttachmentReference = null,
    preserveAttachmentCount: u32 = 0,
    pPreserveAttachments: [*c]const u32 = null,
};
pub const VkSubpassDescription = struct_VkSubpassDescription;
pub const struct_VkRenderPassCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkRenderPassCreateFlags = 0,
    attachmentCount: u32 = 0,
    pAttachments: [*c]const VkAttachmentDescription = null,
    subpassCount: u32 = 0,
    pSubpasses: [*c]const VkSubpassDescription = null,
    dependencyCount: u32 = 0,
    pDependencies: [*c]const VkSubpassDependency = null,
};
pub const VkRenderPassCreateInfo = struct_VkRenderPassCreateInfo;
pub const struct_VkClearDepthStencilValue = extern struct {
    depth: f32 = 0,
    stencil: u32 = 0,
};
pub const VkClearDepthStencilValue = struct_VkClearDepthStencilValue;
pub const struct_VkClearRect = extern struct {
    rect: VkRect2D = @import("std").mem.zeroes(VkRect2D),
    baseArrayLayer: u32 = 0,
    layerCount: u32 = 0,
};
pub const VkClearRect = struct_VkClearRect;
pub const union_VkClearValue = extern union {
    color: VkClearColorValue,
    depthStencil: VkClearDepthStencilValue,
};
pub const VkClearValue = union_VkClearValue;
pub const struct_VkClearAttachment = extern struct {
    aspectMask: VkImageAspectFlags = 0,
    colorAttachment: u32 = 0,
    clearValue: VkClearValue = @import("std").mem.zeroes(VkClearValue),
};
pub const VkClearAttachment = struct_VkClearAttachment;
pub const struct_VkImageBlit = extern struct {
    srcSubresource: VkImageSubresourceLayers = @import("std").mem.zeroes(VkImageSubresourceLayers),
    srcOffsets: [2]VkOffset3D = @import("std").mem.zeroes([2]VkOffset3D),
    dstSubresource: VkImageSubresourceLayers = @import("std").mem.zeroes(VkImageSubresourceLayers),
    dstOffsets: [2]VkOffset3D = @import("std").mem.zeroes([2]VkOffset3D),
};
pub const VkImageBlit = struct_VkImageBlit;
pub const struct_VkImageResolve = extern struct {
    srcSubresource: VkImageSubresourceLayers = @import("std").mem.zeroes(VkImageSubresourceLayers),
    srcOffset: VkOffset3D = @import("std").mem.zeroes(VkOffset3D),
    dstSubresource: VkImageSubresourceLayers = @import("std").mem.zeroes(VkImageSubresourceLayers),
    dstOffset: VkOffset3D = @import("std").mem.zeroes(VkOffset3D),
    extent: VkExtent3D = @import("std").mem.zeroes(VkExtent3D),
};
pub const VkImageResolve = struct_VkImageResolve;
pub const struct_VkRenderPassBeginInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    renderPass: VkRenderPass = null,
    framebuffer: VkFramebuffer = null,
    renderArea: VkRect2D = @import("std").mem.zeroes(VkRect2D),
    clearValueCount: u32 = 0,
    pClearValues: [*c]const VkClearValue = null,
};
pub const VkRenderPassBeginInfo = struct_VkRenderPassBeginInfo;
pub const PFN_vkCreateInstance = ?*const fn (pCreateInfo: [*c]const VkInstanceCreateInfo, pAllocator: [*c]const VkAllocationCallbacks, pInstance: [*c]VkInstance) callconv(.c) VkResult;
pub const PFN_vkDestroyInstance = ?*const fn (instance: VkInstance, pAllocator: [*c]const VkAllocationCallbacks) callconv(.c) void;
pub const PFN_vkEnumeratePhysicalDevices = ?*const fn (instance: VkInstance, pPhysicalDeviceCount: [*c]u32, pPhysicalDevices: [*c]VkPhysicalDevice) callconv(.c) VkResult;
pub const PFN_vkGetPhysicalDeviceFeatures = ?*const fn (physicalDevice: VkPhysicalDevice, pFeatures: [*c]VkPhysicalDeviceFeatures) callconv(.c) void;
pub const PFN_vkGetPhysicalDeviceFormatProperties = ?*const fn (physicalDevice: VkPhysicalDevice, format: VkFormat, pFormatProperties: [*c]VkFormatProperties) callconv(.c) void;
pub const PFN_vkGetPhysicalDeviceImageFormatProperties = ?*const fn (physicalDevice: VkPhysicalDevice, format: VkFormat, @"type": VkImageType, tiling: VkImageTiling, usage: VkImageUsageFlags, flags: VkImageCreateFlags, pImageFormatProperties: [*c]VkImageFormatProperties) callconv(.c) VkResult;
pub const PFN_vkGetPhysicalDeviceProperties = ?*const fn (physicalDevice: VkPhysicalDevice, pProperties: [*c]VkPhysicalDeviceProperties) callconv(.c) void;
pub const PFN_vkGetPhysicalDeviceQueueFamilyProperties = ?*const fn (physicalDevice: VkPhysicalDevice, pQueueFamilyPropertyCount: [*c]u32, pQueueFamilyProperties: [*c]VkQueueFamilyProperties) callconv(.c) void;
pub const PFN_vkGetPhysicalDeviceMemoryProperties = ?*const fn (physicalDevice: VkPhysicalDevice, pMemoryProperties: [*c]VkPhysicalDeviceMemoryProperties) callconv(.c) void;
pub const PFN_vkGetInstanceProcAddr = ?*const fn (instance: VkInstance, pName: [*c]const u8) callconv(.c) PFN_vkVoidFunction;
pub const PFN_vkGetDeviceProcAddr = ?*const fn (device: VkDevice, pName: [*c]const u8) callconv(.c) PFN_vkVoidFunction;
pub const PFN_vkCreateDevice = ?*const fn (physicalDevice: VkPhysicalDevice, pCreateInfo: [*c]const VkDeviceCreateInfo, pAllocator: [*c]const VkAllocationCallbacks, pDevice: [*c]VkDevice) callconv(.c) VkResult;
pub const PFN_vkDestroyDevice = ?*const fn (device: VkDevice, pAllocator: [*c]const VkAllocationCallbacks) callconv(.c) void;
pub const PFN_vkEnumerateInstanceExtensionProperties = ?*const fn (pLayerName: [*c]const u8, pPropertyCount: [*c]u32, pProperties: [*c]VkExtensionProperties) callconv(.c) VkResult;
pub const PFN_vkEnumerateDeviceExtensionProperties = ?*const fn (physicalDevice: VkPhysicalDevice, pLayerName: [*c]const u8, pPropertyCount: [*c]u32, pProperties: [*c]VkExtensionProperties) callconv(.c) VkResult;
pub const PFN_vkEnumerateInstanceLayerProperties = ?*const fn (pPropertyCount: [*c]u32, pProperties: [*c]VkLayerProperties) callconv(.c) VkResult;
pub const PFN_vkGetDeviceQueue = ?*const fn (device: VkDevice, queueFamilyIndex: u32, queueIndex: u32, pQueue: [*c]VkQueue) callconv(.c) void;
pub const PFN_vkQueueSubmit = ?*const fn (queue: VkQueue, submitCount: u32, pSubmits: [*c]const VkSubmitInfo, fence: VkFence) callconv(.c) VkResult;
pub const PFN_vkQueueWaitIdle = ?*const fn (queue: VkQueue) callconv(.c) VkResult;
pub const PFN_vkDeviceWaitIdle = ?*const fn (device: VkDevice) callconv(.c) VkResult;
pub const PFN_vkAllocateMemory = ?*const fn (device: VkDevice, pAllocateInfo: [*c]const VkMemoryAllocateInfo, pAllocator: [*c]const VkAllocationCallbacks, pMemory: [*c]VkDeviceMemory) callconv(.c) VkResult;
pub const PFN_vkFreeMemory = ?*const fn (device: VkDevice, memory: VkDeviceMemory, pAllocator: [*c]const VkAllocationCallbacks) callconv(.c) void;
pub const PFN_vkMapMemory = ?*const fn (device: VkDevice, memory: VkDeviceMemory, offset: VkDeviceSize, size: VkDeviceSize, flags: VkMemoryMapFlags, ppData: [*c]?*anyopaque) callconv(.c) VkResult;
pub const PFN_vkUnmapMemory = ?*const fn (device: VkDevice, memory: VkDeviceMemory) callconv(.c) void;
pub const PFN_vkBindBufferMemory = ?*const fn (device: VkDevice, buffer: VkBuffer, memory: VkDeviceMemory, memoryOffset: VkDeviceSize) callconv(.c) VkResult;
pub const PFN_vkBindImageMemory = ?*const fn (device: VkDevice, image: VkImage, memory: VkDeviceMemory, memoryOffset: VkDeviceSize) callconv(.c) VkResult;
pub const PFN_vkGetBufferMemoryRequirements = ?*const fn (device: VkDevice, buffer: VkBuffer, pMemoryRequirements: [*c]VkMemoryRequirements) callconv(.c) void;
pub const PFN_vkGetImageMemoryRequirements = ?*const fn (device: VkDevice, image: VkImage, pMemoryRequirements: [*c]VkMemoryRequirements) callconv(.c) void;
pub const PFN_vkCreateFence = ?*const fn (device: VkDevice, pCreateInfo: [*c]const VkFenceCreateInfo, pAllocator: [*c]const VkAllocationCallbacks, pFence: [*c]VkFence) callconv(.c) VkResult;
pub const PFN_vkDestroyFence = ?*const fn (device: VkDevice, fence: VkFence, pAllocator: [*c]const VkAllocationCallbacks) callconv(.c) void;
pub const PFN_vkResetFences = ?*const fn (device: VkDevice, fenceCount: u32, pFences: [*c]const VkFence) callconv(.c) VkResult;
pub const PFN_vkGetFenceStatus = ?*const fn (device: VkDevice, fence: VkFence) callconv(.c) VkResult;
pub const PFN_vkWaitForFences = ?*const fn (device: VkDevice, fenceCount: u32, pFences: [*c]const VkFence, waitAll: VkBool32, timeout: u64) callconv(.c) VkResult;
pub const PFN_vkCreateSemaphore = ?*const fn (device: VkDevice, pCreateInfo: [*c]const VkSemaphoreCreateInfo, pAllocator: [*c]const VkAllocationCallbacks, pSemaphore: [*c]VkSemaphore) callconv(.c) VkResult;
pub const PFN_vkDestroySemaphore = ?*const fn (device: VkDevice, semaphore: VkSemaphore, pAllocator: [*c]const VkAllocationCallbacks) callconv(.c) void;
pub const PFN_vkCreateBuffer = ?*const fn (device: VkDevice, pCreateInfo: [*c]const VkBufferCreateInfo, pAllocator: [*c]const VkAllocationCallbacks, pBuffer: [*c]VkBuffer) callconv(.c) VkResult;
pub const PFN_vkDestroyBuffer = ?*const fn (device: VkDevice, buffer: VkBuffer, pAllocator: [*c]const VkAllocationCallbacks) callconv(.c) void;
pub const PFN_vkCreateImage = ?*const fn (device: VkDevice, pCreateInfo: [*c]const VkImageCreateInfo, pAllocator: [*c]const VkAllocationCallbacks, pImage: [*c]VkImage) callconv(.c) VkResult;
pub const PFN_vkDestroyImage = ?*const fn (device: VkDevice, image: VkImage, pAllocator: [*c]const VkAllocationCallbacks) callconv(.c) void;
pub const PFN_vkCreateImageView = ?*const fn (device: VkDevice, pCreateInfo: [*c]const VkImageViewCreateInfo, pAllocator: [*c]const VkAllocationCallbacks, pView: [*c]VkImageView) callconv(.c) VkResult;
pub const PFN_vkDestroyImageView = ?*const fn (device: VkDevice, imageView: VkImageView, pAllocator: [*c]const VkAllocationCallbacks) callconv(.c) void;
pub const PFN_vkCreateCommandPool = ?*const fn (device: VkDevice, pCreateInfo: [*c]const VkCommandPoolCreateInfo, pAllocator: [*c]const VkAllocationCallbacks, pCommandPool: [*c]VkCommandPool) callconv(.c) VkResult;
pub const PFN_vkDestroyCommandPool = ?*const fn (device: VkDevice, commandPool: VkCommandPool, pAllocator: [*c]const VkAllocationCallbacks) callconv(.c) void;
pub const PFN_vkResetCommandPool = ?*const fn (device: VkDevice, commandPool: VkCommandPool, flags: VkCommandPoolResetFlags) callconv(.c) VkResult;
pub const PFN_vkAllocateCommandBuffers = ?*const fn (device: VkDevice, pAllocateInfo: [*c]const VkCommandBufferAllocateInfo, pCommandBuffers: [*c]VkCommandBuffer) callconv(.c) VkResult;
pub const PFN_vkFreeCommandBuffers = ?*const fn (device: VkDevice, commandPool: VkCommandPool, commandBufferCount: u32, pCommandBuffers: [*c]const VkCommandBuffer) callconv(.c) void;
pub const PFN_vkBeginCommandBuffer = ?*const fn (commandBuffer: VkCommandBuffer, pBeginInfo: [*c]const VkCommandBufferBeginInfo) callconv(.c) VkResult;
pub const PFN_vkEndCommandBuffer = ?*const fn (commandBuffer: VkCommandBuffer) callconv(.c) VkResult;
pub const PFN_vkResetCommandBuffer = ?*const fn (commandBuffer: VkCommandBuffer, flags: VkCommandBufferResetFlags) callconv(.c) VkResult;
pub const PFN_vkCmdCopyBuffer = ?*const fn (commandBuffer: VkCommandBuffer, srcBuffer: VkBuffer, dstBuffer: VkBuffer, regionCount: u32, pRegions: [*c]const VkBufferCopy) callconv(.c) void;
pub const PFN_vkCmdCopyImage = ?*const fn (commandBuffer: VkCommandBuffer, srcImage: VkImage, srcImageLayout: VkImageLayout, dstImage: VkImage, dstImageLayout: VkImageLayout, regionCount: u32, pRegions: [*c]const VkImageCopy) callconv(.c) void;
pub const PFN_vkCmdCopyBufferToImage = ?*const fn (commandBuffer: VkCommandBuffer, srcBuffer: VkBuffer, dstImage: VkImage, dstImageLayout: VkImageLayout, regionCount: u32, pRegions: [*c]const VkBufferImageCopy) callconv(.c) void;
pub const PFN_vkCmdCopyImageToBuffer = ?*const fn (commandBuffer: VkCommandBuffer, srcImage: VkImage, srcImageLayout: VkImageLayout, dstBuffer: VkBuffer, regionCount: u32, pRegions: [*c]const VkBufferImageCopy) callconv(.c) void;
pub const PFN_vkCmdPipelineBarrier = ?*const fn (commandBuffer: VkCommandBuffer, srcStageMask: VkPipelineStageFlags, dstStageMask: VkPipelineStageFlags, dependencyFlags: VkDependencyFlags, memoryBarrierCount: u32, pMemoryBarriers: [*c]const VkMemoryBarrier, bufferMemoryBarrierCount: u32, pBufferMemoryBarriers: [*c]const VkBufferMemoryBarrier, imageMemoryBarrierCount: u32, pImageMemoryBarriers: [*c]const VkImageMemoryBarrier) callconv(.c) void;
pub const PFN_vkCreateShaderModule = ?*const fn (device: VkDevice, pCreateInfo: [*c]const VkShaderModuleCreateInfo, pAllocator: [*c]const VkAllocationCallbacks, pShaderModule: [*c]VkShaderModule) callconv(.c) VkResult;
pub const PFN_vkDestroyShaderModule = ?*const fn (device: VkDevice, shaderModule: VkShaderModule, pAllocator: [*c]const VkAllocationCallbacks) callconv(.c) void;
pub const PFN_vkCreatePipelineCache = ?*const fn (device: VkDevice, pCreateInfo: [*c]const VkPipelineCacheCreateInfo, pAllocator: [*c]const VkAllocationCallbacks, pPipelineCache: [*c]VkPipelineCache) callconv(.c) VkResult;
pub const PFN_vkDestroyPipelineCache = ?*const fn (device: VkDevice, pipelineCache: VkPipelineCache, pAllocator: [*c]const VkAllocationCallbacks) callconv(.c) void;
pub const PFN_vkGetPipelineCacheData = ?*const fn (device: VkDevice, pipelineCache: VkPipelineCache, pDataSize: [*c]usize, pData: ?*anyopaque) callconv(.c) VkResult;
pub const PFN_vkCreateComputePipelines = ?*const fn (device: VkDevice, pipelineCache: VkPipelineCache, createInfoCount: u32, pCreateInfos: [*c]const VkComputePipelineCreateInfo, pAllocator: [*c]const VkAllocationCallbacks, pPipelines: [*c]VkPipeline) callconv(.c) VkResult;
pub const PFN_vkDestroyPipeline = ?*const fn (device: VkDevice, pipeline: VkPipeline, pAllocator: [*c]const VkAllocationCallbacks) callconv(.c) void;
pub const PFN_vkCreatePipelineLayout = ?*const fn (device: VkDevice, pCreateInfo: [*c]const VkPipelineLayoutCreateInfo, pAllocator: [*c]const VkAllocationCallbacks, pPipelineLayout: [*c]VkPipelineLayout) callconv(.c) VkResult;
pub const PFN_vkDestroyPipelineLayout = ?*const fn (device: VkDevice, pipelineLayout: VkPipelineLayout, pAllocator: [*c]const VkAllocationCallbacks) callconv(.c) void;
pub const PFN_vkCreateSampler = ?*const fn (device: VkDevice, pCreateInfo: [*c]const VkSamplerCreateInfo, pAllocator: [*c]const VkAllocationCallbacks, pSampler: [*c]VkSampler) callconv(.c) VkResult;
pub const PFN_vkDestroySampler = ?*const fn (device: VkDevice, sampler: VkSampler, pAllocator: [*c]const VkAllocationCallbacks) callconv(.c) void;
pub const PFN_vkCreateDescriptorSetLayout = ?*const fn (device: VkDevice, pCreateInfo: [*c]const VkDescriptorSetLayoutCreateInfo, pAllocator: [*c]const VkAllocationCallbacks, pSetLayout: [*c]VkDescriptorSetLayout) callconv(.c) VkResult;
pub const PFN_vkDestroyDescriptorSetLayout = ?*const fn (device: VkDevice, descriptorSetLayout: VkDescriptorSetLayout, pAllocator: [*c]const VkAllocationCallbacks) callconv(.c) void;
pub const PFN_vkCreateDescriptorPool = ?*const fn (device: VkDevice, pCreateInfo: [*c]const VkDescriptorPoolCreateInfo, pAllocator: [*c]const VkAllocationCallbacks, pDescriptorPool: [*c]VkDescriptorPool) callconv(.c) VkResult;
pub const PFN_vkDestroyDescriptorPool = ?*const fn (device: VkDevice, descriptorPool: VkDescriptorPool, pAllocator: [*c]const VkAllocationCallbacks) callconv(.c) void;
pub const PFN_vkResetDescriptorPool = ?*const fn (device: VkDevice, descriptorPool: VkDescriptorPool, flags: VkDescriptorPoolResetFlags) callconv(.c) VkResult;
pub const PFN_vkAllocateDescriptorSets = ?*const fn (device: VkDevice, pAllocateInfo: [*c]const VkDescriptorSetAllocateInfo, pDescriptorSets: [*c]VkDescriptorSet) callconv(.c) VkResult;
pub const PFN_vkUpdateDescriptorSets = ?*const fn (device: VkDevice, descriptorWriteCount: u32, pDescriptorWrites: [*c]const VkWriteDescriptorSet, descriptorCopyCount: u32, pDescriptorCopies: [*c]const VkCopyDescriptorSet) callconv(.c) void;
pub const PFN_vkCmdBindPipeline = ?*const fn (commandBuffer: VkCommandBuffer, pipelineBindPoint: VkPipelineBindPoint, pipeline: VkPipeline) callconv(.c) void;
pub const PFN_vkCmdBindDescriptorSets = ?*const fn (commandBuffer: VkCommandBuffer, pipelineBindPoint: VkPipelineBindPoint, layout: VkPipelineLayout, firstSet: u32, descriptorSetCount: u32, pDescriptorSets: [*c]const VkDescriptorSet, dynamicOffsetCount: u32, pDynamicOffsets: [*c]const u32) callconv(.c) void;
pub const PFN_vkCmdClearColorImage = ?*const fn (commandBuffer: VkCommandBuffer, image: VkImage, imageLayout: VkImageLayout, pColor: [*c]const VkClearColorValue, rangeCount: u32, pRanges: [*c]const VkImageSubresourceRange) callconv(.c) void;
pub const PFN_vkCmdDispatch = ?*const fn (commandBuffer: VkCommandBuffer, groupCountX: u32, groupCountY: u32, groupCountZ: u32) callconv(.c) void;
pub const PFN_vkCmdDispatchIndirect = ?*const fn (commandBuffer: VkCommandBuffer, buffer: VkBuffer, offset: VkDeviceSize) callconv(.c) void;
pub const PFN_vkCreateGraphicsPipelines = ?*const fn (device: VkDevice, pipelineCache: VkPipelineCache, createInfoCount: u32, pCreateInfos: [*c]const VkGraphicsPipelineCreateInfo, pAllocator: [*c]const VkAllocationCallbacks, pPipelines: [*c]VkPipeline) callconv(.c) VkResult;
pub const PFN_vkCreateFramebuffer = ?*const fn (device: VkDevice, pCreateInfo: [*c]const VkFramebufferCreateInfo, pAllocator: [*c]const VkAllocationCallbacks, pFramebuffer: [*c]VkFramebuffer) callconv(.c) VkResult;
pub const PFN_vkDestroyFramebuffer = ?*const fn (device: VkDevice, framebuffer: VkFramebuffer, pAllocator: [*c]const VkAllocationCallbacks) callconv(.c) void;
pub const PFN_vkCreateRenderPass = ?*const fn (device: VkDevice, pCreateInfo: [*c]const VkRenderPassCreateInfo, pAllocator: [*c]const VkAllocationCallbacks, pRenderPass: [*c]VkRenderPass) callconv(.c) VkResult;
pub const PFN_vkDestroyRenderPass = ?*const fn (device: VkDevice, renderPass: VkRenderPass, pAllocator: [*c]const VkAllocationCallbacks) callconv(.c) void;
pub const PFN_vkCmdSetViewport = ?*const fn (commandBuffer: VkCommandBuffer, firstViewport: u32, viewportCount: u32, pViewports: [*c]const VkViewport) callconv(.c) void;
pub const PFN_vkCmdSetScissor = ?*const fn (commandBuffer: VkCommandBuffer, firstScissor: u32, scissorCount: u32, pScissors: [*c]const VkRect2D) callconv(.c) void;
pub const PFN_vkCmdSetDepthBias = ?*const fn (commandBuffer: VkCommandBuffer, depthBiasConstantFactor: f32, depthBiasClamp: f32, depthBiasSlopeFactor: f32) callconv(.c) void;
pub const PFN_vkCmdSetBlendConstants = ?*const fn (commandBuffer: VkCommandBuffer, blendConstants: [*c]const f32) callconv(.c) void;
pub const PFN_vkCmdSetStencilReference = ?*const fn (commandBuffer: VkCommandBuffer, faceMask: VkStencilFaceFlags, reference: u32) callconv(.c) void;
pub const PFN_vkCmdBindIndexBuffer = ?*const fn (commandBuffer: VkCommandBuffer, buffer: VkBuffer, offset: VkDeviceSize, indexType: VkIndexType) callconv(.c) void;
pub const PFN_vkCmdBindVertexBuffers = ?*const fn (commandBuffer: VkCommandBuffer, firstBinding: u32, bindingCount: u32, pBuffers: [*c]const VkBuffer, pOffsets: [*c]const VkDeviceSize) callconv(.c) void;
pub const PFN_vkCmdDraw = ?*const fn (commandBuffer: VkCommandBuffer, vertexCount: u32, instanceCount: u32, firstVertex: u32, firstInstance: u32) callconv(.c) void;
pub const PFN_vkCmdDrawIndexed = ?*const fn (commandBuffer: VkCommandBuffer, indexCount: u32, instanceCount: u32, firstIndex: u32, vertexOffset: i32, firstInstance: u32) callconv(.c) void;
pub const PFN_vkCmdDrawIndirect = ?*const fn (commandBuffer: VkCommandBuffer, buffer: VkBuffer, offset: VkDeviceSize, drawCount: u32, stride: u32) callconv(.c) void;
pub const PFN_vkCmdDrawIndexedIndirect = ?*const fn (commandBuffer: VkCommandBuffer, buffer: VkBuffer, offset: VkDeviceSize, drawCount: u32, stride: u32) callconv(.c) void;
pub const PFN_vkCmdBlitImage = ?*const fn (commandBuffer: VkCommandBuffer, srcImage: VkImage, srcImageLayout: VkImageLayout, dstImage: VkImage, dstImageLayout: VkImageLayout, regionCount: u32, pRegions: [*c]const VkImageBlit, filter: VkFilter) callconv(.c) void;
pub const PFN_vkCmdClearDepthStencilImage = ?*const fn (commandBuffer: VkCommandBuffer, image: VkImage, imageLayout: VkImageLayout, pDepthStencil: [*c]const VkClearDepthStencilValue, rangeCount: u32, pRanges: [*c]const VkImageSubresourceRange) callconv(.c) void;
pub const PFN_vkCmdClearAttachments = ?*const fn (commandBuffer: VkCommandBuffer, attachmentCount: u32, pAttachments: [*c]const VkClearAttachment, rectCount: u32, pRects: [*c]const VkClearRect) callconv(.c) void;
pub const PFN_vkCmdResolveImage = ?*const fn (commandBuffer: VkCommandBuffer, srcImage: VkImage, srcImageLayout: VkImageLayout, dstImage: VkImage, dstImageLayout: VkImageLayout, regionCount: u32, pRegions: [*c]const VkImageResolve) callconv(.c) void;
pub const PFN_vkCmdBeginRenderPass = ?*const fn (commandBuffer: VkCommandBuffer, pRenderPassBegin: [*c]const VkRenderPassBeginInfo, contents: VkSubpassContents) callconv(.c) void;
pub const PFN_vkCmdEndRenderPass = ?*const fn (commandBuffer: VkCommandBuffer) callconv(.c) void;
pub const struct_VkPhysicalDeviceFeatures2 = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*anyopaque = null,
    features: VkPhysicalDeviceFeatures = @import("std").mem.zeroes(VkPhysicalDeviceFeatures),
};
pub const VkPhysicalDeviceFeatures2 = struct_VkPhysicalDeviceFeatures2;
pub const struct_VkPhysicalDeviceProperties2 = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*anyopaque = null,
    properties: VkPhysicalDeviceProperties = @import("std").mem.zeroes(VkPhysicalDeviceProperties),
};
pub const VkPhysicalDeviceProperties2 = struct_VkPhysicalDeviceProperties2;
pub const struct_VkPhysicalDeviceProtectedMemoryFeatures = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*anyopaque = null,
    protectedMemory: VkBool32 = 0,
};
pub const VkPhysicalDeviceProtectedMemoryFeatures = struct_VkPhysicalDeviceProtectedMemoryFeatures;
pub const struct_VkPhysicalDevice16BitStorageFeatures = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*anyopaque = null,
    storageBuffer16BitAccess: VkBool32 = 0,
    uniformAndStorageBuffer16BitAccess: VkBool32 = 0,
    storagePushConstant16: VkBool32 = 0,
    storageInputOutput16: VkBool32 = 0,
};
pub const VkPhysicalDevice16BitStorageFeatures = struct_VkPhysicalDevice16BitStorageFeatures;
pub const struct_VkPhysicalDeviceVariablePointersFeatures = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*anyopaque = null,
    variablePointersStorageBuffer: VkBool32 = 0,
    variablePointers: VkBool32 = 0,
};
pub const VkPhysicalDeviceVariablePointersFeatures = struct_VkPhysicalDeviceVariablePointersFeatures;
pub const struct_VkPhysicalDeviceSamplerYcbcrConversionFeatures = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*anyopaque = null,
    samplerYcbcrConversion: VkBool32 = 0,
};
pub const VkPhysicalDeviceSamplerYcbcrConversionFeatures = struct_VkPhysicalDeviceSamplerYcbcrConversionFeatures;
pub const struct_VkPhysicalDeviceMultiviewFeatures = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*anyopaque = null,
    multiview: VkBool32 = 0,
    multiviewGeometryShader: VkBool32 = 0,
    multiviewTessellationShader: VkBool32 = 0,
};
pub const VkPhysicalDeviceMultiviewFeatures = struct_VkPhysicalDeviceMultiviewFeatures;
pub const struct_VkPhysicalDeviceShaderDrawParametersFeatures = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*anyopaque = null,
    shaderDrawParameters: VkBool32 = 0,
};
pub const VkPhysicalDeviceShaderDrawParametersFeatures = struct_VkPhysicalDeviceShaderDrawParametersFeatures;
pub const PFN_vkGetPhysicalDeviceFeatures2 = ?*const fn (physicalDevice: VkPhysicalDevice, pFeatures: [*c]VkPhysicalDeviceFeatures2) callconv(.c) void;
pub const enum_VkDriverId = c_uint;
pub const VkDriverId = enum_VkDriverId;
pub const struct_VkConformanceVersion = extern struct {
    major: u8 = 0,
    minor: u8 = 0,
    subminor: u8 = 0,
    patch: u8 = 0,
};
pub const VkConformanceVersion = struct_VkConformanceVersion;
pub const struct_VkPhysicalDeviceDriverProperties = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*anyopaque = null,
    driverID: VkDriverId = @import("std").mem.zeroes(VkDriverId),
    driverName: [256]u8 = @import("std").mem.zeroes([256]u8),
    driverInfo: [256]u8 = @import("std").mem.zeroes([256]u8),
    conformanceVersion: VkConformanceVersion = @import("std").mem.zeroes(VkConformanceVersion),
};
pub const VkPhysicalDeviceDriverProperties = struct_VkPhysicalDeviceDriverProperties;
pub const struct_VkPhysicalDeviceVulkan11Features = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*anyopaque = null,
    storageBuffer16BitAccess: VkBool32 = 0,
    uniformAndStorageBuffer16BitAccess: VkBool32 = 0,
    storagePushConstant16: VkBool32 = 0,
    storageInputOutput16: VkBool32 = 0,
    multiview: VkBool32 = 0,
    multiviewGeometryShader: VkBool32 = 0,
    multiviewTessellationShader: VkBool32 = 0,
    variablePointersStorageBuffer: VkBool32 = 0,
    variablePointers: VkBool32 = 0,
    protectedMemory: VkBool32 = 0,
    samplerYcbcrConversion: VkBool32 = 0,
    shaderDrawParameters: VkBool32 = 0,
};
pub const VkPhysicalDeviceVulkan11Features = struct_VkPhysicalDeviceVulkan11Features;
pub const struct_VkPhysicalDeviceVulkan12Features = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*anyopaque = null,
    samplerMirrorClampToEdge: VkBool32 = 0,
    drawIndirectCount: VkBool32 = 0,
    storageBuffer8BitAccess: VkBool32 = 0,
    uniformAndStorageBuffer8BitAccess: VkBool32 = 0,
    storagePushConstant8: VkBool32 = 0,
    shaderBufferInt64Atomics: VkBool32 = 0,
    shaderSharedInt64Atomics: VkBool32 = 0,
    shaderFloat16: VkBool32 = 0,
    shaderInt8: VkBool32 = 0,
    descriptorIndexing: VkBool32 = 0,
    shaderInputAttachmentArrayDynamicIndexing: VkBool32 = 0,
    shaderUniformTexelBufferArrayDynamicIndexing: VkBool32 = 0,
    shaderStorageTexelBufferArrayDynamicIndexing: VkBool32 = 0,
    shaderUniformBufferArrayNonUniformIndexing: VkBool32 = 0,
    shaderSampledImageArrayNonUniformIndexing: VkBool32 = 0,
    shaderStorageBufferArrayNonUniformIndexing: VkBool32 = 0,
    shaderStorageImageArrayNonUniformIndexing: VkBool32 = 0,
    shaderInputAttachmentArrayNonUniformIndexing: VkBool32 = 0,
    shaderUniformTexelBufferArrayNonUniformIndexing: VkBool32 = 0,
    shaderStorageTexelBufferArrayNonUniformIndexing: VkBool32 = 0,
    descriptorBindingUniformBufferUpdateAfterBind: VkBool32 = 0,
    descriptorBindingSampledImageUpdateAfterBind: VkBool32 = 0,
    descriptorBindingStorageImageUpdateAfterBind: VkBool32 = 0,
    descriptorBindingStorageBufferUpdateAfterBind: VkBool32 = 0,
    descriptorBindingUniformTexelBufferUpdateAfterBind: VkBool32 = 0,
    descriptorBindingStorageTexelBufferUpdateAfterBind: VkBool32 = 0,
    descriptorBindingUpdateUnusedWhilePending: VkBool32 = 0,
    descriptorBindingPartiallyBound: VkBool32 = 0,
    descriptorBindingVariableDescriptorCount: VkBool32 = 0,
    runtimeDescriptorArray: VkBool32 = 0,
    samplerFilterMinmax: VkBool32 = 0,
    scalarBlockLayout: VkBool32 = 0,
    imagelessFramebuffer: VkBool32 = 0,
    uniformBufferStandardLayout: VkBool32 = 0,
    shaderSubgroupExtendedTypes: VkBool32 = 0,
    separateDepthStencilLayouts: VkBool32 = 0,
    hostQueryReset: VkBool32 = 0,
    timelineSemaphore: VkBool32 = 0,
    bufferDeviceAddress: VkBool32 = 0,
    bufferDeviceAddressCaptureReplay: VkBool32 = 0,
    bufferDeviceAddressMultiDevice: VkBool32 = 0,
    vulkanMemoryModel: VkBool32 = 0,
    vulkanMemoryModelDeviceScope: VkBool32 = 0,
    vulkanMemoryModelAvailabilityVisibilityChains: VkBool32 = 0,
    shaderOutputViewportIndex: VkBool32 = 0,
    shaderOutputLayer: VkBool32 = 0,
    subgroupBroadcastDynamicId: VkBool32 = 0,
};
pub const VkPhysicalDeviceVulkan12Features = struct_VkPhysicalDeviceVulkan12Features;
pub const struct_VkPhysicalDeviceVulkan13Features = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*anyopaque = null,
    robustImageAccess: VkBool32 = 0,
    inlineUniformBlock: VkBool32 = 0,
    descriptorBindingInlineUniformBlockUpdateAfterBind: VkBool32 = 0,
    pipelineCreationCacheControl: VkBool32 = 0,
    privateData: VkBool32 = 0,
    shaderDemoteToHelperInvocation: VkBool32 = 0,
    shaderTerminateInvocation: VkBool32 = 0,
    subgroupSizeControl: VkBool32 = 0,
    computeFullSubgroups: VkBool32 = 0,
    synchronization2: VkBool32 = 0,
    textureCompressionASTC_HDR: VkBool32 = 0,
    shaderZeroInitializeWorkgroupMemory: VkBool32 = 0,
    dynamicRendering: VkBool32 = 0,
    shaderIntegerDotProduct: VkBool32 = 0,
    maintenance4: VkBool32 = 0,
};
pub const VkPhysicalDeviceVulkan13Features = struct_VkPhysicalDeviceVulkan13Features;
pub const struct_VkSurfaceKHR_T = opaque {};
pub const VkSurfaceKHR = ?*struct_VkSurfaceKHR_T;
pub const VK_PRESENT_MODE_IMMEDIATE_KHR: c_int = 0;
pub const VK_PRESENT_MODE_MAILBOX_KHR: c_int = 1;
pub const VK_PRESENT_MODE_FIFO_KHR: c_int = 2;
pub const enum_VkPresentModeKHR = c_uint;
pub const VkPresentModeKHR = enum_VkPresentModeKHR;
pub const VK_COLOR_SPACE_SRGB_NONLINEAR_KHR: c_int = 0;
pub const VK_COLOR_SPACE_EXTENDED_SRGB_LINEAR_EXT: c_int = 1000104002;
pub const VK_COLOR_SPACE_HDR10_ST2084_EXT: c_int = 1000104008;
pub const enum_VkColorSpaceKHR = c_uint;
pub const VkColorSpaceKHR = enum_VkColorSpaceKHR;
pub const enum_VkSurfaceTransformFlagBitsKHR = c_uint;
pub const VkSurfaceTransformFlagBitsKHR = enum_VkSurfaceTransformFlagBitsKHR;
pub const VkSurfaceTransformFlagsKHR = VkFlags;
pub const VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR: c_int = 1;
pub const VK_COMPOSITE_ALPHA_PRE_MULTIPLIED_BIT_KHR: c_int = 2;
pub const VK_COMPOSITE_ALPHA_POST_MULTIPLIED_BIT_KHR: c_int = 4;
pub const VK_COMPOSITE_ALPHA_INHERIT_BIT_KHR: c_int = 8;
pub const enum_VkCompositeAlphaFlagBitsKHR = c_uint;
pub const VkCompositeAlphaFlagBitsKHR = enum_VkCompositeAlphaFlagBitsKHR;
pub const VkCompositeAlphaFlagsKHR = VkFlags;
pub const struct_VkSurfaceCapabilitiesKHR = extern struct {
    minImageCount: u32 = 0,
    maxImageCount: u32 = 0,
    currentExtent: VkExtent2D = @import("std").mem.zeroes(VkExtent2D),
    minImageExtent: VkExtent2D = @import("std").mem.zeroes(VkExtent2D),
    maxImageExtent: VkExtent2D = @import("std").mem.zeroes(VkExtent2D),
    maxImageArrayLayers: u32 = 0,
    supportedTransforms: VkSurfaceTransformFlagsKHR = 0,
    currentTransform: VkSurfaceTransformFlagBitsKHR = @import("std").mem.zeroes(VkSurfaceTransformFlagBitsKHR),
    supportedCompositeAlpha: VkCompositeAlphaFlagsKHR = 0,
    supportedUsageFlags: VkImageUsageFlags = 0,
};
pub const VkSurfaceCapabilitiesKHR = struct_VkSurfaceCapabilitiesKHR;
pub const struct_VkSurfaceFormatKHR = extern struct {
    format: VkFormat = @import("std").mem.zeroes(VkFormat),
    colorSpace: VkColorSpaceKHR = @import("std").mem.zeroes(VkColorSpaceKHR),
};
pub const VkSurfaceFormatKHR = struct_VkSurfaceFormatKHR;
pub const PFN_vkDestroySurfaceKHR = ?*const fn (instance: VkInstance, surface: VkSurfaceKHR, pAllocator: [*c]const VkAllocationCallbacks) callconv(.c) void;
pub const PFN_vkGetPhysicalDeviceSurfaceSupportKHR = ?*const fn (physicalDevice: VkPhysicalDevice, queueFamilyIndex: u32, surface: VkSurfaceKHR, pSupported: [*c]VkBool32) callconv(.c) VkResult;
pub const PFN_vkGetPhysicalDeviceSurfaceCapabilitiesKHR = ?*const fn (physicalDevice: VkPhysicalDevice, surface: VkSurfaceKHR, pSurfaceCapabilities: [*c]VkSurfaceCapabilitiesKHR) callconv(.c) VkResult;
pub const PFN_vkGetPhysicalDeviceSurfaceFormatsKHR = ?*const fn (physicalDevice: VkPhysicalDevice, surface: VkSurfaceKHR, pSurfaceFormatCount: [*c]u32, pSurfaceFormats: [*c]VkSurfaceFormatKHR) callconv(.c) VkResult;
pub const PFN_vkGetPhysicalDeviceSurfacePresentModesKHR = ?*const fn (physicalDevice: VkPhysicalDevice, surface: VkSurfaceKHR, pPresentModeCount: [*c]u32, pPresentModes: [*c]VkPresentModeKHR) callconv(.c) VkResult;
pub const struct_VkSwapchainKHR_T = opaque {};
pub const VkSwapchainKHR = ?*struct_VkSwapchainKHR_T;
pub const VkSwapchainCreateFlagsKHR = VkFlags;
pub const struct_VkSwapchainCreateInfoKHR = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkSwapchainCreateFlagsKHR = 0,
    surface: VkSurfaceKHR = null,
    minImageCount: u32 = 0,
    imageFormat: VkFormat = @import("std").mem.zeroes(VkFormat),
    imageColorSpace: VkColorSpaceKHR = @import("std").mem.zeroes(VkColorSpaceKHR),
    imageExtent: VkExtent2D = @import("std").mem.zeroes(VkExtent2D),
    imageArrayLayers: u32 = 0,
    imageUsage: VkImageUsageFlags = 0,
    imageSharingMode: VkSharingMode = @import("std").mem.zeroes(VkSharingMode),
    queueFamilyIndexCount: u32 = 0,
    pQueueFamilyIndices: [*c]const u32 = null,
    preTransform: VkSurfaceTransformFlagBitsKHR = @import("std").mem.zeroes(VkSurfaceTransformFlagBitsKHR),
    compositeAlpha: VkCompositeAlphaFlagBitsKHR = @import("std").mem.zeroes(VkCompositeAlphaFlagBitsKHR),
    presentMode: VkPresentModeKHR = @import("std").mem.zeroes(VkPresentModeKHR),
    clipped: VkBool32 = 0,
    oldSwapchain: VkSwapchainKHR = null,
};
pub const VkSwapchainCreateInfoKHR = struct_VkSwapchainCreateInfoKHR;
pub const struct_VkPresentInfoKHR = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    waitSemaphoreCount: u32 = 0,
    pWaitSemaphores: [*c]const VkSemaphore = null,
    swapchainCount: u32 = 0,
    pSwapchains: [*c]const VkSwapchainKHR = null,
    pImageIndices: [*c]const u32 = null,
    pResults: [*c]VkResult = null,
};
pub const VkPresentInfoKHR = struct_VkPresentInfoKHR;
pub const PFN_vkCreateSwapchainKHR = ?*const fn (device: VkDevice, pCreateInfo: [*c]const VkSwapchainCreateInfoKHR, pAllocator: [*c]const VkAllocationCallbacks, pSwapchain: [*c]VkSwapchainKHR) callconv(.c) VkResult;
pub const PFN_vkDestroySwapchainKHR = ?*const fn (device: VkDevice, swapchain: VkSwapchainKHR, pAllocator: [*c]const VkAllocationCallbacks) callconv(.c) void;
pub const PFN_vkGetSwapchainImagesKHR = ?*const fn (device: VkDevice, swapchain: VkSwapchainKHR, pSwapchainImageCount: [*c]u32, pSwapchainImages: [*c]VkImage) callconv(.c) VkResult;
pub const PFN_vkAcquireNextImageKHR = ?*const fn (device: VkDevice, swapchain: VkSwapchainKHR, timeout: u64, semaphore: VkSemaphore, fence: VkFence, pImageIndex: [*c]u32) callconv(.c) VkResult;
pub const PFN_vkQueuePresentKHR = ?*const fn (queue: VkQueue, pPresentInfo: [*c]const VkPresentInfoKHR) callconv(.c) VkResult;
pub const VkPhysicalDeviceProperties2KHR = VkPhysicalDeviceProperties2;
pub const PFN_vkGetPhysicalDeviceProperties2KHR = ?*const fn (physicalDevice: VkPhysicalDevice, pProperties: [*c]VkPhysicalDeviceProperties2) callconv(.c) void;
pub const VkPhysicalDeviceDriverPropertiesKHR = VkPhysicalDeviceDriverProperties;
pub const struct_VkDebugUtilsLabelEXT = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    pLabelName: [*c]const u8 = null,
    color: [4]f32 = @import("std").mem.zeroes([4]f32),
};
pub const VkDebugUtilsLabelEXT = struct_VkDebugUtilsLabelEXT;
pub const struct_VkDebugUtilsObjectNameInfoEXT = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    objectType: VkObjectType = @import("std").mem.zeroes(VkObjectType),
    objectHandle: u64 = 0,
    pObjectName: [*c]const u8 = null,
};
pub const VkDebugUtilsObjectNameInfoEXT = struct_VkDebugUtilsObjectNameInfoEXT;
pub const PFN_vkSetDebugUtilsObjectNameEXT = ?*const fn (device: VkDevice, pNameInfo: [*c]const VkDebugUtilsObjectNameInfoEXT) callconv(.c) VkResult;
pub const PFN_vkCmdBeginDebugUtilsLabelEXT = ?*const fn (commandBuffer: VkCommandBuffer, pLabelInfo: [*c]const VkDebugUtilsLabelEXT) callconv(.c) void;
pub const PFN_vkCmdEndDebugUtilsLabelEXT = ?*const fn (commandBuffer: VkCommandBuffer) callconv(.c) void;
pub const PFN_vkCmdInsertDebugUtilsLabelEXT = ?*const fn (commandBuffer: VkCommandBuffer, pLabelInfo: [*c]const VkDebugUtilsLabelEXT) callconv(.c) void;
pub const VK_LAYERED_DRIVER_UNDERLYING_API_NONE_MSFT: c_int = 0;
pub const enum_VkLayeredDriverUnderlyingApiMSFT = c_uint;
pub const VkLayeredDriverUnderlyingApiMSFT = enum_VkLayeredDriverUnderlyingApiMSFT;
pub const struct_VkPhysicalDeviceLayeredDriverPropertiesMSFT = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*anyopaque = null,
    underlyingAPI: VkLayeredDriverUnderlyingApiMSFT = @import("std").mem.zeroes(VkLayeredDriverUnderlyingApiMSFT),
};
pub const VkPhysicalDeviceLayeredDriverPropertiesMSFT = struct_VkPhysicalDeviceLayeredDriverPropertiesMSFT;
pub const struct_VkPhysicalDevicePortabilitySubsetFeaturesKHR = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*anyopaque = null,
    constantAlphaColorBlendFactors: VkBool32 = 0,
    events: VkBool32 = 0,
    imageViewFormatReinterpretation: VkBool32 = 0,
    imageViewFormatSwizzle: VkBool32 = 0,
    imageView2DOn3DImage: VkBool32 = 0,
    multisampleArrayImage: VkBool32 = 0,
    mutableComparisonSamplers: VkBool32 = 0,
    pointPolygons: VkBool32 = 0,
    samplerMipLodBias: VkBool32 = 0,
    separateStencilMaskRef: VkBool32 = 0,
    shaderSampleRateInterpolationFunctions: VkBool32 = 0,
    tessellationIsolines: VkBool32 = 0,
    tessellationPointMode: VkBool32 = 0,
    triangleFans: VkBool32 = 0,
    vertexAttributeAccessBeyondStride: VkBool32 = 0,
};
pub const VkPhysicalDevicePortabilitySubsetFeaturesKHR = struct_VkPhysicalDevicePortabilitySubsetFeaturesKHR;
pub const XrVersion = u64;
pub const struct_XrInstance_T = opaque {
};
pub const XrInstance = ?*struct_XrInstance_T;
pub const XR_FORM_FACTOR_HEAD_MOUNTED_DISPLAY: c_int = 1;
pub const enum_XrFormFactor = c_uint;
pub const XrFormFactor = enum_XrFormFactor;
pub const XrInstanceCreateFlags = XrFlags64;
pub const XR_SWAPCHAIN_USAGE_COLOR_ATTACHMENT_BIT: XrSwapchainUsageFlags = 1;
pub const PFN_xrVoidFunction = ?*const fn () callconv(.c) void;
pub const struct_XrExtensionProperties = extern struct {
    type: XrStructureType = @import("std").mem.zeroes(XrStructureType),
    next: ?*anyopaque = null,
    extensionName: [128]u8 = @import("std").mem.zeroes([128]u8),
    extensionVersion: u32 = 0,
};
pub const XrExtensionProperties = struct_XrExtensionProperties;
pub const struct_XrApplicationInfo = extern struct {
    applicationName: [128]u8 = @import("std").mem.zeroes([128]u8),
    applicationVersion: u32 = 0,
    engineName: [128]u8 = @import("std").mem.zeroes([128]u8),
    engineVersion: u32 = 0,
    apiVersion: XrVersion = 0,
};
pub const XrApplicationInfo = struct_XrApplicationInfo;
pub const struct_XrInstanceCreateInfo = extern struct {
    type: XrStructureType = @import("std").mem.zeroes(XrStructureType),
    next: ?*const anyopaque = null,
    createFlags: XrInstanceCreateFlags = 0,
    applicationInfo: XrApplicationInfo = @import("std").mem.zeroes(XrApplicationInfo),
    enabledApiLayerCount: u32 = 0,
    enabledApiLayerNames: [*c]const [*c]const u8 = null,
    enabledExtensionCount: u32 = 0,
    enabledExtensionNames: [*c]const [*c]const u8 = null,
};
pub const XrInstanceCreateInfo = struct_XrInstanceCreateInfo;
pub const struct_XrSystemGetInfo = extern struct {
    type: XrStructureType = @import("std").mem.zeroes(XrStructureType),
    next: ?*const anyopaque = null,
    formFactor: XrFormFactor = @import("std").mem.zeroes(XrFormFactor),
};
pub const XrSystemGetInfo = struct_XrSystemGetInfo;
pub const struct_XrSwapchainImageBaseHeader = extern struct {
    type: XrStructureType = @import("std").mem.zeroes(XrStructureType),
    next: ?*anyopaque = null,
};
pub const XrSwapchainImageBaseHeader = struct_XrSwapchainImageBaseHeader;
pub const PFN_xrGetInstanceProcAddr = ?*const fn (instance: XrInstance, name: [*c]const u8, function: [*c]PFN_xrVoidFunction) callconv(.c) XrResult;
pub const PFN_xrEnumerateInstanceExtensionProperties = ?*const fn (layerName: [*c]const u8, propertyCapacityInput: u32, propertyCountOutput: [*c]u32, properties: [*c]XrExtensionProperties) callconv(.c) XrResult;
pub const PFN_xrCreateInstance = ?*const fn (createInfo: [*c]const XrInstanceCreateInfo, instance: [*c]XrInstance) callconv(.c) XrResult;
pub const PFN_xrDestroyInstance = ?*const fn (instance: XrInstance) callconv(.c) XrResult;
pub const PFN_xrGetSystem = ?*const fn (instance: XrInstance, getInfo: [*c]const XrSystemGetInfo, systemId: [*c]XrSystemId) callconv(.c) XrResult;
pub const PFN_xrCreateSession = ?*const fn (instance: XrInstance, createInfo: [*c]const XrSessionCreateInfo, session: [*c]XrSession) callconv(.c) XrResult;
pub const PFN_xrEnumerateSwapchainFormats = ?*const fn (session: XrSession, formatCapacityInput: u32, formatCountOutput: [*c]u32, formats: [*c]i64) callconv(.c) XrResult;
pub const PFN_xrCreateSwapchain = ?*const fn (session: XrSession, createInfo: [*c]const XrSwapchainCreateInfo, swapchain: [*c]XrSwapchain) callconv(.c) XrResult;
pub const PFN_xrDestroySwapchain = ?*const fn (swapchain: XrSwapchain) callconv(.c) XrResult;
pub const PFN_xrEnumerateSwapchainImages = ?*const fn (swapchain: XrSwapchain, imageCapacityInput: u32, imageCountOutput: [*c]u32, images: [*c]XrSwapchainImageBaseHeader) callconv(.c) XrResult;
pub extern fn xrDestroyInstance(instance: XrInstance) XrResult;
pub extern fn xrGetSystem(instance: XrInstance, getInfo: [*c]const XrSystemGetInfo, systemId: [*c]XrSystemId) XrResult;
pub extern fn xrCreateSession(instance: XrInstance, createInfo: [*c]const XrSessionCreateInfo, session: [*c]XrSession) XrResult;
pub extern fn xrEnumerateSwapchainFormats(session: XrSession, formatCapacityInput: u32, formatCountOutput: [*c]u32, formats: [*c]i64) XrResult;
pub extern fn xrCreateSwapchain(session: XrSession, createInfo: [*c]const XrSwapchainCreateInfo, swapchain: [*c]XrSwapchain) XrResult;
pub extern fn xrDestroySwapchain(swapchain: XrSwapchain) XrResult;
pub extern fn xrEnumerateSwapchainImages(swapchain: XrSwapchain, imageCapacityInput: u32, imageCountOutput: [*c]u32, images: [*c]XrSwapchainImageBaseHeader) XrResult;
pub const struct_XrGraphicsBindingVulkanKHR = extern struct {
    type: XrStructureType = @import("std").mem.zeroes(XrStructureType),
    next: ?*const anyopaque = null,
    instance: VkInstance = null,
    physicalDevice: VkPhysicalDevice = null,
    device: VkDevice = null,
    queueFamilyIndex: u32 = 0,
    queueIndex: u32 = 0,
};
pub const XrGraphicsBindingVulkanKHR = struct_XrGraphicsBindingVulkanKHR;
pub const struct_XrSwapchainImageVulkanKHR = extern struct {
    type: XrStructureType = @import("std").mem.zeroes(XrStructureType),
    next: ?*anyopaque = null,
    image: VkImage = null,
};
pub const XrSwapchainImageVulkanKHR = struct_XrSwapchainImageVulkanKHR;
pub const struct_XrGraphicsRequirementsVulkanKHR = extern struct {
    type: XrStructureType = @import("std").mem.zeroes(XrStructureType),
    next: ?*anyopaque = null,
    minApiVersionSupported: XrVersion = 0,
    maxApiVersionSupported: XrVersion = 0,
};
pub const XrGraphicsRequirementsVulkanKHR = struct_XrGraphicsRequirementsVulkanKHR;
pub const XrVulkanInstanceCreateFlagsKHR = XrFlags64;
pub const XrVulkanDeviceCreateFlagsKHR = XrFlags64;
pub const struct_XrVulkanInstanceCreateInfoKHR = extern struct {
    type: XrStructureType = @import("std").mem.zeroes(XrStructureType),
    next: ?*const anyopaque = null,
    systemId: XrSystemId = 0,
    createFlags: XrVulkanInstanceCreateFlagsKHR = 0,
    pfnGetInstanceProcAddr: PFN_vkGetInstanceProcAddr = null,
    vulkanCreateInfo: [*c]const VkInstanceCreateInfo = null,
    vulkanAllocator: [*c]const VkAllocationCallbacks = null,
};
pub const XrVulkanInstanceCreateInfoKHR = struct_XrVulkanInstanceCreateInfoKHR;
pub const struct_XrVulkanDeviceCreateInfoKHR = extern struct {
    type: XrStructureType = @import("std").mem.zeroes(XrStructureType),
    next: ?*const anyopaque = null,
    systemId: XrSystemId = 0,
    createFlags: XrVulkanDeviceCreateFlagsKHR = 0,
    pfnGetInstanceProcAddr: PFN_vkGetInstanceProcAddr = null,
    vulkanPhysicalDevice: VkPhysicalDevice = null,
    vulkanCreateInfo: [*c]const VkDeviceCreateInfo = null,
    vulkanAllocator: [*c]const VkAllocationCallbacks = null,
};
pub const XrVulkanDeviceCreateInfoKHR = struct_XrVulkanDeviceCreateInfoKHR;
pub const struct_XrVulkanGraphicsDeviceGetInfoKHR = extern struct {
    type: XrStructureType = @import("std").mem.zeroes(XrStructureType),
    next: ?*const anyopaque = null,
    systemId: XrSystemId = 0,
    vulkanInstance: VkInstance = null,
};
pub const XrVulkanGraphicsDeviceGetInfoKHR = struct_XrVulkanGraphicsDeviceGetInfoKHR;
pub const XrSwapchainImageVulkan2KHR = XrSwapchainImageVulkanKHR;
pub const PFN_xrCreateVulkanInstanceKHR = ?*const fn (instance: XrInstance, createInfo: [*c]const XrVulkanInstanceCreateInfoKHR, vulkanInstance: [*c]VkInstance, vulkanResult: [*c]VkResult) callconv(.c) XrResult;
pub const PFN_xrCreateVulkanDeviceKHR = ?*const fn (instance: XrInstance, createInfo: [*c]const XrVulkanDeviceCreateInfoKHR, vulkanDevice: [*c]VkDevice, vulkanResult: [*c]VkResult) callconv(.c) XrResult;
pub const PFN_xrGetVulkanGraphicsDevice2KHR = ?*const fn (instance: XrInstance, getInfo: [*c]const XrVulkanGraphicsDeviceGetInfoKHR, vulkanPhysicalDevice: [*c]VkPhysicalDevice) callconv(.c) XrResult;
pub const PFN_xrGetVulkanGraphicsRequirements2KHR = ?*const fn (instance: XrInstance, systemId: XrSystemId, graphicsRequirements: [*c]XrGraphicsRequirementsVulkanKHR) callconv(.c) XrResult;
pub const struct_XrInstancePfns = extern struct {
    xrEnumerateSwapchainFormats: PFN_xrEnumerateSwapchainFormats = null,
    xrCreateSession: PFN_xrCreateSession = null,
    xrGetSystem: PFN_xrGetSystem = null,
    xrCreateSwapchain: PFN_xrCreateSwapchain = null,
    xrEnumerateSwapchainImages: PFN_xrEnumerateSwapchainImages = null,
    xrDestroyInstance: PFN_xrDestroyInstance = null,
    xrDestroySwapchain: PFN_xrDestroySwapchain = null,
};
pub const XrInstancePfns = struct_XrInstancePfns;
pub extern fn SDL_OPENXR_LoadInstanceSymbols(instance: XrInstance) [*c]XrInstancePfns;
pub extern var OPENXR_xrGetInstanceProcAddr: PFN_xrGetInstanceProcAddr;
pub extern var OPENXR_xrCreateInstance: PFN_xrCreateInstance;
pub extern var OPENXR_xrEnumerateInstanceExtensionProperties: PFN_xrEnumerateInstanceExtensionProperties;
pub extern fn SDL_OPENXR_INTERNAL_GPUInitOpenXR(debugMode: bool, gpuExtension: XrExtensionProperties, props: SDL_PropertiesID, instance: [*c]XrInstance, systemId: [*c]XrSystemId, xr: [*c][*c]XrInstancePfns) XrResult;
pub extern fn SDL_Vulkan_LoadLibrary_REAL(path: [*c]const u8) bool;
pub extern fn SDL_Vulkan_GetVkGetInstanceProcAddr_REAL() SDL_FunctionPointer;
pub extern fn SDL_Vulkan_UnloadLibrary_REAL() void;
pub extern fn SDL_Vulkan_GetInstanceExtensions_REAL(count: [*c]Uint32) [*c]const [*c]const u8;
pub extern fn SDL_Vulkan_GetPresentationSupport_REAL(instance: VkInstance, physicalDevice: VkPhysicalDevice, queueFamilyIndex: Uint32) bool;
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
    Vulkan_CreateSurface: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, instance: VkInstance, allocator: [*c]const struct_VkAllocationCallbacks, surface: [*c]VkSurfaceKHR) callconv(.c) bool = null,
    Vulkan_DestroySurface: ?*const fn (_this: [*c]SDL_VideoDevice, instance: VkInstance, surface: VkSurfaceKHR, allocator: [*c]const struct_VkAllocationCallbacks) callconv(.c) void = null,
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
pub extern fn SDL_OpenXR_LoadLibrary_REAL() bool;
pub extern fn SDL_OpenXR_UnloadLibrary_REAL() void;
pub const struct_Pass = extern struct {
    command_buffer: ?*SDL_GPUCommandBuffer = null,
    in_progress: bool = false,
};
pub const Pass = struct_Pass;
pub const struct_ComputePass = extern struct {
    command_buffer: ?*SDL_GPUCommandBuffer = null,
    in_progress: bool = false,
    compute_pipeline: ?*SDL_GPUComputePipeline = null,
    sampler_bound: [16]bool = @import("std").mem.zeroes([16]bool),
    read_only_storage_texture_bound: [8]bool = @import("std").mem.zeroes([8]bool),
    read_only_storage_buffer_bound: [8]bool = @import("std").mem.zeroes([8]bool),
    read_write_storage_texture_bound: [8]bool = @import("std").mem.zeroes([8]bool),
    read_write_storage_buffer_bound: [8]bool = @import("std").mem.zeroes([8]bool),
};
pub const ComputePass = struct_ComputePass;
pub const struct_RenderPass = extern struct {
    command_buffer: ?*SDL_GPUCommandBuffer = null,
    in_progress: bool = false,
    color_targets: [8]?*SDL_GPUTexture = @import("std").mem.zeroes([8]?*SDL_GPUTexture),
    num_color_targets: Uint32 = 0,
    depth_stencil_target: ?*SDL_GPUTexture = null,
    graphics_pipeline: ?*SDL_GPUGraphicsPipeline = null,
    vertex_sampler_bound: [16]bool = @import("std").mem.zeroes([16]bool),
    vertex_storage_texture_bound: [8]bool = @import("std").mem.zeroes([8]bool),
    vertex_storage_buffer_bound: [8]bool = @import("std").mem.zeroes([8]bool),
    fragment_sampler_bound: [16]bool = @import("std").mem.zeroes([16]bool),
    fragment_storage_texture_bound: [8]bool = @import("std").mem.zeroes([8]bool),
    fragment_storage_buffer_bound: [8]bool = @import("std").mem.zeroes([8]bool),
};
pub const RenderPass = struct_RenderPass;
pub const struct_CommandBufferCommonHeader = extern struct {
    device: [*c]SDL_GPUDevice = null,
    render_pass: RenderPass = @import("std").mem.zeroes(RenderPass),
    compute_pass: ComputePass = @import("std").mem.zeroes(ComputePass),
    copy_pass: Pass = @import("std").mem.zeroes(Pass),
    swapchain_texture_acquired: bool = false,
    submitted: bool = false,
    ignore_render_pass_texture_validation: bool = false,
};
pub const CommandBufferCommonHeader = struct_CommandBufferCommonHeader;
pub const struct_TextureCommonHeader = extern struct {
    info: SDL_GPUTextureCreateInfo = @import("std").mem.zeroes(SDL_GPUTextureCreateInfo),
};
pub const TextureCommonHeader = struct_TextureCommonHeader;
pub const struct_GraphicsPipelineCommonHeader = extern struct {
    num_vertex_samplers: Uint32 = 0,
    num_vertex_storage_textures: Uint32 = 0,
    num_vertex_storage_buffers: Uint32 = 0,
    num_vertex_uniform_buffers: Uint32 = 0,
    num_fragment_samplers: Uint32 = 0,
    num_fragment_storage_textures: Uint32 = 0,
    num_fragment_storage_buffers: Uint32 = 0,
    num_fragment_uniform_buffers: Uint32 = 0,
};
pub const GraphicsPipelineCommonHeader = struct_GraphicsPipelineCommonHeader;
pub const struct_ComputePipelineCommonHeader = extern struct {
    numSamplers: Uint32 = 0,
    numReadonlyStorageTextures: Uint32 = 0,
    numReadonlyStorageBuffers: Uint32 = 0,
    numReadWriteStorageTextures: Uint32 = 0,
    numReadWriteStorageBuffers: Uint32 = 0,
    numUniformBuffers: Uint32 = 0,
};
pub const ComputePipelineCommonHeader = struct_ComputePipelineCommonHeader;
pub fn IsDepthFormat(format: SDL_GPUTextureFormat) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (format) {
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_D16_UNORM) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_D24_UNORM) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_D32_FLOAT) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_D24_UNORM_S8_UINT) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_D32_FLOAT_S8_UINT) => {
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
                return undefined;
            },
            2 => {
                {
                    sdl_pc = 3;
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
                return @"true" != 0;
            },
            7 => {
                return @"false" != 0;
            },
            else => unreachable,
        }
    }
}
pub fn IsStencilFormat(format: SDL_GPUTextureFormat) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (format) {
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_D24_UNORM_S8_UINT) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_D32_FLOAT_S8_UINT) => {
                        sdl_pc = 3;
                        continue;
                    },
                    else => {
                        sdl_pc = 4;
                        continue;
                    },
                }
            },
            1 => {
                return undefined;
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
                return @"false" != 0;
            },
            else => unreachable,
        }
    }
}
pub const struct_SDL_GPUBootstrap = extern struct {
    name: [*c]const u8 = null,
    PrepareDriver: ?*const fn (_this: [*c]SDL_VideoDevice, props: SDL_PropertiesID) callconv(.c) bool = null,
    CreateDevice: ?*const fn (debug_mode: bool, prefer_low_power: bool, props: SDL_PropertiesID) callconv(.c) [*c]SDL_GPUDevice = null,
};
pub const SDL_GPUBootstrap = struct_SDL_GPUBootstrap;
pub const SDL_WINDOW_EVENT_WATCH_NORMAL: c_int = 1;
pub const SDL_WindowEventWatchPriority = c_uint;
pub extern fn SDL_AddWindowEventWatch(priority: SDL_WindowEventWatchPriority, filter: SDL_EventFilter, userdata: ?*anyopaque) void;
pub extern fn SDL_RemoveWindowEventWatch(priority: SDL_WindowEventWatchPriority, filter: SDL_EventFilter, userdata: ?*anyopaque) void;
pub var vkGetInstanceProcAddr: PFN_vkGetInstanceProcAddr = null;
pub var vkCreateInstance: PFN_vkCreateInstance = null;
pub var vkEnumerateInstanceExtensionProperties: PFN_vkEnumerateInstanceExtensionProperties = null;
pub var vkEnumerateInstanceLayerProperties: PFN_vkEnumerateInstanceLayerProperties = null;
pub const struct_VulkanExtensions = extern struct {
    KHR_swapchain: Uint8 = 0,
    KHR_maintenance1: Uint8 = 0,
    KHR_driver_properties: Uint8 = 0,
    KHR_portability_subset: Uint8 = 0,
    MSFT_layered_driver: Uint8 = 0,
    EXT_texture_compression_astc_hdr: Uint8 = 0,
};
pub const VulkanExtensions = struct_VulkanExtensions;
pub var SDLToVK_PresentMode: [3]VkPresentModeKHR = [3]VkPresentModeKHR{
    VK_PRESENT_MODE_FIFO_KHR,
    VK_PRESENT_MODE_IMMEDIATE_KHR,
    VK_PRESENT_MODE_MAILBOX_KHR,
};
pub var SDLToVK_TextureFormat: [105]VkFormat = [105]VkFormat{
    VK_FORMAT_UNDEFINED,
    VK_FORMAT_R8_UNORM,
    VK_FORMAT_R8_UNORM,
    VK_FORMAT_R8G8_UNORM,
    VK_FORMAT_R8G8B8A8_UNORM,
    VK_FORMAT_R16_UNORM,
    VK_FORMAT_R16G16_UNORM,
    VK_FORMAT_R16G16B16A16_UNORM,
    VK_FORMAT_A2B10G10R10_UNORM_PACK32,
    VK_FORMAT_R5G6B5_UNORM_PACK16,
    VK_FORMAT_A1R5G5B5_UNORM_PACK16,
    VK_FORMAT_B4G4R4A4_UNORM_PACK16,
    VK_FORMAT_B8G8R8A8_UNORM,
    VK_FORMAT_BC1_RGBA_UNORM_BLOCK,
    VK_FORMAT_BC2_UNORM_BLOCK,
    VK_FORMAT_BC3_UNORM_BLOCK,
    VK_FORMAT_BC4_UNORM_BLOCK,
    VK_FORMAT_BC5_UNORM_BLOCK,
    VK_FORMAT_BC7_UNORM_BLOCK,
    VK_FORMAT_BC6H_SFLOAT_BLOCK,
    VK_FORMAT_BC6H_UFLOAT_BLOCK,
    VK_FORMAT_R8_SNORM,
    VK_FORMAT_R8G8_SNORM,
    VK_FORMAT_R8G8B8A8_SNORM,
    VK_FORMAT_R16_SNORM,
    VK_FORMAT_R16G16_SNORM,
    VK_FORMAT_R16G16B16A16_SNORM,
    VK_FORMAT_R16_SFLOAT,
    VK_FORMAT_R16G16_SFLOAT,
    VK_FORMAT_R16G16B16A16_SFLOAT,
    VK_FORMAT_R32_SFLOAT,
    VK_FORMAT_R32G32_SFLOAT,
    VK_FORMAT_R32G32B32A32_SFLOAT,
    VK_FORMAT_B10G11R11_UFLOAT_PACK32,
    VK_FORMAT_R8_UINT,
    VK_FORMAT_R8G8_UINT,
    VK_FORMAT_R8G8B8A8_UINT,
    VK_FORMAT_R16_UINT,
    VK_FORMAT_R16G16_UINT,
    VK_FORMAT_R16G16B16A16_UINT,
    VK_FORMAT_R32_UINT,
    VK_FORMAT_R32G32_UINT,
    VK_FORMAT_R32G32B32A32_UINT,
    VK_FORMAT_R8_SINT,
    VK_FORMAT_R8G8_SINT,
    VK_FORMAT_R8G8B8A8_SINT,
    VK_FORMAT_R16_SINT,
    VK_FORMAT_R16G16_SINT,
    VK_FORMAT_R16G16B16A16_SINT,
    VK_FORMAT_R32_SINT,
    VK_FORMAT_R32G32_SINT,
    VK_FORMAT_R32G32B32A32_SINT,
    VK_FORMAT_R8G8B8A8_SRGB,
    VK_FORMAT_B8G8R8A8_SRGB,
    VK_FORMAT_BC1_RGBA_SRGB_BLOCK,
    VK_FORMAT_BC2_SRGB_BLOCK,
    VK_FORMAT_BC3_SRGB_BLOCK,
    VK_FORMAT_BC7_SRGB_BLOCK,
    VK_FORMAT_D16_UNORM,
    VK_FORMAT_X8_D24_UNORM_PACK32,
    VK_FORMAT_D32_SFLOAT,
    VK_FORMAT_D24_UNORM_S8_UINT,
    VK_FORMAT_D32_SFLOAT_S8_UINT,
    VK_FORMAT_ASTC_4x4_UNORM_BLOCK,
    VK_FORMAT_ASTC_5x4_UNORM_BLOCK,
    VK_FORMAT_ASTC_5x5_UNORM_BLOCK,
    VK_FORMAT_ASTC_6x5_UNORM_BLOCK,
    VK_FORMAT_ASTC_6x6_UNORM_BLOCK,
    VK_FORMAT_ASTC_8x5_UNORM_BLOCK,
    VK_FORMAT_ASTC_8x6_UNORM_BLOCK,
    VK_FORMAT_ASTC_8x8_UNORM_BLOCK,
    VK_FORMAT_ASTC_10x5_UNORM_BLOCK,
    VK_FORMAT_ASTC_10x6_UNORM_BLOCK,
    VK_FORMAT_ASTC_10x8_UNORM_BLOCK,
    VK_FORMAT_ASTC_10x10_UNORM_BLOCK,
    VK_FORMAT_ASTC_12x10_UNORM_BLOCK,
    VK_FORMAT_ASTC_12x12_UNORM_BLOCK,
    VK_FORMAT_ASTC_4x4_SRGB_BLOCK,
    VK_FORMAT_ASTC_5x4_SRGB_BLOCK,
    VK_FORMAT_ASTC_5x5_SRGB_BLOCK,
    VK_FORMAT_ASTC_6x5_SRGB_BLOCK,
    VK_FORMAT_ASTC_6x6_SRGB_BLOCK,
    VK_FORMAT_ASTC_8x5_SRGB_BLOCK,
    VK_FORMAT_ASTC_8x6_SRGB_BLOCK,
    VK_FORMAT_ASTC_8x8_SRGB_BLOCK,
    VK_FORMAT_ASTC_10x5_SRGB_BLOCK,
    VK_FORMAT_ASTC_10x6_SRGB_BLOCK,
    VK_FORMAT_ASTC_10x8_SRGB_BLOCK,
    VK_FORMAT_ASTC_10x10_SRGB_BLOCK,
    VK_FORMAT_ASTC_12x10_SRGB_BLOCK,
    VK_FORMAT_ASTC_12x12_SRGB_BLOCK,
    VK_FORMAT_ASTC_4x4_SFLOAT_BLOCK_EXT,
    VK_FORMAT_ASTC_5x4_SFLOAT_BLOCK_EXT,
    VK_FORMAT_ASTC_5x5_SFLOAT_BLOCK_EXT,
    VK_FORMAT_ASTC_6x5_SFLOAT_BLOCK_EXT,
    VK_FORMAT_ASTC_6x6_SFLOAT_BLOCK_EXT,
    VK_FORMAT_ASTC_8x5_SFLOAT_BLOCK_EXT,
    VK_FORMAT_ASTC_8x6_SFLOAT_BLOCK_EXT,
    VK_FORMAT_ASTC_8x8_SFLOAT_BLOCK_EXT,
    VK_FORMAT_ASTC_10x5_SFLOAT_BLOCK_EXT,
    VK_FORMAT_ASTC_10x6_SFLOAT_BLOCK_EXT,
    VK_FORMAT_ASTC_10x8_SFLOAT_BLOCK_EXT,
    VK_FORMAT_ASTC_10x10_SFLOAT_BLOCK_EXT,
    VK_FORMAT_ASTC_12x10_SFLOAT_BLOCK_EXT,
    VK_FORMAT_ASTC_12x12_SFLOAT_BLOCK,
};
comptime {
    if (!((@sizeOf(@TypeOf(SDLToVK_TextureFormat)) / @sizeOf(@TypeOf(SDLToVK_TextureFormat[@as(c_int, 0)]))) == @as(c_ulong, @bitCast(@as(c_long, SDL_GPU_TEXTUREFORMAT_ASTC_12x12_FLOAT + @as(c_int, 1)))))) @compileError("static assertion failed \"SDL_arraysize(SDLToVK_TextureFormat) == SDL_GPU_TEXTUREFORMAT_MAX_ENUM_VALUE\"");
}
pub fn SwizzleForSDLFormat(format: SDL_GPUTextureFormat) callconv(.c) VkComponentMapping {
    @setEvalBranchQuota(100000);
    if (format == @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_A8_UNORM)) {
        return VkComponentMapping{
            .r = VK_COMPONENT_SWIZZLE_ZERO,
            .g = VK_COMPONENT_SWIZZLE_ZERO,
            .b = VK_COMPONENT_SWIZZLE_ZERO,
            .a = VK_COMPONENT_SWIZZLE_R,
        };
    }
    if (format == @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_B4G4R4A4_UNORM)) {
        return VkComponentMapping{
            .r = VK_COMPONENT_SWIZZLE_G,
            .g = VK_COMPONENT_SWIZZLE_R,
            .b = VK_COMPONENT_SWIZZLE_A,
            .a = VK_COMPONENT_SWIZZLE_B,
        };
    }
    return VkComponentMapping{
        .r = VK_COMPONENT_SWIZZLE_IDENTITY,
        .g = VK_COMPONENT_SWIZZLE_IDENTITY,
        .b = VK_COMPONENT_SWIZZLE_IDENTITY,
        .a = VK_COMPONENT_SWIZZLE_IDENTITY,
    };
}
pub var SwapchainCompositionToFormat: [4]VkFormat = [4]VkFormat{
    VK_FORMAT_B8G8R8A8_UNORM,
    VK_FORMAT_B8G8R8A8_SRGB,
    VK_FORMAT_R16G16B16A16_SFLOAT,
    VK_FORMAT_A2B10G10R10_UNORM_PACK32,
};
pub var SwapchainCompositionToFallbackFormat: [4]VkFormat = [4]VkFormat{
    VK_FORMAT_R8G8B8A8_UNORM,
    VK_FORMAT_R8G8B8A8_SRGB,
    VK_FORMAT_UNDEFINED,
    VK_FORMAT_UNDEFINED,
};
pub fn SwapchainCompositionToSDLFormat(composition: SDL_GPUSwapchainComposition, usingFallback: bool) callconv(.c) SDL_GPUTextureFormat {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (composition) {
                    @as(SDL_GPUSwapchainComposition, SDL_GPU_SWAPCHAINCOMPOSITION_SDR) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_GPUSwapchainComposition, SDL_GPU_SWAPCHAINCOMPOSITION_SDR_LINEAR) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SDL_GPUSwapchainComposition, SDL_GPU_SWAPCHAINCOMPOSITION_HDR_EXTENDED_LINEAR) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(SDL_GPUSwapchainComposition, SDL_GPU_SWAPCHAINCOMPOSITION_HDR10_ST2084) => {
                        sdl_pc = 5;
                        continue;
                    },
                    else => {
                        sdl_pc = 6;
                        continue;
                    },
                }
            },
            1 => {
                return undefined;
            },
            2 => {
                return @bitCast(if (usingFallback) SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM else SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM);
            },
            3 => {
                return @bitCast(if (usingFallback) SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM_SRGB else SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM_SRGB);
            },
            4 => {
                return SDL_GPU_TEXTUREFORMAT_R16G16B16A16_FLOAT;
            },
            5 => {
                return SDL_GPU_TEXTUREFORMAT_R10G10B10A2_UNORM;
            },
            6 => {
                return SDL_GPU_TEXTUREFORMAT_INVALID;
            },
            else => unreachable,
        }
    }
}
pub var SwapchainCompositionToColorSpace: [4]VkColorSpaceKHR = [4]VkColorSpaceKHR{
    VK_COLOR_SPACE_SRGB_NONLINEAR_KHR,
    VK_COLOR_SPACE_SRGB_NONLINEAR_KHR,
    VK_COLOR_SPACE_EXTENDED_SRGB_LINEAR_EXT,
    VK_COLOR_SPACE_HDR10_ST2084_EXT,
};
pub var SwapchainCompositionSwizzle: [4]VkComponentMapping = [4]VkComponentMapping{
    VkComponentMapping{
        .r = VK_COMPONENT_SWIZZLE_IDENTITY,
        .g = VK_COMPONENT_SWIZZLE_IDENTITY,
        .b = VK_COMPONENT_SWIZZLE_IDENTITY,
        .a = VK_COMPONENT_SWIZZLE_IDENTITY,
    },
    VkComponentMapping{
        .r = VK_COMPONENT_SWIZZLE_IDENTITY,
        .g = VK_COMPONENT_SWIZZLE_IDENTITY,
        .b = VK_COMPONENT_SWIZZLE_IDENTITY,
        .a = VK_COMPONENT_SWIZZLE_IDENTITY,
    },
    VkComponentMapping{
        .r = VK_COMPONENT_SWIZZLE_IDENTITY,
        .g = VK_COMPONENT_SWIZZLE_IDENTITY,
        .b = VK_COMPONENT_SWIZZLE_IDENTITY,
        .a = VK_COMPONENT_SWIZZLE_IDENTITY,
    },
    VkComponentMapping{
        .r = VK_COMPONENT_SWIZZLE_R,
        .g = VK_COMPONENT_SWIZZLE_G,
        .b = VK_COMPONENT_SWIZZLE_B,
        .a = VK_COMPONENT_SWIZZLE_A,
    },
};
pub var SDLToVK_VertexFormat: [31]VkFormat = [31]VkFormat{
    VK_FORMAT_UNDEFINED,
    VK_FORMAT_R32_SINT,
    VK_FORMAT_R32G32_SINT,
    VK_FORMAT_R32G32B32_SINT,
    VK_FORMAT_R32G32B32A32_SINT,
    VK_FORMAT_R32_UINT,
    VK_FORMAT_R32G32_UINT,
    VK_FORMAT_R32G32B32_UINT,
    VK_FORMAT_R32G32B32A32_UINT,
    VK_FORMAT_R32_SFLOAT,
    VK_FORMAT_R32G32_SFLOAT,
    VK_FORMAT_R32G32B32_SFLOAT,
    VK_FORMAT_R32G32B32A32_SFLOAT,
    VK_FORMAT_R8G8_SINT,
    VK_FORMAT_R8G8B8A8_SINT,
    VK_FORMAT_R8G8_UINT,
    VK_FORMAT_R8G8B8A8_UINT,
    VK_FORMAT_R8G8_SNORM,
    VK_FORMAT_R8G8B8A8_SNORM,
    VK_FORMAT_R8G8_UNORM,
    VK_FORMAT_R8G8B8A8_UNORM,
    VK_FORMAT_R16G16_SINT,
    VK_FORMAT_R16G16B16A16_SINT,
    VK_FORMAT_R16G16_UINT,
    VK_FORMAT_R16G16B16A16_UINT,
    VK_FORMAT_R16G16_SNORM,
    VK_FORMAT_R16G16B16A16_SNORM,
    VK_FORMAT_R16G16_UNORM,
    VK_FORMAT_R16G16B16A16_UNORM,
    VK_FORMAT_R16G16_SFLOAT,
    VK_FORMAT_R16G16B16A16_SFLOAT,
};
comptime {
    if (!((@sizeOf(@TypeOf(SDLToVK_VertexFormat)) / @sizeOf(@TypeOf(SDLToVK_VertexFormat[@as(c_int, 0)]))) == @as(c_ulong, @bitCast(@as(c_long, SDL_GPU_VERTEXELEMENTFORMAT_HALF4 + @as(c_int, 1)))))) @compileError("static assertion failed \"SDL_arraysize(SDLToVK_VertexFormat) == SDL_GPU_VERTEXELEMENTFORMAT_MAX_ENUM_VALUE\"");
}
pub var SDLToVK_IndexType: [2]VkIndexType = [2]VkIndexType{
    VK_INDEX_TYPE_UINT16,
    VK_INDEX_TYPE_UINT32,
};
pub var SDLToVK_PrimitiveType: [5]VkPrimitiveTopology = [5]VkPrimitiveTopology{
    VK_PRIMITIVE_TOPOLOGY_TRIANGLE_LIST,
    VK_PRIMITIVE_TOPOLOGY_TRIANGLE_STRIP,
    VK_PRIMITIVE_TOPOLOGY_LINE_LIST,
    VK_PRIMITIVE_TOPOLOGY_LINE_STRIP,
    VK_PRIMITIVE_TOPOLOGY_POINT_LIST,
};
pub var SDLToVK_CullMode: [4]VkCullModeFlags = [4]VkCullModeFlags{
    VK_CULL_MODE_NONE,
    VK_CULL_MODE_FRONT_BIT,
    VK_CULL_MODE_BACK_BIT,
    VK_CULL_MODE_FRONT_AND_BACK,
};
pub var SDLToVK_FrontFace: [2]VkFrontFace = [2]VkFrontFace{
    VK_FRONT_FACE_COUNTER_CLOCKWISE,
    VK_FRONT_FACE_CLOCKWISE,
};
pub var SDLToVK_BlendFactor: [14]VkBlendFactor = [14]VkBlendFactor{
    VK_BLEND_FACTOR_ZERO,
    VK_BLEND_FACTOR_ZERO,
    VK_BLEND_FACTOR_ONE,
    VK_BLEND_FACTOR_SRC_COLOR,
    VK_BLEND_FACTOR_ONE_MINUS_SRC_COLOR,
    VK_BLEND_FACTOR_DST_COLOR,
    VK_BLEND_FACTOR_ONE_MINUS_DST_COLOR,
    VK_BLEND_FACTOR_SRC_ALPHA,
    VK_BLEND_FACTOR_ONE_MINUS_SRC_ALPHA,
    VK_BLEND_FACTOR_DST_ALPHA,
    VK_BLEND_FACTOR_ONE_MINUS_DST_ALPHA,
    VK_BLEND_FACTOR_CONSTANT_COLOR,
    VK_BLEND_FACTOR_ONE_MINUS_CONSTANT_COLOR,
    VK_BLEND_FACTOR_SRC_ALPHA_SATURATE,
};
comptime {
    if (!((@sizeOf(@TypeOf(SDLToVK_BlendFactor)) / @sizeOf(@TypeOf(SDLToVK_BlendFactor[@as(c_int, 0)]))) == @as(c_ulong, @bitCast(@as(c_long, SDL_GPU_BLENDFACTOR_SRC_ALPHA_SATURATE + @as(c_int, 1)))))) @compileError("static assertion failed \"SDL_arraysize(SDLToVK_BlendFactor) == SDL_GPU_BLENDFACTOR_MAX_ENUM_VALUE\"");
}
pub var SDLToVK_BlendOp: [6]VkBlendOp = [6]VkBlendOp{
    VK_BLEND_OP_ADD,
    VK_BLEND_OP_ADD,
    VK_BLEND_OP_SUBTRACT,
    VK_BLEND_OP_REVERSE_SUBTRACT,
    VK_BLEND_OP_MIN,
    VK_BLEND_OP_MAX,
};
comptime {
    if (!((@sizeOf(@TypeOf(SDLToVK_BlendOp)) / @sizeOf(@TypeOf(SDLToVK_BlendOp[@as(c_int, 0)]))) == @as(c_ulong, @bitCast(@as(c_long, SDL_GPU_BLENDOP_MAX + @as(c_int, 1)))))) @compileError("static assertion failed \"SDL_arraysize(SDLToVK_BlendOp) == SDL_GPU_BLENDOP_MAX_ENUM_VALUE\"");
}
pub var SDLToVK_CompareOp: [9]VkCompareOp = [9]VkCompareOp{
    VK_COMPARE_OP_NEVER,
    VK_COMPARE_OP_NEVER,
    VK_COMPARE_OP_LESS,
    VK_COMPARE_OP_EQUAL,
    VK_COMPARE_OP_LESS_OR_EQUAL,
    VK_COMPARE_OP_GREATER,
    VK_COMPARE_OP_NOT_EQUAL,
    VK_COMPARE_OP_GREATER_OR_EQUAL,
    VK_COMPARE_OP_ALWAYS,
};
comptime {
    if (!((@sizeOf(@TypeOf(SDLToVK_CompareOp)) / @sizeOf(@TypeOf(SDLToVK_CompareOp[@as(c_int, 0)]))) == @as(c_ulong, @bitCast(@as(c_long, SDL_GPU_COMPAREOP_ALWAYS + @as(c_int, 1)))))) @compileError("static assertion failed \"SDL_arraysize(SDLToVK_CompareOp) == SDL_GPU_COMPAREOP_MAX_ENUM_VALUE\"");
}
pub var SDLToVK_StencilOp: [9]VkStencilOp = [9]VkStencilOp{
    VK_STENCIL_OP_KEEP,
    VK_STENCIL_OP_KEEP,
    VK_STENCIL_OP_ZERO,
    VK_STENCIL_OP_REPLACE,
    VK_STENCIL_OP_INCREMENT_AND_CLAMP,
    VK_STENCIL_OP_DECREMENT_AND_CLAMP,
    VK_STENCIL_OP_INVERT,
    VK_STENCIL_OP_INCREMENT_AND_WRAP,
    VK_STENCIL_OP_DECREMENT_AND_WRAP,
};
comptime {
    if (!((@sizeOf(@TypeOf(SDLToVK_StencilOp)) / @sizeOf(@TypeOf(SDLToVK_StencilOp[@as(c_int, 0)]))) == @as(c_ulong, @bitCast(@as(c_long, SDL_GPU_STENCILOP_DECREMENT_AND_WRAP + @as(c_int, 1)))))) @compileError("static assertion failed \"SDL_arraysize(SDLToVK_StencilOp) == SDL_GPU_STENCILOP_MAX_ENUM_VALUE\"");
}
pub var SDLToVK_LoadOp: [3]VkAttachmentLoadOp = [3]VkAttachmentLoadOp{
    VK_ATTACHMENT_LOAD_OP_LOAD,
    VK_ATTACHMENT_LOAD_OP_CLEAR,
    VK_ATTACHMENT_LOAD_OP_DONT_CARE,
};
pub var SDLToVK_StoreOp: [4]VkAttachmentStoreOp = [4]VkAttachmentStoreOp{
    VK_ATTACHMENT_STORE_OP_STORE,
    VK_ATTACHMENT_STORE_OP_DONT_CARE,
    VK_ATTACHMENT_STORE_OP_DONT_CARE,
    VK_ATTACHMENT_STORE_OP_STORE,
};
pub var SDLToVK_SampleCount: [4]VkSampleCountFlagBits = [4]VkSampleCountFlagBits{
    VK_SAMPLE_COUNT_1_BIT,
    VK_SAMPLE_COUNT_2_BIT,
    VK_SAMPLE_COUNT_4_BIT,
    VK_SAMPLE_COUNT_8_BIT,
};
pub var SDLToVK_VertexInputRate: [2]VkVertexInputRate = [2]VkVertexInputRate{
    VK_VERTEX_INPUT_RATE_VERTEX,
    VK_VERTEX_INPUT_RATE_INSTANCE,
};
pub var SDLToVK_Filter: [2]VkFilter = [2]VkFilter{
    VK_FILTER_NEAREST,
    VK_FILTER_LINEAR,
};
pub var SDLToVK_SamplerMipmapMode: [2]VkSamplerMipmapMode = [2]VkSamplerMipmapMode{
    VK_SAMPLER_MIPMAP_MODE_NEAREST,
    VK_SAMPLER_MIPMAP_MODE_LINEAR,
};
pub var SDLToVK_SamplerAddressMode: [3]VkSamplerAddressMode = [3]VkSamplerAddressMode{
    VK_SAMPLER_ADDRESS_MODE_REPEAT,
    VK_SAMPLER_ADDRESS_MODE_MIRRORED_REPEAT,
    VK_SAMPLER_ADDRESS_MODE_CLAMP_TO_EDGE,
};
pub const struct_VulkanBufferContainer = extern struct {
    activeBuffer: [*c]VulkanBuffer = null,
    buffers: [*c][*c]VulkanBuffer = null,
    bufferCapacity: Uint32 = 0,
    bufferCount: Uint32 = 0,
    dedicated: bool = false,
    debugName: [*c]u8 = null,
};
pub const VulkanBufferContainer = struct_VulkanBufferContainer;
pub const VULKAN_BUFFER_TYPE_GPU: c_int = 0;
pub const VULKAN_BUFFER_TYPE_UNIFORM: c_int = 1;
pub const VULKAN_BUFFER_TYPE_TRANSFER: c_int = 2;
pub const enum_VulkanBufferType = c_uint;
pub const VulkanBufferType = enum_VulkanBufferType;
pub const struct_VulkanUniformBuffer = extern struct {
    buffer: [*c]VulkanBuffer = null,
    drawOffset: Uint32 = 0,
    writeOffset: Uint32 = 0,
};
pub const VulkanUniformBuffer = struct_VulkanUniformBuffer;
pub const struct_VulkanBuffer = extern struct {
    container: [*c]VulkanBufferContainer = null,
    containerIndex: Uint32 = 0,
    buffer: VkBuffer = null,
    usedRegion: [*c]VulkanMemoryUsedRegion = null,
    type: VulkanBufferType = @import("std").mem.zeroes(VulkanBufferType),
    usage: SDL_GPUBufferUsageFlags = 0,
    size: VkDeviceSize = 0,
    referenceCount: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
    transitioned: bool = false,
    markedForDestroy: bool = false,
    uniformBufferForDefrag: [*c]VulkanUniformBuffer = null,
};
pub const VulkanBuffer = struct_VulkanBuffer;
pub const struct_VulkanTextureContainer = extern struct {
    header: TextureCommonHeader = @import("std").mem.zeroes(TextureCommonHeader),
    activeTexture: [*c]VulkanTexture = null,
    textureCapacity: Uint32 = 0,
    textureCount: Uint32 = 0,
    textures: [*c][*c]VulkanTexture = null,
    debugName: [*c]u8 = null,
    canBeCycled: bool = false,
    externallyManaged: bool = false,
};
pub const VulkanTextureContainer = struct_VulkanTextureContainer;
pub const struct_VulkanTextureSubresource = extern struct {
    parent: [*c]VulkanTexture = null,
    layer: Uint32 = 0,
    level: Uint32 = 0,
    renderTargetViews: [*c]VkImageView = null,
    computeWriteView: VkImageView = null,
    depthStencilView: VkImageView = null,
};
pub const VulkanTextureSubresource = struct_VulkanTextureSubresource;
pub const struct_VulkanTexture = extern struct {
    container: [*c]VulkanTextureContainer = null,
    containerIndex: Uint32 = 0,
    usedRegion: [*c]VulkanMemoryUsedRegion = null,
    image: VkImage = null,
    fullView: VkImageView = null,
    swizzle: VkComponentMapping = @import("std").mem.zeroes(VkComponentMapping),
    aspectFlags: VkImageAspectFlags = 0,
    depth: Uint32 = 0,
    levelCount: Uint32 = 0,
    layerCount: Uint32 = 0,
    type: SDL_GPUTextureType = @import("std").mem.zeroes(SDL_GPUTextureType),
    usage: SDL_GPUTextureUsageFlags = 0,
    subresourceCount: Uint32 = 0,
    subresources: [*c]VulkanTextureSubresource = null,
    markedForDestroy: bool = false,
    externallyManaged: bool = false,
    referenceCount: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
};
pub const VulkanTexture = struct_VulkanTexture;
const union_unnamed_19 = extern union {
    vulkanBuffer: [*c]VulkanBuffer,
    vulkanTexture: [*c]VulkanTexture,
};
pub const struct_VulkanMemoryUsedRegion = extern struct {
    allocation: [*c]VulkanMemoryAllocation = null,
    offset: VkDeviceSize = 0,
    size: VkDeviceSize = 0,
    resourceOffset: VkDeviceSize = 0,
    resourceSize: VkDeviceSize = 0,
    alignment: VkDeviceSize = 0,
    isBuffer: Uint8 = 0,
    unnamed_0: union_unnamed_19 = @import("std").mem.zeroes(union_unnamed_19),
};
pub const VulkanMemoryUsedRegion = struct_VulkanMemoryUsedRegion;
pub const struct_VulkanMemoryFreeRegion = extern struct {
    allocation: [*c]VulkanMemoryAllocation = null,
    offset: VkDeviceSize = 0,
    size: VkDeviceSize = 0,
    allocationIndex: Uint32 = 0,
    sortedIndex: Uint32 = 0,
};
pub const VulkanMemoryFreeRegion = struct_VulkanMemoryFreeRegion;
pub const struct_VulkanMemoryAllocation = extern struct {
    allocator: [*c]VulkanMemorySubAllocator = null,
    memory: VkDeviceMemory = null,
    size: VkDeviceSize = 0,
    usedRegions: [*c][*c]VulkanMemoryUsedRegion = null,
    usedRegionCount: Uint32 = 0,
    usedRegionCapacity: Uint32 = 0,
    freeRegions: [*c][*c]VulkanMemoryFreeRegion = null,
    freeRegionCount: Uint32 = 0,
    freeRegionCapacity: Uint32 = 0,
    availableForAllocation: Uint8 = 0,
    freeSpace: VkDeviceSize = 0,
    usedSpace: VkDeviceSize = 0,
    mapPointer: [*c]Uint8 = null,
    memoryLock: ?*SDL_Mutex = null,
    referenceCount: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
};
pub const VulkanMemoryAllocation = struct_VulkanMemoryAllocation;
pub const struct_VulkanMemorySubAllocator = extern struct {
    memoryTypeIndex: Uint32 = 0,
    allocations: [*c][*c]VulkanMemoryAllocation = null,
    allocationCount: Uint32 = 0,
    sortedFreeRegions: [*c][*c]VulkanMemoryFreeRegion = null,
    sortedFreeRegionCount: Uint32 = 0,
    sortedFreeRegionCapacity: Uint32 = 0,
};
pub const VulkanMemorySubAllocator = struct_VulkanMemorySubAllocator;
pub const struct_VulkanMemoryAllocator = extern struct {
    subAllocators: [32]VulkanMemorySubAllocator = @import("std").mem.zeroes([32]VulkanMemorySubAllocator),
};
pub const VulkanMemoryAllocator = struct_VulkanMemoryAllocator;
pub const VulkanRenderer = struct_VulkanRenderer;
pub const struct_WindowData = extern struct {
    window: [*c]SDL_Window = null,
    renderer: [*c]VulkanRenderer = null,
    refcount: c_int = 0,
    swapchainComposition: SDL_GPUSwapchainComposition = @import("std").mem.zeroes(SDL_GPUSwapchainComposition),
    presentMode: SDL_GPUPresentMode = @import("std").mem.zeroes(SDL_GPUPresentMode),
    needsSwapchainRecreate: bool = false,
    needsSurfaceRecreate: bool = false,
    swapchainCreateWidth: Uint32 = 0,
    swapchainCreateHeight: Uint32 = 0,
    surface: VkSurfaceKHR = null,
    swapchain: VkSwapchainKHR = null,
    format: VkFormat = @import("std").mem.zeroes(VkFormat),
    colorSpace: VkColorSpaceKHR = @import("std").mem.zeroes(VkColorSpaceKHR),
    swapchainSwizzle: VkComponentMapping = @import("std").mem.zeroes(VkComponentMapping),
    usingFallbackFormat: bool = false,
    textureContainers: [*c]VulkanTextureContainer = null,
    imageCount: Uint32 = 0,
    width: Uint32 = 0,
    height: Uint32 = 0,
    imageAvailableSemaphore: [3]VkSemaphore = @import("std").mem.zeroes([3]VkSemaphore),
    renderFinishedSemaphore: [*c]VkSemaphore = null,
    inFlightFences: [3]?*SDL_GPUFence = @import("std").mem.zeroes([3]?*SDL_GPUFence),
    frameCounter: Uint32 = 0,
};
pub const WindowData = struct_WindowData;
pub const struct_VulkanCommandPool = extern struct {
    threadID: SDL_ThreadID = 0,
    commandPool: VkCommandPool = null,
    inactiveCommandBuffers: [*c][*c]VulkanCommandBuffer = null,
    inactiveCommandBufferCapacity: Uint32 = 0,
    inactiveCommandBufferCount: Uint32 = 0,
};
pub const VulkanCommandPool = struct_VulkanCommandPool;
pub const struct_VulkanPresentData = extern struct {
    windowData: [*c]WindowData = null,
    swapchainImageIndex: Uint32 = 0,
};
pub const VulkanPresentData = struct_VulkanPresentData;
pub const DescriptorSetLayoutID = u32;
pub const struct_DescriptorSetLayout = extern struct {
    ID: DescriptorSetLayoutID = 0,
    descriptorSetLayout: VkDescriptorSetLayout = null,
    samplerCount: Uint32 = 0,
    storageBufferCount: Uint32 = 0,
    storageTextureCount: Uint32 = 0,
    writeStorageBufferCount: Uint32 = 0,
    writeStorageTextureCount: Uint32 = 0,
    uniformBufferCount: Uint32 = 0,
};
pub const DescriptorSetLayout = struct_DescriptorSetLayout;
pub const struct_VulkanComputePipelineResourceLayout = extern struct {
    pipelineLayout: VkPipelineLayout = null,
    descriptorSetLayouts: [3][*c]DescriptorSetLayout = @import("std").mem.zeroes([3][*c]DescriptorSetLayout),
    numSamplers: Uint32 = 0,
    numReadonlyStorageTextures: Uint32 = 0,
    numReadonlyStorageBuffers: Uint32 = 0,
    numReadWriteStorageTextures: Uint32 = 0,
    numReadWriteStorageBuffers: Uint32 = 0,
    numUniformBuffers: Uint32 = 0,
};
pub const VulkanComputePipelineResourceLayout = struct_VulkanComputePipelineResourceLayout;
pub const struct_VulkanComputePipeline = extern struct {
    header: ComputePipelineCommonHeader = @import("std").mem.zeroes(ComputePipelineCommonHeader),
    shaderModule: VkShaderModule = null,
    pipeline: VkPipeline = null,
    resourceLayout: [*c]VulkanComputePipelineResourceLayout = null,
    referenceCount: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
};
pub const VulkanComputePipeline = struct_VulkanComputePipeline;
pub const struct_VulkanGraphicsPipelineResourceLayout = extern struct {
    pipelineLayout: VkPipelineLayout = null,
    descriptorSetLayouts: [4][*c]DescriptorSetLayout = @import("std").mem.zeroes([4][*c]DescriptorSetLayout),
    vertexSamplerCount: Uint32 = 0,
    vertexStorageTextureCount: Uint32 = 0,
    vertexStorageBufferCount: Uint32 = 0,
    vertexUniformBufferCount: Uint32 = 0,
    fragmentSamplerCount: Uint32 = 0,
    fragmentStorageTextureCount: Uint32 = 0,
    fragmentStorageBufferCount: Uint32 = 0,
    fragmentUniformBufferCount: Uint32 = 0,
};
pub const VulkanGraphicsPipelineResourceLayout = struct_VulkanGraphicsPipelineResourceLayout;
pub const struct_VulkanShader = extern struct {
    shaderModule: VkShaderModule = null,
    entrypointName: [*c]u8 = null,
    stage: SDL_GPUShaderStage = @import("std").mem.zeroes(SDL_GPUShaderStage),
    numSamplers: Uint32 = 0,
    numStorageTextures: Uint32 = 0,
    numStorageBuffers: Uint32 = 0,
    numUniformBuffers: Uint32 = 0,
    referenceCount: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
};
pub const VulkanShader = struct_VulkanShader;
pub const struct_VulkanGraphicsPipeline = extern struct {
    header: GraphicsPipelineCommonHeader = @import("std").mem.zeroes(GraphicsPipelineCommonHeader),
    pipeline: VkPipeline = null,
    primitiveType: SDL_GPUPrimitiveType = @import("std").mem.zeroes(SDL_GPUPrimitiveType),
    resourceLayout: [*c]VulkanGraphicsPipelineResourceLayout = null,
    vertexShader: [*c]VulkanShader = null,
    fragmentShader: [*c]VulkanShader = null,
    referenceCount: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
};
pub const VulkanGraphicsPipeline = struct_VulkanGraphicsPipeline;
pub const struct_DescriptorSetPool = extern struct {
    poolCount: Uint32 = 0,
    descriptorPools: [*c]VkDescriptorPool = null,
    descriptorSets: [*c]VkDescriptorSet = null,
    descriptorSetCount: Uint32 = 0,
    descriptorSetIndex: Uint32 = 0,
};
pub const DescriptorSetPool = struct_DescriptorSetPool;
pub const struct_DescriptorSetCache = extern struct {
    pools: [*c]DescriptorSetPool = null,
    poolCount: Uint32 = 0,
};
pub const DescriptorSetCache = struct_DescriptorSetCache;
pub const struct_VulkanSampler = extern struct {
    sampler: VkSampler = null,
    referenceCount: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
};
pub const VulkanSampler = struct_VulkanSampler;
pub const struct_VulkanFramebuffer = extern struct {
    framebuffer: VkFramebuffer = null,
    referenceCount: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
};
pub const VulkanFramebuffer = struct_VulkanFramebuffer;
pub const struct_VulkanFenceHandle = extern struct {
    fence: VkFence = null,
    referenceCount: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
};
pub const VulkanFenceHandle = struct_VulkanFenceHandle;
pub const struct_VulkanCommandBuffer = extern struct {
    common: CommandBufferCommonHeader = @import("std").mem.zeroes(CommandBufferCommonHeader),
    renderer: [*c]VulkanRenderer = null,
    commandBuffer: VkCommandBuffer = null,
    commandPool: [*c]VulkanCommandPool = null,
    presentDatas: [*c]VulkanPresentData = null,
    presentDataCount: Uint32 = 0,
    presentDataCapacity: Uint32 = 0,
    waitSemaphores: [*c]VkSemaphore = null,
    waitSemaphoreCount: Uint32 = 0,
    waitSemaphoreCapacity: Uint32 = 0,
    signalSemaphores: [*c]VkSemaphore = null,
    signalSemaphoreCount: Uint32 = 0,
    signalSemaphoreCapacity: Uint32 = 0,
    currentComputePipeline: [*c]VulkanComputePipeline = null,
    currentGraphicsPipeline: [*c]VulkanGraphicsPipeline = null,
    colorAttachmentSubresources: [8][*c]VulkanTextureSubresource = @import("std").mem.zeroes([8][*c]VulkanTextureSubresource),
    colorAttachmentSubresourceCount: Uint32 = 0,
    resolveAttachmentSubresources: [8][*c]VulkanTextureSubresource = @import("std").mem.zeroes([8][*c]VulkanTextureSubresource),
    resolveAttachmentSubresourceCount: Uint32 = 0,
    depthStencilAttachmentSubresource: [*c]VulkanTextureSubresource = null,
    currentViewport: VkViewport = @import("std").mem.zeroes(VkViewport),
    currentScissor: VkRect2D = @import("std").mem.zeroes(VkRect2D),
    blendConstants: [4]f32 = @import("std").mem.zeroes([4]f32),
    stencilRef: Uint8 = 0,
    descriptorSetCache: [*c]DescriptorSetCache = null,
    needNewVertexResourceDescriptorSet: bool = false,
    needNewVertexUniformDescriptorSet: bool = false,
    needNewVertexUniformOffsets: bool = false,
    needNewFragmentResourceDescriptorSet: bool = false,
    needNewFragmentUniformDescriptorSet: bool = false,
    needNewFragmentUniformOffsets: bool = false,
    needNewComputeReadOnlyDescriptorSet: bool = false,
    needNewComputeReadWriteDescriptorSet: bool = false,
    needNewComputeUniformDescriptorSet: bool = false,
    needNewComputeUniformOffsets: bool = false,
    vertexResourceDescriptorSet: VkDescriptorSet = null,
    vertexUniformDescriptorSet: VkDescriptorSet = null,
    fragmentResourceDescriptorSet: VkDescriptorSet = null,
    fragmentUniformDescriptorSet: VkDescriptorSet = null,
    computeReadOnlyDescriptorSet: VkDescriptorSet = null,
    computeReadWriteDescriptorSet: VkDescriptorSet = null,
    computeUniformDescriptorSet: VkDescriptorSet = null,
    vertexBuffers: [16]VkBuffer = @import("std").mem.zeroes([16]VkBuffer),
    vertexBufferOffsets: [16]VkDeviceSize = @import("std").mem.zeroes([16]VkDeviceSize),
    vertexBufferCount: Uint32 = 0,
    needVertexBufferBind: bool = false,
    vertexSamplerTextureViewBindings: [16]VkImageView = @import("std").mem.zeroes([16]VkImageView),
    vertexSamplerBindings: [16]VkSampler = @import("std").mem.zeroes([16]VkSampler),
    vertexStorageTextureViewBindings: [8]VkImageView = @import("std").mem.zeroes([8]VkImageView),
    vertexStorageBufferBindings: [8]VkBuffer = @import("std").mem.zeroes([8]VkBuffer),
    fragmentSamplerTextureViewBindings: [16]VkImageView = @import("std").mem.zeroes([16]VkImageView),
    fragmentSamplerBindings: [16]VkSampler = @import("std").mem.zeroes([16]VkSampler),
    fragmentStorageTextureViewBindings: [8]VkImageView = @import("std").mem.zeroes([8]VkImageView),
    fragmentStorageBufferBindings: [8]VkBuffer = @import("std").mem.zeroes([8]VkBuffer),
    computeSamplerTextureViewBindings: [16]VkImageView = @import("std").mem.zeroes([16]VkImageView),
    computeSamplerBindings: [16]VkSampler = @import("std").mem.zeroes([16]VkSampler),
    readOnlyComputeStorageTextureViewBindings: [8]VkImageView = @import("std").mem.zeroes([8]VkImageView),
    readOnlyComputeStorageBufferBindings: [8]VkBuffer = @import("std").mem.zeroes([8]VkBuffer),
    readOnlyComputeStorageTextures: [8][*c]VulkanTexture = @import("std").mem.zeroes([8][*c]VulkanTexture),
    readOnlyComputeStorageBuffers: [8][*c]VulkanBuffer = @import("std").mem.zeroes([8][*c]VulkanBuffer),
    readWriteComputeStorageTextureViewBindings: [8]VkImageView = @import("std").mem.zeroes([8]VkImageView),
    readWriteComputeStorageBufferBindings: [8]VkBuffer = @import("std").mem.zeroes([8]VkBuffer),
    readWriteComputeStorageTextureSubresources: [8][*c]VulkanTextureSubresource = @import("std").mem.zeroes([8][*c]VulkanTextureSubresource),
    readWriteComputeStorageTextureSubresourceCount: Uint32 = 0,
    readWriteComputeStorageBuffers: [8][*c]VulkanBuffer = @import("std").mem.zeroes([8][*c]VulkanBuffer),
    vertexUniformBuffers: [4][*c]VulkanUniformBuffer = @import("std").mem.zeroes([4][*c]VulkanUniformBuffer),
    fragmentUniformBuffers: [4][*c]VulkanUniformBuffer = @import("std").mem.zeroes([4][*c]VulkanUniformBuffer),
    computeUniformBuffers: [4][*c]VulkanUniformBuffer = @import("std").mem.zeroes([4][*c]VulkanUniformBuffer),
    usedBuffers: [*c][*c]VulkanBuffer = null,
    usedBufferCount: Sint32 = 0,
    usedBufferCapacity: Sint32 = 0,
    buffersUsedInPendingTransfers: [*c][*c]VulkanBuffer = null,
    buffersUsedInPendingTransfersCount: Sint32 = 0,
    buffersUsedInPendingTransfersCapacity: Sint32 = 0,
    usedTextures: [*c][*c]VulkanTexture = null,
    usedTextureCount: Sint32 = 0,
    usedTextureCapacity: Sint32 = 0,
    texturesUsedInPendingTransfers: [*c][*c]VulkanTexture = null,
    texturesUsedInPendingTransfersCount: Sint32 = 0,
    texturesUsedInPendingTransfersCapacity: Sint32 = 0,
    usedSamplers: [*c][*c]VulkanSampler = null,
    usedSamplerCount: Sint32 = 0,
    usedSamplerCapacity: Sint32 = 0,
    usedGraphicsPipelines: [*c][*c]VulkanGraphicsPipeline = null,
    usedGraphicsPipelineCount: Sint32 = 0,
    usedGraphicsPipelineCapacity: Sint32 = 0,
    usedComputePipelines: [*c][*c]VulkanComputePipeline = null,
    usedComputePipelineCount: Sint32 = 0,
    usedComputePipelineCapacity: Sint32 = 0,
    usedFramebuffers: [*c][*c]VulkanFramebuffer = null,
    usedFramebufferCount: Sint32 = 0,
    usedFramebufferCapacity: Sint32 = 0,
    usedUniformBuffers: [*c][*c]VulkanUniformBuffer = null,
    usedUniformBufferCount: Sint32 = 0,
    usedUniformBufferCapacity: Sint32 = 0,
    inFlightFence: [*c]VulkanFenceHandle = null,
    autoReleaseFence: bool = false,
    swapchainRequested: bool = false,
    isDefrag: bool = false,
};
pub const VulkanCommandBuffer = struct_VulkanCommandBuffer;
pub const struct_VulkanFencePool = extern struct {
    lock: ?*SDL_Mutex = null,
    availableFences: [*c][*c]VulkanFenceHandle = null,
    availableFenceCount: Uint32 = 0,
    availableFenceCapacity: Uint32 = 0,
};
pub const VulkanFencePool = struct_VulkanFencePool;
pub const struct_VulkanRenderer = extern struct {
    instance: VkInstance = null,
    physicalDevice: VkPhysicalDevice = null,
    physicalDeviceProperties: VkPhysicalDeviceProperties2KHR = @import("std").mem.zeroes(VkPhysicalDeviceProperties2KHR),
    physicalDeviceDriverProperties: VkPhysicalDeviceDriverPropertiesKHR = @import("std").mem.zeroes(VkPhysicalDeviceDriverPropertiesKHR),
    logicalDevice: VkDevice = null,
    integratedMemoryNotification: Uint8 = 0,
    outOfDeviceLocalMemoryWarning: Uint8 = 0,
    outofBARMemoryWarning: Uint8 = 0,
    fillModeOnlyWarning: Uint8 = 0,
    minimumVkVersion: Uint32 = 0,
    xrInstance: XrInstance = null,
    xrSystemId: XrSystemId = 0,
    xr: [*c]XrInstancePfns = null,
    debugMode: bool = false,
    preferLowPower: bool = false,
    requireHardwareAcceleration: bool = false,
    props: SDL_PropertiesID = 0,
    allowedFramesInFlight: Uint32 = 0,
    supports: VulkanExtensions = @import("std").mem.zeroes(VulkanExtensions),
    supportsDebugUtils: bool = false,
    supportsColorspace: bool = false,
    supportsPhysicalDeviceProperties2: bool = false,
    supportsPortabilityEnumeration: bool = false,
    supportsFillModeNonSolid: bool = false,
    supportsMultiDrawIndirect: bool = false,
    memoryAllocator: [*c]VulkanMemoryAllocator = null,
    memoryProperties: VkPhysicalDeviceMemoryProperties = @import("std").mem.zeroes(VkPhysicalDeviceMemoryProperties),
    checkEmptyAllocations: bool = false,
    claimedWindows: [*c][*c]WindowData = null,
    claimedWindowCount: Uint32 = 0,
    claimedWindowCapacity: Uint32 = 0,
    queueFamilyIndex: Uint32 = 0,
    unifiedQueue: VkQueue = null,
    submittedCommandBuffers: [*c][*c]VulkanCommandBuffer = null,
    submittedCommandBufferCount: Uint32 = 0,
    submittedCommandBufferCapacity: Uint32 = 0,
    fencePool: VulkanFencePool = @import("std").mem.zeroes(VulkanFencePool),
    commandPoolHashTable: ?*SDL_HashTable = null,
    renderPassHashTable: ?*SDL_HashTable = null,
    framebufferHashTable: ?*SDL_HashTable = null,
    graphicsPipelineResourceLayoutHashTable: ?*SDL_HashTable = null,
    computePipelineResourceLayoutHashTable: ?*SDL_HashTable = null,
    descriptorSetLayoutHashTable: ?*SDL_HashTable = null,
    uniformBufferPool: [*c][*c]VulkanUniformBuffer = null,
    uniformBufferPoolCount: Uint32 = 0,
    uniformBufferPoolCapacity: Uint32 = 0,
    descriptorSetCachePool: [*c][*c]DescriptorSetCache = null,
    descriptorSetCachePoolCount: Uint32 = 0,
    descriptorSetCachePoolCapacity: Uint32 = 0,
    layoutResourceID: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
    minUBOAlignment: Uint32 = 0,
    texturesToDestroy: [*c][*c]VulkanTexture = null,
    texturesToDestroyCount: Uint32 = 0,
    texturesToDestroyCapacity: Uint32 = 0,
    buffersToDestroy: [*c][*c]VulkanBuffer = null,
    buffersToDestroyCount: Uint32 = 0,
    buffersToDestroyCapacity: Uint32 = 0,
    samplersToDestroy: [*c][*c]VulkanSampler = null,
    samplersToDestroyCount: Uint32 = 0,
    samplersToDestroyCapacity: Uint32 = 0,
    graphicsPipelinesToDestroy: [*c][*c]VulkanGraphicsPipeline = null,
    graphicsPipelinesToDestroyCount: Uint32 = 0,
    graphicsPipelinesToDestroyCapacity: Uint32 = 0,
    computePipelinesToDestroy: [*c][*c]VulkanComputePipeline = null,
    computePipelinesToDestroyCount: Uint32 = 0,
    computePipelinesToDestroyCapacity: Uint32 = 0,
    shadersToDestroy: [*c][*c]VulkanShader = null,
    shadersToDestroyCount: Uint32 = 0,
    shadersToDestroyCapacity: Uint32 = 0,
    framebuffersToDestroy: [*c][*c]VulkanFramebuffer = null,
    framebuffersToDestroyCount: Uint32 = 0,
    framebuffersToDestroyCapacity: Uint32 = 0,
    allocatorLock: ?*SDL_Mutex = null,
    disposeLock: ?*SDL_Mutex = null,
    submitLock: ?*SDL_Mutex = null,
    acquireCommandBufferLock: ?*SDL_Mutex = null,
    acquireUniformBufferLock: ?*SDL_Mutex = null,
    renderPassFetchLock: ?*SDL_Mutex = null,
    framebufferFetchLock: ?*SDL_Mutex = null,
    graphicsPipelineLayoutFetchLock: ?*SDL_Mutex = null,
    computePipelineLayoutFetchLock: ?*SDL_Mutex = null,
    descriptorSetLayoutFetchLock: ?*SDL_Mutex = null,
    windowLock: ?*SDL_Mutex = null,
    defragLock: ?*SDL_RWLock = null,
    defragInProgress: Uint8 = 0,
    allocationsToDefrag: [*c][*c]VulkanMemoryAllocation = null,
    allocationsToDefragCount: Uint32 = 0,
    allocationsToDefragCapacity: Uint32 = 0,
    vkGetDeviceProcAddr: PFN_vkGetDeviceProcAddr = null,
    vkCreateDevice: PFN_vkCreateDevice = null,
    vkDestroyInstance: PFN_vkDestroyInstance = null,
    vkEnumerateDeviceExtensionProperties: PFN_vkEnumerateDeviceExtensionProperties = null,
    vkEnumeratePhysicalDevices: PFN_vkEnumeratePhysicalDevices = null,
    vkGetPhysicalDeviceFeatures: PFN_vkGetPhysicalDeviceFeatures = null,
    vkGetPhysicalDeviceQueueFamilyProperties: PFN_vkGetPhysicalDeviceQueueFamilyProperties = null,
    vkGetPhysicalDeviceFormatProperties: PFN_vkGetPhysicalDeviceFormatProperties = null,
    vkGetPhysicalDeviceImageFormatProperties: PFN_vkGetPhysicalDeviceImageFormatProperties = null,
    vkGetPhysicalDeviceMemoryProperties: PFN_vkGetPhysicalDeviceMemoryProperties = null,
    vkGetPhysicalDeviceProperties: PFN_vkGetPhysicalDeviceProperties = null,
    vkGetPhysicalDeviceFeatures2: PFN_vkGetPhysicalDeviceFeatures2 = null,
    vkGetPhysicalDeviceProperties2KHR: PFN_vkGetPhysicalDeviceProperties2KHR = null,
    vkDestroySurfaceKHR: PFN_vkDestroySurfaceKHR = null,
    vkGetPhysicalDeviceSurfaceCapabilitiesKHR: PFN_vkGetPhysicalDeviceSurfaceCapabilitiesKHR = null,
    vkGetPhysicalDeviceSurfaceFormatsKHR: PFN_vkGetPhysicalDeviceSurfaceFormatsKHR = null,
    vkGetPhysicalDeviceSurfacePresentModesKHR: PFN_vkGetPhysicalDeviceSurfacePresentModesKHR = null,
    vkGetPhysicalDeviceSurfaceSupportKHR: PFN_vkGetPhysicalDeviceSurfaceSupportKHR = null,
    vkCmdBeginDebugUtilsLabelEXT: PFN_vkCmdBeginDebugUtilsLabelEXT = null,
    vkSetDebugUtilsObjectNameEXT: PFN_vkSetDebugUtilsObjectNameEXT = null,
    vkCmdEndDebugUtilsLabelEXT: PFN_vkCmdEndDebugUtilsLabelEXT = null,
    vkCmdInsertDebugUtilsLabelEXT: PFN_vkCmdInsertDebugUtilsLabelEXT = null,
    vkAllocateCommandBuffers: PFN_vkAllocateCommandBuffers = null,
    vkAllocateDescriptorSets: PFN_vkAllocateDescriptorSets = null,
    vkAllocateMemory: PFN_vkAllocateMemory = null,
    vkBeginCommandBuffer: PFN_vkBeginCommandBuffer = null,
    vkBindBufferMemory: PFN_vkBindBufferMemory = null,
    vkBindImageMemory: PFN_vkBindImageMemory = null,
    vkCmdBeginRenderPass: PFN_vkCmdBeginRenderPass = null,
    vkCmdBindDescriptorSets: PFN_vkCmdBindDescriptorSets = null,
    vkCmdBindIndexBuffer: PFN_vkCmdBindIndexBuffer = null,
    vkCmdBindPipeline: PFN_vkCmdBindPipeline = null,
    vkCmdBindVertexBuffers: PFN_vkCmdBindVertexBuffers = null,
    vkCmdBlitImage: PFN_vkCmdBlitImage = null,
    vkCmdClearAttachments: PFN_vkCmdClearAttachments = null,
    vkCmdClearColorImage: PFN_vkCmdClearColorImage = null,
    vkCmdClearDepthStencilImage: PFN_vkCmdClearDepthStencilImage = null,
    vkCmdCopyBuffer: PFN_vkCmdCopyBuffer = null,
    vkCmdCopyImage: PFN_vkCmdCopyImage = null,
    vkCmdCopyBufferToImage: PFN_vkCmdCopyBufferToImage = null,
    vkCmdCopyImageToBuffer: PFN_vkCmdCopyImageToBuffer = null,
    vkCmdDispatch: PFN_vkCmdDispatch = null,
    vkCmdDispatchIndirect: PFN_vkCmdDispatchIndirect = null,
    vkCmdDraw: PFN_vkCmdDraw = null,
    vkCmdDrawIndexed: PFN_vkCmdDrawIndexed = null,
    vkCmdDrawIndexedIndirect: PFN_vkCmdDrawIndexedIndirect = null,
    vkCmdDrawIndirect: PFN_vkCmdDrawIndirect = null,
    vkCmdEndRenderPass: PFN_vkCmdEndRenderPass = null,
    vkCmdPipelineBarrier: PFN_vkCmdPipelineBarrier = null,
    vkCmdResolveImage: PFN_vkCmdResolveImage = null,
    vkCmdSetBlendConstants: PFN_vkCmdSetBlendConstants = null,
    vkCmdSetDepthBias: PFN_vkCmdSetDepthBias = null,
    vkCmdSetScissor: PFN_vkCmdSetScissor = null,
    vkCmdSetStencilReference: PFN_vkCmdSetStencilReference = null,
    vkCmdSetViewport: PFN_vkCmdSetViewport = null,
    vkCreateBuffer: PFN_vkCreateBuffer = null,
    vkCreateCommandPool: PFN_vkCreateCommandPool = null,
    vkCreateDescriptorPool: PFN_vkCreateDescriptorPool = null,
    vkCreateDescriptorSetLayout: PFN_vkCreateDescriptorSetLayout = null,
    vkCreateFence: PFN_vkCreateFence = null,
    vkCreateFramebuffer: PFN_vkCreateFramebuffer = null,
    vkCreateComputePipelines: PFN_vkCreateComputePipelines = null,
    vkCreateGraphicsPipelines: PFN_vkCreateGraphicsPipelines = null,
    vkCreateImage: PFN_vkCreateImage = null,
    vkCreateImageView: PFN_vkCreateImageView = null,
    vkCreatePipelineCache: PFN_vkCreatePipelineCache = null,
    vkCreatePipelineLayout: PFN_vkCreatePipelineLayout = null,
    vkCreateRenderPass: PFN_vkCreateRenderPass = null,
    vkCreateSampler: PFN_vkCreateSampler = null,
    vkCreateSemaphore: PFN_vkCreateSemaphore = null,
    vkCreateShaderModule: PFN_vkCreateShaderModule = null,
    vkDestroyBuffer: PFN_vkDestroyBuffer = null,
    vkDestroyCommandPool: PFN_vkDestroyCommandPool = null,
    vkDestroyDescriptorPool: PFN_vkDestroyDescriptorPool = null,
    vkDestroyDescriptorSetLayout: PFN_vkDestroyDescriptorSetLayout = null,
    vkDestroyDevice: PFN_vkDestroyDevice = null,
    vkDestroyFence: PFN_vkDestroyFence = null,
    vkDestroyFramebuffer: PFN_vkDestroyFramebuffer = null,
    vkDestroyImage: PFN_vkDestroyImage = null,
    vkDestroyImageView: PFN_vkDestroyImageView = null,
    vkDestroyPipeline: PFN_vkDestroyPipeline = null,
    vkDestroyPipelineCache: PFN_vkDestroyPipelineCache = null,
    vkDestroyPipelineLayout: PFN_vkDestroyPipelineLayout = null,
    vkDestroyRenderPass: PFN_vkDestroyRenderPass = null,
    vkDestroySampler: PFN_vkDestroySampler = null,
    vkDestroySemaphore: PFN_vkDestroySemaphore = null,
    vkDestroyShaderModule: PFN_vkDestroyShaderModule = null,
    vkDeviceWaitIdle: PFN_vkDeviceWaitIdle = null,
    vkEndCommandBuffer: PFN_vkEndCommandBuffer = null,
    vkFreeCommandBuffers: PFN_vkFreeCommandBuffers = null,
    vkFreeMemory: PFN_vkFreeMemory = null,
    vkGetDeviceQueue: PFN_vkGetDeviceQueue = null,
    vkGetPipelineCacheData: PFN_vkGetPipelineCacheData = null,
    vkGetFenceStatus: PFN_vkGetFenceStatus = null,
    vkGetBufferMemoryRequirements: PFN_vkGetBufferMemoryRequirements = null,
    vkGetImageMemoryRequirements: PFN_vkGetImageMemoryRequirements = null,
    vkMapMemory: PFN_vkMapMemory = null,
    vkQueueSubmit: PFN_vkQueueSubmit = null,
    vkQueueWaitIdle: PFN_vkQueueWaitIdle = null,
    vkResetCommandBuffer: PFN_vkResetCommandBuffer = null,
    vkResetCommandPool: PFN_vkResetCommandPool = null,
    vkResetDescriptorPool: PFN_vkResetDescriptorPool = null,
    vkResetFences: PFN_vkResetFences = null,
    vkUnmapMemory: PFN_vkUnmapMemory = null,
    vkUpdateDescriptorSets: PFN_vkUpdateDescriptorSets = null,
    vkWaitForFences: PFN_vkWaitForFences = null,
    vkAcquireNextImageKHR: PFN_vkAcquireNextImageKHR = null,
    vkCreateSwapchainKHR: PFN_vkCreateSwapchainKHR = null,
    vkDestroySwapchainKHR: PFN_vkDestroySwapchainKHR = null,
    vkQueuePresentKHR: PFN_vkQueuePresentKHR = null,
    vkGetSwapchainImagesKHR: PFN_vkGetSwapchainImagesKHR = null,
};
pub const VulkanBufferUsageModeFlags = Uint32;
pub const VULKAN_TEXTURE_USAGE_MODE_UNINITIALIZED: c_int = 0;
pub const VULKAN_TEXTURE_USAGE_MODE_COPY_SOURCE: c_int = 1;
pub const VULKAN_TEXTURE_USAGE_MODE_COPY_DESTINATION: c_int = 2;
pub const VULKAN_TEXTURE_USAGE_MODE_SAMPLER: c_int = 3;
pub const VULKAN_TEXTURE_USAGE_MODE_GRAPHICS_STORAGE_READ: c_int = 4;
pub const VULKAN_TEXTURE_USAGE_MODE_COMPUTE_STORAGE_READ: c_int = 5;
pub const VULKAN_TEXTURE_USAGE_MODE_COMPUTE_STORAGE_READ_WRITE: c_int = 6;
pub const VULKAN_TEXTURE_USAGE_MODE_COLOR_ATTACHMENT: c_int = 7;
pub const VULKAN_TEXTURE_USAGE_MODE_DEPTH_STENCIL_ATTACHMENT: c_int = 8;
pub const VULKAN_TEXTURE_USAGE_MODE_PRESENT: c_int = 9;
pub const enum_VulkanTextureUsageMode = c_uint;
pub const VulkanTextureUsageMode = enum_VulkanTextureUsageMode;
pub const VULKAN_UNIFORM_BUFFER_STAGE_VERTEX: c_int = 0;
pub const VULKAN_UNIFORM_BUFFER_STAGE_FRAGMENT: c_int = 1;
pub const VULKAN_UNIFORM_BUFFER_STAGE_COMPUTE: c_int = 2;
pub const enum_VulkanUniformBufferStage = c_uint;
pub const VulkanUniformBufferStage = enum_VulkanUniformBufferStage;
pub const struct_SwapchainSupportDetails = extern struct {
    capabilities: VkSurfaceCapabilitiesKHR = @import("std").mem.zeroes(VkSurfaceCapabilitiesKHR),
    formats: [*c]VkSurfaceFormatKHR = null,
    formatsLength: Uint32 = 0,
    presentModes: [*c]VkPresentModeKHR = null,
    presentModesLength: Uint32 = 0,
};
pub const SwapchainSupportDetails = struct_SwapchainSupportDetails;
pub const struct_DescriptorSetLayoutHashTableKey = extern struct {
    shaderStage: VkShaderStageFlagBits = @import("std").mem.zeroes(VkShaderStageFlagBits),
    samplerCount: Uint32 = 0,
    storageBufferCount: Uint32 = 0,
    storageTextureCount: Uint32 = 0,
    writeStorageBufferCount: Uint32 = 0,
    writeStorageTextureCount: Uint32 = 0,
    uniformBufferCount: Uint32 = 0,
};
pub const DescriptorSetLayoutHashTableKey = struct_DescriptorSetLayoutHashTableKey;
pub const struct_GraphicsPipelineResourceLayoutHashTableKey = extern struct {
    vertexSamplerCount: Uint32 = 0,
    vertexStorageTextureCount: Uint32 = 0,
    vertexStorageBufferCount: Uint32 = 0,
    vertexUniformBufferCount: Uint32 = 0,
    fragmentSamplerCount: Uint32 = 0,
    fragmentStorageTextureCount: Uint32 = 0,
    fragmentStorageBufferCount: Uint32 = 0,
    fragmentUniformBufferCount: Uint32 = 0,
};
pub const GraphicsPipelineResourceLayoutHashTableKey = struct_GraphicsPipelineResourceLayoutHashTableKey;
pub const struct_ComputePipelineResourceLayoutHashTableKey = extern struct {
    samplerCount: Uint32 = 0,
    readonlyStorageTextureCount: Uint32 = 0,
    readonlyStorageBufferCount: Uint32 = 0,
    readWriteStorageTextureCount: Uint32 = 0,
    readWriteStorageBufferCount: Uint32 = 0,
    uniformBufferCount: Uint32 = 0,
};
pub const ComputePipelineResourceLayoutHashTableKey = struct_ComputePipelineResourceLayoutHashTableKey;
pub const struct_RenderPassColorTargetDescription = extern struct {
    format: VkFormat = @import("std").mem.zeroes(VkFormat),
    loadOp: SDL_GPULoadOp = @import("std").mem.zeroes(SDL_GPULoadOp),
    storeOp: SDL_GPUStoreOp = @import("std").mem.zeroes(SDL_GPUStoreOp),
};
pub const RenderPassColorTargetDescription = struct_RenderPassColorTargetDescription;
pub const struct_RenderPassDepthStencilTargetDescription = extern struct {
    format: VkFormat = @import("std").mem.zeroes(VkFormat),
    loadOp: SDL_GPULoadOp = @import("std").mem.zeroes(SDL_GPULoadOp),
    storeOp: SDL_GPUStoreOp = @import("std").mem.zeroes(SDL_GPUStoreOp),
    stencilLoadOp: SDL_GPULoadOp = @import("std").mem.zeroes(SDL_GPULoadOp),
    stencilStoreOp: SDL_GPUStoreOp = @import("std").mem.zeroes(SDL_GPUStoreOp),
};
pub const RenderPassDepthStencilTargetDescription = struct_RenderPassDepthStencilTargetDescription;
pub const struct_CommandPoolHashTableKey = extern struct {
    threadID: SDL_ThreadID = 0,
};
pub const CommandPoolHashTableKey = struct_CommandPoolHashTableKey;
pub const struct_RenderPassHashTableKey = extern struct {
    colorTargetDescriptions: [8]RenderPassColorTargetDescription = @import("std").mem.zeroes([8]RenderPassColorTargetDescription),
    numColorTargets: Uint32 = 0,
    resolveTargetFormats: [8]VkFormat = @import("std").mem.zeroes([8]VkFormat),
    numResolveTargets: Uint32 = 0,
    depthStencilTargetDescription: RenderPassDepthStencilTargetDescription = @import("std").mem.zeroes(RenderPassDepthStencilTargetDescription),
    sampleCount: VkSampleCountFlagBits = @import("std").mem.zeroes(VkSampleCountFlagBits),
};
pub const RenderPassHashTableKey = struct_RenderPassHashTableKey;
pub const struct_VulkanRenderPassHashTableValue = extern struct {
    handle: VkRenderPass = null,
};
pub const VulkanRenderPassHashTableValue = struct_VulkanRenderPassHashTableValue;
pub const struct_FramebufferHashTableKey = extern struct {
    colorAttachmentViews: [8]VkImageView = @import("std").mem.zeroes([8]VkImageView),
    numColorTargets: Uint32 = 0,
    resolveAttachmentViews: [8]VkImageView = @import("std").mem.zeroes([8]VkImageView),
    numResolveAttachments: Uint32 = 0,
    depthStencilAttachmentView: VkImageView = null,
    width: Uint32 = 0,
    height: Uint32 = 0,
};
pub const FramebufferHashTableKey = struct_FramebufferHashTableKey;
pub const struct_VulkanFeatures = extern struct {
    desiredApiVersion: Uint32 = 0,
    desiredVulkan10DeviceFeatures: VkPhysicalDeviceFeatures = @import("std").mem.zeroes(VkPhysicalDeviceFeatures),
    desiredVulkan11DeviceFeatures: VkPhysicalDeviceVulkan11Features = @import("std").mem.zeroes(VkPhysicalDeviceVulkan11Features),
    desiredVulkan12DeviceFeatures: VkPhysicalDeviceVulkan12Features = @import("std").mem.zeroes(VkPhysicalDeviceVulkan12Features),
    desiredVulkan13DeviceFeatures: VkPhysicalDeviceVulkan13Features = @import("std").mem.zeroes(VkPhysicalDeviceVulkan13Features),
    usesCustomVulkanOptions: bool = false,
    additionalDeviceExtensionCount: Uint32 = 0,
    additionalDeviceExtensionNames: [*c][*c]const u8 = null,
    additionalInstanceExtensionCount: Uint32 = 0,
    additionalInstanceExtensionNames: [*c][*c]const u8 = null,
};
pub const VulkanFeatures = struct_VulkanFeatures;
pub fn VkErrorMessages(code: VkResult) callconv(.c) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (code) {
                    VK_ERROR_OUT_OF_HOST_MEMORY => {
                        sdl_pc = 2;
                        continue;
                    },
                    VK_ERROR_OUT_OF_DEVICE_MEMORY => {
                        sdl_pc = 3;
                        continue;
                    },
                    VK_ERROR_FRAGMENTED_POOL => {
                        sdl_pc = 4;
                        continue;
                    },
                    VK_ERROR_OUT_OF_POOL_MEMORY => {
                        sdl_pc = 5;
                        continue;
                    },
                    VK_ERROR_INITIALIZATION_FAILED => {
                        sdl_pc = 6;
                        continue;
                    },
                    VK_ERROR_LAYER_NOT_PRESENT => {
                        sdl_pc = 7;
                        continue;
                    },
                    VK_ERROR_EXTENSION_NOT_PRESENT => {
                        sdl_pc = 8;
                        continue;
                    },
                    VK_ERROR_FEATURE_NOT_PRESENT => {
                        sdl_pc = 9;
                        continue;
                    },
                    VK_ERROR_TOO_MANY_OBJECTS => {
                        sdl_pc = 10;
                        continue;
                    },
                    VK_ERROR_DEVICE_LOST => {
                        sdl_pc = 11;
                        continue;
                    },
                    VK_ERROR_INCOMPATIBLE_DRIVER => {
                        sdl_pc = 12;
                        continue;
                    },
                    VK_ERROR_OUT_OF_DATE_KHR => {
                        sdl_pc = 13;
                        continue;
                    },
                    VK_ERROR_SURFACE_LOST_KHR => {
                        sdl_pc = 14;
                        continue;
                    },
                    VK_ERROR_FULL_SCREEN_EXCLUSIVE_MODE_LOST_EXT => {
                        sdl_pc = 15;
                        continue;
                    },
                    VK_SUBOPTIMAL_KHR => {
                        sdl_pc = 16;
                        continue;
                    },
                    VK_ERROR_NATIVE_WINDOW_IN_USE_KHR => {
                        sdl_pc = 17;
                        continue;
                    },
                    VK_ERROR_INVALID_SHADER_NV => {
                        sdl_pc = 18;
                        continue;
                    },
                    else => {
                        sdl_pc = 19;
                        continue;
                    },
                }
            },
            1 => {
                return undefined;
            },
            2 => {
                return "VK_ERROR_OUT_OF_HOST_MEMORY";
            },
            3 => {
                return "VK_ERROR_OUT_OF_DEVICE_MEMORY";
            },
            4 => {
                return "VK_ERROR_FRAGMENTED_POOL";
            },
            5 => {
                return "VK_ERROR_OUT_OF_POOL_MEMORY";
            },
            6 => {
                return "VK_ERROR_INITIALIZATION_FAILED";
            },
            7 => {
                return "VK_ERROR_LAYER_NOT_PRESENT";
            },
            8 => {
                return "VK_ERROR_EXTENSION_NOT_PRESENT";
            },
            9 => {
                return "VK_ERROR_FEATURE_NOT_PRESENT";
            },
            10 => {
                return "VK_ERROR_TOO_MANY_OBJECTS";
            },
            11 => {
                return "VK_ERROR_DEVICE_LOST";
            },
            12 => {
                return "VK_ERROR_INCOMPATIBLE_DRIVER";
            },
            13 => {
                return "VK_ERROR_OUT_OF_DATE_KHR";
            },
            14 => {
                return "VK_ERROR_SURFACE_LOST_KHR";
            },
            15 => {
                return "VK_ERROR_FULL_SCREEN_EXCLUSIVE_MODE_LOST_EXT";
            },
            16 => {
                return "VK_SUBOPTIMAL_KHR";
            },
            17 => {
                return "VK_ERROR_NATIVE_WINDOW_IN_USE_KHR";
            },
            18 => {
                return "VK_ERROR_INVALID_SHADER_NV";
            },
            19 => {
                return "Unhandled VkResult!";
            },
            else => unreachable,
        }
    }
}
pub fn SDLToVK_PolygonMode(renderer: [*c]VulkanRenderer, mode: SDL_GPUFillMode) callconv(.c) VkPolygonMode {
    @setEvalBranchQuota(100000);
    if (mode == @as(SDL_GPUFillMode, SDL_GPU_FILLMODE_FILL)) {
        return VK_POLYGON_MODE_FILL;
    }
    if (renderer.*.supportsFillModeNonSolid and (mode == @as(SDL_GPUFillMode, SDL_GPU_FILLMODE_LINE))) {
        return VK_POLYGON_MODE_LINE;
    }
    if (!(@as(c_int, renderer.*.fillModeOnlyWarning) != 0)) {
        SDL_LogWarn_REAL(SDL_LOG_CATEGORY_GPU, "Unsupported fill mode requested, using FILL!");
        renderer.*.fillModeOnlyWarning = 1;
    }
    return VK_POLYGON_MODE_FILL;
}
pub fn VULKAN_INTERNAL_NextHighestAlignment(n: VkDeviceSize, arg_align: VkDeviceSize) callconv(.c) VkDeviceSize {
    @setEvalBranchQuota(100000);
    var @"align" = arg_align;
    _ = &@"align";
    return @"align" *% (((n +% @"align") -% @as(VkDeviceSize, 1)) / @"align");
}
pub fn VULKAN_INTERNAL_NextHighestAlignment32(n: Uint32, arg_align: Uint32) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    var @"align" = arg_align;
    _ = &@"align";
    return @"align" *% (((n +% @"align") -% @as(Uint32, 1)) / @"align");
}
pub fn VULKAN_INTERNAL_MakeMemoryUnavailable(allocation: [*c]VulkanMemoryAllocation) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var i: Uint32 = undefined;
    _ = &i;
    var j: Uint32 = undefined;
    _ = &j;
    var freeRegion: [*c]VulkanMemoryFreeRegion = undefined;
    _ = &freeRegion;
    allocation.*.availableForAllocation = 0;
    {
        i = 0;
        while (i < allocation.*.freeRegionCount) : (i +%= 1) {
            freeRegion = allocation.*.freeRegions[i];
            if (allocation.*.allocator.*.sortedFreeRegionCount > @as(Uint32, 1)) {
                {
                    j = freeRegion.*.sortedIndex;
                    while (j < (allocation.*.allocator.*.sortedFreeRegionCount -% @as(Uint32, 1))) : (j +%= 1) {
                        allocation.*.allocator.*.sortedFreeRegions[j] = allocation.*.allocator.*.sortedFreeRegions[j +% @as(Uint32, 1)];
                        allocation.*.allocator.*.sortedFreeRegions[j].*.sortedIndex = j;
                    }
                }
            }
            allocation.*.allocator.*.sortedFreeRegionCount -%= 1;
        }
    }
}
pub fn VULKAN_INTERNAL_MarkAllocationsForDefrag(renderer: [*c]VulkanRenderer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var memoryType: Uint32 = undefined;
    _ = &memoryType;
    var allocationIndex: Uint32 = undefined;
    _ = &allocationIndex;
    var currentAllocator: [*c]VulkanMemorySubAllocator = undefined;
    _ = &currentAllocator;
    {
        memoryType = 0;
        while (memoryType < VK_MAX_MEMORY_TYPES) : (memoryType +%= 1) {
            currentAllocator = &renderer.*.memoryAllocator.*.subAllocators[memoryType];
            {
                allocationIndex = 0;
                while (allocationIndex < currentAllocator.*.allocationCount) : (allocationIndex +%= 1) {
                    if (@as(c_int, currentAllocator.*.allocations[allocationIndex].*.availableForAllocation) == @as(c_int, 1)) {
                        if (currentAllocator.*.allocations[allocationIndex].*.freeRegionCount > @as(Uint32, 1)) {
                            while (true) {
                                if ((renderer.*.allocationsToDefragCount +% @as(Uint32, 1)) >= renderer.*.allocationsToDefragCapacity) {
                                    renderer.*.allocationsToDefragCapacity = renderer.*.allocationsToDefragCapacity *% @as(Uint32, 2);
                                    renderer.*.allocationsToDefrag = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(renderer.*.allocationsToDefrag)), @sizeOf([*c]VulkanMemoryAllocation) *% @as(c_ulong, renderer.*.allocationsToDefragCapacity))));
                                }
                                if (!false) break;
                            }
                            renderer.*.allocationsToDefrag[renderer.*.allocationsToDefragCount] = currentAllocator.*.allocations[allocationIndex];
                            renderer.*.allocationsToDefragCount +%= 1;
                            VULKAN_INTERNAL_MakeMemoryUnavailable(currentAllocator.*.allocations[allocationIndex]);
                        }
                    }
                }
            }
        }
    }
}
pub fn VULKAN_INTERNAL_RemoveMemoryFreeRegion(renderer: [*c]VulkanRenderer, freeRegion: [*c]VulkanMemoryFreeRegion) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var i: Uint32 = undefined;
    _ = &i;
    SDL_LockMutex_REAL(renderer.*.allocatorLock);
    if (@as(c_int, freeRegion.*.allocation.*.availableForAllocation) != 0) {
        if (freeRegion.*.allocation.*.allocator.*.sortedFreeRegionCount > @as(Uint32, 1)) {
            {
                i = freeRegion.*.sortedIndex;
                while (i < (freeRegion.*.allocation.*.allocator.*.sortedFreeRegionCount -% @as(Uint32, 1))) : (i +%= 1) {
                    freeRegion.*.allocation.*.allocator.*.sortedFreeRegions[i] = freeRegion.*.allocation.*.allocator.*.sortedFreeRegions[i +% @as(Uint32, 1)];
                    freeRegion.*.allocation.*.allocator.*.sortedFreeRegions[i].*.sortedIndex = i;
                }
            }
        }
        freeRegion.*.allocation.*.allocator.*.sortedFreeRegionCount -%= 1;
    }
    if ((freeRegion.*.allocation.*.freeRegionCount > @as(Uint32, 1)) and (freeRegion.*.allocationIndex != (freeRegion.*.allocation.*.freeRegionCount -% @as(Uint32, 1)))) {
        freeRegion.*.allocation.*.freeRegions[freeRegion.*.allocationIndex] = freeRegion.*.allocation.*.freeRegions[freeRegion.*.allocation.*.freeRegionCount -% @as(Uint32, 1)];
        freeRegion.*.allocation.*.freeRegions[freeRegion.*.allocationIndex].*.allocationIndex = freeRegion.*.allocationIndex;
    }
    freeRegion.*.allocation.*.freeRegionCount -%= 1;
    freeRegion.*.allocation.*.freeSpace -%= freeRegion.*.size;
    SDL_free_REAL(@ptrCast(@alignCast(freeRegion)));
    SDL_UnlockMutex_REAL(renderer.*.allocatorLock);
}
pub fn VULKAN_INTERNAL_NewMemoryFreeRegion(renderer: [*c]VulkanRenderer, allocation: [*c]VulkanMemoryAllocation, offset: VkDeviceSize, size: VkDeviceSize) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var newFreeRegion: [*c]VulkanMemoryFreeRegion = undefined;
    _ = &newFreeRegion;
    var newOffset: VkDeviceSize = undefined;
    _ = &newOffset;
    var newSize: VkDeviceSize = undefined;
    _ = &newSize;
    var insertionIndex: Sint32 = 0;
    _ = &insertionIndex;
    SDL_LockMutex_REAL(renderer.*.allocatorLock);
    {
        var i: Sint32 = @bitCast(@as(c_uint, @truncate(allocation.*.freeRegionCount -% @as(Uint32, 1))));
        _ = &i;
        while (i >= @as(c_int, 0)) : (i -= 1) {
            if ((allocation.*.freeRegions[@bitCast(@as(isize, @intCast(i)))].*.offset +% allocation.*.freeRegions[@bitCast(@as(isize, @intCast(i)))].*.size) == offset) {
                newOffset = allocation.*.freeRegions[@bitCast(@as(isize, @intCast(i)))].*.offset;
                newSize = allocation.*.freeRegions[@bitCast(@as(isize, @intCast(i)))].*.size +% size;
                VULKAN_INTERNAL_RemoveMemoryFreeRegion(renderer, allocation.*.freeRegions[@bitCast(@as(isize, @intCast(i)))]);
                VULKAN_INTERNAL_NewMemoryFreeRegion(renderer, allocation, newOffset, newSize);
                SDL_UnlockMutex_REAL(renderer.*.allocatorLock);
                return;
            }
            if (allocation.*.freeRegions[@bitCast(@as(isize, @intCast(i)))].*.offset == (offset +% size)) {
                newOffset = offset;
                newSize = allocation.*.freeRegions[@bitCast(@as(isize, @intCast(i)))].*.size +% size;
                VULKAN_INTERNAL_RemoveMemoryFreeRegion(renderer, allocation.*.freeRegions[@bitCast(@as(isize, @intCast(i)))]);
                VULKAN_INTERNAL_NewMemoryFreeRegion(renderer, allocation, newOffset, newSize);
                SDL_UnlockMutex_REAL(renderer.*.allocatorLock);
                return;
            }
        }
    }
    allocation.*.freeRegionCount +%= 1;
    if (allocation.*.freeRegionCount > allocation.*.freeRegionCapacity) {
        allocation.*.freeRegionCapacity *%= 2;
        allocation.*.freeRegions = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(allocation.*.freeRegions)), @sizeOf([*c]VulkanMemoryFreeRegion) *% @as(c_ulong, allocation.*.freeRegionCapacity))));
    }
    newFreeRegion = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(VulkanMemoryFreeRegion))));
    newFreeRegion.*.offset = offset;
    newFreeRegion.*.size = size;
    newFreeRegion.*.allocation = allocation;
    allocation.*.freeSpace +%= size;
    allocation.*.freeRegions[allocation.*.freeRegionCount -% @as(Uint32, 1)] = newFreeRegion;
    newFreeRegion.*.allocationIndex = allocation.*.freeRegionCount -% @as(Uint32, 1);
    if (@as(c_int, allocation.*.availableForAllocation) != 0) {
        {
            var i: Uint32 = 0;
            _ = &i;
            while (i < allocation.*.allocator.*.sortedFreeRegionCount) : (i +%= 1) {
                if (allocation.*.allocator.*.sortedFreeRegions[i].*.size < size) {
                    break;
                }
                insertionIndex += 1;
            }
        }
        if ((allocation.*.allocator.*.sortedFreeRegionCount +% @as(Uint32, 1)) > allocation.*.allocator.*.sortedFreeRegionCapacity) {
            allocation.*.allocator.*.sortedFreeRegionCapacity *%= 2;
            allocation.*.allocator.*.sortedFreeRegions = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(allocation.*.allocator.*.sortedFreeRegions)), @sizeOf([*c]VulkanMemoryFreeRegion) *% @as(c_ulong, allocation.*.allocator.*.sortedFreeRegionCapacity))));
        }
        if ((allocation.*.allocator.*.sortedFreeRegionCount > @as(Uint32, 0)) and (@as(Uint32, @bitCast(@as(c_int, insertionIndex))) != allocation.*.allocator.*.sortedFreeRegionCount)) {
            {
                var i: Sint32 = @bitCast(@as(c_uint, @truncate(allocation.*.allocator.*.sortedFreeRegionCount)));
                _ = &i;
                while ((i > insertionIndex) and (i > @as(c_int, 0))) : (i -= 1) {
                    allocation.*.allocator.*.sortedFreeRegions[@bitCast(@as(isize, @intCast(i)))] = allocation.*.allocator.*.sortedFreeRegions[@bitCast(@as(isize, @intCast(i - @as(c_int, 1))))];
                    allocation.*.allocator.*.sortedFreeRegions[@bitCast(@as(isize, @intCast(i)))].*.sortedIndex = @bitCast(@as(c_int, i));
                }
            }
        }
        allocation.*.allocator.*.sortedFreeRegionCount +%= 1;
        allocation.*.allocator.*.sortedFreeRegions[@bitCast(@as(isize, @intCast(insertionIndex)))] = newFreeRegion;
        newFreeRegion.*.sortedIndex = @bitCast(@as(c_int, insertionIndex));
    }
    SDL_UnlockMutex_REAL(renderer.*.allocatorLock);
}
pub fn VULKAN_INTERNAL_NewMemoryUsedRegion(renderer: [*c]VulkanRenderer, allocation: [*c]VulkanMemoryAllocation, offset: VkDeviceSize, size: VkDeviceSize, resourceOffset: VkDeviceSize, resourceSize: VkDeviceSize, alignment: VkDeviceSize) callconv(.c) [*c]VulkanMemoryUsedRegion {
    @setEvalBranchQuota(100000);
    var memoryUsedRegion: [*c]VulkanMemoryUsedRegion = undefined;
    _ = &memoryUsedRegion;
    SDL_LockMutex_REAL(renderer.*.allocatorLock);
    if (allocation.*.usedRegionCount == allocation.*.usedRegionCapacity) {
        allocation.*.usedRegionCapacity *%= 2;
        allocation.*.usedRegions = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(allocation.*.usedRegions)), @as(c_ulong, allocation.*.usedRegionCapacity) *% @sizeOf([*c]VulkanMemoryUsedRegion))));
    }
    memoryUsedRegion = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(VulkanMemoryUsedRegion))));
    memoryUsedRegion.*.allocation = allocation;
    memoryUsedRegion.*.offset = offset;
    memoryUsedRegion.*.size = size;
    memoryUsedRegion.*.resourceOffset = resourceOffset;
    memoryUsedRegion.*.resourceSize = resourceSize;
    memoryUsedRegion.*.alignment = alignment;
    allocation.*.usedSpace +%= size;
    allocation.*.usedRegions[allocation.*.usedRegionCount] = memoryUsedRegion;
    allocation.*.usedRegionCount +%= 1;
    SDL_UnlockMutex_REAL(renderer.*.allocatorLock);
    return memoryUsedRegion;
}
pub fn VULKAN_INTERNAL_RemoveMemoryUsedRegion(renderer: [*c]VulkanRenderer, usedRegion: [*c]VulkanMemoryUsedRegion) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var i: Uint32 = undefined;
    _ = &i;
    SDL_LockMutex_REAL(renderer.*.allocatorLock);
    {
        i = 0;
        while (i < usedRegion.*.allocation.*.usedRegionCount) : (i +%= 1) {
            if (usedRegion.*.allocation.*.usedRegions[i] == usedRegion) {
                if (i != (usedRegion.*.allocation.*.usedRegionCount -% @as(Uint32, 1))) {
                    usedRegion.*.allocation.*.usedRegions[i] = usedRegion.*.allocation.*.usedRegions[usedRegion.*.allocation.*.usedRegionCount -% @as(Uint32, 1)];
                }
                break;
            }
        }
    }
    usedRegion.*.allocation.*.usedSpace -%= usedRegion.*.size;
    usedRegion.*.allocation.*.usedRegionCount -%= 1;
    VULKAN_INTERNAL_NewMemoryFreeRegion(renderer, usedRegion.*.allocation, usedRegion.*.offset, usedRegion.*.size);
    if (usedRegion.*.allocation.*.usedRegionCount == @as(Uint32, 0)) {
        renderer.*.checkEmptyAllocations = @"true" != 0;
    }
    SDL_free_REAL(@ptrCast(@alignCast(usedRegion)));
    SDL_UnlockMutex_REAL(renderer.*.allocatorLock);
}
pub fn VULKAN_INTERNAL_CheckMemoryTypeArrayUnique(memoryTypeIndex: Uint32, memoryTypeIndexArray: [*c]const Uint32, count: Uint32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var i: Uint32 = 0;
    _ = &i;
    {
        i = 0;
        while (i < count) : (i +%= 1) {
            if (memoryTypeIndexArray[i] == memoryTypeIndex) {
                return @"false" != 0;
            }
        }
    }
    return @"true" != 0;
}
pub fn VULKAN_INTERNAL_FindBestMemoryTypes(renderer: [*c]VulkanRenderer, typeFilter: Uint32, arg_requiredProperties: VkMemoryPropertyFlags, arg_preferredProperties: VkMemoryPropertyFlags, arg_tolerableProperties: VkMemoryPropertyFlags, pCount: [*c]Uint32) callconv(.c) [*c]Uint32 {
    @setEvalBranchQuota(100000);
    var requiredProperties = arg_requiredProperties;
    _ = &requiredProperties;
    var preferredProperties = arg_preferredProperties;
    _ = &preferredProperties;
    var tolerableProperties = arg_tolerableProperties;
    _ = &tolerableProperties;
    var i: Uint32 = undefined;
    _ = &i;
    var index_1: Uint32 = 0;
    _ = &index_1;
    var result: [*c]Uint32 = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(Uint32) *% @as(c_ulong, renderer.*.memoryProperties.memoryTypeCount))));
    _ = &result;
    {
        i = 0;
        while (i < renderer.*.memoryProperties.memoryTypeCount) : (i +%= 1) {
            if (((((typeFilter & (@as(Uint32, 1) << @intCast(i))) != 0) and (@as(Uint32, @bitCast(@as(c_int, @intFromBool((renderer.*.memoryProperties.memoryTypes[i].propertyFlags & requiredProperties) == requiredProperties)))) != 0)) and ((renderer.*.memoryProperties.memoryTypes[i].propertyFlags & preferredProperties) == preferredProperties)) and ((renderer.*.memoryProperties.memoryTypes[i].propertyFlags & tolerableProperties) == @as(VkMemoryPropertyFlags, 0))) {
                if (VULKAN_INTERNAL_CheckMemoryTypeArrayUnique(i, result, index_1)) {
                    result[index_1] = i;
                    index_1 +%= 1;
                }
            }
        }
    }
    {
        i = 0;
        while (i < renderer.*.memoryProperties.memoryTypeCount) : (i +%= 1) {
            if (((((typeFilter & (@as(Uint32, 1) << @intCast(i))) != 0) and (@as(Uint32, @bitCast(@as(c_int, @intFromBool((renderer.*.memoryProperties.memoryTypes[i].propertyFlags & requiredProperties) == requiredProperties)))) != 0)) and ((renderer.*.memoryProperties.memoryTypes[i].propertyFlags & preferredProperties) == @as(VkMemoryPropertyFlags, 0))) and ((renderer.*.memoryProperties.memoryTypes[i].propertyFlags & tolerableProperties) == @as(VkMemoryPropertyFlags, 0))) {
                if (VULKAN_INTERNAL_CheckMemoryTypeArrayUnique(i, result, index_1)) {
                    result[index_1] = i;
                    index_1 +%= 1;
                }
            }
        }
    }
    {
        i = 0;
        while (i < renderer.*.memoryProperties.memoryTypeCount) : (i +%= 1) {
            if (((((typeFilter & (@as(Uint32, 1) << @intCast(i))) != 0) and (@as(Uint32, @bitCast(@as(c_int, @intFromBool((renderer.*.memoryProperties.memoryTypes[i].propertyFlags & requiredProperties) == requiredProperties)))) != 0)) and ((renderer.*.memoryProperties.memoryTypes[i].propertyFlags & preferredProperties) == preferredProperties)) and ((renderer.*.memoryProperties.memoryTypes[i].propertyFlags & tolerableProperties) == tolerableProperties)) {
                if (VULKAN_INTERNAL_CheckMemoryTypeArrayUnique(i, result, index_1)) {
                    result[index_1] = i;
                    index_1 +%= 1;
                }
            }
        }
    }
    {
        i = 0;
        while (i < renderer.*.memoryProperties.memoryTypeCount) : (i +%= 1) {
            if (((((typeFilter & (@as(Uint32, 1) << @intCast(i))) != 0) and (@as(Uint32, @bitCast(@as(c_int, @intFromBool((renderer.*.memoryProperties.memoryTypes[i].propertyFlags & requiredProperties) == requiredProperties)))) != 0)) and ((renderer.*.memoryProperties.memoryTypes[i].propertyFlags & preferredProperties) == @as(VkMemoryPropertyFlags, 0))) and ((renderer.*.memoryProperties.memoryTypes[i].propertyFlags & tolerableProperties) == tolerableProperties)) {
                if (VULKAN_INTERNAL_CheckMemoryTypeArrayUnique(i, result, index_1)) {
                    result[index_1] = i;
                    index_1 +%= 1;
                }
            }
        }
    }
    pCount.* = index_1;
    return result;
}
pub fn VULKAN_INTERNAL_FindBestBufferMemoryTypes(renderer: [*c]VulkanRenderer, buffer: VkBuffer, requiredMemoryProperties: VkMemoryPropertyFlags, preferredMemoryProperties: VkMemoryPropertyFlags, tolerableMemoryProperties: VkMemoryPropertyFlags, pMemoryRequirements: [*c]VkMemoryRequirements, pCount: [*c]Uint32) callconv(.c) [*c]Uint32 {
    @setEvalBranchQuota(100000);
    renderer.*.vkGetBufferMemoryRequirements.?(renderer.*.logicalDevice, buffer, pMemoryRequirements);
    return VULKAN_INTERNAL_FindBestMemoryTypes(renderer, pMemoryRequirements.*.memoryTypeBits, requiredMemoryProperties, preferredMemoryProperties, tolerableMemoryProperties, pCount);
}
pub fn VULKAN_INTERNAL_FindBestImageMemoryTypes(renderer: [*c]VulkanRenderer, image: VkImage, preferredMemoryPropertyFlags: VkMemoryPropertyFlags, pMemoryRequirements: [*c]VkMemoryRequirements, pCount: [*c]Uint32) callconv(.c) [*c]Uint32 {
    @setEvalBranchQuota(100000);
    renderer.*.vkGetImageMemoryRequirements.?(renderer.*.logicalDevice, image, pMemoryRequirements);
    return VULKAN_INTERNAL_FindBestMemoryTypes(renderer, pMemoryRequirements.*.memoryTypeBits, 0, preferredMemoryPropertyFlags, 0, pCount);
}
pub fn VULKAN_INTERNAL_DeallocateMemory(renderer: [*c]VulkanRenderer, allocator: [*c]VulkanMemorySubAllocator, allocationIndex: Uint32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var i: Uint32 = undefined;
    _ = &i;
    var allocation: [*c]VulkanMemoryAllocation = allocator.*.allocations[allocationIndex];
    _ = &allocation;
    SDL_LockMutex_REAL(renderer.*.allocatorLock);
    {
        i = 0;
        while (i < renderer.*.allocationsToDefragCount) : (i +%= 1) {
            if (allocation == renderer.*.allocationsToDefrag[i]) {
                renderer.*.allocationsToDefrag[i] = renderer.*.allocationsToDefrag[renderer.*.allocationsToDefragCount -% @as(Uint32, 1)];
                renderer.*.allocationsToDefragCount -%= 1;
                break;
            }
        }
    }
    {
        i = 0;
        while (i < allocation.*.freeRegionCount) : (i +%= 1) {
            VULKAN_INTERNAL_RemoveMemoryFreeRegion(renderer, allocation.*.freeRegions[i]);
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(allocation.*.freeRegions)));
    SDL_free_REAL(@ptrCast(@alignCast(allocation.*.usedRegions)));
    renderer.*.vkFreeMemory.?(renderer.*.logicalDevice, allocation.*.memory, null);
    SDL_DestroyMutex_REAL(allocation.*.memoryLock);
    SDL_free_REAL(@ptrCast(@alignCast(allocation)));
    if (allocationIndex != (allocator.*.allocationCount -% @as(Uint32, 1))) {
        allocator.*.allocations[allocationIndex] = allocator.*.allocations[allocator.*.allocationCount -% @as(Uint32, 1)];
    }
    allocator.*.allocationCount -%= 1;
    SDL_UnlockMutex_REAL(renderer.*.allocatorLock);
}
pub fn VULKAN_INTERNAL_AllocateMemory(renderer: [*c]VulkanRenderer, memoryTypeIndex: Uint32, allocationSize: VkDeviceSize, isHostVisible: Uint8, pMemoryAllocation: [*c][*c]VulkanMemoryAllocation) callconv(.c) Uint8 {
    @setEvalBranchQuota(100000);
    var allocation: [*c]VulkanMemoryAllocation = undefined;
    _ = &allocation;
    var allocator: [*c]VulkanMemorySubAllocator = &renderer.*.memoryAllocator.*.subAllocators[memoryTypeIndex];
    _ = &allocator;
    var allocInfo: VkMemoryAllocateInfo = undefined;
    _ = &allocInfo;
    var result: VkResult = undefined;
    _ = &result;
    allocInfo.sType = VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO;
    allocInfo.pNext = null;
    allocInfo.memoryTypeIndex = memoryTypeIndex;
    allocInfo.allocationSize = allocationSize;
    allocation = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(VulkanMemoryAllocation))));
    allocation.*.size = allocationSize;
    allocation.*.freeSpace = 0;
    allocation.*.usedSpace = 0;
    allocation.*.memoryLock = SDL_CreateMutex_REAL();
    allocator.*.allocationCount +%= 1;
    allocator.*.allocations = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(allocator.*.allocations)), @sizeOf([*c]VulkanMemoryAllocation) *% @as(c_ulong, allocator.*.allocationCount))));
    allocator.*.allocations[allocator.*.allocationCount -% @as(Uint32, 1)] = allocation;
    allocInfo.pNext = null;
    allocation.*.availableForAllocation = 1;
    allocation.*.usedRegions = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf([*c]VulkanMemoryUsedRegion))));
    allocation.*.usedRegionCount = 0;
    allocation.*.usedRegionCapacity = 1;
    allocation.*.freeRegions = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf([*c]VulkanMemoryFreeRegion))));
    allocation.*.freeRegionCount = 0;
    allocation.*.freeRegionCapacity = 1;
    _ = SDL_SetAtomicInt_REAL(&allocation.*.referenceCount, 0);
    allocation.*.allocator = allocator;
    result = renderer.*.vkAllocateMemory.?(renderer.*.logicalDevice, &allocInfo, null, &allocation.*.memory);
    if (result != VK_SUCCESS) {
        SDL_free_REAL(@ptrCast(@alignCast(allocation.*.freeRegions)));
        allocator.*.allocationCount -%= 1;
        allocator.*.allocations = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(allocator.*.allocations)), @sizeOf([*c]VulkanMemoryAllocation) *% @as(c_ulong, allocator.*.allocationCount))));
        SDL_free_REAL(@ptrCast(@alignCast(allocation)));
        return 0;
    }
    if (@as(c_int, isHostVisible) != 0) {
        result = renderer.*.vkMapMemory.?(renderer.*.logicalDevice, allocation.*.memory, 0, @truncate(~@as(c_ulonglong, 0)), 0, @ptrCast(@alignCast(&allocation.*.mapPointer)));
        while (true) {
            if (result != VK_SUCCESS) {
                if (renderer.*.debugMode) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkMapMemory"))), VkErrorMessages(result));
                }
                _ = SDL_SetError_REAL("%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkMapMemory"))), VkErrorMessages(result));
                return @bitCast(@as(i8, @truncate(@as(c_int, 0))));
            }
            if (!false) break;
        }
    } else {
        allocation.*.mapPointer = null;
    }
    VULKAN_INTERNAL_NewMemoryFreeRegion(renderer, allocation, 0, allocation.*.size);
    pMemoryAllocation.* = allocation;
    return 1;
}
pub fn VULKAN_INTERNAL_BindBufferMemory(renderer: [*c]VulkanRenderer, usedRegion: [*c]VulkanMemoryUsedRegion, alignedOffset: VkDeviceSize, buffer: VkBuffer) callconv(.c) Uint8 {
    @setEvalBranchQuota(100000);
    var vulkanResult: VkResult = undefined;
    _ = &vulkanResult;
    SDL_LockMutex_REAL(usedRegion.*.allocation.*.memoryLock);
    vulkanResult = renderer.*.vkBindBufferMemory.?(renderer.*.logicalDevice, buffer, usedRegion.*.allocation.*.memory, alignedOffset);
    SDL_UnlockMutex_REAL(usedRegion.*.allocation.*.memoryLock);
    while (true) {
        if (vulkanResult != VK_SUCCESS) {
            if (renderer.*.debugMode) {
                SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkBindBufferMemory"))), VkErrorMessages(vulkanResult));
            }
            _ = SDL_SetError_REAL("%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkBindBufferMemory"))), VkErrorMessages(vulkanResult));
            return @bitCast(@as(i8, @truncate(@as(c_int, 0))));
        }
        if (!false) break;
    }
    return 1;
}
pub fn VULKAN_INTERNAL_BindImageMemory(renderer: [*c]VulkanRenderer, usedRegion: [*c]VulkanMemoryUsedRegion, alignedOffset: VkDeviceSize, image: VkImage) callconv(.c) Uint8 {
    @setEvalBranchQuota(100000);
    var vulkanResult: VkResult = undefined;
    _ = &vulkanResult;
    SDL_LockMutex_REAL(usedRegion.*.allocation.*.memoryLock);
    vulkanResult = renderer.*.vkBindImageMemory.?(renderer.*.logicalDevice, image, usedRegion.*.allocation.*.memory, alignedOffset);
    SDL_UnlockMutex_REAL(usedRegion.*.allocation.*.memoryLock);
    while (true) {
        if (vulkanResult != VK_SUCCESS) {
            if (renderer.*.debugMode) {
                SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkBindImageMemory"))), VkErrorMessages(vulkanResult));
            }
            _ = SDL_SetError_REAL("%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkBindImageMemory"))), VkErrorMessages(vulkanResult));
            return @bitCast(@as(i8, @truncate(@as(c_int, 0))));
        }
        if (!false) break;
    }
    return 1;
}
pub fn VULKAN_INTERNAL_BindResourceMemory(renderer: [*c]VulkanRenderer, memoryTypeIndex: Uint32, memoryRequirements: [*c]VkMemoryRequirements, resourceSize: VkDeviceSize, dedicated: bool, buffer: VkBuffer, image: VkImage, pMemoryUsedRegion: [*c][*c]VulkanMemoryUsedRegion) callconv(.c) Uint8 {
    @setEvalBranchQuota(100000);
    var allocation: [*c]VulkanMemoryAllocation = undefined;
    _ = &allocation;
    var allocator: [*c]VulkanMemorySubAllocator = undefined;
    _ = &allocator;
    var region: [*c]VulkanMemoryFreeRegion = undefined;
    _ = &region;
    var selectedRegion: [*c]VulkanMemoryFreeRegion = undefined;
    _ = &selectedRegion;
    var usedRegion: [*c]VulkanMemoryUsedRegion = undefined;
    _ = &usedRegion;
    var requiredSize: VkDeviceSize = undefined;
    _ = &requiredSize;
    var allocationSize: VkDeviceSize = undefined;
    _ = &allocationSize;
    var alignedOffset: VkDeviceSize = 0;
    _ = &alignedOffset;
    var newRegionSize: VkDeviceSize = undefined;
    _ = &newRegionSize;
    var newRegionOffset: VkDeviceSize = undefined;
    _ = &newRegionOffset;
    var isHostVisible: Uint8 = undefined;
    _ = &isHostVisible;
    var smallAllocation: Uint8 = undefined;
    _ = &smallAllocation;
    var allocationResult: Uint8 = undefined;
    _ = &allocationResult;
    var i: Sint32 = undefined;
    _ = &i;
    isHostVisible = @bitCast(@as(i8, @intFromBool((renderer.*.memoryProperties.memoryTypes[memoryTypeIndex].propertyFlags & @as(VkMemoryPropertyFlags, VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT)) != @as(VkMemoryPropertyFlags, 0))));
    allocator = &renderer.*.memoryAllocator.*.subAllocators[memoryTypeIndex];
    requiredSize = memoryRequirements.*.size;
    smallAllocation = @bitCast(@as(i8, @intFromBool(requiredSize <= @as(VkDeviceSize, SMALL_ALLOCATION_THRESHOLD))));
    if (((@as(?*anyopaque, @ptrCast(@alignCast(buffer))) == @as(?*anyopaque, null)) and (@as(?*anyopaque, @ptrCast(@alignCast(image))) == @as(?*anyopaque, null))) or ((@as(?*anyopaque, @ptrCast(@alignCast(buffer))) != @as(?*anyopaque, null)) and (@as(?*anyopaque, @ptrCast(@alignCast(image))) != @as(?*anyopaque, null)))) {
        SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "BindResourceMemory must be given either a VulkanBuffer or a VulkanTexture");
        return 0;
    }
    SDL_LockMutex_REAL(renderer.*.allocatorLock);
    selectedRegion = null;
    if (dedicated) {
        allocationSize = requiredSize;
    } else {
        {
            i = @bitCast(@as(c_uint, @truncate(allocator.*.sortedFreeRegionCount -% @as(Uint32, 1))));
            while (i >= @as(c_int, 0)) : (i -= 1) {
                region = allocator.*.sortedFreeRegions[@bitCast(@as(isize, @intCast(i)))];
                if ((@as(c_int, smallAllocation) != 0) and (region.*.allocation.*.size != @as(VkDeviceSize, SMALL_ALLOCATION_SIZE))) {
                    continue;
                }
                if (!(@as(c_int, smallAllocation) != 0) and (region.*.allocation.*.size == @as(VkDeviceSize, SMALL_ALLOCATION_SIZE))) {
                    continue;
                }
                alignedOffset = VULKAN_INTERNAL_NextHighestAlignment(region.*.offset, memoryRequirements.*.alignment);
                if ((alignedOffset +% requiredSize) <= (region.*.offset +% region.*.size)) {
                    selectedRegion = region;
                    break;
                }
            }
        }
        if (@as(?*anyopaque, @ptrCast(@alignCast(selectedRegion))) != @as(?*anyopaque, null)) {
            region = selectedRegion;
            allocation = region.*.allocation;
            usedRegion = VULKAN_INTERNAL_NewMemoryUsedRegion(renderer, allocation, region.*.offset, requiredSize +% (alignedOffset -% region.*.offset), alignedOffset, resourceSize, memoryRequirements.*.alignment);
            usedRegion.*.isBuffer = @bitCast(@as(i8, @intFromBool(@as(?*anyopaque, @ptrCast(@alignCast(buffer))) != @as(?*anyopaque, null))));
            newRegionSize = region.*.size -% ((alignedOffset -% region.*.offset) +% requiredSize);
            newRegionOffset = alignedOffset +% requiredSize;
            VULKAN_INTERNAL_RemoveMemoryFreeRegion(renderer, region);
            if (newRegionSize != @as(VkDeviceSize, 0)) {
                VULKAN_INTERNAL_NewMemoryFreeRegion(renderer, allocation, newRegionOffset, newRegionSize);
            }
            SDL_UnlockMutex_REAL(renderer.*.allocatorLock);
            if (@as(?*anyopaque, @ptrCast(@alignCast(buffer))) != @as(?*anyopaque, null)) {
                if (!(@as(c_int, VULKAN_INTERNAL_BindBufferMemory(renderer, usedRegion, alignedOffset, buffer)) != 0)) {
                    VULKAN_INTERNAL_RemoveMemoryUsedRegion(renderer, usedRegion);
                    return 0;
                }
            } else if (@as(?*anyopaque, @ptrCast(@alignCast(image))) != @as(?*anyopaque, null)) {
                if (!(@as(c_int, VULKAN_INTERNAL_BindImageMemory(renderer, usedRegion, alignedOffset, image)) != 0)) {
                    VULKAN_INTERNAL_RemoveMemoryUsedRegion(renderer, usedRegion);
                    return 0;
                }
            }
            pMemoryUsedRegion.* = usedRegion;
            return 1;
        }
        if ((renderer.*.allocationsToDefragCount == @as(Uint32, 0)) and !(@as(c_int, renderer.*.defragInProgress) != 0)) {
            VULKAN_INTERNAL_MarkAllocationsForDefrag(renderer);
        }
        if (requiredSize > @as(VkDeviceSize, SMALL_ALLOCATION_THRESHOLD)) {
            allocationSize = VULKAN_INTERNAL_NextHighestAlignment(requiredSize, LARGE_ALLOCATION_INCREMENT);
        } else {
            allocationSize = SMALL_ALLOCATION_SIZE;
        }
    }
    allocationResult = VULKAN_INTERNAL_AllocateMemory(renderer, memoryTypeIndex, allocationSize, isHostVisible, &allocation);
    if (@as(c_int, allocationResult) == @as(c_int, 0)) {
        SDL_UnlockMutex_REAL(renderer.*.allocatorLock);
        return 2;
    }
    usedRegion = VULKAN_INTERNAL_NewMemoryUsedRegion(renderer, allocation, 0, requiredSize, 0, resourceSize, memoryRequirements.*.alignment);
    usedRegion.*.isBuffer = @bitCast(@as(i8, @intFromBool(@as(?*anyopaque, @ptrCast(@alignCast(buffer))) != @as(?*anyopaque, null))));
    region = allocation.*.freeRegions[@as(c_int, 0)];
    newRegionOffset = region.*.offset +% requiredSize;
    newRegionSize = region.*.size -% requiredSize;
    VULKAN_INTERNAL_RemoveMemoryFreeRegion(renderer, region);
    if (newRegionSize != @as(VkDeviceSize, 0)) {
        VULKAN_INTERNAL_NewMemoryFreeRegion(renderer, allocation, newRegionOffset, newRegionSize);
    }
    SDL_UnlockMutex_REAL(renderer.*.allocatorLock);
    if (@as(?*anyopaque, @ptrCast(@alignCast(buffer))) != @as(?*anyopaque, null)) {
        if (!(@as(c_int, VULKAN_INTERNAL_BindBufferMemory(renderer, usedRegion, 0, buffer)) != 0)) {
            VULKAN_INTERNAL_RemoveMemoryUsedRegion(renderer, usedRegion);
            return 0;
        }
    } else if (@as(?*anyopaque, @ptrCast(@alignCast(image))) != @as(?*anyopaque, null)) {
        if (!(@as(c_int, VULKAN_INTERNAL_BindImageMemory(renderer, usedRegion, 0, image)) != 0)) {
            VULKAN_INTERNAL_RemoveMemoryUsedRegion(renderer, usedRegion);
            return 0;
        }
    }
    pMemoryUsedRegion.* = usedRegion;
    return 1;
}
pub fn VULKAN_INTERNAL_BindMemoryForImage(renderer: [*c]VulkanRenderer, image: VkImage, usedRegion: [*c][*c]VulkanMemoryUsedRegion) callconv(.c) Uint8 {
    @setEvalBranchQuota(100000);
    var bindResult: Uint8 = 0;
    _ = &bindResult;
    var memoryTypeCount: Uint32 = 0;
    _ = &memoryTypeCount;
    var memoryTypesToTry: [*c]Uint32 = null;
    _ = &memoryTypesToTry;
    var selectedMemoryTypeIndex: Uint32 = 0;
    _ = &selectedMemoryTypeIndex;
    var i: Uint32 = undefined;
    _ = &i;
    var preferredMemoryPropertyFlags: VkMemoryPropertyFlags = undefined;
    _ = &preferredMemoryPropertyFlags;
    var memoryRequirements: VkMemoryRequirements = undefined;
    _ = &memoryRequirements;
    preferredMemoryPropertyFlags = VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT;
    memoryTypesToTry = VULKAN_INTERNAL_FindBestImageMemoryTypes(renderer, image, preferredMemoryPropertyFlags, &memoryRequirements, &memoryTypeCount);
    {
        i = 0;
        while (i < memoryTypeCount) : (i +%= 1) {
            bindResult = VULKAN_INTERNAL_BindResourceMemory(renderer, memoryTypesToTry[i], &memoryRequirements, memoryRequirements.size, @"false" != 0, null, image, usedRegion);
            if (@as(c_int, bindResult) == @as(c_int, 1)) {
                selectedMemoryTypeIndex = memoryTypesToTry[i];
                break;
            }
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(memoryTypesToTry)));
    if (@as(c_int, bindResult) == @as(c_int, 1)) {
        if (!(@as(c_int, renderer.*.outOfDeviceLocalMemoryWarning) != 0)) {
            if ((renderer.*.memoryProperties.memoryTypes[selectedMemoryTypeIndex].propertyFlags & @as(VkMemoryPropertyFlags, VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT)) == @as(VkMemoryPropertyFlags, 0)) {
                SDL_LogWarn_REAL(SDL_LOG_CATEGORY_GPU, "Out of device-local memory, allocating textures on host-local memory!");
                renderer.*.outOfDeviceLocalMemoryWarning = 1;
            }
        }
    }
    return bindResult;
}
pub fn VULKAN_INTERNAL_BindMemoryForBuffer(renderer: [*c]VulkanRenderer, buffer: VkBuffer, size: VkDeviceSize, arg_type: VulkanBufferType, dedicated: bool, usedRegion: [*c][*c]VulkanMemoryUsedRegion) callconv(.c) Uint8 {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var bindResult: Uint8 = 0;
    _ = &bindResult;
    var memoryTypeCount: Uint32 = 0;
    _ = &memoryTypeCount;
    var memoryTypesToTry: [*c]Uint32 = null;
    _ = &memoryTypesToTry;
    var selectedMemoryTypeIndex: Uint32 = 0;
    _ = &selectedMemoryTypeIndex;
    var i: Uint32 = undefined;
    _ = &i;
    var requiredMemoryPropertyFlags: VkMemoryPropertyFlags = 0;
    _ = &requiredMemoryPropertyFlags;
    var preferredMemoryPropertyFlags: VkMemoryPropertyFlags = 0;
    _ = &preferredMemoryPropertyFlags;
    var tolerableMemoryPropertyFlags: VkMemoryPropertyFlags = 0;
    _ = &tolerableMemoryPropertyFlags;
    var memoryRequirements: VkMemoryRequirements = undefined;
    _ = &memoryRequirements;
    if (@"type" == @as(VulkanBufferType, VULKAN_BUFFER_TYPE_GPU)) {
        preferredMemoryPropertyFlags |= VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT;
    } else if (@"type" == @as(VulkanBufferType, VULKAN_BUFFER_TYPE_UNIFORM)) {
        requiredMemoryPropertyFlags |= @bitCast(@as(c_int, VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT | VK_MEMORY_PROPERTY_HOST_COHERENT_BIT));
        preferredMemoryPropertyFlags |= VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT;
    } else if (@"type" == @as(VulkanBufferType, VULKAN_BUFFER_TYPE_TRANSFER)) {
        requiredMemoryPropertyFlags |= @bitCast(@as(c_int, VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT | VK_MEMORY_PROPERTY_HOST_COHERENT_BIT));
        preferredMemoryPropertyFlags |= VK_MEMORY_PROPERTY_HOST_CACHED_BIT;
        tolerableMemoryPropertyFlags |= VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT;
    } else {
        SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "Unrecognized buffer type!");
        return 0;
    }
    memoryTypesToTry = VULKAN_INTERNAL_FindBestBufferMemoryTypes(renderer, buffer, requiredMemoryPropertyFlags, preferredMemoryPropertyFlags, tolerableMemoryPropertyFlags, &memoryRequirements, &memoryTypeCount);
    {
        i = 0;
        while (i < memoryTypeCount) : (i +%= 1) {
            bindResult = VULKAN_INTERNAL_BindResourceMemory(renderer, memoryTypesToTry[i], &memoryRequirements, size, dedicated, buffer, null, usedRegion);
            if (@as(c_int, bindResult) == @as(c_int, 1)) {
                selectedMemoryTypeIndex = memoryTypesToTry[i];
                break;
            }
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(memoryTypesToTry)));
    if (@as(c_int, bindResult) == @as(c_int, 1)) {
        if (@"type" == @as(VulkanBufferType, VULKAN_BUFFER_TYPE_GPU)) {
            if (!(@as(c_int, renderer.*.outOfDeviceLocalMemoryWarning) != 0)) {
                if ((renderer.*.memoryProperties.memoryTypes[selectedMemoryTypeIndex].propertyFlags & @as(VkMemoryPropertyFlags, VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT)) == @as(VkMemoryPropertyFlags, 0)) {
                    SDL_LogWarn_REAL(SDL_LOG_CATEGORY_GPU, "Out of device-local memory, allocating buffers on host-local memory, expect degraded performance!");
                    renderer.*.outOfDeviceLocalMemoryWarning = 1;
                }
            }
        } else if (@"type" == @as(VulkanBufferType, VULKAN_BUFFER_TYPE_UNIFORM)) {
            if (!(@as(c_int, renderer.*.outofBARMemoryWarning) != 0)) {
                if ((renderer.*.memoryProperties.memoryTypes[selectedMemoryTypeIndex].propertyFlags & @as(VkMemoryPropertyFlags, VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT)) == @as(VkMemoryPropertyFlags, 0)) {
                    SDL_LogWarn_REAL(SDL_LOG_CATEGORY_GPU, "Out of BAR memory, allocating uniform buffers on host-local memory, expect degraded performance!");
                    renderer.*.outofBARMemoryWarning = 1;
                }
            }
        } else if (@"type" == @as(VulkanBufferType, VULKAN_BUFFER_TYPE_TRANSFER)) {
            if (!(@as(c_int, renderer.*.integratedMemoryNotification) != 0)) {
                if ((renderer.*.memoryProperties.memoryTypes[selectedMemoryTypeIndex].propertyFlags & @as(VkMemoryPropertyFlags, VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT)) == @as(VkMemoryPropertyFlags, VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT)) {
                    SDL_LogInfo_REAL(SDL_LOG_CATEGORY_GPU, "Integrated memory detected, allocating TransferBuffers on device-local memory!");
                    renderer.*.integratedMemoryNotification = 1;
                }
            }
        }
    }
    return bindResult;
}
pub fn VULKAN_INTERNAL_TrackBuffer(commandBuffer: [*c]VulkanCommandBuffer, buffer: [*c]VulkanBuffer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    {
        var i: Sint32 = commandBuffer.*.usedBufferCount - @as(c_int, 1);
        _ = &i;
        while (i >= @as(c_int, 0)) : (i -= 1) {
            if (commandBuffer.*.usedBuffers[@bitCast(@as(isize, @intCast(i)))] == buffer) {
                return;
            }
        }
    }
    if (commandBuffer.*.usedBufferCount == commandBuffer.*.usedBufferCapacity) {
        commandBuffer.*.usedBufferCapacity += 1;
        commandBuffer.*.usedBuffers = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(commandBuffer.*.usedBuffers)), @as(c_ulong, @bitCast(@as(c_long, commandBuffer.*.usedBufferCapacity))) *% @sizeOf([*c]VulkanBuffer))));
    }
    commandBuffer.*.usedBuffers[@bitCast(@as(isize, @intCast(commandBuffer.*.usedBufferCount)))] = buffer;
    commandBuffer.*.usedBufferCount += 1;
    _ = SDL_AddAtomicInt_REAL(&buffer.*.referenceCount, 1);
}
pub fn VULKAN_INTERNAL_TrackBufferTransfer(commandBuffer: [*c]VulkanCommandBuffer, buffer: [*c]VulkanBuffer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    {
        var i: Sint32 = commandBuffer.*.buffersUsedInPendingTransfersCount - @as(c_int, 1);
        _ = &i;
        while (i >= @as(c_int, 0)) : (i -= 1) {
            if (commandBuffer.*.buffersUsedInPendingTransfers[@bitCast(@as(isize, @intCast(i)))] == buffer) {
                return;
            }
        }
    }
    if (commandBuffer.*.buffersUsedInPendingTransfersCount == commandBuffer.*.buffersUsedInPendingTransfersCapacity) {
        commandBuffer.*.buffersUsedInPendingTransfersCapacity += 1;
        commandBuffer.*.buffersUsedInPendingTransfers = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(commandBuffer.*.buffersUsedInPendingTransfers)), @as(c_ulong, @bitCast(@as(c_long, commandBuffer.*.buffersUsedInPendingTransfersCapacity))) *% @sizeOf([*c]VulkanBuffer))));
    }
    commandBuffer.*.buffersUsedInPendingTransfers[@bitCast(@as(isize, @intCast(commandBuffer.*.buffersUsedInPendingTransfersCount)))] = buffer;
    commandBuffer.*.buffersUsedInPendingTransfersCount += 1;
    _ = SDL_AddAtomicInt_REAL(&buffer.*.usedRegion.*.allocation.*.referenceCount, 1);
}
pub fn VULKAN_INTERNAL_TrackTexture(commandBuffer: [*c]VulkanCommandBuffer, texture: [*c]VulkanTexture) callconv(.c) void {
    @setEvalBranchQuota(100000);
    {
        var i: Sint32 = commandBuffer.*.usedTextureCount - @as(c_int, 1);
        _ = &i;
        while (i >= @as(c_int, 0)) : (i -= 1) {
            if (commandBuffer.*.usedTextures[@bitCast(@as(isize, @intCast(i)))] == texture) {
                return;
            }
        }
    }
    if (commandBuffer.*.usedTextureCount == commandBuffer.*.usedTextureCapacity) {
        commandBuffer.*.usedTextureCapacity += 1;
        commandBuffer.*.usedTextures = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(commandBuffer.*.usedTextures)), @as(c_ulong, @bitCast(@as(c_long, commandBuffer.*.usedTextureCapacity))) *% @sizeOf([*c]VulkanTexture))));
    }
    commandBuffer.*.usedTextures[@bitCast(@as(isize, @intCast(commandBuffer.*.usedTextureCount)))] = texture;
    commandBuffer.*.usedTextureCount += 1;
    _ = SDL_AddAtomicInt_REAL(&texture.*.referenceCount, 1);
}
pub fn VULKAN_INTERNAL_TrackTextureTransfer(commandBuffer: [*c]VulkanCommandBuffer, texture: [*c]VulkanTexture) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (@as(?*anyopaque, @ptrCast(@alignCast(texture.*.usedRegion))) == @as(?*anyopaque, null)) {
        return;
    }
    {
        var i: Sint32 = commandBuffer.*.texturesUsedInPendingTransfersCount - @as(c_int, 1);
        _ = &i;
        while (i >= @as(c_int, 0)) : (i -= 1) {
            if (commandBuffer.*.texturesUsedInPendingTransfers[@bitCast(@as(isize, @intCast(i)))] == texture) {
                return;
            }
        }
    }
    if (commandBuffer.*.texturesUsedInPendingTransfersCount == commandBuffer.*.texturesUsedInPendingTransfersCapacity) {
        commandBuffer.*.texturesUsedInPendingTransfersCapacity += 1;
        commandBuffer.*.texturesUsedInPendingTransfers = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(commandBuffer.*.texturesUsedInPendingTransfers)), @as(c_ulong, @bitCast(@as(c_long, commandBuffer.*.texturesUsedInPendingTransfersCapacity))) *% @sizeOf([*c]VulkanTexture))));
    }
    commandBuffer.*.texturesUsedInPendingTransfers[@bitCast(@as(isize, @intCast(commandBuffer.*.texturesUsedInPendingTransfersCount)))] = texture;
    commandBuffer.*.texturesUsedInPendingTransfersCount += 1;
    _ = SDL_AddAtomicInt_REAL(&texture.*.usedRegion.*.allocation.*.referenceCount, 1);
}
pub fn VULKAN_INTERNAL_TrackSampler(commandBuffer: [*c]VulkanCommandBuffer, sampler: [*c]VulkanSampler) callconv(.c) void {
    @setEvalBranchQuota(100000);
    {
        var i: Sint32 = commandBuffer.*.usedSamplerCount - @as(c_int, 1);
        _ = &i;
        while (i >= @as(c_int, 0)) : (i -= 1) {
            if (commandBuffer.*.usedSamplers[@bitCast(@as(isize, @intCast(i)))] == sampler) {
                return;
            }
        }
    }
    if (commandBuffer.*.usedSamplerCount == commandBuffer.*.usedSamplerCapacity) {
        commandBuffer.*.usedSamplerCapacity += 1;
        commandBuffer.*.usedSamplers = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(commandBuffer.*.usedSamplers)), @as(c_ulong, @bitCast(@as(c_long, commandBuffer.*.usedSamplerCapacity))) *% @sizeOf([*c]VulkanSampler))));
    }
    commandBuffer.*.usedSamplers[@bitCast(@as(isize, @intCast(commandBuffer.*.usedSamplerCount)))] = sampler;
    commandBuffer.*.usedSamplerCount += 1;
    _ = SDL_AddAtomicInt_REAL(&sampler.*.referenceCount, 1);
}
pub fn VULKAN_INTERNAL_TrackGraphicsPipeline(commandBuffer: [*c]VulkanCommandBuffer, graphicsPipeline: [*c]VulkanGraphicsPipeline) callconv(.c) void {
    @setEvalBranchQuota(100000);
    {
        var i: Sint32 = commandBuffer.*.usedGraphicsPipelineCount - @as(c_int, 1);
        _ = &i;
        while (i >= @as(c_int, 0)) : (i -= 1) {
            if (commandBuffer.*.usedGraphicsPipelines[@bitCast(@as(isize, @intCast(i)))] == graphicsPipeline) {
                return;
            }
        }
    }
    if (commandBuffer.*.usedGraphicsPipelineCount == commandBuffer.*.usedGraphicsPipelineCapacity) {
        commandBuffer.*.usedGraphicsPipelineCapacity += 1;
        commandBuffer.*.usedGraphicsPipelines = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(commandBuffer.*.usedGraphicsPipelines)), @as(c_ulong, @bitCast(@as(c_long, commandBuffer.*.usedGraphicsPipelineCapacity))) *% @sizeOf([*c]VulkanGraphicsPipeline))));
    }
    commandBuffer.*.usedGraphicsPipelines[@bitCast(@as(isize, @intCast(commandBuffer.*.usedGraphicsPipelineCount)))] = graphicsPipeline;
    commandBuffer.*.usedGraphicsPipelineCount += 1;
    _ = SDL_AddAtomicInt_REAL(&graphicsPipeline.*.referenceCount, 1);
}
pub fn VULKAN_INTERNAL_TrackComputePipeline(commandBuffer: [*c]VulkanCommandBuffer, computePipeline: [*c]VulkanComputePipeline) callconv(.c) void {
    @setEvalBranchQuota(100000);
    {
        var i: Sint32 = commandBuffer.*.usedComputePipelineCount - @as(c_int, 1);
        _ = &i;
        while (i >= @as(c_int, 0)) : (i -= 1) {
            if (commandBuffer.*.usedComputePipelines[@bitCast(@as(isize, @intCast(i)))] == computePipeline) {
                return;
            }
        }
    }
    if (commandBuffer.*.usedComputePipelineCount == commandBuffer.*.usedComputePipelineCapacity) {
        commandBuffer.*.usedComputePipelineCapacity += 1;
        commandBuffer.*.usedComputePipelines = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(commandBuffer.*.usedComputePipelines)), @as(c_ulong, @bitCast(@as(c_long, commandBuffer.*.usedComputePipelineCapacity))) *% @sizeOf([*c]VulkanComputePipeline))));
    }
    commandBuffer.*.usedComputePipelines[@bitCast(@as(isize, @intCast(commandBuffer.*.usedComputePipelineCount)))] = computePipeline;
    commandBuffer.*.usedComputePipelineCount += 1;
    _ = SDL_AddAtomicInt_REAL(&computePipeline.*.referenceCount, 1);
}
pub fn VULKAN_INTERNAL_TrackFramebuffer(commandBuffer: [*c]VulkanCommandBuffer, framebuffer: [*c]VulkanFramebuffer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    {
        var i: Sint32 = commandBuffer.*.usedFramebufferCount - @as(c_int, 1);
        _ = &i;
        while (i >= @as(c_int, 0)) : (i -= 1) {
            if (commandBuffer.*.usedFramebuffers[@bitCast(@as(isize, @intCast(i)))] == framebuffer) {
                return;
            }
        }
    }
    if (commandBuffer.*.usedFramebufferCount == commandBuffer.*.usedFramebufferCapacity) {
        commandBuffer.*.usedFramebufferCapacity += 1;
        commandBuffer.*.usedFramebuffers = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(commandBuffer.*.usedFramebuffers)), @as(c_ulong, @bitCast(@as(c_long, commandBuffer.*.usedFramebufferCapacity))) *% @sizeOf([*c]VulkanFramebuffer))));
    }
    commandBuffer.*.usedFramebuffers[@bitCast(@as(isize, @intCast(commandBuffer.*.usedFramebufferCount)))] = framebuffer;
    commandBuffer.*.usedFramebufferCount += 1;
    _ = SDL_AddAtomicInt_REAL(&framebuffer.*.referenceCount, 1);
}
pub fn VULKAN_INTERNAL_TrackUniformBuffer(commandBuffer: [*c]VulkanCommandBuffer, uniformBuffer: [*c]VulkanUniformBuffer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    {
        var i: Sint32 = commandBuffer.*.usedUniformBufferCount - @as(c_int, 1);
        _ = &i;
        while (i >= @as(c_int, 0)) : (i -= 1) {
            if (commandBuffer.*.usedUniformBuffers[@bitCast(@as(isize, @intCast(i)))] == uniformBuffer) {
                return;
            }
        }
    }
    if (commandBuffer.*.usedUniformBufferCount == commandBuffer.*.usedUniformBufferCapacity) {
        commandBuffer.*.usedUniformBufferCapacity += 1;
        commandBuffer.*.usedUniformBuffers = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(commandBuffer.*.usedUniformBuffers)), @as(c_ulong, @bitCast(@as(c_long, commandBuffer.*.usedUniformBufferCapacity))) *% @sizeOf([*c]VulkanUniformBuffer))));
    }
    commandBuffer.*.usedUniformBuffers[@bitCast(@as(isize, @intCast(commandBuffer.*.usedUniformBufferCount)))] = uniformBuffer;
    commandBuffer.*.usedUniformBufferCount += 1;
    VULKAN_INTERNAL_TrackBuffer(commandBuffer, uniformBuffer.*.buffer);
}
pub fn VULKAN_INTERNAL_SetMemoryBarrierFlags(usageModeFlags: VulkanBufferUsageModeFlags, stageFlags: [*c]VkPipelineStageFlags, accessMask: [*c]VkAccessFlags) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if ((usageModeFlags & (@as(c_uint, 1) << @intCast(@as(c_uint, 2)))) != 0) {
        stageFlags.* |= VK_PIPELINE_STAGE_VERTEX_INPUT_BIT;
        accessMask.* |= VK_ACCESS_VERTEX_ATTRIBUTE_READ_BIT;
    }
    if ((usageModeFlags & (@as(c_uint, 1) << @intCast(@as(c_uint, 3)))) != 0) {
        stageFlags.* |= VK_PIPELINE_STAGE_VERTEX_INPUT_BIT;
        accessMask.* |= VK_ACCESS_INDEX_READ_BIT;
    }
    if ((usageModeFlags & (@as(c_uint, 1) << @intCast(@as(c_uint, 4)))) != 0) {
        stageFlags.* |= VK_PIPELINE_STAGE_DRAW_INDIRECT_BIT;
        accessMask.* |= VK_ACCESS_INDIRECT_COMMAND_READ_BIT;
    }
    if ((usageModeFlags & (@as(c_uint, 1) << @intCast(@as(c_uint, 5)))) != 0) {
        stageFlags.* |= @bitCast(@as(c_int, VK_PIPELINE_STAGE_VERTEX_SHADER_BIT | VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT));
        accessMask.* |= VK_ACCESS_SHADER_READ_BIT;
    }
    if ((usageModeFlags & (@as(c_uint, 1) << @intCast(@as(c_uint, 6)))) != 0) {
        stageFlags.* |= VK_PIPELINE_STAGE_COMPUTE_SHADER_BIT;
        accessMask.* |= VK_ACCESS_SHADER_READ_BIT;
    }
    if ((usageModeFlags & (@as(c_uint, 1) << @intCast(@as(c_uint, 0)))) != 0) {
        stageFlags.* |= VK_PIPELINE_STAGE_TRANSFER_BIT;
        accessMask.* |= VK_ACCESS_TRANSFER_READ_BIT;
    }
    if ((usageModeFlags & (@as(c_uint, 1) << @intCast(@as(c_uint, 1)))) != 0) {
        stageFlags.* |= VK_PIPELINE_STAGE_TRANSFER_BIT;
        accessMask.* |= VK_ACCESS_TRANSFER_WRITE_BIT;
    }
    if ((usageModeFlags & (@as(c_uint, 1) << @intCast(@as(c_uint, 7)))) != 0) {
        stageFlags.* |= VK_PIPELINE_STAGE_COMPUTE_SHADER_BIT;
        accessMask.* |= @bitCast(@as(c_int, VK_ACCESS_SHADER_READ_BIT | VK_ACCESS_SHADER_WRITE_BIT));
    }
}
pub fn VULKAN_INTERNAL_BufferMemoryBarrier(renderer: [*c]VulkanRenderer, commandBuffer: [*c]VulkanCommandBuffer, sourceUsageMode: VulkanBufferUsageModeFlags, destinationUsageMode: VulkanBufferUsageModeFlags, buffer: [*c]VulkanBuffer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var srcStages: VkPipelineStageFlags = 0;
    _ = &srcStages;
    var dstStages: VkPipelineStageFlags = 0;
    _ = &dstStages;
    var memoryBarrier: VkBufferMemoryBarrier = undefined;
    _ = &memoryBarrier;
    memoryBarrier.sType = VK_STRUCTURE_TYPE_BUFFER_MEMORY_BARRIER;
    memoryBarrier.pNext = null;
    memoryBarrier.srcAccessMask = 0;
    memoryBarrier.dstAccessMask = 0;
    memoryBarrier.srcQueueFamilyIndex = ~@as(c_uint, 0);
    memoryBarrier.dstQueueFamilyIndex = ~@as(c_uint, 0);
    memoryBarrier.buffer = buffer.*.buffer;
    memoryBarrier.offset = 0;
    memoryBarrier.size = buffer.*.size;
    VULKAN_INTERNAL_SetMemoryBarrierFlags(sourceUsageMode, &srcStages, &memoryBarrier.srcAccessMask);
    VULKAN_INTERNAL_SetMemoryBarrierFlags(destinationUsageMode, &dstStages, &memoryBarrier.dstAccessMask);
    renderer.*.vkCmdPipelineBarrier.?(commandBuffer.*.commandBuffer, srcStages, dstStages, 0, 0, null, 1, &memoryBarrier, 0, null);
    buffer.*.transitioned = @"true" != 0;
}
pub fn VULKAN_INTERNAL_TextureMemoryBarrier(renderer: [*c]VulkanRenderer, commandBuffer: [*c]VulkanCommandBuffer, sourceUsageMode: VulkanTextureUsageMode, destinationUsageMode: VulkanTextureUsageMode, baseLevel: Uint32, levelCount: Uint32, baseLayer: Uint32, layerCount: Uint32, texture: [*c]VulkanTexture) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var srcStages: VkPipelineStageFlags = 0;
    _ = &srcStages;
    var dstStages: VkPipelineStageFlags = 0;
    _ = &dstStages;
    var memoryBarrier: VkImageMemoryBarrier = undefined;
    _ = &memoryBarrier;
    memoryBarrier.sType = VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER;
    memoryBarrier.pNext = null;
    memoryBarrier.srcAccessMask = 0;
    memoryBarrier.dstAccessMask = 0;
    memoryBarrier.oldLayout = VK_IMAGE_LAYOUT_UNDEFINED;
    memoryBarrier.newLayout = VK_IMAGE_LAYOUT_UNDEFINED;
    memoryBarrier.srcQueueFamilyIndex = ~@as(c_uint, 0);
    memoryBarrier.dstQueueFamilyIndex = ~@as(c_uint, 0);
    memoryBarrier.image = texture.*.image;
    memoryBarrier.subresourceRange.aspectMask = texture.*.aspectFlags;
    memoryBarrier.subresourceRange.baseMipLevel = baseLevel;
    memoryBarrier.subresourceRange.levelCount = levelCount;
    memoryBarrier.subresourceRange.baseArrayLayer = baseLayer;
    memoryBarrier.subresourceRange.layerCount = layerCount;
    if (sourceUsageMode == @as(VulkanTextureUsageMode, VULKAN_TEXTURE_USAGE_MODE_UNINITIALIZED)) {
        srcStages = VK_PIPELINE_STAGE_TOP_OF_PIPE_BIT;
        memoryBarrier.srcAccessMask = 0;
        memoryBarrier.oldLayout = VK_IMAGE_LAYOUT_UNDEFINED;
    } else if (sourceUsageMode == @as(VulkanTextureUsageMode, VULKAN_TEXTURE_USAGE_MODE_COPY_SOURCE)) {
        srcStages = VK_PIPELINE_STAGE_TRANSFER_BIT;
        memoryBarrier.srcAccessMask = VK_ACCESS_TRANSFER_READ_BIT;
        memoryBarrier.oldLayout = VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL;
    } else if (sourceUsageMode == @as(VulkanTextureUsageMode, VULKAN_TEXTURE_USAGE_MODE_COPY_DESTINATION)) {
        srcStages = VK_PIPELINE_STAGE_TRANSFER_BIT;
        memoryBarrier.srcAccessMask = VK_ACCESS_TRANSFER_WRITE_BIT;
        memoryBarrier.oldLayout = VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL;
    } else if (sourceUsageMode == @as(VulkanTextureUsageMode, VULKAN_TEXTURE_USAGE_MODE_SAMPLER)) {
        srcStages = @bitCast(@as(c_int, VK_PIPELINE_STAGE_VERTEX_SHADER_BIT | VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT));
        memoryBarrier.srcAccessMask = VK_ACCESS_SHADER_READ_BIT;
        memoryBarrier.oldLayout = VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL;
    } else if (sourceUsageMode == @as(VulkanTextureUsageMode, VULKAN_TEXTURE_USAGE_MODE_GRAPHICS_STORAGE_READ)) {
        srcStages = @bitCast(@as(c_int, VK_PIPELINE_STAGE_VERTEX_SHADER_BIT | VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT));
        memoryBarrier.srcAccessMask = VK_ACCESS_SHADER_READ_BIT;
        memoryBarrier.oldLayout = VK_IMAGE_LAYOUT_GENERAL;
    } else if (sourceUsageMode == @as(VulkanTextureUsageMode, VULKAN_TEXTURE_USAGE_MODE_COMPUTE_STORAGE_READ)) {
        srcStages = VK_PIPELINE_STAGE_COMPUTE_SHADER_BIT;
        memoryBarrier.srcAccessMask = VK_ACCESS_SHADER_READ_BIT;
        memoryBarrier.oldLayout = VK_IMAGE_LAYOUT_GENERAL;
    } else if (sourceUsageMode == @as(VulkanTextureUsageMode, VULKAN_TEXTURE_USAGE_MODE_COMPUTE_STORAGE_READ_WRITE)) {
        srcStages = VK_PIPELINE_STAGE_COMPUTE_SHADER_BIT;
        memoryBarrier.srcAccessMask = @bitCast(@as(c_int, VK_ACCESS_SHADER_READ_BIT | VK_ACCESS_SHADER_WRITE_BIT));
        memoryBarrier.oldLayout = VK_IMAGE_LAYOUT_GENERAL;
    } else if (sourceUsageMode == @as(VulkanTextureUsageMode, VULKAN_TEXTURE_USAGE_MODE_COLOR_ATTACHMENT)) {
        srcStages = VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT;
        memoryBarrier.srcAccessMask = VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT;
        memoryBarrier.oldLayout = VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL;
    } else if (sourceUsageMode == @as(VulkanTextureUsageMode, VULKAN_TEXTURE_USAGE_MODE_DEPTH_STENCIL_ATTACHMENT)) {
        srcStages = @bitCast(@as(c_int, VK_PIPELINE_STAGE_EARLY_FRAGMENT_TESTS_BIT | VK_PIPELINE_STAGE_LATE_FRAGMENT_TESTS_BIT));
        memoryBarrier.srcAccessMask = VK_ACCESS_DEPTH_STENCIL_ATTACHMENT_WRITE_BIT;
        memoryBarrier.oldLayout = VK_IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL;
    } else {
        SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "Unrecognized texture source barrier type!");
        return;
    }
    if (destinationUsageMode == @as(VulkanTextureUsageMode, VULKAN_TEXTURE_USAGE_MODE_COPY_SOURCE)) {
        dstStages = VK_PIPELINE_STAGE_TRANSFER_BIT;
        memoryBarrier.dstAccessMask = VK_ACCESS_TRANSFER_READ_BIT;
        memoryBarrier.newLayout = VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL;
    } else if (destinationUsageMode == @as(VulkanTextureUsageMode, VULKAN_TEXTURE_USAGE_MODE_COPY_DESTINATION)) {
        dstStages = VK_PIPELINE_STAGE_TRANSFER_BIT;
        memoryBarrier.dstAccessMask = VK_ACCESS_TRANSFER_WRITE_BIT;
        memoryBarrier.newLayout = VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL;
    } else if (destinationUsageMode == @as(VulkanTextureUsageMode, VULKAN_TEXTURE_USAGE_MODE_SAMPLER)) {
        dstStages = @bitCast(@as(c_int, VK_PIPELINE_STAGE_VERTEX_SHADER_BIT | VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT));
        memoryBarrier.dstAccessMask = VK_ACCESS_SHADER_READ_BIT;
        memoryBarrier.newLayout = VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL;
    } else if (destinationUsageMode == @as(VulkanTextureUsageMode, VULKAN_TEXTURE_USAGE_MODE_GRAPHICS_STORAGE_READ)) {
        dstStages = @bitCast(@as(c_int, VK_PIPELINE_STAGE_VERTEX_SHADER_BIT | VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT));
        memoryBarrier.dstAccessMask = VK_ACCESS_SHADER_READ_BIT;
        memoryBarrier.newLayout = VK_IMAGE_LAYOUT_GENERAL;
    } else if (destinationUsageMode == @as(VulkanTextureUsageMode, VULKAN_TEXTURE_USAGE_MODE_COMPUTE_STORAGE_READ)) {
        dstStages = VK_PIPELINE_STAGE_COMPUTE_SHADER_BIT;
        memoryBarrier.dstAccessMask = VK_ACCESS_SHADER_READ_BIT;
        memoryBarrier.newLayout = VK_IMAGE_LAYOUT_GENERAL;
    } else if (destinationUsageMode == @as(VulkanTextureUsageMode, VULKAN_TEXTURE_USAGE_MODE_COMPUTE_STORAGE_READ_WRITE)) {
        dstStages = VK_PIPELINE_STAGE_COMPUTE_SHADER_BIT;
        memoryBarrier.dstAccessMask = @bitCast(@as(c_int, VK_ACCESS_SHADER_READ_BIT | VK_ACCESS_SHADER_WRITE_BIT));
        memoryBarrier.newLayout = VK_IMAGE_LAYOUT_GENERAL;
    } else if (destinationUsageMode == @as(VulkanTextureUsageMode, VULKAN_TEXTURE_USAGE_MODE_COLOR_ATTACHMENT)) {
        dstStages = VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT;
        memoryBarrier.dstAccessMask = @bitCast(@as(c_int, VK_ACCESS_COLOR_ATTACHMENT_READ_BIT | VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT));
        memoryBarrier.newLayout = VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL;
    } else if (destinationUsageMode == @as(VulkanTextureUsageMode, VULKAN_TEXTURE_USAGE_MODE_DEPTH_STENCIL_ATTACHMENT)) {
        dstStages = @bitCast(@as(c_int, VK_PIPELINE_STAGE_EARLY_FRAGMENT_TESTS_BIT | VK_PIPELINE_STAGE_LATE_FRAGMENT_TESTS_BIT));
        memoryBarrier.dstAccessMask = @bitCast(@as(c_int, VK_ACCESS_DEPTH_STENCIL_ATTACHMENT_READ_BIT | VK_ACCESS_DEPTH_STENCIL_ATTACHMENT_WRITE_BIT));
        memoryBarrier.newLayout = VK_IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL;
    } else if (destinationUsageMode == @as(VulkanTextureUsageMode, VULKAN_TEXTURE_USAGE_MODE_PRESENT)) {
        dstStages = VK_PIPELINE_STAGE_BOTTOM_OF_PIPE_BIT;
        memoryBarrier.dstAccessMask = 0;
        memoryBarrier.newLayout = VK_IMAGE_LAYOUT_PRESENT_SRC_KHR;
    } else {
        SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "Unrecognized texture destination barrier type!");
        return;
    }
    renderer.*.vkCmdPipelineBarrier.?(commandBuffer.*.commandBuffer, srcStages, dstStages, 0, 0, null, 0, null, 1, &memoryBarrier);
}
pub fn VULKAN_INTERNAL_FullTextureMemoryBarrier(renderer: [*c]VulkanRenderer, commandBuffer: [*c]VulkanCommandBuffer, sourceUsageMode: VulkanTextureUsageMode, destinationUsageMode: VulkanTextureUsageMode, texture: [*c]VulkanTexture) callconv(.c) void {
    @setEvalBranchQuota(100000);
    VULKAN_INTERNAL_TextureMemoryBarrier(renderer, commandBuffer, sourceUsageMode, destinationUsageMode, 0, texture.*.levelCount, 0, texture.*.layerCount, texture);
}
pub fn VULKAN_INTERNAL_TextureSubresourceMemoryBarrier(renderer: [*c]VulkanRenderer, commandBuffer: [*c]VulkanCommandBuffer, sourceUsageMode: VulkanTextureUsageMode, destinationUsageMode: VulkanTextureUsageMode, textureSubresource: [*c]VulkanTextureSubresource) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var layerCount: Uint32 = 1;
    _ = &layerCount;
    if (textureSubresource.*.parent.*.type == @as(SDL_GPUTextureType, SDL_GPU_TEXTURETYPE_3D)) {
        layerCount = ~@as(c_uint, 0);
    }
    VULKAN_INTERNAL_TextureMemoryBarrier(renderer, commandBuffer, sourceUsageMode, destinationUsageMode, textureSubresource.*.level, 1, textureSubresource.*.layer, layerCount, textureSubresource.*.parent);
}
pub fn VULKAN_INTERNAL_DefaultBufferUsageMode(buffer: [*c]VulkanBuffer) callconv(.c) VulkanBufferUsageModeFlags {
    @setEvalBranchQuota(100000);
    var flags: VulkanBufferUsageModeFlags = 0;
    _ = &flags;
    if ((buffer.*.usage & (@as(c_uint, 1) << @intCast(@as(c_uint, 0)))) != 0) {
        flags |= @as(c_uint, 1) << @intCast(@as(c_uint, 2));
    }
    if ((buffer.*.usage & (@as(c_uint, 1) << @intCast(@as(c_uint, 1)))) != 0) {
        flags |= @as(c_uint, 1) << @intCast(@as(c_uint, 3));
    }
    if ((buffer.*.usage & (@as(c_uint, 1) << @intCast(@as(c_uint, 2)))) != 0) {
        flags |= @as(c_uint, 1) << @intCast(@as(c_uint, 4));
    }
    if ((buffer.*.usage & (@as(c_uint, 1) << @intCast(@as(c_uint, 3)))) != 0) {
        flags |= @as(c_uint, 1) << @intCast(@as(c_uint, 5));
    }
    if ((buffer.*.usage & (@as(c_uint, 1) << @intCast(@as(c_uint, 4)))) != 0) {
        flags |= @as(c_uint, 1) << @intCast(@as(c_uint, 6));
    }
    if ((@as(SDL_GPUBufferUsageFlags, @bitCast(@as(c_int, @intFromBool(!(flags != 0))))) != 0) and ((buffer.*.usage & (@as(c_uint, 1) << @intCast(@as(c_uint, 5)))) != 0)) {
        flags = @as(c_uint, 1) << @intCast(@as(c_uint, 7));
    }
    if (!(flags != 0)) {
        SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "Buffer has no default usage mode!");
        return @as(c_uint, 1) << @intCast(@as(c_uint, 2));
    }
    return flags;
}
pub fn VULKAN_INTERNAL_DefaultTextureUsageMode(texture: [*c]VulkanTexture) callconv(.c) VulkanTextureUsageMode {
    @setEvalBranchQuota(100000);
    if ((texture.*.usage & (@as(c_uint, 1) << @intCast(@as(c_uint, 0)))) != 0) {
        return VULKAN_TEXTURE_USAGE_MODE_SAMPLER;
    } else if ((texture.*.usage & (@as(c_uint, 1) << @intCast(@as(c_uint, 3)))) != 0) {
        return VULKAN_TEXTURE_USAGE_MODE_GRAPHICS_STORAGE_READ;
    } else if ((texture.*.usage & (@as(c_uint, 1) << @intCast(@as(c_uint, 1)))) != 0) {
        return VULKAN_TEXTURE_USAGE_MODE_COLOR_ATTACHMENT;
    } else if ((texture.*.usage & (@as(c_uint, 1) << @intCast(@as(c_uint, 2)))) != 0) {
        return VULKAN_TEXTURE_USAGE_MODE_DEPTH_STENCIL_ATTACHMENT;
    } else if ((texture.*.usage & (@as(c_uint, 1) << @intCast(@as(c_uint, 4)))) != 0) {
        return VULKAN_TEXTURE_USAGE_MODE_COMPUTE_STORAGE_READ;
    } else if ((texture.*.usage & (@as(c_uint, 1) << @intCast(@as(c_uint, 5)))) != 0) {
        return VULKAN_TEXTURE_USAGE_MODE_COMPUTE_STORAGE_READ_WRITE;
    } else if ((texture.*.usage & (@as(c_uint, 1) << @intCast(@as(c_uint, 6)))) != 0) {
        return VULKAN_TEXTURE_USAGE_MODE_COMPUTE_STORAGE_READ_WRITE;
    } else {
        SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "Texture has no default usage mode!");
        return VULKAN_TEXTURE_USAGE_MODE_SAMPLER;
    }
}
pub fn VULKAN_INTERNAL_BufferTransitionFromDefaultUsage(renderer: [*c]VulkanRenderer, commandBuffer: [*c]VulkanCommandBuffer, destinationUsageMode: VulkanBufferUsageModeFlags, buffer: [*c]VulkanBuffer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    VULKAN_INTERNAL_BufferMemoryBarrier(renderer, commandBuffer, VULKAN_INTERNAL_DefaultBufferUsageMode(buffer), destinationUsageMode, buffer);
}
pub fn VULKAN_INTERNAL_BufferTransitionToDefaultUsage(renderer: [*c]VulkanRenderer, commandBuffer: [*c]VulkanCommandBuffer, sourceUsageMode: VulkanBufferUsageModeFlags, buffer: [*c]VulkanBuffer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    VULKAN_INTERNAL_BufferMemoryBarrier(renderer, commandBuffer, sourceUsageMode, VULKAN_INTERNAL_DefaultBufferUsageMode(buffer), buffer);
}
pub fn VULKAN_INTERNAL_TextureSubresourceTransitionFromDefaultUsage(renderer: [*c]VulkanRenderer, commandBuffer: [*c]VulkanCommandBuffer, destinationUsageMode: VulkanTextureUsageMode, textureSubresource: [*c]VulkanTextureSubresource) callconv(.c) void {
    @setEvalBranchQuota(100000);
    VULKAN_INTERNAL_TextureSubresourceMemoryBarrier(renderer, commandBuffer, VULKAN_INTERNAL_DefaultTextureUsageMode(textureSubresource.*.parent), destinationUsageMode, textureSubresource);
}
pub fn VULKAN_INTERNAL_TextureTransitionFromDefaultUsage(renderer: [*c]VulkanRenderer, commandBuffer: [*c]VulkanCommandBuffer, destinationUsageMode: VulkanTextureUsageMode, texture: [*c]VulkanTexture) callconv(.c) void {
    @setEvalBranchQuota(100000);
    VULKAN_INTERNAL_FullTextureMemoryBarrier(renderer, commandBuffer, VULKAN_INTERNAL_DefaultTextureUsageMode(texture), destinationUsageMode, texture);
}
pub fn VULKAN_INTERNAL_TextureSubresourceTransitionToDefaultUsage(renderer: [*c]VulkanRenderer, commandBuffer: [*c]VulkanCommandBuffer, sourceUsageMode: VulkanTextureUsageMode, textureSubresource: [*c]VulkanTextureSubresource) callconv(.c) void {
    @setEvalBranchQuota(100000);
    VULKAN_INTERNAL_TextureSubresourceMemoryBarrier(renderer, commandBuffer, sourceUsageMode, VULKAN_INTERNAL_DefaultTextureUsageMode(textureSubresource.*.parent), textureSubresource);
}
pub fn VULKAN_INTERNAL_TextureTransitionToDefaultUsage(renderer: [*c]VulkanRenderer, commandBuffer: [*c]VulkanCommandBuffer, sourceUsageMode: VulkanTextureUsageMode, texture: [*c]VulkanTexture) callconv(.c) void {
    @setEvalBranchQuota(100000);
    VULKAN_INTERNAL_FullTextureMemoryBarrier(renderer, commandBuffer, sourceUsageMode, VULKAN_INTERNAL_DefaultTextureUsageMode(texture), texture);
}
pub fn VULKAN_INTERNAL_ReleaseFramebuffer(renderer: [*c]VulkanRenderer, framebuffer: [*c]VulkanFramebuffer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_LockMutex_REAL(renderer.*.disposeLock);
    while (true) {
        if ((renderer.*.framebuffersToDestroyCount +% @as(Uint32, 1)) >= renderer.*.framebuffersToDestroyCapacity) {
            renderer.*.framebuffersToDestroyCapacity = renderer.*.framebuffersToDestroyCapacity *% @as(Uint32, 2);
            renderer.*.framebuffersToDestroy = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(renderer.*.framebuffersToDestroy)), @sizeOf([*c]VulkanFramebuffer) *% @as(c_ulong, renderer.*.framebuffersToDestroyCapacity))));
        }
        if (!false) break;
    }
    renderer.*.framebuffersToDestroy[renderer.*.framebuffersToDestroyCount] = framebuffer;
    renderer.*.framebuffersToDestroyCount +%= 1;
    SDL_UnlockMutex_REAL(renderer.*.disposeLock);
}
pub fn VULKAN_INTERNAL_DestroyFramebuffer(renderer: [*c]VulkanRenderer, framebuffer: [*c]VulkanFramebuffer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    renderer.*.vkDestroyFramebuffer.?(renderer.*.logicalDevice, framebuffer.*.framebuffer, null);
    SDL_free_REAL(@ptrCast(@alignCast(framebuffer)));
}
pub const struct_CheckOneFramebufferForRemovalData = extern struct {
    keysToRemoveCapacity: Uint32 = 0,
    keysToRemoveCount: Uint32 = 0,
    keysToRemove: [*c][*c]FramebufferHashTableKey = null,
    view: VkImageView = null,
};
pub const CheckOneFramebufferForRemovalData = struct_CheckOneFramebufferForRemovalData;
pub fn CheckOneFramebufferForRemoval(userdata: ?*anyopaque, _: ?*const SDL_HashTable, vkey: ?*const anyopaque, _: ?*const anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]CheckOneFramebufferForRemovalData = @ptrCast(@alignCast(userdata));
    _ = &data;
    var key: [*c]FramebufferHashTableKey = @ptrCast(@alignCast(@constCast(vkey)));
    _ = &key;
    var view: VkImageView = data.*.view;
    _ = &view;
    var remove_1: bool = @"false" != 0;
    _ = &remove_1;
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < key.*.numColorTargets) : (i +%= 1) {
            if (key.*.colorAttachmentViews[i] == view) {
                remove_1 = @"true" != 0;
            }
        }
    }
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < key.*.numResolveAttachments) : (i +%= 1) {
            if (key.*.resolveAttachmentViews[i] == view) {
                remove_1 = @"true" != 0;
            }
        }
    }
    if (key.*.depthStencilAttachmentView == view) {
        remove_1 = @"true" != 0;
    }
    if (remove_1) {
        if (data.*.keysToRemoveCount == data.*.keysToRemoveCapacity) {
            data.*.keysToRemoveCapacity *%= 2;
            var ptr: ?*anyopaque = SDL_realloc_REAL(@ptrCast(@alignCast(data.*.keysToRemove)), @as(c_ulong, data.*.keysToRemoveCapacity) *% @sizeOf([*c]FramebufferHashTableKey));
            _ = &ptr;
            if (!(ptr != null)) {
                return @"false" != 0;
            }
            data.*.keysToRemove = @ptrCast(@alignCast(ptr));
        }
        data.*.keysToRemove[data.*.keysToRemoveCount] = key;
        data.*.keysToRemoveCount +%= 1;
    }
    return @"true" != 0;
}
pub fn VULKAN_INTERNAL_RemoveFramebuffersContainingView(renderer: [*c]VulkanRenderer, view: VkImageView) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var data: CheckOneFramebufferForRemovalData = CheckOneFramebufferForRemovalData{
        .keysToRemoveCapacity = 8,
        .keysToRemoveCount = 0,
        .keysToRemove = null,
        .view = view,
    };
    _ = &data;
    data.keysToRemove = @ptrCast(@alignCast(SDL_malloc_REAL(@as(c_ulong, data.keysToRemoveCapacity) *% @sizeOf([*c]FramebufferHashTableKey))));
    if (!(data.keysToRemove != null)) {
        return;
    }
    SDL_LockMutex_REAL(renderer.*.framebufferFetchLock);
    _ = SDL_IterateHashTable(renderer.*.framebufferHashTable, CheckOneFramebufferForRemoval, @ptrCast(@alignCast(&data)));
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < data.keysToRemoveCount) : (i +%= 1) {
            _ = SDL_RemoveFromHashTable(renderer.*.framebufferHashTable, @ptrCast(@alignCast(data.keysToRemove[i])));
        }
    }
    SDL_UnlockMutex_REAL(renderer.*.framebufferFetchLock);
    SDL_free_REAL(@ptrCast(@alignCast(data.keysToRemove)));
}
pub fn VULKAN_INTERNAL_DestroyTexture(renderer: [*c]VulkanRenderer, texture: [*c]VulkanTexture) callconv(.c) void {
    @setEvalBranchQuota(100000);
    {
        var subresourceIndex: Uint32 = 0;
        _ = &subresourceIndex;
        while (subresourceIndex < texture.*.subresourceCount) : (subresourceIndex +%= 1) {
            if (@as(?*anyopaque, @ptrCast(@alignCast(texture.*.subresources[subresourceIndex].renderTargetViews))) != @as(?*anyopaque, null)) {
                {
                    var depthIndex: Uint32 = 0;
                    _ = &depthIndex;
                    while (depthIndex < texture.*.depth) : (depthIndex +%= 1) {
                        VULKAN_INTERNAL_RemoveFramebuffersContainingView(renderer, texture.*.subresources[subresourceIndex].renderTargetViews[depthIndex]);
                    }
                }
                {
                    var depthIndex: Uint32 = 0;
                    _ = &depthIndex;
                    while (depthIndex < texture.*.depth) : (depthIndex +%= 1) {
                        renderer.*.vkDestroyImageView.?(renderer.*.logicalDevice, texture.*.subresources[subresourceIndex].renderTargetViews[depthIndex], null);
                    }
                }
                SDL_free_REAL(@ptrCast(@alignCast(texture.*.subresources[subresourceIndex].renderTargetViews)));
            }
            if (@as(?*anyopaque, @ptrCast(@alignCast(texture.*.subresources[subresourceIndex].computeWriteView))) != @as(?*anyopaque, null)) {
                renderer.*.vkDestroyImageView.?(renderer.*.logicalDevice, texture.*.subresources[subresourceIndex].computeWriteView, null);
            }
            if (@as(?*anyopaque, @ptrCast(@alignCast(texture.*.subresources[subresourceIndex].depthStencilView))) != @as(?*anyopaque, null)) {
                VULKAN_INTERNAL_RemoveFramebuffersContainingView(renderer, texture.*.subresources[subresourceIndex].depthStencilView);
                renderer.*.vkDestroyImageView.?(renderer.*.logicalDevice, texture.*.subresources[subresourceIndex].depthStencilView, null);
            }
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(texture.*.subresources)));
    if (texture.*.fullView != null) {
        renderer.*.vkDestroyImageView.?(renderer.*.logicalDevice, texture.*.fullView, null);
    }
    if ((texture.*.image != null) and !texture.*.externallyManaged) {
        renderer.*.vkDestroyImage.?(renderer.*.logicalDevice, texture.*.image, null);
    }
    if (texture.*.usedRegion != null) {
        VULKAN_INTERNAL_RemoveMemoryUsedRegion(renderer, texture.*.usedRegion);
    }
    SDL_free_REAL(@ptrCast(@alignCast(texture)));
}
pub fn VULKAN_INTERNAL_DestroyBuffer(renderer: [*c]VulkanRenderer, buffer: [*c]VulkanBuffer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    renderer.*.vkDestroyBuffer.?(renderer.*.logicalDevice, buffer.*.buffer, null);
    VULKAN_INTERNAL_RemoveMemoryUsedRegion(renderer, buffer.*.usedRegion);
    SDL_free_REAL(@ptrCast(@alignCast(buffer)));
}
pub fn VULKAN_INTERNAL_DestroyCommandPool(renderer: [*c]VulkanRenderer, commandPool: [*c]VulkanCommandPool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var i: Uint32 = undefined;
    _ = &i;
    var commandBuffer: [*c]VulkanCommandBuffer = undefined;
    _ = &commandBuffer;
    renderer.*.vkDestroyCommandPool.?(renderer.*.logicalDevice, commandPool.*.commandPool, null);
    {
        i = 0;
        while (i < commandPool.*.inactiveCommandBufferCount) : (i +%= 1) {
            commandBuffer = commandPool.*.inactiveCommandBuffers[i];
            SDL_free_REAL(@ptrCast(@alignCast(commandBuffer.*.presentDatas)));
            SDL_free_REAL(@ptrCast(@alignCast(commandBuffer.*.waitSemaphores)));
            SDL_free_REAL(@ptrCast(@alignCast(commandBuffer.*.signalSemaphores)));
            SDL_free_REAL(@ptrCast(@alignCast(commandBuffer.*.usedBuffers)));
            SDL_free_REAL(@ptrCast(@alignCast(commandBuffer.*.buffersUsedInPendingTransfers)));
            SDL_free_REAL(@ptrCast(@alignCast(commandBuffer.*.usedTextures)));
            SDL_free_REAL(@ptrCast(@alignCast(commandBuffer.*.texturesUsedInPendingTransfers)));
            SDL_free_REAL(@ptrCast(@alignCast(commandBuffer.*.usedSamplers)));
            SDL_free_REAL(@ptrCast(@alignCast(commandBuffer.*.usedGraphicsPipelines)));
            SDL_free_REAL(@ptrCast(@alignCast(commandBuffer.*.usedComputePipelines)));
            SDL_free_REAL(@ptrCast(@alignCast(commandBuffer.*.usedFramebuffers)));
            SDL_free_REAL(@ptrCast(@alignCast(commandBuffer.*.usedUniformBuffers)));
            SDL_free_REAL(@ptrCast(@alignCast(commandBuffer)));
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(commandPool.*.inactiveCommandBuffers)));
    SDL_free_REAL(@ptrCast(@alignCast(commandPool)));
}
pub fn VULKAN_INTERNAL_DestroyDescriptorSetLayout(renderer: [*c]VulkanRenderer, layout: [*c]DescriptorSetLayout) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (@as(?*anyopaque, @ptrCast(@alignCast(layout))) == @as(?*anyopaque, null)) {
        return;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(layout.*.descriptorSetLayout))) != @as(?*anyopaque, null)) {
        renderer.*.vkDestroyDescriptorSetLayout.?(renderer.*.logicalDevice, layout.*.descriptorSetLayout, null);
    }
    SDL_free_REAL(@ptrCast(@alignCast(layout)));
}
pub fn VULKAN_INTERNAL_DestroyGraphicsPipeline(renderer: [*c]VulkanRenderer, graphicsPipeline: [*c]VulkanGraphicsPipeline) callconv(.c) void {
    @setEvalBranchQuota(100000);
    renderer.*.vkDestroyPipeline.?(renderer.*.logicalDevice, graphicsPipeline.*.pipeline, null);
    _ = SDL_AddAtomicInt_REAL(&graphicsPipeline.*.vertexShader.*.referenceCount, -@as(c_int, 1)) == @as(c_int, 1);
    _ = SDL_AddAtomicInt_REAL(&graphicsPipeline.*.fragmentShader.*.referenceCount, -@as(c_int, 1)) == @as(c_int, 1);
    SDL_free_REAL(@ptrCast(@alignCast(graphicsPipeline)));
}
pub fn VULKAN_INTERNAL_DestroyComputePipeline(renderer: [*c]VulkanRenderer, computePipeline: [*c]VulkanComputePipeline) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (@as(?*anyopaque, @ptrCast(@alignCast(computePipeline.*.pipeline))) != @as(?*anyopaque, null)) {
        renderer.*.vkDestroyPipeline.?(renderer.*.logicalDevice, computePipeline.*.pipeline, null);
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(computePipeline.*.shaderModule))) != @as(?*anyopaque, null)) {
        renderer.*.vkDestroyShaderModule.?(renderer.*.logicalDevice, computePipeline.*.shaderModule, null);
    }
    SDL_free_REAL(@ptrCast(@alignCast(computePipeline)));
}
pub fn VULKAN_INTERNAL_DestroyShader(renderer: [*c]VulkanRenderer, vulkanShader: [*c]VulkanShader) callconv(.c) void {
    @setEvalBranchQuota(100000);
    renderer.*.vkDestroyShaderModule.?(renderer.*.logicalDevice, vulkanShader.*.shaderModule, null);
    SDL_free_REAL(@ptrCast(@alignCast(vulkanShader.*.entrypointName)));
    SDL_free_REAL(@ptrCast(@alignCast(vulkanShader)));
}
pub fn VULKAN_INTERNAL_DestroySampler(renderer: [*c]VulkanRenderer, vulkanSampler: [*c]VulkanSampler) callconv(.c) void {
    @setEvalBranchQuota(100000);
    renderer.*.vkDestroySampler.?(renderer.*.logicalDevice, vulkanSampler.*.sampler, null);
    SDL_free_REAL(@ptrCast(@alignCast(vulkanSampler)));
}
pub fn VULKAN_INTERNAL_DestroySwapchainImage(renderer: [*c]VulkanRenderer, windowData: [*c]WindowData) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var i: Uint32 = undefined;
    _ = &i;
    if (@as(?*anyopaque, @ptrCast(@alignCast(windowData))) == @as(?*anyopaque, null)) {
        return;
    }
    {
        i = 0;
        while (i < windowData.*.imageCount) : (i +%= 1) {
            VULKAN_INTERNAL_RemoveFramebuffersContainingView(renderer, windowData.*.textureContainers[i].activeTexture.*.subresources[@as(c_int, 0)].renderTargetViews[@as(c_int, 0)]);
            renderer.*.vkDestroyImageView.?(renderer.*.logicalDevice, windowData.*.textureContainers[i].activeTexture.*.subresources[@as(c_int, 0)].renderTargetViews[@as(c_int, 0)], null);
            SDL_free_REAL(@ptrCast(@alignCast(windowData.*.textureContainers[i].activeTexture.*.subresources[@as(c_int, 0)].renderTargetViews)));
            SDL_free_REAL(@ptrCast(@alignCast(windowData.*.textureContainers[i].activeTexture.*.subresources)));
            SDL_free_REAL(@ptrCast(@alignCast(windowData.*.textureContainers[i].activeTexture)));
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(windowData.*.textureContainers)));
    windowData.*.textureContainers = null;
    {
        i = 0;
        while (i < @as(Uint32, MAX_FRAMES_IN_FLIGHT)) : (i +%= 1) {
            if (windowData.*.imageAvailableSemaphore[i] != null) {
                renderer.*.vkDestroySemaphore.?(renderer.*.logicalDevice, windowData.*.imageAvailableSemaphore[i], null);
                windowData.*.imageAvailableSemaphore[i] = null;
            }
        }
    }
    {
        i = 0;
        while (i < windowData.*.imageCount) : (i +%= 1) {
            if (windowData.*.renderFinishedSemaphore[i] != null) {
                renderer.*.vkDestroySemaphore.?(renderer.*.logicalDevice, windowData.*.renderFinishedSemaphore[i], null);
                windowData.*.renderFinishedSemaphore[i] = null;
            }
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(windowData.*.renderFinishedSemaphore)));
    windowData.*.renderFinishedSemaphore = null;
    windowData.*.imageCount = 0;
}
pub fn VULKAN_INTERNAL_DestroySwapchain(renderer: [*c]VulkanRenderer, windowData: [*c]WindowData) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (@as(?*anyopaque, @ptrCast(@alignCast(windowData))) == @as(?*anyopaque, null)) {
        return;
    }
    VULKAN_INTERNAL_DestroySwapchainImage(renderer, windowData);
    if (windowData.*.swapchain != null) {
        renderer.*.vkDestroySwapchainKHR.?(renderer.*.logicalDevice, windowData.*.swapchain, null);
        windowData.*.swapchain = null;
    }
}
pub fn VULKAN_INTERNAL_DestroyGraphicsPipelineResourceLayout(renderer: [*c]VulkanRenderer, resourceLayout: [*c]VulkanGraphicsPipelineResourceLayout) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (@as(?*anyopaque, @ptrCast(@alignCast(resourceLayout.*.pipelineLayout))) != @as(?*anyopaque, null)) {
        renderer.*.vkDestroyPipelineLayout.?(renderer.*.logicalDevice, resourceLayout.*.pipelineLayout, null);
    }
    SDL_free_REAL(@ptrCast(@alignCast(resourceLayout)));
}
pub fn VULKAN_INTERNAL_DestroyComputePipelineResourceLayout(renderer: [*c]VulkanRenderer, resourceLayout: [*c]VulkanComputePipelineResourceLayout) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (@as(?*anyopaque, @ptrCast(@alignCast(resourceLayout.*.pipelineLayout))) != @as(?*anyopaque, null)) {
        renderer.*.vkDestroyPipelineLayout.?(renderer.*.logicalDevice, resourceLayout.*.pipelineLayout, null);
    }
    SDL_free_REAL(@ptrCast(@alignCast(resourceLayout)));
}
pub fn VULKAN_INTERNAL_DestroyDescriptorSetCache(renderer: [*c]VulkanRenderer, descriptorSetCache: [*c]DescriptorSetCache) callconv(.c) void {
    @setEvalBranchQuota(100000);
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < descriptorSetCache.*.poolCount) : (i +%= 1) {
            {
                var j: Uint32 = 0;
                _ = &j;
                while (j < descriptorSetCache.*.pools[i].poolCount) : (j +%= 1) {
                    renderer.*.vkDestroyDescriptorPool.?(renderer.*.logicalDevice, descriptorSetCache.*.pools[i].descriptorPools[j], null);
                }
            }
            SDL_free_REAL(@ptrCast(@alignCast(descriptorSetCache.*.pools[i].descriptorSets)));
            SDL_free_REAL(@ptrCast(@alignCast(descriptorSetCache.*.pools[i].descriptorPools)));
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(descriptorSetCache.*.pools)));
    SDL_free_REAL(@ptrCast(@alignCast(descriptorSetCache)));
}
pub fn VULKAN_INTERNAL_GraphicsPipelineResourceLayoutHashFunction(_: ?*anyopaque, key: ?*const anyopaque) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    var hashTableKey: [*c]GraphicsPipelineResourceLayoutHashTableKey = @ptrCast(@alignCast(@constCast(key)));
    _ = &hashTableKey;
    const hashFactor: Uint32 = 31;
    _ = &hashFactor;
    var result: Uint32 = 1;
    _ = &result;
    result = (result *% hashFactor) +% hashTableKey.*.vertexSamplerCount;
    result = (result *% hashFactor) +% hashTableKey.*.vertexStorageBufferCount;
    result = (result *% hashFactor) +% hashTableKey.*.vertexStorageTextureCount;
    result = (result *% hashFactor) +% hashTableKey.*.vertexUniformBufferCount;
    result = (result *% hashFactor) +% hashTableKey.*.fragmentSamplerCount;
    result = (result *% hashFactor) +% hashTableKey.*.fragmentStorageBufferCount;
    result = (result *% hashFactor) +% hashTableKey.*.fragmentStorageTextureCount;
    result = (result *% hashFactor) +% hashTableKey.*.fragmentUniformBufferCount;
    return result;
}
pub fn VULKAN_INTERNAL_GraphicsPipelineResourceLayoutHashKeyMatch(_: ?*anyopaque, aKey: ?*const anyopaque, bKey: ?*const anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_memcmp_REAL(aKey, bKey, @sizeOf(GraphicsPipelineResourceLayoutHashTableKey)) == @as(c_int, 0);
}
pub fn VULKAN_INTERNAL_GraphicsPipelineResourceLayoutHashDestroy(userdata: ?*anyopaque, key: ?*const anyopaque, value: ?*const anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var renderer: [*c]VulkanRenderer = @ptrCast(@alignCast(userdata));
    _ = &renderer;
    var resourceLayout: [*c]VulkanGraphicsPipelineResourceLayout = @ptrCast(@alignCast(@constCast(value)));
    _ = &resourceLayout;
    VULKAN_INTERNAL_DestroyGraphicsPipelineResourceLayout(renderer, resourceLayout);
    SDL_free_REAL(@ptrCast(@alignCast(@constCast(key))));
}
pub fn VULKAN_INTERNAL_ComputePipelineResourceLayoutHashFunction(_: ?*anyopaque, key: ?*const anyopaque) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    var hashTableKey: [*c]ComputePipelineResourceLayoutHashTableKey = @ptrCast(@alignCast(@constCast(key)));
    _ = &hashTableKey;
    const hashFactor: Uint32 = 31;
    _ = &hashFactor;
    var result: Uint32 = 1;
    _ = &result;
    result = (result *% hashFactor) +% hashTableKey.*.samplerCount;
    result = (result *% hashFactor) +% hashTableKey.*.readonlyStorageTextureCount;
    result = (result *% hashFactor) +% hashTableKey.*.readonlyStorageBufferCount;
    result = (result *% hashFactor) +% hashTableKey.*.readWriteStorageTextureCount;
    result = (result *% hashFactor) +% hashTableKey.*.readWriteStorageBufferCount;
    result = (result *% hashFactor) +% hashTableKey.*.uniformBufferCount;
    return result;
}
pub fn VULKAN_INTERNAL_ComputePipelineResourceLayoutHashKeyMatch(_: ?*anyopaque, aKey: ?*const anyopaque, bKey: ?*const anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_memcmp_REAL(aKey, bKey, @sizeOf(ComputePipelineResourceLayoutHashTableKey)) == @as(c_int, 0);
}
pub fn VULKAN_INTERNAL_ComputePipelineResourceLayoutHashDestroy(userdata: ?*anyopaque, key: ?*const anyopaque, value: ?*const anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var renderer: [*c]VulkanRenderer = @ptrCast(@alignCast(userdata));
    _ = &renderer;
    var resourceLayout: [*c]VulkanComputePipelineResourceLayout = @ptrCast(@alignCast(@constCast(value)));
    _ = &resourceLayout;
    VULKAN_INTERNAL_DestroyComputePipelineResourceLayout(renderer, resourceLayout);
    SDL_free_REAL(@ptrCast(@alignCast(@constCast(key))));
}
pub fn VULKAN_INTERNAL_DescriptorSetLayoutHashFunction(_: ?*anyopaque, key: ?*const anyopaque) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    var hashTableKey: [*c]DescriptorSetLayoutHashTableKey = @ptrCast(@alignCast(@constCast(key)));
    _ = &hashTableKey;
    const hashFactor: Uint32 = 31;
    _ = &hashFactor;
    var result: Uint32 = 1;
    _ = &result;
    result = (result *% hashFactor) +% hashTableKey.*.shaderStage;
    result = (result *% hashFactor) +% hashTableKey.*.samplerCount;
    result = (result *% hashFactor) +% hashTableKey.*.storageTextureCount;
    result = (result *% hashFactor) +% hashTableKey.*.storageBufferCount;
    result = (result *% hashFactor) +% hashTableKey.*.writeStorageTextureCount;
    result = (result *% hashFactor) +% hashTableKey.*.writeStorageBufferCount;
    result = (result *% hashFactor) +% hashTableKey.*.uniformBufferCount;
    return result;
}
pub fn VULKAN_INTERNAL_DescriptorSetLayoutHashKeyMatch(_: ?*anyopaque, aKey: ?*const anyopaque, bKey: ?*const anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_memcmp_REAL(aKey, bKey, @sizeOf(DescriptorSetLayoutHashTableKey)) == @as(c_int, 0);
}
pub fn VULKAN_INTERNAL_DescriptorSetLayoutHashDestroy(userdata: ?*anyopaque, key: ?*const anyopaque, value: ?*const anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var renderer: [*c]VulkanRenderer = @ptrCast(@alignCast(userdata));
    _ = &renderer;
    var layout: [*c]DescriptorSetLayout = @ptrCast(@alignCast(@constCast(value)));
    _ = &layout;
    VULKAN_INTERNAL_DestroyDescriptorSetLayout(renderer, layout);
    SDL_free_REAL(@ptrCast(@alignCast(@constCast(key))));
}
pub fn VULKAN_INTERNAL_CommandPoolHashFunction(_: ?*anyopaque, key: ?*const anyopaque) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    return @truncate(@as([*c]CommandPoolHashTableKey, @ptrCast(@alignCast(@constCast(key)))).*.threadID);
}
pub fn VULKAN_INTERNAL_CommandPoolHashKeyMatch(_: ?*anyopaque, aKey: ?*const anyopaque, bKey: ?*const anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var a: [*c]CommandPoolHashTableKey = @ptrCast(@alignCast(@constCast(aKey)));
    _ = &a;
    var b: [*c]CommandPoolHashTableKey = @ptrCast(@alignCast(@constCast(bKey)));
    _ = &b;
    return a.*.threadID == b.*.threadID;
}
pub fn VULKAN_INTERNAL_CommandPoolHashDestroy(userdata: ?*anyopaque, key: ?*const anyopaque, value: ?*const anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var renderer: [*c]VulkanRenderer = @ptrCast(@alignCast(userdata));
    _ = &renderer;
    var pool: [*c]VulkanCommandPool = @ptrCast(@alignCast(@constCast(value)));
    _ = &pool;
    VULKAN_INTERNAL_DestroyCommandPool(renderer, pool);
    SDL_free_REAL(@ptrCast(@alignCast(@constCast(key))));
}
pub fn VULKAN_INTERNAL_RenderPassHashFunction(_: ?*anyopaque, key: ?*const anyopaque) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    var hashTableKey: [*c]RenderPassHashTableKey = @ptrCast(@alignCast(@constCast(key)));
    _ = &hashTableKey;
    const hashFactor: Uint32 = 31;
    _ = &hashFactor;
    var result: Uint32 = 1;
    _ = &result;
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < hashTableKey.*.numColorTargets) : (i +%= 1) {
            result = (result *% hashFactor) +% hashTableKey.*.colorTargetDescriptions[i].loadOp;
            result = (result *% hashFactor) +% hashTableKey.*.colorTargetDescriptions[i].storeOp;
            result = (result *% hashFactor) +% hashTableKey.*.colorTargetDescriptions[i].format;
        }
    }
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < hashTableKey.*.numResolveTargets) : (i +%= 1) {
            result = (result *% hashFactor) +% hashTableKey.*.resolveTargetFormats[i];
        }
    }
    result = (result *% hashFactor) +% hashTableKey.*.depthStencilTargetDescription.loadOp;
    result = (result *% hashFactor) +% hashTableKey.*.depthStencilTargetDescription.storeOp;
    result = (result *% hashFactor) +% hashTableKey.*.depthStencilTargetDescription.stencilLoadOp;
    result = (result *% hashFactor) +% hashTableKey.*.depthStencilTargetDescription.stencilStoreOp;
    result = (result *% hashFactor) +% hashTableKey.*.depthStencilTargetDescription.format;
    result = (result *% hashFactor) +% hashTableKey.*.sampleCount;
    return result;
}
pub fn VULKAN_INTERNAL_RenderPassHashKeyMatch(_: ?*anyopaque, aKey: ?*const anyopaque, bKey: ?*const anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var a: [*c]RenderPassHashTableKey = @ptrCast(@alignCast(@constCast(aKey)));
    _ = &a;
    var b: [*c]RenderPassHashTableKey = @ptrCast(@alignCast(@constCast(bKey)));
    _ = &b;
    if (a.*.numColorTargets != b.*.numColorTargets) {
        return @as(c_int, 0) != 0;
    }
    if (a.*.numResolveTargets != b.*.numResolveTargets) {
        return @as(c_int, 0) != 0;
    }
    if (a.*.sampleCount != b.*.sampleCount) {
        return @as(c_int, 0) != 0;
    }
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < a.*.numColorTargets) : (i +%= 1) {
            if (a.*.colorTargetDescriptions[i].format != b.*.colorTargetDescriptions[i].format) {
                return @as(c_int, 0) != 0;
            }
            if (a.*.colorTargetDescriptions[i].loadOp != b.*.colorTargetDescriptions[i].loadOp) {
                return @as(c_int, 0) != 0;
            }
            if (a.*.colorTargetDescriptions[i].storeOp != b.*.colorTargetDescriptions[i].storeOp) {
                return @as(c_int, 0) != 0;
            }
        }
    }
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < a.*.numResolveTargets) : (i +%= 1) {
            if (a.*.resolveTargetFormats[i] != b.*.resolveTargetFormats[i]) {
                return @as(c_int, 0) != 0;
            }
        }
    }
    if (a.*.depthStencilTargetDescription.format != b.*.depthStencilTargetDescription.format) {
        return @as(c_int, 0) != 0;
    }
    if (a.*.depthStencilTargetDescription.loadOp != b.*.depthStencilTargetDescription.loadOp) {
        return @as(c_int, 0) != 0;
    }
    if (a.*.depthStencilTargetDescription.storeOp != b.*.depthStencilTargetDescription.storeOp) {
        return @as(c_int, 0) != 0;
    }
    if (a.*.depthStencilTargetDescription.stencilLoadOp != b.*.depthStencilTargetDescription.stencilLoadOp) {
        return @as(c_int, 0) != 0;
    }
    if (a.*.depthStencilTargetDescription.stencilStoreOp != b.*.depthStencilTargetDescription.stencilStoreOp) {
        return @as(c_int, 0) != 0;
    }
    return @as(c_int, 1) != 0;
}
pub fn VULKAN_INTERNAL_RenderPassHashDestroy(userdata: ?*anyopaque, key: ?*const anyopaque, value: ?*const anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var renderer: [*c]VulkanRenderer = @ptrCast(@alignCast(userdata));
    _ = &renderer;
    var renderPassWrapper: [*c]VulkanRenderPassHashTableValue = @ptrCast(@alignCast(@constCast(value)));
    _ = &renderPassWrapper;
    renderer.*.vkDestroyRenderPass.?(renderer.*.logicalDevice, renderPassWrapper.*.handle, null);
    SDL_free_REAL(@ptrCast(@alignCast(renderPassWrapper)));
    SDL_free_REAL(@ptrCast(@alignCast(@constCast(key))));
}
pub fn VULKAN_INTERNAL_FramebufferHashFunction(_: ?*anyopaque, key: ?*const anyopaque) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    var hashTableKey: [*c]FramebufferHashTableKey = @ptrCast(@alignCast(@constCast(key)));
    _ = &hashTableKey;
    const hashFactor: Uint32 = 31;
    _ = &hashFactor;
    var result: Uint32 = 1;
    _ = &result;
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < hashTableKey.*.numColorTargets) : (i +%= 1) {
            result = (result *% hashFactor) +% @as(Uint32, @truncate(@as(usize, @intCast(@intFromPtr(hashTableKey.*.colorAttachmentViews[i])))));
        }
    }
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < hashTableKey.*.numResolveAttachments) : (i +%= 1) {
            result = (result *% hashFactor) +% @as(Uint32, @truncate(@as(usize, @intCast(@intFromPtr(hashTableKey.*.resolveAttachmentViews[i])))));
        }
    }
    result = (result *% hashFactor) +% @as(Uint32, @truncate(@as(usize, @intCast(@intFromPtr(hashTableKey.*.depthStencilAttachmentView)))));
    result = (result *% hashFactor) +% hashTableKey.*.width;
    result = (result *% hashFactor) +% hashTableKey.*.height;
    return result;
}
pub fn VULKAN_INTERNAL_FramebufferHashKeyMatch(_: ?*anyopaque, aKey: ?*const anyopaque, bKey: ?*const anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var a: [*c]FramebufferHashTableKey = @ptrCast(@alignCast(@constCast(aKey)));
    _ = &a;
    var b: [*c]FramebufferHashTableKey = @ptrCast(@alignCast(@constCast(bKey)));
    _ = &b;
    if (a.*.numColorTargets != b.*.numColorTargets) {
        return @as(c_int, 0) != 0;
    }
    if (a.*.numResolveAttachments != b.*.numResolveAttachments) {
        return @as(c_int, 0) != 0;
    }
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < a.*.numColorTargets) : (i +%= 1) {
            if (a.*.colorAttachmentViews[i] != b.*.colorAttachmentViews[i]) {
                return @as(c_int, 0) != 0;
            }
        }
    }
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < a.*.numResolveAttachments) : (i +%= 1) {
            if (a.*.resolveAttachmentViews[i] != b.*.resolveAttachmentViews[i]) {
                return @as(c_int, 0) != 0;
            }
        }
    }
    if (a.*.depthStencilAttachmentView != b.*.depthStencilAttachmentView) {
        return @as(c_int, 0) != 0;
    }
    if (a.*.width != b.*.width) {
        return @as(c_int, 0) != 0;
    }
    if (a.*.height != b.*.height) {
        return @as(c_int, 0) != 0;
    }
    return @as(c_int, 1) != 0;
}
pub fn VULKAN_INTERNAL_FramebufferHashDestroy(userdata: ?*anyopaque, key: ?*const anyopaque, value: ?*const anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var renderer: [*c]VulkanRenderer = @ptrCast(@alignCast(userdata));
    _ = &renderer;
    var framebuffer: [*c]VulkanFramebuffer = @ptrCast(@alignCast(@constCast(value)));
    _ = &framebuffer;
    VULKAN_INTERNAL_ReleaseFramebuffer(renderer, framebuffer);
    SDL_free_REAL(@ptrCast(@alignCast(@constCast(key))));
}
pub fn VULKAN_INTERNAL_AllocateDescriptorSets(renderer: [*c]VulkanRenderer, descriptorPool: VkDescriptorPool, descriptorSetLayout: VkDescriptorSetLayout, descriptorSetCount: Uint32, descriptorSetArray: [*c]VkDescriptorSet) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var descriptorSetAllocateInfo: VkDescriptorSetAllocateInfo = undefined;
    _ = &descriptorSetAllocateInfo;
    var descriptorSetLayouts: [*c]VkDescriptorSetLayout = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(VkDescriptorSetLayout) *% @as(c_ulong, descriptorSetCount))));
    _ = &descriptorSetLayouts;
    var vulkanResult: VkResult = undefined;
    _ = &vulkanResult;
    var i: Uint32 = undefined;
    _ = &i;
    {
        i = 0;
        while (i < descriptorSetCount) : (i +%= 1) {
            descriptorSetLayouts[i] = descriptorSetLayout;
        }
    }
    descriptorSetAllocateInfo.sType = VK_STRUCTURE_TYPE_DESCRIPTOR_SET_ALLOCATE_INFO;
    descriptorSetAllocateInfo.pNext = null;
    descriptorSetAllocateInfo.descriptorPool = descriptorPool;
    descriptorSetAllocateInfo.descriptorSetCount = descriptorSetCount;
    descriptorSetAllocateInfo.pSetLayouts = descriptorSetLayouts;
    vulkanResult = renderer.*.vkAllocateDescriptorSets.?(renderer.*.logicalDevice, &descriptorSetAllocateInfo, descriptorSetArray);
    SDL_free_REAL(@ptrCast(@alignCast(descriptorSetLayouts)));
    while (true) {
        if (vulkanResult != VK_SUCCESS) {
            if (renderer.*.debugMode) {
                SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkAllocateDescriptorSets"))), VkErrorMessages(vulkanResult));
            }
            _ = SDL_SetError_REAL("%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkAllocateDescriptorSets"))), VkErrorMessages(vulkanResult));
            return @"false" != 0;
        }
        if (!false) break;
    }
    return @"true" != 0;
}
pub fn VULKAN_INTERNAL_AllocateDescriptorsFromPool(renderer: [*c]VulkanRenderer, descriptorSetLayout: [*c]DescriptorSetLayout, descriptorSetPool: [*c]DescriptorSetPool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var descriptorPoolSizes: [52]VkDescriptorPoolSize = undefined;
    _ = &descriptorPoolSizes;
    var descriptorPoolInfo: VkDescriptorPoolCreateInfo = undefined;
    _ = &descriptorPoolInfo;
    var pool: VkDescriptorPool = undefined;
    _ = &pool;
    var vulkanResult: VkResult = undefined;
    _ = &vulkanResult;
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < descriptorSetLayout.*.samplerCount) : (i +%= 1) {
            descriptorPoolSizes[i].type = VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER;
            descriptorPoolSizes[i].descriptorCount = DESCRIPTOR_POOL_SIZE;
        }
    }
    {
        var i: Uint32 = descriptorSetLayout.*.samplerCount;
        _ = &i;
        while (i < (descriptorSetLayout.*.samplerCount +% descriptorSetLayout.*.storageTextureCount)) : (i +%= 1) {
            descriptorPoolSizes[i].type = VK_DESCRIPTOR_TYPE_SAMPLED_IMAGE;
            descriptorPoolSizes[i].descriptorCount = DESCRIPTOR_POOL_SIZE;
        }
    }
    {
        var i: Uint32 = descriptorSetLayout.*.samplerCount +% descriptorSetLayout.*.storageTextureCount;
        _ = &i;
        while (i < ((descriptorSetLayout.*.samplerCount +% descriptorSetLayout.*.storageTextureCount) +% descriptorSetLayout.*.storageBufferCount)) : (i +%= 1) {
            descriptorPoolSizes[i].type = VK_DESCRIPTOR_TYPE_STORAGE_BUFFER;
            descriptorPoolSizes[i].descriptorCount = DESCRIPTOR_POOL_SIZE;
        }
    }
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < descriptorSetLayout.*.writeStorageTextureCount) : (i +%= 1) {
            descriptorPoolSizes[i].type = VK_DESCRIPTOR_TYPE_STORAGE_IMAGE;
            descriptorPoolSizes[i].descriptorCount = DESCRIPTOR_POOL_SIZE;
        }
    }
    {
        var i: Uint32 = descriptorSetLayout.*.writeStorageTextureCount;
        _ = &i;
        while (i < (descriptorSetLayout.*.writeStorageTextureCount +% descriptorSetLayout.*.writeStorageBufferCount)) : (i +%= 1) {
            descriptorPoolSizes[i].type = VK_DESCRIPTOR_TYPE_STORAGE_BUFFER;
            descriptorPoolSizes[i].descriptorCount = DESCRIPTOR_POOL_SIZE;
        }
    }
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < descriptorSetLayout.*.uniformBufferCount) : (i +%= 1) {
            descriptorPoolSizes[i].type = VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER_DYNAMIC;
            descriptorPoolSizes[i].descriptorCount = DESCRIPTOR_POOL_SIZE;
        }
    }
    descriptorPoolInfo.sType = VK_STRUCTURE_TYPE_DESCRIPTOR_POOL_CREATE_INFO;
    descriptorPoolInfo.pNext = null;
    descriptorPoolInfo.flags = 0;
    descriptorPoolInfo.maxSets = DESCRIPTOR_POOL_SIZE;
    descriptorPoolInfo.poolSizeCount = ((((descriptorSetLayout.*.samplerCount +% descriptorSetLayout.*.storageTextureCount) +% descriptorSetLayout.*.storageBufferCount) +% descriptorSetLayout.*.writeStorageTextureCount) +% descriptorSetLayout.*.writeStorageBufferCount) +% descriptorSetLayout.*.uniformBufferCount;
    descriptorPoolInfo.pPoolSizes = @ptrCast(@alignCast(&descriptorPoolSizes));
    vulkanResult = renderer.*.vkCreateDescriptorPool.?(renderer.*.logicalDevice, &descriptorPoolInfo, null, &pool);
    while (true) {
        if (vulkanResult != VK_SUCCESS) {
            if (renderer.*.debugMode) {
                SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateDescriptorPool"))), VkErrorMessages(vulkanResult));
            }
            _ = SDL_SetError_REAL("%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateDescriptorPool"))), VkErrorMessages(vulkanResult));
            return @"false" != 0;
        }
        if (!false) break;
    }
    descriptorSetPool.*.poolCount +%= 1;
    descriptorSetPool.*.descriptorPools = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(descriptorSetPool.*.descriptorPools)), @sizeOf(VkDescriptorPool) *% @as(c_ulong, descriptorSetPool.*.poolCount))));
    descriptorSetPool.*.descriptorPools[descriptorSetPool.*.poolCount -% @as(Uint32, 1)] = pool;
    descriptorSetPool.*.descriptorSets = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(descriptorSetPool.*.descriptorSets)), (@sizeOf(VkDescriptorSet) *% @as(c_ulong, descriptorSetPool.*.poolCount)) *% @as(c_ulong, DESCRIPTOR_POOL_SIZE))));
    if (!VULKAN_INTERNAL_AllocateDescriptorSets(renderer, pool, descriptorSetLayout.*.descriptorSetLayout, DESCRIPTOR_POOL_SIZE, &descriptorSetPool.*.descriptorSets[descriptorSetPool.*.descriptorSetCount])) {
        return @"false" != 0;
    }
    descriptorSetPool.*.descriptorSetCount +%= DESCRIPTOR_POOL_SIZE;
    return @"true" != 0;
}
pub fn VULKAN_INTERNAL_FetchDescriptorSetLayout(renderer: [*c]VulkanRenderer, shaderStage: VkShaderStageFlagBits, samplerCount: Uint32, storageTextureCount: Uint32, storageBufferCount: Uint32, writeStorageTextureCount: Uint32, writeStorageBufferCount: Uint32, uniformBufferCount: Uint32) callconv(.c) [*c]DescriptorSetLayout {
    @setEvalBranchQuota(100000);
    var key: DescriptorSetLayoutHashTableKey = undefined;
    _ = &key;
    _ = memset(@ptrCast(@alignCast(&key)), 0, @sizeOf(@TypeOf(key)));
    var layout: [*c]DescriptorSetLayout = null;
    _ = &layout;
    key.shaderStage = shaderStage;
    key.samplerCount = samplerCount;
    key.storageTextureCount = storageTextureCount;
    key.storageBufferCount = storageBufferCount;
    key.writeStorageTextureCount = writeStorageTextureCount;
    key.writeStorageBufferCount = writeStorageBufferCount;
    key.uniformBufferCount = uniformBufferCount;
    SDL_LockMutex_REAL(renderer.*.descriptorSetLayoutFetchLock);
    if (SDL_FindInHashTable(renderer.*.descriptorSetLayoutHashTable, @ptrCast(@alignCast(&key)), @ptrCast(@alignCast(&layout)))) {
        SDL_UnlockMutex_REAL(renderer.*.descriptorSetLayoutFetchLock);
        return layout;
    }
    var descriptorSetLayout: VkDescriptorSetLayout = undefined;
    _ = &descriptorSetLayout;
    var descriptorSetLayoutBindings: [48]VkDescriptorSetLayoutBinding = undefined;
    _ = &descriptorSetLayoutBindings;
    var descriptorSetLayoutCreateInfo: VkDescriptorSetLayoutCreateInfo = undefined;
    _ = &descriptorSetLayoutCreateInfo;
    descriptorSetLayoutCreateInfo.sType = VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_CREATE_INFO;
    descriptorSetLayoutCreateInfo.pNext = null;
    descriptorSetLayoutCreateInfo.flags = 0;
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < samplerCount) : (i +%= 1) {
            descriptorSetLayoutBindings[i].binding = i;
            descriptorSetLayoutBindings[i].descriptorCount = 1;
            descriptorSetLayoutBindings[i].descriptorType = VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER;
            descriptorSetLayoutBindings[i].stageFlags = shaderStage;
            descriptorSetLayoutBindings[i].pImmutableSamplers = null;
        }
    }
    {
        var i: Uint32 = samplerCount;
        _ = &i;
        while (i < (samplerCount +% storageTextureCount)) : (i +%= 1) {
            descriptorSetLayoutBindings[i].binding = i;
            descriptorSetLayoutBindings[i].descriptorCount = 1;
            descriptorSetLayoutBindings[i].descriptorType = VK_DESCRIPTOR_TYPE_SAMPLED_IMAGE;
            descriptorSetLayoutBindings[i].stageFlags = shaderStage;
            descriptorSetLayoutBindings[i].pImmutableSamplers = null;
        }
    }
    {
        var i: Uint32 = samplerCount +% storageTextureCount;
        _ = &i;
        while (i < ((samplerCount +% storageTextureCount) +% storageBufferCount)) : (i +%= 1) {
            descriptorSetLayoutBindings[i].binding = i;
            descriptorSetLayoutBindings[i].descriptorCount = 1;
            descriptorSetLayoutBindings[i].descriptorType = VK_DESCRIPTOR_TYPE_STORAGE_BUFFER;
            descriptorSetLayoutBindings[i].stageFlags = shaderStage;
            descriptorSetLayoutBindings[i].pImmutableSamplers = null;
        }
    }
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < writeStorageTextureCount) : (i +%= 1) {
            descriptorSetLayoutBindings[i].binding = i;
            descriptorSetLayoutBindings[i].descriptorCount = 1;
            descriptorSetLayoutBindings[i].descriptorType = VK_DESCRIPTOR_TYPE_STORAGE_IMAGE;
            descriptorSetLayoutBindings[i].stageFlags = shaderStage;
            descriptorSetLayoutBindings[i].pImmutableSamplers = null;
        }
    }
    {
        var i: Uint32 = writeStorageTextureCount;
        _ = &i;
        while (i < (writeStorageTextureCount +% writeStorageBufferCount)) : (i +%= 1) {
            descriptorSetLayoutBindings[i].binding = i;
            descriptorSetLayoutBindings[i].descriptorCount = 1;
            descriptorSetLayoutBindings[i].descriptorType = VK_DESCRIPTOR_TYPE_STORAGE_BUFFER;
            descriptorSetLayoutBindings[i].stageFlags = shaderStage;
            descriptorSetLayoutBindings[i].pImmutableSamplers = null;
        }
    }
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < uniformBufferCount) : (i +%= 1) {
            descriptorSetLayoutBindings[i].binding = i;
            descriptorSetLayoutBindings[i].descriptorCount = 1;
            descriptorSetLayoutBindings[i].descriptorType = VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER_DYNAMIC;
            descriptorSetLayoutBindings[i].stageFlags = shaderStage;
            descriptorSetLayoutBindings[i].pImmutableSamplers = null;
        }
    }
    descriptorSetLayoutCreateInfo.pBindings = @ptrCast(@alignCast(&descriptorSetLayoutBindings));
    descriptorSetLayoutCreateInfo.bindingCount = ((((samplerCount +% storageTextureCount) +% storageBufferCount) +% writeStorageTextureCount) +% writeStorageBufferCount) +% uniformBufferCount;
    var vulkanResult: VkResult = renderer.*.vkCreateDescriptorSetLayout.?(renderer.*.logicalDevice, &descriptorSetLayoutCreateInfo, null, &descriptorSetLayout);
    _ = &vulkanResult;
    if (vulkanResult != VK_SUCCESS) {
        SDL_UnlockMutex_REAL(renderer.*.descriptorSetLayoutFetchLock);
        while (true) {
            if (vulkanResult != VK_SUCCESS) {
                if (renderer.*.debugMode) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateDescriptorSetLayout"))), VkErrorMessages(vulkanResult));
                }
                _ = SDL_SetError_REAL("%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateDescriptorSetLayout"))), VkErrorMessages(vulkanResult));
                return null;
            }
            if (!false) break;
        }
    }
    layout = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(DescriptorSetLayout))));
    layout.*.descriptorSetLayout = descriptorSetLayout;
    layout.*.samplerCount = samplerCount;
    layout.*.storageBufferCount = storageBufferCount;
    layout.*.storageTextureCount = storageTextureCount;
    layout.*.writeStorageBufferCount = writeStorageBufferCount;
    layout.*.writeStorageTextureCount = writeStorageTextureCount;
    layout.*.uniformBufferCount = uniformBufferCount;
    layout.*.ID = @bitCast(@as(c_int, SDL_AddAtomicInt_REAL(&renderer.*.layoutResourceID, 1)));
    var allocedKey: [*c]DescriptorSetLayoutHashTableKey = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(DescriptorSetLayoutHashTableKey))));
    _ = &allocedKey;
    _ = memcpy(@ptrCast(@alignCast(allocedKey)), @ptrCast(@alignCast(&key)), @sizeOf(DescriptorSetLayoutHashTableKey));
    _ = SDL_InsertIntoHashTable(renderer.*.descriptorSetLayoutHashTable, @ptrCast(@alignCast(allocedKey)), @ptrCast(@alignCast(layout)), @"true" != 0);
    SDL_UnlockMutex_REAL(renderer.*.descriptorSetLayoutFetchLock);
    return layout;
}
pub fn VULKAN_INTERNAL_FetchGraphicsPipelineResourceLayout(renderer: [*c]VulkanRenderer, vertexShader: [*c]VulkanShader, fragmentShader: [*c]VulkanShader) callconv(.c) [*c]VulkanGraphicsPipelineResourceLayout {
    @setEvalBranchQuota(100000);
    var key: GraphicsPipelineResourceLayoutHashTableKey = undefined;
    _ = &key;
    _ = memset(@ptrCast(@alignCast(&key)), 0, @sizeOf(@TypeOf(key)));
    var pipelineResourceLayout: [*c]VulkanGraphicsPipelineResourceLayout = null;
    _ = &pipelineResourceLayout;
    key.vertexSamplerCount = vertexShader.*.numSamplers;
    key.vertexStorageTextureCount = vertexShader.*.numStorageTextures;
    key.vertexStorageBufferCount = vertexShader.*.numStorageBuffers;
    key.vertexUniformBufferCount = vertexShader.*.numUniformBuffers;
    key.fragmentSamplerCount = fragmentShader.*.numSamplers;
    key.fragmentStorageTextureCount = fragmentShader.*.numStorageTextures;
    key.fragmentStorageBufferCount = fragmentShader.*.numStorageBuffers;
    key.fragmentUniformBufferCount = fragmentShader.*.numUniformBuffers;
    SDL_LockMutex_REAL(renderer.*.graphicsPipelineLayoutFetchLock);
    if (SDL_FindInHashTable(renderer.*.graphicsPipelineResourceLayoutHashTable, @ptrCast(@alignCast(&key)), @ptrCast(@alignCast(&pipelineResourceLayout)))) {
        SDL_UnlockMutex_REAL(renderer.*.graphicsPipelineLayoutFetchLock);
        return pipelineResourceLayout;
    }
    var pipelineLayoutCreateInfo: VkPipelineLayoutCreateInfo = undefined;
    _ = &pipelineLayoutCreateInfo;
    var descriptorSetLayouts: [4]VkDescriptorSetLayout = undefined;
    _ = &descriptorSetLayouts;
    var vulkanResult: VkResult = undefined;
    _ = &vulkanResult;
    pipelineResourceLayout = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(VulkanGraphicsPipelineResourceLayout))));
    pipelineResourceLayout.*.descriptorSetLayouts[@as(c_int, 0)] = VULKAN_INTERNAL_FetchDescriptorSetLayout(renderer, VK_SHADER_STAGE_VERTEX_BIT, vertexShader.*.numSamplers, vertexShader.*.numStorageTextures, vertexShader.*.numStorageBuffers, 0, 0, 0);
    pipelineResourceLayout.*.descriptorSetLayouts[@as(c_int, 1)] = VULKAN_INTERNAL_FetchDescriptorSetLayout(renderer, VK_SHADER_STAGE_VERTEX_BIT, 0, 0, 0, 0, 0, vertexShader.*.numUniformBuffers);
    pipelineResourceLayout.*.descriptorSetLayouts[@as(c_int, 2)] = VULKAN_INTERNAL_FetchDescriptorSetLayout(renderer, VK_SHADER_STAGE_FRAGMENT_BIT, fragmentShader.*.numSamplers, fragmentShader.*.numStorageTextures, fragmentShader.*.numStorageBuffers, 0, 0, 0);
    pipelineResourceLayout.*.descriptorSetLayouts[@as(c_int, 3)] = VULKAN_INTERNAL_FetchDescriptorSetLayout(renderer, VK_SHADER_STAGE_FRAGMENT_BIT, 0, 0, 0, 0, 0, fragmentShader.*.numUniformBuffers);
    descriptorSetLayouts[@as(c_int, 0)] = pipelineResourceLayout.*.descriptorSetLayouts[@as(c_int, 0)].*.descriptorSetLayout;
    descriptorSetLayouts[@as(c_int, 1)] = pipelineResourceLayout.*.descriptorSetLayouts[@as(c_int, 1)].*.descriptorSetLayout;
    descriptorSetLayouts[@as(c_int, 2)] = pipelineResourceLayout.*.descriptorSetLayouts[@as(c_int, 2)].*.descriptorSetLayout;
    descriptorSetLayouts[@as(c_int, 3)] = pipelineResourceLayout.*.descriptorSetLayouts[@as(c_int, 3)].*.descriptorSetLayout;
    pipelineResourceLayout.*.vertexSamplerCount = vertexShader.*.numSamplers;
    pipelineResourceLayout.*.vertexStorageTextureCount = vertexShader.*.numStorageTextures;
    pipelineResourceLayout.*.vertexStorageBufferCount = vertexShader.*.numStorageBuffers;
    pipelineResourceLayout.*.vertexUniformBufferCount = vertexShader.*.numUniformBuffers;
    pipelineResourceLayout.*.fragmentSamplerCount = fragmentShader.*.numSamplers;
    pipelineResourceLayout.*.fragmentStorageTextureCount = fragmentShader.*.numStorageTextures;
    pipelineResourceLayout.*.fragmentStorageBufferCount = fragmentShader.*.numStorageBuffers;
    pipelineResourceLayout.*.fragmentUniformBufferCount = fragmentShader.*.numUniformBuffers;
    pipelineLayoutCreateInfo.sType = VK_STRUCTURE_TYPE_PIPELINE_LAYOUT_CREATE_INFO;
    pipelineLayoutCreateInfo.pNext = null;
    pipelineLayoutCreateInfo.flags = 0;
    pipelineLayoutCreateInfo.setLayoutCount = 4;
    pipelineLayoutCreateInfo.pSetLayouts = @ptrCast(@alignCast(&descriptorSetLayouts));
    pipelineLayoutCreateInfo.pushConstantRangeCount = 0;
    pipelineLayoutCreateInfo.pPushConstantRanges = null;
    vulkanResult = renderer.*.vkCreatePipelineLayout.?(renderer.*.logicalDevice, &pipelineLayoutCreateInfo, null, &pipelineResourceLayout.*.pipelineLayout);
    if (vulkanResult != VK_SUCCESS) {
        VULKAN_INTERNAL_DestroyGraphicsPipelineResourceLayout(renderer, pipelineResourceLayout);
        SDL_UnlockMutex_REAL(renderer.*.graphicsPipelineLayoutFetchLock);
        while (true) {
            if (vulkanResult != VK_SUCCESS) {
                if (renderer.*.debugMode) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreatePipelineLayout"))), VkErrorMessages(vulkanResult));
                }
                _ = SDL_SetError_REAL("%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreatePipelineLayout"))), VkErrorMessages(vulkanResult));
                return null;
            }
            if (!false) break;
        }
    }
    var allocedKey: [*c]GraphicsPipelineResourceLayoutHashTableKey = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(GraphicsPipelineResourceLayoutHashTableKey))));
    _ = &allocedKey;
    _ = memcpy(@ptrCast(@alignCast(allocedKey)), @ptrCast(@alignCast(&key)), @sizeOf(GraphicsPipelineResourceLayoutHashTableKey));
    _ = SDL_InsertIntoHashTable(renderer.*.graphicsPipelineResourceLayoutHashTable, @ptrCast(@alignCast(allocedKey)), @ptrCast(@alignCast(pipelineResourceLayout)), @"true" != 0);
    SDL_UnlockMutex_REAL(renderer.*.graphicsPipelineLayoutFetchLock);
    return pipelineResourceLayout;
}
pub fn VULKAN_INTERNAL_FetchComputePipelineResourceLayout(renderer: [*c]VulkanRenderer, createinfo: [*c]const SDL_GPUComputePipelineCreateInfo) callconv(.c) [*c]VulkanComputePipelineResourceLayout {
    @setEvalBranchQuota(100000);
    var key: ComputePipelineResourceLayoutHashTableKey = undefined;
    _ = &key;
    _ = memset(@ptrCast(@alignCast(&key)), 0, @sizeOf(@TypeOf(key)));
    var pipelineResourceLayout: [*c]VulkanComputePipelineResourceLayout = null;
    _ = &pipelineResourceLayout;
    key.samplerCount = createinfo.*.num_samplers;
    key.readonlyStorageTextureCount = createinfo.*.num_readonly_storage_textures;
    key.readonlyStorageBufferCount = createinfo.*.num_readonly_storage_buffers;
    key.readWriteStorageTextureCount = createinfo.*.num_readwrite_storage_textures;
    key.readWriteStorageBufferCount = createinfo.*.num_readwrite_storage_buffers;
    key.uniformBufferCount = createinfo.*.num_uniform_buffers;
    SDL_LockMutex_REAL(renderer.*.computePipelineLayoutFetchLock);
    if (SDL_FindInHashTable(renderer.*.computePipelineResourceLayoutHashTable, @ptrCast(@alignCast(&key)), @ptrCast(@alignCast(&pipelineResourceLayout)))) {
        SDL_UnlockMutex_REAL(renderer.*.computePipelineLayoutFetchLock);
        return pipelineResourceLayout;
    }
    var descriptorSetLayouts: [3]VkDescriptorSetLayout = undefined;
    _ = &descriptorSetLayouts;
    var pipelineLayoutCreateInfo: VkPipelineLayoutCreateInfo = undefined;
    _ = &pipelineLayoutCreateInfo;
    var vulkanResult: VkResult = undefined;
    _ = &vulkanResult;
    pipelineResourceLayout = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(VulkanComputePipelineResourceLayout))));
    pipelineResourceLayout.*.descriptorSetLayouts[@as(c_int, 0)] = VULKAN_INTERNAL_FetchDescriptorSetLayout(renderer, VK_SHADER_STAGE_COMPUTE_BIT, createinfo.*.num_samplers, createinfo.*.num_readonly_storage_textures, createinfo.*.num_readonly_storage_buffers, 0, 0, 0);
    pipelineResourceLayout.*.descriptorSetLayouts[@as(c_int, 1)] = VULKAN_INTERNAL_FetchDescriptorSetLayout(renderer, VK_SHADER_STAGE_COMPUTE_BIT, 0, 0, 0, createinfo.*.num_readwrite_storage_textures, createinfo.*.num_readwrite_storage_buffers, 0);
    pipelineResourceLayout.*.descriptorSetLayouts[@as(c_int, 2)] = VULKAN_INTERNAL_FetchDescriptorSetLayout(renderer, VK_SHADER_STAGE_COMPUTE_BIT, 0, 0, 0, 0, 0, createinfo.*.num_uniform_buffers);
    descriptorSetLayouts[@as(c_int, 0)] = pipelineResourceLayout.*.descriptorSetLayouts[@as(c_int, 0)].*.descriptorSetLayout;
    descriptorSetLayouts[@as(c_int, 1)] = pipelineResourceLayout.*.descriptorSetLayouts[@as(c_int, 1)].*.descriptorSetLayout;
    descriptorSetLayouts[@as(c_int, 2)] = pipelineResourceLayout.*.descriptorSetLayouts[@as(c_int, 2)].*.descriptorSetLayout;
    pipelineResourceLayout.*.numSamplers = createinfo.*.num_samplers;
    pipelineResourceLayout.*.numReadonlyStorageTextures = createinfo.*.num_readonly_storage_textures;
    pipelineResourceLayout.*.numReadonlyStorageBuffers = createinfo.*.num_readonly_storage_buffers;
    pipelineResourceLayout.*.numReadWriteStorageTextures = createinfo.*.num_readwrite_storage_textures;
    pipelineResourceLayout.*.numReadWriteStorageBuffers = createinfo.*.num_readwrite_storage_buffers;
    pipelineResourceLayout.*.numUniformBuffers = createinfo.*.num_uniform_buffers;
    pipelineLayoutCreateInfo.sType = VK_STRUCTURE_TYPE_PIPELINE_LAYOUT_CREATE_INFO;
    pipelineLayoutCreateInfo.pNext = null;
    pipelineLayoutCreateInfo.flags = 0;
    pipelineLayoutCreateInfo.setLayoutCount = 3;
    pipelineLayoutCreateInfo.pSetLayouts = @ptrCast(@alignCast(&descriptorSetLayouts));
    pipelineLayoutCreateInfo.pushConstantRangeCount = 0;
    pipelineLayoutCreateInfo.pPushConstantRanges = null;
    vulkanResult = renderer.*.vkCreatePipelineLayout.?(renderer.*.logicalDevice, &pipelineLayoutCreateInfo, null, &pipelineResourceLayout.*.pipelineLayout);
    if (vulkanResult != VK_SUCCESS) {
        VULKAN_INTERNAL_DestroyComputePipelineResourceLayout(renderer, pipelineResourceLayout);
        SDL_UnlockMutex_REAL(renderer.*.computePipelineLayoutFetchLock);
        while (true) {
            if (vulkanResult != VK_SUCCESS) {
                if (renderer.*.debugMode) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreatePipelineLayout"))), VkErrorMessages(vulkanResult));
                }
                _ = SDL_SetError_REAL("%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreatePipelineLayout"))), VkErrorMessages(vulkanResult));
                return null;
            }
            if (!false) break;
        }
    }
    var allocedKey: [*c]ComputePipelineResourceLayoutHashTableKey = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(ComputePipelineResourceLayoutHashTableKey))));
    _ = &allocedKey;
    _ = memcpy(@ptrCast(@alignCast(allocedKey)), @ptrCast(@alignCast(&key)), @sizeOf(ComputePipelineResourceLayoutHashTableKey));
    _ = SDL_InsertIntoHashTable(renderer.*.computePipelineResourceLayoutHashTable, @ptrCast(@alignCast(allocedKey)), @ptrCast(@alignCast(pipelineResourceLayout)), @"true" != 0);
    SDL_UnlockMutex_REAL(renderer.*.computePipelineLayoutFetchLock);
    return pipelineResourceLayout;
}
pub fn VULKAN_INTERNAL_CreateBuffer(renderer: [*c]VulkanRenderer, size: VkDeviceSize, usageFlags: SDL_GPUBufferUsageFlags, arg_type: VulkanBufferType, dedicated: bool, debugName: [*c]const u8) callconv(.c) [*c]VulkanBuffer {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var buffer: [*c]VulkanBuffer = undefined;
    _ = &buffer;
    var vulkanResult: VkResult = undefined;
    _ = &vulkanResult;
    var createinfo: VkBufferCreateInfo = undefined;
    _ = &createinfo;
    var vulkanUsageFlags: VkBufferUsageFlags = 0;
    _ = &vulkanUsageFlags;
    var bindResult: Uint8 = undefined;
    _ = &bindResult;
    if ((usageFlags & (@as(c_uint, 1) << @intCast(@as(c_uint, 0)))) != 0) {
        vulkanUsageFlags |= VK_BUFFER_USAGE_VERTEX_BUFFER_BIT;
    }
    if ((usageFlags & (@as(c_uint, 1) << @intCast(@as(c_uint, 1)))) != 0) {
        vulkanUsageFlags |= VK_BUFFER_USAGE_INDEX_BUFFER_BIT;
    }
    if ((usageFlags & (((@as(c_uint, 1) << @intCast(@as(c_uint, 3))) | (@as(c_uint, 1) << @intCast(@as(c_uint, 4)))) | (@as(c_uint, 1) << @intCast(@as(c_uint, 5))))) != 0) {
        vulkanUsageFlags |= VK_BUFFER_USAGE_STORAGE_BUFFER_BIT;
    }
    if ((usageFlags & (@as(c_uint, 1) << @intCast(@as(c_uint, 2)))) != 0) {
        vulkanUsageFlags |= VK_BUFFER_USAGE_INDIRECT_BUFFER_BIT;
    }
    if (@"type" == @as(VulkanBufferType, VULKAN_BUFFER_TYPE_UNIFORM)) {
        vulkanUsageFlags |= VK_BUFFER_USAGE_UNIFORM_BUFFER_BIT;
    } else {
        vulkanUsageFlags |= @bitCast(@as(c_int, VK_BUFFER_USAGE_TRANSFER_SRC_BIT | VK_BUFFER_USAGE_TRANSFER_DST_BIT));
    }
    buffer = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(VulkanBuffer))));
    buffer.*.size = size;
    buffer.*.usage = usageFlags;
    buffer.*.type = @"type";
    buffer.*.markedForDestroy = @"false" != 0;
    buffer.*.transitioned = @"false" != 0;
    createinfo.sType = VK_STRUCTURE_TYPE_BUFFER_CREATE_INFO;
    createinfo.pNext = null;
    createinfo.flags = 0;
    createinfo.size = size;
    createinfo.usage = vulkanUsageFlags;
    createinfo.sharingMode = VK_SHARING_MODE_EXCLUSIVE;
    createinfo.queueFamilyIndexCount = 1;
    createinfo.pQueueFamilyIndices = &renderer.*.queueFamilyIndex;
    createinfo.usage |= @bitCast(@as(c_int, VK_BUFFER_USAGE_TRANSFER_SRC_BIT | VK_BUFFER_USAGE_TRANSFER_DST_BIT));
    vulkanResult = renderer.*.vkCreateBuffer.?(renderer.*.logicalDevice, &createinfo, null, &buffer.*.buffer);
    if (vulkanResult != VK_SUCCESS) {
        SDL_free_REAL(@ptrCast(@alignCast(buffer)));
        while (true) {
            if (vulkanResult != VK_SUCCESS) {
                if (renderer.*.debugMode) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateBuffer"))), VkErrorMessages(vulkanResult));
                }
                _ = SDL_SetError_REAL("%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateBuffer"))), VkErrorMessages(vulkanResult));
                return null;
            }
            if (!false) break;
        }
    }
    bindResult = VULKAN_INTERNAL_BindMemoryForBuffer(renderer, buffer.*.buffer, buffer.*.size, buffer.*.type, dedicated, &buffer.*.usedRegion);
    if (@as(c_int, bindResult) != @as(c_int, 1)) {
        renderer.*.vkDestroyBuffer.?(renderer.*.logicalDevice, buffer.*.buffer, null);
        SDL_free_REAL(@ptrCast(@alignCast(buffer)));
        while (true) {
            while (true) {
                if (renderer.*.debugMode) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s", @as([*c]u8, @as([*c]u8, @constCast("Failed to bind memory for buffer!"))));
                }
                _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("Failed to bind memory for buffer!"))));
                if (!false) break;
            }
            return null;
        }
    }
    buffer.*.usedRegion.*.unnamed_0.vulkanBuffer = buffer;
    _ = SDL_SetAtomicInt_REAL(&buffer.*.referenceCount, 0);
    if ((renderer.*.debugMode and renderer.*.supportsDebugUtils) and (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(debugName)))) != @as(?*anyopaque, null))) {
        var nameInfo: VkDebugUtilsObjectNameInfoEXT = undefined;
        _ = &nameInfo;
        nameInfo.sType = VK_STRUCTURE_TYPE_DEBUG_UTILS_OBJECT_NAME_INFO_EXT;
        nameInfo.pNext = null;
        nameInfo.pObjectName = debugName;
        nameInfo.objectType = VK_OBJECT_TYPE_BUFFER;
        nameInfo.objectHandle = @intCast(@intFromPtr(buffer.*.buffer));
        _ = renderer.*.vkSetDebugUtilsObjectNameEXT.?(renderer.*.logicalDevice, &nameInfo);
    }
    return buffer;
}
pub fn VULKAN_INTERNAL_CreateBufferContainer(renderer: [*c]VulkanRenderer, size: VkDeviceSize, usageFlags: SDL_GPUBufferUsageFlags, arg_type: VulkanBufferType, dedicated: bool, debugName: [*c]const u8) callconv(.c) [*c]VulkanBufferContainer {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var bufferContainer: [*c]VulkanBufferContainer = undefined;
    _ = &bufferContainer;
    var buffer: [*c]VulkanBuffer = undefined;
    _ = &buffer;
    buffer = VULKAN_INTERNAL_CreateBuffer(renderer, size, usageFlags, @"type", dedicated, debugName);
    if (@as(?*anyopaque, @ptrCast(@alignCast(buffer))) == @as(?*anyopaque, null)) {
        return null;
    }
    bufferContainer = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(VulkanBufferContainer))));
    bufferContainer.*.activeBuffer = buffer;
    buffer.*.container = bufferContainer;
    buffer.*.containerIndex = 0;
    bufferContainer.*.bufferCapacity = 1;
    bufferContainer.*.bufferCount = 1;
    bufferContainer.*.buffers = @ptrCast(@alignCast(SDL_calloc_REAL(bufferContainer.*.bufferCapacity, @sizeOf([*c]VulkanBuffer))));
    bufferContainer.*.buffers[@as(c_int, 0)] = bufferContainer.*.activeBuffer;
    bufferContainer.*.dedicated = dedicated;
    bufferContainer.*.debugName = null;
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(debugName)))) != @as(?*anyopaque, null)) {
        bufferContainer.*.debugName = SDL_strdup_REAL(debugName);
    }
    return bufferContainer;
}
pub fn VULKAN_INTERNAL_GetTextureSubresourceIndex(mipLevel: Uint32, layer: Uint32, numLevels: Uint32) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    return mipLevel +% (layer *% numLevels);
}
pub fn VULKAN_INTERNAL_FetchTextureSubresource(textureContainer: [*c]VulkanTextureContainer, layer: Uint32, level: Uint32) callconv(.c) [*c]VulkanTextureSubresource {
    @setEvalBranchQuota(100000);
    var index_1: Uint32 = VULKAN_INTERNAL_GetTextureSubresourceIndex(level, layer, textureContainer.*.header.info.num_levels);
    _ = &index_1;
    return &textureContainer.*.activeTexture.*.subresources[index_1];
}
pub fn VULKAN_INTERNAL_CreateRenderTargetView(renderer: [*c]VulkanRenderer, texture: [*c]VulkanTexture, layerOrDepth: Uint32, level: Uint32, format: VkFormat, swizzle: VkComponentMapping, pView: [*c]VkImageView) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var vulkanResult: VkResult = undefined;
    _ = &vulkanResult;
    var imageViewCreateInfo: VkImageViewCreateInfo = undefined;
    _ = &imageViewCreateInfo;
    imageViewCreateInfo.sType = VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO;
    imageViewCreateInfo.pNext = null;
    imageViewCreateInfo.flags = 0;
    imageViewCreateInfo.image = texture.*.image;
    imageViewCreateInfo.format = format;
    imageViewCreateInfo.components = swizzle;
    imageViewCreateInfo.subresourceRange.aspectMask = texture.*.aspectFlags;
    imageViewCreateInfo.subresourceRange.baseMipLevel = level;
    imageViewCreateInfo.subresourceRange.levelCount = 1;
    imageViewCreateInfo.subresourceRange.baseArrayLayer = layerOrDepth;
    imageViewCreateInfo.subresourceRange.layerCount = 1;
    imageViewCreateInfo.viewType = VK_IMAGE_VIEW_TYPE_2D;
    vulkanResult = renderer.*.vkCreateImageView.?(renderer.*.logicalDevice, &imageViewCreateInfo, null, pView);
    if (vulkanResult != VK_SUCCESS) {
        pView.* = null;
        while (true) {
            if (vulkanResult != VK_SUCCESS) {
                if (renderer.*.debugMode) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateImageView"))), VkErrorMessages(vulkanResult));
                }
                _ = SDL_SetError_REAL("%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateImageView"))), VkErrorMessages(vulkanResult));
                return @"false" != 0;
            }
            if (!false) break;
        }
    }
    return @"true" != 0;
}
pub fn VULKAN_INTERNAL_CreateSubresourceView(renderer: [*c]VulkanRenderer, createinfo: [*c]const SDL_GPUTextureCreateInfo, texture: [*c]VulkanTexture, layer: Uint32, level: Uint32, swizzle: VkComponentMapping, pView: [*c]VkImageView) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var vulkanResult: VkResult = undefined;
    _ = &vulkanResult;
    var imageViewCreateInfo: VkImageViewCreateInfo = undefined;
    _ = &imageViewCreateInfo;
    imageViewCreateInfo.sType = VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO;
    imageViewCreateInfo.pNext = null;
    imageViewCreateInfo.flags = 0;
    imageViewCreateInfo.image = texture.*.image;
    imageViewCreateInfo.format = SDLToVK_TextureFormat[createinfo.*.format];
    imageViewCreateInfo.components = swizzle;
    imageViewCreateInfo.subresourceRange.aspectMask = texture.*.aspectFlags;
    imageViewCreateInfo.subresourceRange.baseMipLevel = level;
    imageViewCreateInfo.subresourceRange.levelCount = 1;
    imageViewCreateInfo.subresourceRange.baseArrayLayer = layer;
    imageViewCreateInfo.subresourceRange.layerCount = 1;
    imageViewCreateInfo.viewType = @bitCast(if (createinfo.*.type == @as(SDL_GPUTextureType, SDL_GPU_TEXTURETYPE_3D)) VK_IMAGE_VIEW_TYPE_3D else VK_IMAGE_VIEW_TYPE_2D);
    vulkanResult = renderer.*.vkCreateImageView.?(renderer.*.logicalDevice, &imageViewCreateInfo, null, pView);
    if (vulkanResult != VK_SUCCESS) {
        pView.* = null;
        while (true) {
            if (vulkanResult != VK_SUCCESS) {
                if (renderer.*.debugMode) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateImageView"))), VkErrorMessages(vulkanResult));
                }
                _ = SDL_SetError_REAL("%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateImageView"))), VkErrorMessages(vulkanResult));
                return @"false" != 0;
            }
            if (!false) break;
        }
    }
    return @"true" != 0;
}
pub fn VULKAN_INTERNAL_QuerySwapchainSupport(renderer: [*c]VulkanRenderer, physicalDevice: VkPhysicalDevice, surface: VkSurfaceKHR, outputDetails: [*c]SwapchainSupportDetails) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var result: VkResult = undefined;
    _ = &result;
    var supportsPresent: VkBool32 = undefined;
    _ = &supportsPresent;
    _ = renderer.*.vkGetPhysicalDeviceSurfaceSupportKHR.?(physicalDevice, renderer.*.queueFamilyIndex, surface, &supportsPresent);
    outputDetails.*.formats = null;
    outputDetails.*.formatsLength = 0;
    outputDetails.*.presentModes = null;
    outputDetails.*.presentModesLength = 0;
    if (!(supportsPresent != 0)) {
        while (true) {
            while (true) {
                if (renderer.*.debugMode) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s", @as([*c]u8, @as([*c]u8, @constCast("This surface does not support presenting!"))));
                }
                _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("This surface does not support presenting!"))));
                if (!false) break;
            }
            return @"false" != 0;
        }
    }
    result = renderer.*.vkGetPhysicalDeviceSurfaceCapabilitiesKHR.?(physicalDevice, surface, &outputDetails.*.capabilities);
    while (true) {
        if (result != VK_SUCCESS) {
            if (renderer.*.debugMode) {
                SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkGetPhysicalDeviceSurfaceCapabilitiesKHR"))), VkErrorMessages(result));
            }
            _ = SDL_SetError_REAL("%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkGetPhysicalDeviceSurfaceCapabilitiesKHR"))), VkErrorMessages(result));
            return @"false" != 0;
        }
        if (!false) break;
    }
    if (!((outputDetails.*.capabilities.supportedCompositeAlpha & @as(VkCompositeAlphaFlagsKHR, VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR)) != 0)) {
        SDL_LogWarn_REAL(SDL_LOG_CATEGORY_GPU, "Opaque presentation unsupported! Expect weird transparency bugs!");
    }
    result = renderer.*.vkGetPhysicalDeviceSurfaceFormatsKHR.?(physicalDevice, surface, &outputDetails.*.formatsLength, null);
    if (result != VK_SUCCESS) {
        outputDetails.*.formatsLength = 0;
        while (true) {
            if (result != VK_SUCCESS) {
                if (renderer.*.debugMode) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkGetPhysicalDeviceSurfaceFormatsKHR"))), VkErrorMessages(result));
                }
                _ = SDL_SetError_REAL("%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkGetPhysicalDeviceSurfaceFormatsKHR"))), VkErrorMessages(result));
                return @"false" != 0;
            }
            if (!false) break;
        }
    }
    result = renderer.*.vkGetPhysicalDeviceSurfacePresentModesKHR.?(physicalDevice, surface, &outputDetails.*.presentModesLength, null);
    if (result != VK_SUCCESS) {
        outputDetails.*.presentModesLength = 0;
        outputDetails.*.formatsLength = 0;
        while (true) {
            if (result != VK_SUCCESS) {
                if (renderer.*.debugMode) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkGetPhysicalDeviceSurfacePresentModesKHR"))), VkErrorMessages(result));
                }
                _ = SDL_SetError_REAL("%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkGetPhysicalDeviceSurfacePresentModesKHR"))), VkErrorMessages(result));
                return @"false" != 0;
            }
            if (!false) break;
        }
    }
    if (outputDetails.*.formatsLength != @as(Uint32, 0)) {
        outputDetails.*.formats = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(VkSurfaceFormatKHR) *% @as(c_ulong, outputDetails.*.formatsLength))));
        if (!(outputDetails.*.formats != null)) {
            outputDetails.*.formatsLength = 0;
            outputDetails.*.presentModesLength = 0;
            return @"false" != 0;
        }
        result = renderer.*.vkGetPhysicalDeviceSurfaceFormatsKHR.?(physicalDevice, surface, &outputDetails.*.formatsLength, outputDetails.*.formats);
        if (result != VK_SUCCESS) {
            SDL_free_REAL(@ptrCast(@alignCast(outputDetails.*.formats)));
            outputDetails.*.formats = null;
            outputDetails.*.formatsLength = 0;
            outputDetails.*.presentModesLength = 0;
            while (true) {
                if (result != VK_SUCCESS) {
                    if (renderer.*.debugMode) {
                        SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkGetPhysicalDeviceSurfaceFormatsKHR"))), VkErrorMessages(result));
                    }
                    _ = SDL_SetError_REAL("%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkGetPhysicalDeviceSurfaceFormatsKHR"))), VkErrorMessages(result));
                    return @"false" != 0;
                }
                if (!false) break;
            }
        }
    }
    if (outputDetails.*.presentModesLength != @as(Uint32, 0)) {
        outputDetails.*.presentModes = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(VkPresentModeKHR) *% @as(c_ulong, outputDetails.*.presentModesLength))));
        if (!(outputDetails.*.presentModes != null)) {
            SDL_free_REAL(@ptrCast(@alignCast(outputDetails.*.formats)));
            outputDetails.*.formats = null;
            outputDetails.*.formatsLength = 0;
            outputDetails.*.presentModesLength = 0;
            return @"false" != 0;
        }
        result = renderer.*.vkGetPhysicalDeviceSurfacePresentModesKHR.?(physicalDevice, surface, &outputDetails.*.presentModesLength, outputDetails.*.presentModes);
        if (result != VK_SUCCESS) {
            SDL_free_REAL(@ptrCast(@alignCast(outputDetails.*.formats)));
            SDL_free_REAL(@ptrCast(@alignCast(outputDetails.*.presentModes)));
            outputDetails.*.formats = null;
            outputDetails.*.presentModes = null;
            outputDetails.*.formatsLength = 0;
            outputDetails.*.presentModesLength = 0;
            while (true) {
                if (result != VK_SUCCESS) {
                    if (renderer.*.debugMode) {
                        SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkGetPhysicalDeviceSurfacePresentModesKHR"))), VkErrorMessages(result));
                    }
                    _ = SDL_SetError_REAL("%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkGetPhysicalDeviceSurfacePresentModesKHR"))), VkErrorMessages(result));
                    return @"false" != 0;
                }
                if (!false) break;
            }
        }
    }
    return @"true" != 0;
}
pub fn VULKAN_INTERNAL_VerifySwapSurfaceFormat(desiredFormat: VkFormat, desiredColorSpace: VkColorSpaceKHR, availableFormats: [*c]VkSurfaceFormatKHR, availableFormatsLength: Uint32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var i: Uint32 = undefined;
    _ = &i;
    {
        i = 0;
        while (i < availableFormatsLength) : (i +%= 1) {
            if ((availableFormats[i].format == desiredFormat) and (availableFormats[i].colorSpace == desiredColorSpace)) {
                return @"true" != 0;
            }
        }
    }
    return @"false" != 0;
}
pub fn VULKAN_INTERNAL_VerifySwapPresentMode(presentMode: VkPresentModeKHR, availablePresentModes: [*c]const VkPresentModeKHR, availablePresentModesLength: Uint32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var i: Uint32 = undefined;
    _ = &i;
    {
        i = 0;
        while (i < availablePresentModesLength) : (i +%= 1) {
            if (availablePresentModes[i] == presentMode) {
                return @"true" != 0;
            }
        }
    }
    return @"false" != 0;
}
pub fn VULKAN_INTERNAL_CreateSwapchain(renderer: [*c]VulkanRenderer, windowData: [*c]WindowData) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    var vulkanResult: VkResult = undefined;
    _ = &vulkanResult;
    var swapchainCreateInfo: VkSwapchainCreateInfoKHR = undefined;
    _ = &swapchainCreateInfo;
    var swapchainImages: [*c]VkImage = undefined;
    _ = &swapchainImages;
    var semaphoreCreateInfo: VkSemaphoreCreateInfo = undefined;
    _ = &semaphoreCreateInfo;
    var swapchainSupportDetails: SwapchainSupportDetails = undefined;
    _ = &swapchainSupportDetails;
    var hasValidSwapchainComposition: bool = undefined;
    _ = &hasValidSwapchainComposition;
    var hasValidPresentMode: bool = undefined;
    _ = &hasValidPresentMode;
    var compositeAlphaFlag: VkCompositeAlphaFlagsKHR = 0;
    _ = &compositeAlphaFlag;
    var i: Uint32 = undefined;
    _ = &i;
    windowData.*.frameCounter = 0;
    if (!VULKAN_INTERNAL_QuerySwapchainSupport(renderer, renderer.*.physicalDevice, windowData.*.surface, &swapchainSupportDetails)) {
        return @"false";
    }
    windowData.*.format = SwapchainCompositionToFormat[windowData.*.swapchainComposition];
    windowData.*.colorSpace = SwapchainCompositionToColorSpace[windowData.*.swapchainComposition];
    windowData.*.swapchainSwizzle = SwapchainCompositionSwizzle[windowData.*.swapchainComposition];
    windowData.*.usingFallbackFormat = @"false" != 0;
    hasValidSwapchainComposition = VULKAN_INTERNAL_VerifySwapSurfaceFormat(windowData.*.format, windowData.*.colorSpace, swapchainSupportDetails.formats, swapchainSupportDetails.formatsLength);
    if (!hasValidSwapchainComposition) {
        windowData.*.format = SwapchainCompositionToFallbackFormat[windowData.*.swapchainComposition];
        windowData.*.usingFallbackFormat = @"true" != 0;
        hasValidSwapchainComposition = VULKAN_INTERNAL_VerifySwapSurfaceFormat(windowData.*.format, windowData.*.colorSpace, swapchainSupportDetails.formats, swapchainSupportDetails.formatsLength);
    }
    hasValidPresentMode = VULKAN_INTERNAL_VerifySwapPresentMode(SDLToVK_PresentMode[windowData.*.presentMode], swapchainSupportDetails.presentModes, swapchainSupportDetails.presentModesLength);
    if (!hasValidSwapchainComposition or !hasValidPresentMode) {
        if (swapchainSupportDetails.formatsLength > @as(Uint32, 0)) {
            SDL_free_REAL(@ptrCast(@alignCast(swapchainSupportDetails.formats)));
        }
        if (swapchainSupportDetails.presentModesLength > @as(Uint32, 0)) {
            SDL_free_REAL(@ptrCast(@alignCast(swapchainSupportDetails.presentModes)));
        }
        if (!hasValidSwapchainComposition) {
            while (true) {
                while (true) {
                    if (renderer.*.debugMode) {
                        SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s", @as([*c]u8, @as([*c]u8, @constCast("Device does not support requested swapchain composition!"))));
                    }
                    _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("Device does not support requested swapchain composition!"))));
                    if (!false) break;
                }
                return @"false";
            }
        }
        if (!hasValidPresentMode) {
            while (true) {
                while (true) {
                    if (renderer.*.debugMode) {
                        SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s", @as([*c]u8, @as([*c]u8, @constCast("Device does not support requested present_mode!"))));
                    }
                    _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("Device does not support requested present_mode!"))));
                    if (!false) break;
                }
                return @"false";
            }
        }
        return @"false";
    }
    if ((swapchainSupportDetails.capabilities.currentExtent.width == @as(u32, 0)) or (swapchainSupportDetails.capabilities.currentExtent.height == @as(u32, 0))) {
        if (swapchainSupportDetails.formatsLength > @as(Uint32, 0)) {
            SDL_free_REAL(@ptrCast(@alignCast(swapchainSupportDetails.formats)));
        }
        if (swapchainSupportDetails.presentModesLength > @as(Uint32, 0)) {
            SDL_free_REAL(@ptrCast(@alignCast(swapchainSupportDetails.presentModes)));
        }
        return VULKAN_INTERNAL_TRY_AGAIN;
    }
    var requestedImageCount: Uint32 = renderer.*.allowedFramesInFlight;
    _ = &requestedImageCount;
    windowData.*.width = if (windowData.*.swapchainCreateWidth < swapchainSupportDetails.capabilities.minImageExtent.width) swapchainSupportDetails.capabilities.minImageExtent.width else if (windowData.*.swapchainCreateWidth > swapchainSupportDetails.capabilities.maxImageExtent.width) swapchainSupportDetails.capabilities.maxImageExtent.width else windowData.*.swapchainCreateWidth;
    windowData.*.height = if (windowData.*.swapchainCreateHeight < swapchainSupportDetails.capabilities.minImageExtent.height) swapchainSupportDetails.capabilities.minImageExtent.height else if (windowData.*.swapchainCreateHeight > swapchainSupportDetails.capabilities.maxImageExtent.height) swapchainSupportDetails.capabilities.maxImageExtent.height else windowData.*.swapchainCreateHeight;
    if ((swapchainSupportDetails.capabilities.maxImageCount > @as(u32, 0)) and (requestedImageCount > swapchainSupportDetails.capabilities.maxImageCount)) {
        requestedImageCount = swapchainSupportDetails.capabilities.maxImageCount;
    }
    if (requestedImageCount < swapchainSupportDetails.capabilities.minImageCount) {
        requestedImageCount = swapchainSupportDetails.capabilities.minImageCount;
    }
    if (windowData.*.presentMode == @as(SDL_GPUPresentMode, SDL_GPU_PRESENTMODE_MAILBOX)) {
        requestedImageCount = if (requestedImageCount > @as(Uint32, @bitCast(@as(c_int, @as(c_int, 3))))) requestedImageCount else @as(Uint32, @bitCast(@as(c_int, @as(c_int, 3))));
    }
    if ((swapchainSupportDetails.capabilities.supportedCompositeAlpha & @as(VkCompositeAlphaFlagsKHR, VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR)) != 0) {
        compositeAlphaFlag = VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR;
    } else if ((swapchainSupportDetails.capabilities.supportedCompositeAlpha & @as(VkCompositeAlphaFlagsKHR, VK_COMPOSITE_ALPHA_INHERIT_BIT_KHR)) != 0) {
        compositeAlphaFlag = VK_COMPOSITE_ALPHA_INHERIT_BIT_KHR;
    }
    if (((windowData.*.window.*.flags & @as(c_ulong, 1073741824)) != 0) or (@as(SDL_WindowFlags, @bitCast(@as(c_long, @intFromBool(!(compositeAlphaFlag != 0))))) != 0)) {
        if ((swapchainSupportDetails.capabilities.supportedCompositeAlpha & @as(VkCompositeAlphaFlagsKHR, VK_COMPOSITE_ALPHA_PRE_MULTIPLIED_BIT_KHR)) != 0) {
            compositeAlphaFlag = VK_COMPOSITE_ALPHA_PRE_MULTIPLIED_BIT_KHR;
        } else if ((swapchainSupportDetails.capabilities.supportedCompositeAlpha & @as(VkCompositeAlphaFlagsKHR, VK_COMPOSITE_ALPHA_POST_MULTIPLIED_BIT_KHR)) != 0) {
            compositeAlphaFlag = VK_COMPOSITE_ALPHA_POST_MULTIPLIED_BIT_KHR;
        } else if ((swapchainSupportDetails.capabilities.supportedCompositeAlpha & @as(VkCompositeAlphaFlagsKHR, VK_COMPOSITE_ALPHA_INHERIT_BIT_KHR)) != 0) {
            compositeAlphaFlag = VK_COMPOSITE_ALPHA_INHERIT_BIT_KHR;
        } else {
            SDL_LogWarn_REAL(SDL_LOG_CATEGORY_GPU, "SDL_WINDOW_TRANSPARENT flag set, but no suitable swapchain composite alpha value supported!");
        }
    }
    swapchainCreateInfo.sType = VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR;
    swapchainCreateInfo.pNext = null;
    swapchainCreateInfo.flags = 0;
    swapchainCreateInfo.surface = windowData.*.surface;
    swapchainCreateInfo.minImageCount = requestedImageCount;
    swapchainCreateInfo.imageFormat = windowData.*.format;
    swapchainCreateInfo.imageColorSpace = windowData.*.colorSpace;
    swapchainCreateInfo.imageExtent.width = windowData.*.width;
    swapchainCreateInfo.imageExtent.height = windowData.*.height;
    swapchainCreateInfo.imageArrayLayers = 1;
    swapchainCreateInfo.imageUsage = @bitCast(@as(c_int, VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT | VK_IMAGE_USAGE_TRANSFER_DST_BIT));
    swapchainCreateInfo.imageSharingMode = VK_SHARING_MODE_EXCLUSIVE;
    swapchainCreateInfo.queueFamilyIndexCount = 0;
    swapchainCreateInfo.pQueueFamilyIndices = null;
    swapchainCreateInfo.preTransform = swapchainSupportDetails.capabilities.currentTransform;
    swapchainCreateInfo.compositeAlpha = compositeAlphaFlag;
    swapchainCreateInfo.presentMode = SDLToVK_PresentMode[windowData.*.presentMode];
    swapchainCreateInfo.clipped = VK_TRUE;
    swapchainCreateInfo.oldSwapchain = if (windowData.*.needsSurfaceRecreate) @as(VkSwapchainKHR, null) else windowData.*.swapchain;
    vulkanResult = renderer.*.vkCreateSwapchainKHR.?(renderer.*.logicalDevice, &swapchainCreateInfo, null, &windowData.*.swapchain);
    if (@as(?*anyopaque, @ptrCast(@alignCast(swapchainCreateInfo.oldSwapchain))) != @as(?*anyopaque, null)) {
        renderer.*.vkDestroySwapchainKHR.?(renderer.*.logicalDevice, swapchainCreateInfo.oldSwapchain, null);
    }
    if (swapchainSupportDetails.formatsLength > @as(Uint32, 0)) {
        SDL_free_REAL(@ptrCast(@alignCast(swapchainSupportDetails.formats)));
    }
    if (swapchainSupportDetails.presentModesLength > @as(Uint32, 0)) {
        SDL_free_REAL(@ptrCast(@alignCast(swapchainSupportDetails.presentModes)));
    }
    if (vulkanResult != VK_SUCCESS) {
        windowData.*.swapchain = null;
        while (true) {
            if (vulkanResult != VK_SUCCESS) {
                if (renderer.*.debugMode) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateSwapchainKHR"))), VkErrorMessages(vulkanResult));
                }
                _ = SDL_SetError_REAL("%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateSwapchainKHR"))), VkErrorMessages(vulkanResult));
                return @bitCast(@as(c_int, @"false"));
            }
            if (!false) break;
        }
    }
    vulkanResult = renderer.*.vkGetSwapchainImagesKHR.?(renderer.*.logicalDevice, windowData.*.swapchain, &windowData.*.imageCount, null);
    while (true) {
        if (vulkanResult != VK_SUCCESS) {
            if (renderer.*.debugMode) {
                SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkGetSwapchainImagesKHR"))), VkErrorMessages(vulkanResult));
            }
            _ = SDL_SetError_REAL("%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkGetSwapchainImagesKHR"))), VkErrorMessages(vulkanResult));
            return @bitCast(@as(c_int, @"false"));
        }
        if (!false) break;
    }
    windowData.*.textureContainers = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(VulkanTextureContainer) *% @as(c_ulong, windowData.*.imageCount))));
    if (!(windowData.*.textureContainers != null)) {
        renderer.*.vkDestroySwapchainKHR.?(renderer.*.logicalDevice, windowData.*.swapchain, null);
        windowData.*.swapchain = null;
        return @"false";
    }
    swapchainImages = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(VkImage) *% @as(c_ulong, windowData.*.imageCount))));
    vulkanResult = renderer.*.vkGetSwapchainImagesKHR.?(renderer.*.logicalDevice, windowData.*.swapchain, &windowData.*.imageCount, swapchainImages);
    while (true) {
        if (vulkanResult != VK_SUCCESS) {
            if (renderer.*.debugMode) {
                SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkGetSwapchainImagesKHR"))), VkErrorMessages(vulkanResult));
            }
            _ = SDL_SetError_REAL("%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkGetSwapchainImagesKHR"))), VkErrorMessages(vulkanResult));
            return @bitCast(@as(c_int, @"false"));
        }
        if (!false) break;
    }
    {
        i = 0;
        while (i < windowData.*.imageCount) : (i +%= 1) {
            _ = memset(@ptrCast(@alignCast(&windowData.*.textureContainers[i])), 0, @sizeOf(@TypeOf(windowData.*.textureContainers[i])));
            windowData.*.textureContainers[i].canBeCycled = @"false" != 0;
            windowData.*.textureContainers[i].header.info.width = windowData.*.width;
            windowData.*.textureContainers[i].header.info.height = windowData.*.height;
            windowData.*.textureContainers[i].header.info.layer_count_or_depth = 1;
            windowData.*.textureContainers[i].header.info.format = SwapchainCompositionToSDLFormat(windowData.*.swapchainComposition, windowData.*.usingFallbackFormat);
            windowData.*.textureContainers[i].header.info.type = SDL_GPU_TEXTURETYPE_2D;
            windowData.*.textureContainers[i].header.info.num_levels = 1;
            windowData.*.textureContainers[i].header.info.sample_count = SDL_GPU_SAMPLECOUNT_1;
            windowData.*.textureContainers[i].header.info.usage = @as(c_uint, 1) << @intCast(@as(c_uint, 1));
            windowData.*.textureContainers[i].activeTexture = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(VulkanTexture))));
            windowData.*.textureContainers[i].activeTexture.*.image = swapchainImages[i];
            windowData.*.textureContainers[i].activeTexture.*.usedRegion = null;
            windowData.*.textureContainers[i].activeTexture.*.swizzle = windowData.*.swapchainSwizzle;
            windowData.*.textureContainers[i].activeTexture.*.aspectFlags = VK_IMAGE_ASPECT_COLOR_BIT;
            windowData.*.textureContainers[i].activeTexture.*.depth = 1;
            windowData.*.textureContainers[i].activeTexture.*.usage = @as(c_uint, 1) << @intCast(@as(c_uint, 1));
            windowData.*.textureContainers[i].activeTexture.*.levelCount = 1;
            windowData.*.textureContainers[i].activeTexture.*.layerCount = 1;
            windowData.*.textureContainers[i].activeTexture.*.type = SDL_GPU_TEXTURETYPE_2D;
            windowData.*.textureContainers[i].activeTexture.*.container = &windowData.*.textureContainers[i];
            _ = SDL_SetAtomicInt_REAL(&windowData.*.textureContainers[i].activeTexture.*.referenceCount, 0);
            windowData.*.textureContainers[i].activeTexture.*.subresourceCount = 1;
            windowData.*.textureContainers[i].activeTexture.*.subresources = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(VulkanTextureSubresource))));
            windowData.*.textureContainers[i].activeTexture.*.subresources[@as(c_int, 0)].parent = windowData.*.textureContainers[i].activeTexture;
            windowData.*.textureContainers[i].activeTexture.*.subresources[@as(c_int, 0)].layer = 0;
            windowData.*.textureContainers[i].activeTexture.*.subresources[@as(c_int, 0)].level = 0;
            windowData.*.textureContainers[i].activeTexture.*.subresources[@as(c_int, 0)].renderTargetViews = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(VkImageView))));
            if (!VULKAN_INTERNAL_CreateRenderTargetView(renderer, windowData.*.textureContainers[i].activeTexture, 0, 0, windowData.*.format, windowData.*.swapchainSwizzle, &windowData.*.textureContainers[i].activeTexture.*.subresources[@as(c_int, 0)].renderTargetViews[@as(c_int, 0)])) {
                renderer.*.vkDestroySwapchainKHR.?(renderer.*.logicalDevice, windowData.*.swapchain, null);
                windowData.*.swapchain = null;
                return @"false";
            }
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(swapchainImages)));
    semaphoreCreateInfo.sType = VK_STRUCTURE_TYPE_SEMAPHORE_CREATE_INFO;
    semaphoreCreateInfo.pNext = null;
    semaphoreCreateInfo.flags = 0;
    {
        i = 0;
        while (i < @as(Uint32, MAX_FRAMES_IN_FLIGHT)) : (i +%= 1) {
            vulkanResult = renderer.*.vkCreateSemaphore.?(renderer.*.logicalDevice, &semaphoreCreateInfo, null, &windowData.*.imageAvailableSemaphore[i]);
            if (vulkanResult != VK_SUCCESS) {
                renderer.*.vkDestroySwapchainKHR.?(renderer.*.logicalDevice, windowData.*.swapchain, null);
                windowData.*.swapchain = null;
                while (true) {
                    if (vulkanResult != VK_SUCCESS) {
                        if (renderer.*.debugMode) {
                            SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateSemaphore"))), VkErrorMessages(vulkanResult));
                        }
                        _ = SDL_SetError_REAL("%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateSemaphore"))), VkErrorMessages(vulkanResult));
                        return @bitCast(@as(c_int, @"false"));
                    }
                    if (!false) break;
                }
            }
            windowData.*.inFlightFences[i] = null;
        }
    }
    windowData.*.renderFinishedSemaphore = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(VkSemaphore) *% @as(c_ulong, windowData.*.imageCount))));
    {
        i = 0;
        while (i < windowData.*.imageCount) : (i +%= 1) {
            vulkanResult = renderer.*.vkCreateSemaphore.?(renderer.*.logicalDevice, &semaphoreCreateInfo, null, &windowData.*.renderFinishedSemaphore[i]);
            if (vulkanResult != VK_SUCCESS) {
                renderer.*.vkDestroySwapchainKHR.?(renderer.*.logicalDevice, windowData.*.swapchain, null);
                windowData.*.swapchain = null;
                while (true) {
                    if (vulkanResult != VK_SUCCESS) {
                        if (renderer.*.debugMode) {
                            SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateSemaphore"))), VkErrorMessages(vulkanResult));
                        }
                        _ = SDL_SetError_REAL("%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateSemaphore"))), VkErrorMessages(vulkanResult));
                        return @bitCast(@as(c_int, @"false"));
                    }
                    if (!false) break;
                }
            }
        }
    }
    windowData.*.needsSwapchainRecreate = @"false" != 0;
    return @"true";
}
pub fn VULKAN_INTERNAL_BeginCommandBuffer(renderer: [*c]VulkanRenderer, commandBuffer: [*c]VulkanCommandBuffer) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var beginInfo: VkCommandBufferBeginInfo = undefined;
    _ = &beginInfo;
    var result: VkResult = undefined;
    _ = &result;
    beginInfo.sType = VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO;
    beginInfo.pNext = null;
    beginInfo.flags = 0;
    beginInfo.pInheritanceInfo = null;
    beginInfo.flags = VK_COMMAND_BUFFER_USAGE_ONE_TIME_SUBMIT_BIT;
    result = renderer.*.vkBeginCommandBuffer.?(commandBuffer.*.commandBuffer, &beginInfo);
    while (true) {
        if (result != VK_SUCCESS) {
            if (renderer.*.debugMode) {
                SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkBeginCommandBuffer"))), VkErrorMessages(result));
            }
            _ = SDL_SetError_REAL("%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkBeginCommandBuffer"))), VkErrorMessages(result));
            return @"false" != 0;
        }
        if (!false) break;
    }
    return @"true" != 0;
}
pub fn VULKAN_INTERNAL_EndCommandBuffer(renderer: [*c]VulkanRenderer, commandBuffer: [*c]VulkanCommandBuffer) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var result: VkResult = renderer.*.vkEndCommandBuffer.?(commandBuffer.*.commandBuffer);
    _ = &result;
    while (true) {
        if (result != VK_SUCCESS) {
            if (renderer.*.debugMode) {
                SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkEndCommandBuffer"))), VkErrorMessages(result));
            }
            _ = SDL_SetError_REAL("%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkEndCommandBuffer"))), VkErrorMessages(result));
            return @"false" != 0;
        }
        if (!false) break;
    }
    return @"true" != 0;
}
pub fn VULKAN_DestroyDevice(device: [*c]SDL_GPUDevice) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var renderer: [*c]VulkanRenderer = @ptrCast(@alignCast(device.*.driverData));
    _ = &renderer;
    var allocator: [*c]VulkanMemorySubAllocator = undefined;
    _ = &allocator;
    _ = VULKAN_Wait(device.*.driverData);
    {
        var i: Sint32 = @bitCast(@as(c_uint, @truncate(renderer.*.claimedWindowCount -% @as(Uint32, 1))));
        _ = &i;
        while (i >= @as(c_int, 0)) : (i -= 1) {
            VULKAN_ReleaseWindow(device.*.driverData, renderer.*.claimedWindows[@bitCast(@as(isize, @intCast(i)))].*.window);
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(renderer.*.claimedWindows)));
    _ = VULKAN_Wait(device.*.driverData);
    SDL_free_REAL(@ptrCast(@alignCast(renderer.*.submittedCommandBuffers)));
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < renderer.*.uniformBufferPoolCount) : (i +%= 1) {
            VULKAN_INTERNAL_DestroyBuffer(renderer, renderer.*.uniformBufferPool[i].*.buffer);
            SDL_free_REAL(@ptrCast(@alignCast(renderer.*.uniformBufferPool[i])));
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(renderer.*.uniformBufferPool)));
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < renderer.*.descriptorSetCachePoolCount) : (i +%= 1) {
            VULKAN_INTERNAL_DestroyDescriptorSetCache(renderer, renderer.*.descriptorSetCachePool[i]);
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(renderer.*.descriptorSetCachePool)));
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < renderer.*.fencePool.availableFenceCount) : (i +%= 1) {
            renderer.*.vkDestroyFence.?(renderer.*.logicalDevice, renderer.*.fencePool.availableFences[i].*.fence, null);
            SDL_free_REAL(@ptrCast(@alignCast(renderer.*.fencePool.availableFences[i])));
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(renderer.*.fencePool.availableFences)));
    SDL_DestroyMutex_REAL(renderer.*.fencePool.lock);
    SDL_DestroyHashTable(renderer.*.commandPoolHashTable);
    SDL_DestroyHashTable(renderer.*.renderPassHashTable);
    SDL_DestroyHashTable(renderer.*.framebufferHashTable);
    SDL_DestroyHashTable(renderer.*.graphicsPipelineResourceLayoutHashTable);
    SDL_DestroyHashTable(renderer.*.computePipelineResourceLayoutHashTable);
    SDL_DestroyHashTable(renderer.*.descriptorSetLayoutHashTable);
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < VK_MAX_MEMORY_TYPES) : (i +%= 1) {
            allocator = &renderer.*.memoryAllocator.*.subAllocators[i];
            {
                var j: Sint32 = @bitCast(@as(c_uint, @truncate(allocator.*.allocationCount -% @as(Uint32, 1))));
                _ = &j;
                while (j >= @as(c_int, 0)) : (j -= 1) {
                    {
                        var k: Sint32 = @bitCast(@as(c_uint, @truncate(allocator.*.allocations[@bitCast(@as(isize, @intCast(j)))].*.usedRegionCount -% @as(Uint32, 1))));
                        _ = &k;
                        while (k >= @as(c_int, 0)) : (k -= 1) {
                            VULKAN_INTERNAL_RemoveMemoryUsedRegion(renderer, allocator.*.allocations[@bitCast(@as(isize, @intCast(j)))].*.usedRegions[@bitCast(@as(isize, @intCast(k)))]);
                        }
                    }
                    VULKAN_INTERNAL_DeallocateMemory(renderer, allocator, @bitCast(@as(c_int, j)));
                }
            }
            SDL_free_REAL(@ptrCast(@alignCast(renderer.*.memoryAllocator.*.subAllocators[i].allocations)));
            SDL_free_REAL(@ptrCast(@alignCast(renderer.*.memoryAllocator.*.subAllocators[i].sortedFreeRegions)));
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(renderer.*.memoryAllocator)));
    SDL_free_REAL(@ptrCast(@alignCast(renderer.*.texturesToDestroy)));
    SDL_free_REAL(@ptrCast(@alignCast(renderer.*.buffersToDestroy)));
    SDL_free_REAL(@ptrCast(@alignCast(renderer.*.graphicsPipelinesToDestroy)));
    SDL_free_REAL(@ptrCast(@alignCast(renderer.*.computePipelinesToDestroy)));
    SDL_free_REAL(@ptrCast(@alignCast(renderer.*.shadersToDestroy)));
    SDL_free_REAL(@ptrCast(@alignCast(renderer.*.samplersToDestroy)));
    SDL_free_REAL(@ptrCast(@alignCast(renderer.*.framebuffersToDestroy)));
    SDL_free_REAL(@ptrCast(@alignCast(renderer.*.allocationsToDefrag)));
    SDL_DestroyMutex_REAL(renderer.*.allocatorLock);
    SDL_DestroyMutex_REAL(renderer.*.disposeLock);
    SDL_DestroyMutex_REAL(renderer.*.submitLock);
    SDL_DestroyMutex_REAL(renderer.*.acquireCommandBufferLock);
    SDL_DestroyMutex_REAL(renderer.*.acquireUniformBufferLock);
    SDL_DestroyMutex_REAL(renderer.*.renderPassFetchLock);
    SDL_DestroyMutex_REAL(renderer.*.framebufferFetchLock);
    SDL_DestroyMutex_REAL(renderer.*.graphicsPipelineLayoutFetchLock);
    SDL_DestroyMutex_REAL(renderer.*.computePipelineLayoutFetchLock);
    SDL_DestroyMutex_REAL(renderer.*.descriptorSetLayoutFetchLock);
    SDL_DestroyMutex_REAL(renderer.*.windowLock);
    renderer.*.vkDestroyDevice.?(renderer.*.logicalDevice, null);
    renderer.*.vkDestroyInstance.?(renderer.*.instance, null);
    SDL_DestroyProperties_REAL(renderer.*.props);
    SDL_free_REAL(@ptrCast(@alignCast(renderer)));
    SDL_free_REAL(@ptrCast(@alignCast(device)));
    SDL_Vulkan_UnloadLibrary_REAL();
}
pub fn VULKAN_GetDeviceProperties(device: [*c]SDL_GPUDevice) callconv(.c) SDL_PropertiesID {
    @setEvalBranchQuota(100000);
    var renderer: [*c]VulkanRenderer = @ptrCast(@alignCast(device.*.driverData));
    _ = &renderer;
    return renderer.*.props;
}
pub fn VULKAN_INTERNAL_AcquireDescriptorSetCache(renderer: [*c]VulkanRenderer) callconv(.c) [*c]DescriptorSetCache {
    @setEvalBranchQuota(100000);
    var cache: [*c]DescriptorSetCache = undefined;
    _ = &cache;
    if (renderer.*.descriptorSetCachePoolCount == @as(Uint32, 0)) {
        cache = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(DescriptorSetCache))));
        cache.*.poolCount = 0;
        cache.*.pools = null;
    } else {
        cache = renderer.*.descriptorSetCachePool[renderer.*.descriptorSetCachePoolCount -% @as(Uint32, 1)];
        renderer.*.descriptorSetCachePoolCount -%= 1;
    }
    return cache;
}
pub fn VULKAN_INTERNAL_ReturnDescriptorSetCacheToPool(renderer: [*c]VulkanRenderer, descriptorSetCache: [*c]DescriptorSetCache) callconv(.c) void {
    @setEvalBranchQuota(100000);
    while (true) {
        if ((renderer.*.descriptorSetCachePoolCount +% @as(Uint32, 1)) >= renderer.*.descriptorSetCachePoolCapacity) {
            renderer.*.descriptorSetCachePoolCapacity = renderer.*.descriptorSetCachePoolCapacity *% @as(Uint32, 2);
            renderer.*.descriptorSetCachePool = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(renderer.*.descriptorSetCachePool)), @sizeOf([*c]DescriptorSetCache) *% @as(c_ulong, renderer.*.descriptorSetCachePoolCapacity))));
        }
        if (!false) break;
    }
    renderer.*.descriptorSetCachePool[renderer.*.descriptorSetCachePoolCount] = descriptorSetCache;
    renderer.*.descriptorSetCachePoolCount +%= 1;
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < descriptorSetCache.*.poolCount) : (i +%= 1) {
            descriptorSetCache.*.pools[i].descriptorSetIndex = 0;
        }
    }
}
pub fn VULKAN_INTERNAL_FetchDescriptorSet(renderer: [*c]VulkanRenderer, vulkanCommandBuffer: [*c]VulkanCommandBuffer, descriptorSetLayout: [*c]DescriptorSetLayout) callconv(.c) VkDescriptorSet {
    @setEvalBranchQuota(100000);
    if (descriptorSetLayout.*.ID >= vulkanCommandBuffer.*.descriptorSetCache.*.poolCount) {
        vulkanCommandBuffer.*.descriptorSetCache.*.pools = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(vulkanCommandBuffer.*.descriptorSetCache.*.pools)), @sizeOf(DescriptorSetPool) *% @as(c_ulong, descriptorSetLayout.*.ID +% @as(DescriptorSetLayoutID, 1)))));
        {
            var i: Uint32 = vulkanCommandBuffer.*.descriptorSetCache.*.poolCount;
            _ = &i;
            while (i < (descriptorSetLayout.*.ID +% @as(DescriptorSetLayoutID, 1))) : (i +%= 1) {
                _ = memset(@ptrCast(@alignCast(&vulkanCommandBuffer.*.descriptorSetCache.*.pools[i])), 0, @sizeOf(@TypeOf(vulkanCommandBuffer.*.descriptorSetCache.*.pools[i])));
            }
        }
        vulkanCommandBuffer.*.descriptorSetCache.*.poolCount = descriptorSetLayout.*.ID +% @as(DescriptorSetLayoutID, 1);
    }
    var pool: [*c]DescriptorSetPool = &vulkanCommandBuffer.*.descriptorSetCache.*.pools[descriptorSetLayout.*.ID];
    _ = &pool;
    if (pool.*.descriptorSetIndex == pool.*.descriptorSetCount) {
        if (!VULKAN_INTERNAL_AllocateDescriptorsFromPool(renderer, descriptorSetLayout, pool)) {
            return null;
        }
    }
    var descriptorSet: VkDescriptorSet = pool.*.descriptorSets[pool.*.descriptorSetIndex];
    _ = &descriptorSet;
    pool.*.descriptorSetIndex +%= 1;
    return descriptorSet;
}
pub fn VULKAN_INTERNAL_BindGraphicsDescriptorSets(renderer: [*c]VulkanRenderer, commandBuffer: [*c]VulkanCommandBuffer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var resourceLayout: [*c]VulkanGraphicsPipelineResourceLayout = undefined;
    _ = &resourceLayout;
    var descriptorSetLayout: [*c]DescriptorSetLayout = undefined;
    _ = &descriptorSetLayout;
    var writeDescriptorSets: [72]VkWriteDescriptorSet = undefined;
    _ = &writeDescriptorSets;
    var bufferInfos: [16]VkDescriptorBufferInfo = undefined;
    _ = &bufferInfos;
    var imageInfos: [48]VkDescriptorImageInfo = undefined;
    _ = &imageInfos;
    var dynamicOffsets: [8]Uint32 = undefined;
    _ = &dynamicOffsets;
    var writeCount: Uint32 = 0;
    _ = &writeCount;
    var bufferInfoCount: Uint32 = 0;
    _ = &bufferInfoCount;
    var imageInfoCount: Uint32 = 0;
    _ = &imageInfoCount;
    var dynamicOffsetCount: Uint32 = 0;
    _ = &dynamicOffsetCount;
    if ((((((!commandBuffer.*.needVertexBufferBind and !commandBuffer.*.needNewVertexResourceDescriptorSet) and !commandBuffer.*.needNewVertexUniformDescriptorSet) and !commandBuffer.*.needNewVertexUniformOffsets) and !commandBuffer.*.needNewFragmentResourceDescriptorSet) and !commandBuffer.*.needNewFragmentUniformDescriptorSet) and !commandBuffer.*.needNewFragmentUniformOffsets) {
        return;
    }
    if (commandBuffer.*.needVertexBufferBind and (commandBuffer.*.vertexBufferCount > @as(Uint32, 0))) {
        renderer.*.vkCmdBindVertexBuffers.?(commandBuffer.*.commandBuffer, 0, commandBuffer.*.vertexBufferCount, @ptrCast(@alignCast(&commandBuffer.*.vertexBuffers)), @ptrCast(@alignCast(&commandBuffer.*.vertexBufferOffsets)));
        commandBuffer.*.needVertexBufferBind = @"false" != 0;
    }
    resourceLayout = commandBuffer.*.currentGraphicsPipeline.*.resourceLayout;
    if (commandBuffer.*.needNewVertexResourceDescriptorSet) {
        descriptorSetLayout = resourceLayout.*.descriptorSetLayouts[@as(c_int, 0)];
        commandBuffer.*.vertexResourceDescriptorSet = VULKAN_INTERNAL_FetchDescriptorSet(renderer, commandBuffer, descriptorSetLayout);
        {
            var i: Uint32 = 0;
            _ = &i;
            while (i < resourceLayout.*.vertexSamplerCount) : (i +%= 1) {
                var currentWriteDescriptorSet: [*c]VkWriteDescriptorSet = &writeDescriptorSets[writeCount];
                _ = &currentWriteDescriptorSet;
                currentWriteDescriptorSet.*.sType = VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET;
                currentWriteDescriptorSet.*.pNext = null;
                currentWriteDescriptorSet.*.descriptorCount = 1;
                currentWriteDescriptorSet.*.descriptorType = VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER;
                currentWriteDescriptorSet.*.dstArrayElement = 0;
                currentWriteDescriptorSet.*.dstBinding = i;
                currentWriteDescriptorSet.*.dstSet = commandBuffer.*.vertexResourceDescriptorSet;
                currentWriteDescriptorSet.*.pTexelBufferView = null;
                currentWriteDescriptorSet.*.pBufferInfo = null;
                imageInfos[imageInfoCount].sampler = commandBuffer.*.vertexSamplerBindings[i];
                imageInfos[imageInfoCount].imageView = commandBuffer.*.vertexSamplerTextureViewBindings[i];
                imageInfos[imageInfoCount].imageLayout = VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL;
                currentWriteDescriptorSet.*.pImageInfo = &imageInfos[imageInfoCount];
                writeCount +%= 1;
                imageInfoCount +%= 1;
            }
        }
        {
            var i: Uint32 = 0;
            _ = &i;
            while (i < resourceLayout.*.vertexStorageTextureCount) : (i +%= 1) {
                var currentWriteDescriptorSet: [*c]VkWriteDescriptorSet = &writeDescriptorSets[writeCount];
                _ = &currentWriteDescriptorSet;
                currentWriteDescriptorSet.*.sType = VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET;
                currentWriteDescriptorSet.*.pNext = null;
                currentWriteDescriptorSet.*.descriptorCount = 1;
                currentWriteDescriptorSet.*.descriptorType = VK_DESCRIPTOR_TYPE_SAMPLED_IMAGE;
                currentWriteDescriptorSet.*.dstArrayElement = 0;
                currentWriteDescriptorSet.*.dstBinding = resourceLayout.*.vertexSamplerCount +% i;
                currentWriteDescriptorSet.*.dstSet = commandBuffer.*.vertexResourceDescriptorSet;
                currentWriteDescriptorSet.*.pTexelBufferView = null;
                currentWriteDescriptorSet.*.pBufferInfo = null;
                imageInfos[imageInfoCount].sampler = null;
                imageInfos[imageInfoCount].imageView = commandBuffer.*.vertexStorageTextureViewBindings[i];
                imageInfos[imageInfoCount].imageLayout = VK_IMAGE_LAYOUT_GENERAL;
                currentWriteDescriptorSet.*.pImageInfo = &imageInfos[imageInfoCount];
                writeCount +%= 1;
                imageInfoCount +%= 1;
            }
        }
        {
            var i: Uint32 = 0;
            _ = &i;
            while (i < resourceLayout.*.vertexStorageBufferCount) : (i +%= 1) {
                var currentWriteDescriptorSet: [*c]VkWriteDescriptorSet = &writeDescriptorSets[writeCount];
                _ = &currentWriteDescriptorSet;
                currentWriteDescriptorSet.*.sType = VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET;
                currentWriteDescriptorSet.*.pNext = null;
                currentWriteDescriptorSet.*.descriptorCount = 1;
                currentWriteDescriptorSet.*.descriptorType = VK_DESCRIPTOR_TYPE_STORAGE_BUFFER;
                currentWriteDescriptorSet.*.dstArrayElement = 0;
                currentWriteDescriptorSet.*.dstBinding = (resourceLayout.*.vertexSamplerCount +% resourceLayout.*.vertexStorageTextureCount) +% i;
                currentWriteDescriptorSet.*.dstSet = commandBuffer.*.vertexResourceDescriptorSet;
                currentWriteDescriptorSet.*.pTexelBufferView = null;
                currentWriteDescriptorSet.*.pImageInfo = null;
                bufferInfos[bufferInfoCount].buffer = commandBuffer.*.vertexStorageBufferBindings[i];
                bufferInfos[bufferInfoCount].offset = 0;
                bufferInfos[bufferInfoCount].range = @truncate(~@as(c_ulonglong, 0));
                currentWriteDescriptorSet.*.pBufferInfo = &bufferInfos[bufferInfoCount];
                writeCount +%= 1;
                bufferInfoCount +%= 1;
            }
        }
        commandBuffer.*.needNewVertexResourceDescriptorSet = @"false" != 0;
    }
    if (commandBuffer.*.needNewVertexUniformDescriptorSet) {
        descriptorSetLayout = resourceLayout.*.descriptorSetLayouts[@as(c_int, 1)];
        commandBuffer.*.vertexUniformDescriptorSet = VULKAN_INTERNAL_FetchDescriptorSet(renderer, commandBuffer, descriptorSetLayout);
        {
            var i: Uint32 = 0;
            _ = &i;
            while (i < resourceLayout.*.vertexUniformBufferCount) : (i +%= 1) {
                var currentWriteDescriptorSet: [*c]VkWriteDescriptorSet = &writeDescriptorSets[writeCount];
                _ = &currentWriteDescriptorSet;
                currentWriteDescriptorSet.*.sType = VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET;
                currentWriteDescriptorSet.*.pNext = null;
                currentWriteDescriptorSet.*.descriptorCount = 1;
                currentWriteDescriptorSet.*.descriptorType = VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER_DYNAMIC;
                currentWriteDescriptorSet.*.dstArrayElement = 0;
                currentWriteDescriptorSet.*.dstBinding = i;
                currentWriteDescriptorSet.*.dstSet = commandBuffer.*.vertexUniformDescriptorSet;
                currentWriteDescriptorSet.*.pTexelBufferView = null;
                currentWriteDescriptorSet.*.pImageInfo = null;
                bufferInfos[bufferInfoCount].buffer = commandBuffer.*.vertexUniformBuffers[i].*.buffer.*.buffer;
                bufferInfos[bufferInfoCount].offset = 0;
                bufferInfos[bufferInfoCount].range = MAX_UBO_SECTION_SIZE;
                currentWriteDescriptorSet.*.pBufferInfo = &bufferInfos[bufferInfoCount];
                writeCount +%= 1;
                bufferInfoCount +%= 1;
            }
        }
        commandBuffer.*.needNewVertexUniformDescriptorSet = @"false" != 0;
    }
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < resourceLayout.*.vertexUniformBufferCount) : (i +%= 1) {
            dynamicOffsets[dynamicOffsetCount] = commandBuffer.*.vertexUniformBuffers[i].*.drawOffset;
            dynamicOffsetCount +%= 1;
        }
    }
    if (commandBuffer.*.needNewFragmentResourceDescriptorSet) {
        descriptorSetLayout = resourceLayout.*.descriptorSetLayouts[@as(c_int, 2)];
        commandBuffer.*.fragmentResourceDescriptorSet = VULKAN_INTERNAL_FetchDescriptorSet(renderer, commandBuffer, descriptorSetLayout);
        {
            var i: Uint32 = 0;
            _ = &i;
            while (i < resourceLayout.*.fragmentSamplerCount) : (i +%= 1) {
                var currentWriteDescriptorSet: [*c]VkWriteDescriptorSet = &writeDescriptorSets[writeCount];
                _ = &currentWriteDescriptorSet;
                currentWriteDescriptorSet.*.sType = VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET;
                currentWriteDescriptorSet.*.pNext = null;
                currentWriteDescriptorSet.*.descriptorCount = 1;
                currentWriteDescriptorSet.*.descriptorType = VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER;
                currentWriteDescriptorSet.*.dstArrayElement = 0;
                currentWriteDescriptorSet.*.dstBinding = i;
                currentWriteDescriptorSet.*.dstSet = commandBuffer.*.fragmentResourceDescriptorSet;
                currentWriteDescriptorSet.*.pTexelBufferView = null;
                currentWriteDescriptorSet.*.pBufferInfo = null;
                imageInfos[imageInfoCount].sampler = commandBuffer.*.fragmentSamplerBindings[i];
                imageInfos[imageInfoCount].imageView = commandBuffer.*.fragmentSamplerTextureViewBindings[i];
                imageInfos[imageInfoCount].imageLayout = VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL;
                currentWriteDescriptorSet.*.pImageInfo = &imageInfos[imageInfoCount];
                writeCount +%= 1;
                imageInfoCount +%= 1;
            }
        }
        {
            var i: Uint32 = 0;
            _ = &i;
            while (i < resourceLayout.*.fragmentStorageTextureCount) : (i +%= 1) {
                var currentWriteDescriptorSet: [*c]VkWriteDescriptorSet = &writeDescriptorSets[writeCount];
                _ = &currentWriteDescriptorSet;
                currentWriteDescriptorSet.*.sType = VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET;
                currentWriteDescriptorSet.*.pNext = null;
                currentWriteDescriptorSet.*.descriptorCount = 1;
                currentWriteDescriptorSet.*.descriptorType = VK_DESCRIPTOR_TYPE_SAMPLED_IMAGE;
                currentWriteDescriptorSet.*.dstArrayElement = 0;
                currentWriteDescriptorSet.*.dstBinding = resourceLayout.*.fragmentSamplerCount +% i;
                currentWriteDescriptorSet.*.dstSet = commandBuffer.*.fragmentResourceDescriptorSet;
                currentWriteDescriptorSet.*.pTexelBufferView = null;
                currentWriteDescriptorSet.*.pBufferInfo = null;
                imageInfos[imageInfoCount].sampler = null;
                imageInfos[imageInfoCount].imageView = commandBuffer.*.fragmentStorageTextureViewBindings[i];
                imageInfos[imageInfoCount].imageLayout = VK_IMAGE_LAYOUT_GENERAL;
                currentWriteDescriptorSet.*.pImageInfo = &imageInfos[imageInfoCount];
                writeCount +%= 1;
                imageInfoCount +%= 1;
            }
        }
        {
            var i: Uint32 = 0;
            _ = &i;
            while (i < resourceLayout.*.fragmentStorageBufferCount) : (i +%= 1) {
                var currentWriteDescriptorSet: [*c]VkWriteDescriptorSet = &writeDescriptorSets[writeCount];
                _ = &currentWriteDescriptorSet;
                currentWriteDescriptorSet.*.sType = VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET;
                currentWriteDescriptorSet.*.pNext = null;
                currentWriteDescriptorSet.*.descriptorCount = 1;
                currentWriteDescriptorSet.*.descriptorType = VK_DESCRIPTOR_TYPE_STORAGE_BUFFER;
                currentWriteDescriptorSet.*.dstArrayElement = 0;
                currentWriteDescriptorSet.*.dstBinding = (resourceLayout.*.fragmentSamplerCount +% resourceLayout.*.fragmentStorageTextureCount) +% i;
                currentWriteDescriptorSet.*.dstSet = commandBuffer.*.fragmentResourceDescriptorSet;
                currentWriteDescriptorSet.*.pTexelBufferView = null;
                currentWriteDescriptorSet.*.pImageInfo = null;
                bufferInfos[bufferInfoCount].buffer = commandBuffer.*.fragmentStorageBufferBindings[i];
                bufferInfos[bufferInfoCount].offset = 0;
                bufferInfos[bufferInfoCount].range = @truncate(~@as(c_ulonglong, 0));
                currentWriteDescriptorSet.*.pBufferInfo = &bufferInfos[bufferInfoCount];
                writeCount +%= 1;
                bufferInfoCount +%= 1;
            }
        }
        commandBuffer.*.needNewFragmentResourceDescriptorSet = @"false" != 0;
    }
    if (commandBuffer.*.needNewFragmentUniformDescriptorSet) {
        descriptorSetLayout = resourceLayout.*.descriptorSetLayouts[@as(c_int, 3)];
        commandBuffer.*.fragmentUniformDescriptorSet = VULKAN_INTERNAL_FetchDescriptorSet(renderer, commandBuffer, descriptorSetLayout);
        {
            var i: Uint32 = 0;
            _ = &i;
            while (i < resourceLayout.*.fragmentUniformBufferCount) : (i +%= 1) {
                var currentWriteDescriptorSet: [*c]VkWriteDescriptorSet = &writeDescriptorSets[writeCount];
                _ = &currentWriteDescriptorSet;
                currentWriteDescriptorSet.*.sType = VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET;
                currentWriteDescriptorSet.*.pNext = null;
                currentWriteDescriptorSet.*.descriptorCount = 1;
                currentWriteDescriptorSet.*.descriptorType = VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER_DYNAMIC;
                currentWriteDescriptorSet.*.dstArrayElement = 0;
                currentWriteDescriptorSet.*.dstBinding = i;
                currentWriteDescriptorSet.*.dstSet = commandBuffer.*.fragmentUniformDescriptorSet;
                currentWriteDescriptorSet.*.pTexelBufferView = null;
                currentWriteDescriptorSet.*.pImageInfo = null;
                bufferInfos[bufferInfoCount].buffer = commandBuffer.*.fragmentUniformBuffers[i].*.buffer.*.buffer;
                bufferInfos[bufferInfoCount].offset = 0;
                bufferInfos[bufferInfoCount].range = MAX_UBO_SECTION_SIZE;
                currentWriteDescriptorSet.*.pBufferInfo = &bufferInfos[bufferInfoCount];
                writeCount +%= 1;
                bufferInfoCount +%= 1;
            }
        }
        commandBuffer.*.needNewFragmentUniformDescriptorSet = @"false" != 0;
    }
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < resourceLayout.*.fragmentUniformBufferCount) : (i +%= 1) {
            dynamicOffsets[dynamicOffsetCount] = commandBuffer.*.fragmentUniformBuffers[i].*.drawOffset;
            dynamicOffsetCount +%= 1;
        }
    }
    renderer.*.vkUpdateDescriptorSets.?(renderer.*.logicalDevice, writeCount, @ptrCast(@alignCast(&writeDescriptorSets)), 0, null);
    var sets: [4]VkDescriptorSet = undefined;
    _ = &sets;
    sets[@as(c_int, 0)] = commandBuffer.*.vertexResourceDescriptorSet;
    sets[@as(c_int, 1)] = commandBuffer.*.vertexUniformDescriptorSet;
    sets[@as(c_int, 2)] = commandBuffer.*.fragmentResourceDescriptorSet;
    sets[@as(c_int, 3)] = commandBuffer.*.fragmentUniformDescriptorSet;
    renderer.*.vkCmdBindDescriptorSets.?(commandBuffer.*.commandBuffer, VK_PIPELINE_BIND_POINT_GRAPHICS, resourceLayout.*.pipelineLayout, 0, 4, @ptrCast(@alignCast(&sets)), dynamicOffsetCount, @ptrCast(@alignCast(&dynamicOffsets)));
    commandBuffer.*.needNewVertexUniformOffsets = @"false" != 0;
    commandBuffer.*.needNewFragmentUniformOffsets = @"false" != 0;
}
pub fn VULKAN_DrawIndexedPrimitives(commandBuffer: ?*SDL_GPUCommandBuffer, numIndices: Uint32, numInstances: Uint32, firstIndex: Uint32, vertexOffset: Sint32, firstInstance: Uint32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var vulkanCommandBuffer: [*c]VulkanCommandBuffer = @ptrCast(@alignCast(commandBuffer));
    _ = &vulkanCommandBuffer;
    var renderer: [*c]VulkanRenderer = vulkanCommandBuffer.*.renderer;
    _ = &renderer;
    VULKAN_INTERNAL_BindGraphicsDescriptorSets(renderer, vulkanCommandBuffer);
    renderer.*.vkCmdDrawIndexed.?(vulkanCommandBuffer.*.commandBuffer, numIndices, numInstances, firstIndex, vertexOffset, firstInstance);
}
pub fn VULKAN_DrawPrimitives(commandBuffer: ?*SDL_GPUCommandBuffer, numVertices: Uint32, numInstances: Uint32, firstVertex: Uint32, firstInstance: Uint32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var vulkanCommandBuffer: [*c]VulkanCommandBuffer = @ptrCast(@alignCast(commandBuffer));
    _ = &vulkanCommandBuffer;
    var renderer: [*c]VulkanRenderer = vulkanCommandBuffer.*.renderer;
    _ = &renderer;
    VULKAN_INTERNAL_BindGraphicsDescriptorSets(renderer, vulkanCommandBuffer);
    renderer.*.vkCmdDraw.?(vulkanCommandBuffer.*.commandBuffer, numVertices, numInstances, firstVertex, firstInstance);
}
pub fn VULKAN_DrawPrimitivesIndirect(commandBuffer: ?*SDL_GPUCommandBuffer, buffer: ?*SDL_GPUBuffer, offset: Uint32, drawCount: Uint32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var vulkanCommandBuffer: [*c]VulkanCommandBuffer = @ptrCast(@alignCast(commandBuffer));
    _ = &vulkanCommandBuffer;
    var renderer: [*c]VulkanRenderer = vulkanCommandBuffer.*.renderer;
    _ = &renderer;
    var vulkanBuffer: [*c]VulkanBuffer = @as([*c]VulkanBufferContainer, @ptrCast(@alignCast(buffer))).*.activeBuffer;
    _ = &vulkanBuffer;
    var pitch: Uint32 = @truncate(@sizeOf(SDL_GPUIndirectDrawCommand));
    _ = &pitch;
    var i: Uint32 = undefined;
    _ = &i;
    VULKAN_INTERNAL_BindGraphicsDescriptorSets(renderer, vulkanCommandBuffer);
    if (renderer.*.supportsMultiDrawIndirect) {
        renderer.*.vkCmdDrawIndirect.?(vulkanCommandBuffer.*.commandBuffer, vulkanBuffer.*.buffer, offset, drawCount, pitch);
    } else {
        {
            i = 0;
            while (i < drawCount) : (i +%= 1) {
                renderer.*.vkCmdDrawIndirect.?(vulkanCommandBuffer.*.commandBuffer, vulkanBuffer.*.buffer, offset +% (pitch *% i), 1, pitch);
            }
        }
    }
    VULKAN_INTERNAL_TrackBuffer(vulkanCommandBuffer, vulkanBuffer);
}
pub fn VULKAN_DrawIndexedPrimitivesIndirect(commandBuffer: ?*SDL_GPUCommandBuffer, buffer: ?*SDL_GPUBuffer, offset: Uint32, drawCount: Uint32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var vulkanCommandBuffer: [*c]VulkanCommandBuffer = @ptrCast(@alignCast(commandBuffer));
    _ = &vulkanCommandBuffer;
    var renderer: [*c]VulkanRenderer = vulkanCommandBuffer.*.renderer;
    _ = &renderer;
    var vulkanBuffer: [*c]VulkanBuffer = @as([*c]VulkanBufferContainer, @ptrCast(@alignCast(buffer))).*.activeBuffer;
    _ = &vulkanBuffer;
    var pitch: Uint32 = @truncate(@sizeOf(SDL_GPUIndexedIndirectDrawCommand));
    _ = &pitch;
    var i: Uint32 = undefined;
    _ = &i;
    VULKAN_INTERNAL_BindGraphicsDescriptorSets(renderer, vulkanCommandBuffer);
    if (renderer.*.supportsMultiDrawIndirect) {
        renderer.*.vkCmdDrawIndexedIndirect.?(vulkanCommandBuffer.*.commandBuffer, vulkanBuffer.*.buffer, offset, drawCount, pitch);
    } else {
        {
            i = 0;
            while (i < drawCount) : (i +%= 1) {
                renderer.*.vkCmdDrawIndexedIndirect.?(vulkanCommandBuffer.*.commandBuffer, vulkanBuffer.*.buffer, offset +% (pitch *% i), 1, pitch);
            }
        }
    }
    VULKAN_INTERNAL_TrackBuffer(vulkanCommandBuffer, vulkanBuffer);
}
pub fn VULKAN_INTERNAL_SetBufferName(renderer: [*c]VulkanRenderer, buffer: [*c]VulkanBuffer, text: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var nameInfo: VkDebugUtilsObjectNameInfoEXT = undefined;
    _ = &nameInfo;
    if (renderer.*.debugMode and renderer.*.supportsDebugUtils) {
        nameInfo.sType = VK_STRUCTURE_TYPE_DEBUG_UTILS_OBJECT_NAME_INFO_EXT;
        nameInfo.pNext = null;
        nameInfo.pObjectName = text;
        nameInfo.objectType = VK_OBJECT_TYPE_BUFFER;
        nameInfo.objectHandle = @intCast(@intFromPtr(buffer.*.buffer));
        _ = renderer.*.vkSetDebugUtilsObjectNameEXT.?(renderer.*.logicalDevice, &nameInfo);
    }
}
pub fn VULKAN_SetBufferName(driverData: ?*SDL_GPURenderer, buffer: ?*SDL_GPUBuffer, text: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var renderer: [*c]VulkanRenderer = @ptrCast(@alignCast(driverData));
    _ = &renderer;
    var container: [*c]VulkanBufferContainer = @ptrCast(@alignCast(buffer));
    _ = &container;
    var textLength: usize = SDL_strlen_REAL(text) +% @as(usize, 1);
    _ = &textLength;
    if (renderer.*.debugMode and renderer.*.supportsDebugUtils) {
        container.*.debugName = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(container.*.debugName)), textLength)));
        _ = SDL_utf8strlcpy_REAL(container.*.debugName, text, textLength);
        {
            var i: Uint32 = 0;
            _ = &i;
            while (i < container.*.bufferCount) : (i +%= 1) {
                VULKAN_INTERNAL_SetBufferName(renderer, container.*.buffers[i], text);
            }
        }
    }
}
pub fn VULKAN_INTERNAL_SetTextureName(renderer: [*c]VulkanRenderer, texture: [*c]VulkanTexture, text: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var nameInfo: VkDebugUtilsObjectNameInfoEXT = undefined;
    _ = &nameInfo;
    if (renderer.*.debugMode and renderer.*.supportsDebugUtils) {
        nameInfo.sType = VK_STRUCTURE_TYPE_DEBUG_UTILS_OBJECT_NAME_INFO_EXT;
        nameInfo.pNext = null;
        nameInfo.pObjectName = text;
        nameInfo.objectType = VK_OBJECT_TYPE_IMAGE;
        nameInfo.objectHandle = @intCast(@intFromPtr(texture.*.image));
        _ = renderer.*.vkSetDebugUtilsObjectNameEXT.?(renderer.*.logicalDevice, &nameInfo);
    }
}
pub fn VULKAN_SetTextureName(driverData: ?*SDL_GPURenderer, texture: ?*SDL_GPUTexture, text: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var renderer: [*c]VulkanRenderer = @ptrCast(@alignCast(driverData));
    _ = &renderer;
    var container: [*c]VulkanTextureContainer = @ptrCast(@alignCast(texture));
    _ = &container;
    var textLength: usize = SDL_strlen_REAL(text) +% @as(usize, 1);
    _ = &textLength;
    if (renderer.*.debugMode and renderer.*.supportsDebugUtils) {
        container.*.debugName = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(container.*.debugName)), textLength)));
        _ = SDL_utf8strlcpy_REAL(container.*.debugName, text, textLength);
        {
            var i: Uint32 = 0;
            _ = &i;
            while (i < container.*.textureCount) : (i +%= 1) {
                VULKAN_INTERNAL_SetTextureName(renderer, container.*.textures[i], text);
            }
        }
    }
}
pub fn VULKAN_InsertDebugLabel(commandBuffer: ?*SDL_GPUCommandBuffer, text: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var vulkanCommandBuffer: [*c]VulkanCommandBuffer = @ptrCast(@alignCast(commandBuffer));
    _ = &vulkanCommandBuffer;
    var renderer: [*c]VulkanRenderer = vulkanCommandBuffer.*.renderer;
    _ = &renderer;
    var labelInfo: VkDebugUtilsLabelEXT = undefined;
    _ = &labelInfo;
    if (renderer.*.supportsDebugUtils) {
        _ = memset(@ptrCast(@alignCast(&labelInfo)), 0, @sizeOf(@TypeOf(labelInfo)));
        labelInfo.sType = VK_STRUCTURE_TYPE_DEBUG_UTILS_LABEL_EXT;
        labelInfo.pLabelName = text;
        renderer.*.vkCmdInsertDebugUtilsLabelEXT.?(vulkanCommandBuffer.*.commandBuffer, &labelInfo);
    }
}
pub fn VULKAN_PushDebugGroup(commandBuffer: ?*SDL_GPUCommandBuffer, name: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var vulkanCommandBuffer: [*c]VulkanCommandBuffer = @ptrCast(@alignCast(commandBuffer));
    _ = &vulkanCommandBuffer;
    var renderer: [*c]VulkanRenderer = vulkanCommandBuffer.*.renderer;
    _ = &renderer;
    var labelInfo: VkDebugUtilsLabelEXT = undefined;
    _ = &labelInfo;
    if (renderer.*.supportsDebugUtils) {
        _ = memset(@ptrCast(@alignCast(&labelInfo)), 0, @sizeOf(@TypeOf(labelInfo)));
        labelInfo.sType = VK_STRUCTURE_TYPE_DEBUG_UTILS_LABEL_EXT;
        labelInfo.pLabelName = name;
        renderer.*.vkCmdBeginDebugUtilsLabelEXT.?(vulkanCommandBuffer.*.commandBuffer, &labelInfo);
    }
}
pub fn VULKAN_PopDebugGroup(commandBuffer: ?*SDL_GPUCommandBuffer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var vulkanCommandBuffer: [*c]VulkanCommandBuffer = @ptrCast(@alignCast(commandBuffer));
    _ = &vulkanCommandBuffer;
    var renderer: [*c]VulkanRenderer = vulkanCommandBuffer.*.renderer;
    _ = &renderer;
    if (renderer.*.supportsDebugUtils) {
        renderer.*.vkCmdEndDebugUtilsLabelEXT.?(vulkanCommandBuffer.*.commandBuffer);
    }
}
pub fn VULKAN_INTERNAL_CreateTexture(renderer: [*c]VulkanRenderer, createinfo: [*c]const SDL_GPUTextureCreateInfo) callconv(.c) [*c]VulkanTexture {
    @setEvalBranchQuota(100000);
    var vulkanResult: VkResult = undefined;
    _ = &vulkanResult;
    var imageCreateInfo: VkImageCreateInfo = undefined;
    _ = &imageCreateInfo;
    var imageCreateFlags: VkImageCreateFlags = 0;
    _ = &imageCreateFlags;
    var imageViewCreateInfo: VkImageViewCreateInfo = undefined;
    _ = &imageViewCreateInfo;
    var bindResult: Uint8 = undefined;
    _ = &bindResult;
    var vkUsageFlags: VkImageUsageFlags = @bitCast(@as(c_int, VK_IMAGE_USAGE_TRANSFER_SRC_BIT | VK_IMAGE_USAGE_TRANSFER_DST_BIT));
    _ = &vkUsageFlags;
    var layerCount: Uint32 = if (createinfo.*.type == @as(SDL_GPUTextureType, SDL_GPU_TEXTURETYPE_3D)) @as(Uint32, 1) else createinfo.*.layer_count_or_depth;
    _ = &layerCount;
    var depth: Uint32 = if (createinfo.*.type == @as(SDL_GPUTextureType, SDL_GPU_TEXTURETYPE_3D)) createinfo.*.layer_count_or_depth else @as(Uint32, 1);
    _ = &depth;
    var texture: [*c]VulkanTexture = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(VulkanTexture))));
    _ = &texture;
    texture.*.swizzle = SwizzleForSDLFormat(createinfo.*.format);
    texture.*.depth = depth;
    texture.*.usage = createinfo.*.usage;
    texture.*.levelCount = createinfo.*.num_levels;
    texture.*.layerCount = if (createinfo.*.type == @as(SDL_GPUTextureType, SDL_GPU_TEXTURETYPE_3D)) @as(Uint32, 1) else createinfo.*.layer_count_or_depth;
    texture.*.type = createinfo.*.type;
    _ = SDL_SetAtomicInt_REAL(&texture.*.referenceCount, 0);
    if (IsDepthFormat(createinfo.*.format)) {
        texture.*.aspectFlags = VK_IMAGE_ASPECT_DEPTH_BIT;
        if (IsStencilFormat(createinfo.*.format)) {
            texture.*.aspectFlags |= VK_IMAGE_ASPECT_STENCIL_BIT;
        }
    } else {
        texture.*.aspectFlags = VK_IMAGE_ASPECT_COLOR_BIT;
    }
    if ((createinfo.*.type == @as(SDL_GPUTextureType, SDL_GPU_TEXTURETYPE_CUBE)) or (createinfo.*.type == @as(SDL_GPUTextureType, SDL_GPU_TEXTURETYPE_CUBE_ARRAY))) {
        imageCreateFlags |= VK_IMAGE_CREATE_CUBE_COMPATIBLE_BIT;
    } else if (createinfo.*.type == @as(SDL_GPUTextureType, SDL_GPU_TEXTURETYPE_3D)) {
        imageCreateFlags |= VK_IMAGE_CREATE_2D_ARRAY_COMPATIBLE_BIT;
    }
    if ((createinfo.*.usage & (((@as(c_uint, 1) << @intCast(@as(c_uint, 0))) | (@as(c_uint, 1) << @intCast(@as(c_uint, 3)))) | (@as(c_uint, 1) << @intCast(@as(c_uint, 4))))) != 0) {
        vkUsageFlags |= VK_IMAGE_USAGE_SAMPLED_BIT;
    }
    if ((createinfo.*.usage & (@as(c_uint, 1) << @intCast(@as(c_uint, 1)))) != 0) {
        vkUsageFlags |= VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT;
    }
    if ((createinfo.*.usage & (@as(c_uint, 1) << @intCast(@as(c_uint, 2)))) != 0) {
        vkUsageFlags |= VK_IMAGE_USAGE_DEPTH_STENCIL_ATTACHMENT_BIT;
    }
    if ((createinfo.*.usage & ((@as(c_uint, 1) << @intCast(@as(c_uint, 5))) | (@as(c_uint, 1) << @intCast(@as(c_uint, 6))))) != 0) {
        vkUsageFlags |= VK_IMAGE_USAGE_STORAGE_BIT;
    }
    imageCreateInfo.sType = VK_STRUCTURE_TYPE_IMAGE_CREATE_INFO;
    imageCreateInfo.pNext = null;
    imageCreateInfo.flags = imageCreateFlags;
    imageCreateInfo.imageType = @bitCast(if (createinfo.*.type == @as(SDL_GPUTextureType, SDL_GPU_TEXTURETYPE_3D)) VK_IMAGE_TYPE_3D else VK_IMAGE_TYPE_2D);
    imageCreateInfo.format = SDLToVK_TextureFormat[createinfo.*.format];
    imageCreateInfo.extent.width = createinfo.*.width;
    imageCreateInfo.extent.height = createinfo.*.height;
    imageCreateInfo.extent.depth = depth;
    imageCreateInfo.mipLevels = createinfo.*.num_levels;
    imageCreateInfo.arrayLayers = layerCount;
    imageCreateInfo.samples = SDLToVK_SampleCount[createinfo.*.sample_count];
    imageCreateInfo.tiling = VK_IMAGE_TILING_OPTIMAL;
    imageCreateInfo.usage = vkUsageFlags;
    imageCreateInfo.sharingMode = VK_SHARING_MODE_EXCLUSIVE;
    imageCreateInfo.queueFamilyIndexCount = 0;
    imageCreateInfo.pQueueFamilyIndices = null;
    imageCreateInfo.initialLayout = VK_IMAGE_LAYOUT_UNDEFINED;
    vulkanResult = renderer.*.vkCreateImage.?(renderer.*.logicalDevice, &imageCreateInfo, null, &texture.*.image);
    if (vulkanResult != VK_SUCCESS) {
        VULKAN_INTERNAL_DestroyTexture(renderer, texture);
        while (true) {
            if (vulkanResult != VK_SUCCESS) {
                if (renderer.*.debugMode) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateImage"))), VkErrorMessages(vulkanResult));
                }
                _ = SDL_SetError_REAL("%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateImage"))), VkErrorMessages(vulkanResult));
                return null;
            }
            if (!false) break;
        }
    }
    bindResult = VULKAN_INTERNAL_BindMemoryForImage(renderer, texture.*.image, &texture.*.usedRegion);
    if (@as(c_int, bindResult) != @as(c_int, 1)) {
        renderer.*.vkDestroyImage.?(renderer.*.logicalDevice, texture.*.image, null);
        VULKAN_INTERNAL_DestroyTexture(renderer, texture);
        while (true) {
            while (true) {
                if (renderer.*.debugMode) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s", @as([*c]u8, @as([*c]u8, @constCast("Unable to bind memory for texture!"))));
                }
                _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("Unable to bind memory for texture!"))));
                if (!false) break;
            }
            return null;
        }
    }
    texture.*.usedRegion.*.unnamed_0.vulkanTexture = texture;
    if ((createinfo.*.usage & (((@as(c_uint, 1) << @intCast(@as(c_uint, 0))) | (@as(c_uint, 1) << @intCast(@as(c_uint, 3)))) | (@as(c_uint, 1) << @intCast(@as(c_uint, 4))))) != 0) {
        imageViewCreateInfo.sType = VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO;
        imageViewCreateInfo.pNext = null;
        imageViewCreateInfo.flags = 0;
        imageViewCreateInfo.image = texture.*.image;
        imageViewCreateInfo.format = SDLToVK_TextureFormat[createinfo.*.format];
        imageViewCreateInfo.components = texture.*.swizzle;
        imageViewCreateInfo.subresourceRange.aspectMask = texture.*.aspectFlags & @as(VkImageAspectFlags, @bitCast(@as(c_int, ~VK_IMAGE_ASPECT_STENCIL_BIT)));
        imageViewCreateInfo.subresourceRange.baseMipLevel = 0;
        imageViewCreateInfo.subresourceRange.levelCount = createinfo.*.num_levels;
        imageViewCreateInfo.subresourceRange.baseArrayLayer = 0;
        imageViewCreateInfo.subresourceRange.layerCount = layerCount;
        if (createinfo.*.type == @as(SDL_GPUTextureType, SDL_GPU_TEXTURETYPE_CUBE)) {
            imageViewCreateInfo.viewType = VK_IMAGE_VIEW_TYPE_CUBE;
        } else if (createinfo.*.type == @as(SDL_GPUTextureType, SDL_GPU_TEXTURETYPE_CUBE_ARRAY)) {
            imageViewCreateInfo.viewType = VK_IMAGE_VIEW_TYPE_CUBE_ARRAY;
        } else if (createinfo.*.type == @as(SDL_GPUTextureType, SDL_GPU_TEXTURETYPE_3D)) {
            imageViewCreateInfo.viewType = VK_IMAGE_VIEW_TYPE_3D;
        } else if (createinfo.*.type == @as(SDL_GPUTextureType, SDL_GPU_TEXTURETYPE_2D_ARRAY)) {
            imageViewCreateInfo.viewType = VK_IMAGE_VIEW_TYPE_2D_ARRAY;
        } else {
            imageViewCreateInfo.viewType = VK_IMAGE_VIEW_TYPE_2D;
        }
        vulkanResult = renderer.*.vkCreateImageView.?(renderer.*.logicalDevice, &imageViewCreateInfo, null, &texture.*.fullView);
        if (vulkanResult != VK_SUCCESS) {
            VULKAN_INTERNAL_DestroyTexture(renderer, texture);
            while (true) {
                if (vulkanResult != VK_SUCCESS) {
                    if (renderer.*.debugMode) {
                        SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s %s", @as([*c]u8, @as([*c]u8, @constCast("\"vkCreateImageView\""))), VkErrorMessages(vulkanResult));
                    }
                    _ = SDL_SetError_REAL("%s %s", @as([*c]u8, @as([*c]u8, @constCast("\"vkCreateImageView\""))), VkErrorMessages(vulkanResult));
                    return null;
                }
                if (!false) break;
            }
        }
    }
    texture.*.subresourceCount = layerCount *% createinfo.*.num_levels;
    texture.*.subresources = @ptrCast(@alignCast(SDL_calloc_REAL(texture.*.subresourceCount, @sizeOf(VulkanTextureSubresource))));
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < layerCount) : (i +%= 1) {
            {
                var j: Uint32 = 0;
                _ = &j;
                while (j < createinfo.*.num_levels) : (j +%= 1) {
                    var subresourceIndex: Uint32 = VULKAN_INTERNAL_GetTextureSubresourceIndex(j, i, createinfo.*.num_levels);
                    _ = &subresourceIndex;
                    if ((createinfo.*.usage & (@as(c_uint, 1) << @intCast(@as(c_uint, 1)))) != 0) {
                        texture.*.subresources[subresourceIndex].renderTargetViews = @ptrCast(@alignCast(SDL_malloc_REAL(@as(c_ulong, depth) *% @sizeOf(VkImageView))));
                        if (depth > @as(Uint32, 1)) {
                            {
                                var k: Uint32 = 0;
                                _ = &k;
                                while (k < depth) : (k +%= 1) {
                                    if (!VULKAN_INTERNAL_CreateRenderTargetView(renderer, texture, k, j, SDLToVK_TextureFormat[createinfo.*.format], texture.*.swizzle, &texture.*.subresources[subresourceIndex].renderTargetViews[k])) {
                                        VULKAN_INTERNAL_DestroyTexture(renderer, texture);
                                        return null;
                                    }
                                }
                            }
                        } else {
                            if (!VULKAN_INTERNAL_CreateRenderTargetView(renderer, texture, i, j, SDLToVK_TextureFormat[createinfo.*.format], texture.*.swizzle, &texture.*.subresources[subresourceIndex].renderTargetViews[@as(c_int, 0)])) {
                                VULKAN_INTERNAL_DestroyTexture(renderer, texture);
                                return null;
                            }
                        }
                    }
                    if (((createinfo.*.usage & (@as(c_uint, 1) << @intCast(@as(c_uint, 5)))) != 0) or ((createinfo.*.usage & (@as(c_uint, 1) << @intCast(@as(c_uint, 6)))) != 0)) {
                        if (!VULKAN_INTERNAL_CreateSubresourceView(renderer, createinfo, texture, i, j, texture.*.swizzle, &texture.*.subresources[subresourceIndex].computeWriteView)) {
                            VULKAN_INTERNAL_DestroyTexture(renderer, texture);
                            return null;
                        }
                    }
                    if ((createinfo.*.usage & (@as(c_uint, 1) << @intCast(@as(c_uint, 2)))) != 0) {
                        if (!VULKAN_INTERNAL_CreateSubresourceView(renderer, createinfo, texture, i, j, texture.*.swizzle, &texture.*.subresources[subresourceIndex].depthStencilView)) {
                            VULKAN_INTERNAL_DestroyTexture(renderer, texture);
                            return null;
                        }
                    }
                    texture.*.subresources[subresourceIndex].parent = texture;
                    texture.*.subresources[subresourceIndex].layer = i;
                    texture.*.subresources[subresourceIndex].level = j;
                }
            }
        }
    }
    if ((renderer.*.debugMode and renderer.*.supportsDebugUtils) and SDL_HasProperty_REAL(createinfo.*.props, "SDL.gpu.texture.create.name")) {
        var nameInfo: VkDebugUtilsObjectNameInfoEXT = undefined;
        _ = &nameInfo;
        nameInfo.sType = VK_STRUCTURE_TYPE_DEBUG_UTILS_OBJECT_NAME_INFO_EXT;
        nameInfo.pNext = null;
        nameInfo.pObjectName = SDL_GetStringProperty_REAL(createinfo.*.props, "SDL.gpu.texture.create.name", null);
        nameInfo.objectType = VK_OBJECT_TYPE_IMAGE;
        nameInfo.objectHandle = @intCast(@intFromPtr(texture.*.image));
        _ = renderer.*.vkSetDebugUtilsObjectNameEXT.?(renderer.*.logicalDevice, &nameInfo);
    }
    return texture;
}
pub fn VULKAN_INTERNAL_CycleActiveBuffer(renderer: [*c]VulkanRenderer, container: [*c]VulkanBufferContainer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var buffer: [*c]VulkanBuffer = undefined;
    _ = &buffer;
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < container.*.bufferCount) : (i +%= 1) {
            buffer = container.*.buffers[i];
            if (SDL_GetAtomicInt_REAL(&buffer.*.referenceCount) == @as(c_int, 0)) {
                container.*.activeBuffer = buffer;
                return;
            }
        }
    }
    buffer = VULKAN_INTERNAL_CreateBuffer(renderer, container.*.activeBuffer.*.size, container.*.activeBuffer.*.usage, container.*.activeBuffer.*.type, container.*.dedicated, container.*.debugName);
    if (!(buffer != null)) {
        return;
    }
    while (true) {
        if ((container.*.bufferCount +% @as(Uint32, 1)) >= container.*.bufferCapacity) {
            container.*.bufferCapacity = container.*.bufferCapacity *% @as(Uint32, 2);
            container.*.buffers = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(container.*.buffers)), @sizeOf([*c]VulkanBuffer) *% @as(c_ulong, container.*.bufferCapacity))));
        }
        if (!false) break;
    }
    container.*.buffers[container.*.bufferCount] = buffer;
    buffer.*.container = container;
    buffer.*.containerIndex = container.*.bufferCount;
    container.*.bufferCount +%= 1;
    container.*.activeBuffer = buffer;
}
pub fn VULKAN_INTERNAL_CycleActiveTexture(renderer: [*c]VulkanRenderer, commandBuffer: [*c]VulkanCommandBuffer, container: [*c]VulkanTextureContainer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var texture: [*c]VulkanTexture = undefined;
    _ = &texture;
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < container.*.textureCount) : (i +%= 1) {
            texture = container.*.textures[i];
            if (SDL_GetAtomicInt_REAL(&texture.*.referenceCount) == @as(c_int, 0)) {
                container.*.activeTexture = texture;
                return;
            }
        }
    }
    texture = VULKAN_INTERNAL_CreateTexture(renderer, &container.*.header.info);
    if (!(texture != null)) {
        return;
    }
    while (true) {
        if ((container.*.textureCount +% @as(Uint32, 1)) >= container.*.textureCapacity) {
            container.*.textureCapacity = container.*.textureCapacity *% @as(Uint32, 2);
            container.*.textures = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(container.*.textures)), @sizeOf([*c]VulkanTexture) *% @as(c_ulong, container.*.textureCapacity))));
        }
        if (!false) break;
    }
    container.*.textures[container.*.textureCount] = texture;
    texture.*.container = container;
    texture.*.containerIndex = container.*.textureCount;
    container.*.textureCount +%= 1;
    container.*.activeTexture = texture;
    VULKAN_INTERNAL_TextureTransitionToDefaultUsage(renderer, commandBuffer, VULKAN_TEXTURE_USAGE_MODE_UNINITIALIZED, texture);
}
pub fn VULKAN_INTERNAL_PrepareBufferForWrite(renderer: [*c]VulkanRenderer, commandBuffer: [*c]VulkanCommandBuffer, bufferContainer: [*c]VulkanBufferContainer, cycle: bool, destinationUsageMode: VulkanBufferUsageModeFlags) callconv(.c) [*c]VulkanBuffer {
    @setEvalBranchQuota(100000);
    if (cycle and (SDL_GetAtomicInt_REAL(&bufferContainer.*.activeBuffer.*.referenceCount) > @as(c_int, 0))) {
        VULKAN_INTERNAL_CycleActiveBuffer(renderer, bufferContainer);
    }
    VULKAN_INTERNAL_BufferTransitionFromDefaultUsage(renderer, commandBuffer, destinationUsageMode, bufferContainer.*.activeBuffer);
    return bufferContainer.*.activeBuffer;
}
pub fn VULKAN_INTERNAL_PrepareTextureSubresourceForWrite(renderer: [*c]VulkanRenderer, commandBuffer: [*c]VulkanCommandBuffer, textureContainer: [*c]VulkanTextureContainer, layer: Uint32, level: Uint32, cycle: bool, destinationUsageMode: VulkanTextureUsageMode) callconv(.c) [*c]VulkanTextureSubresource {
    @setEvalBranchQuota(100000);
    var textureSubresource: [*c]VulkanTextureSubresource = VULKAN_INTERNAL_FetchTextureSubresource(textureContainer, layer, level);
    _ = &textureSubresource;
    if ((cycle and textureContainer.*.canBeCycled) and (SDL_GetAtomicInt_REAL(&textureContainer.*.activeTexture.*.referenceCount) > @as(c_int, 0))) {
        VULKAN_INTERNAL_CycleActiveTexture(renderer, commandBuffer, textureContainer);
        textureSubresource = VULKAN_INTERNAL_FetchTextureSubresource(textureContainer, layer, level);
    }
    VULKAN_INTERNAL_TextureSubresourceTransitionFromDefaultUsage(renderer, commandBuffer, destinationUsageMode, textureSubresource);
    return textureSubresource;
}
pub fn VULKAN_INTERNAL_CreateRenderPass(renderer: [*c]VulkanRenderer, colorTargetInfos: [*c]const SDL_GPUColorTargetInfo, numColorTargets: Uint32, depthStencilTargetInfo: [*c]const SDL_GPUDepthStencilTargetInfo) callconv(.c) VkRenderPass {
    @setEvalBranchQuota(100000);
    var vulkanResult: VkResult = undefined;
    _ = &vulkanResult;
    var attachmentDescriptions: [17]VkAttachmentDescription = undefined;
    _ = &attachmentDescriptions;
    var colorAttachmentReferences: [8]VkAttachmentReference = undefined;
    _ = &colorAttachmentReferences;
    var resolveReferences: [8]VkAttachmentReference = undefined;
    _ = &resolveReferences;
    var depthStencilAttachmentReference: VkAttachmentReference = undefined;
    _ = &depthStencilAttachmentReference;
    var renderPassCreateInfo: VkRenderPassCreateInfo = undefined;
    _ = &renderPassCreateInfo;
    var subpass: VkSubpassDescription = undefined;
    _ = &subpass;
    var renderPass: VkRenderPass = undefined;
    _ = &renderPass;
    var i: Uint32 = undefined;
    _ = &i;
    var attachmentDescriptionCount: Uint32 = 0;
    _ = &attachmentDescriptionCount;
    var colorAttachmentReferenceCount: Uint32 = 0;
    _ = &colorAttachmentReferenceCount;
    var resolveReferenceCount: Uint32 = 0;
    _ = &resolveReferenceCount;
    {
        i = 0;
        while (i < numColorTargets) : (i +%= 1) {
            var container: [*c]VulkanTextureContainer = @ptrCast(@alignCast(colorTargetInfos[i].texture));
            _ = &container;
            attachmentDescriptions[attachmentDescriptionCount].flags = 0;
            attachmentDescriptions[attachmentDescriptionCount].format = SDLToVK_TextureFormat[container.*.header.info.format];
            attachmentDescriptions[attachmentDescriptionCount].samples = SDLToVK_SampleCount[container.*.header.info.sample_count];
            attachmentDescriptions[attachmentDescriptionCount].loadOp = SDLToVK_LoadOp[colorTargetInfos[i].load_op];
            attachmentDescriptions[attachmentDescriptionCount].storeOp = SDLToVK_StoreOp[colorTargetInfos[i].store_op];
            attachmentDescriptions[attachmentDescriptionCount].stencilLoadOp = VK_ATTACHMENT_LOAD_OP_DONT_CARE;
            attachmentDescriptions[attachmentDescriptionCount].stencilStoreOp = VK_ATTACHMENT_STORE_OP_DONT_CARE;
            attachmentDescriptions[attachmentDescriptionCount].initialLayout = VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL;
            attachmentDescriptions[attachmentDescriptionCount].finalLayout = VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL;
            colorAttachmentReferences[colorAttachmentReferenceCount].attachment = attachmentDescriptionCount;
            colorAttachmentReferences[colorAttachmentReferenceCount].layout = VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL;
            resolveReferences[colorAttachmentReferenceCount].layout = VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL;
            attachmentDescriptionCount +%= 1;
            if ((colorTargetInfos[i].store_op == @as(SDL_GPUStoreOp, SDL_GPU_STOREOP_RESOLVE)) or (colorTargetInfos[i].store_op == @as(SDL_GPUStoreOp, SDL_GPU_STOREOP_RESOLVE_AND_STORE))) {
                var resolveContainer: [*c]VulkanTextureContainer = @ptrCast(@alignCast(colorTargetInfos[i].resolve_texture));
                _ = &resolveContainer;
                attachmentDescriptions[attachmentDescriptionCount].flags = 0;
                attachmentDescriptions[attachmentDescriptionCount].format = SDLToVK_TextureFormat[resolveContainer.*.header.info.format];
                attachmentDescriptions[attachmentDescriptionCount].samples = SDLToVK_SampleCount[resolveContainer.*.header.info.sample_count];
                attachmentDescriptions[attachmentDescriptionCount].loadOp = VK_ATTACHMENT_LOAD_OP_DONT_CARE;
                attachmentDescriptions[attachmentDescriptionCount].storeOp = VK_ATTACHMENT_STORE_OP_STORE;
                attachmentDescriptions[attachmentDescriptionCount].stencilLoadOp = VK_ATTACHMENT_LOAD_OP_DONT_CARE;
                attachmentDescriptions[attachmentDescriptionCount].stencilStoreOp = VK_ATTACHMENT_STORE_OP_DONT_CARE;
                attachmentDescriptions[attachmentDescriptionCount].initialLayout = VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL;
                attachmentDescriptions[attachmentDescriptionCount].finalLayout = VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL;
                resolveReferences[colorAttachmentReferenceCount].attachment = attachmentDescriptionCount;
                attachmentDescriptionCount +%= 1;
                resolveReferenceCount +%= 1;
            } else {
                resolveReferences[colorAttachmentReferenceCount].attachment = ~@as(c_uint, 0);
            }
            colorAttachmentReferenceCount +%= 1;
        }
    }
    subpass.pipelineBindPoint = VK_PIPELINE_BIND_POINT_GRAPHICS;
    subpass.flags = 0;
    subpass.inputAttachmentCount = 0;
    subpass.pInputAttachments = null;
    subpass.colorAttachmentCount = numColorTargets;
    subpass.pColorAttachments = @ptrCast(@alignCast(&colorAttachmentReferences));
    subpass.preserveAttachmentCount = 0;
    subpass.pPreserveAttachments = null;
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(depthStencilTargetInfo)))) == @as(?*anyopaque, null)) {
        subpass.pDepthStencilAttachment = null;
    } else {
        var container: [*c]VulkanTextureContainer = @ptrCast(@alignCast(depthStencilTargetInfo.*.texture));
        _ = &container;
        attachmentDescriptions[attachmentDescriptionCount].flags = 0;
        attachmentDescriptions[attachmentDescriptionCount].format = SDLToVK_TextureFormat[container.*.header.info.format];
        attachmentDescriptions[attachmentDescriptionCount].samples = SDLToVK_SampleCount[container.*.header.info.sample_count];
        attachmentDescriptions[attachmentDescriptionCount].loadOp = SDLToVK_LoadOp[depthStencilTargetInfo.*.load_op];
        attachmentDescriptions[attachmentDescriptionCount].storeOp = SDLToVK_StoreOp[depthStencilTargetInfo.*.store_op];
        attachmentDescriptions[attachmentDescriptionCount].stencilLoadOp = SDLToVK_LoadOp[depthStencilTargetInfo.*.stencil_load_op];
        attachmentDescriptions[attachmentDescriptionCount].stencilStoreOp = SDLToVK_StoreOp[depthStencilTargetInfo.*.stencil_store_op];
        attachmentDescriptions[attachmentDescriptionCount].initialLayout = VK_IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL;
        attachmentDescriptions[attachmentDescriptionCount].finalLayout = VK_IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL;
        depthStencilAttachmentReference.attachment = attachmentDescriptionCount;
        depthStencilAttachmentReference.layout = VK_IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL;
        subpass.pDepthStencilAttachment = &depthStencilAttachmentReference;
        attachmentDescriptionCount +%= 1;
    }
    if (resolveReferenceCount > @as(Uint32, 0)) {
        subpass.pResolveAttachments = @ptrCast(@alignCast(&resolveReferences));
    } else {
        subpass.pResolveAttachments = null;
    }
    renderPassCreateInfo.sType = VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO;
    renderPassCreateInfo.pNext = null;
    renderPassCreateInfo.flags = 0;
    renderPassCreateInfo.pAttachments = @ptrCast(@alignCast(&attachmentDescriptions));
    renderPassCreateInfo.attachmentCount = attachmentDescriptionCount;
    renderPassCreateInfo.subpassCount = 1;
    renderPassCreateInfo.pSubpasses = &subpass;
    renderPassCreateInfo.dependencyCount = 0;
    renderPassCreateInfo.pDependencies = null;
    vulkanResult = renderer.*.vkCreateRenderPass.?(renderer.*.logicalDevice, &renderPassCreateInfo, null, &renderPass);
    while (true) {
        if (vulkanResult != VK_SUCCESS) {
            if (renderer.*.debugMode) {
                SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateRenderPass"))), VkErrorMessages(vulkanResult));
            }
            _ = SDL_SetError_REAL("%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateRenderPass"))), VkErrorMessages(vulkanResult));
            return null;
        }
        if (!false) break;
    }
    return renderPass;
}
pub fn VULKAN_INTERNAL_CreateTransientRenderPass(renderer: [*c]VulkanRenderer, targetInfo: SDL_GPUGraphicsPipelineTargetInfo, sampleCount: VkSampleCountFlagBits) callconv(.c) VkRenderPass {
    @setEvalBranchQuota(100000);
    var attachmentDescriptions: [9]VkAttachmentDescription = undefined;
    _ = &attachmentDescriptions;
    var colorAttachmentReferences: [8]VkAttachmentReference = undefined;
    _ = &colorAttachmentReferences;
    var depthStencilAttachmentReference: VkAttachmentReference = undefined;
    _ = &depthStencilAttachmentReference;
    var attachmentDescription: SDL_GPUColorTargetDescription = undefined;
    _ = &attachmentDescription;
    var subpass: VkSubpassDescription = undefined;
    _ = &subpass;
    var renderPassCreateInfo: VkRenderPassCreateInfo = undefined;
    _ = &renderPassCreateInfo;
    var renderPass: VkRenderPass = undefined;
    _ = &renderPass;
    var result: VkResult = undefined;
    _ = &result;
    var attachmentDescriptionCount: Uint32 = 0;
    _ = &attachmentDescriptionCount;
    var colorAttachmentReferenceCount: Uint32 = 0;
    _ = &colorAttachmentReferenceCount;
    var i: Uint32 = undefined;
    _ = &i;
    {
        i = 0;
        while (i < targetInfo.num_color_targets) : (i +%= 1) {
            attachmentDescription = targetInfo.color_target_descriptions[i];
            attachmentDescriptions[attachmentDescriptionCount].flags = 0;
            attachmentDescriptions[attachmentDescriptionCount].format = SDLToVK_TextureFormat[attachmentDescription.format];
            attachmentDescriptions[attachmentDescriptionCount].samples = sampleCount;
            attachmentDescriptions[attachmentDescriptionCount].loadOp = VK_ATTACHMENT_LOAD_OP_DONT_CARE;
            attachmentDescriptions[attachmentDescriptionCount].storeOp = VK_ATTACHMENT_STORE_OP_DONT_CARE;
            attachmentDescriptions[attachmentDescriptionCount].stencilLoadOp = VK_ATTACHMENT_LOAD_OP_DONT_CARE;
            attachmentDescriptions[attachmentDescriptionCount].stencilStoreOp = VK_ATTACHMENT_STORE_OP_DONT_CARE;
            attachmentDescriptions[attachmentDescriptionCount].initialLayout = VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL;
            attachmentDescriptions[attachmentDescriptionCount].finalLayout = VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL;
            colorAttachmentReferences[colorAttachmentReferenceCount].attachment = attachmentDescriptionCount;
            colorAttachmentReferences[colorAttachmentReferenceCount].layout = VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL;
            attachmentDescriptionCount +%= 1;
            colorAttachmentReferenceCount +%= 1;
        }
    }
    subpass.pipelineBindPoint = VK_PIPELINE_BIND_POINT_GRAPHICS;
    subpass.flags = 0;
    subpass.inputAttachmentCount = 0;
    subpass.pInputAttachments = null;
    subpass.colorAttachmentCount = targetInfo.num_color_targets;
    subpass.pColorAttachments = @ptrCast(@alignCast(&colorAttachmentReferences));
    subpass.preserveAttachmentCount = 0;
    subpass.pPreserveAttachments = null;
    if (targetInfo.has_depth_stencil_target) {
        attachmentDescriptions[attachmentDescriptionCount].flags = 0;
        attachmentDescriptions[attachmentDescriptionCount].format = SDLToVK_TextureFormat[targetInfo.depth_stencil_format];
        attachmentDescriptions[attachmentDescriptionCount].samples = sampleCount;
        attachmentDescriptions[attachmentDescriptionCount].loadOp = VK_ATTACHMENT_LOAD_OP_DONT_CARE;
        attachmentDescriptions[attachmentDescriptionCount].storeOp = VK_ATTACHMENT_STORE_OP_DONT_CARE;
        attachmentDescriptions[attachmentDescriptionCount].stencilLoadOp = VK_ATTACHMENT_LOAD_OP_DONT_CARE;
        attachmentDescriptions[attachmentDescriptionCount].stencilStoreOp = VK_ATTACHMENT_STORE_OP_DONT_CARE;
        attachmentDescriptions[attachmentDescriptionCount].initialLayout = VK_IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL;
        attachmentDescriptions[attachmentDescriptionCount].finalLayout = VK_IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL;
        depthStencilAttachmentReference.attachment = attachmentDescriptionCount;
        depthStencilAttachmentReference.layout = VK_IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL;
        subpass.pDepthStencilAttachment = &depthStencilAttachmentReference;
        attachmentDescriptionCount +%= 1;
    } else {
        subpass.pDepthStencilAttachment = null;
    }
    subpass.pResolveAttachments = null;
    renderPassCreateInfo.sType = VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO;
    renderPassCreateInfo.pNext = null;
    renderPassCreateInfo.flags = 0;
    renderPassCreateInfo.pAttachments = @ptrCast(@alignCast(&attachmentDescriptions));
    renderPassCreateInfo.attachmentCount = attachmentDescriptionCount;
    renderPassCreateInfo.subpassCount = 1;
    renderPassCreateInfo.pSubpasses = &subpass;
    renderPassCreateInfo.dependencyCount = 0;
    renderPassCreateInfo.pDependencies = null;
    result = renderer.*.vkCreateRenderPass.?(renderer.*.logicalDevice, &renderPassCreateInfo, null, &renderPass);
    while (true) {
        if (result != VK_SUCCESS) {
            if (renderer.*.debugMode) {
                SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateRenderPass"))), VkErrorMessages(result));
            }
            _ = SDL_SetError_REAL("%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateRenderPass"))), VkErrorMessages(result));
            return null;
        }
        if (!false) break;
    }
    return renderPass;
}
pub fn VULKAN_CreateGraphicsPipeline(driverData: ?*SDL_GPURenderer, createinfo: [*c]const SDL_GPUGraphicsPipelineCreateInfo) callconv(.c) ?*SDL_GPUGraphicsPipeline {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [29:0]u8 = "VULKAN_CreateGraphicsPipeline".*;
    };
    _ = &static_local___func__;
    var vulkanResult: VkResult = undefined;
    _ = &vulkanResult;
    var i: Uint32 = undefined;
    _ = &i;
    var graphicsPipeline: [*c]VulkanGraphicsPipeline = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(VulkanGraphicsPipeline))));
    _ = &graphicsPipeline;
    var vkPipelineCreateInfo: VkGraphicsPipelineCreateInfo = undefined;
    _ = &vkPipelineCreateInfo;
    var shaderStageCreateInfos: [2]VkPipelineShaderStageCreateInfo = undefined;
    _ = &shaderStageCreateInfos;
    var vertexInputStateCreateInfo: VkPipelineVertexInputStateCreateInfo = undefined;
    _ = &vertexInputStateCreateInfo;
    var vertexInputBindingDescriptions: [*c]VkVertexInputBindingDescription = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(VkVertexInputBindingDescription) *% @as(c_ulong, createinfo.*.vertex_input_state.num_vertex_buffers))));
    _ = &vertexInputBindingDescriptions;
    var vertexInputAttributeDescriptions: [*c]VkVertexInputAttributeDescription = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(VkVertexInputAttributeDescription) *% @as(c_ulong, createinfo.*.vertex_input_state.num_vertex_attributes))));
    _ = &vertexInputAttributeDescriptions;
    var inputAssemblyStateCreateInfo: VkPipelineInputAssemblyStateCreateInfo = undefined;
    _ = &inputAssemblyStateCreateInfo;
    var viewportStateCreateInfo: VkPipelineViewportStateCreateInfo = undefined;
    _ = &viewportStateCreateInfo;
    var rasterizationStateCreateInfo: VkPipelineRasterizationStateCreateInfo = undefined;
    _ = &rasterizationStateCreateInfo;
    var multisampleStateCreateInfo: VkPipelineMultisampleStateCreateInfo = undefined;
    _ = &multisampleStateCreateInfo;
    var depthStencilStateCreateInfo: VkPipelineDepthStencilStateCreateInfo = undefined;
    _ = &depthStencilStateCreateInfo;
    var frontStencilState: VkStencilOpState = undefined;
    _ = &frontStencilState;
    var backStencilState: VkStencilOpState = undefined;
    _ = &backStencilState;
    var colorBlendStateCreateInfo: VkPipelineColorBlendStateCreateInfo = undefined;
    _ = &colorBlendStateCreateInfo;
    var colorBlendAttachmentStates: [*c]VkPipelineColorBlendAttachmentState = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(VkPipelineColorBlendAttachmentState) *% @as(c_ulong, createinfo.*.target_info.num_color_targets))));
    _ = &colorBlendAttachmentStates;
    const static_local_dynamicStates = struct {
        const dynamicStates: [4]VkDynamicState = [4]VkDynamicState{
            VK_DYNAMIC_STATE_VIEWPORT,
            VK_DYNAMIC_STATE_SCISSOR,
            VK_DYNAMIC_STATE_BLEND_CONSTANTS,
            VK_DYNAMIC_STATE_STENCIL_REFERENCE,
        };
    };
    _ = &static_local_dynamicStates;
    var dynamicStateCreateInfo: VkPipelineDynamicStateCreateInfo = undefined;
    _ = &dynamicStateCreateInfo;
    var renderer: [*c]VulkanRenderer = @ptrCast(@alignCast(driverData));
    _ = &renderer;
    var transientRenderPass: VkRenderPass = VULKAN_INTERNAL_CreateTransientRenderPass(renderer, createinfo.*.target_info, SDLToVK_SampleCount[createinfo.*.multisample_state.sample_count]);
    _ = &transientRenderPass;
    dynamicStateCreateInfo.sType = VK_STRUCTURE_TYPE_PIPELINE_DYNAMIC_STATE_CREATE_INFO;
    dynamicStateCreateInfo.pNext = null;
    dynamicStateCreateInfo.flags = 0;
    dynamicStateCreateInfo.dynamicStateCount = @truncate(@sizeOf(@TypeOf(static_local_dynamicStates.dynamicStates)) / @sizeOf(@TypeOf(static_local_dynamicStates.dynamicStates[@as(c_int, 0)])));
    dynamicStateCreateInfo.pDynamicStates = @ptrCast(@alignCast(&static_local_dynamicStates.dynamicStates));
    graphicsPipeline.*.vertexShader = @ptrCast(@alignCast(createinfo.*.vertex_shader));
    _ = SDL_AddAtomicInt_REAL(&graphicsPipeline.*.vertexShader.*.referenceCount, 1);
    shaderStageCreateInfos[@as(c_int, 0)].sType = VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO;
    shaderStageCreateInfos[@as(c_int, 0)].pNext = null;
    shaderStageCreateInfos[@as(c_int, 0)].flags = 0;
    shaderStageCreateInfos[@as(c_int, 0)].stage = VK_SHADER_STAGE_VERTEX_BIT;
    shaderStageCreateInfos[@as(c_int, 0)].module = graphicsPipeline.*.vertexShader.*.shaderModule;
    shaderStageCreateInfos[@as(c_int, 0)].pName = graphicsPipeline.*.vertexShader.*.entrypointName;
    shaderStageCreateInfos[@as(c_int, 0)].pSpecializationInfo = null;
    graphicsPipeline.*.fragmentShader = @ptrCast(@alignCast(createinfo.*.fragment_shader));
    _ = SDL_AddAtomicInt_REAL(&graphicsPipeline.*.fragmentShader.*.referenceCount, 1);
    shaderStageCreateInfos[@as(c_int, 1)].sType = VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO;
    shaderStageCreateInfos[@as(c_int, 1)].pNext = null;
    shaderStageCreateInfos[@as(c_int, 1)].flags = 0;
    shaderStageCreateInfos[@as(c_int, 1)].stage = VK_SHADER_STAGE_FRAGMENT_BIT;
    shaderStageCreateInfos[@as(c_int, 1)].module = graphicsPipeline.*.fragmentShader.*.shaderModule;
    shaderStageCreateInfos[@as(c_int, 1)].pName = graphicsPipeline.*.fragmentShader.*.entrypointName;
    shaderStageCreateInfos[@as(c_int, 1)].pSpecializationInfo = null;
    if (renderer.*.debugMode) {
        if (graphicsPipeline.*.vertexShader.*.stage != @as(SDL_GPUShaderStage, SDL_GPU_SHADERSTAGE_VERTEX)) {
            while (true) {
                while (!!(@intFromPtr("CreateGraphicsPipeline was passed a fragment shader for the vertex stage") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"CreateGraphicsPipeline was passed a fragment shader for the vertex stage\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu_vulkan.c", 6444);
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
        if (graphicsPipeline.*.fragmentShader.*.stage != @as(SDL_GPUShaderStage, SDL_GPU_SHADERSTAGE_FRAGMENT)) {
            while (true) {
                while (!!(@intFromPtr("CreateGraphicsPipeline was passed a vertex shader for the fragment stage") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"CreateGraphicsPipeline was passed a vertex shader for the fragment stage\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu_vulkan.c", 6447);
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
    }
    {
        i = 0;
        while (i < createinfo.*.vertex_input_state.num_vertex_buffers) : (i +%= 1) {
            vertexInputBindingDescriptions[i].binding = createinfo.*.vertex_input_state.vertex_buffer_descriptions[i].slot;
            vertexInputBindingDescriptions[i].inputRate = SDLToVK_VertexInputRate[createinfo.*.vertex_input_state.vertex_buffer_descriptions[i].input_rate];
            vertexInputBindingDescriptions[i].stride = createinfo.*.vertex_input_state.vertex_buffer_descriptions[i].pitch;
        }
    }
    {
        i = 0;
        while (i < createinfo.*.vertex_input_state.num_vertex_attributes) : (i +%= 1) {
            vertexInputAttributeDescriptions[i].binding = createinfo.*.vertex_input_state.vertex_attributes[i].buffer_slot;
            vertexInputAttributeDescriptions[i].format = SDLToVK_VertexFormat[createinfo.*.vertex_input_state.vertex_attributes[i].format];
            vertexInputAttributeDescriptions[i].location = createinfo.*.vertex_input_state.vertex_attributes[i].location;
            vertexInputAttributeDescriptions[i].offset = createinfo.*.vertex_input_state.vertex_attributes[i].offset;
        }
    }
    vertexInputStateCreateInfo.sType = VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_STATE_CREATE_INFO;
    vertexInputStateCreateInfo.pNext = null;
    vertexInputStateCreateInfo.flags = 0;
    vertexInputStateCreateInfo.vertexBindingDescriptionCount = createinfo.*.vertex_input_state.num_vertex_buffers;
    vertexInputStateCreateInfo.pVertexBindingDescriptions = vertexInputBindingDescriptions;
    vertexInputStateCreateInfo.vertexAttributeDescriptionCount = createinfo.*.vertex_input_state.num_vertex_attributes;
    vertexInputStateCreateInfo.pVertexAttributeDescriptions = vertexInputAttributeDescriptions;
    inputAssemblyStateCreateInfo.sType = VK_STRUCTURE_TYPE_PIPELINE_INPUT_ASSEMBLY_STATE_CREATE_INFO;
    inputAssemblyStateCreateInfo.pNext = null;
    inputAssemblyStateCreateInfo.flags = 0;
    inputAssemblyStateCreateInfo.primitiveRestartEnable = VK_FALSE;
    inputAssemblyStateCreateInfo.topology = SDLToVK_PrimitiveType[createinfo.*.primitive_type];
    graphicsPipeline.*.primitiveType = createinfo.*.primitive_type;
    viewportStateCreateInfo.sType = VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_STATE_CREATE_INFO;
    viewportStateCreateInfo.pNext = null;
    viewportStateCreateInfo.flags = 0;
    viewportStateCreateInfo.viewportCount = 1;
    viewportStateCreateInfo.pViewports = null;
    viewportStateCreateInfo.scissorCount = 1;
    viewportStateCreateInfo.pScissors = null;
    rasterizationStateCreateInfo.sType = VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_STATE_CREATE_INFO;
    rasterizationStateCreateInfo.pNext = null;
    rasterizationStateCreateInfo.flags = 0;
    rasterizationStateCreateInfo.depthClampEnable = @bitCast(@as(c_int, @intFromBool(!createinfo.*.rasterizer_state.enable_depth_clip)));
    rasterizationStateCreateInfo.rasterizerDiscardEnable = VK_FALSE;
    rasterizationStateCreateInfo.polygonMode = SDLToVK_PolygonMode(renderer, createinfo.*.rasterizer_state.fill_mode);
    rasterizationStateCreateInfo.cullMode = SDLToVK_CullMode[createinfo.*.rasterizer_state.cull_mode];
    rasterizationStateCreateInfo.frontFace = SDLToVK_FrontFace[createinfo.*.rasterizer_state.front_face];
    rasterizationStateCreateInfo.depthBiasEnable = @intFromBool(createinfo.*.rasterizer_state.enable_depth_bias);
    rasterizationStateCreateInfo.depthBiasConstantFactor = createinfo.*.rasterizer_state.depth_bias_constant_factor;
    rasterizationStateCreateInfo.depthBiasClamp = createinfo.*.rasterizer_state.depth_bias_clamp;
    rasterizationStateCreateInfo.depthBiasSlopeFactor = createinfo.*.rasterizer_state.depth_bias_slope_factor;
    rasterizationStateCreateInfo.lineWidth = 1.0;
    var sampleMask: Uint32 = 4294967295;
    _ = &sampleMask;
    multisampleStateCreateInfo.sType = VK_STRUCTURE_TYPE_PIPELINE_MULTISAMPLE_STATE_CREATE_INFO;
    multisampleStateCreateInfo.pNext = null;
    multisampleStateCreateInfo.flags = 0;
    multisampleStateCreateInfo.rasterizationSamples = SDLToVK_SampleCount[createinfo.*.multisample_state.sample_count];
    multisampleStateCreateInfo.sampleShadingEnable = VK_FALSE;
    multisampleStateCreateInfo.minSampleShading = 1.0;
    multisampleStateCreateInfo.pSampleMask = &sampleMask;
    multisampleStateCreateInfo.alphaToCoverageEnable = @intFromBool(createinfo.*.multisample_state.enable_alpha_to_coverage);
    multisampleStateCreateInfo.alphaToOneEnable = VK_FALSE;
    frontStencilState.failOp = SDLToVK_StencilOp[createinfo.*.depth_stencil_state.front_stencil_state.fail_op];
    frontStencilState.passOp = SDLToVK_StencilOp[createinfo.*.depth_stencil_state.front_stencil_state.pass_op];
    frontStencilState.depthFailOp = SDLToVK_StencilOp[createinfo.*.depth_stencil_state.front_stencil_state.depth_fail_op];
    frontStencilState.compareOp = SDLToVK_CompareOp[createinfo.*.depth_stencil_state.front_stencil_state.compare_op];
    frontStencilState.compareMask = createinfo.*.depth_stencil_state.compare_mask;
    frontStencilState.writeMask = createinfo.*.depth_stencil_state.write_mask;
    frontStencilState.reference = 0;
    backStencilState.failOp = SDLToVK_StencilOp[createinfo.*.depth_stencil_state.back_stencil_state.fail_op];
    backStencilState.passOp = SDLToVK_StencilOp[createinfo.*.depth_stencil_state.back_stencil_state.pass_op];
    backStencilState.depthFailOp = SDLToVK_StencilOp[createinfo.*.depth_stencil_state.back_stencil_state.depth_fail_op];
    backStencilState.compareOp = SDLToVK_CompareOp[createinfo.*.depth_stencil_state.back_stencil_state.compare_op];
    backStencilState.compareMask = createinfo.*.depth_stencil_state.compare_mask;
    backStencilState.writeMask = createinfo.*.depth_stencil_state.write_mask;
    backStencilState.reference = 0;
    depthStencilStateCreateInfo.sType = VK_STRUCTURE_TYPE_PIPELINE_DEPTH_STENCIL_STATE_CREATE_INFO;
    depthStencilStateCreateInfo.pNext = null;
    depthStencilStateCreateInfo.flags = 0;
    depthStencilStateCreateInfo.depthTestEnable = @intFromBool(createinfo.*.depth_stencil_state.enable_depth_test);
    depthStencilStateCreateInfo.depthWriteEnable = @intFromBool(createinfo.*.depth_stencil_state.enable_depth_write);
    depthStencilStateCreateInfo.depthCompareOp = SDLToVK_CompareOp[createinfo.*.depth_stencil_state.compare_op];
    depthStencilStateCreateInfo.depthBoundsTestEnable = VK_FALSE;
    depthStencilStateCreateInfo.stencilTestEnable = @intFromBool(createinfo.*.depth_stencil_state.enable_stencil_test);
    depthStencilStateCreateInfo.front = frontStencilState;
    depthStencilStateCreateInfo.back = backStencilState;
    depthStencilStateCreateInfo.minDepthBounds = @floatFromInt(@as(c_int, 0));
    depthStencilStateCreateInfo.maxDepthBounds = @floatFromInt(@as(c_int, 0));
    {
        i = 0;
        while (i < createinfo.*.target_info.num_color_targets) : (i +%= 1) {
            var blendState: SDL_GPUColorTargetBlendState = createinfo.*.target_info.color_target_descriptions[i].blend_state;
            _ = &blendState;
            var colorWriteMask: SDL_GPUColorComponentFlags = @bitCast(@as(i8, @truncate(if (blendState.enable_color_write_mask) @as(c_int, blendState.color_write_mask) else @as(c_int, 15))));
            _ = &colorWriteMask;
            colorBlendAttachmentStates[i].blendEnable = @intFromBool(blendState.enable_blend);
            colorBlendAttachmentStates[i].srcColorBlendFactor = SDLToVK_BlendFactor[blendState.src_color_blendfactor];
            colorBlendAttachmentStates[i].dstColorBlendFactor = SDLToVK_BlendFactor[blendState.dst_color_blendfactor];
            colorBlendAttachmentStates[i].colorBlendOp = SDLToVK_BlendOp[blendState.color_blend_op];
            colorBlendAttachmentStates[i].srcAlphaBlendFactor = SDLToVK_BlendFactor[blendState.src_alpha_blendfactor];
            colorBlendAttachmentStates[i].dstAlphaBlendFactor = SDLToVK_BlendFactor[blendState.dst_alpha_blendfactor];
            colorBlendAttachmentStates[i].alphaBlendOp = SDLToVK_BlendOp[blendState.alpha_blend_op];
            colorBlendAttachmentStates[i].colorWriteMask = colorWriteMask;
        }
    }
    colorBlendStateCreateInfo.sType = VK_STRUCTURE_TYPE_PIPELINE_COLOR_BLEND_STATE_CREATE_INFO;
    colorBlendStateCreateInfo.pNext = null;
    colorBlendStateCreateInfo.flags = 0;
    colorBlendStateCreateInfo.attachmentCount = createinfo.*.target_info.num_color_targets;
    colorBlendStateCreateInfo.pAttachments = colorBlendAttachmentStates;
    colorBlendStateCreateInfo.blendConstants[@as(c_int, 0)] = 1.0;
    colorBlendStateCreateInfo.blendConstants[@as(c_int, 1)] = 1.0;
    colorBlendStateCreateInfo.blendConstants[@as(c_int, 2)] = 1.0;
    colorBlendStateCreateInfo.blendConstants[@as(c_int, 3)] = 1.0;
    colorBlendStateCreateInfo.logicOpEnable = VK_FALSE;
    colorBlendStateCreateInfo.logicOp = 0;
    graphicsPipeline.*.resourceLayout = VULKAN_INTERNAL_FetchGraphicsPipelineResourceLayout(renderer, graphicsPipeline.*.vertexShader, graphicsPipeline.*.fragmentShader);
    if (@as(?*anyopaque, @ptrCast(@alignCast(graphicsPipeline.*.resourceLayout))) == @as(?*anyopaque, null)) {
        SDL_free_REAL(@ptrCast(@alignCast(vertexInputBindingDescriptions)));
        SDL_free_REAL(@ptrCast(@alignCast(vertexInputAttributeDescriptions)));
        SDL_free_REAL(@ptrCast(@alignCast(colorBlendAttachmentStates)));
        SDL_free_REAL(@ptrCast(@alignCast(graphicsPipeline)));
        while (true) {
            while (true) {
                if (renderer.*.debugMode) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s", @as([*c]u8, @as([*c]u8, @constCast("Failed to initialize pipeline resource layout!"))));
                }
                _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("Failed to initialize pipeline resource layout!"))));
                if (!false) break;
            }
            return null;
        }
    }
    vkPipelineCreateInfo.sType = VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_CREATE_INFO;
    vkPipelineCreateInfo.pNext = null;
    vkPipelineCreateInfo.flags = 0;
    vkPipelineCreateInfo.stageCount = 2;
    vkPipelineCreateInfo.pStages = @ptrCast(@alignCast(&shaderStageCreateInfos));
    vkPipelineCreateInfo.pVertexInputState = &vertexInputStateCreateInfo;
    vkPipelineCreateInfo.pInputAssemblyState = &inputAssemblyStateCreateInfo;
    vkPipelineCreateInfo.pTessellationState = null;
    vkPipelineCreateInfo.pViewportState = &viewportStateCreateInfo;
    vkPipelineCreateInfo.pRasterizationState = &rasterizationStateCreateInfo;
    vkPipelineCreateInfo.pMultisampleState = &multisampleStateCreateInfo;
    vkPipelineCreateInfo.pDepthStencilState = &depthStencilStateCreateInfo;
    vkPipelineCreateInfo.pColorBlendState = &colorBlendStateCreateInfo;
    vkPipelineCreateInfo.pDynamicState = &dynamicStateCreateInfo;
    vkPipelineCreateInfo.layout = graphicsPipeline.*.resourceLayout.*.pipelineLayout;
    vkPipelineCreateInfo.renderPass = transientRenderPass;
    vkPipelineCreateInfo.subpass = 0;
    vkPipelineCreateInfo.basePipelineHandle = null;
    vkPipelineCreateInfo.basePipelineIndex = 0;
    vulkanResult = renderer.*.vkCreateGraphicsPipelines.?(renderer.*.logicalDevice, null, 1, &vkPipelineCreateInfo, null, &graphicsPipeline.*.pipeline);
    SDL_free_REAL(@ptrCast(@alignCast(vertexInputBindingDescriptions)));
    SDL_free_REAL(@ptrCast(@alignCast(vertexInputAttributeDescriptions)));
    SDL_free_REAL(@ptrCast(@alignCast(colorBlendAttachmentStates)));
    renderer.*.vkDestroyRenderPass.?(renderer.*.logicalDevice, transientRenderPass, null);
    if (vulkanResult != VK_SUCCESS) {
        SDL_free_REAL(@ptrCast(@alignCast(graphicsPipeline)));
        while (true) {
            if (vulkanResult != VK_SUCCESS) {
                if (renderer.*.debugMode) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateGraphicsPipelines"))), VkErrorMessages(vulkanResult));
                }
                _ = SDL_SetError_REAL("%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateGraphicsPipelines"))), VkErrorMessages(vulkanResult));
                return null;
            }
            if (!false) break;
        }
    }
    _ = SDL_SetAtomicInt_REAL(&graphicsPipeline.*.referenceCount, 0);
    if ((renderer.*.debugMode and renderer.*.supportsDebugUtils) and SDL_HasProperty_REAL(createinfo.*.props, "SDL.gpu.graphicspipeline.create.name")) {
        var nameInfo: VkDebugUtilsObjectNameInfoEXT = undefined;
        _ = &nameInfo;
        nameInfo.sType = VK_STRUCTURE_TYPE_DEBUG_UTILS_OBJECT_NAME_INFO_EXT;
        nameInfo.pNext = null;
        nameInfo.pObjectName = SDL_GetStringProperty_REAL(createinfo.*.props, "SDL.gpu.graphicspipeline.create.name", null);
        nameInfo.objectType = VK_OBJECT_TYPE_PIPELINE;
        nameInfo.objectHandle = @intCast(@intFromPtr(graphicsPipeline.*.pipeline));
        _ = renderer.*.vkSetDebugUtilsObjectNameEXT.?(renderer.*.logicalDevice, &nameInfo);
    }
    graphicsPipeline.*.header.num_vertex_samplers = graphicsPipeline.*.resourceLayout.*.vertexSamplerCount;
    graphicsPipeline.*.header.num_vertex_storage_buffers = graphicsPipeline.*.resourceLayout.*.vertexStorageBufferCount;
    graphicsPipeline.*.header.num_vertex_storage_textures = graphicsPipeline.*.resourceLayout.*.vertexStorageTextureCount;
    graphicsPipeline.*.header.num_vertex_uniform_buffers = graphicsPipeline.*.resourceLayout.*.vertexUniformBufferCount;
    graphicsPipeline.*.header.num_fragment_samplers = graphicsPipeline.*.resourceLayout.*.fragmentSamplerCount;
    graphicsPipeline.*.header.num_fragment_storage_buffers = graphicsPipeline.*.resourceLayout.*.fragmentStorageBufferCount;
    graphicsPipeline.*.header.num_fragment_storage_textures = graphicsPipeline.*.resourceLayout.*.fragmentStorageTextureCount;
    graphicsPipeline.*.header.num_fragment_uniform_buffers = graphicsPipeline.*.resourceLayout.*.fragmentUniformBufferCount;
    return @ptrCast(@alignCast(graphicsPipeline));
}
pub fn VULKAN_INTERNAL_IsValidShaderBytecode(code: [*c]const Uint8, codeSize: usize) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if ((codeSize < @as(usize, 4)) or (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(code)))) == @as(?*anyopaque, null))) {
        return @"false" != 0;
    }
    const magic: Uint32 = 119734787;
    _ = &magic;
    const magicInv: Uint32 = 50471687;
    _ = &magicInv;
    return (SDL_memcmp_REAL(@ptrCast(@alignCast(code)), @ptrCast(@alignCast(&magic)), 4) == @as(c_int, 0)) or (SDL_memcmp_REAL(@ptrCast(@alignCast(code)), @ptrCast(@alignCast(&magicInv)), 4) == @as(c_int, 0));
}
pub fn VULKAN_CreateComputePipeline(driverData: ?*SDL_GPURenderer, createinfo: [*c]const SDL_GPUComputePipelineCreateInfo) callconv(.c) ?*SDL_GPUComputePipeline {
    @setEvalBranchQuota(100000);
    var shaderModuleCreateInfo: VkShaderModuleCreateInfo = undefined;
    _ = &shaderModuleCreateInfo;
    var vkShaderCreateInfo: VkComputePipelineCreateInfo = undefined;
    _ = &vkShaderCreateInfo;
    var pipelineShaderStageCreateInfo: VkPipelineShaderStageCreateInfo = undefined;
    _ = &pipelineShaderStageCreateInfo;
    var vulkanResult: VkResult = undefined;
    _ = &vulkanResult;
    var renderer: [*c]VulkanRenderer = @ptrCast(@alignCast(driverData));
    _ = &renderer;
    var vulkanComputePipeline: [*c]VulkanComputePipeline = undefined;
    _ = &vulkanComputePipeline;
    if (createinfo.*.format != (@as(c_uint, 1) << @intCast(@as(c_uint, 1)))) {
        while (true) {
            while (true) {
                if (renderer.*.debugMode) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s", @as([*c]u8, @as([*c]u8, @constCast("Incompatible shader format for Vulkan!"))));
                }
                _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("Incompatible shader format for Vulkan!"))));
                if (!false) break;
            }
            return null;
        }
    }
    if (!VULKAN_INTERNAL_IsValidShaderBytecode(createinfo.*.code, createinfo.*.code_size)) {
        while (true) {
            while (true) {
                if (renderer.*.debugMode) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s", @as([*c]u8, @as([*c]u8, @constCast("The provided shader code is not valid SPIR-V!"))));
                }
                _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("The provided shader code is not valid SPIR-V!"))));
                if (!false) break;
            }
            return null;
        }
    }
    vulkanComputePipeline = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(VulkanComputePipeline))));
    shaderModuleCreateInfo.sType = VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO;
    shaderModuleCreateInfo.pNext = null;
    shaderModuleCreateInfo.flags = 0;
    shaderModuleCreateInfo.codeSize = createinfo.*.code_size;
    shaderModuleCreateInfo.pCode = @ptrCast(@alignCast(createinfo.*.code));
    vulkanResult = renderer.*.vkCreateShaderModule.?(renderer.*.logicalDevice, &shaderModuleCreateInfo, null, &vulkanComputePipeline.*.shaderModule);
    if (vulkanResult != VK_SUCCESS) {
        SDL_free_REAL(@ptrCast(@alignCast(vulkanComputePipeline)));
        while (true) {
            if (vulkanResult != VK_SUCCESS) {
                if (renderer.*.debugMode) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateShaderModule"))), VkErrorMessages(vulkanResult));
                }
                _ = SDL_SetError_REAL("%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateShaderModule"))), VkErrorMessages(vulkanResult));
                return null;
            }
            if (!false) break;
        }
    }
    pipelineShaderStageCreateInfo.sType = VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO;
    pipelineShaderStageCreateInfo.pNext = null;
    pipelineShaderStageCreateInfo.flags = 0;
    pipelineShaderStageCreateInfo.stage = VK_SHADER_STAGE_COMPUTE_BIT;
    pipelineShaderStageCreateInfo.module = vulkanComputePipeline.*.shaderModule;
    pipelineShaderStageCreateInfo.pName = createinfo.*.entrypoint;
    pipelineShaderStageCreateInfo.pSpecializationInfo = null;
    vulkanComputePipeline.*.resourceLayout = VULKAN_INTERNAL_FetchComputePipelineResourceLayout(renderer, createinfo);
    if (@as(?*anyopaque, @ptrCast(@alignCast(vulkanComputePipeline.*.resourceLayout))) == @as(?*anyopaque, null)) {
        renderer.*.vkDestroyShaderModule.?(renderer.*.logicalDevice, vulkanComputePipeline.*.shaderModule, null);
        SDL_free_REAL(@ptrCast(@alignCast(vulkanComputePipeline)));
        return null;
    }
    vkShaderCreateInfo.sType = VK_STRUCTURE_TYPE_COMPUTE_PIPELINE_CREATE_INFO;
    vkShaderCreateInfo.pNext = null;
    vkShaderCreateInfo.flags = 0;
    vkShaderCreateInfo.stage = pipelineShaderStageCreateInfo;
    vkShaderCreateInfo.layout = vulkanComputePipeline.*.resourceLayout.*.pipelineLayout;
    vkShaderCreateInfo.basePipelineHandle = null;
    vkShaderCreateInfo.basePipelineIndex = 0;
    vulkanResult = renderer.*.vkCreateComputePipelines.?(renderer.*.logicalDevice, null, 1, &vkShaderCreateInfo, null, &vulkanComputePipeline.*.pipeline);
    if (vulkanResult != VK_SUCCESS) {
        VULKAN_INTERNAL_DestroyComputePipeline(renderer, vulkanComputePipeline);
        while (true) {
            if (vulkanResult != VK_SUCCESS) {
                if (renderer.*.debugMode) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateComputePipeline"))), VkErrorMessages(vulkanResult));
                }
                _ = SDL_SetError_REAL("%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateComputePipeline"))), VkErrorMessages(vulkanResult));
                return null;
            }
            if (!false) break;
        }
        return null;
    }
    _ = SDL_SetAtomicInt_REAL(&vulkanComputePipeline.*.referenceCount, 0);
    if ((renderer.*.debugMode and renderer.*.supportsDebugUtils) and SDL_HasProperty_REAL(createinfo.*.props, "SDL.gpu.computepipeline.create.name")) {
        var nameInfo: VkDebugUtilsObjectNameInfoEXT = undefined;
        _ = &nameInfo;
        nameInfo.sType = VK_STRUCTURE_TYPE_DEBUG_UTILS_OBJECT_NAME_INFO_EXT;
        nameInfo.pNext = null;
        nameInfo.pObjectName = SDL_GetStringProperty_REAL(createinfo.*.props, "SDL.gpu.computepipeline.create.name", null);
        nameInfo.objectType = VK_OBJECT_TYPE_PIPELINE;
        nameInfo.objectHandle = @intCast(@intFromPtr(vulkanComputePipeline.*.pipeline));
        _ = renderer.*.vkSetDebugUtilsObjectNameEXT.?(renderer.*.logicalDevice, &nameInfo);
    }
    vulkanComputePipeline.*.header.numSamplers = vulkanComputePipeline.*.resourceLayout.*.numSamplers;
    vulkanComputePipeline.*.header.numReadonlyStorageTextures = vulkanComputePipeline.*.resourceLayout.*.numReadonlyStorageTextures;
    vulkanComputePipeline.*.header.numReadonlyStorageBuffers = vulkanComputePipeline.*.resourceLayout.*.numReadonlyStorageBuffers;
    vulkanComputePipeline.*.header.numReadWriteStorageTextures = vulkanComputePipeline.*.resourceLayout.*.numReadWriteStorageTextures;
    vulkanComputePipeline.*.header.numReadWriteStorageBuffers = vulkanComputePipeline.*.resourceLayout.*.numReadWriteStorageBuffers;
    vulkanComputePipeline.*.header.numUniformBuffers = vulkanComputePipeline.*.resourceLayout.*.numUniformBuffers;
    return @ptrCast(@alignCast(vulkanComputePipeline));
}
pub fn VULKAN_CreateSampler(driverData: ?*SDL_GPURenderer, createinfo: [*c]const SDL_GPUSamplerCreateInfo) callconv(.c) ?*SDL_GPUSampler {
    @setEvalBranchQuota(100000);
    var renderer: [*c]VulkanRenderer = @ptrCast(@alignCast(driverData));
    _ = &renderer;
    var vulkanSampler: [*c]VulkanSampler = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(VulkanSampler))));
    _ = &vulkanSampler;
    var vulkanResult: VkResult = undefined;
    _ = &vulkanResult;
    var vkSamplerCreateInfo: VkSamplerCreateInfo = undefined;
    _ = &vkSamplerCreateInfo;
    vkSamplerCreateInfo.sType = VK_STRUCTURE_TYPE_SAMPLER_CREATE_INFO;
    vkSamplerCreateInfo.pNext = null;
    vkSamplerCreateInfo.flags = 0;
    vkSamplerCreateInfo.magFilter = SDLToVK_Filter[createinfo.*.mag_filter];
    vkSamplerCreateInfo.minFilter = SDLToVK_Filter[createinfo.*.min_filter];
    vkSamplerCreateInfo.mipmapMode = SDLToVK_SamplerMipmapMode[createinfo.*.mipmap_mode];
    vkSamplerCreateInfo.addressModeU = SDLToVK_SamplerAddressMode[createinfo.*.address_mode_u];
    vkSamplerCreateInfo.addressModeV = SDLToVK_SamplerAddressMode[createinfo.*.address_mode_v];
    vkSamplerCreateInfo.addressModeW = SDLToVK_SamplerAddressMode[createinfo.*.address_mode_w];
    vkSamplerCreateInfo.mipLodBias = createinfo.*.mip_lod_bias;
    vkSamplerCreateInfo.anisotropyEnable = @intFromBool(createinfo.*.enable_anisotropy);
    vkSamplerCreateInfo.maxAnisotropy = createinfo.*.max_anisotropy;
    vkSamplerCreateInfo.compareEnable = @intFromBool(createinfo.*.enable_compare);
    vkSamplerCreateInfo.compareOp = SDLToVK_CompareOp[createinfo.*.compare_op];
    vkSamplerCreateInfo.minLod = createinfo.*.min_lod;
    vkSamplerCreateInfo.maxLod = createinfo.*.max_lod;
    vkSamplerCreateInfo.borderColor = VK_BORDER_COLOR_FLOAT_TRANSPARENT_BLACK;
    vkSamplerCreateInfo.unnormalizedCoordinates = VK_FALSE;
    vulkanResult = renderer.*.vkCreateSampler.?(renderer.*.logicalDevice, &vkSamplerCreateInfo, null, &vulkanSampler.*.sampler);
    if (vulkanResult != VK_SUCCESS) {
        SDL_free_REAL(@ptrCast(@alignCast(vulkanSampler)));
        while (true) {
            if (vulkanResult != VK_SUCCESS) {
                if (renderer.*.debugMode) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateSampler"))), VkErrorMessages(vulkanResult));
                }
                _ = SDL_SetError_REAL("%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateSampler"))), VkErrorMessages(vulkanResult));
                return null;
            }
            if (!false) break;
        }
    }
    _ = SDL_SetAtomicInt_REAL(&vulkanSampler.*.referenceCount, 0);
    if ((renderer.*.debugMode and renderer.*.supportsDebugUtils) and SDL_HasProperty_REAL(createinfo.*.props, "SDL.gpu.sampler.create.name")) {
        var nameInfo: VkDebugUtilsObjectNameInfoEXT = undefined;
        _ = &nameInfo;
        nameInfo.sType = VK_STRUCTURE_TYPE_DEBUG_UTILS_OBJECT_NAME_INFO_EXT;
        nameInfo.pNext = null;
        nameInfo.pObjectName = SDL_GetStringProperty_REAL(createinfo.*.props, "SDL.gpu.sampler.create.name", null);
        nameInfo.objectType = VK_OBJECT_TYPE_SAMPLER;
        nameInfo.objectHandle = @intCast(@intFromPtr(vulkanSampler.*.sampler));
        _ = renderer.*.vkSetDebugUtilsObjectNameEXT.?(renderer.*.logicalDevice, &nameInfo);
    }
    return @ptrCast(@alignCast(vulkanSampler));
}
pub fn VULKAN_CreateShader(driverData: ?*SDL_GPURenderer, createinfo: [*c]const SDL_GPUShaderCreateInfo) callconv(.c) ?*SDL_GPUShader {
    @setEvalBranchQuota(100000);
    var vulkanShader: [*c]VulkanShader = undefined;
    _ = &vulkanShader;
    var vulkanResult: VkResult = undefined;
    _ = &vulkanResult;
    var vkShaderModuleCreateInfo: VkShaderModuleCreateInfo = undefined;
    _ = &vkShaderModuleCreateInfo;
    var renderer: [*c]VulkanRenderer = @ptrCast(@alignCast(driverData));
    _ = &renderer;
    if (!VULKAN_INTERNAL_IsValidShaderBytecode(createinfo.*.code, createinfo.*.code_size)) {
        while (true) {
            while (true) {
                if (renderer.*.debugMode) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s", @as([*c]u8, @as([*c]u8, @constCast("The provided shader code is not valid SPIR-V!"))));
                }
                _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("The provided shader code is not valid SPIR-V!"))));
                if (!false) break;
            }
            return null;
        }
    }
    vulkanShader = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(VulkanShader))));
    vkShaderModuleCreateInfo.sType = VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO;
    vkShaderModuleCreateInfo.pNext = null;
    vkShaderModuleCreateInfo.flags = 0;
    vkShaderModuleCreateInfo.codeSize = createinfo.*.code_size;
    vkShaderModuleCreateInfo.pCode = @ptrCast(@alignCast(createinfo.*.code));
    vulkanResult = renderer.*.vkCreateShaderModule.?(renderer.*.logicalDevice, &vkShaderModuleCreateInfo, null, &vulkanShader.*.shaderModule);
    if (vulkanResult != VK_SUCCESS) {
        SDL_free_REAL(@ptrCast(@alignCast(vulkanShader)));
        while (true) {
            if (vulkanResult != VK_SUCCESS) {
                if (renderer.*.debugMode) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateShaderModule"))), VkErrorMessages(vulkanResult));
                }
                _ = SDL_SetError_REAL("%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateShaderModule"))), VkErrorMessages(vulkanResult));
                return null;
            }
            if (!false) break;
        }
    }
    var entrypoint: [*c]const u8 = createinfo.*.entrypoint;
    _ = &entrypoint;
    if (!(entrypoint != null)) {
        entrypoint = "main";
    }
    vulkanShader.*.entrypointName = SDL_strdup_REAL(entrypoint);
    vulkanShader.*.stage = createinfo.*.stage;
    vulkanShader.*.numSamplers = createinfo.*.num_samplers;
    vulkanShader.*.numStorageTextures = createinfo.*.num_storage_textures;
    vulkanShader.*.numStorageBuffers = createinfo.*.num_storage_buffers;
    vulkanShader.*.numUniformBuffers = createinfo.*.num_uniform_buffers;
    _ = SDL_SetAtomicInt_REAL(&vulkanShader.*.referenceCount, 0);
    if (renderer.*.debugMode and SDL_HasProperty_REAL(createinfo.*.props, "SDL.gpu.shader.create.name")) {
        var nameInfo: VkDebugUtilsObjectNameInfoEXT = undefined;
        _ = &nameInfo;
        nameInfo.sType = VK_STRUCTURE_TYPE_DEBUG_UTILS_OBJECT_NAME_INFO_EXT;
        nameInfo.pNext = null;
        nameInfo.pObjectName = SDL_GetStringProperty_REAL(createinfo.*.props, "SDL.gpu.shader.create.name", null);
        nameInfo.objectType = VK_OBJECT_TYPE_SHADER_MODULE;
        nameInfo.objectHandle = @intCast(@intFromPtr(vulkanShader.*.shaderModule));
        _ = renderer.*.vkSetDebugUtilsObjectNameEXT.?(renderer.*.logicalDevice, &nameInfo);
    }
    return @ptrCast(@alignCast(vulkanShader));
}
pub fn VULKAN_SupportsSampleCount(driverData: ?*SDL_GPURenderer, format: SDL_GPUTextureFormat, sampleCount: SDL_GPUSampleCount) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var renderer: [*c]VulkanRenderer = @ptrCast(@alignCast(driverData));
    _ = &renderer;
    var bits: VkSampleCountFlags = if (IsDepthFormat(format)) renderer.*.physicalDeviceProperties.properties.limits.framebufferDepthSampleCounts else renderer.*.physicalDeviceProperties.properties.limits.framebufferColorSampleCounts;
    _ = &bits;
    var vkSampleCount: VkSampleCountFlagBits = SDLToVK_SampleCount[sampleCount];
    _ = &vkSampleCount;
    return !!((bits & vkSampleCount) != 0);
}
pub fn VULKAN_CreateTexture(driverData: ?*SDL_GPURenderer, createinfo: [*c]const SDL_GPUTextureCreateInfo) callconv(.c) ?*SDL_GPUTexture {
    @setEvalBranchQuota(100000);
    var renderer: [*c]VulkanRenderer = @ptrCast(@alignCast(driverData));
    _ = &renderer;
    var texture: [*c]VulkanTexture = undefined;
    _ = &texture;
    var container: [*c]VulkanTextureContainer = undefined;
    _ = &container;
    texture = VULKAN_INTERNAL_CreateTexture(renderer, createinfo);
    if (@as(?*anyopaque, @ptrCast(@alignCast(texture))) == @as(?*anyopaque, null)) {
        return null;
    }
    container = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(VulkanTextureContainer))));
    container.*.header.info = createinfo.*;
    container.*.header.info.props = SDL_CreateProperties_REAL();
    if (createinfo.*.props != 0) {
        _ = SDL_CopyProperties_REAL(createinfo.*.props, container.*.header.info.props);
    }
    container.*.canBeCycled = @"true" != 0;
    container.*.activeTexture = texture;
    container.*.textureCapacity = 1;
    container.*.textureCount = 1;
    container.*.textures = @ptrCast(@alignCast(SDL_malloc_REAL(@as(c_ulong, container.*.textureCapacity) *% @sizeOf([*c]VulkanTexture))));
    container.*.textures[@as(c_int, 0)] = container.*.activeTexture;
    container.*.debugName = null;
    if (SDL_HasProperty_REAL(createinfo.*.props, "SDL.gpu.texture.create.name")) {
        container.*.debugName = SDL_strdup_REAL(SDL_GetStringProperty_REAL(createinfo.*.props, "SDL.gpu.texture.create.name", null));
    }
    texture.*.container = container;
    texture.*.containerIndex = 0;
    {
        var barrierCommandBuffer: [*c]VulkanCommandBuffer = @ptrCast(@alignCast(VULKAN_AcquireCommandBuffer(@ptrCast(@alignCast(renderer)))));
        _ = &barrierCommandBuffer;
        VULKAN_INTERNAL_TextureTransitionToDefaultUsage(renderer, barrierCommandBuffer, VULKAN_TEXTURE_USAGE_MODE_UNINITIALIZED, texture);
        VULKAN_INTERNAL_TrackTexture(barrierCommandBuffer, texture);
        if (!VULKAN_Submit(@ptrCast(@alignCast(barrierCommandBuffer)))) {
            VULKAN_ReleaseTexture(@ptrCast(@alignCast(renderer)), @ptrCast(@alignCast(container)));
            return null;
        }
    }
    return @ptrCast(@alignCast(container));
}
pub fn VULKAN_CreateBuffer(driverData: ?*SDL_GPURenderer, usageFlags: SDL_GPUBufferUsageFlags, size: Uint32, debugName: [*c]const u8) callconv(.c) ?*SDL_GPUBuffer {
    @setEvalBranchQuota(100000);
    return @ptrCast(@alignCast(VULKAN_INTERNAL_CreateBufferContainer(@ptrCast(@alignCast(driverData)), size, usageFlags, VULKAN_BUFFER_TYPE_GPU, @"false" != 0, debugName)));
}
pub fn VULKAN_INTERNAL_CreateUniformBuffer(renderer: [*c]VulkanRenderer, size: Uint32) callconv(.c) [*c]VulkanUniformBuffer {
    @setEvalBranchQuota(100000);
    var uniformBuffer: [*c]VulkanUniformBuffer = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(VulkanUniformBuffer))));
    _ = &uniformBuffer;
    uniformBuffer.*.buffer = VULKAN_INTERNAL_CreateBuffer(renderer, size, 0, VULKAN_BUFFER_TYPE_UNIFORM, @"false" != 0, null);
    uniformBuffer.*.drawOffset = 0;
    uniformBuffer.*.writeOffset = 0;
    uniformBuffer.*.buffer.*.uniformBufferForDefrag = uniformBuffer;
    return uniformBuffer;
}
pub fn VULKAN_CreateTransferBuffer(driverData: ?*SDL_GPURenderer, _: SDL_GPUTransferBufferUsage, size: Uint32, debugName: [*c]const u8) callconv(.c) ?*SDL_GPUTransferBuffer {
    @setEvalBranchQuota(100000);
    return @ptrCast(@alignCast(VULKAN_INTERNAL_CreateBufferContainer(@ptrCast(@alignCast(driverData)), size, 0, VULKAN_BUFFER_TYPE_TRANSFER, @"true" != 0, debugName)));
}
pub fn VULKAN_INTERNAL_ReleaseTexture(renderer: [*c]VulkanRenderer, vulkanTexture: [*c]VulkanTexture) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (vulkanTexture.*.markedForDestroy) {
        return;
    }
    SDL_LockMutex_REAL(renderer.*.disposeLock);
    while (true) {
        if ((renderer.*.texturesToDestroyCount +% @as(Uint32, 1)) >= renderer.*.texturesToDestroyCapacity) {
            renderer.*.texturesToDestroyCapacity = renderer.*.texturesToDestroyCapacity *% @as(Uint32, 2);
            renderer.*.texturesToDestroy = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(renderer.*.texturesToDestroy)), @sizeOf([*c]VulkanTexture) *% @as(c_ulong, renderer.*.texturesToDestroyCapacity))));
        }
        if (!false) break;
    }
    renderer.*.texturesToDestroy[renderer.*.texturesToDestroyCount] = vulkanTexture;
    renderer.*.texturesToDestroyCount +%= 1;
    vulkanTexture.*.markedForDestroy = @"true" != 0;
    SDL_UnlockMutex_REAL(renderer.*.disposeLock);
}
pub fn VULKAN_ReleaseTexture(driverData: ?*SDL_GPURenderer, texture: ?*SDL_GPUTexture) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var renderer: [*c]VulkanRenderer = @ptrCast(@alignCast(driverData));
    _ = &renderer;
    var vulkanTextureContainer: [*c]VulkanTextureContainer = @ptrCast(@alignCast(texture));
    _ = &vulkanTextureContainer;
    var i: Uint32 = undefined;
    _ = &i;
    SDL_LockMutex_REAL(renderer.*.disposeLock);
    {
        i = 0;
        while (i < vulkanTextureContainer.*.textureCount) : (i +%= 1) {
            VULKAN_INTERNAL_ReleaseTexture(renderer, vulkanTextureContainer.*.textures[i]);
        }
    }
    SDL_DestroyProperties_REAL(vulkanTextureContainer.*.header.info.props);
    SDL_free_REAL(@ptrCast(@alignCast(vulkanTextureContainer.*.debugName)));
    SDL_free_REAL(@ptrCast(@alignCast(vulkanTextureContainer.*.textures)));
    SDL_free_REAL(@ptrCast(@alignCast(vulkanTextureContainer)));
    SDL_UnlockMutex_REAL(renderer.*.disposeLock);
}
pub fn VULKAN_ReleaseSampler(driverData: ?*SDL_GPURenderer, sampler: ?*SDL_GPUSampler) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var renderer: [*c]VulkanRenderer = @ptrCast(@alignCast(driverData));
    _ = &renderer;
    var vulkanSampler: [*c]VulkanSampler = @ptrCast(@alignCast(sampler));
    _ = &vulkanSampler;
    SDL_LockMutex_REAL(renderer.*.disposeLock);
    while (true) {
        if ((renderer.*.samplersToDestroyCount +% @as(Uint32, 1)) >= renderer.*.samplersToDestroyCapacity) {
            renderer.*.samplersToDestroyCapacity = renderer.*.samplersToDestroyCapacity *% @as(Uint32, 2);
            renderer.*.samplersToDestroy = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(renderer.*.samplersToDestroy)), @sizeOf([*c]VulkanSampler) *% @as(c_ulong, renderer.*.samplersToDestroyCapacity))));
        }
        if (!false) break;
    }
    renderer.*.samplersToDestroy[renderer.*.samplersToDestroyCount] = vulkanSampler;
    renderer.*.samplersToDestroyCount +%= 1;
    SDL_UnlockMutex_REAL(renderer.*.disposeLock);
}
pub fn VULKAN_INTERNAL_ReleaseBuffer(renderer: [*c]VulkanRenderer, vulkanBuffer: [*c]VulkanBuffer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (vulkanBuffer.*.markedForDestroy) {
        return;
    }
    SDL_LockMutex_REAL(renderer.*.disposeLock);
    while (true) {
        if ((renderer.*.buffersToDestroyCount +% @as(Uint32, 1)) >= renderer.*.buffersToDestroyCapacity) {
            renderer.*.buffersToDestroyCapacity = renderer.*.buffersToDestroyCapacity *% @as(Uint32, 2);
            renderer.*.buffersToDestroy = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(renderer.*.buffersToDestroy)), @sizeOf([*c]VulkanBuffer) *% @as(c_ulong, renderer.*.buffersToDestroyCapacity))));
        }
        if (!false) break;
    }
    renderer.*.buffersToDestroy[renderer.*.buffersToDestroyCount] = vulkanBuffer;
    renderer.*.buffersToDestroyCount +%= 1;
    vulkanBuffer.*.markedForDestroy = @"true" != 0;
    vulkanBuffer.*.container = null;
    SDL_UnlockMutex_REAL(renderer.*.disposeLock);
}
pub fn VULKAN_INTERNAL_ReleaseBufferContainer(renderer: [*c]VulkanRenderer, bufferContainer: [*c]VulkanBufferContainer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var i: Uint32 = undefined;
    _ = &i;
    SDL_LockMutex_REAL(renderer.*.disposeLock);
    {
        i = 0;
        while (i < bufferContainer.*.bufferCount) : (i +%= 1) {
            VULKAN_INTERNAL_ReleaseBuffer(renderer, bufferContainer.*.buffers[i]);
        }
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(bufferContainer.*.debugName))) != @as(?*anyopaque, null)) {
        SDL_free_REAL(@ptrCast(@alignCast(bufferContainer.*.debugName)));
        bufferContainer.*.debugName = null;
    }
    SDL_free_REAL(@ptrCast(@alignCast(bufferContainer.*.buffers)));
    SDL_free_REAL(@ptrCast(@alignCast(bufferContainer)));
    SDL_UnlockMutex_REAL(renderer.*.disposeLock);
}
pub fn VULKAN_ReleaseBuffer(driverData: ?*SDL_GPURenderer, buffer: ?*SDL_GPUBuffer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var renderer: [*c]VulkanRenderer = @ptrCast(@alignCast(driverData));
    _ = &renderer;
    var vulkanBufferContainer: [*c]VulkanBufferContainer = @ptrCast(@alignCast(buffer));
    _ = &vulkanBufferContainer;
    VULKAN_INTERNAL_ReleaseBufferContainer(renderer, vulkanBufferContainer);
}
pub fn VULKAN_ReleaseTransferBuffer(driverData: ?*SDL_GPURenderer, transferBuffer: ?*SDL_GPUTransferBuffer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var renderer: [*c]VulkanRenderer = @ptrCast(@alignCast(driverData));
    _ = &renderer;
    var transferBufferContainer: [*c]VulkanBufferContainer = @ptrCast(@alignCast(transferBuffer));
    _ = &transferBufferContainer;
    VULKAN_INTERNAL_ReleaseBufferContainer(renderer, transferBufferContainer);
}
pub fn VULKAN_ReleaseShader(driverData: ?*SDL_GPURenderer, shader: ?*SDL_GPUShader) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var renderer: [*c]VulkanRenderer = @ptrCast(@alignCast(driverData));
    _ = &renderer;
    var vulkanShader: [*c]VulkanShader = @ptrCast(@alignCast(shader));
    _ = &vulkanShader;
    SDL_LockMutex_REAL(renderer.*.disposeLock);
    while (true) {
        if ((renderer.*.shadersToDestroyCount +% @as(Uint32, 1)) >= renderer.*.shadersToDestroyCapacity) {
            renderer.*.shadersToDestroyCapacity = renderer.*.shadersToDestroyCapacity *% @as(Uint32, 2);
            renderer.*.shadersToDestroy = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(renderer.*.shadersToDestroy)), @sizeOf([*c]VulkanShader) *% @as(c_ulong, renderer.*.shadersToDestroyCapacity))));
        }
        if (!false) break;
    }
    renderer.*.shadersToDestroy[renderer.*.shadersToDestroyCount] = vulkanShader;
    renderer.*.shadersToDestroyCount +%= 1;
    SDL_UnlockMutex_REAL(renderer.*.disposeLock);
}
pub fn VULKAN_ReleaseComputePipeline(driverData: ?*SDL_GPURenderer, computePipeline: ?*SDL_GPUComputePipeline) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var renderer: [*c]VulkanRenderer = @ptrCast(@alignCast(driverData));
    _ = &renderer;
    var vulkanComputePipeline: [*c]VulkanComputePipeline = @ptrCast(@alignCast(computePipeline));
    _ = &vulkanComputePipeline;
    SDL_LockMutex_REAL(renderer.*.disposeLock);
    while (true) {
        if ((renderer.*.computePipelinesToDestroyCount +% @as(Uint32, 1)) >= renderer.*.computePipelinesToDestroyCapacity) {
            renderer.*.computePipelinesToDestroyCapacity = renderer.*.computePipelinesToDestroyCapacity *% @as(Uint32, 2);
            renderer.*.computePipelinesToDestroy = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(renderer.*.computePipelinesToDestroy)), @sizeOf([*c]VulkanComputePipeline) *% @as(c_ulong, renderer.*.computePipelinesToDestroyCapacity))));
        }
        if (!false) break;
    }
    renderer.*.computePipelinesToDestroy[renderer.*.computePipelinesToDestroyCount] = vulkanComputePipeline;
    renderer.*.computePipelinesToDestroyCount +%= 1;
    SDL_UnlockMutex_REAL(renderer.*.disposeLock);
}
pub fn VULKAN_ReleaseGraphicsPipeline(driverData: ?*SDL_GPURenderer, graphicsPipeline: ?*SDL_GPUGraphicsPipeline) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var renderer: [*c]VulkanRenderer = @ptrCast(@alignCast(driverData));
    _ = &renderer;
    var vulkanGraphicsPipeline: [*c]VulkanGraphicsPipeline = @ptrCast(@alignCast(graphicsPipeline));
    _ = &vulkanGraphicsPipeline;
    SDL_LockMutex_REAL(renderer.*.disposeLock);
    while (true) {
        if ((renderer.*.graphicsPipelinesToDestroyCount +% @as(Uint32, 1)) >= renderer.*.graphicsPipelinesToDestroyCapacity) {
            renderer.*.graphicsPipelinesToDestroyCapacity = renderer.*.graphicsPipelinesToDestroyCapacity *% @as(Uint32, 2);
            renderer.*.graphicsPipelinesToDestroy = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(renderer.*.graphicsPipelinesToDestroy)), @sizeOf([*c]VulkanGraphicsPipeline) *% @as(c_ulong, renderer.*.graphicsPipelinesToDestroyCapacity))));
        }
        if (!false) break;
    }
    renderer.*.graphicsPipelinesToDestroy[renderer.*.graphicsPipelinesToDestroyCount] = vulkanGraphicsPipeline;
    renderer.*.graphicsPipelinesToDestroyCount +%= 1;
    SDL_UnlockMutex_REAL(renderer.*.disposeLock);
}
pub fn VULKAN_INTERNAL_FetchRenderPass(renderer: [*c]VulkanRenderer, colorTargetInfos: [*c]const SDL_GPUColorTargetInfo, numColorTargets: Uint32, depthStencilTargetInfo: [*c]const SDL_GPUDepthStencilTargetInfo) callconv(.c) VkRenderPass {
    @setEvalBranchQuota(100000);
    var renderPassWrapper: [*c]VulkanRenderPassHashTableValue = null;
    _ = &renderPassWrapper;
    var renderPassHandle: VkRenderPass = undefined;
    _ = &renderPassHandle;
    var key: RenderPassHashTableKey = undefined;
    _ = &key;
    var i: Uint32 = undefined;
    _ = &i;
    _ = memset(@ptrCast(@alignCast(&key)), 0, @sizeOf(@TypeOf(key)));
    {
        i = 0;
        while (i < numColorTargets) : (i +%= 1) {
            key.colorTargetDescriptions[i].format = SDLToVK_TextureFormat[@as([*c]VulkanTextureContainer, @ptrCast(@alignCast(colorTargetInfos[i].texture))).*.header.info.format];
            key.colorTargetDescriptions[i].loadOp = colorTargetInfos[i].load_op;
            key.colorTargetDescriptions[i].storeOp = colorTargetInfos[i].store_op;
            if (@as(?*anyopaque, @ptrCast(@alignCast(colorTargetInfos[i].resolve_texture))) != @as(?*anyopaque, null)) {
                key.resolveTargetFormats[key.numResolveTargets] = SDLToVK_TextureFormat[@as([*c]VulkanTextureContainer, @ptrCast(@alignCast(colorTargetInfos[i].resolve_texture))).*.header.info.format];
                key.numResolveTargets +%= 1;
            }
        }
    }
    key.sampleCount = VK_SAMPLE_COUNT_1_BIT;
    if (numColorTargets > @as(Uint32, 0)) {
        key.sampleCount = SDLToVK_SampleCount[@as([*c]VulkanTextureContainer, @ptrCast(@alignCast(colorTargetInfos[@as(c_int, 0)].texture))).*.header.info.sample_count];
    } else if ((numColorTargets == @as(Uint32, 0)) and (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(depthStencilTargetInfo)))) != @as(?*anyopaque, null))) {
        key.sampleCount = SDLToVK_SampleCount[@as([*c]VulkanTextureContainer, @ptrCast(@alignCast(depthStencilTargetInfo.*.texture))).*.header.info.sample_count];
    }
    key.numColorTargets = numColorTargets;
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(depthStencilTargetInfo)))) == @as(?*anyopaque, null)) {
        key.depthStencilTargetDescription.format = 0;
        key.depthStencilTargetDescription.loadOp = SDL_GPU_LOADOP_DONT_CARE;
        key.depthStencilTargetDescription.storeOp = SDL_GPU_STOREOP_DONT_CARE;
        key.depthStencilTargetDescription.stencilLoadOp = SDL_GPU_LOADOP_DONT_CARE;
        key.depthStencilTargetDescription.stencilStoreOp = SDL_GPU_STOREOP_DONT_CARE;
    } else {
        key.depthStencilTargetDescription.format = SDLToVK_TextureFormat[@as([*c]VulkanTextureContainer, @ptrCast(@alignCast(depthStencilTargetInfo.*.texture))).*.header.info.format];
        key.depthStencilTargetDescription.loadOp = depthStencilTargetInfo.*.load_op;
        key.depthStencilTargetDescription.storeOp = depthStencilTargetInfo.*.store_op;
        key.depthStencilTargetDescription.stencilLoadOp = depthStencilTargetInfo.*.stencil_load_op;
        key.depthStencilTargetDescription.stencilStoreOp = depthStencilTargetInfo.*.stencil_store_op;
    }
    SDL_LockMutex_REAL(renderer.*.renderPassFetchLock);
    var result: bool = SDL_FindInHashTable(renderer.*.renderPassHashTable, @ptrCast(@alignCast(&key)), @ptrCast(@alignCast(&renderPassWrapper)));
    _ = &result;
    if (result) {
        SDL_UnlockMutex_REAL(renderer.*.renderPassFetchLock);
        return renderPassWrapper.*.handle;
    }
    renderPassHandle = VULKAN_INTERNAL_CreateRenderPass(renderer, colorTargetInfos, numColorTargets, depthStencilTargetInfo);
    if (@as(?*anyopaque, @ptrCast(@alignCast(renderPassHandle))) == @as(?*anyopaque, null)) {
        SDL_UnlockMutex_REAL(renderer.*.renderPassFetchLock);
        return null;
    }
    var allocedKey: [*c]RenderPassHashTableKey = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(RenderPassHashTableKey))));
    _ = &allocedKey;
    _ = memcpy(@ptrCast(@alignCast(allocedKey)), @ptrCast(@alignCast(&key)), @sizeOf(RenderPassHashTableKey));
    renderPassWrapper = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(VulkanRenderPassHashTableValue))));
    renderPassWrapper.*.handle = renderPassHandle;
    _ = SDL_InsertIntoHashTable(renderer.*.renderPassHashTable, @ptrCast(@alignCast(allocedKey)), @ptrCast(@alignCast(renderPassWrapper)), @"true" != 0);
    SDL_UnlockMutex_REAL(renderer.*.renderPassFetchLock);
    return renderPassHandle;
}
pub fn VULKAN_INTERNAL_FetchFramebuffer(renderer: [*c]VulkanRenderer, renderPass: VkRenderPass, colorTargetInfos: [*c]const SDL_GPUColorTargetInfo, numColorTargets: Uint32, depthStencilTargetInfo: [*c]const SDL_GPUDepthStencilTargetInfo, width: Uint32, height: Uint32) callconv(.c) [*c]VulkanFramebuffer {
    @setEvalBranchQuota(100000);
    var vulkanFramebuffer: [*c]VulkanFramebuffer = null;
    _ = &vulkanFramebuffer;
    var framebufferInfo: VkFramebufferCreateInfo = undefined;
    _ = &framebufferInfo;
    var result: VkResult = undefined;
    _ = &result;
    var imageViewAttachments: [17]VkImageView = undefined;
    _ = &imageViewAttachments;
    var key: FramebufferHashTableKey = undefined;
    _ = &key;
    var attachmentCount: Uint32 = 0;
    _ = &attachmentCount;
    var i: Uint32 = undefined;
    _ = &i;
    _ = memset(@ptrCast(@alignCast(&imageViewAttachments)), 0, @sizeOf(@TypeOf(imageViewAttachments)));
    _ = memset(@ptrCast(@alignCast(&key)), 0, @sizeOf(@TypeOf(key)));
    key.numColorTargets = numColorTargets;
    {
        i = 0;
        while (i < numColorTargets) : (i +%= 1) {
            var container: [*c]VulkanTextureContainer = @ptrCast(@alignCast(colorTargetInfos[i].texture));
            _ = &container;
            var subresource: [*c]VulkanTextureSubresource = VULKAN_INTERNAL_FetchTextureSubresource(container, if (container.*.header.info.type == @as(SDL_GPUTextureType, SDL_GPU_TEXTURETYPE_3D)) @as(Uint32, 0) else colorTargetInfos[i].layer_or_depth_plane, colorTargetInfos[i].mip_level);
            _ = &subresource;
            var rtvIndex: Uint32 = if (container.*.header.info.type == @as(SDL_GPUTextureType, SDL_GPU_TEXTURETYPE_3D)) colorTargetInfos[i].layer_or_depth_plane else @as(Uint32, 0);
            _ = &rtvIndex;
            key.colorAttachmentViews[i] = subresource.*.renderTargetViews[rtvIndex];
            if (@as(?*anyopaque, @ptrCast(@alignCast(colorTargetInfos[i].resolve_texture))) != @as(?*anyopaque, null)) {
                var resolveTextureContainer: [*c]VulkanTextureContainer = @ptrCast(@alignCast(colorTargetInfos[i].resolve_texture));
                _ = &resolveTextureContainer;
                var resolveSubresource: [*c]VulkanTextureSubresource = VULKAN_INTERNAL_FetchTextureSubresource(resolveTextureContainer, colorTargetInfos[i].layer_or_depth_plane, colorTargetInfos[i].mip_level);
                _ = &resolveSubresource;
                key.resolveAttachmentViews[key.numResolveAttachments] = resolveSubresource.*.renderTargetViews[@as(c_int, 0)];
                key.numResolveAttachments +%= 1;
            }
        }
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(depthStencilTargetInfo)))) == @as(?*anyopaque, null)) {
        key.depthStencilAttachmentView = null;
    } else {
        var subresource: [*c]VulkanTextureSubresource = VULKAN_INTERNAL_FetchTextureSubresource(@ptrCast(@alignCast(depthStencilTargetInfo.*.texture)), depthStencilTargetInfo.*.layer, depthStencilTargetInfo.*.mip_level);
        _ = &subresource;
        key.depthStencilAttachmentView = subresource.*.depthStencilView;
    }
    key.width = width;
    key.height = height;
    SDL_LockMutex_REAL(renderer.*.framebufferFetchLock);
    var findResult: bool = SDL_FindInHashTable(renderer.*.framebufferHashTable, @ptrCast(@alignCast(&key)), @ptrCast(@alignCast(&vulkanFramebuffer)));
    _ = &findResult;
    if (findResult) {
        SDL_UnlockMutex_REAL(renderer.*.framebufferFetchLock);
        return vulkanFramebuffer;
    }
    vulkanFramebuffer = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(VulkanFramebuffer))));
    _ = SDL_SetAtomicInt_REAL(&vulkanFramebuffer.*.referenceCount, 0);
    {
        i = 0;
        while (i < numColorTargets) : (i +%= 1) {
            var container: [*c]VulkanTextureContainer = @ptrCast(@alignCast(colorTargetInfos[i].texture));
            _ = &container;
            var subresource: [*c]VulkanTextureSubresource = VULKAN_INTERNAL_FetchTextureSubresource(container, if (container.*.header.info.type == @as(SDL_GPUTextureType, SDL_GPU_TEXTURETYPE_3D)) @as(Uint32, 0) else colorTargetInfos[i].layer_or_depth_plane, colorTargetInfos[i].mip_level);
            _ = &subresource;
            var rtvIndex: Uint32 = if (container.*.header.info.type == @as(SDL_GPUTextureType, SDL_GPU_TEXTURETYPE_3D)) colorTargetInfos[i].layer_or_depth_plane else @as(Uint32, 0);
            _ = &rtvIndex;
            imageViewAttachments[attachmentCount] = subresource.*.renderTargetViews[rtvIndex];
            attachmentCount +%= 1;
            if ((colorTargetInfos[i].store_op == @as(SDL_GPUStoreOp, SDL_GPU_STOREOP_RESOLVE)) or (colorTargetInfos[i].store_op == @as(SDL_GPUStoreOp, SDL_GPU_STOREOP_RESOLVE_AND_STORE))) {
                var resolveContainer: [*c]VulkanTextureContainer = @ptrCast(@alignCast(colorTargetInfos[i].resolve_texture));
                _ = &resolveContainer;
                var resolveSubresource: [*c]VulkanTextureSubresource = VULKAN_INTERNAL_FetchTextureSubresource(resolveContainer, colorTargetInfos[i].resolve_layer, colorTargetInfos[i].resolve_mip_level);
                _ = &resolveSubresource;
                imageViewAttachments[attachmentCount] = resolveSubresource.*.renderTargetViews[@as(c_int, 0)];
                attachmentCount +%= 1;
            }
        }
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(depthStencilTargetInfo)))) != @as(?*anyopaque, null)) {
        var subresource: [*c]VulkanTextureSubresource = VULKAN_INTERNAL_FetchTextureSubresource(@ptrCast(@alignCast(depthStencilTargetInfo.*.texture)), depthStencilTargetInfo.*.layer, depthStencilTargetInfo.*.mip_level);
        _ = &subresource;
        imageViewAttachments[attachmentCount] = subresource.*.depthStencilView;
        attachmentCount +%= 1;
    }
    framebufferInfo.sType = VK_STRUCTURE_TYPE_FRAMEBUFFER_CREATE_INFO;
    framebufferInfo.pNext = null;
    framebufferInfo.flags = 0;
    framebufferInfo.renderPass = renderPass;
    framebufferInfo.attachmentCount = attachmentCount;
    framebufferInfo.pAttachments = @ptrCast(@alignCast(&imageViewAttachments));
    framebufferInfo.width = key.width;
    framebufferInfo.height = key.height;
    framebufferInfo.layers = 1;
    result = renderer.*.vkCreateFramebuffer.?(renderer.*.logicalDevice, &framebufferInfo, null, &vulkanFramebuffer.*.framebuffer);
    if (result == VK_SUCCESS) {
        var allocedKey: [*c]FramebufferHashTableKey = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(FramebufferHashTableKey))));
        _ = &allocedKey;
        _ = memcpy(@ptrCast(@alignCast(allocedKey)), @ptrCast(@alignCast(&key)), @sizeOf(FramebufferHashTableKey));
        _ = SDL_InsertIntoHashTable(renderer.*.framebufferHashTable, @ptrCast(@alignCast(allocedKey)), @ptrCast(@alignCast(vulkanFramebuffer)), @"true" != 0);
    } else {
        SDL_free_REAL(@ptrCast(@alignCast(vulkanFramebuffer)));
        SDL_UnlockMutex_REAL(renderer.*.framebufferFetchLock);
        while (true) {
            if (result != VK_SUCCESS) {
                if (renderer.*.debugMode) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateFramebuffer"))), VkErrorMessages(result));
                }
                _ = SDL_SetError_REAL("%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateFramebuffer"))), VkErrorMessages(result));
                return null;
            }
            if (!false) break;
        }
    }
    SDL_UnlockMutex_REAL(renderer.*.framebufferFetchLock);
    return vulkanFramebuffer;
}
pub fn VULKAN_INTERNAL_SetCurrentViewport(commandBuffer: [*c]VulkanCommandBuffer, viewport: [*c]const SDL_GPUViewport) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var vulkanCommandBuffer: [*c]VulkanCommandBuffer = commandBuffer;
    _ = &vulkanCommandBuffer;
    var renderer: [*c]VulkanRenderer = vulkanCommandBuffer.*.renderer;
    _ = &renderer;
    vulkanCommandBuffer.*.currentViewport.x = viewport.*.x;
    vulkanCommandBuffer.*.currentViewport.width = viewport.*.w;
    vulkanCommandBuffer.*.currentViewport.minDepth = viewport.*.min_depth;
    vulkanCommandBuffer.*.currentViewport.maxDepth = viewport.*.max_depth;
    vulkanCommandBuffer.*.currentViewport.y = viewport.*.y + viewport.*.h;
    vulkanCommandBuffer.*.currentViewport.height = -viewport.*.h;
    renderer.*.vkCmdSetViewport.?(vulkanCommandBuffer.*.commandBuffer, 0, 1, &vulkanCommandBuffer.*.currentViewport);
}
pub fn VULKAN_SetViewport(commandBuffer: ?*SDL_GPUCommandBuffer, viewport: [*c]const SDL_GPUViewport) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var vulkanCommandBuffer: [*c]VulkanCommandBuffer = @ptrCast(@alignCast(commandBuffer));
    _ = &vulkanCommandBuffer;
    VULKAN_INTERNAL_SetCurrentViewport(vulkanCommandBuffer, viewport);
}
pub fn VULKAN_INTERNAL_SetCurrentScissor(vulkanCommandBuffer: [*c]VulkanCommandBuffer, scissor: [*c]const SDL_Rect) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var renderer: [*c]VulkanRenderer = vulkanCommandBuffer.*.renderer;
    _ = &renderer;
    vulkanCommandBuffer.*.currentScissor.offset.x = scissor.*.x;
    vulkanCommandBuffer.*.currentScissor.offset.y = scissor.*.y;
    vulkanCommandBuffer.*.currentScissor.extent.width = @bitCast(@as(c_int, scissor.*.w));
    vulkanCommandBuffer.*.currentScissor.extent.height = @bitCast(@as(c_int, scissor.*.h));
    renderer.*.vkCmdSetScissor.?(vulkanCommandBuffer.*.commandBuffer, 0, 1, &vulkanCommandBuffer.*.currentScissor);
}
pub fn VULKAN_SetScissor(commandBuffer: ?*SDL_GPUCommandBuffer, scissor: [*c]const SDL_Rect) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var vulkanCommandBuffer: [*c]VulkanCommandBuffer = @ptrCast(@alignCast(commandBuffer));
    _ = &vulkanCommandBuffer;
    VULKAN_INTERNAL_SetCurrentScissor(vulkanCommandBuffer, scissor);
}
pub fn VULKAN_INTERNAL_SetCurrentBlendConstants(vulkanCommandBuffer: [*c]VulkanCommandBuffer, blendConstants: SDL_FColor) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var renderer: [*c]VulkanRenderer = vulkanCommandBuffer.*.renderer;
    _ = &renderer;
    vulkanCommandBuffer.*.blendConstants[@as(c_int, 0)] = blendConstants.r;
    vulkanCommandBuffer.*.blendConstants[@as(c_int, 1)] = blendConstants.g;
    vulkanCommandBuffer.*.blendConstants[@as(c_int, 2)] = blendConstants.b;
    vulkanCommandBuffer.*.blendConstants[@as(c_int, 3)] = blendConstants.a;
    renderer.*.vkCmdSetBlendConstants.?(vulkanCommandBuffer.*.commandBuffer, @ptrCast(@alignCast(&vulkanCommandBuffer.*.blendConstants)));
}
pub fn VULKAN_SetBlendConstants(commandBuffer: ?*SDL_GPUCommandBuffer, blendConstants: SDL_FColor) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var vulkanCommandBuffer: [*c]VulkanCommandBuffer = @ptrCast(@alignCast(commandBuffer));
    _ = &vulkanCommandBuffer;
    VULKAN_INTERNAL_SetCurrentBlendConstants(vulkanCommandBuffer, blendConstants);
}
pub fn VULKAN_INTERNAL_SetCurrentStencilReference(vulkanCommandBuffer: [*c]VulkanCommandBuffer, reference: Uint8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var renderer: [*c]VulkanRenderer = vulkanCommandBuffer.*.renderer;
    _ = &renderer;
    vulkanCommandBuffer.*.stencilRef = reference;
    renderer.*.vkCmdSetStencilReference.?(vulkanCommandBuffer.*.commandBuffer, VK_STENCIL_FACE_FRONT_AND_BACK, vulkanCommandBuffer.*.stencilRef);
}
pub fn VULKAN_SetStencilReference(commandBuffer: ?*SDL_GPUCommandBuffer, reference: Uint8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var vulkanCommandBuffer: [*c]VulkanCommandBuffer = @ptrCast(@alignCast(commandBuffer));
    _ = &vulkanCommandBuffer;
    VULKAN_INTERNAL_SetCurrentStencilReference(vulkanCommandBuffer, reference);
}
pub fn VULKAN_BindVertexSamplers(commandBuffer: ?*SDL_GPUCommandBuffer, firstSlot: Uint32, textureSamplerBindings: [*c]const SDL_GPUTextureSamplerBinding, numBindings: Uint32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var vulkanCommandBuffer: [*c]VulkanCommandBuffer = @ptrCast(@alignCast(commandBuffer));
    _ = &vulkanCommandBuffer;
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < numBindings) : (i +%= 1) {
            var textureContainer: [*c]VulkanTextureContainer = @ptrCast(@alignCast(textureSamplerBindings[i].texture));
            _ = &textureContainer;
            var sampler: [*c]VulkanSampler = @ptrCast(@alignCast(textureSamplerBindings[i].sampler));
            _ = &sampler;
            if (vulkanCommandBuffer.*.vertexSamplerBindings[firstSlot +% i] != sampler.*.sampler) {
                VULKAN_INTERNAL_TrackSampler(vulkanCommandBuffer, @ptrCast(@alignCast(textureSamplerBindings[i].sampler)));
                vulkanCommandBuffer.*.vertexSamplerBindings[firstSlot +% i] = sampler.*.sampler;
                vulkanCommandBuffer.*.needNewVertexResourceDescriptorSet = @"true" != 0;
            }
            if (vulkanCommandBuffer.*.vertexSamplerTextureViewBindings[firstSlot +% i] != textureContainer.*.activeTexture.*.fullView) {
                VULKAN_INTERNAL_TrackTexture(vulkanCommandBuffer, textureContainer.*.activeTexture);
                vulkanCommandBuffer.*.vertexSamplerTextureViewBindings[firstSlot +% i] = textureContainer.*.activeTexture.*.fullView;
                vulkanCommandBuffer.*.needNewVertexResourceDescriptorSet = @"true" != 0;
            }
        }
    }
}
pub fn VULKAN_BindVertexStorageTextures(commandBuffer: ?*SDL_GPUCommandBuffer, firstSlot: Uint32, storageTextures: [*c]const ?*SDL_GPUTexture, numBindings: Uint32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var vulkanCommandBuffer: [*c]VulkanCommandBuffer = @ptrCast(@alignCast(commandBuffer));
    _ = &vulkanCommandBuffer;
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < numBindings) : (i +%= 1) {
            var textureContainer: [*c]VulkanTextureContainer = @ptrCast(@alignCast(storageTextures[i]));
            _ = &textureContainer;
            if (vulkanCommandBuffer.*.vertexStorageTextureViewBindings[firstSlot +% i] != textureContainer.*.activeTexture.*.fullView) {
                VULKAN_INTERNAL_TrackTexture(vulkanCommandBuffer, textureContainer.*.activeTexture);
                vulkanCommandBuffer.*.vertexStorageTextureViewBindings[firstSlot +% i] = textureContainer.*.activeTexture.*.fullView;
                vulkanCommandBuffer.*.needNewVertexResourceDescriptorSet = @"true" != 0;
            }
        }
    }
}
pub fn VULKAN_BindVertexStorageBuffers(commandBuffer: ?*SDL_GPUCommandBuffer, firstSlot: Uint32, storageBuffers: [*c]const ?*SDL_GPUBuffer, numBindings: Uint32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var vulkanCommandBuffer: [*c]VulkanCommandBuffer = @ptrCast(@alignCast(commandBuffer));
    _ = &vulkanCommandBuffer;
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < numBindings) : (i +%= 1) {
            var bufferContainer: [*c]VulkanBufferContainer = @ptrCast(@alignCast(storageBuffers[i]));
            _ = &bufferContainer;
            if (vulkanCommandBuffer.*.vertexStorageBufferBindings[firstSlot +% i] != bufferContainer.*.activeBuffer.*.buffer) {
                VULKAN_INTERNAL_TrackBuffer(vulkanCommandBuffer, bufferContainer.*.activeBuffer);
                vulkanCommandBuffer.*.vertexStorageBufferBindings[firstSlot +% i] = bufferContainer.*.activeBuffer.*.buffer;
                vulkanCommandBuffer.*.needNewVertexResourceDescriptorSet = @"true" != 0;
            }
        }
    }
}
pub fn VULKAN_BindFragmentSamplers(commandBuffer: ?*SDL_GPUCommandBuffer, firstSlot: Uint32, textureSamplerBindings: [*c]const SDL_GPUTextureSamplerBinding, numBindings: Uint32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var vulkanCommandBuffer: [*c]VulkanCommandBuffer = @ptrCast(@alignCast(commandBuffer));
    _ = &vulkanCommandBuffer;
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < numBindings) : (i +%= 1) {
            var textureContainer: [*c]VulkanTextureContainer = @ptrCast(@alignCast(textureSamplerBindings[i].texture));
            _ = &textureContainer;
            var sampler: [*c]VulkanSampler = @ptrCast(@alignCast(textureSamplerBindings[i].sampler));
            _ = &sampler;
            if (vulkanCommandBuffer.*.fragmentSamplerBindings[firstSlot +% i] != sampler.*.sampler) {
                VULKAN_INTERNAL_TrackSampler(vulkanCommandBuffer, @ptrCast(@alignCast(textureSamplerBindings[i].sampler)));
                vulkanCommandBuffer.*.fragmentSamplerBindings[firstSlot +% i] = sampler.*.sampler;
                vulkanCommandBuffer.*.needNewFragmentResourceDescriptorSet = @"true" != 0;
            }
            if (vulkanCommandBuffer.*.fragmentSamplerTextureViewBindings[firstSlot +% i] != textureContainer.*.activeTexture.*.fullView) {
                VULKAN_INTERNAL_TrackTexture(vulkanCommandBuffer, textureContainer.*.activeTexture);
                vulkanCommandBuffer.*.fragmentSamplerTextureViewBindings[firstSlot +% i] = textureContainer.*.activeTexture.*.fullView;
                vulkanCommandBuffer.*.needNewFragmentResourceDescriptorSet = @"true" != 0;
            }
        }
    }
}
pub fn VULKAN_BindFragmentStorageTextures(commandBuffer: ?*SDL_GPUCommandBuffer, firstSlot: Uint32, storageTextures: [*c]const ?*SDL_GPUTexture, numBindings: Uint32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var vulkanCommandBuffer: [*c]VulkanCommandBuffer = @ptrCast(@alignCast(commandBuffer));
    _ = &vulkanCommandBuffer;
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < numBindings) : (i +%= 1) {
            var textureContainer: [*c]VulkanTextureContainer = @ptrCast(@alignCast(storageTextures[i]));
            _ = &textureContainer;
            if (vulkanCommandBuffer.*.fragmentStorageTextureViewBindings[firstSlot +% i] != textureContainer.*.activeTexture.*.fullView) {
                VULKAN_INTERNAL_TrackTexture(vulkanCommandBuffer, textureContainer.*.activeTexture);
                vulkanCommandBuffer.*.fragmentStorageTextureViewBindings[firstSlot +% i] = textureContainer.*.activeTexture.*.fullView;
                vulkanCommandBuffer.*.needNewFragmentResourceDescriptorSet = @"true" != 0;
            }
        }
    }
}
pub fn VULKAN_BindFragmentStorageBuffers(commandBuffer: ?*SDL_GPUCommandBuffer, firstSlot: Uint32, storageBuffers: [*c]const ?*SDL_GPUBuffer, numBindings: Uint32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var vulkanCommandBuffer: [*c]VulkanCommandBuffer = @ptrCast(@alignCast(commandBuffer));
    _ = &vulkanCommandBuffer;
    var bufferContainer: [*c]VulkanBufferContainer = undefined;
    _ = &bufferContainer;
    var i: Uint32 = undefined;
    _ = &i;
    {
        i = 0;
        while (i < numBindings) : (i +%= 1) {
            bufferContainer = @ptrCast(@alignCast(storageBuffers[i]));
            if (vulkanCommandBuffer.*.fragmentStorageBufferBindings[firstSlot +% i] != bufferContainer.*.activeBuffer.*.buffer) {
                VULKAN_INTERNAL_TrackBuffer(vulkanCommandBuffer, bufferContainer.*.activeBuffer);
                vulkanCommandBuffer.*.fragmentStorageBufferBindings[firstSlot +% i] = bufferContainer.*.activeBuffer.*.buffer;
                vulkanCommandBuffer.*.needNewFragmentResourceDescriptorSet = @"true" != 0;
            }
        }
    }
}
pub fn VULKAN_INTERNAL_AcquireUniformBufferFromPool(commandBuffer: [*c]VulkanCommandBuffer) callconv(.c) [*c]VulkanUniformBuffer {
    @setEvalBranchQuota(100000);
    var renderer: [*c]VulkanRenderer = commandBuffer.*.renderer;
    _ = &renderer;
    var uniformBuffer: [*c]VulkanUniformBuffer = undefined;
    _ = &uniformBuffer;
    SDL_LockMutex_REAL(renderer.*.acquireUniformBufferLock);
    if (renderer.*.uniformBufferPoolCount > @as(Uint32, 0)) {
        uniformBuffer = renderer.*.uniformBufferPool[renderer.*.uniformBufferPoolCount -% @as(Uint32, 1)];
        renderer.*.uniformBufferPoolCount -%= 1;
    } else {
        uniformBuffer = VULKAN_INTERNAL_CreateUniformBuffer(renderer, UNIFORM_BUFFER_SIZE);
    }
    SDL_UnlockMutex_REAL(renderer.*.acquireUniformBufferLock);
    VULKAN_INTERNAL_TrackUniformBuffer(commandBuffer, uniformBuffer);
    return uniformBuffer;
}
pub fn VULKAN_INTERNAL_ReturnUniformBufferToPool(renderer: [*c]VulkanRenderer, uniformBuffer: [*c]VulkanUniformBuffer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (renderer.*.uniformBufferPoolCount >= renderer.*.uniformBufferPoolCapacity) {
        renderer.*.uniformBufferPoolCapacity *%= 2;
        renderer.*.uniformBufferPool = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(renderer.*.uniformBufferPool)), @as(c_ulong, renderer.*.uniformBufferPoolCapacity) *% @sizeOf([*c]VulkanUniformBuffer))));
    }
    renderer.*.uniformBufferPool[renderer.*.uniformBufferPoolCount] = uniformBuffer;
    renderer.*.uniformBufferPoolCount +%= 1;
    uniformBuffer.*.writeOffset = 0;
    uniformBuffer.*.drawOffset = 0;
}
pub fn VULKAN_INTERNAL_PushUniformData(commandBuffer: [*c]VulkanCommandBuffer, uniformBufferStage: VulkanUniformBufferStage, slotIndex: Uint32, data: ?*const anyopaque, length: Uint32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var blockSize: Uint32 = VULKAN_INTERNAL_NextHighestAlignment32(length, commandBuffer.*.renderer.*.minUBOAlignment);
    _ = &blockSize;
    var uniformBuffer: [*c]VulkanUniformBuffer = undefined;
    _ = &uniformBuffer;
    if (uniformBufferStage == @as(VulkanUniformBufferStage, VULKAN_UNIFORM_BUFFER_STAGE_VERTEX)) {
        if (@as(?*anyopaque, @ptrCast(@alignCast(commandBuffer.*.vertexUniformBuffers[slotIndex]))) == @as(?*anyopaque, null)) {
            commandBuffer.*.vertexUniformBuffers[slotIndex] = VULKAN_INTERNAL_AcquireUniformBufferFromPool(commandBuffer);
        }
        uniformBuffer = commandBuffer.*.vertexUniformBuffers[slotIndex];
    } else if (uniformBufferStage == @as(VulkanUniformBufferStage, VULKAN_UNIFORM_BUFFER_STAGE_FRAGMENT)) {
        if (@as(?*anyopaque, @ptrCast(@alignCast(commandBuffer.*.fragmentUniformBuffers[slotIndex]))) == @as(?*anyopaque, null)) {
            commandBuffer.*.fragmentUniformBuffers[slotIndex] = VULKAN_INTERNAL_AcquireUniformBufferFromPool(commandBuffer);
        }
        uniformBuffer = commandBuffer.*.fragmentUniformBuffers[slotIndex];
    } else if (uniformBufferStage == @as(VulkanUniformBufferStage, VULKAN_UNIFORM_BUFFER_STAGE_COMPUTE)) {
        if (@as(?*anyopaque, @ptrCast(@alignCast(commandBuffer.*.computeUniformBuffers[slotIndex]))) == @as(?*anyopaque, null)) {
            commandBuffer.*.computeUniformBuffers[slotIndex] = VULKAN_INTERNAL_AcquireUniformBufferFromPool(commandBuffer);
        }
        uniformBuffer = commandBuffer.*.computeUniformBuffers[slotIndex];
    } else {
        SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "Unrecognized shader stage!");
        return;
    }
    if (@as(VkDeviceSize, (uniformBuffer.*.writeOffset +% blockSize) +% @as(Uint32, MAX_UBO_SECTION_SIZE)) >= uniformBuffer.*.buffer.*.size) {
        uniformBuffer = VULKAN_INTERNAL_AcquireUniformBufferFromPool(commandBuffer);
        uniformBuffer.*.drawOffset = 0;
        uniformBuffer.*.writeOffset = 0;
        if (uniformBufferStage == @as(VulkanUniformBufferStage, VULKAN_UNIFORM_BUFFER_STAGE_VERTEX)) {
            commandBuffer.*.vertexUniformBuffers[slotIndex] = uniformBuffer;
            commandBuffer.*.needNewVertexUniformDescriptorSet = @"true" != 0;
        } else if (uniformBufferStage == @as(VulkanUniformBufferStage, VULKAN_UNIFORM_BUFFER_STAGE_FRAGMENT)) {
            commandBuffer.*.fragmentUniformBuffers[slotIndex] = uniformBuffer;
            commandBuffer.*.needNewFragmentUniformDescriptorSet = @"true" != 0;
        } else if (uniformBufferStage == @as(VulkanUniformBufferStage, VULKAN_UNIFORM_BUFFER_STAGE_COMPUTE)) {
            commandBuffer.*.computeUniformBuffers[slotIndex] = uniformBuffer;
            commandBuffer.*.needNewComputeUniformDescriptorSet = @"true" != 0;
        } else {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "Unrecognized shader stage!");
            return;
        }
    }
    uniformBuffer.*.drawOffset = uniformBuffer.*.writeOffset;
    var dst: [*c]Uint8 = (uniformBuffer.*.buffer.*.usedRegion.*.allocation.*.mapPointer + uniformBuffer.*.buffer.*.usedRegion.*.resourceOffset) + uniformBuffer.*.writeOffset;
    _ = &dst;
    _ = memcpy(@ptrCast(@alignCast(dst)), data, length);
    uniformBuffer.*.writeOffset +%= blockSize;
    if (uniformBufferStage == @as(VulkanUniformBufferStage, VULKAN_UNIFORM_BUFFER_STAGE_VERTEX)) {
        commandBuffer.*.needNewVertexUniformOffsets = @"true" != 0;
    } else if (uniformBufferStage == @as(VulkanUniformBufferStage, VULKAN_UNIFORM_BUFFER_STAGE_FRAGMENT)) {
        commandBuffer.*.needNewFragmentUniformOffsets = @"true" != 0;
    } else if (uniformBufferStage == @as(VulkanUniformBufferStage, VULKAN_UNIFORM_BUFFER_STAGE_COMPUTE)) {
        commandBuffer.*.needNewComputeUniformOffsets = @"true" != 0;
    } else {
        SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "Unrecognized shader stage!");
        return;
    }
}
pub fn VULKAN_BeginRenderPass(commandBuffer: ?*SDL_GPUCommandBuffer, colorTargetInfos: [*c]const SDL_GPUColorTargetInfo, numColorTargets: Uint32, depthStencilTargetInfo: [*c]const SDL_GPUDepthStencilTargetInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var vulkanCommandBuffer: [*c]VulkanCommandBuffer = @ptrCast(@alignCast(commandBuffer));
    _ = &vulkanCommandBuffer;
    var renderer: [*c]VulkanRenderer = vulkanCommandBuffer.*.renderer;
    _ = &renderer;
    var renderPass: VkRenderPass = undefined;
    _ = &renderPass;
    var framebuffer: [*c]VulkanFramebuffer = undefined;
    _ = &framebuffer;
    var w: Uint32 = undefined;
    _ = &w;
    var h: Uint32 = undefined;
    _ = &h;
    var clearValues: [*c]VkClearValue = undefined;
    _ = &clearValues;
    var clearCount: Uint32 = 0;
    _ = &clearCount;
    var totalColorAttachmentCount: Uint32 = 0;
    _ = &totalColorAttachmentCount;
    var i: Uint32 = undefined;
    _ = &i;
    var defaultViewport: SDL_GPUViewport = undefined;
    _ = &defaultViewport;
    var defaultScissor: SDL_Rect = undefined;
    _ = &defaultScissor;
    var defaultBlendConstants: SDL_FColor = undefined;
    _ = &defaultBlendConstants;
    var framebufferWidth: Uint32 = @as(c_uint, 4294967295);
    _ = &framebufferWidth;
    var framebufferHeight: Uint32 = @as(c_uint, 4294967295);
    _ = &framebufferHeight;
    {
        i = 0;
        while (i < numColorTargets) : (i +%= 1) {
            var textureContainer: [*c]VulkanTextureContainer = @ptrCast(@alignCast(colorTargetInfos[i].texture));
            _ = &textureContainer;
            w = textureContainer.*.header.info.width >> @intCast(colorTargetInfos[i].mip_level);
            h = textureContainer.*.header.info.height >> @intCast(colorTargetInfos[i].mip_level);
            if (w < framebufferWidth) {
                framebufferWidth = w;
            }
            if (h < framebufferHeight) {
                framebufferHeight = h;
            }
        }
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(depthStencilTargetInfo)))) != @as(?*anyopaque, null)) {
        var textureContainer: [*c]VulkanTextureContainer = @ptrCast(@alignCast(depthStencilTargetInfo.*.texture));
        _ = &textureContainer;
        w = textureContainer.*.header.info.width >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, depthStencilTargetInfo.*.mip_level)))));
        h = textureContainer.*.header.info.height >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, depthStencilTargetInfo.*.mip_level)))));
        if (w < framebufferWidth) {
            framebufferWidth = w;
        }
        if (h < framebufferHeight) {
            framebufferHeight = h;
        }
    }
    {
        i = 0;
        while (i < numColorTargets) : (i +%= 1) {
            var textureContainer: [*c]VulkanTextureContainer = @ptrCast(@alignCast(colorTargetInfos[i].texture));
            _ = &textureContainer;
            var subresource: [*c]VulkanTextureSubresource = VULKAN_INTERNAL_PrepareTextureSubresourceForWrite(renderer, vulkanCommandBuffer, textureContainer, if (textureContainer.*.header.info.type == @as(SDL_GPUTextureType, SDL_GPU_TEXTURETYPE_3D)) @as(Uint32, 0) else colorTargetInfos[i].layer_or_depth_plane, colorTargetInfos[i].mip_level, colorTargetInfos[i].cycle, VULKAN_TEXTURE_USAGE_MODE_COLOR_ATTACHMENT);
            _ = &subresource;
            vulkanCommandBuffer.*.colorAttachmentSubresources[vulkanCommandBuffer.*.colorAttachmentSubresourceCount] = subresource;
            vulkanCommandBuffer.*.colorAttachmentSubresourceCount +%= 1;
            VULKAN_INTERNAL_TrackTexture(vulkanCommandBuffer, subresource.*.parent);
            totalColorAttachmentCount +%= 1;
            clearCount +%= 1;
            if ((colorTargetInfos[i].store_op == @as(SDL_GPUStoreOp, SDL_GPU_STOREOP_RESOLVE)) or (colorTargetInfos[i].store_op == @as(SDL_GPUStoreOp, SDL_GPU_STOREOP_RESOLVE_AND_STORE))) {
                var resolveContainer: [*c]VulkanTextureContainer = @ptrCast(@alignCast(colorTargetInfos[i].resolve_texture));
                _ = &resolveContainer;
                var resolveSubresource: [*c]VulkanTextureSubresource = VULKAN_INTERNAL_PrepareTextureSubresourceForWrite(renderer, vulkanCommandBuffer, resolveContainer, colorTargetInfos[i].resolve_layer, colorTargetInfos[i].resolve_mip_level, colorTargetInfos[i].cycle_resolve_texture, VULKAN_TEXTURE_USAGE_MODE_COLOR_ATTACHMENT);
                _ = &resolveSubresource;
                vulkanCommandBuffer.*.resolveAttachmentSubresources[vulkanCommandBuffer.*.resolveAttachmentSubresourceCount] = resolveSubresource;
                vulkanCommandBuffer.*.resolveAttachmentSubresourceCount +%= 1;
                VULKAN_INTERNAL_TrackTexture(vulkanCommandBuffer, resolveSubresource.*.parent);
                totalColorAttachmentCount +%= 1;
                clearCount +%= 1;
            }
        }
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(depthStencilTargetInfo)))) != @as(?*anyopaque, null)) {
        var textureContainer: [*c]VulkanTextureContainer = @ptrCast(@alignCast(depthStencilTargetInfo.*.texture));
        _ = &textureContainer;
        var subresource: [*c]VulkanTextureSubresource = VULKAN_INTERNAL_PrepareTextureSubresourceForWrite(renderer, vulkanCommandBuffer, textureContainer, depthStencilTargetInfo.*.layer, depthStencilTargetInfo.*.mip_level, depthStencilTargetInfo.*.cycle, VULKAN_TEXTURE_USAGE_MODE_DEPTH_STENCIL_ATTACHMENT);
        _ = &subresource;
        vulkanCommandBuffer.*.depthStencilAttachmentSubresource = subresource;
        VULKAN_INTERNAL_TrackTexture(vulkanCommandBuffer, subresource.*.parent);
        clearCount +%= 1;
    }
    renderPass = VULKAN_INTERNAL_FetchRenderPass(renderer, colorTargetInfos, numColorTargets, depthStencilTargetInfo);
    if (@as(?*anyopaque, @ptrCast(@alignCast(renderPass))) == @as(?*anyopaque, null)) {
        return;
    }
    framebuffer = VULKAN_INTERNAL_FetchFramebuffer(renderer, renderPass, colorTargetInfos, numColorTargets, depthStencilTargetInfo, framebufferWidth, framebufferHeight);
    if (@as(?*anyopaque, @ptrCast(@alignCast(framebuffer))) == @as(?*anyopaque, null)) {
        return;
    }
    VULKAN_INTERNAL_TrackFramebuffer(vulkanCommandBuffer, framebuffer);
    clearValues = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(VkClearValue) *% @as(c_ulong, clearCount))));
    var clearIndex: c_int = 0;
    _ = &clearIndex;
    {
        i = 0;
        while (i < numColorTargets) : (i +%= 1) {
            clearValues[@bitCast(@as(isize, @intCast(clearIndex)))].color.float32[@as(c_int, 0)] = colorTargetInfos[i].clear_color.r;
            clearValues[@bitCast(@as(isize, @intCast(clearIndex)))].color.float32[@as(c_int, 1)] = colorTargetInfos[i].clear_color.g;
            clearValues[@bitCast(@as(isize, @intCast(clearIndex)))].color.float32[@as(c_int, 2)] = colorTargetInfos[i].clear_color.b;
            clearValues[@bitCast(@as(isize, @intCast(clearIndex)))].color.float32[@as(c_int, 3)] = colorTargetInfos[i].clear_color.a;
            clearIndex += 1;
            if ((colorTargetInfos[i].store_op == @as(SDL_GPUStoreOp, SDL_GPU_STOREOP_RESOLVE)) or (colorTargetInfos[i].store_op == @as(SDL_GPUStoreOp, SDL_GPU_STOREOP_RESOLVE_AND_STORE))) {
                clearIndex += 1;
            }
        }
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(depthStencilTargetInfo)))) != @as(?*anyopaque, null)) {
        clearValues[totalColorAttachmentCount].depthStencil.depth = depthStencilTargetInfo.*.clear_depth;
        clearValues[totalColorAttachmentCount].depthStencil.stencil = depthStencilTargetInfo.*.clear_stencil;
    }
    var renderPassBeginInfo: VkRenderPassBeginInfo = undefined;
    _ = &renderPassBeginInfo;
    renderPassBeginInfo.sType = VK_STRUCTURE_TYPE_RENDER_PASS_BEGIN_INFO;
    renderPassBeginInfo.pNext = null;
    renderPassBeginInfo.renderPass = renderPass;
    renderPassBeginInfo.framebuffer = framebuffer.*.framebuffer;
    renderPassBeginInfo.pClearValues = clearValues;
    renderPassBeginInfo.clearValueCount = clearCount;
    renderPassBeginInfo.renderArea.extent.width = framebufferWidth;
    renderPassBeginInfo.renderArea.extent.height = framebufferHeight;
    renderPassBeginInfo.renderArea.offset.x = 0;
    renderPassBeginInfo.renderArea.offset.y = 0;
    renderer.*.vkCmdBeginRenderPass.?(vulkanCommandBuffer.*.commandBuffer, &renderPassBeginInfo, VK_SUBPASS_CONTENTS_INLINE);
    SDL_free_REAL(@ptrCast(@alignCast(clearValues)));
    defaultViewport.x = @floatFromInt(@as(c_int, 0));
    defaultViewport.y = @floatFromInt(@as(c_int, 0));
    defaultViewport.w = @floatFromInt(framebufferWidth);
    defaultViewport.h = @floatFromInt(framebufferHeight);
    defaultViewport.min_depth = @floatFromInt(@as(c_int, 0));
    defaultViewport.max_depth = @floatFromInt(@as(c_int, 1));
    VULKAN_INTERNAL_SetCurrentViewport(vulkanCommandBuffer, &defaultViewport);
    defaultScissor.x = 0;
    defaultScissor.y = 0;
    defaultScissor.w = @bitCast(@as(c_uint, @truncate(framebufferWidth)));
    defaultScissor.h = @bitCast(@as(c_uint, @truncate(framebufferHeight)));
    VULKAN_INTERNAL_SetCurrentScissor(vulkanCommandBuffer, &defaultScissor);
    defaultBlendConstants.r = 1.0;
    defaultBlendConstants.g = 1.0;
    defaultBlendConstants.b = 1.0;
    defaultBlendConstants.a = 1.0;
    VULKAN_INTERNAL_SetCurrentBlendConstants(vulkanCommandBuffer, defaultBlendConstants);
    VULKAN_INTERNAL_SetCurrentStencilReference(vulkanCommandBuffer, 0);
}
pub fn VULKAN_BindGraphicsPipeline(commandBuffer: ?*SDL_GPUCommandBuffer, graphicsPipeline: ?*SDL_GPUGraphicsPipeline) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var vulkanCommandBuffer: [*c]VulkanCommandBuffer = @ptrCast(@alignCast(commandBuffer));
    _ = &vulkanCommandBuffer;
    var renderer: [*c]VulkanRenderer = vulkanCommandBuffer.*.renderer;
    _ = &renderer;
    var pipeline: [*c]VulkanGraphicsPipeline = @ptrCast(@alignCast(graphicsPipeline));
    _ = &pipeline;
    renderer.*.vkCmdBindPipeline.?(vulkanCommandBuffer.*.commandBuffer, VK_PIPELINE_BIND_POINT_GRAPHICS, pipeline.*.pipeline);
    vulkanCommandBuffer.*.currentGraphicsPipeline = pipeline;
    VULKAN_INTERNAL_TrackGraphicsPipeline(vulkanCommandBuffer, pipeline);
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < pipeline.*.resourceLayout.*.vertexUniformBufferCount) : (i +%= 1) {
            if (@as(?*anyopaque, @ptrCast(@alignCast(vulkanCommandBuffer.*.vertexUniformBuffers[i]))) == @as(?*anyopaque, null)) {
                vulkanCommandBuffer.*.vertexUniformBuffers[i] = VULKAN_INTERNAL_AcquireUniformBufferFromPool(vulkanCommandBuffer);
            }
        }
    }
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < pipeline.*.resourceLayout.*.fragmentUniformBufferCount) : (i +%= 1) {
            if (@as(?*anyopaque, @ptrCast(@alignCast(vulkanCommandBuffer.*.fragmentUniformBuffers[i]))) == @as(?*anyopaque, null)) {
                vulkanCommandBuffer.*.fragmentUniformBuffers[i] = VULKAN_INTERNAL_AcquireUniformBufferFromPool(vulkanCommandBuffer);
            }
        }
    }
    vulkanCommandBuffer.*.needNewVertexResourceDescriptorSet = @"true" != 0;
    vulkanCommandBuffer.*.needNewFragmentResourceDescriptorSet = @"true" != 0;
    vulkanCommandBuffer.*.needNewVertexUniformDescriptorSet = @"true" != 0;
    vulkanCommandBuffer.*.needNewFragmentUniformDescriptorSet = @"true" != 0;
    vulkanCommandBuffer.*.needNewVertexUniformOffsets = @"true" != 0;
    vulkanCommandBuffer.*.needNewFragmentUniformOffsets = @"true" != 0;
}
pub fn VULKAN_BindVertexBuffers(commandBuffer: ?*SDL_GPUCommandBuffer, firstSlot: Uint32, bindings: [*c]const SDL_GPUBufferBinding, numBindings: Uint32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var vulkanCommandBuffer: [*c]VulkanCommandBuffer = @ptrCast(@alignCast(commandBuffer));
    _ = &vulkanCommandBuffer;
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < numBindings) : (i +%= 1) {
            var buffer: [*c]VulkanBuffer = @as([*c]VulkanBufferContainer, @ptrCast(@alignCast(bindings[i].buffer))).*.activeBuffer;
            _ = &buffer;
            if ((vulkanCommandBuffer.*.vertexBuffers[firstSlot +% i] != buffer.*.buffer) or (vulkanCommandBuffer.*.vertexBufferOffsets[firstSlot +% i] != @as(VkDeviceSize, bindings[i].offset))) {
                VULKAN_INTERNAL_TrackBuffer(vulkanCommandBuffer, buffer);
                vulkanCommandBuffer.*.vertexBuffers[firstSlot +% i] = buffer.*.buffer;
                vulkanCommandBuffer.*.vertexBufferOffsets[firstSlot +% i] = bindings[i].offset;
                vulkanCommandBuffer.*.needVertexBufferBind = @"true" != 0;
            }
        }
    }
    vulkanCommandBuffer.*.vertexBufferCount = if (vulkanCommandBuffer.*.vertexBufferCount > (firstSlot +% numBindings)) vulkanCommandBuffer.*.vertexBufferCount else firstSlot +% numBindings;
}
pub fn VULKAN_BindIndexBuffer(commandBuffer: ?*SDL_GPUCommandBuffer, binding: [*c]const SDL_GPUBufferBinding, indexElementSize: SDL_GPUIndexElementSize) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var vulkanCommandBuffer: [*c]VulkanCommandBuffer = @ptrCast(@alignCast(commandBuffer));
    _ = &vulkanCommandBuffer;
    var renderer: [*c]VulkanRenderer = vulkanCommandBuffer.*.renderer;
    _ = &renderer;
    var vulkanBuffer: [*c]VulkanBuffer = @as([*c]VulkanBufferContainer, @ptrCast(@alignCast(binding.*.buffer))).*.activeBuffer;
    _ = &vulkanBuffer;
    VULKAN_INTERNAL_TrackBuffer(vulkanCommandBuffer, vulkanBuffer);
    renderer.*.vkCmdBindIndexBuffer.?(vulkanCommandBuffer.*.commandBuffer, vulkanBuffer.*.buffer, binding.*.offset, SDLToVK_IndexType[indexElementSize]);
}
pub fn VULKAN_PushVertexUniformData(commandBuffer: ?*SDL_GPUCommandBuffer, slotIndex: Uint32, data: ?*const anyopaque, length: Uint32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var vulkanCommandBuffer: [*c]VulkanCommandBuffer = @ptrCast(@alignCast(commandBuffer));
    _ = &vulkanCommandBuffer;
    VULKAN_INTERNAL_PushUniformData(vulkanCommandBuffer, VULKAN_UNIFORM_BUFFER_STAGE_VERTEX, slotIndex, data, length);
}
pub fn VULKAN_PushFragmentUniformData(commandBuffer: ?*SDL_GPUCommandBuffer, slotIndex: Uint32, data: ?*const anyopaque, length: Uint32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var vulkanCommandBuffer: [*c]VulkanCommandBuffer = @ptrCast(@alignCast(commandBuffer));
    _ = &vulkanCommandBuffer;
    VULKAN_INTERNAL_PushUniformData(vulkanCommandBuffer, VULKAN_UNIFORM_BUFFER_STAGE_FRAGMENT, slotIndex, data, length);
}
pub fn VULKAN_EndRenderPass(commandBuffer: ?*SDL_GPUCommandBuffer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var vulkanCommandBuffer: [*c]VulkanCommandBuffer = @ptrCast(@alignCast(commandBuffer));
    _ = &vulkanCommandBuffer;
    var renderer: [*c]VulkanRenderer = vulkanCommandBuffer.*.renderer;
    _ = &renderer;
    var i: Uint32 = undefined;
    _ = &i;
    renderer.*.vkCmdEndRenderPass.?(vulkanCommandBuffer.*.commandBuffer);
    {
        i = 0;
        while (i < vulkanCommandBuffer.*.colorAttachmentSubresourceCount) : (i +%= 1) {
            VULKAN_INTERNAL_TextureSubresourceTransitionToDefaultUsage(renderer, vulkanCommandBuffer, VULKAN_TEXTURE_USAGE_MODE_COLOR_ATTACHMENT, vulkanCommandBuffer.*.colorAttachmentSubresources[i]);
        }
    }
    vulkanCommandBuffer.*.colorAttachmentSubresourceCount = 0;
    {
        i = 0;
        while (i < vulkanCommandBuffer.*.resolveAttachmentSubresourceCount) : (i +%= 1) {
            VULKAN_INTERNAL_TextureSubresourceTransitionToDefaultUsage(renderer, vulkanCommandBuffer, VULKAN_TEXTURE_USAGE_MODE_COLOR_ATTACHMENT, vulkanCommandBuffer.*.resolveAttachmentSubresources[i]);
        }
    }
    vulkanCommandBuffer.*.resolveAttachmentSubresourceCount = 0;
    if (@as(?*anyopaque, @ptrCast(@alignCast(vulkanCommandBuffer.*.depthStencilAttachmentSubresource))) != @as(?*anyopaque, null)) {
        VULKAN_INTERNAL_TextureSubresourceTransitionToDefaultUsage(renderer, vulkanCommandBuffer, VULKAN_TEXTURE_USAGE_MODE_DEPTH_STENCIL_ATTACHMENT, vulkanCommandBuffer.*.depthStencilAttachmentSubresource);
        vulkanCommandBuffer.*.depthStencilAttachmentSubresource = null;
    }
    vulkanCommandBuffer.*.currentGraphicsPipeline = null;
    vulkanCommandBuffer.*.vertexResourceDescriptorSet = null;
    vulkanCommandBuffer.*.vertexUniformDescriptorSet = null;
    vulkanCommandBuffer.*.fragmentResourceDescriptorSet = null;
    vulkanCommandBuffer.*.fragmentUniformDescriptorSet = null;
    _ = memset(@ptrCast(@alignCast(@as([*c][*c]VulkanTextureSubresource, @ptrCast(@alignCast(&vulkanCommandBuffer.*.colorAttachmentSubresources))))), 0, @sizeOf(@TypeOf(vulkanCommandBuffer.*.colorAttachmentSubresources)));
    _ = memset(@ptrCast(@alignCast(@as([*c][*c]VulkanTextureSubresource, @ptrCast(@alignCast(&vulkanCommandBuffer.*.resolveAttachmentSubresources))))), 0, @sizeOf(@TypeOf(vulkanCommandBuffer.*.resolveAttachmentSubresources)));
    vulkanCommandBuffer.*.depthStencilAttachmentSubresource = null;
    _ = memset(@ptrCast(@alignCast(@as([*c]VkBuffer, @ptrCast(@alignCast(&vulkanCommandBuffer.*.vertexBuffers))))), 0, @sizeOf(@TypeOf(vulkanCommandBuffer.*.vertexBuffers)));
    _ = memset(@ptrCast(@alignCast(@as([*c]VkDeviceSize, @ptrCast(@alignCast(&vulkanCommandBuffer.*.vertexBufferOffsets))))), 0, @sizeOf(@TypeOf(vulkanCommandBuffer.*.vertexBufferOffsets)));
    vulkanCommandBuffer.*.vertexBufferCount = 0;
    _ = memset(@ptrCast(@alignCast(@as([*c]VkSampler, @ptrCast(@alignCast(&vulkanCommandBuffer.*.vertexSamplerBindings))))), 0, @sizeOf(@TypeOf(vulkanCommandBuffer.*.vertexSamplerBindings)));
    _ = memset(@ptrCast(@alignCast(@as([*c]VkImageView, @ptrCast(@alignCast(&vulkanCommandBuffer.*.vertexSamplerTextureViewBindings))))), 0, @sizeOf(@TypeOf(vulkanCommandBuffer.*.vertexSamplerTextureViewBindings)));
    _ = memset(@ptrCast(@alignCast(@as([*c]VkImageView, @ptrCast(@alignCast(&vulkanCommandBuffer.*.vertexStorageTextureViewBindings))))), 0, @sizeOf(@TypeOf(vulkanCommandBuffer.*.vertexStorageTextureViewBindings)));
    _ = memset(@ptrCast(@alignCast(@as([*c]VkBuffer, @ptrCast(@alignCast(&vulkanCommandBuffer.*.vertexStorageBufferBindings))))), 0, @sizeOf(@TypeOf(vulkanCommandBuffer.*.vertexStorageBufferBindings)));
    _ = memset(@ptrCast(@alignCast(@as([*c]VkSampler, @ptrCast(@alignCast(&vulkanCommandBuffer.*.fragmentSamplerBindings))))), 0, @sizeOf(@TypeOf(vulkanCommandBuffer.*.fragmentSamplerBindings)));
    _ = memset(@ptrCast(@alignCast(@as([*c]VkImageView, @ptrCast(@alignCast(&vulkanCommandBuffer.*.fragmentSamplerTextureViewBindings))))), 0, @sizeOf(@TypeOf(vulkanCommandBuffer.*.fragmentSamplerTextureViewBindings)));
    _ = memset(@ptrCast(@alignCast(@as([*c]VkImageView, @ptrCast(@alignCast(&vulkanCommandBuffer.*.fragmentStorageTextureViewBindings))))), 0, @sizeOf(@TypeOf(vulkanCommandBuffer.*.fragmentStorageTextureViewBindings)));
    _ = memset(@ptrCast(@alignCast(@as([*c]VkBuffer, @ptrCast(@alignCast(&vulkanCommandBuffer.*.fragmentStorageBufferBindings))))), 0, @sizeOf(@TypeOf(vulkanCommandBuffer.*.fragmentStorageBufferBindings)));
}
pub fn VULKAN_BeginComputePass(commandBuffer: ?*SDL_GPUCommandBuffer, storageTextureBindings: [*c]const SDL_GPUStorageTextureReadWriteBinding, numStorageTextureBindings: Uint32, storageBufferBindings: [*c]const SDL_GPUStorageBufferReadWriteBinding, numStorageBufferBindings: Uint32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var vulkanCommandBuffer: [*c]VulkanCommandBuffer = @ptrCast(@alignCast(commandBuffer));
    _ = &vulkanCommandBuffer;
    var renderer: [*c]VulkanRenderer = vulkanCommandBuffer.*.renderer;
    _ = &renderer;
    var bufferContainer: [*c]VulkanBufferContainer = undefined;
    _ = &bufferContainer;
    var buffer: [*c]VulkanBuffer = undefined;
    _ = &buffer;
    var i: Uint32 = undefined;
    _ = &i;
    vulkanCommandBuffer.*.readWriteComputeStorageTextureSubresourceCount = numStorageTextureBindings;
    {
        i = 0;
        while (i < numStorageTextureBindings) : (i +%= 1) {
            var textureContainer: [*c]VulkanTextureContainer = @ptrCast(@alignCast(storageTextureBindings[i].texture));
            _ = &textureContainer;
            var subresource: [*c]VulkanTextureSubresource = VULKAN_INTERNAL_PrepareTextureSubresourceForWrite(renderer, vulkanCommandBuffer, textureContainer, storageTextureBindings[i].layer, storageTextureBindings[i].mip_level, storageTextureBindings[i].cycle, VULKAN_TEXTURE_USAGE_MODE_COMPUTE_STORAGE_READ_WRITE);
            _ = &subresource;
            vulkanCommandBuffer.*.readWriteComputeStorageTextureSubresources[i] = subresource;
            vulkanCommandBuffer.*.readWriteComputeStorageTextureViewBindings[i] = subresource.*.computeWriteView;
            VULKAN_INTERNAL_TrackTexture(vulkanCommandBuffer, subresource.*.parent);
        }
    }
    {
        i = 0;
        while (i < numStorageBufferBindings) : (i +%= 1) {
            bufferContainer = @ptrCast(@alignCast(storageBufferBindings[i].buffer));
            buffer = VULKAN_INTERNAL_PrepareBufferForWrite(renderer, vulkanCommandBuffer, bufferContainer, storageBufferBindings[i].cycle, @as(c_uint, 1) << @intCast(@as(c_uint, 7)));
            vulkanCommandBuffer.*.readWriteComputeStorageBuffers[i] = buffer;
            vulkanCommandBuffer.*.readWriteComputeStorageBufferBindings[i] = buffer.*.buffer;
            VULKAN_INTERNAL_TrackBuffer(vulkanCommandBuffer, buffer);
        }
    }
}
pub fn VULKAN_BindComputePipeline(commandBuffer: ?*SDL_GPUCommandBuffer, computePipeline: ?*SDL_GPUComputePipeline) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var vulkanCommandBuffer: [*c]VulkanCommandBuffer = @ptrCast(@alignCast(commandBuffer));
    _ = &vulkanCommandBuffer;
    var renderer: [*c]VulkanRenderer = vulkanCommandBuffer.*.renderer;
    _ = &renderer;
    var vulkanComputePipeline: [*c]VulkanComputePipeline = @ptrCast(@alignCast(computePipeline));
    _ = &vulkanComputePipeline;
    renderer.*.vkCmdBindPipeline.?(vulkanCommandBuffer.*.commandBuffer, VK_PIPELINE_BIND_POINT_COMPUTE, vulkanComputePipeline.*.pipeline);
    vulkanCommandBuffer.*.currentComputePipeline = vulkanComputePipeline;
    VULKAN_INTERNAL_TrackComputePipeline(vulkanCommandBuffer, vulkanComputePipeline);
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < vulkanComputePipeline.*.resourceLayout.*.numUniformBuffers) : (i +%= 1) {
            if (@as(?*anyopaque, @ptrCast(@alignCast(vulkanCommandBuffer.*.computeUniformBuffers[i]))) == @as(?*anyopaque, null)) {
                vulkanCommandBuffer.*.computeUniformBuffers[i] = VULKAN_INTERNAL_AcquireUniformBufferFromPool(vulkanCommandBuffer);
            }
        }
    }
    vulkanCommandBuffer.*.needNewComputeReadWriteDescriptorSet = @"true" != 0;
    vulkanCommandBuffer.*.needNewComputeReadOnlyDescriptorSet = @"true" != 0;
    vulkanCommandBuffer.*.needNewComputeUniformDescriptorSet = @"true" != 0;
    vulkanCommandBuffer.*.needNewComputeUniformOffsets = @"true" != 0;
}
pub fn VULKAN_BindComputeSamplers(commandBuffer: ?*SDL_GPUCommandBuffer, firstSlot: Uint32, textureSamplerBindings: [*c]const SDL_GPUTextureSamplerBinding, numBindings: Uint32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var vulkanCommandBuffer: [*c]VulkanCommandBuffer = @ptrCast(@alignCast(commandBuffer));
    _ = &vulkanCommandBuffer;
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < numBindings) : (i +%= 1) {
            var textureContainer: [*c]VulkanTextureContainer = @ptrCast(@alignCast(textureSamplerBindings[i].texture));
            _ = &textureContainer;
            var sampler: [*c]VulkanSampler = @ptrCast(@alignCast(textureSamplerBindings[i].sampler));
            _ = &sampler;
            if (vulkanCommandBuffer.*.computeSamplerBindings[firstSlot +% i] != sampler.*.sampler) {
                VULKAN_INTERNAL_TrackSampler(vulkanCommandBuffer, sampler);
                vulkanCommandBuffer.*.computeSamplerBindings[firstSlot +% i] = sampler.*.sampler;
                vulkanCommandBuffer.*.needNewComputeReadOnlyDescriptorSet = @"true" != 0;
            }
            if (vulkanCommandBuffer.*.computeSamplerTextureViewBindings[firstSlot +% i] != textureContainer.*.activeTexture.*.fullView) {
                VULKAN_INTERNAL_TrackTexture(vulkanCommandBuffer, textureContainer.*.activeTexture);
                vulkanCommandBuffer.*.computeSamplerTextureViewBindings[firstSlot +% i] = textureContainer.*.activeTexture.*.fullView;
                vulkanCommandBuffer.*.needNewComputeReadOnlyDescriptorSet = @"true" != 0;
            }
        }
    }
}
pub fn VULKAN_BindComputeStorageTextures(commandBuffer: ?*SDL_GPUCommandBuffer, firstSlot: Uint32, storageTextures: [*c]const ?*SDL_GPUTexture, numBindings: Uint32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var vulkanCommandBuffer: [*c]VulkanCommandBuffer = @ptrCast(@alignCast(commandBuffer));
    _ = &vulkanCommandBuffer;
    var renderer: [*c]VulkanRenderer = vulkanCommandBuffer.*.renderer;
    _ = &renderer;
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < numBindings) : (i +%= 1) {
            var textureContainer: [*c]VulkanTextureContainer = @ptrCast(@alignCast(storageTextures[i]));
            _ = &textureContainer;
            if (vulkanCommandBuffer.*.readOnlyComputeStorageTextures[firstSlot +% i] != textureContainer.*.activeTexture) {
                if (@as(?*anyopaque, @ptrCast(@alignCast(vulkanCommandBuffer.*.readOnlyComputeStorageTextures[firstSlot +% i]))) != @as(?*anyopaque, null)) {
                    VULKAN_INTERNAL_TextureTransitionToDefaultUsage(renderer, vulkanCommandBuffer, VULKAN_TEXTURE_USAGE_MODE_COMPUTE_STORAGE_READ, vulkanCommandBuffer.*.readOnlyComputeStorageTextures[firstSlot +% i]);
                }
                VULKAN_INTERNAL_TextureTransitionFromDefaultUsage(renderer, vulkanCommandBuffer, VULKAN_TEXTURE_USAGE_MODE_COMPUTE_STORAGE_READ, textureContainer.*.activeTexture);
                VULKAN_INTERNAL_TrackTexture(vulkanCommandBuffer, textureContainer.*.activeTexture);
                vulkanCommandBuffer.*.readOnlyComputeStorageTextures[firstSlot +% i] = textureContainer.*.activeTexture;
                vulkanCommandBuffer.*.readOnlyComputeStorageTextureViewBindings[firstSlot +% i] = textureContainer.*.activeTexture.*.fullView;
                vulkanCommandBuffer.*.needNewComputeReadOnlyDescriptorSet = @"true" != 0;
            }
        }
    }
}
pub fn VULKAN_BindComputeStorageBuffers(commandBuffer: ?*SDL_GPUCommandBuffer, firstSlot: Uint32, storageBuffers: [*c]const ?*SDL_GPUBuffer, numBindings: Uint32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var vulkanCommandBuffer: [*c]VulkanCommandBuffer = @ptrCast(@alignCast(commandBuffer));
    _ = &vulkanCommandBuffer;
    var renderer: [*c]VulkanRenderer = vulkanCommandBuffer.*.renderer;
    _ = &renderer;
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < numBindings) : (i +%= 1) {
            var bufferContainer: [*c]VulkanBufferContainer = @ptrCast(@alignCast(storageBuffers[i]));
            _ = &bufferContainer;
            if (vulkanCommandBuffer.*.readOnlyComputeStorageBuffers[firstSlot +% i] != bufferContainer.*.activeBuffer) {
                if (@as(?*anyopaque, @ptrCast(@alignCast(vulkanCommandBuffer.*.readOnlyComputeStorageBuffers[firstSlot +% i]))) != @as(?*anyopaque, null)) {
                    VULKAN_INTERNAL_BufferTransitionToDefaultUsage(renderer, vulkanCommandBuffer, @as(c_uint, 1) << @intCast(@as(c_uint, 6)), vulkanCommandBuffer.*.readOnlyComputeStorageBuffers[firstSlot +% i]);
                }
                VULKAN_INTERNAL_BufferTransitionFromDefaultUsage(renderer, vulkanCommandBuffer, @as(c_uint, 1) << @intCast(@as(c_uint, 6)), bufferContainer.*.activeBuffer);
                VULKAN_INTERNAL_TrackBuffer(vulkanCommandBuffer, bufferContainer.*.activeBuffer);
                vulkanCommandBuffer.*.readOnlyComputeStorageBuffers[firstSlot +% i] = bufferContainer.*.activeBuffer;
                vulkanCommandBuffer.*.readOnlyComputeStorageBufferBindings[firstSlot +% i] = bufferContainer.*.activeBuffer.*.buffer;
                vulkanCommandBuffer.*.needNewComputeReadOnlyDescriptorSet = @"true" != 0;
            }
        }
    }
}
pub fn VULKAN_PushComputeUniformData(commandBuffer: ?*SDL_GPUCommandBuffer, slotIndex: Uint32, data: ?*const anyopaque, length: Uint32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var vulkanCommandBuffer: [*c]VulkanCommandBuffer = @ptrCast(@alignCast(commandBuffer));
    _ = &vulkanCommandBuffer;
    VULKAN_INTERNAL_PushUniformData(vulkanCommandBuffer, VULKAN_UNIFORM_BUFFER_STAGE_COMPUTE, slotIndex, data, length);
}
pub fn VULKAN_INTERNAL_BindComputeDescriptorSets(renderer: [*c]VulkanRenderer, commandBuffer: [*c]VulkanCommandBuffer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var resourceLayout: [*c]VulkanComputePipelineResourceLayout = undefined;
    _ = &resourceLayout;
    var descriptorSetLayout: [*c]DescriptorSetLayout = undefined;
    _ = &descriptorSetLayout;
    var writeDescriptorSets: [52]VkWriteDescriptorSet = undefined;
    _ = &writeDescriptorSets;
    var bufferInfos: [20]VkDescriptorBufferInfo = undefined;
    _ = &bufferInfos;
    var imageInfos: [32]VkDescriptorImageInfo = undefined;
    _ = &imageInfos;
    var dynamicOffsets: [4]Uint32 = undefined;
    _ = &dynamicOffsets;
    var writeCount: Uint32 = 0;
    _ = &writeCount;
    var bufferInfoCount: Uint32 = 0;
    _ = &bufferInfoCount;
    var imageInfoCount: Uint32 = 0;
    _ = &imageInfoCount;
    var dynamicOffsetCount: Uint32 = 0;
    _ = &dynamicOffsetCount;
    if (((!commandBuffer.*.needNewComputeReadOnlyDescriptorSet and !commandBuffer.*.needNewComputeReadWriteDescriptorSet) and !commandBuffer.*.needNewComputeUniformDescriptorSet) and !commandBuffer.*.needNewComputeUniformOffsets) {
        return;
    }
    resourceLayout = commandBuffer.*.currentComputePipeline.*.resourceLayout;
    if (commandBuffer.*.needNewComputeReadOnlyDescriptorSet) {
        descriptorSetLayout = resourceLayout.*.descriptorSetLayouts[@as(c_int, 0)];
        commandBuffer.*.computeReadOnlyDescriptorSet = VULKAN_INTERNAL_FetchDescriptorSet(renderer, commandBuffer, descriptorSetLayout);
        {
            var i: Uint32 = 0;
            _ = &i;
            while (i < resourceLayout.*.numSamplers) : (i +%= 1) {
                var currentWriteDescriptorSet: [*c]VkWriteDescriptorSet = &writeDescriptorSets[writeCount];
                _ = &currentWriteDescriptorSet;
                currentWriteDescriptorSet.*.sType = VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET;
                currentWriteDescriptorSet.*.pNext = null;
                currentWriteDescriptorSet.*.descriptorCount = 1;
                currentWriteDescriptorSet.*.descriptorType = VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER;
                currentWriteDescriptorSet.*.dstArrayElement = 0;
                currentWriteDescriptorSet.*.dstBinding = i;
                currentWriteDescriptorSet.*.dstSet = commandBuffer.*.computeReadOnlyDescriptorSet;
                currentWriteDescriptorSet.*.pTexelBufferView = null;
                currentWriteDescriptorSet.*.pBufferInfo = null;
                imageInfos[imageInfoCount].sampler = commandBuffer.*.computeSamplerBindings[i];
                imageInfos[imageInfoCount].imageView = commandBuffer.*.computeSamplerTextureViewBindings[i];
                imageInfos[imageInfoCount].imageLayout = VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL;
                currentWriteDescriptorSet.*.pImageInfo = &imageInfos[imageInfoCount];
                writeCount +%= 1;
                imageInfoCount +%= 1;
            }
        }
        {
            var i: Uint32 = 0;
            _ = &i;
            while (i < resourceLayout.*.numReadonlyStorageTextures) : (i +%= 1) {
                var currentWriteDescriptorSet: [*c]VkWriteDescriptorSet = &writeDescriptorSets[writeCount];
                _ = &currentWriteDescriptorSet;
                currentWriteDescriptorSet.*.sType = VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET;
                currentWriteDescriptorSet.*.pNext = null;
                currentWriteDescriptorSet.*.descriptorCount = 1;
                currentWriteDescriptorSet.*.descriptorType = VK_DESCRIPTOR_TYPE_SAMPLED_IMAGE;
                currentWriteDescriptorSet.*.dstArrayElement = 0;
                currentWriteDescriptorSet.*.dstBinding = resourceLayout.*.numSamplers +% i;
                currentWriteDescriptorSet.*.dstSet = commandBuffer.*.computeReadOnlyDescriptorSet;
                currentWriteDescriptorSet.*.pTexelBufferView = null;
                currentWriteDescriptorSet.*.pBufferInfo = null;
                imageInfos[imageInfoCount].sampler = null;
                imageInfos[imageInfoCount].imageView = commandBuffer.*.readOnlyComputeStorageTextureViewBindings[i];
                imageInfos[imageInfoCount].imageLayout = VK_IMAGE_LAYOUT_GENERAL;
                currentWriteDescriptorSet.*.pImageInfo = &imageInfos[imageInfoCount];
                writeCount +%= 1;
                imageInfoCount +%= 1;
            }
        }
        {
            var i: Uint32 = 0;
            _ = &i;
            while (i < resourceLayout.*.numReadonlyStorageBuffers) : (i +%= 1) {
                var currentWriteDescriptorSet: [*c]VkWriteDescriptorSet = &writeDescriptorSets[writeCount];
                _ = &currentWriteDescriptorSet;
                currentWriteDescriptorSet.*.sType = VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET;
                currentWriteDescriptorSet.*.pNext = null;
                currentWriteDescriptorSet.*.descriptorCount = 1;
                currentWriteDescriptorSet.*.descriptorType = VK_DESCRIPTOR_TYPE_STORAGE_BUFFER;
                currentWriteDescriptorSet.*.dstArrayElement = 0;
                currentWriteDescriptorSet.*.dstBinding = (resourceLayout.*.numSamplers +% resourceLayout.*.numReadonlyStorageTextures) +% i;
                currentWriteDescriptorSet.*.dstSet = commandBuffer.*.computeReadOnlyDescriptorSet;
                currentWriteDescriptorSet.*.pTexelBufferView = null;
                currentWriteDescriptorSet.*.pImageInfo = null;
                bufferInfos[bufferInfoCount].buffer = commandBuffer.*.readOnlyComputeStorageBufferBindings[i];
                bufferInfos[bufferInfoCount].offset = 0;
                bufferInfos[bufferInfoCount].range = @truncate(~@as(c_ulonglong, 0));
                currentWriteDescriptorSet.*.pBufferInfo = &bufferInfos[bufferInfoCount];
                writeCount +%= 1;
                bufferInfoCount +%= 1;
            }
        }
        commandBuffer.*.needNewComputeReadOnlyDescriptorSet = @"false" != 0;
    }
    if (commandBuffer.*.needNewComputeReadWriteDescriptorSet) {
        descriptorSetLayout = resourceLayout.*.descriptorSetLayouts[@as(c_int, 1)];
        commandBuffer.*.computeReadWriteDescriptorSet = VULKAN_INTERNAL_FetchDescriptorSet(renderer, commandBuffer, descriptorSetLayout);
        {
            var i: Uint32 = 0;
            _ = &i;
            while (i < resourceLayout.*.numReadWriteStorageTextures) : (i +%= 1) {
                var currentWriteDescriptorSet: [*c]VkWriteDescriptorSet = &writeDescriptorSets[writeCount];
                _ = &currentWriteDescriptorSet;
                currentWriteDescriptorSet.*.sType = VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET;
                currentWriteDescriptorSet.*.pNext = null;
                currentWriteDescriptorSet.*.descriptorCount = 1;
                currentWriteDescriptorSet.*.descriptorType = VK_DESCRIPTOR_TYPE_STORAGE_IMAGE;
                currentWriteDescriptorSet.*.dstArrayElement = 0;
                currentWriteDescriptorSet.*.dstBinding = i;
                currentWriteDescriptorSet.*.dstSet = commandBuffer.*.computeReadWriteDescriptorSet;
                currentWriteDescriptorSet.*.pTexelBufferView = null;
                currentWriteDescriptorSet.*.pBufferInfo = null;
                imageInfos[imageInfoCount].sampler = null;
                imageInfos[imageInfoCount].imageView = commandBuffer.*.readWriteComputeStorageTextureViewBindings[i];
                imageInfos[imageInfoCount].imageLayout = VK_IMAGE_LAYOUT_GENERAL;
                currentWriteDescriptorSet.*.pImageInfo = &imageInfos[imageInfoCount];
                writeCount +%= 1;
                imageInfoCount +%= 1;
            }
        }
        {
            var i: Uint32 = 0;
            _ = &i;
            while (i < resourceLayout.*.numReadWriteStorageBuffers) : (i +%= 1) {
                var currentWriteDescriptorSet: [*c]VkWriteDescriptorSet = &writeDescriptorSets[writeCount];
                _ = &currentWriteDescriptorSet;
                currentWriteDescriptorSet.*.sType = VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET;
                currentWriteDescriptorSet.*.pNext = null;
                currentWriteDescriptorSet.*.descriptorCount = 1;
                currentWriteDescriptorSet.*.descriptorType = VK_DESCRIPTOR_TYPE_STORAGE_BUFFER;
                currentWriteDescriptorSet.*.dstArrayElement = 0;
                currentWriteDescriptorSet.*.dstBinding = resourceLayout.*.numReadWriteStorageTextures +% i;
                currentWriteDescriptorSet.*.dstSet = commandBuffer.*.computeReadWriteDescriptorSet;
                currentWriteDescriptorSet.*.pTexelBufferView = null;
                currentWriteDescriptorSet.*.pImageInfo = null;
                bufferInfos[bufferInfoCount].buffer = commandBuffer.*.readWriteComputeStorageBufferBindings[i];
                bufferInfos[bufferInfoCount].offset = 0;
                bufferInfos[bufferInfoCount].range = @truncate(~@as(c_ulonglong, 0));
                currentWriteDescriptorSet.*.pBufferInfo = &bufferInfos[bufferInfoCount];
                writeCount +%= 1;
                bufferInfoCount +%= 1;
            }
        }
        commandBuffer.*.needNewComputeReadWriteDescriptorSet = @"false" != 0;
    }
    if (commandBuffer.*.needNewComputeUniformDescriptorSet) {
        descriptorSetLayout = resourceLayout.*.descriptorSetLayouts[@as(c_int, 2)];
        commandBuffer.*.computeUniformDescriptorSet = VULKAN_INTERNAL_FetchDescriptorSet(renderer, commandBuffer, descriptorSetLayout);
        {
            var i: Uint32 = 0;
            _ = &i;
            while (i < resourceLayout.*.numUniformBuffers) : (i +%= 1) {
                var currentWriteDescriptorSet: [*c]VkWriteDescriptorSet = &writeDescriptorSets[writeCount];
                _ = &currentWriteDescriptorSet;
                currentWriteDescriptorSet.*.sType = VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET;
                currentWriteDescriptorSet.*.pNext = null;
                currentWriteDescriptorSet.*.descriptorCount = 1;
                currentWriteDescriptorSet.*.descriptorType = VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER_DYNAMIC;
                currentWriteDescriptorSet.*.dstArrayElement = 0;
                currentWriteDescriptorSet.*.dstBinding = i;
                currentWriteDescriptorSet.*.dstSet = commandBuffer.*.computeUniformDescriptorSet;
                currentWriteDescriptorSet.*.pTexelBufferView = null;
                currentWriteDescriptorSet.*.pImageInfo = null;
                bufferInfos[bufferInfoCount].buffer = commandBuffer.*.computeUniformBuffers[i].*.buffer.*.buffer;
                bufferInfos[bufferInfoCount].offset = 0;
                bufferInfos[bufferInfoCount].range = MAX_UBO_SECTION_SIZE;
                currentWriteDescriptorSet.*.pBufferInfo = &bufferInfos[bufferInfoCount];
                writeCount +%= 1;
                bufferInfoCount +%= 1;
            }
        }
        commandBuffer.*.needNewComputeUniformDescriptorSet = @"false" != 0;
    }
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < resourceLayout.*.numUniformBuffers) : (i +%= 1) {
            dynamicOffsets[i] = commandBuffer.*.computeUniformBuffers[i].*.drawOffset;
            dynamicOffsetCount +%= 1;
        }
    }
    renderer.*.vkUpdateDescriptorSets.?(renderer.*.logicalDevice, writeCount, @ptrCast(@alignCast(&writeDescriptorSets)), 0, null);
    var sets: [3]VkDescriptorSet = undefined;
    _ = &sets;
    sets[@as(c_int, 0)] = commandBuffer.*.computeReadOnlyDescriptorSet;
    sets[@as(c_int, 1)] = commandBuffer.*.computeReadWriteDescriptorSet;
    sets[@as(c_int, 2)] = commandBuffer.*.computeUniformDescriptorSet;
    renderer.*.vkCmdBindDescriptorSets.?(commandBuffer.*.commandBuffer, VK_PIPELINE_BIND_POINT_COMPUTE, resourceLayout.*.pipelineLayout, 0, 3, @ptrCast(@alignCast(&sets)), dynamicOffsetCount, @ptrCast(@alignCast(&dynamicOffsets)));
    commandBuffer.*.needNewComputeUniformOffsets = @"false" != 0;
}
pub fn VULKAN_DispatchCompute(commandBuffer: ?*SDL_GPUCommandBuffer, groupcountX: Uint32, groupcountY: Uint32, groupcountZ: Uint32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var vulkanCommandBuffer: [*c]VulkanCommandBuffer = @ptrCast(@alignCast(commandBuffer));
    _ = &vulkanCommandBuffer;
    var renderer: [*c]VulkanRenderer = vulkanCommandBuffer.*.renderer;
    _ = &renderer;
    VULKAN_INTERNAL_BindComputeDescriptorSets(renderer, vulkanCommandBuffer);
    renderer.*.vkCmdDispatch.?(vulkanCommandBuffer.*.commandBuffer, groupcountX, groupcountY, groupcountZ);
}
pub fn VULKAN_DispatchComputeIndirect(commandBuffer: ?*SDL_GPUCommandBuffer, buffer: ?*SDL_GPUBuffer, offset: Uint32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var vulkanCommandBuffer: [*c]VulkanCommandBuffer = @ptrCast(@alignCast(commandBuffer));
    _ = &vulkanCommandBuffer;
    var renderer: [*c]VulkanRenderer = vulkanCommandBuffer.*.renderer;
    _ = &renderer;
    var vulkanBuffer: [*c]VulkanBuffer = @as([*c]VulkanBufferContainer, @ptrCast(@alignCast(buffer))).*.activeBuffer;
    _ = &vulkanBuffer;
    VULKAN_INTERNAL_BindComputeDescriptorSets(renderer, vulkanCommandBuffer);
    renderer.*.vkCmdDispatchIndirect.?(vulkanCommandBuffer.*.commandBuffer, vulkanBuffer.*.buffer, offset);
    VULKAN_INTERNAL_TrackBuffer(vulkanCommandBuffer, vulkanBuffer);
}
pub fn VULKAN_EndComputePass(commandBuffer: ?*SDL_GPUCommandBuffer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var vulkanCommandBuffer: [*c]VulkanCommandBuffer = @ptrCast(@alignCast(commandBuffer));
    _ = &vulkanCommandBuffer;
    var i: Uint32 = undefined;
    _ = &i;
    {
        i = 0;
        while (i < vulkanCommandBuffer.*.readWriteComputeStorageTextureSubresourceCount) : (i +%= 1) {
            VULKAN_INTERNAL_TextureSubresourceTransitionToDefaultUsage(vulkanCommandBuffer.*.renderer, vulkanCommandBuffer, VULKAN_TEXTURE_USAGE_MODE_COMPUTE_STORAGE_READ_WRITE, vulkanCommandBuffer.*.readWriteComputeStorageTextureSubresources[i]);
            vulkanCommandBuffer.*.readWriteComputeStorageTextureSubresources[i] = null;
        }
    }
    vulkanCommandBuffer.*.readWriteComputeStorageTextureSubresourceCount = 0;
    {
        i = 0;
        while (i < @as(Uint32, MAX_COMPUTE_WRITE_BUFFERS)) : (i +%= 1) {
            if (@as(?*anyopaque, @ptrCast(@alignCast(vulkanCommandBuffer.*.readWriteComputeStorageBuffers[i]))) != @as(?*anyopaque, null)) {
                VULKAN_INTERNAL_BufferTransitionToDefaultUsage(vulkanCommandBuffer.*.renderer, vulkanCommandBuffer, @as(c_uint, 1) << @intCast(@as(c_uint, 7)), vulkanCommandBuffer.*.readWriteComputeStorageBuffers[i]);
                vulkanCommandBuffer.*.readWriteComputeStorageBuffers[i] = null;
            }
        }
    }
    {
        i = 0;
        while (i < @as(Uint32, MAX_STORAGE_TEXTURES_PER_STAGE)) : (i +%= 1) {
            if (@as(?*anyopaque, @ptrCast(@alignCast(vulkanCommandBuffer.*.readOnlyComputeStorageTextures[i]))) != @as(?*anyopaque, null)) {
                VULKAN_INTERNAL_TextureTransitionToDefaultUsage(vulkanCommandBuffer.*.renderer, vulkanCommandBuffer, VULKAN_TEXTURE_USAGE_MODE_COMPUTE_STORAGE_READ, vulkanCommandBuffer.*.readOnlyComputeStorageTextures[i]);
                vulkanCommandBuffer.*.readOnlyComputeStorageTextures[i] = null;
            }
        }
    }
    {
        i = 0;
        while (i < @as(Uint32, MAX_STORAGE_BUFFERS_PER_STAGE)) : (i +%= 1) {
            if (@as(?*anyopaque, @ptrCast(@alignCast(vulkanCommandBuffer.*.readOnlyComputeStorageBuffers[i]))) != @as(?*anyopaque, null)) {
                VULKAN_INTERNAL_BufferTransitionToDefaultUsage(vulkanCommandBuffer.*.renderer, vulkanCommandBuffer, @as(c_uint, 1) << @intCast(@as(c_uint, 6)), vulkanCommandBuffer.*.readOnlyComputeStorageBuffers[i]);
                vulkanCommandBuffer.*.readOnlyComputeStorageBuffers[i] = null;
            }
        }
    }
    _ = memset(@ptrCast(@alignCast(@as([*c]VkImageView, @ptrCast(@alignCast(&vulkanCommandBuffer.*.computeSamplerTextureViewBindings))))), 0, @sizeOf(@TypeOf(vulkanCommandBuffer.*.computeSamplerTextureViewBindings)));
    _ = memset(@ptrCast(@alignCast(@as([*c]VkSampler, @ptrCast(@alignCast(&vulkanCommandBuffer.*.computeSamplerBindings))))), 0, @sizeOf(@TypeOf(vulkanCommandBuffer.*.computeSamplerBindings)));
    _ = memset(@ptrCast(@alignCast(@as([*c]VkImageView, @ptrCast(@alignCast(&vulkanCommandBuffer.*.readWriteComputeStorageTextureViewBindings))))), 0, @sizeOf(@TypeOf(vulkanCommandBuffer.*.readWriteComputeStorageTextureViewBindings)));
    _ = memset(@ptrCast(@alignCast(@as([*c]VkBuffer, @ptrCast(@alignCast(&vulkanCommandBuffer.*.readWriteComputeStorageBufferBindings))))), 0, @sizeOf(@TypeOf(vulkanCommandBuffer.*.readWriteComputeStorageBufferBindings)));
    vulkanCommandBuffer.*.currentComputePipeline = null;
    vulkanCommandBuffer.*.computeReadOnlyDescriptorSet = null;
    vulkanCommandBuffer.*.computeReadWriteDescriptorSet = null;
    vulkanCommandBuffer.*.computeUniformDescriptorSet = null;
}
pub fn VULKAN_MapTransferBuffer(driverData: ?*SDL_GPURenderer, transferBuffer: ?*SDL_GPUTransferBuffer, cycle: bool) callconv(.c) ?*anyopaque {
    @setEvalBranchQuota(100000);
    var renderer: [*c]VulkanRenderer = @ptrCast(@alignCast(driverData));
    _ = &renderer;
    var transferBufferContainer: [*c]VulkanBufferContainer = @ptrCast(@alignCast(transferBuffer));
    _ = &transferBufferContainer;
    if (cycle and (SDL_GetAtomicInt_REAL(&transferBufferContainer.*.activeBuffer.*.referenceCount) > @as(c_int, 0))) {
        VULKAN_INTERNAL_CycleActiveBuffer(renderer, transferBufferContainer);
    }
    var bufferPointer: [*c]Uint8 = transferBufferContainer.*.activeBuffer.*.usedRegion.*.allocation.*.mapPointer + transferBufferContainer.*.activeBuffer.*.usedRegion.*.resourceOffset;
    _ = &bufferPointer;
    return @ptrCast(@alignCast(bufferPointer));
}
pub fn VULKAN_UnmapTransferBuffer(arg_driverData: ?*SDL_GPURenderer, arg_transferBuffer: ?*SDL_GPUTransferBuffer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var driverData = arg_driverData;
    _ = &driverData;
    var transferBuffer = arg_transferBuffer;
    _ = &transferBuffer;
    _ = &driverData;
    _ = &transferBuffer;
}
pub fn VULKAN_BeginCopyPass(arg_commandBuffer: ?*SDL_GPUCommandBuffer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var commandBuffer = arg_commandBuffer;
    _ = &commandBuffer;
    _ = &commandBuffer;
}
pub fn VULKAN_UploadToTexture(commandBuffer: ?*SDL_GPUCommandBuffer, source: [*c]const SDL_GPUTextureTransferInfo, destination: [*c]const SDL_GPUTextureRegion, cycle: bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var vulkanCommandBuffer: [*c]VulkanCommandBuffer = @ptrCast(@alignCast(commandBuffer));
    _ = &vulkanCommandBuffer;
    var renderer: [*c]VulkanRenderer = vulkanCommandBuffer.*.renderer;
    _ = &renderer;
    var transferBufferContainer: [*c]VulkanBufferContainer = @ptrCast(@alignCast(source.*.transfer_buffer));
    _ = &transferBufferContainer;
    var vulkanTextureContainer: [*c]VulkanTextureContainer = @ptrCast(@alignCast(destination.*.texture));
    _ = &vulkanTextureContainer;
    var vulkanTextureSubresource: [*c]VulkanTextureSubresource = undefined;
    _ = &vulkanTextureSubresource;
    var imageCopy: VkBufferImageCopy = undefined;
    _ = &imageCopy;
    SDL_LockRWLockForReading_REAL(renderer.*.defragLock);
    vulkanTextureSubresource = VULKAN_INTERNAL_PrepareTextureSubresourceForWrite(renderer, vulkanCommandBuffer, vulkanTextureContainer, destination.*.layer, destination.*.mip_level, cycle, VULKAN_TEXTURE_USAGE_MODE_COPY_DESTINATION);
    imageCopy.imageExtent.width = destination.*.w;
    imageCopy.imageExtent.height = destination.*.h;
    imageCopy.imageExtent.depth = destination.*.d;
    imageCopy.imageOffset.x = @bitCast(@as(c_uint, @truncate(destination.*.x)));
    imageCopy.imageOffset.y = @bitCast(@as(c_uint, @truncate(destination.*.y)));
    imageCopy.imageOffset.z = @bitCast(@as(c_uint, @truncate(destination.*.z)));
    imageCopy.imageSubresource.aspectMask = vulkanTextureSubresource.*.parent.*.aspectFlags;
    imageCopy.imageSubresource.baseArrayLayer = destination.*.layer;
    imageCopy.imageSubresource.layerCount = 1;
    imageCopy.imageSubresource.mipLevel = destination.*.mip_level;
    imageCopy.bufferOffset = source.*.offset;
    imageCopy.bufferRowLength = source.*.pixels_per_row;
    imageCopy.bufferImageHeight = source.*.rows_per_layer;
    renderer.*.vkCmdCopyBufferToImage.?(vulkanCommandBuffer.*.commandBuffer, transferBufferContainer.*.activeBuffer.*.buffer, vulkanTextureSubresource.*.parent.*.image, VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL, 1, &imageCopy);
    VULKAN_INTERNAL_TextureSubresourceTransitionToDefaultUsage(renderer, vulkanCommandBuffer, VULKAN_TEXTURE_USAGE_MODE_COPY_DESTINATION, vulkanTextureSubresource);
    VULKAN_INTERNAL_TrackBuffer(vulkanCommandBuffer, transferBufferContainer.*.activeBuffer);
    VULKAN_INTERNAL_TrackTexture(vulkanCommandBuffer, vulkanTextureSubresource.*.parent);
    VULKAN_INTERNAL_TrackTextureTransfer(vulkanCommandBuffer, vulkanTextureSubresource.*.parent);
    SDL_UnlockRWLock_REAL(renderer.*.defragLock);
}
pub fn VULKAN_UploadToBuffer(commandBuffer: ?*SDL_GPUCommandBuffer, source: [*c]const SDL_GPUTransferBufferLocation, destination: [*c]const SDL_GPUBufferRegion, cycle: bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var vulkanCommandBuffer: [*c]VulkanCommandBuffer = @ptrCast(@alignCast(commandBuffer));
    _ = &vulkanCommandBuffer;
    var renderer: [*c]VulkanRenderer = vulkanCommandBuffer.*.renderer;
    _ = &renderer;
    var transferBufferContainer: [*c]VulkanBufferContainer = @ptrCast(@alignCast(source.*.transfer_buffer));
    _ = &transferBufferContainer;
    var bufferContainer: [*c]VulkanBufferContainer = @ptrCast(@alignCast(destination.*.buffer));
    _ = &bufferContainer;
    var bufferCopy: VkBufferCopy = undefined;
    _ = &bufferCopy;
    SDL_LockRWLockForReading_REAL(renderer.*.defragLock);
    var vulkanBuffer: [*c]VulkanBuffer = VULKAN_INTERNAL_PrepareBufferForWrite(renderer, vulkanCommandBuffer, bufferContainer, cycle, @as(c_uint, 1) << @intCast(@as(c_uint, 1)));
    _ = &vulkanBuffer;
    bufferCopy.srcOffset = source.*.offset;
    bufferCopy.dstOffset = destination.*.offset;
    bufferCopy.size = destination.*.size;
    renderer.*.vkCmdCopyBuffer.?(vulkanCommandBuffer.*.commandBuffer, transferBufferContainer.*.activeBuffer.*.buffer, vulkanBuffer.*.buffer, 1, &bufferCopy);
    VULKAN_INTERNAL_BufferTransitionToDefaultUsage(renderer, vulkanCommandBuffer, @as(c_uint, 1) << @intCast(@as(c_uint, 1)), vulkanBuffer);
    VULKAN_INTERNAL_TrackBuffer(vulkanCommandBuffer, transferBufferContainer.*.activeBuffer);
    VULKAN_INTERNAL_TrackBuffer(vulkanCommandBuffer, vulkanBuffer);
    VULKAN_INTERNAL_TrackBufferTransfer(vulkanCommandBuffer, vulkanBuffer);
    SDL_UnlockRWLock_REAL(renderer.*.defragLock);
}
pub fn VULKAN_DownloadFromTexture(commandBuffer: ?*SDL_GPUCommandBuffer, source: [*c]const SDL_GPUTextureRegion, destination: [*c]const SDL_GPUTextureTransferInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var vulkanCommandBuffer: [*c]VulkanCommandBuffer = @ptrCast(@alignCast(commandBuffer));
    _ = &vulkanCommandBuffer;
    var renderer: [*c]VulkanRenderer = vulkanCommandBuffer.*.renderer;
    _ = &renderer;
    var textureContainer: [*c]VulkanTextureContainer = @ptrCast(@alignCast(source.*.texture));
    _ = &textureContainer;
    var vulkanTextureSubresource: [*c]VulkanTextureSubresource = undefined;
    _ = &vulkanTextureSubresource;
    var transferBufferContainer: [*c]VulkanBufferContainer = @ptrCast(@alignCast(destination.*.transfer_buffer));
    _ = &transferBufferContainer;
    var imageCopy: VkBufferImageCopy = undefined;
    _ = &imageCopy;
    SDL_LockRWLockForReading_REAL(renderer.*.defragLock);
    vulkanTextureSubresource = VULKAN_INTERNAL_FetchTextureSubresource(textureContainer, source.*.layer, source.*.mip_level);
    VULKAN_INTERNAL_TextureSubresourceTransitionFromDefaultUsage(renderer, vulkanCommandBuffer, VULKAN_TEXTURE_USAGE_MODE_COPY_SOURCE, vulkanTextureSubresource);
    imageCopy.imageExtent.width = source.*.w;
    imageCopy.imageExtent.height = source.*.h;
    imageCopy.imageExtent.depth = source.*.d;
    imageCopy.imageOffset.x = @bitCast(@as(c_uint, @truncate(source.*.x)));
    imageCopy.imageOffset.y = @bitCast(@as(c_uint, @truncate(source.*.y)));
    imageCopy.imageOffset.z = @bitCast(@as(c_uint, @truncate(source.*.z)));
    imageCopy.imageSubresource.aspectMask = vulkanTextureSubresource.*.parent.*.aspectFlags;
    imageCopy.imageSubresource.baseArrayLayer = source.*.layer;
    imageCopy.imageSubresource.layerCount = 1;
    imageCopy.imageSubresource.mipLevel = source.*.mip_level;
    imageCopy.bufferOffset = destination.*.offset;
    imageCopy.bufferRowLength = destination.*.pixels_per_row;
    imageCopy.bufferImageHeight = destination.*.rows_per_layer;
    renderer.*.vkCmdCopyImageToBuffer.?(vulkanCommandBuffer.*.commandBuffer, vulkanTextureSubresource.*.parent.*.image, VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL, transferBufferContainer.*.activeBuffer.*.buffer, 1, &imageCopy);
    VULKAN_INTERNAL_TextureSubresourceTransitionToDefaultUsage(renderer, vulkanCommandBuffer, VULKAN_TEXTURE_USAGE_MODE_COPY_SOURCE, vulkanTextureSubresource);
    VULKAN_INTERNAL_TrackBuffer(vulkanCommandBuffer, transferBufferContainer.*.activeBuffer);
    VULKAN_INTERNAL_TrackTexture(vulkanCommandBuffer, vulkanTextureSubresource.*.parent);
    VULKAN_INTERNAL_TrackTextureTransfer(vulkanCommandBuffer, vulkanTextureSubresource.*.parent);
    SDL_UnlockRWLock_REAL(renderer.*.defragLock);
}
pub fn VULKAN_DownloadFromBuffer(commandBuffer: ?*SDL_GPUCommandBuffer, source: [*c]const SDL_GPUBufferRegion, destination: [*c]const SDL_GPUTransferBufferLocation) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var vulkanCommandBuffer: [*c]VulkanCommandBuffer = @ptrCast(@alignCast(commandBuffer));
    _ = &vulkanCommandBuffer;
    var renderer: [*c]VulkanRenderer = vulkanCommandBuffer.*.renderer;
    _ = &renderer;
    var bufferContainer: [*c]VulkanBufferContainer = @ptrCast(@alignCast(source.*.buffer));
    _ = &bufferContainer;
    var transferBufferContainer: [*c]VulkanBufferContainer = @ptrCast(@alignCast(destination.*.transfer_buffer));
    _ = &transferBufferContainer;
    var bufferCopy: VkBufferCopy = undefined;
    _ = &bufferCopy;
    SDL_LockRWLockForReading_REAL(renderer.*.defragLock);
    VULKAN_INTERNAL_BufferTransitionFromDefaultUsage(renderer, vulkanCommandBuffer, @as(c_uint, 1) << @intCast(@as(c_uint, 0)), bufferContainer.*.activeBuffer);
    bufferCopy.srcOffset = source.*.offset;
    bufferCopy.dstOffset = destination.*.offset;
    bufferCopy.size = source.*.size;
    renderer.*.vkCmdCopyBuffer.?(vulkanCommandBuffer.*.commandBuffer, bufferContainer.*.activeBuffer.*.buffer, transferBufferContainer.*.activeBuffer.*.buffer, 1, &bufferCopy);
    VULKAN_INTERNAL_BufferTransitionToDefaultUsage(renderer, vulkanCommandBuffer, @as(c_uint, 1) << @intCast(@as(c_uint, 0)), bufferContainer.*.activeBuffer);
    VULKAN_INTERNAL_TrackBuffer(vulkanCommandBuffer, transferBufferContainer.*.activeBuffer);
    VULKAN_INTERNAL_TrackBuffer(vulkanCommandBuffer, bufferContainer.*.activeBuffer);
    VULKAN_INTERNAL_TrackBufferTransfer(vulkanCommandBuffer, bufferContainer.*.activeBuffer);
    SDL_UnlockRWLock_REAL(renderer.*.defragLock);
}
pub fn VULKAN_CopyTextureToTexture(commandBuffer: ?*SDL_GPUCommandBuffer, source: [*c]const SDL_GPUTextureLocation, destination: [*c]const SDL_GPUTextureLocation, w: Uint32, h: Uint32, d: Uint32, cycle: bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var vulkanCommandBuffer: [*c]VulkanCommandBuffer = @ptrCast(@alignCast(commandBuffer));
    _ = &vulkanCommandBuffer;
    var renderer: [*c]VulkanRenderer = vulkanCommandBuffer.*.renderer;
    _ = &renderer;
    var srcSubresource: [*c]VulkanTextureSubresource = undefined;
    _ = &srcSubresource;
    var dstSubresource: [*c]VulkanTextureSubresource = undefined;
    _ = &dstSubresource;
    var imageCopy: VkImageCopy = undefined;
    _ = &imageCopy;
    SDL_LockRWLockForReading_REAL(renderer.*.defragLock);
    srcSubresource = VULKAN_INTERNAL_FetchTextureSubresource(@ptrCast(@alignCast(source.*.texture)), source.*.layer, source.*.mip_level);
    dstSubresource = VULKAN_INTERNAL_PrepareTextureSubresourceForWrite(renderer, vulkanCommandBuffer, @ptrCast(@alignCast(destination.*.texture)), destination.*.layer, destination.*.mip_level, cycle, VULKAN_TEXTURE_USAGE_MODE_COPY_DESTINATION);
    VULKAN_INTERNAL_TextureSubresourceTransitionFromDefaultUsage(renderer, vulkanCommandBuffer, VULKAN_TEXTURE_USAGE_MODE_COPY_SOURCE, srcSubresource);
    imageCopy.srcOffset.x = @bitCast(@as(c_uint, @truncate(source.*.x)));
    imageCopy.srcOffset.y = @bitCast(@as(c_uint, @truncate(source.*.y)));
    imageCopy.srcOffset.z = @bitCast(@as(c_uint, @truncate(source.*.z)));
    imageCopy.srcSubresource.aspectMask = srcSubresource.*.parent.*.aspectFlags;
    imageCopy.srcSubresource.baseArrayLayer = source.*.layer;
    imageCopy.srcSubresource.layerCount = 1;
    imageCopy.srcSubresource.mipLevel = source.*.mip_level;
    imageCopy.dstOffset.x = @bitCast(@as(c_uint, @truncate(destination.*.x)));
    imageCopy.dstOffset.y = @bitCast(@as(c_uint, @truncate(destination.*.y)));
    imageCopy.dstOffset.z = @bitCast(@as(c_uint, @truncate(destination.*.z)));
    imageCopy.dstSubresource.aspectMask = dstSubresource.*.parent.*.aspectFlags;
    imageCopy.dstSubresource.baseArrayLayer = destination.*.layer;
    imageCopy.dstSubresource.layerCount = 1;
    imageCopy.dstSubresource.mipLevel = destination.*.mip_level;
    imageCopy.extent.width = w;
    imageCopy.extent.height = h;
    imageCopy.extent.depth = d;
    renderer.*.vkCmdCopyImage.?(vulkanCommandBuffer.*.commandBuffer, srcSubresource.*.parent.*.image, VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL, dstSubresource.*.parent.*.image, VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL, 1, &imageCopy);
    VULKAN_INTERNAL_TextureSubresourceTransitionToDefaultUsage(renderer, vulkanCommandBuffer, VULKAN_TEXTURE_USAGE_MODE_COPY_SOURCE, srcSubresource);
    VULKAN_INTERNAL_TextureSubresourceTransitionToDefaultUsage(renderer, vulkanCommandBuffer, VULKAN_TEXTURE_USAGE_MODE_COPY_DESTINATION, dstSubresource);
    VULKAN_INTERNAL_TrackTexture(vulkanCommandBuffer, srcSubresource.*.parent);
    VULKAN_INTERNAL_TrackTexture(vulkanCommandBuffer, dstSubresource.*.parent);
    VULKAN_INTERNAL_TrackTextureTransfer(vulkanCommandBuffer, srcSubresource.*.parent);
    VULKAN_INTERNAL_TrackTextureTransfer(vulkanCommandBuffer, dstSubresource.*.parent);
    SDL_UnlockRWLock_REAL(renderer.*.defragLock);
}
pub fn VULKAN_CopyBufferToBuffer(commandBuffer: ?*SDL_GPUCommandBuffer, source: [*c]const SDL_GPUBufferLocation, destination: [*c]const SDL_GPUBufferLocation, size: Uint32, cycle: bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var vulkanCommandBuffer: [*c]VulkanCommandBuffer = @ptrCast(@alignCast(commandBuffer));
    _ = &vulkanCommandBuffer;
    var renderer: [*c]VulkanRenderer = vulkanCommandBuffer.*.renderer;
    _ = &renderer;
    var srcContainer: [*c]VulkanBufferContainer = @ptrCast(@alignCast(source.*.buffer));
    _ = &srcContainer;
    var dstContainer: [*c]VulkanBufferContainer = @ptrCast(@alignCast(destination.*.buffer));
    _ = &dstContainer;
    var bufferCopy: VkBufferCopy = undefined;
    _ = &bufferCopy;
    SDL_LockRWLockForReading_REAL(renderer.*.defragLock);
    var dstBuffer: [*c]VulkanBuffer = VULKAN_INTERNAL_PrepareBufferForWrite(renderer, vulkanCommandBuffer, dstContainer, cycle, @as(c_uint, 1) << @intCast(@as(c_uint, 1)));
    _ = &dstBuffer;
    VULKAN_INTERNAL_BufferTransitionFromDefaultUsage(renderer, vulkanCommandBuffer, @as(c_uint, 1) << @intCast(@as(c_uint, 0)), srcContainer.*.activeBuffer);
    bufferCopy.srcOffset = source.*.offset;
    bufferCopy.dstOffset = destination.*.offset;
    bufferCopy.size = size;
    renderer.*.vkCmdCopyBuffer.?(vulkanCommandBuffer.*.commandBuffer, srcContainer.*.activeBuffer.*.buffer, dstBuffer.*.buffer, 1, &bufferCopy);
    VULKAN_INTERNAL_BufferTransitionToDefaultUsage(renderer, vulkanCommandBuffer, @as(c_uint, 1) << @intCast(@as(c_uint, 0)), srcContainer.*.activeBuffer);
    VULKAN_INTERNAL_BufferTransitionToDefaultUsage(renderer, vulkanCommandBuffer, @as(c_uint, 1) << @intCast(@as(c_uint, 1)), dstBuffer);
    VULKAN_INTERNAL_TrackBuffer(vulkanCommandBuffer, srcContainer.*.activeBuffer);
    VULKAN_INTERNAL_TrackBuffer(vulkanCommandBuffer, dstBuffer);
    VULKAN_INTERNAL_TrackBufferTransfer(vulkanCommandBuffer, srcContainer.*.activeBuffer);
    VULKAN_INTERNAL_TrackBufferTransfer(vulkanCommandBuffer, dstBuffer);
    SDL_UnlockRWLock_REAL(renderer.*.defragLock);
}
pub fn VULKAN_GenerateMipmaps(commandBuffer: ?*SDL_GPUCommandBuffer, texture: ?*SDL_GPUTexture) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var vulkanCommandBuffer: [*c]VulkanCommandBuffer = @ptrCast(@alignCast(commandBuffer));
    _ = &vulkanCommandBuffer;
    var renderer: [*c]VulkanRenderer = vulkanCommandBuffer.*.renderer;
    _ = &renderer;
    var container: [*c]VulkanTextureContainer = @ptrCast(@alignCast(texture));
    _ = &container;
    var srcTextureSubresource: [*c]VulkanTextureSubresource = undefined;
    _ = &srcTextureSubresource;
    var dstTextureSubresource: [*c]VulkanTextureSubresource = undefined;
    _ = &dstTextureSubresource;
    var blit: VkImageBlit = undefined;
    _ = &blit;
    SDL_LockRWLockForReading_REAL(renderer.*.defragLock);
    {
        var layerOrDepthIndex: Uint32 = 0;
        _ = &layerOrDepthIndex;
        while (layerOrDepthIndex < container.*.header.info.layer_count_or_depth) : (layerOrDepthIndex +%= 1) {
            {
                var level: Uint32 = 1;
                _ = &level;
                while (level < container.*.header.info.num_levels) : (level +%= 1) {
                    var layer: Uint32 = if (container.*.header.info.type == @as(SDL_GPUTextureType, SDL_GPU_TEXTURETYPE_3D)) @as(Uint32, 0) else layerOrDepthIndex;
                    _ = &layer;
                    var depth: Uint32 = if (container.*.header.info.type == @as(SDL_GPUTextureType, SDL_GPU_TEXTURETYPE_3D)) layerOrDepthIndex else @as(Uint32, 0);
                    _ = &depth;
                    var srcSubresourceIndex: Uint32 = VULKAN_INTERNAL_GetTextureSubresourceIndex(level -% @as(Uint32, 1), layer, container.*.header.info.num_levels);
                    _ = &srcSubresourceIndex;
                    var dstSubresourceIndex: Uint32 = VULKAN_INTERNAL_GetTextureSubresourceIndex(level, layer, container.*.header.info.num_levels);
                    _ = &dstSubresourceIndex;
                    srcTextureSubresource = &container.*.activeTexture.*.subresources[srcSubresourceIndex];
                    dstTextureSubresource = &container.*.activeTexture.*.subresources[dstSubresourceIndex];
                    VULKAN_INTERNAL_TextureSubresourceTransitionFromDefaultUsage(renderer, vulkanCommandBuffer, VULKAN_TEXTURE_USAGE_MODE_COPY_SOURCE, srcTextureSubresource);
                    VULKAN_INTERNAL_TextureSubresourceTransitionFromDefaultUsage(renderer, vulkanCommandBuffer, VULKAN_TEXTURE_USAGE_MODE_COPY_DESTINATION, dstTextureSubresource);
                    blit.srcOffsets[@as(c_int, 0)].x = 0;
                    blit.srcOffsets[@as(c_int, 0)].y = 0;
                    blit.srcOffsets[@as(c_int, 0)].z = @bitCast(@as(c_uint, @truncate(depth)));
                    blit.srcOffsets[@as(c_int, 1)].x = @bitCast(@as(c_uint, @truncate(container.*.header.info.width >> @intCast(level -% @as(Uint32, 1)))));
                    blit.srcOffsets[@as(c_int, 1)].y = @bitCast(@as(c_uint, @truncate(container.*.header.info.height >> @intCast(level -% @as(Uint32, 1)))));
                    blit.srcOffsets[@as(c_int, 1)].z = @bitCast(@as(c_uint, @truncate(depth +% @as(Uint32, 1))));
                    blit.dstOffsets[@as(c_int, 0)].x = 0;
                    blit.dstOffsets[@as(c_int, 0)].y = 0;
                    blit.dstOffsets[@as(c_int, 0)].z = @bitCast(@as(c_uint, @truncate(depth)));
                    blit.dstOffsets[@as(c_int, 1)].x = @bitCast(@as(c_uint, @truncate(container.*.header.info.width >> @intCast(level))));
                    blit.dstOffsets[@as(c_int, 1)].y = @bitCast(@as(c_uint, @truncate(container.*.header.info.height >> @intCast(level))));
                    blit.dstOffsets[@as(c_int, 1)].z = @bitCast(@as(c_uint, @truncate(depth +% @as(Uint32, 1))));
                    blit.srcSubresource.aspectMask = VK_IMAGE_ASPECT_COLOR_BIT;
                    blit.srcSubresource.baseArrayLayer = layer;
                    blit.srcSubresource.layerCount = 1;
                    blit.srcSubresource.mipLevel = level -% @as(Uint32, 1);
                    blit.dstSubresource.aspectMask = VK_IMAGE_ASPECT_COLOR_BIT;
                    blit.dstSubresource.baseArrayLayer = layer;
                    blit.dstSubresource.layerCount = 1;
                    blit.dstSubresource.mipLevel = level;
                    renderer.*.vkCmdBlitImage.?(vulkanCommandBuffer.*.commandBuffer, container.*.activeTexture.*.image, VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL, container.*.activeTexture.*.image, VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL, 1, &blit, VK_FILTER_LINEAR);
                    VULKAN_INTERNAL_TextureSubresourceTransitionToDefaultUsage(renderer, vulkanCommandBuffer, VULKAN_TEXTURE_USAGE_MODE_COPY_SOURCE, srcTextureSubresource);
                    VULKAN_INTERNAL_TextureSubresourceTransitionToDefaultUsage(renderer, vulkanCommandBuffer, VULKAN_TEXTURE_USAGE_MODE_COPY_DESTINATION, dstTextureSubresource);
                    VULKAN_INTERNAL_TrackTexture(vulkanCommandBuffer, srcTextureSubresource.*.parent);
                    VULKAN_INTERNAL_TrackTexture(vulkanCommandBuffer, dstTextureSubresource.*.parent);
                    VULKAN_INTERNAL_TrackTextureTransfer(vulkanCommandBuffer, srcTextureSubresource.*.parent);
                    VULKAN_INTERNAL_TrackTextureTransfer(vulkanCommandBuffer, dstTextureSubresource.*.parent);
                }
            }
        }
    }
    SDL_UnlockRWLock_REAL(renderer.*.defragLock);
}
pub fn VULKAN_EndCopyPass(arg_commandBuffer: ?*SDL_GPUCommandBuffer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var commandBuffer = arg_commandBuffer;
    _ = &commandBuffer;
    _ = &commandBuffer;
}
pub fn VULKAN_Blit(commandBuffer: ?*SDL_GPUCommandBuffer, info: [*c]const SDL_GPUBlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var vulkanCommandBuffer: [*c]VulkanCommandBuffer = @ptrCast(@alignCast(commandBuffer));
    _ = &vulkanCommandBuffer;
    var renderer: [*c]VulkanRenderer = vulkanCommandBuffer.*.renderer;
    _ = &renderer;
    var srcHeader: [*c]TextureCommonHeader = @ptrCast(@alignCast(info.*.source.texture));
    _ = &srcHeader;
    var dstHeader: [*c]TextureCommonHeader = @ptrCast(@alignCast(info.*.destination.texture));
    _ = &dstHeader;
    var region: VkImageBlit = undefined;
    _ = &region;
    var srcLayer: Uint32 = if (srcHeader.*.info.type == @as(SDL_GPUTextureType, SDL_GPU_TEXTURETYPE_3D)) @as(Uint32, 0) else info.*.source.layer_or_depth_plane;
    _ = &srcLayer;
    var srcDepth: Uint32 = if (srcHeader.*.info.type == @as(SDL_GPUTextureType, SDL_GPU_TEXTURETYPE_3D)) info.*.source.layer_or_depth_plane else @as(Uint32, 0);
    _ = &srcDepth;
    var dstLayer: Uint32 = if (dstHeader.*.info.type == @as(SDL_GPUTextureType, SDL_GPU_TEXTURETYPE_3D)) @as(Uint32, 0) else info.*.destination.layer_or_depth_plane;
    _ = &dstLayer;
    var dstDepth: Uint32 = if (dstHeader.*.info.type == @as(SDL_GPUTextureType, SDL_GPU_TEXTURETYPE_3D)) info.*.destination.layer_or_depth_plane else @as(Uint32, 0);
    _ = &dstDepth;
    var swap: i32 = undefined;
    _ = &swap;
    if (info.*.load_op == @as(SDL_GPULoadOp, SDL_GPU_LOADOP_CLEAR)) {
        var targetInfo: SDL_GPUColorTargetInfo = undefined;
        _ = &targetInfo;
        _ = memset(@ptrCast(@alignCast(&targetInfo)), 0, @sizeOf(@TypeOf(targetInfo)));
        targetInfo.texture = info.*.destination.texture;
        targetInfo.mip_level = info.*.destination.mip_level;
        targetInfo.layer_or_depth_plane = info.*.destination.layer_or_depth_plane;
        targetInfo.load_op = SDL_GPU_LOADOP_CLEAR;
        targetInfo.store_op = SDL_GPU_STOREOP_STORE;
        targetInfo.clear_color = info.*.clear_color;
        targetInfo.cycle = info.*.cycle;
        VULKAN_BeginRenderPass(commandBuffer, &targetInfo, 1, null);
        VULKAN_EndRenderPass(commandBuffer);
    }
    var srcSubresource: [*c]VulkanTextureSubresource = VULKAN_INTERNAL_FetchTextureSubresource(@ptrCast(@alignCast(info.*.source.texture)), srcLayer, info.*.source.mip_level);
    _ = &srcSubresource;
    var dstSubresource: [*c]VulkanTextureSubresource = VULKAN_INTERNAL_PrepareTextureSubresourceForWrite(renderer, vulkanCommandBuffer, @ptrCast(@alignCast(info.*.destination.texture)), dstLayer, info.*.destination.mip_level, info.*.cycle, VULKAN_TEXTURE_USAGE_MODE_COPY_DESTINATION);
    _ = &dstSubresource;
    VULKAN_INTERNAL_TextureSubresourceTransitionFromDefaultUsage(renderer, vulkanCommandBuffer, VULKAN_TEXTURE_USAGE_MODE_COPY_SOURCE, srcSubresource);
    region.srcSubresource.aspectMask = srcSubresource.*.parent.*.aspectFlags;
    region.srcSubresource.baseArrayLayer = srcSubresource.*.layer;
    region.srcSubresource.layerCount = 1;
    region.srcSubresource.mipLevel = srcSubresource.*.level;
    region.srcOffsets[@as(c_int, 0)].x = @bitCast(@as(c_uint, @truncate(info.*.source.x)));
    region.srcOffsets[@as(c_int, 0)].y = @bitCast(@as(c_uint, @truncate(info.*.source.y)));
    region.srcOffsets[@as(c_int, 0)].z = @bitCast(@as(c_uint, @truncate(srcDepth)));
    region.srcOffsets[@as(c_int, 1)].x = @bitCast(@as(c_uint, @truncate(info.*.source.x +% info.*.source.w)));
    region.srcOffsets[@as(c_int, 1)].y = @bitCast(@as(c_uint, @truncate(info.*.source.y +% info.*.source.h)));
    region.srcOffsets[@as(c_int, 1)].z = @bitCast(@as(c_uint, @truncate(srcDepth +% @as(Uint32, 1))));
    if ((info.*.flip_mode & @as(SDL_FlipMode, SDL_FLIP_HORIZONTAL)) != 0) {
        swap = region.srcOffsets[@as(c_int, 0)].x;
        region.srcOffsets[@as(c_int, 0)].x = region.srcOffsets[@as(c_int, 1)].x;
        region.srcOffsets[@as(c_int, 1)].x = swap;
    }
    if ((info.*.flip_mode & @as(SDL_FlipMode, SDL_FLIP_VERTICAL)) != 0) {
        swap = region.srcOffsets[@as(c_int, 0)].y;
        region.srcOffsets[@as(c_int, 0)].y = region.srcOffsets[@as(c_int, 1)].y;
        region.srcOffsets[@as(c_int, 1)].y = swap;
    }
    region.dstSubresource.aspectMask = dstSubresource.*.parent.*.aspectFlags;
    region.dstSubresource.baseArrayLayer = dstSubresource.*.layer;
    region.dstSubresource.layerCount = 1;
    region.dstSubresource.mipLevel = dstSubresource.*.level;
    region.dstOffsets[@as(c_int, 0)].x = @bitCast(@as(c_uint, @truncate(info.*.destination.x)));
    region.dstOffsets[@as(c_int, 0)].y = @bitCast(@as(c_uint, @truncate(info.*.destination.y)));
    region.dstOffsets[@as(c_int, 0)].z = @bitCast(@as(c_uint, @truncate(dstDepth)));
    region.dstOffsets[@as(c_int, 1)].x = @bitCast(@as(c_uint, @truncate(info.*.destination.x +% info.*.destination.w)));
    region.dstOffsets[@as(c_int, 1)].y = @bitCast(@as(c_uint, @truncate(info.*.destination.y +% info.*.destination.h)));
    region.dstOffsets[@as(c_int, 1)].z = @bitCast(@as(c_uint, @truncate(dstDepth +% @as(Uint32, 1))));
    renderer.*.vkCmdBlitImage.?(vulkanCommandBuffer.*.commandBuffer, srcSubresource.*.parent.*.image, VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL, dstSubresource.*.parent.*.image, VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL, 1, &region, SDLToVK_Filter[info.*.filter]);
    VULKAN_INTERNAL_TextureSubresourceTransitionToDefaultUsage(renderer, vulkanCommandBuffer, VULKAN_TEXTURE_USAGE_MODE_COPY_SOURCE, srcSubresource);
    VULKAN_INTERNAL_TextureSubresourceTransitionToDefaultUsage(renderer, vulkanCommandBuffer, VULKAN_TEXTURE_USAGE_MODE_COPY_DESTINATION, dstSubresource);
    VULKAN_INTERNAL_TrackTexture(vulkanCommandBuffer, srcSubresource.*.parent);
    VULKAN_INTERNAL_TrackTexture(vulkanCommandBuffer, dstSubresource.*.parent);
}
pub fn VULKAN_INTERNAL_AllocateCommandBuffer(renderer: [*c]VulkanRenderer, vulkanCommandPool: [*c]VulkanCommandPool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var allocateInfo: VkCommandBufferAllocateInfo = undefined;
    _ = &allocateInfo;
    var vulkanResult: VkResult = undefined;
    _ = &vulkanResult;
    var commandBufferHandle: VkCommandBuffer = undefined;
    _ = &commandBufferHandle;
    var commandBuffer: [*c]VulkanCommandBuffer = undefined;
    _ = &commandBuffer;
    vulkanCommandPool.*.inactiveCommandBufferCapacity +%= 1;
    vulkanCommandPool.*.inactiveCommandBuffers = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(vulkanCommandPool.*.inactiveCommandBuffers)), @sizeOf([*c]VulkanCommandBuffer) *% @as(c_ulong, vulkanCommandPool.*.inactiveCommandBufferCapacity))));
    allocateInfo.sType = VK_STRUCTURE_TYPE_COMMAND_BUFFER_ALLOCATE_INFO;
    allocateInfo.pNext = null;
    allocateInfo.commandPool = vulkanCommandPool.*.commandPool;
    allocateInfo.commandBufferCount = 1;
    allocateInfo.level = VK_COMMAND_BUFFER_LEVEL_PRIMARY;
    vulkanResult = renderer.*.vkAllocateCommandBuffers.?(renderer.*.logicalDevice, &allocateInfo, &commandBufferHandle);
    while (true) {
        if (vulkanResult != VK_SUCCESS) {
            if (renderer.*.debugMode) {
                SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkAllocateCommandBuffers"))), VkErrorMessages(vulkanResult));
            }
            _ = SDL_SetError_REAL("%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkAllocateCommandBuffers"))), VkErrorMessages(vulkanResult));
            return @"false" != 0;
        }
        if (!false) break;
    }
    commandBuffer = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(VulkanCommandBuffer))));
    commandBuffer.*.renderer = renderer;
    commandBuffer.*.commandPool = vulkanCommandPool;
    commandBuffer.*.commandBuffer = commandBufferHandle;
    commandBuffer.*.inFlightFence = null;
    commandBuffer.*.presentDataCapacity = 1;
    commandBuffer.*.presentDataCount = 0;
    commandBuffer.*.presentDatas = @ptrCast(@alignCast(SDL_malloc_REAL(@as(c_ulong, commandBuffer.*.presentDataCapacity) *% @sizeOf(VulkanPresentData))));
    commandBuffer.*.waitSemaphoreCapacity = 1;
    commandBuffer.*.waitSemaphoreCount = 0;
    commandBuffer.*.waitSemaphores = @ptrCast(@alignCast(SDL_malloc_REAL(@as(c_ulong, commandBuffer.*.waitSemaphoreCapacity) *% @sizeOf(VkSemaphore))));
    commandBuffer.*.signalSemaphoreCapacity = 1;
    commandBuffer.*.signalSemaphoreCount = 0;
    commandBuffer.*.signalSemaphores = @ptrCast(@alignCast(SDL_malloc_REAL(@as(c_ulong, commandBuffer.*.signalSemaphoreCapacity) *% @sizeOf(VkSemaphore))));
    commandBuffer.*.needVertexBufferBind = @"false" != 0;
    commandBuffer.*.needNewVertexResourceDescriptorSet = @"true" != 0;
    commandBuffer.*.needNewVertexUniformDescriptorSet = @"true" != 0;
    commandBuffer.*.needNewVertexUniformOffsets = @"true" != 0;
    commandBuffer.*.needNewFragmentResourceDescriptorSet = @"true" != 0;
    commandBuffer.*.needNewFragmentUniformDescriptorSet = @"true" != 0;
    commandBuffer.*.needNewFragmentUniformOffsets = @"true" != 0;
    commandBuffer.*.needNewComputeReadWriteDescriptorSet = @"true" != 0;
    commandBuffer.*.needNewComputeReadOnlyDescriptorSet = @"true" != 0;
    commandBuffer.*.needNewComputeUniformDescriptorSet = @"true" != 0;
    commandBuffer.*.needNewComputeUniformOffsets = @"true" != 0;
    commandBuffer.*.vertexResourceDescriptorSet = null;
    commandBuffer.*.vertexUniformDescriptorSet = null;
    commandBuffer.*.fragmentResourceDescriptorSet = null;
    commandBuffer.*.fragmentUniformDescriptorSet = null;
    commandBuffer.*.computeReadOnlyDescriptorSet = null;
    commandBuffer.*.computeReadWriteDescriptorSet = null;
    commandBuffer.*.computeUniformDescriptorSet = null;
    commandBuffer.*.usedBufferCapacity = 4;
    commandBuffer.*.usedBufferCount = 0;
    commandBuffer.*.usedBuffers = @ptrCast(@alignCast(SDL_malloc_REAL(@as(c_ulong, @bitCast(@as(c_long, commandBuffer.*.usedBufferCapacity))) *% @sizeOf([*c]VulkanBuffer))));
    commandBuffer.*.buffersUsedInPendingTransfersCapacity = 4;
    commandBuffer.*.buffersUsedInPendingTransfersCount = 0;
    commandBuffer.*.buffersUsedInPendingTransfers = @ptrCast(@alignCast(SDL_malloc_REAL(@as(c_ulong, @bitCast(@as(c_long, commandBuffer.*.buffersUsedInPendingTransfersCapacity))) *% @sizeOf([*c]VulkanBuffer))));
    commandBuffer.*.usedTextureCapacity = 4;
    commandBuffer.*.usedTextureCount = 0;
    commandBuffer.*.usedTextures = @ptrCast(@alignCast(SDL_malloc_REAL(@as(c_ulong, @bitCast(@as(c_long, commandBuffer.*.usedTextureCapacity))) *% @sizeOf([*c]VulkanTexture))));
    commandBuffer.*.texturesUsedInPendingTransfersCapacity = 4;
    commandBuffer.*.texturesUsedInPendingTransfersCount = 0;
    commandBuffer.*.texturesUsedInPendingTransfers = @ptrCast(@alignCast(SDL_malloc_REAL(@as(c_ulong, @bitCast(@as(c_long, commandBuffer.*.texturesUsedInPendingTransfersCapacity))) *% @sizeOf([*c]VulkanTexture))));
    commandBuffer.*.usedSamplerCapacity = 4;
    commandBuffer.*.usedSamplerCount = 0;
    commandBuffer.*.usedSamplers = @ptrCast(@alignCast(SDL_malloc_REAL(@as(c_ulong, @bitCast(@as(c_long, commandBuffer.*.usedSamplerCapacity))) *% @sizeOf([*c]VulkanSampler))));
    commandBuffer.*.usedGraphicsPipelineCapacity = 4;
    commandBuffer.*.usedGraphicsPipelineCount = 0;
    commandBuffer.*.usedGraphicsPipelines = @ptrCast(@alignCast(SDL_malloc_REAL(@as(c_ulong, @bitCast(@as(c_long, commandBuffer.*.usedGraphicsPipelineCapacity))) *% @sizeOf([*c]VulkanGraphicsPipeline))));
    commandBuffer.*.usedComputePipelineCapacity = 4;
    commandBuffer.*.usedComputePipelineCount = 0;
    commandBuffer.*.usedComputePipelines = @ptrCast(@alignCast(SDL_malloc_REAL(@as(c_ulong, @bitCast(@as(c_long, commandBuffer.*.usedComputePipelineCapacity))) *% @sizeOf([*c]VulkanComputePipeline))));
    commandBuffer.*.usedFramebufferCapacity = 4;
    commandBuffer.*.usedFramebufferCount = 0;
    commandBuffer.*.usedFramebuffers = @ptrCast(@alignCast(SDL_malloc_REAL(@as(c_ulong, @bitCast(@as(c_long, commandBuffer.*.usedFramebufferCapacity))) *% @sizeOf([*c]VulkanFramebuffer))));
    commandBuffer.*.usedUniformBufferCapacity = 4;
    commandBuffer.*.usedUniformBufferCount = 0;
    commandBuffer.*.usedUniformBuffers = @ptrCast(@alignCast(SDL_malloc_REAL(@as(c_ulong, @bitCast(@as(c_long, commandBuffer.*.usedUniformBufferCapacity))) *% @sizeOf([*c]VulkanUniformBuffer))));
    commandBuffer.*.swapchainRequested = @"false" != 0;
    vulkanCommandPool.*.inactiveCommandBuffers[vulkanCommandPool.*.inactiveCommandBufferCount] = commandBuffer;
    vulkanCommandPool.*.inactiveCommandBufferCount +%= 1;
    return @"true" != 0;
}
pub fn VULKAN_INTERNAL_FetchCommandPool(renderer: [*c]VulkanRenderer, threadID: SDL_ThreadID) callconv(.c) [*c]VulkanCommandPool {
    @setEvalBranchQuota(100000);
    var vulkanCommandPool: [*c]VulkanCommandPool = null;
    _ = &vulkanCommandPool;
    var commandPoolCreateInfo: VkCommandPoolCreateInfo = undefined;
    _ = &commandPoolCreateInfo;
    var vulkanResult: VkResult = undefined;
    _ = &vulkanResult;
    var key: CommandPoolHashTableKey = undefined;
    _ = &key;
    key.threadID = threadID;
    var result: bool = SDL_FindInHashTable(renderer.*.commandPoolHashTable, @ptrCast(@alignCast(&key)), @ptrCast(@alignCast(&vulkanCommandPool)));
    _ = &result;
    if (result) {
        return vulkanCommandPool;
    }
    vulkanCommandPool = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(VulkanCommandPool))));
    commandPoolCreateInfo.sType = VK_STRUCTURE_TYPE_COMMAND_POOL_CREATE_INFO;
    commandPoolCreateInfo.pNext = null;
    commandPoolCreateInfo.flags = VK_COMMAND_POOL_CREATE_RESET_COMMAND_BUFFER_BIT;
    commandPoolCreateInfo.queueFamilyIndex = renderer.*.queueFamilyIndex;
    vulkanResult = renderer.*.vkCreateCommandPool.?(renderer.*.logicalDevice, &commandPoolCreateInfo, null, &vulkanCommandPool.*.commandPool);
    if (vulkanResult != VK_SUCCESS) {
        SDL_free_REAL(@ptrCast(@alignCast(vulkanCommandPool)));
        while (true) {
            if (vulkanResult != VK_SUCCESS) {
                if (renderer.*.debugMode) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateCommandPool"))), VkErrorMessages(vulkanResult));
                }
                _ = SDL_SetError_REAL("%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateCommandPool"))), VkErrorMessages(vulkanResult));
                return null;
            }
            if (!false) break;
        }
        return null;
    }
    vulkanCommandPool.*.threadID = threadID;
    vulkanCommandPool.*.inactiveCommandBufferCapacity = 0;
    vulkanCommandPool.*.inactiveCommandBufferCount = 0;
    vulkanCommandPool.*.inactiveCommandBuffers = null;
    if (!VULKAN_INTERNAL_AllocateCommandBuffer(renderer, vulkanCommandPool)) {
        VULKAN_INTERNAL_DestroyCommandPool(renderer, vulkanCommandPool);
        return null;
    }
    var allocedKey: [*c]CommandPoolHashTableKey = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(CommandPoolHashTableKey))));
    _ = &allocedKey;
    allocedKey.*.threadID = threadID;
    _ = SDL_InsertIntoHashTable(renderer.*.commandPoolHashTable, @ptrCast(@alignCast(allocedKey)), @ptrCast(@alignCast(vulkanCommandPool)), @"true" != 0);
    return vulkanCommandPool;
}
pub fn VULKAN_INTERNAL_GetInactiveCommandBufferFromPool(renderer: [*c]VulkanRenderer, threadID: SDL_ThreadID) callconv(.c) [*c]VulkanCommandBuffer {
    @setEvalBranchQuota(100000);
    var commandPool: [*c]VulkanCommandPool = VULKAN_INTERNAL_FetchCommandPool(renderer, threadID);
    _ = &commandPool;
    var commandBuffer: [*c]VulkanCommandBuffer = undefined;
    _ = &commandBuffer;
    if (@as(?*anyopaque, @ptrCast(@alignCast(commandPool))) == @as(?*anyopaque, null)) {
        return null;
    }
    if (commandPool.*.inactiveCommandBufferCount == @as(Uint32, 0)) {
        if (!VULKAN_INTERNAL_AllocateCommandBuffer(renderer, commandPool)) {
            return null;
        }
    }
    commandBuffer = commandPool.*.inactiveCommandBuffers[commandPool.*.inactiveCommandBufferCount -% @as(Uint32, 1)];
    commandPool.*.inactiveCommandBufferCount -%= 1;
    return commandBuffer;
}
pub fn VULKAN_AcquireCommandBuffer(driverData: ?*SDL_GPURenderer) callconv(.c) ?*SDL_GPUCommandBuffer {
    @setEvalBranchQuota(100000);
    var renderer: [*c]VulkanRenderer = @ptrCast(@alignCast(driverData));
    _ = &renderer;
    var result: VkResult = undefined;
    _ = &result;
    var i: Uint32 = undefined;
    _ = &i;
    var threadID: SDL_ThreadID = SDL_GetCurrentThreadID_REAL();
    _ = &threadID;
    SDL_LockMutex_REAL(renderer.*.acquireCommandBufferLock);
    var commandBuffer: [*c]VulkanCommandBuffer = VULKAN_INTERNAL_GetInactiveCommandBufferFromPool(renderer, threadID);
    _ = &commandBuffer;
    if (@as(?*anyopaque, @ptrCast(@alignCast(commandBuffer))) == @as(?*anyopaque, null)) {
        SDL_UnlockMutex_REAL(renderer.*.acquireCommandBufferLock);
        return null;
    }
    var descriptorSetCache: [*c]DescriptorSetCache = VULKAN_INTERNAL_AcquireDescriptorSetCache(renderer);
    _ = &descriptorSetCache;
    SDL_UnlockMutex_REAL(renderer.*.acquireCommandBufferLock);
    commandBuffer.*.descriptorSetCache = descriptorSetCache;
    commandBuffer.*.currentComputePipeline = null;
    commandBuffer.*.currentGraphicsPipeline = null;
    _ = memset(@ptrCast(@alignCast(@as([*c][*c]VulkanTextureSubresource, @ptrCast(@alignCast(&commandBuffer.*.colorAttachmentSubresources))))), 0, @sizeOf(@TypeOf(commandBuffer.*.colorAttachmentSubresources)));
    _ = memset(@ptrCast(@alignCast(@as([*c][*c]VulkanTextureSubresource, @ptrCast(@alignCast(&commandBuffer.*.resolveAttachmentSubresources))))), 0, @sizeOf(@TypeOf(commandBuffer.*.resolveAttachmentSubresources)));
    commandBuffer.*.depthStencilAttachmentSubresource = null;
    commandBuffer.*.colorAttachmentSubresourceCount = 0;
    commandBuffer.*.resolveAttachmentSubresourceCount = 0;
    {
        i = 0;
        while (i < @as(Uint32, MAX_UNIFORM_BUFFERS_PER_STAGE)) : (i +%= 1) {
            commandBuffer.*.vertexUniformBuffers[i] = null;
            commandBuffer.*.fragmentUniformBuffers[i] = null;
            commandBuffer.*.computeUniformBuffers[i] = null;
        }
    }
    commandBuffer.*.needVertexBufferBind = @"false" != 0;
    commandBuffer.*.needNewVertexResourceDescriptorSet = @"true" != 0;
    commandBuffer.*.needNewVertexUniformDescriptorSet = @"true" != 0;
    commandBuffer.*.needNewVertexUniformOffsets = @"true" != 0;
    commandBuffer.*.needNewFragmentResourceDescriptorSet = @"true" != 0;
    commandBuffer.*.needNewFragmentUniformDescriptorSet = @"true" != 0;
    commandBuffer.*.needNewFragmentUniformOffsets = @"true" != 0;
    commandBuffer.*.needNewComputeReadOnlyDescriptorSet = @"true" != 0;
    commandBuffer.*.needNewComputeUniformDescriptorSet = @"true" != 0;
    commandBuffer.*.needNewComputeUniformOffsets = @"true" != 0;
    commandBuffer.*.vertexResourceDescriptorSet = null;
    commandBuffer.*.vertexUniformDescriptorSet = null;
    commandBuffer.*.fragmentResourceDescriptorSet = null;
    commandBuffer.*.fragmentUniformDescriptorSet = null;
    commandBuffer.*.computeReadOnlyDescriptorSet = null;
    commandBuffer.*.computeReadWriteDescriptorSet = null;
    commandBuffer.*.computeUniformDescriptorSet = null;
    _ = memset(@ptrCast(@alignCast(@as([*c]VkBuffer, @ptrCast(@alignCast(&commandBuffer.*.vertexBuffers))))), 0, @sizeOf(@TypeOf(commandBuffer.*.vertexBuffers)));
    _ = memset(@ptrCast(@alignCast(@as([*c]VkDeviceSize, @ptrCast(@alignCast(&commandBuffer.*.vertexBufferOffsets))))), 0, @sizeOf(@TypeOf(commandBuffer.*.vertexBufferOffsets)));
    commandBuffer.*.vertexBufferCount = 0;
    _ = memset(@ptrCast(@alignCast(@as([*c]VkImageView, @ptrCast(@alignCast(&commandBuffer.*.vertexSamplerTextureViewBindings))))), 0, @sizeOf(@TypeOf(commandBuffer.*.vertexSamplerTextureViewBindings)));
    _ = memset(@ptrCast(@alignCast(@as([*c]VkSampler, @ptrCast(@alignCast(&commandBuffer.*.vertexSamplerBindings))))), 0, @sizeOf(@TypeOf(commandBuffer.*.vertexSamplerBindings)));
    _ = memset(@ptrCast(@alignCast(@as([*c]VkImageView, @ptrCast(@alignCast(&commandBuffer.*.vertexStorageTextureViewBindings))))), 0, @sizeOf(@TypeOf(commandBuffer.*.vertexStorageTextureViewBindings)));
    _ = memset(@ptrCast(@alignCast(@as([*c]VkBuffer, @ptrCast(@alignCast(&commandBuffer.*.vertexStorageBufferBindings))))), 0, @sizeOf(@TypeOf(commandBuffer.*.vertexStorageBufferBindings)));
    _ = memset(@ptrCast(@alignCast(@as([*c]VkImageView, @ptrCast(@alignCast(&commandBuffer.*.fragmentSamplerTextureViewBindings))))), 0, @sizeOf(@TypeOf(commandBuffer.*.fragmentSamplerTextureViewBindings)));
    _ = memset(@ptrCast(@alignCast(@as([*c]VkSampler, @ptrCast(@alignCast(&commandBuffer.*.fragmentSamplerBindings))))), 0, @sizeOf(@TypeOf(commandBuffer.*.fragmentSamplerBindings)));
    _ = memset(@ptrCast(@alignCast(@as([*c]VkImageView, @ptrCast(@alignCast(&commandBuffer.*.fragmentStorageTextureViewBindings))))), 0, @sizeOf(@TypeOf(commandBuffer.*.fragmentStorageTextureViewBindings)));
    _ = memset(@ptrCast(@alignCast(@as([*c]VkBuffer, @ptrCast(@alignCast(&commandBuffer.*.fragmentStorageBufferBindings))))), 0, @sizeOf(@TypeOf(commandBuffer.*.fragmentStorageBufferBindings)));
    _ = memset(@ptrCast(@alignCast(@as([*c][*c]VulkanTextureSubresource, @ptrCast(@alignCast(&commandBuffer.*.readWriteComputeStorageTextureSubresources))))), 0, @sizeOf(@TypeOf(commandBuffer.*.readWriteComputeStorageTextureSubresources)));
    commandBuffer.*.readWriteComputeStorageTextureSubresourceCount = 0;
    _ = memset(@ptrCast(@alignCast(@as([*c][*c]VulkanBuffer, @ptrCast(@alignCast(&commandBuffer.*.readWriteComputeStorageBuffers))))), 0, @sizeOf(@TypeOf(commandBuffer.*.readWriteComputeStorageBuffers)));
    _ = memset(@ptrCast(@alignCast(@as([*c]VkImageView, @ptrCast(@alignCast(&commandBuffer.*.computeSamplerTextureViewBindings))))), 0, @sizeOf(@TypeOf(commandBuffer.*.computeSamplerTextureViewBindings)));
    _ = memset(@ptrCast(@alignCast(@as([*c]VkSampler, @ptrCast(@alignCast(&commandBuffer.*.computeSamplerBindings))))), 0, @sizeOf(@TypeOf(commandBuffer.*.computeSamplerBindings)));
    _ = memset(@ptrCast(@alignCast(@as([*c]VkImageView, @ptrCast(@alignCast(&commandBuffer.*.readOnlyComputeStorageTextureViewBindings))))), 0, @sizeOf(@TypeOf(commandBuffer.*.readOnlyComputeStorageTextureViewBindings)));
    _ = memset(@ptrCast(@alignCast(@as([*c]VkBuffer, @ptrCast(@alignCast(&commandBuffer.*.readOnlyComputeStorageBufferBindings))))), 0, @sizeOf(@TypeOf(commandBuffer.*.readOnlyComputeStorageBufferBindings)));
    _ = memset(@ptrCast(@alignCast(@as([*c][*c]VulkanTexture, @ptrCast(@alignCast(&commandBuffer.*.readOnlyComputeStorageTextures))))), 0, @sizeOf(@TypeOf(commandBuffer.*.readOnlyComputeStorageTextures)));
    _ = memset(@ptrCast(@alignCast(@as([*c][*c]VulkanBuffer, @ptrCast(@alignCast(&commandBuffer.*.readOnlyComputeStorageBuffers))))), 0, @sizeOf(@TypeOf(commandBuffer.*.readOnlyComputeStorageBuffers)));
    commandBuffer.*.autoReleaseFence = @"true" != 0;
    commandBuffer.*.swapchainRequested = @"false" != 0;
    commandBuffer.*.isDefrag = @as(c_int, 0) != 0;
    result = renderer.*.vkResetCommandBuffer.?(commandBuffer.*.commandBuffer, VK_COMMAND_BUFFER_RESET_RELEASE_RESOURCES_BIT);
    while (true) {
        if (result != VK_SUCCESS) {
            if (renderer.*.debugMode) {
                SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkResetCommandBuffer"))), VkErrorMessages(result));
            }
            _ = SDL_SetError_REAL("%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkResetCommandBuffer"))), VkErrorMessages(result));
            return null;
        }
        if (!false) break;
    }
    if (!VULKAN_INTERNAL_BeginCommandBuffer(renderer, commandBuffer)) {
        return null;
    }
    return @ptrCast(@alignCast(commandBuffer));
}
pub fn VULKAN_QueryFence(driverData: ?*SDL_GPURenderer, fence: ?*SDL_GPUFence) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var renderer: [*c]VulkanRenderer = @ptrCast(@alignCast(driverData));
    _ = &renderer;
    var result: VkResult = undefined;
    _ = &result;
    result = renderer.*.vkGetFenceStatus.?(renderer.*.logicalDevice, @as([*c]VulkanFenceHandle, @ptrCast(@alignCast(fence))).*.fence);
    if (result == VK_SUCCESS) {
        return @"true" != 0;
    } else if (result == VK_NOT_READY) {
        return @"false" != 0;
    } else {
        while (true) {
            while (true) {
                if (renderer.*.debugMode) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "vkGetFenceStatus: %s", VkErrorMessages(result));
                }
                _ = SDL_SetError_REAL("vkGetFenceStatus: %s", VkErrorMessages(result));
                if (!false) break;
            }
            return @"false" != 0;
        }
    }
    return undefined;
}
pub fn VULKAN_INTERNAL_ReturnFenceToPool(renderer: [*c]VulkanRenderer, fenceHandle: [*c]VulkanFenceHandle) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_LockMutex_REAL(renderer.*.fencePool.lock);
    while (true) {
        if ((renderer.*.fencePool.availableFenceCount +% @as(Uint32, 1)) >= renderer.*.fencePool.availableFenceCapacity) {
            renderer.*.fencePool.availableFenceCapacity = renderer.*.fencePool.availableFenceCapacity *% @as(Uint32, 2);
            renderer.*.fencePool.availableFences = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(renderer.*.fencePool.availableFences)), @sizeOf([*c]VulkanFenceHandle) *% @as(c_ulong, renderer.*.fencePool.availableFenceCapacity))));
        }
        if (!false) break;
    }
    renderer.*.fencePool.availableFences[renderer.*.fencePool.availableFenceCount] = fenceHandle;
    renderer.*.fencePool.availableFenceCount +%= 1;
    SDL_UnlockMutex_REAL(renderer.*.fencePool.lock);
}
pub fn VULKAN_ReleaseFence(driverData: ?*SDL_GPURenderer, fence: ?*SDL_GPUFence) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var handle: [*c]VulkanFenceHandle = @ptrCast(@alignCast(fence));
    _ = &handle;
    if (SDL_AddAtomicInt_REAL(&handle.*.referenceCount, -@as(c_int, 1)) == @as(c_int, 1)) {
        VULKAN_INTERNAL_ReturnFenceToPool(@ptrCast(@alignCast(driverData)), handle);
    }
}
pub fn VULKAN_INTERNAL_FetchWindowData(window: [*c]SDL_Window) callconv(.c) [*c]WindowData {
    @setEvalBranchQuota(100000);
    var properties: SDL_PropertiesID = SDL_GetWindowProperties_REAL(window);
    _ = &properties;
    return @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(properties, "SDL.internal.gpu.vulkan.data", null)));
}
pub fn VULKAN_INTERNAL_OnWindowResize(userdata: ?*anyopaque, e: [*c]SDL_Event) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var w: [*c]SDL_Window = @ptrCast(@alignCast(userdata));
    _ = &w;
    var data: [*c]WindowData = undefined;
    _ = &data;
    if ((e.*.type == @as(Uint32, SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED)) and (e.*.window.windowID == SDL_GetWindowID_REAL(w))) {
        data = VULKAN_INTERNAL_FetchWindowData(w);
        data.*.needsSwapchainRecreate = @"true" != 0;
        data.*.swapchainCreateWidth = @bitCast(@as(c_int, e.*.window.data1));
        data.*.swapchainCreateHeight = @bitCast(@as(c_int, e.*.window.data2));
    }
    return @"true" != 0;
}
pub fn VULKAN_SupportsSwapchainComposition(driverData: ?*SDL_GPURenderer, window: [*c]SDL_Window, swapchainComposition: SDL_GPUSwapchainComposition) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var renderer: [*c]VulkanRenderer = @ptrCast(@alignCast(driverData));
    _ = &renderer;
    var windowData: [*c]WindowData = VULKAN_INTERNAL_FetchWindowData(window);
    _ = &windowData;
    var surface: VkSurfaceKHR = undefined;
    _ = &surface;
    var supportDetails: SwapchainSupportDetails = undefined;
    _ = &supportDetails;
    var result: bool = @"false" != 0;
    _ = &result;
    if (@as(?*anyopaque, @ptrCast(@alignCast(windowData))) == @as(?*anyopaque, null)) {
        while (true) {
            while (true) {
                if (renderer.*.debugMode) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s", @as([*c]u8, @as([*c]u8, @constCast("Must claim window before querying swapchain composition support!"))));
                }
                _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("Must claim window before querying swapchain composition support!"))));
                if (!false) break;
            }
            return @"false" != 0;
        }
    }
    surface = windowData.*.surface;
    if (!(surface != null)) {
        while (true) {
            while (true) {
                if (renderer.*.debugMode) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s", @as([*c]u8, @as([*c]u8, @constCast("Window has no Vulkan surface"))));
                }
                _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("Window has no Vulkan surface"))));
                if (!false) break;
            }
            return @"false" != 0;
        }
    }
    if (VULKAN_INTERNAL_QuerySwapchainSupport(renderer, renderer.*.physicalDevice, surface, &supportDetails)) {
        result = VULKAN_INTERNAL_VerifySwapSurfaceFormat(SwapchainCompositionToFormat[swapchainComposition], SwapchainCompositionToColorSpace[swapchainComposition], supportDetails.formats, supportDetails.formatsLength);
        if (!result) {
            result = VULKAN_INTERNAL_VerifySwapSurfaceFormat(SwapchainCompositionToFallbackFormat[swapchainComposition], SwapchainCompositionToColorSpace[swapchainComposition], supportDetails.formats, supportDetails.formatsLength);
        }
        SDL_free_REAL(@ptrCast(@alignCast(supportDetails.formats)));
        SDL_free_REAL(@ptrCast(@alignCast(supportDetails.presentModes)));
    }
    return result;
}
pub fn VULKAN_SupportsPresentMode(driverData: ?*SDL_GPURenderer, window: [*c]SDL_Window, presentMode: SDL_GPUPresentMode) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var renderer: [*c]VulkanRenderer = @ptrCast(@alignCast(driverData));
    _ = &renderer;
    var windowData: [*c]WindowData = VULKAN_INTERNAL_FetchWindowData(window);
    _ = &windowData;
    var surface: VkSurfaceKHR = undefined;
    _ = &surface;
    var supportDetails: SwapchainSupportDetails = undefined;
    _ = &supportDetails;
    var result: bool = @"false" != 0;
    _ = &result;
    if (@as(?*anyopaque, @ptrCast(@alignCast(windowData))) == @as(?*anyopaque, null)) {
        while (true) {
            while (true) {
                if (renderer.*.debugMode) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s", @as([*c]u8, @as([*c]u8, @constCast("Must claim window before querying present mode support!"))));
                }
                _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("Must claim window before querying present mode support!"))));
                if (!false) break;
            }
            return @"false" != 0;
        }
    }
    surface = windowData.*.surface;
    if (!(surface != null)) {
        while (true) {
            while (true) {
                if (renderer.*.debugMode) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s", @as([*c]u8, @as([*c]u8, @constCast("Window has no Vulkan surface"))));
                }
                _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("Window has no Vulkan surface"))));
                if (!false) break;
            }
            return @"false" != 0;
        }
    }
    if (VULKAN_INTERNAL_QuerySwapchainSupport(renderer, renderer.*.physicalDevice, surface, &supportDetails)) {
        result = VULKAN_INTERNAL_VerifySwapPresentMode(SDLToVK_PresentMode[presentMode], supportDetails.presentModes, supportDetails.presentModesLength);
        SDL_free_REAL(@ptrCast(@alignCast(supportDetails.formats)));
        SDL_free_REAL(@ptrCast(@alignCast(supportDetails.presentModes)));
    }
    return result;
}
pub fn VULKAN_ClaimWindow(driverData: ?*SDL_GPURenderer, window: [*c]SDL_Window) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var renderer: [*c]VulkanRenderer = @ptrCast(@alignCast(driverData));
    _ = &renderer;
    var windowData: [*c]WindowData = VULKAN_INTERNAL_FetchWindowData(window);
    _ = &windowData;
    if (@as(?*anyopaque, @ptrCast(@alignCast(windowData))) == @as(?*anyopaque, null)) {
        windowData = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(WindowData))));
        if (!(windowData != null)) {
            return @"false" != 0;
        }
        windowData.*.window = window;
        windowData.*.renderer = renderer;
        windowData.*.refcount = 1;
        windowData.*.presentMode = SDL_GPU_PRESENTMODE_VSYNC;
        windowData.*.swapchainComposition = SDL_GPU_SWAPCHAINCOMPOSITION_SDR;
        var w: c_int = undefined;
        _ = &w;
        var h: c_int = undefined;
        _ = &h;
        _ = SDL_SyncWindow_REAL(window);
        _ = SDL_GetWindowSizeInPixels_REAL(window, &w, &h);
        windowData.*.swapchainCreateWidth = @bitCast(@as(c_int, w));
        windowData.*.swapchainCreateHeight = @bitCast(@as(c_int, h));
        var videoDevice: [*c]SDL_VideoDevice = SDL_GetVideoDevice();
        _ = &videoDevice;
        if (!(videoDevice != null)) {
            SDL_free_REAL(@ptrCast(@alignCast(windowData)));
            return SDL_SetError_REAL("No video device found");
        }
        if (!(videoDevice.*.Vulkan_CreateSurface != null)) {
            SDL_free_REAL(@ptrCast(@alignCast(windowData)));
            return SDL_SetError_REAL("Video device does not implement Vulkan_CreateSurface");
        }
        if (!videoDevice.*.Vulkan_CreateSurface.?(videoDevice, windowData.*.window, renderer.*.instance, null, &windowData.*.surface)) {
            SDL_free_REAL(@ptrCast(@alignCast(windowData)));
            return @"false" != 0;
        }
        var createSwapchainResult: Uint32 = VULKAN_INTERNAL_CreateSwapchain(renderer, windowData);
        _ = &createSwapchainResult;
        if (createSwapchainResult == @as(Uint32, 1)) {
            _ = SDL_SetPointerProperty_REAL(SDL_GetWindowProperties_REAL(window), "SDL.internal.gpu.vulkan.data", @ptrCast(@alignCast(windowData)));
            SDL_LockMutex_REAL(renderer.*.windowLock);
            if (renderer.*.claimedWindowCount >= renderer.*.claimedWindowCapacity) {
                renderer.*.claimedWindowCapacity *%= 2;
                renderer.*.claimedWindows = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(renderer.*.claimedWindows)), @as(c_ulong, renderer.*.claimedWindowCapacity) *% @sizeOf([*c]WindowData))));
            }
            renderer.*.claimedWindows[renderer.*.claimedWindowCount] = windowData;
            renderer.*.claimedWindowCount +%= 1;
            SDL_UnlockMutex_REAL(renderer.*.windowLock);
            SDL_AddWindowEventWatch(SDL_WINDOW_EVENT_WATCH_NORMAL, VULKAN_INTERNAL_OnWindowResize, @ptrCast(@alignCast(window)));
            return @"true" != 0;
        } else if (createSwapchainResult == @as(Uint32, VULKAN_INTERNAL_TRY_AGAIN)) {
            windowData.*.needsSwapchainRecreate = @"true" != 0;
            return @"true" != 0;
        } else {
            renderer.*.vkDestroySurfaceKHR.?(renderer.*.instance, windowData.*.surface, null);
            SDL_free_REAL(@ptrCast(@alignCast(windowData)));
            return @"false" != 0;
        }
    } else if (windowData.*.renderer == renderer) {
        windowData.*.refcount += 1;
        return @"true" != 0;
    } else {
        while (true) {
            while (true) {
                if (renderer.*.debugMode) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s", @as([*c]u8, @as([*c]u8, @constCast("Window already claimed"))));
                }
                _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("Window already claimed"))));
                if (!false) break;
            }
            return @"false" != 0;
        }
    }
    return undefined;
}
pub fn VULKAN_ReleaseWindow(driverData: ?*SDL_GPURenderer, window: [*c]SDL_Window) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var renderer: [*c]VulkanRenderer = @ptrCast(@alignCast(driverData));
    _ = &renderer;
    var windowData: [*c]WindowData = VULKAN_INTERNAL_FetchWindowData(window);
    _ = &windowData;
    var i: Uint32 = undefined;
    _ = &i;
    if (@as(?*anyopaque, @ptrCast(@alignCast(windowData))) == @as(?*anyopaque, null)) {
        return;
    }
    if (windowData.*.renderer != renderer) {
        _ = SDL_SetError_REAL("Window not claimed by this device");
        return;
    }
    if (windowData.*.refcount > @as(c_int, 1)) {
        windowData.*.refcount -= 1;
        return;
    }
    _ = VULKAN_Wait(driverData);
    {
        i = 0;
        while (i < @as(Uint32, MAX_FRAMES_IN_FLIGHT)) : (i +%= 1) {
            if (@as(?*anyopaque, @ptrCast(@alignCast(windowData.*.inFlightFences[i]))) != @as(?*anyopaque, null)) {
                VULKAN_ReleaseFence(driverData, windowData.*.inFlightFences[i]);
            }
        }
    }
    VULKAN_INTERNAL_DestroySwapchain(@ptrCast(@alignCast(driverData)), windowData);
    renderer.*.vkDestroySurfaceKHR.?(renderer.*.instance, windowData.*.surface, null);
    windowData.*.surface = null;
    SDL_LockMutex_REAL(renderer.*.windowLock);
    {
        i = 0;
        while (i < renderer.*.claimedWindowCount) : (i +%= 1) {
            if (renderer.*.claimedWindows[i].*.window == window) {
                renderer.*.claimedWindows[i] = renderer.*.claimedWindows[renderer.*.claimedWindowCount -% @as(Uint32, 1)];
                renderer.*.claimedWindowCount -%= 1;
                break;
            }
        }
    }
    SDL_UnlockMutex_REAL(renderer.*.windowLock);
    SDL_free_REAL(@ptrCast(@alignCast(windowData)));
    _ = SDL_ClearProperty_REAL(SDL_GetWindowProperties_REAL(window), "SDL.internal.gpu.vulkan.data");
    SDL_RemoveWindowEventWatch(SDL_WINDOW_EVENT_WATCH_NORMAL, VULKAN_INTERNAL_OnWindowResize, @ptrCast(@alignCast(window)));
}
pub fn VULKAN_INTERNAL_RecreateSwapchain(renderer: [*c]VulkanRenderer, windowData: [*c]WindowData) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    var i: Uint32 = undefined;
    _ = &i;
    if (!VULKAN_Wait(@ptrCast(@alignCast(renderer)))) {
        return @"false";
    }
    {
        i = 0;
        while (i < @as(Uint32, MAX_FRAMES_IN_FLIGHT)) : (i +%= 1) {
            if (@as(?*anyopaque, @ptrCast(@alignCast(windowData.*.inFlightFences[i]))) != @as(?*anyopaque, null)) {
                VULKAN_ReleaseFence(@ptrCast(@alignCast(renderer)), windowData.*.inFlightFences[i]);
                windowData.*.inFlightFences[i] = null;
            }
        }
    }
    VULKAN_INTERNAL_DestroySwapchainImage(renderer, windowData);
    return VULKAN_INTERNAL_CreateSwapchain(renderer, windowData);
}
pub fn VULKAN_WaitForSwapchain(driverData: ?*SDL_GPURenderer, window: [*c]SDL_Window) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var renderer: [*c]VulkanRenderer = @ptrCast(@alignCast(driverData));
    _ = &renderer;
    var windowData: [*c]WindowData = VULKAN_INTERNAL_FetchWindowData(window);
    _ = &windowData;
    if (@as(?*anyopaque, @ptrCast(@alignCast(windowData))) == @as(?*anyopaque, null)) {
        while (true) {
            while (true) {
                if (renderer.*.debugMode) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s", @as([*c]u8, @as([*c]u8, @constCast("Cannot wait for a swapchain from an unclaimed window!"))));
                }
                _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("Cannot wait for a swapchain from an unclaimed window!"))));
                if (!false) break;
            }
            return @"false" != 0;
        }
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(windowData.*.inFlightFences[windowData.*.frameCounter]))) != @as(?*anyopaque, null)) {
        if (!VULKAN_WaitForFences(driverData, @"true" != 0, &windowData.*.inFlightFences[windowData.*.frameCounter], 1)) {
            return @"false" != 0;
        }
    }
    return @"true" != 0;
}
pub fn VULKAN_INTERNAL_AcquireSwapchainTexture(block: bool, commandBuffer: ?*SDL_GPUCommandBuffer, window: [*c]SDL_Window, swapchainTexture: [*c]?*SDL_GPUTexture, swapchainTextureWidth: [*c]Uint32, swapchainTextureHeight: [*c]Uint32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [39:0]u8 = "VULKAN_INTERNAL_AcquireSwapchainTexture".*;
    };
    _ = &static_local___func__;
    var vulkanCommandBuffer: [*c]VulkanCommandBuffer = @ptrCast(@alignCast(commandBuffer));
    _ = &vulkanCommandBuffer;
    var renderer: [*c]VulkanRenderer = vulkanCommandBuffer.*.renderer;
    _ = &renderer;
    var swapchainImageIndex: Uint32 = undefined;
    _ = &swapchainImageIndex;
    var windowData: [*c]WindowData = undefined;
    _ = &windowData;
    var acquireResult: VkResult = VK_SUCCESS;
    _ = &acquireResult;
    var swapchainTextureContainer: [*c]VulkanTextureContainer = null;
    _ = &swapchainTextureContainer;
    var presentData: [*c]VulkanPresentData = undefined;
    _ = &presentData;
    swapchainTexture.* = null;
    if (swapchainTextureWidth != null) {
        swapchainTextureWidth.* = 0;
    }
    if (swapchainTextureHeight != null) {
        swapchainTextureHeight.* = 0;
    }
    windowData = VULKAN_INTERNAL_FetchWindowData(window);
    if (@as(?*anyopaque, @ptrCast(@alignCast(windowData))) == @as(?*anyopaque, null)) {
        while (true) {
            while (true) {
                if (renderer.*.debugMode) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s", @as([*c]u8, @as([*c]u8, @constCast("Cannot acquire a swapchain texture from an unclaimed window!"))));
                }
                _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("Cannot acquire a swapchain texture from an unclaimed window!"))));
                if (!false) break;
            }
            return @"false" != 0;
        }
    }
    vulkanCommandBuffer.*.swapchainRequested = @"true" != 0;
    if ((window.*.flags & @as(c_ulong, 8)) != 0) {
        return @"true" != 0;
    }
    if (windowData.*.needsSurfaceRecreate) {
        var videoDevice: [*c]SDL_VideoDevice = SDL_GetVideoDevice();
        _ = &videoDevice;
        while (true) {
            while (!(videoDevice != null)) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "videoDevice",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu_vulkan.c", 10194);
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
            while (!(videoDevice.*.Vulkan_CreateSurface != null)) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "videoDevice->Vulkan_CreateSurface",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu_vulkan.c", 10195);
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
        renderer.*.vkDestroySurfaceKHR.?(renderer.*.instance, windowData.*.surface, null);
        if (!videoDevice.*.Vulkan_CreateSurface.?(videoDevice, windowData.*.window, renderer.*.instance, null, &windowData.*.surface)) {
            while (true) {
                while (true) {
                    if (renderer.*.debugMode) {
                        SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s", @as([*c]u8, @as([*c]u8, @constCast("Failed to recreate Vulkan surface!"))));
                    }
                    _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("Failed to recreate Vulkan surface!"))));
                    if (!false) break;
                }
                return @"false" != 0;
            }
        }
    }
    if (windowData.*.needsSwapchainRecreate) {
        var recreateSwapchainResult: Uint32 = VULKAN_INTERNAL_RecreateSwapchain(renderer, windowData);
        _ = &recreateSwapchainResult;
        if (!(recreateSwapchainResult != 0)) {
            return @"false" != 0;
        } else if (recreateSwapchainResult == @as(Uint32, VULKAN_INTERNAL_TRY_AGAIN)) {
            if (@as(?*anyopaque, @ptrCast(@alignCast(windowData.*.inFlightFences[windowData.*.frameCounter]))) != @as(?*anyopaque, null)) {
                VULKAN_ReleaseFence(@ptrCast(@alignCast(renderer)), windowData.*.inFlightFences[windowData.*.frameCounter]);
                windowData.*.inFlightFences[windowData.*.frameCounter] = null;
            }
            return @"true" != 0;
        }
        windowData.*.needsSurfaceRecreate = @"false" != 0;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(windowData.*.inFlightFences[windowData.*.frameCounter]))) != @as(?*anyopaque, null)) {
        if (block) {
            if (!VULKAN_WaitForFences(@ptrCast(@alignCast(renderer)), @"true" != 0, &windowData.*.inFlightFences[windowData.*.frameCounter], 1)) {
                return @"false" != 0;
            }
        } else {
            if (!VULKAN_QueryFence(@ptrCast(@alignCast(renderer)), windowData.*.inFlightFences[windowData.*.frameCounter])) {
                return @"true" != 0;
            }
        }
        VULKAN_ReleaseFence(@ptrCast(@alignCast(renderer)), windowData.*.inFlightFences[windowData.*.frameCounter]);
        windowData.*.inFlightFences[windowData.*.frameCounter] = null;
    }
    while (true) {
        acquireResult = renderer.*.vkAcquireNextImageKHR.?(renderer.*.logicalDevice, windowData.*.swapchain, 18446744073709551615, windowData.*.imageAvailableSemaphore[windowData.*.frameCounter], null, &swapchainImageIndex);
        if ((acquireResult == VK_SUCCESS) or (acquireResult == VK_SUBOPTIMAL_KHR)) {
            break;
        }
        if (acquireResult == VK_ERROR_SURFACE_LOST_KHR) {
            windowData.*.needsSurfaceRecreate = @"true" != 0;
            windowData.*.needsSwapchainRecreate = @"true" != 0;
            return @"true" != 0;
        }
        var recreateSwapchainResult: Uint32 = VULKAN_INTERNAL_RecreateSwapchain(renderer, windowData);
        _ = &recreateSwapchainResult;
        if (!(recreateSwapchainResult != 0)) {
            return @"false" != 0;
        } else if (recreateSwapchainResult == @as(Uint32, VULKAN_INTERNAL_TRY_AGAIN)) {
            return @"true" != 0;
        }
    }
    if (swapchainTextureWidth != null) {
        swapchainTextureWidth.* = windowData.*.width;
    }
    if (swapchainTextureHeight != null) {
        swapchainTextureHeight.* = windowData.*.height;
    }
    swapchainTextureContainer = &windowData.*.textureContainers[swapchainImageIndex];
    var imageBarrier: VkImageMemoryBarrier = undefined;
    _ = &imageBarrier;
    imageBarrier.sType = VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER;
    imageBarrier.pNext = null;
    imageBarrier.srcAccessMask = 0;
    imageBarrier.dstAccessMask = VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT;
    imageBarrier.oldLayout = VK_IMAGE_LAYOUT_UNDEFINED;
    imageBarrier.newLayout = VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL;
    imageBarrier.srcQueueFamilyIndex = ~@as(c_uint, 0);
    imageBarrier.dstQueueFamilyIndex = ~@as(c_uint, 0);
    imageBarrier.image = swapchainTextureContainer.*.activeTexture.*.image;
    imageBarrier.subresourceRange.aspectMask = VK_IMAGE_ASPECT_COLOR_BIT;
    imageBarrier.subresourceRange.baseMipLevel = 0;
    imageBarrier.subresourceRange.levelCount = 1;
    imageBarrier.subresourceRange.baseArrayLayer = 0;
    imageBarrier.subresourceRange.layerCount = 1;
    renderer.*.vkCmdPipelineBarrier.?(vulkanCommandBuffer.*.commandBuffer, VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT, VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT, 0, 0, null, 0, null, 1, &imageBarrier);
    if (vulkanCommandBuffer.*.presentDataCount == vulkanCommandBuffer.*.presentDataCapacity) {
        vulkanCommandBuffer.*.presentDataCapacity +%= 1;
        vulkanCommandBuffer.*.presentDatas = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(vulkanCommandBuffer.*.presentDatas)), @as(c_ulong, vulkanCommandBuffer.*.presentDataCapacity) *% @sizeOf(VulkanPresentData))));
    }
    presentData = &vulkanCommandBuffer.*.presentDatas[vulkanCommandBuffer.*.presentDataCount];
    vulkanCommandBuffer.*.presentDataCount +%= 1;
    presentData.*.windowData = windowData;
    presentData.*.swapchainImageIndex = swapchainImageIndex;
    if (vulkanCommandBuffer.*.waitSemaphoreCount == vulkanCommandBuffer.*.waitSemaphoreCapacity) {
        vulkanCommandBuffer.*.waitSemaphoreCapacity +%= 1;
        vulkanCommandBuffer.*.waitSemaphores = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(vulkanCommandBuffer.*.waitSemaphores)), @as(c_ulong, vulkanCommandBuffer.*.waitSemaphoreCapacity) *% @sizeOf(VkSemaphore))));
    }
    vulkanCommandBuffer.*.waitSemaphores[vulkanCommandBuffer.*.waitSemaphoreCount] = windowData.*.imageAvailableSemaphore[windowData.*.frameCounter];
    vulkanCommandBuffer.*.waitSemaphoreCount +%= 1;
    if (vulkanCommandBuffer.*.signalSemaphoreCount == vulkanCommandBuffer.*.signalSemaphoreCapacity) {
        vulkanCommandBuffer.*.signalSemaphoreCapacity +%= 1;
        vulkanCommandBuffer.*.signalSemaphores = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(vulkanCommandBuffer.*.signalSemaphores)), @as(c_ulong, vulkanCommandBuffer.*.signalSemaphoreCapacity) *% @sizeOf(VkSemaphore))));
    }
    vulkanCommandBuffer.*.signalSemaphores[vulkanCommandBuffer.*.signalSemaphoreCount] = windowData.*.renderFinishedSemaphore[swapchainImageIndex];
    vulkanCommandBuffer.*.signalSemaphoreCount +%= 1;
    swapchainTexture.* = @ptrCast(@alignCast(swapchainTextureContainer));
    return @"true" != 0;
}
pub fn VULKAN_AcquireSwapchainTexture(command_buffer: ?*SDL_GPUCommandBuffer, window: [*c]SDL_Window, swapchain_texture: [*c]?*SDL_GPUTexture, swapchain_texture_width: [*c]Uint32, swapchain_texture_height: [*c]Uint32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return VULKAN_INTERNAL_AcquireSwapchainTexture(@"false" != 0, command_buffer, window, swapchain_texture, swapchain_texture_width, swapchain_texture_height);
}
pub fn VULKAN_WaitAndAcquireSwapchainTexture(command_buffer: ?*SDL_GPUCommandBuffer, window: [*c]SDL_Window, swapchain_texture: [*c]?*SDL_GPUTexture, swapchain_texture_width: [*c]Uint32, swapchain_texture_height: [*c]Uint32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return VULKAN_INTERNAL_AcquireSwapchainTexture(@"true" != 0, command_buffer, window, swapchain_texture, swapchain_texture_width, swapchain_texture_height);
}
pub fn VULKAN_GetSwapchainTextureFormat(driverData: ?*SDL_GPURenderer, window: [*c]SDL_Window) callconv(.c) SDL_GPUTextureFormat {
    @setEvalBranchQuota(100000);
    var renderer: [*c]VulkanRenderer = @ptrCast(@alignCast(driverData));
    _ = &renderer;
    var windowData: [*c]WindowData = VULKAN_INTERNAL_FetchWindowData(window);
    _ = &windowData;
    if (@as(?*anyopaque, @ptrCast(@alignCast(windowData))) == @as(?*anyopaque, null)) {
        while (true) {
            while (true) {
                if (renderer.*.debugMode) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s", @as([*c]u8, @as([*c]u8, @constCast("Cannot get swapchain format, window has not been claimed!"))));
                }
                _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("Cannot get swapchain format, window has not been claimed!"))));
                if (!false) break;
            }
            return SDL_GPU_TEXTUREFORMAT_INVALID;
        }
    }
    return SwapchainCompositionToSDLFormat(windowData.*.swapchainComposition, windowData.*.usingFallbackFormat);
}
pub fn VULKAN_SetSwapchainParameters(driverData: ?*SDL_GPURenderer, window: [*c]SDL_Window, swapchainComposition: SDL_GPUSwapchainComposition, presentMode: SDL_GPUPresentMode) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var renderer: [*c]VulkanRenderer = @ptrCast(@alignCast(driverData));
    _ = &renderer;
    var windowData: [*c]WindowData = VULKAN_INTERNAL_FetchWindowData(window);
    _ = &windowData;
    if (@as(?*anyopaque, @ptrCast(@alignCast(windowData))) == @as(?*anyopaque, null)) {
        while (true) {
            while (true) {
                if (renderer.*.debugMode) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s", @as([*c]u8, @as([*c]u8, @constCast("Cannot set swapchain parameters on unclaimed window!"))));
                }
                _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("Cannot set swapchain parameters on unclaimed window!"))));
                if (!false) break;
            }
            return @"false" != 0;
        }
    }
    if (!VULKAN_SupportsSwapchainComposition(driverData, window, swapchainComposition)) {
        while (true) {
            while (true) {
                if (renderer.*.debugMode) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s", @as([*c]u8, @as([*c]u8, @constCast("Swapchain composition not supported!"))));
                }
                _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("Swapchain composition not supported!"))));
                if (!false) break;
            }
            return @"false" != 0;
        }
    }
    if (!VULKAN_SupportsPresentMode(driverData, window, presentMode)) {
        while (true) {
            while (true) {
                if (renderer.*.debugMode) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s", @as([*c]u8, @as([*c]u8, @constCast("Present mode not supported!"))));
                }
                _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("Present mode not supported!"))));
                if (!false) break;
            }
            return @"false" != 0;
        }
    }
    windowData.*.presentMode = presentMode;
    windowData.*.swapchainComposition = swapchainComposition;
    var recreateSwapchainResult: Uint32 = VULKAN_INTERNAL_RecreateSwapchain(renderer, windowData);
    _ = &recreateSwapchainResult;
    if (!(recreateSwapchainResult != 0)) {
        return @"false" != 0;
    } else if (recreateSwapchainResult == @as(Uint32, VULKAN_INTERNAL_TRY_AGAIN)) {
        windowData.*.needsSwapchainRecreate = @"true" != 0;
        return @"true" != 0;
    }
    return @"true" != 0;
}
pub fn VULKAN_SetAllowedFramesInFlight(driverData: ?*SDL_GPURenderer, allowedFramesInFlight: Uint32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var renderer: [*c]VulkanRenderer = @ptrCast(@alignCast(driverData));
    _ = &renderer;
    renderer.*.allowedFramesInFlight = allowedFramesInFlight;
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < renderer.*.claimedWindowCount) : (i +%= 1) {
            var windowData: [*c]WindowData = renderer.*.claimedWindows[i];
            _ = &windowData;
            var recreateResult: Uint32 = VULKAN_INTERNAL_RecreateSwapchain(renderer, windowData);
            _ = &recreateResult;
            if (!(recreateResult != 0)) {
                return @"false" != 0;
            } else if (recreateResult == @as(Uint32, VULKAN_INTERNAL_TRY_AGAIN)) {
                windowData.*.needsSwapchainRecreate = @"true" != 0;
            }
        }
    }
    return @"true" != 0;
}
pub fn VULKAN_INTERNAL_AcquireFenceFromPool(renderer: [*c]VulkanRenderer) callconv(.c) [*c]VulkanFenceHandle {
    @setEvalBranchQuota(100000);
    var handle: [*c]VulkanFenceHandle = undefined;
    _ = &handle;
    var fenceCreateInfo: VkFenceCreateInfo = undefined;
    _ = &fenceCreateInfo;
    var fence: VkFence = undefined;
    _ = &fence;
    var vulkanResult: VkResult = undefined;
    _ = &vulkanResult;
    if (renderer.*.fencePool.availableFenceCount == @as(Uint32, 0)) {
        fenceCreateInfo.sType = VK_STRUCTURE_TYPE_FENCE_CREATE_INFO;
        fenceCreateInfo.pNext = null;
        fenceCreateInfo.flags = 0;
        vulkanResult = renderer.*.vkCreateFence.?(renderer.*.logicalDevice, &fenceCreateInfo, null, &fence);
        while (true) {
            if (vulkanResult != VK_SUCCESS) {
                if (renderer.*.debugMode) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateFence"))), VkErrorMessages(vulkanResult));
                }
                _ = SDL_SetError_REAL("%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateFence"))), VkErrorMessages(vulkanResult));
                return null;
            }
            if (!false) break;
        }
        handle = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(VulkanFenceHandle))));
        handle.*.fence = fence;
        _ = SDL_SetAtomicInt_REAL(&handle.*.referenceCount, 0);
        return handle;
    }
    SDL_LockMutex_REAL(renderer.*.fencePool.lock);
    handle = renderer.*.fencePool.availableFences[renderer.*.fencePool.availableFenceCount -% @as(Uint32, 1)];
    renderer.*.fencePool.availableFenceCount -%= 1;
    vulkanResult = renderer.*.vkResetFences.?(renderer.*.logicalDevice, 1, &handle.*.fence);
    SDL_UnlockMutex_REAL(renderer.*.fencePool.lock);
    while (true) {
        if (vulkanResult != VK_SUCCESS) {
            if (renderer.*.debugMode) {
                SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkResetFences"))), VkErrorMessages(vulkanResult));
            }
            _ = SDL_SetError_REAL("%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkResetFences"))), VkErrorMessages(vulkanResult));
            return null;
        }
        if (!false) break;
    }
    return handle;
}
pub fn VULKAN_INTERNAL_PerformPendingDestroys(renderer: [*c]VulkanRenderer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_LockMutex_REAL(renderer.*.disposeLock);
    {
        var i: Sint32 = @bitCast(@as(c_uint, @truncate(renderer.*.texturesToDestroyCount -% @as(Uint32, 1))));
        _ = &i;
        while (i >= @as(c_int, 0)) : (i -= 1) {
            if (SDL_GetAtomicInt_REAL(&renderer.*.texturesToDestroy[@bitCast(@as(isize, @intCast(i)))].*.referenceCount) == @as(c_int, 0)) {
                VULKAN_INTERNAL_DestroyTexture(renderer, renderer.*.texturesToDestroy[@bitCast(@as(isize, @intCast(i)))]);
                renderer.*.texturesToDestroy[@bitCast(@as(isize, @intCast(i)))] = renderer.*.texturesToDestroy[renderer.*.texturesToDestroyCount -% @as(Uint32, 1)];
                renderer.*.texturesToDestroyCount -%= 1;
            }
        }
    }
    {
        var i: Sint32 = @bitCast(@as(c_uint, @truncate(renderer.*.buffersToDestroyCount -% @as(Uint32, 1))));
        _ = &i;
        while (i >= @as(c_int, 0)) : (i -= 1) {
            if (SDL_GetAtomicInt_REAL(&renderer.*.buffersToDestroy[@bitCast(@as(isize, @intCast(i)))].*.referenceCount) == @as(c_int, 0)) {
                VULKAN_INTERNAL_DestroyBuffer(renderer, renderer.*.buffersToDestroy[@bitCast(@as(isize, @intCast(i)))]);
                renderer.*.buffersToDestroy[@bitCast(@as(isize, @intCast(i)))] = renderer.*.buffersToDestroy[renderer.*.buffersToDestroyCount -% @as(Uint32, 1)];
                renderer.*.buffersToDestroyCount -%= 1;
            }
        }
    }
    {
        var i: Sint32 = @bitCast(@as(c_uint, @truncate(renderer.*.graphicsPipelinesToDestroyCount -% @as(Uint32, 1))));
        _ = &i;
        while (i >= @as(c_int, 0)) : (i -= 1) {
            if (SDL_GetAtomicInt_REAL(&renderer.*.graphicsPipelinesToDestroy[@bitCast(@as(isize, @intCast(i)))].*.referenceCount) == @as(c_int, 0)) {
                VULKAN_INTERNAL_DestroyGraphicsPipeline(renderer, renderer.*.graphicsPipelinesToDestroy[@bitCast(@as(isize, @intCast(i)))]);
                renderer.*.graphicsPipelinesToDestroy[@bitCast(@as(isize, @intCast(i)))] = renderer.*.graphicsPipelinesToDestroy[renderer.*.graphicsPipelinesToDestroyCount -% @as(Uint32, 1)];
                renderer.*.graphicsPipelinesToDestroyCount -%= 1;
            }
        }
    }
    {
        var i: Sint32 = @bitCast(@as(c_uint, @truncate(renderer.*.computePipelinesToDestroyCount -% @as(Uint32, 1))));
        _ = &i;
        while (i >= @as(c_int, 0)) : (i -= 1) {
            if (SDL_GetAtomicInt_REAL(&renderer.*.computePipelinesToDestroy[@bitCast(@as(isize, @intCast(i)))].*.referenceCount) == @as(c_int, 0)) {
                VULKAN_INTERNAL_DestroyComputePipeline(renderer, renderer.*.computePipelinesToDestroy[@bitCast(@as(isize, @intCast(i)))]);
                renderer.*.computePipelinesToDestroy[@bitCast(@as(isize, @intCast(i)))] = renderer.*.computePipelinesToDestroy[renderer.*.computePipelinesToDestroyCount -% @as(Uint32, 1)];
                renderer.*.computePipelinesToDestroyCount -%= 1;
            }
        }
    }
    {
        var i: Sint32 = @bitCast(@as(c_uint, @truncate(renderer.*.shadersToDestroyCount -% @as(Uint32, 1))));
        _ = &i;
        while (i >= @as(c_int, 0)) : (i -= 1) {
            if (SDL_GetAtomicInt_REAL(&renderer.*.shadersToDestroy[@bitCast(@as(isize, @intCast(i)))].*.referenceCount) == @as(c_int, 0)) {
                VULKAN_INTERNAL_DestroyShader(renderer, renderer.*.shadersToDestroy[@bitCast(@as(isize, @intCast(i)))]);
                renderer.*.shadersToDestroy[@bitCast(@as(isize, @intCast(i)))] = renderer.*.shadersToDestroy[renderer.*.shadersToDestroyCount -% @as(Uint32, 1)];
                renderer.*.shadersToDestroyCount -%= 1;
            }
        }
    }
    {
        var i: Sint32 = @bitCast(@as(c_uint, @truncate(renderer.*.samplersToDestroyCount -% @as(Uint32, 1))));
        _ = &i;
        while (i >= @as(c_int, 0)) : (i -= 1) {
            if (SDL_GetAtomicInt_REAL(&renderer.*.samplersToDestroy[@bitCast(@as(isize, @intCast(i)))].*.referenceCount) == @as(c_int, 0)) {
                VULKAN_INTERNAL_DestroySampler(renderer, renderer.*.samplersToDestroy[@bitCast(@as(isize, @intCast(i)))]);
                renderer.*.samplersToDestroy[@bitCast(@as(isize, @intCast(i)))] = renderer.*.samplersToDestroy[renderer.*.samplersToDestroyCount -% @as(Uint32, 1)];
                renderer.*.samplersToDestroyCount -%= 1;
            }
        }
    }
    {
        var i: Sint32 = @bitCast(@as(c_uint, @truncate(renderer.*.framebuffersToDestroyCount -% @as(Uint32, 1))));
        _ = &i;
        while (i >= @as(c_int, 0)) : (i -= 1) {
            if (SDL_GetAtomicInt_REAL(&renderer.*.framebuffersToDestroy[@bitCast(@as(isize, @intCast(i)))].*.referenceCount) == @as(c_int, 0)) {
                VULKAN_INTERNAL_DestroyFramebuffer(renderer, renderer.*.framebuffersToDestroy[@bitCast(@as(isize, @intCast(i)))]);
                renderer.*.framebuffersToDestroy[@bitCast(@as(isize, @intCast(i)))] = renderer.*.framebuffersToDestroy[renderer.*.framebuffersToDestroyCount -% @as(Uint32, 1)];
                renderer.*.framebuffersToDestroyCount -%= 1;
            }
        }
    }
    SDL_UnlockMutex_REAL(renderer.*.disposeLock);
}
pub fn VULKAN_INTERNAL_CleanCommandBuffer(renderer: [*c]VulkanRenderer, commandBuffer: [*c]VulkanCommandBuffer, cancel: bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (commandBuffer.*.autoReleaseFence) {
        VULKAN_ReleaseFence(@ptrCast(@alignCast(renderer)), @ptrCast(@alignCast(commandBuffer.*.inFlightFence)));
        commandBuffer.*.inFlightFence = null;
    }
    SDL_LockMutex_REAL(renderer.*.acquireUniformBufferLock);
    {
        var i: Sint32 = 0;
        _ = &i;
        while (i < commandBuffer.*.usedUniformBufferCount) : (i += 1) {
            VULKAN_INTERNAL_ReturnUniformBufferToPool(renderer, commandBuffer.*.usedUniformBuffers[@bitCast(@as(isize, @intCast(i)))]);
        }
    }
    commandBuffer.*.usedUniformBufferCount = 0;
    SDL_UnlockMutex_REAL(renderer.*.acquireUniformBufferLock);
    {
        var i: Sint32 = 0;
        _ = &i;
        while (i < commandBuffer.*.usedBufferCount) : (i += 1) {
            _ = SDL_AddAtomicInt_REAL(&commandBuffer.*.usedBuffers[@bitCast(@as(isize, @intCast(i)))].*.referenceCount, -@as(c_int, 1)) == @as(c_int, 1);
        }
    }
    commandBuffer.*.usedBufferCount = 0;
    {
        var i: Sint32 = 0;
        _ = &i;
        while (i < commandBuffer.*.buffersUsedInPendingTransfersCount) : (i += 1) {
            _ = SDL_AddAtomicInt_REAL(&commandBuffer.*.buffersUsedInPendingTransfers[@bitCast(@as(isize, @intCast(i)))].*.usedRegion.*.allocation.*.referenceCount, -@as(c_int, 1)) == @as(c_int, 1);
        }
    }
    commandBuffer.*.buffersUsedInPendingTransfersCount = 0;
    {
        var i: Sint32 = 0;
        _ = &i;
        while (i < commandBuffer.*.usedTextureCount) : (i += 1) {
            _ = SDL_AddAtomicInt_REAL(&commandBuffer.*.usedTextures[@bitCast(@as(isize, @intCast(i)))].*.referenceCount, -@as(c_int, 1)) == @as(c_int, 1);
        }
    }
    commandBuffer.*.usedTextureCount = 0;
    {
        var i: Sint32 = 0;
        _ = &i;
        while (i < commandBuffer.*.texturesUsedInPendingTransfersCount) : (i += 1) {
            _ = SDL_AddAtomicInt_REAL(&commandBuffer.*.texturesUsedInPendingTransfers[@bitCast(@as(isize, @intCast(i)))].*.usedRegion.*.allocation.*.referenceCount, -@as(c_int, 1)) == @as(c_int, 1);
        }
    }
    commandBuffer.*.texturesUsedInPendingTransfersCount = 0;
    {
        var i: Sint32 = 0;
        _ = &i;
        while (i < commandBuffer.*.usedSamplerCount) : (i += 1) {
            _ = SDL_AddAtomicInt_REAL(&commandBuffer.*.usedSamplers[@bitCast(@as(isize, @intCast(i)))].*.referenceCount, -@as(c_int, 1)) == @as(c_int, 1);
        }
    }
    commandBuffer.*.usedSamplerCount = 0;
    {
        var i: Sint32 = 0;
        _ = &i;
        while (i < commandBuffer.*.usedGraphicsPipelineCount) : (i += 1) {
            _ = SDL_AddAtomicInt_REAL(&commandBuffer.*.usedGraphicsPipelines[@bitCast(@as(isize, @intCast(i)))].*.referenceCount, -@as(c_int, 1)) == @as(c_int, 1);
        }
    }
    commandBuffer.*.usedGraphicsPipelineCount = 0;
    {
        var i: Sint32 = 0;
        _ = &i;
        while (i < commandBuffer.*.usedComputePipelineCount) : (i += 1) {
            _ = SDL_AddAtomicInt_REAL(&commandBuffer.*.usedComputePipelines[@bitCast(@as(isize, @intCast(i)))].*.referenceCount, -@as(c_int, 1)) == @as(c_int, 1);
        }
    }
    commandBuffer.*.usedComputePipelineCount = 0;
    {
        var i: Sint32 = 0;
        _ = &i;
        while (i < commandBuffer.*.usedFramebufferCount) : (i += 1) {
            _ = SDL_AddAtomicInt_REAL(&commandBuffer.*.usedFramebuffers[@bitCast(@as(isize, @intCast(i)))].*.referenceCount, -@as(c_int, 1)) == @as(c_int, 1);
        }
    }
    commandBuffer.*.usedFramebufferCount = 0;
    commandBuffer.*.presentDataCount = 0;
    commandBuffer.*.waitSemaphoreCount = 0;
    commandBuffer.*.signalSemaphoreCount = 0;
    commandBuffer.*.swapchainRequested = @"false" != 0;
    if (commandBuffer.*.isDefrag) {
        renderer.*.defragInProgress = 0;
    }
    SDL_LockMutex_REAL(renderer.*.acquireCommandBufferLock);
    if (commandBuffer.*.commandPool.*.inactiveCommandBufferCount == commandBuffer.*.commandPool.*.inactiveCommandBufferCapacity) {
        commandBuffer.*.commandPool.*.inactiveCommandBufferCapacity +%= 1;
        commandBuffer.*.commandPool.*.inactiveCommandBuffers = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(commandBuffer.*.commandPool.*.inactiveCommandBuffers)), @as(c_ulong, commandBuffer.*.commandPool.*.inactiveCommandBufferCapacity) *% @sizeOf([*c]VulkanCommandBuffer))));
    }
    commandBuffer.*.commandPool.*.inactiveCommandBuffers[commandBuffer.*.commandPool.*.inactiveCommandBufferCount] = commandBuffer;
    commandBuffer.*.commandPool.*.inactiveCommandBufferCount +%= 1;
    VULKAN_INTERNAL_ReturnDescriptorSetCacheToPool(renderer, commandBuffer.*.descriptorSetCache);
    commandBuffer.*.descriptorSetCache = null;
    SDL_UnlockMutex_REAL(renderer.*.acquireCommandBufferLock);
    if (!cancel) {
        {
            var i: Uint32 = 0;
            _ = &i;
            while (i < renderer.*.submittedCommandBufferCount) : (i +%= 1) {
                if (renderer.*.submittedCommandBuffers[i] == commandBuffer) {
                    renderer.*.submittedCommandBuffers[i] = renderer.*.submittedCommandBuffers[renderer.*.submittedCommandBufferCount -% @as(Uint32, 1)];
                    renderer.*.submittedCommandBufferCount -%= 1;
                }
            }
        }
    }
}
pub fn VULKAN_WaitForFences(driverData: ?*SDL_GPURenderer, waitAll: bool, fences: [*c]const ?*SDL_GPUFence, numFences: Uint32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var renderer: [*c]VulkanRenderer = @ptrCast(@alignCast(driverData));
    _ = &renderer;
    var vkFences: [*c]VkFence = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(VkFence) *% @as(c_ulong, numFences))));
    _ = &vkFences;
    var result: VkResult = undefined;
    _ = &result;
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < numFences) : (i +%= 1) {
            vkFences[i] = @as([*c]VulkanFenceHandle, @ptrCast(@alignCast(fences[i]))).*.fence;
        }
    }
    result = renderer.*.vkWaitForFences.?(renderer.*.logicalDevice, numFences, vkFences, @intFromBool(waitAll), 18446744073709551615);
    while (true) {
        if (result != VK_SUCCESS) {
            if (renderer.*.debugMode) {
                SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkWaitForFences"))), VkErrorMessages(result));
            }
            _ = SDL_SetError_REAL("%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkWaitForFences"))), VkErrorMessages(result));
            return @"false" != 0;
        }
        if (!false) break;
    }
    SDL_free_REAL(@ptrCast(@alignCast(vkFences)));
    SDL_LockMutex_REAL(renderer.*.submitLock);
    {
        var i: Sint32 = @bitCast(@as(c_uint, @truncate(renderer.*.submittedCommandBufferCount -% @as(Uint32, 1))));
        _ = &i;
        while (i >= @as(c_int, 0)) : (i -= 1) {
            result = renderer.*.vkGetFenceStatus.?(renderer.*.logicalDevice, renderer.*.submittedCommandBuffers[@bitCast(@as(isize, @intCast(i)))].*.inFlightFence.*.fence);
            if (result == VK_SUCCESS) {
                VULKAN_INTERNAL_CleanCommandBuffer(renderer, renderer.*.submittedCommandBuffers[@bitCast(@as(isize, @intCast(i)))], @"false" != 0);
            }
        }
    }
    VULKAN_INTERNAL_PerformPendingDestroys(renderer);
    SDL_UnlockMutex_REAL(renderer.*.submitLock);
    return @"true" != 0;
}
pub fn VULKAN_Wait(driverData: ?*SDL_GPURenderer) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var renderer: [*c]VulkanRenderer = @ptrCast(@alignCast(driverData));
    _ = &renderer;
    var commandBuffer: [*c]VulkanCommandBuffer = undefined;
    _ = &commandBuffer;
    var result: VkResult = undefined;
    _ = &result;
    var i: Sint32 = undefined;
    _ = &i;
    SDL_LockMutex_REAL(renderer.*.submitLock);
    result = renderer.*.vkDeviceWaitIdle.?(renderer.*.logicalDevice);
    if (result != VK_SUCCESS) {
        if (renderer.*.debugMode) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkDeviceWaitIdle"))), VkErrorMessages(result));
        }
        _ = SDL_SetError_REAL("%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkDeviceWaitIdle"))), VkErrorMessages(result));
        SDL_UnlockMutex_REAL(renderer.*.submitLock);
        return @"false" != 0;
    }
    {
        i = @bitCast(@as(c_uint, @truncate(renderer.*.submittedCommandBufferCount -% @as(Uint32, 1))));
        while (i >= @as(c_int, 0)) : (i -= 1) {
            commandBuffer = renderer.*.submittedCommandBuffers[@bitCast(@as(isize, @intCast(i)))];
            VULKAN_INTERNAL_CleanCommandBuffer(renderer, commandBuffer, @"false" != 0);
        }
    }
    VULKAN_INTERNAL_PerformPendingDestroys(renderer);
    SDL_UnlockMutex_REAL(renderer.*.submitLock);
    return @"true" != 0;
}
pub fn VULKAN_SubmitAndAcquireFence(commandBuffer: ?*SDL_GPUCommandBuffer) callconv(.c) ?*SDL_GPUFence {
    @setEvalBranchQuota(100000);
    var vulkanCommandBuffer: [*c]VulkanCommandBuffer = @ptrCast(@alignCast(commandBuffer));
    _ = &vulkanCommandBuffer;
    vulkanCommandBuffer.*.autoReleaseFence = @"false" != 0;
    if (!VULKAN_Submit(commandBuffer)) {
        return null;
    }
    return @ptrCast(@alignCast(vulkanCommandBuffer.*.inFlightFence));
}
pub fn VULKAN_INTERNAL_ReleaseCommandBuffer(vulkanCommandBuffer: [*c]VulkanCommandBuffer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var renderer: [*c]VulkanRenderer = vulkanCommandBuffer.*.renderer;
    _ = &renderer;
    if ((renderer.*.submittedCommandBufferCount +% @as(Uint32, 1)) >= renderer.*.submittedCommandBufferCapacity) {
        renderer.*.submittedCommandBufferCapacity = renderer.*.submittedCommandBufferCount +% @as(Uint32, 1);
        renderer.*.submittedCommandBuffers = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(renderer.*.submittedCommandBuffers)), @sizeOf([*c]VulkanCommandBuffer) *% @as(c_ulong, renderer.*.submittedCommandBufferCapacity))));
    }
    renderer.*.submittedCommandBuffers[renderer.*.submittedCommandBufferCount] = vulkanCommandBuffer;
    renderer.*.submittedCommandBufferCount +%= 1;
}
pub fn VULKAN_Submit(commandBuffer: ?*SDL_GPUCommandBuffer) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var vulkanCommandBuffer: [*c]VulkanCommandBuffer = @ptrCast(@alignCast(commandBuffer));
    _ = &vulkanCommandBuffer;
    var renderer: [*c]VulkanRenderer = vulkanCommandBuffer.*.renderer;
    _ = &renderer;
    var submitInfo: VkSubmitInfo = undefined;
    _ = &submitInfo;
    var presentInfo: VkPresentInfoKHR = undefined;
    _ = &presentInfo;
    var presentData: [*c]VulkanPresentData = undefined;
    _ = &presentData;
    var vulkanResult: VkResult = undefined;
    _ = &vulkanResult;
    var presentResult: VkResult = VK_SUCCESS;
    _ = &presentResult;
    var waitStages: [16]VkPipelineStageFlags = undefined;
    _ = &waitStages;
    var swapchainImageIndex: Uint32 = undefined;
    _ = &swapchainImageIndex;
    var swapchainTextureSubresource: [*c]VulkanTextureSubresource = undefined;
    _ = &swapchainTextureSubresource;
    var allocator: [*c]VulkanMemorySubAllocator = undefined;
    _ = &allocator;
    var performCleanups: bool = ((renderer.*.claimedWindowCount > @as(Uint32, 0)) and vulkanCommandBuffer.*.swapchainRequested) or (renderer.*.claimedWindowCount == @as(Uint32, 0));
    _ = &performCleanups;
    SDL_LockMutex_REAL(renderer.*.submitLock);
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < @as(Uint32, MAX_PRESENT_COUNT)) : (i +%= 1) {
            waitStages[i] = VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT;
        }
    }
    {
        var j: Uint32 = 0;
        _ = &j;
        while (j < vulkanCommandBuffer.*.presentDataCount) : (j +%= 1) {
            swapchainImageIndex = vulkanCommandBuffer.*.presentDatas[j].swapchainImageIndex;
            swapchainTextureSubresource = VULKAN_INTERNAL_FetchTextureSubresource(&vulkanCommandBuffer.*.presentDatas[j].windowData.*.textureContainers[swapchainImageIndex], 0, 0);
            VULKAN_INTERNAL_TextureSubresourceTransitionFromDefaultUsage(renderer, vulkanCommandBuffer, VULKAN_TEXTURE_USAGE_MODE_PRESENT, swapchainTextureSubresource);
        }
    }
    if ((performCleanups and (renderer.*.allocationsToDefragCount > @as(Uint32, 0))) and !(@as(c_int, renderer.*.defragInProgress) != 0)) {
        if (!VULKAN_INTERNAL_DefragmentMemory(renderer, vulkanCommandBuffer)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s", @as([*c]u8, @as([*c]u8, @constCast("Failed to defragment memory, likely OOM!"))));
        }
    }
    if (!VULKAN_INTERNAL_EndCommandBuffer(renderer, vulkanCommandBuffer)) {
        SDL_UnlockMutex_REAL(renderer.*.submitLock);
        return @"false" != 0;
    }
    vulkanCommandBuffer.*.inFlightFence = VULKAN_INTERNAL_AcquireFenceFromPool(renderer);
    if (@as(?*anyopaque, @ptrCast(@alignCast(vulkanCommandBuffer.*.inFlightFence))) == @as(?*anyopaque, null)) {
        SDL_UnlockMutex_REAL(renderer.*.submitLock);
        return @"false" != 0;
    }
    _ = SDL_AddAtomicInt_REAL(&vulkanCommandBuffer.*.inFlightFence.*.referenceCount, 1);
    submitInfo.sType = VK_STRUCTURE_TYPE_SUBMIT_INFO;
    submitInfo.pNext = null;
    submitInfo.commandBufferCount = 1;
    submitInfo.pCommandBuffers = &vulkanCommandBuffer.*.commandBuffer;
    submitInfo.pWaitDstStageMask = @ptrCast(@alignCast(&waitStages));
    submitInfo.pWaitSemaphores = vulkanCommandBuffer.*.waitSemaphores;
    submitInfo.waitSemaphoreCount = vulkanCommandBuffer.*.waitSemaphoreCount;
    submitInfo.pSignalSemaphores = vulkanCommandBuffer.*.signalSemaphores;
    submitInfo.signalSemaphoreCount = vulkanCommandBuffer.*.signalSemaphoreCount;
    vulkanResult = renderer.*.vkQueueSubmit.?(renderer.*.unifiedQueue, 1, &submitInfo, vulkanCommandBuffer.*.inFlightFence.*.fence);
    if (vulkanResult != VK_SUCCESS) {
        SDL_UnlockMutex_REAL(renderer.*.submitLock);
        while (true) {
            if (vulkanResult != VK_SUCCESS) {
                if (renderer.*.debugMode) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkQueueSubmit"))), VkErrorMessages(vulkanResult));
                }
                _ = SDL_SetError_REAL("%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkQueueSubmit"))), VkErrorMessages(vulkanResult));
                return @"false" != 0;
            }
            if (!false) break;
        }
    }
    {
        var j: Uint32 = 0;
        _ = &j;
        while (j < vulkanCommandBuffer.*.presentDataCount) : (j +%= 1) {
            presentData = &vulkanCommandBuffer.*.presentDatas[j];
            presentInfo.sType = VK_STRUCTURE_TYPE_PRESENT_INFO_KHR;
            presentInfo.pNext = null;
            presentInfo.pWaitSemaphores = &presentData.*.windowData.*.renderFinishedSemaphore[presentData.*.swapchainImageIndex];
            presentInfo.waitSemaphoreCount = 1;
            presentInfo.pSwapchains = &presentData.*.windowData.*.swapchain;
            presentInfo.swapchainCount = 1;
            presentInfo.pImageIndices = &presentData.*.swapchainImageIndex;
            presentInfo.pResults = null;
            presentResult = renderer.*.vkQueuePresentKHR.?(renderer.*.unifiedQueue, &presentInfo);
            if (((presentResult == VK_SUCCESS) or (presentResult == VK_SUBOPTIMAL_KHR)) or (presentResult == VK_ERROR_OUT_OF_DATE_KHR)) {
                presentData.*.windowData.*.inFlightFences[presentData.*.windowData.*.frameCounter] = @ptrCast(@alignCast(vulkanCommandBuffer.*.inFlightFence));
                _ = SDL_AddAtomicInt_REAL(&vulkanCommandBuffer.*.inFlightFence.*.referenceCount, 1);
                if (presentResult == VK_SUBOPTIMAL_KHR) {
                    presentData.*.windowData.*.needsSwapchainRecreate = @"true" != 0;
                }
                if (presentResult == VK_ERROR_OUT_OF_DATE_KHR) {
                    presentData.*.windowData.*.needsSwapchainRecreate = @"true" != 0;
                }
            } else if (presentResult == VK_ERROR_SURFACE_LOST_KHR) {
                presentData.*.windowData.*.needsSwapchainRecreate = @"true" != 0;
                presentData.*.windowData.*.needsSurfaceRecreate = @"true" != 0;
            } else {
                VULKAN_INTERNAL_ReleaseCommandBuffer(vulkanCommandBuffer);
                SDL_UnlockMutex_REAL(renderer.*.submitLock);
                while (true) {
                    if (presentResult != VK_SUCCESS) {
                        if (renderer.*.debugMode) {
                            SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkQueuePresentKHR"))), VkErrorMessages(presentResult));
                        }
                        _ = SDL_SetError_REAL("%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkQueuePresentKHR"))), VkErrorMessages(presentResult));
                        return @"false" != 0;
                    }
                    if (!false) break;
                }
            }
            presentData.*.windowData.*.frameCounter = (presentData.*.windowData.*.frameCounter +% @as(Uint32, 1)) % renderer.*.allowedFramesInFlight;
        }
    }
    if (performCleanups) {
        {
            var i: Sint32 = @bitCast(@as(c_uint, @truncate(renderer.*.submittedCommandBufferCount -% @as(Uint32, 1))));
            _ = &i;
            while (i >= @as(c_int, 0)) : (i -= 1) {
                vulkanResult = renderer.*.vkGetFenceStatus.?(renderer.*.logicalDevice, renderer.*.submittedCommandBuffers[@bitCast(@as(isize, @intCast(i)))].*.inFlightFence.*.fence);
                if (vulkanResult == VK_SUCCESS) {
                    VULKAN_INTERNAL_CleanCommandBuffer(renderer, renderer.*.submittedCommandBuffers[@bitCast(@as(isize, @intCast(i)))], @"false" != 0);
                }
            }
        }
        if (renderer.*.checkEmptyAllocations) {
            SDL_LockMutex_REAL(renderer.*.allocatorLock);
            {
                var i: Uint32 = 0;
                _ = &i;
                while (i < VK_MAX_MEMORY_TYPES) : (i +%= 1) {
                    allocator = &renderer.*.memoryAllocator.*.subAllocators[i];
                    {
                        var j: Sint32 = @bitCast(@as(c_uint, @truncate(allocator.*.allocationCount -% @as(Uint32, 1))));
                        _ = &j;
                        while (j >= @as(c_int, 0)) : (j -= 1) {
                            if (allocator.*.allocations[@bitCast(@as(isize, @intCast(j)))].*.usedRegionCount == @as(Uint32, 0)) {
                                VULKAN_INTERNAL_DeallocateMemory(renderer, allocator, @bitCast(@as(c_int, j)));
                            }
                        }
                    }
                }
            }
            renderer.*.checkEmptyAllocations = @"false" != 0;
            SDL_UnlockMutex_REAL(renderer.*.allocatorLock);
        }
        VULKAN_INTERNAL_PerformPendingDestroys(renderer);
    }
    VULKAN_INTERNAL_ReleaseCommandBuffer(vulkanCommandBuffer);
    SDL_UnlockMutex_REAL(renderer.*.submitLock);
    return @"true" != 0;
}
pub fn VULKAN_Cancel(commandBuffer: ?*SDL_GPUCommandBuffer) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var renderer: [*c]VulkanRenderer = undefined;
    _ = &renderer;
    var vulkanCommandBuffer: [*c]VulkanCommandBuffer = undefined;
    _ = &vulkanCommandBuffer;
    var result: VkResult = undefined;
    _ = &result;
    vulkanCommandBuffer = @ptrCast(@alignCast(commandBuffer));
    renderer = vulkanCommandBuffer.*.renderer;
    result = renderer.*.vkResetCommandBuffer.?(vulkanCommandBuffer.*.commandBuffer, VK_COMMAND_BUFFER_RESET_RELEASE_RESOURCES_BIT);
    while (true) {
        if (result != VK_SUCCESS) {
            if (renderer.*.debugMode) {
                SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkResetCommandBuffer"))), VkErrorMessages(result));
            }
            _ = SDL_SetError_REAL("%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkResetCommandBuffer"))), VkErrorMessages(result));
            return @"false" != 0;
        }
        if (!false) break;
    }
    vulkanCommandBuffer.*.autoReleaseFence = @"false" != 0;
    SDL_LockMutex_REAL(renderer.*.submitLock);
    VULKAN_INTERNAL_CleanCommandBuffer(renderer, vulkanCommandBuffer, @"true" != 0);
    SDL_UnlockMutex_REAL(renderer.*.submitLock);
    return @"true" != 0;
}
pub fn VULKAN_INTERNAL_DefragmentMemory(renderer: [*c]VulkanRenderer, commandBuffer: [*c]VulkanCommandBuffer) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    renderer.*.defragInProgress = 1;
    commandBuffer.*.isDefrag = @as(c_int, 1) != 0;
    SDL_LockMutex_REAL(renderer.*.allocatorLock);
    SDL_LockRWLockForWriting_REAL(renderer.*.defragLock);
    var indexToDefrag: Sint32 = -@as(c_int, 1);
    _ = &indexToDefrag;
    {
        var i: Sint32 = @bitCast(@as(c_uint, @truncate(renderer.*.allocationsToDefragCount -% @as(Uint32, 1))));
        _ = &i;
        while (i >= @as(c_int, 0)) : (i -= 1) {
            if (SDL_GetAtomicInt_REAL(&renderer.*.allocationsToDefrag[@bitCast(@as(isize, @intCast(i)))].*.referenceCount) == @as(c_int, 0)) {
                indexToDefrag = i;
                break;
            }
        }
    }
    if (indexToDefrag == -@as(c_int, 1)) {
        SDL_UnlockRWLock_REAL(renderer.*.defragLock);
        SDL_UnlockMutex_REAL(renderer.*.allocatorLock);
        return @"true" != 0;
    }
    var allocation: [*c]VulkanMemoryAllocation = renderer.*.allocationsToDefrag[@bitCast(@as(isize, @intCast(indexToDefrag)))];
    _ = &allocation;
    if (@as(Uint32, @bitCast(@as(c_int, indexToDefrag))) != (renderer.*.allocationsToDefragCount -% @as(Uint32, 1))) {
        renderer.*.allocationsToDefrag[@bitCast(@as(isize, @intCast(indexToDefrag)))] = renderer.*.allocationsToDefrag[renderer.*.allocationsToDefragCount -% @as(Uint32, 1)];
    }
    renderer.*.allocationsToDefragCount -%= 1;
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < allocation.*.usedRegionCount) : (i +%= 1) {
            var currentRegion: [*c]VulkanMemoryUsedRegion = allocation.*.usedRegions[i];
            _ = &currentRegion;
            if ((@as(c_int, currentRegion.*.isBuffer) != 0) and !currentRegion.*.unnamed_0.vulkanBuffer.*.markedForDestroy) {
                var newBuffer: [*c]VulkanBuffer = VULKAN_INTERNAL_CreateBuffer(renderer, currentRegion.*.unnamed_0.vulkanBuffer.*.size, currentRegion.*.unnamed_0.vulkanBuffer.*.usage, currentRegion.*.unnamed_0.vulkanBuffer.*.type, @"false" != 0, @ptrCast(@alignCast(if (@as(?*anyopaque, @ptrCast(@alignCast(currentRegion.*.unnamed_0.vulkanBuffer.*.container))) != @as(?*anyopaque, null)) @as(?*anyopaque, @ptrCast(@alignCast(currentRegion.*.unnamed_0.vulkanBuffer.*.container.*.debugName))) else @as(?*anyopaque, null))));
                _ = &newBuffer;
                if (@as(?*anyopaque, @ptrCast(@alignCast(newBuffer))) == @as(?*anyopaque, null)) {
                    SDL_UnlockRWLock_REAL(renderer.*.defragLock);
                    SDL_UnlockMutex_REAL(renderer.*.allocatorLock);
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s", @as([*c]u8, @as([*c]u8, @constCast("Failed to allocate defrag buffer!"))));
                    return @"false" != 0;
                }
                if ((currentRegion.*.unnamed_0.vulkanBuffer.*.type == @as(VulkanBufferType, VULKAN_BUFFER_TYPE_GPU)) and currentRegion.*.unnamed_0.vulkanBuffer.*.transitioned) {
                    VULKAN_INTERNAL_BufferTransitionFromDefaultUsage(renderer, commandBuffer, @as(c_uint, 1) << @intCast(@as(c_uint, 0)), currentRegion.*.unnamed_0.vulkanBuffer);
                    VULKAN_INTERNAL_BufferTransitionFromDefaultUsage(renderer, commandBuffer, @as(c_uint, 1) << @intCast(@as(c_uint, 1)), newBuffer);
                    var bufferCopy: VkBufferCopy = undefined;
                    _ = &bufferCopy;
                    bufferCopy.srcOffset = 0;
                    bufferCopy.dstOffset = 0;
                    bufferCopy.size = currentRegion.*.resourceSize;
                    renderer.*.vkCmdCopyBuffer.?(commandBuffer.*.commandBuffer, currentRegion.*.unnamed_0.vulkanBuffer.*.buffer, newBuffer.*.buffer, 1, &bufferCopy);
                    VULKAN_INTERNAL_BufferTransitionToDefaultUsage(renderer, commandBuffer, @as(c_uint, 1) << @intCast(@as(c_uint, 1)), newBuffer);
                    VULKAN_INTERNAL_TrackBuffer(commandBuffer, currentRegion.*.unnamed_0.vulkanBuffer);
                    VULKAN_INTERNAL_TrackBuffer(commandBuffer, newBuffer);
                }
                newBuffer.*.container = currentRegion.*.unnamed_0.vulkanBuffer.*.container;
                newBuffer.*.containerIndex = currentRegion.*.unnamed_0.vulkanBuffer.*.containerIndex;
                if (newBuffer.*.type == @as(VulkanBufferType, VULKAN_BUFFER_TYPE_UNIFORM)) {
                    currentRegion.*.unnamed_0.vulkanBuffer.*.uniformBufferForDefrag.*.buffer = newBuffer;
                } else {
                    newBuffer.*.container.*.buffers[newBuffer.*.containerIndex] = newBuffer;
                    if (newBuffer.*.container.*.activeBuffer == currentRegion.*.unnamed_0.vulkanBuffer) {
                        newBuffer.*.container.*.activeBuffer = newBuffer;
                    }
                }
                if (currentRegion.*.unnamed_0.vulkanBuffer.*.uniformBufferForDefrag != null) {
                    newBuffer.*.uniformBufferForDefrag = currentRegion.*.unnamed_0.vulkanBuffer.*.uniformBufferForDefrag;
                }
                VULKAN_INTERNAL_ReleaseBuffer(renderer, currentRegion.*.unnamed_0.vulkanBuffer);
            } else if (!(@as(c_int, currentRegion.*.isBuffer) != 0) and !currentRegion.*.unnamed_0.vulkanTexture.*.markedForDestroy) {
                var newTexture: [*c]VulkanTexture = VULKAN_INTERNAL_CreateTexture(renderer, &currentRegion.*.unnamed_0.vulkanTexture.*.container.*.header.info);
                _ = &newTexture;
                if (@as(?*anyopaque, @ptrCast(@alignCast(newTexture))) == @as(?*anyopaque, null)) {
                    SDL_UnlockRWLock_REAL(renderer.*.defragLock);
                    SDL_UnlockMutex_REAL(renderer.*.allocatorLock);
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s", @as([*c]u8, @as([*c]u8, @constCast("Failed to allocate defrag buffer!"))));
                    return @"false" != 0;
                }
                var info: SDL_GPUTextureCreateInfo = currentRegion.*.unnamed_0.vulkanTexture.*.container.*.header.info;
                _ = &info;
                VULKAN_INTERNAL_TextureTransitionFromDefaultUsage(renderer, commandBuffer, VULKAN_TEXTURE_USAGE_MODE_COPY_SOURCE, currentRegion.*.unnamed_0.vulkanTexture);
                VULKAN_INTERNAL_FullTextureMemoryBarrier(renderer, commandBuffer, VULKAN_TEXTURE_USAGE_MODE_UNINITIALIZED, VULKAN_TEXTURE_USAGE_MODE_COPY_DESTINATION, newTexture);
                {
                    var subresourceIndex: Uint32 = 0;
                    _ = &subresourceIndex;
                    while (subresourceIndex < currentRegion.*.unnamed_0.vulkanTexture.*.subresourceCount) : (subresourceIndex +%= 1) {
                        var srcSubresource: [*c]VulkanTextureSubresource = &currentRegion.*.unnamed_0.vulkanTexture.*.subresources[subresourceIndex];
                        _ = &srcSubresource;
                        var dstSubresource: [*c]VulkanTextureSubresource = &newTexture.*.subresources[subresourceIndex];
                        _ = &dstSubresource;
                        var imageCopy: VkImageCopy = undefined;
                        _ = &imageCopy;
                        imageCopy.srcOffset.x = 0;
                        imageCopy.srcOffset.y = 0;
                        imageCopy.srcOffset.z = 0;
                        imageCopy.srcSubresource.aspectMask = srcSubresource.*.parent.*.aspectFlags;
                        imageCopy.srcSubresource.baseArrayLayer = srcSubresource.*.layer;
                        imageCopy.srcSubresource.layerCount = 1;
                        imageCopy.srcSubresource.mipLevel = srcSubresource.*.level;
                        imageCopy.extent.width = if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1)))) > (info.width >> @intCast(srcSubresource.*.level))) @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1)))) else info.width >> @intCast(srcSubresource.*.level);
                        imageCopy.extent.height = if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1)))) > (info.height >> @intCast(srcSubresource.*.level))) @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1)))) else info.height >> @intCast(srcSubresource.*.level);
                        imageCopy.extent.depth = if (info.type == @as(SDL_GPUTextureType, SDL_GPU_TEXTURETYPE_3D)) info.layer_count_or_depth else @as(Uint32, 1);
                        imageCopy.dstOffset.x = 0;
                        imageCopy.dstOffset.y = 0;
                        imageCopy.dstOffset.z = 0;
                        imageCopy.dstSubresource.aspectMask = dstSubresource.*.parent.*.aspectFlags;
                        imageCopy.dstSubresource.baseArrayLayer = dstSubresource.*.layer;
                        imageCopy.dstSubresource.layerCount = 1;
                        imageCopy.dstSubresource.mipLevel = dstSubresource.*.level;
                        renderer.*.vkCmdCopyImage.?(commandBuffer.*.commandBuffer, currentRegion.*.unnamed_0.vulkanTexture.*.image, VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL, newTexture.*.image, VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL, 1, &imageCopy);
                        VULKAN_INTERNAL_TrackTexture(commandBuffer, srcSubresource.*.parent);
                        VULKAN_INTERNAL_TrackTexture(commandBuffer, dstSubresource.*.parent);
                    }
                }
                VULKAN_INTERNAL_TextureTransitionToDefaultUsage(renderer, commandBuffer, VULKAN_TEXTURE_USAGE_MODE_COPY_DESTINATION, newTexture);
                newTexture.*.container = currentRegion.*.unnamed_0.vulkanTexture.*.container;
                newTexture.*.containerIndex = currentRegion.*.unnamed_0.vulkanTexture.*.containerIndex;
                newTexture.*.container.*.textures[currentRegion.*.unnamed_0.vulkanTexture.*.containerIndex] = newTexture;
                if (currentRegion.*.unnamed_0.vulkanTexture == currentRegion.*.unnamed_0.vulkanTexture.*.container.*.activeTexture) {
                    newTexture.*.container.*.activeTexture = newTexture;
                }
                VULKAN_INTERNAL_ReleaseTexture(renderer, currentRegion.*.unnamed_0.vulkanTexture);
            }
        }
    }
    SDL_UnlockRWLock_REAL(renderer.*.defragLock);
    SDL_UnlockMutex_REAL(renderer.*.allocatorLock);
    return @"true" != 0;
}
pub fn VULKAN_SupportsTextureFormat(driverData: ?*SDL_GPURenderer, format: SDL_GPUTextureFormat, arg_type: SDL_GPUTextureType, usage: SDL_GPUTextureUsageFlags) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var renderer: [*c]VulkanRenderer = @ptrCast(@alignCast(driverData));
    _ = &renderer;
    var vulkanFormat: VkFormat = SDLToVK_TextureFormat[format];
    _ = &vulkanFormat;
    var vulkanUsage: VkImageUsageFlags = 0;
    _ = &vulkanUsage;
    var createFlags: VkImageCreateFlags = 0;
    _ = &createFlags;
    var properties: VkImageFormatProperties = undefined;
    _ = &properties;
    var vulkanResult: VkResult = undefined;
    _ = &vulkanResult;
    if ((usage & (@as(c_uint, 1) << @intCast(@as(c_uint, 0)))) != 0) {
        vulkanUsage |= VK_IMAGE_USAGE_SAMPLED_BIT;
    }
    if ((usage & (@as(c_uint, 1) << @intCast(@as(c_uint, 1)))) != 0) {
        vulkanUsage |= VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT;
    }
    if ((usage & (@as(c_uint, 1) << @intCast(@as(c_uint, 2)))) != 0) {
        vulkanUsage |= VK_IMAGE_USAGE_DEPTH_STENCIL_ATTACHMENT_BIT;
    }
    if ((usage & ((((@as(c_uint, 1) << @intCast(@as(c_uint, 3))) | (@as(c_uint, 1) << @intCast(@as(c_uint, 4)))) | (@as(c_uint, 1) << @intCast(@as(c_uint, 5)))) | (@as(c_uint, 1) << @intCast(@as(c_uint, 6))))) != 0) {
        vulkanUsage |= VK_IMAGE_USAGE_STORAGE_BIT;
    }
    if ((@"type" == @as(SDL_GPUTextureType, SDL_GPU_TEXTURETYPE_CUBE)) or (@"type" == @as(SDL_GPUTextureType, SDL_GPU_TEXTURETYPE_CUBE_ARRAY))) {
        createFlags = VK_IMAGE_CREATE_CUBE_COMPATIBLE_BIT;
    }
    vulkanResult = renderer.*.vkGetPhysicalDeviceImageFormatProperties.?(renderer.*.physicalDevice, vulkanFormat, @bitCast(if (@"type" == @as(SDL_GPUTextureType, SDL_GPU_TEXTURETYPE_3D)) VK_IMAGE_TYPE_3D else VK_IMAGE_TYPE_2D), VK_IMAGE_TILING_OPTIMAL, vulkanUsage, createFlags, &properties);
    return vulkanResult == VK_SUCCESS;
}
pub fn CheckDeviceExtensions(extensions: [*c]VkExtensionProperties, numExtensions: Uint32, supports: [*c]VulkanExtensions) callconv(.c) Uint8 {
    @setEvalBranchQuota(100000);
    var i: Uint32 = undefined;
    _ = &i;
    _ = memset(@ptrCast(@alignCast(supports)), '\x00', @sizeOf(VulkanExtensions));
    {
        i = 0;
        while (i < numExtensions) : (i +%= 1) {
            var name: [*c]const u8 = @ptrCast(@alignCast(&extensions[i].extensionName));
            _ = &name;
            if (SDL_strcmp_REAL(name, "VK_KHR_swapchain") == @as(c_int, 0)) {
                supports.*.KHR_swapchain = 1;
            } else if (SDL_strcmp_REAL(name, "VK_KHR_maintenance1") == @as(c_int, 0)) {
                supports.*.KHR_maintenance1 = 1;
            } else if (SDL_strcmp_REAL(name, "VK_KHR_driver_properties") == @as(c_int, 0)) {
                supports.*.KHR_driver_properties = 1;
            } else if (SDL_strcmp_REAL(name, "VK_KHR_portability_subset") == @as(c_int, 0)) {
                supports.*.KHR_portability_subset = 1;
            } else if (SDL_strcmp_REAL(name, "VK_MSFT_layered_driver") == @as(c_int, 0)) {
                supports.*.MSFT_layered_driver = 1;
            } else if (SDL_strcmp_REAL(name, "VK_EXT_texture_compression_astc_hdr") == @as(c_int, 0)) {
                supports.*.EXT_texture_compression_astc_hdr = 1;
            }
        }
    }
    return @bitCast(@as(i8, @intFromBool((@as(c_int, supports.*.KHR_swapchain) != 0) and (@as(c_int, supports.*.KHR_maintenance1) != 0))));
}
pub fn GetDeviceExtensionCount(supports: [*c]VulkanExtensions) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(c_int, ((((@as(c_int, supports.*.KHR_swapchain) + @as(c_int, supports.*.KHR_maintenance1)) + @as(c_int, supports.*.KHR_driver_properties)) + @as(c_int, supports.*.KHR_portability_subset)) + @as(c_int, supports.*.MSFT_layered_driver)) + @as(c_int, supports.*.EXT_texture_compression_astc_hdr)));
}
pub fn CreateDeviceExtensionArray(supports: [*c]VulkanExtensions, extensions: [*c][*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var cur: Uint8 = 0;
    _ = &cur;
    if (@as(c_int, supports.*.KHR_swapchain) != 0) {
        extensions[
            blk: {
                const ref = &cur;
                const tmp = ref.*;
                ref.* +%= 1;
                break :blk tmp;
            }
        ] = "VK_KHR_swapchain";
    }
    if (@as(c_int, supports.*.KHR_maintenance1) != 0) {
        extensions[
            blk: {
                const ref = &cur;
                const tmp = ref.*;
                ref.* +%= 1;
                break :blk tmp;
            }
        ] = "VK_KHR_maintenance1";
    }
    if (@as(c_int, supports.*.KHR_driver_properties) != 0) {
        extensions[
            blk: {
                const ref = &cur;
                const tmp = ref.*;
                ref.* +%= 1;
                break :blk tmp;
            }
        ] = "VK_KHR_driver_properties";
    }
    if (@as(c_int, supports.*.KHR_portability_subset) != 0) {
        extensions[
            blk: {
                const ref = &cur;
                const tmp = ref.*;
                ref.* +%= 1;
                break :blk tmp;
            }
        ] = "VK_KHR_portability_subset";
    }
    if (@as(c_int, supports.*.MSFT_layered_driver) != 0) {
        extensions[
            blk: {
                const ref = &cur;
                const tmp = ref.*;
                ref.* +%= 1;
                break :blk tmp;
            }
        ] = "VK_MSFT_layered_driver";
    }
    if (@as(c_int, supports.*.EXT_texture_compression_astc_hdr) != 0) {
        extensions[
            blk: {
                const ref = &cur;
                const tmp = ref.*;
                ref.* +%= 1;
                break :blk tmp;
            }
        ] = "VK_EXT_texture_compression_astc_hdr";
    }
}
pub fn SupportsInstanceExtension(ext: [*c]const u8, availableExtensions: [*c]VkExtensionProperties, numAvailableExtensions: Uint32) callconv(.c) Uint8 {
    @setEvalBranchQuota(100000);
    var i: Uint32 = undefined;
    _ = &i;
    {
        i = 0;
        while (i < numAvailableExtensions) : (i +%= 1) {
            if (SDL_strcmp_REAL(ext, @ptrCast(@alignCast(&availableExtensions[i].extensionName))) == @as(c_int, 0)) {
                return 1;
            }
        }
    }
    return 0;
}
pub fn VULKAN_INTERNAL_CheckInstanceExtensions(requiredExtensions: [*c][*c]const u8, requiredExtensionsLength: Uint32, supportsDebugUtils: [*c]bool, supportsColorspace: [*c]bool, supportsPhysicalDeviceProperties2: [*c]bool, supportsPortabilityEnumeration: [*c]bool, firstUnsupportedExtensionIndex: [*c]c_int) callconv(.c) Uint8 {
    @setEvalBranchQuota(100000);
    var extensionCount: Uint32 = undefined;
    _ = &extensionCount;
    var i: Uint32 = undefined;
    _ = &i;
    var availableExtensions: [*c]VkExtensionProperties = undefined;
    _ = &availableExtensions;
    var allExtensionsSupported: Uint8 = 1;
    _ = &allExtensionsSupported;
    _ = vkEnumerateInstanceExtensionProperties.?(null, &extensionCount, null);
    availableExtensions = @ptrCast(@alignCast(SDL_malloc_REAL(@as(c_ulong, extensionCount) *% @sizeOf(VkExtensionProperties))));
    _ = vkEnumerateInstanceExtensionProperties.?(null, &extensionCount, availableExtensions);
    {
        i = 0;
        while (i < requiredExtensionsLength) : (i +%= 1) {
            if (!(@as(c_int, SupportsInstanceExtension(requiredExtensions[i], availableExtensions, extensionCount)) != 0)) {
                allExtensionsSupported = 0;
                firstUnsupportedExtensionIndex.* = @bitCast(@as(c_uint, @truncate(i)));
                break;
            }
        }
    }
    supportsDebugUtils.* = SupportsInstanceExtension("VK_EXT_debug_utils", availableExtensions, extensionCount) != 0;
    supportsColorspace.* = SupportsInstanceExtension("VK_EXT_swapchain_colorspace", availableExtensions, extensionCount) != 0;
    supportsPhysicalDeviceProperties2.* = SupportsInstanceExtension("VK_KHR_get_physical_device_properties2", availableExtensions, extensionCount) != 0;
    supportsPortabilityEnumeration.* = SupportsInstanceExtension("VK_KHR_portability_enumeration", availableExtensions, extensionCount) != 0;
    SDL_free_REAL(@ptrCast(@alignCast(availableExtensions)));
    return allExtensionsSupported;
}
pub fn CheckOptInDeviceExtensions(features: [*c]VulkanFeatures, numExtensions: Uint32, availableExtensions: [*c]VkExtensionProperties, missingExtensionName: [*c][*c]const u8) callconv(.c) Uint8 {
    @setEvalBranchQuota(100000);
    var supportsAll: Uint8 = 1;
    _ = &supportsAll;
    {
        var extensionIdx: Uint32 = 0;
        _ = &extensionIdx;
        while (extensionIdx < features.*.additionalDeviceExtensionCount) : (extensionIdx +%= 1) {
            var found: bool = @"false" != 0;
            _ = &found;
            {
                var searchIdx: Uint32 = 0;
                _ = &searchIdx;
                while (searchIdx < numExtensions) : (searchIdx +%= 1) {
                    if (SDL_strcmp_REAL(features.*.additionalDeviceExtensionNames[extensionIdx], @ptrCast(@alignCast(&availableExtensions[searchIdx].extensionName))) == @as(c_int, 0)) {
                        found = @"true" != 0;
                        break;
                    }
                }
            }
            if (!found) {
                supportsAll = 0;
                missingExtensionName.* = features.*.additionalDeviceExtensionNames[extensionIdx];
                break;
            }
        }
    }
    return supportsAll;
}
pub fn VULKAN_INTERNAL_CheckDeviceExtensions(renderer: [*c]VulkanRenderer, features: [*c]VulkanFeatures, physicalDevice: VkPhysicalDevice, physicalDeviceExtensions: [*c]VulkanExtensions) callconv(.c) Uint8 {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [37:0]u8 = "VULKAN_INTERNAL_CheckDeviceExtensions".*;
    };
    _ = &static_local___func__;
    var extensionCount: Uint32 = undefined;
    _ = &extensionCount;
    var availableExtensions: [*c]VkExtensionProperties = undefined;
    _ = &availableExtensions;
    var allExtensionsSupported: Uint8 = undefined;
    _ = &allExtensionsSupported;
    _ = renderer.*.vkEnumerateDeviceExtensionProperties.?(physicalDevice, null, &extensionCount, null);
    availableExtensions = @ptrCast(@alignCast(SDL_malloc_REAL(@as(c_ulong, extensionCount) *% @sizeOf(VkExtensionProperties))));
    _ = renderer.*.vkEnumerateDeviceExtensionProperties.?(physicalDevice, null, &extensionCount, availableExtensions);
    allExtensionsSupported = CheckDeviceExtensions(availableExtensions, extensionCount, physicalDeviceExtensions);
    if (features.*.usesCustomVulkanOptions) {
        var missingExtensionName: [*c]const u8 = undefined;
        _ = &missingExtensionName;
        if (!(@as(c_int, CheckOptInDeviceExtensions(features, extensionCount, availableExtensions, &missingExtensionName)) != 0)) {
            while (true) {
                while (!(missingExtensionName != null)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "missingExtensionName",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu_vulkan.c", 11466);
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
            if (renderer.*.debugMode) {
                SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "Required Vulkan device extension '%s' not supported", missingExtensionName);
            }
            allExtensionsSupported = 0;
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(availableExtensions)));
    return allExtensionsSupported;
}
pub fn VULKAN_INTERNAL_CheckValidationLayers(validationLayers: [*c][*c]const u8, validationLayersLength: Uint32) callconv(.c) Uint8 {
    @setEvalBranchQuota(100000);
    var layerCount: Uint32 = undefined;
    _ = &layerCount;
    var availableLayers: [*c]VkLayerProperties = undefined;
    _ = &availableLayers;
    var i: Uint32 = undefined;
    _ = &i;
    var j: Uint32 = undefined;
    _ = &j;
    var layerFound: Uint8 = 0;
    _ = &layerFound;
    _ = vkEnumerateInstanceLayerProperties.?(&layerCount, null);
    availableLayers = @ptrCast(@alignCast(SDL_malloc_REAL(@as(c_ulong, layerCount) *% @sizeOf(VkLayerProperties))));
    _ = vkEnumerateInstanceLayerProperties.?(&layerCount, availableLayers);
    {
        i = 0;
        while (i < validationLayersLength) : (i +%= 1) {
            layerFound = 0;
            {
                j = 0;
                while (j < layerCount) : (j +%= 1) {
                    if (SDL_strcmp_REAL(validationLayers[i], @ptrCast(@alignCast(&availableLayers[j].layerName))) == @as(c_int, 0)) {
                        layerFound = 1;
                        break;
                    }
                }
            }
            if (!(@as(c_int, layerFound) != 0)) {
                break;
            }
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(availableLayers)));
    return layerFound;
}
pub fn VULKAN_INTERNAL_ValidateOptInVulkan10Features(requested: [*c]VkPhysicalDeviceFeatures, supported: [*c]VkPhysicalDeviceFeatures) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if ((requested != null) and (supported != null)) {
        var result: bool = @"true" != 0;
        _ = &result;
        if ((requested.*.robustBufferAccess != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.robustBufferAccess != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'robustBufferAccess'");
            result = @"false" != 0;
        }
        if ((requested.*.fullDrawIndexUint32 != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.fullDrawIndexUint32 != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'fullDrawIndexUint32'");
            result = @"false" != 0;
        }
        if ((requested.*.imageCubeArray != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.imageCubeArray != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'imageCubeArray'");
            result = @"false" != 0;
        }
        if ((requested.*.independentBlend != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.independentBlend != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'independentBlend'");
            result = @"false" != 0;
        }
        if ((requested.*.geometryShader != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.geometryShader != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'geometryShader'");
            result = @"false" != 0;
        }
        if ((requested.*.tessellationShader != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.tessellationShader != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'tessellationShader'");
            result = @"false" != 0;
        }
        if ((requested.*.sampleRateShading != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.sampleRateShading != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'sampleRateShading'");
            result = @"false" != 0;
        }
        if ((requested.*.dualSrcBlend != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.dualSrcBlend != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'dualSrcBlend'");
            result = @"false" != 0;
        }
        if ((requested.*.logicOp != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.logicOp != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'logicOp'");
            result = @"false" != 0;
        }
        if ((requested.*.multiDrawIndirect != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.multiDrawIndirect != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'multiDrawIndirect'");
            result = @"false" != 0;
        }
        if ((requested.*.drawIndirectFirstInstance != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.drawIndirectFirstInstance != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'drawIndirectFirstInstance'");
            result = @"false" != 0;
        }
        if ((requested.*.depthClamp != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.depthClamp != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'depthClamp'");
            result = @"false" != 0;
        }
        if ((requested.*.depthBiasClamp != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.depthBiasClamp != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'depthBiasClamp'");
            result = @"false" != 0;
        }
        if ((requested.*.fillModeNonSolid != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.fillModeNonSolid != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'fillModeNonSolid'");
            result = @"false" != 0;
        }
        if ((requested.*.depthBounds != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.depthBounds != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'depthBounds'");
            result = @"false" != 0;
        }
        if ((requested.*.wideLines != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.wideLines != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'wideLines'");
            result = @"false" != 0;
        }
        if ((requested.*.largePoints != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.largePoints != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'largePoints'");
            result = @"false" != 0;
        }
        if ((requested.*.alphaToOne != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.alphaToOne != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'alphaToOne'");
            result = @"false" != 0;
        }
        if ((requested.*.multiViewport != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.multiViewport != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'multiViewport'");
            result = @"false" != 0;
        }
        if ((requested.*.samplerAnisotropy != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.samplerAnisotropy != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'samplerAnisotropy'");
            result = @"false" != 0;
        }
        if ((requested.*.textureCompressionETC2 != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.textureCompressionETC2 != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'textureCompressionETC2'");
            result = @"false" != 0;
        }
        if ((requested.*.textureCompressionASTC_LDR != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.textureCompressionASTC_LDR != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'textureCompressionASTC_LDR'");
            result = @"false" != 0;
        }
        if ((requested.*.textureCompressionBC != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.textureCompressionBC != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'textureCompressionBC'");
            result = @"false" != 0;
        }
        if ((requested.*.occlusionQueryPrecise != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.occlusionQueryPrecise != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'occlusionQueryPrecise'");
            result = @"false" != 0;
        }
        if ((requested.*.pipelineStatisticsQuery != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.pipelineStatisticsQuery != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'pipelineStatisticsQuery'");
            result = @"false" != 0;
        }
        if ((requested.*.vertexPipelineStoresAndAtomics != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.vertexPipelineStoresAndAtomics != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'vertexPipelineStoresAndAtomics'");
            result = @"false" != 0;
        }
        if ((requested.*.fragmentStoresAndAtomics != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.fragmentStoresAndAtomics != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'fragmentStoresAndAtomics'");
            result = @"false" != 0;
        }
        if ((requested.*.shaderTessellationAndGeometryPointSize != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.shaderTessellationAndGeometryPointSize != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'shaderTessellationAndGeometryPointSize'");
            result = @"false" != 0;
        }
        if ((requested.*.shaderImageGatherExtended != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.shaderImageGatherExtended != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'shaderImageGatherExtended'");
            result = @"false" != 0;
        }
        if ((requested.*.shaderStorageImageExtendedFormats != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.shaderStorageImageExtendedFormats != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'shaderStorageImageExtendedFormats'");
            result = @"false" != 0;
        }
        if ((requested.*.shaderStorageImageMultisample != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.shaderStorageImageMultisample != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'shaderStorageImageMultisample'");
            result = @"false" != 0;
        }
        if ((requested.*.shaderStorageImageReadWithoutFormat != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.shaderStorageImageReadWithoutFormat != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'shaderStorageImageReadWithoutFormat'");
            result = @"false" != 0;
        }
        if ((requested.*.shaderStorageImageWriteWithoutFormat != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.shaderStorageImageWriteWithoutFormat != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'shaderStorageImageWriteWithoutFormat'");
            result = @"false" != 0;
        }
        if ((requested.*.shaderUniformBufferArrayDynamicIndexing != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.shaderUniformBufferArrayDynamicIndexing != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'shaderUniformBufferArrayDynamicIndexing'");
            result = @"false" != 0;
        }
        if ((requested.*.shaderSampledImageArrayDynamicIndexing != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.shaderSampledImageArrayDynamicIndexing != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'shaderSampledImageArrayDynamicIndexing'");
            result = @"false" != 0;
        }
        if ((requested.*.shaderStorageBufferArrayDynamicIndexing != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.shaderStorageBufferArrayDynamicIndexing != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'shaderStorageBufferArrayDynamicIndexing'");
            result = @"false" != 0;
        }
        if ((requested.*.shaderStorageImageArrayDynamicIndexing != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.shaderStorageImageArrayDynamicIndexing != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'shaderStorageImageArrayDynamicIndexing'");
            result = @"false" != 0;
        }
        if ((requested.*.shaderClipDistance != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.shaderClipDistance != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'shaderClipDistance'");
            result = @"false" != 0;
        }
        if ((requested.*.shaderCullDistance != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.shaderCullDistance != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'shaderCullDistance'");
            result = @"false" != 0;
        }
        if ((requested.*.shaderFloat64 != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.shaderFloat64 != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'shaderFloat64'");
            result = @"false" != 0;
        }
        if ((requested.*.shaderInt64 != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.shaderInt64 != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'shaderInt64'");
            result = @"false" != 0;
        }
        if ((requested.*.shaderInt16 != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.shaderInt16 != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'shaderInt16'");
            result = @"false" != 0;
        }
        if ((requested.*.shaderResourceResidency != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.shaderResourceResidency != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'shaderResourceResidency'");
            result = @"false" != 0;
        }
        if ((requested.*.shaderResourceMinLod != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.shaderResourceMinLod != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'shaderResourceMinLod'");
            result = @"false" != 0;
        }
        if ((requested.*.sparseBinding != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.sparseBinding != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'sparseBinding'");
            result = @"false" != 0;
        }
        if ((requested.*.sparseResidencyBuffer != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.sparseResidencyBuffer != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'sparseResidencyBuffer'");
            result = @"false" != 0;
        }
        if ((requested.*.sparseResidencyImage2D != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.sparseResidencyImage2D != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'sparseResidencyImage2D'");
            result = @"false" != 0;
        }
        if ((requested.*.sparseResidencyImage3D != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.sparseResidencyImage3D != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'sparseResidencyImage3D'");
            result = @"false" != 0;
        }
        if ((requested.*.sparseResidency2Samples != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.sparseResidency2Samples != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'sparseResidency2Samples'");
            result = @"false" != 0;
        }
        if ((requested.*.sparseResidency4Samples != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.sparseResidency4Samples != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'sparseResidency4Samples'");
            result = @"false" != 0;
        }
        if ((requested.*.sparseResidency8Samples != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.sparseResidency8Samples != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'sparseResidency8Samples'");
            result = @"false" != 0;
        }
        if ((requested.*.sparseResidency16Samples != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.sparseResidency16Samples != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'sparseResidency16Samples'");
            result = @"false" != 0;
        }
        if ((requested.*.sparseResidencyAliased != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.sparseResidencyAliased != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'sparseResidencyAliased'");
            result = @"false" != 0;
        }
        if ((requested.*.variableMultisampleRate != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.variableMultisampleRate != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'variableMultisampleRate'");
            result = @"false" != 0;
        }
        if ((requested.*.inheritedQueries != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.inheritedQueries != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'inheritedQueries'");
            result = @"false" != 0;
        }
        return result;
    } else {
        return @"false" != 0;
    }
}
pub fn VULKAN_INTERNAL_ValidateOptInVulkan11Features(requested: [*c]VkPhysicalDeviceVulkan11Features, supported: [*c]VkPhysicalDeviceVulkan11Features) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if ((requested != null) and (supported != null)) {
        var result: bool = @"true" != 0;
        _ = &result;
        if ((requested.*.storageBuffer16BitAccess != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.storageBuffer16BitAccess != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'storageBuffer16BitAccess'");
            result = @"false" != 0;
        }
        if ((requested.*.uniformAndStorageBuffer16BitAccess != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.uniformAndStorageBuffer16BitAccess != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'uniformAndStorageBuffer16BitAccess'");
            result = @"false" != 0;
        }
        if ((requested.*.storagePushConstant16 != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.storagePushConstant16 != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'storagePushConstant16'");
            result = @"false" != 0;
        }
        if ((requested.*.storageInputOutput16 != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.storageInputOutput16 != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'storageInputOutput16'");
            result = @"false" != 0;
        }
        if ((requested.*.multiview != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.multiview != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'multiview'");
            result = @"false" != 0;
        }
        if ((requested.*.multiviewGeometryShader != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.multiviewGeometryShader != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'multiviewGeometryShader'");
            result = @"false" != 0;
        }
        if ((requested.*.multiviewTessellationShader != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.multiviewTessellationShader != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'multiviewTessellationShader'");
            result = @"false" != 0;
        }
        if ((requested.*.variablePointersStorageBuffer != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.variablePointersStorageBuffer != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'variablePointersStorageBuffer'");
            result = @"false" != 0;
        }
        if ((requested.*.variablePointers != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.variablePointers != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'variablePointers'");
            result = @"false" != 0;
        }
        if ((requested.*.protectedMemory != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.protectedMemory != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'protectedMemory'");
            result = @"false" != 0;
        }
        if ((requested.*.samplerYcbcrConversion != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.samplerYcbcrConversion != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'samplerYcbcrConversion'");
            result = @"false" != 0;
        }
        if ((requested.*.shaderDrawParameters != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.shaderDrawParameters != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'shaderDrawParameters'");
            result = @"false" != 0;
        }
        return result;
    } else {
        return @"false" != 0;
    }
}
pub fn VULKAN_INTERNAL_ValidateOptInVulkan12Features(requested: [*c]VkPhysicalDeviceVulkan12Features, supported: [*c]VkPhysicalDeviceVulkan12Features) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if ((requested != null) and (supported != null)) {
        var result: bool = @"true" != 0;
        _ = &result;
        if ((requested.*.samplerMirrorClampToEdge != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.samplerMirrorClampToEdge != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'samplerMirrorClampToEdge'");
            result = @"false" != 0;
        }
        if ((requested.*.drawIndirectCount != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.drawIndirectCount != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'drawIndirectCount'");
            result = @"false" != 0;
        }
        if ((requested.*.storageBuffer8BitAccess != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.storageBuffer8BitAccess != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'storageBuffer8BitAccess'");
            result = @"false" != 0;
        }
        if ((requested.*.uniformAndStorageBuffer8BitAccess != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.uniformAndStorageBuffer8BitAccess != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'uniformAndStorageBuffer8BitAccess'");
            result = @"false" != 0;
        }
        if ((requested.*.storagePushConstant8 != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.storagePushConstant8 != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'storagePushConstant8'");
            result = @"false" != 0;
        }
        if ((requested.*.shaderBufferInt64Atomics != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.shaderBufferInt64Atomics != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'shaderBufferInt64Atomics'");
            result = @"false" != 0;
        }
        if ((requested.*.shaderSharedInt64Atomics != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.shaderSharedInt64Atomics != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'shaderSharedInt64Atomics'");
            result = @"false" != 0;
        }
        if ((requested.*.shaderFloat16 != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.shaderFloat16 != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'shaderFloat16'");
            result = @"false" != 0;
        }
        if ((requested.*.shaderInt8 != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.shaderInt8 != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'shaderInt8'");
            result = @"false" != 0;
        }
        if ((requested.*.descriptorIndexing != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.descriptorIndexing != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'descriptorIndexing'");
            result = @"false" != 0;
        }
        if ((requested.*.shaderInputAttachmentArrayDynamicIndexing != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.shaderInputAttachmentArrayDynamicIndexing != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'shaderInputAttachmentArrayDynamicIndexing'");
            result = @"false" != 0;
        }
        if ((requested.*.shaderUniformTexelBufferArrayDynamicIndexing != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.shaderUniformTexelBufferArrayDynamicIndexing != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'shaderUniformTexelBufferArrayDynamicIndexing'");
            result = @"false" != 0;
        }
        if ((requested.*.shaderStorageTexelBufferArrayDynamicIndexing != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.shaderStorageTexelBufferArrayDynamicIndexing != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'shaderStorageTexelBufferArrayDynamicIndexing'");
            result = @"false" != 0;
        }
        if ((requested.*.shaderUniformBufferArrayNonUniformIndexing != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.shaderUniformBufferArrayNonUniformIndexing != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'shaderUniformBufferArrayNonUniformIndexing'");
            result = @"false" != 0;
        }
        if ((requested.*.shaderSampledImageArrayNonUniformIndexing != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.shaderSampledImageArrayNonUniformIndexing != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'shaderSampledImageArrayNonUniformIndexing'");
            result = @"false" != 0;
        }
        if ((requested.*.shaderStorageBufferArrayNonUniformIndexing != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.shaderStorageBufferArrayNonUniformIndexing != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'shaderStorageBufferArrayNonUniformIndexing'");
            result = @"false" != 0;
        }
        if ((requested.*.shaderStorageImageArrayNonUniformIndexing != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.shaderStorageImageArrayNonUniformIndexing != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'shaderStorageImageArrayNonUniformIndexing'");
            result = @"false" != 0;
        }
        if ((requested.*.shaderInputAttachmentArrayNonUniformIndexing != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.shaderInputAttachmentArrayNonUniformIndexing != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'shaderInputAttachmentArrayNonUniformIndexing'");
            result = @"false" != 0;
        }
        if ((requested.*.shaderUniformTexelBufferArrayNonUniformIndexing != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.shaderUniformTexelBufferArrayNonUniformIndexing != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'shaderUniformTexelBufferArrayNonUniformIndexing'");
            result = @"false" != 0;
        }
        if ((requested.*.shaderStorageTexelBufferArrayNonUniformIndexing != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.shaderStorageTexelBufferArrayNonUniformIndexing != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'shaderStorageTexelBufferArrayNonUniformIndexing'");
            result = @"false" != 0;
        }
        if ((requested.*.descriptorBindingUniformBufferUpdateAfterBind != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.descriptorBindingUniformBufferUpdateAfterBind != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'descriptorBindingUniformBufferUpdateAfterBind'");
            result = @"false" != 0;
        }
        if ((requested.*.descriptorBindingSampledImageUpdateAfterBind != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.descriptorBindingSampledImageUpdateAfterBind != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'descriptorBindingSampledImageUpdateAfterBind'");
            result = @"false" != 0;
        }
        if ((requested.*.descriptorBindingStorageImageUpdateAfterBind != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.descriptorBindingStorageImageUpdateAfterBind != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'descriptorBindingStorageImageUpdateAfterBind'");
            result = @"false" != 0;
        }
        if ((requested.*.descriptorBindingStorageBufferUpdateAfterBind != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.descriptorBindingStorageBufferUpdateAfterBind != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'descriptorBindingStorageBufferUpdateAfterBind'");
            result = @"false" != 0;
        }
        if ((requested.*.descriptorBindingUniformTexelBufferUpdateAfterBind != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.descriptorBindingUniformTexelBufferUpdateAfterBind != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'descriptorBindingUniformTexelBufferUpdateAfterBind'");
            result = @"false" != 0;
        }
        if ((requested.*.descriptorBindingStorageTexelBufferUpdateAfterBind != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.descriptorBindingStorageTexelBufferUpdateAfterBind != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'descriptorBindingStorageTexelBufferUpdateAfterBind'");
            result = @"false" != 0;
        }
        if ((requested.*.descriptorBindingUpdateUnusedWhilePending != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.descriptorBindingUpdateUnusedWhilePending != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'descriptorBindingUpdateUnusedWhilePending'");
            result = @"false" != 0;
        }
        if ((requested.*.descriptorBindingPartiallyBound != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.descriptorBindingPartiallyBound != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'descriptorBindingPartiallyBound'");
            result = @"false" != 0;
        }
        if ((requested.*.descriptorBindingVariableDescriptorCount != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.descriptorBindingVariableDescriptorCount != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'descriptorBindingVariableDescriptorCount'");
            result = @"false" != 0;
        }
        if ((requested.*.runtimeDescriptorArray != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.runtimeDescriptorArray != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'runtimeDescriptorArray'");
            result = @"false" != 0;
        }
        if ((requested.*.samplerFilterMinmax != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.samplerFilterMinmax != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'samplerFilterMinmax'");
            result = @"false" != 0;
        }
        if ((requested.*.scalarBlockLayout != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.scalarBlockLayout != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'scalarBlockLayout'");
            result = @"false" != 0;
        }
        if ((requested.*.imagelessFramebuffer != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.imagelessFramebuffer != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'imagelessFramebuffer'");
            result = @"false" != 0;
        }
        if ((requested.*.uniformBufferStandardLayout != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.uniformBufferStandardLayout != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'uniformBufferStandardLayout'");
            result = @"false" != 0;
        }
        if ((requested.*.shaderSubgroupExtendedTypes != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.shaderSubgroupExtendedTypes != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'shaderSubgroupExtendedTypes'");
            result = @"false" != 0;
        }
        if ((requested.*.separateDepthStencilLayouts != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.separateDepthStencilLayouts != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'separateDepthStencilLayouts'");
            result = @"false" != 0;
        }
        if ((requested.*.hostQueryReset != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.hostQueryReset != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'hostQueryReset'");
            result = @"false" != 0;
        }
        if ((requested.*.timelineSemaphore != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.timelineSemaphore != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'timelineSemaphore'");
            result = @"false" != 0;
        }
        if ((requested.*.bufferDeviceAddress != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.bufferDeviceAddress != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'bufferDeviceAddress'");
            result = @"false" != 0;
        }
        if ((requested.*.bufferDeviceAddressCaptureReplay != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.bufferDeviceAddressCaptureReplay != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'bufferDeviceAddressCaptureReplay'");
            result = @"false" != 0;
        }
        if ((requested.*.bufferDeviceAddressMultiDevice != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.bufferDeviceAddressMultiDevice != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'bufferDeviceAddressMultiDevice'");
            result = @"false" != 0;
        }
        if ((requested.*.vulkanMemoryModel != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.vulkanMemoryModel != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'vulkanMemoryModel'");
            result = @"false" != 0;
        }
        if ((requested.*.vulkanMemoryModelDeviceScope != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.vulkanMemoryModelDeviceScope != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'vulkanMemoryModelDeviceScope'");
            result = @"false" != 0;
        }
        if ((requested.*.vulkanMemoryModelAvailabilityVisibilityChains != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.vulkanMemoryModelAvailabilityVisibilityChains != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'vulkanMemoryModelAvailabilityVisibilityChains'");
            result = @"false" != 0;
        }
        if ((requested.*.shaderOutputViewportIndex != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.shaderOutputViewportIndex != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'shaderOutputViewportIndex'");
            result = @"false" != 0;
        }
        if ((requested.*.shaderOutputLayer != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.shaderOutputLayer != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'shaderOutputLayer'");
            result = @"false" != 0;
        }
        if ((requested.*.subgroupBroadcastDynamicId != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.subgroupBroadcastDynamicId != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'subgroupBroadcastDynamicId'");
            result = @"false" != 0;
        }
        return result;
    } else {
        return @"false" != 0;
    }
}
pub fn VULKAN_INTERNAL_ValidateOptInVulkan13Features(requested: [*c]VkPhysicalDeviceVulkan13Features, supported: [*c]VkPhysicalDeviceVulkan13Features) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if ((requested != null) and (supported != null)) {
        var result: bool = @"true" != 0;
        _ = &result;
        if ((requested.*.robustImageAccess != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.robustImageAccess != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'robustImageAccess'");
            result = @"false" != 0;
        }
        if ((requested.*.inlineUniformBlock != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.inlineUniformBlock != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'inlineUniformBlock'");
            result = @"false" != 0;
        }
        if ((requested.*.descriptorBindingInlineUniformBlockUpdateAfterBind != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.descriptorBindingInlineUniformBlockUpdateAfterBind != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'descriptorBindingInlineUniformBlockUpdateAfterBind'");
            result = @"false" != 0;
        }
        if ((requested.*.pipelineCreationCacheControl != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.pipelineCreationCacheControl != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'pipelineCreationCacheControl'");
            result = @"false" != 0;
        }
        if ((requested.*.privateData != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.privateData != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'privateData'");
            result = @"false" != 0;
        }
        if ((requested.*.shaderDemoteToHelperInvocation != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.shaderDemoteToHelperInvocation != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'shaderDemoteToHelperInvocation'");
            result = @"false" != 0;
        }
        if ((requested.*.shaderTerminateInvocation != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.shaderTerminateInvocation != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'shaderTerminateInvocation'");
            result = @"false" != 0;
        }
        if ((requested.*.subgroupSizeControl != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.subgroupSizeControl != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'subgroupSizeControl'");
            result = @"false" != 0;
        }
        if ((requested.*.computeFullSubgroups != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.computeFullSubgroups != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'computeFullSubgroups'");
            result = @"false" != 0;
        }
        if ((requested.*.synchronization2 != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.synchronization2 != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'synchronization2'");
            result = @"false" != 0;
        }
        if ((requested.*.textureCompressionASTC_HDR != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.textureCompressionASTC_HDR != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'textureCompressionASTC_HDR'");
            result = @"false" != 0;
        }
        if ((requested.*.shaderZeroInitializeWorkgroupMemory != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.shaderZeroInitializeWorkgroupMemory != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'shaderZeroInitializeWorkgroupMemory'");
            result = @"false" != 0;
        }
        if ((requested.*.dynamicRendering != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.dynamicRendering != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'dynamicRendering'");
            result = @"false" != 0;
        }
        if ((requested.*.shaderIntegerDotProduct != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.shaderIntegerDotProduct != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'shaderIntegerDotProduct'");
            result = @"false" != 0;
        }
        if ((requested.*.maintenance4 != 0) and (@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(supported.*.maintenance4 != 0))))) != 0)) {
            SDL_LogVerbose_REAL(SDL_LOG_CATEGORY_GPU, "SDL GPU Vulkan: Application requested unsupported physical device feature 'maintenance4'");
            result = @"false" != 0;
        }
        return result;
    } else {
        return @"false" != 0;
    }
}
pub fn VULKAN_INTERNAL_ValidateOptInFeatures(renderer: [*c]VulkanRenderer, features: [*c]VulkanFeatures, physicalDevice: VkPhysicalDevice, vk10Features: [*c]VkPhysicalDeviceFeatures) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var supportsAllFeatures: bool = @"true" != 0;
    _ = &supportsAllFeatures;
    var minorVersion: c_int = @bitCast(@as(c_uint, @truncate((features.*.desiredApiVersion >> @intCast(@as(c_uint, 12))) & @as(c_uint, 1023))));
    _ = &minorVersion;
    if (minorVersion < @as(c_int, 1)) {
        {
            const ref = &supportsAllFeatures;
            ref.* = (@as(c_int, @intFromBool(ref.*)) & @as(c_int, @intFromBool(VULKAN_INTERNAL_ValidateOptInVulkan10Features(&features.*.desiredVulkan10DeviceFeatures, vk10Features)))) != 0;
        }
    } else if (minorVersion < @as(c_int, 2)) {
        var storage: VkPhysicalDevice16BitStorageFeatures = VkPhysicalDevice16BitStorageFeatures{
            .sType = 0,
            .pNext = null,
            .storageBuffer16BitAccess = 0,
            .uniformAndStorageBuffer16BitAccess = 0,
            .storagePushConstant16 = 0,
            .storageInputOutput16 = 0,
        };
        _ = &storage;
        storage.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_16BIT_STORAGE_FEATURES;
        var multiview: VkPhysicalDeviceMultiviewFeatures = VkPhysicalDeviceMultiviewFeatures{
            .sType = 0,
            .pNext = null,
            .multiview = 0,
            .multiviewGeometryShader = 0,
            .multiviewTessellationShader = 0,
        };
        _ = &multiview;
        multiview.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTIVIEW_FEATURES;
        var protectedMem: VkPhysicalDeviceProtectedMemoryFeatures = VkPhysicalDeviceProtectedMemoryFeatures{
            .sType = 0,
            .pNext = null,
            .protectedMemory = 0,
        };
        _ = &protectedMem;
        protectedMem.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROTECTED_MEMORY_FEATURES;
        var ycbcr: VkPhysicalDeviceSamplerYcbcrConversionFeatures = VkPhysicalDeviceSamplerYcbcrConversionFeatures{
            .sType = 0,
            .pNext = null,
            .samplerYcbcrConversion = 0,
        };
        _ = &ycbcr;
        ycbcr.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SAMPLER_YCBCR_CONVERSION_FEATURES;
        var drawParams: VkPhysicalDeviceShaderDrawParametersFeatures = VkPhysicalDeviceShaderDrawParametersFeatures{
            .sType = 0,
            .pNext = null,
            .shaderDrawParameters = 0,
        };
        _ = &drawParams;
        drawParams.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_DRAW_PARAMETERS_FEATURES;
        var varPointers: VkPhysicalDeviceVariablePointersFeatures = VkPhysicalDeviceVariablePointersFeatures{
            .sType = 0,
            .pNext = null,
            .variablePointersStorageBuffer = 0,
            .variablePointers = 0,
        };
        _ = &varPointers;
        varPointers.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTERS_FEATURES;
        var supportedFeatureList: VkPhysicalDeviceFeatures2 = VkPhysicalDeviceFeatures2{
            .sType = 0,
            .pNext = null,
            .features = @import("std").mem.zeroes(VkPhysicalDeviceFeatures),
        };
        _ = &supportedFeatureList;
        supportedFeatureList.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FEATURES_2;
        supportedFeatureList.pNext = @ptrCast(@alignCast(&storage));
        storage.pNext = @ptrCast(@alignCast(&multiview));
        multiview.pNext = @ptrCast(@alignCast(&protectedMem));
        protectedMem.pNext = @ptrCast(@alignCast(&ycbcr));
        ycbcr.pNext = @ptrCast(@alignCast(&drawParams));
        drawParams.pNext = @ptrCast(@alignCast(&varPointers));
        renderer.*.vkGetPhysicalDeviceFeatures2.?(physicalDevice, &supportedFeatureList);
        var vk11Features: VkPhysicalDeviceVulkan11Features = VkPhysicalDeviceVulkan11Features{
            .sType = 0,
            .pNext = null,
            .storageBuffer16BitAccess = 0,
            .uniformAndStorageBuffer16BitAccess = 0,
            .storagePushConstant16 = 0,
            .storageInputOutput16 = 0,
            .multiview = 0,
            .multiviewGeometryShader = 0,
            .multiviewTessellationShader = 0,
            .variablePointersStorageBuffer = 0,
            .variablePointers = 0,
            .protectedMemory = 0,
            .samplerYcbcrConversion = 0,
            .shaderDrawParameters = 0,
        };
        _ = &vk11Features;
        vk11Features.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_1_FEATURES;
        vk11Features.storageBuffer16BitAccess = storage.storageBuffer16BitAccess;
        vk11Features.uniformAndStorageBuffer16BitAccess = storage.uniformAndStorageBuffer16BitAccess;
        vk11Features.storagePushConstant16 = storage.storagePushConstant16;
        vk11Features.storageInputOutput16 = storage.storageInputOutput16;
        vk11Features.multiview = multiview.multiview;
        vk11Features.multiviewGeometryShader = multiview.multiviewGeometryShader;
        vk11Features.multiviewTessellationShader = multiview.multiviewTessellationShader;
        vk11Features.protectedMemory = protectedMem.protectedMemory;
        vk11Features.samplerYcbcrConversion = ycbcr.samplerYcbcrConversion;
        vk11Features.shaderDrawParameters = drawParams.shaderDrawParameters;
        vk11Features.variablePointers = varPointers.variablePointers;
        vk11Features.variablePointersStorageBuffer = varPointers.variablePointersStorageBuffer;
        {
            const ref = &supportsAllFeatures;
            ref.* = (@as(c_int, @intFromBool(ref.*)) & @as(c_int, @intFromBool(VULKAN_INTERNAL_ValidateOptInVulkan10Features(&features.*.desiredVulkan10DeviceFeatures, vk10Features)))) != 0;
        }
        {
            const ref = &supportsAllFeatures;
            ref.* = (@as(c_int, @intFromBool(ref.*)) & @as(c_int, @intFromBool(VULKAN_INTERNAL_ValidateOptInVulkan11Features(&features.*.desiredVulkan11DeviceFeatures, &vk11Features)))) != 0;
        }
    } else {
        var vk11Features: VkPhysicalDeviceVulkan11Features = VkPhysicalDeviceVulkan11Features{
            .sType = 0,
            .pNext = null,
            .storageBuffer16BitAccess = 0,
            .uniformAndStorageBuffer16BitAccess = 0,
            .storagePushConstant16 = 0,
            .storageInputOutput16 = 0,
            .multiview = 0,
            .multiviewGeometryShader = 0,
            .multiviewTessellationShader = 0,
            .variablePointersStorageBuffer = 0,
            .variablePointers = 0,
            .protectedMemory = 0,
            .samplerYcbcrConversion = 0,
            .shaderDrawParameters = 0,
        };
        _ = &vk11Features;
        vk11Features.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_1_FEATURES;
        var vk12Features: VkPhysicalDeviceVulkan12Features = VkPhysicalDeviceVulkan12Features{
            .sType = 0,
            .pNext = null,
            .samplerMirrorClampToEdge = 0,
            .drawIndirectCount = 0,
            .storageBuffer8BitAccess = 0,
            .uniformAndStorageBuffer8BitAccess = 0,
            .storagePushConstant8 = 0,
            .shaderBufferInt64Atomics = 0,
            .shaderSharedInt64Atomics = 0,
            .shaderFloat16 = 0,
            .shaderInt8 = 0,
            .descriptorIndexing = 0,
            .shaderInputAttachmentArrayDynamicIndexing = 0,
            .shaderUniformTexelBufferArrayDynamicIndexing = 0,
            .shaderStorageTexelBufferArrayDynamicIndexing = 0,
            .shaderUniformBufferArrayNonUniformIndexing = 0,
            .shaderSampledImageArrayNonUniformIndexing = 0,
            .shaderStorageBufferArrayNonUniformIndexing = 0,
            .shaderStorageImageArrayNonUniformIndexing = 0,
            .shaderInputAttachmentArrayNonUniformIndexing = 0,
            .shaderUniformTexelBufferArrayNonUniformIndexing = 0,
            .shaderStorageTexelBufferArrayNonUniformIndexing = 0,
            .descriptorBindingUniformBufferUpdateAfterBind = 0,
            .descriptorBindingSampledImageUpdateAfterBind = 0,
            .descriptorBindingStorageImageUpdateAfterBind = 0,
            .descriptorBindingStorageBufferUpdateAfterBind = 0,
            .descriptorBindingUniformTexelBufferUpdateAfterBind = 0,
            .descriptorBindingStorageTexelBufferUpdateAfterBind = 0,
            .descriptorBindingUpdateUnusedWhilePending = 0,
            .descriptorBindingPartiallyBound = 0,
            .descriptorBindingVariableDescriptorCount = 0,
            .runtimeDescriptorArray = 0,
            .samplerFilterMinmax = 0,
            .scalarBlockLayout = 0,
            .imagelessFramebuffer = 0,
            .uniformBufferStandardLayout = 0,
            .shaderSubgroupExtendedTypes = 0,
            .separateDepthStencilLayouts = 0,
            .hostQueryReset = 0,
            .timelineSemaphore = 0,
            .bufferDeviceAddress = 0,
            .bufferDeviceAddressCaptureReplay = 0,
            .bufferDeviceAddressMultiDevice = 0,
            .vulkanMemoryModel = 0,
            .vulkanMemoryModelDeviceScope = 0,
            .vulkanMemoryModelAvailabilityVisibilityChains = 0,
            .shaderOutputViewportIndex = 0,
            .shaderOutputLayer = 0,
            .subgroupBroadcastDynamicId = 0,
        };
        _ = &vk12Features;
        vk12Features.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_2_FEATURES;
        var vk13Features: VkPhysicalDeviceVulkan13Features = VkPhysicalDeviceVulkan13Features{
            .sType = 0,
            .pNext = null,
            .robustImageAccess = 0,
            .inlineUniformBlock = 0,
            .descriptorBindingInlineUniformBlockUpdateAfterBind = 0,
            .pipelineCreationCacheControl = 0,
            .privateData = 0,
            .shaderDemoteToHelperInvocation = 0,
            .shaderTerminateInvocation = 0,
            .subgroupSizeControl = 0,
            .computeFullSubgroups = 0,
            .synchronization2 = 0,
            .textureCompressionASTC_HDR = 0,
            .shaderZeroInitializeWorkgroupMemory = 0,
            .dynamicRendering = 0,
            .shaderIntegerDotProduct = 0,
            .maintenance4 = 0,
        };
        _ = &vk13Features;
        vk13Features.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_3_FEATURES;
        var supportedFeatureList: VkPhysicalDeviceFeatures2 = VkPhysicalDeviceFeatures2{
            .sType = 0,
            .pNext = null,
            .features = @import("std").mem.zeroes(VkPhysicalDeviceFeatures),
        };
        _ = &supportedFeatureList;
        supportedFeatureList.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FEATURES_2;
        supportedFeatureList.pNext = @ptrCast(@alignCast(&vk11Features));
        vk11Features.pNext = @ptrCast(@alignCast(&vk12Features));
        vk12Features.pNext = @ptrCast(@alignCast(&vk13Features));
        renderer.*.vkGetPhysicalDeviceFeatures2.?(physicalDevice, &supportedFeatureList);
        {
            const ref = &supportsAllFeatures;
            ref.* = (@as(c_int, @intFromBool(ref.*)) & @as(c_int, @intFromBool(VULKAN_INTERNAL_ValidateOptInVulkan10Features(&features.*.desiredVulkan10DeviceFeatures, vk10Features)))) != 0;
        }
        {
            const ref = &supportsAllFeatures;
            ref.* = (@as(c_int, @intFromBool(ref.*)) & @as(c_int, @intFromBool(VULKAN_INTERNAL_ValidateOptInVulkan11Features(&features.*.desiredVulkan11DeviceFeatures, &vk11Features)))) != 0;
        }
        {
            const ref = &supportsAllFeatures;
            ref.* = (@as(c_int, @intFromBool(ref.*)) & @as(c_int, @intFromBool(VULKAN_INTERNAL_ValidateOptInVulkan12Features(&features.*.desiredVulkan12DeviceFeatures, &vk12Features)))) != 0;
        }
        {
            const ref = &supportsAllFeatures;
            ref.* = (@as(c_int, @intFromBool(ref.*)) & @as(c_int, @intFromBool(VULKAN_INTERNAL_ValidateOptInVulkan13Features(&features.*.desiredVulkan13DeviceFeatures, &vk13Features)))) != 0;
        }
    }
    return supportsAllFeatures;
}
pub fn VULKAN_INTERNAL_AddDeviceFeatures(arg_firstFeature: [*c]VkBool32, lastFeature: [*c]VkBool32, arg_firstFeatureToAdd: [*c]VkBool32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var firstFeature = arg_firstFeature;
    _ = &firstFeature;
    var firstFeatureToAdd = arg_firstFeatureToAdd;
    _ = &firstFeatureToAdd;
    while (firstFeature <= lastFeature) {
        firstFeature.* = firstFeature.* | firstFeatureToAdd.*;
        firstFeature += 1;
        firstFeatureToAdd += 1;
    }
}
pub fn VULKAN_INTERNAL_TryAddDeviceFeatures_Vulkan_11(dst10: [*c]VkPhysicalDeviceFeatures, dst11: [*c]VkPhysicalDeviceVulkan11Features, src: [*c]VkBaseOutStructure) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var hasAdded: bool = undefined;
    _ = &hasAdded;
    var newFeatures: [*c]VkPhysicalDeviceFeatures2 = undefined;
    _ = &newFeatures;
    var newFeatures_1: [*c]VkPhysicalDevice16BitStorageFeatures = undefined;
    _ = &newFeatures_1;
    var newFeatures_2: [*c]VkPhysicalDeviceMultiviewFeatures = undefined;
    _ = &newFeatures_2;
    var newFeatures_3: [*c]VkPhysicalDeviceProtectedMemoryFeatures = undefined;
    _ = &newFeatures_3;
    var newFeatures_4: [*c]VkPhysicalDeviceSamplerYcbcrConversionFeatures = undefined;
    _ = &newFeatures_4;
    var newFeatures_5: [*c]VkPhysicalDeviceShaderDrawParametersFeatures = undefined;
    _ = &newFeatures_5;
    var newFeatures_6: [*c]VkPhysicalDeviceVariablePointersFeatures = undefined;
    _ = &newFeatures_6;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                hasAdded = @"false" != 0;
                switch (src.*.sType) {
                    @as(VkStructureType, VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FEATURES_2) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(VkStructureType, VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_16BIT_STORAGE_FEATURES) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(VkStructureType, VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTIVIEW_FEATURES) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(VkStructureType, VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROTECTED_MEMORY_FEATURES) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(VkStructureType, VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SAMPLER_YCBCR_CONVERSION_FEATURES) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(VkStructureType, VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_DRAW_PARAMETERS_FEATURES) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(VkStructureType, VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTERS_FEATURES) => {
                        sdl_pc = 8;
                        continue;
                    },
                    else => {
                        sdl_pc = 9;
                        continue;
                    },
                }
            },
            1 => {
                return hasAdded;
            },
            2 => {
                newFeatures = @ptrCast(@alignCast(src));
                VULKAN_INTERNAL_AddDeviceFeatures(&dst10.*.robustBufferAccess, &dst10.*.inheritedQueries, &newFeatures.*.features.robustBufferAccess);
                hasAdded = @"true" != 0;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                newFeatures_1 = @ptrCast(@alignCast(src));
                dst11.*.storageBuffer16BitAccess |= newFeatures_1.*.storageBuffer16BitAccess;
                dst11.*.uniformAndStorageBuffer16BitAccess |= newFeatures_1.*.uniformAndStorageBuffer16BitAccess;
                dst11.*.storagePushConstant16 |= newFeatures_1.*.storagePushConstant16;
                dst11.*.storageInputOutput16 |= newFeatures_1.*.storageInputOutput16;
                hasAdded = @"true" != 0;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                newFeatures_2 = @ptrCast(@alignCast(src));
                dst11.*.multiview |= newFeatures_2.*.multiview;
                dst11.*.multiviewGeometryShader |= newFeatures_2.*.multiviewGeometryShader;
                dst11.*.multiviewTessellationShader |= newFeatures_2.*.multiviewTessellationShader;
                hasAdded = @"true" != 0;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            5 => {
                newFeatures_3 = @ptrCast(@alignCast(src));
                dst11.*.protectedMemory |= newFeatures_3.*.protectedMemory;
                hasAdded = @"true" != 0;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            6 => {
                newFeatures_4 = @ptrCast(@alignCast(src));
                dst11.*.samplerYcbcrConversion |= newFeatures_4.*.samplerYcbcrConversion;
                hasAdded = @"true" != 0;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            7 => {
                newFeatures_5 = @ptrCast(@alignCast(src));
                dst11.*.shaderDrawParameters |= newFeatures_5.*.shaderDrawParameters;
                hasAdded = @"true" != 0;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            8 => {
                newFeatures_6 = @ptrCast(@alignCast(src));
                dst11.*.variablePointers |= newFeatures_6.*.variablePointers;
                dst11.*.variablePointersStorageBuffer |= newFeatures_6.*.variablePointersStorageBuffer;
                hasAdded = @"true" != 0;
                {
                    sdl_pc = 1;
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
pub fn VULKAN_INTERNAL_TryAddDeviceFeatures_Vulkan_12_Or_Later(dst10: [*c]VkPhysicalDeviceFeatures, dst11: [*c]VkPhysicalDeviceVulkan11Features, dst12: [*c]VkPhysicalDeviceVulkan12Features, dst13: [*c]VkPhysicalDeviceVulkan13Features, arg_apiVersion: Uint32, src: [*c]VkBaseOutStructure) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var apiVersion = arg_apiVersion;
    _ = &apiVersion;
    const static_local___func__ = struct {
        const __func__: [55:0]u8 = "VULKAN_INTERNAL_TryAddDeviceFeatures_Vulkan_12_Or_Later".*;
    };
    _ = &static_local___func__;
    var minorVersion: c_int = undefined;
    _ = &minorVersion;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "apiVersion >= 2",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data;
    var sdl_assert_state: SDL_AssertState = undefined;
    _ = &sdl_assert_state;
    var hasAdded: bool = undefined;
    _ = &hasAdded;
    var newFeatures: [*c]VkPhysicalDeviceVulkan11Features = undefined;
    _ = &newFeatures;
    var newFeatures_1: [*c]VkPhysicalDeviceVulkan12Features = undefined;
    _ = &newFeatures_1;
    var newFeatures_2: [*c]VkPhysicalDeviceVulkan13Features = undefined;
    _ = &newFeatures_2;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                minorVersion = @bitCast(@as(c_uint, @truncate((apiVersion >> @intCast(@as(c_uint, 12))) & @as(c_uint, 1023))));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            1 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            2 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                hasAdded = VULKAN_INTERNAL_TryAddDeviceFeatures_Vulkan_11(dst10, dst11, src);
                if (!hasAdded) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            4 => {
                if (!(apiVersion >= @as(Uint32, 2))) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu_vulkan.c", 11872);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            6 => {
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            7 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            8 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            9 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            10 => {
                __builtin.debugtrap();
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
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            13 => {
                switch (src.*.sType) {
                    @as(VkStructureType, VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_1_FEATURES) => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(VkStructureType, VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_2_FEATURES) => {
                        sdl_pc = 18;
                        continue;
                    },
                    @as(VkStructureType, VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_3_FEATURES) => {
                        sdl_pc = 19;
                        continue;
                    },
                    else => {
                        sdl_pc = 23;
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
                return hasAdded;
            },
            16 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            17 => {
                newFeatures = @ptrCast(@alignCast(src));
                VULKAN_INTERNAL_AddDeviceFeatures(&dst11.*.storageBuffer16BitAccess, &dst11.*.shaderDrawParameters, &newFeatures.*.storageBuffer16BitAccess);
                hasAdded = @"true" != 0;
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            18 => {
                newFeatures_1 = @ptrCast(@alignCast(src));
                VULKAN_INTERNAL_AddDeviceFeatures(&dst12.*.samplerMirrorClampToEdge, &dst12.*.subgroupBroadcastDynamicId, &newFeatures_1.*.samplerMirrorClampToEdge);
                hasAdded = @"true" != 0;
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            19 => {
                if (minorVersion >= @as(c_int, 3)) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                newFeatures_2 = @ptrCast(@alignCast(src));
                VULKAN_INTERNAL_AddDeviceFeatures(&dst13.*.robustImageAccess, &dst13.*.maintenance4, &newFeatures_2.*.robustImageAccess);
                hasAdded = @"true" != 0;
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
                    sdl_pc = 16;
                    continue;
                }
            },
            23 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn VULKAN_INTERNAL_AddOptInVulkanOptions(props: SDL_PropertiesID, renderer: [*c]VulkanRenderer, features: [*c]VulkanFeatures) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (SDL_HasProperty_REAL(props, "SDL.gpu.device.create.vulkan.options")) {
        var options: [*c]SDL_GPUVulkanOptions = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(props, "SDL.gpu.device.create.vulkan.options", null)));
        _ = &options;
        if (options != null) {
            features.*.usesCustomVulkanOptions = @"true" != 0;
            features.*.desiredApiVersion = options.*.vulkan_api_version;
            _ = memset(@ptrCast(@alignCast(&features.*.desiredVulkan11DeviceFeatures)), 0, @sizeOf(@TypeOf(features.*.desiredVulkan11DeviceFeatures)));
            _ = memset(@ptrCast(@alignCast(&features.*.desiredVulkan12DeviceFeatures)), 0, @sizeOf(@TypeOf(features.*.desiredVulkan12DeviceFeatures)));
            _ = memset(@ptrCast(@alignCast(&features.*.desiredVulkan13DeviceFeatures)), 0, @sizeOf(@TypeOf(features.*.desiredVulkan13DeviceFeatures)));
            features.*.desiredVulkan11DeviceFeatures.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_1_FEATURES;
            features.*.desiredVulkan12DeviceFeatures.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_2_FEATURES;
            features.*.desiredVulkan13DeviceFeatures.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_3_FEATURES;
            var vk10Features: [*c]VkPhysicalDeviceFeatures = &features.*.desiredVulkan10DeviceFeatures;
            _ = &vk10Features;
            var vk11Features: [*c]VkPhysicalDeviceVulkan11Features = &features.*.desiredVulkan11DeviceFeatures;
            _ = &vk11Features;
            var vk12Features: [*c]VkPhysicalDeviceVulkan12Features = &features.*.desiredVulkan12DeviceFeatures;
            _ = &vk12Features;
            var vk13Features: [*c]VkPhysicalDeviceVulkan13Features = &features.*.desiredVulkan13DeviceFeatures;
            _ = &vk13Features;
            if (options.*.vulkan_10_physical_device_features != null) {
                var deviceFeatures: [*c]VkPhysicalDeviceFeatures = @ptrCast(@alignCast(options.*.vulkan_10_physical_device_features));
                _ = &deviceFeatures;
                VULKAN_INTERNAL_AddDeviceFeatures(&vk10Features.*.robustBufferAccess, &vk10Features.*.inheritedQueries, &deviceFeatures.*.robustBufferAccess);
            }
            var minorVersion: c_int = @bitCast(@as(c_uint, @truncate((features.*.desiredApiVersion >> @intCast(@as(c_uint, 12))) & @as(c_uint, 1023))));
            _ = &minorVersion;
            var supportsHigherLevelFeatures: bool = minorVersion > @as(c_int, 0);
            _ = &supportsHigherLevelFeatures;
            if (supportsHigherLevelFeatures and (options.*.feature_list != null)) {
                if (minorVersion < @as(c_int, 2)) {
                    var nextStructure: [*c]VkBaseOutStructure = @ptrCast(@alignCast(options.*.feature_list));
                    _ = &nextStructure;
                    while (nextStructure != null) {
                        _ = VULKAN_INTERNAL_TryAddDeviceFeatures_Vulkan_11(vk10Features, vk11Features, nextStructure);
                        nextStructure = nextStructure.*.pNext;
                    }
                } else {
                    var nextStructure: [*c]VkBaseOutStructure = @ptrCast(@alignCast(options.*.feature_list));
                    _ = &nextStructure;
                    while (nextStructure != null) {
                        _ = VULKAN_INTERNAL_TryAddDeviceFeatures_Vulkan_12_Or_Later(vk10Features, vk11Features, vk12Features, vk13Features, features.*.desiredApiVersion, nextStructure);
                        nextStructure = nextStructure.*.pNext;
                    }
                }
            }
            features.*.additionalDeviceExtensionCount = options.*.device_extension_count;
            features.*.additionalDeviceExtensionNames = options.*.device_extension_names;
            features.*.additionalInstanceExtensionCount = options.*.instance_extension_count;
            features.*.additionalInstanceExtensionNames = options.*.instance_extension_names;
        } else if (renderer.*.debugMode) {
            SDL_LogWarn_REAL(SDL_LOG_CATEGORY_GPU, "VULKAN_INTERNAL_AddOptInVulkanOptions: Additional options property was set, but value was null. This may be a bug.");
        }
    }
}
pub fn VULKAN_INTERNAL_CreateInstance(renderer: [*c]VulkanRenderer, features: [*c]VulkanFeatures) callconv(.c) Uint8 {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [30:0]u8 = "VULKAN_INTERNAL_CreateInstance".*;
    };
    _ = &static_local___func__;
    var vulkanResult: VkResult = undefined;
    _ = &vulkanResult;
    var appInfo: VkApplicationInfo = undefined;
    _ = &appInfo;
    var createFlags: VkInstanceCreateFlags = undefined;
    _ = &createFlags;
    var originalInstanceExtensionNames: [*c]const [*c]const u8 = undefined;
    _ = &originalInstanceExtensionNames;
    var instanceExtensionNames: [*c][*c]const u8 = undefined;
    _ = &instanceExtensionNames;
    var instanceExtensionCount: Uint32 = undefined;
    _ = &instanceExtensionCount;
    var createInfo: VkInstanceCreateInfo = undefined;
    _ = &createInfo;
    const static_local_layerNames = struct {
        var layerNames: [1][*c]const u8 = [1][*c]const u8{
            "VK_LAYER_KHRONOS_validation",
        };
    };
    _ = &static_local_layerNames;
    appInfo.sType = VK_STRUCTURE_TYPE_APPLICATION_INFO;
    appInfo.pNext = null;
    appInfo.pApplicationName = null;
    appInfo.applicationVersion = 0;
    appInfo.pEngineName = "SDLGPU";
    appInfo.engineVersion = @bitCast(@as(c_int, ((SDL_MAJOR_VERSION * @as(c_int, 1000000)) + (SDL_MINOR_VERSION * @as(c_int, 1000))) + SDL_MICRO_VERSION));
    appInfo.apiVersion = if (features.*.usesCustomVulkanOptions) features.*.desiredApiVersion else ((@as(u32, @bitCast(@as(c_int, @as(c_int, 1)))) << @intCast(@as(c_uint, 22))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, 0)))) << @intCast(@as(c_uint, 12)))) | @as(u32, @bitCast(@as(c_int, @as(c_int, 0))));
    createFlags = 0;
    originalInstanceExtensionNames = SDL_Vulkan_GetInstanceExtensions_REAL(&instanceExtensionCount);
    if (!(originalInstanceExtensionNames != null)) {
        SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "SDL_Vulkan_GetInstanceExtensions(): getExtensionCount: %s", SDL_GetError_REAL());
        return 0;
    }
    var extraInstanceExtensionCount: Uint32 = features.*.additionalInstanceExtensionCount;
    _ = &extraInstanceExtensionCount;
    var extraInstanceExtensionNames: [*c][*c]const u8 = features.*.additionalInstanceExtensionNames;
    _ = &extraInstanceExtensionNames;
    instanceExtensionNames = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf([*c]const u8) *% @as(c_ulong, (instanceExtensionCount +% @as(Uint32, 4)) +% extraInstanceExtensionCount))));
    var nextInstanceExtensionNamePtr: [*c][*c]const u8 = instanceExtensionNames;
    _ = &nextInstanceExtensionNamePtr;
    _ = memcpy(@ptrCast(@alignCast(nextInstanceExtensionNamePtr)), @ptrCast(@alignCast(originalInstanceExtensionNames)), @as(c_ulong, instanceExtensionCount) *% @sizeOf([*c]const u8));
    nextInstanceExtensionNamePtr += instanceExtensionCount;
    if (extraInstanceExtensionCount > @as(Uint32, 0)) {
        _ = memcpy(@ptrCast(@alignCast(nextInstanceExtensionNamePtr)), @ptrCast(@alignCast(extraInstanceExtensionNames)), @as(c_ulong, extraInstanceExtensionCount) *% @sizeOf([*c]const u8));
        nextInstanceExtensionNamePtr += extraInstanceExtensionCount;
    }
    var firstUnsupportedExtensionIndex: c_int = 0;
    _ = &firstUnsupportedExtensionIndex;
    if (!(@as(c_int, VULKAN_INTERNAL_CheckInstanceExtensions(instanceExtensionNames, instanceExtensionCount +% extraInstanceExtensionCount, &renderer.*.supportsDebugUtils, &renderer.*.supportsColorspace, &renderer.*.supportsPhysicalDeviceProperties2, &renderer.*.supportsPortabilityEnumeration, &firstUnsupportedExtensionIndex)) != 0)) {
        if (renderer.*.debugMode) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "Required Vulkan instance extension '%s' not supported", instanceExtensionNames[@bitCast(@as(isize, @intCast(firstUnsupportedExtensionIndex)))]);
        }
        _ = SDL_SetError_REAL("Required Vulkan instance extension '%s' not supported", instanceExtensionNames[@bitCast(@as(isize, @intCast(firstUnsupportedExtensionIndex)))]);
        SDL_free_REAL(@ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(instanceExtensionNames))))));
        return @"false";
    }
    if (renderer.*.supportsDebugUtils) {
        (blk: {
            const ref = &nextInstanceExtensionNamePtr;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        }).* = "VK_EXT_debug_utils";
        instanceExtensionCount +%= 1;
    } else {
        SDL_LogWarn_REAL(SDL_LOG_CATEGORY_GPU, "%s is not supported!", @as([*c]u8, @as([*c]u8, @constCast("VK_EXT_debug_utils"))));
    }
    if (renderer.*.supportsColorspace) {
        (blk: {
            const ref = &nextInstanceExtensionNamePtr;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        }).* = "VK_EXT_swapchain_colorspace";
        instanceExtensionCount +%= 1;
    }
    if (renderer.*.supportsPhysicalDeviceProperties2) {
        (blk: {
            const ref = &nextInstanceExtensionNamePtr;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        }).* = "VK_KHR_get_physical_device_properties2";
        instanceExtensionCount +%= 1;
    }
    if (renderer.*.supportsPortabilityEnumeration) {
        (blk: {
            const ref = &nextInstanceExtensionNamePtr;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        }).* = "VK_KHR_portability_enumeration";
        instanceExtensionCount +%= 1;
        createFlags |= VK_INSTANCE_CREATE_ENUMERATE_PORTABILITY_BIT_KHR;
    }
    createInfo.sType = VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO;
    createInfo.pNext = null;
    createInfo.flags = createFlags;
    createInfo.pApplicationInfo = &appInfo;
    createInfo.ppEnabledLayerNames = @ptrCast(@alignCast(&static_local_layerNames.layerNames));
    createInfo.enabledExtensionCount = instanceExtensionCount +% extraInstanceExtensionCount;
    createInfo.ppEnabledExtensionNames = instanceExtensionNames;
    if (renderer.*.debugMode) {
        createInfo.enabledLayerCount = @truncate(@sizeOf(@TypeOf(static_local_layerNames.layerNames)) / @sizeOf(@TypeOf(static_local_layerNames.layerNames[@as(c_int, 0)])));
        if (!(@as(c_int, VULKAN_INTERNAL_CheckValidationLayers(@ptrCast(@alignCast(&static_local_layerNames.layerNames)), createInfo.enabledLayerCount)) != 0)) {
            SDL_LogWarn_REAL(SDL_LOG_CATEGORY_GPU, "Validation layers not found, continuing without validation");
            createInfo.enabledLayerCount = 0;
        } else {
            SDL_LogInfo_REAL(SDL_LOG_CATEGORY_GPU, "Validation layers enabled, expect debug level performance!");
        }
    } else {
        createInfo.enabledLayerCount = 0;
    }
    if (renderer.*.xrInstance != null) {
        var xrResult: XrResult = undefined;
        _ = &xrResult;
        var xrCreateVulkanInstanceKHR: PFN_xrCreateVulkanInstanceKHR = undefined;
        _ = &xrCreateVulkanInstanceKHR;
        if ((blk: {
            const tmp = OPENXR_xrGetInstanceProcAddr.?(renderer.*.xrInstance, "xrCreateVulkanInstanceKHR", @ptrCast(@alignCast(&xrCreateVulkanInstanceKHR)));
            xrResult = tmp;
            break :blk tmp;
        }) != XR_SUCCESS) {
            SDL_LogDebug_REAL(SDL_LOG_CATEGORY_GPU, "Failed to get xrCreateVulkanInstanceKHR");
            SDL_free_REAL(@ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(instanceExtensionNames))))));
            return 0;
        }
        var xrCreateInfo: XrVulkanInstanceCreateInfoKHR = undefined;
        _ = &xrCreateInfo;
        _ = memset(@ptrCast(@alignCast(&xrCreateInfo)), 0, @sizeOf(@TypeOf(xrCreateInfo)));
        xrCreateInfo.type = XR_TYPE_VULKAN_INSTANCE_CREATE_INFO_KHR;
        xrCreateInfo.vulkanCreateInfo = &createInfo;
        xrCreateInfo.systemId = renderer.*.xrSystemId;
        xrCreateInfo.pfnGetInstanceProcAddr = @ptrCast(@alignCast(@constCast(SDL_Vulkan_GetVkGetInstanceProcAddr_REAL())));
        while (true) {
            while (!(xrCreateInfo.pfnGetInstanceProcAddr != null)) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "xrCreateInfo.pfnGetInstanceProcAddr",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu_vulkan.c", 12119);
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
        if ((blk: {
            const tmp = xrCreateVulkanInstanceKHR.?(renderer.*.xrInstance, &xrCreateInfo, &renderer.*.instance, &vulkanResult);
            xrResult = tmp;
            break :blk tmp;
        }) != XR_SUCCESS) {
            SDL_LogDebug_REAL(SDL_LOG_CATEGORY_GPU, "Failed to create vulkan instance, reason %d, %d", xrResult, vulkanResult);
            SDL_free_REAL(@ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(instanceExtensionNames))))));
            return 0;
        }
    } else {
        vulkanResult = vkCreateInstance.?(&createInfo, null, &renderer.*.instance);
    }
    SDL_free_REAL(@ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(instanceExtensionNames))))));
    if (vulkanResult != VK_SUCCESS) {
        while (true) {
            if (vulkanResult != VK_SUCCESS) {
                if (renderer.*.debugMode) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateInstance"))), VkErrorMessages(vulkanResult));
                }
                _ = SDL_SetError_REAL("%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateInstance"))), VkErrorMessages(vulkanResult));
                return @bitCast(@as(i8, @truncate(@as(c_int, 0))));
            }
            if (!false) break;
        }
    }
    return 1;
}
pub fn VULKAN_INTERNAL_GetDeviceRank(renderer: [*c]VulkanRenderer, physicalDevice: VkPhysicalDevice, physicalDeviceExtensions: [*c]VulkanExtensions, deviceRank: [*c]Uint64) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local_DEVICE_PRIORITY_HIGHPERFORMANCE = struct {
        const DEVICE_PRIORITY_HIGHPERFORMANCE: [5]Uint8 = [5]Uint8{
            0,
            3,
            4,
            2,
            1,
        };
    };
    _ = &static_local_DEVICE_PRIORITY_HIGHPERFORMANCE;
    const static_local_DEVICE_PRIORITY_LOWPOWER = struct {
        const DEVICE_PRIORITY_LOWPOWER: [5]Uint8 = [5]Uint8{
            0,
            4,
            3,
            2,
            1,
        };
    };
    _ = &static_local_DEVICE_PRIORITY_LOWPOWER;
    var devicePriority: [*c]const Uint8 = if (renderer.*.preferLowPower) @as([*c]const Uint8, @ptrCast(@alignCast(&static_local_DEVICE_PRIORITY_LOWPOWER.DEVICE_PRIORITY_LOWPOWER))) else @as([*c]const Uint8, @ptrCast(@alignCast(&static_local_DEVICE_PRIORITY_HIGHPERFORMANCE.DEVICE_PRIORITY_HIGHPERFORMANCE)));
    _ = &devicePriority;
    var isConformant: bool = undefined;
    _ = &isConformant;
    var deviceType: VkPhysicalDeviceType = undefined;
    _ = &deviceType;
    if ((@as(c_int, physicalDeviceExtensions.*.KHR_driver_properties) != 0) or (@as(c_int, physicalDeviceExtensions.*.MSFT_layered_driver) != 0)) {
        var physicalDeviceProperties: VkPhysicalDeviceProperties2KHR = undefined;
        _ = &physicalDeviceProperties;
        var physicalDeviceDriverProperties: VkPhysicalDeviceDriverPropertiesKHR = VkPhysicalDeviceDriverPropertiesKHR{
            .sType = 0,
            .pNext = null,
            .driverID = @import("std").mem.zeroes(VkDriverId),
            .driverName = @import("std").mem.zeroes([256]u8),
            .driverInfo = @import("std").mem.zeroes([256]u8),
            .conformanceVersion = @import("std").mem.zeroes(VkConformanceVersion),
        };
        _ = &physicalDeviceDriverProperties;
        var physicalDeviceLayeredDriverProperties: VkPhysicalDeviceLayeredDriverPropertiesMSFT = VkPhysicalDeviceLayeredDriverPropertiesMSFT{
            .sType = 0,
            .pNext = null,
            .underlyingAPI = @import("std").mem.zeroes(VkLayeredDriverUnderlyingApiMSFT),
        };
        _ = &physicalDeviceLayeredDriverProperties;
        var ppNext: [*c]?*anyopaque = &physicalDeviceProperties.pNext;
        _ = &ppNext;
        physicalDeviceProperties.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROPERTIES_2;
        if (@as(c_int, physicalDeviceExtensions.*.KHR_driver_properties) != 0) {
            ppNext.* = @ptrCast(@alignCast(&physicalDeviceDriverProperties));
            ppNext = &physicalDeviceDriverProperties.pNext;
            physicalDeviceDriverProperties.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DRIVER_PROPERTIES_KHR;
        }
        if (@as(c_int, physicalDeviceExtensions.*.MSFT_layered_driver) != 0) {
            ppNext.* = @ptrCast(@alignCast(&physicalDeviceLayeredDriverProperties));
            ppNext = &physicalDeviceLayeredDriverProperties.pNext;
            physicalDeviceLayeredDriverProperties.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_DRIVER_PROPERTIES_MSFT;
        }
        ppNext.* = null;
        renderer.*.vkGetPhysicalDeviceProperties2KHR.?(physicalDevice, &physicalDeviceProperties);
        if (@as(c_int, physicalDeviceExtensions.*.KHR_driver_properties) != 0) {
            isConformant = @as(c_int, physicalDeviceDriverProperties.conformanceVersion.major) >= @as(c_int, 1);
        } else {
            isConformant = @"true" != 0;
        }
        if ((@as(c_int, physicalDeviceExtensions.*.MSFT_layered_driver) != 0) and (physicalDeviceLayeredDriverProperties.underlyingAPI != @as(VkLayeredDriverUnderlyingApiMSFT, VK_LAYERED_DRIVER_UNDERLYING_API_NONE_MSFT))) {
            deviceType = VK_PHYSICAL_DEVICE_TYPE_VIRTUAL_GPU;
            isConformant = @"true" != 0;
        } else {
            deviceType = physicalDeviceProperties.properties.deviceType;
        }
    } else {
        var physicalDeviceProperties: VkPhysicalDeviceProperties = undefined;
        _ = &physicalDeviceProperties;
        renderer.*.vkGetPhysicalDeviceProperties.?(physicalDevice, &physicalDeviceProperties);
        deviceType = physicalDeviceProperties.deviceType;
        isConformant = @"true" != 0;
    }
    if (renderer.*.requireHardwareAcceleration) {
        if (((deviceType != @as(VkPhysicalDeviceType, VK_PHYSICAL_DEVICE_TYPE_DISCRETE_GPU)) and (deviceType != @as(VkPhysicalDeviceType, VK_PHYSICAL_DEVICE_TYPE_INTEGRATED_GPU))) and (deviceType != @as(VkPhysicalDeviceType, VK_PHYSICAL_DEVICE_TYPE_VIRTUAL_GPU))) {
            return @as(c_int, 0) != 0;
        }
    }
    if (!isConformant) {
        return @as(c_int, 0) != 0;
    }
    var devicePriorityValue: Uint64 = @bitCast(@as(c_long, @as(c_int, devicePriority[deviceType]) * @as(c_int, 1000000)));
    _ = &devicePriorityValue;
    if (deviceRank.* < devicePriorityValue) {
        deviceRank.* = devicePriorityValue;
    } else if (deviceRank.* > devicePriorityValue) {
        deviceRank.* = 0;
        return @"false" != 0;
    }
    if (!renderer.*.preferLowPower) {
        var i: Uint32 = undefined;
        _ = &i;
        var videoMemory: Uint64 = 0;
        _ = &videoMemory;
        var deviceMemory: VkPhysicalDeviceMemoryProperties = undefined;
        _ = &deviceMemory;
        renderer.*.vkGetPhysicalDeviceMemoryProperties.?(physicalDevice, &deviceMemory);
        {
            i = 0;
            while (i < deviceMemory.memoryHeapCount) : (i +%= 1) {
                var heap: VkMemoryHeap = deviceMemory.memoryHeaps[i];
                _ = &heap;
                if ((heap.flags & @as(VkMemoryHeapFlags, VK_MEMORY_HEAP_DEVICE_LOCAL_BIT)) != 0) {
                    videoMemory +%= heap.size;
                }
            }
        }
        var videoMemoryRounded: Uint64 = (videoMemory / @as(Uint64, 1024)) / @as(Uint64, 1024);
        _ = &videoMemoryRounded;
        deviceRank.* +%= videoMemoryRounded;
    }
    return @"true" != 0;
}
pub fn VULKAN_INTERNAL_IsDeviceSuitable(renderer: [*c]VulkanRenderer, features: [*c]VulkanFeatures, physicalDevice: VkPhysicalDevice, physicalDeviceExtensions: [*c]VulkanExtensions, queueFamilyIndex: [*c]Uint32) callconv(.c) Uint8 {
    @setEvalBranchQuota(100000);
    var queueFamilyCount: Uint32 = undefined;
    _ = &queueFamilyCount;
    var queueFamilyRank: Uint32 = undefined;
    _ = &queueFamilyRank;
    var queueFamilyBest: Uint32 = undefined;
    _ = &queueFamilyBest;
    var queueProps: [*c]VkQueueFamilyProperties = undefined;
    _ = &queueProps;
    var supportsPresent: bool = undefined;
    _ = &supportsPresent;
    var deviceFeatures: VkPhysicalDeviceFeatures = undefined;
    _ = &deviceFeatures;
    var i: Uint32 = undefined;
    _ = &i;
    renderer.*.vkGetPhysicalDeviceFeatures.?(physicalDevice, &deviceFeatures);
    if ((((((((@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(deviceFeatures.independentBlend != 0))))) != 0) and (features.*.desiredVulkan10DeviceFeatures.independentBlend != 0)) or ((@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(deviceFeatures.imageCubeArray != 0))))) != 0) and (features.*.desiredVulkan10DeviceFeatures.imageCubeArray != 0))) or ((@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(deviceFeatures.depthClamp != 0))))) != 0) and (features.*.desiredVulkan10DeviceFeatures.depthClamp != 0))) or ((@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(deviceFeatures.shaderClipDistance != 0))))) != 0) and (features.*.desiredVulkan10DeviceFeatures.shaderClipDistance != 0))) or ((@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(deviceFeatures.drawIndirectFirstInstance != 0))))) != 0) and (features.*.desiredVulkan10DeviceFeatures.drawIndirectFirstInstance != 0))) or ((@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(deviceFeatures.sampleRateShading != 0))))) != 0) and (features.*.desiredVulkan10DeviceFeatures.sampleRateShading != 0))) or ((@as(VkBool32, @bitCast(@as(c_int, @intFromBool(!(deviceFeatures.samplerAnisotropy != 0))))) != 0) and (features.*.desiredVulkan10DeviceFeatures.samplerAnisotropy != 0))) {
        return 0;
    }
    if (features.*.usesCustomVulkanOptions) {
        var supportsAllFeatures: bool = VULKAN_INTERNAL_ValidateOptInFeatures(renderer, features, physicalDevice, &deviceFeatures);
        _ = &supportsAllFeatures;
        if (!supportsAllFeatures) {
            return 0;
        }
    }
    if (!(@as(c_int, VULKAN_INTERNAL_CheckDeviceExtensions(renderer, features, physicalDevice, physicalDeviceExtensions)) != 0)) {
        return 0;
    }
    renderer.*.vkGetPhysicalDeviceQueueFamilyProperties.?(physicalDevice, &queueFamilyCount, null);
    queueProps = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(VkQueueFamilyProperties) *% @as(c_ulong, queueFamilyCount))));
    renderer.*.vkGetPhysicalDeviceQueueFamilyProperties.?(physicalDevice, &queueFamilyCount, queueProps);
    queueFamilyBest = 0;
    queueFamilyIndex.* = @as(c_uint, 4294967295);
    {
        i = 0;
        while (i < queueFamilyCount) : (i +%= 1) {
            supportsPresent = SDL_Vulkan_GetPresentationSupport_REAL(renderer.*.instance, physicalDevice, i);
            if (!supportsPresent or !((queueProps[i].queueFlags & @as(VkQueueFlags, VK_QUEUE_GRAPHICS_BIT)) != 0)) {
                continue;
            }
            if ((queueProps[i].queueFlags & @as(VkQueueFlags, VK_QUEUE_COMPUTE_BIT)) != 0) {
                if ((queueProps[i].queueFlags & @as(VkQueueFlags, VK_QUEUE_TRANSFER_BIT)) != 0) {
                    queueFamilyRank = 3;
                } else {
                    queueFamilyRank = 2;
                }
            } else {
                queueFamilyRank = 1;
            }
            if (queueFamilyRank > queueFamilyBest) {
                queueFamilyIndex.* = i;
                queueFamilyBest = queueFamilyRank;
            }
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(queueProps)));
    if (queueFamilyIndex.* == @as(c_uint, 4294967295)) {
        return 0;
    }
    return 1;
}
pub fn VULKAN_INTERNAL_DeterminePhysicalDevice(renderer: [*c]VulkanRenderer, features: [*c]VulkanFeatures) callconv(.c) Uint8 {
    @setEvalBranchQuota(100000);
    var vulkanResult: VkResult = undefined;
    _ = &vulkanResult;
    var physicalDevices: [*c]VkPhysicalDevice = undefined;
    _ = &physicalDevices;
    var physicalDeviceExtensions: [*c]VulkanExtensions = undefined;
    _ = &physicalDeviceExtensions;
    var i: Uint32 = undefined;
    _ = &i;
    var physicalDeviceCount: Uint32 = undefined;
    _ = &physicalDeviceCount;
    var suitableIndex: Sint32 = undefined;
    _ = &suitableIndex;
    var suitableQueueFamilyIndex: Uint32 = undefined;
    _ = &suitableQueueFamilyIndex;
    var highestRank: Uint64 = undefined;
    _ = &highestRank;
    if (renderer.*.xrInstance != null) {
        var xrResult: XrResult = undefined;
        _ = &xrResult;
        var xrPhysicalDeviceExtensions: VulkanExtensions = undefined;
        _ = &xrPhysicalDeviceExtensions;
        var queueFamilyIndex: Uint32 = undefined;
        _ = &queueFamilyIndex;
        var xrGetVulkanGraphicsDevice2KHR: PFN_xrGetVulkanGraphicsDevice2KHR = undefined;
        _ = &xrGetVulkanGraphicsDevice2KHR;
        xrResult = OPENXR_xrGetInstanceProcAddr.?(renderer.*.xrInstance, "xrGetVulkanGraphicsDevice2KHR", @ptrCast(@alignCast(&xrGetVulkanGraphicsDevice2KHR)));
        if (xrResult != XR_SUCCESS) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "Failed to get xrGetVulkanGraphicsDevice2KHR, result: %d", xrResult);
            return 0;
        }
        var graphicsDeviceGetInfo: XrVulkanGraphicsDeviceGetInfoKHR = undefined;
        _ = &graphicsDeviceGetInfo;
        _ = memset(@ptrCast(@alignCast(&graphicsDeviceGetInfo)), 0, @sizeOf(@TypeOf(graphicsDeviceGetInfo)));
        graphicsDeviceGetInfo.type = XR_TYPE_VULKAN_GRAPHICS_DEVICE_GET_INFO_KHR;
        graphicsDeviceGetInfo.systemId = renderer.*.xrSystemId;
        graphicsDeviceGetInfo.vulkanInstance = renderer.*.instance;
        xrResult = xrGetVulkanGraphicsDevice2KHR.?(renderer.*.xrInstance, &graphicsDeviceGetInfo, &renderer.*.physicalDevice);
        if (xrResult != XR_SUCCESS) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "xrGetVulkanGraphicsDevice2KHR failed, result: %d", xrResult);
            return 0;
        }
        if (!(@as(c_int, VULKAN_INTERNAL_IsDeviceSuitable(renderer, features, renderer.*.physicalDevice, &xrPhysicalDeviceExtensions, &queueFamilyIndex)) != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "The physical device chosen by the OpenXR runtime is not suitable");
            return 0;
        }
        renderer.*.supports = xrPhysicalDeviceExtensions;
        renderer.*.queueFamilyIndex = queueFamilyIndex;
    } else {
        vulkanResult = renderer.*.vkEnumeratePhysicalDevices.?(renderer.*.instance, &physicalDeviceCount, null);
        while (true) {
            if (vulkanResult != VK_SUCCESS) {
                if (renderer.*.debugMode) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkEnumeratePhysicalDevices"))), VkErrorMessages(vulkanResult));
                }
                _ = SDL_SetError_REAL("%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkEnumeratePhysicalDevices"))), VkErrorMessages(vulkanResult));
                return @bitCast(@as(i8, @truncate(@as(c_int, 0))));
            }
            if (!false) break;
        }
        if (physicalDeviceCount == @as(Uint32, 0)) {
            SDL_LogInfo_REAL(SDL_LOG_CATEGORY_GPU, "Failed to find any GPUs with Vulkan support");
            return 0;
        }
        physicalDevices = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(VkPhysicalDevice) *% @as(c_ulong, physicalDeviceCount))));
        physicalDeviceExtensions = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(VulkanExtensions) *% @as(c_ulong, physicalDeviceCount))));
        vulkanResult = renderer.*.vkEnumeratePhysicalDevices.?(renderer.*.instance, &physicalDeviceCount, physicalDevices);
        if (vulkanResult == VK_INCOMPLETE) {
            SDL_LogWarn_REAL(SDL_LOG_CATEGORY_GPU, "vkEnumeratePhysicalDevices returned VK_INCOMPLETE, will keep trying anyway...");
            vulkanResult = VK_SUCCESS;
        }
        if (vulkanResult != VK_SUCCESS) {
            SDL_LogWarn_REAL(SDL_LOG_CATEGORY_GPU, "vkEnumeratePhysicalDevices failed: %s", VkErrorMessages(vulkanResult));
            SDL_free_REAL(@ptrCast(@alignCast(physicalDevices)));
            SDL_free_REAL(@ptrCast(@alignCast(physicalDeviceExtensions)));
            return 0;
        }
        suitableIndex = -@as(c_int, 1);
        suitableQueueFamilyIndex = 0;
        highestRank = 0;
        {
            i = 0;
            while (i < physicalDeviceCount) : (i +%= 1) {
                var queueFamilyIndex: Uint32 = undefined;
                _ = &queueFamilyIndex;
                var deviceRank: Uint64 = undefined;
                _ = &deviceRank;
                if (!(@as(c_int, VULKAN_INTERNAL_IsDeviceSuitable(renderer, features, physicalDevices[i], &physicalDeviceExtensions[i], &queueFamilyIndex)) != 0)) {
                    continue;
                }
                deviceRank = highestRank;
                if (VULKAN_INTERNAL_GetDeviceRank(renderer, physicalDevices[i], &physicalDeviceExtensions[i], &deviceRank)) {
                    suitableIndex = @bitCast(@as(c_uint, @truncate(i)));
                    suitableQueueFamilyIndex = queueFamilyIndex;
                    highestRank = deviceRank;
                }
            }
        }
        if (suitableIndex != -@as(c_int, 1)) {
            renderer.*.supports = physicalDeviceExtensions[@bitCast(@as(isize, @intCast(suitableIndex)))];
            renderer.*.physicalDevice = physicalDevices[@bitCast(@as(isize, @intCast(suitableIndex)))];
            renderer.*.queueFamilyIndex = suitableQueueFamilyIndex;
        } else {
            SDL_free_REAL(@ptrCast(@alignCast(physicalDevices)));
            SDL_free_REAL(@ptrCast(@alignCast(physicalDeviceExtensions)));
            return 0;
        }
        SDL_free_REAL(@ptrCast(@alignCast(physicalDevices)));
        SDL_free_REAL(@ptrCast(@alignCast(physicalDeviceExtensions)));
    }
    renderer.*.physicalDeviceProperties.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROPERTIES_2;
    if (@as(c_int, renderer.*.supports.KHR_driver_properties) != 0) {
        renderer.*.physicalDeviceDriverProperties.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DRIVER_PROPERTIES_KHR;
        renderer.*.physicalDeviceDriverProperties.pNext = null;
        renderer.*.physicalDeviceProperties.pNext = @ptrCast(@alignCast(&renderer.*.physicalDeviceDriverProperties));
        renderer.*.vkGetPhysicalDeviceProperties2KHR.?(renderer.*.physicalDevice, &renderer.*.physicalDeviceProperties);
    } else {
        renderer.*.physicalDeviceProperties.pNext = null;
        renderer.*.vkGetPhysicalDeviceProperties.?(renderer.*.physicalDevice, &renderer.*.physicalDeviceProperties.properties);
    }
    renderer.*.vkGetPhysicalDeviceMemoryProperties.?(renderer.*.physicalDevice, &renderer.*.memoryProperties);
    return 1;
}
pub fn VULKAN_INTERNAL_CreateLogicalDevice(renderer: [*c]VulkanRenderer, features: [*c]VulkanFeatures) callconv(.c) Uint8 {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [35:0]u8 = "VULKAN_INTERNAL_CreateLogicalDevice".*;
    };
    _ = &static_local___func__;
    var vulkanResult: VkResult = undefined;
    _ = &vulkanResult;
    var deviceCreateInfo: VkDeviceCreateInfo = undefined;
    _ = &deviceCreateInfo;
    var haveDeviceFeatures: VkPhysicalDeviceFeatures = undefined;
    _ = &haveDeviceFeatures;
    var portabilityFeatures: VkPhysicalDevicePortabilitySubsetFeaturesKHR = undefined;
    _ = &portabilityFeatures;
    var deviceExtensions: [*c][*c]const u8 = undefined;
    _ = &deviceExtensions;
    var extensionCount: Uint32 = undefined;
    _ = &extensionCount;
    var i: Uint32 = undefined;
    _ = &i;
    var queueCreateInfo: VkDeviceQueueCreateInfo = undefined;
    _ = &queueCreateInfo;
    var queuePriority: f32 = 1.0;
    _ = &queuePriority;
    queueCreateInfo.sType = VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO;
    queueCreateInfo.pNext = null;
    queueCreateInfo.flags = 0;
    queueCreateInfo.queueFamilyIndex = renderer.*.queueFamilyIndex;
    queueCreateInfo.queueCount = 1;
    queueCreateInfo.pQueuePriorities = &queuePriority;
    renderer.*.vkGetPhysicalDeviceFeatures.?(renderer.*.physicalDevice, &haveDeviceFeatures);
    if (haveDeviceFeatures.fillModeNonSolid != 0) {
        features.*.desiredVulkan10DeviceFeatures.fillModeNonSolid = VK_TRUE;
        renderer.*.supportsFillModeNonSolid = @"true" != 0;
    }
    if (haveDeviceFeatures.multiDrawIndirect != 0) {
        features.*.desiredVulkan10DeviceFeatures.multiDrawIndirect = VK_TRUE;
        renderer.*.supportsMultiDrawIndirect = @"true" != 0;
    }
    deviceCreateInfo.sType = VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO;
    if (@as(c_int, renderer.*.supports.KHR_portability_subset) != 0) {
        portabilityFeatures.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_FEATURES_KHR;
        portabilityFeatures.pNext = null;
        portabilityFeatures.constantAlphaColorBlendFactors = VK_FALSE;
        portabilityFeatures.events = VK_FALSE;
        portabilityFeatures.imageViewFormatReinterpretation = VK_FALSE;
        portabilityFeatures.imageViewFormatSwizzle = VK_TRUE;
        portabilityFeatures.imageView2DOn3DImage = VK_FALSE;
        portabilityFeatures.multisampleArrayImage = VK_FALSE;
        portabilityFeatures.mutableComparisonSamplers = VK_FALSE;
        portabilityFeatures.pointPolygons = VK_FALSE;
        portabilityFeatures.samplerMipLodBias = VK_FALSE;
        portabilityFeatures.separateStencilMaskRef = VK_FALSE;
        portabilityFeatures.shaderSampleRateInterpolationFunctions = VK_FALSE;
        portabilityFeatures.tessellationIsolines = VK_FALSE;
        portabilityFeatures.tessellationPointMode = VK_FALSE;
        portabilityFeatures.triangleFans = VK_FALSE;
        portabilityFeatures.vertexAttributeAccessBeyondStride = VK_FALSE;
        deviceCreateInfo.pNext = @ptrCast(@alignCast(&portabilityFeatures));
    } else {
        deviceCreateInfo.pNext = null;
    }
    deviceCreateInfo.flags = 0;
    deviceCreateInfo.queueCreateInfoCount = 1;
    deviceCreateInfo.pQueueCreateInfos = &queueCreateInfo;
    deviceCreateInfo.enabledLayerCount = 0;
    deviceCreateInfo.ppEnabledLayerNames = null;
    extensionCount = GetDeviceExtensionCount(&renderer.*.supports);
    deviceExtensions = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf([*c]const u8) *% @as(c_ulong, extensionCount +% features.*.additionalDeviceExtensionCount))));
    CreateDeviceExtensionArray(&renderer.*.supports, deviceExtensions);
    {
        i = 0;
        while (i < features.*.additionalDeviceExtensionCount) : (i +%= 1) {
            deviceExtensions[
                blk: {
                    const ref = &extensionCount;
                    const tmp = ref.*;
                    ref.* +%= 1;
                    break :blk tmp;
                }
            ] = features.*.additionalDeviceExtensionNames[i];
        }
    }
    deviceCreateInfo.enabledExtensionCount = extensionCount;
    deviceCreateInfo.ppEnabledExtensionNames = deviceExtensions;
    var featureList: VkPhysicalDeviceFeatures2 = undefined;
    _ = &featureList;
    var minor: c_int = @bitCast(@as(c_uint, @truncate((features.*.desiredApiVersion >> @intCast(@as(c_uint, 12))) & @as(c_uint, 1023))));
    _ = &minor;
    const struct_unnamed_20 = extern struct {
        storage: VkPhysicalDevice16BitStorageFeatures = @import("std").mem.zeroes(VkPhysicalDevice16BitStorageFeatures),
        multiview: VkPhysicalDeviceMultiviewFeatures = @import("std").mem.zeroes(VkPhysicalDeviceMultiviewFeatures),
        protectedMem: VkPhysicalDeviceProtectedMemoryFeatures = @import("std").mem.zeroes(VkPhysicalDeviceProtectedMemoryFeatures),
        ycbcr: VkPhysicalDeviceSamplerYcbcrConversionFeatures = @import("std").mem.zeroes(VkPhysicalDeviceSamplerYcbcrConversionFeatures),
        drawParams: VkPhysicalDeviceShaderDrawParametersFeatures = @import("std").mem.zeroes(VkPhysicalDeviceShaderDrawParametersFeatures),
        varPointers: VkPhysicalDeviceVariablePointersFeatures = @import("std").mem.zeroes(VkPhysicalDeviceVariablePointersFeatures),
    };
    _ = &struct_unnamed_20;
    var legacyFeatures: struct_unnamed_20 = undefined;
    _ = &legacyFeatures;
    if (features.*.usesCustomVulkanOptions and (minor > @as(c_int, 0))) {
        featureList.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FEATURES_2;
        featureList.features = features.*.desiredVulkan10DeviceFeatures;
        if (minor > @as(c_int, 1)) {
            featureList.pNext = @ptrCast(@alignCast(&features.*.desiredVulkan11DeviceFeatures));
            features.*.desiredVulkan11DeviceFeatures.pNext = @ptrCast(@alignCast(&features.*.desiredVulkan12DeviceFeatures));
            features.*.desiredVulkan12DeviceFeatures.pNext = if (minor > @as(c_int, 2)) @as(?*anyopaque, @ptrCast(@alignCast(&features.*.desiredVulkan13DeviceFeatures))) else @as(?*anyopaque, null);
            features.*.desiredVulkan13DeviceFeatures.pNext = null;
        } else {
            _ = memset(@ptrCast(@alignCast(&legacyFeatures)), 0, @sizeOf(@TypeOf(legacyFeatures)));
            legacyFeatures.storage.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_16BIT_STORAGE_FEATURES;
            legacyFeatures.storage.storageBuffer16BitAccess = features.*.desiredVulkan11DeviceFeatures.storageBuffer16BitAccess;
            legacyFeatures.storage.storageInputOutput16 = features.*.desiredVulkan11DeviceFeatures.storageInputOutput16;
            legacyFeatures.storage.storagePushConstant16 = features.*.desiredVulkan11DeviceFeatures.storagePushConstant16;
            legacyFeatures.storage.uniformAndStorageBuffer16BitAccess = features.*.desiredVulkan11DeviceFeatures.uniformAndStorageBuffer16BitAccess;
            legacyFeatures.multiview.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTIVIEW_FEATURES;
            legacyFeatures.multiview.multiview = features.*.desiredVulkan11DeviceFeatures.multiview;
            legacyFeatures.multiview.multiviewGeometryShader = features.*.desiredVulkan11DeviceFeatures.multiviewGeometryShader;
            legacyFeatures.multiview.multiviewTessellationShader = features.*.desiredVulkan11DeviceFeatures.multiviewTessellationShader;
            legacyFeatures.protectedMem.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROTECTED_MEMORY_FEATURES;
            legacyFeatures.protectedMem.protectedMemory = features.*.desiredVulkan11DeviceFeatures.protectedMemory;
            legacyFeatures.ycbcr.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SAMPLER_YCBCR_CONVERSION_FEATURES;
            legacyFeatures.ycbcr.samplerYcbcrConversion = features.*.desiredVulkan11DeviceFeatures.samplerYcbcrConversion;
            legacyFeatures.drawParams.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_DRAW_PARAMETERS_FEATURES;
            legacyFeatures.drawParams.shaderDrawParameters = features.*.desiredVulkan11DeviceFeatures.shaderDrawParameters;
            legacyFeatures.varPointers.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTERS_FEATURES;
            legacyFeatures.varPointers.variablePointers = features.*.desiredVulkan11DeviceFeatures.variablePointers;
            legacyFeatures.varPointers.variablePointersStorageBuffer = features.*.desiredVulkan11DeviceFeatures.variablePointersStorageBuffer;
            featureList.pNext = @ptrCast(@alignCast(&legacyFeatures.storage));
            legacyFeatures.storage.pNext = @ptrCast(@alignCast(&legacyFeatures.multiview));
            legacyFeatures.multiview.pNext = @ptrCast(@alignCast(&legacyFeatures.protectedMem));
            legacyFeatures.protectedMem.pNext = @ptrCast(@alignCast(&legacyFeatures.ycbcr));
            legacyFeatures.ycbcr.pNext = @ptrCast(@alignCast(&legacyFeatures.drawParams));
            legacyFeatures.drawParams.pNext = @ptrCast(@alignCast(&legacyFeatures.varPointers));
        }
        deviceCreateInfo.pEnabledFeatures = null;
        deviceCreateInfo.pNext = @ptrCast(@alignCast(&featureList));
    } else {
        deviceCreateInfo.pEnabledFeatures = &features.*.desiredVulkan10DeviceFeatures;
    }
    if (renderer.*.xrInstance != null) {
        var xrResult: XrResult = undefined;
        _ = &xrResult;
        var xrCreateVulkanDeviceKHR: PFN_xrCreateVulkanDeviceKHR = undefined;
        _ = &xrCreateVulkanDeviceKHR;
        if ((blk: {
            const tmp = OPENXR_xrGetInstanceProcAddr.?(renderer.*.xrInstance, "xrCreateVulkanDeviceKHR", @ptrCast(@alignCast(&xrCreateVulkanDeviceKHR)));
            xrResult = tmp;
            break :blk tmp;
        }) != XR_SUCCESS) {
            SDL_LogDebug_REAL(SDL_LOG_CATEGORY_GPU, "Failed to get xrCreateVulkanDeviceKHR");
            SDL_free_REAL(@ptrCast(@alignCast(deviceExtensions)));
            return 0;
        }
        var xrDeviceCreateInfo: XrVulkanDeviceCreateInfoKHR = undefined;
        _ = &xrDeviceCreateInfo;
        _ = memset(@ptrCast(@alignCast(&xrDeviceCreateInfo)), 0, @sizeOf(@TypeOf(xrDeviceCreateInfo)));
        xrDeviceCreateInfo.type = XR_TYPE_VULKAN_DEVICE_CREATE_INFO_KHR;
        xrDeviceCreateInfo.vulkanCreateInfo = &deviceCreateInfo;
        xrDeviceCreateInfo.systemId = renderer.*.xrSystemId;
        xrDeviceCreateInfo.vulkanPhysicalDevice = renderer.*.physicalDevice;
        xrDeviceCreateInfo.pfnGetInstanceProcAddr = @ptrCast(@alignCast(@constCast(SDL_Vulkan_GetVkGetInstanceProcAddr_REAL())));
        while (true) {
            while (!(xrDeviceCreateInfo.pfnGetInstanceProcAddr != null)) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "xrDeviceCreateInfo.pfnGetInstanceProcAddr",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu_vulkan.c", 12747);
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
        if ((blk: {
            const tmp = xrCreateVulkanDeviceKHR.?(renderer.*.xrInstance, &xrDeviceCreateInfo, &renderer.*.logicalDevice, &vulkanResult);
            xrResult = tmp;
            break :blk tmp;
        }) != XR_SUCCESS) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "Failed to create OpenXR Vulkan logical device, result %d, %d", xrResult, vulkanResult);
            SDL_free_REAL(@ptrCast(@alignCast(deviceExtensions)));
            return 0;
        }
    } else {
        vulkanResult = renderer.*.vkCreateDevice.?(renderer.*.physicalDevice, &deviceCreateInfo, null, &renderer.*.logicalDevice);
    }
    SDL_free_REAL(@ptrCast(@alignCast(deviceExtensions)));
    while (true) {
        if (vulkanResult != VK_SUCCESS) {
            if (renderer.*.debugMode) {
                SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateDevice"))), VkErrorMessages(vulkanResult));
            }
            _ = SDL_SetError_REAL("%s %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateDevice"))), VkErrorMessages(vulkanResult));
            return @bitCast(@as(i8, @truncate(@as(c_int, 0))));
        }
        if (!false) break;
    }
    renderer.*.vkAllocateCommandBuffers = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkAllocateCommandBuffers"))));
    renderer.*.vkAllocateDescriptorSets = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkAllocateDescriptorSets"))));
    renderer.*.vkAllocateMemory = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkAllocateMemory"))));
    renderer.*.vkBeginCommandBuffer = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkBeginCommandBuffer"))));
    renderer.*.vkBindBufferMemory = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkBindBufferMemory"))));
    renderer.*.vkBindImageMemory = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkBindImageMemory"))));
    renderer.*.vkCmdBeginRenderPass = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkCmdBeginRenderPass"))));
    renderer.*.vkCmdBindDescriptorSets = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkCmdBindDescriptorSets"))));
    renderer.*.vkCmdBindIndexBuffer = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkCmdBindIndexBuffer"))));
    renderer.*.vkCmdBindPipeline = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkCmdBindPipeline"))));
    renderer.*.vkCmdBindVertexBuffers = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkCmdBindVertexBuffers"))));
    renderer.*.vkCmdBlitImage = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkCmdBlitImage"))));
    renderer.*.vkCmdClearAttachments = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkCmdClearAttachments"))));
    renderer.*.vkCmdClearColorImage = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkCmdClearColorImage"))));
    renderer.*.vkCmdClearDepthStencilImage = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkCmdClearDepthStencilImage"))));
    renderer.*.vkCmdCopyBuffer = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkCmdCopyBuffer"))));
    renderer.*.vkCmdCopyImage = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkCmdCopyImage"))));
    renderer.*.vkCmdCopyBufferToImage = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkCmdCopyBufferToImage"))));
    renderer.*.vkCmdCopyImageToBuffer = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkCmdCopyImageToBuffer"))));
    renderer.*.vkCmdDispatch = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkCmdDispatch"))));
    renderer.*.vkCmdDispatchIndirect = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkCmdDispatchIndirect"))));
    renderer.*.vkCmdDraw = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkCmdDraw"))));
    renderer.*.vkCmdDrawIndexed = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkCmdDrawIndexed"))));
    renderer.*.vkCmdDrawIndexedIndirect = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkCmdDrawIndexedIndirect"))));
    renderer.*.vkCmdDrawIndirect = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkCmdDrawIndirect"))));
    renderer.*.vkCmdEndRenderPass = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkCmdEndRenderPass"))));
    renderer.*.vkCmdPipelineBarrier = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkCmdPipelineBarrier"))));
    renderer.*.vkCmdResolveImage = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkCmdResolveImage"))));
    renderer.*.vkCmdSetBlendConstants = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkCmdSetBlendConstants"))));
    renderer.*.vkCmdSetDepthBias = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkCmdSetDepthBias"))));
    renderer.*.vkCmdSetScissor = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkCmdSetScissor"))));
    renderer.*.vkCmdSetStencilReference = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkCmdSetStencilReference"))));
    renderer.*.vkCmdSetViewport = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkCmdSetViewport"))));
    renderer.*.vkCreateBuffer = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkCreateBuffer"))));
    renderer.*.vkCreateCommandPool = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkCreateCommandPool"))));
    renderer.*.vkCreateDescriptorPool = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkCreateDescriptorPool"))));
    renderer.*.vkCreateDescriptorSetLayout = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkCreateDescriptorSetLayout"))));
    renderer.*.vkCreateFence = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkCreateFence"))));
    renderer.*.vkCreateFramebuffer = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkCreateFramebuffer"))));
    renderer.*.vkCreateComputePipelines = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkCreateComputePipelines"))));
    renderer.*.vkCreateGraphicsPipelines = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkCreateGraphicsPipelines"))));
    renderer.*.vkCreateImage = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkCreateImage"))));
    renderer.*.vkCreateImageView = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkCreateImageView"))));
    renderer.*.vkCreatePipelineCache = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkCreatePipelineCache"))));
    renderer.*.vkCreatePipelineLayout = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkCreatePipelineLayout"))));
    renderer.*.vkCreateRenderPass = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkCreateRenderPass"))));
    renderer.*.vkCreateSampler = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkCreateSampler"))));
    renderer.*.vkCreateSemaphore = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkCreateSemaphore"))));
    renderer.*.vkCreateShaderModule = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkCreateShaderModule"))));
    renderer.*.vkDestroyBuffer = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkDestroyBuffer"))));
    renderer.*.vkDestroyCommandPool = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkDestroyCommandPool"))));
    renderer.*.vkDestroyDescriptorPool = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkDestroyDescriptorPool"))));
    renderer.*.vkDestroyDescriptorSetLayout = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkDestroyDescriptorSetLayout"))));
    renderer.*.vkDestroyDevice = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkDestroyDevice"))));
    renderer.*.vkDestroyFence = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkDestroyFence"))));
    renderer.*.vkDestroyFramebuffer = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkDestroyFramebuffer"))));
    renderer.*.vkDestroyImage = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkDestroyImage"))));
    renderer.*.vkDestroyImageView = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkDestroyImageView"))));
    renderer.*.vkDestroyPipeline = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkDestroyPipeline"))));
    renderer.*.vkDestroyPipelineCache = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkDestroyPipelineCache"))));
    renderer.*.vkDestroyPipelineLayout = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkDestroyPipelineLayout"))));
    renderer.*.vkDestroyRenderPass = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkDestroyRenderPass"))));
    renderer.*.vkDestroySampler = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkDestroySampler"))));
    renderer.*.vkDestroySemaphore = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkDestroySemaphore"))));
    renderer.*.vkDestroyShaderModule = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkDestroyShaderModule"))));
    renderer.*.vkDeviceWaitIdle = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkDeviceWaitIdle"))));
    renderer.*.vkEndCommandBuffer = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkEndCommandBuffer"))));
    renderer.*.vkFreeCommandBuffers = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkFreeCommandBuffers"))));
    renderer.*.vkFreeMemory = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkFreeMemory"))));
    renderer.*.vkGetDeviceQueue = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkGetDeviceQueue"))));
    renderer.*.vkGetPipelineCacheData = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkGetPipelineCacheData"))));
    renderer.*.vkGetFenceStatus = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkGetFenceStatus"))));
    renderer.*.vkGetBufferMemoryRequirements = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkGetBufferMemoryRequirements"))));
    renderer.*.vkGetImageMemoryRequirements = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkGetImageMemoryRequirements"))));
    renderer.*.vkMapMemory = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkMapMemory"))));
    renderer.*.vkQueueSubmit = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkQueueSubmit"))));
    renderer.*.vkQueueWaitIdle = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkQueueWaitIdle"))));
    renderer.*.vkResetCommandBuffer = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkResetCommandBuffer"))));
    renderer.*.vkResetCommandPool = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkResetCommandPool"))));
    renderer.*.vkResetDescriptorPool = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkResetDescriptorPool"))));
    renderer.*.vkResetFences = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkResetFences"))));
    renderer.*.vkUnmapMemory = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkUnmapMemory"))));
    renderer.*.vkUpdateDescriptorSets = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkUpdateDescriptorSets"))));
    renderer.*.vkWaitForFences = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkWaitForFences"))));
    renderer.*.vkAcquireNextImageKHR = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkAcquireNextImageKHR"))));
    renderer.*.vkCreateSwapchainKHR = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkCreateSwapchainKHR"))));
    renderer.*.vkDestroySwapchainKHR = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkDestroySwapchainKHR"))));
    renderer.*.vkQueuePresentKHR = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkQueuePresentKHR"))));
    renderer.*.vkGetSwapchainImagesKHR = @ptrCast(@alignCast(@constCast(renderer.*.vkGetDeviceProcAddr.?(renderer.*.logicalDevice, "vkGetSwapchainImagesKHR"))));
    renderer.*.vkGetDeviceQueue.?(renderer.*.logicalDevice, renderer.*.queueFamilyIndex, 0, &renderer.*.unifiedQueue);
    return 1;
}
pub fn VULKAN_INTERNAL_LoadEntryPoints() callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = SDL_setenv_unsafe_REAL("MVK_CONFIG_FULL_IMAGE_VIEW_SWIZZLE", "1", 1);
    if (!SDL_Vulkan_LoadLibrary_REAL(null)) {
        SDL_LogWarn_REAL(SDL_LOG_CATEGORY_GPU, "Vulkan: SDL_Vulkan_LoadLibrary failed!");
        return;
    }
    vkGetInstanceProcAddr = @ptrCast(@alignCast(@constCast(SDL_Vulkan_GetVkGetInstanceProcAddr_REAL())));
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(vkGetInstanceProcAddr)))) == @as(?*anyopaque, null)) {
        SDL_LogWarn_REAL(SDL_LOG_CATEGORY_GPU, "SDL_Vulkan_GetVkGetInstanceProcAddr(): %s", SDL_GetError_REAL());
        return;
    }
    vkCreateInstance = @ptrCast(@alignCast(@constCast(vkGetInstanceProcAddr.?(null, "vkCreateInstance"))));
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(vkCreateInstance)))) == @as(?*anyopaque, null)) {
        SDL_LogWarn_REAL(SDL_LOG_CATEGORY_GPU, "vkGetInstanceProcAddr(VK_NULL_HANDLE, \"vkCreateInstance\") failed");
        return;
    }
    vkEnumerateInstanceExtensionProperties = @ptrCast(@alignCast(@constCast(vkGetInstanceProcAddr.?(null, "vkEnumerateInstanceExtensionProperties"))));
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(vkEnumerateInstanceExtensionProperties)))) == @as(?*anyopaque, null)) {
        SDL_LogWarn_REAL(SDL_LOG_CATEGORY_GPU, "vkGetInstanceProcAddr(VK_NULL_HANDLE, \"vkEnumerateInstanceExtensionProperties\") failed");
        return;
    }
    vkEnumerateInstanceLayerProperties = @ptrCast(@alignCast(@constCast(vkGetInstanceProcAddr.?(null, "vkEnumerateInstanceLayerProperties"))));
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(vkEnumerateInstanceLayerProperties)))) == @as(?*anyopaque, null)) {
        SDL_LogWarn_REAL(SDL_LOG_CATEGORY_GPU, "vkGetInstanceProcAddr(VK_NULL_HANDLE, \"vkEnumerateInstanceLayerProperties\") failed");
        return;
    }
}
pub fn VULKAN_INTERNAL_PrepareVulkan(renderer: [*c]VulkanRenderer, features: [*c]VulkanFeatures, props: SDL_PropertiesID) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    VULKAN_INTERNAL_LoadEntryPoints();
    _ = memset(@ptrCast(@alignCast(features)), 0, @sizeOf(@TypeOf(features.*)));
    features.*.desiredVulkan10DeviceFeatures.samplerAnisotropy = if (SDL_GetBooleanProperty_REAL(props, "SDL.gpu.device.create.feature.anisotropy", @"true" != 0)) VK_TRUE else VK_FALSE;
    features.*.desiredVulkan10DeviceFeatures.depthClamp = if (SDL_GetBooleanProperty_REAL(props, "SDL.gpu.device.create.feature.depth_clamping", @"true" != 0)) VK_TRUE else VK_FALSE;
    features.*.desiredVulkan10DeviceFeatures.shaderClipDistance = if (SDL_GetBooleanProperty_REAL(props, "SDL.gpu.device.create.feature.clip_distance", @"true" != 0)) VK_TRUE else VK_FALSE;
    features.*.desiredVulkan10DeviceFeatures.drawIndirectFirstInstance = if (SDL_GetBooleanProperty_REAL(props, "SDL.gpu.device.create.feature.indirect_draw_first_instance", @"true" != 0)) VK_TRUE else VK_FALSE;
    features.*.desiredVulkan10DeviceFeatures.independentBlend = VK_TRUE;
    features.*.desiredVulkan10DeviceFeatures.sampleRateShading = VK_TRUE;
    features.*.desiredVulkan10DeviceFeatures.imageCubeArray = VK_TRUE;
    VULKAN_INTERNAL_AddOptInVulkanOptions(props, renderer, features);
    renderer.*.requireHardwareAcceleration = SDL_GetBooleanProperty_REAL(props, "SDL.gpu.device.create.vulkan.requirehardwareacceleration", @"false" != 0);
    if (!(@as(c_int, VULKAN_INTERNAL_CreateInstance(renderer, features)) != 0)) {
        SDL_LogWarn_REAL(SDL_LOG_CATEGORY_GPU, "Vulkan: Could not create Vulkan instance");
        return @"false" != 0;
    }
    renderer.*.vkGetDeviceProcAddr = @ptrCast(@alignCast(@constCast(vkGetInstanceProcAddr.?(renderer.*.instance, "vkGetDeviceProcAddr"))));
    renderer.*.vkCreateDevice = @ptrCast(@alignCast(@constCast(vkGetInstanceProcAddr.?(renderer.*.instance, "vkCreateDevice"))));
    renderer.*.vkDestroyInstance = @ptrCast(@alignCast(@constCast(vkGetInstanceProcAddr.?(renderer.*.instance, "vkDestroyInstance"))));
    renderer.*.vkEnumerateDeviceExtensionProperties = @ptrCast(@alignCast(@constCast(vkGetInstanceProcAddr.?(renderer.*.instance, "vkEnumerateDeviceExtensionProperties"))));
    renderer.*.vkEnumeratePhysicalDevices = @ptrCast(@alignCast(@constCast(vkGetInstanceProcAddr.?(renderer.*.instance, "vkEnumeratePhysicalDevices"))));
    renderer.*.vkGetPhysicalDeviceFeatures = @ptrCast(@alignCast(@constCast(vkGetInstanceProcAddr.?(renderer.*.instance, "vkGetPhysicalDeviceFeatures"))));
    renderer.*.vkGetPhysicalDeviceQueueFamilyProperties = @ptrCast(@alignCast(@constCast(vkGetInstanceProcAddr.?(renderer.*.instance, "vkGetPhysicalDeviceQueueFamilyProperties"))));
    renderer.*.vkGetPhysicalDeviceFormatProperties = @ptrCast(@alignCast(@constCast(vkGetInstanceProcAddr.?(renderer.*.instance, "vkGetPhysicalDeviceFormatProperties"))));
    renderer.*.vkGetPhysicalDeviceImageFormatProperties = @ptrCast(@alignCast(@constCast(vkGetInstanceProcAddr.?(renderer.*.instance, "vkGetPhysicalDeviceImageFormatProperties"))));
    renderer.*.vkGetPhysicalDeviceMemoryProperties = @ptrCast(@alignCast(@constCast(vkGetInstanceProcAddr.?(renderer.*.instance, "vkGetPhysicalDeviceMemoryProperties"))));
    renderer.*.vkGetPhysicalDeviceProperties = @ptrCast(@alignCast(@constCast(vkGetInstanceProcAddr.?(renderer.*.instance, "vkGetPhysicalDeviceProperties"))));
    renderer.*.vkGetPhysicalDeviceFeatures2 = @ptrCast(@alignCast(@constCast(vkGetInstanceProcAddr.?(renderer.*.instance, "vkGetPhysicalDeviceFeatures2"))));
    renderer.*.vkGetPhysicalDeviceProperties2KHR = @ptrCast(@alignCast(@constCast(vkGetInstanceProcAddr.?(renderer.*.instance, "vkGetPhysicalDeviceProperties2KHR"))));
    renderer.*.vkDestroySurfaceKHR = @ptrCast(@alignCast(@constCast(vkGetInstanceProcAddr.?(renderer.*.instance, "vkDestroySurfaceKHR"))));
    renderer.*.vkGetPhysicalDeviceSurfaceCapabilitiesKHR = @ptrCast(@alignCast(@constCast(vkGetInstanceProcAddr.?(renderer.*.instance, "vkGetPhysicalDeviceSurfaceCapabilitiesKHR"))));
    renderer.*.vkGetPhysicalDeviceSurfaceFormatsKHR = @ptrCast(@alignCast(@constCast(vkGetInstanceProcAddr.?(renderer.*.instance, "vkGetPhysicalDeviceSurfaceFormatsKHR"))));
    renderer.*.vkGetPhysicalDeviceSurfacePresentModesKHR = @ptrCast(@alignCast(@constCast(vkGetInstanceProcAddr.?(renderer.*.instance, "vkGetPhysicalDeviceSurfacePresentModesKHR"))));
    renderer.*.vkGetPhysicalDeviceSurfaceSupportKHR = @ptrCast(@alignCast(@constCast(vkGetInstanceProcAddr.?(renderer.*.instance, "vkGetPhysicalDeviceSurfaceSupportKHR"))));
    renderer.*.vkCmdBeginDebugUtilsLabelEXT = @ptrCast(@alignCast(@constCast(vkGetInstanceProcAddr.?(renderer.*.instance, "vkCmdBeginDebugUtilsLabelEXT"))));
    renderer.*.vkSetDebugUtilsObjectNameEXT = @ptrCast(@alignCast(@constCast(vkGetInstanceProcAddr.?(renderer.*.instance, "vkSetDebugUtilsObjectNameEXT"))));
    renderer.*.vkCmdEndDebugUtilsLabelEXT = @ptrCast(@alignCast(@constCast(vkGetInstanceProcAddr.?(renderer.*.instance, "vkCmdEndDebugUtilsLabelEXT"))));
    renderer.*.vkCmdInsertDebugUtilsLabelEXT = @ptrCast(@alignCast(@constCast(vkGetInstanceProcAddr.?(renderer.*.instance, "vkCmdInsertDebugUtilsLabelEXT"))));
    if (!(@as(c_int, VULKAN_INTERNAL_DeterminePhysicalDevice(renderer, features)) != 0)) {
        SDL_LogWarn_REAL(SDL_LOG_CATEGORY_GPU, "Vulkan: Failed to determine a suitable physical device");
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn VULKAN_INTERNAL_SearchForOpenXrGpuExtension(found_extension: [*c]XrExtensionProperties) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var result: XrResult = undefined;
    _ = &result;
    var extension_count: Uint32 = undefined;
    _ = &extension_count;
    var i: Uint32 = undefined;
    _ = &i;
    result = OPENXR_xrEnumerateInstanceExtensionProperties.?(null, 0, &extension_count, null);
    if (result != XR_SUCCESS) return @"false" != 0;
    var extension_properties: [*c]XrExtensionProperties = @ptrCast(@alignCast(SDL_calloc_REAL(extension_count, @sizeOf(XrExtensionProperties))));
    _ = &extension_properties;
    {
        i = 0;
        while (i < extension_count) : (i +%= 1) {
            extension_properties[i].type = XR_TYPE_EXTENSION_PROPERTIES;
        }
    }
    result = OPENXR_xrEnumerateInstanceExtensionProperties.?(null, extension_count, &extension_count, extension_properties);
    if (result != XR_SUCCESS) {
        SDL_free_REAL(@ptrCast(@alignCast(extension_properties)));
        return @"false" != 0;
    }
    {
        i = 0;
        while (i < extension_count) : (i +%= 1) {
            var extension: XrExtensionProperties = extension_properties[i];
            _ = &extension;
            if (SDL_strcmp_REAL(@ptrCast(@alignCast(&extension.extensionName)), "XR_KHR_vulkan_enable2") == @as(c_int, 0)) {
                SDL_LogInfo_REAL(SDL_LOG_CATEGORY_GPU, "Found XR_KHR_vulkan_enable2 extension");
                found_extension.* = extension;
                SDL_free_REAL(@ptrCast(@alignCast(extension_properties)));
                return @"true" != 0;
            }
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(extension_properties)));
    return @"false" != 0;
}
pub fn VULKAN_INTERNAL_GetXrMinimumVulkanApiVersion(minimumVulkanApiVersion: [*c]XrVersion, instance: XrInstance, systemId: XrSystemId) callconv(.c) XrResult {
    @setEvalBranchQuota(100000);
    var xrResult: XrResult = undefined;
    _ = &xrResult;
    var xrGetVulkanGraphicsRequirements2KHR: PFN_xrGetVulkanGraphicsRequirements2KHR = undefined;
    _ = &xrGetVulkanGraphicsRequirements2KHR;
    if ((blk: {
        const tmp = OPENXR_xrGetInstanceProcAddr.?(instance, "xrGetVulkanGraphicsRequirements2KHR", @ptrCast(@alignCast(&xrGetVulkanGraphicsRequirements2KHR)));
        xrResult = tmp;
        break :blk tmp;
    }) != XR_SUCCESS) {
        SDL_LogDebug_REAL(SDL_LOG_CATEGORY_GPU, "Failed to get xrGetVulkanGraphicsRequirements2KHR");
        return xrResult;
    }
    var graphicsRequirementsVulkan: XrGraphicsRequirementsVulkanKHR = undefined;
    _ = &graphicsRequirementsVulkan;
    _ = memset(@ptrCast(@alignCast(&graphicsRequirementsVulkan)), 0, @sizeOf(@TypeOf(graphicsRequirementsVulkan)));
    graphicsRequirementsVulkan.type = XR_TYPE_GRAPHICS_REQUIREMENTS_VULKAN2_KHR;
    if ((blk: {
        const tmp = xrGetVulkanGraphicsRequirements2KHR.?(instance, systemId, &graphicsRequirementsVulkan);
        xrResult = tmp;
        break :blk tmp;
    }) != XR_SUCCESS) {
        SDL_LogDebug_REAL(SDL_LOG_CATEGORY_GPU, "Failed to get vulkan graphics requirements, got OpenXR error %d", xrResult);
        return xrResult;
    }
    minimumVulkanApiVersion.* = graphicsRequirementsVulkan.minApiVersionSupported;
    return XR_SUCCESS;
}
pub fn VULKAN_PrepareDriver(_this: [*c]SDL_VideoDevice, props: SDL_PropertiesID) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var renderer: [*c]VulkanRenderer = undefined;
    _ = &renderer;
    var features: VulkanFeatures = undefined;
    _ = &features;
    var result: bool = @"false" != 0;
    _ = &result;
    if (!SDL_GetBooleanProperty_REAL(props, "SDL.gpu.device.create.shaders.spirv", @"false" != 0)) {
        return @"false" != 0;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(_this.*.Vulkan_CreateSurface)))) == @as(?*anyopaque, null)) {
        return @"false" != 0;
    }
    if (!SDL_Vulkan_LoadLibrary_REAL(null)) {
        return @"false" != 0;
    }
    var xrResult: XrResult = undefined;
    _ = &xrResult;
    var instancePfns: [*c]XrInstancePfns = null;
    _ = &instancePfns;
    var xrInstance: XrInstance = null;
    _ = &xrInstance;
    var xrSystemId: XrSystemId = XR_NULL_HANDLE;
    _ = &xrSystemId;
    var xr: bool = SDL_GetBooleanProperty_REAL(props, "SDL.gpu.device.create.xr.enable", @"false" != 0);
    _ = &xr;
    if (xr) {
        if (!SDL_OpenXR_LoadLibrary_REAL()) {
            SDL_LogWarn_REAL(SDL_LOG_CATEGORY_GPU, "Vulkan: Failed to load OpenXR: %s", SDL_GetError_REAL());
            SDL_Vulkan_UnloadLibrary_REAL();
            return @"false" != 0;
        }
        var gpuExtension: XrExtensionProperties = undefined;
        _ = &gpuExtension;
        if (!VULKAN_INTERNAL_SearchForOpenXrGpuExtension(&gpuExtension)) {
            _ = SDL_SetError_REAL("Failed to find a suitable OpenXR GPU extension.");
            SDL_Vulkan_UnloadLibrary_REAL();
            SDL_OpenXR_UnloadLibrary_REAL();
            return @"false" != 0;
        }
        var extensionName: [*c]const u8 = @ptrCast(@alignCast(&gpuExtension.extensionName));
        _ = &extensionName;
        if ((blk: {
            const tmp = OPENXR_xrCreateInstance.?(&@as(XrInstanceCreateInfo, XrInstanceCreateInfo{
                .type = XR_TYPE_INSTANCE_CREATE_INFO,
                .next = null,
                .createFlags = 0,
                .applicationInfo = XrApplicationInfo{
                    .applicationName = "SDL"[0..3].* ++ @as([125]u8, @splat(0)),
                    .applicationVersion = 0,
                    .engineName = @import("std").mem.zeroes([128]u8),
                    .engineVersion = 0,
                    .apiVersion = @bitCast(@as(c_long, SDL_GetNumberProperty_REAL(props, "SDL.gpu.device.create.xr.version", @bitCast(@as(c_ulong, @truncate((((@as(c_ulonglong, @bitCast(@as(c_longlong, @as(c_int, 1)))) & @as(c_ulonglong, 65535)) << @intCast(@as(c_ulonglong, 48))) | ((@as(c_ulonglong, @bitCast(@as(c_longlong, @as(c_int, 0)))) & @as(c_ulonglong, 65535)) << @intCast(@as(c_ulonglong, 32)))) | (@as(c_ulonglong, @as(u32, @truncate(@as(c_ulonglong, @as(u64, @truncate((((@as(c_ulonglong, @bitCast(@as(c_longlong, @as(c_int, 1)))) & @as(c_ulonglong, 65535)) << @intCast(@as(c_ulonglong, 48))) | ((@as(c_ulonglong, @bitCast(@as(c_longlong, @as(c_int, 1)))) & @as(c_ulonglong, 65535)) << @intCast(@as(c_ulonglong, 32)))) | (@as(c_ulonglong, @bitCast(@as(c_longlong, @as(c_int, 63)))) & @as(c_ulonglong, 4294967295))))) & @as(c_ulonglong, 4294967295)))) & @as(c_ulonglong, 4294967295)))))))),
                },
                .enabledApiLayerCount = 0,
                .enabledApiLayerNames = null,
                .enabledExtensionCount = 1,
                .enabledExtensionNames = &extensionName,
            }), &xrInstance);
            xrResult = tmp;
            break :blk tmp;
        }) != XR_SUCCESS) {
            SDL_LogDebug_REAL(SDL_LOG_CATEGORY_GPU, "Failed to create OpenXR instance");
            SDL_Vulkan_UnloadLibrary_REAL();
            SDL_OpenXR_UnloadLibrary_REAL();
            return @"false" != 0;
        }
        instancePfns = SDL_OPENXR_LoadInstanceSymbols(xrInstance);
        if (!(instancePfns != null)) {
            SDL_LogDebug_REAL(SDL_LOG_CATEGORY_GPU, "Failed to load needed OpenXR instance symbols");
            SDL_Vulkan_UnloadLibrary_REAL();
            SDL_OpenXR_UnloadLibrary_REAL();
            return @"false" != 0;
        }
        if ((blk: {
            const tmp = instancePfns.*.xrGetSystem.?(xrInstance, &@as(XrSystemGetInfo, XrSystemGetInfo{
                .type = XR_TYPE_SYSTEM_GET_INFO,
                .next = null,
                .formFactor = @bitCast(@as(c_int, @truncate(SDL_GetNumberProperty_REAL(props, "SDL.gpu.device.create.xr.form_factor", XR_FORM_FACTOR_HEAD_MOUNTED_DISPLAY)))),
            }), &xrSystemId);
            xrResult = tmp;
            break :blk tmp;
        }) != XR_SUCCESS) {
            SDL_LogDebug_REAL(SDL_LOG_CATEGORY_GPU, "Failed to get OpenXR system");
            _ = instancePfns.*.xrDestroyInstance.?(xrInstance);
            SDL_Vulkan_UnloadLibrary_REAL();
            SDL_OpenXR_UnloadLibrary_REAL();
            SDL_free_REAL(@ptrCast(@alignCast(instancePfns)));
            return @"false" != 0;
        }
    }
    renderer = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(renderer.*)))));
    if (renderer != null) {
        renderer.*.debugMode = SDL_GetBooleanProperty_REAL(props, "SDL.gpu.device.create.debugmode", @"false" != 0);
        renderer.*.preferLowPower = SDL_GetBooleanProperty_REAL(props, "SDL.gpu.device.create.preferlowpower", @"false" != 0);
        renderer.*.minimumVkVersion = (((@as(u32, @bitCast(@as(c_int, @as(c_int, 0)))) << @intCast(@as(c_uint, 29))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, 1)))) << @intCast(@as(c_uint, 22)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, 0)))) << @intCast(@as(c_uint, 12)))) | @as(u32, @bitCast(@as(c_int, @as(c_int, 0))));
        renderer.*.xrInstance = xrInstance;
        renderer.*.xrSystemId = xrSystemId;
        if (xr) {
            var minimumVkVersionXr: XrVersion = undefined;
            _ = &minimumVkVersionXr;
            xrResult = VULKAN_INTERNAL_GetXrMinimumVulkanApiVersion(&minimumVkVersionXr, xrInstance, xrSystemId);
            if (xrResult != XR_SUCCESS) {
                _ = SDL_SetError_REAL("Failed to get the minimum supported Vulkan API version.");
                _ = instancePfns.*.xrDestroyInstance.?(xrInstance);
                SDL_Vulkan_UnloadLibrary_REAL();
                SDL_OpenXR_UnloadLibrary_REAL();
                SDL_free_REAL(@ptrCast(@alignCast(instancePfns)));
                SDL_free_REAL(@ptrCast(@alignCast(renderer)));
                return @"false" != 0;
            }
            renderer.*.minimumVkVersion = (((@as(u32, @bitCast(@as(c_int, @as(c_int, 0)))) << @intCast(@as(c_uint, 29))) | (@as(u32, @as(u16, @truncate(@as(c_ulonglong, minimumVkVersionXr >> @intCast(@as(u64, 48))) & @as(c_ulonglong, 65535)))) << @intCast(@as(c_uint, 22)))) | (@as(u32, @as(u16, @truncate(@as(c_ulonglong, minimumVkVersionXr >> @intCast(@as(u64, 32))) & @as(c_ulonglong, 65535)))) << @intCast(@as(c_uint, 12)))) | @as(u32, @truncate(@as(c_ulonglong, minimumVkVersionXr) & @as(c_ulonglong, 4294967295)));
        }
        result = VULKAN_INTERNAL_PrepareVulkan(renderer, &features, props);
        if (result) {
            renderer.*.vkDestroyInstance.?(renderer.*.instance, null);
        }
        if (instancePfns != null) {
            _ = instancePfns.*.xrDestroyInstance.?(xrInstance);
            SDL_free_REAL(@ptrCast(@alignCast(instancePfns)));
            SDL_OpenXR_UnloadLibrary_REAL();
        }
        SDL_free_REAL(@ptrCast(@alignCast(renderer)));
    }
    SDL_Vulkan_UnloadLibrary_REAL();
    return result;
}
pub fn VULKAN_DestroyXRSwapchain(driverData: ?*SDL_GPURenderer, swapchain: XrSwapchain, swapchainImages: [*c]?*SDL_GPUTexture) callconv(.c) XrResult {
    @setEvalBranchQuota(100000);
    var result: XrResult = undefined;
    _ = &result;
    var renderer: [*c]VulkanRenderer = @ptrCast(@alignCast(driverData));
    _ = &renderer;
    _ = VULKAN_Wait(driverData);
    var swapchainCount: Uint32 = undefined;
    _ = &swapchainCount;
    result = renderer.*.xr.*.xrEnumerateSwapchainImages.?(swapchain, 0, &swapchainCount, null);
    if (result != XR_SUCCESS) {
        return result;
    }
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < swapchainCount) : (i +%= 1) {
            var container: [*c]VulkanTextureContainer = @ptrCast(@alignCast(swapchainImages[i]));
            _ = &container;
            if (!container.*.externallyManaged) {
                _ = SDL_SetError_REAL("Invalid GPU Texture handle.");
                return XR_ERROR_HANDLE_INVALID;
            }
            VULKAN_INTERNAL_DestroyTexture(renderer, container.*.activeTexture);
            SDL_free_REAL(@ptrCast(@alignCast(container)));
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(swapchainImages)));
    return renderer.*.xr.*.xrDestroySwapchain.?(swapchain);
}
pub fn VULKAN_GetXRSwapchainFormats(driverData: ?*SDL_GPURenderer, session: XrSession, num_formats: [*c]c_int) callconv(.c) [*c]SDL_GPUTextureFormat {
    @setEvalBranchQuota(100000);
    var result: XrResult = undefined;
    _ = &result;
    var i: Uint32 = undefined;
    _ = &i;
    var j: Uint32 = undefined;
    _ = &j;
    var num_supported_formats: Uint32 = undefined;
    _ = &num_supported_formats;
    var supported_formats: [*c]i64 = undefined;
    _ = &supported_formats;
    var renderer: [*c]VulkanRenderer = @ptrCast(@alignCast(driverData));
    _ = &renderer;
    result = renderer.*.xr.*.xrEnumerateSwapchainFormats.?(session, 0, &num_supported_formats, null);
    if (result != XR_SUCCESS) return null;
    supported_formats = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(i64) *% @as(c_ulong, num_supported_formats))));
    result = renderer.*.xr.*.xrEnumerateSwapchainFormats.?(session, num_supported_formats, &num_supported_formats, supported_formats);
    if (result != XR_SUCCESS) {
        SDL_free_REAL(@ptrCast(@alignCast(supported_formats)));
        return null;
    }
    var sdl_formats: [*c]SDL_GPUTextureFormat = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(SDL_GPUTextureFormat) *% @as(c_ulong, num_supported_formats))));
    _ = &sdl_formats;
    var num_found_formats: u32 = 0;
    _ = &num_found_formats;
    {
        i = 0;
        while (i < num_supported_formats) : (i +%= 1) {
            {
                j = 0;
                while (@as(c_ulong, j) < (@sizeOf(@TypeOf(SDLToVK_TextureFormat)) / @sizeOf(@TypeOf(SDLToVK_TextureFormat[@as(c_int, 0)])))) : (j +%= 1) {
                    if (@as(i64, SDLToVK_TextureFormat[j]) == supported_formats[i]) {
                        sdl_formats[
                            blk: {
                                const ref = &num_found_formats;
                                const tmp = ref.*;
                                ref.* +%= 1;
                                break :blk tmp;
                            }
                        ] = j;
                        break;
                    }
                }
            }
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(supported_formats)));
    if (num_found_formats == @as(u32, 0)) {
        _ = SDL_SetError_REAL("Failed to find a swapchain format supported by both OpenXR and SDL");
        SDL_free_REAL(@ptrCast(@alignCast(sdl_formats)));
        return null;
    }
    var retval: [*c]SDL_GPUTextureFormat = @ptrCast(@alignCast(SDL_calloc_REAL(@as(usize, num_found_formats) +% @as(usize, 1), @sizeOf(SDL_GPUTextureFormat))));
    _ = &retval;
    _ = memcpy(@ptrCast(@alignCast(retval)), @ptrCast(@alignCast(sdl_formats)), @sizeOf(SDL_GPUTextureFormat) *% @as(c_ulong, num_found_formats));
    retval[num_found_formats] = SDL_GPU_TEXTUREFORMAT_INVALID;
    num_formats.* = @bitCast(@as(c_uint, @truncate(num_found_formats)));
    SDL_free_REAL(@ptrCast(@alignCast(supported_formats)));
    return retval;
}
pub fn VULKAN_CreateXRSwapchain(driverData: ?*SDL_GPURenderer, session: XrSession, oldCreateInfo: [*c]const XrSwapchainCreateInfo, format: SDL_GPUTextureFormat, swapchain: [*c]XrSwapchain, textures: [*c][*c]?*SDL_GPUTexture) callconv(.c) XrResult {
    @setEvalBranchQuota(100000);
    var result: XrResult = undefined;
    _ = &result;
    var i: Uint32 = undefined;
    _ = &i;
    var j: Uint32 = undefined;
    _ = &j;
    var renderer: [*c]VulkanRenderer = @ptrCast(@alignCast(driverData));
    _ = &renderer;
    var createInfo: XrSwapchainCreateInfo = oldCreateInfo.*;
    _ = &createInfo;
    createInfo.format = SDLToVK_TextureFormat[format];
    result = renderer.*.xr.*.xrCreateSwapchain.?(session, &createInfo, swapchain);
    if (result != XR_SUCCESS) return result;
    var swapchainImageCount: Uint32 = undefined;
    _ = &swapchainImageCount;
    result = renderer.*.xr.*.xrEnumerateSwapchainImages.?(swapchain.*, 0, &swapchainImageCount, null);
    if (result != XR_SUCCESS) return result;
    var swapchainImages: [*c]XrSwapchainImageVulkan2KHR = @ptrCast(@alignCast(SDL_calloc_REAL(swapchainImageCount, @sizeOf(XrSwapchainImageVulkan2KHR))));
    _ = &swapchainImages;
    {
        i = 0;
        while (i < swapchainImageCount) : (i +%= 1) {
            swapchainImages[i].type = XR_TYPE_SWAPCHAIN_IMAGE_VULKAN2_KHR;
        }
    }
    result = renderer.*.xr.*.xrEnumerateSwapchainImages.?(swapchain.*, swapchainImageCount, &swapchainImageCount, @ptrCast(@alignCast(swapchainImages)));
    if (result != XR_SUCCESS) {
        SDL_free_REAL(@ptrCast(@alignCast(swapchainImages)));
        return result;
    }
    var textureContainers: [*c][*c]VulkanTextureContainer = @ptrCast(@alignCast(SDL_calloc_REAL(swapchainImageCount, @sizeOf([*c]VulkanTextureContainer))));
    _ = &textureContainers;
    {
        var idx: Uint32 = 0;
        _ = &idx;
        while (idx < swapchainImageCount) : (idx +%= 1) {
            var vkImage: VkImage = swapchainImages[idx].image;
            _ = &vkImage;
            var texture: [*c]VulkanTexture = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(VulkanTexture))));
            _ = &texture;
            texture.*.swizzle = SwizzleForSDLFormat(format);
            texture.*.depth = 1;
            texture.*.usage = @as(c_uint, 1) << @intCast(@as(c_uint, 1));
            _ = SDL_SetAtomicInt_REAL(&texture.*.referenceCount, 0);
            texture.*.image = vkImage;
            texture.*.externallyManaged = @"true" != 0;
            texture.*.aspectFlags = VK_IMAGE_ASPECT_COLOR_BIT;
            texture.*.subresourceCount = createInfo.arraySize *% createInfo.mipCount;
            texture.*.subresources = @ptrCast(@alignCast(SDL_calloc_REAL(texture.*.subresourceCount, @sizeOf(VulkanTextureSubresource))));
            {
                i = 0;
                while (i < createInfo.arraySize) : (i +%= 1) {
                    {
                        j = 0;
                        while (j < createInfo.mipCount) : (j +%= 1) {
                            var subresourceIndex: Uint32 = VULKAN_INTERNAL_GetTextureSubresourceIndex(j, i, createInfo.mipCount);
                            _ = &subresourceIndex;
                            if ((createInfo.usageFlags & XR_SWAPCHAIN_USAGE_COLOR_ATTACHMENT_BIT) != 0) {
                                texture.*.subresources[subresourceIndex].renderTargetViews = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(VkImageView))));
                                if (!VULKAN_INTERNAL_CreateRenderTargetView(renderer, texture, i, j, SDLToVK_TextureFormat[format], texture.*.swizzle, &texture.*.subresources[subresourceIndex].renderTargetViews[@as(c_int, 0)])) {
                                    VULKAN_INTERNAL_DestroyTexture(renderer, texture);
                                    _ = SDL_SetError_REAL("Failed to create render target view");
                                    return XR_ERROR_RUNTIME_FAILURE;
                                }
                            }
                            texture.*.subresources[subresourceIndex].parent = texture;
                            texture.*.subresources[subresourceIndex].layer = i;
                            texture.*.subresources[subresourceIndex].level = j;
                        }
                    }
                }
            }
            var barrierCommandBuffer: [*c]VulkanCommandBuffer = @ptrCast(@alignCast(VULKAN_AcquireCommandBuffer(@ptrCast(@alignCast(renderer)))));
            _ = &barrierCommandBuffer;
            VULKAN_INTERNAL_TextureTransitionToDefaultUsage(renderer, barrierCommandBuffer, VULKAN_TEXTURE_USAGE_MODE_UNINITIALIZED, texture);
            VULKAN_INTERNAL_TrackTexture(barrierCommandBuffer, texture);
            _ = VULKAN_Submit(@ptrCast(@alignCast(barrierCommandBuffer)));
            textureContainers[idx] = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(VulkanTextureContainer))));
            var container: [*c]VulkanTextureContainer = textureContainers[idx];
            _ = &container;
            _ = memset(@ptrCast(@alignCast(&container.*.header.info)), 0, @sizeOf(@TypeOf(container.*.header.info)));
            container.*.header.info.width = createInfo.width;
            container.*.header.info.height = createInfo.height;
            container.*.header.info.format = format;
            container.*.header.info.layer_count_or_depth = createInfo.arraySize;
            container.*.header.info.num_levels = createInfo.mipCount;
            container.*.header.info.sample_count = SDL_GPU_SAMPLECOUNT_1;
            container.*.header.info.usage = @as(c_uint, 1) << @intCast(@as(c_uint, 1));
            container.*.externallyManaged = @"true" != 0;
            container.*.canBeCycled = @"false" != 0;
            container.*.activeTexture = texture;
            container.*.textureCapacity = 1;
            container.*.textureCount = 1;
            container.*.textures = @ptrCast(@alignCast(SDL_malloc_REAL(@as(c_ulong, container.*.textureCapacity) *% @sizeOf([*c]VulkanTexture))));
            container.*.textures[@as(c_int, 0)] = container.*.activeTexture;
            container.*.debugName = null;
        }
    }
    textures.* = @ptrCast(@alignCast(textureContainers));
    SDL_free_REAL(@ptrCast(@alignCast(swapchainImages)));
    return XR_SUCCESS;
}
pub fn VULKAN_CreateXRSession(driverData: ?*SDL_GPURenderer, createinfo: [*c]const XrSessionCreateInfo, session: [*c]XrSession) callconv(.c) XrResult {
    @setEvalBranchQuota(100000);
    var renderer: [*c]VulkanRenderer = @ptrCast(@alignCast(driverData));
    _ = &renderer;
    var currentNextPtr: ?*const anyopaque = createinfo.*.next;
    _ = &currentNextPtr;
    var graphicsBinding: XrGraphicsBindingVulkanKHR = undefined;
    _ = &graphicsBinding;
    _ = memset(@ptrCast(@alignCast(&graphicsBinding)), 0, @sizeOf(@TypeOf(graphicsBinding)));
    graphicsBinding.type = XR_TYPE_GRAPHICS_BINDING_VULKAN_KHR;
    graphicsBinding.instance = renderer.*.instance;
    graphicsBinding.physicalDevice = renderer.*.physicalDevice;
    graphicsBinding.device = renderer.*.logicalDevice;
    graphicsBinding.queueFamilyIndex = renderer.*.queueFamilyIndex;
    graphicsBinding.queueIndex = 0;
    graphicsBinding.next = currentNextPtr;
    var sessionCreateInfo: XrSessionCreateInfo = createinfo.*;
    _ = &sessionCreateInfo;
    sessionCreateInfo.systemId = renderer.*.xrSystemId;
    sessionCreateInfo.next = @ptrCast(@alignCast(&graphicsBinding));
    return renderer.*.xr.*.xrCreateSession.?(renderer.*.xrInstance, &sessionCreateInfo, session);
}
pub fn VULKAN_CreateDevice(debugMode: bool, preferLowPower: bool, props: SDL_PropertiesID) callconv(.c) [*c]SDL_GPUDevice {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [19:0]u8 = "VULKAN_CreateDevice".*;
    };
    _ = &static_local___func__;
    var renderer: [*c]VulkanRenderer = undefined;
    _ = &renderer;
    var features: VulkanFeatures = undefined;
    _ = &features;
    var result: [*c]SDL_GPUDevice = undefined;
    _ = &result;
    var i: Uint32 = undefined;
    _ = &i;
    var verboseLogs: bool = SDL_GetBooleanProperty_REAL(props, "SDL.gpu.device.create.verbose", @"true" != 0);
    _ = &verboseLogs;
    if (!SDL_Vulkan_LoadLibrary_REAL(null)) {
        while (true) {
            while (!!(@intFromPtr("This should have failed in PrepareDevice first!") != 0)) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "!\"This should have failed in PrepareDevice first!\"",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu_vulkan.c", 13337);
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
        return null;
    }
    renderer = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(renderer.*)))));
    if (!(renderer != null)) {
        SDL_Vulkan_UnloadLibrary_REAL();
        return null;
    }
    renderer.*.debugMode = debugMode;
    renderer.*.preferLowPower = preferLowPower;
    renderer.*.allowedFramesInFlight = 2;
    renderer.*.minimumVkVersion = (((@as(u32, @bitCast(@as(c_int, @as(c_int, 0)))) << @intCast(@as(c_uint, 29))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, 1)))) << @intCast(@as(c_uint, 22)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, 0)))) << @intCast(@as(c_uint, 12)))) | @as(u32, @bitCast(@as(c_int, @as(c_int, 0))));
    var xr: bool = SDL_GetBooleanProperty_REAL(props, "SDL.gpu.device.create.xr.enable", @"false" != 0);
    _ = &xr;
    var xrInstance: [*c]XrInstance = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(props, "SDL.gpu.device.create.xr.instance_out", null)));
    _ = &xrInstance;
    var xrSystemId: [*c]XrSystemId = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(props, "SDL.gpu.device.create.xr.system_id_out", null)));
    _ = &xrSystemId;
    if (xr) {
        var gpuExtension: XrExtensionProperties = undefined;
        _ = &gpuExtension;
        if (!(xrInstance != null)) {
            _ = SDL_SetError_REAL("You must specify an out pointer for the OpenXR instance");
            SDL_free_REAL(@ptrCast(@alignCast(renderer)));
            SDL_Vulkan_UnloadLibrary_REAL();
            return null;
        }
        if (!(xrSystemId != null)) {
            _ = SDL_SetError_REAL("You must specify an out pointer for the OpenXR system ID");
            SDL_free_REAL(@ptrCast(@alignCast(renderer)));
            SDL_Vulkan_UnloadLibrary_REAL();
            return null;
        }
        if (!SDL_OpenXR_LoadLibrary_REAL()) {
            while (true) {
                while (!!(@intFromPtr("This should have failed in PrepareDevice first!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"This should have failed in PrepareDevice first!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu_vulkan.c", 13375);
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
            SDL_free_REAL(@ptrCast(@alignCast(renderer)));
            SDL_Vulkan_UnloadLibrary_REAL();
            return null;
        }
        if (!VULKAN_INTERNAL_SearchForOpenXrGpuExtension(&gpuExtension)) {
            SDL_LogDebug_REAL(SDL_LOG_CATEGORY_GPU, "Failed to find a compatible OpenXR vulkan extension");
            SDL_OpenXR_UnloadLibrary_REAL();
            SDL_free_REAL(@ptrCast(@alignCast(renderer)));
            SDL_Vulkan_UnloadLibrary_REAL();
            return null;
        }
        if (!(SDL_OPENXR_INTERNAL_GPUInitOpenXR(debugMode, gpuExtension, props, xrInstance, xrSystemId, &renderer.*.xr) != 0)) {
            SDL_LogDebug_REAL(SDL_LOG_CATEGORY_GPU, "Failed to init OpenXR");
            SDL_OpenXR_UnloadLibrary_REAL();
            SDL_free_REAL(@ptrCast(@alignCast(renderer)));
            SDL_Vulkan_UnloadLibrary_REAL();
            return null;
        }
        renderer.*.xrInstance = xrInstance.*;
        renderer.*.xrSystemId = xrSystemId.*;
        var minimumVulkanApiVersion: XrVersion = undefined;
        _ = &minimumVulkanApiVersion;
        if (VULKAN_INTERNAL_GetXrMinimumVulkanApiVersion(&minimumVulkanApiVersion, xrInstance.*, xrSystemId.*) != XR_SUCCESS) {
            SDL_LogDebug_REAL(SDL_LOG_CATEGORY_GPU, "Failed to get OpenXR graphics requirements");
            _ = renderer.*.xr.*.xrDestroyInstance.?(xrInstance.*);
            SDL_OpenXR_UnloadLibrary_REAL();
            SDL_free_REAL(@ptrCast(@alignCast(renderer.*.xr)));
            SDL_free_REAL(@ptrCast(@alignCast(renderer)));
            SDL_Vulkan_UnloadLibrary_REAL();
            return null;
        }
        renderer.*.minimumVkVersion = ((@as(u32, @as(u16, @truncate(@as(c_ulonglong, minimumVulkanApiVersion >> @intCast(@as(u64, 48))) & @as(c_ulonglong, 65535)))) << @intCast(@as(c_uint, 22))) | (@as(u32, @as(u16, @truncate(@as(c_ulonglong, minimumVulkanApiVersion >> @intCast(@as(u64, 32))) & @as(c_ulonglong, 65535)))) << @intCast(@as(c_uint, 12)))) | @as(u32, @truncate(@as(c_ulonglong, minimumVulkanApiVersion) & @as(c_ulonglong, 4294967295)));
    }
    if (!VULKAN_INTERNAL_PrepareVulkan(renderer, &features, props)) {
        while (true) {
            if (renderer.*.debugMode) {
                SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s", @as([*c]u8, @as([*c]u8, @constCast("Failed to initialize Vulkan!"))));
            }
            _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("Failed to initialize Vulkan!"))));
            if (!false) break;
        }
        if (xr) {
            _ = renderer.*.xr.*.xrDestroyInstance.?(xrInstance.*);
            SDL_OpenXR_UnloadLibrary_REAL();
            SDL_free_REAL(@ptrCast(@alignCast(renderer.*.xr)));
        }
        SDL_free_REAL(@ptrCast(@alignCast(renderer)));
        SDL_Vulkan_UnloadLibrary_REAL();
        return null;
    }
    renderer.*.props = SDL_CreateProperties_REAL();
    if (verboseLogs) {
        SDL_LogInfo_REAL(SDL_LOG_CATEGORY_GPU, "SDL_GPU Driver: Vulkan");
    }
    var deviceName: [*c]const u8 = @ptrCast(@alignCast(&renderer.*.physicalDeviceProperties.properties.deviceName));
    _ = &deviceName;
    _ = SDL_SetStringProperty_REAL(renderer.*.props, "SDL.gpu.device.name", deviceName);
    if (verboseLogs) {
        SDL_LogInfo_REAL(SDL_LOG_CATEGORY_GPU, "Vulkan Device: %s", deviceName);
    }
    var driverVer: [64]u8 = undefined;
    _ = &driverVer;
    var rawDriverVer: Uint32 = renderer.*.physicalDeviceProperties.properties.driverVersion;
    _ = &rawDriverVer;
    var vendorId: Uint32 = renderer.*.physicalDeviceProperties.properties.vendorID;
    _ = &vendorId;
    if (vendorId == @as(Uint32, 4318)) {
        _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&driverVer)), @sizeOf(@TypeOf(driverVer)) / @sizeOf(@TypeOf(driverVer[@as(c_int, 0)])), "%d.%d.%d.%d", (rawDriverVer >> @intCast(@as(Uint32, 22))) & @as(Uint32, 1023), (rawDriverVer >> @intCast(@as(Uint32, 14))) & @as(Uint32, 255), (rawDriverVer >> @intCast(@as(Uint32, 6))) & @as(Uint32, 255), rawDriverVer & @as(Uint32, 63));
    } else {
        _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&driverVer)), @sizeOf(@TypeOf(driverVer)) / @sizeOf(@TypeOf(driverVer[@as(c_int, 0)])), "%d.%d.%d", (rawDriverVer >> @intCast(@as(Uint32, 22))) & @as(Uint32, 1023), (rawDriverVer >> @intCast(@as(Uint32, 12))) & @as(Uint32, 1023), rawDriverVer & @as(Uint32, 4095));
    }
    _ = SDL_SetStringProperty_REAL(renderer.*.props, "SDL.gpu.device.driver_version", @ptrCast(@alignCast(&driverVer)));
    if (@as(c_int, renderer.*.supports.KHR_driver_properties) != 0) {
        var driverName: [*c]const u8 = @ptrCast(@alignCast(&renderer.*.physicalDeviceDriverProperties.driverName));
        _ = &driverName;
        var driverInfo: [*c]const u8 = @ptrCast(@alignCast(&renderer.*.physicalDeviceDriverProperties.driverInfo));
        _ = &driverInfo;
        _ = SDL_SetStringProperty_REAL(renderer.*.props, "SDL.gpu.device.driver_name", driverName);
        _ = SDL_SetStringProperty_REAL(renderer.*.props, "SDL.gpu.device.driver_info", driverInfo);
        if (verboseLogs) {
            SDL_LogInfo_REAL(SDL_LOG_CATEGORY_GPU, "Vulkan Driver: %s %s", driverName, driverInfo);
        }
        if (verboseLogs) {
            var conformance: [64]u8 = undefined;
            _ = &conformance;
            _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&conformance)), @sizeOf(@TypeOf(conformance)) / @sizeOf(@TypeOf(conformance[@as(c_int, 0)])), "%u.%u.%u.%u", renderer.*.physicalDeviceDriverProperties.conformanceVersion.major, renderer.*.physicalDeviceDriverProperties.conformanceVersion.minor, renderer.*.physicalDeviceDriverProperties.conformanceVersion.subminor, renderer.*.physicalDeviceDriverProperties.conformanceVersion.patch);
            SDL_LogInfo_REAL(SDL_LOG_CATEGORY_GPU, "Vulkan Conformance: %s", @as([*c]u8, @ptrCast(@alignCast(&conformance))));
        }
    } else {
        if (verboseLogs) {
            SDL_LogInfo_REAL(SDL_LOG_CATEGORY_GPU, "Vulkan Driver: %s", @as([*c]u8, @ptrCast(@alignCast(&driverVer))));
        }
    }
    if (!(@as(c_int, VULKAN_INTERNAL_CreateLogicalDevice(renderer, &features)) != 0)) {
        while (true) {
            if (renderer.*.debugMode) {
                SDL_LogError_REAL(SDL_LOG_CATEGORY_GPU, "%s", @as([*c]u8, @as([*c]u8, @constCast("Failed to create logical device!"))));
            }
            _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("Failed to create logical device!"))));
            if (!false) break;
        }
        SDL_free_REAL(@ptrCast(@alignCast(renderer)));
        SDL_Vulkan_UnloadLibrary_REAL();
        return null;
    }
    result = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(SDL_GPUDevice))));
    result.*.DestroyDevice = VULKAN_DestroyDevice;
    result.*.DestroyXRSwapchain = VULKAN_DestroyXRSwapchain;
    result.*.GetDeviceProperties = VULKAN_GetDeviceProperties;
    result.*.CreateComputePipeline = VULKAN_CreateComputePipeline;
    result.*.CreateGraphicsPipeline = VULKAN_CreateGraphicsPipeline;
    result.*.CreateSampler = VULKAN_CreateSampler;
    result.*.CreateShader = VULKAN_CreateShader;
    result.*.CreateTexture = VULKAN_CreateTexture;
    result.*.CreateBuffer = VULKAN_CreateBuffer;
    result.*.CreateTransferBuffer = VULKAN_CreateTransferBuffer;
    result.*.CreateXRSession = VULKAN_CreateXRSession;
    result.*.GetXRSwapchainFormats = VULKAN_GetXRSwapchainFormats;
    result.*.CreateXRSwapchain = VULKAN_CreateXRSwapchain;
    result.*.SetBufferName = VULKAN_SetBufferName;
    result.*.SetTextureName = VULKAN_SetTextureName;
    result.*.InsertDebugLabel = VULKAN_InsertDebugLabel;
    result.*.PushDebugGroup = VULKAN_PushDebugGroup;
    result.*.PopDebugGroup = VULKAN_PopDebugGroup;
    result.*.ReleaseTexture = VULKAN_ReleaseTexture;
    result.*.ReleaseSampler = VULKAN_ReleaseSampler;
    result.*.ReleaseBuffer = VULKAN_ReleaseBuffer;
    result.*.ReleaseTransferBuffer = VULKAN_ReleaseTransferBuffer;
    result.*.ReleaseShader = VULKAN_ReleaseShader;
    result.*.ReleaseComputePipeline = VULKAN_ReleaseComputePipeline;
    result.*.ReleaseGraphicsPipeline = VULKAN_ReleaseGraphicsPipeline;
    result.*.BeginRenderPass = VULKAN_BeginRenderPass;
    result.*.BindGraphicsPipeline = VULKAN_BindGraphicsPipeline;
    result.*.SetViewport = VULKAN_SetViewport;
    result.*.SetScissor = VULKAN_SetScissor;
    result.*.SetBlendConstants = VULKAN_SetBlendConstants;
    result.*.SetStencilReference = VULKAN_SetStencilReference;
    result.*.BindVertexBuffers = VULKAN_BindVertexBuffers;
    result.*.BindIndexBuffer = VULKAN_BindIndexBuffer;
    result.*.BindVertexSamplers = VULKAN_BindVertexSamplers;
    result.*.BindVertexStorageTextures = VULKAN_BindVertexStorageTextures;
    result.*.BindVertexStorageBuffers = VULKAN_BindVertexStorageBuffers;
    result.*.BindFragmentSamplers = VULKAN_BindFragmentSamplers;
    result.*.BindFragmentStorageTextures = VULKAN_BindFragmentStorageTextures;
    result.*.BindFragmentStorageBuffers = VULKAN_BindFragmentStorageBuffers;
    result.*.PushVertexUniformData = VULKAN_PushVertexUniformData;
    result.*.PushFragmentUniformData = VULKAN_PushFragmentUniformData;
    result.*.DrawIndexedPrimitives = VULKAN_DrawIndexedPrimitives;
    result.*.DrawPrimitives = VULKAN_DrawPrimitives;
    result.*.DrawPrimitivesIndirect = VULKAN_DrawPrimitivesIndirect;
    result.*.DrawIndexedPrimitivesIndirect = VULKAN_DrawIndexedPrimitivesIndirect;
    result.*.EndRenderPass = VULKAN_EndRenderPass;
    result.*.BeginComputePass = VULKAN_BeginComputePass;
    result.*.BindComputePipeline = VULKAN_BindComputePipeline;
    result.*.BindComputeSamplers = VULKAN_BindComputeSamplers;
    result.*.BindComputeStorageTextures = VULKAN_BindComputeStorageTextures;
    result.*.BindComputeStorageBuffers = VULKAN_BindComputeStorageBuffers;
    result.*.PushComputeUniformData = VULKAN_PushComputeUniformData;
    result.*.DispatchCompute = VULKAN_DispatchCompute;
    result.*.DispatchComputeIndirect = VULKAN_DispatchComputeIndirect;
    result.*.EndComputePass = VULKAN_EndComputePass;
    result.*.MapTransferBuffer = VULKAN_MapTransferBuffer;
    result.*.UnmapTransferBuffer = VULKAN_UnmapTransferBuffer;
    result.*.BeginCopyPass = VULKAN_BeginCopyPass;
    result.*.UploadToTexture = VULKAN_UploadToTexture;
    result.*.UploadToBuffer = VULKAN_UploadToBuffer;
    result.*.DownloadFromTexture = VULKAN_DownloadFromTexture;
    result.*.DownloadFromBuffer = VULKAN_DownloadFromBuffer;
    result.*.CopyTextureToTexture = VULKAN_CopyTextureToTexture;
    result.*.CopyBufferToBuffer = VULKAN_CopyBufferToBuffer;
    result.*.GenerateMipmaps = VULKAN_GenerateMipmaps;
    result.*.EndCopyPass = VULKAN_EndCopyPass;
    result.*.Blit = VULKAN_Blit;
    result.*.SupportsSwapchainComposition = VULKAN_SupportsSwapchainComposition;
    result.*.SupportsPresentMode = VULKAN_SupportsPresentMode;
    result.*.ClaimWindow = VULKAN_ClaimWindow;
    result.*.ReleaseWindow = VULKAN_ReleaseWindow;
    result.*.SetSwapchainParameters = VULKAN_SetSwapchainParameters;
    result.*.SetAllowedFramesInFlight = VULKAN_SetAllowedFramesInFlight;
    result.*.GetSwapchainTextureFormat = VULKAN_GetSwapchainTextureFormat;
    result.*.AcquireCommandBuffer = VULKAN_AcquireCommandBuffer;
    result.*.AcquireSwapchainTexture = VULKAN_AcquireSwapchainTexture;
    result.*.WaitForSwapchain = VULKAN_WaitForSwapchain;
    result.*.WaitAndAcquireSwapchainTexture = VULKAN_WaitAndAcquireSwapchainTexture;
    result.*.Submit = VULKAN_Submit;
    result.*.SubmitAndAcquireFence = VULKAN_SubmitAndAcquireFence;
    result.*.Cancel = VULKAN_Cancel;
    result.*.Wait = VULKAN_Wait;
    result.*.WaitForFences = VULKAN_WaitForFences;
    result.*.QueryFence = VULKAN_QueryFence;
    result.*.ReleaseFence = VULKAN_ReleaseFence;
    result.*.SupportsTextureFormat = VULKAN_SupportsTextureFormat;
    result.*.SupportsSampleCount = VULKAN_SupportsSampleCount;
    result.*.driverData = @ptrCast(@alignCast(renderer));
    result.*.shader_formats = @as(c_uint, 1) << @intCast(@as(c_uint, 1));
    renderer.*.claimedWindowCapacity = 1;
    renderer.*.claimedWindowCount = 0;
    renderer.*.claimedWindows = @ptrCast(@alignCast(SDL_malloc_REAL(@as(c_ulong, renderer.*.claimedWindowCapacity) *% @sizeOf([*c]WindowData))));
    renderer.*.allocatorLock = SDL_CreateMutex_REAL();
    renderer.*.disposeLock = SDL_CreateMutex_REAL();
    renderer.*.submitLock = SDL_CreateMutex_REAL();
    renderer.*.acquireCommandBufferLock = SDL_CreateMutex_REAL();
    renderer.*.acquireUniformBufferLock = SDL_CreateMutex_REAL();
    renderer.*.renderPassFetchLock = SDL_CreateMutex_REAL();
    renderer.*.framebufferFetchLock = SDL_CreateMutex_REAL();
    renderer.*.graphicsPipelineLayoutFetchLock = SDL_CreateMutex_REAL();
    renderer.*.computePipelineLayoutFetchLock = SDL_CreateMutex_REAL();
    renderer.*.descriptorSetLayoutFetchLock = SDL_CreateMutex_REAL();
    renderer.*.windowLock = SDL_CreateMutex_REAL();
    renderer.*.submittedCommandBufferCapacity = 16;
    renderer.*.submittedCommandBufferCount = 0;
    renderer.*.submittedCommandBuffers = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf([*c]VulkanCommandBuffer) *% @as(c_ulong, renderer.*.submittedCommandBufferCapacity))));
    renderer.*.memoryAllocator = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(VulkanMemoryAllocator))));
    {
        i = 0;
        while (i < VK_MAX_MEMORY_TYPES) : (i +%= 1) {
            renderer.*.memoryAllocator.*.subAllocators[i].memoryTypeIndex = i;
            renderer.*.memoryAllocator.*.subAllocators[i].allocations = null;
            renderer.*.memoryAllocator.*.subAllocators[i].allocationCount = 0;
            renderer.*.memoryAllocator.*.subAllocators[i].sortedFreeRegions = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf([*c]VulkanMemoryFreeRegion) *% @as(c_ulong, 4))));
            renderer.*.memoryAllocator.*.subAllocators[i].sortedFreeRegionCount = 0;
            renderer.*.memoryAllocator.*.subAllocators[i].sortedFreeRegionCapacity = 4;
        }
    }
    renderer.*.uniformBufferPoolCount = 32;
    renderer.*.uniformBufferPoolCapacity = 32;
    renderer.*.uniformBufferPool = @ptrCast(@alignCast(SDL_malloc_REAL(@as(c_ulong, renderer.*.uniformBufferPoolCapacity) *% @sizeOf([*c]VulkanUniformBuffer))));
    {
        i = 0;
        while (i < renderer.*.uniformBufferPoolCount) : (i +%= 1) {
            renderer.*.uniformBufferPool[i] = VULKAN_INTERNAL_CreateUniformBuffer(renderer, UNIFORM_BUFFER_SIZE);
        }
    }
    renderer.*.descriptorSetCachePoolCapacity = 8;
    renderer.*.descriptorSetCachePoolCount = 0;
    renderer.*.descriptorSetCachePool = @ptrCast(@alignCast(SDL_calloc_REAL(renderer.*.descriptorSetCachePoolCapacity, @sizeOf([*c]DescriptorSetCache))));
    _ = SDL_SetAtomicInt_REAL(&renderer.*.layoutResourceID, 0);
    renderer.*.minUBOAlignment = @truncate(renderer.*.physicalDeviceProperties.properties.limits.minUniformBufferOffsetAlignment);
    renderer.*.commandPoolHashTable = SDL_CreateHashTable(0, @"false" != 0, VULKAN_INTERNAL_CommandPoolHashFunction, VULKAN_INTERNAL_CommandPoolHashKeyMatch, VULKAN_INTERNAL_CommandPoolHashDestroy, @ptrCast(@alignCast(renderer)));
    renderer.*.renderPassHashTable = SDL_CreateHashTable(0, @"false" != 0, VULKAN_INTERNAL_RenderPassHashFunction, VULKAN_INTERNAL_RenderPassHashKeyMatch, VULKAN_INTERNAL_RenderPassHashDestroy, @ptrCast(@alignCast(renderer)));
    renderer.*.framebufferHashTable = SDL_CreateHashTable(0, @"false" != 0, VULKAN_INTERNAL_FramebufferHashFunction, VULKAN_INTERNAL_FramebufferHashKeyMatch, VULKAN_INTERNAL_FramebufferHashDestroy, @ptrCast(@alignCast(renderer)));
    renderer.*.graphicsPipelineResourceLayoutHashTable = SDL_CreateHashTable(0, @"false" != 0, VULKAN_INTERNAL_GraphicsPipelineResourceLayoutHashFunction, VULKAN_INTERNAL_GraphicsPipelineResourceLayoutHashKeyMatch, VULKAN_INTERNAL_GraphicsPipelineResourceLayoutHashDestroy, @ptrCast(@alignCast(renderer)));
    renderer.*.computePipelineResourceLayoutHashTable = SDL_CreateHashTable(0, @"false" != 0, VULKAN_INTERNAL_ComputePipelineResourceLayoutHashFunction, VULKAN_INTERNAL_ComputePipelineResourceLayoutHashKeyMatch, VULKAN_INTERNAL_ComputePipelineResourceLayoutHashDestroy, @ptrCast(@alignCast(renderer)));
    renderer.*.descriptorSetLayoutHashTable = SDL_CreateHashTable(0, @"false" != 0, VULKAN_INTERNAL_DescriptorSetLayoutHashFunction, VULKAN_INTERNAL_DescriptorSetLayoutHashKeyMatch, VULKAN_INTERNAL_DescriptorSetLayoutHashDestroy, @ptrCast(@alignCast(renderer)));
    renderer.*.fencePool.lock = SDL_CreateMutex_REAL();
    renderer.*.fencePool.availableFenceCapacity = 4;
    renderer.*.fencePool.availableFenceCount = 0;
    renderer.*.fencePool.availableFences = @ptrCast(@alignCast(SDL_malloc_REAL(@as(c_ulong, renderer.*.fencePool.availableFenceCapacity) *% @sizeOf([*c]VulkanFenceHandle))));
    renderer.*.texturesToDestroyCapacity = 16;
    renderer.*.texturesToDestroyCount = 0;
    renderer.*.texturesToDestroy = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf([*c]VulkanTexture) *% @as(c_ulong, renderer.*.texturesToDestroyCapacity))));
    renderer.*.buffersToDestroyCapacity = 16;
    renderer.*.buffersToDestroyCount = 0;
    renderer.*.buffersToDestroy = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf([*c]VulkanBuffer) *% @as(c_ulong, renderer.*.buffersToDestroyCapacity))));
    renderer.*.samplersToDestroyCapacity = 16;
    renderer.*.samplersToDestroyCount = 0;
    renderer.*.samplersToDestroy = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf([*c]VulkanSampler) *% @as(c_ulong, renderer.*.samplersToDestroyCapacity))));
    renderer.*.graphicsPipelinesToDestroyCapacity = 16;
    renderer.*.graphicsPipelinesToDestroyCount = 0;
    renderer.*.graphicsPipelinesToDestroy = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf([*c]VulkanGraphicsPipeline) *% @as(c_ulong, renderer.*.graphicsPipelinesToDestroyCapacity))));
    renderer.*.computePipelinesToDestroyCapacity = 16;
    renderer.*.computePipelinesToDestroyCount = 0;
    renderer.*.computePipelinesToDestroy = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf([*c]VulkanComputePipeline) *% @as(c_ulong, renderer.*.computePipelinesToDestroyCapacity))));
    renderer.*.shadersToDestroyCapacity = 16;
    renderer.*.shadersToDestroyCount = 0;
    renderer.*.shadersToDestroy = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf([*c]VulkanShader) *% @as(c_ulong, renderer.*.shadersToDestroyCapacity))));
    renderer.*.framebuffersToDestroyCapacity = 16;
    renderer.*.framebuffersToDestroyCount = 0;
    renderer.*.framebuffersToDestroy = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf([*c]VulkanFramebuffer) *% @as(c_ulong, renderer.*.framebuffersToDestroyCapacity))));
    renderer.*.defragInProgress = 0;
    renderer.*.allocationsToDefragCount = 0;
    renderer.*.allocationsToDefragCapacity = 4;
    renderer.*.allocationsToDefrag = @ptrCast(@alignCast(SDL_malloc_REAL(@as(c_ulong, renderer.*.allocationsToDefragCapacity) *% @sizeOf([*c]VulkanMemoryAllocation))));
    return result;
}
pub export var VulkanDriver: SDL_GPUBootstrap = SDL_GPUBootstrap{
    .name = "vulkan",
    .PrepareDriver = VULKAN_PrepareDriver,
    .CreateDevice = VULKAN_CreateDevice,
};

pub const SDL_AddAtomicInt = SDL_AddAtomicInt_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub inline fn SDL_AtomicIncRef(a: anytype) @TypeOf(SDL_AddAtomicInt(a, @as(c_int, 1))) {
    @setEvalBranchQuota(100000);
    _ = &a;
    return SDL_AddAtomicInt(a, @as(c_int, 1));
}
pub const SDL_MAJOR_VERSION = @as(c_int, 3);
pub const SDL_MINOR_VERSION = @as(c_int, 5);
pub const SDL_MICRO_VERSION = @as(c_int, 0);
pub const VK_FALSE = @as(c_uint, 0);
pub const VK_TRUE = @as(c_uint, 1);
pub const VK_MAX_MEMORY_TYPES = @as(c_uint, 32);
pub const XR_NULL_HANDLE = @as(c_int, 0);
pub const MAX_STORAGE_TEXTURES_PER_STAGE = @as(c_int, 8);
pub const MAX_STORAGE_BUFFERS_PER_STAGE = @as(c_int, 8);
pub const MAX_UNIFORM_BUFFERS_PER_STAGE = @as(c_int, 4);
pub const MAX_COMPUTE_WRITE_BUFFERS = @as(c_int, 8);
pub const UNIFORM_BUFFER_SIZE = __helpers.promoteIntLiteral(c_int, 32768, .decimal);
pub const MAX_PRESENT_COUNT = @as(c_int, 16);
pub const MAX_FRAMES_IN_FLIGHT = @as(c_int, 3);
pub const SMALL_ALLOCATION_THRESHOLD = __helpers.promoteIntLiteral(c_int, 2097152, .decimal);
pub const SMALL_ALLOCATION_SIZE = __helpers.promoteIntLiteral(c_int, 16777216, .decimal);
pub const LARGE_ALLOCATION_INCREMENT = __helpers.promoteIntLiteral(c_int, 67108864, .decimal);
pub const MAX_UBO_SECTION_SIZE = @as(c_int, 4096);
pub const DESCRIPTOR_POOL_SIZE = @as(c_int, 128);
pub const VULKAN_INTERNAL_TRY_AGAIN = @as(c_int, 2);
