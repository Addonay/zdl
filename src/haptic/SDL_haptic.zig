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
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub extern fn index(__s: [*c]const u8, __c: c_int) [*c]u8;
pub const Uint8 = u8;
pub const Sint16 = i16;
pub const Uint16 = u16;
pub const Sint32 = i32;
pub const Uint32 = u32;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_realloc_REAL(mem: ?*anyopaque, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_getenv_REAL(name: [*c]const u8) [*c]const u8;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_atoi_REAL(str: [*c]const u8) c_int;
pub extern fn SDL_sscanf_REAL(text: [*c]const u8, fmt: [*c]const u8, ...) c_int;
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
pub extern fn SDL_ClearError_REAL() bool;
pub const struct_SDL_Joystick = opaque {
};
pub const SDL_Joystick = struct_SDL_Joystick;
pub const SDL_JoystickID = Uint32;
pub extern fn SDL_LockJoysticks_REAL() void;
pub extern fn SDL_UnlockJoysticks_REAL() void;
pub extern fn SDL_GetJoystickVendor_REAL(joystick: ?*SDL_Joystick) Uint16;
pub extern fn SDL_GetJoystickProduct_REAL(joystick: ?*SDL_Joystick) Uint16;
pub extern fn SDL_GetJoystickID_REAL(joystick: ?*SDL_Joystick) SDL_JoystickID;
pub extern fn SDL_GetNumJoystickAxes_REAL(joystick: ?*SDL_Joystick) c_int;
pub extern fn SDL_IsGamepad_REAL(instance_id: SDL_JoystickID) bool;
pub const SDL_HapticID = Uint32;
pub const SDL_HapticEffectType = Uint16;
pub const SDL_HapticDirectionType = Uint8;
pub const struct_SDL_HapticDirection = extern struct {
    type: SDL_HapticDirectionType = 0,
    dir: [3]Sint32 = @import("std").mem.zeroes([3]Sint32),
};
pub const SDL_HapticDirection = struct_SDL_HapticDirection;
pub const struct_SDL_HapticConstant = extern struct {
    type: SDL_HapticEffectType = 0,
    direction: SDL_HapticDirection = @import("std").mem.zeroes(SDL_HapticDirection),
    length: Uint32 = 0,
    delay: Uint16 = 0,
    button: Uint16 = 0,
    interval: Uint16 = 0,
    level: Sint16 = 0,
    attack_length: Uint16 = 0,
    attack_level: Uint16 = 0,
    fade_length: Uint16 = 0,
    fade_level: Uint16 = 0,
};
pub const SDL_HapticConstant = struct_SDL_HapticConstant;
pub const struct_SDL_HapticPeriodic = extern struct {
    type: SDL_HapticEffectType = 0,
    direction: SDL_HapticDirection = @import("std").mem.zeroes(SDL_HapticDirection),
    length: Uint32 = 0,
    delay: Uint16 = 0,
    button: Uint16 = 0,
    interval: Uint16 = 0,
    period: Uint16 = 0,
    magnitude: Sint16 = 0,
    offset: Sint16 = 0,
    phase: Uint16 = 0,
    attack_length: Uint16 = 0,
    attack_level: Uint16 = 0,
    fade_length: Uint16 = 0,
    fade_level: Uint16 = 0,
};
pub const SDL_HapticPeriodic = struct_SDL_HapticPeriodic;
pub const struct_SDL_HapticCondition = extern struct {
    type: SDL_HapticEffectType = 0,
    direction: SDL_HapticDirection = @import("std").mem.zeroes(SDL_HapticDirection),
    length: Uint32 = 0,
    delay: Uint16 = 0,
    button: Uint16 = 0,
    interval: Uint16 = 0,
    right_sat: [3]Uint16 = @import("std").mem.zeroes([3]Uint16),
    left_sat: [3]Uint16 = @import("std").mem.zeroes([3]Uint16),
    right_coeff: [3]Sint16 = @import("std").mem.zeroes([3]Sint16),
    left_coeff: [3]Sint16 = @import("std").mem.zeroes([3]Sint16),
    deadband: [3]Uint16 = @import("std").mem.zeroes([3]Uint16),
    center: [3]Sint16 = @import("std").mem.zeroes([3]Sint16),
};
pub const SDL_HapticCondition = struct_SDL_HapticCondition;
pub const struct_SDL_HapticRamp = extern struct {
    type: SDL_HapticEffectType = 0,
    direction: SDL_HapticDirection = @import("std").mem.zeroes(SDL_HapticDirection),
    length: Uint32 = 0,
    delay: Uint16 = 0,
    button: Uint16 = 0,
    interval: Uint16 = 0,
    start: Sint16 = 0,
    end: Sint16 = 0,
    attack_length: Uint16 = 0,
    attack_level: Uint16 = 0,
    fade_length: Uint16 = 0,
    fade_level: Uint16 = 0,
};
pub const SDL_HapticRamp = struct_SDL_HapticRamp;
pub const struct_SDL_HapticLeftRight = extern struct {
    type: SDL_HapticEffectType = 0,
    length: Uint32 = 0,
    large_magnitude: Uint16 = 0,
    small_magnitude: Uint16 = 0,
};
pub const SDL_HapticLeftRight = struct_SDL_HapticLeftRight;
pub const struct_SDL_HapticCustom = extern struct {
    type: SDL_HapticEffectType = 0,
    direction: SDL_HapticDirection = @import("std").mem.zeroes(SDL_HapticDirection),
    length: Uint32 = 0,
    delay: Uint16 = 0,
    button: Uint16 = 0,
    interval: Uint16 = 0,
    channels: Uint8 = 0,
    period: Uint16 = 0,
    samples: Uint16 = 0,
    data: [*c]Uint16 = null,
    attack_length: Uint16 = 0,
    attack_level: Uint16 = 0,
    fade_length: Uint16 = 0,
    fade_level: Uint16 = 0,
};
pub const SDL_HapticCustom = struct_SDL_HapticCustom;
pub const union_SDL_HapticEffect = extern union {
    type: SDL_HapticEffectType,
    constant: SDL_HapticConstant,
    periodic: SDL_HapticPeriodic,
    condition: SDL_HapticCondition,
    ramp: SDL_HapticRamp,
    leftright: SDL_HapticLeftRight,
    custom: SDL_HapticCustom,
};
pub const SDL_HapticEffect = union_SDL_HapticEffect;
pub const struct_haptic_hweffect_14 = opaque {};
pub const struct_haptic_effect = extern struct {
    effect: SDL_HapticEffect = @import("std").mem.zeroes(SDL_HapticEffect),
    hweffect: ?*struct_haptic_hweffect_14 = null,
};
pub const struct_haptic_hwdata_15 = opaque {};
pub const SDL_HapticEffectID = c_int;
pub const struct_SDL_Haptic = extern struct {
    instance_id: SDL_HapticID = 0,
    name: [*c]u8 = null,
    effects: [*c]struct_haptic_effect = null,
    neffects: c_int = 0,
    nplaying: c_int = 0,
    supported: Uint32 = 0,
    naxes: c_int = 0,
    hwdata: ?*struct_haptic_hwdata_15 = null,
    ref_count: c_int = 0,
    rumble_id: SDL_HapticEffectID = 0,
    rumble_effect: SDL_HapticEffect = @import("std").mem.zeroes(SDL_HapticEffect),
    next: [*c]struct_SDL_Haptic = null,
};
pub const SDL_Haptic = struct_SDL_Haptic;
pub extern fn SDL_GetHint_REAL(name: [*c]const u8) [*c]const u8;
pub extern fn SDL_GetHintBoolean_REAL(name: [*c]const u8, default_value: bool) bool;
pub const SDL_OBJECT_TYPE_HAPTIC: c_int = 6;
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
pub extern fn SDL_SYS_HapticInit() bool;
pub extern fn SDL_SYS_NumHaptics() c_int;
pub extern fn SDL_SYS_HapticInstanceID(index: c_int) SDL_HapticID;
pub extern fn SDL_SYS_HapticName(index: c_int) [*c]const u8;
pub extern fn SDL_SYS_HapticOpen(haptic: [*c]SDL_Haptic) bool;
pub extern fn SDL_SYS_HapticMouse() c_int;
pub extern fn SDL_SYS_JoystickIsHaptic(joystick: ?*SDL_Joystick) bool;
pub extern fn SDL_SYS_HapticOpenFromJoystick(haptic: [*c]SDL_Haptic, joystick: ?*SDL_Joystick) bool;
pub extern fn SDL_SYS_JoystickSameHaptic(haptic: [*c]SDL_Haptic, joystick: ?*SDL_Joystick) bool;
pub extern fn SDL_SYS_HapticClose(haptic: [*c]SDL_Haptic) void;
pub extern fn SDL_SYS_HapticQuit() void;
pub extern fn SDL_SYS_HapticNewEffect(haptic: [*c]SDL_Haptic, effect: [*c]struct_haptic_effect, base: [*c]const SDL_HapticEffect) bool;
pub extern fn SDL_SYS_HapticUpdateEffect(haptic: [*c]SDL_Haptic, effect: [*c]struct_haptic_effect, data: [*c]const SDL_HapticEffect) bool;
pub extern fn SDL_SYS_HapticRunEffect(haptic: [*c]SDL_Haptic, effect: [*c]struct_haptic_effect, iterations: Uint32) bool;
pub extern fn SDL_SYS_HapticStopEffect(haptic: [*c]SDL_Haptic, effect: [*c]struct_haptic_effect) bool;
pub extern fn SDL_SYS_HapticDestroyEffect(haptic: [*c]SDL_Haptic, effect: [*c]struct_haptic_effect) void;
pub extern fn SDL_SYS_HapticGetEffectStatus(haptic: [*c]SDL_Haptic, effect: [*c]struct_haptic_effect) c_int;
pub extern fn SDL_SYS_HapticSetGain(haptic: [*c]SDL_Haptic, gain: c_int) bool;
pub extern fn SDL_SYS_HapticSetAutocenter(haptic: [*c]SDL_Haptic, autocenter: c_int) bool;
pub extern fn SDL_SYS_HapticPause(haptic: [*c]SDL_Haptic) bool;
pub extern fn SDL_SYS_HapticResume(haptic: [*c]SDL_Haptic) bool;
pub extern fn SDL_SYS_HapticStopAll(haptic: [*c]SDL_Haptic) bool;
pub extern fn SDL_HIDAPI_HapticInit() bool;
pub extern fn SDL_HIDAPI_HapticIsHidapi(haptic: [*c]SDL_Haptic) bool;
pub extern fn SDL_HIDAPI_JoystickIsHaptic(joystick: ?*SDL_Joystick) bool;
pub extern fn SDL_HIDAPI_HapticOpenFromJoystick(haptic: [*c]SDL_Haptic, joystick: ?*SDL_Joystick) bool;
pub extern fn SDL_HIDAPI_JoystickSameHaptic(haptic: [*c]SDL_Haptic, joystick: ?*SDL_Joystick) bool;
pub extern fn SDL_HIDAPI_HapticClose(haptic: [*c]SDL_Haptic) void;
pub extern fn SDL_HIDAPI_HapticQuit() void;
pub extern fn SDL_HIDAPI_HapticNewEffect(haptic: [*c]SDL_Haptic, base: [*c]const SDL_HapticEffect) SDL_HapticEffectID;
pub extern fn SDL_HIDAPI_HapticUpdateEffect(haptic: [*c]SDL_Haptic, id: SDL_HapticEffectID, data: [*c]const SDL_HapticEffect) bool;
pub extern fn SDL_HIDAPI_HapticRunEffect(haptic: [*c]SDL_Haptic, id: SDL_HapticEffectID, iterations: Uint32) bool;
pub extern fn SDL_HIDAPI_HapticStopEffect(haptic: [*c]SDL_Haptic, id: SDL_HapticEffectID) bool;
pub extern fn SDL_HIDAPI_HapticDestroyEffect(haptic: [*c]SDL_Haptic, id: SDL_HapticEffectID) void;
pub extern fn SDL_HIDAPI_HapticGetEffectStatus(haptic: [*c]SDL_Haptic, id: SDL_HapticEffectID) bool;
pub extern fn SDL_HIDAPI_HapticSetGain(haptic: [*c]SDL_Haptic, gain: c_int) bool;
pub extern fn SDL_HIDAPI_HapticSetAutocenter(haptic: [*c]SDL_Haptic, autocenter: c_int) bool;
pub extern fn SDL_HIDAPI_HapticPause(haptic: [*c]SDL_Haptic) bool;
pub extern fn SDL_HIDAPI_HapticResume(haptic: [*c]SDL_Haptic) bool;
pub extern fn SDL_HIDAPI_HapticStopAll(haptic: [*c]SDL_Haptic) bool;
pub extern fn SDL_IsJoystickValid(joystick: ?*SDL_Joystick) bool;
pub const struct_SDL_Haptic_VIDPID_Naxes = extern struct {
    vid: Uint16 = 0,
    pid: Uint16 = 0,
    naxes: Uint16 = 0,
};
pub const SDL_Haptic_VIDPID_Naxes = struct_SDL_Haptic_VIDPID_Naxes;
pub fn SDL_Haptic_Load_Axes_List(entries: [*c][*c]SDL_Haptic_VIDPID_Naxes, num_entries: [*c]c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [25:0]u8 = "SDL_Haptic_Load_Axes_List".*;
    };
    _ = &static_local___func__;
    var entry: SDL_Haptic_VIDPID_Naxes = undefined;
    _ = &entry;
    var spot: [*c]const u8 = undefined;
    _ = &spot;
    var length: c_int = 0;
    _ = &length;
    spot = SDL_GetHint_REAL("SDL_JOYSTICK_HAPTIC_AXES");
    if (!(spot != null)) return;
    while (SDL_sscanf_REAL(spot, "0x%hx/0x%hx/%hu%n", &entry.vid, &entry.pid, &entry.naxes, &length) == @as(c_int, 3)) {
        while (true) {
            while (!(length > @as(c_int, 0))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "length > 0",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_haptic.c", 48);
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
        spot += @as(usize, @bitCast(@as(isize, @intCast(length))));
        length = 0;
        if (__helpers.signedRemainder(num_entries.*, @as(c_int, 8)) == @as(c_int, 0)) {
            var new_max: c_int = num_entries.* + @as(c_int, 8);
            _ = &new_max;
            var new_entries: [*c]SDL_Haptic_VIDPID_Naxes = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(entries.*)), @as(c_ulong, @bitCast(@as(c_long, new_max))) *% @sizeOf(@TypeOf(entries.*.*)))));
            _ = &new_entries;
            if (!(new_entries != null)) break;
            entries.* = new_entries;
        }
        entries.*[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &num_entries.*;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = entry;
        if (@as(c_int, spot[@as(c_int, 0)]) == @as(c_int, ',')) {
            spot += 1;
        }
    }
}
pub fn SDL_Haptic_Naxes_List_Index(entries: [*c]struct_SDL_Haptic_VIDPID_Naxes, num_entries: c_int, vid: Uint16, pid: Uint16) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    if (!(entries != null)) return -@as(c_int, 1);
    var i: c_int = undefined;
    _ = &i;
    {
        i = 0;
        while (i < num_entries) : (i += 1) {
            if ((@as(c_int, entries[@bitCast(@as(isize, @intCast(i)))].vid) == @as(c_int, vid)) and (@as(c_int, entries[@bitCast(@as(isize, @intCast(i)))].pid) == @as(c_int, pid))) return i;
        }
    }
    return -@as(c_int, 1);
}
pub fn SDL_Haptic_Get_Naxes(vid: Uint16, pid: Uint16) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var num_entries: c_int = 0;
    _ = &num_entries;
    var index_1: c_int = 0;
    _ = &index_1;
    var naxes: c_int = -@as(c_int, 1);
    _ = &naxes;
    var naxes_list: [*c]SDL_Haptic_VIDPID_Naxes = null;
    _ = &naxes_list;
    SDL_Haptic_Load_Axes_List(&naxes_list, &num_entries);
    if (!(num_entries != 0) or !(naxes_list != null)) return -@as(c_int, 1);
    index_1 = SDL_Haptic_Naxes_List_Index(naxes_list, num_entries, 65535, 65535);
    if (index_1 >= @as(c_int, 0)) {
        naxes = naxes_list[@bitCast(@as(isize, @intCast(index_1)))].naxes;
    }
    index_1 = SDL_Haptic_Naxes_List_Index(naxes_list, num_entries, vid, pid);
    if (index_1 >= @as(c_int, 0)) {
        naxes = naxes_list[@bitCast(@as(isize, @intCast(index_1)))].naxes;
    }
    SDL_free_REAL(@ptrCast(@alignCast(naxes_list)));
    return naxes;
}
pub var SDL_haptics: [*c]SDL_Haptic = null;
pub export fn SDL_InitHaptics() bool {
    @setEvalBranchQuota(100000);
    if (!SDL_SYS_HapticInit()) {
        return @"false" != 0;
    }
    if (!SDL_HIDAPI_HapticInit()) {
        SDL_SYS_HapticQuit();
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn SDL_GetHapticIndex(instance_id: SDL_HapticID, driver_index: [*c]c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var num_haptics: c_int = undefined;
    _ = &num_haptics;
    var device_index: c_int = undefined;
    _ = &device_index;
    if (instance_id > @as(SDL_HapticID, 0)) {
        num_haptics = SDL_SYS_NumHaptics();
        {
            device_index = 0;
            while (device_index < num_haptics) : (device_index += 1) {
                var haptic_id: SDL_HapticID = SDL_SYS_HapticInstanceID(device_index);
                _ = &haptic_id;
                if (haptic_id == instance_id) {
                    driver_index.* = device_index;
                    return @"true" != 0;
                }
            }
        }
    }
    _ = SDL_SetError_REAL("Haptic device %u not found", instance_id);
    return @"false" != 0;
}
pub export fn SDL_GetHaptics_REAL(count: [*c]c_int) [*c]SDL_HapticID {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [19:0]u8 = "SDL_GetHaptics_REAL".*;
    };
    _ = &static_local___func__;
    var device_index: c_int = undefined;
    _ = &device_index;
    var haptic_index: c_int = 0;
    _ = &haptic_index;
    var num_haptics: c_int = 0;
    _ = &num_haptics;
    var haptics: [*c]SDL_HapticID = undefined;
    _ = &haptics;
    num_haptics = SDL_SYS_NumHaptics();
    haptics = @ptrCast(@alignCast(SDL_malloc_REAL(@as(c_ulong, @bitCast(@as(c_long, num_haptics + @as(c_int, 1)))) *% @sizeOf(@TypeOf(haptics.*)))));
    if (haptics != null) {
        if (count != null) {
            count.* = num_haptics;
        }
        {
            device_index = 0;
            while (device_index < num_haptics) : (device_index += 1) {
                haptics[@bitCast(@as(isize, @intCast(haptic_index)))] = SDL_SYS_HapticInstanceID(device_index);
                while (true) {
                    while (!(haptics[@bitCast(@as(isize, @intCast(haptic_index)))] > @as(SDL_HapticID, 0))) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "haptics[haptic_index] > 0",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_haptic.c", 166);
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
                haptic_index += 1;
            }
        }
        haptics[@bitCast(@as(isize, @intCast(haptic_index)))] = 0;
    } else {
        if (count != null) {
            count.* = 0;
        }
    }
    return haptics;
}
pub export fn SDL_GetHapticNameForID_REAL(instance_id: SDL_HapticID) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var device_index: c_int = undefined;
    _ = &device_index;
    var name: [*c]const u8 = null;
    _ = &name;
    if (SDL_GetHapticIndex(instance_id, &device_index)) {
        name = SDL_GetPersistentString(SDL_SYS_HapticName(device_index));
    }
    return name;
}
pub export fn SDL_OpenHaptic_REAL(instance_id: SDL_HapticID) [*c]SDL_Haptic {
    @setEvalBranchQuota(100000);
    var haptic: [*c]SDL_Haptic = undefined;
    _ = &haptic;
    var hapticlist: [*c]SDL_Haptic = undefined;
    _ = &hapticlist;
    var name: [*c]const u8 = undefined;
    _ = &name;
    var device_index: c_int = 0;
    _ = &device_index;
    if (!SDL_GetHapticIndex(instance_id, &device_index)) {
        return null;
    }
    hapticlist = SDL_haptics;
    while (hapticlist != null) {
        if (instance_id == hapticlist.*.instance_id) {
            haptic = hapticlist;
            haptic.*.ref_count += 1;
            return haptic;
        }
        hapticlist = hapticlist.*.next;
    }
    haptic = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(haptic.*)))));
    if (!(haptic != null)) {
        return null;
    }
    haptic.*.instance_id = instance_id;
    haptic.*.rumble_id = -@as(c_int, 1);
    if (!SDL_SYS_HapticOpen(haptic)) {
        SDL_SetObjectValid(@ptrCast(@alignCast(haptic)), SDL_OBJECT_TYPE_HAPTIC, @"false" != 0);
        SDL_free_REAL(@ptrCast(@alignCast(haptic)));
        return null;
    }
    if (!(haptic.*.name != null)) {
        name = SDL_SYS_HapticName(device_index);
        if (name != null) {
            haptic.*.name = SDL_strdup_REAL(name);
        }
    }
    haptic.*.ref_count += 1;
    haptic.*.next = SDL_haptics;
    SDL_haptics = haptic;
    SDL_SetObjectValid(@ptrCast(@alignCast(haptic)), SDL_OBJECT_TYPE_HAPTIC, @"true" != 0);
    if ((haptic.*.supported & (@as(c_uint, 1) << @intCast(@as(c_uint, 16)))) != 0) {
        _ = SDL_SetHapticGain_REAL(haptic, 100);
    }
    if ((haptic.*.supported & (@as(c_uint, 1) << @intCast(@as(c_uint, 17)))) != 0) {
        _ = SDL_SetHapticAutocenter_REAL(haptic, 0);
    }
    return haptic;
}
pub export fn SDL_GetHapticFromID_REAL(instance_id: SDL_HapticID) [*c]SDL_Haptic {
    @setEvalBranchQuota(100000);
    var haptic: [*c]SDL_Haptic = undefined;
    _ = &haptic;
    {
        haptic = SDL_haptics;
        while (haptic != null) : (haptic = haptic.*.next) {
            if (instance_id == haptic.*.instance_id) {
                break;
            }
        }
    }
    return haptic;
}
pub export fn SDL_GetHapticID_REAL(haptic: [*c]SDL_Haptic) SDL_HapticID {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(haptic)), SDL_OBJECT_TYPE_HAPTIC)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("haptic"))));
        return 0;
    }
    return haptic.*.instance_id;
}
pub export fn SDL_GetHapticName_REAL(haptic: [*c]SDL_Haptic) [*c]const u8 {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(haptic)), SDL_OBJECT_TYPE_HAPTIC)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("haptic"))));
        return null;
    }
    return SDL_GetPersistentString(haptic.*.name);
}
pub export fn SDL_IsMouseHaptic_REAL() bool {
    @setEvalBranchQuota(100000);
    if (SDL_SYS_HapticMouse() < @as(c_int, 0)) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub export fn SDL_OpenHapticFromMouse_REAL() [*c]SDL_Haptic {
    @setEvalBranchQuota(100000);
    var device_index: c_int = undefined;
    _ = &device_index;
    device_index = SDL_SYS_HapticMouse();
    if (device_index < @as(c_int, 0)) {
        _ = SDL_SetError_REAL("Haptic: Mouse isn't a haptic device.");
        return null;
    }
    return SDL_OpenHaptic_REAL(@bitCast(@as(c_int, device_index)));
}
pub export fn SDL_IsJoystickHaptic_REAL(joystick: ?*SDL_Joystick) bool {
    @setEvalBranchQuota(100000);
    var result: bool = @"false" != 0;
    _ = &result;
    SDL_LockJoysticks_REAL();
    {
        if (SDL_IsJoystickValid(joystick) and (SDL_GetHintBoolean_REAL("SDL2_COMPAT", @"false" != 0) or !SDL_IsGamepad_REAL(SDL_GetJoystickID_REAL(joystick)))) {
            result = SDL_SYS_JoystickIsHaptic(joystick) or SDL_HIDAPI_JoystickIsHaptic(joystick);
        }
    }
    SDL_UnlockJoysticks_REAL();
    return result;
}
pub export fn SDL_OpenHapticFromJoystick_REAL(joystick: ?*SDL_Joystick) [*c]SDL_Haptic {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [31:0]u8 = "SDL_OpenHapticFromJoystick_REAL".*;
    };
    _ = &static_local___func__;
    var haptic: [*c]SDL_Haptic = undefined;
    _ = &haptic;
    var hapticlist: [*c]SDL_Haptic = undefined;
    _ = &hapticlist;
    SDL_LockJoysticks_REAL();
    {
        if (!SDL_IsJoystickHaptic_REAL(joystick)) {
            _ = SDL_SetError_REAL("Haptic: Joystick isn't a haptic device.");
            SDL_UnlockJoysticks_REAL();
            return null;
        }
        hapticlist = SDL_haptics;
        while (hapticlist != null) {
            if (SDL_SYS_JoystickSameHaptic(hapticlist, joystick) or SDL_HIDAPI_JoystickSameHaptic(hapticlist, joystick)) {
                haptic = hapticlist;
                haptic.*.ref_count += 1;
                SDL_UnlockJoysticks_REAL();
                return haptic;
            }
            hapticlist = hapticlist.*.next;
        }
        haptic = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(haptic.*)))));
        if (!(haptic != null)) {
            SDL_UnlockJoysticks_REAL();
            return null;
        }
        SDL_SetObjectValid(@ptrCast(@alignCast(haptic)), SDL_OBJECT_TYPE_HAPTIC, @"true" != 0);
        haptic.*.rumble_id = -@as(c_int, 1);
        if (SDL_HIDAPI_JoystickIsHaptic(joystick)) {
            if (!SDL_HIDAPI_HapticOpenFromJoystick(haptic, joystick)) {
                _ = SDL_SetError_REAL("Haptic: SDL_HIDAPI_HapticOpenFromJoystick failed.");
                SDL_SetObjectValid(@ptrCast(@alignCast(haptic)), SDL_OBJECT_TYPE_HAPTIC, @"false" != 0);
                SDL_free_REAL(@ptrCast(@alignCast(haptic)));
                SDL_UnlockJoysticks_REAL();
                return null;
            }
        } else if (!SDL_SYS_HapticOpenFromJoystick(haptic, joystick)) {
            _ = SDL_SetError_REAL("Haptic: SDL_SYS_HapticOpenFromJoystick failed.");
            SDL_SetObjectValid(@ptrCast(@alignCast(haptic)), SDL_OBJECT_TYPE_HAPTIC, @"false" != 0);
            SDL_free_REAL(@ptrCast(@alignCast(haptic)));
            SDL_UnlockJoysticks_REAL();
            return null;
        }
        while (true) {
            while (!(haptic.*.instance_id != @as(SDL_HapticID, 0))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "haptic->instance_id != 0",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_haptic.c", 384);
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
    SDL_UnlockJoysticks_REAL();
    var vid: Uint16 = SDL_GetJoystickVendor_REAL(joystick);
    _ = &vid;
    var pid: Uint16 = SDL_GetJoystickProduct_REAL(joystick);
    _ = &pid;
    var general_axes: c_int = SDL_GetNumJoystickAxes_REAL(joystick);
    _ = &general_axes;
    var naxes: c_int = SDL_Haptic_Get_Naxes(vid, pid);
    _ = &naxes;
    if (naxes > @as(c_int, 0)) {
        haptic.*.naxes = naxes;
    }
    if ((general_axes >= @as(c_int, 0)) and (naxes > general_axes)) {
        haptic.*.naxes = general_axes;
    }
    haptic.*.ref_count += 1;
    haptic.*.next = SDL_haptics;
    SDL_haptics = haptic;
    SDL_SetObjectValid(@ptrCast(@alignCast(haptic)), SDL_OBJECT_TYPE_HAPTIC, @"true" != 0);
    if ((haptic.*.supported & (@as(c_uint, 1) << @intCast(@as(c_uint, 16)))) != 0) {
        _ = SDL_SetHapticGain_REAL(haptic, 100);
    }
    if ((haptic.*.supported & (@as(c_uint, 1) << @intCast(@as(c_uint, 17)))) != 0) {
        _ = SDL_SetHapticAutocenter_REAL(haptic, 0);
    }
    return haptic;
}
pub export fn SDL_CloseHaptic_REAL(haptic: [*c]SDL_Haptic) void {
    @setEvalBranchQuota(100000);
    var i: SDL_HapticEffectID = undefined;
    _ = &i;
    var hapticlist: [*c]SDL_Haptic = undefined;
    _ = &hapticlist;
    var hapticlistprev: [*c]SDL_Haptic = undefined;
    _ = &hapticlistprev;
    if (!SDL_ObjectValid(@ptrCast(@alignCast(haptic)), SDL_OBJECT_TYPE_HAPTIC)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("haptic"))));
        return;
    }
    if ((blk: {
        const ref = &haptic.*.ref_count;
        ref.* -= 1;
        break :blk ref.*;
    }) > @as(c_int, 0)) {
        return;
    }
    if (SDL_HIDAPI_HapticIsHidapi(haptic)) {
        SDL_HIDAPI_HapticClose(haptic);
    } else {
        {
            i = 0;
            while (i < haptic.*.neffects) : (i += 1) {
                if (@as(?*anyopaque, @ptrCast(@alignCast(haptic.*.effects[@bitCast(@as(isize, @intCast(i)))].hweffect))) != @as(?*anyopaque, null)) {
                    SDL_DestroyHapticEffect_REAL(haptic, i);
                }
            }
        }
        SDL_SYS_HapticClose(haptic);
    }
    SDL_SetObjectValid(@ptrCast(@alignCast(haptic)), SDL_OBJECT_TYPE_HAPTIC, @"false" != 0);
    hapticlist = SDL_haptics;
    hapticlistprev = null;
    while (hapticlist != null) {
        if (haptic == hapticlist) {
            if (hapticlistprev != null) {
                hapticlistprev.*.next = hapticlist.*.next;
            } else {
                SDL_haptics = haptic.*.next;
            }
            break;
        }
        hapticlistprev = hapticlist;
        hapticlist = hapticlist.*.next;
    }
    SDL_free_REAL(@ptrCast(@alignCast(haptic.*.name)));
    SDL_free_REAL(@ptrCast(@alignCast(haptic)));
}
pub export fn SDL_QuitHaptics() void {
    @setEvalBranchQuota(100000);
    while (SDL_haptics != null) {
        SDL_CloseHaptic_REAL(SDL_haptics);
    }
    SDL_HIDAPI_HapticQuit();
    SDL_SYS_HapticQuit();
}
pub export fn SDL_GetMaxHapticEffects_REAL(haptic: [*c]SDL_Haptic) c_int {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(haptic)), SDL_OBJECT_TYPE_HAPTIC)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("haptic"))));
        return -@as(c_int, 1);
    }
    return haptic.*.neffects;
}
pub export fn SDL_GetMaxHapticEffectsPlaying_REAL(haptic: [*c]SDL_Haptic) c_int {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(haptic)), SDL_OBJECT_TYPE_HAPTIC)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("haptic"))));
        return -@as(c_int, 1);
    }
    return haptic.*.nplaying;
}
pub export fn SDL_GetHapticFeatures_REAL(haptic: [*c]SDL_Haptic) Uint32 {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(haptic)), SDL_OBJECT_TYPE_HAPTIC)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("haptic"))));
        return 0;
    }
    return haptic.*.supported;
}
pub export fn SDL_GetNumHapticAxes_REAL(haptic: [*c]SDL_Haptic) c_int {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(haptic)), SDL_OBJECT_TYPE_HAPTIC)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("haptic"))));
        return -@as(c_int, 1);
    }
    return haptic.*.naxes;
}
pub export fn SDL_HapticEffectSupported_REAL(haptic: [*c]SDL_Haptic, effect: [*c]const SDL_HapticEffect) bool {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(haptic)), SDL_OBJECT_TYPE_HAPTIC)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("haptic"))));
        return @"false" != 0;
    }
    if (!(effect != null)) {
        return @"false" != 0;
    }
    if ((haptic.*.supported & @as(Uint32, @bitCast(@as(c_int, @as(c_int, effect.*.type))))) != @as(Uint32, 0)) {
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub export fn SDL_CreateHapticEffect_REAL(haptic: [*c]SDL_Haptic, effect: [*c]const SDL_HapticEffect) SDL_HapticEffectID {
    @setEvalBranchQuota(100000);
    var i: SDL_HapticEffectID = undefined;
    _ = &i;
    if (!SDL_ObjectValid(@ptrCast(@alignCast(haptic)), SDL_OBJECT_TYPE_HAPTIC)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("haptic"))));
        return -@as(c_int, 1);
    }
    if (!(effect != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("effect"))));
        return -@as(c_int, 1);
    }
    if (@as(c_int, @intFromBool(SDL_HapticEffectSupported_REAL(haptic, effect))) == @"false") {
        _ = SDL_SetError_REAL("Haptic: Effect not supported by haptic device.");
        return -@as(c_int, 1);
    }
    if (SDL_HIDAPI_HapticIsHidapi(haptic)) {
        return SDL_HIDAPI_HapticNewEffect(haptic, effect);
    }
    {
        i = 0;
        while (i < haptic.*.neffects) : (i += 1) {
            if (@as(?*anyopaque, @ptrCast(@alignCast(haptic.*.effects[@bitCast(@as(isize, @intCast(i)))].hweffect))) == @as(?*anyopaque, null)) {
                if (!SDL_SYS_HapticNewEffect(haptic, &haptic.*.effects[@bitCast(@as(isize, @intCast(i)))], effect)) {
                    return -@as(c_int, 1);
                }
                _ = memcpy(@ptrCast(@alignCast(&haptic.*.effects[@bitCast(@as(isize, @intCast(i)))].effect)), @ptrCast(@alignCast(effect)), @sizeOf(SDL_HapticEffect));
                return i;
            }
        }
    }
    _ = SDL_SetError_REAL("Haptic: Device has no free space left.");
    return -@as(c_int, 1);
}
pub fn ValidEffect(haptic: [*c]SDL_Haptic, arg_effect: SDL_HapticEffectID) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var effect = arg_effect;
    _ = &effect;
    if ((effect < @as(c_int, 0)) or (effect >= haptic.*.neffects)) {
        _ = SDL_SetError_REAL("Haptic: Invalid effect identifier.");
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub export fn SDL_UpdateHapticEffect_REAL(haptic: [*c]SDL_Haptic, effect: SDL_HapticEffectID, data: [*c]const SDL_HapticEffect) bool {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(haptic)), SDL_OBJECT_TYPE_HAPTIC)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("haptic"))));
        return @"false" != 0;
    }
    if (!ValidEffect(haptic, effect)) {
        return @"false" != 0;
    }
    if (!(data != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("data"))));
    }
    if (@as(c_int, data.*.type) != @as(c_int, haptic.*.effects[@bitCast(@as(isize, @intCast(effect)))].effect.type)) {
        return SDL_SetError_REAL("Haptic: Updating effect type is illegal.");
    }
    if (SDL_HIDAPI_HapticIsHidapi(haptic)) {
        return SDL_HIDAPI_HapticUpdateEffect(haptic, effect, data);
    }
    if (!SDL_SYS_HapticUpdateEffect(haptic, &haptic.*.effects[@bitCast(@as(isize, @intCast(effect)))], data)) {
        return @"false" != 0;
    }
    _ = memcpy(@ptrCast(@alignCast(&haptic.*.effects[@bitCast(@as(isize, @intCast(effect)))].effect)), @ptrCast(@alignCast(data)), @sizeOf(SDL_HapticEffect));
    return @"true" != 0;
}
pub export fn SDL_RunHapticEffect_REAL(haptic: [*c]SDL_Haptic, effect: SDL_HapticEffectID, iterations: Uint32) bool {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(haptic)), SDL_OBJECT_TYPE_HAPTIC)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("haptic"))));
        return @"false" != 0;
    }
    if (SDL_HIDAPI_HapticIsHidapi(haptic)) {
        return SDL_HIDAPI_HapticRunEffect(haptic, effect, iterations);
    }
    if (!ValidEffect(haptic, effect)) {
        return @"false" != 0;
    }
    if (!SDL_SYS_HapticRunEffect(haptic, &haptic.*.effects[@bitCast(@as(isize, @intCast(effect)))], iterations)) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub export fn SDL_StopHapticEffect_REAL(haptic: [*c]SDL_Haptic, effect: SDL_HapticEffectID) bool {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(haptic)), SDL_OBJECT_TYPE_HAPTIC)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("haptic"))));
        return @"false" != 0;
    }
    if (SDL_HIDAPI_HapticIsHidapi(haptic)) {
        return SDL_HIDAPI_HapticStopEffect(haptic, effect);
    }
    if (!ValidEffect(haptic, effect)) {
        return @"false" != 0;
    }
    if (!SDL_SYS_HapticStopEffect(haptic, &haptic.*.effects[@bitCast(@as(isize, @intCast(effect)))])) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub export fn SDL_DestroyHapticEffect_REAL(haptic: [*c]SDL_Haptic, effect: SDL_HapticEffectID) void {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(haptic)), SDL_OBJECT_TYPE_HAPTIC)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("haptic"))));
        return;
    }
    if (SDL_HIDAPI_HapticIsHidapi(haptic)) {
        SDL_HIDAPI_HapticDestroyEffect(haptic, effect);
        return;
    }
    if (!ValidEffect(haptic, effect)) {
        return;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(haptic.*.effects[@bitCast(@as(isize, @intCast(effect)))].hweffect))) == @as(?*anyopaque, null)) {
        return;
    }
    SDL_SYS_HapticDestroyEffect(haptic, &haptic.*.effects[@bitCast(@as(isize, @intCast(effect)))]);
}
pub export fn SDL_GetHapticEffectStatus_REAL(haptic: [*c]SDL_Haptic, effect: SDL_HapticEffectID) bool {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(haptic)), SDL_OBJECT_TYPE_HAPTIC)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("haptic"))));
        return @"false" != 0;
    }
    if (SDL_HIDAPI_HapticIsHidapi(haptic)) {
        return SDL_HIDAPI_HapticGetEffectStatus(haptic, effect);
    }
    if (!ValidEffect(haptic, effect)) {
        return @"false" != 0;
    }
    if (!((haptic.*.supported & (@as(c_uint, 1) << @intCast(@as(c_uint, 18)))) != 0)) {
        return SDL_SetError_REAL("Haptic: Device does not support status queries.");
    }
    _ = SDL_ClearError_REAL();
    return SDL_SYS_HapticGetEffectStatus(haptic, &haptic.*.effects[@bitCast(@as(isize, @intCast(effect)))]) > @as(c_int, 0);
}
pub export fn SDL_SetHapticGain_REAL(haptic: [*c]SDL_Haptic, gain: c_int) bool {
    @setEvalBranchQuota(100000);
    var env: [*c]const u8 = undefined;
    _ = &env;
    var real_gain: c_int = undefined;
    _ = &real_gain;
    var max_gain: c_int = undefined;
    _ = &max_gain;
    if (!SDL_ObjectValid(@ptrCast(@alignCast(haptic)), SDL_OBJECT_TYPE_HAPTIC)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("haptic"))));
        return @"false" != 0;
    }
    if (!((haptic.*.supported & (@as(c_uint, 1) << @intCast(@as(c_uint, 16)))) != 0)) {
        return SDL_SetError_REAL("Haptic: Device does not support setting gain.");
    }
    if ((gain < @as(c_int, 0)) or (gain > @as(c_int, 100))) {
        return SDL_SetError_REAL("Haptic: Gain must be between 0 and 100.");
    }
    env = SDL_getenv_REAL("SDL_HAPTIC_GAIN_MAX");
    if (env != null) {
        max_gain = SDL_atoi_REAL(env);
        if (max_gain < @as(c_int, 0)) {
            max_gain = 0;
        } else if (max_gain > @as(c_int, 100)) {
            max_gain = 100;
        }
        real_gain = @divTrunc(gain * max_gain, @as(c_int, 100));
    } else {
        real_gain = gain;
    }
    if (SDL_HIDAPI_HapticIsHidapi(haptic)) {
        return SDL_HIDAPI_HapticSetGain(haptic, real_gain);
    }
    return SDL_SYS_HapticSetGain(haptic, real_gain);
}
pub export fn SDL_SetHapticAutocenter_REAL(haptic: [*c]SDL_Haptic, autocenter: c_int) bool {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(haptic)), SDL_OBJECT_TYPE_HAPTIC)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("haptic"))));
        return @"false" != 0;
    }
    if (!((haptic.*.supported & (@as(c_uint, 1) << @intCast(@as(c_uint, 17)))) != 0)) {
        return SDL_SetError_REAL("Haptic: Device does not support setting autocenter.");
    }
    if ((autocenter < @as(c_int, 0)) or (autocenter > @as(c_int, 100))) {
        return SDL_SetError_REAL("Haptic: Autocenter must be between 0 and 100.");
    }
    if (SDL_HIDAPI_HapticIsHidapi(haptic)) {
        return SDL_HIDAPI_HapticSetAutocenter(haptic, autocenter);
    }
    return SDL_SYS_HapticSetAutocenter(haptic, autocenter);
}
pub export fn SDL_PauseHaptic_REAL(haptic: [*c]SDL_Haptic) bool {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(haptic)), SDL_OBJECT_TYPE_HAPTIC)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("haptic"))));
        return @"false" != 0;
    }
    if (!((haptic.*.supported & (@as(c_uint, 1) << @intCast(@as(c_uint, 19)))) != 0)) {
        return SDL_SetError_REAL("Haptic: Device does not support setting pausing.");
    }
    if (SDL_HIDAPI_HapticIsHidapi(haptic)) {
        return SDL_HIDAPI_HapticPause(haptic);
    }
    return SDL_SYS_HapticPause(haptic);
}
pub export fn SDL_ResumeHaptic_REAL(haptic: [*c]SDL_Haptic) bool {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(haptic)), SDL_OBJECT_TYPE_HAPTIC)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("haptic"))));
        return @"false" != 0;
    }
    if (!((haptic.*.supported & (@as(c_uint, 1) << @intCast(@as(c_uint, 19)))) != 0)) {
        return @"true" != 0;
    }
    if (SDL_HIDAPI_HapticIsHidapi(haptic)) {
        return SDL_HIDAPI_HapticResume(haptic);
    }
    return SDL_SYS_HapticResume(haptic);
}
pub export fn SDL_StopHapticEffects_REAL(haptic: [*c]SDL_Haptic) bool {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(haptic)), SDL_OBJECT_TYPE_HAPTIC)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("haptic"))));
        return @"false" != 0;
    }
    if (SDL_HIDAPI_HapticIsHidapi(haptic)) {
        return SDL_HIDAPI_HapticStopAll(haptic);
    }
    return SDL_SYS_HapticStopAll(haptic);
}
pub export fn SDL_HapticRumbleSupported_REAL(haptic: [*c]SDL_Haptic) bool {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(haptic)), SDL_OBJECT_TYPE_HAPTIC)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("haptic"))));
        return @"false" != 0;
    }
    return (haptic.*.supported & ((@as(c_uint, 1) << @intCast(@as(c_uint, 1))) | (@as(c_uint, 1) << @intCast(@as(c_uint, 11))))) != @as(Uint32, 0);
}
pub export fn SDL_InitHapticRumble_REAL(haptic: [*c]SDL_Haptic) bool {
    @setEvalBranchQuota(100000);
    var efx: [*c]SDL_HapticEffect = &haptic.*.rumble_effect;
    _ = &efx;
    if (!SDL_ObjectValid(@ptrCast(@alignCast(haptic)), SDL_OBJECT_TYPE_HAPTIC)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("haptic"))));
        return @"false" != 0;
    }
    if (haptic.*.rumble_id >= @as(c_int, 0)) {
        return @"true" != 0;
    }
    _ = memset(@ptrCast(@alignCast(efx)), 0, @sizeOf(@TypeOf(efx.*)));
    if ((haptic.*.supported & (@as(c_uint, 1) << @intCast(@as(c_uint, 1)))) != 0) {
        efx.*.type = @truncate(@as(c_uint, 1) << @intCast(@as(c_uint, 1)));
        efx.*.periodic.direction.type = SDL_HAPTIC_CARTESIAN;
        efx.*.periodic.period = 1000;
        efx.*.periodic.magnitude = 16384;
        efx.*.periodic.length = 5000;
        efx.*.periodic.attack_length = 0;
        efx.*.periodic.fade_length = 0;
    } else if ((haptic.*.supported & (@as(c_uint, 1) << @intCast(@as(c_uint, 11)))) != 0) {
        efx.*.type = @truncate(@as(c_uint, 1) << @intCast(@as(c_uint, 11)));
        efx.*.leftright.length = 5000;
        efx.*.leftright.large_magnitude = 16384;
        efx.*.leftright.small_magnitude = 16384;
    } else {
        return SDL_SetError_REAL("Device doesn't support rumble");
    }
    haptic.*.rumble_id = SDL_CreateHapticEffect_REAL(haptic, &haptic.*.rumble_effect);
    if (haptic.*.rumble_id >= @as(c_int, 0)) {
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub export fn SDL_PlayHapticRumble_REAL(haptic: [*c]SDL_Haptic, arg_strength: f32, length: Uint32) bool {
    @setEvalBranchQuota(100000);
    var strength = arg_strength;
    _ = &strength;
    const static_local___func__ = struct {
        const __func__: [25:0]u8 = "SDL_PlayHapticRumble_REAL".*;
    };
    _ = &static_local___func__;
    var efx: [*c]SDL_HapticEffect = undefined;
    _ = &efx;
    var magnitude: Sint16 = undefined;
    _ = &magnitude;
    if (!SDL_ObjectValid(@ptrCast(@alignCast(haptic)), SDL_OBJECT_TYPE_HAPTIC)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("haptic"))));
        return @"false" != 0;
    }
    if (haptic.*.rumble_id < @as(c_int, 0)) {
        return SDL_SetError_REAL("Haptic: Rumble effect not initialized on haptic device");
    }
    if (strength > @as(f32, 1.0)) {
        strength = 1.0;
    } else if (strength < @as(f32, 0.0)) {
        strength = 0.0;
    }
    magnitude = @intFromFloat(@as(f32, 32767.0) * strength);
    efx = &haptic.*.rumble_effect;
    if (@as(c_uint, @bitCast(@as(c_int, @as(c_int, efx.*.type)))) == (@as(c_uint, 1) << @intCast(@as(c_uint, 1)))) {
        efx.*.periodic.magnitude = magnitude;
        efx.*.periodic.length = length;
    } else if (@as(c_uint, @bitCast(@as(c_int, @as(c_int, efx.*.type)))) == (@as(c_uint, 1) << @intCast(@as(c_uint, 11)))) {
        efx.*.leftright.small_magnitude = blk: {
            const tmp = @as(Uint16, @bitCast(@as(c_short, magnitude)));
            efx.*.leftright.large_magnitude = tmp;
            break :blk tmp;
        };
        efx.*.leftright.length = length;
    } else {
        while (true) {
            while (!!(@intFromPtr("This should have been caught elsewhere") != 0)) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "!\"This should have been caught elsewhere\"",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_haptic.c", 881);
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
    if (!SDL_UpdateHapticEffect_REAL(haptic, haptic.*.rumble_id, &haptic.*.rumble_effect)) {
        return @"false" != 0;
    }
    return SDL_RunHapticEffect_REAL(haptic, haptic.*.rumble_id, 1);
}
pub export fn SDL_StopHapticRumble_REAL(haptic: [*c]SDL_Haptic) bool {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(haptic)), SDL_OBJECT_TYPE_HAPTIC)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("haptic"))));
        return @"false" != 0;
    }
    if (haptic.*.rumble_id < @as(c_int, 0)) {
        return SDL_SetError_REAL("Haptic: Rumble effect not initialized on haptic device");
    }
    return SDL_StopHapticEffect_REAL(haptic, haptic.*.rumble_id);
}

