// /*
//   Simple DirectMedia Layer
//   Copyright (C) 2025 Katharine Chui <katharine.chui@gmail.com>
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
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Sint16 = i16;
pub const Uint16 = u16;
pub const Sint32 = i32;
pub const Uint32 = u32;
pub const Uint64 = u64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub extern fn SDL_OutOfMemory_REAL() bool;
pub const SDL_PropertiesID = Uint32;
pub const struct_SDL_Mutex = opaque {
};
pub const SDL_Mutex = struct_SDL_Mutex;
pub extern fn SDL_CreateMutex_REAL() ?*SDL_Mutex;
pub extern fn SDL_LockMutex_REAL(mutex: ?*SDL_Mutex) void;
pub extern fn SDL_UnlockMutex_REAL(mutex: ?*SDL_Mutex) void;
pub extern fn SDL_DestroyMutex_REAL(mutex: ?*SDL_Mutex) void;
pub const struct_SDL_GUID = extern struct {
    data: [16]Uint8 = @import("std").mem.zeroes([16]Uint8),
};
pub const SDL_GUID = struct_SDL_GUID;
pub const enum_SDL_PowerState = c_int;
pub const SDL_PowerState = enum_SDL_PowerState;
pub const struct_SDL_Sensor = opaque {
};
pub const SDL_Sensor = struct_SDL_Sensor;
pub const SDL_SensorID = Uint32;
pub const enum_SDL_SensorType = c_int;
pub const SDL_SensorType = enum_SDL_SensorType;
pub const struct_SDL_Joystick = extern struct {
    instance_id: SDL_JoystickID = 0,
    name: [*c]u8 = null,
    path: [*c]u8 = null,
    serial: [*c]u8 = null,
    guid: SDL_GUID = @import("std").mem.zeroes(SDL_GUID),
    firmware_version: Uint16 = 0,
    steam_handle: Uint64 = 0,
    swap_face_buttons: bool = false,
    is_virtual: bool = false,
    naxes: c_int = 0,
    axes: [*c]SDL_JoystickAxisInfo = null,
    nballs: c_int = 0,
    balls: [*c]SDL_JoystickBallData = null,
    nhats: c_int = 0,
    hats: [*c]Uint8 = null,
    nbuttons: c_int = 0,
    buttons: [*c]bool = null,
    ntouchpads: c_int = 0,
    touchpads: [*c]SDL_JoystickTouchpadInfo = null,
    nsensors: c_int = 0,
    nsensors_enabled: c_int = 0,
    sensors: [*c]SDL_JoystickSensorInfo = null,
    ncapsenses: c_int = 0,
    capsenses: [*c]SDL_JoystickCapSenseInfo = null,
    low_frequency_rumble: Uint16 = 0,
    high_frequency_rumble: Uint16 = 0,
    rumble_expiration: Uint64 = 0,
    rumble_resend: Uint64 = 0,
    left_trigger_rumble: Uint16 = 0,
    right_trigger_rumble: Uint16 = 0,
    trigger_rumble_expiration: Uint64 = 0,
    trigger_rumble_resend: Uint64 = 0,
    led_red: Uint8 = 0,
    led_green: Uint8 = 0,
    led_blue: Uint8 = 0,
    led_expiration: Uint64 = 0,
    attached: bool = false,
    connection_state: SDL_JoystickConnectionState = @import("std").mem.zeroes(SDL_JoystickConnectionState),
    battery_state: SDL_PowerState = @import("std").mem.zeroes(SDL_PowerState),
    battery_percent: c_int = 0,
    delayed_guide_button: bool = false,
    accel_sensor: SDL_SensorID = 0,
    accel: ?*SDL_Sensor = null,
    gyro_sensor: SDL_SensorID = 0,
    gyro: ?*SDL_Sensor = null,
    sensor_transform: [3][3]f32 = @import("std").mem.zeroes([3][3]f32),
    update_complete: Uint64 = 0,
    driver: [*c]struct_SDL_JoystickDriver = null,
    hwdata: ?*struct_joystick_hwdata_8 = null,
    props: SDL_PropertiesID = 0,
    ref_count: c_int = 0,
    next: [*c]struct_SDL_Joystick = null,
};
pub const SDL_Joystick = struct_SDL_Joystick;
pub const SDL_JoystickID = Uint32;
pub const enum_SDL_JoystickConnectionState = c_int;
pub const SDL_JoystickConnectionState = enum_SDL_JoystickConnectionState;
pub extern fn SDL_OpenJoystick_REAL(instance_id: SDL_JoystickID) [*c]SDL_Joystick;
pub extern fn SDL_GetJoystickID_REAL(joystick: [*c]SDL_Joystick) SDL_JoystickID;
pub extern fn SDL_CloseJoystick_REAL(joystick: [*c]SDL_Joystick) void;
pub const enum_SDL_GamepadCapSenseType = c_int;
pub const SDL_GamepadCapSenseType = enum_SDL_GamepadCapSenseType;
pub const struct_SDL_Haptic = extern struct {
    instance_id: SDL_HapticID = 0,
    name: [*c]u8 = null,
    effects: [*c]struct_haptic_effect = null,
    neffects: c_int = 0,
    nplaying: c_int = 0,
    supported: Uint32 = 0,
    naxes: c_int = 0,
    hwdata: ?*struct_haptic_hwdata_16 = null,
    ref_count: c_int = 0,
    rumble_id: SDL_HapticEffectID = 0,
    rumble_effect: SDL_HapticEffect = @import("std").mem.zeroes(SDL_HapticEffect),
    next: [*c]struct_SDL_Haptic = null,
};
pub const SDL_Haptic = struct_SDL_Haptic;
pub const SDL_HapticEffectType = Uint16;
pub const SDL_HapticDirectionType = Uint8;
pub const SDL_HapticEffectID = c_int;
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
pub const SDL_HapticID = Uint32;
pub export fn SDL_HIDAPI_HapticInit() bool {
    @setEvalBranchQuota(100000);
    haptic_list_head = null;
    haptic_list_mutex = SDL_CreateMutex_REAL();
    if (@as(?*anyopaque, @ptrCast(@alignCast(haptic_list_mutex))) == @as(?*anyopaque, null)) {
        return SDL_OutOfMemory_REAL();
    }
    return @"true" != 0;
}
pub export fn SDL_HIDAPI_HapticIsHidapi(haptic: [*c]SDL_Haptic) bool {
    @setEvalBranchQuota(100000);
    var cur: [*c]haptic_list_node = undefined;
    _ = &cur;
    var ret: bool = @"false" != 0;
    _ = &ret;
    SDL_LockMutex_REAL(haptic_list_mutex);
    cur = haptic_list_head;
    while (@as(?*anyopaque, @ptrCast(@alignCast(cur))) != @as(?*anyopaque, null)) {
        if (cur.*.haptic == haptic) {
            ret = @"true" != 0;
            break;
        }
        cur = cur.*.next;
    }
    SDL_UnlockMutex_REAL(haptic_list_mutex);
    return ret;
}
pub export fn SDL_HIDAPI_JoystickIsHaptic(joystick: [*c]SDL_Joystick) bool {
    @setEvalBranchQuota(100000);
    const numdrivers: c_int = @bitCast(@as(c_uint, @truncate((@sizeOf(@TypeOf(drivers)) / @sizeOf(@TypeOf(drivers[@as(c_int, 0)]))) -% @as(c_ulong, 1))));
    _ = &numdrivers;
    var i: c_int = undefined;
    _ = &i;
    SDL_AssertJoysticksLocked();
    if (joystick.*.driver != (&SDL_HIDAPI_JoystickDriver)) {
        return @"false" != 0;
    }
    {
        i = 0;
        while (i < numdrivers) : (i += 1) {
            if (drivers[@bitCast(@as(isize, @intCast(i)))].*.JoystickSupported.?(joystick)) {
                return @"true" != 0;
            }
        }
    }
    return @"false" != 0;
}
pub export fn SDL_HIDAPI_HapticOpenFromJoystick(haptic: [*c]SDL_Haptic, joystick: [*c]SDL_Joystick) bool {
    @setEvalBranchQuota(100000);
    const numdrivers: c_int = @bitCast(@as(c_uint, @truncate((@sizeOf(@TypeOf(drivers)) / @sizeOf(@TypeOf(drivers[@as(c_int, 0)]))) -% @as(c_ulong, 1))));
    _ = &numdrivers;
    var i: c_int = undefined;
    _ = &i;
    SDL_AssertJoysticksLocked();
    if (joystick.*.driver != (&SDL_HIDAPI_JoystickDriver)) {
        return SDL_SetError_REAL("Cannot open hidapi haptic from non hidapi joystick");
    }
    {
        i = 0;
        while (i < numdrivers) : (i += 1) {
            if (drivers[@bitCast(@as(isize, @intCast(i)))].*.JoystickSupported.?(joystick)) {
                var device: [*c]SDL_HIDAPI_HapticDevice = undefined;
                _ = &device;
                var list_node: [*c]haptic_list_node = undefined;
                _ = &list_node;
                var ctx: ?*anyopaque = drivers[@bitCast(@as(isize, @intCast(i)))].*.Open.?(joystick);
                _ = &ctx;
                if (ctx == @as(?*anyopaque, null)) {
                    return @"false" != 0;
                }
                device = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(SDL_HIDAPI_HapticDevice))));
                if (@as(?*anyopaque, @ptrCast(@alignCast(device))) == @as(?*anyopaque, null)) {
                    var temp: SDL_HIDAPI_HapticDevice = undefined;
                    _ = &temp;
                    temp.ctx = ctx;
                    temp.driver = drivers[@bitCast(@as(isize, @intCast(i)))];
                    temp.joystick = joystick;
                    temp.driver.*.Close.?(&temp);
                    return SDL_OutOfMemory_REAL();
                }
                device.*.driver = drivers[@bitCast(@as(isize, @intCast(i)))];
                device.*.haptic = haptic;
                device.*.joystick = joystick;
                device.*.ctx = ctx;
                list_node = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(haptic_list_node))));
                if (@as(?*anyopaque, @ptrCast(@alignCast(list_node))) == @as(?*anyopaque, null)) {
                    device.*.driver.*.Close.?(device);
                    SDL_free_REAL(@ptrCast(@alignCast(device)));
                    return SDL_OutOfMemory_REAL();
                }
                haptic.*.hwdata = @ptrCast(@alignCast(device));
                haptic.*.neffects = device.*.driver.*.NumEffects.?(device);
                haptic.*.nplaying = device.*.driver.*.NumEffectsPlaying.?(device);
                haptic.*.supported = device.*.driver.*.GetFeatures.?(device);
                haptic.*.naxes = device.*.driver.*.NumAxes.?(device);
                haptic.*.neffects = device.*.driver.*.NumEffects.?(device);
                haptic.*.effects = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(struct_haptic_effect) *% @as(c_ulong, @bitCast(@as(c_long, haptic.*.neffects))))));
                if (@as(?*anyopaque, @ptrCast(@alignCast(haptic.*.effects))) == @as(?*anyopaque, null)) {
                    SDL_free_REAL(@ptrCast(@alignCast(list_node)));
                    device.*.driver.*.Close.?(device);
                    SDL_free_REAL(@ptrCast(@alignCast(device)));
                    return SDL_OutOfMemory_REAL();
                }
                _ = memset(@ptrCast(@alignCast(haptic.*.effects)), 0, @sizeOf(struct_haptic_effect) *% @as(c_ulong, @bitCast(@as(c_long, haptic.*.neffects))));
                haptic.*.instance_id = 255;
                list_node.*.haptic = haptic;
                list_node.*.next = null;
                _ = SDL_OpenJoystick_REAL(SDL_GetJoystickID_REAL(joystick));
                SDL_LockMutex_REAL(haptic_list_mutex);
                if (@as(?*anyopaque, @ptrCast(@alignCast(haptic_list_head))) == @as(?*anyopaque, null)) {
                    haptic_list_head = list_node;
                } else {
                    var cur: [*c]haptic_list_node = haptic_list_head;
                    _ = &cur;
                    while (@as(?*anyopaque, @ptrCast(@alignCast(cur.*.next))) != @as(?*anyopaque, null)) {
                        cur = cur.*.next;
                    }
                    cur.*.next = list_node;
                }
                SDL_UnlockMutex_REAL(haptic_list_mutex);
                return @"true" != 0;
            }
        }
    }
    return SDL_SetError_REAL("No supported HIDAPI haptic driver found for joystick");
}
pub export fn SDL_HIDAPI_JoystickSameHaptic(haptic: [*c]SDL_Haptic, joystick: [*c]SDL_Joystick) bool {
    @setEvalBranchQuota(100000);
    var device: [*c]SDL_HIDAPI_HapticDevice = undefined;
    _ = &device;
    SDL_AssertJoysticksLocked();
    if (joystick.*.driver != (&SDL_HIDAPI_JoystickDriver)) {
        return @"false" != 0;
    }
    device = @ptrCast(@alignCast(haptic.*.hwdata));
    if (joystick == device.*.joystick) {
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub export fn SDL_HIDAPI_HapticClose(haptic: [*c]SDL_Haptic) void {
    @setEvalBranchQuota(100000);
    var cur: [*c]haptic_list_node = undefined;
    _ = &cur;
    var last: [*c]haptic_list_node = undefined;
    _ = &last;
    SDL_LockMutex_REAL(haptic_list_mutex);
    cur = haptic_list_head;
    last = null;
    while (@as(?*anyopaque, @ptrCast(@alignCast(cur))) != @as(?*anyopaque, null)) {
        if (cur.*.haptic == haptic) {
            var device: [*c]SDL_HIDAPI_HapticDevice = @ptrCast(@alignCast(haptic.*.hwdata));
            _ = &device;
            device.*.driver.*.Close.?(device);
            SDL_CloseJoystick_REAL(device.*.joystick);
            if (cur == haptic_list_head) {
                haptic_list_head = cur.*.next;
            } else {
                last.*.next = cur.*.next;
            }
            SDL_free_REAL(device.*.ctx);
            SDL_free_REAL(@ptrCast(@alignCast(device)));
            SDL_free_REAL(@ptrCast(@alignCast(haptic.*.effects)));
            SDL_free_REAL(@ptrCast(@alignCast(cur)));
            SDL_UnlockMutex_REAL(haptic_list_mutex);
            return;
        }
        last = cur;
        cur = cur.*.next;
    }
    SDL_UnlockMutex_REAL(haptic_list_mutex);
}
pub export fn SDL_HIDAPI_HapticQuit() void {
    @setEvalBranchQuota(100000);
    if (@as(?*anyopaque, @ptrCast(@alignCast(haptic_list_mutex))) != @as(?*anyopaque, null)) {
        SDL_DestroyMutex_REAL(haptic_list_mutex);
        haptic_list_mutex = null;
    }
}
pub export fn SDL_HIDAPI_HapticNewEffect(haptic: [*c]SDL_Haptic, base: [*c]const SDL_HapticEffect) SDL_HapticEffectID {
    @setEvalBranchQuota(100000);
    var device: [*c]SDL_HIDAPI_HapticDevice = @ptrCast(@alignCast(haptic.*.hwdata));
    _ = &device;
    var new_id: SDL_HapticEffectID = device.*.driver.*.CreateEffect.?(device, base);
    _ = &new_id;
    if (new_id >= @as(c_int, 0)) {
        haptic.*.effects[@bitCast(@as(isize, @intCast(new_id)))].effect = base.*;
    }
    return new_id;
}
pub export fn SDL_HIDAPI_HapticUpdateEffect(haptic: [*c]SDL_Haptic, id: SDL_HapticEffectID, data: [*c]const SDL_HapticEffect) bool {
    @setEvalBranchQuota(100000);
    var device: [*c]SDL_HIDAPI_HapticDevice = @ptrCast(@alignCast(haptic.*.hwdata));
    _ = &device;
    return device.*.driver.*.UpdateEffect.?(device, id, data);
}
pub export fn SDL_HIDAPI_HapticRunEffect(haptic: [*c]SDL_Haptic, id: SDL_HapticEffectID, iterations: Uint32) bool {
    @setEvalBranchQuota(100000);
    var device: [*c]SDL_HIDAPI_HapticDevice = @ptrCast(@alignCast(haptic.*.hwdata));
    _ = &device;
    return device.*.driver.*.RunEffect.?(device, id, iterations);
}
pub export fn SDL_HIDAPI_HapticStopEffect(haptic: [*c]SDL_Haptic, id: SDL_HapticEffectID) bool {
    @setEvalBranchQuota(100000);
    var device: [*c]SDL_HIDAPI_HapticDevice = @ptrCast(@alignCast(haptic.*.hwdata));
    _ = &device;
    return device.*.driver.*.StopEffect.?(device, id);
}
pub export fn SDL_HIDAPI_HapticDestroyEffect(haptic: [*c]SDL_Haptic, id: SDL_HapticEffectID) void {
    @setEvalBranchQuota(100000);
    var device: [*c]SDL_HIDAPI_HapticDevice = @ptrCast(@alignCast(haptic.*.hwdata));
    _ = &device;
    device.*.driver.*.DestroyEffect.?(device, id);
}
pub export fn SDL_HIDAPI_HapticGetEffectStatus(haptic: [*c]SDL_Haptic, id: SDL_HapticEffectID) bool {
    @setEvalBranchQuota(100000);
    var device: [*c]SDL_HIDAPI_HapticDevice = @ptrCast(@alignCast(haptic.*.hwdata));
    _ = &device;
    return device.*.driver.*.GetEffectStatus.?(device, id);
}
pub export fn SDL_HIDAPI_HapticSetGain(haptic: [*c]SDL_Haptic, gain: c_int) bool {
    @setEvalBranchQuota(100000);
    var device: [*c]SDL_HIDAPI_HapticDevice = @ptrCast(@alignCast(haptic.*.hwdata));
    _ = &device;
    return device.*.driver.*.SetGain.?(device, gain);
}
pub export fn SDL_HIDAPI_HapticSetAutocenter(haptic: [*c]SDL_Haptic, autocenter: c_int) bool {
    @setEvalBranchQuota(100000);
    var device: [*c]SDL_HIDAPI_HapticDevice = @ptrCast(@alignCast(haptic.*.hwdata));
    _ = &device;
    return device.*.driver.*.SetAutocenter.?(device, autocenter);
}
pub export fn SDL_HIDAPI_HapticPause(haptic: [*c]SDL_Haptic) bool {
    @setEvalBranchQuota(100000);
    var device: [*c]SDL_HIDAPI_HapticDevice = @ptrCast(@alignCast(haptic.*.hwdata));
    _ = &device;
    return device.*.driver.*.Pause.?(device);
}
pub export fn SDL_HIDAPI_HapticResume(haptic: [*c]SDL_Haptic) bool {
    @setEvalBranchQuota(100000);
    var device: [*c]SDL_HIDAPI_HapticDevice = @ptrCast(@alignCast(haptic.*.hwdata));
    _ = &device;
    return device.*.driver.*.Resume.?(device);
}
pub export fn SDL_HIDAPI_HapticStopAll(haptic: [*c]SDL_Haptic) bool {
    @setEvalBranchQuota(100000);
    var device: [*c]SDL_HIDAPI_HapticDevice = @ptrCast(@alignCast(haptic.*.hwdata));
    _ = &device;
    return device.*.driver.*.StopEffects.?(device);
}

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const struct_SDL_JoystickAxisInfo = extern struct {
    initial_value: Sint16 = 0,
    value: Sint16 = 0,
    zero: Sint16 = 0,
    has_initial_value: bool = false,
    has_second_value: bool = false,
    sent_initial_value: bool = false,
    sending_initial_value: bool = false,
};
pub const SDL_JoystickAxisInfo = struct_SDL_JoystickAxisInfo;
pub const struct_SDL_JoystickBallData = extern struct {
    dx: c_int = 0,
    dy: c_int = 0,
};
pub const SDL_JoystickBallData = struct_SDL_JoystickBallData;
pub const struct_SDL_JoystickTouchpadFingerInfo = extern struct {
    down: bool = false,
    x: f32 = 0,
    y: f32 = 0,
    pressure: f32 = 0,
};
pub const SDL_JoystickTouchpadFingerInfo = struct_SDL_JoystickTouchpadFingerInfo;
pub const struct_SDL_JoystickTouchpadInfo = extern struct {
    nfingers: c_int = 0,
    fingers: [*c]SDL_JoystickTouchpadFingerInfo = null,
};
pub const SDL_JoystickTouchpadInfo = struct_SDL_JoystickTouchpadInfo;
pub const struct_SDL_JoystickSensorInfo = extern struct {
    type: SDL_SensorType = @import("std").mem.zeroes(SDL_SensorType),
    enabled: bool = false,
    rate: f32 = 0,
    data: [3]f32 = @import("std").mem.zeroes([3]f32),
};
pub const SDL_JoystickSensorInfo = struct_SDL_JoystickSensorInfo;
pub const struct_SDL_JoystickCapSenseInfo = extern struct {
    type: SDL_GamepadCapSenseType = @import("std").mem.zeroes(SDL_GamepadCapSenseType),
    down: bool = false,
};
pub const SDL_JoystickCapSenseInfo = struct_SDL_JoystickCapSenseInfo;
pub const struct_SDL_InputMapping = extern struct {
    kind: EMappingKind = @import("std").mem.zeroes(EMappingKind),
    target: Uint8 = 0,
    axis_reversed: bool = false,
    half_axis_positive: bool = false,
    half_axis_negative: bool = false,
};
pub const SDL_InputMapping = struct_SDL_InputMapping;
pub const struct_SDL_GamepadMapping = extern struct {
    a: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    b: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    x: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    y: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    back: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    guide: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    start: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    leftstick: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    rightstick: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    leftshoulder: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    rightshoulder: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    dpup: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    dpdown: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    dpleft: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    dpright: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    misc1: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    misc2: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    misc3: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    misc4: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    misc5: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    misc6: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    right_paddle1: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    left_paddle1: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    right_paddle2: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    left_paddle2: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    leftx: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    lefty: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    rightx: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    righty: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    lefttrigger: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    righttrigger: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    touchpad: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
};
pub const SDL_GamepadMapping = struct_SDL_GamepadMapping;
pub const struct_SDL_JoystickDriver = extern struct {
    Init: ?*const fn () callconv(.c) bool = null,
    GetCount: ?*const fn () callconv(.c) c_int = null,
    Detect: ?*const fn () callconv(.c) void = null,
    IsDevicePresent: ?*const fn (vendor_id: Uint16, product_id: Uint16, version: Uint16, name: [*c]const u8) callconv(.c) bool = null,
    GetDeviceName: ?*const fn (device_index: c_int) callconv(.c) [*c]const u8 = null,
    GetDevicePath: ?*const fn (device_index: c_int) callconv(.c) [*c]const u8 = null,
    GetDeviceSteamVirtualGamepadSlot: ?*const fn (device_index: c_int) callconv(.c) c_int = null,
    GetDevicePlayerIndex: ?*const fn (device_index: c_int) callconv(.c) c_int = null,
    SetDevicePlayerIndex: ?*const fn (device_index: c_int, player_index: c_int) callconv(.c) void = null,
    GetDeviceGUID: ?*const fn (device_index: c_int) callconv(.c) SDL_GUID = null,
    GetDeviceInstanceID: ?*const fn (device_index: c_int) callconv(.c) SDL_JoystickID = null,
    Open: ?*const fn (joystick: [*c]SDL_Joystick, device_index: c_int) callconv(.c) bool = null,
    Rumble: ?*const fn (joystick: [*c]SDL_Joystick, low_frequency_rumble: Uint16, high_frequency_rumble: Uint16) callconv(.c) bool = null,
    RumbleTriggers: ?*const fn (joystick: [*c]SDL_Joystick, left_rumble: Uint16, right_rumble: Uint16) callconv(.c) bool = null,
    SetLED: ?*const fn (joystick: [*c]SDL_Joystick, red: Uint8, green: Uint8, blue: Uint8) callconv(.c) bool = null,
    SendEffect: ?*const fn (joystick: [*c]SDL_Joystick, data: ?*const anyopaque, size: c_int) callconv(.c) bool = null,
    SetSensorsEnabled: ?*const fn (joystick: [*c]SDL_Joystick, enabled: bool) callconv(.c) bool = null,
    Update: ?*const fn (joystick: [*c]SDL_Joystick) callconv(.c) void = null,
    Close: ?*const fn (joystick: [*c]SDL_Joystick) callconv(.c) void = null,
    Quit: ?*const fn () callconv(.c) void = null,
    GetGamepadMapping: ?*const fn (device_index: c_int, out: [*c]SDL_GamepadMapping) callconv(.c) bool = null,
};
pub const struct_joystick_hwdata_8 = opaque {};
pub const struct_haptic_hweffect_15 = opaque {};
pub const struct_haptic_effect = extern struct {
    effect: SDL_HapticEffect = @import("std").mem.zeroes(SDL_HapticEffect),
    hweffect: ?*struct_haptic_hweffect_15 = null,
};
pub const struct_haptic_hwdata_16 = opaque {};
pub extern fn SDL_AssertJoysticksLocked() void;
pub const EMappingKind = c_uint;
pub const SDL_JoystickDriver = struct_SDL_JoystickDriver;
pub extern var SDL_HIDAPI_JoystickDriver: SDL_JoystickDriver;
pub const SDL_HIDAPI_HapticDriver = struct_SDL_HIDAPI_HapticDriver;
pub const struct_SDL_HIDAPI_HapticDevice = extern struct {
    haptic: [*c]SDL_Haptic = null,
    joystick: [*c]SDL_Joystick = null,
    driver: [*c]SDL_HIDAPI_HapticDriver = null,
    ctx: ?*anyopaque = null,
};
pub const SDL_HIDAPI_HapticDevice = struct_SDL_HIDAPI_HapticDevice;
pub const struct_SDL_HIDAPI_HapticDriver = extern struct {
    JoystickSupported: ?*const fn (joystick: [*c]SDL_Joystick) callconv(.c) bool = null,
    Open: ?*const fn (joystick: [*c]SDL_Joystick) callconv(.c) ?*anyopaque = null,
    Close: ?*const fn (device: [*c]SDL_HIDAPI_HapticDevice) callconv(.c) void = null,
    NumEffects: ?*const fn (device: [*c]SDL_HIDAPI_HapticDevice) callconv(.c) c_int = null,
    NumEffectsPlaying: ?*const fn (device: [*c]SDL_HIDAPI_HapticDevice) callconv(.c) c_int = null,
    GetFeatures: ?*const fn (device: [*c]SDL_HIDAPI_HapticDevice) callconv(.c) Uint32 = null,
    NumAxes: ?*const fn (device: [*c]SDL_HIDAPI_HapticDevice) callconv(.c) c_int = null,
    CreateEffect: ?*const fn (device: [*c]SDL_HIDAPI_HapticDevice, data: [*c]const SDL_HapticEffect) callconv(.c) SDL_HapticEffectID = null,
    UpdateEffect: ?*const fn (device: [*c]SDL_HIDAPI_HapticDevice, id: SDL_HapticEffectID, data: [*c]const SDL_HapticEffect) callconv(.c) bool = null,
    RunEffect: ?*const fn (device: [*c]SDL_HIDAPI_HapticDevice, id: SDL_HapticEffectID, iterations: Uint32) callconv(.c) bool = null,
    StopEffect: ?*const fn (device: [*c]SDL_HIDAPI_HapticDevice, id: SDL_HapticEffectID) callconv(.c) bool = null,
    DestroyEffect: ?*const fn (device: [*c]SDL_HIDAPI_HapticDevice, id: SDL_HapticEffectID) callconv(.c) void = null,
    GetEffectStatus: ?*const fn (device: [*c]SDL_HIDAPI_HapticDevice, id: SDL_HapticEffectID) callconv(.c) bool = null,
    SetGain: ?*const fn (device: [*c]SDL_HIDAPI_HapticDevice, gain: c_int) callconv(.c) bool = null,
    SetAutocenter: ?*const fn (device: [*c]SDL_HIDAPI_HapticDevice, autocenter: c_int) callconv(.c) bool = null,
    Pause: ?*const fn (device: [*c]SDL_HIDAPI_HapticDevice) callconv(.c) bool = null,
    Resume: ?*const fn (device: [*c]SDL_HIDAPI_HapticDevice) callconv(.c) bool = null,
    StopEffects: ?*const fn (device: [*c]SDL_HIDAPI_HapticDevice) callconv(.c) bool = null,
};
pub extern var SDL_HIDAPI_HapticDriverLg4ff: SDL_HIDAPI_HapticDriver;
pub const struct_haptic_list_node = extern struct {
    haptic: [*c]SDL_Haptic = null,
    next: [*c]struct_haptic_list_node = null,
};
pub const haptic_list_node = struct_haptic_list_node;
pub var haptic_list_head: [*c]haptic_list_node = null;
pub var haptic_list_mutex: ?*SDL_Mutex = null;
pub var drivers: [2][*c]SDL_HIDAPI_HapticDriver = [2][*c]SDL_HIDAPI_HapticDriver{
    &SDL_HIDAPI_HapticDriverLg4ff,
    null,
};
