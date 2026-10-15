//! Player test harness: opens one media file in a zdl window and plays it.
//!
//! Keys: space pauses, left/right seek 5 seconds, up/down change the volume,
//! m mutes, f toggles fullscreen and q quits. Position and state are printed
//! once per second so playback can be checked against the wall clock.
const std = @import("std");
const zdl = @import("zdl");
const media = @import("media");

const Key = zdl.events.event.Key;
const frame_wait_ns: u64 = 16 * std.time.ns_per_ms;

pub fn main(init: std.process.Init) !void {
    const allocator = init.gpa;
    const io = init.io;

    var args = std.process.Args.Iterator.init(init.minimal.args);
    defer args.deinit();
    _ = args.next();
    const first = args.next() orelse {
        std.debug.print("usage: player <media-file>\n", .{});
        return error.MissingMediaPath;
    };

    const probe = std.mem.eql(u8, first, "--probe");
    const path = if (probe) args.next() orelse return error.MissingMediaPath else first;

    var player = media.Player.open(allocator, io, path) catch |err| {
        std.debug.print("cannot open {s}: {s}\n", .{ path, @errorName(err) });
        return err;
    };
    defer player.close();
    const meta = player.metadata();
    std.debug.print("{s}: {d}x{d} {s} {d:.2}s\n", .{ path, meta.width, meta.height, meta.video_codec orelse "no video", meta.duration_seconds });

    if (probe) {
        const start = std.Io.Clock.awake.now(io).nanoseconds;
        var frames: usize = 0;
        var previous: ?f64 = null;
        while (std.Io.Clock.awake.now(io).nanoseconds - start < 2 * std.time.ns_per_s) {
            try player.update();
            if (player.current_frame()) |picture| if (previous == null or previous.? != picture.seconds) {
                frames += 1;
                previous = picture.seconds;
            };
            try zdl.system.timer.delay_precise_ns(io, 10 * std.time.ns_per_ms);
        }
        if (frames < 2) return error.VideoDidNotAdvance;
        player.pause();
        const paused_at = player.position();
        try zdl.system.timer.delay_precise_ns(io, 100 * std.time.ns_per_ms);
        try player.update();
        if (@abs(player.position() - paused_at) > 0.05) return error.PauseDidNotFreeze;
        try player.seek(0.5);
        try player.play();
        for (0..30) |_| {
            try player.update();
            try zdl.system.timer.delay_precise_ns(io, 10 * std.time.ns_per_ms);
        }
        if (player.position() < 0.5 or player.position() > 2) return error.SeekMissedTarget;
        std.debug.print("probe: {d} frames, pause stable, seek/resume position {d:.2}s\n", .{ frames, player.position() });
        return;
    }

    const environment = init.minimal.environ;
    var platform = try zdl.linux.Platform.open(allocator, io, .{
        .environment = .{
            .wayland_display = environment.getPosix("WAYLAND_DISPLAY"),
            .session_type = environment.getPosix("XDG_SESSION_TYPE"),
            .x11_display = environment.getPosix("DISPLAY"),
            .xcursor_theme = environment.getPosix("XCURSOR_THEME"),
        },
    });
    defer platform.close();
    var window = try platform.create_window(.{
        .title = "zdl player",
        .size = .{ .width = 960, .height = 540 },
        .resizable = true,
    });
    defer window.deinit();

    var app: App = .{ .allocator = allocator, .player = player, .window = &window };
    defer app.release();
    var running = true;
    var last_report: i96 = 0;
    while (running) {
        _ = try platform.wait_event(frame_wait_ns);
        while (platform.next_event()) |event| switch (event) {
            .quit => running = false,
            .window => |window_event| if (window_event.kind == .close_requested) {
                running = false;
            },
            .key => |key| if (key.kind == .down) {
                if (try app.key(key)) running = false;
            },
            else => {},
        };
        try player.update();
        while (player.poll_event()) |event| switch (event) {
            .ended => std.debug.print("ended\n", .{}),
            .failed => |err| {
                std.debug.print("playback failed: {s} {s}\n", .{ @errorName(err), player.last_error_text() });
                running = false;
            },
        };
        try app.present();

        const now = std.Io.Clock.awake.now(io).nanoseconds;
        if (now - last_report >= std.time.ns_per_s) {
            last_report = now;
            std.debug.print("position {d:.2}/{d:.2}s volume {d:.2}{s}{s}\n", .{
                player.position(),
                player.duration(),
                player.get_volume(),
                if (player.is_paused()) " paused" else "",
                if (player.is_muted()) " muted" else "",
            });
        }
    }
}

/// Window-side state: the RGBA raster the player draws into, rebuilt on resize.
const App = struct {
    allocator: std.mem.Allocator,
    player: *media.Player,
    window: *zdl.linux.Window,
    raster: ?zdl.surface.Surface = null,
    drawn_seconds: ?f64 = null,
    drawn_size: [2]u32 = .{ 0, 0 },

    fn release(self: *App) void {
        if (self.raster) |*raster| raster.deinit();
        self.raster = null;
    }

    /// Handles one key press. Returns true when the application should quit.
    fn key(self: *App, pressed: Key) !bool {
        const player = self.player;
        switch (pressed.scancode) {
            .space => if (!pressed.repeat) try player.toggle_pause(),
            .left => try player.seek(player.position() - 5),
            .right => try player.seek(player.position() + 5),
            .up => try player.set_volume(player.get_volume() + 0.05),
            .down => try player.set_volume(player.get_volume() - 0.05),
            .m => if (!pressed.repeat) try player.set_muted(!player.is_muted()),
            .f => if (!pressed.repeat) {
                const flags = try self.window.flags();
                try self.window.set_fullscreen(!flags.fullscreen);
            },
            .q => return true,
            else => {},
        }
        return false;
    }

    /// Draws the current picture when it changed or the window was resized, then presents.
    fn present(self: *App) !void {
        const pixels = try self.window.size_in_pixels();
        if (pixels.width == 0 or pixels.height == 0) return;
        const size = [2]u32{ pixels.width, pixels.height };
        if (self.raster == null or !std.meta.eql(self.drawn_size, size)) {
            self.release();
            self.raster = try zdl.surface.Surface.init(self.allocator, @intCast(pixels.width), @intCast(pixels.height), .rgba8, null);
            self.drawn_size = size;
            self.drawn_seconds = null;
        }
        const raster = &self.raster.?;
        if (self.player.current_frame()) |frame| {
            if (self.drawn_seconds != frame.seconds) {
                _ = try self.player.draw(raster.view);
                self.drawn_seconds = frame.seconds;
            }
        }
        try self.window.present(raster.view);
    }
};
