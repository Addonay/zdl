//! One HID controller known to the HIDAPI layer: identity, GUID, the open
//! hidraw handle, the joystick model while connected, the output queue and the
//! driver state selected for it.
//!
//! Port of SDL_HIDAPI_Device and the device-facing parts of
//! SDL_hidapijoystick.c (HIDAPI_AddDevice, HIDAPI_JoystickConnected/Disconnected,
//! HIDAPI_SetDeviceName/Serial, HIDAPI_JoystickOpen, HIDAPI_JoystickRumble and
//! friends). SDL keeps these as a linked list of heap objects with a back-pointer
//! to a driver table; here a `Device` is a plain struct, the driver is a tagged
//! union selected at comptime from `registry.drivers`, and the driver functions
//! are reached through the `DriverState` dispatch below.
//!
//! Lifecycle (SDL's separate open/close pairs are merged, as documented in
//! registry.zig): a device has a driver once a driver claimed it. A device hosts
//! up to `max_joystick_slots` joysticks (SDL's device->joysticks list): one for
//! most controllers, four for the GameCube adapter (one per port). A slot is
//! *connected* while its joystick model exists, which is exactly when the host
//! can see that joystick. The device is connected while any slot is.
//!
//! Joystick slots are attached and detached with `attach_slot` and
//! `detach_slot`, which also record the joystick events in `Updates`. A driver
//! may call them from its update hook (the GameCube adapter does, once per port
//! change), so the same code path serves the registry and the drivers.
//!
//! Ownership: the device owns its path, name and strings, the hidraw handle,
//! the joystick models and the rumble queue. `deinit` releases all of them.
//! A combined Joy-Con device (`parent` links) borrows its two child devices,
//! which the registry keeps alive for as long as the combined device exists.
//!
//! Driver interface (duck-typed, checked with `@hasDecl` for optional members):
//!   pub const Context = struct { ... };
//!   pub fn supports(probe: Probe) bool
//!   pub fn init(ctx: *Context, dev: *Device, env: Env) Error!bool  // true: connect now
//!   pub fn layout(ctx: *const Context, dev: *const Device) joystick.Layout
//!   pub fn open(ctx: *Context, dev: *Device) Error!void
//!   pub fn update(ctx: *Context, dev: *Device, out: *Output, env: Env) Error!Report
//!   pub fn close(ctx: *Context, dev: *Device) void
//!   optional: rumble, rumble_triggers, set_led, send_effect,
//!             set_sensors_enabled, set_player_index, capabilities,
//!             rumble_slot, capabilities_slot (per-slot variants for
//!             multi-joystick devices)
const std = @import("std");
const hidraw = @import("../../hid/hidraw.zig");
const sysfs = @import("../../hid/sysfs.zig");
const joystick = @import("../joystick.zig");
const gamepad = @import("../gamepad.zig");
const guid_mod = @import("../../core/guid.zig");
const common = @import("common.zig");
const rumble = @import("rumble.zig");
const ps4 = @import("ps4.zig");
const ps5 = @import("ps5.zig");
const xboxone = @import("xboxone.zig");
const switch_pro = @import("switch_pro.zig");
const xbox360 = @import("xbox360.zig");
const xbox360w = @import("xbox360w.zig");
const xboxone_bt = @import("xboxone_bt.zig");
const steam = @import("steam.zig");
const steamdeck = @import("steamdeck.zig");
const joycon = @import("joycon.zig");
const ps3 = @import("ps3.zig");
const gamecube = @import("gamecube.zig");
const joycon_pair = @import("joycon_pair.zig");

pub const Allocator = std.mem.Allocator;
pub const Guid = guid_mod.Guid;
pub const Output = common.Output;
pub const Updates = common.Updates;

/// Errors from driver operations. `Unsupported` mirrors SDL_Unsupported().
pub const Error = hidraw.Error || error{
    Unsupported,
    NoDevice,
    InvalidArgument,
    ProtocolError,
};

/// SDL_JoystickType values.
pub const JoystickType = enum {
    unknown,
    gamepad,
    wheel,
    arcade_stick,
    flight_stick,
    dance_pad,
    guitar,
    drum_kit,
    arcade_pad,
    throttle,
};

