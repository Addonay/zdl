//! Linux keyboard translation: evdev and X server keycode tables, X keysym to
//! scancode/keycode/UCS conversion and Linux scancode display names.
//! Altered native port of scancodes_linux.h, scancodes_xfree86.h,
//! scancodes_darwin.h, SDL_scancode_tables.c, SDL_keysym_to_scancode.c,
//! SDL_keysym_to_keycode.c and imKStoUCS.c. Pure lookup data: nothing here
//! links libxkbcommon or Xlib, so Wayland, X11 and evdev backends can share it.
// keysym-to-UCS data: Copyright (C) 2003-2006,2008 Jamey Sharp, Josh Triplett;
// Copyright 2009 Red Hat, Inc.; Copyright 1990-1992,1999,2000,2004,2009,2010
// Oracle and/or its affiliates. MIT-style notice in docs/licenses/imKStoUCS.txt.
const std = @import("std");
const keyboard = @import("keyboard.zig");
const Scancode = keyboard.Scancode;
const Keycode = keyboard.Keycode;
const Modifiers = keyboard.Modifiers;

/// X11 and Wayland present the Application key as "Menu". Use as
/// NameContext.names for key names consistent with those backends.
pub const names: keyboard.ScancodeNames = .{ .overrides = &.{
    .{ .scancode = .application, .name = "Menu" },
} };

/// Known keycode-to-scancode tables. X servers number keys by evdev code + 8
/// (Linux), by XFree86 kbd driver codes, by Xvnc codes or by Darwin codes; the
/// X11 backend chooses one by fingerprinting the server's keymap.
pub const Table = enum {
    darwin,
    linux,
    xfree86_1,
    xfree86_2,
    xvnc,

    pub fn entries(self: Table) []const Scancode {
        return switch (self) {
            .darwin => &darwin_table,
            .linux => &linux_table,
            .xfree86_1 => &xfree86_table,
            .xfree86_2 => &xfree86_table2,
            .xvnc => &xvnc_table,
        };
    }

    /// Out-of-range codes map to Scancode.unknown.
    pub fn scancode(self: Table, code: u32) Scancode {
        const list = self.entries();
        return if (code < list.len) list[code] else .unknown;
    }
};

/// Scancode for a Linux input-event (evdev) key code.
pub fn evdev_scancode(code: u32) Scancode {
    return Table.linux.scancode(code);
}

const KeysymScancode = struct { keysym: u32, scancode: Scancode };
const KeysymEvdev = struct { keysym: u32, evdev: u16 };
const KeysymKeycode = struct { keysym: u32, keycode: Keycode };
const UcsRange = struct { first: u32, values: []const u16 };

/// Unicode character for an X keysym, or null for function/modifier keysyms.
/// Direct Unicode keysyms (0x01000000 | codepoint) must name a scalar value;
/// upstream returned surrogates and values above U+10FFFF unchanged.
/// Legacy keysyms 0x58A-0x58F return null: upstream's range guard admitted
/// them while its table starts at 0x590, reading before the array.
pub fn keysym_to_ucs(keysym: u32) ?u21 {
    if (keysym & 0xFF000000 == 0x01000000) {
        const value = keysym & 0x00FFFFFF;
        if (value == 0 or value > 0x10FFFF or (value >= 0xD800 and value <= 0xDFFF)) return null;
        return @intCast(value);
    }
    if (keysym > 0 and keysym < 0x100) return @intCast(keysym);
    for (ucs_ranges) |range| {
        if (keysym >= range.first and keysym - range.first < range.values.len) {
            const value = range.values[keysym - range.first];
            return if (value == 0) null else value;
        }
    }
    return null;
}

/// Physical position for an X keysym produced by `x_keycode` (an X server
/// keycode, normally evdev + 8). Used when a backend's keycode table does not
/// recognize the key. Letters are matched case-insensitively.
pub fn keysym_scancode(keysym: u32, x_keycode: u32) Scancode {
    for (keysym_scancodes) |entry| if (entry.keysym == keysym) return entry.scancode;
    var symbol = keysym;
    var evdev: u32 = 0;
    if (symbol >= 0x41 and symbol <= 0x5A) {
        symbol += 0x20;
    } else if (symbol >= 0x10081000 and symbol <= 0x10081FFF) {
        // xkbcommon encodes otherwise unnamed evdev codes directly.
        evdev = symbol - 0x10081000;
    }
    if (evdev == 0) {
        if (x_keycode >= 8 and x_keycode - 8 < evdev_keysyms.len and evdev_keysyms[x_keycode - 8] == symbol) {
            evdev = x_keycode - 8;
        } else for (evdev_keysyms, 0..) |candidate, index| {
            if (candidate == symbol) {
                evdev = @intCast(index);
                break;
            }
        }
    }
    if (evdev == 0) {
        for (extended_evdev_keysyms) |entry| if (entry.keysym == symbol) {
            evdev = entry.evdev;
            break;
        };
    }
    return evdev_scancode(evdev);
}

/// Keycode for an X keysym: its character, the spaced symbol of a dead key,
/// an extended modifier keycode, or the default layout's key at the keysym's
/// physical position with `modifiers`. Unrecognized keysyms are unknown.
pub fn keysym_keycode(keysym: u32, x_keycode: u32, modifiers: Modifiers) Keycode {
    if (keysym_to_ucs(keysym)) |point| return @fromBackingInt(@intCast(point));
    if (keysym >= 0xFE50 and keysym <= 0xFE6F) {
        const point = dead_keys_fe50[keysym - 0xFE50];
        if (point != 0) return @fromBackingInt(@intCast(point));
    } else if (keysym >= 0xFE80 and keysym <= 0xFE93) {
        const point = dead_keys_fe80[keysym - 0xFE80];
        if (point != 0) return @fromBackingInt(@intCast(point));
    }
    for (keysym_keycodes) |entry| if (entry.keysym == keysym) return entry.keycode;
    const scancode = keysym_scancode(keysym, x_keycode);
    if (scancode == .unknown) return .unknown;
    return keyboard.default_keycode(scancode, modifiers);
}

// Generated from upstream scancodes_*.h, SDL_keysym_to_scancode.c,
// SDL_keysym_to_keycode.c and imKStoUCS.c by tools/gen/linux_keys.py.
// Regenerate rather than edit entries by hand.

