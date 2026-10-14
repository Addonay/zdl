//! Gregorian calendar arithmetic and checked Unix-nanosecond conversions.
//! Use `std.Io.Clock` for reading clocks, sleeping and deadlines. This module
//! handles civil dates, including years before 1970 and signed Gregorian years
//! that `std.time.epoch`'s unsigned epoch decomposition cannot represent.
const std = @import("std");

/// Months reuse std's enum, so invalid numeric months cannot enter a date.
pub const Month = std.time.epoch.Month;
/// ISO weekday names; Sunday is zero to match calendar lookup conventions.
pub const Weekday = enum(u3) { sunday, monday, tuesday, wednesday, thursday, friday, saturday };
/// Date validation and representation failures are explicit Zig errors.
pub const DateError = error{ InvalidDay, OutOfRange };
/// Invalid time components are rejected before arithmetic is performed.
pub const TimeError = DateError || error{ InvalidHour, InvalidMinute, InvalidSecond, InvalidNanosecond };

/// A proleptic Gregorian date. Year zero exists and denotes 1 BCE.
/// Days are one-based; `validate` rejects zero and impossible month days.
pub const Date = struct {
    year: i32,
    month: Month,
    day: u5,

    /// Rejects dates such as February 30 instead of normalizing them silently.
    pub fn validate(self: Date) DateError!void {
        if (self.day == 0 or self.day > days_in_month(self.year, self.month)) return error.InvalidDay;
    }

    /// Days relative to 1970-01-01. The calculation shifts January/February
    /// into the previous March-based year, then counts complete 400-year eras.
    /// Floor division is essential for years below zero.
    pub fn days_since_epoch(self: Date) DateError!i64 {
        try self.validate();
        const month: i64 = @backingInt(self.month);
        const year = @as(i64, self.year) - @intFromBool(month <= 2);
        const era = @divFloor(year, 400);
        const year_of_era = year - era * 400;
        const shifted_month = month + (if (month > 2) @as(i64, -3) else 9);
        const day_of_year = @divTrunc(153 * shifted_month + 2, 5) + self.day - 1;
        const day_of_era = year_of_era * 365 + @divTrunc(year_of_era, 4) - @divTrunc(year_of_era, 100) + day_of_year;
        return era * 146097 + day_of_era - 719468;
    }

    /// Reverses days_since_epoch. Widened intermediates avoid overflow even
    /// when the supplied day count is at an i64 limit; the year is checked.
    pub fn from_days(days: i64) DateError!Date {
        const shifted = @as(i128, days) + 719468;
        const era = @divFloor(shifted, 146097);
        const day_of_era = shifted - era * 146097;
        const year_of_era = @divTrunc(day_of_era - @divTrunc(day_of_era, 1460) + @divTrunc(day_of_era, 36524) - @divTrunc(day_of_era, 146096), 365);
        const day_of_year = day_of_era - (365 * year_of_era + @divTrunc(year_of_era, 4) - @divTrunc(year_of_era, 100));
        const shifted_month = @divTrunc(5 * day_of_year + 2, 153);
        const day = day_of_year - @divTrunc(153 * shifted_month + 2, 5) + 1;
        const month = shifted_month + (if (shifted_month < 10) @as(i128, 3) else -9);
        const year = year_of_era + era * 400 + @intFromBool(month <= 2);
        return .{
            .year = std.math.cast(i32, year) orelse return error.OutOfRange,
            .month = @fromBackingInt(@intCast(@as(u4, @intCast(month)))),
            .day = @intCast(day),
        };
    }

    /// Computes the weekday instead of storing a redundant, potentially
    /// inconsistent weekday field in every date-time value.
    pub fn weekday(self: Date) DateError!Weekday {
        return @fromBackingInt(@intCast(@as(u3, @intCast(@mod(try self.days_since_epoch() + 4, 7)))));
    }

    /// Zero-based day within the year: January 1 is zero, December 31 is
    /// either 364 or 365. Leap-day validity follows normal date validation.
    pub fn year_day(self: Date) DateError!u9 {
        const january: Date = .{ .year = self.year, .month = .jan, .day = 1 };
        return @intCast(try self.days_since_epoch() - try january.days_since_epoch());
    }
};