/// Largest number of joysticks one device hosts (the GameCube adapter's ports).
pub const max_joystick_slots = 4;

/// Bit `i` set means joystick slot `i`. Used by drivers and the registry to
/// name several slots at once.
pub const SlotMask = u8;

/// Driver identifiers, in the order SDL tries them (the comptime registry).
/// `joycon_pair` is never matched from sysfs: the registry creates it for two
/// Joy-Con children (SDL's HIDAPI_CreateCombinedJoyCons).
pub const DriverId = enum { gamecube, ps4, ps5, xboxone, switch_pro, xbox360, xbox360w, xboxone_bt, steam, steamdeck, joycon, joycon_pair, ps3 };

/// SDL_hidapi_ps4.c, SDL_hidapi_ps5.c and SDL_hidapi_switch.c: a Bluetooth
/// controller is not connected while the same controller is connected over USB.
pub fn bluetooth_yields_to_usb(id: DriverId) bool {
    return switch (id) {
        .ps4, .ps5, .switch_pro, .joycon => true,
        .gamecube, .xboxone, .xbox360, .xbox360w, .xboxone_bt, .steam, .steamdeck, .joycon_pair, .ps3 => false,
    };
}

/// Maps a driver identifier to its module. Keeps the tag-to-module pairing in
/// one place so dispatch stays comptime-checked.
pub fn driver_module(comptime id: DriverId) type {
    return switch (id) {
        .gamecube => gamecube,
        .joycon_pair => joycon_pair,
        .ps4 => ps4,
        .ps5 => ps5,
        .xboxone => xboxone,
        .switch_pro => switch_pro,
        .xbox360 => xbox360,
        .xbox360w => xbox360w,
        .xboxone_bt => xboxone_bt,
        .steam => steam,
        .steamdeck => steamdeck,
        .joycon => joycon,
        .ps3 => ps3,
    };
}

/// Per-device state of whichever driver claimed the device.
pub const DriverState = union(DriverId) {
    gamecube: gamecube.Context,
    ps4: ps4.Context,
    ps5: ps5.Context,
    xboxone: xboxone.Context,
    switch_pro: switch_pro.Context,
    xbox360: xbox360.Context,
    xbox360w: xbox360w.Context,
    xboxone_bt: xboxone_bt.Context,
    steam: steam.Context,
    steamdeck: steamdeck.Context,
    joycon: joycon.Context,
    joycon_pair: joycon_pair.Context,
    ps3: ps3.Context,
};

/// Feature flags a driver can advertise (SDL_JOYSTICK_CAP_*).
pub const Capabilities = struct {
    mono_led: bool = false,
    rgb_led: bool = false,
    player_led: bool = false,
    rumble: bool = false,
    trigger_rumble: bool = false,
};

/// What a driver asks of the registry after reading input. The registry applies
/// these after the driver returns, which replaces SDL's direct calls to
/// HIDAPI_JoystickConnected/Disconnected from inside UpdateDevice.
pub const Report = struct {
    /// Connect joystick slot 0 (single-joystick devices).
    connect: bool = false,
    /// Disconnect every connected slot with its inputs recentered.
    disconnect: bool = false,
    /// A read failed and no packet arrived, so the device is gone.
    read_failed: bool = false,
};

/// Read-only view of the other devices, used for the USB-over-Bluetooth rule.
pub const Env = struct {
    devices: []const *Device,

    /// True when a wired device with the same serial is connected (HIDAPI_HasConnectedUSBDevice).
    pub fn has_connected_usb(self: Env, serial: []const u8) bool {
        if (serial.len == 0) return false;
        for (self.devices) |other| {
            if (other.info.bluetooth) continue;
            if (!other.is_connected()) continue;
            if (std.mem.eql(u8, other.info.serial, serial)) return true;
        }
        return false;
    }
};

/// Fields a driver can match on (SDL's IsSupportedDevice arguments). `hid` is
/// null while enumerating and set once the node is open, so drivers that need a
/// feature report to decide can read one.
pub const Probe = struct {
    vendor_id: u16,
    product_id: u16,
    version: u16,
    name: []const u8,
    gamepad_type: gamepad.GamepadType,
    bluetooth: bool,
    /// USB interface number from sysfs, null for non-USB nodes.
    interface_number: ?u8,
    hid: ?*hidraw.Device,
};

