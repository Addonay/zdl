const std = @import("std");
const d = @import("document.zig");
const r = @import("registry.zig");
const t = std.testing;

test "document registration delayed actions reject stale view generations and revisions" {
    var doc = try d.Document.init(t.allocator, "abc", .{});
    defer doc.deinit();
    var registry = try r.Registry.init(t.allocator, .{});
    defer registry.deinit();
    var view = try registry.register(&doc);
    defer view.close();
    var snapshot = try registry.snapshot(view.handle());
    defer snapshot.deinit();
    const target: r.Target = .{ .registration = view.handle(), .revision = snapshot.revision() };
    var edit = try registry.replace(target, .{ .start_byte = 3, .end_byte = 3 }, "d", .{});
    defer edit.deinit();
    try t.expectError(error.StaleRevision, registry.replace(target, .{ .start_byte = 0, .end_byte = 0 }, "duplicate", .{}));
    view.close();
    var new_view = try registry.register(&doc);
    defer new_view.close();
    try t.expectEqual(target.registration.slot, new_view.handle().slot);
    try t.expect(target.registration.generation != new_view.handle().generation);
    try t.expectError(error.StaleRegistration, registry.replace(target, .{ .start_byte = 0, .end_byte = 0 }, "wrong view", .{}));
    try t.expectEqualStrings("abc", snapshot.text());
    try t.expectEqualStrings("abcd", edit.snapshot.text());
}

test "document registration independent views and early unregister do not close replacements" {
    var doc = try d.Document.init(t.allocator, "abc", .{});
    defer doc.deinit();
    var registry = try r.Registry.init(t.allocator, .{});
    defer registry.deinit();
    var one = try registry.register(&doc);
    defer one.close();
    var two = try registry.register(&doc);
    defer two.close();
    const old = one.handle();
    try registry.unregister(old);
    var replacement = try registry.register(&doc);
    defer replacement.close();
    one.close(); // Must not close the new generation in the same slot.
    var live = try registry.snapshot(replacement.handle());
    defer live.deinit();
    var other = try registry.snapshot(two.handle());
    defer other.deinit();
    try t.expectEqualStrings("abc", live.text());
    try t.expectEqual(live.revision().document, other.revision().document);
    var foreign = try r.Registry.init(t.allocator, .{});
    defer foreign.deinit();
    try t.expectError(error.ForeignRegistry, foreign.snapshot(replacement.handle()));
    registry.close();
    registry.close();
    try t.expectError(error.RegistryClosed, registry.snapshot(two.handle()));
    var still_app_owned = try doc.snapshot();
    defer still_app_owned.deinit();
    try t.expectEqualStrings("abc", still_app_owned.text());
}

test "document registration cleanup outlives registry owner and unregister precedes document destruction" {
    var doc = try d.Document.init(t.allocator, "retained", .{});
    var registry = try r.Registry.init(t.allocator, .{});
    var view = try registry.register(&doc);
    defer view.close();
    var snapshot = try registry.snapshot(view.handle());
    defer snapshot.deinit();
    registry.deinit(); // Invalidates pointers before the application frees doc.
    doc.deinit();
    view.close();
    view.close();
    try t.expectEqualStrings("retained", snapshot.text());
}

fn allocation_scenario(allocator: std.mem.Allocator) !void {
    var doc = try d.Document.init(allocator, "abc", .{});
    defer doc.deinit();
    var registry = try r.Registry.init(allocator, .{});
    defer registry.deinit();
    var view = try registry.register(&doc);
    defer view.close();
    var snapshot = try registry.snapshot(view.handle());
    defer snapshot.deinit();
    var edit = registry.replace(.{ .registration = view.handle(), .revision = snapshot.revision() }, .{ .start_byte = 0, .end_byte = 3 }, "changed", .{}) catch |err| {
        var same = try registry.snapshot(view.handle());
        defer same.deinit();
        try t.expectEqualStrings("abc", same.text());
        try t.expectEqual(snapshot.revision().value, same.revision().value);
        return err;
    };
    defer edit.deinit();
    try t.expectEqualStrings("abc", snapshot.text());
    try t.expectEqualStrings("changed", edit.snapshot.text());
}
test "document registration allocation failures preserve live routing and document state" {
    try allocation_scenario(t.allocator);
    try t.checkAllAllocationFailures(t.allocator, allocation_scenario, .{});
}

test "document registration checks document closure replacement and read-only policy" {
    var doc = try d.Document.init(t.allocator, "abc", .{});
    var registry = try r.Registry.init(t.allocator, .{ .max_registrations = 1, .max_slots = 2 });
    defer registry.deinit();
    var view = try registry.register(&doc);
    defer view.close();
    try t.expectError(error.RegistrationLimit, registry.register(&doc));
    var snapshot = try registry.snapshot(view.handle());
    defer snapshot.deinit();
    try doc.set_read_only(true);
    try t.expectError(error.ReadOnly, registry.replace(.{ .registration = view.handle(), .revision = snapshot.revision() }, .{ .start_byte = 0, .end_byte = 0 }, "x", .{}));
    doc.close();
    try t.expectError(error.Closed, registry.snapshot(view.handle()));
    view.close(); // Ends the borrow before actual destruction/reuse.
    doc.deinit();
    doc = try d.Document.init(t.allocator, "new", .{});
    defer doc.deinit();
    try t.expectError(error.StaleRegistration, registry.snapshot(view.handle()));
    var next = try registry.register(&doc);
    defer next.close();
    try t.expectError(error.ForeignDocument, registry.replace(.{ .registration = next.handle(), .revision = snapshot.revision() }, .{ .start_byte = 0, .end_byte = 0 }, "x", .{}));
}

test "document registration checked batch selection undo and redo share live routing" {
    var doc = try d.Document.init(t.allocator, "abc", .{});
    defer doc.deinit();
    var registry = try r.Registry.init(t.allocator, .{});
    defer registry.deinit();
    var view = try registry.register(&doc);
    defer view.close();
    var edit = try registry.apply(.{ .registration = view.handle(), .revision = try doc.current_revision() }, &.{
        .{ .range = .{ .start_byte = 0, .end_byte = 1 }, .text = "A" },
        .{ .range = .{ .start_byte = 3, .end_byte = 3 }, .text = "!" },
    }, .{});
    defer edit.deinit();
    var selected = try registry.set_selection(.{ .registration = view.handle(), .revision = edit.snapshot.revision() }, .{ .anchor_byte = 4, .active_byte = 0 });
    defer selected.deinit();
    var undo = try registry.undo(.{ .registration = view.handle(), .revision = selected.revision() });
    defer undo.deinit();
    var redo = try registry.redo(.{ .registration = view.handle(), .revision = undo.revision() });
    defer redo.deinit();
    try t.expectEqualStrings("abc", undo.text());
    try t.expectEqualStrings("Abc!", redo.text());
    try t.expectError(error.StaleRevision, registry.undo(.{ .registration = view.handle(), .revision = undo.revision() }));
}

test "document registration reuse pressure never revives old handles" {
    var doc = try d.Document.init(t.allocator, "abc", .{});
    defer doc.deinit();
    var registry = try r.Registry.init(t.allocator, .{ .max_registrations = 1, .max_slots = 1 });
    defer registry.deinit();
    var old: ?r.Handle = null;
    for (0..10000) |_| {
        var view = try registry.register(&doc);
        if (old) |handle| {
            try t.expectError(error.StaleRegistration, registry.snapshot(handle));
            try t.expect(view.handle().generation > handle.generation);
        }
        var snapshot = try registry.snapshot(view.handle());
        snapshot.deinit();
        old = view.handle();
        view.close();
    }
}
