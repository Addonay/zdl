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
pub export fn SDL_uclibc_copysign(arg_x: f64, y: f64) f64 {
    @setEvalBranchQuota(100000);
    var x = arg_x;
    _ = &x;
    var hx: u_int32_t = undefined;
    _ = &hx;
    var hy: u_int32_t = undefined;
    _ = &hy;
    while (true) {
        var gh_u: ieee_double_shape_type = undefined;
        _ = &gh_u;
        gh_u.value = x;
        hx = gh_u.parts.msw;
        if (!false) break;
    }
    while (true) {
        var gh_u: ieee_double_shape_type = undefined;
        _ = &gh_u;
        gh_u.value = y;
        hy = gh_u.parts.msw;
        if (!false) break;
    }
    while (true) {
        var sh_u: ieee_double_shape_type = undefined;
        _ = &sh_u;
        sh_u.value = x;
        sh_u.parts.msw = (hx & @as(u_int32_t, 2147483647)) | (hy & @as(c_uint, 2147483648));
        x = sh_u.value;
        if (!false) break;
    }
    return x;
}

