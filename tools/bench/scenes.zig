//! Retained model publication benchmark, not rendering or input-to-photon cost.
const std = @import("std");
const ui = @import("zdl").ui;
fn measure(allocator: std.mem.Allocator, io: std.Io, count: usize) !struct { describe: u64, commit: u64, bytes: usize } {
    var scene = try ui.Scene.init(allocator, .{});
    defer scene.deinit();
    var update = try scene.begin_update();
    defer update.abort();
    for (0..count) |key| {
        const draft = try update.node(.{ .integer = key }, .control, .{ .focusable = true });
        if (key == 0) try update.request_focus(draft);
    }
    var original = try update.commit();
    defer original.deinit();
    const focused = original.focus().?;
    const start = std.Io.Clock.awake.now(io).nanoseconds;
    update = try scene.begin_update();
    for (0..count) |key| _ = try update.node(.{ .integer = count - 1 - key }, .control, .{ .focusable = true });
    const described = std.Io.Clock.awake.now(io).nanoseconds;
    var snapshot = try update.commit();
    defer snapshot.deinit();
    const published = std.Io.Clock.awake.now(io).nanoseconds;
    if (!snapshot.focus().?.eql(focused)) return error.FocusChanged;
    var sum: u64 = 0;
    for (snapshot.nodes(), 0..) |node, i| {
        if (node.key.integer != count - 1 - i or (try original.resolve(node.id)).key.integer != node.key.integer) return error.IdentityMismatch;
        sum += node.key.integer;
    }
    if (sum != count * (count - 1) / 2) return error.ChecksumMismatch;
    std.mem.doNotOptimizeAway(sum);
    return .{ .describe = @intCast(described - start), .commit = @intCast(published - described), .bytes = snapshot.arena_capacity_bytes() };
}
pub fn main(init: std.process.Init) !void {
    _ = try measure(init.gpa, init.io, 32);
    inline for (.{ 1000, 10000, 100000 }) |count| {
        var descriptions: [3]u64 = undefined;
        var publications: [3]u64 = undefined;
        var bytes: usize = 0;
        for (0..3) |trial| {
            const result = try measure(init.gpa, init.io, count);
            descriptions[trial] = result.describe;
            publications[trial] = result.commit;
            bytes = result.bytes;
        }
        std.mem.sort(u64, &descriptions, {}, std.sort.asc(u64));
        std.mem.sort(u64, &publications, {}, std.sort.asc(u64));
        std.debug.print("nodes={d} describe_ns={any} publish_ns={any} snapshot_arena_bytes={d}\n", .{ count, descriptions, publications, bytes });
    }
}
