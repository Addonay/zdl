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
pub const struct___va_list_tag_2 = extern struct {
    unnamed_0: c_uint = 0,
    unnamed_1: c_uint = 0,
    unnamed_2: ?*anyopaque = null,
    unnamed_3: ?*anyopaque = null,
};
pub const __builtin_va_list = [1]struct___va_list_tag_2;
pub const va_list = __builtin_va_list;
pub const struct__IO_FILE = opaque {
};
pub const FILE = struct__IO_FILE;
pub extern var stderr: ?*FILE;
pub extern fn fprintf(noalias __stream: ?*FILE, noalias __format: [*c]const u8, ...) c_int;
pub const Uint64 = u64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_getenv_REAL(name: [*c]const u8) [*c]const u8;
pub extern fn SDL_isdigit_REAL(x: c_int) c_int;
pub extern fn SDL_strlen_REAL(str: [*c]const u8) usize;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_strchr_REAL(str: [*c]const u8, c: c_int) [*c]u8;
pub extern fn SDL_atoi_REAL(str: [*c]const u8) c_int;
pub extern fn SDL_strncasecmp_REAL(str1: [*c]const u8, str2: [*c]const u8, maxlen: usize) c_int;
pub extern fn SDL_vsnprintf_REAL(text: [*c]u8, maxlen: usize, fmt: [*c]const u8, ap: [*c]struct___va_list_tag_2) c_int;
pub inline fn SDL_size_add_check_overflow_builtin(a: usize, b: usize, ret: [*c]usize) bool {
    @setEvalBranchQuota(100000);
    return @as(c_int, @intFromBool(__builtin.add_overflow(a, b, ret))) == @as(c_int, 0);
}
pub const struct_SDL_AtomicInt = extern struct {
    value: c_int = 0,
};
pub const SDL_AtomicInt = struct_SDL_AtomicInt;
pub extern fn SDL_GetAtomicInt_REAL(a: [*c]SDL_AtomicInt) c_int;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_ThreadID = Uint64;
pub extern fn SDL_GetCurrentThreadID_REAL() SDL_ThreadID;
pub const struct_SDL_Mutex = opaque {
};
pub const SDL_Mutex = struct_SDL_Mutex;
pub extern fn SDL_CreateMutex_REAL() ?*SDL_Mutex;
pub extern fn SDL_LockMutex_REAL(mutex: ?*SDL_Mutex) void;
pub extern fn SDL_UnlockMutex_REAL(mutex: ?*SDL_Mutex) void;
pub extern fn SDL_DestroyMutex_REAL(mutex: ?*SDL_Mutex) void;
pub const SDL_INIT_STATUS_INITIALIZING: c_int = 1;
pub const SDL_INIT_STATUS_INITIALIZED: c_int = 2;
pub const struct_SDL_InitState = extern struct {
    status: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
    thread: SDL_ThreadID = 0,
    reserved: ?*anyopaque = null,
};
pub const SDL_InitState = struct_SDL_InitState;
pub extern fn SDL_ShouldInit_REAL(state: [*c]SDL_InitState) bool;
pub extern fn SDL_ShouldQuit_REAL(state: [*c]SDL_InitState) bool;
pub extern fn SDL_SetInitialized_REAL(state: [*c]SDL_InitState, initialized: bool) void;
pub extern fn SDL_GetHint_REAL(name: [*c]const u8) [*c]const u8;
pub const SDL_HintCallback = ?*const fn (userdata: ?*anyopaque, name: [*c]const u8, oldValue: [*c]const u8, newValue: [*c]const u8) callconv(.c) void;
pub extern fn SDL_AddHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) bool;
pub extern fn SDL_RemoveHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) void;
pub const SDL_LOG_CATEGORY_APPLICATION: c_int = 0;
pub const SDL_LOG_CATEGORY_ASSERT: c_int = 2;
pub const SDL_LOG_CATEGORY_TEST: c_int = 8;
pub const SDL_LOG_CATEGORY_RESERVED2: c_int = 10;
pub const SDL_LOG_PRIORITY_INVALID: c_int = 0;
pub const SDL_LOG_PRIORITY_TRACE: c_int = 1;
pub const SDL_LOG_PRIORITY_VERBOSE: c_int = 2;
pub const SDL_LOG_PRIORITY_DEBUG: c_int = 3;
pub const SDL_LOG_PRIORITY_INFO: c_int = 4;
pub const SDL_LOG_PRIORITY_WARN: c_int = 5;
pub const SDL_LOG_PRIORITY_ERROR: c_int = 6;
pub const SDL_LOG_PRIORITY_CRITICAL: c_int = 7;
pub const SDL_LOG_PRIORITY_COUNT: c_int = 8;
pub const enum_SDL_LogPriority = c_uint;
pub const SDL_LogPriority = enum_SDL_LogPriority;
pub const SDL_LogOutputFunction = ?*const fn (userdata: ?*anyopaque, category: c_int, priority: SDL_LogPriority, message: [*c]const u8) callconv(.c) void;
pub const struct_SDL_LogLevel = extern struct {
    category: c_int = 0,
    priority: SDL_LogPriority = @import("std").mem.zeroes(SDL_LogPriority),
    next: [*c]struct_SDL_LogLevel = null,
};
pub const SDL_LogLevel = struct_SDL_LogLevel;
pub var SDL_log_init: SDL_InitState = @import("std").mem.zeroes(SDL_InitState);
pub var SDL_log_lock: ?*SDL_Mutex = null;
pub var SDL_log_function_lock: ?*SDL_Mutex = null;
pub var SDL_loglevels: [*c]SDL_LogLevel = null;
pub var SDL_log_priorities: [19]SDL_LogPriority = @import("std").mem.zeroes([19]SDL_LogPriority);
pub var SDL_log_default_priority: SDL_LogPriority = @import("std").mem.zeroes(SDL_LogPriority);
pub var SDL_log_function: SDL_LogOutputFunction = SDL_LogOutput;
pub var SDL_log_userdata: ?*anyopaque = null;
pub const SDL_priority_names: [8][*c]const u8 = [8][*c]const u8{
    null,
    "TRACE",
    "VERBOSE",
    "DEBUG",
    "INFO",
    "WARN",
    "ERROR",
    "CRITICAL",
};
comptime {
    if (!((@sizeOf(@TypeOf(SDL_priority_names)) / @sizeOf(@TypeOf(SDL_priority_names[@as(c_int, 0)]))) == @as(c_ulong, SDL_LOG_PRIORITY_COUNT))) @compileError("static assertion failed \"SDL_arraysize(SDL_priority_names) == SDL_LOG_PRIORITY_COUNT\"");
}
pub var SDL_priority_prefixes: [8][*c]u8 = @import("std").mem.zeroes([8][*c]u8);
pub const SDL_category_names: [10][*c]const u8 = [10][*c]const u8{
    "APP",
    "ERROR",
    "ASSERT",
    "SYSTEM",
    "AUDIO",
    "VIDEO",
    "RENDER",
    "INPUT",
    "TEST",
    "GPU",
};
comptime {
    if (!((@sizeOf(@TypeOf(SDL_category_names)) / @sizeOf(@TypeOf(SDL_category_names[@as(c_int, 0)]))) == @as(c_ulong, SDL_LOG_CATEGORY_RESERVED2))) @compileError("static assertion failed \"SDL_arraysize(SDL_category_names) == SDL_LOG_CATEGORY_RESERVED2\"");
}
pub fn SDL_LoggingChanged(_: ?*anyopaque, _: [*c]const u8, _: [*c]const u8, _: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_ResetLogPriorities_REAL();
}
pub export fn SDL_InitLog() void {
    @setEvalBranchQuota(100000);
    if (!SDL_ShouldInit_REAL(&SDL_log_init)) {
        return;
    }
    SDL_log_lock = SDL_CreateMutex_REAL();
    SDL_log_function_lock = SDL_CreateMutex_REAL();
    _ = SDL_AddHintCallback_REAL("SDL_LOGGING", SDL_LoggingChanged, null);
    SDL_SetInitialized_REAL(&SDL_log_init, @"true" != 0);
}
pub export fn SDL_QuitLog() void {
    @setEvalBranchQuota(100000);
    if (!SDL_ShouldQuit_REAL(&SDL_log_init)) {
        return;
    }
    SDL_RemoveHintCallback_REAL("SDL_LOGGING", SDL_LoggingChanged, null);
    CleanupLogPriorities();
    CleanupLogPrefixes();
    if (SDL_log_lock != null) {
        SDL_DestroyMutex_REAL(SDL_log_lock);
        SDL_log_lock = null;
    }
    if (SDL_log_function_lock != null) {
        SDL_DestroyMutex_REAL(SDL_log_function_lock);
        SDL_log_function_lock = null;
    }
    SDL_SetInitialized_REAL(&SDL_log_init, @"false" != 0);
}
pub fn SDL_CheckInitLog() callconv(.c) void {
    @setEvalBranchQuota(100000);
    var status: c_int = SDL_GetAtomicInt_REAL(&SDL_log_init.status);
    _ = &status;
    if ((status == SDL_INIT_STATUS_INITIALIZED) or ((status == SDL_INIT_STATUS_INITIALIZING) and (SDL_log_init.thread == SDL_GetCurrentThreadID_REAL()))) {
        return;
    }
    SDL_InitLog();
}
pub fn CleanupLogPriorities() callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_LockMutex_REAL(SDL_log_lock);
    while (SDL_loglevels != null) {
        var entry: [*c]SDL_LogLevel = SDL_loglevels;
        _ = &entry;
        SDL_loglevels = entry.*.next;
        SDL_free_REAL(@ptrCast(@alignCast(entry)));
    }
    SDL_UnlockMutex_REAL(SDL_log_lock);
}
pub export fn SDL_SetLogPriorities_REAL(priority: SDL_LogPriority) void {
    @setEvalBranchQuota(100000);
    SDL_CheckInitLog();
    SDL_LockMutex_REAL(SDL_log_lock);
    {
        CleanupLogPriorities();
        SDL_log_default_priority = priority;
        {
            var i: c_int = 0;
            _ = &i;
            while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(SDL_log_priorities)) / @sizeOf(@TypeOf(SDL_log_priorities[@as(c_int, 0)])))) : (i += 1) {
                SDL_log_priorities[@bitCast(@as(isize, @intCast(i)))] = priority;
            }
        }
    }
    SDL_UnlockMutex_REAL(SDL_log_lock);
}
pub export fn SDL_SetLogPriority_REAL(arg_category: c_int, priority: SDL_LogPriority) void {
    @setEvalBranchQuota(100000);
    var category = arg_category;
    _ = &category;
    var entry: [*c]SDL_LogLevel = undefined;
    _ = &entry;
    SDL_CheckInitLog();
    SDL_LockMutex_REAL(SDL_log_lock);
    {
        if ((category >= @as(c_int, 0)) and (@as(c_ulong, @bitCast(@as(c_long, category))) < (@sizeOf(@TypeOf(SDL_log_priorities)) / @sizeOf(@TypeOf(SDL_log_priorities[@as(c_int, 0)]))))) {
            SDL_log_priorities[@bitCast(@as(isize, @intCast(category)))] = priority;
        } else {
            {
                entry = SDL_loglevels;
                while (entry != null) : (entry = entry.*.next) {
                    if (entry.*.category == category) {
                        entry.*.priority = priority;
                        break;
                    }
                }
            }
            if (!(entry != null)) {
                entry = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(@TypeOf(entry.*)))));
                if (entry != null) {
                    entry.*.category = category;
                    entry.*.priority = priority;
                    entry.*.next = SDL_loglevels;
                    SDL_loglevels = entry;
                }
            }
        }
    }
    SDL_UnlockMutex_REAL(SDL_log_lock);
}
pub export fn SDL_GetLogPriority_REAL(arg_category: c_int) SDL_LogPriority {
    @setEvalBranchQuota(100000);
    var category = arg_category;
    _ = &category;
    var entry: [*c]SDL_LogLevel = undefined;
    _ = &entry;
    var priority: SDL_LogPriority = SDL_LOG_PRIORITY_INVALID;
    _ = &priority;
    SDL_CheckInitLog();
    if ((category >= @as(c_int, 0)) and (@as(c_ulong, @bitCast(@as(c_long, category))) < (@sizeOf(@TypeOf(SDL_log_priorities)) / @sizeOf(@TypeOf(SDL_log_priorities[@as(c_int, 0)]))))) {
        return SDL_log_priorities[@bitCast(@as(isize, @intCast(category)))];
    }
    SDL_LockMutex_REAL(SDL_log_lock);
    {
        if ((category >= @as(c_int, 0)) and (@as(c_ulong, @bitCast(@as(c_long, category))) < (@sizeOf(@TypeOf(SDL_log_priorities)) / @sizeOf(@TypeOf(SDL_log_priorities[@as(c_int, 0)]))))) {
            priority = SDL_log_priorities[@bitCast(@as(isize, @intCast(category)))];
        } else {
            {
                entry = SDL_loglevels;
                while (entry != null) : (entry = entry.*.next) {
                    if (entry.*.category == category) {
                        priority = entry.*.priority;
                        break;
                    }
                }
            }
            if (priority == @as(SDL_LogPriority, SDL_LOG_PRIORITY_INVALID)) {
                priority = SDL_log_default_priority;
            }
        }
    }
    SDL_UnlockMutex_REAL(SDL_log_lock);
    return priority;
}
pub fn ParseLogCategory(string: [*c]const u8, length: usize, category: [*c]c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    if (SDL_isdigit_REAL(string.*) != 0) {
        category.* = SDL_atoi_REAL(string);
        return @"true" != 0;
    }
    if (@as(c_int, string.*) == @as(c_int, '*')) {
        category.* = -@as(c_int, 1);
        return @"true" != 0;
    }
    {
        i = 0;
        while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(SDL_category_names)) / @sizeOf(@TypeOf(SDL_category_names[@as(c_int, 0)])))) : (i += 1) {
            if (SDL_strncasecmp_REAL(string, SDL_category_names[@bitCast(@as(isize, @intCast(i)))], length) == @as(c_int, 0)) {
                category.* = i;
                return @"true" != 0;
            }
        }
    }
    return @"false" != 0;
}
pub fn ParseLogPriority(string: [*c]const u8, length: usize, priority: [*c]SDL_LogPriority) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    if (SDL_isdigit_REAL(string.*) != 0) {
        i = SDL_atoi_REAL(string);
        if (i == @as(c_int, 0)) {
            priority.* = SDL_LOG_PRIORITY_COUNT;
            return @"true" != 0;
        }
        if ((i > SDL_LOG_PRIORITY_INVALID) and (i < SDL_LOG_PRIORITY_COUNT)) {
            priority.* = @bitCast(i);
            return @"true" != 0;
        }
        return @"false" != 0;
    }
    if (SDL_strncasecmp_REAL(string, "quiet", length) == @as(c_int, 0)) {
        priority.* = SDL_LOG_PRIORITY_COUNT;
        return @"true" != 0;
    }
    {
        i = SDL_LOG_PRIORITY_INVALID + @as(c_int, 1);
        while (i < SDL_LOG_PRIORITY_COUNT) : (i += 1) {
            if (SDL_strncasecmp_REAL(string, SDL_priority_names[@bitCast(@as(isize, @intCast(i)))], length) == @as(c_int, 0)) {
                priority.* = @bitCast(i);
                return @"true" != 0;
            }
        }
    }
    return @"false" != 0;
}
pub fn ParseLogPriorities(hint: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var name: [*c]const u8 = undefined;
    _ = &name;
    var next: [*c]const u8 = undefined;
    _ = &next;
    var category: c_int = -@as(c_int, 1);
    _ = &category;
    var priority: SDL_LogPriority = SDL_LOG_PRIORITY_INVALID;
    _ = &priority;
    if (@as(?*anyopaque, @ptrCast(@alignCast(SDL_strchr_REAL(hint, '=')))) == @as(?*anyopaque, null)) {
        if (ParseLogPriority(hint, SDL_strlen_REAL(hint), &priority)) {
            SDL_SetLogPriorities_REAL(priority);
        }
        return;
    }
    SDL_LockMutex_REAL(SDL_log_lock);
    {
        name = hint;
        while (name != null) : (name = next) {
            var sep: [*c]const u8 = SDL_strchr_REAL(name, '=');
            _ = &sep;
            if (!(sep != null)) {
                break;
            }
            next = SDL_strchr_REAL(sep, ',');
            if (next != null) {
                next += 1;
            }
            if (ParseLogCategory(name, @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(sep) -% @intFromPtr(name))), @sizeOf(u8)))), &category)) {
                var value: [*c]const u8 = sep + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
                _ = &value;
                var len: usize = undefined;
                _ = &len;
                if (next != null) {
                    len = @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(next) -% @intFromPtr(value))), @sizeOf(u8)) - @as(c_long, 1)));
                } else {
                    len = SDL_strlen_REAL(value);
                }
                if (ParseLogPriority(value, len, &priority)) {
                    if (category == -@as(c_int, 1)) {
                        {
                            var i: c_int = 0;
                            _ = &i;
                            while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(SDL_log_priorities)) / @sizeOf(@TypeOf(SDL_log_priorities[@as(c_int, 0)])))) : (i += 1) {
                                if (SDL_log_priorities[@bitCast(@as(isize, @intCast(i)))] == @as(SDL_LogPriority, SDL_LOG_PRIORITY_INVALID)) {
                                    SDL_log_priorities[@bitCast(@as(isize, @intCast(i)))] = priority;
                                }
                            }
                        }
                        SDL_log_default_priority = priority;
                    } else {
                        SDL_SetLogPriority_REAL(category, priority);
                    }
                }
            }
        }
    }
    SDL_UnlockMutex_REAL(SDL_log_lock);
}
pub export fn SDL_ResetLogPriorities_REAL() void {
    @setEvalBranchQuota(100000);
    var env: [*c]const u8 = undefined;
    _ = &env;
    var debug: bool = undefined;
    _ = &debug;
    var i: c_int = undefined;
    _ = &i;
    var hint: [*c]const u8 = undefined;
    _ = &hint;
    var i_1: c_int = undefined;
    _ = &i_1;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                SDL_CheckInitLog();
                SDL_LockMutex_REAL(SDL_log_lock);
                env = SDL_getenv_REAL("DEBUG_INVOCATION");
                debug = ((env != null) and (@as(c_int, env.*) != 0)) and (@as(c_int, env.*) != @as(c_int, '0'));
                CleanupLogPriorities();
                SDL_log_default_priority = SDL_LOG_PRIORITY_INVALID;
                i = 0;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            1 => {
                if (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(SDL_log_priorities)) / @sizeOf(@TypeOf(SDL_log_priorities[@as(c_int, 0)])))) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 4;
                    continue;
                }
            },
            2 => {
                SDL_log_priorities[@bitCast(@as(isize, @intCast(i)))] = SDL_LOG_PRIORITY_INVALID;
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                i += 1;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                hint = SDL_GetHint_REAL("SDL_LOGGING");
                if (hint != null) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                ParseLogPriorities(hint);
                {
                    sdl_pc = 7;
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
                if (SDL_log_default_priority == @as(SDL_LogPriority, SDL_LOG_PRIORITY_INVALID)) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                SDL_log_default_priority = SDL_LOG_PRIORITY_ERROR;
                {
                    sdl_pc = 10;
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
                i_1 = 0;
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                if (@as(c_ulong, @bitCast(@as(c_long, i_1))) < (@sizeOf(@TypeOf(SDL_log_priorities)) / @sizeOf(@TypeOf(SDL_log_priorities[@as(c_int, 0)])))) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            12 => {
                if (SDL_log_priorities[@bitCast(@as(isize, @intCast(i_1)))] != @as(SDL_LogPriority, SDL_LOG_PRIORITY_INVALID)) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            13 => {
                i_1 += 1;
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            14 => {
                SDL_UnlockMutex_REAL(SDL_log_lock);
                {}
            },
            15 => {
                {
                    sdl_pc = 13;
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
                switch (i_1) {
                    SDL_LOG_CATEGORY_APPLICATION => {
                        sdl_pc = 19;
                        continue;
                    },
                    SDL_LOG_CATEGORY_ASSERT => {
                        sdl_pc = 23;
                        continue;
                    },
                    SDL_LOG_CATEGORY_TEST => {
                        sdl_pc = 24;
                        continue;
                    },
                    else => {
                        sdl_pc = 25;
                        continue;
                    },
                }
            },
            18 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            19 => {
                if (debug) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                SDL_log_priorities[@bitCast(@as(isize, @intCast(i_1)))] = SDL_LOG_PRIORITY_DEBUG;
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            21 => {
                SDL_log_priorities[@bitCast(@as(isize, @intCast(i_1)))] = SDL_LOG_PRIORITY_INFO;
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            22 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            23 => {
                SDL_log_priorities[@bitCast(@as(isize, @intCast(i_1)))] = SDL_LOG_PRIORITY_WARN;
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            24 => {
                SDL_log_priorities[@bitCast(@as(isize, @intCast(i_1)))] = SDL_LOG_PRIORITY_VERBOSE;
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            25 => {
                if (debug) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            26 => {
                SDL_log_priorities[@bitCast(@as(isize, @intCast(i_1)))] = SDL_LOG_PRIORITY_DEBUG;
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            27 => {
                SDL_log_priorities[@bitCast(@as(isize, @intCast(i_1)))] = SDL_LOG_PRIORITY_ERROR;
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            28 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn CleanupLogPrefixes() callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_LockMutex_REAL(SDL_log_function_lock);
    {
        var i: c_int = 0;
        _ = &i;
        while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(SDL_priority_prefixes)) / @sizeOf(@TypeOf(SDL_priority_prefixes[@as(c_int, 0)])))) : (i += 1) {
            if (SDL_priority_prefixes[@bitCast(@as(isize, @intCast(i)))] != null) {
                SDL_free_REAL(@ptrCast(@alignCast(SDL_priority_prefixes[@bitCast(@as(isize, @intCast(i)))])));
                SDL_priority_prefixes[@bitCast(@as(isize, @intCast(i)))] = null;
            }
        }
    }
    SDL_UnlockMutex_REAL(SDL_log_function_lock);
}
pub fn GetLogPriorityPrefix(arg_priority: SDL_LogPriority) callconv(.c) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var priority = arg_priority;
    _ = &priority;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if ((priority <= @as(SDL_LogPriority, SDL_LOG_PRIORITY_INVALID)) or (priority >= @as(SDL_LogPriority, SDL_LOG_PRIORITY_COUNT))) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return "";
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                if (SDL_priority_prefixes[priority] != null) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                return SDL_priority_prefixes[priority];
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                switch (priority) {
                    @as(SDL_LogPriority, SDL_LOG_PRIORITY_WARN) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(SDL_LogPriority, SDL_LOG_PRIORITY_ERROR) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(SDL_LogPriority, SDL_LOG_PRIORITY_CRITICAL) => {
                        sdl_pc = 10;
                        continue;
                    },
                    else => {
                        sdl_pc = 11;
                        continue;
                    },
                }
            },
            7 => {
                return undefined;
            },
            8 => {
                return "WARNING: ";
            },
            9 => {
                return "ERROR: ";
            },
            10 => {
                return "ERROR: ";
            },
            11 => {
                return "";
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_SetLogPriorityPrefix_REAL(arg_priority: SDL_LogPriority, prefix: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    var priority = arg_priority;
    _ = &priority;
    var prefix_copy: [*c]u8 = undefined;
    _ = &prefix_copy;
    if ((priority <= @as(SDL_LogPriority, SDL_LOG_PRIORITY_INVALID)) or (priority >= @as(SDL_LogPriority, SDL_LOG_PRIORITY_COUNT))) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("priority"))));
    }
    if (!(prefix != null) or !(@as(c_int, prefix.*) != 0)) {
        prefix_copy = SDL_strdup_REAL("");
    } else {
        prefix_copy = SDL_strdup_REAL(prefix);
    }
    if (!(prefix_copy != null)) {
        return @"false" != 0;
    }
    SDL_LockMutex_REAL(SDL_log_function_lock);
    {
        if (SDL_priority_prefixes[priority] != null) {
            SDL_free_REAL(@ptrCast(@alignCast(SDL_priority_prefixes[priority])));
        }
        SDL_priority_prefixes[priority] = prefix_copy;
    }
    SDL_UnlockMutex_REAL(SDL_log_function_lock);
    return @"true" != 0;
}
pub export fn SDL_Log_REAL(fmt: [*c]const u8, ...) void {
    @setEvalBranchQuota(100000);
    var ap: va_list = undefined;
    _ = &ap;
    __builtin.va_start(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&ap))), @cVaStart());
    SDL_LogMessageV_REAL(SDL_LOG_CATEGORY_APPLICATION, SDL_LOG_PRIORITY_INFO, fmt, @ptrCast(@alignCast(&ap)));
    __builtin.va_end(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&ap))));
}
pub export fn SDL_LogTrace_REAL(category: c_int, fmt: [*c]const u8, ...) void {
    @setEvalBranchQuota(100000);
    var ap: va_list = undefined;
    _ = &ap;
    __builtin.va_start(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&ap))), @cVaStart());
    SDL_LogMessageV_REAL(category, SDL_LOG_PRIORITY_TRACE, fmt, @ptrCast(@alignCast(&ap)));
    __builtin.va_end(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&ap))));
}
pub export fn SDL_LogVerbose_REAL(category: c_int, fmt: [*c]const u8, ...) void {
    @setEvalBranchQuota(100000);
    var ap: va_list = undefined;
    _ = &ap;
    __builtin.va_start(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&ap))), @cVaStart());
    SDL_LogMessageV_REAL(category, SDL_LOG_PRIORITY_VERBOSE, fmt, @ptrCast(@alignCast(&ap)));
    __builtin.va_end(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&ap))));
}
pub export fn SDL_LogDebug_REAL(category: c_int, fmt: [*c]const u8, ...) void {
    @setEvalBranchQuota(100000);
    var ap: va_list = undefined;
    _ = &ap;
    __builtin.va_start(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&ap))), @cVaStart());
    SDL_LogMessageV_REAL(category, SDL_LOG_PRIORITY_DEBUG, fmt, @ptrCast(@alignCast(&ap)));
    __builtin.va_end(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&ap))));
}
pub export fn SDL_LogInfo_REAL(category: c_int, fmt: [*c]const u8, ...) void {
    @setEvalBranchQuota(100000);
    var ap: va_list = undefined;
    _ = &ap;
    __builtin.va_start(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&ap))), @cVaStart());
    SDL_LogMessageV_REAL(category, SDL_LOG_PRIORITY_INFO, fmt, @ptrCast(@alignCast(&ap)));
    __builtin.va_end(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&ap))));
}
pub export fn SDL_LogWarn_REAL(category: c_int, fmt: [*c]const u8, ...) void {
    @setEvalBranchQuota(100000);
    var ap: va_list = undefined;
    _ = &ap;
    __builtin.va_start(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&ap))), @cVaStart());
    SDL_LogMessageV_REAL(category, SDL_LOG_PRIORITY_WARN, fmt, @ptrCast(@alignCast(&ap)));
    __builtin.va_end(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&ap))));
}
pub export fn SDL_LogError_REAL(category: c_int, fmt: [*c]const u8, ...) void {
    @setEvalBranchQuota(100000);
    var ap: va_list = undefined;
    _ = &ap;
    __builtin.va_start(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&ap))), @cVaStart());
    SDL_LogMessageV_REAL(category, SDL_LOG_PRIORITY_ERROR, fmt, @ptrCast(@alignCast(&ap)));
    __builtin.va_end(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&ap))));
}
pub export fn SDL_LogCritical_REAL(category: c_int, fmt: [*c]const u8, ...) void {
    @setEvalBranchQuota(100000);
    var ap: va_list = undefined;
    _ = &ap;
    __builtin.va_start(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&ap))), @cVaStart());
    SDL_LogMessageV_REAL(category, SDL_LOG_PRIORITY_CRITICAL, fmt, @ptrCast(@alignCast(&ap)));
    __builtin.va_end(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&ap))));
}
pub export fn SDL_LogMessage_REAL(category: c_int, priority: SDL_LogPriority, fmt: [*c]const u8, ...) void {
    @setEvalBranchQuota(100000);
    var ap: va_list = undefined;
    _ = &ap;
    __builtin.va_start(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&ap))), @cVaStart());
    SDL_LogMessageV_REAL(category, priority, fmt, @ptrCast(@alignCast(&ap)));
    __builtin.va_end(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&ap))));
}
pub export fn SDL_LogMessageV_REAL(category: c_int, priority: SDL_LogPriority, fmt: [*c]const u8, ap: [*c]struct___va_list_tag_2) void {
    @setEvalBranchQuota(100000);
    var message: [*c]u8 = null;
    _ = &message;
    var stack_buf: [256]u8 = undefined;
    _ = &stack_buf;
    var len_plus_term: usize = undefined;
    _ = &len_plus_term;
    var len: c_int = undefined;
    _ = &len;
    var aq: va_list = undefined;
    _ = &aq;
    if (!(SDL_log_function != null)) {
        return;
    }
    if (priority < SDL_GetLogPriority_REAL(category)) {
        return;
    }
    __builtin.va_copy(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&aq))), ap);
    len = SDL_vsnprintf_REAL(@ptrCast(@alignCast(&stack_buf)), @sizeOf(@TypeOf(stack_buf)), fmt, @ptrCast(@alignCast(&aq)));
    __builtin.va_end(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&aq))));
    if (len < @as(c_int, 0)) {
        return;
    }
    if (@as(c_ulong, @bitCast(@as(c_long, len))) >= @sizeOf(@TypeOf(stack_buf))) {
        if (SDL_size_add_check_overflow_builtin(@bitCast(@as(c_long, len)), 1, &len_plus_term)) {
            message = @ptrCast(@alignCast(SDL_malloc_REAL(len_plus_term)));
            if (!(message != null)) {
                return;
            }
            __builtin.va_copy(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&aq))), ap);
            len = SDL_vsnprintf_REAL(message, len_plus_term, fmt, @ptrCast(@alignCast(&aq)));
            __builtin.va_end(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&aq))));
        } else {
            message = @ptrCast(@alignCast(&stack_buf));
            len = @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(stack_buf)))));
        }
    } else {
        message = @ptrCast(@alignCast(&stack_buf));
    }
    if ((len > @as(c_int, 0)) and (@as(c_int, message[@bitCast(@as(isize, @intCast(len - @as(c_int, 1))))]) == @as(c_int, '\n'))) {
        message[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &len;
                ref.* -= 1;
                break :blk ref.*;
            })))
        ] = '\x00';
        if ((len > @as(c_int, 0)) and (@as(c_int, message[@bitCast(@as(isize, @intCast(len - @as(c_int, 1))))]) == @as(c_int, '\r'))) {
            message[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &len;
                    ref.* -= 1;
                    break :blk ref.*;
                })))
            ] = '\x00';
        }
    }
    SDL_LockMutex_REAL(SDL_log_function_lock);
    {
        SDL_log_function.?(SDL_log_userdata, category, priority, message);
    }
    SDL_UnlockMutex_REAL(SDL_log_function_lock);
    if (message != @as([*c]u8, @ptrCast(@alignCast(&stack_buf)))) {
        SDL_free_REAL(@ptrCast(@alignCast(message)));
    }
}
pub fn SDL_LogOutput(_: ?*anyopaque, _: c_int, priority: SDL_LogPriority, message: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = fprintf(stderr, "%s%s\n", GetLogPriorityPrefix(priority), message);
}
pub export fn SDL_GetDefaultLogOutputFunction_REAL() SDL_LogOutputFunction {
    @setEvalBranchQuota(100000);
    return SDL_LogOutput;
}
pub export fn SDL_GetLogOutputFunction_REAL(callback: [*c]SDL_LogOutputFunction, userdata: [*c]?*anyopaque) void {
    @setEvalBranchQuota(100000);
    SDL_LockMutex_REAL(SDL_log_function_lock);
    {
        if (callback != null) {
            callback.* = SDL_log_function;
        }
        if (userdata != null) {
            userdata.* = SDL_log_userdata;
        }
    }
    SDL_UnlockMutex_REAL(SDL_log_function_lock);
}
pub export fn SDL_SetLogOutputFunction_REAL(callback: SDL_LogOutputFunction, userdata: ?*anyopaque) void {
    @setEvalBranchQuota(100000);
    SDL_LockMutex_REAL(SDL_log_function_lock);
    {
        SDL_log_function = callback;
        SDL_log_userdata = userdata;
    }
    SDL_UnlockMutex_REAL(SDL_log_function_lock);
}

