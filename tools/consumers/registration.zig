//! Runtime-input checked document routing without native/provider libraries.
const std = @import("std");
const text = @import("zdl").text;
pub fn main(init: std.process.Init) !void {
    std.debug.print("mode={s}\n", .{@tagName(@import("builtin").mode)});
    var args = std.process.Args.Iterator.init(init.minimal.args);
    defer args.deinit();
    _ = args.next();
    const input = args.next() orelse "bound document";
    var doc = try text.Document.init(init.gpa, input, .{});
    defer doc.deinit();
    var registry = try text.Registry.init(init.gpa, .{});
    defer registry.deinit();
    var view = try registry.register(&doc);
    defer view.close();
    var before = try registry.snapshot(view.handle());
    defer before.deinit();
    const target: text.registry.Target = .{ .registration = view.handle(), .revision = before.revision() };
    var edit = try registry.replace(target, .{ .start_byte = before.text().len, .end_byte = before.text().len }, "!", .{});
    defer edit.deinit();
    var undo = try registry.undo(.{ .registration = view.handle(), .revision = edit.snapshot.revision() });
    defer undo.deinit();
    var redo = try registry.redo(.{ .registration = view.handle(), .revision = undo.revision() });
    defer redo.deinit();
    if (!std.mem.eql(u8, undo.text(), input) or !std.mem.eql(u8, redo.text(), edit.snapshot.text())) return error.HistoryMismatch;
    view.close();
    if (registry.replace(target, .{ .start_byte = 0, .end_byte = 0 }, "stale", .{})) |value| {
        var unexpected = value;
        unexpected.deinit();
        return error.AcceptedStaleView;
    } else |err| if (err != error.StaleRegistration) return err;
    var rebound = try registry.register(&doc);
    defer rebound.close();
    view.close(); // Old owner cannot invalidate a reused generation.
    var live = try registry.snapshot(rebound.handle());
    defer live.deinit();
    registry.close();
    if (!std.mem.eql(u8, live.text(), edit.snapshot.text())) return error.LostSnapshot;
    std.debug.print("registration bytes={d} revision={d} old_generation={d} new_generation={d}\n", .{ live.text().len, live.revision().value, target.registration.generation, rebound.handle().generation });
}
