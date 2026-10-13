//! Gregorian calendar calculations, based on Howard Hinnant's public-domain algorithms.
const std = @import("std");

pub const Date = struct { year: i32, month: u8, day: u8 };
pub const CivilDays = struct { days: i64, weekday: u3, year_day: u16 };
pub const DateError = error{ InvalidMonth, InvalidDay };

pub fn isLeapYear(year: i32) bool {
    return @rem(year, 4) == 0 and (@rem(year, 100) != 0 or @rem(year, 400) == 0);
}

pub fn daysInMonth(year: i32, month: u8) DateError!u6 {
    const lengths = [_]u6{ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
    if (month < 1 or month > 12) return error.InvalidMonth;
    return lengths[month - 1] + @intFromBool(month == 2 and isLeapYear(year));
}

pub fn validate(date: Date) DateError!void {
    const length = try daysInMonth(date.year, date.month);
    if (date.day < 1 or date.day > length) return error.InvalidDay;
}

pub fn civilDays(date: Date) CivilDays {
    const year = @as(i64, date.year) - @intFromBool(date.month <= 2);
    const era = @divFloor(year, 400);
    const year_of_era = year - era * 400;
    const month = @as(i64, date.month) + (if (date.month > 2) @as(i64, -3) else 9);
    const march_day = @divTrunc(153 * month + 2, 5) + date.day - 1;
    const era_day = year_of_era * 365 + @divTrunc(year_of_era, 4) - @divTrunc(year_of_era, 100) + march_day;
    const days = era * 146097 + era_day - 719468;
    const year_day = if (march_day > 305) march_day - 306 else march_day + 59 + @intFromBool(@rem(year, 4) == 0 and (@rem(year, 100) != 0 or @rem(year, 400) == 0));
    return .{ .days = days, .weekday = @intCast(@mod(days + 4, 7)), .year_day = @intCast(year_day) };
}

const windows_epoch: i64 = 116444736000000000;
pub fn toWindowsTime(nanoseconds: i64) u64 {
    return @intCast(@divTrunc(nanoseconds, 100) + windows_epoch);
}
pub fn fromWindowsTime(ticks: u64) i64 {
    const minimum: u64 = @intCast(@divTrunc(std.math.minInt(i64), 100) + windows_epoch);
    const maximum: u64 = @intCast(@divTrunc(std.math.maxInt(i64), 100) + windows_epoch);
    const clamped = @max(minimum, @min(maximum, ticks));
    return (@as(i64, @intCast(clamped)) - windows_epoch) * 100;
}

pub const DateTime = extern struct {
    year: i32,
    month: i32,
    day: i32,
    hour: i32,
    minute: i32,
    second: i32,
    nanosecond: i32,
    weekday: i32,
    utc_offset: i32,
};
pub const TimeError = DateError || error{ InvalidHour, InvalidMinute, InvalidSecond, InvalidNanosecond, OutOfRange };
pub const Timestamp = struct { nanoseconds: i64, clamped: bool };

pub fn validateTime(time: DateTime) TimeError!void {
    if (time.month < 1 or time.month > 12) return error.InvalidMonth;
    if (time.day < 1 or time.day > try daysInMonth(time.year, @intCast(time.month))) return error.InvalidDay;
    if (time.hour < 0 or time.hour > 23) return error.InvalidHour;
    if (time.minute < 0 or time.minute > 59) return error.InvalidMinute;
    if (time.second < 0 or time.second > 60) return error.InvalidSecond;
    if (time.nanosecond < 0 or time.nanosecond >= 1_000_000_000) return error.InvalidNanosecond;
}

pub fn timestampClamped(time: DateTime) TimeError!Timestamp {
    try validateTime(time);
    const days = civilDays(.{ .year = time.year, .month = @intCast(time.month), .day = @intCast(time.day) }).days;
    const seconds = days * 86_400 + @as(i64, time.hour) * 3600 + @as(i64, time.minute) * 60 + time.second - time.utc_offset;
    const minimum = @divTrunc(std.math.minInt(i64), 1_000_000_000) + 1;
    const maximum = @divTrunc(std.math.maxInt(i64), 1_000_000_000) - 1;
    const clamped = @max(minimum, @min(maximum, seconds));
    return .{ .nanoseconds = clamped * 1_000_000_000 + time.nanosecond, .clamped = seconds != clamped };
}

pub fn timestamp(time: DateTime) TimeError!i64 {
    const result = try timestampClamped(time);
    if (result.clamped) return error.OutOfRange;
    return result.nanoseconds;
}
