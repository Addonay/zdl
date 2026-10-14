//! Configuration hints with priorities, environment overrides and change
//! observers, as SDL_hints.c. The hint table is an explicit owned `Hints` value:
//! there is no process-wide property set, no hidden locking and no lazy
//! creation. Hand a `*Hints` to the code that should honor it.
//!
//! Resolution order (SDL_GetHint): the environment variable named like the hint
//! wins over any stored value, unless the stored value was set with
//! `Priority.override`. Setting a hint whose environment variable exists is
//! ignored below `override` priority. SDL's two legacy environment names
//! `SDL_VIDEODRIVER` and `SDL_AUDIODRIVER` still stand in for `SDL_VIDEO_DRIVER`
//! and `SDL_AUDIO_DRIVER`.
//!
//! The environment is an explicit `std.process.Environ.Map` borrowed by `Hints`
//! (null means "no environment"). Callers that want the real process
//! environment build the map once from `std.process.Init.environ_map`.
//!
//! Observers replace SDL_AddHintCallback's function + `void *userdata` pair with
//! an intrusive `Observer` embedded in the caller's own struct (recover the
//! struct with `@fieldParentPtr`), so no type is erased and registration needs
//! no per-observer allocation beyond the table slot. Observers are called
//! newest-registration first, as SDL's prepended list does.
//!
//! Names are in `hint_names.zig` (generated). Thread safety: none. Share a
//! `Hints` between threads only behind the caller's own lock; slices returned by
//! `get` are borrowed and become invalid when that hint is next changed.
const std = @import("std");
const Allocator = std.mem.Allocator;
const Environ = std.process.Environ;

/// Names of every documented hint.
pub const names = @import("hint_names.zig");

/// Who may overwrite whom (SDL_HintPriority). A set succeeds when its priority is
/// at least that of the stored value.
pub const Priority = enum(u2) {
    /// Lowest. A reset hint returns to this priority.
    default,
    /// What `set` uses.
    normal,
    /// Beats lower priorities and the environment.
    override,
};

/// Receives hint changes. Embed one in a struct and recover that struct with
/// `@fieldParentPtr("observer", observer)`. An observer must stay at a stable
/// address while registered and must be removed before it is destroyed.
pub const Observer = struct {
    /// Called with the hint name, the value before and the value after the
    /// change. At registration both values are the current effective value
    /// (SDL calls a new callback once with `(value, value)`). On `reset`, `new` is
    /// the environment value (or null). All slices are valid only during the call.
    /// The callback may set hints and add or remove observers, including itself.
    on_change: *const fn (observer: *Observer, name: []const u8, old: ?[]const u8, new: ?[]const u8) void,
};

/// What a `set` call did.
pub const SetOutcome = enum {
    /// The value and priority were stored (observers ran if the text changed).
    applied,
    /// An environment variable for this hint exists and the priority is below
    /// `override`; nothing changed. (SDL: "An environment variable is taking priority".)
    environment_override,
    /// A value with a higher priority is stored; nothing changed.
    lower_priority,
};

pub const Error = Allocator.Error || error{InvalidName};

const Entry = struct {
    value: ?[]u8 = null,
    priority: Priority = .default,
};

const Registration = struct {
    name: []u8,
    /// Null marks a registration removed while observers were being called.
    observer: ?*Observer,
};

