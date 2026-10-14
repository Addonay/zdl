//! Compile-only consumer for the JACK backend (libjack binding, SPSC ring,
//! physical-port enumeration and Output/Input). Every call that would touch the
//! JACK server or audio hardware is behind a PID guard, so running the binary
//! is always a no-op.
const std = @import("std");
const zdl = struct {
    const ring = @import("zdl").audio.jack.ring;
    const device = @import("zdl").audio.jack.device;
    const audio = @import("zdl").audio;
    const stream = struct {
        const Stream = @import("zdl").audio.Stream;
    };
};

pub fn check() !void {
    if (std.os.linux.getpid() != 0) return;
    const allocator = std.heap.page_allocator;

    // Ring: lock-free byte queue between pump and the realtime callback.
    var buffer = try zdl.ring.Ring.init(allocator, 64);
    defer buffer.deinit();
    _ = buffer.push("abcd");
    var bytes: [4]u8 = undefined;
    _ = buffer.pop(&bytes);
    buffer.discard();
    buffer.reset();
    _ = buffer.writable_bytes() + buffer.readable_bytes() + buffer.capacity();

    // Library and enumeration of physical playback and capture devices.
    var library = try zdl.device.Library.open();
    defer library.deinit();
    var playback = try zdl.device.enumerate(allocator, &library, "zdl-check", .playback);
    defer playback.deinit();
    for (playback.items) |device| {
        _ = device.name.len;
        _ = device.ports.items.len;
    }
    var capture = try zdl.device.enumerate(allocator, &library, "zdl-check", .capture);
    defer capture.deinit();

    // Playback output mirrors audio.device.Output.
    var output = try zdl.device.Output(.stereo).open(allocator, &library, .{
        .client_name = "zdl-check",
        .endpoint = null,
        .buffer_frames = 1024,
    });
    defer output.deinit();
    _ = output.spec();
    _ = output.endpoint_name();
    _ = output.buffer_frames();
    _ = output.period_frames();
    _ = output.underruns();

    var mixer = try zdl.stream.Stream(.stereo, .stereo).init(allocator, .{
        .format = output.spec().format,
        .sample_rate = output.spec().sample_rate,
    });
    defer mixer.deinit();
    try output.bind(.{ .stereo = &mixer });
    try output.set_gain(0.5);
    output.set_paused(false);
    _ = output.bound_count();
    _ = try output.pump();
    _ = try output.wait(0);
    output.drain() catch |err| switch (err) {
        error.WouldBlock => {},
        else => return err,
    };
    try output.drop();
    try output.unbind(.{ .stereo = &mixer });

    // Capture input mirrors audio.device.Input.
    var input = try zdl.device.Input(.mono).open(allocator, &library, .{
        .client_name = "zdl-check-capture",
        .endpoint = null,
    });
    defer input.deinit();
    _ = input.spec();
    _ = input.endpoint_name();
    _ = input.overruns();

    var recorder = try zdl.stream.Stream(.mono, .mono).init(allocator, .{
        .format = input.spec().format,
        .sample_rate = input.spec().sample_rate,
    });
    defer recorder.deinit();
    try input.bind(.{ .mono = &recorder });
    _ = input.bound_count();
    _ = try input.wait(0);
    _ = try input.pump();
    try input.drop();
    try input.unbind(.{ .mono = &recorder });

    // Events from JACK (xrun, shutdown, rate and buffer-size changes).
    while (output.poll_event()) |event| switch (event) {
        .xrun => |count| _ = count,
        .sample_rate_changed => |rate| _ = rate,
        .buffer_size_changed => |frames| _ = frames,
        .shutdown => {},
    };
    while (input.poll_event()) |event| switch (event) {
        .xrun, .sample_rate_changed, .buffer_size_changed, .shutdown => {},
    };
}
