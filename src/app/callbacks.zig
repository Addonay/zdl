//! SDL's main-callbacks model (`main/SDL_main_callbacks.c` and
//! `main/generic/SDL_sysmain_callbacks.c`) as an explicit, comptime-generic loop over
//! the Linux `Platform`. The application is a value the caller owns, so there are no
//! globals, no `void *` app state, no SDL_main entry macro and no hidden subsystem
//! startup. The caller passes the clock (`std.Io`) that paces iterations.
//!
//! The app type declares these functions (checked at compile time):
//!
//!   pub fn init(app: *App, context: *Context) Result                  // optional
//!   pub fn event(app: *App, context: *Context, ev: event.Event) Result // optional
//!   pub fn iterate(app: *App, context: *Context) Result                // required
//!   pub fn quit(app: *App, context: *Context, result: Result) void    // optional
//!
//! Each returns `Result.continue` to keep running, or `success`/`failure` to stop.
//! The first non-continue result is final: `init` skips the loop when it is not
//! continue, later events are no longer delivered, and `iterate` is not called again.
//! `quit` runs exactly once, with the final result, after the last `iterate`.
//!
//! Loop order per iteration, as SDL_IterateMainCallbacks:
//! 1. pump the platform (or, when pacing is `wait_event`, block until an event);
//! 2. poll the explicit signal source, if one was given (SDL_SendPendingSignalEvents);
//! 3. deliver every queued event to `event`, in queue order;
//! 4. call `iterate`;
//! 5. pace: sleep until the next deadline when a rate is set.
//!
//! Immediate lifecycle events: SDL never queues `terminating`, `low_memory` and the
//! background/foreground kinds. SDL_main_callbacks.c's event watcher delivers them inside
//! the sending call. Call `send_app_event` for them from inside a callback (or from
//! code that holds the app and context); it runs the queue's filter and watchers, then
//! delivers queued events and this one to `event` at once. Other `event.AppKind`s are
//! queued as usual. Deliberate difference: the platform's queue has no app context, so a
//! lifecycle event pushed directly into the queue is delivered in order rather than
//! immediately.
//!
//! Termination rules (SDL_MainCallbacksSawEventTerminating, plus one port addition):
//! - An `app` event of kind `terminating` makes the result `success` unless the app
//!   already chose one. This holds for the immediate and the queued path.
//! - A `quit` event makes the result `success` when `Options.quit_on_quit_event` is
//!   set (the default). SDL leaves this to the app; set the option to false to match
//!   SDL exactly.
//!
//! Pacing: `Options.pacing` (or `Context.pacing`, which an app may change between
//! iterations) is `Pacing.from_hint` applied to the value of SDL_HINT_MAIN_CALLBACK_RATE
//! ("waitevent", a rate in iterations per second, or unset). Rate pacing keeps SDL's
//! deadline scheme: a late iteration resets the deadline to now instead of bursting.
//!
//! Ownership and errors: `run` allocates nothing and does not own the platform or the
//! app. Platform errors and cancelled clock sleeps stop the loop after `quit(failure)`
//! has been called, and are returned to the caller. The platform must be used from one
//! thread only, as the platform documents.
const std = @import("std");
const event = @import("../events/event.zig");
const quit = @import("../events/quit.zig");
const queue = @import("../events/queue.zig");
const linux = @import("../platform/linux.zig");
const timer = @import("../system/timer.zig");
const hints_mod = @import("../core/hints.zig");

/// Platform the loop drives. Re-exported so apps can name it without other imports.
pub const Platform = linux.Platform;
/// Input event type delivered to `event`.
pub const Event = event.Event;

/// Outcome of an app callback (SDL_AppResult).
pub const Result = enum {
    @"continue",
    success,
    failure,
};

/// Process exit status SDL_EnterAppMainCallbacks returns: 1 for `failure`, else 0.
pub fn exit_code(result: Result) u8 {
    return if (result == .failure) 1 else 0;
}

/// Errors from the platform or from a cancelled clock sleep.
pub const Error = linux.Error || std.Io.Cancelable;

/// Name of the SDL hint that `Pacing.from_hint` reads.
pub const main_callback_rate_hint = hints_mod.names.main_callback_rate;

