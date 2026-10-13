// SDL implementation ported to Zig; generated scaffolding removed.
pub const __uint32_t = c_uint;
pub const u_int32_t = __uint32_t;
pub extern fn __isnanf(__value: f32) c_int;
pub const ieee_float_shape_type = extern union {
    value: f32,
    word: u_int32_t,
};
pub export fn SDL_uclibc_isnanf(x: f32) c_int {
    @setEvalBranchQuota(100000);
    var ix: i32 = undefined;
    _ = &ix;
    while (true) {
        var gf_u: ieee_float_shape_type = undefined;
        _ = &gf_u;
        gf_u.value = x;
        ix = @bitCast(@as(c_uint, @truncate(gf_u.word)));
        if (!false) break;
    }
    ix &= 2147483647;
    ix = @as(c_int, 2139095040) - ix;
    return @bitCast(@as(c_uint, @truncate(@as(u_int32_t, @bitCast(@as(c_int, ix))) >> @intCast(@as(u_int32_t, 31)))));
}

