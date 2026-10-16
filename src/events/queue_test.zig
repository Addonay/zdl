//! Queue contract tests against an independent ordered-array model.
const std = @import("std");
const event = @import("event.zig");
const queue_module = @import("queue.zig");
const Event = event.Event;
const all = std.math.maxInt(u32);

fn sample(serial: u32) Event {
    return if (serial % 5 == 0)
        .{ .window = .{ .kind = .resized, .window_id = @fromBackingInt(@as(u32, serial % 3 + 1)), .timestamp = serial, .data1 = @intCast(serial) } }
    else
        .{ .user = .{ .code = event.user_code_first + serial % 4, .timestamp = serial, .value = @intCast(serial) } };
}
fn equal_events(expected: []const Event, actual: []const Event) !void {
    try std.testing.expectEqual(expected.len, actual.len);
    for (expected, actual) |a, b| {
        try std.testing.expectEqual(std.meta.activeTag(a), std.meta.activeTag(b));
        switch (a) {
            .window => try std.testing.expectEqualDeep(a.window, b.window),
            .user => try std.testing.expectEqualDeep(a.user, b.user),
            else => unreachable,
        }
    }
}
fn matches(value: Event, min: u32, max: u32) bool {
    return value.code() >= min and value.code() <= max;
}
const FilterState = struct {
    modulus: u64 = 0,
    fn accept(self: *FilterState, value: *const Event) bool {
        return self.modulus == 0 or value.timestamp() % self.modulus != 0;
    }
};
const Model = struct {
    items: std.ArrayList(Event) = .empty,
    disabled: [4]bool = @splat(false),
    filter: *FilterState,
    fn enabled(self: *const Model, value: Event) bool {
        const code = value.code();
        return !(code >= event.user_code_first and code < event.user_code_first + 4 and self.disabled[code - event.user_code_first]);
    }
    fn take(self: *Model, out: []Event, min: u32, max: u32, remove: bool) usize {
        var count: usize = 0;
        var index: usize = 0;
        while (index < self.items.items.len and count < out.len) {
            const value = self.items.items[index];
            if (matches(value, min, max)) {
                out[count] = value;
                count += 1;
                if (remove) {
                    _ = self.items.orderedRemove(index);
                    continue;
                }
            }
            index += 1;
        }
        return count;
    }
    fn flush(self: *Model, min: u32, max: u32) void {
        var index: usize = 0;
        while (index < self.items.items.len) {
            if (matches(self.items.items[index], min, max)) _ = self.items.orderedRemove(index) else index += 1;
        }
    }
    fn cut(self: *Model) void {
        var index: usize = 0;
        while (index < self.items.items.len) {
            if (!self.filter.accept(&self.items.items[index])) _ = self.items.orderedRemove(index) else index += 1;
        }
    }
};

