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
pub extern fn SDL_realloc_REAL(mem: ?*anyopaque, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_getenv_unsafe_REAL(name: [*c]const u8) [*c]const u8;
pub extern fn SDL_abs_REAL(x: c_int) c_int;
pub extern fn SDL_crc16_REAL(crc: Uint16, data: ?*const anyopaque, len: usize) Uint16;
pub extern fn SDL_strlen_REAL(str: [*c]const u8) usize;
pub extern fn SDL_strlcpy_REAL(dst: [*c]u8, src: [*c]const u8, maxlen: usize) usize;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_strstr_REAL(haystack: [*c]const u8, needle: [*c]const u8) [*c]u8;
pub extern fn SDL_strtol_REAL(str: [*c]const u8, endp: [*c][*c]u8, base: c_int) c_long;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_strncmp_REAL(str1: [*c]const u8, str2: [*c]const u8, maxlen: usize) c_int;
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
pub extern fn SDL_CreateProperties_REAL() SDL_PropertiesID;
pub extern fn SDL_DestroyProperties_REAL(props: SDL_PropertiesID) void;
pub const struct_SDL_Mutex = opaque {
};
pub const SDL_Mutex = struct_SDL_Mutex;
pub extern fn SDL_LockMutex_REAL(mutex: ?*SDL_Mutex) void;
pub extern fn SDL_TryLockMutex_REAL(mutex: ?*SDL_Mutex) bool;
pub extern fn SDL_UnlockMutex_REAL(mutex: ?*SDL_Mutex) void;
pub extern fn SDL_LoadFile_REAL(file: [*c]const u8, datasize: [*c]usize) ?*anyopaque;
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
pub const SDL_ORIENTATION_LANDSCAPE: c_int = 1;
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
pub extern fn SDL_GetPrimaryDisplay_REAL() SDL_DisplayID;
pub extern fn SDL_GetNaturalDisplayOrientation_REAL(displayID: SDL_DisplayID) SDL_DisplayOrientation;
pub const struct_SDL_GUID = extern struct {
    data: [16]Uint8 = @import("std").mem.zeroes([16]Uint8),
};
pub const SDL_GUID = struct_SDL_GUID;
pub const SDL_POWERSTATE_ERROR: c_int = -1;
pub const enum_SDL_PowerState = c_int;
pub const SDL_PowerState = enum_SDL_PowerState;
pub const struct_SDL_Sensor = opaque {
};
pub const SDL_Sensor = struct_SDL_Sensor;
pub const SDL_SensorID = Uint32;
pub const SDL_SENSOR_ACCEL: c_int = 1;
pub const SDL_SENSOR_GYRO: c_int = 2;
pub const enum_SDL_SensorType = c_int;
pub const SDL_SensorType = enum_SDL_SensorType;
pub extern fn SDL_GetSensors_REAL(count: [*c]c_int) [*c]SDL_SensorID;
pub extern fn SDL_GetSensorNameForID_REAL(instance_id: SDL_SensorID) [*c]const u8;
pub extern fn SDL_GetSensorTypeForID_REAL(instance_id: SDL_SensorID) SDL_SensorType;
pub extern fn SDL_OpenSensor_REAL(instance_id: SDL_SensorID) ?*SDL_Sensor;
pub extern fn SDL_CloseSensor_REAL(sensor: ?*SDL_Sensor) void;
pub const SDL_JoystickID = Uint32;
pub const struct_SDL_JoystickAxisInfo = extern struct {
    initial_value: Sint16 = 0,
    value: Sint16 = 0,
    zero: Sint16 = 0,
    has_initial_value: bool = false,
    has_second_value: bool = false,
    sent_initial_value: bool = false,
    sending_initial_value: bool = false,
};
pub const SDL_JoystickAxisInfo = struct_SDL_JoystickAxisInfo;
pub const struct_SDL_JoystickBallData = extern struct {
    dx: c_int = 0,
    dy: c_int = 0,
};
pub const SDL_JoystickBallData = struct_SDL_JoystickBallData;
pub const struct_SDL_JoystickTouchpadFingerInfo = extern struct {
    down: bool = false,
    x: f32 = 0,
    y: f32 = 0,
    pressure: f32 = 0,
};
pub const SDL_JoystickTouchpadFingerInfo = struct_SDL_JoystickTouchpadFingerInfo;
pub const struct_SDL_JoystickTouchpadInfo = extern struct {
    nfingers: c_int = 0,
    fingers: [*c]SDL_JoystickTouchpadFingerInfo = null,
};
pub const SDL_JoystickTouchpadInfo = struct_SDL_JoystickTouchpadInfo;
pub const struct_SDL_JoystickSensorInfo = extern struct {
    type: SDL_SensorType = @import("std").mem.zeroes(SDL_SensorType),
    enabled: bool = false,
    rate: f32 = 0,
    data: [3]f32 = @import("std").mem.zeroes([3]f32),
};
pub const SDL_JoystickSensorInfo = struct_SDL_JoystickSensorInfo;
pub const enum_SDL_GamepadCapSenseType = c_int;
pub const SDL_GamepadCapSenseType = enum_SDL_GamepadCapSenseType;
pub const struct_SDL_JoystickCapSenseInfo = extern struct {
    type: SDL_GamepadCapSenseType = @import("std").mem.zeroes(SDL_GamepadCapSenseType),
    down: bool = false,
};
pub const SDL_JoystickCapSenseInfo = struct_SDL_JoystickCapSenseInfo;
pub const SDL_JOYSTICK_CONNECTION_INVALID: c_int = -1;
pub const enum_SDL_JoystickConnectionState = c_int;
pub const SDL_JoystickConnectionState = enum_SDL_JoystickConnectionState;
pub const SDL_Joystick = struct_SDL_Joystick;
pub const struct_SDL_InputMapping = extern struct {
    kind: EMappingKind = @import("std").mem.zeroes(EMappingKind),
    target: Uint8 = 0,
    axis_reversed: bool = false,
    half_axis_positive: bool = false,
    half_axis_negative: bool = false,
};
pub const SDL_InputMapping = struct_SDL_InputMapping;
pub const struct_SDL_GamepadMapping = extern struct {
    a: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    b: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    x: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    y: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    back: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    guide: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    start: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    leftstick: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    rightstick: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    leftshoulder: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    rightshoulder: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    dpup: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    dpdown: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    dpleft: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    dpright: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    misc1: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    misc2: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    misc3: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    misc4: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    misc5: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    misc6: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    right_paddle1: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    left_paddle1: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    right_paddle2: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    left_paddle2: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    leftx: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    lefty: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    rightx: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    righty: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    lefttrigger: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    righttrigger: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    touchpad: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
};
pub const SDL_GamepadMapping = struct_SDL_GamepadMapping;
pub const struct_SDL_JoystickDriver = extern struct {
    Init: ?*const fn () callconv(.c) bool = null,
    GetCount: ?*const fn () callconv(.c) c_int = null,
    Detect: ?*const fn () callconv(.c) void = null,
    IsDevicePresent: ?*const fn (vendor_id: Uint16, product_id: Uint16, version: Uint16, name: [*c]const u8) callconv(.c) bool = null,
    GetDeviceName: ?*const fn (device_index: c_int) callconv(.c) [*c]const u8 = null,
    GetDevicePath: ?*const fn (device_index: c_int) callconv(.c) [*c]const u8 = null,
    GetDeviceSteamVirtualGamepadSlot: ?*const fn (device_index: c_int) callconv(.c) c_int = null,
    GetDevicePlayerIndex: ?*const fn (device_index: c_int) callconv(.c) c_int = null,
    SetDevicePlayerIndex: ?*const fn (device_index: c_int, player_index: c_int) callconv(.c) void = null,
    GetDeviceGUID: ?*const fn (device_index: c_int) callconv(.c) SDL_GUID = null,
    GetDeviceInstanceID: ?*const fn (device_index: c_int) callconv(.c) SDL_JoystickID = null,
    Open: ?*const fn (joystick: [*c]SDL_Joystick, device_index: c_int) callconv(.c) bool = null,
    Rumble: ?*const fn (joystick: [*c]SDL_Joystick, low_frequency_rumble: Uint16, high_frequency_rumble: Uint16) callconv(.c) bool = null,
    RumbleTriggers: ?*const fn (joystick: [*c]SDL_Joystick, left_rumble: Uint16, right_rumble: Uint16) callconv(.c) bool = null,
    SetLED: ?*const fn (joystick: [*c]SDL_Joystick, red: Uint8, green: Uint8, blue: Uint8) callconv(.c) bool = null,
    SendEffect: ?*const fn (joystick: [*c]SDL_Joystick, data: ?*const anyopaque, size: c_int) callconv(.c) bool = null,
    SetSensorsEnabled: ?*const fn (joystick: [*c]SDL_Joystick, enabled: bool) callconv(.c) bool = null,
    Update: ?*const fn (joystick: [*c]SDL_Joystick) callconv(.c) void = null,
    Close: ?*const fn (joystick: [*c]SDL_Joystick) callconv(.c) void = null,
    Quit: ?*const fn () callconv(.c) void = null,
    GetGamepadMapping: ?*const fn (device_index: c_int, out: [*c]SDL_GamepadMapping) callconv(.c) bool = null,
};
pub const SDL_JOYSTICK_TYPE_UNKNOWN: c_int = 0;
pub const SDL_JOYSTICK_TYPE_GAMEPAD: c_int = 1;
pub const SDL_JOYSTICK_TYPE_WHEEL: c_int = 2;
pub const SDL_JOYSTICK_TYPE_ARCADE_STICK: c_int = 3;
pub const SDL_JOYSTICK_TYPE_FLIGHT_STICK: c_int = 4;
pub const SDL_JOYSTICK_TYPE_DANCE_PAD: c_int = 5;
pub const SDL_JOYSTICK_TYPE_GUITAR: c_int = 6;
pub const SDL_JOYSTICK_TYPE_DRUM_KIT: c_int = 7;
pub const SDL_JOYSTICK_TYPE_ARCADE_PAD: c_int = 8;
pub const SDL_JOYSTICK_TYPE_THROTTLE: c_int = 9;
pub const enum_SDL_JoystickType = c_uint;
pub const SDL_JoystickType = enum_SDL_JoystickType;
pub const struct_SDL_VirtualJoystickTouchpadDesc = extern struct {
    nfingers: Uint16 = 0,
    padding: [3]Uint16 = @import("std").mem.zeroes([3]Uint16),
};
pub const SDL_VirtualJoystickTouchpadDesc = struct_SDL_VirtualJoystickTouchpadDesc;
pub const struct_SDL_VirtualJoystickSensorDesc = extern struct {
    type: SDL_SensorType = @import("std").mem.zeroes(SDL_SensorType),
    rate: f32 = 0,
};
pub const SDL_VirtualJoystickSensorDesc = struct_SDL_VirtualJoystickSensorDesc;
pub const struct_SDL_VirtualJoystickDesc = extern struct {
    version: Uint32 = 0,
    type: Uint16 = 0,
    padding: Uint16 = 0,
    vendor_id: Uint16 = 0,
    product_id: Uint16 = 0,
    naxes: Uint16 = 0,
    nbuttons: Uint16 = 0,
    nballs: Uint16 = 0,
    nhats: Uint16 = 0,
    ntouchpads: Uint16 = 0,
    nsensors: Uint16 = 0,
    padding2: [2]Uint16 = @import("std").mem.zeroes([2]Uint16),
    button_mask: Uint32 = 0,
    axis_mask: Uint32 = 0,
    name: [*c]const u8 = null,
    touchpads: [*c]const SDL_VirtualJoystickTouchpadDesc = null,
    sensors: [*c]const SDL_VirtualJoystickSensorDesc = null,
    userdata: ?*anyopaque = null,
    Update: ?*const fn (userdata: ?*anyopaque) callconv(.c) void = null,
    SetPlayerIndex: ?*const fn (userdata: ?*anyopaque, player_index: c_int) callconv(.c) void = null,
    Rumble: ?*const fn (userdata: ?*anyopaque, low_frequency_rumble: Uint16, high_frequency_rumble: Uint16) callconv(.c) bool = null,
    RumbleTriggers: ?*const fn (userdata: ?*anyopaque, left_rumble: Uint16, right_rumble: Uint16) callconv(.c) bool = null,
    SetLED: ?*const fn (userdata: ?*anyopaque, red: Uint8, green: Uint8, blue: Uint8) callconv(.c) bool = null,
    SendEffect: ?*const fn (userdata: ?*anyopaque, data: ?*const anyopaque, size: c_int) callconv(.c) bool = null,
    SetSensorsEnabled: ?*const fn (userdata: ?*anyopaque, enabled: bool) callconv(.c) bool = null,
    Cleanup: ?*const fn (userdata: ?*anyopaque) callconv(.c) void = null,
};
pub const SDL_VirtualJoystickDesc = struct_SDL_VirtualJoystickDesc;
pub const struct_VirtualSensorEvent = extern struct {
    type: SDL_SensorType = @import("std").mem.zeroes(SDL_SensorType),
    sensor_timestamp: Uint64 = 0,
    data: [3]f32 = @import("std").mem.zeroes([3]f32),
    num_values: c_int = 0,
};
pub const VirtualSensorEvent = struct_VirtualSensorEvent;
pub const struct_joystick_hwdata = extern struct {
    instance_id: SDL_JoystickID = 0,
    attached: bool = false,
    name: [*c]u8 = null,
    type: SDL_JoystickType = @import("std").mem.zeroes(SDL_JoystickType),
    guid: SDL_GUID = @import("std").mem.zeroes(SDL_GUID),
    desc: SDL_VirtualJoystickDesc = @import("std").mem.zeroes(SDL_VirtualJoystickDesc),
    changes: Uint32 = 0,
    axes: [*c]Sint16 = null,
    buttons: [*c]bool = null,
    hats: [*c]Uint8 = null,
    balls: [*c]SDL_JoystickBallData = null,
    touchpads: [*c]SDL_JoystickTouchpadInfo = null,
    sensors: [*c]SDL_JoystickSensorInfo = null,
    sensors_enabled: bool = false,
    num_sensor_events: c_int = 0,
    max_sensor_events: c_int = 0,
    sensor_events: [*c]VirtualSensorEvent = null,
    joystick: [*c]SDL_Joystick = null,
    next: [*c]struct_joystick_hwdata = null,
};
pub const struct_SDL_Joystick = extern struct {
    instance_id: SDL_JoystickID = 0,
    name: [*c]u8 = null,
    path: [*c]u8 = null,
    serial: [*c]u8 = null,
    guid: SDL_GUID = @import("std").mem.zeroes(SDL_GUID),
    firmware_version: Uint16 = 0,
    steam_handle: Uint64 = 0,
    swap_face_buttons: bool = false,
    is_virtual: bool = false,
    naxes: c_int = 0,
    axes: [*c]SDL_JoystickAxisInfo = null,
    nballs: c_int = 0,
    balls: [*c]SDL_JoystickBallData = null,
    nhats: c_int = 0,
    hats: [*c]Uint8 = null,
    nbuttons: c_int = 0,
    buttons: [*c]bool = null,
    ntouchpads: c_int = 0,
    touchpads: [*c]SDL_JoystickTouchpadInfo = null,
    nsensors: c_int = 0,
    nsensors_enabled: c_int = 0,
    sensors: [*c]SDL_JoystickSensorInfo = null,
    ncapsenses: c_int = 0,
    capsenses: [*c]SDL_JoystickCapSenseInfo = null,
    low_frequency_rumble: Uint16 = 0,
    high_frequency_rumble: Uint16 = 0,
    rumble_expiration: Uint64 = 0,
    rumble_resend: Uint64 = 0,
    left_trigger_rumble: Uint16 = 0,
    right_trigger_rumble: Uint16 = 0,
    trigger_rumble_expiration: Uint64 = 0,
    trigger_rumble_resend: Uint64 = 0,
    led_red: Uint8 = 0,
    led_green: Uint8 = 0,
    led_blue: Uint8 = 0,
    led_expiration: Uint64 = 0,
    attached: bool = false,
    connection_state: SDL_JoystickConnectionState = @import("std").mem.zeroes(SDL_JoystickConnectionState),
    battery_state: SDL_PowerState = @import("std").mem.zeroes(SDL_PowerState),
    battery_percent: c_int = 0,
    delayed_guide_button: bool = false,
    accel_sensor: SDL_SensorID = 0,
    accel: ?*SDL_Sensor = null,
    gyro_sensor: SDL_SensorID = 0,
    gyro: ?*SDL_Sensor = null,
    sensor_transform: [3][3]f32 = @import("std").mem.zeroes([3][3]f32),
    update_complete: Uint64 = 0,
    driver: [*c]struct_SDL_JoystickDriver = null,
    hwdata: [*c]struct_joystick_hwdata = null,
    props: SDL_PropertiesID = 0,
    ref_count: c_int = 0,
    next: [*c]struct_SDL_Joystick = null,
};
comptime {
    if (!(((@sizeOf(?*anyopaque) == @as(c_ulong, 4)) and (@sizeOf(SDL_VirtualJoystickDesc) == @as(c_ulong, 84))) or ((@sizeOf(?*anyopaque) == @as(c_ulong, 8)) and (@sizeOf(SDL_VirtualJoystickDesc) == @as(c_ulong, 136))))) @compileError("static assertion failed \"(sizeof(void *) == 4 && sizeof(SDL_VirtualJoystickDesc) == 84) || (sizeof(void *) == 8 && sizeof(SDL_VirtualJoystickDesc) == 136)\"");
}
pub const SDL_GAMEPAD_TYPE_STANDARD: c_int = 1;
pub const SDL_GAMEPAD_TYPE_XBOX360: c_int = 2;
pub const SDL_GAMEPAD_TYPE_XBOXONE: c_int = 3;
pub const SDL_GAMEPAD_TYPE_PS3: c_int = 4;
pub const SDL_GAMEPAD_TYPE_PS4: c_int = 5;
pub const SDL_GAMEPAD_TYPE_PS5: c_int = 6;
pub const SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_PRO: c_int = 7;
pub const SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_LEFT: c_int = 8;
pub const SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_RIGHT: c_int = 9;
pub const SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_PAIR: c_int = 10;
pub const SDL_GAMEPAD_TYPE_GAMECUBE: c_int = 11;
pub const SDL_GAMEPAD_TYPE_STEAM: c_int = 12;
pub const enum_SDL_GamepadType = c_uint;
pub const SDL_GamepadType = enum_SDL_GamepadType;
pub const SDL_GAMEPAD_AXIS_LEFT_TRIGGER: c_int = 4;
pub const SDL_GAMEPAD_AXIS_RIGHT_TRIGGER: c_int = 5;
pub const SDL_GAMEPAD_AXIS_COUNT: c_int = 6;
pub extern fn SDL_IsGamepad_REAL(instance_id: SDL_JoystickID) bool;
pub const enum_SDL_Scancode = c_uint;
pub const SDL_Scancode = enum_SDL_Scancode;
pub const SDL_Keycode = Uint32;
pub const SDL_Keymod = Uint16;
pub const SDL_KeyboardID = Uint32;
pub extern fn SDL_GetKeyboardFocus_REAL() [*c]SDL_Window;
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
pub const SDL_EVENT_JOYSTICK_AXIS_MOTION: c_int = 1536;
pub const SDL_EVENT_JOYSTICK_BALL_MOTION: c_int = 1537;
pub const SDL_EVENT_JOYSTICK_HAT_MOTION: c_int = 1538;
pub const SDL_EVENT_JOYSTICK_BUTTON_DOWN: c_int = 1539;
pub const SDL_EVENT_JOYSTICK_BUTTON_UP: c_int = 1540;
pub const SDL_EVENT_JOYSTICK_ADDED: c_int = 1541;
pub const SDL_EVENT_JOYSTICK_REMOVED: c_int = 1542;
pub const SDL_EVENT_JOYSTICK_BATTERY_UPDATED: c_int = 1543;
pub const SDL_EVENT_JOYSTICK_UPDATE_COMPLETE: c_int = 1544;
pub const SDL_EVENT_GAMEPAD_TOUCHPAD_DOWN: c_int = 1622;
pub const SDL_EVENT_GAMEPAD_TOUCHPAD_MOTION: c_int = 1623;
pub const SDL_EVENT_GAMEPAD_TOUCHPAD_UP: c_int = 1624;
pub const SDL_EVENT_GAMEPAD_SENSOR_UPDATE: c_int = 1625;
pub const SDL_EVENT_GAMEPAD_STEAM_HANDLE_UPDATED: c_int = 1627;
pub const SDL_EVENT_GAMEPAD_CAPSENSE_TOUCH: c_int = 1628;
pub const SDL_EVENT_GAMEPAD_CAPSENSE_RELEASE: c_int = 1629;
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
pub extern fn SDL_SetEventEnabled_REAL(@"type": Uint32, enabled: bool) void;
pub extern fn SDL_EventEnabled_REAL(@"type": Uint32) bool;
pub extern fn SDL_GetHint_REAL(name: [*c]const u8) [*c]const u8;
pub extern fn SDL_GetHintBoolean_REAL(name: [*c]const u8, default_value: bool) bool;
pub const SDL_HintCallback = ?*const fn (userdata: ?*anyopaque, name: [*c]const u8, oldValue: [*c]const u8, newValue: [*c]const u8) callconv(.c) void;
pub extern fn SDL_AddHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) bool;
pub extern fn SDL_RemoveHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) void;
pub const SDL_InitFlags = Uint32;
pub extern fn SDL_InitSubSystem_REAL(flags: SDL_InitFlags) bool;
pub extern fn SDL_QuitSubSystem_REAL(flags: SDL_InitFlags) void;
pub extern fn SDL_GetTicks_REAL() Uint64;
pub extern fn SDL_GetTicksNS_REAL() Uint64;
pub const SDL_OBJECT_TYPE_JOYSTICK: c_int = 4;
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
pub extern fn SDL_CreateDeviceName(vendor: Uint16, product: Uint16, vendor_name: [*c]const u8, product_name: [*c]const u8, default_name: [*c]const u8) [*c]u8;
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
pub const struct_SDL_SteamVirtualGamepadInfo = extern struct {
    handle: Uint64 = 0,
    name: [*c]u8 = null,
    vendor_id: Uint16 = 0,
    product_id: Uint16 = 0,
    type: SDL_GamepadType = @import("std").mem.zeroes(SDL_GamepadType),
};
pub const EMappingKind = c_uint;
pub const SDL_vidpid_list = extern struct {
    included_hint_name: [*c]const u8 = null,
    num_included_entries: c_int = 0,
    max_included_entries: c_int = 0,
    included_entries: [*c]Uint32 = null,
    excluded_hint_name: [*c]const u8 = null,
    num_excluded_entries: c_int = 0,
    max_excluded_entries: c_int = 0,
    excluded_entries: [*c]Uint32 = null,
    num_initial_entries: c_int = 0,
    initial_entries: [*c]Uint32 = null,
    initialized: bool = false,
};
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
pub extern fn SDL_HasWindows() bool;
pub extern var SDL_event_lock: ?*SDL_Mutex;
pub const SDL_JoystickDriver = struct_SDL_JoystickDriver;
pub extern var SDL_HIDAPI_JoystickDriver: SDL_JoystickDriver;
pub extern var SDL_LINUX_JoystickDriver: SDL_JoystickDriver;
pub extern var SDL_VIRTUAL_JoystickDriver: SDL_JoystickDriver;
pub extern fn SDL_GetStringBoolean(value: [*c]const u8, default_value: bool) bool;
pub extern fn SDL_InitGamepadMappings() bool;
pub extern fn SDL_QuitGamepadMappings() void;
pub extern fn SDL_PrivateGamepadAdded(instance_id: SDL_JoystickID) void;
pub extern fn SDL_PrivateGamepadRemoved(instance_id: SDL_JoystickID) void;
pub extern fn SDL_ShouldIgnoreGamepad(vendor_id: Uint16, product_id: Uint16, version: Uint16, name: [*c]const u8) bool;
pub extern fn SDL_GamepadHandleDelayedGuideButton(joystick: [*c]SDL_Joystick) void;
pub const SDL_SteamVirtualGamepadInfo = struct_SDL_SteamVirtualGamepadInfo;
pub extern fn SDL_InitSteamVirtualGamepadInfo() void;
pub extern fn SDL_SteamVirtualGamepadEnabled() bool;
pub extern fn SDL_UpdateSteamVirtualGamepadInfo() bool;
pub extern fn SDL_GetSteamVirtualGamepadInfo(slot: c_int) [*c]const SDL_SteamVirtualGamepadInfo;
pub extern fn SDL_QuitSteamVirtualGamepadInfo() void;
pub extern fn HIDAPI_GetJoystickTypeFromGUID(guid: SDL_GUID) SDL_JoystickType;
pub extern fn HIDAPI_GetGamepadTypeFromGUID(guid: SDL_GUID) SDL_GamepadType;
pub extern fn HIDAPI_UpdateDevices() void;
pub const k_eControllerType_UnknownSteamController: c_int = 1;
pub const k_eControllerType_SteamController: c_int = 2;
pub const k_eControllerType_SteamControllerV2: c_int = 3;
pub const k_eControllerType_SteamControllerNeptune: c_int = 4;
pub const k_eControllerType_SteamControllerTriton: c_int = 10;
pub const k_eControllerType_UnknownNonSteamController: c_int = 30;
pub const k_eControllerType_XBox360Controller: c_int = 31;
pub const k_eControllerType_XBoxOneController: c_int = 32;
pub const k_eControllerType_PS3Controller: c_int = 33;
pub const k_eControllerType_PS4Controller: c_int = 34;
pub const k_eControllerType_SwitchProController: c_int = 38;
pub const k_eControllerType_SwitchJoyConLeft: c_int = 39;
pub const k_eControllerType_SwitchJoyConRight: c_int = 40;
pub const k_eControllerType_SwitchInputOnlyController: c_int = 42;
pub const k_eControllerType_XInputSwitchController: c_int = 44;
pub const k_eControllerType_PS5Controller: c_int = 45;
pub const k_eControllerType_XBoxEliteController: c_int = 46;
pub const k_eControllerType_XInputPS4Controller: c_int = 47;
pub const k_eControllerType_PS5EdgeController: c_int = 48;
pub const k_eControllerType_HoriSteamController: c_int = 49;
pub const k_eControllerType_Switch2ProController: c_int = 51;
pub const k_eControllerType_Switch2InputOnlyController: c_int = 52;
pub const EControllerType = c_int;
pub extern fn GuessControllerType(nVID: c_int, nPID: c_int) EControllerType;
pub extern fn GuessControllerName(nVID: c_int, nPID: c_int) [*c]const u8;
pub extern fn SDL_JoystickAttachVirtualInner(desc: [*c]const SDL_VirtualJoystickDesc) SDL_JoystickID;
pub extern fn SDL_JoystickDetachVirtualInner(instance_id: SDL_JoystickID) bool;
pub extern fn SDL_SetJoystickVirtualAxisInner(joystick: [*c]SDL_Joystick, axis: c_int, value: Sint16) bool;
pub extern fn SDL_SetJoystickVirtualBallInner(joystick: [*c]SDL_Joystick, ball: c_int, xrel: Sint16, yrel: Sint16) bool;
pub extern fn SDL_SetJoystickVirtualButtonInner(joystick: [*c]SDL_Joystick, button: c_int, down: bool) bool;
pub extern fn SDL_SetJoystickVirtualHatInner(joystick: [*c]SDL_Joystick, hat: c_int, value: Uint8) bool;
pub extern fn SDL_SetJoystickVirtualTouchpadInner(joystick: [*c]SDL_Joystick, touchpad: c_int, finger: c_int, down: bool, x: f32, y: f32, pressure: f32) bool;
pub extern fn SDL_SendJoystickVirtualSensorDataInner(joystick: [*c]SDL_Joystick, @"type": SDL_SensorType, sensor_timestamp: Uint64, data: [*c]const f32, num_values: c_int) bool;
pub var SDL_joystick_drivers: [3][*c]SDL_JoystickDriver = [3][*c]SDL_JoystickDriver{
    &SDL_HIDAPI_JoystickDriver,
    &SDL_LINUX_JoystickDriver,
    &SDL_VIRTUAL_JoystickDriver,
};
pub var SDL_joysticks_locked: c_int = 0;
pub var SDL_joysticks_initialized: bool = false;
pub var SDL_joysticks_quitting: bool = false;
pub var SDL_joystick_being_added: bool = false;
pub var SDL_joysticks: [*c]SDL_Joystick = null;
pub var SDL_joystick_player_count: c_int = 0;
pub var SDL_joystick_players: [*c]SDL_JoystickID = null;
pub var SDL_joystick_names: ?*SDL_HashTable = null;
pub var SDL_joystick_allows_background_events: bool = @"false" != 0;
pub var initial_old_xboxone_controllers: [157]Uint32 = [157]Uint32{
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 0)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 26246)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 121)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 6305)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 121)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 6338)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 121)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 6344)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 121)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 6351)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1008)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1173)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 721)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 733)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 736)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 739)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 746)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 765)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 767)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 2151)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 2816)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 2821)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 2826)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 2828)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 2848)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 2849)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 2850)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1133)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 0)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1133)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 4100)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1133)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 4103)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1133)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 4104)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1133)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 62209)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1848)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 672)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1848)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 18945)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1848)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 29283)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1848)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 46904)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1848)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 52009)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1848)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 62465)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3090)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 3607)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3090)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 3612)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3090)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 3618)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3090)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 3632)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3426)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 39450)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3426)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 39451)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3584)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 3584)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 298)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 313)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 315)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 314)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 325)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 326)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 338)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 347)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 348)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 349)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 351)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 352)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 353)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 354)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 355)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 356)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 357)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 358)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 359)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 517)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 518)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 582)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 609)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 610)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 672)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 673)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 674)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 675)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 676)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 677)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 678)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 679)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 680)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 681)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 682)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 683)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 684)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 685)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 686)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 687)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 688)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 689)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 690)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 691)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 693)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 694)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 696)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 701)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 702)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 703)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 704)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 705)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 706)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 707)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 708)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 709)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 710)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 711)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 712)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 713)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 714)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 715)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 717)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 718)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 719)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 725)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 838)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1094)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 62721)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 99)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 103)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 120)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 151)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 186)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 192)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 197)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 216)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 237)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 4095)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 673)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 4779)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 772)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 5168)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 657)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 5168)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 681)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 5168)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1803)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 5168)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1817)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 5227)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1553)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 5426)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 2560)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 5426)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 2563)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 5426)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 2580)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 5426)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 2581)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 5840)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 3903)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 654)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 672)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 21760)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8363)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 21999)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 9414)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 21530)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 9414)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 21546)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 9414)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 21562)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 9414)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 21769)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 9414)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 21786)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 9414)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 22042)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 9414)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 22554)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 9414)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 22810)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 9414)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 22826)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 9414)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 31002)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 9494)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 105)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 9649)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 864)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 11298)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 8707)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 11812)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1618)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 11812)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 5656)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 11812)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 5768)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 12068)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 17)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 12068)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 46)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 12068)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 80)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 12068)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 83)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 12068)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 143)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 12068)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 145)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 12068)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 183)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 53970)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 53970)))),
};
pub var old_xboxone_controllers: SDL_vidpid_list = SDL_vidpid_list{
    .included_hint_name = "SDL_JOYSTICK_OLD_XBOXONE_CONTROLLERS",
    .num_included_entries = 0,
    .max_included_entries = 0,
    .included_entries = null,
    .excluded_hint_name = "SDL_JOYSTICK_OLD_XBOXONE_CONTROLLERS_EXCLUDED",
    .num_excluded_entries = 0,
    .max_excluded_entries = 0,
    .excluded_entries = null,
    .num_initial_entries = @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(initial_old_xboxone_controllers)) / @sizeOf(@TypeOf(initial_old_xboxone_controllers[@as(c_int, 0)]))))),
    .initial_entries = @ptrCast(@alignCast(&initial_old_xboxone_controllers)),
    .initialized = @"false" != 0,
};
pub var initial_arcadestick_devices: [32]Uint32 = [32]Uint32{
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 121)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 6170)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 121)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 6171)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3090)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 3830)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 265)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 22)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 27)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 99)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 106)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 120)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 138)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 140)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 170)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 237)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 284)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 286)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 388)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 5227)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1540)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 5426)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 2560)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 61501)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 62722)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 62724)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 62726)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8406)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 42773)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 9414)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 20480)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 9414)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 21761)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 9414)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 21774)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 11298)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 8960)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 11298)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 8962)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 11298)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 8963)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 11298)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 9472)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 11298)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 9474)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 11298)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 9475)))),
};
pub var arcadestick_devices: SDL_vidpid_list = SDL_vidpid_list{
    .included_hint_name = "SDL_JOYSTICK_ARCADESTICK_DEVICES",
    .num_included_entries = 0,
    .max_included_entries = 0,
    .included_entries = null,
    .excluded_hint_name = "SDL_JOYSTICK_ARCADESTICK_DEVICES_EXCLUDED",
    .num_excluded_entries = 0,
    .max_excluded_entries = 0,
    .excluded_entries = null,
    .num_initial_entries = @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(initial_arcadestick_devices)) / @sizeOf(@TypeOf(initial_arcadestick_devices[@as(c_int, 0)]))))),
    .initial_entries = @ptrCast(@alignCast(&initial_arcadestick_devices)),
    .initialized = @"false" != 0,
};
pub var initial_blacklist_devices: [70]Uint32 = [70]Uint32{
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 157)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 176)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 180)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1840)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1861)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1864)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1872)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1896)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1907)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1957)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1970)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 2048)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1133)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 49930)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1241)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 41183)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1386)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 16)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1386)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 17)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1386)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 18)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1386)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 19)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1386)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 20)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1386)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 21)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1386)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 22)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1386)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 23)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1386)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 24)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1386)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 25)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1386)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 209)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1386)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 782)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 2522)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1359)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 2522)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 5136)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 2522)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 12355)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 2522)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 12725)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 2522)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 14743)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 2522)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 16267)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 2522)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 20980)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 2522)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 21897)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 2522)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 31522)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 2522)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 32557)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 2522)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 32912)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 2522)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 36915)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 2522)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 36966)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 2522)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 37008)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 2522)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 37056)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 2522)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 61458)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 2522)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 62250)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 2522)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 62995)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 2522)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 63012)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 6940)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 6972)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 7511)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 44291)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 7805)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 11850)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8352)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 16941)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 9494)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 31)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 9494)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 40)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1241)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 32776)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1241)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 32777)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1241)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 41618)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1241)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 41619)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1266)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 41276)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 394)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 5426)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 614)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 5426)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 642)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8406)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 2)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 9580)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 109)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 9580)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 110)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 9934)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 418)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 12951)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 6505)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 13364)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 289)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 13364)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 355)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 13364)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 529)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 13364)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 672)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 13364)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 851)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 13364)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 53296)))),
};
pub var blacklist_devices: SDL_vidpid_list = SDL_vidpid_list{
    .included_hint_name = "SDL_JOYSTICK_BLACKLIST_DEVICES",
    .num_included_entries = 0,
    .max_included_entries = 0,
    .included_entries = null,
    .excluded_hint_name = "SDL_JOYSTICK_BLACKLIST_DEVICES_EXCLUDED",
    .num_excluded_entries = 0,
    .max_excluded_entries = 0,
    .excluded_entries = null,
    .num_initial_entries = @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(initial_blacklist_devices)) / @sizeOf(@TypeOf(initial_blacklist_devices[@as(c_int, 0)]))))),
    .initial_entries = @ptrCast(@alignCast(&initial_blacklist_devices)),
    .initialized = @"false" != 0,
};
pub var initial_flightstick_devices: [20]Uint32 = [20]Uint32{
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1103)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1026)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1103)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 45322)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1133)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 49685)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1411)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 25176)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1411)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 26767)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1411)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 28784)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1411)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 40985)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1411)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 41265)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1411)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 41481)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1411)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 45072)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1411)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 45074)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1411)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 45075)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1848)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 8737)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 4341)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 28804)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8989)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 294)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8989)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 295)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8989)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 512)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 13124)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 17297)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 13124)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 33680)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 13868)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1)))),
};
pub var flightstick_devices: SDL_vidpid_list = SDL_vidpid_list{
    .included_hint_name = "SDL_JOYSTICK_FLIGHTSTICK_DEVICES",
    .num_included_entries = 0,
    .max_included_entries = 0,
    .included_entries = null,
    .excluded_hint_name = "SDL_JOYSTICK_FLIGHTSTICK_DEVICES_EXCLUDED",
    .num_excluded_entries = 0,
    .max_excluded_entries = 0,
    .excluded_entries = null,
    .num_initial_entries = @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(initial_flightstick_devices)) / @sizeOf(@TypeOf(initial_flightstick_devices[@as(c_int, 0)]))))),
    .initial_entries = @ptrCast(@alignCast(&initial_flightstick_devices)),
    .initialized = @"false" != 0,
};
pub var initial_gamecube_devices: [10]Uint32 = [10]Uint32{
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 121)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 6211)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 121)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 6212)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 121)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 6214)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1406)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 823)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1406)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 8307)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1507)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1665)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 2342)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 34952)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 389)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 6708)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 63237)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8406)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 42769)))),
};
pub var gamecube_devices: SDL_vidpid_list = SDL_vidpid_list{
    .included_hint_name = "SDL_JOYSTICK_GAMECUBE_DEVICES",
    .num_included_entries = 0,
    .max_included_entries = 0,
    .included_entries = null,
    .excluded_hint_name = "SDL_JOYSTICK_GAMECUBE_DEVICES_EXCLUDED",
    .num_excluded_entries = 0,
    .max_excluded_entries = 0,
    .excluded_entries = null,
    .num_initial_entries = @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(initial_gamecube_devices)) / @sizeOf(@TypeOf(initial_gamecube_devices[@as(c_int, 0)]))))),
    .initial_entries = @ptrCast(@alignCast(&initial_gamecube_devices)),
    .initialized = @"false" != 0,
};
pub var initial_rog_gamepad_mice: [7]Uint32 = [7]Uint32{
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 2821)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 6371)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 2821)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 6373)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 2821)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 6406)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 2821)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 6488)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 2821)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 6680)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 2821)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 6682)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 2821)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 6684)))),
};
pub var rog_gamepad_mice: SDL_vidpid_list = SDL_vidpid_list{
    .included_hint_name = "SDL_ROG_GAMEPAD_MICE",
    .num_included_entries = 0,
    .max_included_entries = 0,
    .included_entries = null,
    .excluded_hint_name = "SDL_ROG_GAMEPAD_MICE_EXCLUDED",
    .num_excluded_entries = 0,
    .max_excluded_entries = 0,
    .excluded_entries = null,
    .num_initial_entries = @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(initial_rog_gamepad_mice)) / @sizeOf(@TypeOf(initial_rog_gamepad_mice[@as(c_int, 0)]))))),
    .initial_entries = @ptrCast(@alignCast(&initial_rog_gamepad_mice)),
    .initialized = @"false" != 0,
};
pub var initial_throttle_devices: [4]Uint32 = [4]Uint32{
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1103)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1028)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1848)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 41505)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 4341)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 28805)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 13124)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 406)))),
};
pub var throttle_devices: SDL_vidpid_list = SDL_vidpid_list{
    .included_hint_name = "SDL_JOYSTICK_THROTTLE_DEVICES",
    .num_included_entries = 0,
    .max_included_entries = 0,
    .included_entries = null,
    .excluded_hint_name = "SDL_JOYSTICK_THROTTLE_DEVICES_EXCLUDED",
    .num_excluded_entries = 0,
    .max_excluded_entries = 0,
    .excluded_entries = null,
    .num_initial_entries = @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(initial_throttle_devices)) / @sizeOf(@TypeOf(initial_throttle_devices[@as(c_int, 0)]))))),
    .initial_entries = @ptrCast(@alignCast(&initial_throttle_devices)),
    .initialized = @"false" != 0,
};
pub var initial_wheel_devices: [71]Uint32 = [71]Uint32{
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 121)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 6244)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1103)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 46685)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1103)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 46686)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1103)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 46692)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1103)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 46697)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1103)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 46701)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1103)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 46701)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1103)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 46702)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1103)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 46703)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1103)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 46711)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1103)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 46719)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1103)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 46737)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1103)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 46738)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1103)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 46742)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1133)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 49743)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1133)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 49760)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1133)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 49761)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1133)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 49762)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1133)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 49766)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1133)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 49767)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1133)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 49768)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1133)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 49769)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1133)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 49773)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1133)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 49774)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1133)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 49778)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1133)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 49812)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1133)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 49813)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1133)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 49816)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1133)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 49817)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1133)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 49818)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1133)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 49819)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1133)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 51715)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 674)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1155)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1314)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1155)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 41813)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1411)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 41266)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1411)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 41267)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1411)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 41474)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1411)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 45058)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1411)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 45061)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1411)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 45064)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1411)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 45065)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1411)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 45080)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3767)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3767)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 4)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3767)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 5)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3767)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 6)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3767)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 7)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3767)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 17)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3767)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 32)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3767)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 407)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3767)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 910)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3767)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 3587)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 4607)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1297)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 4617)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 65456)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 5840)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 3418)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 5840)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 3423)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 5840)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 3424)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 5840)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 3425)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 9267)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 62208)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 9267)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 62209)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 9267)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 62211)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 9267)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 62214)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 13334)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 769)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 13334)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 770)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 13422)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 0)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 13422)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 2)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 13422)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 4)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 13422)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 5)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 13422)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 6)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 14054)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 16399)))),
};
pub var wheel_devices: SDL_vidpid_list = SDL_vidpid_list{
    .included_hint_name = "SDL_JOYSTICK_WHEEL_DEVICES",
    .num_included_entries = 0,
    .max_included_entries = 0,
    .included_entries = null,
    .excluded_hint_name = "SDL_JOYSTICK_WHEEL_DEVICES_EXCLUDED",
    .num_excluded_entries = 0,
    .max_excluded_entries = 0,
    .excluded_entries = null,
    .num_initial_entries = @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(initial_wheel_devices)) / @sizeOf(@TypeOf(initial_wheel_devices[@as(c_int, 0)]))))),
    .initial_entries = @ptrCast(@alignCast(&initial_wheel_devices)),
    .initialized = @"false" != 0,
};
pub var initial_guitar_devices: [20]Uint32 = [20]Uint32{
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 4794)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 256)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 4794)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 512)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 4794)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1867)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 4)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 12304)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 849)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 4096)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 849)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 8192)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1848)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 678)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1848)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 683)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1848)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 38918)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 5168)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 679)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 5168)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1797)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 5168)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1803)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 5168)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 18228)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 5168)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 18248)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 678)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 683)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8296)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 13905)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 4096)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 13905)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 24576)))),
};
pub var guitar_devices: SDL_vidpid_list = SDL_vidpid_list{
    .included_hint_name = "SDL_JOYSTICK_GUITAR_DEVICES",
    .num_included_entries = 0,
    .max_included_entries = 0,
    .included_entries = null,
    .excluded_hint_name = null,
    .num_excluded_entries = 0,
    .max_excluded_entries = 0,
    .excluded_entries = null,
    .num_initial_entries = @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(initial_guitar_devices)) / @sizeOf(@TypeOf(initial_guitar_devices[@as(c_int, 0)]))))),
    .initial_entries = @ptrCast(@alignCast(&initial_guitar_devices)),
    .initialized = @"false" != 0,
};
pub var initial_drum_devices: [11]Uint32 = [11]Uint32{
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 4794)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 288)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 4794)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 528)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 4794)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 536)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 5)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 12560)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 12600)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 5168)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 680)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 5168)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 2053)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 3)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 304)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8296)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 2)))),
};
pub var drum_devices: SDL_vidpid_list = SDL_vidpid_list{
    .included_hint_name = "SDL_JOYSTICK_DRUM_DEVICES",
    .num_included_entries = 0,
    .max_included_entries = 0,
    .included_entries = null,
    .excluded_hint_name = null,
    .num_excluded_entries = 0,
    .max_excluded_entries = 0,
    .excluded_entries = null,
    .num_initial_entries = @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(initial_drum_devices)) / @sizeOf(@TypeOf(initial_drum_devices[@as(c_int, 0)]))))),
    .initial_entries = @ptrCast(@alignCast(&initial_drum_devices)),
    .initialized = @"false" != 0,
};
pub var initial_zero_centered_devices: [2]Uint32 = [2]Uint32{
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1440)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 12850)))),
    (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 3727)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 12307)))),
};
pub var zero_centered_devices: SDL_vidpid_list = SDL_vidpid_list{
    .included_hint_name = "SDL_JOYSTICK_ZERO_CENTERED_DEVICES",
    .num_included_entries = 0,
    .max_included_entries = 0,
    .included_entries = null,
    .excluded_hint_name = null,
    .num_excluded_entries = 0,
    .max_excluded_entries = 0,
    .excluded_entries = null,
    .num_initial_entries = @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(initial_zero_centered_devices)) / @sizeOf(@TypeOf(initial_zero_centered_devices[@as(c_int, 0)]))))),
    .initial_entries = @ptrCast(@alignCast(&initial_zero_centered_devices)),
    .initialized = @"false" != 0,
};
pub export fn SDL_JoysticksInitialized() bool {
    @setEvalBranchQuota(100000);
    return SDL_joysticks_initialized;
}
pub export fn SDL_JoysticksQuitting() bool {
    @setEvalBranchQuota(100000);
    return SDL_joysticks_quitting;
}
pub export fn SDL_LockJoysticks_REAL() void {
    @setEvalBranchQuota(100000);
    SDL_LockMutex_REAL(SDL_event_lock);
    SDL_joysticks_locked += 1;
}
pub export fn SDL_TryLockJoysticks_REAL() bool {
    @setEvalBranchQuota(100000);
    if (SDL_TryLockMutex_REAL(SDL_event_lock)) {
        SDL_joysticks_locked += 1;
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub export fn SDL_UnlockJoysticks_REAL() void {
    @setEvalBranchQuota(100000);
    SDL_joysticks_locked -= 1;
    SDL_UnlockMutex_REAL(SDL_event_lock);
}
pub export fn SDL_JoysticksLocked() bool {
    @setEvalBranchQuota(100000);
    return SDL_joysticks_locked > @as(c_int, 0);
}
pub export fn SDL_AssertJoysticksLocked() void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [25:0]u8 = "SDL_AssertJoysticksLocked".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!SDL_JoysticksLocked()) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "SDL_JoysticksLocked()",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_joystick.c", 733);
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
pub fn SDL_GetDriverAndJoystickIndex(instance_id: SDL_JoystickID, driver: [*c][*c]SDL_JoystickDriver, driver_index: [*c]c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var num_joysticks: c_int = undefined;
    _ = &num_joysticks;
    var device_index: c_int = undefined;
    _ = &device_index;
    SDL_AssertJoysticksLocked();
    if (instance_id > @as(SDL_JoystickID, 0)) {
        {
            i = 0;
            while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(SDL_joystick_drivers)) / @sizeOf(@TypeOf(SDL_joystick_drivers[@as(c_int, 0)])))) : (i += 1) {
                num_joysticks = SDL_joystick_drivers[@bitCast(@as(isize, @intCast(i)))].*.GetCount.?();
                {
                    device_index = 0;
                    while (device_index < num_joysticks) : (device_index += 1) {
                        var joystick_id: SDL_JoystickID = SDL_joystick_drivers[@bitCast(@as(isize, @intCast(i)))].*.GetDeviceInstanceID.?(device_index);
                        _ = &joystick_id;
                        if (joystick_id == instance_id) {
                            driver.* = SDL_joystick_drivers[@bitCast(@as(isize, @intCast(i)))];
                            driver_index.* = device_index;
                            return @"true" != 0;
                        }
                    }
                }
            }
        }
    }
    _ = SDL_SetError_REAL("Joystick %u not found", instance_id);
    return @"false" != 0;
}
pub fn SDL_FindFreePlayerIndex() callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var player_index: c_int = undefined;
    _ = &player_index;
    SDL_AssertJoysticksLocked();
    {
        player_index = 0;
        while (player_index < SDL_joystick_player_count) : (player_index += 1) {
            if (SDL_joystick_players[@bitCast(@as(isize, @intCast(player_index)))] == @as(SDL_JoystickID, 0)) {
                break;
            }
        }
    }
    return player_index;
}
pub fn SDL_GetPlayerIndexForJoystickID(instance_id: SDL_JoystickID) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var player_index: c_int = undefined;
    _ = &player_index;
    SDL_AssertJoysticksLocked();
    {
        player_index = 0;
        while (player_index < SDL_joystick_player_count) : (player_index += 1) {
            if (instance_id == SDL_joystick_players[@bitCast(@as(isize, @intCast(player_index)))]) {
                break;
            }
        }
    }
    if (player_index == SDL_joystick_player_count) {
        player_index = -@as(c_int, 1);
    }
    return player_index;
}
pub fn SDL_GetJoystickIDForPlayerIndex(arg_player_index: c_int) callconv(.c) SDL_JoystickID {
    @setEvalBranchQuota(100000);
    var player_index = arg_player_index;
    _ = &player_index;
    SDL_AssertJoysticksLocked();
    if ((player_index < @as(c_int, 0)) or (player_index >= SDL_joystick_player_count)) {
        return 0;
    }
    return SDL_joystick_players[@bitCast(@as(isize, @intCast(player_index)))];
}
pub fn SDL_SetJoystickIDForPlayerIndex(arg_player_index: c_int, instance_id: SDL_JoystickID) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var player_index = arg_player_index;
    _ = &player_index;
    var existing_instance: SDL_JoystickID = SDL_GetJoystickIDForPlayerIndex(player_index);
    _ = &existing_instance;
    var driver: [*c]SDL_JoystickDriver = undefined;
    _ = &driver;
    var device_index: c_int = undefined;
    _ = &device_index;
    var existing_player_index: c_int = undefined;
    _ = &existing_player_index;
    SDL_AssertJoysticksLocked();
    if (player_index >= SDL_joystick_player_count) {
        var new_players: [*c]SDL_JoystickID = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(SDL_joystick_players)), @as(c_ulong, @bitCast(@as(c_long, player_index + @as(c_int, 1)))) *% @sizeOf(@TypeOf(SDL_joystick_players.*)))));
        _ = &new_players;
        if (!(new_players != null)) {
            return @"false" != 0;
        }
        SDL_joystick_players = new_players;
        _ = memset(@ptrCast(@alignCast(&SDL_joystick_players[@bitCast(@as(isize, @intCast(SDL_joystick_player_count)))])), 0, @as(c_ulong, @bitCast(@as(c_long, (player_index - SDL_joystick_player_count) + @as(c_int, 1)))) *% @sizeOf(@TypeOf(SDL_joystick_players[@as(c_int, 0)])));
        SDL_joystick_player_count = player_index + @as(c_int, 1);
    } else if ((player_index >= @as(c_int, 0)) and (SDL_joystick_players[@bitCast(@as(isize, @intCast(player_index)))] == instance_id)) {
        return @"true" != 0;
    }
    existing_player_index = SDL_GetPlayerIndexForJoystickID(instance_id);
    if (existing_player_index >= @as(c_int, 0)) {
        SDL_joystick_players[@bitCast(@as(isize, @intCast(existing_player_index)))] = 0;
    }
    if (player_index >= @as(c_int, 0)) {
        SDL_joystick_players[@bitCast(@as(isize, @intCast(player_index)))] = instance_id;
    }
    if (SDL_GetDriverAndJoystickIndex(instance_id, &driver, &device_index)) {
        driver.*.SetDevicePlayerIndex.?(device_index, player_index);
    }
    if (existing_instance > @as(SDL_JoystickID, 0)) {
        _ = SDL_SetJoystickIDForPlayerIndex(SDL_FindFreePlayerIndex(), existing_instance);
    }
    return @"true" != 0;
}
pub fn SDL_JoystickAllowBackgroundEventsChanged(_: ?*anyopaque, _: [*c]const u8, _: [*c]const u8, hint: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (SDL_GetStringBoolean(hint, @"false" != 0)) {
        SDL_joystick_allows_background_events = @"true" != 0;
    } else {
        SDL_joystick_allows_background_events = @"false" != 0;
    }
}
pub export fn SDL_InitJoysticks() bool {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var result: bool = @"false" != 0;
    _ = &result;
    if (!SDL_InitSubSystem_REAL(SDL_INIT_EVENTS)) {
        return @"false" != 0;
    }
    SDL_LockJoysticks_REAL();
    SDL_joysticks_initialized = @"true" != 0;
    SDL_joystick_names = SDL_CreateHashTable(0, @"false" != 0, SDL_HashID, SDL_KeyMatchID, SDL_DestroyHashValue, null);
    SDL_LoadVIDPIDList(&old_xboxone_controllers);
    SDL_LoadVIDPIDList(&arcadestick_devices);
    SDL_LoadVIDPIDList(&blacklist_devices);
    SDL_LoadVIDPIDList(&drum_devices);
    SDL_LoadVIDPIDList(&flightstick_devices);
    SDL_LoadVIDPIDList(&gamecube_devices);
    SDL_LoadVIDPIDList(&guitar_devices);
    SDL_LoadVIDPIDList(&rog_gamepad_mice);
    SDL_LoadVIDPIDList(&throttle_devices);
    SDL_LoadVIDPIDList(&wheel_devices);
    SDL_LoadVIDPIDList(&zero_centered_devices);
    _ = SDL_InitGamepadMappings();
    _ = SDL_AddHintCallback_REAL("SDL_JOYSTICK_ALLOW_BACKGROUND_EVENTS", SDL_JoystickAllowBackgroundEventsChanged, null);
    SDL_InitSteamVirtualGamepadInfo();
    {
        i = 0;
        while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(SDL_joystick_drivers)) / @sizeOf(@TypeOf(SDL_joystick_drivers[@as(c_int, 0)])))) : (i += 1) {
            if (SDL_joystick_drivers[@bitCast(@as(isize, @intCast(i)))].*.Init.?()) {
                result = @"true" != 0;
            }
        }
    }
    SDL_UnlockJoysticks_REAL();
    if (!result) {
        SDL_QuitJoysticks();
    }
    return result;
}
pub export fn SDL_JoysticksOpened() bool {
    @setEvalBranchQuota(100000);
    var opened: bool = undefined;
    _ = &opened;
    SDL_LockJoysticks_REAL();
    {
        if (@as(?*anyopaque, @ptrCast(@alignCast(SDL_joysticks))) != @as(?*anyopaque, null)) {
            opened = @"true" != 0;
        } else {
            opened = @"false" != 0;
        }
    }
    SDL_UnlockJoysticks_REAL();
    return opened;
}
pub export fn SDL_JoystickHandledByAnotherDriver(driver: [*c]struct_SDL_JoystickDriver, vendor_id: Uint16, product_id: Uint16, version: Uint16, name: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var result: bool = @"false" != 0;
    _ = &result;
    SDL_LockJoysticks_REAL();
    {
        {
            i = 0;
            while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(SDL_joystick_drivers)) / @sizeOf(@TypeOf(SDL_joystick_drivers[@as(c_int, 0)])))) : (i += 1) {
                if (driver == SDL_joystick_drivers[@bitCast(@as(isize, @intCast(i)))]) {
                    break;
                }
                if (SDL_joystick_drivers[@bitCast(@as(isize, @intCast(i)))].*.IsDevicePresent.?(vendor_id, product_id, version, name)) {
                    result = @"true" != 0;
                    break;
                }
            }
        }
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_HasJoystick_REAL() bool {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var total_joysticks: c_int = 0;
    _ = &total_joysticks;
    SDL_LockJoysticks_REAL();
    {
        {
            i = 0;
            while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(SDL_joystick_drivers)) / @sizeOf(@TypeOf(SDL_joystick_drivers[@as(c_int, 0)])))) : (i += 1) {
                total_joysticks += SDL_joystick_drivers[@bitCast(@as(isize, @intCast(i)))].*.GetCount.?();
            }
        }
    }
    SDL_UnlockJoysticks_REAL();
    if (total_joysticks > @as(c_int, 0)) {
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub export fn SDL_GetJoysticks_REAL(count: [*c]c_int) [*c]SDL_JoystickID {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [21:0]u8 = "SDL_GetJoysticks_REAL".*;
    };
    _ = &static_local___func__;
    var i: c_int = undefined;
    _ = &i;
    var num_joysticks: c_int = undefined;
    _ = &num_joysticks;
    var device_index: c_int = undefined;
    _ = &device_index;
    var joystick_index: c_int = 0;
    _ = &joystick_index;
    var total_joysticks: c_int = 0;
    _ = &total_joysticks;
    var joysticks: [*c]SDL_JoystickID = undefined;
    _ = &joysticks;
    SDL_LockJoysticks_REAL();
    {
        {
            i = 0;
            while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(SDL_joystick_drivers)) / @sizeOf(@TypeOf(SDL_joystick_drivers[@as(c_int, 0)])))) : (i += 1) {
                total_joysticks += SDL_joystick_drivers[@bitCast(@as(isize, @intCast(i)))].*.GetCount.?();
            }
        }
        joysticks = @ptrCast(@alignCast(SDL_malloc_REAL(@as(c_ulong, @bitCast(@as(c_long, total_joysticks + @as(c_int, 1)))) *% @sizeOf(@TypeOf(joysticks.*)))));
        if (joysticks != null) {
            if (count != null) {
                count.* = total_joysticks;
            }
            {
                i = 0;
                while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(SDL_joystick_drivers)) / @sizeOf(@TypeOf(SDL_joystick_drivers[@as(c_int, 0)])))) : (i += 1) {
                    num_joysticks = SDL_joystick_drivers[@bitCast(@as(isize, @intCast(i)))].*.GetCount.?();
                    {
                        device_index = 0;
                        while (device_index < num_joysticks) : (device_index += 1) {
                            while (true) {
                                while (!(joystick_index < total_joysticks)) {
                                    const static_local_sdl_assert_data = struct {
                                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                            .always_ignore = @"false" != 0,
                                            .trigger_count = 0,
                                            .condition = "joystick_index < total_joysticks",
                                            .filename = null,
                                            .linenum = 0,
                                            .function = null,
                                            .next = null,
                                        };
                                    };
                                    _ = &static_local_sdl_assert_data;
                                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_joystick.c", 988);
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
                            joysticks[@bitCast(@as(isize, @intCast(joystick_index)))] = SDL_joystick_drivers[@bitCast(@as(isize, @intCast(i)))].*.GetDeviceInstanceID.?(device_index);
                            while (true) {
                                while (!(joysticks[@bitCast(@as(isize, @intCast(joystick_index)))] > @as(SDL_JoystickID, 0))) {
                                    const static_local_sdl_assert_data = struct {
                                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                            .always_ignore = @"false" != 0,
                                            .trigger_count = 0,
                                            .condition = "joysticks[joystick_index] > 0",
                                            .filename = null,
                                            .linenum = 0,
                                            .function = null,
                                            .next = null,
                                        };
                                    };
                                    _ = &static_local_sdl_assert_data;
                                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_joystick.c", 990);
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
                            joystick_index += 1;
                        }
                    }
                }
            }
            while (true) {
                while (!(joystick_index == total_joysticks)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "joystick_index == total_joysticks",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_joystick.c", 994);
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
            joysticks[@bitCast(@as(isize, @intCast(joystick_index)))] = 0;
        } else {
            if (count != null) {
                count.* = 0;
            }
        }
    }
    SDL_UnlockJoysticks_REAL();
    return joysticks;
}
pub export fn SDL_GetJoystickVirtualGamepadInfoForID(instance_id: SDL_JoystickID) [*c]const SDL_SteamVirtualGamepadInfo {
    @setEvalBranchQuota(100000);
    var driver: [*c]SDL_JoystickDriver = undefined;
    _ = &driver;
    var device_index: c_int = undefined;
    _ = &device_index;
    var info: [*c]const SDL_SteamVirtualGamepadInfo = null;
    _ = &info;
    if (SDL_SteamVirtualGamepadEnabled() and SDL_GetDriverAndJoystickIndex(instance_id, &driver, &device_index)) {
        info = SDL_GetSteamVirtualGamepadInfo(driver.*.GetDeviceSteamVirtualGamepadSlot.?(device_index));
    }
    return info;
}
pub fn SDL_UpdateJoystickNameForID(instance_id: SDL_JoystickID) callconv(.c) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var driver: [*c]SDL_JoystickDriver = undefined;
    _ = &driver;
    var device_index: c_int = undefined;
    _ = &device_index;
    var current_name: [*c]const u8 = null;
    _ = &current_name;
    var info: [*c]const SDL_SteamVirtualGamepadInfo = undefined;
    _ = &info;
    SDL_AssertJoysticksLocked();
    info = SDL_GetJoystickVirtualGamepadInfoForID(instance_id);
    if (info != null) {
        current_name = info.*.name;
    } else if (SDL_GetDriverAndJoystickIndex(instance_id, &driver, &device_index)) {
        current_name = driver.*.GetDeviceName.?(device_index);
    }
    if (!(SDL_joystick_names != null)) {
        return SDL_GetPersistentString(current_name);
    }
    var name: [*c]u8 = null;
    _ = &name;
    var found: bool = SDL_FindInHashTable(SDL_joystick_names, @ptrFromInt(@as(usize, instance_id)), @ptrCast(@alignCast(&name)));
    _ = &found;
    if (!(current_name != null)) {
        if (!found) {
            _ = SDL_SetError_REAL("Joystick %u not found", instance_id);
            return null;
        }
        if (!(name != null)) {
            _ = SDL_OutOfMemory_REAL();
            return null;
        }
        return name;
    }
    if (!(name != null) or (SDL_strcmp_REAL(name, current_name) != @as(c_int, 0))) {
        name = SDL_strdup_REAL(current_name);
        _ = SDL_InsertIntoHashTable(SDL_joystick_names, @ptrFromInt(@as(usize, instance_id)), @ptrCast(@alignCast(name)), @"true" != 0);
    }
    return name;
}
pub export fn SDL_GetJoystickNameForID_REAL(instance_id: SDL_JoystickID) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var name: [*c]const u8 = undefined;
    _ = &name;
    SDL_LockJoysticks_REAL();
    name = SDL_UpdateJoystickNameForID(instance_id);
    SDL_UnlockJoysticks_REAL();
    return name;
}
pub export fn SDL_GetJoystickPathForID_REAL(instance_id: SDL_JoystickID) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var driver: [*c]SDL_JoystickDriver = undefined;
    _ = &driver;
    var device_index: c_int = undefined;
    _ = &device_index;
    var path: [*c]const u8 = null;
    _ = &path;
    SDL_LockJoysticks_REAL();
    if (SDL_GetDriverAndJoystickIndex(instance_id, &driver, &device_index)) {
        path = SDL_GetPersistentString(driver.*.GetDevicePath.?(device_index));
    }
    SDL_UnlockJoysticks_REAL();
    if (!(path != null)) {
        _ = SDL_SetError_REAL("That operation is not supported");
    }
    return path;
}
pub export fn SDL_GetJoystickPlayerIndexForID_REAL(instance_id: SDL_JoystickID) c_int {
    @setEvalBranchQuota(100000);
    var player_index: c_int = undefined;
    _ = &player_index;
    SDL_LockJoysticks_REAL();
    player_index = SDL_GetPlayerIndexForJoystickID(instance_id);
    SDL_UnlockJoysticks_REAL();
    return player_index;
}
pub fn SDL_JoystickAxesCenteredAtZero(joystick: [*c]SDL_Joystick) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    SDL_AssertJoysticksLocked();
    if (joystick.*.naxes == @as(c_int, 2)) {
        return @"true" != 0;
    }
    return SDL_VIDPIDInList(SDL_GetJoystickVendor_REAL(joystick), SDL_GetJoystickProduct_REAL(joystick), &zero_centered_devices);
}
pub fn IsROGAlly(joystick: [*c]SDL_Joystick) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var vendor: Uint16 = undefined;
    _ = &vendor;
    var product: Uint16 = undefined;
    _ = &product;
    var guid: SDL_GUID = SDL_GetJoystickGUID_REAL(joystick);
    _ = &guid;
    SDL_GetJoystickGUIDInfo_REAL(guid, &vendor, &product, null, null);
    if ((@as(c_int, vendor) == USB_VENDOR_MICROSOFT) and (@as(c_int, product) == USB_PRODUCT_XBOX360_WIRED_CONTROLLER)) {
        var has_ally_accel: bool = @"false" != 0;
        _ = &has_ally_accel;
        var has_ally_gyro: bool = @"false" != 0;
        _ = &has_ally_gyro;
        if (SDL_InitSubSystem_REAL(SDL_INIT_SENSOR)) {
            var sensors: [*c]SDL_SensorID = SDL_GetSensors_REAL(null);
            _ = &sensors;
            if (sensors != null) {
                var i: c_int = undefined;
                _ = &i;
                {
                    i = 0;
                    while (sensors[@bitCast(@as(isize, @intCast(i)))] != 0) : (i += 1) {
                        var sensor: SDL_SensorID = sensors[@bitCast(@as(isize, @intCast(i)))];
                        _ = &sensor;
                        if (!has_ally_accel and (SDL_GetSensorTypeForID_REAL(sensor) == SDL_SENSOR_ACCEL)) {
                            var sensor_name: [*c]const u8 = SDL_GetSensorNameForID_REAL(sensor);
                            _ = &sensor_name;
                            if ((sensor_name != null) and (SDL_strcmp_REAL(sensor_name, "Sensor BMI320 Acc") == @as(c_int, 0))) {
                                has_ally_accel = @"true" != 0;
                            }
                        }
                        if (!has_ally_gyro and (SDL_GetSensorTypeForID_REAL(sensor) == SDL_SENSOR_GYRO)) {
                            var sensor_name: [*c]const u8 = SDL_GetSensorNameForID_REAL(sensor);
                            _ = &sensor_name;
                            if ((sensor_name != null) and (SDL_strcmp_REAL(sensor_name, "Sensor BMI320 Gyr") == @as(c_int, 0))) {
                                has_ally_gyro = @"true" != 0;
                            }
                        }
                    }
                }
                SDL_free_REAL(@ptrCast(@alignCast(sensors)));
            }
            SDL_QuitSubSystem_REAL(SDL_INIT_SENSOR);
        }
        if (has_ally_accel and has_ally_gyro) {
            return @"true" != 0;
        }
    }
    return @"false" != 0;
}
pub fn ShouldAttemptSensorFusion(joystick: [*c]SDL_Joystick, invert_sensors: [*c]bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    SDL_AssertJoysticksLocked();
    invert_sensors.* = @"false" != 0;
    if (!SDL_IsGamepad_REAL(joystick.*.instance_id)) {
        return @"false" != 0;
    }
    if (joystick.*.nsensors > @as(c_int, 0)) {
        return @"false" != 0;
    }
    var hint: [*c]const u8 = SDL_GetHint_REAL("SDL_GAMECONTROLLER_SENSOR_FUSION");
    _ = &hint;
    if ((hint != null) and (@as(c_int, hint.*) != 0)) {
        if ((@as(c_int, hint.*) == @as(c_int, '@')) or (SDL_strncmp_REAL(hint, "0x", 2) == @as(c_int, 0))) {
            var gamepads: SDL_vidpid_list = undefined;
            _ = &gamepads;
            var guid: SDL_GUID = undefined;
            _ = &guid;
            var vendor: Uint16 = undefined;
            _ = &vendor;
            var product: Uint16 = undefined;
            _ = &product;
            var enabled: bool = undefined;
            _ = &enabled;
            _ = memset(@ptrCast(@alignCast(&gamepads)), 0, @sizeOf(@TypeOf(gamepads)));
            guid = SDL_GetJoystickGUID_REAL(joystick);
            SDL_GetJoystickGUIDInfo_REAL(guid, &vendor, &product, null, null);
            SDL_LoadVIDPIDListFromHints(&gamepads, hint, null);
            enabled = SDL_VIDPIDInList(vendor, product, &gamepads);
            SDL_FreeVIDPIDList(&gamepads);
            if (enabled) {
                return @"true" != 0;
            }
        } else {
            return SDL_GetStringBoolean(hint, @"false" != 0);
        }
    }
    if ((joystick.*.name != null) and ((SDL_strstr_REAL(joystick.*.name, "Backbone One") != null) or (SDL_strstr_REAL(joystick.*.name, "Kishi") != null))) {
        return @"true" != 0;
    }
    if (IsROGAlly(joystick)) {
        invert_sensors.* = @"true" != 0;
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub fn AttemptSensorFusion(joystick: [*c]SDL_Joystick, invert_sensors: bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var sensors: [*c]SDL_SensorID = undefined;
    _ = &sensors;
    var i: c_uint = undefined;
    _ = &i;
    var j: c_uint = undefined;
    _ = &j;
    SDL_AssertJoysticksLocked();
    if (!SDL_InitSubSystem_REAL(SDL_INIT_SENSOR)) {
        return;
    }
    sensors = SDL_GetSensors_REAL(null);
    if (sensors != null) {
        {
            i = 0;
            while (sensors[i] != 0) : (i +%= 1) {
                var sensor: SDL_SensorID = sensors[i];
                _ = &sensor;
                if (!(joystick.*.accel_sensor != 0) and (SDL_GetSensorTypeForID_REAL(sensor) == SDL_SENSOR_ACCEL)) {
                    _ = SDL_InitSubSystem_REAL(SDL_INIT_SENSOR);
                    joystick.*.accel_sensor = sensor;
                    SDL_PrivateJoystickAddSensor(joystick, SDL_SENSOR_ACCEL, 0.0);
                }
                if (!(joystick.*.gyro_sensor != 0) and (SDL_GetSensorTypeForID_REAL(sensor) == SDL_SENSOR_GYRO)) {
                    _ = SDL_InitSubSystem_REAL(SDL_INIT_SENSOR);
                    joystick.*.gyro_sensor = sensor;
                    SDL_PrivateJoystickAddSensor(joystick, SDL_SENSOR_GYRO, 0.0);
                }
            }
        }
        SDL_free_REAL(@ptrCast(@alignCast(sensors)));
    }
    SDL_QuitSubSystem_REAL(SDL_INIT_SENSOR);
    if (SDL_GetNaturalDisplayOrientation_REAL(SDL_GetPrimaryDisplay_REAL()) == @as(SDL_DisplayOrientation, SDL_ORIENTATION_LANDSCAPE)) {
        joystick.*.sensor_transform[@as(c_int, 0)][@as(c_int, 0)] = 1.0;
        joystick.*.sensor_transform[@as(c_int, 1)][@as(c_int, 2)] = 1.0;
        joystick.*.sensor_transform[@as(c_int, 2)][@as(c_int, 1)] = -@as(f32, 1.0);
    } else {
        joystick.*.sensor_transform[@as(c_int, 0)][@as(c_int, 1)] = -@as(f32, 1.0);
        joystick.*.sensor_transform[@as(c_int, 1)][@as(c_int, 2)] = 1.0;
        joystick.*.sensor_transform[@as(c_int, 2)][@as(c_int, 0)] = -@as(f32, 1.0);
    }
    if (invert_sensors) {
        {
            i = 0;
            while (@as(c_ulong, i) < (@sizeOf(@TypeOf(joystick.*.sensor_transform)) / @sizeOf(@TypeOf(joystick.*.sensor_transform[@as(c_int, 0)])))) : (i +%= 1) {
                {
                    j = 0;
                    while (@as(c_ulong, j) < (@sizeOf(@TypeOf(joystick.*.sensor_transform[i])) / @sizeOf(@TypeOf(joystick.*.sensor_transform[i][@as(c_int, 0)])))) : (j +%= 1) {
                        joystick.*.sensor_transform[i][j] *= -@as(f32, 1.0);
                    }
                }
            }
        }
    }
}
pub fn CleanupSensorFusion(joystick: [*c]SDL_Joystick) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_AssertJoysticksLocked();
    if ((joystick.*.accel_sensor != 0) or (joystick.*.gyro_sensor != 0)) {
        if (joystick.*.accel_sensor != 0) {
            if (joystick.*.accel != null) {
                SDL_CloseSensor_REAL(joystick.*.accel);
                joystick.*.accel = null;
            }
            joystick.*.accel_sensor = 0;
            SDL_QuitSubSystem_REAL(SDL_INIT_SENSOR);
        }
        if (joystick.*.gyro_sensor != 0) {
            if (joystick.*.gyro != null) {
                SDL_CloseSensor_REAL(joystick.*.gyro);
                joystick.*.gyro = null;
            }
            joystick.*.gyro_sensor = 0;
            SDL_QuitSubSystem_REAL(SDL_INIT_SENSOR);
        }
    }
}
pub fn ShouldSwapFaceButtons(info: [*c]const SDL_SteamVirtualGamepadInfo) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if ((info != null) and ((((info.*.type == @as(SDL_GamepadType, SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_PRO)) or (info.*.type == @as(SDL_GamepadType, SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_LEFT))) or (info.*.type == @as(SDL_GamepadType, SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_RIGHT))) or (info.*.type == @as(SDL_GamepadType, SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_PAIR)))) {
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub export fn SDL_OpenJoystick_REAL(instance_id: SDL_JoystickID) [*c]SDL_Joystick {
    @setEvalBranchQuota(100000);
    var driver: [*c]SDL_JoystickDriver = undefined;
    _ = &driver;
    var device_index: c_int = undefined;
    _ = &device_index;
    var joystick: [*c]SDL_Joystick = undefined;
    _ = &joystick;
    var joysticklist: [*c]SDL_Joystick = undefined;
    _ = &joysticklist;
    var joystickname: [*c]const u8 = null;
    _ = &joystickname;
    var joystickpath: [*c]const u8 = null;
    _ = &joystickpath;
    var invert_sensors: bool = @"false" != 0;
    _ = &invert_sensors;
    var info: [*c]const SDL_SteamVirtualGamepadInfo = undefined;
    _ = &info;
    SDL_LockJoysticks_REAL();
    if (!SDL_GetDriverAndJoystickIndex(instance_id, &driver, &device_index)) {
        SDL_UnlockJoysticks_REAL();
        return null;
    }
    joysticklist = SDL_joysticks;
    while (joysticklist != null) {
        if (instance_id == joysticklist.*.instance_id) {
            joystick = joysticklist;
            joystick.*.ref_count += 1;
            SDL_UnlockJoysticks_REAL();
            return joystick;
        }
        joysticklist = joysticklist.*.next;
    }
    joystick = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(joystick.*)))));
    if (!(joystick != null)) {
        SDL_UnlockJoysticks_REAL();
        return null;
    }
    SDL_SetObjectValid(@ptrCast(@alignCast(joystick)), SDL_OBJECT_TYPE_JOYSTICK, @"true" != 0);
    joystick.*.driver = driver;
    joystick.*.instance_id = instance_id;
    joystick.*.attached = @"true" != 0;
    joystick.*.led_expiration = SDL_GetTicks_REAL();
    joystick.*.battery_percent = -@as(c_int, 1);
    joystick.*.is_virtual = driver == (&SDL_VIRTUAL_JoystickDriver);
    if (!driver.*.Open.?(joystick, device_index)) {
        SDL_SetObjectValid(@ptrCast(@alignCast(joystick)), SDL_OBJECT_TYPE_JOYSTICK, @"false" != 0);
        SDL_free_REAL(@ptrCast(@alignCast(joystick)));
        SDL_UnlockJoysticks_REAL();
        return null;
    }
    joystickname = driver.*.GetDeviceName.?(device_index);
    if (joystickname != null) {
        joystick.*.name = SDL_strdup_REAL(joystickname);
    }
    joystickpath = driver.*.GetDevicePath.?(device_index);
    if (joystickpath != null) {
        joystick.*.path = SDL_strdup_REAL(joystickpath);
    }
    joystick.*.guid = driver.*.GetDeviceGUID.?(device_index);
    if (joystick.*.naxes > @as(c_int, 0)) {
        joystick.*.axes = @ptrCast(@alignCast(SDL_calloc_REAL(@bitCast(@as(c_long, joystick.*.naxes)), @sizeOf(@TypeOf(joystick.*.axes.*)))));
    }
    if (joystick.*.nballs > @as(c_int, 0)) {
        joystick.*.balls = @ptrCast(@alignCast(SDL_calloc_REAL(@bitCast(@as(c_long, joystick.*.nballs)), @sizeOf(@TypeOf(joystick.*.balls.*)))));
    }
    if (joystick.*.nhats > @as(c_int, 0)) {
        joystick.*.hats = @ptrCast(@alignCast(SDL_calloc_REAL(@bitCast(@as(c_long, joystick.*.nhats)), @sizeOf(@TypeOf(joystick.*.hats.*)))));
    }
    if (joystick.*.nbuttons > @as(c_int, 0)) {
        joystick.*.buttons = @ptrCast(@alignCast(SDL_calloc_REAL(@bitCast(@as(c_long, joystick.*.nbuttons)), @sizeOf(@TypeOf(joystick.*.buttons.*)))));
    }
    if (((((joystick.*.naxes > @as(c_int, 0)) and !(joystick.*.axes != null)) or ((joystick.*.nballs > @as(c_int, 0)) and !(joystick.*.balls != null))) or ((joystick.*.nhats > @as(c_int, 0)) and !(joystick.*.hats != null))) or ((joystick.*.nbuttons > @as(c_int, 0)) and !(joystick.*.buttons != null))) {
        SDL_CloseJoystick_REAL(joystick);
        SDL_UnlockJoysticks_REAL();
        return null;
    }
    if (SDL_JoystickAxesCenteredAtZero(joystick)) {
        {
            var i: c_int = 0;
            _ = &i;
            while (i < joystick.*.naxes) : (i += 1) {
                joystick.*.axes[@bitCast(@as(isize, @intCast(i)))].has_initial_value = @"true" != 0;
            }
        }
    }
    if ((((SDL_IsJoystickHIDAPI(joystick.*.guid) or SDL_IsJoystickXInput(joystick.*.guid)) or SDL_IsJoystickRAWINPUT(joystick.*.guid)) or SDL_IsJoystickWGI(joystick.*.guid)) and (joystick.*.naxes >= SDL_GAMEPAD_AXIS_COUNT)) {
        var left_trigger: c_int = undefined;
        _ = &left_trigger;
        var right_trigger: c_int = undefined;
        _ = &right_trigger;
        if (SDL_IsJoystickXInput(joystick.*.guid)) {
            left_trigger = 2;
            right_trigger = 5;
        } else {
            left_trigger = SDL_GAMEPAD_AXIS_LEFT_TRIGGER;
            right_trigger = SDL_GAMEPAD_AXIS_RIGHT_TRIGGER;
        }
        {
            var i: c_int = 0;
            _ = &i;
            while (i < SDL_GAMEPAD_AXIS_COUNT) : (i += 1) {
                var initial_value: c_int = undefined;
                _ = &initial_value;
                if ((i == left_trigger) or (i == right_trigger)) {
                    initial_value = @as(Sint16, @truncate(~@as(c_int, 32767)));
                } else {
                    initial_value = 0;
                }
                joystick.*.axes[@bitCast(@as(isize, @intCast(i)))].value = @truncate(initial_value);
                joystick.*.axes[@bitCast(@as(isize, @intCast(i)))].zero = @truncate(initial_value);
                joystick.*.axes[@bitCast(@as(isize, @intCast(i)))].initial_value = @truncate(initial_value);
                joystick.*.axes[@bitCast(@as(isize, @intCast(i)))].has_initial_value = @"true" != 0;
            }
        }
    }
    info = SDL_GetJoystickVirtualGamepadInfoForID(instance_id);
    if (info != null) {
        joystick.*.steam_handle = info.*.handle;
        joystick.*.swap_face_buttons = ShouldSwapFaceButtons(info);
    }
    if (ShouldAttemptSensorFusion(joystick, &invert_sensors)) {
        AttemptSensorFusion(joystick, invert_sensors);
    }
    joystick.*.ref_count += 1;
    joystick.*.next = SDL_joysticks;
    SDL_joysticks = joystick;
    driver.*.Update.?(joystick);
    SDL_UnlockJoysticks_REAL();
    return joystick;
}
pub export fn SDL_AttachVirtualJoystick_REAL(desc: [*c]const SDL_VirtualJoystickDesc) SDL_JoystickID {
    @setEvalBranchQuota(100000);
    var result: SDL_JoystickID = undefined;
    _ = &result;
    SDL_LockJoysticks_REAL();
    result = SDL_JoystickAttachVirtualInner(desc);
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_DetachVirtualJoystick_REAL(instance_id: SDL_JoystickID) bool {
    @setEvalBranchQuota(100000);
    var result: bool = undefined;
    _ = &result;
    SDL_LockJoysticks_REAL();
    result = SDL_JoystickDetachVirtualInner(instance_id);
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_IsJoystickVirtual_REAL(instance_id: SDL_JoystickID) bool {
    @setEvalBranchQuota(100000);
    var driver: [*c]SDL_JoystickDriver = undefined;
    _ = &driver;
    var device_index: c_int = undefined;
    _ = &device_index;
    var is_virtual: bool = @"false" != 0;
    _ = &is_virtual;
    SDL_LockJoysticks_REAL();
    if (SDL_GetDriverAndJoystickIndex(instance_id, &driver, &device_index)) {
        if (driver == (&SDL_VIRTUAL_JoystickDriver)) {
            is_virtual = @"true" != 0;
        }
    }
    SDL_UnlockJoysticks_REAL();
    return is_virtual;
}
pub export fn SDL_SetJoystickVirtualAxis_REAL(joystick: [*c]SDL_Joystick, axis: c_int, value: Sint16) bool {
    @setEvalBranchQuota(100000);
    var result: bool = undefined;
    _ = &result;
    SDL_LockJoysticks_REAL();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(joystick)), SDL_OBJECT_TYPE_JOYSTICK)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("joystick"))));
            SDL_UnlockJoysticks_REAL();
            return @"false" != 0;
        }
        if (!joystick.*.is_virtual) {
            _ = SDL_SetError_REAL("joystick isn't virtual");
            SDL_UnlockJoysticks_REAL();
            return @"false" != 0;
        }
        result = SDL_SetJoystickVirtualAxisInner(joystick, axis, value);
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_SetJoystickVirtualBall_REAL(joystick: [*c]SDL_Joystick, ball: c_int, xrel: Sint16, yrel: Sint16) bool {
    @setEvalBranchQuota(100000);
    var result: bool = undefined;
    _ = &result;
    SDL_LockJoysticks_REAL();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(joystick)), SDL_OBJECT_TYPE_JOYSTICK)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("joystick"))));
            SDL_UnlockJoysticks_REAL();
            return @"false" != 0;
        }
        if (!joystick.*.is_virtual) {
            _ = SDL_SetError_REAL("joystick isn't virtual");
            SDL_UnlockJoysticks_REAL();
            return @"false" != 0;
        }
        result = SDL_SetJoystickVirtualBallInner(joystick, ball, xrel, yrel);
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_SetJoystickVirtualButton_REAL(joystick: [*c]SDL_Joystick, button: c_int, down: bool) bool {
    @setEvalBranchQuota(100000);
    var result: bool = undefined;
    _ = &result;
    SDL_LockJoysticks_REAL();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(joystick)), SDL_OBJECT_TYPE_JOYSTICK)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("joystick"))));
            SDL_UnlockJoysticks_REAL();
            return @"false" != 0;
        }
        if (!joystick.*.is_virtual) {
            _ = SDL_SetError_REAL("joystick isn't virtual");
            SDL_UnlockJoysticks_REAL();
            return @"false" != 0;
        }
        result = SDL_SetJoystickVirtualButtonInner(joystick, button, down);
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_SetJoystickVirtualHat_REAL(joystick: [*c]SDL_Joystick, hat: c_int, value: Uint8) bool {
    @setEvalBranchQuota(100000);
    var result: bool = undefined;
    _ = &result;
    SDL_LockJoysticks_REAL();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(joystick)), SDL_OBJECT_TYPE_JOYSTICK)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("joystick"))));
            SDL_UnlockJoysticks_REAL();
            return @"false" != 0;
        }
        if (!joystick.*.is_virtual) {
            _ = SDL_SetError_REAL("joystick isn't virtual");
            SDL_UnlockJoysticks_REAL();
            return @"false" != 0;
        }
        result = SDL_SetJoystickVirtualHatInner(joystick, hat, value);
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_SetJoystickVirtualTouchpad_REAL(joystick: [*c]SDL_Joystick, touchpad: c_int, finger: c_int, down: bool, x: f32, y: f32, pressure: f32) bool {
    @setEvalBranchQuota(100000);
    var result: bool = undefined;
    _ = &result;
    SDL_LockJoysticks_REAL();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(joystick)), SDL_OBJECT_TYPE_JOYSTICK)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("joystick"))));
            SDL_UnlockJoysticks_REAL();
            return @"false" != 0;
        }
        if (!joystick.*.is_virtual) {
            _ = SDL_SetError_REAL("joystick isn't virtual");
            SDL_UnlockJoysticks_REAL();
            return @"false" != 0;
        }
        result = SDL_SetJoystickVirtualTouchpadInner(joystick, touchpad, finger, down, x, y, pressure);
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_SendJoystickVirtualSensorData_REAL(joystick: [*c]SDL_Joystick, arg_type: SDL_SensorType, sensor_timestamp: Uint64, data: [*c]const f32, num_values: c_int) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var result: bool = undefined;
    _ = &result;
    SDL_LockJoysticks_REAL();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(joystick)), SDL_OBJECT_TYPE_JOYSTICK)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("joystick"))));
            SDL_UnlockJoysticks_REAL();
            return @"false" != 0;
        }
        if (!joystick.*.is_virtual) {
            _ = SDL_SetError_REAL("joystick isn't virtual");
            SDL_UnlockJoysticks_REAL();
            return @"false" != 0;
        }
        result = SDL_SendJoystickVirtualSensorDataInner(joystick, @"type", sensor_timestamp, data, num_values);
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_IsJoystickValid(joystick: [*c]SDL_Joystick) bool {
    @setEvalBranchQuota(100000);
    SDL_AssertJoysticksLocked();
    return SDL_ObjectValid(@ptrCast(@alignCast(joystick)), SDL_OBJECT_TYPE_JOYSTICK);
}
pub export fn SDL_PrivateJoystickGetAutoGamepadMapping(instance_id: SDL_JoystickID, out: [*c]SDL_GamepadMapping) bool {
    @setEvalBranchQuota(100000);
    var driver: [*c]SDL_JoystickDriver = undefined;
    _ = &driver;
    var device_index: c_int = undefined;
    _ = &device_index;
    var is_ok: bool = @"false" != 0;
    _ = &is_ok;
    SDL_LockJoysticks_REAL();
    if (SDL_GetDriverAndJoystickIndex(instance_id, &driver, &device_index)) {
        is_ok = driver.*.GetGamepadMapping.?(device_index, out);
    }
    SDL_UnlockJoysticks_REAL();
    return is_ok;
}
pub export fn SDL_GetNumJoystickAxes_REAL(joystick: [*c]SDL_Joystick) c_int {
    @setEvalBranchQuota(100000);
    var result: c_int = undefined;
    _ = &result;
    SDL_LockJoysticks_REAL();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(joystick)), SDL_OBJECT_TYPE_JOYSTICK)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("joystick"))));
            SDL_UnlockJoysticks_REAL();
            return -@as(c_int, 1);
        }
        result = joystick.*.naxes;
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_GetNumJoystickHats_REAL(joystick: [*c]SDL_Joystick) c_int {
    @setEvalBranchQuota(100000);
    var result: c_int = undefined;
    _ = &result;
    SDL_LockJoysticks_REAL();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(joystick)), SDL_OBJECT_TYPE_JOYSTICK)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("joystick"))));
            SDL_UnlockJoysticks_REAL();
            return -@as(c_int, 1);
        }
        result = joystick.*.nhats;
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_GetNumJoystickBalls_REAL(joystick: [*c]SDL_Joystick) c_int {
    @setEvalBranchQuota(100000);
    var result: c_int = undefined;
    _ = &result;
    SDL_LockJoysticks_REAL();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(joystick)), SDL_OBJECT_TYPE_JOYSTICK)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("joystick"))));
            SDL_UnlockJoysticks_REAL();
            return -@as(c_int, 1);
        }
        result = joystick.*.nballs;
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_GetNumJoystickButtons_REAL(joystick: [*c]SDL_Joystick) c_int {
    @setEvalBranchQuota(100000);
    var result: c_int = undefined;
    _ = &result;
    SDL_LockJoysticks_REAL();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(joystick)), SDL_OBJECT_TYPE_JOYSTICK)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("joystick"))));
            SDL_UnlockJoysticks_REAL();
            return -@as(c_int, 1);
        }
        result = joystick.*.nbuttons;
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_GetJoystickAxis_REAL(joystick: [*c]SDL_Joystick, axis: c_int) Sint16 {
    @setEvalBranchQuota(100000);
    var state: Sint16 = undefined;
    _ = &state;
    SDL_LockJoysticks_REAL();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(joystick)), SDL_OBJECT_TYPE_JOYSTICK)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("joystick"))));
            SDL_UnlockJoysticks_REAL();
            return 0;
        }
        if (axis < joystick.*.naxes) {
            state = joystick.*.axes[@bitCast(@as(isize, @intCast(axis)))].value;
        } else {
            _ = SDL_SetError_REAL("Joystick only has %d axes", joystick.*.naxes);
            state = 0;
        }
    }
    SDL_UnlockJoysticks_REAL();
    return state;
}
pub export fn SDL_GetJoystickAxisInitialState_REAL(joystick: [*c]SDL_Joystick, arg_axis: c_int, state: [*c]Sint16) bool {
    @setEvalBranchQuota(100000);
    var axis = arg_axis;
    _ = &axis;
    var result: bool = undefined;
    _ = &result;
    SDL_LockJoysticks_REAL();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(joystick)), SDL_OBJECT_TYPE_JOYSTICK)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("joystick"))));
            SDL_UnlockJoysticks_REAL();
            return @"false" != 0;
        }
        if (axis >= joystick.*.naxes) {
            _ = SDL_SetError_REAL("Joystick only has %d axes", joystick.*.naxes);
            result = @"false" != 0;
        } else {
            if (state != null) {
                state.* = joystick.*.axes[@bitCast(@as(isize, @intCast(axis)))].initial_value;
            }
            result = joystick.*.axes[@bitCast(@as(isize, @intCast(axis)))].has_initial_value;
        }
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_GetJoystickHat_REAL(joystick: [*c]SDL_Joystick, hat: c_int) Uint8 {
    @setEvalBranchQuota(100000);
    var state: Uint8 = undefined;
    _ = &state;
    SDL_LockJoysticks_REAL();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(joystick)), SDL_OBJECT_TYPE_JOYSTICK)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("joystick"))));
            SDL_UnlockJoysticks_REAL();
            return 0;
        }
        if (hat < joystick.*.nhats) {
            state = joystick.*.hats[@bitCast(@as(isize, @intCast(hat)))];
        } else {
            _ = SDL_SetError_REAL("Joystick only has %d hats", joystick.*.nhats);
            state = 0;
        }
    }
    SDL_UnlockJoysticks_REAL();
    return state;
}
pub export fn SDL_GetJoystickBall_REAL(joystick: [*c]SDL_Joystick, ball: c_int, dx: [*c]c_int, dy: [*c]c_int) bool {
    @setEvalBranchQuota(100000);
    var result: bool = undefined;
    _ = &result;
    SDL_LockJoysticks_REAL();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(joystick)), SDL_OBJECT_TYPE_JOYSTICK)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("joystick"))));
            SDL_UnlockJoysticks_REAL();
            return @"false" != 0;
        }
        if (ball < joystick.*.nballs) {
            if (dx != null) {
                dx.* = joystick.*.balls[@bitCast(@as(isize, @intCast(ball)))].dx;
            }
            if (dy != null) {
                dy.* = joystick.*.balls[@bitCast(@as(isize, @intCast(ball)))].dy;
            }
            joystick.*.balls[@bitCast(@as(isize, @intCast(ball)))].dx = 0;
            joystick.*.balls[@bitCast(@as(isize, @intCast(ball)))].dy = 0;
            result = @"true" != 0;
        } else {
            result = SDL_SetError_REAL("Joystick only has %d balls", joystick.*.nballs);
        }
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_GetJoystickButton_REAL(joystick: [*c]SDL_Joystick, button: c_int) bool {
    @setEvalBranchQuota(100000);
    var down: bool = @"false" != 0;
    _ = &down;
    SDL_LockJoysticks_REAL();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(joystick)), SDL_OBJECT_TYPE_JOYSTICK)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("joystick"))));
            SDL_UnlockJoysticks_REAL();
            return @"false" != 0;
        }
        if (button < joystick.*.nbuttons) {
            down = joystick.*.buttons[@bitCast(@as(isize, @intCast(button)))];
        } else {
            _ = SDL_SetError_REAL("Joystick only has %d buttons", joystick.*.nbuttons);
        }
    }
    SDL_UnlockJoysticks_REAL();
    return down;
}
pub fn ErrorNoSuchSensor() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("No such sensor on this device");
}
pub export fn SDL_JoystickHasSensor_REAL(joystick: [*c]SDL_Joystick, arg_type: SDL_SensorType) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var result: bool = @"false" != 0;
    _ = &result;
    SDL_LockJoysticks_REAL();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(joystick)), SDL_OBJECT_TYPE_JOYSTICK)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("joystick"))));
            SDL_UnlockJoysticks_REAL();
            return @"false" != 0;
        }
        {
            var i: c_int = 0;
            _ = &i;
            while (i < joystick.*.nsensors) : (i += 1) {
                if (joystick.*.sensors[@bitCast(@as(isize, @intCast(i)))].type == @"type") {
                    result = @"true" != 0;
                    break;
                }
            }
        }
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_SetJoystickSensorEnabled_REAL(joystick: [*c]SDL_Joystick, arg_type: SDL_SensorType, enabled: bool) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    SDL_LockJoysticks_REAL();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(joystick)), SDL_OBJECT_TYPE_JOYSTICK)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("joystick"))));
            SDL_UnlockJoysticks_REAL();
            return @"false" != 0;
        }
        {
            var i: c_int = 0;
            _ = &i;
            while (i < joystick.*.nsensors) : (i += 1) {
                var sensor: [*c]SDL_JoystickSensorInfo = &joystick.*.sensors[@bitCast(@as(isize, @intCast(i)))];
                _ = &sensor;
                if (sensor.*.type == @"type") {
                    if (@as(c_int, @intFromBool(sensor.*.enabled)) == @intFromBool(@as(c_int, @intFromBool(enabled)) != @"false")) {
                        SDL_UnlockJoysticks_REAL();
                        return @"true" != 0;
                    }
                    if ((@as(SDL_SensorID, @bitCast(@as(c_int, @intFromBool(@"type" == SDL_SENSOR_ACCEL)))) != 0) and (joystick.*.accel_sensor != 0)) {
                        if (enabled) {
                            joystick.*.accel = SDL_OpenSensor_REAL(joystick.*.accel_sensor);
                            if (!(joystick.*.accel != null)) {
                                SDL_UnlockJoysticks_REAL();
                                return @"false" != 0;
                            }
                        } else {
                            if (joystick.*.accel != null) {
                                SDL_CloseSensor_REAL(joystick.*.accel);
                                joystick.*.accel = null;
                            }
                        }
                    } else if ((@as(SDL_SensorID, @bitCast(@as(c_int, @intFromBool(@"type" == SDL_SENSOR_GYRO)))) != 0) and (joystick.*.gyro_sensor != 0)) {
                        if (enabled) {
                            joystick.*.gyro = SDL_OpenSensor_REAL(joystick.*.gyro_sensor);
                            if (!(joystick.*.gyro != null)) {
                                SDL_UnlockJoysticks_REAL();
                                return @"false" != 0;
                            }
                        } else {
                            if (joystick.*.gyro != null) {
                                SDL_CloseSensor_REAL(joystick.*.gyro);
                                joystick.*.gyro = null;
                            }
                        }
                    } else {
                        if (enabled) {
                            if (joystick.*.nsensors_enabled == @as(c_int, 0)) {
                                if (!joystick.*.driver.*.SetSensorsEnabled.?(joystick, @"true" != 0)) {
                                    SDL_UnlockJoysticks_REAL();
                                    return @"false" != 0;
                                }
                            }
                            joystick.*.nsensors_enabled += 1;
                        } else {
                            if (joystick.*.nsensors_enabled == @as(c_int, 1)) {
                                if (!joystick.*.driver.*.SetSensorsEnabled.?(joystick, @"false" != 0)) {
                                    SDL_UnlockJoysticks_REAL();
                                    return @"false" != 0;
                                }
                            }
                            joystick.*.nsensors_enabled -= 1;
                        }
                    }
                    sensor.*.enabled = enabled;
                    SDL_UnlockJoysticks_REAL();
                    return @"true" != 0;
                }
            }
        }
    }
    SDL_UnlockJoysticks_REAL();
    return ErrorNoSuchSensor();
}
pub export fn SDL_JoystickSensorEnabled_REAL(joystick: [*c]SDL_Joystick, arg_type: SDL_SensorType) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var result: bool = @"false" != 0;
    _ = &result;
    SDL_LockJoysticks_REAL();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(joystick)), SDL_OBJECT_TYPE_JOYSTICK)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("joystick"))));
            SDL_UnlockJoysticks_REAL();
            return @"false" != 0;
        }
        {
            var i: c_int = 0;
            _ = &i;
            while (i < joystick.*.nsensors) : (i += 1) {
                if (joystick.*.sensors[@bitCast(@as(isize, @intCast(i)))].type == @"type") {
                    result = joystick.*.sensors[@bitCast(@as(isize, @intCast(i)))].enabled;
                    break;
                }
            }
        }
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_GetJoystickSensorDataRate_REAL(joystick: [*c]SDL_Joystick, arg_type: SDL_SensorType) f32 {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var result: f32 = 0.0;
    _ = &result;
    SDL_LockJoysticks_REAL();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(joystick)), SDL_OBJECT_TYPE_JOYSTICK)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("joystick"))));
            SDL_UnlockJoysticks_REAL();
            return 0.0;
        }
        {
            var i: c_int = 0;
            _ = &i;
            while (i < joystick.*.nsensors) : (i += 1) {
                var sensor: [*c]SDL_JoystickSensorInfo = &joystick.*.sensors[@bitCast(@as(isize, @intCast(i)))];
                _ = &sensor;
                if (sensor.*.type == @"type") {
                    result = sensor.*.rate;
                    break;
                }
            }
        }
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_GetJoystickSensorData_REAL(joystick: [*c]SDL_Joystick, arg_type: SDL_SensorType, data: [*c]f32, arg_num_values: c_int) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var num_values = arg_num_values;
    _ = &num_values;
    SDL_LockJoysticks_REAL();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(joystick)), SDL_OBJECT_TYPE_JOYSTICK)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("joystick"))));
            SDL_UnlockJoysticks_REAL();
            return @"false" != 0;
        }
        {
            var i: c_int = 0;
            _ = &i;
            while (i < joystick.*.nsensors) : (i += 1) {
                var sensor: [*c]SDL_JoystickSensorInfo = &joystick.*.sensors[@bitCast(@as(isize, @intCast(i)))];
                _ = &sensor;
                if (sensor.*.type == @"type") {
                    num_values = @bitCast(@as(c_uint, @truncate(if (@as(c_ulong, @bitCast(@as(c_long, num_values))) < (@sizeOf(@TypeOf(sensor.*.data)) / @sizeOf(@TypeOf(sensor.*.data[@as(c_int, 0)])))) @as(c_ulong, @bitCast(@as(c_long, num_values))) else @sizeOf(@TypeOf(sensor.*.data)) / @sizeOf(@TypeOf(sensor.*.data[@as(c_int, 0)])))));
                    _ = memcpy(@ptrCast(@alignCast(data)), @ptrCast(@alignCast(@as([*c]f32, @ptrCast(@alignCast(&sensor.*.data))))), @as(c_ulong, @bitCast(@as(c_long, num_values))) *% @sizeOf(@TypeOf(data.*)));
                    SDL_UnlockJoysticks_REAL();
                    return @"true" != 0;
                }
            }
        }
    }
    SDL_UnlockJoysticks_REAL();
    return ErrorNoSuchSensor();
}
pub export fn SDL_JoystickConnected_REAL(joystick: [*c]SDL_Joystick) bool {
    @setEvalBranchQuota(100000);
    var result: bool = undefined;
    _ = &result;
    SDL_LockJoysticks_REAL();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(joystick)), SDL_OBJECT_TYPE_JOYSTICK)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("joystick"))));
            SDL_UnlockJoysticks_REAL();
            return @"false" != 0;
        }
        result = joystick.*.attached;
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_GetJoystickID_REAL(joystick: [*c]SDL_Joystick) SDL_JoystickID {
    @setEvalBranchQuota(100000);
    var result: SDL_JoystickID = undefined;
    _ = &result;
    SDL_LockJoysticks_REAL();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(joystick)), SDL_OBJECT_TYPE_JOYSTICK)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("joystick"))));
            SDL_UnlockJoysticks_REAL();
            return 0;
        }
        result = joystick.*.instance_id;
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_GetJoystickFromID_REAL(instance_id: SDL_JoystickID) [*c]SDL_Joystick {
    @setEvalBranchQuota(100000);
    var joystick: [*c]SDL_Joystick = undefined;
    _ = &joystick;
    SDL_LockJoysticks_REAL();
    {
        joystick = SDL_joysticks;
        while (joystick != null) : (joystick = joystick.*.next) {
            if (joystick.*.instance_id == instance_id) {
                break;
            }
        }
    }
    SDL_UnlockJoysticks_REAL();
    return joystick;
}
pub export fn SDL_GetJoystickFromPlayerIndex_REAL(player_index: c_int) [*c]SDL_Joystick {
    @setEvalBranchQuota(100000);
    var instance_id: SDL_JoystickID = undefined;
    _ = &instance_id;
    var joystick: [*c]SDL_Joystick = undefined;
    _ = &joystick;
    SDL_LockJoysticks_REAL();
    instance_id = SDL_GetJoystickIDForPlayerIndex(player_index);
    {
        joystick = SDL_joysticks;
        while (joystick != null) : (joystick = joystick.*.next) {
            if (joystick.*.instance_id == instance_id) {
                break;
            }
        }
    }
    SDL_UnlockJoysticks_REAL();
    return joystick;
}
pub export fn SDL_GetJoystickProperties_REAL(joystick: [*c]SDL_Joystick) SDL_PropertiesID {
    @setEvalBranchQuota(100000);
    var result: SDL_PropertiesID = undefined;
    _ = &result;
    SDL_LockJoysticks_REAL();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(joystick)), SDL_OBJECT_TYPE_JOYSTICK)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("joystick"))));
            SDL_UnlockJoysticks_REAL();
            return 0;
        }
        if (joystick.*.props == @as(SDL_PropertiesID, 0)) {
            joystick.*.props = SDL_CreateProperties_REAL();
        }
        result = joystick.*.props;
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_GetJoystickName_REAL(joystick: [*c]SDL_Joystick) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var result: [*c]const u8 = undefined;
    _ = &result;
    var info: [*c]const SDL_SteamVirtualGamepadInfo = undefined;
    _ = &info;
    SDL_LockJoysticks_REAL();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(joystick)), SDL_OBJECT_TYPE_JOYSTICK)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("joystick"))));
            SDL_UnlockJoysticks_REAL();
            return null;
        }
        info = SDL_GetJoystickVirtualGamepadInfoForID(joystick.*.instance_id);
        if (info != null) {
            result = SDL_GetPersistentString(info.*.name);
        } else {
            result = SDL_GetPersistentString(joystick.*.name);
        }
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_GetJoystickPath_REAL(joystick: [*c]SDL_Joystick) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var result: [*c]const u8 = undefined;
    _ = &result;
    SDL_LockJoysticks_REAL();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(joystick)), SDL_OBJECT_TYPE_JOYSTICK)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("joystick"))));
            SDL_UnlockJoysticks_REAL();
            return null;
        }
        if (joystick.*.path != null) {
            result = SDL_GetPersistentString(joystick.*.path);
        } else {
            _ = SDL_SetError_REAL("That operation is not supported");
            result = null;
        }
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_GetJoystickPlayerIndex_REAL(joystick: [*c]SDL_Joystick) c_int {
    @setEvalBranchQuota(100000);
    var result: c_int = undefined;
    _ = &result;
    SDL_LockJoysticks_REAL();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(joystick)), SDL_OBJECT_TYPE_JOYSTICK)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("joystick"))));
            SDL_UnlockJoysticks_REAL();
            return -@as(c_int, 1);
        }
        result = SDL_GetPlayerIndexForJoystickID(joystick.*.instance_id);
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_SetJoystickPlayerIndex_REAL(joystick: [*c]SDL_Joystick, player_index: c_int) bool {
    @setEvalBranchQuota(100000);
    var result: bool = undefined;
    _ = &result;
    SDL_LockJoysticks_REAL();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(joystick)), SDL_OBJECT_TYPE_JOYSTICK)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("joystick"))));
            SDL_UnlockJoysticks_REAL();
            return @"false" != 0;
        }
        result = SDL_SetJoystickIDForPlayerIndex(player_index, joystick.*.instance_id);
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_RumbleJoystick_REAL(joystick: [*c]SDL_Joystick, low_frequency_rumble: Uint16, high_frequency_rumble: Uint16, duration_ms: Uint32) bool {
    @setEvalBranchQuota(100000);
    var result: bool = undefined;
    _ = &result;
    SDL_LockJoysticks_REAL();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(joystick)), SDL_OBJECT_TYPE_JOYSTICK)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("joystick"))));
            SDL_UnlockJoysticks_REAL();
            return @"false" != 0;
        }
        if ((@as(c_int, low_frequency_rumble) == @as(c_int, joystick.*.low_frequency_rumble)) and (@as(c_int, high_frequency_rumble) == @as(c_int, joystick.*.high_frequency_rumble))) {
            result = @"true" != 0;
        } else {
            result = joystick.*.driver.*.Rumble.?(joystick, low_frequency_rumble, high_frequency_rumble);
            if (result) {
                joystick.*.rumble_resend = SDL_GetTicks_REAL() +% @as(Uint64, SDL_RUMBLE_RESEND_MS);
                if (joystick.*.rumble_resend == @as(Uint64, 0)) {
                    joystick.*.rumble_resend = 1;
                }
            } else {
                joystick.*.rumble_resend = 0;
            }
        }
        if (result) {
            joystick.*.low_frequency_rumble = low_frequency_rumble;
            joystick.*.high_frequency_rumble = high_frequency_rumble;
            if ((@as(Uint32, @bitCast(@as(c_int, @intFromBool((@as(c_int, low_frequency_rumble) != 0) or (@as(c_int, high_frequency_rumble) != 0))))) != 0) and (duration_ms != 0)) {
                joystick.*.rumble_expiration = SDL_GetTicks_REAL() +% @as(Uint64, if (duration_ms < @as(Uint32, @bitCast(@as(c_int, SDL_MAX_RUMBLE_DURATION_MS)))) duration_ms else @as(Uint32, @bitCast(@as(c_int, SDL_MAX_RUMBLE_DURATION_MS))));
                if (!(joystick.*.rumble_expiration != 0)) {
                    joystick.*.rumble_expiration = 1;
                }
            } else {
                joystick.*.rumble_expiration = 0;
                joystick.*.rumble_resend = 0;
            }
        }
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_RumbleJoystickTriggers_REAL(joystick: [*c]SDL_Joystick, left_rumble: Uint16, right_rumble: Uint16, duration_ms: Uint32) bool {
    @setEvalBranchQuota(100000);
    var result: bool = undefined;
    _ = &result;
    SDL_LockJoysticks_REAL();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(joystick)), SDL_OBJECT_TYPE_JOYSTICK)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("joystick"))));
            SDL_UnlockJoysticks_REAL();
            return @"false" != 0;
        }
        if ((@as(c_int, left_rumble) == @as(c_int, joystick.*.left_trigger_rumble)) and (@as(c_int, right_rumble) == @as(c_int, joystick.*.right_trigger_rumble))) {
            result = @"true" != 0;
        } else {
            result = joystick.*.driver.*.RumbleTriggers.?(joystick, left_rumble, right_rumble);
            if (result) {
                joystick.*.trigger_rumble_resend = SDL_GetTicks_REAL() +% @as(Uint64, SDL_RUMBLE_RESEND_MS);
                if (joystick.*.trigger_rumble_resend == @as(Uint64, 0)) {
                    joystick.*.trigger_rumble_resend = 1;
                }
            } else {
                joystick.*.trigger_rumble_resend = 0;
            }
        }
        if (result) {
            joystick.*.left_trigger_rumble = left_rumble;
            joystick.*.right_trigger_rumble = right_rumble;
            if ((@as(Uint32, @bitCast(@as(c_int, @intFromBool((@as(c_int, left_rumble) != 0) or (@as(c_int, right_rumble) != 0))))) != 0) and (duration_ms != 0)) {
                joystick.*.trigger_rumble_expiration = SDL_GetTicks_REAL() +% @as(Uint64, if (duration_ms < @as(Uint32, @bitCast(@as(c_int, SDL_MAX_RUMBLE_DURATION_MS)))) duration_ms else @as(Uint32, @bitCast(@as(c_int, SDL_MAX_RUMBLE_DURATION_MS))));
            } else {
                joystick.*.trigger_rumble_expiration = 0;
                joystick.*.trigger_rumble_resend = 0;
            }
        }
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_SetJoystickLED_REAL(joystick: [*c]SDL_Joystick, red: Uint8, green: Uint8, blue: Uint8) bool {
    @setEvalBranchQuota(100000);
    var result: bool = undefined;
    _ = &result;
    var isfreshvalue: bool = undefined;
    _ = &isfreshvalue;
    SDL_LockJoysticks_REAL();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(joystick)), SDL_OBJECT_TYPE_JOYSTICK)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("joystick"))));
            SDL_UnlockJoysticks_REAL();
            return @"false" != 0;
        }
        isfreshvalue = ((@as(c_int, red) != @as(c_int, joystick.*.led_red)) or (@as(c_int, green) != @as(c_int, joystick.*.led_green))) or (@as(c_int, blue) != @as(c_int, joystick.*.led_blue));
        if (isfreshvalue or (SDL_GetTicks_REAL() >= joystick.*.led_expiration)) {
            result = joystick.*.driver.*.SetLED.?(joystick, red, green, blue);
            joystick.*.led_expiration = SDL_GetTicks_REAL() +% @as(Uint64, SDL_LED_MIN_REPEAT_MS);
        } else {
            result = @"true" != 0;
        }
        joystick.*.led_red = red;
        joystick.*.led_green = green;
        joystick.*.led_blue = blue;
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_SendJoystickEffect_REAL(joystick: [*c]SDL_Joystick, data: ?*const anyopaque, size: c_int) bool {
    @setEvalBranchQuota(100000);
    var result: bool = undefined;
    _ = &result;
    SDL_LockJoysticks_REAL();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(joystick)), SDL_OBJECT_TYPE_JOYSTICK)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("joystick"))));
            SDL_UnlockJoysticks_REAL();
            return @"false" != 0;
        }
        result = joystick.*.driver.*.SendEffect.?(joystick, data, size);
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_CloseJoystick_REAL(joystick: [*c]SDL_Joystick) void {
    @setEvalBranchQuota(100000);
    var joysticklist: [*c]SDL_Joystick = undefined;
    _ = &joysticklist;
    var joysticklistprev: [*c]SDL_Joystick = undefined;
    _ = &joysticklistprev;
    var i: c_int = undefined;
    _ = &i;
    SDL_LockJoysticks_REAL();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(joystick)), SDL_OBJECT_TYPE_JOYSTICK)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("joystick"))));
            SDL_UnlockJoysticks_REAL();
            return;
        }
        if ((blk: {
            const ref = &joystick.*.ref_count;
            ref.* -= 1;
            break :blk ref.*;
        }) > @as(c_int, 0)) {
            SDL_UnlockJoysticks_REAL();
            return;
        }
        SDL_DestroyProperties_REAL(joystick.*.props);
        if (joystick.*.rumble_expiration != 0) {
            _ = SDL_RumbleJoystick_REAL(joystick, 0, 0, 0);
        }
        if (joystick.*.trigger_rumble_expiration != 0) {
            _ = SDL_RumbleJoystickTriggers_REAL(joystick, 0, 0, 0);
        }
        CleanupSensorFusion(joystick);
        joystick.*.driver.*.Close.?(joystick);
        joystick.*.hwdata = null;
        SDL_SetObjectValid(@ptrCast(@alignCast(joystick)), SDL_OBJECT_TYPE_JOYSTICK, @"false" != 0);
        joysticklist = SDL_joysticks;
        joysticklistprev = null;
        while (joysticklist != null) {
            if (joystick == joysticklist) {
                if (joysticklistprev != null) {
                    joysticklistprev.*.next = joysticklist.*.next;
                } else {
                    SDL_joysticks = joystick.*.next;
                }
                break;
            }
            joysticklistprev = joysticklist;
            joysticklist = joysticklist.*.next;
        }
        SDL_free_REAL(@ptrCast(@alignCast(joystick.*.name)));
        SDL_free_REAL(@ptrCast(@alignCast(joystick.*.path)));
        SDL_free_REAL(@ptrCast(@alignCast(joystick.*.serial)));
        SDL_free_REAL(@ptrCast(@alignCast(joystick.*.axes)));
        SDL_free_REAL(@ptrCast(@alignCast(joystick.*.balls)));
        SDL_free_REAL(@ptrCast(@alignCast(joystick.*.hats)));
        SDL_free_REAL(@ptrCast(@alignCast(joystick.*.buttons)));
        {
            i = 0;
            while (i < joystick.*.ntouchpads) : (i += 1) {
                var touchpad: [*c]SDL_JoystickTouchpadInfo = &joystick.*.touchpads[@bitCast(@as(isize, @intCast(i)))];
                _ = &touchpad;
                SDL_free_REAL(@ptrCast(@alignCast(touchpad.*.fingers)));
            }
        }
        SDL_free_REAL(@ptrCast(@alignCast(joystick.*.touchpads)));
        SDL_free_REAL(@ptrCast(@alignCast(joystick.*.sensors)));
        SDL_free_REAL(@ptrCast(@alignCast(joystick.*.capsenses)));
        SDL_free_REAL(@ptrCast(@alignCast(joystick)));
    }
    SDL_UnlockJoysticks_REAL();
}
pub export fn SDL_QuitJoysticks() void {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var joysticks: [*c]SDL_JoystickID = undefined;
    _ = &joysticks;
    SDL_LockJoysticks_REAL();
    SDL_joysticks_quitting = @"true" != 0;
    joysticks = SDL_GetJoysticks_REAL(null);
    if (joysticks != null) {
        {
            i = 0;
            while (joysticks[@bitCast(@as(isize, @intCast(i)))] != 0) : (i += 1) {
                SDL_PrivateJoystickRemoved(joysticks[@bitCast(@as(isize, @intCast(i)))]);
            }
        }
        SDL_free_REAL(@ptrCast(@alignCast(joysticks)));
    }
    while (SDL_joysticks != null) {
        SDL_joysticks.*.ref_count = 1;
        SDL_CloseJoystick_REAL(SDL_joysticks);
    }
    {
        i = @bitCast(@as(c_uint, @truncate((@sizeOf(@TypeOf(SDL_joystick_drivers)) / @sizeOf(@TypeOf(SDL_joystick_drivers[@as(c_int, 0)]))) -% @as(c_ulong, 1))));
        while (i >= @as(c_int, 0)) : (i -= 1) {
            SDL_joystick_drivers[@bitCast(@as(isize, @intCast(i)))].*.Quit.?();
        }
    }
    if (SDL_joystick_players != null) {
        SDL_free_REAL(@ptrCast(@alignCast(SDL_joystick_players)));
        SDL_joystick_players = null;
        SDL_joystick_player_count = 0;
    }
    SDL_QuitSubSystem_REAL(SDL_INIT_EVENTS);
    SDL_QuitSteamVirtualGamepadInfo();
    SDL_RemoveHintCallback_REAL("SDL_JOYSTICK_ALLOW_BACKGROUND_EVENTS", SDL_JoystickAllowBackgroundEventsChanged, null);
    SDL_FreeVIDPIDList(&old_xboxone_controllers);
    SDL_FreeVIDPIDList(&arcadestick_devices);
    SDL_FreeVIDPIDList(&blacklist_devices);
    SDL_FreeVIDPIDList(&drum_devices);
    SDL_FreeVIDPIDList(&flightstick_devices);
    SDL_FreeVIDPIDList(&gamecube_devices);
    SDL_FreeVIDPIDList(&guitar_devices);
    SDL_FreeVIDPIDList(&rog_gamepad_mice);
    SDL_FreeVIDPIDList(&throttle_devices);
    SDL_FreeVIDPIDList(&wheel_devices);
    SDL_FreeVIDPIDList(&zero_centered_devices);
    SDL_QuitGamepadMappings();
    if (SDL_joystick_names != null) {
        SDL_DestroyHashTable(SDL_joystick_names);
        SDL_joystick_names = null;
    }
    SDL_joysticks_quitting = @"false" != 0;
    SDL_joysticks_initialized = @"false" != 0;
    SDL_UnlockJoysticks_REAL();
}
pub fn SDL_PrivateJoystickShouldIgnoreEvent() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (SDL_joystick_allows_background_events) {
        return @"false" != 0;
    }
    if (SDL_HasWindows() and (@as(?*anyopaque, @ptrCast(@alignCast(SDL_GetKeyboardFocus_REAL()))) == @as(?*anyopaque, null))) {
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub export fn SDL_PrivateJoystickAddTouchpad(joystick: [*c]SDL_Joystick, nfingers: c_int) void {
    @setEvalBranchQuota(100000);
    var ntouchpads: c_int = undefined;
    _ = &ntouchpads;
    var touchpads: [*c]SDL_JoystickTouchpadInfo = undefined;
    _ = &touchpads;
    SDL_AssertJoysticksLocked();
    ntouchpads = joystick.*.ntouchpads + @as(c_int, 1);
    touchpads = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(joystick.*.touchpads)), @as(c_ulong, @bitCast(@as(c_long, ntouchpads))) *% @sizeOf(SDL_JoystickTouchpadInfo))));
    if (touchpads != null) {
        var touchpad: [*c]SDL_JoystickTouchpadInfo = &touchpads[@bitCast(@as(isize, @intCast(ntouchpads - @as(c_int, 1))))];
        _ = &touchpad;
        var fingers: [*c]SDL_JoystickTouchpadFingerInfo = @ptrCast(@alignCast(SDL_calloc_REAL(@bitCast(@as(c_long, nfingers)), @sizeOf(SDL_JoystickTouchpadFingerInfo))));
        _ = &fingers;
        if (fingers != null) {
            touchpad.*.nfingers = nfingers;
            touchpad.*.fingers = fingers;
        } else {
            touchpad.*.nfingers = 0;
            touchpad.*.fingers = null;
        }
        joystick.*.ntouchpads = ntouchpads;
        joystick.*.touchpads = touchpads;
    }
}
pub export fn SDL_PrivateJoystickAddSensor(joystick: [*c]SDL_Joystick, arg_type: SDL_SensorType, rate: f32) void {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var nsensors: c_int = undefined;
    _ = &nsensors;
    var sensors: [*c]SDL_JoystickSensorInfo = undefined;
    _ = &sensors;
    SDL_AssertJoysticksLocked();
    nsensors = joystick.*.nsensors + @as(c_int, 1);
    sensors = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(joystick.*.sensors)), @as(c_ulong, @bitCast(@as(c_long, nsensors))) *% @sizeOf(SDL_JoystickSensorInfo))));
    if (sensors != null) {
        var sensor: [*c]SDL_JoystickSensorInfo = &sensors[@bitCast(@as(isize, @intCast(nsensors - @as(c_int, 1))))];
        _ = &sensor;
        _ = memset(@ptrCast(@alignCast(sensor)), 0, @sizeOf(@TypeOf(sensor.*)));
        sensor.*.type = @"type";
        sensor.*.rate = rate;
        joystick.*.nsensors = nsensors;
        joystick.*.sensors = sensors;
    }
}
pub export fn SDL_PrivateJoystickSensorRate(joystick: [*c]SDL_Joystick, arg_type: SDL_SensorType, rate: f32) void {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var i: c_int = undefined;
    _ = &i;
    SDL_AssertJoysticksLocked();
    {
        i = 0;
        while (i < joystick.*.nsensors) : (i += 1) {
            if (joystick.*.sensors[@bitCast(@as(isize, @intCast(i)))].type == @"type") {
                joystick.*.sensors[@bitCast(@as(isize, @intCast(i)))].rate = rate;
            }
        }
    }
}
pub export fn SDL_PrivateJoystickAddCapSense(joystick: [*c]SDL_Joystick, arg_type: SDL_GamepadCapSenseType) void {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var ncapsenses: c_int = undefined;
    _ = &ncapsenses;
    var capsenses: [*c]SDL_JoystickCapSenseInfo = undefined;
    _ = &capsenses;
    SDL_AssertJoysticksLocked();
    ncapsenses = joystick.*.ncapsenses + @as(c_int, 1);
    capsenses = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(joystick.*.capsenses)), @as(c_ulong, @bitCast(@as(c_long, ncapsenses))) *% @sizeOf(SDL_JoystickCapSenseInfo))));
    if (capsenses != null) {
        var capsense: [*c]SDL_JoystickCapSenseInfo = &capsenses[@bitCast(@as(isize, @intCast(ncapsenses - @as(c_int, 1))))];
        _ = &capsense;
        capsense.*.type = @"type";
        capsense.*.down = @"false" != 0;
        joystick.*.ncapsenses = ncapsenses;
        joystick.*.capsenses = capsenses;
    }
}
pub export fn SDL_PrivateJoystickAdded(instance_id: SDL_JoystickID) void {
    @setEvalBranchQuota(100000);
    var driver: [*c]SDL_JoystickDriver = undefined;
    _ = &driver;
    var device_index: c_int = undefined;
    _ = &device_index;
    var player_index: c_int = -@as(c_int, 1);
    _ = &player_index;
    var is_gamepad: bool = undefined;
    _ = &is_gamepad;
    SDL_AssertJoysticksLocked();
    if (SDL_JoysticksQuitting()) {
        return;
    }
    SDL_joystick_being_added = @"true" != 0;
    if (SDL_GetDriverAndJoystickIndex(instance_id, &driver, &device_index)) {
        player_index = driver.*.GetDeviceSteamVirtualGamepadSlot.?(device_index);
        if (player_index < @as(c_int, 0)) {
            player_index = driver.*.GetDevicePlayerIndex.?(device_index);
        }
    }
    if ((player_index < @as(c_int, 0)) and SDL_IsGamepad_REAL(instance_id)) {
        player_index = SDL_FindFreePlayerIndex();
    }
    if (player_index >= @as(c_int, 0)) {
        _ = SDL_SetJoystickIDForPlayerIndex(player_index, instance_id);
    }
    _ = SDL_UpdateJoystickNameForID(instance_id);
    {
        var event: SDL_Event = undefined;
        _ = &event;
        event.type = SDL_EVENT_JOYSTICK_ADDED;
        event.common.timestamp = 0;
        if (SDL_EventEnabled_REAL(event.type)) {
            event.jdevice.which = instance_id;
            _ = SDL_PushEvent_REAL(&event);
        }
    }
    is_gamepad = SDL_IsGamepad_REAL(instance_id);
    SDL_joystick_being_added = @"false" != 0;
    if (is_gamepad) {
        SDL_PrivateGamepadAdded(instance_id);
    }
}
pub export fn SDL_IsJoystickBeingAdded() bool {
    @setEvalBranchQuota(100000);
    return SDL_joystick_being_added;
}
pub export fn SDL_PrivateJoystickForceRecentering(joystick: [*c]SDL_Joystick) void {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var j: c_int = undefined;
    _ = &j;
    var timestamp: Uint64 = SDL_GetTicksNS_REAL();
    _ = &timestamp;
    SDL_AssertJoysticksLocked();
    {
        i = 0;
        while (i < joystick.*.naxes) : (i += 1) {
            if (joystick.*.axes[@bitCast(@as(isize, @intCast(i)))].has_initial_value) {
                SDL_SendJoystickAxis(timestamp, joystick, @bitCast(@as(i8, @truncate(i))), joystick.*.axes[@bitCast(@as(isize, @intCast(i)))].zero);
            }
        }
    }
    {
        i = 0;
        while (i < joystick.*.nbuttons) : (i += 1) {
            SDL_SendJoystickButton(timestamp, joystick, @bitCast(@as(i8, @truncate(i))), @"false" != 0);
        }
    }
    {
        i = 0;
        while (i < joystick.*.nhats) : (i += 1) {
            SDL_SendJoystickHat(timestamp, joystick, @bitCast(@as(i8, @truncate(i))), SDL_HAT_CENTERED);
        }
    }
    {
        i = 0;
        while (i < joystick.*.ntouchpads) : (i += 1) {
            var touchpad: [*c]SDL_JoystickTouchpadInfo = &joystick.*.touchpads[@bitCast(@as(isize, @intCast(i)))];
            _ = &touchpad;
            {
                j = 0;
                while (j < touchpad.*.nfingers) : (j += 1) {
                    SDL_SendJoystickTouchpad(timestamp, joystick, i, j, @"false" != 0, 0.0, 0.0, 0.0);
                }
            }
        }
    }
}
pub export fn SDL_PrivateJoystickRemoved(instance_id: SDL_JoystickID) void {
    @setEvalBranchQuota(100000);
    var joystick: [*c]SDL_Joystick = null;
    _ = &joystick;
    var player_index: c_int = undefined;
    _ = &player_index;
    var event: SDL_Event = undefined;
    _ = &event;
    SDL_AssertJoysticksLocked();
    {
        joystick = SDL_joysticks;
        while (joystick != null) : (joystick = joystick.*.next) {
            if (joystick.*.instance_id == instance_id) {
                SDL_PrivateJoystickForceRecentering(joystick);
                joystick.*.attached = @"false" != 0;
                break;
            }
        }
    }
    if (SDL_IsGamepad_REAL(instance_id)) {
        SDL_PrivateGamepadRemoved(instance_id);
    }
    event.type = SDL_EVENT_JOYSTICK_REMOVED;
    event.common.timestamp = 0;
    if (SDL_EventEnabled_REAL(event.type)) {
        event.jdevice.which = instance_id;
        _ = SDL_PushEvent_REAL(&event);
    }
    player_index = SDL_GetPlayerIndexForJoystickID(instance_id);
    if (player_index >= @as(c_int, 0)) {
        SDL_joystick_players[@bitCast(@as(isize, @intCast(player_index)))] = 0;
    }
}
pub export fn SDL_SendJoystickAxis(timestamp: Uint64, joystick: [*c]SDL_Joystick, axis: Uint8, value: Sint16) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [20:0]u8 = "SDL_SendJoystickAxis".*;
    };
    _ = &static_local___func__;
    var info: [*c]SDL_JoystickAxisInfo = undefined;
    _ = &info;
    SDL_AssertJoysticksLocked();
    if (@as(c_int, axis) >= joystick.*.naxes) {
        return;
    }
    info = &joystick.*.axes[axis];
    if (!info.*.has_initial_value or ((!info.*.has_second_value and ((@as(c_int, info.*.initial_value) <= -@as(c_int, 32767)) or (@as(c_int, info.*.initial_value) == @as(c_int, 32767)))) and (SDL_abs_REAL(value) < @divTrunc(SDL_JOYSTICK_AXIS_MAX, @as(c_int, 4))))) {
        info.*.initial_value = value;
        info.*.value = value;
        info.*.zero = value;
        info.*.has_initial_value = @"true" != 0;
    } else if ((@as(c_int, value) == @as(c_int, info.*.value)) and !info.*.sending_initial_value) {
        return;
    } else {
        info.*.has_second_value = @"true" != 0;
    }
    if (!info.*.sent_initial_value) {
        const MAX_ALLOWED_JITTER: c_int = @divTrunc(SDL_JOYSTICK_AXIS_MAX, @as(c_int, 80));
        _ = &MAX_ALLOWED_JITTER;
        if ((SDL_abs_REAL(@as(c_int, value) - @as(c_int, info.*.value)) <= MAX_ALLOWED_JITTER) and !SDL_IsJoystickVIRTUAL(joystick.*.guid)) {
            return;
        }
        info.*.sent_initial_value = @"true" != 0;
        info.*.sending_initial_value = @"true" != 0;
        SDL_SendJoystickAxis(timestamp, joystick, axis, info.*.initial_value);
        info.*.sending_initial_value = @"false" != 0;
    }
    if (SDL_PrivateJoystickShouldIgnoreEvent()) {
        if ((info.*.sending_initial_value or ((@as(c_int, value) > @as(c_int, info.*.zero)) and (@as(c_int, value) >= @as(c_int, info.*.value)))) or ((@as(c_int, value) < @as(c_int, info.*.zero)) and (@as(c_int, value) <= @as(c_int, info.*.value)))) {
            return;
        }
    }
    while (true) {
        while (!(timestamp != @as(Uint64, 0))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "timestamp != 0",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_joystick.c", 2772);
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
    info.*.value = value;
    joystick.*.update_complete = timestamp;
    if (SDL_EventEnabled_REAL(SDL_EVENT_JOYSTICK_AXIS_MOTION)) {
        var event: SDL_Event = undefined;
        _ = &event;
        event.type = SDL_EVENT_JOYSTICK_AXIS_MOTION;
        event.common.timestamp = timestamp;
        event.jaxis.which = joystick.*.instance_id;
        event.jaxis.axis = axis;
        event.jaxis.value = value;
        _ = SDL_PushEvent_REAL(&event);
    }
}
pub export fn SDL_SendJoystickBall(timestamp: Uint64, joystick: [*c]SDL_Joystick, ball: Uint8, xrel: Sint16, yrel: Sint16) void {
    @setEvalBranchQuota(100000);
    SDL_AssertJoysticksLocked();
    if (@as(c_int, ball) >= joystick.*.nballs) {
        return;
    }
    if (SDL_PrivateJoystickShouldIgnoreEvent()) {
        return;
    }
    joystick.*.balls[ball].dx += xrel;
    joystick.*.balls[ball].dy += yrel;
    if (SDL_EventEnabled_REAL(SDL_EVENT_JOYSTICK_BALL_MOTION)) {
        var event: SDL_Event = undefined;
        _ = &event;
        event.type = SDL_EVENT_JOYSTICK_BALL_MOTION;
        event.common.timestamp = timestamp;
        event.jball.which = joystick.*.instance_id;
        event.jball.ball = ball;
        event.jball.xrel = xrel;
        event.jball.yrel = yrel;
        _ = SDL_PushEvent_REAL(&event);
    }
}
pub export fn SDL_SendJoystickHat(timestamp: Uint64, joystick: [*c]SDL_Joystick, hat: Uint8, value: Uint8) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [19:0]u8 = "SDL_SendJoystickHat".*;
    };
    _ = &static_local___func__;
    SDL_AssertJoysticksLocked();
    if (@as(c_int, hat) >= joystick.*.nhats) {
        return;
    }
    if (@as(c_int, value) == @as(c_int, joystick.*.hats[hat])) {
        return;
    }
    if (SDL_PrivateJoystickShouldIgnoreEvent()) {
        if (@as(c_uint, @bitCast(@as(c_int, @as(c_int, value)))) != SDL_HAT_CENTERED) {
            return;
        }
    }
    while (true) {
        while (!(timestamp != @as(Uint64, 0))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "timestamp != 0",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_joystick.c", 2841);
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
    joystick.*.hats[hat] = value;
    joystick.*.update_complete = timestamp;
    if (SDL_EventEnabled_REAL(SDL_EVENT_JOYSTICK_HAT_MOTION)) {
        var event: SDL_Event = undefined;
        _ = &event;
        event.type = SDL_EVENT_JOYSTICK_HAT_MOTION;
        event.common.timestamp = timestamp;
        event.jhat.which = joystick.*.instance_id;
        event.jhat.hat = hat;
        event.jhat.value = value;
        _ = SDL_PushEvent_REAL(&event);
    }
}
pub export fn SDL_SendJoystickButton(timestamp: Uint64, joystick: [*c]SDL_Joystick, arg_button: Uint8, down: bool) void {
    @setEvalBranchQuota(100000);
    var button = arg_button;
    _ = &button;
    const static_local___func__ = struct {
        const __func__: [22:0]u8 = "SDL_SendJoystickButton".*;
    };
    _ = &static_local___func__;
    var event: SDL_Event = undefined;
    _ = &event;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "timestamp != 0",
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
                SDL_AssertJoysticksLocked();
                if (down) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                event.type = SDL_EVENT_JOYSTICK_BUTTON_DOWN;
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            2 => {
                event.type = SDL_EVENT_JOYSTICK_BUTTON_UP;
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                if (joystick.*.swap_face_buttons) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                switch (@as(c_int, button)) {
                    @as(c_int, 0) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 11;
                        continue;
                    },
                    else => {
                        sdl_pc = 12;
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
                if (@as(c_int, button) >= joystick.*.nbuttons) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            7 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            8 => {
                button = 1;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            9 => {
                button = 0;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            10 => {
                button = 3;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            11 => {
                button = 2;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            13 => {
                return;
            },
            14 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                if (@as(c_int, @intFromBool(down)) == @as(c_int, @intFromBool(joystick.*.buttons[button]))) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            16 => {
                return;
            },
            17 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            18 => {
                if (SDL_PrivateJoystickShouldIgnoreEvent()) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            19 => {
                if (down) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
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
                    sdl_pc = 25;
                    continue;
                }
            },
            22 => {
                return;
            },
            23 => {
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            24 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            25 => {
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            26 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            27 => {
                joystick.*.buttons[button] = down;
                joystick.*.update_complete = timestamp;
                if (SDL_EventEnabled_REAL(event.type)) {
                    sdl_pc = 37;
                    continue;
                } else {
                    sdl_pc = 38;
                    continue;
                }
            },
            28 => {
                if (!(timestamp != @as(Uint64, 0))) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            29 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_joystick.c", 2905);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 31;
                    continue;
                } else {
                    sdl_pc = 32;
                    continue;
                }
            },
            30 => {
                {
                    sdl_pc = 26;
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
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 34;
                    continue;
                } else {
                    sdl_pc = 35;
                    continue;
                }
            },
            33 => {
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            34 => {
                __builtin.debugtrap();
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
                    sdl_pc = 33;
                    continue;
                }
            },
            37 => {
                event.common.timestamp = timestamp;
                event.jbutton.which = joystick.*.instance_id;
                event.jbutton.button = button;
                event.jbutton.down = down;
                _ = SDL_PushEvent_REAL(&event);
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            38 => {
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            39 => {
                {}
            },
            else => unreachable,
        }
    }
}
pub fn SendSteamHandleUpdateEvents() callconv(.c) void {
    @setEvalBranchQuota(100000);
    var joystick: [*c]SDL_Joystick = undefined;
    _ = &joystick;
    var info: [*c]const SDL_SteamVirtualGamepadInfo = undefined;
    _ = &info;
    SDL_AssertJoysticksLocked();
    {
        joystick = SDL_joysticks;
        while (joystick != null) : (joystick = joystick.*.next) {
            var changed: bool = @"false" != 0;
            _ = &changed;
            if (!SDL_IsGamepad_REAL(joystick.*.instance_id)) {
                continue;
            }
            info = SDL_GetJoystickVirtualGamepadInfoForID(joystick.*.instance_id);
            if (info != null) {
                if (joystick.*.steam_handle != info.*.handle) {
                    joystick.*.steam_handle = info.*.handle;
                    joystick.*.swap_face_buttons = ShouldSwapFaceButtons(info);
                    changed = @"true" != 0;
                }
            } else {
                if (joystick.*.steam_handle != @as(Uint64, 0)) {
                    joystick.*.steam_handle = 0;
                    joystick.*.swap_face_buttons = @"false" != 0;
                    changed = @"true" != 0;
                }
            }
            if (changed) {
                var event: SDL_Event = undefined;
                _ = &event;
                _ = memset(@ptrCast(@alignCast(&event)), 0, @sizeOf(@TypeOf(event)));
                event.type = SDL_EVENT_GAMEPAD_STEAM_HANDLE_UPDATED;
                event.common.timestamp = 0;
                event.gdevice.which = joystick.*.instance_id;
                _ = SDL_PushEvent_REAL(&event);
            }
        }
    }
}
pub export fn SDL_UpdateJoysticks_REAL() void {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var now: Uint64 = undefined;
    _ = &now;
    var joystick: [*c]SDL_Joystick = undefined;
    _ = &joystick;
    if (!SDL_joysticks_initialized) {
        return;
    }
    SDL_LockJoysticks_REAL();
    if (SDL_UpdateSteamVirtualGamepadInfo()) {
        SendSteamHandleUpdateEvents();
    }
    HIDAPI_UpdateDevices();
    {
        joystick = SDL_joysticks;
        while (joystick != null) : (joystick = joystick.*.next) {
            if (!joystick.*.attached) {
                continue;
            }
            joystick.*.driver.*.Update.?(joystick);
            if (joystick.*.delayed_guide_button) {
                SDL_GamepadHandleDelayedGuideButton(joystick);
            }
            now = SDL_GetTicks_REAL();
            if ((joystick.*.rumble_expiration != 0) and (@as(Uint64, @bitCast(@as(c_long, @intFromBool(now >= joystick.*.rumble_expiration)))) != 0)) {
                _ = SDL_RumbleJoystick_REAL(joystick, 0, 0, 0);
                joystick.*.rumble_resend = 0;
            }
            if ((joystick.*.rumble_resend != 0) and (@as(Uint64, @bitCast(@as(c_long, @intFromBool(now >= joystick.*.rumble_resend)))) != 0)) {
                _ = joystick.*.driver.*.Rumble.?(joystick, joystick.*.low_frequency_rumble, joystick.*.high_frequency_rumble);
                joystick.*.rumble_resend = now +% @as(Uint64, SDL_RUMBLE_RESEND_MS);
                if (joystick.*.rumble_resend == @as(Uint64, 0)) {
                    joystick.*.rumble_resend = 1;
                }
            }
            if ((joystick.*.trigger_rumble_expiration != 0) and (@as(Uint64, @bitCast(@as(c_long, @intFromBool(now >= joystick.*.trigger_rumble_expiration)))) != 0)) {
                _ = SDL_RumbleJoystickTriggers_REAL(joystick, 0, 0, 0);
                joystick.*.trigger_rumble_resend = 0;
            }
            if ((joystick.*.trigger_rumble_resend != 0) and (@as(Uint64, @bitCast(@as(c_long, @intFromBool(now >= joystick.*.trigger_rumble_resend)))) != 0)) {
                _ = joystick.*.driver.*.RumbleTriggers.?(joystick, joystick.*.left_trigger_rumble, joystick.*.right_trigger_rumble);
                joystick.*.trigger_rumble_resend = now +% @as(Uint64, SDL_RUMBLE_RESEND_MS);
                if (joystick.*.trigger_rumble_resend == @as(Uint64, 0)) {
                    joystick.*.trigger_rumble_resend = 1;
                }
            }
        }
    }
    if (SDL_EventEnabled_REAL(SDL_EVENT_JOYSTICK_UPDATE_COMPLETE)) {
        {
            joystick = SDL_joysticks;
            while (joystick != null) : (joystick = joystick.*.next) {
                if (joystick.*.update_complete != 0) {
                    var event: SDL_Event = undefined;
                    _ = &event;
                    event.type = SDL_EVENT_JOYSTICK_UPDATE_COMPLETE;
                    event.common.timestamp = joystick.*.update_complete;
                    event.jdevice.which = joystick.*.instance_id;
                    _ = SDL_PushEvent_REAL(&event);
                    joystick.*.update_complete = 0;
                }
            }
        }
    }
    {
        i = 0;
        while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(SDL_joystick_drivers)) / @sizeOf(@TypeOf(SDL_joystick_drivers[@as(c_int, 0)])))) : (i += 1) {
            SDL_joystick_drivers[@bitCast(@as(isize, @intCast(i)))].*.Detect.?();
        }
    }
    SDL_UnlockJoysticks_REAL();
}
pub const SDL_joystick_event_list: [8]Uint32 = [8]Uint32{
    SDL_EVENT_JOYSTICK_AXIS_MOTION,
    SDL_EVENT_JOYSTICK_BALL_MOTION,
    SDL_EVENT_JOYSTICK_HAT_MOTION,
    SDL_EVENT_JOYSTICK_BUTTON_DOWN,
    SDL_EVENT_JOYSTICK_BUTTON_UP,
    SDL_EVENT_JOYSTICK_ADDED,
    SDL_EVENT_JOYSTICK_REMOVED,
    SDL_EVENT_JOYSTICK_BATTERY_UPDATED,
};
pub export fn SDL_SetJoystickEventsEnabled_REAL(enabled: bool) void {
    @setEvalBranchQuota(100000);
    var i: c_uint = undefined;
    _ = &i;
    {
        i = 0;
        while (@as(c_ulong, i) < (@sizeOf(@TypeOf(SDL_joystick_event_list)) / @sizeOf(@TypeOf(SDL_joystick_event_list[@as(c_int, 0)])))) : (i +%= 1) {
            SDL_SetEventEnabled_REAL(SDL_joystick_event_list[i], enabled);
        }
    }
}
pub export fn SDL_JoystickEventsEnabled_REAL() bool {
    @setEvalBranchQuota(100000);
    var enabled: bool = @"false" != 0;
    _ = &enabled;
    var i: c_uint = undefined;
    _ = &i;
    {
        i = 0;
        while (@as(c_ulong, i) < (@sizeOf(@TypeOf(SDL_joystick_event_list)) / @sizeOf(@TypeOf(SDL_joystick_event_list[@as(c_int, 0)])))) : (i +%= 1) {
            enabled = SDL_EventEnabled_REAL(SDL_joystick_event_list[i]);
            if (enabled) {
                break;
            }
        }
    }
    return enabled;
}
pub export fn SDL_GetJoystickGUIDInfo_REAL(guid: SDL_GUID, vendor: ?*u16, product: ?*u16, version: ?*u16, crc: ?*u16) void {
    const bus = @import("std").mem.readInt(u16, guid.data[0..2], .little);
    const recognized = bus < ' ' or bus == SDL_HARDWARE_BUS_VIRTUAL;
    const standard = recognized and @import("std").mem.readInt(u16, guid.data[6..8], .little) == 0 and @import("std").mem.readInt(u16, guid.data[10..12], .little) == 0;
    if (vendor) |value| value.* = if (standard) @import("std").mem.readInt(u16, guid.data[4..6], .little) else 0;
    if (product) |value| value.* = if (standard) @import("std").mem.readInt(u16, guid.data[8..10], .little) else 0;
    if (version) |value| value.* = if (standard) @import("std").mem.readInt(u16, guid.data[12..14], .little) else 0;
    if (crc) |value| value.* = if (recognized) @import("std").mem.readInt(u16, guid.data[2..4], .little) else 0;
}

pub export fn SDL_CreateJoystickName(vendor: Uint16, product: Uint16, vendor_name: [*c]const u8, product_name: [*c]const u8) [*c]u8 {
    @setEvalBranchQuota(100000);
    var custom_name: [*c]const u8 = GuessControllerName(vendor, product);
    _ = &custom_name;
    if (custom_name != null) {
        return SDL_strdup_REAL(custom_name);
    }
    return SDL_CreateDeviceName(vendor, product, vendor_name, product_name, "Controller");
}
pub export fn SDL_CreateJoystickGUID(bus: Uint16, vendor: Uint16, product: Uint16, version: Uint16, vendor_name: [*c]const u8, product_name: [*c]const u8, driver_signature: Uint8, driver_data: Uint8) SDL_GUID {
    @setEvalBranchQuota(100000);
    var guid: SDL_GUID = undefined;
    _ = &guid;
    var guid16: [*c]Uint16 = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&guid.data)))));
    _ = &guid16;
    var crc: Uint16 = 0;
    _ = &crc;
    _ = memset(@ptrCast(@alignCast(&guid)), 0, @sizeOf(@TypeOf(guid)));
    if ((((vendor_name != null) and (@as(c_int, vendor_name.*) != 0)) and (product_name != null)) and (@as(c_int, product_name.*) != 0)) {
        crc = SDL_crc16_REAL(crc, @ptrCast(@alignCast(vendor_name)), SDL_strlen_REAL(vendor_name));
        crc = SDL_crc16_REAL(crc, @ptrCast(@alignCast(@as([*c]u8, @as([*c]u8, @constCast(" "))))), 1);
        crc = SDL_crc16_REAL(crc, @ptrCast(@alignCast(product_name)), SDL_strlen_REAL(product_name));
    } else if (product_name != null) {
        crc = SDL_crc16_REAL(crc, @ptrCast(@alignCast(product_name)), SDL_strlen_REAL(product_name));
    }
    (blk: {
        const ref = &guid16;
        const tmp = ref.*;
        ref.* += 1;
        break :blk tmp;
    }).* = bus;
    (blk: {
        const ref = &guid16;
        const tmp = ref.*;
        ref.* += 1;
        break :blk tmp;
    }).* = crc;
    if (@as(c_int, vendor) != 0) {
        (blk: {
            const ref = &guid16;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        }).* = vendor;
        (blk: {
            const ref = &guid16;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        }).* = 0;
        (blk: {
            const ref = &guid16;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        }).* = product;
        (blk: {
            const ref = &guid16;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        }).* = 0;
        (blk: {
            const ref = &guid16;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        }).* = version;
        guid.data[@as(c_int, 14)] = driver_signature;
        guid.data[@as(c_int, 15)] = driver_data;
    } else {
        var available_space: usize = @sizeOf(@TypeOf(guid.data)) -% @as(c_ulong, 4);
        _ = &available_space;
        if (@as(c_int, driver_signature) != 0) {
            available_space -%= 2;
            guid.data[@as(c_int, 14)] = driver_signature;
            guid.data[@as(c_int, 15)] = driver_data;
        }
        if (product_name != null) {
            _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(guid16)), product_name, available_space);
        }
    }
    return guid;
}
pub export fn SDL_CreateJoystickGUIDForName(name: [*c]const u8) SDL_GUID {
    @setEvalBranchQuota(100000);
    return SDL_CreateJoystickGUID(SDL_HARDWARE_BUS_UNKNOWN, 0, 0, 0, null, name, 0, 0);
}
pub export fn SDL_SetJoystickGUIDVendor(guid: [*c]SDL_GUID, vendor: Uint16) void {
    @setEvalBranchQuota(100000);
    var guid16: [*c]Uint16 = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&guid.*.data)))));
    _ = &guid16;
    guid16[@as(c_int, 2)] = vendor;
}
pub export fn SDL_SetJoystickGUIDProduct(guid: [*c]SDL_GUID, product: Uint16) void {
    @setEvalBranchQuota(100000);
    var guid16: [*c]Uint16 = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&guid.*.data)))));
    _ = &guid16;
    guid16[@as(c_int, 4)] = product;
}
pub export fn SDL_SetJoystickGUIDVersion(guid: [*c]SDL_GUID, version: Uint16) void {
    @setEvalBranchQuota(100000);
    var guid16: [*c]Uint16 = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&guid.*.data)))));
    _ = &guid16;
    guid16[@as(c_int, 6)] = version;
}
pub export fn SDL_SetJoystickGUIDCRC(guid: [*c]SDL_GUID, crc: Uint16) void {
    @setEvalBranchQuota(100000);
    var guid16: [*c]Uint16 = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&guid.*.data)))));
    _ = &guid16;
    guid16[@as(c_int, 1)] = crc;
}
pub export fn SDL_GetGamepadTypeFromVIDPID(vendor: Uint16, product: Uint16, name: [*c]const u8, forUI: bool) SDL_GamepadType {
    @setEvalBranchQuota(100000);
    var @"type": SDL_GamepadType = undefined;
    _ = &@"type";
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                @"type" = SDL_GAMEPAD_TYPE_STANDARD;
                if ((@as(c_int, vendor) == @as(c_int, 0)) and (@as(c_int, product) == @as(c_int, 0))) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                if ((name != null) and (((SDL_strcmp_REAL(name, "Lic Pro Controller") == @as(c_int, 0)) or (SDL_strcmp_REAL(name, "Nintendo Wireless Gamepad") == @as(c_int, 0))) or (SDL_strcmp_REAL(name, "Wireless Gamepad") == @as(c_int, 0)))) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            2 => {
                if ((@as(c_int, vendor) == @as(c_int, 1)) and (@as(c_int, product) == @as(c_int, 1))) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            3 => {
                return @"type";
            },
            4 => {
                @"type" = SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_PRO;
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
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            7 => {
                @"type" = SDL_GAMEPAD_TYPE_STANDARD;
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                if ((@as(c_int, vendor) == USB_VENDOR_NINTENDO) and ((@as(c_int, product) == USB_PRODUCT_NINTENDO_SWITCH_JOYCON_LEFT) or (@as(c_int, product) == USB_PRODUCT_NINTENDO_SWITCH2_JOYCON_LEFT))) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            9 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            10 => {
                @"type" = SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_LEFT;
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                if ((@as(c_int, vendor) == USB_VENDOR_NINTENDO) and ((@as(c_int, product) == USB_PRODUCT_NINTENDO_SWITCH_JOYCON_RIGHT) or (@as(c_int, product) == USB_PRODUCT_NINTENDO_SWITCH2_JOYCON_RIGHT))) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
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
                if ((name != null) and (@as(?*anyopaque, @ptrCast(@alignCast(SDL_strstr_REAL(name, "NES Controller")))) != @as(?*anyopaque, null))) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            14 => {
                if ((@as(c_int, vendor) == USB_VENDOR_NINTENDO) and (@as(c_int, product) == USB_PRODUCT_NINTENDO_SWITCH_JOYCON_GRIP)) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
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
                @"type" = SDL_GAMEPAD_TYPE_STANDARD;
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            17 => {
                @"type" = SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_RIGHT;
                {
                    sdl_pc = 18;
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
                if ((name != null) and (@as(?*anyopaque, @ptrCast(@alignCast(SDL_strstr_REAL(name, "(L)")))) != @as(?*anyopaque, null))) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            20 => {
                if ((@as(c_int, vendor) == USB_VENDOR_NINTENDO) and ((@as(c_int, product) == USB_PRODUCT_NINTENDO_SWITCH_JOYCON_PAIR) or (@as(c_int, product) == USB_PRODUCT_NINTENDO_SWITCH2_JOYCON_PAIR))) {
                    sdl_pc = 28;
                    continue;
                } else {
                    sdl_pc = 29;
                    continue;
                }
            },
            21 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            22 => {
                @"type" = SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_LEFT;
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                if ((name != null) and (@as(?*anyopaque, @ptrCast(@alignCast(SDL_strstr_REAL(name, "L+R")))) != @as(?*anyopaque, null))) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            24 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            25 => {
                @"type" = SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_PAIR;
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            26 => {
                @"type" = SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_RIGHT;
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
                @"type" = SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_PAIR;
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            29 => {
                if (forUI and SDL_IsJoystickGameCube(vendor, product)) {
                    sdl_pc = 31;
                    continue;
                } else {
                    sdl_pc = 32;
                    continue;
                }
            },
            30 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            31 => {
                @"type" = SDL_GAMEPAD_TYPE_GAMECUBE;
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            32 => {
                switch (GuessControllerType(vendor, product)) {
                    k_eControllerType_XBox360Controller => {
                        sdl_pc = 35;
                        continue;
                    },
                    k_eControllerType_XBoxOneController => {
                        sdl_pc = 36;
                        continue;
                    },
                    k_eControllerType_XBoxEliteController => {
                        sdl_pc = 37;
                        continue;
                    },
                    k_eControllerType_PS3Controller => {
                        sdl_pc = 38;
                        continue;
                    },
                    k_eControllerType_PS4Controller => {
                        sdl_pc = 39;
                        continue;
                    },
                    k_eControllerType_PS5Controller => {
                        sdl_pc = 40;
                        continue;
                    },
                    k_eControllerType_PS5EdgeController => {
                        sdl_pc = 41;
                        continue;
                    },
                    k_eControllerType_XInputPS4Controller => {
                        sdl_pc = 42;
                        continue;
                    },
                    k_eControllerType_SwitchProController => {
                        sdl_pc = 46;
                        continue;
                    },
                    k_eControllerType_Switch2ProController => {
                        sdl_pc = 47;
                        continue;
                    },
                    k_eControllerType_SwitchInputOnlyController => {
                        sdl_pc = 48;
                        continue;
                    },
                    k_eControllerType_Switch2InputOnlyController => {
                        sdl_pc = 49;
                        continue;
                    },
                    k_eControllerType_XInputSwitchController => {
                        sdl_pc = 50;
                        continue;
                    },
                    k_eControllerType_SteamController => {
                        sdl_pc = 54;
                        continue;
                    },
                    k_eControllerType_SteamControllerV2 => {
                        sdl_pc = 55;
                        continue;
                    },
                    k_eControllerType_SteamControllerNeptune => {
                        sdl_pc = 56;
                        continue;
                    },
                    k_eControllerType_SteamControllerTriton => {
                        sdl_pc = 57;
                        continue;
                    },
                    k_eControllerType_HoriSteamController => {
                        sdl_pc = 58;
                        continue;
                    },
                    k_eControllerType_UnknownSteamController => {
                        sdl_pc = 59;
                        continue;
                    },
                    else => {
                        sdl_pc = 60;
                        continue;
                    },
                }
            },
            33 => {
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            34 => {
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            35 => {
                @"type" = SDL_GAMEPAD_TYPE_XBOX360;
                {
                    sdl_pc = 34;
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
                @"type" = SDL_GAMEPAD_TYPE_XBOXONE;
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            38 => {
                @"type" = SDL_GAMEPAD_TYPE_PS3;
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            39 => {
                @"type" = SDL_GAMEPAD_TYPE_PS4;
                {
                    sdl_pc = 34;
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
                @"type" = SDL_GAMEPAD_TYPE_PS5;
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            42 => {
                if (forUI) {
                    sdl_pc = 43;
                    continue;
                } else {
                    sdl_pc = 44;
                    continue;
                }
            },
            43 => {
                @"type" = SDL_GAMEPAD_TYPE_PS4;
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            44 => {
                @"type" = SDL_GAMEPAD_TYPE_STANDARD;
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            45 => {
                {
                    sdl_pc = 34;
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
                    sdl_pc = 48;
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
                @"type" = SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_PRO;
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            50 => {
                if (forUI) {
                    sdl_pc = 51;
                    continue;
                } else {
                    sdl_pc = 52;
                    continue;
                }
            },
            51 => {
                @"type" = SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_PRO;
                {
                    sdl_pc = 53;
                    continue;
                }
            },
            52 => {
                @"type" = SDL_GAMEPAD_TYPE_XBOX360;
                {
                    sdl_pc = 53;
                    continue;
                }
            },
            53 => {
                {
                    sdl_pc = 34;
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
                    sdl_pc = 56;
                    continue;
                }
            },
            56 => {
                {
                    sdl_pc = 57;
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
                    sdl_pc = 59;
                    continue;
                }
            },
            59 => {
                @"type" = SDL_GAMEPAD_TYPE_STEAM;
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            60 => {
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_GetGamepadTypeFromGUID(guid: SDL_GUID, name: [*c]const u8) SDL_GamepadType {
    @setEvalBranchQuota(100000);
    var @"type": SDL_GamepadType = undefined;
    _ = &@"type";
    var vendor: Uint16 = undefined;
    _ = &vendor;
    var product: Uint16 = undefined;
    _ = &product;
    SDL_GetJoystickGUIDInfo_REAL(guid, &vendor, &product, null, null);
    @"type" = SDL_GetGamepadTypeFromVIDPID(vendor, product, name, @"true" != 0);
    if (@"type" == @as(SDL_GamepadType, SDL_GAMEPAD_TYPE_STANDARD)) {
        if (SDL_IsJoystickXInput(guid)) {
            return SDL_GAMEPAD_TYPE_XBOXONE;
        }
        if (SDL_IsJoystickHIDAPI(guid)) {
            return HIDAPI_GetGamepadTypeFromGUID(guid);
        }
    }
    return @"type";
}
pub export fn SDL_JoystickGUIDUsesVersion(guid: SDL_GUID) bool {
    @setEvalBranchQuota(100000);
    var vendor: Uint16 = undefined;
    _ = &vendor;
    var product: Uint16 = undefined;
    _ = &product;
    if (SDL_IsJoystickMFI(guid)) {
        return @"false" != 0;
    }
    SDL_GetJoystickGUIDInfo_REAL(guid, &vendor, &product, null, null);
    if ((@as(c_int, vendor) != 0) and (@as(c_int, product) != 0)) {
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub export fn SDL_IsJoystickXboxOne(vendor_id: Uint16, product_id: Uint16) bool {
    @setEvalBranchQuota(100000);
    var eType: EControllerType = GuessControllerType(vendor_id, product_id);
    _ = &eType;
    return (eType == k_eControllerType_XBoxOneController) or (eType == k_eControllerType_XBoxEliteController);
}
pub export fn SDL_IsJoystickXboxOneElite(vendor_id: Uint16, product_id: Uint16) bool {
    @setEvalBranchQuota(100000);
    var eType: EControllerType = GuessControllerType(vendor_id, product_id);
    _ = &eType;
    return eType == k_eControllerType_XBoxEliteController;
}
pub export fn SDL_IsJoystickXboxSeriesX(vendor_id: Uint16, product_id: Uint16) bool {
    @setEvalBranchQuota(100000);
    if (SDL_VIDPIDInList(vendor_id, product_id, &old_xboxone_controllers)) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub export fn SDL_IsJoystickBluetoothXboxOne(vendor_id: Uint16, product_id: Uint16) bool {
    @setEvalBranchQuota(100000);
    if (@as(c_int, vendor_id) == USB_VENDOR_MICROSOFT) {
        if ((((((((@as(c_int, product_id) == USB_PRODUCT_XBOX_ONE_ADAPTIVE_BLUETOOTH) or (@as(c_int, product_id) == USB_PRODUCT_XBOX_ONE_ADAPTIVE_BLE)) or (@as(c_int, product_id) == USB_PRODUCT_XBOX_ONE_S_REV1_BLUETOOTH)) or (@as(c_int, product_id) == USB_PRODUCT_XBOX_ONE_S_REV2_BLUETOOTH)) or (@as(c_int, product_id) == USB_PRODUCT_XBOX_ONE_S_REV2_BLE)) or (@as(c_int, product_id) == USB_PRODUCT_XBOX_ONE_ELITE_SERIES_2_BLUETOOTH)) or (@as(c_int, product_id) == USB_PRODUCT_XBOX_ONE_ELITE_SERIES_2_BLE)) or (@as(c_int, product_id) == USB_PRODUCT_XBOX_SERIES_X_BLE)) {
            return @"true" != 0;
        }
    }
    return @"false" != 0;
}
pub export fn SDL_IsJoystickPS4(vendor_id: Uint16, product_id: Uint16) bool {
    @setEvalBranchQuota(100000);
    var eType: EControllerType = GuessControllerType(vendor_id, product_id);
    _ = &eType;
    return eType == k_eControllerType_PS4Controller;
}
pub export fn SDL_IsJoystickPS5(vendor_id: Uint16, product_id: Uint16) bool {
    @setEvalBranchQuota(100000);
    var eType: EControllerType = GuessControllerType(vendor_id, product_id);
    _ = &eType;
    return (eType == k_eControllerType_PS5Controller) or (eType == k_eControllerType_PS5EdgeController);
}
pub export fn SDL_IsJoystickDualSenseEdge(vendor_id: Uint16, product_id: Uint16) bool {
    @setEvalBranchQuota(100000);
    var eType: EControllerType = GuessControllerType(vendor_id, product_id);
    _ = &eType;
    return eType == k_eControllerType_PS5EdgeController;
}
pub export fn SDL_IsJoystickNintendoSwitchPro(vendor_id: Uint16, product_id: Uint16) bool {
    @setEvalBranchQuota(100000);
    var eType: EControllerType = GuessControllerType(vendor_id, product_id);
    _ = &eType;
    return (eType == k_eControllerType_SwitchProController) or (eType == k_eControllerType_SwitchInputOnlyController);
}
pub export fn SDL_IsJoystickNintendoSwitch2Pro(vendor_id: Uint16, product_id: Uint16) bool {
    @setEvalBranchQuota(100000);
    var eType: EControllerType = GuessControllerType(vendor_id, product_id);
    _ = &eType;
    return (eType == k_eControllerType_Switch2ProController) or (eType == k_eControllerType_Switch2InputOnlyController);
}
pub export fn SDL_IsJoystickNintendoSwitchProInputOnly(vendor_id: Uint16, product_id: Uint16) bool {
    @setEvalBranchQuota(100000);
    var eType: EControllerType = GuessControllerType(vendor_id, product_id);
    _ = &eType;
    return eType == k_eControllerType_SwitchInputOnlyController;
}
pub export fn SDL_IsJoystickNintendoSwitch2ProInputOnly(vendor_id: Uint16, product_id: Uint16) bool {
    @setEvalBranchQuota(100000);
    var eType: EControllerType = GuessControllerType(vendor_id, product_id);
    _ = &eType;
    return eType == k_eControllerType_Switch2InputOnlyController;
}
pub export fn SDL_IsJoystickNintendoSwitchJoyCon(vendor_id: Uint16, product_id: Uint16) bool {
    @setEvalBranchQuota(100000);
    var eType: EControllerType = GuessControllerType(vendor_id, product_id);
    _ = &eType;
    return (eType == k_eControllerType_SwitchJoyConLeft) or (eType == k_eControllerType_SwitchJoyConRight);
}
pub export fn SDL_IsJoystickNintendoSwitchJoyConLeft(vendor_id: Uint16, product_id: Uint16) bool {
    @setEvalBranchQuota(100000);
    var eType: EControllerType = GuessControllerType(vendor_id, product_id);
    _ = &eType;
    return eType == k_eControllerType_SwitchJoyConLeft;
}
pub export fn SDL_IsJoystickNintendoSwitchJoyConRight(vendor_id: Uint16, product_id: Uint16) bool {
    @setEvalBranchQuota(100000);
    var eType: EControllerType = GuessControllerType(vendor_id, product_id);
    _ = &eType;
    return eType == k_eControllerType_SwitchJoyConRight;
}
pub export fn SDL_IsJoystickNintendoSwitchJoyConGrip(vendor_id: Uint16, product_id: Uint16) bool {
    @setEvalBranchQuota(100000);
    return (@as(c_int, vendor_id) == USB_VENDOR_NINTENDO) and (@as(c_int, product_id) == USB_PRODUCT_NINTENDO_SWITCH_JOYCON_GRIP);
}
pub export fn SDL_IsJoystickNintendoSwitchJoyConPair(vendor_id: Uint16, product_id: Uint16) bool {
    @setEvalBranchQuota(100000);
    return (@as(c_int, vendor_id) == USB_VENDOR_NINTENDO) and ((@as(c_int, product_id) == USB_PRODUCT_NINTENDO_SWITCH_JOYCON_PAIR) or (@as(c_int, product_id) == USB_PRODUCT_NINTENDO_SWITCH2_JOYCON_PAIR));
}
pub export fn SDL_IsJoystickGameCube(vendor_id: Uint16, product_id: Uint16) bool {
    @setEvalBranchQuota(100000);
    return SDL_VIDPIDInList(vendor_id, product_id, &gamecube_devices);
}
pub export fn SDL_IsJoystickAmazonLunaController(vendor_id: Uint16, product_id: Uint16) bool {
    @setEvalBranchQuota(100000);
    return ((@as(c_int, vendor_id) == USB_VENDOR_AMAZON) and (@as(c_int, product_id) == USB_PRODUCT_AMAZON_LUNA_CONTROLLER)) or ((@as(c_int, vendor_id) == BLUETOOTH_VENDOR_AMAZON) and (@as(c_int, product_id) == BLUETOOTH_PRODUCT_LUNA_CONTROLLER));
}
pub export fn SDL_IsJoystickGoogleStadiaController(vendor_id: Uint16, product_id: Uint16) bool {
    @setEvalBranchQuota(100000);
    return (@as(c_int, vendor_id) == USB_VENDOR_GOOGLE) and (@as(c_int, product_id) == USB_PRODUCT_GOOGLE_STADIA_CONTROLLER);
}
pub export fn SDL_IsJoystickNVIDIASHIELDController(vendor_id: Uint16, product_id: Uint16) bool {
    @setEvalBranchQuota(100000);
    return (@as(c_int, vendor_id) == USB_VENDOR_NVIDIA) and ((@as(c_int, product_id) == USB_PRODUCT_NVIDIA_SHIELD_CONTROLLER_V103) or (@as(c_int, product_id) == USB_PRODUCT_NVIDIA_SHIELD_CONTROLLER_V104));
}
pub export fn SDL_IsJoystickSteamVirtualGamepad(vendor_id: Uint16, product_id: Uint16, _: Uint16) bool {
    @setEvalBranchQuota(100000);
    return (@as(c_int, vendor_id) == USB_VENDOR_VALVE) and (@as(c_int, product_id) == USB_PRODUCT_STEAM_VIRTUAL_GAMEPAD);
}
pub export fn SDL_IsJoystickSteamController(vendor_id: Uint16, product_id: Uint16) bool {
    @setEvalBranchQuota(100000);
    var eType: EControllerType = GuessControllerType(vendor_id, product_id);
    _ = &eType;
    return (eType == k_eControllerType_SteamController) or (eType == k_eControllerType_SteamControllerV2);
}
pub export fn SDL_IsJoystickHoriSteamController(vendor_id: Uint16, product_id: Uint16) bool {
    @setEvalBranchQuota(100000);
    var eType: EControllerType = GuessControllerType(vendor_id, product_id);
    _ = &eType;
    return eType == k_eControllerType_HoriSteamController;
}
pub export fn SDL_IsJoystickSInputController(vendor_id: Uint16, product_id: Uint16) bool {
    @setEvalBranchQuota(100000);
    if (@as(c_int, vendor_id) == USB_VENDOR_RASPBERRYPI) {
        if (((((@as(c_int, product_id) == USB_PRODUCT_HANDHELDLEGEND_SINPUT_GENERIC) or (@as(c_int, product_id) == USB_PRODUCT_HANDHELDLEGEND_PROGCC)) or (@as(c_int, product_id) == USB_PRODUCT_HANDHELDLEGEND_GCULTIMATE)) or (@as(c_int, product_id) == USB_PRODUCT_BONZIRICHANNEL_FIREBIRD)) or (@as(c_int, product_id) == USB_PRODUCT_VOIDGAMING_PS4FIREBIRD)) {
            return @"true" != 0;
        }
    }
    if (@as(c_int, vendor_id) == USB_VENDOR_ANDGAMER) {
        if (@as(c_int, product_id) == USB_PRODUCT_VOIDGAMING_GENESIS_SINPUT) {
            return @"true" != 0;
        }
    }
    return @"false" != 0;
}
pub export fn SDL_IsJoystickFlydigiController(vendor_id: Uint16, product_id: Uint16) bool {
    @setEvalBranchQuota(100000);
    if (@as(c_int, vendor_id) == USB_VENDOR_FLYDIGI_V1) {
        if (@as(c_int, product_id) == USB_PRODUCT_FLYDIGI_V1_GAMEPAD) {
            return @"true" != 0;
        }
    }
    if (@as(c_int, vendor_id) == USB_VENDOR_FLYDIGI_V2) {
        if (((@as(c_int, product_id) == USB_PRODUCT_FLYDIGI_V2_APEX) or (@as(c_int, product_id) == USB_PRODUCT_FLYDIGI_V2_VADER)) or (@as(c_int, product_id) == USB_PRODUCT_FLYDIGI_V2_APEX6)) {
            return @"true" != 0;
        }
    }
    return @"false" != 0;
}
pub export fn SDL_IsJoystickGameSirController(vendor_id: Uint16, product_id: Uint16) bool {
    @setEvalBranchQuota(100000);
    if (@as(c_int, vendor_id) != USB_VENDOR_GAMESIR) {
        return @"false" != 0;
    }
    return (@as(c_int, product_id) == USB_PRODUCT_GAMESIR_GAMEPAD_G7_PRO_8K) or (@as(c_int, product_id) == USB_PRODUCT_GAMESIR_GAMEPAD_TARANTULA_8K);
}
pub export fn SDL_IsJoystickSteamDeck(vendor_id: Uint16, product_id: Uint16) bool {
    @setEvalBranchQuota(100000);
    var eType: EControllerType = GuessControllerType(vendor_id, product_id);
    _ = &eType;
    return eType == k_eControllerType_SteamControllerNeptune;
}
pub export fn SDL_IsJoystickSteamTriton(vendor_id: Uint16, product_id: Uint16) bool {
    @setEvalBranchQuota(100000);
    var eType: EControllerType = GuessControllerType(vendor_id, product_id);
    _ = &eType;
    return eType == k_eControllerType_SteamControllerTriton;
}
pub export fn SDL_IsJoystickXInput(guid: SDL_GUID) bool {
    @setEvalBranchQuota(100000);
    return (if (@as(c_int, guid.data[@as(c_int, 14)]) == @as(c_int, 'x')) @"true" else @"false") != 0;
}
pub export fn SDL_IsJoystickWGI(guid: SDL_GUID) bool {
    @setEvalBranchQuota(100000);
    return (if (@as(c_int, guid.data[@as(c_int, 14)]) == @as(c_int, 'w')) @"true" else @"false") != 0;
}
pub export fn SDL_IsJoystickGameInput(guid: SDL_GUID) bool {
    @setEvalBranchQuota(100000);
    return (if (@as(c_int, guid.data[@as(c_int, 14)]) == @as(c_int, 'g')) @"true" else @"false") != 0;
}
pub export fn SDL_IsJoystickHIDAPI(guid: SDL_GUID) bool {
    @setEvalBranchQuota(100000);
    return (if (@as(c_int, guid.data[@as(c_int, 14)]) == @as(c_int, 'h')) @"true" else @"false") != 0;
}
pub export fn SDL_IsJoystickMFI(guid: SDL_GUID) bool {
    @setEvalBranchQuota(100000);
    return (if (@as(c_int, guid.data[@as(c_int, 14)]) == @as(c_int, 'm')) @"true" else @"false") != 0;
}
pub export fn SDL_IsJoystickRAWINPUT(guid: SDL_GUID) bool {
    @setEvalBranchQuota(100000);
    return (if (@as(c_int, guid.data[@as(c_int, 14)]) == @as(c_int, 'r')) @"true" else @"false") != 0;
}
pub export fn SDL_IsJoystickVIRTUAL(guid: SDL_GUID) bool {
    @setEvalBranchQuota(100000);
    return (if (@as(c_int, guid.data[@as(c_int, 14)]) == @as(c_int, 'v')) @"true" else @"false") != 0;
}
pub export fn SDL_IsJoystickWheel(vendor_id: Uint16, product_id: Uint16, crc: Uint16) bool {
    @setEvalBranchQuota(100000);
    if (((@as(c_int, vendor_id) == @as(c_int, 4607)) and (@as(c_int, product_id) == @as(c_int, 13105))) and ((@as(c_int, crc) == @as(c_int, 64246)) or (@as(c_int, crc) == @as(c_int, 8196)))) {
        return @"true" != 0;
    }
    return SDL_VIDPIDInList(vendor_id, product_id, &wheel_devices);
}
pub fn SDL_IsJoystickArcadeStick(vendor_id: Uint16, product_id: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_VIDPIDInList(vendor_id, product_id, &arcadestick_devices);
}
pub fn SDL_IsJoystickFlightStick(vendor_id: Uint16, product_id: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_VIDPIDInList(vendor_id, product_id, &flightstick_devices);
}
pub fn SDL_IsJoystickThrottle(vendor_id: Uint16, product_id: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_VIDPIDInList(vendor_id, product_id, &throttle_devices);
}
pub fn SDL_IsJoystickGuitar(vendor_id: Uint16, product_id: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_VIDPIDInList(vendor_id, product_id, &guitar_devices);
}
pub fn SDL_IsJoystickDrumKit(vendor_id: Uint16, product_id: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_VIDPIDInList(vendor_id, product_id, &drum_devices);
}
pub fn SDL_GetJoystickGUIDType(guid: SDL_GUID) callconv(.c) SDL_JoystickType {
    @setEvalBranchQuota(100000);
    var vendor: Uint16 = undefined;
    _ = &vendor;
    var product: Uint16 = undefined;
    _ = &product;
    var crc: Uint16 = undefined;
    _ = &crc;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                SDL_GetJoystickGUIDInfo_REAL(guid, &vendor, &product, null, &crc);
                if (SDL_IsJoystickWheel(vendor, product, crc)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return SDL_JOYSTICK_TYPE_WHEEL;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                if (SDL_IsJoystickArcadeStick(vendor, product)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                return SDL_JOYSTICK_TYPE_ARCADE_STICK;
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                if (SDL_IsJoystickFlightStick(vendor, product)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                return SDL_JOYSTICK_TYPE_FLIGHT_STICK;
            },
            8 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                if (SDL_IsJoystickThrottle(vendor, product)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                return SDL_JOYSTICK_TYPE_THROTTLE;
            },
            11 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                if (SDL_IsJoystickGuitar(vendor, product)) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            13 => {
                return SDL_JOYSTICK_TYPE_GUITAR;
            },
            14 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                if (SDL_IsJoystickDrumKit(vendor, product)) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            16 => {
                return SDL_JOYSTICK_TYPE_DRUM_KIT;
            },
            17 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            18 => {
                if (SDL_IsJoystickXInput(guid)) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            19 => {
                switch (@as(c_int, guid.data[@as(c_int, 15)])) {
                    @as(c_int, 1) => {
                        sdl_pc = 23;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 24;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 25;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 26;
                        continue;
                    },
                    @as(c_int, 5) => {
                        sdl_pc = 27;
                        continue;
                    },
                    @as(c_int, 6) => {
                        sdl_pc = 28;
                        continue;
                    },
                    @as(c_int, 7) => {
                        sdl_pc = 29;
                        continue;
                    },
                    @as(c_int, 11) => {
                        sdl_pc = 30;
                        continue;
                    },
                    @as(c_int, 8) => {
                        sdl_pc = 31;
                        continue;
                    },
                    @as(c_int, 19) => {
                        sdl_pc = 32;
                        continue;
                    },
                    else => {
                        sdl_pc = 33;
                        continue;
                    },
                }
            },
            20 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            21 => {
                if (SDL_IsJoystickWGI(guid)) {
                    sdl_pc = 34;
                    continue;
                } else {
                    sdl_pc = 35;
                    continue;
                }
            },
            22 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            23 => {
                return SDL_JOYSTICK_TYPE_GAMEPAD;
            },
            24 => {
                return SDL_JOYSTICK_TYPE_WHEEL;
            },
            25 => {
                return SDL_JOYSTICK_TYPE_ARCADE_STICK;
            },
            26 => {
                return SDL_JOYSTICK_TYPE_FLIGHT_STICK;
            },
            27 => {
                return SDL_JOYSTICK_TYPE_DANCE_PAD;
            },
            28 => {
                {
                    sdl_pc = 29;
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
                return SDL_JOYSTICK_TYPE_GUITAR;
            },
            31 => {
                return SDL_JOYSTICK_TYPE_DRUM_KIT;
            },
            32 => {
                return SDL_JOYSTICK_TYPE_ARCADE_PAD;
            },
            33 => {
                return SDL_JOYSTICK_TYPE_UNKNOWN;
            },
            34 => {
                return guid.data[@as(c_int, 15)];
            },
            35 => {
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            36 => {
                if (SDL_IsJoystickGameInput(guid)) {
                    sdl_pc = 37;
                    continue;
                } else {
                    sdl_pc = 38;
                    continue;
                }
            },
            37 => {
                return guid.data[@as(c_int, 15)];
            },
            38 => {
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            39 => {
                if (SDL_IsJoystickVIRTUAL(guid)) {
                    sdl_pc = 40;
                    continue;
                } else {
                    sdl_pc = 41;
                    continue;
                }
            },
            40 => {
                return guid.data[@as(c_int, 15)];
            },
            41 => {
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            42 => {
                if (SDL_IsJoystickHIDAPI(guid)) {
                    sdl_pc = 43;
                    continue;
                } else {
                    sdl_pc = 44;
                    continue;
                }
            },
            43 => {
                return HIDAPI_GetJoystickTypeFromGUID(guid);
            },
            44 => {
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            45 => {
                if (GuessControllerType(vendor, product) != k_eControllerType_UnknownNonSteamController) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 47;
                    continue;
                }
            },
            46 => {
                return SDL_JOYSTICK_TYPE_GAMEPAD;
            },
            47 => {
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            48 => {
                return SDL_JOYSTICK_TYPE_UNKNOWN;
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_ShouldIgnoreJoystick(vendor_id: Uint16, product_id: Uint16, version: Uint16, name: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    if (SDL_VIDPIDInList(vendor_id, product_id, &blacklist_devices)) {
        return @"true" != 0;
    }
    if (!SDL_GetHintBoolean_REAL("SDL_JOYSTICK_ROG_CHAKRAM", @"false" != 0)) {
        if (SDL_VIDPIDInList(vendor_id, product_id, &rog_gamepad_mice)) {
            return @"true" != 0;
        }
    }
    if (SDL_ShouldIgnoreGamepad(vendor_id, product_id, version, name)) {
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub export fn SDL_GetJoystickGUIDForID_REAL(instance_id: SDL_JoystickID) SDL_GUID {
    @setEvalBranchQuota(100000);
    var driver: [*c]SDL_JoystickDriver = undefined;
    _ = &driver;
    var device_index: c_int = undefined;
    _ = &device_index;
    var guid: SDL_GUID = undefined;
    _ = &guid;
    SDL_LockJoysticks_REAL();
    if (SDL_GetDriverAndJoystickIndex(instance_id, &driver, &device_index)) {
        guid = driver.*.GetDeviceGUID.?(device_index);
    } else {
        _ = memset(@ptrCast(@alignCast(&guid)), 0, @sizeOf(@TypeOf(guid)));
    }
    SDL_UnlockJoysticks_REAL();
    return guid;
}
pub export fn SDL_GetJoystickVendorForID_REAL(instance_id: SDL_JoystickID) Uint16 {
    @setEvalBranchQuota(100000);
    var vendor: Uint16 = undefined;
    _ = &vendor;
    var info: [*c]const SDL_SteamVirtualGamepadInfo = undefined;
    _ = &info;
    SDL_LockJoysticks_REAL();
    info = SDL_GetJoystickVirtualGamepadInfoForID(instance_id);
    if (info != null) {
        vendor = info.*.vendor_id;
    } else {
        var guid: SDL_GUID = SDL_GetJoystickGUIDForID_REAL(instance_id);
        _ = &guid;
        SDL_GetJoystickGUIDInfo_REAL(guid, &vendor, null, null, null);
    }
    SDL_UnlockJoysticks_REAL();
    return vendor;
}
pub export fn SDL_GetJoystickProductForID_REAL(instance_id: SDL_JoystickID) Uint16 {
    @setEvalBranchQuota(100000);
    var product: Uint16 = undefined;
    _ = &product;
    var info: [*c]const SDL_SteamVirtualGamepadInfo = undefined;
    _ = &info;
    SDL_LockJoysticks_REAL();
    info = SDL_GetJoystickVirtualGamepadInfoForID(instance_id);
    if (info != null) {
        product = info.*.product_id;
    } else {
        var guid: SDL_GUID = SDL_GetJoystickGUIDForID_REAL(instance_id);
        _ = &guid;
        SDL_GetJoystickGUIDInfo_REAL(guid, null, &product, null, null);
    }
    SDL_UnlockJoysticks_REAL();
    return product;
}
pub export fn SDL_GetJoystickProductVersionForID_REAL(instance_id: SDL_JoystickID) Uint16 {
    @setEvalBranchQuota(100000);
    var version: Uint16 = undefined;
    _ = &version;
    var guid: SDL_GUID = SDL_GetJoystickGUIDForID_REAL(instance_id);
    _ = &guid;
    SDL_GetJoystickGUIDInfo_REAL(guid, null, null, &version, null);
    return version;
}
pub export fn SDL_GetJoystickTypeForID_REAL(instance_id: SDL_JoystickID) SDL_JoystickType {
    @setEvalBranchQuota(100000);
    var @"type": SDL_JoystickType = undefined;
    _ = &@"type";
    var guid: SDL_GUID = SDL_GetJoystickGUIDForID_REAL(instance_id);
    _ = &guid;
    @"type" = SDL_GetJoystickGUIDType(guid);
    if (@"type" == @as(SDL_JoystickType, SDL_JOYSTICK_TYPE_UNKNOWN)) {
        if (SDL_IsGamepad_REAL(instance_id)) {
            @"type" = SDL_JOYSTICK_TYPE_GAMEPAD;
        }
    }
    return @"type";
}
pub export fn SDL_GetJoystickGUID_REAL(joystick: [*c]SDL_Joystick) SDL_GUID {
    @setEvalBranchQuota(100000);
    var result: SDL_GUID = undefined;
    _ = &result;
    SDL_LockJoysticks_REAL();
    {
        const static_local_emptyGUID = struct {
            var emptyGUID: SDL_GUID = @import("std").mem.zeroes(SDL_GUID);
        };
        _ = &static_local_emptyGUID;
        if (!SDL_ObjectValid(@ptrCast(@alignCast(joystick)), SDL_OBJECT_TYPE_JOYSTICK)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("joystick"))));
            SDL_UnlockJoysticks_REAL();
            return static_local_emptyGUID.emptyGUID;
        }
        result = joystick.*.guid;
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_GetJoystickVendor_REAL(joystick: [*c]SDL_Joystick) Uint16 {
    @setEvalBranchQuota(100000);
    var vendor: Uint16 = undefined;
    _ = &vendor;
    var info: [*c]const SDL_SteamVirtualGamepadInfo = undefined;
    _ = &info;
    SDL_LockJoysticks_REAL();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(joystick)), SDL_OBJECT_TYPE_JOYSTICK)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("joystick"))));
            SDL_UnlockJoysticks_REAL();
            return 0;
        }
        info = SDL_GetJoystickVirtualGamepadInfoForID(joystick.*.instance_id);
        if (info != null) {
            vendor = info.*.vendor_id;
        } else {
            var guid: SDL_GUID = SDL_GetJoystickGUID_REAL(joystick);
            _ = &guid;
            SDL_GetJoystickGUIDInfo_REAL(guid, &vendor, null, null, null);
        }
    }
    SDL_UnlockJoysticks_REAL();
    return vendor;
}
pub export fn SDL_GetJoystickProduct_REAL(joystick: [*c]SDL_Joystick) Uint16 {
    @setEvalBranchQuota(100000);
    var product: Uint16 = undefined;
    _ = &product;
    var info: [*c]const SDL_SteamVirtualGamepadInfo = undefined;
    _ = &info;
    SDL_LockJoysticks_REAL();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(joystick)), SDL_OBJECT_TYPE_JOYSTICK)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("joystick"))));
            SDL_UnlockJoysticks_REAL();
            return 0;
        }
        info = SDL_GetJoystickVirtualGamepadInfoForID(joystick.*.instance_id);
        if (info != null) {
            product = info.*.product_id;
        } else {
            var guid: SDL_GUID = SDL_GetJoystickGUID_REAL(joystick);
            _ = &guid;
            SDL_GetJoystickGUIDInfo_REAL(guid, null, &product, null, null);
        }
    }
    SDL_UnlockJoysticks_REAL();
    return product;
}
pub export fn SDL_GetJoystickProductVersion_REAL(joystick: [*c]SDL_Joystick) Uint16 {
    @setEvalBranchQuota(100000);
    var version: Uint16 = undefined;
    _ = &version;
    var guid: SDL_GUID = SDL_GetJoystickGUID_REAL(joystick);
    _ = &guid;
    SDL_GetJoystickGUIDInfo_REAL(guid, null, null, &version, null);
    return version;
}
pub export fn SDL_GetJoystickFirmwareVersion_REAL(joystick: [*c]SDL_Joystick) Uint16 {
    @setEvalBranchQuota(100000);
    var result: Uint16 = undefined;
    _ = &result;
    SDL_LockJoysticks_REAL();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(joystick)), SDL_OBJECT_TYPE_JOYSTICK)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("joystick"))));
            SDL_UnlockJoysticks_REAL();
            return 0;
        }
        result = joystick.*.firmware_version;
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_GetJoystickSerial_REAL(joystick: [*c]SDL_Joystick) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var result: [*c]const u8 = undefined;
    _ = &result;
    SDL_LockJoysticks_REAL();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(joystick)), SDL_OBJECT_TYPE_JOYSTICK)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("joystick"))));
            SDL_UnlockJoysticks_REAL();
            return null;
        }
        result = SDL_GetPersistentString(joystick.*.serial);
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_GetJoystickType_REAL(joystick: [*c]SDL_Joystick) SDL_JoystickType {
    @setEvalBranchQuota(100000);
    var @"type": SDL_JoystickType = undefined;
    _ = &@"type";
    var guid: SDL_GUID = SDL_GetJoystickGUID_REAL(joystick);
    _ = &guid;
    @"type" = SDL_GetJoystickGUIDType(guid);
    if (@"type" == @as(SDL_JoystickType, SDL_JOYSTICK_TYPE_UNKNOWN)) {
        SDL_LockJoysticks_REAL();
        {
            if (!SDL_ObjectValid(@ptrCast(@alignCast(joystick)), SDL_OBJECT_TYPE_JOYSTICK)) {
                _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("joystick"))));
                SDL_UnlockJoysticks_REAL();
                return SDL_JOYSTICK_TYPE_UNKNOWN;
            }
            if (SDL_IsGamepad_REAL(joystick.*.instance_id)) {
                @"type" = SDL_JOYSTICK_TYPE_GAMEPAD;
            }
        }
        SDL_UnlockJoysticks_REAL();
    }
    return @"type";
}
pub export fn SDL_SendJoystickPowerInfo(joystick: [*c]SDL_Joystick, state: SDL_PowerState, percent: c_int) void {
    @setEvalBranchQuota(100000);
    SDL_AssertJoysticksLocked();
    if ((state != joystick.*.battery_state) or (percent != joystick.*.battery_percent)) {
        joystick.*.battery_state = state;
        joystick.*.battery_percent = percent;
        if (SDL_EventEnabled_REAL(SDL_EVENT_JOYSTICK_BATTERY_UPDATED)) {
            var event: SDL_Event = undefined;
            _ = &event;
            event.type = SDL_EVENT_JOYSTICK_BATTERY_UPDATED;
            event.common.timestamp = 0;
            event.jbattery.which = joystick.*.instance_id;
            event.jbattery.state = state;
            event.jbattery.percent = percent;
            _ = SDL_PushEvent_REAL(&event);
        }
    }
}
pub export fn SDL_GetJoystickConnectionState_REAL(joystick: [*c]SDL_Joystick) SDL_JoystickConnectionState {
    @setEvalBranchQuota(100000);
    var result: SDL_JoystickConnectionState = undefined;
    _ = &result;
    SDL_LockJoysticks_REAL();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(joystick)), SDL_OBJECT_TYPE_JOYSTICK)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("joystick"))));
            SDL_UnlockJoysticks_REAL();
            return SDL_JOYSTICK_CONNECTION_INVALID;
        }
        result = joystick.*.connection_state;
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_GetJoystickPowerInfo_REAL(joystick: [*c]SDL_Joystick, percent: [*c]c_int) SDL_PowerState {
    @setEvalBranchQuota(100000);
    var result: SDL_PowerState = undefined;
    _ = &result;
    if (percent != null) {
        percent.* = -@as(c_int, 1);
    }
    SDL_LockJoysticks_REAL();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(joystick)), SDL_OBJECT_TYPE_JOYSTICK)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("joystick"))));
            SDL_UnlockJoysticks_REAL();
            return SDL_POWERSTATE_ERROR;
        }
        result = joystick.*.battery_state;
        if (percent != null) {
            percent.* = joystick.*.battery_percent;
        }
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_SendJoystickTouchpad(timestamp: Uint64, joystick: [*c]SDL_Joystick, arg_touchpad: c_int, arg_finger: c_int, down: bool, arg_x: f32, arg_y: f32, arg_pressure: f32) void {
    @setEvalBranchQuota(100000);
    var touchpad = arg_touchpad;
    _ = &touchpad;
    var finger = arg_finger;
    _ = &finger;
    var x = arg_x;
    _ = &x;
    var y = arg_y;
    _ = &y;
    var pressure = arg_pressure;
    _ = &pressure;
    const static_local___func__ = struct {
        const __func__: [24:0]u8 = "SDL_SendJoystickTouchpad".*;
    };
    _ = &static_local___func__;
    var touchpad_info: [*c]SDL_JoystickTouchpadInfo = undefined;
    _ = &touchpad_info;
    var finger_info: [*c]SDL_JoystickTouchpadFingerInfo = undefined;
    _ = &finger_info;
    var event_type: Uint32 = undefined;
    _ = &event_type;
    SDL_AssertJoysticksLocked();
    if ((touchpad < @as(c_int, 0)) or (touchpad >= joystick.*.ntouchpads)) {
        return;
    }
    touchpad_info = &joystick.*.touchpads[@bitCast(@as(isize, @intCast(touchpad)))];
    if ((finger < @as(c_int, 0)) or (finger >= touchpad_info.*.nfingers)) {
        return;
    }
    finger_info = &touchpad_info.*.fingers[@bitCast(@as(isize, @intCast(finger)))];
    if (!down) {
        if ((x == @as(f32, 0.0)) and (y == @as(f32, 0.0))) {
            x = finger_info.*.x;
            y = finger_info.*.y;
        }
        pressure = 0.0;
    }
    if (x < @as(f32, 0.0)) {
        x = 0.0;
    } else if (x > @as(f32, 1.0)) {
        x = 1.0;
    }
    if (y < @as(f32, 0.0)) {
        y = 0.0;
    } else if (y > @as(f32, 1.0)) {
        y = 1.0;
    }
    if (pressure < @as(f32, 0.0)) {
        pressure = 0.0;
    } else if (pressure > @as(f32, 1.0)) {
        pressure = 1.0;
    }
    if (@as(c_int, @intFromBool(down)) == @as(c_int, @intFromBool(finger_info.*.down))) {
        if (!down or (((x == finger_info.*.x) and (y == finger_info.*.y)) and (pressure == finger_info.*.pressure))) {
            return;
        }
    }
    if (@as(c_int, @intFromBool(down)) == @as(c_int, @intFromBool(finger_info.*.down))) {
        event_type = SDL_EVENT_GAMEPAD_TOUCHPAD_MOTION;
    } else if (down) {
        event_type = SDL_EVENT_GAMEPAD_TOUCHPAD_DOWN;
    } else {
        event_type = SDL_EVENT_GAMEPAD_TOUCHPAD_UP;
    }
    if (SDL_PrivateJoystickShouldIgnoreEvent()) {
        if (event_type != @as(Uint32, SDL_EVENT_GAMEPAD_TOUCHPAD_UP)) {
            return;
        }
    }
    while (true) {
        while (!(timestamp != @as(Uint64, 0))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "timestamp != 0",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_joystick.c", 4080);
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
    finger_info.*.down = down;
    finger_info.*.x = x;
    finger_info.*.y = y;
    finger_info.*.pressure = pressure;
    joystick.*.update_complete = timestamp;
    if (SDL_EventEnabled_REAL(event_type)) {
        var event: SDL_Event = undefined;
        _ = &event;
        event.type = event_type;
        event.common.timestamp = timestamp;
        event.gtouchpad.which = joystick.*.instance_id;
        event.gtouchpad.touchpad = touchpad;
        event.gtouchpad.finger = finger;
        event.gtouchpad.x = x;
        event.gtouchpad.y = y;
        event.gtouchpad.pressure = pressure;
        _ = SDL_PushEvent_REAL(&event);
    }
}
pub export fn SDL_SendJoystickSensor(timestamp: Uint64, joystick: [*c]SDL_Joystick, arg_type: SDL_SensorType, sensor_timestamp: Uint64, data: [*c]const f32, arg_num_values: c_int) void {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var num_values = arg_num_values;
    _ = &num_values;
    SDL_AssertJoysticksLocked();
    if (SDL_PrivateJoystickShouldIgnoreEvent()) {
        return;
    }
    {
        var i: c_int = 0;
        _ = &i;
        while (i < joystick.*.nsensors) : (i += 1) {
            var sensor: [*c]SDL_JoystickSensorInfo = &joystick.*.sensors[@bitCast(@as(isize, @intCast(i)))];
            _ = &sensor;
            if (sensor.*.type == @"type") {
                if (sensor.*.enabled) {
                    num_values = @bitCast(@as(c_uint, @truncate(if (@as(c_ulong, @bitCast(@as(c_long, num_values))) < (@sizeOf(@TypeOf(sensor.*.data)) / @sizeOf(@TypeOf(sensor.*.data[@as(c_int, 0)])))) @as(c_ulong, @bitCast(@as(c_long, num_values))) else @sizeOf(@TypeOf(sensor.*.data)) / @sizeOf(@TypeOf(sensor.*.data[@as(c_int, 0)])))));
                    _ = memcpy(@ptrCast(@alignCast(@as([*c]f32, @ptrCast(@alignCast(&sensor.*.data))))), @ptrCast(@alignCast(data)), @as(c_ulong, @bitCast(@as(c_long, num_values))) *% @sizeOf(@TypeOf(data.*)));
                    joystick.*.update_complete = timestamp;
                    if (SDL_EventEnabled_REAL(SDL_EVENT_GAMEPAD_SENSOR_UPDATE)) {
                        var event: SDL_Event = undefined;
                        _ = &event;
                        event.type = SDL_EVENT_GAMEPAD_SENSOR_UPDATE;
                        event.common.timestamp = timestamp;
                        event.gsensor.which = joystick.*.instance_id;
                        event.gsensor.sensor = @"type";
                        num_values = @bitCast(@as(c_uint, @truncate(if (@as(c_ulong, @bitCast(@as(c_long, num_values))) < (@sizeOf(@TypeOf(event.gsensor.data)) / @sizeOf(@TypeOf(event.gsensor.data[@as(c_int, 0)])))) @as(c_ulong, @bitCast(@as(c_long, num_values))) else @sizeOf(@TypeOf(event.gsensor.data)) / @sizeOf(@TypeOf(event.gsensor.data[@as(c_int, 0)])))));
                        _ = memset(@ptrCast(@alignCast(@as([*c]f32, @ptrCast(@alignCast(&event.gsensor.data))))), 0, @sizeOf(@TypeOf(event.gsensor.data)));
                        _ = memcpy(@ptrCast(@alignCast(@as([*c]f32, @ptrCast(@alignCast(&event.gsensor.data))))), @ptrCast(@alignCast(data)), @as(c_ulong, @bitCast(@as(c_long, num_values))) *% @sizeOf(@TypeOf(data.*)));
                        event.gsensor.sensor_timestamp = sensor_timestamp;
                        _ = SDL_PushEvent_REAL(&event);
                    }
                }
                break;
            }
        }
    }
}
pub export fn SDL_SendJoystickCapSense(timestamp: Uint64, joystick: [*c]SDL_Joystick, arg_type: SDL_GamepadCapSenseType, down: bool) void {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    SDL_AssertJoysticksLocked();
    if (SDL_PrivateJoystickShouldIgnoreEvent()) {
        if (down) {
            return;
        }
    }
    {
        var i: c_int = 0;
        _ = &i;
        while (i < joystick.*.ncapsenses) : (i += 1) {
            var capsense: [*c]SDL_JoystickCapSenseInfo = &joystick.*.capsenses[@bitCast(@as(isize, @intCast(i)))];
            _ = &capsense;
            if (capsense.*.type == @"type") {
                var event: SDL_Event = undefined;
                _ = &event;
                if (@as(c_int, @intFromBool(down)) == @as(c_int, @intFromBool(capsense.*.down))) {
                    return;
                }
                capsense.*.down = down;
                joystick.*.update_complete = timestamp;
                if (down) {
                    event.type = SDL_EVENT_GAMEPAD_CAPSENSE_TOUCH;
                } else {
                    event.type = SDL_EVENT_GAMEPAD_CAPSENSE_RELEASE;
                }
                if (SDL_EventEnabled_REAL(event.type)) {
                    event.common.timestamp = timestamp;
                    event.gcapsense.which = joystick.*.instance_id;
                    event.gcapsense.capsense = @bitCast(@as(i8, @truncate(@"type")));
                    event.gcapsense.down = down;
                    _ = SDL_PushEvent_REAL(&event);
                }
                break;
            }
        }
    }
}
pub fn SDL_LoadVIDPIDListFromHint(hint: [*c]const u8, num_entries: [*c]c_int, max_entries: [*c]c_int, entries: [*c][*c]Uint32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var entry: Uint32 = undefined;
    _ = &entry;
    var spot: [*c]u8 = undefined;
    _ = &spot;
    var file: [*c]u8 = null;
    _ = &file;
    if ((hint != null) and (@as(c_int, hint.*) == @as(c_int, '@'))) {
        spot = blk: {
            const tmp = @as([*c]u8, @ptrCast(@alignCast(SDL_LoadFile_REAL(hint + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1))))), null))));
            file = tmp;
            break :blk tmp;
        };
    } else {
        spot = @ptrCast(@alignCast(@constCast(hint)));
    }
    if (!(spot != null)) {
        return;
    }
    while (@as(?*anyopaque, @ptrCast(@alignCast(blk: {
        const tmp = SDL_strstr_REAL(spot, "0x");
        spot = tmp;
        break :blk tmp;
    }))) != @as(?*anyopaque, null)) {
        entry = @as(Uint16, @bitCast(@as(c_short, @truncate(SDL_strtol_REAL(spot, &spot, 0)))));
        entry <<= @intCast(@as(Uint32, 16));
        spot = SDL_strstr_REAL(spot, "0x");
        if (!(spot != null)) {
            break;
        }
        entry |= @bitCast(@as(c_int, @as(c_int, @as(Uint16, @bitCast(@as(c_short, @truncate(SDL_strtol_REAL(spot, &spot, 0))))))));
        if (num_entries.* == max_entries.*) {
            var new_max_entries: c_int = max_entries.* + @as(c_int, 16);
            _ = &new_max_entries;
            var new_entries: [*c]Uint32 = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(entries.*)), @as(c_ulong, @bitCast(@as(c_long, new_max_entries))) *% @sizeOf(@TypeOf(entries.*.*)))));
            _ = &new_entries;
            if (!(new_entries != null)) {
                break;
            }
            entries.* = new_entries;
            max_entries.* = new_max_entries;
        }
        entries.*[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &num_entries.*;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = entry;
    }
    SDL_free_REAL(@ptrCast(@alignCast(file)));
}
pub export fn SDL_LoadVIDPIDListFromHints(list: [*c]SDL_vidpid_list, included_list: [*c]const u8, excluded_list: [*c]const u8) void {
    @setEvalBranchQuota(100000);
    list.*.num_included_entries = 0;
    list.*.num_excluded_entries = 0;
    if (list.*.num_initial_entries > @as(c_int, 0)) {
        if (list.*.num_included_entries < list.*.num_initial_entries) {
            var entries: [*c]Uint32 = undefined;
            entries = @ptrCast(@alignCast(SDL_malloc_REAL(@as(c_ulong, @bitCast(@as(c_long, list.*.num_initial_entries))) *% @sizeOf(@TypeOf(entries.*)))));
            _ = &entries;
            if (entries != null) {
                _ = memcpy(@ptrCast(@alignCast(entries)), @ptrCast(@alignCast(list.*.initial_entries)), @as(c_ulong, @bitCast(@as(c_long, list.*.num_initial_entries))) *% @sizeOf(@TypeOf(entries.*)));
                list.*.included_entries = entries;
                list.*.num_included_entries = list.*.num_initial_entries;
                list.*.max_included_entries = list.*.num_initial_entries;
            }
        }
    }
    SDL_LoadVIDPIDListFromHint(included_list, &list.*.num_included_entries, &list.*.max_included_entries, &list.*.included_entries);
    SDL_LoadVIDPIDListFromHint(excluded_list, &list.*.num_excluded_entries, &list.*.max_excluded_entries, &list.*.excluded_entries);
}
pub fn SDL_VIDPIDIncludedHintChanged(userdata: ?*anyopaque, _: [*c]const u8, _: [*c]const u8, hint: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var list: [*c]SDL_vidpid_list = @ptrCast(@alignCast(userdata));
    _ = &list;
    var included_list: [*c]const u8 = hint;
    _ = &included_list;
    var excluded_list: [*c]const u8 = null;
    _ = &excluded_list;
    if (!list.*.initialized) {
        return;
    }
    if (list.*.excluded_hint_name != null) {
        excluded_list = SDL_GetHint_REAL(list.*.excluded_hint_name);
    }
    SDL_LoadVIDPIDListFromHints(list, included_list, excluded_list);
}
pub fn SDL_VIDPIDExcludedHintChanged(userdata: ?*anyopaque, _: [*c]const u8, _: [*c]const u8, hint: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var list: [*c]SDL_vidpid_list = @ptrCast(@alignCast(userdata));
    _ = &list;
    var included_list: [*c]const u8 = null;
    _ = &included_list;
    var excluded_list: [*c]const u8 = hint;
    _ = &excluded_list;
    if (!list.*.initialized) {
        return;
    }
    if (list.*.included_hint_name != null) {
        included_list = SDL_GetHint_REAL(list.*.included_hint_name);
    }
    SDL_LoadVIDPIDListFromHints(list, included_list, excluded_list);
}
pub export fn SDL_LoadVIDPIDList(list: [*c]SDL_vidpid_list) void {
    @setEvalBranchQuota(100000);
    var included_list: [*c]const u8 = null;
    _ = &included_list;
    var excluded_list: [*c]const u8 = null;
    _ = &excluded_list;
    if (list.*.included_hint_name != null) {
        _ = SDL_AddHintCallback_REAL(list.*.included_hint_name, SDL_VIDPIDIncludedHintChanged, @ptrCast(@alignCast(list)));
    }
    if (list.*.excluded_hint_name != null) {
        _ = SDL_AddHintCallback_REAL(list.*.excluded_hint_name, SDL_VIDPIDExcludedHintChanged, @ptrCast(@alignCast(list)));
    }
    list.*.initialized = @"true" != 0;
    if (list.*.included_hint_name != null) {
        included_list = SDL_GetHint_REAL(list.*.included_hint_name);
        if (!(included_list != null)) {
            included_list = SDL_getenv_unsafe_REAL(list.*.included_hint_name);
        }
    }
    if (list.*.excluded_hint_name != null) {
        excluded_list = SDL_GetHint_REAL(list.*.excluded_hint_name);
        if (!(excluded_list != null)) {
            excluded_list = SDL_getenv_unsafe_REAL(list.*.excluded_hint_name);
        }
    }
    SDL_LoadVIDPIDListFromHints(list, included_list, excluded_list);
}
pub export fn SDL_VIDPIDInList(vendor_id: Uint16, product_id: Uint16, list: [*c]const SDL_vidpid_list) bool {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var vidpid: Uint32 = (@as(Uint32, vendor_id) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, product_id))));
    _ = &vidpid;
    {
        i = 0;
        while (i < list.*.num_excluded_entries) : (i += 1) {
            if (vidpid == list.*.excluded_entries[@bitCast(@as(isize, @intCast(i)))]) {
                return @"false" != 0;
            }
        }
    }
    {
        i = 0;
        while (i < list.*.num_included_entries) : (i += 1) {
            if (vidpid == list.*.included_entries[@bitCast(@as(isize, @intCast(i)))]) {
                return @"true" != 0;
            }
        }
    }
    return @"false" != 0;
}
pub export fn SDL_FreeVIDPIDList(list: [*c]SDL_vidpid_list) void {
    @setEvalBranchQuota(100000);
    if (list.*.included_hint_name != null) {
        SDL_RemoveHintCallback_REAL(list.*.included_hint_name, SDL_VIDPIDIncludedHintChanged, @ptrCast(@alignCast(list)));
    }
    if (list.*.excluded_hint_name != null) {
        SDL_RemoveHintCallback_REAL(list.*.excluded_hint_name, SDL_VIDPIDExcludedHintChanged, @ptrCast(@alignCast(list)));
    }
    if (list.*.included_entries != null) {
        SDL_free_REAL(@ptrCast(@alignCast(list.*.included_entries)));
        list.*.included_entries = null;
        list.*.num_included_entries = 0;
        list.*.max_included_entries = 0;
    }
    if (list.*.excluded_entries != null) {
        SDL_free_REAL(@ptrCast(@alignCast(list.*.excluded_entries)));
        list.*.excluded_entries = null;
        list.*.num_excluded_entries = 0;
        list.*.max_excluded_entries = 0;
    }
    list.*.initialized = @"false" != 0;
}

