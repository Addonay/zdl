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
pub const struct_timespec = extern struct {
    tv_sec: __time_t = 0,
    tv_nsec: __syscall_slong_t = 0,
};
const struct_unnamed_1 = extern struct {
    __low: c_uint = 0,
    __high: c_uint = 0,
};
pub const __atomic_wide_counter = extern union {
    __value64: c_ulonglong,
    __value32: struct_unnamed_1,
};
pub const struct___pthread_internal_list = extern struct {
    __prev: [*c]struct___pthread_internal_list = null,
    __next: [*c]struct___pthread_internal_list = null,
};
pub const __pthread_list_t = struct___pthread_internal_list;
pub const struct___pthread_mutex_s = extern struct {
    __lock: c_int = 0,
    __count: c_uint = 0,
    __owner: c_int = 0,
    __nusers: c_uint = 0,
    __kind: c_int = 0,
    __spins: c_short = 0,
    __glibc_reserved: c_short = 0,
    __list: __pthread_list_t = @import("std").mem.zeroes(__pthread_list_t),
};
pub const struct___pthread_cond_s = extern struct {
    __wseq: __atomic_wide_counter = @import("std").mem.zeroes(__atomic_wide_counter),
    __g1_start: __atomic_wide_counter = @import("std").mem.zeroes(__atomic_wide_counter),
    __g_size: [2]c_uint = @import("std").mem.zeroes([2]c_uint),
    __g1_orig_size: c_uint = 0,
    __wrefs: c_uint = 0,
    __g_signals: [2]c_uint = @import("std").mem.zeroes([2]c_uint),
    __unused_initialized_1: c_uint = 0,
    __unused_initialized_2: c_uint = 0,
};
pub const pthread_condattr_t = extern union {
    __size: [4]u8,
    __align: c_int,
};
pub const pthread_mutex_t = extern union {
    __data: struct___pthread_mutex_s,
    __size: [40]u8,
    __align: c_long,
};
pub const pthread_cond_t = extern union {
    __data: struct___pthread_cond_s,
    __size: [48]u8,
    __align: c_longlong,
};
pub const Sint64 = i64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const struct_SDL_Mutex = extern struct {
    id: pthread_mutex_t = @import("std").mem.zeroes(pthread_mutex_t),
};
pub const SDL_Mutex = struct_SDL_Mutex;
pub const struct_SDL_Condition = extern struct {
    cond: pthread_cond_t = @import("std").mem.zeroes(pthread_cond_t),
};
pub const SDL_Condition = struct_SDL_Condition;
pub extern fn clock_gettime(__clock_id: clockid_t, __tp: [*c]struct_timespec) c_int;
pub extern fn truncate(__file: [*c]const u8, __length: __off_t) c_int;
pub extern fn pthread_cond_init(noalias __cond: [*c]pthread_cond_t, noalias __cond_attr: [*c]const pthread_condattr_t) c_int;
pub extern fn pthread_cond_destroy(__cond: [*c]pthread_cond_t) c_int;
pub extern fn pthread_cond_signal(__cond: [*c]pthread_cond_t) c_int;
pub extern fn pthread_cond_broadcast(__cond: [*c]pthread_cond_t) c_int;
pub extern fn pthread_cond_wait(noalias __cond: [*c]pthread_cond_t, noalias __mutex: [*c]pthread_mutex_t) c_int;
pub extern fn pthread_cond_timedwait(noalias __cond: [*c]pthread_cond_t, noalias __mutex: [*c]pthread_mutex_t, noalias __abstime: [*c]const struct_timespec) c_int;
pub export fn SDL_CreateCondition_REAL() [*c]SDL_Condition {
    @setEvalBranchQuota(100000);
    var cond: [*c]SDL_Condition = undefined;
    _ = &cond;
    cond = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(SDL_Condition))));
    if (cond != null) {
        if (pthread_cond_init(&cond.*.cond, null) != @as(c_int, 0)) {
            _ = SDL_SetError_REAL("pthread_cond_init() failed");
            SDL_free_REAL(@ptrCast(@alignCast(cond)));
            cond = null;
        }
    }
    return cond;
}
pub export fn SDL_DestroyCondition_REAL(cond: [*c]SDL_Condition) void {
    @setEvalBranchQuota(100000);
    if (cond != null) {
        _ = pthread_cond_destroy(&cond.*.cond);
        SDL_free_REAL(@ptrCast(@alignCast(cond)));
    }
}
pub export fn SDL_SignalCondition_REAL(cond: [*c]SDL_Condition) void {
    @setEvalBranchQuota(100000);
    if (!(cond != null)) {
        return;
    }
    _ = pthread_cond_signal(&cond.*.cond);
}
pub export fn SDL_BroadcastCondition_REAL(cond: [*c]SDL_Condition) void {
    @setEvalBranchQuota(100000);
    if (!(cond != null)) {
        return;
    }
    _ = pthread_cond_broadcast(&cond.*.cond);
}
pub export fn SDL_WaitConditionTimeoutNS(cond: [*c]SDL_Condition, mutex: [*c]SDL_Mutex, timeoutNS: Sint64) bool {
    @setEvalBranchQuota(100000);
    var abstime: struct_timespec = undefined;
    _ = &abstime;
    var result: bool = undefined;
    _ = &result;
    var rc: c_int = undefined;
    _ = &rc;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (!(cond != null) or !(mutex != null)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                rc = pthread_cond_timedwait(&cond.*.cond, &mutex.*.id, &abstime);
                switch (rc) {
                    EINTR => {
                        sdl_pc = 12;
                        continue;
                    },
                    ETIMEDOUT => {
                        sdl_pc = 13;
                        continue;
                    },
                    else => {
                        sdl_pc = 14;
                        continue;
                    },
                }
            },
            2 => {
                return @"true" != 0;
            },
            3 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                if (timeoutNS < @as(Sint64, 0)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                return pthread_cond_wait(&cond.*.cond, &mutex.*.id) == @as(c_int, 0);
            },
            6 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                _ = clock_gettime(CLOCK_REALTIME, &abstime);
                {
                    const ref = &abstime.tv_sec;
                    ref.* = @truncate(@as(c_longlong, ref.*) + @divTrunc(@as(c_longlong, timeoutNS), SDL_NS_PER_SECOND));
                }
                {
                    const ref = &abstime.tv_nsec;
                    ref.* = @truncate(@as(c_longlong, ref.*) + __helpers.signedRemainder(@as(c_longlong, timeoutNS), SDL_NS_PER_SECOND));
                }
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            8 => {
                if (abstime.tv_nsec >= @as(__syscall_slong_t, 1000000000)) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
            },
            9 => {
                abstime.tv_sec += 1;
                abstime.tv_nsec -= 1000000000;
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            10 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            11 => {
                return result;
            },
            12 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            13 => {
                result = @"false" != 0;
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            14 => {
                result = @"true" != 0;
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}

pub const SDL_BroadcastCondition = SDL_BroadcastCondition_REAL;
pub const SDL_CreateCondition = SDL_CreateCondition_REAL;
pub const SDL_DestroyCondition = SDL_DestroyCondition_REAL;
pub const SDL_SignalCondition = SDL_SignalCondition_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_NS_PER_SECOND = @as(c_longlong, 1000000000);
pub const CLOCK_REALTIME = @as(c_int, 0);
pub const EINTR = @as(c_int, 4);
pub const ETIMEDOUT = @as(c_int, 110);
