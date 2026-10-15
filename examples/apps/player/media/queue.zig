//! Bounded blocking FIFO between the player's pipeline threads.
//!
//! Each message is a tagged union carrying the seek serial it was produced
//! under, so consumers can discard anything that predates the latest seek.
//! Producers block while the queue is full and consumers block while it is
//! empty. `close` wakes every waiter; afterwards pushes fail with `error.Closed`
//! and pops return the remaining items before reporting null.
//!
//! Ownership: items are moved in and out by value. Whoever holds an item owns
//! any resource it refers to. `drain` hands leftovers to a caller-supplied
//! disposer once every producer and consumer has stopped.
const std = @import("std");

/// One pipeline message. `flush` tells decoders to drop codec state for a seek,
/// `eof` marks end of stream, and `payload` carries data produced under `serial`.
pub fn Message(comptime Payload: type) type {
    return union(enum) {
        payload: struct { serial: u32, value: Payload },
        flush: u32,
        eof: u32,
    };
}

pub fn Queue(comptime T: type) type {
    return struct {
        const Self = @This();

        items: []T,
        head: usize = 0,
        len: usize = 0,
        closed: bool = false,
        mutex: std.Io.Mutex = .init,
        not_empty: std.Io.Condition = .init,
        not_full: std.Io.Condition = .init,

        /// Allocates storage for `capacity` items.
        pub fn init(allocator: std.mem.Allocator, capacity: usize) !Self {
            std.debug.assert(capacity > 0);
            return .{ .items = try allocator.alloc(T, capacity) };
        }

        /// Frees storage. Drain the queue first if its items own resources.
        pub fn deinit(self: *Self, allocator: std.mem.Allocator) void {
            if (self.items.len != 0) allocator.free(self.items);
            self.* = undefined;
        }

        /// Blocks while full. Fails with `error.Closed` once the queue is closed.
        pub fn push(self: *Self, io: std.Io, item: T) error{Closed}!void {
            self.mutex.lockUncancelable(io);
            defer self.mutex.unlock(io);
            while (self.len == self.items.len and !self.closed) self.not_full.waitUncancelable(io, &self.mutex);
            if (self.closed) return error.Closed;
            self.items[(self.head + self.len) % self.items.len] = item;
            self.len += 1;
            self.not_empty.signal(io);
        }

        /// Blocks while empty. Returns null only when closed and empty.
        pub fn pop(self: *Self, io: std.Io) ?T {
            self.mutex.lockUncancelable(io);
            defer self.mutex.unlock(io);
            while (self.len == 0 and !self.closed) self.not_empty.waitUncancelable(io, &self.mutex);
            return self.take_locked(io);
        }

        /// Returns the oldest item without blocking, or null when empty.
        pub fn try_pop(self: *Self, io: std.Io) ?T {
            self.mutex.lockUncancelable(io);
            defer self.mutex.unlock(io);
            return self.take_locked(io);
        }

        /// Number of queued items.
        pub fn count(self: *Self, io: std.Io) usize {
            self.mutex.lockUncancelable(io);
            defer self.mutex.unlock(io);
            return self.len;
        }

        /// Refuses new items and wakes every blocked producer and consumer.
        pub fn close(self: *Self, io: std.Io) void {
            self.mutex.lockUncancelable(io);
            defer self.mutex.unlock(io);
            self.closed = true;
            self.not_empty.broadcast(io);
            self.not_full.broadcast(io);
        }

        /// Removes every queued item, passing each to `dispose`. Call only after
        /// the queue is closed and no other thread is using it.
        pub fn drain(self: *Self, io: std.Io, context: anytype, comptime dispose: fn (@TypeOf(context), T) void) void {
            while (self.try_pop(io)) |item| dispose(context, item);
        }

        fn take_locked(self: *Self, io: std.Io) ?T {
            if (self.len == 0) return null;
            const item = self.items[self.head];
            self.head = (self.head + 1) % self.items.len;
            self.len -= 1;
            self.not_full.signal(io);
            return item;
        }
    };
}

test "queue preserves order and reports closure" {
    const io = std.testing.io;
    var queue = try Queue(u32).init(std.testing.allocator, 2);
    defer queue.deinit(std.testing.allocator);
    try queue.push(io, 1);
    try queue.push(io, 2);
    try std.testing.expectEqual(@as(?u32, 1), queue.try_pop(io));
    try queue.push(io, 3);
    try std.testing.expectEqual(@as(?u32, 2), queue.pop(io));
    try std.testing.expectEqual(@as(?u32, 3), queue.pop(io));
    queue.close(io);
    try std.testing.expectError(error.Closed, queue.push(io, 4));
    try std.testing.expectEqual(@as(?u32, null), queue.pop(io));
}
