const std = @import("std");
const ui = @import("ui.zig");
const s = ui.semantics;
const d = @import("../text/document.zig");
const reg = @import("../text/registry.zig");
const t = std.testing;
const Model = ui.with_semantics(.{});

fn button_scene(owner: *Model.Scene, label: []const u8, enabled: bool) !Model.Snapshot {
    var update = try owner.begin_update();
    defer update.abort();
    const button = try update.node(.{ .integer = 1 }, .control, .{ .focusable = true });
    const root = try update.semantic_node(null, .{ .integer = 0 }, .{ .role = .window, .name = "Window", .enabled = enabled }, null);
    _ = try update.semantic_node(root, .{ .integer = 1 }, .{ .role = .button, .name = label, .actions = .{ .activate = true, .focus = true } }, button);
    return update.commit();
}
test "semantic identity and per-node revision survive unrelated scene updates" {
    var owner = try Model.Scene.init(t.allocator, .{});
    defer owner.deinit();
    var first = try button_scene(&owner, "Save", true);
    defer first.deinit();
    const button = first.semantic_at(1).?;
    const request: s.Request = .{ .target = button.id, .revision = button.revision, .payload = .activate, .source = .assistive };
    var second = try button_scene(&owner, "Save", true);
    defer second.deinit();
    try t.expect(std.meta.eql(button.id, second.semantic_at(1).?.id));
    try t.expectEqual(button.revision, second.semantic_at(1).?.revision);
    const action = try owner.validate_semantic_action(request);
    try t.expectEqual(s.Source.assistive, action.source);
    try t.expectEqual(@as(u64, 1), action.model_key.integer);
    _ = try owner.validate_semantic_action(request); // validation does not collapse repeated activations
    var changed = try button_scene(&owner, "Store", true);
    defer changed.deinit();
    try t.expect(std.meta.eql(button.id, changed.semantic_at(1).?.id));
    try t.expectError(error.StaleSemanticRevision, owner.validate_semantic_action(request));
    try t.expectEqualStrings("Save", (try first.semantic(button.id)).name);
    var disabled = try button_scene(&owner, "Store", false);
    defer disabled.deinit();
    const current = disabled.semantic_at(1).?;
    try t.expectError(error.DisabledSemantic, owner.validate_semantic_action(.{ .target = current.id, .revision = current.revision, .payload = .activate }));
    owner.close();
    try t.expectError(error.Closed, owner.validate_semantic_action(request));
    try t.expectEqualStrings("Save", (try first.semantic(button.id)).name);
}

test "semantic relationships resolve copied labels and reject cycles atomically" {
    var owner = try Model.Scene.init(t.allocator, .{});
    defer owner.deinit();
    var update = try owner.begin_update();
    defer update.abort();
    const root = try update.semantic_node(null, .{ .integer = 0 }, .{ .role = .group }, null);
    var text = [_]u8{ 'L', 'a', 'b', 'e', 'l' };
    const label = try update.semantic_node(root, .{ .integer = 1 }, .{ .role = .label, .name = &text }, null);
    const button = try update.semantic_node(root, .{ .integer = 2 }, .{ .role = .button, .actions = .{ .activate = true } }, null);
    try update.semantic_relations(button, .{ .labelled_by = label });
    @memset(&text, 'x');
    var before = try update.commit();
    defer before.deinit();
    const id = try before.semantic_id_for(button);
    try t.expectEqualStrings("Label", (try before.semantic(id)).name);
    update = try owner.begin_update();
    const a = try update.semantic_node(null, .{ .integer = 0 }, .{ .role = .group }, null);
    const b = try update.semantic_node(a, .{ .integer = 1 }, .{ .role = .label, .name = "B" }, null);
    try update.semantic_relations(a, .{ .labelled_by = b });
    try update.semantic_relations(b, .{ .described_by = a });
    try t.expectError(error.RelationshipCycle, update.commit());
    update.abort();
    var current = try owner.snapshot();
    defer current.deinit();
    try t.expectEqual(before.revision(), current.revision());
    try t.expectEqualStrings("Label", (try current.semantic(id)).name);
    update = try owner.begin_update();
    const foreign = try update.semantic_node(null, .{ .integer = 0 }, .{ .role = .group }, null);
    try t.expectError(error.ForeignSemanticDraft, update.semantic_relations(foreign, .{ .labelled_by = label }));
}

