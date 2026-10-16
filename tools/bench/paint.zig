//! Solid-command recording baseline; no replay/raster/layout/presentation cost.
const std = @import("std");
const paint = @import("zdl").paint;
fn measure(allocator: std.mem.Allocator, io: std.Io, count: usize) !u64 {
    const start = std.Io.Clock.awake.now(io).nanoseconds;
    var recorder = try paint.Recorder.init(allocator, .{ .max_commands = count });
    defer recorder.deinit();
    for (0..count) |i| try recorder.fill_rect(.{ .x = @floatFromInt(i), .y = 0, .width = 1, .height = 1 }, .{ .r = 1, .g = 0, .b = 0 });
    var packet = try recorder.finish();
    defer packet.deinit();
    const commands = try packet.commands();
    std.mem.doNotOptimizeAway(commands);
    const end = std.Io.Clock.awake.now(io).nanoseconds;
    if (commands.len != count) return error.MissingCommand;
    var sum: usize = 0;
    for (commands) |command| sum += @as(usize, @intFromFloat(command.fill_rect.rect.x));
    if (sum != count * (count - 1) / 2) return error.WrongGeometry;
    return @intCast(end - start);
}
pub fn main(init: std.process.Init) !void {
    _ = try measure(init.gpa, init.io, 100);
    inline for (.{ 1000, 10000, 100000 }) |count| {
        var trials: [3]u64 = undefined;
        for (&trials) |*value| value.* = try measure(init.gpa, init.io, count);
        std.mem.sort(u64, &trials, {}, std.sort.asc(u64));
        std.debug.print("commands={d} init_record_finish_ns={any}\n", .{ count, trials });
    }
}
