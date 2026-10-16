//! Runtime-input retained scene consumer: no GUI provider, OS backend or libc.
const std = @import("std");
const zdl = @import("zdl");
pub fn main(init: std.process.Init) !void {
    std.debug.print("mode={s}\n", .{@tagName(@import("builtin").mode)});
    var args = std.process.Args.Iterator.init(init.minimal.args);
    defer args.deinit();
    _ = args.next();
    const count = if (args.next()) |value| try std.fmt.parseInt(u32, value, 10) else 97;
    if (count == 0 or count > 100_000) return error.InvalidCount;
    var scene = try zdl.ui.Scene.init(init.gpa, .{});
    defer scene.deinit();
    var update = try scene.begin_update();
    defer update.abort();
    for (0..count) |key| {
        const draft = try update.node(.{ .integer = key }, .control, .{ .focusable = true });
        if (key == 0) try update.request_focus(draft);
    }
    var first = try update.commit();
    defer first.deinit();
    const focused = first.focus().?;
    update = try scene.begin_update();
    for (0..count) |key| _ = try update.node(.{ .integer = count - 1 - key }, .control, .{ .focusable = true });
    var second = try update.commit();
    defer second.deinit();
    if (!second.focus().?.eql(focused) or !second.nodes()[count - 1].id.eql(focused)) return error.IdentityChanged;
    for (second.nodes()) |node| if (!(try first.resolve(node.id)).key.eql(node.key)) return error.KeyMismatch;
    scene.close();
    if (!(try second.resolve(focused)).id.eql(focused)) return error.SnapshotExpired;
    std.debug.print("scene nodes={d} revision={d} focus_slot={d}\n", .{ count, second.revision(), focused.slot });
}
