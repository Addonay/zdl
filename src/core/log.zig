//! Categorized, prioritized logging as SDL_log.c, built as an explicit `Logger`
//! value over a pluggable `Output`. There is no global logger, hidden lock or
//! C varargs: messages use Zig format strings, and the application (or each
//! library user) owns a `Logger` and passes it where needed. For ordinary Zig
//! code `std.log` remains the right tool; this module exists so SDL's category
//! model, `SDL_LOGGING` hint grammar and per-category thresholds are available,
//! and `std_log_output` forwards the result into `std.log`.
//!
//! Defaults match SDL_ResetLogPriorities: warnings and errors show for every
//! category; the application category shows `info`, `assert` shows `warn`,
//! `test` shows `verbose`, and all others only `err`. If the environment has a
//! nonempty `DEBUG_INVOCATION` that does not start with '0' (systemd), all
//! categories except `assert` and `test` default to `debug`.
//!
//! The `SDL_LOGGING` hint grammar is supported: either a single priority name
//! for all categories ("debug"), or comma-separated `category=priority` pairs
//! ("app=info,video=debug,*=warn", "audio=quiet"). Names match ASCII
//! case-insensitively as prefixes, in table order, like SDL's `strncasecmp` with
//! the token length. Numbers are accepted: a category number, and priority 1..7
//! (0 or "quiet" disables). A `*` category sets every category not set earlier
//! in the same string and the default for custom categories.
//!
//! Thread safety: configuration (`set_*`, `reset_*`, `attach`) is not
//! synchronized; `log` only reads it. Configure before sharing the logger, or
//! guard it yourself. Output serialization is the `Output`'s job; the
//! provided stderr and std.log outputs lock internally.
const std = @import("std");
const Allocator = std.mem.Allocator;
const hints_mod = @import("hints.zig");
const Hints = hints_mod.Hints;

/// Message importance, in SDL's order (SDL_LogPriority without the invalid and
/// count sentinels).
pub const Priority = enum(u8) {
    trace = 1,
    verbose,
    debug,
    info,
    warn,
    err,
    critical,

    /// Upper-case name used by the hint grammar.
    pub fn name(self: Priority) []const u8 {
        return switch (self) {
            .trace => "TRACE",
            .verbose => "VERBOSE",
            .debug => "DEBUG",
            .info => "INFO",
            .warn => "WARN",
            .err => "ERROR",
            .critical => "CRITICAL",
        };
    }

    /// The nearest `std.log` level: trace/verbose/debug map to debug, and
    /// critical to err.
    pub fn std_level(self: Priority) std.log.Level {
        return switch (self) {
            .trace, .verbose, .debug => .debug,
            .info => .info,
            .warn => .warn,
            .err, .critical => .err,
        };
    }
};

/// The minimum priority a category accepts, or `off` (SDL's priority 0 /
/// "quiet", which SDL stores as SDL_LOG_PRIORITY_COUNT).
pub const Threshold = enum(u8) {
    trace = 1,
    verbose,
    debug,
    info,
    warn,
    err,
    critical,
    off,

    pub fn from_priority(priority: Priority) Threshold {
        return @fromBackingInt(@intCast(@backingInt(priority)));
    }

    /// True if a message of `priority` passes this threshold.
    pub fn allows(self: Threshold, priority: Priority) bool {
        return @backingInt(priority) >= @backingInt(self);
    }
};

/// A log category. The named values are SDL's built-in categories; ids 10..18
/// are reserved by SDL and `custom_start` (19) onward belong to applications:
/// use `Category.custom(n)`.
pub const Category = enum(u32) {
    application = 0,
    @"error",
    assert,
    system,
    audio,
    video,
    render,
    input,
    @"test",
    gpu,
    _,

    /// First application-defined category id (SDL_LOG_CATEGORY_CUSTOM).
    pub const custom_start: u32 = 19;

    /// The `n`th application category.
    pub fn custom(n: u32) Category {
        return @fromBackingInt(@intCast(custom_start + n));
    }

    /// Upper-case name for built-ins, "RESERVED" for ids below `custom_start`,
    /// "CUSTOM" otherwise (SDL's Android/OpenHarmony tag names).
    pub fn label(self: Category) []const u8 {
        return switch (self) {
            .application => "APP",
            .@"error" => "ERROR",
            .assert => "ASSERT",
            .system => "SYSTEM",
            .audio => "AUDIO",
            .video => "VIDEO",
            .render => "RENDER",
            .input => "INPUT",
            .@"test" => "TEST",
            .gpu => "GPU",
            _ => if (@backingInt(self) < custom_start) "RESERVED" else "CUSTOM",
        };
    }
};

