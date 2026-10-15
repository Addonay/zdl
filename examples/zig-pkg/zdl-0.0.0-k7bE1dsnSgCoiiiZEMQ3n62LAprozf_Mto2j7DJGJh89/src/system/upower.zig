//! Battery state from UPower over the system bus, ported from SDL's
//! `src/power/linux/SDL_syspower.c` (`SDL_GetPowerInfo_Linux_org_freedesktop_upower`
//! and `check_upower_device`).
//!
//! Source order, as SDL does it:
//! 1. `GetDisplayDevice`. When the service answers, only that device is checked.
//! 2. Otherwise `EnumerateDevices`, and every returned device is checked.
//! 3. When neither call answers, UPower is unavailable and `query` returns null,
//!    so the caller can fall back to sysfs (`power.zig`).
//!
//! A device counts only when `Type` is battery (2) and `PowerSupply` is true. For
//! such a device `IsPresent` selects "no battery" or the `State` mapping, and
//! `Percentage` and `TimeToEmpty` feed the best-battery rule in `Pick.prefers`. The
//! `Refresh` method runs before `State` is read; its failure is ignored, as in SDL.
//!
//! Each exchange is one synchronous method call on the caller's connection, with
//! libdbus's default timeout (SDL's behavior). Nothing is cached or global.
//!
//! Deliberate differences from SDL:
//! - Out-of-memory is returned as `error.OutOfMemory`. Every other bus or service
//!   failure means "no answer", as SDL reports it. A disconnected bus therefore
//!   gives null, not an error.
//! - Replies are decoded into fixed stack buffers, so the module allocates nothing.
//!   A device list that does not fit `list_buffer_bytes` (about 80 devices) returns
//!   `error.OutOfMemory`.
//! - A non-finite `Percentage` (NaN, infinity) counts as absent. SDL's `(int)` cast
//!   is undefined for it. Finite values are truncated and clamped at 100, as SDL does.
//! - `TimeToEmpty` is read in every state, as SDL does. `power.Info.seconds` is
//!   therefore set on a charging battery when UPower reports a value.
const std = @import("std");
const Allocator = std.mem.Allocator;
const power = @import("power.zig");
const connection = @import("../linux/dbus/connection.zig");
const message = @import("../linux/dbus/message.zig");
const value = @import("../linux/dbus/value.zig");
const Message = message.Message;
const Value = value.Value;

/// The libdbus loader. Re-exported so a caller can open the system bus without
/// importing the D-Bus namespace. The loaded library must outlive the connection.
pub const Library = connection.Library;

/// A bus connection. Re-exported with `Library`; open it on the system bus.
pub const Connection = connection.Connection;

/// Failures of `query` itself. Bus and service failures are not errors here.
pub const Error = Allocator.Error;

const service_name: [:0]const u8 = "org.freedesktop.UPower";
const root_path: [:0]const u8 = "/org/freedesktop/UPower";
const root_interface: [:0]const u8 = "org.freedesktop.UPower";
const device_interface: [:0]const u8 = "org.freedesktop.UPower.Device";
const properties_interface: [:0]const u8 = "org.freedesktop.DBus.Properties";

/// Stack memory for the device list: the decoded reply and the device paths.
const list_buffer_bytes = 16 * 1024;
/// Stack memory for one property read, refresh or other single exchange.
const exchange_buffer_bytes = 1024;

/// UPower `Device.Type` value for a battery (enum UpDeviceKind).
const device_type_battery: u32 = 2;

/// Sentinel for "unknown" in the selection rule, mirroring SDL's -1 integers.
const unknown: i64 = -1;

/// Errors from one bus exchange. Includes the libdbus, message and value errors.
const ExchangeError = connection.Error;

/// Sends one method call to `service_name` and waits for its reply, using
/// libdbus's default timeout. `gpa` holds the temporary copies made while the
/// arguments are encoded. The caller owns the reply.
fn exchange(conn: *Connection, gpa: Allocator, object_path: [:0]const u8, interface: [:0]const u8, member: [:0]const u8, args: []const Value) ExchangeError!Message {
    var msg = try Message.method_call(conn.lib, service_name, object_path, interface, member);
    defer msg.deinit();
    try msg.append(gpa, args);
    return conn.call(&msg, -1);
}

