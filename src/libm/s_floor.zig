// SDL implementation ported to Zig; generated scaffolding removed.
pub const __uint32_t = c_uint;
pub const u_int32_t = __uint32_t;
pub extern fn floor(__x: f64) f64;
const struct_unnamed_14 = extern struct {
    lsw: u_int32_t = 0,
    msw: u_int32_t = 0,
};
pub const ieee_double_shape_type = extern union {
    value: f64,
    parts: struct_unnamed_14,
};
pub const huge: f64 = 1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000.0;
pub export fn SDL_uclibc_floor(arg_x: f64) f64 {
    @setEvalBranchQuota(100000);
    var x = arg_x;
    _ = &x;
    var @"i0": i32 = undefined;
    _ = &@"i0";
    var @"i1": i32 = undefined;
    _ = &@"i1";
    var j0_1: i32 = undefined;
    _ = &j0_1;
    var i: u_int32_t = undefined;
    _ = &i;
    var j: u_int32_t = undefined;
    _ = &j;
    while (true) {
        var ew_u: ieee_double_shape_type = undefined;
        _ = &ew_u;
        ew_u.value = x;
        @"i0" = @bitCast(@as(c_uint, @truncate(ew_u.parts.msw)));
        @"i1" = @bitCast(@as(c_uint, @truncate(ew_u.parts.lsw)));
        if (!false) break;
    }
    j0_1 = ((@"i0" >> @intCast(@as(c_int, 20))) & @as(c_int, 2047)) - @as(c_int, 1023);
    if (j0_1 < @as(c_int, 20)) {
        if (j0_1 < @as(c_int, 0)) {
            if ((huge + x) > @as(f64, 0.0)) {
                if (@"i0" >= @as(c_int, 0)) {
                    @"i0" = blk: {
                        const tmp = @as(c_int, 0);
                        @"i1" = tmp;
                        break :blk tmp;
                    };
                } else if (((@"i0" & @as(c_int, 2147483647)) | @"i1") != @as(c_int, 0)) {
                    @"i0" = @bitCast(@as(c_uint, @truncate(@as(c_uint, 3220176896))));
                    @"i1" = 0;
                }
            }
        } else {
            i = @bitCast(@as(c_int, @as(c_int, 1048575) >> @intCast(j0_1)));
            if (((@as(u_int32_t, @bitCast(@as(c_int, @"i0"))) & i) | @as(u_int32_t, @bitCast(@as(c_int, @"i1")))) == @as(u_int32_t, 0)) return x;
            if ((huge + x) > @as(f64, 0.0)) {
                if (@"i0" < @as(c_int, 0)) {
                    @"i0" += @as(c_int, 1048576) >> @intCast(j0_1);
                }
                {
                    const ref = &@"i0";
                    ref.* = @bitCast(@as(c_uint, @truncate(@as(u_int32_t, @bitCast(@as(c_int, ref.*))) & ~i)));
                }
                @"i1" = 0;
            }
        }
    } else if (j0_1 > @as(c_int, 51)) {
        if (j0_1 == @as(c_int, 1024)) return x + x else return x;
    } else {
        i = @as(c_uint, 4294967295) >> @intCast(@as(u_int32_t, @bitCast(@as(c_int, j0_1 - @as(c_int, 20)))));
        if ((@as(u_int32_t, @bitCast(@as(c_int, @"i1"))) & i) == @as(u_int32_t, 0)) return x;
        if ((huge + x) > @as(f64, 0.0)) {
            if (@"i0" < @as(c_int, 0)) {
                if (j0_1 == @as(c_int, 20)) {
                    @"i0" += 1;
                } else {
                    j = @bitCast(@as(c_int, @"i1" + (@as(c_int, 1) << @intCast(@as(c_int, 52) - j0_1))));
                    if (j < @as(u_int32_t, @bitCast(@as(c_int, @"i1")))) {
                        @"i0" += 1;
                    }
                    @"i1" = @bitCast(@as(c_uint, @truncate(j)));
                }
            }
            {
                const ref = &@"i1";
                ref.* = @bitCast(@as(c_uint, @truncate(@as(u_int32_t, @bitCast(@as(c_int, ref.*))) & ~i)));
            }
        }
    }
    while (true) {
        var iw_u: ieee_double_shape_type = undefined;
        _ = &iw_u;
        iw_u.parts.msw = @bitCast(@as(c_int, @"i0"));
        iw_u.parts.lsw = @bitCast(@as(c_int, @"i1"));
        x = iw_u.value;
        if (!false) break;
    }
    return x;
}

