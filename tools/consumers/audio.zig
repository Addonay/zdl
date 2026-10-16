//! Caller-driven mono-to-stereo stream; no ALSA/Pulse/PipeWire/JACK startup.
const std = @import("std");
const audio = @import("zdl").audio;
pub fn main(init: std.process.Init) !void {
    std.debug.print("mode={s}\n", .{@tagName(@import("builtin").mode)});
    var args = std.process.Args.Iterator.init(init.minimal.args);
    defer args.deinit();
    _ = args.next();
    const amplitude = if (args.next()) |value| try std.fmt.parseInt(i16, value, 10) else 123;
    const S = audio.Stream(.mono, .stereo);
    var stream = try S.init(init.gpa, .{ .format = .signed16_le, .sample_rate = 48000 });
    defer stream.deinit();
    var samples: [64]u8 = undefined;
    for (0..32) |index| std.mem.writeInt(i16, samples[index * 2 ..][0..2], amplitude, .little);
    const source: S.Source = .{ .format = .signed16_le, .sample_rate = 48000 };
    try stream.reserve(source, 32);
    try stream.write(source, &samples);
    stream.flush();
    var output: [128]u8 = undefined;
    const result = try stream.read_some(&output);
    if (result.len != output.len) return error.FrameCountMismatch;
    for (0..32) |index| {
        if (std.mem.readInt(i16, result[index * 4 ..][0..2], .little) != amplitude or
            std.mem.readInt(i16, result[index * 4 + 2 ..][0..2], .little) != amplitude) return error.SampleMismatch;
    }
    std.debug.print("audio frames={d} amplitude={d} hash={x}\n", .{ result.len / 4, amplitude, std.hash.Wyhash.hash(0, result) });
}
