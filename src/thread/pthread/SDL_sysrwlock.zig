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
pub const struct___pthread_rwlock_arch_t = extern struct {
    __readers: c_uint = 0,
    __writers: c_uint = 0,
    __wrphase_futex: c_uint = 0,
    __writers_futex: c_uint = 0,
    __pad3: c_uint = 0,
    __pad4: c_uint = 0,
    __cur_writer: c_int = 0,
    __shared: c_int = 0,
    __pad1: c_ulong = 0,
    __pad2: c_ulong = 0,
    __flags: c_uint = 0,
};
pub const pthread_rwlock_t = extern union {
    __data: struct___pthread_rwlock_arch_t,
    __size: [56]u8,
    __align: c_long,
};
pub const pthread_rwlockattr_t = extern union {
    __size: [8]u8,
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
pub const struct_SDL_RWLock = extern struct {
    id: pthread_rwlock_t = @import("std").mem.zeroes(pthread_rwlock_t),
};
pub const SDL_RWLock = struct_SDL_RWLock;
pub extern fn pthread_rwlock_init(noalias __rwlock: [*c]pthread_rwlock_t, noalias __attr: [*c]const pthread_rwlockattr_t) c_int;
pub extern fn pthread_rwlock_destroy(__rwlock: [*c]pthread_rwlock_t) c_int;
pub extern fn pthread_rwlock_rdlock(__rwlock: [*c]pthread_rwlock_t) c_int;
pub extern fn pthread_rwlock_tryrdlock(__rwlock: [*c]pthread_rwlock_t) c_int;
pub extern fn pthread_rwlock_wrlock(__rwlock: [*c]pthread_rwlock_t) c_int;
pub extern fn pthread_rwlock_trywrlock(__rwlock: [*c]pthread_rwlock_t) c_int;
pub extern fn pthread_rwlock_unlock(__rwlock: [*c]pthread_rwlock_t) c_int;
pub export fn SDL_CreateRWLock_REAL() [*c]SDL_RWLock {
    @setEvalBranchQuota(100000);
    var rwlock: [*c]SDL_RWLock = undefined;
    _ = &rwlock;
    rwlock = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(rwlock.*)))));
    if (rwlock != null) {
        if (pthread_rwlock_init(&rwlock.*.id, null) != @as(c_int, 0)) {
            _ = SDL_SetError_REAL("pthread_rwlock_init() failed");
            SDL_free_REAL(@ptrCast(@alignCast(rwlock)));
            rwlock = null;
        }
    }
    return rwlock;
}
pub export fn SDL_DestroyRWLock_REAL(rwlock: [*c]SDL_RWLock) void {
    @setEvalBranchQuota(100000);
    if (rwlock != null) {
        _ = pthread_rwlock_destroy(&rwlock.*.id);
        SDL_free_REAL(@ptrCast(@alignCast(rwlock)));
    }
}
pub export fn SDL_LockRWLockForReading_REAL(rwlock: [*c]SDL_RWLock) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [29:0]u8 = "SDL_LockRWLockForReading_REAL".*;
    };
    _ = &static_local___func__;
    if (rwlock != null) {
        const rc: c_int = pthread_rwlock_rdlock(&rwlock.*.id);
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
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_sysrwlock.c", 60);
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
pub export fn SDL_LockRWLockForWriting_REAL(rwlock: [*c]SDL_RWLock) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [29:0]u8 = "SDL_LockRWLockForWriting_REAL".*;
    };
    _ = &static_local___func__;
    if (rwlock != null) {
        const rc: c_int = pthread_rwlock_wrlock(&rwlock.*.id);
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
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_sysrwlock.c", 68);
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
pub export fn SDL_TryLockRWLockForReading_REAL(rwlock: [*c]SDL_RWLock) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [32:0]u8 = "SDL_TryLockRWLockForReading_REAL".*;
    };
    _ = &static_local___func__;
    var result: bool = @"true" != 0;
    _ = &result;
    if (rwlock != null) {
        const rc: c_int = pthread_rwlock_tryrdlock(&rwlock.*.id);
        _ = &rc;
        if (rc != @as(c_int, 0)) {
            result = @"false" != 0;
            if (rc != EBUSY) {
                while (true) {
                    while (!!(@intFromPtr("Error trying to lock rwlock for reading") != 0)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "!\"Error trying to lock rwlock for reading\"",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_sysrwlock.c", 81);
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
    }
    return result;
}
pub export fn SDL_TryLockRWLockForWriting_REAL(rwlock: [*c]SDL_RWLock) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [32:0]u8 = "SDL_TryLockRWLockForWriting_REAL".*;
    };
    _ = &static_local___func__;
    var result: bool = @"true" != 0;
    _ = &result;
    if (rwlock != null) {
        const rc: c_int = pthread_rwlock_trywrlock(&rwlock.*.id);
        _ = &rc;
        if (rc != @as(c_int, 0)) {
            result = @"false" != 0;
            if (rc != EBUSY) {
                while (true) {
                    while (!!(@intFromPtr("Error trying to lock rwlock for writing") != 0)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "!\"Error trying to lock rwlock for writing\"",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_sysrwlock.c", 98);
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
    }
    return result;
}
pub export fn SDL_UnlockRWLock_REAL(rwlock: [*c]SDL_RWLock) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [21:0]u8 = "SDL_UnlockRWLock_REAL".*;
    };
    _ = &static_local___func__;
    if (rwlock != null) {
        const rc: c_int = pthread_rwlock_unlock(&rwlock.*.id);
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
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_sysrwlock.c", 110);
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

pub const SDL_CreateRWLock = SDL_CreateRWLock_REAL;
pub const SDL_DestroyRWLock = SDL_DestroyRWLock_REAL;
pub const SDL_TryLockRWLockForReading = SDL_TryLockRWLockForReading_REAL;
pub const SDL_TryLockRWLockForWriting = SDL_TryLockRWLockForWriting_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const EBUSY = @as(c_int, 16);
