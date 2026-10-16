//! Full adapter/declaration/projection cost. One changed style does not imply
//! sparse work: pinned zlay and this adapter still redeclare the complete tree.
const std = @import("std");
const ui = @import("zdl").ui;
const a = @import("layout/adapter.zig");
fn measure(allocator: std.mem.Allocator, io: std.Io, count: u32) !struct { first: u64, changed: u64, unchanged: u64 } {
    var owner = try ui.Scene.init(allocator, .{});
    defer owner.deinit();
    var update = try owner.begin_update();
    defer update.abort();
    _ = try update.begin_group(.{ .integer = 0 }, .{});
    for (0..count) |i| _ = try update.node(.{ .integer = i + 1 }, .control, .{});
    try update.end_group();
    var source = try update.commit();
    defer source.deinit();
    const items = try allocator.alloc(a.Item, source.nodes().len);
    defer allocator.free(items);
    const width: f32 = @floatFromInt(count * 12);
    items[0] = .{ .id = source.nodes()[0].id, .style = .{ .width = .{ .fixed = width }, .height = .{ .fixed = 100 }, .direction = .row, .gap = 2 } };
    for (items[1..], 0..) |*item, i| item.* = .{ .id = source.nodes()[i + 1].id, .style = .{ .width = .{ .fixed = 10 }, .height = .{ .fixed = 20 } } };
    var adapter = try a.Adapter.init(allocator, .{ .max_nodes = count + 1, .max_dimension = 2000000 });
    defer adapter.deinit();
    const viewport: a.Size = .{ .width = width, .height = 100 };
    const begin = std.Io.Clock.awake.now(io).nanoseconds;
    var first = try adapter.run(source, items, viewport);
    defer first.deinit();
    const initial = std.Io.Clock.awake.now(io).nanoseconds;
    const middle = count / 2;
    items[middle + 1].style.height = .{ .fixed = 40 };
    var changed = try adapter.run(source, items, viewport);
    defer changed.deinit();
    const mutated = std.Io.Clock.awake.now(io).nanoseconds;
    var repeated = try adapter.run(source, items, viewport);
    defer repeated.deinit();
    const end = std.Io.Clock.awake.now(io).nanoseconds;
    if (!first.ready() or !changed.ready() or !repeated.ready()) return error.Unresolved;
    for (items[1..], 0..) |item, i| {
        const one = try first.get(item.id);
        const two = try changed.get(item.id);
        const three = try repeated.get(item.id);
        if (@abs(one.x - @as(f32, @floatFromInt(i * 12))) > 0.01 or one.height != 20 or two.height != @as(f32, if (i == middle) 40 else 20) or !std.meta.eql(two, three)) return error.GeometryMismatch;
    }
    return .{ .first = @intCast(initial - begin), .changed = @intCast(mutated - initial), .unchanged = @intCast(end - mutated) };
}
pub fn main(init: std.process.Init) !void {
    _ = try measure(init.gpa, init.io, 32);
    inline for (.{ 1000, 10000 }) |count| {
        var first: [3]u64 = undefined;
        var changed: [3]u64 = undefined;
        var unchanged: [3]u64 = undefined;
        for (0..3) |trial| {
            const result = try measure(init.gpa, init.io, count);
            first[trial] = result.first;
            changed[trial] = result.changed;
            unchanged[trial] = result.unchanged;
        }
        std.mem.sort(u64, &first, {}, std.sort.asc(u64));
        std.mem.sort(u64, &changed, {}, std.sort.asc(u64));
        std.mem.sort(u64, &unchanged, {}, std.sort.asc(u64));
        std.debug.print("nodes={d} first_ns={any} changed_full_redeclaration_ns={any} unchanged_full_redeclaration_ns={any}\n", .{ count, first, changed, unchanged });
    }
}
