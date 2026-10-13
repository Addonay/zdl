// SDL implementation ported to Zig; generated scaffolding removed.
pub const __uint32_t = c_uint;
pub const u_int32_t = __uint32_t;
pub extern fn atan2(__y: f64, __x: f64) f64;
pub extern fn SDL_uclibc_atan(x: f64) f64;
pub extern fn SDL_uclibc_fabs(x: f64) f64;
const struct_unnamed_14 = extern struct {
    lsw: u_int32_t = 0,
    msw: u_int32_t = 0,
};
pub const ieee_double_shape_type = extern union {
    value: f64,
    parts: struct_unnamed_14,
};

pub const tiny: f64 = 0.000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001;
pub const zero: f64 = 0.0;
pub const pi_o_4: f64 = 0.7853981633974483;
pub const pi_o_2: f64 = 1.5707963267948966;
pub const pi: f64 = 3.141592653589793;
pub const pi_lo: f64 = 0.00000000000000012246467991473532;
pub export fn SDL_uclibc_atan2(y: f64, x: f64) f64 {
    @setEvalBranchQuota(100000);
    var z: f64 = undefined;
    _ = &z;
    var k: i32 = undefined;
    _ = &k;
    var m: i32 = undefined;
    _ = &m;
    var hx: i32 = undefined;
    _ = &hx;
    var hy: i32 = undefined;
    _ = &hy;
    var ix: i32 = undefined;
    _ = &ix;
    var iy: i32 = undefined;
    _ = &iy;
    var lx: u_int32_t = undefined;
    _ = &lx;
    var ly: u_int32_t = undefined;
    _ = &ly;
    var ew_u: ieee_double_shape_type = undefined;
    _ = &ew_u;
    var ew_u_1: ieee_double_shape_type = undefined;
    _ = &ew_u_1;
    var zh: u_int32_t = undefined;
    _ = &zh;
    var gh_u: ieee_double_shape_type = undefined;
    _ = &gh_u;
    var sh_u: ieee_double_shape_type = undefined;
    _ = &sh_u;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            1 => {
                ew_u.value = x;
                hx = @bitCast(@as(c_uint, @truncate(ew_u.parts.msw)));
                lx = ew_u.parts.lsw;
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
                ix = hx & @as(c_int, 2147483647);
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                ew_u_1.value = y;
                hy = @bitCast(@as(c_uint, @truncate(ew_u_1.parts.msw)));
                ly = ew_u_1.parts.lsw;
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            5 => {
                if (false) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                iy = hy & @as(c_int, 2147483647);
                if (((@as(u_int32_t, @bitCast(@as(c_int, ix))) | ((lx | @as(u_int32_t, @bitCast(@as(c_int, -@as(i32, @bitCast(@as(c_uint, @truncate(lx)))))))) >> @intCast(@as(u_int32_t, 31)))) > @as(u_int32_t, 2146435072)) or ((@as(u_int32_t, @bitCast(@as(c_int, iy))) | ((ly | @as(u_int32_t, @bitCast(@as(c_int, -@as(i32, @bitCast(@as(c_uint, @truncate(ly)))))))) >> @intCast(@as(u_int32_t, 31)))) > @as(u_int32_t, 2146435072))) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                return x + y;
            },
            8 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                if ((@as(u_int32_t, @bitCast(@as(c_int, hx - @as(c_int, 1072693248)))) | lx) == @as(u_int32_t, 0)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                return SDL_uclibc_atan(y);
            },
            11 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                m = ((hy >> @intCast(@as(c_int, 31))) & @as(c_int, 1)) | ((hx >> @intCast(@as(c_int, 30))) & @as(c_int, 2));
                if ((@as(u_int32_t, @bitCast(@as(c_int, iy))) | ly) == @as(u_int32_t, 0)) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            13 => {
                switch (m) {
                    @as(c_int, 0) => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 18;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 19;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 20;
                        continue;
                    },
                    else => {
                        sdl_pc = 16;
                        continue;
                    },
                }
            },
            14 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                if ((@as(u_int32_t, @bitCast(@as(c_int, ix))) | lx) == @as(u_int32_t, 0)) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            16 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            18 => {
                return y;
            },
            19 => {
                return pi + tiny;
            },
            20 => {
                return -pi - tiny;
            },
            21 => {
                return if (hy < @as(c_int, 0)) -pi_o_2 - tiny else pi_o_2 + tiny;
            },
            22 => {
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            23 => {
                if (ix == @as(c_int, 2146435072)) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            24 => {
                if (iy == @as(c_int, 2146435072)) {
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
                if (iy == @as(c_int, 2146435072)) {
                    sdl_pc = 40;
                    continue;
                } else {
                    sdl_pc = 41;
                    continue;
                }
            },
            27 => {
                switch (m) {
                    @as(c_int, 0) => {
                        sdl_pc = 31;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 32;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 33;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 34;
                        continue;
                    },
                    else => {
                        sdl_pc = 30;
                        continue;
                    },
                }
            },
            28 => {
                switch (m) {
                    @as(c_int, 0) => {
                        sdl_pc = 36;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 37;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 38;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 39;
                        continue;
                    },
                    else => {
                        sdl_pc = 35;
                        continue;
                    },
                }
            },
            29 => {
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            30 => {
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            31 => {
                return pi_o_4 + tiny;
            },
            32 => {
                return -pi_o_4 - tiny;
            },
            33 => {
                return (@as(f64, 3.0) * pi_o_4) + tiny;
            },
            34 => {
                return (-@as(f64, 3.0) * pi_o_4) - tiny;
            },
            35 => {
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            36 => {
                return zero;
            },
            37 => {
                return -zero;
            },
            38 => {
                return pi + tiny;
            },
            39 => {
                return -pi - tiny;
            },
            40 => {
                return if (hy < @as(c_int, 0)) -pi_o_2 - tiny else pi_o_2 + tiny;
            },
            41 => {
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            42 => {
                k = (iy - ix) >> @intCast(@as(c_int, 20));
                if (k > @as(c_int, 60)) {
                    sdl_pc = 43;
                    continue;
                } else {
                    sdl_pc = 44;
                    continue;
                }
            },
            43 => {
                z = pi_o_2 + (@as(f64, 0.5) * pi_lo);
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            44 => {
                if ((hx < @as(c_int, 0)) and (k < -@as(c_int, 60))) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 47;
                    continue;
                }
            },
            45 => {
                switch (m) {
                    @as(c_int, 0) => {
                        sdl_pc = 50;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 51;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 58;
                        continue;
                    },
                    else => {
                        sdl_pc = 59;
                        continue;
                    },
                }
            },
            46 => {
                z = 0.0;
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            47 => {
                z = SDL_uclibc_atan(SDL_uclibc_fabs(y / x));
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            48 => {
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            49 => {
                return undefined;
            },
            50 => {
                return z;
            },
            51 => {
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            52 => {
                gh_u.value = z;
                zh = gh_u.parts.msw;
                {
                    sdl_pc = 53;
                    continue;
                }
            },
            53 => {
                if (false) {
                    sdl_pc = 52;
                    continue;
                } else {
                    sdl_pc = 54;
                    continue;
                }
            },
            54 => {
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            55 => {
                sh_u.value = z;
                sh_u.parts.msw = zh ^ @as(c_uint, 2147483648);
                z = sh_u.value;
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            56 => {
                if (false) {
                    sdl_pc = 55;
                    continue;
                } else {
                    sdl_pc = 57;
                    continue;
                }
            },
            57 => {
                return z;
            },
            58 => {
                return pi - (z - pi_lo);
            },
            59 => {
                return (z - pi_lo) - pi;
            },
            else => unreachable,
        }
    }
}

pub const __ieee754_atan2 = SDL_uclibc_atan2;
