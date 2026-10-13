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
pub const SDL_SCANCODE_TAB: c_int = 43;
pub const SDL_SCANCODE_KP_1: c_int = 89;
pub const SDL_SCANCODE_KP_2: c_int = 90;
pub const SDL_SCANCODE_KP_3: c_int = 91;
pub const SDL_SCANCODE_KP_4: c_int = 92;
pub const SDL_SCANCODE_KP_5: c_int = 93;
pub const SDL_SCANCODE_KP_6: c_int = 94;
pub const SDL_SCANCODE_KP_7: c_int = 95;
pub const SDL_SCANCODE_KP_8: c_int = 96;
pub const SDL_SCANCODE_KP_9: c_int = 97;
pub const SDL_SCANCODE_KP_0: c_int = 98;
pub const SDL_SCANCODE_KP_PERIOD: c_int = 99;
pub const SDL_SCANCODE_APPLICATION: c_int = 101;
pub const SDL_SCANCODE_F13: c_int = 104;
pub const SDL_SCANCODE_F14: c_int = 105;
pub const SDL_SCANCODE_F15: c_int = 106;
pub const SDL_SCANCODE_F16: c_int = 107;
pub const SDL_SCANCODE_F17: c_int = 108;
pub const SDL_SCANCODE_F18: c_int = 109;
pub const SDL_SCANCODE_EXECUTE: c_int = 116;
pub const SDL_SCANCODE_MENU: c_int = 118;
pub const SDL_SCANCODE_LGUI: c_int = 227;
pub const SDL_SCANCODE_RALT: c_int = 230;
pub const SDL_SCANCODE_RGUI: c_int = 231;
pub const SDL_SCANCODE_MODE: c_int = 257;
pub const enum_SDL_Scancode = c_uint;
pub const SDL_Scancode = enum_SDL_Scancode;
pub const SDL_SCANCODE_TABLE_LINUX: c_int = 1;
pub const SDL_ScancodeTable = c_uint;
pub extern fn SDL_GetScancodeFromTable(table: SDL_ScancodeTable, keycode: c_int) SDL_Scancode;
const struct_unnamed_14 = extern struct {
    keysym: Uint32 = 0,
    scancode: SDL_Scancode = @import("std").mem.zeroes(SDL_Scancode),
};
pub const KeySymToSDLScancode: [25]struct_unnamed_14 = [25]struct_unnamed_14{
    struct_unnamed_14{
        .keysym = 65436,
        .scancode = SDL_SCANCODE_KP_1,
    },
    struct_unnamed_14{
        .keysym = 65433,
        .scancode = SDL_SCANCODE_KP_2,
    },
    struct_unnamed_14{
        .keysym = 65435,
        .scancode = SDL_SCANCODE_KP_3,
    },
    struct_unnamed_14{
        .keysym = 65430,
        .scancode = SDL_SCANCODE_KP_4,
    },
    struct_unnamed_14{
        .keysym = 65437,
        .scancode = SDL_SCANCODE_KP_5,
    },
    struct_unnamed_14{
        .keysym = 65432,
        .scancode = SDL_SCANCODE_KP_6,
    },
    struct_unnamed_14{
        .keysym = 65429,
        .scancode = SDL_SCANCODE_KP_7,
    },
    struct_unnamed_14{
        .keysym = 65431,
        .scancode = SDL_SCANCODE_KP_8,
    },
    struct_unnamed_14{
        .keysym = 65434,
        .scancode = SDL_SCANCODE_KP_9,
    },
    struct_unnamed_14{
        .keysym = 65438,
        .scancode = SDL_SCANCODE_KP_0,
    },
    struct_unnamed_14{
        .keysym = 65439,
        .scancode = SDL_SCANCODE_KP_PERIOD,
    },
    struct_unnamed_14{
        .keysym = 65378,
        .scancode = SDL_SCANCODE_EXECUTE,
    },
    struct_unnamed_14{
        .keysym = 65518,
        .scancode = SDL_SCANCODE_APPLICATION,
    },
    struct_unnamed_14{
        .keysym = 65027,
        .scancode = SDL_SCANCODE_RALT,
    },
    struct_unnamed_14{
        .keysym = 65056,
        .scancode = SDL_SCANCODE_TAB,
    },
    struct_unnamed_14{
        .keysym = 65515,
        .scancode = SDL_SCANCODE_LGUI,
    },
    struct_unnamed_14{
        .keysym = 65516,
        .scancode = SDL_SCANCODE_RGUI,
    },
    struct_unnamed_14{
        .keysym = 65406,
        .scancode = SDL_SCANCODE_MODE,
    },
    struct_unnamed_14{
        .keysym = 269025125,
        .scancode = SDL_SCANCODE_MENU,
    },
    struct_unnamed_14{
        .keysym = 269025153,
        .scancode = SDL_SCANCODE_F13,
    },
    struct_unnamed_14{
        .keysym = 269025093,
        .scancode = SDL_SCANCODE_F14,
    },
    struct_unnamed_14{
        .keysym = 269025094,
        .scancode = SDL_SCANCODE_F15,
    },
    struct_unnamed_14{
        .keysym = 269025095,
        .scancode = SDL_SCANCODE_F16,
    },
    struct_unnamed_14{
        .keysym = 269025096,
        .scancode = SDL_SCANCODE_F17,
    },
    struct_unnamed_14{
        .keysym = 269025097,
        .scancode = SDL_SCANCODE_F18,
    },
};
pub const LinuxKeycodeKeysyms: [248]Uint32 = [248]Uint32{
    0,
    65307,
    49,
    50,
    51,
    52,
    53,
    54,
    55,
    56,
    57,
    48,
    45,
    61,
    65288,
    65289,
    113,
    119,
    101,
    114,
    116,
    121,
    117,
    105,
    111,
    112,
    91,
    93,
    65293,
    65507,
    97,
    115,
    100,
    102,
    103,
    104,
    106,
    107,
    108,
    59,
    39,
    96,
    65505,
    92,
    122,
    120,
    99,
    118,
    98,
    110,
    109,
    44,
    46,
    47,
    65506,
    65450,
    65513,
    32,
    65509,
    65470,
    65471,
    65472,
    65473,
    65474,
    65475,
    65476,
    65477,
    65478,
    65479,
    65407,
    65300,
    65463,
    65464,
    65465,
    65453,
    65460,
    65461,
    65462,
    65451,
    65457,
    65458,
    65459,
    65456,
    65454,
    0,
    0,
    60,
    65480,
    65481,
    0,
    65318,
    65317,
    65315,
    65319,
    65314,
    0,
    65421,
    65508,
    65455,
    65301,
    65514,
    65290,
    65360,
    65362,
    65365,
    65361,
    65363,
    65367,
    65364,
    65366,
    65379,
    65535,
    0,
    269025042,
    269025041,
    269025043,
    269025066,
    65469,
    177,
    65299,
    269025098,
    65452,
    65329,
    65332,
    0,
    65511,
    65512,
    65383,
    0,
    65382,
    268828528,
    65381,
    268828529,
    269025111,
    269025131,
    269025133,
    65384,
    269025112,
    65386,
    65383,
    269025053,
    0,
    269025071,
    269025067,
    269025117,
    269025147,
    0,
    269025162,
    269025089,
    269025090,
    269025070,
    269025114,
    269025069,
    269025140,
    269025151,
    269025049,
    269025072,
    269025075,
    269025062,
    269025063,
    0,
    269025068,
    269025068,
    269025047,
    269025044,
    269025046,
    269025045,
    269025052,
    269025086,
    269025134,
    0,
    269025153,
    269025048,
    269025139,
    269025110,
    0,
    0,
    269025144,
    269025145,
    0,
    0,
    269025128,
    65382,
    65482,
    65483,
    65484,
    65485,
    65486,
    65487,
    65488,
    65489,
    65490,
    65491,
    65492,
    65493,
    0,
    0,
    0,
    0,
    0,
    269025044,
    269025073,
    269025091,
    269025092,
    269025099,
    269025191,
    269025110,
    269025044,
    269025175,
    0,
    65377,
    0,
    269025167,
    269025206,
    0,
    269025049,
    269025166,
    269025051,
    269025119,
    269025084,
    269025118,
    269025078,
    0,
    65385,
    269025027,
    269025026,
    269025074,
    269025113,
    269025028,
    269025030,
    269025029,
    269025147,
    269025138,
    269025168,
    269025143,
    269025115,
    269025171,
    269025172,
    269025173,
    269025174,
    0,
    269024802,
    269024803,
    269025031,
    268964084,
    268964085,
    269025204,
    269025205,
};
const struct_unnamed_15 = extern struct {
    keysym: Uint32 = 0,
    linux_keycode: c_int = 0,
};
pub const ExtendedLinuxKeycodeKeysyms: [55]struct_unnamed_15 = [55]struct_unnamed_15{
    struct_unnamed_15{
        .keysym = 269025068,
        .linux_keycode = 162,
    },
    struct_unnamed_15{
        .keysym = 269025128,
        .linux_keycode = 181,
    },
    struct_unnamed_15{
        .keysym = 65382,
        .linux_keycode = 182,
    },
    struct_unnamed_15{
        .keysym = 269025099,
        .linux_keycode = 204,
    },
    struct_unnamed_15{
        .keysym = 269025113,
        .linux_keycode = 227,
    },
    struct_unnamed_15{
        .keysym = 269025028,
        .linux_keycode = 228,
    },
    struct_unnamed_15{
        .keysym = 269025030,
        .linux_keycode = 229,
    },
    struct_unnamed_15{
        .keysym = 269025029,
        .linux_keycode = 230,
    },
    struct_unnamed_15{
        .keysym = 269025147,
        .linux_keycode = 231,
    },
    struct_unnamed_15{
        .keysym = 269025138,
        .linux_keycode = 232,
    },
    struct_unnamed_15{
        .keysym = 269025168,
        .linux_keycode = 233,
    },
    struct_unnamed_15{
        .keysym = 269025143,
        .linux_keycode = 234,
    },
    struct_unnamed_15{
        .keysym = 269025115,
        .linux_keycode = 235,
    },
    struct_unnamed_15{
        .keysym = 269025171,
        .linux_keycode = 236,
    },
    struct_unnamed_15{
        .keysym = 269025172,
        .linux_keycode = 237,
    },
    struct_unnamed_15{
        .keysym = 269025173,
        .linux_keycode = 238,
    },
    struct_unnamed_15{
        .keysym = 269025174,
        .linux_keycode = 239,
    },
    struct_unnamed_15{
        .keysym = 269024802,
        .linux_keycode = 241,
    },
    struct_unnamed_15{
        .keysym = 269024803,
        .linux_keycode = 242,
    },
    struct_unnamed_15{
        .keysym = 269025031,
        .linux_keycode = 243,
    },
    struct_unnamed_15{
        .keysym = 269025204,
        .linux_keycode = 246,
    },
    struct_unnamed_15{
        .keysym = 269025205,
        .linux_keycode = 247,
    },
    struct_unnamed_15{
        .keysym = 269025202,
        .linux_keycode = 248,
    },
    struct_unnamed_15{
        .keysym = 269025180,
        .linux_keycode = 371,
    },
    struct_unnamed_15{
        .keysym = 269025208,
        .linux_keycode = 372,
    },
    struct_unnamed_15{
        .keysym = 269025159,
        .linux_keycode = 393,
    },
    struct_unnamed_15{
        .keysym = 269025056,
        .linux_keycode = 397,
    },
    struct_unnamed_15{
        .keysym = 269025177,
        .linux_keycode = 410,
    },
    struct_unnamed_15{
        .keysym = 269025118,
        .linux_keycode = 417,
    },
    struct_unnamed_15{
        .keysym = 269025163,
        .linux_keycode = 418,
    },
    struct_unnamed_15{
        .keysym = 269025164,
        .linux_keycode = 419,
    },
    struct_unnamed_15{
        .keysym = 269025161,
        .linux_keycode = 421,
    },
    struct_unnamed_15{
        .keysym = 269025116,
        .linux_keycode = 423,
    },
    struct_unnamed_15{
        .keysym = 269025129,
        .linux_keycode = 427,
    },
    struct_unnamed_15{
        .keysym = 269025166,
        .linux_keycode = 430,
    },
    struct_unnamed_15{
        .keysym = 269025121,
        .linux_keycode = 433,
    },
    struct_unnamed_15{
        .keysym = 36,
        .linux_keycode = 434,
    },
    struct_unnamed_15{
        .keysym = 8364,
        .linux_keycode = 435,
    },
    struct_unnamed_15{
        .keysym = 269025181,
        .linux_keycode = 436,
    },
    struct_unnamed_15{
        .keysym = 269025182,
        .linux_keycode = 437,
    },
    struct_unnamed_15{
        .keysym = 65521,
        .linux_keycode = 497,
    },
    struct_unnamed_15{
        .keysym = 65522,
        .linux_keycode = 498,
    },
    struct_unnamed_15{
        .keysym = 65523,
        .linux_keycode = 499,
    },
    struct_unnamed_15{
        .keysym = 65524,
        .linux_keycode = 500,
    },
    struct_unnamed_15{
        .keysym = 65525,
        .linux_keycode = 501,
    },
    struct_unnamed_15{
        .keysym = 65526,
        .linux_keycode = 502,
    },
    struct_unnamed_15{
        .keysym = 65527,
        .linux_keycode = 503,
    },
    struct_unnamed_15{
        .keysym = 65528,
        .linux_keycode = 504,
    },
    struct_unnamed_15{
        .keysym = 65529,
        .linux_keycode = 505,
    },
    struct_unnamed_15{
        .keysym = 65521,
        .linux_keycode = 506,
    },
    struct_unnamed_15{
        .keysym = 269025193,
        .linux_keycode = 530,
    },
    struct_unnamed_15{
        .keysym = 269025200,
        .linux_keycode = 531,
    },
    struct_unnamed_15{
        .keysym = 269025201,
        .linux_keycode = 532,
    },
    struct_unnamed_15{
        .keysym = 269025207,
        .linux_keycode = 561,
    },
    struct_unnamed_15{
        .keysym = 65032,
        .linux_keycode = 584,
    },
};
pub export fn SDL_GetScancodeFromKeySym(arg_keysym: Uint32, keycode: Uint32) SDL_Scancode {
    @setEvalBranchQuota(100000);
    var keysym = arg_keysym;
    _ = &keysym;
    var i: c_int = undefined;
    _ = &i;
    var linux_keycode: Uint32 = 0;
    _ = &linux_keycode;
    {
        i = 0;
        while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(KeySymToSDLScancode)) / @sizeOf(@TypeOf(KeySymToSDLScancode[@as(c_int, 0)])))) : (i += 1) {
            if (keysym == KeySymToSDLScancode[@bitCast(@as(isize, @intCast(i)))].keysym) {
                return KeySymToSDLScancode[@bitCast(@as(isize, @intCast(i)))].scancode;
            }
        }
    }
    if ((keysym >= @as(Uint32, 65)) and (keysym <= @as(Uint32, 90))) {
        keysym +%= 32;
    } else if ((keysym >= @as(Uint32, 268963840)) and (keysym <= @as(Uint32, 268967935))) {
        linux_keycode = keysym -% @as(Uint32, 268963840);
    }
    if (!(linux_keycode != 0)) {
        i = @bitCast(@as(c_uint, @truncate(keycode -% @as(Uint32, 8))));
        if (((i >= @as(c_int, 0)) and (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(LinuxKeycodeKeysyms)) / @sizeOf(@TypeOf(LinuxKeycodeKeysyms[@as(c_int, 0)]))))) and (keysym == LinuxKeycodeKeysyms[@bitCast(@as(isize, @intCast(i)))])) {
            linux_keycode = @bitCast(@as(c_int, i));
        } else {
            {
                i = 0;
                while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(LinuxKeycodeKeysyms)) / @sizeOf(@TypeOf(LinuxKeycodeKeysyms[@as(c_int, 0)])))) : (i += 1) {
                    if (keysym == LinuxKeycodeKeysyms[@bitCast(@as(isize, @intCast(i)))]) {
                        linux_keycode = @bitCast(@as(c_int, i));
                        break;
                    }
                }
            }
        }
    }
    if (!(linux_keycode != 0)) {
        {
            i = 0;
            while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(ExtendedLinuxKeycodeKeysyms)) / @sizeOf(@TypeOf(ExtendedLinuxKeycodeKeysyms[@as(c_int, 0)])))) : (i += 1) {
                if (keysym == ExtendedLinuxKeycodeKeysyms[@bitCast(@as(isize, @intCast(i)))].keysym) {
                    linux_keycode = @bitCast(@as(c_int, ExtendedLinuxKeycodeKeysyms[@bitCast(@as(isize, @intCast(i)))].linux_keycode));
                    break;
                }
            }
        }
    }
    return SDL_GetScancodeFromTable(SDL_SCANCODE_TABLE_LINUX, @bitCast(@as(c_uint, @truncate(linux_keycode))));
}

