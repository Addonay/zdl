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
// SDL implementation ported to Zig; generated scaffolding removed.
pub const __helpers = @import("std").zig.c_translation.helpers;
pub const __off_t = c_long;
pub const __time_t = c_long;
pub const __suseconds_t = c_long;
pub const __clockid_t = c_int;
pub const __syscall_slong_t = c_long;
pub const clockid_t = __clockid_t;
pub const struct_timeval = extern struct {
    tv_sec: __time_t = 0,
    tv_usec: __suseconds_t = 0,
};
pub const struct_timespec = extern struct {
    tv_sec: __time_t = 0,
    tv_nsec: __syscall_slong_t = 0,
};
pub const Uint64 = u64;
pub extern fn gettimeofday(noalias __tv: [*c]struct_timeval, noalias __tz: ?*anyopaque) c_int;
pub extern fn truncate(__file: [*c]const u8, __length: __off_t) c_int;
pub extern fn __errno_location() [*c]c_int;
pub extern fn nanosleep(__requested_time: [*c]const struct_timespec, __remaining: [*c]struct_timespec) c_int;
pub extern fn clock_gettime(__clock_id: clockid_t, __tp: [*c]struct_timespec) c_int;
pub var checked_monotonic_time: bool = @"false" != 0;
pub var has_monotonic_time: bool = @"false" != 0;
pub fn CheckMonotonicTime() callconv(.c) void {
    @setEvalBranchQuota(100000);
    var value: struct_timespec = undefined;
    _ = &value;
    if (clock_gettime(CLOCK_MONOTONIC_RAW, &value) == @as(c_int, 0)) {
        has_monotonic_time = @"true" != 0;
    }
    checked_monotonic_time = @"true" != 0;
}
pub export fn SDL_GetPerformanceCounter_REAL() Uint64 {
    @setEvalBranchQuota(100000);
    var ticks: Uint64 = undefined;
    _ = &ticks;
    if (!checked_monotonic_time) {
        CheckMonotonicTime();
    }
    if (has_monotonic_time) {
        var now: struct_timespec = undefined;
        _ = &now;
        _ = clock_gettime(CLOCK_MONOTONIC_RAW, &now);
        ticks = @bitCast(@as(c_long, now.tv_sec));
        {
            const ref = &ticks;
            ref.* = @truncate(@as(c_ulonglong, ref.*) *% @as(c_ulonglong, SDL_NS_PER_SECOND));
        }
        ticks +%= @bitCast(@as(c_long, now.tv_nsec));
    } else {
        var now: struct_timeval = undefined;
        _ = &now;
        _ = gettimeofday(&now, null);
        ticks = @bitCast(@as(c_long, now.tv_sec));
        ticks *%= SDL_US_PER_SECOND;
        ticks +%= @bitCast(@as(c_long, now.tv_usec));
    }
    return ticks;
}
pub export fn SDL_GetPerformanceFrequency_REAL() Uint64 {
    @setEvalBranchQuota(100000);
    if (!checked_monotonic_time) {
        CheckMonotonicTime();
    }
    if (has_monotonic_time) {
        return SDL_NS_PER_SECOND;
    }
    return SDL_US_PER_SECOND;
}
pub export fn SDL_SYS_DelayNS(ns: Uint64) void {
    @setEvalBranchQuota(100000);
    var was_error: c_int = undefined;
    _ = &was_error;
    var tv: struct_timespec = undefined;
    _ = &tv;
    var remaining: struct_timespec = undefined;
    _ = &remaining;
    remaining.tv_sec = @bitCast(@as(c_ulong, @truncate(@as(c_ulonglong, ns) / @as(c_ulonglong, SDL_NS_PER_SECOND))));
    remaining.tv_nsec = @bitCast(@as(c_ulong, @truncate(@as(c_ulonglong, ns) % @as(c_ulonglong, SDL_NS_PER_SECOND))));
    while (true) {
        __errno_location().* = 0;
        tv.tv_sec = remaining.tv_sec;
        tv.tv_nsec = remaining.tv_nsec;
        was_error = nanosleep(&tv, &remaining);
        if (!((was_error != 0) and (__errno_location().* == EINTR))) break;
    }
}

pub const SDL_GetPerformanceCounter = SDL_GetPerformanceCounter_REAL;
pub const SDL_GetPerformanceFrequency = SDL_GetPerformanceFrequency_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_US_PER_SECOND = __helpers.promoteIntLiteral(c_int, 1000000, .decimal);
pub const SDL_NS_PER_SECOND = @as(c_longlong, 1000000000);
pub const EINTR = @as(c_int, 4);
pub const CLOCK_MONOTONIC_RAW = @as(c_int, 4);
