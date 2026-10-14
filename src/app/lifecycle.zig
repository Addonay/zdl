//! Reference-counted subsystem lifecycle with SDL_Init / SDL_InitSubSystem /
//! SDL_QuitSubSystem / SDL_WasInit / SDL_Quit semantics (SDL.c), as an explicit
//! owned value. Nothing starts implicitly and no state is global: the
//! application creates a `Lifecycle(Host)` next to the objects it composes (a
//! `linux.Platform`, audio devices, joystick registries, a camera, ...) and the
//! host type says how to start and stop each subsystem.
//!
//! ```zig
//! const Host = struct {
//!     platform: ?zdl.linux.Platform = null,
//!     pub fn start(host: *Host, subsystem: lifecycle.Subsystem) !void { ... }
//!     pub fn stop(host: *Host, subsystem: lifecycle.Subsystem) void { ... }
//! };
//! var host: Host = .{};
//! var life = lifecycle.Lifecycle(Host).init(&host);
//! try life.init_subsystems(.initMany(&.{ .video, .audio }));
//! defer life.quit_all();
//! ```
//!
//! Semantics preserved from SDL:
//! - Every subsystem has a reference count. `start` runs when a count goes from
//!   0 to 1 and `stop` when the last reference is released.
//! - Implied dependencies: video, audio, joystick and camera require events;
//!   gamepad requires joystick. A dependent holds one reference on its
//!   dependency, so asking for video twice and quitting once keeps both video
//!   and events alive. Dependencies start before the dependent and stop after it.
//! - Within one call subsystems start in the order events, video, audio, joystick,
//!   gamepad, haptic, sensor, camera. If one fails, those started by that call
//!   are rolled back (reference released) and the failure is returned.
//! - `quit_subsystems` releases in the reverse order (camera first, events last).
//!   Releasing a subsystem whose count is zero does nothing.
//! - `quit_all` (SDL_Quit) stops every initialized subsystem regardless of count
//!   and resets all counts to zero.
//!
//! Differences: counts are 32-bit (SDL stores eight bits and asserts below 255);
//! `start` failures propagate the host's own error set instead of SDL_GetError;
//! SDL_Quit's teardown of timers, hints, logging and properties belongs to
//! those owned objects here (see `Services`). The SDL_INIT_* flag values are
//! available through `Subsystem.flag_bit` for interop, but the API takes sets.
//!
//! Main-thread bookkeeping (SDL_IsMainThread / SDL_IsVideoThread): the thread
//! that starts events and video is remembered, and `set_main_ready` records
//! the main thread. Not synchronized; use from the thread that owns the host
//! unless the host's own locking says otherwise.
const std = @import("std");
const hints_mod = @import("../core/hints.zig");
const log_mod = @import("../core/log.zig");
const metadata_mod = @import("metadata.zig");

/// A startable subsystem (SDL_INIT_* flags that name one).
pub const Subsystem = enum {
    audio,
    video,
    joystick,
    haptic,
    gamepad,
    events,
    sensor,
    camera,

    /// SDL's numeric flag, e.g. 0x20 for video.
    pub fn flag_bit(self: Subsystem) u32 {
        return switch (self) {
            .audio => 0x00000010,
            .video => 0x00000020,
            .joystick => 0x00000200,
            .haptic => 0x00001000,
            .gamepad => 0x00002000,
            .events => 0x00004000,
            .sensor => 0x00008000,
            .camera => 0x00010000,
        };
    }

    /// The subsystem implied by this one, if any.
    pub fn requires(self: Subsystem) ?Subsystem {
        return switch (self) {
            .video, .audio, .joystick, .camera => .events,
            .gamepad => .joystick,
            .haptic, .sensor, .events => null,
        };
    }
};

pub const Set = std.EnumSet(Subsystem);

/// Converts SDL_INIT_* flag bits to a set (unknown bits such as SDL_INIT_TIMER
/// are ignored).
pub fn set_from_flags(flags: u32) Set {
    var set: Set = .empty;
    for (std.enums.values(Subsystem)) |subsystem| {
        if (flags & subsystem.flag_bit() != 0) set.insert(subsystem);
    }
    return set;
}

/// Converts a set to SDL_INIT_* flag bits.
pub fn flags_from_set(set: Set) u32 {
    var flags: u32 = 0;
    var it = set.iterator();
    while (it.next()) |subsystem| flags |= subsystem.flag_bit();
    return flags;
}

