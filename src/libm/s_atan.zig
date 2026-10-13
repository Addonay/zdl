// SDL implementation ported to Zig; generated scaffolding removed.
pub const __uint32_t = c_uint;
pub const u_int32_t = __uint32_t;
pub extern fn atan(__x: f64) f64;
pub extern fn SDL_uclibc_fabs(x: f64) f64;
const struct_unnamed_14 = extern struct {
    lsw: u_int32_t = 0,
    msw: u_int32_t = 0,
};
pub const ieee_double_shape_type = extern union {
    value: f64,
    parts: struct_unnamed_14,
};
pub const atanhi: [4]f64 = [4]f64{
    0.4636476090008061,
    0.7853981633974483,
    0.982793723247329,
    1.5707963267948966,
};
pub const atanlo: [4]f64 = [4]f64{
    0.000000000000000022698777452961687,
    0.00000000000000003061616997868383,
    0.000000000000000013903311031230998,
    0.00000000000000006123233995736766,
};
pub const aT: [11]f64 = [11]f64{
    0.3333333333333293,
    -@as(f64, 0.19999999999876483),
    0.14285714272503466,
    -@as(f64, 0.11111110405462356),
    0.09090887133436507,
    -@as(f64, 0.0769187620504483),
    0.06661073137387531,
    -@as(f64, 0.058335701337905735),
    0.049768779946159324,
    -@as(f64, 0.036531572744216916),
    0.016285820115365782,
};
pub const one: f64 = 1.0;
pub const huge: f64 = 1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000.0;
pub export fn SDL_uclibc_atan(arg_x: f64) f64 {
    @setEvalBranchQuota(100000);
    var x = arg_x;
    _ = &x;
    var w: f64 = undefined;
    _ = &w;
    var s1: f64 = undefined;
    _ = &s1;
    var s2: f64 = undefined;
    _ = &s2;
    var z: f64 = undefined;
    _ = &z;
    var ix: i32 = undefined;
    _ = &ix;
    var hx: i32 = undefined;
    _ = &hx;
    var id: i32 = undefined;
    _ = &id;
    while (true) {
        var gh_u: ieee_double_shape_type = undefined;
        _ = &gh_u;
        gh_u.value = x;
        hx = @bitCast(@as(c_uint, @truncate(gh_u.parts.msw)));
        if (!false) break;
    }
    ix = hx & @as(c_int, 2147483647);
    if (ix >= @as(c_int, 1141899264)) {
        var low: u_int32_t = undefined;
        _ = &low;
        while (true) {
            var gl_u: ieee_double_shape_type = undefined;
            _ = &gl_u;
            gl_u.value = x;
            low = gl_u.parts.lsw;
            if (!false) break;
        }
        if ((ix > @as(c_int, 2146435072)) or ((ix == @as(c_int, 2146435072)) and (low != @as(u_int32_t, 0)))) return x + x;
        if (hx > @as(c_int, 0)) return atanhi[@as(c_int, 3)] + atanlo[@as(c_int, 3)] else return -atanhi[@as(c_int, 3)] - atanlo[@as(c_int, 3)];
    }
    if (ix < @as(c_int, 1071382528)) {
        if (ix < @as(c_int, 1042284544)) {
            if ((huge + x) > one) return x;
        }
        id = -@as(c_int, 1);
    } else {
        x = SDL_uclibc_fabs(x);
        if (ix < @as(c_int, 1072889856)) {
            if (ix < @as(c_int, 1072037888)) {
                id = 0;
                x = ((@as(f64, 2.0) * x) - one) / (@as(f64, 2.0) + x);
            } else {
                id = 1;
                x = (x - one) / (x + one);
            }
        } else {
            if (ix < @as(c_int, 1073971200)) {
                id = 2;
                x = (x - @as(f64, 1.5)) / (one + (@as(f64, 1.5) * x));
            } else {
                id = 3;
                x = -@as(f64, 1.0) / x;
            }
        }
    }
    z = x * x;
    w = z * z;
    s1 = z * (aT[@as(c_int, 0)] + (w * (aT[@as(c_int, 2)] + (w * (aT[@as(c_int, 4)] + (w * (aT[@as(c_int, 6)] + (w * (aT[@as(c_int, 8)] + (w * aT[@as(c_int, 10)]))))))))));
    s2 = w * (aT[@as(c_int, 1)] + (w * (aT[@as(c_int, 3)] + (w * (aT[@as(c_int, 5)] + (w * (aT[@as(c_int, 7)] + (w * aT[@as(c_int, 9)]))))))));
    if (id < @as(c_int, 0)) return x - (x * (s1 + s2)) else {
        z = atanhi[@bitCast(@as(isize, @intCast(id)))] - (((x * (s1 + s2)) - atanlo[@bitCast(@as(isize, @intCast(id)))]) - x);
        return if (hx < @as(c_int, 0)) -z else z;
    }
}

