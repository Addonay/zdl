//! Caller-owned event queue with range selection, filters, watchers, per-type
//! enablement and user event codes. Altered native port of SDL_events.c queue
//! semantics (SDL_PushEvent, SDL_PeepEvents, SDL_FlushEvents, SDL_SetEventFilter,
//! SDL_AddEventWatch, SDL_SetEventEnabled, SDL_RegisterEvents).
//!
//! Ownership and synchronization:
//! - A `Queue` is an ordinary value created with `init` and released with
//!   `deinit`. There is no global queue. Pending events are shallow-copied into
//!   the queue's own storage; payload slices still borrow from their producer
//!   and remain valid only through that producer's next pump/poll call.
//! - Not synchronized. The owner serializes all calls, for example with a
//!   `std.Io.Mutex` held around each call when producers and consumers run on
//!   different threads.
//! - Callbacks receive a caller-chosen `Context` value, typically a pointer to
//!   the application state. A watcher may add watchers (they run from the next
//!   dispatch on) and may remove watchers (the removal is deferred to the end of
//!   the outermost dispatch, as SDL_RemoveEventWatch does). Replacing the filter
//!   from inside a callback is not supported.
//!
//! Differences from SDL:
//! - Timestamps are not stamped on push. The caller supplies nanoseconds in the
//!   shared monotonic clock domain (see `event.Timestamp`). The queue never
//!   reads a clock and never pumps input.
//! - Producers in this library return events rather than pushing them, so the
//!   enablement check is applied by `push`. This drops a disabled type on the
//!   way in, which is the observable effect of SDL_SetEventEnabled.
//! - User event codes come from the queue's own counter, so they are unique
//!   within one queue only (`register_user_events`).
const std = @import("std");
const event = @import("event.zig");
const payload = @import("payload.zig");

/// Default cap on pending events, matching SDL_MAX_QUEUED_EVENTS.
pub const default_max_events = 65535;

/// Errors from `push`, beyond the filter and enablement drops reported by the
/// boolean result.
pub const PushError = error{ QueueFull, OutOfMemory };

/// Construction options for a queue.
pub const Options = struct {
    /// Maximum pending events. Pushes beyond this fail with `QueueFull`.
    max_events: usize = default_max_events,
};

