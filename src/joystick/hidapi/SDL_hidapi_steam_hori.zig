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
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
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
pub extern fn SDL_GetHintBoolean_REAL(name: [*c]const u8, default_value: bool) bool;
pub const SDL_HintCallback = ?*const fn (userdata: ?*anyopaque, name: [*c]const u8, oldValue: [*c]const u8, newValue: [*c]const u8) callconv(.c) void;
pub extern fn SDL_AddHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) bool;
pub extern fn SDL_RemoveHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) void;
pub extern fn SDL_GetTicksNS_REAL() Uint64;
pub extern fn SDL_AssertJoysticksLocked() void;
pub extern fn SDL_IsJoystickHoriSteamController(vendor_id: Uint16, product_id: Uint16) bool;
pub extern fn SDL_PrivateJoystickAddSensor(joystick: [*c]SDL_Joystick, @"type": SDL_SensorType, rate: f32) void;
pub extern fn SDL_PrivateJoystickAddCapSense(joystick: [*c]SDL_Joystick, @"type": SDL_GamepadCapSenseType) void;
pub extern fn SDL_SendJoystickAxis(timestamp: Uint64, joystick: [*c]SDL_Joystick, axis: Uint8, value: Sint16) void;
pub extern fn SDL_SendJoystickHat(timestamp: Uint64, joystick: [*c]SDL_Joystick, hat: Uint8, value: Uint8) void;
pub extern fn SDL_SendJoystickButton(timestamp: Uint64, joystick: [*c]SDL_Joystick, button: Uint8, down: bool) void;
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
pub extern fn HIDAPI_RemapVal(val: f32, val_min: f32, val_max: f32, output_min: f32, output_max: f32) f32;
pub const SDL_GAMEPAD_BUTTON_HORI_QAM: c_int = 11;
pub const SDL_GAMEPAD_BUTTON_HORI_FR: c_int = 12;
pub const SDL_GAMEPAD_BUTTON_HORI_FL: c_int = 13;
pub const SDL_GAMEPAD_BUTTON_HORI_M1: c_int = 14;
pub const SDL_GAMEPAD_BUTTON_HORI_M2: c_int = 15;
pub const SDL_GAMEPAD_NUM_HORI_BUTTONS: c_int = 16;
pub const SDL_DriverSteamHori_Context = extern struct {
    last_state: [64]Uint8 = @import("std").mem.zeroes([64]Uint8),
    sensor_ticks: Uint64 = 0,
    last_tick: Uint32 = 0,
    simulated_sensor_step_ns: Uint64 = 0,
    simulated_sensor_time_stamp: Uint64 = 0,
    wireless: bool = false,
    serial_needs_init: bool = false,
};
pub fn HIDAPI_DriverSteamHori_RegisterHints(callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = SDL_AddHintCallback_REAL("SDL_JOYSTICK_HIDAPI_STEAM_HORI", callback, userdata);
}
pub fn HIDAPI_DriverSteamHori_UnregisterHints(callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_RemoveHintCallback_REAL("SDL_JOYSTICK_HIDAPI_STEAM_HORI", callback, userdata);
}
pub fn HIDAPI_DriverSteamHori_IsEnabled() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI_STEAM_HORI", SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI", @"true" != 0));
}
pub fn HIDAPI_DriverSteamHori_IsSupportedDevice(_: [*c]SDL_HIDAPI_Device, _: [*c]const u8, arg_type: SDL_GamepadType, vendor_id: Uint16, product_id: Uint16, _: Uint16, _: c_int, _: c_int, _: c_int, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    return SDL_IsJoystickHoriSteamController(vendor_id, product_id);
}
pub fn HIDAPI_DriverSteamHori_InitDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSteamHori_Context = undefined;
    _ = &ctx;
    ctx = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(ctx.*)))));
    if (!(ctx != null)) {
        return @"false" != 0;
    }
    device.*.context = @ptrCast(@alignCast(ctx));
    ctx.*.serial_needs_init = @"true" != 0;
    HIDAPI_SetDeviceName(device, "Wireless HORIPAD For Steam");
    return HIDAPI_JoystickConnected(device, null);
}
pub fn HIDAPI_DriverSteamHori_GetDevicePlayerIndex(_: [*c]SDL_HIDAPI_Device, _: SDL_JoystickID) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return -@as(c_int, 1);
}
pub fn HIDAPI_DriverSteamHori_SetDevicePlayerIndex(_: [*c]SDL_HIDAPI_Device, _: SDL_JoystickID, _: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn HIDAPI_DriverSteamHori_OpenJoystick(device: [*c]SDL_HIDAPI_Device, joystick: [*c]SDL_Joystick) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSteamHori_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    SDL_AssertJoysticksLocked();
    _ = memset(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.last_state))))), 0, @sizeOf(@TypeOf(ctx.*.last_state)));
    joystick.*.nbuttons = SDL_GAMEPAD_NUM_HORI_BUTTONS;
    joystick.*.naxes = SDL_GAMEPAD_AXIS_COUNT;
    joystick.*.nhats = 1;
    ctx.*.wireless = @as(c_int, device.*.product_id) == USB_PRODUCT_HORI_STEAM_CONTROLLER_BT;
    if (ctx.*.wireless and (device.*.serial != null)) {
        joystick.*.serial = SDL_strdup_REAL(device.*.serial);
        ctx.*.serial_needs_init = @"false" != 0;
    } else if (!ctx.*.wireless) {
        _ = HIDAPI_DriverSteamHori_UpdateDevice(device);
    }
    const sensorupdaterate: f32 = if (ctx.*.wireless) @as(f32, 120.0) else @as(f32, 250.0);
    _ = &sensorupdaterate;
    SDL_PrivateJoystickAddSensor(joystick, SDL_SENSOR_GYRO, sensorupdaterate);
    SDL_PrivateJoystickAddSensor(joystick, SDL_SENSOR_ACCEL, sensorupdaterate);
    const sensorupdatestep_ms: Uint64 = @bitCast(@as(c_long, if (ctx.*.wireless) @as(c_int, 8333) else @as(c_int, 4000)));
    _ = &sensorupdatestep_ms;
    ctx.*.simulated_sensor_step_ns = sensorupdatestep_ms *% @as(Uint64, SDL_NS_PER_US);
    SDL_PrivateJoystickAddCapSense(joystick, SDL_GAMEPAD_CAPSENSE_LEFT_STICK);
    SDL_PrivateJoystickAddCapSense(joystick, SDL_GAMEPAD_CAPSENSE_RIGHT_STICK);
    return @"true" != 0;
}
pub fn HIDAPI_DriverSteamHori_RumbleJoystick(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: Uint16, _: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverSteamHori_RumbleJoystickTriggers(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: Uint16, _: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverSteamHori_GetJoystickCapabilities(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    return 0;
}
pub fn HIDAPI_DriverSteamHori_SetJoystickLED(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: Uint8, _: Uint8, _: Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverSteamHori_SendJoystickEffect(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: ?*const anyopaque, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverSteamHori_SetJoystickSensorsEnabled(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return @"true" != 0;
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
pub fn HIDAPI_DriverSteamHori_HandleStatePacket(joystick: [*c]SDL_Joystick, ctx: [*c]SDL_DriverSteamHori_Context, data: [*c]Uint8, size: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var axis: Sint16 = undefined;
    _ = &axis;
    var timestamp: Uint64 = undefined;
    _ = &timestamp;
    var hat: Uint8 = undefined;
    _ = &hat;
    var serial: [18]u8 = undefined;
    _ = &serial;
    var sensor_timestamp: Uint64 = undefined;
    _ = &sensor_timestamp;
    var imu_data: [3]f32 = undefined;
    _ = &imu_data;
    var delta: Uint32 = undefined;
    _ = &delta;
    var tick: Uint16 = undefined;
    _ = &tick;
    var accelScale: f32 = undefined;
    _ = &accelScale;
    var gyroScale: f32 = undefined;
    _ = &gyroScale;
    var bCharging: bool = undefined;
    _ = &bCharging;
    var percent: c_int = undefined;
    _ = &percent;
    var state: SDL_PowerState = undefined;
    _ = &state;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                timestamp = SDL_GetTicksNS_REAL();
                if ((@as(c_int, data[@as(c_int, 0)]) != REPORT_HEADER_USB) and (@as(c_int, data[@as(c_int, 0)]) != REPORT_HEADER_BT)) {
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
                axis = @truncate(if (@as(c_int, data[@as(c_int, 1)]) == @as(c_int, 128)) @as(c_int, 0) else @as(c_int, @as(Sint16, @intFromFloat(HIDAPI_RemapVal(@floatFromInt(@as(c_int, data[@as(c_int, 1)]) - @as(c_int, 128)), @floatFromInt(-@as(c_int, 128)), @floatFromInt(@as(c_int, 255) - @as(c_int, 128)), @floatFromInt(@as(Sint16, @truncate(~@as(c_int, 32767)))), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767)))))))));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, axis);
                axis = @truncate(if (@as(c_int, data[@as(c_int, 2)]) == @as(c_int, 128)) @as(c_int, 0) else @as(c_int, @as(Sint16, @intFromFloat(HIDAPI_RemapVal(@floatFromInt(@as(c_int, data[@as(c_int, 2)]) - @as(c_int, 128)), @floatFromInt(-@as(c_int, 128)), @floatFromInt(@as(c_int, 255) - @as(c_int, 128)), @floatFromInt(@as(Sint16, @truncate(~@as(c_int, 32767)))), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767)))))))));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, axis);
                axis = @truncate(if (@as(c_int, data[@as(c_int, 3)]) == @as(c_int, 128)) @as(c_int, 0) else @as(c_int, @as(Sint16, @intFromFloat(HIDAPI_RemapVal(@floatFromInt(@as(c_int, data[@as(c_int, 3)]) - @as(c_int, 128)), @floatFromInt(-@as(c_int, 128)), @floatFromInt(@as(c_int, 255) - @as(c_int, 128)), @floatFromInt(@as(Sint16, @truncate(~@as(c_int, 32767)))), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767)))))))));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, axis);
                axis = @truncate(if (@as(c_int, data[@as(c_int, 4)]) == @as(c_int, 128)) @as(c_int, 0) else @as(c_int, @as(Sint16, @intFromFloat(HIDAPI_RemapVal(@floatFromInt(@as(c_int, data[@as(c_int, 4)]) - @as(c_int, 128)), @floatFromInt(-@as(c_int, 128)), @floatFromInt(@as(c_int, 255) - @as(c_int, 128)), @floatFromInt(@as(Sint16, @truncate(~@as(c_int, 32767)))), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767)))))))));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, axis);
                if (@as(c_int, ctx.*.last_state[@as(c_int, 5)]) != @as(c_int, data[@as(c_int, 5)])) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                switch (@as(c_int, data[@as(c_int, 5)]) & @as(c_int, 15)) {
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
                if (@as(c_int, ctx.*.last_state[@as(c_int, 6)]) != @as(c_int, data[@as(c_int, 6)])) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            7 => {
                SDL_SendJoystickHat(timestamp, joystick, 0, hat);
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SOUTH, (@as(c_int, data[@as(c_int, 5)]) & @as(c_int, 16)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_EAST, (@as(c_int, data[@as(c_int, 5)]) & @as(c_int, 32)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_HORI_QAM, (@as(c_int, data[@as(c_int, 5)]) & @as(c_int, 64)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_WEST, (@as(c_int, data[@as(c_int, 5)]) & @as(c_int, 128)) != @as(c_int, 0));
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
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_NORTH, (@as(c_int, data[@as(c_int, 6)]) & @as(c_int, 1)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_HORI_M1, (@as(c_int, data[@as(c_int, 6)]) & @as(c_int, 2)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_SHOULDER, (@as(c_int, data[@as(c_int, 6)]) & @as(c_int, 4)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER, (@as(c_int, data[@as(c_int, 6)]) & @as(c_int, 8)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_BACK, (@as(c_int, data[@as(c_int, 6)]) & @as(c_int, 64)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_START, (@as(c_int, data[@as(c_int, 6)]) & @as(c_int, 128)) != @as(c_int, 0));
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
                if (@as(c_int, ctx.*.last_state[@as(c_int, 7)]) != @as(c_int, data[@as(c_int, 7)])) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_GUIDE, (@as(c_int, data[@as(c_int, 7)]) & @as(c_int, 1)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_STICK, (@as(c_int, data[@as(c_int, 7)]) & @as(c_int, 2)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_STICK, (@as(c_int, data[@as(c_int, 7)]) & @as(c_int, 4)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_HORI_M2, (@as(c_int, data[@as(c_int, 7)]) & @as(c_int, 8)) != @as(c_int, 0));
                SDL_SendJoystickCapSense(timestamp, joystick, SDL_GAMEPAD_CAPSENSE_LEFT_STICK, (@as(c_int, data[@as(c_int, 7)]) & @as(c_int, 16)) != @as(c_int, 0));
                SDL_SendJoystickCapSense(timestamp, joystick, SDL_GAMEPAD_CAPSENSE_RIGHT_STICK, (@as(c_int, data[@as(c_int, 7)]) & @as(c_int, 32)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_HORI_FR, (@as(c_int, data[@as(c_int, 7)]) & @as(c_int, 64)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_HORI_FL, (@as(c_int, data[@as(c_int, 7)]) & @as(c_int, 128)) != @as(c_int, 0));
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
                if (!ctx.*.wireless and ctx.*.serial_needs_init) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&serial)), @sizeOf(@TypeOf(serial)), "%.2x-%.2x-%.2x-%.2x-%.2x-%.2x", data[@as(c_int, 38)], data[@as(c_int, 39)], data[@as(c_int, 40)], data[@as(c_int, 41)], data[@as(c_int, 42)], data[@as(c_int, 43)]);
                SDL_AssertJoysticksLocked();
                joystick.*.serial = SDL_strdup_REAL(@ptrCast(@alignCast(&serial)));
                ctx.*.serial_needs_init = @"false" != 0;
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
                axis = @truncate((@as(c_int, data[@as(c_int, 8)]) * @as(c_int, 257)) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHT_TRIGGER, axis);
                axis = @truncate((@as(c_int, data[@as(c_int, 9)]) * @as(c_int, 257)) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFT_TRIGGER, axis);
                if (true) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            26 => {
                tick = @bitCast(@as(c_short, @as(Sint16, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 10)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 11)])) << @intCast(@as(c_int, 8)))))));
                if (ctx.*.last_tick <= @as(Uint32, @bitCast(@as(c_int, @as(c_int, tick))))) {
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
                if (@as(c_int, ctx.*.last_state[@as(c_int, 24)]) != @as(c_int, data[@as(c_int, 24)])) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            29 => {
                delta = @as(Uint32, @bitCast(@as(c_int, @as(c_int, tick)))) -% ctx.*.last_tick;
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            30 => {
                delta = ((@as(Uint32, @bitCast(@as(c_int, @as(c_int, @as(Uint16, @bitCast(@as(c_short, @truncate(@as(c_int, 65535))))))))) -% ctx.*.last_tick) +% @as(Uint32, @bitCast(@as(c_int, @as(c_int, tick))))) +% @as(Uint32, 1);
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            31 => {
                ctx.*.last_tick = tick;
                ctx.*.sensor_ticks +%= delta;
                ctx.*.simulated_sensor_time_stamp +%= ctx.*.simulated_sensor_step_ns;
                sensor_timestamp = ctx.*.simulated_sensor_time_stamp;
                accelScale = (SDL_STANDARD_GRAVITY * @as(f32, @floatFromInt(@as(c_int, 8)))) / @as(f32, 32768.0);
                gyroScale = @as(f32, @floatFromInt(@as(c_int, 2048))) * (SDL_PI_F / @as(f32, 180.0));
                imu_data[@as(c_int, 1)] = RemapValClamped(-@as(f32, 1.0) * @as(f32, @floatFromInt(@as(c_int, @as(Sint16, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 12)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 13)])) << @intCast(@as(c_int, 8)))))))), @floatFromInt(-@as(c_int, 32767) - @as(c_int, 1)), @floatFromInt(@as(c_int, 32767)), -gyroScale, gyroScale);
                imu_data[@as(c_int, 2)] = RemapValClamped(-@as(f32, 1.0) * @as(f32, @floatFromInt(@as(c_int, @as(Sint16, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 14)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 15)])) << @intCast(@as(c_int, 8)))))))), @floatFromInt(-@as(c_int, 32767) - @as(c_int, 1)), @floatFromInt(@as(c_int, 32767)), -gyroScale, gyroScale);
                imu_data[@as(c_int, 0)] = RemapValClamped(-@as(f32, 1.0) * @as(f32, @floatFromInt(@as(c_int, @as(Sint16, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 16)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 17)])) << @intCast(@as(c_int, 8)))))))), @floatFromInt(-@as(c_int, 32767) - @as(c_int, 1)), @floatFromInt(@as(c_int, 32767)), -gyroScale, gyroScale);
                SDL_SendJoystickSensor(timestamp, joystick, SDL_SENSOR_GYRO, sensor_timestamp, @ptrCast(@alignCast(&imu_data)), 3);
                imu_data[@as(c_int, 2)] = @as(f32, @floatFromInt(@as(c_int, @as(Sint16, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 18)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 19)])) << @intCast(@as(c_int, 8)))))))) * accelScale;
                imu_data[@as(c_int, 1)] = @as(f32, @floatFromInt(-@as(c_int, 1) * @as(c_int, @as(Sint16, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 20)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 21)])) << @intCast(@as(c_int, 8)))))))) * accelScale;
                imu_data[@as(c_int, 0)] = @as(f32, @floatFromInt(@as(c_int, @as(Sint16, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 22)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 23)])) << @intCast(@as(c_int, 8)))))))) * accelScale;
                SDL_SendJoystickSensor(timestamp, joystick, SDL_SENSOR_ACCEL, sensor_timestamp, @ptrCast(@alignCast(&imu_data)), 3);
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            32 => {
                bCharging = (@as(c_int, data[@as(c_int, 24)]) & @as(c_int, 16)) != @as(c_int, 0);
                percent = (@as(c_int, data[@as(c_int, 24)]) & @as(c_int, 15)) * @as(c_int, 10);
                if (bCharging) {
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
                _ = memcpy(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.last_state))))), @ptrCast(@alignCast(data)), if (@as(c_ulong, @bitCast(@as(c_long, size))) < @sizeOf(@TypeOf(ctx.*.last_state))) @as(c_ulong, @bitCast(@as(c_long, size))) else @sizeOf(@TypeOf(ctx.*.last_state)));
                {}
            },
            35 => {
                state = SDL_POWERSTATE_CHARGING;
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            36 => {
                if (ctx.*.wireless) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
                    continue;
                }
            },
            37 => {
                SDL_SendJoystickPowerInfo(joystick, state, percent);
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            38 => {
                state = SDL_POWERSTATE_ON_BATTERY;
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            39 => {
                state = SDL_POWERSTATE_CHARGED;
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
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverSteamHori_UpdateDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSteamHori_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    var joystick: [*c]SDL_Joystick = null;
    _ = &joystick;
    var data: [64]Uint8 = undefined;
    _ = &data;
    var size: c_int = 0;
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
        HIDAPI_DriverSteamHori_HandleStatePacket(joystick, ctx, @ptrCast(@alignCast(&data)), size);
    }
    if (size < @as(c_int, 0)) {
        HIDAPI_JoystickDisconnected(device, device.*.joysticks[@as(c_int, 0)]);
    }
    return size >= @as(c_int, 0);
}
pub fn HIDAPI_DriverSteamHori_CloseJoystick(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn HIDAPI_DriverSteamHori_FreeDevice(_: [*c]SDL_HIDAPI_Device) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub export var SDL_HIDAPI_DriverSteamHori: SDL_HIDAPI_DeviceDriver = SDL_HIDAPI_DeviceDriver{
    .name = "SDL_JOYSTICK_HIDAPI_STEAM_HORI",
    .enabled = @"true" != 0,
    .RegisterHints = HIDAPI_DriverSteamHori_RegisterHints,
    .UnregisterHints = HIDAPI_DriverSteamHori_UnregisterHints,
    .IsEnabled = HIDAPI_DriverSteamHori_IsEnabled,
    .IsSupportedDevice = HIDAPI_DriverSteamHori_IsSupportedDevice,
    .InitDevice = HIDAPI_DriverSteamHori_InitDevice,
    .GetDevicePlayerIndex = HIDAPI_DriverSteamHori_GetDevicePlayerIndex,
    .SetDevicePlayerIndex = HIDAPI_DriverSteamHori_SetDevicePlayerIndex,
    .UpdateDevice = HIDAPI_DriverSteamHori_UpdateDevice,
    .OpenJoystick = HIDAPI_DriverSteamHori_OpenJoystick,
    .RumbleJoystick = HIDAPI_DriverSteamHori_RumbleJoystick,
    .RumbleJoystickTriggers = HIDAPI_DriverSteamHori_RumbleJoystickTriggers,
    .GetJoystickCapabilities = HIDAPI_DriverSteamHori_GetJoystickCapabilities,
    .SetJoystickLED = HIDAPI_DriverSteamHori_SetJoystickLED,
    .SendJoystickEffect = HIDAPI_DriverSteamHori_SendJoystickEffect,
    .SetJoystickSensorsEnabled = HIDAPI_DriverSteamHori_SetJoystickSensorsEnabled,
    .CloseJoystick = HIDAPI_DriverSteamHori_CloseJoystick,
    .FreeDevice = HIDAPI_DriverSteamHori_FreeDevice,
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
pub const SDL_NS_PER_US = @as(c_int, 1000);
pub const USB_PRODUCT_HORI_STEAM_CONTROLLER_BT = @as(c_int, 0x0196);
pub inline fn clamp(val: anytype, min: anytype, max: anytype) @TypeOf(if (__helpers.cast(bool, val > max)) max else if (__helpers.cast(bool, val < min)) min else val) {
    @setEvalBranchQuota(100000);
    _ = &val;
    _ = &min;
    _ = &max;
    return if (__helpers.cast(bool, val > max)) max else if (__helpers.cast(bool, val < min)) min else val;
}
pub const REPORT_HEADER_USB = @as(c_int, 0x07);
pub const REPORT_HEADER_BT = @as(c_int, 0x00);