pub const Hints = struct {
    allocator: Allocator,
    /// Borrowed environment, consulted by `get`, `set_with_priority` and `reset`.
    environ: ?*const Environ.Map,
    /// Incremented whenever any stored value changes, so pollers (the main
    /// callback loop's pacing) can cheaply detect "something changed".
    revision: u64 = 0,

    entries: std.StringHashMapUnmanaged(Entry) = .empty,
    registrations: std.ArrayList(Registration) = .empty,
    dispatch_depth: u32 = 0,
    needs_compaction: bool = false,

    /// Creates an empty table. Nothing is allocated. `environ` is borrowed and must
    /// outlive the table (or be replaced through the field).
    pub fn init(allocator: Allocator, environ: ?*const Environ.Map) Hints {
        return .{ .allocator = allocator, .environ = environ };
    }

    /// Frees all names and values. Observers are dropped without being called.
    pub fn deinit(self: *Hints) void {
        var it = self.entries.iterator();
        while (it.next()) |entry| {
            self.allocator.free(entry.key_ptr.*);
            if (entry.value_ptr.value) |value| self.allocator.free(value);
        }
        self.entries.deinit(self.allocator);
        for (self.registrations.items) |registration| self.allocator.free(registration.name);
        self.registrations.deinit(self.allocator);
        self.* = undefined;
    }

    /// The environment string for a hint, including SDL's legacy aliases.
    pub fn environment_value(self: *const Hints, name: []const u8) ?[]const u8 {
        const map = self.environ orelse return null;
        if (map.get(name)) |value| return value;
        if (std.mem.eql(u8, name, names.video_driver)) return map.get("SDL_VIDEODRIVER");
        if (std.mem.eql(u8, name, names.audio_driver)) return map.get("SDL_AUDIODRIVER");
        return null;
    }

    /// Effective value of a hint, or null when unset (SDL_GetHint). The result
    /// is borrowed from the table or the environment map.
    pub fn get(self: *const Hints, name: []const u8) ?[]const u8 {
        var result = self.environment_value(name);
        if (self.entries.get(name)) |entry| {
            if (result == null or entry.priority == .override) result = entry.value;
        }
        return result;
    }

    /// SDL_GetHintBoolean: unset or empty gives `default`; "0" and "false" (any
    /// case) are false and everything else true.
    pub fn get_boolean(self: *const Hints, name: []const u8, default: bool) bool {
        return string_boolean(self.get(name), default);
    }

    /// Integer reading of a hint (SDL_GetStringInteger on the effective value).
    pub fn get_integer(self: *const Hints, name: []const u8, default: i32) i32 {
        return string_integer(self.get(name), default);
    }

    /// SDL_SetHint: `set_with_priority(name, value, .normal)`.
    pub fn set(self: *Hints, name: []const u8, value: ?[]const u8) Error!SetOutcome {
        return self.set_with_priority(name, value, .normal);
    }

    /// SDL_SetHintWithPriority. A null value stores "unset" at that priority.
    /// Observers run only when the text actually changes, before the old value is
    /// released, and see `value` as the new value (even when an environment
    /// variable would still hide it from `get`, as in SDL).
    pub fn set_with_priority(self: *Hints, name: []const u8, value: ?[]const u8, priority: Priority) Error!SetOutcome {
        if (name.len == 0) return error.InvalidName;
        if (self.environment_value(name) != null and @backingInt(priority) < @backingInt(Priority.override)) {
            return .environment_override;
        }
        const entry = try self.entry_for(name);
        if (@backingInt(priority) < @backingInt(entry.priority)) return .lower_priority;

        const changed = !optional_equal(entry.value, value);
        if (changed) {
            // Copy before touching state so allocation failure changes nothing.
            const owned: ?[]u8 = if (value) |text| try self.allocator.dupe(u8, text) else null;
            errdefer if (owned) |text| self.allocator.free(text);
            // `value` may borrow another hint an observer changes, and observers
            // may replace this hint again. Keep an independent dispatch snapshot.
            const notification: ?[]u8 = if (value) |text| try self.allocator.dupe(u8, text) else null;
            defer if (notification) |text| self.allocator.free(text);
            const stable_name = self.entries.getKey(name).?;
            const old = entry.value;
            entry.value = owned;
            entry.priority = priority;
            self.revision +%= 1;
            // `entry` may dangle if an observer inserts hints; do not touch it after.
            self.notify(stable_name, old, notification);
            if (old) |text| self.allocator.free(text);
        } else {
            entry.priority = priority;
        }
        return .applied;
    }

    /// SDL_ResetHint: forgets the stored value and priority. Observers run if the
    /// environment-derived value differs from the stored one. Returns false if
    /// the hint was never stored or observed.
    pub fn reset(self: *Hints, name: []const u8) Error!bool {
        if (name.len == 0) return error.InvalidName;
        if (!self.entries.contains(name)) return false;
        try self.reset_known(name);
        return true;
    }

    /// SDL_ResetHints: resets every stored hint. Needs a temporary list of names
    /// because observers may add hints while it runs.
    pub fn reset_all(self: *Hints) Allocator.Error!void {
        var keys: std.ArrayList([]const u8) = .empty;
        defer keys.deinit(self.allocator);
        try keys.ensureTotalCapacity(self.allocator, self.entries.count());
        var it = self.entries.keyIterator();
        while (it.next()) |key| keys.appendAssumeCapacity(key.*);
        // Key storage is owned individually and entries are never removed, so
        // these slices stay valid while observers insert more hints.
        for (keys.items) |key| try self.reset_known(key);
    }

    fn reset_known(self: *Hints, name: []const u8) Allocator.Error!void {
        const env = self.environment_value(name);
        const stable_name = self.entries.getKey(name).?;
        const entry = self.entries.getPtr(name).?;
        const old = entry.value;
        // Detach first so observers read a consistent table.
        entry.value = null;
        entry.priority = .default;
        if (!optional_equal(old, env)) {
            self.revision +%= 1;
            self.notify(stable_name, old, env);
        }
        if (old) |text| self.allocator.free(text);
    }

    /// SDL_AddHintCallback. Registers `observer` for `name`, replacing an earlier
    /// registration of the same pair, and calls it once with the current value.
    pub fn add_observer(self: *Hints, name: []const u8, observer: *Observer) Error!void {
        if (name.len == 0) return error.InvalidName;
        _ = try self.entry_for(name);
        const owned = try self.allocator.dupe(u8, name);
        errdefer self.allocator.free(owned);
        const current = if (self.get(name)) |value| try self.allocator.dupe(u8, value) else null;
        defer if (current) |value| self.allocator.free(value);
        // All fallible preparation precedes removal of an existing registration.
        try self.registrations.ensureUnusedCapacity(self.allocator, 1);
        self.remove_observer(owned, observer);
        self.registrations.appendAssumeCapacity(.{ .name = owned, .observer = observer });
        // Protect the registration name even if the initial callback removes
        // itself, and protect its current-value snapshot from recursive sets.
        self.dispatch_depth += 1;
        observer.on_change(observer, owned, current, current);
        self.finish_dispatch();
    }

    /// SDL_RemoveHintCallback. Safe to call from inside an observer.
    pub fn remove_observer(self: *Hints, name: []const u8, observer: *Observer) void {
        for (self.registrations.items, 0..) |*registration, index| {
            const registered = registration.observer orelse continue;
            if (registered != observer or !std.mem.eql(u8, registration.name, name)) continue;
            if (self.dispatch_depth > 0) {
                registration.observer = null;
                self.needs_compaction = true;
            } else {
                self.allocator.free(registration.name);
                _ = self.registrations.orderedRemove(index);
            }
            return;
        }
    }

    fn entry_for(self: *Hints, name: []const u8) Allocator.Error!*Entry {
        const slot = try self.entries.getOrPut(self.allocator, name);
        if (!slot.found_existing) {
            slot.value_ptr.* = .{};
            const owned = self.allocator.dupe(u8, name) catch |err| {
                _ = self.entries.remove(name);
                return err;
            };
            slot.key_ptr.* = owned;
        }
        return slot.value_ptr;
    }

    /// Calls observers of `name`, newest first. Registrations made during the
    /// walk are not visited (they get their own initial call); removals are
    /// honored immediately.
    fn notify(self: *Hints, name: []const u8, old: ?[]const u8, new: ?[]const u8) void {
        self.dispatch_depth += 1;
        var index = self.registrations.items.len;
        while (index > 0) {
            index -= 1;
            // Re-read each step: observers may append (reallocating) or tombstone.
            const registration = self.registrations.items[index];
            const observer = registration.observer orelse continue;
            if (!std.mem.eql(u8, registration.name, name)) continue;
            observer.on_change(observer, name, old, new);
        }
        self.finish_dispatch();
    }

    fn finish_dispatch(self: *Hints) void {
        self.dispatch_depth -= 1;
        if (self.dispatch_depth == 0 and self.needs_compaction) {
            self.needs_compaction = false;
            var kept: usize = 0;
            for (self.registrations.items) |registration| {
                if (registration.observer == null) {
                    self.allocator.free(registration.name);
                } else {
                    self.registrations.items[kept] = registration;
                    kept += 1;
                }
            }
            self.registrations.shrinkRetainingCapacity(kept);
        }
    }
};

