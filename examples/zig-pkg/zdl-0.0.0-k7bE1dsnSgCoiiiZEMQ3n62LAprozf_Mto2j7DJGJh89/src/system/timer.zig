//! Explicitly driven timer scheduler and precise delays, as SDL_timer.c.
//! Altered native port: SDL runs one hidden thread per process that dispatches
//! timers and keeps global ID tables. Here the caller owns a `Scheduler`, supplies
//! the current time, and drives it with `run_due`. Nothing sleeps or spawns
//! threads behind the caller's back.
//!
//! Model:
//! - Times are monotonic nanoseconds chosen by the caller. A typical source is
//!   `monotonic_now_ns(io)`, which reads `std.Io.Clock.awake`.
//! - Each timer has an interval and a callback. The callback receives its
//!   interval and returns the next interval in nanoseconds; zero removes the timer,
//!   exactly as SDL's callbacks do. A nonzero return reschedules the timer at
//!   `now + next` (where `now` is the time passed to `run_due`), so each timer
//!   fires at most once per `run_due` call.
//! - Timers with equal deadlines fire in the order they were added or rescheduled.
//! - Callbacks cannot touch the scheduler, which avoids re-entrancy and keeps the
//!   object free of internal locking. Callers that share one scheduler between
//!   threads must synchronize access; the scheduler itself is not thread-safe.
//! - Handles carry a generation, so a stale `TimerId` after its timer finished or
//!   was removed is rejected instead of naming a reused slot.
//!
//! Delay helpers are provided over `std.Io` and `std.Io.Clock.awake`.
const std = @import("std");
const timestamp = @import("../events/timestamp.zig");

/// Nanoseconds in the host monotonic clock domain.
pub const Timestamp = timestamp.Timestamp;

/// Typed handle to a timer. Valid until the timer is removed or completes.
pub const TimerId = struct {
    /// Index into the scheduler's slot table.
    index: u32,
    /// Generation of the slot when this timer was created.
    generation: u32,
};

/// Errors from scheduling operations.
pub const Error = std.mem.Allocator.Error || error{TimerNotFound};

