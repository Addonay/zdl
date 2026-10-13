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
pub extern fn memmove(__dest: ?*anyopaque, __src: ?*const anyopaque, __n: usize) ?*anyopaque;
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
pub extern fn SDL_isdigit_REAL(x: c_int) c_int;
pub extern fn SDL_isspace_REAL(x: c_int) c_int;
pub extern fn SDL_memcmp_REAL(s1: ?*const anyopaque, s2: ?*const anyopaque, len: usize) c_int;
pub extern fn SDL_strlen_REAL(str: [*c]const u8) usize;
pub extern fn SDL_strlcpy_REAL(dst: [*c]u8, src: [*c]const u8, maxlen: usize) usize;
pub extern fn SDL_strlcat_REAL(dst: [*c]u8, src: [*c]const u8, maxlen: usize) usize;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_strchr_REAL(str: [*c]const u8, c: c_int) [*c]u8;
pub extern fn SDL_strstr_REAL(haystack: [*c]const u8, needle: [*c]const u8) [*c]u8;
pub extern fn SDL_atoi_REAL(str: [*c]const u8) c_int;
pub extern fn SDL_strtol_REAL(str: [*c]const u8, endp: [*c][*c]u8, base: c_int) c_long;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_strcasecmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_strncasecmp_REAL(str1: [*c]const u8, str2: [*c]const u8, maxlen: usize) c_int;
pub extern fn SDL_snprintf_REAL(text: [*c]u8, maxlen: usize, fmt: [*c]const u8, ...) c_int;
pub extern fn SDL_asprintf_REAL(strp: [*c][*c]u8, fmt: [*c]const u8, ...) c_int;
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
pub const struct_SDL_IOStream = opaque {
};
pub const SDL_IOStream = struct_SDL_IOStream;
pub extern fn SDL_IOFromFile_REAL(file: [*c]const u8, mode: [*c]const u8) ?*SDL_IOStream;
pub extern fn SDL_LoadFile_IO_REAL(src: ?*SDL_IOStream, datasize: [*c]usize, closeio: bool) ?*anyopaque;
pub const SDL_AudioDeviceID = Uint32;
pub const SDL_CameraID = Uint32;
pub const SDL_DisplayID = Uint32;
pub const SDL_WindowID = Uint32;
pub const struct_SDL_GUID = extern struct {
    data: [16]Uint8 = @import("std").mem.zeroes([16]Uint8),
};
pub const SDL_GUID = struct_SDL_GUID;
pub extern fn SDL_GUIDToString_REAL(guid: SDL_GUID, pszGUID: [*c]u8, cbGUID: c_int) void;
pub extern fn SDL_StringToGUID_REAL(pchGUID: [*c]const u8) SDL_GUID;
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
pub const struct_joystick_hwdata_8 = opaque {};
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
    hwdata: ?*struct_joystick_hwdata_8 = null,
    props: SDL_PropertiesID = 0,
    ref_count: c_int = 0,
    next: [*c]struct_SDL_Joystick = null,
};
pub const SDL_JOYSTICK_TYPE_GAMEPAD: c_int = 1;
pub extern fn SDL_LockJoysticks_REAL() void;
pub extern fn SDL_UnlockJoysticks_REAL() void;
pub extern fn SDL_GetJoysticks_REAL(count: [*c]c_int) [*c]SDL_JoystickID;
pub extern fn SDL_GetJoystickNameForID_REAL(instance_id: SDL_JoystickID) [*c]const u8;
pub extern fn SDL_GetJoystickPathForID_REAL(instance_id: SDL_JoystickID) [*c]const u8;
pub extern fn SDL_GetJoystickPlayerIndexForID_REAL(instance_id: SDL_JoystickID) c_int;
pub extern fn SDL_GetJoystickGUIDForID_REAL(instance_id: SDL_JoystickID) SDL_GUID;
pub extern fn SDL_GetJoystickVendorForID_REAL(instance_id: SDL_JoystickID) Uint16;
pub extern fn SDL_GetJoystickProductForID_REAL(instance_id: SDL_JoystickID) Uint16;
pub extern fn SDL_GetJoystickProductVersionForID_REAL(instance_id: SDL_JoystickID) Uint16;
pub extern fn SDL_OpenJoystick_REAL(instance_id: SDL_JoystickID) [*c]SDL_Joystick;
pub extern fn SDL_GetJoystickFromPlayerIndex_REAL(player_index: c_int) [*c]SDL_Joystick;
pub extern fn SDL_GetJoystickProperties_REAL(joystick: [*c]SDL_Joystick) SDL_PropertiesID;
pub extern fn SDL_GetJoystickName_REAL(joystick: [*c]SDL_Joystick) [*c]const u8;
pub extern fn SDL_GetJoystickPath_REAL(joystick: [*c]SDL_Joystick) [*c]const u8;
pub extern fn SDL_GetJoystickPlayerIndex_REAL(joystick: [*c]SDL_Joystick) c_int;
pub extern fn SDL_SetJoystickPlayerIndex_REAL(joystick: [*c]SDL_Joystick, player_index: c_int) bool;
pub extern fn SDL_GetJoystickGUID_REAL(joystick: [*c]SDL_Joystick) SDL_GUID;
pub extern fn SDL_GetJoystickVendor_REAL(joystick: [*c]SDL_Joystick) Uint16;
pub extern fn SDL_GetJoystickProduct_REAL(joystick: [*c]SDL_Joystick) Uint16;
pub extern fn SDL_GetJoystickProductVersion_REAL(joystick: [*c]SDL_Joystick) Uint16;
pub extern fn SDL_GetJoystickFirmwareVersion_REAL(joystick: [*c]SDL_Joystick) Uint16;
pub extern fn SDL_GetJoystickSerial_REAL(joystick: [*c]SDL_Joystick) [*c]const u8;
pub extern fn SDL_GetJoystickGUIDInfo_REAL(guid: SDL_GUID, vendor: [*c]Uint16, product: [*c]Uint16, version: [*c]Uint16, crc16: [*c]Uint16) void;
pub extern fn SDL_JoystickConnected_REAL(joystick: [*c]SDL_Joystick) bool;
pub extern fn SDL_GetJoystickID_REAL(joystick: [*c]SDL_Joystick) SDL_JoystickID;
pub extern fn SDL_UpdateJoysticks_REAL() void;
pub extern fn SDL_GetJoystickAxis_REAL(joystick: [*c]SDL_Joystick, axis: c_int) Sint16;
pub extern fn SDL_GetJoystickHat_REAL(joystick: [*c]SDL_Joystick, hat: c_int) Uint8;
pub extern fn SDL_GetJoystickButton_REAL(joystick: [*c]SDL_Joystick, button: c_int) bool;
pub extern fn SDL_JoystickHasSensor_REAL(joystick: [*c]SDL_Joystick, @"type": SDL_SensorType) bool;
pub extern fn SDL_SetJoystickSensorEnabled_REAL(joystick: [*c]SDL_Joystick, @"type": SDL_SensorType, enabled: bool) bool;
pub extern fn SDL_JoystickSensorEnabled_REAL(joystick: [*c]SDL_Joystick, @"type": SDL_SensorType) bool;
pub extern fn SDL_GetJoystickSensorDataRate_REAL(joystick: [*c]SDL_Joystick, @"type": SDL_SensorType) f32;
pub extern fn SDL_GetJoystickSensorData_REAL(joystick: [*c]SDL_Joystick, @"type": SDL_SensorType, data: [*c]f32, num_values: c_int) bool;
pub extern fn SDL_RumbleJoystick_REAL(joystick: [*c]SDL_Joystick, low_frequency_rumble: Uint16, high_frequency_rumble: Uint16, duration_ms: Uint32) bool;
pub extern fn SDL_RumbleJoystickTriggers_REAL(joystick: [*c]SDL_Joystick, left_rumble: Uint16, right_rumble: Uint16, duration_ms: Uint32) bool;
pub extern fn SDL_SetJoystickLED_REAL(joystick: [*c]SDL_Joystick, red: Uint8, green: Uint8, blue: Uint8) bool;
pub extern fn SDL_SendJoystickEffect_REAL(joystick: [*c]SDL_Joystick, data: ?*const anyopaque, size: c_int) bool;
pub extern fn SDL_CloseJoystick_REAL(joystick: [*c]SDL_Joystick) void;
pub extern fn SDL_GetJoystickConnectionState_REAL(joystick: [*c]SDL_Joystick) SDL_JoystickConnectionState;
pub extern fn SDL_GetJoystickPowerInfo_REAL(joystick: [*c]SDL_Joystick, percent: [*c]c_int) SDL_PowerState;
pub const SDL_GAMEPAD_TYPE_UNKNOWN: c_int = 0;
pub const SDL_GAMEPAD_TYPE_STANDARD: c_int = 1;
pub const SDL_GAMEPAD_TYPE_XBOXONE: c_int = 3;
pub const SDL_GAMEPAD_TYPE_PS3: c_int = 4;
pub const SDL_GAMEPAD_TYPE_PS4: c_int = 5;
pub const SDL_GAMEPAD_TYPE_PS5: c_int = 6;
pub const SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_PRO: c_int = 7;
pub const SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_LEFT: c_int = 8;
pub const SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_RIGHT: c_int = 9;
pub const SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_PAIR: c_int = 10;
pub const SDL_GAMEPAD_TYPE_GAMECUBE: c_int = 11;
pub const SDL_GAMEPAD_TYPE_COUNT: c_int = 13;
pub const enum_SDL_GamepadType = c_uint;
pub const SDL_GamepadType = enum_SDL_GamepadType;
pub const struct_GamepadMapping_t = extern struct {
    guid: SDL_GUID = @import("std").mem.zeroes(SDL_GUID),
    name: [*c]u8 = null,
    mapping: [*c]u8 = null,
    priority: SDL_GamepadMappingPriority = @import("std").mem.zeroes(SDL_GamepadMappingPriority),
    next: [*c]struct_GamepadMapping_t = null,
};
pub const GamepadMapping_t = struct_GamepadMapping_t;
pub const SDL_GAMEPAD_BINDTYPE_BUTTON: c_int = 1;
pub const SDL_GAMEPAD_BINDTYPE_AXIS: c_int = 2;
pub const SDL_GAMEPAD_BINDTYPE_HAT: c_int = 3;
pub const enum_SDL_GamepadBindingType = c_uint;
pub const SDL_GamepadBindingType = enum_SDL_GamepadBindingType;
const struct_unnamed_10 = extern struct {
    axis: c_int = 0,
    axis_min: c_int = 0,
    axis_max: c_int = 0,
};
const struct_unnamed_11 = extern struct {
    hat: c_int = 0,
    hat_mask: c_int = 0,
};
const union_unnamed_9 = extern union {
    button: c_int,
    axis: struct_unnamed_10,
    hat: struct_unnamed_11,
};
pub const SDL_GAMEPAD_BUTTON_INVALID: c_int = -1;
pub const SDL_GAMEPAD_BUTTON_SOUTH: c_int = 0;
pub const SDL_GAMEPAD_BUTTON_EAST: c_int = 1;
pub const SDL_GAMEPAD_BUTTON_WEST: c_int = 2;
pub const SDL_GAMEPAD_BUTTON_NORTH: c_int = 3;
pub const SDL_GAMEPAD_BUTTON_GUIDE: c_int = 5;
pub const SDL_GAMEPAD_BUTTON_DPAD_UP: c_int = 11;
pub const SDL_GAMEPAD_BUTTON_DPAD_DOWN: c_int = 12;
pub const SDL_GAMEPAD_BUTTON_DPAD_LEFT: c_int = 13;
pub const SDL_GAMEPAD_BUTTON_DPAD_RIGHT: c_int = 14;
pub const SDL_GAMEPAD_BUTTON_COUNT: c_int = 26;
pub const enum_SDL_GamepadButton = c_int;
pub const SDL_GamepadButton = enum_SDL_GamepadButton;
pub const SDL_GAMEPAD_AXIS_INVALID: c_int = -1;
pub const SDL_GAMEPAD_AXIS_LEFT_TRIGGER: c_int = 4;
pub const SDL_GAMEPAD_AXIS_RIGHT_TRIGGER: c_int = 5;
pub const SDL_GAMEPAD_AXIS_COUNT: c_int = 6;
pub const enum_SDL_GamepadAxis = c_int;
pub const SDL_GamepadAxis = enum_SDL_GamepadAxis;
const struct_unnamed_13 = extern struct {
    axis: SDL_GamepadAxis = @import("std").mem.zeroes(SDL_GamepadAxis),
    axis_min: c_int = 0,
    axis_max: c_int = 0,
};
const union_unnamed_12 = extern union {
    button: SDL_GamepadButton,
    axis: struct_unnamed_13,
};
pub const struct_SDL_GamepadBinding = extern struct {
    input_type: SDL_GamepadBindingType = @import("std").mem.zeroes(SDL_GamepadBindingType),
    input: union_unnamed_9 = @import("std").mem.zeroes(union_unnamed_9),
    output_type: SDL_GamepadBindingType = @import("std").mem.zeroes(SDL_GamepadBindingType),
    output: union_unnamed_12 = @import("std").mem.zeroes(union_unnamed_12),
};
pub const SDL_GamepadBinding = struct_SDL_GamepadBinding;
pub const struct_SDL_Gamepad = extern struct {
    joystick: [*c]SDL_Joystick = null,
    ref_count: c_int = 0,
    name: [*c]const u8 = null,
    type: SDL_GamepadType = @import("std").mem.zeroes(SDL_GamepadType),
    face_style: SDL_GamepadFaceStyle = @import("std").mem.zeroes(SDL_GamepadFaceStyle),
    mapping: [*c]GamepadMapping_t = null,
    num_bindings: c_int = 0,
    bindings: [*c]SDL_GamepadBinding = null,
    last_match_axis: [*c][*c]SDL_GamepadBinding = null,
    last_hat_mask: [*c]Uint8 = null,
    guide_button_down: Uint64 = 0,
    next: [*c]struct_SDL_Gamepad = null,
};
pub const SDL_Gamepad = struct_SDL_Gamepad;
pub const SDL_GAMEPAD_BUTTON_LABEL_UNKNOWN: c_int = 0;
pub const SDL_GAMEPAD_BUTTON_LABEL_A: c_int = 1;
pub const SDL_GAMEPAD_BUTTON_LABEL_B: c_int = 2;
pub const SDL_GAMEPAD_BUTTON_LABEL_X: c_int = 3;
pub const SDL_GAMEPAD_BUTTON_LABEL_Y: c_int = 4;
pub const SDL_GAMEPAD_BUTTON_LABEL_CROSS: c_int = 5;
pub const SDL_GAMEPAD_BUTTON_LABEL_CIRCLE: c_int = 6;
pub const SDL_GAMEPAD_BUTTON_LABEL_SQUARE: c_int = 7;
pub const SDL_GAMEPAD_BUTTON_LABEL_TRIANGLE: c_int = 8;
pub const enum_SDL_GamepadButtonLabel = c_uint;
pub const SDL_GamepadButtonLabel = enum_SDL_GamepadButtonLabel;
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
pub const SDL_EVENT_JOYSTICK_AXIS_MOTION: c_int = 1536;
pub const SDL_EVENT_JOYSTICK_HAT_MOTION: c_int = 1538;
pub const SDL_EVENT_JOYSTICK_BUTTON_DOWN: c_int = 1539;
pub const SDL_EVENT_JOYSTICK_BUTTON_UP: c_int = 1540;
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
pub const SDL_EventFilter = ?*const fn (userdata: ?*anyopaque, event: [*c]SDL_Event) callconv(.c) bool;
pub extern fn SDL_AddEventWatch_REAL(filter: SDL_EventFilter, userdata: ?*anyopaque) bool;
pub extern fn SDL_RemoveEventWatch_REAL(filter: SDL_EventFilter, userdata: ?*anyopaque) void;
pub extern fn SDL_SetEventEnabled_REAL(@"type": Uint32, enabled: bool) void;
pub extern fn SDL_EventEnabled_REAL(@"type": Uint32) bool;
pub extern fn SDL_GetHint_REAL(name: [*c]const u8) [*c]const u8;
pub extern fn SDL_GetHintBoolean_REAL(name: [*c]const u8, default_value: bool) bool;
pub extern fn SDL_GetPlatform_REAL() [*c]const u8;
pub extern fn SDL_GetTicks_REAL() Uint64;
pub extern fn SDL_GetTicksNS_REAL() Uint64;
pub extern fn SDL_startswith(string: [*c]const u8, prefix: [*c]const u8) bool;
pub extern fn SDL_endswith(string: [*c]const u8, suffix: [*c]const u8) bool;
pub const SDL_OBJECT_TYPE_GAMEPAD: c_int = 5;
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
pub extern fn SDL_AssertJoysticksLocked() void;
pub extern fn SDL_SetJoystickGUIDVersion(guid: [*c]SDL_GUID, version: Uint16) void;
pub extern fn SDL_SetJoystickGUIDCRC(guid: [*c]SDL_GUID, crc: Uint16) void;
pub extern fn SDL_GetGamepadTypeFromGUID(guid: SDL_GUID, name: [*c]const u8) SDL_GamepadType;
pub extern fn SDL_JoystickGUIDUsesVersion(guid: SDL_GUID) bool;
pub extern fn SDL_IsJoystickXboxOneElite(vendor_id: Uint16, product_id: Uint16) bool;
pub extern fn SDL_IsJoystickXboxSeriesX(vendor_id: Uint16, product_id: Uint16) bool;
pub extern fn SDL_IsJoystickDualSenseEdge(vendor_id: Uint16, product_id: Uint16) bool;
pub extern fn SDL_IsJoystickNintendoSwitchPro(vendor_id: Uint16, product_id: Uint16) bool;
pub extern fn SDL_IsJoystickNintendoSwitch2Pro(vendor_id: Uint16, product_id: Uint16) bool;
pub extern fn SDL_IsJoystickNintendoSwitchProInputOnly(vendor_id: Uint16, product_id: Uint16) bool;
pub extern fn SDL_IsJoystickNintendoSwitch2ProInputOnly(vendor_id: Uint16, product_id: Uint16) bool;
pub extern fn SDL_IsJoystickNintendoSwitchJoyConPair(vendor_id: Uint16, product_id: Uint16) bool;
pub extern fn SDL_IsJoystickGameCube(vendor_id: Uint16, product_id: Uint16) bool;
pub extern fn SDL_IsJoystickAmazonLunaController(vendor_id: Uint16, product_id: Uint16) bool;
pub extern fn SDL_IsJoystickGoogleStadiaController(vendor_id: Uint16, product_id: Uint16) bool;
pub extern fn SDL_IsJoystickNVIDIASHIELDController(vendor_id: Uint16, product_id: Uint16) bool;
pub extern fn SDL_IsJoystickSteamVirtualGamepad(vendor_id: Uint16, product_id: Uint16, version: Uint16) bool;
pub extern fn SDL_IsJoystickSteamController(vendor_id: Uint16, product_id: Uint16) bool;
pub extern fn SDL_IsJoystickHoriSteamController(vendor_id: Uint16, product_id: Uint16) bool;
pub extern fn SDL_IsJoystickSInputController(vendor_id: Uint16, product_id: Uint16) bool;
pub extern fn SDL_IsJoystickFlydigiController(vendor_id: Uint16, product_id: Uint16) bool;
pub extern fn SDL_IsJoystickGameSirController(vendor_id: Uint16, product_id: Uint16) bool;
pub extern fn SDL_IsJoystickSteamDeck(vendor_id: Uint16, product_id: Uint16) bool;
pub extern fn SDL_IsJoystickSteamTriton(vendor_id: Uint16, product_id: Uint16) bool;
pub extern fn SDL_IsJoystickWGI(guid: SDL_GUID) bool;
pub extern fn SDL_IsJoystickHIDAPI(guid: SDL_GUID) bool;
pub extern fn SDL_IsJoystickRAWINPUT(guid: SDL_GUID) bool;
pub extern fn SDL_IsJoystickVIRTUAL(guid: SDL_GUID) bool;
pub extern fn SDL_IsJoystickWheel(vendor_id: Uint16, product_id: Uint16, crc: Uint16) bool;
pub extern fn SDL_IsJoystickBeingAdded() bool;
pub extern fn SDL_SendJoystickSensor(timestamp: Uint64, joystick: [*c]SDL_Joystick, @"type": SDL_SensorType, sensor_timestamp: Uint64, data: [*c]const f32, num_values: c_int) void;
pub extern fn SDL_GetJoystickVirtualGamepadInfoForID(instance_id: SDL_JoystickID) [*c]const struct_SDL_SteamVirtualGamepadInfo;
pub extern fn SDL_IsJoystickValid(joystick: [*c]SDL_Joystick) bool;
pub const EMappingKind_None: c_int = 0;
pub const EMappingKind_Button: c_int = 1;
pub const EMappingKind_Axis: c_int = 2;
pub const EMappingKind_Hat: c_int = 3;
pub const EMappingKind = c_uint;
pub extern fn SDL_PrivateJoystickGetAutoGamepadMapping(instance_id: SDL_JoystickID, out: [*c]SDL_GamepadMapping) bool;
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
pub extern fn SDL_LoadVIDPIDList(list: [*c]SDL_vidpid_list) void;
pub extern fn SDL_VIDPIDInList(vendor_id: Uint16, product_id: Uint16, list: [*c]const SDL_vidpid_list) bool;
pub extern fn SDL_FreeVIDPIDList(list: [*c]SDL_vidpid_list) void;
pub const SDL_SteamVirtualGamepadInfo = struct_SDL_SteamVirtualGamepadInfo;
pub var s_GamepadMappings: [280][*c]const u8 = [280][*c]const u8{
    "03000000c82d00001930000011010000,8BitDo 64 Bluetooth Controller,a:b0,b:b1,back:-a3,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b6,leftstick:b13,lefttrigger:a5,leftx:a0,lefty:a1,misc1:b17,misc2:+a2,misc3:b10,rightshoulder:b7,righttrigger:a4,start:b11,x:+a3,y:-a2,",
    "05000000c82d00001930000001000000,8BitDo 64 Bluetooth Controller,a:b0,b:b1,back:-a3,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b6,leftstick:b13,lefttrigger:a5,leftx:a0,lefty:a1,misc1:b17,misc2:+a2,misc3:b10,rightshoulder:b7,righttrigger:a4,start:b11,x:+a3,y:-a2,",
    "03000000c82d00000090000011010000,8BitDo FC30 Pro,a:b1,b:b0,back:b10,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b6,leftstick:b13,lefttrigger:a4,leftx:a0,lefty:a1,rightshoulder:b7,rightstick:b14,righttrigger:a5,rightx:a2,righty:a3,start:b11,x:b4,y:b3,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,",
    "05000000c82d00001038000000010000,8BitDo FC30 Pro,a:b1,b:b0,back:b10,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b6,leftstick:b13,lefttrigger:a5,leftx:a0,lefty:a1,rightshoulder:b7,rightstick:b14,righttrigger:a4,rightx:a2,righty:a3,start:b11,x:b4,y:b3,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,",
    "05000000c82d00005106000000010000,8BitDo M30 Gamepad,a:b1,b:b0,back:b10,guide:b2,leftshoulder:b6,lefttrigger:a5,leftx:a0,lefty:a1,rightshoulder:b7,righttrigger:a4,start:b11,x:b4,y:b3,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,",
    "05000000c82d00002090000000010000,8BitDo Micro gamepad,a:b1,b:b0,back:b10,dpdown:+a1,dpleft:-a0,dpright:+a0,dpup:-a1,guide:b12,leftshoulder:b6,lefttrigger:b8,rightshoulder:b7,righttrigger:b9,start:b11,x:b4,y:b3,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,",
    "03000000c82d00001590000011010000,8BitDo N30 Pro 2,a:b1,b:b0,back:b10,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b2,leftshoulder:b6,leftstick:b13,lefttrigger:a4,leftx:a0,lefty:a1,rightshoulder:b7,rightstick:b14,righttrigger:a5,rightx:a2,righty:a3,start:b11,x:b4,y:b3,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,",
    "05000000c82d00006528000000010000,8BitDo N30 Pro 2,a:b1,b:b0,back:b10,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b2,leftshoulder:b6,leftstick:b13,lefttrigger:a5,leftx:a0,lefty:a1,rightshoulder:b7,rightstick:b14,righttrigger:a4,rightx:a2,righty:a3,start:b11,x:b4,y:b3,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,",
    "030000003512000012ab000010010000,8BitDo NES30 Gamepad,a:b1,b:b0,back:b10,dpdown:+a1,dpleft:-a0,dpright:+a0,dpup:-a1,leftshoulder:b6,rightshoulder:b7,start:b11,x:b4,y:b3,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,",
    "03000000022000000090000011010000,8BitDo NES30 Pro,a:b1,b:b0,back:b10,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b6,leftstick:b13,lefttrigger:b8,leftx:a0,lefty:a1,rightshoulder:b7,rightstick:b14,righttrigger:b9,rightx:a2,righty:a3,start:b11,x:b4,y:b3,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,",
    "03000000c82d00000190000011010000,8BitDo NES30 Pro,a:b1,b:b0,back:b10,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b6,leftstick:b13,lefttrigger:a4,leftx:a0,lefty:a1,rightshoulder:b7,rightstick:b14,righttrigger:a5,rightx:a2,righty:a3,start:b11,x:b4,y:b3,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,",
    "05000000203800000900000000010000,8BitDo NES30 Pro,a:b1,b:b0,back:b10,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b6,leftstick:b13,lefttrigger:b8,leftx:a0,lefty:a1,rightshoulder:b7,rightstick:b14,righttrigger:b9,rightx:a2,righty:a3,start:b11,x:b4,y:b3,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,",
    "05000000c82d00002038000000010000,8BitDo NES30 Pro,a:b1,b:b0,back:b10,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b2,leftshoulder:b6,leftstick:b13,lefttrigger:a5,leftx:a0,lefty:a1,rightshoulder:b7,rightstick:b14,righttrigger:a4,rightx:a2,righty:a3,start:b11,x:b4,y:b3,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,",
    "03000000c82d00000660000011010000,8BitDo Pro 2,a:b1,b:b0,back:b10,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b6,leftstick:b13,lefttrigger:a5,leftx:a0,lefty:a1,rightshoulder:b7,rightstick:b14,righttrigger:a4,rightx:a2,righty:a3,start:b11,x:b4,y:b3,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,",
    "05000000c82d00000660000000010000,8BitDo Pro 2,a:b1,b:b0,back:b10,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b6,leftstick:b13,lefttrigger:a5,leftx:a0,lefty:a1,rightshoulder:b7,rightstick:b14,righttrigger:a4,rightx:a2,righty:a3,start:b11,x:b4,y:b3,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,",
    "03000000c82d00000960000011010000,8BitDo Pro 3,a:b1,b:b0,back:b10,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b6,leftstick:b13,lefttrigger:a5,leftx:a0,lefty:a1,paddle1:b17,paddle2:b16,paddle3:b2,paddle4:b5,rightshoulder:b7,rightstick:b14,righttrigger:a4,rightx:a2,righty:a3,start:b11,x:b4,y:b3,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,",
    "05000000c82d00000061000000010000,8BitDo SF30 Pro,a:b1,b:b0,back:b10,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b2,leftshoulder:b6,leftstick:b13,lefttrigger:a5,leftx:a0,lefty:a1,rightshoulder:b7,rightstick:b14,righttrigger:a4,rightx:a2,righty:a3,start:b11,x:b4,y:b3,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,",
    "05000000102800000900000000010000,8BitDo SFC30 Gamepad,a:b1,b:b0,back:b10,leftshoulder:b6,leftx:a0,lefty:a1,rightshoulder:b7,start:b11,x:b4,y:b3,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,",
    "05000000c82d00003028000000010000,8BitDo SFC30 Gamepad,a:b1,b:b0,back:b10,leftshoulder:b6,leftx:a0,lefty:a1,rightshoulder:b7,start:b11,x:b4,y:b3,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,",
    "03000000c82d00000260000011010000,8BitDo SN30 Pro+,a:b1,b:b0,back:b10,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b2,leftshoulder:b6,leftstick:b13,lefttrigger:b8,leftx:a0,lefty:a1,rightshoulder:b7,rightstick:b14,righttrigger:b9,rightx:a2,righty:a3,start:b11,x:b4,y:b3,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,",
    "05000000c82d00000261000000010000,8BitDo SN30 Pro+,a:b1,b:b0,back:b10,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b2,leftshoulder:b6,leftstick:b13,lefttrigger:b8,leftx:a0,lefty:a1,rightshoulder:b7,rightstick:b14,righttrigger:b9,rightx:a2,righty:a3,start:b11,x:b4,y:b3,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,",
    "030000003512000020ab000010010000,8BitDo SNES30 Gamepad,a:b1,b:b0,back:b10,dpdown:+a1,dpleft:-a0,dpright:+a0,dpup:-a1,leftshoulder:b6,rightshoulder:b7,start:b11,x:b4,y:b3,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,",
    "05000000202800000900000000010000,8BitDo SNES30 Gamepad,a:b1,b:b0,back:b10,dpdown:b122,dpleft:b119,dpright:b120,dpup:b117,leftshoulder:b6,rightshoulder:b7,start:b11,x:b4,y:b3,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,",
    "05000000c82d00001b30000001000000,8BitDo Ultimate 2C Wireless,a:b0,b:b1,back:b10,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b6,leftstick:b13,lefttrigger:a5,leftx:a0,lefty:a1,paddle1:b5,paddle2:b2,rightshoulder:b7,rightstick:b14,righttrigger:a4,rightx:a2,righty:a3,start:b11,x:b3,y:b4,",
    "03000000c82d00001130000011010000,8BitDo Ultimate Wired Controller,a:b0,b:b1,back:b10,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b6,leftstick:b13,lefttrigger:a5,leftx:a0,lefty:a1,misc1:b26,paddle1:b24,paddle2:b25,rightshoulder:b7,rightstick:b14,righttrigger:a4,rightx:a2,righty:a3,start:b11,x:b3,y:b4,",
    "03000000c82d00001330000011010000,8BitDo Ultimate Wireless Controller,a:b0,b:b1,back:b10,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b6,leftstick:b13,lefttrigger:a5,leftx:a0,lefty:a1,misc1:b26,paddle1:b23,paddle2:b19,rightshoulder:b7,rightstick:b14,righttrigger:a4,rightx:a2,righty:a3,start:b11,x:b3,y:b4,",
    "03000000c82d00001890000011010000,8BitDo Zero 2,a:b1,b:b0,back:b10,leftshoulder:b6,leftx:a0,lefty:a1,rightshoulder:b7,start:b11,x:b4,y:b3,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,",
    "05000000c82d00003032000000010000,8BitDo Zero 2,a:b1,b:b0,back:b10,leftshoulder:b6,leftx:a0,lefty:a1,rightshoulder:b7,start:b11,x:b4,y:b3,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,",
    "05000000a00500003232000001000000,8BitDo Zero Gamepad,a:b1,b:b0,back:b10,dpdown:b122,dpleft:b119,dpright:b120,dpup:b117,leftshoulder:b6,rightshoulder:b7,start:b11,x:b4,y:b3,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,",
    "05000000a00500003232000008010000,8BitDo Zero Gamepad,a:b1,b:b0,back:b10,dpdown:+a1,dpleft:-a0,dpright:+a0,dpup:-a1,leftshoulder:b6,rightshoulder:b7,start:b11,x:b4,y:b3,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,",
    "03000000c82d00000031000011010000,8Bitdo Receiver,a:b1,b:b0,back:b10,leftshoulder:b6,leftx:a0,lefty:a1,rightshoulder:b7,start:b11,x:b4,y:b3,",
    "03000000c82d00001290000011010000,8Bitdo SN30 Gamepad,a:b1,b:b0,back:b10,leftshoulder:b6,leftx:a0,lefty:a1,rightshoulder:b7,start:b11,x:b4,y:b3,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,",
    "05000000c82d00006228000000010000,8Bitdo SN30 Gamepad,a:b1,b:b0,back:b10,leftshoulder:b6,leftx:a0,lefty:a1,rightshoulder:b7,start:b11,x:b4,y:b3,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,",
    "05000000050b00000045000031000000,ASUS Gamepad,a:b0,b:b1,back:b9,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b6,leftshoulder:b4,leftstick:b7,lefttrigger:a5,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b8,righttrigger:a4,rightx:a2,righty:a3,start:b10,x:b2,y:b3,",
    "05000000050b00000045000040000000,ASUS Gamepad,a:b0,b:b1,back:b9,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b6,leftshoulder:b4,leftstick:b7,lefttrigger:a5,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b8,righttrigger:a4,rightx:a2,righty:a3,start:b10,x:b2,y:b3,",
    "03000000050b00000579000011010000,ASUS ROG Kunai 3 Gamepad,a:b0,b:b1,back:b10,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b6,leftstick:b13,lefttrigger:a5,leftx:a0,lefty:a1,misc1:b36,paddle1:b52,paddle2:b53,rightshoulder:b7,rightstick:b14,righttrigger:a4,rightx:a2,righty:a3,start:b11,x:b3,y:b4,",
    "05000000050b00000679000000010000,ASUS ROG Kunai 3 Gamepad,a:b0,b:b1,back:b10,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b6,leftstick:b13,lefttrigger:a5,leftx:a0,lefty:a1,misc1:b21,paddle1:b22,paddle2:b23,rightshoulder:b7,rightstick:b14,righttrigger:a4,rightx:a2,righty:a3,start:b11,x:b3,y:b4,",
    "03000000100000008200000011010000,Akishop Customs PS360+ v1.66,a:b1,b:b2,back:b12,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b8,leftshoulder:b4,lefttrigger:b6,rightshoulder:b5,righttrigger:b7,start:b9,x:b0,y:b3,",
    "05000000491900000204000021000000,Amazon Fire Game Controller,a:b0,b:b1,back:b10,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b17,leftshoulder:b6,leftstick:b13,lefttrigger:a5,leftx:a0,lefty:a1,misc1:b12,rightshoulder:b7,rightstick:b14,righttrigger:a4,rightx:a2,righty:a3,start:b11,x:b3,y:b4,",
    "03000000491900001904000011010000,Amazon Luna Controller,a:b0,b:b1,back:b6,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b8,leftshoulder:b4,leftstick:b10,lefttrigger:a3,leftx:a0,lefty:a1,misc1:b9,rightshoulder:b5,rightstick:b11,righttrigger:a4,rightx:a2,righty:a5,start:b7,x:b2,y:b3,",
    "05000000710100001904000000010000,Amazon Luna Controller,a:b0,b:b1,back:b9,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b10,leftshoulder:b4,leftstick:b7,lefttrigger:a5,leftx:a0,lefty:a1,misc1:b11,rightshoulder:b5,rightstick:b8,righttrigger:a4,rightx:a2,righty:a3,start:b6,x:b2,y:b3,",
    "03000000790000003018000011010000,Arcade Fightstick F300,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,righttrigger:b7,start:b9,x:b0,y:b3,",
    "03000000503200000110000000000000,Atari Classic Controller,a:b0,back:b2,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b4,start:b3,x:b1,",
    "05000000503200000110000000000000,Atari Classic Controller,a:b0,back:b2,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b4,start:b3,x:b1,",
    "03000000503200000210000000000000,Atari Game Controller,a:b0,b:b1,back:b9,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b10,leftshoulder:b4,leftstick:b6,lefttrigger:a5,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b7,righttrigger:a4,rightx:a2,righty:a3,start:b8,x:b2,y:b3,",
    "05000000503200000210000000000000,Atari Game Controller,a:b0,b:b1,back:b6,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b8,leftshoulder:b4,leftstick:b9,lefttrigger:a2,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b10,righttrigger:a5,rightx:a3,righty:a4,start:b7,x:b3,y:b2,",
    "05000000503200000210000000000000128804098,Atari Game Controller,a:b0,b:b1,back:b6,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b8,leftshoulder:b4,leftstick:b9,lefttrigger:a2,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b10,righttrigger:a5,rightx:a3,righty:a4,start:b7,x:b3,y:b2,",
    "03000000c62400001b89000011010000,BDA MOGA XP5-X Plus,a:b0,b:b1,back:b10,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b6,leftstick:b13,lefttrigger:a5,leftx:a0,lefty:a1,rightshoulder:b7,rightstick:b14,righttrigger:a4,rightx:a2,righty:a3,start:b11,x:b3,y:b4,",
    "03000000d62000002a79000011010000,BDA PS4 Fightpad,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:a3,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:a4,rightx:a2,righty:a5,start:b9,x:b0,y:b3,",
    "03000000120c0000f70e000011010000,Brook Universal Fighting Board,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:,lefty:,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:,righty:,start:b9,x:b0,y:b3,",
    "03000000b40400000a01000000010000,CYPRESS USB Gamepad,a:b0,b:b1,back:b5,guide:b2,leftshoulder:b6,leftx:a0,lefty:a1,rightshoulder:b7,start:b8,x:b3,y:b4,",
    "03000000ffff0000ffff000000010000,Chinese-made Xbox Controller,a:b0,b:b1,back:b6,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b5,leftstick:b8,lefttrigger:a2,leftx:a0,lefty:a1,rightshoulder:b2,rightstick:b9,righttrigger:a5,rightx:a3,righty:a4,start:b7,x:b3,y:b4,",
    "03000000e82000006058000001010000,Cideko AK08b,a:b2,b:b1,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b3,y:b0,",
    "03000000260900008888000000010000,Cyber Gadget GameCube Controller,a:b0,b:b1,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,lefttrigger:a4,leftx:a0,lefty:a1,rightshoulder:b6,righttrigger:a5,rightx:a2,righty:a3~,start:b7,x:b2,y:b3,",
    "03000000a306000022f6000011010000,Cyborg V.3 Rumble Pad,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:+a3,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:-a3,rightx:a2,righty:a4,start:b9,x:b0,y:b3,",
    "050000004c050000f20d000000010000,DualSense Edge Wireless Controller,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:a3,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:a4,rightx:a2,righty:a5,start:b9,x:b0,y:b3,",
    "030000006f0e00003001000001010000,EA Sports PS3 Controller,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b0,y:b3,",
    "03000000790000001100000010010000,Elecom Gamepad,crc:e86c,a:b2,b:b3,back:b6,dpdown:+a1,dpleft:-a0,dpright:+a0,dpup:-a1,leftshoulder:b4,rightshoulder:b5,start:b7,x:b0,y:b1,",
    "0500000047532067616d657061640000,GS Gamepad,a:b0,b:b1,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b8,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b2,y:b3,",
    "03000000341a000005f7000010010000,GameCube {HuiJia USB box},a:b1,b:b0,dpdown:b14,dpleft:b15,dpright:b13,dpup:b12,lefttrigger:a3,leftx:a0,lefty:a1,rightshoulder:b7,righttrigger:a4,rightx:a5,righty:a2,start:b9,x:b2,y:b3,",
    "03000000bc2000000055000011010000,GameSir G3w,a:b0,b:b1,back:b10,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b6,leftstick:b13,lefttrigger:a5,leftx:a0,lefty:a1,rightshoulder:b7,rightstick:b14,righttrigger:a4,rightx:a2,righty:a3,start:b11,x:b3,y:b4,",
    "0500000049190000020400001b010000,GameSir T4 Pro,crc:8283,a:b0,b:b1,back:b10,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b23,leftshoulder:b6,leftstick:b13,lefttrigger:a5,leftx:a0,lefty:a1,rightshoulder:b7,rightstick:b14,righttrigger:a4,rightx:a2,righty:a3,start:b11,x:b3,y:b4,",
    "03000000373500009710000001020000,GameSir-K1 FLUX,a:b0,b:b1,back:b10,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b6,leftstick:b13,lefttrigger:a5,leftx:a0,lefty:a1,misc1:b15,rightshoulder:b7,rightstick:b14,righttrigger:a4,rightx:a2,righty:a3,start:b11,x:b3,y:b4,",
    "03000000ac0500001a06000011010000,GameSir-T3 2.02,a:b0,b:b1,back:b10,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b15,leftshoulder:b6,leftstick:b13,lefttrigger:a5,leftx:a0,lefty:a1,rightshoulder:b7,rightstick:b14,righttrigger:a4,rightx:a2,righty:a3,start:b11,x:b3,y:b4,",
    "0500000047532047616d657061640000,GameStop Gamepad,a:b0,b:b1,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b2,y:b3,",
    "03000000c01100000140000011010000,GameStop PS4 Fun Controller,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:a3,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:a4,rightx:a2,righty:a5,start:b9,x:b0,y:b3,",
    "030000008f0e00000800000010010000,Gasia Co. Ltd PS(R) Gamepad,a:b2,b:b1,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b3,y:b0,",
    "03000000f0250000c183000010010000,Goodbetterbest Ltd USB Controller,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b0,y:b3,",
    "03000000d11800000094000011010000,Google Stadia Controller,a:b0,b:b1,back:b6,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b8,leftshoulder:b4,leftstick:b9,lefttrigger:a5,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b10,righttrigger:a4,rightx:a2,righty:a3,start:b7,x:b2,y:b3,",
    "05000000d11800000094000000010000,Google Stadia Controller,a:b0,b:b1,back:b6,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b8,leftshoulder:b4,leftstick:b9,lefttrigger:a5,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b10,righttrigger:a4,rightx:a2,righty:a3,start:b7,x:b2,y:b3,",
    "03000000280400000140000000010000,Gravis Gamepad Pro USB ,a:b1,b:b2,back:b8,leftshoulder:b4,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,righttrigger:b7,start:b9,x:b0,y:b3,",
    "030000008f0e00000610000000010000,GreenAsia Electronics 4Axes 12Keys Gamepad,a:b2,b:b1,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b6,leftstick:b9,lefttrigger:b4,leftx:a0,lefty:a1,rightshoulder:b7,rightstick:b10,righttrigger:b5,rightx:a3,righty:a2,start:b11,x:b3,y:b0,",
    "030000008f0e00001200000010010000,GreenAsia Inc. USB Joystick,a:b0,b:b1,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b4,leftstick:b10,lefttrigger:b5,leftx:a0,lefty:a1,rightshoulder:b6,rightstick:b11,righttrigger:b7,rightx:a3,righty:a2,start:b9,x:b2,y:b3,",
    "030000000d0f00001000000011010000,HORI CO. LTD. FIGHTING STICK 3,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,lefttrigger:b6,rightshoulder:b5,righttrigger:b7,start:b9,x:b0,y:b3,",
    "030000000d0f00002200000011010000,HORI CO. LTD. REAL ARCADE Pro.V3,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,lefttrigger:b6,rightshoulder:b5,righttrigger:b7,start:b9,x:b0,y:b3,",
    "030000000d0f00006a00000011010000,HORI CO. LTD. Real Arcade Pro.4,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:a3,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:a4,rightx:a2,righty:a5,start:b9,x:b0,y:b3,",
    "030000000d0f00006b00000011010000,HORI CO. LTD. Real Arcade Pro.4,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b0,y:b3,",
    "030000000d0f00005001000009040000,HORI Fighting Commander OCTA,a:b0,b:b1,back:b6,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b8,leftshoulder:b4,leftstick:b9,lefttrigger:a2,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b10,righttrigger:a5,rightx:a3,righty:a4,start:b7,x:b2,y:b3,",
    "030000000d0f00008400000011010000,HORI Fighting Commander,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:a3,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:a4,rightx:a2,righty:a5,start:b9,x:b0,y:b3,",
    "030000000d0f00008500000010010000,HORI Fighting Commander,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b0,y:b3,",
    "030000000d0f00008800000011010000,HORI Fighting Stick mini 4 (PS3),a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:b6,rightshoulder:b5,rightstick:b11,righttrigger:b7,start:b9,x:b0,y:b3,",
    "030000000d0f00008700000011010000,HORI Fighting Stick mini 4 (PS4),a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:a3,rightshoulder:b5,rightstick:b11,righttrigger:a4,start:b9,x:b0,y:b3,",
    "030000000d0f0000d800000072056800,HORI Real Arcade Pro S,a:b0,b:b1,back:b4,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b5,leftshoulder:b9,leftstick:b7,lefttrigger:a4,leftx:a0,lefty:a1,rightshoulder:b10,rightstick:b8,righttrigger:a5,rightx:a2,righty:a3,start:b6,x:b2,y:b3,",
    "030000000d0f0000aa00000011010000,HORI Real Arcade Pro,a:b2,b:b1,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b3,y:b0,",
    "030000000d0f00006e00000011010000,HORIPAD 4 (PS3),a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b0,y:b3,",
    "030000000d0f00006600000011010000,HORIPAD 4 (PS4),a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:a3,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:a4,rightx:a2,righty:a5,start:b9,x:b0,y:b3,",
    "06000000adde0000efbe000002010000,Hidromancer Game Controller,a:b0,b:b1,back:b6,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b8,leftshoulder:b4,leftstick:b9,lefttrigger:a2,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b10,righttrigger:a5,rightx:a3,righty:a4,start:b7,x:b2,y:b3,",
    "03000000d81400000862000011010000,HitBox (PS3/PC) Analog Mode,a:b1,b:b2,back:b8,guide:b9,leftshoulder:b4,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,righttrigger:b7,start:b12,x:b0,y:b3,",
    "030000000d0f00005f00000011010000,Hori Fighting Commander 4 (PS3),a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b0,y:b3,",
    "030000000d0f00005e00000011010000,Hori Fighting Commander 4 (PS4),a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,lefttrigger:a3,leftx:a0,lefty:a1,rightshoulder:b5,righttrigger:a4,rightx:a2,righty:a5,start:b9,x:b0,y:b3,",
    "030000000d0f00008600000002010000,Hori Fighting Commander,a:b0,b:b1,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b10,leftshoulder:b4,leftstick:b11,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b12,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b2,y:b3,",
    "030000008f0e00001330000010010000,HuiJia SNES Controller,a:b2,b:b1,back:b8,dpdown:+a1,dpleft:-a0,dpright:+a0,dpup:-a1,leftshoulder:b6,rightshoulder:b7,start:b9,x:b3,y:b0,",
    "03000000d80400008200000003000000,IMS PCU#0 Gamepad Interface,a:b1,b:b0,back:b4,dpdown:+a1,dpleft:-a0,dpright:+a0,dpup:-a1,start:b5,x:b3,y:b2,",
    "03000000fd0500000030000000010000,InterAct GoPad I-73000 (Fighting Game Layout),a:b3,b:b4,back:b6,leftx:a0,lefty:a1,rightshoulder:b2,righttrigger:b5,start:b7,x:b0,y:b1,",
    "05000000491900000204000000000000,Ipega PG-9087S,a:b0,b:b1,back:b10,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b6,leftstick:b13,lefttrigger:b8,leftx:a0,lefty:a1,rightshoulder:b7,rightstick:b14,righttrigger:b9,rightx:a2,righty:a3,start:b11,x:b3,y:b4,",
    "030000006e0500000320000010010000,JC-U3613M - DirectInput Mode,a:b2,b:b3,back:b10,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b8,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b9,righttrigger:b7,rightx:a2,righty:a3,start:b11,x:b0,y:b1,",
    "03000000300f00001001000010010000,Jess Tech Dual Analog Rumble Pad,a:b2,b:b3,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b4,leftstick:b10,lefttrigger:b5,leftx:a0,lefty:a1,rightshoulder:b6,rightstick:b11,righttrigger:b7,rightx:a3,righty:a2,start:b9,x:b0,y:b1,",
    "03000000ba2200002010000001010000,Jess Technology USB Game Controller,a:b2,b:b1,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b4,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,righttrigger:b7,rightx:a3,righty:a2,start:b9,x:b3,y:b0,",
    "030000006d040000d1ca000011010000,Logitech Chillstream,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b0,y:b3,",
    "030000006d04000019c2000010010000,Logitech Cordless RumblePad 2,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b0,y:b3,",
    "030000006d04000016c2000010010000,Logitech Dual Action,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b0,y:b3,",
    "030000006d04000016c2000011010000,Logitech Dual Action,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b0,y:b3,",
    "030000006d04000019c2000011010000,Logitech F710 Gamepad (DInput),a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b0,y:b3,",
    "030000006d04000018c2000010010000,Logitech RumblePad 2,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b0,y:b3,",
    "030000006d04000011c2000010010000,Logitech WingMan Cordless RumblePad,a:b0,b:b1,back:b2,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b5,leftshoulder:b6,lefttrigger:b9,leftx:a0,lefty:a1,rightshoulder:b7,righttrigger:b10,rightx:a3,righty:a4,start:b8,x:b3,y:b4,",
    "03000000c62400002b89000011010000,MOGA XP5-A Plus,a:b0,b:b1,back:b10,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b6,leftstick:b13,lefttrigger:a5,leftx:a0,lefty:a1,rightshoulder:b7,rightstick:b14,righttrigger:a4,rightx:a2,righty:a3,start:b11,x:b3,y:b4,",
    "05000000c62400002a89000000010000,MOGA XP5-A Plus,a:b0,b:b1,back:b10,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b22,leftshoulder:b6,leftstick:b13,lefttrigger:a5,leftx:a0,lefty:a1,rightshoulder:b7,rightstick:b14,righttrigger:a4,rightx:a2,righty:a3,start:b11,x:b3,y:b4,",
    "05000000c62400001a89000000010000,MOGA XP5-X Plus,a:b0,b:b1,back:b10,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b6,leftstick:b13,lefttrigger:a5,leftx:a0,lefty:a1,rightshoulder:b7,rightstick:b14,righttrigger:a4,rightx:a2,righty:a3,start:b11,x:b3,y:b4,",
    "03000000250900006688000000010000,MP-8866 Super Dual Box,a:b2,b:b1,back:b9,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b6,leftstick:b10,lefttrigger:b4,leftx:a0,lefty:a1,rightshoulder:b7,rightstick:b11,righttrigger:b5,rightx:a2,righty:a3,start:b8,x:b3,y:b0,",
    "05000000380700006652000025010000,Mad Catz C.T.R.L.R ,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b0,y:b3,",
    "03000000380700005032000011010000,Mad Catz FightPad PRO (PS3),a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b0,y:b3,",
    "03000000380700005082000011010000,Mad Catz FightPad PRO (PS4),a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:a3,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:a4,rightx:a2,righty:a5,start:b9,x:b0,y:b3,",
    "03000000380700008433000011010000,Mad Catz FightStick TE S+ (PS3),a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b0,y:b3,",
    "03000000380700008483000011010000,Mad Catz FightStick TE S+ (PS4),a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:a3,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:a4,rightx:a2,righty:a5,start:b9,x:b0,y:b3,",
    "03000000380700008034000011010000,Mad Catz fightstick (PS3),a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b0,y:b3,",
    "03000000380700008084000011010000,Mad Catz fightstick (PS4),a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,lefttrigger:a3,leftx:a0,lefty:a1,rightshoulder:b5,righttrigger:a4,rightx:a2,righty:a5,start:b9,x:b0,y:b3,",
    "03000000380700001888000010010000,MadCatz PC USB Wired Stick 8818,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b0,y:b3,",
    "03000000380700003888000010010000,MadCatz PC USB Wired Stick 8838,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:a0,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b0,y:b3,",
    "03000000780000000600000010010000,Microntek USB Joystick,a:b2,b:b1,back:b8,leftshoulder:b6,lefttrigger:b4,leftx:a0,lefty:a1,rightshoulder:b7,righttrigger:b5,start:b9,x:b3,y:b0,",
    "030000005e0400000e00000000010000,Microsoft SideWinder,a:b0,b:b1,back:b9,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b6,rightshoulder:b7,start:b8,x:b3,y:b4,",
    "05000000d6200000ad0d000001000000,Moga Pro,a:b0,b:b1,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b4,leftstick:b7,lefttrigger:a5,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b8,righttrigger:a4,rightx:a2,righty:a3,start:b6,x:b2,y:b3,",
    "030000006b140000010c000010010000,NACON GC-400ES,a:b0,b:b1,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b2,y:b3,",
    "030000001008000001e5000010010000,NEXT SNES Controller,a:b2,b:b1,back:b8,dpdown:+a1,dpleft:-a0,dpright:+a0,dpup:-a1,leftshoulder:b4,rightshoulder:b6,start:b9,x:b3,y:b0,",
    "03000000550900001072000011010000,NVIDIA Controller v01.03,a:b0,b:b1,back:b14,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b15,leftshoulder:b4,leftstick:b8,lefttrigger:a5,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b9,righttrigger:a4,rightx:a2,righty:a3,start:b7,x:b2,y:b3,",
    "03000000550900001472000011010000,NVIDIA Controller v01.04,a:b0,b:b1,back:b14,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b16,leftshoulder:b4,leftstick:b7,lefttrigger:a3,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b8,righttrigger:a4,rightx:a2,righty:a5,start:b6,x:b2,y:b3,",
    "05000000550900001472000001000000,NVIDIA Controller v01.04,a:b0,b:b1,back:b14,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b16,leftshoulder:b4,leftstick:b7,lefttrigger:a3,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b8,righttrigger:a4,rightx:a2,righty:a5,start:b6,x:b2,y:b3,",
    "030000004b120000014d000000010000,NYKO AIRFLO EX,a:b0,b:b1,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b10,leftshoulder:b4,leftstick:b11,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b12,righttrigger:b7,rightx:a3,righty:a2,start:b9,x:b2,y:b3,",
    "03000000451300000830000010010000,NYKO CORE,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a2,righty:a5,start:b9,x:b0,y:b3,",
    "0300000085320000030c000011010000,Nacon GC100,a:b2,b:b1,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b3,y:b0,",
    "03000000790000004318000010010000,Nintendo GameCube Controller,a:b1,b:b2,dpdown:b14,dpleft:b15,dpright:b13,dpup:b12,lefttrigger:a3,leftx:a0,lefty:a1,rightshoulder:b7,righttrigger:a4,rightx:a5,righty:a2,start:b9,x:b0,y:b3,",
    "03000000790000004418000010010000,Nintendo GameCube Controller,a:b1,b:b2,dpdown:b14,dpleft:b15,dpright:b13,dpup:b12,lefttrigger:a3,leftx:a0,lefty:a1,rightshoulder:b7,righttrigger:a4,rightx:a5,righty:a2,start:b9,x:b0,y:b3,",
    "03000000790000004618000010010000,Nintendo GameCube Controller,a:b1,b:b2,dpdown:b14,dpleft:b15,dpright:b13,dpup:b12,lefttrigger:a3,leftx:a0,lefty:a1,rightshoulder:b7,righttrigger:a4,rightx:a5,righty:a2,start:b9,x:b0,y:b3,",
    "030000007e0500001920000011810000,Nintendo N64 Controller,crc:d670,a:b0,b:b1,back:b2,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b6,leftstick:b9,lefttrigger:b8,leftx:a0,lefty:a1,misc1:b5,rightshoulder:b7,righttrigger:b3,start:b11,x:b4,y:b10,",
    "050000007e0500001920000001800000,Nintendo N64 Controller,crc:5e1c,a:b0,b:b1,back:b2,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b6,leftstick:b9,lefttrigger:b8,leftx:a0,lefty:a1,misc1:b5,rightshoulder:b7,righttrigger:b3,start:b11,x:b4,y:b10,",
    "050000007e0500000720000001800000,Nintendo NES Controller (L),crc:a5a7,a:b1,b:b0,back:b4,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b2,rightshoulder:b3,start:b5,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,",
    "050000007e0500000720000001800000,Nintendo NES Controller (R),crc:05ae,a:b1,b:b0,back:b4,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b2,rightshoulder:b3,start:b5,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,",
    "030000007e0500001e20000011810000,Nintendo SEGA Genesis Controller,crc:bb22,a:b0,b:b1,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b6,misc1:b3,rightshoulder:b2,righttrigger:b4,start:b5,",
    "050000007e0500001720000001800000,Nintendo SEGA Genesis Controller,crc:c1bf,a:b0,b:b1,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b6,misc1:b3,rightshoulder:b2,righttrigger:b4,start:b5,",
    "030000007e0500001720000011810000,Nintendo SNES Controller,crc:f648,a:b0,b:b1,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b4,lefttrigger:b6,rightshoulder:b5,righttrigger:b7,start:b9,x:b3,y:b2,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,",
    "050000007e0500001720000001800000,Nintendo SNES Controller,crc:dbc0,a:b0,b:b1,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b4,lefttrigger:b6,rightshoulder:b5,righttrigger:b7,start:b9,x:b3,y:b2,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,",
    "050000007e0500000620000001800000,Nintendo Switch Joy-Con (L),crc:0067,a:b9,b:b8,guide:b0,leftshoulder:b2,leftstick:b6,leftx:a1,lefty:a0~,paddle2:b1,paddle4:b3,rightshoulder:b4,start:b5,x:b7,y:b10,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,",
    "060000007e0500000620000000000000,Nintendo Switch Joy-Con (L/R),a:b0,b:b1,back:b9,dpdown:b15,dpleft:b16,dpright:b17,dpup:b14,leftshoulder:b5,leftstick:b12,lefttrigger:b7,leftx:a0,lefty:a1,rightshoulder:b6,rightstick:b13,righttrigger:b8,rightx:a2,righty:a3,start:b10,x:b3,y:b2,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,",
    "060000007e0500000820000000000000,Nintendo Switch Joy-Con (L/R),a:b0,b:b1,back:b9,dpdown:b15,dpleft:b16,dpright:b17,dpup:b14,guide:b11,leftshoulder:b5,leftstick:b12,lefttrigger:b7,leftx:a0,lefty:a1,rightshoulder:b6,rightstick:b13,righttrigger:b8,rightx:a2,righty:a3,start:b10,x:b3,y:b2,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,",
    "050000007e0500000720000001800000,Nintendo Switch Joy-Con (R),crc:a06e,a:b1,b:b2,guide:b9,leftshoulder:b4,leftstick:b10,leftx:a1~,lefty:a0,paddle1:b5,paddle3:b7,rightshoulder:b6,start:b8,x:b0,y:b3,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,",
    "03000000d620000013a7000011010000,Nintendo Switch PowerA Controller,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b0,y:b3,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,",
    "030000007e0500000920000011810000,Nintendo Switch Pro Controller,a:b0,b:b1,back:b9,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b11,leftshoulder:b5,leftstick:b12,lefttrigger:b7,leftx:a0,lefty:a1,misc1:b4,rightshoulder:b6,rightstick:b13,righttrigger:b8,rightx:a2,righty:a3,start:b10,x:b3,y:b2,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,",
    "050000004c69632050726f20436f6e00,Nintendo Switch Pro Controller,crc:15b7,a:b0,b:b1,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,misc1:b13,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b2,y:b3,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,",
    "050000007e0500000920000001000000,Nintendo Switch Pro Controller,a:b1,b:b0,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b3,y:b2,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,",
    "050000007e0500000920000001800000,Nintendo Switch Pro Controller,a:b0,b:b1,back:b9,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b11,leftshoulder:b5,leftstick:b12,lefttrigger:b7,leftx:a0,lefty:a1,rightshoulder:b6,rightstick:b13,righttrigger:b8,rightx:a2,righty:a3,start:b10,x:b3,y:b2,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,",
    "050000007e0500000603000000060000,Nintendo Wii Remote Classic Controller,crc:0d8a,a:b1,b:b0,back:b10,dpdown:b14,dpleft:b12,dpright:b13,dpup:b11,guide:b8,leftshoulder:b4,lefttrigger:b6,leftx:a0,lefty:a1~,rightshoulder:b5,righttrigger:b7,rightx:a2,righty:a3~,start:b9,x:b3,y:b2,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,",
    "050000007e0500003003000001000000,Nintendo Wii Remote Pro Controller,a:b0,b:b1,back:b8,dpdown:b14,dpleft:b15,dpright:b16,dpup:b13,guide:b10,leftshoulder:b4,leftstick:b11,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b12,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b3,y:b2,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,",
    "050000007e0500000603000000060000,Nintendo Wii Remote,crc:60be,a:b1,b:b0,back:b4,dpdown:b8,dpleft:b6,dpright:b7,dpup:b5,guide:b2,start:b3,x:b9,y:b10,",
    "05000000010000000100000003000000,Nintendo Wiimote,a:b0,b:b1,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b10,leftshoulder:b4,leftstick:b11,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b12,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b2,y:b3,",
    "030000000d0500000308000010010000,Nostromo n45 Dual Analog Gamepad,a:b0,b:b1,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b9,leftshoulder:b4,leftstick:b12,lefttrigger:b5,leftx:a0,lefty:a1,rightshoulder:b6,rightstick:b11,righttrigger:b7,rightx:a3,righty:a2,start:b10,x:b2,y:b3,",
    "05000000362800000100000002010000,OUYA Game Controller,a:b0,b:b3,dpdown:b9,dpleft:b10,dpright:b11,dpup:b8,guide:b14,leftshoulder:b4,leftstick:b6,lefttrigger:a2,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b7,righttrigger:a5,rightx:a3,righty:a4,x:b1,y:b2,",
    "05000000362800000100000003010000,OUYA Game Controller,a:b0,b:b3,dpdown:b9,dpleft:b10,dpright:b11,dpup:b8,guide:b14,leftshoulder:b4,leftstick:b6,lefttrigger:a2,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b7,righttrigger:a5,rightx:a3,righty:a4,x:b1,y:b2,",
    "03000000ff1100003133000010010000,PC Game Controller,a:b2,b:b1,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b3,y:b0,",
    "030000006f0e00000901000011010000,PDP Versus Fighting Pad,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,lefttrigger:b6,rightshoulder:b5,righttrigger:b7,start:b9,x:b0,y:b3,",
    "03000000ff1100004133000010010000,PS2 Controller,a:b2,b:b1,back:b8,leftshoulder:b6,lefttrigger:b4,leftx:a0,lefty:a1,rightshoulder:b7,righttrigger:b5,start:b9,x:b3,y:b0,",
    "03000000341a00003608000011010000,PS3 Controller,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b0,y:b3,",
    "030000004c0500006802000010010000,PS3 Controller,a:b14,b:b13,back:b0,dpdown:b6,dpleft:b7,dpright:b5,dpup:b4,guide:b16,leftshoulder:b10,leftstick:b1,lefttrigger:b8,leftx:a0,lefty:a1,rightshoulder:b11,rightstick:b2,righttrigger:b9,rightx:a2,righty:a3,start:b3,x:b15,y:b12,",
    "030000004c0500006802000010810000,PS3 Controller,a:b0,b:b1,back:b8,dpdown:b14,dpleft:b15,dpright:b16,dpup:b13,guide:b10,leftshoulder:b4,leftstick:b11,lefttrigger:a2,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b12,righttrigger:a5,rightx:a3,righty:a4,start:b9,x:b3,y:b2,",
    "030000004c0500006802000011010000,PS3 Controller,a:b14,b:b13,back:b0,dpdown:b6,dpleft:b7,dpright:b5,dpup:b4,guide:b16,leftshoulder:b10,leftstick:b1,lefttrigger:a12,leftx:a0,lefty:a1,rightshoulder:b11,rightstick:b2,righttrigger:a13,rightx:a2,righty:a3,start:b3,x:b15,y:b12,",
    "030000004c0500006802000011810000,PS3 Controller,a:b0,b:b1,back:b8,dpdown:b14,dpleft:b15,dpright:b16,dpup:b13,guide:b10,leftshoulder:b4,leftstick:b11,lefttrigger:a2,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b12,righttrigger:a5,rightx:a3,righty:a4,start:b9,x:b3,y:b2,",
    "030000006f0e00001402000011010000,PS3 Controller,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b0,y:b3,",
    "030000008f0e00000300000010010000,PS3 Controller,a:b2,b:b1,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b3,y:b0,",
    "050000004c0500006802000000010000,PS3 Controller,a:b14,b:b13,back:b0,dpdown:b6,dpleft:b7,dpright:b5,dpup:b4,guide:b16,leftshoulder:b10,leftstick:b1,lefttrigger:a12,leftx:a0,lefty:a1,rightshoulder:b11,rightstick:b2,righttrigger:a13,rightx:a2,righty:a3,start:b3,x:b15,y:b12,",
    "050000004c0500006802000000800000,PS3 Controller,a:b0,b:b1,back:b8,dpdown:b14,dpleft:b15,dpright:b16,dpup:b13,guide:b10,leftshoulder:b4,leftstick:b11,lefttrigger:a2,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b12,righttrigger:a5,rightx:a3,righty:a4,start:b9,x:b3,y:b2,",
    "050000004c0500006802000000810000,PS3 Controller,a:b0,b:b1,back:b8,dpdown:b14,dpleft:b15,dpright:b16,dpup:b13,guide:b10,leftshoulder:b4,leftstick:b11,lefttrigger:a2,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b12,righttrigger:a5,rightx:a3,righty:a4,start:b9,x:b3,y:b2,",
    "05000000504c415953544154494f4e00,PS3 Controller,a:b14,b:b13,back:b0,dpdown:b6,dpleft:b7,dpright:b5,dpup:b4,guide:b16,leftshoulder:b10,leftstick:b1,lefttrigger:b8,leftx:a0,lefty:a1,rightshoulder:b11,rightstick:b2,righttrigger:b9,rightx:a2,righty:a3,start:b3,x:b15,y:b12,",
    "060000004c0500006802000000010000,PS3 Controller,a:b14,b:b13,back:b0,dpdown:b6,dpleft:b7,dpright:b5,dpup:b4,guide:b16,leftshoulder:b10,leftstick:b1,lefttrigger:b8,leftx:a0,lefty:a1,rightshoulder:b11,rightstick:b2,righttrigger:b9,rightx:a2,righty:a3,start:b3,x:b15,y:b12,",
    "030000004c050000a00b000011010000,PS4 Controller,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:a3,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:a4,rightx:a2,righty:a5,start:b9,x:b0,y:b3,",
    "030000004c050000a00b000011810000,PS4 Controller,a:b0,b:b1,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b10,leftshoulder:b4,leftstick:b11,lefttrigger:a2,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b12,righttrigger:a5,rightx:a3,righty:a4,start:b9,x:b3,y:b2,",
    "030000004c050000c405000011010000,PS4 Controller,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:a3,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:a4,rightx:a2,righty:a5,start:b9,x:b0,y:b3,",
    "030000004c050000c405000011810000,PS4 Controller,a:b0,b:b1,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b10,leftshoulder:b4,leftstick:b11,lefttrigger:a2,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b12,righttrigger:a5,rightx:a3,righty:a4,start:b9,x:b3,y:b2,",
    "030000004c050000cc09000000010000,PS4 Controller,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:a3,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:a4,rightx:a2,righty:a5,start:b9,x:b0,y:b3,",
    "030000004c050000cc09000011010000,PS4 Controller,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:a3,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:a4,rightx:a2,righty:a5,start:b9,x:b0,y:b3,",
    "030000004c050000cc09000011810000,PS4 Controller,a:b0,b:b1,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b10,leftshoulder:b4,leftstick:b11,lefttrigger:a2,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b12,righttrigger:a5,rightx:a3,righty:a4,start:b9,x:b3,y:b2,",
    "050000004c050000c405000000010000,PS4 Controller,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:a3,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:a4,rightx:a2,righty:a5,start:b9,x:b0,y:b3,",
    "050000004c050000c405000000810000,PS4 Controller,a:b0,b:b1,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b10,leftshoulder:b4,leftstick:b11,lefttrigger:a2,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b12,righttrigger:a5,rightx:a3,righty:a4,start:b9,x:b3,y:b2,",
    "050000004c050000cc09000000010000,PS4 Controller,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:a3,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:a4,rightx:a2,righty:a5,start:b9,x:b0,y:b3,",
    "050000004c050000cc09000000810000,PS4 Controller,a:b0,b:b1,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b10,leftshoulder:b4,leftstick:b11,lefttrigger:a2,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b12,righttrigger:a5,rightx:a3,righty:a4,start:b9,x:b3,y:b2,",
    "050000004c050000cc09000001800000,PS4 Controller,a:b0,b:b1,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b10,leftshoulder:b4,leftstick:b11,lefttrigger:a2,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b12,righttrigger:a5,rightx:a3,righty:a4,start:b9,x:b3,y:b2,",
    "030000004c050000e60c000000010000,PS5 Controller,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:a3,leftx:a0,lefty:a1,misc1:b13,rightshoulder:b5,rightstick:b11,righttrigger:a4,rightx:a2,righty:a5,start:b9,x:b0,y:b3,",
    "030000004c050000e60c000011010000,PS5 Controller,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:a3,leftx:a0,lefty:a1,misc1:b13,rightshoulder:b5,rightstick:b11,righttrigger:a4,rightx:a2,righty:a5,start:b9,x:b0,y:b3,",
    "030000004c050000e60c000011810000,PS5 Controller,a:b0,b:b1,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b10,leftshoulder:b4,leftstick:b11,lefttrigger:a2,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b12,righttrigger:a5,rightx:a3,righty:a4,start:b9,x:b3,y:b2,",
    "050000004c050000e60c000000010000,PS5 Controller,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:a3,leftx:a0,lefty:a1,misc1:b13,rightshoulder:b5,rightstick:b11,righttrigger:a4,rightx:a2,righty:a5,start:b9,x:b0,y:b3,",
    "050000004c050000e60c000000810000,PS5 Controller,a:b0,b:b1,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b10,leftshoulder:b4,leftstick:b11,lefttrigger:a2,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b12,righttrigger:a5,rightx:a3,righty:a4,start:b9,x:b3,y:b2,",
    "030000004c050000da0c000011010000,Playstation Controller,a:b2,b:b1,back:b8,leftshoulder:b6,lefttrigger:b4,leftx:a0,lefty:a1,rightshoulder:b7,righttrigger:b5,start:b9,x:b3,y:b0,",
    "03000000d620000011a7000011010000,PowerA Wired GameCube Controller,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b0,y:b3,",
    "03000000300f00001211000011010000,QanBa Arcade JoyStick,a:b2,b:b0,back:b10,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b8,leftshoulder:b5,lefttrigger:b4,leftx:a0,lefty:a1,rightshoulder:b7,righttrigger:b6,start:b9,x:b1,y:b3,",
    "03000000222c00000225000011010000,Qanba Dragon Arcade Joystick (PS3),a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b0,y:b3,",
    "03000000222c00000025000011010000,Qanba Dragon Arcade Joystick (PS4),a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:a3,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:a4,rightx:a2,righty:a5,start:b9,x:b0,y:b3,",
    "03000000222c00001220000011010000,Qanba Drone 2 Arcade Joystick (PS4),a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:a4,rightx:a2,righty:a5,start:b9,x:b0,y:b3,",
    "03000000222c00001020000011010000,Qanba Drone 2 Arcade Joystick (PS5),a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a2,righty:a5,start:b9,x:b0,y:b3,",
    "03000000222c00000020000011010000,Qanba Drone Arcade Joystick (PS4),a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:a3,rightshoulder:b5,righttrigger:a4,start:b9,x:b0,y:b3,",
    "03000000222c00000223000011010000,Qanba Obsidian Arcade Joystick (PS3),a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b0,y:b3,",
    "03000000222c00000023000011010000,Qanba Obsidian Arcade Joystick (PS4),a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:a3,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:a4,rightx:a2,righty:a5,start:b9,x:b0,y:b3,",
    "03000000321500000204000011010000,Razer Panthera (PS3),a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b0,y:b3,",
    "03000000321500000104000011010000,Razer Panthera (PS4),a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:a3,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:a4,rightx:a2,righty:a5,start:b9,x:b0,y:b3,",
    "03000000321500000010000011010000,Razer RAIJU,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:a3,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:a4,rightx:a2,righty:a5,start:b9,x:b0,y:b3,",
    "03000000321500000507000000010000,Razer Raiju Mobile,a:b0,b:b1,back:b10,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b21,leftshoulder:b6,leftstick:b13,lefttrigger:a5,leftx:a0,lefty:a1,rightshoulder:b7,rightstick:b14,righttrigger:a4,rightx:a2,righty:a3,start:b11,x:b3,y:b4,",
    "03000000321500000011000011010000,Razer Raion Fightpad for PS4,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:a3,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:a4,rightx:a2,righty:a5,start:b9,x:b0,y:b3,",
    "03000000321500000009000011010000,Razer Serval,a:b0,b:b1,back:b6,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b8,leftshoulder:b4,leftstick:b9,lefttrigger:a5,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b10,righttrigger:a4,rightx:a2,righty:a3,start:b7,x:b2,y:b3,",
    "050000003215000000090000163a0000,Razer Serval,a:b0,b:b1,back:b6,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b8,leftshoulder:b4,leftstick:b9,lefttrigger:a5,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b10,righttrigger:a4,rightx:a2,righty:a3,start:b7,x:b2,y:b3,",
    "03000000632500007805000011010000,Retro Fighters D6,crc:80d7,a:b2,b:b1,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,lefttrigger:b6,leftx:a0,lefty:a1,misc1:b10,rightshoulder:b5,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b3,y:b0,",
    "03000000790000001600000011010000,Retro Fighters D6,crc:80d7,a:b1,b:b2,back:b8,leftshoulder:b4,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,righttrigger:b7,start:b9,x:b0,y:b3,",
    "03000000632500007505000011010000,Retro Fighters Defender Pro,crc:430b,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b0,y:b3,",
    "0300000000f000000300000000010000,RetroPad,a:b1,b:b5,back:b2,leftshoulder:b6,leftx:a0,lefty:a1,rightshoulder:b7,start:b3,x:b0,y:b4,",
    "03000000790000001100000010010000,Retrolink SNES Controller,a:b2,b:b1,back:b8,dpdown:+a1,dpleft:-a0,dpright:+a0,dpup:-a1,leftshoulder:b4,rightshoulder:b5,start:b9,x:b3,y:b0,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,",
    "030000006b140000130d000011010000,Revolution Pro Controller 3,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:a3,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:a4,rightx:a2,righty:a5,start:b9,x:b0,y:b3,",
    "030000006b140000010d000011010000,Revolution Pro Controller,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:a3,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:a4,rightx:a2,righty:a5,start:b9,x:b0,y:b3,",
    "030000006f0e00001e01000011010000,Rock Candy PS3 Controller,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b0,y:b3,",
    "03000000632500007505000010010000,SHANWAN PS3/PC Gamepad,a:b2,b:b1,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b3,y:b0,",
    "03000000341a00000908000010010000,SL-6566,a:b0,b:b1,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b2,y:b3,",
    "03000000457500002211000010010000,SZMY-POWER PC Gamepad,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b0,y:b3,",
    "03000000a306000023f6000011010000,Saitek Cyborg V.1 Game Pad,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a2,righty:a4,start:b9,x:b0,y:b3,",
    "03000000a30600000cff000010010000,Saitek P2500 Force Rumble Pad,a:b2,b:b3,back:b11,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b10,leftshoulder:b4,leftstick:b8,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b9,righttrigger:b7,rightx:a3,righty:a2,x:b0,y:b1,",
    "03000000a30600000c04000011010000,Saitek P2900 Wireless Pad,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b9,leftshoulder:b6,leftstick:b10,lefttrigger:b4,leftx:a0,lefty:a1,rightshoulder:b7,rightstick:b11,righttrigger:b5,rightx:a3,righty:a2,start:b12,x:b0,y:b3,",
    "03000000a30600000901000000010000,Saitek P880,a:b2,b:b3,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b4,leftstick:b8,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b9,righttrigger:b7,rightx:a3,righty:a2,x:b0,y:b1,",
    "03000000a30600000b04000000010000,Saitek P990 Dual Analog Pad,a:b1,b:b2,back:b9,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a3,righty:a2,start:b8,x:b0,y:b3,",
    "03000000a306000018f5000010010000,Saitek PLC Saitek P3200 Rumble Pad,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b4,leftstick:b10,lefttrigger:a2,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a3,righty:a4,start:b9,x:b0,y:b3,",
    "03000000c01600008704000011010000,Serial/Keyboard/Mouse/Joystick,a:b12,b:b10,back:b4,dpdown:b2,dpleft:b3,dpright:b1,dpup:b0,leftshoulder:b9,leftstick:b14,lefttrigger:b6,leftx:a1,lefty:a0,rightshoulder:b8,rightstick:b15,righttrigger:b7,rightx:a2,righty:a3,start:b5,x:b13,y:b11,",
    "03000000f025000021c1000010010000,ShanWan Gioteck PS3 Wired Controller,a:b2,b:b1,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b3,y:b0,",
    "03000000632500002305000010010000,ShanWan USB Gamepad,a:b2,b:b1,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b3,y:b0,",
    "03000000250900000500000000010000,Sony PS2 pad with SmartJoy adapter,a:b2,b:b1,back:b9,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b6,leftstick:b10,lefttrigger:b4,leftx:a0,lefty:a1,rightshoulder:b7,rightstick:b11,righttrigger:b5,rightx:a2,righty:a3,start:b8,x:b3,y:b0,",
    "03000000de2800000112000001000000,Steam Controller,a:b0,b:b1,back:b6,dpdown:b14,dpleft:b15,dpright:b13,dpup:b12,guide:b8,leftshoulder:b4,leftstick:b9,lefttrigger:a2,leftx:a0,lefty:a1,paddle1:b11,paddle2:b10,rightshoulder:b5,righttrigger:a3,start:b7,x:b2,y:b3,",
    "03000000de2800000112000011010000,Steam Controller,a:b2,b:b3,back:b10,dpdown:+a5,dpleft:-a4,dpright:+a4,dpup:-a5,guide:b12,leftshoulder:b6,leftstick:b13,lefttrigger:a7,leftx:a0,lefty:a1,paddle1:b15,paddle2:b16,rightshoulder:b7,rightstick:b14,righttrigger:a6,rightx:a2,righty:a3,start:b11,x:b4,y:b5,",
    "03000000de2800000211000001000000,Steam Controller,a:b0,b:b1,back:b6,dpdown:b14,dpleft:b15,dpright:b13,dpup:b12,guide:b8,leftshoulder:b4,leftstick:b9,lefttrigger:a2,leftx:a0,lefty:a1,paddle1:b11,paddle2:b10,rightshoulder:b5,righttrigger:a3,start:b7,x:b2,y:b3,",
    "03000000de2800000211000011010000,Steam Controller,a:b2,b:b3,back:b10,dpdown:+a5,dpleft:-a4,dpright:+a4,dpup:-a5,guide:b12,leftshoulder:b6,leftstick:b13,lefttrigger:a7,leftx:a0,lefty:a1,paddle1:b15,paddle2:b16,rightshoulder:b7,rightstick:b14,righttrigger:a6,rightx:a2,righty:a3,start:b11,x:b4,y:b5,",
    "03000000de2800004211000001000000,Steam Controller,a:b0,b:b1,back:b6,dpdown:b14,dpleft:b15,dpright:b13,dpup:b12,guide:b8,leftshoulder:b4,leftstick:b9,lefttrigger:a2,leftx:a0,lefty:a1,paddle1:b11,paddle2:b10,rightshoulder:b5,righttrigger:a3,start:b7,x:b2,y:b3,",
    "03000000de2800004211000011010000,Steam Controller,a:b2,b:b3,back:b10,dpdown:+a5,dpleft:-a4,dpright:+a4,dpup:-a5,guide:b12,leftshoulder:b6,leftstick:b13,lefttrigger:a7,leftx:a0,lefty:a1,paddle1:b15,paddle2:b16,rightshoulder:b7,rightstick:b14,righttrigger:a6,rightx:a2,righty:a3,start:b11,x:b4,y:b5,",
    "03000000de280000fc11000001000000,Steam Controller,a:b0,b:b1,back:b6,dpdown:b14,dpleft:b15,dpright:b13,dpup:b12,guide:b8,leftshoulder:b4,leftstick:b9,lefttrigger:a2,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b10,righttrigger:a5,rightx:a3,righty:a4,start:b7,x:b2,y:b3,",
    "05000000de2800000212000001000000,Steam Controller,a:b0,b:b1,back:b6,dpdown:b14,dpleft:b15,dpright:b13,dpup:b12,guide:b8,leftshoulder:b4,leftstick:b9,lefttrigger:a2,leftx:a0,lefty:a1,paddle1:b11,paddle2:b10,rightshoulder:b5,righttrigger:a3,start:b7,x:b2,y:b3,",
    "05000000de2800000511000001000000,Steam Controller,a:b0,b:b1,back:b6,dpdown:b14,dpleft:b15,dpright:b13,dpup:b12,guide:b8,leftshoulder:b4,leftstick:b9,lefttrigger:a2,leftx:a0,lefty:a1,paddle1:b11,paddle2:b10,rightshoulder:b5,righttrigger:a3,start:b7,x:b2,y:b3,",
    "05000000de2800000611000001000000,Steam Controller,a:b0,b:b1,back:b6,dpdown:b14,dpleft:b15,dpright:b13,dpup:b12,guide:b8,leftshoulder:b4,leftstick:b9,lefttrigger:a2,leftx:a0,lefty:a1,paddle1:b11,paddle2:b10,rightshoulder:b5,righttrigger:a3,start:b7,x:b2,y:b3,",
    "03000000de2800000512000000016800,Steam Deck Controller,a:b0,b:b1,back:b4,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b5,leftshoulder:b9,leftstick:b7,lefttrigger:a4,leftx:a0,lefty:a1,misc1:b11,misc2:b16,paddle1:b12,paddle2:b13,paddle3:b14,paddle4:b15,rightshoulder:b10,rightstick:b8,righttrigger:a5,rightx:a2,righty:a3,start:b6,touchpad:b17,x:b2,y:b3,",
    "03000000de2800000512000011010000,Steam Deck,a:b3,b:b4,back:b11,dpdown:b17,dpleft:b18,dpright:b19,dpup:b16,guide:b13,leftshoulder:b7,leftstick:b14,lefttrigger:a9,leftx:a0,lefty:a1,misc1:b2,paddle1:b21,paddle2:b20,paddle3:b23,paddle4:b22,rightshoulder:b8,rightstick:b15,righttrigger:a8,rightx:a2,righty:a3,start:b12,x:b5,y:b6,",
    "03000000de280000ff11000001000000,Steam Virtual Gamepad,a:b0,b:b1,back:b6,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b8,leftshoulder:b4,leftstick:b9,lefttrigger:a2,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b10,righttrigger:a5,rightx:a3,righty:a4,start:b7,x:b2,y:b3,",
    "0500000011010000311400001b010000,SteelSeries Stratus Duo,a:b0,b:b1,back:b10,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b32,leftshoulder:b6,leftstick:b13,lefttrigger:a5,leftx:a0,lefty:a1,rightshoulder:b7,rightstick:b14,righttrigger:a4,rightx:a2,righty:a3,start:b11,x:b3,y:b4,",
    "05000000110100001914000009010000,SteelSeries Stratus XL,a:b0,b:b1,back:b17,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b18,leftshoulder:b6,leftstick:b13,lefttrigger:+a5,leftx:a0,lefty:a1,rightshoulder:b7,rightstick:b14,righttrigger:+a4,rightx:a2,righty:a3,start:b11,x:b3,y:b4,",
    "03000000666600000488000000010000,Super Joy Box 5 Pro,a:b2,b:b1,back:b9,dpdown:b14,dpleft:b15,dpright:b13,dpup:b12,leftshoulder:b6,leftstick:b10,lefttrigger:b4,leftx:a0,lefty:a1,rightshoulder:b7,rightstick:b11,righttrigger:b5,rightx:a2,righty:a3,start:b8,x:b3,y:b0,",
    "0300000000f00000f100000000010000,Super RetroPort,a:b1,b:b5,back:b2,leftshoulder:b6,leftx:a0,lefty:a1,rightshoulder:b7,start:b3,x:b0,y:b4,",
    "030000004f0400000ed0000011010000,ThrustMaster eSwap PRO Controller,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:a3,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:a4,rightx:a2,righty:a5,start:b9,x:b0,y:b3,",
    "030000004f04000020b3000010010000,Thrustmaster 2 in 1 DT,a:b0,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b4,leftstick:b10,lefttrigger:b5,leftx:a0,lefty:a1,rightshoulder:b6,rightstick:b11,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b1,y:b3,",
    "030000004f04000015b3000001010000,Thrustmaster Dual Analog 3.2,a:b0,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b4,leftstick:b10,lefttrigger:b5,leftx:a0,lefty:a1,rightshoulder:b6,rightstick:b11,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b1,y:b3,",
    "030000004f04000015b3000010010000,Thrustmaster Dual Analog 4,a:b0,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b4,leftstick:b10,lefttrigger:b5,leftx:a0,lefty:a1,rightshoulder:b6,rightstick:b11,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b1,y:b3,",
    "030000004f04000023b3000000010000,Thrustmaster Dual Trigger 3-in-1,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a2,righty:a5,start:b9,x:b0,y:b3,",
    "030000004f04000000b3000010010000,Thrustmaster Firestorm Dual Power,a:b0,b:b2,back:b9,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b8,leftshoulder:b4,leftstick:b11,lefttrigger:b5,leftx:a0,lefty:a1,rightshoulder:b6,rightstick:b12,righttrigger:b7,rightx:a2,righty:a3,start:b10,x:b1,y:b3,",
    "030000004f04000009d0000000010000,Thrustmaster Run N Drive Wireless PS3,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b0,y:b3,",
    "030000004f04000008d0000000010000,Thrustmaster Run N Drive Wireless,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a2,righty:a5,start:b9,x:b0,y:b3,",
    "03000000bd12000015d0000010010000,Tomee SNES USB Controller,a:b2,b:b1,back:b8,dpdown:+a1,dpleft:-a0,dpright:+a0,dpup:-a1,leftshoulder:b4,rightshoulder:b5,start:b9,x:b3,y:b0,",
    "03000000d814000007cd000011010000,Toodles 2008 Chimp PC/PS3,a:b0,b:b1,back:b8,leftshoulder:b4,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,righttrigger:b7,start:b9,x:b3,y:b2,",
    "03000000100800000100000010010000,Twin USB PS2 Adapter,a:b2,b:b1,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b6,leftstick:b10,lefttrigger:b4,leftx:a0,lefty:a1,rightshoulder:b7,rightstick:b11,righttrigger:b5,rightx:a3,righty:a2,start:b9,x:b3,y:b0,",
    "03000000100800000300000010010000,USB Gamepad,a:b2,b:b1,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b6,leftstick:b10,lefttrigger:b4,leftx:a0,lefty:a1,rightshoulder:b7,rightstick:b11,righttrigger:b5,rightx:a3,righty:a2,start:b9,x:b3,y:b0,",
    "03000000790000001100000000010000,USB Gamepad1,a:b2,b:b1,back:b8,dpdown:a0,dpleft:a1,dpright:a2,dpup:a4,start:b9,",
    "05000000ac0500003232000001000000,VR-BOX,a:b0,b:b1,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b6,leftstick:b10,lefttrigger:b4,leftx:a0,lefty:a1,rightshoulder:b7,rightstick:b11,righttrigger:b5,rightx:a3,righty:a2,start:b9,x:b2,y:b3,",
    "030000006f0e00000302000011010000,Victrix Pro Fight Stick for PS4,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,lefttrigger:b6,rightshoulder:b5,righttrigger:b7,start:b9,x:b0,y:b3,",
    "030000006f0e00000702000011010000,Victrix Pro Fight Stick for PS4,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:b6,rightshoulder:b5,righttrigger:b7,start:b9,x:b0,y:b3,",
    "030000000d0f0000ab01000011010000,Wireless HORIPAD For Steam,a:b0,b:b1,back:b10,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b6,leftstick:b13,lefttrigger:a5,leftx:a0,lefty:a1,misc2:b2,misc3:b16,misc4:b17,paddle1:b19,paddle2:b18,paddle3:b15,paddle4:b5,rightshoulder:b7,rightstick:b14,righttrigger:a4,rightx:a2,righty:a3,start:b11,x:b3,y:b4,",
    "050000000d0f00009601000091000000,Wireless HORIPAD For Steam,a:b0,b:b1,back:b10,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b6,leftstick:b13,lefttrigger:a5,leftx:a0,lefty:a1,misc2:b2,misc3:b16,misc4:b17,paddle1:b19,paddle2:b18,paddle3:b15,paddle4:b5,rightshoulder:b7,rightstick:b14,righttrigger:a4,rightx:a2,righty:a3,start:b11,x:b3,y:b4,",
    "03000000450c00002043000010010000,XEOX Gamepad SL-6556-BK,a:b0,b:b1,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b2,y:b3,",
    "0000000058626f782033363020576900,Xbox 360 Wireless Controller,a:b0,b:b1,back:b14,dpdown:b11,dpleft:b12,dpright:b13,dpup:b10,guide:b7,leftshoulder:b4,leftstick:b8,lefttrigger:a2,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b9,righttrigger:a5,rightx:a3,righty:a4,start:b6,x:b2,y:b3,",
    "0000000058626f782047616d65706100,Xbox Gamepad (userspace driver),a:b0,b:b1,back:b6,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b8,leftshoulder:b4,leftstick:b9,lefttrigger:a5,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b10,righttrigger:a4,rightx:a2,righty:a3,start:b7,x:b2,y:b3,",
    "050000005e040000e002000003090000,Xbox One Wireless Controller,a:b0,b:b1,back:b6,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b10,leftshoulder:b4,leftstick:b8,lefttrigger:a2,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b9,righttrigger:a5,rightx:a3,righty:a4,start:b7,x:b2,y:b3,",
    "050000005e040000fd02000003090000,Xbox One Wireless Controller,a:b0,b:b1,back:b15,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,guide:b16,leftshoulder:b6,leftstick:b13,lefttrigger:a5,leftx:a0,lefty:a1,rightshoulder:b7,rightstick:b14,righttrigger:a4,rightx:a2,righty:a3,start:b11,x:b3,y:b4,",
    "05000000172700004431000029010000,XiaoMi Game Controller,a:b0,b:b1,back:b10,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b20,leftshoulder:b6,leftstick:b13,lefttrigger:a7,leftx:a0,lefty:a1,rightshoulder:b7,rightstick:b14,righttrigger:a6,rightx:a2,righty:a5,start:b11,x:b3,y:b4,",
    "03000000c0160000e105000010010000,Xin-Mo Dual Arcade,crc:82d5,a:b1,b:b2,back:b9,dpdown:+a1,dpleft:-a0,dpright:+a0,dpup:-a1,rightshoulder:b4,righttrigger:b5,start:b8,x:b0,y:b3,",
    "03000000073500000400000011010000,ZENAIM ARCADE CONTROLLER,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:b6,rightshoulder:b5,rightstick:b11,righttrigger:b7,start:b9,x:b0,y:b3,",
    "03000000120c0000100e000011010000,ZEROPLUS P4 Gamepad,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:a3,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:a4,rightx:a2,righty:a5,start:b9,x:b0,y:b3,",
    "03000000120c0000101e000011010000,ZEROPLUS P4 Wired Gamepad,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:a3,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:a4,rightx:a2,righty:a5,start:b9,x:b0,y:b3,",
    "03000000120c0000182e000011010000,ZEROPLUS P4 Wired Gamepad,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:a3,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:a4,rightx:a2,righty:a5,start:b9,x:b0,y:b3,",
    "03000000790000002201000011010000,ZhiXu GuliKit Controller D,a:b0,b:b1,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b2,y:b3,",
    "03000000666600006706000000010000,boom PSX to PC Converter,a:b2,b:b1,back:b8,dpdown:b14,dpleft:b15,dpright:b13,dpup:b12,leftshoulder:b6,leftstick:b9,lefttrigger:b4,leftx:a0,lefty:a1,rightshoulder:b7,rightstick:b10,righttrigger:b5,rightx:a2,righty:a3,start:b11,x:b3,y:b0,",
    "03000000830500006020000010010000,iBuffalo SNES Controller,a:b1,b:b0,back:b6,dpdown:+a1,dpleft:-a0,dpright:+a0,dpup:-a1,leftshoulder:b4,rightshoulder:b5,start:b7,x:b3,y:b2,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,",
    "050000006964726f69643a636f6e0000,idroid:con,a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b4,leftstick:b10,lefttrigger:b6,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:b7,rightx:a2,righty:a3,start:b9,x:b0,y:b3,",
    "03000000b50700001503000010010000,impact,a:b2,b:b3,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b4,leftstick:b10,lefttrigger:b5,leftx:a0,lefty:a1,rightshoulder:b6,rightstick:b11,righttrigger:b7,rightx:a3,righty:a2,start:b9,x:b0,y:b1,",
    "030000009b2800008000000020020000,raphnet technologies 1-player WUSBMote v2.2,a:b1,b:b4,back:b2,dpdown:b13,dpleft:b14,dpright:b15,dpup:b12,leftshoulder:b6,rightshoulder:b7,start:b3,x:b0,y:b5,",
    "030000009b2800000300000001010000,raphnet.net 4nes4snes v1.5,a:b0,b:b4,back:b2,leftshoulder:b6,leftx:a0,lefty:a1,rightshoulder:b7,start:b3,x:b1,y:b5,",
    null,
};
pub const SDL_FLYDIGI_APEX5: c_int = 4;
pub const SDL_FLYDIGI_APEX6: c_int = 5;
pub const SDL_FLYDIGI_VADER2: c_int = 16;
pub const SDL_FLYDIGI_VADER5_PRO: c_int = 21;
pub const k_eSwitchDeviceInfoControllerType_JoyConLeft: c_int = 1;
pub const k_eSwitchDeviceInfoControllerType_JoyConRight: c_int = 2;
pub const k_eSwitchDeviceInfoControllerType_HVCLeft: c_int = 7;
pub const k_eSwitchDeviceInfoControllerType_HVCRight: c_int = 8;
pub const k_eSwitchDeviceInfoControllerType_NESLeft: c_int = 9;
pub const k_eSwitchDeviceInfoControllerType_NESRight: c_int = 10;
pub const k_eSwitchDeviceInfoControllerType_SNES: c_int = 11;
pub const k_eSwitchDeviceInfoControllerType_N64: c_int = 12;
pub const k_eSwitchDeviceInfoControllerType_SEGA_Genesis: c_int = 13;
pub const k_eWiiExtensionControllerType_None: c_int = 128;
pub const k_eWiiExtensionControllerType_Nunchuk: c_int = 129;
pub const SINPUT_ANALOGSTYLE_LEFTONLY: c_int = 1;
pub const SINPUT_ANALOGSTYLE_RIGHTONLY: c_int = 2;
pub const SINPUT_ANALOGSTYLE_LEFTRIGHT: c_int = 3;
pub const SINPUT_ANALOGSTYLE_MAX: c_int = 4;
pub const SInput_AnalogStyleType = c_uint;
pub const SINPUT_BUMPERSTYLE_ONE: c_int = 1;
pub const SINPUT_BUMPERSTYLE_TWO: c_int = 2;
pub const SINPUT_BUMPERSTYLE_MAX: c_int = 3;
pub const SInput_BumperStyleType = c_uint;
pub const SINPUT_TRIGGERSTYLE_ANALOG: c_int = 1;
pub const SINPUT_TRIGGERSTYLE_DIGITAL: c_int = 2;
pub const SINPUT_TRIGGERSTYLE_DUALSTAGE: c_int = 3;
pub const SINPUT_TRIGGERSTYLE_MAX: c_int = 4;
pub const SInput_TriggerStyleType = c_uint;
pub const SINPUT_PADDLESTYLE_TWO: c_int = 1;
pub const SINPUT_PADDLESTYLE_FOUR: c_int = 2;
pub const SINPUT_PADDLESTYLE_MAX: c_int = 3;
pub const SInput_PaddleStyleType = c_uint;
pub const SINPUT_METASTYLE_BACK: c_int = 1;
pub const SINPUT_METASTYLE_BACKGUIDE: c_int = 2;
pub const SINPUT_METASTYLE_BACKGUIDESHARE: c_int = 3;
pub const SINPUT_METASTYLE_MAX: c_int = 4;
pub const SInput_MetaStyleType = c_uint;
pub const SINPUT_TOUCHSTYLE_SINGLE: c_int = 1;
pub const SINPUT_TOUCHSTYLE_DOUBLE: c_int = 2;
pub const SINPUT_TOUCHSTYLE_MAX: c_int = 3;
pub const SInput_TouchStyleType = c_uint;
pub const SINPUT_MISCSTYLE_1: c_int = 1;
pub const SINPUT_MISCSTYLE_2: c_int = 2;
pub const SINPUT_MISCSTYLE_3: c_int = 3;
pub const SINPUT_MISCSTYLE_4: c_int = 4;
pub const SINPUT_MISCSTYLE_MAX: c_int = 5;
pub const SInput_MiscStyleType = c_uint;
pub const SDL_SInputStyles_t = extern struct {
    analog_style: Uint16 = 0,
    bumper_style: Uint16 = 0,
    trigger_style: Uint16 = 0,
    paddle_style: Uint16 = 0,
    meta_style: Uint16 = 0,
    touch_style: Uint16 = 0,
    misc_style: Uint16 = 0,
};
pub extern fn SDL_GetStringBoolean(value: [*c]const u8, default_value: bool) bool;
pub var SDL_gamepads_initialized: bool = false;
pub var SDL_gamepads: [*c]SDL_Gamepad = null;
pub var SDL_gamepad_names: ?*SDL_HashTable = null;
pub const SDL_GAMEPAD_FACE_STYLE_UNKNOWN: c_int = 0;
pub const SDL_GAMEPAD_FACE_STYLE_ABXY: c_int = 1;
pub const SDL_GAMEPAD_FACE_STYLE_AXBY: c_int = 2;
pub const SDL_GAMEPAD_FACE_STYLE_BAYX: c_int = 3;
pub const SDL_GAMEPAD_FACE_STYLE_SONY: c_int = 4;
pub const SDL_GamepadFaceStyle = c_uint;
pub const SDL_GAMEPAD_MAPPING_PRIORITY_DEFAULT: c_int = 0;
pub const SDL_GAMEPAD_MAPPING_PRIORITY_API: c_int = 1;
pub const SDL_GAMEPAD_MAPPING_PRIORITY_USER: c_int = 2;
pub const SDL_GamepadMappingPriority = c_uint;
pub const MappingChangeTracker = extern struct {
    refcount: c_int = 0,
    joysticks: [*c]SDL_JoystickID = null,
    joystick_mappings: [*c][*c]GamepadMapping_t = null,
    num_changed_mappings: c_int = 0,
    changed_mappings: [*c][*c]GamepadMapping_t = null,
};
pub var s_zeroGUID: SDL_GUID = @import("std").mem.zeroes(SDL_GUID);
pub var s_pSupportedGamepads: [*c]GamepadMapping_t = null;
pub var s_pDefaultMapping: [*c]GamepadMapping_t = null;
pub var s_pXInputMapping: [*c]GamepadMapping_t = null;
pub var s_mappingChangeTracker: [*c]MappingChangeTracker = null;
pub var s_gamepadInstanceIDs: ?*SDL_HashTable = null;
pub var SDL_allowed_gamepads: SDL_vidpid_list = SDL_vidpid_list{
    .included_hint_name = "SDL_GAMECONTROLLER_IGNORE_DEVICES_EXCEPT",
    .num_included_entries = 0,
    .max_included_entries = 0,
    .included_entries = null,
    .excluded_hint_name = null,
    .num_excluded_entries = 0,
    .max_excluded_entries = 0,
    .excluded_entries = null,
    .num_initial_entries = 0,
    .initial_entries = null,
    .initialized = @"false" != 0,
};
pub var SDL_ignored_gamepads: SDL_vidpid_list = SDL_vidpid_list{
    .included_hint_name = "SDL_GAMECONTROLLER_IGNORE_DEVICES",
    .num_included_entries = 0,
    .max_included_entries = 0,
    .included_entries = null,
    .excluded_hint_name = null,
    .num_excluded_entries = 0,
    .max_excluded_entries = 0,
    .excluded_entries = null,
    .num_initial_entries = 0,
    .initial_entries = null,
    .initialized = @"false" != 0,
};
pub const GAMEPAD_BLACKLIST_BEGIN: c_int = 0;
pub const GAMEPAD_BLACKLIST_END: c_int = 1;
pub const GAMEPAD_BLACKLIST_ANYWHERE: c_int = 2;
pub const enum_SDL_GamepadBlacklistWordsPosition = c_uint;
pub const struct_SDL_GamepadBlacklistWords = extern struct {
    str: [*c]const u8 = null,
    pos: enum_SDL_GamepadBlacklistWordsPosition = @import("std").mem.zeroes(enum_SDL_GamepadBlacklistWordsPosition),
};
pub const SDL_gamepad_blacklist_words: [20]struct_SDL_GamepadBlacklistWords = [20]struct_SDL_GamepadBlacklistWords{
    struct_SDL_GamepadBlacklistWords{
        .str = " Motion Sensors",
        .pos = GAMEPAD_BLACKLIST_END,
    },
    struct_SDL_GamepadBlacklistWords{
        .str = " IMU",
        .pos = GAMEPAD_BLACKLIST_END,
    },
    struct_SDL_GamepadBlacklistWords{
        .str = " Touchpad",
        .pos = GAMEPAD_BLACKLIST_END,
    },
    struct_SDL_GamepadBlacklistWords{
        .str = " Accelerometer",
        .pos = GAMEPAD_BLACKLIST_END,
    },
    struct_SDL_GamepadBlacklistWords{
        .str = " IR",
        .pos = GAMEPAD_BLACKLIST_END,
    },
    struct_SDL_GamepadBlacklistWords{
        .str = " Motion Plus",
        .pos = GAMEPAD_BLACKLIST_END,
    },
    struct_SDL_GamepadBlacklistWords{
        .str = " Nunchuk",
        .pos = GAMEPAD_BLACKLIST_END,
    },
    struct_SDL_GamepadBlacklistWords{
        .str = "uinput-",
        .pos = GAMEPAD_BLACKLIST_BEGIN,
    },
    struct_SDL_GamepadBlacklistWords{
        .str = "gpio_ir_recv",
        .pos = GAMEPAD_BLACKLIST_BEGIN,
    },
    struct_SDL_GamepadBlacklistWords{
        .str = "Synaptics ",
        .pos = GAMEPAD_BLACKLIST_ANYWHERE,
    },
    struct_SDL_GamepadBlacklistWords{
        .str = "Trackpad",
        .pos = GAMEPAD_BLACKLIST_ANYWHERE,
    },
    struct_SDL_GamepadBlacklistWords{
        .str = "Clickpad",
        .pos = GAMEPAD_BLACKLIST_ANYWHERE,
    },
    struct_SDL_GamepadBlacklistWords{
        .str = " Keyboard",
        .pos = GAMEPAD_BLACKLIST_ANYWHERE,
    },
    struct_SDL_GamepadBlacklistWords{
        .str = " Laptop ",
        .pos = GAMEPAD_BLACKLIST_ANYWHERE,
    },
    struct_SDL_GamepadBlacklistWords{
        .str = "Mouse ",
        .pos = GAMEPAD_BLACKLIST_BEGIN,
    },
    struct_SDL_GamepadBlacklistWords{
        .str = " Pen",
        .pos = GAMEPAD_BLACKLIST_END,
    },
    struct_SDL_GamepadBlacklistWords{
        .str = " Finger",
        .pos = GAMEPAD_BLACKLIST_END,
    },
    struct_SDL_GamepadBlacklistWords{
        .str = " System Control",
        .pos = GAMEPAD_BLACKLIST_END,
    },
    struct_SDL_GamepadBlacklistWords{
        .str = " LED ",
        .pos = GAMEPAD_BLACKLIST_ANYWHERE,
    },
    struct_SDL_GamepadBlacklistWords{
        .str = " Thelio ",
        .pos = GAMEPAD_BLACKLIST_ANYWHERE,
    },
};
pub fn HasSameOutput(a: [*c]SDL_GamepadBinding, b: [*c]SDL_GamepadBinding) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (a.*.output_type != b.*.output_type) {
        return @"false" != 0;
    }
    if (a.*.output_type == @as(SDL_GamepadBindingType, SDL_GAMEPAD_BINDTYPE_AXIS)) {
        return a.*.output.axis.axis == b.*.output.axis.axis;
    } else {
        return a.*.output.button == b.*.output.button;
    }
}
pub fn ResetOutput(timestamp: Uint64, gamepad: [*c]SDL_Gamepad, bind: [*c]SDL_GamepadBinding) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (bind.*.output_type == @as(SDL_GamepadBindingType, SDL_GAMEPAD_BINDTYPE_AXIS)) {
        SDL_SendGamepadAxis(timestamp, gamepad, bind.*.output.axis.axis, 0);
    } else {
        SDL_SendGamepadButton(timestamp, gamepad, bind.*.output.button, @"false" != 0);
    }
}
pub fn HandleJoystickAxis(timestamp: Uint64, gamepad: [*c]SDL_Gamepad, axis: c_int, arg_value: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var value = arg_value;
    _ = &value;
    var i: c_int = undefined;
    _ = &i;
    var last_match: [*c]SDL_GamepadBinding = undefined;
    _ = &last_match;
    var match: [*c]SDL_GamepadBinding = null;
    _ = &match;
    SDL_AssertJoysticksLocked();
    last_match = gamepad.*.last_match_axis[@bitCast(@as(isize, @intCast(axis)))];
    {
        i = 0;
        while (i < gamepad.*.num_bindings) : (i += 1) {
            var binding: [*c]SDL_GamepadBinding = &gamepad.*.bindings[@bitCast(@as(isize, @intCast(i)))];
            _ = &binding;
            if ((binding.*.input_type == @as(SDL_GamepadBindingType, SDL_GAMEPAD_BINDTYPE_AXIS)) and (axis == binding.*.input.axis.axis)) {
                if (binding.*.input.axis.axis_min < binding.*.input.axis.axis_max) {
                    if ((value >= binding.*.input.axis.axis_min) and (value <= binding.*.input.axis.axis_max)) {
                        match = binding;
                        break;
                    }
                } else {
                    if ((value >= binding.*.input.axis.axis_max) and (value <= binding.*.input.axis.axis_min)) {
                        match = binding;
                        break;
                    }
                }
            }
        }
    }
    if ((last_match != null) and (!(match != null) or !HasSameOutput(last_match, match))) {
        ResetOutput(timestamp, gamepad, last_match);
    }
    if (match != null) {
        if (match.*.output_type == @as(SDL_GamepadBindingType, SDL_GAMEPAD_BINDTYPE_AXIS)) {
            if ((match.*.input.axis.axis_min != match.*.output.axis.axis_min) or (match.*.input.axis.axis_max != match.*.output.axis.axis_max)) {
                var normalized_value: f32 = @as(f32, @floatFromInt(value - match.*.input.axis.axis_min)) / @as(f32, @floatFromInt(match.*.input.axis.axis_max - match.*.input.axis.axis_min));
                _ = &normalized_value;
                value = match.*.output.axis.axis_min + @as(c_int, @intFromFloat(normalized_value * @as(f32, @floatFromInt(match.*.output.axis.axis_max - match.*.output.axis.axis_min))));
            }
            SDL_SendGamepadAxis(timestamp, gamepad, match.*.output.axis.axis, @truncate(value));
        } else {
            var down: bool = undefined;
            _ = &down;
            var threshold: c_int = match.*.input.axis.axis_min + @divTrunc(match.*.input.axis.axis_max - match.*.input.axis.axis_min, @as(c_int, 2));
            _ = &threshold;
            if (match.*.input.axis.axis_max < match.*.input.axis.axis_min) {
                down = value <= threshold;
            } else {
                down = value >= threshold;
            }
            SDL_SendGamepadButton(timestamp, gamepad, match.*.output.button, down);
        }
    }
    gamepad.*.last_match_axis[@bitCast(@as(isize, @intCast(axis)))] = match;
}
pub fn HandleJoystickButton(timestamp: Uint64, gamepad: [*c]SDL_Gamepad, button: c_int, down: bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    SDL_AssertJoysticksLocked();
    {
        i = 0;
        while (i < gamepad.*.num_bindings) : (i += 1) {
            var binding: [*c]SDL_GamepadBinding = &gamepad.*.bindings[@bitCast(@as(isize, @intCast(i)))];
            _ = &binding;
            if ((binding.*.input_type == @as(SDL_GamepadBindingType, SDL_GAMEPAD_BINDTYPE_BUTTON)) and (button == binding.*.input.button)) {
                if (binding.*.output_type == @as(SDL_GamepadBindingType, SDL_GAMEPAD_BINDTYPE_AXIS)) {
                    var value: c_int = if (down) binding.*.output.axis.axis_max else binding.*.output.axis.axis_min;
                    _ = &value;
                    SDL_SendGamepadAxis(timestamp, gamepad, binding.*.output.axis.axis, @truncate(value));
                } else {
                    SDL_SendGamepadButton(timestamp, gamepad, binding.*.output.button, down);
                }
                break;
            }
        }
    }
}
pub fn HandleJoystickHat(timestamp: Uint64, gamepad: [*c]SDL_Gamepad, hat: c_int, value: Uint8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var last_mask: Uint8 = undefined;
    _ = &last_mask;
    var changed_mask: Uint8 = undefined;
    _ = &changed_mask;
    SDL_AssertJoysticksLocked();
    last_mask = gamepad.*.last_hat_mask[@bitCast(@as(isize, @intCast(hat)))];
    changed_mask = @bitCast(@as(i8, @truncate(@as(c_int, last_mask) ^ @as(c_int, value))));
    {
        i = 0;
        while (i < gamepad.*.num_bindings) : (i += 1) {
            var binding: [*c]SDL_GamepadBinding = &gamepad.*.bindings[@bitCast(@as(isize, @intCast(i)))];
            _ = &binding;
            if ((binding.*.input_type == @as(SDL_GamepadBindingType, SDL_GAMEPAD_BINDTYPE_HAT)) and (hat == binding.*.input.hat.hat)) {
                if ((@as(c_int, changed_mask) & binding.*.input.hat.hat_mask) != @as(c_int, 0)) {
                    if ((@as(c_int, value) & binding.*.input.hat.hat_mask) != 0) {
                        if (binding.*.output_type == @as(SDL_GamepadBindingType, SDL_GAMEPAD_BINDTYPE_AXIS)) {
                            SDL_SendGamepadAxis(timestamp, gamepad, binding.*.output.axis.axis, @truncate(binding.*.output.axis.axis_max));
                        } else {
                            SDL_SendGamepadButton(timestamp, gamepad, binding.*.output.button, @"true" != 0);
                        }
                    } else {
                        ResetOutput(timestamp, gamepad, binding);
                    }
                }
            }
        }
    }
    gamepad.*.last_hat_mask[@bitCast(@as(isize, @intCast(hat)))] = value;
}
pub fn RecenterGamepad(gamepad: [*c]SDL_Gamepad) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var timestamp: Uint64 = SDL_GetTicksNS_REAL();
    _ = &timestamp;
    {
        i = 0;
        while (i < SDL_GAMEPAD_BUTTON_COUNT) : (i += 1) {
            var button: SDL_GamepadButton = i;
            _ = &button;
            if (SDL_GetGamepadButton_REAL(gamepad, button)) {
                SDL_SendGamepadButton(timestamp, gamepad, button, @"false" != 0);
            }
        }
    }
    {
        i = 0;
        while (i < SDL_GAMEPAD_AXIS_COUNT) : (i += 1) {
            var axis: SDL_GamepadAxis = i;
            _ = &axis;
            if (@as(c_int, SDL_GetGamepadAxis_REAL(gamepad, axis)) != @as(c_int, 0)) {
                SDL_SendGamepadAxis(timestamp, gamepad, axis, 0);
            }
        }
    }
}
pub fn SDL_UpdateGamepadNameForID(instance_id: SDL_JoystickID) callconv(.c) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var current_name: [*c]const u8 = null;
    _ = &current_name;
    SDL_AssertJoysticksLocked();
    var mapping: [*c]GamepadMapping_t = SDL_PrivateGetGamepadMapping(instance_id, @"true" != 0);
    _ = &mapping;
    if (mapping != null) {
        if (SDL_strcmp_REAL(mapping.*.name, "*") == @as(c_int, 0)) {
            current_name = SDL_GetJoystickNameForID_REAL(instance_id);
        } else {
            current_name = mapping.*.name;
        }
    }
    if (!(SDL_gamepad_names != null)) {
        return SDL_GetPersistentString(current_name);
    }
    var name: [*c]u8 = null;
    _ = &name;
    var found: bool = SDL_FindInHashTable(SDL_gamepad_names, @ptrFromInt(@as(usize, instance_id)), @ptrCast(@alignCast(&name)));
    _ = &found;
    if (!(current_name != null)) {
        if (!found) {
            _ = SDL_SetError_REAL("Gamepad %u not found", instance_id);
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
        _ = SDL_InsertIntoHashTable(SDL_gamepad_names, @ptrFromInt(@as(usize, instance_id)), @ptrCast(@alignCast(name)), @"true" != 0);
    }
    return name;
}
pub export fn SDL_PrivateGamepadAdded(instance_id: SDL_JoystickID) void {
    @setEvalBranchQuota(100000);
    var event: SDL_Event = undefined;
    _ = &event;
    if (!SDL_gamepads_initialized or SDL_IsJoystickBeingAdded()) {
        return;
    }
    _ = SDL_UpdateGamepadNameForID(instance_id);
    event.type = SDL_EVENT_GAMEPAD_ADDED;
    event.common.timestamp = 0;
    event.gdevice.which = instance_id;
    _ = SDL_PushEvent_REAL(&event);
}
pub export fn SDL_PrivateGamepadRemoved(instance_id: SDL_JoystickID) void {
    @setEvalBranchQuota(100000);
    var event: SDL_Event = undefined;
    _ = &event;
    var gamepad: [*c]SDL_Gamepad = undefined;
    _ = &gamepad;
    SDL_AssertJoysticksLocked();
    if (!SDL_gamepads_initialized) {
        return;
    }
    {
        gamepad = SDL_gamepads;
        while (gamepad != null) : (gamepad = gamepad.*.next) {
            if (gamepad.*.joystick.*.instance_id == instance_id) {
                RecenterGamepad(gamepad);
                break;
            }
        }
    }
    event.type = SDL_EVENT_GAMEPAD_REMOVED;
    event.common.timestamp = 0;
    event.gdevice.which = instance_id;
    _ = SDL_PushEvent_REAL(&event);
}
pub fn SDL_PrivateGamepadRemapped(instance_id: SDL_JoystickID) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var event: SDL_Event = undefined;
    _ = &event;
    if (!SDL_gamepads_initialized or SDL_IsJoystickBeingAdded()) {
        return;
    }
    event.type = SDL_EVENT_GAMEPAD_REMAPPED;
    event.common.timestamp = 0;
    event.gdevice.which = instance_id;
    _ = SDL_PushEvent_REAL(&event);
}
pub fn SDL_GamepadEventWatcher(_: ?*anyopaque, event: [*c]SDL_Event) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var gamepad: [*c]SDL_Gamepad = undefined;
    _ = &gamepad;
    var deviceevent: SDL_Event = undefined;
    _ = &deviceevent;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (event.*.type) {
                    @as(Uint32, SDL_EVENT_JOYSTICK_AXIS_MOTION) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_JOYSTICK_BUTTON_DOWN) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_JOYSTICK_BUTTON_UP) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_JOYSTICK_HAT_MOTION) => {
                        sdl_pc = 19;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_JOYSTICK_UPDATE_COMPLETE) => {
                        sdl_pc = 27;
                        continue;
                    },
                    else => {
                        sdl_pc = 38;
                        continue;
                    },
                }
            },
            1 => {
                return @"true" != 0;
            },
            2 => {
                SDL_AssertJoysticksLocked();
                gamepad = SDL_gamepads;
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                if (gamepad != null) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            4 => {
                if (gamepad.*.joystick.*.instance_id == event.*.jaxis.which) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            5 => {
                gamepad = gamepad.*.next;
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            6 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            7 => {
                HandleJoystickAxis(event.*.common.timestamp, gamepad, event.*.jaxis.axis, event.*.jaxis.value);
                {
                    sdl_pc = 6;
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
                SDL_AssertJoysticksLocked();
                gamepad = SDL_gamepads;
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                if (gamepad != null) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            13 => {
                if (gamepad.*.joystick.*.instance_id == event.*.jbutton.which) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            14 => {
                gamepad = gamepad.*.next;
                {
                    sdl_pc = 12;
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
                HandleJoystickButton(event.*.common.timestamp, gamepad, event.*.jbutton.button, event.*.jbutton.down);
                {
                    sdl_pc = 15;
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
                    sdl_pc = 14;
                    continue;
                }
            },
            19 => {
                SDL_AssertJoysticksLocked();
                gamepad = SDL_gamepads;
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            20 => {
                if (gamepad != null) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            21 => {
                if (gamepad.*.joystick.*.instance_id == event.*.jhat.which) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            22 => {
                gamepad = gamepad.*.next;
                {
                    sdl_pc = 20;
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
                HandleJoystickHat(event.*.common.timestamp, gamepad, event.*.jhat.hat, event.*.jhat.value);
                {
                    sdl_pc = 23;
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
                    sdl_pc = 22;
                    continue;
                }
            },
            27 => {
                SDL_AssertJoysticksLocked();
                if (SDL_EventEnabled_REAL(SDL_EVENT_GAMEPAD_UPDATE_COMPLETE)) {
                    sdl_pc = 28;
                    continue;
                } else {
                    sdl_pc = 29;
                    continue;
                }
            },
            28 => {
                gamepad = SDL_gamepads;
                {
                    sdl_pc = 31;
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
                    sdl_pc = 1;
                    continue;
                }
            },
            31 => {
                if (gamepad != null) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 34;
                    continue;
                }
            },
            32 => {
                if (gamepad.*.joystick.*.instance_id == event.*.jdevice.which) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            33 => {
                gamepad = gamepad.*.next;
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            34 => {
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            35 => {
                deviceevent.type = SDL_EVENT_GAMEPAD_UPDATE_COMPLETE;
                deviceevent.common.timestamp = event.*.jdevice.timestamp;
                deviceevent.gdevice.which = event.*.jdevice.which;
                _ = SDL_PushEvent_REAL(&deviceevent);
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
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            38 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn AdjustSensorOrientation(joystick: [*c]const SDL_Joystick, src: [*c]const f32, dst: [*c]f32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var i: c_uint = undefined;
    _ = &i;
    var j: c_uint = undefined;
    _ = &j;
    SDL_AssertJoysticksLocked();
    {
        i = 0;
        while (i < @as(c_uint, 3)) : (i +%= 1) {
            dst[i] = 0.0;
            {
                j = 0;
                while (j < @as(c_uint, 3)) : (j +%= 1) {
                    dst[i] += joystick.*.sensor_transform[i][j] * src[j];
                }
            }
        }
    }
}
pub export fn SDL_GamepadSensorWatcher(timestamp: Uint64, sensor: SDL_SensorID, sensor_timestamp: Uint64, data: [*c]f32, _: c_int) void {
    @setEvalBranchQuota(100000);
    var gamepad: [*c]SDL_Gamepad = undefined;
    _ = &gamepad;
    SDL_LockJoysticks_REAL();
    {
        gamepad = SDL_gamepads;
        while (gamepad != null) : (gamepad = gamepad.*.next) {
            if ((gamepad.*.joystick.*.accel != null) and (gamepad.*.joystick.*.accel_sensor == sensor)) {
                var gamepad_data: [3]f32 = undefined;
                _ = &gamepad_data;
                AdjustSensorOrientation(gamepad.*.joystick, data, @ptrCast(@alignCast(&gamepad_data)));
                SDL_SendJoystickSensor(timestamp, gamepad.*.joystick, SDL_SENSOR_ACCEL, sensor_timestamp, @ptrCast(@alignCast(&gamepad_data)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(gamepad_data)) / @sizeOf(@TypeOf(gamepad_data[@as(c_int, 0)]))))));
            }
            if ((gamepad.*.joystick.*.gyro != null) and (gamepad.*.joystick.*.gyro_sensor == sensor)) {
                var gamepad_data: [3]f32 = undefined;
                _ = &gamepad_data;
                AdjustSensorOrientation(gamepad.*.joystick, data, @ptrCast(@alignCast(&gamepad_data)));
                SDL_SendJoystickSensor(timestamp, gamepad.*.joystick, SDL_SENSOR_GYRO, sensor_timestamp, @ptrCast(@alignCast(&gamepad_data)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(gamepad_data)) / @sizeOf(@TypeOf(gamepad_data[@as(c_int, 0)]))))));
            }
        }
    }
    SDL_UnlockJoysticks_REAL();
}
pub fn PushMappingChangeTracking() callconv(.c) void {
    @setEvalBranchQuota(100000);
    var tracker: [*c]MappingChangeTracker = undefined;
    _ = &tracker;
    var i: c_int = undefined;
    _ = &i;
    var num_joysticks: c_int = undefined;
    _ = &num_joysticks;
    SDL_AssertJoysticksLocked();
    if (s_mappingChangeTracker != null) {
        s_mappingChangeTracker.*.refcount += 1;
        return;
    }
    s_mappingChangeTracker = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(tracker.*)))));
    s_mappingChangeTracker.*.refcount = 1;
    tracker = s_mappingChangeTracker;
    tracker.*.joysticks = SDL_GetJoysticks_REAL(&num_joysticks);
    if (!(tracker.*.joysticks != null)) {
        return;
    }
    if (num_joysticks == @as(c_int, 0)) {
        return;
    }
    tracker.*.joystick_mappings = @ptrCast(@alignCast(SDL_malloc_REAL(@as(c_ulong, @bitCast(@as(c_long, num_joysticks))) *% @sizeOf(@TypeOf(tracker.*.joystick_mappings.*)))));
    if (!(tracker.*.joystick_mappings != null)) {
        return;
    }
    {
        i = 0;
        while (i < num_joysticks) : (i += 1) {
            tracker.*.joystick_mappings[@bitCast(@as(isize, @intCast(i)))] = SDL_PrivateGetGamepadMapping(tracker.*.joysticks[@bitCast(@as(isize, @intCast(i)))], @"false" != 0);
        }
    }
}
pub fn AddMappingChangeTracking(mapping: [*c]GamepadMapping_t) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [24:0]u8 = "AddMappingChangeTracking".*;
    };
    _ = &static_local___func__;
    var tracker: [*c]MappingChangeTracker = undefined;
    _ = &tracker;
    var num_mappings: c_int = undefined;
    _ = &num_mappings;
    var new_mappings: [*c][*c]GamepadMapping_t = undefined;
    _ = &new_mappings;
    SDL_AssertJoysticksLocked();
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(s_mappingChangeTracker))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "s_mappingChangeTracker != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gamepad.c", 631);
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
    tracker = s_mappingChangeTracker;
    num_mappings = tracker.*.num_changed_mappings;
    new_mappings = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(tracker.*.changed_mappings)), @as(c_ulong, @bitCast(@as(c_long, num_mappings + @as(c_int, 1)))) *% @sizeOf(@TypeOf(new_mappings.*)))));
    if (new_mappings != null) {
        tracker.*.changed_mappings = new_mappings;
        tracker.*.changed_mappings[@bitCast(@as(isize, @intCast(num_mappings)))] = mapping;
        tracker.*.num_changed_mappings = num_mappings + @as(c_int, 1);
    }
}
pub fn HasMappingChangeTracking(tracker: [*c]MappingChangeTracker, mapping: [*c]GamepadMapping_t) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    SDL_AssertJoysticksLocked();
    {
        i = 0;
        while (i < tracker.*.num_changed_mappings) : (i += 1) {
            if (tracker.*.changed_mappings[@bitCast(@as(isize, @intCast(i)))] == mapping) {
                return @"true" != 0;
            }
        }
    }
    return @"false" != 0;
}
pub fn PopMappingChangeTracking() callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [24:0]u8 = "PopMappingChangeTracking".*;
    };
    _ = &static_local___func__;
    var i: c_int = undefined;
    _ = &i;
    var tracker: [*c]MappingChangeTracker = undefined;
    _ = &tracker;
    SDL_AssertJoysticksLocked();
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(s_mappingChangeTracker))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "s_mappingChangeTracker != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gamepad.c", 663);
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
    tracker = s_mappingChangeTracker;
    tracker.*.refcount -= 1;
    if (tracker.*.refcount > @as(c_int, 0)) {
        return;
    }
    s_mappingChangeTracker = null;
    if ((tracker.*.joysticks != null) and (tracker.*.joystick_mappings != null)) {
        {
            i = 0;
            while (tracker.*.joysticks[@bitCast(@as(isize, @intCast(i)))] != 0) : (i += 1) {
                var joystick: SDL_JoystickID = tracker.*.joysticks[@bitCast(@as(isize, @intCast(i)))];
                _ = &joystick;
                var gamepad: [*c]SDL_Gamepad = SDL_GetGamepadFromID_REAL(joystick);
                _ = &gamepad;
                var new_mapping: [*c]GamepadMapping_t = SDL_PrivateGetGamepadMapping(joystick, @"false" != 0);
                _ = &new_mapping;
                var old_mapping: [*c]GamepadMapping_t = if (gamepad != null) gamepad.*.mapping else tracker.*.joystick_mappings[@bitCast(@as(isize, @intCast(i)))];
                _ = &old_mapping;
                if ((new_mapping != null) and !(old_mapping != null)) {
                    if (s_gamepadInstanceIDs != null) {
                        _ = SDL_InsertIntoHashTable(s_gamepadInstanceIDs, @ptrFromInt(@as(usize, joystick)), @ptrFromInt(@as(usize, @intCast(@"true"))), @"true" != 0);
                    }
                    SDL_PrivateGamepadAdded(joystick);
                } else if ((old_mapping != null) and !(new_mapping != null)) {
                    if (s_gamepadInstanceIDs != null) {
                        _ = SDL_InsertIntoHashTable(s_gamepadInstanceIDs, @ptrFromInt(@as(usize, joystick)), null, @"true" != 0);
                    }
                    SDL_PrivateGamepadRemoved(joystick);
                } else if ((old_mapping != new_mapping) or HasMappingChangeTracking(tracker, new_mapping)) {
                    if (gamepad != null) {
                        SDL_PrivateLoadButtonMapping(gamepad, new_mapping);
                    }
                    SDL_PrivateGamepadRemapped(joystick);
                }
            }
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(tracker.*.joysticks)));
    SDL_free_REAL(@ptrCast(@alignCast(tracker.*.joystick_mappings)));
    SDL_free_REAL(@ptrCast(@alignCast(tracker.*.changed_mappings)));
    SDL_free_REAL(@ptrCast(@alignCast(tracker)));
}
pub fn SDL_SInputStylesMapExtraction(styles: [*c]SDL_SInputStyles_t, mapping_string: [*c]u8, mapping_string_len: usize) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var current_button: c_int = undefined;
    _ = &current_button;
    var current_axis: c_int = undefined;
    _ = &current_axis;
    var misc_buttons: c_int = undefined;
    _ = &misc_buttons;
    var misc_button: c_int = undefined;
    _ = &misc_button;
    var misc_end: c_int = undefined;
    _ = &misc_end;
    var digital_triggers: bool = undefined;
    _ = &digital_triggers;
    var dualstage_triggers: bool = undefined;
    _ = &dualstage_triggers;
    var bumpers: c_int = undefined;
    _ = &bumpers;
    var left_stick: bool = undefined;
    _ = &left_stick;
    var right_stick: bool = undefined;
    _ = &right_stick;
    var paddle_pairs: c_int = undefined;
    _ = &paddle_pairs;
    var misc_label: [32]u8 = undefined;
    _ = &misc_label;
    var temp: [32]u8 = undefined;
    _ = &temp;
    var temp_1: [32]u8 = undefined;
    _ = &temp_1;
    var temp_2: [32]u8 = undefined;
    _ = &temp_2;
    var temp_3: [32]u8 = undefined;
    _ = &temp_3;
    var temp_4: [32]u8 = undefined;
    _ = &temp_4;
    var temp_5: [32]u8 = undefined;
    _ = &temp_5;
    var temp_6: [32]u8 = undefined;
    _ = &temp_6;
    var temp_7: [32]u8 = undefined;
    _ = &temp_7;
    var temp_8: [32]u8 = undefined;
    _ = &temp_8;
    var temp_9: [32]u8 = undefined;
    _ = &temp_9;
    var temp_10: [32]u8 = undefined;
    _ = &temp_10;
    var temp_11: [32]u8 = undefined;
    _ = &temp_11;
    var temp_12: [32]u8 = undefined;
    _ = &temp_12;
    var temp_13: [32]u8 = undefined;
    _ = &temp_13;
    var temp_14: [32]u8 = undefined;
    _ = &temp_14;
    var temp_15: [32]u8 = undefined;
    _ = &temp_15;
    var temp_16: [32]u8 = undefined;
    _ = &temp_16;
    var temp_17: [32]u8 = undefined;
    _ = &temp_17;
    var temp_18: [32]u8 = undefined;
    _ = &temp_18;
    var temp_19: [32]u8 = undefined;
    _ = &temp_19;
    var temp_20: [32]u8 = undefined;
    _ = &temp_20;
    var temp_21: [32]u8 = undefined;
    _ = &temp_21;
    var temp_22: [32]u8 = undefined;
    _ = &temp_22;
    var temp_23: [32]u8 = undefined;
    _ = &temp_23;
    var temp_24: [32]u8 = undefined;
    _ = &temp_24;
    var temp_25: [32]u8 = undefined;
    _ = &temp_25;
    var temp_26: [32]u8 = undefined;
    _ = &temp_26;
    var temp_27: [32]u8 = undefined;
    _ = &temp_27;
    var temp_28: [32]u8 = undefined;
    _ = &temp_28;
    var temp_29: [32]u8 = undefined;
    _ = &temp_29;
    var temp_30: [32]u8 = undefined;
    _ = &temp_30;
    var temp_31: [32]u8 = undefined;
    _ = &temp_31;
    var temp_32: [32]u8 = undefined;
    _ = &temp_32;
    var temp_33: [32]u8 = undefined;
    _ = &temp_33;
    var temp_34: [32]u8 = undefined;
    _ = &temp_34;
    var temp_35: [32]u8 = undefined;
    _ = &temp_35;
    var temp_36: [32]u8 = undefined;
    _ = &temp_36;
    var temp_37: [32]u8 = undefined;
    _ = &temp_37;
    var i: c_int = undefined;
    _ = &i;
    var temp_38: [32]u8 = undefined;
    _ = &temp_38;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                current_button = 0;
                current_axis = 0;
                misc_buttons = 0;
                digital_triggers = @"false" != 0;
                dualstage_triggers = @"false" != 0;
                bumpers = 0;
                left_stick = @"false" != 0;
                right_stick = @"false" != 0;
                paddle_pairs = 0;
                switch (@as(c_int, styles.*.misc_style)) {
                    SINPUT_MISCSTYLE_1 => {
                        sdl_pc = 2;
                        continue;
                    },
                    SINPUT_MISCSTYLE_2 => {
                        sdl_pc = 3;
                        continue;
                    },
                    SINPUT_MISCSTYLE_3 => {
                        sdl_pc = 4;
                        continue;
                    },
                    SINPUT_MISCSTYLE_4 => {
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
                misc_button = 2;
                misc_end = misc_button + misc_buttons;
                switch (@as(c_int, styles.*.analog_style)) {
                    SINPUT_ANALOGSTYLE_LEFTONLY => {
                        sdl_pc = 8;
                        continue;
                    },
                    SINPUT_ANALOGSTYLE_LEFTRIGHT => {
                        sdl_pc = 15;
                        continue;
                    },
                    SINPUT_ANALOGSTYLE_RIGHTONLY => {
                        sdl_pc = 28;
                        continue;
                    },
                    else => {
                        sdl_pc = 35;
                        continue;
                    },
                }
            },
            2 => {
                misc_buttons = 1;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                misc_buttons = 2;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                misc_buttons = 3;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            5 => {
                misc_buttons = 4;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            6 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            7 => {
                switch (@as(c_int, styles.*.bumper_style)) {
                    SINPUT_BUMPERSTYLE_ONE => {
                        sdl_pc = 37;
                        continue;
                    },
                    SINPUT_BUMPERSTYLE_TWO => {
                        sdl_pc = 38;
                        continue;
                    },
                    else => {
                        sdl_pc = 39;
                        continue;
                    },
                }
            },
            8 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&temp)), @sizeOf(@TypeOf(temp)), "%s:a%d,", @as([*c]u8, @as([*c]u8, @constCast("leftx"))), blk: {
                    const ref = &current_axis;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                });
                _ = SDL_strlcat_REAL(mapping_string, @ptrCast(@alignCast(&temp)), mapping_string_len);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                if (false) {
                    sdl_pc = 9;
                    continue;
                } else {
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
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&temp_1)), @sizeOf(@TypeOf(temp_1)), "%s:a%d,", @as([*c]u8, @as([*c]u8, @constCast("lefty"))), blk: {
                    const ref = &current_axis;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                });
                _ = SDL_strlcat_REAL(mapping_string, @ptrCast(@alignCast(&temp_1)), mapping_string_len);
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                if (false) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            14 => {
                left_stick = @"true" != 0;
                {
                    sdl_pc = 7;
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
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&temp_2)), @sizeOf(@TypeOf(temp_2)), "%s:a%d,", @as([*c]u8, @as([*c]u8, @constCast("leftx"))), blk: {
                    const ref = &current_axis;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                });
                _ = SDL_strlcat_REAL(mapping_string, @ptrCast(@alignCast(&temp_2)), mapping_string_len);
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            17 => {
                if (false) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 18;
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
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&temp_3)), @sizeOf(@TypeOf(temp_3)), "%s:a%d,", @as([*c]u8, @as([*c]u8, @constCast("lefty"))), blk: {
                    const ref = &current_axis;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                });
                _ = SDL_strlcat_REAL(mapping_string, @ptrCast(@alignCast(&temp_3)), mapping_string_len);
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            20 => {
                if (false) {
                    sdl_pc = 19;
                    continue;
                } else {
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
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&temp_4)), @sizeOf(@TypeOf(temp_4)), "%s:a%d,", @as([*c]u8, @as([*c]u8, @constCast("rightx"))), blk: {
                    const ref = &current_axis;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                });
                _ = SDL_strlcat_REAL(mapping_string, @ptrCast(@alignCast(&temp_4)), mapping_string_len);
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            23 => {
                if (false) {
                    sdl_pc = 22;
                    continue;
                } else {
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
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&temp_5)), @sizeOf(@TypeOf(temp_5)), "%s:a%d,", @as([*c]u8, @as([*c]u8, @constCast("righty"))), blk: {
                    const ref = &current_axis;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                });
                _ = SDL_strlcat_REAL(mapping_string, @ptrCast(@alignCast(&temp_5)), mapping_string_len);
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            26 => {
                if (false) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            27 => {
                left_stick = @"true" != 0;
                right_stick = @"true" != 0;
                {
                    sdl_pc = 7;
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
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&temp_6)), @sizeOf(@TypeOf(temp_6)), "%s:a%d,", @as([*c]u8, @as([*c]u8, @constCast("rightx"))), blk: {
                    const ref = &current_axis;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                });
                _ = SDL_strlcat_REAL(mapping_string, @ptrCast(@alignCast(&temp_6)), mapping_string_len);
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            30 => {
                if (false) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 31;
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
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&temp_7)), @sizeOf(@TypeOf(temp_7)), "%s:a%d,", @as([*c]u8, @as([*c]u8, @constCast("righty"))), blk: {
                    const ref = &current_axis;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                });
                _ = SDL_strlcat_REAL(mapping_string, @ptrCast(@alignCast(&temp_7)), mapping_string_len);
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            33 => {
                if (false) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 34;
                    continue;
                }
            },
            34 => {
                right_stick = @"true" != 0;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            35 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            36 => {
                switch (@as(c_int, styles.*.trigger_style)) {
                    SINPUT_TRIGGERSTYLE_ANALOG => {
                        sdl_pc = 41;
                        continue;
                    },
                    SINPUT_TRIGGERSTYLE_DIGITAL => {
                        sdl_pc = 48;
                        continue;
                    },
                    SINPUT_TRIGGERSTYLE_DUALSTAGE => {
                        sdl_pc = 49;
                        continue;
                    },
                    else => {
                        sdl_pc = 56;
                        continue;
                    },
                }
            },
            37 => {
                bumpers = 1;
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            38 => {
                bumpers = 2;
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            39 => {
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            40 => {
                switch (@as(c_int, styles.*.paddle_style)) {
                    SINPUT_PADDLESTYLE_TWO => {
                        sdl_pc = 58;
                        continue;
                    },
                    SINPUT_PADDLESTYLE_FOUR => {
                        sdl_pc = 59;
                        continue;
                    },
                    else => {
                        sdl_pc = 60;
                        continue;
                    },
                }
            },
            41 => {
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            42 => {
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&temp_8)), @sizeOf(@TypeOf(temp_8)), "%s:a%d,", @as([*c]u8, @as([*c]u8, @constCast("lefttrigger"))), blk: {
                    const ref = &current_axis;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                });
                _ = SDL_strlcat_REAL(mapping_string, @ptrCast(@alignCast(&temp_8)), mapping_string_len);
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            43 => {
                if (false) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 44;
                    continue;
                }
            },
            44 => {
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            45 => {
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&temp_9)), @sizeOf(@TypeOf(temp_9)), "%s:a%d,", @as([*c]u8, @as([*c]u8, @constCast("righttrigger"))), blk: {
                    const ref = &current_axis;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                });
                _ = SDL_strlcat_REAL(mapping_string, @ptrCast(@alignCast(&temp_9)), mapping_string_len);
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            46 => {
                if (false) {
                    sdl_pc = 45;
                    continue;
                } else {
                    sdl_pc = 47;
                    continue;
                }
            },
            47 => {
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            48 => {
                digital_triggers = @"true" != 0;
                {
                    sdl_pc = 40;
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
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&temp_10)), @sizeOf(@TypeOf(temp_10)), "%s:a%d,", @as([*c]u8, @as([*c]u8, @constCast("lefttrigger"))), blk: {
                    const ref = &current_axis;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                });
                _ = SDL_strlcat_REAL(mapping_string, @ptrCast(@alignCast(&temp_10)), mapping_string_len);
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            51 => {
                if (false) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 52;
                    continue;
                }
            },
            52 => {
                {
                    sdl_pc = 53;
                    continue;
                }
            },
            53 => {
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&temp_11)), @sizeOf(@TypeOf(temp_11)), "%s:a%d,", @as([*c]u8, @as([*c]u8, @constCast("righttrigger"))), blk: {
                    const ref = &current_axis;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                });
                _ = SDL_strlcat_REAL(mapping_string, @ptrCast(@alignCast(&temp_11)), mapping_string_len);
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            54 => {
                if (false) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 55;
                    continue;
                }
            },
            55 => {
                dualstage_triggers = @"true" != 0;
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            56 => {
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            57 => {
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            58 => {
                paddle_pairs = 1;
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            59 => {
                paddle_pairs = 2;
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            60 => {
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            61 => {
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&temp_12)), @sizeOf(@TypeOf(temp_12)), "%s:b%d,", @as([*c]u8, @as([*c]u8, @constCast("a"))), blk: {
                    const ref = &current_button;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                });
                _ = SDL_strlcat_REAL(mapping_string, @ptrCast(@alignCast(&temp_12)), mapping_string_len);
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            62 => {
                if (false) {
                    sdl_pc = 61;
                    continue;
                } else {
                    sdl_pc = 63;
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
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&temp_13)), @sizeOf(@TypeOf(temp_13)), "%s:b%d,", @as([*c]u8, @as([*c]u8, @constCast("b"))), blk: {
                    const ref = &current_button;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                });
                _ = SDL_strlcat_REAL(mapping_string, @ptrCast(@alignCast(&temp_13)), mapping_string_len);
                {
                    sdl_pc = 65;
                    continue;
                }
            },
            65 => {
                if (false) {
                    sdl_pc = 64;
                    continue;
                } else {
                    sdl_pc = 66;
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
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&temp_14)), @sizeOf(@TypeOf(temp_14)), "%s:b%d,", @as([*c]u8, @as([*c]u8, @constCast("x"))), blk: {
                    const ref = &current_button;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                });
                _ = SDL_strlcat_REAL(mapping_string, @ptrCast(@alignCast(&temp_14)), mapping_string_len);
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            68 => {
                if (false) {
                    sdl_pc = 67;
                    continue;
                } else {
                    sdl_pc = 69;
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
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&temp_15)), @sizeOf(@TypeOf(temp_15)), "%s:b%d,", @as([*c]u8, @as([*c]u8, @constCast("y"))), blk: {
                    const ref = &current_button;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                });
                _ = SDL_strlcat_REAL(mapping_string, @ptrCast(@alignCast(&temp_15)), mapping_string_len);
                {
                    sdl_pc = 71;
                    continue;
                }
            },
            71 => {
                if (false) {
                    sdl_pc = 70;
                    continue;
                } else {
                    sdl_pc = 72;
                    continue;
                }
            },
            72 => {
                _ = SDL_strlcat_REAL(mapping_string, "dpup:h0.1,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,", mapping_string_len);
                if (left_stick) {
                    sdl_pc = 73;
                    continue;
                } else {
                    sdl_pc = 74;
                    continue;
                }
            },
            73 => {
                {
                    sdl_pc = 76;
                    continue;
                }
            },
            74 => {
                {
                    sdl_pc = 75;
                    continue;
                }
            },
            75 => {
                if (right_stick) {
                    sdl_pc = 79;
                    continue;
                } else {
                    sdl_pc = 80;
                    continue;
                }
            },
            76 => {
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&temp_16)), @sizeOf(@TypeOf(temp_16)), "%s:b%d,", @as([*c]u8, @as([*c]u8, @constCast("leftstick"))), blk: {
                    const ref = &current_button;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                });
                _ = SDL_strlcat_REAL(mapping_string, @ptrCast(@alignCast(&temp_16)), mapping_string_len);
                {
                    sdl_pc = 77;
                    continue;
                }
            },
            77 => {
                if (false) {
                    sdl_pc = 76;
                    continue;
                } else {
                    sdl_pc = 78;
                    continue;
                }
            },
            78 => {
                {
                    sdl_pc = 75;
                    continue;
                }
            },
            79 => {
                {
                    sdl_pc = 82;
                    continue;
                }
            },
            80 => {
                {
                    sdl_pc = 81;
                    continue;
                }
            },
            81 => {
                if (bumpers > @as(c_int, 0)) {
                    sdl_pc = 85;
                    continue;
                } else {
                    sdl_pc = 86;
                    continue;
                }
            },
            82 => {
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&temp_17)), @sizeOf(@TypeOf(temp_17)), "%s:b%d,", @as([*c]u8, @as([*c]u8, @constCast("rightstick"))), blk: {
                    const ref = &current_button;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                });
                _ = SDL_strlcat_REAL(mapping_string, @ptrCast(@alignCast(&temp_17)), mapping_string_len);
                {
                    sdl_pc = 83;
                    continue;
                }
            },
            83 => {
                if (false) {
                    sdl_pc = 82;
                    continue;
                } else {
                    sdl_pc = 84;
                    continue;
                }
            },
            84 => {
                {
                    sdl_pc = 81;
                    continue;
                }
            },
            85 => {
                {
                    sdl_pc = 88;
                    continue;
                }
            },
            86 => {
                {
                    sdl_pc = 87;
                    continue;
                }
            },
            87 => {
                if (bumpers > @as(c_int, 1)) {
                    sdl_pc = 91;
                    continue;
                } else {
                    sdl_pc = 92;
                    continue;
                }
            },
            88 => {
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&temp_18)), @sizeOf(@TypeOf(temp_18)), "%s:b%d,", @as([*c]u8, @as([*c]u8, @constCast("leftshoulder"))), blk: {
                    const ref = &current_button;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                });
                _ = SDL_strlcat_REAL(mapping_string, @ptrCast(@alignCast(&temp_18)), mapping_string_len);
                {
                    sdl_pc = 89;
                    continue;
                }
            },
            89 => {
                if (false) {
                    sdl_pc = 88;
                    continue;
                } else {
                    sdl_pc = 90;
                    continue;
                }
            },
            90 => {
                {
                    sdl_pc = 87;
                    continue;
                }
            },
            91 => {
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            92 => {
                {
                    sdl_pc = 93;
                    continue;
                }
            },
            93 => {
                if (digital_triggers) {
                    sdl_pc = 97;
                    continue;
                } else {
                    sdl_pc = 98;
                    continue;
                }
            },
            94 => {
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&temp_19)), @sizeOf(@TypeOf(temp_19)), "%s:b%d,", @as([*c]u8, @as([*c]u8, @constCast("rightshoulder"))), blk: {
                    const ref = &current_button;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                });
                _ = SDL_strlcat_REAL(mapping_string, @ptrCast(@alignCast(&temp_19)), mapping_string_len);
                {
                    sdl_pc = 95;
                    continue;
                }
            },
            95 => {
                if (false) {
                    sdl_pc = 94;
                    continue;
                } else {
                    sdl_pc = 96;
                    continue;
                }
            },
            96 => {
                {
                    sdl_pc = 93;
                    continue;
                }
            },
            97 => {
                {
                    sdl_pc = 100;
                    continue;
                }
            },
            98 => {
                if (dualstage_triggers) {
                    sdl_pc = 106;
                    continue;
                } else {
                    sdl_pc = 107;
                    continue;
                }
            },
            99 => {
                if (paddle_pairs > @as(c_int, 0)) {
                    sdl_pc = 118;
                    continue;
                } else {
                    sdl_pc = 119;
                    continue;
                }
            },
            100 => {
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&temp_20)), @sizeOf(@TypeOf(temp_20)), "%s:b%d,", @as([*c]u8, @as([*c]u8, @constCast("lefttrigger"))), blk: {
                    const ref = &current_button;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                });
                _ = SDL_strlcat_REAL(mapping_string, @ptrCast(@alignCast(&temp_20)), mapping_string_len);
                {
                    sdl_pc = 101;
                    continue;
                }
            },
            101 => {
                if (false) {
                    sdl_pc = 100;
                    continue;
                } else {
                    sdl_pc = 102;
                    continue;
                }
            },
            102 => {
                {
                    sdl_pc = 103;
                    continue;
                }
            },
            103 => {
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&temp_21)), @sizeOf(@TypeOf(temp_21)), "%s:b%d,", @as([*c]u8, @as([*c]u8, @constCast("righttrigger"))), blk: {
                    const ref = &current_button;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                });
                _ = SDL_strlcat_REAL(mapping_string, @ptrCast(@alignCast(&temp_21)), mapping_string_len);
                {
                    sdl_pc = 104;
                    continue;
                }
            },
            104 => {
                if (false) {
                    sdl_pc = 103;
                    continue;
                } else {
                    sdl_pc = 105;
                    continue;
                }
            },
            105 => {
                {
                    sdl_pc = 99;
                    continue;
                }
            },
            106 => {
                if (misc_end < @as(c_int, 3)) {
                    sdl_pc = 109;
                    continue;
                } else {
                    sdl_pc = 110;
                    continue;
                }
            },
            107 => {
                {
                    sdl_pc = 108;
                    continue;
                }
            },
            108 => {
                {
                    sdl_pc = 99;
                    continue;
                }
            },
            109 => {
                misc_end = 3;
                {
                    sdl_pc = 111;
                    continue;
                }
            },
            110 => {
                {
                    sdl_pc = 111;
                    continue;
                }
            },
            111 => {
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&misc_label)), @sizeOf(@TypeOf(misc_label)), "misc%d", blk: {
                    const ref = &misc_end;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                });
                {
                    sdl_pc = 112;
                    continue;
                }
            },
            112 => {
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&temp_22)), @sizeOf(@TypeOf(temp_22)), "%s:b%d,", @as([*c]u8, @ptrCast(@alignCast(&misc_label))), blk: {
                    const ref = &current_button;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                });
                _ = SDL_strlcat_REAL(mapping_string, @ptrCast(@alignCast(&temp_22)), mapping_string_len);
                {
                    sdl_pc = 113;
                    continue;
                }
            },
            113 => {
                if (false) {
                    sdl_pc = 112;
                    continue;
                } else {
                    sdl_pc = 114;
                    continue;
                }
            },
            114 => {
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&misc_label)), @sizeOf(@TypeOf(misc_label)), "misc%d", blk: {
                    const ref = &misc_end;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                });
                {
                    sdl_pc = 115;
                    continue;
                }
            },
            115 => {
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&temp_23)), @sizeOf(@TypeOf(temp_23)), "%s:b%d,", @as([*c]u8, @ptrCast(@alignCast(&misc_label))), blk: {
                    const ref = &current_button;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                });
                _ = SDL_strlcat_REAL(mapping_string, @ptrCast(@alignCast(&temp_23)), mapping_string_len);
                {
                    sdl_pc = 116;
                    continue;
                }
            },
            116 => {
                if (false) {
                    sdl_pc = 115;
                    continue;
                } else {
                    sdl_pc = 117;
                    continue;
                }
            },
            117 => {
                {
                    sdl_pc = 108;
                    continue;
                }
            },
            118 => {
                {
                    sdl_pc = 121;
                    continue;
                }
            },
            119 => {
                {
                    sdl_pc = 120;
                    continue;
                }
            },
            120 => {
                {
                    sdl_pc = 127;
                    continue;
                }
            },
            121 => {
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&temp_24)), @sizeOf(@TypeOf(temp_24)), "%s:b%d,", @as([*c]u8, @as([*c]u8, @constCast("paddle2"))), blk: {
                    const ref = &current_button;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                });
                _ = SDL_strlcat_REAL(mapping_string, @ptrCast(@alignCast(&temp_24)), mapping_string_len);
                {
                    sdl_pc = 122;
                    continue;
                }
            },
            122 => {
                if (false) {
                    sdl_pc = 121;
                    continue;
                } else {
                    sdl_pc = 123;
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
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&temp_25)), @sizeOf(@TypeOf(temp_25)), "%s:b%d,", @as([*c]u8, @as([*c]u8, @constCast("paddle1"))), blk: {
                    const ref = &current_button;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                });
                _ = SDL_strlcat_REAL(mapping_string, @ptrCast(@alignCast(&temp_25)), mapping_string_len);
                {
                    sdl_pc = 125;
                    continue;
                }
            },
            125 => {
                if (false) {
                    sdl_pc = 124;
                    continue;
                } else {
                    sdl_pc = 126;
                    continue;
                }
            },
            126 => {
                {
                    sdl_pc = 120;
                    continue;
                }
            },
            127 => {
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&temp_26)), @sizeOf(@TypeOf(temp_26)), "%s:b%d,", @as([*c]u8, @as([*c]u8, @constCast("start"))), blk: {
                    const ref = &current_button;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                });
                _ = SDL_strlcat_REAL(mapping_string, @ptrCast(@alignCast(&temp_26)), mapping_string_len);
                {
                    sdl_pc = 128;
                    continue;
                }
            },
            128 => {
                if (false) {
                    sdl_pc = 127;
                    continue;
                } else {
                    sdl_pc = 129;
                    continue;
                }
            },
            129 => {
                switch (@as(c_int, styles.*.meta_style)) {
                    SINPUT_METASTYLE_BACK => {
                        sdl_pc = 131;
                        continue;
                    },
                    SINPUT_METASTYLE_BACKGUIDE => {
                        sdl_pc = 135;
                        continue;
                    },
                    SINPUT_METASTYLE_BACKGUIDESHARE => {
                        sdl_pc = 142;
                        continue;
                    },
                    else => {
                        sdl_pc = 152;
                        continue;
                    },
                }
            },
            130 => {
                if (paddle_pairs > @as(c_int, 1)) {
                    sdl_pc = 153;
                    continue;
                } else {
                    sdl_pc = 154;
                    continue;
                }
            },
            131 => {
                {
                    sdl_pc = 132;
                    continue;
                }
            },
            132 => {
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&temp_27)), @sizeOf(@TypeOf(temp_27)), "%s:b%d,", @as([*c]u8, @as([*c]u8, @constCast("back"))), blk: {
                    const ref = &current_button;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                });
                _ = SDL_strlcat_REAL(mapping_string, @ptrCast(@alignCast(&temp_27)), mapping_string_len);
                {
                    sdl_pc = 133;
                    continue;
                }
            },
            133 => {
                if (false) {
                    sdl_pc = 132;
                    continue;
                } else {
                    sdl_pc = 134;
                    continue;
                }
            },
            134 => {
                {
                    sdl_pc = 130;
                    continue;
                }
            },
            135 => {
                {
                    sdl_pc = 136;
                    continue;
                }
            },
            136 => {
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&temp_28)), @sizeOf(@TypeOf(temp_28)), "%s:b%d,", @as([*c]u8, @as([*c]u8, @constCast("back"))), blk: {
                    const ref = &current_button;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                });
                _ = SDL_strlcat_REAL(mapping_string, @ptrCast(@alignCast(&temp_28)), mapping_string_len);
                {
                    sdl_pc = 137;
                    continue;
                }
            },
            137 => {
                if (false) {
                    sdl_pc = 136;
                    continue;
                } else {
                    sdl_pc = 138;
                    continue;
                }
            },
            138 => {
                {
                    sdl_pc = 139;
                    continue;
                }
            },
            139 => {
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&temp_29)), @sizeOf(@TypeOf(temp_29)), "%s:b%d,", @as([*c]u8, @as([*c]u8, @constCast("guide"))), blk: {
                    const ref = &current_button;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                });
                _ = SDL_strlcat_REAL(mapping_string, @ptrCast(@alignCast(&temp_29)), mapping_string_len);
                {
                    sdl_pc = 140;
                    continue;
                }
            },
            140 => {
                if (false) {
                    sdl_pc = 139;
                    continue;
                } else {
                    sdl_pc = 141;
                    continue;
                }
            },
            141 => {
                {
                    sdl_pc = 130;
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
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&temp_30)), @sizeOf(@TypeOf(temp_30)), "%s:b%d,", @as([*c]u8, @as([*c]u8, @constCast("back"))), blk: {
                    const ref = &current_button;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                });
                _ = SDL_strlcat_REAL(mapping_string, @ptrCast(@alignCast(&temp_30)), mapping_string_len);
                {
                    sdl_pc = 144;
                    continue;
                }
            },
            144 => {
                if (false) {
                    sdl_pc = 143;
                    continue;
                } else {
                    sdl_pc = 145;
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
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&temp_31)), @sizeOf(@TypeOf(temp_31)), "%s:b%d,", @as([*c]u8, @as([*c]u8, @constCast("guide"))), blk: {
                    const ref = &current_button;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                });
                _ = SDL_strlcat_REAL(mapping_string, @ptrCast(@alignCast(&temp_31)), mapping_string_len);
                {
                    sdl_pc = 147;
                    continue;
                }
            },
            147 => {
                if (false) {
                    sdl_pc = 146;
                    continue;
                } else {
                    sdl_pc = 148;
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
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&temp_32)), @sizeOf(@TypeOf(temp_32)), "%s:b%d,", @as([*c]u8, @as([*c]u8, @constCast("misc1"))), blk: {
                    const ref = &current_button;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                });
                _ = SDL_strlcat_REAL(mapping_string, @ptrCast(@alignCast(&temp_32)), mapping_string_len);
                {
                    sdl_pc = 150;
                    continue;
                }
            },
            150 => {
                if (false) {
                    sdl_pc = 149;
                    continue;
                } else {
                    sdl_pc = 151;
                    continue;
                }
            },
            151 => {
                {
                    sdl_pc = 130;
                    continue;
                }
            },
            152 => {
                {
                    sdl_pc = 130;
                    continue;
                }
            },
            153 => {
                {
                    sdl_pc = 156;
                    continue;
                }
            },
            154 => {
                {
                    sdl_pc = 155;
                    continue;
                }
            },
            155 => {
                switch (@as(c_int, styles.*.touch_style)) {
                    SINPUT_TOUCHSTYLE_SINGLE => {
                        sdl_pc = 163;
                        continue;
                    },
                    SINPUT_TOUCHSTYLE_DOUBLE => {
                        sdl_pc = 167;
                        continue;
                    },
                    else => {
                        sdl_pc = 174;
                        continue;
                    },
                }
            },
            156 => {
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&temp_33)), @sizeOf(@TypeOf(temp_33)), "%s:b%d,", @as([*c]u8, @as([*c]u8, @constCast("paddle4"))), blk: {
                    const ref = &current_button;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                });
                _ = SDL_strlcat_REAL(mapping_string, @ptrCast(@alignCast(&temp_33)), mapping_string_len);
                {
                    sdl_pc = 157;
                    continue;
                }
            },
            157 => {
                if (false) {
                    sdl_pc = 156;
                    continue;
                } else {
                    sdl_pc = 158;
                    continue;
                }
            },
            158 => {
                {
                    sdl_pc = 159;
                    continue;
                }
            },
            159 => {
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&temp_34)), @sizeOf(@TypeOf(temp_34)), "%s:b%d,", @as([*c]u8, @as([*c]u8, @constCast("paddle3"))), blk: {
                    const ref = &current_button;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                });
                _ = SDL_strlcat_REAL(mapping_string, @ptrCast(@alignCast(&temp_34)), mapping_string_len);
                {
                    sdl_pc = 160;
                    continue;
                }
            },
            160 => {
                if (false) {
                    sdl_pc = 159;
                    continue;
                } else {
                    sdl_pc = 161;
                    continue;
                }
            },
            161 => {
                {
                    sdl_pc = 155;
                    continue;
                }
            },
            162 => {
                i = 0;
                {
                    sdl_pc = 175;
                    continue;
                }
            },
            163 => {
                {
                    sdl_pc = 164;
                    continue;
                }
            },
            164 => {
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&temp_35)), @sizeOf(@TypeOf(temp_35)), "%s:b%d,", @as([*c]u8, @as([*c]u8, @constCast("touchpad"))), blk: {
                    const ref = &current_button;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                });
                _ = SDL_strlcat_REAL(mapping_string, @ptrCast(@alignCast(&temp_35)), mapping_string_len);
                {
                    sdl_pc = 165;
                    continue;
                }
            },
            165 => {
                if (false) {
                    sdl_pc = 164;
                    continue;
                } else {
                    sdl_pc = 166;
                    continue;
                }
            },
            166 => {
                {
                    sdl_pc = 162;
                    continue;
                }
            },
            167 => {
                {
                    sdl_pc = 168;
                    continue;
                }
            },
            168 => {
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&temp_36)), @sizeOf(@TypeOf(temp_36)), "%s:b%d,", @as([*c]u8, @as([*c]u8, @constCast("touchpad"))), blk: {
                    const ref = &current_button;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                });
                _ = SDL_strlcat_REAL(mapping_string, @ptrCast(@alignCast(&temp_36)), mapping_string_len);
                {
                    sdl_pc = 169;
                    continue;
                }
            },
            169 => {
                if (false) {
                    sdl_pc = 168;
                    continue;
                } else {
                    sdl_pc = 170;
                    continue;
                }
            },
            170 => {
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&misc_label)), @sizeOf(@TypeOf(misc_label)), "misc%d", blk: {
                    const ref = &misc_end;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                });
                {
                    sdl_pc = 171;
                    continue;
                }
            },
            171 => {
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&temp_37)), @sizeOf(@TypeOf(temp_37)), "%s:b%d,", @as([*c]u8, @ptrCast(@alignCast(&misc_label))), blk: {
                    const ref = &current_button;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                });
                _ = SDL_strlcat_REAL(mapping_string, @ptrCast(@alignCast(&temp_37)), mapping_string_len);
                {
                    sdl_pc = 172;
                    continue;
                }
            },
            172 => {
                if (false) {
                    sdl_pc = 171;
                    continue;
                } else {
                    sdl_pc = 173;
                    continue;
                }
            },
            173 => {
                {
                    sdl_pc = 162;
                    continue;
                }
            },
            174 => {
                {
                    sdl_pc = 162;
                    continue;
                }
            },
            175 => {
                if (i < misc_buttons) {
                    sdl_pc = 176;
                    continue;
                } else {
                    sdl_pc = 178;
                    continue;
                }
            },
            176 => {
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&misc_label)), @sizeOf(@TypeOf(misc_label)), "misc%d", blk: {
                    const ref = &misc_button;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                });
                {
                    sdl_pc = 179;
                    continue;
                }
            },
            177 => {
                i += 1;
                {
                    sdl_pc = 175;
                    continue;
                }
            },
            178 => {
                {}
            },
            179 => {
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&temp_38)), @sizeOf(@TypeOf(temp_38)), "%s:b%d,", @as([*c]u8, @ptrCast(@alignCast(&misc_label))), blk: {
                    const ref = &current_button;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                });
                _ = SDL_strlcat_REAL(mapping_string, @ptrCast(@alignCast(&temp_38)), mapping_string_len);
                {
                    sdl_pc = 180;
                    continue;
                }
            },
            180 => {
                if (false) {
                    sdl_pc = 179;
                    continue;
                } else {
                    sdl_pc = 181;
                    continue;
                }
            },
            181 => {
                {
                    sdl_pc = 177;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn SDL_CreateMappingStringForSInputGamepad(_: Uint16, _: Uint16, _: Uint8, arg_version: Uint16, face_style: Uint8, mapping_string: [*c]u8, mapping_string_len: usize) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var version = arg_version;
    _ = &version;
    var decoded: SDL_SInputStyles_t = undefined;
    _ = &decoded;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                decoded = SDL_SInputStyles_t{
                    .analog_style = 0,
                    .bumper_style = 0,
                    .trigger_style = 0,
                    .paddle_style = 0,
                    .meta_style = 0,
                    .touch_style = 0,
                    .misc_style = 0,
                };
                switch (@as(c_int, face_style)) {
                    @as(c_int, 2) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 5;
                        continue;
                    },
                    else => {
                        sdl_pc = 2;
                        continue;
                    },
                }
            },
            1 => {
                decoded.misc_style = @truncate(@as(SInput_MiscStyleType, @bitCast(__helpers.signedRemainder(@as(c_int, version), SINPUT_MISCSTYLE_MAX))));
                {
                    const ref = &version;
                    ref.* = @bitCast(@as(c_short, @truncate(@divTrunc(@as(c_int, ref.*), SINPUT_MISCSTYLE_MAX))));
                }
                decoded.touch_style = @truncate(@as(SInput_TouchStyleType, @bitCast(__helpers.signedRemainder(@as(c_int, version), SINPUT_TOUCHSTYLE_MAX))));
                {
                    const ref = &version;
                    ref.* = @bitCast(@as(c_short, @truncate(@divTrunc(@as(c_int, ref.*), SINPUT_TOUCHSTYLE_MAX))));
                }
                decoded.meta_style = @truncate(@as(SInput_MetaStyleType, @bitCast(__helpers.signedRemainder(@as(c_int, version), SINPUT_METASTYLE_MAX))));
                {
                    const ref = &version;
                    ref.* = @bitCast(@as(c_short, @truncate(@divTrunc(@as(c_int, ref.*), SINPUT_METASTYLE_MAX))));
                }
                decoded.paddle_style = @truncate(@as(SInput_PaddleStyleType, @bitCast(__helpers.signedRemainder(@as(c_int, version), SINPUT_PADDLESTYLE_MAX))));
                {
                    const ref = &version;
                    ref.* = @bitCast(@as(c_short, @truncate(@divTrunc(@as(c_int, ref.*), SINPUT_PADDLESTYLE_MAX))));
                }
                decoded.trigger_style = @truncate(@as(SInput_TriggerStyleType, @bitCast(__helpers.signedRemainder(@as(c_int, version), SINPUT_TRIGGERSTYLE_MAX))));
                {
                    const ref = &version;
                    ref.* = @bitCast(@as(c_short, @truncate(@divTrunc(@as(c_int, ref.*), SINPUT_TRIGGERSTYLE_MAX))));
                }
                decoded.bumper_style = @truncate(@as(SInput_BumperStyleType, @bitCast(__helpers.signedRemainder(@as(c_int, version), SINPUT_BUMPERSTYLE_MAX))));
                {
                    const ref = &version;
                    ref.* = @bitCast(@as(c_short, @truncate(@divTrunc(@as(c_int, ref.*), SINPUT_BUMPERSTYLE_MAX))));
                }
                decoded.analog_style = @truncate(@as(SInput_AnalogStyleType, @bitCast(__helpers.signedRemainder(@as(c_int, version), SINPUT_ANALOGSTYLE_MAX))));
                SDL_SInputStylesMapExtraction(&decoded, mapping_string, mapping_string_len);
                {}
            },
            2 => {
                _ = SDL_strlcat_REAL(mapping_string, "face:abxy,", mapping_string_len);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                _ = SDL_strlcat_REAL(mapping_string, "face:axby,", mapping_string_len);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                _ = SDL_strlcat_REAL(mapping_string, "face:bayx,", mapping_string_len);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            5 => {
                _ = SDL_strlcat_REAL(mapping_string, "face:sony,", mapping_string_len);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn SDL_CreateMappingForHIDAPIGamepad(guid: SDL_GUID) callconv(.c) [*c]GamepadMapping_t {
    @setEvalBranchQuota(100000);
    var existing: bool = undefined;
    _ = &existing;
    var mapping_string: [1024]u8 = undefined;
    _ = &mapping_string;
    var vendor: Uint16 = undefined;
    _ = &vendor;
    var product: Uint16 = undefined;
    _ = &product;
    var version: Uint16 = undefined;
    _ = &version;
    var map_nunchuck_left_side: bool = undefined;
    _ = &map_nunchuck_left_side;
    var face_style: Uint8 = undefined;
    _ = &face_style;
    var sub_product: Uint8 = undefined;
    _ = &sub_product;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&mapping_string)), "none,*,", @sizeOf(@TypeOf(mapping_string)));
                SDL_GetJoystickGUIDInfo_REAL(guid, &vendor, &product, &version, null);
                if (SDL_IsJoystickWheel(vendor, product, 0)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return null;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                if (((@as(c_int, vendor) == USB_VENDOR_NINTENDO) and (@as(c_int, product) == USB_PRODUCT_NINTENDO_GAMECUBE_ADAPTER)) or ((@as(c_int, vendor) == USB_VENDOR_DRAGONRISE) and (((@as(c_int, product) == USB_PRODUCT_EVORETRO_GAMECUBE_ADAPTER1) or (@as(c_int, product) == USB_PRODUCT_EVORETRO_GAMECUBE_ADAPTER2)) or (@as(c_int, product) == USB_PRODUCT_EVORETRO_GAMECUBE_ADAPTER3)))) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "a:b0,b:b2,dpdown:b6,dpleft:b4,dpright:b5,dpup:b7,lefttrigger:a4,leftx:a0,lefty:a1~,rightshoulder:b9,righttrigger:a5,rightx:a2,righty:a3~,start:b8,x:b1,y:b3,misc3:b11,misc4:b10,hint:!SDL_GAMECONTROLLER_USE_GAMECUBE_LABELS:=1,", @sizeOf(@TypeOf(mapping_string)));
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                if ((@as(c_int, vendor) == USB_VENDOR_NINTENDO) and (@as(c_int, product) == USB_PRODUCT_NINTENDO_SWITCH2_GAMECUBE_CONTROLLER)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            6 => {
                return SDL_PrivateAddMappingForGUID(guid, @ptrCast(@alignCast(&mapping_string)), &existing, SDL_GAMEPAD_MAPPING_PRIORITY_DEFAULT);
            },
            7 => {
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "a:b1,b:b3,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b4,leftshoulder:b6,lefttrigger:a4,leftx:a0,lefty:a1,rightshoulder:b7,righttrigger:a5,rightx:a2,righty:a3,start:b5,x:b0,y:b2,misc1:b8,misc2:b9,misc3:b10,misc4:b11,hint:!SDL_GAMECONTROLLER_USE_GAMECUBE_LABELS:=1,", @sizeOf(@TypeOf(mapping_string)));
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                if ((@as(c_int, vendor) == USB_VENDOR_NINTENDO) and (@as(c_int, product) == USB_PRODUCT_NINTENDO_SWITCH2_PRO)) {
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
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "a:b0,b:b1,back:b4,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b5,leftshoulder:b9,leftstick:b7,lefttrigger:a4,leftx:a0,lefty:a1,rightshoulder:b10,rightstick:b8,righttrigger:a5,rightx:a2,righty:a3,start:b6,x:b2,y:b3,misc1:b11,misc2:b12,paddle1:b13,paddle2:b14,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,", @sizeOf(@TypeOf(mapping_string)));
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                if ((@as(c_int, vendor) == USB_VENDOR_NINTENDO) and (@as(c_int, product) == USB_PRODUCT_NINTENDO_SWITCH2_JOYCON_LEFT)) {
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
                if (SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI_VERTICAL_JOY_CONS", @"false" != 0)) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            14 => {
                if ((@as(c_int, vendor) == USB_VENDOR_NINTENDO) and (@as(c_int, product) == USB_PRODUCT_NINTENDO_SWITCH2_JOYCON_RIGHT)) {
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
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "back:b4,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b9,leftstick:b7,lefttrigger:a4,leftx:a0,lefty:a1,misc1:b11,paddle2:b14,paddle4:b16,", @sizeOf(@TypeOf(mapping_string)));
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            17 => {
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "a:b1,b:b2,guide:b5,leftshoulder:b9,leftstick:b7,leftx:a0,lefty:a1,rightshoulder:b10,start:b6,x:b3,y:b0,paddle2:b14,paddle4:b16,", @sizeOf(@TypeOf(mapping_string)));
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
                if (SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI_VERTICAL_JOY_CONS", @"false" != 0)) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            20 => {
                if ((@as(c_int, vendor) == USB_VENDOR_NINTENDO) and (@as(c_int, product) == USB_PRODUCT_NINTENDO_SWITCH2_JOYCON_PAIR)) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
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
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "a:b0,b:b1,guide:b5,rightshoulder:b10,rightstick:b8,righttrigger:a5,rightx:a2,righty:a3,start:b6,x:b2,y:b3,misc2:b12,paddle1:b13,paddle3:b15,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,", @sizeOf(@TypeOf(mapping_string)));
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "a:b1,b:b3,guide:b5,leftshoulder:b9,leftstick:b7,leftx:a0,lefty:a1,rightshoulder:b10,start:b6,x:b0,y:b2,misc2:b12,paddle1:b13,paddle3:b15,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,", @sizeOf(@TypeOf(mapping_string)));
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
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "a:b0,b:b1,back:b4,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b5,leftshoulder:b9,leftstick:b7,lefttrigger:a4,leftx:a0,lefty:a1,rightshoulder:b10,rightstick:b8,righttrigger:a5,rightx:a2,righty:a3,start:b6,x:b2,y:b3,misc1:b11,misc2:b12,paddle1:b13,paddle2:b14,paddle3:b15,paddle4:b16,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,", @sizeOf(@TypeOf(mapping_string)));
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            26 => {
                if ((@as(c_int, vendor) == USB_VENDOR_NINTENDO) and (((((((((((@as(c_int, guid.data[@as(c_int, 15)]) == k_eSwitchDeviceInfoControllerType_HVCLeft) or (@as(c_int, guid.data[@as(c_int, 15)]) == k_eSwitchDeviceInfoControllerType_HVCRight)) or (@as(c_int, guid.data[@as(c_int, 15)]) == k_eSwitchDeviceInfoControllerType_NESLeft)) or (@as(c_int, guid.data[@as(c_int, 15)]) == k_eSwitchDeviceInfoControllerType_NESRight)) or (@as(c_int, guid.data[@as(c_int, 15)]) == k_eSwitchDeviceInfoControllerType_SNES)) or (@as(c_int, guid.data[@as(c_int, 15)]) == k_eSwitchDeviceInfoControllerType_N64)) or (@as(c_int, guid.data[@as(c_int, 15)]) == k_eSwitchDeviceInfoControllerType_SEGA_Genesis)) or (@as(c_int, guid.data[@as(c_int, 15)]) == k_eWiiExtensionControllerType_None)) or (@as(c_int, guid.data[@as(c_int, 15)]) == k_eWiiExtensionControllerType_Nunchuk)) or (@as(c_int, guid.data[@as(c_int, 15)]) == k_eSwitchDeviceInfoControllerType_JoyConLeft)) or (@as(c_int, guid.data[@as(c_int, 15)]) == k_eSwitchDeviceInfoControllerType_JoyConRight))) {
                    sdl_pc = 28;
                    continue;
                } else {
                    sdl_pc = 29;
                    continue;
                }
            },
            27 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            28 => {
                switch (@as(c_int, guid.data[@as(c_int, 15)])) {
                    k_eSwitchDeviceInfoControllerType_HVCLeft => {
                        sdl_pc = 32;
                        continue;
                    },
                    k_eSwitchDeviceInfoControllerType_HVCRight => {
                        sdl_pc = 33;
                        continue;
                    },
                    k_eSwitchDeviceInfoControllerType_NESLeft => {
                        sdl_pc = 34;
                        continue;
                    },
                    k_eSwitchDeviceInfoControllerType_NESRight => {
                        sdl_pc = 35;
                        continue;
                    },
                    k_eSwitchDeviceInfoControllerType_SNES => {
                        sdl_pc = 36;
                        continue;
                    },
                    k_eSwitchDeviceInfoControllerType_N64 => {
                        sdl_pc = 37;
                        continue;
                    },
                    k_eSwitchDeviceInfoControllerType_SEGA_Genesis => {
                        sdl_pc = 38;
                        continue;
                    },
                    k_eWiiExtensionControllerType_None => {
                        sdl_pc = 39;
                        continue;
                    },
                    k_eWiiExtensionControllerType_Nunchuk => {
                        sdl_pc = 40;
                        continue;
                    },
                    else => {
                        sdl_pc = 44;
                        continue;
                    },
                }
            },
            29 => {
                if ((@as(c_int, vendor) == USB_VENDOR_8BITDO) and (((((((@as(c_int, product) == USB_PRODUCT_8BITDO_SF30_PRO) or (@as(c_int, product) == USB_PRODUCT_8BITDO_SF30_PRO_BT)) or (@as(c_int, product) == USB_PRODUCT_8BITDO_SN30_PRO)) or (@as(c_int, product) == USB_PRODUCT_8BITDO_SN30_PRO_BT)) or (@as(c_int, product) == USB_PRODUCT_8BITDO_PRO_2)) or (@as(c_int, product) == USB_PRODUCT_8BITDO_PRO_2_BT)) or (@as(c_int, product) == USB_PRODUCT_8BITDO_PRO_3))) {
                    sdl_pc = 54;
                    continue;
                } else {
                    sdl_pc = 55;
                    continue;
                }
            },
            30 => {
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            31 => {
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            32 => {
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "a:b0,b:b1,back:b4,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b9,rightshoulder:b10,start:b6,", @sizeOf(@TypeOf(mapping_string)));
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            33 => {
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "a:b0,b:b1,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b9,rightshoulder:b10,", @sizeOf(@TypeOf(mapping_string)));
                {
                    sdl_pc = 31;
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
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "a:b0,b:b1,back:b4,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b9,rightshoulder:b10,start:b6,", @sizeOf(@TypeOf(mapping_string)));
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            36 => {
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "a:b0,b:b1,back:b4,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b9,lefttrigger:a4,rightshoulder:b10,righttrigger:a5,start:b6,x:b2,y:b3,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,", @sizeOf(@TypeOf(mapping_string)));
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            37 => {
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "a:b0,b:b1,back:b3,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b5,leftshoulder:b9,lefttrigger:a4,leftx:a0,lefty:a1,misc1:b11,misc2:b4,rightshoulder:b10,righttrigger:b7,start:b6,x:a5,y:b2,", @sizeOf(@TypeOf(mapping_string)));
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            38 => {
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "a:b0,b:b1,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b5,leftshoulder:b9,rightshoulder:b10,righttrigger:a5,start:b6,x:b2,y:b3,misc1:b11,", @sizeOf(@TypeOf(mapping_string)));
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            39 => {
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "a:b0,b:b1,back:b4,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b5,start:b6,x:b2,y:b3,", @sizeOf(@TypeOf(mapping_string)));
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            40 => {
                map_nunchuck_left_side = @"true" != 0;
                if (map_nunchuck_left_side) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            41 => {
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "a:b0,b:b1,back:b4,dpdown:b12,dpleft:b13,dpright:b14,dpup:b11,guide:b5,leftshoulder:b9,lefttrigger:a4,leftx:a0,lefty:a1,start:b6,x:b2,y:b3,", @sizeOf(@TypeOf(mapping_string)));
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            42 => {
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "a:b0,b:b1,back:b4,dpdown:b12,dpleft:b13,dpright:b14,dpup:b11,guide:b5,rightshoulder:b9,righttrigger:a4,rightx:a0,righty:a1,start:b6,x:b2,y:b3,", @sizeOf(@TypeOf(mapping_string)));
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            43 => {
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            44 => {
                if (SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI_VERTICAL_JOY_CONS", @"false" != 0)) {
                    sdl_pc = 45;
                    continue;
                } else {
                    sdl_pc = 46;
                    continue;
                }
            },
            45 => {
                if (@as(c_int, guid.data[@as(c_int, 15)]) == k_eSwitchDeviceInfoControllerType_JoyConLeft) {
                    sdl_pc = 48;
                    continue;
                } else {
                    sdl_pc = 49;
                    continue;
                }
            },
            46 => {
                if (@as(c_int, guid.data[@as(c_int, 15)]) == k_eSwitchDeviceInfoControllerType_JoyConLeft) {
                    sdl_pc = 51;
                    continue;
                } else {
                    sdl_pc = 52;
                    continue;
                }
            },
            47 => {
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            48 => {
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "back:b4,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b9,leftstick:b7,lefttrigger:a4,leftx:a0,lefty:a1,misc1:b11,paddle2:b13,paddle4:b15,", @sizeOf(@TypeOf(mapping_string)));
                {
                    sdl_pc = 50;
                    continue;
                }
            },
            49 => {
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "a:b0,b:b1,guide:b5,rightshoulder:b10,rightstick:b8,righttrigger:a5,rightx:a2,righty:a3,start:b6,x:b2,y:b3,paddle1:b12,paddle3:b14,", @sizeOf(@TypeOf(mapping_string)));
                {
                    sdl_pc = 50;
                    continue;
                }
            },
            50 => {
                {
                    sdl_pc = 47;
                    continue;
                }
            },
            51 => {
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "a:b0,b:b1,guide:b5,leftshoulder:b9,leftstick:b7,leftx:a0,lefty:a1,rightshoulder:b10,start:b6,x:b2,y:b3,paddle2:b13,paddle4:b15,", @sizeOf(@TypeOf(mapping_string)));
                {
                    sdl_pc = 53;
                    continue;
                }
            },
            52 => {
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "a:b0,b:b1,guide:b5,leftshoulder:b9,leftstick:b7,leftx:a0,lefty:a1,rightshoulder:b10,start:b6,x:b2,y:b3,paddle1:b12,paddle3:b14,", @sizeOf(@TypeOf(mapping_string)));
                {
                    sdl_pc = 53;
                    continue;
                }
            },
            53 => {
                {
                    sdl_pc = 47;
                    continue;
                }
            },
            54 => {
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "a:b1,b:b0,back:b4,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b5,leftshoulder:b9,leftstick:b7,lefttrigger:a4,leftx:a0,lefty:a1,rightshoulder:b10,rightstick:b8,righttrigger:a5,rightx:a2,righty:a3,start:b6,x:b3,y:b2,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,", @sizeOf(@TypeOf(mapping_string)));
                if ((@as(c_int, product) == USB_PRODUCT_8BITDO_PRO_2) or (@as(c_int, product) == USB_PRODUCT_8BITDO_PRO_2_BT)) {
                    sdl_pc = 57;
                    continue;
                } else {
                    sdl_pc = 58;
                    continue;
                }
            },
            55 => {
                if ((@as(c_int, vendor) == USB_VENDOR_8BITDO) and ((@as(c_int, product) == USB_PRODUCT_8BITDO_SF30_PRO) or (@as(c_int, product) == USB_PRODUCT_8BITDO_SF30_PRO_BT))) {
                    sdl_pc = 63;
                    continue;
                } else {
                    sdl_pc = 64;
                    continue;
                }
            },
            56 => {
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            57 => {
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "paddle1:b14,paddle2:b13,", @sizeOf(@TypeOf(mapping_string)));
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            58 => {
                if (@as(c_int, product) == USB_PRODUCT_8BITDO_PRO_3) {
                    sdl_pc = 60;
                    continue;
                } else {
                    sdl_pc = 61;
                    continue;
                }
            },
            59 => {
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            60 => {
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "paddle1:b12,paddle2:b11,paddle3:b14,paddle4:b13,", @sizeOf(@TypeOf(mapping_string)));
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            61 => {
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            62 => {
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            63 => {
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "a:b1,b:b0,back:b4,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftshoulder:b9,leftstick:b7,lefttrigger:a4,leftx:a0,lefty:a1,rightshoulder:b10,rightstick:b8,righttrigger:a5,rightx:a2,righty:a3,start:b6,x:b3,y:b2,hint:!SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1,", @sizeOf(@TypeOf(mapping_string)));
                {
                    sdl_pc = 65;
                    continue;
                }
            },
            64 => {
                if (SDL_IsJoystickSInputController(vendor, product)) {
                    sdl_pc = 66;
                    continue;
                } else {
                    sdl_pc = 67;
                    continue;
                }
            },
            65 => {
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            66 => {
                face_style = @bitCast(@as(i8, @truncate((@as(c_int, guid.data[@as(c_int, 15)]) & @as(c_int, 224)) >> @intCast(@as(c_int, 5)))));
                sub_product = @bitCast(@as(i8, @truncate(@as(c_int, guid.data[@as(c_int, 15)]) & @as(c_int, 31))));
                SDL_CreateMappingStringForSInputGamepad(vendor, product, sub_product, version, face_style, @ptrCast(@alignCast(&mapping_string)), @sizeOf(@TypeOf(mapping_string)));
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            67 => {
                if ((@as(c_int, vendor) == USB_VENDOR_MICROSOFT) and (@as(c_int, product) == USB_PRODUCT_XBOX360_BIGBUTTON_RECEIVER)) {
                    sdl_pc = 69;
                    continue;
                } else {
                    sdl_pc = 70;
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
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "dpup:h0.1,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,a:b0,b:b1,x:b2,y:b3,back:b4,guide:b5,start:b6,misc1:b7", @sizeOf(@TypeOf(mapping_string)));
                {
                    sdl_pc = 71;
                    continue;
                }
            },
            70 => {
                if (SDL_IsJoystickGameCube(vendor, product)) {
                    sdl_pc = 72;
                    continue;
                } else {
                    sdl_pc = 73;
                    continue;
                }
            },
            71 => {
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            72 => {
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "a:b0,b:b2,back:b4,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b5,leftshoulder:b9,leftstick:b7,lefttrigger:a4,leftx:a0,lefty:a1,rightshoulder:b10,rightstick:b8,righttrigger:a5,rightx:a2,righty:a3,start:b6,x:b1,y:b3,hint:!SDL_GAMECONTROLLER_USE_GAMECUBE_LABELS:=1,", @sizeOf(@TypeOf(mapping_string)));
                {
                    sdl_pc = 74;
                    continue;
                }
            },
            73 => {
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "a:b0,b:b1,back:b4,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b5,leftshoulder:b9,leftstick:b7,lefttrigger:a4,leftx:a0,lefty:a1,rightshoulder:b10,rightstick:b8,righttrigger:a5,rightx:a2,righty:a3,start:b6,x:b2,y:b3,", @sizeOf(@TypeOf(mapping_string)));
                {
                    sdl_pc = 74;
                    continue;
                }
            },
            74 => {
                if (SDL_IsJoystickSteamController(vendor, product)) {
                    sdl_pc = 75;
                    continue;
                } else {
                    sdl_pc = 76;
                    continue;
                }
            },
            75 => {
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "paddle1:b11,paddle2:b12,", @sizeOf(@TypeOf(mapping_string)));
                {
                    sdl_pc = 77;
                    continue;
                }
            },
            76 => {
                if (SDL_IsJoystickSteamDeck(vendor, product)) {
                    sdl_pc = 78;
                    continue;
                } else {
                    sdl_pc = 79;
                    continue;
                }
            },
            77 => {
                {
                    sdl_pc = 71;
                    continue;
                }
            },
            78 => {
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "misc1:b11,paddle1:b12,paddle2:b13,paddle3:b14,paddle4:b15,touchpad:b17,misc2:b16", @sizeOf(@TypeOf(mapping_string)));
                {
                    sdl_pc = 80;
                    continue;
                }
            },
            79 => {
                if (SDL_IsJoystickSteamTriton(vendor, product)) {
                    sdl_pc = 81;
                    continue;
                } else {
                    sdl_pc = 82;
                    continue;
                }
            },
            80 => {
                {
                    sdl_pc = 77;
                    continue;
                }
            },
            81 => {
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "misc1:b11,paddle1:b12,paddle2:b13,paddle3:b14,paddle4:b15,touchpad:b17,misc2:b16", @sizeOf(@TypeOf(mapping_string)));
                {
                    sdl_pc = 83;
                    continue;
                }
            },
            82 => {
                if (SDL_IsJoystickNintendoSwitchPro(vendor, product) or SDL_IsJoystickNintendoSwitchProInputOnly(vendor, product)) {
                    sdl_pc = 84;
                    continue;
                } else {
                    sdl_pc = 85;
                    continue;
                }
            },
            83 => {
                {
                    sdl_pc = 80;
                    continue;
                }
            },
            84 => {
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "misc1:b11,", @sizeOf(@TypeOf(mapping_string)));
                {
                    sdl_pc = 86;
                    continue;
                }
            },
            85 => {
                if (SDL_IsJoystickNintendoSwitch2Pro(vendor, product) or SDL_IsJoystickNintendoSwitch2ProInputOnly(vendor, product)) {
                    sdl_pc = 87;
                    continue;
                } else {
                    sdl_pc = 88;
                    continue;
                }
            },
            86 => {
                {
                    sdl_pc = 83;
                    continue;
                }
            },
            87 => {
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "misc1:b11,misc2:b12", @sizeOf(@TypeOf(mapping_string)));
                {
                    sdl_pc = 89;
                    continue;
                }
            },
            88 => {
                if (SDL_IsJoystickNintendoSwitchJoyConPair(vendor, product)) {
                    sdl_pc = 90;
                    continue;
                } else {
                    sdl_pc = 91;
                    continue;
                }
            },
            89 => {
                {
                    sdl_pc = 86;
                    continue;
                }
            },
            90 => {
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "misc1:b11,paddle1:b12,paddle2:b13,paddle3:b14,paddle4:b15,", @sizeOf(@TypeOf(mapping_string)));
                {
                    sdl_pc = 92;
                    continue;
                }
            },
            91 => {
                if (SDL_IsJoystickAmazonLunaController(vendor, product)) {
                    sdl_pc = 93;
                    continue;
                } else {
                    sdl_pc = 94;
                    continue;
                }
            },
            92 => {
                {
                    sdl_pc = 89;
                    continue;
                }
            },
            93 => {
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "misc1:b11,", @sizeOf(@TypeOf(mapping_string)));
                {
                    sdl_pc = 95;
                    continue;
                }
            },
            94 => {
                if (SDL_IsJoystickGoogleStadiaController(vendor, product)) {
                    sdl_pc = 96;
                    continue;
                } else {
                    sdl_pc = 97;
                    continue;
                }
            },
            95 => {
                {
                    sdl_pc = 92;
                    continue;
                }
            },
            96 => {
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "misc1:b11,misc2:b12,", @sizeOf(@TypeOf(mapping_string)));
                {
                    sdl_pc = 98;
                    continue;
                }
            },
            97 => {
                if (SDL_IsJoystickNVIDIASHIELDController(vendor, product)) {
                    sdl_pc = 99;
                    continue;
                } else {
                    sdl_pc = 100;
                    continue;
                }
            },
            98 => {
                {
                    sdl_pc = 95;
                    continue;
                }
            },
            99 => {
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "misc1:b11,", @sizeOf(@TypeOf(mapping_string)));
                if (@as(c_int, product) == USB_PRODUCT_NVIDIA_SHIELD_CONTROLLER_V103) {
                    sdl_pc = 102;
                    continue;
                } else {
                    sdl_pc = 103;
                    continue;
                }
            },
            100 => {
                if (SDL_IsJoystickHoriSteamController(vendor, product)) {
                    sdl_pc = 105;
                    continue;
                } else {
                    sdl_pc = 106;
                    continue;
                }
            },
            101 => {
                {
                    sdl_pc = 98;
                    continue;
                }
            },
            102 => {
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "touchpad:b12,misc2:b13,misc3:b14,", @sizeOf(@TypeOf(mapping_string)));
                {
                    sdl_pc = 104;
                    continue;
                }
            },
            103 => {
                {
                    sdl_pc = 104;
                    continue;
                }
            },
            104 => {
                {
                    sdl_pc = 101;
                    continue;
                }
            },
            105 => {
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "paddle1:b13,paddle2:b12,paddle3:b15,paddle4:b14,misc1:b11", @sizeOf(@TypeOf(mapping_string)));
                {
                    sdl_pc = 107;
                    continue;
                }
            },
            106 => {
                if (SDL_IsJoystickFlydigiController(vendor, product)) {
                    sdl_pc = 108;
                    continue;
                } else {
                    sdl_pc = 109;
                    continue;
                }
            },
            107 => {
                {
                    sdl_pc = 101;
                    continue;
                }
            },
            108 => {
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "paddle1:b11,paddle2:b12,paddle3:b13,paddle4:b14,", @sizeOf(@TypeOf(mapping_string)));
                if (@as(c_int, guid.data[@as(c_int, 15)]) >= SDL_FLYDIGI_VADER2) {
                    sdl_pc = 111;
                    continue;
                } else {
                    sdl_pc = 112;
                    continue;
                }
            },
            109 => {
                if (SDL_IsJoystickGameSirController(vendor, product) and (@as(c_int, guid.data[@as(c_int, 0)]) == SDL_HARDWARE_BUS_USB)) {
                    sdl_pc = 120;
                    continue;
                } else {
                    sdl_pc = 121;
                    continue;
                }
            },
            110 => {
                {
                    sdl_pc = 107;
                    continue;
                }
            },
            111 => {
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "misc2:b15,misc3:b16,", @sizeOf(@TypeOf(mapping_string)));
                if (@as(c_int, guid.data[@as(c_int, 15)]) == SDL_FLYDIGI_VADER5_PRO) {
                    sdl_pc = 114;
                    continue;
                } else {
                    sdl_pc = 115;
                    continue;
                }
            },
            112 => {
                if ((@as(c_int, guid.data[@as(c_int, 15)]) == SDL_FLYDIGI_APEX5) or (@as(c_int, guid.data[@as(c_int, 15)]) == SDL_FLYDIGI_APEX6)) {
                    sdl_pc = 117;
                    continue;
                } else {
                    sdl_pc = 118;
                    continue;
                }
            },
            113 => {
                {
                    sdl_pc = 110;
                    continue;
                }
            },
            114 => {
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "misc4:b17,misc5:b18,misc6:b19", @sizeOf(@TypeOf(mapping_string)));
                {
                    sdl_pc = 116;
                    continue;
                }
            },
            115 => {
                {
                    sdl_pc = 116;
                    continue;
                }
            },
            116 => {
                {
                    sdl_pc = 113;
                    continue;
                }
            },
            117 => {
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "misc2:b15,misc3:b16,", @sizeOf(@TypeOf(mapping_string)));
                {
                    sdl_pc = 119;
                    continue;
                }
            },
            118 => {
                {
                    sdl_pc = 119;
                    continue;
                }
            },
            119 => {
                {
                    sdl_pc = 113;
                    continue;
                }
            },
            120 => {
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "misc1:b11,paddle1:b13,paddle2:b12,paddle3:b15,paddle4:b14,", @sizeOf(@TypeOf(mapping_string)));
                if (@as(c_int, product) == USB_PRODUCT_GAMESIR_GAMEPAD_TARANTULA_8K) {
                    sdl_pc = 123;
                    continue;
                } else {
                    sdl_pc = 124;
                    continue;
                }
            },
            121 => {
                if ((@as(c_int, vendor) == USB_VENDOR_8BITDO) and (@as(c_int, product) == USB_PRODUCT_8BITDO_ULTIMATE2_WIRELESS)) {
                    sdl_pc = 126;
                    continue;
                } else {
                    sdl_pc = 127;
                    continue;
                }
            },
            122 => {
                {
                    sdl_pc = 110;
                    continue;
                }
            },
            123 => {
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "misc2:b16,misc3:b17,misc4:b18,misc5:b19,misc6:b20,", @sizeOf(@TypeOf(mapping_string)));
                {
                    sdl_pc = 125;
                    continue;
                }
            },
            124 => {
                {
                    sdl_pc = 125;
                    continue;
                }
            },
            125 => {
                {
                    sdl_pc = 122;
                    continue;
                }
            },
            126 => {
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "paddle1:b12,paddle2:b11,paddle3:b14,paddle4:b13,", @sizeOf(@TypeOf(mapping_string)));
                {
                    sdl_pc = 128;
                    continue;
                }
            },
            127 => {
                if ((@as(c_int, vendor) == USB_VENDOR_8BITDO) and (@as(c_int, product) == USB_PRODUCT_8BITDO_ULTIMATE2C_WIRELESS)) {
                    sdl_pc = 129;
                    continue;
                } else {
                    sdl_pc = 130;
                    continue;
                }
            },
            128 => {
                {
                    sdl_pc = 122;
                    continue;
                }
            },
            129 => {
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "paddle1:b12,paddle2:b11,", @sizeOf(@TypeOf(mapping_string)));
                {
                    sdl_pc = 131;
                    continue;
                }
            },
            130 => {
                switch (SDL_GetGamepadTypeFromGUID(guid, null)) {
                    @as(SDL_GamepadType, SDL_GAMEPAD_TYPE_PS4) => {
                        sdl_pc = 133;
                        continue;
                    },
                    @as(SDL_GamepadType, SDL_GAMEPAD_TYPE_PS5) => {
                        sdl_pc = 134;
                        continue;
                    },
                    @as(SDL_GamepadType, SDL_GAMEPAD_TYPE_XBOXONE) => {
                        sdl_pc = 138;
                        continue;
                    },
                    else => {
                        sdl_pc = 145;
                        continue;
                    },
                }
            },
            131 => {
                {
                    sdl_pc = 128;
                    continue;
                }
            },
            132 => {
                {
                    sdl_pc = 131;
                    continue;
                }
            },
            133 => {
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "touchpad:b11,", @sizeOf(@TypeOf(mapping_string)));
                {
                    sdl_pc = 132;
                    continue;
                }
            },
            134 => {
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "touchpad:b11,misc1:b12,", @sizeOf(@TypeOf(mapping_string)));
                if (SDL_IsJoystickDualSenseEdge(vendor, product)) {
                    sdl_pc = 135;
                    continue;
                } else {
                    sdl_pc = 136;
                    continue;
                }
            },
            135 => {
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "paddle1:b16,paddle2:b15,paddle3:b14,paddle4:b13,", @sizeOf(@TypeOf(mapping_string)));
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
                {
                    sdl_pc = 132;
                    continue;
                }
            },
            138 => {
                if (SDL_IsJoystickXboxOneElite(vendor, product)) {
                    sdl_pc = 139;
                    continue;
                } else {
                    sdl_pc = 140;
                    continue;
                }
            },
            139 => {
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "paddle1:b11,paddle2:b13,paddle3:b12,paddle4:b14,", @sizeOf(@TypeOf(mapping_string)));
                {
                    sdl_pc = 141;
                    continue;
                }
            },
            140 => {
                if (SDL_IsJoystickXboxSeriesX(vendor, product)) {
                    sdl_pc = 142;
                    continue;
                } else {
                    sdl_pc = 143;
                    continue;
                }
            },
            141 => {
                {
                    sdl_pc = 132;
                    continue;
                }
            },
            142 => {
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "misc1:b11,", @sizeOf(@TypeOf(mapping_string)));
                {
                    sdl_pc = 144;
                    continue;
                }
            },
            143 => {
                {
                    sdl_pc = 144;
                    continue;
                }
            },
            144 => {
                {
                    sdl_pc = 141;
                    continue;
                }
            },
            145 => {
                if ((@as(c_int, vendor) == @as(c_int, 0)) and (@as(c_int, product) == @as(c_int, 0))) {
                    sdl_pc = 146;
                    continue;
                } else {
                    sdl_pc = 147;
                    continue;
                }
            },
            146 => {
                _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "misc1:b11,", @sizeOf(@TypeOf(mapping_string)));
                {
                    sdl_pc = 148;
                    continue;
                }
            },
            147 => {
                {
                    sdl_pc = 148;
                    continue;
                }
            },
            148 => {
                {
                    sdl_pc = 132;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn SDL_CreateMappingForRAWINPUTGamepad(guid: SDL_GUID) callconv(.c) [*c]GamepadMapping_t {
    @setEvalBranchQuota(100000);
    var existing: bool = undefined;
    _ = &existing;
    var mapping_string: [1024]u8 = undefined;
    _ = &mapping_string;
    _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&mapping_string)), "none,*,", @sizeOf(@TypeOf(mapping_string)));
    _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "a:b0,b:b1,x:b2,y:b3,back:b6,guide:b10,start:b7,leftstick:b8,rightstick:b9,leftshoulder:b4,rightshoulder:b5,dpup:h0.1,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,leftx:a0,lefty:a1,rightx:a2,righty:a3,lefttrigger:a4,righttrigger:a5,", @sizeOf(@TypeOf(mapping_string)));
    return SDL_PrivateAddMappingForGUID(guid, @ptrCast(@alignCast(&mapping_string)), &existing, SDL_GAMEPAD_MAPPING_PRIORITY_DEFAULT);
}
pub fn SDL_CreateMappingForWGIGamepad(guid: SDL_GUID) callconv(.c) [*c]GamepadMapping_t {
    @setEvalBranchQuota(100000);
    var existing: bool = undefined;
    _ = &existing;
    var mapping_string: [1024]u8 = undefined;
    _ = &mapping_string;
    if (@as(c_int, guid.data[@as(c_int, 15)]) != SDL_JOYSTICK_TYPE_GAMEPAD) {
        return null;
    }
    _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&mapping_string)), "none,*,", @sizeOf(@TypeOf(mapping_string)));
    _ = SDL_strlcat_REAL(@ptrCast(@alignCast(&mapping_string)), "a:b0,b:b1,x:b2,y:b3,back:b6,start:b7,leftstick:b8,rightstick:b9,leftshoulder:b4,rightshoulder:b5,dpup:b10,dpdown:b12,dpleft:b13,dpright:b11,leftx:a1,lefty:a0~,rightx:a3,righty:a2~,lefttrigger:a4,righttrigger:a5,", @sizeOf(@TypeOf(mapping_string)));
    return SDL_PrivateAddMappingForGUID(guid, @ptrCast(@alignCast(&mapping_string)), &existing, SDL_GAMEPAD_MAPPING_PRIORITY_DEFAULT);
}
pub fn SDL_PrivateMatchGamepadMappingForGUID(arg_guid: SDL_GUID, match_version: bool, exact_match_crc: bool) callconv(.c) [*c]GamepadMapping_t {
    @setEvalBranchQuota(100000);
    var guid = arg_guid;
    _ = &guid;
    var mapping: [*c]GamepadMapping_t = undefined;
    _ = &mapping;
    var best_match: [*c]GamepadMapping_t = null;
    _ = &best_match;
    var crc: Uint16 = 0;
    _ = &crc;
    SDL_AssertJoysticksLocked();
    SDL_GetJoystickGUIDInfo_REAL(guid, null, null, null, &crc);
    SDL_SetJoystickGUIDCRC(&guid, 0);
    if (!match_version) {
        SDL_SetJoystickGUIDVersion(&guid, 0);
    }
    {
        mapping = s_pSupportedGamepads;
        while (mapping != null) : (mapping = mapping.*.next) {
            var mapping_guid: SDL_GUID = undefined;
            _ = &mapping_guid;
            if (SDL_memcmp_REAL(@ptrCast(@alignCast(&mapping.*.guid)), @ptrCast(@alignCast(&s_zeroGUID)), @sizeOf(@TypeOf(mapping.*.guid))) == @as(c_int, 0)) {
                continue;
            }
            _ = memcpy(@ptrCast(@alignCast(&mapping_guid)), @ptrCast(@alignCast(&mapping.*.guid)), @sizeOf(@TypeOf(mapping_guid)));
            if (!match_version) {
                SDL_SetJoystickGUIDVersion(&mapping_guid, 0);
            }
            if (SDL_memcmp_REAL(@ptrCast(@alignCast(&guid)), @ptrCast(@alignCast(&mapping_guid)), @sizeOf(@TypeOf(guid))) == @as(c_int, 0)) {
                var crc_string: [*c]const u8 = SDL_strstr_REAL(mapping.*.mapping, "crc:");
                _ = &crc_string;
                if (crc_string != null) {
                    var mapping_crc: Uint16 = @bitCast(@as(c_short, @truncate(SDL_strtol_REAL(crc_string + @as(usize, @bitCast(@as(isize, @intCast(SDL_GAMEPAD_CRC_FIELD_SIZE)))), null, 16))));
                    _ = &mapping_crc;
                    if (@as(c_int, mapping_crc) != @as(c_int, crc)) {
                        continue;
                    }
                    return mapping;
                } else if ((@as(c_int, crc) != 0) and exact_match_crc) {
                    continue;
                }
                if (!(best_match != null)) {
                    best_match = mapping;
                }
            }
        }
    }
    return best_match;
}
pub fn SDL_PrivateGetGamepadMappingForGUID(guid: SDL_GUID, adding_mapping: bool) callconv(.c) [*c]GamepadMapping_t {
    @setEvalBranchQuota(100000);
    var mapping: [*c]GamepadMapping_t = undefined;
    _ = &mapping;
    mapping = SDL_PrivateMatchGamepadMappingForGUID(guid, @"true" != 0, @"true" != 0);
    if (mapping != null) {
        return mapping;
    }
    if (adding_mapping) {
        return null;
    }
    mapping = SDL_PrivateMatchGamepadMappingForGUID(guid, @"true" != 0, @"false" != 0);
    if (mapping != null) {
        return mapping;
    }
    if (SDL_JoystickGUIDUsesVersion(guid)) {
        mapping = SDL_PrivateMatchGamepadMappingForGUID(guid, @"false" != 0, @"true" != 0);
        if (mapping != null) {
            return mapping;
        }
        mapping = SDL_PrivateMatchGamepadMappingForGUID(guid, @"false" != 0, @"false" != 0);
        if (mapping != null) {
            return mapping;
        }
    }
    if (SDL_IsJoystickHIDAPI(guid)) {
        mapping = SDL_CreateMappingForHIDAPIGamepad(guid);
    } else if (SDL_IsJoystickRAWINPUT(guid)) {
        mapping = SDL_CreateMappingForRAWINPUTGamepad(guid);
    } else if (SDL_IsJoystickWGI(guid)) {
        mapping = SDL_CreateMappingForWGIGamepad(guid);
    } else if (SDL_IsJoystickVIRTUAL(guid)) {}
    return mapping;
}
pub var map_StringForGamepadType: [13][*c]const u8 = [13][*c]const u8{
    "unknown",
    "standard",
    "xbox360",
    "xboxone",
    "ps3",
    "ps4",
    "ps5",
    "switchpro",
    "joyconleft",
    "joyconright",
    "joyconpair",
    "gamecube",
    "steam",
};
comptime {
    if (!((@sizeOf(@TypeOf(map_StringForGamepadType)) / @sizeOf(@TypeOf(map_StringForGamepadType[@as(c_int, 0)]))) == @as(c_ulong, SDL_GAMEPAD_TYPE_COUNT))) @compileError("static assertion failed \"SDL_arraysize(map_StringForGamepadType) == SDL_GAMEPAD_TYPE_COUNT\"");
}
pub export fn SDL_GetGamepadTypeFromString_REAL(arg_str: [*c]const u8) SDL_GamepadType {
    @setEvalBranchQuota(100000);
    var str = arg_str;
    _ = &str;
    var i: c_int = undefined;
    _ = &i;
    if (!(str != null) or (@as(c_int, str[@as(c_int, 0)]) == @as(c_int, '\x00'))) {
        return SDL_GAMEPAD_TYPE_UNKNOWN;
    }
    if ((@as(c_int, str.*) == @as(c_int, '+')) or (@as(c_int, str.*) == @as(c_int, '-'))) {
        str += 1;
    }
    {
        i = 0;
        while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(map_StringForGamepadType)) / @sizeOf(@TypeOf(map_StringForGamepadType[@as(c_int, 0)])))) : (i += 1) {
            if (SDL_strcasecmp_REAL(str, map_StringForGamepadType[@bitCast(@as(isize, @intCast(i)))]) == @as(c_int, 0)) {
                return @bitCast(i);
            }
        }
    }
    return SDL_GAMEPAD_TYPE_UNKNOWN;
}
pub export fn SDL_GetGamepadStringForType_REAL(arg_type: SDL_GamepadType) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    if ((@"type" >= @as(SDL_GamepadType, SDL_GAMEPAD_TYPE_STANDARD)) and (@"type" < @as(SDL_GamepadType, SDL_GAMEPAD_TYPE_COUNT))) {
        return map_StringForGamepadType[@"type"];
    }
    return null;
}
pub var map_StringForGamepadAxis: [6][*c]const u8 = [6][*c]const u8{
    "leftx",
    "lefty",
    "rightx",
    "righty",
    "lefttrigger",
    "righttrigger",
};
comptime {
    if (!((@sizeOf(@TypeOf(map_StringForGamepadAxis)) / @sizeOf(@TypeOf(map_StringForGamepadAxis[@as(c_int, 0)]))) == @as(c_ulong, SDL_GAMEPAD_AXIS_COUNT))) @compileError("static assertion failed \"SDL_arraysize(map_StringForGamepadAxis) == SDL_GAMEPAD_AXIS_COUNT\"");
}
pub export fn SDL_GetGamepadAxisFromString_REAL(arg_str: [*c]const u8) SDL_GamepadAxis {
    @setEvalBranchQuota(100000);
    var str = arg_str;
    _ = &str;
    var i: c_int = undefined;
    _ = &i;
    if (!(str != null) or (@as(c_int, str[@as(c_int, 0)]) == @as(c_int, '\x00'))) {
        return SDL_GAMEPAD_AXIS_INVALID;
    }
    if ((@as(c_int, str.*) == @as(c_int, '+')) or (@as(c_int, str.*) == @as(c_int, '-'))) {
        str += 1;
    }
    {
        i = 0;
        while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(map_StringForGamepadAxis)) / @sizeOf(@TypeOf(map_StringForGamepadAxis[@as(c_int, 0)])))) : (i += 1) {
            if (SDL_strcasecmp_REAL(str, map_StringForGamepadAxis[@bitCast(@as(isize, @intCast(i)))]) == @as(c_int, 0)) {
                return i;
            }
        }
    }
    return SDL_GAMEPAD_AXIS_INVALID;
}
pub export fn SDL_GetGamepadStringForAxis_REAL(axis: SDL_GamepadAxis) [*c]const u8 {
    @setEvalBranchQuota(100000);
    if ((axis > SDL_GAMEPAD_AXIS_INVALID) and (axis < SDL_GAMEPAD_AXIS_COUNT)) {
        return map_StringForGamepadAxis[@bitCast(@as(isize, @intCast(axis)))];
    }
    return null;
}
pub var map_StringForGamepadButton: [26][*c]const u8 = [26][*c]const u8{
    "a",
    "b",
    "x",
    "y",
    "back",
    "guide",
    "start",
    "leftstick",
    "rightstick",
    "leftshoulder",
    "rightshoulder",
    "dpup",
    "dpdown",
    "dpleft",
    "dpright",
    "misc1",
    "paddle1",
    "paddle2",
    "paddle3",
    "paddle4",
    "touchpad",
    "misc2",
    "misc3",
    "misc4",
    "misc5",
    "misc6",
};
comptime {
    if (!((@sizeOf(@TypeOf(map_StringForGamepadButton)) / @sizeOf(@TypeOf(map_StringForGamepadButton[@as(c_int, 0)]))) == @as(c_ulong, SDL_GAMEPAD_BUTTON_COUNT))) @compileError("static assertion failed \"SDL_arraysize(map_StringForGamepadButton) == SDL_GAMEPAD_BUTTON_COUNT\"");
}
pub fn SDL_PrivateGetGamepadButtonFromString(str: [*c]const u8, axby: bool, baxy: bool) callconv(.c) SDL_GamepadButton {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (!(str != null) or (@as(c_int, str[@as(c_int, 0)]) == @as(c_int, '\x00'))) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return SDL_GAMEPAD_BUTTON_INVALID;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                i = 0;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                if (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(map_StringForGamepadButton)) / @sizeOf(@TypeOf(map_StringForGamepadButton[@as(c_int, 0)])))) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 7;
                    continue;
                }
            },
            5 => {
                if (SDL_strcasecmp_REAL(str, map_StringForGamepadButton[@bitCast(@as(isize, @intCast(i)))]) == @as(c_int, 0)) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            6 => {
                i += 1;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            7 => {
                return SDL_GAMEPAD_BUTTON_INVALID;
            },
            8 => {
                if (axby) {
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
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            11 => {
                switch (i) {
                    SDL_GAMEPAD_BUTTON_EAST => {
                        sdl_pc = 15;
                        continue;
                    },
                    SDL_GAMEPAD_BUTTON_WEST => {
                        sdl_pc = 16;
                        continue;
                    },
                    else => {
                        sdl_pc = 17;
                        continue;
                    },
                }
            },
            12 => {
                if (baxy) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            13 => {
                return i;
            },
            14 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            15 => {
                return SDL_GAMEPAD_BUTTON_WEST;
            },
            16 => {
                return SDL_GAMEPAD_BUTTON_EAST;
            },
            17 => {
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            18 => {
                switch (i) {
                    SDL_GAMEPAD_BUTTON_SOUTH => {
                        sdl_pc = 22;
                        continue;
                    },
                    SDL_GAMEPAD_BUTTON_EAST => {
                        sdl_pc = 23;
                        continue;
                    },
                    SDL_GAMEPAD_BUTTON_WEST => {
                        sdl_pc = 24;
                        continue;
                    },
                    SDL_GAMEPAD_BUTTON_NORTH => {
                        sdl_pc = 25;
                        continue;
                    },
                    else => {
                        sdl_pc = 26;
                        continue;
                    },
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
                    sdl_pc = 13;
                    continue;
                }
            },
            21 => {
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            22 => {
                return SDL_GAMEPAD_BUTTON_EAST;
            },
            23 => {
                return SDL_GAMEPAD_BUTTON_SOUTH;
            },
            24 => {
                return SDL_GAMEPAD_BUTTON_NORTH;
            },
            25 => {
                return SDL_GAMEPAD_BUTTON_WEST;
            },
            26 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_GetGamepadButtonFromString_REAL(str: [*c]const u8) SDL_GamepadButton {
    @setEvalBranchQuota(100000);
    return SDL_PrivateGetGamepadButtonFromString(str, @"false" != 0, @"false" != 0);
}
pub export fn SDL_GetGamepadStringForButton_REAL(button: SDL_GamepadButton) [*c]const u8 {
    @setEvalBranchQuota(100000);
    if ((button > SDL_GAMEPAD_BUTTON_INVALID) and (button < SDL_GAMEPAD_BUTTON_COUNT)) {
        return map_StringForGamepadButton[@bitCast(@as(isize, @intCast(button)))];
    }
    return null;
}
pub fn SDL_PrivateParseGamepadElement(gamepad: [*c]SDL_Gamepad, arg_szGameButton: [*c]const u8, arg_szJoystickButton: [*c]const u8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var szGameButton = arg_szGameButton;
    _ = &szGameButton;
    var szJoystickButton = arg_szJoystickButton;
    _ = &szJoystickButton;
    var bind: SDL_GamepadBinding = undefined;
    _ = &bind;
    var button: SDL_GamepadButton = undefined;
    _ = &button;
    var axis: SDL_GamepadAxis = undefined;
    _ = &axis;
    var invert_input: bool = @"false" != 0;
    _ = &invert_input;
    var half_axis_input: u8 = 0;
    _ = &half_axis_input;
    var half_axis_output: u8 = 0;
    _ = &half_axis_output;
    var i: c_int = undefined;
    _ = &i;
    var new_bindings: [*c]SDL_GamepadBinding = undefined;
    _ = &new_bindings;
    var axby_mapping: bool = @"false" != 0;
    _ = &axby_mapping;
    var baxy_mapping: bool = @"false" != 0;
    _ = &baxy_mapping;
    SDL_AssertJoysticksLocked();
    _ = memset(@ptrCast(@alignCast(&bind)), 0, @sizeOf(@TypeOf(bind)));
    if ((@as(c_int, szGameButton.*) == @as(c_int, '+')) or (@as(c_int, szGameButton.*) == @as(c_int, '-'))) {
        half_axis_output = (blk: {
            const ref = &szGameButton;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        }).*;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(SDL_strstr_REAL(gamepad.*.mapping.*.mapping, ",hint:SDL_GAMECONTROLLER_USE_GAMECUBE_LABELS:=1")))) != @as(?*anyopaque, null)) {
        axby_mapping = @"true" != 0;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(SDL_strstr_REAL(gamepad.*.mapping.*.mapping, ",hint:SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1")))) != @as(?*anyopaque, null)) {
        baxy_mapping = @"true" != 0;
    }
    axis = SDL_GetGamepadAxisFromString_REAL(szGameButton);
    button = SDL_PrivateGetGamepadButtonFromString(szGameButton, axby_mapping, baxy_mapping);
    if (axis != SDL_GAMEPAD_AXIS_INVALID) {
        bind.output_type = SDL_GAMEPAD_BINDTYPE_AXIS;
        bind.output.axis.axis = axis;
        if ((axis == SDL_GAMEPAD_AXIS_LEFT_TRIGGER) or (axis == SDL_GAMEPAD_AXIS_RIGHT_TRIGGER)) {
            bind.output.axis.axis_min = 0;
            bind.output.axis.axis_max = SDL_JOYSTICK_AXIS_MAX;
        } else {
            if (@as(c_int, half_axis_output) == @as(c_int, '+')) {
                bind.output.axis.axis_min = 0;
                bind.output.axis.axis_max = SDL_JOYSTICK_AXIS_MAX;
            } else if (@as(c_int, half_axis_output) == @as(c_int, '-')) {
                bind.output.axis.axis_min = 0;
                bind.output.axis.axis_max = -@as(c_int, 32768);
            } else {
                bind.output.axis.axis_min = -@as(c_int, 32768);
                bind.output.axis.axis_max = SDL_JOYSTICK_AXIS_MAX;
            }
        }
    } else if (button != SDL_GAMEPAD_BUTTON_INVALID) {
        bind.output_type = SDL_GAMEPAD_BINDTYPE_BUTTON;
        bind.output.button = button;
    } else {
        return @"false" != 0;
    }
    if ((@as(c_int, szJoystickButton.*) == @as(c_int, '+')) or (@as(c_int, szJoystickButton.*) == @as(c_int, '-'))) {
        half_axis_input = (blk: {
            const ref = &szJoystickButton;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        }).*;
    }
    if (@as(c_int, szJoystickButton[SDL_strlen_REAL(szJoystickButton) -% @as(usize, 1)]) == @as(c_int, '~')) {
        invert_input = @"true" != 0;
    }
    if ((@as(c_int, szJoystickButton[@as(c_int, 0)]) == @as(c_int, 'a')) and (SDL_isdigit_REAL(@as(u8, szJoystickButton[@as(c_int, 1)])) != 0)) {
        bind.input_type = SDL_GAMEPAD_BINDTYPE_AXIS;
        bind.input.axis.axis = SDL_atoi_REAL(&szJoystickButton[@as(c_int, 1)]);
        if (@as(c_int, half_axis_input) == @as(c_int, '+')) {
            bind.input.axis.axis_min = 0;
            bind.input.axis.axis_max = SDL_JOYSTICK_AXIS_MAX;
        } else if (@as(c_int, half_axis_input) == @as(c_int, '-')) {
            bind.input.axis.axis_min = 0;
            bind.input.axis.axis_max = -@as(c_int, 32768);
        } else {
            bind.input.axis.axis_min = -@as(c_int, 32768);
            bind.input.axis.axis_max = SDL_JOYSTICK_AXIS_MAX;
        }
        if (invert_input) {
            var tmp: c_int = bind.input.axis.axis_min;
            _ = &tmp;
            bind.input.axis.axis_min = bind.input.axis.axis_max;
            bind.input.axis.axis_max = tmp;
        }
    } else if ((@as(c_int, szJoystickButton[@as(c_int, 0)]) == @as(c_int, 'b')) and (SDL_isdigit_REAL(@as(u8, szJoystickButton[@as(c_int, 1)])) != 0)) {
        bind.input_type = SDL_GAMEPAD_BINDTYPE_BUTTON;
        bind.input.button = SDL_atoi_REAL(&szJoystickButton[@as(c_int, 1)]);
    } else if ((((@as(c_int, szJoystickButton[@as(c_int, 0)]) == @as(c_int, 'h')) and (SDL_isdigit_REAL(@as(u8, szJoystickButton[@as(c_int, 1)])) != 0)) and (@as(c_int, szJoystickButton[@as(c_int, 2)]) == @as(c_int, '.'))) and (SDL_isdigit_REAL(@as(u8, szJoystickButton[@as(c_int, 3)])) != 0)) {
        var hat: c_int = SDL_atoi_REAL(&szJoystickButton[@as(c_int, 1)]);
        _ = &hat;
        var mask: c_int = SDL_atoi_REAL(&szJoystickButton[@as(c_int, 3)]);
        _ = &mask;
        bind.input_type = SDL_GAMEPAD_BINDTYPE_HAT;
        bind.input.hat.hat = hat;
        bind.input.hat.hat_mask = mask;
    } else {
        return @"false" != 0;
    }
    {
        i = 0;
        while (i < gamepad.*.num_bindings) : (i += 1) {
            if (SDL_memcmp_REAL(@ptrCast(@alignCast(&gamepad.*.bindings[@bitCast(@as(isize, @intCast(i)))])), @ptrCast(@alignCast(&bind)), @sizeOf(@TypeOf(bind))) == @as(c_int, 0)) {
                return @"true" != 0;
            }
        }
    }
    gamepad.*.num_bindings += 1;
    new_bindings = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(gamepad.*.bindings)), @as(c_ulong, @bitCast(@as(c_long, gamepad.*.num_bindings))) *% @sizeOf(@TypeOf(gamepad.*.bindings.*)))));
    if (!(new_bindings != null)) {
        SDL_free_REAL(@ptrCast(@alignCast(gamepad.*.bindings)));
        gamepad.*.num_bindings = 0;
        gamepad.*.bindings = null;
        return @"false" != 0;
    }
    gamepad.*.bindings = new_bindings;
    gamepad.*.bindings[@bitCast(@as(isize, @intCast(gamepad.*.num_bindings - @as(c_int, 1))))] = bind;
    return @"true" != 0;
}
pub fn SDL_PrivateParseGamepadConfigString(gamepad: [*c]SDL_Gamepad, pchString: [*c]const u8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var szGameButton: [20]u8 = undefined;
    _ = &szGameButton;
    var szJoystickButton: [128]u8 = undefined;
    _ = &szJoystickButton;
    var bGameButton: bool = @"true" != 0;
    _ = &bGameButton;
    var i: c_int = 0;
    _ = &i;
    var pchPos: [*c]const u8 = pchString;
    _ = &pchPos;
    _ = memset(@ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&szGameButton))))), 0, @sizeOf(@TypeOf(szGameButton)));
    _ = memset(@ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&szJoystickButton))))), 0, @sizeOf(@TypeOf(szJoystickButton)));
    while ((pchPos != null) and (@as(c_int, pchPos.*) != 0)) {
        if (@as(c_int, pchPos.*) == @as(c_int, ':')) {
            i = 0;
            bGameButton = @"false" != 0;
        } else if (@as(c_int, pchPos.*) == @as(c_int, ' ')) {} else if (@as(c_int, pchPos.*) == @as(c_int, ',')) {
            i = 0;
            bGameButton = @"true" != 0;
            _ = SDL_PrivateParseGamepadElement(gamepad, @ptrCast(@alignCast(&szGameButton)), @ptrCast(@alignCast(&szJoystickButton)));
            _ = memset(@ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&szGameButton))))), 0, @sizeOf(@TypeOf(szGameButton)));
            _ = memset(@ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&szJoystickButton))))), 0, @sizeOf(@TypeOf(szJoystickButton)));
        } else if (bGameButton) {
            if (@as(c_ulong, @bitCast(@as(c_long, i))) >= @sizeOf(@TypeOf(szGameButton))) {
                szGameButton[@sizeOf(@TypeOf(szGameButton)) -% @as(c_ulong, 1)] = '\x00';
                return SDL_SetError_REAL("Button name too large: %s", @as([*c]u8, @ptrCast(@alignCast(&szGameButton))));
            }
            szGameButton[@bitCast(@as(isize, @intCast(i)))] = pchPos.*;
            i += 1;
        } else {
            if (@as(c_ulong, @bitCast(@as(c_long, i))) >= @sizeOf(@TypeOf(szJoystickButton))) {
                szJoystickButton[@sizeOf(@TypeOf(szJoystickButton)) -% @as(c_ulong, 1)] = '\x00';
                return SDL_SetError_REAL("Joystick button name too large: %s", @as([*c]u8, @ptrCast(@alignCast(&szJoystickButton))));
            }
            szJoystickButton[@bitCast(@as(isize, @intCast(i)))] = pchPos.*;
            i += 1;
        }
        pchPos += 1;
    }
    if ((@as(c_int, szGameButton[@as(c_int, 0)]) != @as(c_int, '\x00')) or (@as(c_int, szJoystickButton[@as(c_int, 0)]) != @as(c_int, '\x00'))) {
        _ = SDL_PrivateParseGamepadElement(gamepad, @ptrCast(@alignCast(&szGameButton)), @ptrCast(@alignCast(&szJoystickButton)));
    }
    return @"true" != 0;
}
pub fn SDL_UpdateGamepadType(gamepad: [*c]SDL_Gamepad) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var type_string: [*c]u8 = undefined;
    _ = &type_string;
    var comma: [*c]u8 = undefined;
    _ = &comma;
    SDL_AssertJoysticksLocked();
    gamepad.*.type = SDL_GAMEPAD_TYPE_UNKNOWN;
    type_string = SDL_strstr_REAL(gamepad.*.mapping.*.mapping, "type:");
    if (type_string != null) {
        type_string += SDL_strlen_REAL("type:");
        comma = SDL_strchr_REAL(type_string, ',');
        if (comma != null) {
            comma.* = '\x00';
            gamepad.*.type = SDL_GetGamepadTypeFromString_REAL(type_string);
            comma.* = ',';
        } else {
            gamepad.*.type = SDL_GetGamepadTypeFromString_REAL(type_string);
        }
    }
    if (gamepad.*.type == @as(SDL_GamepadType, SDL_GAMEPAD_TYPE_UNKNOWN)) {
        gamepad.*.type = SDL_GetRealGamepadTypeForID_REAL(gamepad.*.joystick.*.instance_id);
    }
}
pub fn SDL_GetGamepadFaceStyleFromString(string: [*c]const u8) callconv(.c) SDL_GamepadFaceStyle {
    @setEvalBranchQuota(100000);
    if (SDL_strcmp_REAL(string, "abxy") == @as(c_int, 0)) {
        return SDL_GAMEPAD_FACE_STYLE_ABXY;
    } else if (SDL_strcmp_REAL(string, "axby") == @as(c_int, 0)) {
        return SDL_GAMEPAD_FACE_STYLE_AXBY;
    } else if (SDL_strcmp_REAL(string, "bayx") == @as(c_int, 0)) {
        return SDL_GAMEPAD_FACE_STYLE_BAYX;
    } else if (SDL_strcmp_REAL(string, "sony") == @as(c_int, 0)) {
        return SDL_GAMEPAD_FACE_STYLE_SONY;
    } else {
        return SDL_GAMEPAD_FACE_STYLE_UNKNOWN;
    }
}
pub fn SDL_GetGamepadFaceStyleForGamepadType(arg_type: SDL_GamepadType) callconv(.c) SDL_GamepadFaceStyle {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (@"type") {
                    @as(SDL_GamepadType, SDL_GAMEPAD_TYPE_PS3) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_GamepadType, SDL_GAMEPAD_TYPE_PS4) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SDL_GamepadType, SDL_GAMEPAD_TYPE_PS5) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(SDL_GamepadType, SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_PRO) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_GamepadType, SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_LEFT) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(SDL_GamepadType, SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_RIGHT) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(SDL_GamepadType, SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_PAIR) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(SDL_GamepadType, SDL_GAMEPAD_TYPE_GAMECUBE) => {
                        sdl_pc = 9;
                        continue;
                    },
                    else => {
                        sdl_pc = 10;
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
                return SDL_GAMEPAD_FACE_STYLE_SONY;
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
                return SDL_GAMEPAD_FACE_STYLE_BAYX;
            },
            9 => {
                return SDL_GAMEPAD_FACE_STYLE_AXBY;
            },
            10 => {
                return SDL_GAMEPAD_FACE_STYLE_ABXY;
            },
            else => unreachable,
        }
    }
}
pub fn SDL_UpdateGamepadFaceStyle(gamepad: [*c]SDL_Gamepad) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var face_string: [*c]u8 = undefined;
    _ = &face_string;
    var comma: [*c]u8 = undefined;
    _ = &comma;
    SDL_AssertJoysticksLocked();
    gamepad.*.face_style = SDL_GAMEPAD_FACE_STYLE_UNKNOWN;
    face_string = SDL_strstr_REAL(gamepad.*.mapping.*.mapping, "face:");
    if (face_string != null) {
        face_string += SDL_strlen_REAL("type:");
        comma = SDL_strchr_REAL(face_string, ',');
        if (comma != null) {
            comma.* = '\x00';
            gamepad.*.face_style = SDL_GetGamepadFaceStyleFromString(face_string);
            comma.* = ',';
        } else {
            gamepad.*.face_style = SDL_GetGamepadFaceStyleFromString(face_string);
        }
    }
    if ((gamepad.*.face_style == @as(SDL_GamepadFaceStyle, SDL_GAMEPAD_FACE_STYLE_UNKNOWN)) and (@as(?*anyopaque, @ptrCast(@alignCast(SDL_strstr_REAL(gamepad.*.mapping.*.mapping, "SDL_GAMECONTROLLER_USE_GAMECUBE_LABELS")))) != @as(?*anyopaque, null))) {
        gamepad.*.face_style = SDL_GAMEPAD_FACE_STYLE_AXBY;
    }
    if ((gamepad.*.face_style == @as(SDL_GamepadFaceStyle, SDL_GAMEPAD_FACE_STYLE_UNKNOWN)) and (@as(?*anyopaque, @ptrCast(@alignCast(SDL_strstr_REAL(gamepad.*.mapping.*.mapping, "SDL_GAMECONTROLLER_USE_BUTTON_LABELS")))) != @as(?*anyopaque, null))) {
        gamepad.*.face_style = SDL_GAMEPAD_FACE_STYLE_BAYX;
    }
    if (gamepad.*.face_style == @as(SDL_GamepadFaceStyle, SDL_GAMEPAD_FACE_STYLE_UNKNOWN)) {
        gamepad.*.face_style = SDL_GetGamepadFaceStyleForGamepadType(gamepad.*.type);
    }
}
pub fn SDL_FixupHIDAPIMapping(gamepad: [*c]SDL_Gamepad) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var need_fixup: bool = undefined;
    _ = &need_fixup;
    var i: c_int = undefined;
    _ = &i;
    var binding: [*c]SDL_GamepadBinding = undefined;
    _ = &binding;
    var i_1: c_int = undefined;
    _ = &i_1;
    var binding_2: [*c]SDL_GamepadBinding = undefined;
    _ = &binding_2;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                SDL_AssertJoysticksLocked();
                need_fixup = @"false" != 0;
                i = 0;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            1 => {
                if (i < gamepad.*.num_bindings) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 4;
                    continue;
                }
            },
            2 => {
                binding = &gamepad.*.bindings[@bitCast(@as(isize, @intCast(i)))];
                if ((binding.*.output_type == @as(SDL_GamepadBindingType, SDL_GAMEPAD_BINDTYPE_BUTTON)) and (binding.*.output.button >= SDL_GAMEPAD_BUTTON_DPAD_UP)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            3 => {
                i += 1;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                if (!need_fixup) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            5 => {
                if ((binding.*.input_type == @as(SDL_GamepadBindingType, SDL_GAMEPAD_BINDTYPE_BUTTON)) and (binding.*.input.button == binding.*.output.button)) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
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
                    sdl_pc = 3;
                    continue;
                }
            },
            8 => {
                need_fixup = @"true" != 0;
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
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            11 => {
                return;
            },
            12 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                i_1 = 0;
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            14 => {
                if (i_1 < gamepad.*.num_bindings) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            15 => {
                binding_2 = &gamepad.*.bindings[@bitCast(@as(isize, @intCast(i_1)))];
                if ((binding_2.*.input_type == @as(SDL_GamepadBindingType, SDL_GAMEPAD_BINDTYPE_BUTTON)) and (binding_2.*.output_type == @as(SDL_GamepadBindingType, SDL_GAMEPAD_BINDTYPE_BUTTON))) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            16 => {
                i_1 += 1;
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            17 => {
                {}
            },
            18 => {
                switch (binding_2.*.output.button) {
                    SDL_GAMEPAD_BUTTON_DPAD_UP => {
                        sdl_pc = 22;
                        continue;
                    },
                    SDL_GAMEPAD_BUTTON_DPAD_DOWN => {
                        sdl_pc = 23;
                        continue;
                    },
                    SDL_GAMEPAD_BUTTON_DPAD_LEFT => {
                        sdl_pc = 24;
                        continue;
                    },
                    SDL_GAMEPAD_BUTTON_DPAD_RIGHT => {
                        sdl_pc = 25;
                        continue;
                    },
                    else => {
                        sdl_pc = 26;
                        continue;
                    },
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
                    sdl_pc = 16;
                    continue;
                }
            },
            21 => {
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            22 => {
                binding_2.*.input_type = SDL_GAMEPAD_BINDTYPE_HAT;
                binding_2.*.input.hat.hat = 0;
                binding_2.*.input.hat.hat_mask = SDL_HAT_UP;
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            23 => {
                binding_2.*.input_type = SDL_GAMEPAD_BINDTYPE_HAT;
                binding_2.*.input.hat.hat = 0;
                binding_2.*.input.hat.hat_mask = SDL_HAT_DOWN;
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            24 => {
                binding_2.*.input_type = SDL_GAMEPAD_BINDTYPE_HAT;
                binding_2.*.input.hat.hat = 0;
                binding_2.*.input.hat.hat_mask = SDL_HAT_LEFT;
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            25 => {
                binding_2.*.input_type = SDL_GAMEPAD_BINDTYPE_HAT;
                binding_2.*.input.hat.hat = 0;
                binding_2.*.input.hat.hat_mask = SDL_HAT_RIGHT;
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            26 => {
                if (binding_2.*.output.button > SDL_GAMEPAD_BUTTON_DPAD_RIGHT) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            27 => {
                binding_2.*.input.button -= 4;
                {
                    sdl_pc = 29;
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
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn SDL_PrivateLoadButtonMapping(gamepad: [*c]SDL_Gamepad, pGamepadMapping: [*c]GamepadMapping_t) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    SDL_AssertJoysticksLocked();
    gamepad.*.name = pGamepadMapping.*.name;
    gamepad.*.num_bindings = 0;
    gamepad.*.mapping = pGamepadMapping;
    if ((gamepad.*.joystick.*.naxes != @as(c_int, 0)) and (gamepad.*.last_match_axis != null)) {
        _ = memset(@ptrCast(@alignCast(gamepad.*.last_match_axis)), 0, @as(c_ulong, @bitCast(@as(c_long, gamepad.*.joystick.*.naxes))) *% @sizeOf(@TypeOf(gamepad.*.last_match_axis.*)));
    }
    SDL_UpdateGamepadType(gamepad);
    SDL_UpdateGamepadFaceStyle(gamepad);
    _ = SDL_PrivateParseGamepadConfigString(gamepad, pGamepadMapping.*.mapping);
    if (SDL_IsJoystickHIDAPI(pGamepadMapping.*.guid)) {
        SDL_FixupHIDAPIMapping(gamepad);
    }
    {
        i = 0;
        while (i < gamepad.*.num_bindings) : (i += 1) {
            var binding: [*c]SDL_GamepadBinding = &gamepad.*.bindings[@bitCast(@as(isize, @intCast(i)))];
            _ = &binding;
            if (((binding.*.input_type == @as(SDL_GamepadBindingType, SDL_GAMEPAD_BINDTYPE_AXIS)) and (binding.*.output_type == @as(SDL_GamepadBindingType, SDL_GAMEPAD_BINDTYPE_AXIS))) and ((binding.*.output.axis.axis == SDL_GAMEPAD_AXIS_LEFT_TRIGGER) or (binding.*.output.axis.axis == SDL_GAMEPAD_AXIS_RIGHT_TRIGGER))) {
                if (binding.*.input.axis.axis < gamepad.*.joystick.*.naxes) {
                    gamepad.*.joystick.*.axes[@bitCast(@as(isize, @intCast(binding.*.input.axis.axis)))].value = blk: {
                        const tmp = @as(Sint16, @truncate(binding.*.input.axis.axis_min));
                        gamepad.*.joystick.*.axes[@bitCast(@as(isize, @intCast(binding.*.input.axis.axis)))].zero = tmp;
                        break :blk tmp;
                    };
                }
            }
        }
    }
}
pub fn SDL_PrivateGetGamepadGUIDFromMappingString(pMapping: [*c]const u8) callconv(.c) [*c]u8 {
    @setEvalBranchQuota(100000);
    var pFirstComma: [*c]const u8 = SDL_strchr_REAL(pMapping, ',');
    _ = &pFirstComma;
    if (pFirstComma != null) {
        var pchGUID: [*c]u8 = @ptrCast(@alignCast(SDL_malloc_REAL(@bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(pFirstComma) -% @intFromPtr(pMapping))), @sizeOf(u8)) + @as(c_long, 1))))));
        _ = &pchGUID;
        if (!(pchGUID != null)) {
            return null;
        }
        _ = memcpy(@ptrCast(@alignCast(pchGUID)), @ptrCast(@alignCast(pMapping)), @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(pFirstComma) -% @intFromPtr(pMapping))), @sizeOf(u8)))));
        pchGUID[@bitCast(@as(isize, @intCast(@divExact(@as(c_long, @bitCast(@intFromPtr(pFirstComma) -% @intFromPtr(pMapping))), @sizeOf(u8)))))] = '\x00';
        return pchGUID;
    }
    return null;
}
pub fn SDL_PrivateGetGamepadNameFromMappingString(pMapping: [*c]const u8) callconv(.c) [*c]u8 {
    @setEvalBranchQuota(100000);
    var pFirstComma: [*c]const u8 = undefined;
    _ = &pFirstComma;
    var pSecondComma: [*c]const u8 = undefined;
    _ = &pSecondComma;
    var pchName: [*c]u8 = undefined;
    _ = &pchName;
    pFirstComma = SDL_strchr_REAL(pMapping, ',');
    if (!(pFirstComma != null)) {
        return null;
    }
    pSecondComma = SDL_strchr_REAL(pFirstComma + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1))))), ',');
    if (!(pSecondComma != null)) {
        return null;
    }
    pchName = @ptrCast(@alignCast(SDL_malloc_REAL(@bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(pSecondComma) -% @intFromPtr(pFirstComma))), @sizeOf(u8)))))));
    if (!(pchName != null)) {
        return null;
    }
    _ = memcpy(@ptrCast(@alignCast(pchName)), @ptrCast(@alignCast(pFirstComma + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1))))))), @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(pSecondComma) -% @intFromPtr(pFirstComma))), @sizeOf(u8)))));
    pchName[@bitCast(@as(isize, @intCast(@divExact(@as(c_long, @bitCast(@intFromPtr(pSecondComma) -% @intFromPtr(pFirstComma))), @sizeOf(u8)) - @as(c_long, 1))))] = 0;
    return pchName;
}
pub fn SDL_PrivateGetGamepadMappingFromMappingString(pMapping: [*c]const u8) callconv(.c) [*c]u8 {
    @setEvalBranchQuota(100000);
    var pFirstComma: [*c]const u8 = undefined;
    _ = &pFirstComma;
    var pSecondComma: [*c]const u8 = undefined;
    _ = &pSecondComma;
    var result: [*c]u8 = undefined;
    _ = &result;
    var length: usize = undefined;
    _ = &length;
    pFirstComma = SDL_strchr_REAL(pMapping, ',');
    if (!(pFirstComma != null)) {
        return null;
    }
    pSecondComma = SDL_strchr_REAL(pFirstComma + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1))))), ',');
    if (!(pSecondComma != null)) {
        return null;
    }
    while (SDL_isspace_REAL(pSecondComma[@as(c_int, 1)]) != 0) {
        pSecondComma += 1;
    }
    result = SDL_strdup_REAL(pSecondComma + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1))))));
    length = SDL_strlen_REAL(result);
    while ((length > @as(usize, 0)) and (SDL_isspace_REAL(result[length -% @as(usize, 1)]) != 0)) {
        length -%= 1;
    }
    result[length] = '\x00';
    return result;
}
pub fn SDL_PrivateAddMappingForGUID(arg_jGUID: SDL_GUID, mappingString: [*c]const u8, existing: [*c]bool, priority: SDL_GamepadMappingPriority) callconv(.c) [*c]GamepadMapping_t {
    @setEvalBranchQuota(100000);
    var jGUID = arg_jGUID;
    _ = &jGUID;
    var pchName: [*c]u8 = undefined;
    _ = &pchName;
    var pchMapping: [*c]u8 = undefined;
    _ = &pchMapping;
    var pGamepadMapping: [*c]GamepadMapping_t = undefined;
    _ = &pGamepadMapping;
    var crc: Uint16 = undefined;
    _ = &crc;
    SDL_AssertJoysticksLocked();
    pchName = SDL_PrivateGetGamepadNameFromMappingString(mappingString);
    if (!(pchName != null)) {
        _ = SDL_SetError_REAL("Couldn't parse name from %s", mappingString);
        return null;
    }
    pchMapping = SDL_PrivateGetGamepadMappingFromMappingString(mappingString);
    if (!(pchMapping != null)) {
        SDL_free_REAL(@ptrCast(@alignCast(pchName)));
        _ = SDL_SetError_REAL("Couldn't parse %s", mappingString);
        return null;
    }
    SDL_GetJoystickGUIDInfo_REAL(jGUID, null, null, null, &crc);
    if (@as(c_int, crc) != 0) {
        var new_mapping: [*c]u8 = undefined;
        _ = &new_mapping;
        var optional_comma: [*c]const u8 = undefined;
        _ = &optional_comma;
        var mapping_length: usize = undefined;
        _ = &mapping_length;
        var crc_end: [*c]u8 = @as([*c]u8, @as([*c]u8, @constCast("")));
        _ = &crc_end;
        var crc_string: [*c]u8 = SDL_strstr_REAL(pchMapping, "crc:");
        _ = &crc_string;
        if (crc_string != null) {
            crc_end = SDL_strchr_REAL(crc_string, ',');
            if (crc_end != null) {
                crc_end += 1;
            } else {
                crc_end = @as([*c]u8, @as([*c]u8, @constCast("")));
            }
            crc_string.* = '\x00';
        }
        mapping_length = SDL_strlen_REAL(pchMapping);
        if ((mapping_length == @as(usize, 0)) or (@as(c_int, pchMapping[mapping_length -% @as(usize, 1)]) == @as(c_int, ','))) {
            optional_comma = "";
        } else {
            optional_comma = ",";
        }
        if (SDL_asprintf_REAL(&new_mapping, "%s%s%s%.4x,%s", pchMapping, optional_comma, @as([*c]u8, @as([*c]u8, @constCast("crc:"))), crc, crc_end) >= @as(c_int, 0)) {
            SDL_free_REAL(@ptrCast(@alignCast(pchMapping)));
            pchMapping = new_mapping;
        }
    } else {
        var crc_string: [*c]u8 = SDL_strstr_REAL(pchMapping, "crc:");
        _ = &crc_string;
        if (crc_string != null) {
            crc = @bitCast(@as(c_short, @truncate(SDL_strtol_REAL(crc_string + @as(usize, @bitCast(@as(isize, @intCast(SDL_GAMEPAD_CRC_FIELD_SIZE)))), null, 16))));
            if (@as(c_int, crc) != 0) {
                SDL_SetJoystickGUIDCRC(&jGUID, crc);
            }
        }
    }
    PushMappingChangeTracking();
    pGamepadMapping = SDL_PrivateGetGamepadMappingForGUID(jGUID, @"true" != 0);
    if (pGamepadMapping != null) {
        if (pGamepadMapping.*.priority <= priority) {
            SDL_free_REAL(@ptrCast(@alignCast(pGamepadMapping.*.name)));
            pGamepadMapping.*.name = pchName;
            SDL_free_REAL(@ptrCast(@alignCast(pGamepadMapping.*.mapping)));
            pGamepadMapping.*.mapping = pchMapping;
            pGamepadMapping.*.priority = priority;
        } else {
            SDL_free_REAL(@ptrCast(@alignCast(pchName)));
            SDL_free_REAL(@ptrCast(@alignCast(pchMapping)));
        }
        if (existing != null) {
            existing.* = @"true" != 0;
        }
        AddMappingChangeTracking(pGamepadMapping);
    } else {
        pGamepadMapping = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(@TypeOf(pGamepadMapping.*)))));
        if (!(pGamepadMapping != null)) {
            PopMappingChangeTracking();
            SDL_free_REAL(@ptrCast(@alignCast(pchName)));
            SDL_free_REAL(@ptrCast(@alignCast(pchMapping)));
            return null;
        }
        if (@as(c_int, crc) != 0) {
            SDL_SetJoystickGUIDCRC(&jGUID, 0);
        }
        pGamepadMapping.*.guid = jGUID;
        pGamepadMapping.*.name = pchName;
        pGamepadMapping.*.mapping = pchMapping;
        pGamepadMapping.*.next = null;
        pGamepadMapping.*.priority = priority;
        if (s_pSupportedGamepads != null) {
            var pCurrMapping: [*c]GamepadMapping_t = undefined;
            _ = &pCurrMapping;
            var pPrevMapping: [*c]GamepadMapping_t = undefined;
            _ = &pPrevMapping;
            {
                pPrevMapping = s_pSupportedGamepads;
                pCurrMapping = pPrevMapping.*.next;
                while (pCurrMapping != null) : ({
                    pPrevMapping = pCurrMapping;
                    pCurrMapping = pCurrMapping.*.next;
                }) {}
            }
            pPrevMapping.*.next = pGamepadMapping;
        } else {
            s_pSupportedGamepads = pGamepadMapping;
        }
        if (existing != null) {
            existing.* = @"false" != 0;
        }
    }
    PopMappingChangeTracking();
    return pGamepadMapping;
}
pub fn SDL_PrivateGetGamepadMappingForNameAndGUID(_: [*c]const u8, guid: SDL_GUID) callconv(.c) [*c]GamepadMapping_t {
    @setEvalBranchQuota(100000);
    var mapping: [*c]GamepadMapping_t = undefined;
    _ = &mapping;
    SDL_AssertJoysticksLocked();
    mapping = SDL_PrivateGetGamepadMappingForGUID(guid, @"false" != 0);
    return mapping;
}
pub fn SDL_PrivateAppendToMappingString(mapping_string: [*c]u8, mapping_string_len: usize, input_name: [*c]const u8, mapping: [*c]SDL_InputMapping) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [32:0]u8 = "SDL_PrivateAppendToMappingString".*;
    };
    _ = &static_local___func__;
    var buffer: [16]u8 = undefined;
    _ = &buffer;
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
                if (mapping.*.kind == @as(EMappingKind, EMappingKind_None)) {
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
                _ = SDL_strlcat_REAL(mapping_string, input_name, mapping_string_len);
                _ = SDL_strlcat_REAL(mapping_string, ":", mapping_string_len);
                switch (mapping.*.kind) {
                    @as(EMappingKind, EMappingKind_Button) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(EMappingKind, EMappingKind_Axis) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(EMappingKind, EMappingKind_Hat) => {
                        sdl_pc = 7;
                        continue;
                    },
                    else => {
                        sdl_pc = 8;
                        continue;
                    },
                }
            },
            4 => {
                _ = SDL_strlcat_REAL(mapping_string, @ptrCast(@alignCast(&buffer)), mapping_string_len);
                _ = SDL_strlcat_REAL(mapping_string, ",", mapping_string_len);
                {}
            },
            5 => {
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&buffer)), @sizeOf(@TypeOf(buffer)), "b%u", mapping.*.target);
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            6 => {
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&buffer)), @sizeOf(@TypeOf(buffer)), "%sa%u%s", if (mapping.*.half_axis_positive) @as([*c]u8, @as([*c]u8, @constCast("+"))) else if (mapping.*.half_axis_negative) @as([*c]u8, @as([*c]u8, @constCast("-"))) else @as([*c]u8, @as([*c]u8, @constCast(""))), mapping.*.target, if (mapping.*.axis_reversed) @as([*c]u8, @as([*c]u8, @constCast("~"))) else @as([*c]u8, @as([*c]u8, @constCast(""))));
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            7 => {
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&buffer)), @sizeOf(@TypeOf(buffer)), "h%i.%i", @as(c_int, mapping.*.target) >> @intCast(@as(c_int, 4)), @as(c_int, mapping.*.target) & @as(c_int, 15));
                {
                    sdl_pc = 4;
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
                    sdl_pc = 12;
                    continue;
                }
            },
            10 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            12 => {
                if (!(@"false" != 0)) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            13 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gamepad.c", 2316);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
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
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            16 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            18 => {
                __builtin.debugtrap();
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
            else => unreachable,
        }
    }
}
pub fn SDL_PrivateGenerateAutomaticGamepadMapping(name: [*c]const u8, arg_guid: SDL_GUID, raw_map: [*c]SDL_GamepadMapping) callconv(.c) [*c]GamepadMapping_t {
    @setEvalBranchQuota(100000);
    var guid = arg_guid;
    _ = &guid;
    var existing: bool = undefined;
    _ = &existing;
    var name_string: [128]u8 = undefined;
    _ = &name_string;
    var mapping: [1024]u8 = undefined;
    _ = &mapping;
    SDL_SetJoystickGUIDCRC(&guid, 0);
    _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name_string)), name, @sizeOf(@TypeOf(name_string)));
    {
        var spot: [*c]u8 = undefined;
        _ = &spot;
        {
            spot = @ptrCast(@alignCast(&name_string));
            while (@as(c_int, spot.*) != 0) : (spot += 1) {
                if (@as(c_int, spot.*) == @as(c_int, ',')) {
                    spot.* = ' ';
                }
            }
        }
    }
    _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&mapping)), @sizeOf(@TypeOf(mapping)), "none,%s,", @as([*c]u8, @ptrCast(@alignCast(&name_string))));
    SDL_PrivateAppendToMappingString(@ptrCast(@alignCast(&mapping)), @sizeOf(@TypeOf(mapping)), "a", &raw_map.*.a);
    SDL_PrivateAppendToMappingString(@ptrCast(@alignCast(&mapping)), @sizeOf(@TypeOf(mapping)), "b", &raw_map.*.b);
    SDL_PrivateAppendToMappingString(@ptrCast(@alignCast(&mapping)), @sizeOf(@TypeOf(mapping)), "x", &raw_map.*.x);
    SDL_PrivateAppendToMappingString(@ptrCast(@alignCast(&mapping)), @sizeOf(@TypeOf(mapping)), "y", &raw_map.*.y);
    SDL_PrivateAppendToMappingString(@ptrCast(@alignCast(&mapping)), @sizeOf(@TypeOf(mapping)), "back", &raw_map.*.back);
    SDL_PrivateAppendToMappingString(@ptrCast(@alignCast(&mapping)), @sizeOf(@TypeOf(mapping)), "guide", &raw_map.*.guide);
    SDL_PrivateAppendToMappingString(@ptrCast(@alignCast(&mapping)), @sizeOf(@TypeOf(mapping)), "start", &raw_map.*.start);
    SDL_PrivateAppendToMappingString(@ptrCast(@alignCast(&mapping)), @sizeOf(@TypeOf(mapping)), "leftstick", &raw_map.*.leftstick);
    SDL_PrivateAppendToMappingString(@ptrCast(@alignCast(&mapping)), @sizeOf(@TypeOf(mapping)), "rightstick", &raw_map.*.rightstick);
    SDL_PrivateAppendToMappingString(@ptrCast(@alignCast(&mapping)), @sizeOf(@TypeOf(mapping)), "leftshoulder", &raw_map.*.leftshoulder);
    SDL_PrivateAppendToMappingString(@ptrCast(@alignCast(&mapping)), @sizeOf(@TypeOf(mapping)), "rightshoulder", &raw_map.*.rightshoulder);
    SDL_PrivateAppendToMappingString(@ptrCast(@alignCast(&mapping)), @sizeOf(@TypeOf(mapping)), "dpup", &raw_map.*.dpup);
    SDL_PrivateAppendToMappingString(@ptrCast(@alignCast(&mapping)), @sizeOf(@TypeOf(mapping)), "dpdown", &raw_map.*.dpdown);
    SDL_PrivateAppendToMappingString(@ptrCast(@alignCast(&mapping)), @sizeOf(@TypeOf(mapping)), "dpleft", &raw_map.*.dpleft);
    SDL_PrivateAppendToMappingString(@ptrCast(@alignCast(&mapping)), @sizeOf(@TypeOf(mapping)), "dpright", &raw_map.*.dpright);
    SDL_PrivateAppendToMappingString(@ptrCast(@alignCast(&mapping)), @sizeOf(@TypeOf(mapping)), "misc1", &raw_map.*.misc1);
    SDL_PrivateAppendToMappingString(@ptrCast(@alignCast(&mapping)), @sizeOf(@TypeOf(mapping)), "misc2", &raw_map.*.misc2);
    SDL_PrivateAppendToMappingString(@ptrCast(@alignCast(&mapping)), @sizeOf(@TypeOf(mapping)), "misc3", &raw_map.*.misc3);
    SDL_PrivateAppendToMappingString(@ptrCast(@alignCast(&mapping)), @sizeOf(@TypeOf(mapping)), "misc4", &raw_map.*.misc4);
    SDL_PrivateAppendToMappingString(@ptrCast(@alignCast(&mapping)), @sizeOf(@TypeOf(mapping)), "misc5", &raw_map.*.misc5);
    SDL_PrivateAppendToMappingString(@ptrCast(@alignCast(&mapping)), @sizeOf(@TypeOf(mapping)), "misc6", &raw_map.*.misc6);
    SDL_PrivateAppendToMappingString(@ptrCast(@alignCast(&mapping)), @sizeOf(@TypeOf(mapping)), "paddle1", &raw_map.*.right_paddle1);
    SDL_PrivateAppendToMappingString(@ptrCast(@alignCast(&mapping)), @sizeOf(@TypeOf(mapping)), "paddle2", &raw_map.*.left_paddle1);
    SDL_PrivateAppendToMappingString(@ptrCast(@alignCast(&mapping)), @sizeOf(@TypeOf(mapping)), "paddle3", &raw_map.*.right_paddle2);
    SDL_PrivateAppendToMappingString(@ptrCast(@alignCast(&mapping)), @sizeOf(@TypeOf(mapping)), "paddle4", &raw_map.*.left_paddle2);
    SDL_PrivateAppendToMappingString(@ptrCast(@alignCast(&mapping)), @sizeOf(@TypeOf(mapping)), "leftx", &raw_map.*.leftx);
    SDL_PrivateAppendToMappingString(@ptrCast(@alignCast(&mapping)), @sizeOf(@TypeOf(mapping)), "lefty", &raw_map.*.lefty);
    SDL_PrivateAppendToMappingString(@ptrCast(@alignCast(&mapping)), @sizeOf(@TypeOf(mapping)), "rightx", &raw_map.*.rightx);
    SDL_PrivateAppendToMappingString(@ptrCast(@alignCast(&mapping)), @sizeOf(@TypeOf(mapping)), "righty", &raw_map.*.righty);
    SDL_PrivateAppendToMappingString(@ptrCast(@alignCast(&mapping)), @sizeOf(@TypeOf(mapping)), "lefttrigger", &raw_map.*.lefttrigger);
    SDL_PrivateAppendToMappingString(@ptrCast(@alignCast(&mapping)), @sizeOf(@TypeOf(mapping)), "righttrigger", &raw_map.*.righttrigger);
    SDL_PrivateAppendToMappingString(@ptrCast(@alignCast(&mapping)), @sizeOf(@TypeOf(mapping)), "touchpad", &raw_map.*.touchpad);
    return SDL_PrivateAddMappingForGUID(guid, @ptrCast(@alignCast(&mapping)), &existing, SDL_GAMEPAD_MAPPING_PRIORITY_DEFAULT);
}
pub fn SDL_PrivateGetGamepadMapping(instance_id: SDL_JoystickID, create_mapping: bool) callconv(.c) [*c]GamepadMapping_t {
    @setEvalBranchQuota(100000);
    var name: [*c]const u8 = undefined;
    _ = &name;
    var guid: SDL_GUID = undefined;
    _ = &guid;
    var mapping: [*c]GamepadMapping_t = undefined;
    _ = &mapping;
    SDL_AssertJoysticksLocked();
    name = SDL_GetJoystickNameForID_REAL(instance_id);
    guid = SDL_GetJoystickGUIDForID_REAL(instance_id);
    mapping = SDL_PrivateGetGamepadMappingForNameAndGUID(name, guid);
    if (!(mapping != null) and create_mapping) {
        var raw_map: SDL_GamepadMapping = undefined;
        _ = &raw_map;
        _ = memset(@ptrCast(@alignCast(&raw_map)), 0, @sizeOf(@TypeOf(raw_map)));
        if (SDL_PrivateJoystickGetAutoGamepadMapping(instance_id, &raw_map)) {
            mapping = SDL_PrivateGenerateAutomaticGamepadMapping(name, guid, &raw_map);
        }
    }
    if (!(mapping != null)) {
        mapping = s_pDefaultMapping;
    }
    return mapping;
}
pub fn SDL_PrivateIsGamepadPlatformMatch(platform: [*c]const u8, platform_len: usize) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_strncasecmp_REAL(platform, SDL_GetPlatform_REAL(), platform_len) == @as(c_int, 0);
}
pub export fn SDL_AddGamepadMappingsFromIO_REAL(src: ?*SDL_IOStream, closeio: bool) c_int {
    @setEvalBranchQuota(100000);
    var gamepads: c_int = 0;
    _ = &gamepads;
    var buf: [*c]u8 = undefined;
    _ = &buf;
    var line: [*c]u8 = undefined;
    _ = &line;
    var line_end: [*c]u8 = undefined;
    _ = &line_end;
    var tmp: [*c]u8 = undefined;
    _ = &tmp;
    var comma: [*c]u8 = undefined;
    _ = &comma;
    var platform: [*c]u8 = undefined;
    _ = &platform;
    var db_size: usize = undefined;
    _ = &db_size;
    var platform_len: usize = undefined;
    _ = &platform_len;
    buf = @ptrCast(@alignCast(SDL_LoadFile_IO_REAL(src, &db_size, closeio)));
    if (!(buf != null)) {
        _ = SDL_SetError_REAL("Could not allocate space to read DB into memory");
        return -@as(c_int, 1);
    }
    line = buf;
    SDL_LockJoysticks_REAL();
    PushMappingChangeTracking();
    while (line < (buf + db_size)) {
        line_end = SDL_strchr_REAL(line, '\n');
        if (line_end != null) {
            line_end.* = '\x00';
        } else {
            line_end = buf + db_size;
        }
        tmp = SDL_strstr_REAL(line, "platform:");
        if (tmp != null) {
            tmp += SDL_strlen_REAL("platform:");
            comma = SDL_strchr_REAL(tmp, ',');
            if (comma != null) {
                platform = tmp;
                platform_len = @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(comma) -% @intFromPtr(platform))), @sizeOf(u8))));
                if (SDL_PrivateIsGamepadPlatformMatch(platform, platform_len) and (SDL_AddGamepadMapping_REAL(line) > @as(c_int, 0))) {
                    gamepads += 1;
                }
            }
        }
        line = line_end + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
    }
    PopMappingChangeTracking();
    SDL_UnlockJoysticks_REAL();
    SDL_free_REAL(@ptrCast(@alignCast(buf)));
    return gamepads;
}
pub export fn SDL_AddGamepadMappingsFromFile_REAL(file: [*c]const u8) c_int {
    @setEvalBranchQuota(100000);
    var stream: ?*SDL_IOStream = SDL_IOFromFile_REAL(file, "rb");
    _ = &stream;
    if (!(stream != null)) {
        return -@as(c_int, 1);
    }
    return SDL_AddGamepadMappingsFromIO_REAL(stream, @"true" != 0);
}
pub export fn SDL_ReloadGamepadMappings_REAL() bool {
    @setEvalBranchQuota(100000);
    var gamepad: [*c]SDL_Gamepad = undefined;
    _ = &gamepad;
    SDL_LockJoysticks_REAL();
    PushMappingChangeTracking();
    {
        gamepad = SDL_gamepads;
        while (gamepad != null) : (gamepad = gamepad.*.next) {
            AddMappingChangeTracking(gamepad.*.mapping);
        }
    }
    SDL_QuitGamepadMappings();
    _ = SDL_InitGamepadMappings();
    PopMappingChangeTracking();
    SDL_UnlockJoysticks_REAL();
    return @"true" != 0;
}
pub fn SDL_ConvertMappingToPositionalAXBY(mapping: [*c]const u8) callconv(.c) [*c]u8 {
    @setEvalBranchQuota(100000);
    var length: usize = (SDL_strlen_REAL(mapping) +% @as(usize, 1)) +% @as(usize, 1);
    _ = &length;
    var remapped: [*c]u8 = @ptrCast(@alignCast(SDL_malloc_REAL(length)));
    _ = &remapped;
    if (remapped != null) {
        var button_B: [*c]u8 = undefined;
        _ = &button_B;
        var button_X: [*c]u8 = undefined;
        _ = &button_X;
        var hint: [*c]u8 = undefined;
        _ = &hint;
        _ = SDL_strlcpy_REAL(remapped, mapping, length);
        button_B = SDL_strstr_REAL(remapped, ",b:");
        button_X = SDL_strstr_REAL(remapped, ",x:");
        hint = SDL_strstr_REAL(remapped, "hint:SDL_GAMECONTROLLER_USE_GAMECUBE_LABELS");
        if (button_B != null) {
            button_B[@as(c_int, 1)] = 'x';
        }
        if (button_X != null) {
            button_X[@as(c_int, 1)] = 'b';
        }
        if (hint != null) {
            hint += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 5)))));
            _ = memmove(@ptrCast(@alignCast(hint + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1))))))), @ptrCast(@alignCast(hint)), SDL_strlen_REAL(hint) +% @as(usize, 1));
            hint.* = '!';
        }
    }
    return remapped;
}
pub fn SDL_ConvertMappingToPositionalBAXY(mapping: [*c]const u8) callconv(.c) [*c]u8 {
    @setEvalBranchQuota(100000);
    var length: usize = (SDL_strlen_REAL(mapping) +% @as(usize, 1)) +% @as(usize, 1);
    _ = &length;
    var remapped: [*c]u8 = @ptrCast(@alignCast(SDL_malloc_REAL(length)));
    _ = &remapped;
    if (remapped != null) {
        var button_A: [*c]u8 = undefined;
        _ = &button_A;
        var button_B: [*c]u8 = undefined;
        _ = &button_B;
        var button_X: [*c]u8 = undefined;
        _ = &button_X;
        var button_Y: [*c]u8 = undefined;
        _ = &button_Y;
        var hint: [*c]u8 = undefined;
        _ = &hint;
        _ = SDL_strlcpy_REAL(remapped, mapping, length);
        button_A = SDL_strstr_REAL(remapped, ",a:");
        button_B = SDL_strstr_REAL(remapped, ",b:");
        button_X = SDL_strstr_REAL(remapped, ",x:");
        button_Y = SDL_strstr_REAL(remapped, ",y:");
        hint = SDL_strstr_REAL(remapped, "hint:SDL_GAMECONTROLLER_USE_BUTTON_LABELS");
        if (button_A != null) {
            button_A[@as(c_int, 1)] = 'b';
        }
        if (button_B != null) {
            button_B[@as(c_int, 1)] = 'a';
        }
        if (button_X != null) {
            button_X[@as(c_int, 1)] = 'y';
        }
        if (button_Y != null) {
            button_Y[@as(c_int, 1)] = 'x';
        }
        if (hint != null) {
            hint += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 5)))));
            _ = memmove(@ptrCast(@alignCast(hint + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1))))))), @ptrCast(@alignCast(hint)), SDL_strlen_REAL(hint) +% @as(usize, 1));
            hint.* = '!';
        }
    }
    return remapped;
}
pub fn SDL_PrivateAddGamepadMapping(arg_mappingString: [*c]const u8, priority: SDL_GamepadMappingPriority) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var mappingString = arg_mappingString;
    _ = &mappingString;
    var appended: [*c]u8 = undefined;
    _ = &appended;
    var remapped: [*c]u8 = undefined;
    _ = &remapped;
    var pchGUID: [*c]u8 = undefined;
    _ = &pchGUID;
    var guid: SDL_GUID = undefined;
    _ = &guid;
    var vendor: Uint16 = undefined;
    _ = &vendor;
    var product: Uint16 = undefined;
    _ = &product;
    var is_default_mapping: bool = undefined;
    _ = &is_default_mapping;
    var is_xinput_mapping: bool = undefined;
    _ = &is_xinput_mapping;
    var existing: bool = undefined;
    _ = &existing;
    var pGamepadMapping: [*c]GamepadMapping_t = undefined;
    _ = &pGamepadMapping;
    var result: c_int = undefined;
    _ = &result;
    var tmp: [*c]const u8 = undefined;
    _ = &tmp;
    var default_value: bool = undefined;
    _ = &default_value;
    var value: bool = undefined;
    _ = &value;
    var negate: bool = undefined;
    _ = &negate;
    var len: c_int = undefined;
    _ = &len;
    var hint: [128]u8 = undefined;
    _ = &hint;
    var hint_value: [*c]const u8 = undefined;
    _ = &hint_value;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                appended = null;
                remapped = null;
                is_default_mapping = @"false" != 0;
                is_xinput_mapping = @"false" != 0;
                existing = @"false" != 0;
                result = -@as(c_int, 1);
                SDL_AssertJoysticksLocked();
                if (!(mappingString != null)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                SDL_free_REAL(@ptrCast(@alignCast(appended)));
                SDL_free_REAL(@ptrCast(@alignCast(remapped)));
                return result;
            },
            2 => {
                _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("mappingString"))));
                return -@as(c_int, 1);
            },
            3 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                pchGUID = SDL_PrivateGetGamepadGUIDFromMappingString(mappingString);
                if (!(pchGUID != null)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                _ = SDL_SetError_REAL("Couldn't parse GUID from %s", mappingString);
                return -@as(c_int, 1);
            },
            6 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                if (!(SDL_strcasecmp_REAL(pchGUID, "default") != 0)) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                is_default_mapping = @"true" != 0;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            9 => {
                if (!(SDL_strcasecmp_REAL(pchGUID, "xinput") != 0)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            10 => {
                guid = SDL_StringToGUID_REAL(pchGUID);
                SDL_free_REAL(@ptrCast(@alignCast(pchGUID)));
                SDL_GetJoystickGUIDInfo_REAL(guid, &vendor, &product, null, null);
                if (SDL_IsJoystickGameCube(vendor, product) and (@as(?*anyopaque, @ptrCast(@alignCast(SDL_strstr_REAL(mappingString, "SDL_GAMECONTROLLER_USE_GAMECUBE_LABELS")))) == @as(?*anyopaque, null))) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            11 => {
                is_xinput_mapping = @"true" != 0;
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
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            14 => {
                _ = SDL_asprintf_REAL(&appended, "%shint:SDL_GAMECONTROLLER_USE_GAMECUBE_LABELS:=1,", mappingString);
                if (appended != null) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
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
                tmp = SDL_strstr_REAL(mappingString, "hint:");
                if (tmp != null) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            17 => {
                mappingString = appended;
                {
                    sdl_pc = 19;
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
                    sdl_pc = 16;
                    continue;
                }
            },
            20 => {
                tmp += SDL_strlen_REAL("hint:");
                if (@as(c_int, tmp.*) == @as(c_int, '!')) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
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
                pGamepadMapping = SDL_PrivateAddMappingForGUID(guid, mappingString, &existing, priority);
                if (!(pGamepadMapping != null)) {
                    sdl_pc = 59;
                    continue;
                } else {
                    sdl_pc = 60;
                    continue;
                }
            },
            23 => {
                negate = @"true" != 0;
                tmp += 1;
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            24 => {
                negate = @"false" != 0;
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            25 => {
                len = 0;
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            26 => {
                if ((((@as(c_int, tmp.*) != 0) and (@as(c_int, tmp.*) != @as(c_int, ','))) and (@as(c_int, tmp.*) != @as(c_int, ':'))) and (@as(c_ulong, @bitCast(@as(c_long, len))) < (@sizeOf(@TypeOf(hint)) -% @as(c_ulong, 1)))) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            27 => {
                hint[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &len;
                        const tmp_1 = ref.*;
                        ref.* += 1;
                        break :blk tmp_1;
                    })))
                ] = (blk: {
                    const ref = &tmp;
                    const tmp_1 = ref.*;
                    ref.* += 1;
                    break :blk tmp_1;
                }).*;
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            28 => {
                hint[@bitCast(@as(isize, @intCast(len)))] = '\x00';
                if ((@as(c_int, tmp[@as(c_int, 0)]) == @as(c_int, ':')) and (@as(c_int, tmp[@as(c_int, 1)]) == @as(c_int, '='))) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            29 => {
                tmp += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                default_value = SDL_atoi_REAL(tmp) != 0;
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            30 => {
                default_value = @"false" != 0;
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            31 => {
                if (SDL_strcmp_REAL(@ptrCast(@alignCast(&hint)), "SDL_GAMECONTROLLER_USE_GAMECUBE_LABELS") == @as(c_int, 0)) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            32 => {
                if (negate) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            33 => {
                if (SDL_strcmp_REAL(@ptrCast(@alignCast(&hint)), "SDL_GAMECONTROLLER_USE_BUTTON_LABELS") == @as(c_int, 0)) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            34 => {
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            35 => {
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            36 => {
                remapped = SDL_ConvertMappingToPositionalAXBY(mappingString);
                if (!(remapped != null)) {
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
                mappingString = remapped;
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            41 => {
                if (negate) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            42 => {
                hint_value = SDL_GetHint_REAL(@ptrCast(@alignCast(&hint)));
                if (!(hint_value != null)) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            43 => {
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            44 => {
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            45 => {
                remapped = SDL_ConvertMappingToPositionalBAXY(mappingString);
                if (!(remapped != null)) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            46 => {
                {
                    sdl_pc = 43;
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
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            49 => {
                mappingString = remapped;
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            50 => {
                hint_value = SDL_getenv_unsafe_REAL(@ptrCast(@alignCast(&hint)));
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
                value = SDL_GetStringBoolean(hint_value, default_value);
                if (negate) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 54;
                    continue;
                }
            },
            53 => {
                value = !value;
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
                if (!value) {
                    sdl_pc = 56;
                    continue;
                } else {
                    sdl_pc = 57;
                    continue;
                }
            },
            56 => {
                result = 0;
                {
                    sdl_pc = 1;
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
                    sdl_pc = 43;
                    continue;
                }
            },
            59 => {
                {
                    sdl_pc = 1;
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
                if (existing) {
                    sdl_pc = 62;
                    continue;
                } else {
                    sdl_pc = 63;
                    continue;
                }
            },
            62 => {
                result = 0;
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            63 => {
                if (is_default_mapping) {
                    sdl_pc = 65;
                    continue;
                } else {
                    sdl_pc = 66;
                    continue;
                }
            },
            64 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            65 => {
                s_pDefaultMapping = pGamepadMapping;
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            66 => {
                if (is_xinput_mapping) {
                    sdl_pc = 68;
                    continue;
                } else {
                    sdl_pc = 69;
                    continue;
                }
            },
            67 => {
                result = 1;
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            68 => {
                s_pXInputMapping = pGamepadMapping;
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
            else => unreachable,
        }
    }
}
pub export fn SDL_AddGamepadMapping_REAL(mapping: [*c]const u8) c_int {
    @setEvalBranchQuota(100000);
    var result: c_int = undefined;
    _ = &result;
    SDL_LockJoysticks_REAL();
    {
        result = SDL_PrivateAddGamepadMapping(mapping, SDL_GAMEPAD_MAPPING_PRIORITY_API);
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub fn CreateMappingString(mapping: [*c]GamepadMapping_t, guid: SDL_GUID) callconv(.c) [*c]u8 {
    @setEvalBranchQuota(100000);
    var pMappingString: [*c]u8 = undefined;
    _ = &pMappingString;
    var pPlatformString: [*c]u8 = undefined;
    _ = &pPlatformString;
    var pchGUID: [33]u8 = undefined;
    _ = &pchGUID;
    var needed: usize = undefined;
    _ = &needed;
    var need_platform: bool = @"false" != 0;
    _ = &need_platform;
    var platform: [*c]const u8 = null;
    _ = &platform;
    SDL_AssertJoysticksLocked();
    SDL_GUIDToString_REAL(guid, @ptrCast(@alignCast(&pchGUID)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(pchGUID))))));
    needed = ((((SDL_strlen_REAL(@ptrCast(@alignCast(&pchGUID))) +% @as(usize, 1)) +% SDL_strlen_REAL(mapping.*.name)) +% @as(usize, 1)) +% SDL_strlen_REAL(mapping.*.mapping)) +% @as(usize, 1);
    if (!(SDL_strstr_REAL(mapping.*.mapping, "platform:") != null)) {
        need_platform = @"true" != 0;
        if (@as(c_int, mapping.*.mapping[SDL_strlen_REAL(mapping.*.mapping) -% @as(usize, 1)]) != @as(c_int, ',')) {
            needed +%= 1;
        }
        platform = SDL_GetPlatform_REAL();
        needed +%= (SDL_strlen_REAL("platform:") +% SDL_strlen_REAL(platform)) +% @as(usize, 1);
    }
    pMappingString = @ptrCast(@alignCast(SDL_malloc_REAL(needed)));
    if (!(pMappingString != null)) {
        return null;
    }
    _ = SDL_snprintf_REAL(pMappingString, needed, "%s,%s,%s", @as([*c]u8, @ptrCast(@alignCast(&pchGUID))), mapping.*.name, mapping.*.mapping);
    if (need_platform) {
        if (@as(c_int, mapping.*.mapping[SDL_strlen_REAL(mapping.*.mapping) -% @as(usize, 1)]) != @as(c_int, ',')) {
            _ = SDL_strlcat_REAL(pMappingString, ",", needed);
        }
        _ = SDL_strlcat_REAL(pMappingString, "platform:", needed);
        _ = SDL_strlcat_REAL(pMappingString, platform, needed);
        _ = SDL_strlcat_REAL(pMappingString, ",", needed);
    }
    pPlatformString = SDL_strstr_REAL(pMappingString, "platform:");
    if (pPlatformString != null) {
        pPlatformString = SDL_strstr_REAL(pPlatformString + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1))))), "platform:");
        if (pPlatformString != null) {
            pPlatformString.* = '\x00';
        }
    }
    return pMappingString;
}
pub export fn SDL_GetGamepadMappings_REAL(count: [*c]c_int) [*c][*c]u8 {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [27:0]u8 = "SDL_GetGamepadMappings_REAL".*;
    };
    _ = &static_local___func__;
    var num_mappings: c_int = 0;
    _ = &num_mappings;
    var result: [*c][*c]u8 = null;
    _ = &result;
    var mappings: [*c][*c]u8 = null;
    _ = &mappings;
    if (count != null) {
        count.* = 0;
    }
    SDL_LockJoysticks_REAL();
    {
        var mapping: [*c]GamepadMapping_t = s_pSupportedGamepads;
        _ = &mapping;
        while (mapping != null) : (mapping = mapping.*.next) {
            if (SDL_memcmp_REAL(@ptrCast(@alignCast(&mapping.*.guid)), @ptrCast(@alignCast(&s_zeroGUID)), @sizeOf(@TypeOf(mapping.*.guid))) == @as(c_int, 0)) {
                continue;
            }
            num_mappings += 1;
        }
    }
    var final_allocation: usize = @sizeOf([*c]u8);
    _ = &final_allocation;
    var failed: bool = @"false" != 0;
    _ = &failed;
    mappings = @ptrCast(@alignCast(SDL_calloc_REAL(@bitCast(@as(c_long, num_mappings + @as(c_int, 1))), @sizeOf([*c]u8))));
    if (!(mappings != null)) {
        failed = @"true" != 0;
    } else {
        var i: c_int = 0;
        _ = &i;
        {
            var mapping: [*c]GamepadMapping_t = s_pSupportedGamepads;
            _ = &mapping;
            while (mapping != null) : (mapping = mapping.*.next) {
                if (SDL_memcmp_REAL(@ptrCast(@alignCast(&mapping.*.guid)), @ptrCast(@alignCast(&s_zeroGUID)), @sizeOf(@TypeOf(mapping.*.guid))) == @as(c_int, 0)) {
                    continue;
                }
                var mappingstr: [*c]u8 = CreateMappingString(mapping, mapping.*.guid);
                _ = &mappingstr;
                if (!(mappingstr != null)) {
                    failed = @"true" != 0;
                    break;
                }
                while (true) {
                    while (!(i < num_mappings)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "i < num_mappings",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gamepad.c", 2849);
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
                mappings[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &i;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = mappingstr;
                final_allocation +%= (SDL_strlen_REAL(mappingstr) +% @as(usize, 1)) +% @sizeOf([*c]u8);
            }
        }
    }
    SDL_UnlockJoysticks_REAL();
    if (!failed) {
        result = @ptrCast(@alignCast(SDL_malloc_REAL(final_allocation)));
        if (result != null) {
            final_allocation -%= (@sizeOf([*c]u8) *% @as(c_ulong, @bitCast(@as(c_long, num_mappings)))) +% @as(c_ulong, 1);
            var strptr: [*c]u8 = @ptrCast(@alignCast(result + @as(usize, @bitCast(@as(isize, @intCast(num_mappings + @as(c_int, 1)))))));
            _ = &strptr;
            {
                var i: c_int = 0;
                _ = &i;
                while (i < num_mappings) : (i += 1) {
                    result[@bitCast(@as(isize, @intCast(i)))] = strptr;
                    const slen: usize = SDL_strlcpy_REAL(strptr, mappings[@bitCast(@as(isize, @intCast(i)))], final_allocation) +% @as(usize, 1);
                    _ = &slen;
                    while (true) {
                        while (!(final_allocation >= slen)) {
                            const static_local_sdl_assert_data = struct {
                                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                    .always_ignore = @"false" != 0,
                                    .trigger_count = 0,
                                    .condition = "final_allocation >= slen",
                                    .filename = null,
                                    .linenum = 0,
                                    .function = null,
                                    .next = null,
                                };
                            };
                            _ = &static_local_sdl_assert_data;
                            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gamepad.c", 2866);
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
                    final_allocation -%= slen;
                    strptr += slen;
                }
            }
            result[@bitCast(@as(isize, @intCast(num_mappings)))] = null;
            if (count != null) {
                count.* = num_mappings;
            }
        }
    }
    if (mappings != null) {
        {
            var i: c_int = 0;
            _ = &i;
            while (i < num_mappings) : (i += 1) {
                SDL_free_REAL(@ptrCast(@alignCast(mappings[@bitCast(@as(isize, @intCast(i)))])));
            }
        }
        SDL_free_REAL(@ptrCast(@alignCast(mappings)));
    }
    return result;
}
pub export fn SDL_GetGamepadMappingForGUID_REAL(guid: SDL_GUID) [*c]u8 {
    @setEvalBranchQuota(100000);
    var result: [*c]u8 = undefined;
    _ = &result;
    SDL_LockJoysticks_REAL();
    {
        var mapping: [*c]GamepadMapping_t = SDL_PrivateGetGamepadMappingForGUID(guid, @"false" != 0);
        _ = &mapping;
        if (mapping != null) {
            result = CreateMappingString(mapping, guid);
        } else {
            _ = SDL_SetError_REAL("Mapping not available");
            result = null;
        }
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_GetGamepadMapping_REAL(gamepad: [*c]SDL_Gamepad) [*c]u8 {
    @setEvalBranchQuota(100000);
    var result: [*c]u8 = undefined;
    _ = &result;
    SDL_LockJoysticks_REAL();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(gamepad)), SDL_OBJECT_TYPE_GAMEPAD) or !SDL_IsJoystickValid(gamepad.*.joystick)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("gamepad"))));
            SDL_UnlockJoysticks_REAL();
            return null;
        }
        result = CreateMappingString(gamepad.*.mapping, gamepad.*.joystick.*.guid);
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_SetGamepadMapping_REAL(instance_id: SDL_JoystickID, arg_mapping: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    var mapping = arg_mapping;
    _ = &mapping;
    var guid: SDL_GUID = SDL_GetJoystickGUIDForID_REAL(instance_id);
    _ = &guid;
    var result: bool = @"false" != 0;
    _ = &result;
    if (SDL_memcmp_REAL(@ptrCast(@alignCast(&guid)), @ptrCast(@alignCast(&s_zeroGUID)), @sizeOf(@TypeOf(guid))) == @as(c_int, 0)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("instance_id"))));
    }
    if (!(mapping != null)) {
        mapping = "*,*,";
    }
    SDL_LockJoysticks_REAL();
    {
        if (SDL_PrivateAddMappingForGUID(guid, mapping, null, SDL_GAMEPAD_MAPPING_PRIORITY_API) != null) {
            result = @"true" != 0;
        }
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub fn SDL_LoadGamepadHints() callconv(.c) void {
    @setEvalBranchQuota(100000);
    var hint: [*c]const u8 = SDL_GetHint_REAL("SDL_GAMECONTROLLERCONFIG");
    _ = &hint;
    if ((hint != null) and (@as(c_int, hint[@as(c_int, 0)]) != 0)) {
        var pTempMappings: [*c]u8 = SDL_strdup_REAL(hint);
        _ = &pTempMappings;
        var pUserMappings: [*c]u8 = pTempMappings;
        _ = &pUserMappings;
        PushMappingChangeTracking();
        while (pUserMappings != null) {
            var pchNewLine: [*c]u8 = null;
            _ = &pchNewLine;
            pchNewLine = SDL_strchr_REAL(pUserMappings, '\n');
            if (pchNewLine != null) {
                pchNewLine.* = '\x00';
            }
            _ = SDL_PrivateAddGamepadMapping(pUserMappings, SDL_GAMEPAD_MAPPING_PRIORITY_USER);
            if (pchNewLine != null) {
                pUserMappings = pchNewLine + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
            } else {
                pUserMappings = null;
            }
        }
        PopMappingChangeTracking();
        SDL_free_REAL(@ptrCast(@alignCast(pTempMappings)));
    }
}
pub fn SDL_GetGamepadMappingFilePath(path: [*c]u8, size: usize) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var hint: [*c]const u8 = SDL_GetHint_REAL("SDL_GAMECONTROLLERCONFIG_FILE");
    _ = &hint;
    if ((hint != null) and (@as(c_int, hint.*) != 0)) {
        return SDL_strlcpy_REAL(path, hint, size) < size;
    }
    return @"false" != 0;
}
pub export fn SDL_InitGamepadMappings() bool {
    @setEvalBranchQuota(100000);
    var szGamepadMapPath: [1024]u8 = undefined;
    _ = &szGamepadMapPath;
    var i: c_int = 0;
    _ = &i;
    var pMappingString: [*c]const u8 = null;
    _ = &pMappingString;
    SDL_AssertJoysticksLocked();
    PushMappingChangeTracking();
    pMappingString = s_GamepadMappings[@bitCast(@as(isize, @intCast(i)))];
    while (pMappingString != null) {
        _ = SDL_PrivateAddGamepadMapping(pMappingString, SDL_GAMEPAD_MAPPING_PRIORITY_DEFAULT);
        i += 1;
        pMappingString = s_GamepadMappings[@bitCast(@as(isize, @intCast(i)))];
    }
    if (SDL_GetGamepadMappingFilePath(@ptrCast(@alignCast(&szGamepadMapPath)), @sizeOf(@TypeOf(szGamepadMapPath)))) {
        _ = SDL_AddGamepadMappingsFromFile_REAL(@ptrCast(@alignCast(&szGamepadMapPath)));
    }
    SDL_LoadGamepadHints();
    SDL_LoadVIDPIDList(&SDL_allowed_gamepads);
    SDL_LoadVIDPIDList(&SDL_ignored_gamepads);
    PopMappingChangeTracking();
    return @"true" != 0;
}
pub export fn SDL_InitGamepads() bool {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var joysticks: [*c]SDL_JoystickID = undefined;
    _ = &joysticks;
    SDL_gamepads_initialized = @"true" != 0;
    SDL_LockJoysticks_REAL();
    SDL_gamepad_names = SDL_CreateHashTable(0, @"false" != 0, SDL_HashID, SDL_KeyMatchID, SDL_DestroyHashValue, null);
    _ = SDL_AddEventWatch_REAL(SDL_GamepadEventWatcher, null);
    joysticks = SDL_GetJoysticks_REAL(null);
    if (joysticks != null) {
        {
            i = 0;
            while (joysticks[@bitCast(@as(isize, @intCast(i)))] != 0) : (i += 1) {
                if (SDL_IsGamepad_REAL(joysticks[@bitCast(@as(isize, @intCast(i)))])) {
                    SDL_PrivateGamepadAdded(joysticks[@bitCast(@as(isize, @intCast(i)))]);
                }
            }
        }
        SDL_free_REAL(@ptrCast(@alignCast(joysticks)));
    }
    SDL_UnlockJoysticks_REAL();
    return @"true" != 0;
}
pub export fn SDL_HasGamepad_REAL() bool {
    @setEvalBranchQuota(100000);
    var num_joysticks: c_int = 0;
    _ = &num_joysticks;
    var num_gamepads: c_int = 0;
    _ = &num_gamepads;
    var joysticks: [*c]SDL_JoystickID = SDL_GetJoysticks_REAL(&num_joysticks);
    _ = &joysticks;
    if (joysticks != null) {
        var i: c_int = undefined;
        _ = &i;
        {
            i = num_joysticks - @as(c_int, 1);
            while ((i >= @as(c_int, 0)) and (num_gamepads == @as(c_int, 0))) : (i -= 1) {
                if (SDL_IsGamepad_REAL(joysticks[@bitCast(@as(isize, @intCast(i)))])) {
                    num_gamepads += 1;
                }
            }
        }
        SDL_free_REAL(@ptrCast(@alignCast(joysticks)));
    }
    if (num_gamepads > @as(c_int, 0)) {
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub export fn SDL_GetGamepads_REAL(count: [*c]c_int) [*c]SDL_JoystickID {
    @setEvalBranchQuota(100000);
    var num_joysticks: c_int = 0;
    _ = &num_joysticks;
    var num_gamepads: c_int = 0;
    _ = &num_gamepads;
    var joysticks: [*c]SDL_JoystickID = SDL_GetJoysticks_REAL(&num_joysticks);
    _ = &joysticks;
    if (joysticks != null) {
        var i: c_int = undefined;
        _ = &i;
        {
            i = num_joysticks - @as(c_int, 1);
            while (i >= @as(c_int, 0)) : (i -= 1) {
                if (SDL_IsGamepad_REAL(joysticks[@bitCast(@as(isize, @intCast(i)))])) {
                    num_gamepads += 1;
                } else {
                    _ = memmove(@ptrCast(@alignCast(&joysticks[@bitCast(@as(isize, @intCast(i)))])), @ptrCast(@alignCast(&joysticks[@bitCast(@as(isize, @intCast(i + @as(c_int, 1))))])), @as(c_ulong, @bitCast(@as(c_long, num_gamepads + @as(c_int, 1)))) *% @sizeOf(@TypeOf(joysticks[@bitCast(@as(isize, @intCast(i)))])));
                }
            }
        }
    }
    if (count != null) {
        count.* = num_gamepads;
    }
    return joysticks;
}
pub export fn SDL_GetGamepadNameForID_REAL(instance_id: SDL_JoystickID) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var result: [*c]const u8 = undefined;
    _ = &result;
    SDL_LockJoysticks_REAL();
    result = SDL_UpdateGamepadNameForID(instance_id);
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_GetGamepadPathForID_REAL(instance_id: SDL_JoystickID) [*c]const u8 {
    @setEvalBranchQuota(100000);
    return SDL_GetJoystickPathForID_REAL(instance_id);
}
pub export fn SDL_GetGamepadPlayerIndexForID_REAL(instance_id: SDL_JoystickID) c_int {
    @setEvalBranchQuota(100000);
    return SDL_GetJoystickPlayerIndexForID_REAL(instance_id);
}
pub export fn SDL_GetGamepadGUIDForID_REAL(instance_id: SDL_JoystickID) SDL_GUID {
    @setEvalBranchQuota(100000);
    return SDL_GetJoystickGUIDForID_REAL(instance_id);
}
pub export fn SDL_GetGamepadVendorForID_REAL(instance_id: SDL_JoystickID) Uint16 {
    @setEvalBranchQuota(100000);
    return SDL_GetJoystickVendorForID_REAL(instance_id);
}
pub export fn SDL_GetGamepadProductForID_REAL(instance_id: SDL_JoystickID) Uint16 {
    @setEvalBranchQuota(100000);
    return SDL_GetJoystickProductForID_REAL(instance_id);
}
pub export fn SDL_GetGamepadProductVersionForID_REAL(instance_id: SDL_JoystickID) Uint16 {
    @setEvalBranchQuota(100000);
    return SDL_GetJoystickProductVersionForID_REAL(instance_id);
}
pub export fn SDL_GetGamepadTypeForID_REAL(instance_id: SDL_JoystickID) SDL_GamepadType {
    @setEvalBranchQuota(100000);
    var @"type": SDL_GamepadType = SDL_GAMEPAD_TYPE_UNKNOWN;
    _ = &@"type";
    SDL_LockJoysticks_REAL();
    {
        var mapping: [*c]GamepadMapping_t = SDL_PrivateGetGamepadMapping(instance_id, @"true" != 0);
        _ = &mapping;
        if (mapping != null) {
            var type_string: [*c]u8 = undefined;
            _ = &type_string;
            var comma: [*c]u8 = undefined;
            _ = &comma;
            type_string = SDL_strstr_REAL(mapping.*.mapping, "type:");
            if (type_string != null) {
                type_string += SDL_strlen_REAL("type:");
                comma = SDL_strchr_REAL(type_string, ',');
                if (comma != null) {
                    comma.* = '\x00';
                    @"type" = SDL_GetGamepadTypeFromString_REAL(type_string);
                    comma.* = ',';
                }
            }
        }
    }
    SDL_UnlockJoysticks_REAL();
    if (@"type" != @as(SDL_GamepadType, SDL_GAMEPAD_TYPE_UNKNOWN)) {
        return @"type";
    }
    return SDL_GetRealGamepadTypeForID_REAL(instance_id);
}
pub export fn SDL_GetRealGamepadTypeForID_REAL(instance_id: SDL_JoystickID) SDL_GamepadType {
    @setEvalBranchQuota(100000);
    var @"type": SDL_GamepadType = SDL_GAMEPAD_TYPE_UNKNOWN;
    _ = &@"type";
    var info: [*c]const SDL_SteamVirtualGamepadInfo = undefined;
    _ = &info;
    SDL_LockJoysticks_REAL();
    {
        info = SDL_GetJoystickVirtualGamepadInfoForID(instance_id);
        if (info != null) {
            @"type" = info.*.type;
        } else {
            @"type" = SDL_GetGamepadTypeFromGUID(SDL_GetJoystickGUIDForID_REAL(instance_id), SDL_GetJoystickNameForID_REAL(instance_id));
        }
    }
    SDL_UnlockJoysticks_REAL();
    return @"type";
}
pub export fn SDL_GetGamepadMappingForID_REAL(instance_id: SDL_JoystickID) [*c]u8 {
    @setEvalBranchQuota(100000);
    var result: [*c]u8 = null;
    _ = &result;
    SDL_LockJoysticks_REAL();
    {
        var mapping: [*c]GamepadMapping_t = SDL_PrivateGetGamepadMapping(instance_id, @"true" != 0);
        _ = &mapping;
        if (mapping != null) {
            var pchGUID: [33]u8 = undefined;
            _ = &pchGUID;
            var guid: SDL_GUID = SDL_GetJoystickGUIDForID_REAL(instance_id);
            _ = &guid;
            SDL_GUIDToString_REAL(guid, @ptrCast(@alignCast(&pchGUID)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(pchGUID))))));
            _ = SDL_asprintf_REAL(&result, "%s,%s,%s", @as([*c]u8, @ptrCast(@alignCast(&pchGUID))), mapping.*.name, mapping.*.mapping);
        }
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_IsGamepadNameAndGUID(name: [*c]const u8, guid: SDL_GUID) bool {
    @setEvalBranchQuota(100000);
    var result: bool = undefined;
    _ = &result;
    SDL_LockJoysticks_REAL();
    {
        if ((s_pDefaultMapping != null) or (@as(?*anyopaque, @ptrCast(@alignCast(SDL_PrivateGetGamepadMappingForNameAndGUID(name, guid)))) != @as(?*anyopaque, null))) {
            result = @"true" != 0;
        } else {
            result = @"false" != 0;
        }
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_IsGamepad_REAL(instance_id: SDL_JoystickID) bool {
    @setEvalBranchQuota(100000);
    var result: bool = undefined;
    _ = &result;
    SDL_LockJoysticks_REAL();
    {
        var value: ?*const anyopaque = undefined;
        _ = &value;
        if ((s_gamepadInstanceIDs != null) and SDL_FindInHashTable(s_gamepadInstanceIDs, @ptrFromInt(@as(usize, instance_id)), &value)) {
            result = @as(usize, @intCast(@intFromPtr(value))) != 0;
        } else {
            if (@as(?*anyopaque, @ptrCast(@alignCast(SDL_PrivateGetGamepadMapping(instance_id, @"true" != 0)))) != @as(?*anyopaque, null)) {
                result = @"true" != 0;
            } else {
                result = @"false" != 0;
            }
            if (!(s_gamepadInstanceIDs != null)) {
                s_gamepadInstanceIDs = SDL_CreateHashTable(0, @"false" != 0, SDL_HashID, SDL_KeyMatchID, null, null);
            }
            if (s_gamepadInstanceIDs != null) {
                _ = SDL_InsertIntoHashTable(s_gamepadInstanceIDs, @ptrFromInt(@as(usize, instance_id)), @ptrFromInt(@as(usize, @intFromBool(result))), @"true" != 0);
            }
        }
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_ShouldIgnoreGamepad(vendor_id: Uint16, product_id: Uint16, version: Uint16, name: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var blacklist_word: [*c]const struct_SDL_GamepadBlacklistWords = undefined;
    _ = &blacklist_word;
    var hint: [*c]const u8 = undefined;
    _ = &hint;
    var allow_steam_virtual_gamepad: bool = undefined;
    _ = &allow_steam_virtual_gamepad;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (name != null) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                i = 0;
                {
                    sdl_pc = 4;
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
                hint = SDL_getenv_unsafe_REAL("SDL_GAMECONTROLLER_ALLOW_STEAM_VIRTUAL_GAMEPAD");
                allow_steam_virtual_gamepad = SDL_GetStringBoolean(hint, @"false" != 0);
                if (SDL_IsJoystickSteamVirtualGamepad(vendor_id, product_id, version)) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            4 => {
                if (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(SDL_gamepad_blacklist_words)) / @sizeOf(@TypeOf(SDL_gamepad_blacklist_words[@as(c_int, 0)])))) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 7;
                    continue;
                }
            },
            5 => {
                blacklist_word = &SDL_gamepad_blacklist_words[@bitCast(@as(isize, @intCast(i)))];
                switch (blacklist_word.*.pos) {
                    @as(enum_SDL_GamepadBlacklistWordsPosition, GAMEPAD_BLACKLIST_BEGIN) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(enum_SDL_GamepadBlacklistWordsPosition, GAMEPAD_BLACKLIST_END) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(enum_SDL_GamepadBlacklistWordsPosition, GAMEPAD_BLACKLIST_ANYWHERE) => {
                        sdl_pc = 17;
                        continue;
                    },
                    else => {
                        sdl_pc = 8;
                        continue;
                    },
                }
            },
            6 => {
                i += 1;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            7 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            8 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            9 => {
                if (SDL_startswith(name, blacklist_word.*.str)) {
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
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            13 => {
                if (SDL_endswith(name, blacklist_word.*.str)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                return @"true" != 0;
            },
            15 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            17 => {
                if (@as(?*anyopaque, @ptrCast(@alignCast(SDL_strstr_REAL(name, blacklist_word.*.str)))) != @as(?*anyopaque, null)) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            18 => {
                if (SDL_startswith(name, "PG-")) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
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
                    sdl_pc = 8;
                    continue;
                }
            },
            21 => {
                {
                    sdl_pc = 8;
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
                return !allow_steam_virtual_gamepad;
            },
            25 => {
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            26 => {
                if (SDL_allowed_gamepads.num_included_entries > @as(c_int, 0)) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            27 => {
                if (SDL_VIDPIDInList(vendor_id, product_id, &SDL_allowed_gamepads)) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            28 => {
                if (SDL_VIDPIDInList(vendor_id, product_id, &SDL_ignored_gamepads)) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 34;
                    continue;
                }
            },
            29 => {
                unreachable;
            },
            30 => {
                return @"false" != 0;
            },
            31 => {
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            32 => {
                return @"true" != 0;
            },
            33 => {
                return @"true" != 0;
            },
            34 => {
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            35 => {
                return @"false" != 0;
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_OpenGamepad_REAL(instance_id: SDL_JoystickID) [*c]SDL_Gamepad {
    @setEvalBranchQuota(100000);
    var gamepad: [*c]SDL_Gamepad = undefined;
    _ = &gamepad;
    var gamepadlist: [*c]SDL_Gamepad = undefined;
    _ = &gamepadlist;
    var pSupportedGamepad: [*c]GamepadMapping_t = null;
    _ = &pSupportedGamepad;
    SDL_LockJoysticks_REAL();
    gamepadlist = SDL_gamepads;
    while (gamepadlist != null) {
        if (instance_id == gamepadlist.*.joystick.*.instance_id) {
            gamepad = gamepadlist;
            gamepad.*.ref_count += 1;
            SDL_UnlockJoysticks_REAL();
            return gamepad;
        }
        gamepadlist = gamepadlist.*.next;
    }
    pSupportedGamepad = SDL_PrivateGetGamepadMapping(instance_id, @"true" != 0);
    if (!(pSupportedGamepad != null)) {
        _ = SDL_SetError_REAL("Couldn't find mapping for device (%u)", instance_id);
        SDL_UnlockJoysticks_REAL();
        return null;
    }
    gamepad = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(gamepad.*)))));
    if (!(gamepad != null)) {
        SDL_UnlockJoysticks_REAL();
        return null;
    }
    SDL_SetObjectValid(@ptrCast(@alignCast(gamepad)), SDL_OBJECT_TYPE_GAMEPAD, @"true" != 0);
    gamepad.*.joystick = SDL_OpenJoystick_REAL(instance_id);
    if (!(gamepad.*.joystick != null)) {
        SDL_SetObjectValid(@ptrCast(@alignCast(gamepad)), SDL_OBJECT_TYPE_GAMEPAD, @"false" != 0);
        SDL_free_REAL(@ptrCast(@alignCast(gamepad)));
        SDL_UnlockJoysticks_REAL();
        return null;
    }
    if (gamepad.*.joystick.*.naxes != 0) {
        gamepad.*.last_match_axis = @ptrCast(@alignCast(SDL_calloc_REAL(@bitCast(@as(c_long, gamepad.*.joystick.*.naxes)), @sizeOf(@TypeOf(gamepad.*.last_match_axis.*)))));
        if (!(gamepad.*.last_match_axis != null)) {
            SDL_SetObjectValid(@ptrCast(@alignCast(gamepad)), SDL_OBJECT_TYPE_GAMEPAD, @"false" != 0);
            SDL_CloseJoystick_REAL(gamepad.*.joystick);
            SDL_free_REAL(@ptrCast(@alignCast(gamepad)));
            SDL_UnlockJoysticks_REAL();
            return null;
        }
    }
    if (gamepad.*.joystick.*.nhats != 0) {
        gamepad.*.last_hat_mask = @ptrCast(@alignCast(SDL_calloc_REAL(@bitCast(@as(c_long, gamepad.*.joystick.*.nhats)), @sizeOf(@TypeOf(gamepad.*.last_hat_mask.*)))));
        if (!(gamepad.*.last_hat_mask != null)) {
            SDL_SetObjectValid(@ptrCast(@alignCast(gamepad)), SDL_OBJECT_TYPE_GAMEPAD, @"false" != 0);
            SDL_CloseJoystick_REAL(gamepad.*.joystick);
            SDL_free_REAL(@ptrCast(@alignCast(gamepad.*.last_match_axis)));
            SDL_free_REAL(@ptrCast(@alignCast(gamepad)));
            SDL_UnlockJoysticks_REAL();
            return null;
        }
    }
    SDL_PrivateLoadButtonMapping(gamepad, pSupportedGamepad);
    gamepad.*.ref_count += 1;
    gamepad.*.next = SDL_gamepads;
    SDL_gamepads = gamepad;
    SDL_UnlockJoysticks_REAL();
    return gamepad;
}
pub export fn SDL_UpdateGamepads_REAL() void {
    @setEvalBranchQuota(100000);
    SDL_UpdateJoysticks_REAL();
}
pub export fn SDL_GamepadHasAxis_REAL(gamepad: [*c]SDL_Gamepad, axis: SDL_GamepadAxis) bool {
    @setEvalBranchQuota(100000);
    var result: bool = @"false" != 0;
    _ = &result;
    SDL_LockJoysticks_REAL();
    {
        var i: c_int = undefined;
        _ = &i;
        if (!SDL_ObjectValid(@ptrCast(@alignCast(gamepad)), SDL_OBJECT_TYPE_GAMEPAD) or !SDL_IsJoystickValid(gamepad.*.joystick)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("gamepad"))));
            SDL_UnlockJoysticks_REAL();
            return @"false" != 0;
        }
        {
            i = 0;
            while (i < gamepad.*.num_bindings) : (i += 1) {
                var binding: [*c]const SDL_GamepadBinding = &gamepad.*.bindings[@bitCast(@as(isize, @intCast(i)))];
                _ = &binding;
                if ((binding.*.output_type == @as(SDL_GamepadBindingType, SDL_GAMEPAD_BINDTYPE_AXIS)) and (binding.*.output.axis.axis == axis)) {
                    result = @"true" != 0;
                    break;
                }
            }
        }
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_GetGamepadAxis_REAL(gamepad: [*c]SDL_Gamepad, axis: SDL_GamepadAxis) Sint16 {
    @setEvalBranchQuota(100000);
    var result: Sint16 = 0;
    _ = &result;
    SDL_LockJoysticks_REAL();
    {
        var i: c_int = undefined;
        _ = &i;
        if (!SDL_ObjectValid(@ptrCast(@alignCast(gamepad)), SDL_OBJECT_TYPE_GAMEPAD) or !SDL_IsJoystickValid(gamepad.*.joystick)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("gamepad"))));
            SDL_UnlockJoysticks_REAL();
            return 0;
        }
        {
            i = 0;
            while (i < gamepad.*.num_bindings) : (i += 1) {
                var binding: [*c]const SDL_GamepadBinding = &gamepad.*.bindings[@bitCast(@as(isize, @intCast(i)))];
                _ = &binding;
                if ((binding.*.output_type == @as(SDL_GamepadBindingType, SDL_GAMEPAD_BINDTYPE_AXIS)) and (binding.*.output.axis.axis == axis)) {
                    var value: c_int = 0;
                    _ = &value;
                    var valid_input_range: bool = undefined;
                    _ = &valid_input_range;
                    var valid_output_range: bool = undefined;
                    _ = &valid_output_range;
                    if (binding.*.input_type == @as(SDL_GamepadBindingType, SDL_GAMEPAD_BINDTYPE_AXIS)) {
                        const input_axis: c_int = binding.*.input.axis.axis;
                        _ = &input_axis;
                        if ((input_axis < @as(c_int, 0)) or (input_axis >= gamepad.*.joystick.*.naxes)) {
                            continue;
                        }
                        value = SDL_GetJoystickAxis_REAL(gamepad.*.joystick, input_axis);
                        if (binding.*.input.axis.axis_min < binding.*.input.axis.axis_max) {
                            valid_input_range = (value >= binding.*.input.axis.axis_min) and (value <= binding.*.input.axis.axis_max);
                        } else {
                            valid_input_range = (value >= binding.*.input.axis.axis_max) and (value <= binding.*.input.axis.axis_min);
                        }
                        if (valid_input_range) {
                            if ((binding.*.input.axis.axis_min != binding.*.output.axis.axis_min) or (binding.*.input.axis.axis_max != binding.*.output.axis.axis_max)) {
                                var normalized_value: f32 = @as(f32, @floatFromInt(value - binding.*.input.axis.axis_min)) / @as(f32, @floatFromInt(binding.*.input.axis.axis_max - binding.*.input.axis.axis_min));
                                _ = &normalized_value;
                                value = binding.*.output.axis.axis_min + @as(c_int, @intFromFloat(normalized_value * @as(f32, @floatFromInt(binding.*.output.axis.axis_max - binding.*.output.axis.axis_min))));
                            }
                        } else {
                            value = 0;
                        }
                    } else if (binding.*.input_type == @as(SDL_GamepadBindingType, SDL_GAMEPAD_BINDTYPE_BUTTON)) {
                        if (SDL_GetJoystickButton_REAL(gamepad.*.joystick, binding.*.input.button)) {
                            value = binding.*.output.axis.axis_max;
                        }
                    } else if (binding.*.input_type == @as(SDL_GamepadBindingType, SDL_GAMEPAD_BINDTYPE_HAT)) {
                        var hat_mask: c_int = SDL_GetJoystickHat_REAL(gamepad.*.joystick, binding.*.input.hat.hat);
                        _ = &hat_mask;
                        if ((hat_mask & binding.*.input.hat.hat_mask) != 0) {
                            value = binding.*.output.axis.axis_max;
                        }
                    }
                    if (binding.*.output.axis.axis_min < binding.*.output.axis.axis_max) {
                        valid_output_range = (value >= binding.*.output.axis.axis_min) and (value <= binding.*.output.axis.axis_max);
                    } else {
                        valid_output_range = (value >= binding.*.output.axis.axis_max) and (value <= binding.*.output.axis.axis_min);
                    }
                    if ((value != @as(c_int, 0)) and valid_output_range) {
                        result = @truncate(value);
                        break;
                    }
                }
            }
        }
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_GamepadHasButton_REAL(gamepad: [*c]SDL_Gamepad, button: SDL_GamepadButton) bool {
    @setEvalBranchQuota(100000);
    var result: bool = @"false" != 0;
    _ = &result;
    SDL_LockJoysticks_REAL();
    {
        var i: c_int = undefined;
        _ = &i;
        if (!SDL_ObjectValid(@ptrCast(@alignCast(gamepad)), SDL_OBJECT_TYPE_GAMEPAD) or !SDL_IsJoystickValid(gamepad.*.joystick)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("gamepad"))));
            SDL_UnlockJoysticks_REAL();
            return @"false" != 0;
        }
        {
            i = 0;
            while (i < gamepad.*.num_bindings) : (i += 1) {
                var binding: [*c]const SDL_GamepadBinding = &gamepad.*.bindings[@bitCast(@as(isize, @intCast(i)))];
                _ = &binding;
                if ((binding.*.output_type == @as(SDL_GamepadBindingType, SDL_GAMEPAD_BINDTYPE_BUTTON)) and (binding.*.output.button == button)) {
                    result = @"true" != 0;
                    break;
                }
            }
        }
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_GetGamepadButton_REAL(gamepad: [*c]SDL_Gamepad, button: SDL_GamepadButton) bool {
    @setEvalBranchQuota(100000);
    var result: bool = @"false" != 0;
    _ = &result;
    SDL_LockJoysticks_REAL();
    {
        var i: c_int = undefined;
        _ = &i;
        if (!SDL_ObjectValid(@ptrCast(@alignCast(gamepad)), SDL_OBJECT_TYPE_GAMEPAD) or !SDL_IsJoystickValid(gamepad.*.joystick)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("gamepad"))));
            SDL_UnlockJoysticks_REAL();
            return @"false" != 0;
        }
        {
            i = 0;
            while (i < gamepad.*.num_bindings) : (i += 1) {
                var binding: [*c]const SDL_GamepadBinding = &gamepad.*.bindings[@bitCast(@as(isize, @intCast(i)))];
                _ = &binding;
                if ((binding.*.output_type == @as(SDL_GamepadBindingType, SDL_GAMEPAD_BINDTYPE_BUTTON)) and (binding.*.output.button == button)) {
                    if (binding.*.input_type == @as(SDL_GamepadBindingType, SDL_GAMEPAD_BINDTYPE_AXIS)) {
                        var valid_input_range: bool = undefined;
                        _ = &valid_input_range;
                        var value: c_int = SDL_GetJoystickAxis_REAL(gamepad.*.joystick, binding.*.input.axis.axis);
                        _ = &value;
                        var threshold: c_int = binding.*.input.axis.axis_min + @divTrunc(binding.*.input.axis.axis_max - binding.*.input.axis.axis_min, @as(c_int, 2));
                        _ = &threshold;
                        if (binding.*.input.axis.axis_min < binding.*.input.axis.axis_max) {
                            valid_input_range = (value >= binding.*.input.axis.axis_min) and (value <= binding.*.input.axis.axis_max);
                            if (valid_input_range) {
                                {
                                    const ref = &result;
                                    ref.* = (@as(c_int, @intFromBool(ref.*)) | @intFromBool(value >= threshold)) != 0;
                                }
                            }
                        } else {
                            valid_input_range = (value >= binding.*.input.axis.axis_max) and (value <= binding.*.input.axis.axis_min);
                            if (valid_input_range) {
                                {
                                    const ref = &result;
                                    ref.* = (@as(c_int, @intFromBool(ref.*)) | @intFromBool(value <= threshold)) != 0;
                                }
                            }
                        }
                    } else if (binding.*.input_type == @as(SDL_GamepadBindingType, SDL_GAMEPAD_BINDTYPE_BUTTON)) {
                        {
                            const ref = &result;
                            ref.* = (@as(c_int, @intFromBool(ref.*)) | @as(c_int, @intFromBool(SDL_GetJoystickButton_REAL(gamepad.*.joystick, binding.*.input.button)))) != 0;
                        }
                    } else if (binding.*.input_type == @as(SDL_GamepadBindingType, SDL_GAMEPAD_BINDTYPE_HAT)) {
                        var hat_mask: c_int = SDL_GetJoystickHat_REAL(gamepad.*.joystick, binding.*.input.hat.hat);
                        _ = &hat_mask;
                        {
                            const ref = &result;
                            ref.* = (@as(c_int, @intFromBool(ref.*)) | @intFromBool((hat_mask & binding.*.input.hat.hat_mask) != @as(c_int, 0))) != 0;
                        }
                    }
                }
            }
        }
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub fn SDL_GetGamepadButtonLabelForFaceStyle(face_style: SDL_GamepadFaceStyle, button: SDL_GamepadButton) callconv(.c) SDL_GamepadButtonLabel {
    @setEvalBranchQuota(100000);
    var label: SDL_GamepadButtonLabel = undefined;
    _ = &label;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                label = SDL_GAMEPAD_BUTTON_LABEL_UNKNOWN;
                switch (face_style) {
                    @as(SDL_GamepadFaceStyle, SDL_GAMEPAD_FACE_STYLE_ABXY) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_GamepadFaceStyle, SDL_GAMEPAD_FACE_STYLE_AXBY) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(SDL_GamepadFaceStyle, SDL_GAMEPAD_FACE_STYLE_BAYX) => {
                        sdl_pc = 16;
                        continue;
                    },
                    @as(SDL_GamepadFaceStyle, SDL_GAMEPAD_FACE_STYLE_SONY) => {
                        sdl_pc = 23;
                        continue;
                    },
                    else => {
                        sdl_pc = 30;
                        continue;
                    },
                }
            },
            1 => {
                return label;
            },
            2 => {
                switch (button) {
                    SDL_GAMEPAD_BUTTON_SOUTH => {
                        sdl_pc = 4;
                        continue;
                    },
                    SDL_GAMEPAD_BUTTON_EAST => {
                        sdl_pc = 5;
                        continue;
                    },
                    SDL_GAMEPAD_BUTTON_WEST => {
                        sdl_pc = 6;
                        continue;
                    },
                    SDL_GAMEPAD_BUTTON_NORTH => {
                        sdl_pc = 7;
                        continue;
                    },
                    else => {
                        sdl_pc = 8;
                        continue;
                    },
                }
            },
            3 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                label = SDL_GAMEPAD_BUTTON_LABEL_A;
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            5 => {
                label = SDL_GAMEPAD_BUTTON_LABEL_B;
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            6 => {
                label = SDL_GAMEPAD_BUTTON_LABEL_X;
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            7 => {
                label = SDL_GAMEPAD_BUTTON_LABEL_Y;
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            8 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            9 => {
                switch (button) {
                    SDL_GAMEPAD_BUTTON_SOUTH => {
                        sdl_pc = 11;
                        continue;
                    },
                    SDL_GAMEPAD_BUTTON_EAST => {
                        sdl_pc = 12;
                        continue;
                    },
                    SDL_GAMEPAD_BUTTON_WEST => {
                        sdl_pc = 13;
                        continue;
                    },
                    SDL_GAMEPAD_BUTTON_NORTH => {
                        sdl_pc = 14;
                        continue;
                    },
                    else => {
                        sdl_pc = 15;
                        continue;
                    },
                }
            },
            10 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            11 => {
                label = SDL_GAMEPAD_BUTTON_LABEL_A;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            12 => {
                label = SDL_GAMEPAD_BUTTON_LABEL_X;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            13 => {
                label = SDL_GAMEPAD_BUTTON_LABEL_B;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            14 => {
                label = SDL_GAMEPAD_BUTTON_LABEL_Y;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            15 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            16 => {
                switch (button) {
                    SDL_GAMEPAD_BUTTON_SOUTH => {
                        sdl_pc = 18;
                        continue;
                    },
                    SDL_GAMEPAD_BUTTON_EAST => {
                        sdl_pc = 19;
                        continue;
                    },
                    SDL_GAMEPAD_BUTTON_WEST => {
                        sdl_pc = 20;
                        continue;
                    },
                    SDL_GAMEPAD_BUTTON_NORTH => {
                        sdl_pc = 21;
                        continue;
                    },
                    else => {
                        sdl_pc = 22;
                        continue;
                    },
                }
            },
            17 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            18 => {
                label = SDL_GAMEPAD_BUTTON_LABEL_B;
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            19 => {
                label = SDL_GAMEPAD_BUTTON_LABEL_A;
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            20 => {
                label = SDL_GAMEPAD_BUTTON_LABEL_Y;
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            21 => {
                label = SDL_GAMEPAD_BUTTON_LABEL_X;
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            22 => {
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            23 => {
                switch (button) {
                    SDL_GAMEPAD_BUTTON_SOUTH => {
                        sdl_pc = 25;
                        continue;
                    },
                    SDL_GAMEPAD_BUTTON_EAST => {
                        sdl_pc = 26;
                        continue;
                    },
                    SDL_GAMEPAD_BUTTON_WEST => {
                        sdl_pc = 27;
                        continue;
                    },
                    SDL_GAMEPAD_BUTTON_NORTH => {
                        sdl_pc = 28;
                        continue;
                    },
                    else => {
                        sdl_pc = 29;
                        continue;
                    },
                }
            },
            24 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            25 => {
                label = SDL_GAMEPAD_BUTTON_LABEL_CROSS;
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            26 => {
                label = SDL_GAMEPAD_BUTTON_LABEL_CIRCLE;
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            27 => {
                label = SDL_GAMEPAD_BUTTON_LABEL_SQUARE;
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            28 => {
                label = SDL_GAMEPAD_BUTTON_LABEL_TRIANGLE;
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            29 => {
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            30 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_GetGamepadButtonLabelForType_REAL(arg_type: SDL_GamepadType, button: SDL_GamepadButton) SDL_GamepadButtonLabel {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    return SDL_GetGamepadButtonLabelForFaceStyle(SDL_GetGamepadFaceStyleForGamepadType(@"type"), button);
}
pub export fn SDL_GetGamepadButtonLabel_REAL(gamepad: [*c]SDL_Gamepad, button: SDL_GamepadButton) SDL_GamepadButtonLabel {
    @setEvalBranchQuota(100000);
    var face_style: SDL_GamepadFaceStyle = undefined;
    _ = &face_style;
    SDL_LockJoysticks_REAL();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(gamepad)), SDL_OBJECT_TYPE_GAMEPAD) or !SDL_IsJoystickValid(gamepad.*.joystick)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("gamepad"))));
            SDL_UnlockJoysticks_REAL();
            return SDL_GAMEPAD_BUTTON_LABEL_UNKNOWN;
        }
        face_style = gamepad.*.face_style;
    }
    SDL_UnlockJoysticks_REAL();
    return SDL_GetGamepadButtonLabelForFaceStyle(face_style, button);
}
pub export fn SDL_GetNumGamepadTouchpads_REAL(gamepad: [*c]SDL_Gamepad) c_int {
    @setEvalBranchQuota(100000);
    var result: c_int = 0;
    _ = &result;
    SDL_LockJoysticks_REAL();
    {
        var joystick: [*c]SDL_Joystick = SDL_GetGamepadJoystick_REAL(gamepad);
        _ = &joystick;
        if (joystick != null) {
            result = joystick.*.ntouchpads;
        }
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_GetNumGamepadTouchpadFingers_REAL(gamepad: [*c]SDL_Gamepad, arg_touchpad: c_int) c_int {
    @setEvalBranchQuota(100000);
    var touchpad = arg_touchpad;
    _ = &touchpad;
    var result: c_int = 0;
    _ = &result;
    SDL_LockJoysticks_REAL();
    {
        var joystick: [*c]SDL_Joystick = SDL_GetGamepadJoystick_REAL(gamepad);
        _ = &joystick;
        if (joystick != null) {
            if ((touchpad >= @as(c_int, 0)) and (touchpad < joystick.*.ntouchpads)) {
                result = joystick.*.touchpads[@bitCast(@as(isize, @intCast(touchpad)))].nfingers;
            }
        }
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_GetGamepadTouchpadFinger_REAL(gamepad: [*c]SDL_Gamepad, arg_touchpad: c_int, arg_finger: c_int, down: [*c]bool, x: [*c]f32, y: [*c]f32, pressure: [*c]f32) bool {
    @setEvalBranchQuota(100000);
    var touchpad = arg_touchpad;
    _ = &touchpad;
    var finger = arg_finger;
    _ = &finger;
    var result: bool = @"false" != 0;
    _ = &result;
    SDL_LockJoysticks_REAL();
    {
        var joystick: [*c]SDL_Joystick = SDL_GetGamepadJoystick_REAL(gamepad);
        _ = &joystick;
        if (joystick != null) {
            if ((touchpad >= @as(c_int, 0)) and (touchpad < joystick.*.ntouchpads)) {
                var touchpad_info: [*c]SDL_JoystickTouchpadInfo = &joystick.*.touchpads[@bitCast(@as(isize, @intCast(touchpad)))];
                _ = &touchpad_info;
                if ((finger >= @as(c_int, 0)) and (finger < touchpad_info.*.nfingers)) {
                    var info: [*c]SDL_JoystickTouchpadFingerInfo = &touchpad_info.*.fingers[@bitCast(@as(isize, @intCast(finger)))];
                    _ = &info;
                    if (down != null) {
                        down.* = info.*.down;
                    }
                    if (x != null) {
                        x.* = info.*.x;
                    }
                    if (y != null) {
                        y.* = info.*.y;
                    }
                    if (pressure != null) {
                        pressure.* = info.*.pressure;
                    }
                    result = @"true" != 0;
                } else {
                    result = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("finger"))));
                }
            } else {
                result = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("touchpad"))));
            }
        }
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_GamepadHasSensor_REAL(gamepad: [*c]SDL_Gamepad, arg_type: SDL_SensorType) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    return SDL_JoystickHasSensor_REAL(SDL_GetGamepadJoystick_REAL(gamepad), @"type");
}
pub export fn SDL_SetGamepadSensorEnabled_REAL(gamepad: [*c]SDL_Gamepad, arg_type: SDL_SensorType, enabled: bool) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    return SDL_SetJoystickSensorEnabled_REAL(SDL_GetGamepadJoystick_REAL(gamepad), @"type", enabled);
}
pub export fn SDL_GamepadSensorEnabled_REAL(gamepad: [*c]SDL_Gamepad, arg_type: SDL_SensorType) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    return SDL_JoystickSensorEnabled_REAL(SDL_GetGamepadJoystick_REAL(gamepad), @"type");
}
pub export fn SDL_GetGamepadSensorDataRate_REAL(gamepad: [*c]SDL_Gamepad, arg_type: SDL_SensorType) f32 {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    return SDL_GetJoystickSensorDataRate_REAL(SDL_GetGamepadJoystick_REAL(gamepad), @"type");
}
pub export fn SDL_GetGamepadSensorData_REAL(gamepad: [*c]SDL_Gamepad, arg_type: SDL_SensorType, data: [*c]f32, num_values: c_int) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    return SDL_GetJoystickSensorData_REAL(SDL_GetGamepadJoystick_REAL(gamepad), @"type", data, num_values);
}
pub export fn SDL_GamepadHasCapSense_REAL(gamepad: [*c]SDL_Gamepad, arg_type: SDL_GamepadCapSenseType) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var result: bool = @"false" != 0;
    _ = &result;
    SDL_LockJoysticks_REAL();
    {
        var joystick: [*c]SDL_Joystick = SDL_GetGamepadJoystick_REAL(gamepad);
        _ = &joystick;
        if (joystick != null) {
            {
                var i: c_int = 0;
                _ = &i;
                while (i < joystick.*.ncapsenses) : (i += 1) {
                    if (joystick.*.capsenses[@bitCast(@as(isize, @intCast(i)))].type == @"type") {
                        result = @"true" != 0;
                        break;
                    }
                }
            }
        }
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_GetGamepadCapSense_REAL(gamepad: [*c]SDL_Gamepad, arg_type: SDL_GamepadCapSenseType) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var result: bool = @"false" != 0;
    _ = &result;
    SDL_LockJoysticks_REAL();
    {
        var joystick: [*c]SDL_Joystick = SDL_GetGamepadJoystick_REAL(gamepad);
        _ = &joystick;
        if (joystick != null) {
            {
                var i: c_int = 0;
                _ = &i;
                while (i < joystick.*.ncapsenses) : (i += 1) {
                    if (joystick.*.capsenses[@bitCast(@as(isize, @intCast(i)))].type == @"type") {
                        result = joystick.*.capsenses[@bitCast(@as(isize, @intCast(i)))].down;
                        break;
                    }
                }
            }
        }
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_GetGamepadID_REAL(gamepad: [*c]SDL_Gamepad) SDL_JoystickID {
    @setEvalBranchQuota(100000);
    var joystick: [*c]SDL_Joystick = SDL_GetGamepadJoystick_REAL(gamepad);
    _ = &joystick;
    if (!(joystick != null)) {
        return 0;
    }
    return SDL_GetJoystickID_REAL(joystick);
}
pub export fn SDL_GetGamepadProperties_REAL(gamepad: [*c]SDL_Gamepad) SDL_PropertiesID {
    @setEvalBranchQuota(100000);
    var result: SDL_PropertiesID = 0;
    _ = &result;
    SDL_LockJoysticks_REAL();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(gamepad)), SDL_OBJECT_TYPE_GAMEPAD) or !SDL_IsJoystickValid(gamepad.*.joystick)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("gamepad"))));
            SDL_UnlockJoysticks_REAL();
            return 0;
        }
        result = SDL_GetJoystickProperties_REAL(gamepad.*.joystick);
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_GetGamepadName_REAL(gamepad: [*c]SDL_Gamepad) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var result: [*c]const u8 = null;
    _ = &result;
    SDL_LockJoysticks_REAL();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(gamepad)), SDL_OBJECT_TYPE_GAMEPAD) or !SDL_IsJoystickValid(gamepad.*.joystick)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("gamepad"))));
            SDL_UnlockJoysticks_REAL();
            return null;
        }
        if ((SDL_strcmp_REAL(gamepad.*.name, "*") == @as(c_int, 0)) or (gamepad.*.joystick.*.steam_handle != @as(Uint64, 0))) {
            result = SDL_GetJoystickName_REAL(gamepad.*.joystick);
        } else {
            result = SDL_GetPersistentString(gamepad.*.name);
        }
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_GetGamepadPath_REAL(gamepad: [*c]SDL_Gamepad) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var joystick: [*c]SDL_Joystick = SDL_GetGamepadJoystick_REAL(gamepad);
    _ = &joystick;
    if (!(joystick != null)) {
        return null;
    }
    return SDL_GetJoystickPath_REAL(joystick);
}
pub export fn SDL_GetGamepadType_REAL(gamepad: [*c]SDL_Gamepad) SDL_GamepadType {
    @setEvalBranchQuota(100000);
    var @"type": SDL_GamepadType = undefined;
    _ = &@"type";
    var info: [*c]const SDL_SteamVirtualGamepadInfo = undefined;
    _ = &info;
    SDL_LockJoysticks_REAL();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(gamepad)), SDL_OBJECT_TYPE_GAMEPAD) or !SDL_IsJoystickValid(gamepad.*.joystick)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("gamepad"))));
            SDL_UnlockJoysticks_REAL();
            return SDL_GAMEPAD_TYPE_UNKNOWN;
        }
        info = SDL_GetJoystickVirtualGamepadInfoForID(gamepad.*.joystick.*.instance_id);
        if (info != null) {
            @"type" = info.*.type;
        } else {
            @"type" = gamepad.*.type;
        }
    }
    SDL_UnlockJoysticks_REAL();
    return @"type";
}
pub export fn SDL_GetRealGamepadType_REAL(gamepad: [*c]SDL_Gamepad) SDL_GamepadType {
    @setEvalBranchQuota(100000);
    var joystick: [*c]SDL_Joystick = SDL_GetGamepadJoystick_REAL(gamepad);
    _ = &joystick;
    if (!(joystick != null)) {
        return SDL_GAMEPAD_TYPE_UNKNOWN;
    }
    return SDL_GetGamepadTypeFromGUID(SDL_GetJoystickGUID_REAL(joystick), SDL_GetJoystickName_REAL(joystick));
}
pub export fn SDL_GetGamepadPlayerIndex_REAL(gamepad: [*c]SDL_Gamepad) c_int {
    @setEvalBranchQuota(100000);
    var joystick: [*c]SDL_Joystick = SDL_GetGamepadJoystick_REAL(gamepad);
    _ = &joystick;
    if (!(joystick != null)) {
        return -@as(c_int, 1);
    }
    return SDL_GetJoystickPlayerIndex_REAL(joystick);
}
pub export fn SDL_SetGamepadPlayerIndex_REAL(gamepad: [*c]SDL_Gamepad, player_index: c_int) bool {
    @setEvalBranchQuota(100000);
    var joystick: [*c]SDL_Joystick = SDL_GetGamepadJoystick_REAL(gamepad);
    _ = &joystick;
    if (!(joystick != null)) {
        return @"false" != 0;
    }
    return SDL_SetJoystickPlayerIndex_REAL(joystick, player_index);
}
pub export fn SDL_GetGamepadVendor_REAL(gamepad: [*c]SDL_Gamepad) Uint16 {
    @setEvalBranchQuota(100000);
    var joystick: [*c]SDL_Joystick = SDL_GetGamepadJoystick_REAL(gamepad);
    _ = &joystick;
    if (!(joystick != null)) {
        return 0;
    }
    return SDL_GetJoystickVendor_REAL(joystick);
}
pub export fn SDL_GetGamepadProduct_REAL(gamepad: [*c]SDL_Gamepad) Uint16 {
    @setEvalBranchQuota(100000);
    var joystick: [*c]SDL_Joystick = SDL_GetGamepadJoystick_REAL(gamepad);
    _ = &joystick;
    if (!(joystick != null)) {
        return 0;
    }
    return SDL_GetJoystickProduct_REAL(joystick);
}
pub export fn SDL_GetGamepadProductVersion_REAL(gamepad: [*c]SDL_Gamepad) Uint16 {
    @setEvalBranchQuota(100000);
    var joystick: [*c]SDL_Joystick = SDL_GetGamepadJoystick_REAL(gamepad);
    _ = &joystick;
    if (!(joystick != null)) {
        return 0;
    }
    return SDL_GetJoystickProductVersion_REAL(joystick);
}
pub export fn SDL_GetGamepadFirmwareVersion_REAL(gamepad: [*c]SDL_Gamepad) Uint16 {
    @setEvalBranchQuota(100000);
    var joystick: [*c]SDL_Joystick = SDL_GetGamepadJoystick_REAL(gamepad);
    _ = &joystick;
    if (!(joystick != null)) {
        return 0;
    }
    return SDL_GetJoystickFirmwareVersion_REAL(joystick);
}
pub export fn SDL_GetGamepadSerial_REAL(gamepad: [*c]SDL_Gamepad) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var joystick: [*c]SDL_Joystick = SDL_GetGamepadJoystick_REAL(gamepad);
    _ = &joystick;
    if (!(joystick != null)) {
        return null;
    }
    return SDL_GetJoystickSerial_REAL(joystick);
}
pub export fn SDL_GetGamepadSteamHandle_REAL(gamepad: [*c]SDL_Gamepad) Uint64 {
    @setEvalBranchQuota(100000);
    var handle: Uint64 = 0;
    _ = &handle;
    SDL_LockJoysticks_REAL();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(gamepad)), SDL_OBJECT_TYPE_GAMEPAD) or !SDL_IsJoystickValid(gamepad.*.joystick)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("gamepad"))));
            SDL_UnlockJoysticks_REAL();
            return 0;
        }
        handle = gamepad.*.joystick.*.steam_handle;
    }
    SDL_UnlockJoysticks_REAL();
    return handle;
}
pub export fn SDL_GetGamepadConnectionState_REAL(gamepad: [*c]SDL_Gamepad) SDL_JoystickConnectionState {
    @setEvalBranchQuota(100000);
    var joystick: [*c]SDL_Joystick = SDL_GetGamepadJoystick_REAL(gamepad);
    _ = &joystick;
    if (!(joystick != null)) {
        return SDL_JOYSTICK_CONNECTION_INVALID;
    }
    return SDL_GetJoystickConnectionState_REAL(joystick);
}
pub export fn SDL_GetGamepadPowerInfo_REAL(gamepad: [*c]SDL_Gamepad, percent: [*c]c_int) SDL_PowerState {
    @setEvalBranchQuota(100000);
    var joystick: [*c]SDL_Joystick = SDL_GetGamepadJoystick_REAL(gamepad);
    _ = &joystick;
    if (percent != null) {
        percent.* = -@as(c_int, 1);
    }
    if (!(joystick != null)) {
        return SDL_POWERSTATE_ERROR;
    }
    return SDL_GetJoystickPowerInfo_REAL(joystick, percent);
}
pub export fn SDL_GamepadConnected_REAL(gamepad: [*c]SDL_Gamepad) bool {
    @setEvalBranchQuota(100000);
    var joystick: [*c]SDL_Joystick = SDL_GetGamepadJoystick_REAL(gamepad);
    _ = &joystick;
    if (!(joystick != null)) {
        return @"false" != 0;
    }
    return SDL_JoystickConnected_REAL(joystick);
}
pub export fn SDL_GetGamepadJoystick_REAL(gamepad: [*c]SDL_Gamepad) [*c]SDL_Joystick {
    @setEvalBranchQuota(100000);
    var joystick: [*c]SDL_Joystick = undefined;
    _ = &joystick;
    SDL_LockJoysticks_REAL();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(gamepad)), SDL_OBJECT_TYPE_GAMEPAD) or !SDL_IsJoystickValid(gamepad.*.joystick)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("gamepad"))));
            SDL_UnlockJoysticks_REAL();
            return null;
        }
        joystick = gamepad.*.joystick;
    }
    SDL_UnlockJoysticks_REAL();
    return joystick;
}
pub export fn SDL_GetGamepadFromID_REAL(joyid: SDL_JoystickID) [*c]SDL_Gamepad {
    @setEvalBranchQuota(100000);
    var gamepad: [*c]SDL_Gamepad = undefined;
    _ = &gamepad;
    SDL_LockJoysticks_REAL();
    gamepad = SDL_gamepads;
    while (gamepad != null) {
        if (gamepad.*.joystick.*.instance_id == joyid) {
            SDL_UnlockJoysticks_REAL();
            return gamepad;
        }
        gamepad = gamepad.*.next;
    }
    SDL_UnlockJoysticks_REAL();
    return null;
}
pub export fn SDL_GetGamepadFromPlayerIndex_REAL(player_index: c_int) [*c]SDL_Gamepad {
    @setEvalBranchQuota(100000);
    var result: [*c]SDL_Gamepad = null;
    _ = &result;
    SDL_LockJoysticks_REAL();
    {
        var joystick: [*c]SDL_Joystick = SDL_GetJoystickFromPlayerIndex_REAL(player_index);
        _ = &joystick;
        if (joystick != null) {
            result = SDL_GetGamepadFromID_REAL(joystick.*.instance_id);
        }
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_GetGamepadBindings_REAL(gamepad: [*c]SDL_Gamepad, count: [*c]c_int) [*c][*c]SDL_GamepadBinding {
    @setEvalBranchQuota(100000);
    var bindings: [*c][*c]SDL_GamepadBinding = null;
    _ = &bindings;
    if (count != null) {
        count.* = 0;
    }
    SDL_LockJoysticks_REAL();
    {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(gamepad)), SDL_OBJECT_TYPE_GAMEPAD) or !SDL_IsJoystickValid(gamepad.*.joystick)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("gamepad"))));
            SDL_UnlockJoysticks_REAL();
            return null;
        }
        var pointers_size: usize = @as(c_ulong, @bitCast(@as(c_long, gamepad.*.num_bindings + @as(c_int, 1)))) *% @sizeOf([*c]SDL_GamepadBinding);
        _ = &pointers_size;
        var elements_size: usize = @as(c_ulong, @bitCast(@as(c_long, gamepad.*.num_bindings))) *% @sizeOf(SDL_GamepadBinding);
        _ = &elements_size;
        bindings = @ptrCast(@alignCast(SDL_malloc_REAL(pointers_size +% elements_size)));
        if (bindings != null) {
            var binding: [*c]SDL_GamepadBinding = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(bindings))) + pointers_size));
            _ = &binding;
            var i: c_int = undefined;
            _ = &i;
            {
                i = 0;
                while (i < gamepad.*.num_bindings) : ({
                    i += 1;
                    binding += 1;
                }) {
                    bindings[@bitCast(@as(isize, @intCast(i)))] = binding;
                    {
                        comptime {
                            if (!(@sizeOf(@TypeOf(binding.*)) == @sizeOf(@TypeOf((&gamepad.*.bindings[@bitCast(@as(isize, @intCast(i)))]).*)))) @compileError("static assertion failed \"sizeof (*(binding)) == sizeof (*( &gamepad->bindings[i]))\"");
                        }
                    }
                    _ = memcpy(@ptrCast(@alignCast(binding)), @ptrCast(@alignCast(&gamepad.*.bindings[@bitCast(@as(isize, @intCast(i)))])), @sizeOf(@TypeOf((&gamepad.*.bindings[@bitCast(@as(isize, @intCast(i)))]).*)));
                }
            }
            bindings[@bitCast(@as(isize, @intCast(i)))] = null;
            if (count != null) {
                count.* = gamepad.*.num_bindings;
            }
        }
    }
    SDL_UnlockJoysticks_REAL();
    return bindings;
}
pub export fn SDL_RumbleGamepad_REAL(gamepad: [*c]SDL_Gamepad, low_frequency_rumble: Uint16, high_frequency_rumble: Uint16, duration_ms: Uint32) bool {
    @setEvalBranchQuota(100000);
    var joystick: [*c]SDL_Joystick = SDL_GetGamepadJoystick_REAL(gamepad);
    _ = &joystick;
    if (!(joystick != null)) {
        return @"false" != 0;
    }
    return SDL_RumbleJoystick_REAL(joystick, low_frequency_rumble, high_frequency_rumble, duration_ms);
}
pub export fn SDL_RumbleGamepadTriggers_REAL(gamepad: [*c]SDL_Gamepad, left_rumble: Uint16, right_rumble: Uint16, duration_ms: Uint32) bool {
    @setEvalBranchQuota(100000);
    var joystick: [*c]SDL_Joystick = SDL_GetGamepadJoystick_REAL(gamepad);
    _ = &joystick;
    if (!(joystick != null)) {
        return @"false" != 0;
    }
    return SDL_RumbleJoystickTriggers_REAL(joystick, left_rumble, right_rumble, duration_ms);
}
pub export fn SDL_SetGamepadLED_REAL(gamepad: [*c]SDL_Gamepad, red: Uint8, green: Uint8, blue: Uint8) bool {
    @setEvalBranchQuota(100000);
    var joystick: [*c]SDL_Joystick = SDL_GetGamepadJoystick_REAL(gamepad);
    _ = &joystick;
    if (!(joystick != null)) {
        return @"false" != 0;
    }
    return SDL_SetJoystickLED_REAL(joystick, red, green, blue);
}
pub export fn SDL_SendGamepadEffect_REAL(gamepad: [*c]SDL_Gamepad, data: ?*const anyopaque, size: c_int) bool {
    @setEvalBranchQuota(100000);
    var joystick: [*c]SDL_Joystick = SDL_GetGamepadJoystick_REAL(gamepad);
    _ = &joystick;
    if (!(joystick != null)) {
        return @"false" != 0;
    }
    return SDL_SendJoystickEffect_REAL(joystick, data, size);
}
pub export fn SDL_CloseGamepad_REAL(gamepad: [*c]SDL_Gamepad) void {
    @setEvalBranchQuota(100000);
    var gamepadlist: [*c]SDL_Gamepad = undefined;
    _ = &gamepadlist;
    var gamepadlistprev: [*c]SDL_Gamepad = undefined;
    _ = &gamepadlistprev;
    SDL_LockJoysticks_REAL();
    if (!SDL_ObjectValid(@ptrCast(@alignCast(gamepad)), SDL_OBJECT_TYPE_GAMEPAD)) {
        SDL_UnlockJoysticks_REAL();
        return;
    }
    if ((blk: {
        const ref = &gamepad.*.ref_count;
        ref.* -= 1;
        break :blk ref.*;
    }) > @as(c_int, 0)) {
        SDL_UnlockJoysticks_REAL();
        return;
    }
    SDL_CloseJoystick_REAL(gamepad.*.joystick);
    gamepadlist = SDL_gamepads;
    gamepadlistprev = null;
    while (gamepadlist != null) {
        if (gamepad == gamepadlist) {
            if (gamepadlistprev != null) {
                gamepadlistprev.*.next = gamepadlist.*.next;
            } else {
                SDL_gamepads = gamepad.*.next;
            }
            break;
        }
        gamepadlistprev = gamepadlist;
        gamepadlist = gamepadlist.*.next;
    }
    SDL_SetObjectValid(@ptrCast(@alignCast(gamepad)), SDL_OBJECT_TYPE_GAMEPAD, @"false" != 0);
    SDL_free_REAL(@ptrCast(@alignCast(gamepad.*.bindings)));
    SDL_free_REAL(@ptrCast(@alignCast(gamepad.*.last_match_axis)));
    SDL_free_REAL(@ptrCast(@alignCast(gamepad.*.last_hat_mask)));
    SDL_free_REAL(@ptrCast(@alignCast(gamepad)));
    SDL_UnlockJoysticks_REAL();
}
pub export fn SDL_QuitGamepads() void {
    @setEvalBranchQuota(100000);
    var gamepad: [*c]SDL_Gamepad = undefined;
    _ = &gamepad;
    SDL_LockJoysticks_REAL();
    {
        gamepad = SDL_gamepads;
        while (gamepad != null) : (gamepad = gamepad.*.next) {
            SDL_PrivateGamepadRemoved(gamepad.*.joystick.*.instance_id);
        }
    }
    SDL_gamepads_initialized = @"false" != 0;
    SDL_RemoveEventWatch_REAL(SDL_GamepadEventWatcher, null);
    while (SDL_gamepads != null) {
        SDL_gamepads.*.ref_count = 1;
        SDL_CloseGamepad_REAL(SDL_gamepads);
    }
    if (SDL_gamepad_names != null) {
        SDL_DestroyHashTable(SDL_gamepad_names);
        SDL_gamepad_names = null;
    }
    SDL_UnlockJoysticks_REAL();
}
pub export fn SDL_QuitGamepadMappings() void {
    @setEvalBranchQuota(100000);
    var pGamepadMap: [*c]GamepadMapping_t = undefined;
    _ = &pGamepadMap;
    SDL_AssertJoysticksLocked();
    while (s_pSupportedGamepads != null) {
        pGamepadMap = s_pSupportedGamepads;
        s_pSupportedGamepads = s_pSupportedGamepads.*.next;
        SDL_free_REAL(@ptrCast(@alignCast(pGamepadMap.*.name)));
        SDL_free_REAL(@ptrCast(@alignCast(pGamepadMap.*.mapping)));
        SDL_free_REAL(@ptrCast(@alignCast(pGamepadMap)));
    }
    SDL_FreeVIDPIDList(&SDL_allowed_gamepads);
    SDL_FreeVIDPIDList(&SDL_ignored_gamepads);
    if (s_gamepadInstanceIDs != null) {
        SDL_DestroyHashTable(s_gamepadInstanceIDs);
        s_gamepadInstanceIDs = null;
    }
}
pub fn SDL_SendGamepadAxis(timestamp: Uint64, gamepad: [*c]SDL_Gamepad, axis: SDL_GamepadAxis, value: Sint16) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_AssertJoysticksLocked();
    if (SDL_EventEnabled_REAL(SDL_EVENT_GAMEPAD_AXIS_MOTION)) {
        var event: SDL_Event = undefined;
        _ = &event;
        event.type = SDL_EVENT_GAMEPAD_AXIS_MOTION;
        event.common.timestamp = timestamp;
        event.gaxis.which = gamepad.*.joystick.*.instance_id;
        event.gaxis.axis = @bitCast(@as(i8, @truncate(axis)));
        event.gaxis.value = value;
        _ = SDL_PushEvent_REAL(&event);
    }
}
pub fn SDL_SendGamepadButton(timestamp: Uint64, gamepad: [*c]SDL_Gamepad, button: SDL_GamepadButton, down: bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var event: SDL_Event = undefined;
    _ = &event;
    SDL_AssertJoysticksLocked();
    if (button == SDL_GAMEPAD_BUTTON_INVALID) {
        return;
    }
    if (down) {
        event.type = SDL_EVENT_GAMEPAD_BUTTON_DOWN;
    } else {
        event.type = SDL_EVENT_GAMEPAD_BUTTON_UP;
    }
    if (button == SDL_GAMEPAD_BUTTON_GUIDE) {
        var now: Uint64 = SDL_GetTicks_REAL();
        _ = &now;
        if (down) {
            gamepad.*.guide_button_down = now;
            if (gamepad.*.joystick.*.delayed_guide_button) {
                return;
            }
        } else {
            if (now < (gamepad.*.guide_button_down +% @as(Uint64, SDL_MINIMUM_GUIDE_BUTTON_DELAY_MS))) {
                gamepad.*.joystick.*.delayed_guide_button = @"true" != 0;
                return;
            }
            gamepad.*.joystick.*.delayed_guide_button = @"false" != 0;
        }
    }
    if (SDL_EventEnabled_REAL(event.type)) {
        event.common.timestamp = timestamp;
        event.gbutton.which = gamepad.*.joystick.*.instance_id;
        event.gbutton.button = @bitCast(@as(i8, @truncate(button)));
        event.gbutton.down = down;
        _ = SDL_PushEvent_REAL(&event);
    }
}
pub const SDL_gamepad_event_list: [12]Uint32 = [12]Uint32{
    SDL_EVENT_GAMEPAD_AXIS_MOTION,
    SDL_EVENT_GAMEPAD_BUTTON_DOWN,
    SDL_EVENT_GAMEPAD_BUTTON_UP,
    SDL_EVENT_GAMEPAD_ADDED,
    SDL_EVENT_GAMEPAD_REMOVED,
    SDL_EVENT_GAMEPAD_REMAPPED,
    SDL_EVENT_GAMEPAD_TOUCHPAD_DOWN,
    SDL_EVENT_GAMEPAD_TOUCHPAD_MOTION,
    SDL_EVENT_GAMEPAD_TOUCHPAD_UP,
    SDL_EVENT_GAMEPAD_SENSOR_UPDATE,
    SDL_EVENT_GAMEPAD_CAPSENSE_TOUCH,
    SDL_EVENT_GAMEPAD_CAPSENSE_RELEASE,
};
pub export fn SDL_SetGamepadEventsEnabled_REAL(enabled: bool) void {
    @setEvalBranchQuota(100000);
    var i: c_uint = undefined;
    _ = &i;
    {
        i = 0;
        while (@as(c_ulong, i) < (@sizeOf(@TypeOf(SDL_gamepad_event_list)) / @sizeOf(@TypeOf(SDL_gamepad_event_list[@as(c_int, 0)])))) : (i +%= 1) {
            SDL_SetEventEnabled_REAL(SDL_gamepad_event_list[i], enabled);
        }
    }
}
pub export fn SDL_GamepadEventsEnabled_REAL() bool {
    @setEvalBranchQuota(100000);
    var enabled: bool = @"false" != 0;
    _ = &enabled;
    var i: c_uint = undefined;
    _ = &i;
    {
        i = 0;
        while (@as(c_ulong, i) < (@sizeOf(@TypeOf(SDL_gamepad_event_list)) / @sizeOf(@TypeOf(SDL_gamepad_event_list[@as(c_int, 0)])))) : (i +%= 1) {
            enabled = SDL_EventEnabled_REAL(SDL_gamepad_event_list[i]);
            if (enabled) {
                break;
            }
        }
    }
    return enabled;
}
pub export fn SDL_GamepadHandleDelayedGuideButton(joystick: [*c]SDL_Joystick) void {
    @setEvalBranchQuota(100000);
    var gamepad: [*c]SDL_Gamepad = undefined;
    _ = &gamepad;
    SDL_AssertJoysticksLocked();
    {
        gamepad = SDL_gamepads;
        while (gamepad != null) : (gamepad = gamepad.*.next) {
            if (gamepad.*.joystick == joystick) {
                SDL_SendGamepadButton(0, gamepad, SDL_GAMEPAD_BUTTON_GUIDE, @"false" != 0);
                if (!(gamepad.*.joystick.*.update_complete != 0)) {
                    gamepad.*.joystick.*.update_complete = SDL_GetTicksNS_REAL();
                }
                break;
            }
        }
    }
}
pub export fn SDL_GetGamepadAppleSFSymbolsNameForButton_REAL(_: [*c]SDL_Gamepad, _: SDL_GamepadButton) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var result: [*c]const u8 = null;
    _ = &result;
    return result;
}
pub export fn SDL_GetGamepadAppleSFSymbolsNameForAxis_REAL(_: [*c]SDL_Gamepad, _: SDL_GamepadAxis) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var result: [*c]const u8 = null;
    _ = &result;
    return result;
}

pub const SDL_AddGamepadMapping = SDL_AddGamepadMapping_REAL;
pub const SDL_AddGamepadMappingsFromFile = SDL_AddGamepadMappingsFromFile_REAL;
pub const SDL_AddGamepadMappingsFromIO = SDL_AddGamepadMappingsFromIO_REAL;
pub const SDL_CloseGamepad = SDL_CloseGamepad_REAL;
pub const SDL_GamepadConnected = SDL_GamepadConnected_REAL;
pub const SDL_GamepadEventsEnabled = SDL_GamepadEventsEnabled_REAL;
pub const SDL_GamepadHasAxis = SDL_GamepadHasAxis_REAL;
pub const SDL_GamepadHasButton = SDL_GamepadHasButton_REAL;
pub const SDL_GamepadHasSensor = SDL_GamepadHasSensor_REAL;
pub const SDL_GamepadSensorEnabled = SDL_GamepadSensorEnabled_REAL;
pub const SDL_GetGamepadAppleSFSymbolsNameForAxis = SDL_GetGamepadAppleSFSymbolsNameForAxis_REAL;
pub const SDL_GetGamepadAppleSFSymbolsNameForButton = SDL_GetGamepadAppleSFSymbolsNameForButton_REAL;
pub const SDL_GetGamepadAxis = SDL_GetGamepadAxis_REAL;
pub const SDL_GetGamepadAxisFromString = SDL_GetGamepadAxisFromString_REAL;
pub const SDL_GetGamepadBindings = SDL_GetGamepadBindings_REAL;
pub const SDL_GetGamepadButton = SDL_GetGamepadButton_REAL;
pub const SDL_GetGamepadButtonFromString = SDL_GetGamepadButtonFromString_REAL;
pub const SDL_GetGamepadButtonLabel = SDL_GetGamepadButtonLabel_REAL;
pub const SDL_GetGamepadButtonLabelForType = SDL_GetGamepadButtonLabelForType_REAL;
pub const SDL_GetGamepadConnectionState = SDL_GetGamepadConnectionState_REAL;
pub const SDL_GetGamepadFirmwareVersion = SDL_GetGamepadFirmwareVersion_REAL;
pub const SDL_GetGamepadFromID = SDL_GetGamepadFromID_REAL;
pub const SDL_GetGamepadFromPlayerIndex = SDL_GetGamepadFromPlayerIndex_REAL;
pub const SDL_GetGamepadGUIDForID = SDL_GetGamepadGUIDForID_REAL;
pub const SDL_GetGamepadID = SDL_GetGamepadID_REAL;
pub const SDL_GetGamepadJoystick = SDL_GetGamepadJoystick_REAL;
pub const SDL_GetGamepadMapping = SDL_GetGamepadMapping_REAL;
pub const SDL_GetGamepadMappingForGUID = SDL_GetGamepadMappingForGUID_REAL;
pub const SDL_GetGamepadMappingForID = SDL_GetGamepadMappingForID_REAL;
pub const SDL_GetGamepadMappings = SDL_GetGamepadMappings_REAL;
pub const SDL_GetGamepadName = SDL_GetGamepadName_REAL;
pub const SDL_GetGamepadNameForID = SDL_GetGamepadNameForID_REAL;
pub const SDL_GetGamepadPath = SDL_GetGamepadPath_REAL;
pub const SDL_GetGamepadPathForID = SDL_GetGamepadPathForID_REAL;
pub const SDL_GetGamepadPlayerIndex = SDL_GetGamepadPlayerIndex_REAL;
pub const SDL_GetGamepadPlayerIndexForID = SDL_GetGamepadPlayerIndexForID_REAL;
pub const SDL_GetGamepadPowerInfo = SDL_GetGamepadPowerInfo_REAL;
pub const SDL_GetGamepadProduct = SDL_GetGamepadProduct_REAL;
pub const SDL_GetGamepadProductForID = SDL_GetGamepadProductForID_REAL;
pub const SDL_GetGamepadProductVersion = SDL_GetGamepadProductVersion_REAL;
pub const SDL_GetGamepadProductVersionForID = SDL_GetGamepadProductVersionForID_REAL;
pub const SDL_GetGamepadProperties = SDL_GetGamepadProperties_REAL;
pub const SDL_GetGamepadSensorData = SDL_GetGamepadSensorData_REAL;
pub const SDL_GetGamepadSensorDataRate = SDL_GetGamepadSensorDataRate_REAL;
pub const SDL_GetGamepadSerial = SDL_GetGamepadSerial_REAL;
pub const SDL_GetGamepadSteamHandle = SDL_GetGamepadSteamHandle_REAL;
pub const SDL_GetGamepadStringForAxis = SDL_GetGamepadStringForAxis_REAL;
pub const SDL_GetGamepadStringForButton = SDL_GetGamepadStringForButton_REAL;
pub const SDL_GetGamepadStringForType = SDL_GetGamepadStringForType_REAL;
pub const SDL_GetGamepadTouchpadFinger = SDL_GetGamepadTouchpadFinger_REAL;
pub const SDL_GetGamepadType = SDL_GetGamepadType_REAL;
pub const SDL_GetGamepadTypeForID = SDL_GetGamepadTypeForID_REAL;
pub const SDL_GetGamepadTypeFromString = SDL_GetGamepadTypeFromString_REAL;
pub const SDL_GetGamepadVendor = SDL_GetGamepadVendor_REAL;
pub const SDL_GetGamepadVendorForID = SDL_GetGamepadVendorForID_REAL;
pub const SDL_GetGamepads = SDL_GetGamepads_REAL;
pub const SDL_GetNumGamepadTouchpadFingers = SDL_GetNumGamepadTouchpadFingers_REAL;
pub const SDL_GetNumGamepadTouchpads = SDL_GetNumGamepadTouchpads_REAL;
pub const SDL_GetRealGamepadType = SDL_GetRealGamepadType_REAL;
pub const SDL_GetRealGamepadTypeForID = SDL_GetRealGamepadTypeForID_REAL;
pub const SDL_HasGamepad = SDL_HasGamepad_REAL;
pub const SDL_IsGamepad = SDL_IsGamepad_REAL;
pub const SDL_OpenGamepad = SDL_OpenGamepad_REAL;
pub const SDL_ReloadGamepadMappings = SDL_ReloadGamepadMappings_REAL;
pub const SDL_RumbleGamepad = SDL_RumbleGamepad_REAL;
pub const SDL_RumbleGamepadTriggers = SDL_RumbleGamepadTriggers_REAL;
pub const SDL_SendGamepadEffect = SDL_SendGamepadEffect_REAL;
pub const SDL_SetGamepadEventsEnabled = SDL_SetGamepadEventsEnabled_REAL;
pub const SDL_SetGamepadLED = SDL_SetGamepadLED_REAL;
pub const SDL_SetGamepadMapping = SDL_SetGamepadMapping_REAL;
pub const SDL_SetGamepadPlayerIndex = SDL_SetGamepadPlayerIndex_REAL;
pub const SDL_SetGamepadSensorEnabled = SDL_SetGamepadSensorEnabled_REAL;
pub const SDL_UpdateGamepads = SDL_UpdateGamepads_REAL;
pub const SDL_GamepadHasCapSense = SDL_GamepadHasCapSense_REAL;
pub const SDL_GetGamepadCapSense = SDL_GetGamepadCapSense_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_JOYSTICK_AXIS_MAX = @as(c_int, 32767);
pub const SDL_HAT_UP = @as(c_uint, 0x01);
pub const SDL_HAT_RIGHT = @as(c_uint, 0x02);
pub const SDL_HAT_DOWN = @as(c_uint, 0x04);
pub const SDL_HAT_LEFT = @as(c_uint, 0x08);
pub const SDL_HARDWARE_BUS_USB = @as(c_int, 0x03);
pub const USB_VENDOR_8BITDO = @as(c_int, 0x2dc8);
pub const USB_VENDOR_DRAGONRISE = @as(c_int, 0x0079);
pub const USB_VENDOR_MICROSOFT = @as(c_int, 0x045e);
pub const USB_VENDOR_NINTENDO = @as(c_int, 0x057e);
pub const USB_PRODUCT_8BITDO_SF30_PRO = @as(c_int, 0x6000);
pub const USB_PRODUCT_8BITDO_SF30_PRO_BT = @as(c_int, 0x6100);
pub const USB_PRODUCT_8BITDO_SN30_PRO = @as(c_int, 0x6001);
pub const USB_PRODUCT_8BITDO_SN30_PRO_BT = @as(c_int, 0x6101);
pub const USB_PRODUCT_8BITDO_PRO_2 = @as(c_int, 0x6003);
pub const USB_PRODUCT_8BITDO_PRO_2_BT = @as(c_int, 0x6006);
pub const USB_PRODUCT_8BITDO_PRO_3 = @as(c_int, 0x6009);
pub const USB_PRODUCT_8BITDO_ULTIMATE2_WIRELESS = @as(c_int, 0x6012);
pub const USB_PRODUCT_8BITDO_ULTIMATE2C_WIRELESS = @as(c_int, 0x301b);
pub const USB_PRODUCT_EVORETRO_GAMECUBE_ADAPTER1 = @as(c_int, 0x1843);
pub const USB_PRODUCT_EVORETRO_GAMECUBE_ADAPTER2 = @as(c_int, 0x1844);
pub const USB_PRODUCT_EVORETRO_GAMECUBE_ADAPTER3 = @as(c_int, 0x1846);
pub const USB_PRODUCT_GAMESIR_GAMEPAD_TARANTULA_8K = @as(c_int, 0x103C);
pub const USB_PRODUCT_NINTENDO_GAMECUBE_ADAPTER = @as(c_int, 0x0337);
pub const USB_PRODUCT_NINTENDO_SWITCH2_GAMECUBE_CONTROLLER = @as(c_int, 0x2073);
pub const USB_PRODUCT_NINTENDO_SWITCH2_JOYCON_LEFT = @as(c_int, 0x2067);
pub const USB_PRODUCT_NINTENDO_SWITCH2_JOYCON_PAIR = @as(c_int, 0x2068);
pub const USB_PRODUCT_NINTENDO_SWITCH2_JOYCON_RIGHT = @as(c_int, 0x2066);
pub const USB_PRODUCT_NINTENDO_SWITCH2_PRO = @as(c_int, 0x2069);
pub const USB_PRODUCT_NVIDIA_SHIELD_CONTROLLER_V103 = @as(c_int, 0x7210);
pub const USB_PRODUCT_XBOX360_BIGBUTTON_RECEIVER = @as(c_int, 0x02a0);
pub const SDL_MINIMUM_GUIDE_BUTTON_DELAY_MS = @as(c_int, 250);
pub const SDL_GAMEPAD_CRC_FIELD_SIZE = @as(c_int, 4);