/// Passes out-of-memory on; any other exchange failure means "no answer".
fn keep_oom(err: anyerror) Error!void {
    if (err == error.OutOfMemory) return error.OutOfMemory;
}

/// Maps a UPower `Device.State` value to a power state (SDL's mapping):
/// 1 charging; 2 discharging, 3 empty, 6 pending discharge as on battery;
/// 4 fully charged and 5 pending charge as charged; any other value is unknown.
fn map_state(raw: u32) power.State {
    return switch (raw) {
        1 => .charging,
        2, 3, 6 => .on_battery,
        4, 5 => .charged,
        else => .unknown,
    };
}

/// SDL truncates `Percentage` with a C int and clamps only the top end at 100.
/// Non-finite input is treated as absent (see the module doc).
fn percent_from_double(raw: f64) i64 {
    if (!std.math.isFinite(raw)) return unknown;
    const clamped = std.math.clamp(@trunc(raw), -2147483648.0, 100.0);
    return @intFromFloat(clamped);
}

/// SDL stores `TimeToEmpty` in a C int, so the value is truncated to 32 bits.
/// Zero and negative values mean unknown.
fn seconds_from_int64(raw: i64) i64 {
    const truncated: i32 = @truncate(raw);
    return if (truncated <= 0) unknown else @as(i64, truncated);
}

/// Reads one property with `org.freedesktop.DBus.Properties.Get` and returns the
/// payload value. Null on a service failure or a malformed reply, as
/// SDL_DBus_QueryPropertyOnConnection reports them. The typed wrappers below
/// reject a payload of the wrong type.
fn get_property(conn: *Connection, object_path: [:0]const u8, name: [:0]const u8) Error!?Value {
    var buffer: [exchange_buffer_bytes]u8 = undefined;
    var fba = std.heap.FixedBufferAllocator.init(&buffer);
    const gpa = fba.allocator();
    const args = [_]Value{ .{ .string = device_interface }, .{ .string = name } };
    var reply = exchange(conn, gpa, object_path, properties_interface, "Get", &args) catch |err| {
        try keep_oom(err);
        return null;
    };
    defer reply.deinit();
    const values = reply.body(gpa) catch |err| {
        try keep_oom(err);
        return null;
    };
    if (values.len != 1 or values[0] != .variant) return null;
    return values[0].variant.value.*;
}

fn property_u32(conn: *Connection, object_path: [:0]const u8, name: [:0]const u8) Error!?u32 {
    const payload = (try get_property(conn, object_path, name)) orelse return null;
    return if (payload == .uint32) payload.uint32 else null;
}

fn property_bool(conn: *Connection, object_path: [:0]const u8, name: [:0]const u8) Error!?bool {
    const payload = (try get_property(conn, object_path, name)) orelse return null;
    return if (payload == .boolean) payload.boolean else null;
}

fn property_f64(conn: *Connection, object_path: [:0]const u8, name: [:0]const u8) Error!?f64 {
    const payload = (try get_property(conn, object_path, name)) orelse return null;
    return if (payload == .double) payload.double else null;
}

fn property_i64(conn: *Connection, object_path: [:0]const u8, name: [:0]const u8) Error!?i64 {
    const payload = (try get_property(conn, object_path, name)) orelse return null;
    return if (payload == .int64) payload.int64 else null;
}

/// Asks the device to refresh its data before `State` is read. SDL ignores the
/// result, so only out-of-memory is reported.
fn refresh(conn: *Connection, object_path: [:0]const u8) Error!void {
    var buffer: [exchange_buffer_bytes]u8 = undefined;
    var fba = std.heap.FixedBufferAllocator.init(&buffer);
    var reply = exchange(conn, fba.allocator(), object_path, device_interface, "Refresh", &.{}) catch |err| return keep_oom(err);
    reply.deinit();
}

/// `GetDisplayDevice`: the composite battery's object path, owned by `arena`.
/// Null when the call or its reply fails, so the caller tries `EnumerateDevices`.
fn display_device(conn: *Connection, arena: Allocator) Error!?[:0]const u8 {
    var reply = exchange(conn, arena, root_path, root_interface, "GetDisplayDevice", &.{}) catch |err| {
        try keep_oom(err);
        return null;
    };
    defer reply.deinit();
    const values = reply.body(arena) catch |err| {
        try keep_oom(err);
        return null;
    };
    if (values.len != 1 or values[0] != .object_path) return null;
    return try arena.dupeSentinel(u8, values[0].object_path, 0);
}

