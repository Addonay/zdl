// SDL implementation ported to Zig; generated scaffolding removed.
pub const __uint32_t = c_uint;
pub const u_int32_t = __uint32_t;
pub extern fn log(__x: f64) f64;
const struct_unnamed_14 = extern struct {
    lsw: u_int32_t = 0,
    msw: u_int32_t = 0,
};
pub const ieee_double_shape_type = extern union {
    value: f64,
    parts: struct_unnamed_14,
};
pub const ln2_hi: f64 = 0.6931471803691238;
pub const ln2_lo: f64 = 0.00000000019082149292705877;
pub const two54: f64 = 18014398509481984.0;
pub const Lg1: f64 = 0.6666666666666735;
pub const Lg2: f64 = 0.3999999999940942;
pub const Lg3: f64 = 0.2857142874366239;
pub const Lg4: f64 = 0.22222198432149784;
pub const Lg5: f64 = 0.1818357216161805;
pub const Lg6: f64 = 0.15313837699209373;
pub const Lg7: f64 = 0.14798198605116586;
pub const zero: f64 = 0.0;
pub export fn SDL_uclibc_log(arg_x: f64) f64 {
    @setEvalBranchQuota(100000);
    var x = arg_x;
    _ = &x;
    var hfsq: f64 = undefined;
    _ = &hfsq;
    var f: f64 = undefined;
    _ = &f;
    var s: f64 = undefined;
    _ = &s;
    var z: f64 = undefined;
    _ = &z;
    var R: f64 = undefined;
    _ = &R;
    var w: f64 = undefined;
    _ = &w;
    var t1: f64 = undefined;
    _ = &t1;
    var t2: f64 = undefined;
    _ = &t2;
    var dk: f64 = undefined;
    _ = &dk;
    var k: i32 = undefined;
    _ = &k;
    var hx: i32 = undefined;
    _ = &hx;
    var i: i32 = undefined;
    _ = &i;
    var j: i32 = undefined;
    _ = &j;
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
    hx &= 1048575;
    i = (hx + @as(c_int, 614244)) & @as(c_int, 1048576);
    while (true) {
        var sh_u: ieee_double_shape_type = undefined;
        _ = &sh_u;
        sh_u.value = x;
        sh_u.parts.msw = @bitCast(@as(c_int, hx | (i ^ @as(c_int, 1072693248))));
        x = sh_u.value;
        if (!false) break;
    }
    k += i >> @intCast(@as(c_int, 20));
    f = x - @as(f64, 1.0);
    if ((@as(c_int, 1048575) & (@as(c_int, 2) + hx)) < @as(c_int, 3)) {
        if (f == zero) {
            if (k == @as(c_int, 0)) return zero else {
                dk = @floatFromInt(k);
                return (dk * ln2_hi) + (dk * ln2_lo);
            }
        }
        R = (f * f) * (@as(f64, 0.5) - (@as(f64, 0.3333333333333333) * f));
        if (k == @as(c_int, 0)) return f - R else {
            dk = @floatFromInt(k);
            return (dk * ln2_hi) - ((R - (dk * ln2_lo)) - f);
        }
    }
    s = f / (@as(f64, 2.0) + f);
    dk = @floatFromInt(k);
    z = s * s;
    i = hx - @as(c_int, 398458);
    w = z * z;
    j = @as(c_int, 440401) - hx;
    t1 = w * (Lg2 + (w * (Lg4 + (w * Lg6))));
    t2 = z * (Lg1 + (w * (Lg3 + (w * (Lg5 + (w * Lg7))))));
    i |= j;
    R = t2 + t1;
    if (i > @as(c_int, 0)) {
        hfsq = (@as(f64, 0.5) * f) * f;
        if (k == @as(c_int, 0)) return f - (hfsq - (s * (hfsq + R))) else return (dk * ln2_hi) - ((hfsq - ((s * (hfsq + R)) + (dk * ln2_lo))) - f);
    } else {
        if (k == @as(c_int, 0)) return f - (s * (f - R)) else return (dk * ln2_hi) - (((s * (f - R)) - (dk * ln2_lo)) - f);
    }
}

pub const __ieee754_log = SDL_uclibc_log;
