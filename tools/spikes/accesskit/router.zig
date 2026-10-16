//! Private immutable native-ID metadata handoff. Not a native tree publisher.
const std = @import("std");
const zdl = @import("zdl");
pub const Kind = enum { activate, focus, replace_value };
pub const Document = struct { revision: zdl.text.document.Revision, byte_len: usize };
pub const Entry = struct {
    native_id: u64,
    target: zdl.ui.semantics.Id,
    revision: u64,
    actions: zdl.ui.semantics.Actions,
    document: ?Document = null,
};
/// Inbox and std.Io must outlive this router and every provider callback. Owner
/// publishes copied metadata; foreign threads never access scenes/documents.
pub fn Router(comptime Inbox: type, comptime capacity: usize) type {
    return struct {
        const Self = @This();
        pub const Error = Inbox.Error || error{ MappingLimit, InvalidMapping, NativeIdReuse, UnknownNativeId, UnsupportedAction };
        io: std.Io,
        inbox: *Inbox,
        mutex: std.Io.Mutex = .init,
        entries: [capacity]Entry = undefined,
        count: usize = 0,
        high_water: u64 = 0,
        closed: bool = false,
        pub fn init(io: std.Io, inbox: *Inbox) Self {
            return .{ .io = io, .inbox = inbox };
        }
        fn find(self: *const Self, id: u64) ?Entry {
            var low: usize = 0;
            var high = self.count;
            while (low < high) {
                const mid = low + (high - low) / 2;
                const entry = self.entries[mid];
                if (entry.native_id == id) return entry;
                if (entry.native_id < id) low = mid + 1 else high = mid;
            }
            return null;
        }
        /// Sorted IDs, all-or-nothing replacement. An existing ID may survive
        /// for the same semantic identity with a nondecreasing revision; equal
        /// revisions require identical metadata. Retired IDs cannot return or
        /// bind a different control. Callback arrival captures the published
        /// revision; requests staged before a later publication keep that old
        /// revision. The native protocol carries no client-observed revision.
        pub fn publish(self: *Self, entries: []const Entry) Error!void {
            self.mutex.lockUncancelable(self.io);
            defer self.mutex.unlock(self.io);
            if (self.closed) return error.Closed;
            if (entries.len > capacity) return error.MappingLimit;
            var previous: u64 = 0;
            var next_high = self.high_water;
            for (entries) |entry| {
                if (entry.native_id <= previous or entry.target.serial == 0 or entry.revision == 0) return error.InvalidMapping;
                previous = entry.native_id;
                if (self.find(entry.native_id)) |old| {
                    if (!std.meta.eql(old.target, entry.target) or entry.revision < old.revision) return error.NativeIdReuse;
                    if (entry.revision == old.revision and !std.meta.eql(old, entry)) return error.InvalidMapping;
                    if (old.document) |document| {
                        const next = entry.document orelse return error.NativeIdReuse;
                        if (next.revision.document != document.revision.document or next.revision.value < document.revision.value) return error.NativeIdReuse;
                    }
                } else if (entry.native_id <= self.high_water) return error.NativeIdReuse;
                next_high = @max(next_high, entry.native_id);
            }
            @memcpy(self.entries[0..entries.len], entries);
            self.count = entries.len;
            self.high_water = next_high;
        }
        /// Called while native text is borrowed. Inbox copies it before return.
        /// Text SetValue is explicitly whole-document replacement; native text
        /// selection/cluster mapping and numeric/checkbox actions are not guessed.
        pub fn route(self: *Self, id: u64, kind: Kind, text: []const u8) Error!u64 {
            self.mutex.lockUncancelable(self.io);
            defer self.mutex.unlock(self.io);
            if (self.closed) return error.Closed;
            const entry = self.find(id) orelse return error.UnknownNativeId;
            const payload: zdl.ui.semantics.Payload = switch (kind) {
                .activate => if (entry.actions.activate) .activate else return error.UnsupportedAction,
                .focus => if (entry.actions.focus) .focus else return error.UnsupportedAction,
                .replace_value => value: {
                    if (!entry.actions.replace_text) return error.UnsupportedAction;
                    const document = entry.document orelse return error.UnsupportedAction;
                    break :value .{ .replace_text = .{ .revision = document.revision, .range = .{ .start_byte = 0, .end_byte = document.byte_len }, .text = text } };
                },
            };
            return self.inbox.submit(.{ .target = entry.target, .revision = entry.revision, .source = .assistive, .payload = payload });
        }
        /// Logical close only. Provider lease acknowledgement is still required
        /// before reclaiming this stable address or its inbox.
        pub fn close(self: *Self) void {
            self.mutex.lockUncancelable(self.io);
            defer self.mutex.unlock(self.io);
            self.closed = true;
            self.count = 0;
            self.inbox.close();
        }
    };
}
