//! Compile checks for hints, logging, metadata, lifecycle and in-memory streams.
const std = @import("std");
const zdl = @import("zdl");

const hints = zdl.hints;
const log = zdl.log;
const lifecycle = zdl.app.lifecycle;
const metadata = zdl.app.metadata;
const iostream = zdl.iostream;

const Watcher = struct {
    observer: hints.Observer = .{ .on_change = on_change },
    seen: u32 = 0,

    fn on_change(observer: *hints.Observer, name: []const u8, old: ?[]const u8, new: ?[]const u8) void {
        const self: *Watcher = @fieldParentPtr("observer", observer);
        _ = .{ name, old, new };
        self.seen += 1;
    }
};

const Host = struct {
    started: u32 = 0,

    pub fn start(host: *Host, subsystem: lifecycle.Subsystem) error{Unavailable}!void {
        if (subsystem == .camera) return error.Unavailable;
        host.started += 1;
    }
    pub fn stop(host: *Host, subsystem: lifecycle.Subsystem) void {
        _ = subsystem;
        host.started -= 1;
    }
};

const Sink = struct {
    output: log.Output = .{ .write = write },
    fn write(output: *log.Output, record: log.Record) void {
        const self: *Sink = @fieldParentPtr("output", output);
        _ = .{ self, record };
    }
};

pub fn check() !void {
    // Compile-only: the impossible PID guard means nothing below ever executes.
    if (std.os.linux.getpid() != 0) return;
    const gpa = std.heap.page_allocator;

    var environ = std.process.Environ.Map.init(gpa);
    defer environ.deinit();

    var services: lifecycle.Services = undefined;
    try services.init(gpa, &environ);
    defer services.deinit();

    var table = hints.Hints.init(gpa, &environ);
    defer table.deinit();
    _ = try table.set(hints.names.app_name, "demo");
    _ = try table.set_with_priority(hints.names.logging, "app=debug", .override);
    var watcher: Watcher = .{};
    try table.add_observer(hints.names.main_callback_rate, &watcher.observer);
    table.remove_observer(hints.names.main_callback_rate, &watcher.observer);
    _ = table.get(hints.names.video_driver);
    _ = table.get_boolean(hints.names.render_vsync, true);
    _ = table.get_integer(hints.names.main_callback_rate, 0);
    _ = try table.reset(hints.names.app_name);
    try table.reset_all();
    _ = hints.string_boolean("true", false);
    _ = hints.string_integer("12", 0);

    var logger = log.Logger.init(gpa);
    defer logger.deinit();
    try logger.attach(&table);
    var sink: Sink = .{};
    logger.output = &sink.output;
    logger.output = log.std_log_output;
    logger.output = log.stderr_output;
    logger.say("hello {d}", .{1});
    logger.info(.video, "{s}", .{"x"});
    logger.err(log.Category.custom(1), "{s}", .{"y"});
    logger.log(.gpu, .trace, "z", .{});
    try logger.set_threshold(.audio, .debug);
    try logger.set_prefix(.warn, "W: ");
    logger.set_all(.warn);
    try logger.reset_from(&table);
    _ = logger.enabled(.render, .debug);
    logger.detach();

    var meta = metadata.Metadata.init(gpa);
    defer meta.deinit();
    try meta.set_basic("Name", "1.0", "org.example.app");
    try meta.set(.creator, "me");
    _ = meta.get(.name, &table);
    _ = metadata.exe_name_from_path("/usr/bin/demo");

    var host: Host = .{};
    var life = lifecycle.Lifecycle(Host).init(&host);
    life.set_main_ready();
    try life.init_subsystems(.initMany(&.{ .video, .gamepad }));
    life.quit_subsystems(.initMany(&.{.gamepad}));
    _ = life.was_init(null);
    _ = life.is_main_thread();
    _ = life.is_video_thread();
    life.quit_all();
    _ = lifecycle.flags_from_set(lifecycle.set_from_flags(0x20));

    var storage: [16]u8 = undefined;
    var mem = iostream.Memory.init(&storage);
    try mem.write_int(u32, 1, .big);
    _ = try mem.write_some("ab");
    _ = mem.seek(0, .set);
    _ = try mem.read_float(f32, .little);
    var dynamic = iostream.Dynamic.init(gpa);
    defer dynamic.deinit();
    try dynamic.write_float(f64, 1.0, .big);
    _ = dynamic.seek(0, .set);
    _ = try dynamic.read_int(i16, .little);
    gpa.free(try dynamic.take_owned());
    var writer = std.Io.Writer.fixed(&storage);
    try iostream.write_float(&writer, f32, 1.0, .little);
    var reader = std.Io.Reader.fixed(&storage);
    _ = try iostream.read_float(&reader, f32, .little);
}