const linux_table = [_]Scancode{
    .unknown,           .escape,            .@"1",             .@"2",                 .@"3",               .@"4",
    .@"5",              .@"6",              .@"7",             .@"8",                 .@"9",               .@"0",
    .minus,             .equals,            .backspace,        .tab,                  .q,                  .w,
    .e,                 .r,                 .t,                .y,                    .u,                  .i,
    .o,                 .p,                 .leftbracket,      .rightbracket,         .@"return",          .lctrl,
    .a,                 .s,                 .d,                .f,                    .g,                  .h,
    .j,                 .k,                 .l,                .semicolon,            .apostrophe,         .grave,
    .lshift,            .backslash,         .z,                .x,                    .c,                  .v,
    .b,                 .n,                 .m,                .comma,                .period,             .slash,
    .rshift,            .kp_multiply,       .lalt,             .space,                .capslock,           .f1,
    .f2,                .f3,                .f4,               .f5,                   .f6,                 .f7,
    .f8,                .f9,                .f10,              .numlockclear,         .scrolllock,         .kp_7,
    .kp_8,              .kp_9,              .kp_minus,         .kp_4,                 .kp_5,               .kp_6,
    .kp_plus,           .kp_1,              .kp_2,             .kp_3,                 .kp_0,               .kp_period,
    .unknown,           .lang5,             .nonusbackslash,   .f11,                  .f12,                .international1,
    .lang3,             .lang4,             .international4,   .international2,       .international5,     .international6,
    .kp_enter,          .rctrl,             .kp_divide,        .sysreq,               .ralt,               .unknown,
    .home,              .up,                .pageup,           .left,                 .right,              .end,
    .down,              .pagedown,          .insert,           .delete,               .unknown,            .mute,
    .volumedown,        .volumeup,          .power,            .kp_equals,            .kp_plusminus,       .pause,
    .unknown,           .kp_comma,          .lang1,            .lang2,                .international3,     .lgui,
    .rgui,              .application,       .stop,             .again,                .ac_properties,      .undo,
    .front,             .copy,              .ac_open,          .paste,                .find,               .cut,
    .help,              .menu,              .unknown,          .unknown,              .sleep,              .wake,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .ac_bookmarks,      .unknown,           .ac_back,          .ac_forward,           .unknown,            .media_eject,
    .media_eject,       .media_next_track,  .media_play_pause, .media_previous_track, .media_stop,         .media_record,
    .media_rewind,      .unknown,           .unknown,          .unknown,              .ac_home,            .ac_refresh,
    .ac_exit,           .unknown,           .unknown,          .unknown,              .unknown,            .kp_leftparen,
    .kp_rightparen,     .ac_new,            .again,            .f13,                  .f14,                .f15,
    .f16,               .f17,               .f18,              .f19,                  .f20,                .f21,
    .f22,               .f23,               .f24,              .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .media_play,       .media_pause,          .unknown,            .unknown,
    .unknown,           .unknown,           .ac_close,         .media_play,           .media_fast_forward, .unknown,
    .printscreen,       .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .ac_search,         .unknown,          .unknown,              .unknown,            .unknown,
    .alterase,          .cancel,            .unknown,          .unknown,              .media_select,       .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .ac_save,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .select,
    .unknown,           .clear,             .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .mode,              .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .channel_increment, .channel_decrement, .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,           .unknown,           .unknown,          .unknown,              .unknown,            .unknown,
};

const xfree86_table = [_]Scancode{
    .unknown, .escape,         .@"1",           .@"2",           .@"3",       .@"4",
    .@"5",    .@"6",           .@"7",           .@"8",           .@"9",       .@"0",
    .minus,   .equals,         .backspace,      .tab,            .q,          .w,
    .e,       .r,              .t,              .y,              .u,          .i,
    .o,       .p,              .leftbracket,    .rightbracket,   .@"return",  .lctrl,
    .a,       .s,              .d,              .f,              .g,          .h,
    .j,       .k,              .l,              .semicolon,      .apostrophe, .grave,
    .lshift,  .backslash,      .z,              .x,              .c,          .v,
    .b,       .n,              .m,              .comma,          .period,     .slash,
    .rshift,  .kp_multiply,    .lalt,           .space,          .capslock,   .f1,
    .f2,      .f3,             .f4,             .f5,             .f6,         .f7,
    .f8,      .f9,             .f10,            .numlockclear,   .scrolllock, .kp_7,
    .kp_8,    .kp_9,           .kp_minus,       .kp_4,           .kp_5,       .kp_6,
    .kp_plus, .kp_1,           .kp_2,           .kp_3,           .kp_0,       .kp_period,
    .sysreq,  .mode,           .nonusbackslash, .f11,            .f12,        .home,
    .up,      .pageup,         .left,           .unknown,        .right,      .end,
    .down,    .pagedown,       .insert,         .delete,         .kp_enter,   .rctrl,
    .pause,   .printscreen,    .kp_divide,      .ralt,           .unknown,    .lgui,
    .rgui,    .application,    .f13,            .f14,            .f15,        .f16,
    .f17,     .international1, .unknown,        .unknown,        .kp_equals,  .unknown,
    .unknown, .international4, .unknown,        .international5, .unknown,    .international3,
    .unknown, .unknown,        .unknown,        .unknown,        .unknown,    .unknown,
    .power,   .mute,           .volumedown,     .volumeup,       .help,       .stop,
    .again,   .unknown,        .undo,           .unknown,        .copy,       .unknown,
    .paste,   .find,           .cut,
};

const xfree86_table2 = [_]Scancode{
    .unknown,       .escape,           .@"1",             .@"2",                 .@"3",               .@"4",
    .@"5",          .@"6",             .@"7",             .@"8",                 .@"9",               .@"0",
    .minus,         .equals,           .backspace,        .tab,                  .q,                  .w,
    .e,             .r,                .t,                .y,                    .u,                  .i,
    .o,             .p,                .leftbracket,      .rightbracket,         .@"return",          .lctrl,
    .a,             .s,                .d,                .f,                    .g,                  .h,
    .j,             .k,                .l,                .semicolon,            .apostrophe,         .grave,
    .lshift,        .backslash,        .z,                .x,                    .c,                  .v,
    .b,             .n,                .m,                .comma,                .period,             .slash,
    .rshift,        .kp_multiply,      .lalt,             .space,                .capslock,           .f1,
    .f2,            .f3,               .f4,               .f5,                   .f6,                 .f7,
    .f8,            .f9,               .f10,              .numlockclear,         .scrolllock,         .kp_7,
    .kp_8,          .kp_9,             .kp_minus,         .kp_4,                 .kp_5,               .kp_6,
    .kp_plus,       .kp_1,             .kp_2,             .kp_3,                 .kp_0,               .kp_period,
    .ralt,          .lang5,            .nonusbackslash,   .f11,                  .f12,                .international1,
    .lang3,         .lang4,            .international4,   .international2,       .international5,     .international6,
    .kp_enter,      .rctrl,            .kp_divide,        .sysreq,               .ralt,               .unknown,
    .home,          .up,               .pageup,           .left,                 .right,              .end,
    .down,          .pagedown,         .insert,           .delete,               .unknown,            .mute,
    .volumedown,    .volumeup,         .power,            .kp_equals,            .kp_plusminus,       .pause,
    .unknown,       .kp_comma,         .lang1,            .lang2,                .international3,     .lgui,
    .rgui,          .application,      .stop,             .again,                .ac_properties,      .undo,
    .front,         .copy,             .ac_open,          .paste,                .find,               .cut,
    .help,          .menu,             .unknown,          .unknown,              .sleep,              .wake,
    .unknown,       .unknown,          .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,       .unknown,          .unknown,          .unknown,              .unknown,            .unknown,
    .ac_bookmarks,  .unknown,          .ac_back,          .ac_forward,           .unknown,            .media_eject,
    .media_eject,   .media_next_track, .media_play_pause, .media_previous_track, .media_stop,         .media_record,
    .media_rewind,  .unknown,          .unknown,          .unknown,              .ac_home,            .ac_refresh,
    .ac_exit,       .unknown,          .unknown,          .unknown,              .unknown,            .kp_leftparen,
    .kp_rightparen, .ac_new,           .again,            .f13,                  .f14,                .f15,
    .f16,           .f17,              .f18,              .f19,                  .f20,                .f21,
    .f22,           .f23,              .f24,              .unknown,              .unknown,            .unknown,
    .unknown,       .unknown,          .media_play,       .media_pause,          .unknown,            .unknown,
    .unknown,       .unknown,          .ac_close,         .media_play,           .media_fast_forward, .unknown,
    .printscreen,   .unknown,          .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,       .ac_search,        .unknown,          .unknown,              .unknown,            .unknown,
    .alterase,      .cancel,           .unknown,          .unknown,              .media_select,       .unknown,
    .unknown,       .unknown,          .unknown,          .unknown,              .unknown,            .unknown,
    .ac_save,       .unknown,          .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,       .unknown,          .unknown,          .unknown,              .unknown,            .unknown,
    .unknown,       .unknown,
};

