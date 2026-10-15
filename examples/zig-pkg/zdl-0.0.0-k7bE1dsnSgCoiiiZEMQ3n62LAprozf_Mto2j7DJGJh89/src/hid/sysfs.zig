//! HID device enumeration through sysfs, without libudev.
//!
//! Each `/sys/class/hidraw/hidrawN` entry links to its HID device directory,
//! whose `uevent` file carries HID_ID, HID_NAME and HID_UNIQ. USB devices add
//! attributes on ancestor directories: the interface directory holds
//! `bInterfaceNumber`, and the USB device directory holds `idVendor`,
//! `manufacturer`, `product` and `bcdDevice`. The report descriptor is read from
//! `device/report_descriptor`.
//!
//! Altered native port of the Linux enumeration in SDL's hidapi/linux/hid.c
//! (create_device_info_for_device, parse_uevent_info and friends). udev's
//! parent-device lookups become fixed ancestor walks over sysfs paths. Every
//! string in a returned record is owned by the caller's allocator.

const std = @import("std");
const builtin = @import("builtin");
const linux = std.os.linux;
const Allocator = std.mem.Allocator;
const native_endian = builtin.target.cpu.arch.endian();
const filter = @import("filter.zig");
const report_descriptor = @import("report_descriptor.zig");

pub const Bus = filter.Bus;

/// Errors from sysfs and directory access. Missing attributes are not errors:
/// they produce empty strings or zero values, as in SDL.
pub const Error = Allocator.Error || error{
    PermissionDenied,
    DeviceUnavailable,
    Io,
    NameTooLong,
};

const sysfs_class_dir = "/sys/class/hidraw";
const dev_dir = "/dev";
/// HID_MAX_DESCRIPTOR_SIZE from <linux/hidraw.h>.
pub const max_descriptor_size = 4096;

// Kernel bus identifiers from <linux/input.h>, as they appear in HID_ID.
const bus_usb: u32 = 0x03;
const bus_bluetooth: u32 = 0x05;
const bus_i2c: u32 = 0x18;
const bus_spi: u32 = 0x1c;

/// One HID collection exposed by a hidraw node. A device with several top-level
/// collections yields one record per Usage Page/Usage pair, as SDL does.
pub const DeviceInfo = struct {
    /// Device node, for example "/dev/hidraw3". Owned.
    path: []u8,
    bus: Bus,
    vendor_id: u16,
    product_id: u16,
    /// bcdDevice from the USB device, zero when not USB.
    release_number: u16,
    /// USB interface number, or null when the device is not a USB interface.
    interface_number: ?u8,
    /// Empty when the device does not provide one. Owned.
    manufacturer: []u8,
    /// Product name from the USB device or HID_NAME. Owned.
    product: []u8,
    /// HID_UNIQ, which is empty when absent. Owned.
    serial_number: []u8,
    usage_page: u16,
    usage: u16,

    pub fn deinit(self: DeviceInfo, allocator: Allocator) void {
        allocator.free(self.path);
        allocator.free(self.manufacturer);
        allocator.free(self.product);
        allocator.free(self.serial_number);
    }
};

/// Frees a slice returned by `enumerate` or `info_for_node`.
pub fn free_device_infos(allocator: Allocator, infos: []DeviceInfo) void {
    for (infos) |info| info.deinit(allocator);
    allocator.free(infos);
}

/// Fields extracted from a HID device's `uevent` text. Slices borrow `text`.
pub const Uevent = struct {
    bus: u32 = 0,
    vendor_id: u16 = 0,
    product_id: u16 = 0,
    has_id: bool = false,
    name: ?[]const u8 = null,
    uniq: ?[]const u8 = null,
};

/// Parses "KEY=value" lines. A malformed HID_ID is ignored, matching SDL's
/// behavior of leaving the identifier fields unset.
pub fn parse_uevent(text: []const u8) Uevent {
    var result: Uevent = .{};
    var lines = std.mem.tokenizeScalar(u8, text, '\n');
    while (lines.next()) |line| {
        const eq = std.mem.indexOfScalar(u8, line, '=') orelse continue;
        const key = line[0..eq];
        const value = line[eq + 1 ..];
        if (std.mem.eql(u8, key, "HID_ID")) {
            if (parse_hid_id(value)) |id| {
                result.bus = id.bus;
                result.vendor_id = id.vendor;
                result.product_id = id.product;
                result.has_id = true;
            }
        } else if (std.mem.eql(u8, key, "HID_NAME")) {
            result.name = value;
        } else if (std.mem.eql(u8, key, "HID_UNIQ")) {
            result.uniq = value;
        }
    }
    return result;
}

