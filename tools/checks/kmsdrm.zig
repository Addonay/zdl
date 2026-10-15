//! Compile-only instantiation for dynamically loaded DRM/GBM APIs.
const std = @import("std");
const zdl = @import("zdl");

pub fn check() !void {
    if (std.os.linux.getpid() != 0) return;
    const allocator = std.heap.page_allocator;
    var device = try zdl.kmsdrm.Device.open(allocator, .{});
    defer device.deinit();
    _ = device.selected_mode();
    _ = device.size();
    _ = device.egl_native_display();
    _ = device.egl_platform();

    const size = device.size();
    var image = try zdl.surface.Surface.init(allocator, @intCast(size.width), @intCast(size.height), .rgba8, null);
    defer image.deinit();
    try device.present(image.view);
    var cursor = try zdl.surface.Surface.init(allocator, 64, 64, .rgba8, null);
    defer cursor.deinit();
    try device.set_cursor(cursor.view, 0, 0);
    try device.move_cursor(10, 10);
    device.hide_cursor();

    var gbm_window = try zdl.kmsdrm.GbmWindow.create(&device, size.width, size.height);
    defer gbm_window.deinit();
    var display = try zdl.egl.display.Display.open(device.egl_platform(), zdl.egl.display.default_library);
    defer display.deinit();
    const config = try display.choose_config(.{}, null);
    var egl_surface = try zdl.egl.surface.WindowSurface.create(&display, config, .{ .gbm = gbm_window.egl_native_window() }, .{ .width = size.width, .height = size.height }, .{});
    defer egl_surface.deinit();
    var context = try zdl.egl.context.Context.create(&display, config, &egl_surface, .{}, .none);
    defer context.deinit();
    try gbm_window.present();
}
