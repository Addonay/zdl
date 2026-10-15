//! Hardware-free regression tests that instantiate libc-backed platform APIs.
const std = @import("std");
const Platform = @import("zdl").linux.Platform;

fn invalid_driver(allocator: std.mem.Allocator) !void {
    const platform = Platform.open(allocator, std.testing.io, .{
        .environment = .{ .video_driver = "invalid-driver-for-regression" },
    }) catch |err| switch (err) {
        error.BackendUnavailable => return,
        else => return err,
    };
    platform.close();
    return error.ExpectedBackendFailure;
}

test "platform invalid driver frees once including allocation failures" {
    try invalid_driver(std.testing.allocator);
    try std.testing.checkAllAllocationFailures(std.testing.allocator, invalid_driver, .{});
}
