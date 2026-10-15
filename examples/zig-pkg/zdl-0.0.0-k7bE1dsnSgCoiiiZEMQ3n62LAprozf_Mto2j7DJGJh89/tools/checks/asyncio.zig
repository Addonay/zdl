const std = @import("std");
const zdl = @import("zdl");
const asyncio = zdl.asyncio;

const User = struct { tag: u32 };
const Q = asyncio.Queue(User);
const File = asyncio.AsyncFile(User);

pub fn check() !void {
    // Compile-only consumer: the guard keeps every call from executing.
    if (std.os.linux.getpid() != 0) return;
    const gpa = std.heap.page_allocator;
    inline for (.{ asyncio.Backend.io_uring, asyncio.Backend.generic }) |backend| {
        var queue = try Q.init(gpa, backend);
        defer queue.deinit();
        var buf: [16]u8 = undefined;
        const file = try File.open(gpa, "consumer.bin", asyncio.Mode.parse("w+") orelse .read);
        const size = try file.size();
        _ = size;
        _ = try file.read(&queue, buf[0..], 0, .{ .tag = 1 });
        _ = try file.write(&queue, buf[0..], 0, .{ .tag = 2 });
        _ = try file.close(&queue, true, .{ .tag = 3 });
        _ = try queue.load_file("consumer.bin", .{ .tag = 4 });
        if (queue.get_result()) |outcome| {
            if (std.meta.activeTag(outcome.buffer) == .loaded) gpa.free(outcome.buffer.loaded);
            _ = outcome.result;
        }
        if (queue.wait_result(0)) |_| {}
        queue.signal();
    }
}
