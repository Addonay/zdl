//! Run: zig build-exe -O ReleaseFast --dep zdl -Mroot=tools/image/bench_png.zig -Mzdl=src/root.zig -femit-bin=/tmp/zdl-bench-png
const std = @import("std");
const zdl = @import("zdl");
pub fn main(init: std.process.Init) !void {
    const a = init.gpa;
    var image = try zdl.surface.Surface.init(a, 1024, 1024, .rgba8, null);
    defer image.deinit();
    for (0..1024) |y| for (0..1024) |x| {
        const i = y * image.view.stride + x * 4;
        image.view.data[i..][0..4].* = .{ @truncate(x), @truncate(y), @truncate((x ^ y) >> 2), 255 };
    };
    const encoded = try zdl.image.png.encode(a, image.view);
    defer a.free(encoded);
    var checksum: u64 = 0;
    for (0..3) |_| {
        var decoded = try zdl.image.png.decode(a, encoded);
        decoded.deinit();
    }
    const begin = std.Io.Clock.awake.now(init.io);
    for (0..40) |_| {
        var decoded = try zdl.image.png.decode(a, encoded);
        defer decoded.deinit();
        checksum +%= decoded.data[12345];
    }
    const mid = std.Io.Clock.awake.now(init.io);
    for (0..10) |_| {
        const result = try zdl.image.png.encode(a, image.view);
        checksum +%= result.len;
        a.free(result);
    }
    const end = std.Io.Clock.awake.now(init.io);
    std.debug.print("png gradient 1024x1024 rgba: encoded={d} decode_ns={d} encode_ns={d} checksum={d}\n", .{ encoded.len, @divTrunc(mid.nanoseconds - begin.nanoseconds, 40), @divTrunc(end.nanoseconds - mid.nanoseconds, 10), checksum });
}
