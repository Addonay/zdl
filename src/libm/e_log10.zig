// SDL implementation ported to Zig; generated scaffolding removed.
pub const __uint32_t = c_uint;
pub const u_int32_t = __uint32_t;
pub extern fn log10(__x: f64) f64;
pub extern fn SDL_uclibc_log(x: f64) f64;
const struct_unnamed_14 = extern struct {
    lsw: u_int32_t = 0,
    msw: u_int32_t = 0,
};
pub const ieee_double_shape_type = extern union {
    value: f64,
    parts: struct_unnamed_14,
};
pub const two54: f64 = 18014398509481984.0;
pub const ivln10: f64 = 0.4342944819032518;
pub const log10_2hi: f64 = 0.30102999566361177;
pub const log10_2lo: f64 = 0.0000000000003694239077158931;
pub const zero: f64 = 0.0;
pub export fn SDL_uclibc_log10(arg_x: f64) f64 {
    @setEvalBranchQuota(100000);
    var x = arg_x;
    _ = &x;
    var y: f64 = undefined;
    _ = &y;
    var z: f64 = undefined;
    _ = &z;
    var i: i32 = undefined;
    _ = &i;
    var k: i32 = undefined;
    _ = &k;
    var hx: i32 = undefined;
    _ = &hx;
    var lx: u_int32_t = undefined;
    _ = &lx;
    while (true) {
        var ew_u: ieee_double_shape_type = undefined;
        _ = &ew_u;
        ew_u.value = x;
        hx = @bitCast(@as(c_uint, @truncate(ew_u.parts.msw)));
        lx = ew_u.parts.lsw;
        if (!false) break;
    }
    k = 0;
    if (hx < @as(c_int, 1048576)) {
        if ((@as(u_int32_t, @bitCast(@as(c_int, hx & @as(c_int, 2147483647)))) | lx) == @as(u_int32_t, 0)) return -two54 / zero;
        if (hx < @as(c_int, 0)) return (x - x) / zero;
        k -= 54;
        x *= two54;
        while (true) {
            var gh_u: ieee_double_shape_type = undefined;
            _ = &gh_u;
            gh_u.value = x;
            hx = @bitCast(@as(c_uint, @truncate(gh_u.parts.msw)));
            if (!false) break;
        }
    }
    if (hx >= @as(c_int, 2146435072)) return x + x;
    k += (hx >> @intCast(@as(c_int, 20))) - @as(c_int, 1023);
    i = @bitCast(@as(c_uint, @truncate((@as(u_int32_t, @bitCast(@as(c_int, k))) & @as(c_uint, 2147483648)) >> @intCast(@as(u_int32_t, 31)))));
    hx = (hx & @as(c_int, 1048575)) | ((@as(c_int, 1023) - i) << @intCast(@as(c_int, 20)));
    y = @floatFromInt(k + i);
    while (true) {
        var sh_u: ieee_double_shape_type = undefined;
        _ = &sh_u;
        sh_u.value = x;
        sh_u.parts.msw = @bitCast(@as(c_int, hx));
        x = sh_u.value;
        if (!false) break;
    }
    z = (y * log10_2lo) + (ivln10 * SDL_uclibc_log(x));
    return z + (y * log10_2hi);
}

pub const __ieee754_log10 = SDL_uclibc_log10;
