//! Owned backing storage for event payload slices.
//!
//! Events are plain values. `Queue` shallow-copies them and never extends the
//! lifetime of borrowed slices. A producer uses `Store.copy_event` before
//! queuing any event with text or MIME payloads, then keeps the store alive
//! until the next pump/poll boundary.
const std = @import("std");
const event = @import("event.zig");

/// Owns copied strings and nested string lists referenced by queued events.
pub const Store = struct {
    allocator: std.mem.Allocator,
    strings: std.ArrayList([]u8) = .empty,
    lists: std.ArrayList([][]const u8) = .empty,

    /// Creates empty payload storage.
    pub fn init(allocator: std.mem.Allocator) Store {
        return .{ .allocator = allocator };
    }

    /// Invalidates copied payloads and releases all backing storage.
    pub fn deinit(self: *Store) void {
        self.clear();
        self.strings.deinit(self.allocator);
        self.lists.deinit(self.allocator);
        self.* = undefined;
    }

    /// Invalidates every event payload copied since the previous clear.
    pub fn clear(self: *Store) void {
        for (self.lists.items) |list| self.allocator.free(list);
        self.lists.clearRetainingCapacity();
        for (self.strings.items) |text| self.allocator.free(text);
        self.strings.clearRetainingCapacity();
    }

    /// Copies bytes into this producer's storage.
    pub fn copy_text(self: *Store, text: []const u8) std.mem.Allocator.Error![]const u8 {
        const copy = try self.allocator.dupe(u8, text);
        errdefer self.allocator.free(copy);
        try self.strings.append(self.allocator, copy);
        return copy;
    }

    /// Copies each string and the containing slice into this producer's storage.
    pub fn copy_list(self: *Store, values: []const []const u8) std.mem.Allocator.Error![]const []const u8 {
        if (values.len == 0) return &.{};
        const copy = try self.allocator.alloc([]const u8, values.len);
        errdefer self.allocator.free(copy);
        for (values, 0..) |value, index| copy[index] = try self.copy_text(value);
        try self.lists.append(self.allocator, copy);
        return copy;
    }

    /// Returns an event whose borrowed slices all point into this store.
    pub fn copy_event(self: *Store, source: event.Event) std.mem.Allocator.Error!event.Event {
        var copied = source;
        switch (copied) {
            .text_editing => |*payload| payload.text = try self.copy_text(payload.text),
            .text_editing_candidates => |*payload| payload.candidates = try self.copy_list(payload.candidates),
            .text_input => |*payload| payload.text = try self.copy_text(payload.text),
            .clipboard => |*payload| payload.mime_types = try self.copy_list(payload.mime_types),
            .drop => |*payload| {
                if (payload.source) |text| payload.source = try self.copy_text(text);
                if (payload.data) |text| payload.data = try self.copy_text(text);
            },
            else => {},
        }
        return copied;
    }
};

test "event payload storage copies text and nested MIME lists" {
    var store = Store.init(std.testing.allocator);
    defer store.deinit();

    var text = [_]u8{ 'o', 'k' };
    const input = event.Event{ .text_input = .{ .text = &text } };
    const copied_input = try store.copy_event(input);
    text[0] = 'n';
    try std.testing.expect(copied_input.text_input.text.ptr != &text);
    try std.testing.expectEqualStrings("ok", copied_input.text_input.text);

    var first_mime = [_]u8{ 't', 'e', 'x', 't' };
    const mimes = [_][]const u8{ &first_mime, "image/png" };
    const copied_clipboard = try store.copy_event(.{ .clipboard = .{ .mime_types = &mimes } });
    first_mime[0] = 'x';
    try std.testing.expectEqualStrings("text", copied_clipboard.clipboard.mime_types[0]);
    try std.testing.expectEqualStrings("image/png", copied_clipboard.clipboard.mime_types[1]);

    var path = [_]u8{ '/', 't', 'm', 'p', '/', 'a' };
    const copied_drop = try store.copy_event(.{ .drop = .{ .kind = .file, .source = "local", .data = &path } });
    path[5] = 'b';
    try std.testing.expectEqualStrings("local", copied_drop.drop.source.?);
    try std.testing.expectEqualStrings("/tmp/a", copied_drop.drop.data.?);

    const candidate = [_][]const u8{"one"};
    const copied_candidates = try store.copy_event(.{ .text_editing_candidates = .{ .candidates = &candidate } });
    try std.testing.expectEqualStrings("one", copied_candidates.text_editing_candidates.candidates[0]);

    store.clear();
    try std.testing.expectEqual(@as(usize, 0), store.strings.items.len);
    try std.testing.expectEqual(@as(usize, 0), store.lists.items.len);
}
