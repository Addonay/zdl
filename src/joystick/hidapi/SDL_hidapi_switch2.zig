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
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Sint16 = i16;
pub const Uint16 = u16;
pub const Uint32 = u32;
pub const Uint64 = u64;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_strlcpy_REAL(dst: [*c]u8, src: [*c]const u8, maxlen: usize) usize;
pub const struct_SDL_AtomicInt = extern struct {
    value: c_int = 0,
};
pub const SDL_AtomicInt = struct_SDL_AtomicInt;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_PropertiesID = Uint32;
pub extern fn SDL_GetPointerProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: ?*anyopaque) ?*anyopaque;
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
pub const SDL_SENSOR_GYRO: c_int = 2;
pub const SDL_SENSOR_ACCEL_L: c_int = 3;
pub const SDL_SENSOR_GYRO_L: c_int = 4;
pub const SDL_SENSOR_ACCEL_R: c_int = 5;
pub const SDL_SENSOR_GYRO_R: c_int = 6;
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
pub extern fn SDL_GetJoystickPlayerIndex_REAL(joystick: [*c]SDL_Joystick) c_int;
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
pub extern fn SDL_hid_get_properties_REAL(dev: ?*SDL_hid_device) SDL_PropertiesID;
pub extern fn SDL_hid_read_timeout_REAL(dev: ?*SDL_hid_device, data: [*c]u8, length: usize, milliseconds: c_int) c_int;
pub extern fn SDL_GetHintBoolean_REAL(name: [*c]const u8, default_value: bool) bool;
pub const SDL_HintCallback = ?*const fn (userdata: ?*anyopaque, name: [*c]const u8, oldValue: [*c]const u8, newValue: [*c]const u8) callconv(.c) void;
pub extern fn SDL_AddHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) bool;
pub extern fn SDL_RemoveHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) void;
pub const SDL_LOG_CATEGORY_INPUT: c_int = 7;
pub extern fn SDL_LogWarn_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_GetTicks_REAL() Uint64;
pub extern fn SDL_GetTicksNS_REAL() Uint64;
pub extern fn SDL_GetStringBoolean(value: [*c]const u8, default_value: bool) bool;
pub const LIBUSB_ENDPOINT_OUT: c_int = 0;
pub const LIBUSB_ENDPOINT_IN: c_int = 128;
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
pub const LIBUSB_TRANSFER_TYPE_BULK: c_int = 2;
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
pub extern fn HIDAPI_SetDeviceSerial(device: [*c]SDL_HIDAPI_Device, serial: [*c]const u8) void;
pub extern fn HIDAPI_JoystickConnected(device: [*c]SDL_HIDAPI_Device, pJoystickID: [*c]SDL_JoystickID) bool;
pub extern fn HIDAPI_JoystickDisconnected(device: [*c]SDL_HIDAPI_Device, joystickID: SDL_JoystickID) void;
pub extern fn HIDAPI_UpdateDeviceProperties(device: [*c]SDL_HIDAPI_Device) void;
pub extern fn HIDAPI_RemapVal(val: f32, val_min: f32, val_max: f32, output_min: f32, output_max: f32) f32;
pub extern fn SDL_HIDAPI_LockRumble() bool;
pub extern fn SDL_HIDAPI_SendRumbleAndUnlock(device: [*c]SDL_HIDAPI_Device, data: [*c]const Uint8, size: c_int) c_int;
pub const SDL_GAMEPAD_BUTTON_SWITCH2_PRO_SHARE: c_int = 11;
pub const SDL_GAMEPAD_BUTTON_SWITCH2_PRO_C: c_int = 12;
pub const SDL_GAMEPAD_BUTTON_SWITCH2_PRO_RIGHT_PADDLE: c_int = 13;
pub const SDL_GAMEPAD_BUTTON_SWITCH2_PRO_LEFT_PADDLE: c_int = 14;
pub const SDL_GAMEPAD_NUM_SWITCH2_PRO_BUTTONS: c_int = 15;
pub const SDL_GAMEPAD_BUTTON_SWITCH2_JOYCON_SHARE: c_int = 11;
pub const SDL_GAMEPAD_BUTTON_SWITCH2_JOYCON_C: c_int = 12;
pub const SDL_GAMEPAD_BUTTON_SWITCH2_JOYCON_RIGHT_PADDLE1: c_int = 13;
pub const SDL_GAMEPAD_BUTTON_SWITCH2_JOYCON_LEFT_PADDLE1: c_int = 14;
pub const SDL_GAMEPAD_BUTTON_SWITCH2_JOYCON_RIGHT_PADDLE2: c_int = 15;
pub const SDL_GAMEPAD_BUTTON_SWITCH2_JOYCON_LEFT_PADDLE2: c_int = 16;
pub const SDL_GAMEPAD_NUM_SWITCH2_JOYCON_BUTTONS: c_int = 17;
pub const SDL_GAMEPAD_BUTTON_SWITCH2_GAMECUBE_GUIDE: c_int = 4;
pub const SDL_GAMEPAD_BUTTON_SWITCH2_GAMECUBE_START: c_int = 5;
pub const SDL_GAMEPAD_BUTTON_SWITCH2_GAMECUBE_LEFT_SHOULDER: c_int = 6;
pub const SDL_GAMEPAD_BUTTON_SWITCH2_GAMECUBE_RIGHT_SHOULDER: c_int = 7;
pub const SDL_GAMEPAD_BUTTON_SWITCH2_GAMECUBE_SHARE: c_int = 8;
pub const SDL_GAMEPAD_BUTTON_SWITCH2_GAMECUBE_C: c_int = 9;
pub const SDL_GAMEPAD_BUTTON_SWITCH2_GAMECUBE_LEFT_TRIGGER: c_int = 10;
pub const SDL_GAMEPAD_BUTTON_SWITCH2_GAMECUBE_RIGHT_TRIGGER: c_int = 11;
pub const SDL_GAMEPAD_NUM_SWITCH2_GAMECUBE_BUTTONS: c_int = 12;
pub const Switch2_AxisCalibration = extern struct {
    neutral: Uint16 = 0,
    max: Uint16 = 0,
    min: Uint16 = 0,
};
pub const Switch2_StickCalibration = extern struct {
    x: Switch2_AxisCalibration = @import("std").mem.zeroes(Switch2_AxisCalibration),
    y: Switch2_AxisCalibration = @import("std").mem.zeroes(Switch2_AxisCalibration),
};
pub const SDL_DriverSwitch2_Context = extern struct {
    device: [*c]SDL_HIDAPI_Device = null,
    joystick: [*c]SDL_Joystick = null,
    libusb: [*c]SDL_LibUSBContext = null,
    device_handle: ?*libusb_device_handle = null,
    interface_claimed: bool = false,
    interface_number: Uint8 = 0,
    out_endpoint: Uint8 = 0,
    in_endpoint: Uint8 = 0,
    rumble_timestamp: Uint64 = 0,
    rumble_seq: Uint32 = 0,
    rumble_hi_amp: Uint16 = 0,
    rumble_hi_freq: Uint16 = 0,
    rumble_lo_amp: Uint16 = 0,
    rumble_lo_freq: Uint16 = 0,
    rumble_error: Uint32 = 0,
    rumble_updated: bool = false,
    left_stick: Switch2_StickCalibration = @import("std").mem.zeroes(Switch2_StickCalibration),
    right_stick: Switch2_StickCalibration = @import("std").mem.zeroes(Switch2_StickCalibration),
    left_trigger_zero: Uint8 = 0,
    right_trigger_zero: Uint8 = 0,
    gyro_bias_x: f32 = 0,
    gyro_bias_y: f32 = 0,
    gyro_bias_z: f32 = 0,
    accel_bias_x: f32 = 0,
    accel_bias_y: f32 = 0,
    accel_bias_z: f32 = 0,
    sensors_enabled: bool = false,
    sensors_ready: bool = false,
    sample_count: c_int = 0,
    first_sensor_timestamp: Uint64 = 0,
    sensor_ts_coeff: Uint64 = 0,
    gyro_coeff: f32 = 0,
    player_lights: bool = false,
    player_index: c_int = 0,
    vertical_mode: bool = false,
    last_state: [64]Uint8 = @import("std").mem.zeroes([64]Uint8),
};
pub fn ParseStickCalibration(stick_data: [*c]Switch2_StickCalibration, data: [*c]const Uint8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    stick_data.*.x.neutral = data[@as(c_int, 0)];
    {
        const ref = &stick_data.*.x.neutral;
        ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) | ((@as(c_int, data[@as(c_int, 1)]) & @as(c_int, 15)) << @intCast(@as(c_int, 8))))));
    }
    stick_data.*.y.neutral = @bitCast(@as(c_short, @truncate(@as(c_int, data[@as(c_int, 1)]) >> @intCast(@as(c_int, 4)))));
    {
        const ref = &stick_data.*.y.neutral;
        ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) | (@as(c_int, data[@as(c_int, 2)]) << @intCast(@as(c_int, 4))))));
    }
    stick_data.*.x.max = data[@as(c_int, 3)];
    {
        const ref = &stick_data.*.x.max;
        ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) | ((@as(c_int, data[@as(c_int, 4)]) & @as(c_int, 15)) << @intCast(@as(c_int, 8))))));
    }
    stick_data.*.y.max = @bitCast(@as(c_short, @truncate(@as(c_int, data[@as(c_int, 4)]) >> @intCast(@as(c_int, 4)))));
    {
        const ref = &stick_data.*.y.max;
        ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) | (@as(c_int, data[@as(c_int, 5)]) << @intCast(@as(c_int, 4))))));
    }
    stick_data.*.x.min = data[@as(c_int, 6)];
    {
        const ref = &stick_data.*.x.min;
        ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) | ((@as(c_int, data[@as(c_int, 7)]) & @as(c_int, 15)) << @intCast(@as(c_int, 8))))));
    }
    stick_data.*.y.min = @bitCast(@as(c_short, @truncate(@as(c_int, data[@as(c_int, 7)]) >> @intCast(@as(c_int, 4)))));
    {
        const ref = &stick_data.*.y.min;
        ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) | (@as(c_int, data[@as(c_int, 8)]) << @intCast(@as(c_int, 4))))));
    }
}
pub fn SendBulkData(ctx: [*c]SDL_DriverSwitch2_Context, data: [*c]const Uint8, size: c_uint) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var transferred: c_int = undefined;
    _ = &transferred;
    var res: c_int = ctx.*.libusb.*.bulk_transfer.?(ctx.*.device_handle, ctx.*.out_endpoint, @ptrCast(@alignCast(@constCast(data))), @bitCast(@as(c_uint, @truncate(size))), &transferred, 1000);
    _ = &res;
    if (res < @as(c_int, 0)) {
        return res;
    }
    return transferred;
}
pub fn RecvBulkData(ctx: [*c]SDL_DriverSwitch2_Context, arg_data: [*c]Uint8, arg_size: c_uint) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var data = arg_data;
    _ = &data;
    var size = arg_size;
    _ = &size;
    var transferred: c_int = undefined;
    _ = &transferred;
    var total_transferred: c_int = 0;
    _ = &total_transferred;
    var res: c_int = undefined;
    _ = &res;
    while (size > @as(c_uint, 0)) {
        var current_read: c_uint = size;
        _ = &current_read;
        if (current_read > @as(c_uint, 64)) {
            current_read = 64;
        }
        res = ctx.*.libusb.*.bulk_transfer.?(ctx.*.device_handle, ctx.*.in_endpoint, data, @bitCast(@as(c_uint, @truncate(current_read))), &transferred, 100);
        if (res < @as(c_int, 0)) {
            return res;
        }
        total_transferred += transferred;
        size -%= @bitCast(@as(c_int, transferred));
        data += current_read;
        if (@as(c_uint, @bitCast(@as(c_int, transferred))) < current_read) {
            break;
        }
    }
    return total_transferred;
}
pub fn MapJoystickAxis(timestamp: Uint64, joystick: [*c]SDL_Joystick, axis: Uint8, calib: [*c]const Switch2_AxisCalibration, arg_value: f32, invert: bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var value = arg_value;
    _ = &value;
    var mapped_value: Sint16 = undefined;
    _ = &mapped_value;
    if ((((calib != null) and (@as(c_int, calib.*.neutral) != 0)) and (@as(c_int, calib.*.min) != 0)) and (@as(c_int, calib.*.max) != 0)) {
        value -= @floatFromInt(@as(c_int, calib.*.neutral));
        if (value < @as(f32, @floatFromInt(@as(c_int, 0)))) {
            value /= @floatFromInt(@as(c_int, calib.*.min));
        } else {
            value /= @floatFromInt(@as(c_int, calib.*.max));
        }
        mapped_value = @intFromFloat(if ((value * @as(f32, @floatFromInt(@as(c_int, @as(Sint16, @truncate(@as(c_int, 32767))))))) < @as(f32, @floatFromInt(@as(c_int, @as(Sint16, @truncate(~@as(c_int, 32767))))))) @as(f32, @floatFromInt(@as(c_int, @as(Sint16, @truncate(~@as(c_int, 32767)))))) else if ((value * @as(f32, @floatFromInt(@as(c_int, @as(Sint16, @truncate(@as(c_int, 32767))))))) > @as(f32, @floatFromInt(@as(c_int, @as(Sint16, @truncate(@as(c_int, 32767))))))) @as(f32, @floatFromInt(@as(c_int, @as(Sint16, @truncate(@as(c_int, 32767)))))) else value * @as(f32, @floatFromInt(@as(c_int, @as(Sint16, @truncate(@as(c_int, 32767)))))));
    } else {
        mapped_value = @intFromFloat(HIDAPI_RemapVal(value, @floatFromInt(@as(c_int, 0)), @floatFromInt(@as(c_int, 4096)), @floatFromInt(@as(Sint16, @truncate(~@as(c_int, 32767)))), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767))))));
    }
    if (invert) {
        mapped_value = @truncate(~@as(c_int, mapped_value));
    }
    SDL_SendJoystickAxis(timestamp, joystick, axis, mapped_value);
}
pub fn MapTriggerAxis(timestamp: Uint64, joystick: [*c]SDL_Joystick, axis: Uint8, max: Uint8, value: f32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var mapped_value: Sint16 = @intFromFloat(HIDAPI_RemapVal(if (((value - @as(f32, @floatFromInt(@as(c_int, max)))) / (@as(f32, 232.0) - @as(f32, @floatFromInt(@as(c_int, max))))) < @as(f32, @floatFromInt(@as(c_int, 0)))) @as(f32, @floatFromInt(@as(c_int, 0))) else if (((value - @as(f32, @floatFromInt(@as(c_int, max)))) / (@as(f32, 232.0) - @as(f32, @floatFromInt(@as(c_int, max))))) > @as(f32, @floatFromInt(@as(c_int, 1)))) @as(f32, @floatFromInt(@as(c_int, 1))) else (value - @as(f32, @floatFromInt(@as(c_int, max)))) / (@as(f32, 232.0) - @as(f32, @floatFromInt(@as(c_int, max)))), @floatFromInt(@as(c_int, 0)), @floatFromInt(@as(c_int, 1)), @floatFromInt(@as(Sint16, @truncate(~@as(c_int, 32767)))), @floatFromInt(@as(Sint16, @truncate(@as(c_int, 32767))))));
    _ = &mapped_value;
    SDL_SendJoystickAxis(timestamp, joystick, axis, mapped_value);
}
pub fn UpdateSlotLED(ctx: [*c]SDL_DriverSwitch2_Context) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var set_led_data: [16]Uint8 = [16]Uint8{
        9,
        145,
        0,
        7,
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
        0,
    };
    _ = &set_led_data;
    var reply: [8]Uint8 = [1]Uint8{
        0,
    } ++ @as([7]Uint8, @splat(0));
    _ = &reply;
    const player_pattern: [8]Uint8 = [8]Uint8{
        1,
        3,
        7,
        15,
        9,
        5,
        13,
        6,
    };
    _ = &player_pattern;
    if (ctx.*.player_lights and (ctx.*.player_index >= @as(c_int, 0))) {
        set_led_data[@as(c_int, 8)] = player_pattern[@bitCast(@as(isize, @intCast(__helpers.signedRemainder(ctx.*.player_index, @as(c_int, 8)))))];
    }
    var res: c_int = SendBulkData(ctx, @ptrCast(@alignCast(&set_led_data)), @truncate(@sizeOf(@TypeOf(set_led_data))));
    _ = &res;
    if (res < @as(c_int, 0)) {
        return SDL_SetError_REAL("Couldn't set LED data: %d\n", res);
    }
    return RecvBulkData(ctx, @ptrCast(@alignCast(&reply)), @truncate(@sizeOf(@TypeOf(reply)))) > @as(c_int, 0);
}
pub fn ReadFlashBlock(ctx: [*c]SDL_DriverSwitch2_Context, address: Uint32, out: [*c]Uint8) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var flash_read_command: [16]Uint8 = [16]Uint8{
        2,
        145,
        0,
        1,
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
        0,
    };
    _ = &flash_read_command;
    var buffer: [80]Uint8 = [1]Uint8{
        0,
    } ++ @as([79]Uint8, @splat(0));
    _ = &buffer;
    var res: c_int = undefined;
    _ = &res;
    flash_read_command[@as(c_int, 12)] = @truncate(address);
    flash_read_command[@as(c_int, 13)] = @truncate(address >> @intCast(@as(Uint32, 8)));
    flash_read_command[@as(c_int, 14)] = @truncate(address >> @intCast(@as(Uint32, 16)));
    flash_read_command[@as(c_int, 15)] = @truncate(address >> @intCast(@as(Uint32, 24)));
    res = SendBulkData(ctx, @ptrCast(@alignCast(&flash_read_command)), @truncate(@sizeOf(@TypeOf(flash_read_command))));
    if (res < @as(c_int, 0)) {
        return res;
    }
    res = RecvBulkData(ctx, @ptrCast(@alignCast(&buffer)), @truncate(@sizeOf(@TypeOf(buffer))));
    if (res < @as(c_int, 0)) {
        return res;
    }
    _ = memcpy(@ptrCast(@alignCast(out)), @ptrCast(@alignCast(&buffer[@as(c_int, 16)])), 64);
    return 0;
}
pub fn SDL_PlayerLEDHintChanged(userdata: ?*anyopaque, _: [*c]const u8, _: [*c]const u8, hint: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSwitch2_Context = @ptrCast(@alignCast(userdata));
    _ = &ctx;
    var player_lights: bool = SDL_GetStringBoolean(hint, @"true" != 0);
    _ = &player_lights;
    if (@as(c_int, @intFromBool(player_lights)) != @as(c_int, @intFromBool(ctx.*.player_lights))) {
        ctx.*.player_lights = player_lights;
        _ = UpdateSlotLED(ctx);
        HIDAPI_UpdateDeviceProperties(ctx.*.device);
    }
}
pub fn HIDAPI_DriverSwitch2_RegisterHints(callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = SDL_AddHintCallback_REAL("SDL_JOYSTICK_HIDAPI_SWITCH2", callback, userdata);
}
pub fn HIDAPI_DriverSwitch2_UnregisterHints(callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_RemoveHintCallback_REAL("SDL_JOYSTICK_HIDAPI_SWITCH2", callback, userdata);
}
pub fn HIDAPI_DriverSwitch2_IsEnabled() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI_SWITCH2", SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI", @"true" != 0));
}
pub fn HIDAPI_DriverSwitch2_IsSupportedDevice(_: [*c]SDL_HIDAPI_Device, _: [*c]const u8, arg_type: SDL_GamepadType, vendor_id: Uint16, product_id: Uint16, _: Uint16, _: c_int, _: c_int, _: c_int, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (@as(c_int, vendor_id) == USB_VENDOR_NINTENDO) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                switch (@as(c_int, product_id)) {
                    USB_PRODUCT_NINTENDO_SWITCH2_GAMECUBE_CONTROLLER => {
                        sdl_pc = 5;
                        continue;
                    },
                    USB_PRODUCT_NINTENDO_SWITCH2_JOYCON_LEFT => {
                        sdl_pc = 6;
                        continue;
                    },
                    USB_PRODUCT_NINTENDO_SWITCH2_JOYCON_RIGHT => {
                        sdl_pc = 7;
                        continue;
                    },
                    USB_PRODUCT_NINTENDO_SWITCH2_PRO => {
                        sdl_pc = 8;
                        continue;
                    },
                    else => {
                        sdl_pc = 4;
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
                return @"false" != 0;
            },
            4 => {
                {
                    sdl_pc = 3;
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
                    sdl_pc = 7;
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
                return @"true" != 0;
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverSwitch2_InitBluetooth(_: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("Nintendo Switch2 controllers not supported over Bluetooth");
}
pub fn FindBulkEndpoints(libusb: [*c]SDL_LibUSBContext, handle: ?*libusb_device_handle, bInterfaceNumber: [*c]Uint8, out_endpoint: [*c]Uint8, in_endpoint: [*c]Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var config: [*c]struct_libusb_config_descriptor = undefined;
    _ = &config;
    var found: c_int = 0;
    _ = &found;
    if (libusb.*.get_config_descriptor.?(libusb.*.get_device.?(handle), 0, &config) != @as(c_int, 0)) {
        return @"false" != 0;
    }
    {
        var i: c_int = 0;
        _ = &i;
        while (i < @as(c_int, config.*.bNumInterfaces)) : (i += 1) {
            var iface: [*c]const struct_libusb_interface = &config.*.interface[@bitCast(@as(isize, @intCast(i)))];
            _ = &iface;
            {
                var j: c_int = 0;
                _ = &j;
                while (j < iface.*.num_altsetting) : (j += 1) {
                    var altsetting: [*c]const struct_libusb_interface_descriptor = &iface.*.altsetting[@bitCast(@as(isize, @intCast(j)))];
                    _ = &altsetting;
                    if (@as(c_int, altsetting.*.bInterfaceNumber) == @as(c_int, 1)) {
                        {
                            var k: c_int = 0;
                            _ = &k;
                            while (k < @as(c_int, altsetting.*.bNumEndpoints)) : (k += 1) {
                                var ep: [*c]const struct_libusb_endpoint_descriptor = &altsetting.*.endpoint[@bitCast(@as(isize, @intCast(k)))];
                                _ = &ep;
                                if ((@as(c_int, ep.*.bmAttributes) & LIBUSB_TRANSFER_TYPE_MASK) == LIBUSB_TRANSFER_TYPE_BULK) {
                                    bInterfaceNumber.* = altsetting.*.bInterfaceNumber;
                                    if ((@as(c_int, ep.*.bEndpointAddress) & LIBUSB_ENDPOINT_DIR_MASK) == LIBUSB_ENDPOINT_OUT) {
                                        out_endpoint.* = ep.*.bEndpointAddress;
                                        found |= 1;
                                    }
                                    if ((@as(c_int, ep.*.bEndpointAddress) & LIBUSB_ENDPOINT_DIR_MASK) == LIBUSB_ENDPOINT_IN) {
                                        in_endpoint.* = ep.*.bEndpointAddress;
                                        found |= 2;
                                    }
                                    if (found == @as(c_int, 3)) {
                                        libusb.*.free_config_descriptor.?(config);
                                        return @"true" != 0;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    libusb.*.free_config_descriptor.?(config);
    return @"false" != 0;
}
pub fn HIDAPI_DriverSwitch2_InitUSB(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSwitch2_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    if (!SDL_InitLibUSB(&ctx.*.libusb)) {
        return @"false" != 0;
    }
    ctx.*.device_handle = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(SDL_hid_get_properties_REAL(device.*.dev), "SDL.hidapi.libusb.device.handle", null)));
    if (!(ctx.*.device_handle != null)) {
        return SDL_SetError_REAL("Couldn't get libusb device handle");
    }
    if (!FindBulkEndpoints(ctx.*.libusb, ctx.*.device_handle, &ctx.*.interface_number, &ctx.*.out_endpoint, &ctx.*.in_endpoint)) {
        return SDL_SetError_REAL("Couldn't find bulk endpoints");
    }
    _ = ctx.*.libusb.*.set_auto_detach_kernel_driver.?(ctx.*.device_handle, @"true");
    var res: c_int = ctx.*.libusb.*.claim_interface.?(ctx.*.device_handle, ctx.*.interface_number);
    _ = &res;
    if (res < @as(c_int, 0)) {
        return SDL_SetError_REAL("Couldn't claim interface %d: %d\n", ctx.*.interface_number, res);
    }
    ctx.*.interface_claimed = @"true" != 0;
    var init_sequence: [11][*c]const Uint8 = [11][*c]const Uint8{
        @ptrCast(@alignCast(&@as([8]Uint8, [8]Uint8{
            7,
            145,
            0,
            1,
            0,
            0,
            0,
            0,
        }))),
        @ptrCast(@alignCast(&@as([12]Uint8, [12]Uint8{
            12,
            145,
            0,
            2,
            0,
            4,
            0,
            0,
            39,
            0,
            0,
            0,
        }))),
        @ptrCast(@alignCast(&@as([8]Uint8, [8]Uint8{
            17,
            145,
            0,
            1,
            0,
            0,
            0,
            0,
        }))),
        @ptrCast(@alignCast(&@as([28]Uint8, [28]Uint8{
            10,
            145,
            0,
            8,
            0,
            20,
            0,
            0,
            1,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            53,
            0,
            70,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
        }))),
        @ptrCast(@alignCast(&@as([12]Uint8, [12]Uint8{
            12,
            145,
            0,
            4,
            0,
            4,
            0,
            0,
            39,
            0,
            0,
            0,
        }))),
        @ptrCast(@alignCast(&@as([8]Uint8, [8]Uint8{
            1,
            145,
            0,
            12,
            0,
            0,
            0,
            0,
        }))),
        @ptrCast(@alignCast(&@as([8]Uint8, [8]Uint8{
            1,
            145,
            0,
            1,
            0,
            0,
            0,
            0,
        }))),
        @ptrCast(@alignCast(&@as([12]Uint8, [12]Uint8{
            8,
            145,
            0,
            2,
            0,
            4,
            0,
            0,
            1,
            0,
            0,
            0,
        }))),
        @ptrCast(@alignCast(&@as([12]Uint8, [12]Uint8{
            3,
            145,
            0,
            10,
            0,
            4,
            0,
            0,
            5,
            0,
            0,
            0,
        }))),
        @ptrCast(@alignCast(&@as([16]Uint8, [16]Uint8{
            3,
            145,
            0,
            13,
            0,
            8,
            0,
            0,
            1,
            0,
            255,
            255,
            255,
            255,
            255,
            255,
        }))),
        null,
    };
    _ = &init_sequence;
    var calibration_data: [64]u8 = [1]u8{
        0,
    } ++ @as([63]u8, @splat(0));
    _ = &calibration_data;
    res = ReadFlashBlock(ctx, 77824, @ptrCast(@alignCast(&calibration_data)));
    if (res < @as(c_int, 0)) {
        SDL_LogWarn_REAL(SDL_LOG_CATEGORY_INPUT, "Couldn't read serial number: %d", res);
    } else {
        var serial: [17]u8 = [1]u8{
            0,
        } ++ @as([16]u8, @splat(0));
        _ = &serial;
        _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&serial)), @ptrCast(@alignCast(&calibration_data[@as(c_int, 2)])), @sizeOf(@TypeOf(serial)));
        HIDAPI_SetDeviceSerial(device, @ptrCast(@alignCast(&serial)));
    }
    res = ReadFlashBlock(ctx, 77888, @ptrCast(@alignCast(&calibration_data)));
    if (res < @as(c_int, 0)) {
        SDL_LogWarn_REAL(SDL_LOG_CATEGORY_INPUT, "Couldn't read factory calibration data: %d", res);
    } else {
        ctx.*.gyro_bias_x = @as([*c]f32, @ptrCast(@alignCast(&calibration_data[@as(c_int, 4)]))).*;
        ctx.*.gyro_bias_y = @as([*c]f32, @ptrCast(@alignCast(&calibration_data[@as(c_int, 8)]))).*;
        ctx.*.gyro_bias_z = @as([*c]f32, @ptrCast(@alignCast(&calibration_data[@as(c_int, 12)]))).*;
    }
    res = ReadFlashBlock(ctx, 77952, @ptrCast(@alignCast(&calibration_data)));
    if (res < @as(c_int, 0)) {
        SDL_LogWarn_REAL(SDL_LOG_CATEGORY_INPUT, "Couldn't read factory calibration data: %d", res);
    } else {
        ParseStickCalibration(&ctx.*.left_stick, &calibration_data[@as(c_int, 40)]);
    }
    res = ReadFlashBlock(ctx, 78016, @ptrCast(@alignCast(&calibration_data)));
    if (res < @as(c_int, 0)) {
        SDL_LogWarn_REAL(SDL_LOG_CATEGORY_INPUT, "Couldn't read factory calibration data: %d", res);
    } else {
        ParseStickCalibration(&ctx.*.right_stick, &calibration_data[@as(c_int, 40)]);
    }
    res = ReadFlashBlock(ctx, 78080, @ptrCast(@alignCast(&calibration_data)));
    if (res < @as(c_int, 0)) {
        SDL_LogWarn_REAL(SDL_LOG_CATEGORY_INPUT, "Couldn't read factory calibration data: %d", res);
    } else {
        ctx.*.accel_bias_x = @as([*c]f32, @ptrCast(@alignCast(&calibration_data[@as(c_int, 12)]))).*;
        ctx.*.accel_bias_y = @as([*c]f32, @ptrCast(@alignCast(&calibration_data[@as(c_int, 16)]))).*;
        ctx.*.accel_bias_z = @as([*c]f32, @ptrCast(@alignCast(&calibration_data[@as(c_int, 20)]))).*;
    }
    if (@as(c_int, device.*.product_id) == USB_PRODUCT_NINTENDO_SWITCH2_GAMECUBE_CONTROLLER) {
        res = ReadFlashBlock(ctx, 78144, @ptrCast(@alignCast(&calibration_data)));
        if (res < @as(c_int, 0)) {
            SDL_LogWarn_REAL(SDL_LOG_CATEGORY_INPUT, "Couldn't read factory calibration data: %d", res);
        } else {
            ctx.*.left_trigger_zero = calibration_data[@as(c_int, 0)];
            ctx.*.right_trigger_zero = calibration_data[@as(c_int, 1)];
        }
    }
    res = ReadFlashBlock(ctx, 2080832, @ptrCast(@alignCast(&calibration_data)));
    if (res < @as(c_int, 0)) {
        SDL_LogWarn_REAL(SDL_LOG_CATEGORY_INPUT, "Couldn't read user calibration data: %d", res);
    } else if ((@as(c_int, calibration_data[@as(c_int, 0)]) == @as(c_int, 178)) and (@as(c_int, calibration_data[@as(c_int, 1)]) == @as(c_int, 161))) {
        ParseStickCalibration(&ctx.*.left_stick, &calibration_data[@as(c_int, 2)]);
    }
    res = ReadFlashBlock(ctx, 2080896, @ptrCast(@alignCast(&calibration_data)));
    if (res < @as(c_int, 0)) {
        SDL_LogWarn_REAL(SDL_LOG_CATEGORY_INPUT, "Couldn't read user calibration data: %d", res);
    } else if ((@as(c_int, calibration_data[@as(c_int, 0)]) == @as(c_int, 178)) and (@as(c_int, calibration_data[@as(c_int, 1)]) == @as(c_int, 161))) {
        ParseStickCalibration(&ctx.*.right_stick, &calibration_data[@as(c_int, 2)]);
    }
    {
        var i: c_int = 0;
        _ = &i;
        while (init_sequence[@bitCast(@as(isize, @intCast(i)))] != null) : (i += 1) {
            res = SendBulkData(ctx, init_sequence[@bitCast(@as(isize, @intCast(i)))], @bitCast(@as(c_int, @as(c_int, init_sequence[@bitCast(@as(isize, @intCast(i)))][@as(c_int, 5)]) + @as(c_int, 8))));
            if (res < @as(c_int, 0)) {
                return SDL_SetError_REAL("Couldn't send initialization data: %d\n", res);
            }
            _ = RecvBulkData(ctx, @ptrCast(@alignCast(&calibration_data)), 64);
        }
    }
    return @"true" != 0;
}
pub fn HIDAPI_DriverSwitch2_InitDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSwitch2_Context = undefined;
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
                if (device.*.is_bluetooth) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                if (!HIDAPI_DriverSwitch2_InitBluetooth(device)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            5 => {
                if (!HIDAPI_DriverSwitch2_InitUSB(device)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            6 => {
                ctx.*.sensor_ts_coeff = 10000;
                ctx.*.gyro_coeff = 34.799999;
                switch (@as(c_int, device.*.product_id)) {
                    USB_PRODUCT_NINTENDO_SWITCH2_GAMECUBE_CONTROLLER => {
                        sdl_pc = 14;
                        continue;
                    },
                    USB_PRODUCT_NINTENDO_SWITCH2_PRO => {
                        sdl_pc = 15;
                        continue;
                    },
                    else => {
                        sdl_pc = 16;
                        continue;
                    },
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
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            10 => {
                return @"false" != 0;
            },
            11 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            13 => {
                return HIDAPI_JoystickConnected(device, null);
            },
            14 => {
                HIDAPI_SetDeviceName(device, "Nintendo GameCube Controller");
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            15 => {
                HIDAPI_SetDeviceName(device, "Nintendo Switch Pro Controller");
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            16 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverSwitch2_GetDevicePlayerIndex(_: [*c]SDL_HIDAPI_Device, _: SDL_JoystickID) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return -@as(c_int, 1);
}
pub fn HIDAPI_DriverSwitch2_SetDevicePlayerIndex(device: [*c]SDL_HIDAPI_Device, _: SDL_JoystickID, player_index: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSwitch2_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    if (!(ctx.*.joystick != null)) {
        return;
    }
    ctx.*.player_index = player_index;
    _ = UpdateSlotLED(ctx);
}
pub fn HIDAPI_DriverSwitch2_OpenJoystick(device: [*c]SDL_HIDAPI_Device, joystick: [*c]SDL_Joystick) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSwitch2_Context = undefined;
    _ = &ctx;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                ctx = @ptrCast(@alignCast(device.*.context));
                ctx.*.joystick = joystick;
                ctx.*.player_index = SDL_GetJoystickPlayerIndex_REAL(joystick);
                ctx.*.player_lights = SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI_SWITCH_PLAYER_LED", @"true" != 0);
                _ = UpdateSlotLED(ctx);
                _ = SDL_AddHintCallback_REAL("SDL_JOYSTICK_HIDAPI_SWITCH_PLAYER_LED", SDL_PlayerLEDHintChanged, @ptrCast(@alignCast(ctx)));
                if (!(ctx.*.device.*.parent != null)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                SDL_PrivateJoystickAddSensor(joystick, SDL_SENSOR_GYRO, 250.0);
                SDL_PrivateJoystickAddSensor(joystick, SDL_SENSOR_ACCEL, 250.0);
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
                switch (@as(c_int, device.*.product_id)) {
                    USB_PRODUCT_NINTENDO_SWITCH2_GAMECUBE_CONTROLLER => {
                        sdl_pc = 5;
                        continue;
                    },
                    USB_PRODUCT_NINTENDO_SWITCH2_JOYCON_LEFT => {
                        sdl_pc = 6;
                        continue;
                    },
                    USB_PRODUCT_NINTENDO_SWITCH2_JOYCON_RIGHT => {
                        sdl_pc = 10;
                        continue;
                    },
                    USB_PRODUCT_NINTENDO_SWITCH2_PRO => {
                        sdl_pc = 14;
                        continue;
                    },
                    else => {
                        sdl_pc = 15;
                        continue;
                    },
                }
            },
            4 => {
                joystick.*.naxes = SDL_GAMEPAD_AXIS_COUNT;
                joystick.*.nhats = 1;
                ctx.*.rumble_hi_freq = 391;
                ctx.*.rumble_lo_freq = 274;
                ctx.*.vertical_mode = SDL_GetHintBoolean_REAL("SDL_JOYSTICK_HIDAPI_VERTICAL_JOY_CONS", @"false" != 0);
                return @"true" != 0;
            },
            5 => {
                joystick.*.nbuttons = SDL_GAMEPAD_NUM_SWITCH2_GAMECUBE_BUTTONS;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            6 => {
                if (ctx.*.device.*.parent != null) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                SDL_PrivateJoystickAddSensor(joystick, SDL_SENSOR_GYRO_L, 250.0);
                SDL_PrivateJoystickAddSensor(joystick, SDL_SENSOR_ACCEL_L, 250.0);
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
                joystick.*.nbuttons = SDL_GAMEPAD_NUM_SWITCH2_JOYCON_BUTTONS;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            10 => {
                if (ctx.*.device.*.parent != null) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                SDL_PrivateJoystickAddSensor(joystick, SDL_SENSOR_GYRO, 250.0);
                SDL_PrivateJoystickAddSensor(joystick, SDL_SENSOR_ACCEL, 250.0);
                SDL_PrivateJoystickAddSensor(joystick, SDL_SENSOR_GYRO_R, 250.0);
                SDL_PrivateJoystickAddSensor(joystick, SDL_SENSOR_ACCEL_R, 250.0);
                {
                    sdl_pc = 13;
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
                joystick.*.nbuttons = SDL_GAMEPAD_NUM_SWITCH2_JOYCON_BUTTONS;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            14 => {
                joystick.*.nbuttons = SDL_GAMEPAD_NUM_SWITCH2_PRO_BUTTONS;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            15 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverSwitch2_RumbleJoystick(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, low_frequency_rumble: Uint16, high_frequency_rumble: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSwitch2_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    if ((@as(c_int, low_frequency_rumble) != @as(c_int, ctx.*.rumble_lo_amp)) or (@as(c_int, high_frequency_rumble) != @as(c_int, ctx.*.rumble_hi_amp))) {
        ctx.*.rumble_lo_amp = low_frequency_rumble;
        ctx.*.rumble_hi_amp = high_frequency_rumble;
        ctx.*.rumble_updated = @"true" != 0;
    }
    return @"true" != 0;
}
pub fn HIDAPI_DriverSwitch2_RumbleJoystickTriggers(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: Uint16, _: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverSwitch2_GetJoystickCapabilities(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSwitch2_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    var result: Uint32 = SDL_JOYSTICK_CAP_RUMBLE;
    _ = &result;
    if (ctx.*.player_lights) {
        result |= SDL_JOYSTICK_CAP_PLAYER_LED;
    }
    return result;
}
pub fn HIDAPI_DriverSwitch2_SetJoystickLED(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: Uint8, _: Uint8, _: Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverSwitch2_SendJoystickEffect(_: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, _: ?*const anyopaque, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn HIDAPI_DriverSwitch2_SetJoystickSensorsEnabled(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick, enabled: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSwitch2_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    if (ctx.*.sensors_ready) {
        var data: [12]Uint8 = [12]Uint8{
            12,
            145,
            0,
            4,
            0,
            4,
            0,
            0,
            35,
            0,
            0,
            0,
        };
        _ = &data;
        var reply: [12]u8 = [1]u8{
            0,
        } ++ @as([11]u8, @splat(0));
        _ = &reply;
        if (enabled) {
            {
                const ref = &data[@as(c_int, 8)];
                ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | @as(c_int, 4))));
            }
        }
        var res: c_int = SendBulkData(ctx, @ptrCast(@alignCast(&data)), @truncate(@sizeOf(@TypeOf(data))));
        _ = &res;
        if (res < @as(c_int, 0)) {
            return SDL_SetError_REAL("Couldn't set sensors enabled: %d\n", res);
        }
        _ = RecvBulkData(ctx, @ptrCast(@alignCast(&reply)), @truncate(@sizeOf(@TypeOf(reply))));
    }
    ctx.*.sensors_enabled = @"true" != 0;
    return @"true" != 0;
}
pub fn HandleGameCubeState(timestamp: Uint64, joystick: [*c]SDL_Joystick, ctx: [*c]SDL_DriverSwitch2_Context, data: [*c]Uint8, _: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (@as(c_int, data[@as(c_int, 5)]) != @as(c_int, ctx.*.last_state[@as(c_int, 5)])) {
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_WEST, (@as(c_int, data[@as(c_int, 5)]) & @as(c_int, 1)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_NORTH, (@as(c_int, data[@as(c_int, 5)]) & @as(c_int, 2)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SOUTH, (@as(c_int, data[@as(c_int, 5)]) & @as(c_int, 4)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_EAST, (@as(c_int, data[@as(c_int, 5)]) & @as(c_int, 8)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SWITCH2_GAMECUBE_RIGHT_TRIGGER, (@as(c_int, data[@as(c_int, 5)]) & @as(c_int, 64)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SWITCH2_GAMECUBE_RIGHT_SHOULDER, (@as(c_int, data[@as(c_int, 5)]) & @as(c_int, 128)) != @as(c_int, 0));
    }
    if (@as(c_int, data[@as(c_int, 6)]) != @as(c_int, ctx.*.last_state[@as(c_int, 6)])) {
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SWITCH2_GAMECUBE_START, (@as(c_int, data[@as(c_int, 6)]) & @as(c_int, 2)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SWITCH2_GAMECUBE_GUIDE, (@as(c_int, data[@as(c_int, 6)]) & @as(c_int, 16)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SWITCH2_GAMECUBE_SHARE, (@as(c_int, data[@as(c_int, 6)]) & @as(c_int, 32)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SWITCH2_GAMECUBE_C, (@as(c_int, data[@as(c_int, 6)]) & @as(c_int, 64)) != @as(c_int, 0));
    }
    if (@as(c_int, data[@as(c_int, 7)]) != @as(c_int, ctx.*.last_state[@as(c_int, 7)])) {
        var hat: Uint8 = 0;
        _ = &hat;
        if ((@as(c_int, data[@as(c_int, 7)]) & @as(c_int, 1)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_DOWN);
            }
        }
        if ((@as(c_int, data[@as(c_int, 7)]) & @as(c_int, 2)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_UP);
            }
        }
        if ((@as(c_int, data[@as(c_int, 7)]) & @as(c_int, 4)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_RIGHT);
            }
        }
        if ((@as(c_int, data[@as(c_int, 7)]) & @as(c_int, 8)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_LEFT);
            }
        }
        SDL_SendJoystickHat(timestamp, joystick, 0, hat);
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SWITCH2_GAMECUBE_LEFT_TRIGGER, (@as(c_int, data[@as(c_int, 7)]) & @as(c_int, 64)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SWITCH2_GAMECUBE_LEFT_SHOULDER, (@as(c_int, data[@as(c_int, 7)]) & @as(c_int, 128)) != @as(c_int, 0));
    }
    MapTriggerAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFT_TRIGGER, ctx.*.left_trigger_zero, @floatFromInt(data[@as(c_int, 61)]));
    MapTriggerAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHT_TRIGGER, ctx.*.right_trigger_zero, @floatFromInt(data[@as(c_int, 62)]));
    MapJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, &ctx.*.left_stick.x, @floatFromInt(@as(c_int, data[@as(c_int, 11)]) | ((@as(c_int, data[@as(c_int, 12)]) & @as(c_int, 15)) << @intCast(@as(c_int, 8)))), @"false" != 0);
    MapJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, &ctx.*.left_stick.y, @floatFromInt((@as(c_int, data[@as(c_int, 12)]) >> @intCast(@as(c_int, 4))) | (@as(c_int, data[@as(c_int, 13)]) << @intCast(@as(c_int, 4)))), @"true" != 0);
    MapJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, &ctx.*.right_stick.x, @floatFromInt(@as(c_int, data[@as(c_int, 14)]) | ((@as(c_int, data[@as(c_int, 15)]) & @as(c_int, 15)) << @intCast(@as(c_int, 8)))), @"false" != 0);
    MapJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, &ctx.*.right_stick.y, @floatFromInt((@as(c_int, data[@as(c_int, 15)]) >> @intCast(@as(c_int, 4))) | (@as(c_int, data[@as(c_int, 16)]) << @intCast(@as(c_int, 4)))), @"true" != 0);
}
pub fn HandleCombinedControllerStateL(timestamp: Uint64, joystick: [*c]SDL_Joystick, ctx: [*c]SDL_DriverSwitch2_Context, data: [*c]Uint8, _: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (@as(c_int, data[@as(c_int, 6)]) != @as(c_int, ctx.*.last_state[@as(c_int, 6)])) {
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_BACK, (@as(c_int, data[@as(c_int, 6)]) & @as(c_int, 1)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_STICK, (@as(c_int, data[@as(c_int, 6)]) & @as(c_int, 8)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SWITCH2_JOYCON_SHARE, (@as(c_int, data[@as(c_int, 6)]) & @as(c_int, 32)) != @as(c_int, 0));
    }
    if (@as(c_int, data[@as(c_int, 7)]) != @as(c_int, ctx.*.last_state[@as(c_int, 7)])) {
        var hat: Uint8 = 0;
        _ = &hat;
        if ((@as(c_int, data[@as(c_int, 7)]) & @as(c_int, 1)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_DOWN);
            }
        }
        if ((@as(c_int, data[@as(c_int, 7)]) & @as(c_int, 2)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_UP);
            }
        }
        if ((@as(c_int, data[@as(c_int, 7)]) & @as(c_int, 4)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_RIGHT);
            }
        }
        if ((@as(c_int, data[@as(c_int, 7)]) & @as(c_int, 8)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_LEFT);
            }
        }
        SDL_SendJoystickHat(timestamp, joystick, 0, hat);
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_SHOULDER, (@as(c_int, data[@as(c_int, 7)]) & @as(c_int, 64)) != @as(c_int, 0));
    }
    if (@as(c_int, data[@as(c_int, 8)]) != @as(c_int, ctx.*.last_state[@as(c_int, 8)])) {
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SWITCH2_JOYCON_LEFT_PADDLE1, (@as(c_int, data[@as(c_int, 8)]) & @as(c_int, 2)) != @as(c_int, 0));
    }
    var axis: Sint16 = @truncate(if ((@as(c_int, data[@as(c_int, 7)]) & @as(c_int, 128)) != 0) @as(c_int, 32767) else -@as(c_int, 32768));
    _ = &axis;
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFT_TRIGGER, axis);
    MapJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, &ctx.*.left_stick.x, @floatFromInt(@as(c_int, data[@as(c_int, 11)]) | ((@as(c_int, data[@as(c_int, 12)]) & @as(c_int, 15)) << @intCast(@as(c_int, 8)))), @"false" != 0);
    MapJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, &ctx.*.left_stick.y, @floatFromInt((@as(c_int, data[@as(c_int, 12)]) >> @intCast(@as(c_int, 4))) | (@as(c_int, data[@as(c_int, 13)]) << @intCast(@as(c_int, 4)))), @"true" != 0);
}
pub fn HandleMiniControllerStateL(timestamp: Uint64, joystick: [*c]SDL_Joystick, ctx: [*c]SDL_DriverSwitch2_Context, data: [*c]Uint8, _: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (@as(c_int, data[@as(c_int, 6)]) != @as(c_int, ctx.*.last_state[@as(c_int, 6)])) {
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_START, (@as(c_int, data[@as(c_int, 6)]) & @as(c_int, 1)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_STICK, (@as(c_int, data[@as(c_int, 6)]) & @as(c_int, 8)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_GUIDE, (@as(c_int, data[@as(c_int, 6)]) & @as(c_int, 32)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SWITCH2_JOYCON_SHARE, (@as(c_int, data[@as(c_int, 6)]) & @as(c_int, 16)) != @as(c_int, 0));
    }
    if (@as(c_int, data[@as(c_int, 7)]) != @as(c_int, ctx.*.last_state[@as(c_int, 7)])) {
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_WEST, (@as(c_int, data[@as(c_int, 7)]) & @as(c_int, 1)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_NORTH, (@as(c_int, data[@as(c_int, 7)]) & @as(c_int, 2)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SOUTH, (@as(c_int, data[@as(c_int, 7)]) & @as(c_int, 4)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_EAST, (@as(c_int, data[@as(c_int, 7)]) & @as(c_int, 8)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER, (@as(c_int, data[@as(c_int, 7)]) & @as(c_int, 16)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_SHOULDER, (@as(c_int, data[@as(c_int, 7)]) & @as(c_int, 32)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SWITCH2_JOYCON_LEFT_PADDLE1, (@as(c_int, data[@as(c_int, 7)]) & @as(c_int, 64)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SWITCH2_JOYCON_LEFT_PADDLE2, (@as(c_int, data[@as(c_int, 7)]) & @as(c_int, 128)) != @as(c_int, 0));
    }
    MapJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, &ctx.*.left_stick.y, @floatFromInt((@as(c_int, data[@as(c_int, 12)]) >> @intCast(@as(c_int, 4))) | (@as(c_int, data[@as(c_int, 13)]) << @intCast(@as(c_int, 4)))), @"true" != 0);
    MapJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, &ctx.*.left_stick.x, @floatFromInt(@as(c_int, data[@as(c_int, 11)]) | ((@as(c_int, data[@as(c_int, 12)]) & @as(c_int, 15)) << @intCast(@as(c_int, 8)))), @"true" != 0);
}
pub fn HandleCombinedControllerStateR(timestamp: Uint64, joystick: [*c]SDL_Joystick, ctx: [*c]SDL_DriverSwitch2_Context, data: [*c]Uint8, _: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (@as(c_int, data[@as(c_int, 5)]) != @as(c_int, ctx.*.last_state[@as(c_int, 5)])) {
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_WEST, (@as(c_int, data[@as(c_int, 5)]) & @as(c_int, 1)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_NORTH, (@as(c_int, data[@as(c_int, 5)]) & @as(c_int, 2)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SOUTH, (@as(c_int, data[@as(c_int, 5)]) & @as(c_int, 4)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_EAST, (@as(c_int, data[@as(c_int, 5)]) & @as(c_int, 8)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER, (@as(c_int, data[@as(c_int, 5)]) & @as(c_int, 64)) != @as(c_int, 0));
    }
    if (@as(c_int, data[@as(c_int, 6)]) != @as(c_int, ctx.*.last_state[@as(c_int, 6)])) {
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_START, (@as(c_int, data[@as(c_int, 6)]) & @as(c_int, 2)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_STICK, (@as(c_int, data[@as(c_int, 6)]) & @as(c_int, 4)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_GUIDE, (@as(c_int, data[@as(c_int, 6)]) & @as(c_int, 16)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SWITCH2_JOYCON_C, (@as(c_int, data[@as(c_int, 6)]) & @as(c_int, 64)) != @as(c_int, 0));
    }
    if (@as(c_int, data[@as(c_int, 8)]) != @as(c_int, ctx.*.last_state[@as(c_int, 8)])) {
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SWITCH2_JOYCON_RIGHT_PADDLE1, (@as(c_int, data[@as(c_int, 8)]) & @as(c_int, 1)) != @as(c_int, 0));
    }
    var axis: Sint16 = @truncate(if ((@as(c_int, data[@as(c_int, 5)]) & @as(c_int, 128)) != 0) @as(c_int, 32767) else -@as(c_int, 32768));
    _ = &axis;
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHT_TRIGGER, axis);
    MapJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, &ctx.*.left_stick.x, @floatFromInt(@as(c_int, data[@as(c_int, 14)]) | ((@as(c_int, data[@as(c_int, 15)]) & @as(c_int, 15)) << @intCast(@as(c_int, 8)))), @"false" != 0);
    MapJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, &ctx.*.left_stick.y, @floatFromInt((@as(c_int, data[@as(c_int, 15)]) >> @intCast(@as(c_int, 4))) | (@as(c_int, data[@as(c_int, 16)]) << @intCast(@as(c_int, 4)))), @"true" != 0);
}
pub fn HandleMiniControllerStateR(timestamp: Uint64, joystick: [*c]SDL_Joystick, ctx: [*c]SDL_DriverSwitch2_Context, data: [*c]Uint8, _: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (@as(c_int, data[@as(c_int, 5)]) != @as(c_int, ctx.*.last_state[@as(c_int, 5)])) {
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_WEST, (@as(c_int, data[@as(c_int, 5)]) & @as(c_int, 1)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_NORTH, (@as(c_int, data[@as(c_int, 5)]) & @as(c_int, 2)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SOUTH, (@as(c_int, data[@as(c_int, 5)]) & @as(c_int, 4)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_EAST, (@as(c_int, data[@as(c_int, 5)]) & @as(c_int, 8)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER, (@as(c_int, data[@as(c_int, 5)]) & @as(c_int, 16)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_SHOULDER, (@as(c_int, data[@as(c_int, 5)]) & @as(c_int, 32)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SWITCH2_JOYCON_RIGHT_PADDLE1, (@as(c_int, data[@as(c_int, 5)]) & @as(c_int, 64)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SWITCH2_JOYCON_RIGHT_PADDLE2, (@as(c_int, data[@as(c_int, 5)]) & @as(c_int, 128)) != @as(c_int, 0));
    }
    if (@as(c_int, data[@as(c_int, 6)]) != @as(c_int, ctx.*.last_state[@as(c_int, 6)])) {
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_START, (@as(c_int, data[@as(c_int, 6)]) & @as(c_int, 2)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_STICK, (@as(c_int, data[@as(c_int, 6)]) & @as(c_int, 4)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_GUIDE, (@as(c_int, data[@as(c_int, 6)]) & @as(c_int, 16)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SWITCH2_JOYCON_C, (@as(c_int, data[@as(c_int, 6)]) & @as(c_int, 64)) != @as(c_int, 0));
    }
    MapJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, &ctx.*.left_stick.y, @floatFromInt((@as(c_int, data[@as(c_int, 15)]) >> @intCast(@as(c_int, 4))) | (@as(c_int, data[@as(c_int, 16)]) << @intCast(@as(c_int, 4)))), @"false" != 0);
    MapJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, &ctx.*.left_stick.x, @floatFromInt(@as(c_int, data[@as(c_int, 14)]) | ((@as(c_int, data[@as(c_int, 15)]) & @as(c_int, 15)) << @intCast(@as(c_int, 8)))), @"false" != 0);
}
pub fn HandleSwitchProState(timestamp: Uint64, joystick: [*c]SDL_Joystick, ctx: [*c]SDL_DriverSwitch2_Context, data: [*c]Uint8, _: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var axis: Sint16 = undefined;
    _ = &axis;
    if (@as(c_int, data[@as(c_int, 5)]) != @as(c_int, ctx.*.last_state[@as(c_int, 5)])) {
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_WEST, (@as(c_int, data[@as(c_int, 5)]) & @as(c_int, 1)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_NORTH, (@as(c_int, data[@as(c_int, 5)]) & @as(c_int, 2)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SOUTH, (@as(c_int, data[@as(c_int, 5)]) & @as(c_int, 4)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_EAST, (@as(c_int, data[@as(c_int, 5)]) & @as(c_int, 8)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER, (@as(c_int, data[@as(c_int, 5)]) & @as(c_int, 64)) != @as(c_int, 0));
    }
    if (@as(c_int, data[@as(c_int, 6)]) != @as(c_int, ctx.*.last_state[@as(c_int, 6)])) {
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_BACK, (@as(c_int, data[@as(c_int, 6)]) & @as(c_int, 1)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_START, (@as(c_int, data[@as(c_int, 6)]) & @as(c_int, 2)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_RIGHT_STICK, (@as(c_int, data[@as(c_int, 6)]) & @as(c_int, 4)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_STICK, (@as(c_int, data[@as(c_int, 6)]) & @as(c_int, 8)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_GUIDE, (@as(c_int, data[@as(c_int, 6)]) & @as(c_int, 16)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SWITCH2_PRO_SHARE, (@as(c_int, data[@as(c_int, 6)]) & @as(c_int, 32)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SWITCH2_PRO_C, (@as(c_int, data[@as(c_int, 6)]) & @as(c_int, 64)) != @as(c_int, 0));
    }
    if (@as(c_int, data[@as(c_int, 7)]) != @as(c_int, ctx.*.last_state[@as(c_int, 7)])) {
        var hat: Uint8 = 0;
        _ = &hat;
        if ((@as(c_int, data[@as(c_int, 7)]) & @as(c_int, 1)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_DOWN);
            }
        }
        if ((@as(c_int, data[@as(c_int, 7)]) & @as(c_int, 2)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_UP);
            }
        }
        if ((@as(c_int, data[@as(c_int, 7)]) & @as(c_int, 4)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_RIGHT);
            }
        }
        if ((@as(c_int, data[@as(c_int, 7)]) & @as(c_int, 8)) != 0) {
            {
                const ref = &hat;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_HAT_LEFT);
            }
        }
        SDL_SendJoystickHat(timestamp, joystick, 0, hat);
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_LEFT_SHOULDER, (@as(c_int, data[@as(c_int, 7)]) & @as(c_int, 64)) != @as(c_int, 0));
    }
    if (@as(c_int, data[@as(c_int, 8)]) != @as(c_int, ctx.*.last_state[@as(c_int, 8)])) {
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SWITCH2_PRO_RIGHT_PADDLE, (@as(c_int, data[@as(c_int, 8)]) & @as(c_int, 1)) != @as(c_int, 0));
        SDL_SendJoystickButton(timestamp, joystick, SDL_GAMEPAD_BUTTON_SWITCH2_PRO_LEFT_PADDLE, (@as(c_int, data[@as(c_int, 8)]) & @as(c_int, 2)) != @as(c_int, 0));
    }
    axis = @truncate(if ((@as(c_int, data[@as(c_int, 5)]) & @as(c_int, 128)) != 0) @as(c_int, 32767) else -@as(c_int, 32768));
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHT_TRIGGER, axis);
    axis = @truncate(if ((@as(c_int, data[@as(c_int, 7)]) & @as(c_int, 128)) != 0) @as(c_int, 32767) else -@as(c_int, 32768));
    SDL_SendJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFT_TRIGGER, axis);
    MapJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTX, &ctx.*.left_stick.x, @floatFromInt(@as(c_int, data[@as(c_int, 11)]) | ((@as(c_int, data[@as(c_int, 12)]) & @as(c_int, 15)) << @intCast(@as(c_int, 8)))), @"false" != 0);
    MapJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_LEFTY, &ctx.*.left_stick.y, @floatFromInt((@as(c_int, data[@as(c_int, 12)]) >> @intCast(@as(c_int, 4))) | (@as(c_int, data[@as(c_int, 13)]) << @intCast(@as(c_int, 4)))), @"true" != 0);
    MapJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTX, &ctx.*.right_stick.x, @floatFromInt(@as(c_int, data[@as(c_int, 14)]) | ((@as(c_int, data[@as(c_int, 15)]) & @as(c_int, 15)) << @intCast(@as(c_int, 8)))), @"false" != 0);
    MapJoystickAxis(timestamp, joystick, SDL_GAMEPAD_AXIS_RIGHTY, &ctx.*.right_stick.y, @floatFromInt((@as(c_int, data[@as(c_int, 15)]) >> @intCast(@as(c_int, 4))) | (@as(c_int, data[@as(c_int, 16)]) << @intCast(@as(c_int, 4)))), @"true" != 0);
}
pub fn EncodeHDRumble(high_freq: Uint16, high_amp: Uint16, low_freq: Uint16, low_amp: Uint16, rumble_data: [*c]Uint8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    rumble_data[@as(c_int, 0)] = @bitCast(@as(i8, @truncate(@as(c_int, high_freq) & @as(c_int, 255))));
    rumble_data[@as(c_int, 1)] = @bitCast(@as(i8, @truncate(((@as(c_int, high_amp) >> @intCast(@as(c_int, 4))) & @as(c_int, 252)) | ((@as(c_int, high_freq) >> @intCast(@as(c_int, 8))) & @as(c_int, 3)))));
    rumble_data[@as(c_int, 2)] = @bitCast(@as(i8, @truncate((@as(c_int, high_amp) >> @intCast(@as(c_int, 12))) | (@as(c_int, low_freq) << @intCast(@as(c_int, 4))))));
    rumble_data[@as(c_int, 3)] = @bitCast(@as(i8, @truncate((@as(c_int, low_amp) & @as(c_int, 192)) | ((@as(c_int, low_freq) >> @intCast(@as(c_int, 4))) & @as(c_int, 63)))));
    rumble_data[@as(c_int, 4)] = @bitCast(@as(i8, @truncate(@as(c_int, low_amp) >> @intCast(@as(c_int, 8)))));
}
pub fn UpdateRumble(ctx: [*c]SDL_DriverSwitch2_Context) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var timestamp: Uint64 = undefined;
    _ = &timestamp;
    var interval: Uint64 = undefined;
    _ = &interval;
    var rumble_data: [64]u8 = undefined;
    _ = &rumble_data;
    var rumble_max: Uint16 = undefined;
    _ = &rumble_max;
    var low_amp: Uint16 = undefined;
    _ = &low_amp;
    var high_amp: Uint16 = undefined;
    _ = &high_amp;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if ((!ctx.*.rumble_updated and !(@as(c_int, ctx.*.rumble_lo_amp) != 0)) and !(@as(c_int, ctx.*.rumble_hi_amp) != 0)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
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
                timestamp = SDL_GetTicks_REAL();
                interval = RUMBLE_INTERVAL;
                if (timestamp < ctx.*.rumble_timestamp) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
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
                if (!SDL_HIDAPI_LockRumble()) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
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
                rumble_data = [1]u8{
                    0,
                } ++ @as([63]u8, @splat(0));
                if (@as(c_int, ctx.*.device.*.product_id) == USB_PRODUCT_NINTENDO_SWITCH2_GAMECUBE_CONTROLLER) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                rumble_max = @bitCast(@as(c_short, @truncate(if (@as(c_int, ctx.*.rumble_lo_amp) > @as(c_int, ctx.*.rumble_hi_amp)) @as(c_int, ctx.*.rumble_lo_amp) else @as(c_int, ctx.*.rumble_hi_amp))));
                rumble_data[@as(c_int, 0)] = 3;
                rumble_data[@as(c_int, 1)] = @truncate(@as(Uint32, 80) | (ctx.*.rumble_seq & @as(Uint32, 15)));
                if (@as(c_int, rumble_max) == @as(c_int, 0)) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            11 => {
                low_amp = @bitCast(@as(c_short, @truncate(@divTrunc(@as(c_int, ctx.*.rumble_lo_amp) * RUMBLE_MAX, @as(c_int, 65535)))));
                high_amp = @bitCast(@as(c_short, @truncate(@divTrunc(@as(c_int, ctx.*.rumble_hi_amp) * RUMBLE_MAX, @as(c_int, 65535)))));
                rumble_data[@as(c_int, 1)] = @truncate(@as(Uint32, 80) | (ctx.*.rumble_seq & @as(Uint32, 15)));
                EncodeHDRumble(ctx.*.rumble_hi_freq, high_amp, ctx.*.rumble_lo_freq, low_amp, &rumble_data[@as(c_int, 2)]);
                switch (@as(c_int, ctx.*.device.*.product_id)) {
                    USB_PRODUCT_NINTENDO_SWITCH2_JOYCON_LEFT => {
                        sdl_pc = 20;
                        continue;
                    },
                    USB_PRODUCT_NINTENDO_SWITCH2_JOYCON_RIGHT => {
                        sdl_pc = 21;
                        continue;
                    },
                    USB_PRODUCT_NINTENDO_SWITCH2_PRO => {
                        sdl_pc = 25;
                        continue;
                    },
                    else => {
                        sdl_pc = 19;
                        continue;
                    },
                }
            },
            12 => {
                ctx.*.rumble_seq +%= 1;
                ctx.*.rumble_updated = @"false" != 0;
                if (!(@as(c_int, ctx.*.rumble_lo_amp) != 0) and !(@as(c_int, ctx.*.rumble_hi_amp) != 0)) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            13 => {
                rumble_data[@as(c_int, 2)] = 2;
                ctx.*.rumble_error = 0;
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                if (ctx.*.rumble_error < @as(Uint32, @bitCast(@as(c_int, @as(c_int, rumble_max))))) {
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
                rumble_data[@as(c_int, 2)] = 1;
                ctx.*.rumble_error +%= @bitCast(@as(c_int, @as(c_int, 65535) - @as(c_int, rumble_max)));
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            17 => {
                rumble_data[@as(c_int, 2)] = 0;
                ctx.*.rumble_error -%= @bitCast(@as(c_int, @as(c_int, rumble_max)));
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
                {
                    sdl_pc = 12;
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
                if (ctx.*.device.*.parent != null) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            22 => {
                interval *%= 2;
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
                rumble_data[@as(c_int, 0)] = 1;
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            25 => {
                rumble_data[@as(c_int, 0)] = 2;
                _ = memcpy(@ptrCast(@alignCast(&rumble_data[@as(c_int, 17)])), @ptrCast(@alignCast(&rumble_data[@as(c_int, 1)])), 6);
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            26 => {
                ctx.*.rumble_timestamp = 0;
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            27 => {
                if (!(ctx.*.rumble_timestamp != 0)) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            28 => {
                if (@as(c_ulong, @bitCast(@as(c_long, SDL_HIDAPI_SendRumbleAndUnlock(ctx.*.device, @ptrCast(@alignCast(&rumble_data)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(rumble_data))))))))) != @sizeOf(@TypeOf(rumble_data))) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            29 => {
                ctx.*.rumble_timestamp = timestamp;
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
                ctx.*.rumble_timestamp +%= interval;
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            32 => {
                return SDL_SetError_REAL("Couldn't send rumble packet");
            },
            33 => {
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            34 => {
                return @"true" != 0;
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverSwitch2_HandleStatePacket(device: [*c]SDL_HIDAPI_Device, joystick: [*c]SDL_Joystick, ctx: [*c]SDL_DriverSwitch2_Context, data: [*c]Uint8, size: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var timestamp: Uint64 = undefined;
    _ = &timestamp;
    var sensor_timestamp: Uint64 = undefined;
    _ = &sensor_timestamp;
    var coeff: Uint64 = undefined;
    _ = &coeff;
    var set_features: [12]Uint8 = undefined;
    _ = &set_features;
    var reply: [12]u8 = undefined;
    _ = &reply;
    var accel_data: [3]f32 = undefined;
    _ = &accel_data;
    var gyro_data: [3]f32 = undefined;
    _ = &gyro_data;
    var g: f32 = undefined;
    _ = &g;
    var accel_scale: f32 = undefined;
    _ = &accel_scale;
    var tmp: f32 = undefined;
    _ = &tmp;
    var tmp_1: f32 = undefined;
    _ = &tmp_1;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                timestamp = SDL_GetTicksNS_REAL();
                if (size < @as(c_int, 64)) {
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
                switch (@as(c_int, device.*.product_id)) {
                    USB_PRODUCT_NINTENDO_SWITCH2_GAMECUBE_CONTROLLER => {
                        sdl_pc = 5;
                        continue;
                    },
                    USB_PRODUCT_NINTENDO_SWITCH2_JOYCON_LEFT => {
                        sdl_pc = 6;
                        continue;
                    },
                    USB_PRODUCT_NINTENDO_SWITCH2_JOYCON_RIGHT => {
                        sdl_pc = 10;
                        continue;
                    },
                    USB_PRODUCT_NINTENDO_SWITCH2_PRO => {
                        sdl_pc = 14;
                        continue;
                    },
                    else => {
                        sdl_pc = 15;
                        continue;
                    },
                }
            },
            4 => {
                sensor_timestamp = ((@as(c_uint, @bitCast(@as(c_int, @as(c_int, data[@as(c_int, 43)])))) | (@as(c_uint, @bitCast(@as(c_int, @as(c_int, data[@as(c_int, 44)])))) << @intCast(@as(c_uint, 8)))) | (@as(c_uint, @bitCast(@as(c_int, @as(c_int, data[@as(c_int, 45)])))) << @intCast(@as(c_uint, 16)))) | (@as(c_uint, @bitCast(@as(c_int, @as(c_int, data[@as(c_int, 46)])))) << @intCast(@as(c_uint, 24)));
                if ((sensor_timestamp != 0) and (@as(Uint64, @bitCast(@as(c_long, @intFromBool(!ctx.*.sensors_ready)))) != 0)) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            5 => {
                HandleGameCubeState(timestamp, joystick, ctx, data, size);
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            6 => {
                if ((device.*.parent != null) or ctx.*.vertical_mode) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                HandleCombinedControllerStateL(timestamp, joystick, ctx, data, size);
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                HandleMiniControllerStateL(timestamp, joystick, ctx, data, size);
                {
                    sdl_pc = 9;
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
                if ((device.*.parent != null) or ctx.*.vertical_mode) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                HandleCombinedControllerStateR(timestamp, joystick, ctx, data, size);
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            12 => {
                HandleMiniControllerStateR(timestamp, joystick, ctx, data, size);
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            14 => {
                HandleSwitchProState(timestamp, joystick, ctx, data, size);
                {
                    sdl_pc = 4;
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
                ctx.*.sample_count += 1;
                if ((ctx.*.sample_count >= @as(c_int, 5)) and !(ctx.*.first_sensor_timestamp != 0)) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
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
                if (((@as(Uint64, @bitCast(@as(c_long, @as(c_int, @intFromBool(ctx.*.sensors_enabled))))) != 0) and (sensor_timestamp != 0)) and ctx.*.sensors_ready) {
                    sdl_pc = 34;
                    continue;
                } else {
                    sdl_pc = 35;
                    continue;
                }
            },
            19 => {
                ctx.*.first_sensor_timestamp = sensor_timestamp;
                ctx.*.sample_count = 0;
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                if (ctx.*.sample_count == @as(c_int, 100)) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
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
                coeff = (@as(Uint64, 1000) *% (sensor_timestamp -% ctx.*.first_sensor_timestamp)) / @as(Uint64, @bitCast(@as(c_long, ctx.*.sample_count * @as(c_int, 4))));
                if (((coeff +% @as(Uint64, 100000)) / @as(Uint64, 200000)) == @as(Uint64, 5)) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
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
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            25 => {
                ctx.*.sensor_ts_coeff = 10000;
                ctx.*.gyro_coeff = 34.799999;
                ctx.*.sensors_ready = @"true" != 0;
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            26 => {
                if (coeff != @as(Uint64, 0)) {
                    sdl_pc = 28;
                    continue;
                } else {
                    sdl_pc = 29;
                    continue;
                }
            },
            27 => {
                if (ctx.*.sensors_ready and !ctx.*.sensors_enabled) {
                    sdl_pc = 31;
                    continue;
                } else {
                    sdl_pc = 32;
                    continue;
                }
            },
            28 => {
                ctx.*.sensor_ts_coeff = @as(Uint64, 10000000000) / coeff;
                ctx.*.gyro_coeff = 40.0;
                ctx.*.sensors_ready = @"true" != 0;
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            29 => {
                ctx.*.first_sensor_timestamp = 0;
                ctx.*.sample_count = 0;
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
                set_features = [12]Uint8{
                    12,
                    145,
                    0,
                    4,
                    0,
                    4,
                    0,
                    0,
                    35,
                    0,
                    0,
                    0,
                };
                reply = [1]u8{
                    0,
                } ++ @as([11]u8, @splat(0));
                _ = SendBulkData(ctx, @ptrCast(@alignCast(&set_features)), @truncate(@sizeOf(@TypeOf(set_features))));
                _ = RecvBulkData(ctx, @ptrCast(@alignCast(&reply)), @truncate(@sizeOf(@TypeOf(reply))));
                {
                    sdl_pc = 33;
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
                    sdl_pc = 24;
                    continue;
                }
            },
            34 => {
                sensor_timestamp = (sensor_timestamp *% ctx.*.sensor_ts_coeff) / @as(Uint64, 10);
                g = 9.80665;
                accel_scale = (g * @as(f32, 8.0)) / @as(f32, @floatFromInt(@as(c_int, 32767)));
                accel_data[@as(c_int, 0)] = @as(f32, @floatFromInt(@as(c_int, @as(Sint16, @truncate(@as(c_int, data[@as(c_int, 49)]) | (@as(c_int, data[@as(c_int, 50)]) << @intCast(@as(c_int, 8)))))))) * accel_scale;
                accel_data[@as(c_int, 1)] = @as(f32, @floatFromInt(@as(c_int, @as(Sint16, @truncate(@as(c_int, data[@as(c_int, 53)]) | (@as(c_int, data[@as(c_int, 54)]) << @intCast(@as(c_int, 8)))))))) * accel_scale;
                accel_data[@as(c_int, 2)] = @as(f32, @floatFromInt(@as(c_int, @as(Sint16, @truncate(@as(c_int, data[@as(c_int, 51)]) | (@as(c_int, data[@as(c_int, 52)]) << @intCast(@as(c_int, 8)))))))) * -accel_scale;
                gyro_data[@as(c_int, 0)] = ((@as(f32, @floatFromInt(@as(c_int, @as(Sint16, @truncate(@as(c_int, data[@as(c_int, 55)]) | (@as(c_int, data[@as(c_int, 56)]) << @intCast(@as(c_int, 8)))))))) * ctx.*.gyro_coeff) / @as(f32, @floatFromInt(@as(c_int, 32767)))) - ctx.*.gyro_bias_x;
                gyro_data[@as(c_int, 1)] = ((@as(f32, @floatFromInt(@as(c_int, @as(Sint16, @truncate(@as(c_int, data[@as(c_int, 59)]) | (@as(c_int, data[@as(c_int, 60)]) << @intCast(@as(c_int, 8)))))))) * ctx.*.gyro_coeff) / @as(f32, @floatFromInt(@as(c_int, 32767)))) - ctx.*.gyro_bias_z;
                gyro_data[@as(c_int, 2)] = ((@as(f32, @floatFromInt(@as(c_int, @as(Sint16, @truncate(@as(c_int, data[@as(c_int, 57)]) | (@as(c_int, data[@as(c_int, 58)]) << @intCast(@as(c_int, 8)))))))) * -ctx.*.gyro_coeff) / @as(f32, @floatFromInt(@as(c_int, 32767)))) + ctx.*.gyro_bias_y;
                switch (@as(c_int, ctx.*.device.*.product_id)) {
                    USB_PRODUCT_NINTENDO_SWITCH2_JOYCON_LEFT => {
                        sdl_pc = 38;
                        continue;
                    },
                    USB_PRODUCT_NINTENDO_SWITCH2_JOYCON_RIGHT => {
                        sdl_pc = 42;
                        continue;
                    },
                    else => {
                        sdl_pc = 46;
                        continue;
                    },
                }
            },
            35 => {
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            36 => {
                _ = memcpy(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&ctx.*.last_state))))), @ptrCast(@alignCast(data)), if (@as(c_ulong, @bitCast(@as(c_long, size))) < @sizeOf(@TypeOf(ctx.*.last_state))) @as(c_ulong, @bitCast(@as(c_long, size))) else @sizeOf(@TypeOf(ctx.*.last_state)));
                {}
            },
            37 => {
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            38 => {
                if (ctx.*.device.*.parent != null) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 40;
                    continue;
                }
            },
            39 => {
                SDL_SendJoystickSensor(timestamp, joystick, SDL_SENSOR_GYRO_L, sensor_timestamp, @ptrCast(@alignCast(&gyro_data)), 3);
                SDL_SendJoystickSensor(timestamp, joystick, SDL_SENSOR_ACCEL_L, sensor_timestamp, @ptrCast(@alignCast(&accel_data)), 3);
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            40 => {
                tmp = -accel_data[@as(c_int, 0)];
                accel_data[@as(c_int, 0)] = accel_data[@as(c_int, 2)];
                accel_data[@as(c_int, 2)] = tmp;
                tmp = -gyro_data[@as(c_int, 0)];
                gyro_data[@as(c_int, 0)] = gyro_data[@as(c_int, 2)];
                gyro_data[@as(c_int, 2)] = tmp;
                SDL_SendJoystickSensor(timestamp, joystick, SDL_SENSOR_GYRO, sensor_timestamp, @ptrCast(@alignCast(&gyro_data)), 3);
                SDL_SendJoystickSensor(timestamp, joystick, SDL_SENSOR_ACCEL, sensor_timestamp, @ptrCast(@alignCast(&accel_data)), 3);
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            41 => {
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            42 => {
                if (ctx.*.device.*.parent != null) {
                    sdl_pc = 43;
                    continue;
                } else {
                    sdl_pc = 44;
                    continue;
                }
            },
            43 => {
                SDL_SendJoystickSensor(timestamp, joystick, SDL_SENSOR_GYRO, sensor_timestamp, @ptrCast(@alignCast(&gyro_data)), 3);
                SDL_SendJoystickSensor(timestamp, joystick, SDL_SENSOR_ACCEL, sensor_timestamp, @ptrCast(@alignCast(&accel_data)), 3);
                SDL_SendJoystickSensor(timestamp, joystick, SDL_SENSOR_GYRO_R, sensor_timestamp, @ptrCast(@alignCast(&gyro_data)), 3);
                SDL_SendJoystickSensor(timestamp, joystick, SDL_SENSOR_ACCEL_R, sensor_timestamp, @ptrCast(@alignCast(&accel_data)), 3);
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            44 => {
                tmp_1 = accel_data[@as(c_int, 0)];
                accel_data[@as(c_int, 0)] = -accel_data[@as(c_int, 2)];
                accel_data[@as(c_int, 2)] = tmp_1;
                tmp_1 = gyro_data[@as(c_int, 0)];
                gyro_data[@as(c_int, 0)] = -gyro_data[@as(c_int, 2)];
                gyro_data[@as(c_int, 2)] = tmp_1;
                SDL_SendJoystickSensor(timestamp, joystick, SDL_SENSOR_GYRO, sensor_timestamp, @ptrCast(@alignCast(&gyro_data)), 3);
                SDL_SendJoystickSensor(timestamp, joystick, SDL_SENSOR_ACCEL, sensor_timestamp, @ptrCast(@alignCast(&accel_data)), 3);
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            45 => {
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            46 => {
                SDL_SendJoystickSensor(timestamp, joystick, SDL_SENSOR_GYRO, sensor_timestamp, @ptrCast(@alignCast(&gyro_data)), 3);
                SDL_SendJoystickSensor(timestamp, joystick, SDL_SENSOR_ACCEL, sensor_timestamp, @ptrCast(@alignCast(&accel_data)), 3);
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn HIDAPI_DriverSwitch2_UpdateDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSwitch2_Context = @ptrCast(@alignCast(device.*.context));
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
        HIDAPI_DriverSwitch2_HandleStatePacket(device, joystick, ctx, @ptrCast(@alignCast(&data)), size);
        _ = UpdateRumble(ctx);
    }
    if (size < @as(c_int, 0)) {
        HIDAPI_JoystickDisconnected(device, device.*.joysticks[@as(c_int, 0)]);
    }
    return size >= @as(c_int, 0);
}
pub fn HIDAPI_DriverSwitch2_CloseJoystick(device: [*c]SDL_HIDAPI_Device, _: [*c]SDL_Joystick) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSwitch2_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    SDL_RemoveHintCallback_REAL("SDL_JOYSTICK_HIDAPI_SWITCH_PLAYER_LED", SDL_PlayerLEDHintChanged, @ptrCast(@alignCast(ctx)));
    ctx.*.joystick = null;
}
pub fn HIDAPI_DriverSwitch2_FreeDevice(device: [*c]SDL_HIDAPI_Device) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_DriverSwitch2_Context = @ptrCast(@alignCast(device.*.context));
    _ = &ctx;
    if (ctx != null) {
        if (ctx.*.interface_claimed) {
            _ = ctx.*.libusb.*.release_interface.?(ctx.*.device_handle, ctx.*.interface_number);
            ctx.*.interface_claimed = @"false" != 0;
        }
        if (ctx.*.libusb != null) {
            SDL_QuitLibUSB();
            ctx.*.libusb = null;
        }
    }
}
pub export var SDL_HIDAPI_DriverSwitch2: SDL_HIDAPI_DeviceDriver = SDL_HIDAPI_DeviceDriver{
    .name = "SDL_JOYSTICK_HIDAPI_SWITCH2",
    .enabled = @"true" != 0,
    .RegisterHints = HIDAPI_DriverSwitch2_RegisterHints,
    .UnregisterHints = HIDAPI_DriverSwitch2_UnregisterHints,
    .IsEnabled = HIDAPI_DriverSwitch2_IsEnabled,
    .IsSupportedDevice = HIDAPI_DriverSwitch2_IsSupportedDevice,
    .InitDevice = HIDAPI_DriverSwitch2_InitDevice,
    .GetDevicePlayerIndex = HIDAPI_DriverSwitch2_GetDevicePlayerIndex,
    .SetDevicePlayerIndex = HIDAPI_DriverSwitch2_SetDevicePlayerIndex,
    .UpdateDevice = HIDAPI_DriverSwitch2_UpdateDevice,
    .OpenJoystick = HIDAPI_DriverSwitch2_OpenJoystick,
    .RumbleJoystick = HIDAPI_DriverSwitch2_RumbleJoystick,
    .RumbleJoystickTriggers = HIDAPI_DriverSwitch2_RumbleJoystickTriggers,
    .GetJoystickCapabilities = HIDAPI_DriverSwitch2_GetJoystickCapabilities,
    .SetJoystickLED = HIDAPI_DriverSwitch2_SetJoystickLED,
    .SendJoystickEffect = HIDAPI_DriverSwitch2_SendJoystickEffect,
    .SetJoystickSensorsEnabled = HIDAPI_DriverSwitch2_SetJoystickSensorsEnabled,
    .CloseJoystick = HIDAPI_DriverSwitch2_CloseJoystick,
    .FreeDevice = HIDAPI_DriverSwitch2_FreeDevice,
};

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_HAT_UP = @as(c_uint, 0x01);
pub const SDL_HAT_RIGHT = @as(c_uint, 0x02);
pub const SDL_HAT_DOWN = @as(c_uint, 0x04);
pub const SDL_HAT_LEFT = @as(c_uint, 0x08);
pub const LIBUSB_ENDPOINT_DIR_MASK = @as(c_int, 0x80);
pub const LIBUSB_TRANSFER_TYPE_MASK = @as(c_int, 0x03);
pub const USB_VENDOR_NINTENDO = @as(c_int, 0x057e);
pub const USB_PRODUCT_NINTENDO_SWITCH2_GAMECUBE_CONTROLLER = @as(c_int, 0x2073);
pub const USB_PRODUCT_NINTENDO_SWITCH2_JOYCON_LEFT = @as(c_int, 0x2067);
pub const USB_PRODUCT_NINTENDO_SWITCH2_JOYCON_RIGHT = @as(c_int, 0x2066);
pub const USB_PRODUCT_NINTENDO_SWITCH2_PRO = @as(c_int, 0x2069);
pub const SDL_JOYSTICK_CAP_PLAYER_LED = @as(c_int, 0x00000004);
pub const SDL_JOYSTICK_CAP_RUMBLE = @as(c_int, 0x00000010);
pub const RUMBLE_INTERVAL = @as(c_int, 12);
pub const RUMBLE_MAX = @as(c_int, 29000);