const xvnc_table = [_]Scancode{
    .lctrl,      .rctrl, .lshift,    .rshift,      .unknown,      .unknown,
    .lalt,       .ralt,  .space,     .@"0",        .@"1",         .@"2",
    .@"3",       .@"4",  .@"5",      .@"6",        .@"7",         .@"8",
    .@"9",       .minus, .equals,    .leftbracket, .rightbracket, .semicolon,
    .apostrophe, .grave, .comma,     .period,      .slash,        .backslash,
    .a,          .b,     .c,         .d,           .e,            .f,
    .g,          .h,     .i,         .j,           .k,            .l,
    .m,          .n,     .o,         .p,           .q,            .r,
    .s,          .t,     .u,         .v,           .w,            .x,
    .y,          .z,     .backspace, .@"return",   .tab,          .escape,
    .delete,     .home,  .end,       .pageup,      .pagedown,     .up,
    .down,       .left,  .right,     .f1,          .f2,           .f3,
    .f4,         .f5,    .f6,        .f7,          .f8,           .f9,
    .f10,        .f11,   .f12,
};

const darwin_table = [_]Scancode{
    .a,            .s,           .d,           .f,              .h,              .g,
    .z,            .x,           .c,           .v,              .nonusbackslash, .b,
    .q,            .w,           .e,           .r,              .y,              .t,
    .@"1",         .@"2",        .@"3",        .@"4",           .@"6",           .@"5",
    .equals,       .@"9",        .@"7",        .minus,          .@"8",           .@"0",
    .rightbracket, .o,           .u,           .leftbracket,    .i,              .p,
    .@"return",    .l,           .j,           .apostrophe,     .k,              .semicolon,
    .backslash,    .comma,       .slash,       .n,              .m,              .period,
    .tab,          .space,       .grave,       .backspace,      .kp_enter,       .escape,
    .rgui,         .lgui,        .lshift,      .capslock,       .lalt,           .lctrl,
    .rshift,       .ralt,        .rctrl,       .rgui,           .f17,            .kp_period,
    .unknown,      .kp_multiply, .unknown,     .kp_plus,        .unknown,        .numlockclear,
    .volumeup,     .volumedown,  .mute,        .kp_divide,      .kp_enter,       .unknown,
    .kp_minus,     .f18,         .f19,         .kp_equals,      .kp_0,           .kp_1,
    .kp_2,         .kp_3,        .kp_4,        .kp_5,           .kp_6,           .kp_7,
    .unknown,      .kp_8,        .kp_9,        .international3, .international1, .international6,
    .f5,           .f6,          .f7,          .f3,             .f8,             .f9,
    .lang2,        .f11,         .lang1,       .printscreen,    .f16,            .scrolllock,
    .unknown,      .f10,         .application, .f12,            .unknown,        .pause,
    .insert,       .home,        .pageup,      .delete,         .f4,             .end,
    .f2,           .pagedown,    .f1,          .left,           .right,          .down,
    .up,           .power,
};

const keysym_scancodes = [_]KeysymScancode{
    .{ .keysym = 0xFF9C, .scancode = .kp_1 },
    .{ .keysym = 0xFF99, .scancode = .kp_2 },
    .{ .keysym = 0xFF9B, .scancode = .kp_3 },
    .{ .keysym = 0xFF96, .scancode = .kp_4 },
    .{ .keysym = 0xFF9D, .scancode = .kp_5 },
    .{ .keysym = 0xFF98, .scancode = .kp_6 },
    .{ .keysym = 0xFF95, .scancode = .kp_7 },
    .{ .keysym = 0xFF97, .scancode = .kp_8 },
    .{ .keysym = 0xFF9A, .scancode = .kp_9 },
    .{ .keysym = 0xFF9E, .scancode = .kp_0 },
    .{ .keysym = 0xFF9F, .scancode = .kp_period },
    .{ .keysym = 0xFF62, .scancode = .execute },
    .{ .keysym = 0xFFEE, .scancode = .application },
    .{ .keysym = 0xFE03, .scancode = .ralt },
    .{ .keysym = 0xFE20, .scancode = .tab },
    .{ .keysym = 0xFFEB, .scancode = .lgui },
    .{ .keysym = 0xFFEC, .scancode = .rgui },
    .{ .keysym = 0xFF7E, .scancode = .mode },
    .{ .keysym = 0x1008FF65, .scancode = .menu },
    .{ .keysym = 0x1008FF81, .scancode = .f13 },
    .{ .keysym = 0x1008FF45, .scancode = .f14 },
    .{ .keysym = 0x1008FF46, .scancode = .f15 },
    .{ .keysym = 0x1008FF47, .scancode = .f16 },
    .{ .keysym = 0x1008FF48, .scancode = .f17 },
    .{ .keysym = 0x1008FF49, .scancode = .f18 },
};

