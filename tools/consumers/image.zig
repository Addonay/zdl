//! PNG roundtrip with runtime dimensions; no windowing or C-library provider.
const std = @import("std");
const zdl = @import("zdl");
pub fn main(init: std.process.Init) !void {
    std.debug.print("mode={s}\n", .{@tagName(@import("builtin").mode)});
    var args = std.process.Args.Iterator.init(init.minimal.args);
    defer args.deinit();
    _ = args.next();
    const width = if (args.next()) |value| try std.fmt.parseInt(u31, value, 10) else 17;
    if (width < 1 or width > 64) return error.InvalidSize;
    var source = try zdl.surface.Surface.init(init.gpa, width, 3, .rgba8, null);
    defer source.deinit();
    try source.view.fill(.{ .r = @intCast(width), .g = 90, .b = 180, .a = 255 }, null);
    const encoded = try zdl.image.encode_png(init.gpa, source.view, .{});
    defer init.gpa.free(encoded);
    var decoded = try zdl.image.load_png(init.gpa, encoded, .{ .output = .rgba8 });
    defer decoded.deinit();
    if (decoded.width() != width or decoded.height() != 3) return error.SizeMismatch;
    for (0..3) |y| if (!std.mem.eql(u8, try source.view.row(y), try decoded.surface.view.row(y))) return error.PixelMismatch;
    std.debug.print("image width={d} encoded={d} hash={x}\n", .{ width, encoded.len, std.hash.Wyhash.hash(0, decoded.surface.view.data) });
}
