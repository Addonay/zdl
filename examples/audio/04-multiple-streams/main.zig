//! SDL audio/04-multiple-streams: loop two independently decoded streams into
//! one stereo mix.
const std = @import("std");
const audio = @import("audio_common");
const common = @import("common");

const App = struct {
    output: *audio.StereoOutput,
    first: *audio.MonoToStereo,
    second: *audio.MonoToStereo,
    first_source: audio.MonoToStereo.Source,
    second_source: audio.MonoToStereo.Source,
    first_data: []const u8,
    second_data: []const u8,

    fn before_frame(self: *App, _: std.Io) !void {
        if (self.first.queued_bytes() < self.first_data.len) try self.first.write(self.first_source, self.first_data);
        if (self.second.queued_bytes() < self.second_data.len) try self.second.write(self.second_source, self.second_data);
        _ = try self.output.pump();
    }
};

pub fn main(init: std.process.Init) !void {
    var first_wave = try audio.load_wave(init.gpa, init.io, "sample.wav");
    defer first_wave.deinit();
    var second_wave = try audio.load_wave(init.gpa, init.io, "sword.wav");
    defer second_wave.deinit();
    if (first_wave.spec.channels != 1 or second_wave.spec.channels != 1) return error.UnsupportedExampleWave;

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
    var first = try audio.MonoToStereo.init(init.gpa, .{ .format = output.spec().format, .sample_rate = output.spec().sample_rate });
    defer first.deinit();
    var second = try audio.MonoToStereo.init(init.gpa, .{ .format = output.spec().format, .sample_rate = output.spec().sample_rate });
    defer second.deinit();
    const first_source: audio.MonoToStereo.Source = .{ .format = first_wave.spec.format, .sample_rate = first_wave.spec.sample_rate };
    const second_source: audio.MonoToStereo.Source = .{ .format = second_wave.spec.format, .sample_rate = second_wave.spec.sample_rate };
    try first.reserve(first_source, try first_wave.spec.frame_count(first_wave.data));
    try second.reserve(second_source, try second_wave.spec.frame_count(second_wave.data));
    try output.bind(.{ .mono = &first });
    defer output.unbind(.{ .mono = &first }) catch {};
    try output.bind(.{ .mono = &second });
    defer output.unbind(.{ .mono = &second }) catch {};

    var app = App{
        .output = &output,
        .first = &first,
        .second = &second,
        .first_source = first_source,
        .second_source = second_source,
        .first_data = first_wave.data,
        .second_data = second_wave.data,
    };
    try common.run(App, &app, init, "examples/audio/multiple-streams", frame);
}

fn frame(_: *App, renderer: *common.Renderer, _: usize) !void {
    try common.clear(renderer, .{ .r = 0, .g = 0, .b = 0, .a = 255 });
}
