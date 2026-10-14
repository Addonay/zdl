//! Compile-only consumer for the Linux platform layer (platform3 area). Every call
//! that would open a display, a socket, a signal mask or a window sits behind a PID
//! guard, so the binary cannot act even if it is run.
const std = @import("std");
const zdl = struct {
    const linux = @import("zdl").linux;
    const quit = @import("zdl").events.quit;
    const surface = @import("zdl").surface;
};

pub fn check() !void {
    if (std.os.linux.getpid() != 0) return;
    const allocator = std.heap.page_allocator;
    var threaded: std.Io.Threaded = .init_single_threaded;
    const io = threaded.io();

    const signals = try zdl.quit.Signals.install();
    const platform = try zdl.linux.Platform.open(allocator, io, .{
        .driver = .auto,
        .environment = .{ .wayland_display = null, .session_type = null, .x11_display = null, .xcursor_theme = null },
        .signals = signals,
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
    try window.set_fullscreen_mode(null);
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
    _ = try window.position();
    try window.set_position(10, 20);
    try window.set_always_on_top(true);
    try window.set_opacity(0.5);
    try window.set_icon(undefined);
    try window.flash(.briefly);
    try window.set_mouse_grab(false);
    try window.set_keyboard_grab(false);
    try window.warp_mouse(1, 2);
    try window.set_relative_mouse_mode(false);
    try window.set_text_input_area(.{ .x = 1, .y = 2, .width = 3, .height = 4 });
    try window.set_shape(null);
    _ = try window.show_message_box(.{ .title = "t", .message = "m" });

    const drag_entries = [_]zdl.linux.DragEntry{.{ .mime = "text/plain;charset=utf-8", .data = "drag" }};
    try window.start_drag(&drag_entries);
    _ = try window.take_drag_result();

    const parent = try platform.create_window(.{ .title = "popup parent" });
    var popup_window = try parent.open_popup(.{ .size = .{ .width = 10, .height = 10 } });
    defer popup_window.deinit();
    try popup_window.set_shape(null);

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
