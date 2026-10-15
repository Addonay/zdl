//! SDL audio/03-load-wav: decode the bundled ADPCM sample and loop it as a stream.
const std = @import("std");
const audio = @import("audio_common");
const common = @import("common");

const App = struct {
    output: *audio.StereoOutput,
    stream: *audio.MonoToStereo,
    source: audio.MonoToStereo.Source,
    data: []const u8,

    fn before_frame(self: *App, _: std.Io) !void {
        if (self.stream.queued_bytes() < self.data.len) try self.stream.write(self.source, self.data);
        _ = try self.output.pump();
    }
};

pub fn main(init: std.process.Init) !void {
    var wave = try audio.load_wave(init.gpa, init.io, "sample.wav");
    defer wave.deinit();
    if (wave.spec.channels != 1) return error.UnsupportedExampleWave;

    var library = audio.Audio.alsa.Library.open() catch |err| {
        audio.report_device_failure(err);
        return;
    };
    defer library.deinit();
    var output = audio.open_output(init.gpa, &library) catch |err| {
        audio.report_device_failure(err);
        return;
    };
    defer output.deinit();
    var stream = try audio.MonoToStereo.init(init.gpa, .{ .format = output.spec().format, .sample_rate = output.spec().sample_rate });
    defer stream.deinit();
    const source: audio.MonoToStereo.Source = .{ .format = wave.spec.format, .sample_rate = wave.spec.sample_rate };
    try stream.reserve(source, try wave.spec.frame_count(wave.data));
    try output.bind(.{ .mono = &stream });
    defer output.unbind(.{ .mono = &stream }) catch {};

    var app = App{ .output = &output, .stream = &stream, .source = source, .data = wave.data };
    try common.run(App, &app, init, "examples/audio/load-wav", frame);
}

fn frame(_: *App, renderer: *common.Renderer, _: usize) !void {
    try common.clear(renderer, .{ .r = 0, .g = 0, .b = 0, .a = 255 });
}
