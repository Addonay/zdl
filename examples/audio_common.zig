//! Shared audio examples: ALSA-backed stereo output, file decoding and the
//! planar PCM fixtures from SDL's public-domain audio example.
const std = @import("std");
const zdl = @import("zdl");

pub const Audio = zdl.audio;
pub const MonoToStereo = Audio.Stream(.mono, .stereo);
pub const StereoToStereo = Audio.Stream(.stereo, .stereo);
pub const StereoOutput = Audio.device.Output(.stereo);
pub const DecodedWave = zdl.audio.wave.Decoded;

pub const planar_left = @embedFile("assets/planar-left.u8");
pub const planar_right = @embedFile("assets/planar-right.u8");

/// Opens the default ALSA playback route with the examples' preferred format.
/// ALSA can negotiate another format/rate; use `Output.spec()` for streams.
pub fn open_output(allocator: std.mem.Allocator, library: *Audio.alsa.Library) Audio.device.Error!StereoOutput {
    return StereoOutput.open(allocator, library, .{ .format = .float32_le, .sample_rate = 48_000 });
}

/// Loads and decodes a WAVE asset from the examples package directory.
pub fn load_wave(allocator: std.mem.Allocator, io: std.Io, filename: []const u8) !DecodedWave {
    const path = try std.fmt.allocPrint(allocator, "assets/{s}", .{filename});
    defer allocator.free(path);
    const bytes = try std.Io.Dir.cwd().readFileAlloc(io, path, allocator, .unlimited);
    defer allocator.free(bytes);
    const wave = try Audio.Wave.parse(bytes, .{});
    return wave.decode(allocator);
}

pub fn report_device_failure(err: anyerror) void {
    std.debug.print("audio device unavailable; example compiled, but playback was skipped ({s})\n", .{@errorName(err)});
}