/// Identity strings and numbers reported by the kernel, owned by the device.
pub const Info = struct {
    path: []u8,
    vendor_id: u16,
    product_id: u16,
    version: u16,
    manufacturer: []u8,
    product: []u8,
    serial: []u8,
    name: []u8,
    bluetooth: bool,
    usage_page: u16,
    usage: u16,
    /// USB interface number from sysfs, null for non-USB nodes.
    interface_number: ?u8,
};

/// One HID controller. Heap-allocate it (`Registry` does) because drivers and the
/// registry hold pointers to it across calls.
pub const Device = struct {
    allocator: Allocator,
    info: Info,
    guid: Guid,
    gamepad_type: gamepad.GamepadType,
    joystick_type: JoystickType = .gamepad,
    hid: ?hidraw.Device = null,
    driver: ?DriverState = null,
    /// Joystick models, one per slot; null while the slot is disconnected.
    slots: [max_joystick_slots]?joystick.Joystick = @splat(null),
    /// Number of slots the driver uses (SDL's num_joysticks at most). Set by
    /// the driver's init; one for every controller except the GameCube adapter.
    slot_count: u8 = 1,
    rumble: rumble.RumbleQueue = .{},
    state: common.State = .{},
    config: common.Config = .{},
    /// Set by the registry while scanning; unseen devices are removed.
    seen: bool = false,
    /// For a Joy-Con child of a combined pair: the combined device. Borrowed; the
    /// registry clears it when the combined device is removed.
    parent: ?*Device = null,

    /// Builds a device from one sysfs record, taking ownership of its strings.
    /// The registry calls this for each new node; the name is derived from the
    /// table entry for the ids, or from the kernel strings (SDL_CreateJoystickName).
    pub fn from_record(allocator: Allocator, record: sysfs.DeviceInfo) Allocator.Error!Device {
        var owned = record;
        errdefer owned.deinit(allocator);
        const name = try derive_name(allocator, owned.vendor_id, owned.product_id, owned.manufacturer, owned.product);
        errdefer allocator.free(name);
        const bluetooth = owned.bus == .bluetooth;
        const guid = joystick.create_guid(.{
            .bus = if (bluetooth) joystick.bus.bluetooth else joystick.bus.usb,
            .vendor = owned.vendor_id,
            .product = owned.product_id,
            .version = owned.release_number,
            .vendor_name = owned.manufacturer,
            .product_name = owned.product,
            .driver_signature = 'h',
            .driver_data = 0,
        });
        const gamepad_type = gamepad.type_from_vid_pid(owned.vendor_id, owned.product_id, name, false);
        return .{
            .allocator = allocator,
            .info = .{
                .path = owned.path,
                .vendor_id = owned.vendor_id,
                .product_id = owned.product_id,
                .version = owned.release_number,
                .manufacturer = owned.manufacturer,
                .product = owned.product,
                .serial = owned.serial_number,
                .name = name,
                .bluetooth = bluetooth,
                .usage_page = owned.usage_page,
                .usage = owned.usage,
                .interface_number = owned.interface_number,
            },
            .guid = guid,
            .gamepad_type = gamepad_type,
        };
    }

    /// Disconnects, closes the handle and frees every owned allocation.
    pub fn deinit(self: *Device) void {
        self.disconnect_joystick();
        self.close_driver();
        self.rumble.deinit(self.allocator);
        self.allocator.free(self.info.path);
        self.allocator.free(self.info.manufacturer);
        self.allocator.free(self.info.product);
        self.allocator.free(self.info.serial);
        self.allocator.free(self.info.name);
        self.* = undefined;
    }

    /// Probe fields for the driver matcher.
    pub fn probe(self: *const Device, hid: ?*hidraw.Device) Probe {
        return .{
            .vendor_id = self.info.vendor_id,
            .product_id = self.info.product_id,
            .version = self.info.version,
            .name = self.info.name,
            .gamepad_type = self.gamepad_type,
            .bluetooth = self.info.bluetooth,
            .interface_number = self.info.interface_number,
            .hid = hid,
        };
    }

    /// Replaces the display name (HIDAPI_SetDeviceName). Copies `text`.
    pub fn set_name(self: *Device, text: []const u8) Allocator.Error!void {
        const copy = try self.allocator.dupe(u8, text);
        self.allocator.free(self.info.name);
        self.info.name = copy;
    }

    /// Replaces the serial number when `text` is non-empty (HIDAPI_SetDeviceSerial).
    pub fn set_serial(self: *Device, text: []const u8) Allocator.Error!void {
        if (text.len == 0) return;
        const copy = try self.allocator.dupe(u8, text);
        self.allocator.free(self.info.serial);
        self.info.serial = copy;
    }

    /// True while any joystick slot of this device is connected.
    pub fn is_connected(self: *const Device) bool {
        return self.connected_count() > 0;
    }

    /// Number of connected joystick slots.
    pub fn connected_count(self: *const Device) usize {
        var count: usize = 0;
        for (self.slots) |slot| {
            if (slot != null) count += 1;
        }
        return count;
    }

    /// True while joystick slot `slot` is connected.
    pub fn slot_connected(self: *const Device, slot: usize) bool {
        return slot < max_joystick_slots and self.slots[slot] != null;
    }

    /// The model of joystick slot `slot`, or null when it is disconnected. The
    /// pointer stays valid until the slot is detached or the device is freed.
    pub fn joystick_slot(self: *Device, slot: usize) ?*joystick.Joystick {
        if (slot >= max_joystick_slots) return null;
        if (self.slots[slot]) |*js| return js;
        return null;
    }

    /// Queues an output report (SDL_HIDAPI_SendRumble and friends). The report
    /// is written on the next registry update, not synchronously.
    pub fn send_report(self: *Device, data: []const u8, rule: rumble.Coalesce) Error!usize {
        return self.rumble.push(self.allocator, data, rule) catch |err| switch (err) {
            error.OutOfMemory => error.OutOfMemory,
            error.ReportTooLarge => error.InvalidArgument,
        };
    }

    /// Writes one report to the device immediately. Used by drivers that wait for
    /// replies (Switch subcommands), which the queued path cannot do.
    pub fn write_report_now(self: *Device, data: []const u8) Error!usize {
        const hid = if (self.hid) |*h| h else return error.NoDevice;
        return hid.write(data);
    }

    /// Non-blocking input read. Returns null when no report is pending. The
    /// returned slice is a prefix of `buf`.
    pub fn poll_report(self: *Device, buf: []u8) hidraw.Error!?[]u8 {
        const hid = if (self.hid) |*h| h else return error.DeviceUnavailable;
        const n = (try hid.read_timeout(buf, 0)) orelse return null;
        if (n == 0) return null;
        return buf[0..n];
    }

    /// Input read that waits up to `timeout_ms` (SDL_hid_read_timeout with a
    /// non-zero timeout, used during driver init to detect the mode).
    pub fn read_report_timeout(self: *Device, buf: []u8, timeout_ms: u32) hidraw.Error!?[]u8 {
        const hid = if (self.hid) |*h| h else return error.DeviceUnavailable;
        const n = (try hid.read_timeout(buf, timeout_ms)) orelse return null;
        if (n == 0) return null;
        return buf[0..n];
    }

    /// Reads a feature report whose first byte is `report_id`; see
    /// `common.read_feature`. Returns zero when the node is not open.
    pub fn read_feature(self: *Device, report_id: u8, buf: []u8) usize {
        const hid = if (self.hid) |*h| h else return 0;
        return common.read_feature(hid, report_id, buf);
    }

    /// Opens the device's hidraw node for the driver (SDL_hid_open_path with
    /// non-blocking reads).
    pub fn open_hid(self: *Device) hidraw.Error!void {
        if (self.hid != null) return;
        var handle = try hidraw.Device.open(self.allocator, self.info.path);
        handle.set_blocking(false);
        self.hid = handle;
    }

    /// Releases the hidraw handle.
    pub fn close_hid(self: *Device) void {
        if (self.hid) |*handle| handle.close();
        self.hid = null;
    }

    /// Creates the joystick model for `slot` with the driver's layout. The first
    /// connected slot runs the driver open hook. Does nothing when the slot is
    /// already connected. Records no events; see `attach_slot`.
    pub fn connect_slot(self: *Device, slot: usize) Error!void {
        if (slot >= self.slot_count) return error.InvalidArgument;
        if (self.slots[slot] != null) return;
        const first = self.connected_count() == 0;
        const layout = self.driver_layout();
        self.slots[slot] = try joystick.Joystick.init(self.allocator, self.guid, layout);
        errdefer {
            self.slots[slot].?.deinit();
            self.slots[slot] = null;
        }
        if (first) try self.dispatch_open();
    }

    /// Connects joystick slot 0 (the single-joystick case).
    pub fn connect_joystick(self: *Device) Error!void {
        return self.connect_slot(0);
    }

    /// Connects `slot` and records the events in `updates`: `slot_added`, and
    /// `added` when it is the device's first joystick.
    pub fn attach_slot(self: *Device, slot: usize, updates: *Updates) Error!void {
        if (self.slot_connected(slot)) return;
        const first = self.connected_count() == 0;
        try self.connect_slot(slot);
        if (first) try updates.device.append(self.allocator, .added);
        try updates.device.append(self.allocator, .{ .slot_added = @intCast(slot) });
    }

    /// Closes the joystick model of `slot` without reporting its inputs. The
    /// first disconnect of the last slot runs the driver close hook.
    pub fn disconnect_slot(self: *Device, slot: usize) void {
        if (slot >= max_joystick_slots) return;
        if (self.slots[slot] == null) return;
        if (self.connected_count() == 1) self.dispatch_close();
        self.slots[slot].?.deinit();
        self.slots[slot] = null;
    }

    /// Closes every joystick slot without reporting inputs.
    pub fn disconnect_joystick(self: *Device) void {
        for (0..max_joystick_slots) |slot| self.disconnect_slot(slot);
    }

    /// Reports `slot`'s inputs at rest, then closes it (SDL's force recentering
    /// before SDL_PrivateJoystickRemoved). Records `slot_removed`, and `removed`
    /// when it was the device's last joystick.
    pub fn detach_slot(self: *Device, slot: usize, updates: *Updates, now: u64) Allocator.Error!void {
        if (!self.slot_connected(slot)) return;
        try self.slots[slot].?.recenter(self.allocator, &updates.changes, now);
        const last = self.connected_count() == 1;
        self.disconnect_slot(slot);
        try updates.device.append(self.allocator, .{ .slot_removed = @intCast(slot) });
        if (last) try updates.device.append(self.allocator, .removed);
    }

    /// Detaches every connected slot with its inputs recentered.
    pub fn disconnect_with_recenter(self: *Device, updates: *Updates, now: u64) Allocator.Error!void {
        for (0..max_joystick_slots) |slot| try self.detach_slot(slot, updates, now);
    }

    /// Makes this device the combined Joy-Con pair of two child devices (the
    /// driver state and parent links are set by the registry).
    pub fn combined(allocator: Allocator, left: *const Device, right: *const Device) Allocator.Error!Device {
        const bluetooth = left.info.bluetooth or right.info.bluetooth;
        const path = try allocator.dupe(u8, "nintendo_joycons_combined");
        errdefer allocator.free(path);
        const manufacturer = try allocator.dupe(u8, "Nintendo");
        errdefer allocator.free(manufacturer);
        const product = try allocator.dupe(u8, "Switch Joy-Con (L/R)");
        errdefer allocator.free(product);
        const name = try allocator.dupe(u8, "Switch Joy-Con (L/R)");
        errdefer allocator.free(name);
        // SDL joins the child serials with a comma in OpenJoystick.
        const serial = if (left.info.serial.len > 0 and right.info.serial.len > 0)
            try std.fmt.allocPrint(allocator, "{s},{s}", .{ left.info.serial, right.info.serial })
        else
            try allocator.dupe(u8, if (left.info.serial.len > 0) left.info.serial else right.info.serial);
        errdefer allocator.free(serial);
        // SDL_HIDAPI_CombineJoyCons: the pair product is 0x2008 for the Switch
        // Joy-Con pair and 0x2068 for the Switch 2 pair.
        const product_id: u16 = if (left.info.product_id == 0x2006) 0x2008 else 0x2068;
        const guid = joystick.create_guid(.{
            .bus = if (bluetooth) joystick.bus.bluetooth else joystick.bus.usb,
            .vendor = 0x057e,
            .product = product_id,
            .version = 0,
            .vendor_name = manufacturer,
            .product_name = product,
            .driver_signature = 'h',
            .driver_data = 0,
        });
        return .{
            .allocator = allocator,
            .info = .{
                .path = path,
                .vendor_id = 0x057e,
                .product_id = product_id,
                .version = 0,
                .manufacturer = manufacturer,
                .product = product,
                .serial = serial,
                .name = name,
                .bluetooth = bluetooth,
                .usage_page = 0x0001,
                .usage = 0x0005,
                .interface_number = null,
            },
            .guid = guid,
            .gamepad_type = .joycon_pair,
        };
    }

    /// Releases the driver state and the hidraw handle.
    pub fn close_driver(self: *Device) void {
        self.disconnect_joystick();
        self.close_hid();
        self.driver = null;
    }

    /// Driver-declared layout; drivers without a layout hook get an empty one.
    fn driver_layout(self: *const Device) joystick.Layout {
        const state = if (self.driver) |*s| s else return .{};
        return switch (state.*) {
            inline else => |*ctx, tag| blk: {
                const module = driver_module(tag);
                if (@hasDecl(module, "layout")) break :blk module.layout(ctx, self);
                break :blk .{};
            },
        };
    }

    fn dispatch_open(self: *Device) Error!void {
        const state = if (self.driver) |*s| s else return error.NoDevice;
        switch (state.*) {
            inline else => |*ctx, tag| {
                const module = driver_module(tag);
                if (@hasDecl(module, "open")) try module.open(ctx, self);
            },
        }
    }

    fn dispatch_close(self: *Device) void {
        const state = if (self.driver) |*s| s else return;
        switch (state.*) {
            inline else => |*ctx, tag| {
                const module = driver_module(tag);
                if (@hasDecl(module, "close")) module.close(ctx, self);
            },
        }
    }

    /// Calls the driver's rumble hook. Fails with `Unsupported` when the driver
    /// has none or the device has no motor (SDL_Unsupported).
    pub fn rumble_motors(self: *Device, low: u16, high: u16) Error!void {
        const state = if (self.driver) |*s| s else return error.NoDevice;
        switch (state.*) {
            inline else => |*ctx, tag| {
                const module = driver_module(tag);
                if (@hasDecl(module, "rumble")) return module.rumble(ctx, self, low, high);
                return error.Unsupported;
            },
        }
    }

    /// Calls the driver's trigger-rumble hook, or fails with `Unsupported`.
    pub fn rumble_triggers(self: *Device, left: u16, right: u16) Error!void {
        const state = if (self.driver) |*s| s else return error.NoDevice;
        switch (state.*) {
            inline else => |*ctx, tag| {
                const module = driver_module(tag);
                if (@hasDecl(module, "rumble_triggers")) return module.rumble_triggers(ctx, self, left, right);
                return error.Unsupported;
            },
        }
    }

    /// Rumbles one joystick slot. Drivers without slots fall back to
    /// `rumble_motors` for slot 0; other slots are `InvalidArgument`.
    pub fn rumble_slot_motors(self: *Device, slot: usize, low: u16, high: u16) Error!void {
        const state = if (self.driver) |*s| s else return error.NoDevice;
        switch (state.*) {
            inline else => |*ctx, tag| {
                const module = driver_module(tag);
                if (@hasDecl(module, "rumble_slot")) return module.rumble_slot(ctx, self, slot, low, high);
            },
        }
        if (slot != 0) return error.InvalidArgument;
        return self.rumble_motors(low, high);
    }

    /// Capabilities of one joystick slot. Falls back to `capabilities` for slot 0.
    pub fn slot_capabilities(self: *const Device, slot: usize) Capabilities {
        const state = if (self.driver) |*s| s else return .{};
        return switch (state.*) {
            inline else => |*ctx, tag| blk: {
                const module = driver_module(tag);
                if (@hasDecl(module, "capabilities_slot")) break :blk module.capabilities_slot(ctx, self, slot);
                if (slot != 0) break :blk Capabilities{};
                break :blk self.capabilities();
            },
        };
    }

    /// Sets the RGB lightbar, or fails with `Unsupported`.
    pub fn set_led(self: *Device, red: u8, green: u8, blue: u8) Error!void {
        const state = if (self.driver) |*s| s else return error.NoDevice;
        switch (state.*) {
            inline else => |*ctx, tag| {
                const module = driver_module(tag);
                if (@hasDecl(module, "set_led")) return module.set_led(ctx, self, red, green, blue);
                return error.Unsupported;
            },
        }
    }

    /// Sends a driver-specific effect packet, or fails with `Unsupported`.
    pub fn send_effect(self: *Device, data: []const u8) Error!void {
        const state = if (self.driver) |*s| s else return error.NoDevice;
        switch (state.*) {
            inline else => |*ctx, tag| {
                const module = driver_module(tag);
                if (@hasDecl(module, "send_effect")) return module.send_effect(ctx, self, data);
                return error.Unsupported;
            },
        }
    }

    /// Enables or disables the motion sensors, or fails with `Unsupported`.
    pub fn set_sensors_enabled(self: *Device, enabled: bool) Error!void {
        const state = if (self.driver) |*s| s else return error.NoDevice;
        switch (state.*) {
            inline else => |*ctx, tag| {
                const module = driver_module(tag);
                if (@hasDecl(module, "set_sensors_enabled")) return module.set_sensors_enabled(ctx, self, enabled);
                return error.Unsupported;
            },
        }
    }

    /// Stores the player index and refreshes the player LEDs. Drivers without
    /// LEDs ignore it, as SDL does.
    pub fn set_player_index(self: *Device, index: i32) void {
        const state = if (self.driver) |*s| s else return;
        switch (state.*) {
            inline else => |*ctx, tag| {
                const module = driver_module(tag);
                if (@hasDecl(module, "set_player_index")) module.set_player_index(ctx, self, index);
            },
        }
    }

    /// Features the driver reports for the open joystick (SDL_JOYSTICK_CAP_*).
    pub fn capabilities(self: *const Device) Capabilities {
        const state = if (self.driver) |*s| s else return .{};
        switch (state.*) {
            inline else => |*ctx, tag| {
                const module = driver_module(tag);
                if (@hasDecl(module, "capabilities")) return module.capabilities(ctx);
                return .{};
            },
        }
    }

    /// Runs one driver update pass. Returns what the registry must do next.
    pub fn run_update(self: *Device, out: *Output, env: Env) Error!Report {
        const state = if (self.driver) |*s| s else return .{};
        switch (state.*) {
            inline else => |*ctx, tag| {
                const module = driver_module(tag);
                return module.update(ctx, self, out, env);
            },
        }
    }

    /// Runs one driver init pass. Returns true when the joystick can connect now.
    pub fn run_init(self: *Device, env: Env) Error!bool {
        const state = if (self.driver) |*s| s else return error.NoDevice;
        switch (state.*) {
            inline else => |*ctx, tag| {
                const module = driver_module(tag);
                return module.init(ctx, self, env);
            },
        }
    }
};

