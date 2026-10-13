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
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint16 = u16;
pub const Uint32 = u32;
pub const Uint64 = u64;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_isdigit_REAL(x: c_int) c_int;
pub extern fn SDL_strlen_REAL(str: [*c]const u8) usize;
pub extern fn SDL_strcasecmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_UCS4ToUTF8_REAL(codepoint: Uint32, dst: [*c]u8) [*c]u8;
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
pub inline fn SDL_MostSignificantBitIndex32(x: Uint32) c_int {
    @setEvalBranchQuota(100000);
    if (x == @as(Uint32, 0)) {
        return -@as(c_int, 1);
    }
    return @as(c_int, 31) - __builtin.clz(x);
}
pub inline fn SDL_HasExactlyOneBitSet32(arg_x: Uint32) bool {
    @setEvalBranchQuota(100000);
    var x = arg_x;
    _ = &x;
    if ((x != 0) and (@as(Uint32, @bitCast(@as(c_int, @intFromBool(!((x & (x -% @as(Uint32, 1))) != 0))))) != 0)) {
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub const SDL_SCANCODE_UNKNOWN: c_int = 0;
pub const SDL_SCANCODE_A: c_int = 4;
pub const SDL_SCANCODE_D: c_int = 7;
pub const SDL_SCANCODE_1: c_int = 30;
pub const SDL_SCANCODE_0: c_int = 39;
pub const SDL_SCANCODE_RETURN: c_int = 40;
pub const SDL_SCANCODE_ESCAPE: c_int = 41;
pub const SDL_SCANCODE_BACKSPACE: c_int = 42;
pub const SDL_SCANCODE_TAB: c_int = 43;
pub const SDL_SCANCODE_SPACE: c_int = 44;
pub const SDL_SCANCODE_CAPSLOCK: c_int = 57;
pub const SDL_SCANCODE_F1: c_int = 58;
pub const SDL_SCANCODE_F2: c_int = 59;
pub const SDL_SCANCODE_F3: c_int = 60;
pub const SDL_SCANCODE_F4: c_int = 61;
pub const SDL_SCANCODE_F5: c_int = 62;
pub const SDL_SCANCODE_F6: c_int = 63;
pub const SDL_SCANCODE_F7: c_int = 64;
pub const SDL_SCANCODE_F8: c_int = 65;
pub const SDL_SCANCODE_F9: c_int = 66;
pub const SDL_SCANCODE_F10: c_int = 67;
pub const SDL_SCANCODE_F11: c_int = 68;
pub const SDL_SCANCODE_F12: c_int = 69;
pub const SDL_SCANCODE_PRINTSCREEN: c_int = 70;
pub const SDL_SCANCODE_SCROLLLOCK: c_int = 71;
pub const SDL_SCANCODE_PAUSE: c_int = 72;
pub const SDL_SCANCODE_INSERT: c_int = 73;
pub const SDL_SCANCODE_HOME: c_int = 74;
pub const SDL_SCANCODE_PAGEUP: c_int = 75;
pub const SDL_SCANCODE_DELETE: c_int = 76;
pub const SDL_SCANCODE_END: c_int = 77;
pub const SDL_SCANCODE_PAGEDOWN: c_int = 78;
pub const SDL_SCANCODE_RIGHT: c_int = 79;
pub const SDL_SCANCODE_LEFT: c_int = 80;
pub const SDL_SCANCODE_DOWN: c_int = 81;
pub const SDL_SCANCODE_UP: c_int = 82;
pub const SDL_SCANCODE_NUMLOCKCLEAR: c_int = 83;
pub const SDL_SCANCODE_KP_DIVIDE: c_int = 84;
pub const SDL_SCANCODE_KP_MULTIPLY: c_int = 85;
pub const SDL_SCANCODE_KP_MINUS: c_int = 86;
pub const SDL_SCANCODE_KP_PLUS: c_int = 87;
pub const SDL_SCANCODE_KP_ENTER: c_int = 88;
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
pub const SDL_SCANCODE_POWER: c_int = 102;
pub const SDL_SCANCODE_KP_EQUALS: c_int = 103;
pub const SDL_SCANCODE_F13: c_int = 104;
pub const SDL_SCANCODE_F14: c_int = 105;
pub const SDL_SCANCODE_F15: c_int = 106;
pub const SDL_SCANCODE_F16: c_int = 107;
pub const SDL_SCANCODE_F17: c_int = 108;
pub const SDL_SCANCODE_F18: c_int = 109;
pub const SDL_SCANCODE_F19: c_int = 110;
pub const SDL_SCANCODE_F20: c_int = 111;
pub const SDL_SCANCODE_F21: c_int = 112;
pub const SDL_SCANCODE_F22: c_int = 113;
pub const SDL_SCANCODE_F23: c_int = 114;
pub const SDL_SCANCODE_F24: c_int = 115;
pub const SDL_SCANCODE_EXECUTE: c_int = 116;
pub const SDL_SCANCODE_HELP: c_int = 117;
pub const SDL_SCANCODE_MENU: c_int = 118;
pub const SDL_SCANCODE_SELECT: c_int = 119;
pub const SDL_SCANCODE_STOP: c_int = 120;
pub const SDL_SCANCODE_AGAIN: c_int = 121;
pub const SDL_SCANCODE_UNDO: c_int = 122;
pub const SDL_SCANCODE_CUT: c_int = 123;
pub const SDL_SCANCODE_COPY: c_int = 124;
pub const SDL_SCANCODE_PASTE: c_int = 125;
pub const SDL_SCANCODE_FIND: c_int = 126;
pub const SDL_SCANCODE_MUTE: c_int = 127;
pub const SDL_SCANCODE_VOLUMEUP: c_int = 128;
pub const SDL_SCANCODE_VOLUMEDOWN: c_int = 129;
pub const SDL_SCANCODE_KP_COMMA: c_int = 133;
pub const SDL_SCANCODE_KP_EQUALSAS400: c_int = 134;
pub const SDL_SCANCODE_ALTERASE: c_int = 153;
pub const SDL_SCANCODE_SYSREQ: c_int = 154;
pub const SDL_SCANCODE_CANCEL: c_int = 155;
pub const SDL_SCANCODE_CLEAR: c_int = 156;
pub const SDL_SCANCODE_PRIOR: c_int = 157;
pub const SDL_SCANCODE_RETURN2: c_int = 158;
pub const SDL_SCANCODE_SEPARATOR: c_int = 159;
pub const SDL_SCANCODE_OUT: c_int = 160;
pub const SDL_SCANCODE_OPER: c_int = 161;
pub const SDL_SCANCODE_CLEARAGAIN: c_int = 162;
pub const SDL_SCANCODE_CRSEL: c_int = 163;
pub const SDL_SCANCODE_EXSEL: c_int = 164;
pub const SDL_SCANCODE_FRONT: c_int = 165;
pub const SDL_SCANCODE_KP_00: c_int = 176;
pub const SDL_SCANCODE_KP_000: c_int = 177;
pub const SDL_SCANCODE_THOUSANDSSEPARATOR: c_int = 178;
pub const SDL_SCANCODE_DECIMALSEPARATOR: c_int = 179;
pub const SDL_SCANCODE_CURRENCYUNIT: c_int = 180;
pub const SDL_SCANCODE_CURRENCYSUBUNIT: c_int = 181;
pub const SDL_SCANCODE_KP_LEFTPAREN: c_int = 182;
pub const SDL_SCANCODE_KP_RIGHTPAREN: c_int = 183;
pub const SDL_SCANCODE_KP_LEFTBRACE: c_int = 184;
pub const SDL_SCANCODE_KP_RIGHTBRACE: c_int = 185;
pub const SDL_SCANCODE_KP_TAB: c_int = 186;
pub const SDL_SCANCODE_KP_BACKSPACE: c_int = 187;
pub const SDL_SCANCODE_KP_A: c_int = 188;
pub const SDL_SCANCODE_KP_B: c_int = 189;
pub const SDL_SCANCODE_KP_C: c_int = 190;
pub const SDL_SCANCODE_KP_D: c_int = 191;
pub const SDL_SCANCODE_KP_E: c_int = 192;
pub const SDL_SCANCODE_KP_F: c_int = 193;
pub const SDL_SCANCODE_KP_XOR: c_int = 194;
pub const SDL_SCANCODE_KP_POWER: c_int = 195;
pub const SDL_SCANCODE_KP_PERCENT: c_int = 196;
pub const SDL_SCANCODE_KP_LESS: c_int = 197;
pub const SDL_SCANCODE_KP_GREATER: c_int = 198;
pub const SDL_SCANCODE_KP_AMPERSAND: c_int = 199;
pub const SDL_SCANCODE_KP_DBLAMPERSAND: c_int = 200;
pub const SDL_SCANCODE_KP_VERTICALBAR: c_int = 201;
pub const SDL_SCANCODE_KP_DBLVERTICALBAR: c_int = 202;
pub const SDL_SCANCODE_KP_COLON: c_int = 203;
pub const SDL_SCANCODE_KP_HASH: c_int = 204;
pub const SDL_SCANCODE_KP_SPACE: c_int = 205;
pub const SDL_SCANCODE_KP_AT: c_int = 206;
pub const SDL_SCANCODE_KP_EXCLAM: c_int = 207;
pub const SDL_SCANCODE_KP_MEMSTORE: c_int = 208;
pub const SDL_SCANCODE_KP_MEMRECALL: c_int = 209;
pub const SDL_SCANCODE_KP_MEMCLEAR: c_int = 210;
pub const SDL_SCANCODE_KP_MEMADD: c_int = 211;
pub const SDL_SCANCODE_KP_MEMSUBTRACT: c_int = 212;
pub const SDL_SCANCODE_KP_MEMMULTIPLY: c_int = 213;
pub const SDL_SCANCODE_KP_MEMDIVIDE: c_int = 214;
pub const SDL_SCANCODE_KP_PLUSMINUS: c_int = 215;
pub const SDL_SCANCODE_KP_CLEAR: c_int = 216;
pub const SDL_SCANCODE_KP_CLEARENTRY: c_int = 217;
pub const SDL_SCANCODE_KP_BINARY: c_int = 218;
pub const SDL_SCANCODE_KP_OCTAL: c_int = 219;
pub const SDL_SCANCODE_KP_DECIMAL: c_int = 220;
pub const SDL_SCANCODE_KP_HEXADECIMAL: c_int = 221;
pub const SDL_SCANCODE_LCTRL: c_int = 224;
pub const SDL_SCANCODE_LSHIFT: c_int = 225;
pub const SDL_SCANCODE_LALT: c_int = 226;
pub const SDL_SCANCODE_LGUI: c_int = 227;
pub const SDL_SCANCODE_RCTRL: c_int = 228;
pub const SDL_SCANCODE_RSHIFT: c_int = 229;
pub const SDL_SCANCODE_RALT: c_int = 230;
pub const SDL_SCANCODE_RGUI: c_int = 231;
pub const SDL_SCANCODE_MODE: c_int = 257;
pub const SDL_SCANCODE_SLEEP: c_int = 258;
pub const SDL_SCANCODE_WAKE: c_int = 259;
pub const SDL_SCANCODE_CHANNEL_INCREMENT: c_int = 260;
pub const SDL_SCANCODE_CHANNEL_DECREMENT: c_int = 261;
pub const SDL_SCANCODE_MEDIA_PLAY: c_int = 262;
pub const SDL_SCANCODE_MEDIA_PAUSE: c_int = 263;
pub const SDL_SCANCODE_MEDIA_RECORD: c_int = 264;
pub const SDL_SCANCODE_MEDIA_FAST_FORWARD: c_int = 265;
pub const SDL_SCANCODE_MEDIA_REWIND: c_int = 266;
pub const SDL_SCANCODE_MEDIA_NEXT_TRACK: c_int = 267;
pub const SDL_SCANCODE_MEDIA_PREVIOUS_TRACK: c_int = 268;
pub const SDL_SCANCODE_MEDIA_STOP: c_int = 269;
pub const SDL_SCANCODE_MEDIA_EJECT: c_int = 270;
pub const SDL_SCANCODE_MEDIA_PLAY_PAUSE: c_int = 271;
pub const SDL_SCANCODE_MEDIA_SELECT: c_int = 272;
pub const SDL_SCANCODE_AC_NEW: c_int = 273;
pub const SDL_SCANCODE_AC_OPEN: c_int = 274;
pub const SDL_SCANCODE_AC_CLOSE: c_int = 275;
pub const SDL_SCANCODE_AC_EXIT: c_int = 276;
pub const SDL_SCANCODE_AC_SAVE: c_int = 277;
pub const SDL_SCANCODE_AC_PRINT: c_int = 278;
pub const SDL_SCANCODE_AC_PROPERTIES: c_int = 279;
pub const SDL_SCANCODE_AC_SEARCH: c_int = 280;
pub const SDL_SCANCODE_AC_HOME: c_int = 281;
pub const SDL_SCANCODE_AC_BACK: c_int = 282;
pub const SDL_SCANCODE_AC_FORWARD: c_int = 283;
pub const SDL_SCANCODE_AC_STOP: c_int = 284;
pub const SDL_SCANCODE_AC_REFRESH: c_int = 285;
pub const SDL_SCANCODE_AC_BOOKMARKS: c_int = 286;
pub const SDL_SCANCODE_SOFTLEFT: c_int = 287;
pub const SDL_SCANCODE_SOFTRIGHT: c_int = 288;
pub const SDL_SCANCODE_CALL: c_int = 289;
pub const SDL_SCANCODE_ENDCALL: c_int = 290;
pub const SDL_SCANCODE_RESERVED: c_int = 400;
pub const SDL_SCANCODE_COUNT: c_int = 512;
pub const enum_SDL_Scancode = c_uint;
pub const SDL_Scancode = enum_SDL_Scancode;
pub const SDL_Keycode = Uint32;
pub const SDL_Keymod = Uint16;
pub extern fn SDL_GetKeyFromScancode_REAL(scancode: SDL_Scancode, modstate: SDL_Keymod, key_event: bool) SDL_Keycode;
pub extern fn SDL_GetPersistentString(string: [*c]const u8) [*c]const u8;
pub const struct_SDL_KeycodeMapHashItem = extern struct {
    key: Uint32 = 0,
    value: Uint32 = 0,
    hash: Uint32 = 0,
    probe_len: Uint32 = 0,
};
pub const SDL_KeycodeMapHashItem = struct_SDL_KeycodeMapHashItem;
pub const struct_SDL_KeycodeMap = extern struct {
    table: [*c]SDL_KeycodeMapHashItem = null,
    userdata: ?*anyopaque = null,
    hash_mask: Uint32 = 0,
    num_occupied_slots: Uint32 = 0,
};
pub const SDL_KeycodeMap = struct_SDL_KeycodeMap;
pub const struct_SDL_Keymap = extern struct {
    scancode_to_keycode: [*c]SDL_KeycodeMap = null,
    keycode_to_scancode: [*c]SDL_KeycodeMap = null,
    next_reserved_scancode: SDL_Scancode = @import("std").mem.zeroes(SDL_Scancode),
    flags: Uint32 = 0,
};
pub const SDL_Keymap = struct_SDL_Keymap;
pub extern fn SDL_SetKeymap(keymap: [*c]SDL_Keymap, send_event: bool) void;
pub extern fn SDL_GetCurrentKeymap(ignore_options: bool) [*c]SDL_Keymap;
pub extern fn SDL_CaseFoldUnicode(from: Uint32, to: [*c]Uint32) c_int;
pub fn SDL_KeycodeMapinternal_hash_buckets_from_estimate(arg_estimated_capacity: c_int) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    var estimated_capacity = arg_estimated_capacity;
    _ = &estimated_capacity;
    if (estimated_capacity <= @as(c_int, 0)) {
        return 4;
    }
    const estimated32: Uint32 = @bitCast(@as(c_int, estimated_capacity));
    _ = &estimated32;
    var buckets: Uint32 = @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1)))) << @intCast(@as(Uint32, @bitCast(@as(c_int, SDL_MostSignificantBitIndex32(estimated32)))));
    _ = &buckets;
    if (!SDL_HasExactlyOneBitSet32(estimated32)) {
        buckets <<= @intCast(@as(Uint32, 1));
    }
    return if (buckets < (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1)))) << @intCast(@as(Uint32, @bitCast(@as(c_int, SDL_MostSignificantBitIndex32(@truncate(@as(c_ulong, 2147483648) / @sizeOf(SDL_KeycodeMapHashItem))))))))) buckets else @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1)))) << @intCast(@as(Uint32, @bitCast(@as(c_int, SDL_MostSignificantBitIndex32(@truncate(@as(c_ulong, 2147483648) / @sizeOf(SDL_KeycodeMapHashItem)))))));
}
pub fn SDL_KeycodeMapCreate(estimated_capacity: c_int, userdata: ?*anyopaque) callconv(.c) [*c]SDL_KeycodeMap {
    @setEvalBranchQuota(100000);
    const num_buckets: Uint32 = SDL_KeycodeMapinternal_hash_buckets_from_estimate(estimated_capacity);
    _ = &num_buckets;
    var table: [*c]SDL_KeycodeMap = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(SDL_KeycodeMap))));
    _ = &table;
    if (!(table != null)) {
        return null;
    }
    table.*.table = @ptrCast(@alignCast(SDL_calloc_REAL(num_buckets, @sizeOf(SDL_KeycodeMapHashItem))));
    if (!(table.*.table != null)) {
        SDL_KeycodeMapDestroy(table);
        return null;
    }
    table.*.hash_mask = num_buckets -% @as(Uint32, 1);
    table.*.userdata = userdata;
    return table;
}
pub fn SDL_KeycodeMapinternal_get_probe_length(zero_idx: Uint32, actual_idx: Uint32, num_buckets: Uint32) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    if (actual_idx < zero_idx) {
        return ((num_buckets -% zero_idx) +% actual_idx) +% @as(Uint32, 1);
    }
    return (actual_idx -% zero_idx) +% @as(Uint32, 1);
}
pub fn SDL_KeycodeMapinternal_find_item(ht: [*c]const SDL_KeycodeMap, key: Uint32, hash: Uint32) callconv(.c) [*c]SDL_KeycodeMapHashItem {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [32:0]u8 = "SDL_KeycodeMapinternal_find_item".*;
    };
    _ = &static_local___func__;
    var hash_mask: Uint32 = ht.*.hash_mask;
    _ = &hash_mask;
    var table: [*c]SDL_KeycodeMapHashItem = ht.*.table;
    _ = &table;
    var i: Uint32 = hash & hash_mask;
    _ = &i;
    var probe_len: Uint32 = 0;
    _ = &probe_len;
    while (true) {
        var item: [*c]SDL_KeycodeMapHashItem = table + i;
        _ = &item;
        var item_probe_len: Uint32 = item.*.probe_len;
        _ = &item_probe_len;
        if ((blk: {
            const ref = &probe_len;
            ref.* +%= 1;
            break :blk ref.*;
        }) > item_probe_len) {
            return null;
        }
        var item_hash: Uint32 = item.*.hash;
        _ = &item_hash;
        if ((item_hash == hash) and (item.*.key == key)) {
            return item;
        }
        while (true) {
            while (!(item_probe_len == SDL_KeycodeMapinternal_get_probe_length(item_hash & hash_mask, @bitCast(@as(c_int, @truncate(@divExact(@as(c_long, @bitCast(@intFromPtr(item) -% @intFromPtr(table))), @sizeOf(SDL_KeycodeMapHashItem))))), hash_mask +% @as(Uint32, 1)))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "item_probe_len == SDL_KeycodeMapinternal_get_probe_length(item_hash & hash_mask, (Uint32)(item - table), hash_mask + 1)",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_generic_hashtable.h", 159);
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
        i = (i +% @as(Uint32, 1)) & hash_mask;
    }
    return undefined;
}
pub fn SDL_KeycodeMapinternal_insert_item(item_to_insert: [*c]SDL_KeycodeMapHashItem, table: [*c]SDL_KeycodeMapHashItem, arg_hash_mask: Uint32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var hash_mask = arg_hash_mask;
    _ = &hash_mask;
    const static_local___func__ = struct {
        const __func__: [34:0]u8 = "SDL_KeycodeMapinternal_insert_item".*;
    };
    _ = &static_local___func__;
    const num_buckets: Uint32 = hash_mask +% @as(Uint32, 1);
    _ = &num_buckets;
    var idx: Uint32 = item_to_insert.*.hash & hash_mask;
    _ = &idx;
    var temp_item: SDL_KeycodeMapHashItem = undefined;
    _ = &temp_item;
    while (true) {
        var candidate: [*c]SDL_KeycodeMapHashItem = table + idx;
        _ = &candidate;
        if (candidate.*.probe_len == @as(Uint32, 0)) {
            candidate.* = item_to_insert.*;
            const probe_len: Uint32 = SDL_KeycodeMapinternal_get_probe_length(candidate.*.hash & hash_mask, idx, num_buckets);
            _ = &probe_len;
            candidate.*.probe_len = probe_len;
            break;
        }
        const candidate_probe_len: Uint32 = candidate.*.probe_len;
        _ = &candidate_probe_len;
        while (true) {
            while (!(candidate_probe_len == SDL_KeycodeMapinternal_get_probe_length(candidate.*.hash & hash_mask, idx, num_buckets))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "candidate_probe_len == SDL_KeycodeMapinternal_get_probe_length(candidate->hash & hash_mask, idx, num_buckets)",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_generic_hashtable.h", 184);
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
        const new_probe_len: Uint32 = SDL_KeycodeMapinternal_get_probe_length(item_to_insert.*.hash & hash_mask, idx, num_buckets);
        _ = &new_probe_len;
        if (candidate_probe_len < new_probe_len) {
            temp_item = candidate.*;
            candidate.* = item_to_insert.*;
            item_to_insert.* = temp_item;
            while (true) {
                while (!(new_probe_len == SDL_KeycodeMapinternal_get_probe_length(candidate.*.hash & hash_mask, idx, num_buckets))) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "new_probe_len == SDL_KeycodeMapinternal_get_probe_length(candidate->hash & hash_mask, idx, num_buckets)",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_generic_hashtable.h", 196);
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
            candidate.*.probe_len = new_probe_len;
        }
        idx = (idx +% @as(Uint32, 1)) & hash_mask;
    }
}
pub fn SDL_KeycodeMapinternal_delete_item(ht: [*c]SDL_KeycodeMap, arg_item: [*c]SDL_KeycodeMapHashItem) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var item = arg_item;
    _ = &item;
    const static_local___func__ = struct {
        const __func__: [34:0]u8 = "SDL_KeycodeMapinternal_delete_item".*;
    };
    _ = &static_local___func__;
    const hash_mask: Uint32 = ht.*.hash_mask;
    _ = &hash_mask;
    var table: [*c]SDL_KeycodeMapHashItem = ht.*.table;
    _ = &table;
    _ = ht.*.userdata;
    _ = item.*.key;
    _ = item.*.value;
    while (true) {
        while (!(ht.*.num_occupied_slots > @as(Uint32, 0))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "ht->num_occupied_slots > 0",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_generic_hashtable.h", 215);
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
    ht.*.num_occupied_slots -%= 1;
    var idx: Uint32 = @bitCast(@as(c_int, @truncate(@divExact(@as(c_long, @bitCast(@intFromPtr(item) -% @intFromPtr(ht.*.table))), @sizeOf(SDL_KeycodeMapHashItem)))));
    _ = &idx;
    while (true) {
        idx = (idx +% @as(Uint32, 1)) & hash_mask;
        var next_item: [*c]SDL_KeycodeMapHashItem = table + idx;
        _ = &next_item;
        if (next_item.*.probe_len <= @as(Uint32, 1)) {
            _ = memset(@ptrCast(@alignCast(item)), 0, @sizeOf(@TypeOf(item.*)));
            return;
        }
        item.* = next_item.*;
        item.*.probe_len -%= 1;
        item = next_item;
    }
}
pub fn SDL_KeycodeMapinternal_resize(ht: [*c]SDL_KeycodeMap, new_size: Uint32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const new_hash_mask: Uint32 = new_size -% @as(Uint32, 1);
    _ = &new_hash_mask;
    var new_table: [*c]SDL_KeycodeMapHashItem = undefined;
    new_table = @ptrCast(@alignCast(SDL_calloc_REAL(new_size, @sizeOf(@TypeOf(new_table.*)))));
    _ = &new_table;
    if (!(new_table != null)) {
        return @"false" != 0;
    }
    var old_table: [*c]SDL_KeycodeMapHashItem = ht.*.table;
    _ = &old_table;
    const old_size: Uint32 = ht.*.hash_mask +% @as(Uint32, 1);
    _ = &old_size;
    ht.*.hash_mask = new_hash_mask;
    ht.*.table = new_table;
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < old_size) : (i +%= 1) {
            var item: [*c]SDL_KeycodeMapHashItem = old_table + i;
            _ = &item;
            if (item.*.probe_len != @as(Uint32, 0)) {
                SDL_KeycodeMapinternal_insert_item(item, new_table, new_hash_mask);
            }
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(old_table)));
    return @"true" != 0;
}
pub fn SDL_KeycodeMapinternal_maybe_resize(ht: [*c]SDL_KeycodeMap) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const capacity: Uint32 = ht.*.hash_mask +% @as(Uint32, 1);
    _ = &capacity;
    if (capacity >= (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1)))) << @intCast(@as(Uint32, @bitCast(@as(c_int, SDL_MostSignificantBitIndex32(@truncate(@as(c_ulong, 2147483648) / @sizeOf(SDL_KeycodeMapHashItem))))))))) {
        return @"false" != 0;
    }
    const resize_threshold: Uint32 = @truncate((@as(Uint64, 128) *% @as(Uint64, capacity)) >> @intCast(@as(Uint64, 8)));
    _ = &resize_threshold;
    if (ht.*.num_occupied_slots > resize_threshold) {
        return SDL_KeycodeMapinternal_resize(ht, capacity *% @as(Uint32, 2));
    }
    return @"true" != 0;
}
pub fn SDL_KeycodeMapInsert(table: [*c]SDL_KeycodeMap, key: Uint32, value: Uint32, replace: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (!(table != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("table"))));
    }
    var result: bool = @"false" != 0;
    _ = &result;
    const hash: Uint32 = key;
    _ = &hash;
    var item: [*c]SDL_KeycodeMapHashItem = SDL_KeycodeMapinternal_find_item(table, key, hash);
    _ = &item;
    var do_insert: bool = @"true" != 0;
    _ = &do_insert;
    if (item != null) {
        if (replace) {
            SDL_KeycodeMapinternal_delete_item(table, item);
        } else {
            _ = SDL_SetError_REAL("key already exists and replace is disabled");
            do_insert = @"false" != 0;
        }
    }
    if (do_insert) {
        var new_item: SDL_KeycodeMapHashItem = undefined;
        _ = &new_item;
        new_item.key = key;
        new_item.value = value;
        new_item.hash = hash;
        new_item.probe_len = 1;
        table.*.num_occupied_slots +%= 1;
        if (!SDL_KeycodeMapinternal_maybe_resize(table)) {
            table.*.num_occupied_slots -%= 1;
        } else {
            SDL_KeycodeMapinternal_insert_item(&new_item, table.*.table, table.*.hash_mask);
            result = @"true" != 0;
        }
    }
    return result;
}
pub fn SDL_KeycodeMapFind(table: [*c]const SDL_KeycodeMap, key: Uint32, value: [*c]Uint32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (!(table != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("table"))));
    }
    var result: bool = @"false" != 0;
    _ = &result;
    const hash: Uint32 = key;
    _ = &hash;
    var i: [*c]SDL_KeycodeMapHashItem = SDL_KeycodeMapinternal_find_item(table, key, hash);
    _ = &i;
    if (i != null) {
        if (value != null) {
            value.* = i.*.value;
        }
        result = @"true" != 0;
    }
    return result;
}
pub fn SDL_KeycodeMapinternal_destroy_all(table: [*c]SDL_KeycodeMap) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var userdata: ?*anyopaque = table.*.userdata;
    _ = &userdata;
    var end: [*c]SDL_KeycodeMapHashItem = table.*.table + (table.*.hash_mask +% @as(Uint32, 1));
    _ = &end;
    {
        var i: [*c]SDL_KeycodeMapHashItem = table.*.table;
        _ = &i;
        while (i < end) : (i += 1) {
            if (i.*.probe_len != @as(Uint32, 0)) {
                i.*.probe_len = 0;
                _ = &userdata;
                _ = i.*.key;
                _ = i.*.value;
            }
        }
    }
}
pub fn SDL_KeycodeMapDestroy(table: [*c]SDL_KeycodeMap) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (table != null) {
        if (table.*.table != null) {
            SDL_KeycodeMapinternal_destroy_all(table);
            SDL_free_REAL(@ptrCast(@alignCast(table.*.table)));
            table.*.table = null;
        }
        SDL_free_REAL(@ptrCast(@alignCast(table)));
    }
}
pub export fn SDL_CreateKeymap(auto_release: bool) [*c]SDL_Keymap {
    @setEvalBranchQuota(100000);
    var keymap: [*c]SDL_Keymap = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(SDL_Keymap))));
    _ = &keymap;
    if (!(keymap != null)) {
        return null;
    }
    if (auto_release) {
        keymap.*.flags |= SDL_KEYMAP_AUTO_RELEASE;
    }
    keymap.*.scancode_to_keycode = SDL_KeycodeMapCreate(256, null);
    keymap.*.keycode_to_scancode = SDL_KeycodeMapCreate(256, null);
    if (!(keymap.*.scancode_to_keycode != null) or !(keymap.*.keycode_to_scancode != null)) {
        SDL_DestroyKeymap(keymap);
        return null;
    }
    return keymap;
}
pub fn NormalizeModifierStateForKeymap(arg_modstate: SDL_Keymod) callconv(.c) SDL_Keymod {
    @setEvalBranchQuota(100000);
    var modstate = arg_modstate;
    _ = &modstate;
    {
        const ref = &modstate;
        ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) & (((((SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT) | SDL_KMOD_CAPS) | (SDL_KMOD_LALT | SDL_KMOD_RALT)) | SDL_KMOD_MODE) | SDL_KMOD_LEVEL5));
    }
    if ((@as(c_uint, @bitCast(@as(c_int, @as(c_int, modstate)))) & (SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT)) != 0) {
        {
            const ref = &modstate;
            ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | (SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT));
        }
    }
    if ((@as(c_uint, @bitCast(@as(c_int, @as(c_int, modstate)))) & (SDL_KMOD_LALT | SDL_KMOD_RALT)) != 0) {
        {
            const ref = &modstate;
            ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | (SDL_KMOD_LALT | SDL_KMOD_RALT));
        }
    }
    return modstate;
}
pub export fn SDL_SetKeymapEntry(keymap: [*c]SDL_Keymap, scancode: SDL_Scancode, arg_modstate: SDL_Keymod, keycode: SDL_Keycode) void {
    @setEvalBranchQuota(100000);
    var modstate = arg_modstate;
    _ = &modstate;
    if (!(keymap != null)) {
        return;
    }
    modstate = NormalizeModifierStateForKeymap(modstate);
    const key: Uint32 = (@as(Uint32, modstate) << @intCast(@as(Uint32, 16))) | scancode;
    _ = &key;
    var value: Uint32 = 0;
    _ = &value;
    if (SDL_KeycodeMapFind(keymap.*.scancode_to_keycode, key, &value)) {
        const existing_keycode: SDL_Keycode = value;
        _ = &existing_keycode;
        if (existing_keycode == keycode) {
            return;
        }
    }
    _ = SDL_KeycodeMapInsert(keymap.*.scancode_to_keycode, key, keycode, @"true" != 0);
    var update_keycode: bool = @"true" != 0;
    _ = &update_keycode;
    if (SDL_KeycodeMapFind(keymap.*.keycode_to_scancode, keycode, &value)) {
        const existing_value: Uint32 = value;
        _ = &existing_value;
        const existing_modstate: SDL_Keymod = @truncate(existing_value >> @intCast(@as(Uint32, 16)));
        _ = &existing_modstate;
        if (@as(c_int, existing_modstate) <= @as(c_int, modstate)) {
            update_keycode = @"false" != 0;
        }
    }
    if (update_keycode) {
        _ = SDL_KeycodeMapInsert(keymap.*.keycode_to_scancode, keycode, key, @"true" != 0);
    }
}
pub export fn SDL_GetKeymapKeycode(keymap: [*c]SDL_Keymap, scancode: SDL_Scancode, modstate: SDL_Keymod) SDL_Keycode {
    @setEvalBranchQuota(100000);
    if (keymap != null) {
        var value: Uint32 = 0;
        _ = &value;
        const normalized_modstate: SDL_Keymod = NormalizeModifierStateForKeymap(modstate);
        _ = &normalized_modstate;
        var key: Uint32 = (@as(Uint32, normalized_modstate) << @intCast(@as(Uint32, 16))) | scancode;
        _ = &key;
        if (SDL_KeycodeMapFind(keymap.*.scancode_to_keycode, key, &value)) {
            return value;
        }
        if (@as(c_int, normalized_modstate) != 0) {
            var caps_mask: SDL_Keymod = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, normalized_modstate)))) & SDL_KMOD_CAPS);
            _ = &caps_mask;
            {
                var i: c_int = if (caps_mask != 0) @as(c_int, 2) else @as(c_int, 1);
                _ = &i;
                while (i != 0) : (i -= 1) {
                    if ((@as(c_uint, @bitCast(@as(c_int, @as(c_int, normalized_modstate)))) & SDL_KMOD_LEVEL5) != 0) {
                        const shifted_modstate: SDL_Keymod = @truncate(SDL_KMOD_LEVEL5 | @as(c_uint, @bitCast(@as(c_int, @as(c_int, caps_mask)))));
                        _ = &shifted_modstate;
                        key = (@as(Uint32, shifted_modstate) << @intCast(@as(Uint32, 16))) | scancode;
                        if ((@as(c_int, shifted_modstate) != @as(c_int, normalized_modstate)) and SDL_KeycodeMapFind(keymap.*.scancode_to_keycode, key, &value)) {
                            return value;
                        }
                    }
                    if ((@as(c_uint, @bitCast(@as(c_int, @as(c_int, normalized_modstate)))) & (SDL_KMOD_MODE | (SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT))) == (SDL_KMOD_MODE | (SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT))) {
                        const shifted_modstate: SDL_Keymod = @truncate((SDL_KMOD_MODE | (SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT)) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, caps_mask)))));
                        _ = &shifted_modstate;
                        key = (@as(Uint32, shifted_modstate) << @intCast(@as(Uint32, 16))) | scancode;
                        if ((@as(c_int, shifted_modstate) != @as(c_int, normalized_modstate)) and SDL_KeycodeMapFind(keymap.*.scancode_to_keycode, key, &value)) {
                            return value;
                        }
                    }
                    if ((@as(c_uint, @bitCast(@as(c_int, @as(c_int, normalized_modstate)))) & SDL_KMOD_MODE) != 0) {
                        const shifted_modstate: SDL_Keymod = @truncate(SDL_KMOD_MODE | @as(c_uint, @bitCast(@as(c_int, @as(c_int, caps_mask)))));
                        _ = &shifted_modstate;
                        key = (@as(Uint32, shifted_modstate) << @intCast(@as(Uint32, 16))) | scancode;
                        if ((@as(c_int, shifted_modstate) != @as(c_int, normalized_modstate)) and SDL_KeycodeMapFind(keymap.*.scancode_to_keycode, key, &value)) {
                            return value;
                        }
                    }
                    if ((@as(c_uint, @bitCast(@as(c_int, @as(c_int, normalized_modstate)))) & (SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT)) != 0) {
                        const shifted_modstate: SDL_Keymod = @truncate((SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, caps_mask)))));
                        _ = &shifted_modstate;
                        key = (@as(Uint32, shifted_modstate) << @intCast(@as(Uint32, 16))) | scancode;
                        if ((@as(c_int, shifted_modstate) != @as(c_int, normalized_modstate)) and SDL_KeycodeMapFind(keymap.*.scancode_to_keycode, key, &value)) {
                            return value;
                        }
                    }
                    key = (@as(Uint32, caps_mask) << @intCast(@as(Uint32, 16))) | scancode;
                    if (SDL_KeycodeMapFind(keymap.*.scancode_to_keycode, key, &value)) {
                        return value;
                    }
                    caps_mask = SDL_KMOD_NONE;
                }
            }
        }
    }
    return SDL_GetDefaultKeyFromScancode(scancode, modstate);
}
pub export fn SDL_GetKeymapScancode(keymap: [*c]SDL_Keymap, keycode: SDL_Keycode, modstate: [*c]SDL_Keymod) SDL_Scancode {
    @setEvalBranchQuota(100000);
    var scancode: SDL_Scancode = undefined;
    _ = &scancode;
    var value: Uint32 = 0;
    _ = &value;
    if ((keymap != null) and SDL_KeycodeMapFind(keymap.*.keycode_to_scancode, keycode, &value)) {
        scancode = value & @as(Uint32, 65535);
        if (modstate != null) {
            modstate.* = @truncate(value >> @intCast(@as(Uint32, 16)));
        }
    } else {
        scancode = SDL_GetDefaultScancodeFromKey(keycode, modstate);
    }
    return scancode;
}
pub export fn SDL_GetKeymapNextReservedScancode(keymap: [*c]SDL_Keymap) SDL_Scancode {
    @setEvalBranchQuota(100000);
    var scancode: SDL_Scancode = undefined;
    _ = &scancode;
    if (!(keymap != null)) {
        return SDL_SCANCODE_UNKNOWN;
    }
    if ((keymap.*.next_reserved_scancode != 0) and (@as(SDL_Scancode, @intCast(@intFromBool(keymap.*.next_reserved_scancode < @as(SDL_Scancode, @bitCast(SDL_SCANCODE_RESERVED + @as(c_int, 100)))))) != 0)) {
        scancode = keymap.*.next_reserved_scancode;
    } else {
        scancode = SDL_SCANCODE_RESERVED;
    }
    keymap.*.next_reserved_scancode = scancode +% @as(SDL_Scancode, 1);
    return scancode;
}
pub export fn SDL_DestroyKeymap(keymap: [*c]SDL_Keymap) void {
    @setEvalBranchQuota(100000);
    if (!(keymap != null)) {
        return;
    }
    if (!((keymap.*.flags & @as(Uint32, SDL_KEYMAP_AUTO_RELEASE)) != 0) and (keymap == SDL_GetCurrentKeymap(@"true" != 0))) {
        SDL_SetKeymap(null, @"false" != 0);
    }
    SDL_KeycodeMapDestroy(keymap.*.scancode_to_keycode);
    SDL_KeycodeMapDestroy(keymap.*.keycode_to_scancode);
    SDL_free_REAL(@ptrCast(@alignCast(keymap)));
}
pub const normal_default_symbols: [27]SDL_Keycode = [27]SDL_Keycode{
    SDLK_1,
    SDLK_2,
    SDLK_3,
    SDLK_4,
    SDLK_5,
    SDLK_6,
    SDLK_7,
    SDLK_8,
    SDLK_9,
    SDLK_0,
    SDLK_RETURN,
    SDLK_ESCAPE,
    SDLK_BACKSPACE,
    SDLK_TAB,
    SDLK_SPACE,
    SDLK_MINUS,
    SDLK_EQUALS,
    SDLK_LEFTBRACKET,
    SDLK_RIGHTBRACKET,
    SDLK_BACKSLASH,
    SDLK_HASH,
    SDLK_SEMICOLON,
    SDLK_APOSTROPHE,
    SDLK_GRAVE,
    SDLK_COMMA,
    SDLK_PERIOD,
    SDLK_SLASH,
};
pub const shifted_default_symbols: [27]SDL_Keycode = [27]SDL_Keycode{
    SDLK_EXCLAIM,
    SDLK_AT,
    SDLK_HASH,
    SDLK_DOLLAR,
    SDLK_PERCENT,
    SDLK_CARET,
    SDLK_AMPERSAND,
    SDLK_ASTERISK,
    SDLK_LEFTPAREN,
    SDLK_RIGHTPAREN,
    SDLK_RETURN,
    SDLK_ESCAPE,
    SDLK_BACKSPACE,
    SDLK_TAB,
    SDLK_SPACE,
    SDLK_UNDERSCORE,
    SDLK_PLUS,
    SDLK_LEFTBRACE,
    SDLK_RIGHTBRACE,
    SDLK_PIPE,
    SDLK_HASH,
    SDLK_COLON,
    SDLK_DBLAPOSTROPHE,
    SDLK_TILDE,
    SDLK_LESS,
    SDLK_GREATER,
    SDLK_QUESTION,
};
const struct_unnamed_14 = extern struct {
    keycode: SDL_Keycode = 0,
    scancode: SDL_Scancode = @import("std").mem.zeroes(SDL_Scancode),
};
pub const extended_default_symbols: [5]struct_unnamed_14 = [5]struct_unnamed_14{
    struct_unnamed_14{
        .keycode = SDLK_LEFT_TAB,
        .scancode = SDL_SCANCODE_TAB,
    },
    struct_unnamed_14{
        .keycode = SDLK_MULTI_KEY_COMPOSE,
        .scancode = SDL_SCANCODE_APPLICATION,
    },
    struct_unnamed_14{
        .keycode = SDLK_LMETA,
        .scancode = SDL_SCANCODE_LGUI,
    },
    struct_unnamed_14{
        .keycode = SDLK_RMETA,
        .scancode = SDL_SCANCODE_RGUI,
    },
    struct_unnamed_14{
        .keycode = SDLK_RHYPER,
        .scancode = SDL_SCANCODE_APPLICATION,
    },
};
pub fn SDL_GetDefaultKeyFromScancode(arg_scancode: SDL_Scancode, modstate: SDL_Keymod) callconv(.c) SDL_Keycode {
    @setEvalBranchQuota(100000);
    var scancode = arg_scancode;
    _ = &scancode;
    var shifted: bool = undefined;
    _ = &shifted;
    var shifted_1: bool = undefined;
    _ = &shifted_1;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if ((@as(c_int, @bitCast(scancode)) < SDL_SCANCODE_UNKNOWN) or (scancode >= @as(SDL_Scancode, SDL_SCANCODE_COUNT))) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("scancode"))));
                return SDLK_UNKNOWN;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                if (scancode < @as(SDL_Scancode, SDL_SCANCODE_A)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                return SDLK_UNKNOWN;
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                if (scancode < @as(SDL_Scancode, SDL_SCANCODE_1)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                shifted = (if ((@as(c_uint, @bitCast(@as(c_int, @as(c_int, modstate)))) & (SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT)) != 0) @"true" else @"false") != 0;
                if ((@as(c_uint, @bitCast(@as(c_int, @as(c_int, modstate)))) & SDL_KMOD_CAPS) != 0) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
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
                if (scancode < @as(SDL_Scancode, SDL_SCANCODE_CAPSLOCK)) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            10 => {
                shifted = !shifted;
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                if ((@as(c_uint, @bitCast(@as(c_int, @as(c_int, modstate)))) & SDL_KMOD_MODE) != 0) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            13 => {
                return SDLK_UNKNOWN;
            },
            14 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                if (!shifted) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            16 => {
                return @bitCast(@as(c_int, (@as(c_int, 'a') + @as(c_int, @bitCast(scancode))) - SDL_SCANCODE_A));
            },
            17 => {
                return @bitCast(@as(c_int, (@as(c_int, 'A') + @as(c_int, @bitCast(scancode))) - SDL_SCANCODE_A));
            },
            18 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            19 => {
                shifted_1 = (if ((@as(c_uint, @bitCast(@as(c_int, @as(c_int, modstate)))) & (SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT)) != 0) @"true" else @"false") != 0;
                if ((@as(c_uint, @bitCast(@as(c_int, @as(c_int, modstate)))) & SDL_KMOD_MODE) != 0) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            20 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            21 => {
                switch (scancode) {
                    @as(SDL_Scancode, SDL_SCANCODE_DELETE) => {
                        sdl_pc = 29;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_CAPSLOCK) => {
                        sdl_pc = 30;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_F1) => {
                        sdl_pc = 31;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_F2) => {
                        sdl_pc = 32;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_F3) => {
                        sdl_pc = 33;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_F4) => {
                        sdl_pc = 34;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_F5) => {
                        sdl_pc = 35;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_F6) => {
                        sdl_pc = 36;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_F7) => {
                        sdl_pc = 37;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_F8) => {
                        sdl_pc = 38;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_F9) => {
                        sdl_pc = 39;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_F10) => {
                        sdl_pc = 40;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_F11) => {
                        sdl_pc = 41;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_F12) => {
                        sdl_pc = 42;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_PRINTSCREEN) => {
                        sdl_pc = 43;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_SCROLLLOCK) => {
                        sdl_pc = 44;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_PAUSE) => {
                        sdl_pc = 45;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_INSERT) => {
                        sdl_pc = 46;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_HOME) => {
                        sdl_pc = 47;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_PAGEUP) => {
                        sdl_pc = 48;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_END) => {
                        sdl_pc = 49;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_PAGEDOWN) => {
                        sdl_pc = 50;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_RIGHT) => {
                        sdl_pc = 51;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_LEFT) => {
                        sdl_pc = 52;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_DOWN) => {
                        sdl_pc = 53;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_UP) => {
                        sdl_pc = 54;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_NUMLOCKCLEAR) => {
                        sdl_pc = 55;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_DIVIDE) => {
                        sdl_pc = 56;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_MULTIPLY) => {
                        sdl_pc = 57;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_MINUS) => {
                        sdl_pc = 58;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_PLUS) => {
                        sdl_pc = 59;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_ENTER) => {
                        sdl_pc = 60;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_1) => {
                        sdl_pc = 61;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_2) => {
                        sdl_pc = 62;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_3) => {
                        sdl_pc = 63;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_4) => {
                        sdl_pc = 64;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_5) => {
                        sdl_pc = 65;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_6) => {
                        sdl_pc = 66;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_7) => {
                        sdl_pc = 67;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_8) => {
                        sdl_pc = 68;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_9) => {
                        sdl_pc = 69;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_0) => {
                        sdl_pc = 70;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_PERIOD) => {
                        sdl_pc = 71;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_APPLICATION) => {
                        sdl_pc = 72;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_POWER) => {
                        sdl_pc = 73;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_EQUALS) => {
                        sdl_pc = 74;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_F13) => {
                        sdl_pc = 75;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_F14) => {
                        sdl_pc = 76;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_F15) => {
                        sdl_pc = 77;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_F16) => {
                        sdl_pc = 78;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_F17) => {
                        sdl_pc = 79;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_F18) => {
                        sdl_pc = 80;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_F19) => {
                        sdl_pc = 81;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_F20) => {
                        sdl_pc = 82;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_F21) => {
                        sdl_pc = 83;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_F22) => {
                        sdl_pc = 84;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_F23) => {
                        sdl_pc = 85;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_F24) => {
                        sdl_pc = 86;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_EXECUTE) => {
                        sdl_pc = 87;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_HELP) => {
                        sdl_pc = 88;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_MENU) => {
                        sdl_pc = 89;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_SELECT) => {
                        sdl_pc = 90;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_STOP) => {
                        sdl_pc = 91;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_AGAIN) => {
                        sdl_pc = 92;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_UNDO) => {
                        sdl_pc = 93;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_CUT) => {
                        sdl_pc = 94;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_COPY) => {
                        sdl_pc = 95;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_PASTE) => {
                        sdl_pc = 96;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_FIND) => {
                        sdl_pc = 97;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_MUTE) => {
                        sdl_pc = 98;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_VOLUMEUP) => {
                        sdl_pc = 99;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_VOLUMEDOWN) => {
                        sdl_pc = 100;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_COMMA) => {
                        sdl_pc = 101;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_EQUALSAS400) => {
                        sdl_pc = 102;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_ALTERASE) => {
                        sdl_pc = 103;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_SYSREQ) => {
                        sdl_pc = 104;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_CANCEL) => {
                        sdl_pc = 105;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_CLEAR) => {
                        sdl_pc = 106;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_PRIOR) => {
                        sdl_pc = 107;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_RETURN2) => {
                        sdl_pc = 108;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_SEPARATOR) => {
                        sdl_pc = 109;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_OUT) => {
                        sdl_pc = 110;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_OPER) => {
                        sdl_pc = 111;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_CLEARAGAIN) => {
                        sdl_pc = 112;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_CRSEL) => {
                        sdl_pc = 113;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_EXSEL) => {
                        sdl_pc = 114;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_FRONT) => {
                        sdl_pc = 115;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_00) => {
                        sdl_pc = 116;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_000) => {
                        sdl_pc = 117;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_THOUSANDSSEPARATOR) => {
                        sdl_pc = 118;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_DECIMALSEPARATOR) => {
                        sdl_pc = 119;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_CURRENCYUNIT) => {
                        sdl_pc = 120;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_CURRENCYSUBUNIT) => {
                        sdl_pc = 121;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_LEFTPAREN) => {
                        sdl_pc = 122;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_RIGHTPAREN) => {
                        sdl_pc = 123;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_LEFTBRACE) => {
                        sdl_pc = 124;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_RIGHTBRACE) => {
                        sdl_pc = 125;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_TAB) => {
                        sdl_pc = 126;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_BACKSPACE) => {
                        sdl_pc = 127;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_A) => {
                        sdl_pc = 128;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_B) => {
                        sdl_pc = 129;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_C) => {
                        sdl_pc = 130;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_D) => {
                        sdl_pc = 131;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_E) => {
                        sdl_pc = 132;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_F) => {
                        sdl_pc = 133;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_XOR) => {
                        sdl_pc = 134;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_POWER) => {
                        sdl_pc = 135;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_PERCENT) => {
                        sdl_pc = 136;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_LESS) => {
                        sdl_pc = 137;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_GREATER) => {
                        sdl_pc = 138;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_AMPERSAND) => {
                        sdl_pc = 139;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_DBLAMPERSAND) => {
                        sdl_pc = 140;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_VERTICALBAR) => {
                        sdl_pc = 141;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_DBLVERTICALBAR) => {
                        sdl_pc = 142;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_COLON) => {
                        sdl_pc = 143;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_HASH) => {
                        sdl_pc = 144;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_SPACE) => {
                        sdl_pc = 145;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_AT) => {
                        sdl_pc = 146;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_EXCLAM) => {
                        sdl_pc = 147;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_MEMSTORE) => {
                        sdl_pc = 148;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_MEMRECALL) => {
                        sdl_pc = 149;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_MEMCLEAR) => {
                        sdl_pc = 150;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_MEMADD) => {
                        sdl_pc = 151;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_MEMSUBTRACT) => {
                        sdl_pc = 152;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_MEMMULTIPLY) => {
                        sdl_pc = 153;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_MEMDIVIDE) => {
                        sdl_pc = 154;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_PLUSMINUS) => {
                        sdl_pc = 155;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_CLEAR) => {
                        sdl_pc = 156;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_CLEARENTRY) => {
                        sdl_pc = 157;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_BINARY) => {
                        sdl_pc = 158;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_OCTAL) => {
                        sdl_pc = 159;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_DECIMAL) => {
                        sdl_pc = 160;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_KP_HEXADECIMAL) => {
                        sdl_pc = 161;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_LCTRL) => {
                        sdl_pc = 162;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_LSHIFT) => {
                        sdl_pc = 163;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_LALT) => {
                        sdl_pc = 164;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_LGUI) => {
                        sdl_pc = 165;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_RCTRL) => {
                        sdl_pc = 166;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_RSHIFT) => {
                        sdl_pc = 167;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_RALT) => {
                        sdl_pc = 168;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_RGUI) => {
                        sdl_pc = 169;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_MODE) => {
                        sdl_pc = 170;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_SLEEP) => {
                        sdl_pc = 171;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_WAKE) => {
                        sdl_pc = 172;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_CHANNEL_INCREMENT) => {
                        sdl_pc = 173;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_CHANNEL_DECREMENT) => {
                        sdl_pc = 174;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_MEDIA_PLAY) => {
                        sdl_pc = 175;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_MEDIA_PAUSE) => {
                        sdl_pc = 176;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_MEDIA_RECORD) => {
                        sdl_pc = 177;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_MEDIA_FAST_FORWARD) => {
                        sdl_pc = 178;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_MEDIA_REWIND) => {
                        sdl_pc = 179;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_MEDIA_NEXT_TRACK) => {
                        sdl_pc = 180;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_MEDIA_PREVIOUS_TRACK) => {
                        sdl_pc = 181;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_MEDIA_STOP) => {
                        sdl_pc = 182;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_MEDIA_EJECT) => {
                        sdl_pc = 183;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_MEDIA_PLAY_PAUSE) => {
                        sdl_pc = 184;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_MEDIA_SELECT) => {
                        sdl_pc = 185;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_AC_NEW) => {
                        sdl_pc = 186;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_AC_OPEN) => {
                        sdl_pc = 187;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_AC_CLOSE) => {
                        sdl_pc = 188;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_AC_EXIT) => {
                        sdl_pc = 189;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_AC_SAVE) => {
                        sdl_pc = 190;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_AC_PRINT) => {
                        sdl_pc = 191;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_AC_PROPERTIES) => {
                        sdl_pc = 192;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_AC_SEARCH) => {
                        sdl_pc = 193;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_AC_HOME) => {
                        sdl_pc = 194;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_AC_BACK) => {
                        sdl_pc = 195;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_AC_FORWARD) => {
                        sdl_pc = 196;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_AC_STOP) => {
                        sdl_pc = 197;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_AC_REFRESH) => {
                        sdl_pc = 198;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_AC_BOOKMARKS) => {
                        sdl_pc = 199;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_SOFTLEFT) => {
                        sdl_pc = 200;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_SOFTRIGHT) => {
                        sdl_pc = 201;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_CALL) => {
                        sdl_pc = 202;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_ENDCALL) => {
                        sdl_pc = 203;
                        continue;
                    },
                    else => {
                        sdl_pc = 204;
                        continue;
                    },
                }
            },
            22 => {
                return SDLK_UNKNOWN;
            },
            23 => {
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            24 => {
                if (!shifted_1) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            25 => {
                return normal_default_symbols[scancode -% @as(SDL_Scancode, SDL_SCANCODE_1)];
            },
            26 => {
                return shifted_default_symbols[scancode -% @as(SDL_Scancode, SDL_SCANCODE_1)];
            },
            27 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            28 => {
                return undefined;
            },
            29 => {
                return SDLK_DELETE;
            },
            30 => {
                return SDLK_CAPSLOCK;
            },
            31 => {
                return SDLK_F1;
            },
            32 => {
                return SDLK_F2;
            },
            33 => {
                return SDLK_F3;
            },
            34 => {
                return SDLK_F4;
            },
            35 => {
                return SDLK_F5;
            },
            36 => {
                return SDLK_F6;
            },
            37 => {
                return SDLK_F7;
            },
            38 => {
                return SDLK_F8;
            },
            39 => {
                return SDLK_F9;
            },
            40 => {
                return SDLK_F10;
            },
            41 => {
                return SDLK_F11;
            },
            42 => {
                return SDLK_F12;
            },
            43 => {
                return SDLK_PRINTSCREEN;
            },
            44 => {
                return SDLK_SCROLLLOCK;
            },
            45 => {
                return SDLK_PAUSE;
            },
            46 => {
                return SDLK_INSERT;
            },
            47 => {
                return SDLK_HOME;
            },
            48 => {
                return SDLK_PAGEUP;
            },
            49 => {
                return SDLK_END;
            },
            50 => {
                return SDLK_PAGEDOWN;
            },
            51 => {
                return SDLK_RIGHT;
            },
            52 => {
                return SDLK_LEFT;
            },
            53 => {
                return SDLK_DOWN;
            },
            54 => {
                return SDLK_UP;
            },
            55 => {
                return SDLK_NUMLOCKCLEAR;
            },
            56 => {
                return SDLK_KP_DIVIDE;
            },
            57 => {
                return SDLK_KP_MULTIPLY;
            },
            58 => {
                return SDLK_KP_MINUS;
            },
            59 => {
                return SDLK_KP_PLUS;
            },
            60 => {
                return SDLK_KP_ENTER;
            },
            61 => {
                return SDLK_KP_1;
            },
            62 => {
                return SDLK_KP_2;
            },
            63 => {
                return SDLK_KP_3;
            },
            64 => {
                return SDLK_KP_4;
            },
            65 => {
                return SDLK_KP_5;
            },
            66 => {
                return SDLK_KP_6;
            },
            67 => {
                return SDLK_KP_7;
            },
            68 => {
                return SDLK_KP_8;
            },
            69 => {
                return SDLK_KP_9;
            },
            70 => {
                return SDLK_KP_0;
            },
            71 => {
                return SDLK_KP_PERIOD;
            },
            72 => {
                return SDLK_APPLICATION;
            },
            73 => {
                return SDLK_POWER;
            },
            74 => {
                return SDLK_KP_EQUALS;
            },
            75 => {
                return SDLK_F13;
            },
            76 => {
                return SDLK_F14;
            },
            77 => {
                return SDLK_F15;
            },
            78 => {
                return SDLK_F16;
            },
            79 => {
                return SDLK_F17;
            },
            80 => {
                return SDLK_F18;
            },
            81 => {
                return SDLK_F19;
            },
            82 => {
                return SDLK_F20;
            },
            83 => {
                return SDLK_F21;
            },
            84 => {
                return SDLK_F22;
            },
            85 => {
                return SDLK_F23;
            },
            86 => {
                return SDLK_F24;
            },
            87 => {
                return SDLK_EXECUTE;
            },
            88 => {
                return SDLK_HELP;
            },
            89 => {
                return SDLK_MENU;
            },
            90 => {
                return SDLK_SELECT;
            },
            91 => {
                return SDLK_STOP;
            },
            92 => {
                return SDLK_AGAIN;
            },
            93 => {
                return SDLK_UNDO;
            },
            94 => {
                return SDLK_CUT;
            },
            95 => {
                return SDLK_COPY;
            },
            96 => {
                return SDLK_PASTE;
            },
            97 => {
                return SDLK_FIND;
            },
            98 => {
                return SDLK_MUTE;
            },
            99 => {
                return SDLK_VOLUMEUP;
            },
            100 => {
                return SDLK_VOLUMEDOWN;
            },
            101 => {
                return SDLK_KP_COMMA;
            },
            102 => {
                return SDLK_KP_EQUALSAS400;
            },
            103 => {
                return SDLK_ALTERASE;
            },
            104 => {
                return SDLK_SYSREQ;
            },
            105 => {
                return SDLK_CANCEL;
            },
            106 => {
                return SDLK_CLEAR;
            },
            107 => {
                return SDLK_PRIOR;
            },
            108 => {
                return SDLK_RETURN2;
            },
            109 => {
                return SDLK_SEPARATOR;
            },
            110 => {
                return SDLK_OUT;
            },
            111 => {
                return SDLK_OPER;
            },
            112 => {
                return SDLK_CLEARAGAIN;
            },
            113 => {
                return SDLK_CRSEL;
            },
            114 => {
                return SDLK_EXSEL;
            },
            115 => {
                return SDLK_FRONT;
            },
            116 => {
                return SDLK_KP_00;
            },
            117 => {
                return SDLK_KP_000;
            },
            118 => {
                return SDLK_THOUSANDSSEPARATOR;
            },
            119 => {
                return SDLK_DECIMALSEPARATOR;
            },
            120 => {
                return SDLK_CURRENCYUNIT;
            },
            121 => {
                return SDLK_CURRENCYSUBUNIT;
            },
            122 => {
                return SDLK_KP_LEFTPAREN;
            },
            123 => {
                return SDLK_KP_RIGHTPAREN;
            },
            124 => {
                return SDLK_KP_LEFTBRACE;
            },
            125 => {
                return SDLK_KP_RIGHTBRACE;
            },
            126 => {
                return SDLK_KP_TAB;
            },
            127 => {
                return SDLK_KP_BACKSPACE;
            },
            128 => {
                return SDLK_KP_A;
            },
            129 => {
                return SDLK_KP_B;
            },
            130 => {
                return SDLK_KP_C;
            },
            131 => {
                return SDLK_KP_D;
            },
            132 => {
                return SDLK_KP_E;
            },
            133 => {
                return SDLK_KP_F;
            },
            134 => {
                return SDLK_KP_XOR;
            },
            135 => {
                return SDLK_KP_POWER;
            },
            136 => {
                return SDLK_KP_PERCENT;
            },
            137 => {
                return SDLK_KP_LESS;
            },
            138 => {
                return SDLK_KP_GREATER;
            },
            139 => {
                return SDLK_KP_AMPERSAND;
            },
            140 => {
                return SDLK_KP_DBLAMPERSAND;
            },
            141 => {
                return SDLK_KP_VERTICALBAR;
            },
            142 => {
                return SDLK_KP_DBLVERTICALBAR;
            },
            143 => {
                return SDLK_KP_COLON;
            },
            144 => {
                return SDLK_KP_HASH;
            },
            145 => {
                return SDLK_KP_SPACE;
            },
            146 => {
                return SDLK_KP_AT;
            },
            147 => {
                return SDLK_KP_EXCLAM;
            },
            148 => {
                return SDLK_KP_MEMSTORE;
            },
            149 => {
                return SDLK_KP_MEMRECALL;
            },
            150 => {
                return SDLK_KP_MEMCLEAR;
            },
            151 => {
                return SDLK_KP_MEMADD;
            },
            152 => {
                return SDLK_KP_MEMSUBTRACT;
            },
            153 => {
                return SDLK_KP_MEMMULTIPLY;
            },
            154 => {
                return SDLK_KP_MEMDIVIDE;
            },
            155 => {
                return SDLK_KP_PLUSMINUS;
            },
            156 => {
                return SDLK_KP_CLEAR;
            },
            157 => {
                return SDLK_KP_CLEARENTRY;
            },
            158 => {
                return SDLK_KP_BINARY;
            },
            159 => {
                return SDLK_KP_OCTAL;
            },
            160 => {
                return SDLK_KP_DECIMAL;
            },
            161 => {
                return SDLK_KP_HEXADECIMAL;
            },
            162 => {
                return SDLK_LCTRL;
            },
            163 => {
                return SDLK_LSHIFT;
            },
            164 => {
                return SDLK_LALT;
            },
            165 => {
                return SDLK_LGUI;
            },
            166 => {
                return SDLK_RCTRL;
            },
            167 => {
                return SDLK_RSHIFT;
            },
            168 => {
                return SDLK_RALT;
            },
            169 => {
                return SDLK_RGUI;
            },
            170 => {
                return SDLK_MODE;
            },
            171 => {
                return SDLK_SLEEP;
            },
            172 => {
                return SDLK_WAKE;
            },
            173 => {
                return SDLK_CHANNEL_INCREMENT;
            },
            174 => {
                return SDLK_CHANNEL_DECREMENT;
            },
            175 => {
                return SDLK_MEDIA_PLAY;
            },
            176 => {
                return SDLK_MEDIA_PAUSE;
            },
            177 => {
                return SDLK_MEDIA_RECORD;
            },
            178 => {
                return SDLK_MEDIA_FAST_FORWARD;
            },
            179 => {
                return SDLK_MEDIA_REWIND;
            },
            180 => {
                return SDLK_MEDIA_NEXT_TRACK;
            },
            181 => {
                return SDLK_MEDIA_PREVIOUS_TRACK;
            },
            182 => {
                return SDLK_MEDIA_STOP;
            },
            183 => {
                return SDLK_MEDIA_EJECT;
            },
            184 => {
                return SDLK_MEDIA_PLAY_PAUSE;
            },
            185 => {
                return SDLK_MEDIA_SELECT;
            },
            186 => {
                return SDLK_AC_NEW;
            },
            187 => {
                return SDLK_AC_OPEN;
            },
            188 => {
                return SDLK_AC_CLOSE;
            },
            189 => {
                return SDLK_AC_EXIT;
            },
            190 => {
                return SDLK_AC_SAVE;
            },
            191 => {
                return SDLK_AC_PRINT;
            },
            192 => {
                return SDLK_AC_PROPERTIES;
            },
            193 => {
                return SDLK_AC_SEARCH;
            },
            194 => {
                return SDLK_AC_HOME;
            },
            195 => {
                return SDLK_AC_BACK;
            },
            196 => {
                return SDLK_AC_FORWARD;
            },
            197 => {
                return SDLK_AC_STOP;
            },
            198 => {
                return SDLK_AC_REFRESH;
            },
            199 => {
                return SDLK_AC_BOOKMARKS;
            },
            200 => {
                return SDLK_SOFTLEFT;
            },
            201 => {
                return SDLK_SOFTRIGHT;
            },
            202 => {
                return SDLK_CALL;
            },
            203 => {
                return SDLK_ENDCALL;
            },
            204 => {
                return SDLK_UNKNOWN;
            },
            else => unreachable,
        }
    }
}
pub fn SDL_GetDefaultScancodeFromKey(arg_key: SDL_Keycode, modstate: [*c]SDL_Keymod) callconv(.c) SDL_Scancode {
    @setEvalBranchQuota(100000);
    var key = arg_key;
    _ = &key;
    if (modstate != null) {
        modstate.* = SDL_KMOD_NONE;
    }
    if (key == SDLK_UNKNOWN) {
        return SDL_SCANCODE_UNKNOWN;
    }
    if ((key & (@as(c_uint, 1) << @intCast(@as(c_uint, 29)))) != 0) {
        {
            var i: c_int = 0;
            _ = &i;
            while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(extended_default_symbols)) / @sizeOf(@TypeOf(extended_default_symbols[@as(c_int, 0)])))) : (i += 1) {
                if (extended_default_symbols[@bitCast(@as(isize, @intCast(i)))].keycode == key) {
                    return extended_default_symbols[@bitCast(@as(isize, @intCast(i)))].scancode;
                }
            }
        }
        return SDL_SCANCODE_UNKNOWN;
    }
    if ((key & (@as(c_uint, 1) << @intCast(@as(c_uint, 30)))) != 0) {
        return key & ~(@as(c_uint, 1) << @intCast(@as(c_uint, 30)));
    }
    if ((key >= SDLK_A) and (key <= SDLK_Z)) {
        return (@as(SDL_Keycode, SDL_SCANCODE_A) +% key) -% SDLK_A;
    }
    if ((key >= @as(SDL_Keycode, 'A')) and (key <= @as(SDL_Keycode, 'Z'))) {
        if (modstate != null) {
            modstate.* = @truncate(SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT);
        }
        return (@as(SDL_Keycode, SDL_SCANCODE_A) +% key) -% @as(SDL_Keycode, 'A');
    }
    {
        var i: c_int = 0;
        _ = &i;
        while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(normal_default_symbols)) / @sizeOf(@TypeOf(normal_default_symbols[@as(c_int, 0)])))) : (i += 1) {
            if (key == normal_default_symbols[@bitCast(@as(isize, @intCast(i)))]) {
                return @bitCast(SDL_SCANCODE_1 + i);
            }
        }
    }
    {
        var i: c_int = 0;
        _ = &i;
        while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(shifted_default_symbols)) / @sizeOf(@TypeOf(shifted_default_symbols[@as(c_int, 0)])))) : (i += 1) {
            if (key == shifted_default_symbols[@bitCast(@as(isize, @intCast(i)))]) {
                if (modstate != null) {
                    modstate.* = @truncate(SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT);
                }
                return @bitCast(SDL_SCANCODE_1 + i);
            }
        }
    }
    if (key == SDLK_DELETE) {
        return SDL_SCANCODE_DELETE;
    }
    return SDL_SCANCODE_UNKNOWN;
}
pub var SDL_scancode_names: [512][*c]const u8 = [291][*c]const u8{
    null,
    null,
    null,
    null,
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "0",
    "Return",
    "Escape",
    "Backspace",
    "Tab",
    "Space",
    "-",
    "=",
    "[",
    "]",
    "\\",
    "#",
    ";",
    "'",
    "`",
    ",",
    ".",
    "/",
    "CapsLock",
    "F1",
    "F2",
    "F3",
    "F4",
    "F5",
    "F6",
    "F7",
    "F8",
    "F9",
    "F10",
    "F11",
    "F12",
    "PrintScreen",
    "ScrollLock",
    "Pause",
    "Insert",
    "Home",
    "PageUp",
    "Delete",
    "End",
    "PageDown",
    "Right",
    "Left",
    "Down",
    "Up",
    "Numlock",
    "Keypad /",
    "Keypad *",
    "Keypad -",
    "Keypad +",
    "Keypad Enter",
    "Keypad 1",
    "Keypad 2",
    "Keypad 3",
    "Keypad 4",
    "Keypad 5",
    "Keypad 6",
    "Keypad 7",
    "Keypad 8",
    "Keypad 9",
    "Keypad 0",
    "Keypad .",
    "NonUSBackslash",
    "Application",
    "Power",
    "Keypad =",
    "F13",
    "F14",
    "F15",
    "F16",
    "F17",
    "F18",
    "F19",
    "F20",
    "F21",
    "F22",
    "F23",
    "F24",
    "Execute",
    "Help",
    "Menu",
    "Select",
    "Stop",
    "Again",
    "Undo",
    "Cut",
    "Copy",
    "Paste",
    "Find",
    "Mute",
    "VolumeUp",
    "VolumeDown",
    null,
    null,
    null,
    "Keypad ,",
    "Keypad = (AS400)",
    "International 1",
    "International 2",
    "International 3",
    "International 4",
    "International 5",
    "International 6",
    "International 7",
    "International 8",
    "International 9",
    "Language 1",
    "Language 2",
    "Language 3",
    "Language 4",
    "Language 5",
    "Language 6",
    "Language 7",
    "Language 8",
    "Language 9",
    "AltErase",
    "SysReq",
    "Cancel",
    "Clear",
    "Prior",
    "Return",
    "Separator",
    "Out",
    "Oper",
    "Clear / Again",
    "CrSel",
    "ExSel",
    "Front",
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    "Keypad 00",
    "Keypad 000",
    "ThousandsSeparator",
    "DecimalSeparator",
    "CurrencyUnit",
    "CurrencySubUnit",
    "Keypad (",
    "Keypad )",
    "Keypad {",
    "Keypad }",
    "Keypad Tab",
    "Keypad Backspace",
    "Keypad A",
    "Keypad B",
    "Keypad C",
    "Keypad D",
    "Keypad E",
    "Keypad F",
    "Keypad XOR",
    "Keypad ^",
    "Keypad %",
    "Keypad <",
    "Keypad >",
    "Keypad &",
    "Keypad &&",
    "Keypad |",
    "Keypad ||",
    "Keypad :",
    "Keypad #",
    "Keypad Space",
    "Keypad @",
    "Keypad !",
    "Keypad MemStore",
    "Keypad MemRecall",
    "Keypad MemClear",
    "Keypad MemAdd",
    "Keypad MemSubtract",
    "Keypad MemMultiply",
    "Keypad MemDivide",
    "Keypad +/-",
    "Keypad Clear",
    "Keypad ClearEntry",
    "Keypad Binary",
    "Keypad Octal",
    "Keypad Decimal",
    "Keypad Hexadecimal",
    null,
    null,
    "Left Ctrl",
    "Left Shift",
    "Left Alt",
    "Left GUI",
    "Right Ctrl",
    "Right Shift",
    "Right Alt",
    "Right GUI",
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    "ModeSwitch",
    "Sleep",
    "Wake",
    "ChannelUp",
    "ChannelDown",
    "MediaPlay",
    "MediaPause",
    "MediaRecord",
    "MediaFastForward",
    "MediaRewind",
    "MediaTrackNext",
    "MediaTrackPrevious",
    "MediaStop",
    "Eject",
    "MediaPlayPause",
    "MediaSelect",
    "AC New",
    "AC Open",
    "AC Close",
    "AC Exit",
    "AC Save",
    "AC Print",
    "AC Properties",
    "AC Search",
    "AC Home",
    "AC Back",
    "AC Forward",
    "AC Stop",
    "AC Refresh",
    "AC Bookmarks",
    "SoftLeft",
    "SoftRight",
    "Call",
    "EndCall",
} ++ @as([221][*c]const u8, @splat(null));
pub var SDL_extended_key_names: [7][*c]const u8 = [7][*c]const u8{
    "LeftTab",
    "Level5Shift",
    "MultiKeyCompose",
    "Left Meta",
    "Right Meta",
    "Left Hyper",
    "Right Hyper",
};
pub export fn SDL_SetScancodeName_REAL(arg_scancode: SDL_Scancode, name: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    var scancode = arg_scancode;
    _ = &scancode;
    if ((@as(c_int, @bitCast(scancode)) < SDL_SCANCODE_UNKNOWN) or (scancode >= @as(SDL_Scancode, SDL_SCANCODE_COUNT))) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("scancode"))));
    }
    SDL_scancode_names[scancode] = name;
    return @"true" != 0;
}
pub export fn SDL_GetScancodeName_REAL(arg_scancode: SDL_Scancode) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var scancode = arg_scancode;
    _ = &scancode;
    var name: [*c]const u8 = undefined;
    _ = &name;
    if ((@as(c_int, @bitCast(scancode)) < SDL_SCANCODE_UNKNOWN) or (scancode >= @as(SDL_Scancode, SDL_SCANCODE_COUNT))) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("scancode"))));
        return "";
    }
    name = SDL_scancode_names[scancode];
    if (!(name != null)) {
        name = "";
    }
    return name;
}
pub export fn SDL_GetScancodeFromName_REAL(name: [*c]const u8) SDL_Scancode {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    if (!(name != null) or !(@as(c_int, name.*) != 0)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("name"))));
        return SDL_SCANCODE_UNKNOWN;
    }
    {
        i = 0;
        while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(SDL_scancode_names)) / @sizeOf(@TypeOf(SDL_scancode_names[@as(c_int, 0)])))) : (i += 1) {
            if (!(SDL_scancode_names[@bitCast(@as(isize, @intCast(i)))] != null)) {
                continue;
            }
            if (SDL_strcasecmp_REAL(name, SDL_scancode_names[@bitCast(@as(isize, @intCast(i)))]) == @as(c_int, 0)) {
                return @bitCast(i);
            }
        }
    }
    _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("name"))));
    return SDL_SCANCODE_UNKNOWN;
}
pub export fn SDL_GetKeyName_REAL(arg_key: SDL_Keycode) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var key = arg_key;
    _ = &key;
    var idx: SDL_Keycode = undefined;
    _ = &idx;
    var keymap: [*c]SDL_Keymap = undefined;
    _ = &keymap;
    var modstate: SDL_Keymod = undefined;
    _ = &modstate;
    var scancode: SDL_Scancode = undefined;
    _ = &scancode;
    var capital: SDL_Keycode = undefined;
    _ = &capital;
    var folded: [3]Uint32 = undefined;
    _ = &folded;
    var name: [8]u8 = undefined;
    _ = &name;
    var end: [*c]u8 = undefined;
    _ = &end;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if ((key & (@as(c_uint, 1) << @intCast(@as(c_uint, 30)))) != 0) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return SDL_GetScancodeName_REAL(key & ~(@as(c_uint, 1) << @intCast(@as(c_uint, 30))));
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                if ((key & (@as(c_uint, 1) << @intCast(@as(c_uint, 29)))) != 0) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                idx = key & ~(@as(c_uint, 1) << @intCast(@as(c_uint, 29)));
                if ((idx > @as(SDL_Keycode, 0)) and (@as(c_ulong, idx -% @as(SDL_Keycode, 1)) < (@sizeOf(@TypeOf(SDL_extended_key_names)) / @sizeOf(@TypeOf(SDL_extended_key_names[@as(c_int, 0)]))))) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
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
                switch (key) {
                    SDLK_RETURN => {
                        sdl_pc = 11;
                        continue;
                    },
                    SDLK_ESCAPE => {
                        sdl_pc = 12;
                        continue;
                    },
                    SDLK_BACKSPACE => {
                        sdl_pc = 13;
                        continue;
                    },
                    SDLK_TAB => {
                        sdl_pc = 14;
                        continue;
                    },
                    SDLK_SPACE => {
                        sdl_pc = 15;
                        continue;
                    },
                    SDLK_DELETE => {
                        sdl_pc = 16;
                        continue;
                    },
                    else => {
                        sdl_pc = 17;
                        continue;
                    },
                }
            },
            7 => {
                return SDL_extended_key_names[idx -% @as(SDL_Keycode, 1)];
            },
            8 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("key"))));
                return "";
            },
            10 => {
                return undefined;
            },
            11 => {
                return SDL_GetScancodeName_REAL(SDL_SCANCODE_RETURN);
            },
            12 => {
                return SDL_GetScancodeName_REAL(SDL_SCANCODE_ESCAPE);
            },
            13 => {
                return SDL_GetScancodeName_REAL(SDL_SCANCODE_BACKSPACE);
            },
            14 => {
                return SDL_GetScancodeName_REAL(SDL_SCANCODE_TAB);
            },
            15 => {
                return SDL_GetScancodeName_REAL(SDL_SCANCODE_SPACE);
            },
            16 => {
                return SDL_GetScancodeName_REAL(SDL_SCANCODE_DELETE);
            },
            17 => {
                if (((key >= @as(SDL_Keycode, 'a')) and (key <= @as(SDL_Keycode, 'z'))) or (((key > @as(SDL_Keycode, 191)) and (key != @as(SDL_Keycode, 215))) and (key != @as(SDL_Keycode, 247)))) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            18 => {
                keymap = SDL_GetCurrentKeymap(@"false" != 0);
                scancode = SDL_GetKeymapScancode(keymap, key, &modstate);
                if ((scancode != @as(SDL_Scancode, SDL_SCANCODE_UNKNOWN)) and !((@as(c_uint, @bitCast(@as(c_int, @as(c_int, modstate)))) & ((SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT) | SDL_KMOD_LEVEL5)) != 0)) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            19 => {
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            20 => {
                end = SDL_UCS4ToUTF8_REAL(key, @ptrCast(@alignCast(&name)));
                end.* = '\x00';
                return SDL_GetPersistentString(@ptrCast(@alignCast(&name)));
            },
            21 => {
                capital = SDL_GetKeymapKeycode(keymap, scancode, @truncate((SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT) | (@as(c_uint, @bitCast(@as(c_int, @as(c_int, modstate)))) & SDL_KMOD_MODE)));
                if (key != capital) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            22 => {
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            23 => {
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            24 => {
                if ((SDL_CaseFoldUnicode(capital, @ptrCast(@alignCast(&folded))) == @as(c_int, 1)) and (folded[@as(c_int, 0)] == key)) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            25 => {
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            26 => {
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            27 => {
                key = capital;
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            28 => {
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            29 => {
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_GetKeyFromName_REAL(name: [*c]const u8) SDL_Keycode {
    @setEvalBranchQuota(100000);
    const uppercase: bool = @"true" != 0;
    _ = &uppercase;
    var key: SDL_Keycode = undefined;
    _ = &key;
    if (!(name != null)) {
        return SDLK_UNKNOWN;
    }
    key = @as([*c]const u8, @ptrCast(@alignCast(name))).*;
    if (key >= @as(SDL_Keycode, 240)) {
        if (SDL_strlen_REAL(name) == @as(usize, 4)) {
            var i: c_int = 0;
            _ = &i;
            key = @bitCast(@as(c_int, @as(c_int, @as(Uint16, @bitCast(@as(c_short, @truncate(@as(c_int, name[@bitCast(@as(isize, @intCast(i)))]) & @as(c_int, 7)))))) << @intCast(@as(c_int, 18))));
            key |= @bitCast(@as(c_int, @as(c_int, @as(Uint16, @bitCast(@as(c_short, @truncate(@as(c_int, name[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &i;
                    ref.* += 1;
                    break :blk ref.*;
                })))
            ]) & @as(c_int, 63)))))) << @intCast(@as(c_int, 12))));
            key |= @bitCast(@as(c_int, @as(c_int, @as(Uint16, @bitCast(@as(c_short, @truncate(@as(c_int, name[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &i;
                    ref.* += 1;
                    break :blk ref.*;
                })))
            ]) & @as(c_int, 63)))))) << @intCast(@as(c_int, 6))));
            key |= @bitCast(@as(c_int, @as(c_int, @as(Uint16, @bitCast(@as(c_short, @truncate(@as(c_int, name[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &i;
                    ref.* += 1;
                    break :blk ref.*;
                })))
            ]) & @as(c_int, 63))))))));
        } else {
            key = SDLK_UNKNOWN;
        }
    } else if (key >= @as(SDL_Keycode, 224)) {
        if (SDL_strlen_REAL(name) == @as(usize, 3)) {
            var i: c_int = 0;
            _ = &i;
            key = @bitCast(@as(c_int, @as(c_int, @as(Uint16, @bitCast(@as(c_short, @truncate(@as(c_int, name[@bitCast(@as(isize, @intCast(i)))]) & @as(c_int, 15)))))) << @intCast(@as(c_int, 12))));
            key |= @bitCast(@as(c_int, @as(c_int, @as(Uint16, @bitCast(@as(c_short, @truncate(@as(c_int, name[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &i;
                    ref.* += 1;
                    break :blk ref.*;
                })))
            ]) & @as(c_int, 63)))))) << @intCast(@as(c_int, 6))));
            key |= @bitCast(@as(c_int, @as(c_int, @as(Uint16, @bitCast(@as(c_short, @truncate(@as(c_int, name[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &i;
                    ref.* += 1;
                    break :blk ref.*;
                })))
            ]) & @as(c_int, 63))))))));
        } else {
            key = SDLK_UNKNOWN;
        }
    } else if (key >= @as(SDL_Keycode, 192)) {
        if (SDL_strlen_REAL(name) == @as(usize, 2)) {
            var i: c_int = 0;
            _ = &i;
            key = @bitCast(@as(c_int, @as(c_int, @as(Uint16, @bitCast(@as(c_short, @truncate(@as(c_int, name[@bitCast(@as(isize, @intCast(i)))]) & @as(c_int, 31)))))) << @intCast(@as(c_int, 6))));
            key |= @bitCast(@as(c_int, @as(c_int, @as(Uint16, @bitCast(@as(c_short, @truncate(@as(c_int, name[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &i;
                    ref.* += 1;
                    break :blk ref.*;
                })))
            ]) & @as(c_int, 63))))))));
        } else {
            key = SDLK_UNKNOWN;
        }
    } else {
        if (SDL_strlen_REAL(name) != @as(usize, 1)) {
            key = SDLK_UNKNOWN;
        }
    }
    if (key != SDLK_UNKNOWN) {
        if (uppercase) {
            var keymap: [*c]SDL_Keymap = SDL_GetCurrentKeymap(@"false" != 0);
            _ = &keymap;
            var modstate: SDL_Keymod = undefined;
            _ = &modstate;
            var scancode: SDL_Scancode = SDL_GetKeymapScancode(keymap, key, &modstate);
            _ = &scancode;
            if ((@as(c_uint, @bitCast(@as(c_int, @intFromBool(scancode != @as(SDL_Scancode, SDL_SCANCODE_UNKNOWN))))) != 0) and ((@as(c_uint, @bitCast(@as(c_int, @as(c_int, modstate)))) & ((SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT) | SDL_KMOD_CAPS)) != 0)) {
                key = SDL_GetKeymapKeycode(keymap, scancode, SDL_KMOD_NONE);
            }
        }
        return key;
    }
    {
        var i: SDL_Keycode = 0;
        _ = &i;
        while (@as(c_ulong, i) < (@sizeOf(@TypeOf(SDL_extended_key_names)) / @sizeOf(@TypeOf(SDL_extended_key_names[@as(c_int, 0)])))) : (i +%= 1) {
            if (SDL_strcasecmp_REAL(name, SDL_extended_key_names[i]) == @as(c_int, 0)) {
                return (i +% @as(SDL_Keycode, 1)) | (@as(c_uint, 1) << @intCast(@as(c_uint, 29)));
            }
        }
    }
    return SDL_GetKeyFromScancode_REAL(SDL_GetScancodeFromName_REAL(name), SDL_KMOD_NONE, @"false" != 0);
}
pub export fn SDL_GetKeymapFlags(keymap: [*c]SDL_Keymap) Uint32 {
    @setEvalBranchQuota(100000);
    if (keymap != null) {
        return keymap.*.flags;
    }
    return 0;
}
pub export fn SDL_DetermineKeymapLayout(keymap: [*c]SDL_Keymap) void {
    @setEvalBranchQuota(100000);
    if ((keymap != null) and !((keymap.*.flags & @as(Uint32, SDL_KEYMAP_LAYOUT_DETERMINED)) != 0)) {
        keymap.*.flags |= SDL_KEYMAP_LAYOUT_DETERMINED;
        keymap.*.flags |= SDL_KEYMAP_FRENCH_NUMBERS;
        {
            var i: c_int = SDL_SCANCODE_1;
            _ = &i;
            while (i <= SDL_SCANCODE_0) : (i += 1) {
                if ((SDL_isdigit_REAL(@bitCast(@as(c_uint, @truncate(SDL_GetKeymapKeycode(keymap, @bitCast(i), SDL_KMOD_NONE))))) != 0) or !(SDL_isdigit_REAL(@bitCast(@as(c_uint, @truncate(SDL_GetKeymapKeycode(keymap, @bitCast(i), @truncate(SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT)))))) != 0)) {
                    keymap.*.flags &= @bitCast(@as(c_int, ~SDL_KEYMAP_FRENCH_NUMBERS));
                    break;
                }
            }
        }
        {
            var i: c_int = SDL_SCANCODE_A;
            _ = &i;
            while (i <= SDL_SCANCODE_D) : (i += 1) {
                const key: SDL_Keycode = SDL_GetKeymapKeycode(keymap, @bitCast(i), SDL_KMOD_NONE);
                _ = &key;
                if (key <= @as(SDL_Keycode, 255)) {
                    keymap.*.flags |= SDL_KEYMAP_LATIN_LETTERS;
                    break;
                }
                if ((key >= @as(SDL_Keycode, 3584)) and (key <= @as(SDL_Keycode, 3711))) {
                    keymap.*.flags |= SDL_KEYMAP_THAI_KEYBOARD;
                    break;
                }
            }
        }
    }
}