const HidId = struct { bus: u32, vendor: u16, product: u16 };

/// Parses "BBBB:VVVVVVVV:PPPPPPPP" (bus, vendor and product in hexadecimal).
fn parse_hid_id(value: []const u8) ?HidId {
    var fields = std.mem.splitScalar(u8, value, ':');
    const bus = std.fmt.parseUnsigned(u32, fields.next() orelse return null, 16) catch return null;
    const vendor = std.fmt.parseUnsigned(u32, fields.next() orelse return null, 16) catch return null;
    const product = std.fmt.parseUnsigned(u32, fields.next() orelse return null, 16) catch return null;
    if (vendor > std.math.maxInt(u16) or product > std.math.maxInt(u16)) return null;
    return .{ .bus = bus, .vendor = @intCast(vendor), .product = @intCast(product) };
}

fn parse_hex_attribute(text: []const u8) ?u32 {
    const trimmed = std.mem.trim(u8, text, " \n\r\t");
    return std.fmt.parseUnsigned(u32, trimmed, 16) catch null;
}

fn map_bus(raw: u32) ?Bus {
    return switch (raw) {
        bus_usb => .usb,
        bus_bluetooth => .bluetooth,
        bus_i2c => .i2c,
        bus_spi => .spi,
        else => null,
    };
}

// ---- Filesystem helpers ----

fn map_errno(e: linux.E) Error {
    return switch (e) {
        .ACCES, .PERM => error.PermissionDenied,
        .NOENT, .NODEV, .NXIO => error.DeviceUnavailable,
        .NOMEM => error.OutOfMemory,
        else => error.Io,
    };
}

fn check(rc: usize) Error!usize {
    const e = linux.errno(rc);
    if (e != .SUCCESS) return map_errno(e);
    return rc;
}

/// Opens a path read-only. Returns null when the path is missing or unreadable,
/// since optional sysfs attributes are normal.
fn try_open(path: []const u8) ?i32 {
    const z = std.posix.toPosixPath(path) catch return null;
    const rc = linux.open(&z, .{ .ACCMODE = .RDONLY, .CLOEXEC = true }, 0);
    if (linux.errno(rc) != .SUCCESS) return null;
    return @intCast(rc);
}

/// Reads up to `max_len` bytes of a sysfs or procfs attribute. Returns null when
/// the file is missing; the caller owns the returned slice.
fn read_attribute(allocator: Allocator, path: []const u8, max_len: usize) Error!?[]u8 {
    const fd = try_open(path) orelse return null;
    defer _ = linux.close(fd);
    const buf = try allocator.alloc(u8, max_len);
    defer allocator.free(buf);
    var total: usize = 0;
    while (total < max_len) {
        const rc = linux.read(fd, buf[total..].ptr, max_len - total);
        const e = linux.errno(rc);
        if (e == .INTR) continue;
        if (e != .SUCCESS) return map_errno(e);
        if (rc == 0) break;
        total += rc;
    }
    return try allocator.dupe(u8, buf[0..total]);
}

/// Joins a directory with `up` levels of ".." and an attribute name.
fn join_up(allocator: Allocator, base: []const u8, up: usize, leaf: []const u8) Allocator.Error![]u8 {
    var list: std.ArrayList(u8) = .empty;
    errdefer list.deinit(allocator);
    try list.appendSlice(allocator, base);
    for (0..up) |_| try list.appendSlice(allocator, "/..");
    try list.append(allocator, '/');
    try list.appendSlice(allocator, leaf);
    return list.toOwnedSlice(allocator);
}

/// Reads a sysfs attribute at an ancestor of `base` and returns its trimmed text,
/// or an empty string when it is missing.
fn attribute_or_empty(allocator: Allocator, base: []const u8, up: usize, leaf: []const u8) Error![]u8 {
    const path = try join_up(allocator, base, up, leaf);
    defer allocator.free(path);
    const text = (try read_attribute(allocator, path, 256)) orelse return allocator.dupe(u8, "");
    defer allocator.free(text);
    return allocator.dupe(u8, std.mem.trim(u8, text, " \n\r\t"));
}

