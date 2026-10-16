const std = @import("std");
const ui = @import("zdl").ui;
const a = @import("layout/adapter.zig");
const t = std.testing;
fn fixture(allocator: std.mem.Allocator) !ui.Snapshot {
    var scene = try ui.Scene.init(allocator, .{});
    defer scene.deinit();
    var update = try scene.begin_update();
    defer update.abort();
    _ = try update.begin_group(.{ .integer = 0 }, .{});
    _ = try update.node(.{ .integer = 1 }, .control, .{});
    _ = try update.node(.{ .integer = 2 }, .control, .{});
    try update.end_group();
    return update.commit();
}
fn styles(snapshot: ui.Snapshot) [3]a.Item {
    return .{
        .{ .id = snapshot.nodes()[0].id, .style = .{ .width = .{ .fixed = 300 }, .height = .{ .fixed = 100 }, .direction = .row, .padding = .{ .left = 10, .right = 10, .top = 5, .bottom = 5 }, .gap = 10 } },
        .{ .id = snapshot.nodes()[1].id, .style = .{ .width = .{ .fixed = 50 }, .height = .{ .fixed = 20 } } },
        .{ .id = snapshot.nodes()[2].id, .style = .{ .width = .{ .grow = .{} }, .height = .{ .fixed = 40 } } },
    };
}
test "layout pinned zlay row geometry matches independent arithmetic and old results own their data" {
    var source = try fixture(t.allocator);
    defer source.deinit();
    var adapter = try a.Adapter.init(t.allocator, .{ .max_nodes = 3 });
    var items = styles(source);
    var first = try adapter.run(source, &items, .{ .width = 400, .height = 200 });
    defer first.deinit();
    const one = try first.get(items[1].id);
    const two = try first.get(items[2].id);
    try t.expectApproxEqAbs(@as(f32, 10), one.x, 0.001);
    try t.expectApproxEqAbs(@as(f32, 5), one.y, 0.001);
    try t.expectApproxEqAbs(@as(f32, 70), two.x, 0.001);
    try t.expectApproxEqAbs(@as(f32, 220), two.width, 0.001);
    items[0].style.width = .{ .fixed = 350 };
    var second = try adapter.run(source, &items, .{ .width = 400, .height = 200 });
    defer second.deinit();
    adapter.deinit();
    try t.expectApproxEqAbs(@as(f32, 270), (try second.get(items[2].id)).width, 0.001);
    try t.expectApproxEqAbs(@as(f32, 220), (try first.get(items[2].id)).width, 0.001);
}

test "layout requires new width-dependent measurement before ready geometry can escape" {
    var source = try fixture(t.allocator);
    defer source.deinit();
    var adapter = try a.Adapter.init(t.allocator, .{ .max_nodes = 3 });
    defer adapter.deinit();
    var items = styles(source);
    items[2].style.height = .{ .content = .{} };
    var request = try adapter.run(source, &items, .{ .width = 400, .height = 200 });
    defer request.deinit();
    try t.expect(!request.ready());
    try t.expectError(error.NeedsMeasurement, request.placements());
    try t.expectEqual(@as(usize, 1), request.measurement_requests().len);
    try t.expectApproxEqAbs(@as(f32, 220), request.measurement_requests()[0].constraint.bounded, 0.001);
    items[2].style.measurement = .{ .scene_revision = source.revision(), .size = .{ .width = 220, .height = 60 }, .constraint = .{ .bounded = 220 } };
    var result = try adapter.run(source, &items, .{ .width = 400, .height = 200 });
    defer result.deinit();
    try t.expect(result.ready());
    try t.expectApproxEqAbs(@as(f32, 60), (try result.get(items[2].id)).height, 0.001);
}

test "layout malformed input capacity fractional gaps and unsupported intrinsic growth fail explicitly" {
    var source = try fixture(t.allocator);
    defer source.deinit();
    var small = try a.Adapter.init(t.allocator, .{ .max_nodes = 2 });
    defer small.deinit();
    var adapter = try a.Adapter.init(t.allocator, .{ .max_nodes = 3 });
    defer adapter.deinit();
    var items = styles(source);
    try t.expectError(error.Capacity, small.run(source, &items, .{ .width = 400, .height = 200 }));
    try t.expectError(error.InvalidGeometry, adapter.run(source, &items, .{ .width = std.math.nan(f32), .height = 200 }));
    items[0].style.gap = 0.5;
    try t.expectError(error.UnsupportedFractionalSpacing, adapter.run(source, &items, .{ .width = 400, .height = 200 }));
    items = styles(source);
    items[0].style.width = .{ .content = .{} };
    try t.expectError(error.UnsupportedConstraint, adapter.run(source, &items, .{ .width = 400, .height = 200 }));
}

