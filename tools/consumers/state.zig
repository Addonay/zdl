//! Runtime-input typed retained state; no GUI/text providers or libc.
const std = @import("std");
const ui = @import("zdl").ui;
const Model = ui.with_states(.{ .count = ui.state.Value(u64), .scroll = ui.state.Value(struct { y: i64 }) });
pub fn main(init: std.process.Init) !void {
    std.debug.print("mode={s}\n", .{@tagName(@import("builtin").mode)});
    var args = std.process.Args.Iterator.init(init.minimal.args);
    defer args.deinit();
    _ = args.next();
    const count = if (args.next()) |v| try std.fmt.parseInt(u32, v, 10) else 97;
    if (count == 0 or count > 100_000) return error.InvalidCount;
    var scene = try Model.Scene.init(init.gpa, .{ .max_state_entries = 200_000 });
    defer scene.deinit();
    var update = try scene.begin_update();
    defer update.abort();
    for (0..count) |key| {
        const draft = try update.node(.{ .integer = key }, .control, .{});
        const value: u64 = key * 17;
        try update.set_state("count", draft, &value);
        if (key % 2 == 0) try update.set_state("scroll", draft, &.{ .y = @intCast(key) });
    }
    var first = try update.commit();
    defer first.deinit();
    update = try scene.begin_update();
    for (0..count) |key| {
        const draft = try update.node(.{ .integer = count - 1 - key }, .control, .{});
        if (key == 0) try update.clear_state("scroll", draft);
    }
    var second = try update.commit();
    defer second.deinit();
    var checksum: u64 = 0;
    for (second.nodes()) |node| {
        const value = (try second.state("count", node.id)).?;
        if (value.* != node.key.integer * 17 or value != (try first.state("count", node.id)).?) return error.StateChanged;
        checksum += value.*;
    }
    if (checksum != @as(u64, count) * (count - 1) / 2 * 17) return error.ChecksumMismatch;
    scene.close();
    std.debug.print("state nodes={d} entries={d} logical_bytes={d} checksum={d}\n", .{ count, second.state_usage().entries, second.state_usage().logical_bytes, checksum });
}
