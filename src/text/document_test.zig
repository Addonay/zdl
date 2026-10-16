const std = @import("std");
const api = @import("document.zig");
const ui = @import("../ui/ui.zig");
const t = std.testing;
fn text_is(doc: *const api.Document, expected: []const u8) !void {
    var snapshot = try doc.snapshot();
    defer snapshot.deinit();
    try t.expectEqualStrings(expected, snapshot.text());
}

test "document atomic UTF-8 batches retain old snapshots and reject stale and foreign edits" {
    var doc = try api.Document.init(t.allocator, "aé אב", .{});
    defer doc.deinit();
    var first = try doc.snapshot();
    defer first.deinit();
    const base = first.revision();
    var edited = try doc.apply(base, &.{
        .{ .range = .{ .start_byte = 0, .end_byte = 1 }, .text = "Hi" },
        .{ .range = .{ .start_byte = 4, .end_byte = 8 }, .text = "שלום" },
    }, .{ .selection_after = .{ .anchor_byte = 13, .active_byte = 2 } });
    defer edited.deinit();
    try t.expectEqualStrings("Hié שלום", edited.snapshot.text());
    try t.expectEqualStrings("aé אב", first.text());
    try t.expectEqual(@as(u64, 1), edited.snapshot.revision().value);
    try t.expectEqual(@as(usize, 13), edited.snapshot.selection().anchor_byte);
    try t.expectEqual(@as(usize, 2), edited.snapshot.selection().active_byte);
    try t.expectError(error.StaleRevision, doc.replace(base, .{ .start_byte = 0, .end_byte = 0 }, "replayed", .{}));
    var other = try api.Document.init(t.allocator, "other", .{});
    defer other.deinit();
    try t.expectError(error.ForeignDocument, other.replace(edited.snapshot.revision(), .{ .start_byte = 0, .end_byte = 0 }, "x", .{}));
    doc.close();
    doc.close();
    try t.expectError(error.Closed, doc.snapshot());
    try t.expectEqualStrings("Hié שלום", edited.snapshot.text());
}

test "document range overlap selection and UTF-8 failures are atomic" {
    var doc = try api.Document.init(t.allocator, "aéz", .{});
    defer doc.deinit();
    const base = try doc.current_revision();
    try t.expectError(error.InvalidRange, doc.replace(base, .{ .start_byte = 2, .end_byte = 3 }, "x", .{}));
    try t.expectError(error.InvalidRange, doc.replace(base, .{ .start_byte = 3, .end_byte = 1 }, "x", .{}));
    try t.expectError(error.InvalidUtf8, doc.replace(base, .{ .start_byte = 0, .end_byte = 0 }, "\xff", .{}));
    try t.expectError(error.OverlappingEdits, doc.apply(base, &.{
        .{ .range = .{ .start_byte = 0, .end_byte = 3 }, .text = "first" },
        .{ .range = .{ .start_byte = 1, .end_byte = 3 }, .text = "second" },
    }, .{}));
    try t.expectError(error.InvalidSelection, doc.replace(base, .{ .start_byte = 4, .end_byte = 4 }, "!", .{ .selection_after = .{ .anchor_byte = 2, .active_byte = 1 } }));
    try t.expectError(error.EmptyEdit, doc.apply(base, &.{}, .{}));
    try text_is(&doc, "aéz");
    try t.expectEqual(base.value, (try doc.current_revision()).value);
    try t.expectEqual(@as(usize, 0), (try doc.history_usage()).undo_groups);
}

