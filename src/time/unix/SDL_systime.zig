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
pub const __clockid_t = c_int;
pub const __syscall_slong_t = c_long;
pub const clockid_t = __clockid_t;
pub const time_t = __time_t;
pub const struct_timespec = extern struct {
    tv_sec: __time_t = 0,
    tv_nsec: __syscall_slong_t = 0,
};
pub const struct_tm = extern struct {
    tm_sec: c_int = 0,
    tm_min: c_int = 0,
    tm_hour: c_int = 0,
    tm_mday: c_int = 0,
    tm_mon: c_int = 0,
    tm_year: c_int = 0,
    tm_wday: c_int = 0,
    tm_yday: c_int = 0,
    tm_isdst: c_int = 0,
    tm_gmtoff: c_long = 0,
    tm_zone: [*c]const u8 = null,
};
pub const Sint8 = i8;
pub const Uint8 = u8;
pub const Sint16 = i16;
pub const Uint16 = u16;
pub const Sint32 = i32;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub const Uint64 = u64;
pub const SDL_Time = Sint64;
comptime {
    if (!(@sizeOf(bool) == @as(c_ulong, 1))) @compileError("static assertion failed \"sizeof(bool) == 1\"");
}
comptime {
    if (!(@sizeOf(Uint8) == @as(c_ulong, 1))) @compileError("static assertion failed \"sizeof(Uint8) == 1\"");
}
comptime {
    if (!(@sizeOf(Sint8) == @as(c_ulong, 1))) @compileError("static assertion failed \"sizeof(Sint8) == 1\"");
}
comptime {
    if (!(@sizeOf(Uint16) == @as(c_ulong, 2))) @compileError("static assertion failed \"sizeof(Uint16) == 2\"");
}
comptime {
    if (!(@sizeOf(Sint16) == @as(c_ulong, 2))) @compileError("static assertion failed \"sizeof(Sint16) == 2\"");
}
comptime {
    if (!(@sizeOf(Uint32) == @as(c_ulong, 4))) @compileError("static assertion failed \"sizeof(Uint32) == 4\"");
}
comptime {
    if (!(@sizeOf(Sint32) == @as(c_ulong, 4))) @compileError("static assertion failed \"sizeof(Sint32) == 4\"");
}
comptime {
    if (!(@sizeOf(Uint64) == @as(c_ulong, 8))) @compileError("static assertion failed \"sizeof(Uint64) == 8\"");
}
comptime {
    if (!(@sizeOf(Sint64) == @as(c_ulong, 8))) @compileError("static assertion failed \"sizeof(Sint64) == 8\"");
}
comptime {
    if (!(@sizeOf(Uint64) <= @sizeOf(c_ulonglong))) @compileError("static assertion failed \"sizeof(Uint64) <= sizeof(unsigned long long)\"");
}
comptime {
    if (!(@sizeOf(usize) <= @sizeOf(c_ulonglong))) @compileError("static assertion failed \"sizeof(size_t) <= sizeof(unsigned long long)\"");
}
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const struct_SDL_DateTime = extern struct {
    year: c_int = 0,
    month: c_int = 0,
    day: c_int = 0,
    hour: c_int = 0,
    minute: c_int = 0,
    second: c_int = 0,
    nanosecond: c_int = 0,
    day_of_week: c_int = 0,
    utc_offset: c_int = 0,
};
pub const SDL_DateTime = struct_SDL_DateTime;
pub const SDL_DATE_FORMAT_YYYYMMDD: c_int = 0;
pub const SDL_DATE_FORMAT_DDMMYYYY: c_int = 1;
pub const SDL_DATE_FORMAT_MMDDYYYY: c_int = 2;
pub const enum_SDL_DateFormat = c_uint;
pub const SDL_DateFormat = enum_SDL_DateFormat;
pub const SDL_TIME_FORMAT_24HR: c_int = 0;
pub const SDL_TIME_FORMAT_12HR: c_int = 1;
pub const enum_SDL_TimeFormat = c_uint;
pub const SDL_TimeFormat = enum_SDL_TimeFormat;
pub extern fn __errno_location() [*c]c_int;
pub const nl_item = c_int;
pub const D_FMT: c_int = 131113;
pub const T_FMT: c_int = 131114;
pub extern fn nl_langinfo(__item: nl_item) [*c]u8;
pub extern fn gmtime_r(noalias __timer: [*c]const time_t, noalias __tp: [*c]struct_tm) [*c]struct_tm;
pub extern fn localtime_r(noalias __timer: [*c]const time_t, noalias __tp: [*c]struct_tm) [*c]struct_tm;
pub extern fn clock_gettime(__clock_id: clockid_t, __tp: [*c]struct_timespec) c_int;
pub extern fn truncate(__file: [*c]const u8, __length: __off_t) c_int;
pub export fn SDL_GetSystemTimeLocalePreferences(df: [*c]SDL_DateFormat, tf: [*c]SDL_TimeFormat) void {
    @setEvalBranchQuota(100000);
    var s: [*c]const u8 = undefined;
    _ = &s;
    var s_1: [*c]const u8 = undefined;
    _ = &s_1;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (df != null) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                if (tf != null) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            2 => {
                s = nl_langinfo(D_FMT);
                if (s != null) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            3 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            5 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            6 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            8 => {
                if (@as(c_int, s.*) != 0) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
            },
            9 => {
                switch (@as(c_int, (blk: {
                    const ref = &s;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*)) {
                    @as(c_int, 'Y') => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(c_int, 'y') => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(c_int, 'F') => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(c_int, 'C') => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(c_int, 'd') => {
                        sdl_pc = 16;
                        continue;
                    },
                    @as(c_int, 'e') => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(c_int, 'b') => {
                        sdl_pc = 18;
                        continue;
                    },
                    @as(c_int, 'D') => {
                        sdl_pc = 19;
                        continue;
                    },
                    @as(c_int, 'h') => {
                        sdl_pc = 20;
                        continue;
                    },
                    @as(c_int, 'm') => {
                        sdl_pc = 21;
                        continue;
                    },
                    else => {
                        sdl_pc = 22;
                        continue;
                    },
                }
            },
            10 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            11 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            14 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                df.* = SDL_DATE_FORMAT_YYYYMMDD;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            16 => {
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            17 => {
                df.* = SDL_DATE_FORMAT_DDMMYYYY;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            18 => {
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            19 => {
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            20 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            21 => {
                df.* = SDL_DATE_FORMAT_MMDDYYYY;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            22 => {
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            23 => {
                s_1 = nl_langinfo(T_FMT);
                if (s_1 != null) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            24 => {
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            25 => {
                {}
            },
            26 => {
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            27 => {
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            28 => {
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            29 => {
                if (@as(c_int, s_1.*) != 0) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            30 => {
                switch (@as(c_int, (blk: {
                    const ref = &s_1;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*)) {
                    @as(c_int, 'H') => {
                        sdl_pc = 33;
                        continue;
                    },
                    @as(c_int, 'k') => {
                        sdl_pc = 34;
                        continue;
                    },
                    @as(c_int, 'T') => {
                        sdl_pc = 35;
                        continue;
                    },
                    @as(c_int, 'I') => {
                        sdl_pc = 36;
                        continue;
                    },
                    @as(c_int, 'l') => {
                        sdl_pc = 37;
                        continue;
                    },
                    @as(c_int, 'r') => {
                        sdl_pc = 38;
                        continue;
                    },
                    else => {
                        sdl_pc = 39;
                        continue;
                    },
                }
            },
            31 => {
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            32 => {
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            33 => {
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            34 => {
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            35 => {
                tf.* = SDL_TIME_FORMAT_24HR;
                return;
            },
            36 => {
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            37 => {
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            38 => {
                tf.* = SDL_TIME_FORMAT_12HR;
                return;
            },
            39 => {
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_GetCurrentTime_REAL(ticks: [*c]SDL_Time) bool {
    @setEvalBranchQuota(100000);
    if (!(ticks != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("ticks"))));
    }
    var tp: struct_timespec = undefined;
    _ = &tp;
    if (clock_gettime(CLOCK_REALTIME, &tp) == @as(c_int, 0)) {
        ticks.* = @bitCast(@as(c_ulong, @truncate((@as(c_ulonglong, @as(Uint64, @bitCast(@as(c_long, tp.tv_sec)))) *% @as(c_ulonglong, SDL_NS_PER_SECOND)) +% @as(c_ulonglong, @bitCast(@as(c_longlong, tp.tv_nsec))))));
        return @"true" != 0;
    }
    _ = SDL_SetError_REAL("Failed to retrieve system time (%i)", __errno_location().*);
    return @"false" != 0;
}
pub export fn SDL_TimeToDateTime_REAL(arg_ticks: SDL_Time, dt: [*c]SDL_DateTime, localTime: bool) bool {
    @setEvalBranchQuota(100000);
    var ticks = arg_ticks;
    _ = &ticks;
    var tm_storage: struct_tm = undefined;
    _ = &tm_storage;
    var tm_1: [*c]struct_tm = null;
    _ = &tm_1;
    if (!(dt != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("dt"))));
    }
    var rem_ns: c_int = @truncate(__helpers.signedRemainder(@as(c_longlong, ticks), SDL_NS_PER_SECOND));
    _ = &rem_ns;
    if (rem_ns < @as(c_int, 0)) {
        {
            const ref = &ticks;
            ref.* = @truncate(@as(c_longlong, ref.*) - SDL_NS_PER_SECOND);
        }
        {
            const ref = &rem_ns;
            ref.* = @truncate(@as(c_longlong, ref.*) + SDL_NS_PER_SECOND);
        }
    }
    const tval: time_t = @truncate(@divTrunc(@as(c_longlong, ticks), SDL_NS_PER_SECOND));
    _ = &tval;
    if (localTime) {
        tm_1 = localtime_r(&tval, &tm_storage);
    } else {
        tm_1 = gmtime_r(&tval, &tm_storage);
    }
    if (tm_1 != null) {
        dt.*.year = tm_1.*.tm_year + @as(c_int, 1900);
        dt.*.month = tm_1.*.tm_mon + @as(c_int, 1);
        dt.*.day = tm_1.*.tm_mday;
        dt.*.hour = tm_1.*.tm_hour;
        dt.*.minute = tm_1.*.tm_min;
        dt.*.second = tm_1.*.tm_sec;
        dt.*.nanosecond = rem_ns;
        dt.*.day_of_week = tm_1.*.tm_wday;
        dt.*.utc_offset = @truncate(tm_1.*.tm_gmtoff);
        return @"true" != 0;
    }
    return SDL_SetError_REAL("SDL_DateTime conversion failed (%i)", __errno_location().*);
}

pub const SDL_GetCurrentTime = SDL_GetCurrentTime_REAL;
pub const SDL_TimeToDateTime = SDL_TimeToDateTime_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_NS_PER_SECOND = @as(c_longlong, 1000000000);
pub const CLOCK_REALTIME = @as(c_int, 0);
