//! Proves the package wiring: both dependencies resolve and compile.
const std = @import("std");
const zdl = @import("zdl");
const zlay = @import("zlay");

pub fn main() void {
    _ = zdl.geometry;
    _ = zlay.Context;
    std.debug.print("ok\n", .{});
}
