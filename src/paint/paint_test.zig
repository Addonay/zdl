const std = @import("std");
const p = @import("paint.zig");
const surface = @import("../video/surface.zig");
const t = std.testing;
const rect: p.Rect = .{ .x = 0, .y = 0, .width = 10, .height = 20 };
const red: p.Color = .{ .r = 1, .g = 0, .b = 0, .a = 0.5 };
fn source(bytes: []u8) !surface.View {
    return surface.View.init(bytes, 1, 2, 8, .rgba8, null);
}

test "paint packet owns path copies and deduplicated immutable padded source images" {
    var bytes = [_]u8{ 255, 0, 0, 128, 99, 99, 99, 99, 0, 255, 0, 255 };
    var image = try p.Image.copy(t.allocator, try source(&bytes), 8);
    defer image.deinit();
    @memset(&bytes, 0);
    var recorder = try p.Recorder.init(t.allocator, .{ .max_image_bytes = 8 });
    defer recorder.deinit();
    var path = [_]p.Segment{ .{ .move = .{ .x = 0, .y = 0 } }, .{ .line = .{ .x = 10, .y = 10 } }, .close };
    try recorder.save();
    try recorder.concat(.{ .x0 = 4 });
    try recorder.clip_path(&path, .even_odd);
    try recorder.fill_path(&path, .nonzero, red);
    try recorder.stroke_path(&path, .{ .width = 2 }, red);
    try recorder.clip_rect(rect);
    try recorder.clip_rounded_rect(.{ .rect = rect, .radius = 100 });
    try recorder.fill_rect(rect, red);
    try recorder.fill_rounded_rect(.{ .rect = rect, .radius = 100 }, red);
    try recorder.begin_layer(0.5);
    try recorder.draw_image(&image, .{ .x = 0, .y = 0, .width = 1, .height = 2 }, rect, .linear);
    try recorder.draw_image(&image, .{ .x = 0, .y = 0, .width = 1, .height = 2 }, rect, .nearest);
    try recorder.end_layer();
    try recorder.restore();
    var packet = try recorder.finish();
    defer packet.deinit();
    image.deinit();
    path[0] = .{ .move = .{ .x = 999, .y = 999 } };
    var clone = try packet.clone();
    defer clone.deinit();
    packet.deinit();
    const commands = try clone.commands();
    try t.expectEqual(@as(usize, 14), commands.len);
    try t.expectEqual(@as(f64, 0), commands[2].clip_path.segments[0].move.x);
    try t.expectEqual(@as(f64, 5), commands[6].clip_rounded_rect.radius);
    try t.expectEqualSlices(u8, &.{ 255, 0, 0, 128, 0, 255, 0, 255 }, commands[10].image.image.rgba);
    try t.expectEqual(commands[10].image.image.id, commands[11].image.image.id);
    try t.expect((try clone.metadata()).full_redraw);
    try t.expectEqual(p.ColorPolicy.srgb_compatible, (try clone.metadata()).color_policy);
}

