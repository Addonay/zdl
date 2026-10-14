//! The HIDAPI controller registry: enumerates hidraw nodes, selects a driver for
//! each one from a comptime list, and runs the explicit update pass that SDL
//! performs on its polling thread.
//!
//! Port of SDL_hidapijoystick.c: the driver table (`drivers`), the usage filter
//! in HIDAPI_GetDeviceDriver, HIDAPI_UpdateDeviceList (`scan`),
//! HIDAPI_SetupDeviceDriver (`setup`), HIDAPI_UpdateDevices (`update`) and the
//! connect/disconnect bookkeeping.
//!
//! Deliberate differences from SDL:
//! - No thread and no global device list. `update` is called by the host at its
//!   own rate and reads every device once, then flushes that device's queued
//!   output reports. SDL reads on a timer and writes rumble on its own thread.
//! - Joystick instance IDs are not global. A device's joystick is found through
//!   `joystick_at`, indexed by the connected devices in discovery order.
//! - The open/close pair is merged into connect/disconnect: a driver opens its
//!   joystick state as soon as the joystick is created.
//! - Combined Joy-Con pairs (SDL_hidapi_combined.c) are built by `combine_joycons`
//!   when `Config.combine_joycons` is set. The pair is a device of its own whose
//!   children stay in the list but are not updated by the registry; they are
//!   dissolved, and the surviving child rejoins as a joystick, when either child
//!   leaves. SDL matches children by serial as well; this port pairs by side.
//! - Joystick slots: a device can host several joysticks (the GameCube adapter).
//!   `joystick_count` and `joystick_at` count devices, as before;
//!   `connected_joystick_count` counts joysticks.
//! - Interface class, subclass and protocol are not read from sysfs, so the
//!   Xbox One and Xbox 360 interface checks in SDL_GetJoystickGameControllerProtocol
//!   fall back to the vendor/product table only.
const std = @import("std");
const hidraw = @import("../../hid/hidraw.zig");
const sysfs = @import("../../hid/sysfs.zig");
const filter = @import("../../hid/filter.zig");
const common = @import("common.zig");
const device_mod = @import("device.zig");
const joycon = @import("joycon.zig");
const timestamp = @import("../../events/timestamp.zig");

const Allocator = std.mem.Allocator;
const Device = device_mod.Device;
const Updates = common.Updates;
const Output = common.Output;

/// Driver order, matching SDL_HIDAPI_drivers: the first driver that accepts a
/// device wins.
pub const drivers = [_]device_mod.DriverId{
    .gamecube, .ps4,      .ps5,        .xboxone, .switch_pro,
    .xbox360,  .xbox360w, .xboxone_bt, .steam,   .steamdeck,
    .joycon,   .ps3,
};

/// Errors from scanning and updating. Device-level read failures are reported
/// through `Updates` (disconnects) rather than returned.
pub const Error = Allocator.Error || sysfs.Error || device_mod.Error;

