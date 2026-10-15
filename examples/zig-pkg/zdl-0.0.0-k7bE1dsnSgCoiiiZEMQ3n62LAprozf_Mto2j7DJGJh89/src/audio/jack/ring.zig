//! Single-producer/single-consumer byte ring between the caller's thread and
//! JACK's realtime process callback.
//!
//! Synchronization contract (the only one this file supports):
//!   - Exactly one thread calls the producer methods (`push`, `writable_bytes`)
//!     and exactly one thread calls the consumer methods (`pop`, `discard`).
//!     The JACK process callback is one side; the owner's `pump` is the other.
//!   - `readable_bytes` and `writable_bytes` may be read from either side, but
//!     each returns only a snapshot. Callers must reserve room with the
//!     producer's own view before pushing.
//!   - `reset` requires both sides to be quiescent (for example after the JACK
//!     client was deactivated, which stops the process callback).
//!
//! Algorithm: `written` and `read` are monotonically increasing byte counters
//! (wrapping arithmetic). The producer owns `written` and publishes it with a
//! release store after copying bytes in; the consumer acquires `written` before
//! reading and publishes `read` with a release store after copying bytes out.
//! Each side acquires the other's counter before touching storage, so a byte
//! is never read before it is written and never overwritten before it is read.
//! Storage capacity is a power of two, so indices wrap with a mask. Copies that
//! cross the end of storage are split into two `memcpy`s.
//!
//! No allocation, locks, syscalls or blocking happen after `init`, so `push` and
//! `pop` are safe to call from the realtime callback.
const std = @import("std");

/// Ring creation failures. Storage is the only allocation.
pub const Error = std.mem.Allocator.Error || error{Overflow};

/// Bounded byte queue with one producer and one consumer (see module docs).
pub const Ring = struct {
    allocator: std.mem.Allocator,
    storage: []u8,
    mask: usize,
    /// Bytes ever pushed. Written only by the producer.
    written: std.atomic.Value(usize),
    /// Bytes ever popped. Written only by the consumer.
    read: std.atomic.Value(usize),

    /// Allocates at least `min_bytes` of storage, rounded up to a power of two.
    pub fn init(allocator: std.mem.Allocator, min_bytes: usize) Error!Ring {
        const size = std.math.ceilPowerOfTwo(usize, @max(min_bytes, 1)) catch return error.Overflow;
        const storage = try allocator.alloc(u8, size);
        return .{
            .allocator = allocator,
            .storage = storage,
            .mask = size - 1,
            .written = .init(0),
            .read = .init(0),
        };
    }

    /// Frees storage. The ring must not be in use by either side.
    pub fn deinit(self: *Ring) void {
        self.allocator.free(self.storage);
        self.* = undefined;
    }

    /// Total byte capacity.
    pub fn capacity(self: *const Ring) usize {
        return self.storage.len;
    }

    /// Bytes available to the consumer (snapshot).
    pub fn readable_bytes(self: *const Ring) usize {
        const written = self.written.load(.acquire);
        const read = self.read.load(.acquire);
        return written -% read;
    }

    /// Free bytes available to the producer (snapshot; only grows until the
    /// producer pushes, because the consumer can only free space).
    pub fn writable_bytes(self: *const Ring) usize {
        return self.storage.len - self.readable_bytes();
    }

    /// Producer: appends all of `bytes` or nothing. Returns false when there is
    /// not enough room; the ring is unchanged in that case.
    pub fn push(self: *Ring, bytes: []const u8) bool {
        const written = self.written.load(.monotonic);
        const read = self.read.load(.acquire);
        if (self.storage.len - (written -% read) < bytes.len) return false;
        const start = written & self.mask;
        const first = @min(bytes.len, self.storage.len - start);
        @memcpy(self.storage[start .. start + first], bytes[0..first]);
        @memcpy(self.storage[0 .. bytes.len - first], bytes[first..]);
        self.written.store(written +% bytes.len, .release);
        return true;
    }

    /// Consumer: copies up to `destination.len` bytes in arrival order and
    /// returns the number copied. Never blocks.
    pub fn pop(self: *Ring, destination: []u8) usize {
        const read = self.read.load(.monotonic);
        const written = self.written.load(.acquire);
        const count = @min(destination.len, written -% read);
        const start = read & self.mask;
        const first = @min(count, self.storage.len - start);
        @memcpy(destination[0..first], self.storage[start .. start + first]);
        @memcpy(destination[first..count], self.storage[0 .. count - first]);
        self.read.store(read +% count, .release);
        return count;
    }

    /// Consumer: drops every readable byte without copying it.
    pub fn discard(self: *Ring) void {
        self.read.store(self.written.load(.acquire), .release);
    }

    /// Empties the ring. Both sides must be quiescent (see module docs).
    pub fn reset(self: *Ring) void {
        self.written.store(0, .monotonic);
        self.read.store(0, .monotonic);
    }
};
