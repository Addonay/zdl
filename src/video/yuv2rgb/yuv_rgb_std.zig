// SDL implementation ported to Zig; generated scaffolding removed.
pub const Uint16 = u16;
pub const Uint32 = u32;
pub const YCbCrType = c_uint;
pub export fn yuv420_rgb565_std(width: u32, height: u32, Y: [*c]const u8, U: [*c]const u8, V_1: [*c]const u8, arg_Y_stride: u32, arg_UV_stride: u32, RGB: [*c]u8, RGB_stride: u32, yuv_type: YCbCrType) void {
    @setEvalBranchQuota(100000);
    var Y_stride = arg_Y_stride;
    _ = &Y_stride;
    var UV_stride = arg_UV_stride;
    _ = &UV_stride;
    const param: [*c]const YUV2RGBParam = &YUV2RGB[yuv_type];
    _ = &param;
    {
        const ref = &Y_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u8));
    }
    {
        const ref = &UV_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u8));
    }
    var x: u32 = undefined;
    _ = &x;
    var y: u32 = undefined;
    _ = &y;
    {
        y = 0;
        while (y < (height -% @as(u32, @bitCast(@as(c_int, @as(c_int, 2) - @as(c_int, 1)))))) : (y +%= 2) {
            var y_ptr1: [*c]const u8 = Y + (y *% Y_stride);
            _ = &y_ptr1;
            var u_ptr: [*c]const u8 = U + ((y / @as(u32, 2)) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((y / @as(u32, 2)) *% UV_stride);
            _ = &v_ptr;
            var y_ptr2: [*c]const u8 = Y + ((y +% @as(u32, 1)) *% Y_stride);
            _ = &y_ptr2;
            var rgb_ptr1: [*c]u8 = RGB + (y *% RGB_stride);
            _ = &rgb_ptr1;
            var rgb_ptr2: [*c]u8 = RGB + ((y +% @as(u32, 1)) *% RGB_stride);
            _ = &rgb_ptr2;
            {
                x = 0;
                while (x < (width -% @as(u32, @bitCast(@as(c_int, @as(c_int, 2) - @as(c_int, 1)))))) : (x +%= 2) {
                    var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &u_tmp;
                    var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &v_tmp;
                    var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                    _ = &r_tmp;
                    var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                    _ = &g_tmp;
                    var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                    _ = &b_tmp;
                    var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    _ = &y_tmp;
                    @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr1))).* = @bitCast(@as(c_short, @truncate((((@as(c_int, @as(Uint16, clampU8(y_tmp + r_tmp))) << @intCast(@as(c_int, 8))) & @as(c_int, 63488)) | ((@as(c_int, @as(Uint16, clampU8(y_tmp + g_tmp))) << @intCast(@as(c_int, 3))) & @as(c_int, 2016))) | (@as(c_int, @as(Uint16, clampU8(y_tmp + b_tmp))) >> @intCast(@as(c_int, 3))))));
                    rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                    y_tmp = (@as(c_int, y_ptr1[@as(c_int, 1)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr1))).* = @bitCast(@as(c_short, @truncate((((@as(c_int, @as(Uint16, clampU8(y_tmp + r_tmp))) << @intCast(@as(c_int, 8))) & @as(c_int, 63488)) | ((@as(c_int, @as(Uint16, clampU8(y_tmp + g_tmp))) << @intCast(@as(c_int, 3))) & @as(c_int, 2016))) | (@as(c_int, @as(Uint16, clampU8(y_tmp + b_tmp))) >> @intCast(@as(c_int, 3))))));
                    rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                    y_tmp = (@as(c_int, y_ptr2[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr2))).* = @bitCast(@as(c_short, @truncate((((@as(c_int, @as(Uint16, clampU8(y_tmp + r_tmp))) << @intCast(@as(c_int, 8))) & @as(c_int, 63488)) | ((@as(c_int, @as(Uint16, clampU8(y_tmp + g_tmp))) << @intCast(@as(c_int, 3))) & @as(c_int, 2016))) | (@as(c_int, @as(Uint16, clampU8(y_tmp + b_tmp))) >> @intCast(@as(c_int, 3))))));
                    rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                    y_tmp = (@as(c_int, y_ptr2[@as(c_int, 1)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr2))).* = @bitCast(@as(c_short, @truncate((((@as(c_int, @as(Uint16, clampU8(y_tmp + r_tmp))) << @intCast(@as(c_int, 8))) & @as(c_int, 63488)) | ((@as(c_int, @as(Uint16, clampU8(y_tmp + g_tmp))) << @intCast(@as(c_int, 3))) & @as(c_int, 2016))) | (@as(c_int, @as(Uint16, clampU8(y_tmp + b_tmp))) >> @intCast(@as(c_int, 3))))));
                    rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                    y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 1)))));
                    y_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 1)))));
                    u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 1), @as(c_int, 2))))));
                    v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 1), @as(c_int, 2))))));
                }
            }
            if (x == (width -% @as(u32, 1))) {
                var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &u_tmp;
                var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &v_tmp;
                var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                _ = &r_tmp;
                var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                _ = &g_tmp;
                var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                _ = &b_tmp;
                var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                _ = &y_tmp;
                @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr1))).* = @bitCast(@as(c_short, @truncate((((@as(c_int, @as(Uint16, clampU8(y_tmp + r_tmp))) << @intCast(@as(c_int, 8))) & @as(c_int, 63488)) | ((@as(c_int, @as(Uint16, clampU8(y_tmp + g_tmp))) << @intCast(@as(c_int, 3))) & @as(c_int, 2016))) | (@as(c_int, @as(Uint16, clampU8(y_tmp + b_tmp))) >> @intCast(@as(c_int, 3))))));
                rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                y_tmp = (@as(c_int, y_ptr2[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr2))).* = @bitCast(@as(c_short, @truncate((((@as(c_int, @as(Uint16, clampU8(y_tmp + r_tmp))) << @intCast(@as(c_int, 8))) & @as(c_int, 63488)) | ((@as(c_int, @as(Uint16, clampU8(y_tmp + g_tmp))) << @intCast(@as(c_int, 3))) & @as(c_int, 2016))) | (@as(c_int, @as(Uint16, clampU8(y_tmp + b_tmp))) >> @intCast(@as(c_int, 3))))));
                rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
            }
        }
    }
    if (y == (height -% @as(u32, 1))) {
        var y_ptr1: [*c]const u8 = Y + (y *% Y_stride);
        _ = &y_ptr1;
        var u_ptr: [*c]const u8 = U + ((y / @as(u32, 2)) *% UV_stride);
        _ = &u_ptr;
        var v_ptr: [*c]const u8 = V_1 + ((y / @as(u32, 2)) *% UV_stride);
        _ = &v_ptr;
        var rgb_ptr1: [*c]u8 = RGB + (y *% RGB_stride);
        _ = &rgb_ptr1;
        {
            x = 0;
            while (x < (width -% @as(u32, @bitCast(@as(c_int, @as(c_int, 2) - @as(c_int, 1)))))) : (x +%= 2) {
                var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &u_tmp;
                var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &v_tmp;
                var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                _ = &r_tmp;
                var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                _ = &g_tmp;
                var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                _ = &b_tmp;
                var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                _ = &y_tmp;
                @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr1))).* = @bitCast(@as(c_short, @truncate((((@as(c_int, @as(Uint16, clampU8(y_tmp + r_tmp))) << @intCast(@as(c_int, 8))) & @as(c_int, 63488)) | ((@as(c_int, @as(Uint16, clampU8(y_tmp + g_tmp))) << @intCast(@as(c_int, 3))) & @as(c_int, 2016))) | (@as(c_int, @as(Uint16, clampU8(y_tmp + b_tmp))) >> @intCast(@as(c_int, 3))))));
                rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                y_tmp = (@as(c_int, y_ptr1[@as(c_int, 1)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr1))).* = @bitCast(@as(c_short, @truncate((((@as(c_int, @as(Uint16, clampU8(y_tmp + r_tmp))) << @intCast(@as(c_int, 8))) & @as(c_int, 63488)) | ((@as(c_int, @as(Uint16, clampU8(y_tmp + g_tmp))) << @intCast(@as(c_int, 3))) & @as(c_int, 2016))) | (@as(c_int, @as(Uint16, clampU8(y_tmp + b_tmp))) >> @intCast(@as(c_int, 3))))));
                rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 1)))));
                u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 1), @as(c_int, 2))))));
                v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 1), @as(c_int, 2))))));
            }
        }
        if (x == (width -% @as(u32, 1))) {
            var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
            _ = &u_tmp;
            var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
            _ = &v_tmp;
            var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
            _ = &r_tmp;
            var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
            _ = &g_tmp;
            var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
            _ = &b_tmp;
            var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
            _ = &y_tmp;
            @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr1))).* = @bitCast(@as(c_short, @truncate((((@as(c_int, @as(Uint16, clampU8(y_tmp + r_tmp))) << @intCast(@as(c_int, 8))) & @as(c_int, 63488)) | ((@as(c_int, @as(Uint16, clampU8(y_tmp + g_tmp))) << @intCast(@as(c_int, 3))) & @as(c_int, 2016))) | (@as(c_int, @as(Uint16, clampU8(y_tmp + b_tmp))) >> @intCast(@as(c_int, 3))))));
            rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
        }
    }
}
pub export fn yuv420_rgb24_std(width: u32, height: u32, Y: [*c]const u8, U: [*c]const u8, V_1: [*c]const u8, arg_Y_stride: u32, arg_UV_stride: u32, RGB: [*c]u8, RGB_stride: u32, yuv_type: YCbCrType) void {
    @setEvalBranchQuota(100000);
    var Y_stride = arg_Y_stride;
    _ = &Y_stride;
    var UV_stride = arg_UV_stride;
    _ = &UV_stride;
    const param: [*c]const YUV2RGBParam = &YUV2RGB[yuv_type];
    _ = &param;
    {
        const ref = &Y_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u8));
    }
    {
        const ref = &UV_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u8));
    }
    var x: u32 = undefined;
    _ = &x;
    var y: u32 = undefined;
    _ = &y;
    {
        y = 0;
        while (y < (height -% @as(u32, @bitCast(@as(c_int, @as(c_int, 2) - @as(c_int, 1)))))) : (y +%= 2) {
            var y_ptr1: [*c]const u8 = Y + (y *% Y_stride);
            _ = &y_ptr1;
            var u_ptr: [*c]const u8 = U + ((y / @as(u32, 2)) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((y / @as(u32, 2)) *% UV_stride);
            _ = &v_ptr;
            var y_ptr2: [*c]const u8 = Y + ((y +% @as(u32, 1)) *% Y_stride);
            _ = &y_ptr2;
            var rgb_ptr1: [*c]u8 = RGB + (y *% RGB_stride);
            _ = &rgb_ptr1;
            var rgb_ptr2: [*c]u8 = RGB + ((y +% @as(u32, 1)) *% RGB_stride);
            _ = &rgb_ptr2;
            {
                x = 0;
                while (x < (width -% @as(u32, @bitCast(@as(c_int, @as(c_int, 2) - @as(c_int, 1)))))) : (x +%= 2) {
                    var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &u_tmp;
                    var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &v_tmp;
                    var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                    _ = &r_tmp;
                    var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                    _ = &g_tmp;
                    var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                    _ = &b_tmp;
                    var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    _ = &y_tmp;
                    rgb_ptr1[@as(c_int, 0)] = clampU8(y_tmp + r_tmp);
                    rgb_ptr1[@as(c_int, 1)] = clampU8(y_tmp + g_tmp);
                    rgb_ptr1[@as(c_int, 2)] = clampU8(y_tmp + b_tmp);
                    rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                    y_tmp = (@as(c_int, y_ptr1[@as(c_int, 1)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    rgb_ptr1[@as(c_int, 0)] = clampU8(y_tmp + r_tmp);
                    rgb_ptr1[@as(c_int, 1)] = clampU8(y_tmp + g_tmp);
                    rgb_ptr1[@as(c_int, 2)] = clampU8(y_tmp + b_tmp);
                    rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                    y_tmp = (@as(c_int, y_ptr2[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    rgb_ptr2[@as(c_int, 0)] = clampU8(y_tmp + r_tmp);
                    rgb_ptr2[@as(c_int, 1)] = clampU8(y_tmp + g_tmp);
                    rgb_ptr2[@as(c_int, 2)] = clampU8(y_tmp + b_tmp);
                    rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                    y_tmp = (@as(c_int, y_ptr2[@as(c_int, 1)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    rgb_ptr2[@as(c_int, 0)] = clampU8(y_tmp + r_tmp);
                    rgb_ptr2[@as(c_int, 1)] = clampU8(y_tmp + g_tmp);
                    rgb_ptr2[@as(c_int, 2)] = clampU8(y_tmp + b_tmp);
                    rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                    y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 1)))));
                    y_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 1)))));
                    u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 1), @as(c_int, 2))))));
                    v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 1), @as(c_int, 2))))));
                }
            }
            if (x == (width -% @as(u32, 1))) {
                var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &u_tmp;
                var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &v_tmp;
                var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                _ = &r_tmp;
                var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                _ = &g_tmp;
                var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                _ = &b_tmp;
                var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                _ = &y_tmp;
                rgb_ptr1[@as(c_int, 0)] = clampU8(y_tmp + r_tmp);
                rgb_ptr1[@as(c_int, 1)] = clampU8(y_tmp + g_tmp);
                rgb_ptr1[@as(c_int, 2)] = clampU8(y_tmp + b_tmp);
                rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                y_tmp = (@as(c_int, y_ptr2[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                rgb_ptr2[@as(c_int, 0)] = clampU8(y_tmp + r_tmp);
                rgb_ptr2[@as(c_int, 1)] = clampU8(y_tmp + g_tmp);
                rgb_ptr2[@as(c_int, 2)] = clampU8(y_tmp + b_tmp);
                rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
            }
        }
    }
    if (y == (height -% @as(u32, 1))) {
        var y_ptr1: [*c]const u8 = Y + (y *% Y_stride);
        _ = &y_ptr1;
        var u_ptr: [*c]const u8 = U + ((y / @as(u32, 2)) *% UV_stride);
        _ = &u_ptr;
        var v_ptr: [*c]const u8 = V_1 + ((y / @as(u32, 2)) *% UV_stride);
        _ = &v_ptr;
        var rgb_ptr1: [*c]u8 = RGB + (y *% RGB_stride);
        _ = &rgb_ptr1;
        {
            x = 0;
            while (x < (width -% @as(u32, @bitCast(@as(c_int, @as(c_int, 2) - @as(c_int, 1)))))) : (x +%= 2) {
                var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &u_tmp;
                var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &v_tmp;
                var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                _ = &r_tmp;
                var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                _ = &g_tmp;
                var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                _ = &b_tmp;
                var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                _ = &y_tmp;
                rgb_ptr1[@as(c_int, 0)] = clampU8(y_tmp + r_tmp);
                rgb_ptr1[@as(c_int, 1)] = clampU8(y_tmp + g_tmp);
                rgb_ptr1[@as(c_int, 2)] = clampU8(y_tmp + b_tmp);
                rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                y_tmp = (@as(c_int, y_ptr1[@as(c_int, 1)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                rgb_ptr1[@as(c_int, 0)] = clampU8(y_tmp + r_tmp);
                rgb_ptr1[@as(c_int, 1)] = clampU8(y_tmp + g_tmp);
                rgb_ptr1[@as(c_int, 2)] = clampU8(y_tmp + b_tmp);
                rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 1)))));
                u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 1), @as(c_int, 2))))));
                v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 1), @as(c_int, 2))))));
            }
        }
        if (x == (width -% @as(u32, 1))) {
            var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
            _ = &u_tmp;
            var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
            _ = &v_tmp;
            var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
            _ = &r_tmp;
            var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
            _ = &g_tmp;
            var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
            _ = &b_tmp;
            var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
            _ = &y_tmp;
            rgb_ptr1[@as(c_int, 0)] = clampU8(y_tmp + r_tmp);
            rgb_ptr1[@as(c_int, 1)] = clampU8(y_tmp + g_tmp);
            rgb_ptr1[@as(c_int, 2)] = clampU8(y_tmp + b_tmp);
            rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
        }
    }
}
pub export fn yuv420_rgba_std(width: u32, height: u32, Y: [*c]const u8, U: [*c]const u8, V_1: [*c]const u8, arg_Y_stride: u32, arg_UV_stride: u32, RGB: [*c]u8, RGB_stride: u32, yuv_type: YCbCrType) void {
    @setEvalBranchQuota(100000);
    var Y_stride = arg_Y_stride;
    _ = &Y_stride;
    var UV_stride = arg_UV_stride;
    _ = &UV_stride;
    const param: [*c]const YUV2RGBParam = &YUV2RGB[yuv_type];
    _ = &param;
    {
        const ref = &Y_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u8));
    }
    {
        const ref = &UV_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u8));
    }
    var x: u32 = undefined;
    _ = &x;
    var y: u32 = undefined;
    _ = &y;
    {
        y = 0;
        while (y < (height -% @as(u32, @bitCast(@as(c_int, @as(c_int, 2) - @as(c_int, 1)))))) : (y +%= 2) {
            var y_ptr1: [*c]const u8 = Y + (y *% Y_stride);
            _ = &y_ptr1;
            var u_ptr: [*c]const u8 = U + ((y / @as(u32, 2)) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((y / @as(u32, 2)) *% UV_stride);
            _ = &v_ptr;
            var y_ptr2: [*c]const u8 = Y + ((y +% @as(u32, 1)) *% Y_stride);
            _ = &y_ptr2;
            var rgb_ptr1: [*c]u8 = RGB + (y *% RGB_stride);
            _ = &rgb_ptr1;
            var rgb_ptr2: [*c]u8 = RGB + ((y +% @as(u32, 1)) *% RGB_stride);
            _ = &rgb_ptr2;
            {
                x = 0;
                while (x < (width -% @as(u32, @bitCast(@as(c_int, @as(c_int, 2) - @as(c_int, 1)))))) : (x +%= 2) {
                    var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &u_tmp;
                    var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &v_tmp;
                    var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                    _ = &r_tmp;
                    var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                    _ = &g_tmp;
                    var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                    _ = &b_tmp;
                    var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    _ = &y_tmp;
                    @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = (((@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 24))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 8)))) | @as(Uint32, 255);
                    rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    y_tmp = (@as(c_int, y_ptr1[@as(c_int, 1)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = (((@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 24))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 8)))) | @as(Uint32, 255);
                    rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    y_tmp = (@as(c_int, y_ptr2[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr2))).* = (((@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 24))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 8)))) | @as(Uint32, 255);
                    rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    y_tmp = (@as(c_int, y_ptr2[@as(c_int, 1)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr2))).* = (((@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 24))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 8)))) | @as(Uint32, 255);
                    rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 1)))));
                    y_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 1)))));
                    u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 1), @as(c_int, 2))))));
                    v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 1), @as(c_int, 2))))));
                }
            }
            if (x == (width -% @as(u32, 1))) {
                var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &u_tmp;
                var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &v_tmp;
                var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                _ = &r_tmp;
                var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                _ = &g_tmp;
                var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                _ = &b_tmp;
                var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                _ = &y_tmp;
                @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = (((@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 24))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 8)))) | @as(Uint32, 255);
                rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                y_tmp = (@as(c_int, y_ptr2[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr2))).* = (((@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 24))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 8)))) | @as(Uint32, 255);
                rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            }
        }
    }
    if (y == (height -% @as(u32, 1))) {
        var y_ptr1: [*c]const u8 = Y + (y *% Y_stride);
        _ = &y_ptr1;
        var u_ptr: [*c]const u8 = U + ((y / @as(u32, 2)) *% UV_stride);
        _ = &u_ptr;
        var v_ptr: [*c]const u8 = V_1 + ((y / @as(u32, 2)) *% UV_stride);
        _ = &v_ptr;
        var rgb_ptr1: [*c]u8 = RGB + (y *% RGB_stride);
        _ = &rgb_ptr1;
        {
            x = 0;
            while (x < (width -% @as(u32, @bitCast(@as(c_int, @as(c_int, 2) - @as(c_int, 1)))))) : (x +%= 2) {
                var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &u_tmp;
                var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &v_tmp;
                var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                _ = &r_tmp;
                var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                _ = &g_tmp;
                var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                _ = &b_tmp;
                var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                _ = &y_tmp;
                @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = (((@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 24))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 8)))) | @as(Uint32, 255);
                rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                y_tmp = (@as(c_int, y_ptr1[@as(c_int, 1)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = (((@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 24))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 8)))) | @as(Uint32, 255);
                rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 1)))));
                u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 1), @as(c_int, 2))))));
                v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 1), @as(c_int, 2))))));
            }
        }
        if (x == (width -% @as(u32, 1))) {
            var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
            _ = &u_tmp;
            var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
            _ = &v_tmp;
            var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
            _ = &r_tmp;
            var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
            _ = &g_tmp;
            var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
            _ = &b_tmp;
            var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
            _ = &y_tmp;
            @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = (((@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 24))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 8)))) | @as(Uint32, 255);
            rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
        }
    }
}
pub export fn yuv420_bgra_std(width: u32, height: u32, Y: [*c]const u8, U: [*c]const u8, V_1: [*c]const u8, arg_Y_stride: u32, arg_UV_stride: u32, RGB: [*c]u8, RGB_stride: u32, yuv_type: YCbCrType) void {
    @setEvalBranchQuota(100000);
    var Y_stride = arg_Y_stride;
    _ = &Y_stride;
    var UV_stride = arg_UV_stride;
    _ = &UV_stride;
    const param: [*c]const YUV2RGBParam = &YUV2RGB[yuv_type];
    _ = &param;
    {
        const ref = &Y_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u8));
    }
    {
        const ref = &UV_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u8));
    }
    var x: u32 = undefined;
    _ = &x;
    var y: u32 = undefined;
    _ = &y;
    {
        y = 0;
        while (y < (height -% @as(u32, @bitCast(@as(c_int, @as(c_int, 2) - @as(c_int, 1)))))) : (y +%= 2) {
            var y_ptr1: [*c]const u8 = Y + (y *% Y_stride);
            _ = &y_ptr1;
            var u_ptr: [*c]const u8 = U + ((y / @as(u32, 2)) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((y / @as(u32, 2)) *% UV_stride);
            _ = &v_ptr;
            var y_ptr2: [*c]const u8 = Y + ((y +% @as(u32, 1)) *% Y_stride);
            _ = &y_ptr2;
            var rgb_ptr1: [*c]u8 = RGB + (y *% RGB_stride);
            _ = &rgb_ptr1;
            var rgb_ptr2: [*c]u8 = RGB + ((y +% @as(u32, 1)) *% RGB_stride);
            _ = &rgb_ptr2;
            {
                x = 0;
                while (x < (width -% @as(u32, @bitCast(@as(c_int, @as(c_int, 2) - @as(c_int, 1)))))) : (x +%= 2) {
                    var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &u_tmp;
                    var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &v_tmp;
                    var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                    _ = &r_tmp;
                    var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                    _ = &g_tmp;
                    var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                    _ = &b_tmp;
                    var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    _ = &y_tmp;
                    @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = (((@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 24))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 8)))) | @as(Uint32, 255);
                    rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    y_tmp = (@as(c_int, y_ptr1[@as(c_int, 1)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = (((@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 24))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 8)))) | @as(Uint32, 255);
                    rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    y_tmp = (@as(c_int, y_ptr2[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr2))).* = (((@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 24))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 8)))) | @as(Uint32, 255);
                    rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    y_tmp = (@as(c_int, y_ptr2[@as(c_int, 1)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr2))).* = (((@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 24))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 8)))) | @as(Uint32, 255);
                    rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 1)))));
                    y_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 1)))));
                    u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 1), @as(c_int, 2))))));
                    v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 1), @as(c_int, 2))))));
                }
            }
            if (x == (width -% @as(u32, 1))) {
                var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &u_tmp;
                var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &v_tmp;
                var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                _ = &r_tmp;
                var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                _ = &g_tmp;
                var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                _ = &b_tmp;
                var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                _ = &y_tmp;
                @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = (((@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 24))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 8)))) | @as(Uint32, 255);
                rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                y_tmp = (@as(c_int, y_ptr2[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr2))).* = (((@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 24))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 8)))) | @as(Uint32, 255);
                rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            }
        }
    }
    if (y == (height -% @as(u32, 1))) {
        var y_ptr1: [*c]const u8 = Y + (y *% Y_stride);
        _ = &y_ptr1;
        var u_ptr: [*c]const u8 = U + ((y / @as(u32, 2)) *% UV_stride);
        _ = &u_ptr;
        var v_ptr: [*c]const u8 = V_1 + ((y / @as(u32, 2)) *% UV_stride);
        _ = &v_ptr;
        var rgb_ptr1: [*c]u8 = RGB + (y *% RGB_stride);
        _ = &rgb_ptr1;
        {
            x = 0;
            while (x < (width -% @as(u32, @bitCast(@as(c_int, @as(c_int, 2) - @as(c_int, 1)))))) : (x +%= 2) {
                var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &u_tmp;
                var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &v_tmp;
                var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                _ = &r_tmp;
                var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                _ = &g_tmp;
                var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                _ = &b_tmp;
                var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                _ = &y_tmp;
                @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = (((@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 24))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 8)))) | @as(Uint32, 255);
                rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                y_tmp = (@as(c_int, y_ptr1[@as(c_int, 1)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = (((@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 24))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 8)))) | @as(Uint32, 255);
                rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 1)))));
                u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 1), @as(c_int, 2))))));
                v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 1), @as(c_int, 2))))));
            }
        }
        if (x == (width -% @as(u32, 1))) {
            var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
            _ = &u_tmp;
            var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
            _ = &v_tmp;
            var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
            _ = &r_tmp;
            var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
            _ = &g_tmp;
            var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
            _ = &b_tmp;
            var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
            _ = &y_tmp;
            @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = (((@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 24))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 8)))) | @as(Uint32, 255);
            rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
        }
    }
}
pub export fn yuv420_argb_std(width: u32, height: u32, Y: [*c]const u8, U: [*c]const u8, V_1: [*c]const u8, arg_Y_stride: u32, arg_UV_stride: u32, RGB: [*c]u8, RGB_stride: u32, yuv_type: YCbCrType) void {
    @setEvalBranchQuota(100000);
    var Y_stride = arg_Y_stride;
    _ = &Y_stride;
    var UV_stride = arg_UV_stride;
    _ = &UV_stride;
    const param: [*c]const YUV2RGBParam = &YUV2RGB[yuv_type];
    _ = &param;
    {
        const ref = &Y_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u8));
    }
    {
        const ref = &UV_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u8));
    }
    var x: u32 = undefined;
    _ = &x;
    var y: u32 = undefined;
    _ = &y;
    {
        y = 0;
        while (y < (height -% @as(u32, @bitCast(@as(c_int, @as(c_int, 2) - @as(c_int, 1)))))) : (y +%= 2) {
            var y_ptr1: [*c]const u8 = Y + (y *% Y_stride);
            _ = &y_ptr1;
            var u_ptr: [*c]const u8 = U + ((y / @as(u32, 2)) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((y / @as(u32, 2)) *% UV_stride);
            _ = &v_ptr;
            var y_ptr2: [*c]const u8 = Y + ((y +% @as(u32, 1)) *% Y_stride);
            _ = &y_ptr2;
            var rgb_ptr1: [*c]u8 = RGB + (y *% RGB_stride);
            _ = &rgb_ptr1;
            var rgb_ptr2: [*c]u8 = RGB + ((y +% @as(u32, 1)) *% RGB_stride);
            _ = &rgb_ptr2;
            {
                x = 0;
                while (x < (width -% @as(u32, @bitCast(@as(c_int, @as(c_int, 2) - @as(c_int, 1)))))) : (x +%= 2) {
                    var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &u_tmp;
                    var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &v_tmp;
                    var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                    _ = &r_tmp;
                    var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                    _ = &g_tmp;
                    var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                    _ = &b_tmp;
                    var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    _ = &y_tmp;
                    @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = ((@as(c_uint, 4278190080) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 0)));
                    rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    y_tmp = (@as(c_int, y_ptr1[@as(c_int, 1)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = ((@as(c_uint, 4278190080) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 0)));
                    rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    y_tmp = (@as(c_int, y_ptr2[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr2))).* = ((@as(c_uint, 4278190080) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 0)));
                    rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    y_tmp = (@as(c_int, y_ptr2[@as(c_int, 1)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr2))).* = ((@as(c_uint, 4278190080) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 0)));
                    rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 1)))));
                    y_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 1)))));
                    u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 1), @as(c_int, 2))))));
                    v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 1), @as(c_int, 2))))));
                }
            }
            if (x == (width -% @as(u32, 1))) {
                var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &u_tmp;
                var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &v_tmp;
                var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                _ = &r_tmp;
                var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                _ = &g_tmp;
                var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                _ = &b_tmp;
                var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                _ = &y_tmp;
                @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = ((@as(c_uint, 4278190080) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 0)));
                rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                y_tmp = (@as(c_int, y_ptr2[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr2))).* = ((@as(c_uint, 4278190080) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 0)));
                rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            }
        }
    }
    if (y == (height -% @as(u32, 1))) {
        var y_ptr1: [*c]const u8 = Y + (y *% Y_stride);
        _ = &y_ptr1;
        var u_ptr: [*c]const u8 = U + ((y / @as(u32, 2)) *% UV_stride);
        _ = &u_ptr;
        var v_ptr: [*c]const u8 = V_1 + ((y / @as(u32, 2)) *% UV_stride);
        _ = &v_ptr;
        var rgb_ptr1: [*c]u8 = RGB + (y *% RGB_stride);
        _ = &rgb_ptr1;
        {
            x = 0;
            while (x < (width -% @as(u32, @bitCast(@as(c_int, @as(c_int, 2) - @as(c_int, 1)))))) : (x +%= 2) {
                var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &u_tmp;
                var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &v_tmp;
                var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                _ = &r_tmp;
                var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                _ = &g_tmp;
                var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                _ = &b_tmp;
                var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                _ = &y_tmp;
                @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = ((@as(c_uint, 4278190080) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 0)));
                rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                y_tmp = (@as(c_int, y_ptr1[@as(c_int, 1)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = ((@as(c_uint, 4278190080) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 0)));
                rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 1)))));
                u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 1), @as(c_int, 2))))));
                v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 1), @as(c_int, 2))))));
            }
        }
        if (x == (width -% @as(u32, 1))) {
            var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
            _ = &u_tmp;
            var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
            _ = &v_tmp;
            var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
            _ = &r_tmp;
            var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
            _ = &g_tmp;
            var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
            _ = &b_tmp;
            var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
            _ = &y_tmp;
            @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = ((@as(c_uint, 4278190080) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 0)));
            rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
        }
    }
}
pub export fn yuv420_abgr_std(width: u32, height: u32, Y: [*c]const u8, U: [*c]const u8, V_1: [*c]const u8, arg_Y_stride: u32, arg_UV_stride: u32, RGB: [*c]u8, RGB_stride: u32, yuv_type: YCbCrType) void {
    @setEvalBranchQuota(100000);
    var Y_stride = arg_Y_stride;
    _ = &Y_stride;
    var UV_stride = arg_UV_stride;
    _ = &UV_stride;
    const param: [*c]const YUV2RGBParam = &YUV2RGB[yuv_type];
    _ = &param;
    {
        const ref = &Y_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u8));
    }
    {
        const ref = &UV_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u8));
    }
    var x: u32 = undefined;
    _ = &x;
    var y: u32 = undefined;
    _ = &y;
    {
        y = 0;
        while (y < (height -% @as(u32, @bitCast(@as(c_int, @as(c_int, 2) - @as(c_int, 1)))))) : (y +%= 2) {
            var y_ptr1: [*c]const u8 = Y + (y *% Y_stride);
            _ = &y_ptr1;
            var u_ptr: [*c]const u8 = U + ((y / @as(u32, 2)) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((y / @as(u32, 2)) *% UV_stride);
            _ = &v_ptr;
            var y_ptr2: [*c]const u8 = Y + ((y +% @as(u32, 1)) *% Y_stride);
            _ = &y_ptr2;
            var rgb_ptr1: [*c]u8 = RGB + (y *% RGB_stride);
            _ = &rgb_ptr1;
            var rgb_ptr2: [*c]u8 = RGB + ((y +% @as(u32, 1)) *% RGB_stride);
            _ = &rgb_ptr2;
            {
                x = 0;
                while (x < (width -% @as(u32, @bitCast(@as(c_int, @as(c_int, 2) - @as(c_int, 1)))))) : (x +%= 2) {
                    var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &u_tmp;
                    var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &v_tmp;
                    var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                    _ = &r_tmp;
                    var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                    _ = &g_tmp;
                    var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                    _ = &b_tmp;
                    var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    _ = &y_tmp;
                    @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = ((@as(c_uint, 4278190080) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 0)));
                    rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    y_tmp = (@as(c_int, y_ptr1[@as(c_int, 1)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = ((@as(c_uint, 4278190080) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 0)));
                    rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    y_tmp = (@as(c_int, y_ptr2[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr2))).* = ((@as(c_uint, 4278190080) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 0)));
                    rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    y_tmp = (@as(c_int, y_ptr2[@as(c_int, 1)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr2))).* = ((@as(c_uint, 4278190080) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 0)));
                    rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 1)))));
                    y_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 1)))));
                    u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 1), @as(c_int, 2))))));
                    v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 1), @as(c_int, 2))))));
                }
            }
            if (x == (width -% @as(u32, 1))) {
                var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &u_tmp;
                var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &v_tmp;
                var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                _ = &r_tmp;
                var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                _ = &g_tmp;
                var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                _ = &b_tmp;
                var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                _ = &y_tmp;
                @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = ((@as(c_uint, 4278190080) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 0)));
                rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                y_tmp = (@as(c_int, y_ptr2[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr2))).* = ((@as(c_uint, 4278190080) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 0)));
                rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            }
        }
    }
    if (y == (height -% @as(u32, 1))) {
        var y_ptr1: [*c]const u8 = Y + (y *% Y_stride);
        _ = &y_ptr1;
        var u_ptr: [*c]const u8 = U + ((y / @as(u32, 2)) *% UV_stride);
        _ = &u_ptr;
        var v_ptr: [*c]const u8 = V_1 + ((y / @as(u32, 2)) *% UV_stride);
        _ = &v_ptr;
        var rgb_ptr1: [*c]u8 = RGB + (y *% RGB_stride);
        _ = &rgb_ptr1;
        {
            x = 0;
            while (x < (width -% @as(u32, @bitCast(@as(c_int, @as(c_int, 2) - @as(c_int, 1)))))) : (x +%= 2) {
                var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &u_tmp;
                var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &v_tmp;
                var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                _ = &r_tmp;
                var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                _ = &g_tmp;
                var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                _ = &b_tmp;
                var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                _ = &y_tmp;
                @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = ((@as(c_uint, 4278190080) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 0)));
                rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                y_tmp = (@as(c_int, y_ptr1[@as(c_int, 1)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = ((@as(c_uint, 4278190080) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 0)));
                rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 1)))));
                u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 1), @as(c_int, 2))))));
                v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 1), @as(c_int, 2))))));
            }
        }
        if (x == (width -% @as(u32, 1))) {
            var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
            _ = &u_tmp;
            var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
            _ = &v_tmp;
            var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
            _ = &r_tmp;
            var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
            _ = &g_tmp;
            var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
            _ = &b_tmp;
            var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
            _ = &y_tmp;
            @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = ((@as(c_uint, 4278190080) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 0)));
            rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
        }
    }
}
pub export fn yuv422_rgb565_std(width: u32, height: u32, Y: [*c]const u8, U: [*c]const u8, V_1: [*c]const u8, arg_Y_stride: u32, arg_UV_stride: u32, RGB: [*c]u8, RGB_stride: u32, yuv_type: YCbCrType) void {
    @setEvalBranchQuota(100000);
    var Y_stride = arg_Y_stride;
    _ = &Y_stride;
    var UV_stride = arg_UV_stride;
    _ = &UV_stride;
    const param: [*c]const YUV2RGBParam = &YUV2RGB[yuv_type];
    _ = &param;
    {
        const ref = &Y_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u8));
    }
    {
        const ref = &UV_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u8));
    }
    var x: u32 = undefined;
    _ = &x;
    var y: u32 = undefined;
    _ = &y;
    {
        y = 0;
        while (y < (height -% @as(u32, @bitCast(@as(c_int, @as(c_int, 1) - @as(c_int, 1)))))) : (y +%= 1) {
            var y_ptr1: [*c]const u8 = Y + (y *% Y_stride);
            _ = &y_ptr1;
            var u_ptr: [*c]const u8 = U + ((y / @as(u32, 1)) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((y / @as(u32, 1)) *% UV_stride);
            _ = &v_ptr;
            var rgb_ptr1: [*c]u8 = RGB + (y *% RGB_stride);
            _ = &rgb_ptr1;
            {
                x = 0;
                while (x < (width -% @as(u32, @bitCast(@as(c_int, @as(c_int, 2) - @as(c_int, 1)))))) : (x +%= 2) {
                    var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &u_tmp;
                    var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &v_tmp;
                    var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                    _ = &r_tmp;
                    var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                    _ = &g_tmp;
                    var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                    _ = &b_tmp;
                    var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    _ = &y_tmp;
                    @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr1))).* = @bitCast(@as(c_short, @truncate((((@as(c_int, @as(Uint16, clampU8(y_tmp + r_tmp))) << @intCast(@as(c_int, 8))) & @as(c_int, 63488)) | ((@as(c_int, @as(Uint16, clampU8(y_tmp + g_tmp))) << @intCast(@as(c_int, 3))) & @as(c_int, 2016))) | (@as(c_int, @as(Uint16, clampU8(y_tmp + b_tmp))) >> @intCast(@as(c_int, 3))))));
                    rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                    y_tmp = (@as(c_int, y_ptr1[@as(c_int, 2)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr1))).* = @bitCast(@as(c_short, @truncate((((@as(c_int, @as(Uint16, clampU8(y_tmp + r_tmp))) << @intCast(@as(c_int, 8))) & @as(c_int, 63488)) | ((@as(c_int, @as(Uint16, clampU8(y_tmp + g_tmp))) << @intCast(@as(c_int, 3))) & @as(c_int, 2016))) | (@as(c_int, @as(Uint16, clampU8(y_tmp + b_tmp))) >> @intCast(@as(c_int, 3))))));
                    rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                    y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 2)))));
                    u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 4), @as(c_int, 2))))));
                    v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 4), @as(c_int, 2))))));
                }
            }
            if (x == (width -% @as(u32, 1))) {
                var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &u_tmp;
                var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &v_tmp;
                var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                _ = &r_tmp;
                var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                _ = &g_tmp;
                var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                _ = &b_tmp;
                var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                _ = &y_tmp;
                @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr1))).* = @bitCast(@as(c_short, @truncate((((@as(c_int, @as(Uint16, clampU8(y_tmp + r_tmp))) << @intCast(@as(c_int, 8))) & @as(c_int, 63488)) | ((@as(c_int, @as(Uint16, clampU8(y_tmp + g_tmp))) << @intCast(@as(c_int, 3))) & @as(c_int, 2016))) | (@as(c_int, @as(Uint16, clampU8(y_tmp + b_tmp))) >> @intCast(@as(c_int, 3))))));
                rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
            }
        }
    }
}
pub export fn yuv422_rgb24_std(width: u32, height: u32, Y: [*c]const u8, U: [*c]const u8, V_1: [*c]const u8, arg_Y_stride: u32, arg_UV_stride: u32, RGB: [*c]u8, RGB_stride: u32, yuv_type: YCbCrType) void {
    @setEvalBranchQuota(100000);
    var Y_stride = arg_Y_stride;
    _ = &Y_stride;
    var UV_stride = arg_UV_stride;
    _ = &UV_stride;
    const param: [*c]const YUV2RGBParam = &YUV2RGB[yuv_type];
    _ = &param;
    {
        const ref = &Y_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u8));
    }
    {
        const ref = &UV_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u8));
    }
    var x: u32 = undefined;
    _ = &x;
    var y: u32 = undefined;
    _ = &y;
    {
        y = 0;
        while (y < (height -% @as(u32, @bitCast(@as(c_int, @as(c_int, 1) - @as(c_int, 1)))))) : (y +%= 1) {
            var y_ptr1: [*c]const u8 = Y + (y *% Y_stride);
            _ = &y_ptr1;
            var u_ptr: [*c]const u8 = U + ((y / @as(u32, 1)) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((y / @as(u32, 1)) *% UV_stride);
            _ = &v_ptr;
            var rgb_ptr1: [*c]u8 = RGB + (y *% RGB_stride);
            _ = &rgb_ptr1;
            {
                x = 0;
                while (x < (width -% @as(u32, @bitCast(@as(c_int, @as(c_int, 2) - @as(c_int, 1)))))) : (x +%= 2) {
                    var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &u_tmp;
                    var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &v_tmp;
                    var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                    _ = &r_tmp;
                    var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                    _ = &g_tmp;
                    var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                    _ = &b_tmp;
                    var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    _ = &y_tmp;
                    rgb_ptr1[@as(c_int, 0)] = clampU8(y_tmp + r_tmp);
                    rgb_ptr1[@as(c_int, 1)] = clampU8(y_tmp + g_tmp);
                    rgb_ptr1[@as(c_int, 2)] = clampU8(y_tmp + b_tmp);
                    rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                    y_tmp = (@as(c_int, y_ptr1[@as(c_int, 2)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    rgb_ptr1[@as(c_int, 0)] = clampU8(y_tmp + r_tmp);
                    rgb_ptr1[@as(c_int, 1)] = clampU8(y_tmp + g_tmp);
                    rgb_ptr1[@as(c_int, 2)] = clampU8(y_tmp + b_tmp);
                    rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                    y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 2)))));
                    u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 4), @as(c_int, 2))))));
                    v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 4), @as(c_int, 2))))));
                }
            }
            if (x == (width -% @as(u32, 1))) {
                var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &u_tmp;
                var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &v_tmp;
                var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                _ = &r_tmp;
                var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                _ = &g_tmp;
                var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                _ = &b_tmp;
                var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                _ = &y_tmp;
                rgb_ptr1[@as(c_int, 0)] = clampU8(y_tmp + r_tmp);
                rgb_ptr1[@as(c_int, 1)] = clampU8(y_tmp + g_tmp);
                rgb_ptr1[@as(c_int, 2)] = clampU8(y_tmp + b_tmp);
                rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
            }
        }
    }
}
pub export fn yuv422_rgba_std(width: u32, height: u32, Y: [*c]const u8, U: [*c]const u8, V_1: [*c]const u8, arg_Y_stride: u32, arg_UV_stride: u32, RGB: [*c]u8, RGB_stride: u32, yuv_type: YCbCrType) void {
    @setEvalBranchQuota(100000);
    var Y_stride = arg_Y_stride;
    _ = &Y_stride;
    var UV_stride = arg_UV_stride;
    _ = &UV_stride;
    const param: [*c]const YUV2RGBParam = &YUV2RGB[yuv_type];
    _ = &param;
    {
        const ref = &Y_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u8));
    }
    {
        const ref = &UV_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u8));
    }
    var x: u32 = undefined;
    _ = &x;
    var y: u32 = undefined;
    _ = &y;
    {
        y = 0;
        while (y < (height -% @as(u32, @bitCast(@as(c_int, @as(c_int, 1) - @as(c_int, 1)))))) : (y +%= 1) {
            var y_ptr1: [*c]const u8 = Y + (y *% Y_stride);
            _ = &y_ptr1;
            var u_ptr: [*c]const u8 = U + ((y / @as(u32, 1)) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((y / @as(u32, 1)) *% UV_stride);
            _ = &v_ptr;
            var rgb_ptr1: [*c]u8 = RGB + (y *% RGB_stride);
            _ = &rgb_ptr1;
            {
                x = 0;
                while (x < (width -% @as(u32, @bitCast(@as(c_int, @as(c_int, 2) - @as(c_int, 1)))))) : (x +%= 2) {
                    var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &u_tmp;
                    var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &v_tmp;
                    var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                    _ = &r_tmp;
                    var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                    _ = &g_tmp;
                    var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                    _ = &b_tmp;
                    var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    _ = &y_tmp;
                    @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = (((@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 24))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 8)))) | @as(Uint32, 255);
                    rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    y_tmp = (@as(c_int, y_ptr1[@as(c_int, 2)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = (((@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 24))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 8)))) | @as(Uint32, 255);
                    rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 2)))));
                    u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 4), @as(c_int, 2))))));
                    v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 4), @as(c_int, 2))))));
                }
            }
            if (x == (width -% @as(u32, 1))) {
                var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &u_tmp;
                var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &v_tmp;
                var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                _ = &r_tmp;
                var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                _ = &g_tmp;
                var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                _ = &b_tmp;
                var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                _ = &y_tmp;
                @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = (((@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 24))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 8)))) | @as(Uint32, 255);
                rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            }
        }
    }
}
pub export fn yuv422_bgra_std(width: u32, height: u32, Y: [*c]const u8, U: [*c]const u8, V_1: [*c]const u8, arg_Y_stride: u32, arg_UV_stride: u32, RGB: [*c]u8, RGB_stride: u32, yuv_type: YCbCrType) void {
    @setEvalBranchQuota(100000);
    var Y_stride = arg_Y_stride;
    _ = &Y_stride;
    var UV_stride = arg_UV_stride;
    _ = &UV_stride;
    const param: [*c]const YUV2RGBParam = &YUV2RGB[yuv_type];
    _ = &param;
    {
        const ref = &Y_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u8));
    }
    {
        const ref = &UV_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u8));
    }
    var x: u32 = undefined;
    _ = &x;
    var y: u32 = undefined;
    _ = &y;
    {
        y = 0;
        while (y < (height -% @as(u32, @bitCast(@as(c_int, @as(c_int, 1) - @as(c_int, 1)))))) : (y +%= 1) {
            var y_ptr1: [*c]const u8 = Y + (y *% Y_stride);
            _ = &y_ptr1;
            var u_ptr: [*c]const u8 = U + ((y / @as(u32, 1)) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((y / @as(u32, 1)) *% UV_stride);
            _ = &v_ptr;
            var rgb_ptr1: [*c]u8 = RGB + (y *% RGB_stride);
            _ = &rgb_ptr1;
            {
                x = 0;
                while (x < (width -% @as(u32, @bitCast(@as(c_int, @as(c_int, 2) - @as(c_int, 1)))))) : (x +%= 2) {
                    var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &u_tmp;
                    var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &v_tmp;
                    var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                    _ = &r_tmp;
                    var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                    _ = &g_tmp;
                    var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                    _ = &b_tmp;
                    var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    _ = &y_tmp;
                    @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = (((@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 24))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 8)))) | @as(Uint32, 255);
                    rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    y_tmp = (@as(c_int, y_ptr1[@as(c_int, 2)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = (((@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 24))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 8)))) | @as(Uint32, 255);
                    rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 2)))));
                    u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 4), @as(c_int, 2))))));
                    v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 4), @as(c_int, 2))))));
                }
            }
            if (x == (width -% @as(u32, 1))) {
                var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &u_tmp;
                var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &v_tmp;
                var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                _ = &r_tmp;
                var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                _ = &g_tmp;
                var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                _ = &b_tmp;
                var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                _ = &y_tmp;
                @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = (((@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 24))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 8)))) | @as(Uint32, 255);
                rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            }
        }
    }
}
pub export fn yuv422_argb_std(width: u32, height: u32, Y: [*c]const u8, U: [*c]const u8, V_1: [*c]const u8, arg_Y_stride: u32, arg_UV_stride: u32, RGB: [*c]u8, RGB_stride: u32, yuv_type: YCbCrType) void {
    @setEvalBranchQuota(100000);
    var Y_stride = arg_Y_stride;
    _ = &Y_stride;
    var UV_stride = arg_UV_stride;
    _ = &UV_stride;
    const param: [*c]const YUV2RGBParam = &YUV2RGB[yuv_type];
    _ = &param;
    {
        const ref = &Y_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u8));
    }
    {
        const ref = &UV_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u8));
    }
    var x: u32 = undefined;
    _ = &x;
    var y: u32 = undefined;
    _ = &y;
    {
        y = 0;
        while (y < (height -% @as(u32, @bitCast(@as(c_int, @as(c_int, 1) - @as(c_int, 1)))))) : (y +%= 1) {
            var y_ptr1: [*c]const u8 = Y + (y *% Y_stride);
            _ = &y_ptr1;
            var u_ptr: [*c]const u8 = U + ((y / @as(u32, 1)) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((y / @as(u32, 1)) *% UV_stride);
            _ = &v_ptr;
            var rgb_ptr1: [*c]u8 = RGB + (y *% RGB_stride);
            _ = &rgb_ptr1;
            {
                x = 0;
                while (x < (width -% @as(u32, @bitCast(@as(c_int, @as(c_int, 2) - @as(c_int, 1)))))) : (x +%= 2) {
                    var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &u_tmp;
                    var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &v_tmp;
                    var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                    _ = &r_tmp;
                    var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                    _ = &g_tmp;
                    var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                    _ = &b_tmp;
                    var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    _ = &y_tmp;
                    @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = ((@as(c_uint, 4278190080) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 0)));
                    rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    y_tmp = (@as(c_int, y_ptr1[@as(c_int, 2)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = ((@as(c_uint, 4278190080) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 0)));
                    rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 2)))));
                    u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 4), @as(c_int, 2))))));
                    v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 4), @as(c_int, 2))))));
                }
            }
            if (x == (width -% @as(u32, 1))) {
                var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &u_tmp;
                var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &v_tmp;
                var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                _ = &r_tmp;
                var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                _ = &g_tmp;
                var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                _ = &b_tmp;
                var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                _ = &y_tmp;
                @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = ((@as(c_uint, 4278190080) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 0)));
                rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            }
        }
    }
}
pub export fn yuv422_abgr_std(width: u32, height: u32, Y: [*c]const u8, U: [*c]const u8, V_1: [*c]const u8, arg_Y_stride: u32, arg_UV_stride: u32, RGB: [*c]u8, RGB_stride: u32, yuv_type: YCbCrType) void {
    @setEvalBranchQuota(100000);
    var Y_stride = arg_Y_stride;
    _ = &Y_stride;
    var UV_stride = arg_UV_stride;
    _ = &UV_stride;
    const param: [*c]const YUV2RGBParam = &YUV2RGB[yuv_type];
    _ = &param;
    {
        const ref = &Y_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u8));
    }
    {
        const ref = &UV_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u8));
    }
    var x: u32 = undefined;
    _ = &x;
    var y: u32 = undefined;
    _ = &y;
    {
        y = 0;
        while (y < (height -% @as(u32, @bitCast(@as(c_int, @as(c_int, 1) - @as(c_int, 1)))))) : (y +%= 1) {
            var y_ptr1: [*c]const u8 = Y + (y *% Y_stride);
            _ = &y_ptr1;
            var u_ptr: [*c]const u8 = U + ((y / @as(u32, 1)) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((y / @as(u32, 1)) *% UV_stride);
            _ = &v_ptr;
            var rgb_ptr1: [*c]u8 = RGB + (y *% RGB_stride);
            _ = &rgb_ptr1;
            {
                x = 0;
                while (x < (width -% @as(u32, @bitCast(@as(c_int, @as(c_int, 2) - @as(c_int, 1)))))) : (x +%= 2) {
                    var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &u_tmp;
                    var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &v_tmp;
                    var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                    _ = &r_tmp;
                    var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                    _ = &g_tmp;
                    var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                    _ = &b_tmp;
                    var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    _ = &y_tmp;
                    @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = ((@as(c_uint, 4278190080) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 0)));
                    rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    y_tmp = (@as(c_int, y_ptr1[@as(c_int, 2)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = ((@as(c_uint, 4278190080) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 0)));
                    rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 2)))));
                    u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 4), @as(c_int, 2))))));
                    v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 4), @as(c_int, 2))))));
                }
            }
            if (x == (width -% @as(u32, 1))) {
                var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &u_tmp;
                var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &v_tmp;
                var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                _ = &r_tmp;
                var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                _ = &g_tmp;
                var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                _ = &b_tmp;
                var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                _ = &y_tmp;
                @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = ((@as(c_uint, 4278190080) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 0)));
                rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            }
        }
    }
}
pub export fn yuv444_rgba_std(width: u32, height: u32, Y: [*c]const u8, U: [*c]const u8, V_1: [*c]const u8, arg_Y_stride: u32, arg_UV_stride: u32, RGB: [*c]u8, RGB_stride: u32, yuv_type: YCbCrType) void {
    @setEvalBranchQuota(100000);
    var Y_stride = arg_Y_stride;
    _ = &Y_stride;
    var UV_stride = arg_UV_stride;
    _ = &UV_stride;
    const param: [*c]const YUV2RGBParam = &YUV2RGB[yuv_type];
    _ = &param;
    {
        const ref = &Y_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u8));
    }
    {
        const ref = &UV_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u8));
    }
    var x: u32 = undefined;
    _ = &x;
    var y: u32 = undefined;
    _ = &y;
    {
        y = 0;
        while (y < (height -% @as(u32, @bitCast(@as(c_int, @as(c_int, 1) - @as(c_int, 1)))))) : (y +%= 1) {
            var y_ptr1: [*c]const u8 = Y + (y *% Y_stride);
            _ = &y_ptr1;
            var u_ptr: [*c]const u8 = U + ((y / @as(u32, 1)) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((y / @as(u32, 1)) *% UV_stride);
            _ = &v_ptr;
            var rgb_ptr1: [*c]u8 = RGB + (y *% RGB_stride);
            _ = &rgb_ptr1;
            {
                x = 0;
                while (x < (width -% @as(u32, @bitCast(@as(c_int, @as(c_int, 1) - @as(c_int, 1)))))) : (x +%= 1) {
                    var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &u_tmp;
                    var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &v_tmp;
                    var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                    _ = &r_tmp;
                    var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                    _ = &g_tmp;
                    var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                    _ = &b_tmp;
                    var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    _ = &y_tmp;
                    @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = (((@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 24))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 8)))) | @as(Uint32, 255);
                    rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
                    u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 1), @as(c_int, 1))))));
                    v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 1), @as(c_int, 1))))));
                }
            }
        }
    }
}
pub export fn yuv444_bgra_std(width: u32, height: u32, Y: [*c]const u8, U: [*c]const u8, V_1: [*c]const u8, arg_Y_stride: u32, arg_UV_stride: u32, RGB: [*c]u8, RGB_stride: u32, yuv_type: YCbCrType) void {
    @setEvalBranchQuota(100000);
    var Y_stride = arg_Y_stride;
    _ = &Y_stride;
    var UV_stride = arg_UV_stride;
    _ = &UV_stride;
    const param: [*c]const YUV2RGBParam = &YUV2RGB[yuv_type];
    _ = &param;
    {
        const ref = &Y_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u8));
    }
    {
        const ref = &UV_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u8));
    }
    var x: u32 = undefined;
    _ = &x;
    var y: u32 = undefined;
    _ = &y;
    {
        y = 0;
        while (y < (height -% @as(u32, @bitCast(@as(c_int, @as(c_int, 1) - @as(c_int, 1)))))) : (y +%= 1) {
            var y_ptr1: [*c]const u8 = Y + (y *% Y_stride);
            _ = &y_ptr1;
            var u_ptr: [*c]const u8 = U + ((y / @as(u32, 1)) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((y / @as(u32, 1)) *% UV_stride);
            _ = &v_ptr;
            var rgb_ptr1: [*c]u8 = RGB + (y *% RGB_stride);
            _ = &rgb_ptr1;
            {
                x = 0;
                while (x < (width -% @as(u32, @bitCast(@as(c_int, @as(c_int, 1) - @as(c_int, 1)))))) : (x +%= 1) {
                    var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &u_tmp;
                    var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &v_tmp;
                    var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                    _ = &r_tmp;
                    var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                    _ = &g_tmp;
                    var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                    _ = &b_tmp;
                    var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    _ = &y_tmp;
                    @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = (((@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 24))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 8)))) | @as(Uint32, 255);
                    rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
                    u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 1), @as(c_int, 1))))));
                    v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 1), @as(c_int, 1))))));
                }
            }
        }
    }
}
pub export fn yuv444_argb_std(width: u32, height: u32, Y: [*c]const u8, U: [*c]const u8, V_1: [*c]const u8, arg_Y_stride: u32, arg_UV_stride: u32, RGB: [*c]u8, RGB_stride: u32, yuv_type: YCbCrType) void {
    @setEvalBranchQuota(100000);
    var Y_stride = arg_Y_stride;
    _ = &Y_stride;
    var UV_stride = arg_UV_stride;
    _ = &UV_stride;
    const param: [*c]const YUV2RGBParam = &YUV2RGB[yuv_type];
    _ = &param;
    {
        const ref = &Y_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u8));
    }
    {
        const ref = &UV_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u8));
    }
    var x: u32 = undefined;
    _ = &x;
    var y: u32 = undefined;
    _ = &y;
    {
        y = 0;
        while (y < (height -% @as(u32, @bitCast(@as(c_int, @as(c_int, 1) - @as(c_int, 1)))))) : (y +%= 1) {
            var y_ptr1: [*c]const u8 = Y + (y *% Y_stride);
            _ = &y_ptr1;
            var u_ptr: [*c]const u8 = U + ((y / @as(u32, 1)) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((y / @as(u32, 1)) *% UV_stride);
            _ = &v_ptr;
            var rgb_ptr1: [*c]u8 = RGB + (y *% RGB_stride);
            _ = &rgb_ptr1;
            {
                x = 0;
                while (x < (width -% @as(u32, @bitCast(@as(c_int, @as(c_int, 1) - @as(c_int, 1)))))) : (x +%= 1) {
                    var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &u_tmp;
                    var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &v_tmp;
                    var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                    _ = &r_tmp;
                    var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                    _ = &g_tmp;
                    var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                    _ = &b_tmp;
                    var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    _ = &y_tmp;
                    @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = ((@as(c_uint, 4278190080) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 0)));
                    rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
                    u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 1), @as(c_int, 1))))));
                    v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 1), @as(c_int, 1))))));
                }
            }
        }
    }
}
pub export fn yuv444_abgr_std(width: u32, height: u32, Y: [*c]const u8, U: [*c]const u8, V_1: [*c]const u8, arg_Y_stride: u32, arg_UV_stride: u32, RGB: [*c]u8, RGB_stride: u32, yuv_type: YCbCrType) void {
    @setEvalBranchQuota(100000);
    var Y_stride = arg_Y_stride;
    _ = &Y_stride;
    var UV_stride = arg_UV_stride;
    _ = &UV_stride;
    const param: [*c]const YUV2RGBParam = &YUV2RGB[yuv_type];
    _ = &param;
    {
        const ref = &Y_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u8));
    }
    {
        const ref = &UV_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u8));
    }
    var x: u32 = undefined;
    _ = &x;
    var y: u32 = undefined;
    _ = &y;
    {
        y = 0;
        while (y < (height -% @as(u32, @bitCast(@as(c_int, @as(c_int, 1) - @as(c_int, 1)))))) : (y +%= 1) {
            var y_ptr1: [*c]const u8 = Y + (y *% Y_stride);
            _ = &y_ptr1;
            var u_ptr: [*c]const u8 = U + ((y / @as(u32, 1)) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((y / @as(u32, 1)) *% UV_stride);
            _ = &v_ptr;
            var rgb_ptr1: [*c]u8 = RGB + (y *% RGB_stride);
            _ = &rgb_ptr1;
            {
                x = 0;
                while (x < (width -% @as(u32, @bitCast(@as(c_int, @as(c_int, 1) - @as(c_int, 1)))))) : (x +%= 1) {
                    var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &u_tmp;
                    var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &v_tmp;
                    var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                    _ = &r_tmp;
                    var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                    _ = &g_tmp;
                    var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                    _ = &b_tmp;
                    var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    _ = &y_tmp;
                    @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = ((@as(c_uint, 4278190080) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 0)));
                    rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
                    u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 1), @as(c_int, 1))))));
                    v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 1), @as(c_int, 1))))));
                }
            }
        }
    }
}
pub export fn yuvnv12_rgb565_std(width: u32, height: u32, Y: [*c]const u8, U: [*c]const u8, V_1: [*c]const u8, arg_Y_stride: u32, arg_UV_stride: u32, RGB: [*c]u8, RGB_stride: u32, yuv_type: YCbCrType) void {
    @setEvalBranchQuota(100000);
    var Y_stride = arg_Y_stride;
    _ = &Y_stride;
    var UV_stride = arg_UV_stride;
    _ = &UV_stride;
    const param: [*c]const YUV2RGBParam = &YUV2RGB[yuv_type];
    _ = &param;
    {
        const ref = &Y_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u8));
    }
    {
        const ref = &UV_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u8));
    }
    var x: u32 = undefined;
    _ = &x;
    var y: u32 = undefined;
    _ = &y;
    {
        y = 0;
        while (y < (height -% @as(u32, @bitCast(@as(c_int, @as(c_int, 2) - @as(c_int, 1)))))) : (y +%= 2) {
            var y_ptr1: [*c]const u8 = Y + (y *% Y_stride);
            _ = &y_ptr1;
            var u_ptr: [*c]const u8 = U + ((y / @as(u32, 2)) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((y / @as(u32, 2)) *% UV_stride);
            _ = &v_ptr;
            var y_ptr2: [*c]const u8 = Y + ((y +% @as(u32, 1)) *% Y_stride);
            _ = &y_ptr2;
            var rgb_ptr1: [*c]u8 = RGB + (y *% RGB_stride);
            _ = &rgb_ptr1;
            var rgb_ptr2: [*c]u8 = RGB + ((y +% @as(u32, 1)) *% RGB_stride);
            _ = &rgb_ptr2;
            {
                x = 0;
                while (x < (width -% @as(u32, @bitCast(@as(c_int, @as(c_int, 2) - @as(c_int, 1)))))) : (x +%= 2) {
                    var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &u_tmp;
                    var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &v_tmp;
                    var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                    _ = &r_tmp;
                    var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                    _ = &g_tmp;
                    var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                    _ = &b_tmp;
                    var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    _ = &y_tmp;
                    @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr1))).* = @bitCast(@as(c_short, @truncate((((@as(c_int, @as(Uint16, clampU8(y_tmp + r_tmp))) << @intCast(@as(c_int, 8))) & @as(c_int, 63488)) | ((@as(c_int, @as(Uint16, clampU8(y_tmp + g_tmp))) << @intCast(@as(c_int, 3))) & @as(c_int, 2016))) | (@as(c_int, @as(Uint16, clampU8(y_tmp + b_tmp))) >> @intCast(@as(c_int, 3))))));
                    rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                    y_tmp = (@as(c_int, y_ptr1[@as(c_int, 1)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr1))).* = @bitCast(@as(c_short, @truncate((((@as(c_int, @as(Uint16, clampU8(y_tmp + r_tmp))) << @intCast(@as(c_int, 8))) & @as(c_int, 63488)) | ((@as(c_int, @as(Uint16, clampU8(y_tmp + g_tmp))) << @intCast(@as(c_int, 3))) & @as(c_int, 2016))) | (@as(c_int, @as(Uint16, clampU8(y_tmp + b_tmp))) >> @intCast(@as(c_int, 3))))));
                    rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                    y_tmp = (@as(c_int, y_ptr2[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr2))).* = @bitCast(@as(c_short, @truncate((((@as(c_int, @as(Uint16, clampU8(y_tmp + r_tmp))) << @intCast(@as(c_int, 8))) & @as(c_int, 63488)) | ((@as(c_int, @as(Uint16, clampU8(y_tmp + g_tmp))) << @intCast(@as(c_int, 3))) & @as(c_int, 2016))) | (@as(c_int, @as(Uint16, clampU8(y_tmp + b_tmp))) >> @intCast(@as(c_int, 3))))));
                    rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                    y_tmp = (@as(c_int, y_ptr2[@as(c_int, 1)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr2))).* = @bitCast(@as(c_short, @truncate((((@as(c_int, @as(Uint16, clampU8(y_tmp + r_tmp))) << @intCast(@as(c_int, 8))) & @as(c_int, 63488)) | ((@as(c_int, @as(Uint16, clampU8(y_tmp + g_tmp))) << @intCast(@as(c_int, 3))) & @as(c_int, 2016))) | (@as(c_int, @as(Uint16, clampU8(y_tmp + b_tmp))) >> @intCast(@as(c_int, 3))))));
                    rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                    y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 1)))));
                    y_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 1)))));
                    u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 2), @as(c_int, 2))))));
                    v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 2), @as(c_int, 2))))));
                }
            }
            if (x == (width -% @as(u32, 1))) {
                var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &u_tmp;
                var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &v_tmp;
                var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                _ = &r_tmp;
                var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                _ = &g_tmp;
                var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                _ = &b_tmp;
                var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                _ = &y_tmp;
                @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr1))).* = @bitCast(@as(c_short, @truncate((((@as(c_int, @as(Uint16, clampU8(y_tmp + r_tmp))) << @intCast(@as(c_int, 8))) & @as(c_int, 63488)) | ((@as(c_int, @as(Uint16, clampU8(y_tmp + g_tmp))) << @intCast(@as(c_int, 3))) & @as(c_int, 2016))) | (@as(c_int, @as(Uint16, clampU8(y_tmp + b_tmp))) >> @intCast(@as(c_int, 3))))));
                rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                y_tmp = (@as(c_int, y_ptr2[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr2))).* = @bitCast(@as(c_short, @truncate((((@as(c_int, @as(Uint16, clampU8(y_tmp + r_tmp))) << @intCast(@as(c_int, 8))) & @as(c_int, 63488)) | ((@as(c_int, @as(Uint16, clampU8(y_tmp + g_tmp))) << @intCast(@as(c_int, 3))) & @as(c_int, 2016))) | (@as(c_int, @as(Uint16, clampU8(y_tmp + b_tmp))) >> @intCast(@as(c_int, 3))))));
                rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
            }
        }
    }
    if (y == (height -% @as(u32, 1))) {
        var y_ptr1: [*c]const u8 = Y + (y *% Y_stride);
        _ = &y_ptr1;
        var u_ptr: [*c]const u8 = U + ((y / @as(u32, 2)) *% UV_stride);
        _ = &u_ptr;
        var v_ptr: [*c]const u8 = V_1 + ((y / @as(u32, 2)) *% UV_stride);
        _ = &v_ptr;
        var rgb_ptr1: [*c]u8 = RGB + (y *% RGB_stride);
        _ = &rgb_ptr1;
        {
            x = 0;
            while (x < (width -% @as(u32, @bitCast(@as(c_int, @as(c_int, 2) - @as(c_int, 1)))))) : (x +%= 2) {
                var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &u_tmp;
                var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &v_tmp;
                var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                _ = &r_tmp;
                var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                _ = &g_tmp;
                var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                _ = &b_tmp;
                var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                _ = &y_tmp;
                @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr1))).* = @bitCast(@as(c_short, @truncate((((@as(c_int, @as(Uint16, clampU8(y_tmp + r_tmp))) << @intCast(@as(c_int, 8))) & @as(c_int, 63488)) | ((@as(c_int, @as(Uint16, clampU8(y_tmp + g_tmp))) << @intCast(@as(c_int, 3))) & @as(c_int, 2016))) | (@as(c_int, @as(Uint16, clampU8(y_tmp + b_tmp))) >> @intCast(@as(c_int, 3))))));
                rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                y_tmp = (@as(c_int, y_ptr1[@as(c_int, 1)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr1))).* = @bitCast(@as(c_short, @truncate((((@as(c_int, @as(Uint16, clampU8(y_tmp + r_tmp))) << @intCast(@as(c_int, 8))) & @as(c_int, 63488)) | ((@as(c_int, @as(Uint16, clampU8(y_tmp + g_tmp))) << @intCast(@as(c_int, 3))) & @as(c_int, 2016))) | (@as(c_int, @as(Uint16, clampU8(y_tmp + b_tmp))) >> @intCast(@as(c_int, 3))))));
                rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 1)))));
                u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 2), @as(c_int, 2))))));
                v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 2), @as(c_int, 2))))));
            }
        }
        if (x == (width -% @as(u32, 1))) {
            var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
            _ = &u_tmp;
            var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
            _ = &v_tmp;
            var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
            _ = &r_tmp;
            var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
            _ = &g_tmp;
            var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
            _ = &b_tmp;
            var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
            _ = &y_tmp;
            @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr1))).* = @bitCast(@as(c_short, @truncate((((@as(c_int, @as(Uint16, clampU8(y_tmp + r_tmp))) << @intCast(@as(c_int, 8))) & @as(c_int, 63488)) | ((@as(c_int, @as(Uint16, clampU8(y_tmp + g_tmp))) << @intCast(@as(c_int, 3))) & @as(c_int, 2016))) | (@as(c_int, @as(Uint16, clampU8(y_tmp + b_tmp))) >> @intCast(@as(c_int, 3))))));
            rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
        }
    }
}
pub export fn yuvnv12_rgb24_std(width: u32, height: u32, Y: [*c]const u8, U: [*c]const u8, V_1: [*c]const u8, arg_Y_stride: u32, arg_UV_stride: u32, RGB: [*c]u8, RGB_stride: u32, yuv_type: YCbCrType) void {
    @setEvalBranchQuota(100000);
    var Y_stride = arg_Y_stride;
    _ = &Y_stride;
    var UV_stride = arg_UV_stride;
    _ = &UV_stride;
    const param: [*c]const YUV2RGBParam = &YUV2RGB[yuv_type];
    _ = &param;
    {
        const ref = &Y_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u8));
    }
    {
        const ref = &UV_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u8));
    }
    var x: u32 = undefined;
    _ = &x;
    var y: u32 = undefined;
    _ = &y;
    {
        y = 0;
        while (y < (height -% @as(u32, @bitCast(@as(c_int, @as(c_int, 2) - @as(c_int, 1)))))) : (y +%= 2) {
            var y_ptr1: [*c]const u8 = Y + (y *% Y_stride);
            _ = &y_ptr1;
            var u_ptr: [*c]const u8 = U + ((y / @as(u32, 2)) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((y / @as(u32, 2)) *% UV_stride);
            _ = &v_ptr;
            var y_ptr2: [*c]const u8 = Y + ((y +% @as(u32, 1)) *% Y_stride);
            _ = &y_ptr2;
            var rgb_ptr1: [*c]u8 = RGB + (y *% RGB_stride);
            _ = &rgb_ptr1;
            var rgb_ptr2: [*c]u8 = RGB + ((y +% @as(u32, 1)) *% RGB_stride);
            _ = &rgb_ptr2;
            {
                x = 0;
                while (x < (width -% @as(u32, @bitCast(@as(c_int, @as(c_int, 2) - @as(c_int, 1)))))) : (x +%= 2) {
                    var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &u_tmp;
                    var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &v_tmp;
                    var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                    _ = &r_tmp;
                    var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                    _ = &g_tmp;
                    var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                    _ = &b_tmp;
                    var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    _ = &y_tmp;
                    rgb_ptr1[@as(c_int, 0)] = clampU8(y_tmp + r_tmp);
                    rgb_ptr1[@as(c_int, 1)] = clampU8(y_tmp + g_tmp);
                    rgb_ptr1[@as(c_int, 2)] = clampU8(y_tmp + b_tmp);
                    rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                    y_tmp = (@as(c_int, y_ptr1[@as(c_int, 1)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    rgb_ptr1[@as(c_int, 0)] = clampU8(y_tmp + r_tmp);
                    rgb_ptr1[@as(c_int, 1)] = clampU8(y_tmp + g_tmp);
                    rgb_ptr1[@as(c_int, 2)] = clampU8(y_tmp + b_tmp);
                    rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                    y_tmp = (@as(c_int, y_ptr2[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    rgb_ptr2[@as(c_int, 0)] = clampU8(y_tmp + r_tmp);
                    rgb_ptr2[@as(c_int, 1)] = clampU8(y_tmp + g_tmp);
                    rgb_ptr2[@as(c_int, 2)] = clampU8(y_tmp + b_tmp);
                    rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                    y_tmp = (@as(c_int, y_ptr2[@as(c_int, 1)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    rgb_ptr2[@as(c_int, 0)] = clampU8(y_tmp + r_tmp);
                    rgb_ptr2[@as(c_int, 1)] = clampU8(y_tmp + g_tmp);
                    rgb_ptr2[@as(c_int, 2)] = clampU8(y_tmp + b_tmp);
                    rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                    y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 1)))));
                    y_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 1)))));
                    u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 2), @as(c_int, 2))))));
                    v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 2), @as(c_int, 2))))));
                }
            }
            if (x == (width -% @as(u32, 1))) {
                var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &u_tmp;
                var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &v_tmp;
                var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                _ = &r_tmp;
                var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                _ = &g_tmp;
                var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                _ = &b_tmp;
                var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                _ = &y_tmp;
                rgb_ptr1[@as(c_int, 0)] = clampU8(y_tmp + r_tmp);
                rgb_ptr1[@as(c_int, 1)] = clampU8(y_tmp + g_tmp);
                rgb_ptr1[@as(c_int, 2)] = clampU8(y_tmp + b_tmp);
                rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                y_tmp = (@as(c_int, y_ptr2[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                rgb_ptr2[@as(c_int, 0)] = clampU8(y_tmp + r_tmp);
                rgb_ptr2[@as(c_int, 1)] = clampU8(y_tmp + g_tmp);
                rgb_ptr2[@as(c_int, 2)] = clampU8(y_tmp + b_tmp);
                rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
            }
        }
    }
    if (y == (height -% @as(u32, 1))) {
        var y_ptr1: [*c]const u8 = Y + (y *% Y_stride);
        _ = &y_ptr1;
        var u_ptr: [*c]const u8 = U + ((y / @as(u32, 2)) *% UV_stride);
        _ = &u_ptr;
        var v_ptr: [*c]const u8 = V_1 + ((y / @as(u32, 2)) *% UV_stride);
        _ = &v_ptr;
        var rgb_ptr1: [*c]u8 = RGB + (y *% RGB_stride);
        _ = &rgb_ptr1;
        {
            x = 0;
            while (x < (width -% @as(u32, @bitCast(@as(c_int, @as(c_int, 2) - @as(c_int, 1)))))) : (x +%= 2) {
                var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &u_tmp;
                var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &v_tmp;
                var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                _ = &r_tmp;
                var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                _ = &g_tmp;
                var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                _ = &b_tmp;
                var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                _ = &y_tmp;
                rgb_ptr1[@as(c_int, 0)] = clampU8(y_tmp + r_tmp);
                rgb_ptr1[@as(c_int, 1)] = clampU8(y_tmp + g_tmp);
                rgb_ptr1[@as(c_int, 2)] = clampU8(y_tmp + b_tmp);
                rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                y_tmp = (@as(c_int, y_ptr1[@as(c_int, 1)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                rgb_ptr1[@as(c_int, 0)] = clampU8(y_tmp + r_tmp);
                rgb_ptr1[@as(c_int, 1)] = clampU8(y_tmp + g_tmp);
                rgb_ptr1[@as(c_int, 2)] = clampU8(y_tmp + b_tmp);
                rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 1)))));
                u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 2), @as(c_int, 2))))));
                v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 2), @as(c_int, 2))))));
            }
        }
        if (x == (width -% @as(u32, 1))) {
            var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
            _ = &u_tmp;
            var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
            _ = &v_tmp;
            var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
            _ = &r_tmp;
            var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
            _ = &g_tmp;
            var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
            _ = &b_tmp;
            var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
            _ = &y_tmp;
            rgb_ptr1[@as(c_int, 0)] = clampU8(y_tmp + r_tmp);
            rgb_ptr1[@as(c_int, 1)] = clampU8(y_tmp + g_tmp);
            rgb_ptr1[@as(c_int, 2)] = clampU8(y_tmp + b_tmp);
            rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
        }
    }
}
pub export fn yuvnv12_rgba_std(width: u32, height: u32, Y: [*c]const u8, U: [*c]const u8, V_1: [*c]const u8, arg_Y_stride: u32, arg_UV_stride: u32, RGB: [*c]u8, RGB_stride: u32, yuv_type: YCbCrType) void {
    @setEvalBranchQuota(100000);
    var Y_stride = arg_Y_stride;
    _ = &Y_stride;
    var UV_stride = arg_UV_stride;
    _ = &UV_stride;
    const param: [*c]const YUV2RGBParam = &YUV2RGB[yuv_type];
    _ = &param;
    {
        const ref = &Y_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u8));
    }
    {
        const ref = &UV_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u8));
    }
    var x: u32 = undefined;
    _ = &x;
    var y: u32 = undefined;
    _ = &y;
    {
        y = 0;
        while (y < (height -% @as(u32, @bitCast(@as(c_int, @as(c_int, 2) - @as(c_int, 1)))))) : (y +%= 2) {
            var y_ptr1: [*c]const u8 = Y + (y *% Y_stride);
            _ = &y_ptr1;
            var u_ptr: [*c]const u8 = U + ((y / @as(u32, 2)) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((y / @as(u32, 2)) *% UV_stride);
            _ = &v_ptr;
            var y_ptr2: [*c]const u8 = Y + ((y +% @as(u32, 1)) *% Y_stride);
            _ = &y_ptr2;
            var rgb_ptr1: [*c]u8 = RGB + (y *% RGB_stride);
            _ = &rgb_ptr1;
            var rgb_ptr2: [*c]u8 = RGB + ((y +% @as(u32, 1)) *% RGB_stride);
            _ = &rgb_ptr2;
            {
                x = 0;
                while (x < (width -% @as(u32, @bitCast(@as(c_int, @as(c_int, 2) - @as(c_int, 1)))))) : (x +%= 2) {
                    var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &u_tmp;
                    var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &v_tmp;
                    var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                    _ = &r_tmp;
                    var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                    _ = &g_tmp;
                    var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                    _ = &b_tmp;
                    var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    _ = &y_tmp;
                    @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = (((@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 24))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 8)))) | @as(Uint32, 255);
                    rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    y_tmp = (@as(c_int, y_ptr1[@as(c_int, 1)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = (((@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 24))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 8)))) | @as(Uint32, 255);
                    rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    y_tmp = (@as(c_int, y_ptr2[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr2))).* = (((@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 24))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 8)))) | @as(Uint32, 255);
                    rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    y_tmp = (@as(c_int, y_ptr2[@as(c_int, 1)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr2))).* = (((@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 24))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 8)))) | @as(Uint32, 255);
                    rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 1)))));
                    y_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 1)))));
                    u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 2), @as(c_int, 2))))));
                    v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 2), @as(c_int, 2))))));
                }
            }
            if (x == (width -% @as(u32, 1))) {
                var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &u_tmp;
                var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &v_tmp;
                var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                _ = &r_tmp;
                var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                _ = &g_tmp;
                var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                _ = &b_tmp;
                var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                _ = &y_tmp;
                @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = (((@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 24))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 8)))) | @as(Uint32, 255);
                rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                y_tmp = (@as(c_int, y_ptr2[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr2))).* = (((@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 24))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 8)))) | @as(Uint32, 255);
                rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            }
        }
    }
    if (y == (height -% @as(u32, 1))) {
        var y_ptr1: [*c]const u8 = Y + (y *% Y_stride);
        _ = &y_ptr1;
        var u_ptr: [*c]const u8 = U + ((y / @as(u32, 2)) *% UV_stride);
        _ = &u_ptr;
        var v_ptr: [*c]const u8 = V_1 + ((y / @as(u32, 2)) *% UV_stride);
        _ = &v_ptr;
        var rgb_ptr1: [*c]u8 = RGB + (y *% RGB_stride);
        _ = &rgb_ptr1;
        {
            x = 0;
            while (x < (width -% @as(u32, @bitCast(@as(c_int, @as(c_int, 2) - @as(c_int, 1)))))) : (x +%= 2) {
                var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &u_tmp;
                var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &v_tmp;
                var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                _ = &r_tmp;
                var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                _ = &g_tmp;
                var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                _ = &b_tmp;
                var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                _ = &y_tmp;
                @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = (((@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 24))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 8)))) | @as(Uint32, 255);
                rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                y_tmp = (@as(c_int, y_ptr1[@as(c_int, 1)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = (((@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 24))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 8)))) | @as(Uint32, 255);
                rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 1)))));
                u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 2), @as(c_int, 2))))));
                v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 2), @as(c_int, 2))))));
            }
        }
        if (x == (width -% @as(u32, 1))) {
            var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
            _ = &u_tmp;
            var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
            _ = &v_tmp;
            var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
            _ = &r_tmp;
            var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
            _ = &g_tmp;
            var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
            _ = &b_tmp;
            var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
            _ = &y_tmp;
            @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = (((@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 24))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 8)))) | @as(Uint32, 255);
            rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
        }
    }
}
pub export fn yuvnv12_bgra_std(width: u32, height: u32, Y: [*c]const u8, U: [*c]const u8, V_1: [*c]const u8, arg_Y_stride: u32, arg_UV_stride: u32, RGB: [*c]u8, RGB_stride: u32, yuv_type: YCbCrType) void {
    @setEvalBranchQuota(100000);
    var Y_stride = arg_Y_stride;
    _ = &Y_stride;
    var UV_stride = arg_UV_stride;
    _ = &UV_stride;
    const param: [*c]const YUV2RGBParam = &YUV2RGB[yuv_type];
    _ = &param;
    {
        const ref = &Y_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u8));
    }
    {
        const ref = &UV_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u8));
    }
    var x: u32 = undefined;
    _ = &x;
    var y: u32 = undefined;
    _ = &y;
    {
        y = 0;
        while (y < (height -% @as(u32, @bitCast(@as(c_int, @as(c_int, 2) - @as(c_int, 1)))))) : (y +%= 2) {
            var y_ptr1: [*c]const u8 = Y + (y *% Y_stride);
            _ = &y_ptr1;
            var u_ptr: [*c]const u8 = U + ((y / @as(u32, 2)) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((y / @as(u32, 2)) *% UV_stride);
            _ = &v_ptr;
            var y_ptr2: [*c]const u8 = Y + ((y +% @as(u32, 1)) *% Y_stride);
            _ = &y_ptr2;
            var rgb_ptr1: [*c]u8 = RGB + (y *% RGB_stride);
            _ = &rgb_ptr1;
            var rgb_ptr2: [*c]u8 = RGB + ((y +% @as(u32, 1)) *% RGB_stride);
            _ = &rgb_ptr2;
            {
                x = 0;
                while (x < (width -% @as(u32, @bitCast(@as(c_int, @as(c_int, 2) - @as(c_int, 1)))))) : (x +%= 2) {
                    var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &u_tmp;
                    var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &v_tmp;
                    var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                    _ = &r_tmp;
                    var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                    _ = &g_tmp;
                    var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                    _ = &b_tmp;
                    var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    _ = &y_tmp;
                    @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = (((@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 24))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 8)))) | @as(Uint32, 255);
                    rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    y_tmp = (@as(c_int, y_ptr1[@as(c_int, 1)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = (((@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 24))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 8)))) | @as(Uint32, 255);
                    rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    y_tmp = (@as(c_int, y_ptr2[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr2))).* = (((@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 24))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 8)))) | @as(Uint32, 255);
                    rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    y_tmp = (@as(c_int, y_ptr2[@as(c_int, 1)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr2))).* = (((@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 24))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 8)))) | @as(Uint32, 255);
                    rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 1)))));
                    y_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 1)))));
                    u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 2), @as(c_int, 2))))));
                    v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 2), @as(c_int, 2))))));
                }
            }
            if (x == (width -% @as(u32, 1))) {
                var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &u_tmp;
                var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &v_tmp;
                var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                _ = &r_tmp;
                var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                _ = &g_tmp;
                var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                _ = &b_tmp;
                var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                _ = &y_tmp;
                @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = (((@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 24))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 8)))) | @as(Uint32, 255);
                rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                y_tmp = (@as(c_int, y_ptr2[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr2))).* = (((@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 24))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 8)))) | @as(Uint32, 255);
                rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            }
        }
    }
    if (y == (height -% @as(u32, 1))) {
        var y_ptr1: [*c]const u8 = Y + (y *% Y_stride);
        _ = &y_ptr1;
        var u_ptr: [*c]const u8 = U + ((y / @as(u32, 2)) *% UV_stride);
        _ = &u_ptr;
        var v_ptr: [*c]const u8 = V_1 + ((y / @as(u32, 2)) *% UV_stride);
        _ = &v_ptr;
        var rgb_ptr1: [*c]u8 = RGB + (y *% RGB_stride);
        _ = &rgb_ptr1;
        {
            x = 0;
            while (x < (width -% @as(u32, @bitCast(@as(c_int, @as(c_int, 2) - @as(c_int, 1)))))) : (x +%= 2) {
                var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &u_tmp;
                var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &v_tmp;
                var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                _ = &r_tmp;
                var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                _ = &g_tmp;
                var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                _ = &b_tmp;
                var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                _ = &y_tmp;
                @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = (((@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 24))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 8)))) | @as(Uint32, 255);
                rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                y_tmp = (@as(c_int, y_ptr1[@as(c_int, 1)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = (((@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 24))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 8)))) | @as(Uint32, 255);
                rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 1)))));
                u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 2), @as(c_int, 2))))));
                v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 2), @as(c_int, 2))))));
            }
        }
        if (x == (width -% @as(u32, 1))) {
            var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
            _ = &u_tmp;
            var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
            _ = &v_tmp;
            var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
            _ = &r_tmp;
            var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
            _ = &g_tmp;
            var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
            _ = &b_tmp;
            var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
            _ = &y_tmp;
            @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = (((@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 24))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 8)))) | @as(Uint32, 255);
            rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
        }
    }
}
pub export fn yuvnv12_argb_std(width: u32, height: u32, Y: [*c]const u8, U: [*c]const u8, V_1: [*c]const u8, arg_Y_stride: u32, arg_UV_stride: u32, RGB: [*c]u8, RGB_stride: u32, yuv_type: YCbCrType) void {
    @setEvalBranchQuota(100000);
    var Y_stride = arg_Y_stride;
    _ = &Y_stride;
    var UV_stride = arg_UV_stride;
    _ = &UV_stride;
    const param: [*c]const YUV2RGBParam = &YUV2RGB[yuv_type];
    _ = &param;
    {
        const ref = &Y_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u8));
    }
    {
        const ref = &UV_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u8));
    }
    var x: u32 = undefined;
    _ = &x;
    var y: u32 = undefined;
    _ = &y;
    {
        y = 0;
        while (y < (height -% @as(u32, @bitCast(@as(c_int, @as(c_int, 2) - @as(c_int, 1)))))) : (y +%= 2) {
            var y_ptr1: [*c]const u8 = Y + (y *% Y_stride);
            _ = &y_ptr1;
            var u_ptr: [*c]const u8 = U + ((y / @as(u32, 2)) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((y / @as(u32, 2)) *% UV_stride);
            _ = &v_ptr;
            var y_ptr2: [*c]const u8 = Y + ((y +% @as(u32, 1)) *% Y_stride);
            _ = &y_ptr2;
            var rgb_ptr1: [*c]u8 = RGB + (y *% RGB_stride);
            _ = &rgb_ptr1;
            var rgb_ptr2: [*c]u8 = RGB + ((y +% @as(u32, 1)) *% RGB_stride);
            _ = &rgb_ptr2;
            {
                x = 0;
                while (x < (width -% @as(u32, @bitCast(@as(c_int, @as(c_int, 2) - @as(c_int, 1)))))) : (x +%= 2) {
                    var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &u_tmp;
                    var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &v_tmp;
                    var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                    _ = &r_tmp;
                    var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                    _ = &g_tmp;
                    var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                    _ = &b_tmp;
                    var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    _ = &y_tmp;
                    @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = ((@as(c_uint, 4278190080) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 0)));
                    rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    y_tmp = (@as(c_int, y_ptr1[@as(c_int, 1)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = ((@as(c_uint, 4278190080) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 0)));
                    rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    y_tmp = (@as(c_int, y_ptr2[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr2))).* = ((@as(c_uint, 4278190080) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 0)));
                    rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    y_tmp = (@as(c_int, y_ptr2[@as(c_int, 1)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr2))).* = ((@as(c_uint, 4278190080) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 0)));
                    rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 1)))));
                    y_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 1)))));
                    u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 2), @as(c_int, 2))))));
                    v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 2), @as(c_int, 2))))));
                }
            }
            if (x == (width -% @as(u32, 1))) {
                var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &u_tmp;
                var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &v_tmp;
                var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                _ = &r_tmp;
                var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                _ = &g_tmp;
                var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                _ = &b_tmp;
                var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                _ = &y_tmp;
                @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = ((@as(c_uint, 4278190080) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 0)));
                rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                y_tmp = (@as(c_int, y_ptr2[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr2))).* = ((@as(c_uint, 4278190080) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 0)));
                rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            }
        }
    }
    if (y == (height -% @as(u32, 1))) {
        var y_ptr1: [*c]const u8 = Y + (y *% Y_stride);
        _ = &y_ptr1;
        var u_ptr: [*c]const u8 = U + ((y / @as(u32, 2)) *% UV_stride);
        _ = &u_ptr;
        var v_ptr: [*c]const u8 = V_1 + ((y / @as(u32, 2)) *% UV_stride);
        _ = &v_ptr;
        var rgb_ptr1: [*c]u8 = RGB + (y *% RGB_stride);
        _ = &rgb_ptr1;
        {
            x = 0;
            while (x < (width -% @as(u32, @bitCast(@as(c_int, @as(c_int, 2) - @as(c_int, 1)))))) : (x +%= 2) {
                var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &u_tmp;
                var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &v_tmp;
                var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                _ = &r_tmp;
                var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                _ = &g_tmp;
                var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                _ = &b_tmp;
                var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                _ = &y_tmp;
                @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = ((@as(c_uint, 4278190080) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 0)));
                rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                y_tmp = (@as(c_int, y_ptr1[@as(c_int, 1)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = ((@as(c_uint, 4278190080) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 0)));
                rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 1)))));
                u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 2), @as(c_int, 2))))));
                v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 2), @as(c_int, 2))))));
            }
        }
        if (x == (width -% @as(u32, 1))) {
            var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
            _ = &u_tmp;
            var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
            _ = &v_tmp;
            var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
            _ = &r_tmp;
            var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
            _ = &g_tmp;
            var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
            _ = &b_tmp;
            var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
            _ = &y_tmp;
            @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = ((@as(c_uint, 4278190080) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 0)));
            rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
        }
    }
}
pub export fn yuvnv12_abgr_std(width: u32, height: u32, Y: [*c]const u8, U: [*c]const u8, V_1: [*c]const u8, arg_Y_stride: u32, arg_UV_stride: u32, RGB: [*c]u8, RGB_stride: u32, yuv_type: YCbCrType) void {
    @setEvalBranchQuota(100000);
    var Y_stride = arg_Y_stride;
    _ = &Y_stride;
    var UV_stride = arg_UV_stride;
    _ = &UV_stride;
    const param: [*c]const YUV2RGBParam = &YUV2RGB[yuv_type];
    _ = &param;
    {
        const ref = &Y_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u8));
    }
    {
        const ref = &UV_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u8));
    }
    var x: u32 = undefined;
    _ = &x;
    var y: u32 = undefined;
    _ = &y;
    {
        y = 0;
        while (y < (height -% @as(u32, @bitCast(@as(c_int, @as(c_int, 2) - @as(c_int, 1)))))) : (y +%= 2) {
            var y_ptr1: [*c]const u8 = Y + (y *% Y_stride);
            _ = &y_ptr1;
            var u_ptr: [*c]const u8 = U + ((y / @as(u32, 2)) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((y / @as(u32, 2)) *% UV_stride);
            _ = &v_ptr;
            var y_ptr2: [*c]const u8 = Y + ((y +% @as(u32, 1)) *% Y_stride);
            _ = &y_ptr2;
            var rgb_ptr1: [*c]u8 = RGB + (y *% RGB_stride);
            _ = &rgb_ptr1;
            var rgb_ptr2: [*c]u8 = RGB + ((y +% @as(u32, 1)) *% RGB_stride);
            _ = &rgb_ptr2;
            {
                x = 0;
                while (x < (width -% @as(u32, @bitCast(@as(c_int, @as(c_int, 2) - @as(c_int, 1)))))) : (x +%= 2) {
                    var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &u_tmp;
                    var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &v_tmp;
                    var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                    _ = &r_tmp;
                    var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                    _ = &g_tmp;
                    var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                    _ = &b_tmp;
                    var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    _ = &y_tmp;
                    @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = ((@as(c_uint, 4278190080) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 0)));
                    rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    y_tmp = (@as(c_int, y_ptr1[@as(c_int, 1)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = ((@as(c_uint, 4278190080) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 0)));
                    rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    y_tmp = (@as(c_int, y_ptr2[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr2))).* = ((@as(c_uint, 4278190080) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 0)));
                    rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    y_tmp = (@as(c_int, y_ptr2[@as(c_int, 1)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr2))).* = ((@as(c_uint, 4278190080) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 0)));
                    rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 1)))));
                    y_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 1)))));
                    u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 2), @as(c_int, 2))))));
                    v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 2), @as(c_int, 2))))));
                }
            }
            if (x == (width -% @as(u32, 1))) {
                var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &u_tmp;
                var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &v_tmp;
                var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                _ = &r_tmp;
                var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                _ = &g_tmp;
                var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                _ = &b_tmp;
                var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                _ = &y_tmp;
                @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = ((@as(c_uint, 4278190080) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 0)));
                rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                y_tmp = (@as(c_int, y_ptr2[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr2))).* = ((@as(c_uint, 4278190080) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 0)));
                rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            }
        }
    }
    if (y == (height -% @as(u32, 1))) {
        var y_ptr1: [*c]const u8 = Y + (y *% Y_stride);
        _ = &y_ptr1;
        var u_ptr: [*c]const u8 = U + ((y / @as(u32, 2)) *% UV_stride);
        _ = &u_ptr;
        var v_ptr: [*c]const u8 = V_1 + ((y / @as(u32, 2)) *% UV_stride);
        _ = &v_ptr;
        var rgb_ptr1: [*c]u8 = RGB + (y *% RGB_stride);
        _ = &rgb_ptr1;
        {
            x = 0;
            while (x < (width -% @as(u32, @bitCast(@as(c_int, @as(c_int, 2) - @as(c_int, 1)))))) : (x +%= 2) {
                var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &u_tmp;
                var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &v_tmp;
                var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                _ = &r_tmp;
                var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                _ = &g_tmp;
                var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                _ = &b_tmp;
                var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                _ = &y_tmp;
                @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = ((@as(c_uint, 4278190080) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 0)));
                rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                y_tmp = (@as(c_int, y_ptr1[@as(c_int, 1)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = ((@as(c_uint, 4278190080) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 0)));
                rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 1)))));
                u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 2), @as(c_int, 2))))));
                v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 2), @as(c_int, 2))))));
            }
        }
        if (x == (width -% @as(u32, 1))) {
            var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
            _ = &u_tmp;
            var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
            _ = &v_tmp;
            var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
            _ = &r_tmp;
            var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
            _ = &g_tmp;
            var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
            _ = &b_tmp;
            var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
            _ = &y_tmp;
            @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = ((@as(c_uint, 4278190080) | (@as(Uint32, clampU8(y_tmp + b_tmp)) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, clampU8(y_tmp + g_tmp)) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, clampU8(y_tmp + r_tmp)) << @intCast(@as(Uint32, 0)));
            rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
        }
    }
}
pub export fn yuvp010_xbgr2101010_std(width: u32, height: u32, Y: [*c]const u16, U: [*c]const u16, V_1: [*c]const u16, arg_Y_stride: u32, arg_UV_stride: u32, RGB: [*c]u8, RGB_stride: u32, yuv_type: YCbCrType) void {
    @setEvalBranchQuota(100000);
    var Y_stride = arg_Y_stride;
    _ = &Y_stride;
    var UV_stride = arg_UV_stride;
    _ = &UV_stride;
    const param: [*c]const YUV2RGBParam = &YUV2RGB[yuv_type];
    _ = &param;
    {
        const ref = &Y_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u16));
    }
    {
        const ref = &UV_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u16));
    }
    var x: u32 = undefined;
    _ = &x;
    var y: u32 = undefined;
    _ = &y;
    {
        y = 0;
        while (y < (height -% @as(u32, @bitCast(@as(c_int, @as(c_int, 2) - @as(c_int, 1)))))) : (y +%= 2) {
            var y_ptr1: [*c]const u16 = Y + (y *% Y_stride);
            _ = &y_ptr1;
            var u_ptr: [*c]const u16 = U + ((y / @as(u32, 2)) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u16 = V_1 + ((y / @as(u32, 2)) *% UV_stride);
            _ = &v_ptr;
            var y_ptr2: [*c]const u16 = Y + ((y +% @as(u32, 1)) *% Y_stride);
            _ = &y_ptr2;
            var rgb_ptr1: [*c]u8 = RGB + (y *% RGB_stride);
            _ = &rgb_ptr1;
            var rgb_ptr2: [*c]u8 = RGB + ((y +% @as(u32, 1)) *% RGB_stride);
            _ = &rgb_ptr2;
            {
                x = 0;
                while (x < (width -% @as(u32, @bitCast(@as(c_int, @as(c_int, 2) - @as(c_int, 1)))))) : (x +%= 2) {
                    var u_tmp: i32 = (@as(c_int, u_ptr.*) >> @intCast(@as(c_int, 6))) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &u_tmp;
                    var v_tmp: i32 = (@as(c_int, v_ptr.*) >> @intCast(@as(c_int, 6))) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &v_tmp;
                    var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                    _ = &r_tmp;
                    var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                    _ = &g_tmp;
                    var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                    _ = &b_tmp;
                    var y_tmp: i32 = ((@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) >> @intCast(@as(c_int, 6))) * @as(c_int, param.*.y_factor);
                    _ = &y_tmp;
                    @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = ((@as(c_uint, 3221225472) | (@as(Uint32, clamp10(y_tmp + b_tmp)) << @intCast(@as(Uint32, 20)))) | (@as(Uint32, clamp10(y_tmp + g_tmp)) << @intCast(@as(Uint32, 10)))) | (@as(Uint32, clamp10(y_tmp + r_tmp)) << @intCast(@as(Uint32, 0)));
                    rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    y_tmp = ((@as(c_int, y_ptr1[@as(c_int, 1)]) - @as(c_int, param.*.y_shift)) >> @intCast(@as(c_int, 6))) * @as(c_int, param.*.y_factor);
                    @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = ((@as(c_uint, 3221225472) | (@as(Uint32, clamp10(y_tmp + b_tmp)) << @intCast(@as(Uint32, 20)))) | (@as(Uint32, clamp10(y_tmp + g_tmp)) << @intCast(@as(Uint32, 10)))) | (@as(Uint32, clamp10(y_tmp + r_tmp)) << @intCast(@as(Uint32, 0)));
                    rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    y_tmp = ((@as(c_int, y_ptr2[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) >> @intCast(@as(c_int, 6))) * @as(c_int, param.*.y_factor);
                    @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr2))).* = ((@as(c_uint, 3221225472) | (@as(Uint32, clamp10(y_tmp + b_tmp)) << @intCast(@as(Uint32, 20)))) | (@as(Uint32, clamp10(y_tmp + g_tmp)) << @intCast(@as(Uint32, 10)))) | (@as(Uint32, clamp10(y_tmp + r_tmp)) << @intCast(@as(Uint32, 0)));
                    rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    y_tmp = ((@as(c_int, y_ptr2[@as(c_int, 1)]) - @as(c_int, param.*.y_shift)) >> @intCast(@as(c_int, 6))) * @as(c_int, param.*.y_factor);
                    @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr2))).* = ((@as(c_uint, 3221225472) | (@as(Uint32, clamp10(y_tmp + b_tmp)) << @intCast(@as(Uint32, 20)))) | (@as(Uint32, clamp10(y_tmp + g_tmp)) << @intCast(@as(Uint32, 10)))) | (@as(Uint32, clamp10(y_tmp + r_tmp)) << @intCast(@as(Uint32, 0)));
                    rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 1)))));
                    y_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 1)))));
                    u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 2), @as(c_int, 2))))));
                    v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 2), @as(c_int, 2))))));
                }
            }
            if (x == (width -% @as(u32, 1))) {
                var u_tmp: i32 = (@as(c_int, u_ptr.*) >> @intCast(@as(c_int, 6))) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &u_tmp;
                var v_tmp: i32 = (@as(c_int, v_ptr.*) >> @intCast(@as(c_int, 6))) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &v_tmp;
                var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                _ = &r_tmp;
                var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                _ = &g_tmp;
                var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                _ = &b_tmp;
                var y_tmp: i32 = ((@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) >> @intCast(@as(c_int, 6))) * @as(c_int, param.*.y_factor);
                _ = &y_tmp;
                @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = ((@as(c_uint, 3221225472) | (@as(Uint32, clamp10(y_tmp + b_tmp)) << @intCast(@as(Uint32, 20)))) | (@as(Uint32, clamp10(y_tmp + g_tmp)) << @intCast(@as(Uint32, 10)))) | (@as(Uint32, clamp10(y_tmp + r_tmp)) << @intCast(@as(Uint32, 0)));
                rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                y_tmp = ((@as(c_int, y_ptr2[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) >> @intCast(@as(c_int, 6))) * @as(c_int, param.*.y_factor);
                @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr2))).* = ((@as(c_uint, 3221225472) | (@as(Uint32, clamp10(y_tmp + b_tmp)) << @intCast(@as(Uint32, 20)))) | (@as(Uint32, clamp10(y_tmp + g_tmp)) << @intCast(@as(Uint32, 10)))) | (@as(Uint32, clamp10(y_tmp + r_tmp)) << @intCast(@as(Uint32, 0)));
                rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            }
        }
    }
    if (y == (height -% @as(u32, 1))) {
        var y_ptr1: [*c]const u16 = Y + (y *% Y_stride);
        _ = &y_ptr1;
        var u_ptr: [*c]const u16 = U + ((y / @as(u32, 2)) *% UV_stride);
        _ = &u_ptr;
        var v_ptr: [*c]const u16 = V_1 + ((y / @as(u32, 2)) *% UV_stride);
        _ = &v_ptr;
        var rgb_ptr1: [*c]u8 = RGB + (y *% RGB_stride);
        _ = &rgb_ptr1;
        {
            x = 0;
            while (x < (width -% @as(u32, @bitCast(@as(c_int, @as(c_int, 2) - @as(c_int, 1)))))) : (x +%= 2) {
                var u_tmp: i32 = (@as(c_int, u_ptr.*) >> @intCast(@as(c_int, 6))) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &u_tmp;
                var v_tmp: i32 = (@as(c_int, v_ptr.*) >> @intCast(@as(c_int, 6))) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &v_tmp;
                var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                _ = &r_tmp;
                var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                _ = &g_tmp;
                var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                _ = &b_tmp;
                var y_tmp: i32 = ((@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) >> @intCast(@as(c_int, 6))) * @as(c_int, param.*.y_factor);
                _ = &y_tmp;
                @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = ((@as(c_uint, 3221225472) | (@as(Uint32, clamp10(y_tmp + b_tmp)) << @intCast(@as(Uint32, 20)))) | (@as(Uint32, clamp10(y_tmp + g_tmp)) << @intCast(@as(Uint32, 10)))) | (@as(Uint32, clamp10(y_tmp + r_tmp)) << @intCast(@as(Uint32, 0)));
                rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                y_tmp = ((@as(c_int, y_ptr1[@as(c_int, 1)]) - @as(c_int, param.*.y_shift)) >> @intCast(@as(c_int, 6))) * @as(c_int, param.*.y_factor);
                @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = ((@as(c_uint, 3221225472) | (@as(Uint32, clamp10(y_tmp + b_tmp)) << @intCast(@as(Uint32, 20)))) | (@as(Uint32, clamp10(y_tmp + g_tmp)) << @intCast(@as(Uint32, 10)))) | (@as(Uint32, clamp10(y_tmp + r_tmp)) << @intCast(@as(Uint32, 0)));
                rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 1)))));
                u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 2), @as(c_int, 2))))));
                v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 2), @as(c_int, 2))))));
            }
        }
        if (x == (width -% @as(u32, 1))) {
            var u_tmp: i32 = (@as(c_int, u_ptr.*) >> @intCast(@as(c_int, 6))) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
            _ = &u_tmp;
            var v_tmp: i32 = (@as(c_int, v_ptr.*) >> @intCast(@as(c_int, 6))) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
            _ = &v_tmp;
            var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
            _ = &r_tmp;
            var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
            _ = &g_tmp;
            var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
            _ = &b_tmp;
            var y_tmp: i32 = ((@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) >> @intCast(@as(c_int, 6))) * @as(c_int, param.*.y_factor);
            _ = &y_tmp;
            @as([*c]Uint32, @ptrCast(@alignCast(rgb_ptr1))).* = ((@as(c_uint, 3221225472) | (@as(Uint32, clamp10(y_tmp + b_tmp)) << @intCast(@as(Uint32, 20)))) | (@as(Uint32, clamp10(y_tmp + g_tmp)) << @intCast(@as(Uint32, 10)))) | (@as(Uint32, clamp10(y_tmp + r_tmp)) << @intCast(@as(Uint32, 0)));
            rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
        }
    }
}
pub export fn yuvi0fl_rgb48_std(width: u32, height: u32, Y: [*c]const u16, U: [*c]const u16, V_1: [*c]const u16, arg_Y_stride: u32, arg_UV_stride: u32, RGB: [*c]u8, RGB_stride: u32, yuv_type: YCbCrType) void {
    @setEvalBranchQuota(100000);
    var Y_stride = arg_Y_stride;
    _ = &Y_stride;
    var UV_stride = arg_UV_stride;
    _ = &UV_stride;
    const param: [*c]const YUV2RGBParam = &YUV2RGB[yuv_type];
    _ = &param;
    {
        const ref = &Y_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u16));
    }
    {
        const ref = &UV_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u16));
    }
    var x: u32 = undefined;
    _ = &x;
    var y: u32 = undefined;
    _ = &y;
    {
        y = 0;
        while (y < (height -% @as(u32, @bitCast(@as(c_int, @as(c_int, 2) - @as(c_int, 1)))))) : (y +%= 2) {
            var y_ptr1: [*c]const u16 = Y + (y *% Y_stride);
            _ = &y_ptr1;
            var u_ptr: [*c]const u16 = U + ((y / @as(u32, 2)) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u16 = V_1 + ((y / @as(u32, 2)) *% UV_stride);
            _ = &v_ptr;
            var y_ptr2: [*c]const u16 = Y + ((y +% @as(u32, 1)) *% Y_stride);
            _ = &y_ptr2;
            var rgb_ptr1: [*c]u8 = RGB + (y *% RGB_stride);
            _ = &rgb_ptr1;
            var rgb_ptr2: [*c]u8 = RGB + ((y +% @as(u32, 1)) *% RGB_stride);
            _ = &rgb_ptr2;
            {
                x = 0;
                while (x < (width -% @as(u32, @bitCast(@as(c_int, @as(c_int, 2) - @as(c_int, 1)))))) : (x +%= 2) {
                    var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &u_tmp;
                    var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &v_tmp;
                    var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                    _ = &r_tmp;
                    var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                    _ = &g_tmp;
                    var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                    _ = &b_tmp;
                    var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    _ = &y_tmp;
                    @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr1))).* = clamp16(y_tmp + r_tmp);
                    rgb_ptr1 += @sizeOf(Uint16);
                    @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr1))).* = clamp16(y_tmp + g_tmp);
                    rgb_ptr1 += @sizeOf(Uint16);
                    @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr1))).* = clamp16(y_tmp + b_tmp);
                    rgb_ptr1 += @sizeOf(Uint16);
                    y_tmp = (@as(c_int, y_ptr1[@as(c_int, 1)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr1))).* = clamp16(y_tmp + r_tmp);
                    rgb_ptr1 += @sizeOf(Uint16);
                    @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr1))).* = clamp16(y_tmp + g_tmp);
                    rgb_ptr1 += @sizeOf(Uint16);
                    @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr1))).* = clamp16(y_tmp + b_tmp);
                    rgb_ptr1 += @sizeOf(Uint16);
                    y_tmp = (@as(c_int, y_ptr2[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr2))).* = clamp16(y_tmp + r_tmp);
                    rgb_ptr2 += @sizeOf(Uint16);
                    @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr2))).* = clamp16(y_tmp + g_tmp);
                    rgb_ptr2 += @sizeOf(Uint16);
                    @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr2))).* = clamp16(y_tmp + b_tmp);
                    rgb_ptr2 += @sizeOf(Uint16);
                    y_tmp = (@as(c_int, y_ptr2[@as(c_int, 1)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr2))).* = clamp16(y_tmp + r_tmp);
                    rgb_ptr2 += @sizeOf(Uint16);
                    @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr2))).* = clamp16(y_tmp + g_tmp);
                    rgb_ptr2 += @sizeOf(Uint16);
                    @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr2))).* = clamp16(y_tmp + b_tmp);
                    rgb_ptr2 += @sizeOf(Uint16);
                    y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 1)))));
                    y_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 1)))));
                    u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 1), @as(c_int, 2))))));
                    v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 1), @as(c_int, 2))))));
                }
            }
            if (x == (width -% @as(u32, 1))) {
                var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &u_tmp;
                var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &v_tmp;
                var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                _ = &r_tmp;
                var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                _ = &g_tmp;
                var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                _ = &b_tmp;
                var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                _ = &y_tmp;
                @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr1))).* = clamp16(y_tmp + r_tmp);
                rgb_ptr1 += @sizeOf(Uint16);
                @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr1))).* = clamp16(y_tmp + g_tmp);
                rgb_ptr1 += @sizeOf(Uint16);
                @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr1))).* = clamp16(y_tmp + b_tmp);
                rgb_ptr1 += @sizeOf(Uint16);
                y_tmp = (@as(c_int, y_ptr2[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr2))).* = clamp16(y_tmp + r_tmp);
                rgb_ptr2 += @sizeOf(Uint16);
                @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr2))).* = clamp16(y_tmp + g_tmp);
                rgb_ptr2 += @sizeOf(Uint16);
                @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr2))).* = clamp16(y_tmp + b_tmp);
                rgb_ptr2 += @sizeOf(Uint16);
            }
        }
    }
    if (y == (height -% @as(u32, 1))) {
        var y_ptr1: [*c]const u16 = Y + (y *% Y_stride);
        _ = &y_ptr1;
        var u_ptr: [*c]const u16 = U + ((y / @as(u32, 2)) *% UV_stride);
        _ = &u_ptr;
        var v_ptr: [*c]const u16 = V_1 + ((y / @as(u32, 2)) *% UV_stride);
        _ = &v_ptr;
        var rgb_ptr1: [*c]u8 = RGB + (y *% RGB_stride);
        _ = &rgb_ptr1;
        {
            x = 0;
            while (x < (width -% @as(u32, @bitCast(@as(c_int, @as(c_int, 2) - @as(c_int, 1)))))) : (x +%= 2) {
                var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &u_tmp;
                var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                _ = &v_tmp;
                var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                _ = &r_tmp;
                var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                _ = &g_tmp;
                var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                _ = &b_tmp;
                var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                _ = &y_tmp;
                @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr1))).* = clamp16(y_tmp + r_tmp);
                rgb_ptr1 += @sizeOf(Uint16);
                @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr1))).* = clamp16(y_tmp + g_tmp);
                rgb_ptr1 += @sizeOf(Uint16);
                @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr1))).* = clamp16(y_tmp + b_tmp);
                rgb_ptr1 += @sizeOf(Uint16);
                y_tmp = (@as(c_int, y_ptr1[@as(c_int, 1)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr1))).* = clamp16(y_tmp + r_tmp);
                rgb_ptr1 += @sizeOf(Uint16);
                @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr1))).* = clamp16(y_tmp + g_tmp);
                rgb_ptr1 += @sizeOf(Uint16);
                @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr1))).* = clamp16(y_tmp + b_tmp);
                rgb_ptr1 += @sizeOf(Uint16);
                y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 1)))));
                u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 1), @as(c_int, 2))))));
                v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 2) * @as(c_int, 1), @as(c_int, 2))))));
            }
        }
        if (x == (width -% @as(u32, 1))) {
            var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
            _ = &u_tmp;
            var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
            _ = &v_tmp;
            var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
            _ = &r_tmp;
            var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
            _ = &g_tmp;
            var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
            _ = &b_tmp;
            var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
            _ = &y_tmp;
            @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr1))).* = clamp16(y_tmp + r_tmp);
            rgb_ptr1 += @sizeOf(Uint16);
            @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr1))).* = clamp16(y_tmp + g_tmp);
            rgb_ptr1 += @sizeOf(Uint16);
            @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr1))).* = clamp16(y_tmp + b_tmp);
            rgb_ptr1 += @sizeOf(Uint16);
        }
    }
}
pub export fn yuvi4fl_rgb48_std(width: u32, height: u32, Y: [*c]const u16, U: [*c]const u16, V_1: [*c]const u16, arg_Y_stride: u32, arg_UV_stride: u32, RGB: [*c]u8, RGB_stride: u32, yuv_type: YCbCrType) void {
    @setEvalBranchQuota(100000);
    var Y_stride = arg_Y_stride;
    _ = &Y_stride;
    var UV_stride = arg_UV_stride;
    _ = &UV_stride;
    const param: [*c]const YUV2RGBParam = &YUV2RGB[yuv_type];
    _ = &param;
    {
        const ref = &Y_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u16));
    }
    {
        const ref = &UV_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(u16));
    }
    var x: u32 = undefined;
    _ = &x;
    var y: u32 = undefined;
    _ = &y;
    {
        y = 0;
        while (y < (height -% @as(u32, @bitCast(@as(c_int, @as(c_int, 1) - @as(c_int, 1)))))) : (y +%= 1) {
            var y_ptr1: [*c]const u16 = Y + (y *% Y_stride);
            _ = &y_ptr1;
            var u_ptr: [*c]const u16 = U + ((y / @as(u32, 1)) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u16 = V_1 + ((y / @as(u32, 1)) *% UV_stride);
            _ = &v_ptr;
            var rgb_ptr1: [*c]u8 = RGB + (y *% RGB_stride);
            _ = &rgb_ptr1;
            {
                x = 0;
                while (x < (width -% @as(u32, @bitCast(@as(c_int, @as(c_int, 1) - @as(c_int, 1)))))) : (x +%= 1) {
                    var u_tmp: i32 = @as(c_int, u_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &u_tmp;
                    var v_tmp: i32 = @as(c_int, v_ptr.*) - (@as(c_int, 1) << @intCast(YUV_BITS - @as(c_int, 1)));
                    _ = &v_tmp;
                    var r_tmp: i32 = v_tmp * @as(c_int, param.*.v_r_factor);
                    _ = &r_tmp;
                    var g_tmp: i32 = (u_tmp * @as(c_int, param.*.u_g_factor)) + (v_tmp * @as(c_int, param.*.v_g_factor));
                    _ = &g_tmp;
                    var b_tmp: i32 = u_tmp * @as(c_int, param.*.u_b_factor);
                    _ = &b_tmp;
                    var y_tmp: i32 = (@as(c_int, y_ptr1[@as(c_int, 0)]) - @as(c_int, param.*.y_shift)) * @as(c_int, param.*.y_factor);
                    _ = &y_tmp;
                    @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr1))).* = clamp16(y_tmp + r_tmp);
                    rgb_ptr1 += @sizeOf(Uint16);
                    @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr1))).* = clamp16(y_tmp + g_tmp);
                    rgb_ptr1 += @sizeOf(Uint16);
                    @as([*c]Uint16, @ptrCast(@alignCast(rgb_ptr1))).* = clamp16(y_tmp + b_tmp);
                    rgb_ptr1 += @sizeOf(Uint16);
                    y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
                    u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 1), @as(c_int, 1))))));
                    v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 1), @as(c_int, 1))))));
                }
            }
        }
    }
}
pub export fn rgb24_yuv420_std(width: u32, height: u32, RGB: [*c]const u8, RGB_stride: u32, Y: [*c]u8, U: [*c]u8, V_1: [*c]u8, Y_stride: u32, UV_stride: u32, yuv_type: YCbCrType) void {
    @setEvalBranchQuota(100000);
    const param: [*c]const RGB2YUVParam = &RGB2YUV[yuv_type];
    _ = &param;
    var x: u32 = undefined;
    _ = &x;
    var y: u32 = undefined;
    _ = &y;
    {
        y = 0;
        while (y < (height -% @as(u32, 1))) : (y +%= 2) {
            var rgb_ptr1: [*c]const u8 = RGB + (y *% RGB_stride);
            _ = &rgb_ptr1;
            var rgb_ptr2: [*c]const u8 = RGB + ((y +% @as(u32, 1)) *% RGB_stride);
            _ = &rgb_ptr2;
            var y_ptr1: [*c]u8 = Y + (y *% Y_stride);
            _ = &y_ptr1;
            var y_ptr2: [*c]u8 = Y + ((y +% @as(u32, 1)) *% Y_stride);
            _ = &y_ptr2;
            var u_ptr: [*c]u8 = U + ((y / @as(u32, 2)) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]u8 = V_1 + ((y / @as(u32, 2)) *% UV_stride);
            _ = &v_ptr;
            {
                x = 0;
                while (x < (width -% @as(u32, 1))) : (x +%= 2) {
                    var y_tmp: i32 = undefined;
                    _ = &y_tmp;
                    var u_tmp: i32 = undefined;
                    _ = &u_tmp;
                    var v_tmp: i32 = undefined;
                    _ = &v_tmp;
                    y_tmp = ((@as(c_int, param.*.matrix[@as(c_int, 0)][@as(c_int, 0)]) * @as(c_int, rgb_ptr1[@as(c_int, 0)])) + (@as(c_int, param.*.matrix[@as(c_int, 0)][@as(c_int, 1)]) * @as(c_int, rgb_ptr1[@as(c_int, 1)]))) + (@as(c_int, param.*.matrix[@as(c_int, 0)][@as(c_int, 2)]) * @as(c_int, rgb_ptr1[@as(c_int, 2)]));
                    u_tmp = ((@as(c_int, param.*.matrix[@as(c_int, 1)][@as(c_int, 0)]) * @as(c_int, rgb_ptr1[@as(c_int, 0)])) + (@as(c_int, param.*.matrix[@as(c_int, 1)][@as(c_int, 1)]) * @as(c_int, rgb_ptr1[@as(c_int, 1)]))) + (@as(c_int, param.*.matrix[@as(c_int, 1)][@as(c_int, 2)]) * @as(c_int, rgb_ptr1[@as(c_int, 2)]));
                    v_tmp = ((@as(c_int, param.*.matrix[@as(c_int, 2)][@as(c_int, 0)]) * @as(c_int, rgb_ptr1[@as(c_int, 0)])) + (@as(c_int, param.*.matrix[@as(c_int, 2)][@as(c_int, 1)]) * @as(c_int, rgb_ptr1[@as(c_int, 1)]))) + (@as(c_int, param.*.matrix[@as(c_int, 2)][@as(c_int, 2)]) * @as(c_int, rgb_ptr1[@as(c_int, 2)]));
                    y_ptr1[@as(c_int, 0)] = clampU8(y_tmp + (@as(c_int, param.*.y_shift) << @intCast(PRECISION)));
                    y_tmp = ((@as(c_int, param.*.matrix[@as(c_int, 0)][@as(c_int, 0)]) * @as(c_int, rgb_ptr1[@as(c_int, 3)])) + (@as(c_int, param.*.matrix[@as(c_int, 0)][@as(c_int, 1)]) * @as(c_int, rgb_ptr1[@as(c_int, 4)]))) + (@as(c_int, param.*.matrix[@as(c_int, 0)][@as(c_int, 2)]) * @as(c_int, rgb_ptr1[@as(c_int, 5)]));
                    u_tmp += ((@as(c_int, param.*.matrix[@as(c_int, 1)][@as(c_int, 0)]) * @as(c_int, rgb_ptr1[@as(c_int, 3)])) + (@as(c_int, param.*.matrix[@as(c_int, 1)][@as(c_int, 1)]) * @as(c_int, rgb_ptr1[@as(c_int, 4)]))) + (@as(c_int, param.*.matrix[@as(c_int, 1)][@as(c_int, 2)]) * @as(c_int, rgb_ptr1[@as(c_int, 5)]));
                    v_tmp += ((@as(c_int, param.*.matrix[@as(c_int, 2)][@as(c_int, 0)]) * @as(c_int, rgb_ptr1[@as(c_int, 3)])) + (@as(c_int, param.*.matrix[@as(c_int, 2)][@as(c_int, 1)]) * @as(c_int, rgb_ptr1[@as(c_int, 4)]))) + (@as(c_int, param.*.matrix[@as(c_int, 2)][@as(c_int, 2)]) * @as(c_int, rgb_ptr1[@as(c_int, 5)]));
                    y_ptr1[@as(c_int, 1)] = clampU8(y_tmp + (@as(c_int, param.*.y_shift) << @intCast(PRECISION)));
                    y_tmp = ((@as(c_int, param.*.matrix[@as(c_int, 0)][@as(c_int, 0)]) * @as(c_int, rgb_ptr2[@as(c_int, 0)])) + (@as(c_int, param.*.matrix[@as(c_int, 0)][@as(c_int, 1)]) * @as(c_int, rgb_ptr2[@as(c_int, 1)]))) + (@as(c_int, param.*.matrix[@as(c_int, 0)][@as(c_int, 2)]) * @as(c_int, rgb_ptr2[@as(c_int, 2)]));
                    u_tmp += ((@as(c_int, param.*.matrix[@as(c_int, 1)][@as(c_int, 0)]) * @as(c_int, rgb_ptr2[@as(c_int, 0)])) + (@as(c_int, param.*.matrix[@as(c_int, 1)][@as(c_int, 1)]) * @as(c_int, rgb_ptr2[@as(c_int, 1)]))) + (@as(c_int, param.*.matrix[@as(c_int, 1)][@as(c_int, 2)]) * @as(c_int, rgb_ptr2[@as(c_int, 2)]));
                    v_tmp += ((@as(c_int, param.*.matrix[@as(c_int, 2)][@as(c_int, 0)]) * @as(c_int, rgb_ptr2[@as(c_int, 0)])) + (@as(c_int, param.*.matrix[@as(c_int, 2)][@as(c_int, 1)]) * @as(c_int, rgb_ptr2[@as(c_int, 1)]))) + (@as(c_int, param.*.matrix[@as(c_int, 2)][@as(c_int, 2)]) * @as(c_int, rgb_ptr2[@as(c_int, 2)]));
                    y_ptr2[@as(c_int, 0)] = clampU8(y_tmp + (@as(c_int, param.*.y_shift) << @intCast(PRECISION)));
                    y_tmp = ((@as(c_int, param.*.matrix[@as(c_int, 0)][@as(c_int, 0)]) * @as(c_int, rgb_ptr2[@as(c_int, 3)])) + (@as(c_int, param.*.matrix[@as(c_int, 0)][@as(c_int, 1)]) * @as(c_int, rgb_ptr2[@as(c_int, 4)]))) + (@as(c_int, param.*.matrix[@as(c_int, 0)][@as(c_int, 2)]) * @as(c_int, rgb_ptr2[@as(c_int, 5)]));
                    u_tmp += ((@as(c_int, param.*.matrix[@as(c_int, 1)][@as(c_int, 0)]) * @as(c_int, rgb_ptr2[@as(c_int, 3)])) + (@as(c_int, param.*.matrix[@as(c_int, 1)][@as(c_int, 1)]) * @as(c_int, rgb_ptr2[@as(c_int, 4)]))) + (@as(c_int, param.*.matrix[@as(c_int, 1)][@as(c_int, 2)]) * @as(c_int, rgb_ptr2[@as(c_int, 5)]));
                    v_tmp += ((@as(c_int, param.*.matrix[@as(c_int, 2)][@as(c_int, 0)]) * @as(c_int, rgb_ptr2[@as(c_int, 3)])) + (@as(c_int, param.*.matrix[@as(c_int, 2)][@as(c_int, 1)]) * @as(c_int, rgb_ptr2[@as(c_int, 4)]))) + (@as(c_int, param.*.matrix[@as(c_int, 2)][@as(c_int, 2)]) * @as(c_int, rgb_ptr2[@as(c_int, 5)]));
                    y_ptr2[@as(c_int, 1)] = clampU8(y_tmp + (@as(c_int, param.*.y_shift) << @intCast(PRECISION)));
                    u_ptr[@as(c_int, 0)] = clampU8(@divTrunc(u_tmp, @as(c_int, 4)) + (@as(c_int, 128) << @intCast(PRECISION)));
                    v_ptr[@as(c_int, 0)] = clampU8(@divTrunc(v_tmp, @as(c_int, 4)) + (@as(c_int, 128) << @intCast(PRECISION)));
                    rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 6)))));
                    rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 6)))));
                    y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                    y_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                    u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
                    v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
                }
            }
        }
    }
}

