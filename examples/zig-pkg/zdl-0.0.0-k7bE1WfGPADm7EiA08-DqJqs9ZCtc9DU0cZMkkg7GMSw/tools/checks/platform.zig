//! Compile-only consumer for the Linux platform layer. Every call that would
//! open a display, a socket or a window sits behind a PID guard, so the binary
//! cannot act even if it is run.
const std = @import("std");
const zdl = @import("zdl");

pub fn check() !void {
    if (std.os.linux.getpid() != 0) return;
    const allocator = std.heap.page_allocator;
    var threaded: std.Io.Threaded = .init_single_threaded;
    const io = threaded.io();

    const platform = try zdl.linux.Platform.open(allocator, io, .{
        .driver = .auto,
        .environment = .{ .wayland_display = null, .session_type = null, .x11_display = null, .xcursor_theme = null },
    });
    defer platform.close();
    _ = platform.active_backend();
    _ = platform.now_ns();
    _ = platform.displays();
    _ = platform.primary();
    _ = platform.pending_events();

    var window = try platform.create_window(.{ .title = "compile consumer", .size = .{ .width = 640, .height = 480 } });
    defer window.deinit();
    try window.set_title("compile consumer");
    try window.show();
    try window.hide();
    try window.resize(.{ .width = 800, .height = 600 });
    try window.set_minimum_size(.{ .width = 64, .height = 64 });
    try window.set_maximum_size(null);
    try window.set_fullscreen(false);
    try window.maximize();
    try window.set_maximized(false);
    try window.minimize();
    try window.restore();
    try window.set_bordered(false);
    try window.set_resizable(true);
    try window.set_cursor(.pointer);
    try window.start_text_input();
    try window.stop_text_input();
    try window.set_clipboard_text("compile consumer text");
    const text = try window.clipboard_text(allocator);
    defer allocator.free(text);
    _ = try window.size();
    _ = try window.flags();

    var image = try zdl.surface.Surface.init(allocator, 640, 480, .rgba8, null);
    defer image.deinit();
    try window.present(image.view);

    _ = try platform.wait_event(0);
    while (platform.next_event()) |ev| {
        switch (ev) {
            .key => |key| {
                var buffer: [4]u8 = undefined;
                _ = key.keycode.name(.{}, &buffer);
            },
            else => {},
        }
    }
}