/// `EnumerateDevices`: every device object path, owned by `arena`. Null when the
/// call or its reply fails.
fn enumerate_devices(conn: *Connection, arena: Allocator) Error!?[]const [:0]const u8 {
    var reply = exchange(conn, arena, root_path, root_interface, "EnumerateDevices", &.{}) catch |err| {
        try keep_oom(err);
        return null;
    };
    defer reply.deinit();
    const values = reply.body(arena) catch |err| {
        try keep_oom(err);
        return null;
    };
    if (values.len != 1 or values[0] != .array) return null;
    const items = values[0].array.items;
    const paths = try arena.alloc([:0]const u8, items.len);
    for (items, paths) |item, *out| {
        if (item != .object_path) return null;
        out.* = try arena.dupeSentinel(u8, item.object_path, 0);
    }
    return paths;
}

/// SDL's running choice over the devices. The battery claiming the most seconds
/// left wins; with no time estimate anywhere, the highest percent wins; with
/// neither, the first battery found wins. The starting state is "plugged in, no
/// battery", which is what SDL reports when no battery is found.
const Pick = struct {
    state: power.State = .no_battery,
    seconds: i64 = unknown,
    percent: i64 = unknown,

    fn consider(self: *Pick, state: power.State, seconds: i64, percent: i64) void {
        if (!self.prefers(seconds, percent)) return;
        self.* = .{ .state = state, .seconds = seconds, .percent = percent };
    }

    /// The rule from SDL's `check_upower_device`, with -1 meaning unknown.
    fn prefers(self: Pick, seconds: i64, percent: i64) bool {
        if (seconds < 0 and self.seconds < 0) {
            if (percent < 0 and self.percent < 0) return true;
            return percent > self.percent;
        }
        return seconds > self.seconds;
    }

    fn info(self: Pick) power.Info {
        return .{
            .state = self.state,
            .seconds = if (self.seconds < 0) null else @intCast(self.seconds),
            .percent = if (self.percent < 0) null else @intCast(self.percent),
        };
    }
};

/// Checks one device and offers it to `pick` when it is a power-supplying battery.
/// Each unreadable property ends the check without an error, as in SDL.
fn check_device(conn: *Connection, object_path: [:0]const u8, pick: *Pick) Error!void {
    const kind = (try property_u32(conn, object_path, "Type")) orelse return;
    if (kind != device_type_battery) return;
    const supply = (try property_bool(conn, object_path, "PowerSupply")) orelse return;
    if (!supply) return;
    const present = (try property_bool(conn, object_path, "IsPresent")) orelse return;
    const state: power.State = if (!present) .no_battery else blk: {
        try refresh(conn, object_path);
        const raw = (try property_u32(conn, object_path, "State")) orelse break :blk .unknown;
        break :blk map_state(raw);
    };
    const percent: i64 = if (try property_f64(conn, object_path, "Percentage")) |raw| percent_from_double(raw) else unknown;
    const seconds: i64 = if (try property_i64(conn, object_path, "TimeToEmpty")) |raw| seconds_from_int64(raw) else unknown;
    pick.consider(state, seconds, percent);
}

/// Reads the battery state from UPower on `conn`, which must be connected to the
/// system bus. Returns null when UPower does not answer (not installed, not
/// running, or refused), so the caller can try another source. Returns
/// `error.OutOfMemory` when the device list does not fit the fixed buffer.
pub fn query(conn: *Connection) Error!?power.Info {
    var list_buffer: [list_buffer_bytes]u8 = undefined;
    var list = std.heap.FixedBufferAllocator.init(&list_buffer);
    const arena = list.allocator();

    var pick: Pick = .{};
    if (try display_device(conn, arena)) |path| {
        try check_device(conn, path, &pick);
        return pick.info();
    }
    const paths = (try enumerate_devices(conn, arena)) orelse return null;
    for (paths) |path| try check_device(conn, path, &pick);
    return pick.info();
}