/// Finds the USB device that owns a HID device directory. The HID device sits
/// under its USB interface, which sits under the USB device, so the search tries
/// one to three levels up for `idVendor`. Returns null for virtual (uhid) nodes,
/// matching SDL's treatment of devices with no USB parent.
fn find_usb_depth(allocator: Allocator, base: []const u8) Error!?usize {
    for (1..4) |depth| {
        const path = try join_up(allocator, base, depth, "idVendor");
        defer allocator.free(path);
        if (try_open(path)) |fd| {
            _ = linux.close(fd);
            return depth;
        }
    }
    return null;
}

/// Reads a hex attribute from an ancestor, or null when it is missing.
fn hex_attribute_at(allocator: Allocator, base: []const u8, up: usize, leaf: []const u8) Error!?u32 {
    const path = try join_up(allocator, base, up, leaf);
    defer allocator.free(path);
    const text = (try read_attribute(allocator, path, 64)) orelse return null;
    defer allocator.free(text);
    return parse_hex_attribute(text);
}

fn unique_or_empty(allocator: Allocator, value: ?[]const u8) Allocator.Error![]u8 {
    return allocator.dupe(u8, value orelse "");
}

// ---- Directory enumeration ----

/// Returns the sorted indices N of entries named `hidrawN`.
fn hidraw_indices(allocator: Allocator) Error![]u32 {
    var indices: std.ArrayList(u32) = .empty;
    errdefer indices.deinit(allocator);

    const z = std.posix.toPosixPath(sysfs_class_dir) catch return error.NameTooLong;
    const fd_rc = linux.open(&z, .{ .DIRECTORY = true, .CLOEXEC = true }, 0);
    _ = try check(fd_rc);
    const fd: i32 = @intCast(fd_rc);
    defer _ = linux.close(fd);

    var buf: [4096]u8 align(8) = undefined;
    while (true) {
        const count = try check(linux.getdents64(fd, &buf, @intCast(buf.len)));
        if (count == 0) break;
        var offset: usize = 0;
        while (offset < count) {
            const reclen = std.mem.readInt(u16, buf[offset + 16 ..][0..2], native_endian);
            const name = std.mem.sliceTo(buf[offset + 19 .. offset + reclen], 0);
            if (parse_hidraw_index(name)) |index| try indices.append(allocator, index);
            offset += reclen;
        }
    }
    std.mem.sort(u32, indices.items, {}, std.sort.asc(u32));
    return indices.toOwnedSlice(allocator);
}

fn parse_hidraw_index(name: []const u8) ?u32 {
    const prefix = "hidraw";
    if (!std.mem.startsWith(u8, name, prefix)) return null;
    const digits = name[prefix.len..];
    if (digits.len == 0) return null;
    return std.fmt.parseUnsigned(u32, digits, 10) catch null;
}

/// Lists every HID collection of every hidraw node, filtered by `options`, in
/// node-index order. The caller frees the result with `free_device_infos`.
pub fn enumerate(allocator: Allocator, options: filter.Options) Error![]DeviceInfo {
    const indices = try hidraw_indices(allocator);
    defer allocator.free(indices);

    var infos: std.ArrayList(DeviceInfo) = .empty;
    errdefer {
        for (infos.items) |info| info.deinit(allocator);
        infos.deinit(allocator);
    }
    for (indices) |index| {
        var name_buf: [32]u8 = undefined;
        const name = std.fmt.bufPrint(&name_buf, "hidraw{d}", .{index}) catch unreachable;
        const node_infos = try info_for_node(allocator, name, options);
        defer allocator.free(node_infos);
        for (node_infos) |info| try infos.append(allocator, info);
    }
    return infos.toOwnedSlice(allocator);
}