test "paint packet nesting finite transforms limits and errors poison finish" {
    var recorder = try p.Recorder.init(t.allocator, .{});
    defer recorder.deinit();
    try recorder.save();
    try recorder.begin_layer(1);
    try t.expectError(error.Unbalanced, recorder.restore());
    try t.expectError(error.RecorderFailed, recorder.finish());
    var depth = try p.Recorder.init(t.allocator, .{ .max_depth = 0 });
    defer depth.deinit();
    try t.expectError(error.DepthLimit, depth.save());
    var invalid = try p.Recorder.init(t.allocator, .{});
    defer invalid.deinit();
    try t.expectError(error.InvalidGeometry, invalid.concat(.{ .xx = std.math.inf(f64) }));
    var overflow = try p.Recorder.init(t.allocator, .{ .device_transform = .{ .xx = 1e308 } });
    defer overflow.deinit();
    try t.expectError(error.InvalidGeometry, overflow.fill_rect(rect, red));
    var color = try p.Recorder.init(t.allocator, .{});
    defer color.deinit();
    try t.expectError(error.InvalidColor, color.fill_rect(rect, .{ .r = 2, .g = 0, .b = 0 }));
    var invalid_path = try p.Recorder.init(t.allocator, .{});
    defer invalid_path.deinit();
    try t.expectError(error.InvalidPath, invalid_path.fill_path(&.{.{ .line = .{ .x = 1, .y = 1 } }}, .nonzero, red));
    var limited = try p.Recorder.init(t.allocator, .{ .max_commands = 1 });
    defer limited.deinit();
    try limited.fill_rect(rect, red);
    try t.expectError(error.CommandLimit, limited.fill_rect(rect, red));
    try t.expectError(error.RecorderFailed, limited.finish());
}
fn allocation_scenario(allocator: std.mem.Allocator) !void {
    var bytes = [_]u8{ 255, 0, 0, 128, 0, 0, 0, 0, 0, 255, 0, 255 };
    var image = try p.Image.copy(allocator, try source(&bytes), 8);
    defer image.deinit();
    var recorder = try p.Recorder.init(allocator, .{});
    defer recorder.deinit();
    try recorder.save();
    try recorder.fill_path(&.{ .{ .move = .{ .x = 1, .y = 2 } }, .{ .line = .{ .x = 3, .y = 4 } } }, .nonzero, red);
    // Force command growth after retaining an image to exercise failed append.
    for (0..100) |_| try recorder.draw_image(&image, .{ .x = 0, .y = 0, .width = 1, .height = 2 }, rect, .nearest);
    try recorder.restore();
    var packet = try recorder.finish();
    defer packet.deinit();
    var clone = try packet.clone();
    defer clone.deinit();
    try t.expectEqual(@as(usize, 103), (try clone.commands()).len);
}
test "paint packet every allocation failure unwinds path and retained resource ownership" {
    try t.checkAllAllocationFailures(t.allocator, allocation_scenario, .{});
}

test "paint packet extended policy layer restore geometry budgets and closed handles" {
    var recorder = try p.Recorder.init(t.allocator, .{ .color_policy = .extended_linear, .max_segments = 1 });
    defer recorder.deinit();
    try recorder.begin_layer(1);
    try recorder.concat(.{ .xx = 1e308 });
    try recorder.end_layer(); // restores transform; otherwise the following overflows
    try recorder.fill_rect(rect, .{ .r = -1, .g = 2, .b = 0 });
    try t.expectError(error.GeometryLimit, recorder.fill_path(&.{ .{ .move = .{ .x = 0, .y = 0 } }, .close }, .nonzero, red));
    try t.expectError(error.RecorderFailed, recorder.finish());
    var good = try p.Recorder.init(t.allocator, .{});
    defer good.deinit();
    var packet = try good.finish();
    defer packet.deinit();
    try t.expectError(error.Closed, good.finish());
    packet.storage.?.references.store(std.math.maxInt(usize), .monotonic);
    try t.expectError(error.ReferenceLimit, packet.clone());
    packet.storage.?.references.store(1, .monotonic);
    packet.deinit();
    packet.deinit();
    try t.expectError(error.Closed, packet.commands());
}
fn clone_worker(packet: *const p.Packet, failed: *std.atomic.Value(bool)) void {
    for (0..2000) |_| {
        var clone = packet.clone() catch {
            failed.store(true, .release);
            return;
        };
        const commands = clone.commands() catch {
            failed.store(true, .release);
            clone.deinit();
            return;
        };
        if (commands.len != 1 or commands[0].fill_rect.color.r != 1) failed.store(true, .release);
        clone.deinit();
    }
}
test "paint packet distinct concurrent leases retain immutable command storage" {
    var recorder = try p.Recorder.init(t.allocator, .{});
    defer recorder.deinit();
    try recorder.fill_rect(rect, red);
    var packet = try recorder.finish();
    defer packet.deinit();
    var failed: std.atomic.Value(bool) = .init(false);
    var threads: [4]std.Thread = undefined;
    var count: usize = 0;
    defer for (threads[0..count]) |thread| thread.join();
    for (&threads) |*thread| {
        thread.* = try std.Thread.spawn(.{}, clone_worker, .{ &packet, &failed });
        count += 1;
    }
    // Keep the original owner alive until all worker handles end; no worker uses
    // the test allocator, which remains owned by this test thread.
    for (threads[0..count]) |thread| thread.join();
    count = 0;
    try t.expect(!failed.load(.acquire));
}

