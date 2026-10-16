const std = @import("std");
const zdl = @import("zdl");
const paragraph = @import("paragraph/paragraph.zig");
const text = @import("paint/text.zig");
const replay = @import("paint/replay.zig");
const t = std.testing;
const Fixture = struct {
    raster: text.Raster,
    expected: []u8,
    width: u31,
    height: u31,
    stride: usize,
};
fn fixture() !Fixture {
    var library = try paragraph.Library.open_resident(.{});
    defer library.deinit();
    var layout = try paragraph.Snapshot.init(t.allocator, &library, "cafe\u{301} · עברית · العربية", .{ .width_px = 250, .font = "Sans 20" });
    defer layout.deinit();
    try t.expectEqual(@as(usize, 0), layout.missing_glyphs());
    var native = try layout.rasterize_styled(.{}, .{ .background = null, .foreground = .{ .r = 0.2, .g = 0.6, .b = 0.9, .a = 0.8 } });
    defer native.deinit();
    const expected = try t.allocator.dupe(u8, native.pixels);
    errdefer t.allocator.free(expected);
    return .{ .raster = try text.capture_argb32(t.allocator, &native, .{ .pixels_per_unit = 2 }), .expected = expected, .width = @intCast(native.width), .height = @intCast(native.height), .stride = native.stride };
}
test "paint text provider pixels survive all paragraph owners and scale origin mapping" {
    var source = try fixture();
    defer t.allocator.free(source.expected);
    var raster_alive = true;
    defer if (raster_alive) source.raster.deinit();
    var recorder = try zdl.paint.Recorder.init(t.allocator, .{ .device_transform = .{ .xx = 2, .yy = 2 } });
    defer recorder.deinit();
    try source.raster.draw(&recorder, .{ .x = source.raster.origin_px.x / 2, .y = source.raster.origin_px.y / 2 }, .nearest);
    var packet = try recorder.finish();
    defer packet.deinit();
    source.raster.deinit(); // packet retained its own image; native owners already ended
    raster_alive = false;
    var library = try replay.Library.open("libcairo.so.2");
    defer library.deinit();
    var output = try replay.render(&library, t.allocator, &packet, source.width, source.height, .{});
    defer output.deinit();
    var transparent: usize = 0;
    var fractional: usize = 0;
    for (0..source.height) |y| for (0..source.width) |x| {
        const expected = std.mem.readInt(u32, source.expected[y * source.stride + x * 4 ..][0..4], @import("builtin").target.cpu.arch.endian());
        const actual = try output.premultiplied_pixel(x, y);
        try t.expectEqual(expected, (@as(u32, actual.a) << 24) | (@as(u32, actual.r) << 16) | (@as(u32, actual.g) << 8) | actual.b);
        if (actual.a == 0) transparent += 1;
        if (actual.a > 0 and actual.a < 255) fractional += 1;
    };
    try t.expect(transparent > 0 and fractional > 0);
}

const Native = struct { width: usize, height: usize, stride: usize, pixels: []const u8, origin_x: usize = 0, origin_y: usize = 0 };
test "paint text ARGB capture roundtrips every valid eight bit channel alpha pair" {
    const bytes = try t.allocator.alloc(u8, 256 * 256 * 4);
    defer t.allocator.free(bytes);
    for (0..256) |a| for (0..256) |channel| {
        const value: u32 = @intCast(@min(a, channel));
        std.mem.writeInt(u32, bytes[(a * 256 + channel) * 4 ..][0..4], (@as(u32, @intCast(a)) << 24) | (value << 16) | (value << 8) | value, @import("builtin").target.cpu.arch.endian());
    };
    const native: Native = .{ .width = 256, .height = 256, .stride = 1024, .pixels = bytes };
    var raster = try text.capture_argb32(t.allocator, native, .{});
    defer raster.deinit();
    var recorder = try zdl.paint.Recorder.init(t.allocator, .{});
    defer recorder.deinit();
    try raster.draw(&recorder, .{ .x = 0, .y = 0 }, .nearest);
    var packet = try recorder.finish();
    defer packet.deinit();
    var library = try replay.Library.open("libcairo.so.2");
    defer library.deinit();
    var output = try replay.render(&library, t.allocator, &packet, 256, 256, .{});
    defer output.deinit();
    for (0..256) |a| for (0..256) |channel| {
        const actual = try output.premultiplied_pixel(channel, a);
        try t.expectEqual(@as(u8, @intCast(a)), actual.a);
        try t.expectEqual(@as(u8, @intCast(@min(a, channel))), actual.r);
        try t.expectEqual(actual.r, actual.g);
        try t.expectEqual(actual.r, actual.b);
    };
}
fn allocation_scenario(allocator: std.mem.Allocator, native: Native) !void {
    var raster = try text.capture_argb32(allocator, native, .{});
    defer raster.deinit();
    var retained = try raster.clone();
    defer retained.deinit();
    var recorder = try zdl.paint.Recorder.init(allocator, .{});
    defer recorder.deinit();
    try raster.draw(&recorder, .{ .x = 0, .y = 0 }, .nearest);
    var packet = try recorder.finish();
    defer packet.deinit();
}
test "paint text capture validates alpha stride limits options and allocation failures" {
    var bytes: [4]u8 = undefined;
    std.mem.writeInt(u32, &bytes, 0x80604020, @import("builtin").target.cpu.arch.endian());
    const native: Native = .{ .width = 1, .height = 1, .stride = 4, .pixels = &bytes };
    try t.checkAllAllocationFailures(t.allocator, allocation_scenario, .{native});
    try t.expectError(error.ImageLimit, text.capture_argb32(t.allocator, native, .{ .max_bytes = 3 }));
    try t.expectError(error.InvalidScale, text.capture_argb32(t.allocator, native, .{ .pixels_per_unit = 0 }));
    var bad = native;
    bad.stride = 3;
    try t.expectError(error.InvalidBuffer, text.capture_argb32(t.allocator, bad, .{}));
    std.mem.writeInt(u32, &bytes, 0x007f0000, @import("builtin").target.cpu.arch.endian());
    try t.expectError(error.InvalidPremultiplication, text.capture_argb32(t.allocator, native, .{}));
}
test "paint text styled raster keeps legacy white output and validates colors" {
    var library = try paragraph.Library.open_resident(.{});
    defer library.deinit();
    var layout = try paragraph.Snapshot.init(t.allocator, &library, "Defaults", .{});
    defer layout.deinit();
    var legacy = try layout.rasterize();
    defer legacy.deinit();
    var styled = try layout.rasterize_styled(.{}, .{});
    defer styled.deinit();
    try t.expectEqualSlices(u8, legacy.pixels, styled.pixels);
    try t.expectError(error.InvalidOptions, layout.rasterize_styled(.{}, .{ .foreground = .{ .r = 2, .g = 0, .b = 0 } }));
}

test "paint text zero area capture does not traverse declared empty rows" {
    const native: Native = .{ .width = 0, .height = std.math.maxInt(u31), .stride = 0, .pixels = &.{} };
    var raster = try text.capture_argb32(t.allocator, native, .{ .max_bytes = 0 });
    defer raster.deinit();
    try t.expectEqual(@as(usize, 0), (try raster.image.view()).rgba.len);
}
