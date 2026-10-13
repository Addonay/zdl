// /*
//   Simple DirectMedia Layer
//   Copyright (C) 2023 Max Maisel <max.maisel@posteo.de>
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
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
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
pub const SDL_GAMEPAD_CAPSENSE_LEFT_STICK: c_int = 0;
pub const SDL_GAMEPAD_CAPSENSE_RIGHT_STICK: c_int = 1;
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
pub extern fn SDL_hid_read_REAL(dev: ?*SDL_hid_device, data: [*c]u8, length: usize) c_int;
pub extern fn SDL_hid_send_feature_report_REAL(dev: ?*SDL_hid_device, data: [*c]const u8, length: usize) c_int;
pub extern fn SDL_hid_get_feature_report_REAL(dev: ?*SDL_hid_device, data: [*c]u8, length: usize) c_int;
pub extern fn SDL_GetHintBoolean_REAL(name: [*c]const u8, default_value: bool) bool;
pub const SDL_HintCallback = ?*const fn (userdata: ?*anyopaque, name: [*c]const u8, oldValue: [*c]const u8, newValue: [*c]const u8) callconv(.c) void;
pub extern fn SDL_AddHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) bool;
pub extern fn SDL_RemoveHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) void;
pub extern fn SDL_GetTicksNS_REAL() Uint64;
pub extern fn SDL_AssertJoysticksLocked() void;
pub extern fn SDL_IsJoystickSteamDeck(vendor_id: Uint16, product_id: Uint16) bool;
pub extern fn SDL_PrivateJoystickAddTouchpad(joystick: [*c]SDL_Joystick, nfingers: c_int) void;
pub extern fn SDL_PrivateJoystickAddSensor(joystick: [*c]SDL_Joystick, @"type": SDL_SensorType, rate: f32) void;
pub extern fn SDL_PrivateJoystickAddCapSense(joystick: [*c]SDL_Joystick, @"type": SDL_GamepadCapSenseType) void;
pub extern fn SDL_SendJoystickAxis(timestamp: Uint64, joystick: [*c]SDL_Joystick, axis: Uint8, value: Sint16) void;
pub extern fn SDL_SendJoystickHat(timestamp: Uint64, joystick: [*c]SDL_Joystick, hat: Uint8, value: Uint8) void;
pub extern fn SDL_SendJoystickButton(timestamp: Uint64, joystick: [*c]SDL_Joystick, button: Uint8, down: bool) void;
pub extern fn SDL_SendJoystickTouchpad(timestamp: Uint64, joystick: [*c]SDL_Joystick, touchpad: c_int, finger: c_int, down: bool, x: f32, y: f32, pressure: f32) void;
pub extern fn SDL_SendJoystickSensor(timestamp: Uint64, joystick: [*c]SDL_Joystick, @"type": SDL_SensorType, sensor_timestamp: Uint64, data: [*c]const f32, num_values: c_int) void;
pub extern fn SDL_SendJoystickCapSense(timestamp: Uint64, joystick: [*c]SDL_Joystick, @"type": SDL_GamepadCapSenseType, down: bool) void;
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
pub const HAPTIC_INTENSITY_SYSTEM: c_int = 0;
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
pub const ID_CONTROLLER_DECK_STATE: c_int = 9;
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
pub const ID_CLEAR_DIGITAL_MAPPINGS: c_int = 129;
pub const ID_SET_SETTINGS_VALUES: c_int = 135;
pub const ID_TRIGGER_RUMBLE_CMD: c_int = 235;
pub const TRACKPAD_NONE: c_int = 7;
pub const SETTING_LEFT_TRACKPAD_MODE: c_int = 7;
pub const SETTING_RIGHT_TRACKPAD_MODE: c_int = 8;
pub const SETTING_SMOOTH_ABSOLUTE_MOUSE: c_int = 24;
pub const SETTING_LEFT_TRACKPAD_CLICK_PRESSURE: c_int = 52;
pub const SETTING_RIGHT_TRACKPAD_CLICK_PRESSURE: c_int = 53;
pub const SDL_GAMEPAD_BUTTON_STEAM_DECK_QAM: c_int = 11;
pub const SDL_GAMEPAD_BUTTON_STEAM_DECK_RIGHT_PADDLE1: c_int = 12;
pub const SDL_GAMEPAD_BUTTON_STEAM_DECK_LEFT_PADDLE1: c_int = 13;
pub const SDL_GAMEPAD_BUTTON_STEAM_DECK_RIGHT_PADDLE2: c_int = 14;
pub const SDL_GAMEPAD_BUTTON_STEAM_DECK_LEFT_PADDLE2: c_int = 15;
pub const SDL_GAMEPAD_BUTTON_STEAM_DECK_RIGHT_TOUCHPAD: c_int = 16;
pub const SDL_GAMEPAD_BUTTON_STEAM_DECK_LEFT_TOUCHPAD: c_int = 17;
pub const SDL_GAMEPAD_NUM_STEAM_DECK_BUTTONS: c_int = 18;
pub const STEAMDECK_LBUTTON_R: c_int = 4;
pub const STEAMDECK_LBUTTON_L: c_int = 8;
pub const STEAMDECK_LBUTTON_Y: c_int = 16;
pub const STEAMDECK_LBUTTON_B: c_int = 32;
pub const STEAMDECK_LBUTTON_X: c_int = 64;
pub const STEAMDECK_LBUTTON_A: c_int = 128;
pub const STEAMDECK_LBUTTON_DPAD_UP: c_int = 256;
pub const STEAMDECK_LBUTTON_DPAD_RIGHT: c_int = 512;
pub const STEAMDECK_LBUTTON_DPAD_LEFT: c_int = 1024;
pub const STEAMDECK_LBUTTON_DPAD_DOWN: c_int = 2048;
pub const STEAMDECK_LBUTTON_VIEW: c_int = 4096;
pub const STEAMDECK_LBUTTON_STEAM: c_int = 8192;
pub const STEAMDECK_LBUTTON_MENU: c_int = 16384;
pub const STEAMDECK_LBUTTON_L5: c_int = 32768;
pub const STEAMDECK_LBUTTON_R5: c_int = 65536;
pub const STEAMDECK_LBUTTON_LEFT_PAD: c_int = 131072;
pub const STEAMDECK_LBUTTON_RIGHT_PAD: c_int = 262144;
pub const STEAMDECK_LBUTTON_LEFT_TOUCHPAD_TOUCH: c_int = 524288;
pub const STEAMDECK_LBUTTON_RIGHT_TOUCHPAD_TOUCH: c_int = 1048576;
pub const STEAMDECK_LBUTTON_L3: c_int = 4194304;
pub const STEAMDECK_LBUTTON_R3: c_int = 67108864;
pub const STEAMDECK_HBUTTON_L4: c_int = 512;
pub const STEAMDECK_HBUTTON_R4: c_int = 1024;
pub const STEAMDECK_HBUTTON_LSTICK_TOUCH: c_int = 16384;
pub const STEAMDECK_HBUTTON_RSTICK_TOUCH: c_int = 32768;
pub const STEAMDECK_HBUTTON_QAM: c_int = 262144;
pub const SDL_DriverSteamDeck_Context = extern struct {
    update_rate_us: Uint32 = 0,
    sensor_timestamp_ns: Uint64 = 0,
    last_button_state: Uint64 = 0,
    watchdog_counter: Uint8 = 0,
    left_touch_down: bool = false,
    left_touch_x: f32 = 0,
    left_touch_y: f32 = 0,
    right_touch_down: bool = false,
    right_touch_x: f32 = 0,
    right_touch_y: f32 = 0,
};
pub fn DisableDeckLizardMode(dev: ?*SDL_hid_device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var rc: c_int = undefined;
    _ = &rc;
    var buffer: [65]Uint8 = [1]Uint8{
        0,
    } ++ @as([64]Uint8, @splat(0));
    _ = &buffer;
    var msg: [*c]FeatureReportMsg = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&buffer))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))))));
    _ = &msg;
    msg.*.header.type = ID_CLEAR_DIGITAL_MAPPINGS;
    rc = SDL_hid_send_feature_report_REAL(dev, @ptrCast(@alignCast(&buffer)), @sizeOf(@TypeOf(buffer)));
    if (@as(c_ulong, @bitCast(@as(c_long, rc))) != @sizeOf(@TypeOf(buffer))) return @"false" != 0;
    msg.*.header.type = ID_SET_SETTINGS_VALUES;
    msg.*.header.length = @truncate(@as(c_ulong, 5) *% @sizeOf(ControllerSetting));
    msg.*.payload.setSettingsValues.settings[@as(c_int, 0)].settingNum = SETTING_SMOOTH_ABSOLUTE_MOUSE;
    msg.*.payload.setSettingsValues.settings[@as(c_int, 0)].settingValue = 0;
    msg.*.payload.setSettingsValues.settings[@as(c_int, 1)].settingNum = SETTING_LEFT_TRACKPAD_MODE;
    msg.*.payload.setSettingsValues.settings[@as(c_int, 1)].settingValue = TRACKPAD_NONE;
    msg.*.payload.setSettingsValues.settings[@as(c_int, 2)].settingNum = SETTING_RIGHT_TRACKPAD_MODE;
    msg.*.payload.setSettingsValues.settings[@as(c_int, 2)].settingValue = TRACKPAD_NONE;
    msg.*.payload.setSettingsValues.settings[@as(c_int, 3)].settingNum = SETTING_LEFT_TRACKPAD_CLICK_PRESSURE;
    msg.*.payload.setSettingsValues.settings[@as(c_int, 3)].settingValue = 65535;
    msg.*.payload.setSettingsValues.settings[@as(c_int, 4)].settingNum = SETTING_RIGHT_TRACKPAD_CLICK_PRESSURE;
    msg.*.payload.setSettingsValues.settings[@as(c_int, 4)].settingValue = 65535;
    rc = SDL_hid_send_feature_report_REAL(dev, @ptrCast(@alignCast(&buffer)), @sizeOf(@TypeOf(buffer)));
    if (@as(c_ulong, @bitCast(@as(c_long, rc))) != @sizeOf(@TypeOf(buffer))) return @"false" != 0;
    _ = SDL_hid_get_feature_report_REAL(dev, @ptrCast(@alignCast(&buffer)), @sizeOf(@TypeOf(buffer)));
    return @"true" != 0;
}
pub fn FeedDeckLizardWatchdog(dev: ?*SDL_hid_device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var rc: c_int = undefined;
    _ = &rc;
    var buffer: [65]Uint8 = [1]Uint8{
        0,
    } ++ @as([64]Uint8, @splat(0));
    _ = &buffer;
    var msg: [*c]FeatureReportMsg = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&buffer))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))))));
    _ = &msg;
    msg.*.header.type = ID_CLEAR_DIGITAL_MAPPINGS;
    rc = SDL_hid_send_feature_report_REAL(dev, @ptrCast(@alignCast(&buffer)), @sizeOf(@TypeOf(buffer)));
    if (@as(c_ulong, @bitCast(@as(c_long, rc))) != @sizeOf(@TypeOf(buffer))) return @"false" != 0;
    msg.*.header.type = ID_SET_SETTINGS_VALUES;
    msg.*.header.length = @truncate(@as(c_ulong, 1) *% @sizeOf(ControllerSetting));
    msg.*.payload.setSettingsValues.settings[@as(c_int, 0)].settingNum = SETTING_RIGHT_TRACKPAD_MODE;
    msg.*.payload.setSettingsValues.settings[@as(c_int, 0)].settingValue = TRACKPAD_NONE;
    rc = SDL_hid_send_feature_report_REAL(dev, @ptrCast(@alignCast(&buffer)), @sizeOf(@TypeOf(buffer)));
    if (@as(c_ulong, @bitCast(@as(c_long, rc))) != @sizeOf(@TypeOf(buffer))) return @"false" != 0;
    _ = SDL_hid_get_feature_report_REAL(dev, @ptrCast(@alignCast(&buffer)), @sizeOf(@TypeOf(buffer)));
    return @"true" != 0;
}
pub fn HIDAPI_DriverSteamDeck_HandleState(device: [*c]SDL_HIDAPI_Device, joystick: [*c]SDL_Joystick, pInReport: [*c]ValveInReport_t) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var values: [3]f32 = undefined;
    _ = &values;
    var ctx: [*c]SDL_DriverSteamDeck_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    var timestamp: Uint64 = SDL_GetTicksNS_REAL();
    _ = &timestamp;
    if (pInReport.*.payload.deckState.unnamed_0.ulButtons != ctx.*.last_button_state) {
        var hat: Uint8 = 0;
        _ = &hat;
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SOUTH, (pInReport.*.payload.deckState.unnamed_0.unnamed_0.ulButtonsL & @as(Uint32, STEAMDECK_LBUTTON_A)) != @as(Uint32, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_EAST, (pInReport.*.payload.deckState.unnamed_0.unnamed_0.ulButtonsL & @as(Uint32, STEAMDECK_LBUTTON_B)) != @as(Uint32, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_WEST, (pInReport.*.payload.deckState.unnamed_0.unnamed_0.ulButtonsL & @as(Uint32, STEAMDECK_LBUTTON_X)) != @as(Uint32, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_NORTH, (pInReport.*.payload.deckState.unnamed_0.unnamed_0.ulButtonsL & @as(Uint32, STEAMDECK_LBUTTON_Y)) != @as(Uint32, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_SHOULDER, (pInReport.*.payload.deckState.unnamed_0.unnamed_0.ulButtonsL & @as(Uint32, STEAMDECK_LBUTTON_L)) != @as(Uint32, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER, (pInReport.*.payload.deckState.unnamed_0.unnamed_0.ulButtonsL & @as(Uint32, STEAMDECK_LBUTTON_R)) != @as(Uint32, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_BACK, (pInReport.*.payload.deckState.unnamed_0.unnamed_0.ulButtonsL & @as(Uint32, STEAMDECK_LBUTTON_VIEW)) != @as(Uint32, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_START, (pInReport.*.payload.deckState.unnamed_0.unnamed_0.ulButtonsL & @as(Uint32, STEAMDECK_LBUTTON_MENU)) != @as(Uint32, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_GUIDE, (pInReport.*.payload.deckState.unnamed_0.unnamed_0.ulButtonsL & @as(Uint32, STEAMDECK_LBUTTON_STEAM)) != @as(Uint32, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_STEAM_DECK_QAM, (pInReport.*.payload.deckState.unnamed_0.unnamed_0.ulButtonsH & @as(Uint32, STEAMDECK_HBUTTON_QAM)) != @as(Uint32, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_STICK, (pInReport.*.payload.deckState.unnamed_0.unnamed_0.ulButtonsL & @as(Uint32, STEAMDECK_LBUTTON_L3)) != @as(Uint32, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_STICK, (pInReport.*.payload.deckState.unnamed_0.unnamed_0.ulButtonsL & @as(Uint32, STEAMDECK_LBUTTON_R3)) != @as(Uint32, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_STEAM_DECK_RIGHT_PADDLE1, (pInReport.*.payload.deckState.unnamed_0.unnamed_0.ulButtonsH & @as(Uint32, STEAMDECK_HBUTTON_R4)) != @as(Uint32, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_STEAM_DECK_LEFT_PADDLE1, (pInReport.*.payload.deckState.unnamed_0.unnamed_0.ulButtonsH & @as(Uint32, STEAMDECK_HBUTTON_L4)) != @as(Uint32, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_STEAM_DECK_RIGHT_PADDLE2, (pInReport.*.payload.deckState.unnamed_0.unnamed_0.ulButtonsL & @as(Uint32, STEAMDECK_LBUTTON_R5)) != @as(Uint32, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_STEAM_DECK_LEFT_PADDLE2, (pInReport.*.payload.deckState.unnamed_0.unnamed_0.ulButtonsL & @as(Uint32, STEAMDECK_LBUTTON_L5)) != @as(Uint32, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_STEAM_DECK_RIGHT_TOUCHPAD, (pInReport.*.payload.deckState.unnamed_0.unnamed_0.ulButtonsL & @as(Uint32, STEAMDECK_LBUTTON_RIGHT_PAD)) != @as(Uint32, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_STEAM_DECK_LEFT_TOUCHPAD, (pInReport.*.payload.deckState.unnamed_0.unnamed_0.ulButtonsL & @as(Uint32, STEAMDECK_LBUTTON_LEFT_PAD)) != @as(Uint32, 0));
        SDL_SendJoystickCapSense(timestamp, joystick, SDL_GAMEPAD_CAPSENSE_RIGHT_STICK, (pInReport.*.payload.deckState.unnamed_0.unnamed_0.ulButtonsH & @as(Uint32, STEAMDECK_HBUTTON_RSTICK_TOUCH)) != @as(Uint32, 0));
        SDL_SendJoystickCapSense(timestamp, joystick, SDL_GAMEPAD_CAPSENSE_LEFT_STICK, (pInReport.*.payload.deckState.unnamed_0.unnamed_0.ulButtonsH & @as(Uint32, STEAMDECK_HBUTTON_LSTICK_TOUCH)) != @as(Uint32, 0));
        if ((pInReport.*.payload.deckState.unnamed_0.unnamed_0.ulButtonsL & @as(Uint32, STEAMDECK_LBUTTON_DPAD_UP)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_UP);
            }
        }
        if ((pInReport.*.payload.deckState.unnamed_0.unnamed_0.ulButtonsL & @as(Uint32, STEAMDECK_LBUTTON_DPAD_DOWN)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_DOWN);
            }
        }
        if ((pInReport.*.payload.deckState.unnamed_0.unnamed_0.ulButtonsL & @as(Uint32, STEAMDECK_LBUTTON_DPAD_LEFT)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_LEFT);
            }
        }
        if ((pInReport.*.payload.deckState.unnamed_0.unnamed_0.ulButtonsL & @as(Uint32, STEAMDECK_LBUTTON_DPAD_RIGHT)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_RIGHT);
            }
        }
        SDL_SendJoystickHat(timestamp, joystick, 0, hat);
        ctx.*.last_button_state = pInReport.*.payload.deckState.unnamed_0.ulButtons;
    }
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFT_TRIGGER, @truncate((@as(c_int, pInReport.*.payload.deckState.sTriggerRawL) * @as(c_int, 2)) - @as(c_int, 32768)));
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHT_TRIGGER, @truncate((@as(c_int, pInReport.*.payload.deckState.sTriggerRawR) * @as(c_int, 2)) - @as(c_int, 32768)));
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, pInReport.*.payload.deckState.sLeftStickX);
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, @truncate(-@as(c_int, pInReport.*.payload.deckState.sLeftStickY)));
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, pInReport.*.payload.deckState.sRightStickX);
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, @truncate(-@as(c_int, pInReport.*.payload.deckState.sRightStickY)));
    ctx.*.sensor_timestamp_ns +%= @as(Uint64, ctx.*.update_rate_us) *% @as(Uint64, SDL_NS_PER_US);
    values[@as(c_int, 0)] = (@as(f32, @floatFromInt(@as(c_int, pInReport.*.payload.deckState.sGyroX))) / @as(f32, 32768.0)) * (@as(f32, 2000.0) * (SDL_PI_F / @as(f32, 180.0)));
    values[@as(c_int, 1)] = (@as(f32, @floatFromInt(@as(c_int, pInReport.*.payload.deckState.sGyroZ))) / @as(f32, 32768.0)) * (@as(f32, 2000.0) * (SDL_PI_F / @as(f32, 180.0)));
    values[@as(c_int, 2)] = (@as(f32, @floatFromInt(-@as(c_int, pInReport.*.payload.deckState.sGyroY))) / @as(f32, 32768.0)) * (@as(f32, 2000.0) * (SDL_PI_F / @as(f32, 180.0)));
    SDL_SendJoystickSensor(timestamp, joystick, SDL_SENSOR_GYRO, ctx.*.sensor_timestamp_ns, @ptrCast(@alignCast(&values)), 3);
    values[@as(c_int, 0)] = ((@as(f32, @floatFromInt(@as(c_int, pInReport.*.payload.deckState.sAccelX))) / @as(f32, 32768.0)) * @as(f32, 2.0)) * SDL_STANDARD_GRAVITY;
    values[@as(c_int, 1)] = ((@as(f32, @floatFromInt(@as(c_int, pInReport.*.payload.deckState.sAccelZ))) / @as(f32, 32768.0)) * @as(f32, 2.0)) * SDL_STANDARD_GRAVITY;
    values[@as(c_int, 2)] = ((@as(f32, @floatFromInt(-@as(c_int, pInReport.*.payload.deckState.sAccelY))) / @as(f32, 32768.0)) * @as(f32, 2.0)) * SDL_STANDARD_GRAVITY;
    SDL_SendJoystickSensor(timestamp, joystick, SDL_SENSOR_ACCEL, ctx.*.sensor_timestamp_ns, @ptrCast(@alignCast(&values)), 3);
    var left_touch_down: bool = (if ((pInReport.*.payload.deckState.unnamed_0.unnamed_0.ulButtonsL & @as(Uint32, STEAMDECK_LBUTTON_LEFT_TOUCHPAD_TOUCH)) != 0) @"true" else @"false") != 0;
    _ = &left_touch_down;
    var right_touch_down: bool = (if ((pInReport.*.payload.deckState.unnamed_0.unnamed_0.ulButtonsL & @as(Uint32, STEAMDECK_LBUTTON_RIGHT_TOUCHPAD_TOUCH)) != 0) @"true" else @"false") != 0;
    _ = &right_touch_down;
    if (left_touch_down or ctx.*.left_touch_down) {
        if (left_touch_down) {
            ctx.*.left_touch_x = (@as(f32, @floatFromInt(@as(c_int, pInReport.*.payload.deckState.sLeftPadX))) / @as(f32, 65536.0)) + @as(f32, 0.5);
            ctx.*.left_touch_y = (-@as(f32, @floatFromInt(pInReport.*.payload.deckState.sLeftPadY)) / @as(f32, 65536.0)) + @as(f32, 0.5);
        }
        SDL_SendJoystickTouchpad(timestamp, joystick, 0, 0, left_touch_down, ctx.*.left_touch_x, ctx.*.left_touch_y, @as(f32, @floatFromInt(@as(c_int, pInReport.*.payload.deckState.sPressurePadLeft))) / @as(f32, 32768.0));
        ctx.*.left_touch_down = left_touch_down;
    }
    if (right_touch_down or ctx.*.right_touch_down) {
        if (right_touch_down) {
            ctx.*.right_touch_x = (@as(f32, @floatFromInt(@as(c_int, pInReport.*.payload.deckState.sRightPadX))) / @as(f32, 65536.0)) + @as(f32, 0.5);
            ctx.*.right_touch_y = (-@as(f32, @floatFromInt(pInReport.*.payload.deckState.sRightPadY)) / @as(f32, 65536.0)) + @as(f32, 0.5);
        }
        SDL_SendJoystickTouchpad(timestamp, joystick, 1, 0, right_touch_down, ctx.*.right_touch_x, ctx.*.right_touch_y, @as(f32, @floatFromInt(@as(c_int, pInReport.*.payload.deckState.sPressurePadRight))) / @as(f32, 32768.0));
        ctx.*.right_touch_down = right_touch_down;
    }
}
pub fn HIDAPI_DriverSteamDeck_RegisterHints(callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = SDL_AddHintCallback_REAL("SDL_JOYSTICK_HIDAPI_STEAMDECK", callback, userdata);
}
pub fn HIDAPI_DriverSteamDeck_UnregisterHints(callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_RemoveHintCallback_REAL("SDL_JOYSTICK_HIDAPI_STEAMDECK", callback, userdata);
}
pub fn HIDAPI_DriverSteamDeck_IsEnabled() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI_STEAMDECK", SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI", @"true" != 0));
}
pub fn HIDAPI_DriverSteamDeck_IsSupportedDevice(_: [*c]SDL_HIDAPI_Device, _: [*c]const u8, arg_type: SDL_GamepadType, vendor_id: Uint16, product_id: Uint16, _: Uint16, _: c_int, _: c_int, _: c_int, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    return SDL_IsJoystickSteamDeck(vendor_id, product_id);
}
pub fn HIDAPI_DriverSteamDeck_InitDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var size: c_int = undefined;
    _ = &size;
    var data: [64]Uint8 = undefined;
    _ = &data;
    var ctx: [*c]SDL_DriverSteamDeck_Context = undefined;
    _ = &ctx;
    ctx = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(ctx.*)))));
    if (@as(?*anyopaque, @ptrCast(@alignCast(ctx))) == @as(?*anyopaque, null)) {
        return @"false" != 0;
    }
    ctx.*.update_rate_us = 4000;
    device.*.context = @ptrCast(@alignCast(ctx));
    size = SDL_hid_read_timeout_REAL(device.*.dev, @ptrCast(@alignCast(&data)), @sizeOf(@TypeOf(data)), 16);
    if (size == @as(c_int, 0)) return @"false" != 0;
    if (!DisableDeckLizardMode(device.*.dev)) return @"false" != 0;
    HIDAPI_SetDeviceName(device, "Steam Deck");
    return HIDAPI_JoystickConnected(device, null);
}
pub fn HIDAPI_DriverSteamDeck_GetDevicePlayerIndex(_: [*c]SDL_HIDAPI_Device, _: SDL_JoystickID) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return -@as(c_int, 1);
}
pub fn HIDAPI_DriverSteamDeck_SetDevicePlayerIndex(_: [*c]SDL_HIDAPI_Device, _: SDL_JoystickID, _: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn HIDAPI_DriverSteamDeck_UpdateDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSteamDeck_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    var joystick: [*c]SDL_Joystick = null;
    _ = &joystick;
    var r: c_int = undefined;
    _ = &r;
    var data: [64]u8 = undefined;
    _ = &data;
    var pInReport: [*c]ValveInReport_t = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&data)))));
    _ = &pInReport;
    if (device.*.num_joysticks > @as(c_int, 0)) {
        joystick = SDL_GetJoystickFromID_REAL(device.*.joysticks[@as(c_int, 0)]);
        if (@as(?*anyopaque, @ptrCast(@alignCast(joystick))) == @as(?*anyopaque, null)) {
            return @"false" != 0;
        }
    } else {
        return @"false" != 0;
    }
    if (@as(c_int, blk: {
        const ref = &ctx.*.watchdog_counter;
        const tmp = ref.*;
        ref.* +%= 1;
        break :blk tmp;
    }) > @as(c_int, 200)) {
        ctx.*.watchdog_counter = 0;
        if (!FeedDeckLizardWatchdog(device.*.dev)) return @"false" != 0;
    }
    _ = memset(@ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&data))))), 0, @sizeOf(@TypeOf(data)));
    while (true) {
        r = SDL_hid_read_REAL(device.*.dev, @ptrCast(@alignCast(&data)), @sizeOf(@TypeOf(data)));
        if (r < @as(c_int, 0)) {
            HIDAPI_JoystickDisconnected(device, device.*.joysticks[@as(c_int, 0)]);
            return @"false" != 0;
        } else if ((((r == @as(c_int, 64)) and (@as(c_int, pInReport.*.header.unReportVersion) == k_ValveInReportMsgVersion)) and (@as(c_int, pInReport.*.header.ucType) == ID_CONTROLLER_DECK_STATE)) and (@as(c_int, pInReport.*.header.ucLength) == @as(c_int, 64))) {
            HIDAPI_DriverSteamDeck_HandleState(device, joystick, pInReport);
        }
        if (!(r > @as(c_int, 0))) break;
    }
    return @"true" != 0;
}
pub fn HIDAPI_DriverSteamDeck_OpenJoystick(device: [*c]SDL_HIDAPI_Device, joystick: [*c]SDL_Joystick) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSteamDeck_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    var update_rate_in_hz: f32 = (@as(f32, 1.0) / @as(f32, @floatFromInt(ctx.*.update_rate_us))) * @as(f32, 1000000.0);
    _ = &update_rate_in_hz;
    SDL_AssertJoysticksLocked();
    joystick.*.nbuttons = SDL_GAMEPAD_NUM_STEAM_DECK_BUTTONS;
    joystick.*.naxes = SDL_GAMEPAD_AXIS_COUNT;
    joystick.*.nhats = 1;
    SDL_PrivateJoystickAddSensor(joystick, SDL_SENSOR_GYRO, update_rate_in_hz);
    SDL_PrivateJoystickAddSensor(joystick, SDL_SENSOR_ACCEL, update_rate_in_hz);
    SDL_PrivateJoystickAddTouchpad(joystick, 1);
    SDL_PrivateJoystickAddTouchpad(joystick, 1);
    SDL_PrivateJoystickAddCapSense(joystick, SDL_GAMEPAD_CAPSENSE_LEFT_STICK);
    SDL_PrivateJoystickAddCapSense(joystick, SDL_GAMEPAD_CAPSENSE_RIGHT_STICK);
    return @"true" != 0;
}
pub fn HIDAPI_DriverSteamDeck_RumbleJoystick(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, low_frequency_rumble: Uint16, high_frequency_rumble: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var rc: c_int = undefined;
    _ = &rc;
    var buffer: [65]Uint8 = [1]Uint8{
        0,
    } ++ @as([64]Uint8, @splat(0));
    _ = &buffer;
    var msg: [*c]FeatureReportMsg = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&buffer))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))))));
    _ = &msg;
    msg.*.header.type = ID_TRIGGER_RUMBLE_CMD;
    msg.*.payload.simpleRumble.unRumbleType = 0;
    msg.*.payload.simpleRumble.unIntensity = HAPTIC_INTENSITY_SYSTEM;
    msg.*.payload.simpleRumble.unLeftMotorSpeed = low_frequency_rumble;
    msg.*.payload.simpleRumble.unRightMotorSpeed = high_frequency_rumble;
    msg.*.payload.simpleRumble.nLeftGain = 2;
    msg.*.payload.simpleRumble.nRightGain = 0;
    rc = SDL_hid_send_feature_report_REAL(device.*.dev, @ptrCast(@alignCast(&buffer)), @sizeOf(@TypeOf(buffer)));
    if (@as(c_ulong, @bitCast(@as(c_long, rc))) != @sizeOf(@TypeOf(buffer))) return @"false" != 0;
    return @"true" != 0;
}
pub fn HIDAPI_DriverSteamDeck_RumbleJoystickTriggers(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: Uint16, _: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverSteamDeck_GetJoystickCapabilities(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    return SDL_JOYSTICK_CAP_RUMBLE;
}
pub fn HIDAPI_DriverSteamDeck_SetJoystickLED(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: Uint8, _: Uint8, _: Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverSteamDeck_SendJoystickEffect(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: ?*const anyopaque, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverSteamDeck_SetSensorsEnabled(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return @"true" != 0;
}
pub fn HIDAPI_DriverSteamDeck_CloseJoystick(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn HIDAPI_DriverSteamDeck_FreeDevice(_: [*c]SDL_HIDAPI_Device) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub export var SDL_HIDAPI_DriverSteamDeck: SDL_HIDAPI_DeviceDriver = SDL_HIDAPI_DeviceDriver{
    .name = "SDL_JOYSTICK_HIDAPI_STEAMDECK",
    .enabled = @"true" != 0,
    .RegisterHints = HIDAPI_DriverSteamDeck_RegisterHints,
    .UnregisterHints = HIDAPI_DriverSteamDeck_UnregisterHints,
    .IsEnabled = HIDAPI_DriverSteamDeck_IsEnabled,
    .IsSupportedDevice = HIDAPI_DriverSteamDeck_IsSupportedDevice,
    .InitDevice = HIDAPI_DriverSteamDeck_InitDevice,
    .GetDevicePlayerIndex = HIDAPI_DriverSteamDeck_GetDevicePlayerIndex,
    .SetDevicePlayerIndex = HIDAPI_DriverSteamDeck_SetDevicePlayerIndex,
    .UpdateDevice = HIDAPI_DriverSteamDeck_UpdateDevice,
    .OpenJoystick = HIDAPI_DriverSteamDeck_OpenJoystick,
    .RumbleJoystick = HIDAPI_DriverSteamDeck_RumbleJoystick,
    .RumbleJoystickTriggers = HIDAPI_DriverSteamDeck_RumbleJoystickTriggers,
    .GetJoystickCapabilities = HIDAPI_DriverSteamDeck_GetJoystickCapabilities,
    .SetJoystickLED = HIDAPI_DriverSteamDeck_SetJoystickLED,
    .SendJoystickEffect = HIDAPI_DriverSteamDeck_SendJoystickEffect,
    .SetJoystickSensorsEnabled = HIDAPI_DriverSteamDeck_SetSensorsEnabled,
    .CloseJoystick = HIDAPI_DriverSteamDeck_CloseJoystick,
    .FreeDevice = HIDAPI_DriverSteamDeck_FreeDevice,
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
pub const SDL_JOYSTICK_CAP_RUMBLE = @as(c_int, 0x00000010);
pub const k_ValveInReportMsgVersion = @as(c_int, 0x01);