pub const SDL_AttachVirtualJoystick = SDL_AttachVirtualJoystick_REAL;
pub const SDL_DetachVirtualJoystick = SDL_DetachVirtualJoystick_REAL;
pub const SDL_GetJoystickAxis = SDL_GetJoystickAxis_REAL;
pub const SDL_GetJoystickAxisInitialState = SDL_GetJoystickAxisInitialState_REAL;
pub const SDL_GetJoystickBall = SDL_GetJoystickBall_REAL;
pub const SDL_GetJoystickButton = SDL_GetJoystickButton_REAL;
pub const SDL_GetJoystickConnectionState = SDL_GetJoystickConnectionState_REAL;
pub const SDL_GetJoystickFirmwareVersion = SDL_GetJoystickFirmwareVersion_REAL;
pub const SDL_GetJoystickFromID = SDL_GetJoystickFromID_REAL;
pub const SDL_GetJoystickFromPlayerIndex = SDL_GetJoystickFromPlayerIndex_REAL;
pub const SDL_GetJoystickGUID = SDL_GetJoystickGUID_REAL;
pub const SDL_GetJoystickGUIDForID = SDL_GetJoystickGUIDForID_REAL;
pub const SDL_GetJoystickGUIDInfo = SDL_GetJoystickGUIDInfo_REAL;
pub const SDL_GetJoystickHat = SDL_GetJoystickHat_REAL;
pub const SDL_GetJoystickID = SDL_GetJoystickID_REAL;
pub const SDL_GetJoystickName = SDL_GetJoystickName_REAL;
pub const SDL_GetJoystickNameForID = SDL_GetJoystickNameForID_REAL;
pub const SDL_GetJoystickPath = SDL_GetJoystickPath_REAL;
pub const SDL_GetJoystickPathForID = SDL_GetJoystickPathForID_REAL;
pub const SDL_GetJoystickPlayerIndex = SDL_GetJoystickPlayerIndex_REAL;
pub const SDL_GetJoystickPlayerIndexForID = SDL_GetJoystickPlayerIndexForID_REAL;
pub const SDL_GetJoystickPowerInfo = SDL_GetJoystickPowerInfo_REAL;
pub const SDL_GetJoystickProduct = SDL_GetJoystickProduct_REAL;
pub const SDL_GetJoystickProductForID = SDL_GetJoystickProductForID_REAL;
pub const SDL_GetJoystickProductVersion = SDL_GetJoystickProductVersion_REAL;
pub const SDL_GetJoystickProductVersionForID = SDL_GetJoystickProductVersionForID_REAL;
pub const SDL_GetJoystickProperties = SDL_GetJoystickProperties_REAL;
pub const SDL_GetJoystickSerial = SDL_GetJoystickSerial_REAL;
pub const SDL_GetJoystickType = SDL_GetJoystickType_REAL;
pub const SDL_GetJoystickTypeForID = SDL_GetJoystickTypeForID_REAL;
pub const SDL_GetJoystickVendor = SDL_GetJoystickVendor_REAL;
pub const SDL_GetJoystickVendorForID = SDL_GetJoystickVendorForID_REAL;
pub const SDL_GetJoysticks = SDL_GetJoysticks_REAL;
pub const SDL_GetNumJoystickAxes = SDL_GetNumJoystickAxes_REAL;
pub const SDL_GetNumJoystickBalls = SDL_GetNumJoystickBalls_REAL;
pub const SDL_GetNumJoystickButtons = SDL_GetNumJoystickButtons_REAL;
pub const SDL_GetNumJoystickHats = SDL_GetNumJoystickHats_REAL;
pub const SDL_HasJoystick = SDL_HasJoystick_REAL;
pub const SDL_IsJoystickVirtual = SDL_IsJoystickVirtual_REAL;
pub const SDL_JoystickConnected = SDL_JoystickConnected_REAL;
pub const SDL_JoystickEventsEnabled = SDL_JoystickEventsEnabled_REAL;
pub const SDL_LockJoysticks = SDL_LockJoysticks_REAL;
pub const SDL_OpenJoystick = SDL_OpenJoystick_REAL;
pub const SDL_RumbleJoystick = SDL_RumbleJoystick_REAL;
pub const SDL_RumbleJoystickTriggers = SDL_RumbleJoystickTriggers_REAL;
pub const SDL_SendJoystickEffect = SDL_SendJoystickEffect_REAL;
pub const SDL_SendJoystickVirtualSensorData = SDL_SendJoystickVirtualSensorData_REAL;
pub const SDL_SetJoystickEventsEnabled = SDL_SetJoystickEventsEnabled_REAL;
pub const SDL_SetJoystickLED = SDL_SetJoystickLED_REAL;
pub const SDL_SetJoystickPlayerIndex = SDL_SetJoystickPlayerIndex_REAL;
pub const SDL_SetJoystickVirtualAxis = SDL_SetJoystickVirtualAxis_REAL;
pub const SDL_SetJoystickVirtualBall = SDL_SetJoystickVirtualBall_REAL;
pub const SDL_SetJoystickVirtualButton = SDL_SetJoystickVirtualButton_REAL;
pub const SDL_SetJoystickVirtualHat = SDL_SetJoystickVirtualHat_REAL;
pub const SDL_SetJoystickVirtualTouchpad = SDL_SetJoystickVirtualTouchpad_REAL;
pub const SDL_UnlockJoysticks = SDL_UnlockJoysticks_REAL;
pub const SDL_UpdateJoysticks = SDL_UpdateJoysticks_REAL;
pub const SDL_TryLockJoysticks = SDL_TryLockJoysticks_REAL;
pub const SDL_JoystickHasSensor = SDL_JoystickHasSensor_REAL;
pub const SDL_SetJoystickSensorEnabled = SDL_SetJoystickSensorEnabled_REAL;
pub const SDL_JoystickSensorEnabled = SDL_JoystickSensorEnabled_REAL;
pub const SDL_GetJoystickSensorDataRate = SDL_GetJoystickSensorDataRate_REAL;
pub const SDL_GetJoystickSensorData = SDL_GetJoystickSensorData_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_JOYSTICK_AXIS_MAX = @as(c_int, 32767);
pub const SDL_HAT_CENTERED = @as(c_uint, 0x00);
pub const SDL_INIT_EVENTS = @as(c_uint, 0x00004000);
pub const SDL_INIT_SENSOR = @as(c_uint, 0x00008000);
pub const SDL_HARDWARE_BUS_UNKNOWN = @as(c_int, 0x00);
pub const SDL_HARDWARE_BUS_VIRTUAL = @as(c_int, 0xFF);
pub const SDL_MAX_RUMBLE_DURATION_MS = __helpers.promoteIntLiteral(c_int, 0xFFFF, .hex);
pub const SDL_RUMBLE_RESEND_MS = @as(c_int, 2000);
pub const SDL_LED_MIN_REPEAT_MS = @as(c_int, 5000);
pub const USB_VENDOR_AMAZON = @as(c_int, 0x1949);
pub const USB_VENDOR_ANDGAMER = @as(c_int, 0x38d2);
pub const USB_VENDOR_GAMESIR = @as(c_int, 0x3537);
pub const USB_VENDOR_FLYDIGI_V1 = @as(c_int, 0x04b4);
pub const USB_VENDOR_FLYDIGI_V2 = @as(c_int, 0x37d7);
pub const USB_VENDOR_GOOGLE = @as(c_int, 0x18d1);
pub const USB_VENDOR_MICROSOFT = @as(c_int, 0x045e);
pub const USB_VENDOR_NINTENDO = @as(c_int, 0x057e);
pub const USB_VENDOR_NVIDIA = @as(c_int, 0x0955);
pub const USB_VENDOR_VALVE = @as(c_int, 0x28de);
pub const USB_VENDOR_RASPBERRYPI = @as(c_int, 0x2e8a);
pub const USB_PRODUCT_AMAZON_LUNA_CONTROLLER = @as(c_int, 0x0419);
pub const USB_PRODUCT_GOOGLE_STADIA_CONTROLLER = __helpers.promoteIntLiteral(c_int, 0x9400, .hex);
pub const USB_PRODUCT_FLYDIGI_V1_GAMEPAD = @as(c_int, 0x2412);
pub const USB_PRODUCT_FLYDIGI_V2_APEX = @as(c_int, 0x2501);
pub const USB_PRODUCT_FLYDIGI_V2_APEX6 = @as(c_int, 0x2502);
pub const USB_PRODUCT_FLYDIGI_V2_VADER = @as(c_int, 0x2401);
pub const USB_PRODUCT_GAMESIR_GAMEPAD_G7_PRO_8K = @as(c_int, 0x10B8);
pub const USB_PRODUCT_GAMESIR_GAMEPAD_TARANTULA_8K = @as(c_int, 0x103C);
pub const USB_PRODUCT_NINTENDO_SWITCH_JOYCON_GRIP = @as(c_int, 0x200e);
pub const USB_PRODUCT_NINTENDO_SWITCH_JOYCON_LEFT = @as(c_int, 0x2006);
pub const USB_PRODUCT_NINTENDO_SWITCH_JOYCON_PAIR = @as(c_int, 0x2008);
pub const USB_PRODUCT_NINTENDO_SWITCH_JOYCON_RIGHT = @as(c_int, 0x2007);
pub const USB_PRODUCT_NINTENDO_SWITCH2_JOYCON_LEFT = @as(c_int, 0x2067);
pub const USB_PRODUCT_NINTENDO_SWITCH2_JOYCON_PAIR = @as(c_int, 0x2068);
pub const USB_PRODUCT_NINTENDO_SWITCH2_JOYCON_RIGHT = @as(c_int, 0x2066);
pub const USB_PRODUCT_NVIDIA_SHIELD_CONTROLLER_V103 = @as(c_int, 0x7210);
pub const USB_PRODUCT_NVIDIA_SHIELD_CONTROLLER_V104 = @as(c_int, 0x7214);
pub const USB_PRODUCT_XBOX360_WIRED_CONTROLLER = @as(c_int, 0x028e);
pub const USB_PRODUCT_XBOX_ONE_ADAPTIVE_BLUETOOTH = @as(c_int, 0x0b0c);
pub const USB_PRODUCT_XBOX_ONE_ADAPTIVE_BLE = @as(c_int, 0x0b21);
pub const USB_PRODUCT_XBOX_ONE_ELITE_SERIES_2_BLUETOOTH = @as(c_int, 0x0b05);
pub const USB_PRODUCT_XBOX_ONE_ELITE_SERIES_2_BLE = @as(c_int, 0x0b22);
pub const USB_PRODUCT_XBOX_ONE_S_REV1_BLUETOOTH = @as(c_int, 0x02e0);
pub const USB_PRODUCT_XBOX_ONE_S_REV2_BLUETOOTH = @as(c_int, 0x02fd);
pub const USB_PRODUCT_XBOX_ONE_S_REV2_BLE = @as(c_int, 0x0b20);
pub const USB_PRODUCT_XBOX_SERIES_X_BLE = @as(c_int, 0x0b13);
pub const USB_PRODUCT_STEAM_VIRTUAL_GAMEPAD = @as(c_int, 0x11ff);
pub const USB_PRODUCT_HANDHELDLEGEND_SINPUT_GENERIC = @as(c_int, 0x10c6);
pub const USB_PRODUCT_HANDHELDLEGEND_PROGCC = @as(c_int, 0x10df);
pub const USB_PRODUCT_HANDHELDLEGEND_GCULTIMATE = @as(c_int, 0x10dd);
pub const USB_PRODUCT_BONZIRICHANNEL_FIREBIRD = @as(c_int, 0x10e0);
pub const USB_PRODUCT_VOIDGAMING_PS4FIREBIRD = @as(c_int, 0x10e5);
pub const USB_PRODUCT_VOIDGAMING_GENESIS_SINPUT = @as(c_int, 0x1014);
pub const BLUETOOTH_VENDOR_AMAZON = @as(c_int, 0x0171);
pub const BLUETOOTH_PRODUCT_LUNA_CONTROLLER = @as(c_int, 0x0419);
