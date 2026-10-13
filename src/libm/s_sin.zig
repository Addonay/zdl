// SDL implementation ported to Zig; generated scaffolding removed.
pub const __uint32_t = c_uint;
pub const u_int32_t = __uint32_t;
const struct_unnamed_14 = extern struct {
    lsw: u_int32_t = 0,
    msw: u_int32_t = 0,
};
pub const ieee_double_shape_type = extern union {
    value: f64,
    parts: struct_unnamed_14,
};
pub extern fn __ieee754_rem_pio2(f64, [*c]f64) i32;
pub extern fn __kernel_sin(f64, f64, c_int) f64;
pub extern fn __kernel_cos(f64, f64) f64;
pub export fn SDL_uclibc_sin(x: f64) f64 {
    @setEvalBranchQuota(100000);
    var y: [2]f64 = undefined;
    _ = &y;
    var z: f64 = undefined;
    _ = &z;
    var n: i32 = undefined;
    _ = &n;
    var ix: i32 = undefined;
    _ = &ix;
    var gh_u: ieee_double_shape_type = undefined;
    _ = &gh_u;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                z = 0.0;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            1 => {
                gh_u.value = x;
                ix = @bitCast(@as(c_uint, @truncate(gh_u.parts.msw)));
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            2 => {
                if (false) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                ix &= 2147483647;
                if (ix <= @as(c_int, 1072243195)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                return __kernel_sin(x, z, 0);
            },
            5 => {
                if (ix >= @as(c_int, 2146435072)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            6 => {
                return undefined;
            },
            7 => {
                return x - x;
            },
            8 => {
                n = __ieee754_rem_pio2(x, @ptrCast(@alignCast(&y)));
                switch (n & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 13;
                        continue;
                    },
                    else => {
                        sdl_pc = 14;
                        continue;
                    },
                }
            },
            9 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            10 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            11 => {
                return __kernel_sin(y[@as(c_int, 0)], y[@as(c_int, 1)], 1);
            },
            12 => {
                return __kernel_cos(y[@as(c_int, 0)], y[@as(c_int, 1)]);
            },
            13 => {
                return -__kernel_sin(y[@as(c_int, 0)], y[@as(c_int, 1)], 1);
            },
            14 => {
                return -__kernel_cos(y[@as(c_int, 0)], y[@as(c_int, 1)]);
            },
            else => unreachable,
        }
    }
}

