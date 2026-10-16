//! Finite headless WP-02 demo. Saves the same layout used by cursor queries.
const std = @import("std");
const paragraph = @import("paragraph.zig");
pub fn main(init: std.process.Init) !void {
    var args = std.process.Args.Iterator.init(init.minimal.args);
    defer args.deinit();
    _ = args.next();
    const path = args.next() orelse return error.OutputPathRequired;
    const width = if (args.next()) |value| try std.fmt.parseInt(u16, value, 10) else 540;
    var library = try paragraph.Library.open_resident(.{});
    defer library.deinit();
    const text = "ZDL paragraph experiment\n\n" ++
        "One layout for painting and cursor geometry.\n" ++
        "English · עברית · العربية · cafe\u{301}\n\n" ++
        "This paragraph wraps while preserving the provider's visual cursor positions. " ++
        "The bitmap owns its pixels independently of the text layout.";
    var snapshot = try paragraph.Snapshot.init(init.gpa, &library, text, .{ .width_px = width, .font = "Liberation Sans 20" });
    var alive = true;
    defer if (alive) snapshot.deinit();
    const lines = snapshot.line_count();
    const missing = snapshot.missing_glyphs();
    var image = try snapshot.rasterize();
    defer image.deinit();
    const output = try init.gpa.dupeSentinel(u8, path, 0);
    defer init.gpa.free(output);
    // Exercise the bitmap lease: no layout/font/context object survives this call.
    snapshot.deinit();
    alive = false;
    try image.write_png(output);
    const versions = library.versions();
    std.debug.print("{{\"pango\":\"{s}\",\"cairo\":\"{s}\",\"mode\":\"{s}\",\"width\":{d},\"height\":{d},\"stride\":{d},\"lines\":{d},\"missing_glyphs\":{d},\"pixel_hash\":\"{x}\",\"resident_provider\":true}}\n", .{ versions.pango, versions.cairo, @tagName(@import("builtin").mode), image.width, image.height, image.stride, lines, missing, std.hash.Wyhash.hash(0, image.pixels) });
}
