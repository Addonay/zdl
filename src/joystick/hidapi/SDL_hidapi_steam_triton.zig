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
pub const Uint8 = u8;
pub const Sint16 = i16;
pub const Uint16 = u16;
pub const Uint32 = u32;
pub const Uint64 = u64;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub const struct_SDL_AtomicInt = extern struct {
    value: c_int = 0,
};
pub const SDL_AtomicInt = struct_SDL_AtomicInt;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub extern fn SDL_GetError_REAL() [*c]const u8;
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
pub const SDL_GAMEPAD_CAPSENSE_LEFT_STICK: c_int = 0;
pub const SDL_GAMEPAD_CAPSENSE_RIGHT_STICK: c_int = 1;
pub const SDL_GAMEPAD_CAPSENSE_LEFT_GRIP: c_int = 2;
pub const SDL_GAMEPAD_CAPSENSE_RIGHT_GRIP: c_int = 3;
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
pub extern fn SDL_hid_write_REAL(dev: ?*SDL_hid_device, data: [*c]const u8, length: usize) c_int;
pub extern fn SDL_hid_read_REAL(dev: ?*SDL_hid_device, data: [*c]u8, length: usize) c_int;
pub extern fn SDL_hid_send_feature_report_REAL(dev: ?*SDL_hid_device, data: [*c]const u8, length: usize) c_int;
pub extern fn SDL_GetHintBoolean_REAL(name: [*c]const u8, default_value: bool) bool;
pub const SDL_HintCallback = ?*const fn (userdata: ?*anyopaque, name: [*c]const u8, oldValue: [*c]const u8, newValue: [*c]const u8) callconv(.c) void;
pub extern fn SDL_AddHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) bool;
pub extern fn SDL_RemoveHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) void;
pub const SDL_LOG_CATEGORY_INPUT: c_int = 7;
pub extern fn SDL_LogError_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_GetTicks_REAL() Uint64;
pub extern fn SDL_GetTicksNS_REAL() Uint64;
pub extern fn SDL_AssertJoysticksLocked() void;
pub extern fn SDL_IsJoystickSteamTriton(vendor_id: Uint16, product_id: Uint16) bool;
pub extern fn SDL_PrivateJoystickAddTouchpad(joystick: [*c]SDL_Joystick, nfingers: c_int) void;
pub extern fn SDL_PrivateJoystickAddSensor(joystick: [*c]SDL_Joystick, @"type": SDL_SensorType, rate: f32) void;
pub extern fn SDL_PrivateJoystickAddCapSense(joystick: [*c]SDL_Joystick, @"type": SDL_GamepadCapSenseType) void;
pub extern fn SDL_SendJoystickAxis(timestamp: Uint64, joystick: [*c]SDL_Joystick, axis: Uint8, value: Sint16) void;
pub extern fn SDL_SendJoystickHat(timestamp: Uint64, joystick: [*c]SDL_Joystick, hat: Uint8, value: Uint8) void;
pub extern fn SDL_SendJoystickButton(timestamp: Uint64, joystick: [*c]SDL_Joystick, button: Uint8, down: bool) void;
pub extern fn SDL_SendJoystickTouchpad(timestamp: Uint64, joystick: [*c]SDL_Joystick, touchpad: c_int, finger: c_int, down: bool, x: f32, y: f32, pressure: f32) void;
pub extern fn SDL_SendJoystickSensor(timestamp: Uint64, joystick: [*c]SDL_Joystick, @"type": SDL_SensorType, sensor_timestamp: Uint64, data: [*c]const f32, num_values: c_int) void;
pub extern fn SDL_SendJoystickCapSense(timestamp: Uint64, joystick: [*c]SDL_Joystick, @"type": SDL_GamepadCapSenseType, down: bool) void;
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
pub extern fn HIDAPI_JoystickConnected(device: [*c]SDL_HIDAPI_Device, pJoystickID: [*c]SDL_JoystickID) bool;
pub extern fn HIDAPI_JoystickDisconnected(device: [*c]SDL_HIDAPI_Device, joystickID: SDL_JoystickID) void;
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
const struct_unnamed_21 = extern struct {
    speed: u16 align(1) = 0,
    gain: i8 = 0,
};
pub const MsgHapticRumble = extern struct {
    type: u8 align(1) = 0,
    intensity: u16 align(1) = 0,
    left: struct_unnamed_21 = @import("std").mem.zeroes(struct_unnamed_21),
    right: struct_unnamed_21 = @import("std").mem.zeroes(struct_unnamed_21),
};
pub const MsgHapticPulse = extern struct {
    side: u8 align(1) = 0,
    on_us: u16 align(1) = 0,
    off_us: u16 align(1) = 0,
    repeat_count: u16 align(1) = 0,
};
pub const MsgHapticCommand = extern struct {
    side: u8 = 0,
    command: u8 = 0,
    gain_db: i8 = 0,
};
pub const MsgHapticLfoTone = extern struct {
    side: u8 align(1) = 0,
    gain_db: i8 = 0,
    frequency: u16 align(1) = 0,
    duration_ms: u16 align(1) = 0,
    lfo_freq: u16 align(1) = 0,
    lfo_depth: u8 = 0,
};
const struct_unnamed_22 = extern struct {
    frequency: u16 align(1) = 0,
};
pub const MsgHapticLogSweep = extern struct {
    side: u8 align(1) = 0,
    gain_db: i8 = 0,
    duration_ms: u16 align(1) = 0,
    start: struct_unnamed_22 = @import("std").mem.zeroes(struct_unnamed_22),
    end: struct_unnamed_22 = @import("std").mem.zeroes(struct_unnamed_22),
};
pub const struct_m = extern struct {
    side: u8 = 0,
    script_id: u8 = 0,
    gain_db: i8 = 0,
};
pub const MsgHapticScript = struct_m;
pub const ID_OUT_REPORT_HAPTIC_RUMBLE: c_int = 128;
const union_unnamed_23 = extern union {
    hapticRumble: MsgHapticRumble,
    hapticPulse: MsgHapticPulse,
    hapticCommand: MsgHapticCommand,
    hapticLfoTone: MsgHapticLfoTone,
    hapticLogSweep: MsgHapticLogSweep,
    hapticScript: MsgHapticScript,
};
pub const OutputReportMsg = extern struct {
    report_id: u8 = 0,
    payload: union_unnamed_23 = @import("std").mem.zeroes(union_unnamed_23),
};
pub const ID_TRITON_CONTROLLER_STATE: c_int = 66;
pub const ID_TRITON_BATTERY_STATUS: c_int = 67;
pub const ID_TRITON_CONTROLLER_STATE_BLE: c_int = 69;
pub const ID_TRITON_WIRELESS_STATUS_X: c_int = 70;
pub const ID_TRITON_CONTROLLER_STATE_TIMESTAMP: c_int = 71;
pub const ID_TRITON_WIRELESS_STATUS: c_int = 121;
pub const k_ETritonWirelessStateDisconnect: c_int = 1;
pub const k_ETritonWirelessStateConnect: c_int = 2;
pub const TritonMTUIMUNoQuat_t = extern struct {
    timestamp: u32 align(1) = 0,
    sAccelX: c_short align(1) = 0,
    sAccelY: c_short align(1) = 0,
    sAccelZ: c_short align(1) = 0,
    sGyroX: c_short align(1) = 0,
    sGyroY: c_short align(1) = 0,
    sGyroZ: c_short align(1) = 0,
};
pub const TritonMTUIMUNoQuat32usTS_t = extern struct {
    timestamp: u16 align(1) = 0,
    sAccelX: c_short align(1) = 0,
    sAccelY: c_short align(1) = 0,
    sAccelZ: c_short align(1) = 0,
    sGyroX: c_short align(1) = 0,
    sGyroY: c_short align(1) = 0,
    sGyroZ: c_short align(1) = 0,
};
pub const TritonMTUNoQuat_t = extern struct {
    seq_num: u8 align(1) = 0,
    buttons: u32 align(1) = 0,
    sTriggerLeft: c_short align(1) = 0,
    sTriggerRight: c_short align(1) = 0,
    sLeftStickX: c_short align(1) = 0,
    sLeftStickY: c_short align(1) = 0,
    sRightStickX: c_short align(1) = 0,
    sRightStickY: c_short align(1) = 0,
    sLeftPadX: c_short align(1) = 0,
    sLeftPadY: c_short align(1) = 0,
    unPressureLeft: c_ushort align(1) = 0,
    sRightPadX: c_short align(1) = 0,
    sRightPadY: c_short align(1) = 0,
    unPressureRight: c_ushort align(1) = 0,
    imu: TritonMTUIMUNoQuat_t = @import("std").mem.zeroes(TritonMTUIMUNoQuat_t),
};
pub const TritonMTUNoQuat32TS_t = extern struct {
    seq_num: u8 align(1) = 0,
    buttons: u32 align(1) = 0,
    sTriggerLeft: c_short align(1) = 0,
    sTriggerRight: c_short align(1) = 0,
    sLeftStickX: c_short align(1) = 0,
    sLeftStickY: c_short align(1) = 0,
    sRightStickX: c_short align(1) = 0,
    sRightStickY: c_short align(1) = 0,
    unTrackpadTimestamp: c_ushort align(1) = 0,
    sLeftPadX: c_short align(1) = 0,
    sLeftPadY: c_short align(1) = 0,
    unPressureLeft: c_ushort align(1) = 0,
    sRightPadX: c_short align(1) = 0,
    sRightPadY: c_short align(1) = 0,
    unPressureRight: c_ushort align(1) = 0,
    imu: TritonMTUIMUNoQuat32usTS_t = @import("std").mem.zeroes(TritonMTUIMUNoQuat32usTS_t),
};
pub const k_EChargeStateDischarging: c_int = 1;
pub const k_EChargeStateCharging: c_int = 2;
pub const k_EChargeStateChargingDone: c_int = 4;
pub const TritonBatteryStatus_t = extern struct {
    ucChargeState: u8 align(1) = 0,
    ucBatteryLevel: u8 = 0,
    sBatteryVoltage: c_ushort align(1) = 0,
    sSystemVoltage: c_ushort align(1) = 0,
    sInputVoltage: c_ushort align(1) = 0,
    sCurrent: c_ushort align(1) = 0,
    sInputCurrent: c_ushort align(1) = 0,
    sTemperature: c_ushort align(1) = 0,
};
pub const TritonWirelessStatus_t = extern struct {
    state: u8 = 0,
};
pub const ID_SET_SETTINGS_VALUES: c_int = 135;
pub const LIZARD_MODE_OFF: c_int = 0;
pub const SETTING_LIZARD_MODE: c_int = 9;
pub const SETTING_IMU_MODE: c_int = 48;
pub const SETTING_GYRO_MODE_OFF: c_int = 0;
pub const SETTING_GYRO_MODE_SEND_RAW_ACCEL: c_int = 8;
pub const SETTING_GYRO_MODE_SEND_RAW_GYRO: c_int = 16;
pub const SDL_GAMEPAD_BUTTON_TRITON_QAM: c_int = 11;
pub const SDL_GAMEPAD_BUTTON_TRITON_RIGHT_PADDLE1: c_int = 12;
pub const SDL_GAMEPAD_BUTTON_TRITON_LEFT_PADDLE1: c_int = 13;
pub const SDL_GAMEPAD_BUTTON_TRITON_RIGHT_PADDLE2: c_int = 14;
pub const SDL_GAMEPAD_BUTTON_TRITON_LEFT_PADDLE2: c_int = 15;
pub const SDL_GAMEPAD_BUTTON_TRITON_RIGHT_TOUCHPAD: c_int = 16;
pub const SDL_GAMEPAD_BUTTON_TRITON_LEFT_TOUCHPAD: c_int = 17;
pub const SDL_GAMEPAD_NUM_TRITON_BUTTONS: c_int = 18;
pub const TRITON_LBUTTON_A: c_int = 1;
pub const TRITON_LBUTTON_B: c_int = 2;
pub const TRITON_LBUTTON_X: c_int = 4;
pub const TRITON_LBUTTON_Y: c_int = 8;
pub const TRITON_HBUTTON_QAM: c_int = 16;
pub const TRITON_LBUTTON_R3: c_int = 32;
pub const TRITON_LBUTTON_VIEW: c_int = 64;
pub const TRITON_HBUTTON_R4: c_int = 128;
pub const TRITON_LBUTTON_R5: c_int = 256;
pub const TRITON_LBUTTON_R: c_int = 512;
pub const TRITON_LBUTTON_DPAD_DOWN: c_int = 1024;
pub const TRITON_LBUTTON_DPAD_RIGHT: c_int = 2048;
pub const TRITON_LBUTTON_DPAD_LEFT: c_int = 4096;
pub const TRITON_LBUTTON_DPAD_UP: c_int = 8192;
pub const TRITON_LBUTTON_MENU: c_int = 16384;
pub const TRITON_LBUTTON_L3: c_int = 32768;
pub const TRITON_LBUTTON_STEAM: c_int = 65536;
pub const TRITON_HBUTTON_L4: c_int = 131072;
pub const TRITON_LBUTTON_L5: c_int = 262144;
pub const TRITON_LBUTTON_L: c_int = 524288;
pub const TRITON_RIGHT_JOYSTICK_TOUCH: c_int = 1048576;
pub const TRITON_RIGHT_TOUCHPAD_TOUCH: c_int = 2097152;
pub const TRITON_RIGHT_TOUCHPAD_CLICK: c_int = 4194304;
pub const TRITON_LEFT_JOYSTICK_TOUCH: c_int = 16777216;
pub const TRITON_LEFT_TOUCHPAD_TOUCH: c_int = 33554432;
pub const TRITON_LEFT_TOUCHPAD_CLICK: c_int = 67108864;
pub const TRITON_RIGHT_GRIP_TOUCH: c_int = 268435456;
pub const TRITON_LEFT_GRIP_TOUCH: c_int = 536870912;
pub const SDL_DriverSteamTriton_Context = extern struct {
    connected: bool = false,
    report_sensors: bool = false,
    last_sensor_tick16: Uint16 = 0,
    last_sensor_tick32: Uint32 = 0,
    sensor_timestamp_ns: Uint64 = 0,
    last_button_state: Uint64 = 0,
    last_lizard_update: Uint64 = 0,
    low_frequency_rumble: Uint16 = 0,
    high_frequency_rumble: Uint16 = 0,
    last_rumble_time: Uint64 = 0,
    left_touch_down: bool = false,
    left_touch_x: f32 = 0,
    left_touch_y: f32 = 0,
    right_touch_down: bool = false,
    right_touch_x: f32 = 0,
    right_touch_y: f32 = 0,
};
pub fn IsProteusDongle(product_id: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return (@as(c_int, product_id) == USB_PRODUCT_VALVE_STEAM_PROTEUS_DONGLE) or (@as(c_int, product_id) == USB_PRODUCT_VALVE_STEAM_NEREID_DONGLE);
}
pub fn DisableSteamTritonLizardMode(dev: ?*SDL_hid_device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var rc: c_int = undefined;
    _ = &rc;
    var buffer: [64]Uint8 = [1]Uint8{
        1,
    } ++ @as([63]Uint8, @splat(0));
    _ = &buffer;
    var msg: [*c]FeatureReportMsg = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&buffer))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))))));
    _ = &msg;
    msg.*.header.type = ID_SET_SETTINGS_VALUES;
    msg.*.header.length = @truncate(@as(c_ulong, 1) *% @sizeOf(ControllerSetting));
    msg.*.payload.setSettingsValues.settings[@as(c_int, 0)].settingNum = SETTING_LIZARD_MODE;
    msg.*.payload.setSettingsValues.settings[@as(c_int, 0)].settingValue = LIZARD_MODE_OFF;
    rc = SDL_hid_send_feature_report_REAL(dev, @ptrCast(@alignCast(&buffer)), @sizeOf(@TypeOf(buffer)));
    if (@as(c_ulong, @bitCast(@as(c_long, rc))) != @sizeOf(@TypeOf(buffer))) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn HIDAPI_DriverSteamTriton_HandleGenericState(ctx: [*c]SDL_DriverSteamTriton_Context, joystick: [*c]SDL_Joystick, timestamp: Uint64, pTritonReport: [*c]TritonMTUNoQuat_t) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (@as(Uint64, pTritonReport.*.buttons) != ctx.*.last_button_state) {
        var hat: Uint8 = 0;
        _ = &hat;
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SOUTH, (pTritonReport.*.buttons & @as(u32, TRITON_LBUTTON_A)) != @as(u32, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_EAST, (pTritonReport.*.buttons & @as(u32, TRITON_LBUTTON_B)) != @as(u32, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_WEST, (pTritonReport.*.buttons & @as(u32, TRITON_LBUTTON_X)) != @as(u32, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_NORTH, (pTritonReport.*.buttons & @as(u32, TRITON_LBUTTON_Y)) != @as(u32, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_SHOULDER, (pTritonReport.*.buttons & @as(u32, TRITON_LBUTTON_L)) != @as(u32, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER, (pTritonReport.*.buttons & @as(u32, TRITON_LBUTTON_R)) != @as(u32, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_BACK, (pTritonReport.*.buttons & @as(u32, TRITON_LBUTTON_MENU)) != @as(u32, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_START, (pTritonReport.*.buttons & @as(u32, TRITON_LBUTTON_VIEW)) != @as(u32, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_GUIDE, (pTritonReport.*.buttons & @as(u32, TRITON_LBUTTON_STEAM)) != @as(u32, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_TRITON_QAM, (pTritonReport.*.buttons & @as(u32, TRITON_HBUTTON_QAM)) != @as(u32, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_STICK, (pTritonReport.*.buttons & @as(u32, TRITON_LBUTTON_L3)) != @as(u32, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_STICK, (pTritonReport.*.buttons & @as(u32, TRITON_LBUTTON_R3)) != @as(u32, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_TRITON_RIGHT_PADDLE1, (pTritonReport.*.buttons & @as(u32, TRITON_HBUTTON_R4)) != @as(u32, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_TRITON_LEFT_PADDLE1, (pTritonReport.*.buttons & @as(u32, TRITON_HBUTTON_L4)) != @as(u32, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_TRITON_RIGHT_PADDLE2, (pTritonReport.*.buttons & @as(u32, TRITON_LBUTTON_R5)) != @as(u32, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_TRITON_LEFT_PADDLE2, (pTritonReport.*.buttons & @as(u32, TRITON_LBUTTON_L5)) != @as(u32, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_TRITON_RIGHT_TOUCHPAD, (pTritonReport.*.buttons & @as(u32, TRITON_RIGHT_TOUCHPAD_CLICK)) != @as(u32, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_TRITON_LEFT_TOUCHPAD, (pTritonReport.*.buttons & @as(u32, TRITON_LEFT_TOUCHPAD_CLICK)) != @as(u32, 0));
        SDL_SendJoystickCapSense(timestamp, joystick, SDL_GAMEPAD_CAPSENSE_RIGHT_STICK, (pTritonReport.*.buttons & @as(u32, TRITON_RIGHT_JOYSTICK_TOUCH)) != @as(u32, 0));
        SDL_SendJoystickCapSense(timestamp, joystick, SDL_GAMEPAD_CAPSENSE_LEFT_STICK, (pTritonReport.*.buttons & @as(u32, TRITON_LEFT_JOYSTICK_TOUCH)) != @as(u32, 0));
        SDL_SendJoystickCapSense(timestamp, joystick, SDL_GAMEPAD_CAPSENSE_RIGHT_GRIP, (pTritonReport.*.buttons & @as(u32, TRITON_RIGHT_GRIP_TOUCH)) != @as(u32, 0));
        SDL_SendJoystickCapSense(timestamp, joystick, SDL_GAMEPAD_CAPSENSE_LEFT_GRIP, (pTritonReport.*.buttons & @as(u32, TRITON_LEFT_GRIP_TOUCH)) != @as(u32, 0));
        if ((pTritonReport.*.buttons & @as(u32, TRITON_LBUTTON_DPAD_UP)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_UP);
            }
        }
        if ((pTritonReport.*.buttons & @as(u32, TRITON_LBUTTON_DPAD_DOWN)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_DOWN);
            }
        }
        if ((pTritonReport.*.buttons & @as(u32, TRITON_LBUTTON_DPAD_LEFT)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_LEFT);
            }
        }
        if ((pTritonReport.*.buttons & @as(u32, TRITON_LBUTTON_DPAD_RIGHT)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_RIGHT);
            }
        }
        SDL_SendJoystickHat(timestamp, joystick, 0, hat);
        ctx.*.last_button_state = pTritonReport.*.buttons;
    }
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFT_TRIGGER, @truncate((@as(c_int, pTritonReport.*.sTriggerLeft) * @as(c_int, 2)) - @as(c_int, 32768)));
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHT_TRIGGER, @truncate((@as(c_int, pTritonReport.*.sTriggerRight) * @as(c_int, 2)) - @as(c_int, 32768)));
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, pTritonReport.*.sLeftStickX);
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, @truncate(-@as(c_int, pTritonReport.*.sLeftStickY)));
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, pTritonReport.*.sRightStickX);
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, @truncate(-@as(c_int, pTritonReport.*.sRightStickY)));
}
pub fn HIDAPI_DriverSteamTriton_HandleState(device: [*c]SDL_HIDAPI_Device, joystick: [*c]SDL_Joystick, pTritonReport: [*c]TritonMTUNoQuat_t) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var values: [3]f32 = undefined;
    _ = &values;
    var ctx: [*c]SDL_DriverSteamTriton_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    var timestamp: Uint64 = SDL_GetTicksNS_REAL();
    _ = &timestamp;
    HIDAPI_DriverSteamTriton_HandleGenericState(ctx, joystick, timestamp, pTritonReport);
    var left_touch_down: bool = (if ((pTritonReport.*.buttons & @as(u32, TRITON_LEFT_TOUCHPAD_TOUCH)) != 0) @"true" else @"false") != 0;
    _ = &left_touch_down;
    var right_touch_down: bool = (if ((pTritonReport.*.buttons & @as(u32, TRITON_RIGHT_TOUCHPAD_TOUCH)) != 0) @"true" else @"false") != 0;
    _ = &right_touch_down;
    if (left_touch_down or ctx.*.left_touch_down) {
        if (left_touch_down) {
            ctx.*.left_touch_x = (@as(f32, @floatFromInt(@as(c_int, pTritonReport.*.sLeftPadX))) / @as(f32, 65536.0)) + @as(f32, 0.5);
            ctx.*.left_touch_y = (-@as(f32, @floatFromInt(pTritonReport.*.sLeftPadY)) / @as(f32, 65536.0)) + @as(f32, 0.5);
        }
        SDL_SendJoystickTouchpad(timestamp, joystick, 0, 0, left_touch_down, ctx.*.left_touch_x, ctx.*.left_touch_y, @as(f32, @floatFromInt(@as(c_int, pTritonReport.*.unPressureLeft))) / @as(f32, 32768.0));
        ctx.*.left_touch_down = left_touch_down;
    }
    if (right_touch_down or ctx.*.right_touch_down) {
        if (right_touch_down) {
            ctx.*.right_touch_x = (@as(f32, @floatFromInt(@as(c_int, pTritonReport.*.sRightPadX))) / @as(f32, 65536.0)) + @as(f32, 0.5);
            ctx.*.right_touch_y = (-@as(f32, @floatFromInt(pTritonReport.*.sRightPadY)) / @as(f32, 65536.0)) + @as(f32, 0.5);
        }
        SDL_SendJoystickTouchpad(timestamp, joystick, 1, 0, right_touch_down, ctx.*.right_touch_x, ctx.*.right_touch_y, @as(f32, @floatFromInt(@as(c_int, pTritonReport.*.unPressureRight))) / @as(f32, 32768.0));
        ctx.*.right_touch_down = right_touch_down;
    }
    if (ctx.*.report_sensors and (pTritonReport.*.imu.timestamp != ctx.*.last_sensor_tick32)) {
        var delta_us: Uint32 = pTritonReport.*.imu.timestamp -% ctx.*.last_sensor_tick32;
        _ = &delta_us;
        ctx.*.sensor_timestamp_ns +%= @as(Uint64, delta_us) *% @as(Uint64, SDL_NS_PER_US);
        values[@as(c_int, 0)] = (@as(f32, @floatFromInt(@as(c_int, pTritonReport.*.imu.sGyroX))) / @as(f32, 32768.0)) * (@as(f32, 2000.0) * (SDL_PI_F / @as(f32, 180.0)));
        values[@as(c_int, 1)] = (@as(f32, @floatFromInt(@as(c_int, pTritonReport.*.imu.sGyroZ))) / @as(f32, 32768.0)) * (@as(f32, 2000.0) * (SDL_PI_F / @as(f32, 180.0)));
        values[@as(c_int, 2)] = (@as(f32, @floatFromInt(-@as(c_int, pTritonReport.*.imu.sGyroY))) / @as(f32, 32768.0)) * (@as(f32, 2000.0) * (SDL_PI_F / @as(f32, 180.0)));
        SDL_SendJoystickSensor(timestamp, joystick, SDL_SENSOR_GYRO, ctx.*.sensor_timestamp_ns, @ptrCast(@alignCast(&values)), 3);
        values[@as(c_int, 0)] = ((@as(f32, @floatFromInt(@as(c_int, pTritonReport.*.imu.sAccelX))) / @as(f32, 32768.0)) * @as(f32, 2.0)) * SDL_STANDARD_GRAVITY;
        values[@as(c_int, 1)] = ((@as(f32, @floatFromInt(@as(c_int, pTritonReport.*.imu.sAccelZ))) / @as(f32, 32768.0)) * @as(f32, 2.0)) * SDL_STANDARD_GRAVITY;
        values[@as(c_int, 2)] = ((@as(f32, @floatFromInt(-@as(c_int, pTritonReport.*.imu.sAccelY))) / @as(f32, 32768.0)) * @as(f32, 2.0)) * SDL_STANDARD_GRAVITY;
        SDL_SendJoystickSensor(timestamp, joystick, SDL_SENSOR_ACCEL, ctx.*.sensor_timestamp_ns, @ptrCast(@alignCast(&values)), 3);
        ctx.*.last_sensor_tick32 = pTritonReport.*.imu.timestamp;
    }
}
pub fn HIDAPI_DriverSteamTriton_HandleState_Timestamp(device: [*c]SDL_HIDAPI_Device, joystick: [*c]SDL_Joystick, pTritonReport: [*c]TritonMTUNoQuat32TS_t) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var values: [3]f32 = undefined;
    _ = &values;
    var ctx: [*c]SDL_DriverSteamTriton_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    var timestamp: Uint64 = SDL_GetTicksNS_REAL();
    _ = &timestamp;
    HIDAPI_DriverSteamTriton_HandleGenericState(ctx, joystick, timestamp, @ptrCast(@alignCast(pTritonReport)));
    var left_touch_down: bool = (if ((pTritonReport.*.buttons & @as(u32, TRITON_LEFT_TOUCHPAD_TOUCH)) != 0) @"true" else @"false") != 0;
    _ = &left_touch_down;
    var right_touch_down: bool = (if ((pTritonReport.*.buttons & @as(u32, TRITON_RIGHT_TOUCHPAD_TOUCH)) != 0) @"true" else @"false") != 0;
    _ = &right_touch_down;
    if (left_touch_down or ctx.*.left_touch_down) {
        if (left_touch_down) {
            ctx.*.left_touch_x = (@as(f32, @floatFromInt(@as(c_int, pTritonReport.*.sLeftPadX))) / @as(f32, 65536.0)) + @as(f32, 0.5);
            ctx.*.left_touch_y = (-@as(f32, @floatFromInt(pTritonReport.*.sLeftPadY)) / @as(f32, 65536.0)) + @as(f32, 0.5);
        }
        SDL_SendJoystickTouchpad(timestamp, joystick, 0, 0, left_touch_down, ctx.*.left_touch_x, ctx.*.left_touch_y, @as(f32, @floatFromInt(@as(c_int, pTritonReport.*.unPressureLeft))) / @as(f32, 32768.0));
        ctx.*.left_touch_down = left_touch_down;
    }
    if (right_touch_down or ctx.*.right_touch_down) {
        if (right_touch_down) {
            ctx.*.right_touch_x = (@as(f32, @floatFromInt(@as(c_int, pTritonReport.*.sRightPadX))) / @as(f32, 65536.0)) + @as(f32, 0.5);
            ctx.*.right_touch_y = (-@as(f32, @floatFromInt(pTritonReport.*.sRightPadY)) / @as(f32, 65536.0)) + @as(f32, 0.5);
        }
        SDL_SendJoystickTouchpad(timestamp, joystick, 1, 0, right_touch_down, ctx.*.right_touch_x, ctx.*.right_touch_y, @as(f32, @floatFromInt(@as(c_int, pTritonReport.*.unPressureRight))) / @as(f32, 32768.0));
        ctx.*.right_touch_down = right_touch_down;
    }
    if (ctx.*.report_sensors and (@as(c_int, pTritonReport.*.imu.timestamp) != @as(c_int, ctx.*.last_sensor_tick16))) {
        var delta_us: Uint32 = @as(Uint32, @bitCast(@as(c_int, @as(c_int, pTritonReport.*.imu.timestamp) - @as(c_int, ctx.*.last_sensor_tick16)))) *% @as(Uint32, 32);
        _ = &delta_us;
        ctx.*.sensor_timestamp_ns +%= @as(Uint64, delta_us) *% @as(Uint64, SDL_NS_PER_US);
        values[@as(c_int, 0)] = (@as(f32, @floatFromInt(@as(c_int, pTritonReport.*.imu.sGyroX))) / @as(f32, 32768.0)) * (@as(f32, 2000.0) * (SDL_PI_F / @as(f32, 180.0)));
        values[@as(c_int, 1)] = (@as(f32, @floatFromInt(@as(c_int, pTritonReport.*.imu.sGyroZ))) / @as(f32, 32768.0)) * (@as(f32, 2000.0) * (SDL_PI_F / @as(f32, 180.0)));
        values[@as(c_int, 2)] = (@as(f32, @floatFromInt(-@as(c_int, pTritonReport.*.imu.sGyroY))) / @as(f32, 32768.0)) * (@as(f32, 2000.0) * (SDL_PI_F / @as(f32, 180.0)));
        SDL_SendJoystickSensor(timestamp, joystick, SDL_SENSOR_GYRO, ctx.*.sensor_timestamp_ns, @ptrCast(@alignCast(&values)), 3);
        values[@as(c_int, 0)] = ((@as(f32, @floatFromInt(@as(c_int, pTritonReport.*.imu.sAccelX))) / @as(f32, 32768.0)) * @as(f32, 2.0)) * SDL_STANDARD_GRAVITY;
        values[@as(c_int, 1)] = ((@as(f32, @floatFromInt(@as(c_int, pTritonReport.*.imu.sAccelZ))) / @as(f32, 32768.0)) * @as(f32, 2.0)) * SDL_STANDARD_GRAVITY;
        values[@as(c_int, 2)] = ((@as(f32, @floatFromInt(-@as(c_int, pTritonReport.*.imu.sAccelY))) / @as(f32, 32768.0)) * @as(f32, 2.0)) * SDL_STANDARD_GRAVITY;
        SDL_SendJoystickSensor(timestamp, joystick, SDL_SENSOR_ACCEL, ctx.*.sensor_timestamp_ns, @ptrCast(@alignCast(&values)), 3);
        ctx.*.last_sensor_tick16 = pTritonReport.*.imu.timestamp;
    }
}
pub fn HIDAPI_DriverSteamTriton_HandleBatteryStatus(_: [*c]SDL_HIDAPI_Device, joystick: [*c]SDL_Joystick, pTritonBatteryStatus: [*c]TritonBatteryStatus_t) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var state: SDL_PowerState = undefined;
    _ = &state;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (@as(c_int, pTritonBatteryStatus.*.ucChargeState)) {
                    k_EChargeStateDischarging => {
                        sdl_pc = 2;
                        continue;
                    },
                    k_EChargeStateCharging => {
                        sdl_pc = 3;
                        continue;
                    },
                    k_EChargeStateChargingDone => {
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
                SDL_SendJoystickPowerInfo(joystick, state, pTritonBatteryStatus.*.ucBatteryLevel);
                {}
            },
            2 => {
                state = SDL_POWERSTATE_ON_BATTERY;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                state = SDL_POWERSTATE_CHARGING;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                state = SDL_POWERSTATE_CHARGED;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            5 => {
                state = SDL_POWERSTATE_UNKNOWN;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverSteamTriton_SetControllerConnected(device: [*c]SDL_HIDAPI_Device, connected: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSteamTriton_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    if (@as(c_int, @intFromBool(ctx.*.connected)) != @as(c_int, @intFromBool(connected))) {
        ctx.*.connected = connected;
        if (connected) {
            var joystickID: SDL_JoystickID = undefined;
            _ = &joystickID;
            if (!HIDAPI_JoystickConnected(device, &joystickID)) {
                return @"false" != 0;
            }
        } else {
            if (device.*.num_joysticks > @as(c_int, 0)) {
                HIDAPI_JoystickDisconnected(device, device.*.joysticks[@as(c_int, 0)]);
            }
        }
    }
    return @"true" != 0;
}
pub fn HIDAPI_DriverSteamTriton_HandleWirelessStatus(device: [*c]SDL_HIDAPI_Device, pTritonWirelessStatus: [*c]TritonWirelessStatus_t) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (@as(c_int, pTritonWirelessStatus.*.state)) {
                    k_ETritonWirelessStateConnect => {
                        sdl_pc = 2;
                        continue;
                    },
                    k_ETritonWirelessStateDisconnect => {
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
                {}
            },
            2 => {
                _ = HIDAPI_DriverSteamTriton_SetControllerConnected(device, @"true" != 0);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                _ = HIDAPI_DriverSteamTriton_SetControllerConnected(device, @"false" != 0);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverSteamTriton_RegisterHints(callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = SDL_AddHintCallback_REAL("SDL_JOYSTICK_HIDAPI_STEAM", callback, userdata);
}
pub fn HIDAPI_DriverSteamTriton_UnregisterHints(callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_RemoveHintCallback_REAL("SDL_JOYSTICK_HIDAPI_STEAM", callback, userdata);
}
pub fn HIDAPI_DriverSteamTriton_IsEnabled() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI_STEAM", SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI", @"true" != 0));
}
pub fn HIDAPI_DriverSteamTriton_IsSupportedDevice(_: [*c]SDL_HIDAPI_Device, _: [*c]const u8, arg_type: SDL_GamepadType, vendor_id: Uint16, product_id: Uint16, _: Uint16, arg_interface_number: c_int, _: c_int, _: c_int, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var interface_number = arg_interface_number;
    _ = &interface_number;
    if (IsProteusDongle(product_id)) {
        if ((interface_number >= @as(c_int, 2)) and (interface_number <= @as(c_int, 5))) {
            return @"true" != 0;
        }
    } else if (SDL_IsJoystickSteamTriton(vendor_id, product_id)) {
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub fn HIDAPI_DriverSteamTriton_InitDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSteamTriton_Context = undefined;
    _ = &ctx;
    ctx = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(ctx.*)))));
    if (@as(?*anyopaque, @ptrCast(@alignCast(ctx))) == @as(?*anyopaque, null)) {
        return @"false" != 0;
    }
    device.*.context = @ptrCast(@alignCast(ctx));
    HIDAPI_SetDeviceName(device, "Steam Controller");
    if (IsProteusDongle(device.*.product_id)) {
        return @"true" != 0;
    }
    return HIDAPI_DriverSteamTriton_SetControllerConnected(device, @"true" != 0);
}
pub fn HIDAPI_DriverSteamTriton_GetDevicePlayerIndex(_: [*c]SDL_HIDAPI_Device, _: SDL_JoystickID) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return -@as(c_int, 1);
}
pub fn HIDAPI_DriverSteamTriton_SetDevicePlayerIndex(_: [*c]SDL_HIDAPI_Device, _: SDL_JoystickID, _: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn HIDAPI_DriverSteamTriton_UpdateDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSteamTriton_Context = undefined;
    _ = &ctx;
    var joystick: [*c]SDL_Joystick = undefined;
    _ = &joystick;
    var now: Uint64 = undefined;
    _ = &now;
    var data: [64]u8 = undefined;
    _ = &data;
    var r: c_int = undefined;
    _ = &r;
    var pTritonReport: [*c]TritonMTUNoQuat_t = undefined;
    _ = &pTritonReport;
    var pTritonReport_1: [*c]TritonMTUNoQuat32TS_t = undefined;
    _ = &pTritonReport_1;
    var pTritonBatteryStatus: [*c]TritonBatteryStatus_t = undefined;
    _ = &pTritonBatteryStatus;
    var pTritonWirelessStatus: [*c]TritonWirelessStatus_t = undefined;
    _ = &pTritonWirelessStatus;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                ctx = @ptrCast(@alignCast(device.*.context));
                joystick = null;
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
                if (ctx.*.connected and (joystick != null)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                now = SDL_GetTicks_REAL();
                if (!(ctx.*.last_lizard_update != 0) or ((now -% ctx.*.last_lizard_update) >= @as(Uint64, 3000))) {
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
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            7 => {
                _ = DisableSteamTritonLizardMode(device.*.dev);
                ctx.*.last_lizard_update = now;
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
                if ((@as(c_int, ctx.*.low_frequency_rumble) != 0) or (@as(c_int, ctx.*.high_frequency_rumble) != 0)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                if ((now -% ctx.*.last_rumble_time) >= @as(Uint64, TRITON_RUMBLE_RESEND_INTERVAL_MS)) {
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
                    sdl_pc = 6;
                    continue;
                }
            },
            13 => {
                _ = HIDAPI_DriverSteamTriton_RumbleJoystick(device, joystick, ctx.*.low_frequency_rumble, ctx.*.high_frequency_rumble);
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
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            16 => {
                if (true) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            17 => {
                r = SDL_hid_read_REAL(device.*.dev, @ptrCast(@alignCast(&data)), @sizeOf(@TypeOf(data)));
                if (r == @as(c_int, 0)) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            18 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            19 => {
                return undefined;
            },
            20 => {
                return @"true" != 0;
            },
            21 => {
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            22 => {
                if (r < @as(c_int, 0)) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                _ = HIDAPI_DriverSteamTriton_SetControllerConnected(device, @"false" != 0);
                return @"false" != 0;
            },
            24 => {
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            25 => {
                switch (@as(c_int, data[@as(c_int, 0)])) {
                    ID_TRITON_CONTROLLER_STATE => {
                        sdl_pc = 27;
                        continue;
                    },
                    ID_TRITON_CONTROLLER_STATE_BLE => {
                        sdl_pc = 28;
                        continue;
                    },
                    ID_TRITON_CONTROLLER_STATE_TIMESTAMP => {
                        sdl_pc = 38;
                        continue;
                    },
                    ID_TRITON_BATTERY_STATUS => {
                        sdl_pc = 48;
                        continue;
                    },
                    ID_TRITON_WIRELESS_STATUS_X => {
                        sdl_pc = 52;
                        continue;
                    },
                    ID_TRITON_WIRELESS_STATUS => {
                        sdl_pc = 53;
                        continue;
                    },
                    else => {
                        sdl_pc = 57;
                        continue;
                    },
                }
            },
            26 => {
                {
                    sdl_pc = 18;
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
                if (!(joystick != null)) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            29 => {
                _ = HIDAPI_DriverSteamTriton_SetControllerConnected(device, @"true" != 0);
                if (device.*.num_joysticks > @as(c_int, 0)) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
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
                if ((joystick != null) and (@as(c_ulong, @bitCast(@as(c_long, r))) >= (@as(c_ulong, 1) +% @sizeOf(TritonMTUNoQuat_t)))) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            32 => {
                joystick = SDL_GetJoystickFromID_REAL(device.*.joysticks[@as(c_int, 0)]);
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
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            35 => {
                pTritonReport = @ptrCast(@alignCast(&data[@as(c_int, 1)]));
                HIDAPI_DriverSteamTriton_HandleState(device, joystick, pTritonReport);
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
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            38 => {
                if (!(joystick != null)) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 40;
                    continue;
                }
            },
            39 => {
                _ = HIDAPI_DriverSteamTriton_SetControllerConnected(device, @"true" != 0);
                if (device.*.num_joysticks > @as(c_int, 0)) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 43;
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
                if ((joystick != null) and (@as(c_ulong, @bitCast(@as(c_long, r))) >= (@as(c_ulong, 1) +% @sizeOf(TritonMTUNoQuat32TS_t)))) {
                    sdl_pc = 45;
                    continue;
                } else {
                    sdl_pc = 46;
                    continue;
                }
            },
            42 => {
                joystick = SDL_GetJoystickFromID_REAL(device.*.joysticks[@as(c_int, 0)]);
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
                pTritonReport_1 = @ptrCast(@alignCast(&data[@as(c_int, 1)]));
                HIDAPI_DriverSteamTriton_HandleState_Timestamp(device, joystick, pTritonReport_1);
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
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            48 => {
                if ((joystick != null) and (@as(c_ulong, @bitCast(@as(c_long, r))) >= (@as(c_ulong, 1) +% @sizeOf(TritonBatteryStatus_t)))) {
                    sdl_pc = 49;
                    continue;
                } else {
                    sdl_pc = 50;
                    continue;
                }
            },
            49 => {
                pTritonBatteryStatus = @ptrCast(@alignCast(&data[@as(c_int, 1)]));
                HIDAPI_DriverSteamTriton_HandleBatteryStatus(device, joystick, pTritonBatteryStatus);
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            50 => {
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            51 => {
                {
                    sdl_pc = 26;
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
                if (@as(c_ulong, @bitCast(@as(c_long, r))) >= (@as(c_ulong, 1) +% @sizeOf(TritonWirelessStatus_t))) {
                    sdl_pc = 54;
                    continue;
                } else {
                    sdl_pc = 55;
                    continue;
                }
            },
            54 => {
                pTritonWirelessStatus = @ptrCast(@alignCast(&data[@as(c_int, 1)]));
                HIDAPI_DriverSteamTriton_HandleWirelessStatus(device, pTritonWirelessStatus);
                {
                    sdl_pc = 56;
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
                    sdl_pc = 26;
                    continue;
                }
            },
            57 => {
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverSteamTriton_OpenJoystick(_: [*c]SDL_HIDAPI_Device, joystick: [*c]SDL_Joystick) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var update_rate_in_hz: f32 = @as(f32, 1000000.0) / @as(f32, @floatFromInt(TRITON_SENSOR_UPDATE_INTERVAL_US));
    _ = &update_rate_in_hz;
    SDL_AssertJoysticksLocked();
    joystick.*.nbuttons = SDL_GAMEPAD_NUM_TRITON_BUTTONS;
    joystick.*.naxes = SDL_GAMEPAD_AXIS_COUNT;
    joystick.*.nhats = 1;
    SDL_PrivateJoystickAddSensor(joystick, SDL_SENSOR_GYRO, update_rate_in_hz);
    SDL_PrivateJoystickAddSensor(joystick, SDL_SENSOR_ACCEL, update_rate_in_hz);
    SDL_PrivateJoystickAddTouchpad(joystick, 1);
    SDL_PrivateJoystickAddTouchpad(joystick, 1);
    SDL_PrivateJoystickAddCapSense(joystick, SDL_GAMEPAD_CAPSENSE_LEFT_STICK);
    SDL_PrivateJoystickAddCapSense(joystick, SDL_GAMEPAD_CAPSENSE_RIGHT_STICK);
    SDL_PrivateJoystickAddCapSense(joystick, SDL_GAMEPAD_CAPSENSE_LEFT_GRIP);
    SDL_PrivateJoystickAddCapSense(joystick, SDL_GAMEPAD_CAPSENSE_RIGHT_GRIP);
    return @"true" != 0;
}
pub fn HIDAPI_DriverSteamTriton_RumbleJoystick(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, low_frequency_rumble: Uint16, high_frequency_rumble: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSteamTriton_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    var rc: c_int = undefined;
    _ = &rc;
    ctx.*.low_frequency_rumble = low_frequency_rumble;
    ctx.*.high_frequency_rumble = high_frequency_rumble;
    ctx.*.last_rumble_time = SDL_GetTicks_REAL();
    var buffer: [10]Uint8 = [1]Uint8{
        0,
    } ++ @as([9]Uint8, @splat(0));
    _ = &buffer;
    var msg: [*c]OutputReportMsg = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&buffer)))));
    _ = &msg;
    msg.*.report_id = ID_OUT_REPORT_HAPTIC_RUMBLE;
    msg.*.payload.hapticRumble.type = 0;
    msg.*.payload.hapticRumble.intensity = 0;
    msg.*.payload.hapticRumble.left.speed = low_frequency_rumble;
    msg.*.payload.hapticRumble.left.gain = 0;
    msg.*.payload.hapticRumble.right.speed = high_frequency_rumble;
    msg.*.payload.hapticRumble.right.gain = 0;
    rc = SDL_hid_write_REAL(device.*.dev, @ptrCast(@alignCast(&buffer)), @sizeOf(@TypeOf(buffer)));
    if (rc < @as(c_int, 0)) {
        SDL_LogError_REAL(SDL_LOG_CATEGORY_INPUT, "Steam Controller HID Write FAILED! rc: %d. SDL_Error: %s", rc, SDL_GetError_REAL());
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn HIDAPI_DriverSteamTriton_RumbleJoystickTriggers(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: Uint16, _: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverSteamTriton_GetJoystickCapabilities(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    return SDL_JOYSTICK_CAP_RUMBLE;
}
pub fn HIDAPI_DriverSteamTriton_SetJoystickLED(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: Uint8, _: Uint8, _: Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverSteamTriton_SendJoystickEffect(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, data: ?*const anyopaque, size: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (size == HID_FEATURE_REPORT_BYTES) {
        var rc: c_int = SDL_hid_send_feature_report_REAL(device.*.dev, @ptrCast(@alignCast(data)), @bitCast(@as(c_long, size)));
        _ = &rc;
        if (rc != size) {
            return @"false" != 0;
        }
        return @"true" != 0;
    }
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverSteamTriton_SetSensorsEnabled(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, enabled: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSteamTriton_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    var rc: c_int = undefined;
    _ = &rc;
    var buffer: [64]Uint8 = [1]Uint8{
        1,
    } ++ @as([63]Uint8, @splat(0));
    _ = &buffer;
    var msg: [*c]FeatureReportMsg = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&buffer))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))))));
    _ = &msg;
    msg.*.header.type = ID_SET_SETTINGS_VALUES;
    msg.*.header.length = @truncate(@as(c_ulong, 1) *% @sizeOf(ControllerSetting));
    msg.*.payload.setSettingsValues.settings[@as(c_int, 0)].settingNum = SETTING_IMU_MODE;
    if (enabled) {
        msg.*.payload.setSettingsValues.settings[@as(c_int, 0)].settingValue = @bitCast(@as(c_short, @truncate(SETTING_GYRO_MODE_SEND_RAW_ACCEL | SETTING_GYRO_MODE_SEND_RAW_GYRO)));
    } else {
        msg.*.payload.setSettingsValues.settings[@as(c_int, 0)].settingValue = SETTING_GYRO_MODE_OFF;
    }
    rc = SDL_hid_send_feature_report_REAL(device.*.dev, @ptrCast(@alignCast(&buffer)), @sizeOf(@TypeOf(buffer)));
    if (@as(c_ulong, @bitCast(@as(c_long, rc))) != @sizeOf(@TypeOf(buffer))) {
        return @"false" != 0;
    }
    ctx.*.report_sensors = enabled;
    return @"true" != 0;
}
pub fn HIDAPI_DriverSteamTriton_CloseJoystick(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn HIDAPI_DriverSteamTriton_FreeDevice(_: [*c]SDL_HIDAPI_Device) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub export var SDL_HIDAPI_DriverSteamTriton: SDL_HIDAPI_DeviceDriver = SDL_HIDAPI_DeviceDriver{
    .name = "SDL_JOYSTICK_HIDAPI_STEAM",
    .enabled = @"true" != 0,
    .RegisterHints = HIDAPI_DriverSteamTriton_RegisterHints,
    .UnregisterHints = HIDAPI_DriverSteamTriton_UnregisterHints,
    .IsEnabled = HIDAPI_DriverSteamTriton_IsEnabled,
    .IsSupportedDevice = HIDAPI_DriverSteamTriton_IsSupportedDevice,
    .InitDevice = HIDAPI_DriverSteamTriton_InitDevice,
    .GetDevicePlayerIndex = HIDAPI_DriverSteamTriton_GetDevicePlayerIndex,
    .SetDevicePlayerIndex = HIDAPI_DriverSteamTriton_SetDevicePlayerIndex,
    .UpdateDevice = HIDAPI_DriverSteamTriton_UpdateDevice,
    .OpenJoystick = HIDAPI_DriverSteamTriton_OpenJoystick,
    .RumbleJoystick = HIDAPI_DriverSteamTriton_RumbleJoystick,
    .RumbleJoystickTriggers = HIDAPI_DriverSteamTriton_RumbleJoystickTriggers,
    .GetJoystickCapabilities = HIDAPI_DriverSteamTriton_GetJoystickCapabilities,
    .SetJoystickLED = HIDAPI_DriverSteamTriton_SetJoystickLED,
    .SendJoystickEffect = HIDAPI_DriverSteamTriton_SendJoystickEffect,
    .SetJoystickSensorsEnabled = HIDAPI_DriverSteamTriton_SetSensorsEnabled,
    .CloseJoystick = HIDAPI_DriverSteamTriton_CloseJoystick,
    .FreeDevice = HIDAPI_DriverSteamTriton_FreeDevice,
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
pub const USB_PRODUCT_VALVE_STEAM_PROTEUS_DONGLE = @as(c_int, 0x1304);
pub const USB_PRODUCT_VALVE_STEAM_NEREID_DONGLE = @as(c_int, 0x1305);
pub const SDL_JOYSTICK_CAP_RUMBLE = @as(c_int, 0x00000010);
pub const HID_FEATURE_REPORT_BYTES = @as(c_int, 64);
pub const TRITON_SENSOR_UPDATE_INTERVAL_US = @as(c_int, 4032);
pub const TRITON_RUMBLE_RESEND_INTERVAL_MS = @as(c_int, 40);
