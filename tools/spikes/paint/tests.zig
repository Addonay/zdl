const std = @import("std");
const zdl = @import("zdl");
const paint = zdl.paint;
const replay = @import("replay.zig");
const t = std.testing;
const red: paint.Color = .{ .r = 1, .g = 0, .b = 0 };
fn box(x: f64, y: f64, w: f64, h: f64) paint.Rect {
    return .{ .x = x, .y = y, .width = w, .height = h };
}

test "Cairo paint device transform clip and layer alpha produce expected pixels" {
    var library = try replay.Library.open("libcairo.so.2");
    defer library.deinit();
    var recorder = try paint.Recorder.init(t.allocator, .{ .device_transform = .{ .xx = 2, .yy = 2 } });
    defer recorder.deinit();
    try recorder.save();
    try recorder.concat(.{ .x0 = 1, .y0 = 1 });
    try recorder.clip_rect(box(0, 0, 4, 3));
    try recorder.begin_layer(0.5);
    try recorder.fill_rect(box(0, 0, 3, 3), red);
    try recorder.fill_rect(box(1, 0, 3, 3), red);
    try recorder.end_layer();
    try recorder.restore();
    var packet = try recorder.finish();
    defer packet.deinit();
    var image = try replay.render(&library, t.allocator, &packet, 16, 12, .{});
    defer image.deinit();
    try t.expectEqual(zdl.pixels.Color{ .r = 0, .g = 0, .b = 0, .a = 0 }, try image.premultiplied_pixel(0, 0));
    const single = try image.premultiplied_pixel(3, 3);
    const overlap = try image.premultiplied_pixel(5, 3);
    try t.expectEqual(zdl.pixels.Color{ .r = 128, .g = 0, .b = 0, .a = 128 }, single);
    try t.expectEqual(single, overlap); // group opacity, not per-primitive alpha
    try t.expectEqual(@as(u8, 0), (try image.premultiplied_pixel(10, 3)).a);
}

test "Cairo paint image ownership source crop and straight to premultiplied conversion" {
    var library = try replay.Library.open("libcairo.so.2");
    defer library.deinit();
    var bytes: [8]u8 = .{ 255, 0, 0, 255, 0, 0, 128, 128 };
    var raster = try paint.Image.copy(t.allocator, try zdl.surface.View.init(&bytes, 2, 1, 8, .rgba8, null), 8);
    defer raster.deinit();
    var recorder = try paint.Recorder.init(t.allocator, .{});
    defer recorder.deinit();
    try recorder.draw_image(&raster, box(1, 0, 1, 1), box(0, 0, 4, 4), .nearest);
    try recorder.draw_image(&raster, box(0, 0, 2, 1), box(4, 0, 8, 4), .linear);
    var packet = try recorder.finish();
    defer packet.deinit();
    raster.deinit();
    @memset(&bytes, 255);
    var image = try replay.render(&library, t.allocator, &packet, 12, 4, .{});
    defer image.deinit();
    try t.expectEqual(zdl.pixels.Color{ .r = 0, .g = 0, .b = 64, .a = 128 }, try image.premultiplied_pixel(2, 2));
    try t.expectEqual(zdl.pixels.Color{ .r = 255, .g = 0, .b = 0, .a = 255 }, try image.premultiplied_pixel(4, 2));
    const mixed = try image.premultiplied_pixel(8, 2);
    try t.expect(mixed.r > 0 and mixed.r < 255 and mixed.b > 0 and mixed.b < 64);
}

