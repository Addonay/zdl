// /*
//   Simple DirectMedia Layer
//   Copyright (C) 2025 Mitchell Cairns <mitch.cairns@handheldlegend.com>
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
pub const div_t = extern struct {
    quot: c_int = 0,
    rem: c_int = 0,
};
pub extern fn div(__numer: c_int, __denom: c_int) div_t;
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Sint16 = i16;
pub const Uint16 = u16;
pub const Uint32 = u32;
pub const Uint64 = u64;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
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
pub const SDL_POWERSTATE_NO_BATTERY: c_int = 2;
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
pub const SDL_Joystick = struct_SDL_Joystick;
pub const SDL_JoystickID = Uint32;
pub const enum_SDL_JoystickType = c_uint;
pub const SDL_JoystickType = enum_SDL_JoystickType;
pub const enum_SDL_JoystickConnectionState = c_int;
pub const SDL_JoystickConnectionState = enum_SDL_JoystickConnectionState;
pub extern fn SDL_GetJoystickFromID_REAL(instance_id: SDL_JoystickID) [*c]SDL_Joystick;
pub const SDL_GAMEPAD_TYPE_UNKNOWN: c_int = 0;
pub const SDL_GAMEPAD_TYPE_COUNT: c_int = 13;
pub const enum_SDL_GamepadType = c_uint;
pub const SDL_GamepadType = enum_SDL_GamepadType;
pub const SDL_GAMEPAD_BUTTON_COUNT: c_int = 26;
pub const enum_SDL_GamepadCapSenseType = c_int;
pub const SDL_GamepadCapSenseType = enum_SDL_GamepadCapSenseType;
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
pub extern fn SDL_Delay_REAL(ms: Uint32) void;
pub const SINPUT_ANALOGSTYLE_NONE: c_int = 0;
pub const SINPUT_ANALOGSTYLE_LEFTONLY: c_int = 1;
pub const SINPUT_ANALOGSTYLE_RIGHTONLY: c_int = 2;
pub const SINPUT_ANALOGSTYLE_LEFTRIGHT: c_int = 3;
pub const SINPUT_BUMPERSTYLE_NONE: c_int = 0;
pub const SINPUT_BUMPERSTYLE_ONE: c_int = 1;
pub const SINPUT_BUMPERSTYLE_TWO: c_int = 2;
pub const SINPUT_BUMPERSTYLE_MAX: c_int = 3;
pub const SINPUT_TRIGGERSTYLE_NONE: c_int = 0;
pub const SINPUT_TRIGGERSTYLE_ANALOG: c_int = 1;
pub const SINPUT_TRIGGERSTYLE_DIGITAL: c_int = 2;
pub const SINPUT_TRIGGERSTYLE_DUALSTAGE: c_int = 3;
pub const SINPUT_TRIGGERSTYLE_MAX: c_int = 4;
pub const SINPUT_PADDLESTYLE_NONE: c_int = 0;
pub const SINPUT_PADDLESTYLE_TWO: c_int = 1;
pub const SINPUT_PADDLESTYLE_FOUR: c_int = 2;
pub const SINPUT_PADDLESTYLE_MAX: c_int = 3;
pub const SINPUT_METASTYLE_NONE: c_int = 0;
pub const SINPUT_METASTYLE_BACK: c_int = 1;
pub const SINPUT_METASTYLE_BACKGUIDE: c_int = 2;
pub const SINPUT_METASTYLE_BACKGUIDESHARE: c_int = 3;
pub const SINPUT_METASTYLE_MAX: c_int = 4;
pub const SINPUT_TOUCHSTYLE_NONE: c_int = 0;
pub const SINPUT_TOUCHSTYLE_SINGLE: c_int = 1;
pub const SINPUT_TOUCHSTYLE_DOUBLE: c_int = 2;
pub const SINPUT_TOUCHSTYLE_MAX: c_int = 3;
pub const SINPUT_MISCSTYLE_NONE: c_int = 0;
pub const SINPUT_MISCSTYLE_1: c_int = 1;
pub const SINPUT_MISCSTYLE_2: c_int = 2;
pub const SINPUT_MISCSTYLE_3: c_int = 3;
pub const SINPUT_MISCSTYLE_4: c_int = 4;
pub const SINPUT_MISCSTYLE_MAX: c_int = 5;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_PI_F = @as(f32, 3.141592653589793238462643383279502884);
pub const SDL_STANDARD_GRAVITY = @as(f32, 9.80665);
pub const SDL_HAT_CENTERED = @as(c_uint, 0x00);
pub const SDL_HAT_UP = @as(c_uint, 0x01);
pub const SDL_HAT_RIGHT = @as(c_uint, 0x02);
pub const SDL_HAT_DOWN = @as(c_uint, 0x04);
pub const SDL_HAT_LEFT = @as(c_uint, 0x08);
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
pub const struct_SDL_JoystickCapSenseInfo = extern struct {
    type: SDL_GamepadCapSenseType = @import("std").mem.zeroes(SDL_GamepadCapSenseType),
    down: bool = false,
};
pub const SDL_JoystickCapSenseInfo = struct_SDL_JoystickCapSenseInfo;
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
pub extern fn SDL_AssertJoysticksLocked() void;
pub extern fn SDL_IsJoystickSInputController(vendor_id: Uint16, product_id: Uint16) bool;
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
pub extern fn HIDAPI_JoystickConnected(device: [*c]SDL_HIDAPI_Device, pJoystickID: [*c]SDL_JoystickID) bool;
pub extern fn HIDAPI_JoystickDisconnected(device: [*c]SDL_HIDAPI_Device, joystickID: SDL_JoystickID) void;
pub extern fn SDL_HIDAPI_SendRumble(device: [*c]SDL_HIDAPI_Device, data: [*c]const Uint8, size: c_int) c_int;
const struct_unnamed_22 = extern struct {
    frequency_1: u16 = 0,
    amplitude_1: u16 = 0,
    frequency_2: u16 = 0,
    amplitude_2: u16 = 0,
};
const struct_unnamed_23 = extern struct {
    frequency_1: u16 = 0,
    amplitude_1: u16 = 0,
    frequency_2: u16 = 0,
    amplitude_2: u16 = 0,
};
const struct_unnamed_21 = extern struct {
    left: struct_unnamed_22 = @import("std").mem.zeroes(struct_unnamed_22),
    right: struct_unnamed_23 = @import("std").mem.zeroes(struct_unnamed_23),
};
const struct_unnamed_25 = extern struct {
    amplitude: u8 = 0,
    brake: bool = false,
};
const struct_unnamed_26 = extern struct {
    amplitude: u8 = 0,
    brake: bool = false,
};
const struct_unnamed_24 = extern struct {
    left: struct_unnamed_25 = @import("std").mem.zeroes(struct_unnamed_25),
    right: struct_unnamed_26 = @import("std").mem.zeroes(struct_unnamed_26),
};
const union_unnamed_20 = extern union {
    type_1: struct_unnamed_21,
    type_2: struct_unnamed_24,
};
pub const SINPUT_HAPTIC_S = extern struct {
    type: u8 = 0,
    unnamed_0: union_unnamed_20 = @import("std").mem.zeroes(union_unnamed_20),
};
pub const SDL_DriverSInput_Context = extern struct {
    device: [*c]SDL_HIDAPI_Device = null,
    protocol_version: Uint16 = 0,
    usb_device_version: Uint16 = 0,
    sensors_enabled: bool = false,
    player_idx: Uint8 = 0,
    player_leds_supported: bool = false,
    joystick_rgb_supported: bool = false,
    rumble_supported: bool = false,
    accelerometer_supported: bool = false,
    gyroscope_supported: bool = false,
    left_analog_stick_supported: bool = false,
    right_analog_stick_supported: bool = false,
    left_analog_trigger_supported: bool = false,
    right_analog_trigger_supported: bool = false,
    dpad_supported: bool = false,
    touchpad_supported: bool = false,
    is_handheld: bool = false,
    touchpad_count: Uint8 = 0,
    touchpad_finger_count: Uint8 = 0,
    polling_rate_us: Uint16 = 0,
    sub_product: Uint8 = 0,
    accelRange: Uint16 = 0,
    gyroRange: Uint16 = 0,
    accelScale: f32 = 0,
    gyroScale: f32 = 0,
    last_state: [64]Uint8 = @import("std").mem.zeroes([64]Uint8),
    axes_count: Uint8 = 0,
    buttons_count: Uint8 = 0,
    usage_masks: [4]Uint8 = @import("std").mem.zeroes([4]Uint8),
    last_imu_timestamp_us: Uint32 = 0,
    imu_timestamp_ns: Uint64 = 0,
};
pub fn CalculateGyroScale(dps_range: u16) callconv(.c) f32 {
    @setEvalBranchQuota(100000);
    return (SDL_PI_F / @as(f32, 180.0)) / (@as(f32, 32768.0) / @as(f32, @floatFromInt(dps_range)));
}
pub fn CalculateAccelScale(g_range: u16) callconv(.c) f32 {
    @setEvalBranchQuota(100000);
    return SDL_STANDARD_GRAVITY / (@as(f32, 32768.0) / @as(f32, @floatFromInt(g_range)));
}
pub fn DeviceDynamicEncodingSetup(device: [*c]SDL_HIDAPI_Device) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSInput_Context = undefined;
    _ = &ctx;
    var mask: [4]Uint8 = undefined;
    _ = &mask;
    var left_bumper: bool = undefined;
    _ = &left_bumper;
    var right_bumper: bool = undefined;
    _ = &right_bumper;
    var bumperStyle: c_int = undefined;
    _ = &bumperStyle;
    var digital_triggers: bool = undefined;
    _ = &digital_triggers;
    var analog_triggers: bool = undefined;
    _ = &analog_triggers;
    var t1: bool = undefined;
    _ = &t1;
    var t2: bool = undefined;
    _ = &t2;
    var analogStyle: c_int = undefined;
    _ = &analogStyle;
    var triggerStyle: c_int = undefined;
    _ = &triggerStyle;
    var pg1: bool = undefined;
    _ = &pg1;
    var pg2: bool = undefined;
    _ = &pg2;
    var paddleStyle: c_int = undefined;
    _ = &paddleStyle;
    var back: bool = undefined;
    _ = &back;
    var guide: bool = undefined;
    _ = &guide;
    var share: bool = undefined;
    _ = &share;
    var metaStyle: c_int = undefined;
    _ = &metaStyle;
    var touchStyle: c_int = undefined;
    _ = &touchStyle;
    var miscStyle: c_int = undefined;
    _ = &miscStyle;
    var extra_misc: Uint8 = undefined;
    _ = &extra_misc;
    var version: c_int = undefined;
    _ = &version;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                ctx = @ptrCast(@alignCast(device.*.context));
                mask = [1]Uint8{
                    0,
                } ++ @as([3]Uint8, @splat(0));
                mask[@as(c_int, 0)] = 255;
                ctx.*.dpad_supported = @"true" != 0;
                {
                    const ref = &mask[@as(c_int, 2)];
                    ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | SINPUT_BUTTONMASK_START)));
                }
                left_bumper = (@as(c_int, ctx.*.usage_masks[@as(c_int, 1)]) & SINPUT_BUTTONMASK_LEFT_BUMPER) != @as(c_int, 0);
                right_bumper = (@as(c_int, ctx.*.usage_masks[@as(c_int, 1)]) & SINPUT_BUTTONMASK_RIGHT_BUMPER) != @as(c_int, 0);
                bumperStyle = SINPUT_BUMPERSTYLE_NONE;
                if (left_bumper and right_bumper) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                bumperStyle = SINPUT_BUMPERSTYLE_TWO;
                {
                    const ref = &mask[@as(c_int, 1)];
                    ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | (SINPUT_BUTTONMASK_LEFT_BUMPER | SINPUT_BUTTONMASK_RIGHT_BUMPER))));
                }
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            2 => {
                if (left_bumper or right_bumper) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            3 => {
                digital_triggers = (@as(c_int, ctx.*.usage_masks[@as(c_int, 1)]) & (SINPUT_BUTTONMASK_LEFT_TRIGGER | SINPUT_BUTTONMASK_RIGHT_TRIGGER)) != @as(c_int, 0);
                analog_triggers = ctx.*.left_analog_trigger_supported or ctx.*.right_analog_trigger_supported;
                t1 = (@as(c_int, ctx.*.usage_masks[@as(c_int, 2)]) & SINPUT_BUTTONMASK_TOUCHPAD1) != @as(c_int, 0);
                t2 = (@as(c_int, ctx.*.usage_masks[@as(c_int, 2)]) & SINPUT_BUTTONMASK_TOUCHPAD2) != @as(c_int, 0);
                analogStyle = SINPUT_ANALOGSTYLE_NONE;
                if (ctx.*.left_analog_stick_supported and ctx.*.right_analog_stick_supported) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            4 => {
                bumperStyle = SINPUT_BUMPERSTYLE_ONE;
                if (left_bumper) {
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
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            7 => {
                {
                    const ref = &mask[@as(c_int, 1)];
                    ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | SINPUT_BUTTONMASK_LEFT_BUMPER)));
                }
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                if (right_bumper) {
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
                {
                    const ref = &mask[@as(c_int, 1)];
                    ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | SINPUT_BUTTONMASK_RIGHT_BUMPER)));
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
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            13 => {
                analogStyle = SINPUT_ANALOGSTYLE_LEFTRIGHT;
                {
                    const ref = &mask[@as(c_int, 1)];
                    ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | (SINPUT_BUTTONMASK_LEFT_STICK | SINPUT_BUTTONMASK_RIGHT_STICK))));
                }
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                if (ctx.*.left_analog_stick_supported) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            15 => {
                triggerStyle = SINPUT_TRIGGERSTYLE_NONE;
                if (analog_triggers and digital_triggers) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            16 => {
                analogStyle = SINPUT_ANALOGSTYLE_LEFTONLY;
                {
                    const ref = &mask[@as(c_int, 1)];
                    ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | SINPUT_BUTTONMASK_LEFT_STICK)));
                }
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            17 => {
                if (ctx.*.right_analog_stick_supported) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
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
                analogStyle = SINPUT_ANALOGSTYLE_RIGHTONLY;
                {
                    const ref = &mask[@as(c_int, 1)];
                    ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | SINPUT_BUTTONMASK_RIGHT_STICK)));
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
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            22 => {
                triggerStyle = SINPUT_TRIGGERSTYLE_DUALSTAGE;
                {
                    const ref = &mask[@as(c_int, 1)];
                    ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | (SINPUT_BUTTONMASK_LEFT_TRIGGER | SINPUT_BUTTONMASK_RIGHT_TRIGGER))));
                }
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                if (analog_triggers) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            24 => {
                pg1 = (@as(c_int, ctx.*.usage_masks[@as(c_int, 1)]) & (SINPUT_BUTTONMASK_LEFT_PADDLE1 | SINPUT_BUTTONMASK_RIGHT_PADDLE1)) != @as(c_int, 0);
                pg2 = (@as(c_int, ctx.*.usage_masks[@as(c_int, 2)]) & (SINPUT_BUTTONMASK_LEFT_PADDLE2 | SINPUT_BUTTONMASK_RIGHT_PADDLE2)) != @as(c_int, 0);
                paddleStyle = SINPUT_PADDLESTYLE_NONE;
                if (pg1 and pg2) {
                    sdl_pc = 31;
                    continue;
                } else {
                    sdl_pc = 32;
                    continue;
                }
            },
            25 => {
                triggerStyle = SINPUT_TRIGGERSTYLE_ANALOG;
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            26 => {
                if (digital_triggers) {
                    sdl_pc = 28;
                    continue;
                } else {
                    sdl_pc = 29;
                    continue;
                }
            },
            27 => {
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            28 => {
                triggerStyle = SINPUT_TRIGGERSTYLE_DIGITAL;
                {
                    const ref = &mask[@as(c_int, 1)];
                    ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | (SINPUT_BUTTONMASK_LEFT_TRIGGER | SINPUT_BUTTONMASK_RIGHT_TRIGGER))));
                }
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            29 => {
                {
                    sdl_pc = 30;
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
                paddleStyle = SINPUT_PADDLESTYLE_FOUR;
                {
                    const ref = &mask[@as(c_int, 1)];
                    ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | (SINPUT_BUTTONMASK_LEFT_PADDLE1 | SINPUT_BUTTONMASK_RIGHT_PADDLE1))));
                }
                {
                    const ref = &mask[@as(c_int, 2)];
                    ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | (SINPUT_BUTTONMASK_LEFT_PADDLE2 | SINPUT_BUTTONMASK_RIGHT_PADDLE2))));
                }
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            32 => {
                if (pg1) {
                    sdl_pc = 34;
                    continue;
                } else {
                    sdl_pc = 35;
                    continue;
                }
            },
            33 => {
                back = (@as(c_int, ctx.*.usage_masks[@as(c_int, 2)]) & SINPUT_BUTTONMASK_BACK) != @as(c_int, 0);
                guide = (@as(c_int, ctx.*.usage_masks[@as(c_int, 2)]) & SINPUT_BUTTONMASK_GUIDE) != @as(c_int, 0);
                share = (@as(c_int, ctx.*.usage_masks[@as(c_int, 2)]) & SINPUT_BUTTONMASK_CAPTURE) != @as(c_int, 0);
                metaStyle = SINPUT_METASTYLE_NONE;
                if (share) {
                    sdl_pc = 37;
                    continue;
                } else {
                    sdl_pc = 38;
                    continue;
                }
            },
            34 => {
                paddleStyle = SINPUT_PADDLESTYLE_TWO;
                {
                    const ref = &mask[@as(c_int, 1)];
                    ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | (SINPUT_BUTTONMASK_LEFT_PADDLE1 | SINPUT_BUTTONMASK_RIGHT_PADDLE1))));
                }
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
                    sdl_pc = 33;
                    continue;
                }
            },
            37 => {
                metaStyle = SINPUT_METASTYLE_BACKGUIDESHARE;
                {
                    const ref = &mask[@as(c_int, 2)];
                    ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | ((SINPUT_BUTTONMASK_BACK | SINPUT_BUTTONMASK_GUIDE) | SINPUT_BUTTONMASK_CAPTURE))));
                }
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            38 => {
                if (guide) {
                    sdl_pc = 40;
                    continue;
                } else {
                    sdl_pc = 41;
                    continue;
                }
            },
            39 => {
                touchStyle = SINPUT_TOUCHSTYLE_NONE;
                if (t1 and t2) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 47;
                    continue;
                }
            },
            40 => {
                metaStyle = SINPUT_METASTYLE_BACKGUIDE;
                {
                    const ref = &mask[@as(c_int, 2)];
                    ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | (SINPUT_BUTTONMASK_BACK | SINPUT_BUTTONMASK_GUIDE))));
                }
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            41 => {
                if (back) {
                    sdl_pc = 43;
                    continue;
                } else {
                    sdl_pc = 44;
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
                metaStyle = SINPUT_METASTYLE_BACK;
                {
                    const ref = &mask[@as(c_int, 2)];
                    ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | SINPUT_BUTTONMASK_BACK)));
                }
                {
                    sdl_pc = 45;
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
                touchStyle = SINPUT_TOUCHSTYLE_DOUBLE;
                {
                    const ref = &mask[@as(c_int, 2)];
                    ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | (SINPUT_BUTTONMASK_TOUCHPAD1 | SINPUT_BUTTONMASK_TOUCHPAD2))));
                }
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            47 => {
                if (t1) {
                    sdl_pc = 49;
                    continue;
                } else {
                    sdl_pc = 50;
                    continue;
                }
            },
            48 => {
                miscStyle = SINPUT_MISCSTYLE_NONE;
                extra_misc = @bitCast(@as(i8, @truncate(@as(c_int, ctx.*.usage_masks[@as(c_int, 3)]) & @as(c_int, 15))));
                switch (@as(c_int, extra_misc)) {
                    @as(c_int, 15) => {
                        sdl_pc = 53;
                        continue;
                    },
                    @as(c_int, 7) => {
                        sdl_pc = 54;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 55;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 56;
                        continue;
                    },
                    else => {
                        sdl_pc = 57;
                        continue;
                    },
                }
            },
            49 => {
                touchStyle = SINPUT_TOUCHSTYLE_SINGLE;
                {
                    const ref = &mask[@as(c_int, 2)];
                    ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | SINPUT_BUTTONMASK_TOUCHPAD1)));
                }
                {
                    sdl_pc = 51;
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
                    sdl_pc = 48;
                    continue;
                }
            },
            52 => {
                version = analogStyle;
                version = (version * SINPUT_BUMPERSTYLE_MAX) + bumperStyle;
                version = (version * SINPUT_TRIGGERSTYLE_MAX) + triggerStyle;
                version = (version * SINPUT_PADDLESTYLE_MAX) + paddleStyle;
                version = (version * SINPUT_METASTYLE_MAX) + metaStyle;
                version = (version * SINPUT_TOUCHSTYLE_MAX) + touchStyle;
                version = (version * SINPUT_MISCSTYLE_MAX) + miscStyle;
                ctx.*.usage_masks[@as(c_int, 0)] = mask[@as(c_int, 0)];
                ctx.*.usage_masks[@as(c_int, 1)] = mask[@as(c_int, 1)];
                ctx.*.usage_masks[@as(c_int, 2)] = mask[@as(c_int, 2)];
                ctx.*.usage_masks[@as(c_int, 3)] = mask[@as(c_int, 3)];
                version = if (version < @as(c_int, 0)) @as(c_int, 0) else if (version > @as(c_int, 65535)) @as(c_int, 65535) else version;
                device.*.guid.data[@as(c_int, 12)] = @bitCast(@as(i8, @truncate(version & @as(c_int, 255))));
                device.*.guid.data[@as(c_int, 13)] = @bitCast(@as(i8, @truncate(version >> @intCast(@as(c_int, 8)))));
                {}
            },
            53 => {
                miscStyle = SINPUT_MISCSTYLE_4;
                mask[@as(c_int, 3)] = 15;
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            54 => {
                miscStyle = SINPUT_MISCSTYLE_3;
                mask[@as(c_int, 3)] = 7;
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            55 => {
                miscStyle = SINPUT_MISCSTYLE_2;
                mask[@as(c_int, 3)] = 3;
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            56 => {
                miscStyle = SINPUT_MISCSTYLE_1;
                mask[@as(c_int, 3)] = 1;
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            57 => {
                miscStyle = SINPUT_MISCSTYLE_NONE;
                mask[@as(c_int, 3)] = 0;
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn ProcessSDLFeaturesResponse(device: [*c]SDL_HIDAPI_Device, data: [*c]Uint8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSInput_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    ctx.*.protocol_version = @as(Uint16, @bitCast(@as(c_short, @truncate(@as(c_int, data[@as(c_int, 0)]) | (@as(c_int, data[@as(c_int, 0) + @as(c_int, 1)]) << @intCast(@as(c_int, 8)))))));
    ctx.*.rumble_supported = (@as(c_int, data[@as(c_int, 2)]) & @as(c_int, 1)) != @as(c_int, 0);
    ctx.*.player_leds_supported = (@as(c_int, data[@as(c_int, 2)]) & @as(c_int, 2)) != @as(c_int, 0);
    ctx.*.accelerometer_supported = (@as(c_int, data[@as(c_int, 2)]) & @as(c_int, 4)) != @as(c_int, 0);
    ctx.*.gyroscope_supported = (@as(c_int, data[@as(c_int, 2)]) & @as(c_int, 8)) != @as(c_int, 0);
    ctx.*.left_analog_stick_supported = (@as(c_int, data[@as(c_int, 2)]) & @as(c_int, 16)) != @as(c_int, 0);
    ctx.*.right_analog_stick_supported = (@as(c_int, data[@as(c_int, 2)]) & @as(c_int, 32)) != @as(c_int, 0);
    ctx.*.left_analog_trigger_supported = (@as(c_int, data[@as(c_int, 2)]) & @as(c_int, 64)) != @as(c_int, 0);
    ctx.*.right_analog_trigger_supported = (@as(c_int, data[@as(c_int, 2)]) & @as(c_int, 128)) != @as(c_int, 0);
    ctx.*.touchpad_supported = (@as(c_int, data[@as(c_int, 3)]) & @as(c_int, 1)) != @as(c_int, 0);
    ctx.*.joystick_rgb_supported = (@as(c_int, data[@as(c_int, 3)]) & @as(c_int, 2)) != @as(c_int, 0);
    ctx.*.is_handheld = (@as(c_int, data[@as(c_int, 3)]) & @as(c_int, 4)) != @as(c_int, 0);
    var @"type": SDL_GamepadType = SDL_GAMEPAD_TYPE_UNKNOWN;
    _ = &@"type";
    @"type" = @bitCast(if (@as(c_int, data[@as(c_int, 4)]) < SDL_GAMEPAD_TYPE_UNKNOWN) SDL_GAMEPAD_TYPE_UNKNOWN else if (@as(c_int, data[@as(c_int, 4)]) > SDL_GAMEPAD_TYPE_COUNT) SDL_GAMEPAD_TYPE_COUNT else @as(c_int, data[@as(c_int, 4)]));
    device.*.type = @"type";
    device.*.guid.data[@as(c_int, 15)] = data[@as(c_int, 5)];
    ctx.*.sub_product = @bitCast(@as(i8, @truncate(@as(c_int, data[@as(c_int, 5)]) & @as(c_int, 31))));
    ctx.*.polling_rate_us = @as(Uint16, @bitCast(@as(c_short, @truncate(@as(c_int, data[@as(c_int, 6)]) | (@as(c_int, data[@as(c_int, 6) + @as(c_int, 1)]) << @intCast(@as(c_int, 8)))))));
    ctx.*.accelRange = @as(Uint16, @bitCast(@as(c_short, @truncate(@as(c_int, data[@as(c_int, 8)]) | (@as(c_int, data[@as(c_int, 8) + @as(c_int, 1)]) << @intCast(@as(c_int, 8)))))));
    ctx.*.gyroRange = @as(Uint16, @bitCast(@as(c_short, @truncate(@as(c_int, data[@as(c_int, 10)]) | (@as(c_int, data[@as(c_int, 10) + @as(c_int, 1)]) << @intCast(@as(c_int, 8)))))));
    ctx.*.usage_masks[@as(c_int, 0)] = data[@as(c_int, 12)];
    ctx.*.usage_masks[@as(c_int, 1)] = data[@as(c_int, 13)];
    ctx.*.usage_masks[@as(c_int, 2)] = data[@as(c_int, 14)];
    ctx.*.usage_masks[@as(c_int, 3)] = data[@as(c_int, 15)];
    ctx.*.touchpad_count = data[@as(c_int, 16)];
    ctx.*.touchpad_finger_count = data[@as(c_int, 17)];
    var serial: [18]u8 = undefined;
    _ = &serial;
    _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&serial)), @sizeOf(@TypeOf(serial)), "%.2x-%.2x-%.2x-%.2x-%.2x-%.2x", data[@as(c_int, 18)], data[@as(c_int, 19)], data[@as(c_int, 20)], data[@as(c_int, 21)], data[@as(c_int, 22)], data[@as(c_int, 23)]);
    HIDAPI_SetDeviceSerial(device, @ptrCast(@alignCast(&serial)));
    ctx.*.accelScale = CalculateAccelScale(ctx.*.accelRange);
    ctx.*.gyroScale = CalculateGyroScale(ctx.*.gyroRange);
    var axes: Uint8 = 0;
    _ = &axes;
    if (ctx.*.left_analog_stick_supported) {
        {
            const ref = &axes;
            ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) + @as(c_int, 2))));
        }
    }
    if (ctx.*.right_analog_stick_supported) {
        {
            const ref = &axes;
            ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) + @as(c_int, 2))));
        }
    }
    if (ctx.*.left_analog_trigger_supported or ctx.*.right_analog_trigger_supported) {
        {
            const ref = &axes;
            ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) + @as(c_int, 2))));
        }
    }
    ctx.*.axes_count = axes;
    DeviceDynamicEncodingSetup(device);
    {
        var byte: Uint8 = 0;
        _ = &byte;
        while (@as(c_int, byte) < @as(c_int, 4)) : (byte +%= 1) {
            {
                var bit: Uint8 = 0;
                _ = &bit;
                while (@as(c_int, bit) < @as(c_int, 8)) : (bit +%= 1) {
                    if ((@as(c_int, ctx.*.usage_masks[byte]) & (@as(c_int, 1) << @intCast(@as(c_int, bit)))) != @as(c_int, 0)) {
                        ctx.*.buttons_count +%= 1;
                    }
                }
            }
        }
    }
    const DPAD_MASK: c_int = (((@as(c_int, 1) << @intCast(SINPUT_BUTTON_IDX_DPAD_UP)) | (@as(c_int, 1) << @intCast(SINPUT_BUTTON_IDX_DPAD_DOWN))) | (@as(c_int, 1) << @intCast(SINPUT_BUTTON_IDX_DPAD_LEFT))) | (@as(c_int, 1) << @intCast(SINPUT_BUTTON_IDX_DPAD_RIGHT));
    _ = &DPAD_MASK;
    if ((@as(c_int, ctx.*.usage_masks[@as(c_int, 0)]) & DPAD_MASK) == DPAD_MASK) {
        ctx.*.dpad_supported = @"true" != 0;
        {
            const ref = &ctx.*.usage_masks[@as(c_int, 0)];
            ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) & ~DPAD_MASK)));
        }
        {
            const ref = &ctx.*.buttons_count;
            ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) - @as(c_int, 4))));
        }
    }
}
pub fn RetrieveSDLFeatures(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var written: c_int = 0;
    _ = &written;
    {
        var attempt: c_int = 0;
        _ = &attempt;
        while (attempt < @as(c_int, 8)) : (attempt += 1) {
            const featuresGetCommand: [48]Uint8 = [2]Uint8{
                SINPUT_DEVICE_REPORT_ID_OUTPUT_CMDDAT,
                SINPUT_DEVICE_COMMAND_FEATURES,
            } ++ @as([46]Uint8, @splat(0));
            _ = &featuresGetCommand;
            written = SDL_hid_write_REAL(device.*.dev, @ptrCast(@alignCast(&featuresGetCommand)), @sizeOf(@TypeOf(featuresGetCommand)));
            if (written == SINPUT_DEVICE_REPORT_COMMAND_SIZE) {
                break;
            }
        }
    }
    if (written < SINPUT_DEVICE_REPORT_COMMAND_SIZE) {
        _ = SDL_SetError_REAL("SInput device SDL Features GET command could not write");
        return @"false" != 0;
    }
    var read: c_int = 0;
    _ = &read;
    {
        var i: c_int = 0;
        _ = &i;
        while (i < @as(c_int, 100)) : (i += 1) {
            SDL_Delay_REAL(1);
            var data: [64]Uint8 = undefined;
            _ = &data;
            read = SDL_hid_read_timeout_REAL(device.*.dev, @ptrCast(@alignCast(&data)), @sizeOf(@TypeOf(data)), 0);
            if (read < @as(c_int, 0)) {
                _ = SDL_SetError_REAL("SInput device SDL Features GET command could not read");
                return @"false" != 0;
            }
            if (read == @as(c_int, 0)) {
                continue;
            }
            if (((read == USB_PACKET_LENGTH) and (@as(c_int, data[@as(c_int, 0)]) == SINPUT_DEVICE_REPORT_ID_INPUT_CMDDAT)) and (@as(c_int, data[@as(c_int, 1)]) == SINPUT_DEVICE_COMMAND_FEATURES)) {
                ProcessSDLFeaturesResponse(device, &data[SINPUT_REPORT_IDX_COMMAND_RESPONSE_BULK]);
                return @"true" != 0;
            }
        }
    }
    return @"false" != 0;
}
pub fn HapticsType2Pack(in: [*c]SINPUT_HAPTIC_S, out: [*c]Uint8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    out[@as(c_int, 0)] = 2;
    out[@as(c_int, 1)] = in.*.unnamed_0.type_2.left.amplitude;
    out[@as(c_int, 2)] = @intFromBool(in.*.unnamed_0.type_2.left.brake);
    out[@as(c_int, 3)] = in.*.unnamed_0.type_2.right.amplitude;
    out[@as(c_int, 4)] = @intFromBool(in.*.unnamed_0.type_2.right.brake);
}
pub fn HIDAPI_DriverSInput_RegisterHints(callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = SDL_AddHintCallback_REAL("SDL_JOYSTICK_HIDAPI_SINPUT", callback, userdata);
}
pub fn HIDAPI_DriverSInput_UnregisterHints(callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_RemoveHintCallback_REAL("SDL_JOYSTICK_HIDAPI_SINPUT", callback, userdata);
}
pub fn HIDAPI_DriverSInput_IsEnabled() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI_SINPUT", SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI", @"true" != 0));
}
pub fn HIDAPI_DriverSInput_IsSupportedDevice(_: [*c]SDL_HIDAPI_Device, _: [*c]const u8, arg_type: SDL_GamepadType, vendor_id: Uint16, product_id: Uint16, _: Uint16, _: c_int, _: c_int, _: c_int, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    return SDL_IsJoystickSInputController(vendor_id, product_id);
}
pub fn HIDAPI_DriverSInput_InitDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSInput_Context = undefined;
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
                device.*.context = @ptrCast(@alignCast(ctx));
                if (!RetrieveSDLFeatures(device)) {
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
                ctx.*.usb_device_version = device.*.version;
                switch (@as(c_int, device.*.product_id)) {
                    USB_PRODUCT_HANDHELDLEGEND_GCULTIMATE => {
                        sdl_pc = 8;
                        continue;
                    },
                    USB_PRODUCT_HANDHELDLEGEND_PROGCC => {
                        sdl_pc = 9;
                        continue;
                    },
                    USB_PRODUCT_VOIDGAMING_PS4FIREBIRD => {
                        sdl_pc = 10;
                        continue;
                    },
                    USB_PRODUCT_VOIDGAMING_GENESIS_SINPUT => {
                        sdl_pc = 11;
                        continue;
                    },
                    USB_PRODUCT_BONZIRICHANNEL_FIREBIRD => {
                        sdl_pc = 12;
                        continue;
                    },
                    USB_PRODUCT_HANDHELDLEGEND_SINPUT_GENERIC => {
                        sdl_pc = 13;
                        continue;
                    },
                    else => {
                        sdl_pc = 14;
                        continue;
                    },
                }
            },
            7 => {
                return HIDAPI_JoystickConnected(device, null);
            },
            8 => {
                HIDAPI_SetDeviceName(device, "HHL GC Ultimate");
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            9 => {
                HIDAPI_SetDeviceName(device, "HHL ProGCC");
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            10 => {
                HIDAPI_SetDeviceName(device, "Void Gaming PS4 FireBird");
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            11 => {
                HIDAPI_SetDeviceName(device, "Void Gaming Void GENESIS");
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            12 => {
                HIDAPI_SetDeviceName(device, "Bonziri FireBird");
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
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverSInput_GetDevicePlayerIndex(_: [*c]SDL_HIDAPI_Device, _: SDL_JoystickID) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return -@as(c_int, 1);
}
pub fn HIDAPI_DriverSInput_SetDevicePlayerIndex(device: [*c]SDL_HIDAPI_Device, _: SDL_JoystickID, arg_player_index: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var player_index = arg_player_index;
    _ = &player_index;
    var ctx: [*c]SDL_DriverSInput_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    if (ctx.*.player_leds_supported) {
        player_index = if ((player_index + @as(c_int, 1)) < @as(c_int, 0)) @as(c_int, 0) else if ((player_index + @as(c_int, 1)) > @as(c_int, 255)) @as(c_int, 255) else player_index + @as(c_int, 1);
        var player_num: Uint8 = @bitCast(@as(i8, @truncate(player_index)));
        _ = &player_num;
        ctx.*.player_idx = player_num;
        var playerLedCommand: [48]Uint8 = [3]Uint8{
            SINPUT_DEVICE_REPORT_ID_OUTPUT_CMDDAT,
            SINPUT_DEVICE_COMMAND_PLAYERLED,
            ctx.*.player_idx,
        } ++ @as([45]Uint8, @splat(0));
        _ = &playerLedCommand;
        var playerNumBytesWritten: c_int = SDL_hid_write_REAL(device.*.dev, @ptrCast(@alignCast(&playerLedCommand)), SINPUT_DEVICE_REPORT_COMMAND_SIZE);
        _ = &playerNumBytesWritten;
        if (playerNumBytesWritten < @as(c_int, 0)) {
            _ = SDL_SetError_REAL("SInput device player led command could not write");
        }
    }
}
pub fn HIDAPI_DriverSInput_OpenJoystick(device: [*c]SDL_HIDAPI_Device, joystick: [*c]SDL_Joystick) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSInput_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    SDL_AssertJoysticksLocked();
    joystick.*.nbuttons = ctx.*.buttons_count;
    _ = memset(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.last_state))))), 0, @sizeOf(@TypeOf(ctx.*.last_state)));
    joystick.*.naxes = ctx.*.axes_count;
    if (ctx.*.dpad_supported) {
        joystick.*.nhats = 1;
    }
    if (ctx.*.gyroscope_supported) {
        SDL_PrivateJoystickAddSensor(joystick, SDL_SENSOR_GYRO, @as(f32, 1000000.0) / @as(f32, @floatFromInt(@as(c_int, ctx.*.polling_rate_us))));
    }
    if (ctx.*.accelerometer_supported) {
        SDL_PrivateJoystickAddSensor(joystick, SDL_SENSOR_ACCEL, @as(f32, 1000000.0) / @as(f32, @floatFromInt(@as(c_int, ctx.*.polling_rate_us))));
    }
    if (ctx.*.touchpad_supported) {
        ctx.*.touchpad_count = @bitCast(@as(i8, @truncate(if (@as(c_int, ctx.*.touchpad_count) < @as(c_int, 1)) @as(c_int, 1) else if (@as(c_int, ctx.*.touchpad_count) > SINPUT_MAX_ALLOWED_TOUCHPADS) SINPUT_MAX_ALLOWED_TOUCHPADS else @as(c_int, ctx.*.touchpad_count))));
        if (@as(c_int, ctx.*.touchpad_count) > @as(c_int, 1)) {
            ctx.*.touchpad_finger_count = 1;
        }
        if (@as(c_int, ctx.*.touchpad_count) > @as(c_int, 0)) {
            SDL_PrivateJoystickAddTouchpad(joystick, ctx.*.touchpad_finger_count);
        }
        if (@as(c_int, ctx.*.touchpad_count) > @as(c_int, 1)) {
            SDL_PrivateJoystickAddTouchpad(joystick, ctx.*.touchpad_finger_count);
        }
    }
    return @"true" != 0;
}
pub fn HIDAPI_DriverSInput_RumbleJoystick(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, low_frequency_rumble: Uint16, high_frequency_rumble: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSInput_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    if (ctx.*.rumble_supported) {
        var hapticData: SINPUT_HAPTIC_S = SINPUT_HAPTIC_S{
            .type = 0,
            .unnamed_0 = @import("std").mem.zeroes(union_unnamed_20),
        };
        _ = &hapticData;
        var hapticReport: [48]Uint8 = [2]Uint8{
            SINPUT_DEVICE_REPORT_ID_OUTPUT_CMDDAT,
            SINPUT_DEVICE_COMMAND_HAPTIC,
        } ++ @as([46]Uint8, @splat(0));
        _ = &hapticReport;
        hapticData.unnamed_0.type_2.left.amplitude = @bitCast(@as(i8, @truncate(@as(c_int, low_frequency_rumble) >> @intCast(@as(c_int, 8)))));
        hapticData.unnamed_0.type_2.right.amplitude = @bitCast(@as(i8, @truncate(@as(c_int, high_frequency_rumble) >> @intCast(@as(c_int, 8)))));
        HapticsType2Pack(&hapticData, &hapticReport[@as(c_int, 2)]);
        _ = SDL_HIDAPI_SendRumble(device, @ptrCast(@alignCast(&hapticReport)), SINPUT_DEVICE_REPORT_COMMAND_SIZE);
        return @"true" != 0;
    }
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverSInput_RumbleJoystickTriggers(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: Uint16, _: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverSInput_GetJoystickCapabilities(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSInput_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    var caps: Uint32 = 0;
    _ = &caps;
    if (ctx.*.rumble_supported) {
        caps |= SDL_JOYSTICK_CAP_RUMBLE;
    }
    if (ctx.*.player_leds_supported) {
        caps |= SDL_JOYSTICK_CAP_PLAYER_LED;
    }
    if (ctx.*.joystick_rgb_supported) {
        caps |= SDL_JOYSTICK_CAP_RGB_LED;
    }
    return caps;
}
pub fn HIDAPI_DriverSInput_SetJoystickLED(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, red: Uint8, green: Uint8, blue: Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSInput_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    if (ctx.*.joystick_rgb_supported) {
        var joystickRGBCommand: [48]Uint8 = [5]Uint8{
            SINPUT_DEVICE_REPORT_ID_OUTPUT_CMDDAT,
            SINPUT_DEVICE_COMMAND_JOYSTICKRGB,
            red,
            green,
            blue,
        } ++ @as([43]Uint8, @splat(0));
        _ = &joystickRGBCommand;
        var joystickRGBBytesWritten: c_int = SDL_hid_write_REAL(device.*.dev, @ptrCast(@alignCast(&joystickRGBCommand)), SINPUT_DEVICE_REPORT_COMMAND_SIZE);
        _ = &joystickRGBBytesWritten;
        if (joystickRGBBytesWritten < @as(c_int, 0)) {
            _ = SDL_SetError_REAL("SInput device joystick rgb command could not write");
            return @"false" != 0;
        }
        return @"true" != 0;
    }
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverSInput_SendJoystickEffect(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: ?*const anyopaque, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverSInput_SetJoystickSensorsEnabled(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, enabled: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSInput_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    if (ctx.*.accelerometer_supported or ctx.*.gyroscope_supported) {
        ctx.*.sensors_enabled = enabled;
        return @"true" != 0;
    }
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverSInput_HandleStatePacket(joystick: [*c]SDL_Joystick, ctx: [*c]SDL_DriverSInput_Context, data: [*c]Uint8, size: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var axis: Sint16 = undefined;
    _ = &axis;
    var accel: Sint16 = undefined;
    _ = &accel;
    var gyro: Sint16 = undefined;
    _ = &gyro;
    var timestamp: Uint64 = undefined;
    _ = &timestamp;
    var imu_values: [3]f32 = undefined;
    _ = &imu_values;
    var output_idx: Uint8 = undefined;
    _ = &output_idx;
    var processes: Uint8 = undefined;
    _ = &processes;
    var button_idx: Uint8 = undefined;
    _ = &button_idx;
    var buttons: Uint8 = undefined;
    _ = &buttons;
    var mask: Uint8 = undefined;
    _ = &mask;
    var down: bool = undefined;
    _ = &down;
    var hat: Uint8 = undefined;
    _ = &hat;
    var axis_idx: Uint8 = undefined;
    _ = &axis_idx;
    var state: SDL_PowerState = undefined;
    _ = &state;
    var status: Uint8 = undefined;
    _ = &status;
    var percent: c_int = undefined;
    _ = &percent;
    var imu_timestamp_us: Uint32 = undefined;
    _ = &imu_timestamp_us;
    var imu_time_delta_us: Uint32 = undefined;
    _ = &imu_time_delta_us;
    var touchpad: Uint8 = undefined;
    _ = &touchpad;
    var finger: Uint8 = undefined;
    _ = &finger;
    var touch1X: Sint16 = undefined;
    _ = &touch1X;
    var touch1Y: Sint16 = undefined;
    _ = &touch1Y;
    var touch1P: Uint16 = undefined;
    _ = &touch1P;
    var touch2X: Sint16 = undefined;
    _ = &touch2X;
    var touch2Y: Sint16 = undefined;
    _ = &touch2Y;
    var touch2P: Uint16 = undefined;
    _ = &touch2P;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                axis = 0;
                accel = 0;
                gyro = 0;
                timestamp = SDL_GetTicksNS_REAL();
                imu_values = [1]f32{
                    @floatFromInt(@as(c_int, 0)),
                } ++ @as([2]f32, @splat(0));
                output_idx = 0;
                processes = 0;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            1 => {
                if (@as(c_int, processes) < @as(c_int, 4)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 4;
                    continue;
                }
            },
            2 => {
                button_idx = @bitCast(@as(i8, @truncate(SINPUT_REPORT_IDX_BUTTONS_0 + @as(c_int, processes))));
                buttons = 0;
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            3 => {
                processes +%= 1;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                if (ctx.*.dpad_supported) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            5 => {
                if (@as(c_int, buttons) < @as(c_int, 8)) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            6 => {
                mask = @bitCast(@as(i8, @truncate(@as(c_int, 1) << @intCast(@as(c_int, buttons)))));
                if ((@as(c_int, ctx.*.usage_masks[processes]) & @as(c_int, mask)) != @as(c_int, 0)) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
            },
            7 => {
                buttons +%= 1;
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
                down = (@as(c_int, data[button_idx]) & @as(c_int, mask)) != @as(c_int, 0);
                if ((@as(c_int, output_idx) < SDL_GAMEPAD_BUTTON_COUNT) and (@as(c_int, ctx.*.last_state[button_idx]) != @as(c_int, data[button_idx]))) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 13;
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
                SDL_SendJoystickButton(timestamp, joystick, output_idx, down);
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
                output_idx +%= 1;
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            15 => {
                hat = SDL_HAT_CENTERED;
                if ((@as(c_int, data[SINPUT_REPORT_IDX_BUTTONS_0]) & (@as(c_int, 1) << @intCast(SINPUT_BUTTON_IDX_DPAD_UP))) != 0) {
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
                axis_idx = 0;
                axis = 0;
                if (ctx.*.left_analog_stick_supported) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            18 => {
                {
                    const ref = &hat;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_UP);
                }
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
                if ((@as(c_int, data[SINPUT_REPORT_IDX_BUTTONS_0]) & (@as(c_int, 1) << @intCast(SINPUT_BUTTON_IDX_DPAD_DOWN))) != 0) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            21 => {
                {
                    const ref = &hat;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_DOWN);
                }
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
                if ((@as(c_int, data[SINPUT_REPORT_IDX_BUTTONS_0]) & (@as(c_int, 1) << @intCast(SINPUT_BUTTON_IDX_DPAD_LEFT))) != 0) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            24 => {
                {
                    const ref = &hat;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_LEFT);
                }
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
                if ((@as(c_int, data[SINPUT_REPORT_IDX_BUTTONS_0]) & (@as(c_int, 1) << @intCast(SINPUT_BUTTON_IDX_DPAD_RIGHT))) != 0) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            27 => {
                {
                    const ref = &hat;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_RIGHT);
                }
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
                SDL_SendJoystickHat(timestamp, joystick, 0, hat);
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            30 => {
                axis = @as(Sint16, @truncate(@as(c_int, data[SINPUT_REPORT_IDX_LEFT_X]) | (@as(c_int, data[SINPUT_REPORT_IDX_LEFT_X + @as(c_int, 1)]) << @intCast(@as(c_int, 8)))));
                SDL_SendJoystickAxis(timestamp, joystick, axis_idx, axis);
                axis_idx +%= 1;
                axis = @as(Sint16, @truncate(@as(c_int, data[SINPUT_REPORT_IDX_LEFT_Y]) | (@as(c_int, data[SINPUT_REPORT_IDX_LEFT_Y + @as(c_int, 1)]) << @intCast(@as(c_int, 8)))));
                SDL_SendJoystickAxis(timestamp, joystick, axis_idx, axis);
                axis_idx +%= 1;
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
                axis = 0;
                if (ctx.*.right_analog_stick_supported) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 34;
                    continue;
                }
            },
            33 => {
                axis = @as(Sint16, @truncate(@as(c_int, data[SINPUT_REPORT_IDX_RIGHT_X]) | (@as(c_int, data[SINPUT_REPORT_IDX_RIGHT_X + @as(c_int, 1)]) << @intCast(@as(c_int, 8)))));
                SDL_SendJoystickAxis(timestamp, joystick, axis_idx, axis);
                axis_idx +%= 1;
                axis = @as(Sint16, @truncate(@as(c_int, data[SINPUT_REPORT_IDX_RIGHT_Y]) | (@as(c_int, data[SINPUT_REPORT_IDX_RIGHT_Y + @as(c_int, 1)]) << @intCast(@as(c_int, 8)))));
                SDL_SendJoystickAxis(timestamp, joystick, axis_idx, axis);
                axis_idx +%= 1;
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
                axis = @as(Sint16, @truncate(~@as(c_int, 32767)));
                if (ctx.*.left_analog_trigger_supported) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 37;
                    continue;
                }
            },
            36 => {
                axis = @as(Sint16, @truncate(@as(c_int, data[SINPUT_REPORT_IDX_LEFT_TRIGGER]) | (@as(c_int, data[SINPUT_REPORT_IDX_LEFT_TRIGGER + @as(c_int, 1)]) << @intCast(@as(c_int, 8)))));
                SDL_SendJoystickAxis(timestamp, joystick, axis_idx, axis);
                axis_idx +%= 1;
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            37 => {
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            38 => {
                axis = @as(Sint16, @truncate(~@as(c_int, 32767)));
                if (ctx.*.right_analog_trigger_supported) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 40;
                    continue;
                }
            },
            39 => {
                axis = @as(Sint16, @truncate(@as(c_int, data[SINPUT_REPORT_IDX_RIGHT_TRIGGER]) | (@as(c_int, data[SINPUT_REPORT_IDX_RIGHT_TRIGGER + @as(c_int, 1)]) << @intCast(@as(c_int, 8)))));
                SDL_SendJoystickAxis(timestamp, joystick, axis_idx, axis);
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
                if ((@as(c_int, ctx.*.last_state[SINPUT_REPORT_IDX_PLUG_STATUS]) != @as(c_int, data[SINPUT_REPORT_IDX_PLUG_STATUS])) or (@as(c_int, ctx.*.last_state[SINPUT_REPORT_IDX_CHARGE_LEVEL]) != @as(c_int, data[SINPUT_REPORT_IDX_CHARGE_LEVEL]))) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 43;
                    continue;
                }
            },
            42 => {
                state = SDL_POWERSTATE_UNKNOWN;
                status = data[SINPUT_REPORT_IDX_PLUG_STATUS];
                percent = data[SINPUT_REPORT_IDX_CHARGE_LEVEL];
                percent = if (percent < @as(c_int, 0)) @as(c_int, 0) else if (percent > @as(c_int, 100)) @as(c_int, 100) else percent;
                switch (@as(c_int, status)) {
                    @as(c_int, 1) => {
                        sdl_pc = 46;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 47;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 48;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 49;
                        continue;
                    },
                    else => {
                        sdl_pc = 50;
                        continue;
                    },
                }
            },
            43 => {
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            44 => {
                imu_timestamp_us = @as(Uint32, @bitCast(@as(c_int, ((@as(c_int, data[SINPUT_REPORT_IDX_IMU_TIMESTAMP]) | (@as(c_int, data[SINPUT_REPORT_IDX_IMU_TIMESTAMP + @as(c_int, 1)]) << @intCast(@as(c_int, 8)))) | (@as(c_int, data[SINPUT_REPORT_IDX_IMU_TIMESTAMP + @as(c_int, 2)]) << @intCast(@as(c_int, 16)))) | (@as(c_int, data[SINPUT_REPORT_IDX_IMU_TIMESTAMP + @as(c_int, 3)]) << @intCast(@as(c_int, 24))))));
                imu_time_delta_us = 0;
                if (ctx.*.sensors_enabled) {
                    sdl_pc = 54;
                    continue;
                } else {
                    sdl_pc = 55;
                    continue;
                }
            },
            45 => {
                if (state != SDL_POWERSTATE_UNKNOWN) {
                    sdl_pc = 51;
                    continue;
                } else {
                    sdl_pc = 52;
                    continue;
                }
            },
            46 => {
                state = SDL_POWERSTATE_NO_BATTERY;
                percent = 0;
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            47 => {
                state = SDL_POWERSTATE_CHARGING;
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            48 => {
                state = SDL_POWERSTATE_CHARGED;
                percent = 100;
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            49 => {
                state = SDL_POWERSTATE_ON_BATTERY;
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            50 => {
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            51 => {
                SDL_SendJoystickPowerInfo(joystick, state, percent);
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
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            54 => {
                if (imu_timestamp_us >= ctx.*.last_imu_timestamp_us) {
                    sdl_pc = 57;
                    continue;
                } else {
                    sdl_pc = 58;
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
                if (ctx.*.touchpad_supported and (@as(c_int, ctx.*.touchpad_count) > @as(c_int, 0))) {
                    sdl_pc = 66;
                    continue;
                } else {
                    sdl_pc = 67;
                    continue;
                }
            },
            57 => {
                imu_time_delta_us = imu_timestamp_us -% ctx.*.last_imu_timestamp_us;
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            58 => {
                imu_time_delta_us = ((@as(c_uint, 4294967295) -% ctx.*.last_imu_timestamp_us) +% imu_timestamp_us) +% @as(c_uint, 1);
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            59 => {
                ctx.*.imu_timestamp_ns +%= @as(Uint64, imu_time_delta_us) *% @as(Uint64, 1000);
                ctx.*.last_imu_timestamp_us = imu_timestamp_us;
                if (ctx.*.gyroscope_supported) {
                    sdl_pc = 60;
                    continue;
                } else {
                    sdl_pc = 61;
                    continue;
                }
            },
            60 => {
                gyro = @as(Sint16, @truncate(@as(c_int, data[SINPUT_REPORT_IDX_IMU_GYRO_Y]) | (@as(c_int, data[SINPUT_REPORT_IDX_IMU_GYRO_Y + @as(c_int, 1)]) << @intCast(@as(c_int, 8)))));
                imu_values[@as(c_int, 2)] = -@as(f32, @floatFromInt(gyro)) * ctx.*.gyroScale;
                gyro = @as(Sint16, @truncate(@as(c_int, data[SINPUT_REPORT_IDX_IMU_GYRO_Z]) | (@as(c_int, data[SINPUT_REPORT_IDX_IMU_GYRO_Z + @as(c_int, 1)]) << @intCast(@as(c_int, 8)))));
                imu_values[@as(c_int, 1)] = @as(f32, @floatFromInt(gyro)) * ctx.*.gyroScale;
                gyro = @as(Sint16, @truncate(@as(c_int, data[SINPUT_REPORT_IDX_IMU_GYRO_X]) | (@as(c_int, data[SINPUT_REPORT_IDX_IMU_GYRO_X + @as(c_int, 1)]) << @intCast(@as(c_int, 8)))));
                imu_values[@as(c_int, 0)] = -@as(f32, @floatFromInt(gyro)) * ctx.*.gyroScale;
                SDL_SendJoystickSensor(timestamp, joystick, SDL_SENSOR_GYRO, ctx.*.imu_timestamp_ns, @ptrCast(@alignCast(&imu_values)), 3);
                {
                    sdl_pc = 62;
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
                if (ctx.*.accelerometer_supported) {
                    sdl_pc = 63;
                    continue;
                } else {
                    sdl_pc = 64;
                    continue;
                }
            },
            63 => {
                accel = @as(Sint16, @truncate(@as(c_int, data[SINPUT_REPORT_IDX_IMU_ACCEL_Y]) | (@as(c_int, data[SINPUT_REPORT_IDX_IMU_ACCEL_Y + @as(c_int, 1)]) << @intCast(@as(c_int, 8)))));
                imu_values[@as(c_int, 2)] = -@as(f32, @floatFromInt(accel)) * ctx.*.accelScale;
                accel = @as(Sint16, @truncate(@as(c_int, data[SINPUT_REPORT_IDX_IMU_ACCEL_Z]) | (@as(c_int, data[SINPUT_REPORT_IDX_IMU_ACCEL_Z + @as(c_int, 1)]) << @intCast(@as(c_int, 8)))));
                imu_values[@as(c_int, 1)] = @as(f32, @floatFromInt(accel)) * ctx.*.accelScale;
                accel = @as(Sint16, @truncate(@as(c_int, data[SINPUT_REPORT_IDX_IMU_ACCEL_X]) | (@as(c_int, data[SINPUT_REPORT_IDX_IMU_ACCEL_X + @as(c_int, 1)]) << @intCast(@as(c_int, 8)))));
                imu_values[@as(c_int, 0)] = -@as(f32, @floatFromInt(accel)) * ctx.*.accelScale;
                SDL_SendJoystickSensor(timestamp, joystick, SDL_SENSOR_ACCEL, ctx.*.imu_timestamp_ns, @ptrCast(@alignCast(&imu_values)), 3);
                {
                    sdl_pc = 65;
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
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            66 => {
                touchpad = 0;
                finger = 0;
                touch1X = @as(Sint16, @truncate(@as(c_int, data[SINPUT_REPORT_IDX_TOUCH1_X]) | (@as(c_int, data[SINPUT_REPORT_IDX_TOUCH1_X + @as(c_int, 1)]) << @intCast(@as(c_int, 8)))));
                touch1Y = @as(Sint16, @truncate(@as(c_int, data[SINPUT_REPORT_IDX_TOUCH1_Y]) | (@as(c_int, data[SINPUT_REPORT_IDX_TOUCH1_Y + @as(c_int, 1)]) << @intCast(@as(c_int, 8)))));
                touch1P = @as(Uint16, @bitCast(@as(c_short, @truncate(@as(c_int, data[SINPUT_REPORT_IDX_TOUCH1_P]) | (@as(c_int, data[SINPUT_REPORT_IDX_TOUCH1_P + @as(c_int, 1)]) << @intCast(@as(c_int, 8)))))));
                touch2X = @as(Sint16, @truncate(@as(c_int, data[SINPUT_REPORT_IDX_TOUCH2_X]) | (@as(c_int, data[SINPUT_REPORT_IDX_TOUCH2_X + @as(c_int, 1)]) << @intCast(@as(c_int, 8)))));
                touch2Y = @as(Sint16, @truncate(@as(c_int, data[SINPUT_REPORT_IDX_TOUCH2_Y]) | (@as(c_int, data[SINPUT_REPORT_IDX_TOUCH2_Y + @as(c_int, 1)]) << @intCast(@as(c_int, 8)))));
                touch2P = @as(Uint16, @bitCast(@as(c_short, @truncate(@as(c_int, data[SINPUT_REPORT_IDX_TOUCH2_P]) | (@as(c_int, data[SINPUT_REPORT_IDX_TOUCH2_P + @as(c_int, 1)]) << @intCast(@as(c_int, 8)))))));
                SDL_SendJoystickTouchpad(timestamp, joystick, touchpad, finger, @as(c_int, touch1P) > @as(c_int, 0), (@as(f32, @floatFromInt(@as(c_int, touch1X))) / @as(f32, 65536.0)) + @as(f32, 0.5), (@as(f32, @floatFromInt(@as(c_int, touch1Y))) / @as(f32, 65536.0)) + @as(f32, 0.5), @as(f32, @floatFromInt(@as(c_int, touch1P))) / @as(f32, 32768.0));
                if (@as(c_int, ctx.*.touchpad_count) > @as(c_int, 1)) {
                    sdl_pc = 69;
                    continue;
                } else {
                    sdl_pc = 70;
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
                _ = memcpy(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.last_state))))), @ptrCast(@alignCast(data)), if (@as(c_ulong, @bitCast(@as(c_long, size))) < @sizeOf(@TypeOf(ctx.*.last_state))) @as(c_ulong, @bitCast(@as(c_long, size))) else @sizeOf(@TypeOf(ctx.*.last_state)));
                {}
            },
            69 => {
                touchpad +%= 1;
                {
                    sdl_pc = 71;
                    continue;
                }
            },
            70 => {
                if (@as(c_int, ctx.*.touchpad_finger_count) > @as(c_int, 1)) {
                    sdl_pc = 72;
                    continue;
                } else {
                    sdl_pc = 73;
                    continue;
                }
            },
            71 => {
                if ((@as(c_int, touchpad) > @as(c_int, 0)) or (@as(c_int, finger) > @as(c_int, 0))) {
                    sdl_pc = 75;
                    continue;
                } else {
                    sdl_pc = 76;
                    continue;
                }
            },
            72 => {
                finger +%= 1;
                {
                    sdl_pc = 74;
                    continue;
                }
            },
            73 => {
                {
                    sdl_pc = 74;
                    continue;
                }
            },
            74 => {
                {
                    sdl_pc = 71;
                    continue;
                }
            },
            75 => {
                SDL_SendJoystickTouchpad(timestamp, joystick, touchpad, finger, @as(c_int, touch2P) > @as(c_int, 0), (@as(f32, @floatFromInt(@as(c_int, touch2X))) / @as(f32, 65536.0)) + @as(f32, 0.5), (@as(f32, @floatFromInt(@as(c_int, touch2Y))) / @as(f32, 65536.0)) + @as(f32, 0.5), @as(f32, @floatFromInt(@as(c_int, touch2P))) / @as(f32, 32768.0));
                {
                    sdl_pc = 77;
                    continue;
                }
            },
            76 => {
                {
                    sdl_pc = 77;
                    continue;
                }
            },
            77 => {
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverSInput_UpdateDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSInput_Context = @ptrCast(@alignCast(device.*.context));
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
        if (@as(c_int, data[@as(c_int, 0)]) == SINPUT_DEVICE_REPORT_ID_JOYSTICK_INPUT) {
            HIDAPI_DriverSInput_HandleStatePacket(joystick, ctx, @ptrCast(@alignCast(&data)), size);
        }
    }
    if (size < @as(c_int, 0)) {
        HIDAPI_JoystickDisconnected(device, device.*.joysticks[@as(c_int, 0)]);
    }
    return size >= @as(c_int, 0);
}
pub fn HIDAPI_DriverSInput_CloseJoystick(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn HIDAPI_DriverSInput_FreeDevice(_: [*c]SDL_HIDAPI_Device) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub export var SDL_HIDAPI_DriverSInput: SDL_HIDAPI_DeviceDriver = SDL_HIDAPI_DeviceDriver{
    .name = "SDL_JOYSTICK_HIDAPI_SINPUT",
    .enabled = @"true" != 0,
    .RegisterHints = HIDAPI_DriverSInput_RegisterHints,
    .UnregisterHints = HIDAPI_DriverSInput_UnregisterHints,
    .IsEnabled = HIDAPI_DriverSInput_IsEnabled,
    .IsSupportedDevice = HIDAPI_DriverSInput_IsSupportedDevice,
    .InitDevice = HIDAPI_DriverSInput_InitDevice,
    .GetDevicePlayerIndex = HIDAPI_DriverSInput_GetDevicePlayerIndex,
    .SetDevicePlayerIndex = HIDAPI_DriverSInput_SetDevicePlayerIndex,
    .UpdateDevice = HIDAPI_DriverSInput_UpdateDevice,
    .OpenJoystick = HIDAPI_DriverSInput_OpenJoystick,
    .RumbleJoystick = HIDAPI_DriverSInput_RumbleJoystick,
    .RumbleJoystickTriggers = HIDAPI_DriverSInput_RumbleJoystickTriggers,
    .GetJoystickCapabilities = HIDAPI_DriverSInput_GetJoystickCapabilities,
    .SetJoystickLED = HIDAPI_DriverSInput_SetJoystickLED,
    .SendJoystickEffect = HIDAPI_DriverSInput_SendJoystickEffect,
    .SetJoystickSensorsEnabled = HIDAPI_DriverSInput_SetJoystickSensorsEnabled,
    .CloseJoystick = HIDAPI_DriverSInput_CloseJoystick,
    .FreeDevice = HIDAPI_DriverSInput_FreeDevice,
};

pub const USB_PRODUCT_HANDHELDLEGEND_SINPUT_GENERIC = @as(c_int, 0x10c6);
pub const USB_PRODUCT_HANDHELDLEGEND_PROGCC = @as(c_int, 0x10df);
pub const USB_PRODUCT_HANDHELDLEGEND_GCULTIMATE = @as(c_int, 0x10dd);
pub const USB_PRODUCT_BONZIRICHANNEL_FIREBIRD = @as(c_int, 0x10e0);
pub const USB_PRODUCT_VOIDGAMING_PS4FIREBIRD = @as(c_int, 0x10e5);
pub const USB_PRODUCT_VOIDGAMING_GENESIS_SINPUT = @as(c_int, 0x1014);
pub const SDL_JOYSTICK_CAP_RGB_LED = @as(c_int, 0x00000002);
pub const SDL_JOYSTICK_CAP_PLAYER_LED = @as(c_int, 0x00000004);
pub const SDL_JOYSTICK_CAP_RUMBLE = @as(c_int, 0x00000010);
pub const USB_PACKET_LENGTH = @as(c_int, 64);
pub const SINPUT_DEVICE_REPORT_COMMAND_SIZE = @as(c_int, 48);
pub const SINPUT_DEVICE_REPORT_ID_JOYSTICK_INPUT = @as(c_int, 0x01);
pub const SINPUT_DEVICE_REPORT_ID_INPUT_CMDDAT = @as(c_int, 0x02);
pub const SINPUT_DEVICE_REPORT_ID_OUTPUT_CMDDAT = @as(c_int, 0x03);
pub const SINPUT_DEVICE_COMMAND_HAPTIC = @as(c_int, 0x01);
pub const SINPUT_DEVICE_COMMAND_FEATURES = @as(c_int, 0x02);
pub const SINPUT_DEVICE_COMMAND_PLAYERLED = @as(c_int, 0x03);
pub const SINPUT_DEVICE_COMMAND_JOYSTICKRGB = @as(c_int, 0x04);
pub const SINPUT_REPORT_IDX_BUTTONS_0 = @as(c_int, 3);
pub const SINPUT_REPORT_IDX_LEFT_X = @as(c_int, 7);
pub const SINPUT_REPORT_IDX_LEFT_Y = @as(c_int, 9);
pub const SINPUT_REPORT_IDX_RIGHT_X = @as(c_int, 11);
pub const SINPUT_REPORT_IDX_RIGHT_Y = @as(c_int, 13);
pub const SINPUT_REPORT_IDX_LEFT_TRIGGER = @as(c_int, 15);
pub const SINPUT_REPORT_IDX_RIGHT_TRIGGER = @as(c_int, 17);
pub const SINPUT_REPORT_IDX_IMU_TIMESTAMP = @as(c_int, 19);
pub const SINPUT_REPORT_IDX_IMU_ACCEL_X = @as(c_int, 23);
pub const SINPUT_REPORT_IDX_IMU_ACCEL_Y = @as(c_int, 25);
pub const SINPUT_REPORT_IDX_IMU_ACCEL_Z = @as(c_int, 27);
pub const SINPUT_REPORT_IDX_IMU_GYRO_X = @as(c_int, 29);
pub const SINPUT_REPORT_IDX_IMU_GYRO_Y = @as(c_int, 31);
pub const SINPUT_REPORT_IDX_IMU_GYRO_Z = @as(c_int, 33);
pub const SINPUT_REPORT_IDX_TOUCH1_X = @as(c_int, 35);
pub const SINPUT_REPORT_IDX_TOUCH1_Y = @as(c_int, 37);
pub const SINPUT_REPORT_IDX_TOUCH1_P = @as(c_int, 39);
pub const SINPUT_REPORT_IDX_TOUCH2_X = @as(c_int, 41);
pub const SINPUT_REPORT_IDX_TOUCH2_Y = @as(c_int, 43);
pub const SINPUT_REPORT_IDX_TOUCH2_P = @as(c_int, 45);
pub const SINPUT_BUTTON_IDX_DPAD_UP = @as(c_int, 4);
pub const SINPUT_BUTTON_IDX_DPAD_DOWN = @as(c_int, 5);
pub const SINPUT_BUTTON_IDX_DPAD_LEFT = @as(c_int, 6);
pub const SINPUT_BUTTON_IDX_DPAD_RIGHT = @as(c_int, 7);
pub const SINPUT_BUTTONMASK_LEFT_STICK = @as(c_int, 0x01);
pub const SINPUT_BUTTONMASK_RIGHT_STICK = @as(c_int, 0x02);
pub const SINPUT_BUTTONMASK_LEFT_BUMPER = @as(c_int, 0x04);
pub const SINPUT_BUTTONMASK_RIGHT_BUMPER = @as(c_int, 0x08);
pub const SINPUT_BUTTONMASK_LEFT_TRIGGER = @as(c_int, 0x10);
pub const SINPUT_BUTTONMASK_RIGHT_TRIGGER = @as(c_int, 0x20);
pub const SINPUT_BUTTONMASK_LEFT_PADDLE1 = @as(c_int, 0x40);
pub const SINPUT_BUTTONMASK_RIGHT_PADDLE1 = @as(c_int, 0x80);
pub const SINPUT_BUTTONMASK_START = @as(c_int, 0x01);
pub const SINPUT_BUTTONMASK_BACK = @as(c_int, 0x02);
pub const SINPUT_BUTTONMASK_GUIDE = @as(c_int, 0x04);
pub const SINPUT_BUTTONMASK_CAPTURE = @as(c_int, 0x08);
pub const SINPUT_BUTTONMASK_LEFT_PADDLE2 = @as(c_int, 0x10);
pub const SINPUT_BUTTONMASK_RIGHT_PADDLE2 = @as(c_int, 0x20);
pub const SINPUT_BUTTONMASK_TOUCHPAD1 = @as(c_int, 0x40);
pub const SINPUT_BUTTONMASK_TOUCHPAD2 = @as(c_int, 0x80);
pub const SINPUT_REPORT_IDX_COMMAND_RESPONSE_BULK = @as(c_int, 2);
pub const SINPUT_REPORT_IDX_PLUG_STATUS = @as(c_int, 1);
pub const SINPUT_REPORT_IDX_CHARGE_LEVEL = @as(c_int, 2);
pub const SINPUT_MAX_ALLOWED_TOUCHPADS = @as(c_int, 2);
pub inline fn DEG2RAD(x: anytype) @TypeOf(__helpers.cast(f32, x) * __helpers.cast(f32, __helpers.div(SDL_PI_F, @as(f32, 180.0)))) {
    @setEvalBranchQuota(100000);
    _ = &x;
    return __helpers.cast(f32, x) * __helpers.cast(f32, __helpers.div(SDL_PI_F, @as(f32, 180.0)));
}
