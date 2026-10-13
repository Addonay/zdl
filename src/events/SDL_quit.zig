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
pub const __uint32_t = c_uint;
pub const __uid_t = c_uint;
pub const __pid_t = c_int;
pub const __clock_t = c_long;
pub const __sigset_t = extern struct {
    __val: [16]c_ulong = @import("std").mem.zeroes([16]c_ulong),
};
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
pub const SDL_EVENT_QUIT: c_int = 256;
pub const enum_SDL_EventType = c_uint;
pub const SDL_EventType = enum_SDL_EventType;
pub extern fn SDL_GetHintBoolean_REAL(name: [*c]const u8, default_value: bool) bool;
pub const union_sigval = extern union {
    sival_int: c_int,
    sival_ptr: ?*anyopaque,
};
pub const __sigval_t = union_sigval;
const struct_unnamed_15 = extern struct {
    si_pid: __pid_t = 0,
    si_uid: __uid_t = 0,
};
const struct_unnamed_16 = extern struct {
    si_tid: c_int = 0,
    si_overrun: c_int = 0,
    si_sigval: __sigval_t = @import("std").mem.zeroes(__sigval_t),
};
const struct_unnamed_17 = extern struct {
    si_pid: __pid_t = 0,
    si_uid: __uid_t = 0,
    si_sigval: __sigval_t = @import("std").mem.zeroes(__sigval_t),
};
const struct_unnamed_18 = extern struct {
    si_pid: __pid_t = 0,
    si_uid: __uid_t = 0,
    si_status: c_int = 0,
    si_utime: __clock_t = 0,
    si_stime: __clock_t = 0,
};
const struct_unnamed_21 = extern struct {
    _lower: ?*anyopaque = null,
    _upper: ?*anyopaque = null,
};
const union_unnamed_20 = extern union {
    _addr_bnd: struct_unnamed_21,
    _pkey: __uint32_t,
};
const struct_unnamed_19 = extern struct {
    si_addr: ?*anyopaque = null,
    si_addr_lsb: c_short = 0,
    _bounds: union_unnamed_20 = @import("std").mem.zeroes(union_unnamed_20),
};
const struct_unnamed_22 = extern struct {
    si_band: c_long = 0,
    si_fd: c_int = 0,
};
const struct_unnamed_23 = extern struct {
    _call_addr: ?*anyopaque = null,
    _syscall: c_int = 0,
    _arch: c_uint = 0,
};
const union_unnamed_14 = extern union {
    _pad: [28]c_int,
    _kill: struct_unnamed_15,
    _timer: struct_unnamed_16,
    _rt: struct_unnamed_17,
    _sigchld: struct_unnamed_18,
    _sigfault: struct_unnamed_19,
    _sigpoll: struct_unnamed_22,
    _sigsys: struct_unnamed_23,
};
pub const siginfo_t = extern struct {
    si_signo: c_int = 0,
    si_errno: c_int = 0,
    si_code: c_int = 0,
    __pad0: c_int = 0,
    _sifields: union_unnamed_14 = @import("std").mem.zeroes(union_unnamed_14),
};
pub const __sighandler_t = ?*const fn (c_int) callconv(.c) void;
const union_unnamed_36 = extern union {
    sa_handler: __sighandler_t,
    sa_sigaction: ?*const fn (c_int, [*c]siginfo_t, ?*anyopaque) callconv(.c) void,
};
pub const struct_sigaction = extern struct {
    __sigaction_handler: union_unnamed_36 = @import("std").mem.zeroes(union_unnamed_36),
    sa_mask: __sigset_t = @import("std").mem.zeroes(__sigset_t),
    sa_flags: c_int = 0,
    sa_restorer: ?*const fn () callconv(.c) void = null,
};
pub extern fn sigaction(__sig: c_int, noalias __act: [*c]const struct_sigaction, noalias __oact: [*c]struct_sigaction) c_int;
pub extern fn SDL_SendAppEvent(eventType: SDL_EventType) void;
pub var disable_signals: bool = @"false" != 0;
pub var send_quit_pending: bool = @"false" != 0;
pub fn SDL_HandleSIG(sig: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if ((sig == SIGINT) or (sig == SIGTERM)) {
        send_quit_pending = @"true" != 0;
    }
}
pub fn SDL_EventSignal_Init(sig: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = &sig;
    var action: struct_sigaction = undefined;
    _ = &action;
    _ = sigaction(sig, null, &action);
    if ((action.__sigaction_handler.sa_handler == @as(__sighandler_t, null)) and (@as(?*const fn (c_int) callconv(.c) void, @ptrCast(@alignCast(@constCast(action.__sigaction_handler.sa_sigaction)))) == @as(__sighandler_t, null))) {
        action.__sigaction_handler.sa_handler = SDL_HandleSIG;
        _ = sigaction(sig, &action, null);
    }
}
pub fn SDL_EventSignal_Quit(sig: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = &sig;
    var action: struct_sigaction = undefined;
    _ = &action;
    _ = sigaction(sig, null, &action);
    if (action.__sigaction_handler.sa_handler == SDL_HandleSIG) {
        action.__sigaction_handler.sa_handler = null;
        _ = sigaction(sig, &action, null);
    }
}
pub fn SDL_QuitInit_Internal() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    SDL_EventSignal_Init(SIGINT);
    SDL_EventSignal_Init(SIGTERM);
    return @"true" != 0;
}
pub fn SDL_QuitQuit_Internal() callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_EventSignal_Quit(SIGINT);
    SDL_EventSignal_Quit(SIGTERM);
}
pub export fn SDL_InitQuit() bool {
    @setEvalBranchQuota(100000);
    if (!SDL_GetHintBoolean_REAL("SDL_NO_SIGNAL_HANDLERS", @"false" != 0)) {
        return SDL_QuitInit_Internal();
    }
    return @"true" != 0;
}
pub export fn SDL_QuitQuit() void {
    @setEvalBranchQuota(100000);
    if (!disable_signals) {
        SDL_QuitQuit_Internal();
    }
}
pub export fn SDL_SendPendingSignalEvents() void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [27:0]u8 = "SDL_SendPendingSignalEvents".*;
    };
    _ = &static_local___func__;
    if (send_quit_pending) {
        SDL_SendQuit();
        while (true) {
            while (!!send_quit_pending) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "!send_quit_pending",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_quit.c", 171);
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
}
pub export fn SDL_SendQuit() void {
    @setEvalBranchQuota(100000);
    send_quit_pending = @"false" != 0;
    SDL_SendAppEvent(SDL_EVENT_QUIT);
}

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SIGINT = @as(c_int, 2);
pub const SIGTERM = @as(c_int, 15);
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
