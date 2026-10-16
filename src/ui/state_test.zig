const std = @import("std");
const ui = @import("ui.zig");
const t = std.testing;
const Scroll = struct { offset: i64, anchor: ?u64 = null };
const Blob = struct {
    pub const Value = struct { bytes: []const u8 };
    var clones: usize = 0;
    var destroys: usize = 0;
    pub fn clone(allocator: std.mem.Allocator, input: *const Value) (std.mem.Allocator.Error || error{InvalidState})!Value {
        if (input.bytes.len == 0) return error.InvalidState;
        const bytes = try allocator.dupe(u8, input.bytes);
        clones += 1;
        return .{ .bytes = bytes };
    }
    pub fn deinit(allocator: std.mem.Allocator, value: *Value) void {
        allocator.free(value.bytes);
        destroys += 1;
    }
    pub fn owned_bytes(value: *const Value) usize {
        return value.bytes.len;
    }
    fn reset() void {
        clones = 0;
        destroys = 0;
    }
};
const Model = ui.with_states(.{ .blob = Blob, .scroll = ui.state.Value(Scroll) });

test "scene typed channels retain immutable values independently across reorder replacement and clear" {
    Blob.reset();
    defer t.expectEqual(Blob.clones, Blob.destroys) catch @panic("state ownership imbalance");
    var scene = try Model.Scene.init(t.allocator, .{});
    defer scene.deinit();
    var update = try scene.begin_update();
    defer update.abort();
    const draft = try update.node(.{ .integer = 1 }, .editor, .{ .focusable = true });
    var buffer = [_]u8{ 'o', 'l', 'd' };
    try update.set_state("blob", draft, &.{ .bytes = &buffer });
    try update.set_state("scroll", draft, &.{ .offset = 42, .anchor = 9 });
    @memset(&buffer, 'x');
    var before = try update.commit();
    defer before.deinit();
    const id = try before.id_for(draft);
    const old_blob = (try before.state("blob", id)).?;
    try t.expectEqualStrings("old", old_blob.bytes);
    try t.expectEqual(@as(i64, 42), (try before.state("scroll", id)).?.offset);
    update = try scene.begin_update();
    _ = try update.node(.{ .integer = 2 }, .label, .{});
    const reordered = try update.node(.{ .integer = 1 }, .editor, .{ .focusable = true });
    var shared = try update.commit();
    defer shared.deinit();
    try t.expect((try shared.id_for(reordered)).eql(id));
    try t.expect((try shared.state("blob", id)).? == old_blob);
    try t.expectEqual(@as(usize, 1), Blob.clones);
    update = try scene.begin_update();
    const changed = try update.node(.{ .integer = 1 }, .editor, .{});
    try update.set_state("blob", changed, &.{ .bytes = "intermediate" });
    try update.set_state("blob", changed, &.{ .bytes = "new" });
    var after = try update.commit();
    defer after.deinit();
    try t.expectEqualStrings("new", (try after.state("blob", id)).?.bytes);
    try t.expectEqualStrings("old", (try before.state("blob", id)).?.bytes);
    try t.expectEqual(@as(usize, 3), Blob.clones);
    try t.expectEqual(@as(usize, 1), Blob.destroys); // replaced staging value only
    update = try scene.begin_update();
    const cleared = try update.node(.{ .integer = 1 }, .editor, .{});
    try update.clear_state("blob", cleared);
    var without = try update.commit();
    defer without.deinit();
    try t.expect(try without.state("blob", id) == null);
    try t.expectEqual(@as(i64, 42), (try without.state("scroll", id)).?.offset);
    scene.close();
    try t.expectEqualStrings("new", (try after.state("blob", id)).?.bytes);
}

test "scene typed channels do not inherit state across kind scope or slot-generation replacement" {
    Blob.reset();
    defer t.expectEqual(Blob.clones, Blob.destroys) catch @panic("unbalanced");
    var scene = try Model.Scene.init(t.allocator, .{});
    defer scene.deinit();
    var update = try scene.begin_update();
    defer update.abort();
    const draft = try update.node(.{ .integer = 1 }, .control, .{});
    try update.set_state("blob", draft, &.{ .bytes = "private" });
    var old = try update.commit();
    defer old.deinit();
    const id = try old.id_for(draft);
    update = try scene.begin_update();
    const replacement = try update.node(.{ .integer = 1 }, .editor, .{});
    var changed = try update.commit();
    defer changed.deinit();
    const replacement_id = try changed.id_for(replacement);
    try t.expect(!replacement_id.eql(id));
    try t.expect(try changed.state("blob", replacement_id) == null);
    try t.expectError(error.StaleNode, changed.state("blob", id));
    try t.expectEqualStrings("private", (try old.state("blob", id)).?.bytes);
    update = try scene.begin_update();
    var empty = try update.commit();
    empty.deinit();
    update = try scene.begin_update();
    const reused = try update.node(.{ .integer = 1 }, .control, .{});
    var fresh = try update.commit();
    defer fresh.deinit();
    const fresh_id = try fresh.id_for(reused);
    try t.expect(!fresh_id.eql(id));
    try t.expect(try fresh.state("blob", fresh_id) == null);
}

