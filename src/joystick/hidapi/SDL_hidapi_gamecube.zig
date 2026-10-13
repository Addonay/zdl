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
pub extern fn exit(__status: c_int) noreturn;
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
pub extern fn SDL_hid_open_path_REAL(path: [*c]const u8) ?*SDL_hid_device;
pub extern fn SDL_hid_write_REAL(dev: ?*SDL_hid_device, data: [*c]const u8, length: usize) c_int;
pub extern fn SDL_hid_read_timeout_REAL(dev: ?*SDL_hid_device, data: [*c]u8, length: usize, milliseconds: c_int) c_int;
pub extern fn SDL_hid_close_REAL(dev: ?*SDL_hid_device) c_int;
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
pub const struct_libusb_device_descriptor = extern struct {
    bLength: u8 = 0,
    bDescriptorType: u8 = 0,
    bcdUSB: u16 = 0,
    bDeviceClass: u8 = 0,
    bDeviceSubClass: u8 = 0,
    bDeviceProtocol: u8 = 0,
    bMaxPacketSize0: u8 = 0,
    idVendor: u16 = 0,
    idProduct: u16 = 0,
    bcdDevice: u16 = 0,
    iManufacturer: u8 = 0,
    iProduct: u8 = 0,
    iSerialNumber: u8 = 0,
    bNumConfigurations: u8 = 0,
};
pub const struct_libusb_endpoint_descriptor = extern struct {
    bLength: u8 = 0,
    bDescriptorType: u8 = 0,
    bEndpointAddress: u8 = 0,
    bmAttributes: u8 = 0,
    wMaxPacketSize: u16 = 0,
    bInterval: u8 = 0,
    bRefresh: u8 = 0,
    bSynchAddress: u8 = 0,
    extra: [*c]const u8 = null,
    extra_length: c_int = 0,
};
pub const struct_libusb_interface_descriptor = extern struct {
    bLength: u8 = 0,
    bDescriptorType: u8 = 0,
    bInterfaceNumber: u8 = 0,
    bAlternateSetting: u8 = 0,
    bNumEndpoints: u8 = 0,
    bInterfaceClass: u8 = 0,
    bInterfaceSubClass: u8 = 0,
    bInterfaceProtocol: u8 = 0,
    iInterface: u8 = 0,
    endpoint: [*c]const struct_libusb_endpoint_descriptor = null,
    extra: [*c]const u8 = null,
    extra_length: c_int = 0,
};
pub const struct_libusb_interface = extern struct {
    altsetting: [*c]const struct_libusb_interface_descriptor = null,
    num_altsetting: c_int = 0,
};
pub const struct_libusb_config_descriptor = extern struct {
    bLength: u8 = 0,
    bDescriptorType: u8 = 0,
    wTotalLength: u16 = 0,
    bNumInterfaces: u8 = 0,
    bConfigurationValue: u8 = 0,
    iConfiguration: u8 = 0,
    bmAttributes: u8 = 0,
    MaxPower: u8 = 0,
    interface: [*c]const struct_libusb_interface = null,
    extra: [*c]const u8 = null,
    extra_length: c_int = 0,
};
pub const struct_libusb_context = opaque {
};
pub const struct_libusb_device = opaque {
};
pub const struct_libusb_device_handle = opaque {
};
pub const libusb_context = struct_libusb_context;
pub const libusb_device = struct_libusb_device;
pub const libusb_device_handle = struct_libusb_device_handle;
pub const enum_libusb_transfer_status = c_uint;
pub const struct_libusb_iso_packet_descriptor = extern struct {
    length: c_uint = 0,
    actual_length: c_uint = 0,
    status: enum_libusb_transfer_status = @import("std").mem.zeroes(enum_libusb_transfer_status),
};
pub const libusb_transfer_cb_fn = ?*const fn (transfer: [*c]struct_libusb_transfer) callconv(.c) void;
pub const struct_libusb_transfer = extern struct {
    dev_handle: ?*libusb_device_handle = null,
    flags: u8 = 0,
    endpoint: u8 = 0,
    type: u8 = 0,
    timeout: c_uint = 0,
    status: enum_libusb_transfer_status = @import("std").mem.zeroes(enum_libusb_transfer_status),
    length: c_int = 0,
    actual_length: c_int = 0,
    callback: libusb_transfer_cb_fn = null,
    user_data: ?*anyopaque = null,
    buffer: [*c]u8 = null,
    num_iso_packets: c_int = 0,
    _iso_packet_desc: [0]struct_libusb_iso_packet_descriptor = @import("std").mem.zeroes([0]struct_libusb_iso_packet_descriptor),
    pub fn iso_packet_desc(_self: anytype) __helpers.FlexibleArrayType(@TypeOf(_self), @typeInfo(@TypeOf(_self.*._iso_packet_desc)).array.child) {
        return @ptrCast(@alignCast(&_self.*._iso_packet_desc));
    }
};
pub const libusb_hotplug_callback_handle = c_int;
pub const libusb_hotplug_event = c_uint;
pub const libusb_hotplug_callback_fn = ?*const fn (ctx: ?*libusb_context, device: ?*libusb_device, event: libusb_hotplug_event, user_data: ?*anyopaque) callconv(.c) c_int;
pub const struct_SDL_LibUSBContext = extern struct {
    init: ?*const fn (ctx: [*c]?*libusb_context) callconv(.c) c_int = null,
    exit: ?*const fn (ctx: ?*libusb_context) callconv(.c) void = null,
    get_device_list: ?*const fn (ctx: ?*libusb_context, list: [*c][*c]?*libusb_device) callconv(.c) isize = null,
    free_device_list: ?*const fn (list: [*c]?*libusb_device, unref_devices: c_int) callconv(.c) void = null,
    get_device_descriptor: ?*const fn (dev: ?*libusb_device, desc: [*c]struct_libusb_device_descriptor) callconv(.c) c_int = null,
    get_active_config_descriptor: ?*const fn (dev: ?*libusb_device, config: [*c][*c]struct_libusb_config_descriptor) callconv(.c) c_int = null,
    get_config_descriptor: ?*const fn (dev: ?*libusb_device, config_index: u8, config: [*c][*c]struct_libusb_config_descriptor) callconv(.c) c_int = null,
    free_config_descriptor: ?*const fn (config: [*c]struct_libusb_config_descriptor) callconv(.c) void = null,
    get_bus_number: ?*const fn (dev: ?*libusb_device) callconv(.c) u8 = null,
    get_port_numbers: ?*const fn (dev: ?*libusb_device, port_numbers: [*c]u8, port_numbers_len: c_int) callconv(.c) c_int = null,
    get_device_address: ?*const fn (dev: ?*libusb_device) callconv(.c) u8 = null,
    open: ?*const fn (dev: ?*libusb_device, dev_handle: [*c]?*libusb_device_handle) callconv(.c) c_int = null,
    close: ?*const fn (dev_handle: ?*libusb_device_handle) callconv(.c) void = null,
    get_device: ?*const fn (dev_handle: ?*libusb_device_handle) callconv(.c) ?*libusb_device = null,
    claim_interface: ?*const fn (dev_handle: ?*libusb_device_handle, interface_number: c_int) callconv(.c) c_int = null,
    release_interface: ?*const fn (dev_handle: ?*libusb_device_handle, interface_number: c_int) callconv(.c) c_int = null,
    kernel_driver_active: ?*const fn (dev_handle: ?*libusb_device_handle, interface_number: c_int) callconv(.c) c_int = null,
    detach_kernel_driver: ?*const fn (dev_handle: ?*libusb_device_handle, interface_number: c_int) callconv(.c) c_int = null,
    attach_kernel_driver: ?*const fn (dev_handle: ?*libusb_device_handle, interface_number: c_int) callconv(.c) c_int = null,
    set_auto_detach_kernel_driver: ?*const fn (dev_handle: ?*libusb_device_handle, enable: c_int) callconv(.c) c_int = null,
    set_interface_alt_setting: ?*const fn (dev: ?*libusb_device_handle, interface_number: c_int, alternate_setting: c_int) callconv(.c) c_int = null,
    alloc_transfer: ?*const fn (iso_packets: c_int) callconv(.c) [*c]struct_libusb_transfer = null,
    submit_transfer: ?*const fn (transfer: [*c]struct_libusb_transfer) callconv(.c) c_int = null,
    cancel_transfer: ?*const fn (transfer: [*c]struct_libusb_transfer) callconv(.c) c_int = null,
    free_transfer: ?*const fn (transfer: [*c]struct_libusb_transfer) callconv(.c) void = null,
    control_transfer: ?*const fn (dev_handle: ?*libusb_device_handle, request_type: u8, bRequest: u8, wValue: u16, wIndex: u16, data: [*c]u8, wLength: u16, timeout: c_uint) callconv(.c) c_int = null,
    interrupt_transfer: ?*const fn (dev_handle: ?*libusb_device_handle, endpoint: u8, data: [*c]u8, length: c_int, actual_length: [*c]c_int, timeout: c_uint) callconv(.c) c_int = null,
    bulk_transfer: ?*const fn (dev_handle: ?*libusb_device_handle, endpoint: u8, data: [*c]u8, length: c_int, transferred: [*c]c_int, timeout: c_uint) callconv(.c) c_int = null,
    handle_events: ?*const fn (ctx: ?*libusb_context) callconv(.c) c_int = null,
    handle_events_completed: ?*const fn (ctx: ?*libusb_context, completed: [*c]c_int) callconv(.c) c_int = null,
    interrupt_event_handler: ?*const fn (ctx: ?*libusb_context) callconv(.c) void = null,
    has_capability: ?*const fn (capability: u32) callconv(.c) c_int = null,
    hotplug_register_callback: ?*const fn (ctx: ?*libusb_context, events: c_int, flags: c_int, vendor_id: c_int, product_id: c_int, dev_class: c_int, cb_fn: libusb_hotplug_callback_fn, user_data: ?*anyopaque, callback_handle: [*c]libusb_hotplug_callback_handle) callconv(.c) c_int = null,
    hotplug_deregister_callback: ?*const fn (ctx: ?*libusb_context, callback_handle: libusb_hotplug_callback_handle) callconv(.c) void = null,
    error_name: ?*const fn (errcode: c_int) callconv(.c) [*c]const u8 = null,
};
pub const SDL_LibUSBContext = struct_SDL_LibUSBContext;
pub extern fn SDL_InitLibUSB(ctx: [*c][*c]SDL_LibUSBContext) bool;
pub extern fn SDL_QuitLibUSB() void;
pub extern fn SDL_AssertJoysticksLocked() void;
pub extern fn SDL_SendJoystickAxis(timestamp: Uint64, joystick: [*c]SDL_Joystick, axis: Uint8, value: Sint16) void;
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
pub extern fn HIDAPI_RemapVal(val: f32, val_min: f32, val_max: f32, output_min: f32, output_max: f32) f32;
pub extern fn SDL_HIDAPI_SendRumble(device: [*c]SDL_HIDAPI_Device, data: [*c]const Uint8, size: c_int) c_int;
pub const SDL_DriverGameCube_Context = extern struct {
    pc_mode: bool = false,
    joysticks: [4]SDL_JoystickID = @import("std").mem.zeroes([4]SDL_JoystickID),
    wireless: [4]Uint8 = @import("std").mem.zeroes([4]Uint8),
    min_axis: [24]Uint8 = @import("std").mem.zeroes([24]Uint8),
    max_axis: [24]Uint8 = @import("std").mem.zeroes([24]Uint8),
    rumbleAllowed: [4]Uint8 = @import("std").mem.zeroes([4]Uint8),
    rumble: [5]Uint8 = @import("std").mem.zeroes([5]Uint8),
    rumbleUpdate: bool = false,
    useRumbleBrake: bool = false,
    rumbleActive: bool = false,
    pc_rumble_sent: Uint64 = 0,
};
pub fn HIDAPI_DriverGameCube_RegisterHints(callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = SDL_AddHintCallback_REAL("SDL_JOYSTICK_HIDAPI_GAMECUBE", callback, userdata);
}
pub fn HIDAPI_DriverGameCube_UnregisterHints(callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_RemoveHintCallback_REAL("SDL_JOYSTICK_HIDAPI_GAMECUBE", callback, userdata);
}
pub fn HIDAPI_DriverGameCube_IsEnabled() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI_GAMECUBE", SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI", @"true" != 0));
}
pub fn HIDAPI_DriverGameCube_IsSupportedDevice(_: [*c]SDL_HIDAPI_Device, _: [*c]const u8, arg_type: SDL_GamepadType, vendor_id: Uint16, product_id: Uint16, _: Uint16, _: c_int, _: c_int, _: c_int, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    if ((@as(c_int, vendor_id) == USB_VENDOR_NINTENDO) and (@as(c_int, product_id) == USB_PRODUCT_NINTENDO_GAMECUBE_ADAPTER)) {
        return @"true" != 0;
    }
    if ((@as(c_int, vendor_id) == USB_VENDOR_DRAGONRISE) and (((@as(c_int, product_id) == USB_PRODUCT_EVORETRO_GAMECUBE_ADAPTER1) or (@as(c_int, product_id) == USB_PRODUCT_EVORETRO_GAMECUBE_ADAPTER2)) or (@as(c_int, product_id) == USB_PRODUCT_EVORETRO_GAMECUBE_ADAPTER3))) {
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub fn ResetAxisRange(ctx: [*c]SDL_DriverGameCube_Context, joystick_index: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = memset(@ptrCast(@alignCast(&ctx.*.min_axis[@bitCast(@as(isize, @intCast(joystick_index * SDL_GAMEPAD_AXIS_COUNT)))])), @as(c_int, 128) - @as(c_int, 88), SDL_GAMEPAD_AXIS_COUNT);
    _ = memset(@ptrCast(@alignCast(&ctx.*.max_axis[@bitCast(@as(isize, @intCast(joystick_index * SDL_GAMEPAD_AXIS_COUNT)))])), @as(c_int, 128) + @as(c_int, 88), SDL_GAMEPAD_AXIS_COUNT);
    ctx.*.min_axis[@bitCast(@as(isize, @intCast((joystick_index * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_LEFT_TRIGGER)))] = 40;
    ctx.*.min_axis[@bitCast(@as(isize, @intCast((joystick_index * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_RIGHT_TRIGGER)))] = 40;
}
pub fn SDL_JoystickGameCubeRumbleBrakeHintChanged(userdata: ?*anyopaque, _: [*c]const u8, _: [*c]const u8, hint: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (hint != null) {
        var ctx: [*c]SDL_DriverGameCube_Context = @ptrCast(@alignCast(userdata));
        _ = &ctx;
        ctx.*.useRumbleBrake = SDL_GetStringBoolean(hint, @"false" != 0);
    }
}
pub fn HIDAPI_DriverGameCube_EnableAdapter(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    _ = SDL_hid_close_REAL(device.*.dev);
    var libusb_ctx: [*c]SDL_LibUSBContext = undefined;
    _ = &libusb_ctx;
    if (SDL_InitLibUSB(&libusb_ctx)) {
        var context: ?*libusb_context = null;
        _ = &context;
        var devs: [*c]?*libusb_device = null;
        _ = &devs;
        var handle: ?*libusb_device_handle = null;
        _ = &handle;
        var desc: struct_libusb_device_descriptor = undefined;
        _ = &desc;
        var i: isize = undefined;
        _ = &i;
        var num_devs: isize = undefined;
        _ = &num_devs;
        var kernel_detached: bool = @"false" != 0;
        _ = &kernel_detached;
        if (libusb_ctx.*.init.?(&context) == @as(c_int, 0)) {
            num_devs = libusb_ctx.*.get_device_list.?(context, &devs);
            {
                i = 0;
                while (i < num_devs) : (i += 1) {
                    if (libusb_ctx.*.get_device_descriptor.?(devs[@bitCast(@as(isize, @intCast(i)))], &desc) != @as(c_int, 0)) {
                        continue;
                    }
                    if ((@as(c_int, desc.idVendor) != USB_VENDOR_NINTENDO) or (@as(c_int, desc.idProduct) != USB_PRODUCT_NINTENDO_GAMECUBE_ADAPTER)) {
                        continue;
                    }
                    if (libusb_ctx.*.open.?(devs[@bitCast(@as(isize, @intCast(i)))], &handle) != @as(c_int, 0)) {
                        continue;
                    }
                    if (libusb_ctx.*.kernel_driver_active.?(handle, 0) != 0) {
                        if (libusb_ctx.*.detach_kernel_driver.?(handle, 0) == @as(c_int, 0)) {
                            kernel_detached = @"true" != 0;
                        }
                    }
                    if (libusb_ctx.*.claim_interface.?(handle, 0) == @as(c_int, 0)) {
                        _ = libusb_ctx.*.control_transfer.?(handle, 33, 11, 1, 0, null, 0, 1000);
                        _ = libusb_ctx.*.release_interface.?(handle, 0);
                    }
                    if (kernel_detached) {
                        _ = libusb_ctx.*.attach_kernel_driver.?(handle, 0);
                    }
                    libusb_ctx.*.close.?(handle);
                }
            }
            libusb_ctx.*.free_device_list.?(devs, 1);
            libusb_ctx.*.exit.?(context);
        }
        SDL_QuitLibUSB();
    }
    device.*.dev = SDL_hid_open_path_REAL(device.*.path);
    if (!(device.*.dev != null)) {
        return @"false" != 0;
    }
    var initMagic: Uint8 = 19;
    _ = &initMagic;
    if (@as(c_ulong, @bitCast(@as(c_long, SDL_hid_write_REAL(device.*.dev, &initMagic, @sizeOf(@TypeOf(initMagic)))))) != @sizeOf(@TypeOf(initMagic))) {
        SDL_LogDebug_REAL(SDL_LOG_CATEGORY_INPUT, "HIDAPI_DriverGameCube_InitDevice(): Couldn't initialize WUP-028");
        return @"false" != 0;
    }
    SDL_Delay_REAL(10);
    return @"true" != 0;
}
pub fn HIDAPI_DriverGameCube_InitDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverGameCube_Context = undefined;
    _ = &ctx;
    var packet: [37]Uint8 = undefined;
    _ = &packet;
    var curSlot: [*c]Uint8 = undefined;
    _ = &curSlot;
    var i: Uint8 = undefined;
    _ = &i;
    var size: c_int = undefined;
    _ = &size;
    var rumbleMagic: Uint8 = 17;
    _ = &rumbleMagic;
    ctx = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(ctx.*)))));
    if (!(ctx != null)) {
        return @"false" != 0;
    }
    device.*.context = @ptrCast(@alignCast(ctx));
    ctx.*.rumble[@as(c_int, 0)] = rumbleMagic;
    if (@as(c_int, device.*.vendor_id) != USB_VENDOR_NINTENDO) {
        ctx.*.pc_mode = @"true" != 0;
    }
    if (ctx.*.pc_mode) {
        var rumbleAllowed: bool = @"false" != 0;
        _ = &rumbleAllowed;
        if ((blk: {
            const tmp = SDL_hid_read_timeout_REAL(device.*.dev, @ptrCast(@alignCast(&packet)), @sizeOf(@TypeOf(packet)), 0);
            size = tmp;
            break :blk tmp;
        }) > @as(c_int, 0)) {
            if (size == @as(c_int, 9)) {
                rumbleAllowed = @"true" != 0;
            }
        }
        {
            i = 0;
            while (@as(c_int, i) < MAX_CONTROLLERS) : (i +%= 1) {
                ctx.*.rumbleAllowed[i] = @intFromBool(rumbleAllowed);
                ResetAxisRange(ctx, i);
                _ = HIDAPI_JoystickConnected(device, &ctx.*.joysticks[i]);
            }
        }
    } else {
        if (!HIDAPI_DriverGameCube_EnableAdapter(device)) {
            return @"false" != 0;
        }
        while ((blk: {
            const tmp = SDL_hid_read_timeout_REAL(device.*.dev, @ptrCast(@alignCast(&packet)), @sizeOf(@TypeOf(packet)), 0);
            size = tmp;
            break :blk tmp;
        }) > @as(c_int, 0)) {
            if ((size < @as(c_int, 37)) or (@as(c_int, packet[@as(c_int, 0)]) != @as(c_int, 33))) {
                continue;
            }
            curSlot = @as([*c]Uint8, @ptrCast(@alignCast(&packet))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
            {
                i = 0;
                while (@as(c_int, i) < MAX_CONTROLLERS) : ({
                    {
                        const ref = &i;
                        ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) + @as(c_int, 1))));
                    }
                    curSlot += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 9)))));
                }) {
                    ctx.*.wireless[i] = @bitCast(@as(i8, @intFromBool((@as(c_int, curSlot[@as(c_int, 0)]) & @as(c_int, 32)) != @as(c_int, 0))));
                    ctx.*.rumbleAllowed[i] = @bitCast(@as(i8, @intFromBool(((@as(c_int, curSlot[@as(c_int, 0)]) & @as(c_int, 4)) != 0) and !(@as(c_int, ctx.*.wireless[i]) != 0))));
                    if ((@as(c_int, curSlot[@as(c_int, 0)]) & @as(c_int, 48)) != 0) {
                        if (ctx.*.joysticks[i] == @as(SDL_JoystickID, 0)) {
                            ResetAxisRange(ctx, i);
                            _ = HIDAPI_JoystickConnected(device, &ctx.*.joysticks[i]);
                        }
                    } else {
                        if (ctx.*.joysticks[i] != @as(SDL_JoystickID, 0)) {
                            HIDAPI_JoystickDisconnected(device, ctx.*.joysticks[i]);
                            ctx.*.joysticks[i] = 0;
                        }
                        continue;
                    }
                }
            }
        }
    }
    _ = SDL_AddHintCallback_REAL("SDL_JOYSTICK_HIDAPI_GAMECUBE_RUMBLE_BRAKE", SDL_JoystickGameCubeRumbleBrakeHintChanged, @ptrCast(@alignCast(ctx)));
    HIDAPI_SetDeviceName(device, "Nintendo GameCube Controller");
    return @"true" != 0;
}
pub fn HIDAPI_DriverGameCube_GetDevicePlayerIndex(device: [*c]SDL_HIDAPI_Device, instance_id: SDL_JoystickID) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverGameCube_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    var i: Uint8 = undefined;
    _ = &i;
    {
        i = 0;
        while (@as(c_int, i) < @as(c_int, 4)) : (i +%= 1) {
            if (instance_id == ctx.*.joysticks[i]) {
                return i;
            }
        }
    }
    return -@as(c_int, 1);
}
pub fn HIDAPI_DriverGameCube_SetDevicePlayerIndex(_: [*c]SDL_HIDAPI_Device, _: SDL_JoystickID, _: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn HIDAPI_DriverGameCube_HandleJoystickPacket(_: [*c]SDL_HIDAPI_Device, ctx: [*c]SDL_DriverGameCube_Context, slot: Uint8, packet: [*c]const Uint8, invert_c_stick: bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var joystick: [*c]SDL_Joystick = undefined;
    _ = &joystick;
    var i: Uint8 = undefined;
    _ = &i;
    var v: Uint8 = undefined;
    _ = &v;
    var axis_value: Sint16 = undefined;
    _ = &axis_value;
    var timestamp: Uint64 = SDL_GetTicksNS_REAL();
    _ = &timestamp;
    i = slot;
    if (@as(c_int, i) >= MAX_CONTROLLERS) {
        return;
    }
    joystick = SDL_GetJoystickFromID_REAL(ctx.*.joysticks[i]);
    if (!(joystick != null)) {
        return;
    }
    SDL_SendJoystickButton(timestamp, joystick, 0, (@as(c_int, packet[@as(c_int, 0)]) & @as(c_int, 2)) != @as(c_int, 0));
    SDL_SendJoystickButton(timestamp, joystick, 1, (@as(c_int, packet[@as(c_int, 0)]) & @as(c_int, 4)) != @as(c_int, 0));
    SDL_SendJoystickButton(timestamp, joystick, 3, (@as(c_int, packet[@as(c_int, 0)]) & @as(c_int, 8)) != @as(c_int, 0));
    SDL_SendJoystickButton(timestamp, joystick, 2, (@as(c_int, packet[@as(c_int, 0)]) & @as(c_int, 1)) != @as(c_int, 0));
    SDL_SendJoystickButton(timestamp, joystick, 4, (@as(c_int, packet[@as(c_int, 1)]) & @as(c_int, 128)) != @as(c_int, 0));
    SDL_SendJoystickButton(timestamp, joystick, 5, (@as(c_int, packet[@as(c_int, 1)]) & @as(c_int, 32)) != @as(c_int, 0));
    SDL_SendJoystickButton(timestamp, joystick, 6, (@as(c_int, packet[@as(c_int, 1)]) & @as(c_int, 64)) != @as(c_int, 0));
    SDL_SendJoystickButton(timestamp, joystick, 7, (@as(c_int, packet[@as(c_int, 1)]) & @as(c_int, 16)) != @as(c_int, 0));
    SDL_SendJoystickButton(timestamp, joystick, 8, (@as(c_int, packet[@as(c_int, 1)]) & @as(c_int, 2)) != @as(c_int, 0));
    SDL_SendJoystickButton(timestamp, joystick, 9, (@as(c_int, packet[@as(c_int, 0)]) & @as(c_int, 128)) != @as(c_int, 0));
    SDL_SendJoystickButton(timestamp, joystick, 10, (@as(c_int, packet[@as(c_int, 0)]) & @as(c_int, 32)) != @as(c_int, 0));
    SDL_SendJoystickButton(timestamp, joystick, 11, (@as(c_int, packet[@as(c_int, 0)]) & @as(c_int, 16)) != @as(c_int, 0));
    v = @bitCast(@as(i8, @truncate(if (@as(c_int, 0) != 0) @as(c_int, 255) - @as(c_int, packet[@as(c_int, 2)]) else @as(c_int, packet[@as(c_int, 2)]))));
    if (@as(c_int, v) < @as(c_int, ctx.*.min_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_LEFTX)))])) {
        ctx.*.min_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_LEFTX)))] = v;
    }
    if (@as(c_int, v) > @as(c_int, ctx.*.max_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_LEFTX)))])) {
        ctx.*.max_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_LEFTX)))] = v;
    }
    axis_value = @intFromFloat(HIDAPI_RemapVal(@floatFromInt(v), @floatFromInt(ctx.*.min_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_LEFTX)))]), @floatFromInt(ctx.*.max_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_LEFTX)))]), @floatFromInt(@as(Sint16, @truncate(~@as(c_int, 32767)))), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767))))));
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, axis_value);
    v = @bitCast(@as(i8, @truncate(if (@as(c_int, 1) != 0) @as(c_int, 255) - @as(c_int, packet[@as(c_int, 3)]) else @as(c_int, packet[@as(c_int, 3)]))));
    if (@as(c_int, v) < @as(c_int, ctx.*.min_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_LEFTY)))])) {
        ctx.*.min_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_LEFTY)))] = v;
    }
    if (@as(c_int, v) > @as(c_int, ctx.*.max_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_LEFTY)))])) {
        ctx.*.max_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_LEFTY)))] = v;
    }
    axis_value = @intFromFloat(HIDAPI_RemapVal(@floatFromInt(v), @floatFromInt(ctx.*.min_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_LEFTY)))]), @floatFromInt(ctx.*.max_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_LEFTY)))]), @floatFromInt(@as(Sint16, @truncate(~@as(c_int, 32767)))), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767))))));
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, axis_value);
    v = @bitCast(@as(i8, @truncate(if ((if (invert_c_stick) @as(c_int, 1) else @as(c_int, 0)) != 0) @as(c_int, 255) - @as(c_int, packet[@as(c_int, 5)]) else @as(c_int, packet[@as(c_int, 5)]))));
    if (@as(c_int, v) < @as(c_int, ctx.*.min_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_RIGHTX)))])) {
        ctx.*.min_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_RIGHTX)))] = v;
    }
    if (@as(c_int, v) > @as(c_int, ctx.*.max_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_RIGHTX)))])) {
        ctx.*.max_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_RIGHTX)))] = v;
    }
    axis_value = @intFromFloat(HIDAPI_RemapVal(@floatFromInt(v), @floatFromInt(ctx.*.min_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_RIGHTX)))]), @floatFromInt(ctx.*.max_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_RIGHTX)))]), @floatFromInt(@as(Sint16, @truncate(~@as(c_int, 32767)))), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767))))));
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, axis_value);
    v = @bitCast(@as(i8, @truncate(if ((if (invert_c_stick) @as(c_int, 0) else @as(c_int, 1)) != 0) @as(c_int, 255) - @as(c_int, packet[@as(c_int, 4)]) else @as(c_int, packet[@as(c_int, 4)]))));
    if (@as(c_int, v) < @as(c_int, ctx.*.min_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_RIGHTY)))])) {
        ctx.*.min_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_RIGHTY)))] = v;
    }
    if (@as(c_int, v) > @as(c_int, ctx.*.max_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_RIGHTY)))])) {
        ctx.*.max_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_RIGHTY)))] = v;
    }
    axis_value = @intFromFloat(HIDAPI_RemapVal(@floatFromInt(v), @floatFromInt(ctx.*.min_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_RIGHTY)))]), @floatFromInt(ctx.*.max_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_RIGHTY)))]), @floatFromInt(@as(Sint16, @truncate(~@as(c_int, 32767)))), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767))))));
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, axis_value);
    v = @bitCast(@as(i8, @truncate(if (@as(c_int, 0) != 0) @as(c_int, 255) - @as(c_int, packet[@as(c_int, 6)]) else @as(c_int, packet[@as(c_int, 6)]))));
    if (@as(c_int, v) < @as(c_int, ctx.*.min_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_LEFT_TRIGGER)))])) {
        ctx.*.min_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_LEFT_TRIGGER)))] = v;
    }
    if (@as(c_int, v) > @as(c_int, ctx.*.max_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_LEFT_TRIGGER)))])) {
        ctx.*.max_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_LEFT_TRIGGER)))] = v;
    }
    axis_value = @intFromFloat(HIDAPI_RemapVal(@floatFromInt(v), @floatFromInt(ctx.*.min_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_LEFT_TRIGGER)))]), @floatFromInt(ctx.*.max_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_LEFT_TRIGGER)))]), @floatFromInt(@as(Sint16, @truncate(~@as(c_int, 32767)))), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767))))));
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFT_TRIGGER, axis_value);
    v = @bitCast(@as(i8, @truncate(if (@as(c_int, 0) != 0) @as(c_int, 255) - @as(c_int, packet[@as(c_int, 7)]) else @as(c_int, packet[@as(c_int, 7)]))));
    if (@as(c_int, v) < @as(c_int, ctx.*.min_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_RIGHT_TRIGGER)))])) {
        ctx.*.min_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_RIGHT_TRIGGER)))] = v;
    }
    if (@as(c_int, v) > @as(c_int, ctx.*.max_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_RIGHT_TRIGGER)))])) {
        ctx.*.max_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_RIGHT_TRIGGER)))] = v;
    }
    axis_value = @intFromFloat(HIDAPI_RemapVal(@floatFromInt(v), @floatFromInt(ctx.*.min_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_RIGHT_TRIGGER)))]), @floatFromInt(ctx.*.max_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_RIGHT_TRIGGER)))]), @floatFromInt(@as(Sint16, @truncate(~@as(c_int, 32767)))), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767))))));
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHT_TRIGGER, axis_value);
}
pub fn HIDAPI_DriverGameCube_HandleNintendoPacket(device: [*c]SDL_HIDAPI_Device, ctx: [*c]SDL_DriverGameCube_Context, packet: [*c]Uint8, size: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var joystick: [*c]SDL_Joystick = undefined;
    _ = &joystick;
    var curSlot: [*c]Uint8 = undefined;
    _ = &curSlot;
    var i: Uint8 = undefined;
    _ = &i;
    var axis_value: Sint16 = undefined;
    _ = &axis_value;
    var timestamp: Uint64 = SDL_GetTicksNS_REAL();
    _ = &timestamp;
    if ((size < @as(c_int, 37)) or (@as(c_int, packet[@as(c_int, 0)]) != @as(c_int, 33))) {
        return;
    }
    curSlot = packet + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
    {
        i = 0;
        while (@as(c_int, i) < MAX_CONTROLLERS) : ({
            {
                const ref = &i;
                ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) + @as(c_int, 1))));
            }
            curSlot += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 9)))));
        }) {
            ctx.*.wireless[i] = @bitCast(@as(i8, @intFromBool((@as(c_int, curSlot[@as(c_int, 0)]) & @as(c_int, 32)) != @as(c_int, 0))));
            ctx.*.rumbleAllowed[i] = @bitCast(@as(i8, @intFromBool(((@as(c_int, curSlot[@as(c_int, 0)]) & @as(c_int, 4)) != 0) and !(@as(c_int, ctx.*.wireless[i]) != 0))));
            if ((@as(c_int, curSlot[@as(c_int, 0)]) & @as(c_int, 48)) != 0) {
                if (ctx.*.joysticks[i] == @as(SDL_JoystickID, 0)) {
                    ResetAxisRange(ctx, i);
                    _ = HIDAPI_JoystickConnected(device, &ctx.*.joysticks[i]);
                }
                joystick = SDL_GetJoystickFromID_REAL(ctx.*.joysticks[i]);
                if (!(joystick != null)) {
                    continue;
                }
            } else {
                if (ctx.*.joysticks[i] != @as(SDL_JoystickID, 0)) {
                    HIDAPI_JoystickDisconnected(device, ctx.*.joysticks[i]);
                    ctx.*.joysticks[i] = 0;
                }
                continue;
            }
            SDL_SendJoystickButton(timestamp, joystick, 0, (@as(c_int, curSlot[@as(c_int, 1)]) & @as(c_int, 1)) != @as(c_int, 0));
            SDL_SendJoystickButton(timestamp, joystick, 1, (@as(c_int, curSlot[@as(c_int, 1)]) & @as(c_int, 2)) != @as(c_int, 0));
            SDL_SendJoystickButton(timestamp, joystick, 2, (@as(c_int, curSlot[@as(c_int, 1)]) & @as(c_int, 4)) != @as(c_int, 0));
            SDL_SendJoystickButton(timestamp, joystick, 3, (@as(c_int, curSlot[@as(c_int, 1)]) & @as(c_int, 8)) != @as(c_int, 0));
            SDL_SendJoystickButton(timestamp, joystick, 4, (@as(c_int, curSlot[@as(c_int, 1)]) & @as(c_int, 16)) != @as(c_int, 0));
            SDL_SendJoystickButton(timestamp, joystick, 5, (@as(c_int, curSlot[@as(c_int, 1)]) & @as(c_int, 32)) != @as(c_int, 0));
            SDL_SendJoystickButton(timestamp, joystick, 6, (@as(c_int, curSlot[@as(c_int, 1)]) & @as(c_int, 64)) != @as(c_int, 0));
            SDL_SendJoystickButton(timestamp, joystick, 7, (@as(c_int, curSlot[@as(c_int, 1)]) & @as(c_int, 128)) != @as(c_int, 0));
            SDL_SendJoystickButton(timestamp, joystick, 8, (@as(c_int, curSlot[@as(c_int, 2)]) & @as(c_int, 1)) != @as(c_int, 0));
            SDL_SendJoystickButton(timestamp, joystick, 9, (@as(c_int, curSlot[@as(c_int, 2)]) & @as(c_int, 2)) != @as(c_int, 0));
            SDL_SendJoystickButton(timestamp, joystick, 10, (@as(c_int, curSlot[@as(c_int, 2)]) & @as(c_int, 4)) != @as(c_int, 0));
            SDL_SendJoystickButton(timestamp, joystick, 11, (@as(c_int, curSlot[@as(c_int, 2)]) & @as(c_int, 8)) != @as(c_int, 0));
            if (@as(c_int, curSlot[@as(c_int, 3)]) < @as(c_int, ctx.*.min_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_LEFTX)))])) {
                ctx.*.min_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_LEFTX)))] = curSlot[@as(c_int, 3)];
            }
            if (@as(c_int, curSlot[@as(c_int, 3)]) > @as(c_int, ctx.*.max_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_LEFTX)))])) {
                ctx.*.max_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_LEFTX)))] = curSlot[@as(c_int, 3)];
            }
            axis_value = @intFromFloat(HIDAPI_RemapVal(@floatFromInt(curSlot[@as(c_int, 3)]), @floatFromInt(ctx.*.min_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_LEFTX)))]), @floatFromInt(ctx.*.max_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_LEFTX)))]), @floatFromInt(@as(Sint16, @truncate(~@as(c_int, 32767)))), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767))))));
            SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, axis_value);
            if (@as(c_int, curSlot[@as(c_int, 4)]) < @as(c_int, ctx.*.min_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_LEFTY)))])) {
                ctx.*.min_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_LEFTY)))] = curSlot[@as(c_int, 4)];
            }
            if (@as(c_int, curSlot[@as(c_int, 4)]) > @as(c_int, ctx.*.max_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_LEFTY)))])) {
                ctx.*.max_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_LEFTY)))] = curSlot[@as(c_int, 4)];
            }
            axis_value = @intFromFloat(HIDAPI_RemapVal(@floatFromInt(curSlot[@as(c_int, 4)]), @floatFromInt(ctx.*.min_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_LEFTY)))]), @floatFromInt(ctx.*.max_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_LEFTY)))]), @floatFromInt(@as(Sint16, @truncate(~@as(c_int, 32767)))), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767))))));
            SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, axis_value);
            if (@as(c_int, curSlot[@as(c_int, 5)]) < @as(c_int, ctx.*.min_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_RIGHTX)))])) {
                ctx.*.min_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_RIGHTX)))] = curSlot[@as(c_int, 5)];
            }
            if (@as(c_int, curSlot[@as(c_int, 5)]) > @as(c_int, ctx.*.max_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_RIGHTX)))])) {
                ctx.*.max_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_RIGHTX)))] = curSlot[@as(c_int, 5)];
            }
            axis_value = @intFromFloat(HIDAPI_RemapVal(@floatFromInt(curSlot[@as(c_int, 5)]), @floatFromInt(ctx.*.min_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_RIGHTX)))]), @floatFromInt(ctx.*.max_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_RIGHTX)))]), @floatFromInt(@as(Sint16, @truncate(~@as(c_int, 32767)))), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767))))));
            SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, axis_value);
            if (@as(c_int, curSlot[@as(c_int, 6)]) < @as(c_int, ctx.*.min_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_RIGHTY)))])) {
                ctx.*.min_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_RIGHTY)))] = curSlot[@as(c_int, 6)];
            }
            if (@as(c_int, curSlot[@as(c_int, 6)]) > @as(c_int, ctx.*.max_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_RIGHTY)))])) {
                ctx.*.max_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_RIGHTY)))] = curSlot[@as(c_int, 6)];
            }
            axis_value = @intFromFloat(HIDAPI_RemapVal(@floatFromInt(curSlot[@as(c_int, 6)]), @floatFromInt(ctx.*.min_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_RIGHTY)))]), @floatFromInt(ctx.*.max_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_RIGHTY)))]), @floatFromInt(@as(Sint16, @truncate(~@as(c_int, 32767)))), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767))))));
            SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, axis_value);
            if (@as(c_int, curSlot[@as(c_int, 7)]) < @as(c_int, ctx.*.min_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_LEFT_TRIGGER)))])) {
                ctx.*.min_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_LEFT_TRIGGER)))] = curSlot[@as(c_int, 7)];
            }
            if (@as(c_int, curSlot[@as(c_int, 7)]) > @as(c_int, ctx.*.max_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_LEFT_TRIGGER)))])) {
                ctx.*.max_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_LEFT_TRIGGER)))] = curSlot[@as(c_int, 7)];
            }
            axis_value = @intFromFloat(HIDAPI_RemapVal(@floatFromInt(curSlot[@as(c_int, 7)]), @floatFromInt(ctx.*.min_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_LEFT_TRIGGER)))]), @floatFromInt(ctx.*.max_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_LEFT_TRIGGER)))]), @floatFromInt(@as(Sint16, @truncate(~@as(c_int, 32767)))), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767))))));
            SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFT_TRIGGER, axis_value);
            if (@as(c_int, curSlot[@as(c_int, 8)]) < @as(c_int, ctx.*.min_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_RIGHT_TRIGGER)))])) {
                ctx.*.min_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_RIGHT_TRIGGER)))] = curSlot[@as(c_int, 8)];
            }
            if (@as(c_int, curSlot[@as(c_int, 8)]) > @as(c_int, ctx.*.max_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_RIGHT_TRIGGER)))])) {
                ctx.*.max_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_RIGHT_TRIGGER)))] = curSlot[@as(c_int, 8)];
            }
            axis_value = @intFromFloat(HIDAPI_RemapVal(@floatFromInt(curSlot[@as(c_int, 8)]), @floatFromInt(ctx.*.min_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_RIGHT_TRIGGER)))]), @floatFromInt(ctx.*.max_axis[@bitCast(@as(isize, @intCast((@as(c_int, i) * SDL_GAMEPAD_AXIS_COUNT) + SDL_GAMEPAD_AXIS_RIGHT_TRIGGER)))]), @floatFromInt(@as(Sint16, @truncate(~@as(c_int, 32767)))), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767))))));
            SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHT_TRIGGER, axis_value);
        }
    }
}
pub fn HIDAPI_DriverGameCube_SendPCRumble(device: [*c]SDL_HIDAPI_Device, ctx: [*c]SDL_DriverGameCube_Context) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var rumblepkt: [3]Uint8 = [3]Uint8{
        0,
        0,
        0,
    };
    _ = &rumblepkt;
    rumblepkt[@as(c_int, 1)] = blk: {
        const tmp = @as(Uint8, @bitCast(@as(i8, @truncate(if (ctx.*.rumbleActive) @as(c_int, 255) else @as(c_int, 0)))));
        rumblepkt[@as(c_int, 2)] = tmp;
        break :blk tmp;
    };
    _ = SDL_HIDAPI_SendRumble(device, @ptrCast(@alignCast(&rumblepkt)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(rumblepkt))))));
    ctx.*.pc_rumble_sent = SDL_GetTicks_REAL();
}
pub fn HIDAPI_DriverGameCube_UpdateDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverGameCube_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    var packet: [64]Uint8 = undefined;
    _ = &packet;
    var size: c_int = undefined;
    _ = &size;
    while ((blk: {
        const tmp = SDL_hid_read_timeout_REAL(device.*.dev, @ptrCast(@alignCast(&packet)), @sizeOf(@TypeOf(packet)), 0);
        size = tmp;
        break :blk tmp;
    }) > @as(c_int, 0)) {
        if (ctx.*.pc_mode) {
            if (size == @as(c_int, 10)) {
                HIDAPI_DriverGameCube_HandleJoystickPacket(device, ctx, @bitCast(@as(i8, @truncate(@as(c_int, packet[@as(c_int, 0)]) - @as(c_int, 1)))), &packet[@as(c_int, 1)], @"true" != 0);
            } else if (size == @as(c_int, 9)) {
                HIDAPI_DriverGameCube_HandleJoystickPacket(device, ctx, 0, @ptrCast(@alignCast(&packet)), @"false" != 0);
            } else {}
        } else {
            HIDAPI_DriverGameCube_HandleNintendoPacket(device, ctx, @ptrCast(@alignCast(&packet)), size);
        }
    }
    if ((ctx.*.pc_mode and ctx.*.rumbleActive) and (SDL_GetTicks_REAL() >= (ctx.*.pc_rumble_sent +% @as(Uint64, PC_RUMBLE_REFRESH)))) {
        HIDAPI_DriverGameCube_SendPCRumble(device, ctx);
    }
    if (ctx.*.rumbleUpdate) {
        _ = SDL_HIDAPI_SendRumble(device, @ptrCast(@alignCast(&ctx.*.rumble)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(ctx.*.rumble))))));
        ctx.*.rumbleUpdate = @"false" != 0;
    }
    return @"true" != 0;
}
pub fn HIDAPI_DriverGameCube_OpenJoystick(device: [*c]SDL_HIDAPI_Device, joystick: [*c]SDL_Joystick) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverGameCube_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    var i: Uint8 = undefined;
    _ = &i;
    SDL_AssertJoysticksLocked();
    {
        i = 0;
        while (@as(c_int, i) < MAX_CONTROLLERS) : ({
            const ref = &i;
            ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) + @as(c_int, 1))));
        }) {
            if (joystick.*.instance_id == ctx.*.joysticks[i]) {
                joystick.*.nbuttons = 12;
                joystick.*.naxes = SDL_GAMEPAD_AXIS_COUNT;
                if (@as(c_int, ctx.*.wireless[i]) != 0) {
                    joystick.*.connection_state = SDL_JOYSTICK_CONNECTION_WIRELESS;
                } else {
                    joystick.*.connection_state = SDL_JOYSTICK_CONNECTION_WIRED;
                }
                return @"true" != 0;
            }
        }
    }
    return @"false" != 0;
}
pub fn HIDAPI_DriverGameCube_RumbleJoystick(device: [*c]SDL_HIDAPI_Device, joystick: [*c]SDL_Joystick, low_frequency_rumble: Uint16, high_frequency_rumble: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverGameCube_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    var i: Uint8 = undefined;
    _ = &i;
    var val: Uint8 = undefined;
    _ = &val;
    SDL_AssertJoysticksLocked();
    if (ctx.*.pc_mode) {
        {
            i = 0;
            while (@as(c_int, i) < MAX_CONTROLLERS) : ({
                const ref = &i;
                ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) + @as(c_int, 1))));
            }) {
                if (joystick.*.instance_id == ctx.*.joysticks[i]) {
                    if (!(@as(c_int, ctx.*.rumbleAllowed[i]) != 0)) {
                        return SDL_SetError_REAL("Rumble is disabled because the adapter is not at least of firmware 0x7");
                    }
                    var shouldrumble: bool = @"false" != 0;
                    _ = &shouldrumble;
                    var coast: bool = @"false" != 0;
                    _ = &coast;
                    if (ctx.*.useRumbleBrake) {
                        coast = (@as(c_int, low_frequency_rumble) == @as(c_int, 0)) and (@as(c_int, high_frequency_rumble) > @as(c_int, 0));
                    }
                    shouldrumble = (@as(c_int, low_frequency_rumble) > @as(c_int, 0)) or (@as(c_int, high_frequency_rumble) > @as(c_int, 0));
                    if (coast) {
                        ctx.*.rumbleActive = @"false" != 0;
                    } else if (@as(c_int, @intFromBool(shouldrumble)) != @as(c_int, @intFromBool(ctx.*.rumbleActive))) {
                        ctx.*.rumbleActive = shouldrumble;
                        HIDAPI_DriverGameCube_SendPCRumble(device, ctx);
                    }
                    return @"true" != 0;
                }
            }
        }
    } else {
        {
            i = 0;
            while (@as(c_int, i) < MAX_CONTROLLERS) : ({
                const ref = &i;
                ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) + @as(c_int, 1))));
            }) {
                if (joystick.*.instance_id == ctx.*.joysticks[i]) {
                    if (@as(c_int, ctx.*.wireless[i]) != 0) {
                        return SDL_SetError_REAL("Nintendo GameCube WaveBird controllers do not support rumble");
                    }
                    if (!(@as(c_int, ctx.*.rumbleAllowed[i]) != 0)) {
                        return SDL_SetError_REAL("Second USB cable for WUP-028 not connected");
                    }
                    if (ctx.*.useRumbleBrake) {
                        if ((@as(c_int, low_frequency_rumble) == @as(c_int, 0)) and (@as(c_int, high_frequency_rumble) > @as(c_int, 0))) {
                            val = 0;
                        } else if ((@as(c_int, low_frequency_rumble) == @as(c_int, 0)) and (@as(c_int, high_frequency_rumble) == @as(c_int, 0))) {
                            val = 2;
                        } else {
                            val = 1;
                        }
                    } else {
                        val = @bitCast(@as(i8, @intFromBool((@as(c_int, low_frequency_rumble) > @as(c_int, 0)) or (@as(c_int, high_frequency_rumble) > @as(c_int, 0)))));
                    }
                    if (@as(c_int, val) != @as(c_int, ctx.*.rumble[@bitCast(@as(isize, @intCast(@as(c_int, i) + @as(c_int, 1))))])) {
                        ctx.*.rumble[@bitCast(@as(isize, @intCast(@as(c_int, i) + @as(c_int, 1))))] = val;
                        ctx.*.rumbleUpdate = @"true" != 0;
                    }
                    return @"true" != 0;
                }
            }
        }
    }
    return SDL_SetError_REAL("Couldn't find joystick");
}
pub fn HIDAPI_DriverGameCube_RumbleJoystickTriggers(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: Uint16, _: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverGameCube_GetJoystickCapabilities(device: [*c]SDL_HIDAPI_Device, joystick: [*c]SDL_Joystick) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverGameCube_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    var result: Uint32 = 0;
    _ = &result;
    SDL_AssertJoysticksLocked();
    var i: Uint8 = undefined;
    _ = &i;
    if (ctx.*.pc_mode) {
        {
            i = 0;
            while (@as(c_int, i) < MAX_CONTROLLERS) : ({
                const ref = &i;
                ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) + @as(c_int, 1))));
            }) {
                if (joystick.*.instance_id == ctx.*.joysticks[i]) {
                    if (@as(c_int, ctx.*.rumbleAllowed[i]) != 0) {
                        result |= SDL_JOYSTICK_CAP_RUMBLE;
                        break;
                    }
                }
            }
        }
    } else {
        {
            i = 0;
            while (@as(c_int, i) < MAX_CONTROLLERS) : ({
                const ref = &i;
                ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) + @as(c_int, 1))));
            }) {
                if (joystick.*.instance_id == ctx.*.joysticks[i]) {
                    if (!(@as(c_int, ctx.*.wireless[i]) != 0) and (@as(c_int, ctx.*.rumbleAllowed[i]) != 0)) {
                        result |= SDL_JOYSTICK_CAP_RUMBLE;
                        break;
                    }
                }
            }
        }
    }
    return result;
}
pub fn HIDAPI_DriverGameCube_SetJoystickLED(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: Uint8, _: Uint8, _: Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverGameCube_SendJoystickEffect(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: ?*const anyopaque, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverGameCube_SetJoystickSensorsEnabled(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverGameCube_CloseJoystick(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverGameCube_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    if (ctx.*.rumbleUpdate) {
        _ = SDL_HIDAPI_SendRumble(device, @ptrCast(@alignCast(&ctx.*.rumble)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(ctx.*.rumble))))));
        ctx.*.rumbleUpdate = @"false" != 0;
    }
    if (ctx.*.pc_mode and ctx.*.rumbleActive) {
        ctx.*.rumbleActive = @"false" != 0;
        HIDAPI_DriverGameCube_SendPCRumble(device, ctx);
    }
}
pub fn HIDAPI_DriverGameCube_FreeDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverGameCube_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    SDL_RemoveHintCallback_REAL("SDL_JOYSTICK_HIDAPI_GAMECUBE_RUMBLE_BRAKE", SDL_JoystickGameCubeRumbleBrakeHintChanged, @ptrCast(@alignCast(ctx)));
}
pub export var SDL_HIDAPI_DriverGameCube: SDL_HIDAPI_DeviceDriver = SDL_HIDAPI_DeviceDriver{
    .name = "SDL_JOYSTICK_HIDAPI_GAMECUBE",
    .enabled = @"true" != 0,
    .RegisterHints = HIDAPI_DriverGameCube_RegisterHints,
    .UnregisterHints = HIDAPI_DriverGameCube_UnregisterHints,
    .IsEnabled = HIDAPI_DriverGameCube_IsEnabled,
    .IsSupportedDevice = HIDAPI_DriverGameCube_IsSupportedDevice,
    .InitDevice = HIDAPI_DriverGameCube_InitDevice,
    .GetDevicePlayerIndex = HIDAPI_DriverGameCube_GetDevicePlayerIndex,
    .SetDevicePlayerIndex = HIDAPI_DriverGameCube_SetDevicePlayerIndex,
    .UpdateDevice = HIDAPI_DriverGameCube_UpdateDevice,
    .OpenJoystick = HIDAPI_DriverGameCube_OpenJoystick,
    .RumbleJoystick = HIDAPI_DriverGameCube_RumbleJoystick,
    .RumbleJoystickTriggers = HIDAPI_DriverGameCube_RumbleJoystickTriggers,
    .GetJoystickCapabilities = HIDAPI_DriverGameCube_GetJoystickCapabilities,
    .SetJoystickLED = HIDAPI_DriverGameCube_SetJoystickLED,
    .SendJoystickEffect = HIDAPI_DriverGameCube_SendJoystickEffect,
    .SetJoystickSensorsEnabled = HIDAPI_DriverGameCube_SetJoystickSensorsEnabled,
    .CloseJoystick = HIDAPI_DriverGameCube_CloseJoystick,
    .FreeDevice = HIDAPI_DriverGameCube_FreeDevice,
};

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const USB_VENDOR_DRAGONRISE = @as(c_int, 0x0079);
pub const USB_VENDOR_NINTENDO = @as(c_int, 0x057e);
pub const USB_PRODUCT_EVORETRO_GAMECUBE_ADAPTER1 = @as(c_int, 0x1843);
pub const USB_PRODUCT_EVORETRO_GAMECUBE_ADAPTER2 = @as(c_int, 0x1844);
pub const USB_PRODUCT_EVORETRO_GAMECUBE_ADAPTER3 = @as(c_int, 0x1846);
pub const USB_PRODUCT_NINTENDO_GAMECUBE_ADAPTER = @as(c_int, 0x0337);
pub const SDL_JOYSTICK_CAP_RUMBLE = @as(c_int, 0x00000010);
pub const MAX_CONTROLLERS = @as(c_int, 4);
pub const PC_RUMBLE_REFRESH = @as(c_int, 16);
