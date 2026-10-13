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
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memmove(__dest: ?*anyopaque, __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Sint16 = i16;
pub const Uint16 = u16;
pub const Uint32 = u32;
pub const Uint64 = u64;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_abs_REAL(x: c_int) c_int;
pub extern fn SDL_crc32_REAL(crc: Uint32, data: ?*const anyopaque, len: usize) Uint32;
pub extern fn SDL_memcmp_REAL(s1: ?*const anyopaque, s2: ?*const anyopaque, len: usize) c_int;
pub extern fn SDL_strlen_REAL(str: [*c]const u8) usize;
pub extern fn SDL_atoi_REAL(str: [*c]const u8) c_int;
pub extern fn SDL_strcasecmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_snprintf_REAL(text: [*c]u8, maxlen: usize, fmt: [*c]const u8, ...) c_int;
pub extern fn SDL_fabsf_REAL(x: f32) f32;
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
pub const SDL_JOYSTICK_TYPE_UNKNOWN: c_int = 0;
pub const SDL_JOYSTICK_TYPE_GAMEPAD: c_int = 1;
pub const SDL_JOYSTICK_TYPE_WHEEL: c_int = 2;
pub const SDL_JOYSTICK_TYPE_ARCADE_STICK: c_int = 3;
pub const SDL_JOYSTICK_TYPE_FLIGHT_STICK: c_int = 4;
pub const SDL_JOYSTICK_TYPE_DANCE_PAD: c_int = 5;
pub const SDL_JOYSTICK_TYPE_GUITAR: c_int = 6;
pub const SDL_JOYSTICK_TYPE_DRUM_KIT: c_int = 7;
pub const enum_SDL_JoystickType = c_uint;
pub const SDL_JoystickType = enum_SDL_JoystickType;
pub extern fn SDL_LockJoysticks_REAL() void;
pub extern fn SDL_UnlockJoysticks_REAL() void;
pub extern fn SDL_GetJoystickFromID_REAL(instance_id: SDL_JoystickID) [*c]SDL_Joystick;
pub extern fn SDL_GetJoystickPlayerIndex_REAL(joystick: [*c]SDL_Joystick) c_int;
pub const SDL_GAMEPAD_TYPE_PS4: c_int = 5;
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
pub extern fn SDL_GetTicks_REAL() Uint64;
pub extern fn SDL_GetTicksNS_REAL() Uint64;
pub extern fn SDL_Delay_REAL(ms: Uint32) void;
pub extern fn SDL_GetStringBoolean(value: [*c]const u8, default_value: bool) bool;
pub extern fn SDL_AssertJoysticksLocked() void;
pub extern fn SDL_PrivateJoystickAddTouchpad(joystick: [*c]SDL_Joystick, nfingers: c_int) void;
pub extern fn SDL_PrivateJoystickAddSensor(joystick: [*c]SDL_Joystick, @"type": SDL_SensorType, rate: f32) void;
pub extern fn SDL_PrivateJoystickSensorRate(joystick: [*c]SDL_Joystick, @"type": SDL_SensorType, rate: f32) void;
pub extern fn SDL_SendJoystickAxis(timestamp: Uint64, joystick: [*c]SDL_Joystick, axis: Uint8, value: Sint16) void;
pub extern fn SDL_SendJoystickHat(timestamp: Uint64, joystick: [*c]SDL_Joystick, hat: Uint8, value: Uint8) void;
pub extern fn SDL_SendJoystickButton(timestamp: Uint64, joystick: [*c]SDL_Joystick, button: Uint8, down: bool) void;
pub extern fn SDL_SendJoystickTouchpad(timestamp: Uint64, joystick: [*c]SDL_Joystick, touchpad: c_int, finger: c_int, down: bool, x: f32, y: f32, pressure: f32) void;
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
pub extern fn HIDAPI_HasConnectedUSBDevice(serial: [*c]const u8) bool;
pub extern fn HIDAPI_DisconnectBluetoothDevice(serial: [*c]const u8) void;
pub extern fn HIDAPI_JoystickConnected(device: [*c]SDL_HIDAPI_Device, pJoystickID: [*c]SDL_JoystickID) bool;
pub extern fn HIDAPI_JoystickDisconnected(device: [*c]SDL_HIDAPI_Device, joystickID: SDL_JoystickID) void;
pub extern fn HIDAPI_UpdateDeviceProperties(device: [*c]SDL_HIDAPI_Device) void;
pub extern fn HIDAPI_SupportsPlaystationDetection(vendor: Uint16, product: Uint16) bool;
pub extern fn SDL_HIDAPI_LockRumble() bool;
pub extern fn SDL_HIDAPI_SendRumbleAndUnlock(device: [*c]SDL_HIDAPI_Device, data: [*c]const Uint8, size: c_int) c_int;
pub extern fn SDL_HIDAPI_SendRumble(device: [*c]SDL_HIDAPI_Device, data: [*c]const Uint8, size: c_int) c_int;
pub const SDL_GAMEPAD_BUTTON_PS4_TOUCHPAD: c_int = 11;
pub const k_EPS4ReportIdUsbState: c_int = 1;
pub const k_EPS4ReportIdUsbEffects: c_int = 5;
pub const k_EPS4ReportIdBluetoothState1: c_int = 17;
pub const k_EPS4ReportIdBluetoothState2: c_int = 18;
pub const k_EPS4ReportIdBluetoothState3: c_int = 19;
pub const k_EPS4ReportIdBluetoothState4: c_int = 20;
pub const k_EPS4ReportIdBluetoothState5: c_int = 21;
pub const k_EPS4ReportIdBluetoothState6: c_int = 22;
pub const k_EPS4ReportIdBluetoothState7: c_int = 23;
pub const k_EPS4ReportIdBluetoothState8: c_int = 24;
pub const k_EPS4ReportIdBluetoothState9: c_int = 25;
pub const k_EPS4ReportIdBluetoothEffects: c_int = 17;
pub const k_ePS4FeatureReportIdGyroCalibration_USB: c_int = 2;
pub const k_ePS4FeatureReportIdCapabilities: c_int = 3;
pub const k_ePS4FeatureReportIdGyroCalibration_BT: c_int = 5;
pub const k_ePS4FeatureReportIdSerialNumber: c_int = 18;
pub const PS4StatePacket_t = extern struct {
    ucLeftJoystickX: Uint8 = 0,
    ucLeftJoystickY: Uint8 = 0,
    ucRightJoystickX: Uint8 = 0,
    ucRightJoystickY: Uint8 = 0,
    rgucButtonsHatAndCounter: [3]Uint8 = @import("std").mem.zeroes([3]Uint8),
    ucTriggerLeft: Uint8 = 0,
    ucTriggerRight: Uint8 = 0,
    rgucTimestamp: [2]Uint8 = @import("std").mem.zeroes([2]Uint8),
    _rgucPad0: [1]Uint8 = @import("std").mem.zeroes([1]Uint8),
    rgucGyroX: [2]Uint8 = @import("std").mem.zeroes([2]Uint8),
    rgucGyroY: [2]Uint8 = @import("std").mem.zeroes([2]Uint8),
    rgucGyroZ: [2]Uint8 = @import("std").mem.zeroes([2]Uint8),
    rgucAccelX: [2]Uint8 = @import("std").mem.zeroes([2]Uint8),
    rgucAccelY: [2]Uint8 = @import("std").mem.zeroes([2]Uint8),
    rgucAccelZ: [2]Uint8 = @import("std").mem.zeroes([2]Uint8),
    _rgucPad1: [5]Uint8 = @import("std").mem.zeroes([5]Uint8),
    ucBatteryLevel: Uint8 = 0,
    _rgucPad2: [4]Uint8 = @import("std").mem.zeroes([4]Uint8),
    ucTouchpadCounter1: Uint8 = 0,
    rgucTouchpadData1: [3]Uint8 = @import("std").mem.zeroes([3]Uint8),
    ucTouchpadCounter2: Uint8 = 0,
    rgucTouchpadData2: [3]Uint8 = @import("std").mem.zeroes([3]Uint8),
    rgucDeviceSpecific: [12]Uint8 = @import("std").mem.zeroes([12]Uint8),
};
pub const DS4EffectsState_t = extern struct {
    ucRumbleRight: Uint8 = 0,
    ucRumbleLeft: Uint8 = 0,
    ucLedRed: Uint8 = 0,
    ucLedGreen: Uint8 = 0,
    ucLedBlue: Uint8 = 0,
    ucLedDelayOn: Uint8 = 0,
    ucLedDelayOff: Uint8 = 0,
    _rgucPad0: [8]Uint8 = @import("std").mem.zeroes([8]Uint8),
    ucVolumeLeft: Uint8 = 0,
    ucVolumeRight: Uint8 = 0,
    ucVolumeMic: Uint8 = 0,
    ucVolumeSpeaker: Uint8 = 0,
};
pub const k_EPS4EffectRumble: c_int = 1;
pub const k_EPS4EffectLED: c_int = 2;
pub const k_EPS4EffectLEDBlink: c_int = 4;
pub const EPS4Effect = c_uint;
pub const IMUCalibrationData = extern struct {
    bias: Sint16 = 0,
    scale: f32 = 0,
};
pub const PS4_ENHANCED_REPORT_HINT_OFF: c_int = 0;
pub const PS4_ENHANCED_REPORT_HINT_ON: c_int = 1;
pub const PS4_ENHANCED_REPORT_HINT_AUTO: c_int = 2;
pub const HIDAPI_PS4_EnhancedReportHint = c_uint;
pub const SDL_DriverPS4_Context = extern struct {
    device: [*c]SDL_HIDAPI_Device = null,
    joystick: [*c]SDL_Joystick = null,
    is_dongle: bool = false,
    is_nacon_dongle: bool = false,
    official_controller: bool = false,
    sensors_supported: bool = false,
    lightbar_supported: bool = false,
    vibration_supported: bool = false,
    touchpad_supported: bool = false,
    effects_supported: bool = false,
    guitar_whammy_supported: bool = false,
    guitar_tilt_supported: bool = false,
    guitar_effects_selector_supported: bool = false,
    enhanced_report_hint: HIDAPI_PS4_EnhancedReportHint = @import("std").mem.zeroes(HIDAPI_PS4_EnhancedReportHint),
    enhanced_reports: bool = false,
    enhanced_mode: bool = false,
    enhanced_mode_available: bool = false,
    report_interval: Uint8 = 0,
    report_sensors: bool = false,
    report_touchpad: bool = false,
    report_battery: bool = false,
    hardware_calibration: bool = false,
    calibration: [6]IMUCalibrationData = @import("std").mem.zeroes([6]IMUCalibrationData),
    last_packet: Uint64 = 0,
    player_index: c_int = 0,
    rumble_left: Uint8 = 0,
    rumble_right: Uint8 = 0,
    color_set: bool = false,
    led_red: Uint8 = 0,
    led_green: Uint8 = 0,
    led_blue: Uint8 = 0,
    gyro_numerator: Uint16 = 0,
    gyro_denominator: Uint16 = 0,
    accel_numerator: Uint16 = 0,
    accel_denominator: Uint16 = 0,
    sensor_ticks: Uint64 = 0,
    last_tick: Uint16 = 0,
    valid_crc_packets: Uint16 = 0,
    last_state: PS4StatePacket_t = @import("std").mem.zeroes(PS4StatePacket_t),
};
pub fn HIDAPI_DriverPS4_RegisterHints(callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = SDL_AddHintCallback_REAL("SDL_JOYSTICK_HIDAPI_PS4", callback, userdata);
}
pub fn HIDAPI_DriverPS4_UnregisterHints(callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_RemoveHintCallback_REAL("SDL_JOYSTICK_HIDAPI_PS4", callback, userdata);
}
pub fn HIDAPI_DriverPS4_IsEnabled() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI_PS4", SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI", @"true" != 0));
}
pub fn ReadFeatureReport(dev: ?*SDL_hid_device, report_id: Uint8, report: [*c]Uint8, length: usize) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    _ = memset(@ptrCast(@alignCast(report)), 0, length);
    report[@as(c_int, 0)] = report_id;
    return SDL_hid_get_feature_report_REAL(dev, report, length);
}
pub fn HIDAPI_DriverPS4_IsSupportedDevice(device: [*c]SDL_HIDAPI_Device, _: [*c]const u8, arg_type: SDL_GamepadType, vendor_id: Uint16, product_id: Uint16, _: Uint16, _: c_int, _: c_int, _: c_int, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var data: [64]Uint8 = undefined;
    _ = &data;
    var size: c_int = undefined;
    _ = &size;
    if (@"type" == @as(SDL_GamepadType, SDL_GAMEPAD_TYPE_PS4)) {
        return @"true" != 0;
    }
    if (HIDAPI_SupportsPlaystationDetection(vendor_id, product_id)) {
        if ((device != null) and (device.*.dev != null)) {
            size = ReadFeatureReport(device.*.dev, k_ePS4FeatureReportIdCapabilities, @ptrCast(@alignCast(&data)), @sizeOf(@TypeOf(data)));
            if ((size == @as(c_int, 48)) and (@as(c_int, data[@as(c_int, 2)]) == @as(c_int, 39))) {
                return @"true" != 0;
            } else {
                return @"false" != 0;
            }
        } else {
            return @"true" != 0;
        }
    }
    return @"false" != 0;
}
pub fn SetLedsForPlayerIndex(effects: [*c]DS4EffectsState_t, arg_player_index: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var player_index = arg_player_index;
    _ = &player_index;
    const static_local_colors = struct {
        var colors: [7][3]Uint8 = [7][3]Uint8{
            [3]Uint8{
                0,
                0,
                64,
            },
            [3]Uint8{
                64,
                0,
                0,
            },
            [3]Uint8{
                0,
                64,
                0,
            },
            [3]Uint8{
                32,
                0,
                32,
            },
            [3]Uint8{
                2,
                1,
                0,
            },
            [3]Uint8{
                0,
                1,
                1,
            },
            [3]Uint8{
                1,
                1,
                1,
            },
        };
    };
    _ = &static_local_colors;
    if (player_index >= @as(c_int, 0)) {
        {
            const ref = &player_index;
            ref.* = @bitCast(@as(c_uint, @truncate(@as(c_ulong, @bitCast(@as(c_long, ref.*))) % (@sizeOf(@TypeOf(static_local_colors.colors)) / @sizeOf(@TypeOf(static_local_colors.colors[@as(c_int, 0)]))))));
        }
    } else {
        player_index = 0;
    }
    effects.*.ucLedRed = static_local_colors.colors[@bitCast(@as(isize, @intCast(player_index)))][@as(c_int, 0)];
    effects.*.ucLedGreen = static_local_colors.colors[@bitCast(@as(isize, @intCast(player_index)))][@as(c_int, 1)];
    effects.*.ucLedBlue = static_local_colors.colors[@bitCast(@as(isize, @intCast(player_index)))][@as(c_int, 2)];
}
pub fn ReadWiredSerial(device: [*c]SDL_HIDAPI_Device, serial: [*c]u8, serial_size: usize) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var data: [64]Uint8 = undefined;
    _ = &data;
    var size: c_int = undefined;
    _ = &size;
    size = ReadFeatureReport(device.*.dev, k_ePS4FeatureReportIdSerialNumber, @ptrCast(@alignCast(&data)), @sizeOf(@TypeOf(data)));
    if ((size >= @as(c_int, 7)) and ((((((@as(c_int, data[@as(c_int, 1)]) != 0) or (@as(c_int, data[@as(c_int, 2)]) != 0)) or (@as(c_int, data[@as(c_int, 3)]) != 0)) or (@as(c_int, data[@as(c_int, 4)]) != 0)) or (@as(c_int, data[@as(c_int, 5)]) != 0)) or (@as(c_int, data[@as(c_int, 6)]) != 0))) {
        _ = SDL_snprintf_REAL(serial, serial_size, "%.2x-%.2x-%.2x-%.2x-%.2x-%.2x", data[@as(c_int, 6)], data[@as(c_int, 5)], data[@as(c_int, 4)], data[@as(c_int, 3)], data[@as(c_int, 2)], data[@as(c_int, 1)]);
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub fn HIDAPI_DriverPS4_InitDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS4_Context = undefined;
    _ = &ctx;
    var data: [64]Uint8 = undefined;
    _ = &data;
    var size: c_int = undefined;
    _ = &size;
    var serial: [18]u8 = undefined;
    _ = &serial;
    var joystick_type: SDL_JoystickType = undefined;
    _ = &joystick_type;
    var i: c_int = undefined;
    _ = &i;
    var j: c_int = undefined;
    _ = &j;
    var capabilities: Uint8 = undefined;
    _ = &capabilities;
    var device_type: Uint8 = undefined;
    _ = &device_type;
    var device_specific_capabilities: Uint8 = undefined;
    _ = &device_specific_capabilities;
    var gyro_numerator: Uint16 = undefined;
    _ = &gyro_numerator;
    var gyro_denominator: Uint16 = undefined;
    _ = &gyro_denominator;
    var accel_numerator: Uint16 = undefined;
    _ = &accel_numerator;
    var accel_denominator: Uint16 = undefined;
    _ = &accel_denominator;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                joystick_type = SDL_JOYSTICK_TYPE_GAMEPAD;
                ctx = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(ctx.*)))));
                if (!(ctx != null)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return @"false" != 0;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                ctx.*.device = device;
                ctx.*.gyro_numerator = 1;
                ctx.*.gyro_denominator = 16;
                ctx.*.accel_numerator = 1;
                ctx.*.accel_denominator = 8192;
                device.*.context = @ptrCast(@alignCast(ctx));
                if ((device.*.serial != null) and (SDL_strlen_REAL(device.*.serial) == @as(usize, 12))) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                j = -@as(c_int, 1);
                i = 0;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            5 => {
                serial[@as(c_int, 0)] = '\x00';
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                ctx.*.is_dongle = (@as(c_int, device.*.vendor_id) == USB_VENDOR_SONY) and (@as(c_int, device.*.product_id) == USB_PRODUCT_SONY_DS4_DONGLE);
                if (ctx.*.is_dongle) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            7 => {
                if (i < @as(c_int, 12)) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
            },
            8 => {
                j += 1;
                _ = memmove(@ptrCast(@alignCast(&serial[@bitCast(@as(isize, @intCast(j)))])), @ptrCast(@alignCast(&device.*.serial[@bitCast(@as(isize, @intCast(i)))])), 2);
                j += 2;
                serial[@bitCast(@as(isize, @intCast(j)))] = '-';
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                i += 2;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            10 => {
                serial[@bitCast(@as(isize, @intCast(j)))] = '\x00';
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            11 => {
                _ = ReadWiredSerial(device, @ptrCast(@alignCast(&serial)), @sizeOf(@TypeOf(serial)));
                ctx.*.enhanced_reports = @"true" != 0;
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            12 => {
                if ((@as(c_int, device.*.vendor_id) == USB_VENDOR_SONY) and (@as(c_int, device.*.product_id) == USB_PRODUCT_SONY_DS4_STRIKEPAD)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            13 => {
                if (@as(c_int, device.*.vendor_id) == USB_VENDOR_SONY) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            14 => {
                ctx.*.enhanced_reports = @"true" != 0;
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            15 => {
                if (@as(c_int, device.*.vendor_id) == USB_VENDOR_SONY) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
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
                if (device.*.is_bluetooth) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            18 => {
                ctx.*.enhanced_reports = @"true" != 0;
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
                size = SDL_hid_read_timeout_REAL(device.*.dev, @ptrCast(@alignCast(&data)), @sizeOf(@TypeOf(data)), 16);
                if (((size > @as(c_int, 0)) and (@as(c_int, data[@as(c_int, 0)]) >= k_EPS4ReportIdBluetoothState1)) and (@as(c_int, data[@as(c_int, 0)]) <= k_EPS4ReportIdBluetoothState9)) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            21 => {
                _ = ReadWiredSerial(device, @ptrCast(@alignCast(&serial)), @sizeOf(@TypeOf(serial)));
                ctx.*.enhanced_reports = @"true" != 0;
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            22 => {
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            23 => {
                ctx.*.enhanced_reports = @"true" != 0;
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
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            26 => {
                ctx.*.official_controller = @"true" != 0;
                ctx.*.sensors_supported = @"true" != 0;
                ctx.*.lightbar_supported = @"true" != 0;
                ctx.*.vibration_supported = @"true" != 0;
                ctx.*.touchpad_supported = @"true" != 0;
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            27 => {
                size = ReadFeatureReport(device.*.dev, k_ePS4FeatureReportIdCapabilities, @ptrCast(@alignCast(&data)), @sizeOf(@TypeOf(data)));
                if ((size == @as(c_int, 48)) and (@as(c_int, data[@as(c_int, 2)]) == @as(c_int, 39))) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            28 => {
                ctx.*.effects_supported = ctx.*.lightbar_supported or ctx.*.vibration_supported;
                if ((@as(c_int, device.*.vendor_id) == USB_VENDOR_NACON_ALT) and (@as(c_int, device.*.product_id) == USB_PRODUCT_NACON_REVOLUTION_5_PRO_PS4_WIRELESS)) {
                    sdl_pc = 71;
                    continue;
                } else {
                    sdl_pc = 72;
                    continue;
                }
            },
            29 => {
                capabilities = data[@as(c_int, 4)];
                device_type = data[@as(c_int, 5)];
                device_specific_capabilities = data[@as(c_int, 24)];
                gyro_numerator = @bitCast(@as(c_short, @as(Sint16, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 10)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 11)])) << @intCast(@as(c_int, 8)))))));
                gyro_denominator = @bitCast(@as(c_short, @as(Sint16, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 12)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 13)])) << @intCast(@as(c_int, 8)))))));
                accel_numerator = @bitCast(@as(c_short, @as(Sint16, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 14)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 15)])) << @intCast(@as(c_int, 8)))))));
                accel_denominator = @bitCast(@as(c_short, @as(Sint16, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 16)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 17)])) << @intCast(@as(c_int, 8)))))));
                if ((@as(c_int, capabilities) & @as(c_int, 2)) != 0) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            30 => {
                if (@as(c_int, device.*.vendor_id) == USB_VENDOR_RAZER) {
                    sdl_pc = 68;
                    continue;
                } else {
                    sdl_pc = 69;
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
                ctx.*.sensors_supported = @"true" != 0;
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
                if ((@as(c_int, capabilities) & @as(c_int, 4)) != 0) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            35 => {
                ctx.*.lightbar_supported = @"true" != 0;
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
                if ((@as(c_int, capabilities) & @as(c_int, 8)) != 0) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
                    continue;
                }
            },
            38 => {
                ctx.*.vibration_supported = @"true" != 0;
                {
                    sdl_pc = 40;
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
                if ((@as(c_int, capabilities) & @as(c_int, 64)) != 0) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            41 => {
                ctx.*.touchpad_supported = @"true" != 0;
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
                switch (@as(c_int, device_type)) {
                    @as(c_int, 0) => {
                        sdl_pc = 45;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 46;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 56;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 57;
                        continue;
                    },
                    @as(c_int, 6) => {
                        sdl_pc = 58;
                        continue;
                    },
                    @as(c_int, 7) => {
                        sdl_pc = 59;
                        continue;
                    },
                    @as(c_int, 8) => {
                        sdl_pc = 60;
                        continue;
                    },
                    else => {
                        sdl_pc = 61;
                        continue;
                    },
                }
            },
            44 => {
                if ((@as(c_int, gyro_numerator) != 0) and (@as(c_int, gyro_denominator) != 0)) {
                    sdl_pc = 62;
                    continue;
                } else {
                    sdl_pc = 63;
                    continue;
                }
            },
            45 => {
                joystick_type = SDL_JOYSTICK_TYPE_GAMEPAD;
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            46 => {
                joystick_type = SDL_JOYSTICK_TYPE_GUITAR;
                if ((@as(c_int, device_specific_capabilities) & @as(c_int, 1)) != 0) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            47 => {
                ctx.*.guitar_effects_selector_supported = @"true" != 0;
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
                if ((@as(c_int, device_specific_capabilities) & @as(c_int, 2)) != 0) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            50 => {
                ctx.*.guitar_tilt_supported = @"true" != 0;
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
                if ((@as(c_int, device_specific_capabilities) & @as(c_int, 4)) != 0) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 54;
                    continue;
                }
            },
            53 => {
                ctx.*.guitar_whammy_supported = @"true" != 0;
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
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            56 => {
                joystick_type = SDL_JOYSTICK_TYPE_DRUM_KIT;
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            57 => {
                joystick_type = SDL_JOYSTICK_TYPE_DANCE_PAD;
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            58 => {
                joystick_type = SDL_JOYSTICK_TYPE_WHEEL;
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            59 => {
                joystick_type = SDL_JOYSTICK_TYPE_ARCADE_STICK;
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            60 => {
                joystick_type = SDL_JOYSTICK_TYPE_FLIGHT_STICK;
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            61 => {
                joystick_type = SDL_JOYSTICK_TYPE_UNKNOWN;
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            62 => {
                ctx.*.gyro_numerator = gyro_numerator;
                ctx.*.gyro_denominator = gyro_denominator;
                {
                    sdl_pc = 64;
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
                if ((@as(c_int, accel_numerator) != 0) and (@as(c_int, accel_denominator) != 0)) {
                    sdl_pc = 65;
                    continue;
                } else {
                    sdl_pc = 66;
                    continue;
                }
            },
            65 => {
                ctx.*.accel_numerator = accel_numerator;
                ctx.*.accel_denominator = accel_denominator;
                {
                    sdl_pc = 67;
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
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            68 => {
                ctx.*.vibration_supported = @"true" != 0;
                ctx.*.touchpad_supported = @"true" != 0;
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
                    sdl_pc = 31;
                    continue;
                }
            },
            71 => {
                ctx.*.is_nacon_dongle = @"true" != 0;
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            72 => {
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            73 => {
                if ((@as(c_int, device.*.vendor_id) == USB_VENDOR_PDP) and ((@as(c_int, device.*.product_id) == USB_PRODUCT_VICTRIX_FS_PRO) or (@as(c_int, device.*.product_id) == USB_PRODUCT_VICTRIX_FS_PRO_V2))) {
                    sdl_pc = 74;
                    continue;
                } else {
                    sdl_pc = 75;
                    continue;
                }
            },
            74 => {
                ctx.*.effects_supported = @"false" != 0;
                {
                    sdl_pc = 76;
                    continue;
                }
            },
            75 => {
                {
                    sdl_pc = 76;
                    continue;
                }
            },
            76 => {
                device.*.joystick_type = joystick_type;
                device.*.type = SDL_GAMEPAD_TYPE_PS4;
                if (ctx.*.official_controller) {
                    sdl_pc = 77;
                    continue;
                } else {
                    sdl_pc = 78;
                    continue;
                }
            },
            77 => {
                HIDAPI_SetDeviceName(device, "PS4 Controller");
                {
                    sdl_pc = 79;
                    continue;
                }
            },
            78 => {
                {
                    sdl_pc = 79;
                    continue;
                }
            },
            79 => {
                HIDAPI_SetDeviceSerial(device, @ptrCast(@alignCast(&serial)));
                if (device.*.is_bluetooth) {
                    sdl_pc = 80;
                    continue;
                } else {
                    sdl_pc = 81;
                    continue;
                }
            },
            80 => {
                if (HIDAPI_HasConnectedUSBDevice(device.*.serial)) {
                    sdl_pc = 83;
                    continue;
                } else {
                    sdl_pc = 84;
                    continue;
                }
            },
            81 => {
                HIDAPI_DisconnectBluetoothDevice(device.*.serial);
                {
                    sdl_pc = 82;
                    continue;
                }
            },
            82 => {
                if ((ctx.*.is_dongle or ctx.*.is_nacon_dongle) and (@as(c_int, serial[@as(c_int, 0)]) == @as(c_int, '\x00'))) {
                    sdl_pc = 86;
                    continue;
                } else {
                    sdl_pc = 87;
                    continue;
                }
            },
            83 => {
                return @"true" != 0;
            },
            84 => {
                {
                    sdl_pc = 85;
                    continue;
                }
            },
            85 => {
                {
                    sdl_pc = 82;
                    continue;
                }
            },
            86 => {
                return @"true" != 0;
            },
            87 => {
                {
                    sdl_pc = 88;
                    continue;
                }
            },
            88 => {
                return HIDAPI_JoystickConnected(device, null);
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverPS4_GetDevicePlayerIndex(_: [*c]SDL_HIDAPI_Device, _: SDL_JoystickID) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return -@as(c_int, 1);
}
pub fn HIDAPI_DriverPS4_LoadOfficialCalibrationData(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS4_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    var i: c_int = undefined;
    _ = &i;
    var tries: c_int = undefined;
    _ = &tries;
    var size: c_int = undefined;
    _ = &size;
    var have_data: bool = @"false" != 0;
    _ = &have_data;
    var data: [64]Uint8 = undefined;
    _ = &data;
    if (!ctx.*.official_controller) {
        return @"false" != 0;
    }
    {
        tries = 0;
        while (tries < @as(c_int, 5)) : (tries += 1) {
            size = ReadFeatureReport(device.*.dev, k_ePS4FeatureReportIdGyroCalibration_USB, @ptrCast(@alignCast(&data)), @sizeOf(@TypeOf(data)));
            if (size < @as(c_int, 35)) {
                return @"false" != 0;
            }
            if (device.*.is_bluetooth) {
                size = ReadFeatureReport(device.*.dev, k_ePS4FeatureReportIdGyroCalibration_BT, @ptrCast(@alignCast(&data)), @sizeOf(@TypeOf(data)));
                if (size < @as(c_int, 35)) {
                    return @"false" != 0;
                }
            }
            {
                i = 0;
                while (i < size) : (i += 1) {
                    if (@as(c_int, data[@bitCast(@as(isize, @intCast(i)))]) != 0) {
                        have_data = @"true" != 0;
                        break;
                    }
                }
            }
            if (have_data) {
                break;
            }
            SDL_Delay_REAL(2);
        }
    }
    if (have_data) {
        var sGyroPitchBias: Sint16 = undefined;
        _ = &sGyroPitchBias;
        var sGyroYawBias: Sint16 = undefined;
        _ = &sGyroYawBias;
        var sGyroRollBias: Sint16 = undefined;
        _ = &sGyroRollBias;
        var sGyroPitchPlus: Sint16 = undefined;
        _ = &sGyroPitchPlus;
        var sGyroPitchMinus: Sint16 = undefined;
        _ = &sGyroPitchMinus;
        var sGyroYawPlus: Sint16 = undefined;
        _ = &sGyroYawPlus;
        var sGyroYawMinus: Sint16 = undefined;
        _ = &sGyroYawMinus;
        var sGyroRollPlus: Sint16 = undefined;
        _ = &sGyroRollPlus;
        var sGyroRollMinus: Sint16 = undefined;
        _ = &sGyroRollMinus;
        var sGyroSpeedPlus: Sint16 = undefined;
        _ = &sGyroSpeedPlus;
        var sGyroSpeedMinus: Sint16 = undefined;
        _ = &sGyroSpeedMinus;
        var sAccXPlus: Sint16 = undefined;
        _ = &sAccXPlus;
        var sAccXMinus: Sint16 = undefined;
        _ = &sAccXMinus;
        var sAccYPlus: Sint16 = undefined;
        _ = &sAccYPlus;
        var sAccYMinus: Sint16 = undefined;
        _ = &sAccYMinus;
        var sAccZPlus: Sint16 = undefined;
        _ = &sAccZPlus;
        var sAccZMinus: Sint16 = undefined;
        _ = &sAccZMinus;
        var flNumerator: f32 = undefined;
        _ = &flNumerator;
        var flDenominator: f32 = undefined;
        _ = &flDenominator;
        var sRange2g: Sint16 = undefined;
        _ = &sRange2g;
        sGyroPitchBias = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 1)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 2)])) << @intCast(@as(c_int, 8))));
        sGyroYawBias = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 3)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 4)])) << @intCast(@as(c_int, 8))));
        sGyroRollBias = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 5)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 6)])) << @intCast(@as(c_int, 8))));
        if (device.*.is_bluetooth or ctx.*.is_dongle) {
            sGyroPitchPlus = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 7)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 8)])) << @intCast(@as(c_int, 8))));
            sGyroYawPlus = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 9)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 10)])) << @intCast(@as(c_int, 8))));
            sGyroRollPlus = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 11)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 12)])) << @intCast(@as(c_int, 8))));
            sGyroPitchMinus = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 13)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 14)])) << @intCast(@as(c_int, 8))));
            sGyroYawMinus = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 15)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 16)])) << @intCast(@as(c_int, 8))));
            sGyroRollMinus = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 17)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 18)])) << @intCast(@as(c_int, 8))));
        } else {
            sGyroPitchPlus = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 7)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 8)])) << @intCast(@as(c_int, 8))));
            sGyroPitchMinus = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 9)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 10)])) << @intCast(@as(c_int, 8))));
            sGyroYawPlus = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 11)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 12)])) << @intCast(@as(c_int, 8))));
            sGyroYawMinus = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 13)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 14)])) << @intCast(@as(c_int, 8))));
            sGyroRollPlus = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 15)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 16)])) << @intCast(@as(c_int, 8))));
            sGyroRollMinus = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 17)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 18)])) << @intCast(@as(c_int, 8))));
        }
        sGyroSpeedPlus = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 19)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 20)])) << @intCast(@as(c_int, 8))));
        sGyroSpeedMinus = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 21)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 22)])) << @intCast(@as(c_int, 8))));
        sAccXPlus = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 23)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 24)])) << @intCast(@as(c_int, 8))));
        sAccXMinus = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 25)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 26)])) << @intCast(@as(c_int, 8))));
        sAccYPlus = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 27)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 28)])) << @intCast(@as(c_int, 8))));
        sAccYMinus = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 29)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 30)])) << @intCast(@as(c_int, 8))));
        sAccZPlus = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 31)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 32)])) << @intCast(@as(c_int, 8))));
        sAccZMinus = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 33)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 34)])) << @intCast(@as(c_int, 8))));
        flNumerator = (@as(f32, @floatFromInt(@as(c_int, sGyroSpeedPlus) + @as(c_int, sGyroSpeedMinus))) * @as(f32, @floatFromInt(@as(c_int, ctx.*.gyro_denominator)))) / @as(f32, @floatFromInt(@as(c_int, ctx.*.gyro_numerator)));
        flDenominator = @floatFromInt(SDL_abs_REAL(@as(c_int, sGyroPitchPlus) - @as(c_int, sGyroPitchBias)) + SDL_abs_REAL(@as(c_int, sGyroPitchMinus) - @as(c_int, sGyroPitchBias)));
        if (flDenominator != @as(f32, 0.0)) {
            ctx.*.calibration[@as(c_int, 0)].bias = sGyroPitchBias;
            ctx.*.calibration[@as(c_int, 0)].scale = flNumerator / flDenominator;
        }
        flDenominator = @floatFromInt(SDL_abs_REAL(@as(c_int, sGyroYawPlus) - @as(c_int, sGyroYawBias)) + SDL_abs_REAL(@as(c_int, sGyroYawMinus) - @as(c_int, sGyroYawBias)));
        if (flDenominator != @as(f32, 0.0)) {
            ctx.*.calibration[@as(c_int, 1)].bias = sGyroYawBias;
            ctx.*.calibration[@as(c_int, 1)].scale = flNumerator / flDenominator;
        }
        flDenominator = @floatFromInt(SDL_abs_REAL(@as(c_int, sGyroRollPlus) - @as(c_int, sGyroRollBias)) + SDL_abs_REAL(@as(c_int, sGyroRollMinus) - @as(c_int, sGyroRollBias)));
        if (flDenominator != @as(f32, 0.0)) {
            ctx.*.calibration[@as(c_int, 2)].bias = sGyroRollBias;
            ctx.*.calibration[@as(c_int, 2)].scale = flNumerator / flDenominator;
        }
        sRange2g = @truncate(@as(c_int, sAccXPlus) - @as(c_int, sAccXMinus));
        ctx.*.calibration[@as(c_int, 3)].bias = @truncate(@as(c_int, sAccXPlus) - @divTrunc(@as(c_int, sRange2g), @as(c_int, 2)));
        ctx.*.calibration[@as(c_int, 3)].scale = ((@as(f32, 2.0) * @as(f32, @floatFromInt(@as(c_int, ctx.*.accel_denominator)))) / @as(f32, @floatFromInt(@as(c_int, ctx.*.accel_numerator)))) / @as(f32, @floatFromInt(@as(c_int, sRange2g)));
        sRange2g = @truncate(@as(c_int, sAccYPlus) - @as(c_int, sAccYMinus));
        ctx.*.calibration[@as(c_int, 4)].bias = @truncate(@as(c_int, sAccYPlus) - @divTrunc(@as(c_int, sRange2g), @as(c_int, 2)));
        ctx.*.calibration[@as(c_int, 4)].scale = ((@as(f32, 2.0) * @as(f32, @floatFromInt(@as(c_int, ctx.*.accel_denominator)))) / @as(f32, @floatFromInt(@as(c_int, ctx.*.accel_numerator)))) / @as(f32, @floatFromInt(@as(c_int, sRange2g)));
        sRange2g = @truncate(@as(c_int, sAccZPlus) - @as(c_int, sAccZMinus));
        ctx.*.calibration[@as(c_int, 5)].bias = @truncate(@as(c_int, sAccZPlus) - @divTrunc(@as(c_int, sRange2g), @as(c_int, 2)));
        ctx.*.calibration[@as(c_int, 5)].scale = ((@as(f32, 2.0) * @as(f32, @floatFromInt(@as(c_int, ctx.*.accel_denominator)))) / @as(f32, @floatFromInt(@as(c_int, ctx.*.accel_numerator)))) / @as(f32, @floatFromInt(@as(c_int, sRange2g)));
        ctx.*.hardware_calibration = @"true" != 0;
        {
            i = 0;
            while (i < @as(c_int, 6)) : (i += 1) {
                if ((SDL_abs_REAL(ctx.*.calibration[@bitCast(@as(isize, @intCast(i)))].bias) > @as(c_int, 1024)) or (SDL_fabsf_REAL(@as(f32, 1.0) - ctx.*.calibration[@bitCast(@as(isize, @intCast(i)))].scale) > @as(f32, 0.5))) {
                    ctx.*.hardware_calibration = @"false" != 0;
                }
            }
        }
    } else {}
    return ctx.*.hardware_calibration;
}
pub fn HIDAPI_DriverPS4_LoadCalibrationData(device: [*c]SDL_HIDAPI_Device) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS4_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    var i: c_int = undefined;
    _ = &i;
    if (!HIDAPI_DriverPS4_LoadOfficialCalibrationData(device)) {
        {
            i = 0;
            while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(ctx.*.calibration)) / @sizeOf(@TypeOf(ctx.*.calibration[@as(c_int, 0)])))) : (i += 1) {
                ctx.*.calibration[@bitCast(@as(isize, @intCast(i)))].bias = 0;
                ctx.*.calibration[@bitCast(@as(isize, @intCast(i)))].scale = 1.0;
            }
        }
    }
    {
        i = 0;
        while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(ctx.*.calibration)) / @sizeOf(@TypeOf(ctx.*.calibration[@as(c_int, 0)])))) : (i += 1) {
            var scale: f64 = @floatCast(ctx.*.calibration[@bitCast(@as(isize, @intCast(i)))].scale);
            _ = &scale;
            if (i < @as(c_int, 3)) {
                scale *= ((@as(f64, @floatFromInt(ctx.*.gyro_numerator)) / @as(f64, @floatFromInt(@as(c_int, ctx.*.gyro_denominator)))) * SDL_PI_D) / @as(f64, 180.0);
                if ((@as(c_int, device.*.vendor_id) == USB_VENDOR_SONY) and (@as(c_int, device.*.product_id) == USB_PRODUCT_SONY_DS4_STRIKEPAD)) {
                    scale *= 2.0;
                }
            } else {
                scale *= (@as(f64, @floatFromInt(ctx.*.accel_numerator)) / @as(f64, @floatFromInt(@as(c_int, ctx.*.accel_denominator)))) * @as(f64, @floatCast(SDL_STANDARD_GRAVITY));
                if ((@as(c_int, device.*.vendor_id) == USB_VENDOR_SONY) and (@as(c_int, device.*.product_id) == USB_PRODUCT_SONY_DS4_STRIKEPAD)) {
                    scale *= -@as(f64, 2.0);
                }
            }
            ctx.*.calibration[@bitCast(@as(isize, @intCast(i)))].scale = @floatCast(scale);
        }
    }
}
pub fn HIDAPI_DriverPS4_ApplyCalibrationData(ctx: [*c]SDL_DriverPS4_Context, index_1: c_int, value: Sint16) callconv(.c) f32 {
    @setEvalBranchQuota(100000);
    var calibration: [*c]IMUCalibrationData = &ctx.*.calibration[@bitCast(@as(isize, @intCast(index_1)))];
    _ = &calibration;
    return (@as(f32, @floatFromInt(value)) - @as(f32, @floatFromInt(@as(c_int, calibration.*.bias)))) * calibration.*.scale;
}
pub fn HIDAPI_DriverPS4_UpdateEffects(ctx: [*c]SDL_DriverPS4_Context, mask: EPS4Effect, application_usage: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var effects: DS4EffectsState_t = undefined;
    _ = &effects;
    _ = memset(@ptrCast(@alignCast(&effects)), 0, @sizeOf(@TypeOf(effects)));
    if (ctx.*.vibration_supported) {
        effects.ucRumbleLeft = ctx.*.rumble_left;
        effects.ucRumbleRight = ctx.*.rumble_right;
    }
    if (ctx.*.lightbar_supported) {
        if (ctx.*.color_set) {
            effects.ucLedRed = ctx.*.led_red;
            effects.ucLedGreen = ctx.*.led_green;
            effects.ucLedBlue = ctx.*.led_blue;
        } else {
            SetLedsForPlayerIndex(&effects, ctx.*.player_index);
        }
    }
    return HIDAPI_DriverPS4_InternalSendJoystickEffect(ctx, @ptrCast(@alignCast(&effects)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(effects))))), mask, application_usage);
}
pub fn HIDAPI_DriverPS4_TickleBluetooth(device: [*c]SDL_HIDAPI_Device) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS4_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    if (ctx.*.enhanced_reports) {
        var data: [78]Uint8 = undefined;
        _ = &data;
        _ = memset(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&data))))), 0, @sizeOf(@TypeOf(data)));
        data[@as(c_int, 0)] = k_EPS4ReportIdBluetoothEffects;
        data[@as(c_int, 1)] = 192;
        if (SDL_HIDAPI_LockRumble()) {
            _ = SDL_HIDAPI_SendRumbleAndUnlock(device, @ptrCast(@alignCast(&data)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(data))))));
        }
    } else {}
}
pub fn HIDAPI_DriverPS4_SetEnhancedModeAvailable(ctx: [*c]SDL_DriverPS4_Context) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (ctx.*.enhanced_mode_available) {
        return;
    }
    ctx.*.enhanced_mode_available = @"true" != 0;
    if (ctx.*.touchpad_supported) {
        SDL_PrivateJoystickAddTouchpad(ctx.*.joystick, 2);
        ctx.*.report_touchpad = @"true" != 0;
    }
    if (ctx.*.sensors_supported) {
        SDL_PrivateJoystickAddSensor(ctx.*.joystick, SDL_SENSOR_GYRO, @floatFromInt(@divTrunc(@as(c_int, 1000), @as(c_int, ctx.*.report_interval))));
        SDL_PrivateJoystickAddSensor(ctx.*.joystick, SDL_SENSOR_ACCEL, @floatFromInt(@divTrunc(@as(c_int, 1000), @as(c_int, ctx.*.report_interval))));
    }
    if (ctx.*.guitar_tilt_supported) {
        SDL_PrivateJoystickAddSensor(ctx.*.joystick, SDL_SENSOR_ACCEL, @floatFromInt(@divTrunc(@as(c_int, 1000), @as(c_int, ctx.*.report_interval))));
    }
    if (ctx.*.official_controller) {
        ctx.*.report_battery = @"true" != 0;
    }
    HIDAPI_UpdateDeviceProperties(ctx.*.device);
}
pub fn HIDAPI_DriverPS4_SetEnhancedMode(ctx: [*c]SDL_DriverPS4_Context) callconv(.c) void {
    @setEvalBranchQuota(100000);
    HIDAPI_DriverPS4_SetEnhancedModeAvailable(ctx);
    if (!ctx.*.enhanced_mode) {
        ctx.*.enhanced_mode = @"true" != 0;
        _ = HIDAPI_DriverPS4_UpdateEffects(ctx, 0, @"false" != 0);
    }
}
pub fn HIDAPI_DriverPS4_SetEnhancedReportHint(ctx: [*c]SDL_DriverPS4_Context, enhanced_report_hint: HIDAPI_PS4_EnhancedReportHint) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (enhanced_report_hint) {
                    @as(HIDAPI_PS4_EnhancedReportHint, PS4_ENHANCED_REPORT_HINT_OFF) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(HIDAPI_PS4_EnhancedReportHint, PS4_ENHANCED_REPORT_HINT_ON) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(HIDAPI_PS4_EnhancedReportHint, PS4_ENHANCED_REPORT_HINT_AUTO) => {
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
                ctx.*.enhanced_report_hint = enhanced_report_hint;
                {}
            },
            2 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                HIDAPI_DriverPS4_SetEnhancedMode(ctx);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                HIDAPI_DriverPS4_SetEnhancedModeAvailable(ctx);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverPS4_UpdateEnhancedModeOnEnhancedReport(ctx: [*c]SDL_DriverPS4_Context) callconv(.c) void {
    @setEvalBranchQuota(100000);
    ctx.*.enhanced_reports = @"true" != 0;
    if (ctx.*.enhanced_report_hint == @as(HIDAPI_PS4_EnhancedReportHint, PS4_ENHANCED_REPORT_HINT_AUTO)) {
        HIDAPI_DriverPS4_SetEnhancedReportHint(ctx, PS4_ENHANCED_REPORT_HINT_ON);
    }
}
pub fn HIDAPI_DriverPS4_UpdateEnhancedModeOnApplicationUsage(ctx: [*c]SDL_DriverPS4_Context) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (ctx.*.enhanced_report_hint == @as(HIDAPI_PS4_EnhancedReportHint, PS4_ENHANCED_REPORT_HINT_AUTO)) {
        HIDAPI_DriverPS4_SetEnhancedReportHint(ctx, PS4_ENHANCED_REPORT_HINT_ON);
    }
}
pub fn SDL_PS4EnhancedReportsChanged(userdata: ?*anyopaque, _: [*c]const u8, _: [*c]const u8, hint: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS4_Context = @ptrCast(@alignCast(userdata));
    _ = &ctx;
    if (ctx.*.device.*.is_bluetooth) {
        if ((hint != null) and (SDL_strcasecmp_REAL(hint, "auto") == @as(c_int, 0))) {
            HIDAPI_DriverPS4_SetEnhancedReportHint(ctx, PS4_ENHANCED_REPORT_HINT_AUTO);
        } else if (SDL_GetStringBoolean(hint, @"true" != 0)) {
            HIDAPI_DriverPS4_SetEnhancedReportHint(ctx, PS4_ENHANCED_REPORT_HINT_ON);
        } else {
            HIDAPI_DriverPS4_SetEnhancedReportHint(ctx, PS4_ENHANCED_REPORT_HINT_OFF);
        }
    } else {
        HIDAPI_DriverPS4_SetEnhancedReportHint(ctx, PS4_ENHANCED_REPORT_HINT_ON);
    }
}
pub fn SDL_PS4ReportIntervalHintChanged(userdata: ?*anyopaque, _: [*c]const u8, _: [*c]const u8, hint: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var DEFAULT_REPORT_INTERVAL: c_int = undefined;
    _ = &DEFAULT_REPORT_INTERVAL;
    var ctx: [*c]SDL_DriverPS4_Context = undefined;
    _ = &ctx;
    var new_report_interval: c_int = undefined;
    _ = &new_report_interval;
    var report_interval: c_int = undefined;
    _ = &report_interval;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                DEFAULT_REPORT_INTERVAL = 4;
                ctx = @ptrCast(@alignCast(userdata));
                new_report_interval = DEFAULT_REPORT_INTERVAL;
                if (hint != null) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                report_interval = SDL_atoi_REAL(hint);
                switch (report_interval) {
                    @as(c_int, 1) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 7;
                        continue;
                    },
                    else => {
                        sdl_pc = 8;
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
                if (new_report_interval != @as(c_int, ctx.*.report_interval)) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
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
                new_report_interval = report_interval;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            8 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            9 => {
                ctx.*.report_interval = @bitCast(@as(i8, @truncate(new_report_interval)));
                _ = HIDAPI_DriverPS4_UpdateEffects(ctx, 0, @"false" != 0);
                SDL_LockJoysticks_REAL();
                SDL_PrivateJoystickSensorRate(ctx.*.joystick, SDL_SENSOR_GYRO, @floatFromInt(@divTrunc(@as(c_int, 1000), @as(c_int, ctx.*.report_interval))));
                SDL_PrivateJoystickSensorRate(ctx.*.joystick, SDL_SENSOR_ACCEL, @floatFromInt(@divTrunc(@as(c_int, 1000), @as(c_int, ctx.*.report_interval))));
                SDL_UnlockJoysticks_REAL();
                {
                    sdl_pc = 11;
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
                {}
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverPS4_SetDevicePlayerIndex(device: [*c]SDL_HIDAPI_Device, _: SDL_JoystickID, player_index: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS4_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    if (!(ctx.*.joystick != null)) {
        return;
    }
    ctx.*.player_index = player_index;
    _ = HIDAPI_DriverPS4_UpdateEffects(ctx, k_EPS4EffectLED, @"false" != 0);
}
pub fn HIDAPI_DriverPS4_OpenJoystick(device: [*c]SDL_HIDAPI_Device, joystick: [*c]SDL_Joystick) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS4_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    SDL_AssertJoysticksLocked();
    ctx.*.joystick = joystick;
    ctx.*.last_packet = SDL_GetTicks_REAL();
    ctx.*.report_sensors = @"false" != 0;
    ctx.*.report_touchpad = @"false" != 0;
    ctx.*.rumble_left = 0;
    ctx.*.rumble_right = 0;
    ctx.*.color_set = @"false" != 0;
    _ = memset(@ptrCast(@alignCast(&ctx.*.last_state)), 0, @sizeOf(@TypeOf(ctx.*.last_state)));
    ctx.*.player_index = SDL_GetJoystickPlayerIndex_REAL(joystick);
    joystick.*.nbuttons = 11;
    if (ctx.*.touchpad_supported) {
        joystick.*.nbuttons += 1;
    }
    joystick.*.naxes = SDL_GAMEPAD_AXIS_COUNT;
    joystick.*.nhats = 1;
    _ = SDL_AddHintCallback_REAL("SDL_JOYSTICK_HIDAPI_PS4_REPORT_INTERVAL", SDL_PS4ReportIntervalHintChanged, @ptrCast(@alignCast(ctx)));
    _ = SDL_AddHintCallback_REAL("SDL_JOYSTICK_ENHANCED_REPORTS", SDL_PS4EnhancedReportsChanged, @ptrCast(@alignCast(ctx)));
    return @"true" != 0;
}
pub fn HIDAPI_DriverPS4_RumbleJoystick(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, low_frequency_rumble: Uint16, high_frequency_rumble: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS4_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    if (!ctx.*.vibration_supported) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    ctx.*.rumble_left = @bitCast(@as(i8, @truncate(@as(c_int, low_frequency_rumble) >> @intCast(@as(c_int, 8)))));
    ctx.*.rumble_right = @bitCast(@as(i8, @truncate(@as(c_int, high_frequency_rumble) >> @intCast(@as(c_int, 8)))));
    return HIDAPI_DriverPS4_UpdateEffects(ctx, k_EPS4EffectRumble, @"true" != 0);
}
pub fn HIDAPI_DriverPS4_RumbleJoystickTriggers(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: Uint16, _: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverPS4_GetJoystickCapabilities(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS4_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    var result: Uint32 = 0;
    _ = &result;
    if (ctx.*.enhanced_mode_available) {
        if (ctx.*.lightbar_supported) {
            result |= SDL_JOYSTICK_CAP_RGB_LED;
        }
        if (ctx.*.vibration_supported) {
            result |= SDL_JOYSTICK_CAP_RUMBLE;
        }
    }
    return result;
}
pub fn HIDAPI_DriverPS4_SetJoystickLED(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, red: Uint8, green: Uint8, blue: Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS4_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    if (!ctx.*.lightbar_supported) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    ctx.*.color_set = @"true" != 0;
    ctx.*.led_red = red;
    ctx.*.led_green = green;
    ctx.*.led_blue = blue;
    return HIDAPI_DriverPS4_UpdateEffects(ctx, k_EPS4EffectLED, @"true" != 0);
}
pub fn HIDAPI_DriverPS4_InternalSendJoystickEffect(ctx: [*c]SDL_DriverPS4_Context, effect: ?*const anyopaque, size: c_int, mask: EPS4Effect, application_usage: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var data: [78]Uint8 = undefined;
    _ = &data;
    var report_size: c_int = undefined;
    _ = &report_size;
    var offset: c_int = undefined;
    _ = &offset;
    if (!ctx.*.effects_supported) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    if (!ctx.*.enhanced_mode) {
        if (application_usage) {
            HIDAPI_DriverPS4_UpdateEnhancedModeOnApplicationUsage(ctx);
        }
        if (!ctx.*.enhanced_mode) {
            return SDL_SetError_REAL("That operation is not supported");
        }
    }
    _ = memset(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&data))))), 0, @sizeOf(@TypeOf(data)));
    if (ctx.*.device.*.is_bluetooth and ctx.*.official_controller) {
        data[@as(c_int, 0)] = k_EPS4ReportIdBluetoothEffects;
        data[@as(c_int, 1)] = @bitCast(@as(i8, @truncate(@as(c_int, 192) | @as(c_int, ctx.*.report_interval))));
        data[@as(c_int, 3)] = @truncate(if (ctx.*.official_controller) mask else @as(EPS4Effect, @bitCast(k_EPS4EffectRumble | k_EPS4EffectLED)));
        report_size = 78;
        offset = 6;
    } else {
        data[@as(c_int, 0)] = k_EPS4ReportIdUsbEffects;
        data[@as(c_int, 1)] = @truncate(if (ctx.*.official_controller) mask else @as(EPS4Effect, @bitCast((k_EPS4EffectRumble | k_EPS4EffectLED) | k_EPS4EffectLEDBlink)));
        report_size = 32;
        offset = 4;
    }
    _ = memcpy(@ptrCast(@alignCast(&data[@bitCast(@as(isize, @intCast(offset)))])), effect, if ((@sizeOf(@TypeOf(data)) -% @as(c_ulong, @bitCast(@as(c_long, offset)))) < @as(usize, @bitCast(@as(c_long, size)))) @sizeOf(@TypeOf(data)) -% @as(c_ulong, @bitCast(@as(c_long, offset))) else @as(usize, @bitCast(@as(c_long, size))));
    if (ctx.*.device.*.is_bluetooth) {
        var ubHdr: Uint8 = 162;
        _ = &ubHdr;
        var unCRC: Uint32 = undefined;
        _ = &unCRC;
        unCRC = SDL_crc32_REAL(0, @ptrCast(@alignCast(&ubHdr)), 1);
        unCRC = SDL_crc32_REAL(unCRC, @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&data))))), @as(c_ulong, @bitCast(@as(c_long, report_size))) -% @sizeOf(@TypeOf(unCRC)));
        _ = memcpy(@ptrCast(@alignCast(&data[@as(c_ulong, @bitCast(@as(c_long, report_size))) -% @sizeOf(@TypeOf(unCRC))])), @ptrCast(@alignCast(&unCRC)), @sizeOf(@TypeOf(unCRC)));
    }
    if (SDL_HIDAPI_SendRumble(ctx.*.device, @ptrCast(@alignCast(&data)), report_size) != report_size) {
        return SDL_SetError_REAL("Couldn't send rumble packet");
    }
    return @"true" != 0;
}
pub fn HIDAPI_DriverPS4_SendJoystickEffect(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, effect: ?*const anyopaque, size: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS4_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    var mask: EPS4Effect = undefined;
    _ = &mask;
    if (ctx.*.device.*.is_bluetooth and ctx.*.official_controller) {
        mask = @bitCast(k_EPS4EffectRumble | k_EPS4EffectLED);
    } else {
        mask = @bitCast((k_EPS4EffectRumble | k_EPS4EffectLED) | k_EPS4EffectLEDBlink);
    }
    return HIDAPI_DriverPS4_InternalSendJoystickEffect(ctx, effect, size, mask, @"true" != 0);
}
pub fn HIDAPI_DriverPS4_SetJoystickSensorsEnabled(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, enabled: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS4_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    HIDAPI_DriverPS4_UpdateEnhancedModeOnApplicationUsage(ctx);
    if ((!ctx.*.sensors_supported or (enabled and !ctx.*.enhanced_mode)) and !ctx.*.guitar_tilt_supported) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    if (enabled) {
        HIDAPI_DriverPS4_LoadCalibrationData(device);
    }
    ctx.*.report_sensors = enabled;
    return @"true" != 0;
}
pub fn HIDAPI_DriverPS4_HandleStatePacket(joystick: [*c]SDL_Joystick, _: ?*SDL_hid_device, ctx: [*c]SDL_DriverPS4_Context, packet: [*c]PS4StatePacket_t, size: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local_TOUCHPAD_SCALEX = struct {
        const TOUCHPAD_SCALEX: f32 = 0.000521;
    };
    _ = &static_local_TOUCHPAD_SCALEX;
    const static_local_TOUCHPAD_SCALEY = struct {
        const TOUCHPAD_SCALEY: f32 = 0.001087;
    };
    _ = &static_local_TOUCHPAD_SCALEY;
    var axis: Sint16 = undefined;
    _ = &axis;
    var touchpad_down: bool = undefined;
    _ = &touchpad_down;
    var touchpad_x: c_int = undefined;
    _ = &touchpad_x;
    var touchpad_y: c_int = undefined;
    _ = &touchpad_y;
    var timestamp: Uint64 = undefined;
    _ = &timestamp;
    var data: Uint8 = undefined;
    _ = &data;
    var hat: Uint8 = undefined;
    _ = &hat;
    var data_1: Uint8 = undefined;
    _ = &data_1;
    var data_2: Uint8 = undefined;
    _ = &data_2;
    var data_3: Uint8 = undefined;
    _ = &data_3;
    var data_4: Uint8 = undefined;
    _ = &data_4;
    var state: SDL_PowerState = undefined;
    _ = &state;
    var percent: c_int = undefined;
    _ = &percent;
    var level: Uint8 = undefined;
    _ = &level;
    var tick: Uint16 = undefined;
    _ = &tick;
    var delta: Uint16 = undefined;
    _ = &delta;
    var sensor_timestamp: Uint64 = undefined;
    _ = &sensor_timestamp;
    var data_5: [3]f32 = undefined;
    _ = &data_5;
    const static_local_effects_mappings = struct {
        const effects_mappings: [5]Sint16 = [5]Sint16{
            24576,
            11008,
            @truncate(-@as(c_int, 1792)),
            @truncate(-@as(c_int, 13568)),
            @truncate(-@as(c_int, 26880)),
        };
    };
    _ = &static_local_effects_mappings;
    var sensor_data: [3]f32 = undefined;
    _ = &sensor_data;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                timestamp = SDL_GetTicksNS_REAL();
                if (((size > @as(c_int, 9)) and ctx.*.report_touchpad) and ctx.*.enhanced_reports) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                touchpad_down = (@as(c_int, packet.*.ucTouchpadCounter1) & @as(c_int, 128)) == @as(c_int, 0);
                touchpad_x = @as(c_int, packet.*.rgucTouchpadData1[@as(c_int, 0)]) | ((@as(c_int, packet.*.rgucTouchpadData1[@as(c_int, 1)]) & @as(c_int, 15)) << @intCast(@as(c_int, 8)));
                touchpad_y = (@as(c_int, packet.*.rgucTouchpadData1[@as(c_int, 1)]) >> @intCast(@as(c_int, 4))) | (@as(c_int, packet.*.rgucTouchpadData1[@as(c_int, 2)]) << @intCast(@as(c_int, 4)));
                SDL_SendJoystickTouchpad(timestamp, joystick, 0, 0, touchpad_down, @as(f32, @floatFromInt(touchpad_x)) * static_local_TOUCHPAD_SCALEX.TOUCHPAD_SCALEX, @as(f32, @floatFromInt(touchpad_y)) * static_local_TOUCHPAD_SCALEY.TOUCHPAD_SCALEY, if (touchpad_down) @as(f32, 1.0) else @as(f32, 0.0));
                touchpad_down = (@as(c_int, packet.*.ucTouchpadCounter2) & @as(c_int, 128)) == @as(c_int, 0);
                touchpad_x = @as(c_int, packet.*.rgucTouchpadData2[@as(c_int, 0)]) | ((@as(c_int, packet.*.rgucTouchpadData2[@as(c_int, 1)]) & @as(c_int, 15)) << @intCast(@as(c_int, 8)));
                touchpad_y = (@as(c_int, packet.*.rgucTouchpadData2[@as(c_int, 1)]) >> @intCast(@as(c_int, 4))) | (@as(c_int, packet.*.rgucTouchpadData2[@as(c_int, 2)]) << @intCast(@as(c_int, 4)));
                SDL_SendJoystickTouchpad(timestamp, joystick, 0, 1, touchpad_down, @as(f32, @floatFromInt(touchpad_x)) * static_local_TOUCHPAD_SCALEX.TOUCHPAD_SCALEX, @as(f32, @floatFromInt(touchpad_y)) * static_local_TOUCHPAD_SCALEY.TOUCHPAD_SCALEY, if (touchpad_down) @as(f32, 1.0) else @as(f32, 0.0));
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
                if (@as(c_int, ctx.*.last_state.rgucButtonsHatAndCounter[@as(c_int, 0)]) != @as(c_int, packet.*.rgucButtonsHatAndCounter[@as(c_int, 0)])) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                data = @bitCast(@as(i8, @truncate(@as(c_int, packet.*.rgucButtonsHatAndCounter[@as(c_int, 0)]) >> @intCast(@as(c_int, 4)))));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_WEST, (@as(c_int, data) & @as(c_int, 1)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SOUTH, (@as(c_int, data) & @as(c_int, 2)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_EAST, (@as(c_int, data) & @as(c_int, 4)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_NORTH, (@as(c_int, data) & @as(c_int, 8)) != @as(c_int, 0));
                data_1 = @bitCast(@as(i8, @truncate(@as(c_int, packet.*.rgucButtonsHatAndCounter[@as(c_int, 0)]) & @as(c_int, 15))));
                switch (@as(c_int, data_1)) {
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
                    @as(c_int, 4) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(c_int, 5) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(c_int, 6) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(c_int, 7) => {
                        sdl_pc = 15;
                        continue;
                    },
                    else => {
                        sdl_pc = 16;
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
                if (@as(c_int, ctx.*.last_state.rgucButtonsHatAndCounter[@as(c_int, 1)]) != @as(c_int, packet.*.rgucButtonsHatAndCounter[@as(c_int, 1)])) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            7 => {
                SDL_SendJoystickHat(timestamp, joystick, 0, hat);
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            8 => {
                hat = SDL_HAT_UP;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            9 => {
                hat = @truncate(SDL_HAT_RIGHT | SDL_HAT_UP);
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            10 => {
                hat = SDL_HAT_RIGHT;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            11 => {
                hat = @truncate(SDL_HAT_RIGHT | SDL_HAT_DOWN);
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            12 => {
                hat = SDL_HAT_DOWN;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            13 => {
                hat = @truncate(SDL_HAT_LEFT | SDL_HAT_DOWN);
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            14 => {
                hat = SDL_HAT_LEFT;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            15 => {
                hat = @truncate(SDL_HAT_LEFT | SDL_HAT_UP);
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            16 => {
                hat = SDL_HAT_CENTERED;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            17 => {
                data_2 = packet.*.rgucButtonsHatAndCounter[@as(c_int, 1)];
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_SHOULDER, (@as(c_int, data_2) & @as(c_int, 1)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER, (@as(c_int, data_2) & @as(c_int, 2)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_BACK, (@as(c_int, data_2) & @as(c_int, 16)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_START, (@as(c_int, data_2) & @as(c_int, 32)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_STICK, (@as(c_int, data_2) & @as(c_int, 64)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_STICK, (@as(c_int, data_2) & @as(c_int, 128)) != @as(c_int, 0));
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
                if ((@as(c_int, packet.*.rgucButtonsHatAndCounter[@as(c_int, 1)]) & @as(c_int, 12)) != 0) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                data_3 = packet.*.rgucButtonsHatAndCounter[@as(c_int, 1)];
                packet.*.ucTriggerLeft = @bitCast(@as(i8, @truncate(if (((@as(c_int, data_3) & @as(c_int, 4)) != 0) and (@as(c_int, packet.*.ucTriggerLeft) == @as(c_int, 0))) @as(c_int, 255) else @as(c_int, packet.*.ucTriggerLeft))));
                packet.*.ucTriggerRight = @bitCast(@as(i8, @truncate(if (((@as(c_int, data_3) & @as(c_int, 8)) != 0) and (@as(c_int, packet.*.ucTriggerRight) == @as(c_int, 0))) @as(c_int, 255) else @as(c_int, packet.*.ucTriggerRight))));
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
                if (@as(c_int, ctx.*.last_state.rgucButtonsHatAndCounter[@as(c_int, 2)]) != @as(c_int, packet.*.rgucButtonsHatAndCounter[@as(c_int, 2)])) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                data_4 = @bitCast(@as(i8, @truncate(@as(c_int, packet.*.rgucButtonsHatAndCounter[@as(c_int, 2)]) & @as(c_int, 3))));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_GUIDE, (@as(c_int, data_4) & @as(c_int, 1)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_PS4_TOUCHPAD, (@as(c_int, data_4) & @as(c_int, 2)) != @as(c_int, 0));
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
                axis = @truncate((@as(c_int, packet.*.ucTriggerLeft) * @as(c_int, 257)) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFT_TRIGGER, axis);
                axis = @truncate((@as(c_int, packet.*.ucTriggerRight) * @as(c_int, 257)) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHT_TRIGGER, axis);
                axis = @truncate((@as(c_int, packet.*.ucLeftJoystickX) * @as(c_int, 257)) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, axis);
                axis = @truncate((@as(c_int, packet.*.ucLeftJoystickY) * @as(c_int, 257)) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, axis);
                axis = @truncate((@as(c_int, packet.*.ucRightJoystickX) * @as(c_int, 257)) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, axis);
                axis = @truncate((@as(c_int, packet.*.ucRightJoystickY) * @as(c_int, 257)) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, axis);
                if (((size > @as(c_int, 9)) and ctx.*.report_battery) and ctx.*.enhanced_reports) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            26 => {
                level = @bitCast(@as(i8, @truncate(@as(c_int, packet.*.ucBatteryLevel) & @as(c_int, 15))));
                if ((@as(c_int, packet.*.ucBatteryLevel) & @as(c_int, 16)) != 0) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
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
                if ((size > @as(c_int, 9)) and ctx.*.report_sensors) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
                    continue;
                }
            },
            29 => {
                if (@as(c_int, level) <= @as(c_int, 10)) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            30 => {
                state = SDL_POWERSTATE_ON_BATTERY;
                percent = if (((@as(c_int, level) * @as(c_int, 10)) + @as(c_int, 5)) < @as(c_int, 100)) (@as(c_int, level) * @as(c_int, 10)) + @as(c_int, 5) else @as(c_int, 100);
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            31 => {
                SDL_SendJoystickPowerInfo(joystick, state, percent);
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            32 => {
                state = SDL_POWERSTATE_CHARGING;
                percent = if (((@as(c_int, level) * @as(c_int, 10)) + @as(c_int, 5)) < @as(c_int, 100)) (@as(c_int, level) * @as(c_int, 10)) + @as(c_int, 5) else @as(c_int, 100);
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            33 => {
                if (@as(c_int, level) == @as(c_int, 11)) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
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
                state = SDL_POWERSTATE_CHARGED;
                percent = 100;
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            36 => {
                state = SDL_POWERSTATE_UNKNOWN;
                percent = 0;
                {
                    sdl_pc = 37;
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
                tick = @bitCast(@as(c_short, @as(Sint16, @truncate(@as(c_int, @as(Uint16, packet.*.rgucTimestamp[@as(c_int, 0)])) | (@as(c_int, @as(Uint16, packet.*.rgucTimestamp[@as(c_int, 1)])) << @intCast(@as(c_int, 8)))))));
                if (@as(c_int, ctx.*.last_tick) <= @as(c_int, tick)) {
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
                if (ctx.*.guitar_whammy_supported) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            41 => {
                delta = @bitCast(@as(c_short, @truncate(@as(c_int, tick) - @as(c_int, ctx.*.last_tick))));
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            42 => {
                delta = @bitCast(@as(c_short, @truncate(((@as(c_int, @as(Uint16, @bitCast(@as(c_short, @truncate(@as(c_int, 65535)))))) - @as(c_int, ctx.*.last_tick)) + @as(c_int, tick)) + @as(c_int, 1))));
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            43 => {
                ctx.*.sensor_ticks +%= @bitCast(@as(c_long, @as(c_int, delta)));
                ctx.*.last_tick = tick;
                sensor_timestamp = ((ctx.*.sensor_ticks *% @as(Uint64, SDL_NS_PER_US)) *% @as(Uint64, 16)) / @as(Uint64, 3);
                data_5[@as(c_int, 0)] = HIDAPI_DriverPS4_ApplyCalibrationData(ctx, 0, @truncate(@as(c_int, @as(Uint16, packet.*.rgucGyroX[@as(c_int, 0)])) | (@as(c_int, @as(Uint16, packet.*.rgucGyroX[@as(c_int, 1)])) << @intCast(@as(c_int, 8)))));
                data_5[@as(c_int, 1)] = HIDAPI_DriverPS4_ApplyCalibrationData(ctx, 1, @truncate(@as(c_int, @as(Uint16, packet.*.rgucGyroY[@as(c_int, 0)])) | (@as(c_int, @as(Uint16, packet.*.rgucGyroY[@as(c_int, 1)])) << @intCast(@as(c_int, 8)))));
                data_5[@as(c_int, 2)] = HIDAPI_DriverPS4_ApplyCalibrationData(ctx, 2, @truncate(@as(c_int, @as(Uint16, packet.*.rgucGyroZ[@as(c_int, 0)])) | (@as(c_int, @as(Uint16, packet.*.rgucGyroZ[@as(c_int, 1)])) << @intCast(@as(c_int, 8)))));
                SDL_SendJoystickSensor(timestamp, joystick, SDL_SENSOR_GYRO, sensor_timestamp, @ptrCast(@alignCast(&data_5)), 3);
                data_5[@as(c_int, 0)] = HIDAPI_DriverPS4_ApplyCalibrationData(ctx, 3, @truncate(@as(c_int, @as(Uint16, packet.*.rgucAccelX[@as(c_int, 0)])) | (@as(c_int, @as(Uint16, packet.*.rgucAccelX[@as(c_int, 1)])) << @intCast(@as(c_int, 8)))));
                data_5[@as(c_int, 1)] = HIDAPI_DriverPS4_ApplyCalibrationData(ctx, 4, @truncate(@as(c_int, @as(Uint16, packet.*.rgucAccelY[@as(c_int, 0)])) | (@as(c_int, @as(Uint16, packet.*.rgucAccelY[@as(c_int, 1)])) << @intCast(@as(c_int, 8)))));
                data_5[@as(c_int, 2)] = HIDAPI_DriverPS4_ApplyCalibrationData(ctx, 5, @truncate(@as(c_int, @as(Uint16, packet.*.rgucAccelZ[@as(c_int, 0)])) | (@as(c_int, @as(Uint16, packet.*.rgucAccelZ[@as(c_int, 1)])) << @intCast(@as(c_int, 8)))));
                SDL_SendJoystickSensor(timestamp, joystick, SDL_SENSOR_ACCEL, sensor_timestamp, @ptrCast(@alignCast(&data_5)), 3);
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            44 => {
                axis = @truncate((@as(c_int, packet.*.rgucDeviceSpecific[@as(c_int, 1)]) * @as(c_int, 257)) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, axis);
                {
                    sdl_pc = 46;
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
                if (ctx.*.guitar_effects_selector_supported) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            47 => {
                if (@as(c_ulong, @bitCast(@as(c_long, @as(c_int, packet.*.rgucDeviceSpecific[@as(c_int, 0)])))) < (@sizeOf(@TypeOf(static_local_effects_mappings.effects_mappings)) / @sizeOf(@TypeOf(static_local_effects_mappings.effects_mappings[@as(c_int, 0)])))) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
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
                if (ctx.*.guitar_tilt_supported) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 54;
                    continue;
                }
            },
            50 => {
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, static_local_effects_mappings.effects_mappings[packet.*.rgucDeviceSpecific[@as(c_int, 0)]]);
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
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            53 => {
                sensor_data[@as(c_int, 0)] = (@as(f32, @floatFromInt(packet.*.rgucDeviceSpecific[@as(c_int, 2)])) / @as(f32, @floatFromInt(@as(c_int, 255)))) * SDL_STANDARD_GRAVITY;
                sensor_data[@as(c_int, 1)] = @floatFromInt(@as(c_int, 0));
                sensor_data[@as(c_int, 2)] = @floatFromInt(@as(c_int, 0));
                SDL_SendJoystickSensor(timestamp, joystick, SDL_SENSOR_ACCEL, timestamp, @ptrCast(@alignCast(&sensor_data)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(sensor_data)) / @sizeOf(@TypeOf(sensor_data[@as(c_int, 0)]))))));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER, @as(c_int, packet.*.rgucDeviceSpecific[@as(c_int, 2)]) > @as(c_int, 240));
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
                _ = memcpy(@ptrCast(@alignCast(&ctx.*.last_state)), @ptrCast(@alignCast(packet)), @sizeOf(@TypeOf(ctx.*.last_state)));
                {}
            },
            else => unreachable,
        }
    }
}
pub fn VerifyCRC(data: [*c]Uint8, size: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ubHdr: Uint8 = 161;
    _ = &ubHdr;
    var unCRC: Uint32 = undefined;
    _ = &unCRC;
    var unPacketCRC: Uint32 = undefined;
    _ = &unPacketCRC;
    var packetCRC: [*c]Uint8 = (data + @as(usize, @bitCast(@as(isize, @intCast(size))))) - @sizeOf(@TypeOf(unPacketCRC));
    _ = &packetCRC;
    unCRC = SDL_crc32_REAL(0, @ptrCast(@alignCast(&ubHdr)), 1);
    unCRC = SDL_crc32_REAL(unCRC, @ptrCast(@alignCast(data)), @as(c_ulong, @bitCast(@as(c_long, size))) -% @sizeOf(@TypeOf(unCRC)));
    unPacketCRC = (((@as(Uint32, packetCRC[@as(c_int, 0)]) << @intCast(@as(Uint32, 0))) | (@as(Uint32, packetCRC[@as(c_int, 1)]) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, packetCRC[@as(c_int, 2)]) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, packetCRC[@as(c_int, 3)]) << @intCast(@as(Uint32, 24)));
    return unCRC == unPacketCRC;
}
pub fn HIDAPI_DriverPS4_IsPacketValid(ctx: [*c]SDL_DriverPS4_Context, data: [*c]Uint8, arg_size: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var size = arg_size;
    _ = &size;
    var packet: [*c]PS4StatePacket_t = undefined;
    _ = &packet;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (@as(c_int, data[@as(c_int, 0)])) {
                    k_EPS4ReportIdUsbState => {
                        sdl_pc = 2;
                        continue;
                    },
                    k_EPS4ReportIdBluetoothState1 => {
                        sdl_pc = 18;
                        continue;
                    },
                    k_EPS4ReportIdBluetoothState2 => {
                        sdl_pc = 19;
                        continue;
                    },
                    k_EPS4ReportIdBluetoothState3 => {
                        sdl_pc = 20;
                        continue;
                    },
                    k_EPS4ReportIdBluetoothState4 => {
                        sdl_pc = 21;
                        continue;
                    },
                    k_EPS4ReportIdBluetoothState5 => {
                        sdl_pc = 22;
                        continue;
                    },
                    k_EPS4ReportIdBluetoothState6 => {
                        sdl_pc = 23;
                        continue;
                    },
                    k_EPS4ReportIdBluetoothState7 => {
                        sdl_pc = 24;
                        continue;
                    },
                    k_EPS4ReportIdBluetoothState8 => {
                        sdl_pc = 25;
                        continue;
                    },
                    k_EPS4ReportIdBluetoothState9 => {
                        sdl_pc = 26;
                        continue;
                    },
                    else => {
                        sdl_pc = 39;
                        continue;
                    },
                }
            },
            1 => {
                return @"false" != 0;
            },
            2 => {
                if (size == @as(c_int, 10)) {
                    sdl_pc = 3;
                    continue;
                } else {
                    sdl_pc = 4;
                    continue;
                }
            },
            3 => {
                return @"true" != 0;
            },
            4 => {
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            5 => {
                if (ctx.*.is_nacon_dongle and (@as(c_ulong, @bitCast(@as(c_long, size))) >= (@as(c_ulong, 1) +% @sizeOf(PS4StatePacket_t)))) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 7;
                    continue;
                }
            },
            6 => {
                packet = @ptrCast(@alignCast(&data[@as(c_int, 1)]));
                if (SDL_memcmp_REAL(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&packet.*.rgucTimestamp))))), @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.last_state.rgucTimestamp))))), @sizeOf(@TypeOf(packet.*.rgucTimestamp))) == @as(c_int, 0)) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 10;
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
                if ((size >= @as(c_int, 64)) and !((@as(c_int, data[@as(c_int, 31)]) & @as(c_int, 4)) != 0)) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            9 => {
                return @"false" != 0;
            },
            10 => {
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                if ((((((@as(c_int, ctx.*.last_state.rgucAccelX[@as(c_int, 0)]) == @as(c_int, 0)) and (@as(c_int, ctx.*.last_state.rgucAccelX[@as(c_int, 1)]) == @as(c_int, 0))) and (@as(c_int, ctx.*.last_state.rgucAccelY[@as(c_int, 0)]) == @as(c_int, 0))) and (@as(c_int, ctx.*.last_state.rgucAccelY[@as(c_int, 1)]) == @as(c_int, 0))) and (@as(c_int, ctx.*.last_state.rgucAccelZ[@as(c_int, 0)]) == @as(c_int, 0))) and (@as(c_int, ctx.*.last_state.rgucAccelZ[@as(c_int, 1)]) == @as(c_int, 0))) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            12 => {
                _ = memcpy(@ptrCast(@alignCast(&ctx.*.last_state)), @ptrCast(@alignCast(&data[@as(c_int, 1)])), @sizeOf(PS4StatePacket_t));
                return @"false" != 0;
            },
            13 => {
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            14 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            15 => {
                return @"true" != 0;
            },
            16 => {
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 1;
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
                    sdl_pc = 20;
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
                    sdl_pc = 22;
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
                {
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
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            26 => {
                if ((size >= @as(c_int, 78)) and ((@as(c_int, data[@as(c_int, 1)]) & @as(c_int, 128)) != 0)) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            27 => {
                if (VerifyCRC(data, 78)) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
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
                    sdl_pc = 1;
                    continue;
                }
            },
            30 => {
                ctx.*.valid_crc_packets +%= 1;
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            31 => {
                if (@as(c_int, ctx.*.valid_crc_packets) > @as(c_int, 0)) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 34;
                    continue;
                }
            },
            32 => {
                return @"true" != 0;
            },
            33 => {
                ctx.*.valid_crc_packets -%= 1;
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
                if (@as(c_int, ctx.*.valid_crc_packets) >= @as(c_int, 3)) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 37;
                    continue;
                }
            },
            36 => {
                return @"false" != 0;
            },
            37 => {
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            38 => {
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            39 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverPS4_UpdateDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS4_Context = undefined;
    _ = &ctx;
    var joystick: [*c]SDL_Joystick = undefined;
    _ = &joystick;
    var data: [128]Uint8 = undefined;
    _ = &data;
    var size: c_int = undefined;
    _ = &size;
    var packet_count: c_int = undefined;
    _ = &packet_count;
    var now: Uint64 = undefined;
    _ = &now;
    var serial: [18]u8 = undefined;
    _ = &serial;
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
                    const tmp = SDL_hid_read_timeout_REAL(device.*.dev, @ptrCast(@alignCast(&data)), @sizeOf(@TypeOf(data)), 0);
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
                if (!HIDAPI_DriverPS4_IsPacketValid(ctx, @ptrCast(@alignCast(&data)), size)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            6 => {
                if (device.*.is_bluetooth) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
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
                packet_count += 1;
                ctx.*.last_packet = now;
                if (!(joystick != null)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
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
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                switch (@as(c_int, data[@as(c_int, 0)])) {
                    k_EPS4ReportIdUsbState => {
                        sdl_pc = 14;
                        continue;
                    },
                    k_EPS4ReportIdBluetoothState1 => {
                        sdl_pc = 15;
                        continue;
                    },
                    k_EPS4ReportIdBluetoothState2 => {
                        sdl_pc = 16;
                        continue;
                    },
                    k_EPS4ReportIdBluetoothState3 => {
                        sdl_pc = 17;
                        continue;
                    },
                    k_EPS4ReportIdBluetoothState4 => {
                        sdl_pc = 18;
                        continue;
                    },
                    k_EPS4ReportIdBluetoothState5 => {
                        sdl_pc = 19;
                        continue;
                    },
                    k_EPS4ReportIdBluetoothState6 => {
                        sdl_pc = 20;
                        continue;
                    },
                    k_EPS4ReportIdBluetoothState7 => {
                        sdl_pc = 21;
                        continue;
                    },
                    k_EPS4ReportIdBluetoothState8 => {
                        sdl_pc = 22;
                        continue;
                    },
                    k_EPS4ReportIdBluetoothState9 => {
                        sdl_pc = 23;
                        continue;
                    },
                    else => {
                        sdl_pc = 24;
                        continue;
                    },
                }
            },
            13 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            14 => {
                HIDAPI_DriverPS4_HandleStatePacket(joystick, device.*.dev, ctx, @ptrCast(@alignCast(&data[@as(c_int, 1)])), size - @as(c_int, 1));
                {
                    sdl_pc = 13;
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
                    sdl_pc = 17;
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
                    sdl_pc = 19;
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
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            23 => {
                HIDAPI_DriverPS4_UpdateEnhancedModeOnEnhancedReport(ctx);
                HIDAPI_DriverPS4_HandleStatePacket(joystick, device.*.dev, ctx, @ptrCast(@alignCast(&data[@as(c_int, 3)])), size - @as(c_int, 3));
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            24 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            25 => {
                if (packet_count == @as(c_int, 0)) {
                    sdl_pc = 28;
                    continue;
                } else {
                    sdl_pc = 29;
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
                if (ctx.*.is_dongle or ctx.*.is_nacon_dongle) {
                    sdl_pc = 37;
                    continue;
                } else {
                    sdl_pc = 38;
                    continue;
                }
            },
            28 => {
                if (now >= (ctx.*.last_packet +% @as(Uint64, BLUETOOTH_DISCONNECT_TIMEOUT_MS))) {
                    sdl_pc = 31;
                    continue;
                } else {
                    sdl_pc = 32;
                    continue;
                }
            },
            29 => {
                if ((device.*.num_joysticks == @as(c_int, 0)) and !HIDAPI_HasConnectedUSBDevice(device.*.serial)) {
                    sdl_pc = 34;
                    continue;
                } else {
                    sdl_pc = 35;
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
                HIDAPI_DriverPS4_TickleBluetooth(device);
                ctx.*.last_packet = now;
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
                _ = HIDAPI_JoystickConnected(device, null);
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
                    sdl_pc = 30;
                    continue;
                }
            },
            37 => {
                if (packet_count == @as(c_int, 0)) {
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
                if (((packet_count == @as(c_int, 0)) and (size < @as(c_int, 0))) and (device.*.num_joysticks > @as(c_int, 0))) {
                    sdl_pc = 55;
                    continue;
                } else {
                    sdl_pc = 56;
                    continue;
                }
            },
            40 => {
                if (device.*.num_joysticks > @as(c_int, 0)) {
                    sdl_pc = 43;
                    continue;
                } else {
                    sdl_pc = 44;
                    continue;
                }
            },
            41 => {
                if (device.*.num_joysticks == @as(c_int, 0)) {
                    sdl_pc = 49;
                    continue;
                } else {
                    sdl_pc = 50;
                    continue;
                }
            },
            42 => {
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            43 => {
                if (now >= (ctx.*.last_packet +% @as(Uint64, BLUETOOTH_DISCONNECT_TIMEOUT_MS))) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 47;
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
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            46 => {
                HIDAPI_JoystickDisconnected(device, device.*.joysticks[@as(c_int, 0)]);
                {
                    sdl_pc = 48;
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
                    sdl_pc = 45;
                    continue;
                }
            },
            49 => {
                size = ReadFeatureReport(device.*.dev, k_ePS4FeatureReportIdSerialNumber, @ptrCast(@alignCast(&data)), @sizeOf(@TypeOf(data)));
                if ((size >= @as(c_int, 7)) and ((((((@as(c_int, data[@as(c_int, 1)]) != 0) or (@as(c_int, data[@as(c_int, 2)]) != 0)) or (@as(c_int, data[@as(c_int, 3)]) != 0)) or (@as(c_int, data[@as(c_int, 4)]) != 0)) or (@as(c_int, data[@as(c_int, 5)]) != 0)) or (@as(c_int, data[@as(c_int, 6)]) != 0))) {
                    sdl_pc = 52;
                    continue;
                } else {
                    sdl_pc = 53;
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
                    sdl_pc = 42;
                    continue;
                }
            },
            52 => {
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&serial)), @sizeOf(@TypeOf(serial)), "%.2x-%.2x-%.2x-%.2x-%.2x-%.2x", data[@as(c_int, 6)], data[@as(c_int, 5)], data[@as(c_int, 4)], data[@as(c_int, 3)], data[@as(c_int, 2)], data[@as(c_int, 1)]);
                HIDAPI_SetDeviceSerial(device, @ptrCast(@alignCast(&serial)));
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            53 => {
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            54 => {
                _ = HIDAPI_JoystickConnected(device, null);
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            55 => {
                HIDAPI_JoystickDisconnected(device, device.*.joysticks[@as(c_int, 0)]);
                {
                    sdl_pc = 57;
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
                return size >= @as(c_int, 0);
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverPS4_CloseJoystick(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS4_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    SDL_RemoveHintCallback_REAL("SDL_JOYSTICK_HIDAPI_PS4_REPORT_INTERVAL", SDL_PS4ReportIntervalHintChanged, @ptrCast(@alignCast(ctx)));
    SDL_RemoveHintCallback_REAL("SDL_JOYSTICK_ENHANCED_REPORTS", SDL_PS4EnhancedReportsChanged, @ptrCast(@alignCast(ctx)));
    ctx.*.joystick = null;
    ctx.*.report_sensors = @"false" != 0;
    ctx.*.enhanced_mode = @"false" != 0;
    ctx.*.enhanced_mode_available = @"false" != 0;
}
pub fn HIDAPI_DriverPS4_FreeDevice(_: [*c]SDL_HIDAPI_Device) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub export var SDL_HIDAPI_DriverPS4: SDL_HIDAPI_DeviceDriver = SDL_HIDAPI_DeviceDriver{
    .name = "SDL_JOYSTICK_HIDAPI_PS4",
    .enabled = @"true" != 0,
    .RegisterHints = HIDAPI_DriverPS4_RegisterHints,
    .UnregisterHints = HIDAPI_DriverPS4_UnregisterHints,
    .IsEnabled = HIDAPI_DriverPS4_IsEnabled,
    .IsSupportedDevice = HIDAPI_DriverPS4_IsSupportedDevice,
    .InitDevice = HIDAPI_DriverPS4_InitDevice,
    .GetDevicePlayerIndex = HIDAPI_DriverPS4_GetDevicePlayerIndex,
    .SetDevicePlayerIndex = HIDAPI_DriverPS4_SetDevicePlayerIndex,
    .UpdateDevice = HIDAPI_DriverPS4_UpdateDevice,
    .OpenJoystick = HIDAPI_DriverPS4_OpenJoystick,
    .RumbleJoystick = HIDAPI_DriverPS4_RumbleJoystick,
    .RumbleJoystickTriggers = HIDAPI_DriverPS4_RumbleJoystickTriggers,
    .GetJoystickCapabilities = HIDAPI_DriverPS4_GetJoystickCapabilities,
    .SetJoystickLED = HIDAPI_DriverPS4_SetJoystickLED,
    .SendJoystickEffect = HIDAPI_DriverPS4_SendJoystickEffect,
    .SetJoystickSensorsEnabled = HIDAPI_DriverPS4_SetJoystickSensorsEnabled,
    .CloseJoystick = HIDAPI_DriverPS4_CloseJoystick,
    .FreeDevice = HIDAPI_DriverPS4_FreeDevice,
};

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_PI_D = @as(f64, 3.141592653589793238462643383279502884);
pub const SDL_STANDARD_GRAVITY = @as(f32, 9.80665);
pub const SDL_HAT_CENTERED = @as(c_uint, 0x00);
pub const SDL_HAT_UP = @as(c_uint, 0x01);
pub const SDL_HAT_RIGHT = @as(c_uint, 0x02);
pub const SDL_HAT_DOWN = @as(c_uint, 0x04);
pub const SDL_HAT_LEFT = @as(c_uint, 0x08);
pub const SDL_NS_PER_US = @as(c_int, 1000);
pub const USB_VENDOR_NACON_ALT = @as(c_int, 0x3285);
pub const USB_VENDOR_PDP = @as(c_int, 0x0e6f);
pub const USB_VENDOR_RAZER = @as(c_int, 0x1532);
pub const USB_VENDOR_SONY = @as(c_int, 0x054c);
pub const USB_PRODUCT_NACON_REVOLUTION_5_PRO_PS4_WIRELESS = @as(c_int, 0x0d16);
pub const USB_PRODUCT_SONY_DS4_DONGLE = @as(c_int, 0x0ba0);
pub const USB_PRODUCT_SONY_DS4_STRIKEPAD = @as(c_int, 0x05c5);
pub const USB_PRODUCT_VICTRIX_FS_PRO = @as(c_int, 0x0203);
pub const USB_PRODUCT_VICTRIX_FS_PRO_V2 = @as(c_int, 0x0207);
pub const SDL_JOYSTICK_CAP_RGB_LED = @as(c_int, 0x00000002);
pub const SDL_JOYSTICK_CAP_RUMBLE = @as(c_int, 0x00000010);
pub const BLUETOOTH_DISCONNECT_TIMEOUT_MS = @as(c_int, 500);
