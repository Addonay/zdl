// SDL implementation ported to Zig; generated scaffolding removed.
pub const __uint32_t = c_uint;
pub const u_int32_t = __uint32_t;
pub extern fn __isnan(__value: f64) c_int;
const struct_unnamed_14 = extern struct {
    lsw: u_int32_t = 0,
    msw: u_int32_t = 0,
};
pub const ieee_double_shape_type = extern union {
    value: f64,
    parts: struct_unnamed_14,
};
pub export fn SDL_uclibc_isnan(x: f64) c_int {
    @setEvalBranchQuota(100000);
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
    hx &= 2147483647;
    {
        const ref = &hx;
        ref.* = @bitCast(@as(c_uint, @truncate(@as(u_int32_t, @bitCast(@as(c_int, ref.*))) | (@as(u_int32_t, @bitCast(@as(c_int, lx | -lx))) >> @intCast(@as(u_int32_t, 31))))));
    }
    hx = @as(c_int, 2146435072) - hx;
    return @bitCast(@as(c_uint, @truncate(@as(u_int32_t, @bitCast(@as(c_int, hx))) >> @intCast(@as(u_int32_t, 31)))));
}

