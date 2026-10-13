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
pub const Uint32 = u32;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_getenv_REAL(name: [*c]const u8) [*c]const u8;
pub extern fn SDL_isdigit_REAL(x: c_int) c_int;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_atoi_REAL(str: [*c]const u8) c_int;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_strcasecmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub const struct_SDL_AtomicU32 = extern struct {
    value: Uint32 = 0,
};
pub const SDL_AtomicU32 = struct_SDL_AtomicU32;
pub extern fn SDL_CompareAndSwapAtomicU32_REAL(a: [*c]SDL_AtomicU32, oldval: Uint32, newval: Uint32) bool;
pub extern fn SDL_GetAtomicU32_REAL(a: [*c]SDL_AtomicU32) Uint32;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_PropertiesID = Uint32;
pub extern fn SDL_CreateProperties_REAL() SDL_PropertiesID;
pub extern fn SDL_LockProperties_REAL(props: SDL_PropertiesID) bool;
pub extern fn SDL_UnlockProperties_REAL(props: SDL_PropertiesID) void;
pub const SDL_CleanupPropertyCallback = ?*const fn (userdata: ?*anyopaque, value: ?*anyopaque) callconv(.c) void;
pub extern fn SDL_SetPointerPropertyWithCleanup_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: ?*anyopaque, cleanup: SDL_CleanupPropertyCallback, userdata: ?*anyopaque) bool;
pub extern fn SDL_GetPointerProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: ?*anyopaque) ?*anyopaque;
pub const SDL_EnumeratePropertiesCallback = ?*const fn (userdata: ?*anyopaque, props: SDL_PropertiesID, name: [*c]const u8) callconv(.c) void;
pub extern fn SDL_EnumerateProperties_REAL(props: SDL_PropertiesID, callback: SDL_EnumeratePropertiesCallback, userdata: ?*anyopaque) bool;
pub extern fn SDL_DestroyProperties_REAL(props: SDL_PropertiesID) void;
pub const SDL_HINT_DEFAULT: c_int = 0;
pub const SDL_HINT_NORMAL: c_int = 1;
pub const SDL_HINT_OVERRIDE: c_int = 2;
pub const enum_SDL_HintPriority = c_uint;
pub const SDL_HintPriority = enum_SDL_HintPriority;
pub const SDL_HintCallback = ?*const fn (userdata: ?*anyopaque, name: [*c]const u8, oldValue: [*c]const u8, newValue: [*c]const u8) callconv(.c) void;
pub extern fn SDL_GetPersistentString(string: [*c]const u8) [*c]const u8;
pub const struct_SDL_HintWatch = extern struct {
    callback: SDL_HintCallback = null,
    userdata: ?*anyopaque = null,
    next: [*c]struct_SDL_HintWatch = null,
};
pub const SDL_HintWatch = struct_SDL_HintWatch;
pub const struct_SDL_Hint = extern struct {
    value: [*c]u8 = null,
    priority: SDL_HintPriority = @import("std").mem.zeroes(SDL_HintPriority),
    callbacks: [*c]SDL_HintWatch = null,
};
pub const SDL_Hint = struct_SDL_Hint;
pub var SDL_hint_props: SDL_AtomicU32 = @import("std").mem.zeroes(SDL_AtomicU32);
pub export fn SDL_InitHints() void {}
pub export fn SDL_QuitHints() void {
    @setEvalBranchQuota(100000);
    var props: SDL_PropertiesID = undefined;
    _ = &props;
    while (true) {
        props = SDL_GetAtomicU32_REAL(&SDL_hint_props);
        if (!!SDL_CompareAndSwapAtomicU32_REAL(&SDL_hint_props, props, 0)) break;
    }
    if (props != 0) {
        SDL_DestroyProperties_REAL(props);
    }
}
pub fn GetHintProperties(create: bool) callconv(.c) SDL_PropertiesID {
    @setEvalBranchQuota(100000);
    var props: SDL_PropertiesID = SDL_GetAtomicU32_REAL(&SDL_hint_props);
    _ = &props;
    if (!(props != 0) and create) {
        props = SDL_CreateProperties_REAL();
        if (!SDL_CompareAndSwapAtomicU32_REAL(&SDL_hint_props, 0, props)) {
            SDL_DestroyProperties_REAL(props);
            props = SDL_GetAtomicU32_REAL(&SDL_hint_props);
        }
    }
    return props;
}
pub fn CleanupHintProperty(_: ?*anyopaque, value: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var hint: [*c]SDL_Hint = @ptrCast(@alignCast(value));
    _ = &hint;
    SDL_free_REAL(@ptrCast(@alignCast(hint.*.value)));
    var entry: [*c]SDL_HintWatch = hint.*.callbacks;
    _ = &entry;
    while (entry != null) {
        var freeable: [*c]SDL_HintWatch = entry;
        _ = &freeable;
        entry = entry.*.next;
        SDL_free_REAL(@ptrCast(@alignCast(freeable)));
    }
    SDL_free_REAL(@ptrCast(@alignCast(hint)));
}
pub fn GetHintEnvironmentVariable(name: [*c]const u8) callconv(.c) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var result: [*c]const u8 = SDL_getenv_REAL(name);
    _ = &result;
    if ((!(result != null) and (name != null)) and (@as(c_int, name.*) != 0)) {
        if (SDL_strcmp_REAL(name, "SDL_VIDEO_DRIVER") == @as(c_int, 0)) {
            result = SDL_getenv_REAL("SDL_VIDEODRIVER");
        } else if (SDL_strcmp_REAL(name, "SDL_AUDIO_DRIVER") == @as(c_int, 0)) {
            result = SDL_getenv_REAL("SDL_AUDIODRIVER");
        }
    }
    return result;
}
pub export fn SDL_SetHintWithPriority_REAL(name: [*c]const u8, value: [*c]const u8, arg_priority: SDL_HintPriority) bool {
    @setEvalBranchQuota(100000);
    var priority = arg_priority;
    _ = &priority;
    if (!(name != null) or !(@as(c_int, name.*) != 0)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("name"))));
    }
    var env: [*c]const u8 = GetHintEnvironmentVariable(name);
    _ = &env;
    if ((env != null) and (priority < @as(SDL_HintPriority, SDL_HINT_OVERRIDE))) {
        return SDL_SetError_REAL("An environment variable is taking priority");
    }
    const hints: SDL_PropertiesID = GetHintProperties(@"true" != 0);
    _ = &hints;
    if (!(hints != 0)) {
        return @"false" != 0;
    }
    var result: bool = @"false" != 0;
    _ = &result;
    _ = SDL_LockProperties_REAL(hints);
    var hint: [*c]SDL_Hint = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(hints, name, null)));
    _ = &hint;
    if (hint != null) {
        if (priority >= hint.*.priority) {
            if ((hint.*.value != value) and ((!(value != null) or !(hint.*.value != null)) or (SDL_strcmp_REAL(hint.*.value, value) != @as(c_int, 0)))) {
                var old_value: [*c]u8 = hint.*.value;
                _ = &old_value;
                hint.*.value = @ptrCast(@alignCast(if (value != null) @as(?*anyopaque, @ptrCast(@alignCast(SDL_strdup_REAL(value)))) else @as(?*anyopaque, null)));
                var entry: [*c]SDL_HintWatch = hint.*.callbacks;
                _ = &entry;
                while (entry != null) {
                    var next: [*c]SDL_HintWatch = entry.*.next;
                    _ = &next;
                    entry.*.callback.?(entry.*.userdata, name, old_value, value);
                    entry = next;
                }
                SDL_free_REAL(@ptrCast(@alignCast(old_value)));
            }
            hint.*.priority = priority;
            result = @"true" != 0;
        }
    } else {
        hint = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(@TypeOf(hint.*)))));
        if (hint != null) {
            hint.*.value = @ptrCast(@alignCast(if (value != null) @as(?*anyopaque, @ptrCast(@alignCast(SDL_strdup_REAL(value)))) else @as(?*anyopaque, null)));
            hint.*.priority = priority;
            hint.*.callbacks = null;
            result = SDL_SetPointerPropertyWithCleanup_REAL(hints, name, @ptrCast(@alignCast(hint)), CleanupHintProperty, null);
        }
    }
    SDL_UnlockProperties_REAL(hints);
    return result;
}
pub export fn SDL_ResetHint_REAL(name: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    if (!(name != null) or !(@as(c_int, name.*) != 0)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("name"))));
    }
    var env: [*c]const u8 = GetHintEnvironmentVariable(name);
    _ = &env;
    const hints: SDL_PropertiesID = GetHintProperties(@"false" != 0);
    _ = &hints;
    if (!(hints != 0)) {
        return @"false" != 0;
    }
    var result: bool = @"false" != 0;
    _ = &result;
    _ = SDL_LockProperties_REAL(hints);
    var hint: [*c]SDL_Hint = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(hints, name, null)));
    _ = &hint;
    if (hint != null) {
        if (((!(env != null) and (hint.*.value != null)) or ((env != null) and !(hint.*.value != null))) or ((env != null) and (SDL_strcmp_REAL(env, hint.*.value) != @as(c_int, 0)))) {
            {
                var entry: [*c]SDL_HintWatch = hint.*.callbacks;
                _ = &entry;
                while (entry != null) {
                    var next: [*c]SDL_HintWatch = entry.*.next;
                    _ = &next;
                    entry.*.callback.?(entry.*.userdata, name, hint.*.value, env);
                    entry = next;
                }
            }
        }
        SDL_free_REAL(@ptrCast(@alignCast(hint.*.value)));
        hint.*.value = null;
        hint.*.priority = SDL_HINT_DEFAULT;
        result = @"true" != 0;
    }
    SDL_UnlockProperties_REAL(hints);
    return result;
}
pub fn ResetHintsCallback(_: ?*anyopaque, hints: SDL_PropertiesID, name: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var hint: [*c]SDL_Hint = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(hints, name, null)));
    _ = &hint;
    if (!(hint != null)) {
        return;
    }
    var env: [*c]const u8 = GetHintEnvironmentVariable(name);
    _ = &env;
    if (((!(env != null) and (hint.*.value != null)) or ((env != null) and !(hint.*.value != null))) or ((env != null) and (SDL_strcmp_REAL(env, hint.*.value) != @as(c_int, 0)))) {
        var entry: [*c]SDL_HintWatch = hint.*.callbacks;
        _ = &entry;
        while (entry != null) {
            var next: [*c]SDL_HintWatch = entry.*.next;
            _ = &next;
            entry.*.callback.?(entry.*.userdata, name, hint.*.value, env);
            entry = next;
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(hint.*.value)));
    hint.*.value = null;
    hint.*.priority = SDL_HINT_DEFAULT;
}
pub export fn SDL_ResetHints_REAL() void {
    @setEvalBranchQuota(100000);
    _ = SDL_EnumerateProperties_REAL(GetHintProperties(@"false" != 0), ResetHintsCallback, null);
}
pub export fn SDL_SetHint_REAL(name: [*c]const u8, value: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetHintWithPriority_REAL(name, value, SDL_HINT_NORMAL);
}
pub export fn SDL_GetHint_REAL(name: [*c]const u8) [*c]const u8 {
    @setEvalBranchQuota(100000);
    if (!(name != null)) {
        return null;
    }
    var result: [*c]const u8 = GetHintEnvironmentVariable(name);
    _ = &result;
    const hints: SDL_PropertiesID = GetHintProperties(@"false" != 0);
    _ = &hints;
    if (hints != 0) {
        _ = SDL_LockProperties_REAL(hints);
        var hint: [*c]SDL_Hint = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(hints, name, null)));
        _ = &hint;
        if (hint != null) {
            if (!(result != null) or (hint.*.priority == @as(SDL_HintPriority, SDL_HINT_OVERRIDE))) {
                result = SDL_GetPersistentString(hint.*.value);
            }
        }
        SDL_UnlockProperties_REAL(hints);
    }
    return result;
}
pub export fn SDL_GetStringInteger(value: [*c]const u8, default_value: c_int) c_int {
    @setEvalBranchQuota(100000);
    if (!(value != null) or !(@as(c_int, value.*) != 0)) {
        return default_value;
    }
    if (SDL_strcasecmp_REAL(value, "false") == @as(c_int, 0)) {
        return 0;
    }
    if (SDL_strcasecmp_REAL(value, "true") == @as(c_int, 0)) {
        return 1;
    }
    if ((@as(c_int, value.*) == @as(c_int, '-')) or (SDL_isdigit_REAL(value.*) != 0)) {
        return SDL_atoi_REAL(value);
    }
    return default_value;
}
pub export fn SDL_GetStringBoolean(value: [*c]const u8, default_value: bool) bool {
    @setEvalBranchQuota(100000);
    if (!(value != null) or !(@as(c_int, value.*) != 0)) {
        return default_value;
    }
    if ((@as(c_int, value.*) == @as(c_int, '0')) or (SDL_strcasecmp_REAL(value, "false") == @as(c_int, 0))) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub export fn SDL_GetHintBoolean_REAL(name: [*c]const u8, default_value: bool) bool {
    @setEvalBranchQuota(100000);
    var hint: [*c]const u8 = SDL_GetHint_REAL(name);
    _ = &hint;
    return SDL_GetStringBoolean(hint, default_value);
}
pub export fn SDL_AddHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) bool {
    @setEvalBranchQuota(100000);
    if (!(name != null) or !(@as(c_int, name.*) != 0)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("name"))));
    }
    if (!(callback != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("callback"))));
    }
    const hints: SDL_PropertiesID = GetHintProperties(@"true" != 0);
    _ = &hints;
    if (!(hints != 0)) {
        return @"false" != 0;
    }
    var entry: [*c]SDL_HintWatch = undefined;
    entry = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(@TypeOf(entry.*)))));
    _ = &entry;
    if (!(entry != null)) {
        return @"false" != 0;
    }
    entry.*.callback = callback;
    entry.*.userdata = userdata;
    var result: bool = @"false" != 0;
    _ = &result;
    _ = SDL_LockProperties_REAL(hints);
    SDL_RemoveHintCallback_REAL(name, callback, userdata);
    var hint: [*c]SDL_Hint = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(hints, name, null)));
    _ = &hint;
    if (hint != null) {
        result = @"true" != 0;
    } else {
        hint = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(@TypeOf(hint.*)))));
        if (!(hint != null)) {
            SDL_free_REAL(@ptrCast(@alignCast(entry)));
            SDL_UnlockProperties_REAL(hints);
            return @"false" != 0;
        } else {
            hint.*.value = null;
            hint.*.priority = SDL_HINT_DEFAULT;
            hint.*.callbacks = null;
            result = SDL_SetPointerPropertyWithCleanup_REAL(hints, name, @ptrCast(@alignCast(hint)), CleanupHintProperty, null);
        }
    }
    entry.*.next = hint.*.callbacks;
    hint.*.callbacks = entry;
    var value: [*c]const u8 = SDL_GetHint_REAL(name);
    _ = &value;
    callback.?(userdata, name, value, value);
    SDL_UnlockProperties_REAL(hints);
    return result;
}
pub export fn SDL_RemoveHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) void {
    @setEvalBranchQuota(100000);
    if (!(name != null) or !(@as(c_int, name.*) != 0)) {
        return;
    }
    const hints: SDL_PropertiesID = GetHintProperties(@"false" != 0);
    _ = &hints;
    if (!(hints != 0)) {
        return;
    }
    _ = SDL_LockProperties_REAL(hints);
    var hint: [*c]SDL_Hint = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(hints, name, null)));
    _ = &hint;
    if (hint != null) {
        var prev: [*c]SDL_HintWatch = null;
        _ = &prev;
        {
            var entry: [*c]SDL_HintWatch = hint.*.callbacks;
            _ = &entry;
            while (entry != null) : (entry = entry.*.next) {
                if ((callback == entry.*.callback) and (userdata == entry.*.userdata)) {
                    if (prev != null) {
                        prev.*.next = entry.*.next;
                    } else {
                        hint.*.callbacks = entry.*.next;
                    }
                    SDL_free_REAL(@ptrCast(@alignCast(entry)));
                    break;
                }
                prev = entry;
            }
        }
    }
    SDL_UnlockProperties_REAL(hints);
}

pub const SDL_AddHintCallback = SDL_AddHintCallback_REAL;
pub const SDL_GetHint = SDL_GetHint_REAL;
pub const SDL_GetHintBoolean = SDL_GetHintBoolean_REAL;
pub const SDL_RemoveHintCallback = SDL_RemoveHintCallback_REAL;
pub const SDL_ResetHint = SDL_ResetHint_REAL;
pub const SDL_ResetHints = SDL_ResetHints_REAL;
pub const SDL_SetHint = SDL_SetHint_REAL;
pub const SDL_SetHintWithPriority = SDL_SetHintWithPriority_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