/// How iterations are paced. Unlimited is SDL's default: iterate as fast as the
/// platform allows (vsync if the app presents with it).
pub const Pacing = union(enum) {
    /// No deliberate delay between iterations.
    unlimited,
    /// Block until the platform has an event, then iterate once ("waitevent").
    wait_event,
    /// Aim for this many iterations per second. Non-positive or non-finite values
    /// behave as `unlimited`.
    rate_hz: f64,

    /// Reads the value of SDL_HINT_MAIN_CALLBACK_RATE. Unset or empty means unlimited,
    /// "waitevent" means `wait_event`, and a positive number is a rate in Hz. Text
    /// that is not a number is unlimited. Deliberate difference: SDL_atof takes the
    /// leading number of "60fps"; this parses the whole string.
    pub fn from_hint(value: ?[]const u8) Pacing {
        const text = value orelse return .unlimited;
        if (text.len == 0) return .unlimited;
        if (std.mem.eql(u8, text, "waitevent")) return .wait_event;
        const hz = std.fmt.parseFloat(f64, text) catch return .unlimited;
        if (!(hz > 0) or !std.math.isFinite(hz)) return .unlimited;
        return .{ .rate_hz = hz };
    }

    /// Nanoseconds between iteration deadlines, or zero for no rate limit. Matches
    /// SDL: `(Uint64)(SDL_NS_PER_SECOND / rate)`, so very high rates also become zero.
    /// Periods exceeding u64 nanoseconds saturate instead of trapping.
    pub fn increment_ns(self: Pacing) u64 {
        return switch (self) {
            .rate_hz => |hz| blk: {
                if (!(hz > 0) or !std.math.isFinite(hz)) break :blk 0;
                const period = 1_000_000_000.0 / hz;
                // maxInt(u64) rounds to 2^64 as f64; equality is also outside
                // the conversion range. A subnormal rate can produce infinity.
                if (period >= @as(f64, @floatFromInt(std.math.maxInt(u64))))
                    break :blk std.math.maxInt(u64);
                break :blk @intFromFloat(period);
            },
            else => 0,
        };
    }

    fn same(a: Pacing, b: Pacing) bool {
        return switch (a) {
            .unlimited => b == .unlimited,
            .wait_event => b == .wait_event,
            .rate_hz => |hz| switch (b) {
                .rate_hz => |other| hz == other,
                else => false,
            },
        };
    }
};

/// Options for `run`. Fixed for the run except `pacing`, which the app may change
/// through `Context.pacing`.
pub const Options = struct {
    pacing: Pacing = .unlimited,
    /// Ends the loop with `success` when a `quit` event reaches the app and the app
    /// has not chosen a result. See the module notes.
    quit_on_quit_event: bool = true,
    /// Explicit SIGINT/SIGTERM source (see `events/quit.zig`). Null installs nothing:
    /// signals are then not polled and keep their default action. The loop polls it
    /// once per iteration; it does not wake a blocked `wait_event`, so add `Signals.fd`
    /// to the app's own wait set if that matters.
    signals: ?*quit.Signals = null,
    /// Hint table that supplies SDL_MAIN_CALLBACK_RATE. When set, the pacing is
    /// read from it at start (replacing `pacing`) and again whenever the table's
    /// `revision` changes and the rate hint's meaning differs from the last one
    /// read, as SDL's hint callback does while the loop runs. A pacing the app
    /// set through `Context.pacing` is only replaced by such a change.
    hints: ?*const hints_mod.Hints = null,
};

/// State handed to every app callback. The app reads the platform and clock through
/// it, may change `pacing` between iterations and may set `result` to end the loop.
pub const Context = struct {
    platform: *linux.Platform,
    io: std.Io,
    /// Pacing applied after the next iteration and to the wait-for-event decision.
    /// Changing it takes effect at the next loop step, as SDL's hint callback does.
    pacing: Pacing,
    /// The loop's current result (SDL's apprc). It starts as `continue` and the first
    /// other value is final: no further app callbacks run. Set by the app, by a
    /// callback's return value, or by a terminating lifecycle event.
    result: Result = .@"continue",
    /// Copied from `Options.quit_on_quit_event` for the event delivery path.
    quit_on_quit_event: bool = true,

    /// Monotonic nanoseconds from the `io` clock (`std.Io.Clock.awake`).
    /// Host monotonic time in nanoseconds, shared with event timestamps.
    pub fn now_ns(self: *const Context) event.Timestamp {
        return timer.monotonic_now_ns(self.io);
    }
};

/// Runs the app until a callback returns a non-continue result, then returns that
/// result. `app` is owned by the caller and must outlive the call. `platform` and `io`
/// must be the same platform clock as the caller uses.
///
/// Compile-time checks: `App` must declare `iterate`; the other callbacks are optional
/// and are looked up with `@hasDecl`.
pub fn run(
    comptime App: type,
    app: *App,
    platform: *linux.Platform,
    io: std.Io,
    options: Options,
) Error!Result {
    comptime {
        if (!@hasDecl(App, "iterate")) @compileError("callbacks.run: " ++ @typeName(App) ++ " must declare iterate(app, context)");
    }
    var context: Context = .{
        .platform = platform,
        .io = io,
        .pacing = if (options.hints) |table| Pacing.from_hint(table.get(main_callback_rate_hint)) else options.pacing,
        .quit_on_quit_event = options.quit_on_quit_event,
    };

    // The watch starts before `init`, so a rate hint that `init` sets is a change
    // the first iteration applies. SDL's callback likewise reads the hint after
    // initialization, so the value set during it is not missed.
    var hint_watch = HintPacing.init(options.hints, context.pacing);
    if (@hasDecl(App, "init")) context.result = App.init(app, &context);
    if (context.result == .@"continue") {
        context.result = loop(App, app, &context, options, &hint_watch) catch |err| {
            if (@hasDecl(App, "quit")) App.quit(app, &context, .failure);
            return err;
        };
    }
    if (@hasDecl(App, "quit")) App.quit(app, &context, context.result);
    return context.result;
}

