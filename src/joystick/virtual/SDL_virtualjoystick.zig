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
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Sint16 = i16;
pub const Uint16 = u16;
pub const Uint32 = u32;
pub const Uint64 = u64;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_realloc_REAL(mem: ?*anyopaque, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_PropertiesID = Uint32;
pub extern fn SDL_SetBooleanProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: bool) bool;
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
pub const SDL_JOYSTICK_TYPE_GAMEPAD: c_int = 1;
pub const SDL_JOYSTICK_TYPE_WHEEL: c_int = 2;
pub const SDL_JOYSTICK_TYPE_ARCADE_STICK: c_int = 3;
pub const SDL_JOYSTICK_TYPE_FLIGHT_STICK: c_int = 4;
pub const SDL_JOYSTICK_TYPE_DANCE_PAD: c_int = 5;
pub const SDL_JOYSTICK_TYPE_GUITAR: c_int = 6;
pub const SDL_JOYSTICK_TYPE_DRUM_KIT: c_int = 7;
pub const SDL_JOYSTICK_TYPE_ARCADE_PAD: c_int = 8;
pub const SDL_JOYSTICK_TYPE_THROTTLE: c_int = 9;
pub const enum_SDL_JoystickType = c_uint;
pub const SDL_JoystickType = enum_SDL_JoystickType;
pub const struct_SDL_VirtualJoystickTouchpadDesc = extern struct {
    nfingers: Uint16 = 0,
    padding: [3]Uint16 = @import("std").mem.zeroes([3]Uint16),
};
pub const SDL_VirtualJoystickTouchpadDesc = struct_SDL_VirtualJoystickTouchpadDesc;
pub const struct_SDL_VirtualJoystickSensorDesc = extern struct {
    type: SDL_SensorType = @import("std").mem.zeroes(SDL_SensorType),
    rate: f32 = 0,
};
pub const SDL_VirtualJoystickSensorDesc = struct_SDL_VirtualJoystickSensorDesc;
pub const struct_SDL_VirtualJoystickDesc = extern struct {
    version: Uint32 = 0,
    type: Uint16 = 0,
    padding: Uint16 = 0,
    vendor_id: Uint16 = 0,
    product_id: Uint16 = 0,
    naxes: Uint16 = 0,
    nbuttons: Uint16 = 0,
    nballs: Uint16 = 0,
    nhats: Uint16 = 0,
    ntouchpads: Uint16 = 0,
    nsensors: Uint16 = 0,
    padding2: [2]Uint16 = @import("std").mem.zeroes([2]Uint16),
    button_mask: Uint32 = 0,
    axis_mask: Uint32 = 0,
    name: [*c]const u8 = null,
    touchpads: [*c]const SDL_VirtualJoystickTouchpadDesc = null,
    sensors: [*c]const SDL_VirtualJoystickSensorDesc = null,
    userdata: ?*anyopaque = null,
    Update: ?*const fn (userdata: ?*anyopaque) callconv(.c) void = null,
    SetPlayerIndex: ?*const fn (userdata: ?*anyopaque, player_index: c_int) callconv(.c) void = null,
    Rumble: ?*const fn (userdata: ?*anyopaque, low_frequency_rumble: Uint16, high_frequency_rumble: Uint16) callconv(.c) bool = null,
    RumbleTriggers: ?*const fn (userdata: ?*anyopaque, left_rumble: Uint16, right_rumble: Uint16) callconv(.c) bool = null,
    SetLED: ?*const fn (userdata: ?*anyopaque, red: Uint8, green: Uint8, blue: Uint8) callconv(.c) bool = null,
    SendEffect: ?*const fn (userdata: ?*anyopaque, data: ?*const anyopaque, size: c_int) callconv(.c) bool = null,
    SetSensorsEnabled: ?*const fn (userdata: ?*anyopaque, enabled: bool) callconv(.c) bool = null,
    Cleanup: ?*const fn (userdata: ?*anyopaque) callconv(.c) void = null,
};
pub const SDL_VirtualJoystickDesc = struct_SDL_VirtualJoystickDesc;
pub const struct_VirtualSensorEvent = extern struct {
    type: SDL_SensorType = @import("std").mem.zeroes(SDL_SensorType),
    sensor_timestamp: Uint64 = 0,
    data: [3]f32 = @import("std").mem.zeroes([3]f32),
    num_values: c_int = 0,
};
pub const VirtualSensorEvent = struct_VirtualSensorEvent;
pub const struct_joystick_hwdata = extern struct {
    instance_id: SDL_JoystickID = 0,
    attached: bool = false,
    name: [*c]u8 = null,
    type: SDL_JoystickType = @import("std").mem.zeroes(SDL_JoystickType),
    guid: SDL_GUID = @import("std").mem.zeroes(SDL_GUID),
    desc: SDL_VirtualJoystickDesc = @import("std").mem.zeroes(SDL_VirtualJoystickDesc),
    changes: Uint32 = 0,
    axes: [*c]Sint16 = null,
    buttons: [*c]bool = null,
    hats: [*c]Uint8 = null,
    balls: [*c]SDL_JoystickBallData = null,
    touchpads: [*c]SDL_JoystickTouchpadInfo = null,
    sensors: [*c]SDL_JoystickSensorInfo = null,
    sensors_enabled: bool = false,
    num_sensor_events: c_int = 0,
    max_sensor_events: c_int = 0,
    sensor_events: [*c]VirtualSensorEvent = null,
    joystick: [*c]SDL_Joystick = null,
    next: [*c]struct_joystick_hwdata = null,
};
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
    hwdata: [*c]struct_joystick_hwdata = null,
    props: SDL_PropertiesID = 0,
    ref_count: c_int = 0,
    next: [*c]struct_SDL_Joystick = null,
};
pub extern fn SDL_GetJoystickProperties_REAL(joystick: [*c]SDL_Joystick) SDL_PropertiesID;
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
pub const SDL_GAMEPAD_BUTTON_MISC1: c_int = 15;
pub const SDL_GAMEPAD_BUTTON_RIGHT_PADDLE1: c_int = 16;
pub const SDL_GAMEPAD_BUTTON_LEFT_PADDLE1: c_int = 17;
pub const SDL_GAMEPAD_BUTTON_RIGHT_PADDLE2: c_int = 18;
pub const SDL_GAMEPAD_BUTTON_LEFT_PADDLE2: c_int = 19;
pub const SDL_GAMEPAD_BUTTON_TOUCHPAD: c_int = 20;
pub const SDL_GAMEPAD_BUTTON_MISC2: c_int = 21;
pub const SDL_GAMEPAD_BUTTON_MISC3: c_int = 22;
pub const SDL_GAMEPAD_BUTTON_MISC4: c_int = 23;
pub const SDL_GAMEPAD_BUTTON_MISC5: c_int = 24;
pub const SDL_GAMEPAD_BUTTON_MISC6: c_int = 25;
pub const SDL_GAMEPAD_AXIS_LEFTX: c_int = 0;
pub const SDL_GAMEPAD_AXIS_LEFTY: c_int = 1;
pub const SDL_GAMEPAD_AXIS_RIGHTX: c_int = 2;
pub const SDL_GAMEPAD_AXIS_RIGHTY: c_int = 3;
pub const SDL_GAMEPAD_AXIS_LEFT_TRIGGER: c_int = 4;
pub const SDL_GAMEPAD_AXIS_RIGHT_TRIGGER: c_int = 5;
pub const SDL_GAMEPAD_AXIS_COUNT: c_int = 6;
pub extern fn SDL_GetTicksNS_REAL() Uint64;
pub extern fn SDL_GetNextObjectID() Uint32;
pub extern fn SDL_AssertJoysticksLocked() void;
pub extern fn SDL_CreateJoystickGUID(bus: Uint16, vendor: Uint16, product: Uint16, version: Uint16, vendor_name: [*c]const u8, product_name: [*c]const u8, driver_signature: Uint8, driver_data: Uint8) SDL_GUID;
pub extern fn SDL_PrivateJoystickAddTouchpad(joystick: [*c]SDL_Joystick, nfingers: c_int) void;
pub extern fn SDL_PrivateJoystickAddSensor(joystick: [*c]SDL_Joystick, @"type": SDL_SensorType, rate: f32) void;
pub extern fn SDL_PrivateJoystickAdded(instance_id: SDL_JoystickID) void;
pub extern fn SDL_PrivateJoystickRemoved(instance_id: SDL_JoystickID) void;
pub extern fn SDL_SendJoystickAxis(timestamp: Uint64, joystick: [*c]SDL_Joystick, axis: Uint8, value: Sint16) void;
pub extern fn SDL_SendJoystickBall(timestamp: Uint64, joystick: [*c]SDL_Joystick, ball: Uint8, xrel: Sint16, yrel: Sint16) void;
pub extern fn SDL_SendJoystickHat(timestamp: Uint64, joystick: [*c]SDL_Joystick, hat: Uint8, value: Uint8) void;
pub extern fn SDL_SendJoystickButton(timestamp: Uint64, joystick: [*c]SDL_Joystick, button: Uint8, down: bool) void;
pub extern fn SDL_SendJoystickTouchpad(timestamp: Uint64, joystick: [*c]SDL_Joystick, touchpad: c_int, finger: c_int, down: bool, x: f32, y: f32, pressure: f32) void;
pub extern fn SDL_SendJoystickSensor(timestamp: Uint64, joystick: [*c]SDL_Joystick, @"type": SDL_SensorType, sensor_timestamp: Uint64, data: [*c]const f32, num_values: c_int) void;
pub const EMappingKind_Button: c_int = 1;
pub const EMappingKind_Axis: c_int = 2;
pub const EMappingKind = c_uint;
pub const SDL_JoystickDriver = struct_SDL_JoystickDriver;
pub const joystick_hwdata = struct_joystick_hwdata;
pub var g_VJoys: [*c]joystick_hwdata = null;
pub fn VIRTUAL_HWDataForInstance(instance_id: SDL_JoystickID) callconv(.c) [*c]joystick_hwdata {
    @setEvalBranchQuota(100000);
    var vjoy: [*c]joystick_hwdata = undefined;
    _ = &vjoy;
    SDL_AssertJoysticksLocked();
    {
        vjoy = g_VJoys;
        while (vjoy != null) : (vjoy = vjoy.*.next) {
            if (instance_id == vjoy.*.instance_id) {
                return vjoy;
            }
        }
    }
    return null;
}
pub fn VIRTUAL_HWDataForIndex(arg_device_index: c_int) callconv(.c) [*c]joystick_hwdata {
    @setEvalBranchQuota(100000);
    var device_index = arg_device_index;
    _ = &device_index;
    var vjoy: [*c]joystick_hwdata = undefined;
    _ = &vjoy;
    SDL_AssertJoysticksLocked();
    {
        vjoy = g_VJoys;
        while (vjoy != null) : (vjoy = vjoy.*.next) {
            if (device_index == @as(c_int, 0)) {
                break;
            }
            device_index -= 1;
        }
    }
    return vjoy;
}
pub fn VIRTUAL_FreeHWData(hwdata: [*c]joystick_hwdata) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var cur: [*c]joystick_hwdata = undefined;
    _ = &cur;
    var prev: [*c]joystick_hwdata = null;
    _ = &prev;
    SDL_AssertJoysticksLocked();
    if (!(hwdata != null)) {
        return;
    }
    if (hwdata.*.desc.Cleanup != null) {
        hwdata.*.desc.Cleanup.?(hwdata.*.desc.userdata);
    }
    {
        cur = g_VJoys;
        while (cur != null) : ({
            prev = cur;
            cur = cur.*.next;
        }) {
            if (hwdata == cur) {
                if (prev != null) {
                    prev.*.next = cur.*.next;
                } else {
                    g_VJoys = cur.*.next;
                }
                break;
            }
        }
    }
    if (hwdata.*.joystick != null) {
        hwdata.*.joystick.*.hwdata = null;
        hwdata.*.joystick = null;
    }
    if (hwdata.*.name != null) {
        SDL_free_REAL(@ptrCast(@alignCast(hwdata.*.name)));
        hwdata.*.name = null;
    }
    if (hwdata.*.axes != null) {
        SDL_free_REAL(@ptrCast(@alignCast(hwdata.*.axes)));
        hwdata.*.axes = null;
    }
    if (hwdata.*.buttons != null) {
        SDL_free_REAL(@ptrCast(@alignCast(hwdata.*.buttons)));
        hwdata.*.buttons = null;
    }
    if (hwdata.*.hats != null) {
        SDL_free_REAL(@ptrCast(@alignCast(hwdata.*.hats)));
        hwdata.*.hats = null;
    }
    if (hwdata.*.balls != null) {
        SDL_free_REAL(@ptrCast(@alignCast(hwdata.*.balls)));
        hwdata.*.balls = null;
    }
    if (hwdata.*.touchpads != null) {
        {
            var i: Uint16 = 0;
            _ = &i;
            while (@as(c_int, i) < @as(c_int, hwdata.*.desc.ntouchpads)) : (i +%= 1) {
                SDL_free_REAL(@ptrCast(@alignCast(hwdata.*.touchpads[i].fingers)));
                hwdata.*.touchpads[i].fingers = null;
            }
        }
        SDL_free_REAL(@ptrCast(@alignCast(hwdata.*.touchpads)));
        hwdata.*.touchpads = null;
    }
    if (hwdata.*.sensors != null) {
        SDL_free_REAL(@ptrCast(@alignCast(hwdata.*.sensors)));
        hwdata.*.sensors = null;
    }
    if (hwdata.*.sensor_events != null) {
        SDL_free_REAL(@ptrCast(@alignCast(hwdata.*.sensor_events)));
        hwdata.*.sensor_events = null;
    }
    SDL_free_REAL(@ptrCast(@alignCast(hwdata)));
}
pub export fn SDL_JoystickAttachVirtualInner(desc: [*c]const SDL_VirtualJoystickDesc) SDL_JoystickID {
    @setEvalBranchQuota(100000);
    var hwdata: [*c]joystick_hwdata = undefined;
    _ = &hwdata;
    var name: [*c]const u8 = undefined;
    _ = &name;
    var axis_triggerleft: c_int = undefined;
    _ = &axis_triggerleft;
    var axis_triggerright: c_int = undefined;
    _ = &axis_triggerright;
    var i: c_int = undefined;
    _ = &i;
    var axis: c_int = undefined;
    _ = &axis;
    var i_1: Uint16 = undefined;
    _ = &i_1;
    var touchpad_desc: [*c]const SDL_VirtualJoystickTouchpadDesc = undefined;
    _ = &touchpad_desc;
    var i_2: Uint16 = undefined;
    _ = &i_2;
    var sensor_desc: [*c]const SDL_VirtualJoystickSensorDesc = undefined;
    _ = &sensor_desc;
    var last: [*c]joystick_hwdata = undefined;
    _ = &last;
    comptime {
        if (!(@sizeOf(@TypeOf((&hwdata.*.desc).*)) == @sizeOf(@TypeOf(desc.*)))) @compileError("static assertion failed \"sizeof (*(&hwdata->desc)) == sizeof (*( desc))\"");
    }
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                hwdata = null;
                name = null;
                axis_triggerleft = -@as(c_int, 1);
                axis_triggerright = -@as(c_int, 1);
                SDL_AssertJoysticksLocked();
                if (!(desc != null)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("desc"))));
                return 0;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                if (@as(c_ulong, desc.*.version) < @sizeOf(@TypeOf(desc.*))) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                _ = SDL_SetError_REAL("Invalid desc, should be initialized with SDL_INIT_INTERFACE()");
                return 0;
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                hwdata = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(joystick_hwdata))));
                if (!(hwdata != null)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                VIRTUAL_FreeHWData(hwdata);
                return 0;
            },
            8 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                _ = memcpy(@ptrCast(@alignCast(&hwdata.*.desc)), @ptrCast(@alignCast(desc)), @sizeOf(@TypeOf(desc.*)));
                hwdata.*.desc.touchpads = null;
                hwdata.*.desc.sensors = null;
                if (hwdata.*.desc.name != null) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                name = hwdata.*.desc.name;
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                switch (@as(c_int, hwdata.*.desc.type)) {
                    SDL_JOYSTICK_TYPE_GAMEPAD => {
                        sdl_pc = 14;
                        continue;
                    },
                    SDL_JOYSTICK_TYPE_WHEEL => {
                        sdl_pc = 15;
                        continue;
                    },
                    SDL_JOYSTICK_TYPE_ARCADE_STICK => {
                        sdl_pc = 16;
                        continue;
                    },
                    SDL_JOYSTICK_TYPE_FLIGHT_STICK => {
                        sdl_pc = 17;
                        continue;
                    },
                    SDL_JOYSTICK_TYPE_DANCE_PAD => {
                        sdl_pc = 18;
                        continue;
                    },
                    SDL_JOYSTICK_TYPE_GUITAR => {
                        sdl_pc = 19;
                        continue;
                    },
                    SDL_JOYSTICK_TYPE_DRUM_KIT => {
                        sdl_pc = 20;
                        continue;
                    },
                    SDL_JOYSTICK_TYPE_ARCADE_PAD => {
                        sdl_pc = 21;
                        continue;
                    },
                    SDL_JOYSTICK_TYPE_THROTTLE => {
                        sdl_pc = 22;
                        continue;
                    },
                    else => {
                        sdl_pc = 23;
                        continue;
                    },
                }
            },
            12 => {
                hwdata.*.name = SDL_strdup_REAL(name);
                if (@as(c_int, hwdata.*.desc.type) == SDL_JOYSTICK_TYPE_GAMEPAD) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
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
                name = "Virtual Controller";
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            15 => {
                name = "Virtual Wheel";
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            16 => {
                name = "Virtual Arcade Stick";
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            17 => {
                name = "Virtual Flight Stick";
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            18 => {
                name = "Virtual Dance Pad";
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            19 => {
                name = "Virtual Guitar";
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            20 => {
                name = "Virtual Drum Kit";
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            21 => {
                name = "Virtual Arcade Pad";
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            22 => {
                name = "Virtual Throttle";
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            23 => {
                name = "Virtual Joystick";
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            24 => {
                if (hwdata.*.desc.button_mask == @as(Uint32, 0)) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 28;
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
                hwdata.*.guid = SDL_CreateJoystickGUID(SDL_HARDWARE_BUS_VIRTUAL, hwdata.*.desc.vendor_id, hwdata.*.desc.product_id, 0, null, name, 'v', @truncate(hwdata.*.desc.type));
                if (@as(c_int, hwdata.*.desc.naxes) > @as(c_int, 0)) {
                    sdl_pc = 59;
                    continue;
                } else {
                    sdl_pc = 60;
                    continue;
                }
            },
            27 => {
                i = 0;
                {
                    sdl_pc = 30;
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
                if (hwdata.*.desc.axis_mask == @as(Uint32, 0)) {
                    sdl_pc = 34;
                    continue;
                } else {
                    sdl_pc = 35;
                    continue;
                }
            },
            30 => {
                if ((i < @as(c_int, hwdata.*.desc.nbuttons)) and (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(hwdata.*.desc.button_mask)) *% @as(c_ulong, 8)))) {
                    sdl_pc = 31;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            31 => {
                hwdata.*.desc.button_mask |= @bitCast(@as(c_int, @as(c_int, 1) << @intCast(i)));
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            32 => {
                i += 1;
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            33 => {
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            34 => {
                if (@as(c_int, hwdata.*.desc.naxes) >= @as(c_int, 2)) {
                    sdl_pc = 37;
                    continue;
                } else {
                    sdl_pc = 38;
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
                axis = 0;
                i = 0;
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            37 => {
                hwdata.*.desc.axis_mask |= @bitCast(@as(c_int, (@as(c_int, 1) << @intCast(SDL_GAMEPAD_AXIS_LEFTX)) | (@as(c_int, 1) << @intCast(SDL_GAMEPAD_AXIS_LEFTY))));
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            38 => {
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            39 => {
                if (@as(c_int, hwdata.*.desc.naxes) >= @as(c_int, 4)) {
                    sdl_pc = 40;
                    continue;
                } else {
                    sdl_pc = 41;
                    continue;
                }
            },
            40 => {
                hwdata.*.desc.axis_mask |= @bitCast(@as(c_int, (@as(c_int, 1) << @intCast(SDL_GAMEPAD_AXIS_RIGHTX)) | (@as(c_int, 1) << @intCast(SDL_GAMEPAD_AXIS_RIGHTY))));
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            41 => {
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            42 => {
                if (@as(c_int, hwdata.*.desc.naxes) >= @as(c_int, 6)) {
                    sdl_pc = 43;
                    continue;
                } else {
                    sdl_pc = 44;
                    continue;
                }
            },
            43 => {
                hwdata.*.desc.axis_mask |= @bitCast(@as(c_int, (@as(c_int, 1) << @intCast(SDL_GAMEPAD_AXIS_LEFT_TRIGGER)) | (@as(c_int, 1) << @intCast(SDL_GAMEPAD_AXIS_RIGHT_TRIGGER))));
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
                    sdl_pc = 36;
                    continue;
                }
            },
            46 => {
                if ((axis < @as(c_int, hwdata.*.desc.naxes)) and (i < SDL_GAMEPAD_AXIS_COUNT)) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 49;
                    continue;
                }
            },
            47 => {
                if ((hwdata.*.desc.axis_mask & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(i))))) != 0) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            48 => {
                i += 1;
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            49 => {
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            50 => {
                if (i == SDL_GAMEPAD_AXIS_LEFT_TRIGGER) {
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
                    sdl_pc = 48;
                    continue;
                }
            },
            53 => {
                axis_triggerleft = axis;
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
                if (i == SDL_GAMEPAD_AXIS_RIGHT_TRIGGER) {
                    sdl_pc = 56;
                    continue;
                } else {
                    sdl_pc = 57;
                    continue;
                }
            },
            56 => {
                axis_triggerright = axis;
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
                axis += 1;
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            59 => {
                hwdata.*.axes = @ptrCast(@alignCast(SDL_calloc_REAL(hwdata.*.desc.naxes, @sizeOf(@TypeOf(hwdata.*.axes.*)))));
                if (!(hwdata.*.axes != null)) {
                    sdl_pc = 62;
                    continue;
                } else {
                    sdl_pc = 63;
                    continue;
                }
            },
            60 => {
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            61 => {
                if (@as(c_int, hwdata.*.desc.nbuttons) > @as(c_int, 0)) {
                    sdl_pc = 71;
                    continue;
                } else {
                    sdl_pc = 72;
                    continue;
                }
            },
            62 => {
                VIRTUAL_FreeHWData(hwdata);
                return 0;
            },
            63 => {
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            64 => {
                if (axis_triggerleft >= @as(c_int, 0)) {
                    sdl_pc = 65;
                    continue;
                } else {
                    sdl_pc = 66;
                    continue;
                }
            },
            65 => {
                hwdata.*.axes[@bitCast(@as(isize, @intCast(axis_triggerleft)))] = @truncate(-@as(c_int, 32768));
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            66 => {
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            67 => {
                if (axis_triggerright >= @as(c_int, 0)) {
                    sdl_pc = 68;
                    continue;
                } else {
                    sdl_pc = 69;
                    continue;
                }
            },
            68 => {
                hwdata.*.axes[@bitCast(@as(isize, @intCast(axis_triggerright)))] = @truncate(-@as(c_int, 32768));
                {
                    sdl_pc = 70;
                    continue;
                }
            },
            69 => {
                {
                    sdl_pc = 70;
                    continue;
                }
            },
            70 => {
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            71 => {
                hwdata.*.buttons = @ptrCast(@alignCast(SDL_calloc_REAL(hwdata.*.desc.nbuttons, @sizeOf(@TypeOf(hwdata.*.buttons.*)))));
                if (!(hwdata.*.buttons != null)) {
                    sdl_pc = 74;
                    continue;
                } else {
                    sdl_pc = 75;
                    continue;
                }
            },
            72 => {
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            73 => {
                if (@as(c_int, hwdata.*.desc.nhats) > @as(c_int, 0)) {
                    sdl_pc = 77;
                    continue;
                } else {
                    sdl_pc = 78;
                    continue;
                }
            },
            74 => {
                VIRTUAL_FreeHWData(hwdata);
                return 0;
            },
            75 => {
                {
                    sdl_pc = 76;
                    continue;
                }
            },
            76 => {
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            77 => {
                hwdata.*.hats = @ptrCast(@alignCast(SDL_calloc_REAL(hwdata.*.desc.nhats, @sizeOf(@TypeOf(hwdata.*.hats.*)))));
                if (!(hwdata.*.hats != null)) {
                    sdl_pc = 80;
                    continue;
                } else {
                    sdl_pc = 81;
                    continue;
                }
            },
            78 => {
                {
                    sdl_pc = 79;
                    continue;
                }
            },
            79 => {
                if (@as(c_int, hwdata.*.desc.nballs) > @as(c_int, 0)) {
                    sdl_pc = 83;
                    continue;
                } else {
                    sdl_pc = 84;
                    continue;
                }
            },
            80 => {
                VIRTUAL_FreeHWData(hwdata);
                return 0;
            },
            81 => {
                {
                    sdl_pc = 82;
                    continue;
                }
            },
            82 => {
                {
                    sdl_pc = 79;
                    continue;
                }
            },
            83 => {
                hwdata.*.balls = @ptrCast(@alignCast(SDL_calloc_REAL(hwdata.*.desc.nballs, @sizeOf(@TypeOf(hwdata.*.balls.*)))));
                if (!(hwdata.*.balls != null)) {
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
                if (@as(c_int, hwdata.*.desc.ntouchpads) > @as(c_int, 0)) {
                    sdl_pc = 89;
                    continue;
                } else {
                    sdl_pc = 90;
                    continue;
                }
            },
            86 => {
                VIRTUAL_FreeHWData(hwdata);
                return 0;
            },
            87 => {
                {
                    sdl_pc = 88;
                    continue;
                }
            },
            88 => {
                {
                    sdl_pc = 85;
                    continue;
                }
            },
            89 => {
                if (!(desc.*.touchpads != null)) {
                    sdl_pc = 92;
                    continue;
                } else {
                    sdl_pc = 93;
                    continue;
                }
            },
            90 => {
                {
                    sdl_pc = 91;
                    continue;
                }
            },
            91 => {
                if (@as(c_int, hwdata.*.desc.nsensors) > @as(c_int, 0)) {
                    sdl_pc = 105;
                    continue;
                } else {
                    sdl_pc = 106;
                    continue;
                }
            },
            92 => {
                VIRTUAL_FreeHWData(hwdata);
                _ = SDL_SetError_REAL("desc missing touchpad descriptions");
                return 0;
            },
            93 => {
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            94 => {
                hwdata.*.touchpads = @ptrCast(@alignCast(SDL_calloc_REAL(hwdata.*.desc.ntouchpads, @sizeOf(@TypeOf(hwdata.*.touchpads.*)))));
                if (!(hwdata.*.touchpads != null)) {
                    sdl_pc = 95;
                    continue;
                } else {
                    sdl_pc = 96;
                    continue;
                }
            },
            95 => {
                VIRTUAL_FreeHWData(hwdata);
                return 0;
            },
            96 => {
                {
                    sdl_pc = 97;
                    continue;
                }
            },
            97 => {
                i_1 = 0;
                {
                    sdl_pc = 98;
                    continue;
                }
            },
            98 => {
                if (@as(c_int, i_1) < @as(c_int, hwdata.*.desc.ntouchpads)) {
                    sdl_pc = 99;
                    continue;
                } else {
                    sdl_pc = 101;
                    continue;
                }
            },
            99 => {
                touchpad_desc = &desc.*.touchpads[i_1];
                hwdata.*.touchpads[i_1].nfingers = touchpad_desc.*.nfingers;
                hwdata.*.touchpads[i_1].fingers = @ptrCast(@alignCast(SDL_calloc_REAL(touchpad_desc.*.nfingers, @sizeOf(@TypeOf(hwdata.*.touchpads[i_1].fingers.*)))));
                if (!(hwdata.*.touchpads[i_1].fingers != null)) {
                    sdl_pc = 102;
                    continue;
                } else {
                    sdl_pc = 103;
                    continue;
                }
            },
            100 => {
                i_1 +%= 1;
                {
                    sdl_pc = 98;
                    continue;
                }
            },
            101 => {
                {
                    sdl_pc = 91;
                    continue;
                }
            },
            102 => {
                VIRTUAL_FreeHWData(hwdata);
                return 0;
            },
            103 => {
                {
                    sdl_pc = 104;
                    continue;
                }
            },
            104 => {
                {
                    sdl_pc = 100;
                    continue;
                }
            },
            105 => {
                if (!(desc.*.sensors != null)) {
                    sdl_pc = 108;
                    continue;
                } else {
                    sdl_pc = 109;
                    continue;
                }
            },
            106 => {
                {
                    sdl_pc = 107;
                    continue;
                }
            },
            107 => {
                hwdata.*.instance_id = SDL_GetNextObjectID();
                if (g_VJoys != null) {
                    sdl_pc = 118;
                    continue;
                } else {
                    sdl_pc = 119;
                    continue;
                }
            },
            108 => {
                VIRTUAL_FreeHWData(hwdata);
                _ = SDL_SetError_REAL("desc missing sensor descriptions");
                return 0;
            },
            109 => {
                {
                    sdl_pc = 110;
                    continue;
                }
            },
            110 => {
                hwdata.*.sensors = @ptrCast(@alignCast(SDL_calloc_REAL(hwdata.*.desc.nsensors, @sizeOf(@TypeOf(hwdata.*.sensors.*)))));
                if (!(hwdata.*.sensors != null)) {
                    sdl_pc = 111;
                    continue;
                } else {
                    sdl_pc = 112;
                    continue;
                }
            },
            111 => {
                VIRTUAL_FreeHWData(hwdata);
                return 0;
            },
            112 => {
                {
                    sdl_pc = 113;
                    continue;
                }
            },
            113 => {
                i_2 = 0;
                {
                    sdl_pc = 114;
                    continue;
                }
            },
            114 => {
                if (@as(c_int, i_2) < @as(c_int, hwdata.*.desc.nsensors)) {
                    sdl_pc = 115;
                    continue;
                } else {
                    sdl_pc = 117;
                    continue;
                }
            },
            115 => {
                sensor_desc = &desc.*.sensors[i_2];
                hwdata.*.sensors[i_2].type = sensor_desc.*.type;
                hwdata.*.sensors[i_2].rate = sensor_desc.*.rate;
                {
                    sdl_pc = 116;
                    continue;
                }
            },
            116 => {
                i_2 +%= 1;
                {
                    sdl_pc = 114;
                    continue;
                }
            },
            117 => {
                {
                    sdl_pc = 107;
                    continue;
                }
            },
            118 => {
                last = g_VJoys;
                {
                    sdl_pc = 121;
                    continue;
                }
            },
            119 => {
                g_VJoys = hwdata;
                {
                    sdl_pc = 120;
                    continue;
                }
            },
            120 => {
                SDL_PrivateJoystickAdded(hwdata.*.instance_id);
                return hwdata.*.instance_id;
            },
            121 => {
                if (last.*.next != null) {
                    sdl_pc = 122;
                    continue;
                } else {
                    sdl_pc = 124;
                    continue;
                }
            },
            122 => {
                {
                    sdl_pc = 123;
                    continue;
                }
            },
            123 => {
                last = last.*.next;
                {
                    sdl_pc = 121;
                    continue;
                }
            },
            124 => {
                last.*.next = hwdata;
                {
                    sdl_pc = 120;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_JoystickDetachVirtualInner(instance_id: SDL_JoystickID) bool {
    @setEvalBranchQuota(100000);
    var hwdata: [*c]joystick_hwdata = VIRTUAL_HWDataForInstance(instance_id);
    _ = &hwdata;
    if (!(hwdata != null)) {
        return SDL_SetError_REAL("Virtual joystick data not found");
    }
    VIRTUAL_FreeHWData(hwdata);
    SDL_PrivateJoystickRemoved(instance_id);
    return @"true" != 0;
}
pub export fn SDL_SetJoystickVirtualAxisInner(joystick: [*c]SDL_Joystick, arg_axis: c_int, value: Sint16) bool {
    @setEvalBranchQuota(100000);
    var axis = arg_axis;
    _ = &axis;
    var hwdata: [*c]joystick_hwdata = undefined;
    _ = &hwdata;
    SDL_AssertJoysticksLocked();
    if (!(joystick != null) or !(joystick.*.hwdata != null)) {
        return SDL_SetError_REAL("Invalid joystick");
    }
    hwdata = joystick.*.hwdata;
    if ((axis < @as(c_int, 0)) or (axis >= @as(c_int, hwdata.*.desc.naxes))) {
        return SDL_SetError_REAL("Invalid axis index");
    }
    hwdata.*.axes[@bitCast(@as(isize, @intCast(axis)))] = value;
    hwdata.*.changes |= AXES_CHANGED;
    return @"true" != 0;
}
pub export fn SDL_SetJoystickVirtualBallInner(joystick: [*c]SDL_Joystick, arg_ball: c_int, xrel: Sint16, yrel: Sint16) bool {
    @setEvalBranchQuota(100000);
    var ball = arg_ball;
    _ = &ball;
    var hwdata: [*c]joystick_hwdata = undefined;
    _ = &hwdata;
    SDL_AssertJoysticksLocked();
    if (!(joystick != null) or !(joystick.*.hwdata != null)) {
        return SDL_SetError_REAL("Invalid joystick");
    }
    hwdata = joystick.*.hwdata;
    if ((ball < @as(c_int, 0)) or (ball >= @as(c_int, hwdata.*.desc.nballs))) {
        return SDL_SetError_REAL("Invalid ball index");
    }
    hwdata.*.balls[@bitCast(@as(isize, @intCast(ball)))].dx += xrel;
    hwdata.*.balls[@bitCast(@as(isize, @intCast(ball)))].dx = if (hwdata.*.balls[@bitCast(@as(isize, @intCast(ball)))].dx < @as(c_int, @as(Sint16, @truncate(~@as(c_int, 32767))))) @as(c_int, @as(Sint16, @truncate(~@as(c_int, 32767)))) else if (hwdata.*.balls[@bitCast(@as(isize, @intCast(ball)))].dx > @as(c_int, @as(Sint16, @truncate(@as(c_int, 32767))))) @as(c_int, @as(Sint16, @truncate(@as(c_int, 32767)))) else hwdata.*.balls[@bitCast(@as(isize, @intCast(ball)))].dx;
    hwdata.*.balls[@bitCast(@as(isize, @intCast(ball)))].dy += yrel;
    hwdata.*.balls[@bitCast(@as(isize, @intCast(ball)))].dy = if (hwdata.*.balls[@bitCast(@as(isize, @intCast(ball)))].dy < @as(c_int, @as(Sint16, @truncate(~@as(c_int, 32767))))) @as(c_int, @as(Sint16, @truncate(~@as(c_int, 32767)))) else if (hwdata.*.balls[@bitCast(@as(isize, @intCast(ball)))].dy > @as(c_int, @as(Sint16, @truncate(@as(c_int, 32767))))) @as(c_int, @as(Sint16, @truncate(@as(c_int, 32767)))) else hwdata.*.balls[@bitCast(@as(isize, @intCast(ball)))].dy;
    hwdata.*.changes |= BALLS_CHANGED;
    return @"true" != 0;
}
pub export fn SDL_SetJoystickVirtualButtonInner(joystick: [*c]SDL_Joystick, arg_button: c_int, down: bool) bool {
    @setEvalBranchQuota(100000);
    var button = arg_button;
    _ = &button;
    var hwdata: [*c]joystick_hwdata = undefined;
    _ = &hwdata;
    SDL_AssertJoysticksLocked();
    if (!(joystick != null) or !(joystick.*.hwdata != null)) {
        return SDL_SetError_REAL("Invalid joystick");
    }
    hwdata = joystick.*.hwdata;
    if ((button < @as(c_int, 0)) or (button >= @as(c_int, hwdata.*.desc.nbuttons))) {
        return SDL_SetError_REAL("Invalid button index");
    }
    hwdata.*.buttons[@bitCast(@as(isize, @intCast(button)))] = down;
    hwdata.*.changes |= BUTTONS_CHANGED;
    return @"true" != 0;
}
pub export fn SDL_SetJoystickVirtualHatInner(joystick: [*c]SDL_Joystick, arg_hat: c_int, value: Uint8) bool {
    @setEvalBranchQuota(100000);
    var hat = arg_hat;
    _ = &hat;
    var hwdata: [*c]joystick_hwdata = undefined;
    _ = &hwdata;
    SDL_AssertJoysticksLocked();
    if (!(joystick != null) or !(joystick.*.hwdata != null)) {
        return SDL_SetError_REAL("Invalid joystick");
    }
    hwdata = joystick.*.hwdata;
    if ((hat < @as(c_int, 0)) or (hat >= @as(c_int, hwdata.*.desc.nhats))) {
        return SDL_SetError_REAL("Invalid hat index");
    }
    hwdata.*.hats[@bitCast(@as(isize, @intCast(hat)))] = value;
    hwdata.*.changes |= HATS_CHANGED;
    return @"true" != 0;
}
pub export fn SDL_SetJoystickVirtualTouchpadInner(joystick: [*c]SDL_Joystick, arg_touchpad: c_int, arg_finger: c_int, down: bool, x: f32, y: f32, pressure: f32) bool {
    @setEvalBranchQuota(100000);
    var touchpad = arg_touchpad;
    _ = &touchpad;
    var finger = arg_finger;
    _ = &finger;
    var hwdata: [*c]joystick_hwdata = undefined;
    _ = &hwdata;
    SDL_AssertJoysticksLocked();
    if (!(joystick != null) or !(joystick.*.hwdata != null)) {
        return SDL_SetError_REAL("Invalid joystick");
    }
    hwdata = joystick.*.hwdata;
    if ((touchpad < @as(c_int, 0)) or (touchpad >= @as(c_int, hwdata.*.desc.ntouchpads))) {
        return SDL_SetError_REAL("Invalid touchpad index");
    }
    if ((finger < @as(c_int, 0)) or (finger >= hwdata.*.touchpads[@bitCast(@as(isize, @intCast(touchpad)))].nfingers)) {
        return SDL_SetError_REAL("Invalid finger index");
    }
    var info: [*c]SDL_JoystickTouchpadFingerInfo = &hwdata.*.touchpads[@bitCast(@as(isize, @intCast(touchpad)))].fingers[@bitCast(@as(isize, @intCast(finger)))];
    _ = &info;
    info.*.down = down;
    info.*.x = x;
    info.*.y = y;
    info.*.pressure = pressure;
    hwdata.*.changes |= TOUCHPADS_CHANGED;
    return @"true" != 0;
}
pub export fn SDL_SendJoystickVirtualSensorDataInner(joystick: [*c]SDL_Joystick, arg_type: SDL_SensorType, sensor_timestamp: Uint64, data: [*c]const f32, num_values: c_int) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var hwdata: [*c]joystick_hwdata = undefined;
    _ = &hwdata;
    SDL_AssertJoysticksLocked();
    if (!(joystick != null) or !(joystick.*.hwdata != null)) {
        return SDL_SetError_REAL("Invalid joystick");
    }
    hwdata = joystick.*.hwdata;
    if (hwdata.*.num_sensor_events == hwdata.*.max_sensor_events) {
        var new_max_sensor_events: c_int = hwdata.*.max_sensor_events + @as(c_int, 1);
        _ = &new_max_sensor_events;
        var sensor_events: [*c]VirtualSensorEvent = undefined;
        sensor_events = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(hwdata.*.sensor_events)), @as(c_ulong, @bitCast(@as(c_long, new_max_sensor_events))) *% @sizeOf(@TypeOf(sensor_events.*)))));
        _ = &sensor_events;
        if (!(sensor_events != null)) {
            return @"false" != 0;
        }
        hwdata.*.sensor_events = sensor_events;
        hwdata.*.max_sensor_events = new_max_sensor_events;
    }
    var event: [*c]VirtualSensorEvent = &hwdata.*.sensor_events[
        @bitCast(@as(isize, @intCast(blk: {
            const ref = &hwdata.*.num_sensor_events;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        })))
    ];
    _ = &event;
    event.*.type = @"type";
    event.*.sensor_timestamp = sensor_timestamp;
    event.*.num_values = @bitCast(@as(c_uint, @truncate(if (@as(c_ulong, @bitCast(@as(c_long, num_values))) < (@sizeOf(@TypeOf(event.*.data)) / @sizeOf(@TypeOf(event.*.data[@as(c_int, 0)])))) @as(c_ulong, @bitCast(@as(c_long, num_values))) else @sizeOf(@TypeOf(event.*.data)) / @sizeOf(@TypeOf(event.*.data[@as(c_int, 0)])))));
    _ = memcpy(@ptrCast(@alignCast(@as([*c]f32, @ptrCast(@alignCast(&event.*.data))))), @ptrCast(@alignCast(data)), @as(c_ulong, @bitCast(@as(c_long, event.*.num_values))) *% @sizeOf(@TypeOf(@as([*c]f32, @ptrCast(@alignCast(&event.*.data))).*)));
    return @"true" != 0;
}
pub fn VIRTUAL_JoystickInit() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return @"true" != 0;
}
pub fn VIRTUAL_JoystickGetCount() callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var cur: [*c]joystick_hwdata = undefined;
    _ = &cur;
    var count: c_int = 0;
    _ = &count;
    SDL_AssertJoysticksLocked();
    {
        cur = g_VJoys;
        while (cur != null) : (cur = cur.*.next) {
            count += 1;
        }
    }
    return count;
}
pub fn VIRTUAL_JoystickDetect() callconv(.c) void {}
pub fn VIRTUAL_JoystickIsDevicePresent(_: Uint16, _: Uint16, _: Uint16, _: [*c]const u8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return @"false" != 0;
}
pub fn VIRTUAL_JoystickGetDeviceName(device_index: c_int) callconv(.c) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var hwdata: [*c]joystick_hwdata = VIRTUAL_HWDataForIndex(device_index);
    _ = &hwdata;
    if (!(hwdata != null)) {
        return null;
    }
    return hwdata.*.name;
}
pub fn VIRTUAL_JoystickGetDevicePath(_: c_int) callconv(.c) [*c]const u8 {
    @setEvalBranchQuota(100000);
    return null;
}
pub fn VIRTUAL_JoystickGetDeviceSteamVirtualGamepadSlot(_: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return -@as(c_int, 1);
}
pub fn VIRTUAL_JoystickGetDevicePlayerIndex(_: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return -@as(c_int, 1);
}
pub fn VIRTUAL_JoystickSetDevicePlayerIndex(device_index: c_int, player_index: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var hwdata: [*c]joystick_hwdata = VIRTUAL_HWDataForIndex(device_index);
    _ = &hwdata;
    if ((hwdata != null) and (hwdata.*.desc.SetPlayerIndex != null)) {
        hwdata.*.desc.SetPlayerIndex.?(hwdata.*.desc.userdata, player_index);
    }
}
pub fn VIRTUAL_JoystickGetDeviceGUID(device_index: c_int) callconv(.c) SDL_GUID {
    @setEvalBranchQuota(100000);
    var hwdata: [*c]joystick_hwdata = VIRTUAL_HWDataForIndex(device_index);
    _ = &hwdata;
    if (!(hwdata != null)) {
        var guid: SDL_GUID = undefined;
        _ = &guid;
        _ = memset(@ptrCast(@alignCast(&guid)), 0, @sizeOf(@TypeOf(guid)));
        return guid;
    }
    return hwdata.*.guid;
}
pub fn VIRTUAL_JoystickGetDeviceInstanceID(device_index: c_int) callconv(.c) SDL_JoystickID {
    @setEvalBranchQuota(100000);
    var hwdata: [*c]joystick_hwdata = VIRTUAL_HWDataForIndex(device_index);
    _ = &hwdata;
    if (!(hwdata != null)) {
        return @"true";
    }
    return hwdata.*.instance_id;
}
pub fn VIRTUAL_JoystickOpen(joystick: [*c]SDL_Joystick, device_index: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var hwdata: [*c]joystick_hwdata = undefined;
    _ = &hwdata;
    SDL_AssertJoysticksLocked();
    hwdata = VIRTUAL_HWDataForIndex(device_index);
    if (!(hwdata != null)) {
        return SDL_SetError_REAL("No such device");
    }
    joystick.*.hwdata = hwdata;
    joystick.*.naxes = hwdata.*.desc.naxes;
    joystick.*.nbuttons = hwdata.*.desc.nbuttons;
    joystick.*.nhats = hwdata.*.desc.nhats;
    hwdata.*.joystick = joystick;
    {
        var i: Uint16 = 0;
        _ = &i;
        while (@as(c_int, i) < @as(c_int, hwdata.*.desc.ntouchpads)) : (i +%= 1) {
            var touchpad: [*c]const SDL_JoystickTouchpadInfo = &hwdata.*.touchpads[i];
            _ = &touchpad;
            SDL_PrivateJoystickAddTouchpad(joystick, touchpad.*.nfingers);
        }
    }
    {
        var i: Uint16 = 0;
        _ = &i;
        while (@as(c_int, i) < @as(c_int, hwdata.*.desc.nsensors)) : (i +%= 1) {
            var sensor: [*c]const SDL_JoystickSensorInfo = &hwdata.*.sensors[i];
            _ = &sensor;
            SDL_PrivateJoystickAddSensor(joystick, sensor.*.type, sensor.*.rate);
        }
    }
    if (hwdata.*.desc.SetLED != null) {
        _ = SDL_SetBooleanProperty_REAL(SDL_GetJoystickProperties_REAL(joystick), "SDL.joystick.cap.rgb_led", @"true" != 0);
    }
    if (hwdata.*.desc.Rumble != null) {
        _ = SDL_SetBooleanProperty_REAL(SDL_GetJoystickProperties_REAL(joystick), "SDL.joystick.cap.rumble", @"true" != 0);
    }
    if (hwdata.*.desc.RumbleTriggers != null) {
        _ = SDL_SetBooleanProperty_REAL(SDL_GetJoystickProperties_REAL(joystick), "SDL.joystick.cap.trigger_rumble", @"true" != 0);
    }
    return @"true" != 0;
}
pub fn VIRTUAL_JoystickRumble(joystick: [*c]SDL_Joystick, low_frequency_rumble: Uint16, high_frequency_rumble: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var result: bool = undefined;
    _ = &result;
    SDL_AssertJoysticksLocked();
    if (joystick.*.hwdata != null) {
        var hwdata: [*c]joystick_hwdata = joystick.*.hwdata;
        _ = &hwdata;
        if (hwdata.*.desc.Rumble != null) {
            result = hwdata.*.desc.Rumble.?(hwdata.*.desc.userdata, low_frequency_rumble, high_frequency_rumble);
        } else {
            result = SDL_SetError_REAL("That operation is not supported");
        }
    } else {
        result = SDL_SetError_REAL("Rumble failed, device disconnected");
    }
    return result;
}
pub fn VIRTUAL_JoystickRumbleTriggers(joystick: [*c]SDL_Joystick, left_rumble: Uint16, right_rumble: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var result: bool = undefined;
    _ = &result;
    SDL_AssertJoysticksLocked();
    if (joystick.*.hwdata != null) {
        var hwdata: [*c]joystick_hwdata = joystick.*.hwdata;
        _ = &hwdata;
        if (hwdata.*.desc.RumbleTriggers != null) {
            result = hwdata.*.desc.RumbleTriggers.?(hwdata.*.desc.userdata, left_rumble, right_rumble);
        } else {
            result = SDL_SetError_REAL("That operation is not supported");
        }
    } else {
        result = SDL_SetError_REAL("Rumble failed, device disconnected");
    }
    return result;
}
pub fn VIRTUAL_JoystickSetLED(joystick: [*c]SDL_Joystick, red: Uint8, green: Uint8, blue: Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var result: bool = undefined;
    _ = &result;
    SDL_AssertJoysticksLocked();
    if (joystick.*.hwdata != null) {
        var hwdata: [*c]joystick_hwdata = joystick.*.hwdata;
        _ = &hwdata;
        if (hwdata.*.desc.SetLED != null) {
            result = hwdata.*.desc.SetLED.?(hwdata.*.desc.userdata, red, green, blue);
        } else {
            result = SDL_SetError_REAL("That operation is not supported");
        }
    } else {
        result = SDL_SetError_REAL("SetLED failed, device disconnected");
    }
    return result;
}
pub fn VIRTUAL_JoystickSendEffect(joystick: [*c]SDL_Joystick, data: ?*const anyopaque, size: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var result: bool = undefined;
    _ = &result;
    SDL_AssertJoysticksLocked();
    if (joystick.*.hwdata != null) {
        var hwdata: [*c]joystick_hwdata = joystick.*.hwdata;
        _ = &hwdata;
        if (hwdata.*.desc.SendEffect != null) {
            result = hwdata.*.desc.SendEffect.?(hwdata.*.desc.userdata, data, size);
        } else {
            result = SDL_SetError_REAL("That operation is not supported");
        }
    } else {
        result = SDL_SetError_REAL("SendEffect failed, device disconnected");
    }
    return result;
}
pub fn VIRTUAL_JoystickSetSensorsEnabled(joystick: [*c]SDL_Joystick, enabled: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var result: bool = undefined;
    _ = &result;
    SDL_AssertJoysticksLocked();
    if (joystick.*.hwdata != null) {
        var hwdata: [*c]joystick_hwdata = joystick.*.hwdata;
        _ = &hwdata;
        if (hwdata.*.desc.SetSensorsEnabled != null) {
            result = hwdata.*.desc.SetSensorsEnabled.?(hwdata.*.desc.userdata, enabled);
        } else {
            result = @"true" != 0;
        }
        if (result) {
            hwdata.*.sensors_enabled = enabled;
        }
    } else {
        result = SDL_SetError_REAL("SetSensorsEnabled failed, device disconnected");
    }
    return result;
}
pub fn VIRTUAL_JoystickUpdate(joystick: [*c]SDL_Joystick) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var hwdata: [*c]joystick_hwdata = undefined;
    _ = &hwdata;
    var timestamp: Uint64 = SDL_GetTicksNS_REAL();
    _ = &timestamp;
    SDL_AssertJoysticksLocked();
    if (!(joystick != null)) {
        return;
    }
    if (!(joystick.*.hwdata != null)) {
        return;
    }
    hwdata = joystick.*.hwdata;
    if (hwdata.*.desc.Update != null) {
        hwdata.*.desc.Update.?(hwdata.*.desc.userdata);
    }
    if ((hwdata.*.changes & @as(Uint32, AXES_CHANGED)) != 0) {
        {
            var i: Uint8 = 0;
            _ = &i;
            while (@as(c_int, i) < @as(c_int, hwdata.*.desc.naxes)) : (i +%= 1) {
                SDL_SendJoystickAxis(timestamp, joystick, i, hwdata.*.axes[i]);
            }
        }
    }
    if ((hwdata.*.changes & @as(Uint32, BALLS_CHANGED)) != 0) {
        {
            var i: Uint8 = 0;
            _ = &i;
            while (@as(c_int, i) < @as(c_int, hwdata.*.desc.nballs)) : (i +%= 1) {
                var ball: [*c]SDL_JoystickBallData = &hwdata.*.balls[i];
                _ = &ball;
                if ((ball.*.dx != 0) or (ball.*.dy != 0)) {
                    SDL_SendJoystickBall(timestamp, joystick, i, @truncate(ball.*.dx), @truncate(ball.*.dy));
                    ball.*.dx = 0;
                    ball.*.dy = 0;
                }
            }
        }
    }
    if ((hwdata.*.changes & @as(Uint32, BUTTONS_CHANGED)) != 0) {
        {
            var i: Uint8 = 0;
            _ = &i;
            while (@as(c_int, i) < @as(c_int, hwdata.*.desc.nbuttons)) : (i +%= 1) {
                SDL_SendJoystickButton(timestamp, joystick, i, hwdata.*.buttons[i]);
            }
        }
    }
    if ((hwdata.*.changes & @as(Uint32, HATS_CHANGED)) != 0) {
        {
            var i: Uint8 = 0;
            _ = &i;
            while (@as(c_int, i) < @as(c_int, hwdata.*.desc.nhats)) : (i +%= 1) {
                SDL_SendJoystickHat(timestamp, joystick, i, hwdata.*.hats[i]);
            }
        }
    }
    if ((hwdata.*.changes & @as(Uint32, TOUCHPADS_CHANGED)) != 0) {
        {
            var i: Uint16 = 0;
            _ = &i;
            while (@as(c_int, i) < @as(c_int, hwdata.*.desc.ntouchpads)) : (i +%= 1) {
                var touchpad: [*c]const SDL_JoystickTouchpadInfo = &hwdata.*.touchpads[i];
                _ = &touchpad;
                {
                    var j: c_int = 0;
                    _ = &j;
                    while (j < touchpad.*.nfingers) : (j += 1) {
                        var finger: [*c]const SDL_JoystickTouchpadFingerInfo = &touchpad.*.fingers[@bitCast(@as(isize, @intCast(j)))];
                        _ = &finger;
                        SDL_SendJoystickTouchpad(timestamp, joystick, i, j, finger.*.down, finger.*.x, finger.*.y, finger.*.pressure);
                    }
                }
            }
        }
    }
    if (hwdata.*.num_sensor_events > @as(c_int, 0)) {
        if (hwdata.*.sensors_enabled) {
            {
                var i: c_int = 0;
                _ = &i;
                while (i < hwdata.*.num_sensor_events) : (i += 1) {
                    var event: [*c]const VirtualSensorEvent = &hwdata.*.sensor_events[@bitCast(@as(isize, @intCast(i)))];
                    _ = &event;
                    SDL_SendJoystickSensor(timestamp, joystick, event.*.type, event.*.sensor_timestamp, @ptrCast(@alignCast(&event.*.data)), event.*.num_values);
                }
            }
        }
        hwdata.*.num_sensor_events = 0;
    }
    hwdata.*.changes = 0;
}
pub fn VIRTUAL_JoystickClose(joystick: [*c]SDL_Joystick) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_AssertJoysticksLocked();
    if (joystick.*.hwdata != null) {
        var hwdata: [*c]joystick_hwdata = joystick.*.hwdata;
        _ = &hwdata;
        hwdata.*.joystick = null;
        joystick.*.hwdata = null;
    }
}
pub fn VIRTUAL_JoystickQuit() callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_AssertJoysticksLocked();
    while (g_VJoys != null) {
        VIRTUAL_FreeHWData(g_VJoys);
    }
}
pub fn VIRTUAL_JoystickGetGamepadMapping(device_index: c_int, out: [*c]SDL_GamepadMapping) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var hwdata: [*c]joystick_hwdata = VIRTUAL_HWDataForIndex(device_index);
    _ = &hwdata;
    var current_button: Uint8 = 0;
    _ = &current_button;
    var current_axis: Uint8 = 0;
    _ = &current_axis;
    if (!(hwdata != null) or (@as(c_int, hwdata.*.desc.type) != SDL_JOYSTICK_TYPE_GAMEPAD)) {
        return @"false" != 0;
    }
    if ((@as(Uint32, @bitCast(@as(c_int, @intFromBool(@as(c_int, current_button) < @as(c_int, hwdata.*.desc.nbuttons))))) != 0) and ((hwdata.*.desc.button_mask & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(SDL_GAMEPAD_BUTTON_SOUTH))))) != 0)) {
        out.*.a.kind = EMappingKind_Button;
        out.*.a.target = blk: {
            const ref = &current_button;
            const tmp = ref.*;
            ref.* +%= 1;
            break :blk tmp;
        };
    }
    if ((@as(Uint32, @bitCast(@as(c_int, @intFromBool(@as(c_int, current_button) < @as(c_int, hwdata.*.desc.nbuttons))))) != 0) and ((hwdata.*.desc.button_mask & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(SDL_GAMEPAD_BUTTON_EAST))))) != 0)) {
        out.*.b.kind = EMappingKind_Button;
        out.*.b.target = blk: {
            const ref = &current_button;
            const tmp = ref.*;
            ref.* +%= 1;
            break :blk tmp;
        };
    }
    if ((@as(Uint32, @bitCast(@as(c_int, @intFromBool(@as(c_int, current_button) < @as(c_int, hwdata.*.desc.nbuttons))))) != 0) and ((hwdata.*.desc.button_mask & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(SDL_GAMEPAD_BUTTON_WEST))))) != 0)) {
        out.*.x.kind = EMappingKind_Button;
        out.*.x.target = blk: {
            const ref = &current_button;
            const tmp = ref.*;
            ref.* +%= 1;
            break :blk tmp;
        };
    }
    if ((@as(Uint32, @bitCast(@as(c_int, @intFromBool(@as(c_int, current_button) < @as(c_int, hwdata.*.desc.nbuttons))))) != 0) and ((hwdata.*.desc.button_mask & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(SDL_GAMEPAD_BUTTON_NORTH))))) != 0)) {
        out.*.y.kind = EMappingKind_Button;
        out.*.y.target = blk: {
            const ref = &current_button;
            const tmp = ref.*;
            ref.* +%= 1;
            break :blk tmp;
        };
    }
    if ((@as(Uint32, @bitCast(@as(c_int, @intFromBool(@as(c_int, current_button) < @as(c_int, hwdata.*.desc.nbuttons))))) != 0) and ((hwdata.*.desc.button_mask & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(SDL_GAMEPAD_BUTTON_BACK))))) != 0)) {
        out.*.back.kind = EMappingKind_Button;
        out.*.back.target = blk: {
            const ref = &current_button;
            const tmp = ref.*;
            ref.* +%= 1;
            break :blk tmp;
        };
    }
    if ((@as(Uint32, @bitCast(@as(c_int, @intFromBool(@as(c_int, current_button) < @as(c_int, hwdata.*.desc.nbuttons))))) != 0) and ((hwdata.*.desc.button_mask & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(SDL_GAMEPAD_BUTTON_GUIDE))))) != 0)) {
        out.*.guide.kind = EMappingKind_Button;
        out.*.guide.target = blk: {
            const ref = &current_button;
            const tmp = ref.*;
            ref.* +%= 1;
            break :blk tmp;
        };
    }
    if ((@as(Uint32, @bitCast(@as(c_int, @intFromBool(@as(c_int, current_button) < @as(c_int, hwdata.*.desc.nbuttons))))) != 0) and ((hwdata.*.desc.button_mask & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(SDL_GAMEPAD_BUTTON_START))))) != 0)) {
        out.*.start.kind = EMappingKind_Button;
        out.*.start.target = blk: {
            const ref = &current_button;
            const tmp = ref.*;
            ref.* +%= 1;
            break :blk tmp;
        };
    }
    if ((@as(Uint32, @bitCast(@as(c_int, @intFromBool(@as(c_int, current_button) < @as(c_int, hwdata.*.desc.nbuttons))))) != 0) and ((hwdata.*.desc.button_mask & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(SDL_GAMEPAD_BUTTON_LEFT_STICK))))) != 0)) {
        out.*.leftstick.kind = EMappingKind_Button;
        out.*.leftstick.target = blk: {
            const ref = &current_button;
            const tmp = ref.*;
            ref.* +%= 1;
            break :blk tmp;
        };
    }
    if ((@as(Uint32, @bitCast(@as(c_int, @intFromBool(@as(c_int, current_button) < @as(c_int, hwdata.*.desc.nbuttons))))) != 0) and ((hwdata.*.desc.button_mask & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(SDL_GAMEPAD_BUTTON_RIGHT_STICK))))) != 0)) {
        out.*.rightstick.kind = EMappingKind_Button;
        out.*.rightstick.target = blk: {
            const ref = &current_button;
            const tmp = ref.*;
            ref.* +%= 1;
            break :blk tmp;
        };
    }
    if ((@as(Uint32, @bitCast(@as(c_int, @intFromBool(@as(c_int, current_button) < @as(c_int, hwdata.*.desc.nbuttons))))) != 0) and ((hwdata.*.desc.button_mask & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(SDL_GAMEPAD_BUTTON_LEFT_SHOULDER))))) != 0)) {
        out.*.leftshoulder.kind = EMappingKind_Button;
        out.*.leftshoulder.target = blk: {
            const ref = &current_button;
            const tmp = ref.*;
            ref.* +%= 1;
            break :blk tmp;
        };
    }
    if ((@as(Uint32, @bitCast(@as(c_int, @intFromBool(@as(c_int, current_button) < @as(c_int, hwdata.*.desc.nbuttons))))) != 0) and ((hwdata.*.desc.button_mask & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER))))) != 0)) {
        out.*.rightshoulder.kind = EMappingKind_Button;
        out.*.rightshoulder.target = blk: {
            const ref = &current_button;
            const tmp = ref.*;
            ref.* +%= 1;
            break :blk tmp;
        };
    }
    if ((@as(Uint32, @bitCast(@as(c_int, @intFromBool(@as(c_int, current_button) < @as(c_int, hwdata.*.desc.nbuttons))))) != 0) and ((hwdata.*.desc.button_mask & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(SDL_GAMEPAD_BUTTON_DPAD_UP))))) != 0)) {
        out.*.dpup.kind = EMappingKind_Button;
        out.*.dpup.target = blk: {
            const ref = &current_button;
            const tmp = ref.*;
            ref.* +%= 1;
            break :blk tmp;
        };
    }
    if ((@as(Uint32, @bitCast(@as(c_int, @intFromBool(@as(c_int, current_button) < @as(c_int, hwdata.*.desc.nbuttons))))) != 0) and ((hwdata.*.desc.button_mask & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(SDL_GAMEPAD_BUTTON_DPAD_DOWN))))) != 0)) {
        out.*.dpdown.kind = EMappingKind_Button;
        out.*.dpdown.target = blk: {
            const ref = &current_button;
            const tmp = ref.*;
            ref.* +%= 1;
            break :blk tmp;
        };
    }
    if ((@as(Uint32, @bitCast(@as(c_int, @intFromBool(@as(c_int, current_button) < @as(c_int, hwdata.*.desc.nbuttons))))) != 0) and ((hwdata.*.desc.button_mask & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(SDL_GAMEPAD_BUTTON_DPAD_LEFT))))) != 0)) {
        out.*.dpleft.kind = EMappingKind_Button;
        out.*.dpleft.target = blk: {
            const ref = &current_button;
            const tmp = ref.*;
            ref.* +%= 1;
            break :blk tmp;
        };
    }
    if ((@as(Uint32, @bitCast(@as(c_int, @intFromBool(@as(c_int, current_button) < @as(c_int, hwdata.*.desc.nbuttons))))) != 0) and ((hwdata.*.desc.button_mask & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(SDL_GAMEPAD_BUTTON_DPAD_RIGHT))))) != 0)) {
        out.*.dpright.kind = EMappingKind_Button;
        out.*.dpright.target = blk: {
            const ref = &current_button;
            const tmp = ref.*;
            ref.* +%= 1;
            break :blk tmp;
        };
    }
    if ((@as(Uint32, @bitCast(@as(c_int, @intFromBool(@as(c_int, current_button) < @as(c_int, hwdata.*.desc.nbuttons))))) != 0) and ((hwdata.*.desc.button_mask & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(SDL_GAMEPAD_BUTTON_MISC1))))) != 0)) {
        out.*.misc1.kind = EMappingKind_Button;
        out.*.misc1.target = blk: {
            const ref = &current_button;
            const tmp = ref.*;
            ref.* +%= 1;
            break :blk tmp;
        };
    }
    if ((@as(Uint32, @bitCast(@as(c_int, @intFromBool(@as(c_int, current_button) < @as(c_int, hwdata.*.desc.nbuttons))))) != 0) and ((hwdata.*.desc.button_mask & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(SDL_GAMEPAD_BUTTON_RIGHT_PADDLE1))))) != 0)) {
        out.*.right_paddle1.kind = EMappingKind_Button;
        out.*.right_paddle1.target = blk: {
            const ref = &current_button;
            const tmp = ref.*;
            ref.* +%= 1;
            break :blk tmp;
        };
    }
    if ((@as(Uint32, @bitCast(@as(c_int, @intFromBool(@as(c_int, current_button) < @as(c_int, hwdata.*.desc.nbuttons))))) != 0) and ((hwdata.*.desc.button_mask & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(SDL_GAMEPAD_BUTTON_LEFT_PADDLE1))))) != 0)) {
        out.*.left_paddle1.kind = EMappingKind_Button;
        out.*.left_paddle1.target = blk: {
            const ref = &current_button;
            const tmp = ref.*;
            ref.* +%= 1;
            break :blk tmp;
        };
    }
    if ((@as(Uint32, @bitCast(@as(c_int, @intFromBool(@as(c_int, current_button) < @as(c_int, hwdata.*.desc.nbuttons))))) != 0) and ((hwdata.*.desc.button_mask & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(SDL_GAMEPAD_BUTTON_RIGHT_PADDLE2))))) != 0)) {
        out.*.right_paddle2.kind = EMappingKind_Button;
        out.*.right_paddle2.target = blk: {
            const ref = &current_button;
            const tmp = ref.*;
            ref.* +%= 1;
            break :blk tmp;
        };
    }
    if ((@as(Uint32, @bitCast(@as(c_int, @intFromBool(@as(c_int, current_button) < @as(c_int, hwdata.*.desc.nbuttons))))) != 0) and ((hwdata.*.desc.button_mask & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(SDL_GAMEPAD_BUTTON_LEFT_PADDLE2))))) != 0)) {
        out.*.left_paddle2.kind = EMappingKind_Button;
        out.*.left_paddle2.target = blk: {
            const ref = &current_button;
            const tmp = ref.*;
            ref.* +%= 1;
            break :blk tmp;
        };
    }
    if ((@as(Uint32, @bitCast(@as(c_int, @intFromBool(@as(c_int, current_button) < @as(c_int, hwdata.*.desc.nbuttons))))) != 0) and ((hwdata.*.desc.button_mask & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(SDL_GAMEPAD_BUTTON_TOUCHPAD))))) != 0)) {
        out.*.touchpad.kind = EMappingKind_Button;
        out.*.touchpad.target = blk: {
            const ref = &current_button;
            const tmp = ref.*;
            ref.* +%= 1;
            break :blk tmp;
        };
    }
    if ((@as(Uint32, @bitCast(@as(c_int, @intFromBool(@as(c_int, current_button) < @as(c_int, hwdata.*.desc.nbuttons))))) != 0) and ((hwdata.*.desc.button_mask & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(SDL_GAMEPAD_BUTTON_MISC2))))) != 0)) {
        out.*.misc2.kind = EMappingKind_Button;
        out.*.misc2.target = blk: {
            const ref = &current_button;
            const tmp = ref.*;
            ref.* +%= 1;
            break :blk tmp;
        };
    }
    if ((@as(Uint32, @bitCast(@as(c_int, @intFromBool(@as(c_int, current_button) < @as(c_int, hwdata.*.desc.nbuttons))))) != 0) and ((hwdata.*.desc.button_mask & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(SDL_GAMEPAD_BUTTON_MISC3))))) != 0)) {
        out.*.misc3.kind = EMappingKind_Button;
        out.*.misc3.target = blk: {
            const ref = &current_button;
            const tmp = ref.*;
            ref.* +%= 1;
            break :blk tmp;
        };
    }
    if ((@as(Uint32, @bitCast(@as(c_int, @intFromBool(@as(c_int, current_button) < @as(c_int, hwdata.*.desc.nbuttons))))) != 0) and ((hwdata.*.desc.button_mask & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(SDL_GAMEPAD_BUTTON_MISC4))))) != 0)) {
        out.*.misc4.kind = EMappingKind_Button;
        out.*.misc4.target = blk: {
            const ref = &current_button;
            const tmp = ref.*;
            ref.* +%= 1;
            break :blk tmp;
        };
    }
    if ((@as(Uint32, @bitCast(@as(c_int, @intFromBool(@as(c_int, current_button) < @as(c_int, hwdata.*.desc.nbuttons))))) != 0) and ((hwdata.*.desc.button_mask & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(SDL_GAMEPAD_BUTTON_MISC5))))) != 0)) {
        out.*.misc5.kind = EMappingKind_Button;
        out.*.misc5.target = blk: {
            const ref = &current_button;
            const tmp = ref.*;
            ref.* +%= 1;
            break :blk tmp;
        };
    }
    if ((@as(Uint32, @bitCast(@as(c_int, @intFromBool(@as(c_int, current_button) < @as(c_int, hwdata.*.desc.nbuttons))))) != 0) and ((hwdata.*.desc.button_mask & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(SDL_GAMEPAD_BUTTON_MISC6))))) != 0)) {
        out.*.misc6.kind = EMappingKind_Button;
        out.*.misc6.target = blk: {
            const ref = &current_button;
            const tmp = ref.*;
            ref.* +%= 1;
            break :blk tmp;
        };
    }
    if ((@as(Uint32, @bitCast(@as(c_int, @intFromBool(@as(c_int, current_axis) < @as(c_int, hwdata.*.desc.naxes))))) != 0) and ((hwdata.*.desc.axis_mask & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(SDL_GAMEPAD_AXIS_LEFTX))))) != 0)) {
        out.*.leftx.kind = EMappingKind_Axis;
        out.*.leftx.target = blk: {
            const ref = &current_axis;
            const tmp = ref.*;
            ref.* +%= 1;
            break :blk tmp;
        };
    }
    if ((@as(Uint32, @bitCast(@as(c_int, @intFromBool(@as(c_int, current_axis) < @as(c_int, hwdata.*.desc.naxes))))) != 0) and ((hwdata.*.desc.axis_mask & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(SDL_GAMEPAD_AXIS_LEFTY))))) != 0)) {
        out.*.lefty.kind = EMappingKind_Axis;
        out.*.lefty.target = blk: {
            const ref = &current_axis;
            const tmp = ref.*;
            ref.* +%= 1;
            break :blk tmp;
        };
    }
    if ((@as(Uint32, @bitCast(@as(c_int, @intFromBool(@as(c_int, current_axis) < @as(c_int, hwdata.*.desc.naxes))))) != 0) and ((hwdata.*.desc.axis_mask & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(SDL_GAMEPAD_AXIS_RIGHTX))))) != 0)) {
        out.*.rightx.kind = EMappingKind_Axis;
        out.*.rightx.target = blk: {
            const ref = &current_axis;
            const tmp = ref.*;
            ref.* +%= 1;
            break :blk tmp;
        };
    }
    if ((@as(Uint32, @bitCast(@as(c_int, @intFromBool(@as(c_int, current_axis) < @as(c_int, hwdata.*.desc.naxes))))) != 0) and ((hwdata.*.desc.axis_mask & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(SDL_GAMEPAD_AXIS_RIGHTY))))) != 0)) {
        out.*.righty.kind = EMappingKind_Axis;
        out.*.righty.target = blk: {
            const ref = &current_axis;
            const tmp = ref.*;
            ref.* +%= 1;
            break :blk tmp;
        };
    }
    if ((@as(Uint32, @bitCast(@as(c_int, @intFromBool(@as(c_int, current_axis) < @as(c_int, hwdata.*.desc.naxes))))) != 0) and ((hwdata.*.desc.axis_mask & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(SDL_GAMEPAD_AXIS_LEFT_TRIGGER))))) != 0)) {
        out.*.lefttrigger.kind = EMappingKind_Axis;
        out.*.lefttrigger.target = blk: {
            const ref = &current_axis;
            const tmp = ref.*;
            ref.* +%= 1;
            break :blk tmp;
        };
    }
    if ((@as(Uint32, @bitCast(@as(c_int, @intFromBool(@as(c_int, current_axis) < @as(c_int, hwdata.*.desc.naxes))))) != 0) and ((hwdata.*.desc.axis_mask & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(SDL_GAMEPAD_AXIS_RIGHT_TRIGGER))))) != 0)) {
        out.*.righttrigger.kind = EMappingKind_Axis;
        out.*.righttrigger.target = blk: {
            const ref = &current_axis;
            const tmp = ref.*;
            ref.* +%= 1;
            break :blk tmp;
        };
    }
    return @"true" != 0;
}
pub export var SDL_VIRTUAL_JoystickDriver: SDL_JoystickDriver = SDL_JoystickDriver{
    .Init = VIRTUAL_JoystickInit,
    .GetCount = VIRTUAL_JoystickGetCount,
    .Detect = VIRTUAL_JoystickDetect,
    .IsDevicePresent = VIRTUAL_JoystickIsDevicePresent,
    .GetDeviceName = VIRTUAL_JoystickGetDeviceName,
    .GetDevicePath = VIRTUAL_JoystickGetDevicePath,
    .GetDeviceSteamVirtualGamepadSlot = VIRTUAL_JoystickGetDeviceSteamVirtualGamepadSlot,
    .GetDevicePlayerIndex = VIRTUAL_JoystickGetDevicePlayerIndex,
    .SetDevicePlayerIndex = VIRTUAL_JoystickSetDevicePlayerIndex,
    .GetDeviceGUID = VIRTUAL_JoystickGetDeviceGUID,
    .GetDeviceInstanceID = VIRTUAL_JoystickGetDeviceInstanceID,
    .Open = VIRTUAL_JoystickOpen,
    .Rumble = VIRTUAL_JoystickRumble,
    .RumbleTriggers = VIRTUAL_JoystickRumbleTriggers,
    .SetLED = VIRTUAL_JoystickSetLED,
    .SendEffect = VIRTUAL_JoystickSendEffect,
    .SetSensorsEnabled = VIRTUAL_JoystickSetSensorsEnabled,
    .Update = VIRTUAL_JoystickUpdate,
    .Close = VIRTUAL_JoystickClose,
    .Quit = VIRTUAL_JoystickQuit,
    .GetGamepadMapping = VIRTUAL_JoystickGetGamepadMapping,
};

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_HARDWARE_BUS_VIRTUAL = @as(c_int, 0xFF);
pub const AXES_CHANGED = @as(c_int, 0x00000001);
pub const BALLS_CHANGED = @as(c_int, 0x00000002);
pub const BUTTONS_CHANGED = @as(c_int, 0x00000004);
pub const HATS_CHANGED = @as(c_int, 0x00000008);
pub const TOUCHPADS_CHANGED = @as(c_int, 0x00000010);
