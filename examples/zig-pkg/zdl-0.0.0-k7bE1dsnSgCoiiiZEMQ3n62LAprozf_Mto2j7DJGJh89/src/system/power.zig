//! Battery and AC power state from Linux sysfs and legacy procfs, as SDL_power.c
//! and src/power/linux/SDL_syspower.c. Altered native port:
//!
//! - Sources are tried in SDL's order: sysfs `/sys/class/power_supply`, then
//!   `/proc/acpi` (battery and AC adapter), then `/proc/apm`. The first source that
//!   can be read gives the answer, even when it reports no battery.
//! - SDL tries UPower over D-Bus before these files. That source lives in
//!   `upower.zig` (it needs libdbus and libc); call `upower.query` first and
//!   fall back to `query` here to reproduce SDL's order.
//! - Paths are explicit in `Sources`, so tests and sandboxes can point the reader at
//!   fixture trees. Nothing is cached and no global state exists.
//! - Files are read into caller-independent fixed buffers; no allocation occurs.
const std = @import("std");

/// Power source state. `unknown` means a source was readable but did not
/// describe the battery; `no_battery` means the system is plugged in without one.
pub const State = enum {
    unknown,
    on_battery,
    no_battery,
    charging,
    charged,
};

/// Power information. `seconds` is the estimated time remaining on battery and
/// `percent` the charge level; both are null when the source does not report them.
pub const Info = struct {
    state: State,
    /// Estimated seconds until empty, or null when unknown or not discharging.
    seconds: ?u32 = null,
    /// Charge in percent, clamped to 0 through 100, or null when unknown.
    percent: ?u8 = null,
};

/// Filesystem locations consulted. Override them for fixture trees.
pub const Sources = struct {
    sys_class_power_supply: []const u8 = "/sys/class/power_supply",
    proc_acpi_battery: []const u8 = "/proc/acpi/battery",
    proc_acpi_ac_adapter: []const u8 = "/proc/acpi/ac_adapter",
    proc_apm: []const u8 = "/proc/apm",
};

/// Queries the first readable power source. When no source is readable the
/// answer is `state = .unknown` with no estimates, as SDL reports.
pub fn query(io: std.Io, sources: Sources) Info {
    if (query_sys_class_power_supply(io, sources.sys_class_power_supply)) |info| return info;
    if (query_proc_acpi(io, sources.proc_acpi_battery, sources.proc_acpi_ac_adapter)) |info| return info;
    if (query_proc_apm(io, sources.proc_apm)) |info| return info;
    return .{ .state = .unknown };
}

/// Sentinel used internally to mirror SDL's `-1` "unknown" integers exactly. The
/// selection rules compare these values, so they keep SDL's ordering semantics.
const unknown: i64 = -1;

/// Chooses the battery to report: prefer the one with the most seconds remaining;
/// with no estimates at all, prefer the highest percent. Mirrors SDL's rule that
/// a battery with a known time always beats one without it.
fn is_better(secs: i64, pct: i64, best_secs: i64, best_pct: i64) bool {
    if (secs < 0 and best_secs < 0) {
        if (pct < 0 and best_pct < 0) return true;
        return pct > best_pct;
    }
    return secs > best_secs;
}

fn clamp_percent(value: i64) i64 {
    return std.math.clamp(value, 0, 100);
}

/// Reads one sysfs attribute `base/node/key` into `buffer` and returns the
/// content with trailing whitespace removed. Null when the file is absent.
fn read_attribute(io: std.Io, base: []const u8, node: []const u8, key: []const u8, buffer: []u8) ?[]const u8 {
    var path_buffer: [512]u8 = undefined;
    const path = std.fmt.bufPrint(&path_buffer, "{s}/{s}/{s}", .{ base, node, key }) catch return null;
    const text = std.Io.Dir.cwd().readFile(io, path, buffer) catch return null;
    return std.mem.trimEnd(u8, text, " \t\r\n");
}

/// C-style `atoi`: optional leading whitespace and sign, then decimal digits.
/// Garbage after the digits is ignored and no digits yields 0, as SDL uses it.
fn atoi(text: []const u8) i64 {
    var index: usize = 0;
    while (index < text.len and std.ascii.isWhitespace(text[index])) index += 1;
    var negative = false;
    if (index < text.len and (text[index] == '+' or text[index] == '-')) {
        negative = text[index] == '-';
        index += 1;
    }
    var value: i64 = 0;
    while (index < text.len and std.ascii.isDigit(text[index])) : (index += 1) {
        value = value *| 10 +| (text[index] - '0');
    }
    return if (negative) -value else value;
}