const named_categories = 10;
const tracked_categories = Category.custom_start;

/// One message ready for output.
pub const Record = struct {
    category: Category,
    priority: Priority,
    /// Priority prefix such as "WARNING: " (empty for info and below by default).
    prefix: []const u8,
    /// Rendered text with one trailing "\n" or "\r\n" removed. Borrowed for the call.
    message: []const u8,
};

/// Where records go. Embed in your own struct and recover it with
/// `@fieldParentPtr`; an output must outlive the logger that uses it.
pub const Output = struct {
    write: *const fn (output: *Output, record: Record) void,
};

fn stderr_write(_: *Output, record: Record) void {
    std.debug.print("{s}{s}\n", .{ record.prefix, record.message });
}

var stderr_instance: Output = .{ .write = stderr_write };

/// SDL's default output: `prefix + message + "\n"` on stderr (serialized by
/// std's stderr lock). It carries no state, so sharing it between loggers is safe.
pub const stderr_output: *Output = &stderr_instance;

fn std_log_write(_: *Output, record: Record) void {
    const scoped = std.log.scoped(.zdl);
    const category = record.category.label();
    switch (record.priority.std_level()) {
        .debug => scoped.debug("{s}: {s}{s}", .{ category, record.prefix, record.message }),
        .info => scoped.info("{s}: {s}{s}", .{ category, record.prefix, record.message }),
        .warn => scoped.warn("{s}: {s}{s}", .{ category, record.prefix, record.message }),
        .err => scoped.err("{s}: {s}{s}", .{ category, record.prefix, record.message }),
    }
}

var std_log_instance: Output = .{ .write = std_log_write };

/// Forwards records to `std.log` with scope `.zdl` ("CATEGORY: message"), so
/// the program's `std.options.logFn` decides formatting and destination.
pub const std_log_output: *Output = &std_log_instance;

