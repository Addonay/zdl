const std = @import("std");
const ui = @import("ui.zig");
const d = @import("../text/document.zig");
const reg = @import("../text/registry.zig");
const t = std.testing;
const Model = ui.with_semantics(.{});
fn publish(owner: *Model.Scene, document: d.Snapshot, handle: reg.Handle) !Model.Snapshot {
    var update = try owner.begin_update();
    defer update.abort();
    const node = try update.node(.{ .integer = 1 }, .editor, .{});
    _ = try update.semantic_node(null, .{ .integer = 1 }, .{
        .role = .editor,
        .name = "Text",
        .actions = .{ .replace_text = true, .set_selection = true },
        .document = .{ .snapshot = document, .registration = handle },
    }, node);
    return update.commit();
}
fn request(snapshot: Model.Snapshot, payload: ui.semantics.Payload) ui.semantics.Request {
    const view = snapshot.semantic_at(0).?;
    return .{ .target = view.id, .revision = view.revision, .payload = payload, .source = .assistive };
}

test "document action dispatch applies once and owns result across failed scene refresh" {
    var document = try d.Document.init(t.allocator, "abc", .{});
    defer document.deinit();
    var documents = try reg.Registry.init(t.allocator, .{});
    defer documents.deinit();
    var registration = try documents.register(&document);
    defer registration.deinit();
    var initial = try document.snapshot();
    defer initial.deinit();
    var owner = try Model.Scene.init(t.allocator, .{});
    defer owner.deinit();
    var scene = try publish(&owner, initial, registration.handle());
    defer scene.deinit();
    var queue = try ui.action_queue.Queue.init(t.allocator, .{});
    defer queue.deinit();
    const action = request(scene, .{ .replace_text = .{ .revision = initial.revision(), .range = .{ .start_byte = 1, .end_byte = 2 }, .text = "XYZ" } });
    const ticket = try queue.enqueue(action);
    const stale = try queue.enqueue(action);
    var delivery = (try queue.take()).?;
    defer delivery.deinit();
    var result = try ui.document_actions.dispatch(&owner, &documents, &delivery, .{});
    defer result.deinit();
    try t.expectEqualStrings("aXYZc", result.snapshot().text());
    try t.expect((try queue.status(ticket)).final == .handled);
    try t.expectError(error.AlreadyFinalized, ui.document_actions.dispatch(&owner, &documents, &delivery, .{}));
    // An aborted UI refresh must not undo or repeat the accepted model edit.
    var update = try owner.begin_update();
    update.abort();
    var late = (try queue.take()).?;
    defer late.deinit();
    try t.expectError(error.StaleRevision, ui.document_actions.dispatch(&owner, &documents, &late, .{}));
    try t.expectEqual(error.StaleRevision, (try queue.status(stale)).final.rejected);
    owner.close();
    queue.close();
    try t.expectEqualStrings("aXYZc", result.snapshot().text());
}

test "document action dispatch selection cancellation and closed registration" {
    var document = try d.Document.init(t.allocator, "abc", .{});
    defer document.deinit();
    var documents = try reg.Registry.init(t.allocator, .{});
    defer documents.deinit();
    var registration = try documents.register(&document);
    defer registration.deinit();
    var initial = try document.snapshot();
    defer initial.deinit();
    var owner = try Model.Scene.init(t.allocator, .{});
    defer owner.deinit();
    var scene = try publish(&owner, initial, registration.handle());
    defer scene.deinit();
    var queue = try ui.action_queue.Queue.init(t.allocator, .{});
    defer queue.deinit();
    const action = request(scene, .{ .set_selection = .{ .revision = initial.revision(), .selection = .{ .anchor_byte = 1, .active_byte = 3 } } });
    const cancelled = try queue.enqueue(action);
    var no_effect = (try queue.take()).?;
    defer no_effect.deinit();
    try queue.cancel(cancelled);
    try t.expectError(error.AlreadyFinalized, ui.document_actions.dispatch(&owner, &documents, &no_effect, .{}));
    try t.expectEqual(initial.revision(), try document.current_revision());
    const selected = try queue.enqueue(action);
    var selection = (try queue.take()).?;
    defer selection.deinit();
    var result = try ui.document_actions.dispatch(&owner, &documents, &selection, .{});
    defer result.deinit();
    try t.expectEqual(@as(usize, 3), result.snapshot().selection().active_byte);
    try t.expect((try queue.status(selected)).final == .handled);
    registration.close();
    const closed = try queue.enqueue(action);
    var late = (try queue.take()).?;
    defer late.deinit();
    try t.expectError(error.StaleRegistration, ui.document_actions.dispatch(&owner, &documents, &late, .{}));
    try t.expectEqual(error.StaleRegistration, (try queue.status(closed)).final.rejected);
}

