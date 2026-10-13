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
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Sint16 = i16;
pub const Uint16 = u16;
pub const Uint32 = u32;
pub const Uint64 = u64;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_strchr_REAL(str: [*c]const u8, c: c_int) [*c]u8;
pub extern fn SDL_atof_REAL(str: [*c]const u8) f64;
pub extern fn SDL_cosf_REAL(x: f32) f32;
pub extern fn SDL_sinf_REAL(x: f32) f32;
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
pub const SDL_JOYSTICK_CONNECTION_WIRELESS: c_int = 2;
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
pub extern fn SDL_hid_read_REAL(dev: ?*SDL_hid_device, data: [*c]u8, length: usize) c_int;
pub extern fn SDL_hid_send_feature_report_REAL(dev: ?*SDL_hid_device, data: [*c]const u8, length: usize) c_int;
pub extern fn SDL_hid_get_feature_report_REAL(dev: ?*SDL_hid_device, data: [*c]u8, length: usize) c_int;
pub extern fn SDL_GetHintBoolean_REAL(name: [*c]const u8, default_value: bool) bool;
pub const SDL_HintCallback = ?*const fn (userdata: ?*anyopaque, name: [*c]const u8, oldValue: [*c]const u8, newValue: [*c]const u8) callconv(.c) void;
pub extern fn SDL_AddHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) bool;
pub extern fn SDL_RemoveHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) void;
pub extern fn SDL_Log_REAL(fmt: [*c]const u8, ...) void;
pub extern fn SDL_GetTicks_REAL() Uint64;
pub extern fn SDL_GetTicksNS_REAL() Uint64;
pub extern fn SDL_Delay_REAL(ms: Uint32) void;
pub extern fn SDL_DelayNS_REAL(ns: Uint64) void;
pub extern fn SDL_GetStringBoolean(value: [*c]const u8, default_value: bool) bool;
pub extern fn SDL_AssertJoysticksLocked() void;
pub extern fn SDL_IsJoystickSteamController(vendor_id: Uint16, product_id: Uint16) bool;
pub extern fn SDL_PrivateJoystickAddTouchpad(joystick: [*c]SDL_Joystick, nfingers: c_int) void;
pub extern fn SDL_PrivateJoystickAddSensor(joystick: [*c]SDL_Joystick, @"type": SDL_SensorType, rate: f32) void;
pub extern fn SDL_SendJoystickAxis(timestamp: Uint64, joystick: [*c]SDL_Joystick, axis: Uint8, value: Sint16) void;
pub extern fn SDL_SendJoystickHat(timestamp: Uint64, joystick: [*c]SDL_Joystick, hat: Uint8, value: Uint8) void;
pub extern fn SDL_SendJoystickButton(timestamp: Uint64, joystick: [*c]SDL_Joystick, button: Uint8, down: bool) void;
pub extern fn SDL_SendJoystickTouchpad(timestamp: Uint64, joystick: [*c]SDL_Joystick, touchpad: c_int, finger: c_int, down: bool, x: f32, y: f32, pressure: f32) void;
pub extern fn SDL_SendJoystickSensor(timestamp: Uint64, joystick: [*c]SDL_Joystick, @"type": SDL_SensorType, sensor_timestamp: Uint64, data: [*c]const f32, num_values: c_int) void;
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
pub extern fn HIDAPI_JoystickConnected(device: [*c]SDL_HIDAPI_Device, pJoystickID: [*c]SDL_JoystickID) bool;
pub extern fn HIDAPI_JoystickDisconnected(device: [*c]SDL_HIDAPI_Device, joystickID: SDL_JoystickID) void;
pub extern fn HIDAPI_DumpPacket(prefix: [*c]const u8, data: [*c]const Uint8, size: c_int) void;
pub const FeatureReportHeader = extern struct {
    type: u8 = 0,
    length: u8 = 0,
};
pub const ControllerSetting = extern struct {
    settingNum: u8 align(1) = 0,
    settingValue: c_ushort align(1) = 0,
};
pub const ControllerAttribute = extern struct {
    attributeTag: u8 align(1) = 0,
    attributeValue: u32 align(1) = 0,
};
pub const MsgSetSettingsValues = extern struct {
    settings: [20]ControllerSetting = @import("std").mem.zeroes([20]ControllerSetting),
};
pub const MsgGetSettingsValues = MsgSetSettingsValues;
pub const MsgGetSettingsDefaults = MsgSetSettingsValues;
pub const MsgGetSettingsMaxs = MsgSetSettingsValues;
pub const MsgGetAttributes = extern struct {
    attributes: [12]ControllerAttribute = @import("std").mem.zeroes([12]ControllerAttribute),
};
pub const MsgGetStringAttribute = extern struct {
    attributeTag: u8 = 0,
    attributeValue: [20]u8 = @import("std").mem.zeroes([20]u8),
};
pub const MsgSetControllerMode = extern struct {
    mode: u8 = 0,
};
pub const MsgFireHapticPulse = extern struct {
    which_pad: u8 align(1) = 0,
    pulse_duration: c_ushort align(1) = 0,
    pulse_interval: c_ushort align(1) = 0,
    pulse_count: c_ushort align(1) = 0,
    dBgain: c_short align(1) = 0,
    priority: u8 = 0,
};
pub const MsgHapticSetMode = extern struct {
    mode: u8 = 0,
};
pub const MsgTriggerHaptic = extern struct {
    side: u8 align(1) = 0,
    cmd: u8 = 0,
    ui_intensity: u8 = 0,
    dBgain: i8 = 0,
    freq: u16 align(1) = 0,
    dur_ms: i16 align(1) = 0,
    noise_intensity: u16 align(1) = 0,
    lfo_freq: u16 align(1) = 0,
    lfo_depth: u8 = 0,
    rand_tone_gain: u8 = 0,
    script_id: u8 = 0,
    lss_start_freq: u16 align(1) = 0,
    lss_end_freq: u16 align(1) = 0,
};
pub const MsgSimpleRumbleCmd = extern struct {
    unRumbleType: u8 align(1) = 0,
    unIntensity: u16 align(1) = 0,
    unLeftMotorSpeed: u16 align(1) = 0,
    unRightMotorSpeed: u16 align(1) = 0,
    nLeftGain: i8 = 0,
    nRightGain: i8 = 0,
};
const union_unnamed_20 = extern union {
    setSettingsValues: MsgSetSettingsValues,
    getSettingsValues: MsgGetSettingsValues,
    getSettingsMaxs: MsgGetSettingsMaxs,
    getSettingsDefaults: MsgGetSettingsDefaults,
    getAttributes: MsgGetAttributes,
    controllerMode: MsgSetControllerMode,
    fireHapticPulse: MsgFireHapticPulse,
    getStringAttribute: MsgGetStringAttribute,
    hapticMode: MsgHapticSetMode,
    triggerHaptic: MsgTriggerHaptic,
    simpleRumble: MsgSimpleRumbleCmd,
};
pub const FeatureReportMsg = extern struct {
    header: FeatureReportHeader = @import("std").mem.zeroes(FeatureReportHeader),
    payload: union_unnamed_20 = @import("std").mem.zeroes(union_unnamed_20),
};
pub const ID_CONTROLLER_STATE: c_int = 1;
pub const ID_CONTROLLER_BLE_STATE: c_int = 7;
pub const ValveInReportHeader_t = extern struct {
    unReportVersion: c_ushort align(1) = 0,
    ucType: u8 = 0,
    ucLength: u8 = 0,
};
const struct_unnamed_25 = extern struct {
    _pad0: [3]u8 = @import("std").mem.zeroes([3]u8),
    nLeft: u8 = 0,
    nRight: u8 = 0,
    _pad1: [3]u8 = @import("std").mem.zeroes([3]u8),
};
const union_unnamed_24 = extern union {
    ulButtons: Uint64 align(1),
    Triggers: struct_unnamed_25 align(1),
};
pub const ValveControllerStatePacket_t = extern struct {
    unPacketNum: Uint32 align(1) = 0,
    ButtonTriggerData: union_unnamed_24 = @import("std").mem.zeroes(union_unnamed_24),
    sLeftPadX: c_short align(1) = 0,
    sLeftPadY: c_short align(1) = 0,
    sRightPadX: c_short align(1) = 0,
    sRightPadY: c_short align(1) = 0,
    sTriggerL: c_ushort align(1) = 0,
    sTriggerR: c_ushort align(1) = 0,
    sAccelX: c_short align(1) = 0,
    sAccelY: c_short align(1) = 0,
    sAccelZ: c_short align(1) = 0,
    sGyroX: c_short align(1) = 0,
    sGyroY: c_short align(1) = 0,
    sGyroZ: c_short align(1) = 0,
    sGyroQuatW: c_short align(1) = 0,
    sGyroQuatX: c_short align(1) = 0,
    sGyroQuatY: c_short align(1) = 0,
    sGyroQuatZ: c_short align(1) = 0,
};
const struct_unnamed_27 = extern struct {
    _pad0: [3]u8 = @import("std").mem.zeroes([3]u8),
    nLeft: u8 = 0,
    nRight: u8 = 0,
    _pad1: [3]u8 = @import("std").mem.zeroes([3]u8),
};
const union_unnamed_26 = extern union {
    ulButtons: Uint64 align(1),
    Triggers: struct_unnamed_27 align(1),
};
pub const ValveControllerBLEStatePacket_t = extern struct {
    unPacketNum: Uint32 align(1) = 0,
    ButtonTriggerData: union_unnamed_26 = @import("std").mem.zeroes(union_unnamed_26),
    sLeftPadX: c_short align(1) = 0,
    sLeftPadY: c_short align(1) = 0,
    sRightPadX: c_short align(1) = 0,
    sRightPadY: c_short align(1) = 0,
    ucGyroDataType: u8 = 0,
    sGyro: [4]c_short align(1) = @import("std").mem.zeroes([4]c_short),
};
pub const ValveControllerDebugPacket_t = extern struct {
    sLeftPadX: c_short align(1) = 0,
    sLeftPadY: c_short align(1) = 0,
    sRightPadX: c_short align(1) = 0,
    sRightPadY: c_short align(1) = 0,
    sLeftPadMouseDX: c_short align(1) = 0,
    sLeftPadMouseDY: c_short align(1) = 0,
    sRightPadMouseDX: c_short align(1) = 0,
    sRightPadMouseDY: c_short align(1) = 0,
    sLeftPadMouseFilteredDX: c_short align(1) = 0,
    sLeftPadMouseFilteredDY: c_short align(1) = 0,
    sRightPadMouseFilteredDX: c_short align(1) = 0,
    sRightPadMouseFilteredDY: c_short align(1) = 0,
    ucLeftZ: u8 = 0,
    ucRightZ: u8 = 0,
    ucLeftFingerPresent: u8 = 0,
    ucRightFingerPresent: u8 = 0,
    ucLeftTimestamp: u8 = 0,
    ucRightTimestamp: u8 = 0,
    ucLeftTapState: u8 = 0,
    ucRightTapState: u8 = 0,
    unDigitalIOStates0: c_uint align(1) = 0,
    unDigitalIOStates1: c_uint align(1) = 0,
};
pub const ValveControllerTrackpadImage_t = extern struct {
    ucPadNum: u8 align(1) = 0,
    ucPad: [3]u8 = @import("std").mem.zeroes([3]u8),
    Data: [20]c_short align(1) = @import("std").mem.zeroes([20]c_short),
    unNoise: c_ushort align(1) = 0,
};
pub const ValveControllerRawTrackpadImage_t = extern struct {
    ucPadNum: u8 align(1) = 0,
    ucOffset: u8 = 0,
    ucPad: [2]u8 = @import("std").mem.zeroes([2]u8),
    rgData: [28]c_short align(1) = @import("std").mem.zeroes([28]c_short),
};
pub const SteamControllerWirelessEvent_t = extern struct {
    ucEventType: u8 = 0,
};
pub const SteamControllerStatusEvent_t = extern struct {
    unPacketNum: c_uint align(1) = 0,
    sEventCode: c_ushort align(1) = 0,
    unStateFlags: c_ushort align(1) = 0,
    sBatteryVoltage: c_ushort align(1) = 0,
    ucBatteryLevel: u8 = 0,
};
const struct_unnamed_29 = extern struct {
    ulButtonsL: Uint32 align(1) = 0,
    ulButtonsH: Uint32 align(1) = 0,
};
const union_unnamed_28 = extern union {
    ulButtons: Uint64 align(1),
    unnamed_0: struct_unnamed_29 align(1),
};
pub const SteamDeckStatePacket_t = extern struct {
    unPacketNum: Uint32 align(1) = 0,
    unnamed_0: union_unnamed_28 = @import("std").mem.zeroes(union_unnamed_28),
    sLeftPadX: c_short align(1) = 0,
    sLeftPadY: c_short align(1) = 0,
    sRightPadX: c_short align(1) = 0,
    sRightPadY: c_short align(1) = 0,
    sAccelX: c_short align(1) = 0,
    sAccelY: c_short align(1) = 0,
    sAccelZ: c_short align(1) = 0,
    sGyroX: c_short align(1) = 0,
    sGyroY: c_short align(1) = 0,
    sGyroZ: c_short align(1) = 0,
    sGyroQuatW: c_short align(1) = 0,
    sGyroQuatX: c_short align(1) = 0,
    sGyroQuatY: c_short align(1) = 0,
    sGyroQuatZ: c_short align(1) = 0,
    sTriggerRawL: c_ushort align(1) = 0,
    sTriggerRawR: c_ushort align(1) = 0,
    sLeftStickX: c_short align(1) = 0,
    sLeftStickY: c_short align(1) = 0,
    sRightStickX: c_short align(1) = 0,
    sRightStickY: c_short align(1) = 0,
    sPressurePadLeft: c_ushort align(1) = 0,
    sPressurePadRight: c_ushort align(1) = 0,
};
const union_unnamed_30 = extern union {
    controllerState: ValveControllerStatePacket_t,
    controllerBLEState: ValveControllerBLEStatePacket_t,
    debugState: ValveControllerDebugPacket_t,
    padImage: ValveControllerTrackpadImage_t,
    rawPadImage: ValveControllerRawTrackpadImage_t,
    wirelessEvent: SteamControllerWirelessEvent_t,
    statusEvent: SteamControllerStatusEvent_t,
    deckState: SteamDeckStatePacket_t,
};
pub const ValveInReport_t = extern struct {
    header: ValveInReportHeader_t = @import("std").mem.zeroes(ValveInReportHeader_t),
    payload: union_unnamed_30 = @import("std").mem.zeroes(union_unnamed_30),
};
pub const k_EBLEReportState: c_int = 4;
pub const k_EBLEButtonChunk1: c_int = 16;
pub const k_EBLEButtonChunk2: c_int = 32;
pub const k_EBLEButtonChunk3: c_int = 64;
pub const k_EBLELeftJoystickChunk: c_int = 128;
pub const k_EBLELeftTrackpadChunk: c_int = 256;
pub const k_EBLERightTrackpadChunk: c_int = 512;
pub const k_EBLEIMUAccelChunk: c_int = 1024;
pub const k_EBLEIMUGyroChunk: c_int = 2048;
pub const k_EBLEIMUQuatChunk: c_int = 4096;
pub const ID_CLEAR_DIGITAL_MAPPINGS: c_int = 129;
pub const ID_GET_ATTRIBUTES_VALUES: c_int = 131;
pub const ID_SET_DEFAULT_DIGITAL_MAPPINGS: c_int = 133;
pub const ID_SET_SETTINGS_VALUES: c_int = 135;
pub const ID_LOAD_DEFAULT_SETTINGS: c_int = 142;
pub const ID_ENABLE_PAIRING: c_int = 173;
pub const ID_DONGLE_COMMIT_DEVICE: c_int = 179;
pub const ID_DONGLE_GET_WIRELESS_STATE: c_int = 180;
pub const ATTRIB_UNIQUE_ID: c_int = 0;
pub const ATTRIB_PRODUCT_ID: c_int = 1;
pub const ATTRIB_CAPABILITIES: c_int = 2;
pub const ATTRIB_CONNECTION_INTERVAL_IN_US: c_int = 11;
pub const TRACKPAD_ABSOLUTE_MOUSE: c_int = 0;
pub const TRACKPAD_NONE: c_int = 7;
pub const SETTING_LEFT_TRACKPAD_MODE: c_int = 7;
pub const SETTING_RIGHT_TRACKPAD_MODE: c_int = 8;
pub const SETTING_SMOOTH_ABSOLUTE_MOUSE: c_int = 24;
pub const SETTING_LED_USER_BRIGHTNESS: c_int = 45;
pub const SETTING_IMU_MODE: c_int = 48;
pub const SETTING_WIRELESS_PACKET_VERSION: c_int = 49;
pub const SETTING_GYRO_MODE_OFF: c_int = 0;
pub const SETTING_GYRO_MODE_SEND_RAW_ACCEL: c_int = 8;
pub const SETTING_GYRO_MODE_SEND_RAW_GYRO: c_int = 16;
pub const SDL_GAMEPAD_BUTTON_STEAM_RIGHT_PADDLE: c_int = 11;
pub const SDL_GAMEPAD_BUTTON_STEAM_LEFT_PADDLE: c_int = 12;
pub const SDL_GAMEPAD_NUM_STEAM_BUTTONS: c_int = 13;
pub const struct_SteamControllerStateInternal_t = extern struct {
    eControllerType: Uint32 = 0,
    unPacketNum: Uint32 = 0,
    ulButtons: Uint64 = 0,
    sLeftPadX: c_short = 0,
    sLeftPadY: c_short = 0,
    sRightPadX: c_short = 0,
    sRightPadY: c_short = 0,
    sLeftStickX: c_short = 0,
    sLeftStickY: c_short = 0,
    sTriggerL: c_ushort = 0,
    sTriggerR: c_ushort = 0,
    sAccelX: c_short = 0,
    sAccelY: c_short = 0,
    sAccelZ: c_short = 0,
    sGyroX: c_short = 0,
    sGyroY: c_short = 0,
    sGyroZ: c_short = 0,
    sGyroQuatW: f32 = 0,
    sGyroQuatX: f32 = 0,
    sGyroQuatY: f32 = 0,
    sGyroQuatZ: f32 = 0,
    sGyroSteeringAngle: c_short = 0,
    sBatteryLevel: c_ushort = 0,
    sPressurePadLeft: c_ushort = 0,
    sPressurePadRight: c_ushort = 0,
    sPressureBumperLeft: c_ushort = 0,
    sPressureBumperRight: c_ushort = 0,
    sPrevLeftPad: [2]c_short = @import("std").mem.zeroes([2]c_short),
    sPrevLeftStick: [2]c_short = @import("std").mem.zeroes([2]c_short),
};
pub const SteamControllerStateInternal_t = struct_SteamControllerStateInternal_t;
pub const SteamControllerPacketAssembler = extern struct {
    uBuffer: [145]u8 = @import("std").mem.zeroes([145]u8),
    nExpectedSegmentNumber: c_int = 0,
    bIsBle: bool = false,
};
pub fn GetSegmentHeader(nSegmentNumber: c_int, bLastPacket: bool) callconv(.c) u8 {
    @setEvalBranchQuota(100000);
    var header: u8 = REPORT_SEGMENT_DATA_FLAG;
    _ = &header;
    {
        const ref = &header;
        ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | nSegmentNumber)));
    }
    if (bLastPacket) {
        {
            const ref = &header;
            ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | REPORT_SEGMENT_LAST_FLAG)));
        }
    }
    return header;
}
pub fn hexdump(ptr: [*c]const u8, len: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    HIDAPI_DumpPacket("Data", ptr, len);
}
pub fn ResetSteamControllerPacketAssembler(pAssembler: [*c]SteamControllerPacketAssembler) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = memset(@ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&pAssembler.*.uBuffer))))), 0, @sizeOf(@TypeOf(pAssembler.*.uBuffer)));
    pAssembler.*.nExpectedSegmentNumber = 0;
}
pub fn InitializeSteamControllerPacketAssembler(pAssembler: [*c]SteamControllerPacketAssembler, bIsBle: bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    pAssembler.*.bIsBle = bIsBle;
    ResetSteamControllerPacketAssembler(pAssembler);
}
pub fn WriteSegmentToSteamControllerPacketAssembler(pAssembler: [*c]SteamControllerPacketAssembler, pSegment: [*c]const u8, nSegmentLength: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    if (pAssembler.*.bIsBle) {
        var uSegmentHeader: u8 = pSegment[@as(c_int, 1)];
        _ = &uSegmentHeader;
        var nSegmentNumber: c_int = @as(c_int, uSegmentHeader) & @as(c_int, 7);
        _ = &nSegmentNumber;
        if (@as(c_int, pSegment[@as(c_int, 0)]) != BLE_REPORT_NUMBER) {
            return 0;
        }
        if (nSegmentLength != (MAX_REPORT_SEGMENT_PAYLOAD_SIZE + @as(c_int, 2))) {
            SDL_Log_REAL("Bad segment size! %d", nSegmentLength);
            hexdump(pSegment, nSegmentLength);
            ResetSteamControllerPacketAssembler(pAssembler);
            return -@as(c_int, 1);
        }
        if (!((@as(c_int, uSegmentHeader) & REPORT_SEGMENT_DATA_FLAG) != 0)) {
            return 0;
        }
        if (nSegmentNumber != pAssembler.*.nExpectedSegmentNumber) {
            ResetSteamControllerPacketAssembler(pAssembler);
            if (nSegmentNumber != 0) {
                return -@as(c_int, 1);
            }
        }
        _ = memcpy(@ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&pAssembler.*.uBuffer))) + @as(usize, @bitCast(@as(isize, @intCast(nSegmentNumber * MAX_REPORT_SEGMENT_PAYLOAD_SIZE)))))), @ptrCast(@alignCast(pSegment + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))), MAX_REPORT_SEGMENT_PAYLOAD_SIZE);
        if ((@as(c_int, uSegmentHeader) & REPORT_SEGMENT_LAST_FLAG) != 0) {
            pAssembler.*.nExpectedSegmentNumber = 0;
            return (nSegmentNumber + @as(c_int, 1)) * MAX_REPORT_SEGMENT_PAYLOAD_SIZE;
        }
        pAssembler.*.nExpectedSegmentNumber += 1;
    } else {
        _ = memcpy(@ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&pAssembler.*.uBuffer))))), @ptrCast(@alignCast(pSegment)), @bitCast(@as(c_long, nSegmentLength)));
        return nSegmentLength;
    }
    return 0;
}
pub fn SetFeatureReport(dev: [*c]SDL_HIDAPI_Device, uBuffer: [*c]const u8, arg_nActualDataLen: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var nActualDataLen = arg_nActualDataLen;
    _ = &nActualDataLen;
    var nRet: c_int = -@as(c_int, 1);
    _ = &nRet;
    if (dev.*.is_bluetooth) {
        var nSegmentNumber: c_int = 0;
        _ = &nSegmentNumber;
        var uPacketBuffer: [20]u8 = undefined;
        _ = &uPacketBuffer;
        var pBufferPtr: [*c]const u8 = uBuffer + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
        _ = &pBufferPtr;
        if (nActualDataLen < @as(c_int, 1)) {
            return -@as(c_int, 1);
        }
        nActualDataLen -= 1;
        while (nActualDataLen > @as(c_int, 0)) {
            var nBytesInPacket: c_int = if (nActualDataLen > MAX_REPORT_SEGMENT_PAYLOAD_SIZE) MAX_REPORT_SEGMENT_PAYLOAD_SIZE else nActualDataLen;
            _ = &nBytesInPacket;
            nActualDataLen -= nBytesInPacket;
            _ = memset(@ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&uPacketBuffer))))), 0, @sizeOf(@TypeOf(uPacketBuffer)));
            uPacketBuffer[@as(c_int, 0)] = BLE_REPORT_NUMBER;
            uPacketBuffer[@as(c_int, 1)] = GetSegmentHeader(nSegmentNumber, nActualDataLen == @as(c_int, 0));
            _ = memcpy(@ptrCast(@alignCast(&uPacketBuffer[@as(c_int, 2)])), @ptrCast(@alignCast(pBufferPtr)), @bitCast(@as(c_long, nBytesInPacket)));
            pBufferPtr += @as(usize, @bitCast(@as(isize, @intCast(nBytesInPacket))));
            nSegmentNumber += 1;
            nRet = SDL_hid_send_feature_report_REAL(dev.*.dev, @ptrCast(@alignCast(&uPacketBuffer)), @sizeOf(@TypeOf(uPacketBuffer)));
        }
    } else {
        {
            var nRetries: c_int = 0;
            _ = &nRetries;
            while (nRetries < RADIO_WORKAROUND_SLEEP_ATTEMPTS) : (nRetries += 1) {
                nRet = SDL_hid_send_feature_report_REAL(dev.*.dev, uBuffer, 65);
                if (nRet >= @as(c_int, 0)) {
                    break;
                }
                SDL_DelayNS_REAL(@bitCast(@as(c_long, RADIO_WORKAROUND_SLEEP_DURATION_US * @as(c_int, 1000))));
            }
        }
    }
    return nRet;
}
pub fn GetFeatureReport(dev: [*c]SDL_HIDAPI_Device, uBuffer: [*c]u8) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var nRet: c_int = -@as(c_int, 1);
    _ = &nRet;
    if (dev.*.is_bluetooth) {
        var nRetries: c_int = 0;
        _ = &nRetries;
        var uSegmentBuffer: [21]u8 = undefined;
        _ = &uSegmentBuffer;
        var ucBytesToRead: u8 = @bitCast(@as(i8, @truncate(MAX_REPORT_SEGMENT_PAYLOAD_SIZE + @as(c_int, 2))));
        _ = &ucBytesToRead;
        var ucDataStartOffset: u8 = 0;
        _ = &ucDataStartOffset;
        var assembler: SteamControllerPacketAssembler = undefined;
        _ = &assembler;
        InitializeSteamControllerPacketAssembler(&assembler, dev.*.is_bluetooth);
        while (nRetries < BLE_MAX_READ_RETRIES) {
            _ = memset(@ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&uSegmentBuffer))))), 0, @sizeOf(@TypeOf(uSegmentBuffer)));
            uSegmentBuffer[@as(c_int, 0)] = BLE_REPORT_NUMBER;
            nRet = SDL_hid_get_feature_report_REAL(dev.*.dev, @ptrCast(@alignCast(&uSegmentBuffer)), ucBytesToRead);
            if ((nRet > @as(c_int, 2)) and ((@as(c_int, uSegmentBuffer[@bitCast(@as(isize, @intCast(@as(c_int, ucDataStartOffset) + @as(c_int, 1))))]) & REPORT_SEGMENT_DATA_FLAG) != 0)) {
                nRetries = 0;
            } else {
                nRetries += 1;
            }
            if (nRet > @as(c_int, 0)) {
                var nPacketLength: c_int = WriteSegmentToSteamControllerPacketAssembler(&assembler, @as([*c]u8, @ptrCast(@alignCast(&uSegmentBuffer))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, ucDataStartOffset))))), nRet - @as(c_int, ucDataStartOffset));
                _ = &nPacketLength;
                if ((nPacketLength > @as(c_int, 0)) and (nPacketLength < @as(c_int, 65))) {
                    uBuffer[@as(c_int, 0)] = 0;
                    _ = memcpy(@ptrCast(@alignCast(uBuffer + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1))))))), @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&assembler.uBuffer))))), @bitCast(@as(c_long, nPacketLength)));
                    return nPacketLength;
                }
            }
        }
        SDL_Log_REAL("Could not get a full ble packet after %d retries", nRetries);
        return -@as(c_int, 1);
    } else {
        _ = memset(@ptrCast(@alignCast(uBuffer)), 0, 65);
        {
            var nRetries: c_int = 0;
            _ = &nRetries;
            while (nRetries < RADIO_WORKAROUND_SLEEP_ATTEMPTS) : (nRetries += 1) {
                nRet = SDL_hid_get_feature_report_REAL(dev.*.dev, uBuffer, 65);
                if (nRet >= @as(c_int, 0)) {
                    break;
                }
                SDL_DelayNS_REAL(@bitCast(@as(c_long, RADIO_WORKAROUND_SLEEP_DURATION_US * @as(c_int, 1000))));
            }
        }
    }
    return nRet;
}
pub fn ReadResponse(dev: [*c]SDL_HIDAPI_Device, uBuffer: [*c]u8, nExpectedResponse: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    {
        var nRetries: c_int = 0;
        _ = &nRetries;
        while (nRetries < @as(c_int, 10)) : (nRetries += 1) {
            var nRet: c_int = GetFeatureReport(dev, uBuffer);
            _ = &nRet;
            if (nRet < @as(c_int, 0)) {
                continue;
            }
            if (@as(c_int, uBuffer[@as(c_int, 1)]) != nExpectedResponse) {
                continue;
            }
            return nRet;
        }
    }
    return -@as(c_int, 1);
}
pub fn ResetSteamController(dev: [*c]SDL_HIDAPI_Device, bSuppressErrorSpew: bool, punUpdateRateUS: [*c]u32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var buf: [65]u8 = undefined;
    _ = &buf;
    var i: c_uint = undefined;
    _ = &i;
    var res: c_int = undefined;
    _ = &res;
    var nSettings: c_int = undefined;
    _ = &nSettings;
    var nAttributesLength: c_int = undefined;
    _ = &nAttributesLength;
    var msg: [*c]FeatureReportMsg = undefined;
    _ = &msg;
    var unUpdateRateUS: u32 = undefined;
    _ = &unUpdateRateUS;
    var unAttribute: u8 = undefined;
    _ = &unAttribute;
    var unValue: u32 = undefined;
    _ = &unValue;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                res = -@as(c_int, 1);
                nSettings = 0;
                unUpdateRateUS = 9000;
                _ = memset(@ptrCast(@alignCast(&buf)), 0, @sizeOf(@TypeOf(buf)));
                buf[@as(c_int, 0)] = 0;
                buf[@as(c_int, 1)] = ID_GET_ATTRIBUTES_VALUES;
                res = SetFeatureReport(dev, @ptrCast(@alignCast(&buf)), 2);
                if (res < @as(c_int, 0)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                if (!bSuppressErrorSpew) {
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
                res = ReadResponse(dev, @ptrCast(@alignCast(&buf)), ID_GET_ATTRIBUTES_VALUES);
                if ((res < @as(c_int, 0)) or (@as(c_int, buf[@as(c_int, 1)]) != ID_GET_ATTRIBUTES_VALUES)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            4 => {
                SDL_Log_REAL("GET_ATTRIBUTES_VALUES failed for controller %p", dev);
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
                return @"false" != 0;
            },
            7 => {
                if (!bSuppressErrorSpew) {
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
                nAttributesLength = buf[@as(c_int, 2)];
                if (nAttributesLength > res) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            10 => {
                SDL_Log_REAL("Bad GET_ATTRIBUTES_VALUES response for controller %p", dev);
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
                return @"false" != 0;
            },
            13 => {
                if (!bSuppressErrorSpew) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
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
                msg = @ptrCast(@alignCast(&buf[@as(c_int, 1)]));
                i = 0;
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            16 => {
                SDL_Log_REAL("Bad GET_ATTRIBUTES_VALUES response for controller %p", dev);
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
                return @"false" != 0;
            },
            19 => {
                if (@as(c_ulong, i) < (@as(c_ulong, @bitCast(@as(c_long, @as(c_int, msg.*.header.length)))) / @sizeOf(ControllerAttribute))) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            20 => {
                unAttribute = msg.*.payload.getAttributes.attributes[i].attributeTag;
                unValue = msg.*.payload.getAttributes.attributes[i].attributeValue;
                switch (@as(c_int, unAttribute)) {
                    ATTRIB_UNIQUE_ID => {
                        sdl_pc = 24;
                        continue;
                    },
                    ATTRIB_PRODUCT_ID => {
                        sdl_pc = 25;
                        continue;
                    },
                    ATTRIB_CAPABILITIES => {
                        sdl_pc = 26;
                        continue;
                    },
                    ATTRIB_CONNECTION_INTERVAL_IN_US => {
                        sdl_pc = 27;
                        continue;
                    },
                    else => {
                        sdl_pc = 28;
                        continue;
                    },
                }
            },
            21 => {
                i +%= 1;
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            22 => {
                if (punUpdateRateUS != null) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            23 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            24 => {
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            25 => {
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            26 => {
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            27 => {
                unUpdateRateUS = unValue;
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            28 => {
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            29 => {
                punUpdateRateUS.* = unUpdateRateUS;
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
                _ = memset(@ptrCast(@alignCast(&buf)), 0, @sizeOf(@TypeOf(buf)));
                buf[@as(c_int, 0)] = 0;
                buf[@as(c_int, 1)] = ID_CLEAR_DIGITAL_MAPPINGS;
                res = SetFeatureReport(dev, @ptrCast(@alignCast(&buf)), 2);
                if (res < @as(c_int, 0)) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            32 => {
                if (!bSuppressErrorSpew) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
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
                _ = memset(@ptrCast(@alignCast(&buf)), 0, @sizeOf(@TypeOf(buf)));
                buf[@as(c_int, 1)] = ID_LOAD_DEFAULT_SETTINGS;
                buf[@as(c_int, 2)] = 0;
                res = SetFeatureReport(dev, @ptrCast(@alignCast(&buf)), 3);
                if (res < @as(c_int, 0)) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
                    continue;
                }
            },
            35 => {
                SDL_Log_REAL("CLEAR_DIGITAL_MAPPINGS failed for controller %p", dev);
                {
                    sdl_pc = 37;
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
                return @"false" != 0;
            },
            38 => {
                if (!bSuppressErrorSpew) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
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
                _ = memset(@ptrCast(@alignCast(&buf)), 0, @sizeOf(@TypeOf(buf)));
                buf[@as(c_int, 1)] = ID_SET_SETTINGS_VALUES;
                buf[@bitCast(@as(isize, @intCast(@as(c_int, 3) + (nSettings * @as(c_int, 3)))))] = SETTING_WIRELESS_PACKET_VERSION;
                buf[@bitCast(@as(isize, @intCast((@as(c_int, 3) + (nSettings * @as(c_int, 3))) + @as(c_int, 1))))] = @bitCast(@as(i8, @truncate(@as(c_int, @as(u16, @bitCast(@as(c_short, @truncate(@as(c_int, 2)))))) & @as(c_int, 255))));
                buf[@bitCast(@as(isize, @intCast((@as(c_int, 3) + (nSettings * @as(c_int, 3))) + @as(c_int, 2))))] = @bitCast(@as(i8, @truncate(@as(c_int, @as(u16, @bitCast(@as(c_short, @truncate(@as(c_int, 2)))))) >> @intCast(@as(c_int, 8)))));
                nSettings += 1;
                buf[@bitCast(@as(isize, @intCast(@as(c_int, 3) + (nSettings * @as(c_int, 3)))))] = SETTING_LEFT_TRACKPAD_MODE;
                buf[@bitCast(@as(isize, @intCast((@as(c_int, 3) + (nSettings * @as(c_int, 3))) + @as(c_int, 1))))] = @bitCast(@as(i8, @truncate(@as(c_int, @as(u16, @bitCast(@as(c_short, @truncate(TRACKPAD_NONE))))) & @as(c_int, 255))));
                buf[@bitCast(@as(isize, @intCast((@as(c_int, 3) + (nSettings * @as(c_int, 3))) + @as(c_int, 2))))] = @bitCast(@as(i8, @truncate(@as(c_int, @as(u16, @bitCast(@as(c_short, @truncate(TRACKPAD_NONE))))) >> @intCast(@as(c_int, 8)))));
                nSettings += 1;
                buf[@bitCast(@as(isize, @intCast(@as(c_int, 3) + (nSettings * @as(c_int, 3)))))] = SETTING_RIGHT_TRACKPAD_MODE;
                buf[@bitCast(@as(isize, @intCast((@as(c_int, 3) + (nSettings * @as(c_int, 3))) + @as(c_int, 1))))] = @bitCast(@as(i8, @truncate(@as(c_int, @as(u16, @bitCast(@as(c_short, @truncate(TRACKPAD_NONE))))) & @as(c_int, 255))));
                buf[@bitCast(@as(isize, @intCast((@as(c_int, 3) + (nSettings * @as(c_int, 3))) + @as(c_int, 2))))] = @bitCast(@as(i8, @truncate(@as(c_int, @as(u16, @bitCast(@as(c_short, @truncate(TRACKPAD_NONE))))) >> @intCast(@as(c_int, 8)))));
                nSettings += 1;
                buf[@bitCast(@as(isize, @intCast(@as(c_int, 3) + (nSettings * @as(c_int, 3)))))] = SETTING_SMOOTH_ABSOLUTE_MOUSE;
                buf[@bitCast(@as(isize, @intCast((@as(c_int, 3) + (nSettings * @as(c_int, 3))) + @as(c_int, 1))))] = @bitCast(@as(i8, @truncate(@as(c_int, @as(u16, @bitCast(@as(c_short, @truncate(@as(c_int, 0)))))) & @as(c_int, 255))));
                buf[@bitCast(@as(isize, @intCast((@as(c_int, 3) + (nSettings * @as(c_int, 3))) + @as(c_int, 2))))] = @bitCast(@as(i8, @truncate(@as(c_int, @as(u16, @bitCast(@as(c_short, @truncate(@as(c_int, 0)))))) >> @intCast(@as(c_int, 8)))));
                nSettings += 1;
                buf[@as(c_int, 2)] = @bitCast(@as(i8, @truncate(nSettings * @as(c_int, 3))));
                res = SetFeatureReport(dev, @ptrCast(@alignCast(&buf)), @as(c_int, 3) + (nSettings * @as(c_int, 3)));
                if (res < @as(c_int, 0)) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            41 => {
                SDL_Log_REAL("LOAD_DEFAULT_SETTINGS failed for controller %p\n", dev);
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            42 => {
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            43 => {
                return @"false" != 0;
            },
            44 => {
                if (!bSuppressErrorSpew) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            45 => {
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            46 => {
                return @"true" != 0;
            },
            47 => {
                SDL_Log_REAL("SET_SETTINGS failed for controller %p", dev);
                {
                    sdl_pc = 49;
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
                return @"false" != 0;
            },
            else => unreachable,
        }
    }
}
pub fn ReadSteamController(dev: ?*SDL_hid_device, pData: [*c]u8, nDataSize: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    _ = memset(@ptrCast(@alignCast(pData)), 0, @bitCast(@as(c_long, nDataSize)));
    pData[@as(c_int, 0)] = BLE_REPORT_NUMBER;
    return SDL_hid_read_REAL(dev, pData, @bitCast(@as(c_long, nDataSize)));
}
pub fn SetPairingState(dev: [*c]SDL_HIDAPI_Device, bEnablePairing: bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var buf: [65]u8 = undefined;
    _ = &buf;
    _ = memset(@ptrCast(@alignCast(&buf)), 0, @sizeOf(@TypeOf(buf)));
    buf[@as(c_int, 1)] = ID_ENABLE_PAIRING;
    buf[@as(c_int, 2)] = 2;
    buf[@as(c_int, 3)] = @bitCast(@as(i8, @truncate(if (bEnablePairing) @as(c_int, 1) else @as(c_int, 0))));
    buf[@as(c_int, 4)] = @bitCast(@as(i8, @truncate(if (bEnablePairing) PAIRING_STATE_DURATION_SECONDS else @as(c_int, 0))));
    _ = SetFeatureReport(dev, @ptrCast(@alignCast(&buf)), 5);
}
pub fn CommitPairing(dev: [*c]SDL_HIDAPI_Device) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var buf: [65]u8 = undefined;
    _ = &buf;
    _ = memset(@ptrCast(@alignCast(&buf)), 0, @sizeOf(@TypeOf(buf)));
    buf[@as(c_int, 1)] = ID_DONGLE_COMMIT_DEVICE;
    _ = SetFeatureReport(dev, @ptrCast(@alignCast(&buf)), 2);
}
pub fn CloseSteamController(dev: [*c]SDL_HIDAPI_Device) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var buf: [65]u8 = undefined;
    _ = &buf;
    var nSettings: c_int = 0;
    _ = &nSettings;
    _ = memset(@ptrCast(@alignCast(&buf)), 0, @sizeOf(@TypeOf(buf)));
    buf[@as(c_int, 1)] = ID_SET_DEFAULT_DIGITAL_MAPPINGS;
    _ = SetFeatureReport(dev, @ptrCast(@alignCast(&buf)), 2);
    _ = memset(@ptrCast(@alignCast(&buf)), 0, @sizeOf(@TypeOf(buf)));
    buf[@as(c_int, 1)] = ID_LOAD_DEFAULT_SETTINGS;
    buf[@as(c_int, 2)] = 0;
    _ = SetFeatureReport(dev, @ptrCast(@alignCast(&buf)), 3);
    _ = memset(@ptrCast(@alignCast(&buf)), 0, @sizeOf(@TypeOf(buf)));
    buf[@as(c_int, 1)] = ID_SET_SETTINGS_VALUES;
    buf[@bitCast(@as(isize, @intCast(@as(c_int, 3) + (nSettings * @as(c_int, 3)))))] = SETTING_RIGHT_TRACKPAD_MODE;
    buf[@bitCast(@as(isize, @intCast((@as(c_int, 3) + (nSettings * @as(c_int, 3))) + @as(c_int, 1))))] = @bitCast(@as(i8, @truncate(@as(c_int, @as(u16, @bitCast(@as(c_short, @truncate(TRACKPAD_ABSOLUTE_MOUSE))))) & @as(c_int, 255))));
    buf[@bitCast(@as(isize, @intCast((@as(c_int, 3) + (nSettings * @as(c_int, 3))) + @as(c_int, 2))))] = @bitCast(@as(i8, @truncate(@as(c_int, @as(u16, @bitCast(@as(c_short, @truncate(TRACKPAD_ABSOLUTE_MOUSE))))) >> @intCast(@as(c_int, 8)))));
    nSettings += 1;
    buf[@as(c_int, 2)] = @bitCast(@as(i8, @truncate(nSettings * @as(c_int, 3))));
    _ = SetFeatureReport(dev, @ptrCast(@alignCast(&buf)), @as(c_int, 3) + (nSettings * @as(c_int, 3)));
}
pub fn RemapValClamped(val: f32, A: f32, B: f32, C: f32, D: f32) callconv(.c) f32 {
    @setEvalBranchQuota(100000);
    if (A == B) {
        return if ((val - B) >= @as(f32, 0.0)) D else C;
    } else {
        var cVal: f32 = (val - A) / (B - A);
        _ = &cVal;
        cVal = if (cVal > @as(f32, 1.0)) @as(f32, 1.0) else if (cVal < @as(f32, 0.0)) @as(f32, 0.0) else cVal;
        return C + ((D - C) * cVal);
    }
}
pub fn RotatePad(pX: [*c]c_int, pY: [*c]c_int, flAngleInRad: f32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var origX: c_int = pX.*;
    _ = &origX;
    var origY: c_int = pY.*;
    _ = &origY;
    pX.* = @intFromFloat((SDL_cosf_REAL(flAngleInRad) * @as(f32, @floatFromInt(origX))) - (SDL_sinf_REAL(flAngleInRad) * @as(f32, @floatFromInt(origY))));
    pY.* = @intFromFloat((SDL_sinf_REAL(flAngleInRad) * @as(f32, @floatFromInt(origX))) + (SDL_cosf_REAL(flAngleInRad) * @as(f32, @floatFromInt(origY))));
}
pub fn FormatStatePacketUntilGyro(pState: [*c]SteamControllerStateInternal_t, pStatePacket: [*c]ValveControllerStatePacket_t) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var nLeftPadX: c_int = undefined;
    _ = &nLeftPadX;
    var nLeftPadY: c_int = undefined;
    _ = &nLeftPadY;
    var nRightPadX: c_int = undefined;
    _ = &nRightPadX;
    var nRightPadY: c_int = undefined;
    _ = &nRightPadY;
    var nPadOffset: c_int = undefined;
    _ = &nPadOffset;
    const flRotationAngle: f32 = 0.261799;
    _ = &flRotationAngle;
    _ = memset(@ptrCast(@alignCast(pState)), 0, @intCast(@intFromPtr(&@as([*c]SteamControllerStateInternal_t, null).*.sBatteryLevel)));
    pState.*.eControllerType = 2;
    pState.*.unPacketNum = pStatePacket.*.unPacketNum;
    _ = memcpy(@ptrCast(@alignCast(&pState.*.ulButtons)), @ptrCast(@alignCast(&pStatePacket.*.ButtonTriggerData.ulButtons)), 8);
    {
        const ref = &pState.*.ulButtons;
        ref.* = @truncate(@as(c_ulonglong, ref.*) & @as(c_ulonglong, @bitCast(@as(c_longlong, ~@as(c_longlong, 1099494850560)))));
    }
    if ((pStatePacket.*.ButtonTriggerData.ulButtons & @as(Uint64, STEAM_LEFTPAD_FINGERDOWN_MASK)) != 0) {
        pState.*.sLeftPadX = blk: {
            const tmp = pStatePacket.*.sLeftPadX;
            pState.*.sPrevLeftPad[@as(c_int, 0)] = tmp;
            break :blk tmp;
        };
        pState.*.sLeftPadY = blk: {
            const tmp = pStatePacket.*.sLeftPadY;
            pState.*.sPrevLeftPad[@as(c_int, 1)] = tmp;
            break :blk tmp;
        };
        if ((pStatePacket.*.ButtonTriggerData.ulButtons & @as(Uint64, STEAM_LEFTPAD_AND_JOYSTICK_MASK)) != 0) {
            pState.*.sLeftStickX = pState.*.sPrevLeftStick[@as(c_int, 0)];
            pState.*.sLeftStickY = pState.*.sPrevLeftStick[@as(c_int, 1)];
        } else {
            pState.*.sPrevLeftStick[@as(c_int, 0)] = 0;
            pState.*.sPrevLeftStick[@as(c_int, 1)] = 0;
        }
    } else {
        {
            pState.*.sPrevLeftStick[@as(c_int, 0)] = blk: {
                const tmp = pStatePacket.*.sLeftPadX;
                pState.*.sLeftStickX = tmp;
                break :blk tmp;
            };
            pState.*.sPrevLeftStick[@as(c_int, 1)] = blk: {
                const tmp = pStatePacket.*.sLeftPadY;
                pState.*.sLeftStickY = tmp;
                break :blk tmp;
            };
        }
        if ((pStatePacket.*.ButtonTriggerData.ulButtons & @as(Uint64, STEAM_LEFTPAD_AND_JOYSTICK_MASK)) != 0) {
            pState.*.sLeftPadX = pState.*.sPrevLeftPad[@as(c_int, 0)];
            pState.*.sLeftPadY = pState.*.sPrevLeftPad[@as(c_int, 1)];
        } else {
            pState.*.sPrevLeftPad[@as(c_int, 0)] = 0;
            pState.*.sPrevLeftPad[@as(c_int, 1)] = 0;
            if ((pState.*.ulButtons & @as(Uint64, STEAM_BUTTON_LEFTPAD_CLICKED_MASK)) != 0) {
                pState.*.ulButtons &= @bitCast(@as(c_long, ~STEAM_BUTTON_LEFTPAD_CLICKED_MASK));
                pState.*.ulButtons |= STEAM_JOYSTICK_BUTTON_MASK;
            }
        }
    }
    if ((pStatePacket.*.ButtonTriggerData.ulButtons & @as(Uint64, STEAM_LEFTPAD_AND_JOYSTICK_MASK)) != 0) {
        pState.*.ulButtons |= STEAM_LEFTPAD_FINGERDOWN_MASK;
    }
    pState.*.sRightPadX = pStatePacket.*.sRightPadX;
    pState.*.sRightPadY = pStatePacket.*.sRightPadY;
    nLeftPadX = pState.*.sLeftPadX;
    nLeftPadY = pState.*.sLeftPadY;
    nRightPadX = pState.*.sRightPadX;
    nRightPadY = pState.*.sRightPadY;
    RotatePad(&nLeftPadX, &nLeftPadY, -flRotationAngle);
    RotatePad(&nRightPadX, &nRightPadY, flRotationAngle);
    if ((pState.*.ulButtons & @as(Uint64, STEAM_LEFTPAD_FINGERDOWN_MASK)) != 0) {
        nPadOffset = 1000;
    } else {
        nPadOffset = 0;
    }
    pState.*.sLeftPadX = @truncate(if ((nLeftPadX + nPadOffset) > @as(c_int, @as(Sint16, @truncate(@as(c_int, 32767))))) @as(c_int, @as(Sint16, @truncate(@as(c_int, 32767)))) else if ((nLeftPadX + nPadOffset) < @as(c_int, @as(Sint16, @truncate(~@as(c_int, 32767))))) @as(c_int, @as(Sint16, @truncate(~@as(c_int, 32767)))) else nLeftPadX + nPadOffset);
    pState.*.sLeftPadY = @truncate(if ((nLeftPadY + nPadOffset) > @as(c_int, @as(Sint16, @truncate(@as(c_int, 32767))))) @as(c_int, @as(Sint16, @truncate(@as(c_int, 32767)))) else if ((nLeftPadY + nPadOffset) < @as(c_int, @as(Sint16, @truncate(~@as(c_int, 32767))))) @as(c_int, @as(Sint16, @truncate(~@as(c_int, 32767)))) else nLeftPadY + nPadOffset);
    nPadOffset = 0;
    if ((pState.*.ulButtons & @as(Uint64, STEAM_RIGHTPAD_FINGERDOWN_MASK)) != 0) {
        nPadOffset = 1000;
    } else {
        nPadOffset = 0;
    }
    pState.*.sRightPadX = @truncate(if ((nRightPadX + nPadOffset) > @as(c_int, @as(Sint16, @truncate(@as(c_int, 32767))))) @as(c_int, @as(Sint16, @truncate(@as(c_int, 32767)))) else if ((nRightPadX + nPadOffset) < @as(c_int, @as(Sint16, @truncate(~@as(c_int, 32767))))) @as(c_int, @as(Sint16, @truncate(~@as(c_int, 32767)))) else nRightPadX + nPadOffset);
    pState.*.sRightPadY = @truncate(if ((nRightPadY + nPadOffset) > @as(c_int, @as(Sint16, @truncate(@as(c_int, 32767))))) @as(c_int, @as(Sint16, @truncate(@as(c_int, 32767)))) else if ((nRightPadY + nPadOffset) < @as(c_int, @as(Sint16, @truncate(~@as(c_int, 32767))))) @as(c_int, @as(Sint16, @truncate(~@as(c_int, 32767)))) else nRightPadY + nPadOffset);
    pState.*.sTriggerL = @intFromFloat(RemapValClamped(@floatFromInt((@as(c_int, pStatePacket.*.ButtonTriggerData.Triggers.nLeft) << @intCast(@as(c_int, 7))) | @as(c_int, pStatePacket.*.ButtonTriggerData.Triggers.nLeft)), @floatFromInt(@as(c_int, 0)), @floatFromInt(STEAMCONTROLLER_TRIGGER_MAX_ANALOG), @floatFromInt(@as(c_int, 0)), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767))))));
    pState.*.sTriggerR = @intFromFloat(RemapValClamped(@floatFromInt((@as(c_int, pStatePacket.*.ButtonTriggerData.Triggers.nRight) << @intCast(@as(c_int, 7))) | @as(c_int, pStatePacket.*.ButtonTriggerData.Triggers.nRight)), @floatFromInt(@as(c_int, 0)), @floatFromInt(STEAMCONTROLLER_TRIGGER_MAX_ANALOG), @floatFromInt(@as(c_int, 0)), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767))))));
}
pub fn UpdateBLESteamControllerState(arg_pData: [*c]const u8, _: c_int, pState: [*c]SteamControllerStateInternal_t) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var pData = arg_pData;
    _ = &pData;
    var nLeftPadX: c_int = undefined;
    _ = &nLeftPadX;
    var nLeftPadY: c_int = undefined;
    _ = &nLeftPadY;
    var nRightPadX: c_int = undefined;
    _ = &nRightPadX;
    var nRightPadY: c_int = undefined;
    _ = &nRightPadY;
    var nPadOffset: c_int = undefined;
    _ = &nPadOffset;
    var ucOptionDataMask: u32 = undefined;
    _ = &ucOptionDataMask;
    const flRotationAngle: f32 = 0.261799;
    _ = &flRotationAngle;
    pState.*.unPacketNum +%= 1;
    ucOptionDataMask = @bitCast(@as(c_int, @as(c_int, (blk: {
        const ref = &pData;
        const tmp = ref.*;
        ref.* += 1;
        break :blk tmp;
    }).*) & @as(c_int, 240)));
    ucOptionDataMask |= @as(u32, (blk: {
        const ref = &pData;
        const tmp = ref.*;
        ref.* += 1;
        break :blk tmp;
    }).*) << @intCast(@as(u32, 8));
    if ((ucOptionDataMask & @as(u32, k_EBLEButtonChunk1)) != 0) {
        _ = memcpy(@ptrCast(@alignCast(&pState.*.ulButtons)), @ptrCast(@alignCast(pData)), 3);
        pData += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
    }
    if ((ucOptionDataMask & @as(u32, k_EBLEButtonChunk2)) != 0) {
        pState.*.sTriggerL = @intFromFloat(RemapValClamped(@floatFromInt((@as(c_int, pData[@as(c_int, 0)]) << @intCast(@as(c_int, 7))) | @as(c_int, pData[@as(c_int, 0)])), @floatFromInt(@as(c_int, 0)), @floatFromInt(STEAMCONTROLLER_TRIGGER_MAX_ANALOG), @floatFromInt(@as(c_int, 0)), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767))))));
        pState.*.sTriggerR = @intFromFloat(RemapValClamped(@floatFromInt((@as(c_int, pData[@as(c_int, 1)]) << @intCast(@as(c_int, 7))) | @as(c_int, pData[@as(c_int, 1)])), @floatFromInt(@as(c_int, 0)), @floatFromInt(STEAMCONTROLLER_TRIGGER_MAX_ANALOG), @floatFromInt(@as(c_int, 0)), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767))))));
        pData += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
    }
    if ((ucOptionDataMask & @as(u32, k_EBLEButtonChunk3)) != 0) {
        var pButtonByte: [*c]u8 = @ptrCast(@alignCast(&pState.*.ulButtons));
        _ = &pButtonByte;
        pButtonByte[@as(c_int, 5)] = (blk: {
            const ref = &pData;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        }).*;
        pButtonByte[@as(c_int, 6)] = (blk: {
            const ref = &pData;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        }).*;
        pButtonByte[@as(c_int, 7)] = (blk: {
            const ref = &pData;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        }).*;
    }
    if ((ucOptionDataMask & @as(u32, k_EBLELeftJoystickChunk)) != 0) {
        var nLength: c_int = @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(pState.*.sLeftStickX)) +% @sizeOf(@TypeOf(pState.*.sLeftStickY)))));
        _ = &nLength;
        _ = memcpy(@ptrCast(@alignCast(&pState.*.sLeftStickX)), @ptrCast(@alignCast(pData)), @bitCast(@as(c_long, nLength)));
        pData += @as(usize, @bitCast(@as(isize, @intCast(nLength))));
    }
    if ((ucOptionDataMask & @as(u32, k_EBLELeftTrackpadChunk)) != 0) {
        var nLength: c_int = @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(pState.*.sLeftPadX)) +% @sizeOf(@TypeOf(pState.*.sLeftPadY)))));
        _ = &nLength;
        _ = memcpy(@ptrCast(@alignCast(&pState.*.sLeftPadX)), @ptrCast(@alignCast(pData)), @bitCast(@as(c_long, nLength)));
        if ((pState.*.ulButtons & @as(Uint64, STEAM_LEFTPAD_FINGERDOWN_MASK)) != 0) {
            nPadOffset = 1000;
        } else {
            nPadOffset = 0;
        }
        nLeftPadX = pState.*.sLeftPadX;
        nLeftPadY = pState.*.sLeftPadY;
        RotatePad(&nLeftPadX, &nLeftPadY, -flRotationAngle);
        pState.*.sLeftPadX = @truncate(if ((nLeftPadX + nPadOffset) > @as(c_int, @as(Sint16, @truncate(@as(c_int, 32767))))) @as(c_int, @as(Sint16, @truncate(@as(c_int, 32767)))) else if ((nLeftPadX + nPadOffset) < @as(c_int, @as(Sint16, @truncate(~@as(c_int, 32767))))) @as(c_int, @as(Sint16, @truncate(~@as(c_int, 32767)))) else nLeftPadX + nPadOffset);
        pState.*.sLeftPadY = @truncate(if ((nLeftPadY + nPadOffset) > @as(c_int, @as(Sint16, @truncate(@as(c_int, 32767))))) @as(c_int, @as(Sint16, @truncate(@as(c_int, 32767)))) else if ((nLeftPadY + nPadOffset) < @as(c_int, @as(Sint16, @truncate(~@as(c_int, 32767))))) @as(c_int, @as(Sint16, @truncate(~@as(c_int, 32767)))) else nLeftPadY + nPadOffset);
        pData += @as(usize, @bitCast(@as(isize, @intCast(nLength))));
    }
    if ((ucOptionDataMask & @as(u32, k_EBLERightTrackpadChunk)) != 0) {
        var nLength: c_int = @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(pState.*.sRightPadX)) +% @sizeOf(@TypeOf(pState.*.sRightPadY)))));
        _ = &nLength;
        _ = memcpy(@ptrCast(@alignCast(&pState.*.sRightPadX)), @ptrCast(@alignCast(pData)), @bitCast(@as(c_long, nLength)));
        if ((pState.*.ulButtons & @as(Uint64, STEAM_RIGHTPAD_FINGERDOWN_MASK)) != 0) {
            nPadOffset = 1000;
        } else {
            nPadOffset = 0;
        }
        nRightPadX = pState.*.sRightPadX;
        nRightPadY = pState.*.sRightPadY;
        RotatePad(&nRightPadX, &nRightPadY, flRotationAngle);
        pState.*.sRightPadX = @truncate(if ((nRightPadX + nPadOffset) > @as(c_int, @as(Sint16, @truncate(@as(c_int, 32767))))) @as(c_int, @as(Sint16, @truncate(@as(c_int, 32767)))) else if ((nRightPadX + nPadOffset) < @as(c_int, @as(Sint16, @truncate(~@as(c_int, 32767))))) @as(c_int, @as(Sint16, @truncate(~@as(c_int, 32767)))) else nRightPadX + nPadOffset);
        pState.*.sRightPadY = @truncate(if ((nRightPadY + nPadOffset) > @as(c_int, @as(Sint16, @truncate(@as(c_int, 32767))))) @as(c_int, @as(Sint16, @truncate(@as(c_int, 32767)))) else if ((nRightPadY + nPadOffset) < @as(c_int, @as(Sint16, @truncate(~@as(c_int, 32767))))) @as(c_int, @as(Sint16, @truncate(~@as(c_int, 32767)))) else nRightPadY + nPadOffset);
        pData += @as(usize, @bitCast(@as(isize, @intCast(nLength))));
    }
    if ((ucOptionDataMask & @as(u32, k_EBLEIMUAccelChunk)) != 0) {
        var nLength: c_int = @bitCast(@as(c_uint, @truncate((@sizeOf(@TypeOf(pState.*.sAccelX)) +% @sizeOf(@TypeOf(pState.*.sAccelY))) +% @sizeOf(@TypeOf(pState.*.sAccelZ)))));
        _ = &nLength;
        _ = memcpy(@ptrCast(@alignCast(&pState.*.sAccelX)), @ptrCast(@alignCast(pData)), @bitCast(@as(c_long, nLength)));
        pData += @as(usize, @bitCast(@as(isize, @intCast(nLength))));
    }
    if ((ucOptionDataMask & @as(u32, k_EBLEIMUGyroChunk)) != 0) {
        var nLength: c_int = @bitCast(@as(c_uint, @truncate((@sizeOf(@TypeOf(pState.*.sAccelX)) +% @sizeOf(@TypeOf(pState.*.sAccelY))) +% @sizeOf(@TypeOf(pState.*.sAccelZ)))));
        _ = &nLength;
        _ = memcpy(@ptrCast(@alignCast(&pState.*.sGyroX)), @ptrCast(@alignCast(pData)), @bitCast(@as(c_long, nLength)));
        pData += @as(usize, @bitCast(@as(isize, @intCast(nLength))));
    }
    if ((ucOptionDataMask & @as(u32, k_EBLEIMUQuatChunk)) != 0) {
        var nLength: c_int = @bitCast(@as(c_uint, @truncate(((@sizeOf(@TypeOf(pState.*.sGyroQuatW)) +% @sizeOf(@TypeOf(pState.*.sGyroQuatX))) +% @sizeOf(@TypeOf(pState.*.sGyroQuatY))) +% @sizeOf(@TypeOf(pState.*.sGyroQuatZ)))));
        _ = &nLength;
        _ = memcpy(@ptrCast(@alignCast(&pState.*.sGyroQuatW)), @ptrCast(@alignCast(pData)), @bitCast(@as(c_long, nLength)));
        pData += @as(usize, @bitCast(@as(isize, @intCast(nLength))));
    }
    return @"true" != 0;
}
pub fn UpdateSteamControllerState(pData: [*c]const u8, nDataSize: c_int, pState: [*c]SteamControllerStateInternal_t) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var pInReport: [*c]ValveInReport_t = undefined;
    _ = &pInReport;
    var pStatePacket: [*c]ValveControllerStatePacket_t = undefined;
    _ = &pStatePacket;
    var pBLEStatePacket: [*c]ValveControllerBLEStatePacket_t = undefined;
    _ = &pBLEStatePacket;
    var pStatePacket_1: [*c]ValveControllerStatePacket_t = undefined;
    _ = &pStatePacket_1;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                pInReport = @ptrCast(@alignCast(@constCast(pData)));
                if (@as(c_int, pInReport.*.header.unReportVersion) != k_ValveInReportMsgVersion) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                if ((@as(c_int, pData[@as(c_int, 0)]) & @as(c_int, 15)) == k_EBLEReportState) {
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
                if ((@as(c_int, pInReport.*.header.ucType) != ID_CONTROLLER_STATE) and (@as(c_int, pInReport.*.header.ucType) != ID_CONTROLLER_BLE_STATE)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            4 => {
                return UpdateBLESteamControllerState(pData, nDataSize, pState);
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                return @"false" != 0;
            },
            7 => {
                return @"false" != 0;
            },
            8 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                if (@as(c_int, pInReport.*.header.ucType) == ID_CONTROLLER_STATE) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                pStatePacket = &pInReport.*.payload.controllerState;
                if (pState.*.unPacketNum == pStatePacket.*.unPacketNum) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            11 => {
                if (@as(c_int, pInReport.*.header.ucType) == ID_CONTROLLER_BLE_STATE) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            12 => {
                return @"true" != 0;
            },
            13 => {
                return @"true" != 0;
            },
            14 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                FormatStatePacketUntilGyro(pState, pStatePacket);
                pState.*.sAccelX = pStatePacket.*.sAccelX;
                pState.*.sAccelY = pStatePacket.*.sAccelY;
                pState.*.sAccelZ = pStatePacket.*.sAccelZ;
                pState.*.sGyroQuatW = @floatFromInt(pStatePacket.*.sGyroQuatW);
                pState.*.sGyroQuatX = @floatFromInt(pStatePacket.*.sGyroQuatX);
                pState.*.sGyroQuatY = @floatFromInt(pStatePacket.*.sGyroQuatY);
                pState.*.sGyroQuatZ = @floatFromInt(pStatePacket.*.sGyroQuatZ);
                pState.*.sGyroX = pStatePacket.*.sGyroX;
                pState.*.sGyroY = pStatePacket.*.sGyroY;
                pState.*.sGyroZ = pStatePacket.*.sGyroZ;
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            16 => {
                pBLEStatePacket = &pInReport.*.payload.controllerBLEState;
                pStatePacket_1 = &pInReport.*.payload.controllerState;
                if (pState.*.unPacketNum == pStatePacket_1.*.unPacketNum) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
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
                    sdl_pc = 12;
                    continue;
                }
            },
            19 => {
                return @"true" != 0;
            },
            20 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            21 => {
                FormatStatePacketUntilGyro(pState, pStatePacket_1);
                switch (@as(c_int, pBLEStatePacket.*.ucGyroDataType)) {
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
                    else => {
                        sdl_pc = 26;
                        continue;
                    },
                }
            },
            22 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            23 => {
                pState.*.sGyroQuatW = @as(f32, @floatFromInt(pBLEStatePacket.*.sGyro[@as(c_int, 0)]));
                pState.*.sGyroQuatX = @as(f32, @floatFromInt(pBLEStatePacket.*.sGyro[@as(c_int, 1)]));
                pState.*.sGyroQuatY = @as(f32, @floatFromInt(pBLEStatePacket.*.sGyro[@as(c_int, 2)]));
                pState.*.sGyroQuatZ = @as(f32, @floatFromInt(pBLEStatePacket.*.sGyro[@as(c_int, 3)]));
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            24 => {
                pState.*.sAccelX = pBLEStatePacket.*.sGyro[@as(c_int, 0)];
                pState.*.sAccelY = pBLEStatePacket.*.sGyro[@as(c_int, 1)];
                pState.*.sAccelZ = pBLEStatePacket.*.sGyro[@as(c_int, 2)];
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            25 => {
                pState.*.sGyroX = pBLEStatePacket.*.sGyro[@as(c_int, 0)];
                pState.*.sGyroY = pBLEStatePacket.*.sGyro[@as(c_int, 1)];
                pState.*.sGyroZ = pBLEStatePacket.*.sGyro[@as(c_int, 2)];
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            26 => {
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub const SDL_DriverSteam_Context = extern struct {
    device: [*c]SDL_HIDAPI_Device = null,
    connected: bool = false,
    report_sensors: bool = false,
    update_rate_in_us: u32 = 0,
    sensor_timestamp: Uint64 = 0,
    pairing_time: Uint64 = 0,
    left_touch_down: bool = false,
    left_touch_x: f32 = 0,
    left_touch_y: f32 = 0,
    right_touch_down: bool = false,
    right_touch_x: f32 = 0,
    right_touch_y: f32 = 0,
    m_assembler: SteamControllerPacketAssembler = @import("std").mem.zeroes(SteamControllerPacketAssembler),
    m_state: SteamControllerStateInternal_t = @import("std").mem.zeroes(SteamControllerStateInternal_t),
    m_last_state: SteamControllerStateInternal_t = @import("std").mem.zeroes(SteamControllerStateInternal_t),
};
pub fn IsDongle(product_id: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return @as(c_int, product_id) == USB_PRODUCT_VALVE_STEAM_CONTROLLER_DONGLE;
}
pub fn HIDAPI_DriverSteam_RegisterHints(callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = SDL_AddHintCallback_REAL("SDL_JOYSTICK_HIDAPI_STEAM", callback, userdata);
}
pub fn HIDAPI_DriverSteam_UnregisterHints(callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_RemoveHintCallback_REAL("SDL_JOYSTICK_HIDAPI_STEAM", callback, userdata);
}
pub fn HIDAPI_DriverSteam_IsEnabled() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI_STEAM", SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI", @"true" != 0));
}
pub fn HIDAPI_DriverSteam_IsSupportedDevice(device: [*c]SDL_HIDAPI_Device, _: [*c]const u8, arg_type: SDL_GamepadType, vendor_id: Uint16, product_id: Uint16, _: Uint16, arg_interface_number: c_int, _: c_int, _: c_int, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var interface_number = arg_interface_number;
    _ = &interface_number;
    if (!SDL_IsJoystickSteamController(vendor_id, product_id)) {
        return @"false" != 0;
    }
    if (!(device != null)) {
        return @"true" != 0;
    }
    if (device.*.is_bluetooth) {
        return @"true" != 0;
    }
    if (IsDongle(product_id)) {
        if ((interface_number >= @as(c_int, 1)) and (interface_number <= @as(c_int, 4))) {
            return @"true" != 0;
        }
    } else {
        if (interface_number == @as(c_int, 2)) {
            return @"true" != 0;
        }
    }
    return @"false" != 0;
}
pub fn HIDAPI_DriverSteam_SetPairingState(ctx: [*c]SDL_DriverSteam_Context, enabled: bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local_s_PairingContext = struct {
        var s_PairingContext: [*c]SDL_DriverSteam_Context = null;
    };
    _ = &static_local_s_PairingContext;
    if (enabled and (@as(?*anyopaque, @ptrCast(@alignCast(static_local_s_PairingContext.s_PairingContext))) != @as(?*anyopaque, null))) {
        return;
    }
    if (!enabled and (static_local_s_PairingContext.s_PairingContext != ctx)) {
        return;
    }
    if (ctx.*.connected) {
        return;
    }
    SetPairingState(ctx.*.device, enabled);
    if (enabled) {
        ctx.*.pairing_time = SDL_GetTicks_REAL();
        static_local_s_PairingContext.s_PairingContext = ctx;
    } else {
        ctx.*.pairing_time = 0;
        static_local_s_PairingContext.s_PairingContext = null;
    }
}
pub fn HIDAPI_DriverSteam_RenewPairingState(ctx: [*c]SDL_DriverSteam_Context) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var now: Uint64 = SDL_GetTicks_REAL();
    _ = &now;
    if (now >= (ctx.*.pairing_time +% @as(Uint64, @bitCast(@as(c_long, PAIRING_STATE_DURATION_SECONDS * @as(c_int, 1000)))))) {
        SetPairingState(ctx.*.device, @"true" != 0);
        ctx.*.pairing_time = now;
    }
}
pub fn HIDAPI_DriverSteam_CommitPairing(ctx: [*c]SDL_DriverSteam_Context) callconv(.c) void {
    @setEvalBranchQuota(100000);
    CommitPairing(ctx.*.device);
}
pub fn SDL_PairingEnabledHintChanged(userdata: ?*anyopaque, _: [*c]const u8, _: [*c]const u8, hint: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSteam_Context = @ptrCast(@alignCast(userdata));
    _ = &ctx;
    var enabled: bool = SDL_GetStringBoolean(hint, @"false" != 0);
    _ = &enabled;
    HIDAPI_DriverSteam_SetPairingState(ctx, enabled);
}
pub fn HIDAPI_DriverSteam_InitDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSteam_Context = undefined;
    _ = &ctx;
    ctx = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(ctx.*)))));
    if (!(ctx != null)) {
        return @"false" != 0;
    }
    ctx.*.device = device;
    device.*.context = @ptrCast(@alignCast(ctx));
    HIDAPI_SetDeviceName(device, "Steam Controller");
    if (IsDongle(device.*.product_id)) {
        var buf: [65]u8 = undefined;
        _ = &buf;
        var res: c_int = undefined;
        _ = &res;
        _ = memset(@ptrCast(@alignCast(&buf)), 0, @sizeOf(@TypeOf(buf)));
        buf[@as(c_int, 0)] = 0;
        buf[@as(c_int, 1)] = ID_DONGLE_GET_WIRELESS_STATE;
        res = SetFeatureReport(device, @ptrCast(@alignCast(&buf)), 2);
        if (res < @as(c_int, 0)) {
            return SDL_SetError_REAL("Failed to send ID_DONGLE_GET_WIRELESS_STATE request");
        }
        {
            var attempt: c_int = 0;
            _ = &attempt;
            while (attempt < @as(c_int, 5)) : (attempt += 1) {
                var data: [128]u8 = undefined;
                _ = &data;
                res = ReadSteamController(device.*.dev, @ptrCast(@alignCast(&data)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(data))))));
                if (res == @as(c_int, 0)) {
                    SDL_Delay_REAL(1);
                    continue;
                }
                if (res < @as(c_int, 0)) {
                    break;
                }
                if ((((((res >= @as(c_int, 5)) and (@as(c_int, data[@as(c_int, 0)]) == @as(c_int, 1))) and (@as(c_int, data[@as(c_int, 1)]) == @as(c_int, 0))) and (@as(c_int, data[@as(c_int, 2)]) == @as(c_int, 3))) and (@as(c_int, data[@as(c_int, 3)]) >= @as(c_int, 1))) and (@as(c_int, data[@as(c_int, 4)]) != D0G_WIRELESS_DISCONNECTED)) {
                    ctx.*.connected = @"true" != 0;
                    break;
                } else if ((((((res >= @as(c_int, 5)) and (@as(c_int, data[@as(c_int, 0)]) == @as(c_int, 1))) and (@as(c_int, data[@as(c_int, 1)]) == @as(c_int, 0))) and (@as(c_int, data[@as(c_int, 2)]) == @as(c_int, 3))) and (@as(c_int, data[@as(c_int, 3)]) >= @as(c_int, 1))) and (@as(c_int, data[@as(c_int, 4)]) == D0G_WIRELESS_DISCONNECTED)) {
                    ctx.*.connected = @"false" != 0;
                    break;
                }
            }
        }
        _ = SDL_AddHintCallback_REAL("SDL_JOYSTICK_HIDAPI_STEAM_PAIRING_ENABLED", SDL_PairingEnabledHintChanged, @ptrCast(@alignCast(ctx)));
    } else {
        ctx.*.connected = @"true" != 0;
    }
    if (ctx.*.connected) {
        return HIDAPI_JoystickConnected(device, null);
    } else {
        return @"true" != 0;
    }
}
pub fn HIDAPI_DriverSteam_GetDevicePlayerIndex(_: [*c]SDL_HIDAPI_Device, _: SDL_JoystickID) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return -@as(c_int, 1);
}
pub fn HIDAPI_DriverSteam_SetDevicePlayerIndex(_: [*c]SDL_HIDAPI_Device, _: SDL_JoystickID, _: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn SetHomeLED(device: [*c]SDL_HIDAPI_Device, value: Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var buf: [65]u8 = undefined;
    _ = &buf;
    var nSettings: c_int = 0;
    _ = &nSettings;
    _ = memset(@ptrCast(@alignCast(&buf)), 0, @sizeOf(@TypeOf(buf)));
    buf[@as(c_int, 1)] = ID_SET_SETTINGS_VALUES;
    buf[@bitCast(@as(isize, @intCast(@as(c_int, 3) + (nSettings * @as(c_int, 3)))))] = SETTING_LED_USER_BRIGHTNESS;
    buf[@bitCast(@as(isize, @intCast((@as(c_int, 3) + (nSettings * @as(c_int, 3))) + @as(c_int, 1))))] = @bitCast(@as(i8, @truncate(@as(c_int, @as(u16, value)) & @as(c_int, 255))));
    buf[@bitCast(@as(isize, @intCast((@as(c_int, 3) + (nSettings * @as(c_int, 3))) + @as(c_int, 2))))] = @bitCast(@as(i8, @truncate(@as(c_int, @as(u16, value)) >> @intCast(@as(c_int, 8)))));
    nSettings += 1;
    buf[@as(c_int, 2)] = @bitCast(@as(i8, @truncate(nSettings * @as(c_int, 3))));
    if (SetFeatureReport(device, @ptrCast(@alignCast(&buf)), @as(c_int, 3) + (nSettings * @as(c_int, 3))) < @as(c_int, 0)) {
        return SDL_SetError_REAL("Couldn't write feature report");
    }
    return @"true" != 0;
}
pub fn SDL_HomeLEDHintChanged(userdata: ?*anyopaque, _: [*c]const u8, _: [*c]const u8, hint: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSteam_Context = @ptrCast(@alignCast(userdata));
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
        _ = SetHomeLED(ctx.*.device, @bitCast(@as(i8, @truncate(value))));
    }
}
pub fn HIDAPI_DriverSteam_OpenJoystick(device: [*c]SDL_HIDAPI_Device, joystick: [*c]SDL_Joystick) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSteam_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    var update_rate_in_hz: f32 = 0.0;
    _ = &update_rate_in_hz;
    SDL_AssertJoysticksLocked();
    ctx.*.report_sensors = @"false" != 0;
    _ = memset(@ptrCast(@alignCast(&ctx.*.m_assembler)), 0, @sizeOf(@TypeOf(ctx.*.m_assembler)));
    _ = memset(@ptrCast(@alignCast(&ctx.*.m_state)), 0, @sizeOf(@TypeOf(ctx.*.m_state)));
    _ = memset(@ptrCast(@alignCast(&ctx.*.m_last_state)), 0, @sizeOf(@TypeOf(ctx.*.m_last_state)));
    if (!ResetSteamController(device, @"false" != 0, &ctx.*.update_rate_in_us)) {
        _ = SDL_SetError_REAL("Couldn't reset controller");
        return @"false" != 0;
    }
    if (ctx.*.update_rate_in_us > @as(u32, 0)) {
        update_rate_in_hz = @as(f32, 1000000.0) / @as(f32, @floatFromInt(ctx.*.update_rate_in_us));
    }
    InitializeSteamControllerPacketAssembler(&ctx.*.m_assembler, device.*.is_bluetooth);
    joystick.*.nbuttons = SDL_GAMEPAD_NUM_STEAM_BUTTONS;
    joystick.*.naxes = SDL_GAMEPAD_AXIS_COUNT;
    joystick.*.nhats = 1;
    if (IsDongle(device.*.product_id)) {
        joystick.*.connection_state = SDL_JOYSTICK_CONNECTION_WIRELESS;
    }
    SDL_PrivateJoystickAddSensor(joystick, SDL_SENSOR_GYRO, update_rate_in_hz);
    SDL_PrivateJoystickAddSensor(joystick, SDL_SENSOR_ACCEL, update_rate_in_hz);
    SDL_PrivateJoystickAddTouchpad(joystick, 1);
    SDL_PrivateJoystickAddTouchpad(joystick, 1);
    _ = SDL_AddHintCallback_REAL("SDL_JOYSTICK_HIDAPI_STEAM_HOME_LED", SDL_HomeLEDHintChanged, @ptrCast(@alignCast(ctx)));
    return @"true" != 0;
}
pub fn HIDAPI_DriverSteam_RumbleJoystick(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: Uint16, _: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverSteam_RumbleJoystickTriggers(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: Uint16, _: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverSteam_GetJoystickCapabilities(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    return 0;
}
pub fn HIDAPI_DriverSteam_SetJoystickLED(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: Uint8, _: Uint8, _: Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverSteam_SendJoystickEffect(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, data: ?*const anyopaque, size: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (size == @as(c_int, 65)) {
        if (SetFeatureReport(device, @ptrCast(@alignCast(data)), size) < @as(c_int, 0)) {
            return SDL_SetError_REAL("Couldn't write feature report");
        }
        return @"true" != 0;
    }
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverSteam_SetSensorsEnabled(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, enabled: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSteam_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    var buf: [65]u8 = undefined;
    _ = &buf;
    var nSettings: c_int = 0;
    _ = &nSettings;
    _ = memset(@ptrCast(@alignCast(&buf)), 0, @sizeOf(@TypeOf(buf)));
    buf[@as(c_int, 1)] = ID_SET_SETTINGS_VALUES;
    if (enabled) {
        buf[@bitCast(@as(isize, @intCast(@as(c_int, 3) + (nSettings * @as(c_int, 3)))))] = SETTING_IMU_MODE;
        buf[@bitCast(@as(isize, @intCast((@as(c_int, 3) + (nSettings * @as(c_int, 3))) + @as(c_int, 1))))] = @bitCast(@as(i8, @truncate((@as(c_int, @as(u16, @bitCast(@as(c_short, @truncate(SETTING_GYRO_MODE_SEND_RAW_ACCEL))))) | SETTING_GYRO_MODE_SEND_RAW_GYRO) & @as(c_int, 255))));
        buf[@bitCast(@as(isize, @intCast((@as(c_int, 3) + (nSettings * @as(c_int, 3))) + @as(c_int, 2))))] = @bitCast(@as(i8, @truncate((@as(c_int, @as(u16, @bitCast(@as(c_short, @truncate(SETTING_GYRO_MODE_SEND_RAW_ACCEL))))) | SETTING_GYRO_MODE_SEND_RAW_GYRO) >> @intCast(@as(c_int, 8)))));
        nSettings += 1;
    } else {
        buf[@bitCast(@as(isize, @intCast(@as(c_int, 3) + (nSettings * @as(c_int, 3)))))] = SETTING_IMU_MODE;
        buf[@bitCast(@as(isize, @intCast((@as(c_int, 3) + (nSettings * @as(c_int, 3))) + @as(c_int, 1))))] = @bitCast(@as(i8, @truncate(@as(c_int, @as(u16, @bitCast(@as(c_short, @truncate(SETTING_GYRO_MODE_OFF))))) & @as(c_int, 255))));
        buf[@bitCast(@as(isize, @intCast((@as(c_int, 3) + (nSettings * @as(c_int, 3))) + @as(c_int, 2))))] = @bitCast(@as(i8, @truncate(@as(c_int, @as(u16, @bitCast(@as(c_short, @truncate(SETTING_GYRO_MODE_OFF))))) >> @intCast(@as(c_int, 8)))));
        nSettings += 1;
    }
    buf[@as(c_int, 2)] = @bitCast(@as(i8, @truncate(nSettings * @as(c_int, 3))));
    if (SetFeatureReport(device, @ptrCast(@alignCast(&buf)), @as(c_int, 3) + (nSettings * @as(c_int, 3))) < @as(c_int, 0)) {
        return SDL_SetError_REAL("Couldn't write feature report");
    }
    ctx.*.report_sensors = enabled;
    return @"true" != 0;
}
pub fn ControllerConnected(device: [*c]SDL_HIDAPI_Device, joystick: [*c][*c]SDL_Joystick) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSteam_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    if (!HIDAPI_JoystickConnected(device, null)) {
        return @"false" != 0;
    }
    HIDAPI_DriverSteam_CommitPairing(ctx);
    joystick.* = SDL_GetJoystickFromID_REAL(device.*.joysticks[@as(c_int, 0)]);
    ctx.*.connected = @"true" != 0;
    return @"true" != 0;
}
pub fn FilterTouch(newValue: f32, oldValue: f32) callconv(.c) f32 {
    @setEvalBranchQuota(100000);
    const jitter: f32 = @as(f32, 256.0) / @as(f32, @floatFromInt(@as(c_int, 1) << @intCast(@as(c_int, 16))));
    _ = &jitter;
    if ((newValue > (oldValue - (jitter * @as(f32, 0.5)))) and (newValue < (oldValue + (jitter * @as(f32, 0.5))))) {
        return oldValue;
    }
    if ((newValue > (oldValue - jitter)) and (newValue < (oldValue + jitter))) {
        return (oldValue * @as(f32, 0.75)) + (newValue * @as(f32, 0.25));
    }
    if ((newValue > (oldValue - (jitter * @as(f32, 2.0)))) and (newValue < (oldValue + (jitter * @as(f32, 2.0))))) {
        return (oldValue + newValue) * @as(f32, 0.5);
    }
    return newValue;
}
pub fn ControllerDisconnected(device: [*c]SDL_HIDAPI_Device, joystick: [*c][*c]SDL_Joystick) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSteam_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    if (device.*.joysticks != null) {
        HIDAPI_JoystickDisconnected(device, device.*.joysticks[@as(c_int, 0)]);
    }
    ctx.*.connected = @"false" != 0;
    joystick.* = null;
}
pub fn HIDAPI_DriverSteam_UpdateDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSteam_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    var joystick: [*c]SDL_Joystick = null;
    _ = &joystick;
    if (device.*.num_joysticks > @as(c_int, 0)) {
        joystick = SDL_GetJoystickFromID_REAL(device.*.joysticks[@as(c_int, 0)]);
    }
    if (ctx.*.pairing_time != 0) {
        HIDAPI_DriverSteam_RenewPairingState(ctx);
    }
    while (true) {
        var data: [128]u8 = undefined;
        _ = &data;
        var r: c_int = undefined;
        _ = &r;
        var nPacketLength: c_int = undefined;
        _ = &nPacketLength;
        var pPacket: [*c]const Uint8 = undefined;
        _ = &pPacket;
        r = ReadSteamController(device.*.dev, @ptrCast(@alignCast(&data)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(data))))));
        if (r == @as(c_int, 0)) {
            break;
        }
        if (r < @as(c_int, 0)) {
            ControllerDisconnected(device, &joystick);
            return @"false" != 0;
        }
        nPacketLength = WriteSegmentToSteamControllerPacketAssembler(&ctx.*.m_assembler, @ptrCast(@alignCast(&data)), r);
        pPacket = @ptrCast(@alignCast(&ctx.*.m_assembler.uBuffer));
        if ((nPacketLength > @as(c_int, 0)) and UpdateSteamControllerState(pPacket, nPacketLength, &ctx.*.m_state)) {
            var timestamp: Uint64 = SDL_GetTicksNS_REAL();
            _ = &timestamp;
            if (!ctx.*.connected) {
                _ = ControllerConnected(device, &joystick);
            }
            if (!(joystick != null)) {
                continue;
            }
            if (ctx.*.m_state.ulButtons != ctx.*.m_last_state.ulButtons) {
                var hat: Uint8 = 0;
                _ = &hat;
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SOUTH, (ctx.*.m_state.ulButtons & @as(Uint64, STEAM_BUTTON_SOUTH_MASK)) != @as(Uint64, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_EAST, (ctx.*.m_state.ulButtons & @as(Uint64, STEAM_BUTTON_EAST_MASK)) != @as(Uint64, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_WEST, (ctx.*.m_state.ulButtons & @as(Uint64, STEAM_BUTTON_WEST_MASK)) != @as(Uint64, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_NORTH, (ctx.*.m_state.ulButtons & @as(Uint64, STEAM_BUTTON_NORTH_MASK)) != @as(Uint64, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_SHOULDER, (ctx.*.m_state.ulButtons & @as(Uint64, STEAM_LEFT_BUMPER_MASK)) != @as(Uint64, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER, (ctx.*.m_state.ulButtons & @as(Uint64, STEAM_RIGHT_BUMPER_MASK)) != @as(Uint64, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_BACK, (ctx.*.m_state.ulButtons & @as(Uint64, STEAM_BUTTON_MENU_MASK)) != @as(Uint64, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_START, (ctx.*.m_state.ulButtons & @as(Uint64, STEAM_BUTTON_ESCAPE_MASK)) != @as(Uint64, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_GUIDE, (ctx.*.m_state.ulButtons & @as(Uint64, STEAM_BUTTON_STEAM_MASK)) != @as(Uint64, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_STICK, (ctx.*.m_state.ulButtons & @as(Uint64, STEAM_JOYSTICK_BUTTON_MASK)) != @as(Uint64, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_STEAM_LEFT_PADDLE, (ctx.*.m_state.ulButtons & @as(Uint64, STEAM_BUTTON_BACK_LEFT_MASK)) != @as(Uint64, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_STEAM_RIGHT_PADDLE, (ctx.*.m_state.ulButtons & @as(Uint64, STEAM_BUTTON_BACK_RIGHT_MASK)) != @as(Uint64, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_STICK, (ctx.*.m_state.ulButtons & @as(Uint64, STEAM_BUTTON_RIGHTPAD_CLICKED_MASK)) != @as(Uint64, 0));
                if ((ctx.*.m_state.ulButtons & @as(Uint64, STEAM_DPAD_UP_MASK)) != 0) {
                    {
                        const ref = &hat;
                        ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_UP);
                    }
                }
                if ((ctx.*.m_state.ulButtons & @as(Uint64, STEAM_DPAD_DOWN_MASK)) != 0) {
                    {
                        const ref = &hat;
                        ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_DOWN);
                    }
                }
                if ((ctx.*.m_state.ulButtons & @as(Uint64, STEAM_DPAD_LEFT_MASK)) != 0) {
                    {
                        const ref = &hat;
                        ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_LEFT);
                    }
                }
                if ((ctx.*.m_state.ulButtons & @as(Uint64, STEAM_DPAD_RIGHT_MASK)) != 0) {
                    {
                        const ref = &hat;
                        ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_RIGHT);
                    }
                }
                SDL_SendJoystickHat(timestamp, joystick, 0, hat);
            }
            SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFT_TRIGGER, @truncate((@as(c_int, ctx.*.m_state.sTriggerL) * @as(c_int, 2)) - @as(c_int, 32768)));
            SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHT_TRIGGER, @truncate((@as(c_int, ctx.*.m_state.sTriggerR) * @as(c_int, 2)) - @as(c_int, 32768)));
            SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, ctx.*.m_state.sLeftStickX);
            SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, @truncate(~@as(c_int, ctx.*.m_state.sLeftStickY)));
            SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, ctx.*.m_state.sRightPadX);
            SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, @truncate(~@as(c_int, ctx.*.m_state.sRightPadY)));
            {
                const down: bool = (if ((ctx.*.m_state.ulButtons & @as(Uint64, STEAM_LEFTPAD_FINGERDOWN_MASK)) != 0) @"true" else @"false") != 0;
                _ = &down;
                if (down or ctx.*.left_touch_down) {
                    const clicked: bool = (if ((ctx.*.m_state.ulButtons & @as(Uint64, STEAM_BUTTON_LEFTPAD_CLICKED_MASK)) != 0) @"true" else @"false") != 0;
                    _ = &clicked;
                    const leftX: f32 = (@as(f32, @floatFromInt(ctx.*.m_state.sLeftPadX)) / @as(f32, @floatFromInt(@as(c_int, 1) << @intCast(@as(c_int, 16))))) + @as(f32, 0.5);
                    _ = &leftX;
                    const leftY: f32 = (-@as(f32, @floatFromInt(ctx.*.m_state.sLeftPadY)) / @as(f32, @floatFromInt(@as(c_int, 1) << @intCast(@as(c_int, 16))))) + @as(f32, 0.5);
                    _ = &leftY;
                    var pressure: f32 = if (down) @as(f32, 0.5) else @as(f32, 0.0);
                    _ = &pressure;
                    if (clicked) {
                        pressure += 0.5;
                    }
                    if (down) {
                        ctx.*.left_touch_x = FilterTouch(leftX, ctx.*.left_touch_x);
                        ctx.*.left_touch_y = FilterTouch(leftY, ctx.*.left_touch_y);
                    }
                    SDL_SendJoystickTouchpad(timestamp, joystick, 0, 0, down, ctx.*.left_touch_x, ctx.*.left_touch_y, pressure);
                    ctx.*.left_touch_down = down;
                }
            }
            {
                const down: bool = (if ((ctx.*.m_state.ulButtons & @as(Uint64, STEAM_RIGHTPAD_FINGERDOWN_MASK)) != 0) @"true" else @"false") != 0;
                _ = &down;
                if (down or ctx.*.right_touch_down) {
                    const clicked: bool = (if ((ctx.*.m_state.ulButtons & @as(Uint64, STEAM_BUTTON_RIGHTPAD_CLICKED_MASK)) != 0) @"true" else @"false") != 0;
                    _ = &clicked;
                    const rightX: f32 = (@as(f32, @floatFromInt(ctx.*.m_state.sRightPadX)) / @as(f32, @floatFromInt(@as(c_int, 1) << @intCast(@as(c_int, 16))))) + @as(f32, 0.5);
                    _ = &rightX;
                    const rightY: f32 = (-@as(f32, @floatFromInt(ctx.*.m_state.sRightPadY)) / @as(f32, @floatFromInt(@as(c_int, 1) << @intCast(@as(c_int, 16))))) + @as(f32, 0.5);
                    _ = &rightY;
                    var pressure: f32 = if (down) @as(f32, 0.5) else @as(f32, 0.0);
                    _ = &pressure;
                    if (clicked) {
                        pressure += 0.5;
                    }
                    if (down) {
                        ctx.*.right_touch_x = FilterTouch(rightX, ctx.*.right_touch_x);
                        ctx.*.right_touch_y = FilterTouch(rightY, ctx.*.right_touch_y);
                    }
                    SDL_SendJoystickTouchpad(timestamp, joystick, 1, 0, down, ctx.*.right_touch_x, ctx.*.right_touch_y, pressure);
                    ctx.*.right_touch_down = down;
                }
            }
            if (ctx.*.report_sensors) {
                var values: [3]f32 = undefined;
                _ = &values;
                ctx.*.sensor_timestamp +%= @as(Uint64, ctx.*.update_rate_in_us) *% @as(Uint64, SDL_NS_PER_US);
                values[@as(c_int, 0)] = (@as(f32, @floatFromInt(@as(c_int, ctx.*.m_state.sGyroX))) / @as(f32, 32768.0)) * (@as(f32, 2000.0) * (SDL_PI_F / @as(f32, 180.0)));
                values[@as(c_int, 1)] = (@as(f32, @floatFromInt(@as(c_int, ctx.*.m_state.sGyroZ))) / @as(f32, 32768.0)) * (@as(f32, 2000.0) * (SDL_PI_F / @as(f32, 180.0)));
                values[@as(c_int, 2)] = (@as(f32, @floatFromInt(@as(c_int, ctx.*.m_state.sGyroY))) / @as(f32, 32768.0)) * (@as(f32, 2000.0) * (SDL_PI_F / @as(f32, 180.0)));
                SDL_SendJoystickSensor(timestamp, joystick, SDL_SENSOR_GYRO, ctx.*.sensor_timestamp, @ptrCast(@alignCast(&values)), 3);
                values[@as(c_int, 0)] = ((@as(f32, @floatFromInt(@as(c_int, ctx.*.m_state.sAccelX))) / @as(f32, 32768.0)) * @as(f32, 2.0)) * SDL_STANDARD_GRAVITY;
                values[@as(c_int, 1)] = ((@as(f32, @floatFromInt(@as(c_int, ctx.*.m_state.sAccelZ))) / @as(f32, 32768.0)) * @as(f32, 2.0)) * SDL_STANDARD_GRAVITY;
                values[@as(c_int, 2)] = ((@as(f32, @floatFromInt(-@as(c_int, ctx.*.m_state.sAccelY))) / @as(f32, 32768.0)) * @as(f32, 2.0)) * SDL_STANDARD_GRAVITY;
                SDL_SendJoystickSensor(timestamp, joystick, SDL_SENSOR_ACCEL, ctx.*.sensor_timestamp, @ptrCast(@alignCast(&values)), 3);
            }
            ctx.*.m_last_state = ctx.*.m_state;
        } else if (!ctx.*.connected and ((((((nPacketLength >= @as(c_int, 5)) and (@as(c_int, pPacket[@as(c_int, 0)]) == @as(c_int, 1))) and (@as(c_int, pPacket[@as(c_int, 1)]) == @as(c_int, 0))) and (@as(c_int, pPacket[@as(c_int, 2)]) == @as(c_int, 3))) and (@as(c_int, pPacket[@as(c_int, 3)]) >= @as(c_int, 1))) and (@as(c_int, pPacket[@as(c_int, 4)]) != D0G_WIRELESS_DISCONNECTED))) {
            _ = ControllerConnected(device, &joystick);
        } else if (ctx.*.connected and ((((((nPacketLength >= @as(c_int, 5)) and (@as(c_int, pPacket[@as(c_int, 0)]) == @as(c_int, 1))) and (@as(c_int, pPacket[@as(c_int, 1)]) == @as(c_int, 0))) and (@as(c_int, pPacket[@as(c_int, 2)]) == @as(c_int, 3))) and (@as(c_int, pPacket[@as(c_int, 3)]) >= @as(c_int, 1))) and (@as(c_int, pPacket[@as(c_int, 4)]) == D0G_WIRELESS_DISCONNECTED))) {
            ControllerDisconnected(device, &joystick);
        }
    }
    return @"true" != 0;
}
pub fn HIDAPI_DriverSteam_CloseJoystick(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSteam_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    SDL_RemoveHintCallback_REAL("SDL_JOYSTICK_HIDAPI_STEAM_HOME_LED", SDL_HomeLEDHintChanged, @ptrCast(@alignCast(ctx)));
    CloseSteamController(device);
}
pub fn HIDAPI_DriverSteam_FreeDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSteam_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    if (IsDongle(device.*.product_id)) {
        SDL_RemoveHintCallback_REAL("SDL_JOYSTICK_HIDAPI_STEAM_PAIRING_ENABLED", SDL_PairingEnabledHintChanged, @ptrCast(@alignCast(ctx)));
        HIDAPI_DriverSteam_SetPairingState(ctx, @"false" != 0);
    }
}
pub export var SDL_HIDAPI_DriverSteam: SDL_HIDAPI_DeviceDriver = SDL_HIDAPI_DeviceDriver{
    .name = "SDL_JOYSTICK_HIDAPI_STEAM",
    .enabled = @"true" != 0,
    .RegisterHints = HIDAPI_DriverSteam_RegisterHints,
    .UnregisterHints = HIDAPI_DriverSteam_UnregisterHints,
    .IsEnabled = HIDAPI_DriverSteam_IsEnabled,
    .IsSupportedDevice = HIDAPI_DriverSteam_IsSupportedDevice,
    .InitDevice = HIDAPI_DriverSteam_InitDevice,
    .GetDevicePlayerIndex = HIDAPI_DriverSteam_GetDevicePlayerIndex,
    .SetDevicePlayerIndex = HIDAPI_DriverSteam_SetDevicePlayerIndex,
    .UpdateDevice = HIDAPI_DriverSteam_UpdateDevice,
    .OpenJoystick = HIDAPI_DriverSteam_OpenJoystick,
    .RumbleJoystick = HIDAPI_DriverSteam_RumbleJoystick,
    .RumbleJoystickTriggers = HIDAPI_DriverSteam_RumbleJoystickTriggers,
    .GetJoystickCapabilities = HIDAPI_DriverSteam_GetJoystickCapabilities,
    .SetJoystickLED = HIDAPI_DriverSteam_SetJoystickLED,
    .SendJoystickEffect = HIDAPI_DriverSteam_SendJoystickEffect,
    .SetJoystickSensorsEnabled = HIDAPI_DriverSteam_SetSensorsEnabled,
    .CloseJoystick = HIDAPI_DriverSteam_CloseJoystick,
    .FreeDevice = HIDAPI_DriverSteam_FreeDevice,
};

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_PI_F = @as(f32, 3.141592653589793238462643383279502884);
pub const SDL_STANDARD_GRAVITY = @as(f32, 9.80665);
pub const SDL_HAT_UP = @as(c_uint, 0x01);
pub const SDL_HAT_RIGHT = @as(c_uint, 0x02);
pub const SDL_HAT_DOWN = @as(c_uint, 0x04);
pub const SDL_HAT_LEFT = @as(c_uint, 0x08);
pub const SDL_NS_PER_US = @as(c_int, 1000);
pub const USB_PRODUCT_VALVE_STEAM_CONTROLLER_DONGLE = @as(c_int, 0x1142);
pub const PAIRING_STATE_DURATION_SECONDS = @as(c_int, 60);
pub const k_ValveInReportMsgVersion = @as(c_int, 0x01);
pub const STEAM_RIGHT_BUMPER_MASK = @as(c_int, 0x00000004);
pub const STEAM_LEFT_BUMPER_MASK = @as(c_int, 0x00000008);
pub const STEAM_BUTTON_NORTH_MASK = @as(c_int, 0x00000010);
pub const STEAM_BUTTON_EAST_MASK = @as(c_int, 0x00000020);
pub const STEAM_BUTTON_WEST_MASK = @as(c_int, 0x00000040);
pub const STEAM_BUTTON_SOUTH_MASK = @as(c_int, 0x00000080);
pub const STEAM_DPAD_UP_MASK = @as(c_int, 0x00000100);
pub const STEAM_DPAD_RIGHT_MASK = @as(c_int, 0x00000200);
pub const STEAM_DPAD_LEFT_MASK = @as(c_int, 0x00000400);
pub const STEAM_DPAD_DOWN_MASK = @as(c_int, 0x00000800);
pub const STEAM_BUTTON_MENU_MASK = @as(c_int, 0x00001000);
pub const STEAM_BUTTON_STEAM_MASK = @as(c_int, 0x00002000);
pub const STEAM_BUTTON_ESCAPE_MASK = @as(c_int, 0x00004000);
pub const STEAM_BUTTON_BACK_LEFT_MASK = __helpers.promoteIntLiteral(c_int, 0x00008000, .hex);
pub const STEAM_BUTTON_BACK_RIGHT_MASK = __helpers.promoteIntLiteral(c_int, 0x00010000, .hex);
pub const STEAM_BUTTON_LEFTPAD_CLICKED_MASK = __helpers.promoteIntLiteral(c_int, 0x00020000, .hex);
pub const STEAM_BUTTON_RIGHTPAD_CLICKED_MASK = __helpers.promoteIntLiteral(c_int, 0x00040000, .hex);
pub const STEAM_LEFTPAD_FINGERDOWN_MASK = __helpers.promoteIntLiteral(c_int, 0x00080000, .hex);
pub const STEAM_RIGHTPAD_FINGERDOWN_MASK = __helpers.promoteIntLiteral(c_int, 0x00100000, .hex);
pub const STEAM_JOYSTICK_BUTTON_MASK = __helpers.promoteIntLiteral(c_int, 0x00400000, .hex);
pub const STEAM_LEFTPAD_AND_JOYSTICK_MASK = __helpers.promoteIntLiteral(c_int, 0x00800000, .hex);
pub const D0G_WIRELESS_DISCONNECTED = @as(c_int, 1);
pub const MAX_REPORT_SEGMENT_PAYLOAD_SIZE = @as(c_int, 18);
pub inline fn clamp(val: anytype, min: anytype, max: anytype) @TypeOf(if (__helpers.cast(bool, val > max)) max else if (__helpers.cast(bool, val < min)) min else val) {
    @setEvalBranchQuota(100000);
    _ = &val;
    _ = &min;
    _ = &max;
    return if (__helpers.cast(bool, val > max)) max else if (__helpers.cast(bool, val < min)) min else val;
}
pub const REPORT_SEGMENT_DATA_FLAG = @as(c_int, 0x80);
pub const REPORT_SEGMENT_LAST_FLAG = @as(c_int, 0x40);
pub const BLE_REPORT_NUMBER = @as(c_int, 0x03);
pub const STEAMCONTROLLER_TRIGGER_MAX_ANALOG = @as(c_int, 26000);
pub const RADIO_WORKAROUND_SLEEP_ATTEMPTS = @as(c_int, 50);
pub const RADIO_WORKAROUND_SLEEP_DURATION_US = @as(c_int, 500);
pub const BLE_MAX_READ_RETRIES = @as(c_int, 8);