fn optional_equal(a: ?[]const u8, b: ?[]const u8) bool {
    if (a == null or b == null) return a == null and b == null;
    return std.mem.eql(u8, a.?, b.?);
}

/// SDL_GetStringBoolean: null or empty gives `default`; a leading '0' or the
/// word "false" (ASCII case-insensitive) is false; anything else is true.
pub fn string_boolean(value: ?[]const u8, default: bool) bool {
    const text = value orelse return default;
    if (text.len == 0) return default;
    if (text[0] == '0' or std.ascii.eqlIgnoreCase(text, "false")) return false;
    return true;
}

/// SDL_GetStringInteger: null or empty gives `default`; "false" is 0 and "true" 1
/// (any case); a string starting with '-' or a digit yields its leading decimal
/// number (like atoi, saturating at the i32 range); other text gives `default`.
pub fn string_integer(value: ?[]const u8, default: i32) i32 {
    const text = value orelse return default;
    if (text.len == 0) return default;
    if (std.ascii.eqlIgnoreCase(text, "false")) return 0;
    if (std.ascii.eqlIgnoreCase(text, "true")) return 1;
    if (text[0] != '-' and !std.ascii.isDigit(text[0])) return default;
    var index: usize = 0;
    const negative = text[0] == '-';
    if (negative) index += 1;
    var magnitude: i64 = 0;
    while (index < text.len and std.ascii.isDigit(text[index])) : (index += 1) {
        magnitude = magnitude * 10 + (text[index] - '0');
        if (magnitude > std.math.maxInt(i32) + 1) break;
    }
    const signed: i64 = if (negative) -magnitude else magnitude;
    return @intCast(std.math.clamp(signed, std.math.minInt(i32), std.math.maxInt(i32)));
}