fn collection(owner: *Model.Scene, visible: u64, count: u32) !Model.Snapshot {
    var update = try owner.begin_update();
    defer update.abort();
    const node = try update.node(.{ .integer = visible }, .control, .{ .focusable = true });
    const root = try update.semantic_node(null, .{ .integer = 0 }, .{ .role = .collection, .name = "Results", .collection_count = count }, null);
    for (0..count) |position| {
        var buffer: [32]u8 = undefined;
        const name = try std.fmt.bufPrint(&buffer, "Row {d}", .{position});
        _ = try update.semantic_node(root, .{ .integer = position }, .{ .role = .item, .name = name, .position = position, .actions = .{ .focus = true, .reveal = true, .activate = true } }, if (position == visible) node else null);
    }
    return update.commit();
}
test "semantic virtual items retain logical identity independently of node materialization" {
    var owner = try Model.Scene.init(t.allocator, .{});
    defer owner.deinit();
    var first = try collection(&owner, 7, 1000);
    defer first.deinit();
    const offscreen = first.semantic_at(9).?;
    const request: s.Request = .{ .target = offscreen.id, .revision = offscreen.revision, .payload = .focus };
    const resolved = try owner.validate_semantic_action(request);
    try t.expect(resolved.needs_materialization and resolved.materialized == null);
    try t.expectEqual(@as(u64, 8), resolved.model_key.integer);
    const previous_materialized = first.semantic_at(8).?;
    var second = try collection(&owner, 14, 1000);
    defer second.deinit();
    try t.expectEqual(@as(usize, 1), second.nodes().len);
    try t.expect(second.semantic_at(1000) != null and second.semantic_at(1001) == null);
    try t.expect(std.meta.eql(offscreen.id, second.semantic_at(9).?.id));
    _ = try owner.validate_semantic_action(request);
    try t.expectError(error.StaleSemanticRevision, owner.validate_semantic_action(.{ .target = previous_materialized.id, .revision = previous_materialized.revision, .payload = .focus }));
    try t.expect((try second.semantic(previous_materialized.id)).materialized == null);
}

test "semantic document views own snapshots and route exact-revision text actions" {
    var doc = try d.Document.init(t.allocator, "aébc", .{});
    var alive = true;
    defer if (alive) doc.deinit();
    var registry = try reg.Registry.init(t.allocator, .{});
    defer registry.deinit();
    var registration = try registry.register(&doc);
    defer registration.close();
    var source = try doc.snapshot();
    defer source.deinit();
    var owner = try Model.Scene.init(t.allocator, .{});
    defer owner.deinit();
    var update = try owner.begin_update();
    defer update.abort();
    const editor = try update.node(.{ .integer = 1 }, .editor, .{ .focusable = true });
    try update.request_focus(editor);
    const root = try update.semantic_node(null, .{ .integer = 0 }, .{ .role = .window, .name = "Editor" }, null);
    const field = try update.semantic_node(root, .{ .integer = 1 }, .{ .role = .editor, .name = "Name", .actions = .{ .focus = true, .replace_text = true, .set_selection = true }, .document = .{ .snapshot = source, .registration = registration.handle() } }, editor);
    var before = try update.commit();
    defer before.deinit();
    const view = try before.semantic(try before.semantic_id_for(field));
    try t.expect(view.focused);
    const request: s.Request = .{ .target = view.id, .revision = view.revision, .payload = .{ .replace_text = .{ .revision = source.revision(), .range = .{ .start_byte = 0, .end_byte = 1 }, .text = "X" } } };
    const action = try owner.validate_semantic_action(request);
    var result = try registry.replace(action.document.?, request.payload.replace_text.range, request.payload.replace_text.text, .{});
    defer result.deinit();
    _ = try owner.validate_semantic_action(request); // bridge snapshot still historical
    try t.expectError(error.StaleRevision, registry.replace(action.document.?, request.payload.replace_text.range, "duplicate", .{}));
    try t.expectError(error.InvalidRange, owner.validate_semantic_action(.{ .target = view.id, .revision = view.revision, .payload = .{ .replace_text = .{ .revision = source.revision(), .range = .{ .start_byte = 2, .end_byte = 3 }, .text = "x" } } }));
    update = try owner.begin_update();
    const next_editor = try update.node(.{ .integer = 1 }, .editor, .{ .focusable = true });
    const next_root = try update.semantic_node(null, .{ .integer = 0 }, .{ .role = .window, .name = "Editor" }, null);
    const protected = try update.semantic_node(next_root, .{ .integer = 1 }, .{ .role = .editor, .name = "Name", .actions = .{ .focus = true }, .document = .{ .snapshot = result.snapshot, .registration = registration.handle(), .protected = true } }, next_editor);
    var masked = try update.commit();
    defer masked.deinit();
    const value = (try masked.semantic(try masked.semantic_id_for(protected))).text.?;
    try t.expectEqualStrings("", value.value);
    try t.expect(value.selection == null and value.protected);
    registration.close();
    doc.deinit();
    alive = false;
    try t.expectEqualStrings("aébc", (try before.semantic(view.id)).text.?.value);
}

