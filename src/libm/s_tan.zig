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
pub extern fn __kernel_tan(f64, f64, c_int) f64;
pub export fn SDL_uclibc_tan(x: f64) f64 {
    @setEvalBranchQuota(100000);
    var y: [2]f64 = undefined;
    _ = &y;
    var z: f64 = 0.0;
    _ = &z;
    var n: i32 = undefined;
    _ = &n;
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
    if (ix <= @as(c_int, 1072243195)) return __kernel_tan(x, z, 1) else if (ix >= @as(c_int, 2146435072)) return x - x else {
        n = __ieee754_rem_pio2(x, @ptrCast(@alignCast(&y)));
        return __kernel_tan(y[@as(c_int, 0)], y[@as(c_int, 1)], @as(c_int, 1) - ((n & @as(c_int, 1)) << @intCast(@as(c_int, 1))));
    }
}

