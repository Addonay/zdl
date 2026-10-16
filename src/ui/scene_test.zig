const std = @import("std");
const api = @import("scene.zig");
const t = std.testing;

fn control(update: *api.Update, key: u64) !api.DraftId {
    return update.node(.{ .integer = key }, .control, .{ .focusable = true });
}

test "scene reorder preserves IDs focus capture and retained snapshots" {
    var scene = try api.Scene.init(t.allocator, .{});
    defer scene.deinit();
    var first = try scene.begin_update();
    defer first.abort();
    const root = try first.begin_group(.{ .named = "rows" }, .{});
    const a = try control(&first, 1);
    const b = try control(&first, 2);
    try first.end_group();
    try first.request_focus(a);
    try first.request_capture(a);
    var before = try first.commit();
    defer before.deinit();
    const a_id = try before.id_for(a);
    const b_id = try before.id_for(b);
    var second = try scene.begin_update();
    defer second.abort();
    const root_again = try second.begin_group(.{ .named = "rows" }, .{});
    const b_again = try control(&second, 2);
    const a_again = try control(&second, 1);
    try second.end_group();
    var after = try second.commit();
    defer after.deinit();
    try t.expect((try after.id_for(root_again)).eql(try before.id_for(root)));
    try t.expect(a_id.eql(try after.id_for(a_again)));
    try t.expect(b_id.eql(try after.id_for(b_again)));
    try t.expect(a_id.eql(after.focus().?));
    try t.expect(a_id.eql(after.capture().?));
    var children = try after.children(try after.id_for(root_again));
    try t.expect(children.next().?.id.eql(b_id));
    try t.expect(children.next().?.id.eql(a_id));
    try t.expect(children.next() == null);
    var replacement = try scene.begin_update();
    defer replacement.abort();
    _ = try replacement.begin_group(.{ .named = "rows" }, .{});
    const editor = try replacement.node(.{ .integer = 1 }, .editor, .{ .focusable = true });
    try replacement.end_group();
    var changed = try replacement.commit();
    defer changed.deinit();
    try t.expect(!(try changed.id_for(editor)).eql(a_id));
    try t.expect(changed.focus() == null and changed.capture() == null);
    try t.expectError(error.StaleNode, scene.resolve(a_id));
    try t.expectError(error.StaleNode, scene.resolve(b_id));
    try t.expect((try before.resolve(a_id)).id.eql(a_id));
    try t.expectEqual(@as(u64, 1), before.revision());
    try t.expectEqual(@as(u64, 3), changed.revision());
}

test "scene owns named keys labels and scopes identity by parent" {
    var scene = try api.Scene.init(t.allocator, .{});
    defer scene.deinit();
    var update = try scene.begin_update();
    defer update.abort();
    var key = [_]u8{ 'k', 'e', 'y' };
    var label = [_]u8{ 'o', 'l', 'd' };
    const one = try update.begin_group(.{ .integer = 1 }, .{});
    const child = try update.node(.{ .named = &key }, .label, .{ .label = &label });
    try update.end_group();
    const two = try update.begin_group(.{ .integer = 2 }, .{});
    const other = try update.node(.{ .named = &key }, .label, .{ .label = "other" });
    try update.end_group();
    @memset(&key, 'x');
    @memset(&label, 'x');
    var snapshot = try update.commit();
    defer snapshot.deinit();
    const node = try snapshot.resolve(try snapshot.id_for(child));
    try t.expectEqualStrings("key", node.key.named);
    try t.expectEqualStrings("old", node.properties.label);
    try t.expect(!node.id.eql(try snapshot.id_for(other)));
    try t.expect(node.parent.?.eql(try snapshot.id_for(one)));
    try t.expect((try snapshot.resolve(try snapshot.id_for(other))).parent.?.eql(try snapshot.id_for(two)));
}