pub const SDL_CloseHaptic = SDL_CloseHaptic_REAL;
pub const SDL_CreateHapticEffect = SDL_CreateHapticEffect_REAL;
pub const SDL_DestroyHapticEffect = SDL_DestroyHapticEffect_REAL;
pub const SDL_GetHapticEffectStatus = SDL_GetHapticEffectStatus_REAL;
pub const SDL_GetHapticFeatures = SDL_GetHapticFeatures_REAL;
pub const SDL_GetHapticFromID = SDL_GetHapticFromID_REAL;
pub const SDL_GetHapticID = SDL_GetHapticID_REAL;
pub const SDL_GetHapticName = SDL_GetHapticName_REAL;
pub const SDL_GetHapticNameForID = SDL_GetHapticNameForID_REAL;
pub const SDL_GetHaptics = SDL_GetHaptics_REAL;
pub const SDL_GetMaxHapticEffects = SDL_GetMaxHapticEffects_REAL;
pub const SDL_GetMaxHapticEffectsPlaying = SDL_GetMaxHapticEffectsPlaying_REAL;
pub const SDL_GetNumHapticAxes = SDL_GetNumHapticAxes_REAL;
pub const SDL_HapticEffectSupported = SDL_HapticEffectSupported_REAL;
pub const SDL_HapticRumbleSupported = SDL_HapticRumbleSupported_REAL;
pub const SDL_InitHapticRumble = SDL_InitHapticRumble_REAL;
pub const SDL_IsJoystickHaptic = SDL_IsJoystickHaptic_REAL;
pub const SDL_IsMouseHaptic = SDL_IsMouseHaptic_REAL;
pub const SDL_OpenHaptic = SDL_OpenHaptic_REAL;
pub const SDL_OpenHapticFromJoystick = SDL_OpenHapticFromJoystick_REAL;
pub const SDL_OpenHapticFromMouse = SDL_OpenHapticFromMouse_REAL;
pub const SDL_PauseHaptic = SDL_PauseHaptic_REAL;
pub const SDL_PlayHapticRumble = SDL_PlayHapticRumble_REAL;
pub const SDL_ResumeHaptic = SDL_ResumeHaptic_REAL;
pub const SDL_RunHapticEffect = SDL_RunHapticEffect_REAL;
pub const SDL_SetHapticAutocenter = SDL_SetHapticAutocenter_REAL;
pub const SDL_SetHapticGain = SDL_SetHapticGain_REAL;
pub const SDL_StopHapticEffect = SDL_StopHapticEffect_REAL;
pub const SDL_StopHapticEffects = SDL_StopHapticEffects_REAL;
pub const SDL_StopHapticRumble = SDL_StopHapticRumble_REAL;
pub const SDL_UpdateHapticEffect = SDL_UpdateHapticEffect_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_HAPTIC_CARTESIAN = @as(c_int, 1);