fn loop(comptime App: type, app: *App, context: *Context, options: Options, hint_watch: *HintPacing) Error!Result {
    // SDL primes its hint callback, so the first iteration after start counts as a
    // change: it pumps instead of blocking even in wait_event mode.
    var applied = context.pacing;
    var pacing_changed = true;
    var next_deadline_ns: u64 = 0;
    const first_increment = applied.increment_ns();
    if (first_increment != 0) next_deadline_ns = deadline_after(context.now_ns(), first_increment);

    while (context.result == .@"continue") {
        if (options.hints) |table| {
            if (hint_watch.poll(table)) |changed| context.pacing = changed;
        }
        if (!Pacing.same(applied, context.pacing)) {
            applied = context.pacing;
            pacing_changed = true;
        }

        // In wait_event mode the platform blocks until something is queued. It pumps
        // internally, so the pump below is skipped for that iteration.
        if (applied == .wait_event and !pacing_changed) {
            _ = try context.platform.wait_event(null);
        } else {
            try context.platform.pump();
        }
        pacing_changed = false;

        try poll_signals(context, options);
        deliver_events(App, app, context);
        if (context.result == .@"continue") context.result = App.iterate(app, context);
        if (context.result != .@"continue") break;

        try pace(context, &next_deadline_ns);
    }
    return context.result;
}

/// Turns a pending SIGINT or SIGTERM into a queued quit (SDL_SendPendingSignalEvents).
fn poll_signals(context: *Context, options: Options) queue.PushError!void {
    const signals = options.signals orelse return;
    const ev = signals.poll(context.now_ns()) orelse return;
    _ = try context.platform.events.send_app_event(ev);
}

/// Hands every queued event to the app in order (SDL_DispatchMainCallbackEvents).
/// Borrowed event payloads are valid through this dispatch pass and until the
/// next platform pump; an app that retains them copies them before then.
/// Once the result is no longer continue, no events reach the app but the queue is
/// still drained.
fn deliver_events(comptime App: type, app: *App, context: *Context) void {
    while (context.platform.next_event()) |ev| {
        if (context.result != .@"continue") continue;
        dispatch(App, app, context, ev);
    }
}

/// Delivers one event to the app, then applies the termination rules.
fn dispatch(comptime App: type, app: *App, context: *Context, ev: event.Event) void {
    if (@hasDecl(App, "event")) {
        context.result = App.event(app, context, ev);
        if (context.result != .@"continue") return;
    }
    switch (ev) {
        .app => |lifecycle| {
            // SDL_MainCallbacksSawEventTerminating: success unless the app chose a result.
            if (lifecycle.kind == .terminating) context.result = .success;
        },
        .quit => {
            if (context.quit_on_quit_event) context.result = .success;
        },
        else => {},
    }
}

/// Sends an app lifecycle notification now, as SDL_SendAppEvent and the main-callbacks
/// watcher do. For lifecycle kinds (see `event.Event.is_app_lifecycle`) the queue's
/// enablement check, filter and watchers run first (`queue.Queue.send_app_event`); if
/// they accept, every queued event is delivered in order and then this one goes to
/// `App.event`. `terminating` then ends the loop with `success` unless a result was
/// already chosen. Other kinds are queued and delivered in order by the loop.
///
/// Returns the loop's result after the call. Once a result is set, nothing is sent.
/// Call it from the app's callbacks with the `app` and `context` they received; `App`
/// must be the type passed to `run`.
pub fn send_app_event(comptime App: type, app: *App, context: *Context, kind: event.AppKind) queue.PushError!Result {
    if (context.result != .@"continue") return context.result;
    const ev: event.Event = .{ .app = .{ .kind = kind } };
    const accepted = try context.platform.events.send_app_event(ev);
    if (!accepted or !ev.is_app_lifecycle()) return context.result;
    deliver_events(App, app, context);
    if (context.result == .@"continue") dispatch(App, app, context, ev);
    return context.result;
}