test "scene declaration failures poison updates and preserve last good scene" {
    var scene = try api.Scene.init(t.allocator, .{});
    defer scene.deinit();
    var update = try scene.begin_update();
    defer update.abort();
    _ = try update.node(.{ .integer = 1 }, .label, .{});
    try t.expectError(error.DuplicateKey, update.node(.{ .integer = 1 }, .label, .{}));
    try t.expectError(error.UpdateFailed, update.commit());
    var unchanged = try scene.snapshot();
    defer unchanged.deinit();
    try t.expectEqual(@as(u64, 0), unchanged.revision());
    try t.expectEqual(@as(usize, 0), unchanged.nodes().len);
    update.abort();
    update.abort();
    var retry = try scene.begin_update();
    defer retry.abort();
    _ = try retry.begin_group(.{ .integer = 1 }, .{});
    try t.expectError(error.UnbalancedScopes, retry.commit());
    retry.abort();
    var bad_label = try scene.begin_update();
    defer bad_label.abort();
    try t.expectError(error.InvalidUtf8, bad_label.node(.{ .integer = 1 }, .label, .{ .label = "\xff" }));
    try t.expectError(error.UpdateFailed, bad_label.commit());
}

test "scene close is allocation free and pending updates outlive owner value" {
    var scene = try api.Scene.init(t.allocator, .{});
    var initial = try scene.snapshot();
    defer initial.deinit();
    var update = try scene.begin_update();
    defer update.abort();
    _ = try control(&update, 1);
    try t.expectError(error.UpdateInProgress, scene.begin_update());
    scene.close();
    scene.close();
    try t.expectError(error.Closed, scene.snapshot());
    try t.expectError(error.Closed, scene.begin_update());
    scene.deinit();
    try t.expectError(error.Closed, update.commit());
    try t.expectEqual(@as(u64, 0), initial.revision());
}

test "scene IDs reject other owners and drafts reject aborted transactions" {
    var one = try api.Scene.init(t.allocator, .{});
    defer one.deinit();
    var two = try api.Scene.init(t.allocator, .{});
    defer two.deinit();
    var update = try one.begin_update();
    const obsolete = try update.node(.{ .integer = 1 }, .group, .{});
    update.abort();
    update = try one.begin_update();
    defer update.abort();
    try t.expectError(error.ForeignDraft, update.add(obsolete, .{ .integer = 2 }, .label, .{}));
    update.abort();
    update = try one.begin_update();
    const draft = try control(&update, 1);
    var committed = try update.commit();
    defer committed.deinit();
    const id = try committed.id_for(draft);
    try t.expectError(error.ForeignDomain, two.resolve(id));
    var foreign = try two.snapshot();
    defer foreign.deinit();
    try t.expectError(error.ForeignDraft, foreign.id_for(draft));
    var next = try one.begin_update();
    defer next.abort();
    try t.expectError(error.ForeignDraft, next.request_focus(draft));
}

fn describe(scene: *api.Scene, second: bool) !api.Snapshot {
    var update = try scene.begin_update();
    defer update.abort();
    _ = try update.begin_group(.{ .named = "settings" }, .{ .label = "preferences" });
    if (second) _ = try update.node(.{ .named = "new" }, .label, .{ .label = "allocated first" });
    const name = try update.node(.{ .named = "name" }, .editor, .{ .label = if (second) "new label" else "old label", .focusable = true });
    if (!second) {
        try update.request_focus(name);
        try update.request_capture(name);
    }
    try update.end_group();
    return update.commit();
}
fn allocation_scenario(allocator: std.mem.Allocator) !void {
    var scene = try api.Scene.init(allocator, .{});
    defer scene.deinit();
    var before = try describe(&scene, false);
    defer before.deinit();
    const focused = before.focus().?;
    var after = describe(&scene, true) catch |err| {
        var current = try scene.snapshot();
        defer current.deinit();
        try t.expectEqual(before.revision(), current.revision());
        try t.expectEqualStrings("old label", (try current.resolve(focused)).properties.label);
        try t.expect(focused.eql(current.focus().?));
        try t.expect(focused.eql(current.capture().?));
        return err;
    };
    defer after.deinit();
    try t.expectEqualStrings("old label", (try before.resolve(focused)).properties.label);
    try t.expectEqualStrings("new label", (try after.resolve(focused)).properties.label);
    try t.expect(focused.eql(after.focus().?));
    scene.close();
    try t.expectEqualStrings("new label", (try after.resolve(focused)).properties.label);
}
test "scene every allocation failure retains committed strings IDs and interaction state" {
    try allocation_scenario(t.allocator);
    try t.checkAllAllocationFailures(t.allocator, allocation_scenario, .{});
}

