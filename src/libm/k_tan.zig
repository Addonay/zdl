// SDL implementation ported to Zig; generated scaffolding removed.
pub const __uint32_t = c_uint;
pub const u_int32_t = __uint32_t;
pub extern fn SDL_uclibc_fabs(x: f64) f64;
const struct_unnamed_14 = extern struct {
    lsw: u_int32_t = 0,
    msw: u_int32_t = 0,
};
pub const ieee_double_shape_type = extern union {
    value: f64,
    parts: struct_unnamed_14,
};
pub const one: f64 = 1.0;
pub const pio4: f64 = 0.7853981633974483;
pub const pio4lo: f64 = 0.00000000000000003061616997868383;
pub const T: [13]f64 = [13]f64{
    0.3333333333333341,
    0.13333333333320124,
    0.05396825397622605,
    0.021869488294859542,
    0.0088632398235993,
    0.0035920791075913124,
    0.0014562094543252903,
    0.0005880412408202641,
    0.0002464631348184699,
    0.00007817944429395571,
    0.00007140724913826082,
    -@as(f64, 0.000018558637485527546),
    0.00002590730518636337,
};
pub export fn __kernel_tan(arg_x: f64, arg_y: f64, iy: c_int) f64 {
    @setEvalBranchQuota(100000);
    var x = arg_x;
    _ = &x;
    var y = arg_y;
    _ = &y;
    var z: f64 = undefined;
    _ = &z;
    var r: f64 = undefined;
    _ = &r;
    var v: f64 = undefined;
    _ = &v;
    var w: f64 = undefined;
    _ = &w;
    var s: f64 = undefined;
    _ = &s;
    var ix: i32 = undefined;
    _ = &ix;
    var hx: i32 = undefined;
    _ = &hx;
    while (true) {
        var gh_u: ieee_double_shape_type = undefined;
        _ = &gh_u;
        gh_u.value = x;
        hx = @bitCast(@as(c_uint, @truncate(gh_u.parts.msw)));
        if (!false) break;
    }
    ix = hx & @as(c_int, 2147483647);
    if (ix < @as(c_int, 1043333120)) {
        if (@as(c_int, @intFromFloat(x)) == @as(c_int, 0)) {
            var low: u_int32_t = undefined;
            _ = &low;
            while (true) {
                var gl_u: ieee_double_shape_type = undefined;
                _ = &gl_u;
                gl_u.value = x;
                low = gl_u.parts.lsw;
                if (!false) break;
            }
            if (((@as(u_int32_t, @bitCast(@as(c_int, ix))) | low) | @as(u_int32_t, @bitCast(@as(c_int, iy + @as(c_int, 1))))) == @as(u_int32_t, 0)) return one / SDL_uclibc_fabs(x) else return if (iy == @as(c_int, 1)) x else -one / x;
        }
    }
    if (ix >= @as(c_int, 1072010280)) {
        if (hx < @as(c_int, 0)) {
            x = -x;
            y = -y;
        }
        z = pio4 - x;
        w = pio4lo - y;
        x = z + w;
        y = 0.0;
    }
    z = x * x;
    w = z * z;
    r = T[@as(c_int, 1)] + (w * (T[@as(c_int, 3)] + (w * (T[@as(c_int, 5)] + (w * (T[@as(c_int, 7)] + (w * (T[@as(c_int, 9)] + (w * T[@as(c_int, 11)])))))))));
    v = z * (T[@as(c_int, 2)] + (w * (T[@as(c_int, 4)] + (w * (T[@as(c_int, 6)] + (w * (T[@as(c_int, 8)] + (w * (T[@as(c_int, 10)] + (w * T[@as(c_int, 12)]))))))))));
    s = z * x;
    r = y + (z * ((s * (r + v)) + y));
    r += T[@as(c_int, 0)] * s;
    w = x + r;
    if (ix >= @as(c_int, 1072010280)) {
        v = @floatFromInt(iy);
        return @as(f64, @floatFromInt(@as(c_int, 1) - ((hx >> @intCast(@as(c_int, 30))) & @as(c_int, 2)))) * (v - (@as(f64, 2.0) * (x - (((w * w) / (w + v)) - r))));
    }
    if (iy == @as(c_int, 1)) return w else {
        var a: f64 = undefined;
        _ = &a;
        var t: f64 = undefined;
        _ = &t;
        z = w;
        while (true) {
            var sl_u: ieee_double_shape_type = undefined;
            _ = &sl_u;
            sl_u.value = z;
            sl_u.parts.lsw = @bitCast(@as(c_int, @as(c_int, 0)));
            z = sl_u.value;
            if (!false) break;
        }
        v = r - (z - x);
        t = blk: {
            const tmp = -@as(f64, 1.0) / w;
            a = tmp;
            break :blk tmp;
        };
        while (true) {
            var sl_u: ieee_double_shape_type = undefined;
            _ = &sl_u;
            sl_u.value = t;
            sl_u.parts.lsw = @bitCast(@as(c_int, @as(c_int, 0)));
            t = sl_u.value;
            if (!false) break;
        }
        s = @as(f64, 1.0) + (t * z);
        return t + (a * (s + (t * v)));
    }
    return undefined;
}