fn allocation_scenario(allocator: std.mem.Allocator) !void {
    var document = try d.Document.init(allocator, "abc", .{});
    defer document.deinit();
    var documents = try reg.Registry.init(allocator, .{});
    defer documents.deinit();
    var registration = try documents.register(&document);
    defer registration.deinit();
    var initial = try document.snapshot();
    defer initial.deinit();
    var owner = try Model.Scene.init(allocator, .{});
    defer owner.deinit();
    var scene = try publish(&owner, initial, registration.handle());
    defer scene.deinit();
    var queue = try ui.action_queue.Queue.init(allocator, .{});
    defer queue.deinit();
    const ticket = try queue.enqueue(request(scene, .{ .replace_text = .{ .revision = initial.revision(), .range = .{ .start_byte = 0, .end_byte = 3 }, .text = "changed" } }));
    var delivery = (try queue.take()).?;
    defer delivery.deinit();
    var result = ui.document_actions.dispatch(&owner, &documents, &delivery, .{}) catch |err| {
        try t.expectEqual(error.OutOfMemory, err);
        try t.expectEqual(error.OutOfMemory, (try queue.status(ticket)).final.rejected);
        try t.expectEqual(initial.revision(), try document.current_revision());
        var unchanged = try document.snapshot();
        defer unchanged.deinit();
        try t.expectEqualStrings("abc", unchanged.text());
        return err;
    };
    defer result.deinit();
    try t.expectEqualStrings("changed", result.snapshot().text());
}
test "document action dispatch allocation failures reject once without changing document" {
    try t.checkAllAllocationFailures(t.allocator, allocation_scenario, .{});
}

test "document action dispatch rejects semantic failure and non-document activation" {
    var document = try d.Document.init(t.allocator, "abc", .{});
    defer document.deinit();
    var documents = try reg.Registry.init(t.allocator, .{});
    defer documents.deinit();
    var registration = try documents.register(&document);
    defer registration.deinit();
    var initial = try document.snapshot();
    defer initial.deinit();
    var owner = try Model.Scene.init(t.allocator, .{});
    defer owner.deinit();
    var update = try owner.begin_update();
    defer update.abort();
    _ = try update.semantic_node(null, .{ .integer = 1 }, .{ .role = .button, .name = "Button", .actions = .{ .activate = true } }, null);
    var scene = try update.commit();
    defer scene.deinit();
    var queue = try ui.action_queue.Queue.init(t.allocator, .{});
    defer queue.deinit();
    const unsupported = try queue.enqueue(request(scene, .activate));
    var first = (try queue.take()).?;
    defer first.deinit();
    try t.expectError(error.NotDocumentAction, ui.document_actions.dispatch(&owner, &documents, &first, .{}));
    try t.expectEqual(error.NotDocumentAction, (try queue.status(unsupported)).final.rejected);
    const closed = try queue.enqueue(request(scene, .activate));
    var second = (try queue.take()).?;
    defer second.deinit();
    owner.close();
    try t.expectError(error.Closed, ui.document_actions.dispatch(&owner, &documents, &second, .{}));
    try t.expectEqual(error.Closed, (try queue.status(closed)).final.rejected);
    try t.expectEqual(initial.revision(), try document.current_revision());
}