test "scene random keyed reconciliation matches independent live-key history" {
    var scene = try api.Scene.init(t.allocator, .{});
    defer scene.deinit();
    var prng = std.Random.DefaultPrng.init(0xaced);
    const random = prng.random();
    var previous: [32]?api.NodeId = @splat(null);
    var retired: std.ArrayList(api.NodeId) = .empty;
    defer retired.deinit(t.allocator);
    for (0..120) |_| {
        const mask = random.int(u32);
        const rotation = random.uintLessThan(usize, 32);
        var update = try scene.begin_update();
        defer update.abort();
        var drafts: [32]?api.DraftId = @splat(null);
        for (0..32) |i| {
            const key = (i + rotation) % 32;
            if (mask & (@as(u32, 1) << @intCast(key)) != 0) drafts[key] = try control(&update, key);
        }
        var snapshot = try update.commit();
        defer snapshot.deinit();
        for (&previous, drafts) |*old, draft| {
            if (draft) |value| {
                const current = try snapshot.id_for(value);
                if (old.*) |id| try t.expect(id.eql(current));
                for (retired.items) |id| try t.expect(!id.eql(current));
                old.* = current;
            } else if (old.*) |id| {
                try t.expectError(error.StaleNode, scene.resolve(id));
                try retired.append(t.allocator, id);
                old.* = null;
            }
        }
    }
}

test "scene explicit limits and invalid targets preserve published state" {
    try t.expectError(error.InvalidLimits, api.Scene.init(t.allocator, .{ .max_nodes = 0 }));
    var scene = try api.Scene.init(t.allocator, .{ .max_nodes = 1, .max_slots = 1, .max_text_bytes = 3, .max_depth = 1 });
    defer scene.deinit();
    var update = try scene.begin_update();
    defer update.abort();
    const draft = try control(&update, 1);
    try update.request_focus(draft);
    var first = try update.commit();
    defer first.deinit();
    const id = try first.id_for(draft);
    update = try scene.begin_update();
    _ = try update.node(.{ .integer = 1 }, .editor, .{});
    try t.expectError(error.SlotLimit, update.commit());
    try t.expect((try scene.resolve(id)).id.eql(id));
    update.abort();
    update = try scene.begin_update();
    try t.expectError(error.TextLimit, update.node(.{ .integer = 1 }, .label, .{ .label = "long" }));
    update.abort();
    update = try scene.begin_update();
    _ = try control(&update, 1);
    try t.expectError(error.NodeLimit, control(&update, 2));
    update.abort();
    update = try scene.begin_update();
    try t.expectError(error.InvalidProperties, update.node(.{ .integer = 1 }, .label, .{ .focusable = true }));
    update.abort();
    update = try scene.begin_update();
    const disabled = try update.node(.{ .integer = 1 }, .control, .{ .focusable = true, .enabled = false });
    try update.request_focus(disabled);
    try t.expectError(error.InvalidTarget, update.commit());
    update.abort();
    update = try scene.begin_update();
    _ = try update.node(.{ .integer = 1 }, .control, .{ .focusable = true, .enabled = false });
    var inactive = try update.commit();
    defer inactive.deinit();
    try t.expect(id.eql(inactive.nodes()[0].id));
    try t.expect(inactive.focus() == null);
}

