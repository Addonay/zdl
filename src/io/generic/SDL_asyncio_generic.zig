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
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub const Sint32 = i32;
pub const Sint64 = i64;
pub const Uint64 = u64;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_snprintf_REAL(text: [*c]u8, maxlen: usize, fmt: [*c]const u8, ...) c_int;
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
pub const SDL_AsyncIO = struct_SDL_AsyncIO;
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
pub const SDL_ASYNCIO_COMPLETE: c_int = 0;
pub const SDL_ASYNCIO_FAILURE: c_int = 1;
pub const SDL_ASYNCIO_CANCELED: c_int = 2;
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
pub const struct_SDL_Thread = opaque {
};
pub const SDL_Thread = struct_SDL_Thread;
pub const SDL_ThreadID = Uint64;
pub const SDL_ThreadFunction = ?*const fn (data: ?*anyopaque) callconv(.c) c_int;
pub extern fn SDL_CreateThreadRuntime_REAL(@"fn": SDL_ThreadFunction, name: [*c]const u8, data: ?*anyopaque, pfnBeginThread: SDL_FunctionPointer, pfnEndThread: SDL_FunctionPointer) ?*SDL_Thread;
pub extern fn SDL_DetachThread_REAL(thread: ?*SDL_Thread) void;
pub extern fn SDL_CreateMutex_REAL() ?*SDL_Mutex;
pub extern fn SDL_LockMutex_REAL(mutex: ?*SDL_Mutex) void;
pub extern fn SDL_UnlockMutex_REAL(mutex: ?*SDL_Mutex) void;
pub extern fn SDL_DestroyMutex_REAL(mutex: ?*SDL_Mutex) void;
pub const struct_SDL_Condition = opaque {
};
pub const SDL_Condition = struct_SDL_Condition;
pub extern fn SDL_CreateCondition_REAL() ?*SDL_Condition;
pub extern fn SDL_DestroyCondition_REAL(cond: ?*SDL_Condition) void;
pub extern fn SDL_SignalCondition_REAL(cond: ?*SDL_Condition) void;
pub extern fn SDL_BroadcastCondition_REAL(cond: ?*SDL_Condition) void;
pub extern fn SDL_WaitCondition_REAL(cond: ?*SDL_Condition, mutex: ?*SDL_Mutex) void;
pub extern fn SDL_WaitConditionTimeout_REAL(cond: ?*SDL_Condition, mutex: ?*SDL_Mutex, timeoutMS: Sint32) bool;
pub const struct_SDL_InitState = extern struct {
    status: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
    thread: SDL_ThreadID = 0,
    reserved: ?*anyopaque = null,
};
pub const SDL_InitState = struct_SDL_InitState;
pub extern fn SDL_ShouldInit_REAL(state: [*c]SDL_InitState) bool;
pub extern fn SDL_ShouldQuit_REAL(state: [*c]SDL_InitState) bool;
pub extern fn SDL_SetInitialized_REAL(state: [*c]SDL_InitState, initialized: bool) void;
pub const SDL_IO_STATUS_READY: c_int = 0;
pub const SDL_IO_STATUS_EOF: c_int = 2;
pub const SDL_IO_STATUS_NOT_READY: c_int = 3;
pub const enum_SDL_IOStatus = c_uint;
pub const SDL_IOStatus = enum_SDL_IOStatus;
pub const SDL_IO_SEEK_SET: c_int = 0;
pub const enum_SDL_IOWhence = c_uint;
pub const SDL_IOWhence = enum_SDL_IOWhence;
pub const struct_SDL_IOStream = opaque {
};
pub const SDL_IOStream = struct_SDL_IOStream;
pub extern fn SDL_IOFromFile_REAL(file: [*c]const u8, mode: [*c]const u8) ?*SDL_IOStream;
pub extern fn SDL_CloseIO_REAL(context: ?*SDL_IOStream) bool;
pub extern fn SDL_GetIOStatus_REAL(context: ?*SDL_IOStream) SDL_IOStatus;
pub extern fn SDL_GetIOSize_REAL(context: ?*SDL_IOStream) Sint64;
pub extern fn SDL_SeekIO_REAL(context: ?*SDL_IOStream, offset: Sint64, whence: SDL_IOWhence) Sint64;
pub extern fn SDL_ReadIO_REAL(context: ?*SDL_IOStream, ptr: ?*anyopaque, size: usize) usize;
pub extern fn SDL_WriteIO_REAL(context: ?*SDL_IOStream, ptr: ?*const anyopaque, size: usize) usize;
pub extern fn SDL_FlushIO_REAL(context: ?*SDL_IOStream) bool;
pub extern fn SDL_GetNumLogicalCPUCores_REAL() c_int;
pub extern fn SDL_SYS_AsyncIOFromFile(file: [*c]const u8, mode: [*c]const u8, asyncio: [*c]SDL_AsyncIO) bool;
pub extern fn SDL_SYS_CreateAsyncIOQueue(queue: [*c]SDL_AsyncIOQueue) bool;
pub extern fn SDL_SYS_QuitAsyncIO() void;
pub const struct_GenericAsyncIOQueueData = extern struct {
    lock: ?*SDL_Mutex = null,
    condition: ?*SDL_Condition = null,
    completed_tasks: SDL_AsyncIOTask = @import("std").mem.zeroes(SDL_AsyncIOTask),
};
pub const GenericAsyncIOQueueData = struct_GenericAsyncIOQueueData;
pub const struct_GenericAsyncIOData = extern struct {
    lock: ?*SDL_Mutex = null,
    io: ?*SDL_IOStream = null,
};
pub const GenericAsyncIOData = struct_GenericAsyncIOData;
pub fn AsyncIOTaskComplete(task: [*c]SDL_AsyncIOTask) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [19:0]u8 = "AsyncIOTaskComplete".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!(task.*.queue != null)) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "task->queue",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_asyncio_generic.c", 55);
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
    var data: [*c]GenericAsyncIOQueueData = @ptrCast(@alignCast(task.*.queue.*.userdata));
    _ = &data;
    SDL_LockMutex_REAL(data.*.lock);
    while (true) {
        task.*.queueprev = &data.*.completed_tasks;
        task.*.queuenext = data.*.completed_tasks.queuenext;
        if (task.*.queuenext != null) {
            task.*.queuenext.*.queueprev = task;
        }
        data.*.completed_tasks.queuenext = task;
        if (!false) break;
    }
    SDL_SignalCondition_REAL(data.*.condition);
    SDL_UnlockMutex_REAL(data.*.lock);
}
pub fn SynchronousIO(task: [*c]SDL_AsyncIOTask) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [13:0]u8 = "SynchronousIO".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!(task.*.result != @as(SDL_AsyncIOResult, SDL_ASYNCIO_CANCELED))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "task->result != SDL_ASYNCIO_CANCELED",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_asyncio_generic.c", 67);
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
    var data: [*c]GenericAsyncIOData = @ptrCast(@alignCast(task.*.asyncio.*.userdata));
    _ = &data;
    var io: ?*SDL_IOStream = data.*.io;
    _ = &io;
    const size: usize = task.*.requested_size;
    _ = &size;
    var ptr: ?*anyopaque = task.*.buffer;
    _ = &ptr;
    SDL_LockMutex_REAL(data.*.lock);
    if (task.*.type == @as(SDL_AsyncIOTaskType, SDL_ASYNCIO_TASK_CLOSE)) {
        var okay: bool = @"true" != 0;
        _ = &okay;
        if (task.*.flush) {
            okay = SDL_FlushIO_REAL(data.*.io);
        }
        okay = SDL_CloseIO_REAL(data.*.io) and okay;
        task.*.result = @bitCast(if (okay) SDL_ASYNCIO_COMPLETE else SDL_ASYNCIO_FAILURE);
    } else if (SDL_SeekIO_REAL(io, @bitCast(@as(c_ulong, @truncate(task.*.offset))), SDL_IO_SEEK_SET) < @as(Sint64, 0)) {
        task.*.result = SDL_ASYNCIO_FAILURE;
    } else {
        const writing: bool = task.*.type == @as(SDL_AsyncIOTaskType, SDL_ASYNCIO_TASK_WRITE);
        _ = &writing;
        task.*.result_size = if (writing) SDL_WriteIO_REAL(io, ptr, size) else SDL_ReadIO_REAL(io, ptr, size);
        if (task.*.result_size == task.*.requested_size) {
            task.*.result = SDL_ASYNCIO_COMPLETE;
        } else {
            if (writing) {
                task.*.result = SDL_ASYNCIO_FAILURE;
            } else {
                const status: SDL_IOStatus = SDL_GetIOStatus_REAL(io);
                _ = &status;
                while (true) {
                    while (!(status != @as(SDL_IOStatus, SDL_IO_STATUS_READY))) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "status != SDL_IO_STATUS_READY",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_asyncio_generic.c", 97);
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
                while (true) {
                    while (!(status != @as(SDL_IOStatus, SDL_IO_STATUS_NOT_READY))) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "status != SDL_IO_STATUS_NOT_READY",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_asyncio_generic.c", 98);
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
                task.*.result = @bitCast(if (status == @as(SDL_IOStatus, SDL_IO_STATUS_EOF)) SDL_ASYNCIO_COMPLETE else SDL_ASYNCIO_FAILURE);
            }
        }
    }
    SDL_UnlockMutex_REAL(data.*.lock);
    AsyncIOTaskComplete(task);
}
pub var threadpool_init: SDL_InitState = @import("std").mem.zeroes(SDL_InitState);
pub var threadpool_lock: ?*SDL_Mutex = null;
pub var stop_threadpool: bool = @"false" != 0;
pub var threadpool_tasks: SDL_AsyncIOTask = @import("std").mem.zeroes(SDL_AsyncIOTask);
pub var threadpool_condition: ?*SDL_Condition = null;
pub var max_threadpool_threads: c_int = 0;
pub var running_threadpool_threads: c_int = 0;
pub var idle_threadpool_threads: c_int = 0;
pub var threadpool_threads_spun: c_int = 0;
pub fn AsyncIOThreadpoolWorker(_: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    SDL_LockMutex_REAL(threadpool_lock);
    while (!stop_threadpool) {
        var task: [*c]SDL_AsyncIOTask = threadpool_tasks.threadpoolnext;
        _ = &task;
        if (!(task != null)) {
            idle_threadpool_threads += 1;
            const rc: bool = SDL_WaitConditionTimeout_REAL(threadpool_condition, threadpool_lock, 30000);
            _ = &rc;
            idle_threadpool_threads -= 1;
            if (!rc) {
                if (idle_threadpool_threads != 0) {
                    break;
                }
            }
            continue;
        }
        while (true) {
            if (task.*.threadpoolnext != null) {
                task.*.threadpoolnext.*.threadpoolprev = task.*.threadpoolprev;
            }
            task.*.threadpoolprev.*.threadpoolnext = task.*.threadpoolnext;
            task.*.threadpoolprev = blk: {
                const tmp = @as([*c]struct_SDL_AsyncIOTask, null);
                task.*.threadpoolnext = tmp;
                break :blk tmp;
            };
            if (!false) break;
        }
        SDL_UnlockMutex_REAL(threadpool_lock);
        SynchronousIO(task);
        SDL_LockMutex_REAL(threadpool_lock);
    }
    running_threadpool_threads -= 1;
    if (stop_threadpool) {
        SDL_BroadcastCondition_REAL(threadpool_condition);
    }
    SDL_UnlockMutex_REAL(threadpool_lock);
    return 0;
}
pub fn MaybeSpinNewWorkerThread() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if ((idle_threadpool_threads == @as(c_int, 0)) and (running_threadpool_threads < max_threadpool_threads)) {
        var threadname: [32]u8 = undefined;
        _ = &threadname;
        _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&threadname)), @sizeOf(@TypeOf(threadname)), "SDLasyncio%d", threadpool_threads_spun);
        var thread: ?*SDL_Thread = SDL_CreateThreadRuntime_REAL(AsyncIOThreadpoolWorker, @ptrCast(@alignCast(&threadname)), null, null, null);
        _ = &thread;
        if (@as(?*anyopaque, @ptrCast(@alignCast(thread))) == @as(?*anyopaque, null)) {
            return @"false" != 0;
        }
        SDL_DetachThread_REAL(thread);
        running_threadpool_threads += 1;
        threadpool_threads_spun += 1;
    }
    return @"true" != 0;
}
pub fn QueueAsyncIOTask(task: [*c]SDL_AsyncIOTask) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [16:0]u8 = "QueueAsyncIOTask".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(task))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "task != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_asyncio_generic.c", 182);
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
    SDL_LockMutex_REAL(threadpool_lock);
    if (stop_threadpool) {
        task.*.result = SDL_ASYNCIO_CANCELED;
        AsyncIOTaskComplete(task);
    } else {
        while (true) {
            task.*.threadpoolprev = &threadpool_tasks;
            task.*.threadpoolnext = threadpool_tasks.threadpoolnext;
            if (task.*.threadpoolnext != null) {
                task.*.threadpoolnext.*.threadpoolprev = task;
            }
            threadpool_tasks.threadpoolnext = task;
            if (!false) break;
        }
        _ = MaybeSpinNewWorkerThread();
        SDL_BroadcastCondition_REAL(threadpool_condition);
    }
    SDL_UnlockMutex_REAL(threadpool_lock);
}
pub fn PrepareThreadpool() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var okay: bool = @"true" != 0;
    _ = &okay;
    if (SDL_ShouldInit_REAL(&threadpool_init)) {
        max_threadpool_threads = (SDL_GetNumLogicalCPUCores_REAL() * @as(c_int, 2)) + @as(c_int, 1);
        max_threadpool_threads = if (max_threadpool_threads < @as(c_int, 1)) @as(c_int, 1) else if (max_threadpool_threads > @as(c_int, 8)) @as(c_int, 8) else max_threadpool_threads;
        okay = okay and (@as(?*anyopaque, @ptrCast(@alignCast(blk: {
            const tmp = SDL_CreateMutex_REAL();
            threadpool_lock = tmp;
            break :blk tmp;
        }))) != @as(?*anyopaque, null));
        okay = okay and (@as(?*anyopaque, @ptrCast(@alignCast(blk: {
            const tmp = SDL_CreateCondition_REAL();
            threadpool_condition = tmp;
            break :blk tmp;
        }))) != @as(?*anyopaque, null));
        okay = okay and MaybeSpinNewWorkerThread();
        if (!okay) {
            if (threadpool_condition != null) {
                SDL_DestroyCondition_REAL(threadpool_condition);
                threadpool_condition = null;
            }
            if (threadpool_lock != null) {
                SDL_DestroyMutex_REAL(threadpool_lock);
                threadpool_lock = null;
            }
        }
        SDL_SetInitialized_REAL(&threadpool_init, okay);
    }
    return okay;
}
pub fn ShutdownThreadpool() callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (SDL_ShouldQuit_REAL(&threadpool_init)) {
        SDL_LockMutex_REAL(threadpool_lock);
        var task: [*c]SDL_AsyncIOTask = undefined;
        _ = &task;
        while (@as(?*anyopaque, @ptrCast(@alignCast(blk: {
            const tmp = threadpool_tasks.threadpoolnext;
            task = tmp;
            break :blk tmp;
        }))) != @as(?*anyopaque, null)) {
            while (true) {
                if (task.*.threadpoolnext != null) {
                    task.*.threadpoolnext.*.threadpoolprev = task.*.threadpoolprev;
                }
                task.*.threadpoolprev.*.threadpoolnext = task.*.threadpoolnext;
                task.*.threadpoolprev = blk: {
                    const tmp = @as([*c]struct_SDL_AsyncIOTask, null);
                    task.*.threadpoolnext = tmp;
                    break :blk tmp;
                };
                if (!false) break;
            }
            task.*.result = SDL_ASYNCIO_CANCELED;
            AsyncIOTaskComplete(task);
        }
        stop_threadpool = @"true" != 0;
        SDL_BroadcastCondition_REAL(threadpool_condition);
        while (running_threadpool_threads > @as(c_int, 0)) {
            SDL_WaitCondition_REAL(threadpool_condition, threadpool_lock);
        }
        SDL_UnlockMutex_REAL(threadpool_lock);
        SDL_DestroyMutex_REAL(threadpool_lock);
        threadpool_lock = null;
        SDL_DestroyCondition_REAL(threadpool_condition);
        threadpool_condition = null;
        max_threadpool_threads = blk: {
            const tmp = blk_1: {
                const tmp_2 = blk_2: {
                    const tmp_3 = @as(c_int, 0);
                    threadpool_threads_spun = tmp_3;
                    break :blk_2 tmp_3;
                };
                idle_threadpool_threads = tmp_2;
                break :blk_1 tmp_2;
            };
            running_threadpool_threads = tmp;
            break :blk tmp;
        };
        stop_threadpool = @"false" != 0;
        SDL_SetInitialized_REAL(&threadpool_init, @"false" != 0);
    }
}
pub fn generic_asyncio_size(userdata: ?*anyopaque) callconv(.c) Sint64 {
    @setEvalBranchQuota(100000);
    var data: [*c]GenericAsyncIOData = @ptrCast(@alignCast(userdata));
    _ = &data;
    return SDL_GetIOSize_REAL(data.*.io);
}
pub fn generic_asyncio_io(_: ?*anyopaque, task: [*c]SDL_AsyncIOTask) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return task.*.queue.*.iface.queue_task.?(task.*.queue.*.userdata, task);
}
pub fn generic_asyncio_destroy(userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var data: [*c]GenericAsyncIOData = @ptrCast(@alignCast(userdata));
    _ = &data;
    SDL_DestroyMutex_REAL(data.*.lock);
    SDL_free_REAL(@ptrCast(@alignCast(data)));
}
pub fn generic_asyncioqueue_queue_task(_: ?*anyopaque, task: [*c]SDL_AsyncIOTask) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    QueueAsyncIOTask(task);
    return @"true" != 0;
}
pub fn generic_asyncioqueue_cancel_task(_: ?*anyopaque, task: [*c]SDL_AsyncIOTask) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_LockMutex_REAL(threadpool_lock);
    if (@as(?*anyopaque, @ptrCast(@alignCast(task.*.threadpoolprev))) != @as(?*anyopaque, null)) {
        while (true) {
            if (task.*.threadpoolnext != null) {
                task.*.threadpoolnext.*.threadpoolprev = task.*.threadpoolprev;
            }
            task.*.threadpoolprev.*.threadpoolnext = task.*.threadpoolnext;
            task.*.threadpoolprev = blk: {
                const tmp = @as([*c]struct_SDL_AsyncIOTask, null);
                task.*.threadpoolnext = tmp;
                break :blk tmp;
            };
            if (!false) break;
        }
        task.*.result = SDL_ASYNCIO_CANCELED;
        AsyncIOTaskComplete(task);
    }
    SDL_UnlockMutex_REAL(threadpool_lock);
}
pub fn generic_asyncioqueue_get_results(userdata: ?*anyopaque) callconv(.c) [*c]SDL_AsyncIOTask {
    @setEvalBranchQuota(100000);
    var data: [*c]GenericAsyncIOQueueData = @ptrCast(@alignCast(userdata));
    _ = &data;
    SDL_LockMutex_REAL(data.*.lock);
    var task: [*c]SDL_AsyncIOTask = data.*.completed_tasks.queuenext;
    _ = &task;
    if (task != null) {
        while (true) {
            if (task.*.queuenext != null) {
                task.*.queuenext.*.queueprev = task.*.queueprev;
            }
            task.*.queueprev.*.queuenext = task.*.queuenext;
            task.*.queueprev = blk: {
                const tmp = @as([*c]struct_SDL_AsyncIOTask, null);
                task.*.queuenext = tmp;
                break :blk tmp;
            };
            if (!false) break;
        }
    }
    SDL_UnlockMutex_REAL(data.*.lock);
    return task;
}
pub fn generic_asyncioqueue_wait_results(userdata: ?*anyopaque, timeoutMS: Sint32) callconv(.c) [*c]SDL_AsyncIOTask {
    @setEvalBranchQuota(100000);
    var data: [*c]GenericAsyncIOQueueData = @ptrCast(@alignCast(userdata));
    _ = &data;
    SDL_LockMutex_REAL(data.*.lock);
    var task: [*c]SDL_AsyncIOTask = data.*.completed_tasks.queuenext;
    _ = &task;
    if (!(task != null)) {
        _ = SDL_WaitConditionTimeout_REAL(data.*.condition, data.*.lock, timeoutMS);
        task = data.*.completed_tasks.queuenext;
    }
    if (task != null) {
        while (true) {
            if (task.*.queuenext != null) {
                task.*.queuenext.*.queueprev = task.*.queueprev;
            }
            task.*.queueprev.*.queuenext = task.*.queuenext;
            task.*.queueprev = blk: {
                const tmp = @as([*c]struct_SDL_AsyncIOTask, null);
                task.*.queuenext = tmp;
                break :blk tmp;
            };
            if (!false) break;
        }
    }
    SDL_UnlockMutex_REAL(data.*.lock);
    return task;
}
pub fn generic_asyncioqueue_signal(userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var data: [*c]GenericAsyncIOQueueData = @ptrCast(@alignCast(userdata));
    _ = &data;
    SDL_LockMutex_REAL(data.*.lock);
    SDL_BroadcastCondition_REAL(data.*.condition);
    SDL_UnlockMutex_REAL(data.*.lock);
}
pub fn generic_asyncioqueue_destroy(userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var data: [*c]GenericAsyncIOQueueData = @ptrCast(@alignCast(userdata));
    _ = &data;
    SDL_DestroyMutex_REAL(data.*.lock);
    SDL_DestroyCondition_REAL(data.*.condition);
    SDL_free_REAL(@ptrCast(@alignCast(data)));
}
pub export fn SDL_SYS_CreateAsyncIOQueue_Generic(queue: [*c]SDL_AsyncIOQueue) bool {
    @setEvalBranchQuota(100000);
    if (!PrepareThreadpool()) {
        return @"false" != 0;
    }
    var data: [*c]GenericAsyncIOQueueData = undefined;
    data = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(data.*)))));
    _ = &data;
    if (!(data != null)) {
        return @"false" != 0;
    }
    data.*.lock = SDL_CreateMutex_REAL();
    if (!(data.*.lock != null)) {
        SDL_free_REAL(@ptrCast(@alignCast(data)));
        return @"false" != 0;
    }
    data.*.condition = SDL_CreateCondition_REAL();
    if (!(data.*.condition != null)) {
        SDL_DestroyMutex_REAL(data.*.lock);
        SDL_free_REAL(@ptrCast(@alignCast(data)));
        return @"false" != 0;
    }
    const static_local_SDL_AsyncIOQueue_Generic = struct {
        const SDL_AsyncIOQueue_Generic: SDL_AsyncIOQueueInterface = SDL_AsyncIOQueueInterface{
            .queue_task = generic_asyncioqueue_queue_task,
            .cancel_task = generic_asyncioqueue_cancel_task,
            .get_results = generic_asyncioqueue_get_results,
            .wait_results = generic_asyncioqueue_wait_results,
            .signal = generic_asyncioqueue_signal,
            .destroy = generic_asyncioqueue_destroy,
        };
    };
    _ = &static_local_SDL_AsyncIOQueue_Generic;
    {
        comptime {
            if (!(@sizeOf(@TypeOf((&queue.*.iface).*)) == @sizeOf(@TypeOf((&static_local_SDL_AsyncIOQueue_Generic.SDL_AsyncIOQueue_Generic).*)))) @compileError("static assertion failed \"sizeof (*(&queue->iface)) == sizeof (*( &SDL_AsyncIOQueue_Generic))\"");
        }
    }
    _ = memcpy(@ptrCast(@alignCast(&queue.*.iface)), @ptrCast(@alignCast(&static_local_SDL_AsyncIOQueue_Generic.SDL_AsyncIOQueue_Generic)), @sizeOf(@TypeOf((&static_local_SDL_AsyncIOQueue_Generic.SDL_AsyncIOQueue_Generic).*)));
    queue.*.userdata = @ptrCast(@alignCast(data));
    return @"true" != 0;
}
pub export fn SDL_SYS_AsyncIOFromFile_Generic(file: [*c]const u8, mode: [*c]const u8, asyncio: [*c]SDL_AsyncIO) bool {
    @setEvalBranchQuota(100000);
    if (!PrepareThreadpool()) {
        return @"false" != 0;
    }
    var data: [*c]GenericAsyncIOData = undefined;
    data = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(data.*)))));
    _ = &data;
    if (!(data != null)) {
        return @"false" != 0;
    }
    data.*.lock = SDL_CreateMutex_REAL();
    if (!(data.*.lock != null)) {
        SDL_free_REAL(@ptrCast(@alignCast(data)));
        return @"false" != 0;
    }
    data.*.io = SDL_IOFromFile_REAL(file, mode);
    if (!(data.*.io != null)) {
        SDL_DestroyMutex_REAL(data.*.lock);
        SDL_free_REAL(@ptrCast(@alignCast(data)));
        return @"false" != 0;
    }
    const static_local_SDL_AsyncIOFile_Generic = struct {
        const SDL_AsyncIOFile_Generic: SDL_AsyncIOInterface = SDL_AsyncIOInterface{
            .size = generic_asyncio_size,
            .read = generic_asyncio_io,
            .write = generic_asyncio_io,
            .close = generic_asyncio_io,
            .destroy = generic_asyncio_destroy,
        };
    };
    _ = &static_local_SDL_AsyncIOFile_Generic;
    {
        comptime {
            if (!(@sizeOf(@TypeOf((&asyncio.*.iface).*)) == @sizeOf(@TypeOf((&static_local_SDL_AsyncIOFile_Generic.SDL_AsyncIOFile_Generic).*)))) @compileError("static assertion failed \"sizeof (*(&asyncio->iface)) == sizeof (*( &SDL_AsyncIOFile_Generic))\"");
        }
    }
    _ = memcpy(@ptrCast(@alignCast(&asyncio.*.iface)), @ptrCast(@alignCast(&static_local_SDL_AsyncIOFile_Generic.SDL_AsyncIOFile_Generic)), @sizeOf(@TypeOf((&static_local_SDL_AsyncIOFile_Generic.SDL_AsyncIOFile_Generic).*)));
    asyncio.*.userdata = @ptrCast(@alignCast(data));
    return @"true" != 0;
}
pub export fn SDL_SYS_QuitAsyncIO_Generic() void {
    @setEvalBranchQuota(100000);
    ShutdownThreadpool();
}

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
