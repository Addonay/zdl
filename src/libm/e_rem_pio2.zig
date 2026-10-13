// SDL implementation ported to Zig; generated scaffolding removed.
pub const __uint32_t = c_uint;
pub const u_int32_t = __uint32_t;
pub extern fn SDL_uclibc_fabs(x: f64) f64;
const struct_unnamed_14 = extern struct {
    lsw: u_int32_t = 0,
    msw: u_int32_t = 0,
};
pub const ieee_double_shape_type = extern union {
    value: f64,
    parts: struct_unnamed_14,
};
pub extern fn __kernel_rem_pio2([*c]const f64, [*c]f64, c_int, c_int, c_uint, [*c]const i32) i32;
pub const two_over_pi: [66]i32 = [66]i32{
    10680707,
    7228996,
    1387004,
    2578385,
    16069853,
    12639074,
    9804092,
    4427841,
    16666979,
    11263675,
    12935607,
    2387514,
    4345298,
    14681673,
    3074569,
    13734428,
    16653803,
    1880361,
    10960616,
    8533493,
    3062596,
    8710556,
    7349940,
    6258241,
    3772886,
    3769171,
    3798172,
    8675211,
    12450088,
    3874808,
    9961438,
    366607,
    15675153,
    9132554,
    7151469,
    3571407,
    2607881,
    12013382,
    4155038,
    6285869,
    7677882,
    13102053,
    15825725,
    473591,
    9065106,
    15363067,
    6271263,
    9264392,
    5636912,
    4652155,
    7056368,
    13614112,
    10155062,
    1944035,
    9527646,
    15080200,
    6658437,
    6231200,
    6832269,
    16767104,
    5075751,
    3212806,
    1398474,
    7579849,
    6349435,
    12618859,
};
pub const npio2_hw: [32]i32 = [32]i32{
    1073291771,
    1074340347,
    1074977148,
    1075388923,
    1075800698,
    1076025724,
    1076231611,
    1076437499,
    1076643386,
    1076849274,
    1076971356,
    1077074300,
    1077177244,
    1077280187,
    1077383131,
    1077486075,
    1077589019,
    1077691962,
    1077794906,
    1077897850,
    1077968460,
    1078019932,
    1078071404,
    1078122876,
    1078174348,
    1078225820,
    1078277292,
    1078328763,
    1078380235,
    1078431707,
    1078483179,
    1078534651,
};
pub const zero: f64 = 0.0;
pub const half: f64 = 0.5;
pub const two24: f64 = 16777216.0;
pub const invpio2: f64 = 0.6366197723675814;
pub const pio2_1: f64 = 1.5707963267341256;
pub const pio2_1t: f64 = 0.00000000006077100506506192;
pub const pio2_2: f64 = 0.00000000006077100506303966;
pub const pio2_2t: f64 = 0.0000000000000000000020222662487959506;
pub const pio2_3: f64 = 0.0000000000000000000020222662487111665;
pub const pio2_3t: f64 = 0.000000000000000000000000000000084784276603689;
pub export fn __ieee754_rem_pio2(x: f64, y: [*c]f64) i32 {
    @setEvalBranchQuota(100000);
    var z: f64 = 0.0;
    _ = &z;
    var w: f64 = undefined;
    _ = &w;
    var t: f64 = undefined;
    _ = &t;
    var r: f64 = undefined;
    _ = &r;
    var @"fn": f64 = undefined;
    _ = &@"fn";
    var tx: [3]f64 = undefined;
    _ = &tx;
    var e0: i32 = undefined;
    _ = &e0;
    var i: i32 = undefined;
    _ = &i;
    var j: i32 = undefined;
    _ = &j;
    var nx: i32 = undefined;
    _ = &nx;
    var n: i32 = undefined;
    _ = &n;
    var ix: i32 = undefined;
    _ = &ix;
    var hx: i32 = undefined;
    _ = &hx;
    var low: u_int32_t = undefined;
    _ = &low;
    while (true) {
        var gh_u: ieee_double_shape_type = undefined;
        _ = &gh_u;
        gh_u.value = x;
        hx = @bitCast(@as(c_uint, @truncate(gh_u.parts.msw)));
        if (!false) break;
    }
    ix = hx & @as(c_int, 2147483647);
    if (ix <= @as(c_int, 1072243195)) {
        y[@as(c_int, 0)] = x;
        y[@as(c_int, 1)] = @floatFromInt(@as(c_int, 0));
        return 0;
    }
    if (ix < @as(c_int, 1073928572)) {
        if (hx > @as(c_int, 0)) {
            z = x - pio2_1;
            if (ix != @as(c_int, 1073291771)) {
                y[@as(c_int, 0)] = z - pio2_1t;
                y[@as(c_int, 1)] = (z - y[@as(c_int, 0)]) - pio2_1t;
            } else {
                z -= pio2_2;
                y[@as(c_int, 0)] = z - pio2_2t;
                y[@as(c_int, 1)] = (z - y[@as(c_int, 0)]) - pio2_2t;
            }
            return 1;
        } else {
            z = x + pio2_1;
            if (ix != @as(c_int, 1073291771)) {
                y[@as(c_int, 0)] = z + pio2_1t;
                y[@as(c_int, 1)] = (z - y[@as(c_int, 0)]) + pio2_1t;
            } else {
                z += pio2_2;
                y[@as(c_int, 0)] = z + pio2_2t;
                y[@as(c_int, 1)] = (z - y[@as(c_int, 0)]) + pio2_2t;
            }
            return -@as(c_int, 1);
        }
    }
    if (ix <= @as(c_int, 1094263291)) {
        t = SDL_uclibc_fabs(x);
        n = @intFromFloat((t * invpio2) + half);
        @"fn" = @floatFromInt(n);
        r = t - (@"fn" * pio2_1);
        w = @"fn" * pio2_1t;
        if ((n < @as(c_int, 32)) and (ix != npio2_hw[@bitCast(@as(isize, @intCast(n - @as(c_int, 1))))])) {
            y[@as(c_int, 0)] = r - w;
        } else {
            var high: u_int32_t = undefined;
            _ = &high;
            j = ix >> @intCast(@as(c_int, 20));
            y[@as(c_int, 0)] = r - w;
            while (true) {
                var gh_u: ieee_double_shape_type = undefined;
                _ = &gh_u;
                gh_u.value = y[@as(c_int, 0)];
                high = gh_u.parts.msw;
                if (!false) break;
            }
            i = @bitCast(@as(c_uint, @truncate(@as(u_int32_t, @bitCast(@as(c_int, j))) -% ((high >> @intCast(@as(u_int32_t, 20))) & @as(u_int32_t, 2047)))));
            if (i > @as(c_int, 16)) {
                t = r;
                w = @"fn" * pio2_2;
                r = t - w;
                w = (@"fn" * pio2_2t) - ((t - r) - w);
                y[@as(c_int, 0)] = r - w;
                while (true) {
                    var gh_u: ieee_double_shape_type = undefined;
                    _ = &gh_u;
                    gh_u.value = y[@as(c_int, 0)];
                    high = gh_u.parts.msw;
                    if (!false) break;
                }
                i = @bitCast(@as(c_uint, @truncate(@as(u_int32_t, @bitCast(@as(c_int, j))) -% ((high >> @intCast(@as(u_int32_t, 20))) & @as(u_int32_t, 2047)))));
                if (i > @as(c_int, 49)) {
                    t = r;
                    w = @"fn" * pio2_3;
                    r = t - w;
                    w = (@"fn" * pio2_3t) - ((t - r) - w);
                    y[@as(c_int, 0)] = r - w;
                }
            }
        }
        y[@as(c_int, 1)] = (r - y[@as(c_int, 0)]) - w;
        if (hx < @as(c_int, 0)) {
            y[@as(c_int, 0)] = -y[@as(c_int, 0)];
            y[@as(c_int, 1)] = -y[@as(c_int, 1)];
            return -n;
        } else return n;
    }
    if (ix >= @as(c_int, 2146435072)) {
        y[@as(c_int, 0)] = blk: {
            const tmp = x - x;
            y[@as(c_int, 1)] = tmp;
            break :blk tmp;
        };
        return 0;
    }
    while (true) {
        var gl_u: ieee_double_shape_type = undefined;
        _ = &gl_u;
        gl_u.value = x;
        low = gl_u.parts.lsw;
        if (!false) break;
    }
    while (true) {
        var sl_u: ieee_double_shape_type = undefined;
        _ = &sl_u;
        sl_u.value = z;
        sl_u.parts.lsw = low;
        z = sl_u.value;
        if (!false) break;
    }
    e0 = (ix >> @intCast(@as(c_int, 20))) - @as(c_int, 1046);
    while (true) {
        var sh_u: ieee_double_shape_type = undefined;
        _ = &sh_u;
        sh_u.value = z;
        sh_u.parts.msw = @bitCast(@as(c_int, ix - (e0 << @intCast(@as(c_int, 20)))));
        z = sh_u.value;
        if (!false) break;
    }
    {
        i = 0;
        while (i < @as(c_int, 2)) : (i += 1) {
            tx[@bitCast(@as(isize, @intCast(i)))] = @floatFromInt(@as(i32, @intFromFloat(z)));
            z = (z - tx[@bitCast(@as(isize, @intCast(i)))]) * two24;
        }
    }
    tx[@as(c_int, 2)] = z;
    nx = 3;
    while ((nx > @as(c_int, 0)) and (tx[@bitCast(@as(isize, @intCast(nx - @as(c_int, 1))))] == zero)) {
        nx -= 1;
    }
    n = __kernel_rem_pio2(@ptrCast(@alignCast(&tx)), y, e0, nx, 2, @ptrCast(@alignCast(&two_over_pi)));
    if (hx < @as(c_int, 0)) {
        y[@as(c_int, 0)] = -y[@as(c_int, 0)];
        y[@as(c_int, 1)] = -y[@as(c_int, 1)];
        return -n;
    }
    return n;
}

