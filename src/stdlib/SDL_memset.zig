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
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint32 = u32;
pub export fn SDL_memset_REAL(dst: ?*anyopaque, c: c_int, len: usize) ?*anyopaque {
    @setEvalBranchQuota(100000);
    return __builtin.memset(dst, c, len);
}
pub export fn SDL_memset4_REAL(dst: ?*anyopaque, val: Uint32, dwords: usize) ?*anyopaque {
    @setEvalBranchQuota(100000);
    var _n: usize = undefined;
    _ = &_n;
    var _p: [*c]Uint32 = undefined;
    _ = &_p;
    var _val: Uint32 = undefined;
    _ = &_val;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                _n = (dwords +% @as(usize, 3)) / @as(usize, 4);
                _p = @as([*c]Uint32, @ptrCast(@alignCast(dst)));
                _val = val;
                if (dwords == @as(usize, 0)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return dst;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                switch (dwords % @as(usize, 4)) {
                    @as(usize, 0) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(usize, 3) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(usize, 2) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(usize, 1) => {
                        sdl_pc = 11;
                        continue;
                    },
                    else => {
                        sdl_pc = 4;
                        continue;
                    },
                }
            },
            4 => {
                return dst;
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                (blk: {
                    const ref = &_p;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = _val;
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            7 => {
                if ((blk: {
                    const ref = &_n;
                    ref.* -%= 1;
                    break :blk ref.*;
                }) != 0) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            8 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            9 => {
                (blk: {
                    const ref = &_p;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = _val;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                (blk: {
                    const ref = &_p;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = _val;
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                (blk: {
                    const ref = &_p;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = _val;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}

pub inline fn SDL_OUT_BYTECAP(x: anytype) void {
    @setEvalBranchQuota(100000);
    _ = &x;
    return;
}
