//! A D-Bus connection to the session or system bus, backed by libdbus.
//!
//! `open` uses `dbus_bus_get_private`, so the connection is not shared through
//! libdbus's process-wide table: each zdl connection is an independent handle
//! that `close` releases. The connection holds a pointer to the caller's loaded
//! `Library`, which must outlive it.
//!
//! libdbus performs the handshake, authentication and fd negotiation itself.
//! Calls block the calling thread; `receive` pulls messages from the queue and
//! waits for socket data with a deadline. This module starts no threads.
//!
//! Errors reported by the bus or by services are mapped to the error set by
//! their D-Bus error name (see `map_error`), so an error reply never reaches
//! the caller as a message.

const std = @import("std");
const linux = std.os.linux;
const binding = @import("binding.zig");
const message = @import("message.zig");
const Message = message.Message;

pub const Error = binding.Error || message.Error || error{
    /// The bus could not be reached or the handshake failed.
    ConnectFailed,
    /// No reply or message arrived before the deadline.
    Timeout,
    /// The connection closed.
    Disconnected,
    /// The bus name is owned by another process and was not taken over.
    NameNotAcquired,
    /// The destination service is not running or has no owner.
    ServiceUnavailable,
    /// The bus or service refused the request.
    AccessDenied,
    /// The service answered with an error not covered by a dedicated variant.
    RemoteError,
    /// A method argument was rejected (e.g. malformed name or path).
    InvalidArgument,
};

/// A loaded libdbus-1, the entry point for connections. Open one per process
/// and pass a pointer to every connection and message that uses it; `close`
/// must run after all of them are released.
///
/// The C function table is kept in the `libdbus` field so the sibling D-Bus
/// modules (message, value, desktop) can call it. It is an implementation
/// detail: callers use only `open` and `close`.
pub const Library = struct {
    libdbus: binding.Library,

    /// Loads libdbus-1.so.3 and initializes its thread support.
    pub fn open() binding.Error!Library {
        return .{ .libdbus = try binding.Library.open() };
    }

    /// Unloads libdbus. Invalidates every connection and message opened from it.
    pub fn close(self: *Library) void {
        self.libdbus.close();
        self.* = undefined;
    }
};

/// Which well-known bus to connect to.
pub const Bus = enum {
    session,
    system,

    fn raw(self: Bus) c_int {
        return switch (self) {
            .session => binding.bus_session,
            .system => binding.bus_system,
        };
    }
};

/// Maps a libdbus error (name and text stored in `storage`) to the zdl error set.
fn map_error(storage: *const binding.ErrorStorage) Error {
    const name = binding.error_name(storage) orelse return error.RemoteError;
    const eql = std.mem.eql;
    if (eql(u8, name, "org.freedesktop.DBus.Error.NoReply") or eql(u8, name, "org.freedesktop.DBus.Error.Timeout")) return error.Timeout;
    if (eql(u8, name, "org.freedesktop.DBus.Error.Disconnected")) return error.Disconnected;
    if (eql(u8, name, "org.freedesktop.DBus.Error.ServiceUnknown") or eql(u8, name, "org.freedesktop.DBus.Error.NameHasNoOwner")) return error.ServiceUnavailable;
    if (eql(u8, name, "org.freedesktop.DBus.Error.AccessDenied") or eql(u8, name, "org.freedesktop.DBus.Error.AuthFailed")) return error.AccessDenied;
    if (eql(u8, name, "org.freedesktop.DBus.Error.InvalidArgs") or eql(u8, name, "org.freedesktop.DBus.Error.InvalidSignature")) return error.InvalidArgument;
    if (eql(u8, name, "org.freedesktop.DBus.Error.NoMemory")) return error.OutOfMemory;
    return error.RemoteError;
}

/// Monotonic clock in milliseconds.
fn monotonic_ms() i64 {
    var ts: linux.timespec = undefined;
    _ = linux.clock_gettime(linux.CLOCK.MONOTONIC, &ts);
    return @as(i64, @intCast(ts.sec)) * 1000 + @divTrunc(@as(i64, @intCast(ts.nsec)), 1_000_000);
}

