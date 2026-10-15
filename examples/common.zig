//! Shared SDL-example runner: a Linux window for interactive use, or an owned
//! software surface and numbered BMP files for deterministic headless runs.
const std = @import("std");
const zdl = @import("zdl");

pub const width: u31 = 640;
pub const height: u31 = 480;
pub const Renderer = zdl.render.renderer.Renderer;
pub const Color = zdl.render.renderer.Color;
pub const FPoint = zdl.render.renderer.FPoint;
pub const FRect = zdl.render.renderer.FRect;
pub const Texture = zdl.render.texture.Texture;
pub const Vertex = zdl.render.renderer.Vertex;
pub const Blend = zdl.render.renderer.Blend;

/// Loads the shared SDL test image and transfers decoded pixels to the caller.
pub fn load_sample(allocator: std.mem.Allocator, io: std.Io) !zdl.image.load.Image {
    const bytes = try std.Io.Dir.cwd().readFileAlloc(io, "assets/sample.png", allocator, .unlimited);
    defer allocator.free(bytes);
    return zdl.image.load.load_png(allocator, bytes);
}

/// The originals animate from SDL_GetTicks; headless playback uses a fixed
/// 60-Hz clock so the same sequence is reproducible across runs.
pub fn animation_scale(frame_index: usize) f32 {
    const milliseconds = (frame_index % 120) * 1000 / 60;
    const direction: f32 = if (milliseconds >= 1000) 1 else -1;
    const phase = @as(f32, @floatFromInt(@as(isize, @intCast(milliseconds % 1000)) - 500)) / 500;
    return phase * direction;
}

const RunOptions = struct {
    frames: ?usize = null,
    save_dir: []const u8 = "frames",
};

/// Runs an example interactively, or renders and saves a finite frame sequence.
/// Headless mode: `--frames N --save-dir DIR`.
pub fn run(comptime App: type, app: *App, init: std.process.Init, comptime title: []const u8, comptime render_frame: anytype) !void {
    const options = try parse_options(init.minimal.args);
    if (options.frames != null) {
        try render_headless(App, app, init, options, render_frame);
    } else {
        try render_interactive(App, app, init, title, render_frame);
    }
}

fn output_width(comptime App: type) u31 {
    return if (@hasDecl(App, "render_width")) App.render_width else width;
}

fn output_height(comptime App: type) u31 {
    return if (@hasDecl(App, "render_height")) App.render_height else height;
}

fn parse_options(args_value: std.process.Args) !RunOptions {
    var args = std.process.Args.Iterator.init(args_value);
    defer args.deinit();
    _ = args.next(); // executable name

    var options: RunOptions = .{};
    while (args.next()) |argument_z| {
        const argument: []const u8 = argument_z;
        if (std.mem.eql(u8, argument, "--frames")) {
            const value = args.next() orelse return error.MissingFrameCount;
            options.frames = try std.fmt.parseInt(usize, value, 10);
            if (options.frames.? == 0) return error.InvalidFrameCount;
        } else if (std.mem.eql(u8, argument, "--save-dir")) {
            const value = args.next() orelse return error.MissingSaveDirectory;
            options.save_dir = value;
        } else if (std.mem.eql(u8, argument, "--help")) {
            std.debug.print("--frames N --save-dir DIR   render BMP frames without opening a window\n", .{});
            return error.HelpShown;
        } else {
            std.debug.print("unknown argument: {s}\n", .{argument});
            return error.UnknownArgument;
        }
    }
    return options;
}

fn render_headless(comptime App: type, app: *App, init: std.process.Init, options: RunOptions, comptime render_frame: anytype) !void {
    const allocator = init.gpa;
    const io = init.io;
    const target_width = output_width(App);
    const target_height = output_height(App);
    try std.Io.Dir.cwd().createDirPath(io, options.save_dir);

    var raster = try zdl.surface.Surface.init(allocator, target_width, target_height, .rgba8, null);
    defer raster.deinit();
    var renderer = Renderer.init(allocator, raster.view);
    try renderer.set_logical_presentation(.{ .width = @floatFromInt(target_width), .height = @floatFromInt(target_height), .mode = .letterbox });

    for (0..options.frames.?) |frame_index| {
        if (@hasDecl(App, "before_frame")) try App.before_frame(app, io);
        try render_frame(app, &renderer, frame_index);
        const encoded = try zdl.surface.bmp.encode(allocator, raster.view);
        defer allocator.free(encoded);
        const path = try std.fmt.allocPrint(allocator, "{s}/frame-{d:0>4}.bmp", .{ options.save_dir, frame_index });
        defer allocator.free(path);
        try std.Io.Dir.cwd().writeFile(io, .{ .sub_path = path, .data = encoded });
        const stats = try pixel_stats(raster.view);
        std.debug.print("frame {d}: {s} varied={d} checksum=0x{x}\n", .{ frame_index, path, stats.varied, stats.checksum });
    }
}

