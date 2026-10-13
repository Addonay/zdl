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
pub const one: f64 = 1.0;
pub const C1: f64 = 0.0416666666666666;
pub const C2: f64 = -@as(f64, 0.001388888888887411);
pub const C3: f64 = 0.00002480158728947673;
pub const C4: f64 = -@as(f64, 0.00000027557314351390663);
pub const C5: f64 = 0.000000002087572321298175;
pub const C6: f64 = -@as(f64, 0.000000000011359647557788195);
pub export fn __kernel_cos(x: f64, y: f64) f64 {
    @setEvalBranchQuota(100000);
    var a: f64 = undefined;
    _ = &a;
    var hz: f64 = undefined;
    _ = &hz;
    var z: f64 = undefined;
    _ = &z;
    var r: f64 = undefined;
    _ = &r;
    var qx: f64 = undefined;
    _ = &qx;
    var ix: i32 = undefined;
    _ = &ix;
    while (true) {
        var gh_u: ieee_double_shape_type = undefined;
        _ = &gh_u;
        gh_u.value = x;
        ix = @bitCast(@as(c_uint, @truncate(gh_u.parts.msw)));
        if (!false) break;
    }
    ix &= 2147483647;
    if (ix < @as(c_int, 1044381696)) {
        if (@as(c_int, @intFromFloat(x)) == @as(c_int, 0)) return one;
    }
    z = x * x;
    r = z * (C1 + (z * (C2 + (z * (C3 + (z * (C4 + (z * (C5 + (z * C6))))))))));
    if (ix < @as(c_int, 1070805811)) return one - ((@as(f64, 0.5) * z) - ((z * r) - (x * y))) else {
        if (ix > @as(c_int, 1072234496)) {
            qx = 0.28125;
        } else {
            while (true) {
                var iw_u: ieee_double_shape_type = undefined;
                _ = &iw_u;
                iw_u.parts.msw = @bitCast(@as(c_int, ix - @as(c_int, 2097152)));
                iw_u.parts.lsw = @bitCast(@as(c_int, @as(c_int, 0)));
                qx = iw_u.value;
                if (!false) break;
            }
        }
        hz = (@as(f64, 0.5) * z) - qx;
        a = one - qx;
        return a - (hz - ((z * r) - (x * y)));
    }
    return undefined;
}