test "document newline policy equal-position inserts and post-normalization selection" {
    var doc = try api.Document.init(t.allocator, "a\r\nb\r", .{ .newlines = .lf });
    defer doc.deinit();
    try text_is(&doc, "a\nb\n");
    var result = try doc.apply(try doc.current_revision(), &.{
        .{ .range = .{ .start_byte = 0, .end_byte = 0 }, .text = "A\r\n" },
        .{ .range = .{ .start_byte = 0, .end_byte = 0 }, .text = "B\r" },
    }, .{});
    defer result.deinit();
    try t.expectEqualStrings("A\nB\na\nb\n", result.snapshot.text());
    try t.expectEqual(@as(usize, 4), result.snapshot.selection().active_byte);
    var preserve = try api.Document.init(t.allocator, "a\r\nb", .{});
    defer preserve.deinit();
    try text_is(&preserve, "a\r\nb");
}

test "document semantic grouping undo redo and selection publish monotonic revisions" {
    var doc = try api.Document.init(t.allocator, "", .{});
    defer doc.deinit();
    const group = try doc.begin_group();
    var a = try doc.replace(try doc.current_revision(), .{ .start_byte = 0, .end_byte = 0 }, "a", .{ .group = group, .origin = .typing });
    defer a.deinit();
    var b = try doc.replace(try doc.current_revision(), .{ .start_byte = 1, .end_byte = 1 }, "b", .{ .group = group, .origin = .typing });
    defer b.deinit();
    try t.expectEqual(api.HistoryStatus.coalesced, b.history);
    try t.expectEqual(@as(usize, 1), (try doc.history_usage()).undo_groups);
    var cursor = try doc.set_selection(try doc.current_revision(), .{ .anchor_byte = 2, .active_byte = 0 });
    defer cursor.deinit();
    try t.expectEqual(@as(u64, 3), cursor.revision().value);
    try t.expectError(error.StaleGroup, doc.replace(try doc.current_revision(), .{ .start_byte = 2, .end_byte = 2 }, "c", .{ .group = group }));
    var undone = try doc.undo(try doc.current_revision());
    defer undone.deinit();
    try t.expectEqualStrings("", undone.text());
    try t.expectEqual(@as(u64, 4), undone.revision().value);
    try t.expectError(error.StaleRevision, doc.redo(cursor.revision()));
    var redone = try doc.redo(try doc.current_revision());
    defer redone.deinit();
    try t.expectEqualStrings("ab", redone.text());
    try t.expectEqual(@as(usize, 2), redone.selection().active_byte);
    try t.expectEqual(@as(u64, 5), redone.revision().value);
    var no_op = try doc.replace(try doc.current_revision(), .{ .start_byte = 2, .end_byte = 2 }, "", .{});
    defer no_op.deinit();
    try t.expect(!no_op.changed and !no_op.text_changed);
    try t.expectEqual(redone.revision().value, no_op.snapshot.revision().value);
    try t.expectEqualStrings("a", a.snapshot.text());
}

test "document history eviction oversized groups redo branching and explicit discard" {
    var doc = try api.Document.init(t.allocator, "", .{ .max_history_entries = 2, .max_history_bytes = 8 });
    defer doc.deinit();
    for (0..3) |i| {
        var result = try doc.replace(try doc.current_revision(), .{ .start_byte = i, .end_byte = i }, "x", .{});
        result.deinit();
    }
    try t.expectEqual(@as(usize, 2), (try doc.history_usage()).undo_groups);
    var undone = try doc.undo(try doc.current_revision());
    undone.deinit();
    try text_is(&doc, "xx");
    var branched = try doc.replace(try doc.current_revision(), .{ .start_byte = 2, .end_byte = 2 }, "!", .{});
    defer branched.deinit();
    try t.expectError(error.NoRedo, doc.redo(try doc.current_revision()));
    const revision = try doc.current_revision();
    try t.expectError(error.HistoryLimit, doc.replace(revision, .{ .start_byte = 0, .end_byte = 3 }, "a large paste", .{}));
    try text_is(&doc, "xx!");
    var accepted = try doc.replace(revision, .{ .start_byte = 0, .end_byte = 3 }, "a large paste", .{ .record_history = false });
    defer accepted.deinit();
    try t.expectEqual(api.HistoryStatus.none, accepted.history);
    try t.expectError(error.NoUndo, doc.undo(try doc.current_revision()));
    try t.expectEqual(@as(usize, 0), (try doc.history_usage()).logical_bytes);
}

