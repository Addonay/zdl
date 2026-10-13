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
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Sint32 = i32;
pub const Sint64 = i64;
pub const Uint64 = u64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
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
pub const SDL_AsyncIO = struct_SDL_AsyncIO;
pub const SDL_ASYNCIO_TASK_READ: c_int = 0;
pub const SDL_ASYNCIO_TASK_WRITE: c_int = 1;
pub const SDL_ASYNCIO_TASK_CLOSE: c_int = 2;
pub const enum_SDL_AsyncIOTaskType = c_uint;
pub const SDL_AsyncIOTaskType = enum_SDL_AsyncIOTaskType;
pub const struct_SDL_AsyncIOQueueInterface = extern struct {
    queue_task: ?*const fn (userdata: ?*anyopaque, task: [*c]SDL_AsyncIOTask) callconv(.c) bool = null,
    cancel_task: ?*const fn (userdata: ?*anyopaque, task: [*c]SDL_AsyncIOTask) callconv(.c) void = null,
    get_results: ?*const fn (userdata: ?*anyopaque) callconv(.c) [*c]SDL_AsyncIOTask = null,
    wait_results: ?*const fn (userdata: ?*anyopaque, timeoutMS: Sint32) callconv(.c) [*c]SDL_AsyncIOTask = null,
    signal: ?*const fn (userdata: ?*anyopaque) callconv(.c) void = null,
    destroy: ?*const fn (userdata: ?*anyopaque) callconv(.c) void = null,
};
pub const SDL_AsyncIOQueueInterface = struct_SDL_AsyncIOQueueInterface;
pub const struct_SDL_AtomicInt = extern struct {
    value: c_int = 0,
};
pub const SDL_AtomicInt = struct_SDL_AtomicInt;
pub const struct_SDL_AsyncIOQueue = extern struct {
    iface: SDL_AsyncIOQueueInterface = @import("std").mem.zeroes(SDL_AsyncIOQueueInterface),
    userdata: ?*anyopaque = null,
    tasks_inflight: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
};
pub const SDL_AsyncIOQueue = struct_SDL_AsyncIOQueue;
pub const enum_SDL_AsyncIOResult = c_uint;
pub const SDL_AsyncIOResult = enum_SDL_AsyncIOResult;
pub const struct_SDL_AsyncIOTask = extern struct {
    asyncio: [*c]SDL_AsyncIO = null,
    type: SDL_AsyncIOTaskType = @import("std").mem.zeroes(SDL_AsyncIOTaskType),
    queue: [*c]SDL_AsyncIOQueue = null,
    offset: Uint64 = 0,
    flush: bool = false,
    buffer: ?*anyopaque = null,
    @"error": [*c]u8 = null,
    result: SDL_AsyncIOResult = @import("std").mem.zeroes(SDL_AsyncIOResult),
    requested_size: Uint64 = 0,
    result_size: Uint64 = 0,
    app_userdata: ?*anyopaque = null,
    asyncioprev: [*c]struct_SDL_AsyncIOTask = null,
    asyncionext: [*c]struct_SDL_AsyncIOTask = null,
    queueprev: [*c]struct_SDL_AsyncIOTask = null,
    queuenext: [*c]struct_SDL_AsyncIOTask = null,
    threadpoolprev: [*c]struct_SDL_AsyncIOTask = null,
    threadpoolnext: [*c]struct_SDL_AsyncIOTask = null,
};
pub const SDL_AsyncIOTask = struct_SDL_AsyncIOTask;
pub const struct_SDL_AsyncIOInterface = extern struct {
    size: ?*const fn (userdata: ?*anyopaque) callconv(.c) Sint64 = null,
    read: ?*const fn (userdata: ?*anyopaque, task: [*c]SDL_AsyncIOTask) callconv(.c) bool = null,
    write: ?*const fn (userdata: ?*anyopaque, task: [*c]SDL_AsyncIOTask) callconv(.c) bool = null,
    close: ?*const fn (userdata: ?*anyopaque, task: [*c]SDL_AsyncIOTask) callconv(.c) bool = null,
    destroy: ?*const fn (userdata: ?*anyopaque) callconv(.c) void = null,
};
pub const SDL_AsyncIOInterface = struct_SDL_AsyncIOInterface;
pub const struct_SDL_Mutex = opaque {
};
pub const SDL_Mutex = struct_SDL_Mutex;
pub const struct_SDL_AsyncIO = extern struct {
    iface: SDL_AsyncIOInterface = @import("std").mem.zeroes(SDL_AsyncIOInterface),
    userdata: ?*anyopaque = null,
    lock: ?*SDL_Mutex = null,
    tasks: SDL_AsyncIOTask = @import("std").mem.zeroes(SDL_AsyncIOTask),
    closing: [*c]SDL_AsyncIOTask = null,
    oneshot: bool = false,
    readonly: bool = false,
};
pub const struct_SDL_AsyncIOOutcome = extern struct {
    asyncio: [*c]SDL_AsyncIO = null,
    type: SDL_AsyncIOTaskType = @import("std").mem.zeroes(SDL_AsyncIOTaskType),
    result: SDL_AsyncIOResult = @import("std").mem.zeroes(SDL_AsyncIOResult),
    buffer: ?*anyopaque = null,
    offset: Uint64 = 0,
    bytes_requested: Uint64 = 0,
    bytes_transferred: Uint64 = 0,
    userdata: ?*anyopaque = null,
};
pub const SDL_AsyncIOOutcome = struct_SDL_AsyncIOOutcome;
pub extern fn SDL_SetAtomicInt_REAL(a: [*c]SDL_AtomicInt, v: c_int) c_int;
pub extern fn SDL_GetAtomicInt_REAL(a: [*c]SDL_AtomicInt) c_int;
pub extern fn SDL_AddAtomicInt_REAL(a: [*c]SDL_AtomicInt, v: c_int) c_int;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub extern fn SDL_CreateMutex_REAL() ?*SDL_Mutex;
pub extern fn SDL_LockMutex_REAL(mutex: ?*SDL_Mutex) void;
pub extern fn SDL_UnlockMutex_REAL(mutex: ?*SDL_Mutex) void;
pub extern fn SDL_DestroyMutex_REAL(mutex: ?*SDL_Mutex) void;
pub extern fn SDL_SYS_AsyncIOFromFile(file: [*c]const u8, mode: [*c]const u8, asyncio: [*c]SDL_AsyncIO) bool;
pub extern fn SDL_SYS_CreateAsyncIOQueue(queue: [*c]SDL_AsyncIOQueue) bool;
pub extern fn SDL_SYS_QuitAsyncIO() void;
pub fn AsyncFileModeValid(mode: [*c]const u8, readonly: [*c]bool) callconv(.c) [*c]const u8 {
    @setEvalBranchQuota(100000);
    const struct_unnamed_14 = extern struct {
        valid: [*c]const u8 = null,
        with_binary: [*c]const u8 = null,
        readonly: bool = false,
    };
    _ = &struct_unnamed_14;
    const static_local_mode_map = struct {
        const mode_map: [4]struct_unnamed_14 = [4]struct_unnamed_14{
            struct_unnamed_14{
                .valid = "r",
                .with_binary = "rb",
                .readonly = @"true" != 0,
            },
            struct_unnamed_14{
                .valid = "w",
                .with_binary = "wb",
                .readonly = @"false" != 0,
            },
            struct_unnamed_14{
                .valid = "r+",
                .with_binary = "r+b",
                .readonly = @"false" != 0,
            },
            struct_unnamed_14{
                .valid = "w+",
                .with_binary = "w+b",
                .readonly = @"false" != 0,
            },
        };
    };
    _ = &static_local_mode_map;
    {
        var i: c_int = 0;
        _ = &i;
        while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(static_local_mode_map.mode_map)) / @sizeOf(@TypeOf(static_local_mode_map.mode_map[@as(c_int, 0)])))) : (i += 1) {
            if (SDL_strcmp_REAL(mode, static_local_mode_map.mode_map[@bitCast(@as(isize, @intCast(i)))].valid) == @as(c_int, 0)) {
                readonly.* = static_local_mode_map.mode_map[@bitCast(@as(isize, @intCast(i)))].readonly;
                return static_local_mode_map.mode_map[@bitCast(@as(isize, @intCast(i)))].with_binary;
            }
        }
    }
    readonly.* = @"false" != 0;
    return null;
}
pub export fn SDL_AsyncIOFromFile_REAL(file: [*c]const u8, mode: [*c]const u8) [*c]SDL_AsyncIO {
    @setEvalBranchQuota(100000);
    if (!(file != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("file"))));
        return null;
    }
    if (!(mode != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("mode"))));
        return null;
    }
    var readonly: bool = @"false" != 0;
    _ = &readonly;
    var binary_mode: [*c]const u8 = AsyncFileModeValid(mode, &readonly);
    _ = &binary_mode;
    if (!(binary_mode != null)) {
        _ = SDL_SetError_REAL("Unsupported file mode");
        return null;
    }
    var asyncio: [*c]SDL_AsyncIO = undefined;
    asyncio = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(asyncio.*)))));
    _ = &asyncio;
    if (!(asyncio != null)) {
        return null;
    }
    asyncio.*.readonly = readonly;
    asyncio.*.lock = SDL_CreateMutex_REAL();
    if (!(asyncio.*.lock != null)) {
        SDL_free_REAL(@ptrCast(@alignCast(asyncio)));
        return null;
    }
    if (!SDL_SYS_AsyncIOFromFile(file, binary_mode, asyncio)) {
        SDL_DestroyMutex_REAL(asyncio.*.lock);
        SDL_free_REAL(@ptrCast(@alignCast(asyncio)));
        return null;
    }
    return asyncio;
}
pub export fn SDL_GetAsyncIOSize_REAL(asyncio: [*c]SDL_AsyncIO) Sint64 {
    @setEvalBranchQuota(100000);
    if (!(asyncio != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("asyncio"))));
        return -@as(c_int, 1);
    }
    return asyncio.*.iface.size.?(asyncio.*.userdata);
}
pub fn RequestAsyncIO(reading: bool, asyncio: [*c]SDL_AsyncIO, ptr: ?*anyopaque, offset: Uint64, size: Uint64, queue: [*c]SDL_AsyncIOQueue, userdata: ?*anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (!(asyncio != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("asyncio"))));
    }
    if (!(ptr != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("ptr"))));
    }
    if (!(queue != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("queue"))));
    }
    var task: [*c]SDL_AsyncIOTask = undefined;
    task = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(task.*)))));
    _ = &task;
    if (!(task != null)) {
        return @"false" != 0;
    }
    task.*.asyncio = asyncio;
    task.*.type = @bitCast(if (reading) SDL_ASYNCIO_TASK_READ else SDL_ASYNCIO_TASK_WRITE);
    task.*.offset = offset;
    task.*.buffer = ptr;
    task.*.requested_size = size;
    task.*.app_userdata = userdata;
    task.*.queue = queue;
    SDL_LockMutex_REAL(asyncio.*.lock);
    if (asyncio.*.closing != null) {
        SDL_free_REAL(@ptrCast(@alignCast(task)));
        SDL_UnlockMutex_REAL(asyncio.*.lock);
        return SDL_SetError_REAL("SDL_AsyncIO is closing, can't start new tasks");
    }
    while (true) {
        task.*.asyncioprev = &asyncio.*.tasks;
        task.*.asyncionext = asyncio.*.tasks.asyncionext;
        if (task.*.asyncionext != null) {
            task.*.asyncionext.*.asyncioprev = task;
        }
        asyncio.*.tasks.asyncionext = task;
        if (!false) break;
    }
    _ = SDL_AddAtomicInt_REAL(&queue.*.tasks_inflight, 1);
    SDL_UnlockMutex_REAL(asyncio.*.lock);
    const queued: bool = (if (reading) @as(c_int, @intFromBool(asyncio.*.iface.read.?(asyncio.*.userdata, task))) else @as(c_int, @intFromBool(asyncio.*.iface.write.?(asyncio.*.userdata, task)))) != 0;
    _ = &queued;
    if (!queued) {
        _ = SDL_AddAtomicInt_REAL(&queue.*.tasks_inflight, -@as(c_int, 1));
        SDL_LockMutex_REAL(asyncio.*.lock);
        while (true) {
            if (task.*.asyncionext != null) {
                task.*.asyncionext.*.asyncioprev = task.*.asyncioprev;
            }
            task.*.asyncioprev.*.asyncionext = task.*.asyncionext;
            task.*.asyncioprev = blk: {
                const tmp = @as([*c]struct_SDL_AsyncIOTask, null);
                task.*.asyncionext = tmp;
                break :blk tmp;
            };
            if (!false) break;
        }
        SDL_UnlockMutex_REAL(asyncio.*.lock);
        SDL_free_REAL(@ptrCast(@alignCast(task)));
        task = null;
    }
    return @as(?*anyopaque, @ptrCast(@alignCast(task))) != @as(?*anyopaque, null);
}
pub export fn SDL_ReadAsyncIO_REAL(asyncio: [*c]SDL_AsyncIO, ptr: ?*anyopaque, offset: Uint64, size: Uint64, queue: [*c]SDL_AsyncIOQueue, userdata: ?*anyopaque) bool {
    @setEvalBranchQuota(100000);
    return RequestAsyncIO(@"true" != 0, asyncio, ptr, offset, size, queue, userdata);
}
pub export fn SDL_WriteAsyncIO_REAL(asyncio: [*c]SDL_AsyncIO, ptr: ?*anyopaque, offset: Uint64, size: Uint64, queue: [*c]SDL_AsyncIOQueue, userdata: ?*anyopaque) bool {
    @setEvalBranchQuota(100000);
    return RequestAsyncIO(@"false" != 0, asyncio, ptr, offset, size, queue, userdata);
}
pub export fn SDL_CloseAsyncIO_REAL(asyncio: [*c]SDL_AsyncIO, flush: bool, queue: [*c]SDL_AsyncIOQueue, userdata: ?*anyopaque) bool {
    @setEvalBranchQuota(100000);
    if (!(asyncio != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("asyncio"))));
    }
    if (!(queue != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("queue"))));
    }
    SDL_LockMutex_REAL(asyncio.*.lock);
    if (asyncio.*.closing != null) {
        SDL_UnlockMutex_REAL(asyncio.*.lock);
        return SDL_SetError_REAL("Already closing");
    }
    var task: [*c]SDL_AsyncIOTask = undefined;
    task = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(task.*)))));
    _ = &task;
    if (task != null) {
        task.*.asyncio = asyncio;
        task.*.type = SDL_ASYNCIO_TASK_CLOSE;
        task.*.app_userdata = userdata;
        task.*.queue = queue;
        task.*.flush = flush;
        asyncio.*.closing = task;
        if (@as(?*anyopaque, @ptrCast(@alignCast(asyncio.*.tasks.asyncionext))) == @as(?*anyopaque, null)) {
            while (true) {
                task.*.asyncioprev = &asyncio.*.tasks;
                task.*.asyncionext = asyncio.*.tasks.asyncionext;
                if (task.*.asyncionext != null) {
                    task.*.asyncionext.*.asyncioprev = task;
                }
                asyncio.*.tasks.asyncionext = task;
                if (!false) break;
            }
            _ = SDL_AddAtomicInt_REAL(&queue.*.tasks_inflight, 1);
            if (!asyncio.*.iface.close.?(asyncio.*.userdata, task)) {
                _ = SDL_AddAtomicInt_REAL(&queue.*.tasks_inflight, -@as(c_int, 1));
                while (true) {
                    if (task.*.asyncionext != null) {
                        task.*.asyncionext.*.asyncioprev = task.*.asyncioprev;
                    }
                    task.*.asyncioprev.*.asyncionext = task.*.asyncionext;
                    task.*.asyncioprev = blk: {
                        const tmp = @as([*c]struct_SDL_AsyncIOTask, null);
                        task.*.asyncionext = tmp;
                        break :blk tmp;
                    };
                    if (!false) break;
                }
                SDL_free_REAL(@ptrCast(@alignCast(task)));
                task = blk: {
                    const tmp = @as([*c]SDL_AsyncIOTask, null);
                    asyncio.*.closing = tmp;
                    break :blk tmp;
                };
            }
        }
    }
    SDL_UnlockMutex_REAL(asyncio.*.lock);
    return @as(?*anyopaque, @ptrCast(@alignCast(task))) != @as(?*anyopaque, null);
}
pub export fn SDL_CreateAsyncIOQueue_REAL() [*c]SDL_AsyncIOQueue {
    @setEvalBranchQuota(100000);
    var queue: [*c]SDL_AsyncIOQueue = undefined;
    queue = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(queue.*)))));
    _ = &queue;
    if (queue != null) {
        _ = SDL_SetAtomicInt_REAL(&queue.*.tasks_inflight, 0);
        if (!SDL_SYS_CreateAsyncIOQueue(queue)) {
            SDL_free_REAL(@ptrCast(@alignCast(queue)));
            return null;
        }
    }
    return queue;
}
pub fn GetAsyncIOTaskOutcome(task: [*c]SDL_AsyncIOTask, outcome: [*c]SDL_AsyncIOOutcome) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [21:0]u8 = "GetAsyncIOTaskOutcome".*;
    };
    _ = &static_local___func__;
    if (!(task != null) or !(outcome != null)) {
        return @"false" != 0;
    }
    var asyncio: [*c]SDL_AsyncIO = task.*.asyncio;
    _ = &asyncio;
    _ = memset(@ptrCast(@alignCast(outcome)), 0, @sizeOf(@TypeOf(outcome.*)));
    outcome.*.asyncio = @ptrCast(@alignCast(if (asyncio.*.oneshot) @as(?*anyopaque, null) else @as(?*anyopaque, @ptrCast(@alignCast(asyncio)))));
    outcome.*.result = task.*.result;
    outcome.*.type = task.*.type;
    outcome.*.buffer = task.*.buffer;
    outcome.*.offset = task.*.offset;
    outcome.*.bytes_requested = task.*.requested_size;
    outcome.*.bytes_transferred = task.*.result_size;
    outcome.*.userdata = task.*.app_userdata;
    var lock: ?*SDL_Mutex = asyncio.*.lock;
    _ = &lock;
    SDL_LockMutex_REAL(lock);
    while (true) {
        if (task.*.asyncionext != null) {
            task.*.asyncionext.*.asyncioprev = task.*.asyncioprev;
        }
        task.*.asyncioprev.*.asyncionext = task.*.asyncionext;
        task.*.asyncioprev = blk: {
            const tmp = @as([*c]struct_SDL_AsyncIOTask, null);
            task.*.asyncionext = tmp;
            break :blk tmp;
        };
        if (!false) break;
    }
    var closing: [*c]SDL_AsyncIOTask = asyncio.*.closing;
    _ = &closing;
    if (((closing != null) and (task != closing)) and (@as(?*anyopaque, @ptrCast(@alignCast(asyncio.*.tasks.asyncionext))) == @as(?*anyopaque, null))) {
        while (true) {
            closing.*.asyncioprev = &asyncio.*.tasks;
            closing.*.asyncionext = asyncio.*.tasks.asyncionext;
            if (closing.*.asyncionext != null) {
                closing.*.asyncionext.*.asyncioprev = closing;
            }
            asyncio.*.tasks.asyncionext = closing;
            if (!false) break;
        }
        _ = SDL_AddAtomicInt_REAL(&closing.*.queue.*.tasks_inflight, 1);
        const async_close_task_was_queued: bool = asyncio.*.iface.close.?(asyncio.*.userdata, closing);
        _ = &async_close_task_was_queued;
        while (true) {
            while (!async_close_task_was_queued) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "async_close_task_was_queued",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_asyncio.c", 237);
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
        if (!async_close_task_was_queued) {
            _ = SDL_AddAtomicInt_REAL(&closing.*.queue.*.tasks_inflight, -@as(c_int, 1));
        }
    }
    SDL_UnlockMutex_REAL(lock);
    var retval: bool = @"true" != 0;
    _ = &retval;
    if ((closing != null) and (task == closing)) {
        if (asyncio.*.oneshot) {
            retval = @"false" != 0;
        }
        asyncio.*.iface.destroy.?(asyncio.*.userdata);
        SDL_DestroyMutex_REAL(asyncio.*.lock);
        SDL_free_REAL(@ptrCast(@alignCast(asyncio)));
    }
    _ = SDL_AddAtomicInt_REAL(&task.*.queue.*.tasks_inflight, -@as(c_int, 1));
    SDL_free_REAL(@ptrCast(@alignCast(task)));
    return retval;
}
pub export fn SDL_GetAsyncIOResult_REAL(queue: [*c]SDL_AsyncIOQueue, outcome: [*c]SDL_AsyncIOOutcome) bool {
    @setEvalBranchQuota(100000);
    if (!(queue != null) or !(outcome != null)) {
        return @"false" != 0;
    }
    return GetAsyncIOTaskOutcome(queue.*.iface.get_results.?(queue.*.userdata), outcome);
}
pub export fn SDL_WaitAsyncIOResult_REAL(queue: [*c]SDL_AsyncIOQueue, outcome: [*c]SDL_AsyncIOOutcome, timeoutMS: Sint32) bool {
    @setEvalBranchQuota(100000);
    if (!(queue != null) or !(outcome != null)) {
        return @"false" != 0;
    }
    return GetAsyncIOTaskOutcome(queue.*.iface.wait_results.?(queue.*.userdata, timeoutMS), outcome);
}
pub export fn SDL_SignalAsyncIOQueue_REAL(queue: [*c]SDL_AsyncIOQueue) void {
    @setEvalBranchQuota(100000);
    if (queue != null) {
        queue.*.iface.signal.?(queue.*.userdata);
    }
}
pub export fn SDL_DestroyAsyncIOQueue_REAL(queue: [*c]SDL_AsyncIOQueue) void {
    @setEvalBranchQuota(100000);
    if (queue != null) {
        while (SDL_GetAtomicInt_REAL(&queue.*.tasks_inflight) > @as(c_int, 0)) {
            var task: [*c]SDL_AsyncIOTask = queue.*.iface.wait_results.?(queue.*.userdata, -@as(c_int, 1));
            _ = &task;
            if (task != null) {
                if (task.*.asyncio.*.oneshot) {
                    SDL_free_REAL(task.*.buffer);
                    task.*.buffer = null;
                }
                var outcome: SDL_AsyncIOOutcome = undefined;
                _ = &outcome;
                _ = GetAsyncIOTaskOutcome(task, &outcome);
            }
        }
        queue.*.iface.destroy.?(queue.*.userdata);
        SDL_free_REAL(@ptrCast(@alignCast(queue)));
    }
}
pub export fn SDL_QuitAsyncIO() void {
    @setEvalBranchQuota(100000);
    SDL_SYS_QuitAsyncIO();
}
pub export fn SDL_LoadFileAsync_REAL(file: [*c]const u8, queue: [*c]SDL_AsyncIOQueue, userdata: ?*anyopaque) bool {
    @setEvalBranchQuota(100000);
    if (!(file != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("file"))));
    }
    if (!(queue != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("queue"))));
    }
    var retval: bool = @"false" != 0;
    _ = &retval;
    var asyncio: [*c]SDL_AsyncIO = SDL_AsyncIOFromFile_REAL(file, "r");
    _ = &asyncio;
    if (asyncio != null) {
        asyncio.*.oneshot = @"true" != 0;
        var ptr: [*c]Uint8 = null;
        _ = &ptr;
        const flen: Sint64 = SDL_GetAsyncIOSize_REAL(asyncio);
        _ = &flen;
        if (flen >= @as(Sint64, 0)) {
            ptr = @ptrCast(@alignCast(SDL_malloc_REAL(@bitCast(@as(c_long, flen + @as(Sint64, 1))))));
            if (ptr != null) {
                ptr[@bitCast(@as(isize, @intCast(flen)))] = '\x00';
                retval = SDL_ReadAsyncIO_REAL(asyncio, @ptrCast(@alignCast(ptr)), 0, @bitCast(@as(c_long, flen)), queue, userdata);
                if (!retval) {
                    SDL_free_REAL(@ptrCast(@alignCast(ptr)));
                }
            }
        }
        _ = SDL_CloseAsyncIO_REAL(asyncio, @"false" != 0, queue, userdata);
    }
    return retval;
}

pub const SDL_AsyncIOFromFile = SDL_AsyncIOFromFile_REAL;
pub const SDL_GetAsyncIOSize = SDL_GetAsyncIOSize_REAL;
pub const SDL_ReadAsyncIO = SDL_ReadAsyncIO_REAL;
pub const SDL_WriteAsyncIO = SDL_WriteAsyncIO_REAL;
pub const SDL_CloseAsyncIO = SDL_CloseAsyncIO_REAL;
pub const SDL_CreateAsyncIOQueue = SDL_CreateAsyncIOQueue_REAL;
pub const SDL_DestroyAsyncIOQueue = SDL_DestroyAsyncIOQueue_REAL;
pub const SDL_GetAsyncIOResult = SDL_GetAsyncIOResult_REAL;
pub const SDL_WaitAsyncIOResult = SDL_WaitAsyncIOResult_REAL;
pub const SDL_SignalAsyncIOQueue = SDL_SignalAsyncIOQueue_REAL;
pub const SDL_LoadFileAsync = SDL_LoadFileAsync_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
