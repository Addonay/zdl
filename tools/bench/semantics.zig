//! Logical semantic collection baseline. No native bridge/AT-SPI/paint cost.
const std = @import("std");
const ui = @import("zdl").ui;
const Model = ui.with_semantics(.{});
fn measure(allocator: std.mem.Allocator, io: std.Io, count: u32) !struct { describe: u64, publish: u64, arena: usize } {
    var owner = try Model.Scene.init(allocator, .{});
    defer owner.deinit();
    var update = try owner.begin_update();
    defer update.abort();
    const started = std.Io.Clock.awake.now(io).nanoseconds;
    const materialized = try update.node(.{ .integer = 7 }, .control, .{ .focusable = true });
    const root = try update.semantic_node(null, .{ .integer = 0 }, .{ .role = .collection, .name = "Results", .collection_count = count }, null);
    for (0..count) |i| {
        var buffer: [32]u8 = undefined;
        const name = try std.fmt.bufPrint(&buffer, "Item {d}", .{i});
        _ = try update.semantic_node(root, .{ .integer = i }, .{ .role = .item, .name = name, .position = i, .actions = .{ .focus = true, .reveal = true } }, if (i == 7) materialized else null);
    }
    const described = std.Io.Clock.awake.now(io).nanoseconds;
    var snapshot = try update.commit();
    defer snapshot.deinit();
    const published = std.Io.Clock.awake.now(io).nanoseconds;
    if (snapshot.nodes().len != 1 or snapshot.semantic_at(count) == null or snapshot.semantic_at(count + 1) != null) return error.MissingLogicalItems;
    var checksum: u64 = 0;
    for (0..count) |i| {
        const view = snapshot.semantic_at(i + 1).?;
        if (view.position != i) return error.WrongPosition;
        const request: ui.semantics.Request = .{ .target = view.id, .revision = view.revision, .payload = .focus };
        const action = try owner.validate_semantic_action(request);
        if (action.model_key.integer != i or action.needs_materialization != (i != 7)) return error.WrongAction;
        checksum += action.model_key.integer;
    }
    if (checksum != @as(u64, count) * (count - 1) / 2) return error.ChecksumMismatch;
    std.mem.doNotOptimizeAway(checksum);
    return .{ .describe = @intCast(described - started), .publish = @intCast(published - described), .arena = snapshot.arena_capacity_bytes() };
}
pub fn main(init: std.process.Init) !void {
    _ = try measure(init.gpa, init.io, 32);
    inline for (.{ 1000, 10000, 100000 }) |count| {
        var descriptions: [3]u64 = undefined;
        var publications: [3]u64 = undefined;
        var arena: usize = 0;
        for (0..3) |trial| {
            const value = try measure(init.gpa, init.io, count);
            descriptions[trial] = value.describe;
            publications[trial] = value.publish;
            arena = value.arena;
        }
        std.mem.sort(u64, &descriptions, {}, std.sort.asc(u64));
        std.mem.sort(u64, &publications, {}, std.sort.asc(u64));
        std.debug.print("logical_items={d} materialized=1 describe_ns={any} publish_ns={any} snapshot_arena_bytes={d}\n", .{ count, descriptions, publications, arena });
    }
}
