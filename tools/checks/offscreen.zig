//! Compile-only API instantiation for software framebuffers.
const std = @import("std");
const zdl = @import("zdl");

pub fn check() !void {
    const allocator = std.heap.page_allocator;
    var framebuffer = try zdl.offscreen.Framebuffer.init(allocator, 2, 2);
    defer framebuffer.deinit();
    var input = try zdl.surface.Surface.init(allocator, 2, 2, .rgba8, null);
    defer input.deinit();
    try input.view.fill(.{ .r = 1, .g = 2, .b = 3, .a = 255 }, null);
    try framebuffer.present(input.view);
    try framebuffer.resize(4, 3);
    _ = framebuffer.view().read(0, 0) catch unreachable;

    var threaded: std.Io.Threaded = .init_single_threaded;
    const platform = try zdl.linux.Platform.open(allocator, threaded.io(), .{ .driver = .offscreen });
    defer platform.close();
    var window = try platform.create_window(.{ .size = .{ .width = 2, .height = 2 } });
    defer window.deinit();
    try window.present(input.view);
    _ = try window.offscreen_framebuffer();

    if (std.os.linux.getpid() == 0) {
        var target = try zdl.offscreen.EglTarget.open(allocator, .{ .size = .{ .width = 8, .height = 8 } });
        defer target.deinit();
        try target.make_current();
        _ = target.proc_address(*const fn () callconv(.c) void, "glFlush");
    }
}
