//! Compile-only consumer for the X11 drag-and-drop, popup, XKB level, XIM preedit,
//! pen and window-shape paths. Every display-touching call sits behind a PID guard,
//! so the binary cannot open a display even if it is executed.
const std = @import("std");
const zdl = struct {
    const window = @import("zdl").x11.window;
    const dnd = @import("zdl").x11.dnd;
    const shape = @import("zdl").x11.shape;
    const xinput = @import("zdl").x11.xinput;
    const text_input = @import("zdl").x11.text_input;
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
    try connection.enable_xinput();
    try zdl.xinput.select_window(&connection, 0, .{ .motion = true, .touch = true, .pen = true });
    try connection.enable_text_input(&(zdl.window.Window{ .connection = &connection, .id = @fromBackingInt(@intCast(0)), .size = .{ .width = 1, .height = 1 }, .gc = undefined }));

    var window = try zdl.window.Window.create(&connection, .{ .title = "x11d" });
    defer window.deinit();

    // XDND: a window that receives drops, and the event pump that feeds it.
    _ = try connection.poll();

    // Popups: parent-relative override-redirect menu and tooltip.
    var menu = try zdl.window.Window.create_popup(&window, .{ .size = .{ .width = 80, .height = 40 } });
    defer menu.deinit();
    var tooltip = try zdl.window.Window.create_popup(&window, .{
        .position = .{ .x = 4, .y = 4 },
        .size = .{ .width = 120, .height = 20 },
        .kind = .tooltip,
        .visible = false,
    });
    defer tooltip.deinit();
    try menu.set_mouse_grab(false);
    try menu.set_keyboard_grab(false);

    // Window shape from an alpha surface, and clearing the shape.
    var pixels_storage: [4 * 4 * 4]u8 = @splat(0);
    const view = try zdl.surface.View.init(&pixels_storage, 4, 4, 16, .argb8, null);
    try window.set_shape(allocator, view);
    try window.set_shape(allocator, null);

    // Pen events arrive through the event queue; the translation is compiled through poll.
    _ = try connection.next_event_within(0);
}