pub const Logger = struct {
    allocator: Allocator,
    /// Null drops every message (SDL_SetLogOutputFunction(NULL)).
    output: ?*Output = stderr_output,

    thresholds: [tracked_categories]?Threshold = @splat(null),
    default_threshold: Threshold = .err,
    custom_thresholds: std.ArrayList(CustomThreshold) = .empty,
    prefixes: [7]?[]u8 = @splat(null),

    /// Set by `attach`; used to re-read SDL_LOGGING.
    hints: ?*Hints = null,
    observer: hints_mod.Observer = .{ .on_change = on_logging_changed },

    const CustomThreshold = struct { category: Category, threshold: Threshold };

    /// A logger writing to stderr with SDL's default thresholds (no environment
    /// consulted, so no debug-invocation mode). Call `reset_from` for hint and
    /// environment handling.
    pub fn init(allocator: Allocator) Logger {
        var logger: Logger = .{ .allocator = allocator };
        logger.apply_defaults(false);
        return logger;
    }

    /// Detaches from any `Hints` and frees prefixes and custom thresholds.
    pub fn deinit(self: *Logger) void {
        self.detach();
        self.custom_thresholds.deinit(self.allocator);
        for (self.prefixes) |maybe| if (maybe) |text| self.allocator.free(text);
        self.* = undefined;
    }

    /// Registers for SDL_LOGGING changes: now, and whenever the hint changes,
    /// thresholds are rebuilt from it (SDL_InitLog's hint callback). The logger
    /// must not move while attached.
    pub fn attach(self: *Logger, hints: *Hints) hints_mod.Error!void {
        self.detach();
        self.hints = hints;
        errdefer self.hints = null;
        try hints.add_observer(hints_mod.names.logging, &self.observer);
    }

    /// Stops following the hint table.
    pub fn detach(self: *Logger) void {
        if (self.hints) |hints| hints.remove_observer(hints_mod.names.logging, &self.observer);
        self.hints = null;
    }

    fn on_logging_changed(observer: *hints_mod.Observer, _: []const u8, _: ?[]const u8, _: ?[]const u8) void {
        const self: *Logger = @fieldParentPtr("observer", observer);
        const hints = self.hints orelse return;
        self.reset_from(hints) catch {}; // out of memory keeps the previous thresholds
    }

    /// SDL_ResetLogPriorities with the hint and environment of `hints`.
    pub fn reset_from(self: *Logger, hints: *const Hints) Allocator.Error!void {
        const debug_env = if (hints.environ) |map| map.get("DEBUG_INVOCATION") else null;
        const debug_mode = debug_env != null and debug_env.?.len > 0 and debug_env.?[0] != '0';
        try self.reset(hints.get(hints_mod.names.logging), debug_mode);
    }

    /// SDL_ResetLogPriorities from explicit inputs: the SDL_LOGGING text (if any)
    /// and whether `DEBUG_INVOCATION` requests debug output.
    pub fn reset(self: *Logger, logging: ?[]const u8, debug_invocation: bool) Allocator.Error!void {
        self.custom_thresholds.clearRetainingCapacity();
        self.thresholds = @splat(null);
        var default: ?Threshold = null;
        if (logging) |text| try self.parse(text, &default);
        self.apply_defaults_with(default, debug_invocation);
    }

    fn apply_defaults(self: *Logger, debug_invocation: bool) void {
        self.apply_defaults_with(null, debug_invocation);
    }

    fn apply_defaults_with(self: *Logger, default: ?Threshold, debug_mode: bool) void {
        self.default_threshold = default orelse .err;
        for (&self.thresholds, 0..) |*slot, index| {
            if (slot.* != null) continue;
            const category: Category = @fromBackingInt(@intCast(index));
            slot.* = switch (category) {
                .application => if (debug_mode) .debug else .info,
                .assert => .warn,
                .@"test" => .verbose,
                else => if (debug_mode) .debug else .err,
            };
        }
    }

    /// SDL_SetLogPriorities: every category, built-in and custom, gets `priority`.
    pub fn set_all(self: *Logger, priority: Threshold) void {
        self.custom_thresholds.clearRetainingCapacity();
        self.default_threshold = priority;
        self.thresholds = @splat(priority);
    }

    /// SDL_SetLogPriority.
    pub fn set_threshold(self: *Logger, category: Category, level: Threshold) Allocator.Error!void {
        const index = @backingInt(category);
        if (index < tracked_categories) {
            self.thresholds[index] = level;
            return;
        }
        for (self.custom_thresholds.items) |*item| {
            if (item.category == category) {
                item.threshold = level;
                return;
            }
        }
        try self.custom_thresholds.append(self.allocator, .{ .category = category, .threshold = level });
    }

    /// SDL_GetLogPriority: the category's threshold, or the default for custom
    /// categories that were never set.
    pub fn threshold(self: *const Logger, category: Category) Threshold {
        const index = @backingInt(category);
        if (index < tracked_categories) return self.thresholds[index] orelse self.default_threshold;
        for (self.custom_thresholds.items) |item| {
            if (item.category == category) return item.threshold;
        }
        return self.default_threshold;
    }

    /// True if a message would be emitted (cheap pre-check for expensive arguments).
    pub fn enabled(self: *const Logger, category: Category, priority: Priority) bool {
        return self.output != null and self.threshold(category).allows(priority);
    }

    /// SDL_SetLogPriorityPrefix. A null or empty prefix removes it.
    pub fn set_prefix(self: *Logger, priority: Priority, text: ?[]const u8) Allocator.Error!void {
        const slot = &self.prefixes[@backingInt(priority) - 1];
        const copy = try self.allocator.dupe(u8, text orelse "");
        if (slot.*) |old| self.allocator.free(old);
        slot.* = copy;
    }

    /// The prefix output receives for a priority: a custom one, or SDL's default
    /// ("WARNING: " for warn, "ERROR: " for err and critical, otherwise empty).
    pub fn prefix(self: *const Logger, priority: Priority) []const u8 {
        if (self.prefixes[@backingInt(priority) - 1]) |custom| return custom;
        return switch (priority) {
            .warn => "WARNING: ",
            .err, .critical => "ERROR: ",
            else => "",
        };
    }

    /// SDL_LogMessage. The message is rendered only if it passes the category's
    /// threshold; a final newline is dropped. Messages that need more than 256
    /// bytes are rendered into allocated memory, and are dropped if allocation fails.
    pub fn log(self: *const Logger, category: Category, priority: Priority, comptime fmt: []const u8, args: anytype) void {
        const output = self.output orelse return;
        if (!self.threshold(category).allows(priority)) return;

        var stack: [256]u8 = undefined;
        var fixed = std.Io.Writer.fixed(&stack);
        if (fixed.print(fmt, args)) |_| {
            self.emit(output, category, priority, fixed.buffered());
        } else |_| {
            var allocating = std.Io.Writer.Allocating.init(self.allocator);
            defer allocating.deinit();
            allocating.writer.print(fmt, args) catch return;
            self.emit(output, category, priority, allocating.written());
        }
    }

    fn emit(self: *const Logger, output: *Output, category: Category, priority: Priority, text: []const u8) void {
        var message = text;
        if (std.mem.endsWith(u8, message, "\n")) {
            message = message[0 .. message.len - 1];
            if (std.mem.endsWith(u8, message, "\r")) message = message[0 .. message.len - 1];
        }
        output.write(output, .{ .category = category, .priority = priority, .prefix = self.prefix(priority), .message = message });
    }

    /// SDL_Log: application category, info priority.
    pub fn say(self: *const Logger, comptime fmt: []const u8, args: anytype) void {
        self.log(.application, .info, fmt, args);
    }
    pub fn trace(self: *const Logger, category: Category, comptime fmt: []const u8, args: anytype) void {
        self.log(category, .trace, fmt, args);
    }
    pub fn verbose(self: *const Logger, category: Category, comptime fmt: []const u8, args: anytype) void {
        self.log(category, .verbose, fmt, args);
    }
    pub fn debug(self: *const Logger, category: Category, comptime fmt: []const u8, args: anytype) void {
        self.log(category, .debug, fmt, args);
    }
    pub fn info(self: *const Logger, category: Category, comptime fmt: []const u8, args: anytype) void {
        self.log(category, .info, fmt, args);
    }
    pub fn warn(self: *const Logger, category: Category, comptime fmt: []const u8, args: anytype) void {
        self.log(category, .warn, fmt, args);
    }
    pub fn err(self: *const Logger, category: Category, comptime fmt: []const u8, args: anytype) void {
        self.log(category, .err, fmt, args);
    }
    pub fn critical(self: *const Logger, category: Category, comptime fmt: []const u8, args: anytype) void {
        self.log(category, .critical, fmt, args);
    }

    // SDL_LOGGING grammar ----------------------------------------------------

    /// Applies hint text to the (already cleared) tables. `default` receives the
    /// `*` setting. Mirrors ParseLogPriorities.
    fn parse(self: *Logger, text: []const u8, default: *?Threshold) Allocator.Error!void {
        if (std.mem.indexOfScalar(u8, text, '=') == null) {
            if (parse_threshold(text)) |all| {
                self.set_all(all);
                default.* = all;
            }
            return;
        }
        var rest: ?[]const u8 = text;
        while (rest) |pair_start| {
            const eq = std.mem.indexOfScalar(u8, pair_start, '=') orelse break;
            const key = pair_start[0..eq];
            const after = pair_start[eq + 1 ..];
            const comma = std.mem.indexOfScalar(u8, after, ',');
            const value = if (comma) |c| after[0..c] else after;
            rest = if (comma) |c| after[c + 1 ..] else null;

            const category = parse_category(key) orelse continue;
            const parsed = parse_threshold(value) orelse continue;
            switch (category) {
                .all => {
                    for (&self.thresholds) |*slot| {
                        if (slot.* == null) slot.* = parsed;
                    }
                    default.* = parsed;
                },
                .one => |one| try self.set_threshold(one, parsed),
            }
        }
    }
};

