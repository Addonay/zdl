//! Owned payload + terminal-receipt queue baseline, not reducer/native latency.
const std = @import("std");
const q = @import("zdl").ui.action_queue;
fn measure(allocator: std.mem.Allocator, io: std.Io, count: usize) !struct { enqueue: u64, dispatch: u64 } {
    var queue = try q.Queue.init(allocator, .{ .max_entries = count });
    defer queue.deinit();
    const tickets = try allocator.alloc(q.Ticket, count);
    defer allocator.free(tickets);
    const request = @import("zdl").ui.semantics.Request{
        .target = .{ .domain = @fromBackingInt(1), .serial = 1 },
        .revision = 1,
        .payload = .{ .replace_text = .{ .revision = .{ .document = @fromBackingInt(1), .value = 0 }, .range = .{ .start_byte = 0, .end_byte = 0 }, .text = "0123456789abcdef0123456789abcdef" } },
    };
    const begin = std.Io.Clock.awake.now(io).nanoseconds;
    for (tickets) |*ticket| ticket.* = try queue.enqueue(request);
    const queued = std.Io.Clock.awake.now(io).nanoseconds;
    for (tickets) |ticket| {
        var delivery = (try queue.take()) orelse return error.MissingDelivery;
        if (delivery.ticket().serial != ticket.serial or (try delivery.request()).payload.replace_text.text.len != 32) return error.OrderMismatch;
        try delivery.complete(.handled);
        try queue.forget(ticket);
        delivery.deinit();
    }
    const end = std.Io.Clock.awake.now(io).nanoseconds;
    if (queue.usage().entries != 0 or queue.usage().payload_bytes != 0 or queue.usage().receipts != 0) return error.Unreleased;
    return .{ .enqueue = @intCast(queued - begin), .dispatch = @intCast(end - queued) };
}
pub fn main(init: std.process.Init) !void {
    _ = try measure(init.gpa, init.io, 32);
    inline for (.{ 1000, 10000, 32000 }) |count| {
        var input: [3]u64 = undefined;
        var output: [3]u64 = undefined;
        for (0..3) |trial| {
            const value = try measure(init.gpa, init.io, count);
            input[trial] = value.enqueue;
            output[trial] = value.dispatch;
        }
        std.mem.sort(u64, &input, {}, std.sort.asc(u64));
        std.mem.sort(u64, &output, {}, std.sort.asc(u64));
        std.debug.print("requests={d} payload_bytes_each=32 enqueue_ns={any} take_complete_forget_release_ns={any}\n", .{ count, input, output });
    }
}
