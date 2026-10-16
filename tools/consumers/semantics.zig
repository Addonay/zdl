//! Runtime-input logical collection/action consumer: no native accessibility/libc.
const std = @import("std");
const ui = @import("zdl").ui;
const Model = ui.with_semantics(.{});
fn describe(owner: *Model.Scene, count: u32, visible: u32) !Model.Snapshot {
    var update = try owner.begin_update();
    defer update.abort();
    const node = try update.node(.{ .integer = visible }, .control, .{ .focusable = true });
    const root = try update.semantic_node(null, .{ .integer = 0 }, .{ .role = .collection, .name = "Results", .collection_count = count }, null);
    for (0..count) |i| {
        var buffer: [32]u8 = undefined;
        const name = try std.fmt.bufPrint(&buffer, "Result {d}", .{i});
        _ = try update.semantic_node(root, .{ .integer = i }, .{ .role = .item, .name = name, .position = i, .actions = .{ .activate = true, .focus = true, .reveal = true } }, if (i == visible) node else null);
    }
    return update.commit();
}
pub fn main(init: std.process.Init) !void {
    std.debug.print("mode={s}\n", .{@tagName(@import("builtin").mode)});
    var args = std.process.Args.Iterator.init(init.minimal.args);
    defer args.deinit();
    _ = args.next();
    const count = if (args.next()) |value| try std.fmt.parseInt(u32, value, 10) else 97;
    if (count < 3 or count > 100000) return error.InvalidCount;
    var owner = try Model.Scene.init(init.gpa, .{});
    defer owner.deinit();
    var first = try describe(&owner, count, 0);
    defer first.deinit();
    const logical = first.semantic_at(2).?;
    const request: ui.semantics.Request = .{ .target = logical.id, .revision = logical.revision, .payload = .focus, .source = .assistive };
    if (!(try owner.validate_semantic_action(request)).needs_materialization) return error.MissingReveal;
    var second = try describe(&owner, count, count - 1);
    defer second.deinit();
    _ = try owner.validate_semantic_action(request);
    if (!std.meta.eql(second.semantic_at(2).?.id, logical.id)) return error.IdentityChanged;
    owner.close();
    if ((try first.semantic(logical.id)).position != 1) return error.SnapshotExpired;
    std.debug.print("semantics logical={d} materialized={d} revision={d}\n", .{ count, second.nodes().len, logical.revision });
}
