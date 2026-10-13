// SDL implementation ported to Zig; generated scaffolding removed.
pub const __uint32_t = c_uint;
pub const u_int32_t = __uint32_t;
pub extern fn pow(__x: f64, __y: f64) f64;
pub extern fn SDL_uclibc_fabs(x: f64) f64;
pub extern fn SDL_uclibc_scalbn(x: f64, n: c_int) f64;
pub extern fn SDL_uclibc_sqrt(x: f64) f64;
const struct_unnamed_14 = extern struct {
    lsw: u_int32_t = 0,
    msw: u_int32_t = 0,
};
pub const ieee_double_shape_type = extern union {
    value: f64,
    parts: struct_unnamed_14,
};
pub const bp: [2]f64 = [2]f64{
    1.0,
    1.5,
};
pub const dp_h: [2]f64 = [2]f64{
    0.0,
    0.5849624872207642,
};
pub const dp_l: [2]f64 = [2]f64{
    0.0,
    0.00000001350039202129749,
};
pub const zero: f64 = 0.0;
pub const one: f64 = 1.0;
pub const two: f64 = 2.0;
pub const two53: f64 = 9007199254740992.0;
pub const huge: f64 = 1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000.0;
pub const tiny: f64 = 0.000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001;
pub const L1: f64 = 0.5999999999999946;
pub const L2: f64 = 0.4285714285785502;
pub const L3: f64 = 0.33333332981837743;
pub const L4: f64 = 0.272728123808534;
pub const L5: f64 = 0.23066074577556175;
pub const L6: f64 = 0.20697501780033842;
pub const P1: f64 = 0.16666666666666602;
pub const P2: f64 = -@as(f64, 0.0027777777777015593);
pub const P3: f64 = 0.00006613756321437934;
pub const P4: f64 = -@as(f64, 0.0000016533902205465252);
pub const P5: f64 = 0.000000041381367970572385;
pub const lg2: f64 = 0.6931471805599453;
pub const lg2_h: f64 = 0.6931471824645996;
pub const lg2_l: f64 = -@as(f64, 0.000000001904654299957768);
pub const ovt: f64 = 0.00000000000000008008566259537294;
pub const cp: f64 = 0.9617966939259756;
pub const cp_h: f64 = 0.9617967009544373;
pub const cp_l: f64 = -@as(f64, 0.000000007028461650952758);
pub const ivln2: f64 = 1.4426950408889634;
pub const ivln2_h: f64 = 1.4426950216293335;
pub const ivln2_l: f64 = 0.000000019259629911266175;
pub export fn SDL_uclibc_pow(x: f64, y: f64) f64 {
    @setEvalBranchQuota(100000);
    var z: f64 = undefined;
    _ = &z;
    var ax: f64 = undefined;
    _ = &ax;
    var z_h: f64 = undefined;
    _ = &z_h;
    var z_l: f64 = undefined;
    _ = &z_l;
    var p_h: f64 = undefined;
    _ = &p_h;
    var p_l: f64 = undefined;
    _ = &p_l;
    var y1_1: f64 = undefined;
    _ = &y1_1;
    var t1: f64 = undefined;
    _ = &t1;
    var t2: f64 = undefined;
    _ = &t2;
    var r: f64 = undefined;
    _ = &r;
    var s: f64 = undefined;
    _ = &s;
    var t: f64 = undefined;
    _ = &t;
    var u: f64 = undefined;
    _ = &u;
    var v: f64 = undefined;
    _ = &v;
    var w: f64 = undefined;
    _ = &w;
    var i: i32 = undefined;
    _ = &i;
    var j: i32 = undefined;
    _ = &j;
    var k: i32 = undefined;
    _ = &k;
    var yisint: i32 = undefined;
    _ = &yisint;
    var n: i32 = undefined;
    _ = &n;
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
    while (true) {
        var ew_u: ieee_double_shape_type = undefined;
        _ = &ew_u;
        ew_u.value = x;
        hx = @bitCast(@as(c_uint, @truncate(ew_u.parts.msw)));
        lx = ew_u.parts.lsw;
        if (!false) break;
    }
    if ((hx == @as(c_int, 1072693248)) and (lx == @as(u_int32_t, 0))) {
        return x;
    }
    ix = hx & @as(c_int, 2147483647);
    while (true) {
        var ew_u: ieee_double_shape_type = undefined;
        _ = &ew_u;
        ew_u.value = y;
        hy = @bitCast(@as(c_uint, @truncate(ew_u.parts.msw)));
        ly = ew_u.parts.lsw;
        if (!false) break;
    }
    iy = hy & @as(c_int, 2147483647);
    if ((@as(u_int32_t, @bitCast(@as(c_int, iy))) | ly) == @as(u_int32_t, 0)) return one;
    if ((((ix > @as(c_int, 2146435072)) or ((ix == @as(c_int, 2146435072)) and (lx != @as(u_int32_t, 0)))) or (iy > @as(c_int, 2146435072))) or ((iy == @as(c_int, 2146435072)) and (ly != @as(u_int32_t, 0)))) return x + y;
    yisint = 0;
    if (hx < @as(c_int, 0)) {
        if (iy >= @as(c_int, 1128267776)) {
            yisint = 2;
        } else if (iy >= @as(c_int, 1072693248)) {
            k = (iy >> @intCast(@as(c_int, 20))) - @as(c_int, 1023);
            if (k > @as(c_int, 20)) {
                j = @bitCast(@as(c_uint, @truncate(ly >> @intCast(@as(u_int32_t, @bitCast(@as(c_int, @as(c_int, 52) - k)))))));
                if ((@as(u_int32_t, @bitCast(@as(c_int, j))) << @intCast(@as(u_int32_t, @bitCast(@as(c_int, @as(c_int, 52) - k))))) == ly) {
                    yisint = @as(c_int, 2) - (j & @as(c_int, 1));
                }
            } else if (ly == @as(u_int32_t, 0)) {
                j = iy >> @intCast(@as(c_int, 20) - k);
                if ((j << @intCast(@as(c_int, 20) - k)) == iy) {
                    yisint = @as(c_int, 2) - (j & @as(c_int, 1));
                }
            }
        }
    }
    if (ly == @as(u_int32_t, 0)) {
        if (iy == @as(c_int, 2146435072)) {
            if ((@as(u_int32_t, @bitCast(@as(c_int, ix - @as(c_int, 1072693248)))) | lx) == @as(u_int32_t, 0)) return one;
            if (ix >= @as(c_int, 1072693248)) return if (hy >= @as(c_int, 0)) y else zero;
            return if (hy < @as(c_int, 0)) -y else zero;
        }
        if (iy == @as(c_int, 1072693248)) {
            if (hy < @as(c_int, 0)) return one / x else return x;
        }
        if (hy == @as(c_int, 1073741824)) return x * x;
        if (hy == @as(c_int, 1071644672)) {
            if (hx >= @as(c_int, 0)) return SDL_uclibc_sqrt(x);
        }
    }
    ax = SDL_uclibc_fabs(x);
    if (lx == @as(u_int32_t, 0)) {
        if (((ix == @as(c_int, 2146435072)) or (ix == @as(c_int, 0))) or (ix == @as(c_int, 1072693248))) {
            z = ax;
            if (hy < @as(c_int, 0)) {
                z = one / z;
            }
            if (hx < @as(c_int, 0)) {
                if (((ix - @as(c_int, 1072693248)) | yisint) == @as(c_int, 0)) {
                    z = (z - z) / (z - z);
                } else if (yisint == @as(c_int, 1)) {
                    z = -z;
                }
            }
            return z;
        }
    }
    if ((((@as(u_int32_t, @bitCast(@as(c_int, hx))) >> @intCast(@as(u_int32_t, 31))) -% @as(u_int32_t, 1)) | @as(u_int32_t, @bitCast(@as(c_int, yisint)))) == @as(u_int32_t, 0)) return (x - x) / (x - x);
    if (iy > @as(c_int, 1105199104)) {
        if (iy > @as(c_int, 1139802112)) {
            if (ix <= @as(c_int, 1072693247)) return if (hy < @as(c_int, 0)) huge * huge else tiny * tiny;
            if (ix >= @as(c_int, 1072693248)) return if (hy > @as(c_int, 0)) huge * huge else tiny * tiny;
        }
        if (ix < @as(c_int, 1072693247)) return if (hy < @as(c_int, 0)) huge * huge else tiny * tiny;
        if (ix > @as(c_int, 1072693248)) return if (hy > @as(c_int, 0)) huge * huge else tiny * tiny;
        t = x - @as(f64, @floatFromInt(@as(c_int, 1)));
        w = (t * t) * (@as(f64, 0.5) - (t * (@as(f64, 0.3333333333333333) - (t * @as(f64, 0.25)))));
        u = ivln2_h * t;
        v = (t * ivln2_l) - (w * ivln2);
        t1 = u + v;
        while (true) {
            var sl_u: ieee_double_shape_type = undefined;
            _ = &sl_u;
            sl_u.value = t1;
            sl_u.parts.lsw = @bitCast(@as(c_int, @as(c_int, 0)));
            t1 = sl_u.value;
            if (!false) break;
        }
        t2 = v - (t1 - u);
    } else {
        var s2: f64 = undefined;
        _ = &s2;
        var s_h: f64 = undefined;
        _ = &s_h;
        var s_l: f64 = undefined;
        _ = &s_l;
        var t_h: f64 = undefined;
        _ = &t_h;
        var t_l: f64 = undefined;
        _ = &t_l;
        n = 0;
        if (ix < @as(c_int, 1048576)) {
            ax *= two53;
            n -= 53;
            while (true) {
                var gh_u: ieee_double_shape_type = undefined;
                _ = &gh_u;
                gh_u.value = ax;
                ix = @bitCast(@as(c_uint, @truncate(gh_u.parts.msw)));
                if (!false) break;
            }
        }
        n += (ix >> @intCast(@as(c_int, 20))) - @as(c_int, 1023);
        j = ix & @as(c_int, 1048575);
        ix = j | @as(c_int, 1072693248);
        if (j <= @as(c_int, 235662)) {
            k = 0;
        } else if (j < @as(c_int, 767610)) {
            k = 1;
        } else {
            k = 0;
            n += 1;
            ix -= 1048576;
        }
        while (true) {
            var sh_u: ieee_double_shape_type = undefined;
            _ = &sh_u;
            sh_u.value = ax;
            sh_u.parts.msw = @bitCast(@as(c_int, ix));
            ax = sh_u.value;
            if (!false) break;
        }
        u = ax - bp[@bitCast(@as(isize, @intCast(k)))];
        v = one / (ax + bp[@bitCast(@as(isize, @intCast(k)))]);
        s = u * v;
        s_h = s;
        while (true) {
            var sl_u: ieee_double_shape_type = undefined;
            _ = &sl_u;
            sl_u.value = s_h;
            sl_u.parts.lsw = @bitCast(@as(c_int, @as(c_int, 0)));
            s_h = sl_u.value;
            if (!false) break;
        }
        t_h = zero;
        while (true) {
            var sh_u: ieee_double_shape_type = undefined;
            _ = &sh_u;
            sh_u.value = t_h;
            sh_u.parts.msw = @bitCast(@as(c_int, (((ix >> @intCast(@as(c_int, 1))) | @as(c_int, 536870912)) + @as(c_int, 524288)) + (k << @intCast(@as(c_int, 18)))));
            t_h = sh_u.value;
            if (!false) break;
        }
        t_l = ax - (t_h - bp[@bitCast(@as(isize, @intCast(k)))]);
        s_l = v * ((u - (s_h * t_h)) - (s_h * t_l));
        s2 = s * s;
        r = (s2 * s2) * (L1 + (s2 * (L2 + (s2 * (L3 + (s2 * (L4 + (s2 * (L5 + (s2 * L6))))))))));
        r += s_l * (s_h + s);
        s2 = s_h * s_h;
        t_h = (@as(f64, 3.0) + s2) + r;
        while (true) {
            var sl_u: ieee_double_shape_type = undefined;
            _ = &sl_u;
            sl_u.value = t_h;
            sl_u.parts.lsw = @bitCast(@as(c_int, @as(c_int, 0)));
            t_h = sl_u.value;
            if (!false) break;
        }
        t_l = r - ((t_h - @as(f64, 3.0)) - s2);
        u = s_h * t_h;
        v = (s_l * t_h) + (t_l * s);
        p_h = u + v;
        while (true) {
            var sl_u: ieee_double_shape_type = undefined;
            _ = &sl_u;
            sl_u.value = p_h;
            sl_u.parts.lsw = @bitCast(@as(c_int, @as(c_int, 0)));
            p_h = sl_u.value;
            if (!false) break;
        }
        p_l = v - (p_h - u);
        z_h = cp_h * p_h;
        z_l = ((cp_l * p_h) + (p_l * cp)) + dp_l[@bitCast(@as(isize, @intCast(k)))];
        t = @floatFromInt(n);
        t1 = ((z_h + z_l) + dp_h[@bitCast(@as(isize, @intCast(k)))]) + t;
        while (true) {
            var sl_u: ieee_double_shape_type = undefined;
            _ = &sl_u;
            sl_u.value = t1;
            sl_u.parts.lsw = @bitCast(@as(c_int, @as(c_int, 0)));
            t1 = sl_u.value;
            if (!false) break;
        }
        t2 = z_l - (((t1 - t) - dp_h[@bitCast(@as(isize, @intCast(k)))]) - z_h);
    }
    s = one;
    if ((((@as(u_int32_t, @bitCast(@as(c_int, hx))) >> @intCast(@as(u_int32_t, 31))) -% @as(u_int32_t, 1)) | @as(u_int32_t, @bitCast(@as(c_int, yisint - @as(c_int, 1))))) == @as(u_int32_t, 0)) {
        s = -one;
    }
    y1_1 = y;
    while (true) {
        var sl_u: ieee_double_shape_type = undefined;
        _ = &sl_u;
        sl_u.value = y1_1;
        sl_u.parts.lsw = @bitCast(@as(c_int, @as(c_int, 0)));
        y1_1 = sl_u.value;
        if (!false) break;
    }
    p_l = ((y - y1_1) * t1) + (y * t2);
    p_h = y1_1 * t1;
    z = p_l + p_h;
    while (true) {
        var ew_u: ieee_double_shape_type = undefined;
        _ = &ew_u;
        ew_u.value = z;
        j = @bitCast(@as(c_uint, @truncate(ew_u.parts.msw)));
        i = @bitCast(@as(c_uint, @truncate(ew_u.parts.lsw)));
        if (!false) break;
    }
    if (j >= @as(c_int, 1083179008)) {
        if (((j - @as(c_int, 1083179008)) | i) != @as(c_int, 0)) return (s * huge) * huge else {
            if ((p_l + ovt) > (z - p_h)) return (s * huge) * huge;
        }
    } else if ((j & @as(c_int, 2147483647)) >= @as(c_int, 1083231232)) {
        if (((@as(c_uint, @bitCast(@as(c_int, j))) -% @as(c_uint, 3230714880)) | @as(c_uint, @bitCast(@as(c_int, i)))) != @as(c_uint, 0)) return (s * tiny) * tiny else {
            if (p_l <= (z - p_h)) return (s * tiny) * tiny;
        }
    }
    i = j & @as(c_int, 2147483647);
    k = (i >> @intCast(@as(c_int, 20))) - @as(c_int, 1023);
    n = 0;
    if (i > @as(c_int, 1071644672)) {
        n = j + (@as(c_int, 1048576) >> @intCast(k + @as(c_int, 1)));
        k = ((n & @as(c_int, 2147483647)) >> @intCast(@as(c_int, 20))) - @as(c_int, 1023);
        t = zero;
        while (true) {
            var sh_u: ieee_double_shape_type = undefined;
            _ = &sh_u;
            sh_u.value = t;
            sh_u.parts.msw = @bitCast(@as(c_int, n & ~(@as(c_int, 1048575) >> @intCast(k))));
            t = sh_u.value;
            if (!false) break;
        }
        n = ((n & @as(c_int, 1048575)) | @as(c_int, 1048576)) >> @intCast(@as(c_int, 20) - k);
        if (j < @as(c_int, 0)) {
            n = -n;
        }
        p_h -= t;
    }
    t = p_l + p_h;
    while (true) {
        var sl_u: ieee_double_shape_type = undefined;
        _ = &sl_u;
        sl_u.value = t;
        sl_u.parts.lsw = @bitCast(@as(c_int, @as(c_int, 0)));
        t = sl_u.value;
        if (!false) break;
    }
    u = t * lg2_h;
    v = ((p_l - (t - p_h)) * lg2) + (t * lg2_l);
    z = u + v;
    w = v - (z - u);
    t = z * z;
    t1 = z - (t * (P1 + (t * (P2 + (t * (P3 + (t * (P4 + (t * P5)))))))));
    r = ((z * t1) / (t1 - two)) - (w + (z * w));
    z = one - (r - z);
    while (true) {
        var gh_u: ieee_double_shape_type = undefined;
        _ = &gh_u;
        gh_u.value = z;
        j = @bitCast(@as(c_uint, @truncate(gh_u.parts.msw)));
        if (!false) break;
    }
    j += n << @intCast(@as(c_int, 20));
    if ((j >> @intCast(@as(c_int, 20))) <= @as(c_int, 0)) {
        z = SDL_uclibc_scalbn(z, n);
    } else while (true) {
        var sh_u: ieee_double_shape_type = undefined;
        _ = &sh_u;
        sh_u.value = z;
        sh_u.parts.msw = @bitCast(@as(c_int, j));
        z = sh_u.value;
        if (!false) break;
    }
    return s * z;
}

pub const __ieee754_pow = SDL_uclibc_pow;
