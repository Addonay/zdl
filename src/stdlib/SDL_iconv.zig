const __helpers = @import("std").zig.c_translation.helpers;
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
pub const ptrdiff_t = c_long;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint32 = u32;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_realloc_REAL(mem: ?*anyopaque, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub const struct_SDL_iconv_data_t = opaque {
};
pub const SDL_iconv_t = ?*struct_SDL_iconv_data_t;
pub const iconv_t = ?*anyopaque;
pub extern fn iconv_close(__cd: iconv_t) c_int;
pub extern fn iconv_open(__tocode: [*c]const u8, __fromcode: [*c]const u8) iconv_t;
pub extern fn iconv(__cd: iconv_t, noalias __inbuf: [*c][*c]u8, noalias __inbytesleft: [*c]usize, noalias __outbuf: [*c][*c]u8, noalias __outbytesleft: [*c]usize) usize;
pub extern fn __errno_location() [*c]c_int;
pub export fn SDL_iconv_open_REAL(tocode: [*c]const u8, fromcode: [*c]const u8) SDL_iconv_t {
    @setEvalBranchQuota(100000);
    return @ptrFromInt(@as(usize, @intCast(@intFromPtr(iconv_open(tocode, fromcode)))));
}
pub export fn SDL_iconv_close_REAL(cd: SDL_iconv_t) c_int {
    @setEvalBranchQuota(100000);
    if (@as(usize, @intCast(@intFromPtr(cd))) == @as(usize, @bitCast(@as(c_long, -@as(c_int, 1))))) {
        return -@as(c_int, 1);
    }
    return iconv_close(@ptrFromInt(@as(usize, @intCast(@intFromPtr(cd)))));
}
pub export fn SDL_iconv_REAL(cd: SDL_iconv_t, inbuf: [*c][*c]const u8, inbytesleft: [*c]usize, outbuf: [*c][*c]u8, outbytesleft: [*c]usize) usize {
    @setEvalBranchQuota(100000);
    var retCode: usize = undefined;
    _ = &retCode;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (@as(usize, @intCast(@intFromPtr(cd))) == @as(usize, @bitCast(@as(c_long, -@as(c_int, 1))))) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return @bitCast(@as(c_long, -@as(c_int, 1)));
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                retCode = iconv(@ptrFromInt(@as(usize, @intCast(@intFromPtr(cd)))), @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(@alignCast(inbuf))))), inbytesleft, outbuf, outbytesleft);
                if (retCode == @as(usize, @bitCast(@as(c_long, -@as(c_int, 1))))) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                switch (__errno_location().*) {
                    E2BIG => {
                        sdl_pc = 8;
                        continue;
                    },
                    EILSEQ => {
                        sdl_pc = 9;
                        continue;
                    },
                    EINVAL => {
                        sdl_pc = 10;
                        continue;
                    },
                    else => {
                        sdl_pc = 11;
                        continue;
                    },
                }
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                return retCode;
            },
            7 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            8 => {
                return @bitCast(@as(c_long, -@as(c_int, 2)));
            },
            9 => {
                return @bitCast(@as(c_long, -@as(c_int, 3)));
            },
            10 => {
                return @bitCast(@as(c_long, -@as(c_int, 4)));
            },
            11 => {
                return @bitCast(@as(c_long, -@as(c_int, 1)));
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_iconv_string_REAL(arg_tocode: [*c]const u8, arg_fromcode: [*c]const u8, arg_inbuf: [*c]const u8, arg_inbytesleft: usize) [*c]u8 {
    @setEvalBranchQuota(100000);
    var tocode = arg_tocode;
    _ = &tocode;
    var fromcode = arg_fromcode;
    _ = &fromcode;
    var inbuf = arg_inbuf;
    _ = &inbuf;
    var inbytesleft = arg_inbytesleft;
    _ = &inbytesleft;
    var cd: SDL_iconv_t = undefined;
    _ = &cd;
    var string: [*c]u8 = undefined;
    _ = &string;
    var stringsize: usize = undefined;
    _ = &stringsize;
    var outbuf: [*c]u8 = undefined;
    _ = &outbuf;
    var outbytesleft: usize = undefined;
    _ = &outbytesleft;
    var retCode: usize = undefined;
    _ = &retCode;
    var oldinbytesleft: usize = undefined;
    _ = &oldinbytesleft;
    var diff: ptrdiff_t = undefined;
    _ = &diff;
    var oldstring: [*c]u8 = undefined;
    _ = &oldstring;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                retCode = 0;
                if (!(tocode != null) or !(@as(c_int, tocode.*) != 0)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                tocode = "UTF-8";
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                if (!(fromcode != null) or !(@as(c_int, fromcode.*) != 0)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                fromcode = "UTF-8";
                {
                    sdl_pc = 6;
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
                cd = SDL_iconv_open_REAL(tocode, fromcode);
                if (cd == @as(SDL_iconv_t, @ptrFromInt(@as(usize, @intCast(__helpers.cast(usize, @as(isize, -@as(c_int, 1)))))))) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                return null;
            },
            8 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                stringsize = inbytesleft;
                string = @ptrCast(@alignCast(SDL_malloc_REAL(stringsize +% @sizeOf(Uint32))));
                if (!(string != null)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                _ = SDL_iconv_close_REAL(cd);
                return null;
            },
            11 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                outbuf = string;
                outbytesleft = stringsize;
                _ = memset(@ptrCast(@alignCast(outbuf)), 0, @sizeOf(Uint32));
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                if (inbytesleft > @as(usize, 0)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                oldinbytesleft = inbytesleft;
                retCode = SDL_iconv_REAL(cd, &inbuf, &inbytesleft, &outbuf, &outbytesleft);
                switch (retCode) {
                    @as(usize, @bitCast(@as(c_long, -@as(c_int, 2)))) => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(usize, @bitCast(@as(c_long, -@as(c_int, 3)))) => {
                        sdl_pc = 21;
                        continue;
                    },
                    @as(usize, @bitCast(@as(c_long, -@as(c_int, 4)))) => {
                        sdl_pc = 22;
                        continue;
                    },
                    @as(usize, @bitCast(@as(c_long, -@as(c_int, 1)))) => {
                        sdl_pc = 23;
                        continue;
                    },
                    else => {
                        sdl_pc = 16;
                        continue;
                    },
                }
            },
            15 => {
                _ = memset(@ptrCast(@alignCast(outbuf)), 0, @sizeOf(Uint32));
                _ = SDL_iconv_close_REAL(cd);
                return string;
            },
            16 => {
                if (oldinbytesleft == inbytesleft) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            17 => {
                diff = @divExact(@as(c_long, @bitCast(@intFromPtr(outbuf) -% @intFromPtr(string))), @sizeOf(u8));
                oldstring = string;
                stringsize *%= 2;
                string = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(string)), stringsize +% @sizeOf(Uint32))));
                if (!(string != null)) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            18 => {
                SDL_free_REAL(@ptrCast(@alignCast(oldstring)));
                _ = SDL_iconv_close_REAL(cd);
                return null;
            },
            19 => {
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            20 => {
                outbuf = string + @as(usize, @bitCast(@as(isize, @intCast(diff))));
                outbytesleft = stringsize -% @as(usize, @bitCast(@as(c_long, diff)));
                _ = memset(@ptrCast(@alignCast(outbuf)), 0, @sizeOf(Uint32));
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            21 => {
                inbuf += 1;
                inbytesleft -%= 1;
                {
                    sdl_pc = 16;
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
                inbytesleft = 0;
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            24 => {
                {
                    sdl_pc = 15;
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
                    sdl_pc = 13;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}

pub const SDL_iconv = SDL_iconv_REAL;
pub const SDL_iconv_close = SDL_iconv_close_REAL;
pub const SDL_iconv_open = SDL_iconv_open_REAL;
pub const SDL_iconv_string = SDL_iconv_string_REAL;
pub const E2BIG = @as(c_int, 7);
pub const EINVAL = @as(c_int, 22);
pub const EILSEQ = @as(c_int, 84);
