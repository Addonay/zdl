const std = @import("std");
const ui = @import("ui.zig");
const q = @import("action_queue.zig");
const sem = @import("semantics.zig");
const t = std.testing;
fn activation() sem.Request {
    return .{ .target = .{ .domain = @fromBackingInt(1), .serial = 1 }, .revision = 1, .payload = .activate };
}
fn replacement(text: []const u8) sem.Request {
    return .{ .target = .{ .domain = @fromBackingInt(1), .serial = 1 }, .revision = 1, .payload = .{ .replace_text = .{ .revision = .{ .document = @fromBackingInt(1), .value = 0 }, .range = .{ .start_byte = 0, .end_byte = 0 }, .text = text } } };
}
test "action queue owns payloads and preserves distinct FIFO activations and final outcomes" {
    var queue = try q.Queue.init(t.allocator, .{});
    defer queue.deinit();
    var input = [_]u8{ 'o', 'l', 'd' };
    const first = try queue.enqueue(replacement(&input));
    @memset(&input, 'x');
    const second = try queue.enqueue(activation());
    const third = try queue.enqueue(activation());
    try t.expect(second.serial != third.serial);
    var a = (try queue.take()).?;
    defer a.deinit();
    try t.expectEqual(first.serial, a.ticket().serial);
    try t.expectEqualStrings("old", (try a.request()).payload.replace_text.text);
    try t.expectError(error.NotFinal, queue.forget(first));
    try a.complete(.handled);
    try t.expectError(error.AlreadyFinalized, a.complete(.handled));
    var b = (try queue.take()).?;
    defer b.deinit();
    var c = (try queue.take()).?;
    defer c.deinit();
    try t.expectEqual(second.serial, b.ticket().serial);
    try t.expectEqual(third.serial, c.ticket().serial);
    try t.expect(try queue.take() == null);
    try b.complete(.{ .rejected = error.DisabledSemantic });
    try c.complete(.handled);
    try t.expectEqual(error.DisabledSemantic, (try queue.status(second)).final.rejected);
    try t.expectEqual(@as(usize, 3), queue.usage().final);
}

test "action queue cancellation forget and payload lease budgets cannot be bypassed" {
    var queue = try q.Queue.init(t.allocator, .{ .max_entries = 1, .max_payload_bytes = 3, .max_single_payload_bytes = 3 });
    defer queue.deinit();
    try t.expectError(error.PayloadLimit, queue.enqueue(replacement("long")));
    const ticket = try queue.enqueue(replacement("abc"));
    var delivery = (try queue.take()).?;
    defer delivery.deinit();
    try queue.cancel(ticket);
    try queue.forget(ticket);
    try t.expectError(error.UnknownTicket, queue.status(ticket));
    try t.expectError(error.QueueFull, queue.enqueue(activation()));
    try t.expectEqualStrings("abc", (try delivery.request()).payload.replace_text.text);
    try t.expectEqual(@as(usize, 3), queue.usage().payload_bytes);
    try t.expectError(error.AlreadyFinalized, delivery.complete(.handled));
    delivery.deinit();
    try t.expectEqual(@as(usize, 0), queue.usage().payload_bytes);
    const next = try queue.enqueue(activation());
    try t.expect(next.serial > ticket.serial);
    try queue.cancel(next);
    try queue.forget(next);
}

test "action queue pending cancellation abandonment and owner destruction leave one outcome" {
    var queue = try q.Queue.init(t.allocator, .{});
    const cancelled = try queue.enqueue(activation());
    const abandoned = try queue.enqueue(activation());
    try queue.cancel(cancelled);
    var delivery = (try queue.take()).?;
    try t.expectEqual(abandoned.serial, delivery.ticket().serial);
    delivery.deinit();
    try t.expectEqual(q.CancelReason.abandoned, (try queue.status(abandoned)).final.cancelled);
    const late = try queue.enqueue(replacement("retained"));
    var retained = (try queue.take()).?;
    defer retained.deinit();
    queue.close();
    queue.close();
    try t.expectEqual(q.CancelReason.queue_closed, (try queue.status(late)).final.cancelled);
    try t.expectError(error.QueueClosed, queue.enqueue(activation()));
    queue.deinit();
    try t.expectEqual(q.CancelReason.queue_closed, (try retained.status()).final.cancelled);
    try t.expectEqualStrings("retained", (try retained.request()).payload.replace_text.text);
    try t.expectError(error.AlreadyFinalized, retained.complete(.handled));
    retained.deinit();
    try t.expectError(error.DeliveryFinished, retained.request());
}
fn allocation_scenario(allocator: std.mem.Allocator) !void {
    var queue = try q.Queue.init(allocator, .{});
    defer queue.deinit();
    const ticket = try queue.enqueue(replacement("owned text"));
    var delivery = (try queue.take()).?;
    defer delivery.deinit();
    try t.expectEqualStrings("owned text", (try delivery.request()).payload.replace_text.text);
    try delivery.complete(.handled);
    try queue.forget(ticket);
}
test "action queue every allocation failure unwinds unaccepted payloads and receipts" {
    try allocation_scenario(t.allocator);
    try t.checkAllAllocationFailures(t.allocator, allocation_scenario, .{});
}

