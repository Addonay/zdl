//! SDL audio/01-simple-playback: keep a half second of 440-Hz mono float queued.
const std = @import("std");
const audio = @import("audio_common");
const common = @import("common");

const App = struct {
    output: *audio.StereoOutput,
    stream: *audio.MonoToStereo,
    sample_index: u32 = 0,

    fn before_frame(self: *App, _: std.Io) !void {
        if (self.stream.queued_bytes() < (8000 * @sizeOf(f32)) / 2) {
            var samples: [512]f32 = undefined;
            for (&samples) |*sample| {
                const phase = @as(f32, @floatFromInt(self.sample_index)) * 440 / 8000;
                sample.* = @sin(phase * 2 * std.math.pi);
                self.sample_index = (self.sample_index + 1) % 8000;
            }
            try self.stream.write(.{ .format = .float32_le, .sample_rate = 8000 }, std.mem.sliceAsBytes(&samples));
        }
        _ = try self.output.pump();
    }
};

pub fn main(init: std.process.Init) !void {
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
    try stream.reserve(.{ .format = .float32_le, .sample_rate = 8000 }, 512);
    try output.bind(.{ .mono = &stream });
    defer output.unbind(.{ .mono = &stream }) catch {};

    var app = App{ .output = &output, .stream = &stream };
    try common.run(App, &app, init, "examples/audio/simple-playback", frame);
}

fn frame(_: *App, renderer: *common.Renderer, _: usize) !void {
    try common.clear(renderer, .{ .r = 0, .g = 0, .b = 0, .a = 255 });
}