/// ASCII case-insensitive substring test.
fn contains_ignore_case(haystack: []const u8, needle: []const u8) bool {
    if (needle.len == 0) return true;
    if (needle.len > haystack.len) return false;
    var i: usize = 0;
    while (i + needle.len <= haystack.len) : (i += 1) {
        if (std.ascii.eqlIgnoreCase(haystack[i..][0..needle.len], needle)) return true;
    }
    return false;
}

/// Name for a device when the table has none (SDL_CreateJoystickName): the
/// table name for the ids, else "manufacturer product", else the product or
/// manufacturer alone, else "Unknown Joystick".
fn derive_name(allocator: Allocator, vendor: u16, product: u16, manufacturer: []const u8, product_name: []const u8) Allocator.Error![]u8 {
    if (joystick.guess_controller_name(vendor, product)) |known| return allocator.dupe(u8, known);
    if (manufacturer.len > 0 and product_name.len > 0) {
        if (contains_ignore_case(product_name, manufacturer)) return allocator.dupe(u8, product_name);
        return std.fmt.allocPrint(allocator, "{s} {s}", .{ manufacturer, product_name });
    }
    if (product_name.len > 0) return allocator.dupe(u8, product_name);
    if (manufacturer.len > 0) return allocator.dupe(u8, manufacturer);
    return allocator.dupe(u8, "Unknown Joystick");
}
