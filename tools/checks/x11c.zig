//! Compile-only consumer for the X11 window-state, grab, XInput2 and cursor additions.
//! Every display-touching call is behind a PID guard, so the binary cannot open a display
//! even if executed.
const std = @import("std");
const zdl = struct {
    const window = @import("zdl").x11.window;
    const ewmh = @import("zdl").x11.ewmh;
    const xinput = @import("zdl").x11.xinput;
    const surface = @import("zdl").surface;
    const message_box = @import("zdl").x11.message_box;
    const messagebox = @import("zdl").messagebox.message_box;
};

pub fn check() !void {
    if (std.os.linux.getpid() != 0) return;
    const allocator = std.heap.page_allocator;

    var library = try zdl.window.Library.open(allocator);
    defer library.deinit();
    var connection = try zdl.window.Connection.open(&library, null);
    defer connection.deinit();
    try connection.enable_xinput();
    try connection.set_raw_motion(true);
    try connection.set_raw_motion(false);
    _ = connection.default_visual_id();
    _ = connection.has_themed_cursors();
    try connection.warp_mouse_global(.{ .x = 1, .y = 1 });

    var window = try zdl.window.Window.create(&connection, .{ .title = "x11c" });
    defer window.deinit();
    const state = try connection.window_state(&window);
    _ = state.maximized;
    _ = state.fullscreen;
    _ = state.minimized;
    _ = state.always_on_top;
    _ = state.demands_attention;
    _ = try window.query_position();
    _ = window.visual_id();
    try window.warp_mouse(.{ .x = 4, .y = 4 });
    var parent = try zdl.window.Window.create(&connection, .{ .title = "x11c parent", .visible = false });
    defer parent.deinit();
    try window.set_transient_for(&parent);
    try window.set_always_on_top(true);
    try window.set_opacity(0.5);
    try window.set_opacity(1);
    var icon = try zdl.surface.Surface.init(allocator, 16, 16, .rgba8, null);
    defer icon.deinit();
    try window.set_icon(allocator, icon.view);
    try window.flash(.briefly);
    try window.flash(.cancel);
    try window.set_mouse_grab(true);
    try window.set_mouse_grab(false);
    try window.set_keyboard_grab(true);
    try window.set_keyboard_grab(false);
    try window.select_xinput(.{ .motion = true, .touch = true });
    try window.select_xinput(.{});

    var standard = try zdl.window.Cursor.standard(&connection, .progress);
    defer standard.deinit();
    var themed = zdl.window.Cursor.themed(&connection, "left_ptr") catch null;
    if (themed) |*cursor| cursor.deinit();
    var system = try zdl.window.Cursor.system(&connection, .nwse_resize);
    defer system.deinit();
    _ = zdl.window.Cursor.css_name(.not_allowed);

    const buttons = [_]zdl.messagebox.Button{
        .{ .flags = .{ .return_key_default = true }, .id = 1, .text = "OK" },
        .{ .flags = .{ .escape_key_default = true }, .id = 2, .text = "Cancel" },
    };
    if (try zdl.message_box.show(allocator, &connection, &window, .{
        .flags = .{ .warning_dialog = true },
        .title = "x11c",
        .message = "Message line one\nline two",
        .buttons = &buttons,
    })) |button_id| _ = button_id;

    if (try connection.poll()) |event| {
        switch (event.payload) {
            .window_state_changed => {},
            .raw_motion => |motion| _ = motion.dx,
            .touch => |touch| _ = touch.position.x,
            .smooth_scroll => |scroll| _ = scroll.y,
            else => {},
        }
    }
}