/// Builds the records for one hidraw node such as "hidraw3". Returns an empty
/// slice when the node is not an HID device on a supported bus or is filtered out.
/// The caller frees the slice with `free_device_infos`.
pub fn info_for_node(allocator: Allocator, node_name: []const u8, options: filter.Options) Error![]DeviceInfo {
    var records: std.ArrayList(DeviceInfo) = .empty;
    errdefer {
        for (records.items) |record| record.deinit(allocator);
        records.deinit(allocator);
    }

    const base = try std.fmt.allocPrint(allocator, "{s}/{s}/device", .{ sysfs_class_dir, node_name });
    defer allocator.free(base);

    const uevent_path = try std.fmt.allocPrint(allocator, "{s}/uevent", .{base});
    defer allocator.free(uevent_path);
    const uevent_text = (try read_attribute(allocator, uevent_path, 1024)) orelse
        return records.toOwnedSlice(allocator);
    defer allocator.free(uevent_text);

    const uevent = parse_uevent(uevent_text);
    if (!uevent.has_id) return records.toOwnedSlice(allocator);
    const bus = map_bus(uevent.bus) orelse return records.toOwnedSlice(allocator);

    // Manufacturer, product and release come from the USB device when present.
    // Bluetooth, I2C and SPI devices have no USB attributes, so HID_NAME is used.
    var bus_out: Bus = bus;
    var manufacturer: []u8 = try allocator.dupe(u8, "");
    var product: []u8 = try unique_or_empty(allocator, uevent.name);
    var release: u16 = 0;
    var interface_number: ?u8 = null;

    if (bus == .usb) {
        if (try find_usb_depth(allocator, base)) |depth| {
            // Build replacements first so a failure leaves the old strings owned.
            const new_manufacturer = try attribute_or_empty(allocator, base, depth, "manufacturer");
            allocator.free(manufacturer);
            manufacturer = new_manufacturer;
            const new_product = try attribute_or_empty(allocator, base, depth, "product");
            allocator.free(product);
            product = new_product;
            if (try hex_attribute_at(allocator, base, depth, "bcdDevice")) |value| release = @truncate(value);
            if (depth >= 2) {
                if (try hex_attribute_at(allocator, base, depth - 1, "bInterfaceNumber")) |value| {
                    interface_number = @truncate(value);
                }
            }
        } else {
            // Virtual uhid nodes have no USB parent. SDL leaves the bus unknown.
            bus_out = .unknown;
        }
    }

    const serial = try unique_or_empty(allocator, uevent.uniq);
    errdefer allocator.free(serial);

    const descriptor_path = try std.fmt.allocPrint(allocator, "{s}/report_descriptor", .{base});
    defer allocator.free(descriptor_path);
    const descriptor = (try read_attribute(allocator, descriptor_path, max_descriptor_size)) orelse
        try allocator.dupe(u8, "");
    defer allocator.free(descriptor);

    // Collect usage pairs first; each becomes one record. A descriptor without
    // any pair still yields one record with zero usage.
    var pairs: std.ArrayList(report_descriptor.Usage) = .empty;
    defer pairs.deinit(allocator);
    var iterator: report_descriptor.Iterator = .{ .descriptor = descriptor };
    while (true) {
        const pair = iterator.next() catch break;
        const found = pair orelse break;
        try pairs.append(allocator, found);
    }
    if (pairs.items.len == 0) try pairs.append(allocator, .{ .page = 0, .usage = 0 });

    for (pairs.items) |pair| {
        if (filter.is_ignored(options, bus_out, uevent.vendor_id, uevent.product_id, pair.page, pair.usage)) continue;
        const path = try std.fmt.allocPrint(allocator, "{s}/{s}", .{ dev_dir, node_name });
        errdefer allocator.free(path);
        const record_manufacturer = try allocator.dupe(u8, manufacturer);
        errdefer allocator.free(record_manufacturer);
        const record_product = try allocator.dupe(u8, product);
        errdefer allocator.free(record_product);
        const record_serial = try allocator.dupe(u8, serial);
        errdefer allocator.free(record_serial);
        try records.append(allocator, .{
            .path = path,
            .bus = bus_out,
            .vendor_id = uevent.vendor_id,
            .product_id = uevent.product_id,
            .release_number = release,
            .interface_number = interface_number,
            .manufacturer = record_manufacturer,
            .product = record_product,
            .serial_number = record_serial,
            .usage_page = pair.page,
            .usage = pair.usage,
        });
    }

    allocator.free(manufacturer);
    allocator.free(product);
    allocator.free(serial);
    return records.toOwnedSlice(allocator);
}
