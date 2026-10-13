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
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Sint32 = i32;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub const Uint64 = u64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_realloc_REAL(mem: ?*anyopaque, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub const SDL_malloc_func = ?*const fn (size: usize) callconv(.c) ?*anyopaque;
pub const SDL_calloc_func = ?*const fn (nmemb: usize, size: usize) callconv(.c) ?*anyopaque;
pub const SDL_realloc_func = ?*const fn (mem: ?*anyopaque, size: usize) callconv(.c) ?*anyopaque;
pub const SDL_free_func = ?*const fn (mem: ?*anyopaque) callconv(.c) void;
pub extern fn SDL_GetOriginalMemoryFunctions_REAL(malloc_func: [*c]SDL_malloc_func, calloc_func: [*c]SDL_calloc_func, realloc_func: [*c]SDL_realloc_func, free_func: [*c]SDL_free_func) void;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
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
pub extern fn SDL_CompareAndSwapAtomicInt_REAL(a: [*c]SDL_AtomicInt, oldval: c_int, newval: c_int) bool;
pub extern fn SDL_SetAtomicInt_REAL(a: [*c]SDL_AtomicInt, v: c_int) c_int;
pub extern fn SDL_GetAtomicInt_REAL(a: [*c]SDL_AtomicInt) c_int;
pub extern fn SDL_AddAtomicInt_REAL(a: [*c]SDL_AtomicInt, v: c_int) c_int;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_PropertiesID = Uint32;
pub extern fn SDL_CreateProperties_REAL() SDL_PropertiesID;
pub extern fn SDL_SetPointerProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: ?*anyopaque) bool;
pub extern fn SDL_SetStringProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: [*c]const u8) bool;
pub extern fn SDL_SetNumberProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: Sint64) bool;
pub extern fn SDL_GetPointerProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: ?*anyopaque) ?*anyopaque;
pub extern fn SDL_GetStringProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: [*c]const u8) [*c]const u8;
pub extern fn SDL_GetNumberProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: Sint64) Sint64;
pub extern fn SDL_DestroyProperties_REAL(props: SDL_PropertiesID) void;
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
pub const SDL_TLSID = SDL_AtomicInt;
pub const enum_SDL_ThreadPriority = c_uint;
pub const SDL_ThreadPriority = enum_SDL_ThreadPriority;
pub const SDL_THREAD_UNKNOWN: c_int = 0;
pub const SDL_THREAD_ALIVE: c_int = 1;
pub const SDL_THREAD_DETACHED: c_int = 2;
pub const SDL_THREAD_COMPLETE: c_int = 3;
pub const enum_SDL_ThreadState = c_uint;
pub const SDL_ThreadState = enum_SDL_ThreadState;
pub const SDL_ThreadFunction = ?*const fn (data: ?*anyopaque) callconv(.c) c_int;
pub extern fn SDL_GetCurrentThreadID_REAL() SDL_ThreadID;
pub const SDL_TLSDestructorCallback = ?*const fn (value: ?*anyopaque) callconv(.c) void;
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
pub const struct_SDL_Condition = opaque {
};
pub const SDL_Condition = struct_SDL_Condition;
pub const SDL_INIT_STATUS_UNINITIALIZED: c_int = 0;
pub const SDL_INIT_STATUS_INITIALIZING: c_int = 1;
pub const SDL_INIT_STATUS_INITIALIZED: c_int = 2;
pub const SDL_INIT_STATUS_UNINITIALIZING: c_int = 3;
pub const struct_SDL_InitState = extern struct {
    status: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
    thread: SDL_ThreadID = 0,
    reserved: ?*anyopaque = null,
};
pub const SDL_InitState = struct_SDL_InitState;
pub extern fn SDL_Delay_REAL(ms: Uint32) void;
pub const SDL_OBJECT_TYPE_THREAD: c_int = 10;
pub const SDL_ObjectType = c_uint;
pub extern fn SDL_SetObjectValid(object: ?*anyopaque, @"type": SDL_ObjectType, valid: bool) void;
pub extern fn SDL_FindObject(object: ?*anyopaque, @"type": SDL_ObjectType) bool;
pub extern var SDL_object_validation: bool;
pub inline fn SDL_ObjectValid(object: ?*anyopaque, arg_type: SDL_ObjectType) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    if (!(object != null)) {
        return @"false" != 0;
    }
    if (!SDL_object_validation) {
        return @"true" != 0;
    }
    return SDL_FindObject(object, @"type");
}
pub extern fn SDL_GetPersistentString(string: [*c]const u8) [*c]const u8;
pub extern fn SDL_InitMainThread() void;
pub extern fn SDL_WaitSemaphoreTimeoutNS(sem: ?*SDL_Semaphore, timeoutNS: Sint64) bool;
pub extern fn SDL_WaitConditionTimeoutNS(cond: ?*SDL_Condition, mutex: ?*SDL_Mutex, timeoutNS: Sint64) bool;
pub const SDL_ErrorCode = c_uint;
const struct_unnamed_24 = extern struct {
    data: ?*anyopaque = null,
    destructor: ?*const fn (?*anyopaque) callconv(.c) void = null,
};
pub const SDL_TLSData = extern struct {
    limit: c_int = 0,
    _array: [0]struct_unnamed_24 = @import("std").mem.zeroes([0]struct_unnamed_24),
    pub fn array(_self: anytype) __helpers.FlexibleArrayType(@TypeOf(_self), @typeInfo(@TypeOf(_self.*._array)).array.child) {
        return @ptrCast(@alignCast(&_self.*._array));
    }
};
pub extern fn SDL_SYS_CreateThread(thread: [*c]SDL_Thread, pfnBeginThread: SDL_FunctionPointer, pfnEndThread: SDL_FunctionPointer) bool;
pub extern fn SDL_SYS_SetupThread(name: [*c]const u8) void;
pub extern fn SDL_SYS_SetThreadPriority(priority: SDL_ThreadPriority) bool;
pub extern fn SDL_SYS_WaitThread(thread: [*c]SDL_Thread) void;
pub extern fn SDL_SYS_DetachThread(thread: [*c]SDL_Thread) void;
pub extern fn SDL_SYS_InitTLSData() void;
pub extern fn SDL_SYS_GetTLSData() [*c]SDL_TLSData;
pub extern fn SDL_SYS_SetTLSData(data: [*c]SDL_TLSData) bool;
pub extern fn SDL_SYS_QuitTLSData() void;
pub var SDL_tls_allocated: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt);
pub var SDL_tls_id: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt);
pub export fn SDL_InitTLSData() void {
    @setEvalBranchQuota(100000);
    SDL_SYS_InitTLSData();
}
pub export fn SDL_GetTLS_REAL(id: [*c]SDL_TLSID) ?*anyopaque {
    @setEvalBranchQuota(100000);
    var storage: [*c]SDL_TLSData = undefined;
    _ = &storage;
    var storage_index: c_int = undefined;
    _ = &storage_index;
    if (@as(?*anyopaque, @ptrCast(@alignCast(id))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("id"))));
        return null;
    }
    storage_index = SDL_GetAtomicInt_REAL(id) - @as(c_int, 1);
    storage = SDL_SYS_GetTLSData();
    if ((!(storage != null) or (storage_index < @as(c_int, 0))) or (storage_index >= storage.*.limit)) {
        return null;
    }
    return storage.*.array()[@bitCast(@as(isize, @intCast(storage_index)))].data;
}
pub export fn SDL_SetTLS_REAL(id: [*c]SDL_TLSID, value: ?*const anyopaque, destructor: SDL_TLSDestructorCallback) bool {
    @setEvalBranchQuota(100000);
    var storage: [*c]SDL_TLSData = undefined;
    _ = &storage;
    var storage_index: c_int = undefined;
    _ = &storage_index;
    if (@as(?*anyopaque, @ptrCast(@alignCast(id))) == @as(?*anyopaque, null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("id"))));
    }
    SDL_InitTLSData();
    storage_index = SDL_GetAtomicInt_REAL(id) - @as(c_int, 1);
    if (storage_index < @as(c_int, 0)) {
        var new_id: c_int = SDL_AddAtomicInt_REAL(&SDL_tls_id, 1) + @as(c_int, 1);
        _ = &new_id;
        _ = SDL_CompareAndSwapAtomicInt_REAL(id, 0, new_id);
        storage_index = SDL_GetAtomicInt_REAL(id) - @as(c_int, 1);
    } else {
        var tls_id: c_int = SDL_GetAtomicInt_REAL(&SDL_tls_id);
        _ = &tls_id;
        while (storage_index >= tls_id) {
            if (SDL_CompareAndSwapAtomicInt_REAL(&SDL_tls_id, tls_id, storage_index + @as(c_int, 1))) {
                break;
            }
            tls_id = SDL_GetAtomicInt_REAL(&SDL_tls_id);
        }
    }
    storage = SDL_SYS_GetTLSData();
    if (!(storage != null) or (storage_index >= storage.*.limit)) {
        var i: c_uint = undefined;
        _ = &i;
        var oldlimit: c_uint = undefined;
        _ = &oldlimit;
        var newlimit: c_uint = undefined;
        _ = &newlimit;
        var new_storage: [*c]SDL_TLSData = undefined;
        _ = &new_storage;
        oldlimit = @bitCast(@as(c_int, if (storage != null) storage.*.limit else @as(c_int, 0)));
        newlimit = @bitCast(@as(c_int, storage_index + TLS_ALLOC_CHUNKSIZE));
        new_storage = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(storage)), @sizeOf(@TypeOf(storage.*)) +% (@as(c_ulong, newlimit) *% @sizeOf(@TypeOf(storage.*.array()[@as(c_int, 0)]))))));
        if (!(new_storage != null)) {
            return @"false" != 0;
        }
        storage = new_storage;
        storage.*.limit = @bitCast(@as(c_uint, @truncate(newlimit)));
        {
            i = oldlimit;
            while (i < newlimit) : (i +%= 1) {
                storage.*.array()[i].data = null;
                storage.*.array()[i].destructor = null;
            }
        }
        if (!SDL_SYS_SetTLSData(storage)) {
            SDL_free_REAL(@ptrCast(@alignCast(storage)));
            return @"false" != 0;
        }
        _ = SDL_AddAtomicInt_REAL(&SDL_tls_allocated, 1);
    }
    storage.*.array()[@bitCast(@as(isize, @intCast(storage_index)))].data = @as(?*anyopaque, @ptrCast(@alignCast(@constCast(value))));
    storage.*.array()[@bitCast(@as(isize, @intCast(storage_index)))].destructor = destructor;
    return @"true" != 0;
}
pub export fn SDL_CleanupTLS_REAL() void {
    @setEvalBranchQuota(100000);
    var storage: [*c]SDL_TLSData = undefined;
    _ = &storage;
    storage = SDL_SYS_GetTLSData();
    if (storage != null) {
        var i: c_int = undefined;
        _ = &i;
        {
            i = 0;
            while (i < storage.*.limit) : (i += 1) {
                if (storage.*.array()[@bitCast(@as(isize, @intCast(i)))].destructor != null) {
                    storage.*.array()[@bitCast(@as(isize, @intCast(i)))].destructor.?(storage.*.array()[@bitCast(@as(isize, @intCast(i)))].data);
                }
            }
        }
        _ = SDL_SYS_SetTLSData(null);
        SDL_free_REAL(@ptrCast(@alignCast(storage)));
        _ = SDL_AddAtomicInt_REAL(&SDL_tls_allocated, -@as(c_int, 1)) == @as(c_int, 1);
    }
}
pub export fn SDL_QuitTLSData() void {
    @setEvalBranchQuota(100000);
    SDL_CleanupTLS_REAL();
    if (SDL_GetAtomicInt_REAL(&SDL_tls_allocated) == @as(c_int, 0)) {
        SDL_SYS_QuitTLSData();
    } else {}
}
pub const struct_SDL_TLSEntry = extern struct {
    thread: SDL_ThreadID = 0,
    storage: [*c]SDL_TLSData = null,
    next: [*c]struct_SDL_TLSEntry = null,
};
pub const SDL_TLSEntry = struct_SDL_TLSEntry;
pub var SDL_generic_TLS_mutex: ?*SDL_Mutex = null;
pub var SDL_generic_TLS: [*c]SDL_TLSEntry = null;
pub export fn SDL_Generic_InitTLSData() void {
    @setEvalBranchQuota(100000);
    if (!(SDL_generic_TLS_mutex != null)) {
        SDL_generic_TLS_mutex = SDL_CreateMutex_REAL();
    }
}
pub export fn SDL_Generic_GetTLSData() [*c]SDL_TLSData {
    @setEvalBranchQuota(100000);
    var thread: SDL_ThreadID = SDL_GetCurrentThreadID_REAL();
    _ = &thread;
    var entry: [*c]SDL_TLSEntry = undefined;
    _ = &entry;
    var storage: [*c]SDL_TLSData = null;
    _ = &storage;
    SDL_LockMutex_REAL(SDL_generic_TLS_mutex);
    {
        entry = SDL_generic_TLS;
        while (entry != null) : (entry = entry.*.next) {
            if (entry.*.thread == thread) {
                storage = entry.*.storage;
                break;
            }
        }
    }
    SDL_UnlockMutex_REAL(SDL_generic_TLS_mutex);
    return storage;
}
pub export fn SDL_Generic_SetTLSData(data: [*c]SDL_TLSData) bool {
    @setEvalBranchQuota(100000);
    var thread: SDL_ThreadID = SDL_GetCurrentThreadID_REAL();
    _ = &thread;
    var prev: [*c]SDL_TLSEntry = undefined;
    _ = &prev;
    var entry: [*c]SDL_TLSEntry = undefined;
    _ = &entry;
    var result: bool = @"true" != 0;
    _ = &result;
    SDL_LockMutex_REAL(SDL_generic_TLS_mutex);
    prev = null;
    {
        entry = SDL_generic_TLS;
        while (entry != null) : (entry = entry.*.next) {
            if (entry.*.thread == thread) {
                if (data != null) {
                    entry.*.storage = data;
                } else {
                    if (prev != null) {
                        prev.*.next = entry.*.next;
                    } else {
                        SDL_generic_TLS = entry.*.next;
                    }
                    SDL_free_REAL(@ptrCast(@alignCast(entry)));
                }
                break;
            }
            prev = entry;
        }
    }
    if (!(entry != null) and (data != null)) {
        entry = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(@TypeOf(entry.*)))));
        if (entry != null) {
            entry.*.thread = thread;
            entry.*.storage = data;
            entry.*.next = SDL_generic_TLS;
            SDL_generic_TLS = entry;
        } else {
            result = @"false" != 0;
        }
    }
    SDL_UnlockMutex_REAL(SDL_generic_TLS_mutex);
    return result;
}
pub export fn SDL_Generic_QuitTLSData() void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [23:0]u8 = "SDL_Generic_QuitTLSData".*;
    };
    _ = &static_local___func__;
    var entry: [*c]SDL_TLSEntry = undefined;
    _ = &entry;
    while (true) {
        while (!!(SDL_generic_TLS != null)) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "!SDL_generic_TLS",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_thread.c", 242);
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
    if (SDL_generic_TLS != null) {
        SDL_LockMutex_REAL(SDL_generic_TLS_mutex);
        {
            entry = SDL_generic_TLS;
            while (entry != null) {
                var next: [*c]SDL_TLSEntry = entry.*.next;
                _ = &next;
                SDL_free_REAL(@ptrCast(@alignCast(entry.*.storage)));
                SDL_free_REAL(@ptrCast(@alignCast(entry)));
                entry = next;
            }
        }
        SDL_generic_TLS = null;
        SDL_UnlockMutex_REAL(SDL_generic_TLS_mutex);
    }
    if (SDL_generic_TLS_mutex != null) {
        SDL_DestroyMutex_REAL(SDL_generic_TLS_mutex);
        SDL_generic_TLS_mutex = null;
    }
}
pub fn SDL_GetStaticErrBuf() callconv(.c) [*c]SDL_error {
    @setEvalBranchQuota(100000);
    const static_local_SDL_global_error = struct {
        var SDL_global_error: SDL_error = @import("std").mem.zeroes(SDL_error);
    };
    _ = &static_local_SDL_global_error;
    const static_local_SDL_global_error_str1 = struct {
        var SDL_global_error_str1: [128]u8 = @import("std").mem.zeroes([128]u8);
    };
    _ = &static_local_SDL_global_error_str1;
    const static_local_SDL_global_error_str2 = struct {
        var SDL_global_error_str2: [128]u8 = @import("std").mem.zeroes([128]u8);
    };
    _ = &static_local_SDL_global_error_str2;
    static_local_SDL_global_error.SDL_global_error.info[@as(c_int, 0)].str = @ptrCast(@alignCast(&static_local_SDL_global_error_str1.SDL_global_error_str1));
    static_local_SDL_global_error.SDL_global_error.info[@as(c_int, 0)].len = @sizeOf(@TypeOf(static_local_SDL_global_error_str1.SDL_global_error_str1));
    static_local_SDL_global_error.SDL_global_error.info[@as(c_int, 1)].str = @ptrCast(@alignCast(&static_local_SDL_global_error_str2.SDL_global_error_str2));
    static_local_SDL_global_error.SDL_global_error.info[@as(c_int, 1)].len = @sizeOf(@TypeOf(static_local_SDL_global_error_str2.SDL_global_error_str2));
    return &static_local_SDL_global_error.SDL_global_error;
}
pub fn SDL_FreeErrBuf(data: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var errbuf: [*c]SDL_error = @ptrCast(@alignCast(data));
    _ = &errbuf;
    if (errbuf.*.info[@as(c_int, 0)].str != null) {
        errbuf.*.free_func.?(@ptrCast(@alignCast(errbuf.*.info[@as(c_int, 0)].str)));
    }
    if (errbuf.*.info[@as(c_int, 1)].str != null) {
        errbuf.*.free_func.?(@ptrCast(@alignCast(errbuf.*.info[@as(c_int, 1)].str)));
    }
    errbuf.*.free_func.?(@ptrCast(@alignCast(errbuf)));
}
pub export fn SDL_GetErrBuf(create: bool) [*c]SDL_error {
    @setEvalBranchQuota(100000);
    const static_local_tls_errbuf = struct {
        var tls_errbuf: SDL_TLSID = @import("std").mem.zeroes(SDL_TLSID);
    };
    _ = &static_local_tls_errbuf;
    var errbuf: [*c]SDL_error = undefined;
    _ = &errbuf;
    errbuf = @ptrCast(@alignCast(SDL_GetTLS_REAL(&static_local_tls_errbuf.tls_errbuf)));
    if (!(errbuf != null)) {
        if (!create) {
            return null;
        }
        var realloc_func: SDL_realloc_func = undefined;
        _ = &realloc_func;
        var free_func: SDL_free_func = undefined;
        _ = &free_func;
        SDL_GetOriginalMemoryFunctions_REAL(null, null, &realloc_func, &free_func);
        errbuf = @ptrCast(@alignCast(realloc_func.?(null, @sizeOf(@TypeOf(errbuf.*)))));
        if (!(errbuf != null)) {
            return SDL_GetStaticErrBuf();
        }
        _ = memset(@ptrCast(@alignCast(errbuf)), 0, @sizeOf(@TypeOf(errbuf.*)));
        errbuf.*.realloc_func = realloc_func;
        errbuf.*.free_func = free_func;
        _ = SDL_SetTLS_REAL(&static_local_tls_errbuf.tls_errbuf, @ptrCast(@alignCast(errbuf)), SDL_FreeErrBuf);
    }
    return errbuf;
}
pub fn ThreadValid(thread: [*c]SDL_Thread) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_ObjectValid(@ptrCast(@alignCast(thread)), SDL_OBJECT_TYPE_THREAD);
}
pub export fn SDL_RunThread(thread: [*c]SDL_Thread) void {
    @setEvalBranchQuota(100000);
    var userdata: ?*anyopaque = thread.*.userdata;
    _ = &userdata;
    var userfunc: ?*const fn (?*anyopaque) callconv(.c) c_int = thread.*.userfunc;
    _ = &userfunc;
    var statusloc: [*c]c_int = &thread.*.status;
    _ = &statusloc;
    SDL_SYS_SetupThread(thread.*.name);
    statusloc.* = userfunc.?(userdata);
    SDL_CleanupTLS_REAL();
    if (!SDL_CompareAndSwapAtomicInt_REAL(&thread.*.state, SDL_THREAD_ALIVE, SDL_THREAD_COMPLETE)) {
        if (SDL_GetAtomicInt_REAL(&thread.*.state) == SDL_THREAD_DETACHED) {
            SDL_free_REAL(@ptrCast(@alignCast(thread.*.name)));
            SDL_free_REAL(@ptrCast(@alignCast(thread)));
        }
    }
}
pub export fn SDL_CreateThreadWithPropertiesRuntime_REAL(props: SDL_PropertiesID, pfnBeginThread: SDL_FunctionPointer, pfnEndThread: SDL_FunctionPointer) [*c]SDL_Thread {
    @setEvalBranchQuota(100000);
    if ((pfnBeginThread != null) or (pfnEndThread != null)) {
        _ = SDL_SetError_REAL("_beginthreadex/_endthreadex not supported on this platform");
        return null;
    }
    var @"fn": SDL_ThreadFunction = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(props, "SDL.thread.create.entry_function", null)));
    _ = &@"fn";
    var name: [*c]const u8 = SDL_GetStringProperty_REAL(props, "SDL.thread.create.name", null);
    _ = &name;
    const stacksize: usize = @bitCast(@as(c_long, SDL_GetNumberProperty_REAL(props, "SDL.thread.create.stacksize", 0)));
    _ = &stacksize;
    var userdata: ?*anyopaque = SDL_GetPointerProperty_REAL(props, "SDL.thread.create.userdata", null);
    _ = &userdata;
    if (!(@"fn" != null)) {
        _ = SDL_SetError_REAL("Thread entry function is NULL");
        return null;
    }
    SDL_InitMainThread();
    var thread: [*c]SDL_Thread = undefined;
    thread = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(thread.*)))));
    _ = &thread;
    if (!(thread != null)) {
        return null;
    }
    thread.*.status = -@as(c_int, 1);
    _ = SDL_SetAtomicInt_REAL(&thread.*.state, SDL_THREAD_ALIVE);
    if (name != null) {
        thread.*.name = SDL_strdup_REAL(name);
        if (!(thread.*.name != null)) {
            SDL_free_REAL(@ptrCast(@alignCast(thread)));
            return null;
        }
    }
    thread.*.userfunc = @"fn";
    thread.*.userdata = userdata;
    thread.*.stacksize = stacksize;
    SDL_SetObjectValid(@ptrCast(@alignCast(thread)), SDL_OBJECT_TYPE_THREAD, @"true" != 0);
    if (!SDL_SYS_CreateThread(thread, pfnBeginThread, pfnEndThread)) {
        SDL_SetObjectValid(@ptrCast(@alignCast(thread)), SDL_OBJECT_TYPE_THREAD, @"false" != 0);
        SDL_free_REAL(@ptrCast(@alignCast(thread.*.name)));
        SDL_free_REAL(@ptrCast(@alignCast(thread)));
        return null;
    }
    return thread;
}
pub export fn SDL_CreateThreadRuntime_REAL(arg_fn: SDL_ThreadFunction, name: [*c]const u8, userdata: ?*anyopaque, pfnBeginThread: SDL_FunctionPointer, pfnEndThread: SDL_FunctionPointer) [*c]SDL_Thread {
    @setEvalBranchQuota(100000);
    var @"fn" = arg_fn;
    _ = &@"fn";
    const props: SDL_PropertiesID = SDL_CreateProperties_REAL();
    _ = &props;
    _ = SDL_SetPointerProperty_REAL(props, "SDL.thread.create.entry_function", @ptrCast(@alignCast(@constCast(@"fn"))));
    _ = SDL_SetStringProperty_REAL(props, "SDL.thread.create.name", name);
    _ = SDL_SetPointerProperty_REAL(props, "SDL.thread.create.userdata", userdata);
    var thread: [*c]SDL_Thread = SDL_CreateThreadWithPropertiesRuntime_REAL(props, pfnBeginThread, pfnEndThread);
    _ = &thread;
    SDL_DestroyProperties_REAL(props);
    return thread;
}
pub export fn SDL_CreateThreadWithStackSize(arg_fn: SDL_ThreadFunction, name: [*c]const u8, stacksize: usize, userdata: ?*anyopaque) [*c]SDL_Thread {
    @setEvalBranchQuota(100000);
    var @"fn" = arg_fn;
    _ = &@"fn";
    const props: SDL_PropertiesID = SDL_CreateProperties_REAL();
    _ = &props;
    _ = SDL_SetPointerProperty_REAL(props, "SDL.thread.create.entry_function", @ptrCast(@alignCast(@constCast(@"fn"))));
    _ = SDL_SetStringProperty_REAL(props, "SDL.thread.create.name", name);
    _ = SDL_SetPointerProperty_REAL(props, "SDL.thread.create.userdata", userdata);
    _ = SDL_SetNumberProperty_REAL(props, "SDL.thread.create.stacksize", @bitCast(@as(c_ulong, @truncate(stacksize))));
    var thread: [*c]SDL_Thread = SDL_CreateThreadWithPropertiesRuntime_REAL(props, null, null);
    _ = &thread;
    SDL_DestroyProperties_REAL(props);
    return thread;
}
pub export fn SDL_GetThreadID_REAL(thread: [*c]SDL_Thread) SDL_ThreadID {
    @setEvalBranchQuota(100000);
    var id: SDL_ThreadID = 0;
    _ = &id;
    if (thread != null) {
        if (ThreadValid(thread)) {
            id = thread.*.threadid;
        }
    } else {
        id = SDL_GetCurrentThreadID_REAL();
    }
    return id;
}
pub export fn SDL_GetThreadName_REAL(thread: [*c]SDL_Thread) [*c]const u8 {
    @setEvalBranchQuota(100000);
    if (ThreadValid(thread)) {
        return SDL_GetPersistentString(thread.*.name);
    } else {
        return null;
    }
}
pub export fn SDL_SetCurrentThreadPriority_REAL(priority: SDL_ThreadPriority) bool {
    @setEvalBranchQuota(100000);
    return SDL_SYS_SetThreadPriority(priority);
}
pub export fn SDL_WaitThread_REAL(thread: [*c]SDL_Thread, status: [*c]c_int) void {
    @setEvalBranchQuota(100000);
    if (!ThreadValid(thread)) {
        if (status != null) {
            status.* = -@as(c_int, 1);
        }
        return;
    }
    SDL_SYS_WaitThread(thread);
    if (status != null) {
        status.* = thread.*.status;
    }
    SDL_SetObjectValid(@ptrCast(@alignCast(thread)), SDL_OBJECT_TYPE_THREAD, @"false" != 0);
    SDL_free_REAL(@ptrCast(@alignCast(thread.*.name)));
    SDL_free_REAL(@ptrCast(@alignCast(thread)));
}
pub export fn SDL_GetThreadState_REAL(thread: [*c]SDL_Thread) SDL_ThreadState {
    @setEvalBranchQuota(100000);
    if (!ThreadValid(thread)) {
        return SDL_THREAD_UNKNOWN;
    }
    return @bitCast(SDL_GetAtomicInt_REAL(&thread.*.state));
}
pub export fn SDL_DetachThread_REAL(thread: [*c]SDL_Thread) void {
    @setEvalBranchQuota(100000);
    if (!ThreadValid(thread)) {
        return;
    }
    if (SDL_CompareAndSwapAtomicInt_REAL(&thread.*.state, SDL_THREAD_ALIVE, SDL_THREAD_DETACHED)) {
        SDL_SetObjectValid(@ptrCast(@alignCast(thread)), SDL_OBJECT_TYPE_THREAD, @"false" != 0);
        SDL_SYS_DetachThread(thread);
    } else {
        var thread_state: SDL_ThreadState = SDL_GetThreadState_REAL(thread);
        _ = &thread_state;
        if (thread_state == @as(SDL_ThreadState, SDL_THREAD_DETACHED)) {
            return;
        } else if (thread_state == @as(SDL_ThreadState, SDL_THREAD_COMPLETE)) {
            SDL_WaitThread_REAL(thread, null);
        }
    }
}
pub export fn SDL_WaitSemaphore_REAL(sem: ?*SDL_Semaphore) void {
    @setEvalBranchQuota(100000);
    _ = SDL_WaitSemaphoreTimeoutNS(sem, -@as(c_int, 1));
}
pub export fn SDL_TryWaitSemaphore_REAL(sem: ?*SDL_Semaphore) bool {
    @setEvalBranchQuota(100000);
    return SDL_WaitSemaphoreTimeoutNS(sem, 0);
}
pub export fn SDL_WaitSemaphoreTimeout_REAL(sem: ?*SDL_Semaphore, arg_timeoutMS: Sint32) bool {
    @setEvalBranchQuota(100000);
    var timeoutMS = arg_timeoutMS;
    _ = &timeoutMS;
    var timeoutNS: Sint64 = undefined;
    _ = &timeoutNS;
    if (timeoutMS >= @as(c_int, 0)) {
        timeoutNS = @bitCast(@as(c_ulong, @truncate(@as(Uint64, @bitCast(@as(c_long, timeoutMS))) *% @as(Uint64, SDL_NS_PER_MS))));
    } else {
        timeoutNS = -@as(c_int, 1);
    }
    return SDL_WaitSemaphoreTimeoutNS(sem, timeoutNS);
}
pub export fn SDL_WaitCondition_REAL(cond: ?*SDL_Condition, mutex: ?*SDL_Mutex) void {
    @setEvalBranchQuota(100000);
    _ = SDL_WaitConditionTimeoutNS(cond, mutex, -@as(c_int, 1));
}
pub export fn SDL_WaitConditionTimeout_REAL(cond: ?*SDL_Condition, mutex: ?*SDL_Mutex, arg_timeoutMS: Sint32) bool {
    @setEvalBranchQuota(100000);
    var timeoutMS = arg_timeoutMS;
    _ = &timeoutMS;
    var timeoutNS: Sint64 = undefined;
    _ = &timeoutNS;
    if (timeoutMS >= @as(c_int, 0)) {
        timeoutNS = @bitCast(@as(c_ulong, @truncate(@as(Uint64, @bitCast(@as(c_long, timeoutMS))) *% @as(Uint64, SDL_NS_PER_MS))));
    } else {
        timeoutNS = -@as(c_int, 1);
    }
    return SDL_WaitConditionTimeoutNS(cond, mutex, timeoutNS);
}
pub export fn SDL_ShouldInit_REAL(state: [*c]SDL_InitState) bool {
    @setEvalBranchQuota(100000);
    while (SDL_GetAtomicInt_REAL(&state.*.status) != SDL_INIT_STATUS_INITIALIZED) {
        if (SDL_CompareAndSwapAtomicInt_REAL(&state.*.status, SDL_INIT_STATUS_UNINITIALIZED, SDL_INIT_STATUS_INITIALIZING)) {
            state.*.thread = SDL_GetCurrentThreadID_REAL();
            return @"true" != 0;
        }
        SDL_Delay_REAL(1);
    }
    return @"false" != 0;
}
pub export fn SDL_ShouldQuit_REAL(state: [*c]SDL_InitState) bool {
    @setEvalBranchQuota(100000);
    while (SDL_GetAtomicInt_REAL(&state.*.status) != SDL_INIT_STATUS_UNINITIALIZED) {
        if (SDL_CompareAndSwapAtomicInt_REAL(&state.*.status, SDL_INIT_STATUS_INITIALIZED, SDL_INIT_STATUS_UNINITIALIZING)) {
            state.*.thread = SDL_GetCurrentThreadID_REAL();
            return @"true" != 0;
        }
        SDL_Delay_REAL(1);
    }
    return @"false" != 0;
}
pub export fn SDL_SetInitialized_REAL(state: [*c]SDL_InitState, initialized: bool) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [23:0]u8 = "SDL_SetInitialized_REAL".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!(state.*.thread == SDL_GetCurrentThreadID_REAL())) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "state->thread == SDL_GetCurrentThreadID_REAL()",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_thread.c", 586);
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
    if (initialized) {
        _ = SDL_SetAtomicInt_REAL(&state.*.status, SDL_INIT_STATUS_INITIALIZED);
    } else {
        _ = SDL_SetAtomicInt_REAL(&state.*.status, SDL_INIT_STATUS_UNINITIALIZED);
    }
}