/// Indexed by Linux evdev keycode.
const evdev_keysyms = [_]u32{
    0x0,        0xFF1B,     0x31,       0x32,       0x33,       0x34,       0x35,       0x36,
    0x37,       0x38,       0x39,       0x30,       0x2D,       0x3D,       0xFF08,     0xFF09,
    0x71,       0x77,       0x65,       0x72,       0x74,       0x79,       0x75,       0x69,
    0x6F,       0x70,       0x5B,       0x5D,       0xFF0D,     0xFFE3,     0x61,       0x73,
    0x64,       0x66,       0x67,       0x68,       0x6A,       0x6B,       0x6C,       0x3B,
    0x27,       0x60,       0xFFE1,     0x5C,       0x7A,       0x78,       0x63,       0x76,
    0x62,       0x6E,       0x6D,       0x2C,       0x2E,       0x2F,       0xFFE2,     0xFFAA,
    0xFFE9,     0x20,       0xFFE5,     0xFFBE,     0xFFBF,     0xFFC0,     0xFFC1,     0xFFC2,
    0xFFC3,     0xFFC4,     0xFFC5,     0xFFC6,     0xFFC7,     0xFF7F,     0xFF14,     0xFFB7,
    0xFFB8,     0xFFB9,     0xFFAD,     0xFFB4,     0xFFB5,     0xFFB6,     0xFFAB,     0xFFB1,
    0xFFB2,     0xFFB3,     0xFFB0,     0xFFAE,     0x0,        0x0,        0x3C,       0xFFC8,
    0xFFC9,     0x0,        0xFF26,     0xFF25,     0xFF23,     0xFF27,     0xFF22,     0x0,
    0xFF8D,     0xFFE4,     0xFFAF,     0xFF15,     0xFFEA,     0xFF0A,     0xFF50,     0xFF52,
    0xFF55,     0xFF51,     0xFF53,     0xFF57,     0xFF54,     0xFF56,     0xFF63,     0xFFFF,
    0x0,        0x1008FF12, 0x1008FF11, 0x1008FF13, 0x1008FF2A, 0xFFBD,     0xB1,       0xFF13,
    0x1008FF4A, 0xFFAC,     0xFF31,     0xFF34,     0x0,        0xFFE7,     0xFFE8,     0xFF67,
    0x00,       0xFF66,     0x1005FF70, 0xFF65,     0x1005FF71, 0x1008FF57, 0x1008FF6B, 0x1008FF6D,
    0xFF68,     0x1008FF58, 0xFF6A,     0xFF67,     0x1008FF1D, 0x0,        0x1008FF2F, 0x1008FF2B,
    0x1008FF5D, 0x1008FF7B, 0x0,        0x1008FF8A, 0x1008FF41, 0x1008FF42, 0x1008FF2E, 0x1008FF5A,
    0x1008FF2D, 0x1008FF74, 0x1008FF7F, 0x1008FF19, 0x1008FF30, 0x1008FF33, 0x1008FF26, 0x1008FF27,
    0x0,        0x1008FF2C, 0x1008FF2C, 0x1008FF17, 0x1008FF14, 0x1008FF16, 0x1008FF15, 0x1008FF1C,
    0x1008FF3E, 0x1008FF6E, 0x0,        0x1008FF81, 0x1008FF18, 0x1008FF73, 0x1008FF56, 0x0,
    0x0,        0x1008FF78, 0x1008FF79, 0x0,        0x0,        0x1008FF68, 0xFF66,     0xFFCA,
    0xFFCB,     0xFFCC,     0xFFCD,     0xFFCE,     0xFFCF,     0xFFD0,     0xFFD1,     0xFFD2,
    0xFFD3,     0xFFD4,     0xFFD5,     0x0,        0x0,        0x0,        0x0,        0x0,
    0x1008FF14, 0x1008FF31, 0x1008FF43, 0x1008FF44, 0x1008FF4B, 0x1008FFA7, 0x1008FF56, 0x1008FF14,
    0x1008FF97, 0x0,        0xFF61,     0x0,        0x1008FF8F, 0x1008FFB6, 0x0,        0x1008FF19,
    0x1008FF8E, 0x1008FF1B, 0x1008FF5F, 0x1008FF3C, 0x1008FF5E, 0x1008FF36, 0x0,        0xFF69,
    0x1008FF03, 0x1008FF02, 0x1008FF32, 0x1008FF59, 0x1008FF04, 0x1008FF06, 0x1008FF05, 0x1008FF7B,
    0x1008FF72, 0x1008FF90, 0x1008FF77, 0x1008FF5B, 0x1008FF93, 0x1008FF94, 0x1008FF95, 0x1008FF96,
    0x0,        0x1008FE22, 0x1008FE23, 0x1008FF07, 0x100810F4, 0x100810F5, 0x1008FFB4, 0x1008FFB5,
};

const extended_evdev_keysyms = [_]KeysymEvdev{
    .{ .keysym = 0x1008FF2C, .evdev = 0x0a2 },
    .{ .keysym = 0x1008FF68, .evdev = 0x0b5 },
    .{ .keysym = 0x0000FF66, .evdev = 0x0b6 },
    .{ .keysym = 0x1008FF4B, .evdev = 0x0cc },
    .{ .keysym = 0x1008FF59, .evdev = 0x0e3 },
    .{ .keysym = 0x1008FF04, .evdev = 0x0e4 },
    .{ .keysym = 0x1008FF06, .evdev = 0x0e5 },
    .{ .keysym = 0x1008FF05, .evdev = 0x0e6 },
    .{ .keysym = 0x1008FF7B, .evdev = 0x0e7 },
    .{ .keysym = 0x1008FF72, .evdev = 0x0e8 },
    .{ .keysym = 0x1008FF90, .evdev = 0x0e9 },
    .{ .keysym = 0x1008FF77, .evdev = 0x0ea },
    .{ .keysym = 0x1008FF5B, .evdev = 0x0eb },
    .{ .keysym = 0x1008FF93, .evdev = 0x0ec },
    .{ .keysym = 0x1008FF94, .evdev = 0x0ed },
    .{ .keysym = 0x1008FF95, .evdev = 0x0ee },
    .{ .keysym = 0x1008FF96, .evdev = 0x0ef },
    .{ .keysym = 0x1008FE22, .evdev = 0x0f1 },
    .{ .keysym = 0x1008FE23, .evdev = 0x0f2 },
    .{ .keysym = 0x1008FF07, .evdev = 0x0f3 },
    .{ .keysym = 0x1008FFB4, .evdev = 0x0f6 },
    .{ .keysym = 0x1008FFB5, .evdev = 0x0f7 },
    .{ .keysym = 0x1008FFB2, .evdev = 0x0f8 },
    .{ .keysym = 0x1008FF9C, .evdev = 0x173 },
    .{ .keysym = 0x1008FFB8, .evdev = 0x174 },
    .{ .keysym = 0x1008FF87, .evdev = 0x189 },
    .{ .keysym = 0x1008FF20, .evdev = 0x18d },
    .{ .keysym = 0x1008FF99, .evdev = 0x19a },
    .{ .keysym = 0x1008FF5E, .evdev = 0x1a1 },
    .{ .keysym = 0x1008FF8B, .evdev = 0x1a2 },
    .{ .keysym = 0x1008FF8C, .evdev = 0x1a3 },
    .{ .keysym = 0x1008FF89, .evdev = 0x1a5 },
    .{ .keysym = 0x1008FF5C, .evdev = 0x1a7 },
    .{ .keysym = 0x1008FF69, .evdev = 0x1ab },
    .{ .keysym = 0x1008FF8E, .evdev = 0x1ae },
    .{ .keysym = 0x1008FF61, .evdev = 0x1b1 },
    .{ .keysym = 0x00000024, .evdev = 0x1b2 },
    .{ .keysym = 0x000020AC, .evdev = 0x1b3 },
    .{ .keysym = 0x1008FF9D, .evdev = 0x1b4 },
    .{ .keysym = 0x1008FF9E, .evdev = 0x1b5 },
    .{ .keysym = 0x0000FFF1, .evdev = 0x1f1 },
    .{ .keysym = 0x0000FFF2, .evdev = 0x1f2 },
    .{ .keysym = 0x0000FFF3, .evdev = 0x1f3 },
    .{ .keysym = 0x0000FFF4, .evdev = 0x1f4 },
    .{ .keysym = 0x0000FFF5, .evdev = 0x1f5 },
    .{ .keysym = 0x0000FFF6, .evdev = 0x1f6 },
    .{ .keysym = 0x0000FFF7, .evdev = 0x1f7 },
    .{ .keysym = 0x0000FFF8, .evdev = 0x1f8 },
    .{ .keysym = 0x0000FFF9, .evdev = 0x1f9 },
    .{ .keysym = 0x0000FFF1, .evdev = 0x1fa },
    .{ .keysym = 0x1008FFA9, .evdev = 0x212 },
    .{ .keysym = 0x1008FFB0, .evdev = 0x213 },
    .{ .keysym = 0x1008FFB1, .evdev = 0x214 },
    .{ .keysym = 0x1008FFB7, .evdev = 0x231 },
    .{ .keysym = 0x0000FE08, .evdev = 0x248 },
};