test "scene depth leaf parents unbalanced scopes and foreign scope move are checked" {
    var scene = try api.Scene.init(t.allocator, .{ .max_depth = 1 });
    defer scene.deinit();
    var update = try scene.begin_update();
    defer update.abort();
    const root = try update.node(.{ .integer = 1 }, .group, .{});
    try t.expectError(error.DepthLimit, update.add(root, .{ .integer = 2 }, .label, .{}));
    update.abort();
    update = try scene.begin_update();
    const label = try update.node(.{ .integer = 1 }, .label, .{});
    try t.expectError(error.InvalidParent, update.add(label, .{ .integer = 2 }, .label, .{}));
    update.abort();
    update = try scene.begin_update();
    try t.expectError(error.UnbalancedScopes, update.end_group());
    update.abort();
    var other = try api.Scene.init(t.allocator, .{});
    defer other.deinit();
    update = try other.begin_update();
    _ = try update.begin_group(.{ .integer = 1 }, .{});
    const child = try control(&update, 99);
    try update.end_group();
    _ = try update.node(.{ .integer = 2 }, .group, .{});
    try update.request_focus(child);
    var before = try update.commit();
    defer before.deinit();
    const old = try before.id_for(child);
    update = try other.begin_update();
    _ = try update.node(.{ .integer = 1 }, .group, .{});
    _ = try update.begin_group(.{ .integer = 2 }, .{});
    const moved = try control(&update, 99);
    try update.end_group();
    var after = try update.commit();
    defer after.deinit();
    try t.expect(!old.eql(try after.id_for(moved)));
    try t.expect(after.focus() == null);
    try t.expectError(error.StaleNode, other.resolve(old));
}

test "scene retained populated snapshots and clones survive final scene destruction" {
    var scene = try api.Scene.init(t.allocator, .{});
    var snapshot = try describe(&scene, false);
    defer snapshot.deinit();
    var retained = try snapshot.retain();
    defer retained.deinit();
    const id = snapshot.focus().?;
    scene.deinit();
    try t.expectEqualStrings("old label", (try snapshot.resolve(id)).properties.label);
    try t.expectEqualStrings("old label", (try retained.resolve(id)).properties.label);
}

test "scene finished builder methods never inspect released staging storage" {
    var scene = try api.Scene.init(t.allocator, .{});
    defer scene.deinit();
    var update = try scene.begin_update();
    _ = try update.begin_group(.{ .integer = 1 }, .{});
    update.abort();
    try t.expectError(error.UpdateFinished, update.node(.{ .integer = 2 }, .label, .{}));
    try t.expectError(error.UpdateFinished, update.begin_group(.{ .integer = 2 }, .{}));
    try t.expectError(error.UpdateFinished, update.end_group());
    try t.expectError(error.UpdateFinished, update.request_focus(null));
    try t.expectError(error.UpdateFinished, update.request_capture(null));
    try t.expectError(error.UpdateFinished, update.commit());
}

test "scene ancestor disablement clears retained focus and capture" {
    var owner = try api.Scene.init(t.allocator, .{});
    defer owner.deinit();
    var update = try owner.begin_update();
    defer update.abort();
    _ = try update.begin_group(.{ .integer = 0 }, .{});
    const node = try control(&update, 1);
    try update.end_group();
    try update.request_focus(node);
    try update.request_capture(node);
    var before = try update.commit();
    defer before.deinit();
    update = try owner.begin_update();
    _ = try update.begin_group(.{ .integer = 0 }, .{ .enabled = false });
    _ = try control(&update, 1);
    try update.end_group();
    var disabled = try update.commit();
    defer disabled.deinit();
    try t.expect(disabled.focus() == null and disabled.capture() == null);
}