test "semantic invalid roles relations collections and geometry never publish" {
    var owner = try Model.Scene.init(t.allocator, .{});
    defer owner.deinit();
    var initial = try button_scene(&owner, "Original", true);
    defer initial.deinit();
    var update = try owner.begin_update();
    defer update.abort();
    const root = try update.semantic_node(null, .{ .integer = 0 }, .{ .role = .group }, null);
    _ = try update.semantic_node(root, .{ .integer = 1 }, .{ .role = .button, .actions = .{ .activate = true } }, null);
    try t.expectError(error.UnnamedControl, update.commit());
    update.abort();
    update = try owner.begin_update();
    try t.expectError(error.InvalidSemantics, update.semantic_node(null, .{ .integer = 0 }, .{ .role = .button, .name = "Bad", .actions = .{ .set_number = true } }, null));
    update.abort();
    update = try owner.begin_update();
    try t.expectError(error.InvalidSemantics, update.semantic_node(null, .{ .integer = 0 }, .{ .role = .group, .bounds = .{ .x = std.math.nan(f64), .y = 0, .width = 1, .height = 1 } }, null));
    update.abort();
    update = try owner.begin_update();
    _ = try update.semantic_node(null, .{ .integer = 0 }, .{ .role = .collection, .collection_count = 100000 }, null);
    try t.expectError(error.InvalidCollection, update.commit());
    update.abort(); // Cannot advertise omitted virtual items.
    update = try owner.begin_update();
    const a = try update.semantic_node(null, .{ .integer = 0 }, .{ .role = .group }, null);
    const b = try update.semantic_node(a, .{ .integer = 1 }, .{ .role = .group }, null);
    try update.semantic_relations(b, .{ .active_descendant = a });
    try t.expectError(error.InvalidRelationship, update.commit());
    update.abort();
    var current = try owner.snapshot();
    defer current.deinit();
    try t.expectEqual(initial.revision(), current.revision());
    try t.expectEqualStrings("Original", current.semantic_at(1).?.name);
}

test "semantic numeric actions and materialized ancestor disablement use current availability" {
    var owner = try Model.Scene.init(t.allocator, .{});
    defer owner.deinit();
    var update = try owner.begin_update();
    defer update.abort();
    _ = try update.begin_group(.{ .integer = 0 }, .{ .enabled = false });
    const slider = try update.node(.{ .integer = 1 }, .control, .{ .focusable = true });
    try update.end_group();
    const root = try update.semantic_node(null, .{ .integer = 0 }, .{ .role = .group }, null);
    const logical = try update.semantic_node(root, .{ .integer = 1 }, .{ .role = .slider, .name = "Volume", .number = .{ .value = 0.5, .min = 0, .max = 1 }, .actions = .{ .set_number = true } }, slider);
    var first = try update.commit();
    defer first.deinit();
    const view = try first.semantic(try first.semantic_id_for(logical));
    try t.expect(!view.enabled);
    try t.expectError(error.DisabledSemantic, owner.validate_semantic_action(.{ .target = view.id, .revision = view.revision, .payload = .{ .set_number = 0.6 } }));
    update = try owner.begin_update();
    const parent = try update.semantic_node(null, .{ .integer = 0 }, .{ .role = .group }, null);
    const number = try update.semantic_node(parent, .{ .integer = 1 }, .{ .role = .slider, .name = "Volume", .number = .{ .value = 0.5, .min = 0, .max = 1 }, .actions = .{ .set_number = true } }, null);
    var next = try update.commit();
    defer next.deinit();
    const current = try next.semantic(try next.semantic_id_for(number));
    try t.expectError(error.InvalidSemantics, owner.validate_semantic_action(.{ .target = current.id, .revision = current.revision, .payload = .{ .set_number = 2 } }));
    try t.expectError(error.InvalidSemantics, owner.validate_semantic_action(.{ .target = current.id, .revision = current.revision, .payload = .{ .set_number = std.math.nan(f64) } }));
    _ = try owner.validate_semantic_action(.{ .target = current.id, .revision = current.revision, .payload = .{ .set_number = 0.75 } });
}

