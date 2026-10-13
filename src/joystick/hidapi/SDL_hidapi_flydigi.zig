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
pub const SDL_FLYDIGI_UNKNOWN: c_int = 0;
pub const SDL_FLYDIGI_APEX2: c_int = 1;
pub const SDL_FLYDIGI_APEX3: c_int = 2;
pub const SDL_FLYDIGI_APEX4: c_int = 3;
pub const SDL_FLYDIGI_APEX5: c_int = 4;
pub const SDL_FLYDIGI_APEX6: c_int = 5;
pub const SDL_FLYDIGI_VADER2: c_int = 16;
pub const SDL_FLYDIGI_VADER2_PRO: c_int = 17;
pub const SDL_FLYDIGI_VADER3: c_int = 18;
pub const SDL_FLYDIGI_VADER3_PRO: c_int = 19;
pub const SDL_FLYDIGI_VADER4_PRO: c_int = 20;
pub const SDL_FLYDIGI_VADER5_PRO: c_int = 21;
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memmove(__dest: ?*anyopaque, __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Sint16 = i16;
pub const Uint16 = u16;
pub const Uint32 = u32;
pub const Uint64 = u64;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_strstr_REAL(haystack: [*c]const u8, needle: [*c]const u8) [*c]u8;
pub extern fn SDL_strcasestr_REAL(haystack: [*c]const u8, needle: [*c]const u8) [*c]u8;
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
pub extern fn SDL_hid_write_REAL(dev: ?*SDL_hid_device, data: [*c]const u8, length: usize) c_int;
pub extern fn SDL_hid_read_timeout_REAL(dev: ?*SDL_hid_device, data: [*c]u8, length: usize, milliseconds: c_int) c_int;
pub extern fn SDL_GetHintBoolean_REAL(name: [*c]const u8, default_value: bool) bool;
pub const SDL_HintCallback = ?*const fn (userdata: ?*anyopaque, name: [*c]const u8, oldValue: [*c]const u8, newValue: [*c]const u8) callconv(.c) void;
pub extern fn SDL_AddHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) bool;
pub extern fn SDL_RemoveHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) void;
pub const SDL_LOG_CATEGORY_INPUT: c_int = 7;
pub extern fn SDL_LogDebug_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_GetTicks_REAL() Uint64;
pub extern fn SDL_GetTicksNS_REAL() Uint64;
pub extern fn SDL_Delay_REAL(ms: Uint32) void;
pub extern fn SDL_AssertJoysticksLocked() void;
pub extern fn SDL_IsJoystickFlydigiController(vendor_id: Uint16, product_id: Uint16) bool;
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
pub const SDL_GAMEPAD_BUTTON_FLYDIGI_M1: c_int = 11;
pub const SDL_GAMEPAD_BUTTON_FLYDIGI_M2: c_int = 12;
pub const SDL_GAMEPAD_BUTTON_FLYDIGI_M3: c_int = 13;
pub const SDL_GAMEPAD_BUTTON_FLYDIGI_M4: c_int = 14;
pub const SDL_GAMEPAD_NUM_BASE_FLYDIGI_BUTTONS: c_int = 15;
pub const SDL_DriverFlydigi_Context = extern struct {
    device: [*c]SDL_HIDAPI_Device = null,
    deviceID: Uint8 = 0,
    available: bool = false,
    has_cz: bool = false,
    has_lmrm: bool = false,
    has_circle: bool = false,
    wireless: bool = false,
    sensors_supported: bool = false,
    sensors_enabled: bool = false,
    firmware_version: Uint16 = 0,
    sensor_timestamp_ns: Uint64 = 0,
    sensor_timestamp_step_ns: Uint64 = 0,
    accelScale: f32 = 0,
    gyroScale: f32 = 0,
    next_heartbeat: Uint64 = 0,
    last_packet: Uint64 = 0,
    last_state: [64]Uint8 = @import("std").mem.zeroes([64]Uint8),
};
pub fn HIDAPI_DriverFlydigi_RegisterHints(callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = SDL_AddHintCallback_REAL("SDL_JOYSTICK_HIDAPI_FLYDIGI", callback, userdata);
}
pub fn HIDAPI_DriverFlydigi_UnregisterHints(callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_RemoveHintCallback_REAL("SDL_JOYSTICK_HIDAPI_FLYDIGI", callback, userdata);
}
pub fn HIDAPI_DriverFlydigi_IsEnabled() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI_FLYDIGI", SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI", @"true" != 0));
}
pub fn HIDAPI_DriverFlydigi_IsSupportedDevice(_: [*c]SDL_HIDAPI_Device, _: [*c]const u8, arg_type: SDL_GamepadType, vendor_id: Uint16, product_id: Uint16, _: Uint16, interface_number: c_int, _: c_int, _: c_int, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    if (SDL_IsJoystickFlydigiController(vendor_id, product_id)) {
        if (@as(c_int, vendor_id) == USB_VENDOR_FLYDIGI_V1) {
            if (interface_number == @as(c_int, 2)) {
                return @"true" != 0;
            }
        } else {
            return @"true" != 0;
        }
    }
    return @"false" != 0;
}
pub fn HIDAPI_DriverFlydigi_UpdateDeviceIdentity(device: [*c]SDL_HIDAPI_Device) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverFlydigi_Context = undefined;
    _ = &ctx;
    var controller_type: Uint8 = undefined;
    _ = &controller_type;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                ctx = @ptrCast(@alignCast(device.*.context));
                controller_type = SDL_FLYDIGI_UNKNOWN;
                switch (@as(c_int, ctx.*.deviceID)) {
                    @as(c_int, 19) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(c_int, 24) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(c_int, 26) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(c_int, 29) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(c_int, 84) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(c_int, 20) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(c_int, 21) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(c_int, 23) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(c_int, 22) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(c_int, 28) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(c_int, 80) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(c_int, 81) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(c_int, 85) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(c_int, 91) => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(c_int, 105) => {
                        sdl_pc = 16;
                        continue;
                    },
                    @as(c_int, 128) => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(c_int, 129) => {
                        sdl_pc = 18;
                        continue;
                    },
                    @as(c_int, 130) => {
                        sdl_pc = 19;
                        continue;
                    },
                    @as(c_int, 133) => {
                        sdl_pc = 20;
                        continue;
                    },
                    @as(c_int, 134) => {
                        sdl_pc = 21;
                        continue;
                    },
                    @as(c_int, 149) => {
                        sdl_pc = 22;
                        continue;
                    },
                    @as(c_int, 150) => {
                        sdl_pc = 23;
                        continue;
                    },
                    @as(c_int, 152) => {
                        sdl_pc = 24;
                        continue;
                    },
                    else => {
                        sdl_pc = 25;
                        continue;
                    },
                }
            },
            1 => {
                device.*.guid.data[@as(c_int, 15)] = controller_type;
                ctx.*.sensor_timestamp_step_ns = @bitCast(@as(c_long, @truncate(@divTrunc(SDL_NS_PER_SECOND, @as(c_longlong, 125)))));
                switch (@as(c_int, controller_type)) {
                    SDL_FLYDIGI_APEX2 => {
                        sdl_pc = 60;
                        continue;
                    },
                    SDL_FLYDIGI_APEX3 => {
                        sdl_pc = 61;
                        continue;
                    },
                    SDL_FLYDIGI_APEX4 => {
                        sdl_pc = 62;
                        continue;
                    },
                    SDL_FLYDIGI_APEX5 => {
                        sdl_pc = 63;
                        continue;
                    },
                    SDL_FLYDIGI_APEX6 => {
                        sdl_pc = 64;
                        continue;
                    },
                    SDL_FLYDIGI_VADER2 => {
                        sdl_pc = 65;
                        continue;
                    },
                    SDL_FLYDIGI_VADER2_PRO => {
                        sdl_pc = 66;
                        continue;
                    },
                    SDL_FLYDIGI_VADER3 => {
                        sdl_pc = 67;
                        continue;
                    },
                    SDL_FLYDIGI_VADER3_PRO => {
                        sdl_pc = 68;
                        continue;
                    },
                    SDL_FLYDIGI_VADER4_PRO => {
                        sdl_pc = 69;
                        continue;
                    },
                    SDL_FLYDIGI_VADER5_PRO => {
                        sdl_pc = 70;
                        continue;
                    },
                    else => {
                        sdl_pc = 71;
                        continue;
                    },
                }
            },
            2 => {
                controller_type = SDL_FLYDIGI_APEX2;
                {
                    sdl_pc = 1;
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
                controller_type = SDL_FLYDIGI_APEX3;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            6 => {
                controller_type = SDL_FLYDIGI_APEX4;
                {
                    sdl_pc = 1;
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
                controller_type = SDL_FLYDIGI_VADER2;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            10 => {
                controller_type = SDL_FLYDIGI_VADER2_PRO;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            11 => {
                controller_type = SDL_FLYDIGI_VADER3;
                {
                    sdl_pc = 1;
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
                controller_type = SDL_FLYDIGI_VADER3_PRO;
                {
                    sdl_pc = 1;
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
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                controller_type = SDL_FLYDIGI_VADER4_PRO;
                {
                    sdl_pc = 1;
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
                controller_type = SDL_FLYDIGI_APEX5;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            19 => {
                controller_type = SDL_FLYDIGI_VADER5_PRO;
                {
                    sdl_pc = 1;
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
                controller_type = SDL_FLYDIGI_APEX5;
                {
                    sdl_pc = 1;
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
                controller_type = SDL_FLYDIGI_APEX6;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            25 => {
                if (@as(?*anyopaque, @ptrCast(@alignCast(SDL_strcasestr_REAL(device.*.name, "VADER")))) != @as(?*anyopaque, null)) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            26 => {
                if (@as(?*anyopaque, @ptrCast(@alignCast(SDL_strstr_REAL(device.*.name, "VADER2")))) != @as(?*anyopaque, null)) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            27 => {
                if (@as(?*anyopaque, @ptrCast(@alignCast(SDL_strstr_REAL(device.*.name, "APEX")))) != @as(?*anyopaque, null)) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            28 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            29 => {
                controller_type = SDL_FLYDIGI_VADER2;
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            30 => {
                if (@as(?*anyopaque, @ptrCast(@alignCast(SDL_strstr_REAL(device.*.name, "VADER3")))) != @as(?*anyopaque, null)) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
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
                controller_type = SDL_FLYDIGI_VADER3;
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            33 => {
                if (@as(?*anyopaque, @ptrCast(@alignCast(SDL_strstr_REAL(device.*.name, "VADER4")))) != @as(?*anyopaque, null)) {
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
                controller_type = SDL_FLYDIGI_VADER4_PRO;
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            36 => {
                if (@as(?*anyopaque, @ptrCast(@alignCast(SDL_strstr_REAL(device.*.name, "Vader 5")))) != @as(?*anyopaque, null)) {
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
                controller_type = SDL_FLYDIGI_VADER5_PRO;
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
                    sdl_pc = 37;
                    continue;
                }
            },
            41 => {
                if (@as(?*anyopaque, @ptrCast(@alignCast(SDL_strstr_REAL(device.*.name, "APEX2")))) != @as(?*anyopaque, null)) {
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
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            44 => {
                controller_type = SDL_FLYDIGI_APEX2;
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            45 => {
                if (@as(?*anyopaque, @ptrCast(@alignCast(SDL_strstr_REAL(device.*.name, "APEX3")))) != @as(?*anyopaque, null)) {
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
                controller_type = SDL_FLYDIGI_APEX3;
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            48 => {
                if (@as(?*anyopaque, @ptrCast(@alignCast(SDL_strstr_REAL(device.*.name, "APEX4")))) != @as(?*anyopaque, null)) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
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
                controller_type = SDL_FLYDIGI_APEX4;
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            51 => {
                if (@as(?*anyopaque, @ptrCast(@alignCast(SDL_strstr_REAL(device.*.name, "APEX5")))) != @as(?*anyopaque, null)) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 54;
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
                controller_type = SDL_FLYDIGI_APEX5;
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            54 => {
                if (@as(?*anyopaque, @ptrCast(@alignCast(SDL_strstr_REAL(device.*.name, "APEX6")))) != @as(?*anyopaque, null)) {
                    sdl_pc = 56;
                    continue;
                } else {
                    sdl_pc = 57;
                    continue;
                }
            },
            55 => {
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            56 => {
                controller_type = SDL_FLYDIGI_APEX6;
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
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            59 => {
                {}
            },
            60 => {
                HIDAPI_SetDeviceName(device, "Flydigi Apex 2");
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            61 => {
                HIDAPI_SetDeviceName(device, "Flydigi Apex 3");
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            62 => {
                HIDAPI_SetDeviceName(device, "Flydigi Apex 4");
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            63 => {
                HIDAPI_SetDeviceName(device, "Flydigi Apex 5");
                ctx.*.has_lmrm = @"true" != 0;
                ctx.*.sensors_supported = @"true" != 0;
                ctx.*.accelScale = SDL_STANDARD_GRAVITY / @as(f32, 4096.0);
                ctx.*.gyroScale = @as(f32, 2000.0) * (SDL_PI_F / @as(f32, 180.0));
                ctx.*.sensor_timestamp_step_ns = @bitCast(@as(c_long, @truncate(if (ctx.*.wireless) @divTrunc(SDL_NS_PER_SECOND, @as(c_longlong, SENSOR_INTERVAL_APEX5_DONGLE_RATE_HZ)) else @divTrunc(SDL_NS_PER_SECOND, @as(c_longlong, SENSOR_INTERVAL_APEX5_WIRED_RATE_HZ)))));
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            64 => {
                HIDAPI_SetDeviceName(device, "Flydigi Apex 6");
                ctx.*.has_lmrm = @"true" != 0;
                ctx.*.sensors_supported = @"true" != 0;
                ctx.*.accelScale = SDL_STANDARD_GRAVITY / @as(f32, 4096.0);
                ctx.*.gyroScale = @as(f32, 2000.0) * (SDL_PI_F / @as(f32, 180.0));
                ctx.*.sensor_timestamp_step_ns = @bitCast(@as(c_long, @truncate(if (ctx.*.wireless) @divTrunc(SDL_NS_PER_SECOND, @as(c_longlong, SENSOR_INTERVAL_APEX5_DONGLE_RATE_HZ)) else @divTrunc(SDL_NS_PER_SECOND, @as(c_longlong, SENSOR_INTERVAL_APEX5_WIRED_RATE_HZ)))));
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            65 => {
                HIDAPI_SetDeviceName(device, "Flydigi Vader 2");
                ctx.*.has_cz = @"true" != 0;
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            66 => {
                HIDAPI_SetDeviceName(device, "Flydigi Vader 2 Pro");
                ctx.*.has_cz = @"true" != 0;
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            67 => {
                HIDAPI_SetDeviceName(device, "Flydigi Vader 3");
                ctx.*.has_cz = @"true" != 0;
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            68 => {
                HIDAPI_SetDeviceName(device, "Flydigi Vader 3 Pro");
                ctx.*.has_cz = @"true" != 0;
                ctx.*.sensors_supported = @"true" != 0;
                ctx.*.accelScale = SDL_STANDARD_GRAVITY / @as(f32, 256.0);
                ctx.*.sensor_timestamp_step_ns = @bitCast(@as(c_long, @truncate(if (ctx.*.wireless) @divTrunc(SDL_NS_PER_SECOND, @as(c_longlong, SENSOR_INTERVAL_VADER4_PRO_DONGLE_RATE_HZ)) else @divTrunc(SDL_NS_PER_SECOND, @as(c_longlong, SENSOR_INTERVAL_VADER4_PRO_WIRED_RATE_HZ)))));
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            69 => {
                HIDAPI_SetDeviceName(device, "Flydigi Vader 4 Pro");
                ctx.*.has_cz = @"true" != 0;
                ctx.*.sensors_supported = @"true" != 0;
                ctx.*.accelScale = SDL_STANDARD_GRAVITY / @as(f32, 256.0);
                ctx.*.sensor_timestamp_step_ns = @bitCast(@as(c_long, @truncate(if (ctx.*.wireless) @divTrunc(SDL_NS_PER_SECOND, @as(c_longlong, SENSOR_INTERVAL_VADER4_PRO_DONGLE_RATE_HZ)) else @divTrunc(SDL_NS_PER_SECOND, @as(c_longlong, SENSOR_INTERVAL_VADER4_PRO_WIRED_RATE_HZ)))));
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            70 => {
                HIDAPI_SetDeviceName(device, "Flydigi Vader 5 Pro");
                ctx.*.has_cz = @"true" != 0;
                ctx.*.has_lmrm = @"true" != 0;
                ctx.*.has_circle = @"true" != 0;
                ctx.*.sensors_supported = @"true" != 0;
                ctx.*.accelScale = SDL_STANDARD_GRAVITY / @as(f32, 4096.0);
                ctx.*.gyroScale = @as(f32, 2000.0) * (SDL_PI_F / @as(f32, 180.0));
                ctx.*.sensor_timestamp_step_ns = @bitCast(@as(c_long, @truncate(@divTrunc(SDL_NS_PER_SECOND, @as(c_longlong, SENSOR_INTERVAL_VADER5_PRO_RATE_HZ)))));
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            71 => {
                SDL_LogDebug_REAL(SDL_LOG_CATEGORY_INPUT, "Unknown FlyDigi controller with ID %d, name '%s'", ctx.*.deviceID, device.*.name);
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverFlydigi_SetAvailable(device: [*c]SDL_HIDAPI_Device, available: bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverFlydigi_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    if (@as(c_int, @intFromBool(available)) == @as(c_int, @intFromBool(ctx.*.available))) {
        return;
    }
    if (available) {
        if (device.*.num_joysticks == @as(c_int, 0)) {
            _ = HIDAPI_JoystickConnected(device, null);
        }
    } else {
        if (device.*.num_joysticks > @as(c_int, 0)) {
            HIDAPI_JoystickDisconnected(device, device.*.joysticks[@as(c_int, 0)]);
        }
    }
    ctx.*.available = available;
}
pub fn HIDAPI_DriverFlydigi_WritePacket(device: [*c]SDL_HIDAPI_Device, data: [*c]const Uint8, size: usize) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var bUsesUnnumberedReports: bool = (@as(c_int, device.*.vendor_id) == USB_VENDOR_FLYDIGI_V2) and ((@as(c_int, device.*.product_id) == USB_PRODUCT_FLYDIGI_V2_VADER) or (@as(c_int, device.*.product_id) == USB_PRODUCT_FLYDIGI_V2_APEX6));
    _ = &bUsesUnnumberedReports;
    if (bUsesUnnumberedReports and (@as(c_int, data[@as(c_int, 0)]) == FLYDIGI_V2_CMD_REPORT_ID)) {
        var output: [64]Uint8 = undefined;
        _ = &output;
        _ = memcpy(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&output))))), @ptrCast(@alignCast(data)), if (size < @as(usize, @bitCast(@as(c_long, USB_PACKET_LENGTH)))) size else @as(usize, @bitCast(@as(c_long, USB_PACKET_LENGTH))));
        output[@as(c_int, 0)] = 0;
        return SDL_hid_write_REAL(device.*.dev, @ptrCast(@alignCast(&output)), if (size < @as(usize, @bitCast(@as(c_long, USB_PACKET_LENGTH)))) size else @as(usize, @bitCast(@as(c_long, USB_PACKET_LENGTH))));
    }
    return SDL_hid_write_REAL(device.*.dev, data, size);
}
pub fn HIDAPI_DriverFlydigi_InitControllerV1(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverFlydigi_Context = undefined;
    _ = &ctx;
    var attempt: c_int = undefined;
    _ = &attempt;
    var request: [12]Uint8 = undefined;
    _ = &request;
    var i: c_int = undefined;
    _ = &i;
    var data: [64]Uint8 = undefined;
    _ = &data;
    var size: c_int = undefined;
    _ = &size;
    var serial: [9]u8 = undefined;
    _ = &serial;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                ctx = @ptrCast(@alignCast(device.*.context));
                attempt = 0;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            1 => {
                if ((@as(c_int, ctx.*.deviceID) == @as(c_int, 0)) and (attempt < @as(c_int, 30))) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 4;
                    continue;
                }
            },
            2 => {
                request = [12]Uint8{
                    FLYDIGI_V1_CMD_REPORT_ID,
                    FLYDIGI_V1_GET_INFO_COMMAND,
                    0,
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
                _ = HIDAPI_DriverFlydigi_WritePacket(device, @ptrCast(@alignCast(&request)), @sizeOf(@TypeOf(request)));
                i = 0;
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            3 => {
                attempt += 1;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                HIDAPI_DriverFlydigi_UpdateDeviceIdentity(device);
                HIDAPI_DriverFlydigi_SetAvailable(device, @"true" != 0);
                return @"true" != 0;
            },
            5 => {
                if (i < @as(c_int, 100)) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            6 => {
                SDL_Delay_REAL(1);
                size = SDL_hid_read_timeout_REAL(device.*.dev, @ptrCast(@alignCast(&data)), @sizeOf(@TypeOf(data)), 0);
                if (size < @as(c_int, 0)) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
            },
            7 => {
                i += 1;
                {
                    sdl_pc = 5;
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
                {
                    sdl_pc = 8;
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
                if (size == @as(c_int, 0)) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 13;
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
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            14 => {
                if ((size == @as(c_int, 32)) and (@as(c_int, data[@as(c_int, 15)]) == @as(c_int, 236))) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            15 => {
                ctx.*.deviceID = data[@as(c_int, 3)];
                ctx.*.firmware_version = @bitCast(@as(c_short, @as(Sint16, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 9)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 10)])) << @intCast(@as(c_int, 8)))))));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&serial)), @sizeOf(@TypeOf(serial)), "%.2x%.2x%.2x%.2x", data[@as(c_int, 5)], data[@as(c_int, 6)], data[@as(c_int, 7)], data[@as(c_int, 8)]);
                HIDAPI_SetDeviceSerial(device, @ptrCast(@alignCast(&serial)));
                if (@as(c_int, ctx.*.firmware_version) >= @as(c_int, 25600)) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
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
                    sdl_pc = 7;
                    continue;
                }
            },
            18 => {
                switch (@as(c_int, data[@as(c_int, 13)])) {
                    @as(c_int, 0) => {
                        sdl_pc = 22;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 23;
                        continue;
                    },
                    else => {
                        sdl_pc = 24;
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
                    sdl_pc = 8;
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
                ctx.*.wireless = @"true" != 0;
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            23 => {
                ctx.*.wireless = @"false" != 0;
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            24 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn GetReply(device: [*c]SDL_HIDAPI_Device, command: Uint8, data: [*c]Uint8, length: usize) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    {
        var i: c_int = 0;
        _ = &i;
        while (i < @as(c_int, 100)) : (i += 1) {
            SDL_Delay_REAL(1);
            var size: c_int = SDL_hid_read_timeout_REAL(device.*.dev, data, length, 0);
            _ = &size;
            if (size < @as(c_int, 0)) {
                break;
            }
            if (size == @as(c_int, 0)) {
                continue;
            }
            if (size == @as(c_int, 32)) {
                if ((@as(c_int, data[@as(c_int, 1)]) == FLYDIGI_V2_MAGIC1) and (@as(c_int, data[@as(c_int, 2)]) == FLYDIGI_V2_MAGIC2)) {
                    _ = memmove(@ptrCast(@alignCast(&data[@as(c_int, 0)])), @ptrCast(@alignCast(&data[@as(c_int, 1)])), @bitCast(@as(c_long, size - @as(c_int, 1))));
                    data[@bitCast(@as(isize, @intCast(size - @as(c_int, 1))))] = 0;
                }
                if (((@as(c_int, data[@as(c_int, 0)]) == FLYDIGI_V2_MAGIC1) and (@as(c_int, data[@as(c_int, 1)]) == FLYDIGI_V2_MAGIC2)) and (@as(c_int, data[@as(c_int, 2)]) == @as(c_int, command))) {
                    return @"true" != 0;
                }
            }
        }
    }
    return @"false" != 0;
}
pub fn SDL_HIDAPI_Flydigi_CheckNewArchitectureRequest(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const cmd: [6]Uint8 = [6]Uint8{
        FLYDIGI_V2_CMD_REPORT_ID,
        FLYDIGI_V2_MAGIC1,
        FLYDIGI_V2_MAGIC2,
        FLYDIGI_V2_CHECK_ARCHITECTURE_COMMAND,
        0,
        0,
    };
    _ = &cmd;
    if (HIDAPI_DriverFlydigi_WritePacket(device, @ptrCast(@alignCast(&cmd)), @sizeOf(@TypeOf(cmd))) < @as(c_int, 0)) {
        return SDL_SetError_REAL("Couldn't query controller info");
    }
    return @"true" != 0;
}
pub fn SDL_HIDAPI_Flydigi_SendInfoRequest(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const cmd: [6]Uint8 = [6]Uint8{
        FLYDIGI_V2_CMD_REPORT_ID,
        FLYDIGI_V2_MAGIC1,
        FLYDIGI_V2_MAGIC2,
        FLYDIGI_V2_GET_INFO_COMMAND,
        2,
        0,
    };
    _ = &cmd;
    if (HIDAPI_DriverFlydigi_WritePacket(device, @ptrCast(@alignCast(&cmd)), @sizeOf(@TypeOf(cmd))) < @as(c_int, 0)) {
        return SDL_SetError_REAL("Couldn't query controller info");
    }
    return @"true" != 0;
}
pub fn HIDAPI_DriverFlydigi_HandleInfoResponse(joystick: [*c]SDL_Joystick, ctx: [*c]SDL_DriverFlydigi_Context, data: [*c]Uint8, _: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
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
                status = @bitCast(@as(i8, @truncate((@as(c_int, data[@as(c_int, 11)]) >> @intCast(@as(c_int, 4))) & @as(c_int, 15))));
                level = @bitCast(@as(i8, @truncate(@as(c_int, data[@as(c_int, 11)]) & @as(c_int, 15))));
                switch (@as(c_int, status)) {
                    @as(c_int, 0) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 6;
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
            1 => {
                SDL_SendJoystickPowerInfo(joystick, state, percent);
                {}
            },
            2 => {
                state = SDL_POWERSTATE_ON_BATTERY;
                if (@as(c_int, ctx.*.device.*.guid.data[@as(c_int, 15)]) == SDL_FLYDIGI_APEX6) {
                    sdl_pc = 3;
                    continue;
                } else {
                    sdl_pc = 4;
                    continue;
                }
            },
            3 => {
                percent = @as(c_int, level) * @as(c_int, 10);
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                percent = @as(c_int, level) * @as(c_int, 20);
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            5 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            6 => {
                state = SDL_POWERSTATE_CHARGING;
                if (@as(c_int, ctx.*.device.*.guid.data[@as(c_int, 15)]) == SDL_FLYDIGI_APEX6) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                percent = @as(c_int, level) * @as(c_int, 10);
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                percent = @as(c_int, level) * @as(c_int, 20);
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            10 => {
                state = SDL_POWERSTATE_CHARGED;
                percent = 100;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            11 => {
                state = SDL_POWERSTATE_UNKNOWN;
                percent = 0;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn SDL_HIDAPI_Flydigi_SendStatusRequest(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const cmd: [4]Uint8 = [4]Uint8{
        FLYDIGI_V2_CMD_REPORT_ID,
        FLYDIGI_V2_MAGIC1,
        FLYDIGI_V2_MAGIC2,
        FLYDIGI_V2_GET_STATUS_COMMAND,
    };
    _ = &cmd;
    if (HIDAPI_DriverFlydigi_WritePacket(device, @ptrCast(@alignCast(&cmd)), @sizeOf(@TypeOf(cmd))) < @as(c_int, 0)) {
        return SDL_SetError_REAL("Couldn't query controller status");
    }
    return @"true" != 0;
}
pub fn HIDAPI_DriverFlydigi_HandleStatusResponse(device: [*c]SDL_HIDAPI_Device, data: [*c]Uint8, _: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (@as(c_int, data[@as(c_int, 9)]) == @as(c_int, 1)) {
        HIDAPI_DriverFlydigi_SetAvailable(device, @"true" != 0);
    } else {
        HIDAPI_DriverFlydigi_SetAvailable(device, @"false" != 0);
    }
}
pub fn SDL_HIDAPI_Flydigi_SendAcquireRequest(device: [*c]SDL_HIDAPI_Device, acquire: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const cmd: [32]Uint8 = [32]Uint8{
        FLYDIGI_V2_CMD_REPORT_ID,
        FLYDIGI_V2_MAGIC1,
        FLYDIGI_V2_MAGIC2,
        FLYDIGI_V2_ACQUIRE_CONTROLLER_COMMAND,
        23,
        @bitCast(@as(i8, @truncate(if (acquire) @as(c_int, 1) else @as(c_int, 0)))),
        'S',
        'D',
        'L',
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
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
    _ = &cmd;
    if (HIDAPI_DriverFlydigi_WritePacket(device, @ptrCast(@alignCast(&cmd)), @sizeOf(@TypeOf(cmd))) < @as(c_int, 0)) {
        return SDL_SetError_REAL("Couldn't send acquire command");
    }
    return @"true" != 0;
}
pub fn HIDAPI_DriverFlydigi_HandleAcquireResponse(device: [*c]SDL_HIDAPI_Device, data: [*c]Uint8, _: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if ((@as(c_int, data[@as(c_int, 5)]) != @as(c_int, 1)) and (@as(c_int, data[@as(c_int, 6)]) == @as(c_int, 0))) {
        HIDAPI_DriverFlydigi_SetAvailable(device, @"false" != 0);
    }
}
pub fn HIDAPI_DriverFlydigi_InitControllerV2(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverFlydigi_Context = undefined;
    _ = &ctx;
    var versionData: [64]Uint8 = undefined;
    _ = &versionData;
    var isNewArchitecture: bool = undefined;
    _ = &isNewArchitecture;
    var data: [64]Uint8 = undefined;
    _ = &data;
    var min_firmware_version: Uint16 = undefined;
    _ = &min_firmware_version;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                ctx = @ptrCast(@alignCast(device.*.context));
                isNewArchitecture = @"false" != 0;
                if (!SDL_HIDAPI_Flydigi_CheckNewArchitectureRequest(device)) {
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
                if (!GetReply(device, FLYDIGI_V2_CHECK_ARCHITECTURE_COMMAND, @ptrCast(@alignCast(&versionData)), @sizeOf(@TypeOf(versionData)))) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                return SDL_SetError_REAL("Couldn't get controller info");
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                if ((@as(c_int, versionData[@as(c_int, 3)]) == @as(c_int, 1)) and (@as(c_int, versionData[@as(c_int, 4)]) == @as(c_int, 0))) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                isNewArchitecture = @"true" != 0;
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
                if (!SDL_HIDAPI_Flydigi_SendInfoRequest(device)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                return @"false" != 0;
            },
            11 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                if (!GetReply(device, FLYDIGI_V2_GET_INFO_COMMAND, @ptrCast(@alignCast(&data)), @sizeOf(@TypeOf(data)))) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            13 => {
                return SDL_SetError_REAL("Couldn't get controller info");
            },
            14 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                ctx.*.firmware_version = @bitCast(@as(c_short, @as(Sint16, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 16)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 15)])) << @intCast(@as(c_int, 8)))))));
                switch (@as(c_int, device.*.product_id)) {
                    USB_PRODUCT_FLYDIGI_V2_APEX => {
                        sdl_pc = 17;
                        continue;
                    },
                    USB_PRODUCT_FLYDIGI_V2_VADER => {
                        sdl_pc = 18;
                        continue;
                    },
                    else => {
                        sdl_pc = 19;
                        continue;
                    },
                }
            },
            16 => {
                if (@as(c_int, ctx.*.firmware_version) < @as(c_int, min_firmware_version)) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            17 => {
                min_firmware_version = 28721;
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            18 => {
                min_firmware_version = 28993;
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            19 => {
                min_firmware_version = 0;
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            20 => {
                return SDL_SetError_REAL("Unsupported firmware version");
            },
            21 => {
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            22 => {
                if (isNewArchitecture) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                switch (@as(c_int, data[@as(c_int, 6)])) {
                    @as(c_int, 0) => {
                        sdl_pc = 27;
                        continue;
                    },
                    @as(c_int, 1) => {
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
                switch (@as(c_int, data[@as(c_int, 6)])) {
                    @as(c_int, 1) => {
                        sdl_pc = 31;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 32;
                        continue;
                    },
                    else => {
                        sdl_pc = 33;
                        continue;
                    },
                }
            },
            25 => {
                ctx.*.deviceID = data[@as(c_int, 5)];
                HIDAPI_DriverFlydigi_UpdateDeviceIdentity(device);
                _ = SDL_HIDAPI_Flydigi_SendStatusRequest(device);
                return @"true" != 0;
            },
            26 => {
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            27 => {
                ctx.*.wireless = @"false" != 0;
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            28 => {
                ctx.*.wireless = @"true" != 0;
                {
                    sdl_pc = 26;
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
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            31 => {
                ctx.*.wireless = @"false" != 0;
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            32 => {
                ctx.*.wireless = @"true" != 0;
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            33 => {
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverFlydigi_InitDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverFlydigi_Context = undefined;
    ctx = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(ctx.*)))));
    _ = &ctx;
    if (!(ctx != null)) {
        return @"false" != 0;
    }
    ctx.*.device = device;
    device.*.context = @ptrCast(@alignCast(ctx));
    if (@as(c_int, device.*.vendor_id) == USB_VENDOR_FLYDIGI_V1) {
        return HIDAPI_DriverFlydigi_InitControllerV1(device);
    } else {
        return HIDAPI_DriverFlydigi_InitControllerV2(device);
    }
}
pub fn HIDAPI_DriverFlydigi_GetDevicePlayerIndex(_: [*c]SDL_HIDAPI_Device, _: SDL_JoystickID) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return -@as(c_int, 1);
}
pub fn HIDAPI_DriverFlydigi_SetDevicePlayerIndex(_: [*c]SDL_HIDAPI_Device, _: SDL_JoystickID, _: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn HIDAPI_DriverFlydigi_OpenJoystick(device: [*c]SDL_HIDAPI_Device, joystick: [*c]SDL_Joystick) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverFlydigi_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    SDL_AssertJoysticksLocked();
    _ = memset(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.last_state))))), 0, @sizeOf(@TypeOf(ctx.*.last_state)));
    joystick.*.nbuttons = SDL_GAMEPAD_NUM_BASE_FLYDIGI_BUTTONS;
    if (ctx.*.has_cz) {
        joystick.*.nbuttons += 2;
    }
    if (ctx.*.has_lmrm) {
        joystick.*.nbuttons += 2;
    }
    if (ctx.*.has_circle) {
        joystick.*.nbuttons += 1;
    }
    joystick.*.naxes = SDL_GAMEPAD_AXIS_COUNT;
    joystick.*.nhats = 1;
    if (ctx.*.wireless) {
        joystick.*.connection_state = SDL_JOYSTICK_CONNECTION_WIRELESS;
    }
    if (ctx.*.sensors_supported) {
        const flSensorRate: f32 = if (ctx.*.wireless) @as(f32, @floatFromInt(SENSOR_INTERVAL_VADER4_PRO_DONGLE_RATE_HZ)) else @as(f32, @floatFromInt(SENSOR_INTERVAL_VADER4_PRO_WIRED_RATE_HZ));
        _ = &flSensorRate;
        SDL_PrivateJoystickAddSensor(joystick, SDL_SENSOR_GYRO, flSensorRate);
        SDL_PrivateJoystickAddSensor(joystick, SDL_SENSOR_ACCEL, flSensorRate);
    }
    return @"true" != 0;
}
pub fn HIDAPI_DriverFlydigi_RumbleJoystick(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, low_frequency_rumble: Uint16, high_frequency_rumble: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (@as(c_int, device.*.vendor_id) == USB_VENDOR_FLYDIGI_V1) {
        var rumble_packet: [4]Uint8 = [4]Uint8{
            FLYDIGI_V1_CMD_REPORT_ID,
            FLYDIGI_V1_HAPTIC_COMMAND,
            0,
            0,
        };
        _ = &rumble_packet;
        rumble_packet[@as(c_int, 2)] = @bitCast(@as(i8, @truncate(@as(c_int, low_frequency_rumble) >> @intCast(@as(c_int, 8)))));
        rumble_packet[@as(c_int, 3)] = @bitCast(@as(i8, @truncate(@as(c_int, high_frequency_rumble) >> @intCast(@as(c_int, 8)))));
        if (@as(c_ulong, @bitCast(@as(c_long, SDL_HIDAPI_SendRumble(device, @ptrCast(@alignCast(&rumble_packet)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(rumble_packet))))))))) != @sizeOf(@TypeOf(rumble_packet))) {
            return SDL_SetError_REAL("Couldn't send rumble packet");
        }
    } else {
        var rumble_packet: [10]Uint8 = [10]Uint8{
            FLYDIGI_V2_CMD_REPORT_ID,
            FLYDIGI_V2_MAGIC1,
            FLYDIGI_V2_MAGIC2,
            FLYDIGI_V2_HAPTIC_COMMAND,
            6,
            0,
            0,
            0,
            0,
            0,
        };
        _ = &rumble_packet;
        rumble_packet[@as(c_int, 5)] = @bitCast(@as(i8, @truncate(@as(c_int, low_frequency_rumble) >> @intCast(@as(c_int, 8)))));
        rumble_packet[@as(c_int, 6)] = @bitCast(@as(i8, @truncate(@as(c_int, high_frequency_rumble) >> @intCast(@as(c_int, 8)))));
        if (@as(c_ulong, @bitCast(@as(c_long, SDL_HIDAPI_SendRumble(device, @ptrCast(@alignCast(&rumble_packet)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(rumble_packet))))))))) != @sizeOf(@TypeOf(rumble_packet))) {
            return SDL_SetError_REAL("Couldn't send rumble packet");
        }
    }
    return @"true" != 0;
}
pub fn HIDAPI_DriverFlydigi_RumbleJoystickTriggers(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: Uint16, _: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverFlydigi_GetJoystickCapabilities(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    return SDL_JOYSTICK_CAP_RUMBLE;
}
pub fn HIDAPI_DriverFlydigi_SetJoystickLED(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: Uint8, _: Uint8, _: Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverFlydigi_SendJoystickEffect(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: ?*const anyopaque, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverFlydigi_SetJoystickSensorsEnabled(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, enabled: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverFlydigi_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    if (ctx.*.sensors_supported) {
        ctx.*.sensors_enabled = enabled;
        return @"true" != 0;
    }
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverFlydigi_HandleStatePacketV1(joystick: [*c]SDL_Joystick, ctx: [*c]SDL_DriverFlydigi_Context, data: [*c]Uint8, size: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var axis: Sint16 = undefined;
    _ = &axis;
    var timestamp: Uint64 = undefined;
    _ = &timestamp;
    var extra_button_index: Uint8 = undefined;
    _ = &extra_button_index;
    var hat: Uint8 = undefined;
    _ = &hat;
    var sensor_timestamp: Uint64 = undefined;
    _ = &sensor_timestamp;
    var values: [3]f32 = undefined;
    _ = &values;
    var flPitchAndYawScale: f32 = undefined;
    _ = &flPitchAndYawScale;
    var flRollScale: f32 = undefined;
    _ = &flRollScale;
    var flAccelScale: f32 = undefined;
    _ = &flAccelScale;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                timestamp = SDL_GetTicksNS_REAL();
                extra_button_index = SDL_GAMEPAD_NUM_BASE_FLYDIGI_BUTTONS;
                if (@as(c_int, ctx.*.last_state[@as(c_int, 9)]) != @as(c_int, data[@as(c_int, 9)])) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                switch (@as(c_int, data[@as(c_int, 9)]) & @as(c_int, 15)) {
                    @as(c_int, 1) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(c_int, @as(c_uint, 2) | @as(c_uint, 1)) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(c_int, @as(c_uint, 2) | @as(c_uint, 4)) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(c_int, @as(c_uint, 8) | @as(c_uint, 4)) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(c_int, 8) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(c_int, @as(c_uint, 8) | @as(c_uint, 1)) => {
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
                if (@as(c_int, ctx.*.last_state[@as(c_int, 10)]) != @as(c_int, data[@as(c_int, 10)])) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            4 => {
                SDL_SendJoystickHat(timestamp, joystick, 0, hat);
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SOUTH, (@as(c_int, data[@as(c_int, 9)]) & @as(c_int, 16)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_EAST, (@as(c_int, data[@as(c_int, 9)]) & @as(c_int, 32)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_BACK, (@as(c_int, data[@as(c_int, 9)]) & @as(c_int, 64)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_WEST, (@as(c_int, data[@as(c_int, 9)]) & @as(c_int, 128)) != @as(c_int, 0));
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
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_NORTH, (@as(c_int, data[@as(c_int, 10)]) & @as(c_int, 1)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_START, (@as(c_int, data[@as(c_int, 10)]) & @as(c_int, 2)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_SHOULDER, (@as(c_int, data[@as(c_int, 10)]) & @as(c_int, 4)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER, (@as(c_int, data[@as(c_int, 10)]) & @as(c_int, 8)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_STICK, (@as(c_int, data[@as(c_int, 10)]) & @as(c_int, 64)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_STICK, (@as(c_int, data[@as(c_int, 10)]) & @as(c_int, 128)) != @as(c_int, 0));
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
                if (@as(c_int, ctx.*.last_state[@as(c_int, 7)]) != @as(c_int, data[@as(c_int, 7)])) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            17 => {
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_FLYDIGI_M1, (@as(c_int, data[@as(c_int, 7)]) & @as(c_int, 4)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_FLYDIGI_M2, (@as(c_int, data[@as(c_int, 7)]) & @as(c_int, 8)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_FLYDIGI_M3, (@as(c_int, data[@as(c_int, 7)]) & @as(c_int, 16)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_FLYDIGI_M4, (@as(c_int, data[@as(c_int, 7)]) & @as(c_int, 32)) != @as(c_int, 0));
                if (ctx.*.has_cz) {
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
                if (@as(c_int, ctx.*.last_state[@as(c_int, 8)]) != @as(c_int, data[@as(c_int, 8)])) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            20 => {
                SDL_SendJoystickButton(timestamp, joystick, blk: {
                    const ref = &extra_button_index;
                    const tmp = ref.*;
                    ref.* +%= 1;
                    break :blk tmp;
                }, (@as(c_int, data[@as(c_int, 7)]) & @as(c_int, 1)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, blk: {
                    const ref = &extra_button_index;
                    const tmp = ref.*;
                    ref.* +%= 1;
                    break :blk tmp;
                }, (@as(c_int, data[@as(c_int, 7)]) & @as(c_int, 2)) != @as(c_int, 0));
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
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            23 => {
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_GUIDE, (@as(c_int, data[@as(c_int, 8)]) & @as(c_int, 8)) != @as(c_int, 0));
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
                axis = @truncate(if (@as(c_int, data[@as(c_int, 17)]) == @as(c_int, 127)) @as(c_int, 0) else @as(c_int, @as(Sint16, @intFromFloat(HIDAPI_RemapVal(@floatFromInt(@as(c_int, data[@as(c_int, 17)]) - @as(c_int, 127)), @floatFromInt(-@as(c_int, 127)), @floatFromInt(@as(c_int, 255) - @as(c_int, 127)), @floatFromInt(@as(Sint16, @truncate(~@as(c_int, 32767)))), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767)))))))));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, axis);
                axis = @truncate(if (@as(c_int, data[@as(c_int, 19)]) == @as(c_int, 127)) @as(c_int, 0) else @as(c_int, @as(Sint16, @intFromFloat(HIDAPI_RemapVal(@floatFromInt(@as(c_int, data[@as(c_int, 19)]) - @as(c_int, 127)), @floatFromInt(-@as(c_int, 127)), @floatFromInt(@as(c_int, 255) - @as(c_int, 127)), @floatFromInt(@as(Sint16, @truncate(~@as(c_int, 32767)))), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767)))))))));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, axis);
                axis = @truncate(if (@as(c_int, data[@as(c_int, 21)]) == @as(c_int, 127)) @as(c_int, 0) else @as(c_int, @as(Sint16, @intFromFloat(HIDAPI_RemapVal(@floatFromInt(@as(c_int, data[@as(c_int, 21)]) - @as(c_int, 127)), @floatFromInt(-@as(c_int, 127)), @floatFromInt(@as(c_int, 255) - @as(c_int, 127)), @floatFromInt(@as(Sint16, @truncate(~@as(c_int, 32767)))), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767)))))))));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, axis);
                axis = @truncate(if (@as(c_int, data[@as(c_int, 22)]) == @as(c_int, 127)) @as(c_int, 0) else @as(c_int, @as(Sint16, @intFromFloat(HIDAPI_RemapVal(@floatFromInt(@as(c_int, data[@as(c_int, 22)]) - @as(c_int, 127)), @floatFromInt(-@as(c_int, 127)), @floatFromInt(@as(c_int, 255) - @as(c_int, 127)), @floatFromInt(@as(Sint16, @truncate(~@as(c_int, 32767)))), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767)))))))));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, axis);
                axis = @truncate((@as(c_int, data[@as(c_int, 23)]) * @as(c_int, 257)) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFT_TRIGGER, axis);
                axis = @truncate((@as(c_int, data[@as(c_int, 24)]) * @as(c_int, 257)) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHT_TRIGGER, axis);
                if (ctx.*.sensors_enabled) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            26 => {
                sensor_timestamp = ctx.*.sensor_timestamp_ns;
                ctx.*.sensor_timestamp_ns +%= ctx.*.sensor_timestamp_step_ns;
                flPitchAndYawScale = @as(f32, 72000.0) * (SDL_PI_F / @as(f32, 180.0));
                flRollScale = @as(f32, 1200.0) * (SDL_PI_F / @as(f32, 180.0));
                values[@as(c_int, 0)] = HIDAPI_RemapVal(-@as(f32, 1.0) * @as(f32, @floatFromInt(@as(c_int, @as(Sint16, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 26)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 27)])) << @intCast(@as(c_int, 8)))))))), @floatFromInt(-@as(c_int, 32767) - @as(c_int, 1)), @floatFromInt(@as(c_int, 32767)), -flPitchAndYawScale, flPitchAndYawScale);
                values[@as(c_int, 1)] = HIDAPI_RemapVal(-@as(f32, 1.0) * @as(f32, @floatFromInt(@as(c_int, @as(Sint16, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 18)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 20)])) << @intCast(@as(c_int, 8)))))))), @floatFromInt(-@as(c_int, 32767) - @as(c_int, 1)), @floatFromInt(@as(c_int, 32767)), -flPitchAndYawScale, flPitchAndYawScale);
                values[@as(c_int, 2)] = HIDAPI_RemapVal(-@as(f32, 1.0) * @as(f32, @floatFromInt(@as(c_int, @as(Sint16, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 29)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 30)])) << @intCast(@as(c_int, 8)))))))), @floatFromInt(-@as(c_int, 32767) - @as(c_int, 1)), @floatFromInt(@as(c_int, 32767)), -flRollScale, flRollScale);
                SDL_SendJoystickSensor(timestamp, joystick, SDL_SENSOR_GYRO, sensor_timestamp, @ptrCast(@alignCast(&values)), 3);
                flAccelScale = ctx.*.accelScale;
                values[@as(c_int, 0)] = @as(f32, @floatFromInt(-@as(c_int, @as(Sint16, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 11)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 12)])) << @intCast(@as(c_int, 8)))))))) * flAccelScale;
                values[@as(c_int, 1)] = @as(f32, @floatFromInt(@as(c_int, @as(Sint16, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 15)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 16)])) << @intCast(@as(c_int, 8)))))))) * flAccelScale;
                values[@as(c_int, 2)] = @as(f32, @floatFromInt(@as(c_int, @as(Sint16, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 13)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 14)])) << @intCast(@as(c_int, 8)))))))) * flAccelScale;
                SDL_SendJoystickSensor(timestamp, joystick, SDL_SENSOR_ACCEL, sensor_timestamp, @ptrCast(@alignCast(&values)), 3);
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
                _ = memcpy(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.last_state))))), @ptrCast(@alignCast(data)), if (@as(c_ulong, @bitCast(@as(c_long, size))) < @sizeOf(@TypeOf(ctx.*.last_state))) @as(c_ulong, @bitCast(@as(c_long, size))) else @sizeOf(@TypeOf(ctx.*.last_state)));
                {}
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverFlydigi_HandlePacketV1(joystick: [*c]SDL_Joystick, ctx: [*c]SDL_DriverFlydigi_Context, data: [*c]Uint8, size: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if ((@as(c_int, data[@as(c_int, 0)]) != @as(c_int, 4)) or (@as(c_int, data[@as(c_int, 1)]) != @as(c_int, 254))) {
        return;
    }
    if (joystick != null) {
        HIDAPI_DriverFlydigi_HandleStatePacketV1(joystick, ctx, data, size);
    }
}
pub fn HIDAPI_DriverFlydigi_HandleStatePacketV2(joystick: [*c]SDL_Joystick, ctx: [*c]SDL_DriverFlydigi_Context, data: [*c]Uint8, size: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var axis: Sint16 = undefined;
    _ = &axis;
    var timestamp: Uint64 = undefined;
    _ = &timestamp;
    var extra_button_index: Uint8 = undefined;
    _ = &extra_button_index;
    var hat: Uint8 = undefined;
    _ = &hat;
    var sensor_timestamp: Uint64 = undefined;
    _ = &sensor_timestamp;
    var values: [3]f32 = undefined;
    _ = &values;
    var flGyroScale: f32 = undefined;
    _ = &flGyroScale;
    var flAccelScale: f32 = undefined;
    _ = &flAccelScale;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                timestamp = SDL_GetTicksNS_REAL();
                extra_button_index = SDL_GAMEPAD_NUM_BASE_FLYDIGI_BUTTONS;
                if (@as(c_int, ctx.*.last_state[@as(c_int, 11)]) != @as(c_int, data[@as(c_int, 11)])) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                switch (@as(c_int, data[@as(c_int, 11)]) & @as(c_int, 15)) {
                    @as(c_int, 1) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(c_int, @as(c_uint, 2) | @as(c_uint, 1)) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(c_int, @as(c_uint, 2) | @as(c_uint, 4)) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(c_int, @as(c_uint, 8) | @as(c_uint, 4)) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(c_int, 8) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(c_int, @as(c_uint, 8) | @as(c_uint, 1)) => {
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
                if (@as(c_int, ctx.*.last_state[@as(c_int, 12)]) != @as(c_int, data[@as(c_int, 12)])) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            4 => {
                SDL_SendJoystickHat(timestamp, joystick, 0, hat);
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SOUTH, (@as(c_int, data[@as(c_int, 11)]) & @as(c_int, 16)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_EAST, (@as(c_int, data[@as(c_int, 11)]) & @as(c_int, 32)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_BACK, (@as(c_int, data[@as(c_int, 11)]) & @as(c_int, 64)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_WEST, (@as(c_int, data[@as(c_int, 11)]) & @as(c_int, 128)) != @as(c_int, 0));
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
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_NORTH, (@as(c_int, data[@as(c_int, 12)]) & @as(c_int, 1)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_START, (@as(c_int, data[@as(c_int, 12)]) & @as(c_int, 2)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_SHOULDER, (@as(c_int, data[@as(c_int, 12)]) & @as(c_int, 4)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER, (@as(c_int, data[@as(c_int, 12)]) & @as(c_int, 8)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_STICK, (@as(c_int, data[@as(c_int, 12)]) & @as(c_int, 64)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_STICK, (@as(c_int, data[@as(c_int, 12)]) & @as(c_int, 128)) != @as(c_int, 0));
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
                if (@as(c_int, ctx.*.last_state[@as(c_int, 13)]) != @as(c_int, data[@as(c_int, 13)])) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            17 => {
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_FLYDIGI_M1, (@as(c_int, data[@as(c_int, 13)]) & @as(c_int, 4)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_FLYDIGI_M2, (@as(c_int, data[@as(c_int, 13)]) & @as(c_int, 8)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_FLYDIGI_M3, (@as(c_int, data[@as(c_int, 13)]) & @as(c_int, 16)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_FLYDIGI_M4, (@as(c_int, data[@as(c_int, 13)]) & @as(c_int, 32)) != @as(c_int, 0));
                if (ctx.*.has_cz) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            18 => {
                if (ctx.*.has_cz) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            19 => {
                if (@as(c_int, ctx.*.last_state[@as(c_int, 14)]) != @as(c_int, data[@as(c_int, 14)])) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            20 => {
                SDL_SendJoystickButton(timestamp, joystick, blk: {
                    const ref = &extra_button_index;
                    const tmp = ref.*;
                    ref.* +%= 1;
                    break :blk tmp;
                }, (@as(c_int, data[@as(c_int, 13)]) & @as(c_int, 1)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, blk: {
                    const ref = &extra_button_index;
                    const tmp = ref.*;
                    ref.* +%= 1;
                    break :blk tmp;
                }, (@as(c_int, data[@as(c_int, 13)]) & @as(c_int, 2)) != @as(c_int, 0));
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
                if (ctx.*.has_lmrm) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                SDL_SendJoystickButton(timestamp, joystick, blk: {
                    const ref = &extra_button_index;
                    const tmp = ref.*;
                    ref.* +%= 1;
                    break :blk tmp;
                }, (@as(c_int, data[@as(c_int, 13)]) & @as(c_int, 64)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, blk: {
                    const ref = &extra_button_index;
                    const tmp = ref.*;
                    ref.* +%= 1;
                    break :blk tmp;
                }, (@as(c_int, data[@as(c_int, 13)]) & @as(c_int, 128)) != @as(c_int, 0));
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
                {
                    const ref = &extra_button_index;
                    ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) + @as(c_int, 2))));
                }
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
                if (ctx.*.has_lmrm) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            29 => {
                {
                    const ref = &extra_button_index;
                    ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) + @as(c_int, 2))));
                }
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
                    sdl_pc = 19;
                    continue;
                }
            },
            32 => {
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_GUIDE, (@as(c_int, data[@as(c_int, 14)]) & @as(c_int, 8)) != @as(c_int, 0));
                if (ctx.*.has_circle) {
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
                axis = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 3)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 4)])) << @intCast(@as(c_int, 8))));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, axis);
                axis = @truncate(-@as(c_int, @as(Sint16, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 5)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 6)])) << @intCast(@as(c_int, 8)))))));
                if (@as(c_int, axis) <= -@as(c_int, 32768)) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
                    continue;
                }
            },
            35 => {
                SDL_SendJoystickButton(timestamp, joystick, blk: {
                    const ref = &extra_button_index;
                    const tmp = ref.*;
                    ref.* +%= 1;
                    break :blk tmp;
                }, (@as(c_int, data[@as(c_int, 14)]) & @as(c_int, 1)) != @as(c_int, 0));
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
                axis = 32767;
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
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, axis);
                axis = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 7)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 8)])) << @intCast(@as(c_int, 8))));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, axis);
                axis = @truncate(-@as(c_int, @as(Sint16, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 9)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 10)])) << @intCast(@as(c_int, 8)))))));
                if (@as(c_int, axis) <= -@as(c_int, 32768)) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            41 => {
                axis = 32767;
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
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, axis);
                axis = @truncate((@as(c_int, data[@as(c_int, 15)]) * @as(c_int, 257)) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFT_TRIGGER, axis);
                axis = @truncate((@as(c_int, data[@as(c_int, 16)]) * @as(c_int, 257)) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHT_TRIGGER, axis);
                if (ctx.*.sensors_enabled) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            44 => {
                sensor_timestamp = ctx.*.sensor_timestamp_ns;
                ctx.*.sensor_timestamp_ns +%= ctx.*.sensor_timestamp_step_ns;
                flGyroScale = ctx.*.gyroScale;
                values[@as(c_int, 0)] = HIDAPI_RemapVal(@floatFromInt(@as(Sint16, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 17)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 18)])) << @intCast(@as(c_int, 8)))))), @floatFromInt(-@as(c_int, 32767) - @as(c_int, 1)), @floatFromInt(@as(c_int, 32767)), -flGyroScale, flGyroScale);
                values[@as(c_int, 1)] = HIDAPI_RemapVal(@floatFromInt(@as(Sint16, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 21)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 22)])) << @intCast(@as(c_int, 8)))))), @floatFromInt(-@as(c_int, 32767) - @as(c_int, 1)), @floatFromInt(@as(c_int, 32767)), -flGyroScale, flGyroScale);
                values[@as(c_int, 2)] = HIDAPI_RemapVal(-@as(f32, @floatFromInt(@as(Sint16, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 19)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 20)])) << @intCast(@as(c_int, 8))))))), @floatFromInt(-@as(c_int, 32767) - @as(c_int, 1)), @floatFromInt(@as(c_int, 32767)), -flGyroScale, flGyroScale);
                SDL_SendJoystickSensor(timestamp, joystick, SDL_SENSOR_GYRO, sensor_timestamp, @ptrCast(@alignCast(&values)), 3);
                flAccelScale = ctx.*.accelScale;
                values[@as(c_int, 0)] = @as(f32, @floatFromInt(@as(c_int, @as(Sint16, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 23)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 24)])) << @intCast(@as(c_int, 8)))))))) * flAccelScale;
                values[@as(c_int, 1)] = @as(f32, @floatFromInt(@as(c_int, @as(Sint16, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 27)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 28)])) << @intCast(@as(c_int, 8)))))))) * flAccelScale;
                values[@as(c_int, 2)] = @as(f32, @floatFromInt(-@as(c_int, @as(Sint16, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 25)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 26)])) << @intCast(@as(c_int, 8)))))))) * flAccelScale;
                SDL_SendJoystickSensor(timestamp, joystick, SDL_SENSOR_ACCEL, sensor_timestamp, @ptrCast(@alignCast(&values)), 3);
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
                _ = memcpy(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.last_state))))), @ptrCast(@alignCast(data)), if (@as(c_ulong, @bitCast(@as(c_long, size))) < @sizeOf(@TypeOf(ctx.*.last_state))) @as(c_ulong, @bitCast(@as(c_long, size))) else @sizeOf(@TypeOf(ctx.*.last_state)));
                {}
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverFlydigi_HandleStatusUpdate(device: [*c]SDL_HIDAPI_Device, _: [*c]Uint8, _: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = SDL_HIDAPI_Flydigi_SendStatusRequest(device);
}
pub fn HIDAPI_DriverFlydigi_HandlePacketV2(joystick: [*c]SDL_Joystick, ctx: [*c]SDL_DriverFlydigi_Context, arg_data: [*c]Uint8, arg_size: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var data = arg_data;
    _ = &data;
    var size = arg_size;
    _ = &size;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if ((size > @as(c_int, 0)) and (@as(c_int, data[@as(c_int, 0)]) != @as(c_int, 90))) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                data += 1;
                size -= 1;
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
                if (((size < @as(c_int, 31)) or (@as(c_int, data[@as(c_int, 0)]) != FLYDIGI_V2_MAGIC1)) or (@as(c_int, data[@as(c_int, 1)]) != FLYDIGI_V2_MAGIC2)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                return;
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                switch (@as(c_int, data[@as(c_int, 2)])) {
                    FLYDIGI_V2_GET_INFO_COMMAND => {
                        sdl_pc = 8;
                        continue;
                    },
                    FLYDIGI_V2_SET_STATUS_COMMAND => {
                        sdl_pc = 12;
                        continue;
                    },
                    FLYDIGI_V2_GET_STATUS_COMMAND => {
                        sdl_pc = 13;
                        continue;
                    },
                    FLYDIGI_V2_ACQUIRE_CONTROLLER_COMMAND => {
                        sdl_pc = 14;
                        continue;
                    },
                    FLYDIGI_V2_INPUT_REPORT => {
                        sdl_pc = 15;
                        continue;
                    },
                    else => {
                        sdl_pc = 19;
                        continue;
                    },
                }
            },
            7 => {
                {}
            },
            8 => {
                if (joystick != null) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
            },
            9 => {
                HIDAPI_DriverFlydigi_HandleInfoResponse(joystick, ctx, data, size);
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
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            12 => {
                HIDAPI_DriverFlydigi_HandleStatusUpdate(ctx.*.device, data, size);
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            13 => {
                HIDAPI_DriverFlydigi_HandleStatusResponse(ctx.*.device, data, size);
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            14 => {
                HIDAPI_DriverFlydigi_HandleAcquireResponse(ctx.*.device, data, size);
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            15 => {
                if (joystick != null) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            16 => {
                HIDAPI_DriverFlydigi_HandleStatePacketV2(joystick, ctx, data, size);
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
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            19 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverFlydigi_UpdateDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverFlydigi_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    var joystick: [*c]SDL_Joystick = null;
    _ = &joystick;
    var data: [64]Uint8 = undefined;
    _ = &data;
    var size: c_int = 0;
    _ = &size;
    var now: Uint64 = SDL_GetTicks_REAL();
    _ = &now;
    if (device.*.num_joysticks > @as(c_int, 0)) {
        joystick = SDL_GetJoystickFromID_REAL(device.*.joysticks[@as(c_int, 0)]);
    }
    if ((@as(c_int, device.*.vendor_id) == USB_VENDOR_FLYDIGI_V2) and (joystick != null)) {
        if (!(ctx.*.next_heartbeat != 0) or (now >= ctx.*.next_heartbeat)) {
            _ = SDL_HIDAPI_Flydigi_SendAcquireRequest(device, @"true" != 0);
            _ = SDL_HIDAPI_Flydigi_SendInfoRequest(device);
            ctx.*.next_heartbeat = now +% @as(Uint64, @bitCast(@as(c_long, @as(c_int, 1000) * @as(c_int, 30))));
        }
    }
    while ((blk: {
        const tmp = SDL_hid_read_timeout_REAL(device.*.dev, @ptrCast(@alignCast(&data)), @sizeOf(@TypeOf(data)), 0);
        size = tmp;
        break :blk tmp;
    }) > @as(c_int, 0)) {
        ctx.*.last_packet = now;
        if (@as(c_int, device.*.vendor_id) == USB_VENDOR_FLYDIGI_V1) {
            HIDAPI_DriverFlydigi_HandlePacketV1(joystick, ctx, @ptrCast(@alignCast(&data)), size);
        } else {
            HIDAPI_DriverFlydigi_HandlePacketV2(joystick, ctx, @ptrCast(@alignCast(&data)), size);
        }
    }
    if (@as(c_int, device.*.vendor_id) == USB_VENDOR_FLYDIGI_V2) {
        const INPUT_TIMEOUT_MS: c_int = 100;
        _ = &INPUT_TIMEOUT_MS;
        if (now >= (ctx.*.last_packet +% @as(Uint64, @bitCast(@as(c_long, INPUT_TIMEOUT_MS))))) {
            ctx.*.next_heartbeat = now;
        }
    }
    if ((size < @as(c_int, 0)) and (device.*.num_joysticks > @as(c_int, 0))) {
        HIDAPI_JoystickDisconnected(device, device.*.joysticks[@as(c_int, 0)]);
    }
    return size >= @as(c_int, 0);
}
pub fn HIDAPI_DriverFlydigi_CloseJoystick(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn HIDAPI_DriverFlydigi_FreeDevice(_: [*c]SDL_HIDAPI_Device) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub export var SDL_HIDAPI_DriverFlydigi: SDL_HIDAPI_DeviceDriver = SDL_HIDAPI_DeviceDriver{
    .name = "SDL_JOYSTICK_HIDAPI_FLYDIGI",
    .enabled = @"true" != 0,
    .RegisterHints = HIDAPI_DriverFlydigi_RegisterHints,
    .UnregisterHints = HIDAPI_DriverFlydigi_UnregisterHints,
    .IsEnabled = HIDAPI_DriverFlydigi_IsEnabled,
    .IsSupportedDevice = HIDAPI_DriverFlydigi_IsSupportedDevice,
    .InitDevice = HIDAPI_DriverFlydigi_InitDevice,
    .GetDevicePlayerIndex = HIDAPI_DriverFlydigi_GetDevicePlayerIndex,
    .SetDevicePlayerIndex = HIDAPI_DriverFlydigi_SetDevicePlayerIndex,
    .UpdateDevice = HIDAPI_DriverFlydigi_UpdateDevice,
    .OpenJoystick = HIDAPI_DriverFlydigi_OpenJoystick,
    .RumbleJoystick = HIDAPI_DriverFlydigi_RumbleJoystick,
    .RumbleJoystickTriggers = HIDAPI_DriverFlydigi_RumbleJoystickTriggers,
    .GetJoystickCapabilities = HIDAPI_DriverFlydigi_GetJoystickCapabilities,
    .SetJoystickLED = HIDAPI_DriverFlydigi_SetJoystickLED,
    .SendJoystickEffect = HIDAPI_DriverFlydigi_SendJoystickEffect,
    .SetJoystickSensorsEnabled = HIDAPI_DriverFlydigi_SetJoystickSensorsEnabled,
    .CloseJoystick = HIDAPI_DriverFlydigi_CloseJoystick,
    .FreeDevice = HIDAPI_DriverFlydigi_FreeDevice,
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
pub const USB_VENDOR_FLYDIGI_V1 = @as(c_int, 0x04b4);
pub const USB_VENDOR_FLYDIGI_V2 = @as(c_int, 0x37d7);
pub const USB_PRODUCT_FLYDIGI_V2_APEX = @as(c_int, 0x2501);
pub const USB_PRODUCT_FLYDIGI_V2_APEX6 = @as(c_int, 0x2502);
pub const USB_PRODUCT_FLYDIGI_V2_VADER = @as(c_int, 0x2401);
pub const SDL_JOYSTICK_CAP_RUMBLE = @as(c_int, 0x00000010);
pub const USB_PACKET_LENGTH = @as(c_int, 64);
pub const SENSOR_INTERVAL_VADER4_PRO_DONGLE_RATE_HZ = @as(c_int, 1000);
pub const SENSOR_INTERVAL_VADER4_PRO_WIRED_RATE_HZ = @as(c_int, 500);
pub const SENSOR_INTERVAL_VADER5_PRO_RATE_HZ = @as(c_int, 500);
pub const SENSOR_INTERVAL_APEX5_DONGLE_RATE_HZ = @as(c_int, 295);
pub const SENSOR_INTERVAL_APEX5_WIRED_RATE_HZ = @as(c_int, 970);
pub const FLYDIGI_V1_CMD_REPORT_ID = @as(c_int, 0x05);
pub const FLYDIGI_V1_HAPTIC_COMMAND = @as(c_int, 0x0F);
pub const FLYDIGI_V1_GET_INFO_COMMAND = @as(c_int, 0xEC);
pub const FLYDIGI_V2_CMD_REPORT_ID = @as(c_int, 0x03);
pub const FLYDIGI_V2_MAGIC1 = @as(c_int, 0x5A);
pub const FLYDIGI_V2_MAGIC2 = @as(c_int, 0xA5);
pub const FLYDIGI_V2_GET_INFO_COMMAND = @as(c_int, 0x01);
pub const FLYDIGI_V2_CHECK_ARCHITECTURE_COMMAND = @as(c_int, 0x07);
pub const FLYDIGI_V2_GET_STATUS_COMMAND = @as(c_int, 0x10);
pub const FLYDIGI_V2_SET_STATUS_COMMAND = @as(c_int, 0x11);
pub const FLYDIGI_V2_HAPTIC_COMMAND = @as(c_int, 0x12);
pub const FLYDIGI_V2_ACQUIRE_CONTROLLER_COMMAND = @as(c_int, 0x1C);
pub const FLYDIGI_V2_INPUT_REPORT = @as(c_int, 0xEF);