test "queue randomized range, filter, enablement and supersession match ordered model" {
    const a = std.testing.allocator;
    var filter: FilterState = .{};
    var q = queue_module.Queue(*FilterState).init(a, .{ .max_events = 97 });
    defer q.deinit();
    var model: Model = .{ .filter = &filter };
    defer model.items.deinit(a);
    var rng = std.Random.DefaultPrng.init(0xf1f04a71);
    const random = rng.random();
    for (1..20001) |serial| {
        const operation = random.uintLessThan(u8, 10);
        switch (operation) {
            0, 1, 2, 8 => {
                const value = if (operation == 8) Event{ .window = .{ .kind = .resized, .timestamp = serial, .window_id = @fromBackingInt(@as(u32, @intCast(serial % 3 + 1))), .data1 = @intCast(serial) } } else sample(@intCast(serial));
                if (operation == 8) {
                    var index: usize = 0;
                    while (index < model.items.items.len) {
                        const other = model.items.items[index];
                        if (other == .window and other.code() == value.code() and other.window.window_id == value.window.window_id)
                            _ = model.items.orderedRemove(index)
                        else
                            index += 1;
                    }
                }
                const outcome = if (operation == 8) q.push_superseding_window(value) else q.push(value);
                if (!model.enabled(value) or !filter.accept(&value)) {
                    try std.testing.expect(!try outcome);
                } else if (model.items.items.len == 97) {
                    try std.testing.expectError(error.QueueFull, outcome);
                } else {
                    try std.testing.expect(try outcome);
                    try model.items.append(a, value);
                }
            },
            3, 4 => {
                const min: u32 = if (random.boolean()) 0 else event.user_code_first + random.uintLessThan(u32, 4);
                const max: u32 = if (min == 0) all else min + random.uintLessThan(u32, 4);
                const size = random.uintLessThan(usize, 8);
                var expected: [8]Event = undefined;
                var actual: [8]Event = undefined;
                const n = model.take(expected[0..size], min, max, operation == 3);
                const m = if (operation == 3) q.get(actual[0..size], min, max) else q.peek(actual[0..size], min, max);
                try std.testing.expectEqual(n, m);
                try equal_events(expected[0..n], actual[0..m]);
            },
            5 => {
                const min = event.user_code_first + random.uintLessThan(u32, 4);
                const max = min + random.uintLessThan(u32, 4);
                model.flush(min, max);
                q.flush(min, max);
            },
            6 => {
                const index = random.uintLessThan(usize, 4);
                const enabled = random.boolean();
                model.disabled[index] = !enabled;
                try q.set_enabled(event.user_code_first + @as(u32, @intCast(index)), enabled);
                if (!enabled) model.flush(event.user_code_first + @as(u32, @intCast(index)), event.user_code_first + @as(u32, @intCast(index)));
            },
            7 => {
                filter.modulus = if (random.boolean()) 0 else random.uintLessThan(u64, 3) + 2;
                q.set_filter(if (filter.modulus == 0) null else .{ .context = &filter, .accept = FilterState.accept });
                model.cut();
            },
            9 => {
                q.clear();
                model.items.clearRetainingCapacity();
            },
            else => unreachable,
        }
        try std.testing.expectEqual(model.items.items.len, q.len());
        var actual: [128]Event = undefined;
        const n = q.peek(&actual, 0, all);
        try equal_events(model.items.items, actual[0..n]);
        const code = event.user_code_first + random.uintLessThan(u32, 4);
        var expected: [128]Event = undefined;
        const count = model.take(&expected, code, code, false);
        try std.testing.expectEqual(count, q.count_in_range(code, code));
        try std.testing.expectEqual(count != 0, q.has(code, code));
    }
}

test "queue steady FIFO pressure reuses capacity without changing live cap" {
    var q = queue_module.Queue(void).init(std.testing.allocator, .{ .max_events = 97 });
    defer q.deinit();
    for (0..97) |i| try std.testing.expect(try q.push(sample(@intCast(i))));
    for (0..20000) |i| {
        var out: [1]Event = undefined;
        try std.testing.expectEqual(@as(usize, 1), q.get(&out, 0, all));
        try equal_events(&.{sample(@intCast(i))}, &out);
        try std.testing.expect(try q.push(sample(@intCast(i + 97))));
        try std.testing.expectEqual(@as(usize, 97), q.len());
    }
    try std.testing.expectError(error.QueueFull, q.push(sample(99999)));
    q.flush(0, all);
    try std.testing.expectEqual(@as(usize, 0), q.len());
    try std.testing.expect(try q.push(sample(7)));
    var out: [1]Event = undefined;
    try std.testing.expectEqual(@as(usize, 0), q.get(&out, 9, 8));
    try std.testing.expectEqual(@as(usize, 1), q.get(&out, 0, all));
    try equal_events(&.{sample(7)}, &out);
}

test "queue cutting preserves callback-visible sequential lengths after FIFO consumption" {
    const Context = struct {
        queue: *queue_module.Queue(*@This()),
        lengths: [4]usize = undefined,
        calls: usize = 0,
        fn accept(self: *@This(), value: *const Event) bool {
            self.lengths[self.calls] = self.queue.len();
            self.calls += 1;
            return @mod(value.user.value, 2) != 0;
        }
    };
    var q = queue_module.Queue(*Context).init(std.testing.allocator, .{});
    defer q.deinit();
    for (0..6) |i| try std.testing.expect(try q.push(.{ .user = .{ .code = event.user_code_first, .value = @as(i32, @intCast(i)) - 2 } }));
    var out: [2]Event = undefined;
    _ = q.get(&out, 0, all);
    var context: Context = .{ .queue = &q };
    q.cut_pending(.{ .context = &context, .accept = Context.accept });
    try std.testing.expectEqualSlices(usize, &.{ 4, 3, 3, 2 }, &context.lengths);
    try std.testing.expectEqual(@as(usize, 2), q.get(&out, 0, all));
    try std.testing.expectEqual(@as(i32, 1), out[0].user.value);
    try std.testing.expectEqual(@as(i32, 3), out[1].user.value);
}

