//! Runtime-input queued semantic delivery; no native callbacks/libraries/libc.
const std = @import("std");
const ui = @import("zdl").ui;
const actions = ui.action_queue;
pub fn main(init: std.process.Init) !void {
    std.debug.print("mode={s}\n", .{@tagName(@import("builtin").mode)});
    var args = std.process.Args.Iterator.init(init.minimal.args);
    defer args.deinit();
    _ = args.next();
    const count = if (args.next()) |arg| try std.fmt.parseInt(u32, arg, 10) else 97;
    if (count == 0 or count > 1024) return error.InvalidCount;
    const Model = ui.with_semantics(.{});
    var owner = try Model.Scene.init(init.gpa, .{});
    defer owner.deinit();
    var update = try owner.begin_update();
    defer update.abort();
    const root = try update.semantic_node(null, .{ .integer = 0 }, .{ .role = .group }, null);
    const button = try update.semantic_node(root, .{ .integer = 1 }, .{ .role = .button, .name = "Activate", .actions = .{ .activate = true } }, null);
    var source = try update.commit();
    defer source.deinit();
    const view = try source.semantic(try source.semantic_id_for(button));
    var queue = try actions.Queue.init(init.gpa, .{ .max_entries = count + 1 });
    defer queue.deinit();
    const tickets = try init.gpa.alloc(actions.Ticket, count + 1);
    defer init.gpa.free(tickets);
    for (tickets[0..count]) |*ticket| ticket.* = try queue.enqueue(.{ .target = view.id, .revision = view.revision, .payload = .activate, .source = .keyboard });
    var input = [_]u8{ 'c', 'o', 'p', 'y' };
    tickets[count] = try queue.enqueue(.{ .target = view.id, .revision = view.revision, .payload = .{ .replace_text = .{
        .revision = .{ .document = @fromBackingInt(1), .value = 0 },
        .range = .{ .start_byte = 0, .end_byte = 0 },
        .text = &input,
    } } });
    @memset(&input, 'x');
    var handled: usize = 0;
    while (try queue.take()) |value| {
        var delivery = value;
        defer delivery.deinit();
        const request = try delivery.request();
        if (request.payload == .replace_text and !std.mem.eql(u8, request.payload.replace_text.text, "copy")) return error.PayloadChanged;
        _ = owner.validate_semantic_action(request) catch |err| {
            try delivery.complete(.{ .rejected = err });
            continue;
        };
        handled += 1;
        try delivery.complete(.handled);
    }
    if (handled != count or (try queue.status(tickets[count])).final.rejected != error.UnsupportedSemanticAction) return error.WrongOutcome;
    for (tickets) |ticket| try queue.forget(ticket);
    if (queue.usage().entries != 0 or queue.usage().payload_bytes != 0) return error.LeakedPayload;
    try document_action(init.gpa, count);
    std.debug.print("actions handled={d} rejected=1 receipts={d}\n", .{ handled, queue.usage().receipts });
}

fn document_action(allocator: std.mem.Allocator, count: u32) !void {
    const text = @import("zdl").text;
    var document = try text.Document.init(allocator, "before", .{});
    defer document.deinit();
    var documents = try text.Registry.init(allocator, .{});
    defer documents.deinit();
    var registration = try documents.register(&document);
    defer registration.deinit();
    var initial = try document.snapshot();
    defer initial.deinit();
    const Model = ui.with_semantics(.{});
    var owner = try Model.Scene.init(allocator, .{});
    defer owner.deinit();
    var update = try owner.begin_update();
    defer update.abort();
    _ = try update.semantic_node(null, .{ .integer = count }, .{
        .role = .editor,
        .name = "Consumer",
        .actions = .{ .replace_text = true },
        .document = .{ .snapshot = initial, .registration = registration.handle() },
    }, null);
    var source = try update.commit();
    defer source.deinit();
    const view = source.semantic_at(0).?;
    var queue = try actions.Queue.init(allocator, .{});
    defer queue.deinit();
    const ticket = try queue.enqueue(.{ .target = view.id, .revision = view.revision, .payload = .{ .replace_text = .{
        .revision = initial.revision(),
        .range = .{ .start_byte = 0, .end_byte = 6 },
        .text = "after",
    } } });
    var delivery = (try queue.take()).?;
    defer delivery.deinit();
    var result = try ui.document_actions.dispatch(&owner, &documents, &delivery, .{});
    defer result.deinit();
    if (!std.mem.eql(u8, result.snapshot().text(), "after") or (try queue.status(ticket)).final != .handled) return error.DocumentActionFailed;
}
