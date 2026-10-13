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
pub extern fn SDL_roundf_REAL(x: f32) f32;
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
pub const SDL_JOYSTICK_TYPE_GAMEPAD: c_int = 1;
pub const SDL_JOYSTICK_TYPE_WHEEL: c_int = 2;
pub const SDL_JOYSTICK_TYPE_ARCADE_STICK: c_int = 3;
pub const SDL_JOYSTICK_TYPE_FLIGHT_STICK: c_int = 4;
pub const SDL_JOYSTICK_TYPE_DANCE_PAD: c_int = 5;
pub const SDL_JOYSTICK_TYPE_GUITAR: c_int = 6;
pub const SDL_JOYSTICK_TYPE_DRUM_KIT: c_int = 7;
pub const SDL_JOYSTICK_TYPE_ARCADE_PAD: c_int = 8;
pub const enum_SDL_JoystickType = c_uint;
pub const SDL_JoystickType = enum_SDL_JoystickType;
pub extern fn SDL_GetJoystickFromID_REAL(instance_id: SDL_JoystickID) [*c]SDL_Joystick;
pub extern fn SDL_GetJoystickPlayerIndex_REAL(joystick: [*c]SDL_Joystick) c_int;
pub const SDL_GAMEPAD_TYPE_XBOX360: c_int = 2;
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
pub extern fn SDL_GetTicksNS_REAL() Uint64;
pub extern fn SDL_GetStringBoolean(value: [*c]const u8, default_value: bool) bool;
pub extern fn SDL_AssertJoysticksLocked() void;
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
pub extern fn HIDAPI_SetDeviceName(device: [*c]SDL_HIDAPI_Device, name: [*c]const u8) void;
pub extern fn HIDAPI_JoystickConnected(device: [*c]SDL_HIDAPI_Device, pJoystickID: [*c]SDL_JoystickID) bool;
pub extern fn HIDAPI_JoystickDisconnected(device: [*c]SDL_HIDAPI_Device, joystickID: SDL_JoystickID) void;
pub extern fn HIDAPI_UpdateDeviceProperties(device: [*c]SDL_HIDAPI_Device) void;
pub extern fn SDL_HIDAPI_SendRumble(device: [*c]SDL_HIDAPI_Device, data: [*c]const Uint8, size: c_int) c_int;
const struct_unnamed_20 = extern struct {
    wButtons: u16 = 0,
    bLeftTrigger: u8 = 0,
    bRightTrigger: u8 = 0,
    sThumbLX: i16 = 0,
    sThumbLY: i16 = 0,
    sThumbRX: i16 = 0,
    sThumbRY: i16 = 0,
};
const struct_unnamed_21 = extern struct {
    wLeftMotorSpeed: u16 = 0,
    wRightMotorSpeed: u16 = 0,
};
pub const SDL_xinput_capabilities = extern struct {
    type: u8 = 0,
    subType: u8 = 0,
    flags: u16 = 0,
    gamepad: struct_unnamed_20 = @import("std").mem.zeroes(struct_unnamed_20),
    vibration: struct_unnamed_21 = @import("std").mem.zeroes(struct_unnamed_21),
};
pub const SDL_DriverXbox360W_Context = extern struct {
    device: [*c]SDL_HIDAPI_Device = null,
    connected: bool = false,
    player_index: c_int = 0,
    player_lights: bool = false,
    capabilities: SDL_xinput_capabilities = @import("std").mem.zeroes(SDL_xinput_capabilities),
    last_state: [64]Uint8 = @import("std").mem.zeroes([64]Uint8),
};
pub fn HIDAPI_DriverXbox360W_RegisterHints(callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = SDL_AddHintCallback_REAL("SDL_JOYSTICK_HIDAPI_XBOX", callback, userdata);
    _ = SDL_AddHintCallback_REAL("SDL_JOYSTICK_HIDAPI_XBOX_360", callback, userdata);
    _ = SDL_AddHintCallback_REAL("SDL_JOYSTICK_HIDAPI_XBOX_360_WIRELESS", callback, userdata);
}
pub fn HIDAPI_DriverXbox360W_UnregisterHints(callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_RemoveHintCallback_REAL("SDL_JOYSTICK_HIDAPI_XBOX", callback, userdata);
    SDL_RemoveHintCallback_REAL("SDL_JOYSTICK_HIDAPI_XBOX_360", callback, userdata);
    SDL_RemoveHintCallback_REAL("SDL_JOYSTICK_HIDAPI_XBOX_360_WIRELESS", callback, userdata);
}
pub fn HIDAPI_DriverXbox360W_IsEnabled() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI_XBOX_360_WIRELESS", SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI_XBOX_360", SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI_XBOX", SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI", @"true" != 0))));
}
pub fn HIDAPI_DriverXbox360W_IsSupportedDevice(_: [*c]SDL_HIDAPI_Device, _: [*c]const u8, arg_type: SDL_GamepadType, vendor_id: Uint16, product_id: Uint16, _: Uint16, _: c_int, _: c_int, _: c_int, interface_protocol: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    const XB360W_IFACE_PROTOCOL: c_int = 129;
    _ = &XB360W_IFACE_PROTOCOL;
    if ((@as(c_int, vendor_id) == USB_VENDOR_MICROSOFT) and (@as(c_int, product_id) == USB_PRODUCT_XBOX360_BIGBUTTON_RECEIVER)) {
        return @"false" != 0;
    }
    if ((((@as(c_int, vendor_id) == USB_VENDOR_MICROSOFT) and (((@as(c_int, product_id) == USB_PRODUCT_XBOX360_WIRELESS_RECEIVER_THIRDPARTY2) or (@as(c_int, product_id) == USB_PRODUCT_XBOX360_WIRELESS_RECEIVER_THIRDPARTY1)) or (@as(c_int, product_id) == USB_PRODUCT_XBOX360_WIRELESS_RECEIVER))) and (interface_protocol == @as(c_int, 0))) or ((@"type" == @as(SDL_GamepadType, SDL_GAMEPAD_TYPE_XBOX360)) and (interface_protocol == XB360W_IFACE_PROTOCOL))) {
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub fn SetSlotLED(dev: ?*SDL_hid_device, slot: Uint8, on: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const blink: bool = @"false" != 0;
    _ = &blink;
    var mode: Uint8 = @bitCast(@as(i8, @truncate(if (on) (if (blink) @as(c_int, 2) else @as(c_int, 6)) + @as(c_int, slot) else @as(c_int, 0))));
    _ = &mode;
    var led_packet: [12]Uint8 = [12]Uint8{
        0,
        0,
        8,
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
    _ = &led_packet;
    led_packet[@as(c_int, 3)] = @bitCast(@as(i8, @truncate(@as(c_int, 64) + __helpers.signedRemainder(@as(c_int, mode), @as(c_int, 14)))));
    if (@as(c_ulong, @bitCast(@as(c_long, SDL_hid_write_REAL(dev, @ptrCast(@alignCast(&led_packet)), @sizeOf(@TypeOf(led_packet)))))) != @sizeOf(@TypeOf(led_packet))) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn UpdateSlotLED(ctx: [*c]SDL_DriverXbox360W_Context) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (ctx.*.player_lights and (ctx.*.player_index >= @as(c_int, 0))) {
        _ = SetSlotLED(ctx.*.device.*.dev, @bitCast(@as(i8, @truncate(__helpers.signedRemainder(ctx.*.player_index, @as(c_int, 4))))), @"true" != 0);
    } else {
        _ = SetSlotLED(ctx.*.device.*.dev, 0, @"false" != 0);
    }
}
pub fn SDL_PlayerLEDHintChanged(userdata: ?*anyopaque, _: [*c]const u8, _: [*c]const u8, hint: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverXbox360W_Context = @ptrCast(@alignCast(userdata));
    _ = &ctx;
    var player_lights: bool = SDL_GetStringBoolean(hint, @"true" != 0);
    _ = &player_lights;
    if (@as(c_int, @intFromBool(player_lights)) != @as(c_int, @intFromBool(ctx.*.player_lights))) {
        ctx.*.player_lights = player_lights;
        UpdateSlotLED(ctx);
        HIDAPI_UpdateDeviceProperties(ctx.*.device);
    }
}
pub fn UpdatePowerLevel(joystick: [*c]SDL_Joystick, level: Uint8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var percent: c_int = @intFromFloat(SDL_roundf_REAL((@as(f32, @floatFromInt(@as(c_int, level))) / @as(f32, 255.0)) * @as(f32, 100.0)));
    _ = &percent;
    SDL_SendJoystickPowerInfo(joystick, SDL_POWERSTATE_ON_BATTERY, percent);
}
pub fn HIDAPI_DriverXbox360W_InitDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverXbox360W_Context = undefined;
    _ = &ctx;
    const init_packet: [12]Uint8 = [12]Uint8{
        8,
        0,
        15,
        192,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
    };
    _ = &init_packet;
    HIDAPI_SetDeviceName(device, "Xbox 360 Wireless Controller");
    ctx = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(ctx.*)))));
    if (!(ctx != null)) {
        return @"false" != 0;
    }
    ctx.*.device = device;
    device.*.context = @ptrCast(@alignCast(ctx));
    if (@as(c_ulong, @bitCast(@as(c_long, SDL_hid_write_REAL(device.*.dev, @ptrCast(@alignCast(&init_packet)), @sizeOf(@TypeOf(init_packet)))))) != @sizeOf(@TypeOf(init_packet))) {
        _ = SDL_SetError_REAL("Couldn't write init packet");
        return @"false" != 0;
    }
    device.*.type = SDL_GAMEPAD_TYPE_XBOX360;
    return @"true" != 0;
}
pub fn HIDAPI_DriverXbox360W_GetDevicePlayerIndex(_: [*c]SDL_HIDAPI_Device, _: SDL_JoystickID) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return -@as(c_int, 1);
}
pub fn HIDAPI_DriverXbox360W_SetDevicePlayerIndex(device: [*c]SDL_HIDAPI_Device, _: SDL_JoystickID, player_index: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverXbox360W_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    if (!(ctx != null)) {
        return;
    }
    ctx.*.player_index = player_index;
    UpdateSlotLED(ctx);
}
pub fn HIDAPI_DriverXbox360W_OpenJoystick(device: [*c]SDL_HIDAPI_Device, joystick: [*c]SDL_Joystick) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverXbox360W_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    SDL_AssertJoysticksLocked();
    _ = memset(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.last_state))))), 0, @sizeOf(@TypeOf(ctx.*.last_state)));
    ctx.*.player_index = SDL_GetJoystickPlayerIndex_REAL(joystick);
    ctx.*.player_lights = SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI_XBOX_360_PLAYER_LED", @"true" != 0);
    UpdateSlotLED(ctx);
    _ = SDL_AddHintCallback_REAL("SDL_JOYSTICK_HIDAPI_XBOX_360_PLAYER_LED", SDL_PlayerLEDHintChanged, @ptrCast(@alignCast(ctx)));
    joystick.*.nbuttons = 11;
    joystick.*.naxes = SDL_GAMEPAD_AXIS_COUNT;
    joystick.*.nhats = 1;
    joystick.*.connection_state = SDL_JOYSTICK_CONNECTION_WIRELESS;
    ctx.*.capabilities.type = 1;
    ctx.*.capabilities.flags = FLAG_WIRELESS;
    ctx.*.capabilities.subType = SDL_JOYSTICK_TYPE_GAMEPAD;
    ctx.*.capabilities.gamepad.wButtons = 65535;
    ctx.*.capabilities.gamepad.bLeftTrigger = 255;
    ctx.*.capabilities.gamepad.bRightTrigger = 255;
    ctx.*.capabilities.gamepad.sThumbLX = @truncate(@as(c_int, 65472));
    ctx.*.capabilities.gamepad.sThumbLY = @truncate(@as(c_int, 65472));
    ctx.*.capabilities.gamepad.sThumbRX = @truncate(@as(c_int, 65472));
    ctx.*.capabilities.gamepad.sThumbRY = @truncate(@as(c_int, 65472));
    ctx.*.capabilities.vibration.wLeftMotorSpeed = 65535;
    ctx.*.capabilities.vibration.wRightMotorSpeed = 65535;
    return @"true" != 0;
}
pub fn HIDAPI_DriverXbox360W_RumbleJoystick(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, low_frequency_rumble: Uint16, high_frequency_rumble: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var rumble_packet: [12]Uint8 = [12]Uint8{
        0,
        1,
        15,
        192,
        0,
        0,
        0,
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
    return @"true" != 0;
}
pub fn HIDAPI_DriverXbox360W_RumbleJoystickTriggers(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: Uint16, _: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverXbox360W_GetJoystickCapabilities(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverXbox360W_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    var result: Uint32 = SDL_JOYSTICK_CAP_RUMBLE;
    _ = &result;
    if (ctx.*.player_lights) {
        result |= SDL_JOYSTICK_CAP_PLAYER_LED;
    }
    return result;
}
pub fn HIDAPI_DriverXbox360W_SetJoystickLED(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: Uint8, _: Uint8, _: Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverXbox360W_SendJoystickEffect(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: ?*const anyopaque, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverXbox360W_SetJoystickSensorsEnabled(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverXbox360W_HandleStatePacket(joystick: [*c]SDL_Joystick, _: ?*SDL_hid_device, ctx: [*c]SDL_DriverXbox360W_Context, data: [*c]Uint8, size: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var axis: Sint16 = undefined;
    _ = &axis;
    const invert_y_axes: bool = @"true" != 0;
    _ = &invert_y_axes;
    var timestamp: Uint64 = SDL_GetTicksNS_REAL();
    _ = &timestamp;
    if (@as(c_int, ctx.*.last_state[@as(c_int, 2)]) != @as(c_int, data[@as(c_int, 2)])) {
        var hat: Uint8 = 0;
        _ = &hat;
        if ((@as(c_int, data[@as(c_int, 2)]) & @as(c_int, 1)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_UP);
            }
        }
        if ((@as(c_int, data[@as(c_int, 2)]) & @as(c_int, 2)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_DOWN);
            }
        }
        if ((@as(c_int, data[@as(c_int, 2)]) & @as(c_int, 4)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_LEFT);
            }
        }
        if ((@as(c_int, data[@as(c_int, 2)]) & @as(c_int, 8)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_RIGHT);
            }
        }
        SDL_SendJoystickHat(timestamp, joystick, 0, hat);
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_START, (@as(c_int, data[@as(c_int, 2)]) & @as(c_int, 16)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_BACK, (@as(c_int, data[@as(c_int, 2)]) & @as(c_int, 32)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_STICK, (@as(c_int, data[@as(c_int, 2)]) & @as(c_int, 64)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_STICK, (@as(c_int, data[@as(c_int, 2)]) & @as(c_int, 128)) != @as(c_int, 0));
    }
    if (@as(c_int, ctx.*.last_state[@as(c_int, 3)]) != @as(c_int, data[@as(c_int, 3)])) {
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_SHOULDER, (@as(c_int, data[@as(c_int, 3)]) & @as(c_int, 1)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER, (@as(c_int, data[@as(c_int, 3)]) & @as(c_int, 2)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_GUIDE, (@as(c_int, data[@as(c_int, 3)]) & @as(c_int, 4)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SOUTH, (@as(c_int, data[@as(c_int, 3)]) & @as(c_int, 16)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_EAST, (@as(c_int, data[@as(c_int, 3)]) & @as(c_int, 32)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_WEST, (@as(c_int, data[@as(c_int, 3)]) & @as(c_int, 64)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_NORTH, (@as(c_int, data[@as(c_int, 3)]) & @as(c_int, 128)) != @as(c_int, 0));
    }
    axis = @truncate((@as(c_int, data[@as(c_int, 4)]) * @as(c_int, 257)) - @as(c_int, 32768));
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFT_TRIGGER, axis);
    axis = @truncate((@as(c_int, data[@as(c_int, 5)]) * @as(c_int, 257)) - @as(c_int, 32768));
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHT_TRIGGER, axis);
    axis = @as([*c]Sint16, @ptrCast(@alignCast(&data[@as(c_int, 6)]))).*;
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, axis);
    axis = @as([*c]Sint16, @ptrCast(@alignCast(&data[@as(c_int, 8)]))).*;
    if (invert_y_axes) {
        axis = @truncate(~@as(c_int, axis));
    }
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, axis);
    axis = @as([*c]Sint16, @ptrCast(@alignCast(&data[@as(c_int, 10)]))).*;
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, axis);
    axis = @as([*c]Sint16, @ptrCast(@alignCast(&data[@as(c_int, 12)]))).*;
    if (invert_y_axes) {
        axis = @truncate(~@as(c_int, axis));
    }
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, axis);
    _ = memcpy(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.last_state))))), @ptrCast(@alignCast(data)), if (@as(c_ulong, @bitCast(@as(c_long, size))) < @sizeOf(@TypeOf(ctx.*.last_state))) @as(c_ulong, @bitCast(@as(c_long, size))) else @sizeOf(@TypeOf(ctx.*.last_state)));
}
pub fn HIDAPI_DriverXbox360W_UpdateDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverXbox360W_Context = undefined;
    _ = &ctx;
    var joystick: [*c]SDL_Joystick = undefined;
    _ = &joystick;
    var data: [64]Uint8 = undefined;
    _ = &data;
    var size: c_int = undefined;
    _ = &size;
    var connected: bool = undefined;
    _ = &connected;
    var joystickID: SDL_JoystickID = undefined;
    _ = &joystickID;
    var capabilities_packet: [12]Uint8 = undefined;
    _ = &capabilities_packet;
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
                if ((size == @as(c_int, 2)) and (@as(c_int, data[@as(c_int, 0)]) == @as(c_int, 8))) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            6 => {
                if ((size < @as(c_int, 0)) and (device.*.num_joysticks > @as(c_int, 0))) {
                    sdl_pc = 57;
                    continue;
                } else {
                    sdl_pc = 58;
                    continue;
                }
            },
            7 => {
                connected = (if ((@as(c_int, data[@as(c_int, 1)]) & @as(c_int, 128)) != 0) @"true" else @"false") != 0;
                if (@as(c_int, @intFromBool(connected)) != @as(c_int, @intFromBool(ctx.*.connected))) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            8 => {
                if (((((size == @as(c_int, 29)) and (@as(c_int, data[@as(c_int, 0)]) == @as(c_int, 0))) and (@as(c_int, data[@as(c_int, 1)]) == @as(c_int, 15))) and (@as(c_int, data[@as(c_int, 2)]) == @as(c_int, 0))) and (@as(c_int, data[@as(c_int, 3)]) == @as(c_int, 240))) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
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
                ctx.*.connected = connected;
                if (connected) {
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
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            13 => {
                _ = HIDAPI_JoystickConnected(device, &joystickID);
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                if (device.*.num_joysticks > @as(c_int, 0)) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
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
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            19 => {
                if (joystick != null) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            20 => {
                if (((((size == @as(c_int, 29)) and (@as(c_int, data[@as(c_int, 0)]) == @as(c_int, 0))) and (@as(c_int, data[@as(c_int, 1)]) == @as(c_int, 0))) and (@as(c_int, data[@as(c_int, 2)]) == @as(c_int, 0))) and (@as(c_int, data[@as(c_int, 3)]) == @as(c_int, 19))) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 43;
                    continue;
                }
            },
            21 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            22 => {
                UpdatePowerLevel(joystick, data[@as(c_int, 17)]);
                {
                    sdl_pc = 24;
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
                ctx.*.capabilities.type = 1;
                ctx.*.capabilities.subType = @bitCast(@as(i8, @truncate(@as(c_int, data[@as(c_int, 25)]) & @as(c_int, 127))));
                if ((@as(c_int, data[@as(c_int, 25)]) & @as(c_int, 128)) != @as(c_int, 0)) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            25 => {
                {
                    const ref = &ctx.*.capabilities.flags;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) | FLAG_FORCE_FEEDBACK)));
                }
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
                switch (@as(c_int, data[@as(c_int, 25)]) & @as(c_int, 127)) {
                    @as(c_int, 1) => {
                        sdl_pc = 29;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 30;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 31;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 32;
                        continue;
                    },
                    @as(c_int, 5) => {
                        sdl_pc = 33;
                        continue;
                    },
                    @as(c_int, 6) => {
                        sdl_pc = 34;
                        continue;
                    },
                    @as(c_int, 7) => {
                        sdl_pc = 35;
                        continue;
                    },
                    @as(c_int, 11) => {
                        sdl_pc = 36;
                        continue;
                    },
                    @as(c_int, 8) => {
                        sdl_pc = 37;
                        continue;
                    },
                    @as(c_int, 19) => {
                        sdl_pc = 38;
                        continue;
                    },
                    else => {
                        sdl_pc = 28;
                        continue;
                    },
                }
            },
            28 => {
                device.*.guid.data[@as(c_int, 15)] = ctx.*.capabilities.subType;
                capabilities_packet = [12]Uint8{
                    0,
                    0,
                    2,
                    128,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                };
                if (@as(c_ulong, @bitCast(@as(c_long, SDL_hid_write_REAL(device.*.dev, @ptrCast(@alignCast(&capabilities_packet)), @sizeOf(@TypeOf(capabilities_packet)))))) != @sizeOf(@TypeOf(capabilities_packet))) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 40;
                    continue;
                }
            },
            29 => {
                device.*.joystick_type = SDL_JOYSTICK_TYPE_GAMEPAD;
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            30 => {
                device.*.joystick_type = SDL_JOYSTICK_TYPE_WHEEL;
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            31 => {
                device.*.joystick_type = SDL_JOYSTICK_TYPE_ARCADE_STICK;
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            32 => {
                device.*.joystick_type = SDL_JOYSTICK_TYPE_FLIGHT_STICK;
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            33 => {
                device.*.joystick_type = SDL_JOYSTICK_TYPE_DANCE_PAD;
                {
                    sdl_pc = 28;
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
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            36 => {
                device.*.joystick_type = SDL_JOYSTICK_TYPE_GUITAR;
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            37 => {
                device.*.joystick_type = SDL_JOYSTICK_TYPE_DRUM_KIT;
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            38 => {
                device.*.joystick_type = SDL_JOYSTICK_TYPE_ARCADE_PAD;
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            39 => {
                _ = SDL_SetError_REAL("Couldn't write capabilities_packet packet");
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            40 => {
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            41 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            42 => {
                if (joystick != null) {
                    sdl_pc = 45;
                    continue;
                } else {
                    sdl_pc = 46;
                    continue;
                }
            },
            43 => {
                if (((@as(c_int, data[@as(c_int, 0)]) == @as(c_int, 0)) and (@as(c_int, data[@as(c_int, 1)]) == @as(c_int, 5))) and (@as(c_int, data[@as(c_int, 5)]) == @as(c_int, 18))) {
                    sdl_pc = 48;
                    continue;
                } else {
                    sdl_pc = 49;
                    continue;
                }
            },
            44 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            45 => {
                UpdatePowerLevel(joystick, data[@as(c_int, 4)]);
                {
                    sdl_pc = 47;
                    continue;
                }
            },
            46 => {
                {
                    sdl_pc = 47;
                    continue;
                }
            },
            47 => {
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            48 => {
                ctx.*.capabilities.gamepad.wButtons = @bitCast(@as(c_short, @as(Sint16, @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 6)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 7)])) << @intCast(@as(c_int, 8)))))));
                ctx.*.capabilities.gamepad.bLeftTrigger = data[@as(c_int, 8)];
                ctx.*.capabilities.gamepad.bRightTrigger = data[@as(c_int, 9)];
                ctx.*.capabilities.gamepad.sThumbLX = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 10)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 11)])) << @intCast(@as(c_int, 8))));
                ctx.*.capabilities.gamepad.sThumbLY = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 12)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 13)])) << @intCast(@as(c_int, 8))));
                ctx.*.capabilities.gamepad.sThumbRX = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 14)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 15)])) << @intCast(@as(c_int, 8))));
                ctx.*.capabilities.gamepad.sThumbRY = @truncate(@as(c_int, @as(Uint16, data[@as(c_int, 16)])) | (@as(c_int, @as(Uint16, data[@as(c_int, 17)])) << @intCast(@as(c_int, 8))));
                {
                    const ref = &ctx.*.capabilities.flags;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) | @as(c_int, data[@as(c_int, 20)]))));
                }
                ctx.*.capabilities.vibration.wLeftMotorSpeed = @bitCast(@as(c_short, @truncate(@as(c_int, data[@as(c_int, 18)]) << @intCast(@as(c_int, 8)))));
                ctx.*.capabilities.vibration.wRightMotorSpeed = @bitCast(@as(c_short, @truncate(@as(c_int, data[@as(c_int, 19)]) << @intCast(@as(c_int, 8)))));
                {
                    sdl_pc = 50;
                    continue;
                }
            },
            49 => {
                if (((size == @as(c_int, 29)) and (@as(c_int, data[@as(c_int, 0)]) == @as(c_int, 0))) and ((@as(c_int, data[@as(c_int, 1)]) & @as(c_int, 1)) == @as(c_int, 1))) {
                    sdl_pc = 51;
                    continue;
                } else {
                    sdl_pc = 52;
                    continue;
                }
            },
            50 => {
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            51 => {
                if (joystick != null) {
                    sdl_pc = 54;
                    continue;
                } else {
                    sdl_pc = 55;
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
                {
                    sdl_pc = 50;
                    continue;
                }
            },
            54 => {
                HIDAPI_DriverXbox360W_HandleStatePacket(joystick, device.*.dev, ctx, @as([*c]Uint8, @ptrCast(@alignCast(&data))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4))))), size - @as(c_int, 4));
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            55 => {
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            56 => {
                {
                    sdl_pc = 53;
                    continue;
                }
            },
            57 => {
                HIDAPI_JoystickDisconnected(device, device.*.joysticks[@as(c_int, 0)]);
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            58 => {
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            59 => {
                return size >= @as(c_int, 0);
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverXbox360W_CloseJoystick(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverXbox360W_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    SDL_RemoveHintCallback_REAL("SDL_JOYSTICK_HIDAPI_XBOX_360_PLAYER_LED", SDL_PlayerLEDHintChanged, @ptrCast(@alignCast(ctx)));
}
pub fn HIDAPI_DriverXbox360W_FreeDevice(_: [*c]SDL_HIDAPI_Device) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub export var SDL_HIDAPI_DriverXbox360W: SDL_HIDAPI_DeviceDriver = SDL_HIDAPI_DeviceDriver{
    .name = "SDL_JOYSTICK_HIDAPI_XBOX_360_WIRELESS",
    .enabled = @"true" != 0,
    .RegisterHints = HIDAPI_DriverXbox360W_RegisterHints,
    .UnregisterHints = HIDAPI_DriverXbox360W_UnregisterHints,
    .IsEnabled = HIDAPI_DriverXbox360W_IsEnabled,
    .IsSupportedDevice = HIDAPI_DriverXbox360W_IsSupportedDevice,
    .InitDevice = HIDAPI_DriverXbox360W_InitDevice,
    .GetDevicePlayerIndex = HIDAPI_DriverXbox360W_GetDevicePlayerIndex,
    .SetDevicePlayerIndex = HIDAPI_DriverXbox360W_SetDevicePlayerIndex,
    .UpdateDevice = HIDAPI_DriverXbox360W_UpdateDevice,
    .OpenJoystick = HIDAPI_DriverXbox360W_OpenJoystick,
    .RumbleJoystick = HIDAPI_DriverXbox360W_RumbleJoystick,
    .RumbleJoystickTriggers = HIDAPI_DriverXbox360W_RumbleJoystickTriggers,
    .GetJoystickCapabilities = HIDAPI_DriverXbox360W_GetJoystickCapabilities,
    .SetJoystickLED = HIDAPI_DriverXbox360W_SetJoystickLED,
    .SendJoystickEffect = HIDAPI_DriverXbox360W_SendJoystickEffect,
    .SetJoystickSensorsEnabled = HIDAPI_DriverXbox360W_SetJoystickSensorsEnabled,
    .CloseJoystick = HIDAPI_DriverXbox360W_CloseJoystick,
    .FreeDevice = HIDAPI_DriverXbox360W_FreeDevice,
};

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_HAT_UP = @as(c_uint, 0x01);
pub const SDL_HAT_RIGHT = @as(c_uint, 0x02);
pub const SDL_HAT_DOWN = @as(c_uint, 0x04);
pub const SDL_HAT_LEFT = @as(c_uint, 0x08);
pub const USB_VENDOR_MICROSOFT = @as(c_int, 0x045e);
pub const USB_PRODUCT_XBOX360_WIRELESS_RECEIVER = @as(c_int, 0x0719);
pub const USB_PRODUCT_XBOX360_WIRELESS_RECEIVER_THIRDPARTY1 = @as(c_int, 0x02a9);
pub const USB_PRODUCT_XBOX360_WIRELESS_RECEIVER_THIRDPARTY2 = @as(c_int, 0x0291);
pub const USB_PRODUCT_XBOX360_BIGBUTTON_RECEIVER = @as(c_int, 0x02a0);
pub const SDL_JOYSTICK_CAP_PLAYER_LED = @as(c_int, 0x00000004);
pub const SDL_JOYSTICK_CAP_RUMBLE = @as(c_int, 0x00000010);
pub const FLAG_FORCE_FEEDBACK = @as(c_int, 0x01);
pub const FLAG_WIRELESS = @as(c_int, 0x02);