fn render_interactive(comptime App: type, app: *App, init: std.process.Init, comptime title: []const u8, comptime render_frame: anytype) !void {
    const allocator = init.gpa;
    const target_width = output_width(App);
    const target_height = output_height(App);
    const environment = init.minimal.environ;
    var platform = try zdl.linux.Platform.open(allocator, init.io, .{
        .environment = .{
            .wayland_display = environment.getPosix("WAYLAND_DISPLAY"),
            .session_type = environment.getPosix("XDG_SESSION_TYPE"),
            .x11_display = environment.getPosix("DISPLAY"),
            .xcursor_theme = environment.getPosix("XCURSOR_THEME"),
        },
    });
    defer platform.close();

    var window = try platform.create_window(.{
        .title = title,
        .size = .{ .width = @intCast(target_width), .height = @intCast(target_height) },
        .resizable = true,
    });
    defer window.deinit();

    var raster = try zdl.surface.Surface.init(allocator, target_width, target_height, .rgba8, null);
    defer raster.deinit();
    var renderer = Renderer.init(allocator, raster.view);
    try renderer.set_logical_presentation(.{ .width = @floatFromInt(target_width), .height = @floatFromInt(target_height), .mode = .letterbox });

    const Callbacks = struct {
        app: *App,
        renderer: *Renderer,
        window: zdl.linux.Window,
        raster: *zdl.surface.Surface,
        frame_index: usize = 0,

        pub fn event(self: *@This(), context: *zdl.app.callbacks.Context, event_value: zdl.app.callbacks.Event) zdl.app.callbacks.Result {
            if (@hasDecl(App, "event_with_renderer")) return App.event_with_renderer(self.app, self.renderer, context, event_value);
            if (@hasDecl(App, "event")) return App.event(self.app, context, event_value);
            return .@"continue";
        }

        pub fn iterate(self: *@This(), context: *zdl.app.callbacks.Context) zdl.app.callbacks.Result {
            if (@hasDecl(App, "before_frame")) App.before_frame(self.app, context.io) catch |err| return fail("before_frame", err);
            render_frame(self.app, self.renderer, self.frame_index) catch |err| return fail("render", err);
            self.window.present(self.raster.view) catch |err| return fail("present", err);
            self.frame_index += 1;
            return .@"continue";
        }
    };

    var callbacks: Callbacks = .{ .app = app, .renderer = &renderer, .window = window, .raster = &raster };
    const result = try zdl.app.callbacks.run(Callbacks, &callbacks, platform, init.io, .{ .pacing = .{ .rate_hz = 60 } });
    if (result == .failure) return error.RenderFailure;
}

fn fail(comptime step: []const u8, err: anyerror) zdl.app.callbacks.Result {
    std.debug.print("{s} failed: {t}\n", .{ step, err });
    return .failure;
}

const PixelStats = struct { varied: usize, checksum: u64 };

fn pixel_stats(view: zdl.surface.View) !PixelStats {
    var checksum: u64 = 0xcbf29ce484222325;
    var varied: usize = 0;
    const first = try view.read(0, 0);
    for (0..view.height) |y| {
        const row = try view.row(y);
        for (0..view.width) |x| {
            const color = try view.format.read(row, x, view.palette);
            if (!std.meta.eql(color, first)) varied += 1;
            checksum = (checksum ^ color.r) *% 0x100000001b3;
            checksum = (checksum ^ color.g) *% 0x100000001b3;
            checksum = (checksum ^ color.b) *% 0x100000001b3;
            checksum = (checksum ^ color.a) *% 0x100000001b3;
        }
    }
    return .{ .varied = varied, .checksum = checksum };
}

pub fn clear(renderer: *Renderer, color: Color) !void {
    renderer.set_draw_color(color);
    try renderer.clear();
}