test "Cairo paint rounded clips even odd paths curves and strokes replay" {
    var library = try replay.Library.open("libcairo.so.2");
    defer library.deinit();
    var recorder = try paint.Recorder.init(t.allocator, .{});
    defer recorder.deinit();
    try recorder.save();
    try recorder.clip_rounded_rect(.{ .rect = box(0, 0, 10, 10), .radius = 4 });
    try recorder.fill_rect(box(0, 0, 10, 10), red);
    try recorder.restore();
    const rings = [_]paint.Segment{ .{ .move = .{ .x = 12, .y = 0 } }, .{ .line = .{ .x = 24, .y = 0 } }, .{ .line = .{ .x = 24, .y = 12 } }, .{ .line = .{ .x = 12, .y = 12 } }, .close, .{ .move = .{ .x = 15, .y = 3 } }, .{ .line = .{ .x = 21, .y = 3 } }, .{ .line = .{ .x = 21, .y = 9 } }, .{ .line = .{ .x = 15, .y = 9 } }, .close };
    try recorder.save();
    try recorder.clip_path(&rings, .even_odd);
    try recorder.fill_rounded_rect(.{ .rect = box(12, 0, 12, 12), .radius = 0 }, red);
    try recorder.restore();
    try recorder.fill_path(&rings, .even_odd, red);
    try recorder.stroke_path(&.{ .{ .move = .{ .x = 1, .y = 16 } }, .{ .quadratic = .{ .control = .{ .x = 8, .y = 12 }, .to = .{ .x = 14, .y = 16 } } }, .{ .cubic = .{ .first = .{ .x = 17, .y = 20 }, .second = .{ .x = 20, .y = 12 }, .to = .{ .x = 24, .y = 16 } } } }, .{ .width = 2, .cap = .round, .join = .bevel }, red);
    var packet = try recorder.finish();
    defer packet.deinit();
    var image = try replay.render(&library, t.allocator, &packet, 26, 22, .{});
    defer image.deinit();
    try t.expectEqual(@as(u8, 0), (try image.premultiplied_pixel(0, 0)).a);
    try t.expectEqual(@as(u8, 255), (try image.premultiplied_pixel(5, 5)).a);
    try t.expectEqual(@as(u8, 255), (try image.premultiplied_pixel(13, 6)).a);
    try t.expectEqual(@as(u8, 0), (try image.premultiplied_pixel(18, 6)).a);
    try t.expect((try image.premultiplied_pixel(1, 16)).a > 0);
}
fn allocation_scenario(allocator: std.mem.Allocator, library: *replay.Library, packet: *const paint.Packet) !void {
    var image = try replay.render(library, allocator, packet, 8, 8, .{});
    defer image.deinit();
    try t.expectEqual(@as(u8, 255), (try image.premultiplied_pixel(2, 2)).a);
}
test "Cairo paint replay allocation failures discard temporary native output" {
    var library = try replay.Library.open("libcairo.so.2");
    defer library.deinit();
    var bytes: [4]u8 = .{ 255, 0, 0, 255 };
    var raster = try paint.Image.copy(t.allocator, try zdl.surface.View.init(&bytes, 1, 1, 4, .rgba8, null), 4);
    defer raster.deinit();
    var recorder = try paint.Recorder.init(t.allocator, .{});
    defer recorder.deinit();
    try recorder.begin_layer(1);
    try recorder.draw_image(&raster, box(0, 0, 1, 1), box(0, 0, 8, 8), .nearest);
    try recorder.end_layer();
    var packet = try recorder.finish();
    defer packet.deinit();
    try t.checkAllAllocationFailures(t.allocator, allocation_scenario, .{ &library, &packet });
}
test "Cairo paint rejects unsupported policy singular transform and missing provider" {
    if (replay.Library.open("/zdl-no-provider/libcairo.so")) |value| {
        var unexpected = value;
        unexpected.deinit();
        return error.ExpectedMissing;
    } else |_| {}
    var library = try replay.Library.open("libcairo.so.2");
    defer library.deinit();
    var recorder = try paint.Recorder.init(t.allocator, .{ .color_policy = .linear });
    defer recorder.deinit();
    var packet = try recorder.finish();
    defer packet.deinit();
    try t.expectError(error.UnsupportedColorPolicy, replay.render(&library, t.allocator, &packet, 4, 4, .{}));
    var singular = try paint.Recorder.init(t.allocator, .{ .device_transform = .{ .xx = 0 } });
    defer singular.deinit();
    var invalid = try singular.finish();
    defer invalid.deinit();
    try t.expectError(error.NativeFailure, replay.render(&library, t.allocator, &invalid, 4, 4, .{}));
}

test "Cairo paint admission bounds output layers and converted image working buffers" {
    try t.expectError(error.MissingSymbol, replay.Library.open("libc.so.6"));
    var library = try replay.Library.open("libcairo.so.2");
    defer library.deinit();
    var recorder = try paint.Recorder.init(t.allocator, .{});
    defer recorder.deinit();
    try recorder.begin_layer(1);
    try recorder.fill_rect(box(0, 0, 4, 4), red);
    try recorder.end_layer();
    var packet = try recorder.finish();
    defer packet.deinit();
    try t.expectError(error.OutputLimit, replay.render(&library, t.allocator, &packet, 4, 4, .{ .max_output_bytes = 63 }));
    try t.expectError(error.WorkingLimit, replay.render(&library, t.allocator, &packet, 4, 4, .{ .max_working_bytes = 127 }));
    var image = try replay.render(&library, t.allocator, &packet, 4, 4, .{ .max_working_bytes = 128 });
    defer image.deinit();
    try t.expectEqual(@as(u8, 255), (try image.premultiplied_pixel(2, 2)).a);
    var bytes: [4]u8 = .{ 255, 0, 0, 255 };
    var raster = try paint.Image.copy(t.allocator, try zdl.surface.View.init(&bytes, 1, 1, 4, .rgba8, null), 4);
    defer raster.deinit();
    var repeated = try paint.Recorder.init(t.allocator, .{});
    defer repeated.deinit();
    for (0..2) |_| try repeated.draw_image(&raster, box(0, 0, 1, 1), box(0, 0, 4, 4), .nearest);
    var samples = try repeated.finish();
    defer samples.deinit();
    try t.expectError(error.WorkingLimit, replay.render(&library, t.allocator, &samples, 4, 4, .{ .max_working_bytes = 67 }));
    var deduplicated = try replay.render(&library, t.allocator, &samples, 4, 4, .{ .max_working_bytes = 68 });
    defer deduplicated.deinit();
    try t.expectEqual(@as(u8, 255), (try deduplicated.premultiplied_pixel(2, 2)).a);
}

