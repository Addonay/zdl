// /*
//   Simple DirectMedia Layer
//   Copyright (C) 1997-2026 Sam Lantinga <slouken@libsdl.org>
//   Copyright (C) 2020 Collabora Ltd.
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
pub const __helpers = @import("std").zig.c_translation.helpers;
pub const div_t = extern struct {
    quot: c_int = 0,
    rem: c_int = 0,
};
pub extern fn div(__numer: c_int, __denom: c_int) div_t;
pub const SDL_UDEV_DEVICE_MOUSE: c_int = 1;
pub const SDL_UDEV_DEVICE_KEYBOARD: c_int = 2;
pub const SDL_UDEV_DEVICE_JOYSTICK: c_int = 4;
pub const SDL_UDEV_DEVICE_TOUCHSCREEN: c_int = 16;
pub const SDL_UDEV_DEVICE_ACCELEROMETER: c_int = 32;
pub const SDL_UDEV_DEVICE_TOUCHPAD: c_int = 64;
pub const SDL_UDEV_DEVICE_HAS_KEYS: c_int = 128;
pub export fn SDL_EVDEV_GuessDeviceClass(bitmask_props: [*c]const c_ulong, bitmask_ev: [*c]const c_ulong, bitmask_abs: [*c]const c_ulong, bitmask_key: [*c]const c_ulong, bitmask_rel: [*c]const c_ulong) c_int {
    @setEvalBranchQuota(100000);
    const struct_range = extern struct {
        start: c_uint = 0,
        end: c_uint = 0,
    };
    _ = &struct_range;
    const static_local_high_key_blocks = struct {
        const high_key_blocks: [2]struct_range = [2]struct_range{
            struct_range{
                .start = KEY_OK,
                .end = BTN_DPAD_UP,
            },
            struct_range{
                .start = KEY_ALS_TOGGLE,
                .end = BTN_TRIGGER_HAPPY,
            },
        };
    };
    _ = &static_local_high_key_blocks;
    var devclass: c_int = 0;
    _ = &devclass;
    var keyboard_mask: c_ulong = undefined;
    _ = &keyboard_mask;
    if (((bitmask_props[@as(c_ulong, @bitCast(@as(c_long, INPUT_PROP_ACCELEROMETER))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, INPUT_PROP_ACCELEROMETER))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0) {
        return SDL_UDEV_DEVICE_ACCELEROMETER;
    }
    if (((bitmask_props[@as(c_ulong, @bitCast(@as(c_long, INPUT_PROP_POINTING_STICK))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, INPUT_PROP_POINTING_STICK))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0) {
        return SDL_UDEV_DEVICE_MOUSE;
    }
    if ((@as(c_ulong, @bitCast(@as(c_long, @intFromBool((((bitmask_props[@as(c_ulong, @bitCast(@as(c_long, INPUT_PROP_TOPBUTTONPAD))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, INPUT_PROP_TOPBUTTONPAD))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0) or (((bitmask_props[@as(c_ulong, @bitCast(@as(c_long, INPUT_PROP_BUTTONPAD))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, INPUT_PROP_BUTTONPAD))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0))))) != 0) or (((bitmask_props[@as(c_ulong, @bitCast(@as(c_long, INPUT_PROP_SEMI_MT))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, INPUT_PROP_SEMI_MT))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0)) {
        return SDL_UDEV_DEVICE_TOUCHPAD;
    }
    if (((@as(c_ulong, @bitCast(@as(c_long, @intFromBool((@as(c_ulong, @bitCast(@as(c_long, @intFromBool((((bitmask_ev[@as(c_ulong, @bitCast(@as(c_long, EV_ABS))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, EV_ABS))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0) and (((bitmask_abs[@as(c_ulong, @bitCast(@as(c_long, ABS_X))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, ABS_X))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0))))) != 0) and (((bitmask_abs[@as(c_ulong, @bitCast(@as(c_long, ABS_Y))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, ABS_Y))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0))))) != 0) and (((bitmask_abs[@as(c_ulong, @bitCast(@as(c_long, ABS_Z))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, ABS_Z))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0)) and !(((bitmask_ev[@as(c_ulong, @bitCast(@as(c_long, EV_KEY))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, EV_KEY))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0)) {
        return SDL_UDEV_DEVICE_ACCELEROMETER;
    }
    if (((@as(c_ulong, @bitCast(@as(c_long, @intFromBool((@as(c_ulong, @bitCast(@as(c_long, @intFromBool((((bitmask_ev[@as(c_ulong, @bitCast(@as(c_long, EV_ABS))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, EV_ABS))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0) and (((bitmask_abs[@as(c_ulong, @bitCast(@as(c_long, ABS_RX))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, ABS_RX))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0))))) != 0) and (((bitmask_abs[@as(c_ulong, @bitCast(@as(c_long, ABS_RY))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, ABS_RY))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0))))) != 0) and (((bitmask_abs[@as(c_ulong, @bitCast(@as(c_long, ABS_RZ))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, ABS_RZ))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0)) and !(((bitmask_ev[@as(c_ulong, @bitCast(@as(c_long, EV_KEY))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, EV_KEY))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0)) {
        return SDL_UDEV_DEVICE_ACCELEROMETER;
    }
    if ((@as(c_ulong, @bitCast(@as(c_long, @intFromBool((((bitmask_ev[@as(c_ulong, @bitCast(@as(c_long, EV_ABS))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, EV_ABS))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0) and (((bitmask_abs[@as(c_ulong, @bitCast(@as(c_long, ABS_X))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, ABS_X))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0))))) != 0) and (((bitmask_abs[@as(c_ulong, @bitCast(@as(c_long, ABS_Y))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, ABS_Y))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0)) {
        if ((((bitmask_key[@as(c_ulong, @bitCast(@as(c_long, BTN_STYLUS))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, BTN_STYLUS))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0) or (((bitmask_key[@as(c_ulong, @bitCast(@as(c_long, BTN_TOOL_PEN))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, BTN_TOOL_PEN))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0)) {} else if ((((bitmask_key[@as(c_ulong, @bitCast(@as(c_long, BTN_TOOL_FINGER))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, BTN_TOOL_FINGER))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0) and (@as(c_ulong, @bitCast(@as(c_long, @intFromBool(!(((bitmask_key[@as(c_ulong, @bitCast(@as(c_long, BTN_TOOL_PEN))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, BTN_TOOL_PEN))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0))))) != 0)) {
            devclass |= SDL_UDEV_DEVICE_TOUCHPAD;
        } else if (((bitmask_key[@as(c_ulong, @bitCast(@as(c_long, BTN_MOUSE))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, BTN_MOUSE))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0) {
            devclass |= SDL_UDEV_DEVICE_MOUSE;
        } else if (((bitmask_key[@as(c_ulong, @bitCast(@as(c_long, BTN_TOUCH))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, BTN_TOUCH))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0) {
            devclass |= SDL_UDEV_DEVICE_TOUCHSCREEN;
        }
        if ((@as(c_ulong, @bitCast(@as(c_long, @intFromBool((@as(c_ulong, @bitCast(@as(c_long, @intFromBool((@as(c_ulong, @bitCast(@as(c_long, @intFromBool((@as(c_ulong, @bitCast(@as(c_long, @intFromBool((@as(c_ulong, @bitCast(@as(c_long, @intFromBool((@as(c_ulong, @bitCast(@as(c_long, @intFromBool((@as(c_ulong, @bitCast(@as(c_long, @intFromBool((@as(c_ulong, @bitCast(@as(c_long, @intFromBool((@as(c_ulong, @bitCast(@as(c_long, @intFromBool((((bitmask_key[@as(c_ulong, @bitCast(@as(c_long, BTN_TRIGGER))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, BTN_TRIGGER))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0) or (((bitmask_key[@as(c_ulong, @bitCast(@as(c_long, BTN_SOUTH))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, BTN_SOUTH))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0))))) != 0) or (((bitmask_key[@as(c_ulong, @bitCast(@as(c_long, BTN_1))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, BTN_1))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0))))) != 0) or (((bitmask_abs[@as(c_ulong, @bitCast(@as(c_long, ABS_RX))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, ABS_RX))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0))))) != 0) or (((bitmask_abs[@as(c_ulong, @bitCast(@as(c_long, ABS_RY))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, ABS_RY))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0))))) != 0) or (((bitmask_abs[@as(c_ulong, @bitCast(@as(c_long, ABS_RZ))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, ABS_RZ))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0))))) != 0) or (((bitmask_abs[@as(c_ulong, @bitCast(@as(c_long, ABS_THROTTLE))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, ABS_THROTTLE))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0))))) != 0) or (((bitmask_abs[@as(c_ulong, @bitCast(@as(c_long, ABS_RUDDER))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, ABS_RUDDER))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0))))) != 0) or (((bitmask_abs[@as(c_ulong, @bitCast(@as(c_long, ABS_WHEEL))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, ABS_WHEEL))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0))))) != 0) or (((bitmask_abs[@as(c_ulong, @bitCast(@as(c_long, ABS_GAS))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, ABS_GAS))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0))))) != 0) or (((bitmask_abs[@as(c_ulong, @bitCast(@as(c_long, ABS_BRAKE))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, ABS_BRAKE))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0)) {
            devclass |= SDL_UDEV_DEVICE_JOYSTICK;
        }
    }
    if ((@as(c_ulong, @bitCast(@as(c_long, @intFromBool((@as(c_ulong, @bitCast(@as(c_long, @intFromBool((((bitmask_ev[@as(c_ulong, @bitCast(@as(c_long, EV_REL))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, EV_REL))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0) and (((bitmask_rel[@as(c_ulong, @bitCast(@as(c_long, REL_X))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, REL_X))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0))))) != 0) and (((bitmask_rel[@as(c_ulong, @bitCast(@as(c_long, REL_Y))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, REL_Y))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0))))) != 0) and (((bitmask_key[@as(c_ulong, @bitCast(@as(c_long, BTN_MOUSE))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, BTN_MOUSE))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0)) {
        devclass |= SDL_UDEV_DEVICE_MOUSE;
    }
    if (((bitmask_ev[@as(c_ulong, @bitCast(@as(c_long, EV_KEY))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, EV_KEY))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0) {
        var i: c_uint = undefined;
        _ = &i;
        var found: c_ulong = 0;
        _ = &found;
        {
            i = 0;
            while (@as(c_ulong, i) < (@as(c_ulong, BTN_MISC) / (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) : (i +%= 1) {
                found |= bitmask_key[i];
            }
        }
        if (!(found != 0)) {
            var block: c_uint = undefined;
            _ = &block;
            {
                block = 0;
                while (@as(c_ulong, block) < (@sizeOf(@TypeOf(static_local_high_key_blocks.high_key_blocks)) / @sizeOf(struct_range))) : (block +%= 1) {
                    {
                        i = static_local_high_key_blocks.high_key_blocks[block].start;
                        while (i < static_local_high_key_blocks.high_key_blocks[block].end) : (i +%= 1) {
                            if (((bitmask_key[@as(c_ulong, i) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, i) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0) {
                                found = 1;
                                break;
                            }
                        }
                    }
                }
            }
        }
        if (found > @as(c_ulong, 0)) {
            devclass |= SDL_UDEV_DEVICE_HAS_KEYS;
        }
    }
    keyboard_mask = 4294967294;
    if ((bitmask_key[@as(c_int, 0)] & keyboard_mask) == keyboard_mask) {
        devclass |= SDL_UDEV_DEVICE_KEYBOARD;
    }
    return devclass;
}

pub const INPUT_PROP_BUTTONPAD = @as(c_int, 0x02);
pub const INPUT_PROP_SEMI_MT = @as(c_int, 0x03);
pub const INPUT_PROP_TOPBUTTONPAD = @as(c_int, 0x04);
pub const INPUT_PROP_POINTING_STICK = @as(c_int, 0x05);
pub const INPUT_PROP_ACCELEROMETER = @as(c_int, 0x06);
pub const EV_KEY = @as(c_int, 0x01);
pub const EV_REL = @as(c_int, 0x02);
pub const EV_ABS = @as(c_int, 0x03);
pub const BTN_MISC = @as(c_int, 0x100);
pub const BTN_1 = @as(c_int, 0x101);
pub const BTN_MOUSE = @as(c_int, 0x110);
pub const BTN_TRIGGER = @as(c_int, 0x120);
pub const BTN_SOUTH = @as(c_int, 0x130);
pub const BTN_TOOL_PEN = @as(c_int, 0x140);
pub const BTN_TOOL_FINGER = @as(c_int, 0x145);
pub const BTN_TOUCH = @as(c_int, 0x14a);
pub const BTN_STYLUS = @as(c_int, 0x14b);
pub const KEY_OK = @as(c_int, 0x160);
pub const BTN_DPAD_UP = @as(c_int, 0x220);
pub const KEY_ALS_TOGGLE = @as(c_int, 0x230);
pub const BTN_TRIGGER_HAPPY = @as(c_int, 0x2c0);
pub const REL_X = @as(c_int, 0x00);
pub const REL_Y = @as(c_int, 0x01);
pub const ABS_X = @as(c_int, 0x00);
pub const ABS_Y = @as(c_int, 0x01);
pub const ABS_Z = @as(c_int, 0x02);
pub const ABS_RX = @as(c_int, 0x03);
pub const ABS_RY = @as(c_int, 0x04);
pub const ABS_RZ = @as(c_int, 0x05);
pub const ABS_THROTTLE = @as(c_int, 0x06);
pub const ABS_RUDDER = @as(c_int, 0x07);
pub const ABS_WHEEL = @as(c_int, 0x08);
pub const ABS_GAS = @as(c_int, 0x09);
pub const ABS_BRAKE = @as(c_int, 0x0a);
pub const BITS_PER_LONG = __helpers.sizeof(c_ulong) * @as(c_int, 8);
pub inline fn NBITS(x: anytype) @TypeOf(__helpers.div(x - @as(c_int, 1), BITS_PER_LONG) + @as(c_int, 1)) {
    @setEvalBranchQuota(100000);
    _ = &x;
    return __helpers.div(x - @as(c_int, 1), BITS_PER_LONG) + @as(c_int, 1);
}