/// Start order inside one `init_subsystems` call.
const start_order = [_]Subsystem{ .events, .video, .audio, .joystick, .gamepad, .haptic, .sensor, .camera };
/// Release order inside one `quit_subsystems` call.
const quit_order = [_]Subsystem{ .camera, .sensor, .gamepad, .joystick, .haptic, .audio, .video, .events };

/// `Host` provides:
///
///     pub fn start(host: *Host, subsystem: Subsystem) E!void
///     pub fn stop(host: *Host, subsystem: Subsystem) void
///
/// where `E` is any error set. `start` must leave the subsystem unstarted when it
/// fails. It is only called for 0 -> 1 transitions, with dependencies already running.
pub fn Lifecycle(comptime Host: type) type {
    comptime {
        if (!@hasDecl(Host, "start")) @compileError("Lifecycle: " ++ @typeName(Host) ++ " must declare start(host, subsystem)");
        if (!@hasDecl(Host, "stop")) @compileError("Lifecycle: " ++ @typeName(Host) ++ " must declare stop(host, subsystem)");
    }
    return struct {
        const Self = @This();

        /// What `Host.start` can fail with.
        pub const Error = @typeInfo(@typeInfo(@TypeOf(Host.start)).@"fn".return_type.?).error_union.error_set;

        host: *Host,
        counts: std.EnumArray(Subsystem, u32) = .initFill(0),
        in_quit_all: bool = false,
        main_thread: ?std.Thread.Id = null,
        events_thread: ?std.Thread.Id = null,
        video_thread: ?std.Thread.Id = null,

        pub fn init(host: *Host) Self {
            return .{ .host = host };
        }

        /// SDL_InitSubSystem (and SDL_Init). Requesting an already running
        /// subsystem adds a reference. On failure everything this call started
        /// is released again.
        pub fn init_subsystems(self: *Self, requested: Set) Error!void {
            var acquired: Set = .empty;
            errdefer self.quit_subsystems(acquired);
            for (start_order) |subsystem| {
                if (!requested.contains(subsystem)) continue;
                try self.acquire(subsystem);
                acquired.insert(subsystem);
            }
        }

        /// Takes one reference, starting dependencies and the subsystem itself on
        /// the first. SDL_InitOrIncrementSubsystem is the same operation.
        fn acquire(self: *Self, subsystem: Subsystem) Error!void {
            const count = self.counts.getPtr(subsystem);
            if (count.* > 0) {
                count.* += 1;
                return;
            }
            if (subsystem.requires()) |dependency| try self.acquire(dependency);
            errdefer if (subsystem.requires()) |dependency| self.release(dependency);
            try self.host.start(subsystem);
            count.* = 1;
            switch (subsystem) {
                .events => self.events_thread = std.Thread.getCurrentId(),
                .video => self.video_thread = std.Thread.getCurrentId(),
                else => {},
            }
        }

        /// SDL_QuitSubSystem: releases one reference of each listed subsystem, in
        /// reverse start order. Unreferenced subsystems are skipped.
        pub fn quit_subsystems(self: *Self, requested: Set) void {
            for (quit_order) |subsystem| {
                if (requested.contains(subsystem)) self.release(subsystem);
            }
        }

        fn release(self: *Self, subsystem: Subsystem) void {
            const count = self.counts.getPtr(subsystem);
            if (count.* == 0) return;
            if (count.* == 1 or self.in_quit_all) {
                self.host.stop(subsystem);
                switch (subsystem) {
                    .events => self.events_thread = null,
                    .video => self.video_thread = null,
                    else => {},
                }
                if (subsystem.requires()) |dependency| self.release(dependency);
            }
            // After a forced stop the count may already be reset by a dependent.
            if (count.* > 0) count.* = if (self.in_quit_all) 0 else count.* - 1;
        }

        /// SDL_Quit: stops every initialized subsystem whatever its count.
        pub fn quit_all(self: *Self) void {
            self.in_quit_all = true;
            self.quit_subsystems(.full);
            self.counts = .initFill(0);
            self.in_quit_all = false;
        }

        /// SDL_WasInit: which of `query` are running; null asks about all.
        pub fn was_init(self: *const Self, query: ?Set) Set {
            const wanted = query orelse Set.full;
            var result: Set = .empty;
            var it = wanted.iterator();
            while (it.next()) |subsystem| {
                if (self.counts.get(subsystem) > 0) result.insert(subsystem);
            }
            return result;
        }

        /// Current reference count of one subsystem.
        pub fn reference_count(self: *const Self, subsystem: Subsystem) u32 {
            return self.counts.get(subsystem);
        }

        /// SDL_SetMainReady: remembers the calling thread as the main thread
        /// (first call wins).
        pub fn set_main_ready(self: *Self) void {
            if (self.main_thread == null) self.main_thread = std.Thread.getCurrentId();
        }

        /// SDL_IsMainThread: the video thread if video runs, else the events
        /// thread if events run, else the recorded main thread; true if none is known.
        pub fn is_main_thread(self: *const Self) bool {
            const current = std.Thread.getCurrentId();
            if (self.video_thread) |id| return id == current;
            if (self.events_thread) |id| return id == current;
            if (self.main_thread) |id| return id == current;
            return true;
        }

        /// SDL_IsVideoThread: true only while video runs on the calling thread.
        pub fn is_video_thread(self: *const Self) bool {
            const id = self.video_thread orelse return false;
            return id == std.Thread.getCurrentId();
        }
    };
}

