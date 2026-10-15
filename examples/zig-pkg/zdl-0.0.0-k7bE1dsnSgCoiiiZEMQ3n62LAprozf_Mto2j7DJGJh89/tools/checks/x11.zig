//! Compile-only consumer for the X11 backend. Every display-touching call is
//! behind a PID guard, so the binary cannot open a display even if executed.
const std = @import("std");
const zdl = struct {
    const window = @import("zdl").x11.window;
    const clipboard = @import("zdl").x11.clipboard;
    const keyboard = @import("zdl").x11.keyboard;
    const surface = @import("zdl").surface;
};

pub fn check() !void {
    if (std.os.linux.getpid() != 0) return;
    const allocator = std.heap.page_allocator;

    var library = try zdl.window.Library.open(allocator);
    defer library.deinit();
    var connection = try zdl.window.Connection.open(&library, null);
    defer connection.deinit();
    _ = try connection.file_descriptor();
    try connection.flush();

    var window = try zdl.window.Window.create(&connection, .{ .title = "compile consumer" });
    defer window.deinit();
    try window.set_title("compile consumer");
    try window.set_minimum_size(.{ .width = 64, .height = 64 });
    try window.set_maximum_size(null);
    try window.set_fullscreen(false);
    try window.set_maximized(true);
    try window.set_bordered(false);
    try window.focus();
    try window.show();
    try window.hide();
    try window.minimize();
    try window.restore();
    try window.move(.{ .x = 10, .y = 10 });
    try window.resize(.{ .width = 640, .height = 480 });

    var standard = try zdl.window.Cursor.standard(&connection, .hand);
    defer standard.deinit();
    var hidden = try zdl.window.Cursor.hidden(&connection);
    defer hidden.deinit();
    try window.set_cursor(&standard);
    try window.set_cursor(null);

    var clipboard = zdl.clipboard.Clipboard.init(allocator);
    defer clipboard.deinit();
    try clipboard.set_text(&connection, &window, .clipboard, "compile consumer text");
    try zdl.clipboard.Clipboard.request_text(&connection, &window, .primary);

    if (try connection.poll()) |event| {
        window.apply(event);
        _ = try clipboard.handle_event(&connection, event);
        switch (event.payload) {
            .key => |key| {
                var buffer: [4]u8 = undefined;
                _ = key.keycode.name(.{}, &buffer);
            },
            .selection_notified => |notified| {
                if (try clipboard.receive(&connection, &window, notified)) |text| allocator.free(text);
            },
            else => {},
        }
    }

    var image = try zdl.surface.Surface.init(allocator, 640, 480, .rgba8, null);
    defer image.deinit();
    try window.present(allocator, image.view);
}
