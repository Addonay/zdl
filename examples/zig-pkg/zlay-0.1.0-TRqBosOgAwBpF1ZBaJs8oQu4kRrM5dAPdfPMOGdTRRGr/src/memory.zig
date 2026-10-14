//! Memory primitives. zlay never allocates: you hand `Context.init` one block
//! of bytes and everything is carved out of it with a bump allocator.
//!
//! Memory is split in two regions (exactly like Clay):
//!   * persistent: caches that live across frames (ids, text measurement,
//!     scroll and transition state). Allocated once.
//!   * ephemeral: per-frame arrays (elements, render commands, scratch
//!     buffers). The arena is rewound to `arena_reset_offset` at the start of
//!     every frame and the same arrays are re-carved at the same addresses.

/// Allocations are aligned to a cache line, as in Clay.
pub const cache_line = 64;

pub fn alignForward(value: usize, comptime alignment: usize) usize {
    return (value + (alignment - 1)) & ~@as(usize, alignment - 1);
}

/// Panics in safe builds, optimizer hint in unsafe ones. (zlay doesn't import
/// std, so this replaces `std.debug.assert`.)
pub inline fn assert(ok: bool) void {
    if (!ok) unreachable;
}

/// Bump allocator over a caller provided byte buffer.
pub const Arena = struct {
    /// Start of the (64 byte aligned) buffer. Unused when `measuring`.
    memory: [*]u8,
    capacity: usize,
    next: usize = 0,
    /// When true nothing is written; we only count how many bytes would be
    /// needed. Used by `Context.minMemorySize`.
    measuring: bool = false,

    pub fn init(memory: [*]u8, capacity: usize) Arena {
        return .{ .memory = memory, .capacity = capacity };
    }

    /// An arena that only measures how much memory a layout would need.
    pub fn measure() Arena {
        return .{ .memory = undefined, .capacity = ~@as(usize, 0), .measuring = true };
    }

    /// Reserve `n` items of `T`. Returns null if the buffer is too small.
    pub fn alloc(self: *Arena, comptime T: type, n: usize) ?[]T {
        const start = alignForward(self.next, cache_line);
        const size = @sizeOf(T) * n;
        if (start + size > self.capacity) return null;
        self.next = start + size;
        if (self.measuring) {
            // A well aligned, never dereferenced pointer: length 0.
            return @as([*]T, @ptrFromInt(@alignOf(T)))[0..0];
        }
        const ptr: [*]T = @ptrCast(@alignCast(self.memory + start));
        return ptr[0..n];
    }

    /// Reserve a single `T`.
    pub fn create(self: *Arena, comptime T: type) ?*T {
        const slice = self.alloc(T, 1) orelse return null;
        if (self.measuring) return null;
        return &slice[0];
    }
};

/// A fixed capacity array list over arena memory (Clay's `CLAY__ARRAY_DEFINE`).
///
/// All operations are O(1) and never allocate. Adding past capacity is
/// refused (returns null / false) rather than crashing, matching Clay's
/// "degrade gracefully" behavior; the context reports the error.
pub fn List(comptime T: type) type {
    return struct {
        const Self = @This();

        ptr: [*]T = undefined,
        len: u32 = 0,
        capacity: u32 = 0,

        pub fn fromSlice(buffer: []T) Self {
            return .{ .ptr = buffer.ptr, .len = 0, .capacity = @intCast(buffer.len) };
        }

        /// Allocate `capacity` items from `arena`. In measuring mode (or when
        /// the arena is exhausted) the list ends up with capacity 0.
        pub fn alloc(arena: *Arena, capacity: u32) ?Self {
            const buffer = arena.alloc(T, capacity) orelse return null;
            return fromSlice(buffer);
        }

        /// Live items.
        pub fn items(self: Self) []T {
            return self.ptr[0..self.len];
        }

        /// The whole backing buffer, including slots past `len`.
        pub fn backing(self: Self) []T {
            return self.ptr[0..self.capacity];
        }

        pub fn isFull(self: Self) bool {
            return self.len >= self.capacity;
        }

        /// Pointer to a live item.
        pub fn get(self: Self, index: u32) *T {
            assert(index < self.len);
            return &self.ptr[index];
        }

        /// Pointer to any slot of the backing buffer (may be past `len`).
        /// Used for data deliberately kept beyond the live region between
        /// frames (exit transitions).
        pub fn getRaw(self: Self, index: u32) *T {
            assert(index < self.capacity);
            return &self.ptr[index];
        }

        pub fn last(self: Self) ?*T {
            if (self.len == 0) return null;
            return &self.ptr[self.len - 1];
        }

        /// Append, returning a pointer to the stored item, or null if full.
        pub fn append(self: *Self, item: T) ?*T {
            if (self.len >= self.capacity) return null;
            self.ptr[self.len] = item;
            self.len += 1;
            return &self.ptr[self.len - 1];
        }

        pub fn pop(self: *Self) T {
            assert(self.len > 0);
            self.len -= 1;
            return self.ptr[self.len];
        }

        /// Remove by moving the last item into the hole. O(1), changes order.
        pub fn swapRemove(self: *Self, index: u32) T {
            assert(index < self.len);
            const removed = self.ptr[index];
            self.len -= 1;
            self.ptr[index] = self.ptr[self.len];
            return removed;
        }

        /// Store at `index` (< capacity), growing `len` to cover it.
        pub fn set(self: *Self, index: u32, item: T) *T {
            assert(index < self.capacity);
            self.ptr[index] = item;
            if (index >= self.len) self.len = index + 1;
            return &self.ptr[index];
        }

        /// Store at `index` (< capacity) without touching `len`.
        pub fn setRaw(self: *Self, index: u32, item: T) *T {
            assert(index < self.capacity);
            self.ptr[index] = item;
            return &self.ptr[index];
        }

        /// Index of an item pointer that lives in this list's buffer.
        pub fn indexOf(self: Self, item: *const T) u32 {
            const offset = @intFromPtr(item) - @intFromPtr(self.ptr);
            return @intCast(offset / @sizeOf(T));
        }
    };
}
