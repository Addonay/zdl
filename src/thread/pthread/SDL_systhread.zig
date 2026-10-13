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
pub const __off_t = c_long;
pub const __pid_t = c_int;
pub const pid_t = __pid_t;
pub const __sigset_t = extern struct {
    __val: [16]c_ulong = @import("std").mem.zeroes([16]c_ulong),
};
pub const sigset_t = __sigset_t;
pub const pthread_t = c_ulong;
pub const union_pthread_attr_t = extern union {
    __size: [56]u8,
    __align: c_long,
};
pub const pthread_attr_t = union_pthread_attr_t;
pub const Sint64 = i64;
pub const Uint64 = u64;
pub const SDL_realloc_func = ?*const fn (mem: ?*anyopaque, size: usize) callconv(.c) ?*anyopaque;
pub const SDL_free_func = ?*const fn (mem: ?*anyopaque) callconv(.c) void;
pub extern fn SDL_strlcpy_REAL(dst: [*c]u8, src: [*c]const u8, maxlen: usize) usize;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
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
pub const struct_SDL_AtomicInt = extern struct {
    value: c_int = 0,
};
pub const SDL_AtomicInt = struct_SDL_AtomicInt;
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
pub const SDL_THREAD_PRIORITY_LOW: c_int = 0;
pub const SDL_THREAD_PRIORITY_NORMAL: c_int = 1;
pub const SDL_THREAD_PRIORITY_HIGH: c_int = 2;
pub const SDL_THREAD_PRIORITY_TIME_CRITICAL: c_int = 3;
pub const enum_SDL_ThreadPriority = c_uint;
pub const SDL_ThreadPriority = enum_SDL_ThreadPriority;
pub extern fn SDL_GetHint_REAL(name: [*c]const u8) [*c]const u8;
pub extern fn SDL_GetHintBoolean_REAL(name: [*c]const u8, default_value: bool) bool;
pub extern fn SDL_SetLinuxThreadPriorityAndPolicy_REAL(threadID: Sint64, sdlPriority: c_int, schedPolicy: c_int) bool;
pub const struct_sched_param = extern struct {
    sched_priority: c_int = 0,
};
pub const PTHREAD_CREATE_JOINABLE: c_int = 0;
pub const PTHREAD_CANCEL_ASYNCHRONOUS: c_int = 1;
pub extern fn pthread_create(noalias __newthread: [*c]pthread_t, noalias __attr: [*c]const pthread_attr_t, __start_routine: ?*const fn (?*anyopaque) callconv(.c) ?*anyopaque, noalias __arg: ?*anyopaque) c_int;
pub extern fn pthread_join(__th: pthread_t, __thread_return: [*c]?*anyopaque) c_int;
pub extern fn pthread_detach(__th: pthread_t) c_int;
pub extern fn pthread_self() pthread_t;
pub extern fn pthread_attr_init(__attr: [*c]pthread_attr_t) c_int;
pub extern fn pthread_attr_setdetachstate(__attr: [*c]pthread_attr_t, __detachstate: c_int) c_int;
pub extern fn pthread_attr_setstacksize(__attr: [*c]pthread_attr_t, __stacksize: usize) c_int;
pub extern fn pthread_getschedparam(__target_thread: pthread_t, noalias __policy: [*c]c_int, noalias __param: [*c]struct_sched_param) c_int;
pub extern fn pthread_setcanceltype(__type: c_int, __oldtype: [*c]c_int) c_int;
pub extern fn sigemptyset(__set: [*c]sigset_t) c_int;
pub extern fn sigaddset(__set: [*c]sigset_t, __signo: c_int) c_int;
pub extern fn truncate(__file: [*c]const u8, __length: __off_t) c_int;
pub extern fn syscall(__sysno: c_long, ...) c_long;
pub extern fn pthread_sigmask(__how: c_int, noalias __newmask: [*c]const __sigset_t, noalias __oldmask: [*c]__sigset_t) c_int;
pub extern fn dlsym(noalias __handle: ?*anyopaque, noalias __name: [*c]const u8) ?*anyopaque;
pub const SDL_ErrorCode = c_uint;
pub extern fn SDL_RunThread(thread: [*c]SDL_Thread) void;
pub const sig_list: [10]c_int = [10]c_int{
    SIGHUP,
    SIGINT,
    SIGQUIT,
    SIGPIPE,
    SIGALRM,
    SIGTERM,
    SIGWINCH,
    SIGVTALRM,
    SIGPROF,
    0,
};
pub fn RunThread(data: ?*anyopaque) callconv(.c) ?*anyopaque {
    @setEvalBranchQuota(100000);
    SDL_RunThread(@ptrCast(@alignCast(data)));
    return null;
}
pub var checked_setname: bool = @"false" != 0;
pub var ppthread_setname_np: ?*const fn (pthread_t, [*c]const u8) callconv(.c) c_int = null;
pub export fn SDL_SYS_CreateThread(thread: [*c]SDL_Thread, _: SDL_FunctionPointer, _: SDL_FunctionPointer) bool {
    @setEvalBranchQuota(100000);
    var @"type": pthread_attr_t = undefined;
    _ = &@"type";
    if (!checked_setname) {
        var @"fn": ?*anyopaque = dlsym(null, "pthread_setname_np");
        _ = &@"fn";
        ppthread_setname_np = @ptrCast(@alignCast(@"fn"));
        checked_setname = @"true" != 0;
    }
    if (pthread_attr_init(&@"type") != @as(c_int, 0)) {
        return SDL_SetError_REAL("Couldn't initialize pthread attributes");
    }
    _ = pthread_attr_setdetachstate(&@"type", PTHREAD_CREATE_JOINABLE);
    if (thread.*.stacksize != 0) {
        _ = pthread_attr_setstacksize(&@"type", thread.*.stacksize);
    }
    if (pthread_create(&thread.*.handle, &@"type", RunThread, @ptrCast(@alignCast(thread))) != @as(c_int, 0)) {
        return SDL_SetError_REAL("Not enough resources to create thread");
    }
    thread.*.threadid = thread.*.handle;
    return @"true" != 0;
}
pub export fn SDL_SYS_SetupThread(name: [*c]const u8) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [19:0]u8 = "SDL_SYS_SetupThread".*;
    };
    _ = &static_local___func__;
    var i: c_int = undefined;
    _ = &i;
    var mask: sigset_t = undefined;
    _ = &mask;
    if (name != null) {
        while (true) {
            while (!checked_setname) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "checked_setname",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_systhread.c", 133);
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
        if (ppthread_setname_np != null) {
            if (ppthread_setname_np.?(pthread_self(), name) == ERANGE) {
                var namebuf: [16]u8 = undefined;
                _ = &namebuf;
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&namebuf)), name, @sizeOf(@TypeOf(namebuf)));
                _ = ppthread_setname_np.?(pthread_self(), @ptrCast(@alignCast(&namebuf)));
            }
        }
    }
    _ = sigemptyset(&mask);
    {
        i = 0;
        while (sig_list[@bitCast(@as(isize, @intCast(i)))] != 0) : (i += 1) {
            _ = sigaddset(&mask, sig_list[@bitCast(@as(isize, @intCast(i)))]);
        }
    }
    _ = pthread_sigmask(SIG_BLOCK, &mask, null);
    {
        var oldstate: c_int = undefined;
        _ = &oldstate;
        _ = pthread_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOUS, &oldstate);
    }
}
pub export fn SDL_GetCurrentThreadID_REAL() SDL_ThreadID {
    @setEvalBranchQuota(100000);
    return pthread_self();
}
pub export fn SDL_SYS_SetThreadPriority(priority: SDL_ThreadPriority) bool {
    @setEvalBranchQuota(100000);
    var sched: struct_sched_param = undefined;
    _ = &sched;
    var policy: c_int = undefined;
    _ = &policy;
    var pri_policy: c_int = undefined;
    _ = &pri_policy;
    var thread: pthread_t = undefined;
    _ = &thread;
    var policyhint: [*c]const u8 = undefined;
    _ = &policyhint;
    var timecritical_realtime_hint: bool = undefined;
    _ = &timecritical_realtime_hint;
    var linuxTid: pid_t = undefined;
    _ = &linuxTid;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                thread = pthread_self();
                policyhint = SDL_GetHint_REAL("SDL_THREAD_PRIORITY_POLICY");
                timecritical_realtime_hint = SDL_GetHintBoolean_REAL("SDL_THREAD_FORCE_REALTIME_TIME_CRITICAL", @"false" != 0);
                if (pthread_getschedparam(thread, &policy, &sched) != @as(c_int, 0)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return SDL_SetError_REAL("pthread_getschedparam() failed");
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                switch (priority) {
                    @as(SDL_ThreadPriority, SDL_THREAD_PRIORITY_LOW) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_ThreadPriority, SDL_THREAD_PRIORITY_NORMAL) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(SDL_ThreadPriority, SDL_THREAD_PRIORITY_HIGH) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(SDL_ThreadPriority, SDL_THREAD_PRIORITY_TIME_CRITICAL) => {
                        sdl_pc = 8;
                        continue;
                    },
                    else => {
                        sdl_pc = 9;
                        continue;
                    },
                }
            },
            4 => {
                if (timecritical_realtime_hint and (priority == @as(SDL_ThreadPriority, SDL_THREAD_PRIORITY_TIME_CRITICAL))) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                pri_policy = SCHED_OTHER;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            7 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            8 => {
                pri_policy = SCHED_OTHER;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            9 => {
                pri_policy = policy;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            10 => {
                pri_policy = SCHED_RR;
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                if (policyhint != null) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            13 => {
                if (SDL_strcmp_REAL(policyhint, "current") == @as(c_int, 0)) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            14 => {
                policy = pri_policy;
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                linuxTid = @truncate(syscall(__NR_gettid));
                return SDL_SetLinuxThreadPriorityAndPolicy_REAL(linuxTid, @bitCast(priority), policy);
            },
            16 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            17 => {
                if (SDL_strcmp_REAL(policyhint, "other") == @as(c_int, 0)) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            18 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            19 => {
                policy = SCHED_OTHER;
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                if (SDL_strcmp_REAL(policyhint, "rr") == @as(c_int, 0)) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            21 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            22 => {
                policy = SCHED_RR;
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                if (SDL_strcmp_REAL(policyhint, "fifo") == @as(c_int, 0)) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            24 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            25 => {
                policy = SCHED_FIFO;
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            26 => {
                policy = pri_policy;
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            27 => {
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_SYS_WaitThread(thread: [*c]SDL_Thread) void {
    @setEvalBranchQuota(100000);
    _ = pthread_join(thread.*.handle, null);
}
pub export fn SDL_SYS_DetachThread(thread: [*c]SDL_Thread) void {
    @setEvalBranchQuota(100000);
    _ = pthread_detach(thread.*.handle);
}

pub const SDL_GetCurrentThreadID = SDL_GetCurrentThreadID_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SCHED_OTHER = @as(c_int, 0);
pub const SCHED_FIFO = @as(c_int, 1);
pub const SCHED_RR = @as(c_int, 2);
pub const sched_priority = @compileError("unable to translate macro: undefined identifier `sched_priority`");
// /usr/include/sched.h:47:9
pub const SIGINT = @as(c_int, 2);
pub const SIGTERM = @as(c_int, 15);
pub const SIGHUP = @as(c_int, 1);
pub const SIGQUIT = @as(c_int, 3);
pub const SIGPIPE = @as(c_int, 13);
pub const SIGALRM = @as(c_int, 14);
pub const SIGVTALRM = @as(c_int, 26);
pub const SIGPROF = @as(c_int, 27);
pub const SIGWINCH = @as(c_int, 28);
pub const SIG_BLOCK = @as(c_int, 0);
pub const ERANGE = @as(c_int, 34);
pub const __NR_gettid = @as(c_int, 186);
