//! Compile-only consumer for the X11 additions: streamed (INCR) drops, bounding
//! shapes, pen enumeration with tip/button/rotation/slider events, pinch gestures,
//! touch grabs and XKB key-type walking. Display calls sit behind a PID guard.
const std = @import("std");
const zdl = struct {
    const window = @import("zdl").x11.window;
    const dnd = @import("zdl").x11.dnd;
    const xinput = @import("zdl").x11.xinput;
    const keyboard = @import("zdl").x11.keyboard;
    const surface = @import("zdl").surface;
};

pub fn check() !void {
    // Pure helpers need no display.
    const masks: zdl.keyboard.ModifierMasks = .{ .alt = 8, .level3 = 128, .level5 = 32 };
    _ = zdl.keyboard.entry_modifiers(1 | 128, masks);
    _ = zdl.keyboard.effective_group(3, 0x40 | 2);

    if (std.os.linux.getpid() != 0) return;
    const allocator = std.heap.page_allocator;
    var library = try zdl.window.Library.open(allocator);
    defer library.deinit();
    var connection = try zdl.window.Connection.open(&library, null);
    defer connection.deinit();
    try connection.enable_xinput();

    var window = try zdl.window.Window.create(&connection, .{ .title = "x11e" });
    defer window.deinit();
    try window.select_xinput(.{ .motion = true, .touch = true, .pen = true, .gesture = true });

    // Pens: enumeration and per-device info.
    const pens = try connection.pens(allocator);
    defer allocator.free(pens);
    for (pens) |pen| {
        _ = pen.name;
        _ = pen.axes.rotation;
        _ = connection.pen_info(pen.device);
    }

    // Touch grabs while the pointer is grabbed.
    try zdl.xinput.grab_touch(&connection, 0);
    try zdl.xinput.ungrab_touch(&connection, 0);

    // Bounding shape from alpha, and restoring the full window.
    var storage: [4 * 4 * 4]u8 = @splat(0);
    const view = try zdl.surface.View.init(&storage, 4, 4, 16, .argb8, null);
    try window.set_bounding_shape(allocator, view);
    try window.set_bounding_shape(allocator, null);

    while (try connection.poll()) |ev| switch (ev.payload) {
        .pen_button => |button| _ = button.button,
        .pen_added, .pen_removed => {},
        .pinch => |pinch| _ = pinch.scale,
        .pen_motion => |motion| {
            _ = motion.rotation;
            _ = motion.slider;
            _ = motion.distance;
        },
        else => {},
    };
}