test "Cairo paint gradients interpolate premultiplied alpha and reuse local coordinates" {
    var library = try replay.Library.open("libcairo.so.2");
    defer library.deinit();
    const stops = [_]paint.GradientStop{ .{ .offset = 0, .color = .{ .r = 1, .g = 0, .b = 0 } }, .{ .offset = 1, .color = .{ .r = 0, .g = 0, .b = 1, .a = 0 } } };
    var gradient = try paint.Gradient.init(t.allocator, .{ .linear = .{ .start = .{ .x = 0.5, .y = 0 }, .end = .{ .x = 4.5, .y = 0 } } }, &stops, .{});
    defer gradient.deinit();
    var recorder = try paint.Recorder.init(t.allocator, .{});
    defer recorder.deinit();
    try recorder.fill_rect_gradient(box(0, 0, 5, 2), &gradient);
    try recorder.save();
    try recorder.concat(.{ .x0 = 6 });
    try recorder.fill_rounded_rect_gradient(.{ .rect = box(0, 0, 5, 2), .radius = 0.5 }, &gradient);
    try recorder.restore();
    try recorder.fill_path_gradient(&.{ .{ .move = .{ .x = 0, .y = 4 } }, .{ .line = .{ .x = 5, .y = 4 } }, .{ .line = .{ .x = 5, .y = 8 } }, .{ .line = .{ .x = 0, .y = 8 } }, .close }, .nonzero, &gradient);
    try recorder.stroke_path_gradient(&.{ .{ .move = .{ .x = 0, .y = 11 } }, .{ .line = .{ .x = 5, .y = 11 } } }, .{ .width = 2 }, &gradient);
    try recorder.save();
    try recorder.clip_rect(box(1, 16, 4, 2));
    try recorder.begin_layer(0.5);
    try recorder.fill_rect_gradient(box(0, 16, 5, 2), &gradient);
    try recorder.end_layer();
    try recorder.restore();
    var packet = try recorder.finish();
    defer packet.deinit();
    gradient.deinit();
    var image = try replay.render(&library, t.allocator, &packet, 12, 20, .{});
    defer image.deinit();
    const first = try image.premultiplied_pixel(0, 0);
    try t.expectEqual(@as(u8, 255), first.r);
    const mid = try image.premultiplied_pixel(2, 0);
    try t.expect(mid.r >= 127 and mid.r <= 129 and mid.a >= 127 and mid.a <= 129);
    try t.expectEqual(@as(u8, 0), mid.b); // transparent blue cannot contaminate red
    try t.expectEqual(mid, try image.premultiplied_pixel(8, 0));
    try t.expectEqual(mid, try image.premultiplied_pixel(2, 5));
    try t.expectEqual(mid, try image.premultiplied_pixel(2, 11));
    const layered = try image.premultiplied_pixel(2, 16);
    try t.expect(layered.r >= 63 and layered.r <= 65 and layered.a >= 63 and layered.a <= 65 and layered.b == 0);
    try t.checkAllAllocationFailures(t.allocator, gradient_replay_allocations, .{ &library, &packet });
}