/// Detects SDL_MAIN_CALLBACK_RATE changes through `Hints.revision`.
const HintPacing = struct {
    revision: u64,
    last: Pacing,

    fn init(table: ?*const hints_mod.Hints, current: Pacing) HintPacing {
        return .{ .revision = if (table) |t| t.revision else 0, .last = current };
    }

    /// The new pacing if the hint table changed in a way that alters the rate hint.
    fn poll(self: *HintPacing, table: *const hints_mod.Hints) ?Pacing {
        if (table.revision == self.revision) return null;
        self.revision = table.revision;
        const from_hint = Pacing.from_hint(table.get(main_callback_rate_hint));
        if (Pacing.same(from_hint, self.last)) return null;
        self.last = from_hint;
        return from_hint;
    }
};

fn deadline_after(now: u64, increment: u64) u64 {
    return now +| increment;
}

/// Sleeps until the next deadline, as SDL's generic loop does: the first iteration
/// after a rate is set is not delayed, a late iteration moves the deadline to now, and
/// the deadline advances by one increment each step.
fn pace(context: *Context, next_deadline_ns: *u64) Error!void {
    const increment = context.pacing.increment_ns();
    if (increment == 0) {
        next_deadline_ns.* = 0;
        return;
    }
    const now = context.now_ns();
    if (next_deadline_ns.* > now) {
        try timer.delay_precise_ns(context.io, next_deadline_ns.* - now);
    } else {
        next_deadline_ns.* = now;
    }
    next_deadline_ns.* = deadline_after(next_deadline_ns.*, increment);
}

test "pacing hint parsing and increments" {
    const testing = std.testing;
    try testing.expect(Pacing.from_hint(null) == .unlimited);
    try testing.expect(Pacing.from_hint("") == .unlimited);
    try testing.expect(Pacing.from_hint("waitevent") == .wait_event);
    try testing.expect(Pacing.from_hint("junk") == .unlimited);
    try testing.expect(Pacing.from_hint("-5") == .unlimited);
    try testing.expectEqual(@as(u64, 16_666_666), Pacing.from_hint("60").increment_ns());
    try testing.expectEqual(@as(u64, 0), (@as(Pacing, .unlimited)).increment_ns());
    try testing.expectEqual(@as(u64, 0), (Pacing{ .rate_hz = 1e12 }).increment_ns());
}

test "exit code follows SDL_EnterAppMainCallbacks" {
    try std.testing.expectEqual(@as(u8, 1), exit_code(.failure));
    try std.testing.expectEqual(@as(u8, 0), exit_code(.success));
    try std.testing.expectEqual(@as(u8, 0), exit_code(.@"continue"));
}

test "rate hint changes are detected through the table revision" {
    const testing = std.testing;
    var hints = hints_mod.Hints.init(testing.allocator, null);
    defer hints.deinit();
    var watch = HintPacing.init(&hints, .unlimited);
    try testing.expect(watch.poll(&hints) == null);
    _ = try hints.set("SDL_OTHER", "1"); // unrelated: revision moves, pacing does not
    try testing.expect(watch.poll(&hints) == null);
    _ = try hints.set(main_callback_rate_hint, "30");
    try testing.expectEqual(@as(f64, 30), watch.poll(&hints).?.rate_hz);
    try testing.expect(watch.poll(&hints) == null);
    _ = try hints.set(main_callback_rate_hint, "waitevent");
    try testing.expect(watch.poll(&hints).? == .wait_event);
    _ = try hints.reset(main_callback_rate_hint);
    try testing.expect(watch.poll(&hints).? == .unlimited);
}

test "a rate hint set during initialization is seen by the first poll" {
    const testing = std.testing;
    var hints = hints_mod.Hints.init(testing.allocator, null);
    defer hints.deinit();
    // `run` creates the watch before App.init, which then sets the hint.
    var watch = HintPacing.init(&hints, Pacing.from_hint(hints.get(main_callback_rate_hint)));
    _ = try hints.set(main_callback_rate_hint, "30");
    try testing.expectEqual(@as(f64, 30), watch.poll(&hints).?.rate_hz);
}

test "tiny pacing rates and large deadlines saturate safely" {
    const testing = std.testing;
    const maximum = std.math.maxInt(u64);
    try testing.expectEqual(@as(u64, maximum), Pacing.from_hint("1e-100").increment_ns());
    try testing.expectEqual(@as(u64, maximum), (Pacing{ .rate_hz = 5e-324 }).increment_ns());
    try testing.expectEqual(@as(u64, maximum), (Pacing{ .rate_hz = 1_000_000_000.0 / 18446744073709551616.0 }).increment_ns());
    try testing.expectEqual(@as(u64, maximum), deadline_after(100, maximum));
    try testing.expectEqual(@as(u64, maximum), deadline_after(maximum - 10, 20));
    try testing.expectEqual(@as(u64, 150), deadline_after(100, 50));
}