pub const RGB2YUVParam = extern struct {
    y_shift: u8 = 0,
    matrix: [3][3]i16 = @import("std").mem.zeroes([3][3]i16),
};
pub const YUV2RGBParam = extern struct {
    y_shift: u8 = 0,
    y_factor: i16 = 0,
    v_r_factor: i16 = 0,
    u_g_factor: i16 = 0,
    v_g_factor: i16 = 0,
    u_b_factor: i16 = 0,
};
pub const YUV2RGB: [5]YUV2RGBParam = [5]YUV2RGBParam{
    YUV2RGBParam{
        .y_shift = 0,
        .y_factor = @intFromFloat((@as(f64, 1.0) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
        .v_r_factor = @intFromFloat((@as(f64, 1.402) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
        .u_g_factor = @truncate(-@as(c_int, @as(i16, @intFromFloat((@as(f64, 0.3441) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5))))),
        .v_g_factor = @truncate(-@as(c_int, @as(i16, @intFromFloat((@as(f64, 0.7141) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5))))),
        .u_b_factor = @intFromFloat((@as(f64, 1.772) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
    },
    YUV2RGBParam{
        .y_shift = 16,
        .y_factor = @intFromFloat((@as(f64, 1.1644) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
        .v_r_factor = @intFromFloat((@as(f64, 1.596) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
        .u_g_factor = @truncate(-@as(c_int, @as(i16, @intFromFloat((@as(f64, 0.3918) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5))))),
        .v_g_factor = @truncate(-@as(c_int, @as(i16, @intFromFloat((@as(f64, 0.813) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5))))),
        .u_b_factor = @intFromFloat((@as(f64, 2.0172) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
    },
    YUV2RGBParam{
        .y_shift = 0,
        .y_factor = @intFromFloat((@as(f64, 1.0) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
        .v_r_factor = @intFromFloat((@as(f64, 1.581) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
        .u_g_factor = @truncate(-@as(c_int, @as(i16, @intFromFloat((@as(f64, 0.1881) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5))))),
        .v_g_factor = @truncate(-@as(c_int, @as(i16, @intFromFloat((@as(f64, 0.47) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5))))),
        .u_b_factor = @intFromFloat((@as(f64, 1.8629) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
    },
    YUV2RGBParam{
        .y_shift = 16,
        .y_factor = @intFromFloat((@as(f64, 1.1644) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
        .v_r_factor = @intFromFloat((@as(f64, 1.7927) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
        .u_g_factor = @truncate(-@as(c_int, @as(i16, @intFromFloat((@as(f64, 0.2132) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5))))),
        .v_g_factor = @truncate(-@as(c_int, @as(i16, @intFromFloat((@as(f64, 0.5329) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5))))),
        .u_b_factor = @intFromFloat((@as(f64, 2.1124) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
    },
    YUV2RGBParam{
        .y_shift = 0,
        .y_factor = @intFromFloat((@as(f64, 1.0) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
        .v_r_factor = @intFromFloat((@as(f64, 1.476) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
        .u_g_factor = @truncate(-@as(c_int, @as(i16, @intFromFloat((@as(f64, 0.1647) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5))))),
        .v_g_factor = @truncate(-@as(c_int, @as(i16, @intFromFloat((@as(f64, 0.5719) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5))))),
        .u_b_factor = @intFromFloat((@as(f64, 1.8832) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
    },
};
pub const RGB2YUV: [5]RGB2YUVParam = [5]RGB2YUVParam{
    RGB2YUVParam{
        .y_shift = 0,
        .matrix = [3][3]i16{
            [3]i16{
                @intFromFloat((@as(f64, 0.299) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
                @intFromFloat((@as(f64, 0.587) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
                @intFromFloat((@as(f64, 0.114) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
            },
            [3]i16{
                @truncate(-@as(c_int, @as(i16, @intFromFloat((@as(f64, 0.1687) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5))))),
                @truncate(-@as(c_int, @as(i16, @intFromFloat((@as(f64, 0.3313) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5))))),
                @intFromFloat((@as(f64, 0.5) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
            },
            [3]i16{
                @intFromFloat((@as(f64, 0.5) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
                @truncate(-@as(c_int, @as(i16, @intFromFloat((@as(f64, 0.4187) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5))))),
                @truncate(-@as(c_int, @as(i16, @intFromFloat((@as(f64, 0.0813) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5))))),
            },
        },
    },
    RGB2YUVParam{
        .y_shift = 16,
        .matrix = [3][3]i16{
            [3]i16{
                @intFromFloat((@as(f64, 0.2568) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
                @intFromFloat((@as(f64, 0.5041) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
                @intFromFloat((@as(f64, 0.0979) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
            },
            [3]i16{
                @truncate(-@as(c_int, @as(i16, @intFromFloat((@as(f64, 0.1482) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5))))),
                @truncate(-@as(c_int, @as(i16, @intFromFloat((@as(f64, 0.291) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5))))),
                @intFromFloat((@as(f64, 0.4392) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
            },
            [3]i16{
                @intFromFloat((@as(f64, 0.4392) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
                @truncate(-@as(c_int, @as(i16, @intFromFloat((@as(f64, 0.3678) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5))))),
                @truncate(-@as(c_int, @as(i16, @intFromFloat((@as(f64, 0.0714) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5))))),
            },
        },
    },
    RGB2YUVParam{
        .y_shift = 0,
        .matrix = [3][3]i16{
            [3]i16{
                @intFromFloat((@as(f64, 0.2126) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
                @intFromFloat((@as(f64, 0.7152) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
                @intFromFloat((@as(f64, 0.0722) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
            },
            [3]i16{
                @truncate(-@as(c_int, @as(i16, @intFromFloat((@as(f64, 0.1141) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5))))),
                @truncate(-@as(c_int, @as(i16, @intFromFloat((@as(f64, 0.3839) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5))))),
                @intFromFloat((@as(f64, 0.498) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
            },
            [3]i16{
                @intFromFloat((@as(f64, 0.498) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
                @truncate(-@as(c_int, @as(i16, @intFromFloat((@as(f64, 0.4524) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5))))),
                @truncate(-@as(c_int, @as(i16, @intFromFloat((@as(f64, 0.0457) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5))))),
            },
        },
    },
    RGB2YUVParam{
        .y_shift = 16,
        .matrix = [3][3]i16{
            [3]i16{
                @intFromFloat((@as(f64, 0.1826) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
                @intFromFloat((@as(f64, 0.6142) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
                @intFromFloat((@as(f64, 0.062) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
            },
            [3]i16{
                @truncate(-@as(c_int, @as(i16, @intFromFloat((@as(f64, 0.1006) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5))))),
                @truncate(-@as(c_int, @as(i16, @intFromFloat((@as(f64, 0.3386) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5))))),
                @intFromFloat((@as(f64, 0.4392) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
            },
            [3]i16{
                @intFromFloat((@as(f64, 0.4392) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
                @truncate(-@as(c_int, @as(i16, @intFromFloat((@as(f64, 0.3989) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5))))),
                @truncate(-@as(c_int, @as(i16, @intFromFloat((@as(f64, 0.0403) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5))))),
            },
        },
    },
    RGB2YUVParam{
        .y_shift = 0,
        .matrix = [3][3]i16{
            [3]i16{
                @intFromFloat((@as(f64, 0.2627) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
                @intFromFloat((@as(f64, 0.678) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
                @intFromFloat((@as(f64, 0.0593) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
            },
            [3]i16{
                @truncate(-@as(c_int, @as(i16, @intFromFloat((@as(f64, 0.1395) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5))))),
                @truncate(-@as(c_int, @as(i16, @intFromFloat((@as(f64, 0.36) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5))))),
                @intFromFloat((@as(f64, 0.4995) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
            },
            [3]i16{
                @intFromFloat((@as(f64, 0.4995) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
                @truncate(-@as(c_int, @as(i16, @intFromFloat((@as(f64, 0.4593) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5))))),
                @truncate(-@as(c_int, @as(i16, @intFromFloat((@as(f64, 0.0402) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5))))),
            },
        },
    },
};
pub fn clampU8(v: i32) callconv(.c) u8 {
    @setEvalBranchQuota(100000);
    const static_local_lut = struct {
        const lut: [512]u8 = [512]u8{
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            1,
            2,
            3,
            4,
            5,
            6,
            7,
            8,
            9,
            10,
            11,
            12,
            13,
            14,
            15,
            16,
            17,
            18,
            19,
            20,
            21,
            22,
            23,
            24,
            25,
            26,
            27,
            28,
            29,
            30,
            31,
            32,
            33,
            34,
            35,
            36,
            37,
            38,
            39,
            40,
            41,
            42,
            43,
            44,
            45,
            46,
            47,
            48,
            49,
            50,
            51,
            52,
            53,
            54,
            55,
            56,
            57,
            58,
            59,
            60,
            61,
            62,
            63,
            64,
            65,
            66,
            67,
            68,
            69,
            70,
            71,
            72,
            73,
            74,
            75,
            76,
            77,
            78,
            79,
            80,
            81,
            82,
            83,
            84,
            85,
            86,
            87,
            88,
            89,
            90,
            91,
            92,
            93,
            94,
            95,
            96,
            97,
            98,
            99,
            100,
            101,
            102,
            103,
            104,
            105,
            106,
            107,
            108,
            109,
            110,
            111,
            112,
            113,
            114,
            115,
            116,
            117,
            118,
            119,
            120,
            121,
            122,
            123,
            124,
            125,
            126,
            127,
            128,
            129,
            130,
            131,
            132,
            133,
            134,
            135,
            136,
            137,
            138,
            139,
            140,
            141,
            142,
            143,
            144,
            145,
            146,
            147,
            148,
            149,
            150,
            151,
            152,
            153,
            154,
            155,
            156,
            157,
            158,
            159,
            160,
            161,
            162,
            163,
            164,
            165,
            166,
            167,
            168,
            169,
            170,
            171,
            172,
            173,
            174,
            175,
            176,
            177,
            178,
            179,
            180,
            181,
            182,
            183,
            184,
            185,
            186,
            187,
            188,
            189,
            190,
            191,
            192,
            193,
            194,
            195,
            196,
            197,
            198,
            199,
            200,
            201,
            202,
            203,
            204,
            205,
            206,
            207,
            208,
            209,
            210,
            211,
            212,
            213,
            214,
            215,
            216,
            217,
            218,
            219,
            220,
            221,
            222,
            223,
            224,
            225,
            226,
            227,
            228,
            229,
            230,
            231,
            232,
            233,
            234,
            235,
            236,
            237,
            238,
            239,
            240,
            241,
            242,
            243,
            244,
            245,
            246,
            247,
            248,
            249,
            250,
            251,
            252,
            253,
            254,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
            255,
        };
    };
    _ = &static_local_lut;
    return static_local_lut.lut[@bitCast(@as(isize, @intCast(((v + (@as(c_int, 128) * (@as(c_int, 1) << @intCast(PRECISION)))) >> @intCast(PRECISION)) & @as(c_int, 511))))];
}
pub fn clamp10(arg_v: i32) callconv(.c) u16 {
    @setEvalBranchQuota(100000);
    var v = arg_v;
    _ = &v;
    v >>= @intCast(PRECISION);
    if (v < @as(c_int, 0)) {
        return 0;
    } else if (v > @as(c_int, 1023)) {
        return 1023;
    } else {
        return @bitCast(@as(c_short, @truncate(v)));
    }
}
pub fn clamp16(arg_v: i32) callconv(.c) u16 {
    @setEvalBranchQuota(100000);
    var v = arg_v;
    _ = &v;
    v >>= @intCast(PRECISION);
    if (v < @as(c_int, 0)) {
        return 0;
    } else if (v > @as(c_int, 65535)) {
        return 65535;
    } else {
        return @bitCast(@as(c_short, @truncate(v)));
    }
}
pub const PRECISION = @as(c_int, 6);
pub const YUV_BITS = @as(c_int, 16);
