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
pub const Uint32 = u32;
pub const Sint64 = i64;
pub const Uint64 = u64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_atof_REAL(str: [*c]const u8) f64;
pub extern fn SDL_strtoll_REAL(str: [*c]const u8, endp: [*c][*c]u8, base: c_int) c_longlong;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_asprintf_REAL(strp: [*c][*c]u8, fmt: [*c]const u8, ...) c_int;
pub extern fn SDL_round_REAL(x: f64) f64;
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
pub const struct_SDL_AtomicU32 = extern struct {
    value: Uint32 = 0,
};
pub const SDL_AtomicU32 = struct_SDL_AtomicU32;
pub extern fn SDL_CompareAndSwapAtomicU32_REAL(a: [*c]SDL_AtomicU32, oldval: Uint32, newval: Uint32) bool;
pub extern fn SDL_GetAtomicU32_REAL(a: [*c]SDL_AtomicU32) Uint32;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_PropertiesID = Uint32;
pub const SDL_PROPERTY_TYPE_INVALID: c_int = 0;
pub const SDL_PROPERTY_TYPE_POINTER: c_int = 1;
pub const SDL_PROPERTY_TYPE_STRING: c_int = 2;
pub const SDL_PROPERTY_TYPE_NUMBER: c_int = 3;
pub const SDL_PROPERTY_TYPE_FLOAT: c_int = 4;
pub const SDL_PROPERTY_TYPE_BOOLEAN: c_int = 5;
pub const enum_SDL_PropertyType = c_uint;
pub const SDL_PropertyType = enum_SDL_PropertyType;
pub const SDL_CleanupPropertyCallback = ?*const fn (userdata: ?*anyopaque, value: ?*anyopaque) callconv(.c) void;
pub const SDL_EnumeratePropertiesCallback = ?*const fn (userdata: ?*anyopaque, props: SDL_PropertiesID, name: [*c]const u8) callconv(.c) void;
pub const SDL_ThreadID = Uint64;
pub const struct_SDL_Mutex = opaque {
};
pub const SDL_Mutex = struct_SDL_Mutex;
pub extern fn SDL_CreateMutex_REAL() ?*SDL_Mutex;
pub extern fn SDL_LockMutex_REAL(mutex: ?*SDL_Mutex) void;
pub extern fn SDL_UnlockMutex_REAL(mutex: ?*SDL_Mutex) void;
pub extern fn SDL_DestroyMutex_REAL(mutex: ?*SDL_Mutex) void;
pub const struct_SDL_InitState = extern struct {
    status: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
    thread: SDL_ThreadID = 0,
    reserved: ?*anyopaque = null,
};
pub const SDL_InitState = struct_SDL_InitState;
pub extern fn SDL_ShouldInit_REAL(state: [*c]SDL_InitState) bool;
pub extern fn SDL_ShouldQuit_REAL(state: [*c]SDL_InitState) bool;
pub extern fn SDL_SetInitialized_REAL(state: [*c]SDL_InitState, initialized: bool) void;
pub const struct_SDL_Surface = opaque {
};
pub const SDL_Surface = struct_SDL_Surface;
pub extern fn SDL_DestroySurface_REAL(surface: ?*SDL_Surface) void;
pub extern fn SDL_Log_REAL(fmt: [*c]const u8, ...) void;
pub extern fn SDL_IsUbuntuTouch_REAL() bool;
pub const struct_SDL_HashTable = opaque {
};
pub const SDL_HashTable = struct_SDL_HashTable;
pub const SDL_HashCallback = ?*const fn (userdata: ?*anyopaque, key: ?*const anyopaque) callconv(.c) Uint32;
pub const SDL_HashKeyMatchCallback = ?*const fn (userdata: ?*anyopaque, a: ?*const anyopaque, b: ?*const anyopaque) callconv(.c) bool;
pub const SDL_HashDestroyCallback = ?*const fn (userdata: ?*anyopaque, key: ?*const anyopaque, value: ?*const anyopaque) callconv(.c) void;
pub const SDL_HashTableIterateCallback = ?*const fn (userdata: ?*anyopaque, table: ?*const SDL_HashTable, key: ?*const anyopaque, value: ?*const anyopaque) callconv(.c) bool;
pub extern fn SDL_CreateHashTable(estimated_capacity: c_int, threadsafe: bool, hash: SDL_HashCallback, keymatch: SDL_HashKeyMatchCallback, destroy: SDL_HashDestroyCallback, userdata: ?*anyopaque) ?*SDL_HashTable;
pub extern fn SDL_DestroyHashTable(table: ?*SDL_HashTable) void;
pub extern fn SDL_InsertIntoHashTable(table: ?*SDL_HashTable, key: ?*const anyopaque, value: ?*const anyopaque, replace: bool) bool;
pub extern fn SDL_FindInHashTable(table: ?*const SDL_HashTable, key: ?*const anyopaque, value: [*c]?*const anyopaque) bool;
pub extern fn SDL_RemoveFromHashTable(table: ?*SDL_HashTable, key: ?*const anyopaque) bool;
pub extern fn SDL_GetNumHashTableItems(table: ?*SDL_HashTable) c_int;
pub extern fn SDL_IterateHashTable(table: ?*const SDL_HashTable, callback: SDL_HashTableIterateCallback, userdata: ?*anyopaque) bool;
pub extern fn SDL_HashString(unused: ?*anyopaque, key: ?*const anyopaque) Uint32;
pub extern fn SDL_KeyMatchString(unused: ?*anyopaque, a: ?*const anyopaque, b: ?*const anyopaque) bool;
pub extern fn SDL_HashID(unused: ?*anyopaque, key: ?*const anyopaque) Uint32;
pub extern fn SDL_KeyMatchID(unused: ?*anyopaque, a: ?*const anyopaque, b: ?*const anyopaque) bool;
pub extern fn SDL_GetStringBoolean(value: [*c]const u8, default_value: bool) bool;
pub extern fn SDL_SetupUbuntuTouchGlobalProperties(props: SDL_PropertiesID) bool;
const union_unnamed_14 = extern union {
    pointer_value: ?*anyopaque,
    string_value: [*c]u8,
    number_value: Sint64,
    float_value: f32,
    boolean_value: bool,
};
pub const SDL_Property = extern struct {
    type: SDL_PropertyType = @import("std").mem.zeroes(SDL_PropertyType),
    value: union_unnamed_14 = @import("std").mem.zeroes(union_unnamed_14),
    string_storage: [*c]u8 = null,
    cleanup: SDL_CleanupPropertyCallback = null,
    userdata: ?*anyopaque = null,
};
pub const SDL_Properties = extern struct {
    props: ?*SDL_HashTable = null,
    lock: ?*SDL_Mutex = null,
};
pub var SDL_properties_init: SDL_InitState = @import("std").mem.zeroes(SDL_InitState);
pub var SDL_properties: ?*SDL_HashTable = null;
pub var SDL_last_properties_id: SDL_AtomicU32 = @import("std").mem.zeroes(SDL_AtomicU32);
pub var SDL_global_properties: SDL_AtomicU32 = @import("std").mem.zeroes(SDL_AtomicU32);
pub fn SDL_FreePropertyContents(property: [*c]SDL_Property, cleanup: bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (property.*.type) {
                    @as(SDL_PropertyType, SDL_PROPERTY_TYPE_POINTER) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_PropertyType, SDL_PROPERTY_TYPE_STRING) => {
                        sdl_pc = 6;
                        continue;
                    },
                    else => {
                        sdl_pc = 10;
                        continue;
                    },
                }
            },
            1 => {
                if (property.*.string_storage != null) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            2 => {
                if ((property.*.cleanup != null) and cleanup) {
                    sdl_pc = 3;
                    continue;
                } else {
                    sdl_pc = 4;
                    continue;
                }
            },
            3 => {
                property.*.cleanup.?(property.*.userdata, property.*.value.pointer_value);
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            5 => {
                property.*.cleanup = null;
                property.*.userdata = null;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            6 => {
                if (property.*.value.string_value != null) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                SDL_free_REAL(@ptrCast(@alignCast(property.*.value.string_value)));
                property.*.value.string_value = null;
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            10 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            11 => {
                SDL_free_REAL(@ptrCast(@alignCast(property.*.string_storage)));
                property.*.string_storage = null;
                {
                    sdl_pc = 13;
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
                {}
            },
            else => unreachable,
        }
    }
}
pub fn SDL_FreePropertyWithCleanup(key: ?*const anyopaque, value: ?*const anyopaque, _: ?*anyopaque, cleanup: bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var property: [*c]SDL_Property = @ptrCast(@alignCast(@constCast(value)));
    _ = &property;
    if (property != null) {
        SDL_FreePropertyContents(property, cleanup);
    }
    SDL_free_REAL(@ptrCast(@alignCast(@constCast(key))));
    SDL_free_REAL(@ptrCast(@alignCast(@constCast(value))));
}
pub fn SDL_FreeProperty(data: ?*anyopaque, key: ?*const anyopaque, value: ?*const anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_FreePropertyWithCleanup(key, value, data, @"true" != 0);
}
pub fn SDL_FreeProperties(properties: [*c]SDL_Properties) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (properties != null) {
        SDL_DestroyHashTable(properties.*.props);
        SDL_DestroyMutex_REAL(properties.*.lock);
        SDL_free_REAL(@ptrCast(@alignCast(properties)));
    }
}
pub export fn SDL_InitProperties() bool {
    @setEvalBranchQuota(100000);
    if (!SDL_ShouldInit_REAL(&SDL_properties_init)) {
        return @"true" != 0;
    }
    SDL_properties = SDL_CreateHashTable(0, @"true" != 0, SDL_HashID, SDL_KeyMatchID, null, null);
    const initialized: bool = @as(?*anyopaque, @ptrCast(@alignCast(SDL_properties))) != @as(?*anyopaque, null);
    _ = &initialized;
    SDL_SetInitialized_REAL(&SDL_properties_init, initialized);
    return initialized;
}
pub fn FreeOneProperties(_: ?*anyopaque, _: ?*const SDL_HashTable, _: ?*const anyopaque, value: ?*const anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    SDL_FreeProperties(@ptrCast(@alignCast(@constCast(value))));
    return @"true" != 0;
}
pub export fn SDL_QuitProperties() void {
    @setEvalBranchQuota(100000);
    if (!SDL_ShouldQuit_REAL(&SDL_properties_init)) {
        return;
    }
    var props: SDL_PropertiesID = undefined;
    _ = &props;
    while (true) {
        props = SDL_GetAtomicU32_REAL(&SDL_global_properties);
        if (!!SDL_CompareAndSwapAtomicU32_REAL(&SDL_global_properties, props, 0)) break;
    }
    if (props != 0) {
        SDL_DestroyProperties_REAL(props);
    }
    var properties: ?*SDL_HashTable = SDL_properties;
    _ = &properties;
    SDL_properties = null;
    _ = SDL_IterateHashTable(properties, FreeOneProperties, null);
    SDL_DestroyHashTable(properties);
    SDL_SetInitialized_REAL(&SDL_properties_init, @"false" != 0);
}
pub fn SDL_CheckInitProperties() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_InitProperties();
}
pub export fn SDL_GetGlobalProperties_REAL() SDL_PropertiesID {
    @setEvalBranchQuota(100000);
    var props: SDL_PropertiesID = SDL_GetAtomicU32_REAL(&SDL_global_properties);
    _ = &props;
    if (!(props != 0)) {
        props = SDL_CreateProperties_REAL();
        if (SDL_IsUbuntuTouch_REAL()) {
            if (!SDL_SetupUbuntuTouchGlobalProperties(props)) {
                SDL_DestroyProperties_REAL(props);
                return 0;
            }
        }
        if (!SDL_CompareAndSwapAtomicU32_REAL(&SDL_global_properties, 0, props)) {
            SDL_DestroyProperties_REAL(props);
            props = SDL_GetAtomicU32_REAL(&SDL_global_properties);
        }
    }
    return props;
}
pub export fn SDL_CreateProperties_REAL() SDL_PropertiesID {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [25:0]u8 = "SDL_CreateProperties_REAL".*;
    };
    _ = &static_local___func__;
    if (!SDL_CheckInitProperties()) {
        return 0;
    }
    var properties: [*c]SDL_Properties = undefined;
    properties = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(properties.*)))));
    _ = &properties;
    if (!(properties != null)) {
        return 0;
    }
    properties.*.lock = SDL_CreateMutex_REAL();
    if (!(properties.*.lock != null)) {
        SDL_free_REAL(@ptrCast(@alignCast(properties)));
        return 0;
    }
    properties.*.props = SDL_CreateHashTable(0, @"false" != 0, SDL_HashString, SDL_KeyMatchString, SDL_FreeProperty, null);
    if (!(properties.*.props != null)) {
        SDL_DestroyMutex_REAL(properties.*.lock);
        SDL_free_REAL(@ptrCast(@alignCast(properties)));
        return 0;
    }
    var props: SDL_PropertiesID = 0;
    _ = &props;
    while (true) {
        props = SDL_GetAtomicU32_REAL(&SDL_last_properties_id) +% @as(Uint32, 1);
        if (props == @as(SDL_PropertiesID, 0)) {
            continue;
        } else if (SDL_CompareAndSwapAtomicU32_REAL(&SDL_last_properties_id, props -% @as(SDL_PropertiesID, 1), props)) {
            break;
        }
    }
    while (true) {
        while (!!SDL_FindInHashTable(SDL_properties, @ptrFromInt(@as(usize, props)), null)) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "!SDL_FindInHashTable(SDL_properties, (const void *)(uintptr_t)props, ((void*)0))",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_properties.c", 215);
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
    if (!SDL_InsertIntoHashTable(SDL_properties, @ptrFromInt(@as(usize, props)), @ptrCast(@alignCast(properties)), @"false" != 0)) {
        SDL_FreeProperties(properties);
        return 0;
    }
    return props;
}
pub const struct_CopyOnePropertyData = extern struct {
    dst_properties: [*c]SDL_Properties = null,
    result: bool = false,
};
pub const CopyOnePropertyData = struct_CopyOnePropertyData;
pub fn CopyOneProperty(userdata: ?*anyopaque, _: ?*const SDL_HashTable, key: ?*const anyopaque, value: ?*const anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var src_property: [*c]const SDL_Property = @ptrCast(@alignCast(value));
    _ = &src_property;
    if (src_property.*.cleanup != null) {
        return @"true" != 0;
    }
    var data: [*c]CopyOnePropertyData = @ptrCast(@alignCast(userdata));
    _ = &data;
    var dst_properties: [*c]SDL_Properties = data.*.dst_properties;
    _ = &dst_properties;
    var src_name: [*c]const u8 = @ptrCast(@alignCast(key));
    _ = &src_name;
    var dst_property: [*c]SDL_Property = undefined;
    _ = &dst_property;
    var dst_name: [*c]u8 = SDL_strdup_REAL(src_name);
    _ = &dst_name;
    if (!(dst_name != null)) {
        data.*.result = @"false" != 0;
        return @"true" != 0;
    }
    dst_property = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(@TypeOf(dst_property.*)))));
    if (!(dst_property != null)) {
        SDL_free_REAL(@ptrCast(@alignCast(dst_name)));
        data.*.result = @"false" != 0;
        return @"true" != 0;
    }
    {
        comptime {
            if (!(@sizeOf(@TypeOf(dst_property.*)) == @sizeOf(@TypeOf(src_property.*)))) @compileError("static assertion failed \"sizeof (*(dst_property)) == sizeof (*( src_property))\"");
        }
    }
    _ = memcpy(@ptrCast(@alignCast(dst_property)), @ptrCast(@alignCast(src_property)), @sizeOf(@TypeOf(src_property.*)));
    if (src_property.*.type == @as(SDL_PropertyType, SDL_PROPERTY_TYPE_STRING)) {
        dst_property.*.value.string_value = SDL_strdup_REAL(src_property.*.value.string_value);
        if (!(dst_property.*.value.string_value != null)) {
            SDL_free_REAL(@ptrCast(@alignCast(dst_name)));
            SDL_free_REAL(@ptrCast(@alignCast(dst_property)));
            data.*.result = @"false" != 0;
            return @"true" != 0;
        }
    }
    if (!SDL_InsertIntoHashTable(dst_properties.*.props, @ptrCast(@alignCast(dst_name)), @ptrCast(@alignCast(dst_property)), @"true" != 0)) {
        SDL_FreePropertyWithCleanup(@ptrCast(@alignCast(dst_name)), @ptrCast(@alignCast(dst_property)), null, @"false" != 0);
        data.*.result = @"false" != 0;
    }
    return @"true" != 0;
}
pub export fn SDL_CopyProperties_REAL(src: SDL_PropertiesID, dst: SDL_PropertiesID) bool {
    @setEvalBranchQuota(100000);
    if (!(src != 0)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("src"))));
    }
    if (!(dst != 0)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("dst"))));
    }
    var src_properties: [*c]SDL_Properties = null;
    _ = &src_properties;
    var dst_properties: [*c]SDL_Properties = null;
    _ = &dst_properties;
    _ = SDL_FindInHashTable(SDL_properties, @ptrFromInt(@as(usize, src)), @ptrCast(@alignCast(&src_properties)));
    if (!(src_properties != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("src"))));
    }
    _ = SDL_FindInHashTable(SDL_properties, @ptrFromInt(@as(usize, dst)), @ptrCast(@alignCast(&dst_properties)));
    if (!(dst_properties != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("dst"))));
    }
    var result: bool = @"true" != 0;
    _ = &result;
    SDL_LockMutex_REAL(src_properties.*.lock);
    SDL_LockMutex_REAL(dst_properties.*.lock);
    {
        var data: CopyOnePropertyData = CopyOnePropertyData{
            .dst_properties = dst_properties,
            .result = @"true" != 0,
        };
        _ = &data;
        _ = SDL_IterateHashTable(src_properties.*.props, CopyOneProperty, @ptrCast(@alignCast(&data)));
        result = data.result;
    }
    SDL_UnlockMutex_REAL(dst_properties.*.lock);
    SDL_UnlockMutex_REAL(src_properties.*.lock);
    return result;
}
pub export fn SDL_LockProperties_REAL(props: SDL_PropertiesID) bool {
    @setEvalBranchQuota(100000);
    var properties: [*c]SDL_Properties = null;
    _ = &properties;
    if (!(props != 0)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("props"))));
    }
    _ = SDL_FindInHashTable(SDL_properties, @ptrFromInt(@as(usize, props)), @ptrCast(@alignCast(&properties)));
    if (!(properties != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("props"))));
    }
    SDL_LockMutex_REAL(properties.*.lock);
    return @"true" != 0;
}
pub export fn SDL_UnlockProperties_REAL(props: SDL_PropertiesID) void {
    @setEvalBranchQuota(100000);
    var properties: [*c]SDL_Properties = null;
    _ = &properties;
    if (!(props != 0)) {
        return;
    }
    _ = SDL_FindInHashTable(SDL_properties, @ptrFromInt(@as(usize, props)), @ptrCast(@alignCast(&properties)));
    if (!(properties != null)) {
        return;
    }
    SDL_UnlockMutex_REAL(properties.*.lock);
}
pub fn SDL_SetupPropertyAssignment(props: SDL_PropertiesID, name: [*c]const u8, properties: [*c][*c]SDL_Properties) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (!(props != 0)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("props"))));
    }
    if (!(name != null) or !(@as(c_int, name.*) != 0)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("name"))));
    }
    _ = SDL_FindInHashTable(SDL_properties, @ptrFromInt(@as(usize, props)), @ptrCast(@alignCast(properties)));
    if (!(properties != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("props"))));
    }
    SDL_LockMutex_REAL(properties.*.*.lock);
    return @"true" != 0;
}
pub fn SDL_CleanupPropertyAssignment(properties: [*c]SDL_Properties) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_UnlockMutex_REAL(properties.*.lock);
}
pub export fn SDL_SetPointerPropertyWithCleanup_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: ?*anyopaque, cleanup: SDL_CleanupPropertyCallback, userdata: ?*anyopaque) bool {
    @setEvalBranchQuota(100000);
    var properties: [*c]SDL_Properties = null;
    _ = &properties;
    var result: bool = undefined;
    _ = &result;
    if (value != null) {
        result = SDL_SetupPropertyAssignment(props, name, &properties);
        if (result) {
            var existing: [*c]SDL_Property = undefined;
            _ = &existing;
            if (SDL_FindInHashTable(properties.*.props, @ptrCast(@alignCast(name)), @ptrCast(@alignCast(&existing)))) {
                if ((((existing.*.type == @as(SDL_PropertyType, SDL_PROPERTY_TYPE_POINTER)) and (existing.*.value.pointer_value == value)) and (existing.*.cleanup == cleanup)) and (existing.*.userdata == userdata)) {} else {
                    SDL_FreePropertyContents(existing, @"true" != 0);
                    existing.*.type = SDL_PROPERTY_TYPE_POINTER;
                    existing.*.value.pointer_value = value;
                    existing.*.cleanup = cleanup;
                    existing.*.userdata = userdata;
                }
            } else {
                var key: [*c]u8 = SDL_strdup_REAL(name);
                _ = &key;
                var property: [*c]SDL_Property = undefined;
                property = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(property.*)))));
                _ = &property;
                if (property != null) {
                    property.*.type = SDL_PROPERTY_TYPE_POINTER;
                    property.*.value.pointer_value = value;
                    property.*.cleanup = cleanup;
                    property.*.userdata = userdata;
                }
                if ((!(key != null) or !(property != null)) or !SDL_InsertIntoHashTable(properties.*.props, @ptrCast(@alignCast(key)), @ptrCast(@alignCast(property)), @"false" != 0)) {
                    SDL_FreePropertyWithCleanup(@ptrCast(@alignCast(key)), @ptrCast(@alignCast(property)), null, @"true" != 0);
                    result = @"false" != 0;
                }
            }
            SDL_CleanupPropertyAssignment(properties);
        }
    } else {
        result = SDL_ClearProperty_REAL(props, name);
    }
    if (!result and (cleanup != null)) {
        cleanup.?(userdata, value);
    }
    return result;
}
pub export fn SDL_SetPointerProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: ?*anyopaque) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetPointerPropertyWithCleanup_REAL(props, name, value, null, null);
}
pub fn CleanupFreeableProperty(_: ?*anyopaque, value: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_free_REAL(value);
}
pub export fn SDL_SetFreeableProperty(props: SDL_PropertiesID, name: [*c]const u8, value: ?*anyopaque) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetPointerPropertyWithCleanup_REAL(props, name, value, CleanupFreeableProperty, null);
}
pub fn CleanupSurface(_: ?*anyopaque, value: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var surface: ?*SDL_Surface = @ptrCast(@alignCast(value));
    _ = &surface;
    SDL_DestroySurface_REAL(surface);
}
pub export fn SDL_SetSurfaceProperty(props: SDL_PropertiesID, name: [*c]const u8, surface: ?*SDL_Surface) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetPointerPropertyWithCleanup_REAL(props, name, @ptrCast(@alignCast(surface)), CleanupSurface, null);
}
pub export fn SDL_SetStringProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    var properties: [*c]SDL_Properties = null;
    _ = &properties;
    var result: bool = undefined;
    _ = &result;
    if (value != null) {
        result = SDL_SetupPropertyAssignment(props, name, &properties);
        if (result) {
            var existing: [*c]SDL_Property = undefined;
            _ = &existing;
            if (SDL_FindInHashTable(properties.*.props, @ptrCast(@alignCast(name)), @ptrCast(@alignCast(&existing)))) {
                if ((existing.*.type == @as(SDL_PropertyType, SDL_PROPERTY_TYPE_STRING)) and (SDL_strcmp_REAL(existing.*.value.string_value, value) == @as(c_int, 0))) {} else {
                    var string: [*c]u8 = SDL_strdup_REAL(value);
                    _ = &string;
                    if (string != null) {
                        SDL_FreePropertyContents(existing, @"true" != 0);
                        existing.*.type = SDL_PROPERTY_TYPE_STRING;
                        existing.*.value.string_value = string;
                    } else {
                        result = @"false" != 0;
                    }
                }
            } else {
                var key: [*c]u8 = SDL_strdup_REAL(name);
                _ = &key;
                var property: [*c]SDL_Property = undefined;
                property = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(property.*)))));
                _ = &property;
                var string: [*c]u8 = SDL_strdup_REAL(value);
                _ = &string;
                if (property != null) {
                    property.*.type = SDL_PROPERTY_TYPE_STRING;
                    property.*.value.string_value = string;
                }
                if (((!(key != null) or !(property != null)) or !(string != null)) or !SDL_InsertIntoHashTable(properties.*.props, @ptrCast(@alignCast(key)), @ptrCast(@alignCast(property)), @"false" != 0)) {
                    if (property != null) {
                        property.*.value.string_value = null;
                    }
                    SDL_free_REAL(@ptrCast(@alignCast(string)));
                    SDL_FreePropertyWithCleanup(@ptrCast(@alignCast(key)), @ptrCast(@alignCast(property)), null, @"true" != 0);
                    result = @"false" != 0;
                }
            }
            SDL_CleanupPropertyAssignment(properties);
        }
    } else {
        return SDL_ClearProperty_REAL(props, name);
    }
    return result;
}
pub export fn SDL_SetNumberProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: Sint64) bool {
    @setEvalBranchQuota(100000);
    var properties: [*c]SDL_Properties = null;
    _ = &properties;
    var result: bool = undefined;
    _ = &result;
    result = SDL_SetupPropertyAssignment(props, name, &properties);
    if (result) {
        var existing: [*c]SDL_Property = undefined;
        _ = &existing;
        if (SDL_FindInHashTable(properties.*.props, @ptrCast(@alignCast(name)), @ptrCast(@alignCast(&existing)))) {
            if (existing.*.type != @as(SDL_PropertyType, SDL_PROPERTY_TYPE_NUMBER)) {
                SDL_FreePropertyContents(existing, @"true" != 0);
                existing.*.type = SDL_PROPERTY_TYPE_NUMBER;
            }
            existing.*.value.number_value = value;
        } else {
            var key: [*c]u8 = SDL_strdup_REAL(name);
            _ = &key;
            var property: [*c]SDL_Property = undefined;
            property = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(property.*)))));
            _ = &property;
            if (property != null) {
                property.*.type = SDL_PROPERTY_TYPE_NUMBER;
                property.*.value.number_value = value;
            }
            if ((!(key != null) or !(property != null)) or !SDL_InsertIntoHashTable(properties.*.props, @ptrCast(@alignCast(key)), @ptrCast(@alignCast(property)), @"false" != 0)) {
                SDL_FreePropertyWithCleanup(@ptrCast(@alignCast(key)), @ptrCast(@alignCast(property)), null, @"true" != 0);
                result = @"false" != 0;
            }
        }
        SDL_CleanupPropertyAssignment(properties);
    }
    return result;
}
pub export fn SDL_SetFloatProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: f32) bool {
    @setEvalBranchQuota(100000);
    var properties: [*c]SDL_Properties = null;
    _ = &properties;
    var result: bool = undefined;
    _ = &result;
    result = SDL_SetupPropertyAssignment(props, name, &properties);
    if (result) {
        var existing: [*c]SDL_Property = undefined;
        _ = &existing;
        if (SDL_FindInHashTable(properties.*.props, @ptrCast(@alignCast(name)), @ptrCast(@alignCast(&existing)))) {
            if (existing.*.type != @as(SDL_PropertyType, SDL_PROPERTY_TYPE_FLOAT)) {
                SDL_FreePropertyContents(existing, @"true" != 0);
                existing.*.type = SDL_PROPERTY_TYPE_FLOAT;
            }
            existing.*.value.float_value = value;
        } else {
            var key: [*c]u8 = SDL_strdup_REAL(name);
            _ = &key;
            var property: [*c]SDL_Property = undefined;
            property = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(property.*)))));
            _ = &property;
            if (property != null) {
                property.*.type = SDL_PROPERTY_TYPE_FLOAT;
                property.*.value.float_value = value;
            }
            if ((!(key != null) or !(property != null)) or !SDL_InsertIntoHashTable(properties.*.props, @ptrCast(@alignCast(key)), @ptrCast(@alignCast(property)), @"false" != 0)) {
                SDL_FreePropertyWithCleanup(@ptrCast(@alignCast(key)), @ptrCast(@alignCast(property)), null, @"true" != 0);
                result = @"false" != 0;
            }
        }
        SDL_CleanupPropertyAssignment(properties);
    }
    return result;
}
pub export fn SDL_SetBooleanProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: bool) bool {
    @setEvalBranchQuota(100000);
    var properties: [*c]SDL_Properties = null;
    _ = &properties;
    var result: bool = undefined;
    _ = &result;
    result = SDL_SetupPropertyAssignment(props, name, &properties);
    if (result) {
        var existing: [*c]SDL_Property = undefined;
        _ = &existing;
        if (SDL_FindInHashTable(properties.*.props, @ptrCast(@alignCast(name)), @ptrCast(@alignCast(&existing)))) {
            if (existing.*.type != @as(SDL_PropertyType, SDL_PROPERTY_TYPE_BOOLEAN)) {
                SDL_FreePropertyContents(existing, @"true" != 0);
                existing.*.type = SDL_PROPERTY_TYPE_BOOLEAN;
            }
            existing.*.value.boolean_value = value;
        } else {
            var key: [*c]u8 = SDL_strdup_REAL(name);
            _ = &key;
            var property: [*c]SDL_Property = undefined;
            property = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(property.*)))));
            _ = &property;
            if (property != null) {
                property.*.type = SDL_PROPERTY_TYPE_BOOLEAN;
                property.*.value.boolean_value = value;
            }
            if ((!(key != null) or !(property != null)) or !SDL_InsertIntoHashTable(properties.*.props, @ptrCast(@alignCast(key)), @ptrCast(@alignCast(property)), @"false" != 0)) {
                SDL_FreePropertyWithCleanup(@ptrCast(@alignCast(key)), @ptrCast(@alignCast(property)), null, @"true" != 0);
                result = @"false" != 0;
            }
        }
        SDL_CleanupPropertyAssignment(properties);
    }
    return result;
}
pub export fn SDL_HasProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    return SDL_GetPropertyType_REAL(props, name) != @as(SDL_PropertyType, SDL_PROPERTY_TYPE_INVALID);
}
pub fn SDL_SetupPropertyQuery(props: SDL_PropertiesID, name: [*c]const u8, properties: [*c][*c]SDL_Properties) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (!(props != 0)) {
        return @"false" != 0;
    }
    if (!(name != null) or !(@as(c_int, name.*) != 0)) {
        return @"false" != 0;
    }
    _ = SDL_FindInHashTable(SDL_properties, @ptrFromInt(@as(usize, props)), @ptrCast(@alignCast(properties)));
    if (!(properties != null)) {
        return @"false" != 0;
    }
    SDL_LockMutex_REAL(properties.*.*.lock);
    return @"true" != 0;
}
pub fn SDL_CleanupPropertyQuery(properties: [*c]SDL_Properties) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_UnlockMutex_REAL(properties.*.lock);
}
pub export fn SDL_GetPropertyType_REAL(props: SDL_PropertiesID, name: [*c]const u8) SDL_PropertyType {
    @setEvalBranchQuota(100000);
    var properties: [*c]SDL_Properties = null;
    _ = &properties;
    var @"type": SDL_PropertyType = SDL_PROPERTY_TYPE_INVALID;
    _ = &@"type";
    if (SDL_SetupPropertyQuery(props, name, &properties)) {
        var property: [*c]SDL_Property = null;
        _ = &property;
        if (SDL_FindInHashTable(properties.*.props, @ptrCast(@alignCast(name)), @ptrCast(@alignCast(&property)))) {
            @"type" = property.*.type;
        }
        SDL_CleanupPropertyQuery(properties);
    }
    return @"type";
}
pub export fn SDL_GetPointerProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: ?*anyopaque) ?*anyopaque {
    @setEvalBranchQuota(100000);
    var properties: [*c]SDL_Properties = null;
    _ = &properties;
    var value: ?*anyopaque = default_value;
    _ = &value;
    if (SDL_SetupPropertyQuery(props, name, &properties)) {
        var property: [*c]SDL_Property = null;
        _ = &property;
        if (SDL_FindInHashTable(properties.*.props, @ptrCast(@alignCast(name)), @ptrCast(@alignCast(&property)))) {
            if (property.*.type == @as(SDL_PropertyType, SDL_PROPERTY_TYPE_POINTER)) {
                value = property.*.value.pointer_value;
            }
        }
        SDL_CleanupPropertyQuery(properties);
    }
    return value;
}
pub export fn SDL_GetStringProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: [*c]const u8) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var properties: [*c]SDL_Properties = undefined;
    _ = &properties;
    var value: [*c]const u8 = undefined;
    _ = &value;
    var property: [*c]SDL_Property = undefined;
    _ = &property;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                properties = null;
                value = default_value;
                if (SDL_SetupPropertyQuery(props, name, &properties)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                property = null;
                if (SDL_FindInHashTable(properties.*.props, @ptrCast(@alignCast(name)), @ptrCast(@alignCast(&property)))) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                return value;
            },
            4 => {
                switch (property.*.type) {
                    @as(SDL_PropertyType, SDL_PROPERTY_TYPE_STRING) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(SDL_PropertyType, SDL_PROPERTY_TYPE_NUMBER) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(SDL_PropertyType, SDL_PROPERTY_TYPE_FLOAT) => {
                        sdl_pc = 16;
                        continue;
                    },
                    @as(SDL_PropertyType, SDL_PROPERTY_TYPE_BOOLEAN) => {
                        sdl_pc = 23;
                        continue;
                    },
                    else => {
                        sdl_pc = 24;
                        continue;
                    },
                }
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                SDL_CleanupPropertyQuery(properties);
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            7 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            8 => {
                value = property.*.value.string_value;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            9 => {
                if (property.*.string_storage != null) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                value = property.*.string_storage;
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                _ = SDL_asprintf_REAL(&property.*.string_storage, "%ld", property.*.value.number_value);
                if (property.*.string_storage != null) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            13 => {
                value = property.*.string_storage;
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            16 => {
                if (property.*.string_storage != null) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            17 => {
                value = property.*.string_storage;
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            18 => {
                _ = SDL_asprintf_REAL(&property.*.string_storage, "%f", property.*.value.float_value);
                if (property.*.string_storage != null) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            19 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            20 => {
                value = property.*.string_storage;
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            21 => {
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            22 => {
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            23 => {
                value = if (property.*.value.boolean_value) @as([*c]u8, @as([*c]u8, @constCast("true"))) else @as([*c]u8, @as([*c]u8, @constCast("false")));
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            24 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_GetNumberProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: Sint64) Sint64 {
    @setEvalBranchQuota(100000);
    var properties: [*c]SDL_Properties = undefined;
    _ = &properties;
    var value: Sint64 = undefined;
    _ = &value;
    var property: [*c]SDL_Property = undefined;
    _ = &property;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                properties = null;
                value = default_value;
                if (SDL_SetupPropertyQuery(props, name, &properties)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                property = null;
                if (SDL_FindInHashTable(properties.*.props, @ptrCast(@alignCast(name)), @ptrCast(@alignCast(&property)))) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                return value;
            },
            4 => {
                switch (property.*.type) {
                    @as(SDL_PropertyType, SDL_PROPERTY_TYPE_STRING) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(SDL_PropertyType, SDL_PROPERTY_TYPE_NUMBER) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(SDL_PropertyType, SDL_PROPERTY_TYPE_FLOAT) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(SDL_PropertyType, SDL_PROPERTY_TYPE_BOOLEAN) => {
                        sdl_pc = 11;
                        continue;
                    },
                    else => {
                        sdl_pc = 12;
                        continue;
                    },
                }
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                SDL_CleanupPropertyQuery(properties);
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            7 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            8 => {
                value = @truncate(SDL_strtoll_REAL(property.*.value.string_value, null, 0));
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            9 => {
                value = property.*.value.number_value;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            10 => {
                value = @intFromFloat(SDL_round_REAL(@floatCast(property.*.value.float_value)));
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            11 => {
                value = @intFromBool(property.*.value.boolean_value);
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_GetFloatProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: f32) f32 {
    @setEvalBranchQuota(100000);
    var properties: [*c]SDL_Properties = undefined;
    _ = &properties;
    var value: f32 = undefined;
    _ = &value;
    var property: [*c]SDL_Property = undefined;
    _ = &property;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                properties = null;
                value = default_value;
                if (SDL_SetupPropertyQuery(props, name, &properties)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                property = null;
                if (SDL_FindInHashTable(properties.*.props, @ptrCast(@alignCast(name)), @ptrCast(@alignCast(&property)))) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                return value;
            },
            4 => {
                switch (property.*.type) {
                    @as(SDL_PropertyType, SDL_PROPERTY_TYPE_STRING) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(SDL_PropertyType, SDL_PROPERTY_TYPE_NUMBER) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(SDL_PropertyType, SDL_PROPERTY_TYPE_FLOAT) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(SDL_PropertyType, SDL_PROPERTY_TYPE_BOOLEAN) => {
                        sdl_pc = 11;
                        continue;
                    },
                    else => {
                        sdl_pc = 12;
                        continue;
                    },
                }
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                SDL_CleanupPropertyQuery(properties);
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            7 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            8 => {
                value = @floatCast(SDL_atof_REAL(property.*.value.string_value));
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            9 => {
                value = @floatFromInt(property.*.value.number_value);
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            10 => {
                value = property.*.value.float_value;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            11 => {
                value = @floatFromInt(@intFromBool(property.*.value.boolean_value));
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_GetBooleanProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: bool) bool {
    @setEvalBranchQuota(100000);
    var properties: [*c]SDL_Properties = undefined;
    _ = &properties;
    var value: bool = undefined;
    _ = &value;
    var property: [*c]SDL_Property = undefined;
    _ = &property;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                properties = null;
                value = (if (default_value) @"true" else @"false") != 0;
                if (SDL_SetupPropertyQuery(props, name, &properties)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                property = null;
                if (SDL_FindInHashTable(properties.*.props, @ptrCast(@alignCast(name)), @ptrCast(@alignCast(&property)))) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                return value;
            },
            4 => {
                switch (property.*.type) {
                    @as(SDL_PropertyType, SDL_PROPERTY_TYPE_STRING) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(SDL_PropertyType, SDL_PROPERTY_TYPE_NUMBER) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(SDL_PropertyType, SDL_PROPERTY_TYPE_FLOAT) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(SDL_PropertyType, SDL_PROPERTY_TYPE_BOOLEAN) => {
                        sdl_pc = 11;
                        continue;
                    },
                    else => {
                        sdl_pc = 12;
                        continue;
                    },
                }
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                SDL_CleanupPropertyQuery(properties);
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            7 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            8 => {
                value = SDL_GetStringBoolean(property.*.value.string_value, default_value);
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            9 => {
                value = property.*.value.number_value != @as(Sint64, 0);
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            10 => {
                value = property.*.value.float_value != @as(f32, 0.0);
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            11 => {
                value = property.*.value.boolean_value;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_ClearProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    var properties: [*c]SDL_Properties = null;
    _ = &properties;
    var result: bool = undefined;
    _ = &result;
    result = SDL_SetupPropertyAssignment(props, name, &properties);
    if (result) {
        _ = SDL_RemoveFromHashTable(properties.*.props, @ptrCast(@alignCast(name)));
        SDL_CleanupPropertyAssignment(properties);
    }
    return result;
}
pub export fn SDL_GetNumProperties_REAL(props: SDL_PropertiesID) c_int {
    @setEvalBranchQuota(100000);
    if (!(props != 0)) {
        return 0;
    }
    var properties: [*c]SDL_Properties = null;
    _ = &properties;
    _ = SDL_FindInHashTable(SDL_properties, @ptrFromInt(@as(usize, props)), @ptrCast(@alignCast(&properties)));
    if (!(properties != null)) {
        return 0;
    }
    SDL_LockMutex_REAL(properties.*.lock);
    const retval: c_int = SDL_GetNumHashTableItems(properties.*.props);
    _ = &retval;
    SDL_UnlockMutex_REAL(properties.*.lock);
    return retval;
}
pub const struct_EnumerateOnePropertyData = extern struct {
    callback: SDL_EnumeratePropertiesCallback = null,
    userdata: ?*anyopaque = null,
    props: SDL_PropertiesID = 0,
};
pub const EnumerateOnePropertyData = struct_EnumerateOnePropertyData;
pub fn EnumerateOneProperty(userdata: ?*anyopaque, arg_table: ?*const SDL_HashTable, key: ?*const anyopaque, arg_value: ?*const anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var table = arg_table;
    _ = &table;
    var value = arg_value;
    _ = &value;
    _ = &table;
    _ = &value;
    var data: [*c]const EnumerateOnePropertyData = @ptrCast(@alignCast(userdata));
    _ = &data;
    data.*.callback.?(data.*.userdata, data.*.props, @ptrCast(@alignCast(key)));
    return @"true" != 0;
}
pub export fn SDL_EnumerateProperties_REAL(props: SDL_PropertiesID, callback: SDL_EnumeratePropertiesCallback, userdata: ?*anyopaque) bool {
    @setEvalBranchQuota(100000);
    var properties: [*c]SDL_Properties = null;
    _ = &properties;
    if (!(props != 0)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("props"))));
    }
    if (!(callback != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("callback"))));
    }
    _ = SDL_FindInHashTable(SDL_properties, @ptrFromInt(@as(usize, props)), @ptrCast(@alignCast(&properties)));
    if (!(properties != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("props"))));
    }
    SDL_LockMutex_REAL(properties.*.lock);
    {
        var data: EnumerateOnePropertyData = EnumerateOnePropertyData{
            .callback = callback,
            .userdata = userdata,
            .props = props,
        };
        _ = &data;
        _ = SDL_IterateHashTable(properties.*.props, EnumerateOneProperty, @ptrCast(@alignCast(&data)));
    }
    SDL_UnlockMutex_REAL(properties.*.lock);
    return @"true" != 0;
}
pub fn SDL_DumpPropertiesCallback(_: ?*anyopaque, props: SDL_PropertiesID, name: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var value: Sint64 = undefined;
    _ = &value;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (SDL_GetPropertyType_REAL(props, name)) {
                    @as(SDL_PropertyType, SDL_PROPERTY_TYPE_POINTER) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_PropertyType, SDL_PROPERTY_TYPE_STRING) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SDL_PropertyType, SDL_PROPERTY_TYPE_NUMBER) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(SDL_PropertyType, SDL_PROPERTY_TYPE_FLOAT) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_PropertyType, SDL_PROPERTY_TYPE_BOOLEAN) => {
                        sdl_pc = 6;
                        continue;
                    },
                    else => {
                        sdl_pc = 7;
                        continue;
                    },
                }
            },
            1 => {
                {}
            },
            2 => {
                SDL_Log_REAL("%s: %p", name, SDL_GetPointerProperty_REAL(props, name, null));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                SDL_Log_REAL("%s: \"%s\"", name, SDL_GetStringProperty_REAL(props, name, ""));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                value = SDL_GetNumberProperty_REAL(props, name, 0);
                SDL_Log_REAL("%s: %ld (%lx)", name, value, value);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            5 => {
                SDL_Log_REAL("%s: %g", name, SDL_GetFloatProperty_REAL(props, name, 0.0));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            6 => {
                SDL_Log_REAL("%s: %s", name, if (SDL_GetBooleanProperty_REAL(props, name, @"false" != 0)) @as([*c]u8, @as([*c]u8, @constCast("true"))) else @as([*c]u8, @as([*c]u8, @constCast("false"))));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            7 => {
                SDL_Log_REAL("%s UNKNOWN TYPE", name);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_DumpProperties(props: SDL_PropertiesID) bool {
    @setEvalBranchQuota(100000);
    return SDL_EnumerateProperties_REAL(props, SDL_DumpPropertiesCallback, null);
}
pub export fn SDL_DestroyProperties_REAL(props: SDL_PropertiesID) void {
    @setEvalBranchQuota(100000);
    if (props != 0) {
        var properties: [*c]SDL_Properties = null;
        _ = &properties;
        if (SDL_FindInHashTable(SDL_properties, @ptrFromInt(@as(usize, props)), @ptrCast(@alignCast(&properties)))) {
            SDL_FreeProperties(properties);
            _ = SDL_RemoveFromHashTable(SDL_properties, @ptrFromInt(@as(usize, props)));
        }
    }
}

pub const SDL_ClearProperty = SDL_ClearProperty_REAL;
pub const SDL_CopyProperties = SDL_CopyProperties_REAL;
pub const SDL_CreateProperties = SDL_CreateProperties_REAL;
pub const SDL_DestroyProperties = SDL_DestroyProperties_REAL;
pub const SDL_EnumerateProperties = SDL_EnumerateProperties_REAL;
pub const SDL_GetBooleanProperty = SDL_GetBooleanProperty_REAL;
pub const SDL_GetFloatProperty = SDL_GetFloatProperty_REAL;
pub const SDL_GetGlobalProperties = SDL_GetGlobalProperties_REAL;
pub const SDL_GetNumberProperty = SDL_GetNumberProperty_REAL;
pub const SDL_GetPointerProperty = SDL_GetPointerProperty_REAL;
pub const SDL_GetPropertyType = SDL_GetPropertyType_REAL;
pub const SDL_GetStringProperty = SDL_GetStringProperty_REAL;
pub const SDL_HasProperty = SDL_HasProperty_REAL;
pub const SDL_LockProperties = SDL_LockProperties_REAL;
pub const SDL_SetBooleanProperty = SDL_SetBooleanProperty_REAL;
pub const SDL_SetFloatProperty = SDL_SetFloatProperty_REAL;
pub const SDL_SetNumberProperty = SDL_SetNumberProperty_REAL;
pub const SDL_SetPointerProperty = SDL_SetPointerProperty_REAL;
pub const SDL_SetPointerPropertyWithCleanup = SDL_SetPointerPropertyWithCleanup_REAL;
pub const SDL_SetStringProperty = SDL_SetStringProperty_REAL;
pub const SDL_UnlockProperties = SDL_UnlockProperties_REAL;
pub const SDL_GetNumProperties = SDL_GetNumProperties_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
