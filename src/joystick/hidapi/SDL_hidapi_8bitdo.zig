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
pub const __helpers = @import("std").zig.c_translation.helpers;
pub const div_t = extern struct {
    quot: c_int = 0,
    rem: c_int = 0,
};
pub extern fn div(__numer: c_int, __denom: c_int) div_t;
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Sint16 = i16;
pub const Uint16 = u16;
pub const Uint32 = u32;
pub const Uint64 = u64;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_snprintf_REAL(text: [*c]u8, maxlen: usize, fmt: [*c]const u8, ...) c_int;
pub const struct_SDL_AtomicInt = extern struct {
    value: c_int = 0,
};
pub const SDL_AtomicInt = struct_SDL_AtomicInt;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_PropertiesID = Uint32;
pub const struct_SDL_GUID = extern struct {
    data: [16]Uint8 = @import("std").mem.zeroes([16]Uint8),
};
pub const SDL_GUID = struct_SDL_GUID;
pub const SDL_POWERSTATE_UNKNOWN: c_int = 0;
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
pub extern fn SDL_hid_read_timeout_REAL(dev: ?*SDL_hid_device, data: [*c]u8, length: usize, milliseconds: c_int) c_int;
pub extern fn SDL_hid_get_feature_report_REAL(dev: ?*SDL_hid_device, data: [*c]u8, length: usize) c_int;
pub extern fn SDL_GetHintBoolean_REAL(name: [*c]const u8, default_value: bool) bool;
pub const SDL_HintCallback = ?*const fn (userdata: ?*anyopaque, name: [*c]const u8, oldValue: [*c]const u8, newValue: [*c]const u8) callconv(.c) void;
pub extern fn SDL_AddHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) bool;
pub extern fn SDL_RemoveHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) void;
pub extern fn SDL_GetTicksNS_REAL() Uint64;
pub extern fn SDL_Delay_REAL(ms: Uint32) void;
pub extern fn SDL_AssertJoysticksLocked() void;
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
pub extern fn HIDAPI_SetDeviceSerial(device: [*c]SDL_HIDAPI_Device, serial: [*c]const u8) void;
pub extern fn HIDAPI_JoystickConnected(device: [*c]SDL_HIDAPI_Device, pJoystickID: [*c]SDL_JoystickID) bool;
pub extern fn HIDAPI_JoystickDisconnected(device: [*c]SDL_HIDAPI_Device, joystickID: SDL_JoystickID) void;
pub extern fn HIDAPI_RemapVal(val: f32, val_min: f32, val_max: f32, output_min: f32, output_max: f32) f32;
pub extern fn SDL_HIDAPI_SendRumble(device: [*c]SDL_HIDAPI_Device, data: [*c]const Uint8, size: c_int) c_int;
pub const SDL_GAMEPAD_BUTTON_8BITDO_L4: c_int = 11;
pub const SDL_GAMEPAD_BUTTON_8BITDO_R4: c_int = 12;
pub const SDL_GAMEPAD_BUTTON_8BITDO_PL: c_int = 13;
pub const SDL_GAMEPAD_BUTTON_8BITDO_PR: c_int = 14;
pub const SDL_GAMEPAD_NUM_8BITDO_BUTTONS: c_int = 15;
pub const SDL_GAMEPAD_BUTTON_8BITDO_SHARE: c_int = 15;
pub const SDL_GAMEPAD_NUM_8BITDO_ULTIMATE3_BUTTONS: c_int = 16;
pub const SDL_Driver8BitDo_Context = extern struct {
    sensors_supported: bool = false,
    sensors_enabled: bool = false,
    touchpad_01_supported: bool = false,
    touchpad_02_supported: bool = false,
    rumble_supported: bool = false,
    trigger_rumble_supported: bool = false,
    rumble_type: bool = false,
    rgb_supported: bool = false,
    player_led_supported: bool = false,
    powerstate_supported: bool = false,
    sensor_timestamp_supported: bool = false,
    serial: [6]Uint8 = @import("std").mem.zeroes([6]Uint8),
    version: Uint16 = 0,
    version_beta: Uint16 = 0,
    accelScale: f32 = 0,
    gyroScale: f32 = 0,
    last_state: [64]Uint8 = @import("std").mem.zeroes([64]Uint8),
    sensor_timestamp: Uint64 = 0,
    sensor_timestamp_interval: Uint64 = 0,
    rumble_left_value: Uint8 = 0,
    rumble_right_value: Uint8 = 0,
    trigger_rumble_left_value: Uint8 = 0,
    trigger_rumble_right_value: Uint8 = 0,
    last_tick: Uint32 = 0,
};
pub const ABITDO_SENSORS = extern struct {
    sAccelX: c_short align(1) = 0,
    sAccelY: c_short align(1) = 0,
    sAccelZ: c_short align(1) = 0,
    sGyroX: c_short align(1) = 0,
    sGyroY: c_short align(1) = 0,
    sGyroZ: c_short align(1) = 0,
};
pub fn HIDAPI_Driver8BitDo_RegisterHints(callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = SDL_AddHintCallback_REAL("SDL_JOYSTICK_HIDAPI_8BITDO", callback, userdata);
}
pub fn HIDAPI_Driver8BitDo_UnregisterHints(callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_RemoveHintCallback_REAL("SDL_JOYSTICK_HIDAPI_8BITDO", callback, userdata);
}
pub fn HIDAPI_Driver8BitDo_IsEnabled() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI_8BITDO", SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI", @"true" != 0));
}
pub fn ReadFeatureReport(dev: ?*SDL_hid_device, report_id: Uint8, report: [*c]Uint8, length: usize) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    _ = memset(@ptrCast(@alignCast(report)), 0, length);
    report[@as(c_int, 0)] = report_id;
    return SDL_hid_get_feature_report_REAL(dev, report, length);
}
pub fn HIDAPI_Driver8BitDo_IsSupportedDevice(_: [*c]SDL_HIDAPI_Device, _: [*c]const u8, arg_type: SDL_GamepadType, vendor_id: Uint16, product_id: Uint16, _: Uint16, _: c_int, _: c_int, _: c_int, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (@as(c_int, vendor_id) == USB_VENDOR_8BITDO) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                switch (@as(c_int, product_id)) {
                    USB_PRODUCT_8BITDO_SF30_PRO => {
                        sdl_pc = 5;
                        continue;
                    },
                    USB_PRODUCT_8BITDO_SF30_PRO_BT => {
                        sdl_pc = 6;
                        continue;
                    },
                    USB_PRODUCT_8BITDO_SN30_PRO => {
                        sdl_pc = 7;
                        continue;
                    },
                    USB_PRODUCT_8BITDO_SN30_PRO_BT => {
                        sdl_pc = 8;
                        continue;
                    },
                    USB_PRODUCT_8BITDO_PRO_2 => {
                        sdl_pc = 9;
                        continue;
                    },
                    USB_PRODUCT_8BITDO_PRO_2_BT => {
                        sdl_pc = 10;
                        continue;
                    },
                    USB_PRODUCT_8BITDO_PRO_3 => {
                        sdl_pc = 11;
                        continue;
                    },
                    USB_PRODUCT_8BITDO_ULTIMATE2_WIRELESS => {
                        sdl_pc = 12;
                        continue;
                    },
                    USB_PRODUCT_8BITDO_ULTIMATE2C_WIRELESS => {
                        sdl_pc = 13;
                        continue;
                    },
                    USB_PRODUCT_8BITDO_ULTIMATE3 => {
                        sdl_pc = 14;
                        continue;
                    },
                    else => {
                        sdl_pc = 15;
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
                return @"false" != 0;
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
                {
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
                {
                    sdl_pc = 13;
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
                return @"true" != 0;
            },
            15 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_Driver8BitDo_InitDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_Driver8BitDo_Context = undefined;
    ctx = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(ctx.*)))));
    _ = &ctx;
    if (!(ctx != null)) {
        return @"false" != 0;
    }
    device.*.context = @ptrCast(@alignCast(ctx));
    if (@as(c_int, device.*.product_id) == USB_PRODUCT_8BITDO_ULTIMATE2_WIRELESS) {
        const ULTIMATE2_WIRELESS_V103_REPORT_SIZE: c_int = 34;
        _ = &ULTIMATE2_WIRELESS_V103_REPORT_SIZE;
        const MAX_ATTEMPTS: c_int = 3;
        _ = &MAX_ATTEMPTS;
        {
            var attempt: c_int = 0;
            _ = &attempt;
            while (attempt < MAX_ATTEMPTS) : (attempt += 1) {
                var data: [64]Uint8 = undefined;
                _ = &data;
                var size: c_int = SDL_hid_read_timeout_REAL(device.*.dev, @ptrCast(@alignCast(&data)), @sizeOf(@TypeOf(data)), 80);
                _ = &size;
                if (size == @as(c_int, 0)) {
                    continue;
                }
                if (size >= ULTIMATE2_WIRELESS_V103_REPORT_SIZE) {
                    ctx.*.sensors_supported = @"true" != 0;
                    ctx.*.rumble_supported = @"true" != 0;
                    ctx.*.powerstate_supported = @"true" != 0;
                }
                break;
            }
        }
    } else if (@as(c_int, device.*.product_id) == USB_PRODUCT_8BITDO_ULTIMATE2C_WIRELESS) {} else if (@as(c_int, device.*.product_id) == USB_PRODUCT_8BITDO_ULTIMATE3) {
        ctx.*.sensors_supported = @"true" != 0;
        ctx.*.rumble_supported = @"true" != 0;
        ctx.*.powerstate_supported = @"true" != 0;
        ctx.*.sensor_timestamp_supported = @"true" != 0;
        var data: [64]Uint8 = undefined;
        _ = &data;
        const MAX_ATTEMPTS: c_int = 5;
        _ = &MAX_ATTEMPTS;
        {
            var attempt: c_int = 0;
            _ = &attempt;
            while (attempt < MAX_ATTEMPTS) : (attempt += 1) {
                var size: c_int = ReadFeatureReport(device.*.dev, SDL_8BITDO_FEATURE_REPORTID, @ptrCast(@alignCast(&data)), @sizeOf(@TypeOf(data)));
                _ = &size;
                if (size > @as(c_int, 0)) {
                    if (@as(c_int, data[@as(c_int, 3)]) == @as(c_int, 0)) {
                        ctx.*.rumble_supported = @"false" != 0;
                        ctx.*.trigger_rumble_supported = @"false" != 0;
                    }
                    if ((@as(c_int, data[@as(c_int, 3)]) & @as(c_int, 2)) != 0) {
                        ctx.*.trigger_rumble_supported = @"true" != 0;
                    }
                    if (@as(c_int, data[@as(c_int, 4)]) == @as(c_int, 0)) {
                        ctx.*.sensors_supported = @"false" != 0;
                        ctx.*.sensor_timestamp_supported = @"false" != 0;
                    }
                    if ((size >= @as(c_int, 17)) and (@as(c_int, data[@as(c_int, 11)]) != @as(c_int, 0))) {
                        var serial: [18]u8 = undefined;
                        _ = &serial;
                        _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&serial)), @sizeOf(@TypeOf(serial)), "%.2x-%.2x-%.2x-%.2x-%.2x-%.2x", data[@as(c_int, 16)], data[@as(c_int, 15)], data[@as(c_int, 14)], data[@as(c_int, 13)], data[@as(c_int, 12)], data[@as(c_int, 11)]);
                        HIDAPI_SetDeviceSerial(device, @ptrCast(@alignCast(&serial)));
                    }
                    break;
                }
                SDL_Delay_REAL(10);
            }
        }
    } else {
        var data: [64]Uint8 = undefined;
        _ = &data;
        const MAX_ATTEMPTS: c_int = 5;
        _ = &MAX_ATTEMPTS;
        {
            var attempt: c_int = 0;
            _ = &attempt;
            while (attempt < MAX_ATTEMPTS) : (attempt += 1) {
                var size: c_int = ReadFeatureReport(device.*.dev, SDL_8BITDO_FEATURE_REPORTID_ENABLE_SDL_REPORTID, @ptrCast(@alignCast(&data)), @sizeOf(@TypeOf(data)));
                _ = &size;
                if (size > @as(c_int, 0)) {
                    ctx.*.sensors_supported = @"true" != 0;
                    ctx.*.rumble_supported = @"true" != 0;
                    ctx.*.powerstate_supported = @"true" != 0;
                    if ((size >= @as(c_int, 14)) and (@as(c_int, data[@as(c_int, 13)]) == SDL_8BITDO_SENSOR_TIMESTAMP_ENABLE)) {
                        ctx.*.sensor_timestamp_supported = @"true" != 0;
                    }
                    if ((size >= @as(c_int, 12)) and (@as(c_int, data[@as(c_int, 10)]) != @as(c_int, 0))) {
                        var serial: [18]u8 = undefined;
                        _ = &serial;
                        _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&serial)), @sizeOf(@TypeOf(serial)), "%.2x-%.2x-%.2x-%.2x-%.2x-%.2x", data[@as(c_int, 10)], data[@as(c_int, 9)], data[@as(c_int, 8)], data[@as(c_int, 7)], data[@as(c_int, 6)], data[@as(c_int, 5)]);
                        HIDAPI_SetDeviceSerial(device, @ptrCast(@alignCast(&serial)));
                    }
                    break;
                }
                SDL_Delay_REAL(10);
            }
        }
    }
    if ((@as(c_int, device.*.product_id) == USB_PRODUCT_8BITDO_SF30_PRO) or (@as(c_int, device.*.product_id) == USB_PRODUCT_8BITDO_SF30_PRO_BT)) {
        HIDAPI_SetDeviceName(device, "8BitDo SF30 Pro");
    } else if ((@as(c_int, device.*.product_id) == USB_PRODUCT_8BITDO_SN30_PRO) or (@as(c_int, device.*.product_id) == USB_PRODUCT_8BITDO_SN30_PRO_BT)) {
        HIDAPI_SetDeviceName(device, "8BitDo SN30 Pro");
    } else if ((@as(c_int, device.*.product_id) == USB_PRODUCT_8BITDO_PRO_2) or (@as(c_int, device.*.product_id) == USB_PRODUCT_8BITDO_PRO_2_BT)) {
        HIDAPI_SetDeviceName(device, "8BitDo Pro 2");
    } else if (@as(c_int, device.*.product_id) == USB_PRODUCT_8BITDO_PRO_3) {
        HIDAPI_SetDeviceName(device, "8BitDo Pro 3");
    }
    return HIDAPI_JoystickConnected(device, null);
}
pub fn HIDAPI_Driver8BitDo_GetDevicePlayerIndex(_: [*c]SDL_HIDAPI_Device, _: SDL_JoystickID) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return -@as(c_int, 1);
}
pub fn HIDAPI_Driver8BitDo_SetDevicePlayerIndex(_: [*c]SDL_HIDAPI_Device, _: SDL_JoystickID, _: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn HIDAPI_Driver8BitDo_GetIMURateForProductID(device: [*c]SDL_HIDAPI_Device) callconv(.c) Uint64 {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_Driver8BitDo_Context = undefined;
    _ = &ctx;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                ctx = @ptrCast(@alignCast(device.*.context));
                switch (@as(c_int, device.*.product_id)) {
                    USB_PRODUCT_8BITDO_SF30_PRO => {
                        sdl_pc = 2;
                        continue;
                    },
                    USB_PRODUCT_8BITDO_SF30_PRO_BT => {
                        sdl_pc = 3;
                        continue;
                    },
                    USB_PRODUCT_8BITDO_SN30_PRO => {
                        sdl_pc = 4;
                        continue;
                    },
                    USB_PRODUCT_8BITDO_SN30_PRO_BT => {
                        sdl_pc = 5;
                        continue;
                    },
                    USB_PRODUCT_8BITDO_PRO_2 => {
                        sdl_pc = 12;
                        continue;
                    },
                    USB_PRODUCT_8BITDO_PRO_2_BT => {
                        sdl_pc = 13;
                        continue;
                    },
                    USB_PRODUCT_8BITDO_PRO_3 => {
                        sdl_pc = 14;
                        continue;
                    },
                    USB_PRODUCT_8BITDO_ULTIMATE2_WIRELESS => {
                        sdl_pc = 21;
                        continue;
                    },
                    USB_PRODUCT_8BITDO_ULTIMATE3 => {
                        sdl_pc = 25;
                        continue;
                    },
                    else => {
                        sdl_pc = 26;
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
                if (device.*.is_bluetooth) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 7;
                    continue;
                }
            },
            6 => {
                return 70;
            },
            7 => {
                if (ctx.*.sensor_timestamp_supported) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
            },
            8 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            9 => {
                return 200;
            },
            10 => {
                return 100;
            },
            11 => {
                {
                    sdl_pc = 8;
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
                    sdl_pc = 14;
                    continue;
                }
            },
            14 => {
                if (device.*.is_bluetooth) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            15 => {
                return 85;
            },
            16 => {
                if (ctx.*.sensor_timestamp_supported) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            18 => {
                return 200;
            },
            19 => {
                return 100;
            },
            20 => {
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            21 => {
                if (device.*.is_bluetooth) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            22 => {
                return 120;
            },
            23 => {
                return 1000;
            },
            24 => {
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            25 => {
                return 120;
            },
            26 => {
                return 120;
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_Driver8BitDo_OpenJoystick(device: [*c]SDL_HIDAPI_Device, joystick: [*c]SDL_Joystick) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_Driver8BitDo_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    SDL_AssertJoysticksLocked();
    _ = memset(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.last_state))))), 0, @sizeOf(@TypeOf(ctx.*.last_state)));
    if ((((@as(c_int, device.*.product_id) == USB_PRODUCT_8BITDO_PRO_2) or (@as(c_int, device.*.product_id) == USB_PRODUCT_8BITDO_PRO_2_BT)) or (@as(c_int, device.*.product_id) == USB_PRODUCT_8BITDO_PRO_3)) or (@as(c_int, device.*.product_id) == USB_PRODUCT_8BITDO_ULTIMATE2_WIRELESS)) {
        joystick.*.nbuttons = SDL_GAMEPAD_NUM_8BITDO_BUTTONS;
    } else if (@as(c_int, device.*.product_id) == USB_PRODUCT_8BITDO_ULTIMATE2C_WIRELESS) {
        joystick.*.nbuttons = SDL_GAMEPAD_BUTTON_8BITDO_R4 + @as(c_int, 1);
    } else if (@as(c_int, device.*.product_id) == USB_PRODUCT_8BITDO_ULTIMATE3) {
        joystick.*.nbuttons = SDL_GAMEPAD_NUM_8BITDO_ULTIMATE3_BUTTONS;
    } else {
        joystick.*.nbuttons = 11;
    }
    joystick.*.naxes = SDL_GAMEPAD_AXIS_COUNT;
    joystick.*.nhats = 1;
    if (ctx.*.sensors_supported) {
        const imu_polling_rate: Uint64 = HIDAPI_Driver8BitDo_GetIMURateForProductID(device);
        _ = &imu_polling_rate;
        ctx.*.sensor_timestamp_interval = @truncate(@as(c_ulonglong, SDL_NS_PER_SECOND) / @as(c_ulonglong, imu_polling_rate));
        SDL_PrivateJoystickAddSensor(joystick, SDL_SENSOR_GYRO, @floatFromInt(imu_polling_rate));
        SDL_PrivateJoystickAddSensor(joystick, SDL_SENSOR_ACCEL, @floatFromInt(imu_polling_rate));
        ctx.*.accelScale = SDL_STANDARD_GRAVITY / ABITDO_ACCEL_SCALE;
        ctx.*.gyroScale = (ABITDO_GYRO_MAX_DEGREES_PER_SECOND * (SDL_PI_F / @as(f32, 180.0))) / @as(f32, @floatFromInt(@as(c_int, 32767)));
    }
    return @"true" != 0;
}
pub fn HIDAPI_Driver8BitDo_RumbleJoystick(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, low_frequency_rumble: Uint16, high_frequency_rumble: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_Driver8BitDo_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    if (ctx.*.rumble_supported) {
        var rumble_packet: [5]Uint8 = [5]Uint8{
            5,
            0,
            0,
            0,
            0,
        };
        _ = &rumble_packet;
        rumble_packet[@as(c_int, 1)] = @bitCast(@as(i8, @truncate(@as(c_int, low_frequency_rumble) >> @intCast(@as(c_int, 8)))));
        rumble_packet[@as(c_int, 2)] = @bitCast(@as(i8, @truncate(@as(c_int, high_frequency_rumble) >> @intCast(@as(c_int, 8)))));
        if (ctx.*.trigger_rumble_supported) {
            rumble_packet[@as(c_int, 3)] = ctx.*.trigger_rumble_left_value;
            rumble_packet[@as(c_int, 4)] = ctx.*.trigger_rumble_right_value;
            ctx.*.rumble_left_value = rumble_packet[@as(c_int, 1)];
            ctx.*.rumble_right_value = rumble_packet[@as(c_int, 2)];
        }
        if (@as(c_ulong, @bitCast(@as(c_long, SDL_HIDAPI_SendRumble(device, @ptrCast(@alignCast(&rumble_packet)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(rumble_packet))))))))) != @sizeOf(@TypeOf(rumble_packet))) {
            return SDL_SetError_REAL("Couldn't send rumble packet");
        }
        return @"true" != 0;
    } else {
        return SDL_SetError_REAL("That operation is not supported");
    }
}
pub fn HIDAPI_Driver8BitDo_RumbleJoystickTriggers(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, left_rumble: Uint16, right_rumble: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_Driver8BitDo_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    if (ctx.*.trigger_rumble_supported) {
        var rumble_packet: [5]Uint8 = [5]Uint8{
            5,
            0,
            0,
            0,
            0,
        };
        _ = &rumble_packet;
        rumble_packet[@as(c_int, 3)] = @bitCast(@as(i8, @truncate(@as(c_int, left_rumble) >> @intCast(@as(c_int, 8)))));
        rumble_packet[@as(c_int, 4)] = @bitCast(@as(i8, @truncate(@as(c_int, right_rumble) >> @intCast(@as(c_int, 8)))));
        if (ctx.*.rumble_supported) {
            rumble_packet[@as(c_int, 1)] = ctx.*.rumble_left_value;
            rumble_packet[@as(c_int, 2)] = ctx.*.rumble_right_value;
            ctx.*.trigger_rumble_left_value = rumble_packet[@as(c_int, 3)];
            ctx.*.trigger_rumble_right_value = rumble_packet[@as(c_int, 4)];
        }
        if (@as(c_ulong, @bitCast(@as(c_long, SDL_HIDAPI_SendRumble(device, @ptrCast(@alignCast(&rumble_packet)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(rumble_packet))))))))) != @sizeOf(@TypeOf(rumble_packet))) {
            return SDL_SetError_REAL("Couldn't send rumble packet");
        }
        return @"true" != 0;
    } else {
        return SDL_SetError_REAL("That operation is not supported");
    }
}
pub fn HIDAPI_Driver8BitDo_GetJoystickCapabilities(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_Driver8BitDo_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    var caps: Uint32 = 0;
    _ = &caps;
    if (ctx.*.rumble_supported) {
        caps |= SDL_JOYSTICK_CAP_RUMBLE;
    }
    if (ctx.*.rgb_supported) {
        caps |= SDL_JOYSTICK_CAP_RGB_LED;
    }
    return caps;
}
pub fn HIDAPI_Driver8BitDo_SetJoystickLED(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: Uint8, _: Uint8, _: Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_Driver8BitDo_SendJoystickEffect(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: ?*const anyopaque, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_Driver8BitDo_SetJoystickSensorsEnabled(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, enabled: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_Driver8BitDo_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    if (ctx.*.sensors_supported) {
        ctx.*.sensors_enabled = enabled;
        return @"true" != 0;
    }
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_Driver8BitDo_HandleOldStatePacket(joystick: [*c]SDL_Joystick, ctx: [*c]SDL_Driver8BitDo_Context, data: [*c]Uint8, size: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var axis: Sint16 = undefined;
    _ = &axis;
    var timestamp: Uint64 = undefined;
    _ = &timestamp;
    var hat: Uint8 = undefined;
    _ = &hat;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                timestamp = SDL_GetTicksNS_REAL();
                if (@as(c_int, ctx.*.last_state[@as(c_int, 2)]) != @as(c_int, data[@as(c_int, 2)])) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                switch (@as(c_int, data[@as(c_int, 2)])) {
                    @as(c_int, 0) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(c_int, 5) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(c_int, 6) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(c_int, 7) => {
                        sdl_pc = 12;
                        continue;
                    },
                    else => {
                        sdl_pc = 13;
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
                if (@as(c_int, ctx.*.last_state[@as(c_int, 0)]) != @as(c_int, data[@as(c_int, 0)])) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            4 => {
                SDL_SendJoystickHat(timestamp, joystick, 0, hat);
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            5 => {
                hat = SDL_HAT_UP;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            6 => {
                hat = @truncate(SDL_HAT_RIGHT | SDL_HAT_UP);
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            7 => {
                hat = SDL_HAT_RIGHT;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            8 => {
                hat = @truncate(SDL_HAT_RIGHT | SDL_HAT_DOWN);
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            9 => {
                hat = SDL_HAT_DOWN;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            10 => {
                hat = @truncate(SDL_HAT_LEFT | SDL_HAT_DOWN);
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            11 => {
                hat = SDL_HAT_LEFT;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            12 => {
                hat = @truncate(SDL_HAT_LEFT | SDL_HAT_UP);
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            13 => {
                hat = SDL_HAT_CENTERED;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            14 => {
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SOUTH, (@as(c_int, data[@as(c_int, 0)]) & @as(c_int, 1)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_EAST, (@as(c_int, data[@as(c_int, 0)]) & @as(c_int, 2)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_WEST, (@as(c_int, data[@as(c_int, 0)]) & @as(c_int, 8)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_NORTH, (@as(c_int, data[@as(c_int, 0)]) & @as(c_int, 16)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_SHOULDER, (@as(c_int, data[@as(c_int, 0)]) & @as(c_int, 64)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER, (@as(c_int, data[@as(c_int, 0)]) & @as(c_int, 128)) != @as(c_int, 0));
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
                if (@as(c_int, ctx.*.last_state[@as(c_int, 1)]) != @as(c_int, data[@as(c_int, 1)])) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            17 => {
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_GUIDE, (@as(c_int, data[@as(c_int, 1)]) & @as(c_int, 16)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_BACK, (@as(c_int, data[@as(c_int, 1)]) & @as(c_int, 4)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_START, (@as(c_int, data[@as(c_int, 1)]) & @as(c_int, 8)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_STICK, (@as(c_int, data[@as(c_int, 1)]) & @as(c_int, 32)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_STICK, (@as(c_int, data[@as(c_int, 1)]) & @as(c_int, 64)) != @as(c_int, 0));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFT_TRIGGER, @truncate(if ((@as(c_int, data[@as(c_int, 1)]) & @as(c_int, 1)) != 0) @as(c_int, @as(Sint16, @truncate(@as(c_int, 32767)))) else @as(c_int, @as(Sint16, @truncate(~@as(c_int, 32767))))));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHT_TRIGGER, @truncate(if ((@as(c_int, data[@as(c_int, 1)]) & @as(c_int, 2)) != 0) @as(c_int, @as(Sint16, @truncate(@as(c_int, 32767)))) else @as(c_int, @as(Sint16, @truncate(~@as(c_int, 32767))))));
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
                axis = @truncate(if (@as(c_int, data[@as(c_int, 3)]) == @as(c_int, 127)) @as(c_int, 0) else @as(c_int, @as(Sint16, @intFromFloat(HIDAPI_RemapVal(@floatFromInt(@as(c_int, data[@as(c_int, 3)]) - @as(c_int, 127)), @floatFromInt(-@as(c_int, 127)), @floatFromInt(@as(c_int, 255) - @as(c_int, 127)), @floatFromInt(@as(Sint16, @truncate(~@as(c_int, 32767)))), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767)))))))));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, axis);
                axis = @truncate(if (@as(c_int, data[@as(c_int, 4)]) == @as(c_int, 127)) @as(c_int, 0) else @as(c_int, @as(Sint16, @intFromFloat(HIDAPI_RemapVal(@floatFromInt(@as(c_int, data[@as(c_int, 4)]) - @as(c_int, 127)), @floatFromInt(-@as(c_int, 127)), @floatFromInt(@as(c_int, 255) - @as(c_int, 127)), @floatFromInt(@as(Sint16, @truncate(~@as(c_int, 32767)))), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767)))))))));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, axis);
                axis = @truncate(if (@as(c_int, data[@as(c_int, 5)]) == @as(c_int, 127)) @as(c_int, 0) else @as(c_int, @as(Sint16, @intFromFloat(HIDAPI_RemapVal(@floatFromInt(@as(c_int, data[@as(c_int, 5)]) - @as(c_int, 127)), @floatFromInt(-@as(c_int, 127)), @floatFromInt(@as(c_int, 255) - @as(c_int, 127)), @floatFromInt(@as(Sint16, @truncate(~@as(c_int, 32767)))), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767)))))))));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, axis);
                axis = @truncate(if (@as(c_int, data[@as(c_int, 6)]) == @as(c_int, 127)) @as(c_int, 0) else @as(c_int, @as(Sint16, @intFromFloat(HIDAPI_RemapVal(@floatFromInt(@as(c_int, data[@as(c_int, 6)]) - @as(c_int, 127)), @floatFromInt(-@as(c_int, 127)), @floatFromInt(@as(c_int, 255) - @as(c_int, 127)), @floatFromInt(@as(Sint16, @truncate(~@as(c_int, 32767)))), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767)))))))));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, axis);
                _ = memcpy(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.last_state))))), @ptrCast(@alignCast(data)), if (@as(c_ulong, @bitCast(@as(c_long, size))) < @sizeOf(@TypeOf(ctx.*.last_state))) @as(c_ulong, @bitCast(@as(c_long, size))) else @sizeOf(@TypeOf(ctx.*.last_state)));
                {}
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_Driver8BitDo_HandleStatePacket(joystick: [*c]SDL_Joystick, ctx: [*c]SDL_Driver8BitDo_Context, data: [*c]Uint8, size: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var axis: Sint16 = undefined;
    _ = &axis;
    var timestamp: Uint64 = undefined;
    _ = &timestamp;
    var hat: Uint8 = undefined;
    _ = &hat;
    var state: SDL_PowerState = undefined;
    _ = &state;
    var percent: c_int = undefined;
    _ = &percent;
    var status: Uint8 = undefined;
    _ = &status;
    var level: Uint8 = undefined;
    _ = &level;
    var sensor_timestamp: Uint64 = undefined;
    _ = &sensor_timestamp;
    var values: [3]f32 = undefined;
    _ = &values;
    var sensors: [*c]ABITDO_SENSORS = undefined;
    _ = &sensors;
    var delta: Uint32 = undefined;
    _ = &delta;
    var tick: Uint32 = undefined;
    _ = &tick;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                timestamp = SDL_GetTicksNS_REAL();
                switch (@as(c_int, data[@as(c_int, 0)])) {
                    SDL_8BITDO_REPORTID_NOT_SUPPORTED_SDL_REPORTID => {
                        sdl_pc = 2;
                        continue;
                    },
                    SDL_8BITDO_REPORTID_SDL_REPORTID => {
                        sdl_pc = 3;
                        continue;
                    },
                    SDL_8BITDO_BT_REPORTID_SDL_REPORTID => {
                        sdl_pc = 4;
                        continue;
                    },
                    else => {
                        sdl_pc = 5;
                        continue;
                    },
                }
            },
            1 => {
                if (@as(c_int, ctx.*.last_state[@as(c_int, 1)]) != @as(c_int, data[@as(c_int, 1)])) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 7;
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
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            5 => {
                return;
            },
            6 => {
                switch (@as(c_int, data[@as(c_int, 1)])) {
                    @as(c_int, 0) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(c_int, 5) => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(c_int, 6) => {
                        sdl_pc = 16;
                        continue;
                    },
                    @as(c_int, 7) => {
                        sdl_pc = 17;
                        continue;
                    },
                    else => {
                        sdl_pc = 18;
                        continue;
                    },
                }
            },
            7 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            8 => {
                if (@as(c_int, ctx.*.last_state[@as(c_int, 8)]) != @as(c_int, data[@as(c_int, 8)])) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            9 => {
                SDL_SendJoystickHat(timestamp, joystick, 0, hat);
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            10 => {
                hat = SDL_HAT_UP;
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            11 => {
                hat = @truncate(SDL_HAT_RIGHT | SDL_HAT_UP);
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            12 => {
                hat = SDL_HAT_RIGHT;
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            13 => {
                hat = @truncate(SDL_HAT_RIGHT | SDL_HAT_DOWN);
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            14 => {
                hat = SDL_HAT_DOWN;
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            15 => {
                hat = @truncate(SDL_HAT_LEFT | SDL_HAT_DOWN);
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            16 => {
                hat = SDL_HAT_LEFT;
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            17 => {
                hat = @truncate(SDL_HAT_LEFT | SDL_HAT_UP);
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            18 => {
                hat = SDL_HAT_CENTERED;
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            19 => {
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SOUTH, (@as(c_int, data[@as(c_int, 8)]) & @as(c_int, 1)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_EAST, (@as(c_int, data[@as(c_int, 8)]) & @as(c_int, 2)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_WEST, (@as(c_int, data[@as(c_int, 8)]) & @as(c_int, 8)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_NORTH, (@as(c_int, data[@as(c_int, 8)]) & @as(c_int, 16)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_SHOULDER, (@as(c_int, data[@as(c_int, 8)]) & @as(c_int, 64)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER, (@as(c_int, data[@as(c_int, 8)]) & @as(c_int, 128)) != @as(c_int, 0));
                if (joystick.*.nbuttons > SDL_GAMEPAD_BUTTON_8BITDO_PR) {
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
                if (@as(c_int, ctx.*.last_state[@as(c_int, 9)]) != @as(c_int, data[@as(c_int, 9)])) {
                    sdl_pc = 28;
                    continue;
                } else {
                    sdl_pc = 29;
                    continue;
                }
            },
            22 => {
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_8BITDO_PL, (@as(c_int, data[@as(c_int, 8)]) & @as(c_int, 32)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_8BITDO_PR, (@as(c_int, data[@as(c_int, 8)]) & @as(c_int, 4)) != @as(c_int, 0));
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                if (joystick.*.nbuttons > SDL_GAMEPAD_BUTTON_8BITDO_R4) {
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
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_8BITDO_L4, (@as(c_int, data[@as(c_int, 8)]) & @as(c_int, 4)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_8BITDO_R4, (@as(c_int, data[@as(c_int, 8)]) & @as(c_int, 32)) != @as(c_int, 0));
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
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_GUIDE, (@as(c_int, data[@as(c_int, 9)]) & @as(c_int, 16)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_BACK, (@as(c_int, data[@as(c_int, 9)]) & @as(c_int, 4)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_START, (@as(c_int, data[@as(c_int, 9)]) & @as(c_int, 8)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_STICK, (@as(c_int, data[@as(c_int, 9)]) & @as(c_int, 32)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_STICK, (@as(c_int, data[@as(c_int, 9)]) & @as(c_int, 64)) != @as(c_int, 0));
                if (joystick.*.nbuttons >= SDL_GAMEPAD_NUM_8BITDO_ULTIMATE3_BUTTONS) {
                    sdl_pc = 31;
                    continue;
                } else {
                    sdl_pc = 32;
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
                if ((size > @as(c_int, 10)) and (@as(c_int, ctx.*.last_state[@as(c_int, 10)]) != @as(c_int, data[@as(c_int, 10)]))) {
                    sdl_pc = 34;
                    continue;
                } else {
                    sdl_pc = 35;
                    continue;
                }
            },
            31 => {
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_8BITDO_SHARE, (@as(c_int, data[@as(c_int, 9)]) & @as(c_int, 128)) != @as(c_int, 0));
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            32 => {
                {
                    sdl_pc = 33;
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
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_8BITDO_L4, (@as(c_int, data[@as(c_int, 10)]) & @as(c_int, 1)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_8BITDO_R4, (@as(c_int, data[@as(c_int, 10)]) & @as(c_int, 2)) != @as(c_int, 0));
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
                axis = @truncate(if (@as(c_int, data[@as(c_int, 2)]) == @as(c_int, 127)) @as(c_int, 0) else @as(c_int, @as(Sint16, @intFromFloat(HIDAPI_RemapVal(@floatFromInt(@as(c_int, data[@as(c_int, 2)]) - @as(c_int, 127)), @floatFromInt(-@as(c_int, 127)), @floatFromInt(@as(c_int, 255) - @as(c_int, 127)), @floatFromInt(@as(Sint16, @truncate(~@as(c_int, 32767)))), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767)))))))));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, axis);
                axis = @truncate(if (@as(c_int, data[@as(c_int, 3)]) == @as(c_int, 127)) @as(c_int, 0) else @as(c_int, @as(Sint16, @intFromFloat(HIDAPI_RemapVal(@floatFromInt(@as(c_int, data[@as(c_int, 3)]) - @as(c_int, 127)), @floatFromInt(-@as(c_int, 127)), @floatFromInt(@as(c_int, 255) - @as(c_int, 127)), @floatFromInt(@as(Sint16, @truncate(~@as(c_int, 32767)))), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767)))))))));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, axis);
                axis = @truncate(if (@as(c_int, data[@as(c_int, 4)]) == @as(c_int, 127)) @as(c_int, 0) else @as(c_int, @as(Sint16, @intFromFloat(HIDAPI_RemapVal(@floatFromInt(@as(c_int, data[@as(c_int, 4)]) - @as(c_int, 127)), @floatFromInt(-@as(c_int, 127)), @floatFromInt(@as(c_int, 255) - @as(c_int, 127)), @floatFromInt(@as(Sint16, @truncate(~@as(c_int, 32767)))), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767)))))))));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, axis);
                axis = @truncate(if (@as(c_int, data[@as(c_int, 5)]) == @as(c_int, 127)) @as(c_int, 0) else @as(c_int, @as(Sint16, @intFromFloat(HIDAPI_RemapVal(@floatFromInt(@as(c_int, data[@as(c_int, 5)]) - @as(c_int, 127)), @floatFromInt(-@as(c_int, 127)), @floatFromInt(@as(c_int, 255) - @as(c_int, 127)), @floatFromInt(@as(Sint16, @truncate(~@as(c_int, 32767)))), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767)))))))));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, axis);
                axis = @truncate((@as(c_int, data[@as(c_int, 7)]) * @as(c_int, 257)) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFT_TRIGGER, axis);
                axis = @truncate((@as(c_int, data[@as(c_int, 6)]) * @as(c_int, 257)) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHT_TRIGGER, axis);
                if (ctx.*.powerstate_supported) {
                    sdl_pc = 37;
                    continue;
                } else {
                    sdl_pc = 38;
                    continue;
                }
            },
            37 => {
                status = @bitCast(@as(i8, @truncate(@as(c_int, data[@as(c_int, 14)]) >> @intCast(@as(c_int, 7)))));
                level = @bitCast(@as(i8, @truncate(@as(c_int, data[@as(c_int, 14)]) & @as(c_int, 127))));
                if (@as(c_int, level) == @as(c_int, 100)) {
                    sdl_pc = 40;
                    continue;
                } else {
                    sdl_pc = 41;
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
                if (ctx.*.sensors_enabled) {
                    sdl_pc = 48;
                    continue;
                } else {
                    sdl_pc = 49;
                    continue;
                }
            },
            40 => {
                status = 2;
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            41 => {
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            42 => {
                switch (@as(c_int, status)) {
                    @as(c_int, 0) => {
                        sdl_pc = 44;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 45;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 46;
                        continue;
                    },
                    else => {
                        sdl_pc = 47;
                        continue;
                    },
                }
            },
            43 => {
                SDL_SendJoystickPowerInfo(joystick, state, percent);
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            44 => {
                state = SDL_POWERSTATE_ON_BATTERY;
                percent = level;
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            45 => {
                state = SDL_POWERSTATE_CHARGING;
                percent = level;
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            46 => {
                state = SDL_POWERSTATE_CHARGED;
                percent = 100;
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            47 => {
                state = SDL_POWERSTATE_UNKNOWN;
                percent = 0;
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            48 => {
                sensors = @ptrCast(@alignCast(&data[@as(c_int, 15)]));
                if (ctx.*.sensor_timestamp_supported) {
                    sdl_pc = 51;
                    continue;
                } else {
                    sdl_pc = 52;
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
                _ = memcpy(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.last_state))))), @ptrCast(@alignCast(data)), if (@as(c_ulong, @bitCast(@as(c_long, size))) < @sizeOf(@TypeOf(ctx.*.last_state))) @as(c_ulong, @bitCast(@as(c_long, size))) else @sizeOf(@TypeOf(ctx.*.last_state)));
                {}
            },
            51 => {
                tick = (((@as(Uint32, data[@as(c_int, 27)]) << @intCast(@as(Uint32, 0))) | (@as(Uint32, data[@as(c_int, 28)]) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, data[@as(c_int, 29)]) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, data[@as(c_int, 30)]) << @intCast(@as(Uint32, 24)));
                if (ctx.*.last_tick != 0) {
                    sdl_pc = 54;
                    continue;
                } else {
                    sdl_pc = 55;
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
                sensor_timestamp = ctx.*.sensor_timestamp;
                ctx.*.sensor_timestamp +%= ctx.*.sensor_timestamp_interval;
                values[@as(c_int, 0)] = @as(f32, @floatFromInt(-@as(c_int, sensors.*.sGyroY))) * ctx.*.gyroScale;
                values[@as(c_int, 1)] = @as(f32, @floatFromInt(@as(c_int, sensors.*.sGyroZ))) * ctx.*.gyroScale;
                values[@as(c_int, 2)] = @as(f32, @floatFromInt(-@as(c_int, sensors.*.sGyroX))) * ctx.*.gyroScale;
                SDL_SendJoystickSensor(timestamp, joystick, SDL_SENSOR_GYRO, sensor_timestamp, @ptrCast(@alignCast(&values)), 3);
                values[@as(c_int, 0)] = @as(f32, @floatFromInt(-@as(c_int, sensors.*.sAccelY))) * ctx.*.accelScale;
                values[@as(c_int, 1)] = @as(f32, @floatFromInt(@as(c_int, sensors.*.sAccelZ))) * ctx.*.accelScale;
                values[@as(c_int, 2)] = @as(f32, @floatFromInt(-@as(c_int, sensors.*.sAccelX))) * ctx.*.accelScale;
                SDL_SendJoystickSensor(timestamp, joystick, SDL_SENSOR_ACCEL, sensor_timestamp, @ptrCast(@alignCast(&values)), 3);
                {
                    sdl_pc = 50;
                    continue;
                }
            },
            54 => {
                if (ctx.*.last_tick <= tick) {
                    sdl_pc = 57;
                    continue;
                } else {
                    sdl_pc = 58;
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
                ctx.*.last_tick = tick;
                {
                    sdl_pc = 53;
                    continue;
                }
            },
            57 => {
                delta = tick -% ctx.*.last_tick;
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            58 => {
                delta = ((@as(c_uint, 4294967295) -% ctx.*.last_tick) +% tick) +% @as(Uint32, 1);
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            59 => {
                if (delta < @as(Uint32, 100000)) {
                    sdl_pc = 60;
                    continue;
                } else {
                    sdl_pc = 61;
                    continue;
                }
            },
            60 => {
                ctx.*.sensor_timestamp_interval = @as(Uint64, delta) *% @as(Uint64, SDL_NS_PER_US);
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
                    sdl_pc = 56;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_Driver8BitDo_UpdateDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_Driver8BitDo_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    var joystick: [*c]SDL_Joystick = null;
    _ = &joystick;
    var data: [64]Uint8 = undefined;
    _ = &data;
    var size: c_int = 0;
    _ = &size;
    if (device.*.num_joysticks > @as(c_int, 0)) {
        joystick = SDL_GetJoystickFromID_REAL(device.*.joysticks[@as(c_int, 0)]);
    } else {
        return @"false" != 0;
    }
    while ((blk: {
        const tmp = SDL_hid_read_timeout_REAL(device.*.dev, @ptrCast(@alignCast(&data)), @sizeOf(@TypeOf(data)), 0);
        size = tmp;
        break :blk tmp;
    }) > @as(c_int, 0)) {
        if (!(joystick != null)) {
            continue;
        }
        if (size == @as(c_int, 9)) {
            HIDAPI_Driver8BitDo_HandleOldStatePacket(joystick, ctx, @ptrCast(@alignCast(&data)), size);
        } else {
            HIDAPI_Driver8BitDo_HandleStatePacket(joystick, ctx, @ptrCast(@alignCast(&data)), size);
        }
    }
    if (size < @as(c_int, 0)) {
        HIDAPI_JoystickDisconnected(device, device.*.joysticks[@as(c_int, 0)]);
    }
    return size >= @as(c_int, 0);
}
pub fn HIDAPI_Driver8BitDo_CloseJoystick(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn HIDAPI_Driver8BitDo_FreeDevice(_: [*c]SDL_HIDAPI_Device) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub export var SDL_HIDAPI_Driver8BitDo: SDL_HIDAPI_DeviceDriver = SDL_HIDAPI_DeviceDriver{
    .name = "SDL_JOYSTICK_HIDAPI_8BITDO",
    .enabled = @"true" != 0,
    .RegisterHints = HIDAPI_Driver8BitDo_RegisterHints,
    .UnregisterHints = HIDAPI_Driver8BitDo_UnregisterHints,
    .IsEnabled = HIDAPI_Driver8BitDo_IsEnabled,
    .IsSupportedDevice = HIDAPI_Driver8BitDo_IsSupportedDevice,
    .InitDevice = HIDAPI_Driver8BitDo_InitDevice,
    .GetDevicePlayerIndex = HIDAPI_Driver8BitDo_GetDevicePlayerIndex,
    .SetDevicePlayerIndex = HIDAPI_Driver8BitDo_SetDevicePlayerIndex,
    .UpdateDevice = HIDAPI_Driver8BitDo_UpdateDevice,
    .OpenJoystick = HIDAPI_Driver8BitDo_OpenJoystick,
    .RumbleJoystick = HIDAPI_Driver8BitDo_RumbleJoystick,
    .RumbleJoystickTriggers = HIDAPI_Driver8BitDo_RumbleJoystickTriggers,
    .GetJoystickCapabilities = HIDAPI_Driver8BitDo_GetJoystickCapabilities,
    .SetJoystickLED = HIDAPI_Driver8BitDo_SetJoystickLED,
    .SendJoystickEffect = HIDAPI_Driver8BitDo_SendJoystickEffect,
    .SetJoystickSensorsEnabled = HIDAPI_Driver8BitDo_SetJoystickSensorsEnabled,
    .CloseJoystick = HIDAPI_Driver8BitDo_CloseJoystick,
    .FreeDevice = HIDAPI_Driver8BitDo_FreeDevice,
};

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_PI_F = @as(f32, 3.141592653589793238462643383279502884);
pub const SDL_STANDARD_GRAVITY = @as(f32, 9.80665);
pub const SDL_HAT_CENTERED = @as(c_uint, 0x00);
pub const SDL_HAT_UP = @as(c_uint, 0x01);
pub const SDL_HAT_RIGHT = @as(c_uint, 0x02);
pub const SDL_HAT_DOWN = @as(c_uint, 0x04);
pub const SDL_HAT_LEFT = @as(c_uint, 0x08);
pub const SDL_NS_PER_SECOND = @as(c_longlong, 1000000000);
pub const SDL_NS_PER_US = @as(c_int, 1000);
pub const USB_VENDOR_8BITDO = @as(c_int, 0x2dc8);
pub const USB_PRODUCT_8BITDO_SF30_PRO = @as(c_int, 0x6000);
pub const USB_PRODUCT_8BITDO_SF30_PRO_BT = @as(c_int, 0x6100);
pub const USB_PRODUCT_8BITDO_SN30_PRO = @as(c_int, 0x6001);
pub const USB_PRODUCT_8BITDO_SN30_PRO_BT = @as(c_int, 0x6101);
pub const USB_PRODUCT_8BITDO_PRO_2 = @as(c_int, 0x6003);
pub const USB_PRODUCT_8BITDO_PRO_2_BT = @as(c_int, 0x6006);
pub const USB_PRODUCT_8BITDO_PRO_3 = @as(c_int, 0x6009);
pub const USB_PRODUCT_8BITDO_ULTIMATE2_WIRELESS = @as(c_int, 0x6012);
pub const USB_PRODUCT_8BITDO_ULTIMATE2C_WIRELESS = @as(c_int, 0x301b);
pub const USB_PRODUCT_8BITDO_ULTIMATE3 = @as(c_int, 0x202f);
pub const SDL_JOYSTICK_CAP_RGB_LED = @as(c_int, 0x00000002);
pub const SDL_JOYSTICK_CAP_RUMBLE = @as(c_int, 0x00000010);
pub const SDL_8BITDO_FEATURE_REPORTID = @as(c_int, 0x30);
pub const SDL_8BITDO_FEATURE_REPORTID_ENABLE_SDL_REPORTID = @as(c_int, 0x06);
pub const SDL_8BITDO_REPORTID_SDL_REPORTID = @as(c_int, 0x04);
pub const SDL_8BITDO_REPORTID_NOT_SUPPORTED_SDL_REPORTID = @as(c_int, 0x03);
pub const SDL_8BITDO_BT_REPORTID_SDL_REPORTID = @as(c_int, 0x01);
pub const SDL_8BITDO_SENSOR_TIMESTAMP_ENABLE = @as(c_int, 0xAA);
pub const ABITDO_ACCEL_SCALE = @as(f32, 4096.0);
pub const ABITDO_GYRO_MAX_DEGREES_PER_SECOND = @as(f32, 2000.0);
pub inline fn DEG2RAD(x: anytype) @TypeOf(__helpers.cast(f32, x) * __helpers.cast(f32, __helpers.div(SDL_PI_F, @as(f32, 180.0)))) {
    @setEvalBranchQuota(100000);
    _ = &x;
    return __helpers.cast(f32, x) * __helpers.cast(f32, __helpers.div(SDL_PI_F, @as(f32, 180.0)));
}
