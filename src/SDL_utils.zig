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
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memmove(__dest: ?*anyopaque, __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub const Uint16 = u16;
pub const Uint32 = u32;
pub const Uint64 = u64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_tolower_REAL(x: c_int) c_int;
pub extern fn SDL_memcmp_REAL(s1: ?*const anyopaque, s2: ?*const anyopaque, len: usize) c_int;
pub extern fn SDL_strlen_REAL(str: [*c]const u8) usize;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_strchr_REAL(str: [*c]const u8, c: c_int) [*c]u8;
pub extern fn SDL_strstr_REAL(haystack: [*c]const u8, needle: [*c]const u8) [*c]u8;
pub extern fn SDL_strncmp_REAL(str1: [*c]const u8, str2: [*c]const u8, maxlen: usize) c_int;
pub extern fn SDL_strncasecmp_REAL(str1: [*c]const u8, str2: [*c]const u8, maxlen: usize) c_int;
pub extern fn SDL_snprintf_REAL(text: [*c]u8, maxlen: usize, fmt: [*c]const u8, ...) c_int;
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
pub extern fn SDL_AddAtomicInt_REAL(a: [*c]SDL_AtomicInt, v: c_int) c_int;
pub const SDL_ThreadID = Uint64;
pub const SDL_TLSID = SDL_AtomicInt;
pub extern fn SDL_GetTLS_REAL(id: [*c]SDL_TLSID) ?*anyopaque;
pub const SDL_TLSDestructorCallback = ?*const fn (value: ?*anyopaque) callconv(.c) void;
pub extern fn SDL_SetTLS_REAL(id: [*c]SDL_TLSID, value: ?*const anyopaque, destructor: SDL_TLSDestructorCallback) bool;
pub const struct_SDL_InitState = extern struct {
    status: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
    thread: SDL_ThreadID = 0,
    reserved: ?*anyopaque = null,
};
pub const SDL_InitState = struct_SDL_InitState;
pub extern fn SDL_ShouldInit_REAL(state: [*c]SDL_InitState) bool;
pub extern fn SDL_ShouldQuit_REAL(state: [*c]SDL_InitState) bool;
pub extern fn SDL_SetInitialized_REAL(state: [*c]SDL_InitState, initialized: bool) void;
pub const SDL_GAMEPAD_TYPE_XBOX360: c_int = 2;
pub const SDL_GAMEPAD_TYPE_XBOXONE: c_int = 3;
pub const SDL_GAMEPAD_TYPE_PS3: c_int = 4;
pub const SDL_GAMEPAD_TYPE_PS4: c_int = 5;
pub const SDL_GAMEPAD_TYPE_PS5: c_int = 6;
pub const SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_PRO: c_int = 7;
pub const SDL_GAMEPAD_TYPE_STEAM: c_int = 12;
pub const enum_SDL_GamepadType = c_uint;
pub const SDL_GamepadType = enum_SDL_GamepadType;
pub const SDL_HintCallback = ?*const fn (userdata: ?*anyopaque, name: [*c]const u8, oldValue: [*c]const u8, newValue: [*c]const u8) callconv(.c) void;
pub extern fn SDL_AddHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) bool;
pub extern fn SDL_RemoveHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) void;
pub const SDL_LOG_CATEGORY_SYSTEM: c_int = 3;
pub extern fn SDL_LogDebug_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub const SDL_OBJECT_TYPE_WINDOW: c_int = 1;
pub const SDL_OBJECT_TYPE_RENDERER: c_int = 2;
pub const SDL_OBJECT_TYPE_TEXTURE: c_int = 3;
pub const SDL_OBJECT_TYPE_JOYSTICK: c_int = 4;
pub const SDL_OBJECT_TYPE_GAMEPAD: c_int = 5;
pub const SDL_OBJECT_TYPE_HAPTIC: c_int = 6;
pub const SDL_OBJECT_TYPE_SENSOR: c_int = 7;
pub const SDL_OBJECT_TYPE_HIDAPI_DEVICE: c_int = 8;
pub const SDL_OBJECT_TYPE_HIDAPI_JOYSTICK: c_int = 9;
pub const SDL_OBJECT_TYPE_THREAD: c_int = 10;
pub const SDL_OBJECT_TYPE_TRAY: c_int = 11;
pub const SDL_ObjectType = c_uint;
pub const struct_SDL_HashTable = opaque {};
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
pub extern fn SDL_IterateHashTable(table: ?*const SDL_HashTable, callback: SDL_HashTableIterateCallback, userdata: ?*anyopaque) bool;
pub extern fn SDL_HashString(unused: ?*anyopaque, key: ?*const anyopaque) Uint32;
pub extern fn SDL_KeyMatchString(unused: ?*anyopaque, a: ?*const anyopaque, b: ?*const anyopaque) bool;
pub extern fn SDL_DestroyHashValue(unused: ?*anyopaque, key: ?*const anyopaque, value: ?*const anyopaque) void;
pub extern fn gethostname(__name: [*c]u8, __len: usize) c_int;
pub extern fn truncate(__file: [*c]const u8, __length: __off_t) c_int;
pub extern fn SDL_GetGamepadTypeFromVIDPID(vendor: Uint16, product: Uint16, name: [*c]const u8, forUI: bool) SDL_GamepadType;
const math = @import("core/math.zig");
pub export fn SDL_powerof2(value: c_int) c_int {
    return @bitCast(math.nextPowerOfTwo(value));
}
pub export fn SDL_CalculateGCD(first: u32, second: u32) u32 {
    return math.greatestCommonDivisor(first, second);
}
pub export fn SDL_CalculateFraction(value: f32, numerator: *c_int, denominator: *c_int) void {
    const result = math.approximateFraction(value);
    numerator.* = result.numerator;
    denominator.* = result.denominator;
}
pub export fn SDL_startswith(text: ?[*:0]const u8, prefix: ?[*:0]const u8) bool {
    return math.startsWith(@import("std").mem.span(text orelse return false), @import("std").mem.span(prefix orelse return false));
}
pub export fn SDL_endswith(text: ?[*:0]const u8, suffix: ?[*:0]const u8) bool {
    return math.endsWith(@import("std").mem.span(text orelse return false), @import("std").mem.span(suffix orelse return false));
}
pub export fn SDL_GetNextObjectID() Uint32 {
    @setEvalBranchQuota(100000);
    const static_local_last_id = struct {
        var last_id: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt);
    };
    _ = &static_local_last_id;
    var id: Uint32 = @as(Uint32, @bitCast(@as(c_int, SDL_AddAtomicInt_REAL(&static_local_last_id.last_id, 1)))) +% @as(Uint32, 1);
    _ = &id;
    if (id == @as(Uint32, 0)) {
        id = @as(Uint32, @bitCast(@as(c_int, SDL_AddAtomicInt_REAL(&static_local_last_id.last_id, 1)))) +% @as(Uint32, 1);
    }
    return id;
}
pub var SDL_objects_init: SDL_InitState = @import("std").mem.zeroes(SDL_InitState);
pub var SDL_objects: ?*SDL_HashTable = null;
pub export var SDL_object_validation: bool = @"true" != 0;
pub fn SDL_InvalidParamChecksChanged(_: ?*anyopaque, _: [*c]const u8, _: [*c]const u8, hint: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var validation_enabled: bool = undefined;
    _ = &validation_enabled;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                validation_enabled = @"true" != 0;
                if (hint != null) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                switch (@as(c_int, hint.*)) {
                    @as(c_int, '0') => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(c_int, '1') => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(c_int, '2') => {
                        sdl_pc = 7;
                        continue;
                    },
                    else => {
                        sdl_pc = 8;
                        continue;
                    },
                }
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                SDL_object_validation = validation_enabled;
                {}
            },
            4 => {
                {
                    sdl_pc = 3;
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
                validation_enabled = @"false" != 0;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            7 => {
                validation_enabled = @"true" != 0;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            8 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn SDL_HashObject(_: ?*anyopaque, key: ?*const anyopaque) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    return @truncate(@as(usize, @intCast(@intFromPtr(key))));
}
pub fn SDL_KeyMatchObject(_: ?*anyopaque, a: ?*const anyopaque, b: ?*const anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return a == b;
}
pub export fn SDL_SetObjectValid(object: ?*anyopaque, arg_type: SDL_ObjectType, valid: bool) void {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    const static_local___func__ = struct {
        const __func__: [18:0]u8 = "SDL_SetObjectValid".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!(object != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "object != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_utils.c", 186);
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
    if (SDL_ShouldInit_REAL(&SDL_objects_init)) {
        SDL_objects = SDL_CreateHashTable(0, @"true" != 0, SDL_HashObject, SDL_KeyMatchObject, null, null);
        const initialized: bool = @as(?*anyopaque, @ptrCast(@alignCast(SDL_objects))) != @as(?*anyopaque, null);
        _ = &initialized;
        SDL_SetInitialized_REAL(&SDL_objects_init, initialized);
        if (!initialized) {
            return;
        }
        _ = SDL_AddHintCallback_REAL("SDL_INVALID_PARAM_CHECKS", SDL_InvalidParamChecksChanged, null);
    }
    if (valid) {
        _ = SDL_InsertIntoHashTable(SDL_objects, object, @ptrFromInt(@as(usize, @"type")), @"true" != 0);
    } else {
        _ = SDL_RemoveFromHashTable(SDL_objects, object);
    }
}
pub export fn SDL_FindObject(object: ?*anyopaque, arg_type: SDL_ObjectType) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var object_type: ?*const anyopaque = undefined;
    _ = &object_type;
    if (!SDL_FindInHashTable(SDL_objects, object, &object_type)) {
        return @"false" != 0;
    }
    return @as(SDL_ObjectType, @truncate(@as(usize, @intCast(@intFromPtr(object_type))))) == @"type";
}
pub const struct_GetOneObjectData = extern struct {
    type: SDL_ObjectType = @import("std").mem.zeroes(SDL_ObjectType),
    objects: [*c]?*anyopaque = null,
    count: c_int = 0,
    num_objects: c_int = 0,
};
pub const GetOneObjectData = struct_GetOneObjectData;
pub fn GetOneObject(userdata: ?*anyopaque, _: ?*const SDL_HashTable, object: ?*const anyopaque, object_type: ?*const anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]GetOneObjectData = @ptrCast(@alignCast(userdata));
    _ = &data;
    if (@as(SDL_ObjectType, @truncate(@as(usize, @intCast(@intFromPtr(object_type))))) == data.*.type) {
        if (data.*.num_objects < data.*.count) {
            data.*.objects[@bitCast(@as(isize, @intCast(data.*.num_objects)))] = @ptrCast(@alignCast(@constCast(object)));
        }
        data.*.num_objects += 1;
    }
    return @"true" != 0;
}
pub export fn SDL_GetObjects(arg_type: SDL_ObjectType, objects: [*c]?*anyopaque, count: c_int) c_int {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var data: GetOneObjectData = GetOneObjectData{
        .type = @"type",
        .objects = objects,
        .count = count,
        .num_objects = 0,
    };
    _ = &data;
    _ = SDL_IterateHashTable(SDL_objects, GetOneObject, @ptrCast(@alignCast(&data)));
    return data.num_objects;
}
pub fn LogOneLeakedObject(_: ?*anyopaque, _: ?*const SDL_HashTable, object: ?*const anyopaque, object_type: ?*const anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var @"type": [*c]const u8 = undefined;
    _ = &@"type";
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                @"type" = "unknown object";
                switch (@as(SDL_ObjectType, @truncate(@as(usize, @intCast(@intFromPtr(object_type)))))) {
                    @as(SDL_ObjectType, SDL_OBJECT_TYPE_WINDOW) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_ObjectType, SDL_OBJECT_TYPE_RENDERER) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SDL_ObjectType, SDL_OBJECT_TYPE_TEXTURE) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(SDL_ObjectType, SDL_OBJECT_TYPE_JOYSTICK) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_ObjectType, SDL_OBJECT_TYPE_GAMEPAD) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(SDL_ObjectType, SDL_OBJECT_TYPE_HAPTIC) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(SDL_ObjectType, SDL_OBJECT_TYPE_SENSOR) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(SDL_ObjectType, SDL_OBJECT_TYPE_HIDAPI_DEVICE) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(SDL_ObjectType, SDL_OBJECT_TYPE_HIDAPI_JOYSTICK) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(SDL_ObjectType, SDL_OBJECT_TYPE_THREAD) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(SDL_ObjectType, SDL_OBJECT_TYPE_TRAY) => {
                        sdl_pc = 12;
                        continue;
                    },
                    else => {
                        sdl_pc = 13;
                        continue;
                    },
                }
            },
            1 => {
                SDL_LogDebug_REAL(SDL_LOG_CATEGORY_SYSTEM, "Leaked %s (%p)", @"type", object);
                return @"true" != 0;
            },
            2 => {
                @"type" = "SDL_Window";
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                @"type" = "SDL_Renderer";
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                @"type" = "SDL_Texture";
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            5 => {
                @"type" = "SDL_Joystick";
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            6 => {
                @"type" = "SDL_Gamepad";
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            7 => {
                @"type" = "SDL_Haptic";
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            8 => {
                @"type" = "SDL_Sensor";
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            9 => {
                @"type" = "hidapi device";
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            10 => {
                @"type" = "hidapi joystick";
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            11 => {
                @"type" = "thread";
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            12 => {
                @"type" = "SDL_Tray";
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            13 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_SetObjectsInvalid() void {
    @setEvalBranchQuota(100000);
    if (SDL_ShouldQuit_REAL(&SDL_objects_init)) {
        _ = SDL_IterateHashTable(SDL_objects, LogOneLeakedObject, null);
        SDL_DestroyHashTable(SDL_objects);
        SDL_objects = null;
        SDL_SetInitialized_REAL(&SDL_objects_init, @"false" != 0);
        SDL_RemoveHintCallback_REAL("SDL_INVALID_PARAM_CHECKS", SDL_InvalidParamChecksChanged, null);
    }
}
pub fn SDL_URIDecode(src: [*c]const u8, dst: [*c]u8, arg_len: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var len = arg_len;
    _ = &len;
    var ri: c_int = undefined;
    _ = &ri;
    var wi: c_int = undefined;
    _ = &wi;
    var di: c_int = undefined;
    _ = &di;
    var decode: u8 = '\x00';
    _ = &decode;
    if ((!(src != null) or !(dst != null)) or (len < @as(c_int, 0))) {
        return -@as(c_int, 1);
    }
    if (len == @as(c_int, 0)) {
        len = @bitCast(@as(c_uint, @truncate(SDL_strlen_REAL(src))));
    }
    {
        ri = 0;
        wi = 0;
        di = 0;
        while ((ri < len) and (wi < len)) : (ri += 1) {
            if (di == @as(c_int, 0)) {
                if (@as(c_int, src[@bitCast(@as(isize, @intCast(ri)))]) == @as(c_int, '%')) {
                    decode = '\x00';
                    di += 1;
                    continue;
                }
                dst[@bitCast(@as(isize, @intCast(wi)))] = src[@bitCast(@as(isize, @intCast(ri)))];
                wi += 1;
            } else if ((di == @as(c_int, 1)) or (di == @as(c_int, 2))) {
                var off: u8 = '\x00';
                _ = &off;
                var isa: u8 = @bitCast(@as(i8, @intFromBool((@as(c_int, src[@bitCast(@as(isize, @intCast(ri)))]) >= @as(c_int, 'a')) and (@as(c_int, src[@bitCast(@as(isize, @intCast(ri)))]) <= @as(c_int, 'f')))));
                _ = &isa;
                var isA: u8 = @bitCast(@as(i8, @intFromBool((@as(c_int, src[@bitCast(@as(isize, @intCast(ri)))]) >= @as(c_int, 'A')) and (@as(c_int, src[@bitCast(@as(isize, @intCast(ri)))]) <= @as(c_int, 'F')))));
                _ = &isA;
                var isn: u8 = @bitCast(@as(i8, @intFromBool((@as(c_int, src[@bitCast(@as(isize, @intCast(ri)))]) >= @as(c_int, '0')) and (@as(c_int, src[@bitCast(@as(isize, @intCast(ri)))]) <= @as(c_int, '9')))));
                _ = &isn;
                if (!(((@as(c_int, isa) != 0) or (@as(c_int, isA) != 0)) or (@as(c_int, isn) != 0))) {
                    var sri: c_int = undefined;
                    _ = &sri;
                    {
                        sri = ri - di;
                        while (sri <= ri) : (sri += 1) {
                            dst[@bitCast(@as(isize, @intCast(wi)))] = src[@bitCast(@as(isize, @intCast(sri)))];
                            wi += 1;
                        }
                    }
                    di = 0;
                    continue;
                }
                if (@as(c_int, isn) != 0) {
                    off = @bitCast(@as(i8, @truncate(@as(c_int, 0) - @as(c_int, '0'))));
                } else if (@as(c_int, isa) != 0) {
                    off = @bitCast(@as(i8, @truncate(@as(c_int, 10) - @as(c_int, 'a'))));
                } else if (@as(c_int, isA) != 0) {
                    off = @bitCast(@as(i8, @truncate(@as(c_int, 10) - @as(c_int, 'A'))));
                }
                {
                    const ref = &decode;
                    ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | ((@as(c_int, src[@bitCast(@as(isize, @intCast(ri)))]) + @as(c_int, off)) << @intCast((@as(c_int, 2) - di) * @as(c_int, 4))))));
                }
                if (di == @as(c_int, 2)) {
                    dst[@bitCast(@as(isize, @intCast(wi)))] = decode;
                    wi += 1;
                    di = 0;
                } else {
                    di += 1;
                }
            }
        }
    }
    dst[@bitCast(@as(isize, @intCast(wi)))] = '\x00';
    return wi;
}
pub export fn SDL_URIToLocal(arg_src: [*c]const u8, dst: [*c]u8) c_int {
    @setEvalBranchQuota(100000);
    var src = arg_src;
    _ = &src;
    if (SDL_memcmp_REAL(@ptrCast(@alignCast(src)), @ptrCast(@alignCast(@as([*c]u8, @as([*c]u8, @constCast("file:/"))))), 6) == @as(c_int, 0)) {
        src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 6)))));
    } else if (@as(?*anyopaque, @ptrCast(@alignCast(SDL_strstr_REAL(src, ":/")))) != @as(?*anyopaque, null)) {
        return -@as(c_int, 1);
    }
    var local: bool = (@as(c_int, src[@as(c_int, 0)]) != @as(c_int, '/')) or ((@as(c_int, src[@as(c_int, 0)]) != @as(c_int, '\x00')) and (@as(c_int, src[@as(c_int, 1)]) == @as(c_int, '/')));
    _ = &local;
    if ((!local and (@as(c_int, src[@as(c_int, 0)]) == @as(c_int, '/'))) and (@as(c_int, src[@as(c_int, 2)]) != @as(c_int, '/'))) {
        var hostname_end: [*c]u8 = SDL_strchr_REAL(src + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1))))), '/');
        _ = &hostname_end;
        if (hostname_end != null) {
            const src_len: usize = @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(hostname_end) -% @intFromPtr(src + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))))))), @sizeOf(u8))));
            _ = &src_len;
            var hostname_len: usize = undefined;
            _ = &hostname_len;
            var hostname: [257]u8 = undefined;
            _ = &hostname;
            if (gethostname(@ptrCast(@alignCast(&hostname)), 255) == @as(c_int, 0)) {
                hostname[@as(c_int, 256)] = '\x00';
                hostname_len = SDL_strlen_REAL(@ptrCast(@alignCast(&hostname)));
                if ((hostname_len == src_len) and (SDL_strncasecmp_REAL(src + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1))))), @ptrCast(@alignCast(&hostname)), src_len) == @as(c_int, 0))) {
                    src = hostname_end + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
                    local = @"true" != 0;
                }
            }
            if (!local) {
                const static_local_localhost = struct {
                    var localhost: [*c]const u8 = "localhost";
                };
                _ = &static_local_localhost;
                hostname_len = SDL_strlen_REAL(static_local_localhost.localhost);
                if ((hostname_len == src_len) and (SDL_strncasecmp_REAL(src + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1))))), static_local_localhost.localhost, src_len) == @as(c_int, 0))) {
                    src = hostname_end + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
                    local = @"true" != 0;
                }
            }
        }
    }
    if (local) {
        if (@as(c_int, src[@as(c_int, 0)]) == @as(c_int, '/')) {
            src += 1;
        } else {
            src -= 1;
        }
        return SDL_URIDecode(src, dst, 0);
    }
    return -@as(c_int, 1);
}
pub export fn SDL_IsURI(arg_uri: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    var uri = arg_uri;
    _ = &uri;
    if (!(uri != null)) {
        return @"false" != 0;
    }
    if (!(((@as(c_int, uri.*) >= @as(c_int, 'a')) and (@as(c_int, uri.*) <= @as(c_int, 'z'))) or ((@as(c_int, uri.*) >= @as(c_int, 'A')) and (@as(c_int, uri.*) <= @as(c_int, 'Z'))))) {
        return @"false" != 0;
    }
    while (@as(c_int, uri.*) != 0) {
        if (!(((((((@as(c_int, uri.*) >= @as(c_int, 'a')) and (@as(c_int, uri.*) <= @as(c_int, 'z'))) or ((@as(c_int, uri.*) >= @as(c_int, 'A')) and (@as(c_int, uri.*) <= @as(c_int, 'Z')))) or ((@as(c_int, uri.*) >= @as(c_int, '0')) and (@as(c_int, uri.*) <= @as(c_int, '9')))) or (@as(c_int, uri.*) == @as(c_int, '+'))) or (@as(c_int, uri.*) == @as(c_int, '-'))) or (@as(c_int, uri.*) == @as(c_int, '.')))) {
            return @"false" != 0;
        }
        if (@as(c_int, (blk: {
            const ref = &uri;
            ref.* += 1;
            break :blk ref.*;
        }).*) == @as(c_int, ':')) {
            return @"true" != 0;
        }
    }
    return @"false" != 0;
}
pub var SDL_string_storage: SDL_TLSID = @import("std").mem.zeroes(SDL_TLSID);
pub fn SDL_FreePersistentStrings(value: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var strings: ?*SDL_HashTable = @ptrCast(@alignCast(value));
    _ = &strings;
    SDL_DestroyHashTable(strings);
}
pub export fn SDL_GetPersistentString(string: [*c]const u8) [*c]const u8 {
    @setEvalBranchQuota(100000);
    if (!(string != null)) {
        return null;
    }
    if (!(@as(c_int, string.*) != 0)) {
        return "";
    }
    var strings: ?*SDL_HashTable = @ptrCast(@alignCast(SDL_GetTLS_REAL(&SDL_string_storage)));
    _ = &strings;
    if (!(strings != null)) {
        strings = SDL_CreateHashTable(0, @"false" != 0, SDL_HashString, SDL_KeyMatchString, SDL_DestroyHashValue, null);
        if (!(strings != null)) {
            return null;
        }
        _ = SDL_SetTLS_REAL(&SDL_string_storage, @ptrCast(@alignCast(strings)), SDL_FreePersistentStrings);
    }
    var result: [*c]const u8 = undefined;
    _ = &result;
    if (!SDL_FindInHashTable(strings, @ptrCast(@alignCast(string)), @ptrCast(@alignCast(&result)))) {
        var new_string: [*c]u8 = SDL_strdup_REAL(string);
        _ = &new_string;
        if (!(new_string != null)) {
            return null;
        }
        _ = SDL_InsertIntoHashTable(strings, @ptrCast(@alignCast(new_string)), @ptrCast(@alignCast(new_string)), @"false" != 0);
        result = new_string;
    }
    return result;
}
pub fn PrefixMatch(arg_a: [*c]const u8, arg_b: [*c]const u8) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var a = arg_a;
    _ = &a;
    var b = arg_b;
    _ = &b;
    var matchlen: c_int = 0;
    _ = &matchlen;
    if ((SDL_strncmp_REAL(a, "HORI ", 5) == @as(c_int, 0)) and (SDL_strncmp_REAL(b, "HORl ", 5) == @as(c_int, 0))) {
        return 5;
    }
    while ((@as(c_int, a.*) != 0) and (@as(c_int, b.*) != 0)) {
        if (SDL_tolower_REAL(@as(u8, (blk: {
            const ref = &a;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        }).*)) == SDL_tolower_REAL(@as(u8, (blk: {
            const ref = &b;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        }).*))) {
            matchlen += 1;
        } else {
            break;
        }
    }
    return matchlen;
}
pub export fn SDL_CreateDeviceName(vendor: Uint16, product: Uint16, arg_vendor_name: [*c]const u8, arg_product_name: [*c]const u8, default_name: [*c]const u8) [*c]u8 {
    @setEvalBranchQuota(100000);
    var vendor_name = arg_vendor_name;
    _ = &vendor_name;
    var product_name = arg_product_name;
    _ = &product_name;
    const struct_unnamed_17 = extern struct {
        prefix: [*c]const u8 = null,
        replacement: [*c]const u8 = null,
    };
    _ = &struct_unnamed_17;
    const static_local_replacements = struct {
        var replacements: [15]struct_unnamed_17 = [15]struct_unnamed_17{
            struct_unnamed_17{
                .prefix = "(Standard system devices) ",
                .replacement = "",
            },
            struct_unnamed_17{
                .prefix = "8BitDo Tech Ltd",
                .replacement = "8BitDo",
            },
            struct_unnamed_17{
                .prefix = "ASTRO Gaming",
                .replacement = "ASTRO",
            },
            struct_unnamed_17{
                .prefix = "Bensussen Deutsch & Associates,Inc.(BDA)",
                .replacement = "BDA",
            },
            struct_unnamed_17{
                .prefix = "Guangzhou Chicken Run Network Technology Co., Ltd.",
                .replacement = "GameSir",
            },
            struct_unnamed_17{
                .prefix = "HORI CO.,LTD.",
                .replacement = "HORI",
            },
            struct_unnamed_17{
                .prefix = "HORI CO.,LTD",
                .replacement = "HORI",
            },
            struct_unnamed_17{
                .prefix = "Mad Catz Inc.",
                .replacement = "Mad Catz",
            },
            struct_unnamed_17{
                .prefix = "Nintendo Co., Ltd.",
                .replacement = "Nintendo",
            },
            struct_unnamed_17{
                .prefix = "NVIDIA Corporation ",
                .replacement = "",
            },
            struct_unnamed_17{
                .prefix = "Performance Designed Products",
                .replacement = "PDP",
            },
            struct_unnamed_17{
                .prefix = "QANBA USA, LLC",
                .replacement = "Qanba",
            },
            struct_unnamed_17{
                .prefix = "QANBA USA,LLC",
                .replacement = "Qanba",
            },
            struct_unnamed_17{
                .prefix = "Voyetra Turtle Beach,Inc.",
                .replacement = "Turtle Beach",
            },
            struct_unnamed_17{
                .prefix = "Unknown ",
                .replacement = "",
            },
        };
    };
    _ = &static_local_replacements;
    var name: [*c]u8 = undefined;
    _ = &name;
    var i: usize = undefined;
    _ = &i;
    var len: usize = undefined;
    _ = &len;
    var prefixlen: usize = undefined;
    _ = &prefixlen;
    var replacementlen: usize = undefined;
    _ = &replacementlen;
    var matchlen: c_int = undefined;
    _ = &matchlen;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                name = null;
                if (!(vendor_name != null)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                vendor_name = "";
                {
                    sdl_pc = 3;
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
                if (!(product_name != null)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                product_name = "";
                {
                    sdl_pc = 6;
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
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                if (@as(c_int, vendor_name.*) == @as(c_int, ' ')) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                vendor_name += 1;
                {
                    sdl_pc = 7;
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
                if (@as(c_int, product_name.*) == @as(c_int, ' ')) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                product_name += 1;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            12 => {
                if ((@as(c_int, vendor_name.*) != 0) and (@as(c_int, product_name.*) != 0)) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            13 => {
                len = ((SDL_strlen_REAL(vendor_name) +% @as(usize, 1)) +% SDL_strlen_REAL(product_name)) +% @as(usize, 1);
                name = @ptrCast(@alignCast(SDL_malloc_REAL(len)));
                if (name != null) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            14 => {
                if (@as(c_int, product_name.*) != 0) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            15 => {
                if (!(name != null)) {
                    sdl_pc = 40;
                    continue;
                } else {
                    sdl_pc = 41;
                    continue;
                }
            },
            16 => {
                _ = SDL_snprintf_REAL(name, len, "%s %s", vendor_name, product_name);
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 18;
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
                name = SDL_strdup_REAL(product_name);
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                if ((@as(c_int, vendor) != 0) or (@as(c_int, product) != 0)) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            21 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            22 => {
                switch (SDL_GetGamepadTypeFromVIDPID(vendor, product, null, @"true" != 0)) {
                    @as(SDL_GamepadType, SDL_GAMEPAD_TYPE_XBOX360) => {
                        sdl_pc = 26;
                        continue;
                    },
                    @as(SDL_GamepadType, SDL_GAMEPAD_TYPE_XBOXONE) => {
                        sdl_pc = 27;
                        continue;
                    },
                    @as(SDL_GamepadType, SDL_GAMEPAD_TYPE_PS3) => {
                        sdl_pc = 28;
                        continue;
                    },
                    @as(SDL_GamepadType, SDL_GAMEPAD_TYPE_PS4) => {
                        sdl_pc = 29;
                        continue;
                    },
                    @as(SDL_GamepadType, SDL_GAMEPAD_TYPE_PS5) => {
                        sdl_pc = 30;
                        continue;
                    },
                    @as(SDL_GamepadType, SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_PRO) => {
                        sdl_pc = 31;
                        continue;
                    },
                    @as(SDL_GamepadType, SDL_GAMEPAD_TYPE_STEAM) => {
                        sdl_pc = 32;
                        continue;
                    },
                    else => {
                        sdl_pc = 33;
                        continue;
                    },
                }
            },
            23 => {
                if (default_name != null) {
                    sdl_pc = 37;
                    continue;
                } else {
                    sdl_pc = 38;
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
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            26 => {
                name = SDL_strdup_REAL("Xbox 360 Controller");
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            27 => {
                name = SDL_strdup_REAL("Xbox One Controller");
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            28 => {
                name = SDL_strdup_REAL("PS3 Controller");
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            29 => {
                name = SDL_strdup_REAL("PS4 Controller");
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            30 => {
                name = SDL_strdup_REAL("DualSense Wireless Controller");
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            31 => {
                name = SDL_strdup_REAL("Nintendo Switch Pro Controller");
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            32 => {
                name = SDL_strdup_REAL("Steam Controller");
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            33 => {
                len = @bitCast(@as(c_long, ((@as(c_int, 6) + @as(c_int, 1)) + @as(c_int, 6)) + @as(c_int, 1)));
                name = @ptrCast(@alignCast(SDL_malloc_REAL(len)));
                if (name != null) {
                    sdl_pc = 34;
                    continue;
                } else {
                    sdl_pc = 35;
                    continue;
                }
            },
            34 => {
                _ = SDL_snprintf_REAL(name, len, "0x%.4x/0x%.4x", vendor, product);
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            35 => {
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            36 => {
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            37 => {
                name = SDL_strdup_REAL(default_name);
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            38 => {
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            39 => {
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            40 => {
                return null;
            },
            41 => {
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            42 => {
                len = SDL_strlen_REAL(name);
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            43 => {
                if ((len > @as(usize, 0)) and (@as(c_int, name[len -% @as(usize, 1)]) == @as(c_int, ' '))) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 46;
                    continue;
                }
            },
            44 => {
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            45 => {
                len -%= 1;
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            46 => {
                name[len] = '\x00';
                i = 0;
                {
                    sdl_pc = 47;
                    continue;
                }
            },
            47 => {
                if (i < (len -% @as(usize, 1))) {
                    sdl_pc = 48;
                    continue;
                } else {
                    sdl_pc = 50;
                    continue;
                }
            },
            48 => {
                if ((@as(c_int, name[i]) == @as(c_int, ' ')) and (@as(c_int, name[i +% @as(usize, 1)]) == @as(c_int, ' '))) {
                    sdl_pc = 51;
                    continue;
                } else {
                    sdl_pc = 52;
                    continue;
                }
            },
            49 => {
                {
                    sdl_pc = 47;
                    continue;
                }
            },
            50 => {
                i = 0;
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            51 => {
                _ = memmove(@ptrCast(@alignCast(&name[i])), @ptrCast(@alignCast(&name[i +% @as(usize, 1)])), len -% i);
                len -%= 1;
                {
                    sdl_pc = 53;
                    continue;
                }
            },
            52 => {
                i +%= 1;
                {
                    sdl_pc = 53;
                    continue;
                }
            },
            53 => {
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            54 => {
                if (i < (@sizeOf(@TypeOf(static_local_replacements.replacements)) / @sizeOf(@TypeOf(static_local_replacements.replacements[@as(c_int, 0)])))) {
                    sdl_pc = 55;
                    continue;
                } else {
                    sdl_pc = 57;
                    continue;
                }
            },
            55 => {
                prefixlen = SDL_strlen_REAL(static_local_replacements.replacements[i].prefix);
                if (SDL_strncasecmp_REAL(name, static_local_replacements.replacements[i].prefix, prefixlen) == @as(c_int, 0)) {
                    sdl_pc = 58;
                    continue;
                } else {
                    sdl_pc = 59;
                    continue;
                }
            },
            56 => {
                i +%= 1;
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            57 => {
                i = 1;
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            58 => {
                replacementlen = SDL_strlen_REAL(static_local_replacements.replacements[i].replacement);
                if (replacementlen <= prefixlen) {
                    sdl_pc = 61;
                    continue;
                } else {
                    sdl_pc = 62;
                    continue;
                }
            },
            59 => {
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            60 => {
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            61 => {
                _ = memcpy(@ptrCast(@alignCast(name)), @ptrCast(@alignCast(static_local_replacements.replacements[i].replacement)), replacementlen);
                _ = memmove(@ptrCast(@alignCast(name + replacementlen)), @ptrCast(@alignCast(name + prefixlen)), (len -% prefixlen) +% @as(usize, 1));
                len -%= prefixlen -% replacementlen;
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            62 => {
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            63 => {
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            64 => {
                if (i < (len -% @as(usize, 1))) {
                    sdl_pc = 65;
                    continue;
                } else {
                    sdl_pc = 67;
                    continue;
                }
            },
            65 => {
                matchlen = PrefixMatch(name, &name[i]);
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            66 => {
                i +%= 1;
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            67 => {
                return name;
            },
            68 => {
                if (matchlen > @as(c_int, 0)) {
                    sdl_pc = 69;
                    continue;
                } else {
                    sdl_pc = 70;
                    continue;
                }
            },
            69 => {
                if ((@as(c_int, name[@bitCast(@as(isize, @intCast(matchlen)))]) == @as(c_int, ' ')) or (@as(c_int, name[@bitCast(@as(isize, @intCast(matchlen)))]) == @as(c_int, '-'))) {
                    sdl_pc = 71;
                    continue;
                } else {
                    sdl_pc = 72;
                    continue;
                }
            },
            70 => {
                if (matchlen > @as(c_int, 0)) {
                    sdl_pc = 74;
                    continue;
                } else {
                    sdl_pc = 75;
                    continue;
                }
            },
            71 => {
                _ = memmove(@ptrCast(@alignCast(name)), @ptrCast(@alignCast((name + @as(usize, @bitCast(@as(isize, @intCast(matchlen))))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1))))))), len -% @as(usize, @bitCast(@as(c_long, matchlen))));
                {
                    sdl_pc = 70;
                    continue;
                }
            },
            72 => {
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            73 => {
                matchlen -= 1;
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            74 => {
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            75 => {
                {
                    sdl_pc = 76;
                    continue;
                }
            },
            76 => {
                {
                    sdl_pc = 66;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_DebugLogBackend(subsystem: [*c]const u8, backend: [*c]const u8) void {
    @setEvalBranchQuota(100000);
    SDL_LogDebug_REAL(SDL_LOG_CATEGORY_SYSTEM, "SDL chose %s backend '%s'", subsystem, backend);
}

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