/// SDL's `strtol` use in the ACPI parsers: parses an optional sign and digits in
/// `base` and returns the value with the unconsumed tail. Null when no digits
/// are present.
const Parsed = struct { value: i64, rest: []const u8 };

fn strtol(text: []const u8, base: u8) ?Parsed {
    var index: usize = 0;
    var negative = false;
    if (index < text.len and (text[index] == '+' or text[index] == '-')) {
        negative = text[index] == '-';
        index += 1;
    }
    const start = index;
    var value: i64 = 0;
    while (index < text.len) : (index += 1) {
        const digit = std.fmt.charToDigit(text[index], base) catch break;
        value = value *| base +| digit;
    }
    if (index == start) return null;
    return .{ .value = if (negative) -value else value, .rest = text[index..] };
}

/// ACPI key/value lines: `key: value` per line with spaces padding both sides.
/// Iterates the content and yields pairs; a line without a colon ends the list
/// as in SDL (`make_proc_acpi_key_val` returns false at unexpected EOF).
const KeyValueIterator = struct {
    rest: []const u8,

    const Pair = struct { key: []const u8, value: []const u8 };

    fn next(self: *KeyValueIterator) ?Pair {
        var text = std.mem.trimStart(u8, self.rest, " ");
        if (text.len == 0) return null;
        const colon = std.mem.indexOfScalar(u8, text, ':') orelse return null;
        const key = text[0..colon];
        text = std.mem.trimStart(u8, text[colon + 1 ..], " ");
        if (text.len == 0) return null;
        const line_end = std.mem.indexOfScalar(u8, text, '\n') orelse text.len;
        const value = text[0..line_end];
        self.rest = if (line_end < text.len) text[line_end + 1 ..] else text[text.len..];
        return .{ .key = key, .value = value };
    }
};

/// Sysfs `power_supply` class: each subdirectory is a supply. Batteries whose
/// `scope` is `Device` (peripheral batteries) are skipped. Returns null when
/// the class directory cannot be opened.
pub fn query_sys_class_power_supply(io: std.Io, base: []const u8) ?Info {
    var dir = std.Io.Dir.cwd().openDir(io, base, .{ .iterate = true }) catch return null;
    defer dir.close(io);

    var state: State = .no_battery;
    var best_secs: i64 = unknown;
    var best_pct: i64 = unknown;
    var buffer: [64]u8 = undefined;

    var iterator = dir.iterate();
    while (iterator.next(io) catch return null) |entry| {
        const node = entry.name;
        if (std.mem.eql(u8, node, ".") or std.mem.eql(u8, node, "..")) continue;

        const kind = read_attribute(io, base, node, "type", &buffer) orelse continue;
        if (!std.ascii.eqlIgnoreCase(kind, "Battery")) continue;

        if (read_attribute(io, base, node, "scope", &buffer)) |scope| {
            if (std.ascii.eqlIgnoreCase(scope, "Device")) continue;
        }

        // Absent `present` attributes count as present, as some drivers omit them.
        const st: State = if (read_attribute(io, base, node, "present", &buffer)) |present|
            if (std.mem.eql(u8, present, "0")) .no_battery else status_state(io, base, node, &buffer)
        else
            status_state(io, base, node, &buffer);

        const pct: i64 = if (read_attribute(io, base, node, "capacity", &buffer)) |capacity|
            @min(atoi(capacity), 100) // SDL clamps only the upper bound here.
        else
            unknown;

        var secs: i64 = unknown;
        if (read_attribute(io, base, node, "time_to_empty_now", &buffer)) |tte| {
            const value = atoi(tte);
            secs = if (value <= 0) unknown else value;
        } else if (st == .on_battery) {
            // Energy in watt-hours over power in watts gives hours; scaling to
            // seconds yields the estimate. Missing or zero power means unknown.
            const energy = if (read_attribute(io, base, node, "energy_now", &buffer)) |text| atoi(text) else unknown;
            const power = if (read_attribute(io, base, node, "power_now", &buffer)) |text| atoi(text) else unknown;
            secs = if (energy >= 0 and power > 0) @divTrunc(3600 * energy, power) else unknown;
        }

        if (is_better(secs, pct, best_secs, best_pct)) {
            best_secs = secs;
            best_pct = pct;
            state = st;
        }
    }

    return .{
        .state = state,
        .seconds = if (best_secs < 0) null else @intCast(@min(best_secs, std.math.maxInt(u32))),
        .percent = if (best_pct < 0) null else @intCast(best_pct),
    };
}

