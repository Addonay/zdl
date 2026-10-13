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
pub const SDL_JOYSTICK_CONNECTION_WIRED: c_int = 1;
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
pub extern fn SDL_GetJoystickPlayerIndex_REAL(joystick: [*c]SDL_Joystick) c_int;
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
pub const SDL_GAMEPAD_BUTTON_DPAD_UP: c_int = 11;
pub const SDL_GAMEPAD_BUTTON_DPAD_DOWN: c_int = 12;
pub const SDL_GAMEPAD_BUTTON_DPAD_LEFT: c_int = 13;
pub const SDL_GAMEPAD_BUTTON_DPAD_RIGHT: c_int = 14;
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
pub extern fn SDL_GetStringBoolean(value: [*c]const u8, default_value: bool) bool;
pub extern fn SDL_AssertJoysticksLocked() void;
pub extern fn SDL_PrivateJoystickAddSensor(joystick: [*c]SDL_Joystick, @"type": SDL_SensorType, rate: f32) void;
pub extern fn SDL_SendJoystickAxis(timestamp: Uint64, joystick: [*c]SDL_Joystick, axis: Uint8, value: Sint16) void;
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
pub extern fn HIDAPI_JoystickConnected(device: [*c]SDL_HIDAPI_Device, pJoystickID: [*c]SDL_JoystickID) bool;
pub extern fn HIDAPI_JoystickDisconnected(device: [*c]SDL_HIDAPI_Device, joystickID: SDL_JoystickID) void;
pub extern fn SDL_HIDAPI_LockRumble() bool;
pub extern fn SDL_HIDAPI_SendRumbleAndUnlock(device: [*c]SDL_HIDAPI_Device, data: [*c]const Uint8, size: c_int) c_int;
pub const k_eWiiExtensionControllerType_Unknown: c_int = 0;
pub const k_eWiiExtensionControllerType_None: c_int = 128;
pub const k_eWiiExtensionControllerType_Nunchuk: c_int = 129;
pub const k_eWiiExtensionControllerType_Gamepad: c_int = 130;
pub const k_eWiiExtensionControllerType_WiiUPro: c_int = 131;
pub const EWiiExtensionControllerType = c_uint;
pub const k_eWiiInputReportIDs_Status: c_int = 32;
pub const k_eWiiInputReportIDs_ReadMemory: c_int = 33;
pub const k_eWiiInputReportIDs_Acknowledge: c_int = 34;
pub const k_eWiiInputReportIDs_ButtonData0: c_int = 48;
pub const k_eWiiInputReportIDs_ButtonData1: c_int = 49;
pub const k_eWiiInputReportIDs_ButtonData2: c_int = 50;
pub const k_eWiiInputReportIDs_ButtonData3: c_int = 51;
pub const k_eWiiInputReportIDs_ButtonData4: c_int = 52;
pub const k_eWiiInputReportIDs_ButtonData5: c_int = 53;
pub const k_eWiiInputReportIDs_ButtonData6: c_int = 54;
pub const k_eWiiInputReportIDs_ButtonData7: c_int = 55;
pub const k_eWiiInputReportIDs_ButtonDataD: c_int = 61;
pub const k_eWiiInputReportIDs_ButtonDataE: c_int = 62;
pub const k_eWiiInputReportIDs_ButtonDataF: c_int = 63;
pub const EWiiInputReportIDs = c_uint;
pub const k_eWiiOutputReportIDs_Rumble: c_int = 16;
pub const k_eWiiOutputReportIDs_LEDs: c_int = 17;
pub const k_eWiiOutputReportIDs_DataReportingMode: c_int = 18;
pub const k_eWiiOutputReportIDs_StatusRequest: c_int = 21;
pub const k_eWiiOutputReportIDs_WriteMemory: c_int = 22;
pub const k_eWiiOutputReportIDs_ReadMemory: c_int = 23;
pub const k_eWiiPlayerLEDs_P1: c_int = 16;
pub const k_eWiiPlayerLEDs_P2: c_int = 32;
pub const k_eWiiPlayerLEDs_P3: c_int = 64;
pub const k_eWiiPlayerLEDs_P4: c_int = 128;
pub const k_eWiiCommunicationState_None: c_int = 0;
pub const k_eWiiCommunicationState_CheckMotionPlusStage1: c_int = 1;
pub const k_eWiiCommunicationState_CheckMotionPlusStage2: c_int = 2;
pub const EWiiCommunicationState = c_uint;
pub const k_eWiiButtons_A: c_int = 15;
pub const k_eWiiButtons_B: c_int = 16;
pub const k_eWiiButtons_One: c_int = 17;
pub const k_eWiiButtons_Two: c_int = 18;
pub const k_eWiiButtons_Plus: c_int = 19;
pub const k_eWiiButtons_Minus: c_int = 20;
pub const k_eWiiButtons_Home: c_int = 21;
pub const k_eWiiButtons_DPad_Up: c_int = 22;
pub const k_eWiiButtons_DPad_Down: c_int = 23;
pub const k_eWiiButtons_DPad_Left: c_int = 24;
pub const k_eWiiButtons_DPad_Right: c_int = 25;
pub const k_eWiiButtons_Max: c_int = 26;
pub const WiiButtonData = extern struct {
    rgucBaseButtons: [2]Uint8 = @import("std").mem.zeroes([2]Uint8),
    rgucAccelerometer: [3]Uint8 = @import("std").mem.zeroes([3]Uint8),
    rgucExtension: [21]Uint8 = @import("std").mem.zeroes([21]Uint8),
    hasBaseButtons: bool = false,
    hasAccelerometer: bool = false,
    ucNExtensionBytes: Uint8 = 0,
};
pub const StickCalibrationData = extern struct {
    min: Uint16 = 0,
    max: Uint16 = 0,
    center: Uint16 = 0,
    deadzone: Uint16 = 0,
};
pub const SDL_DriverWii_Context = extern struct {
    device: [*c]SDL_HIDAPI_Device = null,
    joystick: [*c]SDL_Joystick = null,
    timestamp: Uint64 = 0,
    m_eCommState: EWiiCommunicationState = @import("std").mem.zeroes(EWiiCommunicationState),
    m_eExtensionControllerType: EWiiExtensionControllerType = @import("std").mem.zeroes(EWiiExtensionControllerType),
    m_bPlayerLights: bool = false,
    m_nPlayerIndex: c_int = 0,
    m_bRumbleActive: bool = false,
    m_bMotionPlusPresent: bool = false,
    m_ucMotionPlusMode: Uint8 = 0,
    m_bReportSensors: bool = false,
    m_rgucReadBuffer: [22]Uint8 = @import("std").mem.zeroes([22]Uint8),
    m_ulLastInput: Uint64 = 0,
    m_ulLastStatus: Uint64 = 0,
    m_ulNextMotionPlusCheck: Uint64 = 0,
    m_bDisconnected: bool = false,
    m_StickCalibrationData: [6]StickCalibrationData = @import("std").mem.zeroes([6]StickCalibrationData),
};
pub fn HIDAPI_DriverWii_RegisterHints(callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = SDL_AddHintCallback_REAL("SDL_JOYSTICK_HIDAPI_WII", callback, userdata);
}
pub fn HIDAPI_DriverWii_UnregisterHints(callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_RemoveHintCallback_REAL("SDL_JOYSTICK_HIDAPI_WII", callback, userdata);
}
pub fn HIDAPI_DriverWii_IsEnabled() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI_WII", @"false" != 0);
}
pub fn HIDAPI_DriverWii_IsSupportedDevice(_: [*c]SDL_HIDAPI_Device, _: [*c]const u8, arg_type: SDL_GamepadType, vendor_id: Uint16, product_id: Uint16, _: Uint16, _: c_int, _: c_int, _: c_int, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    if ((@as(c_int, vendor_id) == USB_VENDOR_NINTENDO) and ((@as(c_int, product_id) == USB_PRODUCT_NINTENDO_WII_REMOTE) or (@as(c_int, product_id) == USB_PRODUCT_NINTENDO_WII_REMOTE2))) {
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub fn ReadInput(ctx: [*c]SDL_DriverWii_Context) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var size: c_int = undefined;
    _ = &size;
    if (SDL_GetAtomicInt_REAL(&ctx.*.device.*.rumble_pending) > @as(c_int, 0)) {
        return 0;
    }
    size = SDL_hid_read_timeout_REAL(ctx.*.device.*.dev, @ptrCast(@alignCast(&ctx.*.m_rgucReadBuffer)), @sizeOf(@TypeOf(ctx.*.m_rgucReadBuffer)), 0);
    return size;
}
pub fn WriteOutput(ctx: [*c]SDL_DriverWii_Context, data: [*c]const Uint8, size: c_int, sync: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (sync) {
        return SDL_hid_write_REAL(ctx.*.device.*.dev, data, @bitCast(@as(c_long, size))) >= @as(c_int, 0);
    } else {
        if (!SDL_HIDAPI_LockRumble()) {
            return @"false" != 0;
        }
        return SDL_HIDAPI_SendRumbleAndUnlock(ctx.*.device, data, size) >= @as(c_int, 0);
    }
}
pub fn ReadInputSync(ctx: [*c]SDL_DriverWii_Context, expectedID: EWiiInputReportIDs, isMine: ?*const fn ([*c]const Uint8) callconv(.c) bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var endTicks: Uint64 = SDL_GetTicks_REAL() +% @as(Uint64, 250);
    _ = &endTicks;
    var nRead: c_int = 0;
    _ = &nRead;
    while ((blk: {
        const tmp = ReadInput(ctx);
        nRead = tmp;
        break :blk tmp;
    }) != -@as(c_int, 1)) {
        if (nRead > @as(c_int, 0)) {
            if ((@as(c_int, ctx.*.m_rgucReadBuffer[@as(c_int, 0)]) == @as(c_int, @bitCast(expectedID))) and (!(isMine != null) or isMine.?(@ptrCast(@alignCast(&ctx.*.m_rgucReadBuffer))))) {
                return @"true" != 0;
            }
        } else {
            if (SDL_GetTicks_REAL() >= endTicks) {
                break;
            }
            SDL_Delay_REAL(1);
        }
    }
    _ = SDL_SetError_REAL("Read timed out");
    return @"false" != 0;
}
pub fn IsWriteMemoryResponse(data: [*c]const Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return @as(c_int, data[@as(c_int, 3)]) == k_eWiiOutputReportIDs_WriteMemory;
}
pub fn WriteRegister(ctx: [*c]SDL_DriverWii_Context, address: Uint32, data: [*c]const Uint8, arg_size: c_int, sync: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var size = arg_size;
    _ = &size;
    const static_local___func__ = struct {
        const __func__: [13:0]u8 = "WriteRegister".*;
    };
    _ = &static_local___func__;
    var writeRequest: [22]Uint8 = undefined;
    _ = &writeRequest;
    _ = memset(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&writeRequest))))), 0, @sizeOf(@TypeOf(writeRequest)));
    writeRequest[@as(c_int, 0)] = k_eWiiOutputReportIDs_WriteMemory;
    writeRequest[@as(c_int, 1)] = @bitCast(@as(i8, @truncate(@as(c_int, 4) | @as(c_int, @as(Uint8, @intFromBool(ctx.*.m_bRumbleActive))))));
    writeRequest[@as(c_int, 2)] = @truncate((address >> @intCast(@as(Uint32, 16))) & @as(Uint32, 255));
    writeRequest[@as(c_int, 3)] = @truncate((address >> @intCast(@as(Uint32, 8))) & @as(Uint32, 255));
    writeRequest[@as(c_int, 4)] = @truncate(address & @as(Uint32, 255));
    writeRequest[@as(c_int, 5)] = @bitCast(@as(i8, @truncate(size)));
    while (true) {
        while (!((size > @as(c_int, 0)) and (size <= @as(c_int, 16)))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "size > 0 && size <= 16",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_hidapi_wii.c", 265);
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
    _ = memcpy(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&writeRequest))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 6))))))), @ptrCast(@alignCast(data)), @bitCast(@as(c_long, size)));
    if (!WriteOutput(ctx, @ptrCast(@alignCast(&writeRequest)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(writeRequest))))), sync)) {
        return @"false" != 0;
    }
    if (sync) {
        if (!ReadInputSync(ctx, k_eWiiInputReportIDs_Acknowledge, IsWriteMemoryResponse)) {
            return @"false" != 0;
        }
        if (@as(c_int, ctx.*.m_rgucReadBuffer[@as(c_int, 4)]) != 0) {
            _ = SDL_SetError_REAL("Write memory failed: %u", ctx.*.m_rgucReadBuffer[@as(c_int, 4)]);
            return @"false" != 0;
        }
    }
    return @"true" != 0;
}
pub fn ReadRegister(ctx: [*c]SDL_DriverWii_Context, address: Uint32, arg_size: c_int, sync: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var size = arg_size;
    _ = &size;
    const static_local___func__ = struct {
        const __func__: [12:0]u8 = "ReadRegister".*;
    };
    _ = &static_local___func__;
    var readRequest: [7]Uint8 = undefined;
    _ = &readRequest;
    readRequest[@as(c_int, 0)] = k_eWiiOutputReportIDs_ReadMemory;
    readRequest[@as(c_int, 1)] = @bitCast(@as(i8, @truncate(@as(c_int, 4) | @as(c_int, @as(Uint8, @intFromBool(ctx.*.m_bRumbleActive))))));
    readRequest[@as(c_int, 2)] = @truncate((address >> @intCast(@as(Uint32, 16))) & @as(Uint32, 255));
    readRequest[@as(c_int, 3)] = @truncate((address >> @intCast(@as(Uint32, 8))) & @as(Uint32, 255));
    readRequest[@as(c_int, 4)] = @truncate(address & @as(Uint32, 255));
    readRequest[@as(c_int, 5)] = @bitCast(@as(i8, @truncate((size >> @intCast(@as(c_int, 8))) & @as(c_int, 255))));
    readRequest[@as(c_int, 6)] = @bitCast(@as(i8, @truncate(size & @as(c_int, 255))));
    while (true) {
        while (!((size > @as(c_int, 0)) and (size <= @as(c_int, 65535)))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "size > 0 && size <= 0xffff",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_hidapi_wii.c", 296);
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
    if (!WriteOutput(ctx, @ptrCast(@alignCast(&readRequest)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(readRequest))))), sync)) {
        return @"false" != 0;
    }
    if (sync) {
        while (true) {
            while (!(size <= @as(c_int, 16))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "size <= 16",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_hidapi_wii.c", 302);
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
        if (!ReadInputSync(ctx, k_eWiiInputReportIDs_ReadMemory, null)) {
            return @"false" != 0;
        }
    }
    return @"true" != 0;
}
pub fn SendExtensionIdentify(ctx: [*c]SDL_DriverWii_Context, sync: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return ReadRegister(ctx, 10748158, 2, sync);
}
pub fn ParseExtensionIdentifyResponse(ctx: [*c]SDL_DriverWii_Context, extension: [*c]Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    if (@as(c_int, ctx.*.m_rgucReadBuffer[@as(c_int, 0)]) != k_eWiiInputReportIDs_ReadMemory) {
        _ = SDL_SetError_REAL("Unexpected extension response type");
        return @"false" != 0;
    }
    if ((@as(c_int, ctx.*.m_rgucReadBuffer[@as(c_int, 4)]) != @as(c_int, 0)) or (@as(c_int, ctx.*.m_rgucReadBuffer[@as(c_int, 5)]) != @as(c_int, 254))) {
        _ = SDL_SetError_REAL("Unexpected extension response address");
        return @"false" != 0;
    }
    if (@as(c_int, ctx.*.m_rgucReadBuffer[@as(c_int, 3)]) != @as(c_int, 16)) {
        var @"error": Uint8 = @bitCast(@as(i8, @truncate(@as(c_int, ctx.*.m_rgucReadBuffer[@as(c_int, 3)]) & @as(c_int, 15))));
        _ = &@"error";
        if (@as(c_int, @"error") == @as(c_int, 7)) {
            extension.* = WII_EXTENSION_NONE;
            return @"true" != 0;
        }
        if (@as(c_int, @"error") != 0) {
            _ = SDL_SetError_REAL("Failed to read extension type: %u", @"error");
        } else {
            _ = SDL_SetError_REAL("Unexpected read length when reading extension type: %d", (@as(c_int, ctx.*.m_rgucReadBuffer[@as(c_int, 3)]) >> @intCast(@as(c_int, 4))) + @as(c_int, 1));
        }
        return @"false" != 0;
    }
    extension.* = 0;
    {
        i = 6;
        while (i < @as(c_int, 8)) : (i += 1) {
            extension.* = @bitCast(@as(c_short, @truncate((@as(c_int, extension.*) << @intCast(@as(c_int, 8))) | @as(c_int, ctx.*.m_rgucReadBuffer[@bitCast(@as(isize, @intCast(i)))]))));
        }
    }
    return @"true" != 0;
}
pub fn GetExtensionType(extension_id: Uint16) callconv(.c) EWiiExtensionControllerType {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (@as(c_int, extension_id)) {
                    WII_EXTENSION_NONE => {
                        sdl_pc = 2;
                        continue;
                    },
                    WII_EXTENSION_NUNCHUK => {
                        sdl_pc = 3;
                        continue;
                    },
                    WII_EXTENSION_GAMEPAD => {
                        sdl_pc = 4;
                        continue;
                    },
                    WII_EXTENSION_WIIUPRO => {
                        sdl_pc = 5;
                        continue;
                    },
                    else => {
                        sdl_pc = 6;
                        continue;
                    },
                }
            },
            1 => {
                return undefined;
            },
            2 => {
                return k_eWiiExtensionControllerType_None;
            },
            3 => {
                return k_eWiiExtensionControllerType_Nunchuk;
            },
            4 => {
                return k_eWiiExtensionControllerType_Gamepad;
            },
            5 => {
                return k_eWiiExtensionControllerType_WiiUPro;
            },
            6 => {
                return k_eWiiExtensionControllerType_Unknown;
            },
            else => unreachable,
        }
    }
}
pub fn SendExtensionReset(ctx: [*c]SDL_DriverWii_Context, sync: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var result: bool = @"true" != 0;
    _ = &result;
    {
        var data: Uint8 = 85;
        _ = &data;
        result = result and WriteRegister(ctx, 10748144, &data, @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(data))))), sync);
    }
    {
        var data: Uint8 = 0;
        _ = &data;
        _ = WriteRegister(ctx, 10748155, &data, @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(data))))), sync);
    }
    return result;
}
pub fn GetMotionPlusState(ctx: [*c]SDL_DriverWii_Context, connected: [*c]bool, mode: [*c]Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var extension: Uint16 = undefined;
    _ = &extension;
    if (connected != null) {
        connected.* = @"false" != 0;
    }
    if (mode != null) {
        mode.* = 0;
    }
    if (ctx.*.m_eExtensionControllerType == @as(EWiiExtensionControllerType, k_eWiiExtensionControllerType_WiiUPro)) {
        return @"true" != 0;
    }
    if (SendExtensionIdentify(ctx, @"true" != 0) and ParseExtensionIdentifyResponse(ctx, &extension)) {
        if ((@as(c_int, extension) & WII_EXTENSION_MOTIONPLUS_MASK) == WII_EXTENSION_MOTIONPLUS_ID) {
            if (connected != null) {
                connected.* = @"true" != 0;
            }
            if (mode != null) {
                mode.* = @bitCast(@as(i8, @truncate(@as(c_int, extension) >> @intCast(@as(c_int, 8)))));
            }
            return @"true" != 0;
        }
    }
    if (ReadRegister(ctx, 10879230, 2, @"true" != 0) and ParseExtensionIdentifyResponse(ctx, &extension)) {
        if ((@as(c_int, extension) & WII_EXTENSION_MOTIONPLUS_MASK) == WII_EXTENSION_MOTIONPLUS_ID) {
            if (connected != null) {
                connected.* = @"true" != 0;
            }
        }
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub fn NeedsPeriodicMotionPlusCheck(ctx: [*c]SDL_DriverWii_Context, status_update: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (ctx.*.m_eExtensionControllerType == @as(EWiiExtensionControllerType, k_eWiiExtensionControllerType_WiiUPro)) {
        return @"false" != 0;
    }
    if ((@as(c_int, ctx.*.m_ucMotionPlusMode) != WII_MOTIONPLUS_MODE_NONE) and !status_update) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn SchedulePeriodicMotionPlusCheck(ctx: [*c]SDL_DriverWii_Context) callconv(.c) void {
    @setEvalBranchQuota(100000);
    ctx.*.m_ulNextMotionPlusCheck = SDL_GetTicks_REAL() +% @as(Uint64, @bitCast(@as(c_long, @as(c_int, 8) * @as(c_int, 1000))));
}
pub fn CheckMotionPlusConnection(ctx: [*c]SDL_DriverWii_Context) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = SendExtensionIdentify(ctx, @"false" != 0);
    ctx.*.m_eCommState = k_eWiiCommunicationState_CheckMotionPlusStage1;
}
pub fn ActivateMotionPlusWithMode(_: [*c]SDL_DriverWii_Context, _: Uint8) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn ActivateMotionPlus(ctx: [*c]SDL_DriverWii_Context) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var mode: Uint8 = WII_MOTIONPLUS_MODE_STANDARD;
    _ = &mode;
    if (ctx.*.m_eExtensionControllerType == @as(EWiiExtensionControllerType, k_eWiiExtensionControllerType_Nunchuk)) {
        mode = WII_MOTIONPLUS_MODE_NUNCHUK;
    } else if (ctx.*.m_eExtensionControllerType == @as(EWiiExtensionControllerType, k_eWiiExtensionControllerType_Gamepad)) {
        mode = WII_MOTIONPLUS_MODE_GAMEPAD;
    }
    ActivateMotionPlusWithMode(ctx, mode);
}
pub fn DeactivateMotionPlus(ctx: [*c]SDL_DriverWii_Context) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var data: Uint8 = 85;
    _ = &data;
    _ = WriteRegister(ctx, 10748144, &data, @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(data))))), @"true" != 0);
    _ = ReadInputSync(ctx, k_eWiiInputReportIDs_Status, null);
    ctx.*.m_ucMotionPlusMode = WII_MOTIONPLUS_MODE_NONE;
}
pub fn UpdatePowerLevelWii(joystick: [*c]SDL_Joystick, batteryLevelByte: Uint8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var percent: c_int = undefined;
    _ = &percent;
    if (@as(c_int, batteryLevelByte) > @as(c_int, 178)) {
        percent = 100;
    } else if (@as(c_int, batteryLevelByte) > @as(c_int, 51)) {
        percent = 70;
    } else if (@as(c_int, batteryLevelByte) > @as(c_int, 13)) {
        percent = 20;
    } else {
        percent = 5;
    }
    SDL_SendJoystickPowerInfo(joystick, SDL_POWERSTATE_ON_BATTERY, percent);
}
pub fn UpdatePowerLevelWiiU(joystick: [*c]SDL_Joystick, extensionBatteryByte: Uint8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var charging: bool = !((@as(c_int, extensionBatteryByte) & @as(c_int, 8)) != 0);
    _ = &charging;
    var pluggedIn: bool = !((@as(c_int, extensionBatteryByte) & @as(c_int, 4)) != 0);
    _ = &pluggedIn;
    var batteryLevel: Uint8 = @bitCast(@as(i8, @truncate(@as(c_int, extensionBatteryByte) >> @intCast(@as(c_int, 4)))));
    _ = &batteryLevel;
    SDL_AssertJoysticksLocked();
    if (pluggedIn) {
        joystick.*.connection_state = SDL_JOYSTICK_CONNECTION_WIRED;
    } else {
        joystick.*.connection_state = SDL_JOYSTICK_CONNECTION_WIRELESS;
    }
    var state: SDL_PowerState = undefined;
    _ = &state;
    var percent: c_int = undefined;
    _ = &percent;
    if (charging) {
        state = SDL_POWERSTATE_CHARGING;
    } else if (pluggedIn) {
        state = SDL_POWERSTATE_CHARGED;
    } else {
        state = SDL_POWERSTATE_ON_BATTERY;
    }
    if (@as(c_int, batteryLevel) >= @as(c_int, 4)) {
        percent = 100;
    } else if (@as(c_int, batteryLevel) == @as(c_int, 3)) {
        percent = 70;
    } else if (@as(c_int, batteryLevel) == @as(c_int, 2)) {
        percent = 40;
    } else if (@as(c_int, batteryLevel) == @as(c_int, 1)) {
        percent = 10;
    } else {
        percent = 3;
    }
    SDL_SendJoystickPowerInfo(joystick, state, percent);
}
pub fn GetButtonPacketType(ctx: [*c]SDL_DriverWii_Context) callconv(.c) EWiiInputReportIDs {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (ctx.*.m_eExtensionControllerType) {
                    @as(EWiiExtensionControllerType, k_eWiiExtensionControllerType_WiiUPro) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(EWiiExtensionControllerType, k_eWiiExtensionControllerType_Nunchuk) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(EWiiExtensionControllerType, k_eWiiExtensionControllerType_Gamepad) => {
                        sdl_pc = 4;
                        continue;
                    },
                    else => {
                        sdl_pc = 8;
                        continue;
                    },
                }
            },
            1 => {
                return undefined;
            },
            2 => {
                return k_eWiiInputReportIDs_ButtonDataD;
            },
            3 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                if (ctx.*.m_bReportSensors) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                return k_eWiiInputReportIDs_ButtonData5;
            },
            6 => {
                return k_eWiiInputReportIDs_ButtonData2;
            },
            7 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            8 => {
                if (ctx.*.m_bReportSensors) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
            },
            9 => {
                return k_eWiiInputReportIDs_ButtonData5;
            },
            10 => {
                return k_eWiiInputReportIDs_ButtonData0;
            },
            11 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn RequestButtonPacketType(ctx: [*c]SDL_DriverWii_Context, arg_type: EWiiInputReportIDs) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var data: [3]Uint8 = undefined;
    _ = &data;
    var tt: Uint8 = @intFromBool(ctx.*.m_bRumbleActive);
    _ = &tt;
    if (true) {
        {
            const ref = &tt;
            ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | @as(c_int, 4))));
        }
    }
    data[@as(c_int, 0)] = k_eWiiOutputReportIDs_DataReportingMode;
    data[@as(c_int, 1)] = tt;
    data[@as(c_int, 2)] = @truncate(@"type");
    return WriteOutput(ctx, @ptrCast(@alignCast(&data)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(data))))), @"false" != 0);
}
pub fn ResetButtonPacketType(ctx: [*c]SDL_DriverWii_Context) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = RequestButtonPacketType(ctx, GetButtonPacketType(ctx));
}
pub fn InitStickCalibrationData(ctx: [*c]SDL_DriverWii_Context) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (ctx.*.m_eExtensionControllerType) {
                    @as(EWiiExtensionControllerType, k_eWiiExtensionControllerType_WiiUPro) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(EWiiExtensionControllerType, k_eWiiExtensionControllerType_Gamepad) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(EWiiExtensionControllerType, k_eWiiExtensionControllerType_Nunchuk) => {
                        sdl_pc = 12;
                        continue;
                    },
                    else => {
                        sdl_pc = 17;
                        continue;
                    },
                }
            },
            1 => {
                {}
            },
            2 => {
                i = 0;
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                if (i < @as(c_int, 4)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            4 => {
                ctx.*.m_StickCalibrationData[@bitCast(@as(isize, @intCast(i)))].min = 1000;
                ctx.*.m_StickCalibrationData[@bitCast(@as(isize, @intCast(i)))].max = 3000;
                ctx.*.m_StickCalibrationData[@bitCast(@as(isize, @intCast(i)))].center = 0;
                ctx.*.m_StickCalibrationData[@bitCast(@as(isize, @intCast(i)))].deadzone = 100;
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            5 => {
                i += 1;
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            6 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            7 => {
                i = 0;
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            8 => {
                if (i < @as(c_int, 4)) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            9 => {
                ctx.*.m_StickCalibrationData[@bitCast(@as(isize, @intCast(i)))].min = @bitCast(@as(c_short, @truncate(if (i < @as(c_int, 2)) @as(c_int, 9) else @as(c_int, 5))));
                ctx.*.m_StickCalibrationData[@bitCast(@as(isize, @intCast(i)))].max = @bitCast(@as(c_short, @truncate(if (i < @as(c_int, 2)) @as(c_int, 54) else @as(c_int, 26))));
                ctx.*.m_StickCalibrationData[@bitCast(@as(isize, @intCast(i)))].center = 0;
                ctx.*.m_StickCalibrationData[@bitCast(@as(isize, @intCast(i)))].deadzone = @bitCast(@as(c_short, @truncate(if (i < @as(c_int, 2)) @as(c_int, 4) else @as(c_int, 2))));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                i += 1;
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            11 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            12 => {
                i = 0;
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                if (i < @as(c_int, 2)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            14 => {
                ctx.*.m_StickCalibrationData[@bitCast(@as(isize, @intCast(i)))].min = 40;
                ctx.*.m_StickCalibrationData[@bitCast(@as(isize, @intCast(i)))].max = 215;
                ctx.*.m_StickCalibrationData[@bitCast(@as(isize, @intCast(i)))].center = 0;
                ctx.*.m_StickCalibrationData[@bitCast(@as(isize, @intCast(i)))].deadzone = 10;
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                i += 1;
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            16 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn InitializeExtension(ctx: [*c]SDL_DriverWii_Context) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = SendExtensionReset(ctx, @"true" != 0);
    InitStickCalibrationData(ctx);
    ResetButtonPacketType(ctx);
}
pub fn UpdateSlotLED(ctx: [*c]SDL_DriverWii_Context) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var leds: Uint8 = undefined;
    _ = &leds;
    var data: [2]Uint8 = undefined;
    _ = &data;
    leds = @intFromBool(ctx.*.m_bRumbleActive);
    if (ctx.*.m_bPlayerLights) {
        if ((ctx.*.m_nPlayerIndex == @as(c_int, 0)) or (ctx.*.m_nPlayerIndex > @as(c_int, 3))) {
            {
                const ref = &leds;
                ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | k_eWiiPlayerLEDs_P1)));
            }
        }
        if ((ctx.*.m_nPlayerIndex == @as(c_int, 1)) or (ctx.*.m_nPlayerIndex == @as(c_int, 4))) {
            {
                const ref = &leds;
                ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | k_eWiiPlayerLEDs_P2)));
            }
        }
        if ((ctx.*.m_nPlayerIndex == @as(c_int, 2)) or (ctx.*.m_nPlayerIndex == @as(c_int, 5))) {
            {
                const ref = &leds;
                ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | k_eWiiPlayerLEDs_P3)));
            }
        }
        if ((ctx.*.m_nPlayerIndex == @as(c_int, 3)) or (ctx.*.m_nPlayerIndex == @as(c_int, 6))) {
            {
                const ref = &leds;
                ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | k_eWiiPlayerLEDs_P4)));
            }
        }
        if ((ctx.*.m_nPlayerIndex < @as(c_int, 0)) or (ctx.*.m_nPlayerIndex > @as(c_int, 6))) {
            {
                const ref = &leds;
                ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | (((k_eWiiPlayerLEDs_P1 | k_eWiiPlayerLEDs_P2) | k_eWiiPlayerLEDs_P3) | k_eWiiPlayerLEDs_P4))));
            }
        }
    }
    data[@as(c_int, 0)] = k_eWiiOutputReportIDs_LEDs;
    data[@as(c_int, 1)] = leds;
    _ = WriteOutput(ctx, @ptrCast(@alignCast(&data)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(data))))), @"false" != 0);
}
pub fn SDL_PlayerLEDHintChanged(userdata: ?*anyopaque, _: [*c]const u8, _: [*c]const u8, hint: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverWii_Context = @ptrCast(@alignCast(userdata));
    _ = &ctx;
    var bPlayerLights: bool = SDL_GetStringBoolean(hint, @"true" != 0);
    _ = &bPlayerLights;
    if (@as(c_int, @intFromBool(bPlayerLights)) != @as(c_int, @intFromBool(ctx.*.m_bPlayerLights))) {
        ctx.*.m_bPlayerLights = bPlayerLights;
        UpdateSlotLED(ctx);
    }
}
pub fn ReadExtensionControllerType(device: [*c]SDL_HIDAPI_Device) callconv(.c) EWiiExtensionControllerType {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverWii_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    var eExtensionControllerType: EWiiExtensionControllerType = k_eWiiExtensionControllerType_Unknown;
    _ = &eExtensionControllerType;
    const MAX_ATTEMPTS: c_int = 20;
    _ = &MAX_ATTEMPTS;
    var attempts: c_int = 0;
    _ = &attempts;
    {
        attempts = 0;
        while (attempts < MAX_ATTEMPTS) : (attempts += 1) {
            var extension: Uint16 = undefined;
            _ = &extension;
            if (SendExtensionIdentify(ctx, @"true" != 0) and ParseExtensionIdentifyResponse(ctx, &extension)) {
                var motion_plus_mode: Uint8 = 0;
                _ = &motion_plus_mode;
                if ((@as(c_int, extension) & WII_EXTENSION_MOTIONPLUS_MASK) == WII_EXTENSION_MOTIONPLUS_ID) {
                    motion_plus_mode = @bitCast(@as(i8, @truncate(@as(c_int, extension) >> @intCast(@as(c_int, 8)))));
                }
                if ((@as(c_int, motion_plus_mode) != 0) or (@as(c_int, extension) == WII_EXTENSION_UNINITIALIZED)) {
                    _ = SendExtensionReset(ctx, @"true" != 0);
                    if (SendExtensionIdentify(ctx, @"true" != 0)) {
                        _ = ParseExtensionIdentifyResponse(ctx, &extension);
                    }
                }
                eExtensionControllerType = GetExtensionType(extension);
                if (@as(c_int, motion_plus_mode) != 0) {
                    ActivateMotionPlusWithMode(ctx, motion_plus_mode);
                }
                break;
            }
        }
    }
    return eExtensionControllerType;
}
pub fn UpdateDeviceIdentity(device: [*c]SDL_HIDAPI_Device) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverWii_Context = undefined;
    _ = &ctx;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                ctx = @ptrCast(@alignCast(device.*.context));
                switch (ctx.*.m_eExtensionControllerType) {
                    @as(EWiiExtensionControllerType, k_eWiiExtensionControllerType_None) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(EWiiExtensionControllerType, k_eWiiExtensionControllerType_Nunchuk) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(EWiiExtensionControllerType, k_eWiiExtensionControllerType_Gamepad) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(EWiiExtensionControllerType, k_eWiiExtensionControllerType_WiiUPro) => {
                        sdl_pc = 5;
                        continue;
                    },
                    else => {
                        sdl_pc = 6;
                        continue;
                    },
                }
            },
            1 => {
                device.*.guid.data[@as(c_int, 15)] = @truncate(ctx.*.m_eExtensionControllerType);
                {}
            },
            2 => {
                HIDAPI_SetDeviceName(device, "Nintendo Wii Remote");
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                HIDAPI_SetDeviceName(device, "Nintendo Wii Remote with Nunchuk");
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                HIDAPI_SetDeviceName(device, "Nintendo Wii Remote with Classic Controller");
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            5 => {
                HIDAPI_SetDeviceName(device, "Nintendo Wii U Pro Controller");
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            6 => {
                HIDAPI_SetDeviceName(device, "Nintendo Wii Remote with Unknown Extension");
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverWii_InitDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverWii_Context = undefined;
    _ = &ctx;
    ctx = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(ctx.*)))));
    if (!(ctx != null)) {
        return @"false" != 0;
    }
    ctx.*.device = device;
    device.*.context = @ptrCast(@alignCast(ctx));
    if (@as(c_int, device.*.vendor_id) == USB_VENDOR_NINTENDO) {
        ctx.*.m_eExtensionControllerType = ReadExtensionControllerType(device);
        UpdateDeviceIdentity(device);
    }
    return HIDAPI_JoystickConnected(device, null);
}
pub fn HIDAPI_DriverWii_GetDevicePlayerIndex(_: [*c]SDL_HIDAPI_Device, _: SDL_JoystickID) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return -@as(c_int, 1);
}
pub fn HIDAPI_DriverWii_SetDevicePlayerIndex(device: [*c]SDL_HIDAPI_Device, _: SDL_JoystickID, player_index: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverWii_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    if (!(ctx.*.joystick != null)) {
        return;
    }
    ctx.*.m_nPlayerIndex = player_index;
    UpdateSlotLED(ctx);
}
pub fn HIDAPI_DriverWii_OpenJoystick(device: [*c]SDL_HIDAPI_Device, joystick: [*c]SDL_Joystick) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverWii_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    SDL_AssertJoysticksLocked();
    ctx.*.joystick = joystick;
    InitializeExtension(ctx);
    _ = GetMotionPlusState(ctx, &ctx.*.m_bMotionPlusPresent, &ctx.*.m_ucMotionPlusMode);
    if (NeedsPeriodicMotionPlusCheck(ctx, @"false" != 0)) {
        SchedulePeriodicMotionPlusCheck(ctx);
    }
    if ((ctx.*.m_eExtensionControllerType == @as(EWiiExtensionControllerType, k_eWiiExtensionControllerType_None)) or (ctx.*.m_eExtensionControllerType == @as(EWiiExtensionControllerType, k_eWiiExtensionControllerType_Nunchuk))) {
        SDL_PrivateJoystickAddSensor(joystick, SDL_SENSOR_ACCEL, 100.0);
        if (ctx.*.m_eExtensionControllerType == @as(EWiiExtensionControllerType, k_eWiiExtensionControllerType_Nunchuk)) {
            SDL_PrivateJoystickAddSensor(joystick, SDL_SENSOR_ACCEL_L, 100.0);
        }
        if (ctx.*.m_bMotionPlusPresent) {
            SDL_PrivateJoystickAddSensor(joystick, SDL_SENSOR_GYRO, 100.0);
        }
    }
    ctx.*.m_nPlayerIndex = SDL_GetJoystickPlayerIndex_REAL(joystick);
    ctx.*.m_bPlayerLights = SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI_WII_PLAYER_LED", @"true" != 0);
    UpdateSlotLED(ctx);
    _ = SDL_AddHintCallback_REAL("SDL_JOYSTICK_HIDAPI_WII_PLAYER_LED", SDL_PlayerLEDHintChanged, @ptrCast(@alignCast(ctx)));
    if (ctx.*.m_eExtensionControllerType == @as(EWiiExtensionControllerType, k_eWiiExtensionControllerType_WiiUPro)) {
        joystick.*.nbuttons = 15;
    } else {
        joystick.*.nbuttons = k_eWiiButtons_Max;
    }
    joystick.*.naxes = SDL_GAMEPAD_AXIS_COUNT;
    ctx.*.m_ulLastInput = SDL_GetTicks_REAL();
    return @"true" != 0;
}
pub fn HIDAPI_DriverWii_RumbleJoystick(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, low_frequency_rumble: Uint16, high_frequency_rumble: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverWii_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    var active: bool = (@as(c_int, low_frequency_rumble) != 0) or (@as(c_int, high_frequency_rumble) != 0);
    _ = &active;
    if (@as(c_int, @intFromBool(active)) != @as(c_int, @intFromBool(ctx.*.m_bRumbleActive))) {
        var data: [2]Uint8 = undefined;
        _ = &data;
        data[@as(c_int, 0)] = k_eWiiOutputReportIDs_Rumble;
        data[@as(c_int, 1)] = @intFromBool(active);
        _ = WriteOutput(ctx, @ptrCast(@alignCast(&data)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(data))))), @"false" != 0);
        ctx.*.m_bRumbleActive = active;
    }
    return @"true" != 0;
}
pub fn HIDAPI_DriverWii_RumbleJoystickTriggers(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: Uint16, _: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverWii_GetJoystickCapabilities(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    return SDL_JOYSTICK_CAP_RUMBLE;
}
pub fn HIDAPI_DriverWii_SetJoystickLED(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: Uint8, _: Uint8, _: Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverWii_SendJoystickEffect(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: ?*const anyopaque, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverWii_SetJoystickSensorsEnabled(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, enabled: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverWii_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    if (@as(c_int, @intFromBool(enabled)) != @as(c_int, @intFromBool(ctx.*.m_bReportSensors))) {
        ctx.*.m_bReportSensors = enabled;
        if (ctx.*.m_bMotionPlusPresent) {
            if (enabled) {
                ActivateMotionPlus(ctx);
            } else {
                DeactivateMotionPlus(ctx);
            }
        }
        ResetButtonPacketType(ctx);
    }
    return @"true" != 0;
}
pub fn PostStickCalibrated(timestamp: Uint64, joystick: [*c]SDL_Joystick, calibration: [*c]StickCalibrationData, axis: Uint8, data: Uint16) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var value: Sint16 = 0;
    _ = &value;
    if (!(@as(c_int, calibration.*.center) != 0)) {
        calibration.*.center = data;
        return;
    }
    if (@as(c_int, data) < @as(c_int, calibration.*.min)) {
        calibration.*.min = data;
    }
    if (@as(c_int, data) > @as(c_int, calibration.*.max)) {
        calibration.*.max = data;
    }
    if (@as(c_int, data) < (@as(c_int, calibration.*.center) - @as(c_int, calibration.*.deadzone))) {
        var zero: Uint16 = @bitCast(@as(c_short, @truncate(@as(c_int, calibration.*.center) - @as(c_int, calibration.*.deadzone))));
        _ = &zero;
        var range: Uint16 = @bitCast(@as(c_short, @truncate(@as(c_int, zero) - @as(c_int, calibration.*.min))));
        _ = &range;
        var distance: Uint16 = @bitCast(@as(c_short, @truncate(@as(c_int, zero) - @as(c_int, data))));
        _ = &distance;
        var fvalue: f32 = @as(f32, @floatFromInt(distance)) / @as(f32, @floatFromInt(range));
        _ = &fvalue;
        value = @intFromFloat(fvalue * @as(f32, @floatFromInt(-@as(c_int, 32768))));
    } else if (@as(c_int, data) > (@as(c_int, calibration.*.center) + @as(c_int, calibration.*.deadzone))) {
        var zero: Uint16 = @bitCast(@as(c_short, @truncate(@as(c_int, calibration.*.center) + @as(c_int, calibration.*.deadzone))));
        _ = &zero;
        var range: Uint16 = @bitCast(@as(c_short, @truncate(@as(c_int, calibration.*.max) - @as(c_int, zero))));
        _ = &range;
        var distance: Uint16 = @bitCast(@as(c_short, @truncate(@as(c_int, data) - @as(c_int, zero))));
        _ = &distance;
        var fvalue: f32 = @as(f32, @floatFromInt(distance)) / @as(f32, @floatFromInt(range));
        _ = &fvalue;
        value = @intFromFloat(fvalue * @as(f32, @floatFromInt(SDL_JOYSTICK_AXIS_MAX)));
    }
    if ((@as(c_int, axis) == SDL_GAMEPAD_AXIS_LEFTY) or (@as(c_int, axis) == SDL_GAMEPAD_AXIS_RIGHTY)) {
        if (@as(c_int, value) != 0) {
            value = @truncate(~@as(c_int, value));
        }
    }
    SDL_SendJoystickAxis(timestamp, joystick, axis, value);
}
pub fn PostPackedButtonData(timestamp: Uint64, joystick: [*c]SDL_Joystick, defs: [*c][8]Uint8, data: [*c]const Uint8, size: c_int, on: bool, off: bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var j: c_int = undefined;
    _ = &j;
    {
        i = 0;
        while (i < size) : (i += 1) {
            {
                j = 0;
                while (j < @as(c_int, 8)) : (j += 1) {
                    var button: Uint8 = defs[@bitCast(@as(isize, @intCast(i)))][@bitCast(@as(isize, @intCast(j)))];
                    _ = &button;
                    if (@as(c_int, button) != @as(c_int, 255)) {
                        var down: bool = (if (((@as(c_int, data[@bitCast(@as(isize, @intCast(i)))]) >> @intCast(j)) & @as(c_int, 1)) != 0) @as(c_int, @intFromBool(on)) else @as(c_int, @intFromBool(off))) != 0;
                        _ = &down;
                        SDL_SendJoystickButton(timestamp, joystick, button, down);
                    }
                }
            }
        }
    }
}
pub var GAMEPAD_BUTTON_DEFS: [3][8]Uint8 = [3][8]Uint8{
    [8]Uint8{
        255,
        SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER,
        SDL_GAMEPAD_BUTTON_START,
        SDL_GAMEPAD_BUTTON_GUIDE,
        SDL_GAMEPAD_BUTTON_BACK,
        SDL_GAMEPAD_BUTTON_LEFT_SHOULDER,
        SDL_GAMEPAD_BUTTON_DPAD_DOWN,
        SDL_GAMEPAD_BUTTON_DPAD_RIGHT,
    },
    [8]Uint8{
        SDL_GAMEPAD_BUTTON_DPAD_UP,
        SDL_GAMEPAD_BUTTON_DPAD_LEFT,
        255,
        SDL_GAMEPAD_BUTTON_NORTH,
        SDL_GAMEPAD_BUTTON_EAST,
        SDL_GAMEPAD_BUTTON_WEST,
        SDL_GAMEPAD_BUTTON_SOUTH,
        255,
    },
    [8]Uint8{
        SDL_GAMEPAD_BUTTON_RIGHT_STICK,
        SDL_GAMEPAD_BUTTON_LEFT_STICK,
        255,
        255,
        255,
        255,
        255,
        255,
    },
};
pub var MP_GAMEPAD_BUTTON_DEFS: [3][8]Uint8 = [3][8]Uint8{
    [8]Uint8{
        255,
        SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER,
        SDL_GAMEPAD_BUTTON_START,
        SDL_GAMEPAD_BUTTON_GUIDE,
        SDL_GAMEPAD_BUTTON_BACK,
        SDL_GAMEPAD_BUTTON_LEFT_SHOULDER,
        SDL_GAMEPAD_BUTTON_DPAD_DOWN,
        SDL_GAMEPAD_BUTTON_DPAD_RIGHT,
    },
    [8]Uint8{
        255,
        255,
        255,
        SDL_GAMEPAD_BUTTON_NORTH,
        SDL_GAMEPAD_BUTTON_EAST,
        SDL_GAMEPAD_BUTTON_WEST,
        SDL_GAMEPAD_BUTTON_SOUTH,
        255,
    },
    [8]Uint8{
        SDL_GAMEPAD_BUTTON_RIGHT_STICK,
        SDL_GAMEPAD_BUTTON_LEFT_STICK,
        255,
        255,
        255,
        255,
        255,
        255,
    },
};
pub var MP_FIXUP_DPAD_BUTTON_DEFS: [2][8]Uint8 = [2][8]Uint8{
    [8]Uint8{
        SDL_GAMEPAD_BUTTON_DPAD_UP,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
    },
    [8]Uint8{
        SDL_GAMEPAD_BUTTON_DPAD_LEFT,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
    },
};
pub fn HandleWiiUProButtonData(ctx: [*c]SDL_DriverWii_Context, joystick: [*c]SDL_Joystick, data: [*c]const WiiButtonData) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local_axes = struct {
        const axes: [4]Uint8 = [4]Uint8{
            SDL_GAMEPAD_AXIS_LEFTX,
            SDL_GAMEPAD_AXIS_RIGHTX,
            SDL_GAMEPAD_AXIS_LEFTY,
            SDL_GAMEPAD_AXIS_RIGHTY,
        };
    };
    _ = &static_local_axes;
    var buttons: [*c][8]Uint8 = @ptrCast(@alignCast(&GAMEPAD_BUTTON_DEFS));
    _ = &buttons;
    var zl: Uint8 = undefined;
    _ = &zl;
    var zr: Uint8 = undefined;
    _ = &zr;
    var i: c_int = undefined;
    _ = &i;
    if (@as(c_int, data.*.ucNExtensionBytes) < @as(c_int, 11)) {
        return;
    }
    PostPackedButtonData(ctx.*.timestamp, joystick, buttons, @as([*c]Uint8, @ptrCast(@constCast(@alignCast(&data.*.rgucExtension)))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8))))), 3, @"false" != 0, @"true" != 0);
    zl = @bitCast(@as(i8, @truncate(@as(c_int, data.*.rgucExtension[@as(c_int, 9)]) & @as(c_int, 128))));
    zr = @bitCast(@as(i8, @truncate(@as(c_int, data.*.rgucExtension[@as(c_int, 9)]) & @as(c_int, 4))));
    SDL_SendJoystickAxis(ctx.*.timestamp, joystick, SDL_GAMEPAD_AXIS_LEFT_TRIGGER, @truncate(if (zl != 0) -@as(c_int, 32768) else SDL_JOYSTICK_AXIS_MAX));
    SDL_SendJoystickAxis(ctx.*.timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHT_TRIGGER, @truncate(if (zr != 0) -@as(c_int, 32768) else SDL_JOYSTICK_AXIS_MAX));
    {
        i = 0;
        while (i < @as(c_int, 4)) : (i += 1) {
            var value: Uint16 = @bitCast(@as(c_short, @truncate(@as(c_int, data.*.rgucExtension[@bitCast(@as(isize, @intCast(i * @as(c_int, 2))))]) | (@as(c_int, data.*.rgucExtension[@bitCast(@as(isize, @intCast((i * @as(c_int, 2)) + @as(c_int, 1))))]) << @intCast(@as(c_int, 8))))));
            _ = &value;
            PostStickCalibrated(ctx.*.timestamp, joystick, &ctx.*.m_StickCalibrationData[@bitCast(@as(isize, @intCast(i)))], static_local_axes.axes[@bitCast(@as(isize, @intCast(i)))], value);
        }
    }
    UpdatePowerLevelWiiU(joystick, data.*.rgucExtension[@as(c_int, 10)]);
}
pub fn HandleGamepadControllerButtonData(ctx: [*c]SDL_DriverWii_Context, joystick: [*c]SDL_Joystick, data: [*c]const WiiButtonData) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var buttons: [*c][8]Uint8 = if (@as(c_int, ctx.*.m_ucMotionPlusMode) == WII_MOTIONPLUS_MODE_GAMEPAD) @as([*c][8]Uint8, @ptrCast(@alignCast(&MP_GAMEPAD_BUTTON_DEFS))) else @as([*c][8]Uint8, @ptrCast(@alignCast(&GAMEPAD_BUTTON_DEFS)));
    _ = &buttons;
    var lx: Uint8 = undefined;
    _ = &lx;
    var ly: Uint8 = undefined;
    _ = &ly;
    var rx: Uint8 = undefined;
    _ = &rx;
    var ry: Uint8 = undefined;
    _ = &ry;
    var zl: Uint8 = undefined;
    _ = &zl;
    var zr: Uint8 = undefined;
    _ = &zr;
    if (@as(c_int, data.*.ucNExtensionBytes) < @as(c_int, 6)) {
        return;
    }
    PostPackedButtonData(ctx.*.timestamp, joystick, buttons, @as([*c]Uint8, @ptrCast(@constCast(@alignCast(&data.*.rgucExtension)))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4))))), 2, @"false" != 0, @"true" != 0);
    if (@as(c_int, ctx.*.m_ucMotionPlusMode) == WII_MOTIONPLUS_MODE_GAMEPAD) {
        PostPackedButtonData(ctx.*.timestamp, joystick, @ptrCast(@alignCast(&MP_FIXUP_DPAD_BUTTON_DEFS)), @ptrCast(@alignCast(&data.*.rgucExtension)), 2, @"false" != 0, @"true" != 0);
    }
    zl = @bitCast(@as(i8, @truncate(@as(c_int, data.*.rgucExtension[@as(c_int, 5)]) & @as(c_int, 128))));
    zr = @bitCast(@as(i8, @truncate(@as(c_int, data.*.rgucExtension[@as(c_int, 5)]) & @as(c_int, 4))));
    SDL_SendJoystickAxis(ctx.*.timestamp, joystick, SDL_GAMEPAD_AXIS_LEFT_TRIGGER, @truncate(if (zl != 0) -@as(c_int, 32768) else SDL_JOYSTICK_AXIS_MAX));
    SDL_SendJoystickAxis(ctx.*.timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHT_TRIGGER, @truncate(if (zr != 0) -@as(c_int, 32768) else SDL_JOYSTICK_AXIS_MAX));
    if (@as(c_int, ctx.*.m_ucMotionPlusMode) == WII_MOTIONPLUS_MODE_GAMEPAD) {
        lx = @bitCast(@as(i8, @truncate(@as(c_int, data.*.rgucExtension[@as(c_int, 0)]) & @as(c_int, 62))));
        ly = @bitCast(@as(i8, @truncate(@as(c_int, data.*.rgucExtension[@as(c_int, 1)]) & @as(c_int, 62))));
    } else {
        lx = @bitCast(@as(i8, @truncate(@as(c_int, data.*.rgucExtension[@as(c_int, 0)]) & @as(c_int, 63))));
        ly = @bitCast(@as(i8, @truncate(@as(c_int, data.*.rgucExtension[@as(c_int, 1)]) & @as(c_int, 63))));
    }
    rx = @bitCast(@as(i8, @truncate(((@as(c_int, data.*.rgucExtension[@as(c_int, 2)]) >> @intCast(@as(c_int, 7))) | ((@as(c_int, data.*.rgucExtension[@as(c_int, 1)]) >> @intCast(@as(c_int, 5))) & @as(c_int, 6))) | ((@as(c_int, data.*.rgucExtension[@as(c_int, 0)]) >> @intCast(@as(c_int, 3))) & @as(c_int, 24)))));
    ry = @bitCast(@as(i8, @truncate(@as(c_int, data.*.rgucExtension[@as(c_int, 2)]) & @as(c_int, 31))));
    PostStickCalibrated(ctx.*.timestamp, joystick, &ctx.*.m_StickCalibrationData[@as(c_int, 0)], SDL_GAMEPAD_AXIS_LEFTX, lx);
    PostStickCalibrated(ctx.*.timestamp, joystick, &ctx.*.m_StickCalibrationData[@as(c_int, 1)], SDL_GAMEPAD_AXIS_LEFTY, ly);
    PostStickCalibrated(ctx.*.timestamp, joystick, &ctx.*.m_StickCalibrationData[@as(c_int, 2)], SDL_GAMEPAD_AXIS_RIGHTX, rx);
    PostStickCalibrated(ctx.*.timestamp, joystick, &ctx.*.m_StickCalibrationData[@as(c_int, 3)], SDL_GAMEPAD_AXIS_RIGHTY, ry);
}
pub fn HandleWiiRemoteButtonData(ctx: [*c]SDL_DriverWii_Context, joystick: [*c]SDL_Joystick, data: [*c]const WiiButtonData) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local_buttons = struct {
        var buttons: [2][8]Uint8 = [2][8]Uint8{
            [8]Uint8{
                k_eWiiButtons_DPad_Left,
                k_eWiiButtons_DPad_Right,
                k_eWiiButtons_DPad_Down,
                k_eWiiButtons_DPad_Up,
                k_eWiiButtons_Plus,
                255,
                255,
                255,
            },
            [8]Uint8{
                k_eWiiButtons_Two,
                k_eWiiButtons_One,
                k_eWiiButtons_B,
                k_eWiiButtons_A,
                k_eWiiButtons_Minus,
                255,
                255,
                k_eWiiButtons_Home,
            },
        };
    };
    _ = &static_local_buttons;
    if (data.*.hasBaseButtons) {
        PostPackedButtonData(ctx.*.timestamp, joystick, @ptrCast(@alignCast(&static_local_buttons.buttons)), @ptrCast(@alignCast(&data.*.rgucBaseButtons)), 2, @"true" != 0, @"false" != 0);
    }
}
pub fn HandleWiiRemoteButtonDataAsMainController(ctx: [*c]SDL_DriverWii_Context, joystick: [*c]SDL_Joystick, data: [*c]const WiiButtonData) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local_buttons = struct {
        var buttons: [2][8]Uint8 = [2][8]Uint8{
            [8]Uint8{
                SDL_GAMEPAD_BUTTON_DPAD_LEFT,
                SDL_GAMEPAD_BUTTON_DPAD_RIGHT,
                SDL_GAMEPAD_BUTTON_DPAD_DOWN,
                SDL_GAMEPAD_BUTTON_DPAD_UP,
                SDL_GAMEPAD_BUTTON_START,
                255,
                255,
                255,
            },
            [8]Uint8{
                SDL_GAMEPAD_BUTTON_NORTH,
                SDL_GAMEPAD_BUTTON_WEST,
                SDL_GAMEPAD_BUTTON_SOUTH,
                SDL_GAMEPAD_BUTTON_EAST,
                SDL_GAMEPAD_BUTTON_BACK,
                255,
                255,
                SDL_GAMEPAD_BUTTON_GUIDE,
            },
        };
    };
    _ = &static_local_buttons;
    if (data.*.hasBaseButtons) {
        PostPackedButtonData(ctx.*.timestamp, joystick, @ptrCast(@alignCast(&static_local_buttons.buttons)), @ptrCast(@alignCast(&data.*.rgucBaseButtons)), 2, @"true" != 0, @"false" != 0);
    }
}
pub fn HandleNunchuckButtonData(ctx: [*c]SDL_DriverWii_Context, joystick: [*c]SDL_Joystick, data: [*c]const WiiButtonData) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var c_button: bool = undefined;
    _ = &c_button;
    var z_button: bool = undefined;
    _ = &z_button;
    if (@as(c_int, data.*.ucNExtensionBytes) < @as(c_int, 6)) {
        return;
    }
    if (@as(c_int, ctx.*.m_ucMotionPlusMode) == WII_MOTIONPLUS_MODE_NUNCHUK) {
        c_button = (if ((@as(c_int, data.*.rgucExtension[@as(c_int, 5)]) & @as(c_int, 8)) != 0) @"false" else @"true") != 0;
        z_button = (if ((@as(c_int, data.*.rgucExtension[@as(c_int, 5)]) & @as(c_int, 4)) != 0) @"false" else @"true") != 0;
    } else {
        c_button = (if ((@as(c_int, data.*.rgucExtension[@as(c_int, 5)]) & @as(c_int, 2)) != 0) @"false" else @"true") != 0;
        z_button = (if ((@as(c_int, data.*.rgucExtension[@as(c_int, 5)]) & @as(c_int, 1)) != 0) @"false" else @"true") != 0;
    }
    SDL_SendJoystickButton(ctx.*.timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_SHOULDER, c_button);
    SDL_SendJoystickAxis(ctx.*.timestamp, joystick, SDL_GAMEPAD_AXIS_LEFT_TRIGGER, @truncate(if (z_button) SDL_JOYSTICK_AXIS_MAX else -@as(c_int, 32768)));
    PostStickCalibrated(ctx.*.timestamp, joystick, &ctx.*.m_StickCalibrationData[@as(c_int, 0)], SDL_GAMEPAD_AXIS_LEFTX, data.*.rgucExtension[@as(c_int, 0)]);
    PostStickCalibrated(ctx.*.timestamp, joystick, &ctx.*.m_StickCalibrationData[@as(c_int, 1)], SDL_GAMEPAD_AXIS_LEFTY, data.*.rgucExtension[@as(c_int, 1)]);
    if (ctx.*.m_bReportSensors) {
        const ACCEL_RES_PER_G: f32 = 200.0;
        _ = &ACCEL_RES_PER_G;
        var x: Sint16 = undefined;
        _ = &x;
        var y: Sint16 = undefined;
        _ = &y;
        var z: Sint16 = undefined;
        _ = &z;
        var values: [3]f32 = undefined;
        _ = &values;
        x = @truncate(@as(c_int, data.*.rgucExtension[@as(c_int, 2)]) << @intCast(@as(c_int, 2)));
        y = @truncate(@as(c_int, data.*.rgucExtension[@as(c_int, 3)]) << @intCast(@as(c_int, 2)));
        z = @truncate(@as(c_int, data.*.rgucExtension[@as(c_int, 4)]) << @intCast(@as(c_int, 2)));
        if (@as(c_int, ctx.*.m_ucMotionPlusMode) == WII_MOTIONPLUS_MODE_NUNCHUK) {
            {
                const ref = &x;
                ref.* = @truncate(@as(c_int, ref.*) | ((@as(c_int, data.*.rgucExtension[@as(c_int, 5)]) >> @intCast(@as(c_int, 3))) & @as(c_int, 2)));
            }
            {
                const ref = &y;
                ref.* = @truncate(@as(c_int, ref.*) | ((@as(c_int, data.*.rgucExtension[@as(c_int, 5)]) >> @intCast(@as(c_int, 4))) & @as(c_int, 2)));
            }
            {
                const ref = &z;
                ref.* = @truncate(@as(c_int, ref.*) & ~@as(c_int, 4));
            }
            {
                const ref = &z;
                ref.* = @truncate(@as(c_int, ref.*) | ((@as(c_int, data.*.rgucExtension[@as(c_int, 5)]) >> @intCast(@as(c_int, 5))) & @as(c_int, 6)));
            }
        } else {
            {
                const ref = &x;
                ref.* = @truncate(@as(c_int, ref.*) | ((@as(c_int, data.*.rgucExtension[@as(c_int, 5)]) >> @intCast(@as(c_int, 2))) & @as(c_int, 3)));
            }
            {
                const ref = &y;
                ref.* = @truncate(@as(c_int, ref.*) | ((@as(c_int, data.*.rgucExtension[@as(c_int, 5)]) >> @intCast(@as(c_int, 4))) & @as(c_int, 3)));
            }
            {
                const ref = &z;
                ref.* = @truncate(@as(c_int, ref.*) | ((@as(c_int, data.*.rgucExtension[@as(c_int, 5)]) >> @intCast(@as(c_int, 6))) & @as(c_int, 3)));
            }
        }
        {
            const ref = &x;
            ref.* = @truncate(@as(c_int, ref.*) - @as(c_int, 512));
        }
        {
            const ref = &y;
            ref.* = @truncate(@as(c_int, ref.*) - @as(c_int, 512));
        }
        {
            const ref = &z;
            ref.* = @truncate(@as(c_int, ref.*) - @as(c_int, 512));
        }
        values[@as(c_int, 0)] = -(@as(f32, @floatFromInt(x)) / ACCEL_RES_PER_G) * SDL_STANDARD_GRAVITY;
        values[@as(c_int, 1)] = (@as(f32, @floatFromInt(z)) / ACCEL_RES_PER_G) * SDL_STANDARD_GRAVITY;
        values[@as(c_int, 2)] = (@as(f32, @floatFromInt(y)) / ACCEL_RES_PER_G) * SDL_STANDARD_GRAVITY;
        SDL_SendJoystickSensor(ctx.*.timestamp, joystick, SDL_SENSOR_ACCEL_L, ctx.*.timestamp, @ptrCast(@alignCast(&values)), 3);
    }
}
pub fn HandleMotionPlusData(ctx: [*c]SDL_DriverWii_Context, joystick: [*c]SDL_Joystick, data: [*c]const WiiButtonData) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (ctx.*.m_bReportSensors) {
        const GYRO_RES_PER_DEGREE: f32 = 8192.0;
        _ = &GYRO_RES_PER_DEGREE;
        var x: c_int = undefined;
        _ = &x;
        var y: c_int = undefined;
        _ = &y;
        var z: c_int = undefined;
        _ = &z;
        var values: [3]f32 = undefined;
        _ = &values;
        x = (@as(c_int, data.*.rgucExtension[@as(c_int, 0)]) | ((@as(c_int, data.*.rgucExtension[@as(c_int, 3)]) << @intCast(@as(c_int, 6))) & @as(c_int, 65280))) - @as(c_int, 8192);
        y = (@as(c_int, data.*.rgucExtension[@as(c_int, 1)]) | ((@as(c_int, data.*.rgucExtension[@as(c_int, 4)]) << @intCast(@as(c_int, 6))) & @as(c_int, 65280))) - @as(c_int, 8192);
        z = (@as(c_int, data.*.rgucExtension[@as(c_int, 2)]) | ((@as(c_int, data.*.rgucExtension[@as(c_int, 5)]) << @intCast(@as(c_int, 6))) & @as(c_int, 65280))) - @as(c_int, 8192);
        if ((@as(c_int, data.*.rgucExtension[@as(c_int, 3)]) & @as(c_int, 2)) != 0) {
            x *= 440;
        } else {
            x *= 2000;
        }
        if ((@as(c_int, data.*.rgucExtension[@as(c_int, 4)]) & @as(c_int, 2)) != 0) {
            y *= 440;
        } else {
            y *= 2000;
        }
        if ((@as(c_int, data.*.rgucExtension[@as(c_int, 3)]) & @as(c_int, 1)) != 0) {
            z *= 440;
        } else {
            z *= 2000;
        }
        values[@as(c_int, 0)] = (-(@as(f32, @floatFromInt(z)) / GYRO_RES_PER_DEGREE) * SDL_PI_F) / @as(f32, 180.0);
        values[@as(c_int, 1)] = ((@as(f32, @floatFromInt(x)) / GYRO_RES_PER_DEGREE) * SDL_PI_F) / @as(f32, 180.0);
        values[@as(c_int, 2)] = ((@as(f32, @floatFromInt(y)) / GYRO_RES_PER_DEGREE) * SDL_PI_F) / @as(f32, 180.0);
        SDL_SendJoystickSensor(ctx.*.timestamp, joystick, SDL_SENSOR_GYRO, ctx.*.timestamp, @ptrCast(@alignCast(&values)), 3);
    }
}
pub fn HandleWiiRemoteAccelData(ctx: [*c]SDL_DriverWii_Context, joystick: [*c]SDL_Joystick, data: [*c]const WiiButtonData) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const ACCEL_RES_PER_G: f32 = 100.0;
    _ = &ACCEL_RES_PER_G;
    var x: Sint16 = undefined;
    _ = &x;
    var y: Sint16 = undefined;
    _ = &y;
    var z: Sint16 = undefined;
    _ = &z;
    var values: [3]f32 = undefined;
    _ = &values;
    if (!ctx.*.m_bReportSensors) {
        return;
    }
    x = @truncate(((@as(c_int, data.*.rgucAccelerometer[@as(c_int, 0)]) << @intCast(@as(c_int, 2))) | ((@as(c_int, data.*.rgucBaseButtons[@as(c_int, 0)]) >> @intCast(@as(c_int, 5))) & @as(c_int, 3))) - @as(c_int, 512));
    y = @truncate(((@as(c_int, data.*.rgucAccelerometer[@as(c_int, 1)]) << @intCast(@as(c_int, 2))) | ((@as(c_int, data.*.rgucBaseButtons[@as(c_int, 1)]) >> @intCast(@as(c_int, 4))) & @as(c_int, 2))) - @as(c_int, 512));
    z = @truncate(((@as(c_int, data.*.rgucAccelerometer[@as(c_int, 2)]) << @intCast(@as(c_int, 2))) | ((@as(c_int, data.*.rgucBaseButtons[@as(c_int, 1)]) >> @intCast(@as(c_int, 5))) & @as(c_int, 2))) - @as(c_int, 512));
    values[@as(c_int, 0)] = -(@as(f32, @floatFromInt(x)) / ACCEL_RES_PER_G) * SDL_STANDARD_GRAVITY;
    values[@as(c_int, 1)] = (@as(f32, @floatFromInt(z)) / ACCEL_RES_PER_G) * SDL_STANDARD_GRAVITY;
    values[@as(c_int, 2)] = (@as(f32, @floatFromInt(y)) / ACCEL_RES_PER_G) * SDL_STANDARD_GRAVITY;
    SDL_SendJoystickSensor(ctx.*.timestamp, joystick, SDL_SENSOR_ACCEL, ctx.*.timestamp, @ptrCast(@alignCast(&values)), 3);
}
pub fn HandleButtonData(ctx: [*c]SDL_DriverWii_Context, joystick: [*c]SDL_Joystick, data: [*c]WiiButtonData) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (ctx.*.m_eExtensionControllerType == @as(EWiiExtensionControllerType, k_eWiiExtensionControllerType_WiiUPro)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                HandleWiiUProButtonData(ctx, joystick, data);
                return;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                if ((@as(c_int, ctx.*.m_ucMotionPlusMode) != WII_MOTIONPLUS_MODE_NONE) and (@as(c_int, data.*.ucNExtensionBytes) > @as(c_int, 5))) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                if ((@as(c_int, data.*.rgucExtension[@as(c_int, 5)]) & @as(c_int, 1)) != 0) {
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
                HandleWiiRemoteButtonData(ctx, joystick, data);
                switch (ctx.*.m_eExtensionControllerType) {
                    @as(EWiiExtensionControllerType, k_eWiiExtensionControllerType_Nunchuk) => {
                        sdl_pc = 23;
                        continue;
                    },
                    @as(EWiiExtensionControllerType, k_eWiiExtensionControllerType_None) => {
                        sdl_pc = 24;
                        continue;
                    },
                    @as(EWiiExtensionControllerType, k_eWiiExtensionControllerType_Gamepad) => {
                        sdl_pc = 25;
                        continue;
                    },
                    else => {
                        sdl_pc = 26;
                        continue;
                    },
                }
            },
            7 => {
                return;
            },
            8 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                if ((@as(c_int, data.*.rgucExtension[@as(c_int, 4)]) & @as(c_int, 1)) != 0) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                if (ctx.*.m_eExtensionControllerType == @as(EWiiExtensionControllerType, k_eWiiExtensionControllerType_None)) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            11 => {
                if (ctx.*.m_eExtensionControllerType != @as(EWiiExtensionControllerType, k_eWiiExtensionControllerType_None)) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            12 => {
                if ((@as(c_int, data.*.rgucExtension[@as(c_int, 5)]) & @as(c_int, 2)) != 0) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            13 => {
                ctx.*.m_bDisconnected = @"true" != 0;
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
                ctx.*.m_bDisconnected = @"true" != 0;
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
                    sdl_pc = 12;
                    continue;
                }
            },
            19 => {
                HandleMotionPlusData(ctx, joystick, data);
                data.*.ucNExtensionBytes = 0;
                {
                    sdl_pc = 21;
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
                    sdl_pc = 6;
                    continue;
                }
            },
            22 => {
                HandleWiiRemoteAccelData(ctx, joystick, data);
                {}
            },
            23 => {
                HandleNunchuckButtonData(ctx, joystick, data);
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            24 => {
                HandleWiiRemoteButtonDataAsMainController(ctx, joystick, data);
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            25 => {
                HandleGamepadControllerButtonData(ctx, joystick, data);
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
pub fn GetBaseButtons(dst: [*c]WiiButtonData, src: [*c]const Uint8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = memcpy(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&dst.*.rgucBaseButtons))))), @ptrCast(@alignCast(src)), 2);
    dst.*.hasBaseButtons = @"true" != 0;
}
pub fn GetAccelerometer(dst: [*c]WiiButtonData, src: [*c]const Uint8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = memcpy(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&dst.*.rgucAccelerometer))))), @ptrCast(@alignCast(src)), 3);
    dst.*.hasAccelerometer = @"true" != 0;
}
pub fn GetExtensionData(dst: [*c]WiiButtonData, src: [*c]const Uint8, arg_size: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var size = arg_size;
    _ = &size;
    var valid_data: bool = @"false" != 0;
    _ = &valid_data;
    var i: c_int = undefined;
    _ = &i;
    if (@as(c_ulong, @bitCast(@as(c_long, size))) > @sizeOf(@TypeOf(dst.*.rgucExtension))) {
        size = @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(dst.*.rgucExtension)))));
    }
    {
        i = 0;
        while (i < size) : (i += 1) {
            if (@as(c_int, src[@bitCast(@as(isize, @intCast(i)))]) != @as(c_int, 255)) {
                valid_data = @"true" != 0;
                break;
            }
        }
    }
    if (valid_data) {
        _ = memcpy(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&dst.*.rgucExtension))))), @ptrCast(@alignCast(src)), @bitCast(@as(c_long, size)));
        dst.*.ucNExtensionBytes = @bitCast(@as(i8, @truncate(size)));
    }
}
pub fn HandleStatus(ctx: [*c]SDL_DriverWii_Context, joystick: [*c]SDL_Joystick) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var hadExtension: bool = ctx.*.m_eExtensionControllerType != @as(EWiiExtensionControllerType, k_eWiiExtensionControllerType_None);
    _ = &hadExtension;
    var hasExtension: bool = (if ((@as(c_int, ctx.*.m_rgucReadBuffer[@as(c_int, 3)]) & @as(c_int, 2)) != 0) @"true" else @"false") != 0;
    _ = &hasExtension;
    var data: WiiButtonData = undefined;
    _ = &data;
    _ = memset(@ptrCast(@alignCast(&data)), 0, @sizeOf(@TypeOf(data)));
    GetBaseButtons(&data, @as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.m_rgucReadBuffer))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1))))));
    HandleButtonData(ctx, joystick, &data);
    if (ctx.*.m_eExtensionControllerType != @as(EWiiExtensionControllerType, k_eWiiExtensionControllerType_WiiUPro)) {
        UpdatePowerLevelWii(joystick, ctx.*.m_rgucReadBuffer[@as(c_int, 6)]);
    }
    ResetButtonPacketType(ctx);
    SDL_LogDebug_REAL(SDL_LOG_CATEGORY_INPUT, "HIDAPI Wii: Status update, extension %s", if (hasExtension) @as([*c]u8, @as([*c]u8, @constCast("CONNECTED"))) else @as([*c]u8, @as([*c]u8, @constCast("DISCONNECTED"))));
    if (@as(c_int, ctx.*.m_ucMotionPlusMode) != WII_MOTIONPLUS_MODE_NONE) {
        if (NeedsPeriodicMotionPlusCheck(ctx, @"true" != 0)) {
            ctx.*.m_ulNextMotionPlusCheck = SDL_GetTicks_REAL();
        }
    } else if (@as(c_int, @intFromBool(hadExtension)) != @as(c_int, @intFromBool(hasExtension))) {
        ctx.*.m_bDisconnected = @"true" != 0;
    }
}
pub fn HandleResponse(ctx: [*c]SDL_DriverWii_Context, joystick: [*c]SDL_Joystick) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [14:0]u8 = "HandleResponse".*;
    };
    _ = &static_local___func__;
    var @"type": EWiiInputReportIDs = undefined;
    _ = &@"type";
    var data: WiiButtonData = undefined;
    _ = &data;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "type == k_eWiiInputReportIDs_Acknowledge || type == k_eWiiInputReportIDs_ReadMemory",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data;
    var sdl_assert_state: SDL_AssertState = undefined;
    _ = &sdl_assert_state;
    var extension: Uint16 = undefined;
    _ = &extension;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                @"type" = ctx.*.m_rgucReadBuffer[@as(c_int, 0)];
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            1 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            2 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                _ = memset(@ptrCast(@alignCast(&data)), 0, @sizeOf(@TypeOf(data)));
                GetBaseButtons(&data, @as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.m_rgucReadBuffer))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1))))));
                HandleButtonData(ctx, joystick, &data);
                switch (ctx.*.m_eCommState) {
                    @as(EWiiCommunicationState, k_eWiiCommunicationState_None) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(EWiiCommunicationState, k_eWiiCommunicationState_CheckMotionPlusStage1) => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(EWiiCommunicationState, k_eWiiCommunicationState_CheckMotionPlusStage2) => {
                        sdl_pc = 16;
                        continue;
                    },
                    else => {
                        sdl_pc = 32;
                        continue;
                    },
                }
            },
            4 => {
                if (!((@"type" == @as(EWiiInputReportIDs, k_eWiiInputReportIDs_Acknowledge)) or (@"type" == @as(EWiiInputReportIDs, k_eWiiInputReportIDs_ReadMemory)))) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_hidapi_wii.c", 1393);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            6 => {
                {
                    sdl_pc = 2;
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
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
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
                __builtin.debugtrap();
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
                    sdl_pc = 9;
                    continue;
                }
            },
            13 => {
                {}
            },
            14 => {
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
                extension = 0;
                if (ParseExtensionIdentifyResponse(ctx, &extension)) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            17 => {
                if ((@as(c_int, extension) & WII_EXTENSION_MOTIONPLUS_MASK) == WII_EXTENSION_MOTIONPLUS_ID) {
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
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            20 => {
                SDL_LogDebug_REAL(SDL_LOG_CATEGORY_INPUT, "HIDAPI Wii: Motion Plus CONNECTED (stage %d)", if (ctx.*.m_eCommState == @as(EWiiCommunicationState, k_eWiiCommunicationState_CheckMotionPlusStage1)) @as(c_int, 1) else @as(c_int, 2));
                if (!ctx.*.m_bMotionPlusPresent) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            21 => {
                if (ctx.*.m_eCommState == @as(EWiiCommunicationState, k_eWiiCommunicationState_CheckMotionPlusStage1)) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
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
                ctx.*.m_bDisconnected = @"true" != 0;
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
                ctx.*.m_eCommState = k_eWiiCommunicationState_None;
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            26 => {
                _ = ReadRegister(ctx, 10879230, 2, @"false" != 0);
                ctx.*.m_eCommState = k_eWiiCommunicationState_CheckMotionPlusStage2;
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            27 => {
                SDL_LogDebug_REAL(SDL_LOG_CATEGORY_INPUT, "HIDAPI Wii: Motion Plus DISCONNECTED (stage %d)", if (ctx.*.m_eCommState == @as(EWiiCommunicationState, k_eWiiCommunicationState_CheckMotionPlusStage1)) @as(c_int, 1) else @as(c_int, 2));
                if (ctx.*.m_bMotionPlusPresent) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            28 => {
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            29 => {
                ctx.*.m_bDisconnected = @"true" != 0;
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
                ctx.*.m_eCommState = k_eWiiCommunicationState_None;
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            32 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn HandleButtonPacket(ctx: [*c]SDL_DriverWii_Context, joystick: [*c]SDL_Joystick) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var eExpectedReport: EWiiInputReportIDs = undefined;
    _ = &eExpectedReport;
    var data: WiiButtonData = undefined;
    _ = &data;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                eExpectedReport = GetButtonPacketType(ctx);
                if (eExpectedReport != @as(EWiiInputReportIDs, @bitCast(@as(c_int, ctx.*.m_rgucReadBuffer[@as(c_int, 0)])))) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                SDL_LogDebug_REAL(SDL_LOG_CATEGORY_INPUT, "HIDAPI Wii: Resetting report mode to %d", eExpectedReport);
                _ = RequestButtonPacketType(ctx, eExpectedReport);
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
                _ = memset(@ptrCast(@alignCast(&data)), 0, @sizeOf(@TypeOf(data)));
                switch (@as(c_int, ctx.*.m_rgucReadBuffer[@as(c_int, 0)])) {
                    k_eWiiInputReportIDs_ButtonData0 => {
                        sdl_pc = 5;
                        continue;
                    },
                    k_eWiiInputReportIDs_ButtonData1 => {
                        sdl_pc = 6;
                        continue;
                    },
                    k_eWiiInputReportIDs_ButtonData3 => {
                        sdl_pc = 7;
                        continue;
                    },
                    k_eWiiInputReportIDs_ButtonData2 => {
                        sdl_pc = 8;
                        continue;
                    },
                    k_eWiiInputReportIDs_ButtonData4 => {
                        sdl_pc = 9;
                        continue;
                    },
                    k_eWiiInputReportIDs_ButtonData5 => {
                        sdl_pc = 10;
                        continue;
                    },
                    k_eWiiInputReportIDs_ButtonData6 => {
                        sdl_pc = 11;
                        continue;
                    },
                    k_eWiiInputReportIDs_ButtonData7 => {
                        sdl_pc = 12;
                        continue;
                    },
                    k_eWiiInputReportIDs_ButtonDataD => {
                        sdl_pc = 13;
                        continue;
                    },
                    k_eWiiInputReportIDs_ButtonDataE => {
                        sdl_pc = 14;
                        continue;
                    },
                    k_eWiiInputReportIDs_ButtonDataF => {
                        sdl_pc = 15;
                        continue;
                    },
                    else => {
                        sdl_pc = 16;
                        continue;
                    },
                }
            },
            4 => {
                HandleButtonData(ctx, joystick, &data);
                {}
            },
            5 => {
                GetBaseButtons(&data, @as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.m_rgucReadBuffer))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1))))));
                {
                    sdl_pc = 4;
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
                GetBaseButtons(&data, @as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.m_rgucReadBuffer))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1))))));
                GetAccelerometer(&data, @as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.m_rgucReadBuffer))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3))))));
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            8 => {
                GetBaseButtons(&data, @as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.m_rgucReadBuffer))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1))))));
                GetExtensionData(&data, @as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.m_rgucReadBuffer))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3))))), 8);
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            9 => {
                GetBaseButtons(&data, @as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.m_rgucReadBuffer))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1))))));
                GetExtensionData(&data, @as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.m_rgucReadBuffer))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3))))), 19);
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            10 => {
                GetBaseButtons(&data, @as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.m_rgucReadBuffer))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1))))));
                GetAccelerometer(&data, @as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.m_rgucReadBuffer))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3))))));
                GetExtensionData(&data, @as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.m_rgucReadBuffer))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 6))))), 16);
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            11 => {
                GetBaseButtons(&data, @as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.m_rgucReadBuffer))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1))))));
                GetExtensionData(&data, @as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.m_rgucReadBuffer))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 13))))), 9);
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            12 => {
                GetBaseButtons(&data, @as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.m_rgucReadBuffer))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1))))));
                GetExtensionData(&data, @as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.m_rgucReadBuffer))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16))))), 6);
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            13 => {
                GetExtensionData(&data, @as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.m_rgucReadBuffer))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1))))), 21);
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
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                SDL_LogDebug_REAL(SDL_LOG_CATEGORY_INPUT, "HIDAPI Wii: Unsupported button data type %02x", ctx.*.m_rgucReadBuffer[@as(c_int, 0)]);
                return;
            },
            else => unreachable,
        }
    }
}
pub fn HandleInput(ctx: [*c]SDL_DriverWii_Context, joystick: [*c]SDL_Joystick) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var @"type": EWiiInputReportIDs = ctx.*.m_rgucReadBuffer[@as(c_int, 0)];
    _ = &@"type";
    ctx.*.timestamp = SDL_GetTicksNS_REAL();
    if (@"type" == @as(EWiiInputReportIDs, k_eWiiInputReportIDs_Status)) {
        HandleStatus(ctx, joystick);
    } else if ((@"type" == @as(EWiiInputReportIDs, k_eWiiInputReportIDs_Acknowledge)) or (@"type" == @as(EWiiInputReportIDs, k_eWiiInputReportIDs_ReadMemory))) {
        HandleResponse(ctx, joystick);
    } else if ((@"type" >= @as(EWiiInputReportIDs, k_eWiiInputReportIDs_ButtonData0)) and (@"type" <= @as(EWiiInputReportIDs, k_eWiiInputReportIDs_ButtonDataF))) {
        HandleButtonPacket(ctx, joystick);
    } else {
        SDL_LogDebug_REAL(SDL_LOG_CATEGORY_INPUT, "HIDAPI Wii: Unexpected input packet of type %x", @"type");
    }
}
pub fn HIDAPI_DriverWii_UpdateDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverWii_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    var joystick: [*c]SDL_Joystick = null;
    _ = &joystick;
    var size: c_int = undefined;
    _ = &size;
    var now: Uint64 = undefined;
    _ = &now;
    if (device.*.num_joysticks > @as(c_int, 0)) {
        joystick = SDL_GetJoystickFromID_REAL(device.*.joysticks[@as(c_int, 0)]);
    } else {
        return @"false" != 0;
    }
    now = SDL_GetTicks_REAL();
    while ((blk: {
        const tmp = ReadInput(ctx);
        size = tmp;
        break :blk tmp;
    }) > @as(c_int, 0)) {
        if (joystick != null) {
            HandleInput(ctx, joystick);
        }
        ctx.*.m_ulLastInput = now;
    }
    {
        comptime {
            if (!(@"true" != 0)) @compileError("static assertion failed \"ENABLE_CONTINUOUS_REPORTING\"");
        }
    }
    if (now >= (ctx.*.m_ulLastInput +% @as(Uint64, @bitCast(@as(c_long, @as(c_int, 3) * @as(c_int, 1000)))))) {
        size = -@as(c_int, 1);
    }
    if (joystick != null) {
        if (ctx.*.m_eExtensionControllerType != @as(EWiiExtensionControllerType, k_eWiiExtensionControllerType_WiiUPro)) {
            if ((ctx.*.m_ulNextMotionPlusCheck != 0) and (@as(Uint64, @bitCast(@as(c_long, @intFromBool(now >= ctx.*.m_ulNextMotionPlusCheck)))) != 0)) {
                CheckMotionPlusConnection(ctx);
                if (NeedsPeriodicMotionPlusCheck(ctx, @"false" != 0)) {
                    SchedulePeriodicMotionPlusCheck(ctx);
                } else {
                    ctx.*.m_ulNextMotionPlusCheck = 0;
                }
            }
            if (!(ctx.*.m_ulLastStatus != 0) or (now >= (ctx.*.m_ulLastStatus +% @as(Uint64, @bitCast(@as(c_long, (@as(c_int, 15) * @as(c_int, 60)) * @as(c_int, 1000))))))) {
                var data: [2]Uint8 = undefined;
                _ = &data;
                data[@as(c_int, 0)] = k_eWiiOutputReportIDs_StatusRequest;
                data[@as(c_int, 1)] = @intFromBool(ctx.*.m_bRumbleActive);
                _ = WriteOutput(ctx, @ptrCast(@alignCast(&data)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(data))))), @"false" != 0);
                ctx.*.m_ulLastStatus = now;
            }
        }
    }
    if ((size < @as(c_int, 0)) or ctx.*.m_bDisconnected) {
        HIDAPI_JoystickDisconnected(device, device.*.joysticks[@as(c_int, 0)]);
    }
    return size >= @as(c_int, 0);
}
pub fn HIDAPI_DriverWii_CloseJoystick(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverWii_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    SDL_RemoveHintCallback_REAL("SDL_JOYSTICK_HIDAPI_WII_PLAYER_LED", SDL_PlayerLEDHintChanged, @ptrCast(@alignCast(ctx)));
    ctx.*.joystick = null;
}
pub fn HIDAPI_DriverWii_FreeDevice(_: [*c]SDL_HIDAPI_Device) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub export var SDL_HIDAPI_DriverWii: SDL_HIDAPI_DeviceDriver = SDL_HIDAPI_DeviceDriver{
    .name = "SDL_JOYSTICK_HIDAPI_WII",
    .enabled = @"true" != 0,
    .RegisterHints = HIDAPI_DriverWii_RegisterHints,
    .UnregisterHints = HIDAPI_DriverWii_UnregisterHints,
    .IsEnabled = HIDAPI_DriverWii_IsEnabled,
    .IsSupportedDevice = HIDAPI_DriverWii_IsSupportedDevice,
    .InitDevice = HIDAPI_DriverWii_InitDevice,
    .GetDevicePlayerIndex = HIDAPI_DriverWii_GetDevicePlayerIndex,
    .SetDevicePlayerIndex = HIDAPI_DriverWii_SetDevicePlayerIndex,
    .UpdateDevice = HIDAPI_DriverWii_UpdateDevice,
    .OpenJoystick = HIDAPI_DriverWii_OpenJoystick,
    .RumbleJoystick = HIDAPI_DriverWii_RumbleJoystick,
    .RumbleJoystickTriggers = HIDAPI_DriverWii_RumbleJoystickTriggers,
    .GetJoystickCapabilities = HIDAPI_DriverWii_GetJoystickCapabilities,
    .SetJoystickLED = HIDAPI_DriverWii_SetJoystickLED,
    .SendJoystickEffect = HIDAPI_DriverWii_SendJoystickEffect,
    .SetJoystickSensorsEnabled = HIDAPI_DriverWii_SetJoystickSensorsEnabled,
    .CloseJoystick = HIDAPI_DriverWii_CloseJoystick,
    .FreeDevice = HIDAPI_DriverWii_FreeDevice,
};

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_PI_F = @as(f32, 3.141592653589793238462643383279502884);
pub const SDL_STANDARD_GRAVITY = @as(f32, 9.80665);
pub const SDL_JOYSTICK_AXIS_MAX = @as(c_int, 32767);
pub const USB_VENDOR_NINTENDO = @as(c_int, 0x057e);
pub const USB_PRODUCT_NINTENDO_WII_REMOTE = @as(c_int, 0x0306);
pub const USB_PRODUCT_NINTENDO_WII_REMOTE2 = @as(c_int, 0x0330);
pub const SDL_JOYSTICK_CAP_RUMBLE = @as(c_int, 0x00000010);
pub const WII_EXTENSION_NONE = @as(c_int, 0x2E2E);
pub const WII_EXTENSION_UNINITIALIZED = __helpers.promoteIntLiteral(c_int, 0xFFFF, .hex);
pub const WII_EXTENSION_NUNCHUK = @as(c_int, 0x0000);
pub const WII_EXTENSION_GAMEPAD = @as(c_int, 0x0101);
pub const WII_EXTENSION_WIIUPRO = @as(c_int, 0x0120);
pub const WII_EXTENSION_MOTIONPLUS_MASK = __helpers.promoteIntLiteral(c_int, 0xF0FF, .hex);
pub const WII_EXTENSION_MOTIONPLUS_ID = @as(c_int, 0x0005);
pub const WII_MOTIONPLUS_MODE_NONE = @as(c_int, 0x00);
pub const WII_MOTIONPLUS_MODE_STANDARD = @as(c_int, 0x04);
pub const WII_MOTIONPLUS_MODE_NUNCHUK = @as(c_int, 0x05);
pub const WII_MOTIONPLUS_MODE_GAMEPAD = @as(c_int, 0x07);
