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
pub const __time_t = c_long;
pub const __syscall_slong_t = c_long;
pub const __sigset_t = extern struct {
    __val: [16]c_ulong = @import("std").mem.zeroes([16]c_ulong),
};
pub const struct_timespec = extern struct {
    tv_sec: __time_t = 0,
    tv_nsec: __syscall_slong_t = 0,
};
pub const Sint64 = i64;
pub const Uint64 = u64;
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
pub export fn SDL_IOReady(fd: c_int, flags: c_int, arg_timeoutNS: Sint64) c_int {
    @setEvalBranchQuota(100000);
    var timeoutNS = arg_timeoutNS;
    _ = &timeoutNS;
    const static_local___func__ = struct {
        const __func__: [11:0]u8 = "SDL_IOReady".*;
    };
    _ = &static_local___func__;
    var result: c_int = undefined;
    _ = &result;
    while (true) {
        while (!((flags & (SDL_IOR_READ | SDL_IOR_WRITE)) != 0)) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "flags & (0x1 | 0x2)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_poll.c", 37);
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
    while (true) {
        var info: struct_pollfd = undefined;
        _ = &info;
        info.fd = fd;
        info.events = 0;
        if ((flags & SDL_IOR_READ) != 0) {
            {
                const ref = &info.events;
                ref.* = @truncate(@as(c_int, ref.*) | (POLLIN | POLLPRI));
            }
        }
        if ((flags & SDL_IOR_WRITE) != 0) {
            {
                const ref = &info.events;
                ref.* = @truncate(@as(c_int, ref.*) | POLLOUT);
            }
        }
        var timeout: [*c]struct_timespec = null;
        _ = &timeout;
        var ts: struct_timespec = undefined;
        _ = &ts;
        if (timeoutNS >= @as(Sint64, 0)) {
            ts.tv_sec = @truncate(@divTrunc(@as(c_longlong, timeoutNS), SDL_NS_PER_SECOND));
            ts.tv_nsec = @bitCast(@as(c_ulong, @truncate(@as(c_ulonglong, @bitCast(@as(c_longlong, timeoutNS))) -% (@as(c_ulonglong, @as(Uint64, @bitCast(@as(c_long, ts.tv_sec)))) *% @as(c_ulonglong, SDL_NS_PER_SECOND)))));
            timeout = &ts;
        }
        result = ppoll(&info, 1, timeout, null);
        if (!(((result < @as(c_int, 0)) and (__errno_location().* == EINTR)) and !((flags & SDL_IOR_NO_RETRY) != 0))) break;
    }
    return result;
}

pub const @"false" = @as(c_int, 0);
pub const SDL_NS_PER_SECOND = @as(c_longlong, 1000000000);
pub const SDL_IOR_READ = @as(c_int, 0x1);
pub const SDL_IOR_WRITE = @as(c_int, 0x2);
pub const SDL_IOR_NO_RETRY = @as(c_int, 0x4);
pub const nfds_t = c_ulong;
pub const struct_pollfd = extern struct {
    fd: c_int = 0,
    events: c_short = 0,
    revents: c_short = 0,
};
pub extern fn ppoll(__fds: [*c]struct_pollfd, __nfds: nfds_t, __timeout: [*c]const struct_timespec, __ss: [*c]const __sigset_t) c_int;
pub extern fn __errno_location() [*c]c_int;
pub const POLLIN = @as(c_int, 0x001);
pub const POLLPRI = @as(c_int, 0x002);
pub const POLLOUT = @as(c_int, 0x004);
pub const EINTR = @as(c_int, 4);