test "document read-only and text edit history limits fail without changes" {
    var doc = try api.Document.init(t.allocator, "abc", .{ .max_bytes = 4, .max_edits = 1 });
    defer doc.deinit();
    try doc.set_read_only(true);
    try t.expectError(error.ReadOnly, doc.replace(try doc.current_revision(), .{ .start_byte = 0, .end_byte = 0 }, "x", .{}));
    var selected = try doc.set_selection(try doc.current_revision(), .{ .anchor_byte = 0, .active_byte = 3 });
    selected.deinit();
    try doc.set_read_only(false);
    try t.expectError(error.TextLimit, doc.replace(try doc.current_revision(), .{ .start_byte = 3, .end_byte = 3 }, "xx", .{}));
    try t.expectError(error.EditLimit, doc.apply(try doc.current_revision(), &.{
        .{ .range = .{ .start_byte = 0, .end_byte = 0 }, .text = "" },
        .{ .range = .{ .start_byte = 0, .end_byte = 0 }, .text = "" },
    }, .{}));
    try text_is(&doc, "abc");
    var no_history = try api.Document.init(t.allocator, "", .{ .max_history_bytes = 0 });
    defer no_history.deinit();
    var result = try no_history.replace(try no_history.current_revision(), .{ .start_byte = 0, .end_byte = 0 }, "ok", .{});
    defer result.deinit();
    try t.expectEqual(api.HistoryStatus.none, result.history);
    try t.expectError(error.NoUndo, no_history.undo(try no_history.current_revision()));
}

fn allocation_scenario(allocator: std.mem.Allocator) !void {
    var doc = try api.Document.init(allocator, "old", .{ .newlines = .lf });
    defer doc.deinit();
    var before = try doc.snapshot();
    defer before.deinit();
    const base = before.revision();
    var result = doc.replace(base, .{ .start_byte = 0, .end_byte = 3 }, "new\r\ntext", .{}) catch |err| {
        try text_is(&doc, "old");
        try t.expectEqual(base.value, (try doc.current_revision()).value);
        try t.expectEqual(@as(usize, 0), (try doc.history_usage()).logical_bytes);
        return err;
    };
    defer result.deinit();
    const edited = try doc.current_revision();
    var undo = doc.undo(edited) catch |err| {
        try text_is(&doc, "new\ntext");
        try t.expectEqual(edited.value, (try doc.current_revision()).value);
        try t.expectEqual(@as(usize, 1), (try doc.history_usage()).undo_groups);
        return err;
    };
    defer undo.deinit();
    const prior = try doc.current_revision();
    var redo = doc.redo(prior) catch |err| {
        try text_is(&doc, "old");
        try t.expectEqual(prior.value, (try doc.current_revision()).value);
        try t.expectEqual(@as(usize, 1), (try doc.history_usage()).redo_groups);
        return err;
    };
    defer redo.deinit();
    var moved = try doc.set_selection(try doc.current_revision(), .{ .anchor_byte = 0, .active_byte = 8 });
    defer moved.deinit();
    try t.expectEqualStrings("old", before.text());
    doc.close();
    try t.expectEqualStrings("new\ntext", result.snapshot.text());
}
test "document all allocation failures preserve content revision selection and history" {
    try allocation_scenario(t.allocator);
    try t.checkAllAllocationFailures(t.allocator, allocation_scenario, .{});
}

