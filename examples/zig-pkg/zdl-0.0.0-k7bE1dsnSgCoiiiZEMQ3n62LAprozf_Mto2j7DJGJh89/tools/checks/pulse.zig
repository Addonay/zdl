//! Compile-only consumer for the PulseAudio backend. Every call that would touch
//! the sound server is behind a PID guard, so running the binary is always a no-op.
const std = @import("std");
const zdl = struct {
    const context = @import("zdl").audio.pulse.context;
    const playback = @import("zdl").audio.pulse.playback;
    const capture = @import("zdl").audio.pulse.capture;
    const stream = struct {
        const Stream = @import("zdl").audio.Stream;
    };
    const processing = @import("zdl").audio;
};

pub fn check() !void {
    if (std.os.linux.getpid() != 0) return;
    const allocator = std.heap.page_allocator;

    var library = try zdl.context.Library.open();
    defer library.deinit();

    var connection = try zdl.context.Context.open(allocator, &library, .{
        .application_name = "zdl check",
        .include_monitors = false,
    });
    defer connection.deinit();

    var server = try connection.server_info();
    defer server.deinit();
    _ = server.default_sink.len;

    var sinks = try connection.playback_devices();
    defer sinks.deinit();
    for (sinks.items) |*device| {
        _ = device.channels();
        _ = device.format;
        _ = device.sample_rate;
        _ = device.description.len;
        _ = device.volume.len;
        _ = device.muted;
        _ = device.latency_microseconds;
    }
    var sources = try connection.capture_devices();
    defer sources.deinit();

    try connection.subscribe();
    var events = try connection.poll_events();
    defer events.deinit();
    for (events.items) |event| switch (event) {
        .device_added, .device_changed => |device| _ = device.name,
        .device_removed => |removed| _ = removed.index,
        .default_device_changed => |default| _ = default.name,
    };
    connection.unsubscribe();
    if (try connection.default_device_handle(allocator, .playback)) |handle_value| {
        var handle = handle_value;
        defer handle.deinit();
        try connection.set_device_volume(&handle, 0.5);
    }

    var stream = try zdl.playback.Stream.open(&connection, .{
        .spec = .{ .format = .float32_le, .channels = 2, .sample_rate = 48000 },
    });
    defer stream.deinit();
    _ = stream.spec;
    _ = stream.buffer_frames;
    _ = stream.period_frames;
    _ = try stream.writable_frames();
    _ = try stream.wait_writable(0);
    const silence: [8]u8 = @splat(0);
    _ = try stream.write(&silence);
    try stream.set_corked(false);
    stream.drain() catch |err| switch (err) {
        error.WouldBlock => {},
        else => return err,
    };
    try stream.flush();

    var output = try zdl.playback.Output(.stereo).open(allocator, &connection, .{
        .format = .float32_le,
        .sample_rate = 48000,
    });
    defer output.deinit();
    var mixer = try zdl.stream.Stream(.stereo, .stereo).init(allocator, .{
        .format = output.spec().format,
        .sample_rate = output.spec().sample_rate,
    });
    defer mixer.deinit();
    try output.bind(.{ .stereo = &mixer });
    try output.set_gain(0.5);
    output.set_paused(false);
    _ = output.bound_count();
    _ = output.endpoint_name();
    _ = output.opened_as_default();
    _ = output.physical_index();
    _ = try output.latency_microseconds();
    _ = try output.migrate_default(null);
    output.set_device_volume(0.5) catch |err| switch (err) {
        error.InvalidConfiguration => {},
        else => return err,
    };
    _ = output.buffer_frames();
    _ = output.period_frames();
    _ = try output.pump();
    _ = try output.wait(0);
    output.drain() catch |err| switch (err) {
        error.WouldBlock => {},
        else => return err,
    };
    try output.drop();
    try output.unbind(.{ .stereo = &mixer });

    var capture = try zdl.capture.Stream.open(&connection, .{
        .spec = .{ .format = .signed16_le, .channels = 2, .sample_rate = 48000 },
    });
    defer capture.deinit();
    var buffer: [4096]u8 = undefined;
    _ = try capture.readable_bytes();
    _ = try capture.wait_readable(0);
    _ = try capture.read(&buffer);
    try capture.set_corked(false);
    try capture.flush();

    var input = try zdl.capture.Input(.stereo).open(allocator, &connection, .{
        .format = .signed16_le,
        .sample_rate = 48000,
    });
    defer input.deinit();
    var sink = try zdl.stream.Stream(.stereo, .stereo).init(allocator, .{
        .format = .float32_le,
        .sample_rate = 48000,
    });
    defer sink.deinit();
    _ = input.spec();
    _ = input.endpoint_name();
    _ = input.opened_as_default();
    _ = input.physical_index();
    _ = try input.latency_microseconds();
    _ = try input.migrate_default(null);
    _ = input.buffer_frames();
    _ = input.period_frames();
    try input.bind(.{ .stereo = &sink });
    _ = input.bound_count();
    _ = try input.wait(0);
    _ = try input.pump();
    try input.drop();
    try input.unbind(.{ .stereo = &sink });
}