const dead_keys_fe50 = [_]u21{
    0x0060, 0x00b4, 0x005e, 0x1fc0, 0x00af, 0x02d8, 0x02d9, 0x00a8,
    0x02da, 0x02dd, 0x02c7, 0x00b8, 0x02db, 0x037a, 0x309b, 0x309c,
    0x0323, 0x0309, 0x031b, 0x002f, 0x02bc, 0x02bd, 0x02f5, 0x02f3,
    0x005f, 0x005e, 0x02f7, 0x032e, 0x0324, 0x0311, 0x0326, 0x00a4,
};

const dead_keys_fe80 = [_]u21{
    0x0061, 0x0041, 0x0065, 0x0045, 0x0069, 0x0049, 0x006f, 0x004f,
    0x0075, 0x0055, 0x0259, 0x018f, 0x0000, 0x0621, 0x0000, 0x0000,
    0x005f, 0x02c8, 0x02cc, 0x002f,
};

const keysym_keycodes = [_]KeysymKeycode{
    .{ .keysym = 0xfe03, .keycode = .mode },
    .{ .keysym = 0xfe11, .keycode = .level5_shift },
    .{ .keysym = 0xfe20, .keycode = .left_tab },
    .{ .keysym = 0xff20, .keycode = .multi_key_compose },
    .{ .keysym = 0xffe7, .keycode = .lmeta },
    .{ .keysym = 0xffe8, .keycode = .rmeta },
    .{ .keysym = 0xffed, .keycode = .lhyper },
    .{ .keysym = 0xffee, .keycode = .rhyper },
};

