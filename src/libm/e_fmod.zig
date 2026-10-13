// SDL implementation ported to Zig; generated scaffolding removed.
pub const __uint32_t = c_uint;
pub const u_int32_t = __uint32_t;
pub extern fn fmod(__x: f64, __y: f64) f64;
const struct_unnamed_14 = extern struct {
    lsw: u_int32_t = 0,
    msw: u_int32_t = 0,
};
pub const ieee_double_shape_type = extern union {
    value: f64,
    parts: struct_unnamed_14,
};
pub const one: f64 = 1.0;
pub const Zero: [2]f64 = [2]f64{
    0.0,
    -@as(f64, 0.0),
};
pub export fn SDL_uclibc_fmod(arg_x: f64, y: f64) f64 {
    @setEvalBranchQuota(100000);
    var x = arg_x;
    _ = &x;
    var n: i32 = undefined;
    _ = &n;
    var hx: i32 = undefined;
    _ = &hx;
    var hy: i32 = undefined;
    _ = &hy;
    var hz: i32 = undefined;
    _ = &hz;
    var ix: i32 = undefined;
    _ = &ix;
    var iy: i32 = undefined;
    _ = &iy;
    var sx: i32 = undefined;
    _ = &sx;
    var i: i32 = undefined;
    _ = &i;
    var lx: u_int32_t = undefined;
    _ = &lx;
    var ly: u_int32_t = undefined;
    _ = &ly;
    var lz: u_int32_t = undefined;
    _ = &lz;
    while (true) {
        var ew_u: ieee_double_shape_type = undefined;
        _ = &ew_u;
        ew_u.value = x;
        hx = @bitCast(@as(c_uint, @truncate(ew_u.parts.msw)));
        lx = ew_u.parts.lsw;
        if (!false) break;
    }
    while (true) {
        var ew_u: ieee_double_shape_type = undefined;
        _ = &ew_u;
        ew_u.value = y;
        hy = @bitCast(@as(c_uint, @truncate(ew_u.parts.msw)));
        ly = ew_u.parts.lsw;
        if (!false) break;
    }
    sx = @bitCast(@as(c_uint, @truncate(@as(c_uint, @bitCast(@as(c_int, hx))) & @as(c_uint, 2147483648))));
    hx ^= sx;
    hy &= 2147483647;
    if ((((@as(u_int32_t, @bitCast(@as(c_int, hy))) | ly) == @as(u_int32_t, 0)) or (hx >= @as(c_int, 2146435072))) or ((@as(u_int32_t, @bitCast(@as(c_int, hy))) | ((ly | @as(u_int32_t, @bitCast(@as(c_int, -@as(i32, @bitCast(@as(c_uint, @truncate(ly)))))))) >> @intCast(@as(u_int32_t, 31)))) > @as(u_int32_t, 2146435072))) return (x * y) / (x * y);
    if (hx <= hy) {
        if ((hx < hy) or (lx < ly)) return x;
        if (lx == ly) return Zero[@as(u_int32_t, @bitCast(@as(c_int, sx))) >> @intCast(@as(u_int32_t, 31))];
    }
    if (hx < @as(c_int, 1048576)) {
        if (hx == @as(c_int, 0)) {
            {
                ix = -@as(c_int, 1043);
                i = @bitCast(@as(c_uint, @truncate(lx)));
                while (i > @as(c_int, 0)) : (i <<= @intCast(@as(c_int, 1))) {
                    ix -= 1;
                }
            }
        } else {
            {
                ix = -@as(c_int, 1022);
                i = hx << @intCast(@as(c_int, 11));
                while (i > @as(c_int, 0)) : (i <<= @intCast(@as(c_int, 1))) {
                    ix -= 1;
                }
            }
        }
    } else {
        ix = (hx >> @intCast(@as(c_int, 20))) - @as(c_int, 1023);
    }
    if (hy < @as(c_int, 1048576)) {
        if (hy == @as(c_int, 0)) {
            {
                iy = -@as(c_int, 1043);
                i = @bitCast(@as(c_uint, @truncate(ly)));
                while (i > @as(c_int, 0)) : (i <<= @intCast(@as(c_int, 1))) {
                    iy -= 1;
                }
            }
        } else {
            {
                iy = -@as(c_int, 1022);
                i = hy << @intCast(@as(c_int, 11));
                while (i > @as(c_int, 0)) : (i <<= @intCast(@as(c_int, 1))) {
                    iy -= 1;
                }
            }
        }
    } else {
        iy = (hy >> @intCast(@as(c_int, 20))) - @as(c_int, 1023);
    }
    if (ix >= -@as(c_int, 1022)) {
        hx = @as(c_int, 1048576) | (@as(c_int, 1048575) & hx);
    } else {
        n = -@as(c_int, 1022) - ix;
        if (n <= @as(c_int, 31)) {
            hx = @bitCast(@as(c_uint, @truncate(@as(u_int32_t, @bitCast(@as(c_int, hx << @intCast(n)))) | (lx >> @intCast(@as(u_int32_t, @bitCast(@as(c_int, @as(c_int, 32) - n))))))));
            lx <<= @intCast(@as(u_int32_t, @bitCast(@as(c_int, n))));
        } else {
            hx = @bitCast(@as(c_uint, @truncate(lx << @intCast(@as(u_int32_t, @bitCast(@as(c_int, n - @as(c_int, 32))))))));
            lx = 0;
        }
    }
    if (iy >= -@as(c_int, 1022)) {
        hy = @as(c_int, 1048576) | (@as(c_int, 1048575) & hy);
    } else {
        n = -@as(c_int, 1022) - iy;
        if (n <= @as(c_int, 31)) {
            hy = @bitCast(@as(c_uint, @truncate(@as(u_int32_t, @bitCast(@as(c_int, hy << @intCast(n)))) | (ly >> @intCast(@as(u_int32_t, @bitCast(@as(c_int, @as(c_int, 32) - n))))))));
            ly <<= @intCast(@as(u_int32_t, @bitCast(@as(c_int, n))));
        } else {
            hy = @bitCast(@as(c_uint, @truncate(ly << @intCast(@as(u_int32_t, @bitCast(@as(c_int, n - @as(c_int, 32))))))));
            ly = 0;
        }
    }
    n = ix - iy;
    while ((blk: {
        const ref = &n;
        const tmp = ref.*;
        ref.* -= 1;
        break :blk tmp;
    }) != 0) {
        hz = hx - hy;
        lz = lx -% ly;
        if (lx < ly) {
            hz -= 1;
        }
        if (hz < @as(c_int, 0)) {
            hx = @bitCast(@as(c_uint, @truncate(@as(u_int32_t, @bitCast(@as(c_int, hx + hx))) +% (lx >> @intCast(@as(u_int32_t, 31))))));
            lx = lx +% lx;
        } else {
            if ((@as(u_int32_t, @bitCast(@as(c_int, hz))) | lz) == @as(u_int32_t, 0)) return Zero[@as(u_int32_t, @bitCast(@as(c_int, sx))) >> @intCast(@as(u_int32_t, 31))];
            hx = @bitCast(@as(c_uint, @truncate(@as(u_int32_t, @bitCast(@as(c_int, hz + hz))) +% (lz >> @intCast(@as(u_int32_t, 31))))));
            lx = lz +% lz;
        }
    }
    hz = hx - hy;
    lz = lx -% ly;
    if (lx < ly) {
        hz -= 1;
    }
    if (hz >= @as(c_int, 0)) {
        hx = hz;
        lx = lz;
    }
    if ((@as(u_int32_t, @bitCast(@as(c_int, hx))) | lx) == @as(u_int32_t, 0)) return Zero[@as(u_int32_t, @bitCast(@as(c_int, sx))) >> @intCast(@as(u_int32_t, 31))];
    while (hx < @as(c_int, 1048576)) {
        hx = @bitCast(@as(c_uint, @truncate(@as(u_int32_t, @bitCast(@as(c_int, hx + hx))) +% (lx >> @intCast(@as(u_int32_t, 31))))));
        lx = lx +% lx;
        iy -= 1;
    }
    if (iy >= -@as(c_int, 1022)) {
        hx = (hx - @as(c_int, 1048576)) | ((iy + @as(c_int, 1023)) << @intCast(@as(c_int, 20)));
        while (true) {
            var iw_u: ieee_double_shape_type = undefined;
            _ = &iw_u;
            iw_u.parts.msw = @bitCast(@as(c_int, hx | sx));
            iw_u.parts.lsw = lx;
            x = iw_u.value;
            if (!false) break;
        }
    } else {
        n = -@as(c_int, 1022) - iy;
        if (n <= @as(c_int, 20)) {
            lx = (lx >> @intCast(@as(u_int32_t, @bitCast(@as(c_int, n))))) | (@as(u_int32_t, @bitCast(@as(c_int, hx))) << @intCast(@as(u_int32_t, @bitCast(@as(c_int, @as(c_int, 32) - n)))));
            hx >>= @intCast(n);
        } else if (n <= @as(c_int, 31)) {
            lx = @as(u_int32_t, @bitCast(@as(c_int, hx << @intCast(@as(c_int, 32) - n)))) | (lx >> @intCast(@as(u_int32_t, @bitCast(@as(c_int, n)))));
            hx = sx;
        } else {
            lx = @bitCast(@as(c_int, hx >> @intCast(n - @as(c_int, 32))));
            hx = sx;
        }
        while (true) {
            var iw_u: ieee_double_shape_type = undefined;
            _ = &iw_u;
            iw_u.parts.msw = @bitCast(@as(c_int, hx | sx));
            iw_u.parts.lsw = lx;
            x = iw_u.value;
            if (!false) break;
        }
        x *= one;
    }
    return x;
}

pub const __ieee754_fmod = SDL_uclibc_fmod;
