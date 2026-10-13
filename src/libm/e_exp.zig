// SDL implementation ported to Zig; generated scaffolding removed.
pub const __uint32_t = c_uint;
pub const u_int32_t = __uint32_t;
pub extern fn exp(__x: f64) f64;
pub const Uint64 = u64;
const struct_unnamed_14 = extern struct {
    lsw: u_int32_t = 0,
    msw: u_int32_t = 0,
};
pub const ieee_double_shape_type = extern union {
    value: f64,
    parts: struct_unnamed_14,
};
pub const one: f64 = 1.0;
pub const halF: [2]f64 = [2]f64{
    0.5,
    -@as(f64, 0.5),
};
pub const huge: f64 = 1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000.0;
pub const twom1000: f64 = 0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000009332636185032189;
pub const o_threshold: f64 = 709.782712893384;
pub const u_threshold: f64 = -@as(f64, 745.1332191019411);
pub const ln2HI: [2]f64 = [2]f64{
    0.6931471803691238,
    -@as(f64, 0.6931471803691238),
};
pub const ln2LO: [2]f64 = [2]f64{
    0.00000000019082149292705877,
    -@as(f64, 0.00000000019082149292705877),
};
pub const invln2: f64 = 1.4426950408889634;
pub const P1: f64 = 0.16666666666666602;
pub const P2: f64 = -@as(f64, 0.0027777777777015593);
pub const P3: f64 = 0.00006613756321437934;
pub const P4: f64 = -@as(f64, 0.0000016533902205465252);
pub const P5: f64 = 0.000000041381367970572385;
const union_unnamed_15 = extern union {
    u64: Uint64,
    d: f64,
};
pub export var inf_union: union_unnamed_15 = union_unnamed_15{
    .u64 = 9218868437227405312,
};
pub export fn SDL_uclibc_exp(arg_x: f64) f64 {
    @setEvalBranchQuota(100000);
    var x = arg_x;
    _ = &x;
    var y: f64 = undefined;
    _ = &y;
    var hi: f64 = 0.0;
    _ = &hi;
    var lo: f64 = 0.0;
    _ = &lo;
    var c: f64 = undefined;
    _ = &c;
    var t: f64 = undefined;
    _ = &t;
    var k: i32 = 0;
    _ = &k;
    var xsb: i32 = undefined;
    _ = &xsb;
    var hx: u_int32_t = undefined;
    _ = &hx;
    while (true) {
        var gh_u: ieee_double_shape_type = undefined;
        _ = &gh_u;
        gh_u.value = x;
        hx = gh_u.parts.msw;
        if (!false) break;
    }
    xsb = @bitCast(@as(c_uint, @truncate((hx >> @intCast(@as(u_int32_t, 31))) & @as(u_int32_t, 1))));
    hx &= 2147483647;
    if (hx >= @as(u_int32_t, 1082535490)) {
        if (hx >= @as(u_int32_t, 2146435072)) {
            var lx: u_int32_t = undefined;
            _ = &lx;
            while (true) {
                var gl_u: ieee_double_shape_type = undefined;
                _ = &gl_u;
                gl_u.value = x;
                lx = gl_u.parts.lsw;
                if (!false) break;
            }
            if (((hx & @as(u_int32_t, 1048575)) | lx) != @as(u_int32_t, 0)) return x + x else return if (xsb == @as(c_int, 0)) x else @as(f64, 0.0);
        }
        if (x > o_threshold) return inf_union.d;
        if (x < u_threshold) return twom1000 * twom1000;
    }
    if (hx > @as(u_int32_t, 1071001154)) {
        if (hx < @as(u_int32_t, 1072734898)) {
            hi = x - ln2HI[@bitCast(@as(isize, @intCast(xsb)))];
            lo = ln2LO[@bitCast(@as(isize, @intCast(xsb)))];
            k = (@as(c_int, 1) - xsb) - xsb;
        } else {
            k = @intFromFloat((invln2 * x) + halF[@bitCast(@as(isize, @intCast(xsb)))]);
            t = @floatFromInt(k);
            hi = x - (t * ln2HI[@as(c_int, 0)]);
            lo = t * ln2LO[@as(c_int, 0)];
        }
        x = hi - lo;
    } else if (hx < @as(u_int32_t, 1043333120)) {
        if ((huge + x) > one) return one + x;
    } else {
        k = 0;
    }
    t = x * x;
    c = x - (t * (P1 + (t * (P2 + (t * (P3 + (t * (P4 + (t * P5)))))))));
    if (k == @as(c_int, 0)) return one - (((x * c) / (c - @as(f64, 2.0))) - x) else {
        y = one - ((lo - ((x * c) / (@as(f64, 2.0) - c))) - hi);
    }
    if (k >= -@as(c_int, 1021)) {
        var hy: u_int32_t = undefined;
        _ = &hy;
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
            sh_u.value = y;
            sh_u.parts.msw = hy +% @as(u_int32_t, @bitCast(@as(c_int, k << @intCast(@as(c_int, 20)))));
            y = sh_u.value;
            if (!false) break;
        }
        return y;
    } else {
        var hy: u_int32_t = undefined;
        _ = &hy;
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
            sh_u.value = y;
            sh_u.parts.msw = hy +% @as(u_int32_t, @bitCast(@as(c_int, (k + @as(c_int, 1000)) << @intCast(@as(c_int, 20)))));
            y = sh_u.value;
            if (!false) break;
        }
        return y * twom1000;
    }
    return undefined;
}

