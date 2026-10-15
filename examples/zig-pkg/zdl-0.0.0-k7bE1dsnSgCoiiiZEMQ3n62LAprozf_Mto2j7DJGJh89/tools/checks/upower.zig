const std = @import("std");
const zdl = @import("zdl").system;
const upower = zdl.upower;

// Compile-only consumer. Nothing here runs: the guard below returns
// before any call that would touch the bus.
pub fn check() !void {
    if (std.os.linux.getpid() != 0) return;
    var lib = try upower.Library.open();
    defer lib.close();
    var conn = try upower.Connection.open(&lib, .system);
    defer conn.close();
    _ = try upower.query(&conn);
}