test "action queue dispatch validates against live semantic state before completing receipt" {
    const Model = ui.with_semantics(.{});
    var owner = try Model.Scene.init(t.allocator, .{});
    defer owner.deinit();
    var update = try owner.begin_update();
    defer update.abort();
    const root = try update.semantic_node(null, .{ .integer = 0 }, .{ .role = .group }, null);
    const button = try update.semantic_node(root, .{ .integer = 1 }, .{ .role = .button, .name = "Save", .actions = .{ .activate = true } }, null);
    var source = try update.commit();
    defer source.deinit();
    const view = try source.semantic(try source.semantic_id_for(button));
    var queue = try q.Queue.init(t.allocator, .{});
    defer queue.deinit();
    const ticket = try queue.enqueue(.{ .target = view.id, .revision = view.revision, .payload = .activate, .source = .assistive });
    update = try owner.begin_update();
    var empty = try update.commit();
    empty.deinit();
    var delivery = (try queue.take()).?;
    defer delivery.deinit();
    _ = owner.validate_semantic_action(try delivery.request()) catch |err| {
        try t.expectEqual(error.StaleSemantic, err);
        try delivery.complete(.{ .rejected = err });
    };
    try t.expectEqual(error.StaleSemantic, (try queue.status(ticket)).final.rejected);
}

test "action queue cancellation unlinks arbitrary pending entries without changing FIFO" {
    var queue = try q.Queue.init(t.allocator, .{});
    defer queue.deinit();
    const first = try queue.enqueue(activation());
    const middle = try queue.enqueue(activation());
    const last = try queue.enqueue(activation());
    try queue.cancel(middle);
    var one = (try queue.take()).?;
    defer one.deinit();
    var three = (try queue.take()).?;
    defer three.deinit();
    try t.expectEqual(first.serial, one.ticket().serial);
    try t.expectEqual(last.serial, three.ticket().serial);
    try t.expect(try queue.take() == null);
    try t.expectError(error.AlreadyFinalized, queue.cancel(middle));
    try one.complete(.handled);
    try three.complete(.handled);
    var other = try q.Queue.init(t.allocator, .{});
    defer other.deinit();
    try t.expectError(error.ForeignTicket, other.status(first));
}

test "action queue receipt backpressure reuse never reissues a forgotten ticket" {
    var queue = try q.Queue.init(t.allocator, .{ .max_entries = 1 });
    defer queue.deinit();
    var previous: ?q.Ticket = null;
    for (0..10000) |_| {
        const ticket = try queue.enqueue(activation());
        if (previous) |old| {
            try t.expect(ticket.serial > old.serial);
            try t.expectError(error.UnknownTicket, queue.status(old));
        }
        var delivery = (try queue.take()).?;
        try delivery.complete(.handled);
        delivery.deinit();
        try t.expectError(error.QueueFull, queue.enqueue(activation())); // explicit retained receipt
        try queue.forget(ticket);
        previous = ticket;
        try t.expectEqual(@as(usize, 0), queue.usage().entries);
    }
}

fn preserve_prior(allocator: std.mem.Allocator) !void {
    var queue = try q.Queue.init(allocator, .{});
    defer queue.deinit();
    const first = try queue.enqueue(activation());
    _ = queue.enqueue(replacement("a second owned payload")) catch |err| {
        try t.expect((try queue.status(first)) == .pending);
        try t.expectEqual(@as(usize, 1), queue.usage().entries);
        try t.expectEqual(@as(usize, 0), queue.usage().payload_bytes);
        var live = (try queue.take()).?;
        defer live.deinit();
        try live.complete(.handled);
        return err;
    };
}
test "action queue failed enqueue preserves prior accepted work and payload accounting" {
    try preserve_prior(t.allocator);
    try t.checkAllAllocationFailures(t.allocator, preserve_prior, .{});
}

test "action queue close finalizes mixed pending inflight and completed receipts once" {
    var queue = try q.Queue.init(t.allocator, .{});
    defer queue.deinit();
    var tickets: [6]q.Ticket = undefined;
    for (&tickets) |*ticket| ticket.* = try queue.enqueue(activation());
    var first = (try queue.take()).?;
    defer first.deinit();
    var second = (try queue.take()).?;
    defer second.deinit();
    try first.complete(.handled);
    queue.close();
    try t.expectEqual(@as(usize, 0), queue.usage().pending);
    try t.expectEqual(@as(usize, 0), queue.usage().in_flight);
    try t.expectEqual(@as(usize, 6), queue.usage().final);
    try t.expect((try queue.status(tickets[0])).final == .handled);
    for (tickets[1..]) |ticket| {
        try t.expectEqual(q.CancelReason.queue_closed, (try queue.status(ticket)).final.cancelled);
        try t.expectError(error.AlreadyFinalized, queue.cancel(ticket));
    }
    try t.expectError(error.AlreadyFinalized, second.complete(.handled));
}