pub const Connection = struct {
    lib: *const Library,
    raw: *binding.RawConnection,

    /// Connects to `bus` and completes the libdbus handshake (including Hello).
    pub fn open(lib: *const Library, bus: Bus) Error!Connection {
        var err: binding.ErrorStorage = undefined;
        lib.libdbus.fns.dbus_error_init(&err);
        defer lib.libdbus.fns.dbus_error_free(&err);
        const raw = lib.libdbus.fns.dbus_bus_get_private(bus.raw(), &err) orelse {
            if (binding.error_name(&err) != null) return map_error(&err);
            return error.ConnectFailed;
        };
        // A lost desktop bus is an observable error, never a process exit.
        lib.libdbus.fns.dbus_connection_set_exit_on_disconnect(raw, 0);
        return .{ .lib = lib, .raw = raw };
    }

    /// Closes the socket and releases the connection reference. Messages still
    /// held by the caller remain valid until their own `deinit`.
    pub fn close(self: *Connection) void {
        self.lib.libdbus.fns.dbus_connection_close(self.raw);
        self.lib.libdbus.fns.dbus_connection_unref(self.raw);
        self.* = undefined;
    }

    /// The bus-assigned unique name (e.g. ":1.42"), borrowed until `close`.
    pub fn unique_name(self: *const Connection) ?[]const u8 {
        return binding.span(self.lib.libdbus.fns.dbus_bus_get_unique_name(self.raw));
    }

    pub fn is_connected(self: *const Connection) bool {
        return self.lib.libdbus.fns.dbus_connection_get_is_connected(self.raw) != 0;
    }

    /// Claims a well-known name. Returns `error.NameNotAcquired` unless this
    /// connection becomes the primary owner (an existing owner is accepted).
    pub fn request_name(self: *Connection, name: [:0]const u8, replace_existing: bool) Error!void {
        var err: binding.ErrorStorage = undefined;
        self.lib.libdbus.fns.dbus_error_init(&err);
        defer self.lib.libdbus.fns.dbus_error_free(&err);
        const flags: u32 = if (replace_existing) binding.name_flag_replace_existing else 0;
        const reply = self.lib.libdbus.fns.dbus_bus_request_name(self.raw, name.ptr, flags, &err);
        if (self.lib.libdbus.fns.dbus_error_is_set(&err) != 0) return map_error(&err);
        if (reply != binding.request_name_primary_owner and reply != binding.request_name_already_owner) return error.NameNotAcquired;
    }

    /// Adds a match rule so the bus forwards matching signals to this connection.
    pub fn add_match(self: *Connection, rule: [:0]const u8) Error!void {
        var err: binding.ErrorStorage = undefined;
        self.lib.libdbus.fns.dbus_error_init(&err);
        defer self.lib.libdbus.fns.dbus_error_free(&err);
        self.lib.libdbus.fns.dbus_bus_add_match(self.raw, rule.ptr, &err);
        if (self.lib.libdbus.fns.dbus_error_is_set(&err) != 0) return map_error(&err);
    }

    pub fn remove_match(self: *Connection, rule: [:0]const u8) Error!void {
        var err: binding.ErrorStorage = undefined;
        self.lib.libdbus.fns.dbus_error_init(&err);
        defer self.lib.libdbus.fns.dbus_error_free(&err);
        self.lib.libdbus.fns.dbus_bus_remove_match(self.raw, rule.ptr, &err);
        if (self.lib.libdbus.fns.dbus_error_is_set(&err) != 0) return map_error(&err);
    }

    /// Queues `msg` for sending without waiting; returns its serial. The caller
    /// keeps ownership of `msg`.
    pub fn send(self: *Connection, msg: *const Message) Error!u32 {
        var serial: u32 = 0;
        if (self.lib.libdbus.fns.dbus_connection_send(self.raw, msg.raw, &serial) == 0) return error.OutOfMemory;
        self.lib.libdbus.fns.dbus_connection_flush(self.raw);
        return serial;
    }

    /// Sends a method call and blocks up to `timeout_ms` (negative for libdbus's
    /// default) for its method return. Error replies are returned as the mapped
    /// error. The caller owns the returned reply message.
    pub fn call(self: *Connection, msg: *const Message, timeout_ms: i32) Error!Message {
        var err: binding.ErrorStorage = undefined;
        self.lib.libdbus.fns.dbus_error_init(&err);
        defer self.lib.libdbus.fns.dbus_error_free(&err);
        const timeout: c_int = if (timeout_ms < 0) binding.timeout_default else timeout_ms;
        const reply = self.lib.libdbus.fns.dbus_connection_send_with_reply_and_block(self.raw, msg.raw, timeout, &err) orelse return map_error(&err);
        return .{ .lib = self.lib, .raw = reply };
    }

    /// Returns the next queued message, waiting up to `timeout_ms` for one to
    /// arrive (negative waits indefinitely). Returns `error.Timeout` when the
    /// deadline passes. The caller owns the returned message.
    pub fn receive(self: *Connection, timeout_ms: i32) Error!Message {
        const deadline: ?i64 = if (timeout_ms < 0) null else monotonic_ms() + timeout_ms;
        while (true) {
            if (self.lib.libdbus.fns.dbus_connection_pop_message(self.raw)) |raw| {
                return .{ .lib = self.lib, .raw = raw };
            }
            if (!self.is_connected()) return error.Disconnected;
            const wait: c_int = if (deadline) |d| blk: {
                const left = d - monotonic_ms();
                if (left <= 0) return error.Timeout;
                break :blk @intCast(@min(left, std.math.maxInt(c_int)));
            } else binding.timeout_infinite;
            _ = self.lib.libdbus.fns.dbus_connection_read_write(self.raw, wait);
        }
    }

    /// Reads whatever socket data is available, waiting at most `timeout_ms`
    /// (0 never blocks), and returns one queued message or null when none is
    /// queued. Unlike `receive`, a zero timeout still reads the socket. Callers
    /// drain the queue by repeating the call until it returns null. Returns
    /// `error.Disconnected` once the connection is gone.
    pub fn poll(self: *Connection, timeout_ms: i32) Error!?Message {
        if (self.lib.libdbus.fns.dbus_connection_pop_message(self.raw)) |raw| {
            return .{ .lib = self.lib, .raw = raw };
        }
        if (!self.is_connected()) return error.Disconnected;
        const wait: c_int = if (timeout_ms < 0) binding.timeout_infinite else timeout_ms;
        _ = self.lib.libdbus.fns.dbus_connection_read_write(self.raw, wait);
        if (self.lib.libdbus.fns.dbus_connection_pop_message(self.raw)) |raw| {
            return .{ .lib = self.lib, .raw = raw };
        }
        if (!self.is_connected()) return error.Disconnected;
        return null;
    }
};
