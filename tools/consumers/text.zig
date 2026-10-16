//! Runtime-input document editing/undo/retained snapshots without libc or GUI.
const std = @import("std");
const text = @import("zdl").text;
pub fn main(init: std.process.Init) !void {
    std.debug.print("mode={s}\n", .{@tagName(@import("builtin").mode)});
    var args = std.process.Args.Iterator.init(init.minimal.args);
    defer args.deinit();
    _ = args.next();
    const source = args.next() orelse "aé\r\nb";
    var document = try text.Document.init(init.gpa, source, .{ .newlines = .lf });
    defer document.deinit();
    var initial = try document.snapshot();
    defer initial.deinit();
    var edited = try document.replace(initial.revision(), .{ .start_byte = initial.text().len, .end_byte = initial.text().len }, "!", .{});
    defer edited.deinit();
    var undo = try document.undo(try document.current_revision());
    defer undo.deinit();
    if (!std.mem.eql(u8, initial.text(), undo.text())) return error.UndoMismatch;
    var redo = try document.redo(try document.current_revision());
    defer redo.deinit();
    if (!std.mem.eql(u8, edited.snapshot.text(), redo.text())) return error.RedoMismatch;
    if (document.replace(initial.revision(), .{ .start_byte = 0, .end_byte = 0 }, "duplicate", .{})) |value| {
        var unexpected = value;
        unexpected.deinit();
        return error.AcceptedStaleEdit;
    } else |err| if (err != error.StaleRevision) return err;
    document.close();
    std.debug.print("text bytes={d} revision={d} hash={x}\n", .{ redo.text().len, redo.revision().value, std.hash.Wyhash.hash(0, redo.text()) });
}