const ParsedCategory = union(enum) { all, one: Category };

fn parse_category(token: []const u8) ?ParsedCategory {
    if (token.len > 0 and std.ascii.isDigit(token[0])) {
        return .{ .one = @fromBackingInt(@intCast(parse_leading_u32(token))) };
    }
    if (token.len > 0 and token[0] == '*') return .all;
    var index: u32 = 0;
    while (index < named_categories) : (index += 1) {
        const category: Category = @fromBackingInt(@intCast(index));
        if (std.ascii.startsWithIgnoreCase(category_hint_name(category), token)) return .{ .one = category };
    }
    return null;
}

/// Names the grammar accepts; the same as `label` for built-ins.
fn category_hint_name(category: Category) []const u8 {
    return category.label();
}

fn parse_threshold(token: []const u8) ?Threshold {
    if (token.len > 0 and std.ascii.isDigit(token[0])) {
        const number = parse_leading_u32(token);
        if (number == 0) return .off;
        if (number <= @backingInt(Priority.critical)) return @fromBackingInt(@intCast(number));
        return null;
    }
    if (std.ascii.startsWithIgnoreCase("quiet", token)) return .off;
    for (std.enums.values(Priority)) |priority| {
        if (std.ascii.startsWithIgnoreCase(priority.name(), token)) return Threshold.from_priority(priority);
    }
    return null;
}

