//! Immutable tightly packed straight-alpha sRGB RGBA8 raster lease for painting.
const std = @import("std");
const identity = @import("../core/identity.zig");
const surface = @import("../video/surface.zig");
pub const Error = surface.Error || error{ DomainExhausted, ReferenceLimit, ImageLimit, Closed };
pub const View = struct {
    id: identity.Domain,
    width: u31,
    height: u31,
    stride: usize,
    /// Borrowed straight-alpha sRGB RGBA8, valid while an owning lease survives.
    rgba: []const u8,
};
const Storage = struct {
    allocator: std.mem.Allocator,
    references: std.atomic.Value(usize) = .init(1),
    view: View,
};
/// Immutable pixels; clone/deinit on different handles may run concurrently.
/// The allocator must support the thread performing final release. Never race
/// operations on the same handle or deinitialize independent shallow copies.
pub const Image = struct {
    storage: ?*Storage,
    /// Copies/converts a validated borrowed surface, excluding row padding. The
    /// source/palette need only live through this call and must not change then.
    /// Surface code values must already be straight-alpha sRGB; format conversion
    /// here is not ICC/transfer-function conversion.
    pub fn copy(allocator: std.mem.Allocator, source: surface.View, max_bytes: usize) Error!Image {
        const checked = try surface.View.init(source.data, source.width, source.height, source.stride, source.format, source.palette);
        const stride = std.math.mul(usize, checked.width, 4) catch return error.Overflow;
        const size = std.math.mul(usize, stride, checked.height) catch return error.Overflow;
        if (size > max_bytes) return error.ImageLimit;
        const storage = try allocator.create(Storage);
        errdefer allocator.destroy(storage);
        const bytes = try allocator.alloc(u8, size);
        errdefer allocator.free(bytes);
        if (checked.width != 0) {
            for (0..checked.height) |y| for (0..checked.width) |x| {
                const color = try checked.read(x, y);
                const offset = y * stride + x * 4;
                @memcpy(bytes[offset..][0..4], &[_]u8{ color.r, color.g, color.b, color.a });
            };
        }
        storage.* = .{ .allocator = allocator, .view = .{ .id = try identity.issue_domain(), .width = checked.width, .height = checked.height, .stride = stride, .rgba = bytes } };
        return .{ .storage = storage };
    }
    /// Retains immutable pixels; saturation fails without changing ownership.
    pub fn clone(self: *const Image) Error!Image {
        const storage = self.storage orelse return error.Closed;
        var count = storage.references.load(.monotonic);
        while (true) {
            if (count == std.math.maxInt(usize)) return error.ReferenceLimit;
            if (storage.references.cmpxchgWeak(count, count + 1, .monotonic, .monotonic)) |actual| count = actual else break;
        }
        return .{ .storage = storage };
    }
    /// Borrows immutable pixels from this lease; it does not retain ownership.
    pub fn view(self: *const Image) Error!View {
        return (self.storage orelse return error.Closed).view;
    }
    /// Idempotent on this handle. Other owning clones remain valid.
    pub fn deinit(self: *Image) void {
        const storage = self.storage orelse return;
        self.storage = null;
        if (storage.references.fetchSub(1, .acq_rel) == 1) {
            const allocator = storage.allocator;
            allocator.free(storage.view.rgba);
            allocator.destroy(storage);
        }
    }
};
