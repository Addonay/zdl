//! FIFO drain benchmark, including an ordered-array reference and order checks.
//! Timing excludes enqueue/allocation/teardown. It does not measure UI latency.
const std = @import("std");
const events = @import("zdl").events;
const Event = events.event.Event;
const Queue = events.queue.Queue(void);

const Ordered = struct {
    allocator: std.mem.Allocator,
    pending: std.ArrayList(Event) = .empty,
    fn init(allocator: std.mem.Allocator) Ordered {
        return .{ .allocator = allocator };
    }
    fn deinit(self: *Ordered) void {
        self.pending.deinit(self.allocator);
    }
    fn push(self: *Ordered, value: Event) !void {
        try self.pending.append(self.allocator, value);
    }
    fn take(self: *Ordered) Event {
        return self.pending.orderedRemove(0);
    }
};

fn measure(comptime reference: bool, io: std.Io, count: usize) !u64 {
    var queue = if (reference) Ordered.init(std.heap.page_allocator) else Queue.init(std.heap.page_allocator, .{});
    defer queue.deinit();
    for (0..count) |index| {
        const value: Event = .{ .user = .{ .code = events.event.user_code_first, .value = @intCast(index) } };
        if (reference) try queue.push(value) else if (!try queue.push(value)) return error.RejectedEvent;
    }
    const start = std.Io.Clock.awake.now(io).nanoseconds;
    var checksum: u64 = 0;
    for (0..count) |index| {
        var out: [1]Event = undefined;
        const value = if (reference) queue.take() else blk: {
            if (queue.get(&out, 0, std.math.maxInt(u32)) != 1) return error.MissingEvent;
            break :blk out[0];
        };
        if (value.user.value != index) return error.OrderMismatch;
        checksum += @intCast(value.user.value);
    }
    const elapsed = std.Io.Clock.awake.now(io).nanoseconds - start;
    if (checksum != count * (count - 1) / 2) return error.ChecksumMismatch;
    std.mem.doNotOptimizeAway(checksum);
    return @intCast(elapsed);
}

pub fn main(init: std.process.Init) !void {
    _ = try measure(false, init.io, 32);
    _ = try measure(true, init.io, 32);
    inline for (.{ 1000, 8000, 32000 }) |count| {
        var native: [3]u64 = undefined;
        var ordered: [3]u64 = undefined;
        for (0..3) |iteration| {
            // Alternate order to reduce systematic warmup/order bias.
            if (iteration % 2 == 0) {
                ordered[iteration] = try measure(true, init.io, count);
                native[iteration] = try measure(false, init.io, count);
            } else {
                native[iteration] = try measure(false, init.io, count);
                ordered[iteration] = try measure(true, init.io, count);
            }
        }
        std.mem.sort(u64, &native, {}, std.sort.asc(u64));
        std.mem.sort(u64, &ordered, {}, std.sort.asc(u64));
        std.debug.print("count={d} native_ns={any} ordered_ns={any} median_ratio={d:.2}\n", .{ count, native, ordered, @as(f64, @floatFromInt(ordered[1])) / @as(f64, @floatFromInt(native[1])) });
    }
}
