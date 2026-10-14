const std = @import("std");
const zdl = @import("zdl").app;

const callbacks = zdl.callbacks;
const devices = zdl.devices;
const render_coordinates = zdl.render_coordinates;

/// Application state exercising every optional and required callback.
const Demo = struct {
    frames: u32 = 0,
    registry: devices.Registry = undefined,

    pub fn init(app: *Demo, context: *callbacks.Context) callbacks.Result {
        app.registry = devices.Registry.init(std.heap.page_allocator);
        _ = context.now_ns();
        return .@"continue";
    }

    pub fn event(app: *Demo, context: *callbacks.Context, ev: callbacks.Event) callbacks.Result {
        _ = context;
        switch (ev) {
            .keyboard_device => |device| {
                _ = app.registry.add_keyboard(device.timestamp, device.keyboard_id, null) catch return .failure;
            },
            .mouse_device => |device| {
                _ = app.registry.add_mouse(device.timestamp, device.mouse_id, null) catch return .failure;
            },
            else => {},
        }
        return .@"continue";
    }

    pub fn iterate(app: *Demo, context: *callbacks.Context) callbacks.Result {
        app.frames += 1;
        context.pacing = if (app.frames > 2) .wait_event else .{ .rate_hz = 60 };
        return .@"continue";
    }

    pub fn quit(app: *Demo, context: *callbacks.Context, result: callbacks.Result) void {
        _ = .{ context, result };
        app.registry.deinit();
    }
};

pub fn check() void {
    // Compile-only consumer: never run the platform or touch devices.
    if (std.os.linux.getpid() != 0) return;

    const gpa = std.heap.page_allocator;
    const io: std.Io = undefined;
    const platform: *callbacks.Platform = undefined;
    const rend: render_coordinates.Renderer = undefined;

    // Device registries: add, query, remove and the silent teardown path.
    var registry = devices.Registry.init(gpa);
    defer registry.deinit();
    _ = registry.add_keyboard(1, @fromBackingInt(3), "Board") catch return;
    _ = registry.add_mouse(2, @fromBackingInt(4), null) catch return;
    _ = registry.remove_keyboard(3, @fromBackingInt(3));
    _ = registry.remove_mouse(4, @fromBackingInt(4));
    _ = registry.keyboard_ids();
    _ = registry.mouse_ids();
    _ = registry.keyboard_name(.unknown);
    _ = registry.mouse_name(.touch, null);
    _ = devices.is_keyboard(0, 0, 0);
    _ = devices.is_mouse(0, 0);

    // Render coordinates: point, vector, inverse and whole-event conversion.
    const window: render_coordinates.WindowId = @fromBackingInt(1);
    const size: render_coordinates.Size = .{ .width = 640, .height = 480 };
    const point = render_coordinates.from_window(rend, .{ .x = 10, .y = 20 }) catch return;
    _ = render_coordinates.to_window(rend, point) catch return;
    _ = render_coordinates.vector_from_window(rend, .{ .x = 1, .y = 2 }) catch return;
    const motion: render_coordinates.Event = .{ .mouse_motion = .{ .window_id = window, .x = 5, .y = 6 } };
    _ = render_coordinates.convert_event(rend, window, size, motion) catch return;

    // Main callbacks with the demo app.
    var demo: Demo = .{};
    _ = callbacks.run(Demo, &demo, platform, io, .{ .pacing = callbacks.Pacing.from_hint(null) }) catch return;
    _ = callbacks.Pacing.from_hint(callbacks.main_callback_rate_hint).increment_ns();
}
