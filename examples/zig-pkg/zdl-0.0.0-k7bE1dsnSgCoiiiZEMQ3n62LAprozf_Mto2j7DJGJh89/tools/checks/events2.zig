const std = @import("std");
const zdl = struct {
    const event = @import("zdl").events.event;
    const queue = @import("zdl").events.queue;
    const quit = @import("zdl").events.quit;
    const mouse = @import("zdl").events.mouse;
    const touch = @import("zdl").events.touch;
    const pen = @import("zdl").events.pen;
    const devices = @import("zdl").app.devices;
    const callbacks = @import("zdl").app.callbacks;
    const render_coordinates = @import("zdl").app.render_coordinates;
};
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
    // Compile-only consumer: nothing below runs, the guard keeps every call inert.
    if (std.os.linux.getpid() != 0) return;
    const gpa = std.heap.page_allocator;

    // Queue: watchers, filter, lifecycle dispatch, deferred removal, enablement.
    var q = zdl.queue.Queue(Ctx).init(gpa, .{});
    defer q.deinit();
    var counter: u32 = 0;
    const watch = q.add_watcher(.{ .context = &counter, .observe = observe }) catch return;
    q.set_filter(.{ .context = &counter, .accept = accept });
    _ = q.push(.{ .quit = .{ .timestamp = 5 } }) catch return;
    _ = q.push_superseding_window(.{ .window = .{ .kind = .moved, .window_id = @fromBackingInt(@intCast(1)), .data1 = 1, .data2 = 2 } }) catch return;
    _ = q.send_app_event(.{ .app = .{ .kind = .low_memory } }) catch return;
    _ = q.send_app_event(.{ .app = .{ .kind = .locale_changed } }) catch return;
    _ = q.dispatch_app_event(.{ .app = .{ .kind = .terminating } });
    var out: [4]ev.Event = undefined;
    _ = q.peek(&out, 0, 0xFFFF);
    _ = q.get(&out, 0x100, 0x100);
    _ = q.has(0x200, 0x2FF);
    q.flush(0x200, 0x2FF);
    q.set_enabled(0x300, false) catch return;
    _ = q.is_enabled(0x300);
    _ = q.register_user_events(2);
    q.remove_watcher(watch);

    // Quit source: explicit install, polled and restored. Never reached at pid != 0.
    var signals = zdl.quit.Signals.install() catch return;
    defer signals.uninstall();
    if (signals.poll(0)) |quit_event| _ = q.send_app_event(quit_event) catch return;
    _ = signals.fd;

    // Pointer, touch and pen state.
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
    touches.add_device(@fromBackingInt(@intCast(8)), .indirect_absolute, null) catch return;
    touches.remove_device(@fromBackingInt(@intCast(7)));
    const input: zdl.touch.Input = .{ .touch_id = @fromBackingInt(@intCast(8)), .finger_id = @fromBackingInt(@intCast(1)), .viewport = .{ .window = @fromBackingInt(@intCast(1)), .width = 640, .height = 480 }, .x = 0.5, .y = 0.5, .pressure = 1 };
    _ = touches.down(&buttons, input) catch return;
    _ = touches.motion(&buttons, input) catch return;
    _ = touches.up(null, input) catch return;
    _ = touches.fingers(@fromBackingInt(@intCast(8)));
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

    // App device registries, naming rules and render coordinate conversion.
    var registry = zdl.devices.Registry.init(gpa);
    defer registry.deinit();
    _ = registry.add_keyboard(1, @fromBackingInt(3), "Board") catch return;
    _ = registry.add_mouse(2, @fromBackingInt(4), null) catch return;
    _ = registry.remove_keyboard(3, @fromBackingInt(3));
    _ = registry.remove_mouse(4, @fromBackingInt(4));
    _ = registry.keyboard_ids();
    _ = registry.mouse_ids();
    _ = registry.keyboard_name(.unknown);
    _ = registry.mouse_name(.touch, &touches);
    _ = zdl.devices.touch_mouse_name(&touches);
    _ = zdl.devices.is_keyboard(0, 0, 0);
    _ = zdl.devices.is_mouse(0, 0);

    _ = zdl.event.Event.is_app_lifecycle(.{ .quit = .{} });
}
