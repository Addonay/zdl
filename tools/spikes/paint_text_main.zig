//! Finite provider-consistent paragraph-to-paint integration; no native window.
const std = @import("std");
const zdl = @import("zdl");
const paragraph = @import("paragraph/paragraph.zig");
const text = @import("paint/text.zig");
const replay = @import("paint/replay.zig");
pub fn main(init: std.process.Init) !void {
    var args = std.process.Args.Iterator.init(init.minimal.args);
    defer args.deinit();
    _ = args.next();
    const destination = args.next() orelse return error.MissingOutput;
    var provider = try paragraph.Library.open_resident(.{});
    var provider_alive = true;
    defer if (provider_alive) provider.deinit();
    const pango_version = try init.gpa.dupe(u8, std.mem.span(provider.pango.pango_version_string()));
    defer init.gpa.free(pango_version);
    var layout = try paragraph.Snapshot.init(init.gpa, &provider, "ZDL · café · עברית · العربية\nOwned paragraph pixels", .{ .width_px = 430, .font = "Sans 22" });
    var layout_alive = true;
    defer if (layout_alive) layout.deinit();
    if (layout.missing_glyphs() != 0) return error.MissingGlyphs;
    var native = try layout.rasterize_styled(.{ .selection = .{ .start = 0, .end = 3 }, .cursor = .{ .index = 3 } }, .{
        .background = null,
        .foreground = .{ .r = 0.9, .g = 0.94, .b = 1 },
        .cursor_color = .{ .r = 0.2, .g = 1, .b = 0.9 },
    });
    var native_alive = true;
    defer if (native_alive) native.deinit();
    var raster = try text.capture_argb32(init.gpa, &native, .{});
    var raster_alive = true;
    defer if (raster_alive) raster.deinit();
    native.deinit();
    native_alive = false;
    layout.deinit();
    layout_alive = false;
    provider.deinit();
    provider_alive = false;
    var recorder = try zdl.paint.Recorder.init(init.gpa, .{});
    defer recorder.deinit();
    try recorder.fill_rect(.{ .x = 0, .y = 0, .width = 480, .height = 220 }, .{ .r = 0.03, .g = 0.04, .b = 0.07 });
    try recorder.save();
    try recorder.clip_rounded_rect(.{ .rect = .{ .x = 16, .y = 16, .width = 448, .height = 188 }, .radius = 12 });
    try recorder.fill_rect(.{ .x = 16, .y = 16, .width = 448, .height = 188 }, .{ .r = 0.08, .g = 0.12, .b = 0.19 });
    try raster.draw(&recorder, .{ .x = 24, .y = 30 }, .nearest);
    try recorder.restore();
    var packet = try recorder.finish();
    defer packet.deinit();
    raster.deinit();
    raster_alive = false;
    var library = try replay.Library.open("libcairo.so.2");
    defer library.deinit();
    var output = try replay.render(&library, init.gpa, &packet, 480, 220, .{});
    defer output.deinit();
    try output.write_png(destination);
    std.debug.print("{{\"mode\":\"{s}\",\"cairo\":\"{s}\",\"pango\":\"{s}\",\"width\":480,\"height\":220,\"source_owners_released\":true,\"missing_glyphs\":0}}\n", .{ @tagName(@import("builtin").mode), std.mem.span(library.f.cairo_version_string()), pango_version });
}
