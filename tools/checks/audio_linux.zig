//! Compile-only consumer for audio_linux. Every call that would touch audio
//! hardware is behind a PID guard, so running the binary is always a no-op.
const std = @import("std");
const zdl = @import("zdl");

pub fn check() !void {
    if (std.os.linux.getpid() != 0) return;
    const allocator = std.heap.page_allocator;

    var library = try zdl.audio.alsa.Library.open();
    defer library.deinit();

    var endpoints = try library.enumerate(allocator);
    defer endpoints.deinit();
    _ = zdl.audio.device.default_endpoint(endpoints.items);

    var output = try zdl.audio.device.Output(.stereo).open(allocator, &library, .{
        .format = .float32_le,
        .sample_rate = 48000,
    });
    defer output.deinit();
    _ = output.spec();
    _ = output.endpoint_name();
    _ = output.opened_as_default();
    _ = output.buffer_frames();
    _ = output.period_frames();
    _ = try output.migrate_default(null);

    var stream = try zdl.audio.Stream(.stereo, .stereo).init(allocator, .{
        .format = output.spec().format,
        .sample_rate = output.spec().sample_rate,
    });
    defer stream.deinit();
    try output.bind(.{ .stereo = &stream });
    try output.set_gain(0.5);
    output.set_paused(false);
    _ = output.bound_count();
    _ = try output.pump();
    _ = try output.wait(0);
    try output.drain();
    try output.drop();
    try output.unbind(.{ .stereo = &stream });
}
