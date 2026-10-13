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
pub extern fn memmove(__dest: ?*anyopaque, __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Sint16 = i16;
pub const Uint16 = u16;
pub const Uint32 = u32;
pub const Uint64 = u64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_memcmp_REAL(s1: ?*const anyopaque, s2: ?*const anyopaque, len: usize) c_int;
pub extern fn SDL_strchr_REAL(str: [*c]const u8, c: c_int) [*c]u8;
pub extern fn SDL_uitoa_REAL(value: c_uint, str: [*c]u8, radix: c_int) [*c]u8;
pub extern fn SDL_atof_REAL(str: [*c]const u8) f64;
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
pub const SDL_POWERSTATE_ON_BATTERY: c_int = 1;
pub const SDL_POWERSTATE_CHARGING: c_int = 3;
pub const enum_SDL_PowerState = c_int;
pub const SDL_PowerState = enum_SDL_PowerState;
pub const struct_SDL_Sensor = opaque {
};
pub const SDL_Sensor = struct_SDL_Sensor;
pub const SDL_SensorID = Uint32;
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
pub const SDL_GAMEPAD_TYPE_XBOXONE: c_int = 3;
pub const enum_SDL_GamepadType = c_uint;
pub const SDL_GamepadType = enum_SDL_GamepadType;
pub const SDL_GAMEPAD_BUTTON_INVALID: c_int = -1;
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
pub const enum_SDL_GamepadButton = c_int;
pub const SDL_GamepadButton = enum_SDL_GamepadButton;
pub const SDL_GAMEPAD_AXIS_LEFTX: c_int = 0;
pub const SDL_GAMEPAD_AXIS_LEFTY: c_int = 1;
pub const SDL_GAMEPAD_AXIS_RIGHTX: c_int = 2;
pub const SDL_GAMEPAD_AXIS_RIGHTY: c_int = 3;
pub const SDL_GAMEPAD_AXIS_LEFT_TRIGGER: c_int = 4;
pub const SDL_GAMEPAD_AXIS_RIGHT_TRIGGER: c_int = 5;
pub const SDL_GAMEPAD_AXIS_COUNT: c_int = 6;
pub const enum_SDL_GamepadAxis = c_int;
pub const SDL_GamepadAxis = enum_SDL_GamepadAxis;
pub const struct_SDL_hid_device = opaque {
};
pub const SDL_hid_device = struct_SDL_hid_device;
pub extern fn SDL_hid_read_timeout_REAL(dev: ?*SDL_hid_device, data: [*c]u8, length: usize, milliseconds: c_int) c_int;
pub extern fn SDL_hid_get_report_descriptor_REAL(dev: ?*SDL_hid_device, buf: [*c]u8, buf_size: usize) c_int;
pub extern fn SDL_GetHint_REAL(name: [*c]const u8) [*c]const u8;
pub extern fn SDL_GetHintBoolean_REAL(name: [*c]const u8, default_value: bool) bool;
pub const SDL_HintCallback = ?*const fn (userdata: ?*anyopaque, name: [*c]const u8, oldValue: [*c]const u8, newValue: [*c]const u8) callconv(.c) void;
pub extern fn SDL_AddHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) bool;
pub extern fn SDL_RemoveHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) void;
pub const SDL_LOG_CATEGORY_INPUT: c_int = 7;
pub extern fn SDL_LogDebug_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_LogWarn_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_GetTicks_REAL() Uint64;
pub extern fn SDL_GetTicksNS_REAL() Uint64;
pub extern fn SDL_Delay_REAL(ms: Uint32) void;
pub extern fn SDL_GetStringBoolean(value: [*c]const u8, default_value: bool) bool;
pub extern fn SDL_AssertJoysticksLocked() void;
pub extern fn SDL_IsJoystickXboxOneElite(vendor_id: Uint16, product_id: Uint16) bool;
pub extern fn SDL_IsJoystickXboxSeriesX(vendor_id: Uint16, product_id: Uint16) bool;
pub extern fn SDL_SendJoystickAxis(timestamp: Uint64, joystick: [*c]SDL_Joystick, axis: Uint8, value: Sint16) void;
pub extern fn SDL_SendJoystickHat(timestamp: Uint64, joystick: [*c]SDL_Joystick, hat: Uint8, value: Uint8) void;
pub extern fn SDL_SendJoystickButton(timestamp: Uint64, joystick: [*c]SDL_Joystick, button: Uint8, down: bool) void;
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
pub extern fn HIDAPI_SetDeviceSerial(device: [*c]SDL_HIDAPI_Device, serial: [*c]const u8) void;
pub extern fn HIDAPI_JoystickConnected(device: [*c]SDL_HIDAPI_Device, pJoystickID: [*c]SDL_JoystickID) bool;
pub extern fn HIDAPI_JoystickDisconnected(device: [*c]SDL_HIDAPI_Device, joystickID: SDL_JoystickID) void;
pub extern fn HIDAPI_DumpPacket(prefix: [*c]const u8, data: [*c]const Uint8, size: c_int) void;
pub extern fn SDL_HIDAPI_LockRumble() bool;
pub extern fn SDL_HIDAPI_SendRumbleAndUnlock(device: [*c]SDL_HIDAPI_Device, data: [*c]const Uint8, size: c_int) c_int;
pub const SDL_HIDAPI_RumbleSentCallback = ?*const fn (userdata: ?*anyopaque) callconv(.c) void;
pub extern fn SDL_HIDAPI_SendRumbleWithCallbackAndUnlock(device: [*c]SDL_HIDAPI_Device, data: [*c]const Uint8, size: c_int, callback: SDL_HIDAPI_RumbleSentCallback, userdata: ?*anyopaque) c_int;
pub extern fn SDL_HIDAPI_SendRumble(device: [*c]SDL_HIDAPI_Device, data: [*c]const Uint8, size: c_int) c_int;
pub const DescriptorInputField = extern struct {
    report_id: Uint8 = 0,
    usage: Uint32 = 0,
    bit_offset: c_int = 0,
    bit_size: c_int = 0,
};
pub const SDL_ReportDescriptor = extern struct {
    field_count: c_int = 0,
    fields: [*c]DescriptorInputField = null,
};
pub extern fn SDL_ParseReportDescriptor(descriptor: [*c]const Uint8, descriptor_size: usize) [*c]SDL_ReportDescriptor;
pub extern fn SDL_DescriptorHasUsage(descriptor: [*c]SDL_ReportDescriptor, usage_page: Uint16, usage: Uint16) bool;
pub extern fn SDL_DestroyDescriptor(descriptor: [*c]SDL_ReportDescriptor) void;
pub extern fn SDL_ReadReportData(data: [*c]const Uint8, size: usize, bit_offset: c_int, bit_size: c_int, value: [*c]Uint32) bool;
pub const SDL_GAMEPAD_BUTTON_XBOX_SHARE_BUTTON: c_int = 11;
pub const xbox_init_power_on: [5]Uint8 = [5]Uint8{
    5,
    32,
    0,
    1,
    0,
};
pub const xbox_init_enable_led: [7]Uint8 = [7]Uint8{
    10,
    32,
    0,
    3,
    0,
    1,
    20,
};
pub const xbox_init_security_passed: [6]Uint8 = [6]Uint8{
    6,
    32,
    0,
    2,
    1,
    0,
};
pub const xbox_init_powera_rumble: [13]Uint8 = [13]Uint8{
    9,
    0,
    0,
    9,
    0,
    15,
    0,
    0,
    29,
    29,
    255,
    0,
    0,
};
pub const xbox_init_rumble: [13]Uint8 = [13]Uint8{
    9,
    0,
    0,
    9,
    0,
    15,
    0,
    0,
    0,
    0,
    255,
    0,
    235,
};
pub const SDL_DriverXboxOne_InitPacket = extern struct {
    vendor_id: Uint16 = 0,
    product_id: Uint16 = 0,
    data: [*c]const Uint8 = null,
    size: c_int = 0,
};
pub const xboxone_init_packets: [7]SDL_DriverXboxOne_InitPacket = [7]SDL_DriverXboxOne_InitPacket{
    SDL_DriverXboxOne_InitPacket{
        .vendor_id = 0,
        .product_id = 0,
        .data = @ptrCast(@alignCast(&xbox_init_power_on)),
        .size = @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(xbox_init_power_on))))),
    },
    SDL_DriverXboxOne_InitPacket{
        .vendor_id = 0,
        .product_id = 0,
        .data = @ptrCast(@alignCast(&xbox_init_enable_led)),
        .size = @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(xbox_init_enable_led))))),
    },
    SDL_DriverXboxOne_InitPacket{
        .vendor_id = 0,
        .product_id = 0,
        .data = @ptrCast(@alignCast(&xbox_init_security_passed)),
        .size = @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(xbox_init_security_passed))))),
    },
    SDL_DriverXboxOne_InitPacket{
        .vendor_id = 9414,
        .product_id = 21530,
        .data = @ptrCast(@alignCast(&xbox_init_powera_rumble)),
        .size = @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(xbox_init_powera_rumble))))),
    },
    SDL_DriverXboxOne_InitPacket{
        .vendor_id = 9414,
        .product_id = 21546,
        .data = @ptrCast(@alignCast(&xbox_init_powera_rumble)),
        .size = @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(xbox_init_powera_rumble))))),
    },
    SDL_DriverXboxOne_InitPacket{
        .vendor_id = 9414,
        .product_id = 21562,
        .data = @ptrCast(@alignCast(&xbox_init_powera_rumble)),
        .size = @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(xbox_init_powera_rumble))))),
    },
    SDL_DriverXboxOne_InitPacket{
        .vendor_id = 0,
        .product_id = 0,
        .data = @ptrCast(@alignCast(&xbox_init_rumble)),
        .size = @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(xbox_init_rumble))))),
    },
};
pub const XBOX_ONE_INIT_STATE_ANNOUNCED: c_int = 0;
pub const XBOX_ONE_INIT_STATE_IDENTIFYING: c_int = 1;
pub const XBOX_ONE_INIT_STATE_STARTUP: c_int = 2;
pub const XBOX_ONE_INIT_STATE_PREPARE_INPUT: c_int = 3;
pub const XBOX_ONE_INIT_STATE_COMPLETE: c_int = 4;
pub const SDL_XboxOneInitState = c_uint;
pub const XBOX_ONE_RUMBLE_STATE_IDLE: c_int = 0;
pub const XBOX_ONE_RUMBLE_STATE_QUEUED: c_int = 1;
pub const XBOX_ONE_RUMBLE_STATE_BUSY: c_int = 2;
pub const SDL_XboxOneRumbleState = c_uint;
pub const SDL_DriverXboxOne_Context = extern struct {
    device: [*c]SDL_HIDAPI_Device = null,
    vendor_id: Uint16 = 0,
    product_id: Uint16 = 0,
    init_state: SDL_XboxOneInitState = @import("std").mem.zeroes(SDL_XboxOneInitState),
    start_time: Uint64 = 0,
    sequence: Uint8 = 0,
    send_time: Uint64 = 0,
    has_guide_packet: bool = false,
    has_color_led: bool = false,
    has_paddles: bool = false,
    has_unmapped_state: bool = false,
    has_trigger_rumble: bool = false,
    has_share_button: bool = false,
    has_separate_back_button: bool = false,
    has_separate_guide_button: bool = false,
    last_paddle_state: Uint8 = 0,
    low_frequency_rumble: Uint8 = 0,
    high_frequency_rumble: Uint8 = 0,
    left_trigger_rumble: Uint8 = 0,
    right_trigger_rumble: Uint8 = 0,
    rumble_state: SDL_XboxOneRumbleState = @import("std").mem.zeroes(SDL_XboxOneRumbleState),
    rumble_time: Uint64 = 0,
    rumble_pending: bool = false,
    descriptor: [*c]SDL_ReportDescriptor = null,
    last_buttons: Uint32 = 0,
    last_state: [64]Uint8 = @import("std").mem.zeroes([64]Uint8),
    chunk_buffer: [*c]Uint8 = null,
    chunk_length: Uint32 = 0,
};
pub fn ControllerHasColorLED(vendor_id: Uint16, product_id: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return (@as(c_int, vendor_id) == USB_VENDOR_MICROSOFT) and (@as(c_int, product_id) == USB_PRODUCT_XBOX_ONE_ELITE_SERIES_2);
}
pub fn ControllerHasPaddles(vendor_id: Uint16, product_id: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_IsJoystickXboxOneElite(vendor_id, product_id);
}
pub fn ControllerHasTriggerRumble(vendor_id: Uint16, _: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (@as(c_int, vendor_id) == USB_VENDOR_MICROSOFT) {
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub fn ControllerHasShareButton(vendor_id: Uint16, product_id: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_IsJoystickXboxSeriesX(vendor_id, product_id);
}
pub fn GetHomeLEDBrightness(hint: [*c]const u8) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const MAX_VALUE: c_int = 50;
    _ = &MAX_VALUE;
    var value: c_int = 20;
    _ = &value;
    if ((hint != null) and (@as(c_int, hint.*) != 0)) {
        if (@as(?*anyopaque, @ptrCast(@alignCast(SDL_strchr_REAL(hint, '.')))) != @as(?*anyopaque, null)) {
            value = @intFromFloat(@as(f64, @floatFromInt(MAX_VALUE)) * SDL_atof_REAL(hint));
        } else if (!SDL_GetStringBoolean(hint, @"true" != 0)) {
            value = 0;
        }
    }
    return value;
}
pub fn SetHomeLED(ctx: [*c]SDL_DriverXboxOne_Context, value: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var led_packet: [7]Uint8 = [7]Uint8{
        10,
        32,
        0,
        3,
        0,
        0,
        0,
    };
    _ = &led_packet;
    if (value > @as(c_int, 0)) {
        led_packet[@as(c_int, 5)] = 1;
        led_packet[@as(c_int, 6)] = @bitCast(@as(i8, @truncate(value)));
    }
    _ = SDL_HIDAPI_SendRumble(ctx.*.device, @ptrCast(@alignCast(&led_packet)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(led_packet))))));
}
pub fn SDL_HomeLEDHintChanged(userdata: ?*anyopaque, _: [*c]const u8, _: [*c]const u8, hint: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverXboxOne_Context = @ptrCast(@alignCast(userdata));
    _ = &ctx;
    if ((hint != null) and (@as(c_int, hint.*) != 0)) {
        SetHomeLED(ctx, GetHomeLEDBrightness(hint));
    }
}
pub fn SetInitState(ctx: [*c]SDL_DriverXboxOne_Context, state: SDL_XboxOneInitState) callconv(.c) void {
    @setEvalBranchQuota(100000);
    ctx.*.init_state = state;
}
pub fn GetNextPacketSequence(ctx: [*c]SDL_DriverXboxOne_Context) callconv(.c) Uint8 {
    @setEvalBranchQuota(100000);
    ctx.*.sequence +%= 1;
    if (!(@as(c_int, ctx.*.sequence) != 0)) {
        ctx.*.sequence = 1;
    }
    return ctx.*.sequence;
}
pub fn SendProtocolPacket(ctx: [*c]SDL_DriverXboxOne_Context, data: [*c]const Uint8, size: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    ctx.*.send_time = SDL_GetTicks_REAL();
    if (!SDL_HIDAPI_LockRumble()) {
        return @"false" != 0;
    }
    if (SDL_HIDAPI_SendRumbleAndUnlock(ctx.*.device, data, size) != size) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn ControllerSendsAnnouncement(vendor_id: Uint16, _: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (((@as(c_int, vendor_id) == USB_VENDOR_PDP) or (@as(c_int, vendor_id) == USB_VENDOR_POWERA)) or (@as(c_int, vendor_id) == USB_VENDOR_POWERA_ALT)) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn SendIdentificationRequest(ctx: [*c]SDL_DriverXboxOne_Context) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var packet: [4]Uint8 = [4]Uint8{
        4,
        32,
        0,
        0,
    };
    _ = &packet;
    packet[@as(c_int, 2)] = GetNextPacketSequence(ctx);
    if (!SendProtocolPacket(ctx, @ptrCast(@alignCast(&packet)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(packet))))))) {
        _ = SDL_SetError_REAL("Couldn't send identification request packet");
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn SendControllerStartup(ctx: [*c]SDL_DriverXboxOne_Context) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var vendor_id: Uint16 = ctx.*.vendor_id;
    _ = &vendor_id;
    var product_id: Uint16 = ctx.*.product_id;
    _ = &product_id;
    var init_packet: [64]Uint8 = undefined;
    _ = &init_packet;
    var i: usize = undefined;
    _ = &i;
    {
        i = 0;
        while (i < (@sizeOf(@TypeOf(xboxone_init_packets)) / @sizeOf(@TypeOf(xboxone_init_packets[@as(c_int, 0)])))) : (i +%= 1) {
            var packet: [*c]const SDL_DriverXboxOne_InitPacket = &xboxone_init_packets[i];
            _ = &packet;
            if ((@as(c_int, packet.*.vendor_id) != 0) and (@as(c_int, vendor_id) != @as(c_int, packet.*.vendor_id))) {
                continue;
            }
            if ((@as(c_int, packet.*.product_id) != 0) and (@as(c_int, product_id) != @as(c_int, packet.*.product_id))) {
                continue;
            }
            _ = memcpy(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&init_packet))))), @ptrCast(@alignCast(packet.*.data)), @bitCast(@as(c_long, packet.*.size)));
            init_packet[@as(c_int, 2)] = GetNextPacketSequence(ctx);
            if (@as(c_int, init_packet[@as(c_int, 0)]) == @as(c_int, 10)) {
                var brightness: c_int = GetHomeLEDBrightness(SDL_GetHint_REAL("SDL_JOYSTICK_HIDAPI_XBOX_ONE_HOME_LED"));
                _ = &brightness;
                init_packet[@as(c_int, 5)] = @bitCast(@as(i8, @truncate(if (brightness > @as(c_int, 0)) @as(c_int, 1) else @as(c_int, 0))));
                init_packet[@as(c_int, 6)] = @bitCast(@as(i8, @truncate(brightness)));
            }
            if (!SendProtocolPacket(ctx, @ptrCast(@alignCast(&init_packet)), packet.*.size)) {
                _ = SDL_SetError_REAL("Couldn't send initialization packet");
                return @"false" != 0;
            }
            if (packet.*.data == @as([*c]const Uint8, @ptrCast(@alignCast(&xbox_init_powera_rumble)))) {
                SDL_Delay_REAL(10);
            }
        }
    }
    return @"true" != 0;
}
pub fn HIDAPI_DriverXboxOne_RegisterHints(callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = SDL_AddHintCallback_REAL("SDL_JOYSTICK_HIDAPI_XBOX", callback, userdata);
    _ = SDL_AddHintCallback_REAL("SDL_JOYSTICK_HIDAPI_XBOX_ONE", callback, userdata);
}
pub fn HIDAPI_DriverXboxOne_UnregisterHints(callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_RemoveHintCallback_REAL("SDL_JOYSTICK_HIDAPI_XBOX", callback, userdata);
    SDL_RemoveHintCallback_REAL("SDL_JOYSTICK_HIDAPI_XBOX_ONE", callback, userdata);
}
pub fn HIDAPI_DriverXboxOne_IsEnabled() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI_XBOX_ONE", SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI_XBOX", SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI", @"true" != 0)));
}
pub fn HIDAPI_DriverXboxOne_IsSupportedDevice(_: [*c]SDL_HIDAPI_Device, _: [*c]const u8, arg_type: SDL_GamepadType, _: Uint16, _: Uint16, _: Uint16, _: c_int, interface_class: c_int, interface_subclass: c_int, interface_protocol: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    const static_local_LIBUSB_CLASS_VENDOR_SPEC = struct {
        const LIBUSB_CLASS_VENDOR_SPEC: c_int = 255;
    };
    _ = &static_local_LIBUSB_CLASS_VENDOR_SPEC;
    const static_local_XBONE_IFACE_SUBCLASS = struct {
        const XBONE_IFACE_SUBCLASS: c_int = 71;
    };
    _ = &static_local_XBONE_IFACE_SUBCLASS;
    const static_local_XBONE_IFACE_PROTOCOL = struct {
        const XBONE_IFACE_PROTOCOL: c_int = 208;
    };
    _ = &static_local_XBONE_IFACE_PROTOCOL;
    if ((interface_class != 0) and (((interface_class != static_local_LIBUSB_CLASS_VENDOR_SPEC.LIBUSB_CLASS_VENDOR_SPEC) or (interface_subclass != static_local_XBONE_IFACE_SUBCLASS.XBONE_IFACE_SUBCLASS)) or (interface_protocol != static_local_XBONE_IFACE_PROTOCOL.XBONE_IFACE_PROTOCOL))) {
        return @"false" != 0;
    }
    return @"type" == @as(SDL_GamepadType, SDL_GAMEPAD_TYPE_XBOXONE);
}
pub fn HIDAPI_DriverXboxOne_InitDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverXboxOne_Context = undefined;
    _ = &ctx;
    ctx = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(ctx.*)))));
    if (!(ctx != null)) {
        return @"false" != 0;
    }
    ctx.*.device = device;
    device.*.context = @ptrCast(@alignCast(ctx));
    var descriptor: [1024]Uint8 = undefined;
    _ = &descriptor;
    var descriptor_len: c_int = SDL_hid_get_report_descriptor_REAL(device.*.dev, @ptrCast(@alignCast(&descriptor)), @sizeOf(@TypeOf(descriptor)));
    _ = &descriptor_len;
    if (descriptor_len > @as(c_int, 0)) {
        HIDAPI_DumpPacket("Xbox One report descriptor: size = %d", @ptrCast(@alignCast(&descriptor)), descriptor_len);
        ctx.*.descriptor = SDL_ParseReportDescriptor(@ptrCast(@alignCast(&descriptor)), @bitCast(@as(c_long, descriptor_len)));
        if (ctx.*.descriptor != null) {
            var field_count: c_int = ctx.*.descriptor.*.field_count;
            _ = &field_count;
            var fields: [*c]DescriptorInputField = ctx.*.descriptor.*.fields;
            _ = &fields;
            var button_count: c_int = 0;
            _ = &button_count;
            {
                var i: c_int = 0;
                _ = &i;
                while (i < field_count) : (i += 1) {
                    var field: [*c]DescriptorInputField = &fields[@bitCast(@as(isize, @intCast(i)))];
                    _ = &field;
                    if (field.*.usage == ((@as(Uint32, @bitCast(@as(c_int, USB_USAGEPAGE_BUTTON))) << @intCast(@as(Uint32, 16))) | @as(Uint32, 1))) {
                        var expected_usage: Uint32 = field.*.usage;
                        _ = &expected_usage;
                        var expected_offset: c_int = field.*.bit_offset;
                        _ = &expected_offset;
                        {
                            var j: c_int = i;
                            _ = &j;
                            while (j < field_count) : (j += 1) {
                                var other: [*c]DescriptorInputField = &fields[@bitCast(@as(isize, @intCast(j)))];
                                _ = &other;
                                if ((other.*.usage != expected_usage) or (other.*.bit_offset != expected_offset)) {
                                    break;
                                }
                                button_count += 1;
                                expected_usage +%= 1;
                                expected_offset += 1;
                            }
                        }
                        field.*.bit_size = button_count;
                        var next_field: c_int = i + button_count;
                        _ = &next_field;
                        var fields_left: c_int = field_count - next_field;
                        _ = &fields_left;
                        _ = memmove(@ptrCast(@alignCast(&fields[@bitCast(@as(isize, @intCast(i + @as(c_int, 1))))])), @ptrCast(@alignCast(&fields[@bitCast(@as(isize, @intCast(next_field)))])), @as(c_ulong, @bitCast(@as(c_long, fields_left))) *% @sizeOf(@TypeOf(fields[@as(c_int, 0)])));
                        ctx.*.descriptor.*.field_count -= button_count - @as(c_int, 1);
                        break;
                    }
                }
            }
            if ((!SDL_DescriptorHasUsage(ctx.*.descriptor, USB_USAGEPAGE_GENERIC_DESKTOP, USB_USAGE_GENERIC_X) or !SDL_DescriptorHasUsage(ctx.*.descriptor, USB_USAGEPAGE_GENERIC_DESKTOP, USB_USAGE_GENERIC_Y)) or ((button_count != @as(c_int, 12)) and (button_count != @as(c_int, 15)))) {
                SDL_LogWarn_REAL(SDL_LOG_CATEGORY_INPUT, "Xbox report descriptor missing expected usages, ignoring");
                SDL_DestroyDescriptor(ctx.*.descriptor);
                ctx.*.descriptor = null;
            }
        } else {
            SDL_LogWarn_REAL(SDL_LOG_CATEGORY_INPUT, "Couldn't parse Xbox report descriptor: %s", SDL_GetError_REAL());
        }
    } else {
        SDL_LogDebug_REAL(SDL_LOG_CATEGORY_INPUT, "Xbox report descriptor not available");
    }
    ctx.*.vendor_id = device.*.vendor_id;
    ctx.*.product_id = device.*.product_id;
    ctx.*.start_time = SDL_GetTicks_REAL();
    ctx.*.sequence = 0;
    ctx.*.has_color_led = ControllerHasColorLED(ctx.*.vendor_id, ctx.*.product_id);
    ctx.*.has_paddles = ControllerHasPaddles(ctx.*.vendor_id, ctx.*.product_id);
    ctx.*.has_trigger_rumble = ControllerHasTriggerRumble(ctx.*.vendor_id, ctx.*.product_id);
    ctx.*.has_share_button = ControllerHasShareButton(ctx.*.vendor_id, ctx.*.product_id);
    if (!ControllerSendsAnnouncement(device.*.vendor_id, device.*.product_id)) {
        ctx.*.init_state = XBOX_ONE_INIT_STATE_STARTUP;
    } else {
        ctx.*.init_state = XBOX_ONE_INIT_STATE_COMPLETE;
    }
    device.*.type = SDL_GAMEPAD_TYPE_XBOXONE;
    return HIDAPI_JoystickConnected(device, null);
}
pub fn HIDAPI_DriverXboxOne_GetDevicePlayerIndex(_: [*c]SDL_HIDAPI_Device, _: SDL_JoystickID) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return -@as(c_int, 1);
}
pub fn HIDAPI_DriverXboxOne_SetDevicePlayerIndex(_: [*c]SDL_HIDAPI_Device, _: SDL_JoystickID, _: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn HIDAPI_DriverXboxOne_OpenJoystick(device: [*c]SDL_HIDAPI_Device, joystick: [*c]SDL_Joystick) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverXboxOne_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    SDL_AssertJoysticksLocked();
    ctx.*.low_frequency_rumble = 0;
    ctx.*.high_frequency_rumble = 0;
    ctx.*.left_trigger_rumble = 0;
    ctx.*.right_trigger_rumble = 0;
    ctx.*.rumble_state = XBOX_ONE_RUMBLE_STATE_IDLE;
    ctx.*.rumble_time = 0;
    ctx.*.rumble_pending = @"false" != 0;
    _ = memset(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.last_state))))), 0, @sizeOf(@TypeOf(ctx.*.last_state)));
    joystick.*.nbuttons = 11;
    if (ctx.*.has_share_button) {
        joystick.*.nbuttons += 1;
    }
    if (ctx.*.has_paddles) {
        joystick.*.nbuttons += 4;
    }
    joystick.*.naxes = SDL_GAMEPAD_AXIS_COUNT;
    joystick.*.nhats = 1;
    _ = SDL_AddHintCallback_REAL("SDL_JOYSTICK_HIDAPI_XBOX_ONE_HOME_LED", SDL_HomeLEDHintChanged, @ptrCast(@alignCast(ctx)));
    return @"true" != 0;
}
pub fn HIDAPI_DriverXboxOne_RumbleSent(userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverXboxOne_Context = @ptrCast(@alignCast(userdata));
    _ = &ctx;
    ctx.*.rumble_time = SDL_GetTicks_REAL();
}
pub fn HIDAPI_DriverXboxOne_UpdateRumble(ctx: [*c]SDL_DriverXboxOne_Context) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (ctx.*.rumble_state == @as(SDL_XboxOneRumbleState, XBOX_ONE_RUMBLE_STATE_QUEUED)) {
        if (ctx.*.rumble_time != 0) {
            ctx.*.rumble_state = XBOX_ONE_RUMBLE_STATE_BUSY;
        }
    }
    if (ctx.*.rumble_state == @as(SDL_XboxOneRumbleState, XBOX_ONE_RUMBLE_STATE_BUSY)) {
        const RUMBLE_BUSY_TIME_MS: c_int = if (ctx.*.device.*.is_bluetooth) @as(c_int, 50) else @as(c_int, 10);
        _ = &RUMBLE_BUSY_TIME_MS;
        if (SDL_GetTicks_REAL() >= (ctx.*.rumble_time +% @as(Uint64, @bitCast(@as(c_long, RUMBLE_BUSY_TIME_MS))))) {
            ctx.*.rumble_time = 0;
            ctx.*.rumble_state = XBOX_ONE_RUMBLE_STATE_IDLE;
        }
    }
    if (!ctx.*.rumble_pending) {
        return @"true" != 0;
    }
    if (ctx.*.rumble_state != @as(SDL_XboxOneRumbleState, XBOX_ONE_RUMBLE_STATE_IDLE)) {
        return @"true" != 0;
    }
    ctx.*.rumble_pending = @"false" != 0;
    if (!SDL_HIDAPI_LockRumble()) {
        return @"false" != 0;
    }
    if (ctx.*.device.*.is_bluetooth) {
        var rumble_packet: [9]Uint8 = [9]Uint8{
            3,
            15,
            0,
            0,
            0,
            0,
            255,
            0,
            235,
        };
        _ = &rumble_packet;
        rumble_packet[@as(c_int, 2)] = ctx.*.left_trigger_rumble;
        rumble_packet[@as(c_int, 3)] = ctx.*.right_trigger_rumble;
        rumble_packet[@as(c_int, 4)] = ctx.*.low_frequency_rumble;
        rumble_packet[@as(c_int, 5)] = ctx.*.high_frequency_rumble;
        if (@as(c_ulong, @bitCast(@as(c_long, SDL_HIDAPI_SendRumbleWithCallbackAndUnlock(ctx.*.device, @ptrCast(@alignCast(&rumble_packet)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(rumble_packet))))), HIDAPI_DriverXboxOne_RumbleSent, @ptrCast(@alignCast(ctx)))))) != @sizeOf(@TypeOf(rumble_packet))) {
            return SDL_SetError_REAL("Couldn't send rumble packet");
        }
    } else {
        var rumble_packet: [13]Uint8 = [13]Uint8{
            9,
            0,
            0,
            9,
            0,
            15,
            0,
            0,
            0,
            0,
            255,
            0,
            235,
        };
        _ = &rumble_packet;
        rumble_packet[@as(c_int, 6)] = ctx.*.left_trigger_rumble;
        rumble_packet[@as(c_int, 7)] = ctx.*.right_trigger_rumble;
        rumble_packet[@as(c_int, 8)] = ctx.*.low_frequency_rumble;
        rumble_packet[@as(c_int, 9)] = ctx.*.high_frequency_rumble;
        if (@as(c_ulong, @bitCast(@as(c_long, SDL_HIDAPI_SendRumbleWithCallbackAndUnlock(ctx.*.device, @ptrCast(@alignCast(&rumble_packet)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(rumble_packet))))), HIDAPI_DriverXboxOne_RumbleSent, @ptrCast(@alignCast(ctx)))))) != @sizeOf(@TypeOf(rumble_packet))) {
            return SDL_SetError_REAL("Couldn't send rumble packet");
        }
    }
    ctx.*.rumble_state = XBOX_ONE_RUMBLE_STATE_QUEUED;
    return @"true" != 0;
}
pub fn HIDAPI_DriverXboxOne_RumbleJoystick(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, low_frequency_rumble: Uint16, high_frequency_rumble: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverXboxOne_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    ctx.*.low_frequency_rumble = @bitCast(@as(i8, @truncate(@divTrunc(@as(c_int, low_frequency_rumble), @as(c_int, 655)))));
    ctx.*.high_frequency_rumble = @bitCast(@as(i8, @truncate(@divTrunc(@as(c_int, high_frequency_rumble), @as(c_int, 655)))));
    ctx.*.rumble_pending = @"true" != 0;
    return HIDAPI_DriverXboxOne_UpdateRumble(ctx);
}
pub fn HIDAPI_DriverXboxOne_RumbleJoystickTriggers(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, left_rumble: Uint16, right_rumble: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverXboxOne_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    if (!ctx.*.has_trigger_rumble) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    ctx.*.left_trigger_rumble = @bitCast(@as(i8, @truncate(@divTrunc(@as(c_int, left_rumble), @as(c_int, 655)))));
    ctx.*.right_trigger_rumble = @bitCast(@as(i8, @truncate(@divTrunc(@as(c_int, right_rumble), @as(c_int, 655)))));
    ctx.*.rumble_pending = @"true" != 0;
    return HIDAPI_DriverXboxOne_UpdateRumble(ctx);
}
pub fn HIDAPI_DriverXboxOne_GetJoystickCapabilities(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverXboxOne_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    var result: Uint32 = 0;
    _ = &result;
    result |= SDL_JOYSTICK_CAP_RUMBLE;
    if (ctx.*.has_trigger_rumble) {
        result |= SDL_JOYSTICK_CAP_TRIGGER_RUMBLE;
    }
    if (ctx.*.has_color_led) {
        result |= SDL_JOYSTICK_CAP_RGB_LED;
    }
    return result;
}
pub fn HIDAPI_DriverXboxOne_SetJoystickLED(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, red: Uint8, green: Uint8, blue: Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverXboxOne_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    if (ctx.*.has_color_led) {
        var led_packet: [9]Uint8 = [9]Uint8{
            14,
            0,
            0,
            5,
            0,
            0,
            0,
            0,
            0,
        };
        _ = &led_packet;
        led_packet[@as(c_int, 5)] = 0;
        led_packet[@as(c_int, 6)] = red;
        led_packet[@as(c_int, 7)] = green;
        led_packet[@as(c_int, 8)] = blue;
        if (@as(c_ulong, @bitCast(@as(c_long, SDL_HIDAPI_SendRumble(device, @ptrCast(@alignCast(&led_packet)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(led_packet))))))))) != @sizeOf(@TypeOf(led_packet))) {
            return SDL_SetError_REAL("Couldn't send LED packet");
        }
        return @"true" != 0;
    } else {
        return SDL_SetError_REAL("That operation is not supported");
    }
}
pub fn HIDAPI_DriverXboxOne_SendJoystickEffect(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: ?*const anyopaque, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverXboxOne_SetJoystickSensorsEnabled(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverXboxOne_HandleBatteryState(joystick: [*c]SDL_Joystick, flags: Uint32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var on_usb: bool = undefined;
    _ = &on_usb;
    var state: SDL_PowerState = undefined;
    _ = &state;
    var percent: c_int = undefined;
    _ = &percent;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                on_usb = ((flags & @as(Uint32, 12)) >> @intCast(@as(Uint32, 2))) == @as(Uint32, 0);
                percent = 0;
                switch (flags & @as(Uint32, 3)) {
                    @as(Uint32, 0) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(Uint32, 1) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(Uint32, 2) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(Uint32, 3) => {
                        sdl_pc = 5;
                        continue;
                    },
                    else => {
                        sdl_pc = 1;
                        continue;
                    },
                }
            },
            1 => {
                if (on_usb) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 7;
                    continue;
                }
            },
            2 => {
                percent = 10;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                percent = 40;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                percent = 70;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            5 => {
                percent = 100;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            6 => {
                state = SDL_POWERSTATE_CHARGING;
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                state = SDL_POWERSTATE_ON_BATTERY;
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            8 => {
                SDL_SendJoystickPowerInfo(joystick, state, percent);
                {}
            },
            else => unreachable,
        }
    }
}
pub fn HandleDescriptorAxis(timestamp: Uint64, joystick: [*c]SDL_Joystick, axis: SDL_GamepadAxis, value: Uint32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var axis_value: Sint16 = @truncate(@as(c_int, @bitCast(@as(c_uint, @truncate(value)))) - @as(c_int, 32768));
    _ = &axis_value;
    SDL_SendJoystickAxis(timestamp, joystick, @bitCast(@as(i8, @truncate(axis))), axis_value);
}
pub fn HandleDescriptorTrigger(timestamp: Uint64, joystick: [*c]SDL_Joystick, axis: SDL_GamepadAxis, value: Uint32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var axis_value: Sint16 = @truncate((@as(c_int, @bitCast(@as(c_uint, @truncate(value)))) * @as(c_int, 64)) - @as(c_int, 32768));
    _ = &axis_value;
    if (@as(c_int, axis_value) == @as(c_int, 32704)) {
        axis_value = 32767;
    }
    SDL_SendJoystickAxis(timestamp, joystick, @bitCast(@as(i8, @truncate(axis))), axis_value);
}
pub fn HIDAPI_DriverXboxOne_HandleDescriptorReport(joystick: [*c]SDL_Joystick, ctx: [*c]SDL_DriverXboxOne_Context, arg_data: [*c]Uint8, arg_size: usize) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var data = arg_data;
    _ = &data;
    var size = arg_size;
    _ = &size;
    var descriptor: [*c]const SDL_ReportDescriptor = undefined;
    _ = &descriptor;
    var timestamp: Uint64 = undefined;
    _ = &timestamp;
    var report_id: Uint8 = undefined;
    _ = &report_id;
    var i: c_int = undefined;
    _ = &i;
    var field: [*c]DescriptorInputField = undefined;
    _ = &field;
    var value: Uint32 = undefined;
    _ = &value;
    var hat: Uint8 = undefined;
    _ = &hat;
    const static_local_button_map_12 = struct {
        const button_map_12: [12]SDL_GamepadButton = [12]SDL_GamepadButton{
            SDL_GAMEPAD_BUTTON_SOUTH,
            SDL_GAMEPAD_BUTTON_EAST,
            SDL_GAMEPAD_BUTTON_WEST,
            SDL_GAMEPAD_BUTTON_NORTH,
            SDL_GAMEPAD_BUTTON_LEFT_SHOULDER,
            SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER,
            SDL_GAMEPAD_BUTTON_BACK,
            SDL_GAMEPAD_BUTTON_START,
            SDL_GAMEPAD_BUTTON_LEFT_STICK,
            SDL_GAMEPAD_BUTTON_RIGHT_STICK,
            SDL_GAMEPAD_BUTTON_GUIDE,
            SDL_GAMEPAD_BUTTON_INVALID,
        };
    };
    _ = &static_local_button_map_12;
    const static_local_button_map_15 = struct {
        const button_map_15: [15]SDL_GamepadButton = [15]SDL_GamepadButton{
            SDL_GAMEPAD_BUTTON_SOUTH,
            SDL_GAMEPAD_BUTTON_EAST,
            SDL_GAMEPAD_BUTTON_INVALID,
            SDL_GAMEPAD_BUTTON_WEST,
            SDL_GAMEPAD_BUTTON_NORTH,
            SDL_GAMEPAD_BUTTON_INVALID,
            SDL_GAMEPAD_BUTTON_LEFT_SHOULDER,
            SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER,
            SDL_GAMEPAD_BUTTON_INVALID,
            SDL_GAMEPAD_BUTTON_INVALID,
            SDL_GAMEPAD_BUTTON_BACK,
            SDL_GAMEPAD_BUTTON_START,
            SDL_GAMEPAD_BUTTON_GUIDE,
            SDL_GAMEPAD_BUTTON_LEFT_STICK,
            SDL_GAMEPAD_BUTTON_RIGHT_STICK,
        };
    };
    _ = &static_local_button_map_15;
    var button_map: [*c]const SDL_GamepadButton = undefined;
    _ = &button_map;
    var button_count: c_int = undefined;
    _ = &button_count;
    var button_index: c_int = undefined;
    _ = &button_index;
    var button: SDL_GamepadButton = undefined;
    _ = &button;
    var pressed: bool = undefined;
    _ = &pressed;
    var pressed_1: bool = undefined;
    _ = &pressed_1;
    var pressed_2: bool = undefined;
    _ = &pressed_2;
    var pressed_3: bool = undefined;
    _ = &pressed_3;
    var button_4: Uint8 = undefined;
    _ = &button_4;
    button_index += 1;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                descriptor = ctx.*.descriptor;
                timestamp = SDL_GetTicksNS_REAL();
                if (size == @as(usize, 0)) {
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
                report_id = data.*;
                data += 1;
                size -%= 1;
                i = 0;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                if (i < descriptor.*.field_count) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 7;
                    continue;
                }
            },
            5 => {
                field = &descriptor.*.fields[@bitCast(@as(isize, @intCast(i)))];
                if (@as(c_int, field.*.report_id) != @as(c_int, report_id)) {
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
                return @"true" != 0;
            },
            8 => {
                {
                    sdl_pc = 6;
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
                if (!SDL_ReadReportData(data, size, field.*.bit_offset, field.*.bit_size, &value)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                {
                    sdl_pc = 6;
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
                switch (field.*.usage) {
                    (@as(Uint32, @bitCast(@as(c_int, USB_USAGEPAGE_GENERIC_DESKTOP))) << @intCast(@as(Uint32, 16))) | @as(Uint32, USB_USAGE_GENERIC_X) => {
                        sdl_pc = 15;
                        continue;
                    },
                    (@as(Uint32, @bitCast(@as(c_int, USB_USAGEPAGE_GENERIC_DESKTOP))) << @intCast(@as(Uint32, 16))) | @as(Uint32, USB_USAGE_GENERIC_Y) => {
                        sdl_pc = 16;
                        continue;
                    },
                    (@as(Uint32, @bitCast(@as(c_int, USB_USAGEPAGE_GENERIC_DESKTOP))) << @intCast(@as(Uint32, 16))) | @as(Uint32, USB_USAGE_GENERIC_Z) => {
                        sdl_pc = 17;
                        continue;
                    },
                    (@as(Uint32, @bitCast(@as(c_int, USB_USAGEPAGE_GENERIC_DESKTOP))) << @intCast(@as(Uint32, 16))) | @as(Uint32, USB_USAGE_GENERIC_RX) => {
                        sdl_pc = 24;
                        continue;
                    },
                    (@as(Uint32, @bitCast(@as(c_int, USB_USAGEPAGE_GENERIC_DESKTOP))) << @intCast(@as(Uint32, 16))) | @as(Uint32, USB_USAGE_GENERIC_RY) => {
                        sdl_pc = 25;
                        continue;
                    },
                    (@as(Uint32, @bitCast(@as(c_int, USB_USAGEPAGE_GENERIC_DESKTOP))) << @intCast(@as(Uint32, 16))) | @as(Uint32, USB_USAGE_GENERIC_RZ) => {
                        sdl_pc = 26;
                        continue;
                    },
                    (@as(Uint32, @bitCast(@as(c_int, USB_USAGEPAGE_SIMULATION))) << @intCast(@as(Uint32, 16))) | @as(Uint32, USB_USAGE_SIMULATION_BRAKE) => {
                        sdl_pc = 33;
                        continue;
                    },
                    (@as(Uint32, @bitCast(@as(c_int, USB_USAGEPAGE_SIMULATION))) << @intCast(@as(Uint32, 16))) | @as(Uint32, USB_USAGE_SIMULATION_ACCELERATOR) => {
                        sdl_pc = 34;
                        continue;
                    },
                    (@as(Uint32, @bitCast(@as(c_int, USB_USAGEPAGE_GENERIC_DESKTOP))) << @intCast(@as(Uint32, 16))) | @as(Uint32, USB_USAGE_GENERIC_HAT) => {
                        sdl_pc = 35;
                        continue;
                    },
                    (@as(Uint32, @bitCast(@as(c_int, USB_USAGEPAGE_BUTTON))) << @intCast(@as(Uint32, 16))) | @as(Uint32, 1) => {
                        sdl_pc = 46;
                        continue;
                    },
                    (@as(Uint32, @bitCast(@as(c_int, USB_USAGEPAGE_CONSUMER))) << @intCast(@as(Uint32, 16))) | @as(Uint32, USB_USAGE_CONSUMER_AC_BACK) => {
                        sdl_pc = 69;
                        continue;
                    },
                    (@as(Uint32, @bitCast(@as(c_int, USB_USAGEPAGE_CONSUMER))) << @intCast(@as(Uint32, 16))) | @as(Uint32, USB_USAGE_CONSUMER_AC_HOME) => {
                        sdl_pc = 73;
                        continue;
                    },
                    (@as(Uint32, @bitCast(@as(c_int, USB_USAGEPAGE_CONSUMER))) << @intCast(@as(Uint32, 16))) | @as(Uint32, USB_USAGE_CONSUMER_RECORD) => {
                        sdl_pc = 77;
                        continue;
                    },
                    (@as(Uint32, @bitCast(@as(c_int, USB_USAGEPAGE_CONSUMER))) << @intCast(@as(Uint32, 16))) | @as(Uint32, USB_USAGE_CONSUMER_ORDER_MOVIE) => {
                        sdl_pc = 81;
                        continue;
                    },
                    (@as(Uint32, @bitCast(@as(c_int, USB_USAGEPAGE_CONSUMER))) << @intCast(@as(Uint32, 16))) | @as(Uint32, USB_USAGE_CONSUMER_ASSIGN_SELECTION) => {
                        sdl_pc = 82;
                        continue;
                    },
                    (@as(Uint32, @bitCast(@as(c_int, USB_USAGEPAGE_DEVICE_CONTROLS))) << @intCast(@as(Uint32, 16))) | @as(Uint32, USB_USAGE_DEVICE_CONTROLS_BATTERY_STRENGTH) => {
                        sdl_pc = 89;
                        continue;
                    },
                    else => {
                        sdl_pc = 90;
                        continue;
                    },
                }
            },
            14 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            15 => {
                HandleDescriptorAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, value);
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            16 => {
                HandleDescriptorAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, value);
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            17 => {
                if (field.*.bit_size == @as(c_int, 16)) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            18 => {
                HandleDescriptorAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, value);
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            19 => {
                if (field.*.bit_size == @as(c_int, 10)) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            20 => {
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            21 => {
                HandleDescriptorTrigger(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFT_TRIGGER, value);
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
                HandleDescriptorAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, value);
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            25 => {
                HandleDescriptorAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, value);
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            26 => {
                if (field.*.bit_size == @as(c_int, 16)) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            27 => {
                HandleDescriptorAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, value);
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            28 => {
                if (field.*.bit_size == @as(c_int, 10)) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            29 => {
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            30 => {
                HandleDescriptorTrigger(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHT_TRIGGER, value);
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
                HandleDescriptorTrigger(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFT_TRIGGER, value);
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            34 => {
                HandleDescriptorTrigger(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHT_TRIGGER, value);
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            35 => {
                switch (value) {
                    @as(Uint32, 1) => {
                        sdl_pc = 37;
                        continue;
                    },
                    @as(Uint32, 2) => {
                        sdl_pc = 38;
                        continue;
                    },
                    @as(Uint32, 3) => {
                        sdl_pc = 39;
                        continue;
                    },
                    @as(Uint32, 4) => {
                        sdl_pc = 40;
                        continue;
                    },
                    @as(Uint32, 5) => {
                        sdl_pc = 41;
                        continue;
                    },
                    @as(Uint32, 6) => {
                        sdl_pc = 42;
                        continue;
                    },
                    @as(Uint32, 7) => {
                        sdl_pc = 43;
                        continue;
                    },
                    @as(Uint32, 8) => {
                        sdl_pc = 44;
                        continue;
                    },
                    else => {
                        sdl_pc = 45;
                        continue;
                    },
                }
            },
            36 => {
                SDL_SendJoystickHat(timestamp, joystick, 0, hat);
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            37 => {
                hat = SDL_HAT_UP;
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            38 => {
                hat = @truncate(SDL_HAT_RIGHT | SDL_HAT_UP);
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            39 => {
                hat = SDL_HAT_RIGHT;
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            40 => {
                hat = @truncate(SDL_HAT_RIGHT | SDL_HAT_DOWN);
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            41 => {
                hat = SDL_HAT_DOWN;
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            42 => {
                hat = @truncate(SDL_HAT_LEFT | SDL_HAT_DOWN);
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            43 => {
                hat = SDL_HAT_LEFT;
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            44 => {
                hat = @truncate(SDL_HAT_LEFT | SDL_HAT_UP);
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            45 => {
                hat = SDL_HAT_CENTERED;
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            46 => {
                if (value == ctx.*.last_buttons) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            47 => {
                {
                    sdl_pc = 14;
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
                ctx.*.last_buttons = value;
                if ((field.*.bit_size == @as(c_int, 12)) or (size == @as(usize, 15))) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            50 => {
                button_map = @ptrCast(@alignCast(&static_local_button_map_12.button_map_12));
                button_count = @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(static_local_button_map_12.button_map_12)) / @sizeOf(@TypeOf(static_local_button_map_12.button_map_12[@as(c_int, 0)])))));
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            51 => {
                if (field.*.bit_size == @as(c_int, 15)) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 54;
                    continue;
                }
            },
            52 => {
                button_index = 0;
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            53 => {
                button_map = @ptrCast(@alignCast(&static_local_button_map_15.button_map_15));
                button_count = @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(static_local_button_map_15.button_map_15)) / @sizeOf(@TypeOf(static_local_button_map_15.button_map_15[@as(c_int, 0)])))));
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            54 => {
                {
                    sdl_pc = 14;
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
                if (button_index < button_count) {
                    sdl_pc = 57;
                    continue;
                } else {
                    sdl_pc = 59;
                    continue;
                }
            },
            57 => {
                button = button_map[@bitCast(@as(isize, @intCast(button_index)))];
                if (button == SDL_GAMEPAD_BUTTON_INVALID) {
                    sdl_pc = 60;
                    continue;
                } else {
                    sdl_pc = 61;
                    continue;
                }
            },
            58 => {
                value >>= @intCast(@as(Uint32, 1));
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            59 => {
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            60 => {
                {
                    sdl_pc = 58;
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
                if ((button == SDL_GAMEPAD_BUTTON_BACK) and ctx.*.has_separate_back_button) {
                    sdl_pc = 63;
                    continue;
                } else {
                    sdl_pc = 64;
                    continue;
                }
            },
            63 => {
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            64 => {
                {
                    sdl_pc = 65;
                    continue;
                }
            },
            65 => {
                if ((button == SDL_GAMEPAD_BUTTON_GUIDE) and ctx.*.has_separate_guide_button) {
                    sdl_pc = 66;
                    continue;
                } else {
                    sdl_pc = 67;
                    continue;
                }
            },
            66 => {
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            67 => {
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            68 => {
                pressed = (value & @as(Uint32, 1)) != @as(Uint32, 0);
                SDL_SendJoystickButton(timestamp, joystick, @bitCast(@as(i8, @truncate(button))), pressed);
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            69 => {
                pressed_1 = value != @as(Uint32, 0);
                if (pressed_1) {
                    sdl_pc = 70;
                    continue;
                } else {
                    sdl_pc = 71;
                    continue;
                }
            },
            70 => {
                ctx.*.has_separate_back_button = @"true" != 0;
                {
                    sdl_pc = 72;
                    continue;
                }
            },
            71 => {
                {
                    sdl_pc = 72;
                    continue;
                }
            },
            72 => {
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_BACK, pressed_1);
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            73 => {
                pressed_2 = value != @as(Uint32, 0);
                if (pressed_2) {
                    sdl_pc = 74;
                    continue;
                } else {
                    sdl_pc = 75;
                    continue;
                }
            },
            74 => {
                ctx.*.has_separate_guide_button = @"true" != 0;
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
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_GUIDE, pressed_2);
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            77 => {
                if (ctx.*.has_share_button) {
                    sdl_pc = 78;
                    continue;
                } else {
                    sdl_pc = 79;
                    continue;
                }
            },
            78 => {
                pressed_3 = value != @as(Uint32, 0);
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_XBOX_SHARE_BUTTON, pressed_3);
                {
                    sdl_pc = 80;
                    continue;
                }
            },
            79 => {
                {
                    sdl_pc = 80;
                    continue;
                }
            },
            80 => {
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            81 => {
                ctx.*.has_unmapped_state = value == @as(Uint32, 0);
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            82 => {
                if (ctx.*.has_paddles) {
                    sdl_pc = 83;
                    continue;
                } else {
                    sdl_pc = 84;
                    continue;
                }
            },
            83 => {
                if (!ctx.*.has_unmapped_state) {
                    sdl_pc = 86;
                    continue;
                } else {
                    sdl_pc = 87;
                    continue;
                }
            },
            84 => {
                {
                    sdl_pc = 85;
                    continue;
                }
            },
            85 => {
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            86 => {
                value = 0;
                {
                    sdl_pc = 88;
                    continue;
                }
            },
            87 => {
                {
                    sdl_pc = 88;
                    continue;
                }
            },
            88 => {
                button_4 = @bitCast(@as(i8, @truncate(SDL_GAMEPAD_BUTTON_XBOX_SHARE_BUTTON + @as(c_int, @intFromBool(ctx.*.has_share_button)))));
                SDL_SendJoystickButton(timestamp, joystick, blk: {
                    const ref = &button_4;
                    const tmp = ref.*;
                    ref.* +%= 1;
                    break :blk tmp;
                }, (value & @as(Uint32, 1)) != @as(Uint32, 0));
                SDL_SendJoystickButton(timestamp, joystick, blk: {
                    const ref = &button_4;
                    const tmp = ref.*;
                    ref.* +%= 1;
                    break :blk tmp;
                }, (value & @as(Uint32, 2)) != @as(Uint32, 0));
                SDL_SendJoystickButton(timestamp, joystick, blk: {
                    const ref = &button_4;
                    const tmp = ref.*;
                    ref.* +%= 1;
                    break :blk tmp;
                }, (value & @as(Uint32, 4)) != @as(Uint32, 0));
                SDL_SendJoystickButton(timestamp, joystick, blk: {
                    const ref = &button_4;
                    const tmp = ref.*;
                    ref.* +%= 1;
                    break :blk tmp;
                }, (value & @as(Uint32, 8)) != @as(Uint32, 0));
                {
                    sdl_pc = 85;
                    continue;
                }
            },
            89 => {
                HIDAPI_DriverXboxOne_HandleBatteryState(joystick, value);
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            90 => {
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverXboxOne_HandleUnmappedStatePacket(joystick: [*c]SDL_Joystick, ctx: [*c]SDL_DriverXboxOne_Context, data: [*c]Uint8, size: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var profile: Uint8 = undefined;
    _ = &profile;
    var paddle_index: c_int = undefined;
    _ = &paddle_index;
    var button1_bit: c_int = undefined;
    _ = &button1_bit;
    var button2_bit: c_int = undefined;
    _ = &button2_bit;
    var button3_bit: c_int = undefined;
    _ = &button3_bit;
    var button4_bit: c_int = undefined;
    _ = &button4_bit;
    var paddles_mapped: bool = undefined;
    _ = &paddles_mapped;
    var timestamp: Uint64 = SDL_GetTicksNS_REAL();
    _ = &timestamp;
    if (size == @as(c_int, 17)) {
        paddle_index = 14;
        button1_bit = 1;
        button2_bit = 2;
        button3_bit = 4;
        button4_bit = 8;
        profile = data[@as(c_int, 15)];
        if (@as(c_int, profile) == @as(c_int, 0)) {
            paddles_mapped = @"false" != 0;
        } else if (SDL_memcmp_REAL(@ptrCast(@alignCast(&data[@as(c_int, 0)])), @ptrCast(@alignCast(&ctx.*.last_state[@as(c_int, 0)])), 14) == @as(c_int, 0)) {
            paddles_mapped = @"false" != 0;
        } else {
            paddles_mapped = @"true" != 0;
        }
    } else {
        return;
    }
    if (paddles_mapped) {
        data[@bitCast(@as(isize, @intCast(paddle_index)))] = 0;
    }
    if (@as(c_int, ctx.*.last_paddle_state) != @as(c_int, data[@bitCast(@as(isize, @intCast(paddle_index)))])) {
        var nButton: Uint8 = @bitCast(@as(i8, @truncate(SDL_GAMEPAD_BUTTON_XBOX_SHARE_BUTTON + @as(c_int, @intFromBool(ctx.*.has_share_button)))));
        _ = &nButton;
        SDL_SendJoystickButton(timestamp, joystick, blk: {
            const ref = &nButton;
            const tmp = ref.*;
            ref.* +%= 1;
            break :blk tmp;
        }, (@as(c_int, data[@bitCast(@as(isize, @intCast(paddle_index)))]) & button1_bit) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, blk: {
            const ref = &nButton;
            const tmp = ref.*;
            ref.* +%= 1;
            break :blk tmp;
        }, (@as(c_int, data[@bitCast(@as(isize, @intCast(paddle_index)))]) & button2_bit) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, blk: {
            const ref = &nButton;
            const tmp = ref.*;
            ref.* +%= 1;
            break :blk tmp;
        }, (@as(c_int, data[@bitCast(@as(isize, @intCast(paddle_index)))]) & button3_bit) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, blk: {
            const ref = &nButton;
            const tmp = ref.*;
            ref.* +%= 1;
            break :blk tmp;
        }, (@as(c_int, data[@bitCast(@as(isize, @intCast(paddle_index)))]) & button4_bit) != @as(c_int, 0));
        ctx.*.last_paddle_state = data[@bitCast(@as(isize, @intCast(paddle_index)))];
    }
    ctx.*.has_unmapped_state = @"true" != 0;
}
pub fn HIDAPI_DriverXboxOne_HandleStatePacket(joystick: [*c]SDL_Joystick, ctx: [*c]SDL_DriverXboxOne_Context, data: [*c]Uint8, size: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var axis: Sint16 = undefined;
    _ = &axis;
    var timestamp: Uint64 = SDL_GetTicksNS_REAL();
    _ = &timestamp;
    if ((ctx.*.has_paddles and !ctx.*.has_unmapped_state) and (size == @as(c_int, 46))) {
        var packet: [6]Uint8 = [6]Uint8{
            77,
            0,
            0,
            2,
            7,
            0,
        };
        _ = &packet;
        _ = SDL_HIDAPI_SendRumble(ctx.*.device, @ptrCast(@alignCast(&packet)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(packet))))));
    }
    if (@as(c_int, ctx.*.last_state[@as(c_int, 0)]) != @as(c_int, data[@as(c_int, 0)])) {
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_START, (@as(c_int, data[@as(c_int, 0)]) & @as(c_int, 4)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_BACK, (@as(c_int, data[@as(c_int, 0)]) & @as(c_int, 8)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SOUTH, (@as(c_int, data[@as(c_int, 0)]) & @as(c_int, 16)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_EAST, (@as(c_int, data[@as(c_int, 0)]) & @as(c_int, 32)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_WEST, (@as(c_int, data[@as(c_int, 0)]) & @as(c_int, 64)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_NORTH, (@as(c_int, data[@as(c_int, 0)]) & @as(c_int, 128)) != @as(c_int, 0));
    }
    if (@as(c_int, ctx.*.last_state[@as(c_int, 1)]) != @as(c_int, data[@as(c_int, 1)])) {
        var hat: Uint8 = 0;
        _ = &hat;
        if ((@as(c_int, data[@as(c_int, 1)]) & @as(c_int, 1)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_UP);
            }
        }
        if ((@as(c_int, data[@as(c_int, 1)]) & @as(c_int, 2)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_DOWN);
            }
        }
        if ((@as(c_int, data[@as(c_int, 1)]) & @as(c_int, 4)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_LEFT);
            }
        }
        if ((@as(c_int, data[@as(c_int, 1)]) & @as(c_int, 8)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_RIGHT);
            }
        }
        SDL_SendJoystickHat(timestamp, joystick, 0, hat);
        if ((@as(c_int, ctx.*.vendor_id) == USB_VENDOR_RAZER) and (@as(c_int, ctx.*.product_id) == USB_PRODUCT_RAZER_ATROX)) {
            SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_SHOULDER, (@as(c_int, data[@as(c_int, 1)]) & @as(c_int, 32)) != @as(c_int, 0));
            SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER, (@as(c_int, data[@as(c_int, 1)]) & @as(c_int, 16)) != @as(c_int, 0));
        } else {
            SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_SHOULDER, (@as(c_int, data[@as(c_int, 1)]) & @as(c_int, 16)) != @as(c_int, 0));
            SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER, (@as(c_int, data[@as(c_int, 1)]) & @as(c_int, 32)) != @as(c_int, 0));
        }
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_STICK, (@as(c_int, data[@as(c_int, 1)]) & @as(c_int, 64)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_STICK, (@as(c_int, data[@as(c_int, 1)]) & @as(c_int, 128)) != @as(c_int, 0));
    }
    if (ctx.*.has_share_button) {
        if (size < @as(c_int, 44)) {
            if (@as(c_int, ctx.*.last_state[@as(c_int, 14)]) != @as(c_int, data[@as(c_int, 14)])) {
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_XBOX_SHARE_BUTTON, (@as(c_int, data[@as(c_int, 14)]) & @as(c_int, 1)) != @as(c_int, 0));
            }
        } else if (size == @as(c_int, 44)) {
            if (@as(c_int, ctx.*.last_state[@as(c_int, 18)]) != @as(c_int, data[@as(c_int, 18)])) {
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_XBOX_SHARE_BUTTON, (@as(c_int, data[@as(c_int, 18)]) & @as(c_int, 1)) != @as(c_int, 0));
            }
        } else if (size == @as(c_int, 46)) {
            if (@as(c_int, ctx.*.last_state[@as(c_int, 28)]) != @as(c_int, data[@as(c_int, 28)])) {
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_XBOX_SHARE_BUTTON, (@as(c_int, data[@as(c_int, 28)]) & @as(c_int, 1)) != @as(c_int, 0));
            }
        } else if (size == @as(c_int, 60)) {
            if (@as(c_int, ctx.*.last_state[@as(c_int, 42)]) != @as(c_int, data[@as(c_int, 42)])) {
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_XBOX_SHARE_BUTTON, (@as(c_int, data[@as(c_int, 42)]) & @as(c_int, 1)) != @as(c_int, 0));
            }
        }
    }
    if ((ctx.*.has_paddles and !ctx.*.has_unmapped_state) and ((((size == @as(c_int, 29)) or (size == @as(c_int, 34))) or (size == @as(c_int, 46))) or (size == @as(c_int, 47)))) {
        var paddle_index: c_int = undefined;
        _ = &paddle_index;
        var button1_bit: c_int = undefined;
        _ = &button1_bit;
        var button2_bit: c_int = undefined;
        _ = &button2_bit;
        var button3_bit: c_int = undefined;
        _ = &button3_bit;
        var button4_bit: c_int = undefined;
        _ = &button4_bit;
        var paddles_mapped: bool = undefined;
        _ = &paddles_mapped;
        if (size == @as(c_int, 29)) {
            paddle_index = 28;
            button1_bit = 2;
            button2_bit = 8;
            button3_bit = 1;
            button4_bit = 4;
            paddles_mapped = SDL_memcmp_REAL(@ptrCast(@alignCast(&data[@as(c_int, 0)])), @ptrCast(@alignCast(&data[@as(c_int, 14)])), 2) != @as(c_int, 0);
        } else if (size == @as(c_int, 34)) {
            paddle_index = 14;
            button1_bit = 1;
            button2_bit = 2;
            button3_bit = 4;
            button4_bit = 8;
            paddles_mapped = @as(c_int, data[@as(c_int, 15)]) != @as(c_int, 0);
        } else if (size == @as(c_int, 46)) {
            paddle_index = 18;
            button1_bit = 1;
            button2_bit = 2;
            button3_bit = 4;
            button4_bit = 8;
            paddles_mapped = @as(c_int, data[@as(c_int, 19)]) != @as(c_int, 0);
        } else {
            paddle_index = 14;
            button1_bit = 1;
            button2_bit = 2;
            button3_bit = 4;
            button4_bit = 8;
            paddles_mapped = @as(c_int, data[@as(c_int, 20)]) != @as(c_int, 0);
        }
        if (paddles_mapped) {
            data[@bitCast(@as(isize, @intCast(paddle_index)))] = 0;
        }
        if (@as(c_int, ctx.*.last_paddle_state) != @as(c_int, data[@bitCast(@as(isize, @intCast(paddle_index)))])) {
            var nButton: Uint8 = @bitCast(@as(i8, @truncate(SDL_GAMEPAD_BUTTON_XBOX_SHARE_BUTTON + @as(c_int, @intFromBool(ctx.*.has_share_button)))));
            _ = &nButton;
            SDL_SendJoystickButton(timestamp, joystick, blk: {
                const ref = &nButton;
                const tmp = ref.*;
                ref.* +%= 1;
                break :blk tmp;
            }, (@as(c_int, data[@bitCast(@as(isize, @intCast(paddle_index)))]) & button1_bit) != @as(c_int, 0));
            SDL_SendJoystickButton(timestamp, joystick, blk: {
                const ref = &nButton;
                const tmp = ref.*;
                ref.* +%= 1;
                break :blk tmp;
            }, (@as(c_int, data[@bitCast(@as(isize, @intCast(paddle_index)))]) & button2_bit) != @as(c_int, 0));
            SDL_SendJoystickButton(timestamp, joystick, blk: {
                const ref = &nButton;
                const tmp = ref.*;
                ref.* +%= 1;
                break :blk tmp;
            }, (@as(c_int, data[@bitCast(@as(isize, @intCast(paddle_index)))]) & button3_bit) != @as(c_int, 0));
            SDL_SendJoystickButton(timestamp, joystick, blk: {
                const ref = &nButton;
                const tmp = ref.*;
                ref.* +%= 1;
                break :blk tmp;
            }, (@as(c_int, data[@bitCast(@as(isize, @intCast(paddle_index)))]) & button4_bit) != @as(c_int, 0));
            ctx.*.last_paddle_state = data[@bitCast(@as(isize, @intCast(paddle_index)))];
        }
    }
    axis = @truncate((@as(c_int, @as(Sint16, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 2)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 3)])) << @intCast(@as(c_int, 8)))))) * @as(c_int, 64)) - @as(c_int, 32768));
    if (@as(c_int, axis) == @as(c_int, 32704)) {
        axis = 32767;
    }
    if (((@as(c_int, axis) == -@as(c_int, 32768)) and (size == @as(c_int, 26))) and ((@as(c_int, data[@as(c_int, 18)]) & @as(c_int, 128)) != 0)) {
        axis = 32767;
    }
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFT_TRIGGER, axis);
    axis = @truncate((@as(c_int, @as(Sint16, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 4)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 5)])) << @intCast(@as(c_int, 8)))))) * @as(c_int, 64)) - @as(c_int, 32768));
    if (((@as(c_int, axis) == -@as(c_int, 32768)) and (size == @as(c_int, 26))) and ((@as(c_int, data[@as(c_int, 18)]) & @as(c_int, 64)) != 0)) {
        axis = 32767;
    }
    if (@as(c_int, axis) == @as(c_int, 32704)) {
        axis = 32767;
    }
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHT_TRIGGER, axis);
    axis = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 6)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 7)])) << @intCast(@as(c_int, 8))));
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, axis);
    axis = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 8)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 9)])) << @intCast(@as(c_int, 8))));
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, @truncate(~@as(c_int, axis)));
    axis = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 10)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 11)])) << @intCast(@as(c_int, 8))));
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, axis);
    axis = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 12)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 13)])) << @intCast(@as(c_int, 8))));
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, @truncate(~@as(c_int, axis)));
    _ = memcpy(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.last_state))))), @ptrCast(@alignCast(data)), if (@as(c_ulong, @bitCast(@as(c_long, size))) < @sizeOf(@TypeOf(ctx.*.last_state))) @as(c_ulong, @bitCast(@as(c_long, size))) else @sizeOf(@TypeOf(ctx.*.last_state)));
    ctx.*.has_unmapped_state = @"false" != 0;
}
pub fn HIDAPI_DriverXboxOne_HandleStatusPacket(ctx: [*c]SDL_DriverXboxOne_Context, _: [*c]const Uint8, _: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (ctx.*.init_state < @as(SDL_XboxOneInitState, XBOX_ONE_INIT_STATE_COMPLETE)) {
        SetInitState(ctx, XBOX_ONE_INIT_STATE_COMPLETE);
    }
}
pub fn HIDAPI_DriverXboxOne_HandleModePacket(joystick: [*c]SDL_Joystick, _: [*c]SDL_DriverXboxOne_Context, data: [*c]const Uint8, _: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var timestamp: Uint64 = SDL_GetTicksNS_REAL();
    _ = &timestamp;
    SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_GUIDE, (@as(c_int, data[@as(c_int, 0)]) & @as(c_int, 1)) != @as(c_int, 0));
}
pub fn HIDAPI_DriverXboxOneBluetooth_HandleButtons16(timestamp: Uint64, joystick: [*c]SDL_Joystick, ctx: [*c]SDL_DriverXboxOne_Context, data: [*c]const Uint8, _: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (@as(c_int, ctx.*.last_state[@as(c_int, 14)]) != @as(c_int, data[@as(c_int, 14)])) {
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SOUTH, (@as(c_int, data[@as(c_int, 14)]) & @as(c_int, 1)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_EAST, (@as(c_int, data[@as(c_int, 14)]) & @as(c_int, 2)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_WEST, (@as(c_int, data[@as(c_int, 14)]) & @as(c_int, 4)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_NORTH, (@as(c_int, data[@as(c_int, 14)]) & @as(c_int, 8)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_SHOULDER, (@as(c_int, data[@as(c_int, 14)]) & @as(c_int, 16)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER, (@as(c_int, data[@as(c_int, 14)]) & @as(c_int, 32)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_BACK, (@as(c_int, data[@as(c_int, 14)]) & @as(c_int, 64)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_START, (@as(c_int, data[@as(c_int, 14)]) & @as(c_int, 128)) != @as(c_int, 0));
    }
    if (@as(c_int, ctx.*.last_state[@as(c_int, 15)]) != @as(c_int, data[@as(c_int, 15)])) {
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_STICK, (@as(c_int, data[@as(c_int, 15)]) & @as(c_int, 1)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_STICK, (@as(c_int, data[@as(c_int, 15)]) & @as(c_int, 2)) != @as(c_int, 0));
    }
}
pub fn HIDAPI_DriverXboxOneBluetooth_HandleButtons(timestamp: Uint64, joystick: [*c]SDL_Joystick, ctx: [*c]SDL_DriverXboxOne_Context, data: [*c]Uint8, size: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (@as(c_int, ctx.*.last_state[@as(c_int, 14)]) != @as(c_int, data[@as(c_int, 14)])) {
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SOUTH, (@as(c_int, data[@as(c_int, 14)]) & @as(c_int, 1)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_EAST, (@as(c_int, data[@as(c_int, 14)]) & @as(c_int, 2)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_WEST, (@as(c_int, data[@as(c_int, 14)]) & @as(c_int, 8)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_NORTH, (@as(c_int, data[@as(c_int, 14)]) & @as(c_int, 16)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_SHOULDER, (@as(c_int, data[@as(c_int, 14)]) & @as(c_int, 64)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER, (@as(c_int, data[@as(c_int, 14)]) & @as(c_int, 128)) != @as(c_int, 0));
    }
    if (@as(c_int, ctx.*.last_state[@as(c_int, 15)]) != @as(c_int, data[@as(c_int, 15)])) {
        if (!ctx.*.has_guide_packet) {
            SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_GUIDE, (@as(c_int, data[@as(c_int, 15)]) & @as(c_int, 16)) != @as(c_int, 0));
        }
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_START, (@as(c_int, data[@as(c_int, 15)]) & @as(c_int, 8)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_STICK, (@as(c_int, data[@as(c_int, 15)]) & @as(c_int, 32)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_STICK, (@as(c_int, data[@as(c_int, 15)]) & @as(c_int, 64)) != @as(c_int, 0));
    }
    if (ctx.*.has_share_button) {
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_BACK, (@as(c_int, data[@as(c_int, 15)]) & @as(c_int, 4)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_XBOX_SHARE_BUTTON, (@as(c_int, data[@as(c_int, 16)]) & @as(c_int, 1)) != @as(c_int, 0));
    } else {
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_BACK, ((@as(c_int, data[@as(c_int, 15)]) & @as(c_int, 4)) != 0) or ((@as(c_int, data[@as(c_int, 16)]) & @as(c_int, 1)) != @as(c_int, 0)));
    }
    if (ctx.*.has_paddles and (((size == @as(c_int, 20)) or (size == @as(c_int, 39))) or (size == @as(c_int, 55)))) {
        var paddle_index: c_int = undefined;
        _ = &paddle_index;
        var button1_bit: c_int = undefined;
        _ = &button1_bit;
        var button2_bit: c_int = undefined;
        _ = &button2_bit;
        var button3_bit: c_int = undefined;
        _ = &button3_bit;
        var button4_bit: c_int = undefined;
        _ = &button4_bit;
        var paddles_mapped: bool = undefined;
        _ = &paddles_mapped;
        if (size == @as(c_int, 55)) {
            paddle_index = 33;
            button1_bit = 1;
            button2_bit = 2;
            button3_bit = 4;
            button4_bit = 8;
            paddles_mapped = @as(c_int, data[@as(c_int, 35)]) != @as(c_int, 0);
        } else if (size == @as(c_int, 39)) {
            paddle_index = 17;
            button1_bit = 1;
            button2_bit = 2;
            button3_bit = 4;
            button4_bit = 8;
            paddles_mapped = @as(c_int, data[@as(c_int, 19)]) != @as(c_int, 0);
        } else {
            paddle_index = 19;
            button1_bit = 1;
            button2_bit = 2;
            button3_bit = 4;
            button4_bit = 8;
            paddles_mapped = @as(c_int, data[@as(c_int, 17)]) != @as(c_int, 0);
        }
        if (paddles_mapped) {
            data[@bitCast(@as(isize, @intCast(paddle_index)))] = 0;
        }
        if (@as(c_int, ctx.*.last_paddle_state) != @as(c_int, data[@bitCast(@as(isize, @intCast(paddle_index)))])) {
            var nButton: Uint8 = SDL_GAMEPAD_BUTTON_XBOX_SHARE_BUTTON;
            _ = &nButton;
            SDL_SendJoystickButton(timestamp, joystick, blk: {
                const ref = &nButton;
                const tmp = ref.*;
                ref.* +%= 1;
                break :blk tmp;
            }, (@as(c_int, data[@bitCast(@as(isize, @intCast(paddle_index)))]) & button1_bit) != @as(c_int, 0));
            SDL_SendJoystickButton(timestamp, joystick, blk: {
                const ref = &nButton;
                const tmp = ref.*;
                ref.* +%= 1;
                break :blk tmp;
            }, (@as(c_int, data[@bitCast(@as(isize, @intCast(paddle_index)))]) & button2_bit) != @as(c_int, 0));
            SDL_SendJoystickButton(timestamp, joystick, blk: {
                const ref = &nButton;
                const tmp = ref.*;
                ref.* +%= 1;
                break :blk tmp;
            }, (@as(c_int, data[@bitCast(@as(isize, @intCast(paddle_index)))]) & button3_bit) != @as(c_int, 0));
            SDL_SendJoystickButton(timestamp, joystick, blk: {
                const ref = &nButton;
                const tmp = ref.*;
                ref.* +%= 1;
                break :blk tmp;
            }, (@as(c_int, data[@bitCast(@as(isize, @intCast(paddle_index)))]) & button4_bit) != @as(c_int, 0));
            ctx.*.last_paddle_state = data[@bitCast(@as(isize, @intCast(paddle_index)))];
        }
    }
}
pub fn HIDAPI_DriverXboxOneBluetooth_HandleStatePacket(joystick: [*c]SDL_Joystick, ctx: [*c]SDL_DriverXboxOne_Context, data: [*c]Uint8, size: c_int) callconv(.c) void {
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
                if (size == @as(c_int, 16)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                HIDAPI_DriverXboxOneBluetooth_HandleButtons16(timestamp, joystick, ctx, data, size);
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            2 => {
                if (size > @as(c_int, 16)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            3 => {
                if (@as(c_int, ctx.*.last_state[@as(c_int, 13)]) != @as(c_int, data[@as(c_int, 13)])) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            4 => {
                HIDAPI_DriverXboxOneBluetooth_HandleButtons(timestamp, joystick, ctx, data, size);
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                return;
            },
            6 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            7 => {
                switch (@as(c_int, data[@as(c_int, 13)])) {
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
                    @as(c_int, 8) => {
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
                axis = @truncate((@as(c_int, @as(Sint16, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 9)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 10)])) << @intCast(@as(c_int, 8)))))) * @as(c_int, 64)) - @as(c_int, 32768));
                if (@as(c_int, axis) == @as(c_int, 32704)) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
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
            20 => {
                axis = 32767;
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
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFT_TRIGGER, axis);
                axis = @truncate((@as(c_int, @as(Sint16, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 11)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 12)])) << @intCast(@as(c_int, 8)))))) * @as(c_int, 64)) - @as(c_int, 32768));
                if (@as(c_int, axis) == @as(c_int, 32704)) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                axis = 32767;
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
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHT_TRIGGER, axis);
                axis = @truncate(@as(c_int, @as(Uint16, @bitCast(@as(c_short, @as(Sint16, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 1)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 2)])) << @intCast(@as(c_int, 8))))))))) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, axis);
                axis = @truncate(@as(c_int, @as(Uint16, @bitCast(@as(c_short, @as(Sint16, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 3)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 4)])) << @intCast(@as(c_int, 8))))))))) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, axis);
                axis = @truncate(@as(c_int, @as(Uint16, @bitCast(@as(c_short, @as(Sint16, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 5)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 6)])) << @intCast(@as(c_int, 8))))))))) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, axis);
                axis = @truncate(@as(c_int, @as(Uint16, @bitCast(@as(c_short, @as(Sint16, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 7)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 8)])) << @intCast(@as(c_int, 8))))))))) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, axis);
                _ = memcpy(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.last_state))))), @ptrCast(@alignCast(data)), if (@as(c_ulong, @bitCast(@as(c_long, size))) < @sizeOf(@TypeOf(ctx.*.last_state))) @as(c_ulong, @bitCast(@as(c_long, size))) else @sizeOf(@TypeOf(ctx.*.last_state)));
                {}
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverXboxOneBluetooth_HandleGuidePacket(joystick: [*c]SDL_Joystick, ctx: [*c]SDL_DriverXboxOne_Context, data: [*c]const Uint8, _: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var timestamp: Uint64 = SDL_GetTicksNS_REAL();
    _ = &timestamp;
    ctx.*.has_guide_packet = @"true" != 0;
    SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_GUIDE, (@as(c_int, data[@as(c_int, 1)]) & @as(c_int, 1)) != @as(c_int, 0));
}
pub fn HIDAPI_DriverXboxOneBluetooth_HandleBatteryPacket(joystick: [*c]SDL_Joystick, _: [*c]SDL_DriverXboxOne_Context, data: [*c]const Uint8, _: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    HIDAPI_DriverXboxOne_HandleBatteryState(joystick, data[@as(c_int, 1)]);
}
pub fn HIDAPI_DriverXboxOne_HandleSerialIDPacket(ctx: [*c]SDL_DriverXboxOne_Context, data: [*c]const Uint8, _: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var serial: [29]u8 = undefined;
    _ = &serial;
    var i: c_int = undefined;
    _ = &i;
    {
        i = 0;
        while (i < @as(c_int, 14)) : (i += 1) {
            _ = SDL_uitoa_REAL(data[@bitCast(@as(isize, @intCast(@as(c_int, 2) + i)))], &serial[@bitCast(@as(isize, @intCast(i * @as(c_int, 2))))], 16);
        }
    }
    serial[@bitCast(@as(isize, @intCast(i * @as(c_int, 2))))] = '\x00';
    HIDAPI_SetDeviceSerial(ctx.*.device, @ptrCast(@alignCast(&serial)));
}
pub fn HIDAPI_DriverXboxOne_UpdateInitState(ctx: [*c]SDL_DriverXboxOne_Context) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var prev_state: SDL_XboxOneInitState = undefined;
    _ = &prev_state;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            1 => {
                prev_state = ctx.*.init_state;
                switch (ctx.*.init_state) {
                    @as(SDL_XboxOneInitState, XBOX_ONE_INIT_STATE_ANNOUNCED) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_XboxOneInitState, XBOX_ONE_INIT_STATE_IDENTIFYING) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(SDL_XboxOneInitState, XBOX_ONE_INIT_STATE_STARTUP) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(SDL_XboxOneInitState, XBOX_ONE_INIT_STATE_PREPARE_INPUT) => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(SDL_XboxOneInitState, XBOX_ONE_INIT_STATE_COMPLETE) => {
                        sdl_pc = 21;
                        continue;
                    },
                    else => {
                        sdl_pc = 4;
                        continue;
                    },
                }
            },
            2 => {
                if (ctx.*.init_state != prev_state) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                return @"true" != 0;
            },
            4 => {
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            5 => {
                if (false) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 7;
                    continue;
                }
            },
            6 => {
                SetInitState(ctx, XBOX_ONE_INIT_STATE_COMPLETE);
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                _ = SendIdentificationRequest(ctx);
                SetInitState(ctx, XBOX_ONE_INIT_STATE_IDENTIFYING);
                {
                    sdl_pc = 8;
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
                if (SDL_GetTicks_REAL() >= (ctx.*.send_time +% @as(Uint64, CONTROLLER_IDENTIFY_TIMEOUT_MS))) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                SetInitState(ctx, XBOX_ONE_INIT_STATE_STARTUP);
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
                    sdl_pc = 4;
                    continue;
                }
            },
            13 => {
                if (false) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                SetInitState(ctx, XBOX_ONE_INIT_STATE_COMPLETE);
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            15 => {
                _ = SendControllerStartup(ctx);
                SetInitState(ctx, XBOX_ONE_INIT_STATE_PREPARE_INPUT);
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            17 => {
                if (SDL_GetTicks_REAL() >= (ctx.*.send_time +% @as(Uint64, CONTROLLER_PREPARE_INPUT_TIMEOUT_MS))) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            18 => {
                SetInitState(ctx, XBOX_ONE_INIT_STATE_COMPLETE);
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
                    sdl_pc = 4;
                    continue;
                }
            },
            21 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub const struct_gip_header = extern struct {
    command: Uint8 align(1) = 0,
    options: Uint8 = 0,
    sequence: Uint8 = 0,
    packet_length: Uint32 align(1) = 0,
    chunk_offset: Uint32 align(1) = 0,
};
pub const struct_gip_pkt_acknowledge = extern struct {
    unknown: Uint8 align(1) = 0,
    command: Uint8 = 0,
    options: Uint8 = 0,
    length: Uint16 align(1) = 0,
    padding: [2]Uint8 = @import("std").mem.zeroes([2]Uint8),
    remaining: Uint16 align(1) = 0,
};
pub fn EncodeVariableInt(buf: [*c]Uint8, arg_val: Uint32) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var val = arg_val;
    _ = &val;
    var i: c_int = undefined;
    _ = &i;
    {
        i = 0;
        while (@as(c_ulong, @bitCast(@as(c_long, i))) < @sizeOf(@TypeOf(val))) : (i += 1) {
            buf[@bitCast(@as(isize, @intCast(i)))] = @truncate(val);
            if (val > @as(Uint32, 127)) {
                {
                    const ref = &buf[@bitCast(@as(isize, @intCast(i)))];
                    ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | @as(c_int, 128))));
                }
            }
            val >>= @intCast(@as(Uint32, 7));
            if (!(val != 0)) {
                break;
            }
        }
    }
    return i + @as(c_int, 1);
}
pub fn DecodeVariableInt(data: [*c]const Uint8, len: c_int, out: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var val: Uint32 = 0;
    _ = &val;
    {
        i = 0;
        while ((@as(c_ulong, @bitCast(@as(c_long, i))) < @sizeOf(@TypeOf(val))) and (i < len)) : (i += 1) {
            val |= @bitCast(@as(c_int, (@as(c_int, data[@bitCast(@as(isize, @intCast(i)))]) & @as(c_int, 127)) << @intCast(i * @as(c_int, 7))));
            if (!((@as(c_int, data[@bitCast(@as(isize, @intCast(i)))]) & @as(c_int, 128)) != 0)) {
                break;
            }
        }
    }
    _ = memcpy(out, @ptrCast(@alignCast(&val)), @sizeOf(@TypeOf(val)));
    return i + @as(c_int, 1);
}
pub fn HIDAPI_GIP_GetActualHeaderLength(hdr: [*c]struct_gip_header) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var pkt_len: Uint32 = hdr.*.packet_length;
    _ = &pkt_len;
    var chunk_offset: Uint32 = hdr.*.chunk_offset;
    _ = &chunk_offset;
    var len: c_int = GIP_HEADER_MIN_LENGTH;
    _ = &len;
    while (true) {
        len += 1;
        pkt_len >>= @intCast(@as(Uint32, 7));
        if (!(pkt_len != 0)) break;
    }
    if ((@as(c_int, hdr.*.options) & GIP_OPT_CHUNK) != 0) {
        while (chunk_offset != 0) {
            len += 1;
            chunk_offset >>= @intCast(@as(Uint32, 7));
        }
    }
    return len;
}
pub fn HIDAPI_GIP_GetHeaderLength(hdr: [*c]struct_gip_header) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var len: c_int = HIDAPI_GIP_GetActualHeaderLength(hdr);
    _ = &len;
    return len + __helpers.signedRemainder(len, @as(c_int, 2));
}
pub fn HIDAPI_GIP_EncodeHeader(hdr: [*c]struct_gip_header, buf: [*c]Uint8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var hdr_len: c_int = 0;
    _ = &hdr_len;
    buf[
        @bitCast(@as(isize, @intCast(blk: {
            const ref = &hdr_len;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        })))
    ] = hdr.*.command;
    buf[
        @bitCast(@as(isize, @intCast(blk: {
            const ref = &hdr_len;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        })))
    ] = hdr.*.options;
    buf[
        @bitCast(@as(isize, @intCast(blk: {
            const ref = &hdr_len;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        })))
    ] = hdr.*.sequence;
    hdr_len += EncodeVariableInt(buf + @as(usize, @bitCast(@as(isize, @intCast(hdr_len)))), hdr.*.packet_length);
    if (__helpers.signedRemainder(HIDAPI_GIP_GetActualHeaderLength(hdr), @as(c_int, 2)) != 0) {
        {
            const ref = &buf[@bitCast(@as(isize, @intCast(hdr_len - @as(c_int, 1))))];
            ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | @as(c_int, 128))));
        }
        buf[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &hdr_len;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = 0;
    }
    if ((@as(c_int, hdr.*.options) & GIP_OPT_CHUNK) != 0) {
        _ = EncodeVariableInt(buf + @as(usize, @bitCast(@as(isize, @intCast(hdr_len)))), hdr.*.chunk_offset);
    }
}
pub fn HIDAPI_GIP_DecodeHeader(hdr: [*c]struct_gip_header, data: [*c]const Uint8, len: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var hdr_len: c_int = 0;
    _ = &hdr_len;
    hdr.*.command = data[
        @bitCast(@as(isize, @intCast(blk: {
            const ref = &hdr_len;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        })))
    ];
    hdr.*.options = data[
        @bitCast(@as(isize, @intCast(blk: {
            const ref = &hdr_len;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        })))
    ];
    hdr.*.sequence = data[
        @bitCast(@as(isize, @intCast(blk: {
            const ref = &hdr_len;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        })))
    ];
    hdr.*.packet_length = 0;
    hdr.*.chunk_offset = 0;
    hdr_len += DecodeVariableInt(data + @as(usize, @bitCast(@as(isize, @intCast(hdr_len)))), len - hdr_len, @ptrCast(@alignCast(&hdr.*.packet_length)));
    if ((@as(c_int, hdr.*.options) & GIP_OPT_CHUNK) != 0) {
        hdr_len += DecodeVariableInt(data + @as(usize, @bitCast(@as(isize, @intCast(hdr_len)))), len - hdr_len, @ptrCast(@alignCast(&hdr.*.chunk_offset)));
    }
    return hdr_len;
}
pub fn HIDAPI_GIP_SendPacket(ctx: [*c]SDL_DriverXboxOne_Context, hdr: [*c]struct_gip_header, data: ?*const anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var packet: [64]Uint8 = undefined;
    _ = &packet;
    var hdr_len: c_int = undefined;
    _ = &hdr_len;
    var size: c_int = undefined;
    _ = &size;
    hdr_len = HIDAPI_GIP_GetHeaderLength(hdr);
    size = @bitCast(@as(c_uint, @truncate(@as(Uint32, @bitCast(@as(c_int, hdr_len))) +% hdr.*.packet_length)));
    if (@as(c_ulong, @bitCast(@as(c_long, size))) > @sizeOf(@TypeOf(packet))) {
        _ = SDL_SetError_REAL("Couldn't send GIP packet, size (%d) too large", size);
        return @"false" != 0;
    }
    if (!(@as(c_int, hdr.*.sequence) != 0)) {
        hdr.*.sequence = GetNextPacketSequence(ctx);
    }
    HIDAPI_GIP_EncodeHeader(hdr, @ptrCast(@alignCast(&packet)));
    if (data != null) {
        _ = memcpy(@ptrCast(@alignCast(&packet[@bitCast(@as(isize, @intCast(hdr_len)))])), data, hdr.*.packet_length);
    }
    if (!SendProtocolPacket(ctx, @ptrCast(@alignCast(&packet)), size)) {
        _ = SDL_SetError_REAL("Couldn't send protocol packet");
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn HIDAPI_GIP_AcknowledgePacket(ctx: [*c]SDL_DriverXboxOne_Context, ack: [*c]struct_gip_header) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (false) {
        return @"true" != 0;
    } else {
        var hdr: struct_gip_header = undefined;
        _ = &hdr;
        var pkt: struct_gip_pkt_acknowledge = undefined;
        _ = &pkt;
        _ = memset(@ptrCast(@alignCast(&hdr)), 0, @sizeOf(@TypeOf(hdr)));
        hdr.command = GIP_CMD_ACKNOWLEDGE;
        hdr.options = GIP_OPT_INTERNAL;
        hdr.sequence = ack.*.sequence;
        hdr.packet_length = @truncate(@sizeOf(@TypeOf(pkt)));
        _ = memset(@ptrCast(@alignCast(&pkt)), 0, @sizeOf(@TypeOf(pkt)));
        pkt.command = ack.*.command;
        pkt.options = GIP_OPT_INTERNAL;
        pkt.length = @as(Uint16, @truncate(ack.*.chunk_offset +% ack.*.packet_length));
        if (((@as(c_int, ack.*.options) & GIP_OPT_CHUNK) != 0) and (ctx.*.chunk_buffer != null)) {
            pkt.remaining = @as(Uint16, @truncate(ctx.*.chunk_length -% @as(Uint32, @bitCast(@as(c_int, @as(c_int, pkt.length))))));
        }
        return HIDAPI_GIP_SendPacket(ctx, &hdr, @ptrCast(@alignCast(&pkt)));
    }
}
pub fn HIDAPI_GIP_DispatchPacket(joystick: [*c]SDL_Joystick, ctx: [*c]SDL_DriverXboxOne_Context, hdr: [*c]struct_gip_header, data: [*c]Uint8, size: Uint32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if ((@as(c_int, hdr.*.options) & @as(c_int, 15)) != @as(c_int, 0)) {
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
                if ((@as(c_int, hdr.*.options) & GIP_OPT_INTERNAL) != 0) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                switch (@as(c_int, hdr.*.command)) {
                    GIP_CMD_ACKNOWLEDGE => {
                        sdl_pc = 8;
                        continue;
                    },
                    GIP_CMD_ANNOUNCE => {
                        sdl_pc = 9;
                        continue;
                    },
                    GIP_CMD_STATUS => {
                        sdl_pc = 10;
                        continue;
                    },
                    GIP_CMD_IDENTIFY => {
                        sdl_pc = 11;
                        continue;
                    },
                    GIP_CMD_POWER => {
                        sdl_pc = 12;
                        continue;
                    },
                    GIP_CMD_AUTHENTICATE => {
                        sdl_pc = 13;
                        continue;
                    },
                    GIP_CMD_VIRTUAL_KEY => {
                        sdl_pc = 14;
                        continue;
                    },
                    GIP_CMD_SERIAL_NUMBER => {
                        sdl_pc = 18;
                        continue;
                    },
                    else => {
                        sdl_pc = 19;
                        continue;
                    },
                }
            },
            5 => {
                switch (@as(c_int, hdr.*.command)) {
                    GIP_CMD_INPUT => {
                        sdl_pc = 21;
                        continue;
                    },
                    GIP_CMD_UNMAPPED_STATE => {
                        sdl_pc = 28;
                        continue;
                    },
                    else => {
                        sdl_pc = 32;
                        continue;
                    },
                }
            },
            6 => {
                return @"true" != 0;
            },
            7 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            8 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            9 => {
                SetInitState(ctx, XBOX_ONE_INIT_STATE_ANNOUNCED);
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            10 => {
                HIDAPI_DriverXboxOne_HandleStatusPacket(ctx, data, @bitCast(@as(c_uint, @truncate(size))));
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            11 => {
                SetInitState(ctx, XBOX_ONE_INIT_STATE_STARTUP);
                {
                    sdl_pc = 7;
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
                    sdl_pc = 7;
                    continue;
                }
            },
            14 => {
                if (!(joystick != null)) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            15 => {
                {
                    sdl_pc = 7;
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
                HIDAPI_DriverXboxOne_HandleModePacket(joystick, ctx, data, @bitCast(@as(c_uint, @truncate(size))));
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            18 => {
                HIDAPI_DriverXboxOne_HandleSerialIDPacket(ctx, data, @bitCast(@as(c_uint, @truncate(size))));
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
            20 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            21 => {
                if (ctx.*.init_state < @as(SDL_XboxOneInitState, XBOX_ONE_INIT_STATE_COMPLETE)) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            22 => {
                SetInitState(ctx, XBOX_ONE_INIT_STATE_COMPLETE);
                {
                    sdl_pc = 20;
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
                if (!(joystick != null)) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            25 => {
                {
                    sdl_pc = 20;
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
                HIDAPI_DriverXboxOne_HandleStatePacket(joystick, ctx, data, @bitCast(@as(c_uint, @truncate(size))));
                {
                    sdl_pc = 20;
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
                {
                    sdl_pc = 20;
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
                HIDAPI_DriverXboxOne_HandleUnmappedStatePacket(joystick, ctx, data, @bitCast(@as(c_uint, @truncate(size))));
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            32 => {
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_GIP_DestroyChunkBuffer(ctx: [*c]SDL_DriverXboxOne_Context) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (ctx.*.chunk_buffer != null) {
        SDL_free_REAL(@ptrCast(@alignCast(ctx.*.chunk_buffer)));
        ctx.*.chunk_buffer = null;
        ctx.*.chunk_length = 0;
    }
}
pub fn HIDAPI_GIP_CreateChunkBuffer(ctx: [*c]SDL_DriverXboxOne_Context, size: Uint32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    HIDAPI_GIP_DestroyChunkBuffer(ctx);
    ctx.*.chunk_buffer = @ptrCast(@alignCast(SDL_malloc_REAL(size)));
    if (ctx.*.chunk_buffer != null) {
        ctx.*.chunk_length = size;
        return @"true" != 0;
    } else {
        return @"false" != 0;
    }
}
pub fn HIDAPI_GIP_ProcessPacketChunked(joystick: [*c]SDL_Joystick, ctx: [*c]SDL_DriverXboxOne_Context, hdr: [*c]struct_gip_header, data: [*c]Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var result: bool = undefined;
    _ = &result;
    if (!(ctx.*.chunk_buffer != null)) {
        return @"false" != 0;
    }
    if ((hdr.*.chunk_offset +% hdr.*.packet_length) > ctx.*.chunk_length) {
        return @"false" != 0;
    }
    if (hdr.*.packet_length != 0) {
        _ = memcpy(@ptrCast(@alignCast(ctx.*.chunk_buffer + hdr.*.chunk_offset)), @ptrCast(@alignCast(data)), hdr.*.packet_length);
        return @"true" != 0;
    }
    result = HIDAPI_GIP_DispatchPacket(joystick, ctx, hdr, ctx.*.chunk_buffer, ctx.*.chunk_length);
    HIDAPI_GIP_DestroyChunkBuffer(ctx);
    return result;
}
pub fn HIDAPI_GIP_ProcessPacket(joystick: [*c]SDL_Joystick, ctx: [*c]SDL_DriverXboxOne_Context, hdr: [*c]struct_gip_header, data: [*c]Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if ((@as(c_int, hdr.*.options) & GIP_OPT_CHUNK_START) != 0) {
        if (!HIDAPI_GIP_CreateChunkBuffer(ctx, hdr.*.chunk_offset)) {
            return @"false" != 0;
        }
        ctx.*.chunk_length = hdr.*.chunk_offset;
        hdr.*.chunk_offset = 0;
    }
    if ((@as(c_int, hdr.*.options) & GIP_OPT_ACKNOWLEDGE) != 0) {
        if (!HIDAPI_GIP_AcknowledgePacket(ctx, hdr)) {
            return @"false" != 0;
        }
    }
    if ((@as(c_int, hdr.*.options) & GIP_OPT_CHUNK) != 0) {
        return HIDAPI_GIP_ProcessPacketChunked(joystick, ctx, hdr, data);
    } else {
        return HIDAPI_GIP_DispatchPacket(joystick, ctx, hdr, data, hdr.*.packet_length);
    }
}
pub fn HIDAPI_GIP_ProcessData(joystick: [*c]SDL_Joystick, ctx: [*c]SDL_DriverXboxOne_Context, arg_data: [*c]Uint8, arg_size: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var data = arg_data;
    _ = &data;
    var size = arg_size;
    _ = &size;
    var hdr: struct_gip_header = undefined;
    _ = &hdr;
    var hdr_len: c_int = undefined;
    _ = &hdr_len;
    while (size > GIP_HEADER_MIN_LENGTH) {
        hdr_len = HIDAPI_GIP_DecodeHeader(&hdr, data, size);
        if ((@as(Uint32, @bitCast(@as(c_int, hdr_len))) +% hdr.packet_length) > @as(Uint32, @bitCast(@as(c_int, size)))) {
            hdr.packet_length = @bitCast(@as(c_int, size - hdr_len));
        }
        if (!HIDAPI_GIP_ProcessPacket(joystick, ctx, &hdr, data + @as(usize, @bitCast(@as(isize, @intCast(hdr_len)))))) {
            return @"false" != 0;
        }
        data += @as(Uint32, @bitCast(@as(c_int, hdr_len))) +% hdr.packet_length;
        {
            const ref = &size;
            ref.* = @bitCast(@as(c_uint, @truncate(@as(Uint32, @bitCast(@as(c_int, ref.*))) -% (@as(Uint32, @bitCast(@as(c_int, hdr_len))) +% hdr.packet_length))));
        }
    }
    return @"true" != 0;
}
pub fn HIDAPI_DriverXboxOne_UpdateDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverXboxOne_Context = undefined;
    _ = &ctx;
    var joystick: [*c]SDL_Joystick = undefined;
    _ = &joystick;
    var data: [64]Uint8 = undefined;
    _ = &data;
    var size: c_int = undefined;
    _ = &size;
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
                return @"false" != 0;
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
                if (ctx.*.descriptor != null) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            6 => {
                _ = HIDAPI_DriverXboxOne_UpdateInitState(ctx);
                _ = HIDAPI_DriverXboxOne_UpdateRumble(ctx);
                if (size < @as(c_int, 0)) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 34;
                    continue;
                }
            },
            7 => {
                if (!(joystick != null)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            8 => {
                if (device.*.is_bluetooth) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            9 => {
                {
                    sdl_pc = 4;
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
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                _ = HIDAPI_DriverXboxOne_HandleDescriptorReport(joystick, ctx, @ptrCast(@alignCast(&data)), @bitCast(@as(c_long, size)));
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            13 => {
                switch (@as(c_int, data[@as(c_int, 0)])) {
                    @as(c_int, 1) => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 24;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 28;
                        continue;
                    },
                    else => {
                        sdl_pc = 32;
                        continue;
                    },
                }
            },
            14 => {
                _ = HIDAPI_GIP_ProcessData(joystick, ctx, @ptrCast(@alignCast(&data)), size);
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            16 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            17 => {
                if (!(joystick != null)) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
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
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            20 => {
                if (size >= @as(c_int, 16)) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            21 => {
                HIDAPI_DriverXboxOneBluetooth_HandleStatePacket(joystick, ctx, @ptrCast(@alignCast(&data)), size);
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
                    sdl_pc = 16;
                    continue;
                }
            },
            24 => {
                if (!(joystick != null)) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            25 => {
                {
                    sdl_pc = 16;
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
                HIDAPI_DriverXboxOneBluetooth_HandleGuidePacket(joystick, ctx, @ptrCast(@alignCast(&data)), size);
                {
                    sdl_pc = 16;
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
                {
                    sdl_pc = 16;
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
                HIDAPI_DriverXboxOneBluetooth_HandleBatteryPacket(joystick, ctx, @ptrCast(@alignCast(&data)), size);
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            32 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            33 => {
                HIDAPI_JoystickDisconnected(device, device.*.joysticks[@as(c_int, 0)]);
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
                return size >= @as(c_int, 0);
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverXboxOne_CloseJoystick(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverXboxOne_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    SDL_RemoveHintCallback_REAL("SDL_JOYSTICK_HIDAPI_XBOX_ONE_HOME_LED", SDL_HomeLEDHintChanged, @ptrCast(@alignCast(ctx)));
}
pub fn HIDAPI_DriverXboxOne_FreeDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverXboxOne_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    SDL_DestroyDescriptor(ctx.*.descriptor);
    HIDAPI_GIP_DestroyChunkBuffer(ctx);
}
pub export var SDL_HIDAPI_DriverXboxOne: SDL_HIDAPI_DeviceDriver = SDL_HIDAPI_DeviceDriver{
    .name = "SDL_JOYSTICK_HIDAPI_XBOX_ONE",
    .enabled = @"true" != 0,
    .RegisterHints = HIDAPI_DriverXboxOne_RegisterHints,
    .UnregisterHints = HIDAPI_DriverXboxOne_UnregisterHints,
    .IsEnabled = HIDAPI_DriverXboxOne_IsEnabled,
    .IsSupportedDevice = HIDAPI_DriverXboxOne_IsSupportedDevice,
    .InitDevice = HIDAPI_DriverXboxOne_InitDevice,
    .GetDevicePlayerIndex = HIDAPI_DriverXboxOne_GetDevicePlayerIndex,
    .SetDevicePlayerIndex = HIDAPI_DriverXboxOne_SetDevicePlayerIndex,
    .UpdateDevice = HIDAPI_DriverXboxOne_UpdateDevice,
    .OpenJoystick = HIDAPI_DriverXboxOne_OpenJoystick,
    .RumbleJoystick = HIDAPI_DriverXboxOne_RumbleJoystick,
    .RumbleJoystickTriggers = HIDAPI_DriverXboxOne_RumbleJoystickTriggers,
    .GetJoystickCapabilities = HIDAPI_DriverXboxOne_GetJoystickCapabilities,
    .SetJoystickLED = HIDAPI_DriverXboxOne_SetJoystickLED,
    .SendJoystickEffect = HIDAPI_DriverXboxOne_SendJoystickEffect,
    .SetJoystickSensorsEnabled = HIDAPI_DriverXboxOne_SetJoystickSensorsEnabled,
    .CloseJoystick = HIDAPI_DriverXboxOne_CloseJoystick,
    .FreeDevice = HIDAPI_DriverXboxOne_FreeDevice,
};

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_HAT_CENTERED = @as(c_uint, 0x00);
pub const SDL_HAT_UP = @as(c_uint, 0x01);
pub const SDL_HAT_RIGHT = @as(c_uint, 0x02);
pub const SDL_HAT_DOWN = @as(c_uint, 0x04);
pub const SDL_HAT_LEFT = @as(c_uint, 0x08);
pub const USB_VENDOR_MICROSOFT = @as(c_int, 0x045e);
pub const USB_VENDOR_PDP = @as(c_int, 0x0e6f);
pub const USB_VENDOR_POWERA = @as(c_int, 0x24c6);
pub const USB_VENDOR_POWERA_ALT = @as(c_int, 0x20d6);
pub const USB_VENDOR_RAZER = @as(c_int, 0x1532);
pub const USB_PRODUCT_RAZER_ATROX = @as(c_int, 0x0a00);
pub const USB_PRODUCT_XBOX_ONE_ELITE_SERIES_2 = @as(c_int, 0x0b00);
pub const USB_USAGEPAGE_GENERIC_DESKTOP = @as(c_int, 0x0001);
pub const USB_USAGEPAGE_SIMULATION = @as(c_int, 0x0002);
pub const USB_USAGEPAGE_DEVICE_CONTROLS = @as(c_int, 0x0006);
pub const USB_USAGEPAGE_BUTTON = @as(c_int, 0x0009);
pub const USB_USAGEPAGE_CONSUMER = @as(c_int, 0x000C);
pub const USB_USAGE_GENERIC_X = @as(c_int, 0x0030);
pub const USB_USAGE_GENERIC_Y = @as(c_int, 0x0031);
pub const USB_USAGE_GENERIC_Z = @as(c_int, 0x0032);
pub const USB_USAGE_GENERIC_RX = @as(c_int, 0x0033);
pub const USB_USAGE_GENERIC_RY = @as(c_int, 0x0034);
pub const USB_USAGE_GENERIC_RZ = @as(c_int, 0x0035);
pub const USB_USAGE_GENERIC_HAT = @as(c_int, 0x0039);
pub const USB_USAGE_SIMULATION_ACCELERATOR = @as(c_int, 0x00C4);
pub const USB_USAGE_SIMULATION_BRAKE = @as(c_int, 0x00C5);
pub const USB_USAGE_DEVICE_CONTROLS_BATTERY_STRENGTH = @as(c_int, 0x0020);
pub const USB_USAGE_CONSUMER_ASSIGN_SELECTION = @as(c_int, 0x0081);
pub const USB_USAGE_CONSUMER_ORDER_MOVIE = @as(c_int, 0x0085);
pub const USB_USAGE_CONSUMER_RECORD = @as(c_int, 0x00B2);
pub const USB_USAGE_CONSUMER_AC_HOME = @as(c_int, 0x0223);
pub const USB_USAGE_CONSUMER_AC_BACK = @as(c_int, 0x0224);
pub const SDL_JOYSTICK_CAP_RGB_LED = @as(c_int, 0x00000002);
pub const SDL_JOYSTICK_CAP_RUMBLE = @as(c_int, 0x00000010);
pub const SDL_JOYSTICK_CAP_TRIGGER_RUMBLE = @as(c_int, 0x00000020);
pub const CONTROLLER_IDENTIFY_TIMEOUT_MS = @as(c_int, 100);
pub const CONTROLLER_PREPARE_INPUT_TIMEOUT_MS = @as(c_int, 50);
pub const GIP_HEADER_MIN_LENGTH = @as(c_int, 3);
pub const GIP_CMD_ACKNOWLEDGE = @as(c_int, 0x01);
pub const GIP_CMD_ANNOUNCE = @as(c_int, 0x02);
pub const GIP_CMD_STATUS = @as(c_int, 0x03);
pub const GIP_CMD_IDENTIFY = @as(c_int, 0x04);
pub const GIP_CMD_POWER = @as(c_int, 0x05);
pub const GIP_CMD_AUTHENTICATE = @as(c_int, 0x06);
pub const GIP_CMD_VIRTUAL_KEY = @as(c_int, 0x07);
pub const GIP_CMD_SERIAL_NUMBER = @as(c_int, 0x1E);
pub const GIP_CMD_UNMAPPED_STATE = @as(c_int, 0x0C);
pub const GIP_CMD_INPUT = @as(c_int, 0x20);
pub const GIP_OPT_ACKNOWLEDGE = @as(c_int, 0x10);
pub const GIP_OPT_INTERNAL = @as(c_int, 0x20);
pub const GIP_OPT_CHUNK_START = @as(c_int, 0x40);
pub const GIP_OPT_CHUNK = @as(c_int, 0x80);
