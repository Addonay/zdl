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
pub const __uint32_t = c_uint;
pub const __uid_t = c_uint;
pub const __off_t = c_long;
pub const __pid_t = c_int;
pub const __clock_t = c_long;
pub const uint = c_uint;
pub const __sigset_t = extern struct {
    __val: [16]c_ulong = @import("std").mem.zeroes([16]c_ulong),
};
pub const sigset_t = __sigset_t;
pub extern fn atexit(__func: ?*const fn () callconv(.c) void) c_int;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub const struct_SDL_AtomicInt = extern struct {
    value: c_int = 0,
};
pub const SDL_AtomicInt = struct_SDL_AtomicInt;
pub extern fn SDL_CompareAndSwapAtomicInt_REAL(a: [*c]SDL_AtomicInt, oldval: c_int, newval: c_int) bool;
pub extern fn SDL_SetAtomicInt_REAL(a: [*c]SDL_AtomicInt, v: c_int) c_int;
pub extern fn SDL_GetAtomicInt_REAL(a: [*c]SDL_AtomicInt) c_int;
pub extern fn SDL_GetHintBoolean_REAL(name: [*c]const u8, default_value: bool) bool;
pub const struct_SDL_EVDEV_keyboard_state = extern struct {
    console_fd: c_int = 0,
    muted: bool = false,
    old_kbd_mode: c_int = 0,
    key_maps: [*c][*c]c_ushort = null,
    shift_down: [9]u8 = @import("std").mem.zeroes([9]u8),
    dead_key_next: bool = false,
    npadch: c_int = 0,
    accents: [*c]struct_kbdiacrs = null,
    diacr: c_uint = 0,
    rep: bool = false,
    lockstate: u8 = 0,
    slockstate: u8 = 0,
    ledflagstate: u8 = 0,
    shift_state: u8 = 0,
    text: [128]u8 = @import("std").mem.zeroes([128]u8),
    text_len: c_uint = 0,
    vt_release_callback: ?*const fn (?*anyopaque) callconv(.c) void = null,
    vt_release_callback_data: ?*anyopaque = null,
    vt_acquire_callback: ?*const fn (?*anyopaque) callconv(.c) void = null,
    vt_acquire_callback_data: ?*anyopaque = null,
};
pub const SDL_EVDEV_keyboard_state = struct_SDL_EVDEV_keyboard_state;
pub export fn SDL_EVDEV_kbd_init() [*c]SDL_EVDEV_keyboard_state {
    @setEvalBranchQuota(100000);
    var kbd: [*c]SDL_EVDEV_keyboard_state = undefined;
    _ = &kbd;
    var flag_state: u8 = undefined;
    _ = &flag_state;
    var kbtype: u8 = undefined;
    _ = &kbtype;
    var shift_state: [8]u8 = [2]u8{
        TIOCL_GETSHIFTSTATE,
        0,
    } ++ @as([6]u8, @splat(0));
    _ = &shift_state;
    kbd = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(kbd.*)))));
    if (!(kbd != null)) {
        return null;
    }
    kbd.*.console_fd = open("/dev/tty", O_RDONLY | __O_CLOEXEC);
    if (!((ioctl(kbd.*.console_fd, KDGKBTYPE, &kbtype) == @as(c_int, 0)) and ((@as(c_int, kbtype) == KB_101) or (@as(c_int, kbtype) == KB_84)))) {
        _ = close(kbd.*.console_fd);
        kbd.*.console_fd = -@as(c_int, 1);
    }
    kbd.*.npadch = -@as(c_int, 1);
    if (ioctl(kbd.*.console_fd, TIOCLINUX, @as([*c]u8, @ptrCast(@alignCast(&shift_state)))) == @as(c_int, 0)) {
        kbd.*.shift_state = @as([*c]u8, @ptrCast(@alignCast(&shift_state))).*;
    }
    if (ioctl(kbd.*.console_fd, KDGKBLED, &flag_state) == @as(c_int, 0)) {
        kbd.*.ledflagstate = flag_state;
    }
    kbd.*.accents = &default_accents;
    kbd.*.key_maps = @ptrCast(@alignCast(&default_key_maps));
    if (ioctl(kbd.*.console_fd, KDGKBMODE, &kbd.*.old_kbd_mode) == @as(c_int, 0)) {
        _ = ioctl(kbd.*.console_fd, KDSKBMODE, K_UNICODE);
    }
    _ = kbd_vt_init(kbd.*.console_fd);
    return kbd;
}
pub export fn SDL_EVDEV_kbd_set_muted(state: [*c]SDL_EVDEV_keyboard_state, muted: bool) void {
    @setEvalBranchQuota(100000);
    if (!(state != null)) {
        return;
    }
    if (@as(c_int, @intFromBool(muted)) == @as(c_int, @intFromBool(state.*.muted))) {
        return;
    }
    if (muted) {
        if (SDL_GetHintBoolean_REAL("SDL_MUTE_CONSOLE_KEYBOARD", @"true" != 0)) {
            _ = ioctl(state.*.console_fd, KDSKBMODE, K_OFF);
            if (!SDL_GetHintBoolean_REAL("SDL_NO_SIGNAL_HANDLERS", @"false" != 0)) {
                kbd_register_emerg_cleanup(state);
            }
        }
    } else {
        kbd_unregister_emerg_cleanup();
        _ = ioctl(state.*.console_fd, KDSKBMODE, state.*.old_kbd_mode);
    }
    state.*.muted = muted;
}
pub export fn SDL_EVDEV_kbd_set_vt_switch_callbacks(state: [*c]SDL_EVDEV_keyboard_state, release_callback: ?*const fn (?*anyopaque) callconv(.c) void, release_callback_data: ?*anyopaque, acquire_callback: ?*const fn (?*anyopaque) callconv(.c) void, acquire_callback_data: ?*anyopaque) void {
    @setEvalBranchQuota(100000);
    if (@as(?*anyopaque, @ptrCast(@alignCast(state))) == @as(?*anyopaque, null)) {
        return;
    }
    state.*.vt_release_callback = release_callback;
    state.*.vt_release_callback_data = release_callback_data;
    state.*.vt_acquire_callback = acquire_callback;
    state.*.vt_acquire_callback_data = acquire_callback_data;
}
pub export fn SDL_EVDEV_kbd_update(state: [*c]SDL_EVDEV_keyboard_state) void {
    @setEvalBranchQuota(100000);
    if (!(state != null)) {
        return;
    }
    kbd_vt_update(state);
}
pub export fn SDL_EVDEV_kbd_keycode(state: [*c]SDL_EVDEV_keyboard_state, keycode: c_uint, down: c_int) void {
    @setEvalBranchQuota(100000);
    var shift_final: u8 = undefined;
    _ = &shift_final;
    var @"type": u8 = undefined;
    _ = &@"type";
    var key_map: [*c]c_ushort = undefined;
    _ = &key_map;
    var keysym: c_ushort = undefined;
    _ = &keysym;
    if (!(state != null)) {
        return;
    }
    state.*.rep = down == @as(c_int, 2);
    shift_final = @bitCast(@as(i8, @truncate((@as(c_int, state.*.shift_state) | @as(c_int, state.*.slockstate)) ^ @as(c_int, state.*.lockstate))));
    key_map = state.*.key_maps[shift_final];
    if (!(key_map != null)) {
        state.*.shift_state = 0;
        state.*.slockstate = 0;
        state.*.lockstate = 0;
        return;
    }
    if (keycode < @as(c_uint, NR_KEYS)) {
        if (state.*.console_fd < @as(c_int, 0)) {
            keysym = key_map[keycode];
        } else {
            var kbe: struct_kbentry = undefined;
            _ = &kbe;
            kbe.kb_table = shift_final;
            kbe.kb_index = @truncate(keycode);
            if (ioctl(state.*.console_fd, KDGKBENT, &kbe) == @as(c_int, 0)) {
                keysym = @bitCast(@as(c_short, @truncate(@as(c_int, kbe.kb_value) ^ @as(c_int, 61440))));
            } else return;
        }
    } else {
        return;
    }
    @"type" = @bitCast(@as(i8, @truncate(@as(c_int, keysym) >> @intCast(@as(c_int, 8)))));
    if (@as(c_int, @"type") < @as(c_int, 240)) {
        if (down != 0) {
            put_utf8(state, keysym);
        }
    } else {
        {
            const ref = &@"type";
            ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) - @as(c_int, 240))));
        }
        if (@as(c_int, @"type") == KT_LETTER) {
            @"type" = KT_LATIN;
            if (vc_kbd_led(state, K_CAPSLOCK)) {
                shift_final = @bitCast(@as(i8, @truncate(@as(c_int, shift_final) ^ (@as(c_int, 1) << @intCast(KG_SHIFT)))));
                key_map = state.*.key_maps[shift_final];
                if (key_map != null) {
                    if (state.*.console_fd < @as(c_int, 0)) {
                        keysym = key_map[keycode];
                    } else {
                        var kbe: struct_kbentry = undefined;
                        _ = &kbe;
                        kbe.kb_table = shift_final;
                        kbe.kb_index = @truncate(keycode);
                        if (ioctl(state.*.console_fd, KDGKBENT, &kbe) == @as(c_int, 0)) {
                            keysym = @bitCast(@as(c_short, @truncate(@as(c_int, kbe.kb_value) ^ @as(c_int, 61440))));
                        }
                    }
                }
            }
        }
        k_handler[@"type"].?(state, @bitCast(@as(i8, @truncate(@as(c_int, keysym) & @as(c_int, 255)))), @bitCast(@as(i8, @intFromBool(!(down != 0)))));
        if (@as(c_int, @"type") != KT_SLOCK) {
            state.*.slockstate = 0;
        }
    }
    if (state.*.text_len > @as(c_uint, 0)) {
        state.*.text[state.*.text_len] = '\x00';
        SDL_SendKeyboardText(@ptrCast(@alignCast(&state.*.text)));
        state.*.text_len = 0;
    }
}

