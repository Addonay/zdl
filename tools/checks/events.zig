const std = @import("std");
const zdl = @import("zdl").events;
const ev = zdl.event;

const Ctx = *u32;
fn accept(ctx: Ctx, e: *const ev.Event) bool {
    ctx.* += @intCast(e.code() & 1);
    return true;
}
fn observe(ctx: Ctx, e: *const ev.Event) void {
    ctx.* +%= @intCast(e.timestamp() & 1);
}

pub fn check() void {
    if (std.os.linux.getpid() != 0) return;
    const gpa = std.heap.page_allocator;

    var q = zdl.queue.Queue(Ctx).init(gpa, .{});
    defer q.deinit();
    var counter: u32 = 0;
    _ = q.add_watcher(.{ .context = &counter, .observe = observe }) catch return;
    q.set_filter(.{ .context = &counter, .accept = accept });
    _ = q.push(.{ .quit = .{ .timestamp = 5 } }) catch return;
    _ = q.push_superseding_window(.{ .window = .{ .kind = .moved, .window_id = @fromBackingInt(@intCast(1)), .data1 = 1, .data2 = 2 } }) catch return;
    var out: [4]ev.Event = undefined;
    _ = q.peek(&out, 0, 0xFFFF);
    _ = q.get(&out, 0x100, 0x100);
    _ = q.has(0x200, 0x2FF);
    q.flush(0x200, 0x2FF);
    q.set_enabled(0x300, false) catch return;
    _ = q.is_enabled(0x300);
    _ = q.register_user_events(2);
    q.remove_watcher(@fromBackingInt(@intCast(1)));

    var buttons: zdl.mouse.Mouse = zdl.mouse.Mouse.init(gpa, .{});
    defer buttons.deinit();
    _ = buttons.motion(0, .{ .window = @fromBackingInt(@intCast(1)), .width = 640, .height = 480 }, .global, false, 10, 20);
    _ = buttons.motion(0, null, .global, true, 3.5, -1.25);
    _ = buttons.button(0, .global, 1, true, null) catch return;
    _ = buttons.wheel(0, .global, 0.5, 1.5, .normal);
    _ = buttons.take_relative_motion();
    _ = buttons.button_state(true).contains(1);
    buttons.forget_source(.global);

    var touches = zdl.touch.Touches.init(gpa);
    defer touches.deinit();
    touches.add_device(@fromBackingInt(@intCast(7)), .direct, "screen") catch return;
    const input: zdl.touch.Input = .{ .touch_id = @fromBackingInt(@intCast(7)), .finger_id = @fromBackingInt(@intCast(1)), .viewport = .{ .window = @fromBackingInt(@intCast(1)), .width = 640, .height = 480 }, .x = 0.5, .y = 0.5, .pressure = 1 };
    _ = touches.down(&buttons, input) catch return;
    _ = touches.motion(&buttons, input) catch return;
    _ = touches.up(null, input) catch return;
    _ = touches.fingers(@fromBackingInt(@intCast(7)));
    _ = zdl.touch.pinch(.begin, 0, null, 1, -1, -1, -1, -1);

    var pens = zdl.pen.Pens.init(gpa);
    defer pens.deinit();
    const added = pens.add(0, .none, "stylus", .direct, true) catch return;
    _ = pens.motion(0, .none, added.id, 1, 2);
    _ = pens.button(0, .none, added.id, 1, true);
    _ = pens.touch(0, .none, added.id, false, true);
    _ = pens.axis(0, .none, added.id, .pressure, 0.5);
    _ = pens.next_pending_proximity(0);
    _ = pens.remove(0, .none, added.id);
}
