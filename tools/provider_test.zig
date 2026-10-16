//! Real ELF loader rejection/ownership tests; no audio hardware is accessed.
const std = @import("std");
const binding = @import("alsa_binding");
const fixtures = @import("provider_fixtures");

fn is_loaded(path: []const u8) !bool {
    const terminated = try std.testing.allocator.dupeSentinel(u8, path, 0);
    defer std.testing.allocator.free(terminated);
    const handle = std.c.dlopen(terminated.ptr, .{ .NOW = true, .NOLOAD = true }) orelse return false;
    // NOLOAD still acquires a reference. Balance the probe immediately.
    _ = std.c.dlclose(handle);
    return true;
}

test "ALSA rejects an absent provider" {
    try std.testing.expectError(error.Unavailable, binding.Library.open_path(fixtures.complete ++ ".absent"));
}

test "ALSA rejects early middle and late missing symbols without retaining the DSO" {
    inline for (.{ fixtures.pcm_open, fixtures.pcm_recover, fixtures.strerror }) |path| {
        try std.testing.expect(!try is_loaded(path));
        for (0..16) |_| {
            try std.testing.expectError(error.Unavailable, binding.Library.open_path(path));
            try std.testing.expect(!try is_loaded(path));
        }
    }
}

test "ALSA publishes a complete table and closes only its own loader reference" {
    try std.testing.expect(!try is_loaded(fixtures.complete));
    var first = try binding.Library.open_path(fixtures.complete);
    var first_open = true;
    defer if (first_open) first.deinit();
    try std.testing.expect(try is_loaded(fixtures.complete));
    var second = try binding.Library.open_path(fixtures.complete);
    defer second.deinit();
    first.deinit();
    first_open = false;
    try std.testing.expect(try is_loaded(fixtures.complete));
    // This scope owns the remaining reference until its deferred close.
}

test "ALSA complete provider is unloaded after final close" {
    // Self-contained: do not rely on test execution order.
    var library = try binding.Library.open_path(fixtures.complete);
    library.deinit();
    try std.testing.expect(!try is_loaded(fixtures.complete));
}
