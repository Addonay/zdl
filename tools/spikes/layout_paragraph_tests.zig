//! Native paragraph metrics are opaque leaves; zlay never measures/splits text.
const std = @import("std");
const ui = @import("zdl").ui;
const a = @import("layout/adapter.zig");
const p = @import("paragraph/paragraph.zig");
test "layout pinned adapter negotiates paragraph width and uses the painted layout height" {
    const allocator = std.testing.allocator;
    var library = try p.Library.open_resident(.{});
    defer library.deinit();
    var scene = try ui.Scene.init(allocator, .{});
    defer scene.deinit();
    var update = try scene.begin_update();
    defer update.abort();
    _ = try update.begin_group(.{ .integer = 0 }, .{});
    _ = try update.node(.{ .integer = 1 }, .label, .{ .label = "A paragraph العربية עברית with combining cafe\u{301}, wrapped by Pango rather than whitespace sums." });
    try update.end_group();
    var source = try update.commit();
    defer source.deinit();
    var adapter = try a.Adapter.init(allocator, .{ .max_nodes = 2 });
    defer adapter.deinit();
    var items = [_]a.Item{
        .{ .id = source.nodes()[0].id, .style = .{ .width = .{ .grow = .{} }, .height = .{ .content = .{} }, .padding = .{ .left = 10, .right = 10, .top = 10, .bottom = 10 } } },
        .{ .id = source.nodes()[1].id, .style = .{ .width = .{ .grow = .{} }, .height = .{ .content = .{} } } },
    };
    var pending = try adapter.run(source, &items, .{ .width = 240, .height = 1000 });
    defer pending.deinit();
    try std.testing.expect(!pending.ready());
    const width = pending.measurement_requests()[0].constraint.bounded;
    var paragraph = try p.Snapshot.init(allocator, &library, source.nodes()[1].properties.label, .{ .width_px = @intFromFloat(width), .font = "Liberation Sans 20" });
    defer paragraph.deinit();
    items[1].style.measurement = .{ .scene_revision = source.revision(), .size = .{ .width = width, .height = @floatFromInt(paragraph.height) }, .constraint = .{ .bounded = width } };
    var ready = try adapter.run(source, &items, .{ .width = 240, .height = 1000 });
    defer ready.deinit();
    try std.testing.expect(ready.ready());
    try std.testing.expectApproxEqAbs(@as(f32, @floatFromInt(paragraph.height)), (try ready.get(items[1].id)).height, 0.001);
    var bitmap = try paragraph.rasterize();
    defer bitmap.deinit();
    try std.testing.expect(bitmap.height >= paragraph.height);
    var resized = try adapter.run(source, &items, .{ .width = 120, .height = 1000 });
    defer resized.deinit();
    try std.testing.expect(!resized.ready());
    try std.testing.expectApproxEqAbs(@as(f32, 100), resized.measurement_requests()[0].constraint.bounded, 0.001);
    var narrow = try p.Snapshot.init(allocator, &library, source.nodes()[1].properties.label, .{ .width_px = 100, .font = "Liberation Sans 20" });
    defer narrow.deinit();
    items[1].style.measurement = .{ .scene_revision = source.revision(), .size = .{ .width = 100, .height = @floatFromInt(narrow.height) }, .constraint = .{ .bounded = 100 } };
    var reflowed = try adapter.run(source, &items, .{ .width = 120, .height = 1000 });
    defer reflowed.deinit();
    try std.testing.expect(reflowed.ready());
    try std.testing.expectApproxEqAbs(@as(f32, @floatFromInt(narrow.height)), (try reflowed.get(items[1].id)).height, 0.001);
    try std.testing.expect(narrow.height > paragraph.height);
    try std.testing.expectApproxEqAbs(@as(f32, @floatFromInt(paragraph.height)), (try ready.get(items[1].id)).height, 0.001);
}