/// True for Gregorian leap years, including signed and century years.
pub fn is_leap_year(year: i32) bool {
    return @rem(year, 4) == 0 and (@rem(year, 100) != 0 or @rem(year, 400) == 0);
}

/// Number of valid days in a typed month. An enum removes invalid-month paths.
pub fn days_in_month(year: i32, month: Month) u5 {
    const lengths = [_]u5{ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
    return lengths[@backingInt(month) - 1] + @intFromBool(month == .feb and is_leap_year(year));
}

/// A civil time with an explicit offset east of UTC, measured in seconds.
/// Narrow component types encode their storage range; validate enforces the
/// calendar range. No locale, global timezone or implicit OS lookup is involved.
pub const DateTime = struct {
    date: Date,
    hour: u5 = 0,
    minute: u6 = 0,
    second: u6 = 0,
    nanosecond: u30 = 0,
    utc_offset_seconds: i32 = 0,

    /// Allows second 60 to preserve SDL's leap-second input convention. A Unix
    /// timestamp represents it as the following second; leap tables are absent.
    pub fn validate(self: DateTime) TimeError!void {
        try self.date.validate();
        if (self.hour > 23) return error.InvalidHour;
        if (self.minute > 59) return error.InvalidMinute;
        if (self.second > 60) return error.InvalidSecond;
        if (self.nanosecond >= std.time.ns_per_s) return error.InvalidNanosecond;
    }

    /// Nanoseconds since 1970-01-01T00:00:00Z. All intermediate arithmetic uses
    /// i128, and only the final representation is checked. There is no silent
    /// clamping and no needless loss of dates near the i64 boundaries.
    pub fn to_timestamp(self: DateTime) TimeError!i64 {
        try self.validate();
        const seconds = @as(i128, try self.date.days_since_epoch()) * 86_400 +
            @as(i128, self.hour) * 3600 + @as(i128, self.minute) * 60 + self.second - self.utc_offset_seconds;
        const nanoseconds = seconds * std.time.ns_per_s + self.nanosecond;
        return std.math.cast(i64, nanoseconds) orelse error.OutOfRange;
    }

    /// Splits a timestamp in the chosen UTC offset. Floor division ensures
    /// that negative sub-second timestamps produce the preceding civil second
    /// and a positive nanosecond remainder, rather than an invalid negative one.
    pub fn from_timestamp(nanoseconds: i64, utc_offset_seconds: i32) TimeError!DateTime {
        const seconds = @divFloor(nanoseconds, std.time.ns_per_s) + @as(i64, utc_offset_seconds);
        const within_day = @mod(seconds, 86_400);
        return .{
            .date = try Date.from_days(@divFloor(seconds, 86_400)),
            .hour = @intCast(@divTrunc(within_day, 3600)),
            .minute = @intCast(@divTrunc(@mod(within_day, 3600), 60)),
            .second = @intCast(@mod(within_day, 60)),
            .nanosecond = @intCast(@mod(nanoseconds, std.time.ns_per_s)),
            .utc_offset_seconds = utc_offset_seconds,
        };
    }
};

/// Converts Unix nanoseconds into 100-nanosecond Windows file-time ticks.
/// Sub-tick fractions truncate towards zero, matching the original conversion.
/// This is a numeric conversion only; it introduces no Windows dependency.
pub fn to_windows_time(nanoseconds: i64) u64 {
    return @intCast(@divTrunc(nanoseconds, 100) + 116444736000000000);
}

/// Converts Windows file-time ticks without clamping. Values outside the
/// nanosecond timestamp's representable range return OutOfRange.
pub fn from_windows_time(ticks: u64) error{OutOfRange}!i64 {
    const nanoseconds = (@as(i128, ticks) - 116444736000000000) * 100;
    return std.math.cast(i64, nanoseconds) orelse error.OutOfRange;
}
