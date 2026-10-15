const std = @import("std");
const dbus = @import("zdl").dbus;

// Compile-only consumer. Nothing here runs: the guard below returns
// before any call that would touch the bus.
pub fn check() !void {
    if (std.os.linux.getpid() != 0) return;
    var lib = try dbus.connection.Library.open();
    defer lib.close();
    var conn = try dbus.connection.Connection.open(&lib, .session);
    defer conn.close();
    _ = conn.unique_name();
    var msg = try dbus.message.Message.method_call(&lib, "org.freedesktop.DBus", "/org/freedesktop/DBus", "org.freedesktop.DBus", "ListNames");
    defer msg.deinit();
    var reply = try conn.call(&msg, 1000);
    defer reply.deinit();
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    _ = try reply.body(arena.allocator());
}
