//! Desktop notifications through `org.freedesktop.Notifications` (Desktop
//! Notifications Specification): `Notify` and `CloseNotification`.
//!
//! `show` returns the notification id the server assigned. Pass it as
//! `replaces_id` to update the same notification, or to `close` to dismiss it.
//! The server may ignore the expiry timeout; `-1` means "server default".

const std = @import("std");
const Allocator = std.mem.Allocator;
const connection = @import("../linux/dbus/connection.zig");
const message = @import("../linux/dbus/message.zig");
const value = @import("../linux/dbus/value.zig");
const Connection = connection.Connection;
const Message = message.Message;
const Value = value.Value;

pub const Error = connection.Error || error{
    /// The server answered with a body that does not match the Notify reply.
    UnexpectedReply,
};

const service: [:0]const u8 = "org.freedesktop.Notifications";
const object_path: [:0]const u8 = "/org/freedesktop/Notifications";
const interface: [:0]const u8 = "org.freedesktop.Notifications";
/// Reply timeout for Notify and CloseNotification.
const call_timeout_ms: i32 = 5_000;

/// Notification urgency hint (`urgency` byte: 0 low, 1 normal, 2 critical).
pub const Urgency = enum(u8) {
    low = 0,
    normal = 1,
    critical = 2,
};

/// A notification to show. Strings are borrowed for the duration of `show`.
pub const Notification = struct {
    app_name: []const u8,
    summary: []const u8,
    body: []const u8 = "",
    /// Icon name or file path; empty for none.
    icon: []const u8 = "",
    /// Replace an existing notification with this id (0 creates a new one).
    replaces_id: u32 = 0,
    /// Pairs of key and label: `{ "default", "Open" }` and so on.
    actions: []const []const u8 = &.{},
    /// Expiry in milliseconds, or -1 for the server default.
    expire_ms: i32 = -1,
    urgency: ?Urgency = null,
};

/// Shows `notification` and returns the id the server assigned.
pub fn show(conn: *Connection, gpa: Allocator, notification: Notification) Error!u32 {
    var hints = value.VariantDict.init(gpa);
    defer hints.deinit();
    if (notification.urgency) |u| try hints.put("urgency", "y", .{ .byte = @backingInt(u) });

    var arena_state = std.heap.ArenaAllocator.init(gpa);
    defer arena_state.deinit();
    const arena = arena_state.allocator();

    const action_items = try arena.alloc(Value, notification.actions.len);
    for (notification.actions, 0..) |a, i| action_items[i] = .{ .string = a };

    const args = [_]Value{
        .{ .string = notification.app_name },
        .{ .uint32 = notification.replaces_id },
        .{ .string = notification.icon },
        .{ .string = notification.summary },
        .{ .string = notification.body },
        .{ .array = .{ .element = "s", .items = action_items } },
        hints.value_of(),
        .{ .int32 = notification.expire_ms },
    };
    var msg = try Message.method_call(conn.lib, service, object_path, interface, "Notify");
    defer msg.deinit();
    try msg.append(gpa, &args);
    var reply = try conn.call(&msg, call_timeout_ms);
    defer reply.deinit();
    const values = try reply.body(arena);
    if (values.len != 1 or values[0] != .uint32) return error.UnexpectedReply;
    return values[0].uint32;
}

/// Closes the notification `id`. Unknown ids are ignored by the server.
pub fn close(conn: *Connection, gpa: Allocator, id: u32) Error!void {
    const args = [_]Value{.{ .uint32 = id }};
    var msg = try Message.method_call(conn.lib, service, object_path, interface, "CloseNotification");
    defer msg.deinit();
    try msg.append(gpa, &args);
    var reply = try conn.call(&msg, call_timeout_ms);
    defer reply.deinit();
}