test "Cairo paint radial spread duplicate stops and native pattern allocation cleanup" {
    var library = try replay.Library.open("libcairo.so.2");
    defer library.deinit();
    const stops = [_]paint.GradientStop{ .{ .offset = 0, .color = red }, .{ .offset = 1, .color = .{ .r = 0, .g = 0, .b = 1 } } };
    var radial = try paint.Gradient.init(t.allocator, .{ .radial = .{ .start = .{ .center = .{ .x = 10.5, .y = 10.5 }, .radius = 0 }, .end = .{ .center = .{ .x = 10.5, .y = 10.5 }, .radius = 4 } } }, &stops, .{});
    defer radial.deinit();
    var recorder = try paint.Recorder.init(t.allocator, .{});
    defer recorder.deinit();
    try recorder.fill_rect_gradient(box(0, 0, 20, 20), &radial);
    var packet = try recorder.finish();
    defer packet.deinit();
    var image = try replay.render(&library, t.allocator, &packet, 20, 20, .{});
    defer image.deinit();
    try t.expectEqual(@as(u8, 255), (try image.premultiplied_pixel(10, 10)).r);
    try t.expectEqual(@as(u8, 255), (try image.premultiplied_pixel(18, 10)).b);
    try t.checkAllAllocationFailures(t.allocator, allocation_scenario, .{ &library, &packet });
    const fade_stops = [_]paint.GradientStop{ .{ .offset = 0, .color = red }, .{ .offset = 1, .color = .{ .r = 0, .g = 0, .b = 1, .a = 0 } } };
    var fade = try paint.Gradient.init(t.allocator, (try radial.view()).geometry, &fade_stops, .{});
    defer fade.deinit();
    var fade_recorder = try paint.Recorder.init(t.allocator, .{});
    defer fade_recorder.deinit();
    try fade_recorder.fill_rect_gradient(box(0, 0, 20, 20), &fade);
    var fade_packet = try fade_recorder.finish();
    defer fade_packet.deinit();
    try t.expectError(error.WorkingLimit, replay.render(&library, t.allocator, &fade_packet, 20, 20, .{ .max_working_bytes = 3199 }));
    var fade_image = try replay.render(&library, t.allocator, &fade_packet, 20, 20, .{ .max_working_bytes = 3200 });
    defer fade_image.deinit();
    var empty_recorder = try paint.Recorder.init(t.allocator, .{});
    defer empty_recorder.deinit();
    try empty_recorder.fill_rect_gradient(box(0, 0, 0, 4), &fade);
    var empty_packet = try empty_recorder.finish();
    defer empty_packet.deinit();
    var empty_image = try replay.render(&library, t.allocator, &empty_packet, 4, 4, .{ .max_working_bytes = 64 });
    defer empty_image.deinit();
    try t.expectEqual(@as(u8, 0), (try empty_image.premultiplied_pixel(2, 2)).a);
    const faded = try fade_image.premultiplied_pixel(12, 10);
    try t.expectEqual(@as(u8, 128), faded.r);
    try t.expectEqual(@as(u8, 128), faded.a);
    try t.expectEqual(@as(u8, 0), faded.b);
    inline for (.{ paint.GradientExtend.repeat, .reflect, .none }) |extend| {
        var resource = try paint.Gradient.init(t.allocator, .{ .linear = .{ .start = .{ .x = 0.5, .y = 0 }, .end = .{ .x = 4.5, .y = 0 } } }, &stops, .{ .extend = extend });
        defer resource.deinit();
        var rec = try paint.Recorder.init(t.allocator, .{});
        defer rec.deinit();
        try rec.fill_rect_gradient(box(0, 0, 12, 2), &resource);
        var frame = try rec.finish();
        defer frame.deinit();
        var output = try replay.render(&library, t.allocator, &frame, 12, 2, .{});
        defer output.deinit();
        const value = try output.premultiplied_pixel(8, 0);
        if (extend == .none) try t.expectEqual(@as(u8, 0), value.a) else try t.expect(value.r >= 254 and value.b <= 1);
    }
    const hard = [_]paint.GradientStop{ .{ .offset = 0, .color = red }, .{ .offset = 0.5, .color = red }, .{ .offset = 0.5, .color = .{ .r = 0, .g = 0, .b = 1 } }, .{ .offset = 1, .color = .{ .r = 0, .g = 0, .b = 1 } } };
    var resource = try paint.Gradient.init(t.allocator, .{ .linear = .{ .start = .{ .x = 0, .y = 0 }, .end = .{ .x = 4, .y = 0 } } }, &hard, .{});
    defer resource.deinit();
    var rec = try paint.Recorder.init(t.allocator, .{});
    defer rec.deinit();
    try rec.fill_rect_gradient(box(0, 0, 4, 2), &resource);
    var frame = try rec.finish();
    defer frame.deinit();
    var output = try replay.render(&library, t.allocator, &frame, 4, 2, .{});
    defer output.deinit();
    try t.expectEqual(@as(u8, 255), (try output.premultiplied_pixel(1, 0)).r);
    try t.expectEqual(@as(u8, 255), (try output.premultiplied_pixel(2, 0)).b);
}

fn gradient_replay_allocations(allocator: std.mem.Allocator, library: *replay.Library, packet: *const paint.Packet) !void {
    var image = try replay.render(library, allocator, packet, 12, 20, .{});
    defer image.deinit();
    try t.expectEqual(@as(u8, 255), (try image.premultiplied_pixel(0, 0)).a);
}