fn allocation_scenario(allocator: std.mem.Allocator) !void {
    var q = queue_module.Queue(void).init(allocator, .{ .max_events = 128 });
    defer q.deinit();
    var consumed: usize = 0;
    for (0..96) |i| {
        const value: Event = .{ .user = .{ .code = event.user_code_first, .value = @intCast(i) } };
        _ = q.push(value) catch |err| {
            try std.testing.expectEqual(i - consumed, q.len());
            var snapshot: [128]Event = undefined;
            const count = q.peek(&snapshot, 0, all);
            for (snapshot[0..count], consumed..) |item, expected| try std.testing.expectEqual(@as(i32, @intCast(expected)), item.user.value);
            return err;
        };
        if (i % 3 == 0) {
            var out: [1]Event = undefined;
            _ = q.get(&out, 0, all);
            try std.testing.expectEqual(@as(i32, @intCast(consumed)), out[0].user.value);
            consumed += 1;
        }
    }
    var out: [128]Event = undefined;
    const count = q.get(&out, 0, all);
    for (out[0..count], consumed..) |value, expected| try std.testing.expectEqual(@as(i32, @intCast(expected)), value.user.value);
}

test "queue allocation failures retain live event order and release storage" {
    try std.testing.checkAllAllocationFailures(std.testing.allocator, allocation_scenario, .{});
}

const WatchContext = struct {
    queue: *queue_module.Queue(*@This()),
    later: ?queue_module.Queue(*@This()).WatchId = null,
    changed: bool = false,
    failed: bool = false,
    trace: [16]u8 = undefined,
    count: usize = 0,
    fn record(self: *@This(), value: u8) void {
        self.trace[self.count] = value;
        self.count += 1;
    }
    fn filter(self: *@This(), _: *const Event) bool {
        self.record(0);
        return true;
    }
    fn first(self: *@This(), _: *const Event) void {
        self.record(1);
        if (!self.changed) {
            self.changed = true;
            self.queue.remove_watcher(self.later.?);
            _ = self.queue.add_watcher(.{ .context = self, .observe = third }) catch {
                self.failed = true;
                return;
            };
        }
    }
    fn second(self: *@This(), _: *const Event) void {
        self.record(2);
    }
    fn third(self: *@This(), _: *const Event) void {
        self.record(3);
    }
};
test "queue watcher mutation, disabled events and full dispatch preserve ordering" {
    var q = queue_module.Queue(*WatchContext).init(std.testing.allocator, .{ .max_events = 1 });
    defer q.deinit();
    var context: WatchContext = .{ .queue = &q };
    q.set_filter(.{ .context = &context, .accept = WatchContext.filter });
    _ = try q.add_watcher(.{ .context = &context, .observe = WatchContext.first });
    context.later = try q.add_watcher(.{ .context = &context, .observe = WatchContext.second });
    try std.testing.expect(try q.push(sample(1)));
    try std.testing.expectError(error.QueueFull, q.push(sample(2)));
    try std.testing.expectEqualSlices(u8, &.{ 0, 1, 0, 1, 3 }, context.trace[0..context.count]);
    try std.testing.expect(!context.failed);
    try q.set_enabled(sample(1).code(), false);
    try std.testing.expect(!try q.push(sample(1)));
    try std.testing.expectEqual(@as(usize, 5), context.count);
    try std.testing.expectEqual(@as(usize, 0), q.len());
}

test "queue nested watcher push delivers nested event before outer enqueue" {
    const Context = struct {
        queue: *queue_module.Queue(*@This()),
        nested: bool = false,
        failed: bool = false,
        fn watch(self: *@This(), _: *const Event) void {
            if (self.nested) return;
            self.nested = true;
            _ = self.queue.push(sample(2)) catch {
                self.failed = true;
                return;
            };
        }
    };
    var q = queue_module.Queue(*Context).init(std.testing.allocator, .{});
    defer q.deinit();
    var context: Context = .{ .queue = &q };
    _ = try q.add_watcher(.{ .context = &context, .observe = Context.watch });
    try std.testing.expect(try q.push(sample(1)));
    try std.testing.expect(!context.failed);
    var out: [2]Event = undefined;
    try std.testing.expectEqual(@as(usize, 2), q.get(&out, 0, all));
    try equal_events(&.{ sample(2), sample(1) }, &out);
}
