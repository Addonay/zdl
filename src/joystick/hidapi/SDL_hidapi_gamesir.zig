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
pub const wchar_t = c_int;
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Sint16 = i16;
pub const Uint16 = u16;
pub const Uint32 = u32;
pub const Uint64 = u64;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
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
pub const enum_SDL_hid_bus_type = c_uint;
pub const SDL_hid_bus_type = enum_SDL_hid_bus_type;
pub const struct_SDL_hid_device_info = extern struct {
    path: [*c]u8 = null,
    vendor_id: c_ushort = 0,
    product_id: c_ushort = 0,
    serial_number: [*c]wchar_t = null,
    release_number: c_ushort = 0,
    manufacturer_string: [*c]wchar_t = null,
    product_string: [*c]wchar_t = null,
    usage_page: c_ushort = 0,
    usage: c_ushort = 0,
    interface_number: c_int = 0,
    interface_class: c_int = 0,
    interface_subclass: c_int = 0,
    interface_protocol: c_int = 0,
    bus_type: SDL_hid_bus_type = @import("std").mem.zeroes(SDL_hid_bus_type),
    next: [*c]struct_SDL_hid_device_info = null,
};
pub const SDL_hid_device_info = struct_SDL_hid_device_info;
pub extern fn SDL_hid_enumerate_REAL(vendor_id: c_ushort, product_id: c_ushort) [*c]SDL_hid_device_info;
pub extern fn SDL_hid_free_enumeration_REAL(devs: [*c]SDL_hid_device_info) void;
pub extern fn SDL_hid_open_path_REAL(path: [*c]const u8) ?*SDL_hid_device;
pub extern fn SDL_hid_write_REAL(dev: ?*SDL_hid_device, data: [*c]const u8, length: usize) c_int;
pub extern fn SDL_hid_read_timeout_REAL(dev: ?*SDL_hid_device, data: [*c]u8, length: usize, milliseconds: c_int) c_int;
pub extern fn SDL_hid_close_REAL(dev: ?*SDL_hid_device) c_int;
pub extern fn SDL_GetHintBoolean_REAL(name: [*c]const u8, default_value: bool) bool;
pub const SDL_HintCallback = ?*const fn (userdata: ?*anyopaque, name: [*c]const u8, oldValue: [*c]const u8, newValue: [*c]const u8) callconv(.c) void;
pub extern fn SDL_AddHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) bool;
pub extern fn SDL_RemoveHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) void;
pub const SDL_LOG_CATEGORY_INPUT: c_int = 7;
pub extern fn SDL_LogDebug_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_GetTicksNS_REAL() Uint64;
pub extern fn SDL_Delay_REAL(ms: Uint32) void;
pub extern fn SDL_AssertJoysticksLocked() void;
pub extern fn SDL_IsJoystickGameSirController(vendor_id: Uint16, product_id: Uint16) bool;
pub extern fn SDL_PrivateJoystickAddSensor(joystick: [*c]SDL_Joystick, @"type": SDL_SensorType, rate: f32) void;
pub extern fn SDL_SendJoystickAxis(timestamp: Uint64, joystick: [*c]SDL_Joystick, axis: Uint8, value: Sint16) void;
pub extern fn SDL_SendJoystickHat(timestamp: Uint64, joystick: [*c]SDL_Joystick, hat: Uint8, value: Uint8) void;
pub extern fn SDL_SendJoystickButton(timestamp: Uint64, joystick: [*c]SDL_Joystick, button: Uint8, down: bool) void;
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
pub extern fn HIDAPI_RemapVal(val: f32, val_min: f32, val_max: f32, output_min: f32, output_max: f32) f32;
pub const SDL_GAMEPAD_BUTTON_GAMESIR_SHARE: c_int = 11;
pub const SDL_GAMEPAD_BUTTON_GAMESIR_L4: c_int = 12;
pub const SDL_GAMEPAD_BUTTON_GAMESIR_R4: c_int = 13;
pub const SDL_GAMEPAD_BUTTON_GAMESIR_L5: c_int = 14;
pub const SDL_GAMEPAD_BUTTON_GAMESIR_R5: c_int = 15;
pub const SDL_GAMEPAD_BUTTON_GAMESIR_L6: c_int = 16;
pub const SDL_GAMEPAD_BUTTON_GAMESIR_R6: c_int = 17;
pub const SDL_GAMEPAD_BUTTON_GAMESIR_L7: c_int = 18;
pub const SDL_GAMEPAD_BUTTON_GAMESIR_R7: c_int = 19;
pub const SDL_GAMEPAD_BUTTON_GAMESIR_L8: c_int = 20;
pub const Gamesir_CommandMode = extern struct {
    cmd: Uint8 = 0,
    mode: Uint8 = 0,
};
pub const SDL_DriverGamesir_Context = extern struct {
    sensors_supported: bool = false,
    sensors_enabled: bool = false,
    led_supported: bool = false,
    sensor_timestamp_ns: Uint64 = 0,
    sensor_timestamp_step_ns: Uint64 = 0,
    accelScale: f32 = 0,
    gyroScale: f32 = 0,
    last_state_initialized: bool = false,
    last_state: [64]Uint8 = @import("std").mem.zeroes([64]Uint8),
    output_handle: ?*SDL_hid_device = null,
};
pub fn HIDAPI_DriverGameSir_RegisterHints(callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = SDL_AddHintCallback_REAL("SDL_JOYSTICK_HIDAPI_GAMESIR", callback, userdata);
}
pub fn HIDAPI_DriverGameSir_UnregisterHints(callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_RemoveHintCallback_REAL("SDL_JOYSTICK_HIDAPI_GAMESIR", callback, userdata);
}
pub fn HIDAPI_DriverGameSir_IsEnabled() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI_GAMESIR", SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI", @"true" != 0));
}
pub fn HIDAPI_DriverGameSir_IsSupportedDevice(device: [*c]SDL_HIDAPI_Device, _: [*c]const u8, arg_type: SDL_GamepadType, vendor_id: Uint16, product_id: Uint16, _: Uint16, _: c_int, _: c_int, _: c_int, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    if ((((@as(c_int, vendor_id) == USB_VENDOR_GAMESIR) and (@as(c_int, product_id) == USB_PRODUCT_GAMESIR_GAMEPAD_TARANTULA_8K)) and (device != null)) and (@as(c_int, device.*.version) <= @as(c_int, 553))) {
        return @"false" != 0;
    }
    return SDL_IsJoystickGameSirController(vendor_id, product_id);
}
pub fn HIDAPI_DriverGameSir_GetOutputHandle(device: [*c]SDL_HIDAPI_Device) callconv(.c) ?*SDL_hid_device {
    @setEvalBranchQuota(100000);
    return device.*.dev;
}
pub fn HIDAPI_DriverGameSir_GetInputHandle(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_DriverGamesir_Context) callconv(.c) ?*SDL_hid_device {
    @setEvalBranchQuota(100000);
    return device.*.dev;
}
pub fn SendGameSirModeSwitch(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var cmd: Gamesir_CommandMode = Gamesir_CommandMode{
        .cmd = 1,
        .mode = 0,
    };
    _ = &cmd;
    var buf: [64]Uint8 = undefined;
    _ = &buf;
    _ = memset(@ptrCast(@alignCast(&buf)), 0, @sizeOf(@TypeOf(buf)));
    buf[@as(c_int, 0)] = 162;
    _ = memcpy(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&buf))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1))))))), @ptrCast(@alignCast(&cmd)), @sizeOf(@TypeOf(cmd)));
    var handle: ?*SDL_hid_device = HIDAPI_DriverGameSir_GetOutputHandle(device);
    _ = &handle;
    if (@as(?*anyopaque, @ptrCast(@alignCast(handle))) == @as(?*anyopaque, null)) {
        return @"false" != 0;
    }
    {
        var attempt: c_int = 0;
        _ = &attempt;
        while (attempt < @as(c_int, 3)) : (attempt += 1) {
            var result: c_int = SDL_hid_write_REAL(handle, @ptrCast(@alignCast(&buf)), @sizeOf(@TypeOf(buf)));
            _ = &result;
            if (result >= @as(c_int, 0)) {
                return @"true" != 0;
            }
            SDL_Delay_REAL(1);
        }
    }
    return @"false" != 0;
}
pub fn GetOutputHandle(device: [*c]SDL_HIDAPI_Device) callconv(.c) ?*SDL_hid_device {
    @setEvalBranchQuota(100000);
    var vendor_id: Uint16 = device.*.vendor_id;
    _ = &vendor_id;
    var product_id: Uint16 = device.*.product_id;
    _ = &product_id;
    var output_handle: ?*SDL_hid_device = null;
    _ = &output_handle;
    var devs: [*c]struct_SDL_hid_device_info = SDL_hid_enumerate_REAL(vendor_id, product_id);
    _ = &devs;
    {
        var info: [*c]struct_SDL_hid_device_info = devs;
        _ = &info;
        while ((info != null) and !(output_handle != null)) : (info = info.*.next) {
            if (info.*.interface_number == @as(c_int, 0)) {} else if (info.*.interface_number == -@as(c_int, 1)) {} else if (info.*.interface_number == @as(c_int, 1)) {
                output_handle = SDL_hid_open_path_REAL(info.*.path);
            }
        }
    }
    SDL_hid_free_enumeration_REAL(devs);
    return output_handle;
}
pub fn HIDAPI_DriverGameSir_InitDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverGamesir_Context = undefined;
    _ = &ctx;
    var name: [*c]const u8 = undefined;
    _ = &name;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                ctx = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(ctx.*)))));
                name = "GameSir Controller";
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
                device.*.context = @ptrCast(@alignCast(ctx));
                ctx.*.led_supported = @"true" != 0;
                ctx.*.output_handle = GetOutputHandle(device);
                ctx.*.sensor_timestamp_step_ns = @bitCast(@as(c_long, @truncate(@divTrunc(SDL_NS_PER_SECOND, @as(c_longlong, GAMESIR_IMU_RATE_HZ_WIRED)))));
                switch (@as(c_int, device.*.product_id)) {
                    USB_PRODUCT_GAMESIR_GAMEPAD_G7_PRO_8K => {
                        sdl_pc = 5;
                        continue;
                    },
                    USB_PRODUCT_GAMESIR_GAMEPAD_TARANTULA_8K => {
                        sdl_pc = 6;
                        continue;
                    },
                    else => {
                        sdl_pc = 7;
                        continue;
                    },
                }
            },
            4 => {
                HIDAPI_SetDeviceName(device, name);
                switch (@as(c_int, device.*.product_id)) {
                    USB_PRODUCT_GAMESIR_GAMEPAD_G7_PRO_8K => {
                        sdl_pc = 9;
                        continue;
                    },
                    USB_PRODUCT_GAMESIR_GAMEPAD_TARANTULA_8K => {
                        sdl_pc = 10;
                        continue;
                    },
                    else => {
                        sdl_pc = 14;
                        continue;
                    },
                }
            },
            5 => {
                name = "GameSir-G7 Pro 8K";
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            6 => {
                name = "GameSir-Tarantula 8K";
                {
                    sdl_pc = 4;
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
                return HIDAPI_JoystickConnected(device, null);
            },
            9 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                if (device.*.is_bluetooth) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            12 => {
                ctx.*.sensors_supported = @"true" != 0;
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                ctx.*.led_supported = @"false" != 0;
                SDL_LogDebug_REAL(SDL_LOG_CATEGORY_INPUT, "GameSir: Device detected - %s (PID 0x%04X)", device.*.name, device.*.product_id);
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            14 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverGameSir_GetDevicePlayerIndex(_: [*c]SDL_HIDAPI_Device, _: SDL_JoystickID) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return -@as(c_int, 1);
}
pub fn HIDAPI_DriverGameSir_SetDevicePlayerIndex(_: [*c]SDL_HIDAPI_Device, _: SDL_JoystickID, _: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn HIDAPI_DriverGameSir_GetJoystickButtonCount(device: [*c]SDL_HIDAPI_Device) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    if (device.*.is_bluetooth) {
        return 11;
    }
    if ((device.*.name != null) and (SDL_strcmp_REAL(device.*.name, "GameSir-Tarantula 8K") == @as(c_int, 0))) {
        return SDL_GAMEPAD_BUTTON_GAMESIR_L8 + @as(c_int, 1);
    }
    return SDL_GAMEPAD_BUTTON_GAMESIR_R5 + @as(c_int, 1);
}
pub fn HIDAPI_DriverGameSir_OpenJoystick(device: [*c]SDL_HIDAPI_Device, joystick: [*c]SDL_Joystick) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverGamesir_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    SDL_AssertJoysticksLocked();
    if (!(ctx != null)) {
        return @"false" != 0;
    }
    _ = memset(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.last_state))))), 0, @sizeOf(@TypeOf(ctx.*.last_state)));
    ctx.*.last_state_initialized = @"false" != 0;
    if (!SendGameSirModeSwitch(device)) {
        SDL_LogDebug_REAL(SDL_LOG_CATEGORY_INPUT, "GameSir: failed to send SDL mode switch command (0xA2, 0x01)");
    }
    joystick.*.nbuttons = HIDAPI_DriverGameSir_GetJoystickButtonCount(device);
    joystick.*.naxes = SDL_GAMEPAD_AXIS_COUNT;
    joystick.*.nhats = 1;
    if (ctx.*.sensors_supported) {
        ctx.*.sensor_timestamp_ns = SDL_GetTicksNS_REAL();
        ctx.*.accelScale = (@as(f32, 4.0) * SDL_STANDARD_GRAVITY) / @as(f32, 32768.0);
        const gyro_numerator: f32 = 1.0;
        _ = &gyro_numerator;
        const gyro_denominator: f32 = 16.0;
        _ = &gyro_denominator;
        ctx.*.gyroScale = (gyro_numerator / gyro_denominator) * (SDL_PI_F / @as(f32, 180.0));
        const flSensorRate: f32 = @floatFromInt(GAMESIR_IMU_RATE_HZ_WIRED);
        _ = &flSensorRate;
        SDL_PrivateJoystickAddSensor(joystick, SDL_SENSOR_GYRO, flSensorRate);
        SDL_PrivateJoystickAddSensor(joystick, SDL_SENSOR_ACCEL, flSensorRate);
    }
    return @"true" != 0;
}
pub fn HIDAPI_DriverGameSir_RumbleJoystick(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, low_frequency_rumble: Uint16, high_frequency_rumble: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var buf: [64]Uint8 = undefined;
    _ = &buf;
    _ = memset(@ptrCast(@alignCast(&buf)), 0, @sizeOf(@TypeOf(buf)));
    buf[@as(c_int, 0)] = 162;
    buf[@as(c_int, 1)] = 3;
    buf[@as(c_int, 2)] = @bitCast(@as(i8, @truncate(@as(c_int, low_frequency_rumble) >> @intCast(@as(c_int, 8)))));
    buf[@as(c_int, 3)] = @bitCast(@as(i8, @truncate(@as(c_int, high_frequency_rumble) >> @intCast(@as(c_int, 8)))));
    var handle: ?*SDL_hid_device = HIDAPI_DriverGameSir_GetOutputHandle(device);
    _ = &handle;
    if (@as(?*anyopaque, @ptrCast(@alignCast(handle))) == @as(?*anyopaque, null)) {
        return @"false" != 0;
    }
    var result: c_int = SDL_hid_write_REAL(handle, @ptrCast(@alignCast(&buf)), @sizeOf(@TypeOf(buf)));
    _ = &result;
    if (result < @as(c_int, 0)) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn HIDAPI_DriverGameSir_RumbleJoystickTriggers(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: Uint16, _: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverGameSir_GetJoystickCapabilities(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverGamesir_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    var caps: Uint32 = SDL_JOYSTICK_CAP_RUMBLE;
    _ = &caps;
    if (ctx.*.led_supported) {
        caps |= SDL_JOYSTICK_CAP_RGB_LED;
    }
    return caps;
}
pub fn HIDAPI_DriverGameSir_SetJoystickLED(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, red: Uint8, green: Uint8, blue: Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverGamesir_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    if (!ctx.*.led_supported) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    var buf: [64]Uint8 = undefined;
    _ = &buf;
    _ = memset(@ptrCast(@alignCast(&buf)), 0, @sizeOf(@TypeOf(buf)));
    buf[@as(c_int, 0)] = 162;
    buf[@as(c_int, 1)] = 4;
    buf[@as(c_int, 2)] = 1;
    buf[@as(c_int, 3)] = 1;
    buf[@as(c_int, 4)] = red;
    buf[@as(c_int, 5)] = green;
    buf[@as(c_int, 6)] = blue;
    var handle: ?*SDL_hid_device = HIDAPI_DriverGameSir_GetOutputHandle(device);
    _ = &handle;
    if (@as(?*anyopaque, @ptrCast(@alignCast(handle))) == @as(?*anyopaque, null)) {
        return @"false" != 0;
    }
    var result: c_int = SDL_hid_write_REAL(handle, @ptrCast(@alignCast(&buf)), @sizeOf(@TypeOf(buf)));
    _ = &result;
    if (result < @as(c_int, 0)) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn HIDAPI_DriverGameSir_SendJoystickEffect(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: ?*const anyopaque, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverGameSir_SetJoystickSensorsEnabled(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, enabled: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverGamesir_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    if (ctx.*.sensors_supported) {
        ctx.*.sensors_enabled = enabled;
        if (enabled) {
            ctx.*.sensor_timestamp_ns = SDL_GetTicksNS_REAL();
        }
        return @"true" != 0;
    }
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverGameSir_HandleStatePacket(joystick: [*c]SDL_Joystick, ctx: [*c]SDL_DriverGamesir_Context, data: [*c]Uint8, arg_size: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var size = arg_size;
    _ = &size;
    var axis: Sint16 = undefined;
    _ = &axis;
    var timestamp: Uint64 = undefined;
    _ = &timestamp;
    var last: [*c]const Uint8 = undefined;
    _ = &last;
    var is_initial_packet: bool = undefined;
    _ = &is_initial_packet;
    var min_payload_size: c_int = undefined;
    _ = &min_payload_size;
    var buttons: Uint8 = undefined;
    _ = &buttons;
    var buttons_1: Uint8 = undefined;
    _ = &buttons_1;
    var buttons_2: Uint8 = undefined;
    _ = &buttons_2;
    var hat: Uint8 = undefined;
    _ = &hat;
    var buttons_3: Uint8 = undefined;
    _ = &buttons_3;
    var raw_x_unsigned: Uint16 = undefined;
    _ = &raw_x_unsigned;
    var raw_y_unsigned: Uint16 = undefined;
    _ = &raw_y_unsigned;
    var raw_x: Sint16 = undefined;
    _ = &raw_x;
    var raw_y: Sint16 = undefined;
    _ = &raw_y;
    var left_x: Sint16 = undefined;
    _ = &left_x;
    var left_y: Sint16 = undefined;
    _ = &left_y;
    var last_raw_x_unsigned: Uint16 = undefined;
    _ = &last_raw_x_unsigned;
    var last_raw_y_unsigned: Uint16 = undefined;
    _ = &last_raw_y_unsigned;
    var last_raw_x: Sint16 = undefined;
    _ = &last_raw_x;
    var last_raw_y: Sint16 = undefined;
    _ = &last_raw_y;
    var raw_changed: bool = undefined;
    _ = &raw_changed;
    var raw_x_unsigned_4: Uint16 = undefined;
    _ = &raw_x_unsigned_4;
    var raw_y_unsigned_5: Uint16 = undefined;
    _ = &raw_y_unsigned_5;
    var raw_x_6: Sint16 = undefined;
    _ = &raw_x_6;
    var raw_y_7: Sint16 = undefined;
    _ = &raw_y_7;
    var right_x: Sint16 = undefined;
    _ = &right_x;
    var right_y: Sint16 = undefined;
    _ = &right_y;
    var last_raw_x_unsigned_8: Uint16 = undefined;
    _ = &last_raw_x_unsigned_8;
    var last_raw_y_unsigned_9: Uint16 = undefined;
    _ = &last_raw_y_unsigned_9;
    var last_raw_x_10: Sint16 = undefined;
    _ = &last_raw_x_10;
    var last_raw_y_11: Sint16 = undefined;
    _ = &last_raw_y_11;
    var raw_changed_12: bool = undefined;
    _ = &raw_changed_12;
    var sensor_timestamp: Uint64 = undefined;
    _ = &sensor_timestamp;
    var values: [3]f32 = undefined;
    _ = &values;
    var acc_x_unsigned: Uint16 = undefined;
    _ = &acc_x_unsigned;
    var acc_y_unsigned: Uint16 = undefined;
    _ = &acc_y_unsigned;
    var acc_z_unsigned: Uint16 = undefined;
    _ = &acc_z_unsigned;
    var acc_x: Sint16 = undefined;
    _ = &acc_x;
    var acc_y: Sint16 = undefined;
    _ = &acc_y;
    var acc_z: Sint16 = undefined;
    _ = &acc_z;
    var gyro_x_unsigned: Uint16 = undefined;
    _ = &gyro_x_unsigned;
    var gyro_y_unsigned: Uint16 = undefined;
    _ = &gyro_y_unsigned;
    var gyro_z_unsigned: Uint16 = undefined;
    _ = &gyro_z_unsigned;
    var gyro_x: Sint16 = undefined;
    _ = &gyro_x;
    var gyro_y: Sint16 = undefined;
    _ = &gyro_y;
    var gyro_z: Sint16 = undefined;
    _ = &gyro_z;
    var l_touchpad_x: Uint16 = undefined;
    _ = &l_touchpad_x;
    var l_touchpad_y: Uint16 = undefined;
    _ = &l_touchpad_y;
    var r_touchpad_x: Uint16 = undefined;
    _ = &r_touchpad_x;
    var r_touchpad_y: Uint16 = undefined;
    _ = &r_touchpad_y;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                timestamp = SDL_GetTicksNS_REAL();
                last = @ptrCast(@alignCast(&ctx.*.last_state));
                is_initial_packet = !ctx.*.last_state_initialized;
                min_payload_size = if (ctx.*.sensors_enabled) @as(c_int, 26) else @as(c_int, 14);
                if (size < min_payload_size) {
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
                if (@as(c_int, last[@as(c_int, 0)]) != @as(c_int, data[@as(c_int, 0)])) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                buttons = data[@as(c_int, 0)];
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SOUTH, (@as(c_int, buttons) & BTN_A) != 0);
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_EAST, (@as(c_int, buttons) & BTN_B) != 0);
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_WEST, (@as(c_int, buttons) & BTN_X) != 0);
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_NORTH, (@as(c_int, buttons) & BTN_Y) != 0);
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_SHOULDER, (@as(c_int, buttons) & BTN_L1) != 0);
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER, (@as(c_int, buttons) & BTN_R1) != 0);
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
                if (@as(c_int, last[@as(c_int, 1)]) != @as(c_int, data[@as(c_int, 1)])) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                buttons_1 = data[@as(c_int, 1)];
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_BACK, (@as(c_int, buttons_1) & BTN_SELECT) != 0);
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_START, (@as(c_int, buttons_1) & BTN_START) != 0);
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_GUIDE, (@as(c_int, buttons_1) & BTN_HOME) != 0);
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_STICK, (@as(c_int, buttons_1) & BTN_L3) != 0);
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_STICK, (@as(c_int, buttons_1) & BTN_R3) != 0);
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_GAMESIR_SHARE, (@as(c_int, buttons_1) & BTN_CAPTURE) != 0);
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
                if (@as(c_int, last[@as(c_int, 2)]) != @as(c_int, data[@as(c_int, 2)])) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                buttons_2 = data[@as(c_int, 2)];
                hat = SDL_HAT_CENTERED;
                switch (@as(c_int, buttons_2) & @as(c_int, 15)) {
                    BTN_UP_R => {
                        sdl_pc = 14;
                        continue;
                    },
                    BTN_UP_L => {
                        sdl_pc = 15;
                        continue;
                    },
                    BTN_DOWN_R => {
                        sdl_pc = 16;
                        continue;
                    },
                    BTN_DOWN_L => {
                        sdl_pc = 17;
                        continue;
                    },
                    BTN_UP => {
                        sdl_pc = 18;
                        continue;
                    },
                    BTN_DOWN => {
                        sdl_pc = 19;
                        continue;
                    },
                    BTN_LEFT => {
                        sdl_pc = 20;
                        continue;
                    },
                    BTN_RIGHT => {
                        sdl_pc = 21;
                        continue;
                    },
                    else => {
                        sdl_pc = 22;
                        continue;
                    },
                }
            },
            11 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                if (@as(c_int, last[@as(c_int, 3)]) != @as(c_int, data[@as(c_int, 3)])) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            13 => {
                SDL_SendJoystickHat(timestamp, joystick, 0, hat);
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_GAMESIR_L4, (@as(c_int, buttons_2) & BTN_L4) != 0);
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_GAMESIR_R4, (@as(c_int, buttons_2) & BTN_R4) != 0);
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            14 => {
                hat = @truncate(SDL_HAT_RIGHT | SDL_HAT_UP);
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            15 => {
                hat = @truncate(SDL_HAT_LEFT | SDL_HAT_UP);
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            16 => {
                hat = @truncate(SDL_HAT_RIGHT | SDL_HAT_DOWN);
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            17 => {
                hat = @truncate(SDL_HAT_LEFT | SDL_HAT_DOWN);
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            18 => {
                hat = SDL_HAT_UP;
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            19 => {
                hat = SDL_HAT_DOWN;
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
                hat = SDL_HAT_RIGHT;
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
                buttons_3 = data[@as(c_int, 3)];
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_GAMESIR_L5, (@as(c_int, buttons_3) & BTN_L5) != 0);
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_GAMESIR_R5, (@as(c_int, buttons_3) & BTN_R5) != 0);
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_GAMESIR_L6, (@as(c_int, buttons_3) & BTN_L6) != 0);
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_GAMESIR_R6, (@as(c_int, buttons_3) & BTN_R6) != 0);
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_GAMESIR_L7, (@as(c_int, buttons_3) & BTN_L7) != 0);
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_GAMESIR_R7, (@as(c_int, buttons_3) & BTN_R7) != 0);
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_GAMESIR_L8, (@as(c_int, buttons_3) & BTN_L8) != 0);
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
                if (is_initial_packet) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            26 => {
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, 0);
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, 0);
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, 0);
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, 0);
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            27 => {
                if (size >= @as(c_int, 8)) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            28 => {
                if ((ctx.*.sensors_enabled and !is_initial_packet) and (size >= @as(c_int, 26))) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            29 => {
                raw_x_unsigned = @bitCast(@as(c_short, @truncate((@as(c_int, @as(Uint16, data[@as(c_int, 4)])) << @intCast(@as(c_int, 8))) | @as(c_int, data[@as(c_int, 5)]))));
                raw_y_unsigned = @bitCast(@as(c_short, @truncate((@as(c_int, @as(Uint16, data[@as(c_int, 6)])) << @intCast(@as(c_int, 8))) | @as(c_int, data[@as(c_int, 7)]))));
                raw_x = @bitCast(@as(c_ushort, @truncate(raw_x_unsigned)));
                raw_y = @bitCast(@as(c_ushort, @truncate(raw_y_unsigned)));
                left_x = raw_x;
                left_y = @truncate(if (@as(c_int, raw_y) == @as(c_int, @as(Sint16, @truncate(~@as(c_int, 32767))))) @as(c_int, @as(Sint16, @truncate(@as(c_int, 32767)))) else -@as(c_int, raw_y));
                last_raw_x_unsigned = @bitCast(@as(c_short, @truncate((@as(c_int, @as(Uint16, last[@as(c_int, 4)])) << @intCast(@as(c_int, 8))) | @as(c_int, last[@as(c_int, 5)]))));
                last_raw_y_unsigned = @bitCast(@as(c_short, @truncate((@as(c_int, @as(Uint16, last[@as(c_int, 6)])) << @intCast(@as(c_int, 8))) | @as(c_int, last[@as(c_int, 7)]))));
                last_raw_x = @bitCast(@as(c_ushort, @truncate(last_raw_x_unsigned)));
                last_raw_y = @bitCast(@as(c_ushort, @truncate(last_raw_y_unsigned)));
                raw_changed = (@as(c_int, raw_x) != @as(c_int, last_raw_x)) or (@as(c_int, raw_y) != @as(c_int, last_raw_y));
                if (raw_changed) {
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
                if (size >= @as(c_int, 12)) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            32 => {
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, left_x);
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, left_y);
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
                raw_x_unsigned_4 = @bitCast(@as(c_short, @truncate((@as(c_int, @as(Uint16, data[@as(c_int, 8)])) << @intCast(@as(c_int, 8))) | @as(c_int, data[@as(c_int, 9)]))));
                raw_y_unsigned_5 = @bitCast(@as(c_short, @truncate((@as(c_int, @as(Uint16, data[@as(c_int, 10)])) << @intCast(@as(c_int, 8))) | @as(c_int, data[@as(c_int, 11)]))));
                raw_x_6 = @bitCast(@as(c_ushort, @truncate(raw_x_unsigned_4)));
                raw_y_7 = @bitCast(@as(c_ushort, @truncate(raw_y_unsigned_5)));
                right_x = raw_x_6;
                right_y = @truncate(if (@as(c_int, raw_y_7) == @as(c_int, @as(Sint16, @truncate(~@as(c_int, 32767))))) @as(c_int, @as(Sint16, @truncate(@as(c_int, 32767)))) else -@as(c_int, raw_y_7));
                last_raw_x_unsigned_8 = @bitCast(@as(c_short, @truncate((@as(c_int, @as(Uint16, last[@as(c_int, 8)])) << @intCast(@as(c_int, 8))) | @as(c_int, last[@as(c_int, 9)]))));
                last_raw_y_unsigned_9 = @bitCast(@as(c_short, @truncate((@as(c_int, @as(Uint16, last[@as(c_int, 10)])) << @intCast(@as(c_int, 8))) | @as(c_int, last[@as(c_int, 11)]))));
                last_raw_x_10 = @bitCast(@as(c_ushort, @truncate(last_raw_x_unsigned_8)));
                last_raw_y_11 = @bitCast(@as(c_ushort, @truncate(last_raw_y_unsigned_9)));
                raw_changed_12 = (@as(c_int, raw_x_6) != @as(c_int, last_raw_x_10)) or (@as(c_int, raw_y_7) != @as(c_int, last_raw_y_11));
                if (raw_changed_12) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
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
                if (@as(c_int, last[@as(c_int, 12)]) != @as(c_int, data[@as(c_int, 12)])) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            38 => {
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, right_x);
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, right_y);
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
                axis = @truncate((@as(c_int, data[@as(c_int, 12)]) * @as(c_int, 257)) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFT_TRIGGER, axis);
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
                if (@as(c_int, last[@as(c_int, 13)]) != @as(c_int, data[@as(c_int, 13)])) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            44 => {
                axis = @truncate((@as(c_int, data[@as(c_int, 13)]) * @as(c_int, 257)) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHT_TRIGGER, axis);
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
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            47 => {
                sensor_timestamp = ctx.*.sensor_timestamp_ns;
                ctx.*.sensor_timestamp_ns +%= ctx.*.sensor_timestamp_step_ns;
                acc_x_unsigned = @bitCast(@as(c_short, @truncate((@as(c_int, @as(Uint16, data[@as(c_int, 14)])) << @intCast(@as(c_int, 8))) | @as(c_int, data[@as(c_int, 15)]))));
                acc_y_unsigned = @bitCast(@as(c_short, @truncate((@as(c_int, @as(Uint16, data[@as(c_int, 16)])) << @intCast(@as(c_int, 8))) | @as(c_int, data[@as(c_int, 17)]))));
                acc_z_unsigned = @bitCast(@as(c_short, @truncate((@as(c_int, @as(Uint16, data[@as(c_int, 18)])) << @intCast(@as(c_int, 8))) | @as(c_int, data[@as(c_int, 19)]))));
                acc_x = @bitCast(@as(c_ushort, @truncate(acc_x_unsigned)));
                acc_y = @bitCast(@as(c_ushort, @truncate(acc_y_unsigned)));
                acc_z = @bitCast(@as(c_ushort, @truncate(acc_z_unsigned)));
                values[@as(c_int, 0)] = @as(f32, @floatFromInt(acc_x)) * ctx.*.accelScale;
                values[@as(c_int, 1)] = @as(f32, @floatFromInt(acc_y)) * ctx.*.accelScale;
                values[@as(c_int, 2)] = @as(f32, @floatFromInt(acc_z)) * ctx.*.accelScale;
                SDL_SendJoystickSensor(timestamp, joystick, SDL_SENSOR_ACCEL, sensor_timestamp, @ptrCast(@alignCast(&values)), 3);
                gyro_x_unsigned = @bitCast(@as(c_short, @truncate((@as(c_int, @as(Uint16, data[@as(c_int, 20)])) << @intCast(@as(c_int, 8))) | @as(c_int, data[@as(c_int, 21)]))));
                gyro_y_unsigned = @bitCast(@as(c_short, @truncate((@as(c_int, @as(Uint16, data[@as(c_int, 22)])) << @intCast(@as(c_int, 8))) | @as(c_int, data[@as(c_int, 23)]))));
                gyro_z_unsigned = @bitCast(@as(c_short, @truncate((@as(c_int, @as(Uint16, data[@as(c_int, 24)])) << @intCast(@as(c_int, 8))) | @as(c_int, data[@as(c_int, 25)]))));
                gyro_x = @bitCast(@as(c_ushort, @truncate(gyro_x_unsigned)));
                gyro_y = @bitCast(@as(c_ushort, @truncate(gyro_y_unsigned)));
                gyro_z = @bitCast(@as(c_ushort, @truncate(gyro_z_unsigned)));
                values[@as(c_int, 0)] = @as(f32, @floatFromInt(gyro_x)) * ctx.*.gyroScale;
                values[@as(c_int, 1)] = @as(f32, @floatFromInt(gyro_y)) * ctx.*.gyroScale;
                values[@as(c_int, 2)] = @as(f32, @floatFromInt(gyro_z)) * ctx.*.gyroScale;
                SDL_SendJoystickSensor(timestamp, joystick, SDL_SENSOR_GYRO, sensor_timestamp, @ptrCast(@alignCast(&values)), 3);
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
                if (size >= @as(c_int, 32)) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            50 => {
                l_touchpad_x = @bitCast(@as(c_short, @truncate((@as(c_int, @as(Uint16, data[@as(c_int, 26)])) << @intCast(@as(c_int, 4))) | ((@as(c_int, data[@as(c_int, 27)]) >> @intCast(@as(c_int, 4))) & @as(c_int, 15)))));
                l_touchpad_y = @bitCast(@as(c_short, @truncate((@as(c_int, @as(Uint16, @bitCast(@as(c_short, @truncate(@as(c_int, data[@as(c_int, 27)]) & @as(c_int, 15)))))) << @intCast(@as(c_int, 8))) | @as(c_int, data[@as(c_int, 28)]))));
                r_touchpad_x = @bitCast(@as(c_short, @truncate((@as(c_int, @as(Uint16, data[@as(c_int, 29)])) << @intCast(@as(c_int, 4))) | ((@as(c_int, data[@as(c_int, 30)]) >> @intCast(@as(c_int, 4))) & @as(c_int, 15)))));
                r_touchpad_y = @bitCast(@as(c_short, @truncate((@as(c_int, @as(Uint16, @bitCast(@as(c_short, @truncate(@as(c_int, data[@as(c_int, 30)]) & @as(c_int, 15)))))) << @intCast(@as(c_int, 8))) | @as(c_int, data[@as(c_int, 31)]))));
                _ = &l_touchpad_x;
                _ = &l_touchpad_y;
                _ = &r_touchpad_x;
                _ = &r_touchpad_y;
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
                _ = memcpy(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.last_state))))), @ptrCast(@alignCast(data)), if (@as(c_ulong, @bitCast(@as(c_long, size))) < @sizeOf(@TypeOf(ctx.*.last_state))) @as(c_ulong, @bitCast(@as(c_long, size))) else @sizeOf(@TypeOf(ctx.*.last_state)));
                ctx.*.last_state_initialized = @"true" != 0;
                {}
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverGameSir_HandleSimpleStatePacketBluetooth(joystick: [*c]SDL_Joystick, ctx: [*c]SDL_DriverGamesir_Context, data: [*c]Uint8, size: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var axis: Sint16 = undefined;
    _ = &axis;
    var timestamp: Uint64 = undefined;
    _ = &timestamp;
    var last: [*c]const Uint8 = undefined;
    _ = &last;
    var buttons: Uint8 = undefined;
    _ = &buttons;
    var buttons_1: Uint8 = undefined;
    _ = &buttons_1;
    var hat: Uint8 = undefined;
    _ = &hat;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                timestamp = SDL_GetTicksNS_REAL();
                last = @ptrCast(@alignCast(&ctx.*.last_state));
                if (@as(c_int, last[@as(c_int, 5)]) != @as(c_int, data[@as(c_int, 5)])) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                buttons = data[@as(c_int, 5)];
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SOUTH, (@as(c_int, buttons) & BTN_A) != 0);
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_EAST, (@as(c_int, buttons) & BTN_B) != 0);
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_WEST, (@as(c_int, buttons) & BTN_X) != 0);
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_NORTH, (@as(c_int, buttons) & BTN_Y) != 0);
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_SHOULDER, (@as(c_int, buttons) & BTN_L1) != 0);
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER, (@as(c_int, buttons) & BTN_R1) != 0);
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
                if (@as(c_int, last[@as(c_int, 6)]) != @as(c_int, data[@as(c_int, 6)])) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                buttons_1 = data[@as(c_int, 6)];
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_BACK, (@as(c_int, buttons_1) & BTN_SELECT) != 0);
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_START, (@as(c_int, buttons_1) & BTN_START) != 0);
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_GUIDE, (@as(c_int, buttons_1) & BTN_HOME) != 0);
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_STICK, (@as(c_int, buttons_1) & BTN_L3) != 0);
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_STICK, (@as(c_int, buttons_1) & BTN_R3) != 0);
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
                if (@as(c_int, last[@as(c_int, 4)]) != @as(c_int, data[@as(c_int, 4)])) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                switch (@as(c_int, data[@as(c_int, 4)]) & @as(c_int, 15)) {
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
                axis = @truncate(if (@as(c_int, data[@as(c_int, 0)]) == @as(c_int, 128)) @as(c_int, 0) else @as(c_int, @as(Sint16, @intFromFloat(HIDAPI_RemapVal(@floatFromInt(@as(c_int, data[@as(c_int, 0)]) - @as(c_int, 128)), @floatFromInt(-@as(c_int, 128)), @floatFromInt(@as(c_int, 255) - @as(c_int, 128)), @floatFromInt(@as(Sint16, @truncate(~@as(c_int, 32767)))), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767)))))))));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, axis);
                axis = @truncate(if (@as(c_int, data[@as(c_int, 1)]) == @as(c_int, 128)) @as(c_int, 0) else @as(c_int, @as(Sint16, @intFromFloat(HIDAPI_RemapVal(@floatFromInt(@as(c_int, data[@as(c_int, 1)]) - @as(c_int, 128)), @floatFromInt(-@as(c_int, 128)), @floatFromInt(@as(c_int, 255) - @as(c_int, 128)), @floatFromInt(@as(Sint16, @truncate(~@as(c_int, 32767)))), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767)))))))));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, axis);
                axis = @truncate(if (@as(c_int, data[@as(c_int, 2)]) == @as(c_int, 128)) @as(c_int, 0) else @as(c_int, @as(Sint16, @intFromFloat(HIDAPI_RemapVal(@floatFromInt(@as(c_int, data[@as(c_int, 2)]) - @as(c_int, 128)), @floatFromInt(-@as(c_int, 128)), @floatFromInt(@as(c_int, 255) - @as(c_int, 128)), @floatFromInt(@as(Sint16, @truncate(~@as(c_int, 32767)))), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767)))))))));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, axis);
                axis = @truncate(if (@as(c_int, data[@as(c_int, 3)]) == @as(c_int, 128)) @as(c_int, 0) else @as(c_int, @as(Sint16, @intFromFloat(HIDAPI_RemapVal(@floatFromInt(@as(c_int, data[@as(c_int, 3)]) - @as(c_int, 128)), @floatFromInt(-@as(c_int, 128)), @floatFromInt(@as(c_int, 255) - @as(c_int, 128)), @floatFromInt(@as(Sint16, @truncate(~@as(c_int, 32767)))), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767)))))))));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, axis);
                axis = @intFromFloat(HIDAPI_RemapVal(@floatFromInt(data[@as(c_int, 8)]), @floatFromInt(@as(c_int, 0)), @floatFromInt(@as(c_int, 255)), @floatFromInt(@as(Sint16, @truncate(~@as(c_int, 32767)))), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767))))));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFT_TRIGGER, axis);
                axis = @intFromFloat(HIDAPI_RemapVal(@floatFromInt(data[@as(c_int, 7)]), @floatFromInt(@as(c_int, 0)), @floatFromInt(@as(c_int, 255)), @floatFromInt(@as(Sint16, @truncate(~@as(c_int, 32767)))), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767))))));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHT_TRIGGER, axis);
                _ = memcpy(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.last_state))))), @ptrCast(@alignCast(data)), if (@as(c_ulong, @bitCast(@as(c_long, size))) < @sizeOf(@TypeOf(ctx.*.last_state))) @as(c_ulong, @bitCast(@as(c_long, size))) else @sizeOf(@TypeOf(ctx.*.last_state)));
                {}
            },
            10 => {
                SDL_SendJoystickHat(timestamp, joystick, 0, hat);
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            11 => {
                hat = SDL_HAT_UP;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            12 => {
                hat = @truncate(SDL_HAT_RIGHT | SDL_HAT_UP);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            13 => {
                hat = SDL_HAT_RIGHT;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            14 => {
                hat = @truncate(SDL_HAT_RIGHT | SDL_HAT_DOWN);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            15 => {
                hat = SDL_HAT_DOWN;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            16 => {
                hat = @truncate(SDL_HAT_LEFT | SDL_HAT_DOWN);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            17 => {
                hat = SDL_HAT_LEFT;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            18 => {
                hat = @truncate(SDL_HAT_LEFT | SDL_HAT_UP);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            19 => {
                hat = SDL_HAT_CENTERED;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverGameSir_HandleSimpleStatePacketUSB(joystick: [*c]SDL_Joystick, ctx: [*c]SDL_DriverGamesir_Context, data: [*c]Uint8, size: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var axis: Sint16 = undefined;
    _ = &axis;
    var timestamp: Uint64 = undefined;
    _ = &timestamp;
    var last: [*c]const Uint8 = undefined;
    _ = &last;
    var buttons: Uint8 = undefined;
    _ = &buttons;
    var buttons_1: Uint8 = undefined;
    _ = &buttons_1;
    var hat: Uint8 = undefined;
    _ = &hat;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                timestamp = SDL_GetTicksNS_REAL();
                last = @ptrCast(@alignCast(&ctx.*.last_state));
                if (@as(c_int, last[@as(c_int, 0)]) != @as(c_int, data[@as(c_int, 0)])) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                buttons = data[@as(c_int, 0)];
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SOUTH, (@as(c_int, buttons) & BTN_A) != 0);
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_EAST, (@as(c_int, buttons) & BTN_B) != 0);
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_WEST, (@as(c_int, buttons) & BTN_X) != 0);
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_NORTH, (@as(c_int, buttons) & BTN_Y) != 0);
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_SHOULDER, (@as(c_int, buttons) & BTN_L1) != 0);
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER, (@as(c_int, buttons) & BTN_R1) != 0);
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
                if (@as(c_int, last[@as(c_int, 1)]) != @as(c_int, data[@as(c_int, 1)])) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                buttons_1 = data[@as(c_int, 1)];
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_BACK, (@as(c_int, buttons_1) & BTN_SELECT) != 0);
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_START, (@as(c_int, buttons_1) & BTN_START) != 0);
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_GUIDE, (@as(c_int, buttons_1) & BTN_HOME) != 0);
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_STICK, (@as(c_int, buttons_1) & BTN_L3) != 0);
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_STICK, (@as(c_int, buttons_1) & BTN_R3) != 0);
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
                if (@as(c_int, last[@as(c_int, 2)]) != @as(c_int, data[@as(c_int, 2)])) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                switch (@as(c_int, data[@as(c_int, 2)]) & @as(c_int, 15)) {
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
                axis = @truncate(if (@as(c_int, data[@as(c_int, 3)]) == @as(c_int, 128)) @as(c_int, 0) else @as(c_int, @as(Sint16, @intFromFloat(HIDAPI_RemapVal(@floatFromInt(@as(c_int, data[@as(c_int, 3)]) - @as(c_int, 128)), @floatFromInt(-@as(c_int, 128)), @floatFromInt(@as(c_int, 255) - @as(c_int, 128)), @floatFromInt(@as(Sint16, @truncate(~@as(c_int, 32767)))), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767)))))))));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, axis);
                axis = @truncate(if (@as(c_int, data[@as(c_int, 4)]) == @as(c_int, 128)) @as(c_int, 0) else @as(c_int, @as(Sint16, @intFromFloat(HIDAPI_RemapVal(@floatFromInt(@as(c_int, data[@as(c_int, 4)]) - @as(c_int, 128)), @floatFromInt(-@as(c_int, 128)), @floatFromInt(@as(c_int, 255) - @as(c_int, 128)), @floatFromInt(@as(Sint16, @truncate(~@as(c_int, 32767)))), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767)))))))));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, axis);
                axis = @truncate(if (@as(c_int, data[@as(c_int, 5)]) == @as(c_int, 128)) @as(c_int, 0) else @as(c_int, @as(Sint16, @intFromFloat(HIDAPI_RemapVal(@floatFromInt(@as(c_int, data[@as(c_int, 5)]) - @as(c_int, 128)), @floatFromInt(-@as(c_int, 128)), @floatFromInt(@as(c_int, 255) - @as(c_int, 128)), @floatFromInt(@as(Sint16, @truncate(~@as(c_int, 32767)))), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767)))))))));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, axis);
                axis = @truncate(if (@as(c_int, data[@as(c_int, 6)]) == @as(c_int, 128)) @as(c_int, 0) else @as(c_int, @as(Sint16, @intFromFloat(HIDAPI_RemapVal(@floatFromInt(@as(c_int, data[@as(c_int, 6)]) - @as(c_int, 128)), @floatFromInt(-@as(c_int, 128)), @floatFromInt(@as(c_int, 255) - @as(c_int, 128)), @floatFromInt(@as(Sint16, @truncate(~@as(c_int, 32767)))), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767)))))))));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, axis);
                axis = @intFromFloat(HIDAPI_RemapVal(@floatFromInt(data[@as(c_int, 7)]), @floatFromInt(@as(c_int, 0)), @floatFromInt(@as(c_int, 255)), @floatFromInt(@as(Sint16, @truncate(~@as(c_int, 32767)))), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767))))));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFT_TRIGGER, axis);
                axis = @intFromFloat(HIDAPI_RemapVal(@floatFromInt(data[@as(c_int, 8)]), @floatFromInt(@as(c_int, 0)), @floatFromInt(@as(c_int, 255)), @floatFromInt(@as(Sint16, @truncate(~@as(c_int, 32767)))), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767))))));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHT_TRIGGER, axis);
                _ = memcpy(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.last_state))))), @ptrCast(@alignCast(data)), if (@as(c_ulong, @bitCast(@as(c_long, size))) < @sizeOf(@TypeOf(ctx.*.last_state))) @as(c_ulong, @bitCast(@as(c_long, size))) else @sizeOf(@TypeOf(ctx.*.last_state)));
                {}
            },
            10 => {
                SDL_SendJoystickHat(timestamp, joystick, 0, hat);
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            11 => {
                hat = SDL_HAT_UP;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            12 => {
                hat = @truncate(SDL_HAT_RIGHT | SDL_HAT_UP);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            13 => {
                hat = SDL_HAT_RIGHT;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            14 => {
                hat = @truncate(SDL_HAT_RIGHT | SDL_HAT_DOWN);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            15 => {
                hat = SDL_HAT_DOWN;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            16 => {
                hat = @truncate(SDL_HAT_LEFT | SDL_HAT_DOWN);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            17 => {
                hat = SDL_HAT_LEFT;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            18 => {
                hat = @truncate(SDL_HAT_LEFT | SDL_HAT_UP);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            19 => {
                hat = SDL_HAT_CENTERED;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverGameSir_UpdateDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverGamesir_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    var joystick: [*c]SDL_Joystick = null;
    _ = &joystick;
    var data: [64]Uint8 = undefined;
    _ = &data;
    var size: c_int = undefined;
    _ = &size;
    if (device.*.num_joysticks > @as(c_int, 0)) {
        joystick = SDL_GetJoystickFromID_REAL(device.*.joysticks[@as(c_int, 0)]);
    }
    var handle: ?*SDL_hid_device = HIDAPI_DriverGameSir_GetInputHandle(device, ctx);
    _ = &handle;
    if (@as(?*anyopaque, @ptrCast(@alignCast(handle))) == @as(?*anyopaque, null)) {
        return @"false" != 0;
    }
    while ((blk: {
        const tmp = SDL_hid_read_timeout_REAL(handle, @ptrCast(@alignCast(&data)), @sizeOf(@TypeOf(data)), 0);
        size = tmp;
        break :blk tmp;
    }) > @as(c_int, 0)) {
        if (!(joystick != null)) {
            continue;
        }
        var payload: [*c]Uint8 = null;
        _ = &payload;
        var payload_size: c_int = 0;
        _ = &payload_size;
        if ((((size >= @as(c_int, 3)) and (@as(c_int, data[@as(c_int, 0)]) == @as(c_int, 67))) and (@as(c_int, data[@as(c_int, 1)]) == GAMESIR_PACKET_HEADER_0)) and (@as(c_int, data[@as(c_int, 2)]) == GAMESIR_PACKET_HEADER_1_GAMEPAD)) {
            payload = @as([*c]Uint8, @ptrCast(@alignCast(&data))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
            payload_size = size - @as(c_int, 3);
            HIDAPI_DriverGameSir_HandleStatePacket(joystick, ctx, payload, payload_size);
        } else if (((size >= @as(c_int, 2)) and (@as(c_int, data[@as(c_int, 0)]) == GAMESIR_PACKET_HEADER_0)) and (@as(c_int, data[@as(c_int, 1)]) == GAMESIR_PACKET_HEADER_1_GAMEPAD)) {
            payload = @as([*c]Uint8, @ptrCast(@alignCast(&data))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
            payload_size = size - @as(c_int, 2);
            HIDAPI_DriverGameSir_HandleStatePacket(joystick, ctx, payload, payload_size);
        } else if ((size >= @as(c_int, 10)) and ((@as(c_int, data[@as(c_int, 0)]) == @as(c_int, 2)) or (@as(c_int, data[@as(c_int, 0)]) == @as(c_int, 7)))) {
            payload = @as([*c]Uint8, @ptrCast(@alignCast(&data))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
            payload_size = size - @as(c_int, 1);
            HIDAPI_DriverGameSir_HandleSimpleStatePacketBluetooth(joystick, ctx, payload, payload_size);
        } else if (size == @as(c_int, 9)) {
            payload = @ptrCast(@alignCast(&data));
            payload_size = size;
            HIDAPI_DriverGameSir_HandleSimpleStatePacketUSB(joystick, ctx, payload, payload_size);
        }
    }
    if ((size < @as(c_int, 0)) and (device.*.num_joysticks > @as(c_int, 0))) {
        HIDAPI_JoystickDisconnected(device, device.*.joysticks[@as(c_int, 0)]);
    }
    return size >= @as(c_int, 0);
}
pub fn HIDAPI_DriverGameSir_CloseJoystick(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn HIDAPI_DriverGameSir_FreeDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverGamesir_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    if (ctx != null) {
        if (ctx.*.output_handle != null) {
            _ = SDL_hid_close_REAL(ctx.*.output_handle);
        }
        SDL_free_REAL(@ptrCast(@alignCast(ctx)));
        device.*.context = null;
    }
}
pub export var SDL_HIDAPI_DriverGameSir: SDL_HIDAPI_DeviceDriver = SDL_HIDAPI_DeviceDriver{
    .name = "SDL_JOYSTICK_HIDAPI_GAMESIR",
    .enabled = @"true" != 0,
    .RegisterHints = HIDAPI_DriverGameSir_RegisterHints,
    .UnregisterHints = HIDAPI_DriverGameSir_UnregisterHints,
    .IsEnabled = HIDAPI_DriverGameSir_IsEnabled,
    .IsSupportedDevice = HIDAPI_DriverGameSir_IsSupportedDevice,
    .InitDevice = HIDAPI_DriverGameSir_InitDevice,
    .GetDevicePlayerIndex = HIDAPI_DriverGameSir_GetDevicePlayerIndex,
    .SetDevicePlayerIndex = HIDAPI_DriverGameSir_SetDevicePlayerIndex,
    .UpdateDevice = HIDAPI_DriverGameSir_UpdateDevice,
    .OpenJoystick = HIDAPI_DriverGameSir_OpenJoystick,
    .RumbleJoystick = HIDAPI_DriverGameSir_RumbleJoystick,
    .RumbleJoystickTriggers = HIDAPI_DriverGameSir_RumbleJoystickTriggers,
    .GetJoystickCapabilities = HIDAPI_DriverGameSir_GetJoystickCapabilities,
    .SetJoystickLED = HIDAPI_DriverGameSir_SetJoystickLED,
    .SendJoystickEffect = HIDAPI_DriverGameSir_SendJoystickEffect,
    .SetJoystickSensorsEnabled = HIDAPI_DriverGameSir_SetJoystickSensorsEnabled,
    .CloseJoystick = HIDAPI_DriverGameSir_CloseJoystick,
    .FreeDevice = HIDAPI_DriverGameSir_FreeDevice,
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
pub const USB_VENDOR_GAMESIR = @as(c_int, 0x3537);
pub const USB_PRODUCT_GAMESIR_GAMEPAD_G7_PRO_8K = @as(c_int, 0x10B8);
pub const USB_PRODUCT_GAMESIR_GAMEPAD_TARANTULA_8K = @as(c_int, 0x103C);
pub const SDL_JOYSTICK_CAP_RGB_LED = @as(c_int, 0x00000002);
pub const SDL_JOYSTICK_CAP_RUMBLE = @as(c_int, 0x00000010);
pub const GAMESIR_PACKET_HEADER_0 = @as(c_int, 0xA1);
pub const GAMESIR_PACKET_HEADER_1_GAMEPAD = @as(c_int, 0xC8);
pub const GAMESIR_IMU_RATE_HZ_WIRED = @as(c_int, 1000);
pub const BTN_A = @as(c_int, 0x01);
pub const BTN_B = @as(c_int, 0x02);
pub const BTN_X = @as(c_int, 0x08);
pub const BTN_Y = @as(c_int, 0x10);
pub const BTN_L1 = @as(c_int, 0x40);
pub const BTN_R1 = @as(c_int, 0x80);
pub const BTN_SELECT = @as(c_int, 0x04);
pub const BTN_START = @as(c_int, 0x08);
pub const BTN_HOME = @as(c_int, 0x10);
pub const BTN_L3 = @as(c_int, 0x20);
pub const BTN_R3 = @as(c_int, 0x40);
pub const BTN_CAPTURE = @as(c_int, 0x80);
pub const BTN_UP = @as(c_int, 0x01);
pub const BTN_UP_L = @as(c_int, 0x08);
pub const BTN_UP_R = @as(c_int, 0x02);
pub const BTN_DOWN = @as(c_int, 0x05);
pub const BTN_DOWN_L = @as(c_int, 0x06);
pub const BTN_DOWN_R = @as(c_int, 0x04);
pub const BTN_LEFT = @as(c_int, 0x07);
pub const BTN_RIGHT = @as(c_int, 0x03);
pub const BTN_L4 = @as(c_int, 0x40);
pub const BTN_R4 = @as(c_int, 0x80);
pub const BTN_L5 = @as(c_int, 0x01);
pub const BTN_R5 = @as(c_int, 0x02);
pub const BTN_L6 = @as(c_int, 0x04);
pub const BTN_R6 = @as(c_int, 0x08);
pub const BTN_L7 = @as(c_int, 0x10);
pub const BTN_R7 = @as(c_int, 0x20);
pub const BTN_L8 = @as(c_int, 0x40);