test "scene typed state errors and aggregate limits preserve last-good data" {
    Blob.reset();
    defer t.expectEqual(Blob.clones, Blob.destroys) catch @panic("unbalanced");
    var scene = try Model.Scene.init(t.allocator, .{ .max_state_entries = 1 });
    defer scene.deinit();
    var update = try scene.begin_update();
    defer update.abort();
    var draft = try update.node(.{ .integer = 1 }, .editor, .{});
    try update.set_state("blob", draft, &.{ .bytes = "old" });
    var old = try update.commit();
    defer old.deinit();
    const id = try old.id_for(draft);
    update = try scene.begin_update();
    draft = try update.node(.{ .integer = 1 }, .editor, .{});
    try update.set_state("scroll", draft, &.{ .offset = 1 });
    try t.expectError(error.StateLimit, update.commit());
    update.abort();
    var live = try scene.snapshot();
    defer live.deinit();
    try t.expectEqual(old.revision(), live.revision());
    try t.expectEqualStrings("old", (try live.state("blob", id)).?.bytes);
    update = try scene.begin_update();
    draft = try update.node(.{ .integer = 1 }, .editor, .{});
    try t.expectError(error.InvalidState, update.set_state("blob", draft, &.{ .bytes = "" }));
    try t.expectError(error.UpdateFailed, update.commit());
    update.abort();
    var limited = try Model.Scene.init(t.allocator, .{ .max_state_bytes = @sizeOf(Blob.Value) + 2 });
    defer limited.deinit();
    var excess = try limited.begin_update();
    defer excess.abort();
    const large = try excess.node(.{ .integer = 1 }, .editor, .{});
    try t.expectError(error.StateLimit, excess.set_state("blob", large, &.{ .bytes = "three" }));
    try t.expectError(error.UpdateFailed, excess.commit());
}

fn allocation_scenario(allocator: std.mem.Allocator) !void {
    Blob.reset();
    defer t.expectEqual(Blob.clones, Blob.destroys) catch @panic("state leak on failure");
    var scene = try Model.Scene.init(allocator, .{});
    defer scene.deinit();
    var first_update = try scene.begin_update();
    defer first_update.abort();
    const draft = try first_update.node(.{ .named = "editor" }, .editor, .{ .focusable = true });
    try first_update.set_state("blob", draft, &.{ .bytes = "old data" });
    try first_update.set_state("scroll", draft, &.{ .offset = 9 });
    try first_update.request_focus(draft);
    var before = try first_update.commit();
    defer before.deinit();
    const id = try before.id_for(draft);
    var next = try scene.begin_update();
    defer next.abort();
    const attempt = replace(&next) catch |err| {
        try t.expectEqualStrings("old data", (try before.state("blob", id)).?.bytes);
        var current = try scene.snapshot();
        defer current.deinit();
        try t.expectEqual(before.revision(), current.revision());
        try t.expectEqualStrings("old data", (try current.state("blob", id)).?.bytes);
        try t.expect(current.focus().?.eql(id));
        return err;
    };
    var after = attempt;
    defer after.deinit();
    try t.expectEqualStrings("old data", (try before.state("blob", id)).?.bytes);
    try t.expectEqualStrings("new data", (try after.state("blob", id)).?.bytes);
    try t.expectEqual(@as(i64, 9), (try after.state("scroll", id)).?.offset);
    scene.close();
    try t.expectEqualStrings("new data", (try after.state("blob", id)).?.bytes);
}
fn replace(update: *Model.Update) !Model.Snapshot {
    _ = try update.node(.{ .named = "label" }, .label, .{ .label = "another" });
    const draft = try update.node(.{ .named = "editor" }, .editor, .{ .focusable = true });
    try update.set_state("blob", draft, &.{ .bytes = "discarded stage" });
    try update.set_state("blob", draft, &.{ .bytes = "new data" });
    return update.commit();
}
test "scene typed state allocation failures free staged cells and preserve prior values" {
    try allocation_scenario(t.allocator);
    try t.checkAllAllocationFailures(t.allocator, allocation_scenario, .{});
}

