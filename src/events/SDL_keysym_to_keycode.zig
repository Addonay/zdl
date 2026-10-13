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
pub const __helpers = @import("std").zig.c_translation.helpers;
pub const Uint16 = u16;
pub const Uint32 = u32;
pub const SDL_SCANCODE_UNKNOWN: c_int = 0;
pub const enum_SDL_Scancode = c_uint;
pub const SDL_Scancode = enum_SDL_Scancode;
pub const SDL_Keycode = Uint32;
pub const SDL_Keymod = Uint16;
pub const struct_SDL_Keymap = opaque {
};
pub const SDL_Keymap = struct_SDL_Keymap;
pub extern fn SDL_GetKeymapKeycode(keymap: ?*SDL_Keymap, scancode: SDL_Scancode, modstate: SDL_Keymod) SDL_Keycode;
pub extern fn SDL_GetScancodeFromKeySym(keysym: Uint32, keycode: Uint32) SDL_Scancode;
pub extern fn SDL_KeySymToUcs4(keysym: Uint32) c_uint;
pub const dead_key_symbols_fe50_fe6f: [32]Uint16 = [32]Uint16{
    96,
    180,
    94,
    8128,
    175,
    728,
    729,
    168,
    730,
    733,
    711,
    184,
    731,
    890,
    12443,
    12444,
    803,
    777,
    795,
    47,
    700,
    701,
    757,
    755,
    95,
    94,
    759,
    814,
    804,
    785,
    806,
    164,
};
pub const dead_key_symbols_fe80_fe93: [20]Uint16 = [20]Uint16{
    97,
    65,
    101,
    69,
    105,
    73,
    111,
    79,
    117,
    85,
    601,
    399,
    0,
    1569,
    0,
    0,
    95,
    712,
    716,
    47,
};
const struct_unnamed_14 = extern struct {
    keysym: Uint32 = 0,
    keycode: SDL_Keycode = 0,
};
pub const keysym_to_keycode_table: [8]struct_unnamed_14 = [8]struct_unnamed_14{
    struct_unnamed_14{
        .keysym = 65027,
        .keycode = SDLK_MODE,
    },
    struct_unnamed_14{
        .keysym = 65041,
        .keycode = SDLK_LEVEL5_SHIFT,
    },
    struct_unnamed_14{
        .keysym = 65056,
        .keycode = SDLK_LEFT_TAB,
    },
    struct_unnamed_14{
        .keysym = 65312,
        .keycode = SDLK_MULTI_KEY_COMPOSE,
    },
    struct_unnamed_14{
        .keysym = 65511,
        .keycode = SDLK_LMETA,
    },
    struct_unnamed_14{
        .keysym = 65512,
        .keycode = SDLK_RMETA,
    },
    struct_unnamed_14{
        .keysym = 65517,
        .keycode = SDLK_LHYPER,
    },
    struct_unnamed_14{
        .keysym = 65518,
        .keycode = SDLK_RHYPER,
    },
};
pub export fn SDL_GetKeyCodeFromKeySym(arg_keysym: Uint32, keycode: Uint32, modifiers: SDL_Keymod) SDL_Keycode {
    @setEvalBranchQuota(100000);
    var keysym = arg_keysym;
    _ = &keysym;
    var sdl_keycode: SDL_Keycode = SDL_KeySymToUcs4(keysym);
    _ = &sdl_keycode;
    if (!(sdl_keycode != 0)) {
        if ((keysym >= @as(Uint32, 65104)) and (keysym <= @as(Uint32, 65135))) {
            sdl_keycode = dead_key_symbols_fe50_fe6f[keysym -% @as(Uint32, 65104)];
        } else if ((keysym >= @as(Uint32, 65152)) and (keysym <= @as(Uint32, 65171))) {
            sdl_keycode = dead_key_symbols_fe80_fe93[keysym -% @as(Uint32, 65152)];
        }
    }
    if (!(sdl_keycode != 0)) {
        {
            var i: c_int = 0;
            _ = &i;
            while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(keysym_to_keycode_table)) / @sizeOf(@TypeOf(keysym_to_keycode_table[@as(c_int, 0)])))) : (i += 1) {
                if (keysym == keysym_to_keycode_table[@bitCast(@as(isize, @intCast(i)))].keysym) {
                    return keysym_to_keycode_table[@bitCast(@as(isize, @intCast(i)))].keycode;
                }
            }
        }
    }
    if (!(sdl_keycode != 0)) {
        const scancode: SDL_Scancode = SDL_GetScancodeFromKeySym(keysym, keycode);
        _ = &scancode;
        if (scancode != @as(SDL_Scancode, SDL_SCANCODE_UNKNOWN)) {
            sdl_keycode = SDL_GetKeymapKeycode(null, scancode, modifiers);
        }
    }
    return sdl_keycode;
}

pub const SDLK_MODE = __helpers.promoteIntLiteral(c_uint, 0x40000101, .hex);
pub const SDLK_LEFT_TAB = __helpers.promoteIntLiteral(c_uint, 0x20000001, .hex);
pub const SDLK_LEVEL5_SHIFT = __helpers.promoteIntLiteral(c_uint, 0x20000002, .hex);
pub const SDLK_MULTI_KEY_COMPOSE = __helpers.promoteIntLiteral(c_uint, 0x20000003, .hex);
pub const SDLK_LMETA = __helpers.promoteIntLiteral(c_uint, 0x20000004, .hex);
pub const SDLK_RMETA = __helpers.promoteIntLiteral(c_uint, 0x20000005, .hex);
pub const SDLK_LHYPER = __helpers.promoteIntLiteral(c_uint, 0x20000006, .hex);
pub const SDLK_RHYPER = __helpers.promoteIntLiteral(c_uint, 0x20000007, .hex);