pub const SDL_GetLogOutputFunction = SDL_GetLogOutputFunction_REAL;
pub const SDL_GetLogPriority = SDL_GetLogPriority_REAL;
pub const SDL_Log = SDL_Log_REAL;
pub const SDL_LogCritical = SDL_LogCritical_REAL;
pub const SDL_LogDebug = SDL_LogDebug_REAL;
pub const SDL_LogError = SDL_LogError_REAL;
pub const SDL_LogInfo = SDL_LogInfo_REAL;
pub const SDL_LogMessage = SDL_LogMessage_REAL;
pub const SDL_LogMessageV = SDL_LogMessageV_REAL;
pub const SDL_LogTrace = SDL_LogTrace_REAL;
pub const SDL_LogVerbose = SDL_LogVerbose_REAL;
pub const SDL_LogWarn = SDL_LogWarn_REAL;
pub const SDL_ResetLogPriorities = SDL_ResetLogPriorities_REAL;
pub const SDL_SetLogOutputFunction = SDL_SetLogOutputFunction_REAL;
pub const SDL_SetLogPriorities = SDL_SetLogPriorities_REAL;
pub const SDL_SetLogPriority = SDL_SetLogPriority_REAL;
pub const SDL_SetLogPriorityPrefix = SDL_SetLogPriorityPrefix_REAL;
pub const SDL_GetDefaultLogOutputFunction = SDL_GetDefaultLogOutputFunction_REAL;
pub const va_start = @compileError("unable to translate macro: undefined identifier `__builtin_va_start`");
// /home/addo/dev/stupid/zdl/.cache/zig-lib/compiler/aro/include/stdarg.h:12:9
pub inline fn va_end(ap: anytype) @TypeOf(__builtin.va_end(ap)) {
    @setEvalBranchQuota(100000);
    _ = &ap;
    return __builtin.va_end(ap);
}
pub inline fn va_copy(d: anytype, s: anytype) @TypeOf(__builtin.va_copy(d, s)) {
    @setEvalBranchQuota(100000);
    _ = &d;
    _ = &s;
    return __builtin.va_copy(d, s);
}
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