pub export fn SDL_EVDEV_kbd_quit(state: [*c]SDL_EVDEV_keyboard_state) void {
    @setEvalBranchQuota(100000);
    if (@as(?*anyopaque, @ptrCast(@alignCast(state))) == @as(?*anyopaque, null)) {
        return;
    }
    SDL_EVDEV_kbd_set_muted(state, @"false" != 0);
    kbd_vt_quit(state.*.console_fd);
    if (state.*.console_fd >= @as(c_int, 0)) {
        _ = close(state.*.console_fd);
        state.*.console_fd = -@as(c_int, 1);
    }
    if ((state.*.key_maps != null) and (state.*.key_maps != @as([*c][*c]c_ushort, @ptrCast(@alignCast(&default_key_maps))))) {
        var i: c_int = undefined;
        _ = &i;
        {
            i = 0;
            while (i < MAX_NR_KEYMAPS) : (i += 1) {
                SDL_free_REAL(@ptrCast(@alignCast(state.*.key_maps[@bitCast(@as(isize, @intCast(i)))])));
            }
        }
        SDL_free_REAL(@ptrCast(@alignCast(state.*.key_maps)));
    }
    SDL_free_REAL(@ptrCast(@alignCast(state)));
}
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const struct_kbdiacr = extern struct {
    diacr: u8 = 0,
    base: u8 = 0,
    result: u8 = 0,
};
pub const struct_kbdiacrs = extern struct {
    kb_cnt: c_uint = 0,
    kbdiacr: [256]struct_kbdiacr = @import("std").mem.zeroes([256]struct_kbdiacr),
};
pub extern fn close(__fd: c_int) c_int;
pub extern fn truncate(__file: [*c]const u8, __length: __off_t) c_int;
pub const __u8 = u8;
pub const __s16 = c_short;
pub extern fn open(__file: [*c]const u8, __oflag: c_int, ...) c_int;
pub extern fn ioctl(__fd: c_int, __request: c_ulong, ...) c_int;
pub const struct_kbentry = extern struct {
    kb_table: u8 = 0,
    kb_index: u8 = 0,
    kb_value: c_ushort = 0,
};
pub const struct_vt_mode = extern struct {
    mode: __u8 = 0,
    waitv: __u8 = 0,
    relsig: __s16 = 0,
    acqsig: __s16 = 0,
    frsig: __s16 = 0,
};
pub const union_sigval = extern union {
    sival_int: c_int,
    sival_ptr: ?*anyopaque,
};
pub const __sigval_t = union_sigval;
const struct_unnamed_18 = extern struct {
    si_pid: __pid_t = 0,
    si_uid: __uid_t = 0,
};
const struct_unnamed_19 = extern struct {
    si_tid: c_int = 0,
    si_overrun: c_int = 0,
    si_sigval: __sigval_t = @import("std").mem.zeroes(__sigval_t),
};
const struct_unnamed_20 = extern struct {
    si_pid: __pid_t = 0,
    si_uid: __uid_t = 0,
    si_sigval: __sigval_t = @import("std").mem.zeroes(__sigval_t),
};
const struct_unnamed_21 = extern struct {
    si_pid: __pid_t = 0,
    si_uid: __uid_t = 0,
    si_status: c_int = 0,
    si_utime: __clock_t = 0,
    si_stime: __clock_t = 0,
};
const struct_unnamed_24 = extern struct {
    _lower: ?*anyopaque = null,
    _upper: ?*anyopaque = null,
};
const union_unnamed_23 = extern union {
    _addr_bnd: struct_unnamed_24,
    _pkey: __uint32_t,
};
const struct_unnamed_22 = extern struct {
    si_addr: ?*anyopaque = null,
    si_addr_lsb: c_short = 0,
    _bounds: union_unnamed_23 = @import("std").mem.zeroes(union_unnamed_23),
};
const struct_unnamed_25 = extern struct {
    si_band: c_long = 0,
    si_fd: c_int = 0,
};
const struct_unnamed_26 = extern struct {
    _call_addr: ?*anyopaque = null,
    _syscall: c_int = 0,
    _arch: c_uint = 0,
};
const union_unnamed_17 = extern union {
    _pad: [28]c_int,
    _kill: struct_unnamed_18,
    _timer: struct_unnamed_19,
    _rt: struct_unnamed_20,
    _sigchld: struct_unnamed_21,
    _sigfault: struct_unnamed_22,
    _sigpoll: struct_unnamed_25,
    _sigsys: struct_unnamed_26,
};
pub const siginfo_t = extern struct {
    si_signo: c_int = 0,
    si_errno: c_int = 0,
    si_code: c_int = 0,
    __pad0: c_int = 0,
    _sifields: union_unnamed_17 = @import("std").mem.zeroes(union_unnamed_17),
};
pub const __sighandler_t = ?*const fn (c_int) callconv(.c) void;
pub extern fn raise(__sig: c_int) c_int;
pub extern fn sigemptyset(__set: [*c]sigset_t) c_int;
pub extern fn sigaddset(__set: [*c]sigset_t, __signo: c_int) c_int;
const union_unnamed_39 = extern union {
    sa_handler: __sighandler_t,
    sa_sigaction: ?*const fn (c_int, [*c]siginfo_t, ?*anyopaque) callconv(.c) void,
};
pub const struct_sigaction = extern struct {
    __sigaction_handler: union_unnamed_39 = @import("std").mem.zeroes(union_unnamed_39),
    sa_mask: __sigset_t = @import("std").mem.zeroes(__sigset_t),
    sa_flags: c_int = 0,
    sa_restorer: ?*const fn () callconv(.c) void = null,
};
pub extern fn sigprocmask(__how: c_int, noalias __set: [*c]const sigset_t, noalias __oset: [*c]sigset_t) c_int;
pub extern fn sigaction(__sig: c_int, noalias __act: [*c]const struct_sigaction, noalias __oact: [*c]struct_sigaction) c_int;
pub extern fn __libc_current_sigrtmin() c_int;
pub extern fn __libc_current_sigrtmax() c_int;
pub extern fn SDL_SendKeyboardText(text: [*c]const u8) void;
pub var default_accents: struct_kbdiacrs = struct_kbdiacrs{
    .kb_cnt = 68,
    .kbdiacr = [256]struct_kbdiacr{
        struct_kbdiacr{
            .diacr = 96,
            .base = 65,
            .result = 192,
        },
        struct_kbdiacr{
            .diacr = 96,
            .base = 97,
            .result = 224,
        },
        struct_kbdiacr{
            .diacr = 39,
            .base = 65,
            .result = 193,
        },
        struct_kbdiacr{
            .diacr = 39,
            .base = 97,
            .result = 225,
        },
        struct_kbdiacr{
            .diacr = 94,
            .base = 65,
            .result = 194,
        },
        struct_kbdiacr{
            .diacr = 94,
            .base = 97,
            .result = 226,
        },
        struct_kbdiacr{
            .diacr = 126,
            .base = 65,
            .result = 195,
        },
        struct_kbdiacr{
            .diacr = 126,
            .base = 97,
            .result = 227,
        },
        struct_kbdiacr{
            .diacr = 34,
            .base = 65,
            .result = 196,
        },
        struct_kbdiacr{
            .diacr = 34,
            .base = 97,
            .result = 228,
        },
        struct_kbdiacr{
            .diacr = 79,
            .base = 65,
            .result = 197,
        },
        struct_kbdiacr{
            .diacr = 111,
            .base = 97,
            .result = 229,
        },
        struct_kbdiacr{
            .diacr = 48,
            .base = 65,
            .result = 197,
        },
        struct_kbdiacr{
            .diacr = 48,
            .base = 97,
            .result = 229,
        },
        struct_kbdiacr{
            .diacr = 65,
            .base = 65,
            .result = 197,
        },
        struct_kbdiacr{
            .diacr = 97,
            .base = 97,
            .result = 229,
        },
        struct_kbdiacr{
            .diacr = 65,
            .base = 69,
            .result = 198,
        },
        struct_kbdiacr{
            .diacr = 97,
            .base = 101,
            .result = 230,
        },
        struct_kbdiacr{
            .diacr = 44,
            .base = 67,
            .result = 199,
        },
        struct_kbdiacr{
            .diacr = 44,
            .base = 99,
            .result = 231,
        },
        struct_kbdiacr{
            .diacr = 96,
            .base = 69,
            .result = 200,
        },
        struct_kbdiacr{
            .diacr = 96,
            .base = 101,
            .result = 232,
        },
        struct_kbdiacr{
            .diacr = 39,
            .base = 69,
            .result = 201,
        },
        struct_kbdiacr{
            .diacr = 39,
            .base = 101,
            .result = 233,
        },
        struct_kbdiacr{
            .diacr = 94,
            .base = 69,
            .result = 202,
        },
        struct_kbdiacr{
            .diacr = 94,
            .base = 101,
            .result = 234,
        },
        struct_kbdiacr{
            .diacr = 34,
            .base = 69,
            .result = 203,
        },
        struct_kbdiacr{
            .diacr = 34,
            .base = 101,
            .result = 235,
        },
        struct_kbdiacr{
            .diacr = 96,
            .base = 73,
            .result = 204,
        },
        struct_kbdiacr{
            .diacr = 96,
            .base = 105,
            .result = 236,
        },
        struct_kbdiacr{
            .diacr = 39,
            .base = 73,
            .result = 205,
        },
        struct_kbdiacr{
            .diacr = 39,
            .base = 105,
            .result = 237,
        },
        struct_kbdiacr{
            .diacr = 94,
            .base = 73,
            .result = 206,
        },
        struct_kbdiacr{
            .diacr = 94,
            .base = 105,
            .result = 238,
        },
        struct_kbdiacr{
            .diacr = 34,
            .base = 73,
            .result = 207,
        },
        struct_kbdiacr{
            .diacr = 34,
            .base = 105,
            .result = 239,
        },
        struct_kbdiacr{
            .diacr = 45,
            .base = 68,
            .result = 208,
        },
        struct_kbdiacr{
            .diacr = 45,
            .base = 100,
            .result = 240,
        },
        struct_kbdiacr{
            .diacr = 126,
            .base = 78,
            .result = 209,
        },
        struct_kbdiacr{
            .diacr = 126,
            .base = 110,
            .result = 241,
        },
        struct_kbdiacr{
            .diacr = 96,
            .base = 79,
            .result = 210,
        },
        struct_kbdiacr{
            .diacr = 96,
            .base = 111,
            .result = 242,
        },
        struct_kbdiacr{
            .diacr = 39,
            .base = 79,
            .result = 211,
        },
        struct_kbdiacr{
            .diacr = 39,
            .base = 111,
            .result = 243,
        },
        struct_kbdiacr{
            .diacr = 94,
            .base = 79,
            .result = 212,
        },
        struct_kbdiacr{
            .diacr = 94,
            .base = 111,
            .result = 244,
        },
        struct_kbdiacr{
            .diacr = 126,
            .base = 79,
            .result = 213,
        },
        struct_kbdiacr{
            .diacr = 126,
            .base = 111,
            .result = 245,
        },
        struct_kbdiacr{
            .diacr = 34,
            .base = 79,
            .result = 214,
        },
        struct_kbdiacr{
            .diacr = 34,
            .base = 111,
            .result = 246,
        },
        struct_kbdiacr{
            .diacr = 47,
            .base = 79,
            .result = 216,
        },
        struct_kbdiacr{
            .diacr = 47,
            .base = 111,
            .result = 248,
        },
        struct_kbdiacr{
            .diacr = 96,
            .base = 85,
            .result = 217,
        },
        struct_kbdiacr{
            .diacr = 96,
            .base = 117,
            .result = 249,
        },
        struct_kbdiacr{
            .diacr = 39,
            .base = 85,
            .result = 218,
        },
        struct_kbdiacr{
            .diacr = 39,
            .base = 117,
            .result = 250,
        },
        struct_kbdiacr{
            .diacr = 94,
            .base = 85,
            .result = 219,
        },
        struct_kbdiacr{
            .diacr = 94,
            .base = 117,
            .result = 251,
        },
        struct_kbdiacr{
            .diacr = 34,
            .base = 85,
            .result = 220,
        },
        struct_kbdiacr{
            .diacr = 34,
            .base = 117,
            .result = 252,
        },
        struct_kbdiacr{
            .diacr = 39,
            .base = 89,
            .result = 221,
        },
        struct_kbdiacr{
            .diacr = 39,
            .base = 121,
            .result = 253,
        },
        struct_kbdiacr{
            .diacr = 84,
            .base = 72,
            .result = 222,
        },
        struct_kbdiacr{
            .diacr = 116,
            .base = 104,
            .result = 254,
        },
        struct_kbdiacr{
            .diacr = 115,
            .base = 115,
            .result = 223,
        },
        struct_kbdiacr{
            .diacr = 34,
            .base = 121,
            .result = 255,
        },
        struct_kbdiacr{
            .diacr = 115,
            .base = 122,
            .result = 223,
        },
        struct_kbdiacr{
            .diacr = 105,
            .base = 106,
            .result = 255,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
        struct_kbdiacr{
            .diacr = 0,
            .base = 0,
            .result = 0,
        },
    },
};
pub var default_key_map_0: [256]c_ushort = [256]c_ushort{
    61952,
    61467,
    61489,
    61490,
    61491,
    61492,
    61493,
    61494,
    61495,
    61496,
    61497,
    61488,
    61485,
    61501,
    61567,
    61449,
    64369,
    64375,
    64357,
    64370,
    64372,
    64377,
    64373,
    64361,
    64367,
    64368,
    61531,
    61533,
    61953,
    63234,
    64353,
    64371,
    64356,
    64358,
    64359,
    64360,
    64362,
    64363,
    64364,
    61499,
    61479,
    61536,
    63232,
    61532,
    64378,
    64376,
    64355,
    64374,
    64354,
    64366,
    64365,
    61484,
    61486,
    61487,
    63232,
    62220,
    63235,
    61472,
    64006,
    61696,
    61697,
    61698,
    61699,
    61700,
    61701,
    61702,
    61703,
    61704,
    61705,
    61960,
    61961,
    62215,
    62216,
    62217,
    62219,
    62212,
    62213,
    62214,
    62218,
    62209,
    62210,
    62211,
    62208,
    62224,
    61958,
    61952,
    61500,
    61706,
    61707,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    62222,
    63234,
    62221,
    61952,
    63235,
    61957,
    61716,
    62979,
    61720,
    62977,
    62978,
    61719,
    62976,
    61721,
    61717,
    61718,
    61722,
    61708,
    61709,
    61723,
    61724,
    61712,
    62225,
    61725,
    61952,
    62224,
    61952,
    61952,
    61952,
    63235,
    63235,
    61952,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
};
pub var default_key_map_1: [256]c_ushort = [256]c_ushort{
    61952,
    61467,
    61473,
    61504,
    61475,
    61476,
    61477,
    61534,
    61478,
    61482,
    61480,
    61481,
    61535,
    61483,
    61567,
    61449,
    64337,
    64343,
    64325,
    64338,
    64340,
    64345,
    64341,
    64329,
    64335,
    64336,
    61563,
    61565,
    61953,
    63234,
    64321,
    64339,
    64324,
    64326,
    64327,
    64328,
    64330,
    64331,
    64332,
    61498,
    61474,
    61566,
    63232,
    61564,
    64346,
    64344,
    64323,
    64342,
    64322,
    64334,
    64333,
    61500,
    61502,
    61503,
    63232,
    62220,
    63235,
    61472,
    64006,
    61708,
    61709,
    61710,
    61711,
    61712,
    61713,
    61714,
    61715,
    61726,
    61727,
    61960,
    61955,
    62215,
    62216,
    62217,
    62219,
    62212,
    62213,
    62214,
    62218,
    62209,
    62210,
    62211,
    62208,
    62224,
    61958,
    61952,
    61502,
    61728,
    61729,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    62222,
    63234,
    62221,
    61952,
    63235,
    61957,
    61716,
    62979,
    61963,
    62977,
    62978,
    61719,
    62976,
    61962,
    61717,
    61718,
    61722,
    61708,
    61709,
    61723,
    61724,
    61712,
    62225,
    61725,
    61952,
    62224,
    61952,
    61952,
    61952,
    63235,
    63235,
    61952,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
};
pub var default_key_map_2: [256]c_ushort = [256]c_ushort{
    61952,
    61467,
    61489,
    61490,
    61491,
    61492,
    61493,
    61494,
    61495,
    61496,
    61497,
    61488,
    61485,
    61501,
    61567,
    61449,
    64369,
    64375,
    64357,
    64370,
    64372,
    64377,
    64373,
    64361,
    64367,
    64368,
    61531,
    61533,
    61953,
    63234,
    64353,
    64371,
    64356,
    64358,
    64359,
    64360,
    64362,
    64363,
    64364,
    61499,
    61479,
    61536,
    63232,
    61532,
    64378,
    64376,
    64355,
    64374,
    64354,
    64366,
    64365,
    61484,
    61486,
    61487,
    63232,
    63766,
    63235,
    61472,
    64006,
    62732,
    62733,
    62734,
    62735,
    62736,
    62737,
    62738,
    62739,
    62740,
    62741,
    63764,
    61954,
    63761,
    63762,
    63763,
    63767,
    63758,
    63759,
    63760,
    63768,
    63755,
    63756,
    63757,
    63754,
    62224,
    61958,
    61952,
    61564,
    62742,
    62743,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    63769,
    63234,
    63765,
    61468,
    63235,
    61957,
    61716,
    62979,
    61720,
    62977,
    62978,
    61719,
    62976,
    61721,
    61717,
    61718,
    61722,
    61708,
    61709,
    61723,
    61724,
    61712,
    62225,
    61725,
    61952,
    62224,
    61952,
    61952,
    61952,
    63235,
    63235,
    61952,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
};
pub var default_key_map_3: [256]c_ushort = [256]c_ushort{
    62078,
    61467,
    61473,
    61504,
    61475,
    61476,
    61477,
    61534,
    61478,
    61482,
    61480,
    61481,
    61535,
    61483,
    61567,
    61449,
    64337,
    64343,
    64325,
    64338,
    64340,
    64345,
    64341,
    64329,
    64335,
    64336,
    61563,
    61565,
    61953,
    63234,
    64321,
    64339,
    64324,
    64326,
    64327,
    64328,
    64330,
    64331,
    64332,
    61498,
    61474,
    61566,
    63232,
    61564,
    64346,
    64344,
    64323,
    64342,
    64322,
    64334,
    64333,
    61500,
    61502,
    61503,
    63232,
    62220,
    63235,
    61472,
    64006,
    62744,
    62745,
    62746,
    62747,
    62748,
    62749,
    62750,
    62751,
    62752,
    62753,
    61960,
    61961,
    62215,
    62216,
    62217,
    62219,
    62212,
    62213,
    62214,
    62218,
    62209,
    62210,
    62211,
    62208,
    62224,
    61958,
    61952,
    166,
    62754,
    62755,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    62222,
    63234,
    62221,
    61468,
    63235,
    61957,
    61716,
    62979,
    61720,
    62977,
    62978,
    61719,
    62976,
    61721,
    61717,
    61718,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61725,
    61952,
    62224,
    61952,
    61952,
    61952,
    63235,
    63235,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
    61952,
};
pub var default_key_maps: [256][*c]c_ushort = [256][*c]c_ushort{
    @ptrCast(@alignCast(&default_key_map_0)),
    @ptrCast(@alignCast(&default_key_map_1)),
    @ptrCast(@alignCast(&default_key_map_2)),
    @ptrCast(@alignCast(&default_key_map_3)),
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
    null,
    null,
};
pub const k_handler_fn = fn (kbd: [*c]SDL_EVDEV_keyboard_state, value: u8, up_flag: u8) callconv(.c) void;
pub var k_handler: [16]?*const k_handler_fn = [16]?*const k_handler_fn{
    k_self,
    k_fn,
    k_spec,
    k_pad,
    k_dead,
    k_cons,
    k_cur,
    k_shift,
    k_meta,
    k_ascii,
    k_lock,
    k_lowercase,
    k_slock,
    k_dead2,
    k_brl,
    k_ignore,
};
pub const fn_handler_fn = fn (kbd: [*c]SDL_EVDEV_keyboard_state) callconv(.c) void;
pub var fn_handler: [20]?*const fn_handler_fn = [20]?*const fn_handler_fn{
    null,
    fn_enter,
    null,
    null,
    null,
    null,
    null,
    fn_caps_toggle,
    fn_num,
    null,
    null,
    null,
    null,
    fn_caps_on,
    fn_compose,
    null,
    null,
    null,
    null,
    fn_num,
};
pub var kbd_cleanup_state: [*c]SDL_EVDEV_keyboard_state = null;
pub var kbd_cleanup_sigactions_installed: c_int = 0;
pub var kbd_cleanup_atexit_installed: c_int = 0;
pub var old_sigaction: [65]struct_sigaction = @import("std").mem.zeroes([65]struct_sigaction);
pub var fatal_signals: [9]c_int = [9]c_int{
    SIGHUP,
    SIGQUIT,
    SIGILL,
    SIGABRT,
    SIGFPE,
    SIGSEGV,
    SIGPIPE,
    SIGBUS,
    SIGSYS,
};
pub fn kbd_cleanup() callconv(.c) void {
    @setEvalBranchQuota(100000);
    var kbd: [*c]SDL_EVDEV_keyboard_state = kbd_cleanup_state;
    _ = &kbd;
    if (!(kbd != null)) {
        return;
    }
    kbd_cleanup_state = null;
    _ = ioctl(kbd.*.console_fd, KDSKBMODE, kbd.*.old_kbd_mode);
}
pub fn SDL_EVDEV_kbd_reraise_signal(sig: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = raise(sig);
}
pub var SDL_EVDEV_kdb_cleanup_siginfo: [*c]siginfo_t = null;
pub var SDL_EVDEV_kdb_cleanup_ucontext: ?*anyopaque = null;
pub fn kbd_cleanup_signal_action(signum: c_int, info: [*c]siginfo_t, ucontext: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var old_action_p: [*c]struct_sigaction = &old_sigaction[@bitCast(@as(isize, @intCast(signum)))];
    _ = &old_action_p;
    var sigset_1: sigset_t = undefined;
    _ = &sigset_1;
    _ = sigaction(signum, old_action_p, null);
    _ = sigemptyset(&sigset_1);
    _ = sigaddset(&sigset_1, signum);
    _ = sigprocmask(SIG_UNBLOCK, &sigset_1, null);
    SDL_EVDEV_kdb_cleanup_siginfo = info;
    SDL_EVDEV_kdb_cleanup_ucontext = ucontext;
    kbd_cleanup();
    SDL_EVDEV_kbd_reraise_signal(signum);
}
pub fn kbd_unregister_emerg_cleanup() callconv(.c) void {
    @setEvalBranchQuota(100000);
    var tabidx: c_int = undefined;
    _ = &tabidx;
    kbd_cleanup_state = null;
    if (!(kbd_cleanup_sigactions_installed != 0)) {
        return;
    }
    kbd_cleanup_sigactions_installed = 0;
    {
        tabidx = 0;
        while (@as(c_ulong, @bitCast(@as(c_long, tabidx))) < (@sizeOf(@TypeOf(fatal_signals)) / @sizeOf(@TypeOf(fatal_signals[@as(c_int, 0)])))) : (tabidx += 1) {
            var old_action_p: [*c]struct_sigaction = undefined;
            _ = &old_action_p;
            var cur_action: struct_sigaction = undefined;
            _ = &cur_action;
            var signum: c_int = fatal_signals[@bitCast(@as(isize, @intCast(tabidx)))];
            _ = &signum;
            old_action_p = &old_sigaction[@bitCast(@as(isize, @intCast(signum)))];
            if (sigaction(signum, null, &cur_action) != 0) {
                continue;
            }
            if (!((cur_action.sa_flags & SA_SIGINFO) != 0) or (cur_action.__sigaction_handler.sa_sigaction != (&kbd_cleanup_signal_action))) {
                continue;
            }
            _ = sigaction(signum, old_action_p, null);
        }
    }
}
pub fn kbd_cleanup_atexit() callconv(.c) void {
    @setEvalBranchQuota(100000);
    kbd_cleanup();
    kbd_unregister_emerg_cleanup();
}
pub fn kbd_register_emerg_cleanup(kbd: [*c]SDL_EVDEV_keyboard_state) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var tabidx: c_int = undefined;
    _ = &tabidx;
    if (kbd_cleanup_state != null) {
        return;
    }
    kbd_cleanup_state = kbd;
    if (!(kbd_cleanup_atexit_installed != 0)) {
        _ = atexit(kbd_cleanup_atexit);
        kbd_cleanup_atexit_installed = 1;
    }
    if (kbd_cleanup_sigactions_installed != 0) {
        return;
    }
    kbd_cleanup_sigactions_installed = 1;
    {
        tabidx = 0;
        while (@as(c_ulong, @bitCast(@as(c_long, tabidx))) < (@sizeOf(@TypeOf(fatal_signals)) / @sizeOf(@TypeOf(fatal_signals[@as(c_int, 0)])))) : (tabidx += 1) {
            var old_action_p: [*c]struct_sigaction = undefined;
            _ = &old_action_p;
            var new_action: struct_sigaction = undefined;
            _ = &new_action;
            var signum: c_int = fatal_signals[@bitCast(@as(isize, @intCast(tabidx)))];
            _ = &signum;
            old_action_p = &old_sigaction[@bitCast(@as(isize, @intCast(signum)))];
            if (sigaction(signum, null, old_action_p) != 0) {
                continue;
            }
            if (((signum == SIGHUP) or (signum == SIGPIPE)) and ((old_action_p.*.__sigaction_handler.sa_handler != @as(__sighandler_t, null)) or (@as(?*const fn (c_int) callconv(.c) void, @ptrCast(@alignCast(@constCast(old_action_p.*.__sigaction_handler.sa_sigaction)))) != @as(__sighandler_t, null)))) {
                continue;
            }
            new_action = old_action_p.*;
            new_action.sa_flags |= SA_SIGINFO;
            new_action.__sigaction_handler.sa_sigaction = &kbd_cleanup_signal_action;
            _ = sigaction(signum, &new_action, null);
        }
    }
}
pub const VT_SIGNAL_NONE: c_int = 0;
pub const VT_SIGNAL_RELEASE: c_int = 1;
pub const VT_SIGNAL_ACQUIRE: c_int = 2;
pub var vt_release_signal: c_int = 0;
pub var vt_acquire_signal: c_int = 0;
pub var vt_signal_pending: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt);
pub const signal_handler = ?*const fn (signum: c_int) callconv(.c) void;
pub fn kbd_vt_release_signal_action(_: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = SDL_SetAtomicInt_REAL(&vt_signal_pending, VT_SIGNAL_RELEASE);
}
pub fn kbd_vt_acquire_signal_action(_: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = SDL_SetAtomicInt_REAL(&vt_signal_pending, VT_SIGNAL_ACQUIRE);
}
pub fn setup_vt_signal(signum: c_int, handler: signal_handler) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var old_action_p: [*c]struct_sigaction = undefined;
    _ = &old_action_p;
    var new_action: struct_sigaction = undefined;
    _ = &new_action;
    old_action_p = &old_sigaction[@bitCast(@as(isize, @intCast(signum)))];
    _ = memset(@ptrCast(@alignCast(&new_action)), 0, @sizeOf(@TypeOf(new_action)));
    new_action.__sigaction_handler.sa_handler = handler;
    new_action.sa_flags = SA_RESTART;
    if (sigaction(signum, &new_action, old_action_p) < @as(c_int, 0)) {
        return @"false" != 0;
    }
    if (old_action_p.*.__sigaction_handler.sa_handler != @as(__sighandler_t, null)) {
        _ = sigaction(signum, old_action_p, null);
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn find_free_signal(handler: signal_handler) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    {
        i = __libc_current_sigrtmin() + @as(c_int, 2);
        while (i <= __libc_current_sigrtmax()) : (i += 1) {
            if (setup_vt_signal(i, handler)) {
                return i;
            }
        }
    }
    if (setup_vt_signal(SIGUSR1, handler)) {
        return SIGUSR1;
    }
    if (setup_vt_signal(SIGUSR2, handler)) {
        return SIGUSR2;
    }
    return 0;
}
pub fn kbd_vt_quit(console_fd: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var mode: struct_vt_mode = undefined;
    _ = &mode;
    if (vt_release_signal != 0) {
        _ = sigaction(vt_release_signal, &old_sigaction[@bitCast(@as(isize, @intCast(vt_release_signal)))], null);
        vt_release_signal = 0;
    }
    if (vt_acquire_signal != 0) {
        _ = sigaction(vt_acquire_signal, &old_sigaction[@bitCast(@as(isize, @intCast(vt_acquire_signal)))], null);
        vt_acquire_signal = 0;
    }
    _ = memset(@ptrCast(@alignCast(&mode)), 0, @sizeOf(@TypeOf(mode)));
    mode.mode = VT_AUTO;
    _ = ioctl(console_fd, VT_SETMODE, &mode);
}
pub fn kbd_vt_init(console_fd: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var mode: struct_vt_mode = undefined;
    _ = &mode;
    vt_release_signal = find_free_signal(kbd_vt_release_signal_action);
    vt_acquire_signal = find_free_signal(kbd_vt_acquire_signal_action);
    if (!(vt_release_signal != 0) or !(vt_acquire_signal != 0)) {
        kbd_vt_quit(console_fd);
        return @"false" != 0;
    }
    _ = memset(@ptrCast(@alignCast(&mode)), 0, @sizeOf(@TypeOf(mode)));
    mode.mode = VT_PROCESS;
    mode.relsig = @truncate(vt_release_signal);
    mode.acqsig = @truncate(vt_acquire_signal);
    mode.frsig = SIGPOLL;
    if (ioctl(console_fd, VT_SETMODE, &mode) < @as(c_int, 0)) {
        kbd_vt_quit(console_fd);
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn kbd_vt_update(state: [*c]SDL_EVDEV_keyboard_state) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var signal_pending: c_int = SDL_GetAtomicInt_REAL(&vt_signal_pending);
    _ = &signal_pending;
    if (signal_pending != VT_SIGNAL_NONE) {
        if (signal_pending == VT_SIGNAL_RELEASE) {
            if (state.*.vt_release_callback != null) {
                state.*.vt_release_callback.?(state.*.vt_release_callback_data);
            }
            _ = ioctl(state.*.console_fd, VT_RELDISP, @as(c_int, 1));
        } else {
            if (state.*.vt_acquire_callback != null) {
                state.*.vt_acquire_callback.?(state.*.vt_acquire_callback_data);
            }
            _ = ioctl(state.*.console_fd, VT_RELDISP, VT_ACKACQ);
        }
        _ = SDL_CompareAndSwapAtomicInt_REAL(&vt_signal_pending, signal_pending, VT_SIGNAL_NONE);
    }
}
pub fn put_queue(kbd: [*c]SDL_EVDEV_keyboard_state, c: uint) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (@as(c_ulong, kbd.*.text_len) < (@sizeOf(@TypeOf(kbd.*.text)) -% @as(c_ulong, 1))) {
        kbd.*.text[
            blk: {
                const ref = &kbd.*.text_len;
                const tmp = ref.*;
                ref.* +%= 1;
                break :blk tmp;
            }
        ] = @truncate(c);
    }
}
pub fn put_utf8(kbd: [*c]SDL_EVDEV_keyboard_state, arg_c: uint) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var c = arg_c;
    _ = &c;
    if (c < @as(uint, 128)) {
        put_queue(kbd, c);
    } else if (c < @as(uint, 2048)) {
        put_queue(kbd, @as(uint, 192) | (c >> @intCast(@as(uint, 6))));
        put_queue(kbd, @as(uint, 128) | (c & @as(uint, 63)));
    } else if (c < @as(uint, 65536)) {
        if ((c >= @as(uint, 55296)) and (c < @as(uint, 57344))) {
            return;
        }
        if (c == @as(uint, 65535)) {
            return;
        }
        put_queue(kbd, @as(uint, 224) | (c >> @intCast(@as(uint, 12))));
        put_queue(kbd, @as(uint, 128) | ((c >> @intCast(@as(uint, 6))) & @as(uint, 63)));
        put_queue(kbd, @as(uint, 128) | (c & @as(uint, 63)));
    } else if (c < @as(uint, 1114112)) {
        put_queue(kbd, @as(uint, 240) | (c >> @intCast(@as(uint, 18))));
        put_queue(kbd, @as(uint, 128) | ((c >> @intCast(@as(uint, 12))) & @as(uint, 63)));
        put_queue(kbd, @as(uint, 128) | ((c >> @intCast(@as(uint, 6))) & @as(uint, 63)));
        put_queue(kbd, @as(uint, 128) | (c & @as(uint, 63)));
    }
}
pub fn handle_diacr(kbd: [*c]SDL_EVDEV_keyboard_state, ch: c_uint) callconv(.c) c_uint {
    @setEvalBranchQuota(100000);
    var d: c_uint = kbd.*.diacr;
    _ = &d;
    var i: c_uint = undefined;
    _ = &i;
    kbd.*.diacr = 0;
    if (kbd.*.console_fd >= @as(c_int, 0)) if (ioctl(kbd.*.console_fd, KDGKBDIACR, kbd.*.accents) < @as(c_int, 0)) {};
    {
        i = 0;
        while (i < kbd.*.accents.*.kb_cnt) : (i +%= 1) {
            if ((@as(c_uint, @bitCast(@as(c_int, @as(c_int, kbd.*.accents.*.kbdiacr[i].diacr)))) == d) and (@as(c_uint, @bitCast(@as(c_int, @as(c_int, kbd.*.accents.*.kbdiacr[i].base)))) == ch)) {
                return kbd.*.accents.*.kbdiacr[i].result;
            }
        }
    }
    if ((ch == @as(c_uint, ' ')) or (ch == d)) {
        return d;
    }
    put_utf8(kbd, d);
    return ch;
}
pub fn vc_kbd_led(kbd: [*c]SDL_EVDEV_keyboard_state, arg_flag: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var flag = arg_flag;
    _ = &flag;
    return (@as(c_int, kbd.*.ledflagstate) & flag) != @as(c_int, 0);
}
pub fn set_vc_kbd_led(kbd: [*c]SDL_EVDEV_keyboard_state, flag: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    {
        const ref = &kbd.*.ledflagstate;
        ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | flag)));
    }
    _ = ioctl(kbd.*.console_fd, KDSETLED, @as(c_ulong, kbd.*.ledflagstate));
}
pub fn clr_vc_kbd_led(kbd: [*c]SDL_EVDEV_keyboard_state, flag: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    {
        const ref = &kbd.*.ledflagstate;
        ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) & ~flag)));
    }
    _ = ioctl(kbd.*.console_fd, KDSETLED, @as(c_ulong, kbd.*.ledflagstate));
}
pub fn chg_vc_kbd_lock(kbd: [*c]SDL_EVDEV_keyboard_state, flag: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    {
        const ref = &kbd.*.lockstate;
        ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) ^ (@as(c_int, 1) << @intCast(flag)))));
    }
}
pub fn chg_vc_kbd_slock(kbd: [*c]SDL_EVDEV_keyboard_state, flag: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    {
        const ref = &kbd.*.slockstate;
        ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) ^ (@as(c_int, 1) << @intCast(flag)))));
    }
}
pub fn chg_vc_kbd_led(kbd: [*c]SDL_EVDEV_keyboard_state, flag: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    {
        const ref = &kbd.*.ledflagstate;
        ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) ^ flag)));
    }
    _ = ioctl(kbd.*.console_fd, KDSETLED, @as(c_ulong, kbd.*.ledflagstate));
}
pub fn fn_enter(kbd: [*c]SDL_EVDEV_keyboard_state) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (kbd.*.diacr != 0) {
        put_utf8(kbd, kbd.*.diacr);
        kbd.*.diacr = 0;
    }
}
pub fn fn_caps_toggle(kbd: [*c]SDL_EVDEV_keyboard_state) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (kbd.*.rep) {
        return;
    }
    chg_vc_kbd_led(kbd, K_CAPSLOCK);
}
pub fn fn_caps_on(kbd: [*c]SDL_EVDEV_keyboard_state) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (kbd.*.rep) {
        return;
    }
    set_vc_kbd_led(kbd, K_CAPSLOCK);
}
pub fn fn_num(kbd: [*c]SDL_EVDEV_keyboard_state) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (!kbd.*.rep) {
        chg_vc_kbd_led(kbd, K_NUMLOCK);
    }
}
pub fn fn_compose(kbd: [*c]SDL_EVDEV_keyboard_state) callconv(.c) void {
    @setEvalBranchQuota(100000);
    kbd.*.dead_key_next = @"true" != 0;
}
pub fn k_ignore(_: [*c]SDL_EVDEV_keyboard_state, _: u8, _: u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn k_spec(kbd: [*c]SDL_EVDEV_keyboard_state, value: u8, up_flag: u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (@as(c_int, up_flag) != 0) {
        return;
    }
    if (@as(c_ulong, @bitCast(@as(c_long, @as(c_int, value)))) >= (@sizeOf(@TypeOf(fn_handler)) / @sizeOf(@TypeOf(fn_handler[@as(c_int, 0)])))) {
        return;
    }
    if (fn_handler[value] != null) {
        fn_handler[value].?(kbd);
    }
}
pub fn k_lowercase(_: [*c]SDL_EVDEV_keyboard_state, _: u8, _: u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn k_self(kbd: [*c]SDL_EVDEV_keyboard_state, arg_value: u8, up_flag: u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var value = arg_value;
    _ = &value;
    if (@as(c_int, up_flag) != 0) {
        return;
    }
    if (kbd.*.diacr != 0) {
        value = @truncate(handle_diacr(kbd, value));
    }
    if (kbd.*.dead_key_next) {
        kbd.*.dead_key_next = @"false" != 0;
        kbd.*.diacr = value;
        return;
    }
    put_utf8(kbd, value);
}
pub fn k_deadunicode(kbd: [*c]SDL_EVDEV_keyboard_state, value: c_uint, up_flag: u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (@as(c_int, up_flag) != 0) {
        return;
    }
    kbd.*.diacr = if (kbd.*.diacr != 0) handle_diacr(kbd, value) else value;
}
pub fn k_dead(kbd: [*c]SDL_EVDEV_keyboard_state, value: u8, up_flag: u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const ret_diacr: [27]u8 = [6]u8{
        '`',
        '\'',
        '^',
        '~',
        '"',
        ',',
    } ++ @as([21]u8, @splat(0));
    _ = &ret_diacr;
    k_deadunicode(kbd, ret_diacr[value], up_flag);
}
pub fn k_dead2(kbd: [*c]SDL_EVDEV_keyboard_state, value: u8, up_flag: u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    k_deadunicode(kbd, value, up_flag);
}
pub fn k_cons(_: [*c]SDL_EVDEV_keyboard_state, _: u8, _: u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn k_fn(_: [*c]SDL_EVDEV_keyboard_state, _: u8, _: u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn k_cur(_: [*c]SDL_EVDEV_keyboard_state, _: u8, _: u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn k_pad(kbd: [*c]SDL_EVDEV_keyboard_state, value: u8, up_flag: u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local_pad_chars = struct {
        const pad_chars: [21:0]u8 = "0123456789+-*/\r,.?()#".*;
    };
    _ = &static_local_pad_chars;
    if (@as(c_int, up_flag) != 0) {
        return;
    }
    if (!vc_kbd_led(kbd, K_NUMLOCK)) {
        return;
    }
    put_queue(kbd, static_local_pad_chars.pad_chars[value]);
}
pub fn k_shift(kbd: [*c]SDL_EVDEV_keyboard_state, arg_value: u8, up_flag: u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var value = arg_value;
    _ = &value;
    var old_state: c_int = kbd.*.shift_state;
    _ = &old_state;
    if (kbd.*.rep) {
        return;
    }
    if (@as(c_int, value) == (((KT_SHIFT << @intCast(@as(c_int, 8))) | KG_CAPSSHIFT) & @as(c_int, 255))) {
        value = @bitCast(@as(i8, @truncate(((KT_SHIFT << @intCast(@as(c_int, 8))) | KG_SHIFT) & @as(c_int, 255))));
        if (!(@as(c_int, up_flag) != 0)) {
            clr_vc_kbd_led(kbd, K_CAPSLOCK);
        }
    }
    if (@as(c_int, up_flag) != 0) {
        if (@as(c_int, kbd.*.shift_down[value]) != 0) {
            kbd.*.shift_down[value] -%= 1;
        }
    } else {
        kbd.*.shift_down[value] +%= 1;
    }
    if (@as(c_int, kbd.*.shift_down[value]) != 0) {
        {
            const ref = &kbd.*.shift_state;
            ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | (@as(c_int, 1) << @intCast(@as(c_int, value))))));
        }
    } else {
        {
            const ref = &kbd.*.shift_state;
            ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) & ~(@as(c_int, 1) << @intCast(@as(c_int, value))))));
        }
    }
    if (((@as(c_int, up_flag) != 0) and (@as(c_int, kbd.*.shift_state) != old_state)) and (kbd.*.npadch != -@as(c_int, 1))) {
        put_utf8(kbd, @bitCast(@as(c_int, kbd.*.npadch)));
        kbd.*.npadch = -@as(c_int, 1);
    }
}
pub fn k_meta(_: [*c]SDL_EVDEV_keyboard_state, _: u8, _: u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn k_ascii(kbd: [*c]SDL_EVDEV_keyboard_state, arg_value: u8, up_flag: u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var value = arg_value;
    _ = &value;
    var base: c_int = undefined;
    _ = &base;
    if (@as(c_int, up_flag) != 0) {
        return;
    }
    if (@as(c_int, value) < @as(c_int, 10)) {
        base = 10;
    } else {
        {
            const ref = &value;
            ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) - @as(c_int, 10))));
        }
        base = 16;
    }
    if (kbd.*.npadch == -@as(c_int, 1)) {
        kbd.*.npadch = value;
    } else {
        kbd.*.npadch = (kbd.*.npadch * base) + @as(c_int, value);
    }
}
pub fn k_lock(kbd: [*c]SDL_EVDEV_keyboard_state, value: u8, up_flag: u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if ((@as(c_int, up_flag) != 0) or kbd.*.rep) {
        return;
    }
    chg_vc_kbd_lock(kbd, value);
}
pub fn k_slock(kbd: [*c]SDL_EVDEV_keyboard_state, value: u8, up_flag: u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    k_shift(kbd, value, up_flag);
    if ((@as(c_int, up_flag) != 0) or kbd.*.rep) {
        return;
    }
    chg_vc_kbd_slock(kbd, value);
    if (!(kbd.*.key_maps[@bitCast(@as(isize, @intCast(@as(c_int, kbd.*.lockstate) ^ @as(c_int, kbd.*.slockstate))))] != null)) {
        kbd.*.slockstate = 0;
        chg_vc_kbd_slock(kbd, value);
    }
}
pub fn k_brl(_: [*c]SDL_EVDEV_keyboard_state, _: u8, _: u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub const O_RDONLY = @as(c_int, 0o0);
pub const __O_CLOEXEC = __helpers.promoteIntLiteral(c_int, 0o2000000, .octal);
pub const TIOCLINUX = @as(c_int, 0x541C);
pub const KDSETLED = @as(c_int, 0x4B32);
pub const KDGKBTYPE = @as(c_int, 0x4B33);
pub const KB_84 = @as(c_int, 0x01);
pub const KB_101 = @as(c_int, 0x02);
pub const K_UNICODE = @as(c_int, 0x03);
pub const K_OFF = @as(c_int, 0x04);
pub const KDGKBMODE = @as(c_int, 0x4B44);
pub const KDSKBMODE = @as(c_int, 0x4B45);
pub const K_NUMLOCK = @as(c_int, 0x02);
pub const K_CAPSLOCK = @as(c_int, 0x04);
pub const KDGKBLED = @as(c_int, 0x4B64);
pub const KDGKBENT = @as(c_int, 0x4B46);
pub const KDGKBDIACR = @as(c_int, 0x4B4A);
pub const KG_SHIFT = @as(c_int, 0);
pub const KG_CAPSSHIFT = @as(c_int, 8);
pub const NR_KEYS = @as(c_int, 256);
pub const MAX_NR_KEYMAPS = @as(c_int, 256);
pub const KT_LATIN = @as(c_int, 0);
pub const KT_SHIFT = @as(c_int, 7);
pub const KT_LETTER = @as(c_int, 11);
pub const KT_SLOCK = @as(c_int, 12);
pub const VT_SETMODE = @as(c_int, 0x5602);
pub const VT_AUTO = @as(c_int, 0x00);
pub const VT_PROCESS = @as(c_int, 0x01);
pub const VT_ACKACQ = @as(c_int, 0x02);
pub const VT_RELDISP = @as(c_int, 0x5605);
pub const TIOCL_GETSHIFTSTATE = @as(c_int, 6);
pub const SIGILL = @as(c_int, 4);
pub const SIGABRT = @as(c_int, 6);
pub const SIGFPE = @as(c_int, 8);
pub const SIGSEGV = @as(c_int, 11);
pub const SIGHUP = @as(c_int, 1);
pub const SIGQUIT = @as(c_int, 3);
pub const SIGPIPE = @as(c_int, 13);
pub const SIGBUS = @as(c_int, 7);
pub const SIGSYS = @as(c_int, 31);
pub const SIGPOLL = @as(c_int, 29);
pub const SIGUSR1 = @as(c_int, 10);
pub const SIGUSR2 = @as(c_int, 12);
pub const si_pid = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:128:9
pub const si_uid = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:129:9
pub const si_overrun = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:131:9
pub const si_status = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:132:9
pub const si_utime = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:133:9
pub const si_stime = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:134:9
pub const si_addr = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:138:9
pub const si_addr_lsb = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:139:9
pub const si_band = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:143:9
pub const si_fd = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:144:9
pub const sa_handler = @compileError("unable to translate macro: undefined identifier `__sigaction_handler`");
// /usr/include/bits/sigaction.h:39:10
pub const sa_sigaction = @compileError("unable to translate macro: undefined identifier `__sigaction_handler`");
// /usr/include/bits/sigaction.h:40:10
pub const SA_SIGINFO = @as(c_int, 4);
pub const SA_RESTART = __helpers.promoteIntLiteral(c_int, 0x10000000, .hex);
pub const SIG_UNBLOCK = @as(c_int, 1);
pub const kbdiacr = struct_kbdiacr;
