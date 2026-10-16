const std = @import("std");
const zdl = @import("zdl");
const ingress = @import("ingress.zig");
const t = std.testing;
fn request(text: []const u8) zdl.ui.semantics.Request {
    return .{ .target = .{ .domain = @fromBackingInt(1), .serial = 1 }, .revision = 1, .payload = .{ .replace_text = .{
        .revision = .{ .document = @fromBackingInt(1), .value = 0 },
        .range = .{ .start_byte = 0, .end_byte = 0 },
        .text = text,
    } } };
}
test "native ingress copies movable payloads rejects pressure and closes explicitly" {
    var inbox = ingress.Inbox(2, 8).init(t.io);
    var bytes: [3]u8 = .{ 'o', 'l', 'd' };
    try t.expectEqual(@as(u64, 1), try inbox.submit(request(&bytes)));
    @memset(&bytes, 'x');
    _ = try inbox.submit(request("second"));
    try t.expectError(error.Full, inbox.submit(request("full")));
    try t.expectError(error.TextLimit, inbox.submit(request("too long!")));
    try t.expectError(error.InvalidUtf8, inbox.submit(request("\xff")));
    var item = inbox.take().?;
    try t.expectEqualStrings("old", item.request().payload.replace_text.text);
    _ = try inbox.submit(request("reuse"));
    var moved = item;
    @memset(&item.text, 'z');
    try t.expectEqualStrings("old", moved.request().payload.replace_text.text);
    inbox.close();
    inbox.close();
    try t.expect(inbox.take() == null);
    try t.expectError(error.Closed, inbox.submit(request("late")));
    const counts = inbox.usage();
    try t.expectEqual(@as(usize, 3), counts.staged);
    try t.expectEqual(@as(usize, 2), counts.discarded_on_close);
    try t.expectEqual(@as(usize, 1), counts.full);
    try t.expectEqual(@as(usize, 1), counts.text_limit);
    try t.expectEqual(@as(usize, 1), counts.invalid_utf8);
    try t.expectEqual(@as(usize, 1), counts.closed);
    try moved.reject(error.Closed);
    try t.expectError(error.AlreadyResolved, moved.reject(error.Closed));
}

test "native ingress preserves owner item on queue pressure and admits once" {
    var inbox = ingress.Inbox(1, 8).init(t.io);
    _ = try inbox.submit(request("payload"));
    var item = inbox.take().?;
    var queue = try zdl.ui.action_queue.Queue.init(t.allocator, .{ .max_entries = 1 });
    defer queue.deinit();
    const old = try queue.enqueue(request("old"));
    try t.expectError(error.QueueFull, item.admit(&queue));
    try t.expect(item.outcome == .pending);
    try queue.cancel(old);
    try queue.forget(old);
    const ticket = try item.admit(&queue);
    try t.expectError(error.AlreadyResolved, item.admit(&queue));
    @memset(&item.text, 'x');
    var delivery = (try queue.take()).?;
    defer delivery.deinit();
    try t.expectEqualStrings("payload", (try delivery.request()).payload.replace_text.text);
    try delivery.complete(.handled);
    try t.expect((try queue.status(ticket)).final == .handled);
}

const Concurrent = ingress.Inbox(16, 16);
fn producer(inbox: *Concurrent, id: usize, failed: *std.atomic.Value(bool)) void {
    for (0..500) |i| {
        var bytes: [6]u8 = .{ 's', 'o', 'u', 'r', 'c', 'e' };
        var input = request(&bytes);
        input.target.serial = id * 500 + i + 1;
        while (true) {
            _ = inbox.submit(input) catch |err| {
                if (err == error.Closed) return;
                if (err != error.Full) {
                    failed.store(true, .release);
                    return;
                }
                std.Thread.yield() catch {};
                continue;
            };
            break;
        }
        @memset(&bytes, 'x');
    }
}
test "native ingress concurrent producers and owner drain preserve each mapped request" {
    var inbox = Concurrent.init(t.io);
    var failed: std.atomic.Value(bool) = .init(false);
    var threads: [4]std.Thread = undefined;
    var started: usize = 0;
    defer {
        inbox.close();
        for (threads[0..started]) |thread| thread.join();
    }
    for (&threads, 0..) |*thread, i| {
        thread.* = try std.Thread.spawn(.{}, producer, .{ &inbox, i, &failed });
        started += 1;
    }
    var seen: [2000]bool = @splat(false);
    var consumed: usize = 0;
    const start = std.Io.Clock.awake.now(t.io).nanoseconds;
    while (consumed != seen.len) {
        if (failed.load(.acquire)) return error.ProducerFailed;
        if (std.Io.Clock.awake.now(t.io).nanoseconds - start > 15 * std.time.ns_per_s) return error.DrainTimeout;
        var item = inbox.take() orelse {
            std.Thread.yield() catch {};
            continue;
        };
        try t.expectEqual(@as(u64, consumed + 1), item.serial);
        const input = item.request();
        const index: usize = @intCast(input.target.serial - 1);
        try t.expect(index < seen.len and !seen[index]);
        seen[index] = true;
        try t.expectEqualStrings("source", input.payload.replace_text.text);
        try item.reject(error.TestOnly);
        consumed += 1;
    }
    for (seen) |found| try t.expect(found);
    try t.expectEqual(@as(usize, 2000), inbox.usage().taken);
}