pub const SDL_CleanupTLS = SDL_CleanupTLS_REAL;
pub const SDL_CreateThreadRuntime = SDL_CreateThreadRuntime_REAL;
pub const SDL_CreateThreadWithPropertiesRuntime = SDL_CreateThreadWithPropertiesRuntime_REAL;
pub const SDL_DetachThread = SDL_DetachThread_REAL;
pub const SDL_GetTLS = SDL_GetTLS_REAL;
pub const SDL_GetThreadID = SDL_GetThreadID_REAL;
pub const SDL_GetThreadName = SDL_GetThreadName_REAL;
pub const SDL_SetCurrentThreadPriority = SDL_SetCurrentThreadPriority_REAL;
pub const SDL_SetInitialized = SDL_SetInitialized_REAL;
pub const SDL_SetTLS = SDL_SetTLS_REAL;
pub const SDL_ShouldInit = SDL_ShouldInit_REAL;
pub const SDL_ShouldQuit = SDL_ShouldQuit_REAL;
pub const SDL_TryWaitSemaphore = SDL_TryWaitSemaphore_REAL;
pub const SDL_WaitCondition = SDL_WaitCondition_REAL;
pub const SDL_WaitConditionTimeout = SDL_WaitConditionTimeout_REAL;
pub const SDL_WaitSemaphore = SDL_WaitSemaphore_REAL;
pub const SDL_WaitSemaphoreTimeout = SDL_WaitSemaphoreTimeout_REAL;
pub const SDL_WaitThread = SDL_WaitThread_REAL;
pub const SDL_GetThreadState = SDL_GetThreadState_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_NS_PER_MS = __helpers.promoteIntLiteral(c_int, 1000000, .decimal);
pub const TLS_ALLOC_CHUNKSIZE = @as(c_int, 4);
