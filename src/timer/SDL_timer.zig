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
pub const __builtin = @import("translation_builtins");
pub const __helpers = @import("std").zig.c_translation.helpers;
pub const pthread_t = c_ulong;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub const Uint64 = u64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub const SDL_realloc_func = ?*const fn (mem: ?*anyopaque, size: usize) callconv(.c) ?*anyopaque;
pub const SDL_free_func = ?*const fn (mem: ?*anyopaque) callconv(.c) void;
pub extern fn SDL_atoi_REAL(str: [*c]const u8) c_int;
pub const SDL_FunctionPointer = ?*const fn () callconv(.c) void;
pub const SDL_ASSERTION_RETRY: c_int = 0;
pub const SDL_ASSERTION_BREAK: c_int = 1;
pub const enum_SDL_AssertState = c_uint;
pub const SDL_AssertState = enum_SDL_AssertState;
pub const struct_SDL_AssertData = extern struct {
    always_ignore: bool = false,
    trigger_count: c_uint = 0,
    condition: [*c]const u8 = null,
    filename: [*c]const u8 = null,
    linenum: c_int = 0,
    function: [*c]const u8 = null,
    next: [*c]const struct_SDL_AssertData = null,
};
pub const SDL_AssertData = struct_SDL_AssertData;
pub extern fn SDL_ReportAssertion_REAL(data: [*c]SDL_AssertData, func: [*c]const u8, file: [*c]const u8, line: c_int) SDL_AssertState;
pub const SDL_SpinLock = c_int;
pub extern fn SDL_LockSpinlock_REAL(lock: [*c]SDL_SpinLock) void;
pub extern fn SDL_UnlockSpinlock_REAL(lock: [*c]SDL_SpinLock) void;
pub const struct_SDL_AtomicInt = extern struct {
    value: c_int = 0,
};
pub const SDL_AtomicInt = struct_SDL_AtomicInt;
pub extern fn SDL_SetAtomicInt_REAL(a: [*c]SDL_AtomicInt, v: c_int) c_int;
pub extern fn SDL_GetAtomicInt_REAL(a: [*c]SDL_AtomicInt) c_int;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_ThreadID = Uint64;
pub const SYS_ThreadHandle = pthread_t;
pub const struct_SDL_ErrorInfo = extern struct {
    @"error": SDL_ErrorCode = @import("std").mem.zeroes(SDL_ErrorCode),
    str: [*c]u8 = null,
    len: usize = 0,
};
pub const SDL_ErrorInfo = struct_SDL_ErrorInfo;
pub const struct_SDL_error = extern struct {
    info: [2]SDL_ErrorInfo = @import("std").mem.zeroes([2]SDL_ErrorInfo),
    current: c_int = 0,
    realloc_func: SDL_realloc_func = null,
    free_func: SDL_free_func = null,
};
pub const SDL_error = struct_SDL_error;
pub const struct_SDL_Thread = extern struct {
    threadid: SDL_ThreadID = 0,
    handle: SYS_ThreadHandle = 0,
    status: c_int = 0,
    state: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
    errbuf: SDL_error = @import("std").mem.zeroes(SDL_error),
    name: [*c]u8 = null,
    stacksize: usize = 0,
    userfunc: ?*const fn (?*anyopaque) callconv(.c) c_int = null,
    userdata: ?*anyopaque = null,
    data: ?*anyopaque = null,
    endfunc: SDL_FunctionPointer = null,
};
pub const SDL_Thread = struct_SDL_Thread;
pub const SDL_ThreadFunction = ?*const fn (data: ?*anyopaque) callconv(.c) c_int;
pub extern fn SDL_CreateThreadRuntime_REAL(@"fn": SDL_ThreadFunction, name: [*c]const u8, data: ?*anyopaque, pfnBeginThread: SDL_FunctionPointer, pfnEndThread: SDL_FunctionPointer) [*c]SDL_Thread;
pub extern fn SDL_WaitThread_REAL(thread: [*c]SDL_Thread, status: [*c]c_int) void;
pub const struct_SDL_Mutex = opaque {
};
pub const SDL_Mutex = struct_SDL_Mutex;
pub extern fn SDL_CreateMutex_REAL() ?*SDL_Mutex;
pub extern fn SDL_LockMutex_REAL(mutex: ?*SDL_Mutex) void;
pub extern fn SDL_UnlockMutex_REAL(mutex: ?*SDL_Mutex) void;
pub extern fn SDL_DestroyMutex_REAL(mutex: ?*SDL_Mutex) void;
pub const struct_SDL_Semaphore = opaque {
};
pub const SDL_Semaphore = struct_SDL_Semaphore;
pub extern fn SDL_CreateSemaphore_REAL(initial_value: Uint32) ?*SDL_Semaphore;
pub extern fn SDL_DestroySemaphore_REAL(sem: ?*SDL_Semaphore) void;
pub extern fn SDL_SignalSemaphore_REAL(sem: ?*SDL_Semaphore) void;
pub const struct_SDL_InitState = extern struct {
    status: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
    thread: SDL_ThreadID = 0,
    reserved: ?*anyopaque = null,
};
pub const SDL_InitState = struct_SDL_InitState;
pub extern fn SDL_ShouldInit_REAL(state: [*c]SDL_InitState) bool;
pub extern fn SDL_ShouldQuit_REAL(state: [*c]SDL_InitState) bool;
pub extern fn SDL_SetInitialized_REAL(state: [*c]SDL_InitState, initialized: bool) void;
pub const SDL_HintCallback = ?*const fn (userdata: ?*anyopaque, name: [*c]const u8, oldValue: [*c]const u8, newValue: [*c]const u8) callconv(.c) void;
pub extern fn SDL_AddHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) bool;
pub extern fn SDL_RemoveHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) void;
pub extern fn SDL_GetPerformanceCounter_REAL() Uint64;
pub extern fn SDL_GetPerformanceFrequency_REAL() Uint64;
pub const SDL_TimerID = Uint32;
pub const SDL_TimerCallback = ?*const fn (userdata: ?*anyopaque, timerID: SDL_TimerID, interval: Uint32) callconv(.c) Uint32;
pub const SDL_NSTimerCallback = ?*const fn (userdata: ?*anyopaque, timerID: SDL_TimerID, interval: Uint64) callconv(.c) Uint64;
pub extern fn SDL_CalculateGCD(a: Uint32, b: Uint32) Uint32;
pub extern fn SDL_GetNextObjectID() Uint32;
pub extern fn SDL_WaitSemaphoreTimeoutNS(sem: ?*SDL_Semaphore, timeoutNS: Sint64) bool;
pub extern fn ZDL_Pause() void;
pub extern fn SDL_SYS_DelayNS(ns: Uint64) void;
pub const SDL_ErrorCode = c_uint;
pub const struct_SDL_Timer = extern struct {
    timerID: SDL_TimerID = 0,
    callback_ms: SDL_TimerCallback = null,
    callback_ns: SDL_NSTimerCallback = null,
    userdata: ?*anyopaque = null,
    interval: Uint64 = 0,
    scheduled: Uint64 = 0,
    canceled: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
    next: [*c]struct_SDL_Timer = null,
};
pub const SDL_Timer = struct_SDL_Timer;
pub const struct_SDL_TimerMap = extern struct {
    timerID: SDL_TimerID = 0,
    timer: [*c]SDL_Timer = null,
    next: [*c]struct_SDL_TimerMap = null,
};
pub const SDL_TimerMap = struct_SDL_TimerMap;
pub const SDL_TimerData = extern struct {
    init: SDL_InitState = @import("std").mem.zeroes(SDL_InitState),
    thread: [*c]SDL_Thread = null,
    timermap: [*c]SDL_TimerMap = null,
    timermap_lock: ?*SDL_Mutex = null,
    cache_pad: [128]u8 = @import("std").mem.zeroes([128]u8),
    lock: SDL_SpinLock = 0,
    sem: ?*SDL_Semaphore = null,
    pending: [*c]SDL_Timer = null,
    freelist: [*c]SDL_Timer = null,
    active: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
    timers: [*c]SDL_Timer = null,
};
pub var SDL_timer_data: SDL_TimerData = @import("std").mem.zeroes(SDL_TimerData);
pub fn SDL_AddTimerInternal(data: [*c]SDL_TimerData, timer: [*c]SDL_Timer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var prev: [*c]SDL_Timer = undefined;
    _ = &prev;
    var curr: [*c]SDL_Timer = undefined;
    _ = &curr;
    prev = null;
    {
        curr = data.*.timers;
        while (curr != null) : ({
            prev = curr;
            curr = curr.*.next;
        }) {
            if (curr.*.scheduled > timer.*.scheduled) {
                break;
            }
        }
    }
    if (prev != null) {
        prev.*.next = timer;
    } else {
        data.*.timers = timer;
    }
    timer.*.next = curr;
}
pub fn SDL_TimerThread(_data: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_TimerData = @ptrCast(@alignCast(_data));
    _ = &data;
    var pending: [*c]SDL_Timer = undefined;
    _ = &pending;
    var current: [*c]SDL_Timer = undefined;
    _ = &current;
    var freelist_head: [*c]SDL_Timer = null;
    _ = &freelist_head;
    var freelist_tail: [*c]SDL_Timer = null;
    _ = &freelist_tail;
    var tick: Uint64 = undefined;
    _ = &tick;
    var now: Uint64 = undefined;
    _ = &now;
    var interval: Uint64 = undefined;
    _ = &interval;
    var delay: Uint64 = undefined;
    _ = &delay;
    while (true) {
        SDL_LockSpinlock_REAL(&data.*.lock);
        {
            pending = data.*.pending;
            data.*.pending = null;
            if (freelist_head != null) {
                freelist_tail.*.next = data.*.freelist;
                data.*.freelist = freelist_head;
            }
        }
        SDL_UnlockSpinlock_REAL(&data.*.lock);
        while (pending != null) {
            current = pending;
            pending = pending.*.next;
            SDL_AddTimerInternal(data, current);
        }
        freelist_head = null;
        freelist_tail = null;
        if (!(SDL_GetAtomicInt_REAL(&data.*.active) != 0)) {
            break;
        }
        delay = @bitCast(@as(c_long, -@as(c_int, 1)));
        tick = SDL_GetTicksNS_REAL();
        while (data.*.timers != null) {
            current = data.*.timers;
            if (tick < current.*.scheduled) {
                delay = current.*.scheduled -% tick;
                break;
            }
            data.*.timers = current.*.next;
            if (SDL_GetAtomicInt_REAL(&current.*.canceled) != 0) {
                interval = 0;
            } else {
                if (current.*.callback_ms != null) {
                    interval = @as(Uint64, current.*.callback_ms.?(current.*.userdata, current.*.timerID, @truncate(current.*.interval / @as(Uint64, SDL_NS_PER_MS)))) *% @as(Uint64, SDL_NS_PER_MS);
                } else {
                    interval = current.*.callback_ns.?(current.*.userdata, current.*.timerID, current.*.interval);
                }
            }
            if (interval > @as(Uint64, 0)) {
                current.*.interval = interval;
                current.*.scheduled = tick +% interval;
                SDL_AddTimerInternal(data, current);
            } else {
                if (!(freelist_head != null)) {
                    freelist_head = current;
                }
                if (freelist_tail != null) {
                    freelist_tail.*.next = current;
                }
                freelist_tail = current;
                _ = SDL_SetAtomicInt_REAL(&current.*.canceled, 1);
            }
        }
        now = SDL_GetTicksNS_REAL();
        interval = now -% tick;
        if (interval > delay) {
            delay = 0;
        } else {
            delay -%= interval;
        }
        _ = SDL_WaitSemaphoreTimeoutNS(data.*.sem, @bitCast(@as(c_ulong, @truncate(delay))));
    }
    return 0;
}
pub export fn SDL_InitTimers() bool {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_TimerData = undefined;
    _ = &data;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                data = &SDL_timer_data;
                if (!SDL_ShouldInit_REAL(&data.*.init)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                SDL_SetInitialized_REAL(&data.*.init, @"true" != 0);
                SDL_QuitTimers();
                return @"false" != 0;
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
                data.*.timermap_lock = SDL_CreateMutex_REAL();
                if (!(data.*.timermap_lock != null)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                {
                    sdl_pc = 1;
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
                data.*.sem = SDL_CreateSemaphore_REAL(0);
                if (!(data.*.sem != null)) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            9 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                _ = SDL_SetAtomicInt_REAL(&data.*.active, @"true");
                data.*.thread = SDL_CreateThreadRuntime_REAL(SDL_TimerThread, "SDLTimer", @ptrCast(@alignCast(data)), null, null);
                if (!(data.*.thread != null)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                {
                    sdl_pc = 1;
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
                SDL_SetInitialized_REAL(&data.*.init, @"true" != 0);
                return @"true" != 0;
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_QuitTimers() void {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_TimerData = &SDL_timer_data;
    _ = &data;
    var timer: [*c]SDL_Timer = undefined;
    _ = &timer;
    var entry: [*c]SDL_TimerMap = undefined;
    _ = &entry;
    if (!SDL_ShouldQuit_REAL(&data.*.init)) {
        return;
    }
    _ = SDL_SetAtomicInt_REAL(&data.*.active, @"false");
    if (data.*.thread != null) {
        SDL_SignalSemaphore_REAL(data.*.sem);
        SDL_WaitThread_REAL(data.*.thread, null);
        data.*.thread = null;
    }
    if (data.*.sem != null) {
        SDL_DestroySemaphore_REAL(data.*.sem);
        data.*.sem = null;
    }
    while (data.*.timers != null) {
        timer = data.*.timers;
        data.*.timers = timer.*.next;
        SDL_free_REAL(@ptrCast(@alignCast(timer)));
    }
    while (data.*.freelist != null) {
        timer = data.*.freelist;
        data.*.freelist = timer.*.next;
        SDL_free_REAL(@ptrCast(@alignCast(timer)));
    }
    while (data.*.timermap != null) {
        entry = data.*.timermap;
        data.*.timermap = entry.*.next;
        SDL_free_REAL(@ptrCast(@alignCast(entry)));
    }
    if (data.*.timermap_lock != null) {
        SDL_DestroyMutex_REAL(data.*.timermap_lock);
        data.*.timermap_lock = null;
    }
    SDL_SetInitialized_REAL(&data.*.init, @"false" != 0);
}
pub fn SDL_CheckInitTimers() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_InitTimers();
}
pub fn SDL_CreateTimer(interval: Uint64, callback_ms: SDL_TimerCallback, callback_ns: SDL_NSTimerCallback, userdata: ?*anyopaque) callconv(.c) SDL_TimerID {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_TimerData = &SDL_timer_data;
    _ = &data;
    var timer: [*c]SDL_Timer = undefined;
    _ = &timer;
    var entry: [*c]SDL_TimerMap = undefined;
    _ = &entry;
    if (!(callback_ms != null) and !(callback_ns != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("callback"))));
        return 0;
    }
    if (!SDL_CheckInitTimers()) {
        return 0;
    }
    SDL_LockSpinlock_REAL(&data.*.lock);
    timer = data.*.freelist;
    if (timer != null) {
        data.*.freelist = timer.*.next;
    }
    SDL_UnlockSpinlock_REAL(&data.*.lock);
    if (timer != null) {
        _ = SDL_RemoveTimer_REAL(timer.*.timerID);
    } else {
        timer = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(@TypeOf(timer.*)))));
        if (!(timer != null)) {
            return 0;
        }
    }
    timer.*.timerID = SDL_GetNextObjectID();
    timer.*.callback_ms = callback_ms;
    timer.*.callback_ns = callback_ns;
    timer.*.userdata = userdata;
    timer.*.interval = interval;
    timer.*.scheduled = SDL_GetTicksNS_REAL() +% timer.*.interval;
    _ = SDL_SetAtomicInt_REAL(&timer.*.canceled, 0);
    entry = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(@TypeOf(entry.*)))));
    if (!(entry != null)) {
        SDL_free_REAL(@ptrCast(@alignCast(timer)));
        return 0;
    }
    entry.*.timer = timer;
    entry.*.timerID = timer.*.timerID;
    SDL_LockMutex_REAL(data.*.timermap_lock);
    entry.*.next = data.*.timermap;
    data.*.timermap = entry;
    SDL_UnlockMutex_REAL(data.*.timermap_lock);
    SDL_LockSpinlock_REAL(&data.*.lock);
    timer.*.next = data.*.pending;
    data.*.pending = timer;
    SDL_UnlockSpinlock_REAL(&data.*.lock);
    SDL_SignalSemaphore_REAL(data.*.sem);
    return entry.*.timerID;
}
pub export fn SDL_AddTimer_REAL(interval: Uint32, callback: SDL_TimerCallback, userdata: ?*anyopaque) SDL_TimerID {
    @setEvalBranchQuota(100000);
    return SDL_CreateTimer(@as(Uint64, interval) *% @as(Uint64, SDL_NS_PER_MS), callback, null, userdata);
}
pub export fn SDL_AddTimerNS_REAL(interval: Uint64, callback: SDL_NSTimerCallback, userdata: ?*anyopaque) SDL_TimerID {
    @setEvalBranchQuota(100000);
    return SDL_CreateTimer(interval, null, callback, userdata);
}
pub export fn SDL_RemoveTimer_REAL(id: SDL_TimerID) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_TimerData = &SDL_timer_data;
    _ = &data;
    var prev: [*c]SDL_TimerMap = undefined;
    _ = &prev;
    var entry: [*c]SDL_TimerMap = undefined;
    _ = &entry;
    var canceled: bool = @"false" != 0;
    _ = &canceled;
    if (!(id != 0)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("id"))));
    }
    SDL_LockMutex_REAL(data.*.timermap_lock);
    prev = null;
    {
        entry = data.*.timermap;
        while (entry != null) : ({
            prev = entry;
            entry = entry.*.next;
        }) {
            if (entry.*.timerID == id) {
                if (prev != null) {
                    prev.*.next = entry.*.next;
                } else {
                    data.*.timermap = entry.*.next;
                }
                break;
            }
        }
    }
    SDL_UnlockMutex_REAL(data.*.timermap_lock);
    if (entry != null) {
        if (!(SDL_GetAtomicInt_REAL(&entry.*.timer.*.canceled) != 0)) {
            _ = SDL_SetAtomicInt_REAL(&entry.*.timer.*.canceled, 1);
            canceled = @"true" != 0;
        }
        SDL_free_REAL(@ptrCast(@alignCast(entry)));
    }
    if (canceled) {
        return @"true" != 0;
    } else {
        return SDL_SetError_REAL("Timer not found");
    }
}
pub var tick_start: Uint64 = 0;
pub var tick_numerator_ns: Uint32 = 0;
pub var tick_denominator_ns: Uint32 = 0;
pub var tick_numerator_ms: Uint32 = 0;
pub var tick_denominator_ms: Uint32 = 0;
pub fn SDL_SetSystemTimerResolutionMS(_: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn SDL_TimerResolutionChanged(_: ?*anyopaque, _: [*c]const u8, oldValue: [*c]const u8, hint: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var period: c_int = undefined;
    _ = &period;
    if ((hint != null) and (@as(c_int, hint.*) != 0)) {
        period = SDL_atoi_REAL(hint);
    } else {
        period = 1;
    }
    if ((period != 0) or (oldValue != hint)) {
        SDL_SetSystemTimerResolutionMS(period);
    }
}
pub export fn SDL_InitTicks() void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [13:0]u8 = "SDL_InitTicks".*;
    };
    _ = &static_local___func__;
    var tick_freq: Uint64 = undefined;
    _ = &tick_freq;
    var gcd: Uint32 = undefined;
    _ = &gcd;
    if (tick_start != 0) {
        return;
    }
    _ = SDL_AddHintCallback_REAL("SDL_TIMER_RESOLUTION", SDL_TimerResolutionChanged, null);
    tick_freq = SDL_GetPerformanceFrequency_REAL();
    while (true) {
        while (!((tick_freq > @as(Uint64, 0)) and (tick_freq <= @as(Uint64, @as(c_uint, 4294967295))))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "tick_freq > 0 && tick_freq <= (Uint64)((Uint32)0xFFFFFFFFu)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_timer.c", 609);
            _ = &sdl_assert_state;
            if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                continue;
            } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                __builtin.debugtrap();
            }
            break;
        }
        if (!(@as(c_int, 0) != 0)) break;
    }
    gcd = SDL_CalculateGCD(SDL_NS_PER_SECOND, @truncate(tick_freq));
    tick_numerator_ns = @bitCast(@as(c_int, @truncate(@divTrunc(SDL_NS_PER_SECOND, @as(c_longlong, gcd)))));
    tick_denominator_ns = @truncate(tick_freq / @as(Uint64, gcd));
    gcd = SDL_CalculateGCD(SDL_MS_PER_SECOND, @truncate(tick_freq));
    tick_numerator_ms = @as(Uint32, SDL_MS_PER_SECOND) / gcd;
    tick_denominator_ms = @truncate(tick_freq / @as(Uint64, gcd));
    tick_start = SDL_GetPerformanceCounter_REAL();
    if (!(tick_start != 0)) {
        tick_start -%= 1;
    }
}
pub export fn SDL_QuitTicks() void {
    @setEvalBranchQuota(100000);
    SDL_RemoveHintCallback_REAL("SDL_TIMER_RESOLUTION", SDL_TimerResolutionChanged, null);
    SDL_SetSystemTimerResolutionMS(0);
    tick_start = 0;
}
pub export fn SDL_GetTicksNS_REAL() Uint64 {
    @setEvalBranchQuota(100000);
    var starting_value: Uint64 = undefined;
    _ = &starting_value;
    var value: Uint64 = undefined;
    _ = &value;
    if (!(tick_start != 0)) {
        SDL_InitTicks();
    }
    starting_value = SDL_GetPerformanceCounter_REAL() -% tick_start;
    value = ((starting_value / @as(Uint64, tick_denominator_ns)) *% @as(Uint64, tick_numerator_ns)) +% (((starting_value % @as(Uint64, tick_denominator_ns)) *% @as(Uint64, tick_numerator_ns)) / @as(Uint64, tick_denominator_ns));
    return value;
}
pub export fn SDL_GetTicks_REAL() Uint64 {
    @setEvalBranchQuota(100000);
    var starting_value: Uint64 = undefined;
    _ = &starting_value;
    var value: Uint64 = undefined;
    _ = &value;
    if (!(tick_start != 0)) {
        SDL_InitTicks();
    }
    starting_value = SDL_GetPerformanceCounter_REAL() -% tick_start;
    value = ((starting_value / @as(Uint64, tick_denominator_ms)) *% @as(Uint64, tick_numerator_ms)) +% (((starting_value % @as(Uint64, tick_denominator_ms)) *% @as(Uint64, tick_numerator_ms)) / @as(Uint64, tick_denominator_ms));
    return value;
}
pub export fn SDL_Delay_REAL(ms: Uint32) void {
    @setEvalBranchQuota(100000);
    SDL_SYS_DelayNS(@as(Uint64, ms) *% @as(Uint64, SDL_NS_PER_MS));
}
pub export fn SDL_DelayNS_REAL(ns: Uint64) void {
    @setEvalBranchQuota(100000);
    SDL_SYS_DelayNS(ns);
}
pub export fn SDL_DelayPrecise_REAL(ns: Uint64) void {
    @setEvalBranchQuota(100000);
    var current_value: Uint64 = SDL_GetTicksNS_REAL();
    _ = &current_value;
    const target_value: Uint64 = current_value +% ns;
    _ = &target_value;
    const SHORT_SLEEP_NS: Uint64 = @bitCast(@as(c_long, @as(c_int, 1) * SDL_NS_PER_MS));
    _ = &SHORT_SLEEP_NS;
    var max_sleep_ns: Uint64 = SHORT_SLEEP_NS;
    _ = &max_sleep_ns;
    while ((current_value +% max_sleep_ns) < target_value) {
        SDL_SYS_DelayNS(SHORT_SLEEP_NS);
        const now: Uint64 = SDL_GetTicksNS_REAL();
        _ = &now;
        const next_sleep_ns: Uint64 = now -% current_value;
        _ = &next_sleep_ns;
        if (next_sleep_ns > max_sleep_ns) {
            max_sleep_ns = next_sleep_ns;
        }
        current_value = now;
    }
    if ((current_value < target_value) and ((target_value -% current_value) > (max_sleep_ns -% SHORT_SLEEP_NS))) {
        const delay_ns: Uint64 = (target_value -% current_value) -% (max_sleep_ns -% SHORT_SLEEP_NS);
        _ = &delay_ns;
        SDL_SYS_DelayNS(delay_ns);
        current_value = SDL_GetTicksNS_REAL();
    }
    while ((current_value +% SHORT_SLEEP_NS) < target_value) {
        SDL_SYS_DelayNS(SHORT_SLEEP_NS);
        current_value = SDL_GetTicksNS_REAL();
    }
    while (current_value < target_value) {
        ZDL_Pause();
        current_value = SDL_GetTicksNS_REAL();
    }
}

pub const SDL_AddTimer = SDL_AddTimer_REAL;
pub const SDL_AddTimerNS = SDL_AddTimerNS_REAL;
pub const SDL_Delay = SDL_Delay_REAL;
pub const SDL_DelayNS = SDL_DelayNS_REAL;
pub const SDL_GetTicks = SDL_GetTicks_REAL;
pub const SDL_GetTicksNS = SDL_GetTicksNS_REAL;
pub const SDL_RemoveTimer = SDL_RemoveTimer_REAL;
pub const SDL_DelayPrecise = SDL_DelayPrecise_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_MS_PER_SECOND = @as(c_int, 1000);
pub const SDL_NS_PER_SECOND = @as(c_longlong, 1000000000);
pub const SDL_NS_PER_MS = __helpers.promoteIntLiteral(c_int, 1000000, .decimal);
