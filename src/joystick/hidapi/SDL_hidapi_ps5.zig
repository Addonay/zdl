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
pub const SDL_JOYSTICK_TYPE_UNKNOWN: c_int = 0;
pub const SDL_JOYSTICK_TYPE_GAMEPAD: c_int = 1;
pub const SDL_JOYSTICK_TYPE_WHEEL: c_int = 2;
pub const SDL_JOYSTICK_TYPE_ARCADE_STICK: c_int = 3;
pub const SDL_JOYSTICK_TYPE_FLIGHT_STICK: c_int = 4;
pub const SDL_JOYSTICK_TYPE_GUITAR: c_int = 6;
pub const SDL_JOYSTICK_TYPE_DRUM_KIT: c_int = 7;
pub const enum_SDL_JoystickType = c_uint;
pub const SDL_JoystickType = enum_SDL_JoystickType;
pub extern fn SDL_GetJoystickFromID_REAL(instance_id: SDL_JoystickID) [*c]SDL_Joystick;
pub extern fn SDL_GetJoystickPlayerIndex_REAL(joystick: [*c]SDL_Joystick) c_int;
pub const SDL_GAMEPAD_TYPE_PS5: c_int = 6;
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
pub extern fn SDL_IsJoystickDualSenseEdge(vendor_id: Uint16, product_id: Uint16) bool;
pub extern fn SDL_PrivateJoystickAddTouchpad(joystick: [*c]SDL_Joystick, nfingers: c_int) void;
pub extern fn SDL_PrivateJoystickAddSensor(joystick: [*c]SDL_Joystick, @"type": SDL_SensorType, rate: f32) void;
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
pub extern fn SDL_HIDAPI_GetPendingRumbleLocked(device: [*c]SDL_HIDAPI_Device, data: [*c][*c]Uint8, size: [*c][*c]c_int, maximum_size: [*c]c_int) bool;
pub extern fn SDL_HIDAPI_SendRumbleAndUnlock(device: [*c]SDL_HIDAPI_Device, data: [*c]const Uint8, size: c_int) c_int;
pub extern fn SDL_HIDAPI_UnlockRumble() void;
pub const SDL_GAMEPAD_BUTTON_PS5_TOUCHPAD: c_int = 11;
pub const SDL_GAMEPAD_BUTTON_PS5_MICROPHONE: c_int = 12;
pub const SDL_GAMEPAD_BUTTON_PS5_LEFT_FUNCTION: c_int = 13;
pub const SDL_GAMEPAD_BUTTON_PS5_RIGHT_FUNCTION: c_int = 14;
pub const SDL_GAMEPAD_BUTTON_PS5_LEFT_PADDLE: c_int = 15;
pub const SDL_GAMEPAD_BUTTON_PS5_RIGHT_PADDLE: c_int = 16;
pub const k_EPS5ReportIdState: c_int = 1;
pub const k_EPS5ReportIdUsbEffects: c_int = 2;
pub const k_EPS5ReportIdBluetoothEffects: c_int = 49;
pub const k_EPS5ReportIdBluetoothState: c_int = 49;
pub const k_EPS5FeatureReportIdCapabilities: c_int = 3;
pub const k_EPS5FeatureReportIdCalibration: c_int = 5;
pub const k_EPS5FeatureReportIdSerialNumber: c_int = 9;
pub const k_EPS5FeatureReportIdFirmwareInfo: c_int = 32;
pub const PS5SimpleStatePacket_t = extern struct {
    ucLeftJoystickX: Uint8 = 0,
    ucLeftJoystickY: Uint8 = 0,
    ucRightJoystickX: Uint8 = 0,
    ucRightJoystickY: Uint8 = 0,
    rgucButtonsHatAndCounter: [3]Uint8 = @import("std").mem.zeroes([3]Uint8),
    ucTriggerLeft: Uint8 = 0,
    ucTriggerRight: Uint8 = 0,
};
pub const PS5StatePacketCommon_t = extern struct {
    ucLeftJoystickX: Uint8 = 0,
    ucLeftJoystickY: Uint8 = 0,
    ucRightJoystickX: Uint8 = 0,
    ucRightJoystickY: Uint8 = 0,
    ucTriggerLeft: Uint8 = 0,
    ucTriggerRight: Uint8 = 0,
    ucCounter: Uint8 = 0,
    rgucButtonsAndHat: [4]Uint8 = @import("std").mem.zeroes([4]Uint8),
    rgucPacketSequence: [4]Uint8 = @import("std").mem.zeroes([4]Uint8),
    rgucGyroX: [2]Uint8 = @import("std").mem.zeroes([2]Uint8),
    rgucGyroY: [2]Uint8 = @import("std").mem.zeroes([2]Uint8),
    rgucGyroZ: [2]Uint8 = @import("std").mem.zeroes([2]Uint8),
    rgucAccelX: [2]Uint8 = @import("std").mem.zeroes([2]Uint8),
    rgucAccelY: [2]Uint8 = @import("std").mem.zeroes([2]Uint8),
    rgucAccelZ: [2]Uint8 = @import("std").mem.zeroes([2]Uint8),
    rgucSensorTimestamp: [4]Uint8 = @import("std").mem.zeroes([4]Uint8),
};
pub const PS5StatePacket_t = extern struct {
    ucLeftJoystickX: Uint8 = 0,
    ucLeftJoystickY: Uint8 = 0,
    ucRightJoystickX: Uint8 = 0,
    ucRightJoystickY: Uint8 = 0,
    ucTriggerLeft: Uint8 = 0,
    ucTriggerRight: Uint8 = 0,
    ucCounter: Uint8 = 0,
    rgucButtonsAndHat: [4]Uint8 = @import("std").mem.zeroes([4]Uint8),
    rgucPacketSequence: [4]Uint8 = @import("std").mem.zeroes([4]Uint8),
    rgucGyroX: [2]Uint8 = @import("std").mem.zeroes([2]Uint8),
    rgucGyroY: [2]Uint8 = @import("std").mem.zeroes([2]Uint8),
    rgucGyroZ: [2]Uint8 = @import("std").mem.zeroes([2]Uint8),
    rgucAccelX: [2]Uint8 = @import("std").mem.zeroes([2]Uint8),
    rgucAccelY: [2]Uint8 = @import("std").mem.zeroes([2]Uint8),
    rgucAccelZ: [2]Uint8 = @import("std").mem.zeroes([2]Uint8),
    rgucSensorTimestamp: [4]Uint8 = @import("std").mem.zeroes([4]Uint8),
    ucSensorTemp: Uint8 = 0,
    ucTouchpadCounter1: Uint8 = 0,
    rgucTouchpadData1: [3]Uint8 = @import("std").mem.zeroes([3]Uint8),
    ucTouchpadCounter2: Uint8 = 0,
    rgucTouchpadData2: [3]Uint8 = @import("std").mem.zeroes([3]Uint8),
    rgucUnknown1: [8]Uint8 = @import("std").mem.zeroes([8]Uint8),
    rgucTimer2: [4]Uint8 = @import("std").mem.zeroes([4]Uint8),
    ucBatteryLevel: Uint8 = 0,
    ucConnectState: Uint8 = 0,
};
pub const PS5StatePacketAlt_t = extern struct {
    ucLeftJoystickX: Uint8 = 0,
    ucLeftJoystickY: Uint8 = 0,
    ucRightJoystickX: Uint8 = 0,
    ucRightJoystickY: Uint8 = 0,
    ucTriggerLeft: Uint8 = 0,
    ucTriggerRight: Uint8 = 0,
    ucCounter: Uint8 = 0,
    rgucButtonsAndHat: [4]Uint8 = @import("std").mem.zeroes([4]Uint8),
    rgucPacketSequence: [4]Uint8 = @import("std").mem.zeroes([4]Uint8),
    rgucGyroX: [2]Uint8 = @import("std").mem.zeroes([2]Uint8),
    rgucGyroY: [2]Uint8 = @import("std").mem.zeroes([2]Uint8),
    rgucGyroZ: [2]Uint8 = @import("std").mem.zeroes([2]Uint8),
    rgucAccelX: [2]Uint8 = @import("std").mem.zeroes([2]Uint8),
    rgucAccelY: [2]Uint8 = @import("std").mem.zeroes([2]Uint8),
    rgucAccelZ: [2]Uint8 = @import("std").mem.zeroes([2]Uint8),
    rgucSensorTimestamp: [2]Uint8 = @import("std").mem.zeroes([2]Uint8),
    ucBatteryLevel: Uint8 = 0,
    ucUnknown: Uint8 = 0,
    ucTouchpadCounter1: Uint8 = 0,
    rgucTouchpadData1: [3]Uint8 = @import("std").mem.zeroes([3]Uint8),
    ucTouchpadCounter2: Uint8 = 0,
    rgucTouchpadData2: [3]Uint8 = @import("std").mem.zeroes([3]Uint8),
    rgucDeviceSpecific: [8]Uint8 = @import("std").mem.zeroes([8]Uint8),
};
pub const DS5EffectsState_t = extern struct {
    ucEnableBits1: Uint8 = 0,
    ucEnableBits2: Uint8 = 0,
    ucRumbleRight: Uint8 = 0,
    ucRumbleLeft: Uint8 = 0,
    ucHeadphoneVolume: Uint8 = 0,
    ucSpeakerVolume: Uint8 = 0,
    ucMicrophoneVolume: Uint8 = 0,
    ucAudioEnableBits: Uint8 = 0,
    ucMicLightMode: Uint8 = 0,
    ucAudioMuteBits: Uint8 = 0,
    rgucRightTriggerEffect: [11]Uint8 = @import("std").mem.zeroes([11]Uint8),
    rgucLeftTriggerEffect: [11]Uint8 = @import("std").mem.zeroes([11]Uint8),
    rgucUnknown1: [6]Uint8 = @import("std").mem.zeroes([6]Uint8),
    ucEnableBits3: Uint8 = 0,
    rgucUnknown2: [2]Uint8 = @import("std").mem.zeroes([2]Uint8),
    ucLedAnim: Uint8 = 0,
    ucLedBrightness: Uint8 = 0,
    ucPadLights: Uint8 = 0,
    ucLedRed: Uint8 = 0,
    ucLedGreen: Uint8 = 0,
    ucLedBlue: Uint8 = 0,
};
pub const k_EDS5EffectRumbleStart: c_int = 1;
pub const k_EDS5EffectRumble: c_int = 2;
pub const k_EDS5EffectLEDReset: c_int = 4;
pub const k_EDS5EffectLED: c_int = 8;
pub const k_EDS5EffectPadLights: c_int = 16;
pub const k_EDS5EffectMicLight: c_int = 32;
pub const k_EDS5LEDResetStateNone: c_int = 0;
pub const k_EDS5LEDResetStatePending: c_int = 1;
pub const k_EDS5LEDResetStateComplete: c_int = 2;
pub const EDS5LEDResetState = c_uint;
pub const IMUCalibrationData = extern struct {
    bias: Sint16 = 0,
    sensitivity: f32 = 0,
};
pub const PS5_ENHANCED_REPORT_HINT_OFF: c_int = 0;
pub const PS5_ENHANCED_REPORT_HINT_ON: c_int = 1;
pub const PS5_ENHANCED_REPORT_HINT_AUTO: c_int = 2;
pub const HIDAPI_PS5_EnhancedReportHint = c_uint;
const union_unnamed_21 = extern union {
    simple: PS5SimpleStatePacket_t,
    state: PS5StatePacketCommon_t,
    alt_state: PS5StatePacketAlt_t,
    full_state: PS5StatePacket_t,
    data: [64]Uint8,
};
pub const SDL_DriverPS5_Context = extern struct {
    device: [*c]SDL_HIDAPI_Device = null,
    joystick: [*c]SDL_Joystick = null,
    is_dongle: bool = false,
    use_alternate_report: bool = false,
    sensors_supported: bool = false,
    lightbar_supported: bool = false,
    vibration_supported: bool = false,
    playerled_supported: bool = false,
    touchpad_supported: bool = false,
    effects_supported: bool = false,
    guitar_whammy_supported: bool = false,
    guitar_tilt_supported: bool = false,
    guitar_effects_selector_supported: bool = false,
    enhanced_report_hint: HIDAPI_PS5_EnhancedReportHint = @import("std").mem.zeroes(HIDAPI_PS5_EnhancedReportHint),
    enhanced_reports: bool = false,
    enhanced_mode: bool = false,
    enhanced_mode_available: bool = false,
    report_sensors: bool = false,
    report_touchpad: bool = false,
    report_battery: bool = false,
    hardware_calibration: bool = false,
    calibration: [6]IMUCalibrationData = @import("std").mem.zeroes([6]IMUCalibrationData),
    firmware_version: Uint16 = 0,
    last_packet: Uint64 = 0,
    player_index: c_int = 0,
    player_lights: bool = false,
    enhanced_rumble: bool = false,
    rumble_left: Uint8 = 0,
    rumble_right: Uint8 = 0,
    color_set: bool = false,
    led_red: Uint8 = 0,
    led_green: Uint8 = 0,
    led_blue: Uint8 = 0,
    led_reset_state: EDS5LEDResetState = @import("std").mem.zeroes(EDS5LEDResetState),
    sensor_ticks: Uint64 = 0,
    last_tick: Uint32 = 0,
    last_state: union_unnamed_21 = @import("std").mem.zeroes(union_unnamed_21),
};
pub fn HIDAPI_DriverPS5_RegisterHints(callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = SDL_AddHintCallback_REAL("SDL_JOYSTICK_HIDAPI_PS5", callback, userdata);
}
pub fn HIDAPI_DriverPS5_UnregisterHints(callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_RemoveHintCallback_REAL("SDL_JOYSTICK_HIDAPI_PS5", callback, userdata);
}
pub fn HIDAPI_DriverPS5_IsEnabled() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI_PS5", SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI", @"true" != 0));
}
pub fn ReadFeatureReport(dev: ?*SDL_hid_device, report_id: Uint8, report: [*c]Uint8, length: usize) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    _ = memset(@ptrCast(@alignCast(report)), 0, length);
    report[@as(c_int, 0)] = report_id;
    return SDL_hid_get_feature_report_REAL(dev, report, length);
}
pub fn HIDAPI_DriverPS5_IsSupportedDevice(device: [*c]SDL_HIDAPI_Device, _: [*c]const u8, arg_type: SDL_GamepadType, vendor_id: Uint16, product_id: Uint16, _: Uint16, _: c_int, _: c_int, _: c_int, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var data: [64]Uint8 = undefined;
    _ = &data;
    var size: c_int = undefined;
    _ = &size;
    if ((@as(c_int, vendor_id) == USB_VENDOR_BACKBONE) and (@as(c_int, product_id) == USB_PRODUCT_BACKBONE_ONE_PS5_V2)) {
        return @"false" != 0;
    }
    if (@"type" == @as(SDL_GamepadType, SDL_GAMEPAD_TYPE_PS5)) {
        return @"true" != 0;
    }
    if (HIDAPI_SupportsPlaystationDetection(vendor_id, product_id)) {
        if ((device != null) and (device.*.dev != null)) {
            size = ReadFeatureReport(device.*.dev, k_EPS5FeatureReportIdCapabilities, @ptrCast(@alignCast(&data)), @sizeOf(@TypeOf(data)));
            if ((size == @as(c_int, 48)) and (@as(c_int, data[@as(c_int, 2)]) == @as(c_int, 40))) {
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
pub fn SetLedsForPlayerIndex(effects: [*c]DS5EffectsState_t, arg_player_index: c_int) callconv(.c) void {
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
                32,
                16,
                0,
            },
            [3]Uint8{
                0,
                16,
                16,
            },
            [3]Uint8{
                16,
                16,
                16,
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
pub fn SetLightsForPlayerIndex(effects: [*c]DS5EffectsState_t, arg_player_index: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var player_index = arg_player_index;
    _ = &player_index;
    const static_local_lights = struct {
        const lights: [7]Uint8 = [7]Uint8{
            4,
            10,
            21,
            27,
            31,
            17,
            14,
        };
    };
    _ = &static_local_lights;
    if (player_index >= @as(c_int, 0)) {
        {
            const ref = &player_index;
            ref.* = @bitCast(@as(c_uint, @truncate(@as(c_ulong, @bitCast(@as(c_long, ref.*))) % (@sizeOf(@TypeOf(static_local_lights.lights)) / @sizeOf(@TypeOf(static_local_lights.lights[@as(c_int, 0)]))))));
        }
        effects.*.ucPadLights = @bitCast(@as(i8, @truncate(@as(c_int, static_local_lights.lights[@bitCast(@as(isize, @intCast(player_index)))]) | @as(c_int, 32))));
    } else {
        effects.*.ucPadLights = 0;
    }
}
pub fn HIDAPI_DriverPS5_InitDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS5_Context = undefined;
    _ = &ctx;
    var data: [128]Uint8 = undefined;
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
    var capabilities2: Uint8 = undefined;
    _ = &capabilities2;
    var device_specific_capabilities: Uint8 = undefined;
    _ = &device_specific_capabilities;
    var device_type: Uint8 = undefined;
    _ = &device_type;
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
                size = SDL_hid_read_timeout_REAL(device.*.dev, @ptrCast(@alignCast(&data)), @sizeOf(@TypeOf(data)), 16);
                if (size == @as(c_int, 64)) {
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
                ctx.*.enhanced_reports = @"true" != 0;
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            12 => {
                if ((size > @as(c_int, 0)) and (@as(c_int, data[@as(c_int, 0)]) == k_EPS5ReportIdBluetoothEffects)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            13 => {
                if ((@as(c_int, device.*.vendor_id) == USB_VENDOR_SONY) and ctx.*.enhanced_reports) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
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
                {
                    sdl_pc = 16;
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
                if (ReadFeatureReport(device.*.dev, k_EPS5FeatureReportIdSerialNumber, @ptrCast(@alignCast(&data)), @sizeOf(@TypeOf(data))) >= @as(c_int, 7)) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
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
                if (@as(c_int, device.*.vendor_id) == USB_VENDOR_SONY) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            20 => {
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&serial)), @sizeOf(@TypeOf(serial)), "%.2x-%.2x-%.2x-%.2x-%.2x-%.2x", data[@as(c_int, 6)], data[@as(c_int, 5)], data[@as(c_int, 4)], data[@as(c_int, 3)], data[@as(c_int, 2)], data[@as(c_int, 1)]);
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
                if (ReadFeatureReport(device.*.dev, k_EPS5FeatureReportIdFirmwareInfo, @ptrCast(@alignCast(&data)), USB_PACKET_LENGTH) >= @as(c_int, 46)) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                ctx.*.firmware_version = @bitCast(@as(c_short, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 44)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 45)])) << @intCast(@as(c_int, 8))))));
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
                    sdl_pc = 19;
                    continue;
                }
            },
            26 => {
                if (((@as(c_int, device.*.product_id) == USB_PRODUCT_SONY_DS5_EDGE) or (@as(c_int, ctx.*.firmware_version) == @as(c_int, 0))) or (@as(c_int, ctx.*.firmware_version) >= @as(c_int, 548))) {
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
                if (@as(c_int, device.*.vendor_id) == USB_VENDOR_SONY) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            29 => {
                ctx.*.enhanced_rumble = @"true" != 0;
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
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            32 => {
                ctx.*.sensors_supported = @"true" != 0;
                ctx.*.lightbar_supported = @"true" != 0;
                ctx.*.vibration_supported = @"true" != 0;
                ctx.*.playerled_supported = @"true" != 0;
                ctx.*.touchpad_supported = @"true" != 0;
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            33 => {
                size = ReadFeatureReport(device.*.dev, k_EPS5FeatureReportIdCapabilities, @ptrCast(@alignCast(&data)), @sizeOf(@TypeOf(data)));
                if ((size == @as(c_int, 48)) and (@as(c_int, data[@as(c_int, 2)]) == @as(c_int, 40))) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            34 => {
                ctx.*.effects_supported = (ctx.*.lightbar_supported or ctx.*.vibration_supported) or ctx.*.playerled_supported;
                if (((@as(c_int, device.*.vendor_id) == USB_VENDOR_NACON_ALT) and (@as(c_int, device.*.product_id) == USB_PRODUCT_NACON_REVOLUTION_5_PRO_PS5_WIRELESS)) or ((@as(c_int, device.*.vendor_id) == USB_VENDOR_RAZER) and (((@as(c_int, device.*.product_id) == USB_PRODUCT_NACON_REVOLUTION_5_PRO_PS5_WIRELESS) or (@as(c_int, device.*.product_id) == USB_PRODUCT_RAZER_WOLVERINE_V2_PRO_PS5_WIRELESS)) or (@as(c_int, device.*.product_id) == USB_PRODUCT_RAZER_RAIJU_V3_PRO_PS5_WIRELESS)))) {
                    sdl_pc = 82;
                    continue;
                } else {
                    sdl_pc = 83;
                    continue;
                }
            },
            35 => {
                capabilities = data[@as(c_int, 4)];
                capabilities2 = data[@as(c_int, 20)];
                device_specific_capabilities = data[@as(c_int, 24)];
                device_type = data[@as(c_int, 5)];
                if ((@as(c_int, capabilities) & @as(c_int, 2)) != 0) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
                    continue;
                }
            },
            36 => {
                if ((@as(c_int, device.*.vendor_id) == USB_VENDOR_RAZER) and ((@as(c_int, device.*.product_id) == USB_PRODUCT_RAZER_WOLVERINE_V2_PRO_PS5_WIRED) or (@as(c_int, device.*.product_id) == USB_PRODUCT_RAZER_WOLVERINE_V2_PRO_PS5_WIRELESS))) {
                    sdl_pc = 76;
                    continue;
                } else {
                    sdl_pc = 77;
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
                ctx.*.sensors_supported = @"true" != 0;
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
                if ((@as(c_int, capabilities) & @as(c_int, 4)) != 0) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            41 => {
                ctx.*.lightbar_supported = @"true" != 0;
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
                if ((@as(c_int, capabilities) & @as(c_int, 8)) != 0) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            44 => {
                ctx.*.vibration_supported = @"true" != 0;
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
                if ((@as(c_int, capabilities) & @as(c_int, 64)) != 0) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            47 => {
                ctx.*.touchpad_supported = @"true" != 0;
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
                if ((@as(c_int, capabilities2) & @as(c_int, 128)) != 0) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            50 => {
                ctx.*.playerled_supported = @"true" != 0;
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
                if ((@as(c_int, capabilities2) & @as(c_int, 1)) != 0) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 54;
                    continue;
                }
            },
            53 => {
                ctx.*.report_battery = @"true" != 0;
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
                switch (@as(c_int, device_type)) {
                    @as(c_int, 0) => {
                        sdl_pc = 57;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 58;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 68;
                        continue;
                    },
                    @as(c_int, 6) => {
                        sdl_pc = 69;
                        continue;
                    },
                    @as(c_int, 7) => {
                        sdl_pc = 70;
                        continue;
                    },
                    @as(c_int, 8) => {
                        sdl_pc = 71;
                        continue;
                    },
                    else => {
                        sdl_pc = 72;
                        continue;
                    },
                }
            },
            56 => {
                ctx.*.use_alternate_report = @"true" != 0;
                ctx.*.report_battery = @"true" != 0;
                if ((@as(c_int, device.*.vendor_id) == USB_VENDOR_NACON_ALT) and ((@as(c_int, device.*.product_id) == USB_PRODUCT_NACON_REVOLUTION_5_PRO_PS5_WIRED) or (@as(c_int, device.*.product_id) == USB_PRODUCT_NACON_REVOLUTION_5_PRO_PS5_WIRELESS))) {
                    sdl_pc = 73;
                    continue;
                } else {
                    sdl_pc = 74;
                    continue;
                }
            },
            57 => {
                joystick_type = SDL_JOYSTICK_TYPE_GAMEPAD;
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            58 => {
                joystick_type = SDL_JOYSTICK_TYPE_GUITAR;
                if ((@as(c_int, device_specific_capabilities) & @as(c_int, 1)) != 0) {
                    sdl_pc = 59;
                    continue;
                } else {
                    sdl_pc = 60;
                    continue;
                }
            },
            59 => {
                ctx.*.guitar_effects_selector_supported = @"true" != 0;
                {
                    sdl_pc = 61;
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
                if ((@as(c_int, device_specific_capabilities) & @as(c_int, 2)) != 0) {
                    sdl_pc = 62;
                    continue;
                } else {
                    sdl_pc = 63;
                    continue;
                }
            },
            62 => {
                ctx.*.guitar_tilt_supported = @"true" != 0;
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
                if ((@as(c_int, device_specific_capabilities) & @as(c_int, 4)) != 0) {
                    sdl_pc = 65;
                    continue;
                } else {
                    sdl_pc = 66;
                    continue;
                }
            },
            65 => {
                ctx.*.guitar_whammy_supported = @"true" != 0;
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
                    sdl_pc = 56;
                    continue;
                }
            },
            68 => {
                joystick_type = SDL_JOYSTICK_TYPE_DRUM_KIT;
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            69 => {
                joystick_type = SDL_JOYSTICK_TYPE_WHEEL;
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            70 => {
                joystick_type = SDL_JOYSTICK_TYPE_ARCADE_STICK;
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            71 => {
                joystick_type = SDL_JOYSTICK_TYPE_FLIGHT_STICK;
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            72 => {
                joystick_type = SDL_JOYSTICK_TYPE_UNKNOWN;
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            73 => {
                ctx.*.vibration_supported = @"true" != 0;
                {
                    sdl_pc = 75;
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
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            76 => {
                ctx.*.sensors_supported = @"true" != 0;
                ctx.*.touchpad_supported = @"true" != 0;
                ctx.*.use_alternate_report = @"true" != 0;
                {
                    sdl_pc = 78;
                    continue;
                }
            },
            77 => {
                if ((@as(c_int, device.*.vendor_id) == USB_VENDOR_RAZER) and (((@as(c_int, device.*.product_id) == USB_PRODUCT_RAZER_KITSUNE) or (@as(c_int, device.*.product_id) == USB_PRODUCT_RAZER_RAIJU_V3_PRO_PS5_WIRED)) or (@as(c_int, device.*.product_id) == USB_PRODUCT_RAZER_RAIJU_V3_PRO_PS5_WIRELESS))) {
                    sdl_pc = 79;
                    continue;
                } else {
                    sdl_pc = 80;
                    continue;
                }
            },
            78 => {
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            79 => {
                joystick_type = SDL_JOYSTICK_TYPE_ARCADE_STICK;
                ctx.*.touchpad_supported = @"true" != 0;
                ctx.*.use_alternate_report = @"true" != 0;
                {
                    sdl_pc = 81;
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
                {
                    sdl_pc = 78;
                    continue;
                }
            },
            82 => {
                ctx.*.is_dongle = @"true" != 0;
                {
                    sdl_pc = 84;
                    continue;
                }
            },
            83 => {
                {
                    sdl_pc = 84;
                    continue;
                }
            },
            84 => {
                device.*.joystick_type = joystick_type;
                device.*.type = SDL_GAMEPAD_TYPE_PS5;
                if (@as(c_int, device.*.vendor_id) == USB_VENDOR_SONY) {
                    sdl_pc = 85;
                    continue;
                } else {
                    sdl_pc = 86;
                    continue;
                }
            },
            85 => {
                if (SDL_IsJoystickDualSenseEdge(device.*.vendor_id, device.*.product_id)) {
                    sdl_pc = 88;
                    continue;
                } else {
                    sdl_pc = 89;
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
                HIDAPI_SetDeviceSerial(device, @ptrCast(@alignCast(&serial)));
                if (ctx.*.is_dongle) {
                    sdl_pc = 91;
                    continue;
                } else {
                    sdl_pc = 92;
                    continue;
                }
            },
            88 => {
                HIDAPI_SetDeviceName(device, "DualSense Edge Wireless Controller");
                {
                    sdl_pc = 90;
                    continue;
                }
            },
            89 => {
                HIDAPI_SetDeviceName(device, "DualSense Wireless Controller");
                {
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
                return @"true" != 0;
            },
            92 => {
                {
                    sdl_pc = 93;
                    continue;
                }
            },
            93 => {
                if (device.*.is_bluetooth) {
                    sdl_pc = 94;
                    continue;
                } else {
                    sdl_pc = 95;
                    continue;
                }
            },
            94 => {
                if (HIDAPI_HasConnectedUSBDevice(device.*.serial)) {
                    sdl_pc = 97;
                    continue;
                } else {
                    sdl_pc = 98;
                    continue;
                }
            },
            95 => {
                HIDAPI_DisconnectBluetoothDevice(device.*.serial);
                {
                    sdl_pc = 96;
                    continue;
                }
            },
            96 => {
                return HIDAPI_JoystickConnected(device, null);
            },
            97 => {
                return @"true" != 0;
            },
            98 => {
                {
                    sdl_pc = 99;
                    continue;
                }
            },
            99 => {
                {
                    sdl_pc = 96;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverPS5_GetDevicePlayerIndex(_: [*c]SDL_HIDAPI_Device, _: SDL_JoystickID) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return -@as(c_int, 1);
}
pub fn HIDAPI_DriverPS5_LoadCalibrationData(device: [*c]SDL_HIDAPI_Device) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS5_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    var i: c_int = undefined;
    _ = &i;
    var size: c_int = undefined;
    _ = &size;
    var data: [64]Uint8 = undefined;
    _ = &data;
    size = ReadFeatureReport(device.*.dev, k_EPS5FeatureReportIdCalibration, @ptrCast(@alignCast(&data)), @sizeOf(@TypeOf(data)));
    if (size < @as(c_int, 35)) {
        return;
    }
    {
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
        var sRange2g: Sint16 = undefined;
        _ = &sRange2g;
        sGyroPitchBias = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 1)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 2)])) << @intCast(@as(c_int, 8))));
        sGyroYawBias = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 3)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 4)])) << @intCast(@as(c_int, 8))));
        sGyroRollBias = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 5)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 6)])) << @intCast(@as(c_int, 8))));
        sGyroPitchPlus = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 7)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 8)])) << @intCast(@as(c_int, 8))));
        sGyroPitchMinus = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 9)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 10)])) << @intCast(@as(c_int, 8))));
        sGyroYawPlus = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 11)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 12)])) << @intCast(@as(c_int, 8))));
        sGyroYawMinus = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 13)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 14)])) << @intCast(@as(c_int, 8))));
        sGyroRollPlus = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 15)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 16)])) << @intCast(@as(c_int, 8))));
        sGyroRollMinus = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 17)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 18)])) << @intCast(@as(c_int, 8))));
        sGyroSpeedPlus = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 19)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 20)])) << @intCast(@as(c_int, 8))));
        sGyroSpeedMinus = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 21)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 22)])) << @intCast(@as(c_int, 8))));
        sAccXPlus = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 23)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 24)])) << @intCast(@as(c_int, 8))));
        sAccXMinus = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 25)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 26)])) << @intCast(@as(c_int, 8))));
        sAccYPlus = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 27)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 28)])) << @intCast(@as(c_int, 8))));
        sAccYMinus = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 29)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 30)])) << @intCast(@as(c_int, 8))));
        sAccZPlus = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 31)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 32)])) << @intCast(@as(c_int, 8))));
        sAccZMinus = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 33)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 34)])) << @intCast(@as(c_int, 8))));
        flNumerator = @as(f32, @floatFromInt(@as(c_int, sGyroSpeedPlus) + @as(c_int, sGyroSpeedMinus))) * GYRO_RES_PER_DEGREE;
        ctx.*.calibration[@as(c_int, 0)].bias = sGyroPitchBias;
        ctx.*.calibration[@as(c_int, 0)].sensitivity = flNumerator / @as(f32, @floatFromInt(@as(c_int, sGyroPitchPlus) - @as(c_int, sGyroPitchMinus)));
        ctx.*.calibration[@as(c_int, 1)].bias = sGyroYawBias;
        ctx.*.calibration[@as(c_int, 1)].sensitivity = flNumerator / @as(f32, @floatFromInt(@as(c_int, sGyroYawPlus) - @as(c_int, sGyroYawMinus)));
        ctx.*.calibration[@as(c_int, 2)].bias = sGyroRollBias;
        ctx.*.calibration[@as(c_int, 2)].sensitivity = flNumerator / @as(f32, @floatFromInt(@as(c_int, sGyroRollPlus) - @as(c_int, sGyroRollMinus)));
        sRange2g = @truncate(@as(c_int, sAccXPlus) - @as(c_int, sAccXMinus));
        ctx.*.calibration[@as(c_int, 3)].bias = @truncate(@as(c_int, sAccXPlus) - @divTrunc(@as(c_int, sRange2g), @as(c_int, 2)));
        ctx.*.calibration[@as(c_int, 3)].sensitivity = (@as(f32, 2.0) * ACCEL_RES_PER_G) / @as(f32, @floatFromInt(sRange2g));
        sRange2g = @truncate(@as(c_int, sAccYPlus) - @as(c_int, sAccYMinus));
        ctx.*.calibration[@as(c_int, 4)].bias = @truncate(@as(c_int, sAccYPlus) - @divTrunc(@as(c_int, sRange2g), @as(c_int, 2)));
        ctx.*.calibration[@as(c_int, 4)].sensitivity = (@as(f32, 2.0) * ACCEL_RES_PER_G) / @as(f32, @floatFromInt(sRange2g));
        sRange2g = @truncate(@as(c_int, sAccZPlus) - @as(c_int, sAccZMinus));
        ctx.*.calibration[@as(c_int, 5)].bias = @truncate(@as(c_int, sAccZPlus) - @divTrunc(@as(c_int, sRange2g), @as(c_int, 2)));
        ctx.*.calibration[@as(c_int, 5)].sensitivity = (@as(f32, 2.0) * ACCEL_RES_PER_G) / @as(f32, @floatFromInt(sRange2g));
        ctx.*.hardware_calibration = @"true" != 0;
        {
            i = 0;
            while (i < @as(c_int, 6)) : (i += 1) {
                var divisor: f32 = if (i < @as(c_int, 3)) @as(f32, 64.0) else @as(f32, 1.0);
                _ = &divisor;
                if ((SDL_abs_REAL(ctx.*.calibration[@bitCast(@as(isize, @intCast(i)))].bias) > @as(c_int, 1024)) or (SDL_fabsf_REAL(@as(f32, 1.0) - (ctx.*.calibration[@bitCast(@as(isize, @intCast(i)))].sensitivity / divisor)) > @as(f32, 0.5))) {
                    ctx.*.hardware_calibration = @"false" != 0;
                }
            }
        }
    }
}
pub fn HIDAPI_DriverPS5_ApplyCalibrationData(ctx: [*c]SDL_DriverPS5_Context, index_1: c_int, value: Sint16) callconv(.c) f32 {
    @setEvalBranchQuota(100000);
    var result: f32 = undefined;
    _ = &result;
    if (ctx.*.hardware_calibration) {
        var calibration: [*c]IMUCalibrationData = &ctx.*.calibration[@bitCast(@as(isize, @intCast(index_1)))];
        _ = &calibration;
        result = @as(f32, @floatFromInt(@as(c_int, value) - @as(c_int, calibration.*.bias))) * calibration.*.sensitivity;
    } else if (index_1 < @as(c_int, 3)) {
        result = @as(f32, @floatFromInt(@as(c_int, value))) * @as(f32, 64.0);
    } else {
        result = @floatFromInt(value);
    }
    if (index_1 < @as(c_int, 3)) {
        result = ((result / GYRO_RES_PER_DEGREE) * SDL_PI_F) / @as(f32, 180.0);
    } else {
        result = (result / ACCEL_RES_PER_G) * SDL_STANDARD_GRAVITY;
    }
    return result;
}
pub fn HIDAPI_DriverPS5_UpdateEffects(ctx: [*c]SDL_DriverPS5_Context, effect_mask: c_int, application_usage: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var effects: DS5EffectsState_t = undefined;
    _ = &effects;
    if ((ctx.*.device.*.is_bluetooth and ctx.*.enhanced_reports) and ((effect_mask & (k_EDS5EffectLED | k_EDS5EffectPadLights)) != @as(c_int, 0))) {
        if (ctx.*.led_reset_state != @as(EDS5LEDResetState, k_EDS5LEDResetStateComplete)) {
            ctx.*.led_reset_state = k_EDS5LEDResetStatePending;
            return @"true" != 0;
        }
    }
    _ = memset(@ptrCast(@alignCast(&effects)), 0, @sizeOf(@TypeOf(effects)));
    if (ctx.*.vibration_supported) {
        if ((@as(c_int, ctx.*.rumble_left) != 0) or (@as(c_int, ctx.*.rumble_right) != 0)) {
            if (ctx.*.enhanced_rumble) {
                {
                    const ref = &effects.ucEnableBits3;
                    ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | @as(c_int, 4))));
                }
                effects.ucRumbleLeft = ctx.*.rumble_left;
                effects.ucRumbleRight = ctx.*.rumble_right;
            } else {
                {
                    const ref = &effects.ucEnableBits1;
                    ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | @as(c_int, 1))));
                }
                effects.ucRumbleLeft = @bitCast(@as(i8, @truncate(@as(c_int, ctx.*.rumble_left) >> @intCast(@as(c_int, 1)))));
                effects.ucRumbleRight = @bitCast(@as(i8, @truncate(@as(c_int, ctx.*.rumble_right) >> @intCast(@as(c_int, 1)))));
            }
            {
                const ref = &effects.ucEnableBits1;
                ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | @as(c_int, 2))));
            }
        } else {}
        if ((effect_mask & k_EDS5EffectRumbleStart) != @as(c_int, 0)) {
            {
                const ref = &effects.ucEnableBits1;
                ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | @as(c_int, 2))));
            }
        }
        if ((effect_mask & k_EDS5EffectRumble) != @as(c_int, 0)) {}
    }
    if (ctx.*.lightbar_supported) {
        if ((effect_mask & k_EDS5EffectLEDReset) != @as(c_int, 0)) {
            {
                const ref = &effects.ucEnableBits2;
                ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | @as(c_int, 8))));
            }
        }
        if ((effect_mask & k_EDS5EffectLED) != @as(c_int, 0)) {
            {
                const ref = &effects.ucEnableBits2;
                ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | @as(c_int, 4))));
            }
            if (ctx.*.color_set) {
                effects.ucLedRed = ctx.*.led_red;
                effects.ucLedGreen = ctx.*.led_green;
                effects.ucLedBlue = ctx.*.led_blue;
            } else {
                SetLedsForPlayerIndex(&effects, ctx.*.player_index);
            }
        }
    }
    if (ctx.*.playerled_supported) {
        if ((effect_mask & k_EDS5EffectPadLights) != @as(c_int, 0)) {
            {
                const ref = &effects.ucEnableBits2;
                ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | @as(c_int, 16))));
            }
            if (ctx.*.player_lights) {
                SetLightsForPlayerIndex(&effects, ctx.*.player_index);
            } else {
                effects.ucPadLights = 0;
            }
        }
    }
    if ((effect_mask & k_EDS5EffectMicLight) != @as(c_int, 0)) {
        {
            const ref = &effects.ucEnableBits2;
            ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | @as(c_int, 1))));
        }
        effects.ucMicLightMode = 0;
    }
    return HIDAPI_DriverPS5_InternalSendJoystickEffect(ctx, @ptrCast(@alignCast(&effects)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(effects))))), application_usage);
}
pub fn HIDAPI_DriverPS5_CheckPendingLEDReset(ctx: [*c]SDL_DriverPS5_Context) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var led_reset_complete: bool = @"false" != 0;
    _ = &led_reset_complete;
    if ((ctx.*.enhanced_reports and ctx.*.sensors_supported) and !ctx.*.use_alternate_report) {
        var packet: [*c]const PS5StatePacketCommon_t = &ctx.*.last_state.state;
        _ = &packet;
        const connection_complete: Uint32 = 10200000;
        _ = &connection_complete;
        var timestamp: Uint32 = (((@as(Uint32, packet.*.rgucSensorTimestamp[@as(c_int, 0)]) << @intCast(@as(Uint32, 0))) | (@as(Uint32, packet.*.rgucSensorTimestamp[@as(c_int, 1)]) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, packet.*.rgucSensorTimestamp[@as(c_int, 2)]) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, packet.*.rgucSensorTimestamp[@as(c_int, 3)]) << @intCast(@as(Uint32, 24)));
        _ = &timestamp;
        if (timestamp >= connection_complete) {
            led_reset_complete = @"true" != 0;
        }
    } else {
        led_reset_complete = @"true" != 0;
    }
    if (led_reset_complete) {
        _ = HIDAPI_DriverPS5_UpdateEffects(ctx, k_EDS5EffectLEDReset, @"false" != 0);
        ctx.*.led_reset_state = k_EDS5LEDResetStateComplete;
        _ = HIDAPI_DriverPS5_UpdateEffects(ctx, k_EDS5EffectLED | k_EDS5EffectPadLights, @"false" != 0);
    }
}
pub fn HIDAPI_DriverPS5_TickleBluetooth(device: [*c]SDL_HIDAPI_Device) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS5_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    if (ctx.*.enhanced_reports) {
        var data: [78]Uint8 = undefined;
        _ = &data;
        _ = memset(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&data))))), 0, @sizeOf(@TypeOf(data)));
        data[@as(c_int, 0)] = k_EPS5ReportIdBluetoothEffects;
        data[@as(c_int, 1)] = 2;
        if (SDL_HIDAPI_LockRumble()) {
            _ = SDL_HIDAPI_SendRumbleAndUnlock(device, @ptrCast(@alignCast(&data)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(data))))));
        }
    } else {
        if (device.*.num_joysticks > @as(c_int, 0)) {
            HIDAPI_JoystickDisconnected(device, device.*.joysticks[@as(c_int, 0)]);
        }
    }
}
pub fn HIDAPI_DriverPS5_SetEnhancedModeAvailable(ctx: [*c]SDL_DriverPS5_Context) callconv(.c) void {
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
        var update_rate: f32 = 250.0;
        _ = &update_rate;
        if (ctx.*.device.*.is_bluetooth) {
            update_rate = 1000.0;
        } else if (SDL_IsJoystickDualSenseEdge(ctx.*.device.*.vendor_id, ctx.*.device.*.product_id)) {
            update_rate = 1000.0;
        }
        SDL_PrivateJoystickAddSensor(ctx.*.joystick, SDL_SENSOR_GYRO, update_rate);
        SDL_PrivateJoystickAddSensor(ctx.*.joystick, SDL_SENSOR_ACCEL, update_rate);
    }
    if (ctx.*.guitar_tilt_supported) {
        var update_rate: f32 = 250.0;
        _ = &update_rate;
        SDL_PrivateJoystickAddSensor(ctx.*.joystick, SDL_SENSOR_ACCEL, update_rate);
    }
    ctx.*.report_battery = @"true" != 0;
    HIDAPI_UpdateDeviceProperties(ctx.*.device);
}
pub fn HIDAPI_DriverPS5_SetEnhancedMode(ctx: [*c]SDL_DriverPS5_Context) callconv(.c) void {
    @setEvalBranchQuota(100000);
    HIDAPI_DriverPS5_SetEnhancedModeAvailable(ctx);
    if (!ctx.*.enhanced_mode) {
        ctx.*.enhanced_mode = @"true" != 0;
        _ = HIDAPI_DriverPS5_UpdateEffects(ctx, 0, @"false" != 0);
        _ = HIDAPI_DriverPS5_UpdateEffects(ctx, k_EDS5EffectLED | k_EDS5EffectPadLights, @"false" != 0);
    }
}
pub fn HIDAPI_DriverPS5_SetEnhancedReportHint(ctx: [*c]SDL_DriverPS5_Context, enhanced_report_hint: HIDAPI_PS5_EnhancedReportHint) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (enhanced_report_hint) {
                    @as(HIDAPI_PS5_EnhancedReportHint, PS5_ENHANCED_REPORT_HINT_OFF) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(HIDAPI_PS5_EnhancedReportHint, PS5_ENHANCED_REPORT_HINT_ON) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(HIDAPI_PS5_EnhancedReportHint, PS5_ENHANCED_REPORT_HINT_AUTO) => {
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
                HIDAPI_DriverPS5_SetEnhancedMode(ctx);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                HIDAPI_DriverPS5_SetEnhancedModeAvailable(ctx);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverPS5_UpdateEnhancedModeOnEnhancedReport(ctx: [*c]SDL_DriverPS5_Context) callconv(.c) void {
    @setEvalBranchQuota(100000);
    ctx.*.enhanced_reports = @"true" != 0;
    if (ctx.*.enhanced_report_hint == @as(HIDAPI_PS5_EnhancedReportHint, PS5_ENHANCED_REPORT_HINT_AUTO)) {
        HIDAPI_DriverPS5_SetEnhancedReportHint(ctx, PS5_ENHANCED_REPORT_HINT_ON);
    }
}
pub fn HIDAPI_DriverPS5_UpdateEnhancedModeOnApplicationUsage(ctx: [*c]SDL_DriverPS5_Context) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (ctx.*.enhanced_report_hint == @as(HIDAPI_PS5_EnhancedReportHint, PS5_ENHANCED_REPORT_HINT_AUTO)) {
        HIDAPI_DriverPS5_SetEnhancedReportHint(ctx, PS5_ENHANCED_REPORT_HINT_ON);
    }
}
pub fn SDL_PS5EnhancedReportsChanged(userdata: ?*anyopaque, _: [*c]const u8, _: [*c]const u8, hint: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS5_Context = @ptrCast(@alignCast(userdata));
    _ = &ctx;
    if (ctx.*.device.*.is_bluetooth) {
        if ((hint != null) and (SDL_strcasecmp_REAL(hint, "auto") == @as(c_int, 0))) {
            HIDAPI_DriverPS5_SetEnhancedReportHint(ctx, PS5_ENHANCED_REPORT_HINT_AUTO);
        } else if (SDL_GetStringBoolean(hint, @"true" != 0)) {
            HIDAPI_DriverPS5_SetEnhancedReportHint(ctx, PS5_ENHANCED_REPORT_HINT_ON);
        } else {
            HIDAPI_DriverPS5_SetEnhancedReportHint(ctx, PS5_ENHANCED_REPORT_HINT_OFF);
        }
    } else {
        HIDAPI_DriverPS5_SetEnhancedReportHint(ctx, PS5_ENHANCED_REPORT_HINT_ON);
    }
}
pub fn SDL_PS5PlayerLEDHintChanged(userdata: ?*anyopaque, _: [*c]const u8, _: [*c]const u8, hint: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS5_Context = @ptrCast(@alignCast(userdata));
    _ = &ctx;
    var player_lights: bool = SDL_GetStringBoolean(hint, @"true" != 0);
    _ = &player_lights;
    if (@as(c_int, @intFromBool(player_lights)) != @as(c_int, @intFromBool(ctx.*.player_lights))) {
        ctx.*.player_lights = player_lights;
        _ = HIDAPI_DriverPS5_UpdateEffects(ctx, k_EDS5EffectPadLights, @"false" != 0);
    }
}
pub fn HIDAPI_DriverPS5_SetDevicePlayerIndex(device: [*c]SDL_HIDAPI_Device, _: SDL_JoystickID, player_index: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS5_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    if (!(ctx.*.joystick != null)) {
        return;
    }
    ctx.*.player_index = player_index;
    _ = HIDAPI_DriverPS5_UpdateEffects(ctx, k_EDS5EffectLED | k_EDS5EffectPadLights, @"false" != 0);
}
pub fn HIDAPI_DriverPS5_OpenJoystick(device: [*c]SDL_HIDAPI_Device, joystick: [*c]SDL_Joystick) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS5_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    SDL_AssertJoysticksLocked();
    ctx.*.joystick = joystick;
    ctx.*.last_packet = SDL_GetTicks_REAL();
    ctx.*.report_sensors = @"false" != 0;
    ctx.*.report_touchpad = @"false" != 0;
    ctx.*.rumble_left = 0;
    ctx.*.rumble_right = 0;
    ctx.*.color_set = @"false" != 0;
    ctx.*.led_reset_state = k_EDS5LEDResetStateNone;
    _ = memset(@ptrCast(@alignCast(&ctx.*.last_state)), 0, @sizeOf(@TypeOf(ctx.*.last_state)));
    ctx.*.player_index = SDL_GetJoystickPlayerIndex_REAL(joystick);
    ctx.*.player_lights = SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI_PS5_PLAYER_LED", @"true" != 0);
    if (SDL_IsJoystickDualSenseEdge(device.*.vendor_id, device.*.product_id)) {
        joystick.*.nbuttons = 17;
    } else if (ctx.*.touchpad_supported) {
        joystick.*.nbuttons = 13;
    } else {
        joystick.*.nbuttons = 11;
    }
    joystick.*.naxes = SDL_GAMEPAD_AXIS_COUNT;
    joystick.*.nhats = 1;
    joystick.*.firmware_version = ctx.*.firmware_version;
    if (ctx.*.is_dongle) {
        joystick.*.connection_state = SDL_JOYSTICK_CONNECTION_WIRELESS;
    }
    _ = SDL_AddHintCallback_REAL("SDL_JOYSTICK_ENHANCED_REPORTS", SDL_PS5EnhancedReportsChanged, @ptrCast(@alignCast(ctx)));
    _ = SDL_AddHintCallback_REAL("SDL_JOYSTICK_HIDAPI_PS5_PLAYER_LED", SDL_PS5PlayerLEDHintChanged, @ptrCast(@alignCast(ctx)));
    return @"true" != 0;
}
pub fn HIDAPI_DriverPS5_RumbleJoystick(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, low_frequency_rumble: Uint16, high_frequency_rumble: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS5_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    if (!ctx.*.vibration_supported) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    if (!(@as(c_int, ctx.*.rumble_left) != 0) and !(@as(c_int, ctx.*.rumble_right) != 0)) {
        _ = HIDAPI_DriverPS5_UpdateEffects(ctx, k_EDS5EffectRumbleStart, @"true" != 0);
    }
    ctx.*.rumble_left = @bitCast(@as(i8, @truncate(@as(c_int, low_frequency_rumble) >> @intCast(@as(c_int, 8)))));
    ctx.*.rumble_right = @bitCast(@as(i8, @truncate(@as(c_int, high_frequency_rumble) >> @intCast(@as(c_int, 8)))));
    return HIDAPI_DriverPS5_UpdateEffects(ctx, k_EDS5EffectRumble, @"true" != 0);
}
pub fn HIDAPI_DriverPS5_RumbleJoystickTriggers(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: Uint16, _: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverPS5_GetJoystickCapabilities(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS5_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    var result: Uint32 = 0;
    _ = &result;
    if (ctx.*.enhanced_mode_available) {
        if (ctx.*.lightbar_supported) {
            result |= SDL_JOYSTICK_CAP_RGB_LED;
        }
        if (ctx.*.playerled_supported) {
            result |= SDL_JOYSTICK_CAP_PLAYER_LED;
        }
        if (ctx.*.vibration_supported) {
            result |= SDL_JOYSTICK_CAP_RUMBLE;
        }
    }
    return result;
}
pub fn HIDAPI_DriverPS5_SetJoystickLED(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, red: Uint8, green: Uint8, blue: Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS5_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    if (!ctx.*.lightbar_supported) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    ctx.*.color_set = @"true" != 0;
    ctx.*.led_red = red;
    ctx.*.led_green = green;
    ctx.*.led_blue = blue;
    return HIDAPI_DriverPS5_UpdateEffects(ctx, k_EDS5EffectLED, @"true" != 0);
}
pub fn HIDAPI_DriverPS5_InternalSendJoystickEffect(ctx: [*c]SDL_DriverPS5_Context, effect: ?*const anyopaque, size: c_int, application_usage: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var data: [78]Uint8 = undefined;
    _ = &data;
    var report_size: c_int = undefined;
    _ = &report_size;
    var offset: c_int = undefined;
    _ = &offset;
    var pending_data: [*c]Uint8 = undefined;
    _ = &pending_data;
    var pending_size: [*c]c_int = undefined;
    _ = &pending_size;
    var maximum_size: c_int = undefined;
    _ = &maximum_size;
    if (!ctx.*.effects_supported) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    if (!ctx.*.enhanced_mode) {
        if (application_usage) {
            HIDAPI_DriverPS5_UpdateEnhancedModeOnApplicationUsage(ctx);
            SDL_Delay_REAL(10);
        }
        if (!ctx.*.enhanced_mode) {
            return SDL_SetError_REAL("That operation is not supported");
        }
    }
    _ = memset(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&data))))), 0, @sizeOf(@TypeOf(data)));
    if (ctx.*.device.*.is_bluetooth) {
        data[@as(c_int, 0)] = k_EPS5ReportIdBluetoothEffects;
        data[@as(c_int, 1)] = 0;
        data[@as(c_int, 2)] = 16;
        report_size = 78;
        offset = 3;
    } else {
        data[@as(c_int, 0)] = k_EPS5ReportIdUsbEffects;
        report_size = 48;
        offset = 1;
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
    if (!SDL_HIDAPI_LockRumble()) {
        return @"false" != 0;
    }
    if (SDL_HIDAPI_GetPendingRumbleLocked(ctx.*.device, &pending_data, &pending_size, &maximum_size)) {
        var effects: [*c]DS5EffectsState_t = @ptrCast(@alignCast(&data[@bitCast(@as(isize, @intCast(offset)))]));
        _ = &effects;
        var pending_effects: [*c]DS5EffectsState_t = @ptrCast(@alignCast(&pending_data[@bitCast(@as(isize, @intCast(offset)))]));
        _ = &pending_effects;
        if (((report_size == pending_size.*) and (@as(c_int, effects.*.ucEnableBits1) == @as(c_int, pending_effects.*.ucEnableBits1))) and (@as(c_int, effects.*.ucEnableBits2) == @as(c_int, pending_effects.*.ucEnableBits2))) {
            _ = memcpy(@ptrCast(@alignCast(pending_data)), @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&data))))), @bitCast(@as(c_long, report_size)));
            SDL_HIDAPI_UnlockRumble();
            return @"true" != 0;
        }
    }
    if (SDL_HIDAPI_SendRumbleAndUnlock(ctx.*.device, @ptrCast(@alignCast(&data)), report_size) != report_size) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn HIDAPI_DriverPS5_SendJoystickEffect(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, effect: ?*const anyopaque, size: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS5_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    return HIDAPI_DriverPS5_InternalSendJoystickEffect(ctx, effect, size, @"true" != 0);
}
pub fn HIDAPI_DriverPS5_SetJoystickSensorsEnabled(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, enabled: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS5_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    HIDAPI_DriverPS5_UpdateEnhancedModeOnApplicationUsage(ctx);
    if ((!ctx.*.sensors_supported or (enabled and !ctx.*.enhanced_mode)) and !ctx.*.guitar_tilt_supported) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    if (enabled) {
        HIDAPI_DriverPS5_LoadCalibrationData(device);
    }
    ctx.*.report_sensors = enabled;
    return @"true" != 0;
}
pub fn HIDAPI_DriverPS5_HandleSimpleStatePacket(joystick: [*c]SDL_Joystick, _: ?*SDL_hid_device, ctx: [*c]SDL_DriverPS5_Context, packet: [*c]PS5SimpleStatePacket_t, timestamp: Uint64) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var axis: Sint16 = undefined;
    _ = &axis;
    var data: Uint8 = undefined;
    _ = &data;
    var data_1: Uint8 = undefined;
    _ = &data_1;
    var hat: Uint8 = undefined;
    _ = &hat;
    var data_2: Uint8 = undefined;
    _ = &data_2;
    var data_3: Uint8 = undefined;
    _ = &data_3;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (@as(c_int, ctx.*.last_state.simple.rgucButtonsHatAndCounter[@as(c_int, 0)]) != @as(c_int, packet.*.rgucButtonsHatAndCounter[@as(c_int, 0)])) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                data = @bitCast(@as(i8, @truncate(@as(c_int, packet.*.rgucButtonsHatAndCounter[@as(c_int, 0)]) >> @intCast(@as(c_int, 4)))));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_WEST, (@as(c_int, data) & @as(c_int, 1)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SOUTH, (@as(c_int, data) & @as(c_int, 2)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_EAST, (@as(c_int, data) & @as(c_int, 4)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_NORTH, (@as(c_int, data) & @as(c_int, 8)) != @as(c_int, 0));
                data_1 = @bitCast(@as(i8, @truncate(@as(c_int, packet.*.rgucButtonsHatAndCounter[@as(c_int, 0)]) & @as(c_int, 15))));
                switch (@as(c_int, data_1)) {
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
                if (@as(c_int, ctx.*.last_state.simple.rgucButtonsHatAndCounter[@as(c_int, 1)]) != @as(c_int, packet.*.rgucButtonsHatAndCounter[@as(c_int, 1)])) {
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
                data_2 = packet.*.rgucButtonsHatAndCounter[@as(c_int, 1)];
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_SHOULDER, (@as(c_int, data_2) & @as(c_int, 1)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER, (@as(c_int, data_2) & @as(c_int, 2)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_BACK, (@as(c_int, data_2) & @as(c_int, 16)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_START, (@as(c_int, data_2) & @as(c_int, 32)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_STICK, (@as(c_int, data_2) & @as(c_int, 64)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_STICK, (@as(c_int, data_2) & @as(c_int, 128)) != @as(c_int, 0));
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
                if (@as(c_int, ctx.*.last_state.simple.rgucButtonsHatAndCounter[@as(c_int, 2)]) != @as(c_int, packet.*.rgucButtonsHatAndCounter[@as(c_int, 2)])) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            17 => {
                data_3 = @bitCast(@as(i8, @truncate(@as(c_int, packet.*.rgucButtonsHatAndCounter[@as(c_int, 2)]) & @as(c_int, 3))));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_GUIDE, (@as(c_int, data_3) & @as(c_int, 1)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_PS5_TOUCHPAD, (@as(c_int, data_3) & @as(c_int, 2)) != @as(c_int, 0));
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
                if ((@as(c_int, packet.*.ucTriggerLeft) == @as(c_int, 0)) and ((@as(c_int, packet.*.rgucButtonsHatAndCounter[@as(c_int, 1)]) & @as(c_int, 4)) != 0)) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                axis = SDL_JOYSTICK_AXIS_MAX;
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            21 => {
                axis = @truncate((@as(c_int, packet.*.ucTriggerLeft) * @as(c_int, 257)) - @as(c_int, 32768));
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            22 => {
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFT_TRIGGER, axis);
                if ((@as(c_int, packet.*.ucTriggerRight) == @as(c_int, 0)) and ((@as(c_int, packet.*.rgucButtonsHatAndCounter[@as(c_int, 1)]) & @as(c_int, 8)) != 0)) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                axis = SDL_JOYSTICK_AXIS_MAX;
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            24 => {
                axis = @truncate((@as(c_int, packet.*.ucTriggerRight) * @as(c_int, 257)) - @as(c_int, 32768));
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            25 => {
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHT_TRIGGER, axis);
                axis = @truncate((@as(c_int, packet.*.ucLeftJoystickX) * @as(c_int, 257)) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, axis);
                axis = @truncate((@as(c_int, packet.*.ucLeftJoystickY) * @as(c_int, 257)) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, axis);
                axis = @truncate((@as(c_int, packet.*.ucRightJoystickX) * @as(c_int, 257)) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, axis);
                axis = @truncate((@as(c_int, packet.*.ucRightJoystickY) * @as(c_int, 257)) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, axis);
                _ = memcpy(@ptrCast(@alignCast(&ctx.*.last_state.simple)), @ptrCast(@alignCast(packet)), @sizeOf(@TypeOf(ctx.*.last_state.simple)));
                {}
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverPS5_HandleStatePacketCommon(joystick: [*c]SDL_Joystick, _: ?*SDL_hid_device, ctx: [*c]SDL_DriverPS5_Context, packet: [*c]PS5StatePacketCommon_t, timestamp: Uint64) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var axis: Sint16 = undefined;
    _ = &axis;
    var data: Uint8 = undefined;
    _ = &data;
    var data_1: Uint8 = undefined;
    _ = &data_1;
    var hat: Uint8 = undefined;
    _ = &hat;
    var data_2: Uint8 = undefined;
    _ = &data_2;
    var data_3: Uint8 = undefined;
    _ = &data_3;
    var sensor_timestamp: Uint64 = undefined;
    _ = &sensor_timestamp;
    var data_4: [3]f32 = undefined;
    _ = &data_4;
    var delta: Uint32 = undefined;
    _ = &delta;
    var tick: Uint16 = undefined;
    _ = &tick;
    var delta_5: Uint32 = undefined;
    _ = &delta_5;
    var tick_6: Uint32 = undefined;
    _ = &tick_6;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (@as(c_int, ctx.*.last_state.state.rgucButtonsAndHat[@as(c_int, 0)]) != @as(c_int, packet.*.rgucButtonsAndHat[@as(c_int, 0)])) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                data = @bitCast(@as(i8, @truncate(@as(c_int, packet.*.rgucButtonsAndHat[@as(c_int, 0)]) >> @intCast(@as(c_int, 4)))));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_WEST, (@as(c_int, data) & @as(c_int, 1)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SOUTH, (@as(c_int, data) & @as(c_int, 2)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_EAST, (@as(c_int, data) & @as(c_int, 4)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_NORTH, (@as(c_int, data) & @as(c_int, 8)) != @as(c_int, 0));
                data_1 = @bitCast(@as(i8, @truncate(@as(c_int, packet.*.rgucButtonsAndHat[@as(c_int, 0)]) & @as(c_int, 15))));
                switch (@as(c_int, data_1)) {
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
                if (@as(c_int, ctx.*.last_state.state.rgucButtonsAndHat[@as(c_int, 1)]) != @as(c_int, packet.*.rgucButtonsAndHat[@as(c_int, 1)])) {
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
                data_2 = packet.*.rgucButtonsAndHat[@as(c_int, 1)];
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_SHOULDER, (@as(c_int, data_2) & @as(c_int, 1)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER, (@as(c_int, data_2) & @as(c_int, 2)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_BACK, (@as(c_int, data_2) & @as(c_int, 16)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_START, (@as(c_int, data_2) & @as(c_int, 32)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_STICK, (@as(c_int, data_2) & @as(c_int, 64)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_STICK, (@as(c_int, data_2) & @as(c_int, 128)) != @as(c_int, 0));
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
                if (@as(c_int, ctx.*.last_state.state.rgucButtonsAndHat[@as(c_int, 2)]) != @as(c_int, packet.*.rgucButtonsAndHat[@as(c_int, 2)])) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            17 => {
                data_3 = packet.*.rgucButtonsAndHat[@as(c_int, 2)];
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_GUIDE, (@as(c_int, data_3) & @as(c_int, 1)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_PS5_TOUCHPAD, (@as(c_int, data_3) & @as(c_int, 2)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_PS5_MICROPHONE, (@as(c_int, data_3) & @as(c_int, 4)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_PS5_LEFT_FUNCTION, (@as(c_int, data_3) & @as(c_int, 16)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_PS5_RIGHT_FUNCTION, (@as(c_int, data_3) & @as(c_int, 32)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_PS5_LEFT_PADDLE, (@as(c_int, data_3) & @as(c_int, 64)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_PS5_RIGHT_PADDLE, (@as(c_int, data_3) & @as(c_int, 128)) != @as(c_int, 0));
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
                if ((@as(c_int, packet.*.ucTriggerLeft) == @as(c_int, 0)) and ((@as(c_int, packet.*.rgucButtonsAndHat[@as(c_int, 1)]) & @as(c_int, 4)) != 0)) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                axis = SDL_JOYSTICK_AXIS_MAX;
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            21 => {
                axis = @truncate((@as(c_int, packet.*.ucTriggerLeft) * @as(c_int, 257)) - @as(c_int, 32768));
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            22 => {
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFT_TRIGGER, axis);
                if ((@as(c_int, packet.*.ucTriggerRight) == @as(c_int, 0)) and ((@as(c_int, packet.*.rgucButtonsAndHat[@as(c_int, 1)]) & @as(c_int, 8)) != 0)) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                axis = SDL_JOYSTICK_AXIS_MAX;
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            24 => {
                axis = @truncate((@as(c_int, packet.*.ucTriggerRight) * @as(c_int, 257)) - @as(c_int, 32768));
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            25 => {
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHT_TRIGGER, axis);
                axis = @truncate((@as(c_int, packet.*.ucLeftJoystickX) * @as(c_int, 257)) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, axis);
                axis = @truncate((@as(c_int, packet.*.ucLeftJoystickY) * @as(c_int, 257)) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, axis);
                axis = @truncate((@as(c_int, packet.*.ucRightJoystickX) * @as(c_int, 257)) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, axis);
                axis = @truncate((@as(c_int, packet.*.ucRightJoystickY) * @as(c_int, 257)) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, axis);
                if (ctx.*.report_sensors) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            26 => {
                if (ctx.*.use_alternate_report) {
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
                {}
            },
            29 => {
                tick = @bitCast(@as(c_short, @as(Sint16, @truncate(@as(c_int, @as(Uint16, packet.*.rgucSensorTimestamp[@as(c_int, 0)])) | (@as(c_int, @as(Uint16, packet.*.rgucSensorTimestamp[@as(c_int, 1)])) << @intCast(@as(c_int, 8)))))));
                if (ctx.*.last_tick <= @as(Uint32, @bitCast(@as(c_int, @as(c_int, tick))))) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            30 => {
                tick_6 = (((@as(Uint32, packet.*.rgucSensorTimestamp[@as(c_int, 0)]) << @intCast(@as(Uint32, 0))) | (@as(Uint32, packet.*.rgucSensorTimestamp[@as(c_int, 1)]) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, packet.*.rgucSensorTimestamp[@as(c_int, 2)]) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, packet.*.rgucSensorTimestamp[@as(c_int, 3)]) << @intCast(@as(Uint32, 24)));
                if (ctx.*.last_tick < tick_6) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            31 => {
                data_4[@as(c_int, 0)] = HIDAPI_DriverPS5_ApplyCalibrationData(ctx, 0, @truncate(@as(c_int, @as(Uint16, packet.*.rgucGyroX[@as(c_int, 0)])) | (@as(c_int, @as(Uint16, packet.*.rgucGyroX[@as(c_int, 1)])) << @intCast(@as(c_int, 8)))));
                data_4[@as(c_int, 1)] = HIDAPI_DriverPS5_ApplyCalibrationData(ctx, 1, @truncate(@as(c_int, @as(Uint16, packet.*.rgucGyroY[@as(c_int, 0)])) | (@as(c_int, @as(Uint16, packet.*.rgucGyroY[@as(c_int, 1)])) << @intCast(@as(c_int, 8)))));
                data_4[@as(c_int, 2)] = HIDAPI_DriverPS5_ApplyCalibrationData(ctx, 2, @truncate(@as(c_int, @as(Uint16, packet.*.rgucGyroZ[@as(c_int, 0)])) | (@as(c_int, @as(Uint16, packet.*.rgucGyroZ[@as(c_int, 1)])) << @intCast(@as(c_int, 8)))));
                SDL_SendJoystickSensor(timestamp, joystick, SDL_SENSOR_GYRO, sensor_timestamp, @ptrCast(@alignCast(&data_4)), 3);
                data_4[@as(c_int, 0)] = HIDAPI_DriverPS5_ApplyCalibrationData(ctx, 3, @truncate(@as(c_int, @as(Uint16, packet.*.rgucAccelX[@as(c_int, 0)])) | (@as(c_int, @as(Uint16, packet.*.rgucAccelX[@as(c_int, 1)])) << @intCast(@as(c_int, 8)))));
                data_4[@as(c_int, 1)] = HIDAPI_DriverPS5_ApplyCalibrationData(ctx, 4, @truncate(@as(c_int, @as(Uint16, packet.*.rgucAccelY[@as(c_int, 0)])) | (@as(c_int, @as(Uint16, packet.*.rgucAccelY[@as(c_int, 1)])) << @intCast(@as(c_int, 8)))));
                data_4[@as(c_int, 2)] = HIDAPI_DriverPS5_ApplyCalibrationData(ctx, 5, @truncate(@as(c_int, @as(Uint16, packet.*.rgucAccelZ[@as(c_int, 0)])) | (@as(c_int, @as(Uint16, packet.*.rgucAccelZ[@as(c_int, 1)])) << @intCast(@as(c_int, 8)))));
                SDL_SendJoystickSensor(timestamp, joystick, SDL_SENSOR_ACCEL, sensor_timestamp, @ptrCast(@alignCast(&data_4)), 3);
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            32 => {
                delta = @as(Uint32, @bitCast(@as(c_int, @as(c_int, tick)))) -% ctx.*.last_tick;
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            33 => {
                delta = ((@as(Uint32, @bitCast(@as(c_int, @as(c_int, @as(Uint16, @bitCast(@as(c_short, @truncate(@as(c_int, 65535))))))))) -% ctx.*.last_tick) +% @as(Uint32, @bitCast(@as(c_int, @as(c_int, tick))))) +% @as(Uint32, 1);
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            34 => {
                ctx.*.last_tick = tick;
                ctx.*.sensor_ticks +%= delta;
                sensor_timestamp = ctx.*.sensor_ticks *% @as(Uint64, SDL_NS_PER_US);
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            35 => {
                delta_5 = tick_6 -% ctx.*.last_tick;
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            36 => {
                delta_5 = ((@as(c_uint, 4294967295) -% ctx.*.last_tick) +% tick_6) +% @as(Uint32, 1);
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            37 => {
                ctx.*.last_tick = tick_6;
                ctx.*.sensor_ticks +%= delta_5;
                sensor_timestamp = (ctx.*.sensor_ticks *% @as(Uint64, SDL_NS_PER_US)) / @as(Uint64, 3);
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverPS5_HandleStatePacket(joystick: [*c]SDL_Joystick, dev: ?*SDL_hid_device, ctx: [*c]SDL_DriverPS5_Context, packet: [*c]PS5StatePacket_t, timestamp: Uint64) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local_TOUCHPAD_SCALEX = struct {
        const TOUCHPAD_SCALEX: f32 = 0.000521;
    };
    _ = &static_local_TOUCHPAD_SCALEX;
    const static_local_TOUCHPAD_SCALEY = struct {
        const TOUCHPAD_SCALEY: f32 = 0.000935;
    };
    _ = &static_local_TOUCHPAD_SCALEY;
    var touchpad_down: bool = undefined;
    _ = &touchpad_down;
    var touchpad_x: c_int = undefined;
    _ = &touchpad_x;
    var touchpad_y: c_int = undefined;
    _ = &touchpad_y;
    var state: SDL_PowerState = undefined;
    _ = &state;
    var percent: c_int = undefined;
    _ = &percent;
    var status: Uint8 = undefined;
    _ = &status;
    var level: Uint8 = undefined;
    _ = &level;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (ctx.*.report_touchpad) {
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
                if (ctx.*.report_battery) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                status = @bitCast(@as(i8, @truncate((@as(c_int, packet.*.ucBatteryLevel) >> @intCast(@as(c_int, 4))) & @as(c_int, 15))));
                level = @bitCast(@as(i8, @truncate(@as(c_int, packet.*.ucBatteryLevel) & @as(c_int, 15))));
                switch (@as(c_int, status)) {
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
                HIDAPI_DriverPS5_HandleStatePacketCommon(joystick, dev, ctx, @ptrCast(@alignCast(packet)), timestamp);
                _ = memcpy(@ptrCast(@alignCast(&ctx.*.last_state)), @ptrCast(@alignCast(packet)), @sizeOf(@TypeOf(ctx.*.last_state)));
                {}
            },
            7 => {
                SDL_SendJoystickPowerInfo(joystick, state, percent);
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            8 => {
                state = SDL_POWERSTATE_ON_BATTERY;
                percent = if (((@as(c_int, level) * @as(c_int, 10)) + @as(c_int, 5)) < @as(c_int, 100)) (@as(c_int, level) * @as(c_int, 10)) + @as(c_int, 5) else @as(c_int, 100);
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            9 => {
                state = SDL_POWERSTATE_CHARGING;
                percent = if (((@as(c_int, level) * @as(c_int, 10)) + @as(c_int, 5)) < @as(c_int, 100)) (@as(c_int, level) * @as(c_int, 10)) + @as(c_int, 5) else @as(c_int, 100);
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            10 => {
                state = SDL_POWERSTATE_CHARGED;
                percent = 100;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            11 => {
                state = SDL_POWERSTATE_UNKNOWN;
                percent = 0;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverPS5_HandleStatePacketAlt(joystick: [*c]SDL_Joystick, dev: ?*SDL_hid_device, ctx: [*c]SDL_DriverPS5_Context, packet: [*c]PS5StatePacketAlt_t, timestamp: Uint64) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local_TOUCHPAD_SCALEX = struct {
        const TOUCHPAD_SCALEX: f32 = 0.000521;
    };
    _ = &static_local_TOUCHPAD_SCALEX;
    const static_local_TOUCHPAD_SCALEY = struct {
        const TOUCHPAD_SCALEY: f32 = 0.000935;
    };
    _ = &static_local_TOUCHPAD_SCALEY;
    var touchpad_down: bool = undefined;
    _ = &touchpad_down;
    var touchpad_x: c_int = undefined;
    _ = &touchpad_x;
    var touchpad_y: c_int = undefined;
    _ = &touchpad_y;
    var axis: Sint16 = undefined;
    _ = &axis;
    var state: SDL_PowerState = undefined;
    _ = &state;
    var percent: c_int = undefined;
    _ = &percent;
    var status: Uint8 = undefined;
    _ = &status;
    var level: Uint8 = undefined;
    _ = &level;
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
                if (ctx.*.report_touchpad) {
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
                if (ctx.*.report_battery) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                status = @bitCast(@as(i8, @truncate((@as(c_int, packet.*.ucBatteryLevel) >> @intCast(@as(c_int, 4))) & @as(c_int, 15))));
                level = @bitCast(@as(i8, @truncate(@as(c_int, packet.*.ucBatteryLevel) & @as(c_int, 15))));
                if (@as(c_int, level) != @as(c_int, 12)) {
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
                HIDAPI_DriverPS5_HandleStatePacketCommon(joystick, dev, ctx, @ptrCast(@alignCast(packet)), timestamp);
                if (ctx.*.guitar_whammy_supported) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            7 => {
                switch (@as(c_int, status)) {
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
                    else => {
                        sdl_pc = 14;
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
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            10 => {
                SDL_SendJoystickPowerInfo(joystick, state, percent);
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            11 => {
                state = SDL_POWERSTATE_ON_BATTERY;
                percent = if (((@as(c_int, level) * @as(c_int, 10)) + @as(c_int, 5)) < @as(c_int, 100)) (@as(c_int, level) * @as(c_int, 10)) + @as(c_int, 5) else @as(c_int, 100);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            12 => {
                state = SDL_POWERSTATE_CHARGING;
                percent = if (((@as(c_int, level) * @as(c_int, 10)) + @as(c_int, 5)) < @as(c_int, 100)) (@as(c_int, level) * @as(c_int, 10)) + @as(c_int, 5) else @as(c_int, 100);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            13 => {
                state = SDL_POWERSTATE_CHARGED;
                percent = 100;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            14 => {
                state = SDL_POWERSTATE_UNKNOWN;
                percent = 0;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            15 => {
                axis = @truncate((@as(c_int, packet.*.rgucDeviceSpecific[@as(c_int, 1)]) * @as(c_int, 257)) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, axis);
                {
                    sdl_pc = 17;
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
                if (ctx.*.guitar_effects_selector_supported) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            18 => {
                if (@as(c_ulong, @bitCast(@as(c_long, @as(c_int, packet.*.rgucDeviceSpecific[@as(c_int, 0)])))) < (@sizeOf(@TypeOf(static_local_effects_mappings.effects_mappings)) / @sizeOf(@TypeOf(static_local_effects_mappings.effects_mappings[@as(c_int, 0)])))) {
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
                if (ctx.*.guitar_tilt_supported) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            21 => {
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, static_local_effects_mappings.effects_mappings[packet.*.rgucDeviceSpecific[@as(c_int, 0)]]);
                {
                    sdl_pc = 23;
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
                    sdl_pc = 20;
                    continue;
                }
            },
            24 => {
                sensor_data[@as(c_int, 0)] = (@as(f32, @floatFromInt(packet.*.rgucDeviceSpecific[@as(c_int, 2)])) / @as(f32, @floatFromInt(@as(c_int, 255)))) * SDL_STANDARD_GRAVITY;
                sensor_data[@as(c_int, 1)] = @floatFromInt(@as(c_int, 0));
                sensor_data[@as(c_int, 2)] = @floatFromInt(@as(c_int, 0));
                SDL_SendJoystickSensor(timestamp, joystick, SDL_SENSOR_ACCEL, timestamp, @ptrCast(@alignCast(&sensor_data)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(sensor_data)) / @sizeOf(@TypeOf(sensor_data[@as(c_int, 0)]))))));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER, @as(c_int, packet.*.rgucDeviceSpecific[@as(c_int, 2)]) > @as(c_int, 240));
                {
                    sdl_pc = 26;
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
pub fn HIDAPI_DriverPS5_IsPacketValid(ctx: [*c]SDL_DriverPS5_Context, data: [*c]Uint8, size: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var packet: [*c]PS5StatePacketAlt_t = undefined;
    _ = &packet;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (@as(c_int, data[@as(c_int, 0)])) {
                    k_EPS5ReportIdState => {
                        sdl_pc = 2;
                        continue;
                    },
                    k_EPS5ReportIdBluetoothState => {
                        sdl_pc = 12;
                        continue;
                    },
                    else => {
                        sdl_pc = 16;
                        continue;
                    },
                }
            },
            1 => {
                return @"false" != 0;
            },
            2 => {
                if (ctx.*.is_dongle and (@as(c_ulong, @bitCast(@as(c_long, size))) >= (@as(c_ulong, 1) +% @sizeOf(PS5StatePacketAlt_t)))) {
                    sdl_pc = 3;
                    continue;
                } else {
                    sdl_pc = 4;
                    continue;
                }
            },
            3 => {
                packet = @ptrCast(@alignCast(&data[@as(c_int, 1)]));
                if (SDL_memcmp_REAL(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&packet.*.rgucPacketSequence))))), @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.last_state.state.rgucPacketSequence))))), @sizeOf(@TypeOf(packet.*.rgucPacketSequence))) == @as(c_int, 0)) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 7;
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
                return @"true" != 0;
            },
            6 => {
                return @"false" != 0;
            },
            7 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            8 => {
                if ((((@as(c_int, ctx.*.last_state.state.rgucPacketSequence[@as(c_int, 0)]) == @as(c_int, 0)) and (@as(c_int, ctx.*.last_state.state.rgucPacketSequence[@as(c_int, 1)]) == @as(c_int, 0))) and (@as(c_int, ctx.*.last_state.state.rgucPacketSequence[@as(c_int, 2)]) == @as(c_int, 0))) and (@as(c_int, ctx.*.last_state.state.rgucPacketSequence[@as(c_int, 3)]) == @as(c_int, 0))) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
            },
            9 => {
                _ = memcpy(@ptrCast(@alignCast(&ctx.*.last_state)), @ptrCast(@alignCast(&data[@as(c_int, 1)])), @sizeOf(PS5StatePacketAlt_t));
                return @"false" != 0;
            },
            10 => {
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            12 => {
                if (VerifyCRC(data, size)) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
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
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            16 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverPS5_UpdateDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS5_Context = undefined;
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
    var timestamp: Uint64 = undefined;
    _ = &timestamp;
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
                timestamp = SDL_GetTicksNS_REAL();
                if (!HIDAPI_DriverPS5_IsPacketValid(ctx, @ptrCast(@alignCast(&data)), size)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            6 => {
                if (device.*.is_bluetooth) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
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
                    k_EPS5ReportIdState => {
                        sdl_pc = 14;
                        continue;
                    },
                    k_EPS5ReportIdBluetoothState => {
                        sdl_pc = 21;
                        continue;
                    },
                    else => {
                        sdl_pc = 28;
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
                if ((size == @as(c_int, 10)) or (size == @as(c_int, 78))) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            15 => {
                HIDAPI_DriverPS5_HandleSimpleStatePacket(joystick, device.*.dev, ctx, @ptrCast(@alignCast(&data[@as(c_int, 1)])), timestamp);
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            16 => {
                if (ctx.*.use_alternate_report) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            18 => {
                HIDAPI_DriverPS5_HandleStatePacketAlt(joystick, device.*.dev, ctx, @ptrCast(@alignCast(&data[@as(c_int, 1)])), timestamp);
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            19 => {
                HIDAPI_DriverPS5_HandleStatePacket(joystick, device.*.dev, ctx, @ptrCast(@alignCast(&data[@as(c_int, 1)])), timestamp);
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
            21 => {
                HIDAPI_DriverPS5_UpdateEnhancedModeOnEnhancedReport(ctx);
                if (ctx.*.use_alternate_report) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            22 => {
                HIDAPI_DriverPS5_HandleStatePacketAlt(joystick, device.*.dev, ctx, @ptrCast(@alignCast(&data[@as(c_int, 2)])), timestamp);
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                HIDAPI_DriverPS5_HandleStatePacket(joystick, device.*.dev, ctx, @ptrCast(@alignCast(&data[@as(c_int, 2)])), timestamp);
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            24 => {
                if (ctx.*.led_reset_state == @as(EDS5LEDResetState, k_EDS5LEDResetStatePending)) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            25 => {
                HIDAPI_DriverPS5_CheckPendingLEDReset(ctx);
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
                    sdl_pc = 13;
                    continue;
                }
            },
            28 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            29 => {
                if (packet_count == @as(c_int, 0)) {
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
                if (ctx.*.is_dongle) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            32 => {
                if (now >= (ctx.*.last_packet +% @as(Uint64, BLUETOOTH_DISCONNECT_TIMEOUT_MS))) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            33 => {
                if ((device.*.num_joysticks == @as(c_int, 0)) and !HIDAPI_HasConnectedUSBDevice(device.*.serial)) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
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
                HIDAPI_DriverPS5_TickleBluetooth(device);
                ctx.*.last_packet = now;
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
                    sdl_pc = 34;
                    continue;
                }
            },
            38 => {
                _ = HIDAPI_JoystickConnected(device, null);
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
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            41 => {
                if (packet_count == @as(c_int, 0)) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
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
                if (((packet_count == @as(c_int, 0)) and (size < @as(c_int, 0))) and (device.*.num_joysticks > @as(c_int, 0))) {
                    sdl_pc = 56;
                    continue;
                } else {
                    sdl_pc = 57;
                    continue;
                }
            },
            44 => {
                if (device.*.num_joysticks > @as(c_int, 0)) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            45 => {
                if (device.*.num_joysticks == @as(c_int, 0)) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 54;
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
                if (now >= (ctx.*.last_packet +% @as(Uint64, BLUETOOTH_DISCONNECT_TIMEOUT_MS))) {
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
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            50 => {
                HIDAPI_JoystickDisconnected(device, device.*.joysticks[@as(c_int, 0)]);
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
                _ = HIDAPI_JoystickConnected(device, null);
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
                    sdl_pc = 46;
                    continue;
                }
            },
            56 => {
                HIDAPI_JoystickDisconnected(device, device.*.joysticks[@as(c_int, 0)]);
                {
                    sdl_pc = 58;
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
                return size >= @as(c_int, 0);
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverPS5_CloseJoystick(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS5_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    SDL_RemoveHintCallback_REAL("SDL_JOYSTICK_ENHANCED_REPORTS", SDL_PS5EnhancedReportsChanged, @ptrCast(@alignCast(ctx)));
    SDL_RemoveHintCallback_REAL("SDL_JOYSTICK_HIDAPI_PS5_PLAYER_LED", SDL_PS5PlayerLEDHintChanged, @ptrCast(@alignCast(ctx)));
    ctx.*.joystick = null;
    ctx.*.report_sensors = @"false" != 0;
    ctx.*.enhanced_mode = @"false" != 0;
    ctx.*.enhanced_mode_available = @"false" != 0;
}
pub fn HIDAPI_DriverPS5_FreeDevice(_: [*c]SDL_HIDAPI_Device) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub export var SDL_HIDAPI_DriverPS5: SDL_HIDAPI_DeviceDriver = SDL_HIDAPI_DeviceDriver{
    .name = "SDL_JOYSTICK_HIDAPI_PS5",
    .enabled = @"true" != 0,
    .RegisterHints = HIDAPI_DriverPS5_RegisterHints,
    .UnregisterHints = HIDAPI_DriverPS5_UnregisterHints,
    .IsEnabled = HIDAPI_DriverPS5_IsEnabled,
    .IsSupportedDevice = HIDAPI_DriverPS5_IsSupportedDevice,
    .InitDevice = HIDAPI_DriverPS5_InitDevice,
    .GetDevicePlayerIndex = HIDAPI_DriverPS5_GetDevicePlayerIndex,
    .SetDevicePlayerIndex = HIDAPI_DriverPS5_SetDevicePlayerIndex,
    .UpdateDevice = HIDAPI_DriverPS5_UpdateDevice,
    .OpenJoystick = HIDAPI_DriverPS5_OpenJoystick,
    .RumbleJoystick = HIDAPI_DriverPS5_RumbleJoystick,
    .RumbleJoystickTriggers = HIDAPI_DriverPS5_RumbleJoystickTriggers,
    .GetJoystickCapabilities = HIDAPI_DriverPS5_GetJoystickCapabilities,
    .SetJoystickLED = HIDAPI_DriverPS5_SetJoystickLED,
    .SendJoystickEffect = HIDAPI_DriverPS5_SendJoystickEffect,
    .SetJoystickSensorsEnabled = HIDAPI_DriverPS5_SetJoystickSensorsEnabled,
    .CloseJoystick = HIDAPI_DriverPS5_CloseJoystick,
    .FreeDevice = HIDAPI_DriverPS5_FreeDevice,
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
pub const SDL_NS_PER_US = @as(c_int, 1000);
pub const USB_VENDOR_BACKBONE = @as(c_int, 0x358a);
pub const USB_VENDOR_NACON_ALT = @as(c_int, 0x3285);
pub const USB_VENDOR_RAZER = @as(c_int, 0x1532);
pub const USB_VENDOR_SONY = @as(c_int, 0x054c);
pub const USB_PRODUCT_BACKBONE_ONE_PS5_V2 = @as(c_int, 0x0304);
pub const USB_PRODUCT_NACON_REVOLUTION_5_PRO_PS5_WIRELESS = @as(c_int, 0x0d18);
pub const USB_PRODUCT_NACON_REVOLUTION_5_PRO_PS5_WIRED = @as(c_int, 0x0d19);
pub const USB_PRODUCT_RAZER_KITSUNE = @as(c_int, 0x1012);
pub const USB_PRODUCT_RAZER_RAIJU_V3_PRO_PS5_WIRED = @as(c_int, 0x1024);
pub const USB_PRODUCT_RAZER_RAIJU_V3_PRO_PS5_WIRELESS = @as(c_int, 0x1026);
pub const USB_PRODUCT_RAZER_WOLVERINE_V2_PRO_PS5_WIRED = @as(c_int, 0x100b);
pub const USB_PRODUCT_RAZER_WOLVERINE_V2_PRO_PS5_WIRELESS = @as(c_int, 0x100c);
pub const USB_PRODUCT_SONY_DS5_EDGE = @as(c_int, 0x0df2);
pub const SDL_JOYSTICK_CAP_RGB_LED = @as(c_int, 0x00000002);
pub const SDL_JOYSTICK_CAP_PLAYER_LED = @as(c_int, 0x00000004);
pub const SDL_JOYSTICK_CAP_RUMBLE = @as(c_int, 0x00000010);
pub const USB_PACKET_LENGTH = @as(c_int, 64);
pub const GYRO_RES_PER_DEGREE = @as(f32, 1024.0);
pub const ACCEL_RES_PER_G = @as(f32, 8192.0);
pub const BLUETOOTH_DISCONNECT_TIMEOUT_MS = @as(c_int, 500);
