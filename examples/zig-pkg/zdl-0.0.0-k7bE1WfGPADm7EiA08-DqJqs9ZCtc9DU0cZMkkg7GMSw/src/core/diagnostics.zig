//! Optional human-readable context accompanying a Zig error union.
//! There is no thread-local last-error slot. The caller owns each diagnostic,
//! decides where it is shared, and supplies its allocator explicitly.
const std = @import("std");

/// An owned formatted message with a 128-byte inline fast path.
/// `set` builds the replacement before releasing old storage, so formatting
/// arguments may refer to the current message. Allocation failure preserves it.
/// This value must not be copied after allocation; call `deinit` before its
/// allocator is destroyed. It is not synchronized for concurrent mutation.
pub const Diagnostic = struct {
    allocator: std.mem.Allocator,
    inline_buffer: [128]u8 = undefined,
    length: usize = 0,
    spill: ?[]u8 = null,
    owner: ?std.mem.Allocator = null,

    /// Creates an empty diagnostic. No allocation occurs here.
    pub fn init(allocator: std.mem.Allocator) Diagnostic {
        return .{ .allocator = allocator };
    }

    /// Releases any owned storage and clears the message. Repeated calls are
    /// safe; the allocator remains available if this value is reused.
    pub fn deinit(self: *Diagnostic) void {
        if (self.spill) |memory| self.owner.?.free(memory);
        self.spill = null;
        self.owner = null;
        self.length = 0;
    }

    /// Returns borrowed text, valid until the next successful set or deinit.
    /// Native strings are slices; no C terminator is allocated or maintained.
    pub fn text(self: *const Diagnostic) []const u8 {
        if (self.spill) |memory| return memory[0..self.length];
        return self.inline_buffer[0..self.length];
    }

    /// Replaces the message with a Zig-format string. OutOfMemory is returned
    /// to the caller rather than hidden in another last-error message.
    pub fn set(self: *Diagnostic, comptime fmt: []const u8, args: anytype) std.mem.Allocator.Error!void {
        // Staging prevents overwriting text that is also one of the arguments.
        var buffer: [128]u8 = undefined;
        if (std.fmt.bufPrint(&buffer, fmt, args)) |written| {
            const length = written.len;
            self.deinit();
            @memcpy(self.inline_buffer[0..length], buffer[0..length]);
            self.length = length;
            return;
        } else |_| {}

        const needed = std.fmt.count(fmt, args);
        const memory = try self.allocator.alloc(u8, needed);
        errdefer self.allocator.free(memory);
        const written = std.fmt.bufPrint(memory, fmt, args) catch unreachable;
        self.deinit();
        self.spill = memory;
        // Capture provenance so freeing remains correct if allocator changes.
        self.owner = self.allocator;
        self.length = written.len;
    }
};

// Existing message-storage checks adapted to explicit ownership; no TLS or
// allocation hooks are needed to compile this subsystem.
test "an unset error has no message" {
    var message = Diagnostic.init(std.testing.allocator);
    defer message.deinit();
    try std.testing.expectEqualStrings("", message.text());
}
test "set formats into the current slot" {
    var message = Diagnostic.init(std.testing.allocator);
    defer message.deinit();
    try message.set("could not open {s}", .{"/dev/nope"});
    try std.testing.expectEqualStrings("could not open /dev/nope", message.text());
}
test "a short message does not allocate" {
    var message = Diagnostic.init(std.testing.allocator);
    defer message.deinit();
    try message.set("short", .{});
    try std.testing.expect(message.spill == null);
}
test "an oversized message spills and is reported in full" {
    var message = Diagnostic.init(std.testing.allocator);
    defer message.deinit();
    const oversized = "This error message is deliberately much longer than the " ++
        "one hundred and twenty eight byte inline buffer, so formatting it has " ++
        "to spill onto the heap.";
    try message.set(oversized, .{});
    try std.testing.expect(message.spill != null);
    try std.testing.expectEqualStrings(oversized, message.text());
}