test "scene typed pending state abort survives owner destruction and rejects foreign drafts" {
    Blob.reset();
    defer t.expectEqual(Blob.clones, Blob.destroys) catch @panic("unbalanced");
    var scene = try Model.Scene.init(t.allocator, .{});
    var other = try Model.Scene.init(t.allocator, .{});
    defer other.deinit();
    var alien = try other.begin_update();
    defer alien.abort();
    const foreign = try alien.node(.{ .integer = 1 }, .editor, .{});
    var update = try scene.begin_update();
    defer update.abort();
    try t.expectError(error.ForeignDraft, update.set_state("blob", foreign, &.{ .bytes = "foreign" }));
    try t.expectEqual(@as(usize, 0), Blob.clones);
    update.abort();
    update = try scene.begin_update();
    const draft = try update.node(.{ .integer = 1 }, .editor, .{});
    try update.set_state("blob", draft, &.{ .bytes = "pending" });
    scene.deinit();
    try t.expectError(error.Closed, update.commit());
    update.abort();
    try t.expectError(error.UpdateFinished, update.set_state("scroll", draft, &.{ .offset = 1 }));
    try t.expectError(error.UpdateFinished, update.clear_state("blob", draft));
}

test "scene typed sparse channels match independent histories across randomized updates" {
    const Counts = ui.with_states(.{ .count = ui.state.Value(u64), .position = ui.state.Value(Scroll) });
    var scene = try Counts.Scene.init(t.allocator, .{});
    defer scene.deinit();
    var expected: [64]?u64 = @splat(null);
    var offsets: [64]?i64 = @splat(null);
    var prng = std.Random.DefaultPrng.init(0x7171);
    const random = prng.random();
    for (0..100) |revision| {
        var before = try scene.snapshot();
        defer before.deinit();
        const old_values = expected;
        const old_offsets = offsets;
        const mask = random.int(u64);
        const rotation = random.uintLessThan(usize, 64);
        var update = try scene.begin_update();
        defer update.abort();
        for (0..64) |i| {
            const key = (i + rotation) % 64;
            if (mask & (@as(u64, 1) << @intCast(key)) == 0) {
                expected[key] = null;
                offsets[key] = null;
                continue;
            }
            const draft = try update.node(.{ .integer = key }, .control, .{});
            const fresh = expected[key] == null;
            if (fresh or revision % 5 == 0) {
                expected[key] = revision * 1000 + key;
                try update.set_state("count", draft, &expected[key].?);
            }
            if (fresh) offsets[key] = null;
            if (key % 3 == 0) {
                offsets[key] = @intCast(revision * 100 + key);
                try update.set_state("position", draft, &.{ .offset = offsets[key].? });
            } else if (key % 7 == 0) {
                offsets[key] = null;
                try update.clear_state("position", draft);
            }
        }
        var after = try update.commit();
        defer after.deinit();
        var entries: usize = 0;
        for (after.nodes()) |node| {
            const key = node.key.integer;
            try t.expectEqual(expected[key].?, (try after.state("count", node.id)).?.*);
            entries += 1;
            const offset = try after.state("position", node.id);
            if (offsets[key]) |value| {
                try t.expectEqual(value, offset.?.offset);
                entries += 1;
            } else try t.expect(offset == null);
        }
        try t.expectEqual(entries, after.state_usage().entries);
        for (before.nodes()) |node| {
            try t.expectEqual(old_values[node.key.integer].?, (try before.state("count", node.id)).?.*);
            const offset = try before.state("position", node.id);
            if (old_offsets[node.key.integer]) |value| try t.expectEqual(value, offset.?.offset) else try t.expect(offset == null);
        }
    }
}

test "scene state aggregate byte and reference limits reject atomically" {
    const Counts = ui.with_states(.{ .one = ui.state.Value(u64), .two = ui.state.Value(u64) });
    var scene = try Counts.Scene.init(t.allocator, .{ .max_state_bytes = @sizeOf(u64) });
    defer scene.deinit();
    var update = try scene.begin_update();
    defer update.abort();
    const draft = try update.node(.{ .integer = 1 }, .control, .{});
    try update.set_state("one", draft, &@as(u64, 1));
    var first = try update.commit();
    defer first.deinit();
    const id = try first.id_for(draft);
    try t.expectEqual(@as(usize, 8), first.state_usage().logical_bytes);
    update = try scene.begin_update();
    const again = try update.node(.{ .integer = 1 }, .control, .{});
    try update.set_state("two", again, &@as(u64, 2));
    try t.expectError(error.StateLimit, update.commit());
    update.abort();
    var current = try scene.snapshot();
    defer current.deinit();
    try t.expectEqual(first.revision(), current.revision());
    try t.expectEqual(@as(u64, 1), (try current.state("one", id)).?.*);
    try t.expect(try current.state("two", id) == null);
    const cell = first.storage.states[0][0].cell;
    cell.references = std.math.maxInt(usize);
    defer cell.references = 1;
    update = try scene.begin_update();
    _ = try update.node(.{ .integer = 1 }, .control, .{});
    try t.expectError(error.ReferenceLimit, update.commit());
    try t.expectEqual(@as(u64, 1), (try first.state("one", id)).?.*);
}