/// The always-available core services SDL_Quit tears down last (hints, logging,
/// metadata) bundled into one owned value with the same wiring SDL has: the
/// logger follows `SDL_LOGGING` through the hint table. Create it in place; the
/// logger registers its own address with the hints, so the struct must not move.
pub const Services = struct {
    hints: hints_mod.Hints,
    logger: log_mod.Logger,
    metadata: metadata_mod.Metadata,

    /// `environ` is borrowed for the lifetime of the services (see `Hints`).
    pub fn init(self: *Services, allocator: std.mem.Allocator, environ: ?*const std.process.Environ.Map) (hints_mod.Error)!void {
        self.hints = hints_mod.Hints.init(allocator, environ);
        errdefer self.hints.deinit();
        self.logger = log_mod.Logger.init(allocator);
        errdefer self.logger.deinit();
        self.metadata = metadata_mod.Metadata.init(allocator);
        errdefer self.metadata.deinit();
        try self.logger.attach(&self.hints);
    }

    pub fn deinit(self: *Services) void {
        self.logger.detach();
        self.metadata.deinit();
        self.logger.deinit();
        self.hints.deinit();
        self.* = undefined;
    }
};

const testing = std.testing;

const Recording = struct {
    events: [64]Event = undefined,
    len: usize = 0,
    fail_on: ?Subsystem = null,

    const Event = struct { start: bool, subsystem: Subsystem };

    pub fn start(host: *Recording, subsystem: Subsystem) error{StartFailed}!void {
        if (host.fail_on == subsystem) return error.StartFailed;
        host.record(true, subsystem);
    }
    pub fn stop(host: *Recording, subsystem: Subsystem) void {
        host.record(false, subsystem);
    }
    fn record(host: *Recording, started: bool, subsystem: Subsystem) void {
        host.events[host.len] = .{ .start = started, .subsystem = subsystem };
        host.len += 1;
    }
    fn expect(host: *const Recording, expected: []const Event) !void {
        try testing.expectEqual(expected.len, host.len);
        for (expected, host.events[0..host.len]) |want, got| {
            try testing.expectEqual(want.start, got.start);
            try testing.expectEqual(want.subsystem, got.subsystem);
        }
    }
};

test "dependencies start first and stop last" {
    var host: Recording = .{};
    var life = Lifecycle(Recording).init(&host);
    try life.init_subsystems(.initMany(&.{.gamepad}));
    try host.expect(&.{
        .{ .start = true, .subsystem = .events },
        .{ .start = true, .subsystem = .joystick },
        .{ .start = true, .subsystem = .gamepad },
    });
    try testing.expectEqual(@as(u32, 1), life.reference_count(.events));
    life.quit_subsystems(.initMany(&.{.gamepad}));
    try host.expect(&.{
        .{ .start = true, .subsystem = .events },
        .{ .start = true, .subsystem = .joystick },
        .{ .start = true, .subsystem = .gamepad },
        .{ .start = false, .subsystem = .gamepad },
        .{ .start = false, .subsystem = .joystick },
        .{ .start = false, .subsystem = .events },
    });
    try testing.expectEqual(Set.empty, life.was_init(null));
}