fn parse_leading_u32(token: []const u8) u32 {
    var value: u32 = 0;
    for (token) |byte| {
        if (!std.ascii.isDigit(byte)) break;
        value = std.math.mul(u32, value, 10) catch return std.math.maxInt(u32);
        value = std.math.add(u32, value, byte - '0') catch return std.math.maxInt(u32);
    }
    return value;
}

const testing = std.testing;

const Capture = struct {
    output: Output = .{ .write = write },
    count: u32 = 0,
    category: Category = .application,
    priority: Priority = .info,
    text: [512]u8 = undefined,
    text_len: usize = 0,
    prefix_text: [32]u8 = undefined,
    prefix_len: usize = 0,

    fn write(output: *Output, record: Record) void {
        const self: *Capture = @fieldParentPtr("output", output);
        self.count += 1;
        self.category = record.category;
        self.priority = record.priority;
        @memcpy(self.text[0..record.message.len], record.message);
        self.text_len = record.message.len;
        @memcpy(self.prefix_text[0..record.prefix.len], record.prefix);
        self.prefix_len = record.prefix.len;
    }
    fn message(self: *const Capture) []const u8 {
        return self.text[0..self.text_len];
    }
    fn prefix_value(self: *const Capture) []const u8 {
        return self.prefix_text[0..self.prefix_len];
    }
};

test "default thresholds follow SDL" {
    var logger = Logger.init(testing.allocator);
    defer logger.deinit();
    try testing.expectEqual(Threshold.info, logger.threshold(.application));
    try testing.expectEqual(Threshold.warn, logger.threshold(.assert));
    try testing.expectEqual(Threshold.verbose, logger.threshold(.@"test"));
    try testing.expectEqual(Threshold.err, logger.threshold(.video));
    try testing.expectEqual(Threshold.err, logger.threshold(Category.custom(3)));
    try logger.reset(null, true);
    try testing.expectEqual(Threshold.debug, logger.threshold(.application));
    try testing.expectEqual(Threshold.debug, logger.threshold(.audio));
    try testing.expectEqual(Threshold.warn, logger.threshold(.assert));
}

test "messages are filtered, prefixed and stripped" {
    var logger = Logger.init(testing.allocator);
    defer logger.deinit();
    var capture: Capture = .{};
    logger.output = &capture.output;

    logger.debug(.application, "hidden {d}", .{1});
    try testing.expectEqual(@as(u32, 0), capture.count);
    logger.info(.application, "hello {s}\r\n", .{"world"});
    try testing.expectEqual(@as(u32, 1), capture.count);
    try testing.expectEqualStrings("hello world", capture.message());
    try testing.expectEqualStrings("", capture.prefix_value());

    logger.warn(.video, "nope", .{}); // video accepts err and above
    try testing.expectEqual(@as(u32, 1), capture.count);
    logger.err(.video, "bad", .{});
    try testing.expectEqualStrings("ERROR: ", capture.prefix_value());
    logger.critical(.video, "worse", .{});
    try testing.expectEqualStrings("ERROR: ", capture.prefix_value());
    logger.warn(.assert, "w", .{});
    try testing.expectEqualStrings("WARNING: ", capture.prefix_value());

    try logger.set_prefix(.warn, "[w] ");
    logger.warn(.assert, "w", .{});
    try testing.expectEqualStrings("[w] ", capture.prefix_value());
    try logger.set_prefix(.warn, null);
    logger.warn(.assert, "w", .{});
    try testing.expectEqualStrings("", capture.prefix_value());

    logger.say("via say", .{});
    try testing.expectEqual(Category.application, capture.category);
    try testing.expectEqual(Priority.info, capture.priority);
    logger.output = null;
    const before = capture.count;
    logger.err(.application, "dropped", .{});
    try testing.expectEqual(before, capture.count);
}