fn failures(allocator: std.mem.Allocator) !void {
    var source = try fixture(allocator);
    defer source.deinit();
    var adapter = try a.Adapter.init(allocator, .{ .max_nodes = 3 });
    defer adapter.deinit();
    const items = styles(source);
    var result = try adapter.run(source, &items, .{ .width = 400, .height = 200 });
    defer result.deinit();
    try t.expect(result.ready());
    try t.expectEqual(@as(usize, 3), (try result.placements()).len);
}
test "layout adapter all allocator failures unwind scene leases scratch and backend memory" {
    try failures(t.allocator);
    try t.checkAllAllocationFailures(t.allocator, failures, .{});
}

test "layout fractional dimensions percentage sizing and cross alignment preserve logical points" {
    var source = try fixture(t.allocator);
    defer source.deinit();
    var adapter = try a.Adapter.init(t.allocator, .{ .max_nodes = 3 });
    defer adapter.deinit();
    var items = styles(source);
    items[0].style.width = .{ .fixed = 300.5 };
    items[0].style.align_y = .center;
    items[1].style.width = .{ .fraction = 0.25 };
    var result = try adapter.run(source, &items, .{ .width = 400, .height = 200 });
    defer result.deinit();
    const left = try result.get(items[1].id);
    const right = try result.get(items[2].id);
    try t.expectApproxEqAbs(@as(f32, 67.625), left.width, 0.001);
    try t.expectApproxEqAbs(@as(f32, 87.625), right.x, 0.001);
    try t.expectApproxEqAbs(@as(f32, 202.875), right.width, 0.001);
    try t.expectApproxEqAbs(@as(f32, 40), left.y, 0.001);
    try t.expectApproxEqAbs(@as(f32, 30), right.y, 0.001);
}

test "layout style generations duplicates and stale measurements cannot cross scene revisions" {
    var source = try fixture(t.allocator);
    defer source.deinit();
    var foreign = try fixture(t.allocator);
    defer foreign.deinit();
    var adapter = try a.Adapter.init(t.allocator, .{ .max_nodes = 3 });
    defer adapter.deinit();
    var items = styles(source);
    items[1].id = foreign.nodes()[1].id;
    try t.expectError(error.ForeignStyle, adapter.run(source, &items, .{ .width = 400, .height = 200 }));
    items = styles(source);
    items[2].id = items[1].id;
    try t.expectError(error.DuplicateStyle, adapter.run(source, &items, .{ .width = 400, .height = 200 }));
    items = styles(source);
    items[1].style.measurement = .{ .scene_revision = source.revision() + 1, .size = .{ .width = 50, .height = 20 }, .constraint = .{ .bounded = 50 } };
    try t.expectError(error.MeasurementRevision, adapter.run(source, &items, .{ .width = 400, .height = 200 }));
    adapter.epoch = std.math.maxInt(u64);
    items = styles(source);
    try t.expectError(error.EpochExhausted, adapter.run(source, &items, .{ .width = 400, .height = 200 }));
}

test "layout scratch failure does not invalidate old geometry and adapter can retry" {
    var source = try fixture(t.allocator);
    defer source.deinit();
    var failing = t.FailingAllocator.init(t.allocator, .{});
    var adapter = try a.Adapter.init(failing.allocator(), .{ .max_nodes = 3 });
    defer adapter.deinit();
    const items = styles(source);
    var first = try adapter.run(source, &items, .{ .width = 400, .height = 200 });
    defer first.deinit();
    failing.fail_index = failing.alloc_index;
    try t.expectError(error.OutOfMemory, adapter.run(source, &items, .{ .width = 400, .height = 200 }));
    try t.expectApproxEqAbs(@as(f32, 220), (try first.get(items[2].id)).width, 0.001);
    failing.fail_index = std.math.maxInt(usize);
    var retry = try adapter.run(source, &items, .{ .width = 400, .height = 200 });
    defer retry.deinit();
    try t.expect(retry.ready());
    try t.expectEqual(first.epoch + 1, retry.epoch);
}
