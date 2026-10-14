//! Vulkan free-range bookkeeping for device-memory pools.
//!
//! The allocator in `device.zig` owns Vulkan memory blocks and uses this
//! offset-sorted list to place resources with their required alignment. Adjacent
//! free ranges merge on release. The list reserves space before each allocation
//! so releasing a resource never needs to allocate host memory.

const std = @import("std");

pub const Region = struct {
    offset: u64,
    size: u64,
};

/// A sorted free list for one Vulkan memory block.
pub const FreeList = struct {
    allocator: std.mem.Allocator,
    block_size: u64,
    regions: std.ArrayList(Region) = .empty,
    live_allocations: usize = 0,

    pub fn init(allocator: std.mem.Allocator, block_size: u64) std.mem.Allocator.Error!FreeList {
        var self: FreeList = .{ .allocator = allocator, .block_size = block_size };
        try self.regions.append(allocator, .{ .offset = 0, .size = block_size });
        return self;
    }

    pub fn deinit(self: *FreeList) void {
        self.regions.deinit(self.allocator);
        self.* = undefined;
    }

    /// Allocates the first best-fit range whose aligned offset can hold `size`.
    /// The returned range contains exactly `size` bytes; alignment padding stays
    /// in the surrounding free regions and can be reused later.
    pub fn allocate(self: *FreeList, size: u64, alignment: u64) std.mem.Allocator.Error!?u64 {
        if (size == 0 or alignment == 0) return null;

        // One allocation can split one free region in two. Every live allocation
        // can later add at most one free region, so reserve that headroom now.
        try self.regions.ensureUnusedCapacity(self.allocator, self.live_allocations + 2);

        var selected: ?usize = null;
        var selected_waste: u64 = std.math.maxInt(u64);
        var selected_offset: u64 = 0;
        for (self.regions.items, 0..) |region, index| {
            const offset = align_forward(region.offset, alignment) orelse continue;
            const end = std.math.add(u64, offset, size) catch continue;
            const region_end = std.math.add(u64, region.offset, region.size) catch unreachable;
            if (end > region_end) continue;
            const waste = region.size - size;
            if (waste < selected_waste) {
                selected = index;
                selected_waste = waste;
                selected_offset = offset;
            }
        }
        const index = selected orelse return null;

        const region = self.regions.items[index];
        const region_end = region.offset + region.size;
        const allocation_end = selected_offset + size;
        const prefix = selected_offset - region.offset;
        const suffix = region_end - allocation_end;
        if (prefix != 0 and suffix != 0) {
            const old_len = self.regions.items.len;
            self.regions.items.len += 1;
            var move = old_len;
            while (move > index + 1) : (move -= 1) {
                self.regions.items[move] = self.regions.items[move - 1];
            }
            self.regions.items[index] = .{ .offset = region.offset, .size = prefix };
            self.regions.items[index + 1] = .{ .offset = allocation_end, .size = suffix };
        } else if (prefix != 0) {
            self.regions.items[index].size = prefix;
        } else if (suffix != 0) {
            self.regions.items[index] = .{ .offset = allocation_end, .size = suffix };
        } else {
            _ = self.regions.orderedRemove(index);
        }
        self.live_allocations += 1;
        return selected_offset;
    }

    /// Returns a prior allocation. Adjacent ranges are merged without allocating.
    pub fn release(self: *FreeList, offset: u64, size: u64) void {
        std.debug.assert(size != 0);
        const end = std.math.add(u64, offset, size) catch unreachable;
        std.debug.assert(end <= self.block_size);
        std.debug.assert(self.live_allocations > 0);
        self.live_allocations -= 1;

        var index: usize = 0;
        while (index < self.regions.items.len and self.regions.items[index].offset < offset) : (index += 1) {}

        if (index > 0) {
            const previous = &self.regions.items[index - 1];
            const previous_end = previous.offset + previous.size;
            std.debug.assert(previous_end <= offset);
            if (previous_end == offset) {
                previous.size += size;
                if (index < self.regions.items.len and previous.offset + previous.size == self.regions.items[index].offset) {
                    previous.size += self.regions.items[index].size;
                    _ = self.regions.orderedRemove(index);
                }
                return;
            }
        }

        if (index < self.regions.items.len) {
            const next = &self.regions.items[index];
            std.debug.assert(end <= next.offset);
            if (end == next.offset) {
                next.offset = offset;
                next.size += size;
                return;
            }
        }

        self.regions.appendAssumeCapacity(.{ .offset = offset, .size = size });
        var move = self.regions.items.len - 1;
        while (move > index) : (move -= 1) self.regions.items[move] = self.regions.items[move - 1];
        self.regions.items[index] = .{ .offset = offset, .size = size };
    }

    fn align_forward(value: u64, alignment: u64) ?u64 {
        const remainder = value % alignment;
        if (remainder == 0) return value;
        return std.math.add(u64, value, alignment - remainder) catch null;
    }
};

test "free list aligns, splits, and coalesces returned regions" {
    const allocator = std.testing.allocator;
    var free = try FreeList.init(allocator, 128);
    defer free.deinit();

    const first = (try free.allocate(17, 16)).?;
    const second = (try free.allocate(24, 32)).?;
    try std.testing.expectEqual(@as(u64, 0), first);
    try std.testing.expectEqual(@as(u64, 32), second);
    try std.testing.expectEqual(@as(usize, 2), free.live_allocations);
    try std.testing.expectEqual(@as(usize, 2), free.regions.items.len);

    free.release(first, 17);
    free.release(second, 24);
    try std.testing.expectEqual(@as(usize, 0), free.live_allocations);
    try std.testing.expectEqual(@as(usize, 1), free.regions.items.len);
    try std.testing.expectEqual(Region{ .offset = 0, .size = 128 }, free.regions.items[0]);
}

test "free list rejects exhaustion without changing its ranges" {
    const allocator = std.testing.allocator;
    var free = try FreeList.init(allocator, 32);
    defer free.deinit();

    const offset = (try free.allocate(32, 8)).?;
    try std.testing.expectEqual(@as(u64, 0), offset);
    try std.testing.expectEqual(@as(?u64, null), try free.allocate(1, 1));
    free.release(offset, 32);
    try std.testing.expectEqual(@as(u64, 0), free.regions.items[0].offset);
}
