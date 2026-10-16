//! Full Linux platform API consumer, exercised only with its offscreen driver.
//! Unlike the other foundation consumers, this one intentionally links libc.
const std = @import("std");
const zdl = @import("zdl");
pub fn main(init: std.process.Init) !void {
    std.debug.print("mode={s}\n", .{@tagName(@import("builtin").mode)});
    const platform = try zdl.linux.Platform.open(init.gpa, init.io, .{ .driver = .offscreen });
    defer platform.close();
    var window = try platform.create_window(.{ .size = .{ .width = 32, .height = 24 } });
    defer window.deinit();
    var source = try zdl.surface.Surface.init(init.gpa, 32, 24, .rgba8, null);
    defer source.deinit();
    try source.view.fill(.{ .r = 20, .g = 90, .b = 180, .a = 255 }, null);
    try window.present(source.view);
    const size = try window.size();
    if (size.width != 32 or size.height != 24) return error.SizeMismatch;
    std.debug.print("window driver=offscreen size={d}x{d}\n", .{ size.width, size.height });
}