test "paint packet image bounds source limits and invalid alpha cannot publish" {
    var bytes = [_]u8{ 255, 0, 0, 128, 0, 0, 0, 0, 0, 255, 0, 255 };
    try t.expectError(error.ImageLimit, p.Image.copy(t.allocator, try source(&bytes), 7));
    var image = try p.Image.copy(t.allocator, try source(&bytes), 8);
    defer image.deinit();
    var limited = try p.Recorder.init(t.allocator, .{ .max_image_bytes = 7 });
    defer limited.deinit();
    try t.expectError(error.ImageLimit, limited.draw_image(&image, .{ .x = 0, .y = 0, .width = 1, .height = 2 }, rect, .nearest));
    try t.expectError(error.RecorderFailed, limited.finish());
    var invalid = try p.Recorder.init(t.allocator, .{});
    defer invalid.deinit();
    try t.expectError(error.InvalidGeometry, invalid.draw_image(&image, .{ .x = 0, .y = 0, .width = 2, .height = 2 }, rect, .nearest));
    var alpha = try p.Recorder.init(t.allocator, .{ .color_policy = .extended_linear });
    defer alpha.deinit();
    try t.expectError(error.InvalidColor, alpha.fill_rect(rect, .{ .r = 1, .g = 1, .b = 1, .a = -1 }));
}

test "paint packet zero width raster skips a huge declared row count" {
    var bytes: [0]u8 = .{};
    const empty = try surface.View.init(&bytes, 0, std.math.maxInt(u31), 0, .rgba8, null);
    var image = try p.Image.copy(t.allocator, empty, 0);
    defer image.deinit();
    const view = try image.view();
    try t.expectEqual(@as(usize, 0), view.rgba.len);
    try t.expectEqual(std.math.maxInt(u31), view.height);
}

