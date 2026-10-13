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
pub const wchar_t = c_int;
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
pub extern fn SDL_realloc_REAL(mem: ?*anyopaque, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_crc16_REAL(crc: Uint16, data: ?*const anyopaque, len: usize) Uint16;
pub extern fn SDL_memcmp_REAL(s1: ?*const anyopaque, s2: ?*const anyopaque, len: usize) c_int;
pub extern fn SDL_wcslen_REAL(wstr: [*c]const wchar_t) usize;
pub extern fn SDL_strlen_REAL(str: [*c]const u8) usize;
pub extern fn SDL_strlcat_REAL(dst: [*c]u8, src: [*c]const u8, maxlen: usize) usize;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_strstr_REAL(haystack: [*c]const u8, needle: [*c]const u8) [*c]u8;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_snprintf_REAL(text: [*c]u8, maxlen: usize, fmt: [*c]const u8, ...) c_int;
pub extern fn SDL_iconv_string_REAL(tocode: [*c]const u8, fromcode: [*c]const u8, inbuf: [*c]const u8, inbytesleft: usize) [*c]u8;
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
pub extern fn SDL_CompareAndSwapAtomicInt_REAL(a: [*c]SDL_AtomicInt, oldval: c_int, newval: c_int) bool;
pub extern fn SDL_SetAtomicInt_REAL(a: [*c]SDL_AtomicInt, v: c_int) c_int;
pub extern fn SDL_GetAtomicInt_REAL(a: [*c]SDL_AtomicInt) c_int;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub extern fn SDL_OutOfMemory_REAL() bool;
pub extern fn SDL_GetError_REAL() [*c]const u8;
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
pub const SDL_JOYSTICK_TYPE_UNKNOWN: c_int = 0;
pub const SDL_JOYSTICK_TYPE_GAMEPAD: c_int = 1;
pub const enum_SDL_JoystickType = c_uint;
pub const SDL_JoystickType = enum_SDL_JoystickType;
pub const SDL_GAMEPAD_TYPE_STANDARD: c_int = 1;
pub const SDL_GAMEPAD_TYPE_XBOX360: c_int = 2;
pub const SDL_GAMEPAD_TYPE_XBOXONE: c_int = 3;
pub const enum_SDL_GamepadType = c_uint;
pub const SDL_GamepadType = enum_SDL_GamepadType;
pub const SDL_HintCallback = ?*const fn (userdata: ?*anyopaque, name: [*c]const u8, oldValue: [*c]const u8, newValue: [*c]const u8) callconv(.c) void;
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
pub const struct_SDL_hid_device = opaque {
};
pub const SDL_hid_device = struct_SDL_hid_device;
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
pub const struct_joystick_hwdata = extern struct {
    device: [*c]SDL_HIDAPI_Device = null,
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
pub extern fn SDL_LockJoysticks_REAL() void;
pub extern fn SDL_UnlockJoysticks_REAL() void;
pub extern fn SDL_GetJoystickFromID_REAL(instance_id: SDL_JoystickID) [*c]SDL_Joystick;
pub extern fn SDL_GetJoystickProperties_REAL(joystick: [*c]SDL_Joystick) SDL_PropertiesID;
pub extern fn SDL_GetJoystickGUIDInfo_REAL(guid: SDL_GUID, vendor: [*c]Uint16, product: [*c]Uint16, version: [*c]Uint16, crc16: [*c]Uint16) void;
pub const SDL_HID_API_BUS_USB: c_int = 1;
pub const SDL_HID_API_BUS_BLUETOOTH: c_int = 2;
pub const enum_SDL_hid_bus_type = c_uint;
pub const SDL_hid_bus_type = enum_SDL_hid_bus_type;
pub const struct_SDL_hid_device_info = extern struct {
    path: [*c]u8 = null,
    vendor_id: c_ushort = 0,
    product_id: c_ushort = 0,
    serial_number: [*c]wchar_t = null,
    release_number: c_ushort = 0,
    manufacturer_string: [*c]wchar_t = null,
    product_string: [*c]wchar_t = null,
    usage_page: c_ushort = 0,
    usage: c_ushort = 0,
    interface_number: c_int = 0,
    interface_class: c_int = 0,
    interface_subclass: c_int = 0,
    interface_protocol: c_int = 0,
    bus_type: SDL_hid_bus_type = @import("std").mem.zeroes(SDL_hid_bus_type),
    next: [*c]struct_SDL_hid_device_info = null,
};
pub const SDL_hid_device_info = struct_SDL_hid_device_info;
pub extern fn SDL_hid_init_REAL() c_int;
pub extern fn SDL_hid_exit_REAL() c_int;
pub extern fn SDL_hid_device_change_count_REAL() Uint32;
pub extern fn SDL_hid_enumerate_REAL(vendor_id: c_ushort, product_id: c_ushort) [*c]SDL_hid_device_info;
pub extern fn SDL_hid_free_enumeration_REAL(devs: [*c]SDL_hid_device_info) void;
pub extern fn SDL_hid_open_path_REAL(path: [*c]const u8) ?*SDL_hid_device;
pub extern fn SDL_hid_set_nonblocking_REAL(dev: ?*SDL_hid_device, nonblock: c_int) c_int;
pub extern fn SDL_hid_close_REAL(dev: ?*SDL_hid_device) c_int;
pub extern fn SDL_AddHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) bool;
pub extern fn SDL_RemoveHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) void;
pub const SDL_LOG_CATEGORY_INPUT: c_int = 7;
pub extern fn SDL_LogDebug_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_Delay_REAL(ms: Uint32) void;
pub const SDL_OBJECT_TYPE_HIDAPI_JOYSTICK: c_int = 9;
pub const SDL_ObjectType = c_uint;
pub extern fn SDL_GetNextObjectID() Uint32;
pub extern fn SDL_SetObjectValid(object: ?*anyopaque, @"type": SDL_ObjectType, valid: bool) void;
pub extern fn SDL_FindObject(object: ?*anyopaque, @"type": SDL_ObjectType) bool;
pub extern var SDL_object_validation: bool;
pub inline fn SDL_ObjectValid(object: ?*anyopaque, arg_type: SDL_ObjectType) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    if (!(object != null)) {
        return @"false" != 0;
    }
    if (!SDL_object_validation) {
        return @"true" != 0;
    }
    return SDL_FindObject(object, @"type");
}
pub extern fn SDL_AssertJoysticksLocked() void;
pub extern fn SDL_CreateJoystickName(vendor: Uint16, product: Uint16, vendor_name: [*c]const u8, product_name: [*c]const u8) [*c]u8;
pub extern fn SDL_CreateJoystickGUID(bus: Uint16, vendor: Uint16, product: Uint16, version: Uint16, vendor_name: [*c]const u8, product_name: [*c]const u8, driver_signature: Uint8, driver_data: Uint8) SDL_GUID;
pub extern fn SDL_SetJoystickGUIDCRC(guid: [*c]SDL_GUID, crc: Uint16) void;
pub extern fn SDL_GetGamepadTypeFromVIDPID(vendor: Uint16, product: Uint16, name: [*c]const u8, forUI: bool) SDL_GamepadType;
pub extern fn SDL_IsJoystickNintendoSwitchJoyConLeft(vendor_id: Uint16, product_id: Uint16) bool;
pub extern fn SDL_IsJoystickNintendoSwitchJoyConRight(vendor_id: Uint16, product_id: Uint16) bool;
pub extern fn SDL_IsJoystickNintendoSwitchJoyConGrip(vendor_id: Uint16, product_id: Uint16) bool;
pub extern fn SDL_IsJoystickNVIDIASHIELDController(vendor_id: Uint16, product_id: Uint16) bool;
pub extern fn SDL_ShouldIgnoreJoystick(vendor_id: Uint16, product_id: Uint16, version: Uint16, name: [*c]const u8) bool;
pub extern fn SDL_PrivateJoystickAdded(instance_id: SDL_JoystickID) void;
pub extern fn SDL_PrivateJoystickRemoved(instance_id: SDL_JoystickID) void;
pub const EMappingKind = c_uint;
pub const SDL_JoystickDriver = struct_SDL_JoystickDriver;
pub const SDL_HIDAPI_DeviceDriver = struct_SDL_HIDAPI_DeviceDriver;
pub extern var SDL_HIDAPI_DriverCombined: SDL_HIDAPI_DeviceDriver;
pub extern var SDL_HIDAPI_DriverGameCube: SDL_HIDAPI_DeviceDriver;
pub extern var SDL_HIDAPI_DriverGIP: SDL_HIDAPI_DeviceDriver;
pub extern var SDL_HIDAPI_DriverJoyCons: SDL_HIDAPI_DeviceDriver;
pub extern var SDL_HIDAPI_DriverLuna: SDL_HIDAPI_DeviceDriver;
pub extern var SDL_HIDAPI_DriverNintendoClassic: SDL_HIDAPI_DeviceDriver;
pub extern var SDL_HIDAPI_DriverPS3: SDL_HIDAPI_DeviceDriver;
pub extern var SDL_HIDAPI_DriverPS3ThirdParty: SDL_HIDAPI_DeviceDriver;
pub extern var SDL_HIDAPI_DriverPS3SonySixaxis: SDL_HIDAPI_DeviceDriver;
pub extern var SDL_HIDAPI_DriverPS4: SDL_HIDAPI_DeviceDriver;
pub extern var SDL_HIDAPI_DriverPS5: SDL_HIDAPI_DeviceDriver;
pub extern var SDL_HIDAPI_DriverShield: SDL_HIDAPI_DeviceDriver;
pub extern var SDL_HIDAPI_DriverStadia: SDL_HIDAPI_DeviceDriver;
pub extern var SDL_HIDAPI_DriverSteam: SDL_HIDAPI_DeviceDriver;
pub extern var SDL_HIDAPI_DriverSteamDeck: SDL_HIDAPI_DeviceDriver;
pub extern var SDL_HIDAPI_DriverSwitch: SDL_HIDAPI_DeviceDriver;
pub extern var SDL_HIDAPI_DriverSwitch2: SDL_HIDAPI_DeviceDriver;
pub extern var SDL_HIDAPI_DriverWii: SDL_HIDAPI_DeviceDriver;
pub extern var SDL_HIDAPI_DriverXbox360: SDL_HIDAPI_DeviceDriver;
pub extern var SDL_HIDAPI_DriverXbox360W: SDL_HIDAPI_DeviceDriver;
pub extern var SDL_HIDAPI_DriverXbox360BB: SDL_HIDAPI_DeviceDriver;
pub extern var SDL_HIDAPI_DriverXboxOne: SDL_HIDAPI_DeviceDriver;
pub extern var SDL_HIDAPI_DriverSteamHori: SDL_HIDAPI_DeviceDriver;
pub extern var SDL_HIDAPI_DriverSteamTriton: SDL_HIDAPI_DeviceDriver;
pub extern var SDL_HIDAPI_DriverLg4ff: SDL_HIDAPI_DeviceDriver;
pub extern var SDL_HIDAPI_Driver8BitDo: SDL_HIDAPI_DeviceDriver;
pub extern var SDL_HIDAPI_DriverFlydigi: SDL_HIDAPI_DeviceDriver;
pub extern var SDL_HIDAPI_DriverGameSir: SDL_HIDAPI_DeviceDriver;
pub extern var SDL_HIDAPI_DriverSInput: SDL_HIDAPI_DeviceDriver;
pub extern var SDL_HIDAPI_DriverZUIKI: SDL_HIDAPI_DeviceDriver;
pub extern fn SDL_HIDAPI_QuitRumble() void;
pub extern fn SDL_GetStringBoolean(value: [*c]const u8, default_value: bool) bool;
pub var SDL_HIDAPI_drivers: [29][*c]SDL_HIDAPI_DeviceDriver = [29][*c]SDL_HIDAPI_DeviceDriver{
    &SDL_HIDAPI_DriverGameCube,
    &SDL_HIDAPI_DriverLuna,
    &SDL_HIDAPI_DriverShield,
    &SDL_HIDAPI_DriverPS3,
    &SDL_HIDAPI_DriverPS3ThirdParty,
    &SDL_HIDAPI_DriverPS3SonySixaxis,
    &SDL_HIDAPI_DriverPS4,
    &SDL_HIDAPI_DriverPS5,
    &SDL_HIDAPI_DriverStadia,
    &SDL_HIDAPI_DriverSteam,
    &SDL_HIDAPI_DriverSteamHori,
    &SDL_HIDAPI_DriverSteamDeck,
    &SDL_HIDAPI_DriverSteamTriton,
    &SDL_HIDAPI_DriverNintendoClassic,
    &SDL_HIDAPI_DriverJoyCons,
    &SDL_HIDAPI_DriverSwitch,
    &SDL_HIDAPI_DriverSwitch2,
    &SDL_HIDAPI_DriverWii,
    &SDL_HIDAPI_DriverXbox360,
    &SDL_HIDAPI_DriverXbox360W,
    &SDL_HIDAPI_DriverXbox360BB,
    &SDL_HIDAPI_DriverGIP,
    &SDL_HIDAPI_DriverXboxOne,
    &SDL_HIDAPI_DriverLg4ff,
    &SDL_HIDAPI_Driver8BitDo,
    &SDL_HIDAPI_DriverFlydigi,
    &SDL_HIDAPI_DriverSInput,
    &SDL_HIDAPI_DriverGameSir,
    &SDL_HIDAPI_DriverZUIKI,
};
pub var SDL_HIDAPI_numdrivers: c_int = 0;
pub var SDL_HIDAPI_updating_devices: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt);
pub var SDL_HIDAPI_hints_changed: bool = @"false" != 0;
pub var SDL_HIDAPI_change_count: Uint32 = 0;
pub var SDL_HIDAPI_devices: [*c]SDL_HIDAPI_Device = null;
pub var SDL_HIDAPI_numjoysticks: c_int = 0;
pub var SDL_HIDAPI_combine_joycons: bool = @"true" != 0;
pub var initialized: bool = @"false" != 0;
pub var shutting_down: bool = @"false" != 0;
pub fn HIDAPI_ConvertString(wide_string: [*c]const wchar_t) callconv(.c) [*c]u8 {
    @setEvalBranchQuota(100000);
    var string: [*c]u8 = undefined;
    _ = &string;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                string = null;
                if (wide_string != null) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                string = SDL_iconv_string_REAL("UTF-8", "WCHAR_T", @ptrCast(@alignCast(wide_string)), (SDL_wcslen_REAL(wide_string) +% @as(usize, 1)) *% @sizeOf(wchar_t));
                if (!(string != null)) {
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
                return string;
            },
            4 => {
                switch (@sizeOf(wchar_t)) {
                    @as(c_ulong, 2) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(c_ulong, 4) => {
                        sdl_pc = 9;
                        continue;
                    },
                    else => {
                        sdl_pc = 7;
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
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            7 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            8 => {
                string = SDL_iconv_string_REAL("UTF-8", "UCS-2-INTERNAL", @ptrCast(@alignCast(wide_string)), (SDL_wcslen_REAL(wide_string) +% @as(usize, 1)) *% @sizeOf(wchar_t));
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            9 => {
                string = SDL_iconv_string_REAL("UTF-8", "UCS-4-INTERNAL", @ptrCast(@alignCast(wide_string)), (SDL_wcslen_REAL(wide_string) +% @as(usize, 1)) *% @sizeOf(wchar_t));
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn HIDAPI_DumpPacket(prefix: [*c]const u8, data: [*c]const Uint8, size: c_int) void {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var buffer: [*c]u8 = undefined;
    _ = &buffer;
    var length: usize = (((SDL_strlen_REAL(prefix) +% @as(usize, @bitCast(@as(c_long, @as(c_int, 11) * @divTrunc(size, @as(c_int, 8)))))) +% @as(usize, @bitCast(@as(c_long, (@as(c_int, 5) * size) * @as(c_int, 2))))) +% @as(usize, 1)) +% @as(usize, 1);
    _ = &length;
    var start: c_int = 0;
    _ = &start;
    var amount: c_int = size;
    _ = &amount;
    var current_len: usize = undefined;
    _ = &current_len;
    buffer = @ptrCast(@alignCast(SDL_malloc_REAL(length)));
    current_len = @bitCast(@as(c_long, SDL_snprintf_REAL(buffer, length, prefix, size)));
    {
        i = start;
        while (i < (start + amount)) : (i += 1) {
            if (__helpers.signedRemainder(i, @as(c_int, 8)) == @as(c_int, 0)) {
                current_len +%= @bitCast(@as(c_long, SDL_snprintf_REAL(&buffer[current_len], length -% current_len, "\n%.2d:      ", i)));
            }
            current_len +%= @bitCast(@as(c_long, SDL_snprintf_REAL(&buffer[current_len], length -% current_len, " 0x%.2x", data[@bitCast(@as(isize, @intCast(i)))])));
        }
    }
    _ = SDL_strlcat_REAL(buffer, "\n", length);
    SDL_LogDebug_REAL(SDL_LOG_CATEGORY_INPUT, "%s", buffer);
    SDL_free_REAL(@ptrCast(@alignCast(buffer)));
}
pub export fn HIDAPI_SupportsPlaystationDetection(vendor: Uint16, product: Uint16) bool {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (SDL_GetGamepadTypeFromVIDPID(vendor, product, null, @"false" != 0) != @as(SDL_GamepadType, SDL_GAMEPAD_TYPE_STANDARD)) {
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
                switch (@as(c_int, vendor)) {
                    USB_VENDOR_CRKD => {
                        sdl_pc = 5;
                        continue;
                    },
                    USB_VENDOR_DRAGONRISE => {
                        sdl_pc = 6;
                        continue;
                    },
                    USB_VENDOR_CORSAIR => {
                        sdl_pc = 7;
                        continue;
                    },
                    USB_VENDOR_HORI => {
                        sdl_pc = 8;
                        continue;
                    },
                    USB_VENDOR_LOGITECH => {
                        sdl_pc = 9;
                        continue;
                    },
                    USB_VENDOR_MADCATZ => {
                        sdl_pc = 10;
                        continue;
                    },
                    USB_VENDOR_MAYFLASH => {
                        sdl_pc = 14;
                        continue;
                    },
                    USB_VENDOR_NACON => {
                        sdl_pc = 15;
                        continue;
                    },
                    USB_VENDOR_NACON_ALT => {
                        sdl_pc = 16;
                        continue;
                    },
                    USB_VENDOR_PDP => {
                        sdl_pc = 17;
                        continue;
                    },
                    USB_VENDOR_POWERA => {
                        sdl_pc = 18;
                        continue;
                    },
                    USB_VENDOR_POWERA_ALT => {
                        sdl_pc = 19;
                        continue;
                    },
                    USB_VENDOR_QANBA => {
                        sdl_pc = 20;
                        continue;
                    },
                    USB_VENDOR_RAZER => {
                        sdl_pc = 21;
                        continue;
                    },
                    USB_VENDOR_RED_OCTANE_GAMES => {
                        sdl_pc = 22;
                        continue;
                    },
                    USB_VENDOR_SHANWAN => {
                        sdl_pc = 23;
                        continue;
                    },
                    USB_VENDOR_SHANWAN_ALT => {
                        sdl_pc = 24;
                        continue;
                    },
                    USB_VENDOR_THRUSTMASTER => {
                        sdl_pc = 25;
                        continue;
                    },
                    USB_VENDOR_ZEROPLUS => {
                        sdl_pc = 26;
                        continue;
                    },
                    @as(c_int, 30021) => {
                        sdl_pc = 27;
                        continue;
                    },
                    else => {
                        sdl_pc = 28;
                        continue;
                    },
                }
            },
            4 => {
                return undefined;
            },
            5 => {
                return @"true" != 0;
            },
            6 => {
                return @"true" != 0;
            },
            7 => {
                return @"true" != 0;
            },
            8 => {
                return @"true" != 0;
            },
            9 => {
                return @"false" != 0;
            },
            10 => {
                if (@as(c_int, product) == USB_PRODUCT_MADCATZ_SAITEK_SIDE_PANEL_CONTROL_DECK) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                return @"false" != 0;
            },
            12 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                return @"true" != 0;
            },
            14 => {
                return @"true" != 0;
            },
            15 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                return @"true" != 0;
            },
            17 => {
                return @"true" != 0;
            },
            18 => {
                return @"true" != 0;
            },
            19 => {
                return @"true" != 0;
            },
            20 => {
                return @"true" != 0;
            },
            21 => {
                return @"false" != 0;
            },
            22 => {
                return @"true" != 0;
            },
            23 => {
                return @"true" != 0;
            },
            24 => {
                return @"true" != 0;
            },
            25 => {
                return @"false" != 0;
            },
            26 => {
                return @"true" != 0;
            },
            27 => {
                return @"true" != 0;
            },
            28 => {
                return @"false" != 0;
            },
            else => unreachable,
        }
    }
}
pub export fn HIDAPI_RemapVal(val: f32, val_min: f32, val_max: f32, output_min: f32, output_max: f32) f32 {
    @setEvalBranchQuota(100000);
    return output_min + (((output_max - output_min) * (val - val_min)) / (val_max - val_min));
}
pub fn SDL_GetJoystickGameControllerProtocol(name: [*c]const u8, vendor: Uint16, product: Uint16, interface_number: c_int, interface_class: c_int, interface_subclass: c_int, interface_protocol: c_int) callconv(.c) SDL_GamepadType {
    @setEvalBranchQuota(100000);
    const static_local_LIBUSB_CLASS_VENDOR_SPEC = struct {
        const LIBUSB_CLASS_VENDOR_SPEC: c_int = 255;
    };
    _ = &static_local_LIBUSB_CLASS_VENDOR_SPEC;
    const static_local_XB360_IFACE_SUBCLASS = struct {
        const XB360_IFACE_SUBCLASS: c_int = 93;
    };
    _ = &static_local_XB360_IFACE_SUBCLASS;
    const static_local_XB360_IFACE_PROTOCOL = struct {
        const XB360_IFACE_PROTOCOL: c_int = 1;
    };
    _ = &static_local_XB360_IFACE_PROTOCOL;
    const static_local_XB360W_IFACE_PROTOCOL = struct {
        const XB360W_IFACE_PROTOCOL: c_int = 129;
    };
    _ = &static_local_XB360W_IFACE_PROTOCOL;
    const static_local_XBONE_IFACE_SUBCLASS = struct {
        const XBONE_IFACE_SUBCLASS: c_int = 71;
    };
    _ = &static_local_XBONE_IFACE_SUBCLASS;
    const static_local_XBONE_IFACE_PROTOCOL = struct {
        const XBONE_IFACE_PROTOCOL: c_int = 208;
    };
    _ = &static_local_XBONE_IFACE_PROTOCOL;
    var @"type": SDL_GamepadType = SDL_GAMEPAD_TYPE_STANDARD;
    _ = &@"type";
    if (((interface_class == static_local_LIBUSB_CLASS_VENDOR_SPEC.LIBUSB_CLASS_VENDOR_SPEC) and (interface_subclass == static_local_XB360_IFACE_SUBCLASS.XB360_IFACE_SUBCLASS)) and ((interface_protocol == static_local_XB360_IFACE_PROTOCOL.XB360_IFACE_PROTOCOL) or (interface_protocol == static_local_XB360W_IFACE_PROTOCOL.XB360W_IFACE_PROTOCOL))) {
        const static_local_SUPPORTED_VENDORS = struct {
            const SUPPORTED_VENDORS: [33]c_int = [33]c_int{
                121,
                849,
                1103,
                1118,
                1133,
                1390,
                1699,
                1848,
                2047,
                3695,
                3853,
                4152,
                4341,
                4553,
                4617,
                4779,
                5168,
                5227,
                5426,
                5604,
                5678,
                5769,
                6473,
                7085,
                8406,
                9414,
                11298,
                11720,
                13623,
                13905,
                14295,
                14680,
                39046,
            };
        };
        _ = &static_local_SUPPORTED_VENDORS;
        var i: c_int = undefined;
        _ = &i;
        {
            i = 0;
            while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(static_local_SUPPORTED_VENDORS.SUPPORTED_VENDORS)) / @sizeOf(@TypeOf(static_local_SUPPORTED_VENDORS.SUPPORTED_VENDORS[@as(c_int, 0)])))) : (i += 1) {
                if (@as(c_int, vendor) == static_local_SUPPORTED_VENDORS.SUPPORTED_VENDORS[@bitCast(@as(isize, @intCast(i)))]) {
                    @"type" = SDL_GAMEPAD_TYPE_XBOX360;
                    break;
                }
            }
        }
    }
    if ((((interface_number == @as(c_int, 0)) and (interface_class == static_local_LIBUSB_CLASS_VENDOR_SPEC.LIBUSB_CLASS_VENDOR_SPEC)) and (interface_subclass == static_local_XBONE_IFACE_SUBCLASS.XBONE_IFACE_SUBCLASS)) and (interface_protocol == static_local_XBONE_IFACE_PROTOCOL.XBONE_IFACE_PROTOCOL)) {
        const static_local_SUPPORTED_VENDORS = struct {
            const SUPPORTED_VENDORS: [22]c_int = [22]c_int{
                849,
                1008,
                1103,
                1118,
                1848,
                2821,
                3695,
                3853,
                4341,
                4617,
                5426,
                8406,
                9414,
                10571,
                11720,
                11812,
                11925,
                12933,
                13623,
                13905,
                13932,
                14680,
            };
        };
        _ = &static_local_SUPPORTED_VENDORS;
        var i: c_int = undefined;
        _ = &i;
        {
            i = 0;
            while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(static_local_SUPPORTED_VENDORS.SUPPORTED_VENDORS)) / @sizeOf(@TypeOf(static_local_SUPPORTED_VENDORS.SUPPORTED_VENDORS[@as(c_int, 0)])))) : (i += 1) {
                if (@as(c_int, vendor) == static_local_SUPPORTED_VENDORS.SUPPORTED_VENDORS[@bitCast(@as(isize, @intCast(i)))]) {
                    @"type" = SDL_GAMEPAD_TYPE_XBOXONE;
                    break;
                }
            }
        }
    }
    if (@"type" == @as(SDL_GamepadType, SDL_GAMEPAD_TYPE_STANDARD)) {
        @"type" = SDL_GetGamepadTypeFromVIDPID(vendor, product, name, @"false" != 0);
    }
    return @"type";
}
pub fn HIDAPI_IsDeviceSupported(vendor_id: Uint16, product_id: Uint16, version: Uint16, name: [*c]const u8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var @"type": SDL_GamepadType = SDL_GetJoystickGameControllerProtocol(name, vendor_id, product_id, -@as(c_int, 1), 0, 0, 0);
    _ = &@"type";
    {
        i = 0;
        while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(SDL_HIDAPI_drivers)) / @sizeOf(@TypeOf(SDL_HIDAPI_drivers[@as(c_int, 0)])))) : (i += 1) {
            var driver: [*c]SDL_HIDAPI_DeviceDriver = SDL_HIDAPI_drivers[@bitCast(@as(isize, @intCast(i)))];
            _ = &driver;
            if (driver.*.enabled and driver.*.IsSupportedDevice.?(null, name, @"type", vendor_id, product_id, version, -@as(c_int, 1), 0, 0, 0)) {
                return @"true" != 0;
            }
        }
    }
    return @"false" != 0;
}
pub fn HIDAPI_GetDeviceDriver(device: [*c]SDL_HIDAPI_Device) callconv(.c) [*c]SDL_HIDAPI_DeviceDriver {
    @setEvalBranchQuota(100000);
    const USAGE_PAGE_GENERIC_DESKTOP: Uint16 = 1;
    _ = &USAGE_PAGE_GENERIC_DESKTOP;
    const USAGE_JOYSTICK: Uint16 = 4;
    _ = &USAGE_JOYSTICK;
    const USAGE_GAMEPAD: Uint16 = 5;
    _ = &USAGE_GAMEPAD;
    const USAGE_MULTIAXISCONTROLLER: Uint16 = 8;
    _ = &USAGE_MULTIAXISCONTROLLER;
    var i: c_int = undefined;
    _ = &i;
    if (device.*.num_children > @as(c_int, 0)) {
        return &SDL_HIDAPI_DriverCombined;
    }
    if (SDL_ShouldIgnoreJoystick(device.*.vendor_id, device.*.product_id, device.*.version, device.*.name)) {
        return null;
    }
    if (((@as(c_int, device.*.vendor_id) != USB_VENDOR_VALVE) and (@as(c_int, device.*.vendor_id) != USB_VENDOR_FLYDIGI_V1)) and (@as(c_int, device.*.vendor_id) != USB_VENDOR_FLYDIGI_V2)) {
        if ((@as(c_int, device.*.usage_page) != 0) and (@as(c_int, device.*.usage_page) != @as(c_int, USAGE_PAGE_GENERIC_DESKTOP))) {
            return null;
        }
        if ((((@as(c_int, device.*.usage) != 0) and (@as(c_int, device.*.usage) != @as(c_int, USAGE_JOYSTICK))) and (@as(c_int, device.*.usage) != @as(c_int, USAGE_GAMEPAD))) and (@as(c_int, device.*.usage) != @as(c_int, USAGE_MULTIAXISCONTROLLER))) {
            return null;
        }
    }
    {
        i = 0;
        while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(SDL_HIDAPI_drivers)) / @sizeOf(@TypeOf(SDL_HIDAPI_drivers[@as(c_int, 0)])))) : (i += 1) {
            var driver: [*c]SDL_HIDAPI_DeviceDriver = SDL_HIDAPI_drivers[@bitCast(@as(isize, @intCast(i)))];
            _ = &driver;
            if (driver.*.enabled and driver.*.IsSupportedDevice.?(device, device.*.name, device.*.type, device.*.vendor_id, device.*.product_id, device.*.version, device.*.interface_number, device.*.interface_class, device.*.interface_subclass, device.*.interface_protocol)) {
                return driver;
            }
        }
    }
    return null;
}
pub fn HIDAPI_GetDeviceByIndex(arg_device_index: c_int, pJoystickID: [*c]SDL_JoystickID) callconv(.c) [*c]SDL_HIDAPI_Device {
    @setEvalBranchQuota(100000);
    var device_index = arg_device_index;
    _ = &device_index;
    var device: [*c]SDL_HIDAPI_Device = undefined;
    _ = &device;
    SDL_AssertJoysticksLocked();
    {
        device = SDL_HIDAPI_devices;
        while (device != null) : (device = device.*.next) {
            if ((device.*.parent != null) or device.*.broken) {
                continue;
            }
            if (device.*.driver != null) {
                if (device_index < device.*.num_joysticks) {
                    if (pJoystickID != null) {
                        pJoystickID.* = device.*.joysticks[@bitCast(@as(isize, @intCast(device_index)))];
                    }
                    return device;
                }
                device_index -= device.*.num_joysticks;
            }
        }
    }
    return null;
}
pub fn HIDAPI_GetJoystickByInfo(path: [*c]const u8, vendor_id: Uint16, product_id: Uint16) callconv(.c) [*c]SDL_HIDAPI_Device {
    @setEvalBranchQuota(100000);
    var device: [*c]SDL_HIDAPI_Device = undefined;
    _ = &device;
    SDL_AssertJoysticksLocked();
    {
        device = SDL_HIDAPI_devices;
        while (device != null) : (device = device.*.next) {
            if (((@as(c_int, device.*.vendor_id) == @as(c_int, vendor_id)) and (@as(c_int, device.*.product_id) == @as(c_int, product_id))) and (SDL_strcmp_REAL(device.*.path, path) == @as(c_int, 0))) {
                break;
            }
        }
    }
    return device;
}
pub fn HIDAPI_CleanupDeviceDriver(device: [*c]SDL_HIDAPI_Device) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (!(device.*.driver != null)) {
        return;
    }
    while ((device.*.num_joysticks != 0) and (device.*.joysticks != null)) {
        HIDAPI_JoystickDisconnected(device, device.*.joysticks[@as(c_int, 0)]);
    }
    device.*.driver.*.FreeDevice.?(device);
    device.*.driver = null;
    if (device.*.dev != null) {
        _ = SDL_hid_close_REAL(device.*.dev);
        device.*.dev = null;
    }
    if (device.*.context != null) {
        SDL_free_REAL(device.*.context);
        device.*.context = null;
    }
}
pub fn HIDAPI_SetupDeviceDriver(device: [*c]SDL_HIDAPI_Device, removed: [*c]bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    removed.* = @"false" != 0;
    if (device.*.driver != null) {
        var enabled: bool = undefined;
        _ = &enabled;
        if ((@as(c_int, device.*.vendor_id) == USB_VENDOR_NINTENDO) and ((@as(c_int, device.*.product_id) == USB_PRODUCT_NINTENDO_SWITCH_JOYCON_PAIR) or (@as(c_int, device.*.product_id) == USB_PRODUCT_NINTENDO_SWITCH2_JOYCON_PAIR))) {
            enabled = SDL_HIDAPI_combine_joycons;
        } else {
            enabled = device.*.driver.*.enabled;
        }
        if (device.*.children != null) {
            var i: c_int = undefined;
            _ = &i;
            {
                i = 0;
                while (i < device.*.num_children) : (i += 1) {
                    var child: [*c]SDL_HIDAPI_Device = device.*.children[@bitCast(@as(isize, @intCast(i)))];
                    _ = &child;
                    if (!(child.*.driver != null) or !child.*.driver.*.enabled) {
                        enabled = @"false" != 0;
                        break;
                    }
                }
            }
        }
        if (!enabled) {
            HIDAPI_CleanupDeviceDriver(device);
        }
        return;
    }
    if (HIDAPI_GetDeviceDriver(device) != null) {
        if (device.*.num_children == @as(c_int, 0)) {
            var dev: ?*SDL_hid_device = undefined;
            _ = &dev;
            SDL_Delay_REAL(10);
            dev = SDL_hid_open_path_REAL(device.*.path);
            if (@as(?*anyopaque, @ptrCast(@alignCast(dev))) == @as(?*anyopaque, null)) {
                SDL_LogDebug_REAL(SDL_LOG_CATEGORY_INPUT, "HIDAPI_SetupDeviceDriver() couldn't open %s: %s", device.*.path, SDL_GetError_REAL());
                return;
            }
            _ = SDL_hid_set_nonblocking_REAL(dev, 1);
            device.*.dev = dev;
        }
        device.*.driver = HIDAPI_GetDeviceDriver(device);
        if ((device.*.driver != null) and !device.*.driver.*.InitDevice.?(device)) {
            HIDAPI_CleanupDeviceDriver(device);
        }
        if (!(device.*.driver != null) and (device.*.dev != null)) {
            _ = SDL_hid_close_REAL(device.*.dev);
            device.*.dev = null;
        }
    }
}
pub fn SDL_HIDAPI_UpdateDrivers() callconv(.c) void {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var device: [*c]SDL_HIDAPI_Device = undefined;
    _ = &device;
    var removed: bool = undefined;
    _ = &removed;
    SDL_AssertJoysticksLocked();
    SDL_HIDAPI_numdrivers = 0;
    {
        i = 0;
        while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(SDL_HIDAPI_drivers)) / @sizeOf(@TypeOf(SDL_HIDAPI_drivers[@as(c_int, 0)])))) : (i += 1) {
            var driver: [*c]SDL_HIDAPI_DeviceDriver = SDL_HIDAPI_drivers[@bitCast(@as(isize, @intCast(i)))];
            _ = &driver;
            driver.*.enabled = driver.*.IsEnabled.?();
            if (driver.*.enabled and (driver != (&SDL_HIDAPI_DriverCombined))) {
                SDL_HIDAPI_numdrivers += 1;
            }
        }
    }
    removed = @"false" != 0;
    while (true) {
        {
            device = SDL_HIDAPI_devices;
            while (device != null) : (device = device.*.next) {
                HIDAPI_SetupDeviceDriver(device, &removed);
                if (removed) {
                    break;
                }
            }
        }
        if (!removed) break;
    }
}
pub fn SDL_HIDAPIDriverHintChanged(_: ?*anyopaque, name: [*c]const u8, _: [*c]const u8, hint: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (SDL_strcmp_REAL(name, "SDL_JOYSTICK_HIDAPI_COMBINE_JOY_CONS") == @as(c_int, 0)) {
        SDL_HIDAPI_combine_joycons = SDL_GetStringBoolean(hint, @"true" != 0);
    }
    SDL_HIDAPI_hints_changed = @"true" != 0;
    SDL_HIDAPI_change_count = 0;
}
pub fn HIDAPI_JoystickInit() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    if (initialized) {
        return @"true" != 0;
    }
    if (SDL_hid_init_REAL() < @as(c_int, 0)) {
        return SDL_SetError_REAL("Couldn't initialize hidapi");
    }
    {
        i = 0;
        while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(SDL_HIDAPI_drivers)) / @sizeOf(@TypeOf(SDL_HIDAPI_drivers[@as(c_int, 0)])))) : (i += 1) {
            var driver: [*c]SDL_HIDAPI_DeviceDriver = SDL_HIDAPI_drivers[@bitCast(@as(isize, @intCast(i)))];
            _ = &driver;
            driver.*.RegisterHints.?(SDL_HIDAPIDriverHintChanged, @ptrCast(@alignCast(driver)));
        }
    }
    _ = SDL_AddHintCallback_REAL("SDL_JOYSTICK_HIDAPI_COMBINE_JOY_CONS", SDL_HIDAPIDriverHintChanged, null);
    _ = SDL_AddHintCallback_REAL("SDL_JOYSTICK_HIDAPI", SDL_HIDAPIDriverHintChanged, null);
    SDL_HIDAPI_change_count = SDL_hid_device_change_count_REAL();
    HIDAPI_UpdateDeviceList();
    HIDAPI_UpdateDevices();
    initialized = @"true" != 0;
    return @"true" != 0;
}
pub fn HIDAPI_AddJoystickInstanceToDevice(device: [*c]SDL_HIDAPI_Device, joystickID: SDL_JoystickID) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var joysticks: [*c]SDL_JoystickID = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(device.*.joysticks)), @as(c_ulong, @bitCast(@as(c_long, device.*.num_joysticks + @as(c_int, 1)))) *% @sizeOf(@TypeOf(device.*.joysticks.*)))));
    _ = &joysticks;
    if (!(joysticks != null)) {
        return @"false" != 0;
    }
    device.*.joysticks = joysticks;
    device.*.joysticks[
        @bitCast(@as(isize, @intCast(blk: {
            const ref = &device.*.num_joysticks;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        })))
    ] = joystickID;
    return @"true" != 0;
}
pub fn HIDAPI_DelJoystickInstanceFromDevice(device: [*c]SDL_HIDAPI_Device, joystickID: SDL_JoystickID) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var size: c_int = undefined;
    _ = &size;
    {
        i = 0;
        while (i < device.*.num_joysticks) : (i += 1) {
            if (device.*.joysticks[@bitCast(@as(isize, @intCast(i)))] == joystickID) {
                size = @bitCast(@as(c_uint, @truncate(@as(c_ulong, @bitCast(@as(c_long, (device.*.num_joysticks - i) - @as(c_int, 1)))) *% @sizeOf(SDL_JoystickID))));
                _ = memmove(@ptrCast(@alignCast(&device.*.joysticks[@bitCast(@as(isize, @intCast(i)))])), @ptrCast(@alignCast(&device.*.joysticks[@bitCast(@as(isize, @intCast(i + @as(c_int, 1))))])), @bitCast(@as(c_long, size)));
                device.*.num_joysticks -= 1;
                if (device.*.num_joysticks == @as(c_int, 0)) {
                    SDL_free_REAL(@ptrCast(@alignCast(device.*.joysticks)));
                    device.*.joysticks = null;
                }
                return @"true" != 0;
            }
        }
    }
    return @"false" != 0;
}
pub fn HIDAPI_JoystickInstanceIsUnique(device: [*c]SDL_HIDAPI_Device, _: SDL_JoystickID) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if ((((device.*.parent != null) and (device.*.num_joysticks == @as(c_int, 1))) and (device.*.parent.*.num_joysticks == @as(c_int, 1))) and (device.*.joysticks[@as(c_int, 0)] == device.*.parent.*.joysticks[@as(c_int, 0)])) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub export fn HIDAPI_SetDeviceName(device: [*c]SDL_HIDAPI_Device, name: [*c]const u8) void {
    @setEvalBranchQuota(100000);
    if (((name != null) and (@as(c_int, name.*) != 0)) and (SDL_strcmp_REAL(name, device.*.name) != @as(c_int, 0))) {
        SDL_free_REAL(@ptrCast(@alignCast(device.*.name)));
        device.*.name = SDL_strdup_REAL(name);
        SDL_SetJoystickGUIDCRC(&device.*.guid, SDL_crc16_REAL(0, @ptrCast(@alignCast(name)), SDL_strlen_REAL(name)));
    }
}
pub export fn HIDAPI_SetDeviceProduct(device: [*c]SDL_HIDAPI_Device, vendor_id: Uint16, product_id: Uint16) void {
    @setEvalBranchQuota(100000);
    device.*.guid = SDL_CreateJoystickGUID(device.*.guid.data[@as(c_int, 0)], vendor_id, product_id, device.*.version, device.*.manufacturer_string, device.*.product_string, 'h', 0);
}
pub fn HIDAPI_UpdateJoystickSerial(device: [*c]SDL_HIDAPI_Device) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    SDL_AssertJoysticksLocked();
    {
        i = 0;
        while (i < device.*.num_joysticks) : (i += 1) {
            var joystick: [*c]SDL_Joystick = SDL_GetJoystickFromID_REAL(device.*.joysticks[@bitCast(@as(isize, @intCast(i)))]);
            _ = &joystick;
            if ((joystick != null) and (device.*.serial != null)) {
                SDL_free_REAL(@ptrCast(@alignCast(joystick.*.serial)));
                joystick.*.serial = SDL_strdup_REAL(device.*.serial);
            }
        }
    }
}
pub fn HIDAPI_SerialIsEmpty(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var all_zeroes: bool = @"true" != 0;
    _ = &all_zeroes;
    if (device.*.serial != null) {
        var serial: [*c]const u8 = device.*.serial;
        _ = &serial;
        {
            serial = device.*.serial;
            while (@as(c_int, serial.*) != 0) : (serial += 1) {
                if (@as(c_int, serial.*) != @as(c_int, '0')) {
                    all_zeroes = @"false" != 0;
                    break;
                }
            }
        }
    }
    return all_zeroes;
}
pub export fn HIDAPI_SetDeviceSerial(device: [*c]SDL_HIDAPI_Device, serial: [*c]const u8) void {
    @setEvalBranchQuota(100000);
    if (((serial != null) and (@as(c_int, serial.*) != 0)) and (!(device.*.serial != null) or (SDL_strcmp_REAL(serial, device.*.serial) != @as(c_int, 0)))) {
        SDL_free_REAL(@ptrCast(@alignCast(device.*.serial)));
        device.*.serial = SDL_strdup_REAL(serial);
        HIDAPI_UpdateJoystickSerial(device);
    }
}
pub fn wcstrcmp(arg_str1: [*c]const wchar_t, arg_str2: [*c]const u8) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var str1 = arg_str1;
    _ = &str1;
    var str2 = arg_str2;
    _ = &str2;
    var result: c_int = undefined;
    _ = &result;
    while (true) {
        result = str1.* - @as(c_int, str2.*);
        if ((result != @as(c_int, 0)) or (str1.* == @as(c_int, 0))) {
            break;
        }
        str1 += 1;
        str2 += 1;
    }
    return result;
}
pub fn HIDAPI_SetDeviceSerialW(device: [*c]SDL_HIDAPI_Device, serial: [*c]const wchar_t) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (((serial != null) and (serial.* != 0)) and (!(device.*.serial != null) or (wcstrcmp(serial, device.*.serial) != @as(c_int, 0)))) {
        SDL_free_REAL(@ptrCast(@alignCast(device.*.serial)));
        device.*.serial = HIDAPI_ConvertString(serial);
        HIDAPI_UpdateJoystickSerial(device);
    }
}
pub export fn HIDAPI_HasConnectedUSBDevice(serial: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    var device: [*c]SDL_HIDAPI_Device = undefined;
    _ = &device;
    SDL_AssertJoysticksLocked();
    if (!(serial != null)) {
        return @"false" != 0;
    }
    {
        device = SDL_HIDAPI_devices;
        while (device != null) : (device = device.*.next) {
            if (!(device.*.driver != null) or device.*.broken) {
                continue;
            }
            if (device.*.is_bluetooth) {
                continue;
            }
            if ((device.*.serial != null) and (SDL_strcmp_REAL(serial, device.*.serial) == @as(c_int, 0))) {
                return @"true" != 0;
            }
        }
    }
    return @"false" != 0;
}
pub export fn HIDAPI_DisconnectBluetoothDevice(serial: [*c]const u8) void {
    @setEvalBranchQuota(100000);
    var device: [*c]SDL_HIDAPI_Device = undefined;
    _ = &device;
    SDL_AssertJoysticksLocked();
    if (!(serial != null)) {
        return;
    }
    {
        device = SDL_HIDAPI_devices;
        while (device != null) : (device = device.*.next) {
            if (!(device.*.driver != null) or device.*.broken) {
                continue;
            }
            if (!device.*.is_bluetooth) {
                continue;
            }
            if ((device.*.serial != null) and (SDL_strcmp_REAL(serial, device.*.serial) == @as(c_int, 0))) {
                while ((device.*.num_joysticks != 0) and (device.*.joysticks != null)) {
                    HIDAPI_JoystickDisconnected(device, device.*.joysticks[@as(c_int, 0)]);
                }
            }
        }
    }
}
pub export fn HIDAPI_JoystickConnected(device: [*c]SDL_HIDAPI_Device, pJoystickID: [*c]SDL_JoystickID) bool {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var j: c_int = undefined;
    _ = &j;
    var joystickID: SDL_JoystickID = undefined;
    _ = &joystickID;
    SDL_AssertJoysticksLocked();
    {
        i = 0;
        while (i < device.*.num_children) : (i += 1) {
            var child: [*c]SDL_HIDAPI_Device = device.*.children[@bitCast(@as(isize, @intCast(i)))];
            _ = &child;
            {
                j = child.*.num_joysticks;
                while ((blk: {
                    const ref = &j;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    HIDAPI_JoystickDisconnected(child, child.*.joysticks[@bitCast(@as(isize, @intCast(j)))]);
                }
            }
        }
    }
    joystickID = SDL_GetNextObjectID();
    _ = HIDAPI_AddJoystickInstanceToDevice(device, joystickID);
    {
        i = 0;
        while (i < device.*.num_children) : (i += 1) {
            var child: [*c]SDL_HIDAPI_Device = device.*.children[@bitCast(@as(isize, @intCast(i)))];
            _ = &child;
            _ = HIDAPI_AddJoystickInstanceToDevice(child, joystickID);
        }
    }
    SDL_HIDAPI_numjoysticks += 1;
    if (pJoystickID != null) {
        pJoystickID.* = joystickID;
    }
    SDL_PrivateJoystickAdded(joystickID);
    return @"true" != 0;
}
pub export fn HIDAPI_JoystickDisconnected(arg_device: [*c]SDL_HIDAPI_Device, joystickID: SDL_JoystickID) void {
    @setEvalBranchQuota(100000);
    var device = arg_device;
    _ = &device;
    var i: c_int = undefined;
    _ = &i;
    var j: c_int = undefined;
    _ = &j;
    SDL_LockJoysticks_REAL();
    if (!HIDAPI_JoystickInstanceIsUnique(device, joystickID)) {
        device = device.*.parent;
    }
    {
        i = 0;
        while (i < device.*.num_joysticks) : (i += 1) {
            if (device.*.joysticks[@bitCast(@as(isize, @intCast(i)))] == joystickID) {
                var joystick: [*c]SDL_Joystick = SDL_GetJoystickFromID_REAL(joystickID);
                _ = &joystick;
                if (joystick != null) {
                    HIDAPI_JoystickClose(joystick);
                }
                _ = HIDAPI_DelJoystickInstanceFromDevice(device, joystickID);
                {
                    j = 0;
                    while (j < device.*.num_children) : (j += 1) {
                        var child: [*c]SDL_HIDAPI_Device = device.*.children[@bitCast(@as(isize, @intCast(j)))];
                        _ = &child;
                        _ = HIDAPI_DelJoystickInstanceFromDevice(child, joystickID);
                    }
                }
                SDL_HIDAPI_numjoysticks -= 1;
                if (!shutting_down) {
                    SDL_PrivateJoystickRemoved(joystickID);
                }
            }
        }
    }
    SDL_HIDAPI_change_count = 0;
    SDL_UnlockJoysticks_REAL();
}
pub fn HIDAPI_UpdateJoystickProperties(device: [*c]SDL_HIDAPI_Device, joystick: [*c]SDL_Joystick) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var props: SDL_PropertiesID = SDL_GetJoystickProperties_REAL(joystick);
    _ = &props;
    var caps: Uint32 = device.*.driver.*.GetJoystickCapabilities.?(device, joystick);
    _ = &caps;
    if ((caps & @as(Uint32, SDL_JOYSTICK_CAP_MONO_LED)) != 0) {
        _ = SDL_SetBooleanProperty_REAL(props, "SDL.joystick.cap.mono_led", @"true" != 0);
    } else {
        _ = SDL_SetBooleanProperty_REAL(props, "SDL.joystick.cap.mono_led", @"false" != 0);
    }
    if ((caps & @as(Uint32, SDL_JOYSTICK_CAP_RGB_LED)) != 0) {
        _ = SDL_SetBooleanProperty_REAL(props, "SDL.joystick.cap.rgb_led", @"true" != 0);
    } else {
        _ = SDL_SetBooleanProperty_REAL(props, "SDL.joystick.cap.rgb_led", @"false" != 0);
    }
    if ((caps & @as(Uint32, SDL_JOYSTICK_CAP_PLAYER_LED)) != 0) {
        _ = SDL_SetBooleanProperty_REAL(props, "SDL.joystick.cap.player_led", @"true" != 0);
    } else {
        _ = SDL_SetBooleanProperty_REAL(props, "SDL.joystick.cap.player_led", @"false" != 0);
    }
    if ((caps & @as(Uint32, SDL_JOYSTICK_CAP_RUMBLE)) != 0) {
        _ = SDL_SetBooleanProperty_REAL(props, "SDL.joystick.cap.rumble", @"true" != 0);
    } else {
        _ = SDL_SetBooleanProperty_REAL(props, "SDL.joystick.cap.rumble", @"false" != 0);
    }
    if ((caps & @as(Uint32, SDL_JOYSTICK_CAP_TRIGGER_RUMBLE)) != 0) {
        _ = SDL_SetBooleanProperty_REAL(props, "SDL.joystick.cap.trigger_rumble", @"true" != 0);
    } else {
        _ = SDL_SetBooleanProperty_REAL(props, "SDL.joystick.cap.trigger_rumble", @"false" != 0);
    }
}
pub export fn HIDAPI_UpdateDeviceProperties(device: [*c]SDL_HIDAPI_Device) void {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    SDL_LockJoysticks_REAL();
    {
        i = 0;
        while (i < device.*.num_joysticks) : (i += 1) {
            var joystick: [*c]SDL_Joystick = SDL_GetJoystickFromID_REAL(device.*.joysticks[@bitCast(@as(isize, @intCast(i)))]);
            _ = &joystick;
            if (joystick != null) {
                HIDAPI_UpdateJoystickProperties(device, joystick);
            }
        }
    }
    SDL_UnlockJoysticks_REAL();
}
pub fn HIDAPI_JoystickGetCount() callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return SDL_HIDAPI_numjoysticks;
}
pub fn HIDAPI_AddDevice(info: [*c]const struct_SDL_hid_device_info, num_children: c_int, children: [*c][*c]SDL_HIDAPI_Device) callconv(.c) [*c]SDL_HIDAPI_Device {
    @setEvalBranchQuota(100000);
    var device: [*c]SDL_HIDAPI_Device = undefined;
    _ = &device;
    var curr: [*c]SDL_HIDAPI_Device = undefined;
    _ = &curr;
    var last: [*c]SDL_HIDAPI_Device = null;
    _ = &last;
    var removed: bool = undefined;
    _ = &removed;
    var bus: Uint16 = undefined;
    _ = &bus;
    SDL_AssertJoysticksLocked();
    {
        curr = SDL_HIDAPI_devices;
        last = null;
        while (curr != null) : ({
            last = curr;
            curr = curr.*.next;
        }) {}
    }
    var path: [*c]u8 = SDL_strdup_REAL(info.*.path);
    _ = &path;
    if (!(path != null)) {
        _ = SDL_OutOfMemory_REAL();
        return null;
    }
    device = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(device.*)))));
    if (!(device != null)) {
        SDL_free_REAL(@ptrCast(@alignCast(path)));
        return null;
    }
    SDL_SetObjectValid(@ptrCast(@alignCast(device)), SDL_OBJECT_TYPE_HIDAPI_JOYSTICK, @"true" != 0);
    device.*.path = path;
    device.*.seen = @"true" != 0;
    device.*.vendor_id = info.*.vendor_id;
    device.*.product_id = info.*.product_id;
    device.*.version = info.*.release_number;
    device.*.interface_number = info.*.interface_number;
    device.*.interface_class = info.*.interface_class;
    device.*.interface_subclass = info.*.interface_subclass;
    device.*.interface_protocol = info.*.interface_protocol;
    device.*.usage_page = info.*.usage_page;
    device.*.usage = info.*.usage;
    device.*.is_bluetooth = info.*.bus_type == @as(SDL_hid_bus_type, SDL_HID_API_BUS_BLUETOOTH);
    {
        var serial_number: [*c]u8 = HIDAPI_ConvertString(info.*.serial_number);
        _ = &serial_number;
        device.*.manufacturer_string = HIDAPI_ConvertString(info.*.manufacturer_string);
        device.*.product_string = HIDAPI_ConvertString(info.*.product_string);
        device.*.name = SDL_CreateJoystickName(device.*.vendor_id, device.*.product_id, device.*.manufacturer_string, device.*.product_string);
        if ((serial_number != null) and (@as(c_int, serial_number.*) != 0)) {
            device.*.serial = serial_number;
        } else {
            SDL_free_REAL(@ptrCast(@alignCast(serial_number)));
        }
        if (!(device.*.name != null)) {
            SDL_SetObjectValid(@ptrCast(@alignCast(device)), SDL_OBJECT_TYPE_HIDAPI_JOYSTICK, @"false" != 0);
            SDL_free_REAL(@ptrCast(@alignCast(device.*.manufacturer_string)));
            SDL_free_REAL(@ptrCast(@alignCast(device.*.product_string)));
            SDL_free_REAL(@ptrCast(@alignCast(device.*.serial)));
            SDL_free_REAL(@ptrCast(@alignCast(device.*.path)));
            SDL_free_REAL(@ptrCast(@alignCast(device)));
            return null;
        }
    }
    if (info.*.bus_type == @as(SDL_hid_bus_type, SDL_HID_API_BUS_BLUETOOTH)) {
        bus = SDL_HARDWARE_BUS_BLUETOOTH;
    } else {
        bus = SDL_HARDWARE_BUS_USB;
    }
    device.*.guid = SDL_CreateJoystickGUID(bus, device.*.vendor_id, device.*.product_id, device.*.version, device.*.manufacturer_string, device.*.product_string, 'h', 0);
    device.*.joystick_type = SDL_JOYSTICK_TYPE_GAMEPAD;
    device.*.type = SDL_GetJoystickGameControllerProtocol(device.*.name, device.*.vendor_id, device.*.product_id, device.*.interface_number, device.*.interface_class, device.*.interface_subclass, device.*.interface_protocol);
    device.*.steam_virtual_gamepad_slot = -@as(c_int, 1);
    if (num_children > @as(c_int, 0)) {
        var i: c_int = undefined;
        _ = &i;
        device.*.num_children = num_children;
        device.*.children = children;
        {
            i = 0;
            while (i < num_children) : (i += 1) {
                children[@bitCast(@as(isize, @intCast(i)))].*.parent = device;
            }
        }
    }
    if (last != null) {
        last.*.next = device;
    } else {
        SDL_HIDAPI_devices = device;
    }
    removed = @"false" != 0;
    HIDAPI_SetupDeviceDriver(device, &removed);
    if (removed) {
        return null;
    }
    SDL_LogDebug_REAL(SDL_LOG_CATEGORY_INPUT, "Added HIDAPI device '%s' VID 0x%.4x, PID 0x%.4x, bluetooth %d, version %d, serial %s, interface %d, interface_class %d, interface_subclass %d, interface_protocol %d, usage page 0x%.4x, usage 0x%.4x, path = %s, driver = %s (%s)", device.*.name, device.*.vendor_id, device.*.product_id, device.*.is_bluetooth, device.*.version, if (device.*.serial != null) device.*.serial else @as([*c]u8, @as([*c]u8, @constCast("NONE"))), device.*.interface_number, device.*.interface_class, device.*.interface_subclass, device.*.interface_protocol, device.*.usage_page, device.*.usage, device.*.path, if (device.*.driver != null) device.*.driver.*.name else @as([*c]const u8, @ptrCast(@alignCast(@as([*c]u8, @as([*c]u8, @constCast("NONE")))))), if ((device.*.driver != null) and device.*.driver.*.enabled) @as([*c]u8, @as([*c]u8, @constCast("ENABLED"))) else @as([*c]u8, @as([*c]u8, @constCast("DISABLED"))));
    return device;
}
pub fn HIDAPI_DelDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var curr: [*c]SDL_HIDAPI_Device = undefined;
    _ = &curr;
    var last: [*c]SDL_HIDAPI_Device = undefined;
    _ = &last;
    var i: c_int = undefined;
    _ = &i;
    SDL_AssertJoysticksLocked();
    SDL_LogDebug_REAL(SDL_LOG_CATEGORY_INPUT, "Removing HIDAPI device '%s' VID 0x%.4x, PID 0x%.4x, bluetooth %d, version %d, serial %s, interface %d, interface_class %d, interface_subclass %d, interface_protocol %d, usage page 0x%.4x, usage 0x%.4x, path = %s, driver = %s (%s)", device.*.name, device.*.vendor_id, device.*.product_id, device.*.is_bluetooth, device.*.version, if (device.*.serial != null) device.*.serial else @as([*c]u8, @as([*c]u8, @constCast("NONE"))), device.*.interface_number, device.*.interface_class, device.*.interface_subclass, device.*.interface_protocol, device.*.usage_page, device.*.usage, device.*.path, if (device.*.driver != null) device.*.driver.*.name else @as([*c]const u8, @ptrCast(@alignCast(@as([*c]u8, @as([*c]u8, @constCast("NONE")))))), if ((device.*.driver != null) and device.*.driver.*.enabled) @as([*c]u8, @as([*c]u8, @constCast("ENABLED"))) else @as([*c]u8, @as([*c]u8, @constCast("DISABLED"))));
    {
        curr = SDL_HIDAPI_devices;
        last = null;
        while (curr != null) : ({
            last = curr;
            curr = curr.*.next;
        }) {
            if (curr == device) {
                if (last != null) {
                    last.*.next = curr.*.next;
                } else {
                    SDL_HIDAPI_devices = curr.*.next;
                }
                HIDAPI_CleanupDeviceDriver(device);
                while (SDL_GetAtomicInt_REAL(&device.*.rumble_pending) > @as(c_int, 0)) {
                    SDL_Delay_REAL(10);
                }
                {
                    i = 0;
                    while (i < device.*.num_children) : (i += 1) {
                        device.*.children[@bitCast(@as(isize, @intCast(i)))].*.parent = null;
                    }
                }
                SDL_SetObjectValid(@ptrCast(@alignCast(device)), SDL_OBJECT_TYPE_HIDAPI_JOYSTICK, @"false" != 0);
                SDL_free_REAL(@ptrCast(@alignCast(device.*.manufacturer_string)));
                SDL_free_REAL(@ptrCast(@alignCast(device.*.product_string)));
                SDL_free_REAL(@ptrCast(@alignCast(device.*.serial)));
                SDL_free_REAL(@ptrCast(@alignCast(device.*.name)));
                SDL_free_REAL(@ptrCast(@alignCast(device.*.path)));
                SDL_free_REAL(@ptrCast(@alignCast(device.*.children)));
                SDL_free_REAL(@ptrCast(@alignCast(device)));
                return;
            }
        }
    }
}
pub fn HIDAPI_CreateCombinedJoyCons() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var device: [*c]SDL_HIDAPI_Device = undefined;
    _ = &device;
    var combined: [*c]SDL_HIDAPI_Device = undefined;
    _ = &combined;
    var joycons: [2][*c]SDL_HIDAPI_Device = [2][*c]SDL_HIDAPI_Device{
        null,
        null,
    };
    _ = &joycons;
    SDL_AssertJoysticksLocked();
    if (!SDL_HIDAPI_combine_joycons) {
        return @"false" != 0;
    }
    {
        device = SDL_HIDAPI_devices;
        while (device != null) : (device = device.*.next) {
            var vendor: Uint16 = undefined;
            _ = &vendor;
            var product: Uint16 = undefined;
            _ = &product;
            if (!(device.*.driver != null)) {
                continue;
            }
            if (device.*.parent != null) {
                continue;
            }
            if (device.*.broken) {
                continue;
            }
            SDL_GetJoystickGUIDInfo_REAL(device.*.guid, &vendor, &product, null, null);
            if (!(joycons[@as(c_int, 0)] != null) and (SDL_IsJoystickNintendoSwitchJoyConLeft(vendor, product) or (SDL_IsJoystickNintendoSwitchJoyConGrip(vendor, product) and (@as(?*anyopaque, @ptrCast(@alignCast(SDL_strstr_REAL(device.*.name, "(L)")))) != @as(?*anyopaque, null))))) {
                joycons[@as(c_int, 0)] = device;
            }
            if (!(joycons[@as(c_int, 1)] != null) and (SDL_IsJoystickNintendoSwitchJoyConRight(vendor, product) or (SDL_IsJoystickNintendoSwitchJoyConGrip(vendor, product) and (@as(?*anyopaque, @ptrCast(@alignCast(SDL_strstr_REAL(device.*.name, "(R)")))) != @as(?*anyopaque, null))))) {
                joycons[@as(c_int, 1)] = device;
            }
            if ((joycons[@as(c_int, 0)] != null) and (joycons[@as(c_int, 1)] != null)) {
                var info: SDL_hid_device_info = undefined;
                _ = &info;
                var children: [*c][*c]SDL_HIDAPI_Device = @ptrCast(@alignCast(SDL_malloc_REAL(@as(c_ulong, 2) *% @sizeOf([*c]SDL_HIDAPI_Device))));
                _ = &children;
                if (!(children != null)) {
                    return @"false" != 0;
                }
                children[@as(c_int, 0)] = joycons[@as(c_int, 0)];
                children[@as(c_int, 1)] = joycons[@as(c_int, 1)];
                _ = memset(@ptrCast(@alignCast(&info)), 0, @sizeOf(@TypeOf(info)));
                info.path = @as([*c]u8, @as([*c]u8, @constCast("nintendo_joycons_combined")));
                info.vendor_id = USB_VENDOR_NINTENDO;
                if (@as(c_int, joycons[@as(c_int, 0)].*.product_id) == USB_PRODUCT_NINTENDO_SWITCH_JOYCON_LEFT) {
                    info.product_id = USB_PRODUCT_NINTENDO_SWITCH_JOYCON_PAIR;
                } else {
                    info.product_id = USB_PRODUCT_NINTENDO_SWITCH2_JOYCON_PAIR;
                }
                info.interface_number = -@as(c_int, 1);
                info.usage_page = USB_USAGEPAGE_GENERIC_DESKTOP;
                info.usage = USB_USAGE_GENERIC_GAMEPAD;
                const wide_string_19 = [8:0]c_int{
                    '\u{4e}',
                    '\u{69}',
                    '\u{6e}',
                    '\u{74}',
                    '\u{65}',
                    '\u{6e}',
                    '\u{64}',
                    '\u{6f}',
                };
                info.manufacturer_string = @constCast(&wide_string_19);
                const wide_string_20 = [20:0]c_int{
                    '\u{53}',
                    '\u{77}',
                    '\u{69}',
                    '\u{74}',
                    '\u{63}',
                    '\u{68}',
                    '\u{20}',
                    '\u{4a}',
                    '\u{6f}',
                    '\u{79}',
                    '\u{2d}',
                    '\u{43}',
                    '\u{6f}',
                    '\u{6e}',
                    '\u{20}',
                    '\u{28}',
                    '\u{4c}',
                    '\u{2f}',
                    '\u{52}',
                    '\u{29}',
                };
                info.product_string = @constCast(&wide_string_20);
                if (children[@as(c_int, 0)].*.is_bluetooth or children[@as(c_int, 1)].*.is_bluetooth) {
                    info.bus_type = SDL_HID_API_BUS_BLUETOOTH;
                } else {
                    info.bus_type = SDL_HID_API_BUS_USB;
                }
                combined = HIDAPI_AddDevice(&info, 2, children);
                if ((combined != null) and (combined.*.driver != null)) {
                    return @"true" != 0;
                } else {
                    if (combined != null) {
                        HIDAPI_DelDevice(combined);
                    } else {
                        SDL_free_REAL(@ptrCast(@alignCast(children)));
                    }
                    return @"false" != 0;
                }
            }
        }
    }
    return @"false" != 0;
}
pub fn HIDAPI_UpdateDeviceList() callconv(.c) void {
    @setEvalBranchQuota(100000);
    var device: [*c]SDL_HIDAPI_Device = undefined;
    _ = &device;
    var devs: [*c]struct_SDL_hid_device_info = undefined;
    _ = &devs;
    var info: [*c]struct_SDL_hid_device_info = undefined;
    _ = &info;
    var next: [*c]SDL_HIDAPI_Device = undefined;
    _ = &next;
    var i: c_int = undefined;
    _ = &i;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                SDL_LockJoysticks_REAL();
                if (SDL_HIDAPI_hints_changed) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                device = SDL_HIDAPI_devices;
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            2 => {
                SDL_HIDAPI_UpdateDrivers();
                SDL_HIDAPI_hints_changed = @"false" != 0;
                {
                    sdl_pc = 4;
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
                device = SDL_HIDAPI_devices;
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            5 => {
                if (device != null) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            6 => {
                if (device.*.children != null) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
            },
            7 => {
                device = device.*.next;
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            8 => {
                if (SDL_HIDAPI_numdrivers > @as(c_int, 0)) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            9 => {
                {
                    sdl_pc = 7;
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
                device.*.seen = @"false" != 0;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            12 => {
                devs = SDL_hid_enumerate_REAL(0, 0);
                if (devs != null) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
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
                    sdl_pc = 1;
                    continue;
                }
            },
            15 => {
                info = devs;
                {
                    sdl_pc = 18;
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
                    sdl_pc = 14;
                    continue;
                }
            },
            18 => {
                if (info != null) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            19 => {
                if (!(info.*.path != null)) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            20 => {
                info = info.*.next;
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            21 => {
                SDL_hid_free_enumeration_REAL(devs);
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            22 => {
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
                device = HIDAPI_GetJoystickByInfo(info.*.path, info.*.vendor_id, info.*.product_id);
                if (device != null) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            25 => {
                device.*.seen = @"true" != 0;
                if (HIDAPI_SerialIsEmpty(device)) {
                    sdl_pc = 28;
                    continue;
                } else {
                    sdl_pc = 29;
                    continue;
                }
            },
            26 => {
                _ = HIDAPI_AddDevice(info, 0, null);
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            27 => {
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            28 => {
                HIDAPI_SetDeviceSerialW(device, info.*.serial_number);
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
                if (device != null) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            32 => {
                next = device.*.next;
                if (!device.*.seen or ((((device.*.driver != null) or (device.*.children != null)) and (device.*.num_joysticks == @as(c_int, 0))) and !(device.*.dev != null))) {
                    sdl_pc = 34;
                    continue;
                } else {
                    sdl_pc = 35;
                    continue;
                }
            },
            33 => {
                {
                    sdl_pc = 47;
                    continue;
                }
            },
            34 => {
                if (device.*.parent != null) {
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
                if (((device != null) and device.*.broken) and (device.*.parent != null)) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            37 => {
                device = device.*.parent;
                i = 0;
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            38 => {
                HIDAPI_DelDevice(device);
                device = null;
                SDL_HIDAPI_change_count = 0;
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            39 => {
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            40 => {
                if (i < device.*.num_children) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 43;
                    continue;
                }
            },
            41 => {
                HIDAPI_DelDevice(device.*.children[@bitCast(@as(isize, @intCast(i)))]);
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            42 => {
                i += 1;
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            43 => {
                HIDAPI_DelDevice(device);
                SDL_HIDAPI_change_count = 0;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            44 => {
                HIDAPI_DelDevice(device.*.parent);
                {
                    sdl_pc = 1;
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
                device = next;
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            47 => {
                if (HIDAPI_CreateCombinedJoyCons()) {
                    sdl_pc = 48;
                    continue;
                } else {
                    sdl_pc = 49;
                    continue;
                }
            },
            48 => {
                {
                    sdl_pc = 47;
                    continue;
                }
            },
            49 => {
                SDL_UnlockJoysticks_REAL();
                {}
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_IsEquivalentToDevice(vendor_id: Uint16, product_id: Uint16, device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if ((@as(c_int, vendor_id) == @as(c_int, device.*.vendor_id)) and (@as(c_int, product_id) == @as(c_int, device.*.product_id))) {
        return @"true" != 0;
    }
    if (@as(c_int, vendor_id) == USB_VENDOR_MICROSOFT) {
        if ((@as(c_int, product_id) == USB_PRODUCT_XBOX360_XUSB_CONTROLLER) and (@as(c_int, device.*.product_id) == USB_PRODUCT_XBOX360_WIRELESS_RECEIVER)) {
            return @"true" != 0;
        }
        if ((@as(c_int, product_id) == USB_PRODUCT_XBOX_ONE_XBOXGIP_CONTROLLER) and (device.*.type == @as(SDL_GamepadType, SDL_GAMEPAD_TYPE_XBOXONE))) {
            return @"true" != 0;
        }
        if (@as(c_int, product_id) == USB_PRODUCT_XBOX360_XUSB_CONTROLLER) {
            if ((device.*.type == @as(SDL_GamepadType, SDL_GAMEPAD_TYPE_XBOX360)) or (device.*.type == @as(SDL_GamepadType, SDL_GAMEPAD_TYPE_XBOXONE))) {
                return @"true" != 0;
            }
        }
    }
    if (@as(c_int, vendor_id) == USB_VENDOR_NVIDIA) {
        if ((@as(c_int, product_id) == @as(c_int, 46080)) and SDL_IsJoystickNVIDIASHIELDController(vendor_id, product_id)) {
            return @"true" != 0;
        }
    }
    return @"false" != 0;
}
pub fn HIDAPI_StartUpdatingDevices() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_CompareAndSwapAtomicInt_REAL(&SDL_HIDAPI_updating_devices, @"false", @"true");
}
pub fn HIDAPI_FinishUpdatingDevices() callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = SDL_SetAtomicInt_REAL(&SDL_HIDAPI_updating_devices, @"false");
}
pub export fn HIDAPI_IsDeviceTypePresent(arg_type: SDL_GamepadType) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var device: [*c]SDL_HIDAPI_Device = undefined;
    _ = &device;
    var result: bool = @"false" != 0;
    _ = &result;
    if (!HIDAPI_JoystickInit()) {
        return @"false" != 0;
    }
    if (HIDAPI_StartUpdatingDevices()) {
        HIDAPI_UpdateDeviceList();
        HIDAPI_FinishUpdatingDevices();
    }
    SDL_LockJoysticks_REAL();
    {
        device = SDL_HIDAPI_devices;
        while (device != null) : (device = device.*.next) {
            if ((device.*.driver != null) and (device.*.type == @"type")) {
                result = @"true" != 0;
                break;
            }
        }
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn HIDAPI_IsDevicePresent(vendor_id: Uint16, product_id: Uint16, version: Uint16, name: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    var device: [*c]SDL_HIDAPI_Device = undefined;
    _ = &device;
    var supported: bool = @"false" != 0;
    _ = &supported;
    var result: bool = @"false" != 0;
    _ = &result;
    if (!HIDAPI_JoystickInit()) {
        return @"false" != 0;
    }
    supported = HIDAPI_IsDeviceSupported(vendor_id, product_id, version, name);
    if (!supported and (((SDL_strstr_REAL(name, "Xbox") != null) or (SDL_strstr_REAL(name, "X-Box") != null)) or (SDL_strstr_REAL(name, "XBOX") != null))) {
        supported = @"true" != 0;
    }
    if (supported) {
        if (HIDAPI_StartUpdatingDevices()) {
            HIDAPI_UpdateDeviceList();
            HIDAPI_FinishUpdatingDevices();
        }
    }
    SDL_LockJoysticks_REAL();
    {
        device = SDL_HIDAPI_devices;
        while (device != null) : (device = device.*.next) {
            if ((@as(c_int, device.*.vendor_id) == USB_VENDOR_FLYDIGI_V2) and (device.*.driver == (&SDL_HIDAPI_DriverFlydigi))) {
                continue;
            }
            if ((device.*.driver != null) and HIDAPI_IsEquivalentToDevice(vendor_id, product_id, device)) {
                result = @"true" != 0;
                break;
            }
        }
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn HIDAPI_GetDeviceProductName(vendor_id: Uint16, product_id: Uint16) [*c]u8 {
    @setEvalBranchQuota(100000);
    var device: [*c]SDL_HIDAPI_Device = undefined;
    _ = &device;
    var name: [*c]u8 = null;
    _ = &name;
    SDL_LockJoysticks_REAL();
    {
        device = SDL_HIDAPI_devices;
        while (device != null) : (device = device.*.next) {
            if ((@as(c_int, vendor_id) == @as(c_int, device.*.vendor_id)) and (@as(c_int, product_id) == @as(c_int, device.*.product_id))) {
                if (device.*.product_string != null) {
                    name = SDL_strdup_REAL(device.*.product_string);
                }
                break;
            }
        }
    }
    SDL_UnlockJoysticks_REAL();
    return name;
}
pub export fn HIDAPI_GetDeviceManufacturerName(vendor_id: Uint16, product_id: Uint16) [*c]u8 {
    @setEvalBranchQuota(100000);
    var device: [*c]SDL_HIDAPI_Device = undefined;
    _ = &device;
    var name: [*c]u8 = null;
    _ = &name;
    SDL_LockJoysticks_REAL();
    {
        device = SDL_HIDAPI_devices;
        while (device != null) : (device = device.*.next) {
            if ((@as(c_int, vendor_id) == @as(c_int, device.*.vendor_id)) and (@as(c_int, product_id) == @as(c_int, device.*.product_id))) {
                if (device.*.manufacturer_string != null) {
                    name = SDL_strdup_REAL(device.*.manufacturer_string);
                }
                break;
            }
        }
    }
    SDL_UnlockJoysticks_REAL();
    return name;
}
pub export fn HIDAPI_GetJoystickTypeFromGUID(arg_guid: SDL_GUID) SDL_JoystickType {
    @setEvalBranchQuota(100000);
    var guid = arg_guid;
    _ = &guid;
    var device: [*c]SDL_HIDAPI_Device = undefined;
    _ = &device;
    var @"type": SDL_JoystickType = SDL_JOYSTICK_TYPE_UNKNOWN;
    _ = &@"type";
    SDL_LockJoysticks_REAL();
    {
        device = SDL_HIDAPI_devices;
        while (device != null) : (device = device.*.next) {
            if (SDL_memcmp_REAL(@ptrCast(@alignCast(&guid)), @ptrCast(@alignCast(&device.*.guid)), @sizeOf(@TypeOf(guid))) == @as(c_int, 0)) {
                @"type" = device.*.joystick_type;
                break;
            }
        }
    }
    SDL_UnlockJoysticks_REAL();
    return @"type";
}
pub export fn HIDAPI_GetGamepadTypeFromGUID(arg_guid: SDL_GUID) SDL_GamepadType {
    @setEvalBranchQuota(100000);
    var guid = arg_guid;
    _ = &guid;
    var device: [*c]SDL_HIDAPI_Device = undefined;
    _ = &device;
    var @"type": SDL_GamepadType = SDL_GAMEPAD_TYPE_STANDARD;
    _ = &@"type";
    SDL_LockJoysticks_REAL();
    {
        device = SDL_HIDAPI_devices;
        while (device != null) : (device = device.*.next) {
            if (SDL_memcmp_REAL(@ptrCast(@alignCast(&guid)), @ptrCast(@alignCast(&device.*.guid)), @sizeOf(@TypeOf(guid))) == @as(c_int, 0)) {
                @"type" = device.*.type;
                break;
            }
        }
    }
    SDL_UnlockJoysticks_REAL();
    return @"type";
}
pub fn HIDAPI_JoystickDetect() callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (HIDAPI_StartUpdatingDevices()) {
        var count: Uint32 = SDL_hid_device_change_count_REAL();
        _ = &count;
        if (SDL_HIDAPI_change_count != count) {
            SDL_HIDAPI_change_count = count;
            HIDAPI_UpdateDeviceList();
        }
        HIDAPI_FinishUpdatingDevices();
    }
}
pub export fn HIDAPI_UpdateDevices() void {
    @setEvalBranchQuota(100000);
    var device: [*c]SDL_HIDAPI_Device = undefined;
    _ = &device;
    SDL_AssertJoysticksLocked();
    if (HIDAPI_StartUpdatingDevices()) {
        {
            device = SDL_HIDAPI_devices;
            while (device != null) : (device = device.*.next) {
                if (device.*.parent != null) {
                    continue;
                }
                if (device.*.driver != null) {
                    _ = device.*.driver.*.UpdateDevice.?(device);
                }
            }
        }
        HIDAPI_FinishUpdatingDevices();
    }
}
pub fn HIDAPI_JoystickGetDeviceName(device_index: c_int) callconv(.c) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var device: [*c]SDL_HIDAPI_Device = undefined;
    _ = &device;
    var name: [*c]const u8 = null;
    _ = &name;
    device = HIDAPI_GetDeviceByIndex(device_index, null);
    if (device != null) {
        name = device.*.name;
    }
    return name;
}
pub fn HIDAPI_JoystickGetDevicePath(device_index: c_int) callconv(.c) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var device: [*c]SDL_HIDAPI_Device = undefined;
    _ = &device;
    var path: [*c]const u8 = null;
    _ = &path;
    device = HIDAPI_GetDeviceByIndex(device_index, null);
    if (device != null) {
        path = device.*.path;
    }
    return path;
}
pub fn HIDAPI_JoystickGetDeviceSteamVirtualGamepadSlot(device_index: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var device: [*c]SDL_HIDAPI_Device = undefined;
    _ = &device;
    device = HIDAPI_GetDeviceByIndex(device_index, null);
    if (device != null) {
        return device.*.steam_virtual_gamepad_slot;
    }
    return -@as(c_int, 1);
}
pub fn HIDAPI_JoystickGetDevicePlayerIndex(device_index: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var device: [*c]SDL_HIDAPI_Device = undefined;
    _ = &device;
    var instance_id: SDL_JoystickID = undefined;
    _ = &instance_id;
    var player_index: c_int = -@as(c_int, 1);
    _ = &player_index;
    device = HIDAPI_GetDeviceByIndex(device_index, &instance_id);
    if (device != null) {
        player_index = device.*.driver.*.GetDevicePlayerIndex.?(device, instance_id);
    }
    return player_index;
}
pub fn HIDAPI_JoystickSetDevicePlayerIndex(device_index: c_int, player_index: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var device: [*c]SDL_HIDAPI_Device = undefined;
    _ = &device;
    var instance_id: SDL_JoystickID = undefined;
    _ = &instance_id;
    device = HIDAPI_GetDeviceByIndex(device_index, &instance_id);
    if (device != null) {
        device.*.driver.*.SetDevicePlayerIndex.?(device, instance_id, player_index);
    }
}
pub fn HIDAPI_JoystickGetDeviceGUID(device_index: c_int) callconv(.c) SDL_GUID {
    @setEvalBranchQuota(100000);
    var device: [*c]SDL_HIDAPI_Device = undefined;
    _ = &device;
    var guid: SDL_GUID = undefined;
    _ = &guid;
    device = HIDAPI_GetDeviceByIndex(device_index, null);
    if (device != null) {
        _ = memcpy(@ptrCast(@alignCast(&guid)), @ptrCast(@alignCast(&device.*.guid)), @sizeOf(@TypeOf(guid)));
    } else {
        _ = memset(@ptrCast(@alignCast(&guid)), 0, @sizeOf(@TypeOf(guid)));
    }
    return guid;
}
pub fn HIDAPI_JoystickGetDeviceInstanceID(device_index: c_int) callconv(.c) SDL_JoystickID {
    @setEvalBranchQuota(100000);
    var joystickID: SDL_JoystickID = 0;
    _ = &joystickID;
    _ = HIDAPI_GetDeviceByIndex(device_index, &joystickID);
    return joystickID;
}
pub fn HIDAPI_JoystickOpen(joystick: [*c]SDL_Joystick, device_index: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var joystickID: SDL_JoystickID = 0;
    _ = &joystickID;
    var device: [*c]SDL_HIDAPI_Device = HIDAPI_GetDeviceByIndex(device_index, &joystickID);
    _ = &device;
    var hwdata: [*c]struct_joystick_hwdata = undefined;
    _ = &hwdata;
    SDL_AssertJoysticksLocked();
    if ((!(device != null) or !(device.*.driver != null)) or device.*.broken) {
        return SDL_SetError_REAL("Couldn't find HIDAPI device at index %d", device_index);
    }
    hwdata = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(hwdata.*)))));
    if (!(hwdata != null)) {
        return @"false" != 0;
    }
    hwdata.*.device = device;
    _ = device.*.driver.*.UpdateDevice.?(device);
    if (device.*.num_joysticks == @as(c_int, 0)) {
        SDL_free_REAL(@ptrCast(@alignCast(hwdata)));
        return SDL_SetError_REAL("HIDAPI device disconnected while opening");
    }
    if (device.*.is_bluetooth) {
        joystick.*.connection_state = SDL_JOYSTICK_CONNECTION_WIRELESS;
    } else {
        joystick.*.connection_state = SDL_JOYSTICK_CONNECTION_WIRED;
    }
    if (!device.*.driver.*.OpenJoystick.?(device, joystick)) {
        HIDAPI_JoystickDisconnected(device, joystickID);
        SDL_free_REAL(@ptrCast(@alignCast(hwdata)));
        return @"false" != 0;
    }
    HIDAPI_UpdateJoystickProperties(device, joystick);
    if (device.*.serial != null) {
        joystick.*.serial = SDL_strdup_REAL(device.*.serial);
    }
    joystick.*.hwdata = hwdata;
    return @"true" != 0;
}
pub fn HIDAPI_GetJoystickDevice(joystick: [*c]SDL_Joystick, device: [*c][*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    SDL_AssertJoysticksLocked();
    if ((joystick != null) and (joystick.*.hwdata != null)) {
        device.* = joystick.*.hwdata.*.device;
        if (SDL_ObjectValid(@ptrCast(@alignCast(device.*)), SDL_OBJECT_TYPE_HIDAPI_JOYSTICK) and (@as(?*anyopaque, @ptrCast(@alignCast(device.*.*.driver))) != @as(?*anyopaque, null))) {
            return @"true" != 0;
        }
    }
    return @"false" != 0;
}
pub fn HIDAPI_JoystickRumble(joystick: [*c]SDL_Joystick, low_frequency_rumble: Uint16, high_frequency_rumble: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var result: bool = undefined;
    _ = &result;
    var device: [*c]SDL_HIDAPI_Device = null;
    _ = &device;
    if (HIDAPI_GetJoystickDevice(joystick, &device)) {
        result = device.*.driver.*.RumbleJoystick.?(device, joystick, low_frequency_rumble, high_frequency_rumble);
    } else {
        result = SDL_SetError_REAL("Rumble failed, device disconnected");
    }
    return result;
}
pub fn HIDAPI_JoystickRumbleTriggers(joystick: [*c]SDL_Joystick, left_rumble: Uint16, right_rumble: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var result: bool = undefined;
    _ = &result;
    var device: [*c]SDL_HIDAPI_Device = null;
    _ = &device;
    if (HIDAPI_GetJoystickDevice(joystick, &device)) {
        result = device.*.driver.*.RumbleJoystickTriggers.?(device, joystick, left_rumble, right_rumble);
    } else {
        result = SDL_SetError_REAL("Rumble failed, device disconnected");
    }
    return result;
}
pub fn HIDAPI_JoystickSetLED(joystick: [*c]SDL_Joystick, red: Uint8, green: Uint8, blue: Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var result: bool = undefined;
    _ = &result;
    var device: [*c]SDL_HIDAPI_Device = null;
    _ = &device;
    if (HIDAPI_GetJoystickDevice(joystick, &device)) {
        result = device.*.driver.*.SetJoystickLED.?(device, joystick, red, green, blue);
    } else {
        result = SDL_SetError_REAL("SetLED failed, device disconnected");
    }
    return result;
}
pub fn HIDAPI_JoystickSendEffect(joystick: [*c]SDL_Joystick, data: ?*const anyopaque, size: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var result: bool = undefined;
    _ = &result;
    var device: [*c]SDL_HIDAPI_Device = null;
    _ = &device;
    if (HIDAPI_GetJoystickDevice(joystick, &device)) {
        result = device.*.driver.*.SendJoystickEffect.?(device, joystick, data, size);
    } else {
        result = SDL_SetError_REAL("SendEffect failed, device disconnected");
    }
    return result;
}
pub fn HIDAPI_JoystickSetSensorsEnabled(joystick: [*c]SDL_Joystick, enabled: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var result: bool = undefined;
    _ = &result;
    var device: [*c]SDL_HIDAPI_Device = null;
    _ = &device;
    if (HIDAPI_GetJoystickDevice(joystick, &device)) {
        result = device.*.driver.*.SetJoystickSensorsEnabled.?(device, joystick, enabled);
    } else {
        result = SDL_SetError_REAL("SetSensorsEnabled failed, device disconnected");
    }
    return result;
}
pub fn HIDAPI_JoystickUpdate(_: [*c]SDL_Joystick) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn HIDAPI_JoystickClose(joystick: [*c]SDL_Joystick) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_AssertJoysticksLocked();
    if (joystick.*.hwdata != null) {
        var device: [*c]SDL_HIDAPI_Device = joystick.*.hwdata.*.device;
        _ = &device;
        {
            var i: c_int = 0;
            _ = &i;
            while (i < @as(c_int, 3)) : (i += 1) {
                if (SDL_GetAtomicInt_REAL(&device.*.rumble_pending) > @as(c_int, 0)) {
                    SDL_Delay_REAL(10);
                }
            }
        }
        device.*.driver.*.CloseJoystick.?(device, joystick);
        SDL_free_REAL(@ptrCast(@alignCast(joystick.*.hwdata)));
        joystick.*.hwdata = null;
    }
}
pub fn HIDAPI_JoystickQuit() callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [19:0]u8 = "HIDAPI_JoystickQuit".*;
    };
    _ = &static_local___func__;
    var i: c_int = undefined;
    _ = &i;
    SDL_AssertJoysticksLocked();
    shutting_down = @"true" != 0;
    SDL_HIDAPI_QuitRumble();
    while (SDL_HIDAPI_devices != null) {
        var device: [*c]SDL_HIDAPI_Device = SDL_HIDAPI_devices;
        _ = &device;
        if (device.*.parent != null) {
            device = device.*.parent;
            {
                i = 0;
                while (i < device.*.num_children) : (i += 1) {
                    HIDAPI_DelDevice(device.*.children[@bitCast(@as(isize, @intCast(i)))]);
                }
            }
            HIDAPI_DelDevice(device);
        } else {
            HIDAPI_DelDevice(device);
        }
    }
    while (true) {
        while (!(SDL_HIDAPI_numjoysticks == @as(c_int, 0))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "SDL_HIDAPI_numjoysticks == 0",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_hidapijoystick.c", 1739);
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
    {
        i = 0;
        while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(SDL_HIDAPI_drivers)) / @sizeOf(@TypeOf(SDL_HIDAPI_drivers[@as(c_int, 0)])))) : (i += 1) {
            var driver: [*c]SDL_HIDAPI_DeviceDriver = SDL_HIDAPI_drivers[@bitCast(@as(isize, @intCast(i)))];
            _ = &driver;
            driver.*.UnregisterHints.?(SDL_HIDAPIDriverHintChanged, @ptrCast(@alignCast(driver)));
        }
    }
    SDL_RemoveHintCallback_REAL("SDL_JOYSTICK_HIDAPI_COMBINE_JOY_CONS", SDL_HIDAPIDriverHintChanged, null);
    SDL_RemoveHintCallback_REAL("SDL_JOYSTICK_HIDAPI", SDL_HIDAPIDriverHintChanged, null);
    _ = SDL_hid_exit_REAL();
    SDL_HIDAPI_change_count = 0;
    shutting_down = @"false" != 0;
    initialized = @"false" != 0;
}
pub fn HIDAPI_JoystickGetGamepadMapping(_: c_int, _: [*c]SDL_GamepadMapping) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return @"false" != 0;
}
pub export var SDL_HIDAPI_JoystickDriver: SDL_JoystickDriver = SDL_JoystickDriver{
    .Init = HIDAPI_JoystickInit,
    .GetCount = HIDAPI_JoystickGetCount,
    .Detect = HIDAPI_JoystickDetect,
    .IsDevicePresent = HIDAPI_IsDevicePresent,
    .GetDeviceName = HIDAPI_JoystickGetDeviceName,
    .GetDevicePath = HIDAPI_JoystickGetDevicePath,
    .GetDeviceSteamVirtualGamepadSlot = HIDAPI_JoystickGetDeviceSteamVirtualGamepadSlot,
    .GetDevicePlayerIndex = HIDAPI_JoystickGetDevicePlayerIndex,
    .SetDevicePlayerIndex = HIDAPI_JoystickSetDevicePlayerIndex,
    .GetDeviceGUID = HIDAPI_JoystickGetDeviceGUID,
    .GetDeviceInstanceID = HIDAPI_JoystickGetDeviceInstanceID,
    .Open = HIDAPI_JoystickOpen,
    .Rumble = HIDAPI_JoystickRumble,
    .RumbleTriggers = HIDAPI_JoystickRumbleTriggers,
    .SetLED = HIDAPI_JoystickSetLED,
    .SendEffect = HIDAPI_JoystickSendEffect,
    .SetSensorsEnabled = HIDAPI_JoystickSetSensorsEnabled,
    .Update = HIDAPI_JoystickUpdate,
    .Close = HIDAPI_JoystickClose,
    .Quit = HIDAPI_JoystickQuit,
    .GetGamepadMapping = HIDAPI_JoystickGetGamepadMapping,
};

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_HARDWARE_BUS_USB = @as(c_int, 0x03);
pub const SDL_HARDWARE_BUS_BLUETOOTH = @as(c_int, 0x05);
pub const USB_VENDOR_CRKD = @as(c_int, 0x3651);
pub const USB_VENDOR_CORSAIR = @as(c_int, 0x1b1c);
pub const USB_VENDOR_DRAGONRISE = @as(c_int, 0x0079);
pub const USB_VENDOR_FLYDIGI_V1 = @as(c_int, 0x04b4);
pub const USB_VENDOR_FLYDIGI_V2 = @as(c_int, 0x37d7);
pub const USB_VENDOR_HORI = @as(c_int, 0x0f0d);
pub const USB_VENDOR_LOGITECH = @as(c_int, 0x046d);
pub const USB_VENDOR_MADCATZ = @as(c_int, 0x0738);
pub const USB_VENDOR_MAYFLASH = @as(c_int, 0x33df);
pub const USB_VENDOR_MICROSOFT = @as(c_int, 0x045e);
pub const USB_VENDOR_NACON = @as(c_int, 0x146b);
pub const USB_VENDOR_NACON_ALT = @as(c_int, 0x3285);
pub const USB_VENDOR_NINTENDO = @as(c_int, 0x057e);
pub const USB_VENDOR_NVIDIA = @as(c_int, 0x0955);
pub const USB_VENDOR_PDP = @as(c_int, 0x0e6f);
pub const USB_VENDOR_POWERA = @as(c_int, 0x24c6);
pub const USB_VENDOR_POWERA_ALT = @as(c_int, 0x20d6);
pub const USB_VENDOR_QANBA = @as(c_int, 0x2c22);
pub const USB_VENDOR_RAZER = @as(c_int, 0x1532);
pub const USB_VENDOR_RED_OCTANE_GAMES = @as(c_int, 0x3958);
pub const USB_VENDOR_SHANWAN = @as(c_int, 0x2563);
pub const USB_VENDOR_SHANWAN_ALT = @as(c_int, 0x20bc);
pub const USB_VENDOR_THRUSTMASTER = @as(c_int, 0x044f);
pub const USB_VENDOR_VALVE = @as(c_int, 0x28de);
pub const USB_VENDOR_ZEROPLUS = @as(c_int, 0x0c12);
pub const USB_PRODUCT_MADCATZ_SAITEK_SIDE_PANEL_CONTROL_DECK = @as(c_int, 0x2218);
pub const USB_PRODUCT_NINTENDO_SWITCH_JOYCON_LEFT = @as(c_int, 0x2006);
pub const USB_PRODUCT_NINTENDO_SWITCH_JOYCON_PAIR = @as(c_int, 0x2008);
pub const USB_PRODUCT_NINTENDO_SWITCH2_JOYCON_PAIR = @as(c_int, 0x2068);
pub const USB_PRODUCT_XBOX360_XUSB_CONTROLLER = @as(c_int, 0x02a1);
pub const USB_PRODUCT_XBOX360_WIRELESS_RECEIVER = @as(c_int, 0x0719);
pub const USB_PRODUCT_XBOX_ONE_XBOXGIP_CONTROLLER = @as(c_int, 0x02ff);
pub const USB_USAGEPAGE_GENERIC_DESKTOP = @as(c_int, 0x0001);
pub const USB_USAGE_GENERIC_GAMEPAD = @as(c_int, 0x0005);
pub const SDL_JOYSTICK_CAP_MONO_LED = @as(c_int, 0x00000001);
pub const SDL_JOYSTICK_CAP_RGB_LED = @as(c_int, 0x00000002);
pub const SDL_JOYSTICK_CAP_PLAYER_LED = @as(c_int, 0x00000004);
pub const SDL_JOYSTICK_CAP_RUMBLE = @as(c_int, 0x00000010);
pub const SDL_JOYSTICK_CAP_TRIGGER_RUMBLE = @as(c_int, 0x00000020);
