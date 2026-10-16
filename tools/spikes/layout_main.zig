const std = @import("std");
const ui = @import("zdl").ui;
const a = @import("layout/adapter.zig");
pub fn main(init: std.process.Init) !void {
    var args = std.process.Args.Iterator.init(init.minimal.args);
    defer args.deinit();
    _ = args.next();
    const width = if (args.next()) |value| try std.fmt.parseFloat(f32, value) else 400;
    if (!std.math.isFinite(width) or width < 160 or width > 4096) return error.InvalidWidth;
    var scene = try ui.Scene.init(init.gpa, .{});
    defer scene.deinit();
    var update = try scene.begin_update();
    defer update.abort();
    _ = try update.begin_group(.{ .integer = 0 }, .{});
    _ = try update.node(.{ .integer = 1 }, .control, .{});
    _ = try update.node(.{ .integer = 2 }, .label, .{ .label = "opaque paragraph metrics" });
    try update.end_group();
    var source = try update.commit();
    defer source.deinit();
    var adapter = try a.Adapter.init(init.gpa, .{ .max_nodes = 3 });
    defer adapter.deinit();
    var items = [_]a.Item{
        .{ .id = source.nodes()[0].id, .style = .{ .width = .{ .grow = .{} }, .height = .{ .fixed = 200 }, .direction = .row, .padding = .{ .left = 10, .right = 10 }, .gap = 8 } },
        .{ .id = source.nodes()[1].id, .style = .{ .width = .{ .fixed = 80 }, .height = .{ .fixed = 60 } } },
        .{ .id = source.nodes()[2].id, .style = .{ .width = .{ .grow = .{} }, .height = .{ .content = .{} } } },
    };
    var first = try adapter.run(source, &items, .{ .width = width, .height = 200 });
    defer first.deinit();
    if (first.ready() or first.measurement_requests().len != 1) return error.ExpectedMeasurement;
    const requested = first.measurement_requests()[0].constraint.bounded;
    if (@abs(requested - (width - 108)) > 0.001) return error.WidthMismatch;
    // Analytic fixture, not a text-measurement approximation offered to users.
    const height = @ceil(600 / requested) * 20;
    items[2].style.measurement = .{ .scene_revision = source.revision(), .size = .{ .width = requested, .height = height }, .constraint = .{ .bounded = requested } };
    var result = try adapter.run(source, &items, .{ .width = width, .height = 200 });
    defer result.deinit();
    const box = try result.get(items[2].id);
    if (@abs(box.x - 98) > 0.001 or @abs(box.width - requested) > 0.001 or @abs(box.height - height) > 0.001) return error.GeometryMismatch;
    std.debug.print("{{\"mode\":\"{s}\",\"viewport\":{d},\"x\":{d},\"width\":{d},\"height\":{d},\"revision\":{d},\"epoch\":{d}}}\n", .{ @tagName(@import("builtin").mode), width, box.x, box.width, box.height, result.source.revision(), result.epoch });
}
