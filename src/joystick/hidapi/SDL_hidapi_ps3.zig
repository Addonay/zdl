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
pub extern fn SDL_strncasecmp_REAL(str1: [*c]const u8, str2: [*c]const u8, maxlen: usize) c_int;
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
pub const SDL_JOYSTICK_TYPE_GUITAR: c_int = 6;
pub const SDL_JOYSTICK_TYPE_DRUM_KIT: c_int = 7;
pub const enum_SDL_JoystickType = c_uint;
pub const SDL_JoystickType = enum_SDL_JoystickType;
pub extern fn SDL_GetJoystickFromID_REAL(instance_id: SDL_JoystickID) [*c]SDL_Joystick;
pub extern fn SDL_GetJoystickPlayerIndex_REAL(joystick: [*c]SDL_Joystick) c_int;
pub const SDL_GAMEPAD_TYPE_PS3: c_int = 4;
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
pub const struct_SDL_hid_device = opaque {
};
pub const SDL_hid_device = struct_SDL_hid_device;
pub extern fn SDL_hid_write_REAL(dev: ?*SDL_hid_device, data: [*c]const u8, length: usize) c_int;
pub extern fn SDL_hid_read_timeout_REAL(dev: ?*SDL_hid_device, data: [*c]u8, length: usize, milliseconds: c_int) c_int;
pub extern fn SDL_hid_send_feature_report_REAL(dev: ?*SDL_hid_device, data: [*c]const u8, length: usize) c_int;
pub extern fn SDL_hid_get_feature_report_REAL(dev: ?*SDL_hid_device, data: [*c]u8, length: usize) c_int;
pub extern fn SDL_GetHintBoolean_REAL(name: [*c]const u8, default_value: bool) bool;
pub const SDL_HintCallback = ?*const fn (userdata: ?*anyopaque, name: [*c]const u8, oldValue: [*c]const u8, newValue: [*c]const u8) callconv(.c) void;
pub extern fn SDL_AddHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) bool;
pub extern fn SDL_RemoveHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) void;
pub const SDL_LOG_CATEGORY_INPUT: c_int = 7;
pub extern fn SDL_LogDebug_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_GetTicksNS_REAL() Uint64;
pub extern fn SDL_AssertJoysticksLocked() void;
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
pub extern fn HIDAPI_SupportsPlaystationDetection(vendor: Uint16, product: Uint16) bool;
pub extern fn SDL_HIDAPI_SendRumble(device: [*c]SDL_HIDAPI_Device, data: [*c]const Uint8, size: c_int) c_int;
pub const k_EPS3ReportIdState: c_int = 1;
pub const k_EPS3ReportIdEffects: c_int = 1;
pub const k_EPS3SonySixaxisReportIdState: c_int = 0;
pub const k_EPS3SonySixaxisReportIdEffects: c_int = 0;
pub const k_EPS3SixaxisCommandSetLEDs: c_int = 1;
pub const k_EPS3SixaxisCommandSetMotors: c_int = 2;
pub const SDL_DriverPS3_Context = extern struct {
    device: [*c]SDL_HIDAPI_Device = null,
    joystick: [*c]SDL_Joystick = null,
    is_shanwan: bool = false,
    has_analog_buttons: bool = false,
    report_sensors: bool = false,
    effects_updated: bool = false,
    player_index: c_int = 0,
    rumble_left: Uint8 = 0,
    rumble_right: Uint8 = 0,
    last_state: [64]Uint8 = @import("std").mem.zeroes([64]Uint8),
};
pub fn HIDAPI_DriverPS3_RegisterHints(callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = SDL_AddHintCallback_REAL("SDL_JOYSTICK_HIDAPI_PS3", callback, userdata);
}
pub fn HIDAPI_DriverPS3_UnregisterHints(callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_RemoveHintCallback_REAL("SDL_JOYSTICK_HIDAPI_PS3", callback, userdata);
}
pub fn HIDAPI_DriverPS3_IsEnabled() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var default_value: bool = undefined;
    _ = &default_value;
    default_value = @"false" != 0;
    if (default_value) {
        default_value = SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI", @"true" != 0);
    }
    return SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI_PS3", default_value);
}
pub fn HIDAPI_DriverPS3_IsSupportedDevice(_: [*c]SDL_HIDAPI_Device, _: [*c]const u8, arg_type: SDL_GamepadType, vendor_id: Uint16, product_id: Uint16, _: Uint16, _: c_int, _: c_int, _: c_int, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    if ((@as(c_int, vendor_id) == USB_VENDOR_SONY) and (@as(c_int, product_id) == USB_PRODUCT_SONY_DS3)) {
        return @"true" != 0;
    }
    if ((@as(c_int, vendor_id) == USB_VENDOR_SHANWAN) and (@as(c_int, product_id) == USB_PRODUCT_SHANWAN_DS3)) {
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub fn ReadFeatureReport(dev: ?*SDL_hid_device, report_id: Uint8, report: [*c]Uint8, length: usize) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    _ = memset(@ptrCast(@alignCast(report)), 0, length);
    report[@as(c_int, 0)] = report_id;
    return SDL_hid_get_feature_report_REAL(dev, report, length);
}
pub fn SendFeatureReport(dev: ?*SDL_hid_device, report: [*c]Uint8, length: usize) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return SDL_hid_send_feature_report_REAL(dev, report, length);
}
pub fn HIDAPI_DriverPS3_InitDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS3_Context = undefined;
    _ = &ctx;
    var is_shanwan: bool = @"false" != 0;
    _ = &is_shanwan;
    if ((@as(c_int, device.*.vendor_id) == USB_VENDOR_SONY) and (SDL_strncasecmp_REAL(device.*.name, "ShanWan", 7) == @as(c_int, 0))) {
        is_shanwan = @"true" != 0;
    }
    if ((@as(c_int, device.*.vendor_id) == USB_VENDOR_SHANWAN) or (@as(c_int, device.*.vendor_id) == USB_VENDOR_SHANWAN_ALT)) {
        is_shanwan = @"true" != 0;
    }
    ctx = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(ctx.*)))));
    if (!(ctx != null)) {
        return @"false" != 0;
    }
    ctx.*.device = device;
    ctx.*.is_shanwan = is_shanwan;
    ctx.*.has_analog_buttons = @"true" != 0;
    device.*.context = @ptrCast(@alignCast(ctx));
    if (device.*.is_bluetooth) {
        var data: [5]Uint8 = [5]Uint8{
            244,
            66,
            3,
            0,
            0,
        };
        _ = &data;
        _ = SendFeatureReport(device.*.dev, @ptrCast(@alignCast(&data)), @sizeOf(@TypeOf(data)));
    }
    if (!device.*.is_bluetooth) {
        var data: [64]Uint8 = undefined;
        _ = &data;
        var size: c_int = ReadFeatureReport(device.*.dev, 242, @ptrCast(@alignCast(&data)), 17);
        _ = &size;
        if (size < @as(c_int, 0)) {
            SDL_LogDebug_REAL(SDL_LOG_CATEGORY_INPUT, "HIDAPI_DriverPS3_InitDevice(): Couldn't read feature report 0xf2");
            return @"false" != 0;
        }
        size = ReadFeatureReport(device.*.dev, 245, @ptrCast(@alignCast(&data)), 8);
        if (size < @as(c_int, 0)) {
            SDL_LogDebug_REAL(SDL_LOG_CATEGORY_INPUT, "HIDAPI_DriverPS3_InitDevice(): Couldn't read feature report 0xf5");
            return @"false" != 0;
        }
        if (!ctx.*.is_shanwan) {
            _ = SDL_hid_write_REAL(device.*.dev, @ptrCast(@alignCast(&data)), 1);
        }
    }
    device.*.type = SDL_GAMEPAD_TYPE_PS3;
    HIDAPI_SetDeviceName(device, "PS3 Controller");
    return HIDAPI_JoystickConnected(device, null);
}
pub fn HIDAPI_DriverPS3_GetDevicePlayerIndex(_: [*c]SDL_HIDAPI_Device, _: SDL_JoystickID) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return -@as(c_int, 1);
}
pub fn HIDAPI_DriverPS3_UpdateEffects(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS3_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    var effects: [35]Uint8 = [35]Uint8{
        1,
        255,
        0,
        255,
        0,
        0,
        0,
        0,
        0,
        0,
        255,
        39,
        16,
        0,
        50,
        255,
        39,
        16,
        0,
        50,
        255,
        39,
        16,
        0,
        50,
        255,
        39,
        16,
        0,
        50,
        0,
        0,
        0,
        0,
        0,
    };
    _ = &effects;
    effects[@as(c_int, 2)] = @bitCast(@as(i8, @truncate(if (ctx.*.rumble_right != 0) @as(c_int, 1) else @as(c_int, 0))));
    effects[@as(c_int, 4)] = ctx.*.rumble_left;
    effects[@as(c_int, 9)] = @bitCast(@as(i8, @truncate(@as(c_int, 1) << @intCast(@as(c_int, 1) + __helpers.signedRemainder(ctx.*.player_index, @as(c_int, 4))))));
    return HIDAPI_DriverPS3_SendJoystickEffect(device, ctx.*.joystick, @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&effects))))), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(effects))))));
}
pub fn HIDAPI_DriverPS3_SetDevicePlayerIndex(device: [*c]SDL_HIDAPI_Device, _: SDL_JoystickID, player_index: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS3_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    if (!(ctx != null)) {
        return;
    }
    ctx.*.player_index = player_index;
    _ = HIDAPI_DriverPS3_UpdateEffects(device);
}
pub fn HIDAPI_DriverPS3_OpenJoystick(device: [*c]SDL_HIDAPI_Device, joystick: [*c]SDL_Joystick) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS3_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    SDL_AssertJoysticksLocked();
    ctx.*.joystick = joystick;
    ctx.*.effects_updated = @"false" != 0;
    ctx.*.rumble_left = 0;
    ctx.*.rumble_right = 0;
    _ = memset(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.last_state))))), 0, @sizeOf(@TypeOf(ctx.*.last_state)));
    ctx.*.player_index = SDL_GetJoystickPlayerIndex_REAL(joystick);
    joystick.*.nbuttons = 11;
    joystick.*.naxes = 6;
    if (ctx.*.has_analog_buttons) {
        joystick.*.naxes += 10;
    }
    joystick.*.nhats = 1;
    SDL_PrivateJoystickAddSensor(joystick, SDL_SENSOR_ACCEL, 100.0);
    return @"true" != 0;
}
pub fn HIDAPI_DriverPS3_RumbleJoystick(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, low_frequency_rumble: Uint16, high_frequency_rumble: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS3_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    ctx.*.rumble_left = @bitCast(@as(i8, @truncate(@as(c_int, low_frequency_rumble) >> @intCast(@as(c_int, 8)))));
    ctx.*.rumble_right = @bitCast(@as(i8, @truncate(@as(c_int, high_frequency_rumble) >> @intCast(@as(c_int, 8)))));
    return HIDAPI_DriverPS3_UpdateEffects(device);
}
pub fn HIDAPI_DriverPS3_RumbleJoystickTriggers(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: Uint16, _: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverPS3_GetJoystickCapabilities(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    return SDL_JOYSTICK_CAP_RUMBLE;
}
pub fn HIDAPI_DriverPS3_SetJoystickLED(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: Uint8, _: Uint8, _: Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverPS3_SendJoystickEffect(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, effect: ?*const anyopaque, size: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var data: [49]Uint8 = undefined;
    _ = &data;
    var report_size: c_int = undefined;
    _ = &report_size;
    var offset: c_int = undefined;
    _ = &offset;
    _ = memset(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&data))))), 0, @sizeOf(@TypeOf(data)));
    data[@as(c_int, 0)] = k_EPS3ReportIdEffects;
    report_size = @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(data)))));
    offset = 1;
    _ = memcpy(@ptrCast(@alignCast(&data[@bitCast(@as(isize, @intCast(offset)))])), effect, if ((@sizeOf(@TypeOf(data)) -% @as(c_ulong, @bitCast(@as(c_long, offset)))) < @as(usize, @bitCast(@as(c_long, size)))) @sizeOf(@TypeOf(data)) -% @as(c_ulong, @bitCast(@as(c_long, offset))) else @as(usize, @bitCast(@as(c_long, size))));
    if (SDL_HIDAPI_SendRumble(device, @ptrCast(@alignCast(&data)), report_size) != report_size) {
        return SDL_SetError_REAL("Couldn't send rumble packet");
    }
    return @"true" != 0;
}
pub fn HIDAPI_DriverPS3_SetJoystickSensorsEnabled(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, enabled: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS3_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    ctx.*.report_sensors = enabled;
    return @"true" != 0;
}
pub fn HIDAPI_DriverPS3_ScaleAccel(arg_value: Sint16) callconv(.c) f32 {
    @setEvalBranchQuota(100000);
    var value = arg_value;
    _ = &value;
    value = @bitCast(@as(c_ushort, @truncate(@byteSwap(@as(c_ushort, @bitCast(@as(c_short, value)))))));
    return (@as(f32, @floatFromInt(@as(c_int, value) - @as(c_int, 511))) / @as(f32, 113.0)) * SDL_STANDARD_GRAVITY;
}
pub fn HIDAPI_DriverPS3ThirdParty_ScaleAccel(value: Sint16) callconv(.c) f32 {
    @setEvalBranchQuota(100000);
    return (@as(f32, @floatFromInt(@as(c_int, value) - @as(c_int, 512))) / @as(f32, 113.0)) * SDL_STANDARD_GRAVITY;
}
pub fn HIDAPI_DriverPS3_HandleMiniStatePacket(joystick: [*c]SDL_Joystick, ctx: [*c]SDL_DriverPS3_Context, data: [*c]Uint8, size: c_int) callconv(.c) void {
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
                if (@as(c_int, ctx.*.last_state[@as(c_int, 4)]) != @as(c_int, data[@as(c_int, 4)])) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                switch (@as(c_int, data[@as(c_int, 4)]) & @as(c_int, 15)) {
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
                if (@as(c_int, ctx.*.last_state[@as(c_int, 5)]) != @as(c_int, data[@as(c_int, 5)])) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            4 => {
                SDL_SendJoystickHat(timestamp, joystick, 0, hat);
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_NORTH, (@as(c_int, data[@as(c_int, 4)]) & @as(c_int, 16)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_EAST, (@as(c_int, data[@as(c_int, 4)]) & @as(c_int, 32)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SOUTH, (@as(c_int, data[@as(c_int, 4)]) & @as(c_int, 64)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_WEST, (@as(c_int, data[@as(c_int, 4)]) & @as(c_int, 128)) != @as(c_int, 0));
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
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_SHOULDER, (@as(c_int, data[@as(c_int, 5)]) & @as(c_int, 1)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER, (@as(c_int, data[@as(c_int, 5)]) & @as(c_int, 2)) != @as(c_int, 0));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFT_TRIGGER, @truncate(if ((@as(c_int, data[@as(c_int, 5)]) & @as(c_int, 4)) != 0) SDL_JOYSTICK_AXIS_MAX else -@as(c_int, 32768)));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHT_TRIGGER, @truncate(if ((@as(c_int, data[@as(c_int, 5)]) & @as(c_int, 8)) != 0) SDL_JOYSTICK_AXIS_MAX else -@as(c_int, 32768)));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_BACK, (@as(c_int, data[@as(c_int, 5)]) & @as(c_int, 16)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_START, (@as(c_int, data[@as(c_int, 5)]) & @as(c_int, 32)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_STICK, (@as(c_int, data[@as(c_int, 5)]) & @as(c_int, 64)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_STICK, (@as(c_int, data[@as(c_int, 5)]) & @as(c_int, 128)) != @as(c_int, 0));
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
                axis = @truncate((@as(c_int, data[@as(c_int, 2)]) * @as(c_int, 257)) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, axis);
                axis = @truncate((@as(c_int, data[@as(c_int, 3)]) * @as(c_int, 257)) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, axis);
                axis = @truncate((@as(c_int, data[@as(c_int, 0)]) * @as(c_int, 257)) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, axis);
                axis = @truncate((@as(c_int, data[@as(c_int, 1)]) * @as(c_int, 257)) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, axis);
                _ = memcpy(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.last_state))))), @ptrCast(@alignCast(data)), if (@as(c_ulong, @bitCast(@as(c_long, size))) < @sizeOf(@TypeOf(ctx.*.last_state))) @as(c_ulong, @bitCast(@as(c_long, size))) else @sizeOf(@TypeOf(ctx.*.last_state)));
                {}
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverPS3_HandleStatePacket(joystick: [*c]SDL_Joystick, ctx: [*c]SDL_DriverPS3_Context, data: [*c]Uint8, size: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var axis: Sint16 = undefined;
    _ = &axis;
    var timestamp: Uint64 = SDL_GetTicksNS_REAL();
    _ = &timestamp;
    if (@as(c_int, ctx.*.last_state[@as(c_int, 2)]) != @as(c_int, data[@as(c_int, 2)])) {
        var hat: Uint8 = 0;
        _ = &hat;
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_BACK, (@as(c_int, data[@as(c_int, 2)]) & @as(c_int, 1)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_STICK, (@as(c_int, data[@as(c_int, 2)]) & @as(c_int, 2)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_STICK, (@as(c_int, data[@as(c_int, 2)]) & @as(c_int, 4)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_START, (@as(c_int, data[@as(c_int, 2)]) & @as(c_int, 8)) != @as(c_int, 0));
        if ((@as(c_int, data[@as(c_int, 2)]) & @as(c_int, 16)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_UP);
            }
        }
        if ((@as(c_int, data[@as(c_int, 2)]) & @as(c_int, 32)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_RIGHT);
            }
        }
        if ((@as(c_int, data[@as(c_int, 2)]) & @as(c_int, 64)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_DOWN);
            }
        }
        if ((@as(c_int, data[@as(c_int, 2)]) & @as(c_int, 128)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_LEFT);
            }
        }
        SDL_SendJoystickHat(timestamp, joystick, 0, hat);
    }
    if (@as(c_int, ctx.*.last_state[@as(c_int, 3)]) != @as(c_int, data[@as(c_int, 3)])) {
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_SHOULDER, (@as(c_int, data[@as(c_int, 3)]) & @as(c_int, 4)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER, (@as(c_int, data[@as(c_int, 3)]) & @as(c_int, 8)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_NORTH, (@as(c_int, data[@as(c_int, 3)]) & @as(c_int, 16)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_EAST, (@as(c_int, data[@as(c_int, 3)]) & @as(c_int, 32)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SOUTH, (@as(c_int, data[@as(c_int, 3)]) & @as(c_int, 64)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_WEST, (@as(c_int, data[@as(c_int, 3)]) & @as(c_int, 128)) != @as(c_int, 0));
    }
    if (@as(c_int, ctx.*.last_state[@as(c_int, 4)]) != @as(c_int, data[@as(c_int, 4)])) {
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_GUIDE, (@as(c_int, data[@as(c_int, 4)]) & @as(c_int, 1)) != @as(c_int, 0));
    }
    axis = @truncate((@as(c_int, data[@as(c_int, 18)]) * @as(c_int, 257)) - @as(c_int, 32768));
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFT_TRIGGER, axis);
    axis = @truncate((@as(c_int, data[@as(c_int, 19)]) * @as(c_int, 257)) - @as(c_int, 32768));
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHT_TRIGGER, axis);
    axis = @truncate((@as(c_int, data[@as(c_int, 6)]) * @as(c_int, 257)) - @as(c_int, 32768));
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, axis);
    axis = @truncate((@as(c_int, data[@as(c_int, 7)]) * @as(c_int, 257)) - @as(c_int, 32768));
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, axis);
    axis = @truncate((@as(c_int, data[@as(c_int, 8)]) * @as(c_int, 257)) - @as(c_int, 32768));
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, axis);
    axis = @truncate((@as(c_int, data[@as(c_int, 9)]) * @as(c_int, 257)) - @as(c_int, 32768));
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, axis);
    if (ctx.*.has_analog_buttons) {
        const static_local_button_axis_offsets = struct {
            var button_axis_offsets: [15]c_int = [15]c_int{
                24,
                23,
                25,
                22,
                0,
                0,
                0,
                0,
                0,
                20,
                21,
                14,
                16,
                17,
                15,
            };
        };
        _ = &static_local_button_axis_offsets;
        var i: Uint8 = undefined;
        _ = &i;
        var axis_index: Uint8 = 6;
        _ = &axis_index;
        {
            i = 0;
            while (@as(c_ulong, @bitCast(@as(c_long, @as(c_int, i)))) < (@sizeOf(@TypeOf(static_local_button_axis_offsets.button_axis_offsets)) / @sizeOf(@TypeOf(static_local_button_axis_offsets.button_axis_offsets[@as(c_int, 0)])))) : (i +%= 1) {
                var offset: c_int = static_local_button_axis_offsets.button_axis_offsets[i];
                _ = &offset;
                if (!(offset != 0)) {
                    continue;
                }
                axis = @truncate((@as(c_int, data[@bitCast(@as(isize, @intCast(offset)))]) * @as(c_int, 257)) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, axis_index, axis);
                axis_index +%= 1;
            }
        }
    }
    if (ctx.*.report_sensors) {
        var sensor_data: [3]f32 = undefined;
        _ = &sensor_data;
        sensor_data[@as(c_int, 0)] = HIDAPI_DriverPS3_ScaleAccel(@truncate(@as(c_int, @as(Uint16, data[@as(c_int, 41)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 42)])) << @intCast(@as(c_int, 8)))));
        sensor_data[@as(c_int, 1)] = -HIDAPI_DriverPS3_ScaleAccel(@truncate(@as(c_int, @as(Uint16, data[@as(c_int, 45)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 46)])) << @intCast(@as(c_int, 8)))));
        sensor_data[@as(c_int, 2)] = -HIDAPI_DriverPS3_ScaleAccel(@truncate(@as(c_int, @as(Uint16, data[@as(c_int, 43)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 44)])) << @intCast(@as(c_int, 8)))));
        SDL_SendJoystickSensor(timestamp, joystick, SDL_SENSOR_ACCEL, timestamp, @ptrCast(@alignCast(&sensor_data)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(sensor_data)) / @sizeOf(@TypeOf(sensor_data[@as(c_int, 0)]))))));
    }
    _ = memcpy(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.last_state))))), @ptrCast(@alignCast(data)), if (@as(c_ulong, @bitCast(@as(c_long, size))) < @sizeOf(@TypeOf(ctx.*.last_state))) @as(c_ulong, @bitCast(@as(c_long, size))) else @sizeOf(@TypeOf(ctx.*.last_state)));
}
pub fn HIDAPI_DriverPS3_UpdateDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS3_Context = undefined;
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
                if (!(joystick != null)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            6 => {
                if (size < @as(c_int, 0)) {
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
                if (size == @as(c_int, 7)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                HIDAPI_DriverPS3_HandleMiniStatePacket(joystick, ctx, @ptrCast(@alignCast(&data)), size);
                if (!ctx.*.effects_updated) {
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
                switch (@as(c_int, data[@as(c_int, 0)])) {
                    k_EPS3ReportIdState => {
                        sdl_pc = 17;
                        continue;
                    },
                    else => {
                        sdl_pc = 24;
                        continue;
                    },
                }
            },
            13 => {
                _ = HIDAPI_DriverPS3_UpdateEffects(device);
                ctx.*.effects_updated = @"true" != 0;
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
                    sdl_pc = 4;
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
                if (@as(c_int, data[@as(c_int, 1)]) == @as(c_int, 255)) {
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
                HIDAPI_DriverPS3_HandleStatePacket(joystick, ctx, @ptrCast(@alignCast(&data)), size);
                if (!ctx.*.effects_updated) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            21 => {
                _ = HIDAPI_DriverPS3_UpdateEffects(device);
                ctx.*.effects_updated = @"true" != 0;
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
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            25 => {
                HIDAPI_JoystickDisconnected(device, device.*.joysticks[@as(c_int, 0)]);
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
                return size >= @as(c_int, 0);
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverPS3_CloseJoystick(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS3_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    ctx.*.joystick = null;
}
pub fn HIDAPI_DriverPS3_FreeDevice(_: [*c]SDL_HIDAPI_Device) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub export var SDL_HIDAPI_DriverPS3: SDL_HIDAPI_DeviceDriver = SDL_HIDAPI_DeviceDriver{
    .name = "SDL_JOYSTICK_HIDAPI_PS3",
    .enabled = @"true" != 0,
    .RegisterHints = HIDAPI_DriverPS3_RegisterHints,
    .UnregisterHints = HIDAPI_DriverPS3_UnregisterHints,
    .IsEnabled = HIDAPI_DriverPS3_IsEnabled,
    .IsSupportedDevice = HIDAPI_DriverPS3_IsSupportedDevice,
    .InitDevice = HIDAPI_DriverPS3_InitDevice,
    .GetDevicePlayerIndex = HIDAPI_DriverPS3_GetDevicePlayerIndex,
    .SetDevicePlayerIndex = HIDAPI_DriverPS3_SetDevicePlayerIndex,
    .UpdateDevice = HIDAPI_DriverPS3_UpdateDevice,
    .OpenJoystick = HIDAPI_DriverPS3_OpenJoystick,
    .RumbleJoystick = HIDAPI_DriverPS3_RumbleJoystick,
    .RumbleJoystickTriggers = HIDAPI_DriverPS3_RumbleJoystickTriggers,
    .GetJoystickCapabilities = HIDAPI_DriverPS3_GetJoystickCapabilities,
    .SetJoystickLED = HIDAPI_DriverPS3_SetJoystickLED,
    .SendJoystickEffect = HIDAPI_DriverPS3_SendJoystickEffect,
    .SetJoystickSensorsEnabled = HIDAPI_DriverPS3_SetJoystickSensorsEnabled,
    .CloseJoystick = HIDAPI_DriverPS3_CloseJoystick,
    .FreeDevice = HIDAPI_DriverPS3_FreeDevice,
};
pub fn HIDAPI_DriverPS3ThirdParty_IsEnabled() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI_PS3", SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI", @"true" != 0));
}
pub fn HIDAPI_DriverPS3ThirdParty_IsSupportedDevice(device: [*c]SDL_HIDAPI_Device, _: [*c]const u8, arg_type: SDL_GamepadType, vendor_id: Uint16, product_id: Uint16, _: Uint16, _: c_int, _: c_int, _: c_int, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var data: [64]Uint8 = undefined;
    _ = &data;
    var size: c_int = undefined;
    _ = &size;
    if ((@as(c_int, vendor_id) == USB_VENDOR_LOGITECH) and (@as(c_int, product_id) == USB_PRODUCT_LOGITECH_CHILLSTREAM)) {
        return @"true" != 0;
    }
    if (((@"type" == @as(SDL_GamepadType, SDL_GAMEPAD_TYPE_PS3)) and (@as(c_int, vendor_id) != USB_VENDOR_SONY)) or HIDAPI_SupportsPlaystationDetection(vendor_id, product_id)) {
        if ((device != null) and (device.*.dev != null)) {
            size = ReadFeatureReport(device.*.dev, 3, @ptrCast(@alignCast(&data)), @sizeOf(@TypeOf(data)));
            if ((size == @as(c_int, 8)) and (@as(c_int, data[@as(c_int, 2)]) == @as(c_int, 38))) {
                return @"true" != 0;
            } else {
                size = ReadFeatureReport(device.*.dev, 0, @ptrCast(@alignCast(&data)), @sizeOf(@TypeOf(data)));
                if ((size == @as(c_int, 9)) and (@as(c_int, data[@as(c_int, 2)]) == @as(c_int, 38))) {
                    return @"true" != 0;
                } else {
                    return @"false" != 0;
                }
            }
        } else {
            return @"true" != 0;
        }
    }
    return @"false" != 0;
}
pub fn HIDAPI_DriverPS3ThirdParty_InitDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS3_Context = undefined;
    _ = &ctx;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
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
                if ((@as(c_int, device.*.vendor_id) == USB_VENDOR_SWITCH) and (@as(c_int, device.*.product_id) == USB_PRODUCT_SWITCH_RETRO_CONTROLLER)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                ctx.*.has_analog_buttons = @"false" != 0;
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                ctx.*.has_analog_buttons = @"true" != 0;
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                device.*.context = @ptrCast(@alignCast(ctx));
                device.*.type = SDL_GAMEPAD_TYPE_PS3;
                if ((@as(c_int, device.*.vendor_id) == USB_VENDOR_LOGITECH) and (@as(c_int, device.*.product_id) == USB_PRODUCT_LOGITECH_CHILLSTREAM)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                HIDAPI_SetDeviceName(device, "Logitech ChillStream");
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
                if (@as(c_int, device.*.vendor_id) == USB_VENDOR_HARMONIX) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                switch (@as(c_int, device.*.product_id)) {
                    USB_PRODUCT_HARMONIX_WII_RB1_GUITAR => {
                        sdl_pc = 14;
                        continue;
                    },
                    USB_PRODUCT_HARMONIX_WII_RB2_GUITAR => {
                        sdl_pc = 15;
                        continue;
                    },
                    USB_PRODUCT_HARMONIX_WII_RB1_DRUMS => {
                        sdl_pc = 16;
                        continue;
                    },
                    USB_PRODUCT_HARMONIX_WII_RB2_DRUMS => {
                        sdl_pc = 17;
                        continue;
                    },
                    USB_PRODUCT_HARMONIX_WII_RB3_MPA_DRUMS_MODE => {
                        sdl_pc = 18;
                        continue;
                    },
                    else => {
                        sdl_pc = 19;
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
                if (@as(c_int, device.*.vendor_id) == USB_VENDOR_SCEA) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            13 => {
                {
                    sdl_pc = 12;
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
                device.*.joystick_type = SDL_JOYSTICK_TYPE_GUITAR;
                {
                    sdl_pc = 13;
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
                device.*.joystick_type = SDL_JOYSTICK_TYPE_DRUM_KIT;
                {
                    sdl_pc = 13;
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
                switch (@as(c_int, device.*.product_id)) {
                    USB_PRODUCT_SCEA_PS3_GH_GUITAR => {
                        sdl_pc = 24;
                        continue;
                    },
                    USB_PRODUCT_SCEA_PS3_RB_GUITAR => {
                        sdl_pc = 25;
                        continue;
                    },
                    USB_PRODUCT_SCEA_PS3WIIU_GHLIVE => {
                        sdl_pc = 26;
                        continue;
                    },
                    USB_PRODUCT_SCEA_PS3_GH_DRUMS => {
                        sdl_pc = 27;
                        continue;
                    },
                    USB_PRODUCT_SCEA_PS3_RB_DRUMS => {
                        sdl_pc = 28;
                        continue;
                    },
                    USB_PRODUCT_SCEA_PS3_RB3_MPA_DRUMS_MODE => {
                        sdl_pc = 29;
                        continue;
                    },
                    else => {
                        sdl_pc = 30;
                        continue;
                    },
                }
            },
            21 => {
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            22 => {
                return HIDAPI_JoystickConnected(device, null);
            },
            23 => {
                {
                    sdl_pc = 22;
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
                device.*.joystick_type = SDL_JOYSTICK_TYPE_GUITAR;
                {
                    sdl_pc = 23;
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
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            29 => {
                device.*.joystick_type = SDL_JOYSTICK_TYPE_DRUM_KIT;
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            30 => {
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverPS3ThirdParty_GetDevicePlayerIndex(_: [*c]SDL_HIDAPI_Device, _: SDL_JoystickID) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return -@as(c_int, 1);
}
pub fn HIDAPI_DriverPS3ThirdParty_SetDevicePlayerIndex(_: [*c]SDL_HIDAPI_Device, _: SDL_JoystickID, _: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn HIDAPI_DriverPS3ThirdParty_OpenJoystick(device: [*c]SDL_HIDAPI_Device, joystick: [*c]SDL_Joystick) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS3_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    SDL_AssertJoysticksLocked();
    ctx.*.joystick = joystick;
    _ = memset(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.last_state))))), 0, @sizeOf(@TypeOf(ctx.*.last_state)));
    joystick.*.nbuttons = 11;
    joystick.*.naxes = 6;
    if (ctx.*.has_analog_buttons) {
        joystick.*.naxes += 10;
    }
    joystick.*.nhats = 1;
    if ((@as(c_int, device.*.vendor_id) == USB_VENDOR_SWITCH) and (@as(c_int, device.*.product_id) == USB_PRODUCT_SWITCH_RETRO_CONTROLLER)) {
        joystick.*.connection_state = SDL_JOYSTICK_CONNECTION_WIRELESS;
    }
    SDL_PrivateJoystickAddSensor(joystick, SDL_SENSOR_ACCEL, 100.0);
    return @"true" != 0;
}
pub fn HIDAPI_DriverPS3ThirdParty_RumbleJoystick(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: Uint16, _: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverPS3ThirdParty_RumbleJoystickTriggers(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: Uint16, _: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverPS3ThirdParty_GetJoystickCapabilities(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    return 0;
}
pub fn HIDAPI_DriverPS3ThirdParty_SetJoystickLED(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: Uint8, _: Uint8, _: Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverPS3ThirdParty_SendJoystickEffect(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: ?*const anyopaque, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverPS3ThirdParty_SetJoystickSensorsEnabled(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, enabled: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS3_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    ctx.*.report_sensors = enabled;
    return @"true" != 0;
}
pub fn HIDAPI_DriverPS3ThirdParty_HandleStatePacket18(joystick: [*c]SDL_Joystick, ctx: [*c]SDL_DriverPS3_Context, data: [*c]Uint8, size: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var axis: Sint16 = undefined;
    _ = &axis;
    var timestamp: Uint64 = undefined;
    _ = &timestamp;
    var hat: Uint8 = undefined;
    _ = &hat;
    const static_local_button_axis_offsets = struct {
        var button_axis_offsets: [15]c_int = [15]c_int{
            12,
            11,
            13,
            10,
            0,
            0,
            0,
            0,
            0,
            14,
            15,
            8,
            9,
            7,
            6,
        };
    };
    _ = &static_local_button_axis_offsets;
    var i: Uint8 = undefined;
    _ = &i;
    var axis_index: Uint8 = undefined;
    _ = &axis_index;
    var offset: c_int = undefined;
    _ = &offset;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                timestamp = SDL_GetTicksNS_REAL();
                if (@as(c_int, ctx.*.last_state[@as(c_int, 0)]) != @as(c_int, data[@as(c_int, 0)])) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_WEST, (@as(c_int, data[@as(c_int, 0)]) & @as(c_int, 1)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SOUTH, (@as(c_int, data[@as(c_int, 0)]) & @as(c_int, 2)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_EAST, (@as(c_int, data[@as(c_int, 0)]) & @as(c_int, 4)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_NORTH, (@as(c_int, data[@as(c_int, 0)]) & @as(c_int, 8)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_SHOULDER, (@as(c_int, data[@as(c_int, 0)]) & @as(c_int, 16)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER, (@as(c_int, data[@as(c_int, 0)]) & @as(c_int, 32)) != @as(c_int, 0));
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
                if (@as(c_int, ctx.*.last_state[@as(c_int, 1)]) != @as(c_int, data[@as(c_int, 1)])) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_BACK, (@as(c_int, data[@as(c_int, 1)]) & @as(c_int, 1)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_START, (@as(c_int, data[@as(c_int, 1)]) & @as(c_int, 2)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_STICK, (@as(c_int, data[@as(c_int, 1)]) & @as(c_int, 4)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_STICK, (@as(c_int, data[@as(c_int, 1)]) & @as(c_int, 8)) != @as(c_int, 0));
                switch (@as(c_int, data[@as(c_int, 1)]) >> @intCast(@as(c_int, 4))) {
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
                axis = @truncate((@as(c_int, data[@as(c_int, 16)]) * @as(c_int, 257)) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFT_TRIGGER, axis);
                axis = @truncate((@as(c_int, data[@as(c_int, 17)]) * @as(c_int, 257)) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHT_TRIGGER, axis);
                axis = @truncate((@as(c_int, data[@as(c_int, 2)]) * @as(c_int, 257)) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, axis);
                axis = @truncate((@as(c_int, data[@as(c_int, 3)]) * @as(c_int, 257)) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, axis);
                axis = @truncate((@as(c_int, data[@as(c_int, 4)]) * @as(c_int, 257)) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, axis);
                axis = @truncate((@as(c_int, data[@as(c_int, 5)]) * @as(c_int, 257)) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, axis);
                if (ctx.*.has_analog_buttons) {
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
                axis_index = 6;
                i = 0;
                {
                    sdl_pc = 20;
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
                _ = memcpy(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.last_state))))), @ptrCast(@alignCast(data)), if (@as(c_ulong, @bitCast(@as(c_long, size))) < @sizeOf(@TypeOf(ctx.*.last_state))) @as(c_ulong, @bitCast(@as(c_long, size))) else @sizeOf(@TypeOf(ctx.*.last_state)));
                {}
            },
            20 => {
                if (@as(c_ulong, @bitCast(@as(c_long, @as(c_int, i)))) < (@sizeOf(@TypeOf(static_local_button_axis_offsets.button_axis_offsets)) / @sizeOf(@TypeOf(static_local_button_axis_offsets.button_axis_offsets[@as(c_int, 0)])))) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            21 => {
                offset = static_local_button_axis_offsets.button_axis_offsets[i];
                if (!(offset != 0)) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            22 => {
                i +%= 1;
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            23 => {
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            24 => {
                {
                    sdl_pc = 22;
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
                axis = @truncate((@as(c_int, data[@bitCast(@as(isize, @intCast(offset)))]) * @as(c_int, 257)) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, axis_index, axis);
                axis_index +%= 1;
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverPS3ThirdParty_HandleStatePacket19(joystick: [*c]SDL_Joystick, ctx: [*c]SDL_DriverPS3_Context, data: [*c]Uint8, size: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var axis: Sint16 = undefined;
    _ = &axis;
    var timestamp: Uint64 = undefined;
    _ = &timestamp;
    var hat: Uint8 = undefined;
    _ = &hat;
    var hat_1: Uint8 = undefined;
    _ = &hat_1;
    const static_local_button_axis_offsets = struct {
        var button_axis_offsets: [15]c_int = [15]c_int{
            13,
            12,
            14,
            11,
            0,
            0,
            0,
            0,
            0,
            15,
            16,
            9,
            10,
            8,
            7,
        };
    };
    _ = &static_local_button_axis_offsets;
    var i: Uint8 = undefined;
    _ = &i;
    var axis_index: Uint8 = undefined;
    _ = &axis_index;
    var offset: c_int = undefined;
    _ = &offset;
    var sensor_data: [3]f32 = undefined;
    _ = &sensor_data;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                timestamp = SDL_GetTicksNS_REAL();
                if (@as(c_int, ctx.*.last_state[@as(c_int, 0)]) != @as(c_int, data[@as(c_int, 0)])) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_WEST, (@as(c_int, data[@as(c_int, 0)]) & @as(c_int, 1)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SOUTH, (@as(c_int, data[@as(c_int, 0)]) & @as(c_int, 2)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_EAST, (@as(c_int, data[@as(c_int, 0)]) & @as(c_int, 4)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_NORTH, (@as(c_int, data[@as(c_int, 0)]) & @as(c_int, 8)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_SHOULDER, (@as(c_int, data[@as(c_int, 0)]) & @as(c_int, 16)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER, (@as(c_int, data[@as(c_int, 0)]) & @as(c_int, 32)) != @as(c_int, 0));
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
                if (@as(c_int, ctx.*.last_state[@as(c_int, 1)]) != @as(c_int, data[@as(c_int, 1)])) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_BACK, (@as(c_int, data[@as(c_int, 1)]) & @as(c_int, 1)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_START, (@as(c_int, data[@as(c_int, 1)]) & @as(c_int, 2)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_STICK, (@as(c_int, data[@as(c_int, 1)]) & @as(c_int, 4)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_STICK, (@as(c_int, data[@as(c_int, 1)]) & @as(c_int, 8)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_GUIDE, (@as(c_int, data[@as(c_int, 1)]) & @as(c_int, 16)) != @as(c_int, 0));
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
                if ((@as(c_int, ctx.*.device.*.vendor_id) == USB_VENDOR_SAITEK) and (@as(c_int, ctx.*.device.*.product_id) == USB_PRODUCT_SAITEK_CYBORG_V3)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                hat = 0;
                if (@as(c_int, data[@as(c_int, 7)]) != 0) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            8 => {
                if (@as(c_int, ctx.*.last_state[@as(c_int, 2)]) != @as(c_int, data[@as(c_int, 2)])) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            9 => {
                if ((@as(c_int, data[@as(c_int, 0)]) & @as(c_int, 64)) != 0) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            10 => {
                {
                    const ref = &hat;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_RIGHT);
                }
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
                if (@as(c_int, data[@as(c_int, 8)]) != 0) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            13 => {
                {
                    const ref = &hat;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_LEFT);
                }
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
                if (@as(c_int, data[@as(c_int, 9)]) != 0) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            16 => {
                {
                    const ref = &hat;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_UP);
                }
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
                if (@as(c_int, data[@as(c_int, 10)]) != 0) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            19 => {
                {
                    const ref = &hat;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_DOWN);
                }
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
                SDL_SendJoystickHat(timestamp, joystick, 0, hat);
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            22 => {
                switch (@as(c_int, data[@as(c_int, 2)]) & @as(c_int, 15)) {
                    @as(c_int, 0) => {
                        sdl_pc = 26;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 27;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 28;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 29;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 30;
                        continue;
                    },
                    @as(c_int, 5) => {
                        sdl_pc = 31;
                        continue;
                    },
                    @as(c_int, 6) => {
                        sdl_pc = 32;
                        continue;
                    },
                    @as(c_int, 7) => {
                        sdl_pc = 33;
                        continue;
                    },
                    else => {
                        sdl_pc = 34;
                        continue;
                    },
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
                    sdl_pc = 9;
                    continue;
                }
            },
            25 => {
                SDL_SendJoystickHat(timestamp, joystick, 0, hat_1);
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            26 => {
                hat_1 = SDL_HAT_UP;
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            27 => {
                hat_1 = @truncate(SDL_HAT_RIGHT | SDL_HAT_UP);
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            28 => {
                hat_1 = SDL_HAT_RIGHT;
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            29 => {
                hat_1 = @truncate(SDL_HAT_RIGHT | SDL_HAT_DOWN);
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            30 => {
                hat_1 = SDL_HAT_DOWN;
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            31 => {
                hat_1 = @truncate(SDL_HAT_LEFT | SDL_HAT_DOWN);
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            32 => {
                hat_1 = SDL_HAT_LEFT;
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            33 => {
                hat_1 = @truncate(SDL_HAT_LEFT | SDL_HAT_UP);
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            34 => {
                hat_1 = SDL_HAT_CENTERED;
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            35 => {
                axis = 32767;
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            36 => {
                axis = @truncate((@as(c_int, data[@as(c_int, 17)]) * @as(c_int, 257)) - @as(c_int, 32768));
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            37 => {
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFT_TRIGGER, axis);
                if ((@as(c_int, data[@as(c_int, 0)]) & @as(c_int, 128)) != 0) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
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
                axis = @truncate((@as(c_int, data[@as(c_int, 18)]) * @as(c_int, 257)) - @as(c_int, 32768));
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            40 => {
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHT_TRIGGER, axis);
                axis = @truncate((@as(c_int, data[@as(c_int, 3)]) * @as(c_int, 257)) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, axis);
                axis = @truncate((@as(c_int, data[@as(c_int, 4)]) * @as(c_int, 257)) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, axis);
                axis = @truncate((@as(c_int, data[@as(c_int, 5)]) * @as(c_int, 257)) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, axis);
                axis = @truncate((@as(c_int, data[@as(c_int, 6)]) * @as(c_int, 257)) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, axis);
                if (ctx.*.has_analog_buttons) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            41 => {
                axis_index = 6;
                i = 0;
                {
                    sdl_pc = 44;
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
                if (ctx.*.report_sensors) {
                    sdl_pc = 51;
                    continue;
                } else {
                    sdl_pc = 52;
                    continue;
                }
            },
            44 => {
                if (@as(c_ulong, @bitCast(@as(c_long, @as(c_int, i)))) < (@sizeOf(@TypeOf(static_local_button_axis_offsets.button_axis_offsets)) / @sizeOf(@TypeOf(static_local_button_axis_offsets.button_axis_offsets[@as(c_int, 0)])))) {
                    sdl_pc = 45;
                    continue;
                } else {
                    sdl_pc = 47;
                    continue;
                }
            },
            45 => {
                offset = static_local_button_axis_offsets.button_axis_offsets[i];
                if (!(offset != 0)) {
                    sdl_pc = 48;
                    continue;
                } else {
                    sdl_pc = 49;
                    continue;
                }
            },
            46 => {
                i +%= 1;
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            47 => {
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            48 => {
                {
                    sdl_pc = 46;
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
                axis = @truncate((@as(c_int, data[@bitCast(@as(isize, @intCast(offset)))]) * @as(c_int, 257)) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, axis_index, axis);
                axis_index +%= 1;
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            51 => {
                sensor_data[@as(c_int, 0)] = -HIDAPI_DriverPS3ThirdParty_ScaleAccel(@truncate(@as(c_int, @as(Uint16, data[@as(c_int, 19)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 20)])) << @intCast(@as(c_int, 8)))));
                sensor_data[@as(c_int, 1)] = -HIDAPI_DriverPS3ThirdParty_ScaleAccel(@truncate(@as(c_int, @as(Uint16, data[@as(c_int, 21)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 22)])) << @intCast(@as(c_int, 8)))));
                sensor_data[@as(c_int, 2)] = -HIDAPI_DriverPS3ThirdParty_ScaleAccel(@truncate(@as(c_int, @as(Uint16, data[@as(c_int, 23)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 24)])) << @intCast(@as(c_int, 8)))));
                SDL_SendJoystickSensor(timestamp, joystick, SDL_SENSOR_ACCEL, timestamp, @ptrCast(@alignCast(&sensor_data)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(sensor_data)) / @sizeOf(@TypeOf(sensor_data[@as(c_int, 0)]))))));
                {
                    sdl_pc = 53;
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
                _ = memcpy(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.last_state))))), @ptrCast(@alignCast(data)), if (@as(c_ulong, @bitCast(@as(c_long, size))) < @sizeOf(@TypeOf(ctx.*.last_state))) @as(c_ulong, @bitCast(@as(c_long, size))) else @sizeOf(@TypeOf(ctx.*.last_state)));
                {}
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverPS3ThirdParty_UpdateDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS3_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    var joystick: [*c]SDL_Joystick = null;
    _ = &joystick;
    var data: [64]Uint8 = undefined;
    _ = &data;
    var size: c_int = undefined;
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
        if (size >= @as(c_int, 19)) {
            HIDAPI_DriverPS3ThirdParty_HandleStatePacket19(joystick, ctx, @ptrCast(@alignCast(&data)), size);
        } else if (size == @as(c_int, 18)) {
            HIDAPI_DriverPS3ThirdParty_HandleStatePacket18(joystick, ctx, @ptrCast(@alignCast(&data)), size);
        } else {}
    }
    if (size < @as(c_int, 0)) {
        HIDAPI_JoystickDisconnected(device, device.*.joysticks[@as(c_int, 0)]);
    }
    return size >= @as(c_int, 0);
}
pub fn HIDAPI_DriverPS3ThirdParty_CloseJoystick(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS3_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    ctx.*.joystick = null;
}
pub fn HIDAPI_DriverPS3ThirdParty_FreeDevice(_: [*c]SDL_HIDAPI_Device) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub export var SDL_HIDAPI_DriverPS3ThirdParty: SDL_HIDAPI_DeviceDriver = SDL_HIDAPI_DeviceDriver{
    .name = "SDL_JOYSTICK_HIDAPI_PS3",
    .enabled = @"true" != 0,
    .RegisterHints = HIDAPI_DriverPS3_RegisterHints,
    .UnregisterHints = HIDAPI_DriverPS3_UnregisterHints,
    .IsEnabled = HIDAPI_DriverPS3ThirdParty_IsEnabled,
    .IsSupportedDevice = HIDAPI_DriverPS3ThirdParty_IsSupportedDevice,
    .InitDevice = HIDAPI_DriverPS3ThirdParty_InitDevice,
    .GetDevicePlayerIndex = HIDAPI_DriverPS3ThirdParty_GetDevicePlayerIndex,
    .SetDevicePlayerIndex = HIDAPI_DriverPS3ThirdParty_SetDevicePlayerIndex,
    .UpdateDevice = HIDAPI_DriverPS3ThirdParty_UpdateDevice,
    .OpenJoystick = HIDAPI_DriverPS3ThirdParty_OpenJoystick,
    .RumbleJoystick = HIDAPI_DriverPS3ThirdParty_RumbleJoystick,
    .RumbleJoystickTriggers = HIDAPI_DriverPS3ThirdParty_RumbleJoystickTriggers,
    .GetJoystickCapabilities = HIDAPI_DriverPS3ThirdParty_GetJoystickCapabilities,
    .SetJoystickLED = HIDAPI_DriverPS3ThirdParty_SetJoystickLED,
    .SendJoystickEffect = HIDAPI_DriverPS3ThirdParty_SendJoystickEffect,
    .SetJoystickSensorsEnabled = HIDAPI_DriverPS3ThirdParty_SetJoystickSensorsEnabled,
    .CloseJoystick = HIDAPI_DriverPS3ThirdParty_CloseJoystick,
    .FreeDevice = HIDAPI_DriverPS3ThirdParty_FreeDevice,
};
pub fn HIDAPI_DriverPS3SonySixaxis_RegisterHints(callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = SDL_AddHintCallback_REAL("SDL_JOYSTICK_HIDAPI_PS3_SIXAXIS_DRIVER", callback, userdata);
}
pub fn HIDAPI_DriverPS3SonySixaxis_UnregisterHints(callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_RemoveHintCallback_REAL("SDL_JOYSTICK_HIDAPI_PS3_SIXAXIS_DRIVER", callback, userdata);
}
pub fn HIDAPI_DriverPS3SonySixaxis_IsEnabled() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return @"false" != 0;
}
pub fn HIDAPI_DriverPS3SonySixaxis_IsSupportedDevice(_: [*c]SDL_HIDAPI_Device, _: [*c]const u8, arg_type: SDL_GamepadType, vendor_id: Uint16, product_id: Uint16, _: Uint16, _: c_int, _: c_int, _: c_int, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    if ((@as(c_int, vendor_id) == USB_VENDOR_SONY) and (@as(c_int, product_id) == USB_PRODUCT_SONY_DS3)) {
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub fn HIDAPI_DriverPS3SonySixaxis_InitDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS3_Context = undefined;
    _ = &ctx;
    ctx = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(ctx.*)))));
    if (!(ctx != null)) {
        return @"false" != 0;
    }
    ctx.*.device = device;
    ctx.*.has_analog_buttons = @"true" != 0;
    device.*.context = @ptrCast(@alignCast(ctx));
    var data: [64]Uint8 = undefined;
    _ = &data;
    var size: c_int = ReadFeatureReport(device.*.dev, 242, @ptrCast(@alignCast(&data)), @sizeOf(@TypeOf(data)));
    _ = &size;
    if (size < @as(c_int, 0)) {
        SDL_LogDebug_REAL(SDL_LOG_CATEGORY_INPUT, "HIDAPI_DriverPS3SonySixaxis_InitDevice(): Couldn't read feature report 0xf2. Trying again with 0x0.");
        _ = memset(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&data))))), 0, @sizeOf(@TypeOf(data)));
        size = ReadFeatureReport(device.*.dev, 0, @ptrCast(@alignCast(&data)), @sizeOf(@TypeOf(data)));
        if (size < @as(c_int, 0)) {
            SDL_LogDebug_REAL(SDL_LOG_CATEGORY_INPUT, "HIDAPI_DriverPS3SonySixaxis_InitDevice(): Couldn't read feature report 0x00.");
            return @"false" != 0;
        }
    }
    device.*.type = SDL_GAMEPAD_TYPE_PS3;
    HIDAPI_SetDeviceName(device, "PS3 Controller");
    return HIDAPI_JoystickConnected(device, null);
}
pub fn HIDAPI_DriverPS3SonySixaxis_GetDevicePlayerIndex(_: [*c]SDL_HIDAPI_Device, _: SDL_JoystickID) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return -@as(c_int, 1);
}
pub fn HIDAPI_DriverPS3SonySixaxis_SetDevicePlayerIndex(device: [*c]SDL_HIDAPI_Device, _: SDL_JoystickID, player_index: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS3_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    if (!(ctx != null)) {
        return;
    }
    ctx.*.player_index = player_index;
    _ = HIDAPI_DriverPS3_UpdateLEDsSonySixaxis(device);
}
pub fn HIDAPI_DriverPS3SonySixaxis_OpenJoystick(device: [*c]SDL_HIDAPI_Device, joystick: [*c]SDL_Joystick) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS3_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    SDL_AssertJoysticksLocked();
    ctx.*.joystick = joystick;
    ctx.*.effects_updated = @"false" != 0;
    ctx.*.rumble_left = 0;
    ctx.*.rumble_right = 0;
    _ = memset(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.last_state))))), 0, @sizeOf(@TypeOf(ctx.*.last_state)));
    ctx.*.player_index = SDL_GetJoystickPlayerIndex_REAL(joystick);
    joystick.*.nbuttons = 11;
    joystick.*.naxes = 6;
    if (ctx.*.has_analog_buttons) {
        joystick.*.naxes += 10;
    }
    joystick.*.nhats = 1;
    SDL_PrivateJoystickAddSensor(joystick, SDL_SENSOR_ACCEL, 100.0);
    return @"true" != 0;
}
pub fn HIDAPI_DriverPS3SonySixaxis_RumbleJoystick(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, low_frequency_rumble: Uint16, high_frequency_rumble: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS3_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    ctx.*.rumble_left = @bitCast(@as(i8, @truncate(@as(c_int, low_frequency_rumble) >> @intCast(@as(c_int, 8)))));
    ctx.*.rumble_right = @bitCast(@as(i8, @truncate(@as(c_int, high_frequency_rumble) >> @intCast(@as(c_int, 8)))));
    return HIDAPI_DriverPS3_UpdateRumbleSonySixaxis(device);
}
pub fn HIDAPI_DriverPS3SonySixaxis_RumbleJoystickTriggers(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: Uint16, _: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverPS3SonySixaxis_GetJoystickCapabilities(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    return 0;
}
pub fn HIDAPI_DriverPS3SonySixaxis_SetJoystickLED(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: Uint8, _: Uint8, _: Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverPS3SonySixaxis_SendJoystickEffect(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, effect: ?*const anyopaque, size: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var data: [49]Uint8 = undefined;
    _ = &data;
    var report_size: c_int = undefined;
    _ = &report_size;
    _ = memset(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&data))))), 0, @sizeOf(@TypeOf(data)));
    data[@as(c_int, 0)] = k_EPS3SonySixaxisReportIdEffects;
    report_size = @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(data)))));
    _ = memcpy(@ptrCast(@alignCast(&data)), effect, if (@sizeOf(@TypeOf(data)) < @as(usize, @bitCast(@as(c_long, size)))) @sizeOf(@TypeOf(data)) else @as(usize, @bitCast(@as(c_long, size))));
    if (SDL_HIDAPI_SendRumble(device, @ptrCast(@alignCast(&data)), report_size) != report_size) {
        return SDL_SetError_REAL("Couldn't send rumble packet");
    }
    return @"true" != 0;
}
pub fn HIDAPI_DriverPS3SonySixaxis_SetJoystickSensorsEnabled(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, enabled: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS3_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    ctx.*.report_sensors = enabled;
    return @"true" != 0;
}
pub fn HIDAPI_DriverPS3SonySixaxis_HandleStatePacket(joystick: [*c]SDL_Joystick, ctx: [*c]SDL_DriverPS3_Context, data: [*c]Uint8, size: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var axis: Sint16 = undefined;
    _ = &axis;
    var timestamp: Uint64 = SDL_GetTicksNS_REAL();
    _ = &timestamp;
    if (@as(c_int, ctx.*.last_state[@as(c_int, 2)]) != @as(c_int, data[@as(c_int, 2)])) {
        var hat: Uint8 = 0;
        _ = &hat;
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_BACK, (@as(c_int, data[@as(c_int, 2)]) & @as(c_int, 1)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_STICK, (@as(c_int, data[@as(c_int, 2)]) & @as(c_int, 2)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_STICK, (@as(c_int, data[@as(c_int, 2)]) & @as(c_int, 4)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_START, (@as(c_int, data[@as(c_int, 2)]) & @as(c_int, 8)) != @as(c_int, 0));
        if ((@as(c_int, data[@as(c_int, 2)]) & @as(c_int, 16)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_UP);
            }
        }
        if ((@as(c_int, data[@as(c_int, 2)]) & @as(c_int, 32)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_RIGHT);
            }
        }
        if ((@as(c_int, data[@as(c_int, 2)]) & @as(c_int, 64)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_DOWN);
            }
        }
        if ((@as(c_int, data[@as(c_int, 2)]) & @as(c_int, 128)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_LEFT);
            }
        }
        SDL_SendJoystickHat(timestamp, joystick, 0, hat);
    }
    if (@as(c_int, ctx.*.last_state[@as(c_int, 3)]) != @as(c_int, data[@as(c_int, 3)])) {
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_SHOULDER, (@as(c_int, data[@as(c_int, 3)]) & @as(c_int, 4)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER, (@as(c_int, data[@as(c_int, 3)]) & @as(c_int, 8)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_NORTH, (@as(c_int, data[@as(c_int, 3)]) & @as(c_int, 16)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_EAST, (@as(c_int, data[@as(c_int, 3)]) & @as(c_int, 32)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SOUTH, (@as(c_int, data[@as(c_int, 3)]) & @as(c_int, 64)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_WEST, (@as(c_int, data[@as(c_int, 3)]) & @as(c_int, 128)) != @as(c_int, 0));
    }
    if (@as(c_int, ctx.*.last_state[@as(c_int, 4)]) != @as(c_int, data[@as(c_int, 4)])) {
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_GUIDE, (@as(c_int, data[@as(c_int, 4)]) & @as(c_int, 1)) != @as(c_int, 0));
    }
    axis = @truncate((@as(c_int, data[@as(c_int, 18)]) * @as(c_int, 257)) - @as(c_int, 32768));
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFT_TRIGGER, axis);
    axis = @truncate((@as(c_int, data[@as(c_int, 19)]) * @as(c_int, 257)) - @as(c_int, 32768));
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHT_TRIGGER, axis);
    axis = @truncate((@as(c_int, data[@as(c_int, 6)]) * @as(c_int, 257)) - @as(c_int, 32768));
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, axis);
    axis = @truncate((@as(c_int, data[@as(c_int, 7)]) * @as(c_int, 257)) - @as(c_int, 32768));
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, axis);
    axis = @truncate((@as(c_int, data[@as(c_int, 8)]) * @as(c_int, 257)) - @as(c_int, 32768));
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, axis);
    axis = @truncate((@as(c_int, data[@as(c_int, 9)]) * @as(c_int, 257)) - @as(c_int, 32768));
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, axis);
    if (ctx.*.has_analog_buttons) {
        const static_local_button_axis_offsets = struct {
            var button_axis_offsets: [15]c_int = [15]c_int{
                24,
                23,
                25,
                22,
                0,
                0,
                0,
                0,
                0,
                20,
                21,
                14,
                16,
                17,
                15,
            };
        };
        _ = &static_local_button_axis_offsets;
        var i: Uint8 = undefined;
        _ = &i;
        var axis_index: Uint8 = 6;
        _ = &axis_index;
        {
            i = 0;
            while (@as(c_ulong, @bitCast(@as(c_long, @as(c_int, i)))) < (@sizeOf(@TypeOf(static_local_button_axis_offsets.button_axis_offsets)) / @sizeOf(@TypeOf(static_local_button_axis_offsets.button_axis_offsets[@as(c_int, 0)])))) : (i +%= 1) {
                var offset: c_int = static_local_button_axis_offsets.button_axis_offsets[i];
                _ = &offset;
                if (!(offset != 0)) {
                    continue;
                }
                axis = @truncate((@as(c_int, data[@bitCast(@as(isize, @intCast(offset)))]) * @as(c_int, 257)) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, axis_index, axis);
                axis_index +%= 1;
            }
        }
    }
    if (ctx.*.report_sensors) {
        var sensor_data: [3]f32 = undefined;
        _ = &sensor_data;
        sensor_data[@as(c_int, 0)] = HIDAPI_DriverPS3_ScaleAccel(@truncate(@as(c_int, @as(Uint16, data[@as(c_int, 41)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 42)])) << @intCast(@as(c_int, 8)))));
        sensor_data[@as(c_int, 1)] = -HIDAPI_DriverPS3_ScaleAccel(@truncate(@as(c_int, @as(Uint16, data[@as(c_int, 45)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 46)])) << @intCast(@as(c_int, 8)))));
        sensor_data[@as(c_int, 2)] = -HIDAPI_DriverPS3_ScaleAccel(@truncate(@as(c_int, @as(Uint16, data[@as(c_int, 43)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 44)])) << @intCast(@as(c_int, 8)))));
        SDL_SendJoystickSensor(timestamp, joystick, SDL_SENSOR_ACCEL, timestamp, @ptrCast(@alignCast(&sensor_data)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(sensor_data)) / @sizeOf(@TypeOf(sensor_data[@as(c_int, 0)]))))));
    }
    _ = memcpy(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.last_state))))), @ptrCast(@alignCast(data)), if (@as(c_ulong, @bitCast(@as(c_long, size))) < @sizeOf(@TypeOf(ctx.*.last_state))) @as(c_ulong, @bitCast(@as(c_long, size))) else @sizeOf(@TypeOf(ctx.*.last_state)));
}
pub fn HIDAPI_DriverPS3SonySixaxis_UpdateDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS3_Context = undefined;
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
                if (!(joystick != null)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                return @"false" != 0;
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                size = ReadFeatureReport(device.*.dev, 0, @ptrCast(@alignCast(&data)), @sizeOf(@TypeOf(data)));
                if (size < @as(c_int, 0)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                SDL_LogDebug_REAL(SDL_LOG_CATEGORY_INPUT, "HIDAPI_DriverPS3SonySixaxis_UpdateDevice(): Couldn't read feature report 0x00");
                return @"false" != 0;
            },
            8 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                switch (@as(c_int, data[@as(c_int, 0)])) {
                    k_EPS3SonySixaxisReportIdState => {
                        sdl_pc = 11;
                        continue;
                    },
                    else => {
                        sdl_pc = 15;
                        continue;
                    },
                }
            },
            10 => {
                if (size < @as(c_int, 0)) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            11 => {
                HIDAPI_DriverPS3SonySixaxis_HandleStatePacket(joystick, ctx, &data[@as(c_int, 1)], size - @as(c_int, 1));
                if (!ctx.*.effects_updated) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            12 => {
                _ = HIDAPI_DriverPS3_UpdateLEDsSonySixaxis(device);
                ctx.*.effects_updated = @"true" != 0;
                {
                    sdl_pc = 14;
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
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            15 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            16 => {
                HIDAPI_JoystickDisconnected(device, device.*.joysticks[@as(c_int, 0)]);
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
                return size >= @as(c_int, 0);
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverPS3SonySixaxis_CloseJoystick(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS3_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    ctx.*.joystick = null;
}
pub fn HIDAPI_DriverPS3SonySixaxis_FreeDevice(_: [*c]SDL_HIDAPI_Device) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn HIDAPI_DriverPS3_UpdateRumbleSonySixaxis(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS3_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    var effects: [9]Uint8 = [9]Uint8{
        0,
        k_EPS3SixaxisCommandSetMotors,
        0,
        0,
        0,
        255,
        0,
        255,
        0,
    };
    _ = &effects;
    effects[@as(c_int, 6)] = @bitCast(@as(i8, @truncate(if (ctx.*.rumble_right != 0) @as(c_int, 1) else @as(c_int, 0))));
    effects[@as(c_int, 8)] = ctx.*.rumble_left;
    return HIDAPI_DriverPS3SonySixaxis_SendJoystickEffect(device, ctx.*.joystick, @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&effects))))), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(effects))))));
}
pub fn HIDAPI_DriverPS3_UpdateLEDsSonySixaxis(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverPS3_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    var effects: [9]Uint8 = [9]Uint8{
        0,
        k_EPS3SixaxisCommandSetLEDs,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
    };
    _ = &effects;
    if (ctx.*.player_index < @as(c_int, 4)) {
        effects[@bitCast(@as(isize, @intCast(@as(c_int, 8) - ctx.*.player_index)))] = 1;
    }
    return HIDAPI_DriverPS3SonySixaxis_SendJoystickEffect(device, ctx.*.joystick, @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&effects))))), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(effects))))));
}
pub export var SDL_HIDAPI_DriverPS3SonySixaxis: SDL_HIDAPI_DeviceDriver = SDL_HIDAPI_DeviceDriver{
    .name = "SDL_JOYSTICK_HIDAPI_PS3_SIXAXIS_DRIVER",
    .enabled = @"true" != 0,
    .RegisterHints = HIDAPI_DriverPS3SonySixaxis_RegisterHints,
    .UnregisterHints = HIDAPI_DriverPS3SonySixaxis_UnregisterHints,
    .IsEnabled = HIDAPI_DriverPS3SonySixaxis_IsEnabled,
    .IsSupportedDevice = HIDAPI_DriverPS3SonySixaxis_IsSupportedDevice,
    .InitDevice = HIDAPI_DriverPS3SonySixaxis_InitDevice,
    .GetDevicePlayerIndex = HIDAPI_DriverPS3SonySixaxis_GetDevicePlayerIndex,
    .SetDevicePlayerIndex = HIDAPI_DriverPS3SonySixaxis_SetDevicePlayerIndex,
    .UpdateDevice = HIDAPI_DriverPS3SonySixaxis_UpdateDevice,
    .OpenJoystick = HIDAPI_DriverPS3SonySixaxis_OpenJoystick,
    .RumbleJoystick = HIDAPI_DriverPS3SonySixaxis_RumbleJoystick,
    .RumbleJoystickTriggers = HIDAPI_DriverPS3SonySixaxis_RumbleJoystickTriggers,
    .GetJoystickCapabilities = HIDAPI_DriverPS3SonySixaxis_GetJoystickCapabilities,
    .SetJoystickLED = HIDAPI_DriverPS3SonySixaxis_SetJoystickLED,
    .SendJoystickEffect = HIDAPI_DriverPS3SonySixaxis_SendJoystickEffect,
    .SetJoystickSensorsEnabled = HIDAPI_DriverPS3SonySixaxis_SetJoystickSensorsEnabled,
    .CloseJoystick = HIDAPI_DriverPS3SonySixaxis_CloseJoystick,
    .FreeDevice = HIDAPI_DriverPS3SonySixaxis_FreeDevice,
};

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_STANDARD_GRAVITY = @as(f32, 9.80665);
pub const SDL_JOYSTICK_AXIS_MAX = @as(c_int, 32767);
pub const SDL_HAT_CENTERED = @as(c_uint, 0x00);
pub const SDL_HAT_UP = @as(c_uint, 0x01);
pub const SDL_HAT_RIGHT = @as(c_uint, 0x02);
pub const SDL_HAT_DOWN = @as(c_uint, 0x04);
pub const SDL_HAT_LEFT = @as(c_uint, 0x08);
pub const USB_VENDOR_HARMONIX = @as(c_int, 0x1bad);
pub const USB_VENDOR_LOGITECH = @as(c_int, 0x046d);
pub const USB_VENDOR_SAITEK = @as(c_int, 0x06a3);
pub const USB_VENDOR_SCEA = @as(c_int, 0x12ba);
pub const USB_VENDOR_SHANWAN = @as(c_int, 0x2563);
pub const USB_VENDOR_SHANWAN_ALT = @as(c_int, 0x20bc);
pub const USB_VENDOR_SONY = @as(c_int, 0x054c);
pub const USB_VENDOR_SWITCH = @as(c_int, 0x2563);
pub const USB_PRODUCT_HARMONIX_WII_RB1_GUITAR = @as(c_int, 0x0004);
pub const USB_PRODUCT_HARMONIX_WII_RB1_DRUMS = @as(c_int, 0x0005);
pub const USB_PRODUCT_HARMONIX_WII_RB2_GUITAR = @as(c_int, 0x3010);
pub const USB_PRODUCT_HARMONIX_WII_RB2_DRUMS = @as(c_int, 0x3110);
pub const USB_PRODUCT_HARMONIX_WII_RB3_MPA_DRUMS_MODE = @as(c_int, 0x3138);
pub const USB_PRODUCT_LOGITECH_CHILLSTREAM = __helpers.promoteIntLiteral(c_int, 0xcad1, .hex);
pub const USB_PRODUCT_SAITEK_CYBORG_V3 = __helpers.promoteIntLiteral(c_int, 0xf622, .hex);
pub const USB_PRODUCT_SCEA_PS3_GH_GUITAR = @as(c_int, 0x0100);
pub const USB_PRODUCT_SCEA_PS3_GH_DRUMS = @as(c_int, 0x0120);
pub const USB_PRODUCT_SCEA_PS3_RB_GUITAR = @as(c_int, 0x0200);
pub const USB_PRODUCT_SCEA_PS3_RB_DRUMS = @as(c_int, 0x0210);
pub const USB_PRODUCT_SCEA_PS3_RB3_MPA_DRUMS_MODE = @as(c_int, 0x0218);
pub const USB_PRODUCT_SCEA_PS3WIIU_GHLIVE = @as(c_int, 0x074b);
pub const USB_PRODUCT_SHANWAN_DS3 = @as(c_int, 0x0523);
pub const USB_PRODUCT_SONY_DS3 = @as(c_int, 0x0268);
pub const USB_PRODUCT_SWITCH_RETRO_CONTROLLER = @as(c_int, 0x0575);
pub const SDL_JOYSTICK_CAP_RUMBLE = @as(c_int, 0x00000010);
