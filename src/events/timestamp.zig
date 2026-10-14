//! The timestamp type and clock conversions shared by event producers.
//!
//! `Timestamp` is an unsigned nanosecond count in the host monotonic clock
//! domain (`std.Io.Clock.awake`, which maps to CLOCK_MONOTONIC on Linux). It is
//! not wall time and has no calendar epoch. Values from device or protocol
//! clocks must be rebased before they are used as event timestamps.
const std = @import("std");

/// Nanoseconds in the host monotonic clock domain.
pub const Timestamp = u64;

/// Reads the shared monotonic clock. Event timestamps are kept nonzero so that
/// `0` remains the event model's unset value.
pub fn now_ns(io: std.Io) Timestamp {
    return @max(1, @as(Timestamp, @intCast(std.Io.Clock.awake.now(io).nanoseconds)));
}

/// Converts normalized POSIX timeval fields to nanoseconds, or null when the
/// subsecond field is invalid or the result cannot fit in `Timestamp`.
pub fn from_timeval(seconds: u64, microseconds: u64) ?Timestamp {
    if (microseconds >= std.time.us_per_s) return null;
    const whole = std.math.mul(u64, seconds, std.time.ns_per_s) catch return null;
    const fraction = microseconds * std.time.ns_per_us;
    return std.math.add(u64, whole, fraction) catch null;
}

/// Converts a source clock with a stable rate but an unrelated epoch (for
/// example the default CLOCK_REALTIME timestamps in Linux input_event records)
/// into the host monotonic domain. The first sample is anchored to `now_ns`;
/// later samples preserve their spacing. Future results adjust the offset back
/// to `now_ns`, matching SDL's evdev timestamp policy.
pub const SourceClock = struct {
    offset_ns: ?i128 = null,

    /// Rebases `source_ns` into the monotonic domain. `now` must itself come
    /// from CLOCK_MONOTONIC / `std.Io.Clock.awake`.
    pub fn rebase(self: *SourceClock, source_ns: Timestamp, now: Timestamp) Timestamp {
        const source: i128 = @intCast(source_ns);
        const current: i128 = @intCast(@max(now, 1));
        var offset = self.offset_ns orelse current - source;
        var mapped = source + offset;
        if (mapped > current) {
            offset -= mapped - current;
            mapped = current;
        }
        self.offset_ns = offset;
        return @intCast(@max(mapped, 1));
    }
};

test "timeval conversion is checked and uses nanoseconds" {
    try std.testing.expectEqual(@as(?Timestamp, 3_004_005_000), from_timeval(3, 4_005));
    try std.testing.expectEqual(@as(?Timestamp, null), from_timeval(3, 1_000_000));
    try std.testing.expectEqual(@as(?Timestamp, null), from_timeval(std.math.maxInt(u64), 0));
}

test "source clock rebasing preserves spacing and clamps future samples" {
    var clock: SourceClock = .{};
    try std.testing.expectEqual(@as(Timestamp, 5_000), clock.rebase(900_000_000, 5_000));
    try std.testing.expectEqual(@as(Timestamp, 5_250), clock.rebase(900_000_250, 5_500));
    try std.testing.expectEqual(@as(Timestamp, 5_500), clock.rebase(900_001_000, 5_500));
    try std.testing.expectEqual(@as(Timestamp, 5_750), clock.rebase(900_001_250, 6_000));
}
