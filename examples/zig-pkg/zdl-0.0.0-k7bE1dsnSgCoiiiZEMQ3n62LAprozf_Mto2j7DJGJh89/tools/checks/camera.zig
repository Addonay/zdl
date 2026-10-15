const std = @import("std");
const zdl = @import("zdl").camera;
pub fn check() !void {
    if (std.os.linux.getpid() != 0) return;
    const gpa = std.heap.page_allocator;
    var registry = zdl.v4l2.Registry.init(gpa);
    defer registry.deinit();
    _ = try registry.rescan();
    for (registry.devices()) |*entry| {
        var session = try zdl.v4l2.Session.open(gpa, entry, null);
        defer session.deinit();
        _ = session.spec();
        _ = session.permission();
        if (try session.wait(100)) {
            if (try session.acquire()) |frame| {
                _ = frame.data;
                _ = frame.stride;
                _ = frame.timestamp_ns;
                try session.release(frame);
            }
        }
    }
    var timestamp: zdl.camera.Timestamp = .{};
    _ = timestamp.map(0, 0);
    timestamp.reset();
    _ = zdl.camera.spec_precedes(.{}, .{});
    _ = zdl.camera.choose_closest(&.{}, null);
    _ = zdl.camera.negotiate(&.{}, null) catch {};
}
