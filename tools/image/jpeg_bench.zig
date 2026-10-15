//! End-to-end JPEG decode benchmark: allocations, entropy decode, IDCT and RGBA output.
//! Run the same ReleaseFast executable several times; fixtures are embedded and
//! no file I/O, hashes or fixture generation are included in measured intervals.
const std = @import("std");
const jpeg = @import("zdl").image.jpeg;
const fixtures = @import("fixtures");
pub fn main(init: std.process.Init) !void {
    const cases = .{
        .{ "baseline-420", fixtures.baseline },
        .{ "progressive-420", fixtures.progressive },
        .{ "noise-444", fixtures.noise },
        .{ "greyscale", fixtures.grey },
    };
    inline for (cases) |case| {
        var warm = try jpeg.decode(std.heap.page_allocator, case[1], .rgba);
        const hash = std.hash.Wyhash.hash(0, warm.data);
        warm.deinit();
        const iterations = 40;
        const start = std.Io.Timestamp.now(init.io, .awake).nanoseconds;
        for (0..iterations) |_| {
            var image = try jpeg.decode(std.heap.page_allocator, case[1], .rgba);
            std.mem.doNotOptimizeAway(image.data.ptr);
            image.deinit();
        }
        const elapsed = std.Io.Timestamp.now(init.io, .awake).nanoseconds - start;
        std.debug.print("{s}: {d:.3} ms/decode hash={x}\n", .{ case[0], @as(f64, @floatFromInt(elapsed)) / (iterations * 1e6), hash });
    }
}
