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
pub const __time_t = c_long;
pub const __clockid_t = c_int;
pub const __syscall_slong_t = c_long;
pub const clockid_t = __clockid_t;
pub const struct_timespec = extern struct {
    tv_sec: __time_t = 0,
    tv_nsec: __syscall_slong_t = 0,
};
pub const Uint32 = u32;
pub const Sint64 = i64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const struct_SDL_Semaphore = extern struct {
    sem: sem_t = @import("std").mem.zeroes(sem_t),
};
pub const SDL_Semaphore = struct_SDL_Semaphore;
pub extern fn __errno_location() [*c]c_int;
pub extern fn clock_gettime(__clock_id: clockid_t, __tp: [*c]struct_timespec) c_int;
pub const sem_t = extern union {
    __size: [32]u8,
    __align: c_long,
};
pub extern fn sem_init(__sem: [*c]sem_t, __pshared: c_int, __value: c_uint) c_int;
pub extern fn sem_destroy(__sem: [*c]sem_t) c_int;
pub extern fn sem_wait(__sem: [*c]sem_t) c_int;
pub extern fn sem_timedwait(noalias __sem: [*c]sem_t, noalias __abstime: [*c]const struct_timespec) c_int;
pub extern fn sem_trywait(__sem: [*c]sem_t) c_int;
pub extern fn sem_post(__sem: [*c]sem_t) c_int;
pub extern fn sem_getvalue(noalias __sem: [*c]sem_t, noalias __sval: [*c]c_int) c_int;
pub export fn SDL_CreateSemaphore_REAL(initial_value: Uint32) [*c]SDL_Semaphore {
    @setEvalBranchQuota(100000);
    var sem: [*c]SDL_Semaphore = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(SDL_Semaphore))));
    _ = &sem;
    if (sem != null) {
        if (sem_init(&sem.*.sem, 0, initial_value) < @as(c_int, 0)) {
            _ = SDL_SetError_REAL("sem_init() failed");
            SDL_free_REAL(@ptrCast(@alignCast(sem)));
            sem = null;
        }
    }
    return sem;
}
pub export fn SDL_DestroySemaphore_REAL(sem: [*c]SDL_Semaphore) void {
    @setEvalBranchQuota(100000);
    if (sem != null) {
        _ = sem_destroy(&sem.*.sem);
        SDL_free_REAL(@ptrCast(@alignCast(sem)));
    }
}
pub export fn SDL_WaitSemaphoreTimeoutNS(sem: [*c]SDL_Semaphore, timeoutNS: Sint64) bool {
    @setEvalBranchQuota(100000);
    var ts_timeout: struct_timespec = undefined;
    _ = &ts_timeout;
    if (!(sem != null)) {
        return @"true" != 0;
    }
    if (timeoutNS == @as(Sint64, 0)) {
        return sem_trywait(&sem.*.sem) == @as(c_int, 0);
    }
    if (timeoutNS < @as(Sint64, 0)) {
        var rc: c_int = undefined;
        _ = &rc;
        while (true) {
            rc = sem_wait(&sem.*.sem);
            if (!((rc < @as(c_int, 0)) and (__errno_location().* == EINTR))) break;
        }
        return rc == @as(c_int, 0);
    }
    _ = clock_gettime(CLOCK_REALTIME, &ts_timeout);
    {
        const ref = &ts_timeout.tv_sec;
        ref.* = @truncate(@as(c_longlong, ref.*) + @divTrunc(@as(c_longlong, timeoutNS), SDL_NS_PER_SECOND));
    }
    {
        const ref = &ts_timeout.tv_nsec;
        ref.* = @truncate(@as(c_longlong, ref.*) + __helpers.signedRemainder(@as(c_longlong, timeoutNS), SDL_NS_PER_SECOND));
    }
    while (ts_timeout.tv_nsec >= @as(__syscall_slong_t, 1000000000)) {
        ts_timeout.tv_sec += 1;
        ts_timeout.tv_nsec -= 1000000000;
    }
    var rc: c_int = undefined;
    _ = &rc;
    while (true) {
        rc = sem_timedwait(&sem.*.sem, &ts_timeout);
        if (!((rc < @as(c_int, 0)) and (__errno_location().* == EINTR))) break;
    }
    return rc == @as(c_int, 0);
}
pub export fn SDL_GetSemaphoreValue_REAL(sem: [*c]SDL_Semaphore) Uint32 {
    @setEvalBranchQuota(100000);
    var ret: c_int = 0;
    _ = &ret;
    if (!(sem != null)) {
        return 0;
    }
    _ = sem_getvalue(&sem.*.sem, &ret);
    if (ret < @as(c_int, 0)) {
        ret = 0;
    }
    return @bitCast(@as(c_int, ret));
}
pub export fn SDL_SignalSemaphore_REAL(sem: [*c]SDL_Semaphore) void {
    @setEvalBranchQuota(100000);
    if (!(sem != null)) {
        return;
    }
    _ = sem_post(&sem.*.sem);
}

pub const SDL_CreateSemaphore = SDL_CreateSemaphore_REAL;
pub const SDL_DestroySemaphore = SDL_DestroySemaphore_REAL;
pub const SDL_GetSemaphoreValue = SDL_GetSemaphoreValue_REAL;
pub const SDL_SignalSemaphore = SDL_SignalSemaphore_REAL;
pub const @"true" = @as(c_int, 1);
pub const SDL_NS_PER_SECOND = @as(c_longlong, 1000000000);
pub const EINTR = @as(c_int, 4);
pub const CLOCK_REALTIME = @as(c_int, 0);