const testing = std.testing;

const Recorder = struct {
    observer: Observer = .{ .on_change = on_change },
    calls: u32 = 0,
    last_old: [32]u8 = undefined,
    last_old_len: ?usize = null,
    last_new: [32]u8 = undefined,
    last_new_len: ?usize = null,
    remove_self_from: ?*Hints = null,

    fn on_change(observer: *Observer, name: []const u8, old: ?[]const u8, new: ?[]const u8) void {
        const self: *Recorder = @fieldParentPtr("observer", observer);
        self.calls += 1;
        self.last_old_len = if (old) |text| copy(&self.last_old, text) else null;
        self.last_new_len = if (new) |text| copy(&self.last_new, text) else null;
        if (self.remove_self_from) |hints| hints.remove_observer(name, observer);
    }

    fn copy(dest: []u8, text: []const u8) usize {
        @memcpy(dest[0..text.len], text);
        return text.len;
    }
    fn seen_old(self: *const Recorder) ?[]const u8 {
        return if (self.last_old_len) |len| self.last_old[0..len] else null;
    }
    fn seen_new(self: *const Recorder) ?[]const u8 {
        return if (self.last_new_len) |len| self.last_new[0..len] else null;
    }
};

test "priorities decide who may overwrite" {
    var hints = Hints.init(testing.allocator, null);
    defer hints.deinit();
    try testing.expectEqual(@as(?[]const u8, null), hints.get("A"));
    try testing.expectEqual(SetOutcome.applied, try hints.set_with_priority("A", "one", .normal));
    try testing.expectEqual(SetOutcome.lower_priority, try hints.set_with_priority("A", "zero", .default));
    try testing.expectEqualStrings("one", hints.get("A").?);
    try testing.expectEqual(SetOutcome.applied, try hints.set_with_priority("A", "two", .normal));
    try testing.expectEqual(SetOutcome.applied, try hints.set_with_priority("A", "three", .override));
    try testing.expectEqual(SetOutcome.lower_priority, try hints.set("A", "four"));
    try testing.expectEqualStrings("three", hints.get("A").?);
    try testing.expect(try hints.reset("A"));
    try testing.expectEqual(@as(?[]const u8, null), hints.get("A"));
    try testing.expect(!try hints.reset("never-set"));
    try testing.expectError(error.InvalidName, hints.set("", "x"));
}

test "environment wins unless overridden" {
    var env = Environ.Map.init(testing.allocator);
    defer env.deinit();
    try env.put("SDL_FOO", "from-env");
    var hints = Hints.init(testing.allocator, &env);
    defer hints.deinit();
    try testing.expectEqualStrings("from-env", hints.get("SDL_FOO").?);
    try testing.expectEqual(SetOutcome.environment_override, try hints.set("SDL_FOO", "app"));
    try testing.expectEqualStrings("from-env", hints.get("SDL_FOO").?);
    try testing.expectEqual(SetOutcome.applied, try hints.set_with_priority("SDL_FOO", "forced", .override));
    try testing.expectEqualStrings("forced", hints.get("SDL_FOO").?);
    _ = try hints.reset("SDL_FOO");
    try testing.expectEqualStrings("from-env", hints.get("SDL_FOO").?);
}