pub const SDL_GetKeyFromName = SDL_GetKeyFromName_REAL;
pub const SDL_GetKeyName = SDL_GetKeyName_REAL;
pub const SDL_GetScancodeFromName = SDL_GetScancodeFromName_REAL;
pub const SDL_GetScancodeName = SDL_GetScancodeName_REAL;
pub const SDL_SetScancodeName = SDL_SetScancodeName_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDLK_UNKNOWN = @as(c_uint, 0x00000000);
pub const SDLK_RETURN = @as(c_uint, 0x0000000d);
pub const SDLK_ESCAPE = @as(c_uint, 0x0000001b);
pub const SDLK_BACKSPACE = @as(c_uint, 0x00000008);
pub const SDLK_TAB = @as(c_uint, 0x00000009);
pub const SDLK_SPACE = @as(c_uint, 0x00000020);
pub const SDLK_EXCLAIM = @as(c_uint, 0x00000021);
pub const SDLK_DBLAPOSTROPHE = @as(c_uint, 0x00000022);
pub const SDLK_HASH = @as(c_uint, 0x00000023);
pub const SDLK_DOLLAR = @as(c_uint, 0x00000024);
pub const SDLK_PERCENT = @as(c_uint, 0x00000025);
pub const SDLK_AMPERSAND = @as(c_uint, 0x00000026);
pub const SDLK_APOSTROPHE = @as(c_uint, 0x00000027);
pub const SDLK_LEFTPAREN = @as(c_uint, 0x00000028);
pub const SDLK_RIGHTPAREN = @as(c_uint, 0x00000029);
pub const SDLK_ASTERISK = @as(c_uint, 0x0000002a);
pub const SDLK_PLUS = @as(c_uint, 0x0000002b);
pub const SDLK_COMMA = @as(c_uint, 0x0000002c);
pub const SDLK_MINUS = @as(c_uint, 0x0000002d);
pub const SDLK_PERIOD = @as(c_uint, 0x0000002e);
pub const SDLK_SLASH = @as(c_uint, 0x0000002f);
pub const SDLK_0 = @as(c_uint, 0x00000030);
pub const SDLK_1 = @as(c_uint, 0x00000031);
pub const SDLK_2 = @as(c_uint, 0x00000032);
pub const SDLK_3 = @as(c_uint, 0x00000033);
pub const SDLK_4 = @as(c_uint, 0x00000034);
pub const SDLK_5 = @as(c_uint, 0x00000035);
pub const SDLK_6 = @as(c_uint, 0x00000036);
pub const SDLK_7 = @as(c_uint, 0x00000037);
pub const SDLK_8 = @as(c_uint, 0x00000038);
pub const SDLK_9 = @as(c_uint, 0x00000039);
pub const SDLK_COLON = @as(c_uint, 0x0000003a);
pub const SDLK_SEMICOLON = @as(c_uint, 0x0000003b);
pub const SDLK_LESS = @as(c_uint, 0x0000003c);
pub const SDLK_EQUALS = @as(c_uint, 0x0000003d);
pub const SDLK_GREATER = @as(c_uint, 0x0000003e);
pub const SDLK_QUESTION = @as(c_uint, 0x0000003f);
pub const SDLK_AT = @as(c_uint, 0x00000040);
pub const SDLK_LEFTBRACKET = @as(c_uint, 0x0000005b);
pub const SDLK_BACKSLASH = @as(c_uint, 0x0000005c);
pub const SDLK_RIGHTBRACKET = @as(c_uint, 0x0000005d);
pub const SDLK_CARET = @as(c_uint, 0x0000005e);
pub const SDLK_UNDERSCORE = @as(c_uint, 0x0000005f);
pub const SDLK_GRAVE = @as(c_uint, 0x00000060);
pub const SDLK_A = @as(c_uint, 0x00000061);
pub const SDLK_Z = @as(c_uint, 0x0000007a);
pub const SDLK_LEFTBRACE = @as(c_uint, 0x0000007b);
pub const SDLK_PIPE = @as(c_uint, 0x0000007c);
pub const SDLK_RIGHTBRACE = @as(c_uint, 0x0000007d);
pub const SDLK_TILDE = @as(c_uint, 0x0000007e);
pub const SDLK_DELETE = @as(c_uint, 0x0000007f);
pub const SDLK_CAPSLOCK = __helpers.promoteIntLiteral(c_uint, 0x40000039, .hex);
pub const SDLK_F1 = __helpers.promoteIntLiteral(c_uint, 0x4000003a, .hex);
pub const SDLK_F2 = __helpers.promoteIntLiteral(c_uint, 0x4000003b, .hex);
pub const SDLK_F3 = __helpers.promoteIntLiteral(c_uint, 0x4000003c, .hex);
pub const SDLK_F4 = __helpers.promoteIntLiteral(c_uint, 0x4000003d, .hex);
pub const SDLK_F5 = __helpers.promoteIntLiteral(c_uint, 0x4000003e, .hex);
pub const SDLK_F6 = __helpers.promoteIntLiteral(c_uint, 0x4000003f, .hex);
pub const SDLK_F7 = __helpers.promoteIntLiteral(c_uint, 0x40000040, .hex);
pub const SDLK_F8 = __helpers.promoteIntLiteral(c_uint, 0x40000041, .hex);
pub const SDLK_F9 = __helpers.promoteIntLiteral(c_uint, 0x40000042, .hex);
pub const SDLK_F10 = __helpers.promoteIntLiteral(c_uint, 0x40000043, .hex);
pub const SDLK_F11 = __helpers.promoteIntLiteral(c_uint, 0x40000044, .hex);
pub const SDLK_F12 = __helpers.promoteIntLiteral(c_uint, 0x40000045, .hex);
pub const SDLK_PRINTSCREEN = __helpers.promoteIntLiteral(c_uint, 0x40000046, .hex);
pub const SDLK_SCROLLLOCK = __helpers.promoteIntLiteral(c_uint, 0x40000047, .hex);
pub const SDLK_PAUSE = __helpers.promoteIntLiteral(c_uint, 0x40000048, .hex);
pub const SDLK_INSERT = __helpers.promoteIntLiteral(c_uint, 0x40000049, .hex);
pub const SDLK_HOME = __helpers.promoteIntLiteral(c_uint, 0x4000004a, .hex);
pub const SDLK_PAGEUP = __helpers.promoteIntLiteral(c_uint, 0x4000004b, .hex);
pub const SDLK_END = __helpers.promoteIntLiteral(c_uint, 0x4000004d, .hex);
pub const SDLK_PAGEDOWN = __helpers.promoteIntLiteral(c_uint, 0x4000004e, .hex);
pub const SDLK_RIGHT = __helpers.promoteIntLiteral(c_uint, 0x4000004f, .hex);
pub const SDLK_LEFT = __helpers.promoteIntLiteral(c_uint, 0x40000050, .hex);
pub const SDLK_DOWN = __helpers.promoteIntLiteral(c_uint, 0x40000051, .hex);
pub const SDLK_UP = __helpers.promoteIntLiteral(c_uint, 0x40000052, .hex);
pub const SDLK_NUMLOCKCLEAR = __helpers.promoteIntLiteral(c_uint, 0x40000053, .hex);
pub const SDLK_KP_DIVIDE = __helpers.promoteIntLiteral(c_uint, 0x40000054, .hex);
pub const SDLK_KP_MULTIPLY = __helpers.promoteIntLiteral(c_uint, 0x40000055, .hex);
pub const SDLK_KP_MINUS = __helpers.promoteIntLiteral(c_uint, 0x40000056, .hex);
pub const SDLK_KP_PLUS = __helpers.promoteIntLiteral(c_uint, 0x40000057, .hex);
pub const SDLK_KP_ENTER = __helpers.promoteIntLiteral(c_uint, 0x40000058, .hex);
pub const SDLK_KP_1 = __helpers.promoteIntLiteral(c_uint, 0x40000059, .hex);
pub const SDLK_KP_2 = __helpers.promoteIntLiteral(c_uint, 0x4000005a, .hex);
pub const SDLK_KP_3 = __helpers.promoteIntLiteral(c_uint, 0x4000005b, .hex);
pub const SDLK_KP_4 = __helpers.promoteIntLiteral(c_uint, 0x4000005c, .hex);
pub const SDLK_KP_5 = __helpers.promoteIntLiteral(c_uint, 0x4000005d, .hex);
pub const SDLK_KP_6 = __helpers.promoteIntLiteral(c_uint, 0x4000005e, .hex);
pub const SDLK_KP_7 = __helpers.promoteIntLiteral(c_uint, 0x4000005f, .hex);
pub const SDLK_KP_8 = __helpers.promoteIntLiteral(c_uint, 0x40000060, .hex);
pub const SDLK_KP_9 = __helpers.promoteIntLiteral(c_uint, 0x40000061, .hex);
pub const SDLK_KP_0 = __helpers.promoteIntLiteral(c_uint, 0x40000062, .hex);
pub const SDLK_KP_PERIOD = __helpers.promoteIntLiteral(c_uint, 0x40000063, .hex);
pub const SDLK_APPLICATION = __helpers.promoteIntLiteral(c_uint, 0x40000065, .hex);
pub const SDLK_POWER = __helpers.promoteIntLiteral(c_uint, 0x40000066, .hex);
pub const SDLK_KP_EQUALS = __helpers.promoteIntLiteral(c_uint, 0x40000067, .hex);
pub const SDLK_F13 = __helpers.promoteIntLiteral(c_uint, 0x40000068, .hex);
pub const SDLK_F14 = __helpers.promoteIntLiteral(c_uint, 0x40000069, .hex);
pub const SDLK_F15 = __helpers.promoteIntLiteral(c_uint, 0x4000006a, .hex);
pub const SDLK_F16 = __helpers.promoteIntLiteral(c_uint, 0x4000006b, .hex);
pub const SDLK_F17 = __helpers.promoteIntLiteral(c_uint, 0x4000006c, .hex);
pub const SDLK_F18 = __helpers.promoteIntLiteral(c_uint, 0x4000006d, .hex);
pub const SDLK_F19 = __helpers.promoteIntLiteral(c_uint, 0x4000006e, .hex);
pub const SDLK_F20 = __helpers.promoteIntLiteral(c_uint, 0x4000006f, .hex);
pub const SDLK_F21 = __helpers.promoteIntLiteral(c_uint, 0x40000070, .hex);
pub const SDLK_F22 = __helpers.promoteIntLiteral(c_uint, 0x40000071, .hex);
pub const SDLK_F23 = __helpers.promoteIntLiteral(c_uint, 0x40000072, .hex);
pub const SDLK_F24 = __helpers.promoteIntLiteral(c_uint, 0x40000073, .hex);
pub const SDLK_EXECUTE = __helpers.promoteIntLiteral(c_uint, 0x40000074, .hex);
pub const SDLK_HELP = __helpers.promoteIntLiteral(c_uint, 0x40000075, .hex);
pub const SDLK_MENU = __helpers.promoteIntLiteral(c_uint, 0x40000076, .hex);
pub const SDLK_SELECT = __helpers.promoteIntLiteral(c_uint, 0x40000077, .hex);
pub const SDLK_STOP = __helpers.promoteIntLiteral(c_uint, 0x40000078, .hex);
pub const SDLK_AGAIN = __helpers.promoteIntLiteral(c_uint, 0x40000079, .hex);
pub const SDLK_UNDO = __helpers.promoteIntLiteral(c_uint, 0x4000007a, .hex);
pub const SDLK_CUT = __helpers.promoteIntLiteral(c_uint, 0x4000007b, .hex);
pub const SDLK_COPY = __helpers.promoteIntLiteral(c_uint, 0x4000007c, .hex);
pub const SDLK_PASTE = __helpers.promoteIntLiteral(c_uint, 0x4000007d, .hex);
pub const SDLK_FIND = __helpers.promoteIntLiteral(c_uint, 0x4000007e, .hex);
pub const SDLK_MUTE = __helpers.promoteIntLiteral(c_uint, 0x4000007f, .hex);
pub const SDLK_VOLUMEUP = __helpers.promoteIntLiteral(c_uint, 0x40000080, .hex);
pub const SDLK_VOLUMEDOWN = __helpers.promoteIntLiteral(c_uint, 0x40000081, .hex);
pub const SDLK_KP_COMMA = __helpers.promoteIntLiteral(c_uint, 0x40000085, .hex);
pub const SDLK_KP_EQUALSAS400 = __helpers.promoteIntLiteral(c_uint, 0x40000086, .hex);
pub const SDLK_ALTERASE = __helpers.promoteIntLiteral(c_uint, 0x40000099, .hex);
pub const SDLK_SYSREQ = __helpers.promoteIntLiteral(c_uint, 0x4000009a, .hex);
pub const SDLK_CANCEL = __helpers.promoteIntLiteral(c_uint, 0x4000009b, .hex);
pub const SDLK_CLEAR = __helpers.promoteIntLiteral(c_uint, 0x4000009c, .hex);
pub const SDLK_PRIOR = __helpers.promoteIntLiteral(c_uint, 0x4000009d, .hex);
pub const SDLK_RETURN2 = __helpers.promoteIntLiteral(c_uint, 0x4000009e, .hex);
pub const SDLK_SEPARATOR = __helpers.promoteIntLiteral(c_uint, 0x4000009f, .hex);
pub const SDLK_OUT = __helpers.promoteIntLiteral(c_uint, 0x400000a0, .hex);
pub const SDLK_OPER = __helpers.promoteIntLiteral(c_uint, 0x400000a1, .hex);
pub const SDLK_CLEARAGAIN = __helpers.promoteIntLiteral(c_uint, 0x400000a2, .hex);
pub const SDLK_CRSEL = __helpers.promoteIntLiteral(c_uint, 0x400000a3, .hex);
pub const SDLK_EXSEL = __helpers.promoteIntLiteral(c_uint, 0x400000a4, .hex);
pub const SDLK_FRONT = __helpers.promoteIntLiteral(c_uint, 0x400000a5, .hex);
pub const SDLK_KP_00 = __helpers.promoteIntLiteral(c_uint, 0x400000b0, .hex);
pub const SDLK_KP_000 = __helpers.promoteIntLiteral(c_uint, 0x400000b1, .hex);
pub const SDLK_THOUSANDSSEPARATOR = __helpers.promoteIntLiteral(c_uint, 0x400000b2, .hex);
pub const SDLK_DECIMALSEPARATOR = __helpers.promoteIntLiteral(c_uint, 0x400000b3, .hex);
pub const SDLK_CURRENCYUNIT = __helpers.promoteIntLiteral(c_uint, 0x400000b4, .hex);
pub const SDLK_CURRENCYSUBUNIT = __helpers.promoteIntLiteral(c_uint, 0x400000b5, .hex);
pub const SDLK_KP_LEFTPAREN = __helpers.promoteIntLiteral(c_uint, 0x400000b6, .hex);
pub const SDLK_KP_RIGHTPAREN = __helpers.promoteIntLiteral(c_uint, 0x400000b7, .hex);
pub const SDLK_KP_LEFTBRACE = __helpers.promoteIntLiteral(c_uint, 0x400000b8, .hex);
pub const SDLK_KP_RIGHTBRACE = __helpers.promoteIntLiteral(c_uint, 0x400000b9, .hex);
pub const SDLK_KP_TAB = __helpers.promoteIntLiteral(c_uint, 0x400000ba, .hex);
pub const SDLK_KP_BACKSPACE = __helpers.promoteIntLiteral(c_uint, 0x400000bb, .hex);
pub const SDLK_KP_A = __helpers.promoteIntLiteral(c_uint, 0x400000bc, .hex);
pub const SDLK_KP_B = __helpers.promoteIntLiteral(c_uint, 0x400000bd, .hex);
pub const SDLK_KP_C = __helpers.promoteIntLiteral(c_uint, 0x400000be, .hex);
pub const SDLK_KP_D = __helpers.promoteIntLiteral(c_uint, 0x400000bf, .hex);
pub const SDLK_KP_E = __helpers.promoteIntLiteral(c_uint, 0x400000c0, .hex);
pub const SDLK_KP_F = __helpers.promoteIntLiteral(c_uint, 0x400000c1, .hex);
pub const SDLK_KP_XOR = __helpers.promoteIntLiteral(c_uint, 0x400000c2, .hex);
pub const SDLK_KP_POWER = __helpers.promoteIntLiteral(c_uint, 0x400000c3, .hex);
pub const SDLK_KP_PERCENT = __helpers.promoteIntLiteral(c_uint, 0x400000c4, .hex);
pub const SDLK_KP_LESS = __helpers.promoteIntLiteral(c_uint, 0x400000c5, .hex);
pub const SDLK_KP_GREATER = __helpers.promoteIntLiteral(c_uint, 0x400000c6, .hex);
pub const SDLK_KP_AMPERSAND = __helpers.promoteIntLiteral(c_uint, 0x400000c7, .hex);
pub const SDLK_KP_DBLAMPERSAND = __helpers.promoteIntLiteral(c_uint, 0x400000c8, .hex);
pub const SDLK_KP_VERTICALBAR = __helpers.promoteIntLiteral(c_uint, 0x400000c9, .hex);
pub const SDLK_KP_DBLVERTICALBAR = __helpers.promoteIntLiteral(c_uint, 0x400000ca, .hex);
pub const SDLK_KP_COLON = __helpers.promoteIntLiteral(c_uint, 0x400000cb, .hex);
pub const SDLK_KP_HASH = __helpers.promoteIntLiteral(c_uint, 0x400000cc, .hex);
pub const SDLK_KP_SPACE = __helpers.promoteIntLiteral(c_uint, 0x400000cd, .hex);
pub const SDLK_KP_AT = __helpers.promoteIntLiteral(c_uint, 0x400000ce, .hex);
pub const SDLK_KP_EXCLAM = __helpers.promoteIntLiteral(c_uint, 0x400000cf, .hex);
pub const SDLK_KP_MEMSTORE = __helpers.promoteIntLiteral(c_uint, 0x400000d0, .hex);
pub const SDLK_KP_MEMRECALL = __helpers.promoteIntLiteral(c_uint, 0x400000d1, .hex);
pub const SDLK_KP_MEMCLEAR = __helpers.promoteIntLiteral(c_uint, 0x400000d2, .hex);
pub const SDLK_KP_MEMADD = __helpers.promoteIntLiteral(c_uint, 0x400000d3, .hex);
pub const SDLK_KP_MEMSUBTRACT = __helpers.promoteIntLiteral(c_uint, 0x400000d4, .hex);
pub const SDLK_KP_MEMMULTIPLY = __helpers.promoteIntLiteral(c_uint, 0x400000d5, .hex);
pub const SDLK_KP_MEMDIVIDE = __helpers.promoteIntLiteral(c_uint, 0x400000d6, .hex);
pub const SDLK_KP_PLUSMINUS = __helpers.promoteIntLiteral(c_uint, 0x400000d7, .hex);
pub const SDLK_KP_CLEAR = __helpers.promoteIntLiteral(c_uint, 0x400000d8, .hex);
pub const SDLK_KP_CLEARENTRY = __helpers.promoteIntLiteral(c_uint, 0x400000d9, .hex);
pub const SDLK_KP_BINARY = __helpers.promoteIntLiteral(c_uint, 0x400000da, .hex);
pub const SDLK_KP_OCTAL = __helpers.promoteIntLiteral(c_uint, 0x400000db, .hex);
pub const SDLK_KP_DECIMAL = __helpers.promoteIntLiteral(c_uint, 0x400000dc, .hex);
pub const SDLK_KP_HEXADECIMAL = __helpers.promoteIntLiteral(c_uint, 0x400000dd, .hex);
pub const SDLK_LCTRL = __helpers.promoteIntLiteral(c_uint, 0x400000e0, .hex);
pub const SDLK_LSHIFT = __helpers.promoteIntLiteral(c_uint, 0x400000e1, .hex);
pub const SDLK_LALT = __helpers.promoteIntLiteral(c_uint, 0x400000e2, .hex);
pub const SDLK_LGUI = __helpers.promoteIntLiteral(c_uint, 0x400000e3, .hex);
pub const SDLK_RCTRL = __helpers.promoteIntLiteral(c_uint, 0x400000e4, .hex);
pub const SDLK_RSHIFT = __helpers.promoteIntLiteral(c_uint, 0x400000e5, .hex);
pub const SDLK_RALT = __helpers.promoteIntLiteral(c_uint, 0x400000e6, .hex);
pub const SDLK_RGUI = __helpers.promoteIntLiteral(c_uint, 0x400000e7, .hex);
pub const SDLK_MODE = __helpers.promoteIntLiteral(c_uint, 0x40000101, .hex);
pub const SDLK_SLEEP = __helpers.promoteIntLiteral(c_uint, 0x40000102, .hex);
pub const SDLK_WAKE = __helpers.promoteIntLiteral(c_uint, 0x40000103, .hex);
pub const SDLK_CHANNEL_INCREMENT = __helpers.promoteIntLiteral(c_uint, 0x40000104, .hex);
pub const SDLK_CHANNEL_DECREMENT = __helpers.promoteIntLiteral(c_uint, 0x40000105, .hex);
pub const SDLK_MEDIA_PLAY = __helpers.promoteIntLiteral(c_uint, 0x40000106, .hex);
pub const SDLK_MEDIA_PAUSE = __helpers.promoteIntLiteral(c_uint, 0x40000107, .hex);
pub const SDLK_MEDIA_RECORD = __helpers.promoteIntLiteral(c_uint, 0x40000108, .hex);
pub const SDLK_MEDIA_FAST_FORWARD = __helpers.promoteIntLiteral(c_uint, 0x40000109, .hex);
pub const SDLK_MEDIA_REWIND = __helpers.promoteIntLiteral(c_uint, 0x4000010a, .hex);
pub const SDLK_MEDIA_NEXT_TRACK = __helpers.promoteIntLiteral(c_uint, 0x4000010b, .hex);
pub const SDLK_MEDIA_PREVIOUS_TRACK = __helpers.promoteIntLiteral(c_uint, 0x4000010c, .hex);
pub const SDLK_MEDIA_STOP = __helpers.promoteIntLiteral(c_uint, 0x4000010d, .hex);
pub const SDLK_MEDIA_EJECT = __helpers.promoteIntLiteral(c_uint, 0x4000010e, .hex);
pub const SDLK_MEDIA_PLAY_PAUSE = __helpers.promoteIntLiteral(c_uint, 0x4000010f, .hex);
pub const SDLK_MEDIA_SELECT = __helpers.promoteIntLiteral(c_uint, 0x40000110, .hex);
pub const SDLK_AC_NEW = __helpers.promoteIntLiteral(c_uint, 0x40000111, .hex);
pub const SDLK_AC_OPEN = __helpers.promoteIntLiteral(c_uint, 0x40000112, .hex);
pub const SDLK_AC_CLOSE = __helpers.promoteIntLiteral(c_uint, 0x40000113, .hex);
pub const SDLK_AC_EXIT = __helpers.promoteIntLiteral(c_uint, 0x40000114, .hex);
pub const SDLK_AC_SAVE = __helpers.promoteIntLiteral(c_uint, 0x40000115, .hex);
pub const SDLK_AC_PRINT = __helpers.promoteIntLiteral(c_uint, 0x40000116, .hex);
pub const SDLK_AC_PROPERTIES = __helpers.promoteIntLiteral(c_uint, 0x40000117, .hex);
pub const SDLK_AC_SEARCH = __helpers.promoteIntLiteral(c_uint, 0x40000118, .hex);
pub const SDLK_AC_HOME = __helpers.promoteIntLiteral(c_uint, 0x40000119, .hex);
pub const SDLK_AC_BACK = __helpers.promoteIntLiteral(c_uint, 0x4000011a, .hex);
pub const SDLK_AC_FORWARD = __helpers.promoteIntLiteral(c_uint, 0x4000011b, .hex);
pub const SDLK_AC_STOP = __helpers.promoteIntLiteral(c_uint, 0x4000011c, .hex);
pub const SDLK_AC_REFRESH = __helpers.promoteIntLiteral(c_uint, 0x4000011d, .hex);
pub const SDLK_AC_BOOKMARKS = __helpers.promoteIntLiteral(c_uint, 0x4000011e, .hex);
pub const SDLK_SOFTLEFT = __helpers.promoteIntLiteral(c_uint, 0x4000011f, .hex);
pub const SDLK_SOFTRIGHT = __helpers.promoteIntLiteral(c_uint, 0x40000120, .hex);
pub const SDLK_CALL = __helpers.promoteIntLiteral(c_uint, 0x40000121, .hex);
pub const SDLK_ENDCALL = __helpers.promoteIntLiteral(c_uint, 0x40000122, .hex);
pub const SDLK_LEFT_TAB = __helpers.promoteIntLiteral(c_uint, 0x20000001, .hex);
pub const SDLK_MULTI_KEY_COMPOSE = __helpers.promoteIntLiteral(c_uint, 0x20000003, .hex);
pub const SDLK_LMETA = __helpers.promoteIntLiteral(c_uint, 0x20000004, .hex);
pub const SDLK_RMETA = __helpers.promoteIntLiteral(c_uint, 0x20000005, .hex);
pub const SDLK_RHYPER = __helpers.promoteIntLiteral(c_uint, 0x20000007, .hex);
pub const SDL_KMOD_NONE = @as(c_uint, 0x0000);
pub const SDL_KMOD_LSHIFT = @as(c_uint, 0x0001);
pub const SDL_KMOD_RSHIFT = @as(c_uint, 0x0002);
pub const SDL_KMOD_LEVEL5 = @as(c_uint, 0x0004);
pub const SDL_KMOD_LALT = @as(c_uint, 0x0100);
pub const SDL_KMOD_RALT = @as(c_uint, 0x0200);
pub const SDL_KMOD_CAPS = @as(c_uint, 0x2000);
pub const SDL_KMOD_MODE = @as(c_uint, 0x4000);
pub const SDL_KEYMAP_AUTO_RELEASE = @as(c_int, 0x01);
pub const SDL_KEYMAP_LAYOUT_DETERMINED = @as(c_int, 0x02);
pub const SDL_KEYMAP_FRENCH_NUMBERS = @as(c_int, 0x04);
pub const SDL_KEYMAP_LATIN_LETTERS = @as(c_int, 0x08);
pub const SDL_KEYMAP_THAI_KEYBOARD = @as(c_int, 0x10);
