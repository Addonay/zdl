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
pub const SDL_FunctionPointer = ?*const fn () callconv(.c) void;
pub const struct_SDL_AtomicInt = extern struct {
    value: c_int = 0,
};
pub const SDL_AtomicInt = struct_SDL_AtomicInt;
pub extern fn SDL_AddAtomicInt_REAL(a: [*c]SDL_AtomicInt, v: c_int) c_int;
pub const struct_SDL_SharedObject = opaque {
};
pub const SDL_SharedObject = struct_SDL_SharedObject;
pub extern fn SDL_LoadObject_REAL(sofile: [*c]const u8) ?*SDL_SharedObject;
pub extern fn SDL_LoadFunction_REAL(handle: ?*SDL_SharedObject, name: [*c]const u8) SDL_FunctionPointer;
pub extern fn SDL_UnloadObject_REAL(handle: ?*SDL_SharedObject) void;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
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
pub var SDL_libusb_refcount: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt);
pub var SDL_libusb_loaded: bool = false;
pub var SDL_libusb_handle: ?*SDL_SharedObject = null;
pub var SDL_libusb_context: SDL_LibUSBContext = @import("std").mem.zeroes(SDL_LibUSBContext);
pub export fn SDL_InitLibUSB(ctx: [*c][*c]SDL_LibUSBContext) bool {
    @setEvalBranchQuota(100000);
    if (SDL_AddAtomicInt_REAL(&SDL_libusb_refcount, 1) == @as(c_int, 0)) {
        SDL_libusb_handle = SDL_LoadObject_REAL("libusb-1.0.so.0");
        if (SDL_libusb_handle != null) {
            SDL_libusb_loaded = @"true" != 0;
            if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(blk: {
                const tmp = @as(?*const fn ([*c]?*libusb_context) callconv(.c) c_int, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(SDL_libusb_handle, "libusb_init")))));
                SDL_libusb_context.init = tmp;
                break :blk tmp;
            })))) == @as(?*anyopaque, null)) {
                SDL_libusb_loaded = @"false" != 0;
            }
            if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(blk: {
                const tmp = @as(?*const fn (?*libusb_context) callconv(.c) void, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(SDL_libusb_handle, "libusb_exit")))));
                SDL_libusb_context.exit = tmp;
                break :blk tmp;
            })))) == @as(?*anyopaque, null)) {
                SDL_libusb_loaded = @"false" != 0;
            }
            if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(blk: {
                const tmp = @as(?*const fn (?*libusb_context, [*c][*c]?*libusb_device) callconv(.c) isize, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(SDL_libusb_handle, "libusb_get_device_list")))));
                SDL_libusb_context.get_device_list = tmp;
                break :blk tmp;
            })))) == @as(?*anyopaque, null)) {
                SDL_libusb_loaded = @"false" != 0;
            }
            if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(blk: {
                const tmp = @as(?*const fn ([*c]?*libusb_device, c_int) callconv(.c) void, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(SDL_libusb_handle, "libusb_free_device_list")))));
                SDL_libusb_context.free_device_list = tmp;
                break :blk tmp;
            })))) == @as(?*anyopaque, null)) {
                SDL_libusb_loaded = @"false" != 0;
            }
            if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(blk: {
                const tmp = @as(?*const fn (?*libusb_device, [*c]struct_libusb_device_descriptor) callconv(.c) c_int, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(SDL_libusb_handle, "libusb_get_device_descriptor")))));
                SDL_libusb_context.get_device_descriptor = tmp;
                break :blk tmp;
            })))) == @as(?*anyopaque, null)) {
                SDL_libusb_loaded = @"false" != 0;
            }
            if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(blk: {
                const tmp = @as(?*const fn (?*libusb_device, [*c][*c]struct_libusb_config_descriptor) callconv(.c) c_int, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(SDL_libusb_handle, "libusb_get_active_config_descriptor")))));
                SDL_libusb_context.get_active_config_descriptor = tmp;
                break :blk tmp;
            })))) == @as(?*anyopaque, null)) {
                SDL_libusb_loaded = @"false" != 0;
            }
            if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(blk: {
                const tmp = @as(?*const fn (?*libusb_device, u8, [*c][*c]struct_libusb_config_descriptor) callconv(.c) c_int, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(SDL_libusb_handle, "libusb_get_config_descriptor")))));
                SDL_libusb_context.get_config_descriptor = tmp;
                break :blk tmp;
            })))) == @as(?*anyopaque, null)) {
                SDL_libusb_loaded = @"false" != 0;
            }
            if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(blk: {
                const tmp = @as(?*const fn ([*c]struct_libusb_config_descriptor) callconv(.c) void, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(SDL_libusb_handle, "libusb_free_config_descriptor")))));
                SDL_libusb_context.free_config_descriptor = tmp;
                break :blk tmp;
            })))) == @as(?*anyopaque, null)) {
                SDL_libusb_loaded = @"false" != 0;
            }
            if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(blk: {
                const tmp = @as(?*const fn (?*libusb_device) callconv(.c) u8, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(SDL_libusb_handle, "libusb_get_bus_number")))));
                SDL_libusb_context.get_bus_number = tmp;
                break :blk tmp;
            })))) == @as(?*anyopaque, null)) {
                SDL_libusb_loaded = @"false" != 0;
            }
            if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(blk: {
                const tmp = @as(?*const fn (dev: ?*libusb_device, port_numbers: [*c]u8, port_numbers_len: c_int) callconv(.c) c_int, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(SDL_libusb_handle, "libusb_get_port_numbers")))));
                SDL_libusb_context.get_port_numbers = tmp;
                break :blk tmp;
            })))) == @as(?*anyopaque, null)) {
                SDL_libusb_loaded = @"false" != 0;
            }
            if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(blk: {
                const tmp = @as(?*const fn (?*libusb_device) callconv(.c) u8, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(SDL_libusb_handle, "libusb_get_device_address")))));
                SDL_libusb_context.get_device_address = tmp;
                break :blk tmp;
            })))) == @as(?*anyopaque, null)) {
                SDL_libusb_loaded = @"false" != 0;
            }
            if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(blk: {
                const tmp = @as(?*const fn (?*libusb_device, [*c]?*libusb_device_handle) callconv(.c) c_int, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(SDL_libusb_handle, "libusb_open")))));
                SDL_libusb_context.open = tmp;
                break :blk tmp;
            })))) == @as(?*anyopaque, null)) {
                SDL_libusb_loaded = @"false" != 0;
            }
            if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(blk: {
                const tmp = @as(?*const fn (?*libusb_device_handle) callconv(.c) void, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(SDL_libusb_handle, "libusb_close")))));
                SDL_libusb_context.close = tmp;
                break :blk tmp;
            })))) == @as(?*anyopaque, null)) {
                SDL_libusb_loaded = @"false" != 0;
            }
            if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(blk: {
                const tmp = @as(?*const fn (dev_handle: ?*libusb_device_handle) callconv(.c) ?*libusb_device, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(SDL_libusb_handle, "libusb_get_device")))));
                SDL_libusb_context.get_device = tmp;
                break :blk tmp;
            })))) == @as(?*anyopaque, null)) {
                SDL_libusb_loaded = @"false" != 0;
            }
            if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(blk: {
                const tmp = @as(?*const fn (?*libusb_device_handle, c_int) callconv(.c) c_int, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(SDL_libusb_handle, "libusb_claim_interface")))));
                SDL_libusb_context.claim_interface = tmp;
                break :blk tmp;
            })))) == @as(?*anyopaque, null)) {
                SDL_libusb_loaded = @"false" != 0;
            }
            if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(blk: {
                const tmp = @as(?*const fn (?*libusb_device_handle, c_int) callconv(.c) c_int, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(SDL_libusb_handle, "libusb_release_interface")))));
                SDL_libusb_context.release_interface = tmp;
                break :blk tmp;
            })))) == @as(?*anyopaque, null)) {
                SDL_libusb_loaded = @"false" != 0;
            }
            if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(blk: {
                const tmp = @as(?*const fn (?*libusb_device_handle, c_int) callconv(.c) c_int, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(SDL_libusb_handle, "libusb_kernel_driver_active")))));
                SDL_libusb_context.kernel_driver_active = tmp;
                break :blk tmp;
            })))) == @as(?*anyopaque, null)) {
                SDL_libusb_loaded = @"false" != 0;
            }
            if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(blk: {
                const tmp = @as(?*const fn (?*libusb_device_handle, c_int) callconv(.c) c_int, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(SDL_libusb_handle, "libusb_detach_kernel_driver")))));
                SDL_libusb_context.detach_kernel_driver = tmp;
                break :blk tmp;
            })))) == @as(?*anyopaque, null)) {
                SDL_libusb_loaded = @"false" != 0;
            }
            if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(blk: {
                const tmp = @as(?*const fn (?*libusb_device_handle, c_int) callconv(.c) c_int, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(SDL_libusb_handle, "libusb_attach_kernel_driver")))));
                SDL_libusb_context.attach_kernel_driver = tmp;
                break :blk tmp;
            })))) == @as(?*anyopaque, null)) {
                SDL_libusb_loaded = @"false" != 0;
            }
            if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(blk: {
                const tmp = @as(?*const fn (?*libusb_device_handle, c_int) callconv(.c) c_int, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(SDL_libusb_handle, "libusb_set_auto_detach_kernel_driver")))));
                SDL_libusb_context.set_auto_detach_kernel_driver = tmp;
                break :blk tmp;
            })))) == @as(?*anyopaque, null)) {
                SDL_libusb_loaded = @"false" != 0;
            }
            if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(blk: {
                const tmp = @as(?*const fn (?*libusb_device_handle, c_int, c_int) callconv(.c) c_int, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(SDL_libusb_handle, "libusb_set_interface_alt_setting")))));
                SDL_libusb_context.set_interface_alt_setting = tmp;
                break :blk tmp;
            })))) == @as(?*anyopaque, null)) {
                SDL_libusb_loaded = @"false" != 0;
            }
            if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(blk: {
                const tmp = @as(?*const fn (c_int) callconv(.c) [*c]struct_libusb_transfer, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(SDL_libusb_handle, "libusb_alloc_transfer")))));
                SDL_libusb_context.alloc_transfer = tmp;
                break :blk tmp;
            })))) == @as(?*anyopaque, null)) {
                SDL_libusb_loaded = @"false" != 0;
            }
            if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(blk: {
                const tmp = @as(?*const fn ([*c]struct_libusb_transfer) callconv(.c) c_int, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(SDL_libusb_handle, "libusb_submit_transfer")))));
                SDL_libusb_context.submit_transfer = tmp;
                break :blk tmp;
            })))) == @as(?*anyopaque, null)) {
                SDL_libusb_loaded = @"false" != 0;
            }
            if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(blk: {
                const tmp = @as(?*const fn ([*c]struct_libusb_transfer) callconv(.c) c_int, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(SDL_libusb_handle, "libusb_cancel_transfer")))));
                SDL_libusb_context.cancel_transfer = tmp;
                break :blk tmp;
            })))) == @as(?*anyopaque, null)) {
                SDL_libusb_loaded = @"false" != 0;
            }
            if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(blk: {
                const tmp = @as(?*const fn ([*c]struct_libusb_transfer) callconv(.c) void, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(SDL_libusb_handle, "libusb_free_transfer")))));
                SDL_libusb_context.free_transfer = tmp;
                break :blk tmp;
            })))) == @as(?*anyopaque, null)) {
                SDL_libusb_loaded = @"false" != 0;
            }
            if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(blk: {
                const tmp = @as(?*const fn (?*libusb_device_handle, u8, u8, u16, u16, [*c]u8, u16, c_uint) callconv(.c) c_int, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(SDL_libusb_handle, "libusb_control_transfer")))));
                SDL_libusb_context.control_transfer = tmp;
                break :blk tmp;
            })))) == @as(?*anyopaque, null)) {
                SDL_libusb_loaded = @"false" != 0;
            }
            if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(blk: {
                const tmp = @as(?*const fn (?*libusb_device_handle, u8, [*c]u8, c_int, [*c]c_int, c_uint) callconv(.c) c_int, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(SDL_libusb_handle, "libusb_interrupt_transfer")))));
                SDL_libusb_context.interrupt_transfer = tmp;
                break :blk tmp;
            })))) == @as(?*anyopaque, null)) {
                SDL_libusb_loaded = @"false" != 0;
            }
            if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(blk: {
                const tmp = @as(?*const fn (?*libusb_device_handle, u8, [*c]u8, c_int, [*c]c_int, c_uint) callconv(.c) c_int, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(SDL_libusb_handle, "libusb_bulk_transfer")))));
                SDL_libusb_context.bulk_transfer = tmp;
                break :blk tmp;
            })))) == @as(?*anyopaque, null)) {
                SDL_libusb_loaded = @"false" != 0;
            }
            if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(blk: {
                const tmp = @as(?*const fn (?*libusb_context) callconv(.c) c_int, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(SDL_libusb_handle, "libusb_handle_events")))));
                SDL_libusb_context.handle_events = tmp;
                break :blk tmp;
            })))) == @as(?*anyopaque, null)) {
                SDL_libusb_loaded = @"false" != 0;
            }
            if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(blk: {
                const tmp = @as(?*const fn (?*libusb_context, [*c]c_int) callconv(.c) c_int, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(SDL_libusb_handle, "libusb_handle_events_completed")))));
                SDL_libusb_context.handle_events_completed = tmp;
                break :blk tmp;
            })))) == @as(?*anyopaque, null)) {
                SDL_libusb_loaded = @"false" != 0;
            }
            if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(blk: {
                const tmp = @as(?*const fn (ctx: ?*libusb_context) callconv(.c) void, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(SDL_libusb_handle, "libusb_interrupt_event_handler")))));
                SDL_libusb_context.interrupt_event_handler = tmp;
                break :blk tmp;
            })))) == @as(?*anyopaque, null)) {
                SDL_libusb_loaded = @"false" != 0;
            }
            if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(blk: {
                const tmp = @as(?*const fn (u32) callconv(.c) c_int, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(SDL_libusb_handle, "libusb_has_capability")))));
                SDL_libusb_context.has_capability = tmp;
                break :blk tmp;
            })))) == @as(?*anyopaque, null)) {
                SDL_libusb_loaded = @"false" != 0;
            }
            if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(blk: {
                const tmp = @as(?*const fn (?*libusb_context, c_int, c_int, c_int, c_int, c_int, libusb_hotplug_callback_fn, ?*anyopaque, [*c]libusb_hotplug_callback_handle) callconv(.c) c_int, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(SDL_libusb_handle, "libusb_hotplug_register_callback")))));
                SDL_libusb_context.hotplug_register_callback = tmp;
                break :blk tmp;
            })))) == @as(?*anyopaque, null)) {
                SDL_libusb_loaded = @"false" != 0;
            }
            if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(blk: {
                const tmp = @as(?*const fn (?*libusb_context, libusb_hotplug_callback_handle) callconv(.c) void, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(SDL_libusb_handle, "libusb_hotplug_deregister_callback")))));
                SDL_libusb_context.hotplug_deregister_callback = tmp;
                break :blk tmp;
            })))) == @as(?*anyopaque, null)) {
                SDL_libusb_loaded = @"false" != 0;
            }
            if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(blk: {
                const tmp = @as(?*const fn (c_int) callconv(.c) [*c]const u8, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(SDL_libusb_handle, "libusb_error_name")))));
                SDL_libusb_context.error_name = tmp;
                break :blk tmp;
            })))) == @as(?*anyopaque, null)) {
                SDL_libusb_loaded = @"false" != 0;
            }
        }
    }
    if (SDL_libusb_loaded) {
        ctx.* = &SDL_libusb_context;
        return @"true" != 0;
    } else {
        SDL_QuitLibUSB();
        ctx.* = null;
        return @"false" != 0;
    }
}
pub export fn SDL_QuitLibUSB() void {
    @setEvalBranchQuota(100000);
    if (SDL_AddAtomicInt_REAL(&SDL_libusb_refcount, -@as(c_int, 1)) == @as(c_int, 1)) {
        if (SDL_libusb_handle != null) {
            SDL_UnloadObject_REAL(SDL_libusb_handle);
            SDL_libusb_handle = null;
        }
        SDL_libusb_loaded = @"false" != 0;
    }
}