const Stateful = ui.with_semantics(.{ .count = ui.state.Value(u64) });
fn stateful(owner: *Stateful.Scene, text: d.Snapshot, handle: reg.Handle, changed: bool) !Stateful.Snapshot {
    var update = try owner.begin_update();
    defer update.abort();
    const node = try update.node(.{ .named = "field" }, .editor, .{ .focusable = true });
    try update.set_state("count", node, &@as(u64, if (changed) 2 else 1));
    try update.request_focus(node);
    const root = try update.semantic_node(null, .{ .named = "root" }, .{ .role = .window, .name = "Settings" }, null);
    _ = try update.semantic_node(root, .{ .named = "field" }, .{ .role = .editor, .name = if (changed) "Changed" else "Original", .document = .{ .snapshot = text, .registration = handle }, .actions = .{ .focus = true, .replace_text = true } }, node);
    return update.commit();
}
fn failures(allocator: std.mem.Allocator) !void {
    var doc = try d.Document.init(allocator, "retained text", .{});
    defer doc.deinit();
    var registry = try reg.Registry.init(allocator, .{});
    defer registry.deinit();
    var registration = try registry.register(&doc);
    defer registration.close();
    var text = try doc.snapshot();
    defer text.deinit();
    var owner = try Stateful.Scene.init(allocator, .{});
    defer owner.deinit();
    var before = try stateful(&owner, text, registration.handle(), false);
    defer before.deinit();
    const focused = before.focus().?;
    const semantic = before.semantic_at(1).?;
    var after = stateful(&owner, text, registration.handle(), true) catch |err| {
        var current = try owner.snapshot();
        defer current.deinit();
        try t.expectEqual(before.revision(), current.revision());
        try t.expectEqualStrings("Original", (try current.semantic(semantic.id)).name);
        try t.expectEqualStrings("retained text", (try current.semantic(semantic.id)).text.?.value);
        try t.expectEqual(@as(u64, 1), (try current.state("count", focused)).?.*);
        _ = try owner.validate_semantic_action(.{ .target = semantic.id, .revision = semantic.revision, .payload = .focus });
        return err;
    };
    defer after.deinit();
    try t.expectEqualStrings("Original", (try before.semantic(semantic.id)).name);
    try t.expectEqualStrings("Changed", (try after.semantic(semantic.id)).name);
    try t.expectEqual(@as(u64, 2), (try after.state("count", focused)).?.*);
    owner.close();
    try t.expectEqualStrings("retained text", (try after.semantic(semantic.id)).text.?.value);
}
test "semantic all allocation failures preserve widget state focus strings and document leases" {
    try failures(t.allocator);
    try t.checkAllAllocationFailures(t.allocator, failures, .{});
}

test "semantic duplicate foreign and stale identities are rejected independently of node slots" {
    var one = try Model.Scene.init(t.allocator, .{});
    defer one.deinit();
    var two = try Model.Scene.init(t.allocator, .{});
    defer two.deinit();
    var first = try button_scene(&one, "Save", true);
    defer first.deinit();
    const old = first.semantic_at(1).?;
    try t.expectError(error.ForeignSemantic, two.validate_semantic_action(.{ .target = old.id, .revision = old.revision, .payload = .activate }));
    var update = try one.begin_update();
    defer update.abort();
    _ = try update.semantic_node(null, .{ .integer = 0 }, .{ .role = .group }, null);
    try t.expectError(error.DuplicateSemanticKey, update.semantic_node(null, .{ .integer = 0 }, .{ .role = .group }, null));
    update.abort();
    update = try one.begin_update();
    var empty = try update.commit();
    empty.deinit();
    var replacement = try button_scene(&one, "Save", true);
    defer replacement.deinit();
    try t.expect(!std.meta.eql(old.id, replacement.semantic_at(1).?.id));
    try t.expectError(error.StaleSemantic, one.validate_semantic_action(.{ .target = old.id, .revision = old.revision, .payload = .activate }));
}

