// SDL implementation ported to Zig; generated scaffolding removed.
pub const __uint32_t = c_uint;
pub const u_int32_t = __uint32_t;
pub extern fn __isinff(__value: f32) c_int;
pub const ieee_float_shape_type = extern union {
    value: f32,
    word: u_int32_t,
};
pub export fn SDL_uclibc_isinff(x: f32) c_int {
    @setEvalBranchQuota(100000);
    var ix: i32 = undefined;
    _ = &ix;
    var t: i32 = undefined;
    _ = &t;
    while (true) {
        var gf_u: ieee_float_shape_type = undefined;
        _ = &gf_u;
        gf_u.value = x;
        ix = @bitCast(@as(c_uint, @truncate(gf_u.word)));
        if (!false) break;
    }
    t = ix & @as(c_int, 2147483647);
    t ^= 2139095040;
    t |= -t;
    return ~(t >> @intCast(@as(c_int, 31))) & (ix >> @intCast(@as(c_int, 30)));
}

