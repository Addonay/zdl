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
pub const Uint32 = u32;
pub const Uint64 = u64;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_memcmp_REAL(s1: ?*const anyopaque, s2: ?*const anyopaque, len: usize) c_int;
pub extern fn SDL_strchr_REAL(str: [*c]const u8, c: c_int) [*c]u8;
pub extern fn SDL_atof_REAL(str: [*c]const u8) f64;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_strncmp_REAL(str1: [*c]const u8, str2: [*c]const u8, maxlen: usize) c_int;
pub extern fn SDL_strcasecmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_snprintf_REAL(text: [*c]u8, maxlen: usize, fmt: [*c]const u8, ...) c_int;
pub extern fn SDL_ceilf_REAL(x: f32) f32;
pub extern fn SDL_powf_REAL(x: f32, y: f32) f32;
pub extern fn SDL_roundf_REAL(x: f32) f32;
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
pub extern fn SDL_GetAtomicInt_REAL(a: [*c]SDL_AtomicInt) c_int;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_PropertiesID = Uint32;
pub const struct_SDL_GUID = extern struct {
    data: [16]Uint8 = @import("std").mem.zeroes([16]Uint8),
};
pub const SDL_GUID = struct_SDL_GUID;
pub const SDL_POWERSTATE_ON_BATTERY: c_int = 1;
pub const SDL_POWERSTATE_CHARGING: c_int = 3;
pub const SDL_POWERSTATE_CHARGED: c_int = 4;
pub const enum_SDL_PowerState = c_int;
pub const SDL_PowerState = enum_SDL_PowerState;
pub const struct_SDL_Sensor = opaque {
};
pub const SDL_Sensor = struct_SDL_Sensor;
pub const SDL_SensorID = Uint32;
pub const SDL_SENSOR_ACCEL: c_int = 1;
pub const SDL_SENSOR_GYRO: c_int = 2;
pub const SDL_SENSOR_ACCEL_L: c_int = 3;
pub const SDL_SENSOR_GYRO_L: c_int = 4;
pub const SDL_SENSOR_ACCEL_R: c_int = 5;
pub const SDL_SENSOR_GYRO_R: c_int = 6;
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
pub const enum_SDL_JoystickType = c_uint;
pub const SDL_JoystickType = enum_SDL_JoystickType;
pub extern fn SDL_GetJoystickFromID_REAL(instance_id: SDL_JoystickID) [*c]SDL_Joystick;
pub extern fn SDL_GetJoystickPlayerIndex_REAL(joystick: [*c]SDL_Joystick) c_int;
pub const SDL_GAMEPAD_TYPE_STANDARD: c_int = 1;
pub const SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_PRO: c_int = 7;
pub const SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_LEFT: c_int = 8;
pub const SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_RIGHT: c_int = 9;
pub const SDL_GAMEPAD_TYPE_GAMECUBE: c_int = 11;
pub const enum_SDL_GamepadType = c_uint;
pub const SDL_GamepadType = enum_SDL_GamepadType;
pub const SDL_GAMEPAD_BUTTON_SOUTH: c_int = 0;
pub const SDL_GAMEPAD_BUTTON_EAST: c_int = 1;
pub const SDL_GAMEPAD_BUTTON_WEST: c_int = 2;
pub const SDL_GAMEPAD_BUTTON_NORTH: c_int = 3;
pub const SDL_GAMEPAD_BUTTON_BACK: c_int = 4;
pub const SDL_GAMEPAD_BUTTON_GUIDE: c_int = 5;
pub const SDL_GAMEPAD_BUTTON_START: c_int = 6;
pub const SDL_GAMEPAD_BUTTON_LEFT_STICK: c_int = 7;
pub const SDL_GAMEPAD_BUTTON_RIGHT_STICK: c_int = 8;
pub const SDL_GAMEPAD_BUTTON_LEFT_SHOULDER: c_int = 9;
pub const SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER: c_int = 10;
pub const SDL_GAMEPAD_AXIS_LEFTX: c_int = 0;
pub const SDL_GAMEPAD_AXIS_LEFTY: c_int = 1;
pub const SDL_GAMEPAD_AXIS_RIGHTX: c_int = 2;
pub const SDL_GAMEPAD_AXIS_RIGHTY: c_int = 3;
pub const SDL_GAMEPAD_AXIS_LEFT_TRIGGER: c_int = 4;
pub const SDL_GAMEPAD_AXIS_RIGHT_TRIGGER: c_int = 5;
pub const SDL_GAMEPAD_AXIS_COUNT: c_int = 6;
pub const struct_SDL_hid_device = opaque {
};
pub const SDL_hid_device = struct_SDL_hid_device;
pub extern fn SDL_hid_write_REAL(dev: ?*SDL_hid_device, data: [*c]const u8, length: usize) c_int;
pub extern fn SDL_hid_read_timeout_REAL(dev: ?*SDL_hid_device, data: [*c]u8, length: usize, milliseconds: c_int) c_int;
pub extern fn SDL_GetHintBoolean_REAL(name: [*c]const u8, default_value: bool) bool;
pub const SDL_HintCallback = ?*const fn (userdata: ?*anyopaque, name: [*c]const u8, oldValue: [*c]const u8, newValue: [*c]const u8) callconv(.c) void;
pub extern fn SDL_AddHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) bool;
pub extern fn SDL_RemoveHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) void;
pub extern fn SDL_GetTicks_REAL() Uint64;
pub extern fn SDL_GetTicksNS_REAL() Uint64;
pub extern fn SDL_Delay_REAL(ms: Uint32) void;
pub extern fn SDL_GetStringBoolean(value: [*c]const u8, default_value: bool) bool;
pub extern fn SDL_AssertJoysticksLocked() void;
pub extern fn SDL_IsJoystickNintendoSwitch2Pro(vendor_id: Uint16, product_id: Uint16) bool;
pub extern fn SDL_IsJoystickNintendoSwitchProInputOnly(vendor_id: Uint16, product_id: Uint16) bool;
pub extern fn SDL_IsJoystickNintendoSwitch2ProInputOnly(vendor_id: Uint16, product_id: Uint16) bool;
pub extern fn SDL_IsJoystickGameCube(vendor_id: Uint16, product_id: Uint16) bool;
pub extern fn SDL_PrivateJoystickAddSensor(joystick: [*c]SDL_Joystick, @"type": SDL_SensorType, rate: f32) void;
pub extern fn SDL_SendJoystickAxis(timestamp: Uint64, joystick: [*c]SDL_Joystick, axis: Uint8, value: Sint16) void;
pub extern fn SDL_SendJoystickHat(timestamp: Uint64, joystick: [*c]SDL_Joystick, hat: Uint8, value: Uint8) void;
pub extern fn SDL_SendJoystickButton(timestamp: Uint64, joystick: [*c]SDL_Joystick, button: Uint8, down: bool) void;
pub extern fn SDL_SendJoystickSensor(timestamp: Uint64, joystick: [*c]SDL_Joystick, @"type": SDL_SensorType, sensor_timestamp: Uint64, data: [*c]const f32, num_values: c_int) void;
pub extern fn SDL_SendJoystickPowerInfo(joystick: [*c]SDL_Joystick, state: SDL_PowerState, percent: c_int) void;
pub const EMappingKind = c_uint;
pub const struct_SDL_HIDAPI_Device = extern struct {
    name: [*c]u8 = null,
    manufacturer_string: [*c]u8 = null,
    product_string: [*c]u8 = null,
    path: [*c]u8 = null,
    vendor_id: Uint16 = 0,
    product_id: Uint16 = 0,
    version: Uint16 = 0,
    serial: [*c]u8 = null,
    guid: SDL_GUID = @import("std").mem.zeroes(SDL_GUID),
    interface_number: c_int = 0,
    interface_class: c_int = 0,
    interface_subclass: c_int = 0,
    interface_protocol: c_int = 0,
    usage_page: Uint16 = 0,
    usage: Uint16 = 0,
    is_bluetooth: bool = false,
    joystick_type: SDL_JoystickType = @import("std").mem.zeroes(SDL_JoystickType),
    type: SDL_GamepadType = @import("std").mem.zeroes(SDL_GamepadType),
    steam_virtual_gamepad_slot: c_int = 0,
    driver: [*c]struct_SDL_HIDAPI_DeviceDriver = null,
    context: ?*anyopaque = null,
    dev: ?*SDL_hid_device = null,
    rumble_pending: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
    num_joysticks: c_int = 0,
    joysticks: [*c]SDL_JoystickID = null,
    seen: bool = false,
    broken: bool = false,
    parent: [*c]struct_SDL_HIDAPI_Device = null,
    num_children: c_int = 0,
    children: [*c][*c]struct_SDL_HIDAPI_Device = null,
    next: [*c]struct_SDL_HIDAPI_Device = null,
};
pub const SDL_HIDAPI_Device = struct_SDL_HIDAPI_Device;
pub const struct_SDL_HIDAPI_DeviceDriver = extern struct {
    name: [*c]const u8 = null,
    enabled: bool = false,
    RegisterHints: ?*const fn (callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void = null,
    UnregisterHints: ?*const fn (callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void = null,
    IsEnabled: ?*const fn () callconv(.c) bool = null,
    IsSupportedDevice: ?*const fn (device: [*c]SDL_HIDAPI_Device, name: [*c]const u8, @"type": SDL_GamepadType, vendor_id: Uint16, product_id: Uint16, version: Uint16, interface_number: c_int, interface_class: c_int, interface_subclass: c_int, interface_protocol: c_int) callconv(.c) bool = null,
    InitDevice: ?*const fn (device: [*c]SDL_HIDAPI_Device) callconv(.c) bool = null,
    GetDevicePlayerIndex: ?*const fn (device: [*c]SDL_HIDAPI_Device, instance_id: SDL_JoystickID) callconv(.c) c_int = null,
    SetDevicePlayerIndex: ?*const fn (device: [*c]SDL_HIDAPI_Device, instance_id: SDL_JoystickID, player_index: c_int) callconv(.c) void = null,
    UpdateDevice: ?*const fn (device: [*c]SDL_HIDAPI_Device) callconv(.c) bool = null,
    OpenJoystick: ?*const fn (device: [*c]SDL_HIDAPI_Device, joystick: [*c]SDL_Joystick) callconv(.c) bool = null,
    RumbleJoystick: ?*const fn (device: [*c]SDL_HIDAPI_Device, joystick: [*c]SDL_Joystick, low_frequency_rumble: Uint16, high_frequency_rumble: Uint16) callconv(.c) bool = null,
    RumbleJoystickTriggers: ?*const fn (device: [*c]SDL_HIDAPI_Device, joystick: [*c]SDL_Joystick, left_rumble: Uint16, right_rumble: Uint16) callconv(.c) bool = null,
    GetJoystickCapabilities: ?*const fn (device: [*c]SDL_HIDAPI_Device, joystick: [*c]SDL_Joystick) callconv(.c) Uint32 = null,
    SetJoystickLED: ?*const fn (device: [*c]SDL_HIDAPI_Device, joystick: [*c]SDL_Joystick, red: Uint8, green: Uint8, blue: Uint8) callconv(.c) bool = null,
    SendJoystickEffect: ?*const fn (device: [*c]SDL_HIDAPI_Device, joystick: [*c]SDL_Joystick, data: ?*const anyopaque, size: c_int) callconv(.c) bool = null,
    SetJoystickSensorsEnabled: ?*const fn (device: [*c]SDL_HIDAPI_Device, joystick: [*c]SDL_Joystick, enabled: bool) callconv(.c) bool = null,
    CloseJoystick: ?*const fn (device: [*c]SDL_HIDAPI_Device, joystick: [*c]SDL_Joystick) callconv(.c) void = null,
    FreeDevice: ?*const fn (device: [*c]SDL_HIDAPI_Device) callconv(.c) void = null,
};
pub const SDL_HIDAPI_DeviceDriver = struct_SDL_HIDAPI_DeviceDriver;
pub extern fn HIDAPI_SetDeviceName(device: [*c]SDL_HIDAPI_Device, name: [*c]const u8) void;
pub extern fn HIDAPI_SetDeviceProduct(device: [*c]SDL_HIDAPI_Device, vendor_id: Uint16, product_id: Uint16) void;
pub extern fn HIDAPI_SetDeviceSerial(device: [*c]SDL_HIDAPI_Device, serial: [*c]const u8) void;
pub extern fn HIDAPI_HasConnectedUSBDevice(serial: [*c]const u8) bool;
pub extern fn HIDAPI_DisconnectBluetoothDevice(serial: [*c]const u8) void;
pub extern fn HIDAPI_JoystickConnected(device: [*c]SDL_HIDAPI_Device, pJoystickID: [*c]SDL_JoystickID) bool;
pub extern fn HIDAPI_JoystickDisconnected(device: [*c]SDL_HIDAPI_Device, joystickID: SDL_JoystickID) void;
pub extern fn HIDAPI_UpdateDeviceProperties(device: [*c]SDL_HIDAPI_Device) void;
pub extern fn HIDAPI_RemapVal(val: f32, val_min: f32, val_max: f32, output_min: f32, output_max: f32) f32;
pub extern fn SDL_HIDAPI_LockRumble() bool;
pub extern fn SDL_HIDAPI_SendRumbleAndUnlock(device: [*c]SDL_HIDAPI_Device, data: [*c]const Uint8, size: c_int) c_int;
pub const k_eSwitchDeviceInfoControllerType_Unknown: c_int = 0;
pub const k_eSwitchDeviceInfoControllerType_JoyConLeft: c_int = 1;
pub const k_eSwitchDeviceInfoControllerType_JoyConRight: c_int = 2;
pub const k_eSwitchDeviceInfoControllerType_ProController: c_int = 3;
pub const k_eSwitchDeviceInfoControllerType_LicProController: c_int = 6;
pub const k_eSwitchDeviceInfoControllerType_HVCLeft: c_int = 7;
pub const k_eSwitchDeviceInfoControllerType_HVCRight: c_int = 8;
pub const k_eSwitchDeviceInfoControllerType_NESLeft: c_int = 9;
pub const k_eSwitchDeviceInfoControllerType_NESRight: c_int = 10;
pub const k_eSwitchDeviceInfoControllerType_SNES: c_int = 11;
pub const k_eSwitchDeviceInfoControllerType_N64: c_int = 12;
pub const k_eSwitchDeviceInfoControllerType_SEGA_Genesis: c_int = 13;
pub const ESwitchDeviceInfoControllerType = c_uint;
pub const SDL_GAMEPAD_BUTTON_SWITCH_SHARE: c_int = 11;
pub const SDL_GAMEPAD_BUTTON_SWITCH_RIGHT_PADDLE1: c_int = 12;
pub const SDL_GAMEPAD_BUTTON_SWITCH_LEFT_PADDLE1: c_int = 13;
pub const SDL_GAMEPAD_BUTTON_SWITCH_RIGHT_PADDLE2: c_int = 14;
pub const SDL_GAMEPAD_BUTTON_SWITCH_LEFT_PADDLE2: c_int = 15;
pub const SDL_GAMEPAD_NUM_SWITCH_BUTTONS: c_int = 16;
pub const SDL_GAMEPAD_NUM_SWITCH_INPUT_ONLY_BUTTONS: c_int = 12;
pub const SDL_GAMEPAD_BUTTON_SWITCH2_C: c_int = 12;
pub const SDL_GAMEPAD_NUM_SWITCH2_BUTTONS: c_int = 13;
pub const k_eSwitchInputReportIDs_SubcommandReply: c_int = 33;
pub const k_eSwitchInputReportIDs_FullControllerState: c_int = 48;
pub const k_eSwitchInputReportIDs_FullControllerAndMcuState: c_int = 49;
pub const k_eSwitchInputReportIDs_SimpleControllerState: c_int = 63;
pub const k_eSwitchInputReportIDs_CommandAck: c_int = 129;
pub const k_eSwitchOutputReportIDs_RumbleAndSubcommand: c_int = 1;
pub const k_eSwitchOutputReportIDs_Rumble: c_int = 16;
pub const k_eSwitchOutputReportIDs_Proprietary: c_int = 128;
pub const k_eSwitchSubcommandIDs_RequestDeviceInfo: c_int = 2;
pub const k_eSwitchSubcommandIDs_SetInputReportMode: c_int = 3;
pub const k_eSwitchSubcommandIDs_SPIFlashRead: c_int = 16;
pub const k_eSwitchSubcommandIDs_SetPlayerLights: c_int = 48;
pub const k_eSwitchSubcommandIDs_SetHomeLight: c_int = 56;
pub const k_eSwitchSubcommandIDs_EnableIMU: c_int = 64;
pub const k_eSwitchSubcommandIDs_EnableVibration: c_int = 72;
pub const ESwitchSubcommandIDs = c_uint;
pub const k_eSwitchProprietaryCommandIDs_Status: c_int = 1;
pub const k_eSwitchProprietaryCommandIDs_Handshake: c_int = 2;
pub const k_eSwitchProprietaryCommandIDs_HighSpeed: c_int = 3;
pub const k_eSwitchProprietaryCommandIDs_ForceUSB: c_int = 4;
pub const ESwitchProprietaryCommandIDs = c_uint;
pub const SwitchInputOnlyControllerStatePacket_t = extern struct {
    rgucButtons: [2]Uint8 = @import("std").mem.zeroes([2]Uint8),
    ucStickHat: Uint8 = 0,
    rgucJoystickLeft: [2]Uint8 = @import("std").mem.zeroes([2]Uint8),
    rgucJoystickRight: [2]Uint8 = @import("std").mem.zeroes([2]Uint8),
};
pub const SwitchSimpleStatePacket_t = extern struct {
    rgucButtons: [2]Uint8 align(1) = @import("std").mem.zeroes([2]Uint8),
    ucStickHat: Uint8 = 0,
    sJoystickLeft: [2]Sint16 align(1) = @import("std").mem.zeroes([2]Sint16),
    sJoystickRight: [2]Sint16 align(1) = @import("std").mem.zeroes([2]Sint16),
};
pub const SwitchControllerStatePacket_t = extern struct {
    ucCounter: Uint8 = 0,
    ucBatteryAndConnection: Uint8 = 0,
    rgucButtons: [3]Uint8 = @import("std").mem.zeroes([3]Uint8),
    rgucJoystickLeft: [3]Uint8 = @import("std").mem.zeroes([3]Uint8),
    rgucJoystickRight: [3]Uint8 = @import("std").mem.zeroes([3]Uint8),
    ucVibrationCode: Uint8 = 0,
};
pub const SwitchControllerIMUState_t = extern struct {
    sAccelX: Sint16 align(1) = 0,
    sAccelY: Sint16 align(1) = 0,
    sAccelZ: Sint16 align(1) = 0,
    sGyroX: Sint16 align(1) = 0,
    sGyroY: Sint16 align(1) = 0,
    sGyroZ: Sint16 align(1) = 0,
};
pub const SwitchStatePacket_t = extern struct {
    controllerState: SwitchControllerStatePacket_t = @import("std").mem.zeroes(SwitchControllerStatePacket_t),
    imuState: [3]SwitchControllerIMUState_t = @import("std").mem.zeroes([3]SwitchControllerIMUState_t),
};
pub const SwitchSPIOpData_t = extern struct {
    unAddress: Uint32 align(1) = 0,
    ucLength: Uint8 = 0,
};
const struct_unnamed_24 = extern struct {
    opData: SwitchSPIOpData_t = @import("std").mem.zeroes(SwitchSPIOpData_t),
    rgucReadData: [30]Uint8 = @import("std").mem.zeroes([30]Uint8),
};
const struct_unnamed_25 = extern struct {
    rgucFirmwareVersion: [2]Uint8 = @import("std").mem.zeroes([2]Uint8),
    ucDeviceType: Uint8 = 0,
    ucFiller1: Uint8 = 0,
    rgucMACAddress: [6]Uint8 = @import("std").mem.zeroes([6]Uint8),
    ucFiller2: Uint8 = 0,
    ucColorLocation: Uint8 = 0,
};
const struct_unnamed_26 = extern struct {
    opData: SwitchSPIOpData_t = @import("std").mem.zeroes(SwitchSPIOpData_t),
    rgucLeftCalibration: [9]Uint8 = @import("std").mem.zeroes([9]Uint8),
    rgucRightCalibration: [9]Uint8 = @import("std").mem.zeroes([9]Uint8),
};
const struct_unnamed_27 = extern struct {
    opData: SwitchSPIOpData_t = @import("std").mem.zeroes(SwitchSPIOpData_t),
    rgucLeftMagic: [2]Uint8 = @import("std").mem.zeroes([2]Uint8),
    rgucLeftCalibration: [9]Uint8 = @import("std").mem.zeroes([9]Uint8),
    rgucRightMagic: [2]Uint8 = @import("std").mem.zeroes([2]Uint8),
    rgucRightCalibration: [9]Uint8 = @import("std").mem.zeroes([9]Uint8),
};
const union_unnamed_23 = extern union {
    rgucSubcommandData: [35]Uint8,
    spiReadData: struct_unnamed_24,
    deviceInfo: struct_unnamed_25,
    stickFactoryCalibration: struct_unnamed_26,
    stickUserCalibration: struct_unnamed_27,
};
pub const SwitchSubcommandInputPacket_t = extern struct {
    m_controllerState: SwitchControllerStatePacket_t = @import("std").mem.zeroes(SwitchControllerStatePacket_t),
    ucSubcommandAck: Uint8 = 0,
    ucSubcommandID: Uint8 = 0,
    unnamed_0: union_unnamed_23 = @import("std").mem.zeroes(union_unnamed_23),
};
pub const SwitchProprietaryStatusPacket_t = extern struct {
    ucPacketType: Uint8 = 0,
    ucCommandID: Uint8 = 0,
    ucFiller: Uint8 = 0,
    ucDeviceType: Uint8 = 0,
    rgucMACAddress: [6]Uint8 = @import("std").mem.zeroes([6]Uint8),
};
pub const SwitchRumbleData_t = extern struct {
    rgucData: [4]Uint8 = @import("std").mem.zeroes([4]Uint8),
};
pub const SwitchCommonOutputPacket_t = extern struct {
    ucPacketType: Uint8 = 0,
    ucPacketNumber: Uint8 = 0,
    rumbleData: [2]SwitchRumbleData_t = @import("std").mem.zeroes([2]SwitchRumbleData_t),
};
pub const SwitchSubcommandOutputPacket_t = extern struct {
    commonData: SwitchCommonOutputPacket_t = @import("std").mem.zeroes(SwitchCommonOutputPacket_t),
    ucSubcommandID: Uint8 = 0,
    rgucSubcommandData: [38]Uint8 = @import("std").mem.zeroes([38]Uint8),
};
pub const SwitchProprietaryOutputPacket_t = extern struct {
    ucPacketType: Uint8 = 0,
    ucProprietaryID: Uint8 = 0,
    rgucProprietaryData: [47]Uint8 = @import("std").mem.zeroes([47]Uint8),
};
pub const SWITCH_ENHANCED_REPORT_HINT_OFF: c_int = 0;
pub const SWITCH_ENHANCED_REPORT_HINT_ON: c_int = 1;
pub const SWITCH_ENHANCED_REPORT_HINT_AUTO: c_int = 2;
pub const HIDAPI_Switch_EnhancedReportHint = c_uint;
const struct_unnamed_29 = extern struct {
    sCenter: Sint16 = 0,
    sMin: Sint16 = 0,
    sMax: Sint16 = 0,
};
pub const struct_StickCalibrationData_28 = extern struct {
    axis: [2]struct_unnamed_29 = @import("std").mem.zeroes([2]struct_unnamed_29),
};
const struct_unnamed_31 = extern struct {
    sMin: Sint16 = 0,
    sMax: Sint16 = 0,
};
pub const struct_StickExtents_30 = extern struct {
    axis: [2]struct_unnamed_31 = @import("std").mem.zeroes([2]struct_unnamed_31),
};
pub const struct_IMUScaleData_32 = extern struct {
    fAccelScaleX: f32 = 0,
    fAccelScaleY: f32 = 0,
    fAccelScaleZ: f32 = 0,
    fGyroScaleX: f32 = 0,
    fGyroScaleY: f32 = 0,
    fGyroScaleZ: f32 = 0,
    sGyroOffsetX: Sint16 = 0,
    sGyroOffsetY: Sint16 = 0,
    sGyroOffsetZ: Sint16 = 0,
};
pub const SDL_DriverSwitch_Context = extern struct {
    device: [*c]SDL_HIDAPI_Device = null,
    joystick: [*c]SDL_Joystick = null,
    m_bInputOnly: bool = false,
    m_bSwitch2: bool = false,
    m_bUseButtonLabels: bool = false,
    m_bPlayerLights: bool = false,
    m_nPlayerIndex: c_int = 0,
    m_bSyncWrite: bool = false,
    m_nMaxWriteAttempts: c_int = 0,
    m_eControllerType: ESwitchDeviceInfoControllerType = @import("std").mem.zeroes(ESwitchDeviceInfoControllerType),
    m_nInitialInputMode: Uint8 = 0,
    m_nCurrentInputMode: Uint8 = 0,
    m_rgucMACAddress: [6]Uint8 = @import("std").mem.zeroes([6]Uint8),
    m_nCommandNumber: Uint8 = 0,
    m_eEnhancedReportHint: HIDAPI_Switch_EnhancedReportHint = @import("std").mem.zeroes(HIDAPI_Switch_EnhancedReportHint),
    m_bEnhancedMode: bool = false,
    m_bEnhancedModeAvailable: bool = false,
    m_RumblePacket: SwitchCommonOutputPacket_t = @import("std").mem.zeroes(SwitchCommonOutputPacket_t),
    m_rgucReadBuffer: [64]Uint8 = @import("std").mem.zeroes([64]Uint8),
    m_bRumbleActive: bool = false,
    m_ulRumbleSent: Uint64 = 0,
    m_bRumblePending: bool = false,
    m_bRumbleZeroPending: bool = false,
    m_unRumblePending: Uint32 = 0,
    m_bSensorsSupported: bool = false,
    m_bReportSensors: bool = false,
    m_bHasSensorData: bool = false,
    m_ulLastInput: Uint64 = 0,
    m_ulLastIMUReset: Uint64 = 0,
    m_ulIMUSampleTimestampNS: Uint64 = 0,
    m_unIMUSamples: Uint32 = 0,
    m_ulIMUUpdateIntervalNS: Uint64 = 0,
    m_ulTimestampNS: Uint64 = 0,
    m_bVerticalMode: bool = false,
    m_ePowerState: SDL_PowerState = @import("std").mem.zeroes(SDL_PowerState),
    m_nPowerPercent: c_int = 0,
    m_lastInputOnlyState: SwitchInputOnlyControllerStatePacket_t = @import("std").mem.zeroes(SwitchInputOnlyControllerStatePacket_t),
    m_lastSimpleState: SwitchSimpleStatePacket_t = @import("std").mem.zeroes(SwitchSimpleStatePacket_t),
    m_lastFullState: SwitchStatePacket_t = @import("std").mem.zeroes(SwitchStatePacket_t),
    m_StickCalData: [2]struct_StickCalibrationData_28 = @import("std").mem.zeroes([2]struct_StickCalibrationData_28),
    m_StickExtents: [2]struct_StickExtents_30 = @import("std").mem.zeroes([2]struct_StickExtents_30),
    m_SimpleStickExtents: [2]struct_StickExtents_30 = @import("std").mem.zeroes([2]struct_StickExtents_30),
    m_IMUScaleData: struct_IMUScaleData_32 = @import("std").mem.zeroes(struct_IMUScaleData_32),
};
pub fn ReadInput(ctx: [*c]SDL_DriverSwitch_Context) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var result: c_int = undefined;
    _ = &result;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (SDL_GetAtomicInt_REAL(&ctx.*.device.*.rumble_pending) > @as(c_int, 0)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return 0;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                result = SDL_hid_read_timeout_REAL(ctx.*.device.*.dev, @ptrCast(@alignCast(&ctx.*.m_rgucReadBuffer)), @sizeOf(@TypeOf(ctx.*.m_rgucReadBuffer)), 0);
                if (((result > @as(c_int, 0)) and !ctx.*.m_bInputOnly) and !(@as(c_int, ctx.*.m_nInitialInputMode) != 0)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                switch (@as(c_int, ctx.*.m_rgucReadBuffer[@as(c_int, 0)])) {
                    k_eSwitchInputReportIDs_FullControllerState => {
                        sdl_pc = 8;
                        continue;
                    },
                    k_eSwitchInputReportIDs_FullControllerAndMcuState => {
                        sdl_pc = 9;
                        continue;
                    },
                    k_eSwitchInputReportIDs_SimpleControllerState => {
                        sdl_pc = 10;
                        continue;
                    },
                    else => {
                        sdl_pc = 11;
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
                return result;
            },
            7 => {
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
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                ctx.*.m_nInitialInputMode = ctx.*.m_rgucReadBuffer[@as(c_int, 0)];
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            11 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn WriteOutput(ctx: [*c]SDL_DriverSwitch_Context, data: [*c]const Uint8, size: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    if (!SDL_HIDAPI_LockRumble()) {
        return -@as(c_int, 1);
    }
    return SDL_HIDAPI_SendRumbleAndUnlock(ctx.*.device, data, size);
}
pub fn ReadSubcommandReply(ctx: [*c]SDL_DriverSwitch_Context, expectedID: ESwitchSubcommandIDs, pBuf: [*c]const Uint8, ucLen: Uint8) callconv(.c) [*c]SwitchSubcommandInputPacket_t {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [19:0]u8 = "ReadSubcommandReply".*;
    };
    _ = &static_local___func__;
    var endTicks: Uint64 = SDL_GetTicks_REAL() +% @as(Uint64, 100);
    _ = &endTicks;
    var nRead: c_int = 0;
    _ = &nRead;
    while ((blk: {
        const tmp = ReadInput(ctx);
        nRead = tmp;
        break :blk tmp;
    }) != -@as(c_int, 1)) {
        if (nRead > @as(c_int, 0)) {
            if (@as(c_int, ctx.*.m_rgucReadBuffer[@as(c_int, 0)]) == k_eSwitchInputReportIDs_SubcommandReply) {
                var reply: [*c]SwitchSubcommandInputPacket_t = @ptrCast(@alignCast(&ctx.*.m_rgucReadBuffer[@as(c_int, 1)]));
                _ = &reply;
                if ((@as(c_int, reply.*.ucSubcommandID) != @as(c_int, @bitCast(expectedID))) or !((@as(c_int, reply.*.ucSubcommandAck) & @as(c_int, 128)) != 0)) {
                    continue;
                }
                if (@as(c_int, reply.*.ucSubcommandID) == k_eSwitchSubcommandIDs_SPIFlashRead) {
                    while (true) {
                        while (!(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, ucLen)))) == @sizeOf(@TypeOf(reply.*.unnamed_0.spiReadData.opData)))) {
                            const static_local_sdl_assert_data = struct {
                                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                    .always_ignore = @"false" != 0,
                                    .trigger_count = 0,
                                    .condition = "ucLen == sizeof(reply->spiReadData.opData)",
                                    .filename = null,
                                    .linenum = 0,
                                    .function = null,
                                    .next = null,
                                };
                            };
                            _ = &static_local_sdl_assert_data;
                            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_hidapi_switch.c", 428);
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
                    if (SDL_memcmp_REAL(@ptrCast(@alignCast(&reply.*.unnamed_0.spiReadData.opData)), @ptrCast(@alignCast(pBuf)), ucLen) != @as(c_int, 0)) {
                        continue;
                    }
                }
                return reply;
            }
        } else {
            SDL_Delay_REAL(1);
        }
        if (SDL_GetTicks_REAL() >= endTicks) {
            break;
        }
    }
    return null;
}
pub fn ReadProprietaryReply(ctx: [*c]SDL_DriverSwitch_Context, expectedID: ESwitchProprietaryCommandIDs) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var endTicks: Uint64 = SDL_GetTicks_REAL() +% @as(Uint64, 100);
    _ = &endTicks;
    var nRead: c_int = 0;
    _ = &nRead;
    while ((blk: {
        const tmp = ReadInput(ctx);
        nRead = tmp;
        break :blk tmp;
    }) != -@as(c_int, 1)) {
        if (nRead > @as(c_int, 0)) {
            if ((@as(c_int, ctx.*.m_rgucReadBuffer[@as(c_int, 0)]) == k_eSwitchInputReportIDs_CommandAck) and (@as(c_int, ctx.*.m_rgucReadBuffer[@as(c_int, 1)]) == @as(c_int, @bitCast(expectedID)))) {
                return @"true" != 0;
            }
        } else {
            SDL_Delay_REAL(1);
        }
        if (SDL_GetTicks_REAL() >= endTicks) {
            break;
        }
    }
    return @"false" != 0;
}
pub fn ConstructSubcommand(ctx: [*c]SDL_DriverSwitch_Context, ucCommandID: ESwitchSubcommandIDs, pBuf: [*c]const Uint8, ucLen: Uint8, outPacket: [*c]SwitchSubcommandOutputPacket_t) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = memset(@ptrCast(@alignCast(outPacket)), 0, @sizeOf(@TypeOf(outPacket.*)));
    outPacket.*.commonData.ucPacketType = k_eSwitchOutputReportIDs_RumbleAndSubcommand;
    outPacket.*.commonData.ucPacketNumber = ctx.*.m_nCommandNumber;
    _ = memcpy(@ptrCast(@alignCast(@as([*c]SwitchRumbleData_t, @ptrCast(@alignCast(&outPacket.*.commonData.rumbleData))))), @ptrCast(@alignCast(@as([*c]SwitchRumbleData_t, @ptrCast(@alignCast(&ctx.*.m_RumblePacket.rumbleData))))), @sizeOf(@TypeOf(ctx.*.m_RumblePacket.rumbleData)));
    outPacket.*.ucSubcommandID = @truncate(ucCommandID);
    if (pBuf != null) {
        _ = memcpy(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&outPacket.*.rgucSubcommandData))))), @ptrCast(@alignCast(pBuf)), ucLen);
    }
    ctx.*.m_nCommandNumber = @bitCast(@as(i8, @truncate((@as(c_int, ctx.*.m_nCommandNumber) + @as(c_int, 1)) & @as(c_int, 15))));
}
pub fn WritePacket(ctx: [*c]SDL_DriverSwitch_Context, arg_pBuf: ?*anyopaque, arg_ucLen: Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var pBuf = arg_pBuf;
    _ = &pBuf;
    var ucLen = arg_ucLen;
    _ = &ucLen;
    var rgucBuf: [64]Uint8 = undefined;
    _ = &rgucBuf;
    const unWriteSize: usize = @bitCast(@as(c_long, if (ctx.*.device.*.is_bluetooth) k_unSwitchOutputPacketDataLength else k_unSwitchMaxOutputPacketLength));
    _ = &unWriteSize;
    if (@as(c_int, ucLen) > k_unSwitchOutputPacketDataLength) {
        return @"false" != 0;
    }
    if (@as(usize, @bitCast(@as(c_long, @as(c_int, ucLen)))) < unWriteSize) {
        _ = memcpy(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&rgucBuf))))), pBuf, ucLen);
        _ = memset(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&rgucBuf))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, ucLen))))))), 0, unWriteSize -% @as(usize, @bitCast(@as(c_long, @as(c_int, ucLen)))));
        pBuf = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&rgucBuf)))));
        ucLen = @truncate(unWriteSize);
    }
    if (ctx.*.m_bSyncWrite) {
        return SDL_hid_write_REAL(ctx.*.device.*.dev, @ptrCast(@alignCast(pBuf)), ucLen) >= @as(c_int, 0);
    } else {
        return WriteOutput(ctx, @ptrCast(@alignCast(pBuf)), ucLen) >= @as(c_int, 0);
    }
}
pub fn WriteSubcommand(ctx: [*c]SDL_DriverSwitch_Context, ucCommandID: ESwitchSubcommandIDs, pBuf: [*c]const Uint8, ucLen: Uint8, ppReply: [*c][*c]SwitchSubcommandInputPacket_t) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var reply: [*c]SwitchSubcommandInputPacket_t = null;
    _ = &reply;
    var nTries: c_int = undefined;
    _ = &nTries;
    {
        nTries = 1;
        while (!(reply != null) and (nTries <= ctx.*.m_nMaxWriteAttempts)) : (nTries += 1) {
            var commandPacket: SwitchSubcommandOutputPacket_t = undefined;
            _ = &commandPacket;
            ConstructSubcommand(ctx, ucCommandID, pBuf, ucLen, &commandPacket);
            if (!WritePacket(ctx, @ptrCast(@alignCast(&commandPacket)), @truncate(@sizeOf(@TypeOf(commandPacket))))) {
                continue;
            }
            reply = ReadSubcommandReply(ctx, ucCommandID, pBuf, ucLen);
        }
    }
    if (ppReply != null) {
        ppReply.* = reply;
    }
    return @as(?*anyopaque, @ptrCast(@alignCast(reply))) != @as(?*anyopaque, null);
}
pub fn WriteProprietary(ctx: [*c]SDL_DriverSwitch_Context, ucCommand: ESwitchProprietaryCommandIDs, pBuf: [*c]Uint8, ucLen: Uint8, waitForReply: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var nTries: c_int = undefined;
    _ = &nTries;
    {
        nTries = 1;
        while (nTries <= ctx.*.m_nMaxWriteAttempts) : (nTries += 1) {
            var packet: SwitchProprietaryOutputPacket_t = undefined;
            _ = &packet;
            if ((!(pBuf != null) and (@as(c_int, ucLen) > @as(c_int, 0))) or (@as(c_ulong, @bitCast(@as(c_long, @as(c_int, ucLen)))) > @sizeOf(@TypeOf(packet.rgucProprietaryData)))) {
                return @"false" != 0;
            }
            _ = memset(@ptrCast(@alignCast(&packet)), 0, @sizeOf(@TypeOf(packet)));
            packet.ucPacketType = k_eSwitchOutputReportIDs_Proprietary;
            packet.ucProprietaryID = @truncate(ucCommand);
            if (pBuf != null) {
                _ = memcpy(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&packet.rgucProprietaryData))))), @ptrCast(@alignCast(pBuf)), ucLen);
            }
            if (!WritePacket(ctx, @ptrCast(@alignCast(&packet)), @truncate(@sizeOf(@TypeOf(packet))))) {
                continue;
            }
            if (!waitForReply or ReadProprietaryReply(ctx, ucCommand)) {
                return @"true" != 0;
            }
        }
    }
    return @"false" != 0;
}
pub fn EncodeRumbleHighAmplitude(amplitude: Uint16) callconv(.c) Uint8 {
    @setEvalBranchQuota(100000);
    var hfa: [101][2]Uint16 = [101][2]Uint16{
        [2]Uint16{
            0,
            0,
        },
        [2]Uint16{
            514,
            2,
        },
        [2]Uint16{
            775,
            4,
        },
        [2]Uint16{
            921,
            6,
        },
        [2]Uint16{
            1096,
            8,
        },
        [2]Uint16{
            1303,
            10,
        },
        [2]Uint16{
            1550,
            12,
        },
        [2]Uint16{
            1843,
            14,
        },
        [2]Uint16{
            2192,
            16,
        },
        [2]Uint16{
            2606,
            18,
        },
        [2]Uint16{
            3100,
            20,
        },
        [2]Uint16{
            3686,
            22,
        },
        [2]Uint16{
            4383,
            24,
        },
        [2]Uint16{
            5213,
            26,
        },
        [2]Uint16{
            6199,
            28,
        },
        [2]Uint16{
            7372,
            30,
        },
        [2]Uint16{
            7698,
            32,
        },
        [2]Uint16{
            8039,
            34,
        },
        [2]Uint16{
            8395,
            36,
        },
        [2]Uint16{
            8767,
            38,
        },
        [2]Uint16{
            9155,
            40,
        },
        [2]Uint16{
            9560,
            42,
        },
        [2]Uint16{
            9984,
            44,
        },
        [2]Uint16{
            10426,
            46,
        },
        [2]Uint16{
            10887,
            48,
        },
        [2]Uint16{
            11369,
            50,
        },
        [2]Uint16{
            11873,
            52,
        },
        [2]Uint16{
            12398,
            54,
        },
        [2]Uint16{
            12947,
            56,
        },
        [2]Uint16{
            13520,
            58,
        },
        [2]Uint16{
            14119,
            60,
        },
        [2]Uint16{
            14744,
            62,
        },
        [2]Uint16{
            15067,
            64,
        },
        [2]Uint16{
            15397,
            66,
        },
        [2]Uint16{
            15734,
            68,
        },
        [2]Uint16{
            16079,
            70,
        },
        [2]Uint16{
            16431,
            72,
        },
        [2]Uint16{
            16790,
            74,
        },
        [2]Uint16{
            17158,
            76,
        },
        [2]Uint16{
            17534,
            78,
        },
        [2]Uint16{
            17918,
            80,
        },
        [2]Uint16{
            18310,
            82,
        },
        [2]Uint16{
            18711,
            84,
        },
        [2]Uint16{
            19121,
            86,
        },
        [2]Uint16{
            19540,
            88,
        },
        [2]Uint16{
            19967,
            90,
        },
        [2]Uint16{
            20405,
            92,
        },
        [2]Uint16{
            20851,
            94,
        },
        [2]Uint16{
            21308,
            96,
        },
        [2]Uint16{
            21775,
            98,
        },
        [2]Uint16{
            22251,
            100,
        },
        [2]Uint16{
            22739,
            102,
        },
        [2]Uint16{
            23236,
            104,
        },
        [2]Uint16{
            23745,
            106,
        },
        [2]Uint16{
            24265,
            108,
        },
        [2]Uint16{
            24797,
            110,
        },
        [2]Uint16{
            25340,
            112,
        },
        [2]Uint16{
            25894,
            114,
        },
        [2]Uint16{
            26462,
            116,
        },
        [2]Uint16{
            27041,
            118,
        },
        [2]Uint16{
            27633,
            120,
        },
        [2]Uint16{
            28238,
            122,
        },
        [2]Uint16{
            28856,
            124,
        },
        [2]Uint16{
            29488,
            126,
        },
        [2]Uint16{
            30134,
            128,
        },
        [2]Uint16{
            30794,
            130,
        },
        [2]Uint16{
            31468,
            132,
        },
        [2]Uint16{
            32157,
            134,
        },
        [2]Uint16{
            32861,
            136,
        },
        [2]Uint16{
            33581,
            138,
        },
        [2]Uint16{
            34316,
            140,
        },
        [2]Uint16{
            35068,
            142,
        },
        [2]Uint16{
            35836,
            144,
        },
        [2]Uint16{
            36620,
            146,
        },
        [2]Uint16{
            37422,
            148,
        },
        [2]Uint16{
            38242,
            150,
        },
        [2]Uint16{
            39079,
            152,
        },
        [2]Uint16{
            39935,
            154,
        },
        [2]Uint16{
            40809,
            156,
        },
        [2]Uint16{
            41703,
            158,
        },
        [2]Uint16{
            42616,
            160,
        },
        [2]Uint16{
            43549,
            162,
        },
        [2]Uint16{
            44503,
            164,
        },
        [2]Uint16{
            45477,
            166,
        },
        [2]Uint16{
            46473,
            168,
        },
        [2]Uint16{
            47491,
            170,
        },
        [2]Uint16{
            48531,
            172,
        },
        [2]Uint16{
            49593,
            174,
        },
        [2]Uint16{
            50679,
            176,
        },
        [2]Uint16{
            51789,
            178,
        },
        [2]Uint16{
            52923,
            180,
        },
        [2]Uint16{
            54082,
            182,
        },
        [2]Uint16{
            55266,
            184,
        },
        [2]Uint16{
            56476,
            186,
        },
        [2]Uint16{
            57713,
            188,
        },
        [2]Uint16{
            58977,
            190,
        },
        [2]Uint16{
            60268,
            192,
        },
        [2]Uint16{
            61588,
            194,
        },
        [2]Uint16{
            62936,
            196,
        },
        [2]Uint16{
            64315,
            198,
        },
        [2]Uint16{
            65535,
            200,
        },
    };
    _ = &hfa;
    var index_1: c_int = 0;
    _ = &index_1;
    while (index_1 < @as(c_int, 101)) : (index_1 += 1) {
        if (@as(c_int, amplitude) <= @as(c_int, hfa[@bitCast(@as(isize, @intCast(index_1)))][@as(c_int, 0)])) {
            return @truncate(hfa[@bitCast(@as(isize, @intCast(index_1)))][@as(c_int, 1)]);
        }
    }
    return @truncate(hfa[@as(c_int, 100)][@as(c_int, 1)]);
}
pub fn EncodeRumbleLowAmplitude(amplitude: Uint16) callconv(.c) Uint16 {
    @setEvalBranchQuota(100000);
    var lfa: [101][2]Uint16 = [101][2]Uint16{
        [2]Uint16{
            0,
            64,
        },
        [2]Uint16{
            514,
            32832,
        },
        [2]Uint16{
            775,
            65,
        },
        [2]Uint16{
            921,
            32833,
        },
        [2]Uint16{
            1096,
            66,
        },
        [2]Uint16{
            1303,
            32834,
        },
        [2]Uint16{
            1550,
            67,
        },
        [2]Uint16{
            1843,
            32835,
        },
        [2]Uint16{
            2192,
            68,
        },
        [2]Uint16{
            2606,
            32836,
        },
        [2]Uint16{
            3100,
            69,
        },
        [2]Uint16{
            3686,
            32837,
        },
        [2]Uint16{
            4383,
            70,
        },
        [2]Uint16{
            5213,
            32838,
        },
        [2]Uint16{
            6199,
            71,
        },
        [2]Uint16{
            7372,
            32839,
        },
        [2]Uint16{
            7698,
            72,
        },
        [2]Uint16{
            8039,
            32840,
        },
        [2]Uint16{
            8395,
            73,
        },
        [2]Uint16{
            8767,
            32841,
        },
        [2]Uint16{
            9155,
            74,
        },
        [2]Uint16{
            9560,
            32842,
        },
        [2]Uint16{
            9984,
            75,
        },
        [2]Uint16{
            10426,
            32843,
        },
        [2]Uint16{
            10887,
            76,
        },
        [2]Uint16{
            11369,
            32844,
        },
        [2]Uint16{
            11873,
            77,
        },
        [2]Uint16{
            12398,
            32845,
        },
        [2]Uint16{
            12947,
            78,
        },
        [2]Uint16{
            13520,
            32846,
        },
        [2]Uint16{
            14119,
            79,
        },
        [2]Uint16{
            14744,
            32847,
        },
        [2]Uint16{
            15067,
            80,
        },
        [2]Uint16{
            15397,
            32848,
        },
        [2]Uint16{
            15734,
            81,
        },
        [2]Uint16{
            16079,
            32849,
        },
        [2]Uint16{
            16431,
            82,
        },
        [2]Uint16{
            16790,
            32850,
        },
        [2]Uint16{
            17158,
            83,
        },
        [2]Uint16{
            17534,
            32851,
        },
        [2]Uint16{
            17918,
            84,
        },
        [2]Uint16{
            18310,
            32852,
        },
        [2]Uint16{
            18711,
            85,
        },
        [2]Uint16{
            19121,
            32853,
        },
        [2]Uint16{
            19540,
            86,
        },
        [2]Uint16{
            19967,
            32854,
        },
        [2]Uint16{
            20405,
            87,
        },
        [2]Uint16{
            20851,
            32855,
        },
        [2]Uint16{
            21308,
            88,
        },
        [2]Uint16{
            21775,
            32856,
        },
        [2]Uint16{
            22251,
            89,
        },
        [2]Uint16{
            22739,
            32857,
        },
        [2]Uint16{
            23236,
            90,
        },
        [2]Uint16{
            23745,
            32858,
        },
        [2]Uint16{
            24265,
            91,
        },
        [2]Uint16{
            24797,
            32859,
        },
        [2]Uint16{
            25340,
            92,
        },
        [2]Uint16{
            25894,
            32860,
        },
        [2]Uint16{
            26462,
            93,
        },
        [2]Uint16{
            27041,
            32861,
        },
        [2]Uint16{
            27633,
            94,
        },
        [2]Uint16{
            28238,
            32862,
        },
        [2]Uint16{
            28856,
            95,
        },
        [2]Uint16{
            29488,
            32863,
        },
        [2]Uint16{
            30134,
            96,
        },
        [2]Uint16{
            30794,
            32864,
        },
        [2]Uint16{
            31468,
            97,
        },
        [2]Uint16{
            32157,
            32865,
        },
        [2]Uint16{
            32861,
            98,
        },
        [2]Uint16{
            33581,
            32866,
        },
        [2]Uint16{
            34316,
            99,
        },
        [2]Uint16{
            35068,
            32867,
        },
        [2]Uint16{
            35836,
            100,
        },
        [2]Uint16{
            36620,
            32868,
        },
        [2]Uint16{
            37422,
            101,
        },
        [2]Uint16{
            38242,
            32869,
        },
        [2]Uint16{
            39079,
            102,
        },
        [2]Uint16{
            39935,
            32870,
        },
        [2]Uint16{
            40809,
            103,
        },
        [2]Uint16{
            41703,
            32871,
        },
        [2]Uint16{
            42616,
            104,
        },
        [2]Uint16{
            43549,
            32872,
        },
        [2]Uint16{
            44503,
            105,
        },
        [2]Uint16{
            45477,
            32873,
        },
        [2]Uint16{
            46473,
            106,
        },
        [2]Uint16{
            47491,
            32874,
        },
        [2]Uint16{
            48531,
            107,
        },
        [2]Uint16{
            49593,
            32875,
        },
        [2]Uint16{
            50679,
            108,
        },
        [2]Uint16{
            51789,
            32876,
        },
        [2]Uint16{
            52923,
            109,
        },
        [2]Uint16{
            54082,
            32877,
        },
        [2]Uint16{
            55266,
            110,
        },
        [2]Uint16{
            56476,
            32878,
        },
        [2]Uint16{
            57713,
            111,
        },
        [2]Uint16{
            58977,
            32879,
        },
        [2]Uint16{
            60268,
            112,
        },
        [2]Uint16{
            61588,
            32880,
        },
        [2]Uint16{
            62936,
            113,
        },
        [2]Uint16{
            64315,
            32881,
        },
        [2]Uint16{
            65535,
            114,
        },
    };
    _ = &lfa;
    var index_1: c_int = 0;
    _ = &index_1;
    while (index_1 < @as(c_int, 101)) : (index_1 += 1) {
        if (@as(c_int, amplitude) <= @as(c_int, lfa[@bitCast(@as(isize, @intCast(index_1)))][@as(c_int, 0)])) {
            return lfa[@bitCast(@as(isize, @intCast(index_1)))][@as(c_int, 1)];
        }
    }
    return lfa[@as(c_int, 100)][@as(c_int, 1)];
}
pub fn SetNeutralRumble(device: [*c]SDL_HIDAPI_Device, pRumble: [*c]SwitchRumbleData_t) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var bStandardNeutralValue: bool = undefined;
    _ = &bStandardNeutralValue;
    if ((@as(c_int, device.*.vendor_id) == USB_VENDOR_NINTENDO) and (@as(c_int, device.*.product_id) == USB_PRODUCT_NINTENDO_N64_CONTROLLER)) {
        bStandardNeutralValue = @"false" != 0;
    } else {
        bStandardNeutralValue = @"true" != 0;
    }
    if (bStandardNeutralValue) {
        pRumble.*.rgucData[@as(c_int, 0)] = 0;
        pRumble.*.rgucData[@as(c_int, 1)] = 1;
        pRumble.*.rgucData[@as(c_int, 2)] = 64;
        pRumble.*.rgucData[@as(c_int, 3)] = 64;
    } else {
        pRumble.*.rgucData[@as(c_int, 0)] = 0;
        pRumble.*.rgucData[@as(c_int, 1)] = 0;
        pRumble.*.rgucData[@as(c_int, 2)] = 1;
        pRumble.*.rgucData[@as(c_int, 3)] = 64;
    }
}
pub fn EncodeRumble(device: [*c]SDL_HIDAPI_Device, pRumble: [*c]SwitchRumbleData_t, usHighFreq: Uint16, ucHighFreqAmp: Uint8, ucLowFreq: Uint8, usLowFreqAmp: Uint16) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if ((@as(c_int, ucHighFreqAmp) > @as(c_int, 0)) or (@as(c_int, usLowFreqAmp) > @as(c_int, 0))) {
        pRumble.*.rgucData[@as(c_int, 0)] = @bitCast(@as(i8, @truncate(@as(c_int, usHighFreq) & @as(c_int, 255))));
        pRumble.*.rgucData[@as(c_int, 1)] = @bitCast(@as(i8, @truncate(@as(c_int, ucHighFreqAmp) | ((@as(c_int, usHighFreq) >> @intCast(@as(c_int, 8))) & @as(c_int, 1)))));
        pRumble.*.rgucData[@as(c_int, 2)] = @bitCast(@as(i8, @truncate(@as(c_int, ucLowFreq) | ((@as(c_int, usLowFreqAmp) >> @intCast(@as(c_int, 8))) & @as(c_int, 128)))));
        pRumble.*.rgucData[@as(c_int, 3)] = @bitCast(@as(i8, @truncate(@as(c_int, usLowFreqAmp) & @as(c_int, 255))));
    } else {
        SetNeutralRumble(device, pRumble);
    }
}
pub fn WriteRumble(ctx: [*c]SDL_DriverSwitch_Context) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    ctx.*.m_RumblePacket.ucPacketType = k_eSwitchOutputReportIDs_Rumble;
    ctx.*.m_RumblePacket.ucPacketNumber = ctx.*.m_nCommandNumber;
    ctx.*.m_nCommandNumber = @bitCast(@as(i8, @truncate((@as(c_int, ctx.*.m_nCommandNumber) + @as(c_int, 1)) & @as(c_int, 15))));
    ctx.*.m_ulRumbleSent = SDL_GetTicks_REAL();
    return WritePacket(ctx, @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.m_RumblePacket))))), @truncate(@sizeOf(@TypeOf(ctx.*.m_RumblePacket))));
}
pub fn CalculateControllerType(ctx: [*c]SDL_DriverSwitch_Context, arg_eControllerType: ESwitchDeviceInfoControllerType) callconv(.c) ESwitchDeviceInfoControllerType {
    @setEvalBranchQuota(100000);
    var eControllerType = arg_eControllerType;
    _ = &eControllerType;
    var device: [*c]SDL_HIDAPI_Device = ctx.*.device;
    _ = &device;
    if ((eControllerType == @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_ProController)) and (@as(c_int, device.*.product_id) == USB_PRODUCT_NINTENDO_N64_CONTROLLER)) {
        eControllerType = k_eSwitchDeviceInfoControllerType_N64;
    }
    if (eControllerType == @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_Unknown)) {
        if (@as(c_int, device.*.product_id) == USB_PRODUCT_NINTENDO_SWITCH_JOYCON_GRIP) {
            if (device.*.interface_number == @as(c_int, 1)) {
                eControllerType = k_eSwitchDeviceInfoControllerType_JoyConLeft;
            } else {
                eControllerType = k_eSwitchDeviceInfoControllerType_JoyConRight;
            }
        }
    }
    return eControllerType;
}
pub fn BReadDeviceInfo(ctx: [*c]SDL_DriverSwitch_Context) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var reply: [*c]SwitchSubcommandInputPacket_t = null;
    _ = &reply;
    if (ctx.*.device.*.is_bluetooth) {
        if (WriteSubcommand(ctx, k_eSwitchSubcommandIDs_RequestDeviceInfo, null, 0, &reply)) {
            ctx.*.m_eControllerType = CalculateControllerType(ctx, reply.*.unnamed_0.deviceInfo.ucDeviceType);
            _ = memcpy(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.m_rgucMACAddress))))), @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&reply.*.unnamed_0.deviceInfo.rgucMACAddress))))), @sizeOf(@TypeOf(ctx.*.m_rgucMACAddress)));
            return @"true" != 0;
        }
    } else {
        if (WriteProprietary(ctx, k_eSwitchProprietaryCommandIDs_Status, null, 0, @"true" != 0)) {
            var status: [*c]SwitchProprietaryStatusPacket_t = @ptrCast(@alignCast(&ctx.*.m_rgucReadBuffer[@as(c_int, 0)]));
            _ = &status;
            var i: usize = undefined;
            _ = &i;
            ctx.*.m_eControllerType = CalculateControllerType(ctx, status.*.ucDeviceType);
            {
                i = 0;
                while (i < @sizeOf(@TypeOf(ctx.*.m_rgucMACAddress))) : (i +%= 1) {
                    ctx.*.m_rgucMACAddress[i] = status.*.rgucMACAddress[(@sizeOf(@TypeOf(ctx.*.m_rgucMACAddress)) -% i) -% @as(c_ulong, 1)];
                }
            }
            return @"true" != 0;
        }
    }
    return @"false" != 0;
}
pub fn BTrySetupUSB(ctx: [*c]SDL_DriverSwitch_Context) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (!WriteProprietary(ctx, k_eSwitchProprietaryCommandIDs_Handshake, null, 0, @"true" != 0)) {
        return @"false" != 0;
    }
    if (!WriteProprietary(ctx, k_eSwitchProprietaryCommandIDs_HighSpeed, null, 0, @"true" != 0)) {}
    if (!WriteProprietary(ctx, k_eSwitchProprietaryCommandIDs_Handshake, null, 0, @"true" != 0)) {}
    if (!WriteProprietary(ctx, k_eSwitchProprietaryCommandIDs_ForceUSB, null, 0, @"false" != 0)) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn SetVibrationEnabled(ctx: [*c]SDL_DriverSwitch_Context, arg_enabled: Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var enabled = arg_enabled;
    _ = &enabled;
    return WriteSubcommand(ctx, k_eSwitchSubcommandIDs_EnableVibration, &enabled, @truncate(@sizeOf(@TypeOf(enabled))), null);
}
pub fn SetInputMode(ctx: [*c]SDL_DriverSwitch_Context, arg_input_mode: Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var input_mode = arg_input_mode;
    _ = &input_mode;
    if (@as(c_int, input_mode) == @as(c_int, ctx.*.m_nCurrentInputMode)) {
        return @"true" != 0;
    } else {
        ctx.*.m_nCurrentInputMode = input_mode;
        return WriteSubcommand(ctx, k_eSwitchSubcommandIDs_SetInputReportMode, &input_mode, @truncate(@sizeOf(@TypeOf(input_mode))), null);
    }
}
pub fn SetHomeLED(ctx: [*c]SDL_DriverSwitch_Context, brightness: Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ucLedIntensity: Uint8 = 0;
    _ = &ucLedIntensity;
    var rgucBuffer: [4]Uint8 = undefined;
    _ = &rgucBuffer;
    if (@as(c_int, brightness) > @as(c_int, 0)) {
        if (@as(c_int, brightness) < @as(c_int, 65)) {
            ucLedIntensity = @bitCast(@as(i8, @truncate(@divTrunc(@as(c_int, brightness) + @as(c_int, 5), @as(c_int, 10)))));
        } else {
            ucLedIntensity = @intFromFloat(SDL_ceilf_REAL(@as(f32, @floatFromInt(@as(c_int, 15))) * SDL_powf_REAL(@as(f32, @floatFromInt(brightness)) / @as(f32, 100.0), 2.13)));
        }
    }
    rgucBuffer[@as(c_int, 0)] = @bitCast(@as(i8, @truncate((@as(c_int, 0) << @intCast(@as(c_int, 4))) | @as(c_int, 1))));
    rgucBuffer[@as(c_int, 1)] = @bitCast(@as(i8, @truncate(((@as(c_int, ucLedIntensity) & @as(c_int, 15)) << @intCast(@as(c_int, 4))) | @as(c_int, 0))));
    rgucBuffer[@as(c_int, 2)] = @bitCast(@as(i8, @truncate(((@as(c_int, ucLedIntensity) & @as(c_int, 15)) << @intCast(@as(c_int, 4))) | @as(c_int, 0))));
    rgucBuffer[@as(c_int, 3)] = @bitCast(@as(i8, @truncate((@as(c_int, 0) << @intCast(@as(c_int, 4))) | @as(c_int, 0))));
    return WriteSubcommand(ctx, k_eSwitchSubcommandIDs_SetHomeLight, @ptrCast(@alignCast(&rgucBuffer)), @truncate(@sizeOf(@TypeOf(rgucBuffer))), null);
}
pub fn SDL_HomeLEDHintChanged(userdata: ?*anyopaque, _: [*c]const u8, _: [*c]const u8, hint: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSwitch_Context = @ptrCast(@alignCast(userdata));
    _ = &ctx;
    if ((hint != null) and (@as(c_int, hint.*) != 0)) {
        var value: c_int = undefined;
        _ = &value;
        if (@as(?*anyopaque, @ptrCast(@alignCast(SDL_strchr_REAL(hint, '.')))) != @as(?*anyopaque, null)) {
            value = @intFromFloat(@as(f64, @floatCast(@as(f32, 100.0))) * SDL_atof_REAL(hint));
            if (value > @as(c_int, 255)) {
                value = 255;
            }
        } else if (SDL_GetStringBoolean(hint, @"true" != 0)) {
            value = 100;
        } else {
            value = 0;
        }
        _ = SetHomeLED(ctx, @bitCast(@as(i8, @truncate(value))));
    }
}
pub fn UpdateSlotLED(ctx: [*c]SDL_DriverSwitch_Context) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (!ctx.*.m_bInputOnly) {
        var led_data: Uint8 = 0;
        _ = &led_data;
        const player_pattern: [8]Uint8 = [8]Uint8{
            1,
            3,
            7,
            15,
            9,
            5,
            13,
            6,
        };
        _ = &player_pattern;
        if (ctx.*.m_bPlayerLights and (ctx.*.m_nPlayerIndex >= @as(c_int, 0))) {
            led_data = player_pattern[@bitCast(@as(isize, @intCast(__helpers.signedRemainder(ctx.*.m_nPlayerIndex, @as(c_int, 8)))))];
        }
        _ = WriteSubcommand(ctx, k_eSwitchSubcommandIDs_SetPlayerLights, &led_data, @truncate(@sizeOf(@TypeOf(led_data))), null);
    }
}
pub fn SDL_PlayerLEDHintChanged(userdata: ?*anyopaque, _: [*c]const u8, _: [*c]const u8, hint: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSwitch_Context = @ptrCast(@alignCast(userdata));
    _ = &ctx;
    var bPlayerLights: bool = SDL_GetStringBoolean(hint, @"true" != 0);
    _ = &bPlayerLights;
    if (@as(c_int, @intFromBool(bPlayerLights)) != @as(c_int, @intFromBool(ctx.*.m_bPlayerLights))) {
        ctx.*.m_bPlayerLights = bPlayerLights;
        UpdateSlotLED(ctx);
        HIDAPI_UpdateDeviceProperties(ctx.*.device);
    }
}
pub fn GetInitialInputMode(ctx: [*c]SDL_DriverSwitch_Context) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (!(@as(c_int, ctx.*.m_nInitialInputMode) != 0)) {
        _ = ReadInput(ctx);
    }
}
pub fn GetDefaultInputMode(ctx: [*c]SDL_DriverSwitch_Context) callconv(.c) Uint8 {
    @setEvalBranchQuota(100000);
    var input_mode: Uint8 = undefined;
    _ = &input_mode;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (@as(c_int, ctx.*.m_nInitialInputMode) != 0) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                input_mode = ctx.*.m_nInitialInputMode;
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            2 => {
                if (ctx.*.device.*.is_bluetooth) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            3 => {
                switch (ctx.*.m_eEnhancedReportHint) {
                    @as(HIDAPI_Switch_EnhancedReportHint, SWITCH_ENHANCED_REPORT_HINT_OFF) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(HIDAPI_Switch_EnhancedReportHint, SWITCH_ENHANCED_REPORT_HINT_ON) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(HIDAPI_Switch_EnhancedReportHint, SWITCH_ENHANCED_REPORT_HINT_AUTO) => {
                        sdl_pc = 13;
                        continue;
                    },
                    else => {
                        sdl_pc = 7;
                        continue;
                    },
                }
            },
            4 => {
                input_mode = k_eSwitchInputReportIDs_SimpleControllerState;
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                input_mode = k_eSwitchInputReportIDs_FullControllerState;
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
                if ((@as(c_int, input_mode) == k_eSwitchInputReportIDs_SimpleControllerState) and !ctx.*.device.*.is_bluetooth) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            8 => {
                input_mode = k_eSwitchInputReportIDs_SimpleControllerState;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            9 => {
                if (@as(c_int, input_mode) == k_eSwitchInputReportIDs_SimpleControllerState) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                input_mode = k_eSwitchInputReportIDs_FullControllerState;
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
                    sdl_pc = 7;
                    continue;
                }
            },
            13 => {
                if ((@as(c_int, ctx.*.device.*.vendor_id) == USB_VENDOR_NINTENDO) and ((@as(c_int, ctx.*.device.*.product_id) == USB_PRODUCT_NINTENDO_SWITCH_JOYCON_LEFT) or (@as(c_int, ctx.*.device.*.product_id) == USB_PRODUCT_NINTENDO_SWITCH_JOYCON_RIGHT))) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                input_mode = k_eSwitchInputReportIDs_FullControllerState;
                {
                    sdl_pc = 16;
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
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            17 => {
                input_mode = k_eSwitchInputReportIDs_FullControllerState;
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
                return input_mode;
            },
            else => unreachable,
        }
    }
}
pub fn GetSensorInputMode(ctx: [*c]SDL_DriverSwitch_Context) callconv(.c) Uint8 {
    @setEvalBranchQuota(100000);
    var input_mode: Uint8 = undefined;
    _ = &input_mode;
    if (!(@as(c_int, ctx.*.m_nInitialInputMode) != 0) or (@as(c_int, ctx.*.m_nInitialInputMode) == k_eSwitchInputReportIDs_SimpleControllerState)) {
        input_mode = k_eSwitchInputReportIDs_FullControllerState;
    } else {
        input_mode = ctx.*.m_nInitialInputMode;
    }
    return input_mode;
}
pub fn UpdateInputMode(ctx: [*c]SDL_DriverSwitch_Context) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var input_mode: Uint8 = undefined;
    _ = &input_mode;
    if (ctx.*.m_bReportSensors) {
        input_mode = GetSensorInputMode(ctx);
    } else {
        input_mode = GetDefaultInputMode(ctx);
    }
    _ = SetInputMode(ctx, input_mode);
}
pub fn SetEnhancedModeAvailable(ctx: [*c]SDL_DriverSwitch_Context) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (ctx.*.m_bEnhancedModeAvailable) {
        return;
    }
    ctx.*.m_bEnhancedModeAvailable = @"true" != 0;
    if (ctx.*.m_bSensorsSupported) {
        if (!(ctx.*.device.*.parent != null) or (ctx.*.m_eControllerType == @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_JoyConRight))) {
            SDL_PrivateJoystickAddSensor(ctx.*.joystick, SDL_SENSOR_GYRO, 200.0);
            SDL_PrivateJoystickAddSensor(ctx.*.joystick, SDL_SENSOR_ACCEL, 200.0);
        }
        if ((ctx.*.device.*.parent != null) and (ctx.*.m_eControllerType == @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_JoyConLeft))) {
            SDL_PrivateJoystickAddSensor(ctx.*.joystick, SDL_SENSOR_GYRO_L, 200.0);
            SDL_PrivateJoystickAddSensor(ctx.*.joystick, SDL_SENSOR_ACCEL_L, 200.0);
        }
        if ((ctx.*.device.*.parent != null) and (ctx.*.m_eControllerType == @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_JoyConRight))) {
            SDL_PrivateJoystickAddSensor(ctx.*.joystick, SDL_SENSOR_GYRO_R, 200.0);
            SDL_PrivateJoystickAddSensor(ctx.*.joystick, SDL_SENSOR_ACCEL_R, 200.0);
        }
    }
}
pub fn SetEnhancedReportHint(ctx: [*c]SDL_DriverSwitch_Context, eEnhancedReportHint: HIDAPI_Switch_EnhancedReportHint) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                ctx.*.m_eEnhancedReportHint = eEnhancedReportHint;
                switch (eEnhancedReportHint) {
                    @as(HIDAPI_Switch_EnhancedReportHint, SWITCH_ENHANCED_REPORT_HINT_OFF) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(HIDAPI_Switch_EnhancedReportHint, SWITCH_ENHANCED_REPORT_HINT_ON) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(HIDAPI_Switch_EnhancedReportHint, SWITCH_ENHANCED_REPORT_HINT_AUTO) => {
                        sdl_pc = 4;
                        continue;
                    },
                    else => {
                        sdl_pc = 1;
                        continue;
                    },
                }
            },
            1 => {
                UpdateInputMode(ctx);
                {}
            },
            2 => {
                ctx.*.m_bEnhancedMode = @"false" != 0;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                SetEnhancedModeAvailable(ctx);
                ctx.*.m_bEnhancedMode = @"true" != 0;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                SetEnhancedModeAvailable(ctx);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn UpdateEnhancedModeOnEnhancedReport(ctx: [*c]SDL_DriverSwitch_Context) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (ctx.*.m_eEnhancedReportHint == @as(HIDAPI_Switch_EnhancedReportHint, SWITCH_ENHANCED_REPORT_HINT_AUTO)) {
        SetEnhancedReportHint(ctx, SWITCH_ENHANCED_REPORT_HINT_ON);
    }
}
pub fn UpdateEnhancedModeOnApplicationUsage(ctx: [*c]SDL_DriverSwitch_Context) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (ctx.*.m_eEnhancedReportHint == @as(HIDAPI_Switch_EnhancedReportHint, SWITCH_ENHANCED_REPORT_HINT_AUTO)) {
        SetEnhancedReportHint(ctx, SWITCH_ENHANCED_REPORT_HINT_ON);
    }
}
pub fn SDL_EnhancedReportsChanged(userdata: ?*anyopaque, _: [*c]const u8, _: [*c]const u8, hint: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSwitch_Context = @ptrCast(@alignCast(userdata));
    _ = &ctx;
    if ((hint != null) and (SDL_strcasecmp_REAL(hint, "auto") == @as(c_int, 0))) {
        SetEnhancedReportHint(ctx, SWITCH_ENHANCED_REPORT_HINT_AUTO);
    } else if (SDL_GetStringBoolean(hint, @"true" != 0)) {
        SetEnhancedReportHint(ctx, SWITCH_ENHANCED_REPORT_HINT_ON);
    } else {
        SetEnhancedReportHint(ctx, SWITCH_ENHANCED_REPORT_HINT_OFF);
    }
}
pub fn SetIMUEnabled(ctx: [*c]SDL_DriverSwitch_Context, enabled: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var imu_data: Uint8 = @bitCast(@as(i8, @truncate(if (enabled) @as(c_int, 1) else @as(c_int, 0))));
    _ = &imu_data;
    return WriteSubcommand(ctx, k_eSwitchSubcommandIDs_EnableIMU, &imu_data, @truncate(@sizeOf(@TypeOf(imu_data))), null);
}
pub fn LoadStickCalibration(ctx: [*c]SDL_DriverSwitch_Context) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var pLeftStickCal: [9]Uint8 = [9]Uint8{
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
    };
    _ = &pLeftStickCal;
    var pRightStickCal: [9]Uint8 = [9]Uint8{
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
    };
    _ = &pRightStickCal;
    var have_left_stick_cal: bool = @"false" != 0;
    _ = &have_left_stick_cal;
    var have_right_stick_cal: bool = @"false" != 0;
    _ = &have_right_stick_cal;
    var stick: usize = undefined;
    _ = &stick;
    var axis: usize = undefined;
    _ = &axis;
    var user_reply: [*c]SwitchSubcommandInputPacket_t = null;
    _ = &user_reply;
    var factory_reply: [*c]SwitchSubcommandInputPacket_t = null;
    _ = &factory_reply;
    var readUserParams: SwitchSPIOpData_t = undefined;
    _ = &readUserParams;
    var readFactoryParams: SwitchSPIOpData_t = undefined;
    _ = &readFactoryParams;
    readUserParams.unAddress = k_unSPIStickUserCalibrationStartOffset;
    readUserParams.ucLength = @bitCast(@as(i8, @truncate((k_unSPIStickUserCalibrationEndOffset - k_unSPIStickUserCalibrationStartOffset) + @as(c_int, 1))));
    _ = WriteSubcommand(ctx, k_eSwitchSubcommandIDs_SPIFlashRead, @ptrCast(@alignCast(&readUserParams)), @truncate(@sizeOf(@TypeOf(readUserParams))), &user_reply);
    readFactoryParams.unAddress = k_unSPIStickFactoryCalibrationStartOffset;
    readFactoryParams.ucLength = @bitCast(@as(i8, @truncate((k_unSPIStickFactoryCalibrationEndOffset - k_unSPIStickFactoryCalibrationStartOffset) + @as(c_int, 1))));
    if (((user_reply != null) and (@as(c_int, user_reply.*.unnamed_0.stickUserCalibration.rgucLeftMagic[@as(c_int, 0)]) == @as(c_int, 178))) and (@as(c_int, user_reply.*.unnamed_0.stickUserCalibration.rgucLeftMagic[@as(c_int, 1)]) == @as(c_int, 161))) {
        have_left_stick_cal = @"true" != 0;
        _ = memcpy(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&pLeftStickCal))))), @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&user_reply.*.unnamed_0.stickUserCalibration.rgucLeftCalibration))))), @sizeOf(@TypeOf(pLeftStickCal)));
    }
    if (((user_reply != null) and (@as(c_int, user_reply.*.unnamed_0.stickUserCalibration.rgucRightMagic[@as(c_int, 0)]) == @as(c_int, 178))) and (@as(c_int, user_reply.*.unnamed_0.stickUserCalibration.rgucRightMagic[@as(c_int, 1)]) == @as(c_int, 161))) {
        have_right_stick_cal = @"true" != 0;
        _ = memcpy(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&pRightStickCal))))), @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&user_reply.*.unnamed_0.stickUserCalibration.rgucRightCalibration))))), @sizeOf(@TypeOf(pRightStickCal)));
    }
    if (!have_left_stick_cal or !have_right_stick_cal) {
        readFactoryParams.unAddress = k_unSPIStickFactoryCalibrationStartOffset;
        readFactoryParams.ucLength = @bitCast(@as(i8, @truncate((k_unSPIStickFactoryCalibrationEndOffset - k_unSPIStickFactoryCalibrationStartOffset) + @as(c_int, 1))));
        const MAX_ATTEMPTS: c_int = 3;
        _ = &MAX_ATTEMPTS;
        {
            var attempt: c_int = 0;
            _ = &attempt;
            while (true) : (attempt += 1) {
                if (!WriteSubcommand(ctx, k_eSwitchSubcommandIDs_SPIFlashRead, @ptrCast(@alignCast(&readFactoryParams)), @truncate(@sizeOf(@TypeOf(readFactoryParams))), &factory_reply)) {
                    return @"false" != 0;
                }
                if (factory_reply.*.unnamed_0.stickFactoryCalibration.opData.unAddress == @as(Uint32, k_unSPIStickFactoryCalibrationStartOffset)) {
                    if (!have_left_stick_cal) {
                        have_left_stick_cal = @"true" != 0;
                        _ = memcpy(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&pLeftStickCal))))), @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&factory_reply.*.unnamed_0.stickFactoryCalibration.rgucLeftCalibration))))), @sizeOf(@TypeOf(pLeftStickCal)));
                    }
                    if (!have_right_stick_cal) {
                        have_right_stick_cal = @"true" != 0;
                        _ = memcpy(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&pRightStickCal))))), @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&factory_reply.*.unnamed_0.stickFactoryCalibration.rgucRightCalibration))))), @sizeOf(@TypeOf(pRightStickCal)));
                    }
                    break;
                }
                if (attempt == MAX_ATTEMPTS) {
                    return @"false" != 0;
                }
            }
        }
    }
    if (!have_left_stick_cal or !have_right_stick_cal) {
        return @"false" != 0;
    }
    ctx.*.m_StickCalData[@as(c_int, 0)].axis[@as(c_int, 0)].sMax = @truncate(((@as(c_int, pLeftStickCal[@as(c_int, 1)]) << @intCast(@as(c_int, 8))) & @as(c_int, 3840)) | @as(c_int, pLeftStickCal[@as(c_int, 0)]));
    ctx.*.m_StickCalData[@as(c_int, 0)].axis[@as(c_int, 1)].sMax = @truncate((@as(c_int, pLeftStickCal[@as(c_int, 2)]) << @intCast(@as(c_int, 4))) | (@as(c_int, pLeftStickCal[@as(c_int, 1)]) >> @intCast(@as(c_int, 4))));
    ctx.*.m_StickCalData[@as(c_int, 0)].axis[@as(c_int, 0)].sCenter = @truncate(((@as(c_int, pLeftStickCal[@as(c_int, 4)]) << @intCast(@as(c_int, 8))) & @as(c_int, 3840)) | @as(c_int, pLeftStickCal[@as(c_int, 3)]));
    ctx.*.m_StickCalData[@as(c_int, 0)].axis[@as(c_int, 1)].sCenter = @truncate((@as(c_int, pLeftStickCal[@as(c_int, 5)]) << @intCast(@as(c_int, 4))) | (@as(c_int, pLeftStickCal[@as(c_int, 4)]) >> @intCast(@as(c_int, 4))));
    ctx.*.m_StickCalData[@as(c_int, 0)].axis[@as(c_int, 0)].sMin = @truncate(((@as(c_int, pLeftStickCal[@as(c_int, 7)]) << @intCast(@as(c_int, 8))) & @as(c_int, 3840)) | @as(c_int, pLeftStickCal[@as(c_int, 6)]));
    ctx.*.m_StickCalData[@as(c_int, 0)].axis[@as(c_int, 1)].sMin = @truncate((@as(c_int, pLeftStickCal[@as(c_int, 8)]) << @intCast(@as(c_int, 4))) | (@as(c_int, pLeftStickCal[@as(c_int, 7)]) >> @intCast(@as(c_int, 4))));
    ctx.*.m_StickCalData[@as(c_int, 1)].axis[@as(c_int, 0)].sCenter = @truncate(((@as(c_int, pRightStickCal[@as(c_int, 1)]) << @intCast(@as(c_int, 8))) & @as(c_int, 3840)) | @as(c_int, pRightStickCal[@as(c_int, 0)]));
    ctx.*.m_StickCalData[@as(c_int, 1)].axis[@as(c_int, 1)].sCenter = @truncate((@as(c_int, pRightStickCal[@as(c_int, 2)]) << @intCast(@as(c_int, 4))) | (@as(c_int, pRightStickCal[@as(c_int, 1)]) >> @intCast(@as(c_int, 4))));
    ctx.*.m_StickCalData[@as(c_int, 1)].axis[@as(c_int, 0)].sMin = @truncate(((@as(c_int, pRightStickCal[@as(c_int, 4)]) << @intCast(@as(c_int, 8))) & @as(c_int, 3840)) | @as(c_int, pRightStickCal[@as(c_int, 3)]));
    ctx.*.m_StickCalData[@as(c_int, 1)].axis[@as(c_int, 1)].sMin = @truncate((@as(c_int, pRightStickCal[@as(c_int, 5)]) << @intCast(@as(c_int, 4))) | (@as(c_int, pRightStickCal[@as(c_int, 4)]) >> @intCast(@as(c_int, 4))));
    ctx.*.m_StickCalData[@as(c_int, 1)].axis[@as(c_int, 0)].sMax = @truncate(((@as(c_int, pRightStickCal[@as(c_int, 7)]) << @intCast(@as(c_int, 8))) & @as(c_int, 3840)) | @as(c_int, pRightStickCal[@as(c_int, 6)]));
    ctx.*.m_StickCalData[@as(c_int, 1)].axis[@as(c_int, 1)].sMax = @truncate((@as(c_int, pRightStickCal[@as(c_int, 8)]) << @intCast(@as(c_int, 4))) | (@as(c_int, pRightStickCal[@as(c_int, 7)]) >> @intCast(@as(c_int, 4))));
    {
        stick = 0;
        while (stick < @as(usize, 2)) : (stick +%= 1) {
            {
                axis = 0;
                while (axis < @as(usize, 2)) : (axis +%= 1) {
                    if (@as(c_int, ctx.*.m_StickCalData[stick].axis[axis].sCenter) == @as(c_int, 4095)) {
                        ctx.*.m_StickCalData[stick].axis[axis].sCenter = 2048;
                    }
                    if (@as(c_int, ctx.*.m_StickCalData[stick].axis[axis].sMax) == @as(c_int, 4095)) {
                        ctx.*.m_StickCalData[stick].axis[axis].sMax = @intFromFloat(@as(f32, @floatFromInt(@as(c_int, ctx.*.m_StickCalData[stick].axis[axis].sCenter))) * @as(f32, 0.7));
                    }
                    if (@as(c_int, ctx.*.m_StickCalData[stick].axis[axis].sMin) == @as(c_int, 4095)) {
                        ctx.*.m_StickCalData[stick].axis[axis].sMin = @intFromFloat(@as(f32, @floatFromInt(@as(c_int, ctx.*.m_StickCalData[stick].axis[axis].sCenter))) * @as(f32, 0.7));
                    }
                }
            }
        }
    }
    {
        stick = 0;
        while (stick < @as(usize, 2)) : (stick +%= 1) {
            {
                axis = 0;
                while (axis < @as(usize, 2)) : (axis +%= 1) {
                    ctx.*.m_StickExtents[stick].axis[axis].sMin = @truncate(-@as(c_int, @as(Sint16, @intFromFloat(@as(f32, @floatFromInt(@as(c_int, ctx.*.m_StickCalData[stick].axis[axis].sMin))) * @as(f32, 0.7)))));
                    ctx.*.m_StickExtents[stick].axis[axis].sMax = @intFromFloat(@as(f32, @floatFromInt(@as(c_int, ctx.*.m_StickCalData[stick].axis[axis].sMax))) * @as(f32, 0.7));
                }
            }
        }
    }
    {
        stick = 0;
        while (stick < @as(usize, 2)) : (stick +%= 1) {
            {
                axis = 0;
                while (axis < @as(usize, 2)) : (axis +%= 1) {
                    ctx.*.m_SimpleStickExtents[stick].axis[axis].sMin = @intFromFloat(@as(f32, @floatFromInt(@as(c_int, @as(Sint16, @truncate(~@as(c_int, 32767)))))) * @as(f32, 0.5));
                    ctx.*.m_SimpleStickExtents[stick].axis[axis].sMax = @intFromFloat(@as(f32, @floatFromInt(@as(c_int, @as(Sint16, @truncate(@as(c_int, 32767)))))) * @as(f32, 0.5));
                }
            }
        }
    }
    return @"true" != 0;
}
pub fn LoadIMUCalibration(ctx: [*c]SDL_DriverSwitch_Context) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var reply: [*c]SwitchSubcommandInputPacket_t = null;
    _ = &reply;
    var readParams: SwitchSPIOpData_t = undefined;
    _ = &readParams;
    readParams.unAddress = k_unSPIIMUScaleStartOffset;
    readParams.ucLength = @bitCast(@as(i8, @truncate((k_unSPIIMUScaleEndOffset - k_unSPIIMUScaleStartOffset) + @as(c_int, 1))));
    if (WriteSubcommand(ctx, k_eSwitchSubcommandIDs_SPIFlashRead, @ptrCast(@alignCast(&readParams)), @truncate(@sizeOf(@TypeOf(readParams))), &reply)) {
        var pIMUScale: [*c]Uint8 = undefined;
        _ = &pIMUScale;
        var sAccelRawX: Sint16 = undefined;
        _ = &sAccelRawX;
        var sAccelRawY: Sint16 = undefined;
        _ = &sAccelRawY;
        var sAccelRawZ: Sint16 = undefined;
        _ = &sAccelRawZ;
        var sGyroRawX: Sint16 = undefined;
        _ = &sGyroRawX;
        var sGyroRawY: Sint16 = undefined;
        _ = &sGyroRawY;
        var sGyroRawZ: Sint16 = undefined;
        _ = &sGyroRawZ;
        var sAccelSensCoeffX: Sint16 = undefined;
        _ = &sAccelSensCoeffX;
        var sAccelSensCoeffY: Sint16 = undefined;
        _ = &sAccelSensCoeffY;
        var sAccelSensCoeffZ: Sint16 = undefined;
        _ = &sAccelSensCoeffZ;
        var sGyroSensCoeffX: Sint16 = undefined;
        _ = &sGyroSensCoeffX;
        var sGyroSensCoeffY: Sint16 = undefined;
        _ = &sGyroSensCoeffY;
        var sGyroSensCoeffZ: Sint16 = undefined;
        _ = &sGyroSensCoeffZ;
        pIMUScale = @ptrCast(@alignCast(&reply.*.unnamed_0.spiReadData.rgucReadData));
        sAccelRawX = @truncate((@as(c_int, pIMUScale[@as(c_int, 1)]) << @intCast(@as(c_int, 8))) | @as(c_int, pIMUScale[@as(c_int, 0)]));
        sAccelRawY = @truncate((@as(c_int, pIMUScale[@as(c_int, 3)]) << @intCast(@as(c_int, 8))) | @as(c_int, pIMUScale[@as(c_int, 2)]));
        sAccelRawZ = @truncate((@as(c_int, pIMUScale[@as(c_int, 5)]) << @intCast(@as(c_int, 8))) | @as(c_int, pIMUScale[@as(c_int, 4)]));
        sAccelSensCoeffX = @truncate((@as(c_int, pIMUScale[@as(c_int, 7)]) << @intCast(@as(c_int, 8))) | @as(c_int, pIMUScale[@as(c_int, 6)]));
        sAccelSensCoeffY = @truncate((@as(c_int, pIMUScale[@as(c_int, 9)]) << @intCast(@as(c_int, 8))) | @as(c_int, pIMUScale[@as(c_int, 8)]));
        sAccelSensCoeffZ = @truncate((@as(c_int, pIMUScale[@as(c_int, 11)]) << @intCast(@as(c_int, 8))) | @as(c_int, pIMUScale[@as(c_int, 10)]));
        sGyroRawX = @truncate((@as(c_int, pIMUScale[@as(c_int, 13)]) << @intCast(@as(c_int, 8))) | @as(c_int, pIMUScale[@as(c_int, 12)]));
        sGyroRawY = @truncate((@as(c_int, pIMUScale[@as(c_int, 15)]) << @intCast(@as(c_int, 8))) | @as(c_int, pIMUScale[@as(c_int, 14)]));
        sGyroRawZ = @truncate((@as(c_int, pIMUScale[@as(c_int, 17)]) << @intCast(@as(c_int, 8))) | @as(c_int, pIMUScale[@as(c_int, 16)]));
        sGyroSensCoeffX = @truncate((@as(c_int, pIMUScale[@as(c_int, 19)]) << @intCast(@as(c_int, 8))) | @as(c_int, pIMUScale[@as(c_int, 18)]));
        sGyroSensCoeffY = @truncate((@as(c_int, pIMUScale[@as(c_int, 21)]) << @intCast(@as(c_int, 8))) | @as(c_int, pIMUScale[@as(c_int, 20)]));
        sGyroSensCoeffZ = @truncate((@as(c_int, pIMUScale[@as(c_int, 23)]) << @intCast(@as(c_int, 8))) | @as(c_int, pIMUScale[@as(c_int, 22)]));
        readParams.unAddress = k_unSPIIMUUserScaleStartOffset;
        readParams.ucLength = @bitCast(@as(i8, @truncate((k_unSPIIMUUserScaleEndOffset - k_unSPIIMUUserScaleStartOffset) + @as(c_int, 1))));
        if (WriteSubcommand(ctx, k_eSwitchSubcommandIDs_SPIFlashRead, @ptrCast(@alignCast(&readParams)), @truncate(@sizeOf(@TypeOf(readParams))), &reply)) {
            var pUserIMUScale: [*c]Uint8 = @ptrCast(@alignCast(&reply.*.unnamed_0.spiReadData.rgucReadData));
            _ = &pUserIMUScale;
            if ((@as(c_int, pUserIMUScale[@as(c_int, 0)]) | (@as(c_int, pUserIMUScale[@as(c_int, 1)]) << @intCast(@as(c_int, 8)))) == @as(c_int, 41394)) {
                pIMUScale = pUserIMUScale;
                sAccelRawX = @truncate((@as(c_int, pIMUScale[@as(c_int, 3)]) << @intCast(@as(c_int, 8))) | @as(c_int, pIMUScale[@as(c_int, 2)]));
                sAccelRawY = @truncate((@as(c_int, pIMUScale[@as(c_int, 5)]) << @intCast(@as(c_int, 8))) | @as(c_int, pIMUScale[@as(c_int, 4)]));
                sAccelRawZ = @truncate((@as(c_int, pIMUScale[@as(c_int, 7)]) << @intCast(@as(c_int, 8))) | @as(c_int, pIMUScale[@as(c_int, 6)]));
                sGyroRawX = @truncate((@as(c_int, pIMUScale[@as(c_int, 15)]) << @intCast(@as(c_int, 8))) | @as(c_int, pIMUScale[@as(c_int, 14)]));
                sGyroRawY = @truncate((@as(c_int, pIMUScale[@as(c_int, 17)]) << @intCast(@as(c_int, 8))) | @as(c_int, pIMUScale[@as(c_int, 16)]));
                sGyroRawZ = @truncate((@as(c_int, pIMUScale[@as(c_int, 19)]) << @intCast(@as(c_int, 8))) | @as(c_int, pIMUScale[@as(c_int, 18)]));
            }
        }
        ctx.*.m_IMUScaleData.sGyroOffsetX = sGyroRawX;
        ctx.*.m_IMUScaleData.sGyroOffsetY = sGyroRawY;
        ctx.*.m_IMUScaleData.sGyroOffsetZ = sGyroRawZ;
        ctx.*.m_IMUScaleData.fAccelScaleX = (SWITCH_ACCEL_SCALE_MULT / (@as(f32, @floatFromInt(sAccelSensCoeffX)) - @as(f32, @floatFromInt(sAccelRawX)))) * SDL_STANDARD_GRAVITY;
        ctx.*.m_IMUScaleData.fAccelScaleY = (SWITCH_ACCEL_SCALE_MULT / (@as(f32, @floatFromInt(sAccelSensCoeffY)) - @as(f32, @floatFromInt(sAccelRawY)))) * SDL_STANDARD_GRAVITY;
        ctx.*.m_IMUScaleData.fAccelScaleZ = (SWITCH_ACCEL_SCALE_MULT / (@as(f32, @floatFromInt(sAccelSensCoeffZ)) - @as(f32, @floatFromInt(sAccelRawZ)))) * SDL_STANDARD_GRAVITY;
        ctx.*.m_IMUScaleData.fGyroScaleX = ((SWITCH_GYRO_SCALE_MULT / (@as(f32, @floatFromInt(sGyroSensCoeffX)) - @as(f32, @floatFromInt(sGyroRawX)))) * SDL_PI_F) / @as(f32, 180.0);
        ctx.*.m_IMUScaleData.fGyroScaleY = ((SWITCH_GYRO_SCALE_MULT / (@as(f32, @floatFromInt(sGyroSensCoeffY)) - @as(f32, @floatFromInt(sGyroRawY)))) * SDL_PI_F) / @as(f32, 180.0);
        ctx.*.m_IMUScaleData.fGyroScaleZ = ((SWITCH_GYRO_SCALE_MULT / (@as(f32, @floatFromInt(sGyroSensCoeffZ)) - @as(f32, @floatFromInt(sGyroRawZ)))) * SDL_PI_F) / @as(f32, 180.0);
    } else {
        const accelScale: f32 = SDL_STANDARD_GRAVITY / SWITCH_ACCEL_SCALE;
        _ = &accelScale;
        const gyroScale: f32 = (SDL_PI_F / @as(f32, 180.0)) / SWITCH_GYRO_SCALE;
        _ = &gyroScale;
        ctx.*.m_IMUScaleData.fAccelScaleX = accelScale;
        ctx.*.m_IMUScaleData.fAccelScaleY = accelScale;
        ctx.*.m_IMUScaleData.fAccelScaleZ = accelScale;
        ctx.*.m_IMUScaleData.fGyroScaleX = gyroScale;
        ctx.*.m_IMUScaleData.fGyroScaleY = gyroScale;
        ctx.*.m_IMUScaleData.fGyroScaleZ = gyroScale;
        ctx.*.m_IMUScaleData.sGyroOffsetX = 0;
        ctx.*.m_IMUScaleData.sGyroOffsetY = 0;
        ctx.*.m_IMUScaleData.sGyroOffsetZ = 0;
    }
    return @"true" != 0;
}
pub fn ApplyStickCalibration(ctx: [*c]SDL_DriverSwitch_Context, nStick: c_int, nAxis: c_int, arg_sRawValue: Sint16) callconv(.c) Sint16 {
    @setEvalBranchQuota(100000);
    var sRawValue = arg_sRawValue;
    _ = &sRawValue;
    {
        const ref = &sRawValue;
        ref.* = @truncate(@as(c_int, ref.*) - @as(c_int, ctx.*.m_StickCalData[@bitCast(@as(isize, @intCast(nStick)))].axis[@bitCast(@as(isize, @intCast(nAxis)))].sCenter));
    }
    if (@as(c_int, sRawValue) >= @as(c_int, 0)) {
        if (@as(c_int, sRawValue) > @as(c_int, ctx.*.m_StickExtents[@bitCast(@as(isize, @intCast(nStick)))].axis[@bitCast(@as(isize, @intCast(nAxis)))].sMax)) {
            ctx.*.m_StickExtents[@bitCast(@as(isize, @intCast(nStick)))].axis[@bitCast(@as(isize, @intCast(nAxis)))].sMax = sRawValue;
        }
        return @intFromFloat(HIDAPI_RemapVal(@floatFromInt(sRawValue), @floatFromInt(@as(c_int, 0)), @floatFromInt(ctx.*.m_StickExtents[@bitCast(@as(isize, @intCast(nStick)))].axis[@bitCast(@as(isize, @intCast(nAxis)))].sMax), @floatFromInt(@as(c_int, 0)), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767))))));
    } else {
        if (@as(c_int, sRawValue) < @as(c_int, ctx.*.m_StickExtents[@bitCast(@as(isize, @intCast(nStick)))].axis[@bitCast(@as(isize, @intCast(nAxis)))].sMin)) {
            ctx.*.m_StickExtents[@bitCast(@as(isize, @intCast(nStick)))].axis[@bitCast(@as(isize, @intCast(nAxis)))].sMin = sRawValue;
        }
        return @intFromFloat(HIDAPI_RemapVal(@floatFromInt(sRawValue), @floatFromInt(ctx.*.m_StickExtents[@bitCast(@as(isize, @intCast(nStick)))].axis[@bitCast(@as(isize, @intCast(nAxis)))].sMin), @floatFromInt(@as(c_int, 0)), @floatFromInt(@as(Sint16, @truncate(~@as(c_int, 32767)))), @floatFromInt(@as(c_int, 0))));
    }
}
pub fn ApplySimpleStickCalibration(ctx: [*c]SDL_DriverSwitch_Context, nStick: c_int, nAxis: c_int, arg_sRawValue: Sint16) callconv(.c) Sint16 {
    @setEvalBranchQuota(100000);
    var sRawValue = arg_sRawValue;
    _ = &sRawValue;
    const usJoystickCenter: Uint16 = 32768;
    _ = &usJoystickCenter;
    {
        const ref = &sRawValue;
        ref.* = @truncate(@as(c_int, ref.*) - @as(c_int, usJoystickCenter));
    }
    if (@as(c_int, sRawValue) >= @as(c_int, 0)) {
        if (@as(c_int, sRawValue) > @as(c_int, ctx.*.m_SimpleStickExtents[@bitCast(@as(isize, @intCast(nStick)))].axis[@bitCast(@as(isize, @intCast(nAxis)))].sMax)) {
            ctx.*.m_SimpleStickExtents[@bitCast(@as(isize, @intCast(nStick)))].axis[@bitCast(@as(isize, @intCast(nAxis)))].sMax = sRawValue;
        }
        return @intFromFloat(HIDAPI_RemapVal(@floatFromInt(sRawValue), @floatFromInt(@as(c_int, 0)), @floatFromInt(ctx.*.m_SimpleStickExtents[@bitCast(@as(isize, @intCast(nStick)))].axis[@bitCast(@as(isize, @intCast(nAxis)))].sMax), @floatFromInt(@as(c_int, 0)), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767))))));
    } else {
        if (@as(c_int, sRawValue) < @as(c_int, ctx.*.m_SimpleStickExtents[@bitCast(@as(isize, @intCast(nStick)))].axis[@bitCast(@as(isize, @intCast(nAxis)))].sMin)) {
            ctx.*.m_SimpleStickExtents[@bitCast(@as(isize, @intCast(nStick)))].axis[@bitCast(@as(isize, @intCast(nAxis)))].sMin = sRawValue;
        }
        return @intFromFloat(HIDAPI_RemapVal(@floatFromInt(sRawValue), @floatFromInt(ctx.*.m_SimpleStickExtents[@bitCast(@as(isize, @intCast(nStick)))].axis[@bitCast(@as(isize, @intCast(nAxis)))].sMin), @floatFromInt(@as(c_int, 0)), @floatFromInt(@as(Sint16, @truncate(~@as(c_int, 32767)))), @floatFromInt(@as(c_int, 0))));
    }
}
pub fn RemapButton(ctx: [*c]SDL_DriverSwitch_Context, button: Uint8) callconv(.c) Uint8 {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (ctx.*.m_bUseButtonLabels) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                switch (@as(c_int, button)) {
                    SDL_GAMEPAD_BUTTON_SOUTH => {
                        sdl_pc = 5;
                        continue;
                    },
                    SDL_GAMEPAD_BUTTON_EAST => {
                        sdl_pc = 6;
                        continue;
                    },
                    SDL_GAMEPAD_BUTTON_WEST => {
                        sdl_pc = 7;
                        continue;
                    },
                    SDL_GAMEPAD_BUTTON_NORTH => {
                        sdl_pc = 8;
                        continue;
                    },
                    else => {
                        sdl_pc = 9;
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
                return button;
            },
            4 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            5 => {
                return SDL_GAMEPAD_BUTTON_EAST;
            },
            6 => {
                return SDL_GAMEPAD_BUTTON_SOUTH;
            },
            7 => {
                return SDL_GAMEPAD_BUTTON_NORTH;
            },
            8 => {
                return SDL_GAMEPAD_BUTTON_WEST;
            },
            9 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn GetMaxWriteAttempts(device: [*c]SDL_HIDAPI_Device) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    if ((@as(c_int, device.*.vendor_id) == USB_VENDOR_NINTENDO) and (@as(c_int, device.*.product_id) == USB_PRODUCT_NINTENDO_SWITCH_JOYCON_GRIP)) {
        return 20;
    } else {
        return 5;
    }
}
pub fn ReadJoyConControllerType(device: [*c]SDL_HIDAPI_Device) callconv(.c) ESwitchDeviceInfoControllerType {
    @setEvalBranchQuota(100000);
    var eControllerType: ESwitchDeviceInfoControllerType = k_eSwitchDeviceInfoControllerType_Unknown;
    _ = &eControllerType;
    const MAX_ATTEMPTS: c_int = 1;
    _ = &MAX_ATTEMPTS;
    var attempts: c_int = 0;
    _ = &attempts;
    var ctx: [*c]SDL_DriverSwitch_Context = undefined;
    ctx = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(ctx.*)))));
    _ = &ctx;
    if (ctx != null) {
        ctx.*.device = device;
        ctx.*.m_bSyncWrite = @"true" != 0;
        ctx.*.m_nMaxWriteAttempts = GetMaxWriteAttempts(device);
        while (true) {
            attempts += 1;
            if (device.*.is_bluetooth) {
                var reply: [*c]SwitchSubcommandInputPacket_t = null;
                _ = &reply;
                if (WriteSubcommand(ctx, k_eSwitchSubcommandIDs_RequestDeviceInfo, null, 0, &reply)) {
                    eControllerType = CalculateControllerType(ctx, reply.*.unnamed_0.deviceInfo.ucDeviceType);
                }
            } else {
                if (WriteProprietary(ctx, k_eSwitchProprietaryCommandIDs_Status, null, 0, @"true" != 0)) {
                    var status: [*c]SwitchProprietaryStatusPacket_t = @ptrCast(@alignCast(&ctx.*.m_rgucReadBuffer[@as(c_int, 0)]));
                    _ = &status;
                    eControllerType = CalculateControllerType(ctx, status.*.ucDeviceType);
                }
            }
            if ((eControllerType == @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_Unknown)) and (attempts < MAX_ATTEMPTS)) {
                SDL_Delay_REAL(100);
                continue;
            }
            break;
        }
        SDL_free_REAL(@ptrCast(@alignCast(ctx)));
    }
    return eControllerType;
}
pub fn HasHomeLED(ctx: [*c]SDL_DriverSwitch_Context) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var vendor_id: Uint16 = ctx.*.device.*.vendor_id;
    _ = &vendor_id;
    var product_id: Uint16 = ctx.*.device.*.product_id;
    _ = &product_id;
    if ((@as(c_int, vendor_id) == @as(c_int, 0)) and (@as(c_int, product_id) == @as(c_int, 0))) {
        return @"false" != 0;
    }
    if ((@as(c_int, vendor_id) == @as(c_int, 3853)) and (@as(c_int, product_id) == @as(c_int, 246))) {
        return @"false" != 0;
    }
    if ((ctx.*.m_eControllerType == @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_Unknown)) or (ctx.*.m_eControllerType == @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_LicProController))) {
        return @"false" != 0;
    }
    if ((@as(c_int, vendor_id) == USB_VENDOR_NINTENDO) and (ctx.*.m_eControllerType > @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_ProController))) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn AlwaysUsesLabels(vendor_id: Uint16, product_id: Uint16, eControllerType: ESwitchDeviceInfoControllerType) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (SDL_IsJoystickGameCube(vendor_id, product_id)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return @"true" != 0;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                switch (eControllerType) {
                    @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_HVCLeft) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_HVCRight) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_NESLeft) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_NESRight) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_N64) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_SEGA_Genesis) => {
                        sdl_pc = 10;
                        continue;
                    },
                    else => {
                        sdl_pc = 11;
                        continue;
                    },
                }
            },
            4 => {
                return undefined;
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
                return @"true" != 0;
            },
            11 => {
                return @"false" != 0;
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverNintendoClassic_RegisterHints(callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = SDL_AddHintCallback_REAL("SDL_JOYSTICK_HIDAPI_NINTENDO_CLASSIC", callback, userdata);
}
pub fn HIDAPI_DriverNintendoClassic_UnregisterHints(callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_RemoveHintCallback_REAL("SDL_JOYSTICK_HIDAPI_NINTENDO_CLASSIC", callback, userdata);
}
pub fn HIDAPI_DriverNintendoClassic_IsEnabled() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI_NINTENDO_CLASSIC", SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI", @"true" != 0));
}
pub fn HIDAPI_DriverNintendoClassic_IsSupportedDevice(_: [*c]SDL_HIDAPI_Device, name: [*c]const u8, arg_type: SDL_GamepadType, vendor_id: Uint16, product_id: Uint16, _: Uint16, _: c_int, _: c_int, _: c_int, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    if (@as(c_int, vendor_id) == USB_VENDOR_NINTENDO) {
        if (@as(c_int, product_id) == USB_PRODUCT_NINTENDO_SWITCH_JOYCON_RIGHT) {
            if ((SDL_strncmp_REAL(name, "NES Controller", 14) == @as(c_int, 0)) or (SDL_strncmp_REAL(name, "HVC Controller", 14) == @as(c_int, 0))) {
                return @"true" != 0;
            }
        }
        if (@as(c_int, product_id) == USB_PRODUCT_NINTENDO_N64_CONTROLLER) {
            return @"true" != 0;
        }
        if (@as(c_int, product_id) == USB_PRODUCT_NINTENDO_SEGA_GENESIS_CONTROLLER) {
            return @"true" != 0;
        }
        if (@as(c_int, product_id) == USB_PRODUCT_NINTENDO_SNES_CONTROLLER) {
            return @"true" != 0;
        }
    }
    return @"false" != 0;
}
pub fn HIDAPI_DriverJoyCons_RegisterHints(callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = SDL_AddHintCallback_REAL("SDL_JOYSTICK_HIDAPI_JOY_CONS", callback, userdata);
}
pub fn HIDAPI_DriverJoyCons_UnregisterHints(callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_RemoveHintCallback_REAL("SDL_JOYSTICK_HIDAPI_JOY_CONS", callback, userdata);
}
pub fn HIDAPI_DriverJoyCons_IsEnabled() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI_JOY_CONS", SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI", @"true" != 0));
}
pub fn HIDAPI_DriverJoyCons_IsSupportedDevice(device: [*c]SDL_HIDAPI_Device, _: [*c]const u8, arg_type: SDL_GamepadType, vendor_id: Uint16, product_id: Uint16, _: Uint16, _: c_int, _: c_int, _: c_int, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    if (@as(c_int, vendor_id) == USB_VENDOR_NINTENDO) {
        if (((@as(c_int, product_id) == USB_PRODUCT_NINTENDO_SWITCH_PRO) and (device != null)) and (device.*.dev != null)) {
            var eControllerType: ESwitchDeviceInfoControllerType = ReadJoyConControllerType(device);
            _ = &eControllerType;
            if ((eControllerType == @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_JoyConLeft)) or (eControllerType == @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_JoyConRight))) {
                return @"true" != 0;
            }
        }
        if (((@as(c_int, product_id) == USB_PRODUCT_NINTENDO_SWITCH_JOYCON_LEFT) or (@as(c_int, product_id) == USB_PRODUCT_NINTENDO_SWITCH_JOYCON_RIGHT)) or (@as(c_int, product_id) == USB_PRODUCT_NINTENDO_SWITCH_JOYCON_GRIP)) {
            return @"true" != 0;
        }
    }
    return @"false" != 0;
}
pub fn HIDAPI_DriverSwitch_RegisterHints(callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = SDL_AddHintCallback_REAL("SDL_JOYSTICK_HIDAPI_SWITCH", callback, userdata);
}
pub fn HIDAPI_DriverSwitch_UnregisterHints(callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_RemoveHintCallback_REAL("SDL_JOYSTICK_HIDAPI_SWITCH", callback, userdata);
}
pub fn HIDAPI_DriverSwitch_IsEnabled() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI_SWITCH", SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI", @"true" != 0));
}
pub fn HIDAPI_DriverSwitch_IsSupportedDevice(device: [*c]SDL_HIDAPI_Device, name: [*c]const u8, arg_type: SDL_GamepadType, vendor_id: Uint16, product_id: Uint16, version: Uint16, interface_number: c_int, interface_class: c_int, interface_subclass: c_int, interface_protocol: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    if ((name != null) and (SDL_strcmp_REAL(name, "HORI Wireless Switch Pad") == @as(c_int, 0))) {
        return @"false" != 0;
    }
    if (HIDAPI_DriverNintendoClassic_IsSupportedDevice(device, name, @"type", vendor_id, product_id, version, interface_number, interface_class, interface_subclass, interface_protocol) or HIDAPI_DriverJoyCons_IsSupportedDevice(device, name, @"type", vendor_id, product_id, version, interface_number, interface_class, interface_subclass, interface_protocol)) {
        return @"false" != 0;
    }
    if (@"type" != @as(SDL_GamepadType, SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_PRO)) {
        return @"false" != 0;
    }
    if ((@as(c_int, vendor_id) == USB_VENDOR_NINTENDO) and (@as(c_int, product_id) == USB_PRODUCT_NINTENDO_SWITCH2_PRO)) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn UpdateDeviceIdentity(device: [*c]SDL_HIDAPI_Device) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSwitch_Context = undefined;
    _ = &ctx;
    var serial: [18]u8 = undefined;
    _ = &serial;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                ctx = @ptrCast(@alignCast(device.*.context));
                if (ctx.*.m_bInputOnly) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                if (SDL_IsJoystickGameCube(device.*.vendor_id, device.*.product_id)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            2 => {
                switch (ctx.*.m_eControllerType) {
                    @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_JoyConLeft) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_JoyConRight) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_ProController) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_LicProController) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_HVCLeft) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_HVCRight) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_NESLeft) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_NESRight) => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_SNES) => {
                        sdl_pc = 16;
                        continue;
                    },
                    @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_N64) => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_SEGA_Genesis) => {
                        sdl_pc = 18;
                        continue;
                    },
                    @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_Unknown) => {
                        sdl_pc = 19;
                        continue;
                    },
                    else => {
                        sdl_pc = 28;
                        continue;
                    },
                }
            },
            3 => {
                {}
            },
            4 => {
                device.*.type = SDL_GAMEPAD_TYPE_GAMECUBE;
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
                device.*.guid.data[@as(c_int, 15)] = @truncate(ctx.*.m_eControllerType);
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&serial)), @sizeOf(@TypeOf(serial)), "%.2x-%.2x-%.2x-%.2x-%.2x-%.2x", ctx.*.m_rgucMACAddress[@as(c_int, 0)], ctx.*.m_rgucMACAddress[@as(c_int, 1)], ctx.*.m_rgucMACAddress[@as(c_int, 2)], ctx.*.m_rgucMACAddress[@as(c_int, 3)], ctx.*.m_rgucMACAddress[@as(c_int, 4)], ctx.*.m_rgucMACAddress[@as(c_int, 5)]);
                HIDAPI_SetDeviceSerial(device, @ptrCast(@alignCast(&serial)));
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            8 => {
                HIDAPI_SetDeviceName(device, "Nintendo Switch Joy-Con (L)");
                HIDAPI_SetDeviceProduct(device, USB_VENDOR_NINTENDO, USB_PRODUCT_NINTENDO_SWITCH_JOYCON_LEFT);
                device.*.type = SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_LEFT;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            9 => {
                HIDAPI_SetDeviceName(device, "Nintendo Switch Joy-Con (R)");
                HIDAPI_SetDeviceProduct(device, USB_VENDOR_NINTENDO, USB_PRODUCT_NINTENDO_SWITCH_JOYCON_RIGHT);
                device.*.type = SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_RIGHT;
                {
                    sdl_pc = 7;
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
                HIDAPI_SetDeviceName(device, "Nintendo Switch Pro Controller");
                HIDAPI_SetDeviceProduct(device, USB_VENDOR_NINTENDO, USB_PRODUCT_NINTENDO_SWITCH_PRO);
                device.*.type = SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_PRO;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            12 => {
                HIDAPI_SetDeviceName(device, "Nintendo Family Computer Controller (1)");
                device.*.type = SDL_GAMEPAD_TYPE_STANDARD;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            13 => {
                HIDAPI_SetDeviceName(device, "Nintendo Family Computer Controller (2)");
                device.*.type = SDL_GAMEPAD_TYPE_STANDARD;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            14 => {
                HIDAPI_SetDeviceName(device, "Nintendo NES Controller (L)");
                device.*.type = SDL_GAMEPAD_TYPE_STANDARD;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            15 => {
                HIDAPI_SetDeviceName(device, "Nintendo NES Controller (R)");
                device.*.type = SDL_GAMEPAD_TYPE_STANDARD;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            16 => {
                HIDAPI_SetDeviceName(device, "Nintendo SNES Controller");
                HIDAPI_SetDeviceProduct(device, USB_VENDOR_NINTENDO, USB_PRODUCT_NINTENDO_SNES_CONTROLLER);
                device.*.type = SDL_GAMEPAD_TYPE_STANDARD;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            17 => {
                HIDAPI_SetDeviceName(device, "Nintendo N64 Controller");
                HIDAPI_SetDeviceProduct(device, USB_VENDOR_NINTENDO, USB_PRODUCT_NINTENDO_N64_CONTROLLER);
                device.*.type = SDL_GAMEPAD_TYPE_STANDARD;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            18 => {
                HIDAPI_SetDeviceName(device, "Nintendo SEGA Genesis Controller");
                HIDAPI_SetDeviceProduct(device, USB_VENDOR_NINTENDO, USB_PRODUCT_NINTENDO_SEGA_GENESIS_CONTROLLER);
                device.*.type = SDL_GAMEPAD_TYPE_STANDARD;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            19 => {
                if (@as(c_int, device.*.vendor_id) == USB_VENDOR_NINTENDO) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                switch (@as(c_int, device.*.product_id)) {
                    USB_PRODUCT_NINTENDO_SWITCH_JOYCON_LEFT => {
                        sdl_pc = 24;
                        continue;
                    },
                    USB_PRODUCT_NINTENDO_SWITCH_JOYCON_RIGHT => {
                        sdl_pc = 25;
                        continue;
                    },
                    USB_PRODUCT_NINTENDO_SWITCH_PRO => {
                        sdl_pc = 26;
                        continue;
                    },
                    else => {
                        sdl_pc = 27;
                        continue;
                    },
                }
            },
            21 => {
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            22 => {
                return;
            },
            23 => {
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            24 => {
                ctx.*.m_eControllerType = k_eSwitchDeviceInfoControllerType_JoyConLeft;
                HIDAPI_SetDeviceName(device, "Nintendo Switch Joy-Con (L)");
                device.*.type = SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_LEFT;
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            25 => {
                ctx.*.m_eControllerType = k_eSwitchDeviceInfoControllerType_JoyConRight;
                HIDAPI_SetDeviceName(device, "Nintendo Switch Joy-Con (R)");
                device.*.type = SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_RIGHT;
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            26 => {
                ctx.*.m_eControllerType = k_eSwitchDeviceInfoControllerType_ProController;
                HIDAPI_SetDeviceName(device, "Nintendo Switch Pro Controller");
                device.*.type = SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_PRO;
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            27 => {
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            28 => {
                device.*.type = SDL_GAMEPAD_TYPE_STANDARD;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverSwitch_InitDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSwitch_Context = undefined;
    _ = &ctx;
    ctx = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(ctx.*)))));
    if (!(ctx != null)) {
        return @"false" != 0;
    }
    ctx.*.device = device;
    device.*.context = @ptrCast(@alignCast(ctx));
    ctx.*.m_nMaxWriteAttempts = GetMaxWriteAttempts(device);
    ctx.*.m_bSyncWrite = @"true" != 0;
    if (!device.*.is_bluetooth) {
        ctx.*.m_bInputOnly = SDL_IsJoystickNintendoSwitchProInputOnly(device.*.vendor_id, device.*.product_id) or SDL_IsJoystickNintendoSwitch2ProInputOnly(device.*.vendor_id, device.*.product_id);
    }
    ctx.*.m_bSwitch2 = SDL_IsJoystickNintendoSwitch2Pro(device.*.vendor_id, device.*.product_id);
    if (!ctx.*.m_bInputOnly) {
        SetNeutralRumble(device, &ctx.*.m_RumblePacket.rumbleData[@as(c_int, 0)]);
        SetNeutralRumble(device, &ctx.*.m_RumblePacket.rumbleData[@as(c_int, 1)]);
        _ = BReadDeviceInfo(ctx);
    }
    UpdateDeviceIdentity(device);
    if (device.*.is_bluetooth) {
        if (HIDAPI_HasConnectedUSBDevice(device.*.serial)) {
            return @"true" != 0;
        }
    } else {
        HIDAPI_DisconnectBluetoothDevice(device.*.serial);
    }
    return HIDAPI_JoystickConnected(device, null);
}
pub fn HIDAPI_DriverSwitch_GetDevicePlayerIndex(_: [*c]SDL_HIDAPI_Device, _: SDL_JoystickID) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return -@as(c_int, 1);
}
pub fn HIDAPI_DriverSwitch_SetDevicePlayerIndex(device: [*c]SDL_HIDAPI_Device, _: SDL_JoystickID, player_index: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSwitch_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    if (!(ctx.*.joystick != null)) {
        return;
    }
    ctx.*.m_nPlayerIndex = player_index;
    UpdateSlotLED(ctx);
}
pub fn HIDAPI_DriverSwitch_OpenJoystick(device: [*c]SDL_HIDAPI_Device, joystick: [*c]SDL_Joystick) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSwitch_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    SDL_AssertJoysticksLocked();
    ctx.*.joystick = joystick;
    ctx.*.m_bSyncWrite = @"true" != 0;
    if (!ctx.*.m_bInputOnly) {
        GetInitialInputMode(ctx);
        ctx.*.m_nCurrentInputMode = ctx.*.m_nInitialInputMode;
        SetNeutralRumble(device, &ctx.*.m_RumblePacket.rumbleData[@as(c_int, 0)]);
        SetNeutralRumble(device, &ctx.*.m_RumblePacket.rumbleData[@as(c_int, 1)]);
        if (!device.*.is_bluetooth) {
            if (!BTrySetupUSB(ctx)) {
                _ = SDL_SetError_REAL("Couldn't setup USB mode");
                return @"false" != 0;
            }
        }
        if (!LoadStickCalibration(ctx)) {
            _ = SDL_SetError_REAL("Couldn't load stick calibration");
            return @"false" != 0;
        }
        if ((((((((ctx.*.m_eControllerType != @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_HVCLeft)) and (ctx.*.m_eControllerType != @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_HVCRight))) and (ctx.*.m_eControllerType != @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_NESLeft))) and (ctx.*.m_eControllerType != @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_NESRight))) and (ctx.*.m_eControllerType != @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_SNES))) and (ctx.*.m_eControllerType != @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_N64))) and (ctx.*.m_eControllerType != @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_SEGA_Genesis))) and !((@as(c_int, device.*.vendor_id) == USB_VENDOR_PDP) and (@as(c_int, device.*.product_id) == USB_PRODUCT_PDP_REALMZ_WIRELESS))) {
            if (LoadIMUCalibration(ctx)) {
                ctx.*.m_bSensorsSupported = @"true" != 0;
            }
        }
        _ = SetVibrationEnabled(ctx, 1);
        _ = SDL_AddHintCallback_REAL("SDL_JOYSTICK_ENHANCED_REPORTS", SDL_EnhancedReportsChanged, @ptrCast(@alignCast(ctx)));
        if (!device.*.is_bluetooth) {
            if (!WriteProprietary(ctx, k_eSwitchProprietaryCommandIDs_ForceUSB, null, 0, @"false" != 0)) {
                _ = SDL_SetError_REAL("Couldn't start USB reports");
                return @"false" != 0;
            }
        }
        if (HasHomeLED(ctx)) {
            if ((ctx.*.m_eControllerType == @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_JoyConLeft)) or (ctx.*.m_eControllerType == @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_JoyConRight))) {
                _ = SDL_AddHintCallback_REAL("SDL_JOYSTICK_HIDAPI_JOYCON_HOME_LED", SDL_HomeLEDHintChanged, @ptrCast(@alignCast(ctx)));
            } else {
                _ = SDL_AddHintCallback_REAL("SDL_JOYSTICK_HIDAPI_SWITCH_HOME_LED", SDL_HomeLEDHintChanged, @ptrCast(@alignCast(ctx)));
            }
        }
    }
    if (AlwaysUsesLabels(device.*.vendor_id, device.*.product_id, ctx.*.m_eControllerType)) {
        ctx.*.m_bUseButtonLabels = @"true" != 0;
    }
    ctx.*.m_nPlayerIndex = SDL_GetJoystickPlayerIndex_REAL(joystick);
    ctx.*.m_bPlayerLights = SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI_SWITCH_PLAYER_LED", @"true" != 0);
    UpdateSlotLED(ctx);
    _ = SDL_AddHintCallback_REAL("SDL_JOYSTICK_HIDAPI_SWITCH_PLAYER_LED", SDL_PlayerLEDHintChanged, @ptrCast(@alignCast(ctx)));
    if (ctx.*.m_bSwitch2) {
        joystick.*.nbuttons = SDL_GAMEPAD_NUM_SWITCH2_BUTTONS;
    } else if (ctx.*.m_bInputOnly) {
        joystick.*.nbuttons = SDL_GAMEPAD_NUM_SWITCH_INPUT_ONLY_BUTTONS;
    } else {
        joystick.*.nbuttons = SDL_GAMEPAD_NUM_SWITCH_BUTTONS;
    }
    joystick.*.naxes = SDL_GAMEPAD_AXIS_COUNT;
    joystick.*.nhats = 1;
    ctx.*.m_bSyncWrite = @"false" != 0;
    ctx.*.m_ulLastIMUReset = blk: {
        const tmp = SDL_GetTicks_REAL();
        ctx.*.m_ulLastInput = tmp;
        break :blk tmp;
    };
    ctx.*.m_ulIMUUpdateIntervalNS = @as(Uint64, @bitCast(@as(c_long, @as(c_int, 5)))) *% @as(Uint64, SDL_NS_PER_MS);
    ctx.*.m_bVerticalMode = SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI_VERTICAL_JOY_CONS", @"false" != 0);
    return @"true" != 0;
}
pub fn HIDAPI_DriverSwitch_ActuallyRumbleJoystick(ctx: [*c]SDL_DriverSwitch_Context, low_frequency_rumble: Uint16, high_frequency_rumble: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const k_usHighFreq: Uint16 = 116;
    _ = &k_usHighFreq;
    const k_ucHighFreqAmp: Uint8 = EncodeRumbleHighAmplitude(high_frequency_rumble);
    _ = &k_ucHighFreqAmp;
    const k_ucLowFreq: Uint8 = 61;
    _ = &k_ucLowFreq;
    const k_usLowFreqAmp: Uint16 = EncodeRumbleLowAmplitude(low_frequency_rumble);
    _ = &k_usLowFreqAmp;
    if ((@as(c_int, low_frequency_rumble) != 0) or (@as(c_int, high_frequency_rumble) != 0)) {
        EncodeRumble(ctx.*.device, &ctx.*.m_RumblePacket.rumbleData[@as(c_int, 0)], k_usHighFreq, k_ucHighFreqAmp, k_ucLowFreq, k_usLowFreqAmp);
        EncodeRumble(ctx.*.device, &ctx.*.m_RumblePacket.rumbleData[@as(c_int, 1)], k_usHighFreq, k_ucHighFreqAmp, k_ucLowFreq, k_usLowFreqAmp);
    } else {
        SetNeutralRumble(ctx.*.device, &ctx.*.m_RumblePacket.rumbleData[@as(c_int, 0)]);
        SetNeutralRumble(ctx.*.device, &ctx.*.m_RumblePacket.rumbleData[@as(c_int, 1)]);
    }
    ctx.*.m_bRumbleActive = (@as(c_int, low_frequency_rumble) != 0) or (@as(c_int, high_frequency_rumble) != 0);
    if (!WriteRumble(ctx)) {
        return SDL_SetError_REAL("Couldn't send rumble packet");
    }
    return @"true" != 0;
}
pub fn HIDAPI_DriverSwitch_SendPendingRumble(ctx: [*c]SDL_DriverSwitch_Context) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (SDL_GetTicks_REAL() < (ctx.*.m_ulRumbleSent +% @as(Uint64, RUMBLE_WRITE_FREQUENCY_MS))) {
        return @"true" != 0;
    }
    if (ctx.*.m_bRumblePending) {
        var low_frequency_rumble: Uint16 = @truncate(ctx.*.m_unRumblePending >> @intCast(@as(Uint32, 16)));
        _ = &low_frequency_rumble;
        var high_frequency_rumble: Uint16 = @truncate(ctx.*.m_unRumblePending);
        _ = &high_frequency_rumble;
        ctx.*.m_bRumblePending = @"false" != 0;
        ctx.*.m_unRumblePending = 0;
        return HIDAPI_DriverSwitch_ActuallyRumbleJoystick(ctx, low_frequency_rumble, high_frequency_rumble);
    }
    if (ctx.*.m_bRumbleZeroPending) {
        ctx.*.m_bRumbleZeroPending = @"false" != 0;
        return HIDAPI_DriverSwitch_ActuallyRumbleJoystick(ctx, 0, 0);
    }
    return @"true" != 0;
}
pub fn HIDAPI_DriverSwitch_RumbleJoystick(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, arg_low_frequency_rumble: Uint16, arg_high_frequency_rumble: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var low_frequency_rumble = arg_low_frequency_rumble;
    _ = &low_frequency_rumble;
    var high_frequency_rumble = arg_high_frequency_rumble;
    _ = &high_frequency_rumble;
    var ctx: [*c]SDL_DriverSwitch_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    if (ctx.*.m_bInputOnly) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    if (device.*.parent != null) {
        if (ctx.*.m_eControllerType == @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_JoyConLeft)) {
            high_frequency_rumble = 0;
        } else if (ctx.*.m_eControllerType == @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_JoyConRight)) {
            low_frequency_rumble = 0;
        }
    }
    if (ctx.*.m_bRumblePending) {
        if (!HIDAPI_DriverSwitch_SendPendingRumble(ctx)) {
            return @"false" != 0;
        }
    }
    if (SDL_GetTicks_REAL() < (ctx.*.m_ulRumbleSent +% @as(Uint64, RUMBLE_WRITE_FREQUENCY_MS))) {
        if ((@as(c_int, low_frequency_rumble) != 0) or (@as(c_int, high_frequency_rumble) != 0)) {
            var unRumblePending: Uint32 = (@as(Uint32, low_frequency_rumble) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, high_frequency_rumble))));
            _ = &unRumblePending;
            if (unRumblePending > ctx.*.m_unRumblePending) {
                ctx.*.m_unRumblePending = unRumblePending;
            }
            ctx.*.m_bRumblePending = @"true" != 0;
            ctx.*.m_bRumbleZeroPending = @"false" != 0;
        } else {
            ctx.*.m_bRumbleZeroPending = @"true" != 0;
        }
        return @"true" != 0;
    }
    return HIDAPI_DriverSwitch_ActuallyRumbleJoystick(ctx, low_frequency_rumble, high_frequency_rumble);
}
pub fn HIDAPI_DriverSwitch_RumbleJoystickTriggers(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: Uint16, _: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverSwitch_GetJoystickCapabilities(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSwitch_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    var result: Uint32 = 0;
    _ = &result;
    if (ctx.*.m_bPlayerLights and !ctx.*.m_bInputOnly) {
        result |= SDL_JOYSTICK_CAP_PLAYER_LED;
    }
    if ((ctx.*.m_eControllerType == @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_ProController)) and !ctx.*.m_bInputOnly) {
        result |= SDL_JOYSTICK_CAP_RUMBLE;
        result |= SDL_JOYSTICK_CAP_MONO_LED;
    } else if ((ctx.*.m_eControllerType == @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_JoyConLeft)) or (ctx.*.m_eControllerType == @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_JoyConRight))) {
        result |= SDL_JOYSTICK_CAP_RUMBLE;
        if (ctx.*.m_eControllerType == @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_JoyConRight)) {
            result |= SDL_JOYSTICK_CAP_MONO_LED;
        }
    }
    return result;
}
pub fn HIDAPI_DriverSwitch_SetJoystickLED(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, red: Uint8, green: Uint8, blue: Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSwitch_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    if (!((ctx.*.m_eControllerType == @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_ProController)) and !ctx.*.m_bInputOnly) and (ctx.*.m_eControllerType != @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_JoyConRight))) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    var value: c_int = @intFromFloat((@as(f32, @floatFromInt(if (@as(c_int, red) > (if (@as(c_int, green) > @as(c_int, blue)) @as(c_int, green) else @as(c_int, blue))) @as(c_int, red) else if (@as(c_int, green) > @as(c_int, blue)) @as(c_int, green) else @as(c_int, blue))) / @as(f32, 255.0)) * @as(f32, 100.0));
    _ = &value;
    return SetHomeLED(ctx, @bitCast(@as(i8, @truncate(value))));
}
pub fn HIDAPI_DriverSwitch_SendJoystickEffect(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, data: ?*const anyopaque, arg_size: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var size = arg_size;
    _ = &size;
    var ctx: [*c]SDL_DriverSwitch_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    if (@as(c_ulong, @bitCast(@as(c_long, size))) == @sizeOf(SwitchCommonOutputPacket_t)) {
        var packet: [*c]const SwitchCommonOutputPacket_t = @ptrCast(@alignCast(data));
        _ = &packet;
        if (@as(c_int, packet.*.ucPacketType) != k_eSwitchOutputReportIDs_Rumble) {
            return SDL_SetError_REAL("Unknown Nintendo Switch Pro effect type");
        }
        {
            comptime {
                if (!(@sizeOf(@TypeOf((&ctx.*.m_RumblePacket.rumbleData[@as(c_int, 0)]).*)) == @sizeOf(@TypeOf((&packet.*.rumbleData[@as(c_int, 0)]).*)))) @compileError("static assertion failed \"sizeof (*(&ctx->m_RumblePacket.rumbleData[0])) == sizeof (*( &packet->rumbleData[0]))\"");
            }
        }
        _ = memcpy(@ptrCast(@alignCast(&ctx.*.m_RumblePacket.rumbleData[@as(c_int, 0)])), @ptrCast(@alignCast(&packet.*.rumbleData[@as(c_int, 0)])), @sizeOf(@TypeOf((&packet.*.rumbleData[@as(c_int, 0)]).*)));
        {
            comptime {
                if (!(@sizeOf(@TypeOf((&ctx.*.m_RumblePacket.rumbleData[@as(c_int, 1)]).*)) == @sizeOf(@TypeOf((&packet.*.rumbleData[@as(c_int, 1)]).*)))) @compileError("static assertion failed \"sizeof (*(&ctx->m_RumblePacket.rumbleData[1])) == sizeof (*( &packet->rumbleData[1]))\"");
            }
        }
        _ = memcpy(@ptrCast(@alignCast(&ctx.*.m_RumblePacket.rumbleData[@as(c_int, 1)])), @ptrCast(@alignCast(&packet.*.rumbleData[@as(c_int, 1)])), @sizeOf(@TypeOf((&packet.*.rumbleData[@as(c_int, 1)]).*)));
        if (!WriteRumble(ctx)) {
            return @"false" != 0;
        }
        ctx.*.m_bRumblePending = @"false" != 0;
        ctx.*.m_bRumbleZeroPending = @"false" != 0;
        return @"true" != 0;
    } else if ((size >= @as(c_int, 2)) and (size <= @as(c_int, 256))) {
        var payload: [*c]const Uint8 = @ptrCast(@alignCast(data));
        _ = &payload;
        var cmd: ESwitchSubcommandIDs = payload[@as(c_int, 0)];
        _ = &cmd;
        if ((cmd == @as(ESwitchSubcommandIDs, k_eSwitchSubcommandIDs_SetInputReportMode)) and !device.*.is_bluetooth) {
            return @"true" != 0;
        }
        if ((cmd == @as(ESwitchSubcommandIDs, k_eSwitchSubcommandIDs_SetHomeLight)) and !HasHomeLED(ctx)) {
            return @"true" != 0;
        }
        if (!WriteSubcommand(ctx, cmd, &payload[@as(c_int, 1)], @bitCast(@as(i8, @truncate(size - @as(c_int, 1)))), null)) {
            return @"false" != 0;
        }
        return @"true" != 0;
    }
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverSwitch_SetJoystickSensorsEnabled(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, enabled: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSwitch_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    UpdateEnhancedModeOnApplicationUsage(ctx);
    if (!ctx.*.m_bSensorsSupported or (enabled and !ctx.*.m_bEnhancedMode)) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    ctx.*.m_bReportSensors = enabled;
    ctx.*.m_unIMUSamples = 0;
    ctx.*.m_ulIMUSampleTimestampNS = SDL_GetTicksNS_REAL();
    UpdateInputMode(ctx);
    _ = SetIMUEnabled(ctx, enabled);
    return @"true" != 0;
}
pub fn HandleInputOnlyControllerState(joystick: [*c]SDL_Joystick, ctx: [*c]SDL_DriverSwitch_Context, packet: [*c]SwitchInputOnlyControllerStatePacket_t) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var axis: Sint16 = undefined;
    _ = &axis;
    var timestamp: Uint64 = undefined;
    _ = &timestamp;
    var data: Uint8 = undefined;
    _ = &data;
    var data_1: Uint8 = undefined;
    _ = &data_1;
    var hat: Uint8 = undefined;
    _ = &hat;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                timestamp = SDL_GetTicksNS_REAL();
                if (@as(c_int, packet.*.rgucButtons[@as(c_int, 0)]) != @as(c_int, ctx.*.m_lastInputOnlyState.rgucButtons[@as(c_int, 0)])) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                data = packet.*.rgucButtons[@as(c_int, 0)];
                SDL_SendJoystickButton(timestamp, joystick, RemapButton(ctx, SDL_GAMEPAD_BUTTON_SOUTH), (@as(c_int, data) & @as(c_int, 2)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, RemapButton(ctx, SDL_GAMEPAD_BUTTON_EAST), (@as(c_int, data) & @as(c_int, 4)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, RemapButton(ctx, SDL_GAMEPAD_BUTTON_WEST), (@as(c_int, data) & @as(c_int, 1)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, RemapButton(ctx, SDL_GAMEPAD_BUTTON_NORTH), (@as(c_int, data) & @as(c_int, 8)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_SHOULDER, (@as(c_int, data) & @as(c_int, 16)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER, (@as(c_int, data) & @as(c_int, 32)) != @as(c_int, 0));
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
                if (@as(c_int, packet.*.rgucButtons[@as(c_int, 1)]) != @as(c_int, ctx.*.m_lastInputOnlyState.rgucButtons[@as(c_int, 1)])) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                data_1 = packet.*.rgucButtons[@as(c_int, 1)];
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_BACK, (@as(c_int, data_1) & @as(c_int, 1)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_START, (@as(c_int, data_1) & @as(c_int, 2)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_STICK, (@as(c_int, data_1) & @as(c_int, 4)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_STICK, (@as(c_int, data_1) & @as(c_int, 8)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_GUIDE, (@as(c_int, data_1) & @as(c_int, 16)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SWITCH_SHARE, (@as(c_int, data_1) & @as(c_int, 32)) != @as(c_int, 0));
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
                if (@as(c_int, packet.*.ucStickHat) != @as(c_int, ctx.*.m_lastInputOnlyState.ucStickHat)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                if (ctx.*.m_bSwitch2) {
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
                axis = @truncate(if ((@as(c_int, packet.*.rgucButtons[@as(c_int, 0)]) & @as(c_int, 64)) != 0) @as(c_int, 32767) else -@as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFT_TRIGGER, axis);
                axis = @truncate(if ((@as(c_int, packet.*.rgucButtons[@as(c_int, 0)]) & @as(c_int, 128)) != 0) @as(c_int, 32767) else -@as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHT_TRIGGER, axis);
                if (@as(c_int, packet.*.rgucJoystickLeft[@as(c_int, 0)]) != @as(c_int, ctx.*.m_lastInputOnlyState.rgucJoystickLeft[@as(c_int, 0)])) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            10 => {
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SWITCH2_C, (@as(c_int, packet.*.ucStickHat) & @as(c_int, 128)) != @as(c_int, 0));
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
                switch (@as(c_int, packet.*.ucStickHat) & @as(c_int, 15)) {
                    @as(c_int, 0) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 16;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 18;
                        continue;
                    },
                    @as(c_int, 5) => {
                        sdl_pc = 19;
                        continue;
                    },
                    @as(c_int, 6) => {
                        sdl_pc = 20;
                        continue;
                    },
                    @as(c_int, 7) => {
                        sdl_pc = 21;
                        continue;
                    },
                    else => {
                        sdl_pc = 22;
                        continue;
                    },
                }
            },
            13 => {
                SDL_SendJoystickHat(timestamp, joystick, 0, hat);
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            14 => {
                hat = SDL_HAT_UP;
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            15 => {
                hat = @truncate(SDL_HAT_RIGHT | SDL_HAT_UP);
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            16 => {
                hat = SDL_HAT_RIGHT;
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            17 => {
                hat = @truncate(SDL_HAT_RIGHT | SDL_HAT_DOWN);
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            18 => {
                hat = SDL_HAT_DOWN;
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            19 => {
                hat = @truncate(SDL_HAT_LEFT | SDL_HAT_DOWN);
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            20 => {
                hat = SDL_HAT_LEFT;
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            21 => {
                hat = @truncate(SDL_HAT_LEFT | SDL_HAT_UP);
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            22 => {
                hat = SDL_HAT_CENTERED;
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            23 => {
                axis = @intFromFloat(HIDAPI_RemapVal(@floatFromInt(packet.*.rgucJoystickLeft[@as(c_int, 0)]), @floatFromInt(@as(Uint8, @bitCast(@as(i8, @truncate(@as(c_int, 0)))))), @floatFromInt(@as(Uint8, @bitCast(@as(i8, @truncate(@as(c_int, 255)))))), @floatFromInt(@as(Sint16, @truncate(~@as(c_int, 32767)))), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767))))));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, axis);
                {
                    sdl_pc = 25;
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
                if (@as(c_int, packet.*.rgucJoystickLeft[@as(c_int, 1)]) != @as(c_int, ctx.*.m_lastInputOnlyState.rgucJoystickLeft[@as(c_int, 1)])) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            26 => {
                axis = @intFromFloat(HIDAPI_RemapVal(@floatFromInt(packet.*.rgucJoystickLeft[@as(c_int, 1)]), @floatFromInt(@as(Uint8, @bitCast(@as(i8, @truncate(@as(c_int, 0)))))), @floatFromInt(@as(Uint8, @bitCast(@as(i8, @truncate(@as(c_int, 255)))))), @floatFromInt(@as(Sint16, @truncate(~@as(c_int, 32767)))), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767))))));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, axis);
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
                if (@as(c_int, packet.*.rgucJoystickRight[@as(c_int, 0)]) != @as(c_int, ctx.*.m_lastInputOnlyState.rgucJoystickRight[@as(c_int, 0)])) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            29 => {
                axis = @intFromFloat(HIDAPI_RemapVal(@floatFromInt(packet.*.rgucJoystickRight[@as(c_int, 0)]), @floatFromInt(@as(Uint8, @bitCast(@as(i8, @truncate(@as(c_int, 0)))))), @floatFromInt(@as(Uint8, @bitCast(@as(i8, @truncate(@as(c_int, 255)))))), @floatFromInt(@as(Sint16, @truncate(~@as(c_int, 32767)))), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767))))));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, axis);
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
                if (@as(c_int, packet.*.rgucJoystickRight[@as(c_int, 1)]) != @as(c_int, ctx.*.m_lastInputOnlyState.rgucJoystickRight[@as(c_int, 1)])) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            32 => {
                axis = @intFromFloat(HIDAPI_RemapVal(@floatFromInt(packet.*.rgucJoystickRight[@as(c_int, 1)]), @floatFromInt(@as(Uint8, @bitCast(@as(i8, @truncate(@as(c_int, 0)))))), @floatFromInt(@as(Uint8, @bitCast(@as(i8, @truncate(@as(c_int, 255)))))), @floatFromInt(@as(Sint16, @truncate(~@as(c_int, 32767)))), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767))))));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, axis);
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
                ctx.*.m_lastInputOnlyState = packet.*;
                {}
            },
            else => unreachable,
        }
    }
}
pub fn HandleCombinedSimpleControllerStateL(timestamp: Uint64, joystick: [*c]SDL_Joystick, ctx: [*c]SDL_DriverSwitch_Context, packet: [*c]SwitchSimpleStatePacket_t) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var data: Uint8 = undefined;
    _ = &data;
    var hat: Uint8 = undefined;
    _ = &hat;
    var data_1: Uint8 = undefined;
    _ = &data_1;
    var axis: Sint16 = undefined;
    _ = &axis;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (@as(c_int, packet.*.rgucButtons[@as(c_int, 0)]) != @as(c_int, ctx.*.m_lastSimpleState.rgucButtons[@as(c_int, 0)])) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                data = packet.*.rgucButtons[@as(c_int, 0)];
                hat = 0;
                if ((@as(c_int, data) & @as(c_int, 1)) != 0) {
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
                if (@as(c_int, packet.*.rgucButtons[@as(c_int, 1)]) != @as(c_int, ctx.*.m_lastSimpleState.rgucButtons[@as(c_int, 1)])) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            4 => {
                {
                    const ref = &hat;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_LEFT);
                }
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
                if ((@as(c_int, data) & @as(c_int, 2)) != 0) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                {
                    const ref = &hat;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_DOWN);
                }
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
                if ((@as(c_int, data) & @as(c_int, 4)) != 0) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                {
                    const ref = &hat;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_UP);
                }
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
                if ((@as(c_int, data) & @as(c_int, 8)) != 0) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            13 => {
                {
                    const ref = &hat;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_RIGHT);
                }
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                SDL_SendJoystickHat(timestamp, joystick, 0, hat);
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SWITCH_LEFT_PADDLE1, (@as(c_int, data) & @as(c_int, 16)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SWITCH_LEFT_PADDLE2, (@as(c_int, data) & @as(c_int, 32)) != @as(c_int, 0));
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            16 => {
                data_1 = packet.*.rgucButtons[@as(c_int, 1)];
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_BACK, (@as(c_int, data_1) & @as(c_int, 1)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_STICK, (@as(c_int, data_1) & @as(c_int, 4)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SWITCH_SHARE, (@as(c_int, data_1) & @as(c_int, 32)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_SHOULDER, (@as(c_int, data_1) & @as(c_int, 64)) != @as(c_int, 0));
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
                axis = @truncate(if ((@as(c_int, packet.*.rgucButtons[@as(c_int, 1)]) & @as(c_int, 128)) != 0) @as(c_int, 32767) else -@as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFT_TRIGGER, axis);
                if (@as(c_int, packet.*.ucStickHat) != @as(c_int, ctx.*.m_lastSimpleState.ucStickHat)) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            19 => {
                switch (@as(c_int, packet.*.ucStickHat)) {
                    @as(c_int, 0) => {
                        sdl_pc = 23;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 24;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 25;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 26;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 27;
                        continue;
                    },
                    @as(c_int, 5) => {
                        sdl_pc = 28;
                        continue;
                    },
                    @as(c_int, 6) => {
                        sdl_pc = 29;
                        continue;
                    },
                    @as(c_int, 7) => {
                        sdl_pc = 30;
                        continue;
                    },
                    else => {
                        sdl_pc = 31;
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
                {}
            },
            22 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            23 => {
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, SDL_JOYSTICK_AXIS_MAX);
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, 0);
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            24 => {
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, SDL_JOYSTICK_AXIS_MAX);
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, SDL_JOYSTICK_AXIS_MAX);
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            25 => {
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, 0);
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, SDL_JOYSTICK_AXIS_MAX);
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            26 => {
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, @truncate(-@as(c_int, 32768)));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, SDL_JOYSTICK_AXIS_MAX);
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            27 => {
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, @truncate(-@as(c_int, 32768)));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, 0);
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            28 => {
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, @truncate(-@as(c_int, 32768)));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, @truncate(-@as(c_int, 32768)));
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            29 => {
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, 0);
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, @truncate(-@as(c_int, 32768)));
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            30 => {
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, SDL_JOYSTICK_AXIS_MAX);
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, @truncate(-@as(c_int, 32768)));
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            31 => {
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, 0);
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, 0);
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn HandleCombinedSimpleControllerStateR(timestamp: Uint64, joystick: [*c]SDL_Joystick, ctx: [*c]SDL_DriverSwitch_Context, packet: [*c]SwitchSimpleStatePacket_t) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var data: Uint8 = undefined;
    _ = &data;
    var data_1: Uint8 = undefined;
    _ = &data_1;
    var axis: Sint16 = undefined;
    _ = &axis;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (@as(c_int, packet.*.rgucButtons[@as(c_int, 0)]) != @as(c_int, ctx.*.m_lastSimpleState.rgucButtons[@as(c_int, 0)])) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                data = packet.*.rgucButtons[@as(c_int, 0)];
                SDL_SendJoystickButton(timestamp, joystick, RemapButton(ctx, SDL_GAMEPAD_BUTTON_EAST), (@as(c_int, data) & @as(c_int, 1)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, RemapButton(ctx, SDL_GAMEPAD_BUTTON_NORTH), (@as(c_int, data) & @as(c_int, 2)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, RemapButton(ctx, SDL_GAMEPAD_BUTTON_SOUTH), (@as(c_int, data) & @as(c_int, 4)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, RemapButton(ctx, SDL_GAMEPAD_BUTTON_WEST), (@as(c_int, data) & @as(c_int, 8)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SWITCH_RIGHT_PADDLE2, (@as(c_int, data) & @as(c_int, 16)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SWITCH_RIGHT_PADDLE1, (@as(c_int, data) & @as(c_int, 32)) != @as(c_int, 0));
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
                if (@as(c_int, packet.*.rgucButtons[@as(c_int, 1)]) != @as(c_int, ctx.*.m_lastSimpleState.rgucButtons[@as(c_int, 1)])) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                data_1 = packet.*.rgucButtons[@as(c_int, 1)];
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_START, (@as(c_int, data_1) & @as(c_int, 2)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_STICK, (@as(c_int, data_1) & @as(c_int, 8)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_GUIDE, (@as(c_int, data_1) & @as(c_int, 16)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER, (@as(c_int, data_1) & @as(c_int, 64)) != @as(c_int, 0));
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
                axis = @truncate(if ((@as(c_int, packet.*.rgucButtons[@as(c_int, 1)]) & @as(c_int, 128)) != 0) @as(c_int, 32767) else -@as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHT_TRIGGER, axis);
                if (@as(c_int, packet.*.ucStickHat) != @as(c_int, ctx.*.m_lastSimpleState.ucStickHat)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                switch (@as(c_int, packet.*.ucStickHat)) {
                    @as(c_int, 0) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(c_int, 5) => {
                        sdl_pc = 16;
                        continue;
                    },
                    @as(c_int, 6) => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(c_int, 7) => {
                        sdl_pc = 18;
                        continue;
                    },
                    else => {
                        sdl_pc = 19;
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
                {}
            },
            10 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            11 => {
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, @truncate(-@as(c_int, 32768)));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, 0);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            12 => {
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, @truncate(-@as(c_int, 32768)));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, @truncate(-@as(c_int, 32768)));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            13 => {
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, 0);
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, @truncate(-@as(c_int, 32768)));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            14 => {
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, SDL_JOYSTICK_AXIS_MAX);
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, @truncate(-@as(c_int, 32768)));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            15 => {
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, SDL_JOYSTICK_AXIS_MAX);
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, 0);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            16 => {
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, SDL_JOYSTICK_AXIS_MAX);
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, SDL_JOYSTICK_AXIS_MAX);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            17 => {
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, 0);
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, SDL_JOYSTICK_AXIS_MAX);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            18 => {
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, @truncate(-@as(c_int, 32768)));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, SDL_JOYSTICK_AXIS_MAX);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            19 => {
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, 0);
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, 0);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn HandleMiniSimpleControllerStateL(timestamp: Uint64, joystick: [*c]SDL_Joystick, ctx: [*c]SDL_DriverSwitch_Context, packet: [*c]SwitchSimpleStatePacket_t) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var data: Uint8 = undefined;
    _ = &data;
    var data_1: Uint8 = undefined;
    _ = &data_1;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (@as(c_int, packet.*.rgucButtons[@as(c_int, 0)]) != @as(c_int, ctx.*.m_lastSimpleState.rgucButtons[@as(c_int, 0)])) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                data = packet.*.rgucButtons[@as(c_int, 0)];
                SDL_SendJoystickButton(timestamp, joystick, RemapButton(ctx, SDL_GAMEPAD_BUTTON_SOUTH), (@as(c_int, data) & @as(c_int, 1)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, RemapButton(ctx, SDL_GAMEPAD_BUTTON_EAST), (@as(c_int, data) & @as(c_int, 2)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, RemapButton(ctx, SDL_GAMEPAD_BUTTON_WEST), (@as(c_int, data) & @as(c_int, 4)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, RemapButton(ctx, SDL_GAMEPAD_BUTTON_NORTH), (@as(c_int, data) & @as(c_int, 8)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_SHOULDER, (@as(c_int, data) & @as(c_int, 16)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER, (@as(c_int, data) & @as(c_int, 32)) != @as(c_int, 0));
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
                if (@as(c_int, packet.*.rgucButtons[@as(c_int, 1)]) != @as(c_int, ctx.*.m_lastSimpleState.rgucButtons[@as(c_int, 1)])) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                data_1 = packet.*.rgucButtons[@as(c_int, 1)];
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_START, (@as(c_int, data_1) & @as(c_int, 1)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_STICK, (@as(c_int, data_1) & @as(c_int, 4)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_GUIDE, (@as(c_int, data_1) & @as(c_int, 32)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SWITCH_LEFT_PADDLE1, (@as(c_int, data_1) & @as(c_int, 64)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SWITCH_LEFT_PADDLE2, (@as(c_int, data_1) & @as(c_int, 128)) != @as(c_int, 0));
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
                if (@as(c_int, packet.*.ucStickHat) != @as(c_int, ctx.*.m_lastSimpleState.ucStickHat)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                switch (@as(c_int, packet.*.ucStickHat)) {
                    @as(c_int, 0) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(c_int, 5) => {
                        sdl_pc = 16;
                        continue;
                    },
                    @as(c_int, 6) => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(c_int, 7) => {
                        sdl_pc = 18;
                        continue;
                    },
                    else => {
                        sdl_pc = 19;
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
                {}
            },
            10 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            11 => {
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, 0);
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, @truncate(-@as(c_int, 32768)));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            12 => {
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, SDL_JOYSTICK_AXIS_MAX);
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, @truncate(-@as(c_int, 32768)));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            13 => {
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, SDL_JOYSTICK_AXIS_MAX);
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, 0);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            14 => {
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, SDL_JOYSTICK_AXIS_MAX);
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, SDL_JOYSTICK_AXIS_MAX);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            15 => {
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, 0);
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, SDL_JOYSTICK_AXIS_MAX);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            16 => {
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, @truncate(-@as(c_int, 32768)));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, SDL_JOYSTICK_AXIS_MAX);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            17 => {
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, @truncate(-@as(c_int, 32768)));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, 0);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            18 => {
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, @truncate(-@as(c_int, 32768)));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, @truncate(-@as(c_int, 32768)));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            19 => {
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, 0);
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, 0);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn HandleMiniSimpleControllerStateR(timestamp: Uint64, joystick: [*c]SDL_Joystick, ctx: [*c]SDL_DriverSwitch_Context, packet: [*c]SwitchSimpleStatePacket_t) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var data: Uint8 = undefined;
    _ = &data;
    var data_1: Uint8 = undefined;
    _ = &data_1;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (@as(c_int, packet.*.rgucButtons[@as(c_int, 0)]) != @as(c_int, ctx.*.m_lastSimpleState.rgucButtons[@as(c_int, 0)])) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                data = packet.*.rgucButtons[@as(c_int, 0)];
                SDL_SendJoystickButton(timestamp, joystick, RemapButton(ctx, SDL_GAMEPAD_BUTTON_SOUTH), (@as(c_int, data) & @as(c_int, 1)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, RemapButton(ctx, SDL_GAMEPAD_BUTTON_EAST), (@as(c_int, data) & @as(c_int, 2)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, RemapButton(ctx, SDL_GAMEPAD_BUTTON_WEST), (@as(c_int, data) & @as(c_int, 4)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, RemapButton(ctx, SDL_GAMEPAD_BUTTON_NORTH), (@as(c_int, data) & @as(c_int, 8)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_SHOULDER, (@as(c_int, data) & @as(c_int, 16)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER, (@as(c_int, data) & @as(c_int, 32)) != @as(c_int, 0));
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
                if (@as(c_int, packet.*.rgucButtons[@as(c_int, 1)]) != @as(c_int, ctx.*.m_lastSimpleState.rgucButtons[@as(c_int, 1)])) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                data_1 = packet.*.rgucButtons[@as(c_int, 1)];
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_START, (@as(c_int, data_1) & @as(c_int, 2)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_STICK, (@as(c_int, data_1) & @as(c_int, 8)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_GUIDE, (@as(c_int, data_1) & @as(c_int, 16)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SWITCH_SHARE, (@as(c_int, data_1) & @as(c_int, 32)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SWITCH_RIGHT_PADDLE1, (@as(c_int, data_1) & @as(c_int, 64)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SWITCH_RIGHT_PADDLE2, (@as(c_int, data_1) & @as(c_int, 128)) != @as(c_int, 0));
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
                if (@as(c_int, packet.*.ucStickHat) != @as(c_int, ctx.*.m_lastSimpleState.ucStickHat)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                switch (@as(c_int, packet.*.ucStickHat)) {
                    @as(c_int, 0) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(c_int, 5) => {
                        sdl_pc = 16;
                        continue;
                    },
                    @as(c_int, 6) => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(c_int, 7) => {
                        sdl_pc = 18;
                        continue;
                    },
                    else => {
                        sdl_pc = 19;
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
                {}
            },
            10 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            11 => {
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, 0);
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, @truncate(-@as(c_int, 32768)));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            12 => {
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, SDL_JOYSTICK_AXIS_MAX);
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, @truncate(-@as(c_int, 32768)));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            13 => {
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, SDL_JOYSTICK_AXIS_MAX);
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, 0);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            14 => {
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, SDL_JOYSTICK_AXIS_MAX);
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, SDL_JOYSTICK_AXIS_MAX);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            15 => {
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, 0);
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, SDL_JOYSTICK_AXIS_MAX);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            16 => {
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, @truncate(-@as(c_int, 32768)));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, SDL_JOYSTICK_AXIS_MAX);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            17 => {
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, @truncate(-@as(c_int, 32768)));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, 0);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            18 => {
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, @truncate(-@as(c_int, 32768)));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, @truncate(-@as(c_int, 32768)));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            19 => {
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, 0);
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, 0);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn HandleSimpleControllerState(joystick: [*c]SDL_Joystick, ctx: [*c]SDL_DriverSwitch_Context, packet: [*c]SwitchSimpleStatePacket_t) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var timestamp: Uint64 = undefined;
    _ = &timestamp;
    var axis: Sint16 = undefined;
    _ = &axis;
    var data: Uint8 = undefined;
    _ = &data;
    var data_1: Uint8 = undefined;
    _ = &data_1;
    var hat: Uint8 = undefined;
    _ = &hat;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                timestamp = SDL_GetTicksNS_REAL();
                if (ctx.*.m_eControllerType == @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_JoyConLeft)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                if ((ctx.*.device.*.parent != null) or ctx.*.m_bVerticalMode) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            2 => {
                if (ctx.*.m_eControllerType == @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_JoyConRight)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            3 => {
                ctx.*.m_lastSimpleState = packet.*;
                {}
            },
            4 => {
                HandleCombinedSimpleControllerStateL(timestamp, joystick, ctx, packet);
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                HandleMiniSimpleControllerStateL(timestamp, joystick, ctx, packet);
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
                if ((ctx.*.device.*.parent != null) or ctx.*.m_bVerticalMode) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            8 => {
                if (@as(c_int, packet.*.rgucButtons[@as(c_int, 0)]) != @as(c_int, ctx.*.m_lastSimpleState.rgucButtons[@as(c_int, 0)])) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
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
                HandleCombinedSimpleControllerStateR(timestamp, joystick, ctx, packet);
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                HandleMiniSimpleControllerStateR(timestamp, joystick, ctx, packet);
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
                data = packet.*.rgucButtons[@as(c_int, 0)];
                SDL_SendJoystickButton(timestamp, joystick, RemapButton(ctx, SDL_GAMEPAD_BUTTON_SOUTH), (@as(c_int, data) & @as(c_int, 1)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, RemapButton(ctx, SDL_GAMEPAD_BUTTON_EAST), (@as(c_int, data) & @as(c_int, 2)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, RemapButton(ctx, SDL_GAMEPAD_BUTTON_WEST), (@as(c_int, data) & @as(c_int, 4)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, RemapButton(ctx, SDL_GAMEPAD_BUTTON_NORTH), (@as(c_int, data) & @as(c_int, 8)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_SHOULDER, (@as(c_int, data) & @as(c_int, 16)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER, (@as(c_int, data) & @as(c_int, 32)) != @as(c_int, 0));
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                if (@as(c_int, packet.*.rgucButtons[@as(c_int, 1)]) != @as(c_int, ctx.*.m_lastSimpleState.rgucButtons[@as(c_int, 1)])) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            16 => {
                data_1 = packet.*.rgucButtons[@as(c_int, 1)];
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_BACK, (@as(c_int, data_1) & @as(c_int, 1)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_START, (@as(c_int, data_1) & @as(c_int, 2)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_STICK, (@as(c_int, data_1) & @as(c_int, 4)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_STICK, (@as(c_int, data_1) & @as(c_int, 8)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_GUIDE, (@as(c_int, data_1) & @as(c_int, 16)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SWITCH_SHARE, (@as(c_int, data_1) & @as(c_int, 32)) != @as(c_int, 0));
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
                if (@as(c_int, packet.*.ucStickHat) != @as(c_int, ctx.*.m_lastSimpleState.ucStickHat)) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            19 => {
                switch (@as(c_int, packet.*.ucStickHat)) {
                    @as(c_int, 0) => {
                        sdl_pc = 23;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 24;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 25;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 26;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 27;
                        continue;
                    },
                    @as(c_int, 5) => {
                        sdl_pc = 28;
                        continue;
                    },
                    @as(c_int, 6) => {
                        sdl_pc = 29;
                        continue;
                    },
                    @as(c_int, 7) => {
                        sdl_pc = 30;
                        continue;
                    },
                    else => {
                        sdl_pc = 31;
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
                axis = @truncate(if ((@as(c_int, packet.*.rgucButtons[@as(c_int, 0)]) & @as(c_int, 64)) != 0) @as(c_int, 32767) else -@as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFT_TRIGGER, axis);
                axis = @truncate(if (((@as(c_int, packet.*.rgucButtons[@as(c_int, 0)]) & @as(c_int, 128)) != 0) or ((@as(c_int, packet.*.rgucButtons[@as(c_int, 1)]) & @as(c_int, 128)) != 0)) @as(c_int, 32767) else -@as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHT_TRIGGER, axis);
                axis = ApplySimpleStickCalibration(ctx, 0, 0, packet.*.sJoystickLeft[@as(c_int, 0)]);
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, axis);
                axis = ApplySimpleStickCalibration(ctx, 0, 1, packet.*.sJoystickLeft[@as(c_int, 1)]);
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, axis);
                axis = ApplySimpleStickCalibration(ctx, 1, 0, packet.*.sJoystickRight[@as(c_int, 0)]);
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, axis);
                axis = ApplySimpleStickCalibration(ctx, 1, 1, packet.*.sJoystickRight[@as(c_int, 1)]);
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, axis);
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            22 => {
                SDL_SendJoystickHat(timestamp, joystick, 0, hat);
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            23 => {
                hat = SDL_HAT_UP;
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            24 => {
                hat = @truncate(SDL_HAT_RIGHT | SDL_HAT_UP);
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            25 => {
                hat = SDL_HAT_RIGHT;
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            26 => {
                hat = @truncate(SDL_HAT_RIGHT | SDL_HAT_DOWN);
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            27 => {
                hat = SDL_HAT_DOWN;
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            28 => {
                hat = @truncate(SDL_HAT_LEFT | SDL_HAT_DOWN);
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            29 => {
                hat = SDL_HAT_LEFT;
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            30 => {
                hat = @truncate(SDL_HAT_LEFT | SDL_HAT_UP);
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            31 => {
                hat = SDL_HAT_CENTERED;
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn SendSensorUpdate(timestamp: Uint64, joystick: [*c]SDL_Joystick, ctx: [*c]SDL_DriverSwitch_Context, arg_type: SDL_SensorType, sensor_timestamp: Uint64, values: [*c]align(1) const Sint16) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var data: [3]f32 = undefined;
    _ = &data;
    if (((@"type" == SDL_SENSOR_GYRO) or (@"type" == SDL_SENSOR_GYRO_L)) or (@"type" == SDL_SENSOR_GYRO_R)) {
        const gyroX: f32 = @floatFromInt(@as(c_int, values[@as(c_int, 0)]) - @as(c_int, ctx.*.m_IMUScaleData.sGyroOffsetX));
        _ = &gyroX;
        const gyroY: f32 = @floatFromInt(@as(c_int, values[@as(c_int, 1)]) - @as(c_int, ctx.*.m_IMUScaleData.sGyroOffsetY));
        _ = &gyroY;
        const gyroZ: f32 = @floatFromInt(@as(c_int, values[@as(c_int, 2)]) - @as(c_int, ctx.*.m_IMUScaleData.sGyroOffsetZ));
        _ = &gyroZ;
        data[@as(c_int, 0)] = -(ctx.*.m_IMUScaleData.fGyroScaleY * gyroY);
        data[@as(c_int, 1)] = ctx.*.m_IMUScaleData.fGyroScaleZ * gyroZ;
        data[@as(c_int, 2)] = -(ctx.*.m_IMUScaleData.fGyroScaleX * gyroX);
    } else {
        data[@as(c_int, 0)] = -(ctx.*.m_IMUScaleData.fAccelScaleY * @as(f32, @floatFromInt(values[@as(c_int, 1)])));
        data[@as(c_int, 1)] = ctx.*.m_IMUScaleData.fAccelScaleZ * @as(f32, @floatFromInt(values[@as(c_int, 2)]));
        data[@as(c_int, 2)] = -(ctx.*.m_IMUScaleData.fAccelScaleX * @as(f32, @floatFromInt(values[@as(c_int, 0)])));
    }
    if (ctx.*.m_eControllerType == @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_JoyConRight)) {
        data[@as(c_int, 0)] = -data[@as(c_int, 0)];
        data[@as(c_int, 1)] = -data[@as(c_int, 1)];
    }
    if (((ctx.*.m_eControllerType == @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_JoyConLeft)) and !(ctx.*.device.*.parent != null)) and !ctx.*.m_bVerticalMode) {
        var tmp: f32 = data[@as(c_int, 2)];
        _ = &tmp;
        data[@as(c_int, 2)] = -data[@as(c_int, 0)];
        data[@as(c_int, 0)] = tmp;
    }
    if (((ctx.*.m_eControllerType == @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_JoyConRight)) and !(ctx.*.device.*.parent != null)) and !ctx.*.m_bVerticalMode) {
        var tmp: f32 = data[@as(c_int, 2)];
        _ = &tmp;
        data[@as(c_int, 2)] = data[@as(c_int, 0)];
        data[@as(c_int, 0)] = -tmp;
    }
    SDL_SendJoystickSensor(timestamp, joystick, @"type", sensor_timestamp, @ptrCast(@alignCast(&data)), 3);
}
pub fn HandleCombinedControllerStateL(timestamp: Uint64, joystick: [*c]SDL_Joystick, ctx: [*c]SDL_DriverSwitch_Context, packet: [*c]SwitchStatePacket_t) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var axis: Sint16 = undefined;
    _ = &axis;
    if (@as(c_int, packet.*.controllerState.rgucButtons[@as(c_int, 1)]) != @as(c_int, ctx.*.m_lastFullState.controllerState.rgucButtons[@as(c_int, 1)])) {
        var data: Uint8 = packet.*.controllerState.rgucButtons[@as(c_int, 1)];
        _ = &data;
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_BACK, (@as(c_int, data) & @as(c_int, 1)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_STICK, (@as(c_int, data) & @as(c_int, 8)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SWITCH_SHARE, (@as(c_int, data) & @as(c_int, 32)) != @as(c_int, 0));
    }
    if (@as(c_int, packet.*.controllerState.rgucButtons[@as(c_int, 2)]) != @as(c_int, ctx.*.m_lastFullState.controllerState.rgucButtons[@as(c_int, 2)])) {
        var data: Uint8 = packet.*.controllerState.rgucButtons[@as(c_int, 2)];
        _ = &data;
        var hat: Uint8 = 0;
        _ = &hat;
        if ((@as(c_int, data) & @as(c_int, 1)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_DOWN);
            }
        }
        if ((@as(c_int, data) & @as(c_int, 2)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_UP);
            }
        }
        if ((@as(c_int, data) & @as(c_int, 4)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_RIGHT);
            }
        }
        if ((@as(c_int, data) & @as(c_int, 8)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_LEFT);
            }
        }
        SDL_SendJoystickHat(timestamp, joystick, 0, hat);
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SWITCH_LEFT_PADDLE2, (@as(c_int, data) & @as(c_int, 16)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SWITCH_LEFT_PADDLE1, (@as(c_int, data) & @as(c_int, 32)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_SHOULDER, (@as(c_int, data) & @as(c_int, 64)) != @as(c_int, 0));
        axis = @truncate(if ((@as(c_int, data) & @as(c_int, 128)) != 0) @as(c_int, 32767) else -@as(c_int, 32768));
        SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFT_TRIGGER, axis);
    }
    axis = @truncate(@as(c_int, packet.*.controllerState.rgucJoystickLeft[@as(c_int, 0)]) | ((@as(c_int, packet.*.controllerState.rgucJoystickLeft[@as(c_int, 1)]) & @as(c_int, 15)) << @intCast(@as(c_int, 8))));
    axis = ApplyStickCalibration(ctx, 0, 0, axis);
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, axis);
    axis = @truncate(((@as(c_int, packet.*.controllerState.rgucJoystickLeft[@as(c_int, 1)]) & @as(c_int, 240)) >> @intCast(@as(c_int, 4))) | (@as(c_int, packet.*.controllerState.rgucJoystickLeft[@as(c_int, 2)]) << @intCast(@as(c_int, 4))));
    axis = ApplyStickCalibration(ctx, 0, 1, axis);
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, @truncate(~@as(c_int, axis)));
}
pub fn HandleCombinedControllerStateR(timestamp: Uint64, joystick: [*c]SDL_Joystick, ctx: [*c]SDL_DriverSwitch_Context, packet: [*c]SwitchStatePacket_t) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var axis: Sint16 = undefined;
    _ = &axis;
    if (@as(c_int, packet.*.controllerState.rgucButtons[@as(c_int, 0)]) != @as(c_int, ctx.*.m_lastFullState.controllerState.rgucButtons[@as(c_int, 0)])) {
        var data: Uint8 = packet.*.controllerState.rgucButtons[@as(c_int, 0)];
        _ = &data;
        SDL_SendJoystickButton(timestamp, joystick, RemapButton(ctx, SDL_GAMEPAD_BUTTON_SOUTH), (@as(c_int, data) & @as(c_int, 4)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, RemapButton(ctx, SDL_GAMEPAD_BUTTON_EAST), (@as(c_int, data) & @as(c_int, 8)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, RemapButton(ctx, SDL_GAMEPAD_BUTTON_WEST), (@as(c_int, data) & @as(c_int, 1)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, RemapButton(ctx, SDL_GAMEPAD_BUTTON_NORTH), (@as(c_int, data) & @as(c_int, 2)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SWITCH_RIGHT_PADDLE1, (@as(c_int, data) & @as(c_int, 16)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SWITCH_RIGHT_PADDLE2, (@as(c_int, data) & @as(c_int, 32)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER, (@as(c_int, data) & @as(c_int, 64)) != @as(c_int, 0));
        axis = @truncate(if ((@as(c_int, data) & @as(c_int, 128)) != 0) @as(c_int, 32767) else -@as(c_int, 32768));
        SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHT_TRIGGER, axis);
    }
    if (@as(c_int, packet.*.controllerState.rgucButtons[@as(c_int, 1)]) != @as(c_int, ctx.*.m_lastFullState.controllerState.rgucButtons[@as(c_int, 1)])) {
        var data: Uint8 = packet.*.controllerState.rgucButtons[@as(c_int, 1)];
        _ = &data;
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_START, (@as(c_int, data) & @as(c_int, 2)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_STICK, (@as(c_int, data) & @as(c_int, 4)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_GUIDE, (@as(c_int, data) & @as(c_int, 16)) != @as(c_int, 0));
    }
    axis = @truncate(@as(c_int, packet.*.controllerState.rgucJoystickRight[@as(c_int, 0)]) | ((@as(c_int, packet.*.controllerState.rgucJoystickRight[@as(c_int, 1)]) & @as(c_int, 15)) << @intCast(@as(c_int, 8))));
    axis = ApplyStickCalibration(ctx, 1, 0, axis);
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, axis);
    axis = @truncate(((@as(c_int, packet.*.controllerState.rgucJoystickRight[@as(c_int, 1)]) & @as(c_int, 240)) >> @intCast(@as(c_int, 4))) | (@as(c_int, packet.*.controllerState.rgucJoystickRight[@as(c_int, 2)]) << @intCast(@as(c_int, 4))));
    axis = ApplyStickCalibration(ctx, 1, 1, axis);
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, @truncate(~@as(c_int, axis)));
}
pub fn HandleMiniControllerStateL(timestamp: Uint64, joystick: [*c]SDL_Joystick, ctx: [*c]SDL_DriverSwitch_Context, packet: [*c]SwitchStatePacket_t) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var axis: Sint16 = undefined;
    _ = &axis;
    if (@as(c_int, packet.*.controllerState.rgucButtons[@as(c_int, 1)]) != @as(c_int, ctx.*.m_lastFullState.controllerState.rgucButtons[@as(c_int, 1)])) {
        var data: Uint8 = packet.*.controllerState.rgucButtons[@as(c_int, 1)];
        _ = &data;
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_START, (@as(c_int, data) & @as(c_int, 1)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_STICK, (@as(c_int, data) & @as(c_int, 8)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_GUIDE, (@as(c_int, data) & @as(c_int, 32)) != @as(c_int, 0));
    }
    if (@as(c_int, packet.*.controllerState.rgucButtons[@as(c_int, 2)]) != @as(c_int, ctx.*.m_lastFullState.controllerState.rgucButtons[@as(c_int, 2)])) {
        var data: Uint8 = packet.*.controllerState.rgucButtons[@as(c_int, 2)];
        _ = &data;
        SDL_SendJoystickButton(timestamp, joystick, RemapButton(ctx, SDL_GAMEPAD_BUTTON_SOUTH), (@as(c_int, data) & @as(c_int, 8)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, RemapButton(ctx, SDL_GAMEPAD_BUTTON_EAST), (@as(c_int, data) & @as(c_int, 1)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, RemapButton(ctx, SDL_GAMEPAD_BUTTON_WEST), (@as(c_int, data) & @as(c_int, 2)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, RemapButton(ctx, SDL_GAMEPAD_BUTTON_NORTH), (@as(c_int, data) & @as(c_int, 4)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER, (@as(c_int, data) & @as(c_int, 16)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_SHOULDER, (@as(c_int, data) & @as(c_int, 32)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SWITCH_LEFT_PADDLE1, (@as(c_int, data) & @as(c_int, 64)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SWITCH_LEFT_PADDLE2, (@as(c_int, data) & @as(c_int, 128)) != @as(c_int, 0));
    }
    axis = @truncate(@as(c_int, packet.*.controllerState.rgucJoystickLeft[@as(c_int, 0)]) | ((@as(c_int, packet.*.controllerState.rgucJoystickLeft[@as(c_int, 1)]) & @as(c_int, 15)) << @intCast(@as(c_int, 8))));
    axis = ApplyStickCalibration(ctx, 0, 0, axis);
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, @truncate(~@as(c_int, axis)));
    axis = @truncate(((@as(c_int, packet.*.controllerState.rgucJoystickLeft[@as(c_int, 1)]) & @as(c_int, 240)) >> @intCast(@as(c_int, 4))) | (@as(c_int, packet.*.controllerState.rgucJoystickLeft[@as(c_int, 2)]) << @intCast(@as(c_int, 4))));
    axis = ApplyStickCalibration(ctx, 0, 1, axis);
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, @truncate(~@as(c_int, axis)));
}
pub fn HandleMiniControllerStateR(timestamp: Uint64, joystick: [*c]SDL_Joystick, ctx: [*c]SDL_DriverSwitch_Context, packet: [*c]SwitchStatePacket_t) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var axis: Sint16 = undefined;
    _ = &axis;
    if (@as(c_int, packet.*.controllerState.rgucButtons[@as(c_int, 0)]) != @as(c_int, ctx.*.m_lastFullState.controllerState.rgucButtons[@as(c_int, 0)])) {
        var data: Uint8 = packet.*.controllerState.rgucButtons[@as(c_int, 0)];
        _ = &data;
        SDL_SendJoystickButton(timestamp, joystick, RemapButton(ctx, SDL_GAMEPAD_BUTTON_SOUTH), (@as(c_int, data) & @as(c_int, 8)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, RemapButton(ctx, SDL_GAMEPAD_BUTTON_EAST), (@as(c_int, data) & @as(c_int, 2)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, RemapButton(ctx, SDL_GAMEPAD_BUTTON_WEST), (@as(c_int, data) & @as(c_int, 4)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, RemapButton(ctx, SDL_GAMEPAD_BUTTON_NORTH), (@as(c_int, data) & @as(c_int, 1)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER, (@as(c_int, data) & @as(c_int, 16)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_SHOULDER, (@as(c_int, data) & @as(c_int, 32)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SWITCH_RIGHT_PADDLE1, (@as(c_int, data) & @as(c_int, 64)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SWITCH_RIGHT_PADDLE2, (@as(c_int, data) & @as(c_int, 128)) != @as(c_int, 0));
    }
    if (@as(c_int, packet.*.controllerState.rgucButtons[@as(c_int, 1)]) != @as(c_int, ctx.*.m_lastFullState.controllerState.rgucButtons[@as(c_int, 1)])) {
        var data: Uint8 = packet.*.controllerState.rgucButtons[@as(c_int, 1)];
        _ = &data;
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_START, (@as(c_int, data) & @as(c_int, 2)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_STICK, (@as(c_int, data) & @as(c_int, 4)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_GUIDE, (@as(c_int, data) & @as(c_int, 16)) != @as(c_int, 0));
    }
    axis = @truncate(@as(c_int, packet.*.controllerState.rgucJoystickRight[@as(c_int, 0)]) | ((@as(c_int, packet.*.controllerState.rgucJoystickRight[@as(c_int, 1)]) & @as(c_int, 15)) << @intCast(@as(c_int, 8))));
    axis = ApplyStickCalibration(ctx, 1, 0, axis);
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, axis);
    axis = @truncate(((@as(c_int, packet.*.controllerState.rgucJoystickRight[@as(c_int, 1)]) & @as(c_int, 240)) >> @intCast(@as(c_int, 4))) | (@as(c_int, packet.*.controllerState.rgucJoystickRight[@as(c_int, 2)]) << @intCast(@as(c_int, 4))));
    axis = ApplyStickCalibration(ctx, 1, 1, axis);
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, axis);
}
pub fn HandleFullControllerState(joystick: [*c]SDL_Joystick, ctx: [*c]SDL_DriverSwitch_Context, packet: [*c]SwitchStatePacket_t) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var timestamp: Uint64 = SDL_GetTicksNS_REAL();
    _ = &timestamp;
    if (ctx.*.m_eControllerType == @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_JoyConLeft)) {
        if ((ctx.*.device.*.parent != null) or ctx.*.m_bVerticalMode) {
            HandleCombinedControllerStateL(timestamp, joystick, ctx, packet);
        } else {
            HandleMiniControllerStateL(timestamp, joystick, ctx, packet);
        }
    } else if (ctx.*.m_eControllerType == @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_JoyConRight)) {
        if ((ctx.*.device.*.parent != null) or ctx.*.m_bVerticalMode) {
            HandleCombinedControllerStateR(timestamp, joystick, ctx, packet);
        } else {
            HandleMiniControllerStateR(timestamp, joystick, ctx, packet);
        }
    } else {
        var axis: Sint16 = undefined;
        _ = &axis;
        if (@as(c_int, packet.*.controllerState.rgucButtons[@as(c_int, 0)]) != @as(c_int, ctx.*.m_lastFullState.controllerState.rgucButtons[@as(c_int, 0)])) {
            var data: Uint8 = packet.*.controllerState.rgucButtons[@as(c_int, 0)];
            _ = &data;
            SDL_SendJoystickButton(timestamp, joystick, RemapButton(ctx, SDL_GAMEPAD_BUTTON_SOUTH), (@as(c_int, data) & @as(c_int, 4)) != @as(c_int, 0));
            SDL_SendJoystickButton(timestamp, joystick, RemapButton(ctx, SDL_GAMEPAD_BUTTON_EAST), (@as(c_int, data) & @as(c_int, 8)) != @as(c_int, 0));
            SDL_SendJoystickButton(timestamp, joystick, RemapButton(ctx, SDL_GAMEPAD_BUTTON_WEST), (@as(c_int, data) & @as(c_int, 1)) != @as(c_int, 0));
            SDL_SendJoystickButton(timestamp, joystick, RemapButton(ctx, SDL_GAMEPAD_BUTTON_NORTH), (@as(c_int, data) & @as(c_int, 2)) != @as(c_int, 0));
            SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER, (@as(c_int, data) & @as(c_int, 64)) != @as(c_int, 0));
        }
        if (@as(c_int, packet.*.controllerState.rgucButtons[@as(c_int, 1)]) != @as(c_int, ctx.*.m_lastFullState.controllerState.rgucButtons[@as(c_int, 1)])) {
            var data: Uint8 = packet.*.controllerState.rgucButtons[@as(c_int, 1)];
            _ = &data;
            SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_BACK, (@as(c_int, data) & @as(c_int, 1)) != @as(c_int, 0));
            SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_START, (@as(c_int, data) & @as(c_int, 2)) != @as(c_int, 0));
            SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_STICK, (@as(c_int, data) & @as(c_int, 4)) != @as(c_int, 0));
            SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_STICK, (@as(c_int, data) & @as(c_int, 8)) != @as(c_int, 0));
            SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_GUIDE, (@as(c_int, data) & @as(c_int, 16)) != @as(c_int, 0));
            SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SWITCH_SHARE, (@as(c_int, data) & @as(c_int, 32)) != @as(c_int, 0));
            if (ctx.*.m_bSwitch2) {
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SWITCH2_C, (@as(c_int, data) & @as(c_int, 64)) != @as(c_int, 0));
            }
        }
        if (@as(c_int, packet.*.controllerState.rgucButtons[@as(c_int, 2)]) != @as(c_int, ctx.*.m_lastFullState.controllerState.rgucButtons[@as(c_int, 2)])) {
            var data: Uint8 = packet.*.controllerState.rgucButtons[@as(c_int, 2)];
            _ = &data;
            var hat: Uint8 = 0;
            _ = &hat;
            if ((@as(c_int, data) & @as(c_int, 1)) != 0) {
                {
                    const ref = &hat;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_DOWN);
                }
            }
            if ((@as(c_int, data) & @as(c_int, 2)) != 0) {
                {
                    const ref = &hat;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_UP);
                }
            }
            if ((@as(c_int, data) & @as(c_int, 4)) != 0) {
                {
                    const ref = &hat;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_RIGHT);
                }
            }
            if ((@as(c_int, data) & @as(c_int, 8)) != 0) {
                {
                    const ref = &hat;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_LEFT);
                }
            }
            SDL_SendJoystickHat(timestamp, joystick, 0, hat);
            SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_SHOULDER, (@as(c_int, data) & @as(c_int, 64)) != @as(c_int, 0));
        }
        axis = @truncate(if ((@as(c_int, packet.*.controllerState.rgucButtons[@as(c_int, 0)]) & @as(c_int, 128)) != 0) @as(c_int, 32767) else -@as(c_int, 32768));
        SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHT_TRIGGER, axis);
        axis = @truncate(if ((@as(c_int, packet.*.controllerState.rgucButtons[@as(c_int, 2)]) & @as(c_int, 128)) != 0) @as(c_int, 32767) else -@as(c_int, 32768));
        SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFT_TRIGGER, axis);
        axis = @truncate(@as(c_int, packet.*.controllerState.rgucJoystickLeft[@as(c_int, 0)]) | ((@as(c_int, packet.*.controllerState.rgucJoystickLeft[@as(c_int, 1)]) & @as(c_int, 15)) << @intCast(@as(c_int, 8))));
        axis = ApplyStickCalibration(ctx, 0, 0, axis);
        SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, axis);
        axis = @truncate(((@as(c_int, packet.*.controllerState.rgucJoystickLeft[@as(c_int, 1)]) & @as(c_int, 240)) >> @intCast(@as(c_int, 4))) | (@as(c_int, packet.*.controllerState.rgucJoystickLeft[@as(c_int, 2)]) << @intCast(@as(c_int, 4))));
        axis = ApplyStickCalibration(ctx, 0, 1, axis);
        SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, @truncate(~@as(c_int, axis)));
        axis = @truncate(@as(c_int, packet.*.controllerState.rgucJoystickRight[@as(c_int, 0)]) | ((@as(c_int, packet.*.controllerState.rgucJoystickRight[@as(c_int, 1)]) & @as(c_int, 15)) << @intCast(@as(c_int, 8))));
        axis = ApplyStickCalibration(ctx, 1, 0, axis);
        SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, axis);
        axis = @truncate(((@as(c_int, packet.*.controllerState.rgucJoystickRight[@as(c_int, 1)]) & @as(c_int, 240)) >> @intCast(@as(c_int, 4))) | (@as(c_int, packet.*.controllerState.rgucJoystickRight[@as(c_int, 2)]) << @intCast(@as(c_int, 4))));
        axis = ApplyStickCalibration(ctx, 1, 1, axis);
        SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, @truncate(~@as(c_int, axis)));
    }
    var charging: c_int = @as(c_int, packet.*.controllerState.ucBatteryAndConnection) & @as(c_int, 16);
    _ = &charging;
    var level: c_int = (@as(c_int, packet.*.controllerState.ucBatteryAndConnection) & @as(c_int, 224)) >> @intCast(@as(c_int, 4));
    _ = &level;
    if (charging != 0) {
        if (level == @as(c_int, 8)) {
            ctx.*.m_ePowerState = SDL_POWERSTATE_CHARGED;
        } else {
            ctx.*.m_ePowerState = SDL_POWERSTATE_CHARGING;
        }
    } else {
        ctx.*.m_ePowerState = SDL_POWERSTATE_ON_BATTERY;
    }
    ctx.*.m_nPowerPercent = @intFromFloat(SDL_roundf_REAL((@as(f32, @floatFromInt(level)) / @as(f32, 8.0)) * @as(f32, 100.0)));
    if (!(ctx.*.device.*.parent != null)) {
        var state: SDL_PowerState = ctx.*.m_ePowerState;
        _ = &state;
        var percent: c_int = ctx.*.m_nPowerPercent;
        _ = &percent;
        SDL_SendJoystickPowerInfo(joystick, state, percent);
    } else if (ctx.*.m_eControllerType == @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_JoyConRight)) {
        var other: [*c]SDL_DriverSwitch_Context = @ptrCast(@alignCast(ctx.*.device.*.parent.*.children[@as(c_int, 0)].*.context));
        _ = &other;
        var state: SDL_PowerState = if (ctx.*.m_ePowerState < other.*.m_ePowerState) ctx.*.m_ePowerState else other.*.m_ePowerState;
        _ = &state;
        var percent: c_int = if (ctx.*.m_nPowerPercent < other.*.m_nPowerPercent) ctx.*.m_nPowerPercent else other.*.m_nPowerPercent;
        _ = &percent;
        SDL_SendJoystickPowerInfo(joystick, state, percent);
    }
    if (ctx.*.m_bReportSensors) {
        var imuState: [3]SwitchControllerIMUState_t = undefined;
        _ = &imuState;
        comptime {
            if (!(@sizeOf(@TypeOf(imuState)) == @sizeOf(@TypeOf(packet.*.imuState)))) @compileError("static assertion failed \"sizeof(imuState) == sizeof(packet->imuState)\"");
        }
        _ = memcpy(@ptrCast(@alignCast(@as([*c]SwitchControllerIMUState_t, @ptrCast(@alignCast(&imuState))))), @ptrCast(@alignCast(@as([*c]SwitchControllerIMUState_t, @ptrCast(@alignCast(&packet.*.imuState))))), @sizeOf(@TypeOf(packet.*.imuState)));
        var bHasSensorData: bool = ((@as(c_int, imuState[@as(c_int, 0)].sAccelZ) != @as(c_int, 0)) or (@as(c_int, imuState[@as(c_int, 0)].sAccelY) != @as(c_int, 0))) or (@as(c_int, imuState[@as(c_int, 0)].sAccelX) != @as(c_int, 0));
        _ = &bHasSensorData;
        if (bHasSensorData) {
            const IMU_UPDATE_RATE_SAMPLE_FREQUENCY: Uint32 = 1000;
            _ = &IMU_UPDATE_RATE_SAMPLE_FREQUENCY;
            var sensor_timestamp: [3]Uint64 = undefined;
            _ = &sensor_timestamp;
            ctx.*.m_bHasSensorData = @"true" != 0;
            ctx.*.m_unIMUSamples +%= 3;
            if (ctx.*.m_unIMUSamples >= IMU_UPDATE_RATE_SAMPLE_FREQUENCY) {
                var now: Uint64 = SDL_GetTicksNS_REAL();
                _ = &now;
                var elapsed: Uint64 = now -% ctx.*.m_ulIMUSampleTimestampNS;
                _ = &elapsed;
                if (elapsed > @as(Uint64, 0)) {
                    ctx.*.m_ulIMUUpdateIntervalNS = elapsed / @as(Uint64, ctx.*.m_unIMUSamples);
                }
                ctx.*.m_unIMUSamples = 0;
                ctx.*.m_ulIMUSampleTimestampNS = now;
            }
            ctx.*.m_ulTimestampNS +%= ctx.*.m_ulIMUUpdateIntervalNS;
            sensor_timestamp[@as(c_int, 0)] = ctx.*.m_ulTimestampNS;
            ctx.*.m_ulTimestampNS +%= ctx.*.m_ulIMUUpdateIntervalNS;
            sensor_timestamp[@as(c_int, 1)] = ctx.*.m_ulTimestampNS;
            ctx.*.m_ulTimestampNS +%= ctx.*.m_ulIMUUpdateIntervalNS;
            sensor_timestamp[@as(c_int, 2)] = ctx.*.m_ulTimestampNS;
            if (!(ctx.*.device.*.parent != null) or (ctx.*.m_eControllerType == @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_JoyConRight))) {
                SendSensorUpdate(timestamp, joystick, ctx, SDL_SENSOR_GYRO, sensor_timestamp[@as(c_int, 0)], __helpers.cast([*c]align(1) const i16, &imuState[@as(c_int, 2)].sGyroX));
                SendSensorUpdate(timestamp, joystick, ctx, SDL_SENSOR_ACCEL, sensor_timestamp[@as(c_int, 0)], __helpers.cast([*c]align(1) const i16, &imuState[@as(c_int, 2)].sAccelX));
                SendSensorUpdate(timestamp, joystick, ctx, SDL_SENSOR_GYRO, sensor_timestamp[@as(c_int, 1)], &imuState[@as(c_int, 1)].sGyroX);
                SendSensorUpdate(timestamp, joystick, ctx, SDL_SENSOR_ACCEL, sensor_timestamp[@as(c_int, 1)], &imuState[@as(c_int, 1)].sAccelX);
                SendSensorUpdate(timestamp, joystick, ctx, SDL_SENSOR_GYRO, sensor_timestamp[@as(c_int, 2)], &imuState[@as(c_int, 0)].sGyroX);
                SendSensorUpdate(timestamp, joystick, ctx, SDL_SENSOR_ACCEL, sensor_timestamp[@as(c_int, 2)], &imuState[@as(c_int, 0)].sAccelX);
            }
            if ((ctx.*.device.*.parent != null) and (ctx.*.m_eControllerType == @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_JoyConLeft))) {
                SendSensorUpdate(timestamp, joystick, ctx, SDL_SENSOR_GYRO_L, sensor_timestamp[@as(c_int, 0)], &imuState[@as(c_int, 2)].sGyroX);
                SendSensorUpdate(timestamp, joystick, ctx, SDL_SENSOR_ACCEL_L, sensor_timestamp[@as(c_int, 0)], &imuState[@as(c_int, 2)].sAccelX);
                SendSensorUpdate(timestamp, joystick, ctx, SDL_SENSOR_GYRO_L, sensor_timestamp[@as(c_int, 1)], &imuState[@as(c_int, 1)].sGyroX);
                SendSensorUpdate(timestamp, joystick, ctx, SDL_SENSOR_ACCEL_L, sensor_timestamp[@as(c_int, 1)], &imuState[@as(c_int, 1)].sAccelX);
                SendSensorUpdate(timestamp, joystick, ctx, SDL_SENSOR_GYRO_L, sensor_timestamp[@as(c_int, 2)], &imuState[@as(c_int, 0)].sGyroX);
                SendSensorUpdate(timestamp, joystick, ctx, SDL_SENSOR_ACCEL_L, sensor_timestamp[@as(c_int, 2)], &imuState[@as(c_int, 0)].sAccelX);
            }
            if ((ctx.*.device.*.parent != null) and (ctx.*.m_eControllerType == @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_JoyConRight))) {
                SendSensorUpdate(timestamp, joystick, ctx, SDL_SENSOR_GYRO_R, sensor_timestamp[@as(c_int, 0)], &imuState[@as(c_int, 2)].sGyroX);
                SendSensorUpdate(timestamp, joystick, ctx, SDL_SENSOR_ACCEL_R, sensor_timestamp[@as(c_int, 0)], &imuState[@as(c_int, 2)].sAccelX);
                SendSensorUpdate(timestamp, joystick, ctx, SDL_SENSOR_GYRO_R, sensor_timestamp[@as(c_int, 1)], &imuState[@as(c_int, 1)].sGyroX);
                SendSensorUpdate(timestamp, joystick, ctx, SDL_SENSOR_ACCEL_R, sensor_timestamp[@as(c_int, 1)], &imuState[@as(c_int, 1)].sAccelX);
                SendSensorUpdate(timestamp, joystick, ctx, SDL_SENSOR_GYRO_R, sensor_timestamp[@as(c_int, 2)], &imuState[@as(c_int, 0)].sGyroX);
                SendSensorUpdate(timestamp, joystick, ctx, SDL_SENSOR_ACCEL_R, sensor_timestamp[@as(c_int, 2)], &imuState[@as(c_int, 0)].sAccelX);
            }
        } else if (ctx.*.m_bHasSensorData) {
            const IMU_RESET_DELAY_MS: c_int = 3000;
            _ = &IMU_RESET_DELAY_MS;
            var now: Uint64 = SDL_GetTicks_REAL();
            _ = &now;
            if (now >= (ctx.*.m_ulLastIMUReset +% @as(Uint64, @bitCast(@as(c_long, IMU_RESET_DELAY_MS))))) {
                _ = SetIMUEnabled(ctx, @"true" != 0);
                ctx.*.m_ulLastIMUReset = now;
            }
        } else {}
    }
    ctx.*.m_lastFullState = packet.*;
}
pub fn HIDAPI_DriverSwitch_UpdateDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSwitch_Context = undefined;
    _ = &ctx;
    var joystick: [*c]SDL_Joystick = undefined;
    _ = &joystick;
    var size: c_int = undefined;
    _ = &size;
    var packet_count: c_int = undefined;
    _ = &packet_count;
    var now: Uint64 = undefined;
    _ = &now;
    var INPUT_WAIT_TIMEOUT_MS: c_int = undefined;
    _ = &INPUT_WAIT_TIMEOUT_MS;
    var wasSyncWrite: bool = undefined;
    _ = &wasSyncWrite;
    var INPUT_WAIT_TIMEOUT_MS_1: c_int = undefined;
    _ = &INPUT_WAIT_TIMEOUT_MS_1;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                ctx = @ptrCast(@alignCast(device.*.context));
                joystick = null;
                packet_count = 0;
                now = SDL_GetTicks_REAL();
                if (device.*.num_joysticks > @as(c_int, 0)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                joystick = SDL_GetJoystickFromID_REAL(device.*.joysticks[@as(c_int, 0)]);
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
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                if ((blk: {
                    const tmp = ReadInput(ctx);
                    size = tmp;
                    break :blk tmp;
                }) > @as(c_int, 0)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                packet_count += 1;
                ctx.*.m_ulLastInput = now;
                if (!(joystick != null)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            6 => {
                if (joystick != null) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
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
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                if (ctx.*.m_bInputOnly) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                HandleInputOnlyControllerState(joystick, ctx, @ptrCast(@alignCast(&ctx.*.m_rgucReadBuffer[@as(c_int, 0)])));
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                if (@as(c_int, ctx.*.m_rgucReadBuffer[@as(c_int, 0)]) == k_eSwitchInputReportIDs_SubcommandReply) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            13 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            14 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                ctx.*.m_nCurrentInputMode = ctx.*.m_rgucReadBuffer[@as(c_int, 0)];
                switch (@as(c_int, ctx.*.m_rgucReadBuffer[@as(c_int, 0)])) {
                    k_eSwitchInputReportIDs_SimpleControllerState => {
                        sdl_pc = 17;
                        continue;
                    },
                    k_eSwitchInputReportIDs_FullControllerState => {
                        sdl_pc = 18;
                        continue;
                    },
                    k_eSwitchInputReportIDs_FullControllerAndMcuState => {
                        sdl_pc = 19;
                        continue;
                    },
                    else => {
                        sdl_pc = 20;
                        continue;
                    },
                }
            },
            16 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            17 => {
                HandleSimpleControllerState(joystick, ctx, @ptrCast(@alignCast(&ctx.*.m_rgucReadBuffer[@as(c_int, 1)])));
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
                UpdateEnhancedModeOnEnhancedReport(ctx);
                HandleFullControllerState(joystick, ctx, @ptrCast(@alignCast(&ctx.*.m_rgucReadBuffer[@as(c_int, 1)])));
                {
                    sdl_pc = 16;
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
                if (packet_count == @as(c_int, 0)) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
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
                if (((((device.*.num_joysticks == @as(c_int, 0)) and device.*.is_bluetooth) and (packet_count > @as(c_int, 0))) and !(device.*.parent != null)) and !HIDAPI_HasConnectedUSBDevice(device.*.serial)) {
                    sdl_pc = 45;
                    continue;
                } else {
                    sdl_pc = 46;
                    continue;
                }
            },
            24 => {
                if ((!ctx.*.m_bInputOnly and !device.*.is_bluetooth) and (@as(c_int, ctx.*.device.*.product_id) != USB_PRODUCT_NINTENDO_SWITCH_JOYCON_GRIP)) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 28;
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
                if (ctx.*.m_bRumblePending or ctx.*.m_bRumbleZeroPending) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 40;
                    continue;
                }
            },
            27 => {
                INPUT_WAIT_TIMEOUT_MS = 100;
                if (now >= (ctx.*.m_ulLastInput +% @as(Uint64, @bitCast(@as(c_long, INPUT_WAIT_TIMEOUT_MS))))) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            28 => {
                if (device.*.is_bluetooth and (@as(c_int, ctx.*.m_nCurrentInputMode) != k_eSwitchInputReportIDs_SimpleControllerState)) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 34;
                    continue;
                }
            },
            29 => {
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            30 => {
                wasSyncWrite = ctx.*.m_bSyncWrite;
                ctx.*.m_bSyncWrite = @"true" != 0;
                _ = WriteProprietary(ctx, k_eSwitchProprietaryCommandIDs_ForceUSB, null, 0, @"false" != 0);
                ctx.*.m_bSyncWrite = wasSyncWrite;
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
                    sdl_pc = 29;
                    continue;
                }
            },
            33 => {
                INPUT_WAIT_TIMEOUT_MS_1 = 3000;
                if (now >= (ctx.*.m_ulLastInput +% @as(Uint64, @bitCast(@as(c_long, INPUT_WAIT_TIMEOUT_MS_1))))) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 37;
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
                    sdl_pc = 29;
                    continue;
                }
            },
            36 => {
                size = -@as(c_int, 1);
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
                    sdl_pc = 35;
                    continue;
                }
            },
            39 => {
                _ = HIDAPI_DriverSwitch_SendPendingRumble(ctx);
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            40 => {
                if (ctx.*.m_bRumbleActive and (now >= (ctx.*.m_ulRumbleSent +% @as(Uint64, RUMBLE_REFRESH_FREQUENCY_MS)))) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 43;
                    continue;
                }
            },
            41 => {
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            42 => {
                _ = WriteRumble(ctx);
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
                    sdl_pc = 41;
                    continue;
                }
            },
            45 => {
                _ = HIDAPI_JoystickConnected(device, null);
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
                if ((size < @as(c_int, 0)) and (device.*.num_joysticks > @as(c_int, 0))) {
                    sdl_pc = 48;
                    continue;
                } else {
                    sdl_pc = 49;
                    continue;
                }
            },
            48 => {
                HIDAPI_JoystickDisconnected(device, device.*.joysticks[@as(c_int, 0)]);
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
                return size >= @as(c_int, 0);
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverSwitch_CloseJoystick(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSwitch_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    if (!ctx.*.m_bInputOnly) {
        if (!(@as(c_int, ctx.*.m_nInitialInputMode) != 0) or (@as(c_int, ctx.*.m_nInitialInputMode) == k_eSwitchInputReportIDs_SimpleControllerState)) {
            _ = SetInputMode(ctx, k_eSwitchInputReportIDs_SimpleControllerState);
        }
    }
    SDL_RemoveHintCallback_REAL("SDL_JOYSTICK_ENHANCED_REPORTS", SDL_EnhancedReportsChanged, @ptrCast(@alignCast(ctx)));
    if ((ctx.*.m_eControllerType == @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_JoyConLeft)) or (ctx.*.m_eControllerType == @as(ESwitchDeviceInfoControllerType, k_eSwitchDeviceInfoControllerType_JoyConRight))) {
        SDL_RemoveHintCallback_REAL("SDL_JOYSTICK_HIDAPI_JOYCON_HOME_LED", SDL_HomeLEDHintChanged, @ptrCast(@alignCast(ctx)));
    } else {
        SDL_RemoveHintCallback_REAL("SDL_JOYSTICK_HIDAPI_SWITCH_HOME_LED", SDL_HomeLEDHintChanged, @ptrCast(@alignCast(ctx)));
    }
    SDL_RemoveHintCallback_REAL("SDL_JOYSTICK_HIDAPI_SWITCH_PLAYER_LED", SDL_PlayerLEDHintChanged, @ptrCast(@alignCast(ctx)));
    ctx.*.joystick = null;
    ctx.*.m_bReportSensors = @"false" != 0;
    ctx.*.m_bEnhancedMode = @"false" != 0;
    ctx.*.m_bEnhancedModeAvailable = @"false" != 0;
}
pub fn HIDAPI_DriverSwitch_FreeDevice(_: [*c]SDL_HIDAPI_Device) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub export var SDL_HIDAPI_DriverNintendoClassic: SDL_HIDAPI_DeviceDriver = SDL_HIDAPI_DeviceDriver{
    .name = "SDL_JOYSTICK_HIDAPI_NINTENDO_CLASSIC",
    .enabled = @"true" != 0,
    .RegisterHints = HIDAPI_DriverNintendoClassic_RegisterHints,
    .UnregisterHints = HIDAPI_DriverNintendoClassic_UnregisterHints,
    .IsEnabled = HIDAPI_DriverNintendoClassic_IsEnabled,
    .IsSupportedDevice = HIDAPI_DriverNintendoClassic_IsSupportedDevice,
    .InitDevice = HIDAPI_DriverSwitch_InitDevice,
    .GetDevicePlayerIndex = HIDAPI_DriverSwitch_GetDevicePlayerIndex,
    .SetDevicePlayerIndex = HIDAPI_DriverSwitch_SetDevicePlayerIndex,
    .UpdateDevice = HIDAPI_DriverSwitch_UpdateDevice,
    .OpenJoystick = HIDAPI_DriverSwitch_OpenJoystick,
    .RumbleJoystick = HIDAPI_DriverSwitch_RumbleJoystick,
    .RumbleJoystickTriggers = HIDAPI_DriverSwitch_RumbleJoystickTriggers,
    .GetJoystickCapabilities = HIDAPI_DriverSwitch_GetJoystickCapabilities,
    .SetJoystickLED = HIDAPI_DriverSwitch_SetJoystickLED,
    .SendJoystickEffect = HIDAPI_DriverSwitch_SendJoystickEffect,
    .SetJoystickSensorsEnabled = HIDAPI_DriverSwitch_SetJoystickSensorsEnabled,
    .CloseJoystick = HIDAPI_DriverSwitch_CloseJoystick,
    .FreeDevice = HIDAPI_DriverSwitch_FreeDevice,
};
pub export var SDL_HIDAPI_DriverJoyCons: SDL_HIDAPI_DeviceDriver = SDL_HIDAPI_DeviceDriver{
    .name = "SDL_JOYSTICK_HIDAPI_JOY_CONS",
    .enabled = @"true" != 0,
    .RegisterHints = HIDAPI_DriverJoyCons_RegisterHints,
    .UnregisterHints = HIDAPI_DriverJoyCons_UnregisterHints,
    .IsEnabled = HIDAPI_DriverJoyCons_IsEnabled,
    .IsSupportedDevice = HIDAPI_DriverJoyCons_IsSupportedDevice,
    .InitDevice = HIDAPI_DriverSwitch_InitDevice,
    .GetDevicePlayerIndex = HIDAPI_DriverSwitch_GetDevicePlayerIndex,
    .SetDevicePlayerIndex = HIDAPI_DriverSwitch_SetDevicePlayerIndex,
    .UpdateDevice = HIDAPI_DriverSwitch_UpdateDevice,
    .OpenJoystick = HIDAPI_DriverSwitch_OpenJoystick,
    .RumbleJoystick = HIDAPI_DriverSwitch_RumbleJoystick,
    .RumbleJoystickTriggers = HIDAPI_DriverSwitch_RumbleJoystickTriggers,
    .GetJoystickCapabilities = HIDAPI_DriverSwitch_GetJoystickCapabilities,
    .SetJoystickLED = HIDAPI_DriverSwitch_SetJoystickLED,
    .SendJoystickEffect = HIDAPI_DriverSwitch_SendJoystickEffect,
    .SetJoystickSensorsEnabled = HIDAPI_DriverSwitch_SetJoystickSensorsEnabled,
    .CloseJoystick = HIDAPI_DriverSwitch_CloseJoystick,
    .FreeDevice = HIDAPI_DriverSwitch_FreeDevice,
};
pub export var SDL_HIDAPI_DriverSwitch: SDL_HIDAPI_DeviceDriver = SDL_HIDAPI_DeviceDriver{
    .name = "SDL_JOYSTICK_HIDAPI_SWITCH",
    .enabled = @"true" != 0,
    .RegisterHints = HIDAPI_DriverSwitch_RegisterHints,
    .UnregisterHints = HIDAPI_DriverSwitch_UnregisterHints,
    .IsEnabled = HIDAPI_DriverSwitch_IsEnabled,
    .IsSupportedDevice = HIDAPI_DriverSwitch_IsSupportedDevice,
    .InitDevice = HIDAPI_DriverSwitch_InitDevice,
    .GetDevicePlayerIndex = HIDAPI_DriverSwitch_GetDevicePlayerIndex,
    .SetDevicePlayerIndex = HIDAPI_DriverSwitch_SetDevicePlayerIndex,
    .UpdateDevice = HIDAPI_DriverSwitch_UpdateDevice,
    .OpenJoystick = HIDAPI_DriverSwitch_OpenJoystick,
    .RumbleJoystick = HIDAPI_DriverSwitch_RumbleJoystick,
    .RumbleJoystickTriggers = HIDAPI_DriverSwitch_RumbleJoystickTriggers,
    .GetJoystickCapabilities = HIDAPI_DriverSwitch_GetJoystickCapabilities,
    .SetJoystickLED = HIDAPI_DriverSwitch_SetJoystickLED,
    .SendJoystickEffect = HIDAPI_DriverSwitch_SendJoystickEffect,
    .SetJoystickSensorsEnabled = HIDAPI_DriverSwitch_SetJoystickSensorsEnabled,
    .CloseJoystick = HIDAPI_DriverSwitch_CloseJoystick,
    .FreeDevice = HIDAPI_DriverSwitch_FreeDevice,
};

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_PI_F = @as(f32, 3.141592653589793238462643383279502884);
pub const SDL_STANDARD_GRAVITY = @as(f32, 9.80665);
pub const SDL_JOYSTICK_AXIS_MAX = @as(c_int, 32767);
pub const SDL_HAT_CENTERED = @as(c_uint, 0x00);
pub const SDL_HAT_UP = @as(c_uint, 0x01);
pub const SDL_HAT_RIGHT = @as(c_uint, 0x02);
pub const SDL_HAT_DOWN = @as(c_uint, 0x04);
pub const SDL_HAT_LEFT = @as(c_uint, 0x08);
pub const SDL_NS_PER_MS = __helpers.promoteIntLiteral(c_int, 1000000, .decimal);
pub const USB_VENDOR_NINTENDO = @as(c_int, 0x057e);
pub const USB_VENDOR_PDP = @as(c_int, 0x0e6f);
pub const USB_PRODUCT_NINTENDO_N64_CONTROLLER = @as(c_int, 0x2019);
pub const USB_PRODUCT_NINTENDO_SEGA_GENESIS_CONTROLLER = @as(c_int, 0x201e);
pub const USB_PRODUCT_NINTENDO_SNES_CONTROLLER = @as(c_int, 0x2017);
pub const USB_PRODUCT_NINTENDO_SWITCH_JOYCON_GRIP = @as(c_int, 0x200e);
pub const USB_PRODUCT_NINTENDO_SWITCH_JOYCON_LEFT = @as(c_int, 0x2006);
pub const USB_PRODUCT_NINTENDO_SWITCH_JOYCON_RIGHT = @as(c_int, 0x2007);
pub const USB_PRODUCT_NINTENDO_SWITCH_PRO = @as(c_int, 0x2009);
pub const USB_PRODUCT_NINTENDO_SWITCH2_PRO = @as(c_int, 0x2069);
pub const USB_PRODUCT_PDP_REALMZ_WIRELESS = @as(c_int, 0x018c);
pub const SDL_JOYSTICK_CAP_MONO_LED = @as(c_int, 0x00000001);
pub const SDL_JOYSTICK_CAP_PLAYER_LED = @as(c_int, 0x00000004);
pub const SDL_JOYSTICK_CAP_RUMBLE = @as(c_int, 0x00000010);
pub const RUMBLE_WRITE_FREQUENCY_MS = @as(c_int, 30);
pub const RUMBLE_REFRESH_FREQUENCY_MS = @as(c_int, 50);
pub const SWITCH_GYRO_SCALE = @as(f32, 14.2842);
pub const SWITCH_ACCEL_SCALE = @as(f32, 4096.0);
pub const SWITCH_GYRO_SCALE_MULT = @as(f32, 936.0);
pub const SWITCH_ACCEL_SCALE_MULT = @as(f32, 4.0);
pub const k_unSwitchOutputPacketDataLength = @as(c_int, 49);
pub const k_unSwitchMaxOutputPacketLength = @as(c_int, 64);
pub const k_unSPIStickFactoryCalibrationStartOffset = @as(c_int, 0x603D);
pub const k_unSPIStickFactoryCalibrationEndOffset = @as(c_int, 0x604E);
pub const k_unSPIStickUserCalibrationStartOffset = __helpers.promoteIntLiteral(c_int, 0x8010, .hex);
pub const k_unSPIStickUserCalibrationEndOffset = __helpers.promoteIntLiteral(c_int, 0x8025, .hex);
pub const k_unSPIIMUScaleStartOffset = @as(c_int, 0x6020);
pub const k_unSPIIMUScaleEndOffset = @as(c_int, 0x6037);
pub const k_unSPIIMUUserScaleStartOffset = __helpers.promoteIntLiteral(c_int, 0x8026, .hex);
pub const k_unSPIIMUUserScaleEndOffset = __helpers.promoteIntLiteral(c_int, 0x8039, .hex);
