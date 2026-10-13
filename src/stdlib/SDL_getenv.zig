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
pub extern fn getenv(__name: [*c]const u8) [*c]u8;
pub extern fn setenv(__name: [*c]const u8, __value: [*c]const u8, __replace: c_int) c_int;
pub extern fn unsetenv(__name: [*c]const u8) c_int;
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub const Uint32 = u32;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub const struct_SDL_Mutex = opaque {
};
pub const SDL_Mutex = struct_SDL_Mutex;
pub const struct_SDL_HashTable = opaque {
};
pub const SDL_HashTable = struct_SDL_HashTable;
pub const struct_SDL_Environment = extern struct {
    lock: ?*SDL_Mutex = null,
    strings: ?*SDL_HashTable = null,
};
pub const SDL_Environment = struct_SDL_Environment;
pub extern fn SDL_strlen_REAL(str: [*c]const u8) usize;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_strchr_REAL(str: [*c]const u8, c: c_int) [*c]u8;
pub extern fn SDL_asprintf_REAL(strp: [*c][*c]u8, fmt: [*c]const u8, ...) c_int;
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
pub extern fn SDL_CreateMutex_REAL() ?*SDL_Mutex;
pub extern fn SDL_LockMutex_REAL(mutex: ?*SDL_Mutex) void;
pub extern fn SDL_UnlockMutex_REAL(mutex: ?*SDL_Mutex) void;
pub extern fn SDL_DestroyMutex_REAL(mutex: ?*SDL_Mutex) void;
pub extern fn SDL_GetPersistentString(string: [*c]const u8) [*c]const u8;
pub const SDL_HashCallback = ?*const fn (userdata: ?*anyopaque, key: ?*const anyopaque) callconv(.c) Uint32;
pub const SDL_HashKeyMatchCallback = ?*const fn (userdata: ?*anyopaque, a: ?*const anyopaque, b: ?*const anyopaque) callconv(.c) bool;
pub const SDL_HashDestroyCallback = ?*const fn (userdata: ?*anyopaque, key: ?*const anyopaque, value: ?*const anyopaque) callconv(.c) void;
pub const SDL_HashTableIterateCallback = ?*const fn (userdata: ?*anyopaque, table: ?*const SDL_HashTable, key: ?*const anyopaque, value: ?*const anyopaque) callconv(.c) bool;
pub extern fn SDL_CreateHashTable(estimated_capacity: c_int, threadsafe: bool, hash: SDL_HashCallback, keymatch: SDL_HashKeyMatchCallback, destroy: SDL_HashDestroyCallback, userdata: ?*anyopaque) ?*SDL_HashTable;
pub extern fn SDL_DestroyHashTable(table: ?*SDL_HashTable) void;
pub extern fn SDL_InsertIntoHashTable(table: ?*SDL_HashTable, key: ?*const anyopaque, value: ?*const anyopaque, replace: bool) bool;
pub extern fn SDL_FindInHashTable(table: ?*const SDL_HashTable, key: ?*const anyopaque, value: [*c]?*const anyopaque) bool;
pub extern fn SDL_RemoveFromHashTable(table: ?*SDL_HashTable, key: ?*const anyopaque) bool;
pub extern fn SDL_IterateHashTable(table: ?*const SDL_HashTable, callback: SDL_HashTableIterateCallback, userdata: ?*anyopaque) bool;
pub extern fn SDL_HashString(unused: ?*anyopaque, key: ?*const anyopaque) Uint32;
pub extern fn SDL_KeyMatchString(unused: ?*anyopaque, a: ?*const anyopaque, b: ?*const anyopaque) bool;
pub extern fn SDL_DestroyHashKey(unused: ?*anyopaque, key: ?*const anyopaque, value: ?*const anyopaque) void;
pub extern var environ: [*c][*c]u8;
pub var SDL_environment: [*c]SDL_Environment = null;
pub export fn SDL_GetEnvironment_REAL() [*c]SDL_Environment {
    @setEvalBranchQuota(100000);
    if (!(SDL_environment != null)) {
        SDL_environment = SDL_CreateEnvironment_REAL(@"true" != 0);
    }
    return SDL_environment;
}
pub export fn SDL_InitEnvironment() bool {
    @setEvalBranchQuota(100000);
    return @as(?*anyopaque, @ptrCast(@alignCast(SDL_GetEnvironment_REAL()))) != @as(?*anyopaque, null);
}
pub export fn SDL_QuitEnvironment() void {
    @setEvalBranchQuota(100000);
    var env: [*c]SDL_Environment = SDL_environment;
    _ = &env;
    if (env != null) {
        SDL_environment = null;
        SDL_DestroyEnvironment_REAL(env);
    }
}
pub export fn SDL_CreateEnvironment_REAL(populated: bool) [*c]SDL_Environment {
    @setEvalBranchQuota(100000);
    var env: [*c]SDL_Environment = undefined;
    env = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(env.*)))));
    _ = &env;
    if (!(env != null)) {
        return null;
    }
    env.*.lock = SDL_CreateMutex_REAL();
    if (!(env.*.lock != null)) {
        SDL_free_REAL(@ptrCast(@alignCast(env)));
        return null;
    }
    env.*.strings = SDL_CreateHashTable(0, @"false" != 0, SDL_HashString, SDL_KeyMatchString, SDL_DestroyHashKey, null);
    if (!(env.*.strings != null)) {
        SDL_DestroyMutex_REAL(env.*.lock);
        SDL_free_REAL(@ptrCast(@alignCast(env)));
        return null;
    }
    if (populated) {
        var strings: [*c][*c]u8 = environ;
        _ = &strings;
        if (strings != null) {
            {
                var i: c_int = 0;
                _ = &i;
                while (strings[@bitCast(@as(isize, @intCast(i)))] != null) : (i += 1) {
                    var variable: [*c]u8 = SDL_strdup_REAL(strings[@bitCast(@as(isize, @intCast(i)))]);
                    _ = &variable;
                    if (!(variable != null)) {
                        continue;
                    }
                    var value: [*c]u8 = SDL_strchr_REAL(variable, '=');
                    _ = &value;
                    if (!(value != null) or (value == variable)) {
                        SDL_free_REAL(@ptrCast(@alignCast(variable)));
                        continue;
                    }
                    (blk: {
                        const ref = &value;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).* = '\x00';
                    _ = SDL_InsertIntoHashTable(env.*.strings, @ptrCast(@alignCast(variable)), @ptrCast(@alignCast(value)), @"true" != 0);
                }
            }
        }
    }
    return env;
}
pub export fn SDL_GetEnvironmentVariable_REAL(env: [*c]SDL_Environment, name: [*c]const u8) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var result: [*c]const u8 = null;
    _ = &result;
    if (!(env != null)) {
        return null;
    } else if (!(name != null) or (@as(c_int, name.*) == @as(c_int, '\x00'))) {
        return null;
    }
    SDL_LockMutex_REAL(env.*.lock);
    {
        var value: [*c]const u8 = undefined;
        _ = &value;
        if (SDL_FindInHashTable(env.*.strings, @ptrCast(@alignCast(name)), @ptrCast(@alignCast(&value)))) {
            result = SDL_GetPersistentString(value);
        }
    }
    SDL_UnlockMutex_REAL(env.*.lock);
    return result;
}
pub const struct_CountEnvStringsData = extern struct {
    count: usize = 0,
    length: usize = 0,
};
pub const CountEnvStringsData = struct_CountEnvStringsData;
pub fn CountEnvStrings(userdata: ?*anyopaque, _: ?*const SDL_HashTable, key: ?*const anyopaque, value: ?*const anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]CountEnvStringsData = @ptrCast(@alignCast(userdata));
    _ = &data;
    data.*.length +%= ((SDL_strlen_REAL(@ptrCast(@alignCast(key))) +% @as(usize, 1)) +% SDL_strlen_REAL(@ptrCast(@alignCast(value)))) +% @as(usize, 1);
    data.*.count +%= 1;
    return @"true" != 0;
}
pub const struct_CopyEnvStringsData = extern struct {
    result: [*c][*c]u8 = null,
    string: [*c]u8 = null,
    count: usize = 0,
};
pub const CopyEnvStringsData = struct_CopyEnvStringsData;
pub fn CopyEnvStrings(userdata: ?*anyopaque, _: ?*const SDL_HashTable, vkey: ?*const anyopaque, vvalue: ?*const anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]CopyEnvStringsData = @ptrCast(@alignCast(userdata));
    _ = &data;
    var key: [*c]const u8 = @ptrCast(@alignCast(vkey));
    _ = &key;
    var value: [*c]const u8 = @ptrCast(@alignCast(vvalue));
    _ = &value;
    var len: usize = undefined;
    _ = &len;
    len = SDL_strlen_REAL(key);
    data.*.result[data.*.count] = data.*.string;
    _ = memcpy(@ptrCast(@alignCast(data.*.string)), @ptrCast(@alignCast(key)), len);
    data.*.string += len;
    (blk: {
        const ref = &data.*.string;
        const tmp = ref.*;
        ref.* += 1;
        break :blk tmp;
    }).* = '=';
    len = SDL_strlen_REAL(value);
    _ = memcpy(@ptrCast(@alignCast(data.*.string)), @ptrCast(@alignCast(value)), len);
    data.*.string += len;
    (blk: {
        const ref = &data.*.string;
        const tmp = ref.*;
        ref.* += 1;
        break :blk tmp;
    }).* = '\x00';
    data.*.count +%= 1;
    return @"true" != 0;
}
pub export fn SDL_GetEnvironmentVariables_REAL(env: [*c]SDL_Environment) [*c][*c]u8 {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [32:0]u8 = "SDL_GetEnvironmentVariables_REAL".*;
    };
    _ = &static_local___func__;
    var result: [*c][*c]u8 = null;
    _ = &result;
    if (!(env != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("env"))));
        return null;
    }
    SDL_LockMutex_REAL(env.*.lock);
    {
        var countdata: CountEnvStringsData = CountEnvStringsData{
            .count = 0,
            .length = 0,
        };
        _ = &countdata;
        _ = SDL_IterateHashTable(env.*.strings, CountEnvStrings, @ptrCast(@alignCast(&countdata)));
        result = @ptrCast(@alignCast(SDL_malloc_REAL(((countdata.count +% @as(usize, 1)) *% @sizeOf(@TypeOf(result.*))) +% countdata.length)));
        if (result != null) {
            var string: [*c]u8 = @ptrCast(@alignCast((result + countdata.count) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))))));
            _ = &string;
            var cpydata: CopyEnvStringsData = CopyEnvStringsData{
                .result = result,
                .string = string,
                .count = 0,
            };
            _ = &cpydata;
            _ = SDL_IterateHashTable(env.*.strings, CopyEnvStrings, @ptrCast(@alignCast(&cpydata)));
            while (true) {
                while (!(countdata.count == cpydata.count)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "countdata.count == cpydata.count",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_getenv.c", 259);
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
            result[cpydata.count] = null;
        }
    }
    SDL_UnlockMutex_REAL(env.*.lock);
    return result;
}
pub export fn SDL_SetEnvironmentVariable_REAL(env: [*c]SDL_Environment, arg_name: [*c]const u8, arg_value: [*c]const u8, overwrite: bool) bool {
    @setEvalBranchQuota(100000);
    var name = arg_name;
    _ = &name;
    var value = arg_value;
    _ = &value;
    var result: bool = @"false" != 0;
    _ = &result;
    if (!(env != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("env"))));
    }
    if ((!(name != null) or (@as(c_int, name.*) == @as(c_int, '\x00'))) or (@as(?*anyopaque, @ptrCast(@alignCast(SDL_strchr_REAL(name, '=')))) != @as(?*anyopaque, null))) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("name"))));
    }
    if (!(value != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("value"))));
    }
    SDL_LockMutex_REAL(env.*.lock);
    {
        var string: [*c]u8 = null;
        _ = &string;
        if (SDL_asprintf_REAL(&string, "%s=%s", name, value) > @as(c_int, 0)) {
            const len: usize = SDL_strlen_REAL(name);
            _ = &len;
            string[len] = '\x00';
            var origname: [*c]const u8 = name;
            _ = &origname;
            name = string;
            value = (string + len) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
            result = SDL_InsertIntoHashTable(env.*.strings, @ptrCast(@alignCast(name)), @ptrCast(@alignCast(value)), overwrite);
            if (!result) {
                SDL_free_REAL(@ptrCast(@alignCast(string)));
                if (!overwrite) {
                    var existing_value: ?*const anyopaque = null;
                    _ = &existing_value;
                    if (SDL_FindInHashTable(env.*.strings, @ptrCast(@alignCast(origname)), &existing_value)) {
                        result = @"true" != 0;
                    }
                }
            }
        }
    }
    SDL_UnlockMutex_REAL(env.*.lock);
    return result;
}
pub export fn SDL_UnsetEnvironmentVariable_REAL(env: [*c]SDL_Environment, name: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    var result: bool = @"false" != 0;
    _ = &result;
    if (!(env != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("env"))));
    }
    if ((!(name != null) or (@as(c_int, name.*) == @as(c_int, '\x00'))) or (@as(?*anyopaque, @ptrCast(@alignCast(SDL_strchr_REAL(name, '=')))) != @as(?*anyopaque, null))) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("name"))));
    }
    SDL_LockMutex_REAL(env.*.lock);
    {
        var value: ?*const anyopaque = undefined;
        _ = &value;
        if (SDL_FindInHashTable(env.*.strings, @ptrCast(@alignCast(name)), &value)) {
            result = SDL_RemoveFromHashTable(env.*.strings, @ptrCast(@alignCast(name)));
        } else {
            result = @"true" != 0;
        }
    }
    SDL_UnlockMutex_REAL(env.*.lock);
    return result;
}
pub export fn SDL_DestroyEnvironment_REAL(env: [*c]SDL_Environment) void {
    @setEvalBranchQuota(100000);
    if (!(env != null) or (env == SDL_environment)) {
        return;
    }
    SDL_DestroyMutex_REAL(env.*.lock);
    SDL_DestroyHashTable(env.*.strings);
    SDL_free_REAL(@ptrCast(@alignCast(env)));
}
pub export fn SDL_setenv_unsafe_REAL(name: [*c]const u8, value: [*c]const u8, overwrite: c_int) c_int {
    @setEvalBranchQuota(100000);
    if (((!(name != null) or (@as(c_int, name.*) == @as(c_int, '\x00'))) or (@as(?*anyopaque, @ptrCast(@alignCast(SDL_strchr_REAL(name, '=')))) != @as(?*anyopaque, null))) or !(value != null)) {
        return -@as(c_int, 1);
    }
    if (SDL_environment != null) {
        _ = SDL_SetEnvironmentVariable_REAL(SDL_environment, name, value, overwrite != @as(c_int, 0));
    }
    return setenv(name, value, overwrite);
}
pub export fn SDL_unsetenv_unsafe_REAL(name: [*c]const u8) c_int {
    @setEvalBranchQuota(100000);
    if ((!(name != null) or (@as(c_int, name.*) == @as(c_int, '\x00'))) or (@as(?*anyopaque, @ptrCast(@alignCast(SDL_strchr_REAL(name, '=')))) != @as(?*anyopaque, null))) {
        return -@as(c_int, 1);
    }
    if (SDL_environment != null) {
        _ = SDL_UnsetEnvironmentVariable_REAL(SDL_environment, name);
    }
    return unsetenv(name);
}
pub export fn SDL_getenv_unsafe_REAL(name: [*c]const u8) [*c]const u8 {
    @setEvalBranchQuota(100000);
    if (!(name != null) or (@as(c_int, name.*) == @as(c_int, '\x00'))) {
        return null;
    }
    return getenv(name);
}
pub export fn SDL_getenv_REAL(name: [*c]const u8) [*c]const u8 {
    @setEvalBranchQuota(100000);
    return SDL_GetEnvironmentVariable_REAL(SDL_GetEnvironment_REAL(), name);
}

pub const SDL_CreateEnvironment = SDL_CreateEnvironment_REAL;
pub const SDL_DestroyEnvironment = SDL_DestroyEnvironment_REAL;
pub const SDL_GetEnvironment = SDL_GetEnvironment_REAL;
pub const SDL_GetEnvironmentVariable = SDL_GetEnvironmentVariable_REAL;
pub const SDL_GetEnvironmentVariables = SDL_GetEnvironmentVariables_REAL;
pub const SDL_SetEnvironmentVariable = SDL_SetEnvironmentVariable_REAL;
pub const SDL_UnsetEnvironmentVariable = SDL_UnsetEnvironmentVariable_REAL;
pub const SDL_getenv = SDL_getenv_REAL;
pub const SDL_getenv_unsafe = SDL_getenv_unsafe_REAL;
pub const SDL_setenv_unsafe = SDL_setenv_unsafe_REAL;
pub const SDL_unsetenv_unsafe = SDL_unsetenv_unsafe_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
