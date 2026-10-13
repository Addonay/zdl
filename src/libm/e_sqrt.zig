// SDL implementation ported to Zig; generated scaffolding removed.
pub const __uint32_t = c_uint;
pub const u_int32_t = __uint32_t;
pub extern fn sqrt(__x: f64) f64;
const struct_unnamed_14 = extern struct {
    lsw: u_int32_t = 0,
    msw: u_int32_t = 0,
};
pub const ieee_double_shape_type = extern union {
    value: f64,
    parts: struct_unnamed_14,
};
pub const one: f64 = 1.0;
pub const tiny: f64 = 0.000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001;
pub export fn SDL_uclibc_sqrt(x: f64) f64 {
    @setEvalBranchQuota(100000);
    var z: f64 = undefined;
    _ = &z;
    var sign: i32 = @bitCast(@as(c_uint, @truncate(@as(c_uint, 2147483648))));
    _ = &sign;
    var ix0: i32 = undefined;
    _ = &ix0;
    var s0: i32 = undefined;
    _ = &s0;
    var q: i32 = undefined;
    _ = &q;
    var m: i32 = undefined;
    _ = &m;
    var t: i32 = undefined;
    _ = &t;
    var i: i32 = undefined;
    _ = &i;
    var r: u_int32_t = undefined;
    _ = &r;
    var t1: u_int32_t = undefined;
    _ = &t1;
    var s1: u_int32_t = undefined;
    _ = &s1;
    var ix1: u_int32_t = undefined;
    _ = &ix1;
    var q1: u_int32_t = undefined;
    _ = &q1;
    while (true) {
        var ew_u: ieee_double_shape_type = undefined;
        _ = &ew_u;
        ew_u.value = x;
        ix0 = @bitCast(@as(c_uint, @truncate(ew_u.parts.msw)));
        ix1 = ew_u.parts.lsw;
        if (!false) break;
    }
    if ((ix0 & @as(c_int, 2146435072)) == @as(c_int, 2146435072)) {
        return (x * x) + x;
    }
    if (ix0 <= @as(c_int, 0)) {
        if ((@as(u_int32_t, @bitCast(@as(c_int, ix0 & ~sign))) | ix1) == @as(u_int32_t, 0)) return x else if (ix0 < @as(c_int, 0)) return (x - x) / (x - x);
    }
    m = ix0 >> @intCast(@as(c_int, 20));
    if (m == @as(c_int, 0)) {
        while (ix0 == @as(c_int, 0)) {
            m -= 21;
            {
                const ref = &ix0;
                ref.* = @bitCast(@as(c_uint, @truncate(@as(u_int32_t, @bitCast(@as(c_int, ref.*))) | (ix1 >> @intCast(@as(u_int32_t, 11))))));
            }
            ix1 <<= @intCast(@as(u_int32_t, 21));
        }
        {
            i = 0;
            while ((ix0 & @as(c_int, 1048576)) == @as(c_int, 0)) : (i += 1) {
                ix0 <<= @intCast(@as(c_int, 1));
            }
        }
        m -= i - @as(c_int, 1);
        {
            const ref = &ix0;
            ref.* = @bitCast(@as(c_uint, @truncate(@as(u_int32_t, @bitCast(@as(c_int, ref.*))) | (ix1 >> @intCast(@as(u_int32_t, @bitCast(@as(c_int, @as(c_int, 32) - i))))))));
        }
        ix1 <<= @intCast(@as(u_int32_t, @bitCast(@as(c_int, i))));
    }
    m -= 1023;
    ix0 = (ix0 & @as(c_int, 1048575)) | @as(c_int, 1048576);
    if ((m & @as(c_int, 1)) != 0) {
        {
            const ref = &ix0;
            ref.* = @bitCast(@as(c_uint, @truncate(@as(u_int32_t, @bitCast(@as(c_int, ref.*))) +% (@as(u_int32_t, @bitCast(@as(c_int, ix0))) +% ((ix1 & @as(u_int32_t, @bitCast(@as(c_int, sign)))) >> @intCast(@as(u_int32_t, 31)))))));
        }
        ix1 +%= ix1;
    }
    m >>= @intCast(@as(c_int, 1));
    {
        const ref = &ix0;
        ref.* = @bitCast(@as(c_uint, @truncate(@as(u_int32_t, @bitCast(@as(c_int, ref.*))) +% (@as(u_int32_t, @bitCast(@as(c_int, ix0))) +% ((ix1 & @as(u_int32_t, @bitCast(@as(c_int, sign)))) >> @intCast(@as(u_int32_t, 31)))))));
    }
    ix1 +%= ix1;
    q = @bitCast(@as(c_uint, @truncate(blk: {
        const tmp = @as(u_int32_t, @bitCast(@as(c_int, blk_1: {
            const tmp_2 = @as(i32, @bitCast(@as(c_uint, @truncate(blk_2: {
                const tmp_3 = @as(u_int32_t, 0);
                s1 = tmp_3;
                break :blk_2 tmp_3;
            }))));
            s0 = tmp_2;
            break :blk_1 tmp_2;
        })));
        q1 = tmp;
        break :blk tmp;
    })));
    r = 2097152;
    while (r != @as(u_int32_t, 0)) {
        t = @bitCast(@as(c_uint, @truncate(@as(u_int32_t, @bitCast(@as(c_int, s0))) +% r)));
        if (t <= ix0) {
            s0 = @bitCast(@as(c_uint, @truncate(@as(u_int32_t, @bitCast(@as(c_int, t))) +% r)));
            ix0 -= t;
            {
                const ref = &q;
                ref.* = @bitCast(@as(c_uint, @truncate(@as(u_int32_t, @bitCast(@as(c_int, ref.*))) +% r)));
            }
        }
        {
            const ref = &ix0;
            ref.* = @bitCast(@as(c_uint, @truncate(@as(u_int32_t, @bitCast(@as(c_int, ref.*))) +% (@as(u_int32_t, @bitCast(@as(c_int, ix0))) +% ((ix1 & @as(u_int32_t, @bitCast(@as(c_int, sign)))) >> @intCast(@as(u_int32_t, 31)))))));
        }
        ix1 +%= ix1;
        r >>= @intCast(@as(u_int32_t, 1));
    }
    r = @bitCast(@as(c_int, sign));
    while (r != @as(u_int32_t, 0)) {
        t1 = s1 +% r;
        t = s0;
        if ((t < ix0) or ((t == ix0) and (t1 <= ix1))) {
            s1 = t1 +% r;
            if (((t1 & @as(u_int32_t, @bitCast(@as(c_int, sign)))) == @as(u_int32_t, @bitCast(@as(c_int, sign)))) and ((s1 & @as(u_int32_t, @bitCast(@as(c_int, sign)))) == @as(u_int32_t, 0))) {
                s0 += 1;
            }
            ix0 -= t;
            if (ix1 < t1) {
                ix0 -= 1;
            }
            ix1 -%= t1;
            q1 +%= r;
        }
        {
            const ref = &ix0;
            ref.* = @bitCast(@as(c_uint, @truncate(@as(u_int32_t, @bitCast(@as(c_int, ref.*))) +% (@as(u_int32_t, @bitCast(@as(c_int, ix0))) +% ((ix1 & @as(u_int32_t, @bitCast(@as(c_int, sign)))) >> @intCast(@as(u_int32_t, 31)))))));
        }
        ix1 +%= ix1;
        r >>= @intCast(@as(u_int32_t, 1));
    }
    if ((@as(u_int32_t, @bitCast(@as(c_int, ix0))) | ix1) != @as(u_int32_t, 0)) {
        z = one - tiny;
        if (z >= one) {
            z = one + tiny;
            if (q1 == @as(c_uint, 4294967295)) {
                q1 = 0;
                q += 1;
            } else if (z > one) {
                if (q1 == @as(c_uint, 4294967294)) {
                    q += 1;
                }
                q1 +%= 2;
            } else {
                q1 +%= q1 & @as(u_int32_t, 1);
            }
        }
    }
    ix0 = (q >> @intCast(@as(c_int, 1))) + @as(c_int, 1071644672);
    ix1 = q1 >> @intCast(@as(u_int32_t, 1));
    if ((q & @as(c_int, 1)) == @as(c_int, 1)) {
        ix1 |= @bitCast(@as(c_int, sign));
    }
    ix0 += m << @intCast(@as(c_int, 20));
    while (true) {
        var iw_u: ieee_double_shape_type = undefined;
        _ = &iw_u;
        iw_u.parts.msw = @bitCast(@as(c_int, ix0));
        iw_u.parts.lsw = ix1;
        z = iw_u.value;
        if (!false) break;
    }
    return z;
}

pub const __ieee754_sqrt = SDL_uclibc_sqrt;
