//! Custom title bar: a borderless window whose header the application draws itself.
//!
//! The header is draggable (drag to move, double-click to maximize or restore,
//! right-click for the window menu) and the window edges and corners resize it.
//! Minimize, maximize/restore and close are drawn by `window_controls` in the
//! order the desktop uses (KDE kwinrc, GNOME gsettings, or the default), and their
//! clicks never reach the header's drag handling. The header description is set
//! on every frame from the controls' geometry.
//!
//! Set SDL_VIDEO_DRIVER=x11 to run on the X11 backend (for example under XWayland).
const std = @import("std");
const zdl = @import("zdl");

const controls_lib = zdl.linux.window_controls;
const Renderer = zdl.render.renderer.Renderer;
const Color = zdl.render.renderer.Color;
const Context = zdl.app.callbacks.Context;
const Event = zdl.app.callbacks.Event;
const Result = zdl.app.callbacks.Result;

/// Width of the resize border, in pixels, along each window edge.
const resize_border: u16 = 6;

/// Breeze-like light palette for the header and body.
const header_color: Color = .{ .r = 0xef, .g = 0xf0, .b = 0xf1 };
const body_color: Color = .{ .r = 0xfc, .g = 0xfc, .b = 0xfc };
const text_color: Color = .{ .r = 0x23, .g = 0x26, .b = 0x29 };
const note_color: Color = .{ .r = 0x7f, .g = 0x84, .b = 0x8a };

const App = struct {
    allocator: std.mem.Allocator,
    window: zdl.linux.Window,
    controls: controls_lib.Controls,
    raster: zdl.surface.Surface,
    raster_width: u31,
    raster_height: u31,
    renderer: Renderer,
    frames: u64 = 0,

    /// Pointer events on the header: the platform has already consumed presses in
    /// draggable areas, so only button and motion events on the controls and the
    /// body arrive here.
    pub fn event(self: *App, context: *Context, ev: Event) Result {
        _ = context;
        switch (ev) {
            .window => |window_event| switch (window_event.kind) {
                .close_requested => return .success,
                .mouse_leave => self.controls.pointer_left(),
                else => {},
            },
            .mouse_motion => |motion| self.controls.pointer_moved(point(motion.x, motion.y)),
            .mouse_button => |button| if (button.button == 1) switch (button.kind) {
                .down => _ = self.controls.press(point(button.x, button.y)),
                .up => if (self.controls.release(point(button.x, button.y))) |action| {
                    const quit = self.perform(action) catch |err| return fail("action", err);
                    if (quit) return .success;
                },
            },
            else => {},
        }
        return .@"continue";
    }

    pub fn iterate(self: *App, context: *Context) Result {
        _ = context;
        self.render() catch |err| {
            std.debug.print("DEBUG frame {d}\n", .{self.frames});
            return fail("render", err);
        };
        return .@"continue";
    }

    fn perform(self: *App, action: controls_lib.Action) !bool {
        switch (action) {
            .minimize => try self.window.minimize(),
            .toggle_maximize => try self.window.set_maximized(!(try self.window.flags()).maximized),
            .close_request => return true,
        }
        return false;
    }

    fn render(self: *App) !void {
        const size = try self.window.size();
        const width: u31 = size.width;
        const height: u31 = size.height;
        try self.ensure_raster(width, height);

        const flags = try self.window.flags();
        self.controls.set_window_state(flags);
        self.controls.set_width(width);
        const metrics = self.controls.metrics;
        // The whole header is draggable; the buttons are carved out of it by `hit_test`.
        try self.window.set_hit_test(try self.controls.hit_test(resize_border));

        const renderer = &self.renderer;
        renderer.set_draw_color(body_color);
        try renderer.clear();

        renderer.set_draw_color(header_color);
        try renderer.fill_rect(.{ .x = 0, .y = 0, .width = @floatFromInt(width), .height = @floatFromInt(metrics.height) });
        renderer.set_draw_color(text_color);
        try renderer.debug_text(16, @floatFromInt(@divTrunc(metrics.height - 8, 2)), "zdl custom title bar");
        try self.controls.draw(renderer, .{});

        renderer.set_draw_color(text_color);
        try renderer.debug_text(16, 64, "Drag the header to move the window.");
        try renderer.debug_text(16, 80, "Double-click the header to maximize or restore.");
        try renderer.debug_text(16, 96, "Drag an edge or corner to resize.");
        try renderer.debug_text(16, 112, "Right-click the header for the window menu.");
        renderer.set_draw_color(note_color);
        try renderer.debug_text_format(16, 144, "maximized: {s}   focused: {s}   size: {d}x{d}", .{
            yes_no(flags.maximized),
            yes_no(flags.input_focus),
            width,
            height,
        });
        const titlebar = self.controls.titlebar_area();
        try renderer.debug_text_format(16, 160, "title area: x={d} width={d}", .{ titlebar.x, titlebar.width });
        try renderer.debug_text_format(16, 176, "frame {d}", .{self.frames});
        self.frames += 1;

        try self.window.present(self.raster.view);
    }

    fn ensure_raster(self: *App, width: u31, height: u31) !void {
        if (self.raster_width == width and self.raster_height == height) return;
        self.raster.deinit();
        self.raster = try zdl.surface.Surface.init(self.allocator, width, height, .rgba8, null);
        self.raster_width = width;
        self.raster_height = height;
        self.renderer.set_output(self.raster.view);
    }
};

fn point(x: f32, y: f32) zdl.linux.Point {
    return .{ .x = @intFromFloat(@floor(x)), .y = @intFromFloat(@floor(y)) };
}

fn yes_no(value: bool) []const u8 {
    return if (value) "yes" else "no";
}

fn fail(comptime step: []const u8, err: anyerror) Result {
    std.debug.print("{s} failed: {t}\n", .{ step, err });
    return .failure;
}

pub fn main(init: std.process.Init) !void {
    const allocator = init.gpa;
    const io = init.io;
    const environment = init.minimal.environ;
    var platform = try zdl.linux.Platform.open(allocator, io, .{
        .environment = .{
            .wayland_display = environment.getPosix("WAYLAND_DISPLAY"),
            .session_type = environment.getPosix("XDG_SESSION_TYPE"),
            .x11_display = environment.getPosix("DISPLAY"),
            .xcursor_theme = environment.getPosix("XCURSOR_THEME"),
            .video_driver = environment.getPosix("SDL_VIDEO_DRIVER"),
        },
    });
    defer platform.close();

    var window = try platform.create_window(.{
        .title = "zdl custom title bar",
        .size = .{ .width = 640, .height = 480 },
        .resizable = true,
        .borderless = true,
    });
    defer window.deinit();

    const layout = controls_lib.load(allocator, io, .{
        .current = environment.getPosix("XDG_CURRENT_DESKTOP"),
        .config_home = environment.getPosix("XDG_CONFIG_HOME"),
        .home = environment.getPosix("HOME"),
    });
    const size = try window.size();
    const width: u31 = size.width;
    const height: u31 = size.height;
    var app: App = .{
        .allocator = allocator,
        .window = window,
        .controls = controls_lib.Controls.init(layout, .{}),
        .raster = try zdl.surface.Surface.init(allocator, width, height, .rgba8, null),
        .raster_width = width,
        .raster_height = height,
        .renderer = undefined,
    };
    defer app.raster.deinit();
    app.renderer = Renderer.init(allocator, app.raster.view);

    const result = try zdl.app.callbacks.run(App, &app, platform, io, .{ .pacing = .{ .rate_hz = 60 } });
    if (result == .failure) return error.RenderFailure;
}