/// Returns a queue type whose callbacks receive `Context`. Choose a context
/// that carries whatever the callbacks need, such as `*App`.
pub fn Queue(comptime Context: type) type {
    return struct {
        const Self = @This();

        /// A filter decides whether an event is accepted. Returning false drops it
        /// before watchers see it, as SDL's event filter does.
        pub const Filter = struct {
            context: Context,
            accept: *const fn (context: Context, ev: *const event.Event) bool,
        };

        /// A watcher observes every accepted event and cannot alter it.
        pub const Watcher = struct {
            context: Context,
            observe: *const fn (context: Context, ev: *const event.Event) void,
        };

        /// Handle returned by `add_watcher`, valid until `remove_watcher`.
        pub const WatchId = enum(u32) { _ };

        allocator: std.mem.Allocator,
        options: Options,
        /// Pending events in FIFO order: index 0 is the oldest.
        pending: std.ArrayList(event.Event) = .empty,
        filter: ?Filter = null,
        watchers: std.ArrayList(Registered) = .empty,
        disabled: std.AutoHashMapUnmanaged(u32, void) = .empty,
        next_watch: u32 = 1,
        next_user_code: u32 = event.user_code_first,
        /// Nesting depth of `dispatch`. Watcher removal is deferred while it is
        /// non-zero, and the list is compacted when the outermost dispatch returns.
        dispatch_depth: u32 = 0,
        /// Set when a watcher was marked removed during a dispatch.
        has_removed_watchers: bool = false,

        const Registered = struct {
            id: WatchId,
            watcher: Watcher,
            /// Marked by `remove_watcher` during a dispatch; skipped and compacted later.
            removed: bool = false,
        };

        /// Creates an empty queue. No memory is allocated until the first push.
        pub fn init(allocator: std.mem.Allocator, options: Options) Self {
            return .{ .allocator = allocator, .options = options };
        }

        /// Releases pending events, watchers and the disabled set.
        pub fn deinit(self: *Self) void {
            self.pending.deinit(self.allocator);
            self.watchers.deinit(self.allocator);
            self.disabled.deinit(self.allocator);
            self.* = undefined;
        }

        /// Number of pending events.
        pub fn len(self: *const Self) usize {
            return self.pending.items.len;
        }

        /// Discards every pending event (SDL_FlushEvents over the full range).
        pub fn clear(self: *Self) void {
            self.pending.clearRetainingCapacity();
        }

        /// Adds an event (SDL_PushEvent). Returns true when it was queued, and false
        /// when it was dropped by a disabled type or by the filter. The filter runs
        /// first; when it accepts, watchers observe the event, and it is then queued.
        /// A rejected event reaches no watcher, as in SDL.
        pub fn push(self: *Self, ev: event.Event) PushError!bool {
            if (self.is_disabled(ev.code())) return false;
            if (!self.dispatch(&ev)) return false;
            if (self.pending.items.len >= self.options.max_events) return error.QueueFull;
            try self.pending.append(self.allocator, ev);
            return true;
        }

        /// SDL_SendAppEvent. Lifecycle kinds (see `event.Event.is_app_lifecycle`) are
        /// never queued: the filter and watchers run inside this call, so a watcher can
        /// act on `terminating` or `low_memory` before the caller continues. Every other
        /// event is pushed as `push` does. Returns whether the event was accepted, which
        /// for lifecycle kinds means the filter accepted it and it was dispatched.
        /// Disabled types are dropped without dispatch.
        pub fn send_app_event(self: *Self, ev: event.Event) PushError!bool {
            if (ev.is_app_lifecycle()) return self.dispatch_app_event(ev);
            return self.push(ev);
        }

        /// The immediate half of `send_app_event`, with no queueing and no error path:
        /// enablement check, filter, then watchers. Returns false when the type is
        /// disabled or the filter rejected the event.
        pub fn dispatch_app_event(self: *Self, ev: event.Event) bool {
            if (self.is_disabled(ev.code())) return false;
            return self.dispatch(&ev);
        }

        /// Runs the filter and then the watchers, as SDL_DispatchEventWatchList does.
        /// Returns false, running no watcher, when the filter rejects the event. The
        /// watcher count is fixed when the dispatch starts: watchers added meanwhile
        /// run from the next dispatch on. A watcher removed meanwhile is skipped and
        /// dropped after the outermost dispatch returns.
        fn dispatch(self: *Self, ev: *const event.Event) bool {
            if (self.filter) |f| {
                if (!f.accept(f.context, ev)) return false;
            }
            const count = self.watchers.items.len;
            self.dispatch_depth += 1;
            var index: usize = 0;
            while (index < count) : (index += 1) {
                // Copy the entry: a watcher may add watchers, which can reallocate the list.
                const reg = self.watchers.items[index];
                if (!reg.removed) reg.watcher.observe(reg.watcher.context, ev);
            }
            self.dispatch_depth -= 1;
            if (self.dispatch_depth == 0 and self.has_removed_watchers) self.compact_watchers();
            return true;
        }

        fn compact_watchers(self: *Self) void {
            var kept: usize = 0;
            for (self.watchers.items) |reg| {
                if (reg.removed) continue;
                self.watchers.items[kept] = reg;
                kept += 1;
            }
            self.watchers.shrinkRetainingCapacity(kept);
            self.has_removed_watchers = false;
        }

        /// Like `push`, but first removes pending events of the same type for the
        /// same window. SDL does this for window move, resize, pixel-size, expose
        /// and occlusion events, so a backlog of them does not fill the queue.
        pub fn push_superseding_window(self: *Self, ev: event.Event) PushError!bool {
            const window = switch (ev) {
                .window => |w| w,
                else => return self.push(ev),
            };
            const code = ev.code();
            var index: usize = 0;
            while (index < self.pending.items.len) {
                const other = self.pending.items[index];
                const same = switch (other) {
                    .window => |w| other.code() == code and w.window_id == window.window_id,
                    else => false,
                };
                if (same) {
                    _ = self.pending.orderedRemove(index);
                } else {
                    index += 1;
                }
            }
            return self.push(ev);
        }

        /// Copies up to `out.len` pending events whose codes lie in `min_code`
        /// through `max_code` (inclusive), oldest first, without removing them.
        /// Returns the number copied.
        pub fn peek(self: *const Self, out: []event.Event, min_code: u32, max_code: u32) usize {
            var copied: usize = 0;
            for (self.pending.items) |ev| {
                if (copied == out.len) break;
                if (in_range(ev.code(), min_code, max_code)) {
                    out[copied] = ev;
                    copied += 1;
                }
            }
            return copied;
        }

        /// As `peek`, but removes the copied events from the queue.
        pub fn get(self: *Self, out: []event.Event, min_code: u32, max_code: u32) usize {
            var copied: usize = 0;
            var index: usize = 0;
            while (index < self.pending.items.len and copied < out.len) {
                const ev = self.pending.items[index];
                if (in_range(ev.code(), min_code, max_code)) {
                    out[copied] = ev;
                    copied += 1;
                    _ = self.pending.orderedRemove(index);
                } else {
                    index += 1;
                }
            }
            return copied;
        }

        /// Number of pending events in the range, without copying them.
        pub fn count_in_range(self: *const Self, min_code: u32, max_code: u32) usize {
            var total: usize = 0;
            for (self.pending.items) |ev| {
                if (in_range(ev.code(), min_code, max_code)) total += 1;
            }
            return total;
        }

        /// True when at least one pending event is in the range.
        pub fn has(self: *const Self, min_code: u32, max_code: u32) bool {
            return self.count_in_range(min_code, max_code) != 0;
        }

        /// Removes pending events in the range without returning them
        /// (SDL_FlushEvents).
        pub fn flush(self: *Self, min_code: u32, max_code: u32) void {
            var index: usize = 0;
            while (index < self.pending.items.len) {
                if (in_range(self.pending.items[index].code(), min_code, max_code)) {
                    _ = self.pending.orderedRemove(index);
                } else {
                    index += 1;
                }
            }
        }

        /// Installs a filter and removes pending events it rejects, as
        /// SDL_SetEventFilter does. Pass null to remove the filter.
        pub fn set_filter(self: *Self, filter: ?Filter) void {
            self.filter = filter;
            if (filter) |f| self.cut_pending(f);
        }

        /// Removes pending events the filter rejects, without installing it
        /// (SDL_FilterEvents).
        pub fn cut_pending(self: *Self, filter: Filter) void {
            var index: usize = 0;
            while (index < self.pending.items.len) {
                if (!filter.accept(filter.context, &self.pending.items[index])) {
                    _ = self.pending.orderedRemove(index);
                } else {
                    index += 1;
                }
            }
        }

        /// Adds a watcher. Watchers run in the order they were added.
        pub fn add_watcher(self: *Self, watcher: Watcher) error{OutOfMemory}!WatchId {
            const id: WatchId = @fromBackingInt(@intCast(self.next_watch));
            try self.watchers.append(self.allocator, .{ .id = id, .watcher = watcher });
            self.next_watch +%= 1;
            return id;
        }

        /// Removes a watcher (SDL_RemoveEventWatch). Unknown handles are ignored. Called
        /// from inside a watcher, the removal is deferred: the watcher is skipped for the
        /// rest of the current dispatch and dropped when it returns, as SDL does.
        pub fn remove_watcher(self: *Self, id: WatchId) void {
            for (self.watchers.items, 0..) |*reg, i| {
                if (reg.id != id) continue;
                if (self.dispatch_depth > 0) {
                    reg.removed = true;
                    self.has_removed_watchers = true;
                } else {
                    _ = self.watchers.orderedRemove(i);
                }
                return;
            }
        }

        /// Enables or disables an event type by its numeric code. Disabling also
        /// removes pending events of that type (SDL_SetEventEnabled).
        pub fn set_enabled(self: *Self, code: u32, enabled: bool) error{OutOfMemory}!void {
            if (enabled) {
                _ = self.disabled.remove(code);
                return;
            }
            try self.disabled.put(self.allocator, code, {});
            self.flush(code, code);
        }

        /// True unless the type was disabled with `set_enabled`.
        pub fn is_enabled(self: *const Self, code: u32) bool {
            return !self.is_disabled(code);
        }

        /// Reserves `count` consecutive user event codes and returns the first,
        /// or null when the range is exhausted or `count` is zero (SDL_RegisterEvents).
        /// Codes are local to this queue.
        pub fn register_user_events(self: *Self, count: u32) ?u32 {
            if (count == 0) return null;
            const first = self.next_user_code;
            const end = std.math.add(u32, first, count) catch return null;
            if (end - 1 > event.user_code_last) return null;
            self.next_user_code = end;
            return first;
        }

        fn is_disabled(self: *const Self, code: u32) bool {
            return self.disabled.contains(code);
        }
    };
}

fn in_range(code: u32, min_code: u32, max_code: u32) bool {
    return min_code <= code and code <= max_code;
}

test "queue shallow-copies payloads backed by producer storage" {
    var store = payload.Store.init(std.testing.allocator);
    defer store.deinit();
    var queue = Queue(void).init(std.testing.allocator, .{});
    defer queue.deinit();

    const source = event.Event{ .text_input = .{ .text = "queued" } };
    const stored = try store.copy_event(source);
    try std.testing.expect(try queue.push(stored));

    var out: [1]event.Event = undefined;
    try std.testing.expectEqual(@as(usize, 1), queue.get(&out, 0, std.math.maxInt(u32)));
    try std.testing.expect(out[0].text_input.text.ptr == stored.text_input.text.ptr);
    try std.testing.expectEqualStrings("queued", out[0].text_input.text);
    store.clear();
}
