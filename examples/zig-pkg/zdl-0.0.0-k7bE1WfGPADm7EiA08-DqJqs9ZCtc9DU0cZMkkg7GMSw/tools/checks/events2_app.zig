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

const callbacks = zdl.callbacks;

/// Application state exercising the optional callbacks and immediate lifecycle sends.
const Demo = struct {
    frames: u32 = 0,

    pub fn init(app: *Demo, context: *callbacks.Context) callbacks.Result {
        _ = app;
        _ = context.now_ns();
        return .@"continue";
    }

    pub fn event(app: *Demo, context: *callbacks.Context, ev: callbacks.Event) callbacks.Result {
        _ = app;
        _ = context;
        _ = ev.timestamp();
        return .@"continue";
    }

    pub fn iterate(app: *Demo, context: *callbacks.Context) callbacks.Result {
        app.frames += 1;
        // Immediate lifecycle dispatch from inside a callback.
        _ = callbacks.send_app_event(Demo, app, context, .low_memory) catch return .failure;
        context.pacing = if (app.frames > 2) .wait_event else .{ .rate_hz = 60 };
        return .@"continue";
    }

    pub fn quit(app: *Demo, context: *callbacks.Context, result: callbacks.Result) void {
        _ = .{ app, context, result };
    }
};

pub fn check() void {
    // Compile-only consumer: the guard keeps the platform, signals and clock inert.
    if (std.os.linux.getpid() != 0) return;

    const io: std.Io = undefined;
    const platform: *callbacks.Platform = undefined;
    var demo: Demo = .{};

    // Render coordinates: the same conversions the app loop uses.
    const rend: zdl.render_coordinates.Renderer = undefined;
    const window: zdl.render_coordinates.WindowId = @fromBackingInt(1);
    const size: zdl.render_coordinates.Size = .{ .width = 640, .height = 480 };
    const point = zdl.render_coordinates.from_window(rend, .{ .x = 10, .y = 20 }) catch return;
    _ = zdl.render_coordinates.to_window(rend, point) catch return;
    _ = zdl.render_coordinates.vector_from_window(rend, .{ .x = 1, .y = 2 }) catch return;
    const motion: zdl.render_coordinates.Event = .{ .mouse_motion = .{ .window_id = window, .x = 5, .y = 6 } };
    _ = zdl.render_coordinates.convert_event(rend, window, size, motion) catch return;

    // Signal quit source, handed to the loop through the options.
    var signals = zdl.quit.Signals.install() catch return;
    defer signals.uninstall();

    _ = callbacks.run(Demo, &demo, platform, io, .{
        .pacing = callbacks.Pacing.from_hint(null),
        .signals = &signals,
        .quit_on_quit_event = false,
    }) catch return;
    _ = callbacks.Pacing.from_hint(callbacks.main_callback_rate_hint).increment_ns();
}