test "legacy driver environment names" {
    var env = Environ.Map.init(testing.allocator);
    defer env.deinit();
    try env.put("SDL_VIDEODRIVER", "wayland");
    try env.put("SDL_AUDIODRIVER", "pipewire");
    var hints = Hints.init(testing.allocator, &env);
    defer hints.deinit();
    try testing.expectEqualStrings("wayland", hints.get(names.video_driver).?);
    try testing.expectEqualStrings("pipewire", hints.get(names.audio_driver).?);
    try env.put("SDL_VIDEO_DRIVER", "x11");
    try testing.expectEqualStrings("x11", hints.get(names.video_driver).?);
}

test "observers see registration, changes and resets" {
    var env = Environ.Map.init(testing.allocator);
    defer env.deinit();
    var hints = Hints.init(testing.allocator, &env);
    defer hints.deinit();
    var rec: Recorder = .{};
    try hints.add_observer("H", &rec.observer);
    try testing.expectEqual(@as(u32, 1), rec.calls);
    try testing.expectEqual(@as(?[]const u8, null), rec.seen_new());

    _ = try hints.set("H", "a");
    try testing.expectEqual(@as(u32, 2), rec.calls);
    try testing.expectEqual(@as(?[]const u8, null), rec.seen_old());
    try testing.expectEqualStrings("a", rec.seen_new().?);

    _ = try hints.set("H", "a"); // unchanged text: no call
    try testing.expectEqual(@as(u32, 2), rec.calls);
    _ = try hints.set("H", "b");
    try testing.expectEqualStrings("a", rec.seen_old().?);
    try testing.expectEqualStrings("b", rec.seen_new().?);

    try env.put("H", "e");
    _ = try hints.reset("H");
    try testing.expectEqualStrings("b", rec.seen_old().?);
    try testing.expectEqualStrings("e", rec.seen_new().?);
    const before = rec.calls;
    try hints.reset_all(); // stored value is null but the environment has one: observers hear it
    try testing.expectEqual(before + 1, rec.calls);
    try testing.expectEqualStrings("e", rec.seen_new().?);

    hints.remove_observer("H", &rec.observer);
    const after = rec.calls;
    _ = try hints.set_with_priority("H", "z", .override);
    try testing.expectEqual(after, rec.calls);
}

test "observer may remove itself while notified and order is newest first" {
    var hints = Hints.init(testing.allocator, null);
    defer hints.deinit();
    var order: [2]u8 = undefined;
    var count: usize = 0;
    const Ordered = struct {
        observer: Observer = .{ .on_change = on_change },
        tag: u8,
        sink: *[2]u8,
        count: *usize,
        armed: bool = false,
        fn on_change(observer: *Observer, _: []const u8, _: ?[]const u8, _: ?[]const u8) void {
            const self: *@This() = @fieldParentPtr("observer", observer);
            if (!self.armed) return;
            self.sink[self.count.*] = self.tag;
            self.count.* += 1;
        }
    };
    var first: Ordered = .{ .tag = 'a', .sink = &order, .count = &count };
    var second: Ordered = .{ .tag = 'b', .sink = &order, .count = &count };
    try hints.add_observer("O", &first.observer);
    try hints.add_observer("O", &second.observer);
    first.armed = true;
    second.armed = true;
    _ = try hints.set("O", "1");
    try testing.expectEqualSlices(u8, "ba", &order);

    var rec: Recorder = .{};
    rec.remove_self_from = &hints;
    try hints.add_observer("R", &rec.observer); // removes itself during its first call
    _ = try hints.set("R", "x");
    try testing.expectEqual(@as(u32, 1), rec.calls);
    try testing.expectEqual(@as(usize, 2), hints.registrations.items.len);
}

test "re-registering the same observer does not duplicate it" {
    var hints = Hints.init(testing.allocator, null);
    defer hints.deinit();
    var rec: Recorder = .{};
    try hints.add_observer("D", &rec.observer);
    try hints.add_observer("D", &rec.observer);
    try testing.expectEqual(@as(u32, 2), rec.calls); // one call per registration
    _ = try hints.set("D", "v");
    try testing.expectEqual(@as(u32, 3), rec.calls);
}

test "revision advances on change only" {
    var hints = Hints.init(testing.allocator, null);
    defer hints.deinit();
    const start = hints.revision;
    _ = try hints.set("R", "1");
    try testing.expect(hints.revision != start);
    const mid = hints.revision;
    _ = try hints.set("R", "1");
    try testing.expectEqual(mid, hints.revision);
}

