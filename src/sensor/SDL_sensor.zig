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
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Sint16 = i16;
pub const Uint16 = u16;
pub const Sint32 = i32;
pub const Uint32 = u32;
pub const Uint64 = u64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
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
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_PropertiesID = Uint32;
pub extern fn SDL_CreateProperties_REAL() SDL_PropertiesID;
pub extern fn SDL_DestroyProperties_REAL(props: SDL_PropertiesID) void;
pub const struct_SDL_Mutex = opaque {
};
pub const SDL_Mutex = struct_SDL_Mutex;
pub extern fn SDL_LockMutex_REAL(mutex: ?*SDL_Mutex) void;
pub extern fn SDL_UnlockMutex_REAL(mutex: ?*SDL_Mutex) void;
pub const SDL_AudioDeviceID = Uint32;
pub const SDL_CameraID = Uint32;
pub const SDL_DisplayID = Uint32;
pub const SDL_WindowID = Uint32;
pub const enum_SDL_PowerState = c_int;
pub const SDL_PowerState = enum_SDL_PowerState;
pub const SDL_SensorID = Uint32;
pub const SDL_SENSOR_INVALID: c_int = -1;
pub const enum_SDL_SensorType = c_int;
pub const SDL_SensorType = enum_SDL_SensorType;
pub const SDL_Sensor = struct_SDL_Sensor;
pub const struct_SDL_SensorDriver = extern struct {
    Init: ?*const fn () callconv(.c) bool = null,
    GetCount: ?*const fn () callconv(.c) c_int = null,
    Detect: ?*const fn () callconv(.c) void = null,
    GetDeviceName: ?*const fn (device_index: c_int) callconv(.c) [*c]const u8 = null,
    GetDeviceType: ?*const fn (device_index: c_int) callconv(.c) SDL_SensorType = null,
    GetDeviceNonPortableType: ?*const fn (device_index: c_int) callconv(.c) c_int = null,
    GetDeviceInstanceID: ?*const fn (device_index: c_int) callconv(.c) SDL_SensorID = null,
    Open: ?*const fn (sensor: [*c]SDL_Sensor, device_index: c_int) callconv(.c) bool = null,
    Update: ?*const fn (sensor: [*c]SDL_Sensor) callconv(.c) void = null,
    Close: ?*const fn (sensor: [*c]SDL_Sensor) callconv(.c) void = null,
    Quit: ?*const fn () callconv(.c) void = null,
};
pub const struct_sensor_hwdata_8 = opaque {};
pub const struct_SDL_Sensor = extern struct {
    instance_id: SDL_SensorID = 0,
    name: [*c]u8 = null,
    type: SDL_SensorType = @import("std").mem.zeroes(SDL_SensorType),
    non_portable_type: c_int = 0,
    data: [16]f32 = @import("std").mem.zeroes([16]f32),
    driver: [*c]struct_SDL_SensorDriver = null,
    hwdata: ?*struct_sensor_hwdata_8 = null,
    props: SDL_PropertiesID = 0,
    ref_count: c_int = 0,
    next: [*c]struct_SDL_Sensor = null,
};
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
pub const SDL_EVENT_SENSOR_UPDATE: c_int = 4608;
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
pub const SDL_InitFlags = Uint32;
pub extern fn SDL_InitSubSystem_REAL(flags: SDL_InitFlags) bool;
pub extern fn SDL_QuitSubSystem_REAL(flags: SDL_InitFlags) void;
pub extern fn SDL_WasInit_REAL(flags: SDL_InitFlags) SDL_InitFlags;
pub const SDL_OBJECT_TYPE_SENSOR: c_int = 7;
pub const SDL_ObjectType = c_uint;
pub extern fn SDL_SetObjectValid(object: ?*anyopaque, @"type": SDL_ObjectType, valid: bool) void;
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
pub extern fn SDL_GetPersistentString(string: [*c]const u8) [*c]const u8;
pub extern var SDL_event_lock: ?*SDL_Mutex;
pub const SDL_SensorDriver = struct_SDL_SensorDriver;
pub extern var SDL_DUMMY_SensorDriver: SDL_SensorDriver;
pub extern fn SDL_GamepadSensorWatcher(timestamp: Uint64, sensor: SDL_SensorID, sensor_timestamp: Uint64, data: [*c]f32, num_values: c_int) void;
pub var SDL_sensor_drivers: [1][*c]SDL_SensorDriver = [1][*c]SDL_SensorDriver{
    &SDL_DUMMY_SensorDriver,
};
pub var SDL_sensors_locked: c_int = 0;
pub var SDL_sensors_initialized: bool = false;
pub var SDL_sensors: [*c]SDL_Sensor = null;
pub export fn SDL_SensorsInitialized() bool {
    @setEvalBranchQuota(100000);
    return SDL_sensors_initialized;
}
pub export fn SDL_LockSensors() void {
    @setEvalBranchQuota(100000);
    SDL_LockMutex_REAL(SDL_event_lock);
    SDL_sensors_locked += 1;
}
pub export fn SDL_UnlockSensors() void {
    @setEvalBranchQuota(100000);
    SDL_sensors_locked -= 1;
    SDL_UnlockMutex_REAL(SDL_event_lock);
}
pub export fn SDL_SensorsLocked() bool {
    @setEvalBranchQuota(100000);
    return SDL_sensors_locked > @as(c_int, 0);
}
pub export fn SDL_AssertSensorsLocked() void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [23:0]u8 = "SDL_AssertSensorsLocked".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!SDL_SensorsLocked()) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "SDL_SensorsLocked()",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_sensor.c", 89);
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
pub export fn SDL_InitSensors() bool {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var status: bool = undefined;
    _ = &status;
    if (!SDL_InitSubSystem_REAL(SDL_INIT_EVENTS)) {
        return @"false" != 0;
    }
    SDL_LockSensors();
    SDL_sensors_initialized = @"true" != 0;
    status = @"false" != 0;
    {
        i = 0;
        while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(SDL_sensor_drivers)) / @sizeOf(@TypeOf(SDL_sensor_drivers[@as(c_int, 0)])))) : (i += 1) {
            if (SDL_sensor_drivers[@bitCast(@as(isize, @intCast(i)))].*.Init.?()) {
                status = @"true" != 0;
            }
        }
    }
    SDL_UnlockSensors();
    if (!status) {
        SDL_QuitSensors();
    }
    return status;
}
pub export fn SDL_SensorsOpened() bool {
    @setEvalBranchQuota(100000);
    var opened: bool = undefined;
    _ = &opened;
    SDL_LockSensors();
    {
        if (@as(?*anyopaque, @ptrCast(@alignCast(SDL_sensors))) != @as(?*anyopaque, null)) {
            opened = @"true" != 0;
        } else {
            opened = @"false" != 0;
        }
    }
    SDL_UnlockSensors();
    return opened;
}
pub export fn SDL_GetSensors_REAL(count: [*c]c_int) [*c]SDL_SensorID {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [19:0]u8 = "SDL_GetSensors_REAL".*;
    };
    _ = &static_local___func__;
    var i: c_int = undefined;
    _ = &i;
    var num_sensors: c_int = undefined;
    _ = &num_sensors;
    var device_index: c_int = undefined;
    _ = &device_index;
    var sensor_index: c_int = 0;
    _ = &sensor_index;
    var total_sensors: c_int = 0;
    _ = &total_sensors;
    var sensors: [*c]SDL_SensorID = undefined;
    _ = &sensors;
    SDL_LockSensors();
    {
        {
            i = 0;
            while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(SDL_sensor_drivers)) / @sizeOf(@TypeOf(SDL_sensor_drivers[@as(c_int, 0)])))) : (i += 1) {
                total_sensors += SDL_sensor_drivers[@bitCast(@as(isize, @intCast(i)))].*.GetCount.?();
            }
        }
        sensors = @ptrCast(@alignCast(SDL_malloc_REAL(@as(c_ulong, @bitCast(@as(c_long, total_sensors + @as(c_int, 1)))) *% @sizeOf(@TypeOf(sensors.*)))));
        if (sensors != null) {
            if (count != null) {
                count.* = total_sensors;
            }
            {
                i = 0;
                while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(SDL_sensor_drivers)) / @sizeOf(@TypeOf(SDL_sensor_drivers[@as(c_int, 0)])))) : (i += 1) {
                    num_sensors = SDL_sensor_drivers[@bitCast(@as(isize, @intCast(i)))].*.GetCount.?();
                    {
                        device_index = 0;
                        while (device_index < num_sensors) : (device_index += 1) {
                            while (true) {
                                while (!(sensor_index < total_sensors)) {
                                    const static_local_sdl_assert_data = struct {
                                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                            .always_ignore = @"false" != 0,
                                            .trigger_count = 0,
                                            .condition = "sensor_index < total_sensors",
                                            .filename = null,
                                            .linenum = 0,
                                            .function = null,
                                            .next = null,
                                        };
                                    };
                                    _ = &static_local_sdl_assert_data;
                                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_sensor.c", 159);
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
                            sensors[@bitCast(@as(isize, @intCast(sensor_index)))] = SDL_sensor_drivers[@bitCast(@as(isize, @intCast(i)))].*.GetDeviceInstanceID.?(device_index);
                            while (true) {
                                while (!(sensors[@bitCast(@as(isize, @intCast(sensor_index)))] > @as(SDL_SensorID, 0))) {
                                    const static_local_sdl_assert_data = struct {
                                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                            .always_ignore = @"false" != 0,
                                            .trigger_count = 0,
                                            .condition = "sensors[sensor_index] > 0",
                                            .filename = null,
                                            .linenum = 0,
                                            .function = null,
                                            .next = null,
                                        };
                                    };
                                    _ = &static_local_sdl_assert_data;
                                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_sensor.c", 161);
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
                            sensor_index += 1;
                        }
                    }
                }
            }
            while (true) {
                while (!(sensor_index == total_sensors)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "sensor_index == total_sensors",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_sensor.c", 165);
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
            sensors[@bitCast(@as(isize, @intCast(sensor_index)))] = 0;
        } else {
            if (count != null) {
                count.* = 0;
            }
        }
    }
    SDL_UnlockSensors();
    return sensors;
}
pub fn SDL_GetDriverAndSensorIndex(instance_id: SDL_SensorID, driver: [*c][*c]SDL_SensorDriver, driver_index: [*c]c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var num_sensors: c_int = undefined;
    _ = &num_sensors;
    var device_index: c_int = undefined;
    _ = &device_index;
    if (instance_id > @as(SDL_SensorID, 0)) {
        {
            i = 0;
            while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(SDL_sensor_drivers)) / @sizeOf(@TypeOf(SDL_sensor_drivers[@as(c_int, 0)])))) : (i += 1) {
                num_sensors = SDL_sensor_drivers[@bitCast(@as(isize, @intCast(i)))].*.GetCount.?();
                {
                    device_index = 0;
                    while (device_index < num_sensors) : (device_index += 1) {
                        var sensor_id: SDL_SensorID = SDL_sensor_drivers[@bitCast(@as(isize, @intCast(i)))].*.GetDeviceInstanceID.?(device_index);
                        _ = &sensor_id;
                        if (sensor_id == instance_id) {
                            driver.* = SDL_sensor_drivers[@bitCast(@as(isize, @intCast(i)))];
                            driver_index.* = device_index;
                            return @"true" != 0;
                        }
                    }
                }
            }
        }
    }
    _ = SDL_SetError_REAL("Sensor %u not found", instance_id);
    return @"false" != 0;
}
pub export fn SDL_GetSensorNameForID_REAL(instance_id: SDL_SensorID) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var driver: [*c]SDL_SensorDriver = undefined;
    _ = &driver;
    var device_index: c_int = undefined;
    _ = &device_index;
    var name: [*c]const u8 = null;
    _ = &name;
    SDL_LockSensors();
    if (SDL_GetDriverAndSensorIndex(instance_id, &driver, &device_index)) {
        name = SDL_GetPersistentString(driver.*.GetDeviceName.?(device_index));
    }
    SDL_UnlockSensors();
    return name;
}
pub export fn SDL_GetSensorTypeForID_REAL(instance_id: SDL_SensorID) SDL_SensorType {
    @setEvalBranchQuota(100000);
    var driver: [*c]SDL_SensorDriver = undefined;
    _ = &driver;
    var device_index: c_int = undefined;
    _ = &device_index;
    var @"type": SDL_SensorType = SDL_SENSOR_INVALID;
    _ = &@"type";
    SDL_LockSensors();
    if (SDL_GetDriverAndSensorIndex(instance_id, &driver, &device_index)) {
        @"type" = driver.*.GetDeviceType.?(device_index);
    }
    SDL_UnlockSensors();
    return @"type";
}
pub export fn SDL_GetSensorNonPortableTypeForID_REAL(instance_id: SDL_SensorID) c_int {
    @setEvalBranchQuota(100000);
    var driver: [*c]SDL_SensorDriver = undefined;
    _ = &driver;
    var device_index: c_int = undefined;
    _ = &device_index;
    var @"type": c_int = -@as(c_int, 1);
    _ = &@"type";
    SDL_LockSensors();
    if (SDL_GetDriverAndSensorIndex(instance_id, &driver, &device_index)) {
        @"type" = driver.*.GetDeviceNonPortableType.?(device_index);
    }
    SDL_UnlockSensors();
    return @"type";
}
pub export fn SDL_OpenSensor_REAL(instance_id: SDL_SensorID) [*c]SDL_Sensor {
    @setEvalBranchQuota(100000);
    var driver: [*c]SDL_SensorDriver = undefined;
    _ = &driver;
    var device_index: c_int = undefined;
    _ = &device_index;
    var sensor: [*c]SDL_Sensor = undefined;
    _ = &sensor;
    var sensorlist: [*c]SDL_Sensor = undefined;
    _ = &sensorlist;
    var sensorname: [*c]const u8 = null;
    _ = &sensorname;
    SDL_LockSensors();
    if (!SDL_GetDriverAndSensorIndex(instance_id, &driver, &device_index)) {
        SDL_UnlockSensors();
        return null;
    }
    sensorlist = SDL_sensors;
    while (sensorlist != null) {
        if (instance_id == sensorlist.*.instance_id) {
            sensor = sensorlist;
            sensor.*.ref_count += 1;
            SDL_UnlockSensors();
            return sensor;
        }
        sensorlist = sensorlist.*.next;
    }
    sensor = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(sensor.*)))));
    if (!(sensor != null)) {
        SDL_UnlockSensors();
        return null;
    }
    SDL_SetObjectValid(@ptrCast(@alignCast(sensor)), SDL_OBJECT_TYPE_SENSOR, @"true" != 0);
    sensor.*.driver = driver;
    sensor.*.instance_id = instance_id;
    sensor.*.type = driver.*.GetDeviceType.?(device_index);
    sensor.*.non_portable_type = driver.*.GetDeviceNonPortableType.?(device_index);
    if (!driver.*.Open.?(sensor, device_index)) {
        SDL_SetObjectValid(@ptrCast(@alignCast(sensor)), SDL_OBJECT_TYPE_SENSOR, @"false" != 0);
        SDL_free_REAL(@ptrCast(@alignCast(sensor)));
        SDL_UnlockSensors();
        return null;
    }
    sensorname = driver.*.GetDeviceName.?(device_index);
    if (sensorname != null) {
        sensor.*.name = SDL_strdup_REAL(sensorname);
    } else {
        sensor.*.name = null;
    }
    sensor.*.ref_count += 1;
    sensor.*.next = SDL_sensors;
    SDL_sensors = sensor;
    driver.*.Update.?(sensor);
    SDL_UnlockSensors();
    return sensor;
}
pub export fn SDL_GetSensorFromID_REAL(instance_id: SDL_SensorID) [*c]SDL_Sensor {
    @setEvalBranchQuota(100000);
    var sensor: [*c]SDL_Sensor = undefined;
    _ = &sensor;
    SDL_LockSensors();
    {
        sensor = SDL_sensors;
        while (sensor != null) : (sensor = sensor.*.next) {
            if (sensor.*.instance_id == instance_id) {
                break;
            }
        }
    }
    SDL_UnlockSensors();
    return sensor;
}
pub export fn SDL_GetSensorProperties_REAL(sensor: [*c]SDL_Sensor) SDL_PropertiesID {
    @setEvalBranchQuota(100000);
    var result: SDL_PropertiesID = undefined;
    _ = &result;
    SDL_LockSensors();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(sensor)), SDL_OBJECT_TYPE_SENSOR)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("sensor"))));
            SDL_UnlockSensors();
            return 0;
        }
        if (sensor.*.props == @as(SDL_PropertiesID, 0)) {
            sensor.*.props = SDL_CreateProperties_REAL();
        }
        result = sensor.*.props;
    }
    SDL_UnlockSensors();
    return result;
}
pub export fn SDL_GetSensorName_REAL(sensor: [*c]SDL_Sensor) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var result: [*c]const u8 = undefined;
    _ = &result;
    SDL_LockSensors();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(sensor)), SDL_OBJECT_TYPE_SENSOR)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("sensor"))));
            SDL_UnlockSensors();
            return null;
        }
        result = SDL_GetPersistentString(sensor.*.name);
    }
    SDL_UnlockSensors();
    return result;
}
pub export fn SDL_GetSensorType_REAL(sensor: [*c]SDL_Sensor) SDL_SensorType {
    @setEvalBranchQuota(100000);
    var result: SDL_SensorType = undefined;
    _ = &result;
    SDL_LockSensors();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(sensor)), SDL_OBJECT_TYPE_SENSOR)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("sensor"))));
            SDL_UnlockSensors();
            return SDL_SENSOR_INVALID;
        }
        result = sensor.*.type;
    }
    SDL_UnlockSensors();
    return result;
}
pub export fn SDL_GetSensorNonPortableType_REAL(sensor: [*c]SDL_Sensor) c_int {
    @setEvalBranchQuota(100000);
    var result: c_int = undefined;
    _ = &result;
    SDL_LockSensors();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(sensor)), SDL_OBJECT_TYPE_SENSOR)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("sensor"))));
            SDL_UnlockSensors();
            return -@as(c_int, 1);
        }
        result = sensor.*.non_portable_type;
    }
    SDL_UnlockSensors();
    return result;
}
pub export fn SDL_GetSensorID_REAL(sensor: [*c]SDL_Sensor) SDL_SensorID {
    @setEvalBranchQuota(100000);
    var result: SDL_SensorID = undefined;
    _ = &result;
    SDL_LockSensors();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(sensor)), SDL_OBJECT_TYPE_SENSOR)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("sensor"))));
            SDL_UnlockSensors();
            return 0;
        }
        result = sensor.*.instance_id;
    }
    SDL_UnlockSensors();
    return result;
}
pub export fn SDL_GetSensorData_REAL(sensor: [*c]SDL_Sensor, data: [*c]f32, arg_num_values: c_int) bool {
    @setEvalBranchQuota(100000);
    var num_values = arg_num_values;
    _ = &num_values;
    SDL_LockSensors();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(sensor)), SDL_OBJECT_TYPE_SENSOR)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("sensor"))));
            SDL_UnlockSensors();
            return @"false" != 0;
        }
        num_values = @bitCast(@as(c_uint, @truncate(if (@as(c_ulong, @bitCast(@as(c_long, num_values))) < (@sizeOf(@TypeOf(sensor.*.data)) / @sizeOf(@TypeOf(sensor.*.data[@as(c_int, 0)])))) @as(c_ulong, @bitCast(@as(c_long, num_values))) else @sizeOf(@TypeOf(sensor.*.data)) / @sizeOf(@TypeOf(sensor.*.data[@as(c_int, 0)])))));
        _ = memcpy(@ptrCast(@alignCast(data)), @ptrCast(@alignCast(@as([*c]f32, @ptrCast(@alignCast(&sensor.*.data))))), @as(c_ulong, @bitCast(@as(c_long, num_values))) *% @sizeOf(@TypeOf(data.*)));
    }
    SDL_UnlockSensors();
    return @"true" != 0;
}
pub export fn SDL_CloseSensor_REAL(sensor: [*c]SDL_Sensor) void {
    @setEvalBranchQuota(100000);
    var sensorlist: [*c]SDL_Sensor = undefined;
    _ = &sensorlist;
    var sensorlistprev: [*c]SDL_Sensor = undefined;
    _ = &sensorlistprev;
    SDL_LockSensors();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(sensor)), SDL_OBJECT_TYPE_SENSOR)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("sensor"))));
            SDL_UnlockSensors();
            return;
        }
        if ((blk: {
            const ref = &sensor.*.ref_count;
            ref.* -= 1;
            break :blk ref.*;
        }) > @as(c_int, 0)) {
            SDL_UnlockSensors();
            return;
        }
        SDL_DestroyProperties_REAL(sensor.*.props);
        sensor.*.driver.*.Close.?(sensor);
        sensor.*.hwdata = null;
        SDL_SetObjectValid(@ptrCast(@alignCast(sensor)), SDL_OBJECT_TYPE_SENSOR, @"false" != 0);
        sensorlist = SDL_sensors;
        sensorlistprev = null;
        while (sensorlist != null) {
            if (sensor == sensorlist) {
                if (sensorlistprev != null) {
                    sensorlistprev.*.next = sensorlist.*.next;
                } else {
                    SDL_sensors = sensor.*.next;
                }
                break;
            }
            sensorlistprev = sensorlist;
            sensorlist = sensorlist.*.next;
        }
        SDL_free_REAL(@ptrCast(@alignCast(sensor.*.name)));
        SDL_free_REAL(@ptrCast(@alignCast(sensor)));
    }
    SDL_UnlockSensors();
}
pub export fn SDL_QuitSensors() void {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    SDL_LockSensors();
    while (SDL_sensors != null) {
        SDL_sensors.*.ref_count = 1;
        SDL_CloseSensor_REAL(SDL_sensors);
    }
    {
        i = 0;
        while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(SDL_sensor_drivers)) / @sizeOf(@TypeOf(SDL_sensor_drivers[@as(c_int, 0)])))) : (i += 1) {
            SDL_sensor_drivers[@bitCast(@as(isize, @intCast(i)))].*.Quit.?();
        }
    }
    SDL_QuitSubSystem_REAL(SDL_INIT_EVENTS);
    SDL_sensors_initialized = @"false" != 0;
    SDL_UnlockSensors();
}
pub export fn SDL_SendSensorUpdate(timestamp: Uint64, sensor: [*c]SDL_Sensor, sensor_timestamp: Uint64, data: [*c]f32, arg_num_values: c_int) void {
    @setEvalBranchQuota(100000);
    var num_values = arg_num_values;
    _ = &num_values;
    SDL_AssertSensorsLocked();
    num_values = @bitCast(@as(c_uint, @truncate(if (@as(c_ulong, @bitCast(@as(c_long, num_values))) < (@sizeOf(@TypeOf(sensor.*.data)) / @sizeOf(@TypeOf(sensor.*.data[@as(c_int, 0)])))) @as(c_ulong, @bitCast(@as(c_long, num_values))) else @sizeOf(@TypeOf(sensor.*.data)) / @sizeOf(@TypeOf(sensor.*.data[@as(c_int, 0)])))));
    _ = memcpy(@ptrCast(@alignCast(@as([*c]f32, @ptrCast(@alignCast(&sensor.*.data))))), @ptrCast(@alignCast(data)), @as(c_ulong, @bitCast(@as(c_long, num_values))) *% @sizeOf(@TypeOf(data.*)));
    if (SDL_EventEnabled_REAL(SDL_EVENT_SENSOR_UPDATE)) {
        var event: SDL_Event = undefined;
        _ = &event;
        event.type = SDL_EVENT_SENSOR_UPDATE;
        event.common.timestamp = timestamp;
        event.sensor.which = sensor.*.instance_id;
        num_values = @bitCast(@as(c_uint, @truncate(if (@as(c_ulong, @bitCast(@as(c_long, num_values))) < (@sizeOf(@TypeOf(event.sensor.data)) / @sizeOf(@TypeOf(event.sensor.data[@as(c_int, 0)])))) @as(c_ulong, @bitCast(@as(c_long, num_values))) else @sizeOf(@TypeOf(event.sensor.data)) / @sizeOf(@TypeOf(event.sensor.data[@as(c_int, 0)])))));
        _ = memset(@ptrCast(@alignCast(@as([*c]f32, @ptrCast(@alignCast(&event.sensor.data))))), 0, @sizeOf(@TypeOf(event.sensor.data)));
        _ = memcpy(@ptrCast(@alignCast(@as([*c]f32, @ptrCast(@alignCast(&event.sensor.data))))), @ptrCast(@alignCast(data)), @as(c_ulong, @bitCast(@as(c_long, num_values))) *% @sizeOf(@TypeOf(data.*)));
        event.sensor.sensor_timestamp = sensor_timestamp;
        _ = SDL_PushEvent_REAL(&event);
    }
    SDL_GamepadSensorWatcher(timestamp, sensor.*.instance_id, sensor_timestamp, data, num_values);
}
pub export fn SDL_UpdateSensor(sensor: [*c]SDL_Sensor) void {
    @setEvalBranchQuota(100000);
    SDL_LockSensors();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(sensor)), SDL_OBJECT_TYPE_SENSOR)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("sensor"))));
            SDL_UnlockSensors();
            return;
        }
        sensor.*.driver.*.Update.?(sensor);
    }
    SDL_UnlockSensors();
}
pub export fn SDL_UpdateSensors_REAL() void {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var sensor: [*c]SDL_Sensor = undefined;
    _ = &sensor;
    if (!(SDL_WasInit_REAL(SDL_INIT_SENSOR) != 0)) {
        return;
    }
    SDL_LockSensors();
    {
        sensor = SDL_sensors;
        while (sensor != null) : (sensor = sensor.*.next) {
            sensor.*.driver.*.Update.?(sensor);
        }
    }
    {
        i = 0;
        while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(SDL_sensor_drivers)) / @sizeOf(@TypeOf(SDL_sensor_drivers[@as(c_int, 0)])))) : (i += 1) {
            SDL_sensor_drivers[@bitCast(@as(isize, @intCast(i)))].*.Detect.?();
        }
    }
    SDL_UnlockSensors();
}

pub const SDL_GetSensorData = SDL_GetSensorData_REAL;
pub const SDL_GetSensorFromID = SDL_GetSensorFromID_REAL;
pub const SDL_GetSensorID = SDL_GetSensorID_REAL;
pub const SDL_GetSensorName = SDL_GetSensorName_REAL;
pub const SDL_GetSensorNameForID = SDL_GetSensorNameForID_REAL;
pub const SDL_GetSensorNonPortableType = SDL_GetSensorNonPortableType_REAL;
pub const SDL_GetSensorNonPortableTypeForID = SDL_GetSensorNonPortableTypeForID_REAL;
pub const SDL_GetSensorProperties = SDL_GetSensorProperties_REAL;
pub const SDL_GetSensorType = SDL_GetSensorType_REAL;
pub const SDL_GetSensorTypeForID = SDL_GetSensorTypeForID_REAL;
pub const SDL_GetSensors = SDL_GetSensors_REAL;
pub const SDL_OpenSensor = SDL_OpenSensor_REAL;
pub const SDL_UpdateSensors = SDL_UpdateSensors_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_INIT_EVENTS = @as(c_uint, 0x00004000);
pub const SDL_INIT_SENSOR = @as(c_uint, 0x00008000);
