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
pub const half: f64 = 0.5;
pub const S1: f64 = -@as(f64, 0.16666666666666632);
pub const S2: f64 = 0.00833333333332249;
pub const S3: f64 = -@as(f64, 0.0001984126982985795);
pub const S4: f64 = 0.0000027557313707070068;
pub const S5: f64 = -@as(f64, 0.000000025050760253406863);
pub const S6: f64 = 0.000000000158969099521155;
pub export fn __kernel_sin(x: f64, y: f64, iy: c_int) f64 {
    @setEvalBranchQuota(100000);
    var z: f64 = undefined;
    _ = &z;
    var r: f64 = undefined;
    _ = &r;
    var v: f64 = undefined;
    _ = &v;
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
        if (@as(c_int, @intFromFloat(x)) == @as(c_int, 0)) return x;
    }
    z = x * x;
    v = z * x;
    r = S2 + (z * (S3 + (z * (S4 + (z * (S5 + (z * S6)))))));
    if (iy == @as(c_int, 0)) return x + (v * (S1 + (z * r))) else return x - (((z * ((half * y) - (v * r))) - y) - (v * S1));
}

