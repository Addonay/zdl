//! Compile-only consumer for the Wayland backend. Instantiates every public entry
//! point but returns before loading libwayland or opening any socket.
const std = @import("std");
const zdl = @import("zdl").wayland;
const wl = zdl.window;

pub fn check() !void {
    if (std.os.linux.getpid() != 0) return;
    const allocator = std.heap.page_allocator;

    var win = try wl.Window.open(allocator, .{ .title = "zdl", .app_id = "zdl.check" });
    defer win.deinit();
    try win.dispatch(true);
    try win.roundtrip();
    while (win.poll_event()) |event| switch (event) {
        .keyboard_keymap => |bytes| _ = bytes.len,
        .key => |key| _ = key.scancode,
        else => {},
    };
    _ = win.buffer_size();
    _ = win.logical_size();
    _ = win.window_state();
    try win.set_maximized(true);
    try win.set_fullscreen(false, null);
    try win.set_title("t");
}