test "string helpers match SDL" {
    try testing.expect(string_boolean(null, true));
    try testing.expect(!string_boolean(null, false));
    try testing.expect(string_boolean("", true));
    try testing.expect(!string_boolean("0", true));
    try testing.expect(!string_boolean("0xyz", true));
    try testing.expect(!string_boolean("FaLsE", true));
    try testing.expect(string_boolean("1", false));
    try testing.expect(string_boolean("anything", false));

    try testing.expectEqual(@as(i32, 7), string_integer(null, 7));
    try testing.expectEqual(@as(i32, 0), string_integer("false", 7));
    try testing.expectEqual(@as(i32, 1), string_integer("TRUE", 7));
    try testing.expectEqual(@as(i32, 42), string_integer("42abc", 7));
    try testing.expectEqual(@as(i32, -5), string_integer("-5", 7));
    try testing.expectEqual(@as(i32, 7), string_integer("abc", 7));
    try testing.expectEqual(@as(i32, std.math.maxInt(i32)), string_integer("99999999999999", 0));
    try testing.expectEqual(@as(i32, std.math.minInt(i32)), string_integer("-99999999999999", 0));
}

test "boolean and integer lookups use the effective value" {
    var hints = Hints.init(testing.allocator, null);
    defer hints.deinit();
    try testing.expect(hints.get_boolean("B", true));
    _ = try hints.set("B", "0");
    try testing.expect(!hints.get_boolean("B", true));
    _ = try hints.set("I", "12");
    try testing.expectEqual(@as(i32, 12), hints.get_integer("I", 0));
}

test "initial observer payloads survive self-removal and same-hint mutation" {
    var hints = Hints.init(testing.allocator, null);
    defer hints.deinit();
    _ = try hints.set("H", "before");
    const Reentrant = struct {
        observer: Observer = .{ .on_change = change },
        hints: *Hints,
        valid: bool = false,
        fn change(obs: *Observer, name: []const u8, old: ?[]const u8, new: ?[]const u8) void {
            const self: *@This() = @fieldParentPtr("observer", obs);
            self.hints.remove_observer(name, obs);
            _ = self.hints.set(name, "after") catch unreachable;
            self.valid = std.mem.eql(u8, name, "H") and
                std.mem.eql(u8, old.?, "before") and std.mem.eql(u8, new.?, "before");
        }
    };
    var observer: Reentrant = .{ .hints = &hints };
    try hints.add_observer("H", &observer.observer);
    try testing.expect(observer.valid);
    try testing.expectEqualStrings("after", hints.get("H").?);
    try testing.expectEqual(@as(usize, 0), hints.registrations.items.len);
}

test "notification payload survives mutation of the hint it was borrowed from" {
    var hints = Hints.init(testing.allocator, null);
    defer hints.deinit();
    _ = try hints.set("SOURCE", "before");
    const Reentrant = struct {
        observer: Observer = .{ .on_change = change },
        hints: *Hints,
        armed: bool = false,
        valid: bool = false,
        fn change(obs: *Observer, _: []const u8, _: ?[]const u8, new: ?[]const u8) void {
            const self: *@This() = @fieldParentPtr("observer", obs);
            if (!self.armed) return;
            self.armed = false;
            _ = self.hints.set("SOURCE", "after") catch unreachable;
            self.valid = std.mem.eql(u8, "before", new.?);
        }
    };
    var observer: Reentrant = .{ .hints = &hints };
    try hints.add_observer("DEST", &observer.observer);
    observer.armed = true;
    _ = try hints.set("DEST", hints.get("SOURCE"));
    try testing.expect(observer.valid);
}

test "failed observer re-registration preserves its previous registration" {
    var failing = testing.FailingAllocator.init(testing.allocator, .{});
    var hints = Hints.init(failing.allocator(), null);
    defer hints.deinit();
    _ = try hints.set("H", "before");
    var observer: Recorder = .{};
    try hints.add_observer("H", &observer.observer);
    const before = observer.calls;
    // Exercise failure copying either the name or the current-value snapshot.
    for (0..2) |successful_allocations| {
        failing.fail_index = failing.alloc_index + successful_allocations;
        try testing.expectError(error.OutOfMemory, hints.add_observer("H", &observer.observer));
        try testing.expectEqual(before, observer.calls);
        try testing.expectEqual(@as(usize, 1), hints.registrations.items.len);
    }
    failing.fail_index = std.math.maxInt(usize);
    _ = try hints.set("H", "after");
    try testing.expectEqual(before + 1, observer.calls);
}