const SnapshotPolicy = struct {
    pub const Value = api.Snapshot;
    pub fn clone(_: std.mem.Allocator, value: *const Value) api.Error!Value {
        return value.retain();
    }
    pub fn deinit(_: std.mem.Allocator, value: *Value) void {
        value.deinit();
    }
    pub fn owned_bytes(value: *const Value) usize {
        return value.text().len;
    }
};
test "document accepted edit is not replayed when a scene publication fails" {
    const Model = ui.with_states(.{ .document = SnapshotPolicy });
    var doc = try api.Document.init(t.allocator, "abc", .{});
    var alive = true;
    defer if (alive) doc.deinit();
    var scene = try Model.Scene.init(t.allocator, .{});
    defer scene.deinit();
    var text = try doc.snapshot();
    defer text.deinit();
    var update = try scene.begin_update();
    defer update.abort();
    const editor = try update.node(.{ .named = "editor" }, .editor, .{});
    try update.set_state("document", editor, &text);
    var old_scene = try update.commit();
    defer old_scene.deinit();
    const id = try old_scene.id_for(editor);
    var edit = try doc.replace(text.revision(), .{ .start_byte = 3, .end_byte = 3 }, "d", .{});
    defer edit.deinit();
    update = try scene.begin_update();
    const attempt = try update.node(.{ .named = "editor" }, .editor, .{});
    try update.set_state("document", attempt, &edit.snapshot);
    try t.expectError(error.DuplicateKey, update.node(.{ .named = "editor" }, .editor, .{}));
    try t.expectError(error.UpdateFailed, update.commit());
    update.abort();
    try text_is(&doc, "abcd");
    try t.expectEqual(@as(u64, 1), (try doc.current_revision()).value);
    try t.expectEqualStrings("abc", (try old_scene.state("document", id)).?.text());
    update = try scene.begin_update();
    const retried = try update.node(.{ .named = "editor" }, .editor, .{});
    try update.set_state("document", retried, &edit.snapshot);
    var new_scene = try update.commit();
    defer new_scene.deinit();
    try t.expectEqualStrings("abcd", (try new_scene.state("document", id)).?.text());
    doc.deinit();
    alive = false;
    try t.expectEqualStrings("abc", (try old_scene.state("document", id)).?.text());
    try t.expectEqualStrings("abcd", (try new_scene.state("document", id)).?.text());
}

test "document owns input and snapshots survive owner reuse and destruction" {
    var buffer = [_]u8{ 'a', 'b', 'c' };
    var doc = try api.Document.init(t.allocator, &buffer, .{});
    @memset(&buffer, 'x');
    var before = try doc.snapshot();
    defer before.deinit();
    var clone = try before.retain();
    defer clone.deinit();
    var repeated = try doc.replace(before.revision(), .{ .start_byte = 3, .end_byte = 3 }, before.text(), .{});
    defer repeated.deinit();
    try t.expectEqualStrings("abcabc", repeated.snapshot.text());
    doc.deinit();
    try t.expectEqualStrings("abc", clone.text());
    doc = try api.Document.init(t.allocator, "new", .{});
    defer doc.deinit();
    try t.expectError(error.ForeignDocument, doc.replace(before.revision(), .{ .start_byte = 0, .end_byte = 0 }, "stale", .{}));
}

test "document explicit groups respect edit origins and history clearing" {
    var doc = try api.Document.init(t.allocator, "", .{});
    defer doc.deinit();
    const group = try doc.begin_group();
    var typed = try doc.replace(try doc.current_revision(), .{ .start_byte = 0, .end_byte = 0 }, "a", .{ .group = group, .origin = .typing });
    defer typed.deinit();
    var pasted = try doc.replace(try doc.current_revision(), .{ .start_byte = 1, .end_byte = 1 }, "B", .{ .group = group, .origin = .paste });
    defer pasted.deinit();
    try t.expectEqual(api.HistoryStatus.recorded, pasted.history);
    try t.expectEqual(@as(usize, 2), (try doc.history_usage()).undo_groups);
    try doc.clear_history();
    try t.expectError(error.StaleGroup, doc.end_group(group));
    try t.expectError(error.NoUndo, doc.undo(try doc.current_revision()));
}

