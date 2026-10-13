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
pub const Sint32 = i32;
pub const Uint32 = u32;
pub const Uint64 = u64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_memcmp_REAL(s1: ?*const anyopaque, s2: ?*const anyopaque, len: usize) c_int;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_UCS4ToUTF8_REAL(codepoint: Uint32, dst: [*c]u8) [*c]u8;
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
pub const SDL_JOYSTICK_TYPE_GUITAR: c_int = 6;
pub const SDL_JOYSTICK_TYPE_DRUM_KIT: c_int = 7;
pub const enum_SDL_JoystickType = c_uint;
pub const SDL_JoystickType = enum_SDL_JoystickType;
pub extern fn SDL_GetJoystickFromID_REAL(instance_id: SDL_JoystickID) [*c]SDL_Joystick;
pub const SDL_GAMEPAD_TYPE_XBOXONE: c_int = 3;
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
pub const SDL_SCANCODE_CAPSLOCK: c_int = 57;
pub const SDL_SCANCODE_NUMLOCKCLEAR: c_int = 83;
pub const SDL_SCANCODE_KP_1: c_int = 89;
pub const SDL_SCANCODE_LSHIFT: c_int = 225;
pub const enum_SDL_Scancode = c_uint;
pub const SDL_Scancode = enum_SDL_Scancode;
pub const SDL_Keycode = Uint32;
pub const SDL_Keymod = Uint16;
pub const SDL_KeyboardID = Uint32;
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
pub extern fn SDL_LogInfo_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_LogWarn_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_LogError_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_GetTicks_REAL() Uint64;
pub extern fn SDL_GetTicksNS_REAL() Uint64;
pub const struct_SDL_Keymap = opaque {
};
pub const SDL_Keymap = struct_SDL_Keymap;
pub extern fn SDL_GetKeymapKeycode(keymap: ?*SDL_Keymap, scancode: SDL_Scancode, modstate: SDL_Keymod) SDL_Keycode;
pub extern fn SDL_AddKeyboard(keyboardID: SDL_KeyboardID, name: [*c]const u8) void;
pub extern fn SDL_RemoveKeyboard(keyboardID: SDL_KeyboardID) void;
pub extern fn SDL_SendKeyboardKey(timestamp: Uint64, keyboardID: SDL_KeyboardID, rawcode: c_int, scancode: SDL_Scancode, down: bool) bool;
pub extern fn SDL_SendKeyboardText(text: [*c]const u8) void;
pub extern fn SDL_AssertJoysticksLocked() void;
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
pub extern fn SDL_HIDAPI_LockRumble() bool;
pub const SDL_HIDAPI_RumbleSentCallback = ?*const fn (userdata: ?*anyopaque) callconv(.c) void;
pub extern fn SDL_HIDAPI_SendRumbleWithCallbackAndUnlock(device: [*c]SDL_HIDAPI_Device, data: [*c]const Uint8, size: c_int, callback: SDL_HIDAPI_RumbleSentCallback, userdata: ?*anyopaque) c_int;
pub const GIP_METADATA_NONE: c_int = 0;
pub const GIP_METADATA_GOT: c_int = 1;
pub const GIP_METADATA_FAKED: c_int = 2;
pub const GIP_METADATA_PENDING: c_int = 3;
pub const GIP_MetadataStatus = c_uint;
pub const GIP_TYPE_UNKNOWN: c_int = -1;
pub const GIP_TYPE_GAMEPAD: c_int = 0;
pub const GIP_TYPE_ARCADE_STICK: c_int = 1;
pub const GIP_TYPE_WHEEL: c_int = 2;
pub const GIP_TYPE_FLIGHT_STICK: c_int = 3;
pub const GIP_TYPE_NAVIGATION_CONTROLLER: c_int = 4;
pub const GIP_TYPE_CHATPAD: c_int = 5;
pub const GIP_TYPE_HEADSET: c_int = 6;
pub const GIP_TYPE_GUITAR: c_int = 7;
pub const GIP_TYPE_DRUM_KIT: c_int = 8;
pub const GIP_TYPE_LIVE_GUITAR: c_int = 9;
pub const GIP_AttachmentType = c_int;
pub const GIP_RUMBLE_STATE_IDLE: c_int = 0;
pub const GIP_RUMBLE_STATE_QUEUED: c_int = 1;
pub const GIP_RUMBLE_STATE_BUSY: c_int = 2;
pub const GIP_RumbleState = c_uint;
pub const GIP_BTN_FMT_UNKNOWN: c_int = 0;
pub const GIP_BTN_FMT_XBE1: c_int = 1;
pub const GIP_BTN_FMT_XBE2_RAW: c_int = 2;
pub const GIP_BTN_FMT_XBE2_4: c_int = 3;
pub const GIP_BTN_FMT_XBE2_5: c_int = 4;
pub const GIP_EliteButtonFormat = c_uint;
pub const struct_GUID = extern struct {
    a: Uint32 = 0,
    b: Uint16 = 0,
    c: Uint16 = 0,
    d: [8]Uint8 = @import("std").mem.zeroes([8]Uint8),
};
pub const GUID = struct_GUID;
comptime {
    if (!(@sizeOf(GUID) == @as(c_ulong, 16))) @compileError("static assertion failed \"sizeof(GUID) == 16\"");
}
pub const GUID_ArcadeStick: GUID = GUID{
    .a = @bitCast(@as(c_int, @as(c_int, 857756876))),
    .b = @bitCast(@as(c_short, @truncate(@as(c_int, 41803)))),
    .c = @bitCast(@as(c_short, @truncate(@as(c_int, 16853)))),
    .d = [8]Uint8{
        163,
        74,
        166,
        166,
        113,
        30,
        196,
        179,
    },
};
pub const GUID_DynamicLatencyInput: GUID = GUID{
    .a = @as(c_uint, 2280842603),
    .b = @bitCast(@as(c_short, @truncate(@as(c_int, 50107)))),
    .c = @bitCast(@as(c_short, @truncate(@as(c_int, 18865)))),
    .d = [8]Uint8{
        130,
        101,
        255,
        255,
        243,
        119,
        153,
        238,
    },
};
pub const GUID_FlightStick: GUID = GUID{
    .a = @bitCast(@as(c_int, @as(c_int, 66166801))),
    .b = @bitCast(@as(c_short, @truncate(@as(c_int, 61417)))),
    .c = @bitCast(@as(c_short, @truncate(@as(c_int, 19649)))),
    .d = [8]Uint8{
        150,
        156,
        56,
        220,
        85,
        244,
        4,
        208,
    },
};
pub const GUID_IHeadset: GUID = GUID{
    .a = @as(c_uint, 3156595107),
    .b = @bitCast(@as(c_short, @truncate(@as(c_int, 49742)))),
    .c = @bitCast(@as(c_short, @truncate(@as(c_int, 18834)))),
    .d = [8]Uint8{
        157,
        218,
        239,
        79,
        18,
        62,
        245,
        220,
    },
};
pub const GUID_IConsoleFunctionMap_InputReport: GUID = GUID{
    .a = @as(c_uint, 3973960446),
    .b = @bitCast(@as(c_short, @truncate(@as(c_int, 54151)))),
    .c = @bitCast(@as(c_short, @truncate(@as(c_int, 17044)))),
    .d = [8]Uint8{
        189,
        150,
        26,
        113,
        46,
        61,
        199,
        125,
    },
};
pub const GUID_IConsoleFunctionMap_OverflowInputReport: GUID = GUID{
    .a = @bitCast(@as(c_int, @as(c_int, 326978512))),
    .b = @bitCast(@as(c_short, @truncate(@as(c_int, 37703)))),
    .c = @bitCast(@as(c_short, @truncate(@as(c_int, 17522)))),
    .d = [8]Uint8{
        170,
        38,
        140,
        52,
        160,
        143,
        249,
        189,
    },
};
pub const GUID_IController: GUID = GUID{
    .a = @as(c_uint, 2541158230),
    .b = @bitCast(@as(c_short, @truncate(@as(c_int, 39933)))),
    .c = @bitCast(@as(c_short, @truncate(@as(c_int, 17793)))),
    .d = [8]Uint8{
        173,
        69,
        182,
        69,
        187,
        165,
        38,
        214,
    },
};
pub const GUID_IDevAuthPCOptOut: GUID = GUID{
    .a = @bitCast(@as(c_int, @as(c_int, 2050281079))),
    .b = @bitCast(@as(c_short, @truncate(@as(c_int, 32226)))),
    .c = @bitCast(@as(c_short, @truncate(@as(c_int, 17862)))),
    .d = [8]Uint8{
        140,
        164,
        0,
        66,
        192,
        139,
        217,
        74,
    },
};
pub const GUID_IEliteButtons: GUID = GUID{
    .a = @bitCast(@as(c_int, @as(c_int, 936484855))),
    .b = @bitCast(@as(c_short, @truncate(@as(c_int, 46534)))),
    .c = @bitCast(@as(c_short, @truncate(@as(c_int, 18897)))),
    .d = [8]Uint8{
        167,
        94,
        3,
        178,
        75,
        239,
        140,
        137,
    },
};
pub const GUID_IGamepad: GUID = GUID{
    .a = @bitCast(@as(c_int, @as(c_int, 137248812))),
    .b = @bitCast(@as(c_short, @truncate(@as(c_int, 2015)))),
    .c = @bitCast(@as(c_short, @truncate(@as(c_int, 17889)))),
    .d = [8]Uint8{
        165,
        171,
        163,
        18,
        122,
        241,
        151,
        181,
    },
};
pub const GUID_NavigationController: GUID = GUID{
    .a = @as(c_uint, 3102941159),
    .b = @bitCast(@as(c_short, @truncate(@as(c_int, 29574)))),
    .c = @bitCast(@as(c_short, @truncate(@as(c_int, 16617)))),
    .d = [8]Uint8{
        169,
        248,
        47,
        33,
        38,
        58,
        207,
        183,
    },
};
pub const GUID_Wheel: GUID = GUID{
    .a = @bitCast(@as(c_int, @as(c_int, 1684634063))),
    .b = @bitCast(@as(c_short, @truncate(@as(c_int, 27505)))),
    .c = @bitCast(@as(c_short, @truncate(@as(c_int, 20118)))),
    .d = [8]Uint8{
        141,
        249,
        89,
        227,
        152,
        215,
        66,
        12,
    },
};
pub const GUID_PDP_Guitar: GUID = GUID{
    .a = @bitCast(@as(c_int, @as(c_int, 438725366))),
    .b = @bitCast(@as(c_short, @truncate(@as(c_int, 14918)))),
    .c = @bitCast(@as(c_short, @truncate(@as(c_int, 17891)))),
    .d = [8]Uint8{
        185,
        182,
        15,
        44,
        11,
        44,
        30,
        190,
    },
};
pub const GUID_Madcatz_Guitar: GUID = GUID{
    .a = @bitCast(@as(c_int, @as(c_int, 220914744))),
    .b = @bitCast(@as(c_short, @truncate(@as(c_int, 32637)))),
    .c = @bitCast(@as(c_short, @truncate(@as(c_int, 18739)))),
    .d = [8]Uint8{
        134,
        147,
        48,
        252,
        85,
        1,
        142,
        119,
    },
};
pub const GUID_PDP_DrumKit: GUID = GUID{
    .a = @as(c_uint, 2768501168),
    .b = @bitCast(@as(c_short, @truncate(@as(c_int, 38238)))),
    .c = @bitCast(@as(c_short, @truncate(@as(c_int, 18372)))),
    .d = [8]Uint8{
        162,
        237,
        177,
        51,
        111,
        167,
        112,
        62,
    },
};
pub const GUID_Madcatz_DrumKit: GUID = GUID{
    .a = @bitCast(@as(c_int, @as(c_int, 102246547))),
    .b = @bitCast(@as(c_short, @truncate(@as(c_int, 52448)))),
    .c = @bitCast(@as(c_short, @truncate(@as(c_int, 19333)))),
    .d = [8]Uint8{
        146,
        113,
        10,
        16,
        219,
        171,
        126,
        7,
    },
};
pub const GUID_GuitarHero_Live_Guitar: GUID = GUID{
    .a = @as(c_uint, 4245880281),
    .b = @bitCast(@as(c_short, @truncate(@as(c_int, 36467)))),
    .c = @bitCast(@as(c_short, @truncate(@as(c_int, 18375)))),
    .d = [8]Uint8{
        162,
        49,
        150,
        38,
        140,
        56,
        0,
        154,
    },
};
pub const GIP_DataClassMtu: [8]c_int = [8]c_int{
    64,
    64,
    64,
    2048,
    0,
    0,
    0,
    0,
};
pub const struct_GIP_Quirks = extern struct {
    vendor_id: Uint16 = 0,
    product_id: Uint16 = 0,
    attachment_index: Uint8 = 0,
    added_features: Uint32 = 0,
    filtered_features: Uint32 = 0,
    quirks: Uint32 = 0,
    extra_in_system: [8]Uint32 = @import("std").mem.zeroes([8]Uint32),
    extra_out_system: [8]Uint32 = @import("std").mem.zeroes([8]Uint32),
    device_type: GIP_AttachmentType = @import("std").mem.zeroes(GIP_AttachmentType),
    extra_buttons: Uint8 = 0,
    extra_axes: Uint8 = 0,
};
pub const GIP_Quirks = struct_GIP_Quirks;
pub const quirks: [10]GIP_Quirks = [10]GIP_Quirks{
    GIP_Quirks{
        .vendor_id = USB_VENDOR_MICROSOFT,
        .product_id = USB_PRODUCT_XBOX_ONE_ELITE_SERIES_1,
        .attachment_index = 0,
        .added_features = @as(c_uint, 1) << @intCast(@as(c_uint, 2)),
        .filtered_features = @as(c_uint, 1) << @intCast(@as(c_uint, 0)),
        .quirks = 0,
        .extra_in_system = @import("std").mem.zeroes([8]Uint32),
        .extra_out_system = @import("std").mem.zeroes([8]Uint32),
        .device_type = @import("std").mem.zeroes(GIP_AttachmentType),
        .extra_buttons = 0,
        .extra_axes = 0,
    },
    GIP_Quirks{
        .vendor_id = USB_VENDOR_MICROSOFT,
        .product_id = USB_PRODUCT_XBOX_ONE_ELITE_SERIES_2,
        .attachment_index = 0,
        .added_features = ((((@as(c_uint, 1) << @intCast(@as(c_uint, 2))) | (@as(c_uint, 1) << @intCast(@as(c_uint, 3)))) | (@as(c_uint, 1) << @intCast(@as(c_uint, 0)))) | (@as(c_uint, 1) << @intCast(@as(c_uint, 6)))) | (@as(c_uint, 1) << @intCast(@as(c_uint, 7))),
        .filtered_features = 0,
        .quirks = 0,
        .extra_in_system = [1]Uint32{
            @bitCast(@as(c_int, @as(c_int, 1) << @intCast(GIP_CMD_FIRMWARE))),
        } ++ @as([7]Uint32, @splat(0)),
        .extra_out_system = [1]Uint32{
            @bitCast(@as(c_int, @as(c_int, 1) << @intCast(GIP_CMD_FIRMWARE))),
        } ++ @as([7]Uint32, @splat(0)),
        .device_type = @import("std").mem.zeroes(GIP_AttachmentType),
        .extra_buttons = 0,
        .extra_axes = 0,
    },
    GIP_Quirks{
        .vendor_id = USB_VENDOR_MICROSOFT,
        .product_id = USB_PRODUCT_XBOX_SERIES_X,
        .attachment_index = 0,
        .added_features = @as(c_uint, 1) << @intCast(@as(c_uint, 3)),
        .filtered_features = 0,
        .quirks = 0,
        .extra_in_system = @import("std").mem.zeroes([8]Uint32),
        .extra_out_system = @import("std").mem.zeroes([8]Uint32),
        .device_type = @import("std").mem.zeroes(GIP_AttachmentType),
        .extra_buttons = 0,
        .extra_axes = 0,
    },
    GIP_Quirks{
        .vendor_id = USB_VENDOR_PDP,
        .product_id = USB_PRODUCT_PDP_ROCK_CANDY,
        .attachment_index = 0,
        .added_features = 0,
        .filtered_features = 0,
        .quirks = @as(c_uint, 1) << @intCast(@as(c_uint, 0)),
        .extra_in_system = @import("std").mem.zeroes([8]Uint32),
        .extra_out_system = @import("std").mem.zeroes([8]Uint32),
        .device_type = @import("std").mem.zeroes(GIP_AttachmentType),
        .extra_buttons = 0,
        .extra_axes = 0,
    },
    GIP_Quirks{
        .vendor_id = USB_VENDOR_POWERA,
        .product_id = USB_PRODUCT_BDA_XB1_FIGHTPAD,
        .attachment_index = 0,
        .added_features = 0,
        .filtered_features = @as(c_uint, 1) << @intCast(@as(c_uint, 5)),
        .quirks = 0,
        .extra_in_system = @import("std").mem.zeroes([8]Uint32),
        .extra_out_system = @import("std").mem.zeroes([8]Uint32),
        .device_type = @import("std").mem.zeroes(GIP_AttachmentType),
        .extra_buttons = 0,
        .extra_axes = 0,
    },
    GIP_Quirks{
        .vendor_id = USB_VENDOR_POWERA,
        .product_id = USB_PRODUCT_BDA_XB1_CLASSIC,
        .attachment_index = 0,
        .added_features = 0,
        .filtered_features = 0,
        .quirks = @as(c_uint, 1) << @intCast(@as(c_uint, 2)),
        .extra_in_system = @import("std").mem.zeroes([8]Uint32),
        .extra_out_system = @import("std").mem.zeroes([8]Uint32),
        .device_type = @import("std").mem.zeroes(GIP_AttachmentType),
        .extra_buttons = 0,
        .extra_axes = 0,
    },
    GIP_Quirks{
        .vendor_id = USB_VENDOR_POWERA,
        .product_id = USB_PRODUCT_BDA_XB1_SPECTRA_PRO,
        .attachment_index = 0,
        .added_features = 0,
        .filtered_features = 0,
        .quirks = @as(c_uint, 1) << @intCast(@as(c_uint, 2)),
        .extra_in_system = @import("std").mem.zeroes([8]Uint32),
        .extra_out_system = @import("std").mem.zeroes([8]Uint32),
        .device_type = @import("std").mem.zeroes(GIP_AttachmentType),
        .extra_buttons = 0,
        .extra_axes = 0,
    },
    GIP_Quirks{
        .vendor_id = USB_VENDOR_RAZER,
        .product_id = USB_PRODUCT_RAZER_ATROX,
        .attachment_index = 0,
        .added_features = 0,
        .filtered_features = @as(c_uint, 1) << @intCast(@as(c_uint, 5)),
        .quirks = 0,
        .extra_in_system = @import("std").mem.zeroes([8]Uint32),
        .extra_out_system = @import("std").mem.zeroes([8]Uint32),
        .device_type = GIP_TYPE_ARCADE_STICK,
        .extra_buttons = 0,
        .extra_axes = 0,
    },
    GIP_Quirks{
        .vendor_id = USB_VENDOR_THRUSTMASTER,
        .product_id = USB_PRODUCT_THRUSTMASTER_T_FLIGHT_HOTAS_ONE,
        .attachment_index = 0,
        .added_features = 0,
        .filtered_features = @as(c_uint, 1) << @intCast(@as(c_uint, 5)),
        .quirks = 0,
        .extra_in_system = @import("std").mem.zeroes([8]Uint32),
        .extra_out_system = @import("std").mem.zeroes([8]Uint32),
        .device_type = GIP_TYPE_FLIGHT_STICK,
        .extra_buttons = 5,
        .extra_axes = 3,
    },
    GIP_Quirks{
        .vendor_id = 0,
        .product_id = 0,
        .attachment_index = 0,
        .added_features = 0,
        .filtered_features = 0,
        .quirks = 0,
        .extra_in_system = @import("std").mem.zeroes([8]Uint32),
        .extra_out_system = @import("std").mem.zeroes([8]Uint32),
        .device_type = @import("std").mem.zeroes(GIP_AttachmentType),
        .extra_buttons = 0,
        .extra_axes = 0,
    },
};
pub const struct_GIP_Header = extern struct {
    message_type: Uint8 = 0,
    flags: Uint8 = 0,
    sequence_id: Uint8 = 0,
    length: Uint64 = 0,
};
pub const GIP_Header = struct_GIP_Header;
pub const struct_GIP_AudioFormat = extern struct {
    inbound: Uint8 = 0,
    outbound: Uint8 = 0,
};
pub const GIP_AudioFormat = struct_GIP_AudioFormat;
pub const struct_GIP_DeviceMetadata = extern struct {
    num_audio_formats: Uint8 = 0,
    num_preferred_types: Uint8 = 0,
    num_supported_interfaces: Uint8 = 0,
    hid_descriptor_size: Uint8 = 0,
    in_system_messages: [8]Uint32 = @import("std").mem.zeroes([8]Uint32),
    out_system_messages: [8]Uint32 = @import("std").mem.zeroes([8]Uint32),
    audio_formats: [*c]GIP_AudioFormat = null,
    preferred_types: [*c][*c]u8 = null,
    supported_interfaces: [*c]GUID = null,
    hid_descriptor: [*c]Uint8 = null,
    device_type: GIP_AttachmentType = @import("std").mem.zeroes(GIP_AttachmentType),
};
pub const GIP_DeviceMetadata = struct_GIP_DeviceMetadata;
pub const struct_GIP_MessageMetadata = extern struct {
    type: Uint8 = 0,
    length: Uint16 = 0,
    data_type: Uint16 = 0,
    flags: Uint32 = 0,
    period: Uint16 = 0,
    persistence_timeout: Uint16 = 0,
};
pub const GIP_MessageMetadata = struct_GIP_MessageMetadata;
pub const struct_GIP_Metadata = extern struct {
    version_major: Uint16 = 0,
    version_minor: Uint16 = 0,
    device: GIP_DeviceMetadata = @import("std").mem.zeroes(GIP_DeviceMetadata),
    num_messages: Uint8 = 0,
    message_metadata: [*c]GIP_MessageMetadata = null,
};
pub const GIP_Metadata = struct_GIP_Metadata;
pub const struct_GIP_Attachment = extern struct {
    device: [*c]struct_GIP_Device = null,
    attachment_index: Uint8 = 0,
    joystick: SDL_JoystickID = 0,
    keyboard: SDL_KeyboardID = 0,
    fragment_message: Uint8 = 0,
    total_length: Uint16 = 0,
    fragment_data: [*c]Uint8 = null,
    fragment_offset: Uint32 = 0,
    fragment_timer: Uint64 = 0,
    fragment_retries: c_int = 0,
    firmware_major_version: Uint16 = 0,
    firmware_minor_version: Uint16 = 0,
    got_metadata: GIP_MetadataStatus = @import("std").mem.zeroes(GIP_MetadataStatus),
    metadata_next: Uint64 = 0,
    metadata_retries: c_int = 0,
    metadata: GIP_Metadata = @import("std").mem.zeroes(GIP_Metadata),
    seq_system: Uint8 = 0,
    seq_security: Uint8 = 0,
    seq_extended: Uint8 = 0,
    seq_audio: Uint8 = 0,
    seq_vendor: Uint8 = 0,
    device_state: c_int = 0,
    rumble_state: GIP_RumbleState = @import("std").mem.zeroes(GIP_RumbleState),
    rumble_time: Uint64 = 0,
    rumble_pending: bool = false,
    left_impulse_level: Uint8 = 0,
    right_impulse_level: Uint8 = 0,
    left_vibration_level: Uint8 = 0,
    right_vibration_level: Uint8 = 0,
    last_input: [64]Uint8 = @import("std").mem.zeroes([64]Uint8),
    last_modifiers: Uint8 = 0,
    capslock: bool = false,
    last_key: SDL_Keycode = 0,
    altcode: Uint32 = 0,
    altcode_digit: c_int = 0,
    attachment_type: GIP_AttachmentType = @import("std").mem.zeroes(GIP_AttachmentType),
    xbe_format: GIP_EliteButtonFormat = @import("std").mem.zeroes(GIP_EliteButtonFormat),
    features: Uint32 = 0,
    quirks: Uint32 = 0,
    share_button_idx: Uint8 = 0,
    paddle_idx: Uint8 = 0,
    extra_button_idx: Uint8 = 0,
    extra_buttons: c_int = 0,
    extra_axes: c_int = 0,
};
pub const GIP_Attachment = struct_GIP_Attachment;
pub const struct_GIP_Device = extern struct {
    device: [*c]SDL_HIDAPI_Device = null,
    hello_deadline: Uint64 = 0,
    got_hello: bool = false,
    reset_for_metadata: bool = false,
    timeout: c_int = 0,
    attachments: [8][*c]GIP_Attachment = @import("std").mem.zeroes([8][*c]GIP_Attachment),
};
pub const GIP_Device = struct_GIP_Device;
pub const struct_GIP_HelloDevice = extern struct {
    device_id: Uint64 = 0,
    vendor_id: Uint16 = 0,
    product_id: Uint16 = 0,
    firmware_major_version: Uint16 = 0,
    firmware_minor_version: Uint16 = 0,
    firmware_build_version: Uint16 = 0,
    firmware_revision: Uint16 = 0,
    hardware_major_version: Uint8 = 0,
    hardware_minor_version: Uint8 = 0,
    rf_proto_major_version: Uint8 = 0,
    rf_proto_minor_version: Uint8 = 0,
    security_major_version: Uint8 = 0,
    security_minor_version: Uint8 = 0,
    gip_major_version: Uint8 = 0,
    gip_minor_version: Uint8 = 0,
};
pub const GIP_HelloDevice = struct_GIP_HelloDevice;
pub const struct_GIP_Status = extern struct {
    power_level: c_int = 0,
    charge: c_int = 0,
    battery_type: c_int = 0,
    battery_level: c_int = 0,
};
pub const GIP_Status = struct_GIP_Status;
pub const struct_GIP_StatusEvent = extern struct {
    event_type: Uint16 = 0,
    fault_tag: Uint32 = 0,
    fault_address: Uint32 = 0,
};
pub const GIP_StatusEvent = struct_GIP_StatusEvent;
pub const struct_GIP_ExtendedStatus = extern struct {
    base: GIP_Status = @import("std").mem.zeroes(GIP_Status),
    device_active: bool = false,
    num_events: c_int = 0,
    events: [5]GIP_StatusEvent = @import("std").mem.zeroes([5]GIP_StatusEvent),
};
pub const GIP_ExtendedStatus = struct_GIP_ExtendedStatus;
pub const struct_GIP_DirectMotor = extern struct {
    motor_bitmap: Uint8 = 0,
    left_impulse_level: Uint8 = 0,
    right_impulse_level: Uint8 = 0,
    left_vibration_level: Uint8 = 0,
    right_vibration_level: Uint8 = 0,
    duration: Uint8 = 0,
    delay: Uint8 = 0,
    repeat: Uint8 = 0,
};
pub const GIP_DirectMotor = struct_GIP_DirectMotor;
pub const struct_GIP_InitialReportsRequest = extern struct {
    type: Uint8 = 0,
    data: [2]Uint8 = @import("std").mem.zeroes([2]Uint8),
};
pub const GIP_InitialReportsRequest = struct_GIP_InitialReportsRequest;
pub fn GIP_DecodeLength(length: [*c]Uint64, bytes: [*c]const Uint8, num_bytes: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    length.* = 0;
    var offset: c_int = undefined;
    _ = &offset;
    {
        offset = 0;
        while (offset < num_bytes) : (offset += 1) {
            var byte: Uint8 = bytes[@bitCast(@as(isize, @intCast(offset)))];
            _ = &byte;
            {
                const ref = &length.*;
                ref.* = @truncate(@as(c_ulonglong, ref.*) | ((@as(c_ulonglong, @bitCast(@as(c_longlong, @as(c_int, byte)))) & @as(c_ulonglong, 127)) << @intCast(@as(c_ulonglong, @bitCast(@as(c_longlong, offset * @as(c_int, 7)))))));
            }
            if (!((@as(c_int, byte) & @as(c_int, 128)) != 0)) {
                offset += 1;
                break;
            }
        }
    }
    return offset;
}
pub fn GIP_EncodeLength(arg_length: Uint64, bytes: [*c]Uint8, num_bytes: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var length = arg_length;
    _ = &length;
    var offset: c_int = undefined;
    _ = &offset;
    {
        offset = 0;
        while (offset < num_bytes) : (offset += 1) {
            var byte: Uint8 = @truncate(length & @as(Uint64, 127));
            _ = &byte;
            length >>= @intCast(@as(Uint64, 7));
            if (length != 0) {
                {
                    const ref = &byte;
                    ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | @as(c_int, 128))));
                }
            }
            bytes[@bitCast(@as(isize, @intCast(offset)))] = byte;
            if (!(length != 0)) {
                offset += 1;
                break;
            }
        }
    }
    return offset;
}
pub fn GIP_SupportsSystemMessage(attachment: [*c]GIP_Attachment, command: Uint8, upstream: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (upstream) {
        return (attachment.*.metadata.device.in_system_messages[@bitCast(@as(isize, @intCast(@as(c_int, command) >> @intCast(@as(c_int, 5)))))] & (@as(c_uint, 1) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, command))))))) != 0;
    } else {
        return (attachment.*.metadata.device.out_system_messages[@bitCast(@as(isize, @intCast(@as(c_int, command) >> @intCast(@as(c_int, 5)))))] & (@as(c_uint, 1) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, command))))))) != 0;
    }
}
pub fn GIP_SupportsVendorMessage(attachment: [*c]GIP_Attachment, command: Uint8, upstream: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var i: usize = undefined;
    _ = &i;
    {
        i = 0;
        while (i < @as(usize, @bitCast(@as(c_long, @as(c_int, attachment.*.metadata.num_messages))))) : (i +%= 1) {
            var metadata: [*c]GIP_MessageMetadata = &attachment.*.metadata.message_metadata[i];
            _ = &metadata;
            if (@as(c_int, metadata.*.type) != @as(c_int, command)) {
                continue;
            }
            if ((metadata.*.flags & (@as(c_uint, 1) << @intCast(@as(c_uint, 5)))) != 0) {
                return @"true" != 0;
            }
            if (upstream) {
                return (metadata.*.flags & (@as(c_uint, 1) << @intCast(@as(c_uint, 4)))) != 0;
            } else {
                return (metadata.*.flags & (@as(c_uint, 1) << @intCast(@as(c_uint, 3)))) != 0;
            }
        }
    }
    return @"false" != 0;
}
pub fn GIP_SequenceNext(attachment: [*c]GIP_Attachment, command: Uint8, system_1: bool) callconv(.c) Uint8 {
    @setEvalBranchQuota(100000);
    var seq: Uint8 = undefined;
    _ = &seq;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (system_1) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                switch (@as(c_int, command)) {
                    GIP_CMD_SECURITY => {
                        sdl_pc = 5;
                        continue;
                    },
                    GIP_CMD_EXTENDED => {
                        sdl_pc = 9;
                        continue;
                    },
                    GIP_AUDIO_DATA => {
                        sdl_pc = 13;
                        continue;
                    },
                    else => {
                        sdl_pc = 17;
                        continue;
                    },
                }
            },
            2 => {
                if (@as(c_int, command) == GIP_CMD_DIRECT_MOTOR) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            3 => {
                return seq;
            },
            4 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            5 => {
                seq = blk: {
                    const ref = &attachment.*.seq_security;
                    const tmp = ref.*;
                    ref.* +%= 1;
                    break :blk tmp;
                };
                if (!(@as(c_int, seq) != 0)) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 7;
                    continue;
                }
            },
            6 => {
                seq = blk: {
                    const ref = &attachment.*.seq_security;
                    const tmp = ref.*;
                    ref.* +%= 1;
                    break :blk tmp;
                };
                {
                    sdl_pc = 8;
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
                    sdl_pc = 4;
                    continue;
                }
            },
            9 => {
                seq = blk: {
                    const ref = &attachment.*.seq_extended;
                    const tmp = ref.*;
                    ref.* +%= 1;
                    break :blk tmp;
                };
                if (!(@as(c_int, seq) != 0)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                seq = blk: {
                    const ref = &attachment.*.seq_extended;
                    const tmp = ref.*;
                    ref.* +%= 1;
                    break :blk tmp;
                };
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
                seq = blk: {
                    const ref = &attachment.*.seq_audio;
                    const tmp = ref.*;
                    ref.* +%= 1;
                    break :blk tmp;
                };
                if (!(@as(c_int, seq) != 0)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                seq = blk: {
                    const ref = &attachment.*.seq_audio;
                    const tmp = ref.*;
                    ref.* +%= 1;
                    break :blk tmp;
                };
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
                    sdl_pc = 4;
                    continue;
                }
            },
            17 => {
                seq = blk: {
                    const ref = &attachment.*.seq_system;
                    const tmp = ref.*;
                    ref.* +%= 1;
                    break :blk tmp;
                };
                if (!(@as(c_int, seq) != 0)) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            18 => {
                seq = blk: {
                    const ref = &attachment.*.seq_system;
                    const tmp = ref.*;
                    ref.* +%= 1;
                    break :blk tmp;
                };
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
                return 0;
            },
            22 => {
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            23 => {
                seq = blk: {
                    const ref = &attachment.*.seq_vendor;
                    const tmp = ref.*;
                    ref.* +%= 1;
                    break :blk tmp;
                };
                if (!(@as(c_int, seq) != 0)) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            24 => {
                seq = blk: {
                    const ref = &attachment.*.seq_vendor;
                    const tmp = ref.*;
                    ref.* +%= 1;
                    break :blk tmp;
                };
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
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn GIP_HandleQuirks(attachment: [*c]GIP_Attachment) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var i: usize = undefined;
    _ = &i;
    var j: usize = undefined;
    _ = &j;
    {
        i = 0;
        while (@as(c_int, quirks[i].vendor_id) != 0) : (i +%= 1) {
            if (@as(c_int, quirks[i].vendor_id) != @as(c_int, attachment.*.device.*.device.*.vendor_id)) {
                continue;
            }
            if (@as(c_int, quirks[i].product_id) != @as(c_int, attachment.*.device.*.device.*.product_id)) {
                continue;
            }
            if (@as(c_int, quirks[i].attachment_index) != @as(c_int, attachment.*.attachment_index)) {
                continue;
            }
            attachment.*.features |= quirks[i].added_features;
            attachment.*.features &= ~quirks[i].filtered_features;
            attachment.*.quirks = quirks[i].quirks;
            attachment.*.attachment_type = quirks[i].device_type;
            {
                j = 0;
                while (j < @as(usize, 8)) : (j +%= 1) {
                    attachment.*.metadata.device.in_system_messages[j] |= quirks[i].extra_in_system[j];
                    attachment.*.metadata.device.out_system_messages[j] |= quirks[i].extra_out_system[j];
                }
            }
            attachment.*.extra_buttons = quirks[i].extra_buttons;
            attachment.*.extra_axes = quirks[i].extra_axes;
            break;
        }
    }
}
pub fn GIP_SendRawMessage(device: [*c]GIP_Device, message_type: Uint8, flags: Uint8, seq: Uint8, bytes: [*c]const Uint8, arg_num_bytes: c_int, async: bool, callback: SDL_HIDAPI_RumbleSentCallback, userdata: ?*anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var num_bytes = arg_num_bytes;
    _ = &num_bytes;
    var buffer: [2054]Uint8 = [3]Uint8{
        message_type,
        flags,
        seq,
    } ++ @as([2051]Uint8, @splat(0));
    _ = &buffer;
    var offset: c_int = 3;
    _ = &offset;
    if (num_bytes < @as(c_int, 0)) {
        SDL_LogWarn_REAL(SDL_LOG_CATEGORY_INPUT, "GIP: Invalid message length %d", num_bytes);
        return @"false" != 0;
    }
    if (num_bytes > GIP_DataClassMtu[@bitCast(@as(isize, @intCast(@as(c_int, message_type) >> @intCast(GIP_DATA_CLASS_SHIFT))))]) {
        SDL_LogError_REAL(SDL_LOG_CATEGORY_INPUT, "Attempted to send a message that requires fragmenting, which is not yet supported.");
        return @"false" != 0;
    }
    offset += GIP_EncodeLength(@bitCast(@as(c_long, num_bytes)), &buffer[@bitCast(@as(isize, @intCast(offset)))], @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(buffer)) -% @as(c_ulong, @bitCast(@as(c_long, offset)))))));
    if (num_bytes > @as(c_int, 0)) {
        _ = memcpy(@ptrCast(@alignCast(&buffer[@bitCast(@as(isize, @intCast(offset)))])), @ptrCast(@alignCast(bytes)), @bitCast(@as(c_long, num_bytes)));
    }
    num_bytes += offset;
    if (async) {
        if (!SDL_HIDAPI_LockRumble()) {
            return @"false" != 0;
        }
        return SDL_HIDAPI_SendRumbleWithCallbackAndUnlock(device.*.device, @ptrCast(@alignCast(&buffer)), num_bytes, callback, userdata) == num_bytes;
    } else {
        return SDL_hid_write_REAL(device.*.device.*.dev, @ptrCast(@alignCast(&buffer)), @bitCast(@as(c_long, num_bytes))) == num_bytes;
    }
}
pub fn GIP_SendSystemMessage(attachment: [*c]GIP_Attachment, message_type: Uint8, flags: Uint8, bytes: [*c]const Uint8, num_bytes: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return GIP_SendRawMessage(attachment.*.device, message_type, @truncate(((@as(c_uint, 1) << @intCast(@as(c_uint, 5))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, attachment.*.attachment_index))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, flags))))), GIP_SequenceNext(attachment, message_type, @"true" != 0), bytes, num_bytes, @"false" != 0, null, null);
}
pub fn GIP_SendVendorMessage(attachment: [*c]GIP_Attachment, message_type: Uint8, flags: Uint8, bytes: [*c]const Uint8, num_bytes: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return GIP_SendRawMessage(attachment.*.device, message_type, flags, GIP_SequenceNext(attachment, message_type, @"false" != 0), bytes, num_bytes, @"true" != 0, null, null);
}
pub fn GIP_AttachmentIsController(attachment: [*c]GIP_Attachment) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return (attachment.*.attachment_type != GIP_TYPE_CHATPAD) and (attachment.*.attachment_type != GIP_TYPE_HEADSET);
}
pub fn GIP_MetadataFree(metadata: [*c]GIP_Metadata) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_free_REAL(@ptrCast(@alignCast(metadata.*.device.audio_formats)));
    if (metadata.*.device.preferred_types != null) {
        var i: c_int = undefined;
        _ = &i;
        {
            i = 0;
            while (i < @as(c_int, metadata.*.device.num_preferred_types)) : (i += 1) {
                SDL_free_REAL(@ptrCast(@alignCast(metadata.*.device.preferred_types[@bitCast(@as(isize, @intCast(i)))])));
            }
        }
        SDL_free_REAL(@ptrCast(@alignCast(metadata.*.device.preferred_types)));
    }
    SDL_free_REAL(@ptrCast(@alignCast(metadata.*.device.supported_interfaces)));
    SDL_free_REAL(@ptrCast(@alignCast(metadata.*.device.hid_descriptor)));
    SDL_free_REAL(@ptrCast(@alignCast(metadata.*.message_metadata)));
    _ = memset(@ptrCast(@alignCast(metadata)), 0, @sizeOf(@TypeOf(metadata.*)));
}
pub fn GIP_ParseDeviceMetadata(metadata: [*c]GIP_Metadata, arg_bytes: [*c]const Uint8, arg_num_bytes: c_int, offset: [*c]c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var bytes = arg_bytes;
    _ = &bytes;
    var num_bytes = arg_num_bytes;
    _ = &num_bytes;
    var device: [*c]GIP_DeviceMetadata = &metadata.*.device;
    _ = &device;
    var buffer_offset: c_int = undefined;
    _ = &buffer_offset;
    var count: c_int = undefined;
    _ = &count;
    var length: c_int = undefined;
    _ = &length;
    var i: c_int = undefined;
    _ = &i;
    bytes = &bytes[@bitCast(@as(isize, @intCast(offset.*)))];
    num_bytes -= offset.*;
    if (num_bytes < @as(c_int, 16)) {
        return @"false" != 0;
    }
    length = bytes[@as(c_int, 0)];
    length |= @as(c_int, bytes[@as(c_int, 1)]) << @intCast(@as(c_int, 8));
    if (num_bytes < length) {
        return @"false" != 0;
    }
    buffer_offset = bytes[@as(c_int, 4)];
    buffer_offset |= @as(c_int, bytes[@as(c_int, 5)]) << @intCast(@as(c_int, 8));
    if (buffer_offset >= length) {
        return @"false" != 0;
    }
    if (buffer_offset > @as(c_int, 0)) {
        device.*.num_audio_formats = bytes[@bitCast(@as(isize, @intCast(buffer_offset)))];
        if (((buffer_offset + @as(c_int, device.*.num_audio_formats)) + @as(c_int, 1)) > length) {
            return @"false" != 0;
        }
        device.*.audio_formats = @ptrCast(@alignCast(SDL_malloc_REAL(device.*.num_audio_formats)));
        _ = memcpy(@ptrCast(@alignCast(device.*.audio_formats)), @ptrCast(@alignCast(&bytes[@bitCast(@as(isize, @intCast(buffer_offset + @as(c_int, 1))))])), device.*.num_audio_formats);
    }
    buffer_offset = bytes[@as(c_int, 6)];
    buffer_offset |= @as(c_int, bytes[@as(c_int, 7)]) << @intCast(@as(c_int, 8));
    if (buffer_offset >= length) {
        return @"false" != 0;
    }
    if (buffer_offset > @as(c_int, 0)) {
        count = bytes[@bitCast(@as(isize, @intCast(buffer_offset)))];
        if (((buffer_offset + count) + @as(c_int, 1)) > length) {
            return @"false" != 0;
        }
        {
            i = 0;
            while (i < count) : (i += 1) {
                var message: Uint8 = bytes[@bitCast(@as(isize, @intCast((buffer_offset + @as(c_int, 1)) + i)))];
                _ = &message;
                device.*.in_system_messages[@bitCast(@as(isize, @intCast(@as(c_int, message) >> @intCast(@as(c_int, 5)))))] |= @as(c_uint, 1) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, message) & @as(c_int, 31)))));
            }
        }
    }
    buffer_offset = bytes[@as(c_int, 8)];
    buffer_offset |= @as(c_int, bytes[@as(c_int, 9)]) << @intCast(@as(c_int, 8));
    if (buffer_offset >= length) {
        return @"false" != 0;
    }
    if (buffer_offset > @as(c_int, 0)) {
        count = bytes[@bitCast(@as(isize, @intCast(buffer_offset)))];
        if (((buffer_offset + count) + @as(c_int, 1)) > length) {
            return @"false" != 0;
        }
        {
            i = 0;
            while (i < count) : (i += 1) {
                var message: Uint8 = bytes[@bitCast(@as(isize, @intCast((buffer_offset + @as(c_int, 1)) + i)))];
                _ = &message;
                device.*.out_system_messages[@bitCast(@as(isize, @intCast(@as(c_int, message) >> @intCast(@as(c_int, 5)))))] |= @as(c_uint, 1) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, message) & @as(c_int, 31)))));
            }
        }
    }
    buffer_offset = bytes[@as(c_int, 10)];
    buffer_offset |= @as(c_int, bytes[@as(c_int, 11)]) << @intCast(@as(c_int, 8));
    if (buffer_offset >= length) {
        return @"false" != 0;
    }
    if (buffer_offset > @as(c_int, 0)) {
        device.*.num_preferred_types = bytes[@bitCast(@as(isize, @intCast(buffer_offset)))];
        device.*.preferred_types = @ptrCast(@alignCast(SDL_calloc_REAL(device.*.num_preferred_types, @sizeOf([*c]u8))));
        buffer_offset += 1;
        {
            i = 0;
            while (i < @as(c_int, device.*.num_preferred_types)) : (i += 1) {
                if ((buffer_offset + @as(c_int, 2)) >= length) {
                    return @"false" != 0;
                }
                count = bytes[@bitCast(@as(isize, @intCast(buffer_offset)))];
                count |= bytes[@bitCast(@as(isize, @intCast(buffer_offset)))];
                buffer_offset += 2;
                if ((buffer_offset + count) > length) {
                    return @"false" != 0;
                }
                device.*.preferred_types[@bitCast(@as(isize, @intCast(i)))] = @ptrCast(@alignCast(SDL_calloc_REAL(@bitCast(@as(c_long, count + @as(c_int, 1))), @sizeOf(u8))));
                _ = memcpy(@ptrCast(@alignCast(device.*.preferred_types[@bitCast(@as(isize, @intCast(i)))])), @ptrCast(@alignCast(&bytes[@bitCast(@as(isize, @intCast(buffer_offset)))])), @bitCast(@as(c_long, count)));
                buffer_offset += count;
            }
        }
    }
    buffer_offset = bytes[@as(c_int, 12)];
    buffer_offset |= @as(c_int, bytes[@as(c_int, 13)]) << @intCast(@as(c_int, 8));
    if (buffer_offset >= length) {
        return @"false" != 0;
    }
    if (buffer_offset > @as(c_int, 0)) {
        device.*.num_supported_interfaces = bytes[@bitCast(@as(isize, @intCast(buffer_offset)))];
        if (((buffer_offset + @as(c_int, 1)) + @as(Sint32, @bitCast(@as(c_uint, @truncate(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, device.*.num_supported_interfaces)))) *% @sizeOf(GUID)))))) > length) {
            return @"false" != 0;
        }
        device.*.supported_interfaces = @ptrCast(@alignCast(SDL_calloc_REAL(device.*.num_supported_interfaces, @sizeOf(GUID))));
        _ = memcpy(@ptrCast(@alignCast(device.*.supported_interfaces)), @ptrCast(@alignCast(&bytes[@bitCast(@as(isize, @intCast(buffer_offset + @as(c_int, 1))))])), @sizeOf(GUID) *% @as(c_ulong, @bitCast(@as(c_long, @as(c_int, device.*.num_supported_interfaces)))));
    }
    if ((@as(c_int, metadata.*.version_major) > @as(c_int, 1)) or (@as(c_int, metadata.*.version_minor) >= @as(c_int, 1))) {
        buffer_offset = bytes[@as(c_int, 14)];
        buffer_offset |= @as(c_int, bytes[@as(c_int, 15)]) << @intCast(@as(c_int, 8));
        if (buffer_offset >= length) {
            return @"false" != 0;
        }
        if (buffer_offset > @as(c_int, 0)) {
            device.*.hid_descriptor_size = bytes[@bitCast(@as(isize, @intCast(buffer_offset)))];
            if (((buffer_offset + @as(c_int, 1)) + @as(c_int, device.*.hid_descriptor_size)) > length) {
                return @"false" != 0;
            }
            device.*.hid_descriptor = @ptrCast(@alignCast(SDL_malloc_REAL(device.*.hid_descriptor_size)));
            _ = memcpy(@ptrCast(@alignCast(device.*.hid_descriptor)), @ptrCast(@alignCast(&bytes[@bitCast(@as(isize, @intCast(buffer_offset + @as(c_int, 1))))])), device.*.hid_descriptor_size);
        }
    }
    offset.* += length;
    return @"true" != 0;
}
pub fn GIP_ParseMessageMetadata(metadata: [*c]GIP_MessageMetadata, arg_bytes: [*c]const Uint8, arg_num_bytes: c_int, offset: [*c]c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var bytes = arg_bytes;
    _ = &bytes;
    var num_bytes = arg_num_bytes;
    _ = &num_bytes;
    var length: Uint16 = undefined;
    _ = &length;
    bytes = &bytes[@bitCast(@as(isize, @intCast(offset.*)))];
    num_bytes -= offset.*;
    if (num_bytes < @as(c_int, 2)) {
        return @"false" != 0;
    }
    length = bytes[@as(c_int, 0)];
    {
        const ref = &length;
        ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) | (@as(c_int, bytes[@as(c_int, 1)]) << @intCast(@as(c_int, 8))))));
    }
    if (num_bytes < @as(c_int, length)) {
        return @"false" != 0;
    }
    if (@as(c_int, length) < @as(c_int, 15)) {
        return @"false" != 0;
    }
    metadata.*.type = bytes[@as(c_int, 2)];
    metadata.*.length = bytes[@as(c_int, 3)];
    {
        const ref = &metadata.*.length;
        ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) | (@as(c_int, bytes[@as(c_int, 4)]) << @intCast(@as(c_int, 8))))));
    }
    metadata.*.data_type = bytes[@as(c_int, 5)];
    {
        const ref = &metadata.*.data_type;
        ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) | (@as(c_int, bytes[@as(c_int, 6)]) << @intCast(@as(c_int, 8))))));
    }
    metadata.*.flags = bytes[@as(c_int, 7)];
    metadata.*.flags |= @bitCast(@as(c_int, @as(c_int, bytes[@as(c_int, 8)]) << @intCast(@as(c_int, 8))));
    metadata.*.flags |= @bitCast(@as(c_int, @as(c_int, bytes[@as(c_int, 9)]) << @intCast(@as(c_int, 16))));
    metadata.*.flags |= @bitCast(@as(c_int, @as(c_int, bytes[@as(c_int, 10)]) << @intCast(@as(c_int, 24))));
    metadata.*.period = bytes[@as(c_int, 11)];
    {
        const ref = &metadata.*.period;
        ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) | (@as(c_int, bytes[@as(c_int, 12)]) << @intCast(@as(c_int, 8))))));
    }
    metadata.*.persistence_timeout = bytes[@as(c_int, 13)];
    {
        const ref = &metadata.*.persistence_timeout;
        ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) | (@as(c_int, bytes[@as(c_int, 14)]) << @intCast(@as(c_int, 8))))));
    }
    offset.* += length;
    return @"true" != 0;
}
pub fn GIP_ParseMetadata(metadata: [*c]GIP_Metadata, bytes: [*c]const Uint8, num_bytes: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var header_size: c_int = undefined;
    _ = &header_size;
    var metadata_size: c_int = undefined;
    _ = &metadata_size;
    var offset: c_int = undefined;
    _ = &offset;
    var i: c_int = undefined;
    _ = &i;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                offset = 0;
                if (num_bytes < @as(c_int, 16)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                GIP_MetadataFree(metadata);
                return @"false" != 0;
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
                header_size = bytes[@as(c_int, 0)];
                header_size |= @as(c_int, bytes[@as(c_int, 1)]) << @intCast(@as(c_int, 8));
                if ((num_bytes < header_size) or (header_size < @as(c_int, 16))) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                return @"false" != 0;
            },
            6 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                metadata.*.version_major = bytes[@as(c_int, 2)];
                {
                    const ref = &metadata.*.version_major;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) | (@as(c_int, bytes[@as(c_int, 3)]) << @intCast(@as(c_int, 8))))));
                }
                metadata.*.version_minor = bytes[@as(c_int, 4)];
                {
                    const ref = &metadata.*.version_minor;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) | (@as(c_int, bytes[@as(c_int, 5)]) << @intCast(@as(c_int, 8))))));
                }
                metadata_size = bytes[@as(c_int, 14)];
                metadata_size |= @as(c_int, bytes[@as(c_int, 15)]) << @intCast(@as(c_int, 8));
                if ((num_bytes < metadata_size) or (metadata_size < header_size)) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                return @"false" != 0;
            },
            9 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                offset = header_size;
                if (!GIP_ParseDeviceMetadata(metadata, bytes, num_bytes, &offset)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
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
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                if (offset >= num_bytes) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                {
                    sdl_pc = 1;
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
                metadata.*.num_messages = bytes[@bitCast(@as(isize, @intCast(offset)))];
                offset += 1;
                if (@as(c_int, metadata.*.num_messages) > @as(c_int, 0)) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            17 => {
                metadata.*.message_metadata = @ptrCast(@alignCast(SDL_calloc_REAL(metadata.*.num_messages, @sizeOf(@TypeOf(metadata.*.message_metadata.*)))));
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
                return @"true" != 0;
            },
            20 => {
                if (i < @as(c_int, metadata.*.num_messages)) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            21 => {
                if (!GIP_ParseMessageMetadata(&metadata.*.message_metadata[@bitCast(@as(isize, @intCast(i)))], bytes, num_bytes, &offset)) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            22 => {
                i += 1;
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
                    sdl_pc = 1;
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
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn GIP_Acknowledge(device: [*c]GIP_Device, header: [*c]const GIP_Header, fragment_offset: Uint32, bytes_remaining: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var buffer: [9]Uint8 = [9]Uint8{
        GIP_CONTROL_CODE_ACK,
        header.*.message_type,
        @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, header.*.flags)))) & (@as(c_uint, 1) << @intCast(@as(c_uint, 5)))),
        @truncate(fragment_offset),
        @truncate(fragment_offset >> @intCast(@as(Uint32, 8))),
        @truncate(fragment_offset >> @intCast(@as(Uint32, 16))),
        @truncate(fragment_offset >> @intCast(@as(Uint32, 24))),
        @truncate(bytes_remaining),
        @bitCast(@as(i8, @truncate(@as(c_int, bytes_remaining) >> @intCast(@as(c_int, 8))))),
    };
    _ = &buffer;
    return GIP_SendRawMessage(device, GIP_CMD_PROTO_CONTROL, @truncate((@as(c_uint, 1) << @intCast(@as(c_uint, 5))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, header.*.flags) & GIP_FLAG_ATTACHMENT_MASK)))), header.*.sequence_id, @ptrCast(@alignCast(&buffer)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(buffer))))), @"false" != 0, null, null);
}
pub fn GIP_FragmentFailed(attachment: [*c]GIP_Attachment, header: [*c]const GIP_Header) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    attachment.*.fragment_retries += 1;
    if (attachment.*.fragment_retries > @as(c_int, 8)) {
        if (attachment.*.fragment_data != null) {
            SDL_free_REAL(@ptrCast(@alignCast(attachment.*.fragment_data)));
            attachment.*.fragment_data = null;
        }
        attachment.*.fragment_message = 0;
    }
    return GIP_Acknowledge(attachment.*.device, header, attachment.*.fragment_offset, @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, attachment.*.total_length)))) -% attachment.*.fragment_offset));
}
pub fn GIP_EnableEliteButtons(attachment: [*c]GIP_Attachment) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (@as(c_int, attachment.*.device.*.device.*.vendor_id) == USB_VENDOR_MICROSOFT) {
        if (@as(c_int, attachment.*.device.*.device.*.product_id) == USB_PRODUCT_XBOX_ONE_ELITE_SERIES_1) {
            attachment.*.xbe_format = GIP_BTN_FMT_XBE1;
        } else if (@as(c_int, attachment.*.device.*.device.*.product_id) == USB_PRODUCT_XBOX_ONE_ELITE_SERIES_2) {
            if (@as(c_int, attachment.*.firmware_major_version) == @as(c_int, 4)) {
                attachment.*.xbe_format = GIP_BTN_FMT_XBE2_4;
            } else if (@as(c_int, attachment.*.firmware_major_version) == @as(c_int, 5)) {
                if ((@as(c_int, attachment.*.firmware_minor_version) >= @as(c_int, 11)) and (@as(c_int, attachment.*.firmware_minor_version) < @as(c_int, 17))) {
                    attachment.*.xbe_format = GIP_BTN_FMT_XBE2_RAW;
                } else {
                    attachment.*.xbe_format = GIP_BTN_FMT_XBE2_5;
                }
            }
        }
    }
    if (attachment.*.xbe_format == @as(GIP_EliteButtonFormat, GIP_BTN_FMT_XBE2_RAW)) {
        const static_local_enable_raw_report = struct {
            const enable_raw_report: [2]Uint8 = [2]Uint8{
                7,
                0,
            };
        };
        _ = &static_local_enable_raw_report;
        return GIP_SendVendorMessage(attachment, GIP_SL_ELITE_CONFIG, 0, @ptrCast(@alignCast(&static_local_enable_raw_report.enable_raw_report)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(static_local_enable_raw_report.enable_raw_report))))));
    }
    return @"true" != 0;
}
pub fn GIP_SendGuideButtonLED(attachment: [*c]GIP_Attachment, pattern: Uint8, intensity: Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var buffer: [3]Uint8 = [3]Uint8{
        GIP_LED_GUIDE,
        pattern,
        intensity,
    };
    _ = &buffer;
    if (!GIP_SupportsSystemMessage(attachment, GIP_CMD_LED, @"false" != 0)) {
        return @"true" != 0;
    }
    return GIP_SendSystemMessage(attachment, GIP_CMD_LED, 0, @ptrCast(@alignCast(&buffer)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(buffer))))));
}
pub fn GIP_SendQueryFirmware(attachment: [*c]GIP_Attachment, slot: Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var buffer: [5]Uint8 = [5]Uint8{
        1,
        slot,
        0,
        0,
        0,
    };
    _ = &buffer;
    return GIP_SendSystemMessage(attachment, GIP_CMD_FIRMWARE, 0, @ptrCast(@alignCast(&buffer)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(buffer))))));
}
pub fn GIP_SendSetDeviceState(attachment: [*c]GIP_Attachment, state: Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var buffer: [1]Uint8 = [1]Uint8{
        state,
    };
    _ = &buffer;
    return GIP_SendSystemMessage(attachment, GIP_CMD_SET_DEVICE_STATE, attachment.*.attachment_index, @ptrCast(@alignCast(&buffer)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(buffer))))));
}
pub fn GIP_SendInitSequence(attachment: [*c]GIP_Attachment) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if ((attachment.*.features & (@as(c_uint, 1) << @intCast(@as(c_uint, 7)))) != 0) {
        const static_local_set_device_state = struct {
            const set_device_state: [15]Uint8 = [15]Uint8{
                GIP_STATE_UNK6,
                0,
                0,
                0,
                0,
                0,
                0,
                85,
                83,
                0,
                0,
                0,
                0,
                0,
                0,
            };
        };
        _ = &static_local_set_device_state;
        if (!GIP_SendSystemMessage(attachment, GIP_CMD_SET_DEVICE_STATE, 0, @ptrCast(@alignCast(&static_local_set_device_state.set_device_state)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(static_local_set_device_state.set_device_state))))))) {
            return @"false" != 0;
        }
    }
    if (!GIP_EnableEliteButtons(attachment)) {
        return @"false" != 0;
    }
    if (!GIP_SendSetDeviceState(attachment, GIP_STATE_START)) {
        return @"false" != 0;
    }
    attachment.*.device_state = GIP_STATE_START;
    if (!GIP_SendGuideButtonLED(attachment, GIP_LED_GUIDE_ON, 20)) {
        return @"false" != 0;
    }
    if (GIP_SupportsSystemMessage(attachment, GIP_CMD_SECURITY, @"false" != 0) and !((attachment.*.features & (@as(c_uint, 1) << @intCast(@as(c_uint, 4)))) != 0)) {
        var buffer: [2]Uint8 = [2]Uint8{
            1,
            0,
        };
        _ = &buffer;
        _ = GIP_SendSystemMessage(attachment, GIP_CMD_SECURITY, 0, @ptrCast(@alignCast(&buffer)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(buffer))))));
    }
    if (GIP_SupportsVendorMessage(attachment, GIP_CMD_INITIAL_REPORTS_REQUEST, @"false" != 0)) {
        var request: GIP_InitialReportsRequest = GIP_InitialReportsRequest{
            .type = 0,
            .data = @import("std").mem.zeroes([2]Uint8),
        };
        _ = &request;
        _ = GIP_SendVendorMessage(attachment, GIP_CMD_INITIAL_REPORTS_REQUEST, 0, @ptrCast(@alignCast(&request)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(request))))));
    }
    if (GIP_SupportsVendorMessage(attachment, GIP_CMD_DEVICE_CAPABILITIES, @"false" != 0)) {
        _ = GIP_SendVendorMessage(attachment, GIP_CMD_DEVICE_CAPABILITIES, 0, null, 0);
    }
    if ((!(@as(c_int, attachment.*.attachment_index) != 0) or GIP_AttachmentIsController(attachment)) and !(attachment.*.joystick != 0)) {
        return HIDAPI_JoystickConnected(attachment.*.device.*.device, &attachment.*.joystick);
    }
    if ((attachment.*.attachment_type == GIP_TYPE_CHATPAD) and !(attachment.*.keyboard != 0)) {
        attachment.*.keyboard = @truncate(@as(usize, @intCast(@intFromPtr(attachment))));
        SDL_AddKeyboard(attachment.*.keyboard, "Xbox One Chatpad");
    }
    return @"true" != 0;
}
pub fn GIP_EnsureMetadata(attachment: [*c]GIP_Attachment) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (attachment.*.got_metadata) {
                    @as(GIP_MetadataStatus, GIP_METADATA_GOT) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(GIP_MetadataStatus, GIP_METADATA_FAKED) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(GIP_MetadataStatus, GIP_METADATA_NONE) => {
                        sdl_pc = 4;
                        continue;
                    },
                    else => {
                        sdl_pc = 11;
                        continue;
                    },
                }
            },
            1 => {
                return undefined;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                return @"true" != 0;
            },
            4 => {
                if (attachment.*.device.*.got_hello) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                attachment.*.device.*.timeout = GIP_ACME_TIMEOUT;
                attachment.*.got_metadata = GIP_METADATA_PENDING;
                attachment.*.metadata_next = SDL_GetTicks_REAL() +% @as(Uint64, 500);
                attachment.*.metadata_retries = 0;
                return GIP_SendSystemMessage(attachment, GIP_CMD_METADATA, 0, null, 0);
            },
            6 => {
                if (attachment.*.device.*.reset_for_metadata) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            7 => {
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            8 => {
                return @"true" != 0;
            },
            9 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                return GIP_SetMetadataDefaults(attachment);
            },
            11 => {
                return @"true" != 0;
            },
            else => unreachable,
        }
    }
}
pub fn GIP_SetMetadataDefaults(attachment: [*c]GIP_Attachment) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (@as(c_int, attachment.*.attachment_index) == @as(c_int, 0)) {
        attachment.*.features |= @as(c_uint, 1) << @intCast(@as(c_uint, 5));
        attachment.*.attachment_type = GIP_TYPE_GAMEPAD;
        attachment.*.metadata.device.in_system_messages[@as(c_int, 0)] |= @as(c_uint, 1) << @intCast(@as(c_uint, GIP_CMD_GUIDE_BUTTON));
        if (SDL_IsJoystickXboxSeriesX(attachment.*.device.*.device.*.vendor_id, attachment.*.device.*.device.*.product_id)) {
            attachment.*.features |= @as(c_uint, 1) << @intCast(@as(c_uint, 0));
        }
    }
    GIP_HandleQuirks(attachment);
    if (GIP_SupportsSystemMessage(attachment, GIP_CMD_FIRMWARE, @"false" != 0)) {
        _ = GIP_SendQueryFirmware(attachment, 2);
    }
    attachment.*.got_metadata = GIP_METADATA_FAKED;
    attachment.*.device.*.hello_deadline = 0;
    if (!(attachment.*.joystick != 0)) {
        return HIDAPI_JoystickConnected(attachment.*.device.*.device, &attachment.*.joystick);
    }
    return @"true" != 0;
}
pub fn GIP_HandleCommandProtocolControl(_: [*c]GIP_Attachment, _: [*c]const GIP_Header, _: [*c]const Uint8, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    SDL_LogDebug_REAL(SDL_LOG_CATEGORY_INPUT, "GIP: Unimplemented Protocol Control message");
    return @"false" != 0;
}
pub fn GIP_HandleCommandHelloDevice(attachment: [*c]GIP_Attachment, header: [*c]const GIP_Header, bytes: [*c]const Uint8, num_bytes: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var message: GIP_HelloDevice = GIP_HelloDevice{
        .device_id = 0,
        .vendor_id = 0,
        .product_id = 0,
        .firmware_major_version = 0,
        .firmware_minor_version = 0,
        .firmware_build_version = 0,
        .firmware_revision = 0,
        .hardware_major_version = 0,
        .hardware_minor_version = 0,
        .rf_proto_major_version = 0,
        .rf_proto_minor_version = 0,
        .security_major_version = 0,
        .security_minor_version = 0,
        .gip_major_version = 0,
        .gip_minor_version = 0,
    };
    _ = &message;
    if (num_bytes != @as(c_int, 28)) {
        return @"false" != 0;
    }
    message.device_id = bytes[@as(c_int, 0)];
    message.device_id |= @as(Uint64, bytes[@as(c_int, 1)]) << @intCast(@as(Uint64, 8));
    message.device_id |= @as(Uint64, bytes[@as(c_int, 2)]) << @intCast(@as(Uint64, 16));
    message.device_id |= @as(Uint64, bytes[@as(c_int, 3)]) << @intCast(@as(Uint64, 24));
    message.device_id |= @as(Uint64, bytes[@as(c_int, 4)]) << @intCast(@as(Uint64, 32));
    message.device_id |= @as(Uint64, bytes[@as(c_int, 5)]) << @intCast(@as(Uint64, 40));
    message.device_id |= @as(Uint64, bytes[@as(c_int, 6)]) << @intCast(@as(Uint64, 48));
    message.device_id |= @as(Uint64, bytes[@as(c_int, 7)]) << @intCast(@as(Uint64, 56));
    message.vendor_id = bytes[@as(c_int, 8)];
    {
        const ref = &message.vendor_id;
        ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) | (@as(c_int, bytes[@as(c_int, 9)]) << @intCast(@as(c_int, 8))))));
    }
    message.product_id = bytes[@as(c_int, 10)];
    {
        const ref = &message.product_id;
        ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) | (@as(c_int, bytes[@as(c_int, 11)]) << @intCast(@as(c_int, 8))))));
    }
    message.firmware_major_version = bytes[@as(c_int, 12)];
    {
        const ref = &message.firmware_major_version;
        ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) | (@as(c_int, bytes[@as(c_int, 13)]) << @intCast(@as(c_int, 8))))));
    }
    message.firmware_minor_version = bytes[@as(c_int, 14)];
    {
        const ref = &message.firmware_minor_version;
        ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) | (@as(c_int, bytes[@as(c_int, 15)]) << @intCast(@as(c_int, 8))))));
    }
    message.firmware_build_version = bytes[@as(c_int, 16)];
    {
        const ref = &message.firmware_build_version;
        ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) | (@as(c_int, bytes[@as(c_int, 17)]) << @intCast(@as(c_int, 8))))));
    }
    message.firmware_revision = bytes[@as(c_int, 18)];
    {
        const ref = &message.firmware_revision;
        ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) | (@as(c_int, bytes[@as(c_int, 19)]) << @intCast(@as(c_int, 8))))));
    }
    message.hardware_major_version = bytes[@as(c_int, 20)];
    message.hardware_minor_version = bytes[@as(c_int, 21)];
    message.rf_proto_major_version = bytes[@as(c_int, 22)];
    message.rf_proto_minor_version = bytes[@as(c_int, 23)];
    message.security_major_version = bytes[@as(c_int, 24)];
    message.security_minor_version = bytes[@as(c_int, 25)];
    message.gip_major_version = bytes[@as(c_int, 26)];
    message.gip_minor_version = bytes[@as(c_int, 27)];
    SDL_LogInfo_REAL(SDL_LOG_CATEGORY_INPUT, "GIP: Device hello from %lx (%04x:%04x)", message.device_id, message.vendor_id, message.product_id);
    SDL_LogInfo_REAL(SDL_LOG_CATEGORY_INPUT, "GIP: Firmware version %d.%d.%d rev %d", message.firmware_major_version, message.firmware_minor_version, message.firmware_build_version, message.firmware_revision);
    if ((@as(c_int, message.rf_proto_major_version) != @as(c_int, 1)) and (@as(c_int, message.rf_proto_minor_version) != @as(c_int, 0))) {
        SDL_LogWarn_REAL(SDL_LOG_CATEGORY_INPUT, "GIP: Invalid RF protocol version %d.%d, expected 1.0", message.rf_proto_major_version, message.rf_proto_minor_version);
    }
    if ((@as(c_int, message.security_major_version) != @as(c_int, 1)) and (@as(c_int, message.security_minor_version) != @as(c_int, 0))) {
        SDL_LogWarn_REAL(SDL_LOG_CATEGORY_INPUT, "GIP: Invalid security protocol version %d.%d, expected 1.0", message.security_major_version, message.security_minor_version);
    }
    if ((@as(c_int, message.gip_major_version) != @as(c_int, 1)) and (@as(c_int, message.gip_minor_version) != @as(c_int, 0))) {
        SDL_LogWarn_REAL(SDL_LOG_CATEGORY_INPUT, "GIP: Invalid GIP version %d.%d, expected 1.0", message.gip_major_version, message.gip_minor_version);
    }
    if ((@as(c_int, header.*.flags) & GIP_FLAG_ATTACHMENT_MASK) != 0) {
        return GIP_SendSystemMessage(attachment, GIP_CMD_METADATA, 0, null, 0);
    } else {
        attachment.*.firmware_major_version = message.firmware_major_version;
        attachment.*.firmware_minor_version = message.firmware_minor_version;
        if (@as(c_int, attachment.*.attachment_index) == @as(c_int, 0)) {
            attachment.*.device.*.hello_deadline = 0;
            attachment.*.device.*.got_hello = @"true" != 0;
        }
        if (attachment.*.got_metadata == @as(GIP_MetadataStatus, GIP_METADATA_FAKED)) {
            attachment.*.got_metadata = GIP_METADATA_NONE;
        }
        _ = GIP_EnsureMetadata(attachment);
    }
    return @"true" != 0;
}
pub fn GIP_HandleCommandStatusDevice(attachment: [*c]GIP_Attachment, _: [*c]const GIP_Header, bytes: [*c]const Uint8, arg_num_bytes: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var num_bytes = arg_num_bytes;
    _ = &num_bytes;
    var status: GIP_ExtendedStatus = undefined;
    _ = &status;
    var joystick: [*c]SDL_Joystick = undefined;
    _ = &joystick;
    var power_state: SDL_PowerState = undefined;
    _ = &power_state;
    var power_percent: c_int = undefined;
    _ = &power_percent;
    var i: c_int = undefined;
    _ = &i;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                joystick = null;
                power_percent = 0;
                if (num_bytes < @as(c_int, 1)) {
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
                _ = memset(@ptrCast(@alignCast(&status)), 0, @sizeOf(@TypeOf(status)));
                status.base.battery_level = @as(c_int, bytes[@as(c_int, 0)]) & @as(c_int, 3);
                status.base.battery_type = (@as(c_int, bytes[@as(c_int, 0)]) >> @intCast(@as(c_int, 2))) & @as(c_int, 3);
                status.base.charge = (@as(c_int, bytes[@as(c_int, 0)]) >> @intCast(@as(c_int, 4))) & @as(c_int, 3);
                status.base.power_level = (@as(c_int, bytes[@as(c_int, 0)]) >> @intCast(@as(c_int, 6))) & @as(c_int, 3);
                if (attachment.*.joystick != 0) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                joystick = SDL_GetJoystickFromID_REAL(attachment.*.joystick);
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
                if (joystick != null) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                switch (status.base.battery_level) {
                    GIP_BATTERY_CRITICAL => {
                        sdl_pc = 11;
                        continue;
                    },
                    GIP_BATTERY_LOW => {
                        sdl_pc = 12;
                        continue;
                    },
                    GIP_BATTERY_MEDIUM => {
                        sdl_pc = 13;
                        continue;
                    },
                    GIP_BATTERY_FULL => {
                        sdl_pc = 14;
                        continue;
                    },
                    else => {
                        sdl_pc = 10;
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
                if (num_bytes >= @as(c_int, 4)) {
                    sdl_pc = 28;
                    continue;
                } else {
                    sdl_pc = 29;
                    continue;
                }
            },
            10 => {
                switch (status.base.charge) {
                    GIP_CHARGING => {
                        sdl_pc = 16;
                        continue;
                    },
                    GIP_NOT_CHARGING => {
                        sdl_pc = 20;
                        continue;
                    },
                    GIP_CHARGE_ERROR => {
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
                power_percent = 1;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            12 => {
                power_percent = 25;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            13 => {
                power_percent = 50;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            14 => {
                power_percent = 100;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            15 => {
                switch (status.base.battery_type) {
                    GIP_BATTERY_ABSENT => {
                        sdl_pc = 24;
                        continue;
                    },
                    GIP_BATTERY_STANDARD => {
                        sdl_pc = 25;
                        continue;
                    },
                    GIP_BATTERY_RECHARGEABLE => {
                        sdl_pc = 26;
                        continue;
                    },
                    else => {
                        sdl_pc = 27;
                        continue;
                    },
                }
            },
            16 => {
                if (status.base.battery_level == GIP_BATTERY_FULL) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            17 => {
                power_state = SDL_POWERSTATE_CHARGED;
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            18 => {
                power_state = SDL_POWERSTATE_CHARGING;
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            19 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            20 => {
                power_state = SDL_POWERSTATE_ON_BATTERY;
                {
                    sdl_pc = 15;
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
                power_state = SDL_POWERSTATE_UNKNOWN;
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            23 => {
                SDL_SendJoystickPowerInfo(joystick, power_state, power_percent);
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            24 => {
                power_state = SDL_POWERSTATE_NO_BATTERY;
                {
                    sdl_pc = 23;
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
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            27 => {
                power_state = SDL_POWERSTATE_UNKNOWN;
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            28 => {
                status.device_active = (@as(c_int, bytes[@as(c_int, 1)]) & @as(c_int, 1)) != 0;
                if ((@as(c_int, bytes[@as(c_int, 1)]) & @as(c_int, 2)) != 0) {
                    sdl_pc = 31;
                    continue;
                } else {
                    sdl_pc = 32;
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
                _ = GIP_EnsureMetadata(attachment);
                return @"true" != 0;
            },
            31 => {
                if (num_bytes < @as(c_int, 5)) {
                    sdl_pc = 34;
                    continue;
                } else {
                    sdl_pc = 35;
                    continue;
                }
            },
            32 => {
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            33 => {
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            34 => {
                return @"false" != 0;
            },
            35 => {
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            36 => {
                status.num_events = bytes[@as(c_int, 4)];
                if (status.num_events > @as(c_int, 5)) {
                    sdl_pc = 37;
                    continue;
                } else {
                    sdl_pc = 38;
                    continue;
                }
            },
            37 => {
                SDL_LogWarn_REAL(SDL_LOG_CATEGORY_INPUT, "GIP: Device reported too many events, %d > 5", status.num_events);
                return @"false" != 0;
            },
            38 => {
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            39 => {
                if ((@as(c_int, 5) + (status.num_events * @as(c_int, 10))) > num_bytes) {
                    sdl_pc = 40;
                    continue;
                } else {
                    sdl_pc = 41;
                    continue;
                }
            },
            40 => {
                return @"false" != 0;
            },
            41 => {
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            42 => {
                i = 0;
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            43 => {
                if (i < status.num_events) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 46;
                    continue;
                }
            },
            44 => {
                status.events[@bitCast(@as(isize, @intCast(i)))].event_type = bytes[@bitCast(@as(isize, @intCast((i * @as(c_int, 10)) + @as(c_int, 5))))];
                {
                    const ref = &status.events[@bitCast(@as(isize, @intCast(i)))].event_type;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) | (@as(c_int, bytes[@bitCast(@as(isize, @intCast((i * @as(c_int, 10)) + @as(c_int, 6))))]) << @intCast(@as(c_int, 8))))));
                }
                status.events[@bitCast(@as(isize, @intCast(i)))].fault_tag = bytes[@bitCast(@as(isize, @intCast((i * @as(c_int, 10)) + @as(c_int, 7))))];
                status.events[@bitCast(@as(isize, @intCast(i)))].fault_tag |= @bitCast(@as(c_int, @as(c_int, bytes[@bitCast(@as(isize, @intCast((i * @as(c_int, 10)) + @as(c_int, 8))))]) << @intCast(@as(c_int, 8))));
                status.events[@bitCast(@as(isize, @intCast(i)))].fault_tag |= @bitCast(@as(c_int, @as(c_int, bytes[@bitCast(@as(isize, @intCast((i * @as(c_int, 10)) + @as(c_int, 9))))]) << @intCast(@as(c_int, 16))));
                status.events[@bitCast(@as(isize, @intCast(i)))].fault_tag |= @bitCast(@as(c_int, @as(c_int, bytes[@bitCast(@as(isize, @intCast((i * @as(c_int, 10)) + @as(c_int, 10))))]) << @intCast(@as(c_int, 24))));
                status.events[@bitCast(@as(isize, @intCast(i)))].fault_tag = bytes[@bitCast(@as(isize, @intCast((i * @as(c_int, 10)) + @as(c_int, 11))))];
                status.events[@bitCast(@as(isize, @intCast(i)))].fault_tag |= @bitCast(@as(c_int, @as(c_int, bytes[@bitCast(@as(isize, @intCast((i * @as(c_int, 10)) + @as(c_int, 12))))]) << @intCast(@as(c_int, 8))));
                status.events[@bitCast(@as(isize, @intCast(i)))].fault_tag |= @bitCast(@as(c_int, @as(c_int, bytes[@bitCast(@as(isize, @intCast((i * @as(c_int, 10)) + @as(c_int, 13))))]) << @intCast(@as(c_int, 16))));
                status.events[@bitCast(@as(isize, @intCast(i)))].fault_tag |= @bitCast(@as(c_int, @as(c_int, bytes[@bitCast(@as(isize, @intCast((i * @as(c_int, 10)) + @as(c_int, 14))))]) << @intCast(@as(c_int, 24))));
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            45 => {
                i += 1;
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            46 => {
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn GIP_HandleCommandMetadataRespose(attachment: [*c]GIP_Attachment, _: [*c]const GIP_Header, bytes: [*c]const Uint8, num_bytes: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var metadata: GIP_Metadata = GIP_Metadata{
        .version_major = 0,
        .version_minor = 0,
        .device = @import("std").mem.zeroes(GIP_DeviceMetadata),
        .num_messages = 0,
        .message_metadata = null,
    };
    _ = &metadata;
    var expected_guid: [*c]const GUID = null;
    _ = &expected_guid;
    var found_expected_guid: bool = undefined;
    _ = &found_expected_guid;
    var found_controller_guid: bool = @"false" != 0;
    _ = &found_controller_guid;
    var i: c_int = undefined;
    _ = &i;
    if (!GIP_ParseMetadata(&metadata, bytes, num_bytes)) {
        return @"false" != 0;
    }
    if (attachment.*.got_metadata == @as(GIP_MetadataStatus, GIP_METADATA_GOT)) {
        GIP_MetadataFree(&attachment.*.metadata);
    }
    attachment.*.metadata = metadata;
    attachment.*.got_metadata = GIP_METADATA_GOT;
    attachment.*.features = 0;
    attachment.*.attachment_type = GIP_TYPE_UNKNOWN;
    {
        i = 0;
        while (i < @as(c_int, metadata.device.num_preferred_types)) : (i += 1) {
            var @"type": [*c]const u8 = metadata.device.preferred_types[@bitCast(@as(isize, @intCast(i)))];
            _ = &@"type";
            if (SDL_strcmp_REAL(@"type", "Windows.Xbox.Input.Gamepad") == @as(c_int, 0)) {
                attachment.*.attachment_type = GIP_TYPE_GAMEPAD;
                expected_guid = &GUID_IGamepad;
                break;
            }
            if (SDL_strcmp_REAL(@"type", "Microsoft.Xbox.Input.ArcadeStick") == @as(c_int, 0)) {
                attachment.*.attachment_type = GIP_TYPE_ARCADE_STICK;
                expected_guid = &GUID_ArcadeStick;
                break;
            }
            if (SDL_strcmp_REAL(@"type", "Windows.Xbox.Input.ArcadeStick") == @as(c_int, 0)) {
                attachment.*.attachment_type = GIP_TYPE_ARCADE_STICK;
                expected_guid = &GUID_ArcadeStick;
                break;
            }
            if (SDL_strcmp_REAL(@"type", "Microsoft.Xbox.Input.FlightStick") == @as(c_int, 0)) {
                attachment.*.attachment_type = GIP_TYPE_FLIGHT_STICK;
                expected_guid = &GUID_FlightStick;
                break;
            }
            if (SDL_strcmp_REAL(@"type", "Windows.Xbox.Input.FlightStick") == @as(c_int, 0)) {
                attachment.*.attachment_type = GIP_TYPE_FLIGHT_STICK;
                expected_guid = &GUID_FlightStick;
                break;
            }
            if (SDL_strcmp_REAL(@"type", "Microsoft.Xbox.Input.Wheel") == @as(c_int, 0)) {
                attachment.*.attachment_type = GIP_TYPE_WHEEL;
                expected_guid = &GUID_Wheel;
                break;
            }
            if (SDL_strcmp_REAL(@"type", "Windows.Xbox.Input.Wheel") == @as(c_int, 0)) {
                attachment.*.attachment_type = GIP_TYPE_WHEEL;
                expected_guid = &GUID_Wheel;
                break;
            }
            if (SDL_strcmp_REAL(@"type", "Windows.Xbox.Input.NavigationController") == @as(c_int, 0)) {
                attachment.*.attachment_type = GIP_TYPE_NAVIGATION_CONTROLLER;
                expected_guid = &GUID_NavigationController;
                break;
            }
            if (SDL_strcmp_REAL(@"type", "Windows.Xbox.Input.Chatpad") == @as(c_int, 0)) {
                attachment.*.attachment_type = GIP_TYPE_CHATPAD;
                break;
            }
            if (SDL_strcmp_REAL(@"type", "Windows.Xbox.Input.Headset") == @as(c_int, 0)) {
                attachment.*.attachment_type = GIP_TYPE_HEADSET;
                expected_guid = &GUID_IHeadset;
                break;
            }
            if (SDL_strcmp_REAL(@"type", "Activision.Xbox.Input.GH7") == @as(c_int, 0)) {
                attachment.*.attachment_type = GIP_TYPE_LIVE_GUITAR;
                expected_guid = &GUID_GuitarHero_Live_Guitar;
                break;
            }
            if (SDL_strcmp_REAL(@"type", "MadCatz.Xbox.Guitar.Stratocaster") == @as(c_int, 0)) {
                attachment.*.attachment_type = GIP_TYPE_GUITAR;
                expected_guid = &GUID_Madcatz_Guitar;
                break;
            }
            if (SDL_strcmp_REAL(@"type", "PDP.Xbox.Guitar.Jaguar") == @as(c_int, 0)) {
                attachment.*.attachment_type = GIP_TYPE_GUITAR;
                expected_guid = &GUID_PDP_Guitar;
                break;
            }
            if (SDL_strcmp_REAL(@"type", "MadCatz.Xbox.Drums.Glam") == @as(c_int, 0)) {
                attachment.*.attachment_type = GIP_TYPE_DRUM_KIT;
                expected_guid = &GUID_Madcatz_DrumKit;
                break;
            }
            if (SDL_strcmp_REAL(@"type", "PDP.Xbox.Drums.Tablah") == @as(c_int, 0)) {
                attachment.*.attachment_type = GIP_TYPE_DRUM_KIT;
                expected_guid = &GUID_PDP_DrumKit;
                break;
            }
        }
    }
    found_expected_guid = !(expected_guid != null);
    {
        i = 0;
        while (i < @as(c_int, metadata.device.num_supported_interfaces)) : (i += 1) {
            var guid: [*c]const GUID = &metadata.device.supported_interfaces[@bitCast(@as(isize, @intCast(i)))];
            _ = &guid;
            if ((expected_guid != null) and (SDL_memcmp_REAL(@ptrCast(@alignCast(expected_guid)), @ptrCast(@alignCast(guid)), @sizeOf(GUID)) == @as(c_int, 0))) {
                found_expected_guid = @"true" != 0;
            }
            if (SDL_memcmp_REAL(@ptrCast(@alignCast(&GUID_IController)), @ptrCast(@alignCast(guid)), @sizeOf(GUID)) == @as(c_int, 0)) {
                found_controller_guid = @"true" != 0;
                continue;
            }
            if (SDL_memcmp_REAL(@ptrCast(@alignCast(&GUID_IDevAuthPCOptOut)), @ptrCast(@alignCast(guid)), @sizeOf(GUID)) == @as(c_int, 0)) {
                attachment.*.features |= @as(c_uint, 1) << @intCast(@as(c_uint, 4));
                continue;
            }
            if (SDL_memcmp_REAL(@ptrCast(@alignCast(&GUID_IConsoleFunctionMap_InputReport)), @ptrCast(@alignCast(guid)), @sizeOf(GUID)) == @as(c_int, 0)) {
                attachment.*.features |= @as(c_uint, 1) << @intCast(@as(c_uint, 0));
                continue;
            }
            if (SDL_memcmp_REAL(@ptrCast(@alignCast(&GUID_IConsoleFunctionMap_OverflowInputReport)), @ptrCast(@alignCast(guid)), @sizeOf(GUID)) == @as(c_int, 0)) {
                attachment.*.features |= @as(c_uint, 1) << @intCast(@as(c_uint, 1));
                continue;
            }
            if (SDL_memcmp_REAL(@ptrCast(@alignCast(&GUID_IEliteButtons)), @ptrCast(@alignCast(guid)), @sizeOf(GUID)) == @as(c_int, 0)) {
                attachment.*.features |= @as(c_uint, 1) << @intCast(@as(c_uint, 2));
                continue;
            }
            if (SDL_memcmp_REAL(@ptrCast(@alignCast(&GUID_DynamicLatencyInput)), @ptrCast(@alignCast(guid)), @sizeOf(GUID)) == @as(c_int, 0)) {
                attachment.*.features |= @as(c_uint, 1) << @intCast(@as(c_uint, 3));
                continue;
            }
        }
    }
    {
        i = 0;
        while (i < @as(c_int, metadata.num_messages)) : (i += 1) {
            var message: [*c]GIP_MessageMetadata = &metadata.message_metadata[@bitCast(@as(isize, @intCast(i)))];
            _ = &message;
            if ((@as(Uint32, @bitCast(@as(c_int, @intFromBool((@as(c_int, message.*.type) == GIP_CMD_DIRECT_MOTOR) and (@as(c_int, message.*.length) >= @as(c_int, 9)))))) != 0) and ((message.*.flags & (@as(c_uint, 1) << @intCast(@as(c_uint, 3)))) != 0)) {
                attachment.*.features |= @as(c_uint, 1) << @intCast(@as(c_uint, 5));
            }
        }
    }
    if (!found_expected_guid or (GIP_AttachmentIsController(attachment) and !found_controller_guid)) {
        SDL_LogDebug_REAL(SDL_LOG_CATEGORY_INPUT, "GIP: Controller was missing expected GUID. This controller probably won't work on an actual Xbox.");
    }
    if (((attachment.*.features & (@as(c_uint, 1) << @intCast(@as(c_uint, 6)))) != 0) and (@as(Uint32, @bitCast(@as(c_int, @intFromBool(!GIP_SupportsVendorMessage(attachment, GIP_CMD_GUIDE_COLOR, @"false" != 0))))) != 0)) {
        attachment.*.features &= ~(@as(c_uint, 1) << @intCast(@as(c_uint, 6)));
    }
    GIP_HandleQuirks(attachment);
    return GIP_SendInitSequence(attachment);
}
pub fn GIP_HandleCommandSecurity(_: [*c]GIP_Attachment, _: [*c]const GIP_Header, _: [*c]const Uint8, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    SDL_LogDebug_REAL(SDL_LOG_CATEGORY_INPUT, "GIP: Unimplemented Security message");
    return @"false" != 0;
}
pub fn GIP_HandleCommandGuideButtonStatus(attachment: [*c]GIP_Attachment, _: [*c]const GIP_Header, bytes: [*c]const Uint8, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var timestamp: Uint64 = SDL_GetTicksNS_REAL();
    _ = &timestamp;
    var joystick: [*c]SDL_Joystick = null;
    _ = &joystick;
    if (attachment.*.device.*.device.*.num_joysticks < @as(c_int, 1)) {
        return @"true" != 0;
    }
    joystick = SDL_GetJoystickFromID_REAL(attachment.*.joystick);
    if (!(joystick != null)) {
        return @"false" != 0;
    }
    if (@as(c_int, bytes[@as(c_int, 1)]) == VK_LWIN) {
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_GUIDE, (@as(c_int, bytes[@as(c_int, 0)]) & @as(c_int, 3)) != @as(c_int, 0));
    }
    return @"true" != 0;
}
pub fn GIP_HandleCommandAudioControl(_: [*c]GIP_Attachment, _: [*c]const GIP_Header, _: [*c]const Uint8, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    SDL_LogDebug_REAL(SDL_LOG_CATEGORY_INPUT, "GIP: Unimplemented Audio Control message");
    return @"false" != 0;
}
pub fn GIP_HandleCommandFirmware(attachment: [*c]GIP_Attachment, _: [*c]const GIP_Header, bytes: [*c]const Uint8, num_bytes: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (num_bytes < @as(c_int, 1)) {
        return @"false" != 0;
    }
    if (@as(c_int, bytes[@as(c_int, 0)]) == @as(c_int, 1)) {
        var major: Uint16 = undefined;
        _ = &major;
        var minor: Uint16 = undefined;
        _ = &minor;
        var build: Uint16 = undefined;
        _ = &build;
        var rev: Uint16 = undefined;
        _ = &rev;
        if (num_bytes < @as(c_int, 14)) {
            SDL_LogDebug_REAL(SDL_LOG_CATEGORY_INPUT, "GIP: Discarding too-short firmware message");
            return @"false" != 0;
        }
        major = bytes[@as(c_int, 6)];
        {
            const ref = &major;
            ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) | (@as(c_int, bytes[@as(c_int, 7)]) << @intCast(@as(c_int, 8))))));
        }
        minor = bytes[@as(c_int, 8)];
        {
            const ref = &minor;
            ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) | (@as(c_int, bytes[@as(c_int, 9)]) << @intCast(@as(c_int, 8))))));
        }
        build = bytes[@as(c_int, 10)];
        {
            const ref = &build;
            ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) | (@as(c_int, bytes[@as(c_int, 11)]) << @intCast(@as(c_int, 8))))));
        }
        rev = bytes[@as(c_int, 12)];
        {
            const ref = &rev;
            ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) | (@as(c_int, bytes[@as(c_int, 13)]) << @intCast(@as(c_int, 8))))));
        }
        SDL_LogDebug_REAL(SDL_LOG_CATEGORY_INPUT, "GIP: Firmware version: %d.%d.%d rev %d", major, minor, build, rev);
        attachment.*.firmware_major_version = major;
        attachment.*.firmware_minor_version = minor;
        if ((@as(c_int, attachment.*.device.*.device.*.vendor_id) == USB_VENDOR_MICROSOFT) and (@as(c_int, attachment.*.device.*.device.*.product_id) == USB_PRODUCT_XBOX_ONE_ELITE_SERIES_2)) {
            return GIP_EnableEliteButtons(attachment);
        }
        return @"true" != 0;
    } else {
        SDL_LogDebug_REAL(SDL_LOG_CATEGORY_INPUT, "GIP: Unimplemented Firmware message");
        return @"false" != 0;
    }
}
pub fn GIP_HandleCommandRawReport(attachment: [*c]GIP_Attachment, _: [*c]const GIP_Header, bytes: [*c]const Uint8, num_bytes: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var timestamp: Uint64 = SDL_GetTicksNS_REAL();
    _ = &timestamp;
    var joystick: [*c]SDL_Joystick = null;
    _ = &joystick;
    if (attachment.*.device.*.device.*.num_joysticks < @as(c_int, 1)) {
        return @"true" != 0;
    }
    joystick = SDL_GetJoystickFromID_REAL(attachment.*.joystick);
    if (!(joystick != null)) {
        return @"true" != 0;
    }
    if (num_bytes < @as(c_int, 17)) {
        SDL_LogDebug_REAL(SDL_LOG_CATEGORY_INPUT, "GIP: Discarding too-short raw report");
        return @"false" != 0;
    }
    if (((attachment.*.features & (@as(c_uint, 1) << @intCast(@as(c_uint, 2)))) != 0) and (@as(Uint32, @bitCast(@as(c_int, @intFromBool(attachment.*.xbe_format == @as(GIP_EliteButtonFormat, GIP_BTN_FMT_XBE2_RAW))))) != 0)) {
        if ((@as(c_int, bytes[@as(c_int, 15)]) & @as(c_int, 3)) != 0) {
            SDL_SendJoystickButton(timestamp, joystick, attachment.*.paddle_idx, @as(c_int, 0) != 0);
            SDL_SendJoystickButton(timestamp, joystick, @bitCast(@as(i8, @truncate(@as(c_int, attachment.*.paddle_idx) + @as(c_int, 1)))), @as(c_int, 0) != 0);
            SDL_SendJoystickButton(timestamp, joystick, @bitCast(@as(i8, @truncate(@as(c_int, attachment.*.paddle_idx) + @as(c_int, 2)))), @as(c_int, 0) != 0);
            SDL_SendJoystickButton(timestamp, joystick, @bitCast(@as(i8, @truncate(@as(c_int, attachment.*.paddle_idx) + @as(c_int, 3)))), @as(c_int, 0) != 0);
        } else {
            SDL_SendJoystickButton(timestamp, joystick, attachment.*.paddle_idx, (@as(c_int, bytes[GIP_BTN_OFFSET_XBE2]) & @as(c_int, 1)) != @as(c_int, 0));
            SDL_SendJoystickButton(timestamp, joystick, @bitCast(@as(i8, @truncate(@as(c_int, attachment.*.paddle_idx) + @as(c_int, 1)))), (@as(c_int, bytes[GIP_BTN_OFFSET_XBE2]) & @as(c_int, 2)) != @as(c_int, 0));
            SDL_SendJoystickButton(timestamp, joystick, @bitCast(@as(i8, @truncate(@as(c_int, attachment.*.paddle_idx) + @as(c_int, 2)))), (@as(c_int, bytes[GIP_BTN_OFFSET_XBE2]) & @as(c_int, 4)) != @as(c_int, 0));
            SDL_SendJoystickButton(timestamp, joystick, @bitCast(@as(i8, @truncate(@as(c_int, attachment.*.paddle_idx) + @as(c_int, 3)))), (@as(c_int, bytes[GIP_BTN_OFFSET_XBE2]) & @as(c_int, 8)) != @as(c_int, 0));
        }
    }
    return @"true" != 0;
}
pub fn GIP_HandleCommandHidReport(attachment: [*c]GIP_Attachment, _: [*c]const GIP_Header, bytes: [*c]const Uint8, num_bytes: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var timestamp: Uint64 = undefined;
    _ = &timestamp;
    var modifiers: Uint8 = undefined;
    _ = &modifiers;
    var changed_modifiers: Uint8 = undefined;
    _ = &changed_modifiers;
    var utf8: [4]u8 = undefined;
    _ = &utf8;
    var keycode: SDL_Keycode = undefined;
    _ = &keycode;
    var text: [2]u8 = undefined;
    _ = &text;
    var digit: c_int = undefined;
    _ = &digit;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                timestamp = SDL_GetTicksNS_REAL();
                if (((attachment.*.attachment_type != GIP_TYPE_CHATPAD) or !(attachment.*.keyboard != 0)) or (num_bytes != @as(c_int, 8))) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                SDL_LogDebug_REAL(SDL_LOG_CATEGORY_INPUT, "GIP: Unimplemented HID Report message");
                return @"false" != 0;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                modifiers = bytes[@as(c_int, 0)];
                changed_modifiers = @bitCast(@as(i8, @truncate(@as(c_int, modifiers) ^ @as(c_int, attachment.*.last_modifiers))));
                if ((@as(c_int, changed_modifiers) & @as(c_int, 2)) != 0) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                if ((@as(c_int, modifiers) & @as(c_int, 2)) != 0) {
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
                if ((@as(c_int, changed_modifiers) & @as(c_int, 4)) != 0) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            7 => {
                _ = SDL_SendKeyboardKey(timestamp, attachment.*.keyboard, 0, SDL_SCANCODE_LSHIFT, @"true" != 0);
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                _ = SDL_SendKeyboardKey(timestamp, attachment.*.keyboard, 0, SDL_SCANCODE_LSHIFT, @"false" != 0);
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
                if ((@as(c_int, modifiers) & @as(c_int, 4)) != 0) {
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
                if ((@as(SDL_Keycode, @bitCast(@as(c_int, @intFromBool(!(@as(c_int, bytes[@as(c_int, 2)]) != 0))))) != 0) and (attachment.*.last_key != 0)) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            13 => {
                attachment.*.altcode_digit = 0;
                attachment.*.altcode = 0;
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                if (attachment.*.altcode_digit == @as(c_int, 4)) {
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
                utf8 = [1]u8{
                    0,
                } ++ @as([3]u8, @splat(0));
                switch (attachment.*.altcode) {
                    @as(Uint32, 128) => {
                        sdl_pc = 20;
                        continue;
                    },
                    @as(Uint32, 138) => {
                        sdl_pc = 21;
                        continue;
                    },
                    @as(Uint32, 140) => {
                        sdl_pc = 22;
                        continue;
                    },
                    @as(Uint32, 154) => {
                        sdl_pc = 23;
                        continue;
                    },
                    @as(Uint32, 156) => {
                        sdl_pc = 24;
                        continue;
                    },
                    else => {
                        sdl_pc = 25;
                        continue;
                    },
                }
            },
            17 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            18 => {
                attachment.*.altcode_digit = -@as(c_int, 1);
                _ = SDL_SendKeyboardKey(timestamp, attachment.*.keyboard, 0, SDL_SCANCODE_NUMLOCKCLEAR, @"true" != 0);
                _ = SDL_SendKeyboardKey(timestamp, attachment.*.keyboard, 0, SDL_SCANCODE_NUMLOCKCLEAR, @"false" != 0);
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            19 => {
                SDL_SendKeyboardText(@ptrCast(@alignCast(&utf8)));
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            20 => {
                _ = SDL_UCS4ToUTF8_REAL(8364, @ptrCast(@alignCast(&utf8)));
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            21 => {
                _ = SDL_UCS4ToUTF8_REAL(352, @ptrCast(@alignCast(&utf8)));
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            22 => {
                _ = SDL_UCS4ToUTF8_REAL(338, @ptrCast(@alignCast(&utf8)));
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            23 => {
                _ = SDL_UCS4ToUTF8_REAL(353, @ptrCast(@alignCast(&utf8)));
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            24 => {
                _ = SDL_UCS4ToUTF8_REAL(339, @ptrCast(@alignCast(&utf8)));
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            25 => {
                _ = SDL_UCS4ToUTF8_REAL(attachment.*.altcode, @ptrCast(@alignCast(&utf8)));
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            26 => {
                if (attachment.*.last_key == @as(SDL_Keycode, SDL_SCANCODE_CAPSLOCK)) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            27 => {
                _ = SDL_SendKeyboardKey(timestamp, attachment.*.keyboard, 0, bytes[@as(c_int, 2)], @"true" != 0);
                attachment.*.last_key = bytes[@as(c_int, 2)];
                if (((@as(c_int, modifiers) & @as(c_int, 4)) != 0) and (attachment.*.altcode_digit >= @as(c_int, 0))) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
                    continue;
                }
            },
            28 => {
                attachment.*.last_modifiers = modifiers;
                return @"true" != 0;
            },
            29 => {
                attachment.*.capslock = !attachment.*.capslock;
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
                _ = SDL_SendKeyboardKey(timestamp, attachment.*.keyboard, 0, attachment.*.last_key, @"false" != 0);
                if (!((@as(c_int, attachment.*.last_modifiers) & @as(c_int, 253)) != 0)) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            32 => {
                keycode = SDL_GetKeymapKeycode(null, attachment.*.last_key, @truncate(if (((@as(c_int, attachment.*.last_modifiers) & @as(c_int, 2)) != 0) or attachment.*.capslock) SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT else @as(c_uint, 0)));
                if ((keycode != 0) and (@as(SDL_Keycode, @bitCast(@as(c_int, @intFromBool(keycode < @as(SDL_Keycode, 128))))) != 0)) {
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
                attachment.*.last_key = 0;
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            35 => {
                text = [1]u8{
                    @truncate(keycode),
                } ++ @as([1]u8, @splat(0));
                SDL_SendKeyboardText(@ptrCast(@alignCast(&text)));
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
                digit = (@as(c_int, bytes[@as(c_int, 2)]) - SDL_SCANCODE_KP_1) + @as(c_int, 1);
                if ((digit < @as(c_int, 1)) or (digit > @as(c_int, 10))) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
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
                    sdl_pc = 28;
                    continue;
                }
            },
            41 => {
                attachment.*.altcode_digit = -@as(c_int, 1);
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            42 => {
                attachment.*.altcode_digit += 1;
                attachment.*.altcode *%= 10;
                if (digit < @as(c_int, 10)) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            43 => {
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            44 => {
                attachment.*.altcode +%= @bitCast(@as(c_int, digit));
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
                    sdl_pc = 43;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn GIP_HandleCommandExtended(attachment: [*c]GIP_Attachment, header: [*c]const GIP_Header, bytes: [*c]const Uint8, num_bytes: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var serial: [33]u8 = undefined;
    _ = &serial;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                serial = [1]u8{
                    0,
                } ++ @as([32]u8, @splat(0));
                if (num_bytes < @as(c_int, 2)) {
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
                switch (@as(c_int, bytes[@as(c_int, 0)])) {
                    GIP_EXTCMD_GET_SERIAL_NUMBER => {
                        sdl_pc = 5;
                        continue;
                    },
                    else => {
                        sdl_pc = 12;
                        continue;
                    },
                }
            },
            4 => {
                return @"true" != 0;
            },
            5 => {
                if (@as(c_int, bytes[@as(c_int, 1)]) != GIP_EXTENDED_STATUS_OK) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 7;
                    continue;
                }
            },
            6 => {
                return @"true" != 0;
            },
            7 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            8 => {
                if ((@as(c_int, header.*.flags) & GIP_FLAG_ATTACHMENT_MASK) != 0) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
            },
            9 => {
                return @"true" != 0;
            },
            10 => {
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                _ = memcpy(@ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&serial))))), @ptrCast(@alignCast(&bytes[@as(c_int, 2)])), if ((@sizeOf(@TypeOf(serial)) -% @as(c_ulong, 1)) < @as(c_ulong, @bitCast(@as(c_long, num_bytes - @as(c_int, 2))))) @sizeOf(@TypeOf(serial)) -% @as(c_ulong, 1) else @as(c_ulong, @bitCast(@as(c_long, num_bytes - @as(c_int, 2)))));
                HIDAPI_SetDeviceSerial(attachment.*.device.*.device, @ptrCast(@alignCast(&serial)));
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            12 => {
                SDL_LogDebug_REAL(SDL_LOG_CATEGORY_INPUT, "GIP: Extended message type %02x", bytes[@as(c_int, 0)]);
                return @"false" != 0;
            },
            else => unreachable,
        }
    }
}
pub fn GIP_HandleNavigationReport(attachment: [*c]GIP_Attachment, joystick: [*c]SDL_Joystick, timestamp: Uint64, bytes: [*c]const Uint8, _: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (@as(c_int, attachment.*.last_input[@as(c_int, 0)]) != @as(c_int, bytes[@as(c_int, 0)])) {
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_START, (@as(c_int, bytes[@as(c_int, 0)]) & @as(c_int, 4)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_BACK, (@as(c_int, bytes[@as(c_int, 0)]) & @as(c_int, 8)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SOUTH, (@as(c_int, bytes[@as(c_int, 0)]) & @as(c_int, 16)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_EAST, (@as(c_int, bytes[@as(c_int, 0)]) & @as(c_int, 32)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_WEST, (@as(c_int, bytes[@as(c_int, 0)]) & @as(c_int, 64)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_NORTH, (@as(c_int, bytes[@as(c_int, 0)]) & @as(c_int, 128)) != @as(c_int, 0));
    }
    if (@as(c_int, attachment.*.last_input[@as(c_int, 1)]) != @as(c_int, bytes[@as(c_int, 1)])) {
        var hat: Uint8 = 0;
        _ = &hat;
        if ((@as(c_int, bytes[@as(c_int, 1)]) & @as(c_int, 1)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_UP);
            }
        }
        if ((@as(c_int, bytes[@as(c_int, 1)]) & @as(c_int, 2)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_DOWN);
            }
        }
        if ((@as(c_int, bytes[@as(c_int, 1)]) & @as(c_int, 4)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_LEFT);
            }
        }
        if ((@as(c_int, bytes[@as(c_int, 1)]) & @as(c_int, 8)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_RIGHT);
            }
        }
        SDL_SendJoystickHat(timestamp, joystick, 0, hat);
        if (attachment.*.attachment_type == GIP_TYPE_ARCADE_STICK) {
            SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER, (@as(c_int, bytes[@as(c_int, 1)]) & @as(c_int, 16)) != @as(c_int, 0));
            SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_SHOULDER, (@as(c_int, bytes[@as(c_int, 1)]) & @as(c_int, 32)) != @as(c_int, 0));
        } else {
            SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_SHOULDER, (@as(c_int, bytes[@as(c_int, 1)]) & @as(c_int, 16)) != @as(c_int, 0));
            SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER, (@as(c_int, bytes[@as(c_int, 1)]) & @as(c_int, 32)) != @as(c_int, 0));
        }
    }
}
pub fn GIP_HandleGamepadReport(_: [*c]GIP_Attachment, joystick: [*c]SDL_Joystick, timestamp: Uint64, bytes: [*c]const Uint8, _: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var axis: Sint16 = undefined;
    _ = &axis;
    SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_STICK, (@as(c_int, bytes[@as(c_int, 1)]) & @as(c_int, 64)) != @as(c_int, 0));
    SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_STICK, (@as(c_int, bytes[@as(c_int, 1)]) & @as(c_int, 128)) != @as(c_int, 0));
    axis = bytes[@as(c_int, 2)];
    {
        const ref = &axis;
        ref.* = @truncate(@as(c_int, ref.*) | (@as(c_int, bytes[@as(c_int, 3)]) << @intCast(@as(c_int, 8))));
    }
    axis = @truncate(if (@as(c_int, axis) < @as(c_int, 0)) @as(c_int, 0) else if (@as(c_int, axis) > @as(c_int, 1023)) @as(c_int, 1023) else @as(c_int, axis));
    axis = @truncate((@as(c_int, axis) - @as(c_int, 512)) * @as(c_int, 64));
    if (@as(c_int, axis) == @as(c_int, 32704)) {
        axis = 32767;
    }
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFT_TRIGGER, axis);
    axis = bytes[@as(c_int, 4)];
    {
        const ref = &axis;
        ref.* = @truncate(@as(c_int, ref.*) | (@as(c_int, bytes[@as(c_int, 5)]) << @intCast(@as(c_int, 8))));
    }
    axis = @truncate(if (@as(c_int, axis) < @as(c_int, 0)) @as(c_int, 0) else if (@as(c_int, axis) > @as(c_int, 1023)) @as(c_int, 1023) else @as(c_int, axis));
    axis = @truncate((@as(c_int, axis) - @as(c_int, 512)) * @as(c_int, 64));
    if (@as(c_int, axis) == @as(c_int, 32704)) {
        axis = 32767;
    }
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHT_TRIGGER, axis);
    axis = bytes[@as(c_int, 6)];
    {
        const ref = &axis;
        ref.* = @truncate(@as(c_int, ref.*) | (@as(c_int, bytes[@as(c_int, 7)]) << @intCast(@as(c_int, 8))));
    }
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, axis);
    axis = bytes[@as(c_int, 8)];
    {
        const ref = &axis;
        ref.* = @truncate(@as(c_int, ref.*) | (@as(c_int, bytes[@as(c_int, 9)]) << @intCast(@as(c_int, 8))));
    }
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, @truncate(~@as(c_int, axis)));
    axis = bytes[@as(c_int, 10)];
    {
        const ref = &axis;
        ref.* = @truncate(@as(c_int, ref.*) | (@as(c_int, bytes[@as(c_int, 11)]) << @intCast(@as(c_int, 8))));
    }
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, axis);
    axis = bytes[@as(c_int, 12)];
    {
        const ref = &axis;
        ref.* = @truncate(@as(c_int, ref.*) | (@as(c_int, bytes[@as(c_int, 13)]) << @intCast(@as(c_int, 8))));
    }
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, @truncate(~@as(c_int, axis)));
}
pub fn GIP_HandleGuitarReport(_: [*c]GIP_Attachment, joystick: [*c]SDL_Joystick, timestamp: Uint64, bytes: [*c]const Uint8, arg_num_bytes: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var num_bytes = arg_num_bytes;
    _ = &num_bytes;
    const static_local_s_GuitarButtons = struct {
        var s_GuitarButtons: [11]u16 = [11]u16{
            16,
            32,
            64,
            128,
            8,
            0,
            4,
            0,
            16384,
            4096,
            0,
        };
    };
    _ = &static_local_s_GuitarButtons;
    var btnidx: Uint8 = 0;
    _ = &btnidx;
    var hat: Uint8 = 0;
    _ = &hat;
    var buttons: u16 = @bitCast(@as(c_short, @truncate(@as(c_int, bytes[@as(c_int, 0)]) | (@as(c_int, bytes[@as(c_int, 1)]) << @intCast(@as(c_int, 8))))));
    _ = &buttons;
    if (num_bytes >= @as(c_int, 10)) {
        {
            btnidx = 0;
            while (@as(c_ulong, @bitCast(@as(c_long, @as(c_int, btnidx)))) < (@sizeOf(@TypeOf(static_local_s_GuitarButtons.s_GuitarButtons)) / @sizeOf(@TypeOf(static_local_s_GuitarButtons.s_GuitarButtons[@as(c_int, 0)])))) : (btnidx +%= 1) {
                var button_mask: u16 = static_local_s_GuitarButtons.s_GuitarButtons[btnidx];
                _ = &button_mask;
                if (!(@as(c_int, button_mask) != 0)) {
                    continue;
                }
                var down: bool = (@as(c_int, buttons) & @as(c_int, button_mask)) != @as(c_int, 0);
                _ = &down;
                SDL_SendJoystickButton(timestamp, joystick, btnidx, down);
            }
        }
        if ((@as(c_int, buttons) & @as(c_int, 256)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_UP);
            }
        }
        if ((@as(c_int, buttons) & @as(c_int, 512)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_DOWN);
            }
        }
        if ((@as(c_int, buttons) & @as(c_int, 1024)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_LEFT);
            }
        }
        if ((@as(c_int, buttons) & @as(c_int, 2048)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_RIGHT);
            }
        }
        SDL_SendJoystickHat(timestamp, joystick, 0, hat);
        SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, @truncate((@as(c_int, bytes[@as(c_int, 3)]) * @as(c_int, 257)) - @as(c_int, 32768)));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER, @as(c_int, bytes[@as(c_int, 2)]) >= @as(c_int, 208));
        SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFT_TRIGGER, @truncate(if (bytes[@as(c_int, 6)] != 0) @as(c_int, 32767) else -@as(c_int, 32768)));
        const static_local_effects_mappings = struct {
            const effects_mappings: [5]Sint16 = [5]Sint16{
                @truncate(-@as(c_int, 26880)),
                @truncate(-@as(c_int, 13568)),
                @truncate(-@as(c_int, 1792)),
                11008,
                24576,
            };
        };
        _ = &static_local_effects_mappings;
        SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, static_local_effects_mappings.effects_mappings[@bitCast(@as(isize, @intCast(@as(c_int, bytes[@as(c_int, 4)]) >> @intCast(@as(c_int, 4)))))]);
    }
}
pub fn GIP_HandleDrumKitReport(_: [*c]GIP_Attachment, joystick: [*c]SDL_Joystick, timestamp: Uint64, bytes: [*c]const Uint8, arg_num_bytes: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var num_bytes = arg_num_bytes;
    _ = &num_bytes;
    var hat: Uint8 = 0;
    _ = &hat;
    var buttons: u16 = @bitCast(@as(c_short, @truncate(@as(c_int, bytes[@as(c_int, 0)]) | (@as(c_int, bytes[@as(c_int, 1)]) << @intCast(@as(c_int, 8))))));
    _ = &buttons;
    if (num_bytes >= @as(c_int, 6)) {
        if (((@as(c_int, buttons) & @as(c_int, 256)) != 0) or ((@as(c_int, bytes[@as(c_int, 4)]) & @as(c_int, 240)) != 0)) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_UP);
            }
        }
        if (((@as(c_int, buttons) & @as(c_int, 512)) != 0) or ((@as(c_int, bytes[@as(c_int, 4)]) & @as(c_int, 15)) != 0)) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_DOWN);
            }
        }
        if ((@as(c_int, buttons) & @as(c_int, 1024)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_LEFT);
            }
        }
        if ((@as(c_int, buttons) & @as(c_int, 2048)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_RIGHT);
            }
        }
        SDL_SendJoystickHat(timestamp, joystick, 0, hat);
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_BACK, (@as(c_int, buttons) & @as(c_int, 8)) != 0);
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_START, (@as(c_int, buttons) & @as(c_int, 4)) != 0);
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_SHOULDER, (@as(c_int, buttons) & @as(c_int, 4096)) != 0);
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER, (@as(c_int, buttons) & @as(c_int, 8192)) != 0);
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SOUTH, (((@as(c_int, bytes[@as(c_int, 3)]) & @as(c_int, 15)) != 0) or ((@as(c_int, bytes[@as(c_int, 5)]) & @as(c_int, 240)) != 0)) or ((@as(c_int, buttons) & @as(c_int, 16)) != 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_EAST, ((@as(c_int, bytes[@as(c_int, 2)]) & @as(c_int, 240)) != 0) or ((@as(c_int, buttons) & @as(c_int, 32)) != 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_WEST, (((@as(c_int, bytes[@as(c_int, 3)]) & @as(c_int, 240)) != 0) or ((@as(c_int, bytes[@as(c_int, 4)]) & @as(c_int, 15)) != 0)) or ((@as(c_int, buttons) & @as(c_int, 64)) != 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_NORTH, (((@as(c_int, bytes[@as(c_int, 2)]) & @as(c_int, 15)) != 0) or ((@as(c_int, bytes[@as(c_int, 4)]) & @as(c_int, 240)) != 0)) or ((@as(c_int, buttons) & @as(c_int, 128)) != 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_STICK, (@as(c_int, bytes[@as(c_int, 2)]) != 0) or (@as(c_int, bytes[@as(c_int, 3)]) != 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_STICK, (@as(c_int, bytes[@as(c_int, 4)]) != 0) or (@as(c_int, bytes[@as(c_int, 5)]) != 0));
    }
}
pub fn GIP_HandleArcadeStickReport(_: [*c]GIP_Attachment, joystick: [*c]SDL_Joystick, timestamp: Uint64, bytes: [*c]const Uint8, arg_num_bytes: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var num_bytes = arg_num_bytes;
    _ = &num_bytes;
    var axis: Sint16 = undefined;
    _ = &axis;
    axis = bytes[@as(c_int, 2)];
    {
        const ref = &axis;
        ref.* = @truncate(@as(c_int, ref.*) | (@as(c_int, bytes[@as(c_int, 3)]) << @intCast(@as(c_int, 8))));
    }
    axis = @truncate(if (@as(c_int, axis) < @as(c_int, 0)) @as(c_int, 0) else if (@as(c_int, axis) > @as(c_int, 1023)) @as(c_int, 1023) else @as(c_int, axis));
    axis = @truncate((@as(c_int, axis) - @as(c_int, 512)) * @as(c_int, 64));
    if (@as(c_int, axis) == @as(c_int, 32704)) {
        axis = 32767;
    }
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFT_TRIGGER, axis);
    axis = bytes[@as(c_int, 4)];
    {
        const ref = &axis;
        ref.* = @truncate(@as(c_int, ref.*) | (@as(c_int, bytes[@as(c_int, 5)]) << @intCast(@as(c_int, 8))));
    }
    axis = @truncate(if (@as(c_int, axis) < @as(c_int, 0)) @as(c_int, 0) else if (@as(c_int, axis) > @as(c_int, 1023)) @as(c_int, 1023) else @as(c_int, axis));
    axis = @truncate((@as(c_int, axis) - @as(c_int, 512)) * @as(c_int, 64));
    if (@as(c_int, axis) == @as(c_int, 32704)) {
        axis = 32767;
    }
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHT_TRIGGER, axis);
    if (num_bytes >= @as(c_int, 19)) {
        SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHT_TRIGGER, @truncate(if ((@as(c_int, bytes[@as(c_int, 18)]) & @as(c_int, 64)) != 0) @as(c_int, 32767) else -@as(c_int, 32768)));
        SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFT_TRIGGER, @truncate(if ((@as(c_int, bytes[@as(c_int, 18)]) & @as(c_int, 128)) != 0) @as(c_int, 32767) else -@as(c_int, 32768)));
    }
}
pub fn GIP_HandleFlightStickReport(attachment: [*c]GIP_Attachment, joystick: [*c]SDL_Joystick, timestamp: Uint64, bytes: [*c]const Uint8, num_bytes: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var axis: Sint16 = undefined;
    _ = &axis;
    var i: c_int = undefined;
    _ = &i;
    if (num_bytes < @as(c_int, 19)) {
        return;
    }
    if (@as(c_int, attachment.*.last_input[@as(c_int, 2)]) != @as(c_int, bytes[@as(c_int, 2)])) {
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_STICK, (@as(c_int, bytes[@as(c_int, 2)]) & @as(c_int, 1)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_STICK, (@as(c_int, bytes[@as(c_int, 2)]) & @as(c_int, 2)) != @as(c_int, 0));
    }
    {
        i = 0;
        while (i < attachment.*.extra_buttons) {
            if (@as(c_int, attachment.*.last_input[@bitCast(@as(isize, @intCast(@divTrunc(i, @as(c_int, 8)) + @as(c_int, 3))))]) != @as(c_int, bytes[@bitCast(@as(isize, @intCast(@divTrunc(i, @as(c_int, 8)) + @as(c_int, 3))))])) {
                while (i < attachment.*.extra_buttons) : (i += 1) {
                    SDL_SendJoystickButton(timestamp, joystick, @bitCast(@as(i8, @truncate(@as(c_int, attachment.*.extra_button_idx) + i))), (@as(c_uint, @bitCast(@as(c_int, @as(c_int, bytes[@bitCast(@as(isize, @intCast(@divTrunc(i, @as(c_int, 8)) + @as(c_int, 3))))])))) & (@as(c_uint, 1) << @intCast(@as(c_uint, @bitCast(@as(c_int, i)))))) != @as(c_uint, 0));
                }
            } else {
                i += 8;
            }
        }
    }
    axis = bytes[@as(c_int, 11)];
    {
        const ref = &axis;
        ref.* = @truncate(@as(c_int, ref.*) | (@as(c_int, bytes[@as(c_int, 12)]) << @intCast(@as(c_int, 8))));
    }
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, axis);
    axis = bytes[@as(c_int, 13)];
    {
        const ref = &axis;
        ref.* = @truncate(@as(c_int, ref.*) | (@as(c_int, bytes[@as(c_int, 14)]) << @intCast(@as(c_int, 8))));
    }
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, axis);
    axis = bytes[@as(c_int, 15)];
    {
        const ref = &axis;
        ref.* = @truncate(@as(c_int, ref.*) | (@as(c_int, bytes[@as(c_int, 16)]) << @intCast(@as(c_int, 8))));
    }
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, axis);
    axis = @truncate((@as(c_int, bytes[@as(c_int, 18)]) << @intCast(@as(c_int, 8))) - @as(c_int, 32768));
    {
        const ref = &axis;
        ref.* = @truncate(@as(c_int, ref.*) | @as(c_int, bytes[@as(c_int, 17)]));
    }
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFT_TRIGGER, axis);
    {
        i = 0;
        while (i < attachment.*.extra_axes) : (i += 1) {
            if ((@as(c_int, 20) + (i * @as(c_int, 2))) >= num_bytes) {
                return;
            }
            axis = @truncate((@as(c_int, bytes[@bitCast(@as(isize, @intCast(@as(c_int, 20) + (i * @as(c_int, 2)))))]) << @intCast(@as(c_int, 8))) - @as(c_int, 32768));
            {
                const ref = &axis;
                ref.* = @truncate(@as(c_int, ref.*) | @as(c_int, bytes[@bitCast(@as(isize, @intCast(@as(c_int, 19) + (i * @as(c_int, 2)))))]));
            }
            SDL_SendJoystickAxis(timestamp, joystick, @bitCast(@as(i8, @truncate(SDL_GAMEPAD_AXIS_RIGHT_TRIGGER + i))), axis);
        }
    }
}
pub fn GIP_HandleLLInputReport(attachment: [*c]GIP_Attachment, _: [*c]const GIP_Header, bytes: [*c]const Uint8, arg_num_bytes: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var num_bytes = arg_num_bytes;
    _ = &num_bytes;
    var timestamp: Uint64 = undefined;
    _ = &timestamp;
    var joystick: [*c]SDL_Joystick = undefined;
    _ = &joystick;
    var clear: bool = undefined;
    _ = &clear;
    var profile_offset: c_int = undefined;
    _ = &profile_offset;
    var function_map_offset: c_int = undefined;
    _ = &function_map_offset;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                timestamp = SDL_GetTicksNS_REAL();
                joystick = null;
                if (attachment.*.device.*.device.*.num_joysticks < @as(c_int, 1)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                _ = GIP_EnsureMetadata(attachment);
                if ((attachment.*.got_metadata != @as(GIP_MetadataStatus, GIP_METADATA_GOT)) and (attachment.*.got_metadata != @as(GIP_MetadataStatus, GIP_METADATA_FAKED))) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
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
                joystick = SDL_GetJoystickFromID_REAL(attachment.*.joystick);
                if (!(joystick != null)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            4 => {
                return @"true" != 0;
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
                return @"false" != 0;
            },
            8 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                if (attachment.*.device_state != GIP_STATE_START) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                SDL_LogDebug_REAL(SDL_LOG_CATEGORY_INPUT, "GIP: Discarding early input report");
                attachment.*.device_state = GIP_STATE_START;
                return @"true" != 0;
            },
            11 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                if (num_bytes < @as(c_int, 6)) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            13 => {
                SDL_LogDebug_REAL(SDL_LOG_CATEGORY_INPUT, "GIP: Discarding too-short input report");
                return @"false" != 0;
            },
            14 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                GIP_HandleNavigationReport(attachment, joystick, timestamp, bytes, num_bytes);
                switch (attachment.*.attachment_type) {
                    GIP_TYPE_GAMEPAD => {
                        sdl_pc = 17;
                        continue;
                    },
                    GIP_TYPE_ARCADE_STICK => {
                        sdl_pc = 19;
                        continue;
                    },
                    GIP_TYPE_FLIGHT_STICK => {
                        sdl_pc = 20;
                        continue;
                    },
                    GIP_TYPE_GUITAR => {
                        sdl_pc = 21;
                        continue;
                    },
                    GIP_TYPE_DRUM_KIT => {
                        sdl_pc = 22;
                        continue;
                    },
                    else => {
                        sdl_pc = 18;
                        continue;
                    },
                }
            },
            16 => {
                if ((attachment.*.features & (@as(c_uint, 1) << @intCast(@as(c_uint, 2)))) != 0) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
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
                GIP_HandleGamepadReport(attachment, joystick, timestamp, bytes, num_bytes);
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            19 => {
                GIP_HandleArcadeStickReport(attachment, joystick, timestamp, bytes, num_bytes);
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            20 => {
                GIP_HandleFlightStickReport(attachment, joystick, timestamp, bytes, num_bytes);
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            21 => {
                GIP_HandleGuitarReport(attachment, joystick, timestamp, bytes, num_bytes);
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            22 => {
                GIP_HandleDrumKitReport(attachment, joystick, timestamp, bytes, num_bytes);
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            23 => {
                clear = @"false" != 0;
                if ((((attachment.*.xbe_format == @as(GIP_EliteButtonFormat, GIP_BTN_FMT_XBE1)) and (num_bytes > GIP_BTN_OFFSET_XBE1)) and (@as(c_int, attachment.*.last_input[GIP_BTN_OFFSET_XBE1]) != @as(c_int, bytes[GIP_BTN_OFFSET_XBE1]))) and ((@as(c_int, bytes[GIP_BTN_OFFSET_XBE1]) & @as(c_int, 16)) != 0)) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
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
                if (((attachment.*.features & (@as(c_uint, 1) << @intCast(@as(c_uint, 0)))) != 0) and (@as(Uint32, @bitCast(@as(c_int, @intFromBool(num_bytes >= @as(c_int, 23))))) != 0)) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            26 => {
                SDL_SendJoystickButton(timestamp, joystick, attachment.*.paddle_idx, (@as(c_int, bytes[GIP_BTN_OFFSET_XBE1]) & @as(c_int, 2)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, @bitCast(@as(i8, @truncate(@as(c_int, attachment.*.paddle_idx) + @as(c_int, 1)))), (@as(c_int, bytes[GIP_BTN_OFFSET_XBE1]) & @as(c_int, 8)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, @bitCast(@as(i8, @truncate(@as(c_int, attachment.*.paddle_idx) + @as(c_int, 2)))), (@as(c_int, bytes[GIP_BTN_OFFSET_XBE1]) & @as(c_int, 1)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, @bitCast(@as(i8, @truncate(@as(c_int, attachment.*.paddle_idx) + @as(c_int, 3)))), (@as(c_int, bytes[GIP_BTN_OFFSET_XBE1]) & @as(c_int, 4)) != @as(c_int, 0));
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            27 => {
                if (((attachment.*.xbe_format == @as(GIP_EliteButtonFormat, GIP_BTN_FMT_XBE2_4)) or (attachment.*.xbe_format == @as(GIP_EliteButtonFormat, GIP_BTN_FMT_XBE2_5))) and (num_bytes > GIP_BTN_OFFSET_XBE2)) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            28 => {
                if (clear) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
                    continue;
                }
            },
            29 => {
                profile_offset = if (attachment.*.xbe_format == @as(GIP_EliteButtonFormat, GIP_BTN_FMT_XBE2_4)) @as(c_int, 15) else @as(c_int, 20);
                if ((@as(c_int, attachment.*.last_input[GIP_BTN_OFFSET_XBE2]) != @as(c_int, bytes[GIP_BTN_OFFSET_XBE2])) or (@as(c_int, attachment.*.last_input[@bitCast(@as(isize, @intCast(profile_offset)))]) != @as(c_int, bytes[@bitCast(@as(isize, @intCast(profile_offset)))]))) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            30 => {
                clear = @"true" != 0;
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
                if ((@as(c_int, bytes[@bitCast(@as(isize, @intCast(profile_offset)))]) & @as(c_int, 3)) != 0) {
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
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            35 => {
                clear = @"true" != 0;
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            36 => {
                SDL_SendJoystickButton(timestamp, joystick, attachment.*.paddle_idx, (@as(c_int, bytes[GIP_BTN_OFFSET_XBE2]) & @as(c_int, 1)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, @bitCast(@as(i8, @truncate(@as(c_int, attachment.*.paddle_idx) + @as(c_int, 1)))), (@as(c_int, bytes[GIP_BTN_OFFSET_XBE2]) & @as(c_int, 2)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, @bitCast(@as(i8, @truncate(@as(c_int, attachment.*.paddle_idx) + @as(c_int, 2)))), (@as(c_int, bytes[GIP_BTN_OFFSET_XBE2]) & @as(c_int, 4)) != @as(c_int, 0));
                SDL_SendJoystickButton(timestamp, joystick, @bitCast(@as(i8, @truncate(@as(c_int, attachment.*.paddle_idx) + @as(c_int, 3)))), (@as(c_int, bytes[GIP_BTN_OFFSET_XBE2]) & @as(c_int, 8)) != @as(c_int, 0));
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
                SDL_SendJoystickButton(timestamp, joystick, attachment.*.paddle_idx, @as(c_int, 0) != 0);
                SDL_SendJoystickButton(timestamp, joystick, @bitCast(@as(i8, @truncate(@as(c_int, attachment.*.paddle_idx) + @as(c_int, 1)))), @as(c_int, 0) != 0);
                SDL_SendJoystickButton(timestamp, joystick, @bitCast(@as(i8, @truncate(@as(c_int, attachment.*.paddle_idx) + @as(c_int, 2)))), @as(c_int, 0) != 0);
                SDL_SendJoystickButton(timestamp, joystick, @bitCast(@as(i8, @truncate(@as(c_int, attachment.*.paddle_idx) + @as(c_int, 3)))), @as(c_int, 0) != 0);
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
                    sdl_pc = 25;
                    continue;
                }
            },
            41 => {
                function_map_offset = -@as(c_int, 1);
                if ((attachment.*.features & (@as(c_uint, 1) << @intCast(@as(c_uint, 3)))) != 0) {
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
                _ = memcpy(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&attachment.*.last_input))))), @ptrCast(@alignCast(bytes)), if (@as(c_ulong, @bitCast(@as(c_long, num_bytes))) < @sizeOf(@TypeOf(attachment.*.last_input))) @as(c_ulong, @bitCast(@as(c_long, num_bytes))) else @sizeOf(@TypeOf(attachment.*.last_input)));
                return @"true" != 0;
            },
            44 => {
                if (num_bytes >= @as(c_int, 40)) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            45 => {
                function_map_offset = num_bytes - @as(c_int, 18);
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            46 => {
                if (function_map_offset >= @as(c_int, 5)) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            47 => {
                function_map_offset = num_bytes - @as(c_int, 26);
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
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            50 => {
                if (@as(c_int, attachment.*.last_input[@bitCast(@as(isize, @intCast(function_map_offset)))]) != @as(c_int, bytes[@bitCast(@as(isize, @intCast(function_map_offset)))])) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 54;
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
                    sdl_pc = 43;
                    continue;
                }
            },
            53 => {
                SDL_SendJoystickButton(timestamp, joystick, attachment.*.share_button_idx, (@as(c_int, bytes[@bitCast(@as(isize, @intCast(function_map_offset)))]) & @as(c_int, 1)) != @as(c_int, 0));
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
                    sdl_pc = 52;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn GIP_HandleLLStaticConfiguration(_: [*c]GIP_Attachment, _: [*c]const GIP_Header, _: [*c]const Uint8, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    SDL_LogDebug_REAL(SDL_LOG_CATEGORY_INPUT, "GIP: Unimplemented Static Configuration message");
    return @"false" != 0;
}
pub fn GIP_HandleLLButtonInfoReport(_: [*c]GIP_Attachment, _: [*c]const GIP_Header, _: [*c]const Uint8, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    SDL_LogDebug_REAL(SDL_LOG_CATEGORY_INPUT, "GIP: Unimplemented Button Info Report message");
    return @"false" != 0;
}
pub fn GIP_HandleLLOverflowInputReport(_: [*c]GIP_Attachment, _: [*c]const GIP_Header, _: [*c]const Uint8, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    SDL_LogDebug_REAL(SDL_LOG_CATEGORY_INPUT, "GIP: Unimplemented Overflow Input Report message");
    return @"false" != 0;
}
pub fn GIP_HandleAudioData(_: [*c]GIP_Attachment, _: [*c]const GIP_Header, _: [*c]const Uint8, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    SDL_LogDebug_REAL(SDL_LOG_CATEGORY_INPUT, "GIP: Unimplemented Audio Data message");
    return @"false" != 0;
}
pub fn GIP_HandleSystemMessage(attachment: [*c]GIP_Attachment, header: [*c]const GIP_Header, bytes: [*c]const Uint8, num_bytes: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if ((@as(c_int, attachment.*.attachment_index) > @as(c_int, 0)) and (attachment.*.attachment_type == GIP_TYPE_UNKNOWN)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                if ((@as(c_int, header.*.message_type) == GIP_CMD_HID_REPORT) and (num_bytes == @as(c_int, 8))) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
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
                if (!GIP_SupportsSystemMessage(attachment, header.*.message_type, @"true" != 0)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            4 => {
                if (!(attachment.*.keyboard != 0)) {
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
                attachment.*.keyboard = @truncate(@as(usize, @intCast(@intFromPtr(attachment))));
                SDL_AddKeyboard(attachment.*.keyboard, "Xbox One Chatpad");
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
                attachment.*.attachment_type = GIP_TYPE_CHATPAD;
                attachment.*.metadata.device.in_system_messages[@as(c_int, 0)] |= @as(c_uint, 1) << @intCast(@as(c_uint, GIP_CMD_HID_REPORT));
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            10 => {
                SDL_LogWarn_REAL(SDL_LOG_CATEGORY_INPUT, "GIP: Received claimed-unsupported system message type %02x", header.*.message_type);
                return @"false" != 0;
            },
            11 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                switch (@as(c_int, header.*.message_type)) {
                    GIP_CMD_PROTO_CONTROL => {
                        sdl_pc = 14;
                        continue;
                    },
                    GIP_CMD_HELLO_DEVICE => {
                        sdl_pc = 15;
                        continue;
                    },
                    GIP_CMD_STATUS_DEVICE => {
                        sdl_pc = 16;
                        continue;
                    },
                    GIP_CMD_METADATA => {
                        sdl_pc = 17;
                        continue;
                    },
                    GIP_CMD_SECURITY => {
                        sdl_pc = 18;
                        continue;
                    },
                    GIP_CMD_GUIDE_BUTTON => {
                        sdl_pc = 19;
                        continue;
                    },
                    GIP_CMD_AUDIO_CONTROL => {
                        sdl_pc = 20;
                        continue;
                    },
                    GIP_CMD_FIRMWARE => {
                        sdl_pc = 21;
                        continue;
                    },
                    GIP_CMD_HID_REPORT => {
                        sdl_pc = 22;
                        continue;
                    },
                    GIP_CMD_EXTENDED => {
                        sdl_pc = 23;
                        continue;
                    },
                    GIP_AUDIO_DATA => {
                        sdl_pc = 24;
                        continue;
                    },
                    else => {
                        sdl_pc = 25;
                        continue;
                    },
                }
            },
            13 => {
                return undefined;
            },
            14 => {
                return GIP_HandleCommandProtocolControl(attachment, header, bytes, num_bytes);
            },
            15 => {
                return GIP_HandleCommandHelloDevice(attachment, header, bytes, num_bytes);
            },
            16 => {
                return GIP_HandleCommandStatusDevice(attachment, header, bytes, num_bytes);
            },
            17 => {
                return GIP_HandleCommandMetadataRespose(attachment, header, bytes, num_bytes);
            },
            18 => {
                return GIP_HandleCommandSecurity(attachment, header, bytes, num_bytes);
            },
            19 => {
                return GIP_HandleCommandGuideButtonStatus(attachment, header, bytes, num_bytes);
            },
            20 => {
                return GIP_HandleCommandAudioControl(attachment, header, bytes, num_bytes);
            },
            21 => {
                return GIP_HandleCommandFirmware(attachment, header, bytes, num_bytes);
            },
            22 => {
                return GIP_HandleCommandHidReport(attachment, header, bytes, num_bytes);
            },
            23 => {
                return GIP_HandleCommandExtended(attachment, header, bytes, num_bytes);
            },
            24 => {
                return GIP_HandleAudioData(attachment, header, bytes, num_bytes);
            },
            25 => {
                SDL_LogWarn_REAL(SDL_LOG_CATEGORY_INPUT, "GIP: Received unknown system message type %02x", header.*.message_type);
                return @"false" != 0;
            },
            else => unreachable,
        }
    }
}
pub fn GIP_EnsureAttachment(device: [*c]GIP_Device, attachment_index: Uint8) callconv(.c) [*c]GIP_Attachment {
    @setEvalBranchQuota(100000);
    var attachment: [*c]GIP_Attachment = device.*.attachments[attachment_index];
    _ = &attachment;
    if (!(attachment != null)) {
        attachment = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(attachment.*)))));
        attachment.*.attachment_index = attachment_index;
        if (@as(c_int, attachment_index) > @as(c_int, 0)) {
            attachment.*.attachment_type = GIP_TYPE_UNKNOWN;
        }
        attachment.*.device = device;
        attachment.*.metadata.device.in_system_messages[@as(c_int, 0)] = GIP_DEFAULT_IN_SYSTEM_MESSAGES;
        attachment.*.metadata.device.out_system_messages[@as(c_int, 0)] = GIP_DEFAULT_OUT_SYSTEM_MESSAGES;
        device.*.attachments[attachment_index] = attachment;
    }
    return attachment;
}
pub fn GIP_HandleMessage(attachment: [*c]GIP_Attachment, header: [*c]const GIP_Header, bytes: [*c]const Uint8, num_bytes: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if ((@as(c_uint, @bitCast(@as(c_int, @as(c_int, header.*.flags)))) & (@as(c_uint, 1) << @intCast(@as(c_uint, 5)))) != 0) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return GIP_HandleSystemMessage(attachment, header, bytes, num_bytes);
            },
            2 => {
                switch (@as(c_int, header.*.message_type)) {
                    GIP_CMD_RAW_REPORT => {
                        sdl_pc = 5;
                        continue;
                    },
                    GIP_LL_INPUT_REPORT => {
                        sdl_pc = 9;
                        continue;
                    },
                    GIP_LL_STATIC_CONFIGURATION => {
                        sdl_pc = 10;
                        continue;
                    },
                    GIP_LL_BUTTON_INFO_REPORT => {
                        sdl_pc = 11;
                        continue;
                    },
                    GIP_LL_OVERFLOW_INPUT_REPORT => {
                        sdl_pc = 12;
                        continue;
                    },
                    else => {
                        sdl_pc = 4;
                        continue;
                    },
                }
            },
            3 => {
                SDL_LogWarn_REAL(SDL_LOG_CATEGORY_INPUT, "GIP: Received unknown vendor message type %02x", header.*.message_type);
                return @"false" != 0;
            },
            4 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            5 => {
                if ((attachment.*.features & (@as(c_uint, 1) << @intCast(@as(c_uint, 2)))) != 0) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 7;
                    continue;
                }
            },
            6 => {
                return GIP_HandleCommandRawReport(attachment, header, bytes, num_bytes);
            },
            7 => {
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
                return GIP_HandleLLInputReport(attachment, header, bytes, num_bytes);
            },
            10 => {
                return GIP_HandleLLStaticConfiguration(attachment, header, bytes, num_bytes);
            },
            11 => {
                return GIP_HandleLLButtonInfoReport(attachment, header, bytes, num_bytes);
            },
            12 => {
                return GIP_HandleLLOverflowInputReport(attachment, header, bytes, num_bytes);
            },
            else => unreachable,
        }
    }
}
pub fn GIP_ReceivePacket(device: [*c]GIP_Device, arg_bytes: [*c]const Uint8, arg_num_bytes: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var bytes = arg_bytes;
    _ = &bytes;
    var num_bytes = arg_num_bytes;
    _ = &num_bytes;
    var header: GIP_Header = undefined;
    _ = &header;
    var offset: c_int = 3;
    _ = &offset;
    var ok: bool = @"true" != 0;
    _ = &ok;
    var fragment_offset: Uint64 = 0;
    _ = &fragment_offset;
    var bytes_remaining: Uint16 = 0;
    _ = &bytes_remaining;
    var is_fragment: bool = undefined;
    _ = &is_fragment;
    var attachment_index: Uint8 = undefined;
    _ = &attachment_index;
    var attachment: [*c]GIP_Attachment = undefined;
    _ = &attachment;
    if (num_bytes < @as(c_int, 5)) {
        return;
    }
    header.message_type = bytes[@as(c_int, 0)];
    header.flags = bytes[@as(c_int, 1)];
    header.sequence_id = bytes[@as(c_int, 2)];
    offset += GIP_DecodeLength(&header.length, &bytes[@bitCast(@as(isize, @intCast(offset)))], num_bytes - offset);
    is_fragment = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, header.flags)))) & (@as(c_uint, 1) << @intCast(@as(c_uint, 7)))) != 0;
    attachment_index = @bitCast(@as(i8, @truncate(@as(c_int, header.flags) & GIP_FLAG_ATTACHMENT_MASK)));
    attachment = GIP_EnsureAttachment(device, attachment_index);
    if (is_fragment) {
        if ((@as(c_uint, @bitCast(@as(c_int, @as(c_int, header.flags)))) & (@as(c_uint, 1) << @intCast(@as(c_uint, 6)))) != 0) {
            var total_length: Uint64 = undefined;
            _ = &total_length;
            if (@as(c_int, attachment.*.fragment_message) != 0) {
                if (attachment.*.fragment_data != null) {
                    SDL_free_REAL(@ptrCast(@alignCast(attachment.*.fragment_data)));
                    attachment.*.fragment_data = null;
                }
            }
            offset += GIP_DecodeLength(&total_length, &bytes[@bitCast(@as(isize, @intCast(offset)))], num_bytes - offset);
            if (total_length > @as(Uint64, MAX_MESSAGE_LENGTH)) {
                return;
            }
            attachment.*.total_length = @truncate(total_length);
            attachment.*.fragment_message = header.message_type;
            if (header.length > @as(Uint64, @bitCast(@as(c_long, num_bytes - offset)))) {
                SDL_LogWarn_REAL(SDL_LOG_CATEGORY_INPUT, "GIP: Received fragment that claims to be %lu bytes, expected %i", header.length, num_bytes - offset);
                return;
            }
            if (header.length > total_length) {
                SDL_LogWarn_REAL(SDL_LOG_CATEGORY_INPUT, "GIP: Received too long fragment, %lu bytes, exceeds %d", header.length, attachment.*.total_length);
                return;
            }
            attachment.*.fragment_data = @ptrCast(@alignCast(SDL_malloc_REAL(attachment.*.total_length)));
            _ = memcpy(@ptrCast(@alignCast(attachment.*.fragment_data)), @ptrCast(@alignCast(&bytes[@bitCast(@as(isize, @intCast(offset)))])), header.length);
            fragment_offset = header.length;
            attachment.*.fragment_offset = @truncate(fragment_offset);
            bytes_remaining = @truncate(@as(Uint64, @bitCast(@as(c_long, @as(c_int, attachment.*.total_length)))) -% fragment_offset);
        } else {
            if (@as(c_int, header.message_type) != @as(c_int, attachment.*.fragment_message)) {
                SDL_LogWarn_REAL(SDL_LOG_CATEGORY_INPUT, "GIP: Received out of sequence message type %02x, expected %02x", header.message_type, attachment.*.fragment_message);
                _ = GIP_FragmentFailed(attachment, &header);
                return;
            }
            offset += GIP_DecodeLength(&fragment_offset, &bytes[@bitCast(@as(isize, @intCast(offset)))], num_bytes - offset);
            if (fragment_offset != @as(Uint64, attachment.*.fragment_offset)) {
                SDL_LogWarn_REAL(SDL_LOG_CATEGORY_INPUT, "GIP: Received out of sequence fragment, (claimed %lu, expected %d)", fragment_offset, attachment.*.fragment_offset);
                _ = GIP_Acknowledge(device, &header, attachment.*.fragment_offset, @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, attachment.*.total_length)))) -% attachment.*.fragment_offset));
                return;
            } else if ((fragment_offset +% header.length) > @as(Uint64, @bitCast(@as(c_long, @as(c_int, attachment.*.total_length))))) {
                SDL_LogWarn_REAL(SDL_LOG_CATEGORY_INPUT, "GIP: Received too long fragment, %lu exceeds %d", fragment_offset +% header.length, attachment.*.total_length);
                _ = GIP_FragmentFailed(attachment, &header);
                return;
            }
            bytes_remaining = @bitCast(@as(c_short, @truncate(@as(c_int, attachment.*.total_length) - @as(c_int, @as(Uint16, @truncate(fragment_offset +% header.length))))));
            if (header.length != @as(Uint64, 0)) {
                _ = memcpy(@ptrCast(@alignCast(&attachment.*.fragment_data[fragment_offset])), @ptrCast(@alignCast(&bytes[@bitCast(@as(isize, @intCast(offset)))])), header.length);
            } else {
                ok = GIP_HandleMessage(attachment, &header, attachment.*.fragment_data, attachment.*.total_length);
                if (attachment.*.fragment_data != null) {
                    SDL_free_REAL(@ptrCast(@alignCast(attachment.*.fragment_data)));
                    attachment.*.fragment_data = null;
                }
                attachment.*.fragment_message = 0;
            }
            fragment_offset +%= header.length;
            attachment.*.fragment_offset = @as(Uint16, @truncate(fragment_offset));
        }
        attachment.*.fragment_timer = SDL_GetTicks_REAL();
    } else if ((header.length +% @as(Uint64, @bitCast(@as(c_long, offset)))) > @as(Uint64, @bitCast(@as(c_long, num_bytes)))) {
        SDL_LogWarn_REAL(SDL_LOG_CATEGORY_INPUT, "GIP: Received message with erroneous length (claimed %lu, actual %d), discarding", header.length +% @as(Uint64, @bitCast(@as(c_long, offset))), num_bytes);
        return;
    } else {
        num_bytes -= offset;
        bytes += @as(usize, @bitCast(@as(isize, @intCast(offset))));
        fragment_offset = header.length;
        ok = GIP_HandleMessage(attachment, &header, bytes, num_bytes);
    }
    if ((@as(c_uint, @bitCast(@as(c_int, @as(c_int, @intFromBool(ok))))) != 0) and ((@as(c_uint, @bitCast(@as(c_int, @as(c_int, header.flags)))) & (@as(c_uint, 1) << @intCast(@as(c_uint, 4)))) != 0)) {
        _ = GIP_Acknowledge(device, &header, @truncate(fragment_offset), bytes_remaining);
    }
}
pub fn HIDAPI_DriverGIP_RumbleSent(userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]GIP_Attachment = @ptrCast(@alignCast(userdata));
    _ = &ctx;
    ctx.*.rumble_time = SDL_GetTicks_REAL();
}
pub fn HIDAPI_DriverGIP_UpdateRumble(attachment: [*c]GIP_Attachment) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var motor: GIP_DirectMotor = undefined;
    _ = &motor;
    if (!((attachment.*.features & (@as(c_uint, 1) << @intCast(@as(c_uint, 5)))) != 0)) {
        return @"true" != 0;
    }
    if ((@as(Uint64, @bitCast(@as(c_long, @intFromBool(attachment.*.rumble_state == @as(GIP_RumbleState, GIP_RUMBLE_STATE_QUEUED))))) != 0) and (attachment.*.rumble_time != 0)) {
        attachment.*.rumble_state = GIP_RUMBLE_STATE_BUSY;
    }
    if (attachment.*.rumble_state == @as(GIP_RumbleState, GIP_RUMBLE_STATE_BUSY)) {
        const RUMBLE_BUSY_TIME_MS: c_int = 10;
        _ = &RUMBLE_BUSY_TIME_MS;
        if (SDL_GetTicks_REAL() >= (attachment.*.rumble_time +% @as(Uint64, @bitCast(@as(c_long, RUMBLE_BUSY_TIME_MS))))) {
            attachment.*.rumble_time = 0;
            attachment.*.rumble_state = GIP_RUMBLE_STATE_IDLE;
        }
    }
    if (!attachment.*.rumble_pending) {
        return @"true" != 0;
    }
    if (attachment.*.rumble_state != @as(GIP_RumbleState, GIP_RUMBLE_STATE_IDLE)) {
        return @"true" != 0;
    }
    attachment.*.rumble_pending = @"false" != 0;
    motor.motor_bitmap = GIP_MOTOR_ALL;
    motor.left_impulse_level = attachment.*.left_impulse_level;
    motor.right_impulse_level = attachment.*.right_impulse_level;
    motor.left_vibration_level = attachment.*.left_vibration_level;
    motor.right_vibration_level = attachment.*.right_vibration_level;
    motor.duration = @bitCast(@as(i8, @truncate(@divTrunc(SDL_RUMBLE_RESEND_MS, @as(c_int, 10)) + @as(c_int, 5))));
    motor.delay = 0;
    motor.repeat = 0;
    var message: [9]Uint8 = [1]Uint8{
        0,
    } ++ @as([8]Uint8, @splat(0));
    _ = &message;
    _ = memcpy(@ptrCast(@alignCast(&message[@as(c_int, 1)])), @ptrCast(@alignCast(&motor)), @sizeOf(@TypeOf(motor)));
    if (!GIP_SendRawMessage(attachment.*.device, GIP_CMD_DIRECT_MOTOR, attachment.*.attachment_index, GIP_SequenceNext(attachment, GIP_CMD_DIRECT_MOTOR, @"false" != 0), @ptrCast(@alignCast(&message)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(message))))), @"true" != 0, HIDAPI_DriverGIP_RumbleSent, @ptrCast(@alignCast(attachment)))) {
        return SDL_SetError_REAL("Couldn't send rumble packet");
    }
    attachment.*.rumble_state = GIP_RUMBLE_STATE_QUEUED;
    return @"true" != 0;
}
pub fn HIDAPI_DriverGIP_RegisterHints(callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = SDL_AddHintCallback_REAL("SDL_JOYSTICK_HIDAPI_GIP", callback, userdata);
    _ = SDL_AddHintCallback_REAL("SDL_JOYSTICK_HIDAPI_GIP_RESET_FOR_METADATA", callback, userdata);
}
pub fn HIDAPI_DriverGIP_UnregisterHints(callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_RemoveHintCallback_REAL("SDL_JOYSTICK_HIDAPI_GIP", callback, userdata);
    SDL_RemoveHintCallback_REAL("SDL_JOYSTICK_HIDAPI_GIP_RESET_FOR_METADATA", callback, userdata);
}
pub fn HIDAPI_DriverGIP_IsEnabled() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI_GIP", SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI_XBOX_ONE", SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI_XBOX", SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI", @"true" != 0))));
}
pub fn HIDAPI_DriverGIP_IsSupportedDevice(device: [*c]SDL_HIDAPI_Device, _: [*c]const u8, arg_type: SDL_GamepadType, _: Uint16, _: Uint16, _: Uint16, _: c_int, _: c_int, _: c_int, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    if ((device != null) and device.*.is_bluetooth) {
        return @"false" != 0;
    }
    return @"type" == @as(SDL_GamepadType, SDL_GAMEPAD_TYPE_XBOXONE);
}
pub fn HIDAPI_DriverGIP_InitDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]GIP_Device = undefined;
    _ = &ctx;
    var attachment: [*c]GIP_Attachment = undefined;
    _ = &attachment;
    ctx = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(ctx.*)))));
    if (!(ctx != null)) {
        return @"false" != 0;
    }
    ctx.*.device = device;
    ctx.*.reset_for_metadata = SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI_GIP_RESET_FOR_METADATA", @"true" != 0);
    attachment = GIP_EnsureAttachment(ctx, 0);
    GIP_HandleQuirks(attachment);
    if ((attachment.*.quirks & (@as(c_uint, 1) << @intCast(@as(c_uint, 0)))) != 0) {
        ctx.*.got_hello = @"true" != 0;
        _ = GIP_EnsureMetadata(attachment);
    } else {
        ctx.*.hello_deadline = SDL_GetTicks_REAL() +% @as(Uint64, GIP_HELLO_TIMEOUT);
    }
    device.*.context = @ptrCast(@alignCast(ctx));
    device.*.type = SDL_GAMEPAD_TYPE_XBOXONE;
    return @"true" != 0;
}
pub fn HIDAPI_DriverGIP_GetDevicePlayerIndex(_: [*c]SDL_HIDAPI_Device, _: SDL_JoystickID) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return -@as(c_int, 1);
}
pub fn HIDAPI_DriverGIP_SetDevicePlayerIndex(_: [*c]SDL_HIDAPI_Device, _: SDL_JoystickID, _: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn HIDAPI_DriverGIP_FindAttachment(device: [*c]SDL_HIDAPI_Device, joystick: [*c]SDL_Joystick) callconv(.c) [*c]GIP_Attachment {
    @setEvalBranchQuota(100000);
    var ctx: [*c]GIP_Device = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    var i: c_int = undefined;
    _ = &i;
    SDL_AssertJoysticksLocked();
    {
        i = 0;
        while (i < MAX_ATTACHMENTS) : (i += 1) {
            if ((ctx.*.attachments[@bitCast(@as(isize, @intCast(i)))] != null) and (ctx.*.attachments[@bitCast(@as(isize, @intCast(i)))].*.joystick == joystick.*.instance_id)) {
                return ctx.*.attachments[@bitCast(@as(isize, @intCast(i)))];
            }
        }
    }
    return null;
}
pub fn HIDAPI_DriverGIP_OpenJoystick(device: [*c]SDL_HIDAPI_Device, joystick: [*c]SDL_Joystick) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var attachment: [*c]GIP_Attachment = HIDAPI_DriverGIP_FindAttachment(device, joystick);
    _ = &attachment;
    if (!(attachment != null)) {
        return SDL_SetError_REAL("Invalid joystick");
    }
    SDL_AssertJoysticksLocked();
    attachment.*.left_impulse_level = 0;
    attachment.*.right_impulse_level = 0;
    attachment.*.left_vibration_level = 0;
    attachment.*.right_vibration_level = 0;
    attachment.*.rumble_state = GIP_RUMBLE_STATE_IDLE;
    attachment.*.rumble_time = 0;
    attachment.*.rumble_pending = @"false" != 0;
    _ = memset(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&attachment.*.last_input))))), 0, @sizeOf(@TypeOf(attachment.*.last_input)));
    joystick.*.nbuttons = 11;
    _ = GIP_EnableEliteButtons(attachment);
    if ((attachment.*.xbe_format != @as(GIP_EliteButtonFormat, GIP_BTN_FMT_UNKNOWN)) or ((@as(c_int, device.*.vendor_id) == USB_VENDOR_MICROSOFT) and (@as(c_int, device.*.product_id) == USB_PRODUCT_XBOX_ONE_ELITE_SERIES_2))) {
        attachment.*.paddle_idx = @bitCast(@as(i8, @truncate(joystick.*.nbuttons)));
        joystick.*.nbuttons += 4;
    }
    if ((attachment.*.features & (@as(c_uint, 1) << @intCast(@as(c_uint, 0)))) != 0) {
        attachment.*.share_button_idx = @bitCast(@as(i8, @truncate(joystick.*.nbuttons)));
        joystick.*.nbuttons += 1;
    }
    if (attachment.*.extra_buttons > @as(c_int, 0)) {
        attachment.*.extra_button_idx = @bitCast(@as(i8, @truncate(joystick.*.nbuttons)));
        joystick.*.nbuttons += attachment.*.extra_buttons;
    }
    joystick.*.naxes = SDL_GAMEPAD_AXIS_COUNT;
    if (attachment.*.attachment_type == GIP_TYPE_FLIGHT_STICK) {
        joystick.*.naxes += attachment.*.extra_axes - @as(c_int, 1);
    }
    if (attachment.*.attachment_type == GIP_TYPE_GUITAR) {
        device.*.joystick_type = SDL_JOYSTICK_TYPE_GUITAR;
    }
    if (attachment.*.attachment_type == GIP_TYPE_DRUM_KIT) {
        device.*.joystick_type = SDL_JOYSTICK_TYPE_DRUM_KIT;
    }
    if (attachment.*.attachment_type == GIP_TYPE_LIVE_GUITAR) {
        device.*.joystick_type = SDL_JOYSTICK_TYPE_GUITAR;
    }
    joystick.*.nhats = 1;
    return @"true" != 0;
}
pub fn HIDAPI_DriverGIP_RumbleJoystick(device: [*c]SDL_HIDAPI_Device, joystick: [*c]SDL_Joystick, low_frequency_rumble: Uint16, high_frequency_rumble: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var attachment: [*c]GIP_Attachment = HIDAPI_DriverGIP_FindAttachment(device, joystick);
    _ = &attachment;
    if (!(attachment != null)) {
        return SDL_SetError_REAL("Invalid joystick");
    }
    if (!((attachment.*.features & (@as(c_uint, 1) << @intCast(@as(c_uint, 5)))) != 0)) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    attachment.*.left_vibration_level = @bitCast(@as(i8, @truncate(@divTrunc(@as(c_int, low_frequency_rumble), @as(c_int, 655)))));
    attachment.*.right_vibration_level = @bitCast(@as(i8, @truncate(@divTrunc(@as(c_int, high_frequency_rumble), @as(c_int, 655)))));
    attachment.*.rumble_pending = @"true" != 0;
    return HIDAPI_DriverGIP_UpdateRumble(attachment);
}
pub fn HIDAPI_DriverGIP_RumbleJoystickTriggers(device: [*c]SDL_HIDAPI_Device, joystick: [*c]SDL_Joystick, left_rumble: Uint16, right_rumble: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var attachment: [*c]GIP_Attachment = HIDAPI_DriverGIP_FindAttachment(device, joystick);
    _ = &attachment;
    if (!(attachment != null)) {
        return SDL_SetError_REAL("Invalid joystick");
    }
    if ((@as(Uint32, @bitCast(@as(c_int, @intFromBool(!((attachment.*.features & (@as(c_uint, 1) << @intCast(@as(c_uint, 5)))) != 0))))) != 0) or ((attachment.*.quirks & (@as(c_uint, 1) << @intCast(@as(c_uint, 2)))) != 0)) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    attachment.*.left_impulse_level = @bitCast(@as(i8, @truncate(@divTrunc(@as(c_int, left_rumble), @as(c_int, 655)))));
    attachment.*.right_impulse_level = @bitCast(@as(i8, @truncate(@divTrunc(@as(c_int, right_rumble), @as(c_int, 655)))));
    attachment.*.rumble_pending = @"true" != 0;
    return HIDAPI_DriverGIP_UpdateRumble(attachment);
}
pub fn HIDAPI_DriverGIP_GetJoystickCapabilities(device: [*c]SDL_HIDAPI_Device, joystick: [*c]SDL_Joystick) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    var attachment: [*c]GIP_Attachment = HIDAPI_DriverGIP_FindAttachment(device, joystick);
    _ = &attachment;
    var result: Uint32 = 0;
    _ = &result;
    if (!(attachment != null)) {
        return 0;
    }
    if ((attachment.*.features & (@as(c_uint, 1) << @intCast(@as(c_uint, 5)))) != 0) {
        result |= SDL_JOYSTICK_CAP_RUMBLE;
        if (!((attachment.*.quirks & (@as(c_uint, 1) << @intCast(@as(c_uint, 2)))) != 0)) {
            result |= SDL_JOYSTICK_CAP_TRIGGER_RUMBLE;
        }
    }
    if ((attachment.*.features & (@as(c_uint, 1) << @intCast(@as(c_uint, 6)))) != 0) {
        result |= SDL_JOYSTICK_CAP_RGB_LED;
    }
    return result;
}
pub fn HIDAPI_DriverGIP_SetJoystickLED(device: [*c]SDL_HIDAPI_Device, joystick: [*c]SDL_Joystick, red: Uint8, green: Uint8, blue: Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var attachment: [*c]GIP_Attachment = HIDAPI_DriverGIP_FindAttachment(device, joystick);
    _ = &attachment;
    var buffer: [5]Uint8 = [5]Uint8{
        0,
        0,
        0,
        0,
        0,
    };
    _ = &buffer;
    if (!(attachment != null)) {
        return SDL_SetError_REAL("Invalid joystick");
    }
    if (!((attachment.*.features & (@as(c_uint, 1) << @intCast(@as(c_uint, 6)))) != 0)) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    buffer[@as(c_int, 1)] = 0;
    buffer[@as(c_int, 2)] = red;
    buffer[@as(c_int, 3)] = green;
    buffer[@as(c_int, 4)] = blue;
    if (!GIP_SendVendorMessage(attachment, GIP_CMD_GUIDE_COLOR, 0, @ptrCast(@alignCast(&buffer)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(buffer))))))) {
        return SDL_SetError_REAL("Couldn't send LED packet");
    }
    return @"true" != 0;
}
pub fn HIDAPI_DriverGIP_SendJoystickEffect(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: ?*const anyopaque, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverGIP_SetJoystickSensorsEnabled(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverGIP_UpdateDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]GIP_Device = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    var bytes: [64]Uint8 = undefined;
    _ = &bytes;
    var i: c_int = undefined;
    _ = &i;
    var num_bytes: c_int = undefined;
    _ = &num_bytes;
    var perform_reset: bool = @"false" != 0;
    _ = &perform_reset;
    var timestamp: Uint64 = undefined;
    _ = &timestamp;
    while ((blk: {
        const tmp = SDL_hid_read_timeout_REAL(device.*.dev, @ptrCast(@alignCast(&bytes)), @sizeOf(@TypeOf(bytes)), ctx.*.timeout);
        num_bytes = tmp;
        break :blk tmp;
    }) > @as(c_int, 0)) {
        ctx.*.timeout = 0;
        GIP_ReceivePacket(ctx, @ptrCast(@alignCast(&bytes)), num_bytes);
    }
    timestamp = SDL_GetTicks_REAL();
    if ((ctx.*.hello_deadline != 0) and (@as(Uint64, @bitCast(@as(c_long, @intFromBool(timestamp >= ctx.*.hello_deadline)))) != 0)) {
        ctx.*.hello_deadline = 0;
        perform_reset = @"true" != 0;
    }
    {
        i = 0;
        while (i < MAX_ATTACHMENTS) : (i += 1) {
            var attachment: [*c]GIP_Attachment = ctx.*.attachments[@bitCast(@as(isize, @intCast(i)))];
            _ = &attachment;
            if (!(attachment != null)) {
                continue;
            }
            if ((@as(c_int, attachment.*.fragment_message) != 0) and (timestamp >= (attachment.*.fragment_timer +% @as(Uint64, 1000)))) {
                SDL_LogWarn_REAL(SDL_LOG_CATEGORY_INPUT, "GIP: Reliable message transfer failed");
                attachment.*.fragment_message = 0;
            }
            if (((!perform_reset and (attachment.*.got_metadata == @as(GIP_MetadataStatus, GIP_METADATA_PENDING))) and (timestamp >= attachment.*.metadata_next)) and (@as(c_int, attachment.*.fragment_message) != GIP_CMD_METADATA)) {
                if (attachment.*.metadata_retries < @as(c_int, 3)) {
                    SDL_LogWarn_REAL(SDL_LOG_CATEGORY_INPUT, "GIP: Retrying metadata request");
                    attachment.*.metadata_retries += 1;
                    attachment.*.metadata_next = timestamp +% @as(Uint64, 500);
                    _ = GIP_SendSystemMessage(attachment, GIP_CMD_METADATA, 0, null, 0);
                } else {
                    perform_reset = @"true" != 0;
                }
            }
            if (perform_reset) {
                if (ctx.*.reset_for_metadata) {
                    _ = GIP_SendSetDeviceState(attachment, GIP_STATE_RESET);
                } else {
                    _ = GIP_SetMetadataDefaults(attachment);
                    _ = GIP_SendInitSequence(attachment);
                }
                perform_reset = @"false" != 0;
            }
            _ = HIDAPI_DriverGIP_UpdateRumble(attachment);
        }
    }
    if ((num_bytes < @as(c_int, 0)) and (device.*.num_joysticks > @as(c_int, 0))) {
        {
            i = 0;
            while (i < MAX_ATTACHMENTS) : (i += 1) {
                var attachment: [*c]GIP_Attachment = ctx.*.attachments[@bitCast(@as(isize, @intCast(i)))];
                _ = &attachment;
                if (attachment != null) {
                    HIDAPI_JoystickDisconnected(device, attachment.*.joystick);
                }
            }
        }
    }
    return num_bytes >= @as(c_int, 0);
}
pub fn HIDAPI_DriverGIP_CloseJoystick(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn HIDAPI_DriverGIP_FreeDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var context: [*c]GIP_Device = @ptrCast(@alignCast(device.*.context));
    _ = &context;
    var i: c_int = undefined;
    _ = &i;
    {
        i = 0;
        while (i < MAX_ATTACHMENTS) : (i += 1) {
            var attachment: [*c]GIP_Attachment = context.*.attachments[@bitCast(@as(isize, @intCast(i)))];
            _ = &attachment;
            if (!(attachment != null)) {
                continue;
            }
            if (attachment.*.fragment_data != null) {
                SDL_free_REAL(@ptrCast(@alignCast(attachment.*.fragment_data)));
                attachment.*.fragment_data = null;
            }
            if (attachment.*.keyboard != 0) {
                SDL_RemoveKeyboard(attachment.*.keyboard);
            }
            GIP_MetadataFree(&attachment.*.metadata);
            SDL_free_REAL(@ptrCast(@alignCast(attachment)));
            context.*.attachments[@bitCast(@as(isize, @intCast(i)))] = null;
        }
    }
}
pub export var SDL_HIDAPI_DriverGIP: SDL_HIDAPI_DeviceDriver = SDL_HIDAPI_DeviceDriver{
    .name = "SDL_JOYSTICK_HIDAPI_GIP",
    .enabled = @"true" != 0,
    .RegisterHints = HIDAPI_DriverGIP_RegisterHints,
    .UnregisterHints = HIDAPI_DriverGIP_UnregisterHints,
    .IsEnabled = HIDAPI_DriverGIP_IsEnabled,
    .IsSupportedDevice = HIDAPI_DriverGIP_IsSupportedDevice,
    .InitDevice = HIDAPI_DriverGIP_InitDevice,
    .GetDevicePlayerIndex = HIDAPI_DriverGIP_GetDevicePlayerIndex,
    .SetDevicePlayerIndex = HIDAPI_DriverGIP_SetDevicePlayerIndex,
    .UpdateDevice = HIDAPI_DriverGIP_UpdateDevice,
    .OpenJoystick = HIDAPI_DriverGIP_OpenJoystick,
    .RumbleJoystick = HIDAPI_DriverGIP_RumbleJoystick,
    .RumbleJoystickTriggers = HIDAPI_DriverGIP_RumbleJoystickTriggers,
    .GetJoystickCapabilities = HIDAPI_DriverGIP_GetJoystickCapabilities,
    .SetJoystickLED = HIDAPI_DriverGIP_SetJoystickLED,
    .SendJoystickEffect = HIDAPI_DriverGIP_SendJoystickEffect,
    .SetJoystickSensorsEnabled = HIDAPI_DriverGIP_SetJoystickSensorsEnabled,
    .CloseJoystick = HIDAPI_DriverGIP_CloseJoystick,
    .FreeDevice = HIDAPI_DriverGIP_FreeDevice,
};

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_HAT_UP = @as(c_uint, 0x01);
pub const SDL_HAT_RIGHT = @as(c_uint, 0x02);
pub const SDL_HAT_DOWN = @as(c_uint, 0x04);
pub const SDL_HAT_LEFT = @as(c_uint, 0x08);
pub const SDL_KMOD_LSHIFT = @as(c_uint, 0x0001);
pub const SDL_KMOD_RSHIFT = @as(c_uint, 0x0002);
pub const SDL_RUMBLE_RESEND_MS = @as(c_int, 2000);
pub const USB_VENDOR_MICROSOFT = @as(c_int, 0x045e);
pub const USB_VENDOR_PDP = @as(c_int, 0x0e6f);
pub const USB_VENDOR_POWERA = @as(c_int, 0x24c6);
pub const USB_VENDOR_RAZER = @as(c_int, 0x1532);
pub const USB_VENDOR_THRUSTMASTER = @as(c_int, 0x044f);
pub const USB_PRODUCT_BDA_XB1_CLASSIC = @as(c_int, 0x581a);
pub const USB_PRODUCT_BDA_XB1_FIGHTPAD = @as(c_int, 0x791a);
pub const USB_PRODUCT_BDA_XB1_SPECTRA_PRO = @as(c_int, 0x592a);
pub const USB_PRODUCT_PDP_ROCK_CANDY = @as(c_int, 0x0246);
pub const USB_PRODUCT_RAZER_ATROX = @as(c_int, 0x0a00);
pub const USB_PRODUCT_THRUSTMASTER_T_FLIGHT_HOTAS_ONE = __helpers.promoteIntLiteral(c_int, 0xb68c, .hex);
pub const USB_PRODUCT_XBOX_ONE_ELITE_SERIES_1 = @as(c_int, 0x02e3);
pub const USB_PRODUCT_XBOX_ONE_ELITE_SERIES_2 = @as(c_int, 0x0b00);
pub const USB_PRODUCT_XBOX_SERIES_X = @as(c_int, 0x0b12);
pub const SDL_JOYSTICK_CAP_RGB_LED = @as(c_int, 0x00000002);
pub const SDL_JOYSTICK_CAP_RUMBLE = @as(c_int, 0x00000010);
pub const SDL_JOYSTICK_CAP_TRIGGER_RUMBLE = @as(c_int, 0x00000020);
pub const MAX_MESSAGE_LENGTH = @as(c_int, 0x4000);
pub const MAX_ATTACHMENTS = @as(c_int, 8);
pub const GIP_DATA_CLASS_SHIFT = @as(c_int, 5);
pub const GIP_CMD_PROTO_CONTROL = @as(c_int, 0x01);
pub const GIP_CMD_HELLO_DEVICE = @as(c_int, 0x02);
pub const GIP_CMD_STATUS_DEVICE = @as(c_int, 0x03);
pub const GIP_CMD_METADATA = @as(c_int, 0x04);
pub const GIP_CMD_SET_DEVICE_STATE = @as(c_int, 0x05);
pub const GIP_CMD_SECURITY = @as(c_int, 0x06);
pub const GIP_CMD_GUIDE_BUTTON = @as(c_int, 0x07);
pub const GIP_CMD_AUDIO_CONTROL = @as(c_int, 0x08);
pub const GIP_CMD_LED = @as(c_int, 0x0a);
pub const GIP_CMD_HID_REPORT = @as(c_int, 0x0b);
pub const GIP_CMD_FIRMWARE = @as(c_int, 0x0c);
pub const GIP_CMD_EXTENDED = @as(c_int, 0x1e);
pub const GIP_AUDIO_DATA = @as(c_int, 0x60);
pub const GIP_CMD_DIRECT_MOTOR = @as(c_int, 0x09);
pub const GIP_LL_INPUT_REPORT = @as(c_int, 0x20);
pub const GIP_LL_OVERFLOW_INPUT_REPORT = @as(c_int, 0x26);
pub const GIP_CMD_INITIAL_REPORTS_REQUEST = @as(c_int, 0x0a);
pub const GIP_LL_STATIC_CONFIGURATION = @as(c_int, 0x21);
pub const GIP_LL_BUTTON_INFO_REPORT = @as(c_int, 0x22);
pub const GIP_CMD_DEVICE_CAPABILITIES = @as(c_int, 0x00);
pub const GIP_CMD_RAW_REPORT = @as(c_int, 0x0c);
pub const GIP_CMD_GUIDE_COLOR = @as(c_int, 0x0e);
pub const GIP_SL_ELITE_CONFIG = @as(c_int, 0x4d);
pub const GIP_BTN_OFFSET_XBE1 = @as(c_int, 28);
pub const GIP_BTN_OFFSET_XBE2 = @as(c_int, 14);
pub const GIP_FLAG_ATTACHMENT_MASK = @as(c_int, 0x7);
pub const GIP_CONTROL_CODE_ACK = @as(c_int, 0);
pub const GIP_NOT_CHARGING = @as(c_int, 0);
pub const GIP_CHARGING = @as(c_int, 1);
pub const GIP_CHARGE_ERROR = @as(c_int, 2);
pub const GIP_BATTERY_ABSENT = @as(c_int, 0);
pub const GIP_BATTERY_STANDARD = @as(c_int, 1);
pub const GIP_BATTERY_RECHARGEABLE = @as(c_int, 2);
pub const GIP_BATTERY_CRITICAL = @as(c_int, 0);
pub const GIP_BATTERY_LOW = @as(c_int, 1);
pub const GIP_BATTERY_MEDIUM = @as(c_int, 2);
pub const GIP_BATTERY_FULL = @as(c_int, 3);
pub const GIP_STATE_START = @as(c_int, 0);
pub const GIP_STATE_UNK6 = @as(c_int, 6);
pub const GIP_STATE_RESET = @as(c_int, 7);
pub const GIP_LED_GUIDE = @as(c_int, 0);
pub const GIP_LED_GUIDE_ON = @as(c_int, 1);
pub const GIP_MOTOR_ALL = @as(c_int, 0xF);
pub const GIP_EXTCMD_GET_SERIAL_NUMBER = @as(c_int, 0x04);
pub const GIP_EXTENDED_STATUS_OK = @as(c_int, 0);
pub const GIP_HELLO_TIMEOUT = @as(c_int, 2000);
pub const GIP_ACME_TIMEOUT = @as(c_int, 10);
pub const GIP_DEFAULT_IN_SYSTEM_MESSAGES = @as(c_int, 0x5e);
pub const GIP_DEFAULT_OUT_SYSTEM_MESSAGES = @as(c_int, 0x472);
pub const VK_LWIN = @as(c_int, 0x5b);