const gradient_geometry: p.GradientGeometry = .{ .linear = .{ .start = .{ .x = 0, .y = 0 }, .end = .{ .x = 10, .y = 0 } } };
const gradient_stops = [_]p.GradientStop{ .{ .offset = 0, .color = .{ .r = 1, .g = 0, .b = 0 } }, .{ .offset = 1, .color = .{ .r = 0, .g = 0, .b = 1, .a = 0 } } };
test "paint gradient resources own ordered stops and packets retain once" {
    var stops = gradient_stops;
    var gradient = try p.Gradient.init(t.allocator, gradient_geometry, &stops, .{});
    defer gradient.deinit();
    stops[0].color.r = 0;
    var recorder = try p.Recorder.init(t.allocator, .{ .max_gradient_bytes = @sizeOf(p.GradientStop) * 2 });
    defer recorder.deinit();
    try recorder.fill_rect_gradient(rect, &gradient);
    try recorder.fill_rounded_rect_gradient(.{ .rect = rect, .radius = 4 }, &gradient);
    const segments = [_]p.Segment{ .{ .move = .{ .x = 0, .y = 0 } }, .{ .line = .{ .x = 10, .y = 10 } } };
    try recorder.fill_path_gradient(&segments, .even_odd, &gradient);
    try recorder.stroke_path_gradient(&segments, .{}, &gradient);
    var packet = try recorder.finish();
    defer packet.deinit();
    gradient.deinit();
    var clone = try packet.clone();
    defer clone.deinit();
    packet.deinit();
    const commands = try clone.commands();
    const id = commands[0].fill_rect_gradient.gradient_id;
    const view = try clone.gradient_view(id);
    try t.expectEqual(@as(f64, 1), view.stops[0].color.r);
    try t.expectEqual(id, commands[3].stroke_path_gradient.gradient_id);
    try t.expectError(error.ForeignGradient, clone.gradient_view(@fromBackingInt(std.math.maxInt(u64))));
}
test "paint gradient stop order geometry policy budget and saturation reject safely" {
    var stops = gradient_stops;
    stops[0].offset = -1;
    try t.expectError(error.InvalidGradient, p.Gradient.init(t.allocator, gradient_geometry, &stops, .{}));
    stops = gradient_stops;
    stops[0].offset = 1;
    stops[1].offset = 0;
    try t.expectError(error.InvalidGradient, p.Gradient.init(t.allocator, gradient_geometry, &stops, .{}));
    try t.expectError(error.GradientLimit, p.Gradient.init(t.allocator, gradient_geometry, &gradient_stops, .{ .max_stops = 1 }));
    try t.expectError(error.InvalidGradient, p.Gradient.init(t.allocator, .{ .linear = .{ .start = .{ .x = 0, .y = 0 }, .end = .{ .x = 0, .y = 0 } } }, &gradient_stops, .{}));
    var gradient = try p.Gradient.init(t.allocator, gradient_geometry, &gradient_stops, .{});
    defer gradient.deinit();
    gradient.storage.?.references.store(std.math.maxInt(usize), .monotonic);
    try t.expectError(error.ReferenceLimit, gradient.clone());
    gradient.storage.?.references.store(1, .monotonic);
    var limited = try p.Recorder.init(t.allocator, .{ .max_gradient_bytes = 0 });
    defer limited.deinit();
    try t.expectError(error.GradientLimit, limited.fill_rect_gradient(rect, &gradient));
    try t.expectError(error.RecorderFailed, limited.finish());
    var other = try p.Recorder.init(t.allocator, .{ .color_policy = .linear });
    defer other.deinit();
    try t.expectError(error.ColorPolicyMismatch, other.fill_rect_gradient(rect, &gradient));
    var duplicates = gradient_stops;
    duplicates[1].offset = 0;
    var equal = try p.Gradient.init(t.allocator, gradient_geometry, &duplicates, .{});
    defer equal.deinit();
    try t.expectEqual(@as(f64, 1), (try equal.view()).stops[0].color.r);
    try t.expectEqual(@as(f64, 1), (try equal.view()).stops[1].color.b);
}
fn gradient_allocations(allocator: std.mem.Allocator) !void {
    var gradient = try p.Gradient.init(allocator, gradient_geometry, &gradient_stops, .{});
    defer gradient.deinit();
    var recorder = try p.Recorder.init(allocator, .{});
    defer recorder.deinit();
    const segments = [_]p.Segment{ .{ .move = .{ .x = 0, .y = 0 } }, .{ .line = .{ .x = 1, .y = 2 } } };
    try recorder.fill_path_gradient(&segments, .nonzero, &gradient);
    for (0..100) |_| try recorder.fill_rect_gradient(rect, &gradient);
    var packet = try recorder.finish();
    defer packet.deinit();
    try t.expectEqual(@as(usize, 101), (try packet.commands()).len);
}
test "paint gradient all allocation failures unwind resources paths and failed append" {
    try t.checkAllAllocationFailures(t.allocator, gradient_allocations, .{});
}

test "paint gradient reference sample handles spread alpha and duplicate boundaries" {
    var gradient = try p.Gradient.init(t.allocator, gradient_geometry, &gradient_stops, .{});
    defer gradient.deinit();
    const view = try gradient.view();
    const middle = try view.sample(0.5);
    try t.expectEqual(@as(f64, 0.5), middle.r);
    try t.expectEqual(@as(f64, 0), middle.b);
    try t.expectEqual(@as(f64, 0.5), middle.a);
    try t.expectError(error.InvalidGradient, view.sample(std.math.nan(f64)));
    inline for (.{ p.GradientExtend.none, .repeat, .reflect }) |extend| {
        var resource = try p.Gradient.init(t.allocator, gradient_geometry, &gradient_stops, .{ .extend = extend });
        defer resource.deinit();
        const sample = try (try resource.view()).sample(-0.25);
        const expected: f64 = switch (extend) {
            .none => 0,
            .repeat => 0.25,
            .reflect => 0.75,
            else => unreachable,
        };
        try t.expectEqual(expected, sample.r);
        try t.expectEqual(expected, sample.a);
    }
    const duplicate = [_]p.GradientStop{ .{ .offset = 0, .color = red }, .{ .offset = 0.5, .color = red }, .{ .offset = 0.5, .color = .{ .r = 0, .g = 0, .b = 1 } }, .{ .offset = 1, .color = .{ .r = 0, .g = 0, .b = 1 } } };
    var hard = try p.Gradient.init(t.allocator, gradient_geometry, &duplicate, .{});
    defer hard.deinit();
    try t.expectEqual(@as(f64, 1), (try (try hard.view()).sample(0.5)).b);
}