test "references are counted per subsystem" {
    var host: Recording = .{};
    var life = Lifecycle(Recording).init(&host);
    const video = Set.initMany(&.{.video});
    try life.init_subsystems(video);
    try life.init_subsystems(video);
    try life.init_subsystems(.initMany(&.{.audio}));
    try testing.expectEqual(@as(u32, 2), life.reference_count(.video));
    try testing.expectEqual(@as(u32, 2), life.reference_count(.events)); // audio, video's first
    life.quit_subsystems(video);
    try testing.expect(life.was_init(video).contains(.video));
    const stops_before = host.len;
    life.quit_subsystems(video);
    try testing.expect(!life.was_init(video).contains(.video));
    try testing.expect(life.was_init(null).contains(.events)); // audio still holds it
    try testing.expectEqual(stops_before + 1, host.len); // only video stopped
    life.quit_subsystems(video); // already zero: nothing happens
    try testing.expectEqual(stops_before + 1, host.len);
}

test "explicit events request stacks with implied ones" {
    var host: Recording = .{};
    var life = Lifecycle(Recording).init(&host);
    try life.init_subsystems(.initMany(&.{ .events, .video }));
    try testing.expectEqual(@as(u32, 2), life.reference_count(.events));
    life.quit_subsystems(.initMany(&.{.video}));
    try testing.expectEqual(@as(u32, 1), life.reference_count(.events));
    try testing.expect(life.was_init(.initMany(&.{.events})).contains(.events));
}

test "failed start rolls back this call only" {
    var host: Recording = .{};
    var life = Lifecycle(Recording).init(&host);
    try life.init_subsystems(.initMany(&.{.events}));
    host.len = 0;
    host.fail_on = .audio;
    try testing.expectError(error.StartFailed, life.init_subsystems(.initMany(&.{ .video, .audio, .sensor })));
    // video started then rolled back; sensor never attempted (audio precedes it).
    try host.expect(&.{
        .{ .start = true, .subsystem = .video },
        .{ .start = false, .subsystem = .video },
    });
    try testing.expectEqual(@as(u32, 1), life.reference_count(.events));
    try testing.expectEqual(@as(u32, 0), life.reference_count(.video));
    try testing.expectEqual(@as(u32, 0), life.reference_count(.audio));
}

test "failing dependent releases its dependency" {
    var host: Recording = .{};
    var life = Lifecycle(Recording).init(&host);
    host.fail_on = .joystick;
    try testing.expectError(error.StartFailed, life.init_subsystems(.initMany(&.{.gamepad})));
    try host.expect(&.{
        .{ .start = true, .subsystem = .events },
        .{ .start = false, .subsystem = .events },
    });
    try testing.expectEqual(Set.empty, life.was_init(null));
}

test "quit_all stops everything regardless of count" {
    var host: Recording = .{};
    var life = Lifecycle(Recording).init(&host);
    try life.init_subsystems(.initMany(&.{ .video, .camera }));
    try life.init_subsystems(.initMany(&.{.video}));
    host.len = 0;
    life.quit_all();
    // camera -> events, video (events already gone).
    try host.expect(&.{
        .{ .start = false, .subsystem = .camera },
        .{ .start = false, .subsystem = .events },
        .{ .start = false, .subsystem = .video },
    });
    try testing.expectEqual(Set.empty, life.was_init(null));
    try testing.expectEqual(@as(u32, 0), life.reference_count(.events));
    try life.init_subsystems(.initMany(&.{.video})); // usable again
    try testing.expect(life.was_init(.initMany(&.{.video})).contains(.video));
}

test "thread bookkeeping" {
    var host: Recording = .{};
    var life = Lifecycle(Recording).init(&host);
    try testing.expect(life.is_main_thread());
    try testing.expect(!life.is_video_thread());
    life.set_main_ready();
    try life.init_subsystems(.initMany(&.{.video}));
    try testing.expect(life.is_video_thread());
    try testing.expect(life.is_main_thread());
    life.quit_all();
    try testing.expect(!life.is_video_thread());
}

test "flag conversion round-trips" {
    const set = Set.initMany(&.{ .video, .gamepad, .camera });
    const flags = flags_from_set(set);
    try testing.expectEqual(@as(u32, 0x20 | 0x2000 | 0x10000), flags);
    try testing.expectEqual(set, set_from_flags(flags | 0x1)); // SDL_INIT_TIMER-like bit ignored
}

test "services wire the logger to the hint table" {
    var env = std.process.Environ.Map.init(testing.allocator);
    defer env.deinit();
    var services: Services = undefined;
    try services.init(testing.allocator, &env);
    defer services.deinit();
    _ = try services.hints.set(hints_mod.names.logging, "app=trace");
    try testing.expectEqual(log_mod.Threshold.trace, services.logger.threshold(.application));
    try services.metadata.set_basic("N", null, null);
    try testing.expectEqualStrings("N", services.metadata.get(.name, &services.hints).?);
}