/// Timer scheduler over a caller-chosen context value. `Context` is passed to every
/// callback and may be any type, including `void` when no state is needed. Use a
/// pointer context to reach caller state from callbacks.
pub fn Scheduler(comptime Context: type) type {
    return struct {
        const Self = @This();

        /// Timer callback: receives the context, the timer's handle and its interval
        /// in nanoseconds. Returns the next interval in nanoseconds, or 0 to finish.
        pub const Callback = *const fn (context: Context, id: TimerId, interval_ns: u64) u64;

        const Slot = struct {
            generation: u32 = 0,
            /// True while the timer is scheduled.
            live: bool = false,
            callback: Callback = undefined,
            context: Context = undefined,
            interval_ns: u64 = 0,
            deadline_ns: Timestamp = 0,
            /// Monotonic tie-breaker: lower sequence fires first at equal deadlines.
            sequence: u64 = 0,
        };

        allocator: std.mem.Allocator,
        /// Slot table. Free slots are found by scanning, so releasing a timer never
        /// allocates; the table stays small because it only grows to the peak count.
        slots: std.ArrayList(Slot) = .empty,
        /// Live slot indices ordered by descending (deadline, sequence), so the next
        /// timer to fire is the last element and is removed in O(1).
        queue: std.ArrayList(u32) = .empty,
        next_sequence: u64 = 0,

        /// Creates an empty scheduler. It allocates only as timers are added.
        pub fn init(allocator: std.mem.Allocator) Self {
            return .{ .allocator = allocator };
        }

        /// Releases all storage. Pending timers are discarded without callbacks.
        pub fn deinit(self: *Self) void {
            self.slots.deinit(self.allocator);
            self.queue.deinit(self.allocator);
            self.* = undefined;
        }

        /// Number of timers currently scheduled.
        pub fn count(self: *const Self) usize {
            return self.queue.items.len;
        }

        /// Schedules a timer that first fires at `now_ns + interval_ns`. An interval of
        /// zero makes it due at the next `run_due` call, as SDL allows.
        pub fn add(self: *Self, now_ns: Timestamp, interval_ns: u64, callback: Callback, context: Context) Error!TimerId {
            // Reserve everything that can fail before mutating state.
            try self.queue.ensureUnusedCapacity(self.allocator, 1);
            const index = self.find_free_slot() orelse blk: {
                try self.slots.append(self.allocator, .{});
                break :blk @as(u32, @intCast(self.slots.items.len - 1));
            };
            const slot = &self.slots.items[index];
            slot.live = true;
            slot.callback = callback;
            slot.context = context;
            slot.interval_ns = interval_ns;
            slot.deadline_ns = now_ns +| interval_ns;
            slot.sequence = self.take_sequence();
            self.insert(index);
            return .{ .index = index, .generation = slot.generation };
        }

        /// Cancels a scheduled timer. Its callback will not run again. Fails with
        /// `error.TimerNotFound` for stale or unknown handles.
        pub fn remove(self: *Self, id: TimerId) error{TimerNotFound}!void {
            if (!self.is_live(id)) return error.TimerNotFound;
            for (self.queue.items, 0..) |queued, position| {
                if (queued == id.index) {
                    _ = self.queue.orderedRemove(position);
                    break;
                }
            }
            self.release(id.index);
        }

        /// Whether the handle still names a scheduled timer.
        pub fn contains(self: *const Self, id: TimerId) bool {
            return self.is_live(id);
        }

        /// Deadline of the timer that fires next, or null when nothing is scheduled.
        /// Use it to decide how long the caller may block before calling `run_due`.
        pub fn next_deadline(self: *const Self) ?Timestamp {
            const last = self.last_queued() orelse return null;
            return self.slots.items[last].deadline_ns;
        }

        /// Runs every timer whose deadline is at or before `now_ns`, in deadline order,
        /// and returns how many callbacks ran. Each callback's return value decides
        /// whether the timer is rescheduled or removed. Rescheduling reuses the queue
        /// entry just popped, so this never allocates and cannot fail.
        pub fn run_due(self: *Self, now_ns: Timestamp) usize {
            var fired: usize = 0;
            while (self.last_queued()) |index| {
                const slot = &self.slots.items[index];
                if (slot.deadline_ns > now_ns) break;

                _ = self.queue.pop();
                const id: TimerId = .{ .index = index, .generation = slot.generation };
                const callback = slot.callback;
                const context = slot.context;
                const interval = slot.interval_ns;
                fired += 1;

                const next = callback(context, id, interval);
                if (next > 0) {
                    // Reschedule relative to the caller's time, as SDL does with its tick.
                    const slot_again = &self.slots.items[index];
                    slot_again.interval_ns = next;
                    slot_again.deadline_ns = now_ns +| next;
                    slot_again.sequence = self.take_sequence();
                    self.insert(index); // the entry popped above keeps capacity available
                } else {
                    self.release(index);
                }
            }
            return fired;
        }

        fn last_queued(self: *const Self) ?u32 {
            const length = self.queue.items.len;
            if (length == 0) return null;
            return self.queue.items[length - 1];
        }

        fn find_free_slot(self: *const Self) ?u32 {
            for (self.slots.items, 0..) |slot, index| {
                if (!slot.live) return @intCast(index);
            }
            return null;
        }

        fn take_sequence(self: *Self) u64 {
            const sequence = self.next_sequence;
            self.next_sequence +%= 1;
            return sequence;
        }

        fn is_live(self: *const Self, id: TimerId) bool {
            if (id.index >= self.slots.items.len) return false;
            const slot = self.slots.items[id.index];
            return slot.live and slot.generation == id.generation;
        }

        /// Marks a slot free, bumping its generation so old handles stop matching.
        fn release(self: *Self, index: u32) void {
            const slot = &self.slots.items[index];
            slot.live = false;
            slot.generation +%= 1;
            slot.callback = undefined;
            slot.context = undefined;
        }

        /// Inserts a slot index at its ordered position. Requires queue capacity.
        fn insert(self: *Self, index: u32) void {
            const key = self.slots.items[index];
            var low: usize = 0;
            var high: usize = self.queue.items.len;
            while (low < high) {
                const middle = low + (high - low) / 2;
                const other = self.slots.items[self.queue.items[middle]];
                // Descending order: entries with a larger key stay in front of the new one.
                if (is_later(other, key)) {
                    low = middle + 1;
                } else {
                    high = middle;
                }
            }
            self.queue.insertAssumeCapacity(low, index);
        }

        fn is_later(a: Slot, b: Slot) bool {
            if (a.deadline_ns != b.deadline_ns) return a.deadline_ns > b.deadline_ns;
            return a.sequence > b.sequence;
        }
    };
}

/// Monotonic time in nanoseconds from `std.Io.Clock.awake`, which excludes suspend.
pub fn monotonic_now_ns(io: std.Io) Timestamp {
    return timestamp.now_ns(io);
}

/// Sleeps at least `duration_ns`. Uses the OS sleep primitive through `std.Io`, so
/// precision follows the kernel timer slack (typically about 50 microseconds on Linux).
pub fn delay_ns(io: std.Io, duration_ns: u64) std.Io.Cancelable!void {
    try std.Io.sleep(io, .fromNanoseconds(@intCast(duration_ns)), .awake);
}

/// Sleeps close to `duration_ns` with less overshoot than `delay_ns`. This follows
/// SDL_DelayPrecise: sleep in 1 ms steps while tracking the largest overshoot seen,
/// sleep the remainder minus that overshoot, then finish with short sleeps and a spin
/// on `spinLoopHint`. The spin never exceeds 1 ms. Use only for short waits, since it
/// burns CPU for the final stretch.
pub fn delay_precise_ns(io: std.Io, duration_ns: u64) std.Io.Cancelable!void {
    const short_sleep: u64 = std.time.ns_per_ms;
    const target = monotonic_now_ns(io) +| duration_ns;
    var current = monotonic_now_ns(io);
    var max_sleep: u64 = short_sleep;

    while (current + max_sleep < target) {
        try delay_ns(io, short_sleep);
        const after = monotonic_now_ns(io);
        const overshoot = after -| current;
        if (overshoot > max_sleep) max_sleep = overshoot;
        current = after;
    }

    if (current < target and target - current > max_sleep - short_sleep) {
        try delay_ns(io, (target - current) - (max_sleep - short_sleep));
        current = monotonic_now_ns(io);
    }

    while (current + short_sleep < target) {
        try delay_ns(io, short_sleep);
        current = monotonic_now_ns(io);
    }

    while (current < target) {
        std.atomic.spinLoopHint();
        current = monotonic_now_ns(io);
    }
}
