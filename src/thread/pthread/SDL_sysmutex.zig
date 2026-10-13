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
pub const pthread_mutexattr_t = extern union {
    __size: [4]u8,
    __align: c_int,
};
pub const pthread_mutex_t = extern union {
    __data: struct___pthread_mutex_s,
    __size: [40]u8,
    __align: c_long,
};
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
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
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const struct_SDL_Mutex = extern struct {
    id: pthread_mutex_t = @import("std").mem.zeroes(pthread_mutex_t),
};
pub const SDL_Mutex = struct_SDL_Mutex;
pub const PTHREAD_MUTEX_RECURSIVE: c_int = 1;
pub extern fn pthread_mutex_init(__mutex: [*c]pthread_mutex_t, __mutexattr: [*c]const pthread_mutexattr_t) c_int;
pub extern fn pthread_mutex_destroy(__mutex: [*c]pthread_mutex_t) c_int;
pub extern fn pthread_mutex_trylock(__mutex: [*c]pthread_mutex_t) c_int;
pub extern fn pthread_mutex_lock(__mutex: [*c]pthread_mutex_t) c_int;
pub extern fn pthread_mutex_unlock(__mutex: [*c]pthread_mutex_t) c_int;
pub extern fn pthread_mutexattr_init(__attr: [*c]pthread_mutexattr_t) c_int;
pub extern fn pthread_mutexattr_destroy(__attr: [*c]pthread_mutexattr_t) c_int;
pub extern fn pthread_mutexattr_settype(__attr: [*c]pthread_mutexattr_t, __kind: c_int) c_int;
pub export fn SDL_CreateMutex_REAL() [*c]SDL_Mutex {
    @setEvalBranchQuota(100000);
    var mutex: [*c]SDL_Mutex = undefined;
    _ = &mutex;
    var attr: pthread_mutexattr_t = undefined;
    _ = &attr;
    mutex = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(mutex.*)))));
    if (mutex != null) {
        _ = pthread_mutexattr_init(&attr);
        _ = pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
        if (pthread_mutex_init(&mutex.*.id, &attr) != @as(c_int, 0)) {
            _ = SDL_SetError_REAL("pthread_mutex_init() failed");
            SDL_free_REAL(@ptrCast(@alignCast(mutex)));
            mutex = null;
        }
        _ = pthread_mutexattr_destroy(&attr);
    }
    return mutex;
}
pub export fn SDL_DestroyMutex_REAL(mutex: [*c]SDL_Mutex) void {
    @setEvalBranchQuota(100000);
    if (mutex != null) {
        _ = pthread_mutex_destroy(&mutex.*.id);
        SDL_free_REAL(@ptrCast(@alignCast(mutex)));
    }
}
pub export fn SDL_LockMutex_REAL(mutex: [*c]SDL_Mutex) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [18:0]u8 = "SDL_LockMutex_REAL".*;
    };
    _ = &static_local___func__;
    if (mutex != null) {
        const rc: c_int = pthread_mutex_lock(&mutex.*.id);
        _ = &rc;
        while (true) {
            while (!(rc == @as(c_int, 0))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "rc == 0",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_sysmutex.c", 81);
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
    }
}
pub export fn SDL_TryLockMutex_REAL(mutex: [*c]SDL_Mutex) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [21:0]u8 = "SDL_TryLockMutex_REAL".*;
    };
    _ = &static_local___func__;
    var result: bool = @"true" != 0;
    _ = &result;
    if (mutex != null) {
        const rc: c_int = pthread_mutex_trylock(&mutex.*.id);
        _ = &rc;
        if (rc != @as(c_int, 0)) {
            if (rc == EBUSY) {
                result = @"false" != 0;
            } else {
                while (true) {
                    while (!!(@intFromPtr("Error trying to lock mutex") != 0)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "!\"Error trying to lock mutex\"",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_sysmutex.c", 117);
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
                result = @"false" != 0;
            }
        }
    }
    return result;
}
pub export fn SDL_UnlockMutex_REAL(mutex: [*c]SDL_Mutex) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [20:0]u8 = "SDL_UnlockMutex_REAL".*;
    };
    _ = &static_local___func__;
    if (mutex != null) {
        const rc: c_int = pthread_mutex_unlock(&mutex.*.id);
        _ = &rc;
        while (true) {
            while (!(rc == @as(c_int, 0))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "rc == 0",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_sysmutex.c", 151);
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
    }
}

pub const SDL_CreateMutex = SDL_CreateMutex_REAL;
pub const SDL_DestroyMutex = SDL_DestroyMutex_REAL;
pub const SDL_TryLockMutex = SDL_TryLockMutex_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const EBUSY = @as(c_int, 16);