test "long messages are rendered through the allocator" {
    var logger = Logger.init(testing.allocator);
    defer logger.deinit();
    const Big = struct {
        output: Output = .{ .write = write },
        length: usize = 0,
        fn write(output: *Output, record: Record) void {
            const self: *@This() = @fieldParentPtr("output", output);
            self.length = record.message.len;
        }
    };
    var big: Big = .{};
    logger.output = &big.output;
    const filler: [1000]u8 = @splat('x');
    logger.info(.application, "{s}\n", .{filler});
    try testing.expectEqual(@as(usize, 1000), big.length);
}

test "custom categories and set_all" {
    var logger = Logger.init(testing.allocator);
    defer logger.deinit();
    const mine = Category.custom(2);
    try logger.set_threshold(mine, .trace);
    try logger.set_threshold(mine, .debug);
    try testing.expectEqual(Threshold.debug, logger.threshold(mine));
    try testing.expectEqual(@as(usize, 1), logger.custom_thresholds.items.len);
    try testing.expect(logger.enabled(mine, .debug));
    try testing.expect(!logger.enabled(mine, .verbose));
    logger.set_all(.critical);
    try testing.expectEqual(Threshold.critical, logger.threshold(mine));
    try testing.expectEqual(Threshold.critical, logger.threshold(.application));
    logger.set_all(.off);
    try testing.expect(!logger.enabled(.application, .critical));
}

test "SDL_LOGGING grammar" {
    var logger = Logger.init(testing.allocator);
    defer logger.deinit();

    try logger.reset("debug", false);
    try testing.expectEqual(Threshold.debug, logger.threshold(.gpu));
    try testing.expectEqual(Threshold.debug, logger.threshold(Category.custom(0)));

    try logger.reset("app=trace,vid=2,audio=quiet,*=warn", false);
    try testing.expectEqual(Threshold.trace, logger.threshold(.application));
    try testing.expectEqual(Threshold.verbose, logger.threshold(.video));
    try testing.expectEqual(Threshold.off, logger.threshold(.audio));
    try testing.expectEqual(Threshold.warn, logger.threshold(.gpu));
    try testing.expectEqual(Threshold.warn, logger.threshold(Category.custom(1)));

    // Numeric custom category, priority zero disables, unknown names are ignored.
    try logger.reset("21=0,bogus=info,render=nonsense,input=crit", false);
    try testing.expectEqual(Threshold.off, logger.threshold(@fromBackingInt(@intCast(21))));
    try testing.expectEqual(Threshold.critical, logger.threshold(.input));
    try testing.expectEqual(Threshold.err, logger.threshold(.render));

    // Invalid whole-string priority leaves defaults alone.
    try logger.reset("loud", false);
    try testing.expectEqual(Threshold.info, logger.threshold(.application));
    try logger.reset("9", false);
    try testing.expectEqual(Threshold.err, logger.threshold(.system));
}

test "attach follows the SDL_LOGGING hint" {
    var env = std.process.Environ.Map.init(testing.allocator);
    defer env.deinit();
    var hints = Hints.init(testing.allocator, &env);
    defer hints.deinit();
    var logger = Logger.init(testing.allocator);
    defer logger.deinit();

    try logger.attach(&hints);
    try testing.expectEqual(Threshold.info, logger.threshold(.application));
    _ = try hints.set(hints_mod.names.logging, "app=error");
    try testing.expectEqual(Threshold.err, logger.threshold(.application));
    _ = try hints.reset(hints_mod.names.logging);
    try testing.expectEqual(Threshold.info, logger.threshold(.application));

    try env.put("DEBUG_INVOCATION", "1");
    try logger.reset_from(&hints);
    try testing.expectEqual(Threshold.debug, logger.threshold(.application));

    logger.detach();
    _ = try hints.set(hints_mod.names.logging, "app=critical");
    try testing.expectEqual(Threshold.debug, logger.threshold(.application));
}

test "priority and category helpers" {
    try testing.expectEqual(std.log.Level.debug, Priority.verbose.std_level());
    try testing.expectEqual(std.log.Level.err, Priority.critical.std_level());
    try testing.expectEqualStrings("APP", Category.application.label());
    try testing.expectEqualStrings("RESERVED", (@as(Category, @fromBackingInt(@intCast(12)))).label());
    try testing.expectEqualStrings("CUSTOM", Category.custom(0).label());
}