fn status_state(io: std.Io, base: []const u8, node: []const u8, buffer: []u8) State {
    const status = read_attribute(io, base, node, "status", buffer) orelse return .unknown;
    if (std.ascii.eqlIgnoreCase(status, "Charging")) return .charging;
    if (std.ascii.eqlIgnoreCase(status, "Discharging")) return .on_battery;
    if (std.ascii.eqlIgnoreCase(status, "Full") or std.ascii.eqlIgnoreCase(status, "Not charging")) return .charged;
    return .unknown;
}

/// Legacy `/proc/acpi/battery/*/{state,info}` and `/proc/acpi/ac_adapter/*/state`.
/// Returns null when either directory cannot be opened, so the caller can try
/// the next source. Battery selection follows SDL's ordering rules.
pub fn query_proc_acpi(io: std.Io, battery_base: []const u8, ac_base: []const u8) ?Info {
    var have_battery = false;
    var have_ac = false;
    var charging = false;
    var best_secs: i64 = unknown;
    var best_pct: i64 = unknown;

    {
        var dir = std.Io.Dir.cwd().openDir(io, battery_base, .{ .iterate = true }) catch return null;
        defer dir.close(io);
        var iterator = dir.iterate();
        while (iterator.next(io) catch null) |entry| {
            var state_buffer: [1024]u8 = undefined;
            var info_buffer: [1024]u8 = undefined;
            const state_text = read_attribute(io, battery_base, entry.name, "state", &state_buffer) orelse continue;
            const info_text = read_attribute(io, battery_base, entry.name, "info", &info_buffer) orelse continue;

            var charge = false;
            var remaining: i64 = unknown;
            var maximum: i64 = unknown;
            var state_pairs: KeyValueIterator = .{ .rest = state_text };
            while (state_pairs.next()) |pair| {
                if (std.ascii.eqlIgnoreCase(pair.key, "present")) {
                    if (std.ascii.eqlIgnoreCase(pair.value, "yes")) have_battery = true;
                } else if (std.ascii.eqlIgnoreCase(pair.key, "charging state")) {
                    // SDL treats both "charging" and "charging/discharging" as charging.
                    if (std.ascii.eqlIgnoreCase(pair.value, "charging/discharging") or
                        std.ascii.eqlIgnoreCase(pair.value, "charging")) charge = true;
                } else if (std.ascii.eqlIgnoreCase(pair.key, "remaining capacity")) {
                    // A value is only taken when a space follows the number (e.g. "4000 mWh").
                    if (strtol(pair.value, 10)) |parsed| {
                        if (parsed.rest.len > 0 and parsed.rest[0] == ' ') remaining = parsed.value;
                    }
                }
            }
            var info_pairs: KeyValueIterator = .{ .rest = info_text };
            while (info_pairs.next()) |pair| {
                if (std.ascii.eqlIgnoreCase(pair.key, "design capacity")) {
                    if (strtol(pair.value, 10)) |parsed| {
                        if (parsed.rest.len > 0 and parsed.rest[0] == ' ') maximum = parsed.value;
                    }
                }
            }

            var pct: i64 = unknown;
            if (maximum >= 0 and remaining >= 0) {
                // SDL computes the ratio in single precision then truncates; the
                // float division keeps the same rounding for typical capacities.
                const ratio = @as(f32, @floatFromInt(remaining)) / @as(f32, @floatFromInt(maximum));
                pct = clamp_percent(@intFromFloat(ratio * 100.0));
            }
            const secs: i64 = unknown; // SDL does not compute remaining time here.
            if (is_better(secs, pct, best_secs, best_pct)) {
                best_secs = secs;
                best_pct = pct;
                charging = charge;
            }
        }
    }

    {
        var dir = std.Io.Dir.cwd().openDir(io, ac_base, .{ .iterate = true }) catch return null;
        defer dir.close(io);
        var iterator = dir.iterate();
        while (iterator.next(io) catch null) |entry| {
            var buffer: [256]u8 = undefined;
            const text = read_attribute(io, ac_base, entry.name, "state", &buffer) orelse continue;
            var pairs: KeyValueIterator = .{ .rest = text };
            while (pairs.next()) |pair| {
                if (std.ascii.eqlIgnoreCase(pair.key, "state") and
                    std.ascii.eqlIgnoreCase(pair.value, "on-line")) have_ac = true;
            }
        }
    }

    const state: State = if (!have_battery)
        .no_battery
    else if (charging)
        .charging
    else if (have_ac)
        .charged
    else
        .on_battery;

    return .{
        .state = state,
        .percent = if (best_pct < 0) null else @intCast(best_pct),
    };
}

