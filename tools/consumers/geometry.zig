//! A nonconstant geometry-only consumer for link/dependency regression checks.
const std = @import("std");
const geometry = @import("zdl").geometry;
pub fn main(init: std.process.Init) !void {
    std.debug.print("mode={s}\n", .{@tagName(@import("builtin").mode)});
    var args = std.process.Args.Iterator.init(init.minimal.args);
    defer args.deinit();
    _ = args.next();
    const width = if (args.next()) |value| try std.fmt.parseInt(i32, value, 10) else 640;
    if (width < 1 or width > 32768) return error.InvalidSize;
    const source: geometry.Rect(i32) = .{ .x = 0, .y = 0, .width = width, .height = 480 };
    const clipped = (try source.intersection(.{ .x = @divTrunc(width, 2), .y = 10, .width = width, .height = 50 })).?;
    std.debug.print("geometry width={d} clipped={d},{d},{d},{d}\n", .{ width, clipped.x, clipped.y, clipped.width, clipped.height });
}
