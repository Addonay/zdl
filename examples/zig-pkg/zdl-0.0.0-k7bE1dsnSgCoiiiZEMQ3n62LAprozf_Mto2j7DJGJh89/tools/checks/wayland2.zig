//! Compile-only consumer for the Wayland backend (wayland2 area). Instantiates the
//! public entry points, including cursor, clipboard, text-input, touch, relative
//! pointer and activation methods, and returns before any socket, device or
//! library call can act.
const std = @import("std");
const zdl = struct {
    const window = @import("zdl").wayland.window;
    const cursor = @import("zdl").wayland.cursor;
    const clipboard = @import("zdl").wayland.clipboard;
    const text_input = @import("zdl").wayland.text_input;
    const shm = @import("zdl").wayland.shm;
    const surface = @import("zdl").surface;
    const wayland = @import("zdl").wayland;
};
const wl = zdl.window;

/// References every declaration (recursively through structs) so that all function
/// bodies are semantically analyzed, including generated wrappers no entry point calls.
fn ref_all(comptime T: type) void {
    inline for (comptime std.meta.declarations(T)) |decl_name| {
        const value = @field(T, decl_name);
        if (@TypeOf(value) == type) {
            if (@typeInfo(value) == .@"struct") ref_all(value);
        } else {
            _ = &@field(T, decl_name);
        }
    }
}

comptime {
    ref_all(zdl.shm);
    ref_all(zdl.cursor);
    ref_all(zdl.clipboard);
    ref_all(zdl.text_input);
    ref_all(zdl.window);
}

pub fn check() !void {
    if (std.os.linux.getpid() != 0) return;
    const allocator = std.heap.page_allocator;

    var win = try wl.Window.open(allocator, .{
        .title = "zdl",
        .app_id = "zdl.check",
        .cursor_theme = null,
        .cursor_size = 24,
    });
    defer win.deinit();
    try win.dispatch(true);
    try win.roundtrip();
    while (win.poll_event()) |event| switch (event) {
        .keyboard_keymap => |bytes| _ = bytes.len,
        .key => |key| _ = key.scancode,
        .pointer_relative_motion => |motion| _ = motion.dx,
        .pointer_lock => |locked| _ = locked,
        .touch_down, .touch_up, .touch_motion => |touch| _ = touch.id,
        .touch_frame, .touch_cancel => {},
        .selection_changed => |which| _ = which,
        .text_preedit => |preedit| _ = preedit.cursor_begin,
        .text_commit => |text| _ = text.len,
        .text_delete_surrounding => |delete| _ = delete.before,
        else => {},
    };
    _ = win.buffer_size();
    _ = win.logical_size();
    _ = win.window_state();
    try win.set_maximized(true);
    try win.set_fullscreen(false, null);
    try win.set_title("t");

    try win.set_cursor(.{ .system = .pointer });
    try win.set_cursor(.hidden);
    _ = try win.update_cursor_animation(0);
    var pixels: [4 * 4 * 4]u8 = @splat(0);
    const raster = try zdl.surface.View.init(&pixels, 4, 4, 16, .bgra8, null);
    var custom = try win.create_custom_cursor(raster, 0, 0, 1);
    try win.set_cursor(.{ .custom = &custom });
    try win.release_custom_cursor(&custom);

    try win.set_relative_mouse_mode(true);
    try win.set_relative_mouse_mode(false);

    const entries = [_]wl.SelectionEntry{.{ .mime = "text/plain;charset=utf-8", .data = "hello" }};
    try win.set_selection(.clipboard, &entries);
    try win.clear_selection(.primary);
    for (win.selection_mime_types(.clipboard)) |mime| _ = mime.len;
    var pipe = try win.receive_selection(.clipboard, "text/plain;charset=utf-8");
    var buffer: [64]u8 = undefined;
    _ = try pipe.read(&buffer);
    pipe.close();

    try win.start_text_input();
    try win.set_text_input_area(.{ .x = 0, .y = 0, .width = 1, .height = 1 });
    try win.stop_text_input();
    try win.request_focus();
}
