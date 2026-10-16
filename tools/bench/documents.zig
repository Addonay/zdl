//! Contiguous document edit/undo/redo baseline, excluding shaping/GUI/event cost.
const std = @import("std");
const api = @import("zdl").text.document;
const steps = 32;
fn measure(allocator: std.mem.Allocator, io: std.Io, size: usize) !struct { edits: u64, undo: u64, redo: u64, history_bytes: usize } {
    const input = try allocator.alloc(u8, size);
    defer allocator.free(input);
    @memset(input, 'a');
    var doc = try api.Document.init(allocator, input, .{ .max_bytes = size + steps, .max_history_entries = 32 });
    defer doc.deinit();
    var original = try doc.snapshot();
    defer original.deinit();
    const start = std.Io.Clock.awake.now(io).nanoseconds;
    for (0..steps) |_| {
        var edit = try doc.replace(try doc.current_revision(), .{ .start_byte = 0, .end_byte = 0 }, "b", .{});
        edit.deinit();
    }
    const edited = std.Io.Clock.awake.now(io).nanoseconds;
    var final = try doc.snapshot();
    defer final.deinit();
    if (final.text().len != size + steps or !std.mem.eql(u8, final.text()[steps..], input)) return error.TextMismatch;
    for (final.text()[0..steps]) |byte| if (byte != 'b') return error.InsertMismatch;
    if (!std.mem.eql(u8, original.text(), input)) return error.SnapshotChanged;
    const undo_start = std.Io.Clock.awake.now(io).nanoseconds;
    var undo = try doc.undo(try doc.current_revision());
    defer undo.deinit();
    const undone = std.Io.Clock.awake.now(io).nanoseconds;
    var redo = try doc.redo(try doc.current_revision());
    defer redo.deinit();
    const redone = std.Io.Clock.awake.now(io).nanoseconds;
    if (undo.text().len != size + steps - 1 or !std.mem.eql(u8, redo.text(), final.text())) return error.HistoryMismatch;
    const usage = try doc.history_usage();
    if (usage.logical_bytes > 8 * 1024 * 1024 or usage.undo_groups > 32) return error.UnboundedHistory;
    return .{ .edits = @intCast(edited - start), .undo = @intCast(undone - undo_start), .redo = @intCast(redone - undone), .history_bytes = usage.logical_bytes };
}
pub fn main(init: std.process.Init) !void {
    _ = try measure(init.gpa, init.io, 32);
    inline for (.{ 1024, 65536, 1048576 }) |size| {
        var edit_times: [3]u64 = undefined;
        var undo_times: [3]u64 = undefined;
        var redo_times: [3]u64 = undefined;
        var history_bytes: usize = 0;
        for (0..3) |trial| {
            const result = try measure(init.gpa, init.io, size);
            edit_times[trial] = result.edits;
            undo_times[trial] = result.undo;
            redo_times[trial] = result.redo;
            history_bytes = result.history_bytes;
        }
        std.mem.sort(u64, &edit_times, {}, std.sort.asc(u64));
        std.mem.sort(u64, &undo_times, {}, std.sort.asc(u64));
        std.mem.sort(u64, &redo_times, {}, std.sort.asc(u64));
        std.debug.print("initial_bytes={d} edits={d} edit_batch_ns={any} undo_ns={any} redo_ns={any} logical_history_bytes={d}\n", .{ size, steps, edit_times, undo_times, redo_times, history_bytes });
    }
}
