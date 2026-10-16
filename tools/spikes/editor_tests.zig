const std = @import("std");
const zdl = @import("zdl");
const p = @import("paragraph/paragraph.zig");
const Session = @import("editor/session.zig").Session;
const t = std.testing;

test "editor committed text grapheme deletion and history share one registered document" {
    var library = try p.Library.open_resident(.{});
    defer library.deinit();
    var doc = try zdl.text.Document.init(t.allocator, "Ae\u{301}B", .{});
    defer doc.deinit();
    var registry = try zdl.text.Registry.init(t.allocator, .{});
    defer registry.deinit();
    var view = try registry.register(&doc);
    defer view.close();
    var editor = try Session.init(t.allocator, &library, &registry, view.handle(), 300);
    defer editor.deinit();
    try editor.move(false, false); // Before B, after the combining grapheme.
    try editor.erase(false);
    try t.expectEqualStrings("AB", editor.source.?.text());
    try editor.history(true);
    try t.expectEqualStrings("Ae\u{301}B", editor.source.?.text());
    try editor.history(false);
    try t.expectEqualStrings("AB", editor.source.?.text());
    try editor.select_all();
    try editor.commit_text("אבג العربية");
    try t.expectEqualStrings("אבג العربية", editor.source.?.text());
    try t.expectEqual(@as(usize, 0), editor.layout.?.missing_glyphs());
    try editor.erase(false); // Logical backspace, never visual-left deletion.
    try t.expectEqualStrings("אבג العربي", editor.source.?.text());
}

test "editor stale composition and closed registrations cannot edit another context" {
    var library = try p.Library.open_resident(.{});
    defer library.deinit();
    var doc = try zdl.text.Document.init(t.allocator, "abc", .{});
    defer doc.deinit();
    var registry = try zdl.text.Registry.init(t.allocator, .{});
    defer registry.deinit();
    var view = try registry.register(&doc);
    defer view.close();
    var editor = try Session.init(t.allocator, &library, &registry, view.handle(), 300);
    defer editor.deinit();
    try editor.set_preedit("é");
    var external = try doc.replace(try doc.current_revision(), .{ .start_byte = 3, .end_byte = 3 }, "!", .{});
    defer external.deinit();
    try editor.refresh();
    try t.expectError(error.StaleRevision, editor.commit_text("é"));
    try t.expectEqualStrings("abc!", editor.source.?.text());
    editor.cancel_composition();
    view.close();
    try t.expectError(error.StaleRegistration, editor.commit_text("wrong"));
    try t.expectEqualStrings("abc!", editor.source.?.text());
}

fn failure_scenario(allocator: std.mem.Allocator, library: *p.Library) !void {
    var doc = try zdl.text.Document.init(allocator, "abc", .{});
    defer doc.deinit();
    var registry = try zdl.text.Registry.init(allocator, .{});
    defer registry.deinit();
    var view = try registry.register(&doc);
    defer view.close();
    var editor = try Session.init(allocator, library, &registry, view.handle(), 300);
    defer editor.deinit();
    const previous = editor.source.?.revision();
    editor.commit_text("é") catch |err| {
        var current = try doc.snapshot();
        defer current.deinit();
        try t.expectEqualStrings("abc", current.text());
        try t.expectEqualStrings("abc", editor.source.?.text());
        try t.expectEqual(previous.value, current.revision().value);
        return err;
    };
    try t.expectEqualStrings("abcé", editor.source.?.text());
    const committed = editor.source.?.revision();
    const previous_pixels = std.hash.Wyhash.hash(0, editor.image.?.pixels);
    editor.select_all() catch |err| {
        var current = try doc.snapshot();
        defer current.deinit();
        try t.expectEqual(committed.value, current.revision().value);
        try t.expectEqual(committed.value, editor.source.?.revision().value);
        try t.expectEqual(previous_pixels, std.hash.Wyhash.hash(0, editor.image.?.pixels));
        return err;
    };
    try t.expectEqual(@as(usize, 0), editor.source.?.selection().anchor_byte);
    try t.expectEqual(editor.source.?.text().len, editor.source.?.selection().active_byte);
}
test "editor allocation failures keep model and painted frame coherent before commit" {
    var library = try p.Library.open_resident(.{});
    defer library.deinit();
    try failure_scenario(t.allocator, &library);
    try t.checkAllAllocationFailures(t.allocator, failure_scenario, .{&library});
}

test "editor accepted undo with failed UI refresh is retried as presentation not another undo" {
    var library = try p.Library.open_resident(.{});
    defer library.deinit();
    var doc = try zdl.text.Document.init(t.allocator, "abc", .{});
    defer doc.deinit();
    var registry = try zdl.text.Registry.init(t.allocator, .{});
    defer registry.deinit();
    var view = try registry.register(&doc);
    defer view.close();
    var failing = t.FailingAllocator.init(t.allocator, .{});
    var editor = try Session.init(failing.allocator(), &library, &registry, view.handle(), 300);
    defer editor.deinit();
    try editor.commit_text("x");
    const prior = editor.source.?.revision();
    failing.fail_index = failing.alloc_index;
    try t.expectError(error.OutOfMemory, editor.history(true));
    try t.expect(editor.needs_refresh);
    try t.expectEqualStrings("abcx", editor.source.?.text()); // last complete painted frame
    var accepted = try doc.snapshot();
    defer accepted.deinit();
    try t.expectEqualStrings("abc", accepted.text());
    try t.expectEqual(prior.value + 1, accepted.revision().value);
    try t.expectError(error.PendingPublication, editor.history(true));
    failing.fail_index = std.math.maxInt(usize);
    try editor.refresh();
    try t.expectEqualStrings("abc", editor.source.?.text());
    try t.expectEqual(accepted.revision().value, editor.source.?.revision().value);
}

test "editor joining insertion places caret at a provider stop beyond the merged grapheme" {
    var library = try p.Library.open_resident(.{});
    defer library.deinit();
    var doc = try zdl.text.Document.init(t.allocator, "👩👧", .{});
    defer doc.deinit();
    var registry = try zdl.text.Registry.init(t.allocator, .{});
    defer registry.deinit();
    var view = try registry.register(&doc);
    defer view.close();
    var selected = try registry.set_selection(.{ .registration = view.handle(), .revision = try doc.current_revision() }, zdl.text.document.Selection.caret(4));
    defer selected.deinit();
    var editor = try Session.init(t.allocator, &library, &registry, view.handle(), 300);
    defer editor.deinit();
    try editor.commit_text("\u{200d}");
    try t.expectEqualStrings("👩‍👧", editor.source.?.text());
    try t.expectEqual(editor.source.?.text().len, editor.source.?.selection().active_byte);
    try t.expect(editor.layout.?.is_stop(editor.source.?.selection().active_byte));
    try editor.history(true);
    try t.expectEqualStrings("👩👧", editor.source.?.text());
    try t.expectEqual(@as(usize, 4), editor.source.?.selection().active_byte);
}
