//! Compile-only consumer for the audio3 area (PipeWire backend, ALSA capture
//! and hotplug). Every call that would touch audio hardware or the sound server
//! is behind a PID guard, so running the binary is always a no-op.
const std = @import("std");
const zdl = struct {
    const pipewire_context = @import("zdl").audio.pipewire.context;
    const pipewire_stream = @import("zdl").audio.pipewire.stream;
    const pipewire_device = @import("zdl").audio.pipewire.device;
    const pipewire_pod = @import("zdl").audio.pipewire.pod;
    const alsa_device = @import("zdl").audio.alsa;
    const alsa_hotplug = @import("zdl").audio.alsa_hotplug;
    const audio_device = @import("zdl").audio.device;
    const audio_stream = struct {
        const Stream = @import("zdl").audio.Stream;
    };
    const audio_processing = @import("zdl").audio;
};

pub fn check() !void {
    if (std.os.linux.getpid() != 0) return;
    const allocator = std.heap.page_allocator;

    // PipeWire: connection, enumeration and events.
    var pipewire = try zdl.pipewire_context.Library.open();
    defer pipewire.deinit();
    var connection = try zdl.pipewire_context.Connection.open(allocator, &pipewire, .{});
    defer connection.deinit();

    var devices = try connection.devices(allocator);
    defer devices.deinit();
    for (devices.items) |device| {
        _ = device.id;
        _ = device.class;
        _ = device.name.len;
        _ = device.description.len;
        _ = device.monitor;
        _ = try connection.node_capabilities(device.class, device.name);
    }
    if (try connection.default_device(allocator, .sink)) |name| allocator.free(name);
    var events = try connection.poll_events(allocator);
    defer events.deinit();
    for (events.items) |event| switch (event) {
        .device_added => |device| _ = device.name.len,
        .device_removed => |id| _ = id,
        .default_changed => |change| _ = change.name.len,
    };

    // PipeWire playback: Output mirrors audio.device.Output.
    var output = try zdl.pipewire_device.Output(.stereo).open(allocator, &connection, .{
        .format = .float32_le,
        .sample_rate = 48000,
    });
    defer output.deinit();
    _ = output.spec();
    _ = output.endpoint_name();
    _ = output.buffer_frames();
    _ = output.period_frames();
    _ = try output.latency();
    _ = try output.migrate_default(null);

    var mixer = try zdl.audio_stream.Stream(.stereo, .stereo).init(allocator, .{
        .format = output.spec().format,
        .sample_rate = output.spec().sample_rate,
    });
    defer mixer.deinit();
    try output.bind(.{ .stereo = &mixer });
    try output.set_gain(0.5);
    try output.set_paused(false);
    _ = output.bound_count();
    _ = try output.pump();
    _ = try output.wait(0);
    output.drain() catch |err| switch (err) {
        error.WouldBlock => {},
        else => return err,
    };
    try output.drop();
    try output.unbind(.{ .stereo = &mixer });

    // PipeWire capture: Input fans captured audio into bound streams.
    var input = try zdl.pipewire_device.Input(.stereo).open(allocator, &connection, .{
        .format = .signed16_le,
        .sample_rate = 48000,
    });
    defer input.deinit();
    _ = input.spec();
    _ = input.endpoint_name();
    try input.set_paused(false);
    _ = try input.latency();
    _ = try input.migrate_default(null);
    var sink = try zdl.audio_stream.Stream(.stereo, .stereo).init(allocator, .{
        .format = .float32_le,
        .sample_rate = 48000,
    });
    defer sink.deinit();
    try input.bind(.{ .stereo = &sink });
    _ = input.bound_count();
    _ = try input.pump();
    _ = try input.wait(0);
    try input.drop();
    try input.unbind(.{ .stereo = &sink });

    // ALSA: hotplug watcher and capture Input.
    var alsa_library = try zdl.alsa_device.Library.open();
    defer alsa_library.deinit();
    var watcher = try zdl.alsa_hotplug.Watcher.open(allocator, &alsa_library);
    defer watcher.deinit();
    var changes = try watcher.poll_changes();
    defer changes.deinit();
    _ = changes.is_empty();
    for (changes.added) |endpoint| _ = endpoint.name.len;
    for (changes.removed) |name| _ = name.len;
    if (changes.default) |change| {
        if (change.name) |name| _ = name.len;
    }

    var alsa_input = try zdl.audio_device.Input(.stereo).open(allocator, &alsa_library, .{
        .format = .signed16_le,
        .sample_rate = 48000,
    });
    defer alsa_input.deinit();
    _ = alsa_input.spec();
    _ = alsa_input.endpoint_name();
    _ = alsa_input.opened_as_default();
    _ = try alsa_input.migrate_default(null);
    _ = alsa_input.buffer_frames();
    _ = alsa_input.period_frames();
    try alsa_input.bind(.{ .stereo = &sink });
    _ = alsa_input.bound_count();
    _ = try alsa_input.pump();
    _ = try alsa_input.wait(0);
    try alsa_input.drop();
    try alsa_input.unbind(.{ .stereo = &sink });

    // Pod encoding is pure Zig: exercise the writer and reader on a fixed buffer.
    var storage: [512]u64 align(8) = undefined;
    const bytes = std.mem.sliceAsBytes(&storage);
    const param = try zdl.pipewire_pod.build_enum_format(bytes, &.{ .float32_le, .signed16_le }, 48000, 2, zdl.pipewire_pod.layout_positions(.stereo));
    _ = try zdl.pipewire_pod.read_format(param);
}