const Reference = struct {
    data: [128]u8 = undefined,
    length: usize = 0,
    selection: api.Selection = .{ .anchor_byte = 0, .active_byte = 0 },
    fn bytes(self: *const Reference) []const u8 {
        return self.data[0..self.length];
    }
};
const RefRecord = struct { before: Reference, after: Reference };
test "document randomized editing selection undo and redo match an independent history model" {
    var doc = try api.Document.init(t.allocator, "", .{ .max_bytes = 128, .max_history_entries = 1000, .max_history_bytes = 1024 * 1024 });
    defer doc.deinit();
    var undo: std.ArrayList(RefRecord) = .empty;
    defer undo.deinit(t.allocator);
    var redo: std.ArrayList(RefRecord) = .empty;
    defer redo.deinit(t.allocator);
    var model: Reference = .{};
    var revision: u64 = 0;
    var prng = std.Random.DefaultPrng.init(0xabc71);
    const random = prng.random();
    for (0..400) |_| {
        const operation = random.uintLessThan(u8, 8);
        const base = try doc.current_revision();
        if (operation == 0 or operation == 1) {
            if (undo.items.len == 0) try t.expectError(error.NoUndo, doc.undo(base)) else {
                const record = undo.items[undo.items.len - 1];
                var result = try doc.undo(base);
                result.deinit();
                undo.items.len -= 1;
                try redo.append(t.allocator, record);
                model = record.before;
                revision += 1;
            }
        } else if (operation == 2) {
            if (redo.items.len == 0) try t.expectError(error.NoRedo, doc.redo(base)) else {
                const record = redo.items[redo.items.len - 1];
                var result = try doc.redo(base);
                result.deinit();
                redo.items.len -= 1;
                try undo.append(t.allocator, record);
                model = record.after;
                revision += 1;
            }
        } else if (operation == 3) {
            const desired: api.Selection = .{ .anchor_byte = random.uintLessThan(usize, model.length + 1), .active_byte = random.uintLessThan(usize, model.length + 1) };
            var result = try doc.set_selection(base, desired);
            result.deinit();
            if (!model.selection.eql(desired)) revision += 1;
            model.selection = desired;
        } else {
            const start = random.uintLessThan(usize, model.length + 1);
            const end = start + random.uintLessThan(usize, model.length - start + 1);
            var insert: [4]u8 = undefined;
            const count = random.uintLessThan(usize, 5);
            for (insert[0..count]) |*byte| byte.* = 'a' + random.uintLessThan(u8, 26);
            const length = model.length - (end - start) + count;
            if (length > 128) {
                try t.expectError(error.TextLimit, doc.replace(base, .{ .start_byte = start, .end_byte = end }, insert[0..count], .{}));
                continue;
            }
            var desired: Reference = .{ .length = length, .selection = api.Selection.caret(start + count) };
            @memcpy(desired.data[0..start], model.data[0..start]);
            @memcpy(desired.data[start..][0..count], insert[0..count]);
            @memcpy(desired.data[start + count ..][0 .. model.length - end], model.data[end..model.length]);
            const changed_text = !std.mem.eql(u8, model.bytes(), desired.bytes());
            const changed = changed_text or !model.selection.eql(desired.selection);
            var result = try doc.replace(base, .{ .start_byte = start, .end_byte = end }, insert[0..count], .{});
            defer result.deinit();
            try t.expectEqual(changed, result.changed);
            try t.expectEqual(changed_text, result.text_changed);
            if (changed) revision += 1;
            if (changed_text) {
                try undo.append(t.allocator, .{ .before = model, .after = desired });
                redo.clearRetainingCapacity();
            }
            model = desired;
        }
        var snapshot = try doc.snapshot();
        defer snapshot.deinit();
        try t.expectEqualStrings(model.bytes(), snapshot.text());
        try t.expect(model.selection.eql(snapshot.selection()));
        try t.expectEqual(revision, snapshot.revision().value);
        const history = try doc.history_usage();
        try t.expectEqual(undo.items.len, history.undo_groups);
        try t.expectEqual(redo.items.len, history.redo_groups);
        var cost: usize = 0;
        for (undo.items) |record| cost += record.before.length + record.after.length;
        for (redo.items) |record| cost += record.before.length + record.after.length;
        try t.expectEqual(cost, history.logical_bytes);
    }
}

