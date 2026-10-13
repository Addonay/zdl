// SDL implementation ported to Zig; generated scaffolding removed.
pub const __uint32_t = c_uint;
pub const u_int32_t = __uint32_t;
pub extern fn modf(__x: f64, __iptr: [*c]f64) f64;
const struct_unnamed_14 = extern struct {
    lsw: u_int32_t = 0,
    msw: u_int32_t = 0,
};
pub const ieee_double_shape_type = extern union {
    value: f64,
    parts: struct_unnamed_14,
};
pub const one: f64 = 1.0;
pub export fn SDL_uclibc_modf(arg_x: f64, iptr: [*c]f64) f64 {
    @setEvalBranchQuota(100000);
    var x = arg_x;
    _ = &x;
    var @"i0": i32 = undefined;
    _ = &@"i0";
    var @"i1": i32 = undefined;
    _ = &@"i1";
    var _j0: i32 = undefined;
    _ = &_j0;
    var i: u_int32_t = undefined;
    _ = &i;
    while (true) {
        var ew_u: ieee_double_shape_type = undefined;
        _ = &ew_u;
        ew_u.value = x;
        @"i0" = @bitCast(@as(c_uint, @truncate(ew_u.parts.msw)));
        @"i1" = @bitCast(@as(c_uint, @truncate(ew_u.parts.lsw)));
        if (!false) break;
    }
    _j0 = ((@"i0" >> @intCast(@as(c_int, 20))) & @as(c_int, 2047)) - @as(c_int, 1023);
    if (_j0 < @as(c_int, 20)) {
        if (_j0 < @as(c_int, 0)) {
            while (true) {
                var iw_u: ieee_double_shape_type = undefined;
                _ = &iw_u;
                iw_u.parts.msw = @as(c_uint, @bitCast(@as(c_int, @"i0"))) & @as(c_uint, 2147483648);
                iw_u.parts.lsw = @bitCast(@as(c_int, @as(c_int, 0)));
                iptr.* = iw_u.value;
                if (!false) break;
            }
            return x;
        } else {
            i = @bitCast(@as(c_int, @as(c_int, 1048575) >> @intCast(_j0)));
            if (((@as(u_int32_t, @bitCast(@as(c_int, @"i0"))) & i) | @as(u_int32_t, @bitCast(@as(c_int, @"i1")))) == @as(u_int32_t, 0)) {
                iptr.* = x;
                while (true) {
                    var iw_u: ieee_double_shape_type = undefined;
                    _ = &iw_u;
                    iw_u.parts.msw = @as(c_uint, @bitCast(@as(c_int, @"i0"))) & @as(c_uint, 2147483648);
                    iw_u.parts.lsw = @bitCast(@as(c_int, @as(c_int, 0)));
                    x = iw_u.value;
                    if (!false) break;
                }
                return x;
            } else {
                while (true) {
                    var iw_u: ieee_double_shape_type = undefined;
                    _ = &iw_u;
                    iw_u.parts.msw = @as(u_int32_t, @bitCast(@as(c_int, @"i0"))) & ~i;
                    iw_u.parts.lsw = @bitCast(@as(c_int, @as(c_int, 0)));
                    iptr.* = iw_u.value;
                    if (!false) break;
                }
                return x - iptr.*;
            }
        }
    } else if (_j0 > @as(c_int, 51)) {
        iptr.* = x * one;
        if ((_j0 == @as(c_int, 1024)) and (((@"i0" & @as(c_int, 1048575)) | @"i1") != 0)) return x * one;
        while (true) {
            var iw_u: ieee_double_shape_type = undefined;
            _ = &iw_u;
            iw_u.parts.msw = @as(c_uint, @bitCast(@as(c_int, @"i0"))) & @as(c_uint, 2147483648);
            iw_u.parts.lsw = @bitCast(@as(c_int, @as(c_int, 0)));
            x = iw_u.value;
            if (!false) break;
        }
        return x;
    } else {
        i = @as(c_uint, 4294967295) >> @intCast(@as(u_int32_t, @bitCast(@as(c_int, _j0 - @as(c_int, 20)))));
        if ((@as(u_int32_t, @bitCast(@as(c_int, @"i1"))) & i) == @as(u_int32_t, 0)) {
            iptr.* = x;
            while (true) {
                var iw_u: ieee_double_shape_type = undefined;
                _ = &iw_u;
                iw_u.parts.msw = @as(c_uint, @bitCast(@as(c_int, @"i0"))) & @as(c_uint, 2147483648);
                iw_u.parts.lsw = @bitCast(@as(c_int, @as(c_int, 0)));
                x = iw_u.value;
                if (!false) break;
            }
            return x;
        } else {
            while (true) {
                var iw_u: ieee_double_shape_type = undefined;
                _ = &iw_u;
                iw_u.parts.msw = @bitCast(@as(c_int, @"i0"));
                iw_u.parts.lsw = @as(u_int32_t, @bitCast(@as(c_int, @"i1"))) & ~i;
                iptr.* = iw_u.value;
                if (!false) break;
            }
            return x - iptr.*;
        }
    }
    return undefined;
}