/// Contiguous keysym ranges and their UCS values (0 = no character).
const ucs_ranges = [_]UcsRange{
    .{ .first = 0x1a1, .values = &.{
        0x0104, 0x02d8, 0x0141, 0x0000, 0x013d, 0x015a, 0x0000, 0x0000,
        0x0160, 0x015e, 0x0164, 0x0179, 0x0000, 0x017d, 0x017b, 0x0000,
        0x0105, 0x02db, 0x0142, 0x0000, 0x013e, 0x015b, 0x02c7, 0x0000,
        0x0161, 0x015f, 0x0165, 0x017a, 0x02dd, 0x017e, 0x017c, 0x0154,
        0x0000, 0x0000, 0x0102, 0x0000, 0x0139, 0x0106, 0x0000, 0x010c,
        0x0000, 0x0118, 0x0000, 0x011a, 0x0000, 0x0000, 0x010e, 0x0110,
        0x0143, 0x0147, 0x0000, 0x0000, 0x0150, 0x0000, 0x0000, 0x0158,
        0x016e, 0x0000, 0x0170, 0x0000, 0x0000, 0x0162, 0x0000, 0x0155,
        0x0000, 0x0000, 0x0103, 0x0000, 0x013a, 0x0107, 0x0000, 0x010d,
        0x0000, 0x0119, 0x0000, 0x011b, 0x0000, 0x0000, 0x010f, 0x0111,
        0x0144, 0x0148, 0x0000, 0x0000, 0x0151, 0x0000, 0x0000, 0x0159,
        0x016f, 0x0000, 0x0171, 0x0000, 0x0000, 0x0163, 0x02d9,
    } },
    .{ .first = 0x2a1, .values = &.{
        0x0126, 0x0000, 0x0000, 0x0000, 0x0000, 0x0124, 0x0000, 0x0000,
        0x0130, 0x0000, 0x011e, 0x0134, 0x0000, 0x0000, 0x0000, 0x0000,
        0x0127, 0x0000, 0x0000, 0x0000, 0x0000, 0x0125, 0x0000, 0x0000,
        0x0131, 0x0000, 0x011f, 0x0135, 0x0000, 0x0000, 0x0000, 0x0000,
        0x0000, 0x0000, 0x0000, 0x0000, 0x010a, 0x0108, 0x0000, 0x0000,
        0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
        0x0000, 0x0000, 0x0000, 0x0000, 0x0120, 0x0000, 0x0000, 0x011c,
        0x0000, 0x0000, 0x0000, 0x0000, 0x016c, 0x015c, 0x0000, 0x0000,
        0x0000, 0x0000, 0x0000, 0x0000, 0x010b, 0x0109, 0x0000, 0x0000,
        0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
        0x0000, 0x0000, 0x0000, 0x0000, 0x0121, 0x0000, 0x0000, 0x011d,
        0x0000, 0x0000, 0x0000, 0x0000, 0x016d, 0x015d,
    } },
    .{ .first = 0x3a2, .values = &.{
        0x0138, 0x0156, 0x0000, 0x0128, 0x013b, 0x0000, 0x0000, 0x0000,
        0x0112, 0x0122, 0x0166, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
        0x0000, 0x0157, 0x0000, 0x0129, 0x013c, 0x0000, 0x0000, 0x0000,
        0x0113, 0x0123, 0x0167, 0x014a, 0x0000, 0x014b, 0x0100, 0x0000,
        0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x012e, 0x0000, 0x0000,
        0x0000, 0x0000, 0x0116, 0x0000, 0x0000, 0x012a, 0x0000, 0x0145,
        0x014c, 0x0136, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0172,
        0x0000, 0x0000, 0x0000, 0x0168, 0x016a, 0x0000, 0x0101, 0x0000,
        0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x012f, 0x0000, 0x0000,
        0x0000, 0x0000, 0x0117, 0x0000, 0x0000, 0x012b, 0x0000, 0x0146,
        0x014d, 0x0137, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0173,
        0x0000, 0x0000, 0x0000, 0x0169, 0x016b,
    } },
    .{ .first = 0x4a1, .values = &.{
        0x3002, 0x3008, 0x3009, 0x3001, 0x30fb, 0x30f2, 0x30a1, 0x30a3,
        0x30a5, 0x30a7, 0x30a9, 0x30e3, 0x30e5, 0x30e7, 0x30c3, 0x30fc,
        0x30a2, 0x30a4, 0x30a6, 0x30a8, 0x30aa, 0x30ab, 0x30ad, 0x30af,
        0x30b1, 0x30b3, 0x30b5, 0x30b7, 0x30b9, 0x30bb, 0x30bd, 0x30bf,
        0x30c1, 0x30c4, 0x30c6, 0x30c8, 0x30ca, 0x30cb, 0x30cc, 0x30cd,
        0x30ce, 0x30cf, 0x30d2, 0x30d5, 0x30d8, 0x30db, 0x30de, 0x30df,
        0x30e0, 0x30e1, 0x30e2, 0x30e4, 0x30e6, 0x30e8, 0x30e9, 0x30ea,
        0x30eb, 0x30ec, 0x30ed, 0x30ef, 0x30f3, 0x309b, 0x309c,
    } },
    .{
        .first = 0x590,
        .values = &.{ // upstream guard 0x58a-0x5fe
            0x06f0, 0x06f1, 0x06f2, 0x06f3, 0x06f4, 0x06f5, 0x06f6, 0x06f7,
            0x06f8, 0x06f9, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
            0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x066a, 0x0670, 0x0679,
            0x067e, 0x0686, 0x0688, 0x0691, 0x060c, 0x0000, 0x06d4, 0x0000,
            0x0660, 0x0661, 0x0662, 0x0663, 0x0664, 0x0665, 0x0666, 0x0667,
            0x0668, 0x0669, 0x0000, 0x061b, 0x0000, 0x0000, 0x0000, 0x061f,
            0x0000, 0x0621, 0x0622, 0x0623, 0x0624, 0x0625, 0x0626, 0x0627,
            0x0628, 0x0629, 0x062a, 0x062b, 0x062c, 0x062d, 0x062e, 0x062f,
            0x0630, 0x0631, 0x0632, 0x0633, 0x0634, 0x0635, 0x0636, 0x0637,
            0x0638, 0x0639, 0x063a, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
            0x0640, 0x0641, 0x0642, 0x0643, 0x0644, 0x0645, 0x0646, 0x0647,
            0x0648, 0x0649, 0x064a, 0x064b, 0x064c, 0x064d, 0x064e, 0x064f,
            0x0650, 0x0651, 0x0652, 0x0653, 0x0654, 0x0655, 0x0698, 0x06a4,
            0x06a9, 0x06af, 0x06ba, 0x06be, 0x06cc, 0x06d2, 0x06c1,
        },
    },
    .{ .first = 0x680, .values = &.{
        0x0492, 0x0496, 0x049a, 0x049c, 0x04a2, 0x04ae, 0x04b0, 0x04b2,
        0x04b6, 0x04b8, 0x04ba, 0x0000, 0x04d8, 0x04e2, 0x04e8, 0x04ee,
        0x0493, 0x0497, 0x049b, 0x049d, 0x04a3, 0x04af, 0x04b1, 0x04b3,
        0x04b7, 0x04b9, 0x04bb, 0x0000, 0x04d9, 0x04e3, 0x04e9, 0x04ef,
        0x0000, 0x0452, 0x0453, 0x0451, 0x0454, 0x0455, 0x0456, 0x0457,
        0x0458, 0x0459, 0x045a, 0x045b, 0x045c, 0x0491, 0x045e, 0x045f,
        0x2116, 0x0402, 0x0403, 0x0401, 0x0404, 0x0405, 0x0406, 0x0407,
        0x0408, 0x0409, 0x040a, 0x040b, 0x040c, 0x0490, 0x040e, 0x040f,
        0x044e, 0x0430, 0x0431, 0x0446, 0x0434, 0x0435, 0x0444, 0x0433,
        0x0445, 0x0438, 0x0439, 0x043a, 0x043b, 0x043c, 0x043d, 0x043e,
        0x043f, 0x044f, 0x0440, 0x0441, 0x0442, 0x0443, 0x0436, 0x0432,
        0x044c, 0x044b, 0x0437, 0x0448, 0x044d, 0x0449, 0x0447, 0x044a,
        0x042e, 0x0410, 0x0411, 0x0426, 0x0414, 0x0415, 0x0424, 0x0413,
        0x0425, 0x0418, 0x0419, 0x041a, 0x041b, 0x041c, 0x041d, 0x041e,
        0x041f, 0x042f, 0x0420, 0x0421, 0x0422, 0x0423, 0x0416, 0x0412,
        0x042c, 0x042b, 0x0417, 0x0428, 0x042d, 0x0429, 0x0427, 0x042a,
    } },
    .{ .first = 0x7a1, .values = &.{
        0x0386, 0x0388, 0x0389, 0x038a, 0x03aa, 0x0000, 0x038c, 0x038e,
        0x03ab, 0x0000, 0x038f, 0x0000, 0x0000, 0x0385, 0x2015, 0x0000,
        0x03ac, 0x03ad, 0x03ae, 0x03af, 0x03ca, 0x0390, 0x03cc, 0x03cd,
        0x03cb, 0x03b0, 0x03ce, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
        0x0391, 0x0392, 0x0393, 0x0394, 0x0395, 0x0396, 0x0397, 0x0398,
        0x0399, 0x039a, 0x039b, 0x039c, 0x039d, 0x039e, 0x039f, 0x03a0,
        0x03a1, 0x03a3, 0x0000, 0x03a4, 0x03a5, 0x03a6, 0x03a7, 0x03a8,
        0x03a9, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
        0x03b1, 0x03b2, 0x03b3, 0x03b4, 0x03b5, 0x03b6, 0x03b7, 0x03b8,
        0x03b9, 0x03ba, 0x03bb, 0x03bc, 0x03bd, 0x03be, 0x03bf, 0x03c0,
        0x03c1, 0x03c3, 0x03c2, 0x03c4, 0x03c5, 0x03c6, 0x03c7, 0x03c8,
        0x03c9,
    } },
    .{ .first = 0x8a4, .values = &.{
        0x2320, 0x2321, 0x0000, 0x231c, 0x231d, 0x231e, 0x231f, 0x0000,
        0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
        0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
        0x2264, 0x2260, 0x2265, 0x222b, 0x2234, 0x0000, 0x221e, 0x0000,
        0x0000, 0x2207, 0x0000, 0x0000, 0x2245, 0x2246, 0x0000, 0x0000,
        0x0000, 0x0000, 0x21d2, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
        0x0000, 0x0000, 0x221a, 0x0000, 0x0000, 0x0000, 0x2282, 0x2283,
        0x2229, 0x222a, 0x2227, 0x2228, 0x0000, 0x0000, 0x0000, 0x0000,
        0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
        0x0000, 0x0000, 0x0000, 0x2202, 0x0000, 0x0000, 0x0000, 0x0000,
        0x0000, 0x0000, 0x0192, 0x0000, 0x0000, 0x0000, 0x0000, 0x2190,
        0x2191, 0x2192, 0x2193,
    } },
    .{ .first = 0x9df, .values = &.{
        0x2422, 0x2666, 0x25a6, 0x2409, 0x240c, 0x240d, 0x240a, 0x0000,
        0x0000, 0x240a, 0x240b, 0x2518, 0x2510, 0x250c, 0x2514, 0x253c,
        0x2500, 0x0000, 0x0000, 0x0000, 0x0000, 0x251c, 0x2524, 0x2534,
        0x252c, 0x2502,
    } },
    .{ .first = 0xaa1, .values = &.{
        0x2003, 0x2002, 0x2004, 0x2005, 0x2007, 0x2008, 0x2009, 0x200a,
        0x2014, 0x2013, 0x0000, 0x0000, 0x0000, 0x2026, 0x2025, 0x2153,
        0x2154, 0x2155, 0x2156, 0x2157, 0x2158, 0x2159, 0x215a, 0x2105,
        0x0000, 0x0000, 0x2012, 0x2039, 0x2024, 0x203a, 0x0000, 0x0000,
        0x0000, 0x0000, 0x215b, 0x215c, 0x215d, 0x215e, 0x0000, 0x0000,
        0x2122, 0x2120, 0x0000, 0x25c1, 0x25b7, 0x25cb, 0x25ad, 0x2018,
        0x2019, 0x201c, 0x201d, 0x211e, 0x2030, 0x2032, 0x2033, 0x0000,
        0x271d, 0x0000, 0x220e, 0x25c2, 0x2023, 0x25cf, 0x25ac, 0x25e6,
        0x25ab, 0x25ae, 0x25b5, 0x25bf, 0x2606, 0x2022, 0x25aa, 0x25b4,
        0x25be, 0x261a, 0x261b, 0x2663, 0x2666, 0x2665, 0x0000, 0x2720,
        0x2020, 0x2021, 0x2713, 0x2612, 0x266f, 0x266d, 0x2642, 0x2640,
        0x2121, 0x2315, 0x2117, 0x2038, 0x201a, 0x201e,
    } },
    .{ .first = 0xcdf, .values = &.{
        0x2017, 0x05d0, 0x05d1, 0x05d2, 0x05d3, 0x05d4, 0x05d5, 0x05d6,
        0x05d7, 0x05d8, 0x05d9, 0x05da, 0x05db, 0x05dc, 0x05dd, 0x05de,
        0x05df, 0x05e0, 0x05e1, 0x05e2, 0x05e3, 0x05e4, 0x05e5, 0x05e6,
        0x05e7, 0x05e8, 0x05e9, 0x05ea,
    } },
    .{ .first = 0xda1, .values = &.{
        0x0e01, 0x0e02, 0x0e03, 0x0e04, 0x0e05, 0x0e06, 0x0e07, 0x0e08,
        0x0e09, 0x0e0a, 0x0e0b, 0x0e0c, 0x0e0d, 0x0e0e, 0x0e0f, 0x0e10,
        0x0e11, 0x0e12, 0x0e13, 0x0e14, 0x0e15, 0x0e16, 0x0e17, 0x0e18,
        0x0e19, 0x0e1a, 0x0e1b, 0x0e1c, 0x0e1d, 0x0e1e, 0x0e1f, 0x0e20,
        0x0e21, 0x0e22, 0x0e23, 0x0e24, 0x0e25, 0x0e26, 0x0e27, 0x0e28,
        0x0e29, 0x0e2a, 0x0e2b, 0x0e2c, 0x0e2d, 0x0e2e, 0x0e2f, 0x0e30,
        0x0e31, 0x0e32, 0x0e33, 0x0e34, 0x0e35, 0x0e36, 0x0e37, 0x0e38,
        0x0e39, 0x0e3a, 0x0000, 0x0000, 0x0000, 0x0e3e, 0x0e3f, 0x0e40,
        0x0e41, 0x0e42, 0x0e43, 0x0e44, 0x0e45, 0x0e46, 0x0e47, 0x0e48,
        0x0e49, 0x0e4a, 0x0e4b, 0x0e4c, 0x0e4d, 0x0000, 0x0000, 0x0e50,
        0x0e51, 0x0e52, 0x0e53, 0x0e54, 0x0e55, 0x0e56, 0x0e57, 0x0e58,
        0x0e59,
    } },
    .{ .first = 0xea0, .values = &.{
        0x0000, 0x1101, 0x1101, 0x11aa, 0x1102, 0x11ac, 0x11ad, 0x1103,
        0x1104, 0x1105, 0x11b0, 0x11b1, 0x11b2, 0x11b3, 0x11b4, 0x11b5,
        0x11b6, 0x1106, 0x1107, 0x1108, 0x11b9, 0x1109, 0x110a, 0x110b,
        0x110c, 0x110d, 0x110e, 0x110f, 0x1110, 0x1111, 0x1112, 0x1161,
        0x1162, 0x1163, 0x1164, 0x1165, 0x1166, 0x1167, 0x1168, 0x1169,
        0x116a, 0x116b, 0x116c, 0x116d, 0x116e, 0x116f, 0x1170, 0x1171,
        0x1172, 0x1173, 0x1174, 0x1175, 0x11a8, 0x11a9, 0x11aa, 0x11ab,
        0x11ac, 0x11ad, 0x11ae, 0x11af, 0x11b0, 0x11b1, 0x11b2, 0x11b3,
        0x11b4, 0x11b5, 0x11b6, 0x11b7, 0x11b8, 0x11b9, 0x11ba, 0x11bb,
        0x11bc, 0x11bd, 0x11be, 0x11bf, 0x11c0, 0x11c1, 0x11c2, 0x0000,
        0x0000, 0x0000, 0x1140, 0x0000, 0x0000, 0x1159, 0x119e, 0x0000,
        0x11eb, 0x0000, 0x11f9, 0x0000, 0x0000, 0x0000, 0x0000, 0x20a9,
    } },
    .{ .first = 0x12a1, .values = &.{
        0x1e02, 0x1e03, 0x0000, 0x0000, 0x0000, 0x1e0a, 0x0000, 0x1e80,
        0x0000, 0x1e82, 0x1e0b, 0x1ef2, 0x0000, 0x0000, 0x0000, 0x1e1e,
        0x1e1f, 0x0000, 0x0000, 0x1e40, 0x1e41, 0x0000, 0x1e56, 0x1e81,
        0x1e57, 0x1e83, 0x1e60, 0x1ef3, 0x1e84, 0x1e85, 0x1e61, 0x0000,
        0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
        0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0174,
        0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x1e6a, 0x0000,
        0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0176, 0x0000, 0x0000,
        0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
        0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0175,
        0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x1e6b, 0x0000,
        0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0177,
    } },
    .{ .first = 0x13bc, .values = &.{
        0x0152, 0x0153, 0x0178,
    } },
    .{ .first = 0x14a1, .values = &.{
        0x2741, 0x00a7, 0x0589, 0x0029, 0x0028, 0x00bb, 0x00ab, 0x2014,
        0x002e, 0x055d, 0x002c, 0x2013, 0x058a, 0x2026, 0x055c, 0x055b,
        0x055e, 0x0531, 0x0561, 0x0532, 0x0562, 0x0533, 0x0563, 0x0534,
        0x0564, 0x0535, 0x0565, 0x0536, 0x0566, 0x0537, 0x0567, 0x0538,
        0x0568, 0x0539, 0x0569, 0x053a, 0x056a, 0x053b, 0x056b, 0x053c,
        0x056c, 0x053d, 0x056d, 0x053e, 0x056e, 0x053f, 0x056f, 0x0540,
        0x0570, 0x0541, 0x0571, 0x0542, 0x0572, 0x0543, 0x0573, 0x0544,
        0x0574, 0x0545, 0x0575, 0x0546, 0x0576, 0x0547, 0x0577, 0x0548,
        0x0578, 0x0549, 0x0579, 0x054a, 0x057a, 0x054b, 0x057b, 0x054c,
        0x057c, 0x054d, 0x057d, 0x054e, 0x057e, 0x054f, 0x057f, 0x0550,
        0x0580, 0x0551, 0x0581, 0x0552, 0x0582, 0x0553, 0x0583, 0x0554,
        0x0584, 0x0555, 0x0585, 0x0556, 0x0586, 0x2019, 0x0027,
    } },
    .{ .first = 0x15d0, .values = &.{
        0x10d0, 0x10d1, 0x10d2, 0x10d3, 0x10d4, 0x10d5, 0x10d6, 0x10d7,
        0x10d8, 0x10d9, 0x10da, 0x10db, 0x10dc, 0x10dd, 0x10de, 0x10df,
        0x10e0, 0x10e1, 0x10e2, 0x10e3, 0x10e4, 0x10e5, 0x10e6, 0x10e7,
        0x10e8, 0x10e9, 0x10ea, 0x10eb, 0x10ec, 0x10ed, 0x10ee, 0x10ef,
        0x10f0, 0x10f1, 0x10f2, 0x10f3, 0x10f4, 0x10f5, 0x10f6,
    } },
    .{ .first = 0x16a0, .values = &.{
        0x0000, 0x0000, 0xf0a2, 0x1e8a, 0x0000, 0xf0a5, 0x012c, 0xf0a7,
        0xf0a8, 0x01b5, 0x01e6, 0x0000, 0x0000, 0x0000, 0x0000, 0x019f,
        0x0000, 0x0000, 0xf0b2, 0x1e8b, 0x01d1, 0xf0b5, 0x012d, 0xf0b7,
        0xf0b8, 0x01b6, 0x01e7, 0x0000, 0x0000, 0x01d2, 0x0000, 0x0275,
        0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x018f, 0x0000,
        0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
        0x0000, 0x1e36, 0xf0d2, 0xf0d3, 0x0000, 0x0000, 0x0000, 0x0000,
        0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
        0x0000, 0x1e37, 0xf0e2, 0xf0e3, 0x0000, 0x0000, 0x0000, 0x0000,
        0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
        0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0259,
    } },
    .{ .first = 0x1e9f, .values = &.{
        0x0303, 0x1ea0, 0x1ea1, 0x1ea2, 0x1ea3, 0x1ea4, 0x1ea5, 0x1ea6,
        0x1ea7, 0x1ea8, 0x1ea9, 0x1eaa, 0x1eab, 0x1eac, 0x1ead, 0x1eae,
        0x1eaf, 0x1eb0, 0x1eb1, 0x1eb2, 0x1eb3, 0x1eb4, 0x1eb5, 0x1eb6,
        0x1eb7, 0x1eb8, 0x1eb9, 0x1eba, 0x1ebb, 0x1ebc, 0x1ebd, 0x1ebe,
        0x1ebf, 0x1ec0, 0x1ec1, 0x1ec2, 0x1ec3, 0x1ec4, 0x1ec5, 0x1ec6,
        0x1ec7, 0x1ec8, 0x1ec9, 0x1eca, 0x1ecb, 0x1ecc, 0x1ecd, 0x1ece,
        0x1ecf, 0x1ed0, 0x1ed1, 0x1ed2, 0x1ed3, 0x1ed4, 0x1ed5, 0x1ed6,
        0x1ed7, 0x1ed8, 0x1ed9, 0x1eda, 0x1edb, 0x1edc, 0x1edd, 0x1ede,
        0x1edf, 0x1ee0, 0x1ee1, 0x1ee2, 0x1ee3, 0x1ee4, 0x1ee5, 0x1ee6,
        0x1ee7, 0x1ee8, 0x1ee9, 0x1eea, 0x1eeb, 0x1eec, 0x1eed, 0x1eee,
        0x1eef, 0x1ef0, 0x1ef1, 0x0300, 0x0301, 0x1ef4, 0x1ef5, 0x1ef6,
        0x1ef7, 0x1ef8, 0x1ef9, 0x01a0, 0x01a1, 0x01af, 0x01b0, 0x0309,
        0x0323,
    } },
    .{ .first = 0x20a0, .values = &.{
        0x20a0, 0x20a1, 0x20a2, 0x20a3, 0x20a4, 0x20a5, 0x20a6, 0x20a7,
        0x20a8, 0x20a9, 0x20aa, 0x20ab, 0x20ac,
    } },
};
