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
pub extern fn SDL_GetTicks_REAL() Uint64;
pub extern fn SDL_GetTicksNS_REAL() Uint64;
pub extern fn SDL_AssertJoysticksLocked() void;
pub extern fn SDL_IsJoystickNVIDIASHIELDController(vendor_id: Uint16, product_id: Uint16) bool;
pub extern fn SDL_PrivateJoystickAddTouchpad(joystick: [*c]SDL_Joystick, nfingers: c_int) void;
pub extern fn SDL_SendJoystickAxis(timestamp: Uint64, joystick: [*c]SDL_Joystick, axis: Uint8, value: Sint16) void;
pub extern fn SDL_SendJoystickHat(timestamp: Uint64, joystick: [*c]SDL_Joystick, hat: Uint8, value: Uint8) void;
pub extern fn SDL_SendJoystickButton(timestamp: Uint64, joystick: [*c]SDL_Joystick, button: Uint8, down: bool) void;
pub extern fn SDL_SendJoystickTouchpad(timestamp: Uint64, joystick: [*c]SDL_Joystick, touchpad: c_int, finger: c_int, down: bool, x: f32, y: f32, pressure: f32) void;
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
pub extern fn SDL_HIDAPI_SendRumble(device: [*c]SDL_HIDAPI_Device, data: [*c]const Uint8, size: c_int) c_int;
pub const SDL_GAMEPAD_BUTTON_SHIELD_V103_TOUCHPAD: c_int = 12;
pub const SDL_GAMEPAD_BUTTON_SHIELD_V103_MINUS: c_int = 13;
pub const SDL_GAMEPAD_BUTTON_SHIELD_V103_PLUS: c_int = 14;
pub const SDL_GAMEPAD_NUM_SHIELD_V103_BUTTONS: c_int = 15;
pub const SDL_GAMEPAD_NUM_SHIELD_V104_BUTTONS: c_int = 12;
pub const k_ShieldReportIdControllerState: c_int = 1;
pub const k_ShieldReportIdControllerTouch: c_int = 2;
pub const k_ShieldReportIdCommandResponse: c_int = 3;
pub const k_ShieldReportIdCommandRequest: c_int = 4;
pub const ShieldCommandReport_t = extern struct {
    report_id: Uint8 = 0,
    cmd: Uint8 = 0,
    seq_num: Uint8 = 0,
    payload: [30]Uint8 = @import("std").mem.zeroes([30]Uint8),
};
comptime {
    if (!(@sizeOf(ShieldCommandReport_t) == @as(c_ulong, HID_REPORT_SIZE))) @compileError("static assertion failed \"sizeof(ShieldCommandReport_t) == HID_REPORT_SIZE\"");
}
pub const SDL_DriverShield_Context = extern struct {
    seq_num: Uint8 = 0,
    has_charging: bool = false,
    charging: Uint8 = 0,
    has_battery_level: bool = false,
    battery_level: Uint8 = 0,
    last_battery_query_time: Uint64 = 0,
    rumble_report_pending: bool = false,
    rumble_update_pending: bool = false,
    left_motor_amplitude: Uint8 = 0,
    right_motor_amplitude: Uint8 = 0,
    last_rumble_time: Uint64 = 0,
    last_state: [64]Uint8 = @import("std").mem.zeroes([64]Uint8),
};
pub fn HIDAPI_DriverShield_RegisterHints(callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = SDL_AddHintCallback_REAL("SDL_JOYSTICK_HIDAPI_SHIELD", callback, userdata);
}
pub fn HIDAPI_DriverShield_UnregisterHints(callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_RemoveHintCallback_REAL("SDL_JOYSTICK_HIDAPI_SHIELD", callback, userdata);
}
pub fn HIDAPI_DriverShield_IsEnabled() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI_SHIELD", SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI", @"true" != 0));
}
pub fn HIDAPI_DriverShield_IsSupportedDevice(_: [*c]SDL_HIDAPI_Device, _: [*c]const u8, arg_type: SDL_GamepadType, vendor_id: Uint16, product_id: Uint16, _: Uint16, _: c_int, _: c_int, _: c_int, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    return SDL_IsJoystickNVIDIASHIELDController(vendor_id, product_id);
}
pub fn HIDAPI_DriverShield_InitDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverShield_Context = undefined;
    _ = &ctx;
    ctx = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(ctx.*)))));
    if (!(ctx != null)) {
        return @"false" != 0;
    }
    device.*.context = @ptrCast(@alignCast(ctx));
    HIDAPI_SetDeviceName(device, "NVIDIA SHIELD Controller");
    return HIDAPI_JoystickConnected(device, null);
}
pub fn HIDAPI_DriverShield_GetDevicePlayerIndex(_: [*c]SDL_HIDAPI_Device, _: SDL_JoystickID) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return -@as(c_int, 1);
}
pub fn HIDAPI_DriverShield_SetDevicePlayerIndex(_: [*c]SDL_HIDAPI_Device, _: SDL_JoystickID, _: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn HIDAPI_DriverShield_SendCommand(device: [*c]SDL_HIDAPI_Device, cmd: Uint8, data: ?*const anyopaque, size: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverShield_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    var cmd_pkt: ShieldCommandReport_t = undefined;
    _ = &cmd_pkt;
    if (@as(c_ulong, @bitCast(@as(c_long, size))) > @sizeOf(@TypeOf(cmd_pkt.payload))) {
        return SDL_SetError_REAL("Command data exceeds HID report size");
    }
    if (!SDL_HIDAPI_LockRumble()) {
        return @"false" != 0;
    }
    cmd_pkt.report_id = k_ShieldReportIdCommandRequest;
    cmd_pkt.cmd = cmd;
    cmd_pkt.seq_num = blk: {
        const ref = &ctx.*.seq_num;
        const tmp = ref.*;
        ref.* +%= 1;
        break :blk tmp;
    };
    if (data != null) {
        _ = memcpy(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&cmd_pkt.payload))))), data, @bitCast(@as(c_long, size)));
    }
    if (@as(c_ulong, @bitCast(@as(c_long, size))) != @sizeOf(@TypeOf(cmd_pkt.payload))) {
        _ = memset(@ptrCast(@alignCast(&cmd_pkt.payload[@bitCast(@as(isize, @intCast(size)))])), 0, @sizeOf(@TypeOf(cmd_pkt.payload)) -% @as(c_ulong, @bitCast(@as(c_long, size))));
    }
    if (@as(c_ulong, @bitCast(@as(c_long, SDL_HIDAPI_SendRumbleAndUnlock(device, @ptrCast(@alignCast(&cmd_pkt)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(cmd_pkt))))))))) != @sizeOf(@TypeOf(cmd_pkt))) {
        return SDL_SetError_REAL("Couldn't send command packet");
    }
    return @"true" != 0;
}
pub fn HIDAPI_DriverShield_OpenJoystick(device: [*c]SDL_HIDAPI_Device, joystick: [*c]SDL_Joystick) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverShield_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    SDL_AssertJoysticksLocked();
    ctx.*.rumble_report_pending = @"false" != 0;
    ctx.*.rumble_update_pending = @"false" != 0;
    ctx.*.left_motor_amplitude = 0;
    ctx.*.right_motor_amplitude = 0;
    ctx.*.last_rumble_time = 0;
    _ = memset(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.last_state))))), 0, @sizeOf(@TypeOf(ctx.*.last_state)));
    if (@as(c_int, device.*.product_id) == USB_PRODUCT_NVIDIA_SHIELD_CONTROLLER_V103) {
        joystick.*.nbuttons = SDL_GAMEPAD_NUM_SHIELD_V103_BUTTONS;
        joystick.*.naxes = SDL_GAMEPAD_AXIS_COUNT;
        joystick.*.nhats = 1;
        SDL_PrivateJoystickAddTouchpad(joystick, 1);
    } else {
        joystick.*.nbuttons = SDL_GAMEPAD_NUM_SHIELD_V104_BUTTONS;
        joystick.*.naxes = SDL_GAMEPAD_AXIS_COUNT;
        joystick.*.nhats = 1;
    }
    ctx.*.last_battery_query_time = SDL_GetTicks_REAL();
    _ = HIDAPI_DriverShield_SendCommand(device, CMD_CHARGE_STATE, null, 0);
    _ = HIDAPI_DriverShield_SendCommand(device, CMD_BATTERY_STATE, null, 0);
    return @"true" != 0;
}
pub fn HIDAPI_DriverShield_SendNextRumble(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverShield_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    var rumble_data: [3]Uint8 = undefined;
    _ = &rumble_data;
    if (!ctx.*.rumble_update_pending) {
        return @"true" != 0;
    }
    rumble_data[@as(c_int, 0)] = 1;
    rumble_data[@as(c_int, 1)] = ctx.*.left_motor_amplitude;
    rumble_data[@as(c_int, 2)] = ctx.*.right_motor_amplitude;
    ctx.*.rumble_update_pending = @"false" != 0;
    ctx.*.last_rumble_time = SDL_GetTicks_REAL();
    return HIDAPI_DriverShield_SendCommand(device, CMD_RUMBLE, @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&rumble_data))))), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(rumble_data))))));
}
pub fn HIDAPI_DriverShield_RumbleJoystick(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, low_frequency_rumble: Uint16, high_frequency_rumble: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (@as(c_int, device.*.product_id) == USB_PRODUCT_NVIDIA_SHIELD_CONTROLLER_V103) {
        var rumble_packet: [7]Uint8 = [7]Uint8{
            1,
            0,
            0,
            0,
            0,
            0,
            0,
        };
        _ = &rumble_packet;
        rumble_packet[@as(c_int, 2)] = @bitCast(@as(i8, @truncate(@as(c_int, low_frequency_rumble) >> @intCast(@as(c_int, 8)))));
        rumble_packet[@as(c_int, 4)] = @bitCast(@as(i8, @truncate(@as(c_int, high_frequency_rumble) >> @intCast(@as(c_int, 8)))));
        if (@as(c_ulong, @bitCast(@as(c_long, SDL_HIDAPI_SendRumble(device, @ptrCast(@alignCast(&rumble_packet)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(rumble_packet))))))))) != @sizeOf(@TypeOf(rumble_packet))) {
            return SDL_SetError_REAL("Couldn't send rumble packet");
        }
        return @"true" != 0;
    } else {
        var ctx: [*c]SDL_DriverShield_Context = @ptrCast(@alignCast(device.*.context));
        _ = &ctx;
        ctx.*.left_motor_amplitude = @bitCast(@as(i8, @truncate(@as(c_int, low_frequency_rumble) >> @intCast(@as(c_int, 11)))));
        ctx.*.right_motor_amplitude = @bitCast(@as(i8, @truncate(@as(c_int, high_frequency_rumble) >> @intCast(@as(c_int, 11)))));
        ctx.*.rumble_update_pending = @"true" != 0;
        if (ctx.*.rumble_report_pending) {
            return @"true" != 0;
        }
        return HIDAPI_DriverShield_SendNextRumble(device);
    }
}
pub fn HIDAPI_DriverShield_RumbleJoystickTriggers(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: Uint16, _: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverShield_GetJoystickCapabilities(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    return SDL_JOYSTICK_CAP_RUMBLE;
}
pub fn HIDAPI_DriverShield_SetJoystickLED(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: Uint8, _: Uint8, _: Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverShield_SendJoystickEffect(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, data: ?*const anyopaque, size: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var data_bytes: [*c]const Uint8 = @ptrCast(@alignCast(data));
    _ = &data_bytes;
    if (size > @as(c_int, 1)) {
        return HIDAPI_DriverShield_SendCommand(device, data_bytes[@as(c_int, 0)], @ptrCast(@alignCast(&data_bytes[@as(c_int, 1)])), size - @as(c_int, 1));
    } else if (size == @as(c_int, 1)) {
        return HIDAPI_DriverShield_SendCommand(device, data_bytes[@as(c_int, 0)], null, 0);
    } else {
        return SDL_SetError_REAL("Effect data must at least contain a command byte");
    }
}
pub fn HIDAPI_DriverShield_SetJoystickSensorsEnabled(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverShield_HandleStatePacketV103(joystick: [*c]SDL_Joystick, ctx: [*c]SDL_DriverShield_Context, data: [*c]Uint8, size: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var timestamp: Uint64 = undefined;
    _ = &timestamp;
    var axis: Sint16 = undefined;
    _ = &axis;
    var hat: Uint8 = undefined;
    _ = &hat;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                timestamp = SDL_GetTicksNS_REAL();
                if (@as(c_int, ctx.*.last_state[@as(c_int, 3)]) != @as(c_int, data[@as(c_int, 3)])) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                switch (@as(c_int, data[@as(c_int, 3)])) {
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
                if (@as(c_int, ctx.*.last_state[@as(c_int, 1)]) != @as(c_int, data[@as(c_int, 1)])) {
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
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SOUTH, (@as(c_int, data[@as(c_int, 1)]) & @as(c_int, 1)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_EAST, (@as(c_int, data[@as(c_int, 1)]) & @as(c_int, 2)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_WEST, (@as(c_int, data[@as(c_int, 1)]) & @as(c_int, 4)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_NORTH, (@as(c_int, data[@as(c_int, 1)]) & @as(c_int, 8)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_SHOULDER, (@as(c_int, data[@as(c_int, 1)]) & @as(c_int, 16)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER, (@as(c_int, data[@as(c_int, 1)]) & @as(c_int, 32)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_STICK, (@as(c_int, data[@as(c_int, 1)]) & @as(c_int, 64)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_STICK, (@as(c_int, data[@as(c_int, 1)]) & @as(c_int, 128)) != @as(c_int, 0));
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
                if (@as(c_int, ctx.*.last_state[@as(c_int, 2)]) != @as(c_int, data[@as(c_int, 2)])) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            17 => {
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_START, (@as(c_int, data[@as(c_int, 2)]) & @as(c_int, 2)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SHIELD_V103_PLUS, (@as(c_int, data[@as(c_int, 2)]) & @as(c_int, 8)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SHIELD_V103_MINUS, (@as(c_int, data[@as(c_int, 2)]) & @as(c_int, 16)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_BACK, (@as(c_int, data[@as(c_int, 2)]) & @as(c_int, 64)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_GUIDE, (@as(c_int, data[@as(c_int, 2)]) & @as(c_int, 128)) != @as(c_int, 0));
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
                axis = @truncate(@as(c_int, @as(Sint16, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 4)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 5)])) << @intCast(@as(c_int, 8)))))) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, axis);
                axis = @truncate(@as(c_int, @as(Sint16, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 6)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 7)])) << @intCast(@as(c_int, 8)))))) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, axis);
                axis = @truncate(@as(c_int, @as(Sint16, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 8)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 9)])) << @intCast(@as(c_int, 8)))))) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, axis);
                axis = @truncate(@as(c_int, @as(Sint16, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 10)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 11)])) << @intCast(@as(c_int, 8)))))) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, axis);
                axis = @truncate(@as(c_int, @as(Sint16, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 12)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 13)])) << @intCast(@as(c_int, 8)))))) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFT_TRIGGER, axis);
                axis = @truncate(@as(c_int, @as(Sint16, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 14)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 15)])) << @intCast(@as(c_int, 8)))))) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHT_TRIGGER, axis);
                _ = memcpy(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.last_state))))), @ptrCast(@alignCast(data)), if (@as(c_ulong, @bitCast(@as(c_long, size))) < @sizeOf(@TypeOf(ctx.*.last_state))) @as(c_ulong, @bitCast(@as(c_long, size))) else @sizeOf(@TypeOf(ctx.*.last_state)));
                {}
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverShield_HandleTouchPacketV103(joystick: [*c]SDL_Joystick, _: [*c]SDL_DriverShield_Context, data: [*c]const Uint8, _: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var touchpad_down: bool = undefined;
    _ = &touchpad_down;
    var touchpad_x: f32 = undefined;
    _ = &touchpad_x;
    var touchpad_y: f32 = undefined;
    _ = &touchpad_y;
    var timestamp: Uint64 = SDL_GetTicksNS_REAL();
    _ = &timestamp;
    SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SHIELD_V103_TOUCHPAD, (@as(c_int, data[@as(c_int, 1)]) & @as(c_int, 1)) != @as(c_int, 0));
    touchpad_down = (@as(c_int, data[@as(c_int, 1)]) & @as(c_int, 128)) == @as(c_int, 0);
    touchpad_x = if ((@as(f32, @floatFromInt(@as(c_int, data[@as(c_int, 2)]) - @as(c_int, 112))) / @as(f32, @floatFromInt(@as(c_int, 80)))) > @as(f32, 1.0)) @as(f32, 1.0) else if ((@as(f32, @floatFromInt(@as(c_int, data[@as(c_int, 2)]) - @as(c_int, 112))) / @as(f32, @floatFromInt(@as(c_int, 80)))) < @as(f32, 0.0)) @as(f32, 0.0) else @as(f32, @floatFromInt(@as(c_int, data[@as(c_int, 2)]) - @as(c_int, 112))) / @as(f32, @floatFromInt(@as(c_int, 80)));
    touchpad_y = if ((@as(f32, @floatFromInt(@as(c_int, data[@as(c_int, 4)]) - @as(c_int, 64))) / @as(f32, @floatFromInt(@as(c_int, 21)))) > @as(f32, 1.0)) @as(f32, 1.0) else if ((@as(f32, @floatFromInt(@as(c_int, data[@as(c_int, 4)]) - @as(c_int, 64))) / @as(f32, @floatFromInt(@as(c_int, 21)))) < @as(f32, 0.0)) @as(f32, 0.0) else @as(f32, @floatFromInt(@as(c_int, data[@as(c_int, 4)]) - @as(c_int, 64))) / @as(f32, @floatFromInt(@as(c_int, 21)));
    SDL_SendJoystickTouchpad(timestamp, joystick, 0, 0, touchpad_down, touchpad_x, touchpad_y, if (touchpad_down) @as(f32, 1.0) else @as(f32, 0.0));
}
pub fn HIDAPI_DriverShield_HandleStatePacketV104(joystick: [*c]SDL_Joystick, ctx: [*c]SDL_DriverShield_Context, data: [*c]Uint8, size: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var timestamp: Uint64 = undefined;
    _ = &timestamp;
    var axis: Sint16 = undefined;
    _ = &axis;
    var hat: Uint8 = undefined;
    _ = &hat;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                timestamp = SDL_GetTicksNS_REAL();
                if (size < @as(c_int, 23)) {
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
                if (@as(c_int, ctx.*.last_state[@as(c_int, 2)]) != @as(c_int, data[@as(c_int, 2)])) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                switch (@as(c_int, data[@as(c_int, 2)])) {
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
                if (@as(c_int, ctx.*.last_state[@as(c_int, 3)]) != @as(c_int, data[@as(c_int, 3)])) {
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
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SOUTH, (@as(c_int, data[@as(c_int, 3)]) & @as(c_int, 1)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_EAST, (@as(c_int, data[@as(c_int, 3)]) & @as(c_int, 2)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_WEST, (@as(c_int, data[@as(c_int, 3)]) & @as(c_int, 4)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_NORTH, (@as(c_int, data[@as(c_int, 3)]) & @as(c_int, 8)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_SHOULDER, (@as(c_int, data[@as(c_int, 3)]) & @as(c_int, 16)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER, (@as(c_int, data[@as(c_int, 3)]) & @as(c_int, 32)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_STICK, (@as(c_int, data[@as(c_int, 3)]) & @as(c_int, 64)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_STICK, (@as(c_int, data[@as(c_int, 3)]) & @as(c_int, 128)) != @as(c_int, 0));
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
                if (@as(c_int, ctx.*.last_state[@as(c_int, 4)]) != @as(c_int, data[@as(c_int, 4)])) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_START, (@as(c_int, data[@as(c_int, 4)]) & @as(c_int, 1)) != @as(c_int, 0));
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
                axis = @truncate(@as(c_int, @as(Sint16, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 9)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 10)])) << @intCast(@as(c_int, 8)))))) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, axis);
                axis = @truncate(@as(c_int, @as(Sint16, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 11)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 12)])) << @intCast(@as(c_int, 8)))))) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, axis);
                axis = @truncate(@as(c_int, @as(Sint16, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 13)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 14)])) << @intCast(@as(c_int, 8)))))) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, axis);
                axis = @truncate(@as(c_int, @as(Sint16, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 15)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 16)])) << @intCast(@as(c_int, 8)))))) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, axis);
                axis = @truncate(@as(c_int, @as(Sint16, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 19)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 20)])) << @intCast(@as(c_int, 8)))))) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFT_TRIGGER, axis);
                axis = @truncate(@as(c_int, @as(Sint16, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 21)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 22)])) << @intCast(@as(c_int, 8)))))) - @as(c_int, 32768));
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHT_TRIGGER, axis);
                if (@as(c_int, ctx.*.last_state[@as(c_int, 17)]) != @as(c_int, data[@as(c_int, 17)])) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_BACK, (@as(c_int, data[@as(c_int, 17)]) & @as(c_int, 2)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_GUIDE, (@as(c_int, data[@as(c_int, 17)]) & @as(c_int, 1)) != @as(c_int, 0));
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
                _ = memcpy(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.last_state))))), @ptrCast(@alignCast(data)), if (@as(c_ulong, @bitCast(@as(c_long, size))) < @sizeOf(@TypeOf(ctx.*.last_state))) @as(c_ulong, @bitCast(@as(c_long, size))) else @sizeOf(@TypeOf(ctx.*.last_state)));
                {}
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverShield_UpdatePowerInfo(joystick: [*c]SDL_Joystick, ctx: [*c]SDL_DriverShield_Context) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (!ctx.*.has_charging or !ctx.*.has_battery_level) {
        return;
    }
    var state: SDL_PowerState = if (ctx.*.charging != 0) SDL_POWERSTATE_CHARGING else SDL_POWERSTATE_ON_BATTERY;
    _ = &state;
    var percent: c_int = @as(c_int, ctx.*.battery_level) * @as(c_int, 20);
    _ = &percent;
    SDL_SendJoystickPowerInfo(joystick, state, percent);
}
pub fn HIDAPI_DriverShield_UpdateDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverShield_Context = undefined;
    _ = &ctx;
    var joystick: [*c]SDL_Joystick = undefined;
    _ = &joystick;
    var data: [64]Uint8 = undefined;
    _ = &data;
    var size: c_int = undefined;
    _ = &size;
    var cmd_resp_report: [*c]ShieldCommandReport_t = undefined;
    _ = &cmd_resp_report;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                ctx = @ptrCast(@alignCast(device.*.context));
                joystick = null;
                size = 0;
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
                if ((joystick != null) and (SDL_GetTicks_REAL() >= (ctx.*.last_battery_query_time +% @as(Uint64, BATTERY_POLL_INTERVAL_MS)))) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
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
                switch (@as(c_int, data[@as(c_int, 0)])) {
                    k_ShieldReportIdControllerState => {
                        sdl_pc = 11;
                        continue;
                    },
                    k_ShieldReportIdControllerTouch => {
                        sdl_pc = 15;
                        continue;
                    },
                    k_ShieldReportIdCommandResponse => {
                        sdl_pc = 16;
                        continue;
                    },
                    else => {
                        sdl_pc = 10;
                        continue;
                    },
                }
            },
            10 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            11 => {
                if (size == @as(c_int, 16)) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            12 => {
                HIDAPI_DriverShield_HandleStatePacketV103(joystick, ctx, @ptrCast(@alignCast(&data)), size);
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            13 => {
                HIDAPI_DriverShield_HandleStatePacketV104(joystick, ctx, @ptrCast(@alignCast(&data)), size);
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
                HIDAPI_DriverShield_HandleTouchPacketV103(joystick, ctx, @ptrCast(@alignCast(&data)), size);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            16 => {
                cmd_resp_report = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&data)))));
                switch (@as(c_int, cmd_resp_report.*.cmd)) {
                    CMD_RUMBLE => {
                        sdl_pc = 18;
                        continue;
                    },
                    CMD_CHARGE_STATE => {
                        sdl_pc = 19;
                        continue;
                    },
                    CMD_BATTERY_STATE => {
                        sdl_pc = 20;
                        continue;
                    },
                    else => {
                        sdl_pc = 17;
                        continue;
                    },
                }
            },
            17 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            18 => {
                ctx.*.rumble_report_pending = @"false" != 0;
                _ = HIDAPI_DriverShield_SendNextRumble(device);
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            19 => {
                ctx.*.has_charging = @"true" != 0;
                ctx.*.charging = cmd_resp_report.*.payload[@as(c_int, 0)];
                HIDAPI_DriverShield_UpdatePowerInfo(joystick, ctx);
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            20 => {
                ctx.*.has_battery_level = @"true" != 0;
                ctx.*.battery_level = cmd_resp_report.*.payload[@as(c_int, 2)];
                HIDAPI_DriverShield_UpdatePowerInfo(joystick, ctx);
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            21 => {
                ctx.*.last_battery_query_time = SDL_GetTicks_REAL();
                _ = HIDAPI_DriverShield_SendCommand(device, CMD_BATTERY_STATE, null, 0);
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
                if (((@as(c_int, ctx.*.left_motor_amplitude) != @as(c_int, 0)) or (@as(c_int, ctx.*.right_motor_amplitude) != @as(c_int, 0))) and (SDL_GetTicks_REAL() >= (ctx.*.last_rumble_time +% @as(Uint64, RUMBLE_REFRESH_INTERVAL_MS)))) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            24 => {
                ctx.*.rumble_update_pending = @"true" != 0;
                _ = HIDAPI_DriverShield_SendNextRumble(device);
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
                if (size < @as(c_int, 0)) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            27 => {
                HIDAPI_JoystickDisconnected(device, device.*.joysticks[@as(c_int, 0)]);
                {
                    sdl_pc = 29;
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
                return size >= @as(c_int, 0);
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverShield_CloseJoystick(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn HIDAPI_DriverShield_FreeDevice(_: [*c]SDL_HIDAPI_Device) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub export var SDL_HIDAPI_DriverShield: SDL_HIDAPI_DeviceDriver = SDL_HIDAPI_DeviceDriver{
    .name = "SDL_JOYSTICK_HIDAPI_SHIELD",
    .enabled = @"true" != 0,
    .RegisterHints = HIDAPI_DriverShield_RegisterHints,
    .UnregisterHints = HIDAPI_DriverShield_UnregisterHints,
    .IsEnabled = HIDAPI_DriverShield_IsEnabled,
    .IsSupportedDevice = HIDAPI_DriverShield_IsSupportedDevice,
    .InitDevice = HIDAPI_DriverShield_InitDevice,
    .GetDevicePlayerIndex = HIDAPI_DriverShield_GetDevicePlayerIndex,
    .SetDevicePlayerIndex = HIDAPI_DriverShield_SetDevicePlayerIndex,
    .UpdateDevice = HIDAPI_DriverShield_UpdateDevice,
    .OpenJoystick = HIDAPI_DriverShield_OpenJoystick,
    .RumbleJoystick = HIDAPI_DriverShield_RumbleJoystick,
    .RumbleJoystickTriggers = HIDAPI_DriverShield_RumbleJoystickTriggers,
    .GetJoystickCapabilities = HIDAPI_DriverShield_GetJoystickCapabilities,
    .SetJoystickLED = HIDAPI_DriverShield_SetJoystickLED,
    .SendJoystickEffect = HIDAPI_DriverShield_SendJoystickEffect,
    .SetJoystickSensorsEnabled = HIDAPI_DriverShield_SetJoystickSensorsEnabled,
    .CloseJoystick = HIDAPI_DriverShield_CloseJoystick,
    .FreeDevice = HIDAPI_DriverShield_FreeDevice,
};

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_HAT_CENTERED = @as(c_uint, 0x00);
pub const SDL_HAT_UP = @as(c_uint, 0x01);
pub const SDL_HAT_RIGHT = @as(c_uint, 0x02);
pub const SDL_HAT_DOWN = @as(c_uint, 0x04);
pub const SDL_HAT_LEFT = @as(c_uint, 0x08);
pub const USB_PRODUCT_NVIDIA_SHIELD_CONTROLLER_V103 = @as(c_int, 0x7210);
pub const SDL_JOYSTICK_CAP_RUMBLE = @as(c_int, 0x00000010);
pub const CMD_BATTERY_STATE = @as(c_int, 0x07);
pub const CMD_RUMBLE = @as(c_int, 0x39);
pub const CMD_CHARGE_STATE = @as(c_int, 0x3A);
pub const BATTERY_POLL_INTERVAL_MS = __helpers.promoteIntLiteral(c_int, 60000, .decimal);
pub const RUMBLE_REFRESH_INTERVAL_MS = @as(c_int, 500);
pub const HID_REPORT_SIZE = @as(c_int, 33);
pub inline fn clamp(val: anytype, min: anytype, max: anytype) @TypeOf(if (__helpers.cast(bool, val > max)) max else if (__helpers.cast(bool, val < min)) min else val) {
    @setEvalBranchQuota(100000);
    _ = &val;
    _ = &min;
    _ = &max;
    return if (__helpers.cast(bool, val > max)) max else if (__helpers.cast(bool, val < min)) min else val;
}