test "semantic long naming chains resolve iteratively without recursive stack growth" {
    var owner = try Model.Scene.init(t.allocator, .{});
    defer owner.deinit();
    var update = try owner.begin_update();
    defer update.abort();
    const root = try update.semantic_node(null, .{ .integer = 0 }, .{ .role = .group }, null);
    const count = 3000;
    const labels = try t.allocator.alloc(s.Draft, count);
    defer t.allocator.free(labels);
    for (labels, 0..) |*label, i| label.* = try update.semantic_node(root, .{ .integer = i }, .{ .role = .label, .name = if (i == count - 1) "Terminal name" else "" }, null);
    for (0..count - 1) |i| try update.semantic_relations(labels[i], .{ .labelled_by = labels[i + 1] });
    var snapshot = try update.commit();
    defer snapshot.deinit();
    try t.expectEqualStrings("Terminal name", (try snapshot.semantic(try snapshot.semantic_id_for(labels[0]))).name);
}

test "semantic identifier revision and configured limits never wrap or partially publish" {
    var owner = try Model.Scene.init(t.allocator, .{});
    defer owner.deinit();
    var before = try button_scene(&owner, "Name", true);
    defer before.deinit();
    const id = before.semantic_at(1).?.id;
    const tree = &owner.core.current.?.semantic_tree;
    @constCast(tree.nodes)[1].revision = std.math.maxInt(u64);
    try t.expectError(error.SemanticRevisionExhausted, button_scene(&owner, "Changed", true));
    @constCast(tree.nodes)[1].revision = 1;
    tree.next_id = std.math.maxInt(u64);
    var update = try owner.begin_update();
    defer update.abort();
    _ = try update.semantic_node(null, .{ .integer = 99 }, .{ .role = .group }, null);
    try t.expectError(error.SemanticIdExhausted, update.commit());
    update.abort();
    var current = try owner.snapshot();
    defer current.deinit();
    try t.expectEqualStrings("Name", (try current.semantic(id)).name);
    var limited = try Model.Scene.init(t.allocator, .{ .max_semantic_nodes = 1, .max_semantic_bytes = 4 });
    defer limited.deinit();
    var attempt = try limited.begin_update();
    defer attempt.abort();
    try t.expectError(error.SemanticLimit, attempt.semantic_node(null, .{ .integer = 0 }, .{ .role = .label, .name = "excess" }, null));
    attempt.abort();
    attempt = try limited.begin_update();
    _ = try attempt.semantic_node(null, .{ .integer = 0 }, .{ .role = .group }, null);
    try t.expectError(error.SemanticLimit, attempt.semantic_node(null, .{ .integer = 1 }, .{ .role = .group }, null));
}

test "semantic focus coverage and protected edit capabilities are explicit publication gates" {
    var owner = try Model.Scene.init(t.allocator, .{});
    defer owner.deinit();
    var update = try owner.begin_update();
    defer update.abort();
    const control = try update.node(.{ .integer = 1 }, .control, .{ .focusable = true });
    try update.request_focus(control);
    _ = try update.semantic_node(null, .{ .integer = 0 }, .{ .role = .group }, null);
    try t.expectError(error.SemanticFocusMissing, update.commit());
    update.abort();
    var doc = try d.Document.init(t.allocator, "private", .{});
    defer doc.deinit();
    var registry = try reg.Registry.init(t.allocator, .{});
    defer registry.deinit();
    var registration = try registry.register(&doc);
    defer registration.close();
    var snapshot = try doc.snapshot();
    defer snapshot.deinit();
    update = try owner.begin_update();
    try t.expectError(error.InvalidSemantics, update.semantic_node(null, .{ .integer = 0 }, .{ .role = .editor, .name = "Protected", .actions = .{ .replace_text = true }, .document = .{ .snapshot = snapshot, .registration = registration.handle(), .protected = true } }, null));
}