test "native ingress mapped text reaches exact revision document execution" {
    var document = try zdl.text.Document.init(t.allocator, "before", .{});
    defer document.deinit();
    var documents = try zdl.text.Registry.init(t.allocator, .{});
    defer documents.deinit();
    var registration = try documents.register(&document);
    defer registration.deinit();
    var initial = try document.snapshot();
    defer initial.deinit();
    const Model = zdl.ui.with_semantics(.{});
    var owner = try Model.Scene.init(t.allocator, .{});
    defer owner.deinit();
    var update = try owner.begin_update();
    defer update.abort();
    _ = try update.semantic_node(null, .{ .integer = 1 }, .{ .role = .editor, .name = "Text", .actions = .{ .replace_text = true }, .document = .{ .snapshot = initial, .registration = registration.handle() } }, null);
    var scene = try update.commit();
    defer scene.deinit();
    const view = scene.semantic_at(0).?;
    var inbox = ingress.Inbox(2, 16).init(t.io);
    const input: zdl.ui.semantics.Request = .{ .target = view.id, .revision = view.revision, .payload = .{ .replace_text = .{ .revision = initial.revision(), .range = .{ .start_byte = 0, .end_byte = 6 }, .text = "after" } } };
    _ = try inbox.submit(input);
    _ = try inbox.submit(input);
    var queue = try zdl.ui.action_queue.Queue.init(t.allocator, .{});
    defer queue.deinit();
    var first = inbox.take().?;
    var second = inbox.take().?;
    const accepted = try first.admit(&queue);
    const stale = try second.admit(&queue);
    var delivery = (try queue.take()).?;
    defer delivery.deinit();
    var result = try zdl.ui.document_actions.dispatch(&owner, &documents, &delivery, .{});
    defer result.deinit();
    try t.expectEqualStrings("after", result.snapshot().text());
    var late = (try queue.take()).?;
    defer late.deinit();
    try t.expectError(error.StaleRevision, zdl.ui.document_actions.dispatch(&owner, &documents, &late, .{}));
    try t.expect((try queue.status(accepted)).final == .handled);
    try t.expectEqual(error.StaleRevision, (try queue.status(stale)).final.rejected);
}

const routing = @import("router.zig");
test "native ingress router retains identities captures revisions and rejects native ID reuse" {
    const Inbox = ingress.Inbox(8, 32);
    var inbox = Inbox.init(t.io);
    var router = routing.Router(Inbox, 2).init(t.io, &inbox);
    var entry: routing.Entry = .{ .native_id = 7, .target = .{ .domain = @fromBackingInt(1), .serial = 1 }, .revision = 1, .actions = .{ .activate = true, .focus = true } };
    try router.publish(&.{entry});
    _ = try router.route(7, .activate, "");
    entry.revision = 2;
    try router.publish(&.{entry}); // same control/native ID, updated property version
    _ = try router.route(7, .focus, "");
    var first = inbox.take().?;
    var second = inbox.take().?;
    try t.expectEqual(@as(u64, 1), first.request().revision);
    try t.expectEqual(@as(u64, 2), second.request().revision);
    try t.expectEqual(zdl.ui.semantics.Source.assistive, second.request().source);
    var changed = entry;
    changed.target.serial = 2;
    try t.expectError(error.NativeIdReuse, router.publish(&.{changed}));
    changed = entry;
    changed.actions.activate = false;
    try t.expectError(error.InvalidMapping, router.publish(&.{changed}));
    _ = try router.route(7, .activate, ""); // failed publication kept original mapping
    try router.publish(&.{});
    try t.expectError(error.UnknownNativeId, router.route(7, .activate, ""));
    try t.expectError(error.NativeIdReuse, router.publish(&.{entry}));
    entry.native_id = 8;
    try router.publish(&.{entry});
    router.close();
    try t.expectError(error.Closed, router.route(8, .activate, ""));
    try t.expectError(error.Closed, router.publish(&.{entry}));
}

test "native ingress router validates full replacement metadata and atomic mapping limits" {
    const Inbox = ingress.Inbox(8, 32);
    var inbox = Inbox.init(t.io);
    var router = routing.Router(Inbox, 2).init(t.io, &inbox);
    const entry: routing.Entry = .{ .native_id = 1, .target = .{ .domain = @fromBackingInt(1), .serial = 1 }, .revision = 1, .actions = .{ .replace_text = true }, .document = .{ .revision = .{ .document = @fromBackingInt(3), .value = 4 }, .byte_len = 12 } };
    try router.publish(&.{entry});
    try t.expectError(error.MappingLimit, router.publish(&.{ entry, entry, entry }));
    try t.expectError(error.InvalidMapping, router.publish(&.{ entry, entry }));
    try t.expectError(error.UnsupportedAction, router.route(1, .activate, ""));
    var bytes: [3]u8 = .{ 'n', 'e', 'w' };
    _ = try router.route(1, .replace_value, &bytes);
    @memset(&bytes, 'x');
    var item = inbox.take().?;
    const value = item.request().payload.replace_text;
    try t.expectEqualStrings("new", value.text);
    try t.expectEqual(@as(usize, 12), value.range.end_byte);
    try t.expectEqual(@as(u64, 4), value.revision.value);
    var changed = entry;
    changed.revision = 2;
    changed.document.?.revision.document = @fromBackingInt(4);
    try t.expectError(error.NativeIdReuse, router.publish(&.{changed}));
    changed.document.?.revision.document = @fromBackingInt(3);
    changed.document.?.revision.value = 3;
    try t.expectError(error.NativeIdReuse, router.publish(&.{changed}));
    changed.document.?.revision.value = 5;
    try router.publish(&.{changed});
    _ = try router.route(1, .replace_value, "next");
    item = inbox.take().?;
    try t.expectEqual(@as(u64, 5), item.request().payload.replace_text.revision.value);
}