/// Owns every known device. Devices are heap-allocated so drivers and the
/// registry can hold stable pointers across calls.
pub const Registry = struct {
    allocator: Allocator,
    options: filter.Options,
    config: common.Config,
    devices: std.ArrayList(*Device) = .empty,

    pub fn init(allocator: Allocator, options: filter.Options, config: common.Config) Registry {
        return .{ .allocator = allocator, .options = options, .config = config };
    }

    /// Closes every device and frees the registry. Joystick removals are not
    /// reported; call `scan` with an empty enumeration first if they matter.
    pub fn deinit(self: *Registry) void {
        for (self.devices.items) |dev| {
            dev.deinit();
            self.allocator.destroy(dev);
        }
        self.devices.deinit(self.allocator);
        self.* = undefined;
    }

    /// Refreshes the device list from sysfs (HIDAPI_UpdateDeviceList). New nodes
    /// are added and matched; nodes that disappeared are disconnected and freed.
    /// Combined Joy-Con devices are not in sysfs: they are kept here and created
    /// or dissolved by the registry itself.
    pub fn scan(self: *Registry, updates: *Updates, now: timestamp.Timestamp) Error!void {
        for (self.devices.items) |dev| dev.seen = is_combined(dev);

        const records = try sysfs.enumerate(self.allocator, self.options);
        defer self.allocator.free(records);
        // Each record's strings belong to us until handed to a device or freed.
        var consumed: usize = 0;
        errdefer for (records[consumed..]) |record| record.deinit(self.allocator);

        for (records) |record| {
            consumed += 1;
            // sysfs yields one record per HID collection; the first one per node
            // creates the device and the rest only mark it as seen.
            if (self.find_by_path(record.path)) |existing| {
                existing.seen = true;
                record.deinit(self.allocator);
                continue;
            }
            const dev = try self.allocator.create(Device);
            dev.* = Device.from_record(self.allocator, record) catch |err| {
                self.allocator.destroy(dev);
                return err;
            };
            dev.config = self.config;
            self.devices.append(self.allocator, dev) catch |err| {
                dev.deinit();
                self.allocator.destroy(dev);
                return err;
            };
            dev.seen = true;
            try self.setup(dev, updates, now);
        }

        // Removing a Joy-Con can dissolve its pair, which changes the indices,
        // so the search restarts after each removal.
        while (self.first_unseen()) |index| {
            try self.remove_at(index, updates, now);
        }

        try self.combine_joycons(updates, now);
    }

    /// Runs one update pass over every claimed device (HIDAPI_UpdateDevices).
    /// Input and device events are appended to `updates`; the caller clears it.
    /// Runs the input pass using `now` in the host monotonic nanosecond domain.
    pub fn update(self: *Registry, updates: *Updates, now: timestamp.Timestamp) Error!void {
        for (self.devices.items) |dev| {
            // A Joy-Con child is read through its combined device.
            if (dev.driver == null or dev.parent != null) continue;
            try self.update_device(dev, updates, now);
        }
    }

    /// Number of joysticks the host sees, counting every connected slot.
    pub fn connected_joystick_count(self: *const Registry) usize {
        var count: usize = 0;
        for (self.devices.items) |dev| count += dev.connected_count();
        return count;
    }

    /// Number of devices with at least one connected joystick.
    pub fn joystick_count(self: *const Registry) usize {
        var count: usize = 0;
        for (self.devices.items) |dev| {
            if (dev.is_connected()) count += 1;
        }
        return count;
    }

    /// The `index`-th connected device in discovery order, or null.
    pub fn joystick_at(self: *const Registry, index: usize) ?*Device {
        var seen: usize = 0;
        for (self.devices.items) |dev| {
            if (!dev.is_connected()) continue;
            if (seen == index) return dev;
            seen += 1;
        }
        return null;
    }

    fn first_unseen(self: *const Registry) ?usize {
        for (self.devices.items, 0..) |dev, index| {
            if (!dev.seen) return index;
        }
        return null;
    }

    fn index_of(self: *const Registry, dev: *const Device) ?usize {
        for (self.devices.items, 0..) |other, index| {
            if (other == dev) return index;
        }
        return null;
    }

    fn find_by_path(self: *const Registry, path: []const u8) ?*Device {
        for (self.devices.items) |dev| {
            if (std.mem.eql(u8, dev.info.path, path)) return dev;
        }
        return null;
    }

    /// Which driver claims `dev`, if any. `hid` is null while the node is not
    /// open yet. Mirrors HIDAPI_GetDeviceDriver: non-Valve, non-Flydigi devices
    /// must present a generic-desktop joystick, gamepad or multi-axis usage.
    fn match(dev: *const Device, hid: ?*hidraw.Device) ?device_mod.DriverId {
        const usage_page_generic_desktop: u16 = 0x0001;
        const usage_joystick: u16 = 0x0004;
        const usage_gamepad: u16 = 0x0005;
        const usage_multi_axis: u16 = 0x0008;
        const vendor_valve: u16 = 0x28de;
        const vendor_flydigi_v1: u16 = 0x04b4;
        const vendor_flydigi_v2: u16 = 0x37d7;

        const exempt = dev.info.vendor_id == vendor_valve or
            dev.info.vendor_id == vendor_flydigi_v1 or
            dev.info.vendor_id == vendor_flydigi_v2;
        if (!exempt) {
            if (dev.info.usage_page != 0 and dev.info.usage_page != usage_page_generic_desktop) return null;
            if (dev.info.usage != 0 and dev.info.usage != usage_joystick and
                dev.info.usage != usage_gamepad and dev.info.usage != usage_multi_axis) return null;
        }

        const probe = dev.probe(hid);
        inline for (drivers) |id| {
            if (device_mod.driver_module(id).supports(probe)) return id;
        }
        return null;
    }

    /// Claims `dev` if a driver accepts it: opens the node, runs the driver
    /// init, and connects the joystick when the driver says so
    /// (HIDAPI_SetupDeviceDriver). A device no driver accepts stays unclaimed.
    fn setup(self: *Registry, dev: *Device, updates: *Updates, now: u64) Error!void {
        if (match(dev, null) == null) return;
        dev.open_hid() catch return;

        const id = (if (dev.hid) |*handle| match(dev, handle) else null) orelse {
            dev.close_hid();
            return;
        };
        dev.driver = initial_state(id);

        const env: device_mod.Env = .{ .devices = self.devices.items };
        const connect_now = dev.run_init(env) catch {
            dev.close_driver();
            return;
        };
        if (device_mod.bluetooth_yields_to_usb(id) and !dev.info.bluetooth) {
            try self.disconnect_bluetooth_peers(dev, updates, now);
        }
        if (connect_now) try dev.attach_slot(0, updates);
    }

    /// Initial driver state for a driver identifier.
    fn initial_state(id: device_mod.DriverId) device_mod.DriverState {
        return switch (id) {
            .ps4 => .{ .ps4 = .{} },
            .ps5 => .{ .ps5 = .{} },
            .xboxone => .{ .xboxone = .{} },
            .switch_pro => .{ .switch_pro = .{} },
            .xbox360 => .{ .xbox360 = .{} },
            .xbox360w => .{ .xbox360w = .{} },
            .xboxone_bt => .{ .xboxone_bt = .{} },
            .steam => .{ .steam = .{} },
            .steamdeck => .{ .steamdeck = .{} },
            .joycon => .{ .joycon = .{} },
            .joycon_pair => .{ .joycon_pair = .{} },
            .gamecube => .{ .gamecube = .{} },
            .ps3 => .{ .ps3 = .{} },
        };
    }

    /// Disconnects Bluetooth copies of a controller that is now connected over
    /// USB (HIDAPI_DisconnectBluetoothDevice). Matches on a non-empty serial.
    fn disconnect_bluetooth_peers(self: *Registry, usb: *const Device, updates: *Updates, now: u64) Error!void {
        const serial = usb.info.serial;
        if (serial.len == 0) return;
        for (self.devices.items) |other| {
            if (!other.info.bluetooth or !other.is_connected()) continue;
            if (!std.mem.eql(u8, other.info.serial, serial)) continue;
            try other.disconnect_with_recenter(updates, now);
        }
    }

    /// The side of a single Joy-Con, or null for any other device.
    fn joycon_side(dev: *const Device) ?joycon.Side {
        const state = dev.driver orelse return null;
        return switch (state) {
            .joycon => |ctx| ctx.side,
            else => null,
        };
    }

    fn is_combined(dev: *const Device) bool {
        const state = dev.driver orelse return false;
        return state == .joycon_pair;
    }

    /// Creates combined devices for left and right Joy-Cons that are claimed and
    /// not yet combined (HIDAPI_CreateCombinedJoyCons). The children's own
    /// joysticks are closed first, and the pair's joystick takes their place.
    fn combine_joycons(self: *Registry, updates: *Updates, now: u64) Error!void {
        if (!self.config.combine_joycons) return;
        while (true) {
            var left: ?*Device = null;
            var right: ?*Device = null;
            for (self.devices.items) |dev| {
                if (dev.parent != null) continue;
                const side = joycon_side(dev) orelse continue;
                if (side == .left and left == null) left = dev;
                if (side == .right and right == null) right = dev;
            }
            const l = left orelse return;
            const r = right orelse return;

            const combined = try self.allocator.create(Device);
            combined.* = Device.combined(self.allocator, l, r) catch |err| {
                self.allocator.destroy(combined);
                return err;
            };
            combined.config = self.config;
            combined.seen = true;
            combined.driver = .{ .joycon_pair = .{ .left = l, .right = r } };
            self.devices.append(self.allocator, combined) catch |err| {
                combined.deinit();
                self.allocator.destroy(combined);
                return err;
            };
            // From here the list owns `combined`.
            l.parent = combined;
            r.parent = combined;
            try l.disconnect_with_recenter(updates, now);
            try r.disconnect_with_recenter(updates, now);
            try combined.attach_slot(0, updates);
        }
    }

    /// Removes a combined device whose child is leaving, and lets the surviving
    /// child show its own joystick again.
    fn dissolve_pair(self: *Registry, combined: *Device, leaving: *Device, updates: *Updates, now: u64) Error!void {
        const survivor: ?*Device = if (combined.driver) |state| switch (state) {
            .joycon_pair => |ctx| if (ctx.left == leaving) ctx.right else ctx.left,
            else => null,
        } else null;
        if (self.index_of(combined)) |index| {
            const removed = self.devices.orderedRemove(index);
            defer self.allocator.destroy(removed);
            defer removed.deinit();
            try removed.disconnect_with_recenter(updates, now);
        }
        if (survivor) |other| {
            other.parent = null;
            try other.attach_slot(0, updates);
        }
    }

    /// Runs one driver update for `dev` and applies the connect, disconnect and
    /// read-failure requests it returns. Pending output reports are written last.
    fn update_device(self: *Registry, dev: *Device, updates: *Updates, now: u64) Error!void {
        const env: device_mod.Env = .{ .devices = self.devices.items };
        var out: Output = .{
            .allocator = self.allocator,
            .joystick = dev.joystick_slot(0),
            .updates = updates,
            .state = &dev.state,
            .timestamp = now,
        };
        const report = try dev.run_update(&out, env);

        if (dev.is_connected() and (report.read_failed or report.disconnect)) {
            try dev.disconnect_with_recenter(updates, now);
        }
        if (report.connect and !dev.slot_connected(0)) {
            try dev.attach_slot(0, updates);
        }
        if (dev.hid) |*handle| {
            // A failed write means the node went away; the next read reports it.
            dev.rumble.flush(handle) catch {};
        }
    }

    /// Disconnects and frees the device at `index`. A Joy-Con that leaves takes
    /// its combined pair with it; the other Joy-Con stays.
    fn remove_at(self: *Registry, index: usize, updates: *Updates, now: u64) Error!void {
        const dev = self.devices.orderedRemove(index);
        defer self.allocator.destroy(dev);
        defer dev.deinit();
        if (dev.parent) |combined| {
            try self.dissolve_pair(combined, dev, updates, now);
            dev.parent = null;
        }
        try dev.disconnect_with_recenter(updates, now);
    }
};
