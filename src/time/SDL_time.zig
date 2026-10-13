// /*
//   Simple DirectMedia Layer
//   Copyright (C) 1997-2026 Sam Lantinga <slouken@libsdl.org>
//
//   This software is provided 'as-is', without any express or implied
//   warranty.  In no event will the authors be held liable for any damages
//   arising from the use of this software.
//
//   Permission is granted to anyone to use this software for any purpose,
//   including commercial applications, and to alter it and redistribute it
//   freely, subject to the following restrictions:
//
//   1. The origin of this software must not be misrepresented; you must not
//      claim that you wrote the original software. If you use this software
//      in a product, an acknowledgment in the product documentation would be
//      appreciated but is not required.
//   2. Altered source versions must be plainly marked as such, and must not be
//      misrepresented as being the original software.
//   3. This notice may not be removed or altered from any source distribution.
// */
// Native calendar implementation with SDL ABI adapters.
const calendar = @import("calendar");
pub const SDL_DateTime = calendar.DateTime;
pub const SDL_Time = i64;
extern fn SDL_SetError_REAL(format: [*:0]const u8, ...) bool;
extern fn SDL_GetSystemTimeLocalePreferences(date: ?*c_uint, time: ?*c_uint) void;

pub export fn SDL_CivilToDays(year: c_int, month: c_int, day: c_int, weekday: ?*c_int, year_day: ?*c_int) i64 {
    const result = calendar.civilDays(.{ .year = year, .month = @intCast(month), .day = @intCast(day) });
    if (weekday) |output| output.* = result.weekday;
    if (year_day) |output| output.* = result.year_day;
    return result.days;
}
pub export fn SDL_GetDateTimeLocalePreferences_REAL(date: ?*c_uint, time: ?*c_uint) bool {
    if (date) |output| output.* = 0;
    if (time) |output| output.* = 0;
    SDL_GetSystemTimeLocalePreferences(date, time);
    return true;
}
pub export fn SDL_GetDaysInMonth_REAL(year: c_int, month: c_int) c_int {
    if (month < 1 or month > 12) {
        _ = SDL_SetError_REAL("Month out of range [1-12], requested: %i", month);
        return -1;
    }
    return calendar.daysInMonth(year, @intCast(month)) catch unreachable;
}
fn checkedDate(year: c_int, month: c_int, day: c_int) ?calendar.Date {
    const length = SDL_GetDaysInMonth_REAL(year, month);
    if (length < 0) return null;
    if (day < 1 or day > length) {
        // Preserve SDL's existing error-text argument, which reports month.
        _ = SDL_SetError_REAL("Day out of range [1-%i], requested: %i", length, month);
        return null;
    }
    return .{ .year = year, .month = @intCast(month), .day = @intCast(day) };
}
pub export fn SDL_GetDayOfYear_REAL(year: c_int, month: c_int, day: c_int) c_int {
    return calendar.civilDays(checkedDate(year, month, day) orelse return -1).year_day;
}
pub export fn SDL_GetDayOfWeek_REAL(year: c_int, month: c_int, day: c_int) c_int {
    return calendar.civilDays(checkedDate(year, month, day) orelse return -1).weekday;
}
pub export fn SDL_DateTimeToTime_REAL(date: ?*const SDL_DateTime, output: ?*i64) bool {
    const time = date orelse return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*:0]const u8, "dt"));
    const ticks = output orelse return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*:0]const u8, "ticks"));
    const result = calendar.timestampClamped(time.*) catch |err| {
        return switch (err) {
            error.InvalidMonth => SDL_SetError_REAL("Malformed SDL_DateTime: month out of range [1-12], current: %i", time.month),
            error.InvalidDay => SDL_SetError_REAL("Malformed SDL_DateTime: day of month out of range [1-%i], current: %i", SDL_GetDaysInMonth_REAL(time.year, time.month), time.month),
            error.InvalidHour => SDL_SetError_REAL("Malformed SDL_DateTime: hour out of range [0-23], current: %i", time.hour),
            error.InvalidMinute => SDL_SetError_REAL("Malformed SDL_DateTime: minute out of range [0-59], current: %i", time.minute),
            error.InvalidSecond => SDL_SetError_REAL("Malformed SDL_DateTime: second out of range [0-60], current: %i", time.second),
            error.InvalidNanosecond => SDL_SetError_REAL("Malformed SDL_DateTime: nanosecond out of range [0-999999999], current: %i", time.nanosecond),
            error.OutOfRange => unreachable,
        };
    };
    ticks.* = result.nanoseconds;
    if (result.clamped) return SDL_SetError_REAL("Date out of range for SDL_Time representation; SDL_Time value clamped");
    return true;
}
pub export fn SDL_TimeToWindows_REAL(time: i64, low: ?*u32, high: ?*u32) void {
    const ticks = calendar.toWindowsTime(time);
    if (low) |output| output.* = @truncate(ticks);
    if (high) |output| output.* = @intCast(ticks >> 32);
}
pub export fn SDL_TimeFromWindows_REAL(low: u32, high: u32) i64 {
    return calendar.fromWindowsTime((@as(u64, high) << 32) | low);
}

pub const SDL_GetDateTimeLocalePreferences = SDL_GetDateTimeLocalePreferences_REAL;
pub const SDL_GetDaysInMonth = SDL_GetDaysInMonth_REAL;
pub const SDL_GetDayOfYear = SDL_GetDayOfYear_REAL;
pub const SDL_GetDayOfWeek = SDL_GetDayOfWeek_REAL;
pub const SDL_DateTimeToTime = SDL_DateTimeToTime_REAL;
pub const SDL_TimeToWindows = SDL_TimeToWindows_REAL;
pub const SDL_TimeFromWindows = SDL_TimeFromWindows_REAL;