test "document NUL policy UTF-8 initialization and normalized budgets are explicit" {
    try t.expectError(error.InvalidUtf8, api.Document.init(t.allocator, "\xed\xa0\x80", .{}));
    try t.expectError(error.EmbeddedNul, api.Document.init(t.allocator, "a\x00b", .{}));
    try t.expectError(error.InvalidOptions, api.Document.init(t.allocator, "", .{ .max_edits = 0 }));
    try t.expectError(error.InvalidSelection, api.Document.init(t.allocator, "é", .{ .initial_selection = api.Selection.caret(1) }));
    var doc = try api.Document.init(t.allocator, "a\x00b", .{ .nul = .preserve });
    defer doc.deinit();
    try text_is(&doc, "a\x00b");
    var normalized = try api.Document.init(t.allocator, "\r\n\r\n", .{ .newlines = .lf, .max_bytes = 2 });
    defer normalized.deinit();
    try text_is(&normalized, "\n\n");
    try t.expectError(error.EmbeddedNul, normalized.replace(try normalized.current_revision(), .{ .start_byte = 0, .end_byte = 1 }, "\x00", .{}));
}

fn grouped_failure(allocator: std.mem.Allocator) !void {
    var doc = try api.Document.init(allocator, "", .{});
    defer doc.deinit();
    const group = try doc.begin_group();
    var first = try doc.replace(try doc.current_revision(), .{ .start_byte = 0, .end_byte = 0 }, "a", .{ .group = group, .origin = .typing });
    defer first.deinit();
    var last = doc.replace(try doc.current_revision(), .{ .start_byte = 1, .end_byte = 1 }, "b", .{ .group = group, .origin = .typing }) catch |err| {
        try text_is(&doc, "a");
        try t.expectEqual(@as(u64, 1), (try doc.current_revision()).value);
        try t.expectEqual(@as(usize, 1), (try doc.history_usage()).undo_groups);
        try doc.end_group(group);
        return err;
    };
    defer last.deinit();
    try t.expectEqual(api.HistoryStatus.coalesced, last.history);
    var undone = try doc.undo(try doc.current_revision());
    defer undone.deinit();
    try t.expectEqualStrings("", undone.text());
}
test "document grouped publication allocation failures retain the active history group" {
    try grouped_failure(t.allocator);
    try t.checkAllAllocationFailures(t.allocator, grouped_failure, .{});
}

test "document selection affinity changes revise state and undo restores both caret affinities" {
    const upstream: api.Affinity = .{ .line = .upstream, .bidi = .weak };
    const original: api.Selection = .{ .anchor_byte = 3, .active_byte = 3, .anchor_affinity = upstream, .active_affinity = upstream };
    var doc = try api.Document.init(t.allocator, "abc", .{ .initial_selection = original });
    defer doc.deinit();
    const group = try doc.begin_group();
    var moved = try doc.set_selection(try doc.current_revision(), api.Selection.caret(3));
    defer moved.deinit();
    try t.expectEqual(@as(u64, 1), moved.revision().value);
    try t.expectError(error.StaleGroup, doc.replace(try doc.current_revision(), .{ .start_byte = 3, .end_byte = 3 }, "!", .{ .group = group }));
    var selected = try doc.set_selection(try doc.current_revision(), original);
    defer selected.deinit();
    var edited = try doc.replace(try doc.current_revision(), .{ .start_byte = 3, .end_byte = 3 }, "!", .{});
    defer edited.deinit();
    var undone = try doc.undo(try doc.current_revision());
    defer undone.deinit();
    try t.expect(original.eql(undone.selection()));
    var redone = try doc.redo(try doc.current_revision());
    defer redone.deinit();
    try t.expect(api.Selection.caret(4).eql(redone.selection()));
}
