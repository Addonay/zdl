// /*
//   Simple DirectMedia Layer
//   Copyright (C) 2025 Simon Wood <simon@mungewell.org>
//   Copyright (C) 2025 Michal Malý <madcatxster@devoid-pointer.net>
//   Copyright (C) 2025 Katharine Chui <katharine.chui@gmail.com>
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
pub const Sint32 = i32;
pub const Uint32 = u32;
pub const Uint64 = u64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_getenv_REAL(name: [*c]const u8) [*c]const u8;
pub extern fn SDL_atoi_REAL(str: [*c]const u8) c_int;
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
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub extern fn SDL_OutOfMemory_REAL() bool;
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
pub const SDL_JOYSTICK_TYPE_WHEEL: c_int = 2;
pub const enum_SDL_JoystickType = c_uint;
pub const SDL_JoystickType = enum_SDL_JoystickType;
pub extern fn SDL_GetJoystickFromID_REAL(instance_id: SDL_JoystickID) [*c]SDL_Joystick;
pub const enum_SDL_GamepadType = c_uint;
pub const SDL_GamepadType = enum_SDL_GamepadType;
pub const SDL_GAMEPAD_BUTTON_SOUTH: c_int = 0;
pub const SDL_GAMEPAD_AXIS_LEFTX: c_int = 0;
pub const SDL_GAMEPAD_AXIS_LEFTY: c_int = 1;
pub const SDL_GAMEPAD_AXIS_RIGHTX: c_int = 2;
pub const SDL_GAMEPAD_AXIS_RIGHTY: c_int = 3;
pub const struct_SDL_hid_device = opaque {
};
pub const SDL_hid_device = struct_SDL_hid_device;
pub extern fn SDL_hid_write_REAL(dev: ?*SDL_hid_device, data: [*c]const u8, length: usize) c_int;
pub extern fn SDL_hid_read_REAL(dev: ?*SDL_hid_device, data: [*c]u8, length: usize) c_int;
pub extern fn SDL_hid_set_nonblocking_REAL(dev: ?*SDL_hid_device, nonblock: c_int) c_int;
pub extern fn SDL_GetHintBoolean_REAL(name: [*c]const u8, default_value: bool) bool;
pub const SDL_HintCallback = ?*const fn (userdata: ?*anyopaque, name: [*c]const u8, oldValue: [*c]const u8, newValue: [*c]const u8) callconv(.c) void;
pub extern fn SDL_AddHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) bool;
pub extern fn SDL_RemoveHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) void;
pub extern fn SDL_GetTicksNS_REAL() Uint64;
pub extern fn SDL_AssertJoysticksLocked() void;
pub extern fn SDL_SendJoystickAxis(timestamp: Uint64, joystick: [*c]SDL_Joystick, axis: Uint8, value: Sint16) void;
pub extern fn SDL_SendJoystickHat(timestamp: Uint64, joystick: [*c]SDL_Joystick, hat: Uint8, value: Uint8) void;
pub extern fn SDL_SendJoystickButton(timestamp: Uint64, joystick: [*c]SDL_Joystick, button: Uint8, down: bool) void;
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
pub var supported_device_ids: [6]Uint32 = [6]Uint32{
    USB_DEVICE_ID_LOGITECH_G29_WHEEL,
    USB_DEVICE_ID_LOGITECH_G27_WHEEL,
    USB_DEVICE_ID_LOGITECH_G25_WHEEL,
    USB_DEVICE_ID_LOGITECH_DFGT_WHEEL,
    USB_DEVICE_ID_LOGITECH_DFP_WHEEL,
    USB_DEVICE_ID_LOGITECH_WHEEL,
};
pub var supported_device_names: [6][*c]const u8 = [6][*c]const u8{
    "Logitech G29",
    "Logitech G27",
    "Logitech G25",
    "Logitech Driving Force GT",
    "Logitech Driving Force Pro",
    "Driving Force EX",
};
pub fn HIDAPI_DriverLg4ff_GetDeviceName(device_id: Uint32) callconv(.c) [*c]const u8 {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [32:0]u8 = "HIDAPI_DriverLg4ff_GetDeviceName".*;
    };
    _ = &static_local___func__;
    {
        var i: c_int = 0;
        _ = &i;
        while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(supported_device_ids)) / @sizeOf(Uint32))) : (i += 1) {
            if (supported_device_ids[@bitCast(@as(isize, @intCast(i)))] == device_id) {
                return supported_device_names[@bitCast(@as(isize, @intCast(i)))];
            }
        }
    }
    while (true) {
        while (!(@as(c_int, 0) != 0)) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "0",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_hidapi_lg4ff.c", 68);
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
    return "";
}
pub fn HIDAPI_DriverLg4ff_GetNumberOfButtons(device_id: Uint32) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [37:0]u8 = "HIDAPI_DriverLg4ff_GetNumberOfButtons".*;
    };
    _ = &static_local___func__;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "0",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data;
    var sdl_assert_state: SDL_AssertState = undefined;
    _ = &sdl_assert_state;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (device_id) {
                    @as(Uint32, USB_DEVICE_ID_LOGITECH_G29_WHEEL) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(Uint32, USB_DEVICE_ID_LOGITECH_G27_WHEEL) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(Uint32, USB_DEVICE_ID_LOGITECH_G25_WHEEL) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(Uint32, USB_DEVICE_ID_LOGITECH_DFGT_WHEEL) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(Uint32, USB_DEVICE_ID_LOGITECH_DFP_WHEEL) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(Uint32, USB_DEVICE_ID_LOGITECH_WHEEL) => {
                        sdl_pc = 7;
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
                return 25;
            },
            3 => {
                return 23;
            },
            4 => {
                return 19;
            },
            5 => {
                return 21;
            },
            6 => {
                return 14;
            },
            7 => {
                return 13;
            },
            8 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            10 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                return 0;
            },
            12 => {
                if (!(@as(c_int, 0) != 0)) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            13 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_hidapi_lg4ff.c", 88);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
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
                    sdl_pc = 12;
                    continue;
                }
            },
            16 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            18 => {
                __builtin.debugtrap();
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
                    sdl_pc = 17;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub const SDL_DriverLg4ff_Context = extern struct {
    last_report_buf: [32]Uint8 = @import("std").mem.zeroes([32]Uint8),
    initialized: bool = false,
    is_ffex: bool = false,
    range: Uint16 = 0,
};
pub fn HIDAPI_DriverLg4ff_RegisterHints(callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = SDL_AddHintCallback_REAL("SDL_JOYSTICK_HIDAPI_LG4FF", callback, userdata);
}
pub fn HIDAPI_DriverLg4ff_UnregisterHints(callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_RemoveHintCallback_REAL("SDL_JOYSTICK_HIDAPI_LG4FF", callback, userdata);
}
pub fn HIDAPI_DriverLg4ff_IsEnabled() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var hint_default: bool = SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI", @"true" != 0);
    _ = &hint_default;
    var enabled: bool = SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI_LG4FF", hint_default);
    _ = &enabled;
    return enabled;
}
pub fn HIDAPI_DriverLg4ff_IdentifyWheel(device_id: Uint16, release_number: Uint16) callconv(.c) Uint16 {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (@as(c_int, device_id)) {
                    USB_DEVICE_ID_LOGITECH_DFP_WHEEL => {
                        sdl_pc = 2;
                        continue;
                    },
                    USB_DEVICE_ID_LOGITECH_WHEEL => {
                        sdl_pc = 3;
                        continue;
                    },
                    USB_DEVICE_ID_LOGITECH_DFGT_WHEEL => {
                        sdl_pc = 22;
                        continue;
                    },
                    USB_DEVICE_ID_LOGITECH_G25_WHEEL => {
                        sdl_pc = 32;
                        continue;
                    },
                    USB_DEVICE_ID_LOGITECH_G27_WHEEL => {
                        sdl_pc = 45;
                        continue;
                    },
                    USB_DEVICE_ID_LOGITECH_G29_WHEEL => {
                        sdl_pc = 55;
                        continue;
                    },
                    else => {
                        sdl_pc = 1;
                        continue;
                    },
                }
            },
            1 => {
                return 0;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                if ((@as(c_int, release_number) & @as(c_int, 65528)) == @as(c_int, 4944)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                return USB_DEVICE_ID_LOGITECH_G29_WHEEL;
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                if ((@as(c_int, release_number) & @as(c_int, 65280)) == @as(c_int, 35072)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                return USB_DEVICE_ID_LOGITECH_G29_WHEEL;
            },
            8 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                if ((@as(c_int, release_number) & @as(c_int, 65520)) == @as(c_int, 4656)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                return USB_DEVICE_ID_LOGITECH_G27_WHEEL;
            },
            11 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                if ((@as(c_int, release_number) & @as(c_int, 65280)) == @as(c_int, 4608)) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            13 => {
                return USB_DEVICE_ID_LOGITECH_G25_WHEEL;
            },
            14 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                if ((@as(c_int, release_number) & @as(c_int, 65280)) == @as(c_int, 4864)) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            16 => {
                return USB_DEVICE_ID_LOGITECH_DFGT_WHEEL;
            },
            17 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            18 => {
                if ((@as(c_int, release_number) & @as(c_int, 61440)) == @as(c_int, 4096)) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            19 => {
                return USB_DEVICE_ID_LOGITECH_DFP_WHEEL;
            },
            20 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            21 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            22 => {
                if ((@as(c_int, release_number) & @as(c_int, 65528)) == @as(c_int, 4944)) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                return USB_DEVICE_ID_LOGITECH_G29_WHEEL;
            },
            24 => {
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            25 => {
                if ((@as(c_int, release_number) & @as(c_int, 65280)) == @as(c_int, 35072)) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            26 => {
                return USB_DEVICE_ID_LOGITECH_G29_WHEEL;
            },
            27 => {
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            28 => {
                if ((@as(c_int, release_number) & @as(c_int, 65280)) == @as(c_int, 4864)) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            29 => {
                return USB_DEVICE_ID_LOGITECH_DFGT_WHEEL;
            },
            30 => {
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            31 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            32 => {
                if ((@as(c_int, release_number) & @as(c_int, 65528)) == @as(c_int, 4944)) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 34;
                    continue;
                }
            },
            33 => {
                return USB_DEVICE_ID_LOGITECH_G29_WHEEL;
            },
            34 => {
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            35 => {
                if ((@as(c_int, release_number) & @as(c_int, 65280)) == @as(c_int, 35072)) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 37;
                    continue;
                }
            },
            36 => {
                return USB_DEVICE_ID_LOGITECH_G29_WHEEL;
            },
            37 => {
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            38 => {
                if ((@as(c_int, release_number) & @as(c_int, 65520)) == @as(c_int, 4656)) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 40;
                    continue;
                }
            },
            39 => {
                return USB_DEVICE_ID_LOGITECH_G27_WHEEL;
            },
            40 => {
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            41 => {
                if ((@as(c_int, release_number) & @as(c_int, 65280)) == @as(c_int, 4608)) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 43;
                    continue;
                }
            },
            42 => {
                return USB_DEVICE_ID_LOGITECH_G25_WHEEL;
            },
            43 => {
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            44 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            45 => {
                if ((@as(c_int, release_number) & @as(c_int, 65528)) == @as(c_int, 4944)) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 47;
                    continue;
                }
            },
            46 => {
                return USB_DEVICE_ID_LOGITECH_G29_WHEEL;
            },
            47 => {
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            48 => {
                if ((@as(c_int, release_number) & @as(c_int, 65280)) == @as(c_int, 35072)) {
                    sdl_pc = 49;
                    continue;
                } else {
                    sdl_pc = 50;
                    continue;
                }
            },
            49 => {
                return USB_DEVICE_ID_LOGITECH_G29_WHEEL;
            },
            50 => {
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            51 => {
                if ((@as(c_int, release_number) & @as(c_int, 65520)) == @as(c_int, 4656)) {
                    sdl_pc = 52;
                    continue;
                } else {
                    sdl_pc = 53;
                    continue;
                }
            },
            52 => {
                return USB_DEVICE_ID_LOGITECH_G27_WHEEL;
            },
            53 => {
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            54 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            55 => {
                if ((@as(c_int, release_number) & @as(c_int, 65528)) == @as(c_int, 4944)) {
                    sdl_pc = 56;
                    continue;
                } else {
                    sdl_pc = 57;
                    continue;
                }
            },
            56 => {
                return USB_DEVICE_ID_LOGITECH_G29_WHEEL;
            },
            57 => {
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            58 => {
                if ((@as(c_int, release_number) & @as(c_int, 65280)) == @as(c_int, 35072)) {
                    sdl_pc = 59;
                    continue;
                } else {
                    sdl_pc = 60;
                    continue;
                }
            },
            59 => {
                return USB_DEVICE_ID_LOGITECH_G29_WHEEL;
            },
            60 => {
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            61 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn SDL_HIDAPI_DriverLg4ff_GetEnvInt(env_name: [*c]const u8, min: c_int, max: c_int, def: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var env: [*c]const u8 = SDL_getenv_REAL(env_name);
    _ = &env;
    var value: c_int = 0;
    _ = &value;
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(env)))) == @as(?*anyopaque, null)) {
        return def;
    }
    value = SDL_atoi_REAL(env);
    if (value < min) {
        value = min;
    }
    if (value > max) {
        value = max;
    }
    return value;
}
pub fn HIDAPI_DriverLg4ff_SwitchMode(device: [*c]SDL_HIDAPI_Device, target_product_id: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [29:0]u8 = "HIDAPI_DriverLg4ff_SwitchMode".*;
    };
    _ = &static_local___func__;
    var ret: c_int = undefined;
    _ = &ret;
    var cmd: [7]Uint8 = undefined;
    _ = &cmd;
    var cmd_1: [7]Uint8 = undefined;
    _ = &cmd_1;
    var cmd_2: [7]Uint8 = undefined;
    _ = &cmd_2;
    var cmd_3: [7]Uint8 = undefined;
    _ = &cmd_3;
    var cmd_4: [7]Uint8 = undefined;
    _ = &cmd_4;
    var cmd_5: [7]Uint8 = undefined;
    _ = &cmd_5;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "0",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data;
    var sdl_assert_state: SDL_AssertState = undefined;
    _ = &sdl_assert_state;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                ret = 0;
                switch (@as(c_int, target_product_id)) {
                    USB_DEVICE_ID_LOGITECH_G29_WHEEL => {
                        sdl_pc = 2;
                        continue;
                    },
                    USB_DEVICE_ID_LOGITECH_G27_WHEEL => {
                        sdl_pc = 3;
                        continue;
                    },
                    USB_DEVICE_ID_LOGITECH_G25_WHEEL => {
                        sdl_pc = 4;
                        continue;
                    },
                    USB_DEVICE_ID_LOGITECH_DFGT_WHEEL => {
                        sdl_pc = 5;
                        continue;
                    },
                    USB_DEVICE_ID_LOGITECH_DFP_WHEEL => {
                        sdl_pc = 6;
                        continue;
                    },
                    USB_DEVICE_ID_LOGITECH_WHEEL => {
                        sdl_pc = 7;
                        continue;
                    },
                    else => {
                        sdl_pc = 8;
                        continue;
                    },
                }
            },
            1 => {
                if (ret == -@as(c_int, 1)) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            2 => {
                cmd = [7]Uint8{
                    248,
                    9,
                    5,
                    1,
                    1,
                    0,
                    0,
                };
                ret = SDL_hid_write_REAL(device.*.dev, @ptrCast(@alignCast(&cmd)), @sizeOf(@TypeOf(cmd)));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                cmd_1 = [7]Uint8{
                    248,
                    9,
                    4,
                    1,
                    0,
                    0,
                    0,
                };
                ret = SDL_hid_write_REAL(device.*.dev, @ptrCast(@alignCast(&cmd_1)), @sizeOf(@TypeOf(cmd_1)));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                cmd_2 = [7]Uint8{
                    248,
                    16,
                    0,
                    0,
                    0,
                    0,
                    0,
                };
                ret = SDL_hid_write_REAL(device.*.dev, @ptrCast(@alignCast(&cmd_2)), @sizeOf(@TypeOf(cmd_2)));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            5 => {
                cmd_3 = [7]Uint8{
                    248,
                    9,
                    3,
                    1,
                    0,
                    0,
                    0,
                };
                ret = SDL_hid_write_REAL(device.*.dev, @ptrCast(@alignCast(&cmd_3)), @sizeOf(@TypeOf(cmd_3)));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            6 => {
                cmd_4 = [7]Uint8{
                    248,
                    1,
                    0,
                    0,
                    0,
                    0,
                    0,
                };
                ret = SDL_hid_write_REAL(device.*.dev, @ptrCast(@alignCast(&cmd_4)), @sizeOf(@TypeOf(cmd_4)));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            7 => {
                cmd_5 = [7]Uint8{
                    248,
                    9,
                    0,
                    1,
                    0,
                    0,
                    0,
                };
                ret = SDL_hid_write_REAL(device.*.dev, @ptrCast(@alignCast(&cmd_5)), @sizeOf(@TypeOf(cmd_5)));
                {
                    sdl_pc = 1;
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
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            10 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 11;
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
                if (!(@as(c_int, 0) != 0)) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            13 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_hidapi_lg4ff.c", 250);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
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
                    sdl_pc = 12;
                    continue;
                }
            },
            16 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            18 => {
                __builtin.debugtrap();
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
                    sdl_pc = 17;
                    continue;
                }
            },
            21 => {
                return @"false" != 0;
            },
            22 => {
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            23 => {
                return @"true" != 0;
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverLg4ff_IsSupportedDevice(device: [*c]SDL_HIDAPI_Device, _: [*c]const u8, arg_type: SDL_GamepadType, vendor_id: Uint16, product_id: Uint16, version: Uint16, _: c_int, _: c_int, _: c_int, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var i: c_int = undefined;
    _ = &i;
    if (@as(c_int, vendor_id) != USB_VENDOR_ID_LOGITECH) {
        return @"false" != 0;
    }
    {
        i = 0;
        while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(supported_device_ids)) / @sizeOf(@TypeOf(supported_device_ids[@as(c_int, 0)])))) : (i += 1) {
            if (supported_device_ids[@bitCast(@as(isize, @intCast(i)))] == @as(Uint32, @bitCast(@as(c_int, @as(c_int, product_id))))) {
                break;
            }
        }
    }
    if (@as(c_ulong, @bitCast(@as(c_long, i))) == (@sizeOf(@TypeOf(supported_device_ids)) / @sizeOf(@TypeOf(supported_device_ids[@as(c_int, 0)])))) {
        return @"false" != 0;
    }
    var real_id: Uint16 = HIDAPI_DriverLg4ff_IdentifyWheel(product_id, version);
    _ = &real_id;
    if ((@as(c_int, real_id) == @as(c_int, product_id)) or (@as(c_int, real_id) == @as(c_int, 0))) {
        return @"true" != 0;
    }
    if ((device != null) and (SDL_HIDAPI_DriverLg4ff_GetEnvInt("SDL_HIDAPI_LG4FF_NO_MODE_SWITCH", 0, 1, 0) == @as(c_int, 0))) {
        _ = HIDAPI_DriverLg4ff_SwitchMode(device, real_id);
    }
    return @"true" != 0;
}
pub fn HIDAPI_DriverLg4ff_SetRange(device: [*c]SDL_HIDAPI_Device, arg_range: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var range = arg_range;
    _ = &range;
    const static_local___func__ = struct {
        const __func__: [27:0]u8 = "HIDAPI_DriverLg4ff_SetRange".*;
    };
    _ = &static_local___func__;
    var cmd: [7]Uint8 = undefined;
    _ = &cmd;
    var ret: c_int = undefined;
    _ = &ret;
    var ctx: [*c]SDL_DriverLg4ff_Context = undefined;
    _ = &ctx;
    var start_left: c_int = undefined;
    _ = &start_left;
    var start_right: c_int = undefined;
    _ = &start_right;
    var full_range: c_int = undefined;
    _ = &full_range;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "0",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data;
    var sdl_assert_state: SDL_AssertState = undefined;
    _ = &sdl_assert_state;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                cmd = [1]Uint8{
                    0,
                } ++ @as([6]Uint8, @splat(0));
                ret = 0;
                ctx = @ptrCast(@alignCast(device.*.context));
                if (range < @as(c_int, 40)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                range = 40;
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
                if (range > @as(c_int, 900)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                range = 900;
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
                ctx.*.range = @bitCast(@as(c_short, @truncate(range)));
                switch (@as(c_int, device.*.product_id)) {
                    USB_DEVICE_ID_LOGITECH_G29_WHEEL => {
                        sdl_pc = 8;
                        continue;
                    },
                    USB_DEVICE_ID_LOGITECH_G27_WHEEL => {
                        sdl_pc = 9;
                        continue;
                    },
                    USB_DEVICE_ID_LOGITECH_G25_WHEEL => {
                        sdl_pc = 10;
                        continue;
                    },
                    USB_DEVICE_ID_LOGITECH_DFGT_WHEEL => {
                        sdl_pc = 11;
                        continue;
                    },
                    USB_DEVICE_ID_LOGITECH_DFP_WHEEL => {
                        sdl_pc = 15;
                        continue;
                    },
                    USB_DEVICE_ID_LOGITECH_WHEEL => {
                        sdl_pc = 28;
                        continue;
                    },
                    else => {
                        sdl_pc = 29;
                        continue;
                    },
                }
            },
            7 => {
                return @"true" != 0;
            },
            8 => {
                {
                    sdl_pc = 9;
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
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                cmd[@as(c_int, 0)] = 248;
                cmd[@as(c_int, 1)] = 129;
                cmd[@as(c_int, 2)] = @bitCast(@as(i8, @truncate(range & @as(c_int, 255))));
                cmd[@as(c_int, 3)] = @bitCast(@as(i8, @truncate((range & @as(c_int, 65280)) >> @intCast(@as(c_int, 8)))));
                ret = SDL_hid_write_REAL(device.*.dev, @ptrCast(@alignCast(&cmd)), @sizeOf(@TypeOf(cmd)));
                if (ret == -@as(c_int, 1)) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            12 => {
                return @"false" != 0;
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
            15 => {
                cmd[@as(c_int, 0)] = 248;
                cmd[@as(c_int, 1)] = 0;
                cmd[@as(c_int, 2)] = 0;
                cmd[@as(c_int, 3)] = 0;
                cmd[@as(c_int, 4)] = 0;
                cmd[@as(c_int, 5)] = 0;
                cmd[@as(c_int, 6)] = 0;
                if (range > @as(c_int, 200)) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            16 => {
                cmd[@as(c_int, 1)] = 3;
                full_range = 900;
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            17 => {
                cmd[@as(c_int, 1)] = 2;
                full_range = 200;
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            18 => {
                ret = SDL_hid_write_REAL(device.*.dev, @ptrCast(@alignCast(&cmd)), 7);
                if (ret == -@as(c_int, 1)) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            19 => {
                return @"false" != 0;
            },
            20 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            21 => {
                cmd[@as(c_int, 0)] = 129;
                cmd[@as(c_int, 1)] = 11;
                cmd[@as(c_int, 2)] = 0;
                cmd[@as(c_int, 3)] = 0;
                cmd[@as(c_int, 4)] = 0;
                cmd[@as(c_int, 5)] = 0;
                cmd[@as(c_int, 6)] = 0;
                if ((range != @as(c_int, 200)) and (range != @as(c_int, 900))) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            22 => {
                start_left = @divTrunc(((full_range - range) + @as(c_int, 1)) * @as(c_int, 2047), full_range);
                start_right = @as(c_int, 4095) - start_left;
                cmd[@as(c_int, 2)] = @bitCast(@as(i8, @truncate(start_left >> @intCast(@as(c_int, 4)))));
                cmd[@as(c_int, 3)] = @bitCast(@as(i8, @truncate(start_right >> @intCast(@as(c_int, 4)))));
                cmd[@as(c_int, 4)] = 255;
                cmd[@as(c_int, 5)] = @bitCast(@as(i8, @truncate(((start_right & @as(c_int, 14)) << @intCast(@as(c_int, 4))) | (start_left & @as(c_int, 14)))));
                cmd[@as(c_int, 6)] = 255;
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
                ret = SDL_hid_write_REAL(device.*.dev, @ptrCast(@alignCast(&cmd)), 7);
                if (ret == -@as(c_int, 1)) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            25 => {
                return @"false" != 0;
            },
            26 => {
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            27 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            28 => {
                {
                    sdl_pc = 7;
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
                    sdl_pc = 33;
                    continue;
                }
            },
            31 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 32;
                    continue;
                }
            },
            32 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            33 => {
                if (!(@as(c_int, 0) != 0)) {
                    sdl_pc = 34;
                    continue;
                } else {
                    sdl_pc = 35;
                    continue;
                }
            },
            34 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_hidapi_lg4ff.c", 386);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 37;
                    continue;
                }
            },
            35 => {
                {
                    sdl_pc = 31;
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
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 40;
                    continue;
                }
            },
            38 => {
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            39 => {
                __builtin.debugtrap();
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
                    sdl_pc = 38;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverLg4ff_SetAutoCenter(device: [*c]SDL_HIDAPI_Device, arg_magnitude: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var magnitude = arg_magnitude;
    _ = &magnitude;
    var ctx: [*c]SDL_DriverLg4ff_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    var cmd: [7]Uint8 = [1]Uint8{
        0,
    } ++ @as([6]Uint8, @splat(0));
    _ = &cmd;
    var ret: c_int = undefined;
    _ = &ret;
    if (magnitude < @as(c_int, 0)) {
        magnitude = 0;
    }
    if (magnitude > @as(c_int, 65535)) {
        magnitude = 65535;
    }
    if (ctx.*.is_ffex) {
        magnitude = @divTrunc(magnitude * @as(c_int, 90), @as(c_int, 65535));
        cmd[@as(c_int, 0)] = 254;
        cmd[@as(c_int, 1)] = 3;
        cmd[@as(c_int, 2)] = @bitCast(@as(i8, @truncate(@as(c_int, @as(Uint16, @bitCast(@as(c_short, @truncate(magnitude))))) >> @intCast(@as(c_int, 14)))));
        cmd[@as(c_int, 3)] = @bitCast(@as(i8, @truncate(@as(c_int, @as(Uint16, @bitCast(@as(c_short, @truncate(magnitude))))) >> @intCast(@as(c_int, 14)))));
        cmd[@as(c_int, 4)] = @bitCast(@as(i8, @truncate(magnitude)));
        ret = SDL_hid_write_REAL(device.*.dev, @ptrCast(@alignCast(&cmd)), @sizeOf(@TypeOf(cmd)));
        if (ret == -@as(c_int, 1)) {
            return @"false" != 0;
        }
    } else {
        var expand_a: Uint32 = undefined;
        _ = &expand_a;
        var expand_b: Uint32 = undefined;
        _ = &expand_b;
        cmd[@as(c_int, 0)] = 245;
        ret = SDL_hid_write_REAL(device.*.dev, @ptrCast(@alignCast(&cmd)), @sizeOf(@TypeOf(cmd)));
        if (ret == -@as(c_int, 1)) {
            return @"false" != 0;
        }
        if (magnitude == @as(c_int, 0)) {
            return @"true" != 0;
        }
        if (magnitude <= @as(c_int, 43690)) {
            expand_a = @bitCast(@as(c_int, @as(c_int, 12) * magnitude));
            expand_b = @bitCast(@as(c_int, @as(c_int, 128) * magnitude));
        } else {
            expand_a = @bitCast(@as(c_int, (@as(c_int, 12) * @as(c_int, 43690)) + (@as(c_int, 6) * (magnitude - @as(c_int, 43690)))));
            expand_b = @bitCast(@as(c_int, (@as(c_int, 128) * @as(c_int, 43690)) + (@as(c_int, 255) * (magnitude - @as(c_int, 43690)))));
        }
        expand_a = expand_a >> @intCast(@as(Uint32, 1));
        _ = memset(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&cmd))))), 0, @sizeOf(@TypeOf(cmd)));
        cmd[@as(c_int, 0)] = 254;
        cmd[@as(c_int, 1)] = 13;
        cmd[@as(c_int, 2)] = @truncate(expand_a / @as(Uint32, 43690));
        cmd[@as(c_int, 3)] = @truncate(expand_a / @as(Uint32, 43690));
        cmd[@as(c_int, 4)] = @truncate(expand_b / @as(Uint32, 43690));
        ret = SDL_hid_write_REAL(device.*.dev, @ptrCast(@alignCast(&cmd)), @sizeOf(@TypeOf(cmd)));
        if (ret == -@as(c_int, 1)) {
            return @"false" != 0;
        }
        _ = memset(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&cmd))))), 0, @sizeOf(@TypeOf(cmd)));
        cmd[@as(c_int, 0)] = 20;
        ret = SDL_hid_write_REAL(device.*.dev, @ptrCast(@alignCast(&cmd)), @sizeOf(@TypeOf(cmd)));
        if (ret == -@as(c_int, 1)) {
            return @"false" != 0;
        }
    }
    return @"true" != 0;
}
pub fn HIDAPI_DriverLg4ff_InitDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverLg4ff_Context = undefined;
    _ = &ctx;
    ctx = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(SDL_DriverLg4ff_Context))));
    if (@as(?*anyopaque, @ptrCast(@alignCast(ctx))) == @as(?*anyopaque, null)) {
        _ = SDL_OutOfMemory_REAL();
        return @"false" != 0;
    }
    _ = memset(@ptrCast(@alignCast(ctx)), 0, @sizeOf(@TypeOf(ctx.*)));
    device.*.context = @ptrCast(@alignCast(ctx));
    device.*.joystick_type = SDL_JOYSTICK_TYPE_WHEEL;
    HIDAPI_SetDeviceName(device, HIDAPI_DriverLg4ff_GetDeviceName(device.*.product_id));
    if (SDL_hid_set_nonblocking_REAL(device.*.dev, 1) != @as(c_int, 0)) {
        return @"false" != 0;
    }
    if (!HIDAPI_DriverLg4ff_SetAutoCenter(device, 0)) {
        return @"false" != 0;
    }
    if (((@as(c_int, device.*.product_id) == USB_DEVICE_ID_LOGITECH_WHEEL) and ((@as(c_int, device.*.version) >> @intCast(@as(c_int, 8))) == @as(c_int, 33))) and ((@as(c_int, device.*.version) & @as(c_int, 255)) == @as(c_int, 0))) {
        ctx.*.is_ffex = @"true" != 0;
    } else {
        ctx.*.is_ffex = @"false" != 0;
    }
    ctx.*.range = 900;
    return HIDAPI_JoystickConnected(device, null);
}
pub fn HIDAPI_DriverLg4ff_GetDevicePlayerIndex(_: [*c]SDL_HIDAPI_Device, _: SDL_JoystickID) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return -@as(c_int, 1);
}
pub fn HIDAPI_DriverLg4ff_SetDevicePlayerIndex(_: [*c]SDL_HIDAPI_Device, _: SDL_JoystickID, _: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn HIDAPI_DriverLg4ff_GetBit(buf: [*c]const Uint8, bit_num: c_int, buf_len: usize) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [25:0]u8 = "HIDAPI_DriverLg4ff_GetBit".*;
    };
    _ = &static_local___func__;
    var byte_offset: c_int = @divTrunc(bit_num, @as(c_int, 8));
    _ = &byte_offset;
    var local_bit: c_int = __helpers.signedRemainder(bit_num, @as(c_int, 8));
    _ = &local_bit;
    var mask: Uint8 = @bitCast(@as(i8, @truncate(@as(c_int, 1) << @intCast(local_bit))));
    _ = &mask;
    if (@as(usize, @bitCast(@as(c_long, byte_offset))) >= buf_len) {
        while (true) {
            while (!(@as(c_int, 0) != 0)) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "0",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_hidapi_lg4ff.c", 537);
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
    }
    return (if ((@as(c_int, buf[@bitCast(@as(isize, @intCast(byte_offset)))]) & @as(c_int, mask)) != 0) @"true" else @"false") != 0;
}
pub fn lg4ff_adjust_dfp_x_axis(value: Uint16, range: Uint16) callconv(.c) Uint16 {
    @setEvalBranchQuota(100000);
    var max_range: Uint16 = undefined;
    _ = &max_range;
    var new_value: Sint32 = undefined;
    _ = &new_value;
    if (@as(c_int, range) == @as(c_int, 900)) return value else if (@as(c_int, range) == @as(c_int, 200)) return value else if (@as(c_int, range) < @as(c_int, 200)) {
        max_range = 200;
    } else {
        max_range = 900;
    }
    new_value = @as(c_int, 8192) + @divTrunc((@as(c_int, value) - @as(c_int, 8192)) * @as(c_int, max_range), @as(c_int, range));
    if (new_value < @as(c_int, 0)) return 0 else if (new_value > @as(c_int, 16383)) return 16383 else return @bitCast(@as(c_short, @truncate(new_value)));
}
pub fn HIDAPI_DriverLg4ff_HandleState(device: [*c]SDL_HIDAPI_Device, joystick: [*c]SDL_Joystick, report_buf: [*c]Uint8, report_size: usize) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [30:0]u8 = "HIDAPI_DriverLg4ff_HandleState".*;
    };
    _ = &static_local___func__;
    var ctx: [*c]SDL_DriverLg4ff_Context = undefined;
    _ = &ctx;
    var hat: Uint8 = undefined;
    _ = &hat;
    var last_hat: Uint8 = undefined;
    _ = &last_hat;
    var num_buttons: c_int = undefined;
    _ = &num_buttons;
    var bit_offset: c_int = undefined;
    _ = &bit_offset;
    var timestamp: Uint64 = undefined;
    _ = &timestamp;
    var state_changed: bool = undefined;
    _ = &state_changed;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "0",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data;
    var sdl_assert_state: SDL_AssertState = undefined;
    _ = &sdl_assert_state;
    var sdl_hat: Uint8 = undefined;
    _ = &sdl_hat;
    const static_local_sdl_assert_data_1 = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "0",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data_1;
    var sdl_assert_state_2: SDL_AssertState = undefined;
    _ = &sdl_assert_state_2;
    var button_on: bool = undefined;
    _ = &button_on;
    var button_was_on: bool = undefined;
    _ = &button_was_on;
    var i: c_int = undefined;
    _ = &i;
    var bit_num: c_int = undefined;
    _ = &bit_num;
    var button_on_3: bool = undefined;
    _ = &button_on_3;
    var button_was_on_4: bool = undefined;
    _ = &button_was_on_4;
    var x: Uint16 = undefined;
    _ = &x;
    var last_x: Uint16 = undefined;
    _ = &last_x;
    var x_5: Uint16 = undefined;
    _ = &x_5;
    var last_x_6: Uint16 = undefined;
    _ = &last_x_6;
    var x_7: Uint16 = undefined;
    _ = &x_7;
    var last_x_8: Uint16 = undefined;
    _ = &last_x_8;
    var x_9: Uint16 = undefined;
    _ = &x_9;
    var last_x_10: Uint16 = undefined;
    _ = &last_x_10;
    const static_local_sdl_assert_data_11 = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "0",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data_11;
    var sdl_assert_state_12: SDL_AssertState = undefined;
    _ = &sdl_assert_state_12;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                ctx = @ptrCast(@alignCast(device.*.context));
                hat = 0;
                last_hat = 0;
                num_buttons = HIDAPI_DriverLg4ff_GetNumberOfButtons(device.*.product_id);
                bit_offset = 0;
                timestamp = SDL_GetTicksNS_REAL();
                state_changed = @"false" != 0;
                switch (@as(c_int, device.*.product_id)) {
                    USB_DEVICE_ID_LOGITECH_G29_WHEEL => {
                        sdl_pc = 2;
                        continue;
                    },
                    USB_DEVICE_ID_LOGITECH_G27_WHEEL => {
                        sdl_pc = 3;
                        continue;
                    },
                    USB_DEVICE_ID_LOGITECH_G25_WHEEL => {
                        sdl_pc = 4;
                        continue;
                    },
                    USB_DEVICE_ID_LOGITECH_DFGT_WHEEL => {
                        sdl_pc = 5;
                        continue;
                    },
                    USB_DEVICE_ID_LOGITECH_DFP_WHEEL => {
                        sdl_pc = 6;
                        continue;
                    },
                    USB_DEVICE_ID_LOGITECH_WHEEL => {
                        sdl_pc = 7;
                        continue;
                    },
                    else => {
                        sdl_pc = 8;
                        continue;
                    },
                }
            },
            1 => {
                if (@as(c_int, hat) != @as(c_int, last_hat)) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
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
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            5 => {
                hat = @bitCast(@as(i8, @truncate(@as(c_int, report_buf[@as(c_int, 0)]) & @as(c_int, 15))));
                last_hat = @bitCast(@as(i8, @truncate(@as(c_int, ctx.*.last_report_buf[@as(c_int, 0)]) & @as(c_int, 15))));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            6 => {
                hat = @bitCast(@as(i8, @truncate(@as(c_int, report_buf[@as(c_int, 3)]) >> @intCast(@as(c_int, 4)))));
                last_hat = @bitCast(@as(i8, @truncate(@as(c_int, ctx.*.last_report_buf[@as(c_int, 3)]) >> @intCast(@as(c_int, 4)))));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            7 => {
                hat = @bitCast(@as(i8, @truncate(@as(c_int, report_buf[@as(c_int, 2)]) & @as(c_int, 15))));
                last_hat = @bitCast(@as(i8, @truncate(@as(c_int, ctx.*.last_report_buf[@as(c_int, 2)]) & @as(c_int, 15))));
                {
                    sdl_pc = 1;
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
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            10 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 11;
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
                if (!(@as(c_int, 0) != 0)) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            13 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_hidapi_lg4ff.c", 603);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
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
                    sdl_pc = 12;
                    continue;
                }
            },
            16 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            18 => {
                __builtin.debugtrap();
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
                    sdl_pc = 17;
                    continue;
                }
            },
            21 => {
                sdl_hat = 0;
                state_changed = @"true" != 0;
                switch (@as(c_int, hat)) {
                    @as(c_int, 0) => {
                        sdl_pc = 25;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 26;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 27;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 28;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 29;
                        continue;
                    },
                    @as(c_int, 5) => {
                        sdl_pc = 30;
                        continue;
                    },
                    @as(c_int, 6) => {
                        sdl_pc = 31;
                        continue;
                    },
                    @as(c_int, 7) => {
                        sdl_pc = 32;
                        continue;
                    },
                    @as(c_int, 8) => {
                        sdl_pc = 33;
                        continue;
                    },
                    else => {
                        sdl_pc = 24;
                        continue;
                    },
                }
            },
            22 => {
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            23 => {
                switch (@as(c_int, device.*.product_id)) {
                    USB_DEVICE_ID_LOGITECH_G29_WHEEL => {
                        sdl_pc = 35;
                        continue;
                    },
                    USB_DEVICE_ID_LOGITECH_G27_WHEEL => {
                        sdl_pc = 36;
                        continue;
                    },
                    USB_DEVICE_ID_LOGITECH_G25_WHEEL => {
                        sdl_pc = 37;
                        continue;
                    },
                    USB_DEVICE_ID_LOGITECH_DFGT_WHEEL => {
                        sdl_pc = 38;
                        continue;
                    },
                    USB_DEVICE_ID_LOGITECH_DFP_WHEEL => {
                        sdl_pc = 39;
                        continue;
                    },
                    USB_DEVICE_ID_LOGITECH_WHEEL => {
                        sdl_pc = 40;
                        continue;
                    },
                    else => {
                        sdl_pc = 41;
                        continue;
                    },
                }
            },
            24 => {
                SDL_SendJoystickHat(timestamp, joystick, 0, sdl_hat);
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            25 => {
                sdl_hat = SDL_HAT_UP;
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            26 => {
                sdl_hat = @truncate(SDL_HAT_RIGHT | SDL_HAT_UP);
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            27 => {
                sdl_hat = SDL_HAT_RIGHT;
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            28 => {
                sdl_hat = @truncate(SDL_HAT_RIGHT | SDL_HAT_DOWN);
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            29 => {
                sdl_hat = SDL_HAT_DOWN;
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            30 => {
                sdl_hat = @truncate(SDL_HAT_LEFT | SDL_HAT_DOWN);
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            31 => {
                sdl_hat = SDL_HAT_LEFT;
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            32 => {
                sdl_hat = @truncate(SDL_HAT_LEFT | SDL_HAT_UP);
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            33 => {
                sdl_hat = SDL_HAT_CENTERED;
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            34 => {
                if (@as(c_int, device.*.product_id) == USB_DEVICE_ID_LOGITECH_G27_WHEEL) {
                    sdl_pc = 54;
                    continue;
                } else {
                    sdl_pc = 55;
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
                    sdl_pc = 37;
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
                bit_offset = 4;
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            39 => {
                bit_offset = 14;
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            40 => {
                bit_offset = 0;
                {
                    sdl_pc = 34;
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
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            43 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 44;
                    continue;
                }
            },
            44 => {
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            45 => {
                if (!(@as(c_int, 0) != 0)) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 47;
                    continue;
                }
            },
            46 => {
                sdl_assert_state_2 = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data_1.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_hidapi_lg4ff.c", 656);
                if (sdl_assert_state_2 == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 48;
                    continue;
                } else {
                    sdl_pc = 49;
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
                    sdl_pc = 45;
                    continue;
                }
            },
            49 => {
                if (sdl_assert_state_2 == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 51;
                    continue;
                } else {
                    sdl_pc = 52;
                    continue;
                }
            },
            50 => {
                {
                    sdl_pc = 47;
                    continue;
                }
            },
            51 => {
                __builtin.debugtrap();
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
                    sdl_pc = 50;
                    continue;
                }
            },
            54 => {
                num_buttons -= 1;
                button_on = HIDAPI_DriverLg4ff_GetBit(report_buf, 80, report_size);
                button_was_on = HIDAPI_DriverLg4ff_GetBit(@ptrCast(@alignCast(&ctx.*.last_report_buf)), 80, report_size);
                if (@as(c_int, @intFromBool(button_on)) != @as(c_int, @intFromBool(button_was_on))) {
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
                i = 0;
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            57 => {
                state_changed = @"true" != 0;
                SDL_SendJoystickButton(timestamp, joystick, @bitCast(@as(i8, @truncate(SDL_GAMEPAD_BUTTON_SOUTH + num_buttons))), button_on);
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
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            60 => {
                if (i < num_buttons) {
                    sdl_pc = 61;
                    continue;
                } else {
                    sdl_pc = 63;
                    continue;
                }
            },
            61 => {
                bit_num = bit_offset + i;
                button_on_3 = HIDAPI_DriverLg4ff_GetBit(report_buf, bit_num, report_size);
                button_was_on_4 = HIDAPI_DriverLg4ff_GetBit(@ptrCast(@alignCast(&ctx.*.last_report_buf)), bit_num, report_size);
                if (@as(c_int, @intFromBool(button_on_3)) != @as(c_int, @intFromBool(button_was_on_4))) {
                    sdl_pc = 64;
                    continue;
                } else {
                    sdl_pc = 65;
                    continue;
                }
            },
            62 => {
                i += 1;
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            63 => {
                switch (@as(c_int, device.*.product_id)) {
                    USB_DEVICE_ID_LOGITECH_G29_WHEEL => {
                        sdl_pc = 68;
                        continue;
                    },
                    USB_DEVICE_ID_LOGITECH_G27_WHEEL => {
                        sdl_pc = 81;
                        continue;
                    },
                    USB_DEVICE_ID_LOGITECH_G25_WHEEL => {
                        sdl_pc = 82;
                        continue;
                    },
                    USB_DEVICE_ID_LOGITECH_DFGT_WHEEL => {
                        sdl_pc = 95;
                        continue;
                    },
                    USB_DEVICE_ID_LOGITECH_DFP_WHEEL => {
                        sdl_pc = 105;
                        continue;
                    },
                    USB_DEVICE_ID_LOGITECH_WHEEL => {
                        sdl_pc = 115;
                        continue;
                    },
                    else => {
                        sdl_pc = 128;
                        continue;
                    },
                }
            },
            64 => {
                state_changed = @"true" != 0;
                SDL_SendJoystickButton(timestamp, joystick, @bitCast(@as(i8, @truncate(SDL_GAMEPAD_BUTTON_SOUTH + i))), button_on_3);
                {
                    sdl_pc = 66;
                    continue;
                }
            },
            65 => {
                {
                    sdl_pc = 66;
                    continue;
                }
            },
            66 => {
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            67 => {
                _ = memcpy(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.last_report_buf))))), @ptrCast(@alignCast(report_buf)), report_size);
                return state_changed;
            },
            68 => {
                x = @as([*c]Uint16, @ptrCast(@alignCast(&report_buf[@as(c_int, 4)]))).*;
                last_x = @as([*c]Uint16, @ptrCast(@alignCast(&ctx.*.last_report_buf[@as(c_int, 4)]))).*;
                if (@as(c_int, x) != @as(c_int, last_x)) {
                    sdl_pc = 69;
                    continue;
                } else {
                    sdl_pc = 70;
                    continue;
                }
            },
            69 => {
                state_changed = @"true" != 0;
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, @truncate(@as(c_int, x) - @as(c_int, 32768)));
                {
                    sdl_pc = 71;
                    continue;
                }
            },
            70 => {
                {
                    sdl_pc = 71;
                    continue;
                }
            },
            71 => {
                if (@as(c_int, report_buf[@as(c_int, 6)]) != @as(c_int, ctx.*.last_report_buf[@as(c_int, 6)])) {
                    sdl_pc = 72;
                    continue;
                } else {
                    sdl_pc = 73;
                    continue;
                }
            },
            72 => {
                state_changed = @"true" != 0;
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, @truncate((@as(c_int, report_buf[@as(c_int, 6)]) * @as(c_int, 257)) - @as(c_int, 32768)));
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
                if (@as(c_int, report_buf[@as(c_int, 7)]) != @as(c_int, ctx.*.last_report_buf[@as(c_int, 7)])) {
                    sdl_pc = 75;
                    continue;
                } else {
                    sdl_pc = 76;
                    continue;
                }
            },
            75 => {
                state_changed = @"true" != 0;
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, @truncate((@as(c_int, report_buf[@as(c_int, 7)]) * @as(c_int, 257)) - @as(c_int, 32768)));
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
                if (@as(c_int, report_buf[@as(c_int, 8)]) != @as(c_int, ctx.*.last_report_buf[@as(c_int, 8)])) {
                    sdl_pc = 78;
                    continue;
                } else {
                    sdl_pc = 79;
                    continue;
                }
            },
            78 => {
                state_changed = @"true" != 0;
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, @truncate((@as(c_int, report_buf[@as(c_int, 8)]) * @as(c_int, 257)) - @as(c_int, 32768)));
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
                    sdl_pc = 67;
                    continue;
                }
            },
            81 => {
                {
                    sdl_pc = 82;
                    continue;
                }
            },
            82 => {
                x_5 = @bitCast(@as(c_short, @truncate(@as(c_int, report_buf[@as(c_int, 4)]) << @intCast(@as(c_int, 6)))));
                last_x_6 = @bitCast(@as(c_short, @truncate(@as(c_int, ctx.*.last_report_buf[@as(c_int, 4)]) << @intCast(@as(c_int, 6)))));
                x_5 = @bitCast(@as(c_short, @truncate(@as(c_int, x_5) | (@as(c_int, report_buf[@as(c_int, 3)]) >> @intCast(@as(c_int, 2))))));
                last_x_6 = @bitCast(@as(c_short, @truncate(@as(c_int, last_x_6) | (@as(c_int, ctx.*.last_report_buf[@as(c_int, 3)]) >> @intCast(@as(c_int, 2))))));
                if (@as(c_int, x_5) != @as(c_int, last_x_6)) {
                    sdl_pc = 83;
                    continue;
                } else {
                    sdl_pc = 84;
                    continue;
                }
            },
            83 => {
                state_changed = @"true" != 0;
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, @truncate((@as(c_int, x_5) * @as(c_int, 4)) - @as(c_int, 32768)));
                {
                    sdl_pc = 85;
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
                if (@as(c_int, report_buf[@as(c_int, 5)]) != @as(c_int, ctx.*.last_report_buf[@as(c_int, 5)])) {
                    sdl_pc = 86;
                    continue;
                } else {
                    sdl_pc = 87;
                    continue;
                }
            },
            86 => {
                state_changed = @"true" != 0;
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, @truncate((@as(c_int, report_buf[@as(c_int, 5)]) * @as(c_int, 257)) - @as(c_int, 32768)));
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
                if (@as(c_int, report_buf[@as(c_int, 6)]) != @as(c_int, ctx.*.last_report_buf[@as(c_int, 6)])) {
                    sdl_pc = 89;
                    continue;
                } else {
                    sdl_pc = 90;
                    continue;
                }
            },
            89 => {
                state_changed = @"true" != 0;
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, @truncate((@as(c_int, report_buf[@as(c_int, 6)]) * @as(c_int, 257)) - @as(c_int, 32768)));
                {
                    sdl_pc = 91;
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
                if (@as(c_int, report_buf[@as(c_int, 7)]) != @as(c_int, ctx.*.last_report_buf[@as(c_int, 7)])) {
                    sdl_pc = 92;
                    continue;
                } else {
                    sdl_pc = 93;
                    continue;
                }
            },
            92 => {
                state_changed = @"true" != 0;
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, @truncate((@as(c_int, report_buf[@as(c_int, 7)]) * @as(c_int, 257)) - @as(c_int, 32768)));
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            93 => {
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            94 => {
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            95 => {
                x_7 = report_buf[@as(c_int, 4)];
                last_x_8 = ctx.*.last_report_buf[@as(c_int, 4)];
                x_7 = @bitCast(@as(c_short, @truncate(@as(c_int, x_7) | ((@as(c_int, report_buf[@as(c_int, 5)]) & @as(c_int, 63)) << @intCast(@as(c_int, 8))))));
                last_x_8 = @bitCast(@as(c_short, @truncate(@as(c_int, last_x_8) | ((@as(c_int, ctx.*.last_report_buf[@as(c_int, 5)]) & @as(c_int, 63)) << @intCast(@as(c_int, 8))))));
                if (@as(c_int, x_7) != @as(c_int, last_x_8)) {
                    sdl_pc = 96;
                    continue;
                } else {
                    sdl_pc = 97;
                    continue;
                }
            },
            96 => {
                state_changed = @"true" != 0;
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, @truncate((@as(c_int, x_7) * @as(c_int, 4)) - @as(c_int, 32768)));
                {
                    sdl_pc = 98;
                    continue;
                }
            },
            97 => {
                {
                    sdl_pc = 98;
                    continue;
                }
            },
            98 => {
                if (@as(c_int, report_buf[@as(c_int, 6)]) != @as(c_int, ctx.*.last_report_buf[@as(c_int, 6)])) {
                    sdl_pc = 99;
                    continue;
                } else {
                    sdl_pc = 100;
                    continue;
                }
            },
            99 => {
                state_changed = @"true" != 0;
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, @truncate((@as(c_int, report_buf[@as(c_int, 6)]) * @as(c_int, 257)) - @as(c_int, 32768)));
                {
                    sdl_pc = 101;
                    continue;
                }
            },
            100 => {
                {
                    sdl_pc = 101;
                    continue;
                }
            },
            101 => {
                if (@as(c_int, report_buf[@as(c_int, 7)]) != @as(c_int, ctx.*.last_report_buf[@as(c_int, 7)])) {
                    sdl_pc = 102;
                    continue;
                } else {
                    sdl_pc = 103;
                    continue;
                }
            },
            102 => {
                state_changed = @"true" != 0;
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, @truncate((@as(c_int, report_buf[@as(c_int, 7)]) * @as(c_int, 257)) - @as(c_int, 32768)));
                {
                    sdl_pc = 104;
                    continue;
                }
            },
            103 => {
                {
                    sdl_pc = 104;
                    continue;
                }
            },
            104 => {
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            105 => {
                x_9 = report_buf[@as(c_int, 0)];
                last_x_10 = ctx.*.last_report_buf[@as(c_int, 0)];
                x_9 = @bitCast(@as(c_short, @truncate(@as(c_int, x_9) | ((@as(c_int, report_buf[@as(c_int, 1)]) & @as(c_int, 63)) << @intCast(@as(c_int, 8))))));
                last_x_10 = @bitCast(@as(c_short, @truncate(@as(c_int, last_x_10) | ((@as(c_int, ctx.*.last_report_buf[@as(c_int, 1)]) & @as(c_int, 63)) << @intCast(@as(c_int, 8))))));
                if (@as(c_int, x_9) != @as(c_int, last_x_10)) {
                    sdl_pc = 106;
                    continue;
                } else {
                    sdl_pc = 107;
                    continue;
                }
            },
            106 => {
                state_changed = @"true" != 0;
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, @truncate((@as(c_int, lg4ff_adjust_dfp_x_axis(x_9, ctx.*.range)) * @as(c_int, 4)) - @as(c_int, 32768)));
                {
                    sdl_pc = 108;
                    continue;
                }
            },
            107 => {
                {
                    sdl_pc = 108;
                    continue;
                }
            },
            108 => {
                if (@as(c_int, report_buf[@as(c_int, 5)]) != @as(c_int, ctx.*.last_report_buf[@as(c_int, 5)])) {
                    sdl_pc = 109;
                    continue;
                } else {
                    sdl_pc = 110;
                    continue;
                }
            },
            109 => {
                state_changed = @"true" != 0;
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, @truncate((@as(c_int, report_buf[@as(c_int, 5)]) * @as(c_int, 257)) - @as(c_int, 32768)));
                {
                    sdl_pc = 111;
                    continue;
                }
            },
            110 => {
                {
                    sdl_pc = 111;
                    continue;
                }
            },
            111 => {
                if (@as(c_int, report_buf[@as(c_int, 6)]) != @as(c_int, ctx.*.last_report_buf[@as(c_int, 6)])) {
                    sdl_pc = 112;
                    continue;
                } else {
                    sdl_pc = 113;
                    continue;
                }
            },
            112 => {
                state_changed = @"true" != 0;
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, @truncate((@as(c_int, report_buf[@as(c_int, 6)]) * @as(c_int, 257)) - @as(c_int, 32768)));
                {
                    sdl_pc = 114;
                    continue;
                }
            },
            113 => {
                {
                    sdl_pc = 114;
                    continue;
                }
            },
            114 => {
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            115 => {
                if (@as(c_int, report_buf[@as(c_int, 3)]) != @as(c_int, ctx.*.last_report_buf[@as(c_int, 3)])) {
                    sdl_pc = 116;
                    continue;
                } else {
                    sdl_pc = 117;
                    continue;
                }
            },
            116 => {
                state_changed = @"true" != 0;
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, @truncate((@as(c_int, report_buf[@as(c_int, 3)]) * @as(c_int, 257)) - @as(c_int, 32768)));
                {
                    sdl_pc = 118;
                    continue;
                }
            },
            117 => {
                {
                    sdl_pc = 118;
                    continue;
                }
            },
            118 => {
                if (@as(c_int, report_buf[@as(c_int, 4)]) != @as(c_int, ctx.*.last_report_buf[@as(c_int, 4)])) {
                    sdl_pc = 119;
                    continue;
                } else {
                    sdl_pc = 120;
                    continue;
                }
            },
            119 => {
                state_changed = @"true" != 0;
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, @truncate((@as(c_int, report_buf[@as(c_int, 4)]) * @as(c_int, 257)) - @as(c_int, 32768)));
                {
                    sdl_pc = 121;
                    continue;
                }
            },
            120 => {
                {
                    sdl_pc = 121;
                    continue;
                }
            },
            121 => {
                if (@as(c_int, report_buf[@as(c_int, 5)]) != @as(c_int, ctx.*.last_report_buf[@as(c_int, 5)])) {
                    sdl_pc = 122;
                    continue;
                } else {
                    sdl_pc = 123;
                    continue;
                }
            },
            122 => {
                state_changed = @"true" != 0;
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, @truncate((@as(c_int, report_buf[@as(c_int, 5)]) * @as(c_int, 257)) - @as(c_int, 32768)));
                {
                    sdl_pc = 124;
                    continue;
                }
            },
            123 => {
                {
                    sdl_pc = 124;
                    continue;
                }
            },
            124 => {
                if (@as(c_int, report_buf[@as(c_int, 6)]) != @as(c_int, ctx.*.last_report_buf[@as(c_int, 6)])) {
                    sdl_pc = 125;
                    continue;
                } else {
                    sdl_pc = 126;
                    continue;
                }
            },
            125 => {
                state_changed = @"true" != 0;
                SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, @truncate((@as(c_int, report_buf[@as(c_int, 7)]) * @as(c_int, 257)) - @as(c_int, 32768)));
                {
                    sdl_pc = 127;
                    continue;
                }
            },
            126 => {
                {
                    sdl_pc = 127;
                    continue;
                }
            },
            127 => {
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            128 => {
                {
                    sdl_pc = 129;
                    continue;
                }
            },
            129 => {
                {
                    sdl_pc = 132;
                    continue;
                }
            },
            130 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 129;
                    continue;
                } else {
                    sdl_pc = 131;
                    continue;
                }
            },
            131 => {
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            132 => {
                if (!(@as(c_int, 0) != 0)) {
                    sdl_pc = 133;
                    continue;
                } else {
                    sdl_pc = 134;
                    continue;
                }
            },
            133 => {
                sdl_assert_state_12 = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data_11.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_hidapi_lg4ff.c", 786);
                if (sdl_assert_state_12 == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 135;
                    continue;
                } else {
                    sdl_pc = 136;
                    continue;
                }
            },
            134 => {
                {
                    sdl_pc = 130;
                    continue;
                }
            },
            135 => {
                {
                    sdl_pc = 132;
                    continue;
                }
            },
            136 => {
                if (sdl_assert_state_12 == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 138;
                    continue;
                } else {
                    sdl_pc = 139;
                    continue;
                }
            },
            137 => {
                {
                    sdl_pc = 134;
                    continue;
                }
            },
            138 => {
                __builtin.debugtrap();
                {
                    sdl_pc = 140;
                    continue;
                }
            },
            139 => {
                {
                    sdl_pc = 140;
                    continue;
                }
            },
            140 => {
                {
                    sdl_pc = 137;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverLg4ff_UpdateDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [31:0]u8 = "HIDAPI_DriverLg4ff_UpdateDevice".*;
    };
    _ = &static_local___func__;
    var joystick: [*c]SDL_Joystick = undefined;
    _ = &joystick;
    var r: c_int = undefined;
    _ = &r;
    var report_buf: [32]Uint8 = undefined;
    _ = &report_buf;
    var report_size: usize = undefined;
    _ = &report_size;
    var ctx: [*c]SDL_DriverLg4ff_Context = undefined;
    _ = &ctx;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "0",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data;
    var sdl_assert_state: SDL_AssertState = undefined;
    _ = &sdl_assert_state;
    var state_changed: bool = undefined;
    _ = &state_changed;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                joystick = null;
                report_buf = [1]Uint8{
                    0,
                } ++ @as([31]Uint8, @splat(0));
                report_size = 0;
                ctx = @ptrCast(@alignCast(device.*.context));
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
                if (@as(?*anyopaque, @ptrCast(@alignCast(joystick))) == @as(?*anyopaque, null)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            2 => {
                return @"false" != 0;
            },
            3 => {
                switch (@as(c_int, device.*.product_id)) {
                    USB_DEVICE_ID_LOGITECH_G29_WHEEL => {
                        sdl_pc = 8;
                        continue;
                    },
                    USB_DEVICE_ID_LOGITECH_G27_WHEEL => {
                        sdl_pc = 9;
                        continue;
                    },
                    USB_DEVICE_ID_LOGITECH_G25_WHEEL => {
                        sdl_pc = 10;
                        continue;
                    },
                    USB_DEVICE_ID_LOGITECH_DFGT_WHEEL => {
                        sdl_pc = 11;
                        continue;
                    },
                    USB_DEVICE_ID_LOGITECH_DFP_WHEEL => {
                        sdl_pc = 12;
                        continue;
                    },
                    USB_DEVICE_ID_LOGITECH_WHEEL => {
                        sdl_pc = 13;
                        continue;
                    },
                    else => {
                        sdl_pc = 14;
                        continue;
                    },
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
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            7 => {
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            8 => {
                report_size = 12;
                {
                    sdl_pc = 7;
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
                report_size = 11;
                {
                    sdl_pc = 7;
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
                report_size = 8;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            13 => {
                report_size = 27;
                {
                    sdl_pc = 7;
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
                    sdl_pc = 18;
                    continue;
                }
            },
            16 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            18 => {
                if (!(@as(c_int, 0) != 0)) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            19 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_hidapi_lg4ff.c", 826);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            20 => {
                {
                    sdl_pc = 16;
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
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
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
                __builtin.debugtrap();
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
                    sdl_pc = 23;
                    continue;
                }
            },
            27 => {
                r = SDL_hid_read_REAL(device.*.dev, @ptrCast(@alignCast(&report_buf)), report_size);
                if (r < @as(c_int, 0)) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            28 => {
                if (r > @as(c_int, 0)) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 29;
                    continue;
                }
            },
            29 => {
                return @"true" != 0;
            },
            30 => {
                HIDAPI_JoystickDisconnected(device, device.*.joysticks[@as(c_int, 0)]);
                return @"false" != 0;
            },
            31 => {
                if (@as(usize, @bitCast(@as(c_long, r))) == report_size) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 34;
                    continue;
                }
            },
            32 => {
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            33 => {
                state_changed = HIDAPI_DriverLg4ff_HandleState(device, joystick, @ptrCast(@alignCast(&report_buf)), report_size);
                if (state_changed and !ctx.*.initialized) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 37;
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
                    sdl_pc = 32;
                    continue;
                }
            },
            36 => {
                ctx.*.initialized = @"true" != 0;
                _ = HIDAPI_DriverLg4ff_SetRange(device, SDL_HIDAPI_DriverLg4ff_GetEnvInt("SDL_HIDAPI_LG4FF_RANGE", 40, 900, 900));
                _ = HIDAPI_DriverLg4ff_SetAutoCenter(device, 0);
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
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverLg4ff_OpenJoystick(device: [*c]SDL_HIDAPI_Device, joystick: [*c]SDL_Joystick) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [31:0]u8 = "HIDAPI_DriverLg4ff_OpenJoystick".*;
    };
    _ = &static_local___func__;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "0",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data;
    var sdl_assert_state: SDL_AssertState = undefined;
    _ = &sdl_assert_state;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                SDL_AssertJoysticksLocked();
                joystick.*.nhats = 1;
                joystick.*.nbuttons = HIDAPI_DriverLg4ff_GetNumberOfButtons(device.*.product_id);
                switch (@as(c_int, device.*.product_id)) {
                    USB_DEVICE_ID_LOGITECH_G29_WHEEL => {
                        sdl_pc = 2;
                        continue;
                    },
                    USB_DEVICE_ID_LOGITECH_G27_WHEEL => {
                        sdl_pc = 3;
                        continue;
                    },
                    USB_DEVICE_ID_LOGITECH_G25_WHEEL => {
                        sdl_pc = 4;
                        continue;
                    },
                    USB_DEVICE_ID_LOGITECH_WHEEL => {
                        sdl_pc = 5;
                        continue;
                    },
                    USB_DEVICE_ID_LOGITECH_DFGT_WHEEL => {
                        sdl_pc = 6;
                        continue;
                    },
                    USB_DEVICE_ID_LOGITECH_DFP_WHEEL => {
                        sdl_pc = 7;
                        continue;
                    },
                    else => {
                        sdl_pc = 8;
                        continue;
                    },
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
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            5 => {
                joystick.*.naxes = 4;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            6 => {
                joystick.*.naxes = 3;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            7 => {
                joystick.*.naxes = 3;
                {
                    sdl_pc = 1;
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
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            10 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 11;
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
                if (!(@as(c_int, 0) != 0)) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            13 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_hidapi_lg4ff.c", 869);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
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
                    sdl_pc = 12;
                    continue;
                }
            },
            16 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            18 => {
                __builtin.debugtrap();
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
                    sdl_pc = 17;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverLg4ff_RumbleJoystick(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: Uint16, _: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverLg4ff_RumbleJoystickTriggers(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: Uint16, _: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverLg4ff_GetJoystickCapabilities(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (@as(c_int, device.*.product_id)) {
                    USB_DEVICE_ID_LOGITECH_G29_WHEEL => {
                        sdl_pc = 2;
                        continue;
                    },
                    USB_DEVICE_ID_LOGITECH_G27_WHEEL => {
                        sdl_pc = 3;
                        continue;
                    },
                    else => {
                        sdl_pc = 4;
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
                return SDL_JOYSTICK_CAP_MONO_LED;
            },
            4 => {
                return 0;
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverLg4ff_SendLedCommand(device: [*c]SDL_HIDAPI_Device, state: Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [33:0]u8 = "HIDAPI_DriverLg4ff_SendLedCommand".*;
    };
    _ = &static_local___func__;
    var cmd: [7]Uint8 = undefined;
    _ = &cmd;
    var led_state: Uint8 = undefined;
    _ = &led_state;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "0",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data;
    var sdl_assert_state: SDL_AssertState = undefined;
    _ = &sdl_assert_state;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                led_state = 0;
                switch (@as(c_int, state)) {
                    @as(c_int, 0) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(c_int, 5) => {
                        sdl_pc = 7;
                        continue;
                    },
                    else => {
                        sdl_pc = 8;
                        continue;
                    },
                }
            },
            1 => {
                cmd[@as(c_int, 0)] = 248;
                cmd[@as(c_int, 1)] = 18;
                cmd[@as(c_int, 2)] = led_state;
                cmd[@as(c_int, 3)] = 0;
                cmd[@as(c_int, 4)] = 0;
                cmd[@as(c_int, 5)] = 0;
                cmd[@as(c_int, 6)] = 0;
                return @as(c_ulong, @bitCast(@as(c_long, SDL_hid_write_REAL(device.*.dev, @ptrCast(@alignCast(&cmd)), @sizeOf(@TypeOf(cmd)))))) == @sizeOf(@TypeOf(cmd));
            },
            2 => {
                led_state = 0;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                led_state = 1;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                led_state = 3;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            5 => {
                led_state = 7;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            6 => {
                led_state = 15;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            7 => {
                led_state = 31;
                {
                    sdl_pc = 1;
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
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            10 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 11;
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
                if (!(@as(c_int, 0) != 0)) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            13 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_hidapi_lg4ff.c", 928);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
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
                    sdl_pc = 12;
                    continue;
                }
            },
            16 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            18 => {
                __builtin.debugtrap();
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
                    sdl_pc = 17;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverLg4ff_SetJoystickLED(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, red: Uint8, green: Uint8, blue: Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var max_led: c_int = red;
    _ = &max_led;
    if ((@as(c_int, device.*.product_id) != USB_DEVICE_ID_LOGITECH_G29_WHEEL) and (@as(c_int, device.*.product_id) != USB_DEVICE_ID_LOGITECH_G27_WHEEL)) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    if (@as(c_int, green) > max_led) {
        max_led = green;
    }
    if (@as(c_int, blue) > max_led) {
        max_led = blue;
    }
    return HIDAPI_DriverLg4ff_SendLedCommand(device, @bitCast(@as(i8, @truncate(@divTrunc(@as(c_int, 5) * max_led, @as(c_int, 255))))));
}
pub fn HIDAPI_DriverLg4ff_SendJoystickEffect(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, data: ?*const anyopaque, size: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_hid_write_REAL(device.*.dev, @ptrCast(@alignCast(data)), @bitCast(@as(c_long, size))) == size;
}
pub fn HIDAPI_DriverLg4ff_SetSensorsEnabled(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverLg4ff_CloseJoystick(device: [*c]SDL_HIDAPI_Device, joystick: [*c]SDL_Joystick) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = HIDAPI_DriverLg4ff_SetJoystickLED(device, joystick, 0, 0, 0);
}
pub fn HIDAPI_DriverLg4ff_FreeDevice(_: [*c]SDL_HIDAPI_Device) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub export var SDL_HIDAPI_DriverLg4ff: SDL_HIDAPI_DeviceDriver = SDL_HIDAPI_DeviceDriver{
    .name = "SDL_JOYSTICK_HIDAPI_LG4FF",
    .enabled = @"true" != 0,
    .RegisterHints = HIDAPI_DriverLg4ff_RegisterHints,
    .UnregisterHints = HIDAPI_DriverLg4ff_UnregisterHints,
    .IsEnabled = HIDAPI_DriverLg4ff_IsEnabled,
    .IsSupportedDevice = HIDAPI_DriverLg4ff_IsSupportedDevice,
    .InitDevice = HIDAPI_DriverLg4ff_InitDevice,
    .GetDevicePlayerIndex = HIDAPI_DriverLg4ff_GetDevicePlayerIndex,
    .SetDevicePlayerIndex = HIDAPI_DriverLg4ff_SetDevicePlayerIndex,
    .UpdateDevice = HIDAPI_DriverLg4ff_UpdateDevice,
    .OpenJoystick = HIDAPI_DriverLg4ff_OpenJoystick,
    .RumbleJoystick = HIDAPI_DriverLg4ff_RumbleJoystick,
    .RumbleJoystickTriggers = HIDAPI_DriverLg4ff_RumbleJoystickTriggers,
    .GetJoystickCapabilities = HIDAPI_DriverLg4ff_GetJoystickCapabilities,
    .SetJoystickLED = HIDAPI_DriverLg4ff_SetJoystickLED,
    .SendJoystickEffect = HIDAPI_DriverLg4ff_SendJoystickEffect,
    .SetJoystickSensorsEnabled = HIDAPI_DriverLg4ff_SetSensorsEnabled,
    .CloseJoystick = HIDAPI_DriverLg4ff_CloseJoystick,
    .FreeDevice = HIDAPI_DriverLg4ff_FreeDevice,
};

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_HAT_CENTERED = @as(c_uint, 0x00);
pub const SDL_HAT_UP = @as(c_uint, 0x01);
pub const SDL_HAT_RIGHT = @as(c_uint, 0x02);
pub const SDL_HAT_DOWN = @as(c_uint, 0x04);
pub const SDL_HAT_LEFT = @as(c_uint, 0x08);
pub const SDL_JOYSTICK_CAP_MONO_LED = @as(c_int, 0x00000001);
pub const USB_VENDOR_ID_LOGITECH = @as(c_int, 0x046d);
pub const USB_DEVICE_ID_LOGITECH_G29_WHEEL = __helpers.promoteIntLiteral(c_int, 0xc24f, .hex);
pub const USB_DEVICE_ID_LOGITECH_G27_WHEEL = __helpers.promoteIntLiteral(c_int, 0xc29b, .hex);
pub const USB_DEVICE_ID_LOGITECH_G25_WHEEL = __helpers.promoteIntLiteral(c_int, 0xc299, .hex);
pub const USB_DEVICE_ID_LOGITECH_DFGT_WHEEL = __helpers.promoteIntLiteral(c_int, 0xc29a, .hex);
pub const USB_DEVICE_ID_LOGITECH_DFP_WHEEL = __helpers.promoteIntLiteral(c_int, 0xc298, .hex);
pub const USB_DEVICE_ID_LOGITECH_WHEEL = __helpers.promoteIntLiteral(c_int, 0xc294, .hex);
