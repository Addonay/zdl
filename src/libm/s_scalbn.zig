// SDL implementation ported to Zig; generated scaffolding removed.
pub const __uint32_t = c_uint;
pub const u_int32_t = __uint32_t;
pub extern fn scalbln(__x: f64, __n: c_long) f64;
pub extern fn SDL_uclibc_copysign(x: f64, y: f64) f64;
const struct_unnamed_14 = extern struct {
    lsw: u_int32_t = 0,
    msw: u_int32_t = 0,
};
pub const ieee_double_shape_type = extern union {
    value: f64,
    parts: struct_unnamed_14,
};
pub const two54: f64 = 18014398509481984.0;
pub const twom54: f64 = 0.00000000000000005551115123125783;
pub const huge: f64 = 1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000.0;
pub const tiny: f64 = 0.000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001;
pub export fn SDL_uclibc_scalbln(arg_x: f64, n: c_long) f64 {
    @setEvalBranchQuota(100000);
    var x = arg_x;
    _ = &x;
    var k: i32 = undefined;
    _ = &k;
    var hx: i32 = undefined;
    _ = &hx;
    var lx: i32 = undefined;
    _ = &lx;
    while (true) {
        var ew_u: ieee_double_shape_type = undefined;
        _ = &ew_u;
        ew_u.value = x;
        hx = @bitCast(@as(c_uint, @truncate(ew_u.parts.msw)));
        lx = @bitCast(@as(c_uint, @truncate(ew_u.parts.lsw)));
        if (!false) break;
    }
    k = (hx & @as(c_int, 2146435072)) >> @intCast(@as(c_int, 20));
    if (k == @as(c_int, 0)) {
        if ((lx | (hx & @as(c_int, 2147483647))) == @as(c_int, 0)) return x;
        x *= two54;
        while (true) {
            var gh_u: ieee_double_shape_type = undefined;
            _ = &gh_u;
            gh_u.value = x;
            hx = @bitCast(@as(c_uint, @truncate(gh_u.parts.msw)));
            if (!false) break;
        }
        k = ((hx & @as(c_int, 2146435072)) >> @intCast(@as(c_int, 20))) - @as(c_int, 54);
    }
    if (k == @as(c_int, 2047)) return x + x;
    k = @truncate(@as(c_long, k) + n);
    if (k > @as(c_int, 2046)) return huge * SDL_uclibc_copysign(huge, x);
    if (n < @as(c_long, -@as(c_int, 50000))) return tiny * SDL_uclibc_copysign(tiny, x);
    if (k > @as(c_int, 0)) {
        while (true) {
            var sh_u: ieee_double_shape_type = undefined;
            _ = &sh_u;
            sh_u.value = x;
            sh_u.parts.msw = (@as(c_uint, @bitCast(@as(c_int, hx))) & @as(c_uint, 2148532223)) | @as(c_uint, @bitCast(@as(c_int, k << @intCast(@as(c_int, 20)))));
            x = sh_u.value;
            if (!false) break;
        }
        return x;
    }
    if (k <= -@as(c_int, 54)) {
        if (n > @as(c_long, 50000)) return huge * SDL_uclibc_copysign(huge, x);
        return tiny * SDL_uclibc_copysign(tiny, x);
    }
    k += 54;
    while (true) {
        var sh_u: ieee_double_shape_type = undefined;
        _ = &sh_u;
        sh_u.value = x;
        sh_u.parts.msw = (@as(c_uint, @bitCast(@as(c_int, hx))) & @as(c_uint, 2148532223)) | @as(c_uint, @bitCast(@as(c_int, k << @intCast(@as(c_int, 20)))));
        x = sh_u.value;
        if (!false) break;
    }
    return x * twom54;
}
pub export fn SDL_uclibc_scalbn(x: f64, n: c_int) f64 {
    @setEvalBranchQuota(100000);
    return SDL_uclibc_scalbln(x, n);
}

pub inline fn libm_hidden_def(x: anytype) void {
    @setEvalBranchQuota(100000);
    _ = &x;
    return;
}