/// Legacy `/proc/apm` (APM emulation, Linux 2.6 format). Fields are
/// space-separated: driver, BIOS, flags, AC status, battery status, battery flag,
/// percent (may end in '%'), time, and time units (`min` multiplies by 60).
/// Returns null when the file is absent or malformed, so the caller can stop.
pub fn query_proc_apm(io: std.Io, path: []const u8) ?Info {
    var buffer: [128]u8 = undefined;
    const text = std.Io.Dir.cwd().readFile(io, path, &buffer) catch return null;
    var fields = Fields{ .rest = text };

    _ = fields.next() orelse return null; // driver version
    _ = fields.next() orelse return null; // BIOS version
    _ = fields.next() orelse return null; // APM flags

    const ac_status = int_field(fields.next() orelse return null) orelse return null;
    const battery_status = int_field(fields.next() orelse return null) orelse return null;
    _ = battery_status; // present for format compatibility; SDL does not use it.
    const battery_flag = int_field(fields.next() orelse return null) orelse return null;

    var percent_text = fields.next() orelse return null;
    if (percent_text.len > 0 and percent_text[percent_text.len - 1] == '%') {
        percent_text = percent_text[0 .. percent_text.len - 1];
    }
    const battery_percent = int_field(percent_text) orelse return null;

    var battery_time = int_field(fields.next() orelse return null) orelse return null;
    const units = fields.next() orelse return null;
    if (std.ascii.eqlIgnoreCase(units, "min")) battery_time *= 60;

    var info: Info = .{ .state = .unknown };
    if (battery_flag == 0xFF) {
        info.state = .unknown;
    } else if (battery_flag & (1 << 7) != 0) {
        info.state = .no_battery;
    } else if (battery_flag & (1 << 3) != 0) {
        info.state = .charging;
    } else if (ac_status == 1) {
        info.state = .charged;
    } else {
        info.state = .on_battery;
    }

    // Details (percent, time) are reported only when a battery is present or on AC.
    switch (info.state) {
        .charging, .charged, .on_battery => {
            if (battery_percent >= 0) info.percent = @intCast(@min(battery_percent, 100));
            if (battery_time >= 0) info.seconds = @intCast(@min(battery_time, std.math.maxInt(u32)));
        },
        else => {},
    }
    return info;
}

/// Whitespace-separated fields of `/proc/apm`. Consecutive spaces and a trailing
/// newline are ignored, matching SDL's `next_string`.
const Fields = struct {
    rest: []const u8,

    fn next(self: *Fields) ?[]const u8 {
        const text = std.mem.trimStart(u8, self.rest, " ");
        if (text.len == 0) return null;
        const end = std.mem.indexOfAny(u8, text, " \n") orelse text.len;
        self.rest = text[end..];
        if (self.rest.len > 0) self.rest = self.rest[1..];
        return text[0..end];
    }
};

/// Parses an APM integer with C `strtol` base 0 rules (decimal, `0x` hex, or
/// leading-zero octal). The whole field must be consumed, as SDL requires.
fn int_field(text: []const u8) ?i64 {
    if (text.len == 0) return null;
    var body = text;
    var negative = false;
    if (body[0] == '+' or body[0] == '-') {
        negative = body[0] == '-';
        body = body[1..];
    }
    var base: u8 = 10;
    if (body.len > 2 and body[0] == '0' and (body[1] == 'x' or body[1] == 'X')) {
        base = 16;
        body = body[2..];
    } else if (body.len > 1 and body[0] == '0') {
        base = 8;
        body = body[1..];
    }
    if (body.len == 0) return null;
    var value: i64 = 0;
    for (body) |c| {
        const digit = std.fmt.charToDigit(c, base) catch return null;
        value = value *| base +| digit;
    }
    return if (negative) -value else value;
}
