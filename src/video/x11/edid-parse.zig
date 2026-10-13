// /*
//  * Copyright 2007 Red Hat, Inc.
//  *
//  * Permission is hereby granted, free of charge, to any person obtaining a
//  * copy of this software and associated documentation files (the "Software"),
//  * to deal in the Software without restriction, including without limitation
//  * on the rights to use, copy, modify, merge, publish, distribute, sub
//  * license, and/or sell copies of the Software, and to permit persons to whom
//  * the Software is furnished to do so, subject to the following conditions:
//  *
//  * The above copyright notice and this permission notice (including the next
//  * paragraph) shall be included in all copies or substantial portions of the
//  * Software.
//  *
//  * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT.  IN NO EVENT SHALL
//  * THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//  * IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//  * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//  */
// SDL implementation ported to Zig; generated scaffolding removed.
pub extern fn printf(noalias __format: [*c]const u8, ...) c_int;
pub extern fn gamma(f64) f64;
pub const Uint32 = u32;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_memcmp_REAL(s1: ?*const anyopaque, s2: ?*const anyopaque, len: usize) c_int;
pub extern fn SDL_pow_REAL(x: f64, y: f64) f64;
pub const uchar = u8;
const struct_unnamed_15 = extern struct {
    bits_per_primary: c_int = 0,
    interface: Interface = @import("std").mem.zeroes(Interface),
    rgb444: c_int = 0,
    ycrcb444: c_int = 0,
    ycrcb422: c_int = 0,
};
const struct_unnamed_16 = extern struct {
    video_signal_level: f64 = 0,
    sync_signal_level: f64 = 0,
    total_signal_level: f64 = 0,
    blank_to_black: c_int = 0,
    separate_hv_sync: c_int = 0,
    composite_sync_on_h: c_int = 0,
    composite_sync_on_green: c_int = 0,
    serration_on_vsync: c_int = 0,
    color_type: ColorType = @import("std").mem.zeroes(ColorType),
};
const union_unnamed_14 = extern union {
    digital: struct_unnamed_15,
    analog: struct_unnamed_16,
};
pub const struct_Timing = extern struct {
    width: c_int = 0,
    height: c_int = 0,
    frequency: c_int = 0,
};
pub const Timing = struct_Timing;
const struct_unnamed_18 = extern struct {
    bipolar: c_int = 0,
    serrations: c_int = 0,
    sync_on_green: c_int = 0,
};
const struct_unnamed_19 = extern struct {
    composite: c_int = 0,
    serrations: c_int = 0,
    negative_vsync: c_int = 0,
    negative_hsync: c_int = 0,
};
const union_unnamed_17 = extern union {
    analog: struct_unnamed_18,
    digital: struct_unnamed_19,
};
pub const struct_DetailedTiming = extern struct {
    pixel_clock: c_int = 0,
    h_addr: c_int = 0,
    h_blank: c_int = 0,
    h_sync: c_int = 0,
    h_front_porch: c_int = 0,
    v_addr: c_int = 0,
    v_blank: c_int = 0,
    v_sync: c_int = 0,
    v_front_porch: c_int = 0,
    width_mm: c_int = 0,
    height_mm: c_int = 0,
    right_border: c_int = 0,
    top_border: c_int = 0,
    interlaced: c_int = 0,
    stereo: StereoType = @import("std").mem.zeroes(StereoType),
    digital_sync: c_int = 0,
    ad: union_unnamed_17 = @import("std").mem.zeroes(union_unnamed_17),
};
pub const DetailedTiming = struct_DetailedTiming;
pub const struct_MonitorInfo = extern struct {
    checksum: c_int = 0,
    manufacturer_code: [4]u8 = @import("std").mem.zeroes([4]u8),
    product_code: c_int = 0,
    serial_number: c_uint = 0,
    production_week: c_int = 0,
    production_year: c_int = 0,
    model_year: c_int = 0,
    major_version: c_int = 0,
    minor_version: c_int = 0,
    is_digital: c_int = 0,
    ad: union_unnamed_14 = @import("std").mem.zeroes(union_unnamed_14),
    width_mm: c_int = 0,
    height_mm: c_int = 0,
    aspect_ratio: f64 = 0,
    gamma: f64 = 0,
    standby: c_int = 0,
    @"suspend": c_int = 0,
    active_off: c_int = 0,
    srgb_is_standard: c_int = 0,
    preferred_timing_includes_native: c_int = 0,
    continuous_frequency: c_int = 0,
    red_x: f64 = 0,
    red_y: f64 = 0,
    green_x: f64 = 0,
    green_y: f64 = 0,
    blue_x: f64 = 0,
    blue_y: f64 = 0,
    white_x: f64 = 0,
    white_y: f64 = 0,
    min_luminance: f64 = 0,
    max_luminance: f64 = 0,
    max_frame_average_luminance: f64 = 0,
    established: [24]Timing = @import("std").mem.zeroes([24]Timing),
    standard: [8]Timing = @import("std").mem.zeroes([8]Timing),
    n_detailed_timings: c_int = 0,
    detailed_timings: [4]DetailedTiming = @import("std").mem.zeroes([4]DetailedTiming),
    dsc_serial_number: [14]u8 = @import("std").mem.zeroes([14]u8),
    dsc_product_name: [14]u8 = @import("std").mem.zeroes([14]u8),
    dsc_string: [14]u8 = @import("std").mem.zeroes([14]u8),
};
pub const MonitorInfo = struct_MonitorInfo;
pub const UNDEFINED: c_int = 0;
pub const DVI: c_int = 1;
pub const HDMI_A: c_int = 2;
pub const HDMI_B: c_int = 3;
pub const MDDI: c_int = 4;
pub const DISPLAY_PORT: c_int = 5;
pub const Interface = c_uint;
pub const UNDEFINED_COLOR: c_int = 0;
pub const MONOCHROME: c_int = 1;
pub const RGB: c_int = 2;
pub const OTHER_COLOR: c_int = 3;
pub const ColorType = c_uint;
pub const NO_STEREO: c_int = 0;
pub const FIELD_RIGHT: c_int = 1;
pub const FIELD_LEFT: c_int = 2;
pub const TWO_WAY_RIGHT_ON_EVEN: c_int = 3;
pub const TWO_WAY_LEFT_ON_EVEN: c_int = 4;
pub const FOUR_WAY_INTERLEAVED: c_int = 5;
pub const SIDE_BY_SIDE: c_int = 6;
pub const StereoType = c_uint;
pub fn get_bit(in: c_int, bit: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return (in & (@as(c_int, 1) << @intCast(bit))) >> @intCast(bit);
}
pub fn get_bits(in: c_int, begin: c_int, end: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var mask: c_int = (@as(c_int, 1) << @intCast((end - begin) + @as(c_int, 1))) - @as(c_int, 1);
    _ = &mask;
    return (in >> @intCast(begin)) & mask;
}
pub fn decode_header(edid: [*c]const uchar) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    if (SDL_memcmp_REAL(@ptrCast(@alignCast(edid)), @ptrCast(@alignCast(@as([*c]u8, @as([*c]u8, @constCast("\x00\xff\xff\xff\xff\xff\xff\x00"))))), 8) == @as(c_int, 0)) return TRUE;
    return FALSE;
}
pub fn decode_vendor_and_product_identification(edid: [*c]const uchar, info: [*c]MonitorInfo) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var is_model_year: c_int = undefined;
    _ = &is_model_year;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                info.*.manufacturer_code[@as(c_int, 0)] = @bitCast(@as(i8, @truncate(get_bits(edid[@as(c_int, 8)], 2, 6))));
                info.*.manufacturer_code[@as(c_int, 1)] = @bitCast(@as(i8, @truncate(get_bits(edid[@as(c_int, 8)], 0, 1) << @intCast(@as(c_int, 3)))));
                {
                    const ref = &info.*.manufacturer_code[@as(c_int, 1)];
                    ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | get_bits(edid[@as(c_int, 9)], 5, 7))));
                }
                info.*.manufacturer_code[@as(c_int, 2)] = @bitCast(@as(i8, @truncate(get_bits(edid[@as(c_int, 9)], 0, 4))));
                info.*.manufacturer_code[@as(c_int, 3)] = '\x00';
                {
                    const ref = &info.*.manufacturer_code[@as(c_int, 0)];
                    ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) + (@as(c_int, 'A') - @as(c_int, 1)))));
                }
                {
                    const ref = &info.*.manufacturer_code[@as(c_int, 1)];
                    ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) + (@as(c_int, 'A') - @as(c_int, 1)))));
                }
                {
                    const ref = &info.*.manufacturer_code[@as(c_int, 2)];
                    ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) + (@as(c_int, 'A') - @as(c_int, 1)))));
                }
                info.*.product_code = (@as(c_int, edid[@as(c_int, 11)]) << @intCast(@as(c_int, 8))) | @as(c_int, edid[@as(c_int, 10)]);
                info.*.serial_number = @as(Uint32, @bitCast(@as(c_int, (@as(c_int, edid[@as(c_int, 12)]) | (@as(c_int, edid[@as(c_int, 13)]) << @intCast(@as(c_int, 8)))) | (@as(c_int, edid[@as(c_int, 14)]) << @intCast(@as(c_int, 16)))))) | (@as(Uint32, edid[@as(c_int, 15)]) << @intCast(@as(Uint32, 24)));
                is_model_year = FALSE;
                switch (@as(c_int, edid[@as(c_int, 16)])) {
                    @as(c_int, 0) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(c_int, 255) => {
                        sdl_pc = 3;
                        continue;
                    },
                    else => {
                        sdl_pc = 4;
                        continue;
                    },
                }
            },
            1 => {
                if (is_model_year != 0) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            2 => {
                info.*.production_week = -@as(c_int, 1);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                info.*.production_week = -@as(c_int, 1);
                is_model_year = TRUE;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                info.*.production_week = edid[@as(c_int, 16)];
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            5 => {
                info.*.production_year = -@as(c_int, 1);
                info.*.model_year = @as(c_int, 1990) + @as(c_int, edid[@as(c_int, 17)]);
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            6 => {
                info.*.production_year = @as(c_int, 1990) + @as(c_int, edid[@as(c_int, 17)]);
                info.*.model_year = -@as(c_int, 1);
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                return TRUE;
            },
            else => unreachable,
        }
    }
}
pub fn decode_edid_version(edid: [*c]const uchar, info: [*c]MonitorInfo) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    info.*.major_version = edid[@as(c_int, 18)];
    info.*.minor_version = edid[@as(c_int, 19)];
    return TRUE;
}
pub fn decode_display_parameters(edid: [*c]const uchar, info: [*c]MonitorInfo) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    info.*.is_digital = get_bit(edid[@as(c_int, 20)], 7);
    if (info.*.is_digital != 0) {
        var bits: c_int = undefined;
        _ = &bits;
        const static_local_bit_depth = struct {
            const bit_depth: [8]c_int = [8]c_int{
                -@as(c_int, 1),
                6,
                8,
                10,
                12,
                14,
                16,
                -@as(c_int, 1),
            };
        };
        _ = &static_local_bit_depth;
        const static_local_interfaces = struct {
            const interfaces: [6]Interface = [6]Interface{
                UNDEFINED,
                DVI,
                HDMI_A,
                HDMI_B,
                MDDI,
                DISPLAY_PORT,
            };
        };
        _ = &static_local_interfaces;
        bits = get_bits(edid[@as(c_int, 20)], 4, 6);
        info.*.ad.digital.bits_per_primary = static_local_bit_depth.bit_depth[@bitCast(@as(isize, @intCast(bits)))];
        bits = get_bits(edid[@as(c_int, 20)], 0, 3);
        if (bits <= @as(c_int, 5)) {
            info.*.ad.digital.interface = static_local_interfaces.interfaces[@bitCast(@as(isize, @intCast(bits)))];
        } else {
            info.*.ad.digital.interface = UNDEFINED;
        }
    } else {
        var bits: c_int = get_bits(edid[@as(c_int, 20)], 5, 6);
        _ = &bits;
        const static_local_levels = struct {
            var levels: [4][3]f64 = [4][3]f64{
                [3]f64{
                    0.7,
                    0.3,
                    1.0,
                },
                [3]f64{
                    0.714,
                    0.286,
                    1.0,
                },
                [3]f64{
                    1.0,
                    0.4,
                    1.4,
                },
                [3]f64{
                    0.7,
                    0.0,
                    0.7,
                },
            };
        };
        _ = &static_local_levels;
        info.*.ad.analog.video_signal_level = static_local_levels.levels[@bitCast(@as(isize, @intCast(bits)))][@as(c_int, 0)];
        info.*.ad.analog.sync_signal_level = static_local_levels.levels[@bitCast(@as(isize, @intCast(bits)))][@as(c_int, 1)];
        info.*.ad.analog.total_signal_level = static_local_levels.levels[@bitCast(@as(isize, @intCast(bits)))][@as(c_int, 2)];
        info.*.ad.analog.blank_to_black = get_bit(edid[@as(c_int, 20)], 4);
        info.*.ad.analog.separate_hv_sync = get_bit(edid[@as(c_int, 20)], 3);
        info.*.ad.analog.composite_sync_on_h = get_bit(edid[@as(c_int, 20)], 2);
        info.*.ad.analog.composite_sync_on_green = get_bit(edid[@as(c_int, 20)], 1);
        info.*.ad.analog.serration_on_vsync = get_bit(edid[@as(c_int, 20)], 0);
    }
    if ((@as(c_int, edid[@as(c_int, 21)]) == @as(c_int, 0)) and (@as(c_int, edid[@as(c_int, 22)]) == @as(c_int, 0))) {
        info.*.width_mm = -@as(c_int, 1);
        info.*.height_mm = -@as(c_int, 1);
        info.*.aspect_ratio = -@as(f64, 1.0);
    } else if (@as(c_int, edid[@as(c_int, 22)]) == @as(c_int, 0)) {
        info.*.width_mm = -@as(c_int, 1);
        info.*.height_mm = -@as(c_int, 1);
        info.*.aspect_ratio = @as(f64, 100.0) / @as(f64, @floatFromInt(@as(c_int, edid[@as(c_int, 21)]) + @as(c_int, 99)));
    } else if (@as(c_int, edid[@as(c_int, 21)]) == @as(c_int, 0)) {
        info.*.width_mm = -@as(c_int, 1);
        info.*.height_mm = -@as(c_int, 1);
        info.*.aspect_ratio = @as(f64, 100.0) / @as(f64, @floatFromInt(@as(c_int, edid[@as(c_int, 22)]) + @as(c_int, 99)));
        info.*.aspect_ratio = @as(f64, @floatFromInt(@as(c_int, 1))) / info.*.aspect_ratio;
    } else {
        info.*.width_mm = @as(c_int, 10) * @as(c_int, edid[@as(c_int, 21)]);
        info.*.height_mm = @as(c_int, 10) * @as(c_int, edid[@as(c_int, 22)]);
    }
    if (@as(c_int, edid[@as(c_int, 23)]) == @as(c_int, 255)) {
        info.*.gamma = -@as(f64, 1.0);
    } else {
        info.*.gamma = (@as(f64, @floatFromInt(@as(c_int, edid[@as(c_int, 23)]))) + @as(f64, 100.0)) / @as(f64, 100.0);
    }
    info.*.standby = get_bit(edid[@as(c_int, 24)], 7);
    info.*.@"suspend" = get_bit(edid[@as(c_int, 24)], 6);
    info.*.active_off = get_bit(edid[@as(c_int, 24)], 5);
    if (info.*.is_digital != 0) {
        info.*.ad.digital.rgb444 = TRUE;
        if (get_bit(edid[@as(c_int, 24)], 3) != 0) {
            info.*.ad.digital.ycrcb444 = 1;
        }
        if (get_bit(edid[@as(c_int, 24)], 4) != 0) {
            info.*.ad.digital.ycrcb422 = 1;
        }
    } else {
        var bits: c_int = get_bits(edid[@as(c_int, 24)], 3, 4);
        _ = &bits;
        var color_type: [4]ColorType = [4]ColorType{
            MONOCHROME,
            RGB,
            OTHER_COLOR,
            UNDEFINED_COLOR,
        };
        _ = &color_type;
        info.*.ad.analog.color_type = color_type[@bitCast(@as(isize, @intCast(bits)))];
    }
    info.*.srgb_is_standard = get_bit(edid[@as(c_int, 24)], 2);
    info.*.preferred_timing_includes_native = get_bit(edid[@as(c_int, 24)], 1);
    info.*.continuous_frequency = get_bit(edid[@as(c_int, 24)], 0);
    return TRUE;
}
pub fn decode_fraction(arg_high: c_int, low: c_int) callconv(.c) f64 {
    @setEvalBranchQuota(100000);
    var high = arg_high;
    _ = &high;
    var result: f64 = 0.0;
    _ = &result;
    var i: c_int = undefined;
    _ = &i;
    high = (high << @intCast(@as(c_int, 2))) | low;
    {
        i = 0;
        while (i < @as(c_int, 10)) : (i += 1) {
            result += @as(f64, @floatFromInt(get_bit(high, i))) * SDL_pow_REAL(@floatFromInt(@as(c_int, 2)), @floatFromInt(i - @as(c_int, 10)));
        }
    }
    return result;
}
pub fn decode_color_characteristics(edid: [*c]const uchar, info: [*c]MonitorInfo) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    info.*.red_x = decode_fraction(edid[@as(c_int, 27)], get_bits(edid[@as(c_int, 25)], 6, 7));
    info.*.red_y = decode_fraction(edid[@as(c_int, 28)], get_bits(edid[@as(c_int, 25)], 5, 4));
    info.*.green_x = decode_fraction(edid[@as(c_int, 29)], get_bits(edid[@as(c_int, 25)], 2, 3));
    info.*.green_y = decode_fraction(edid[@as(c_int, 30)], get_bits(edid[@as(c_int, 25)], 0, 1));
    info.*.blue_x = decode_fraction(edid[@as(c_int, 31)], get_bits(edid[@as(c_int, 26)], 6, 7));
    info.*.blue_y = decode_fraction(edid[@as(c_int, 32)], get_bits(edid[@as(c_int, 26)], 4, 5));
    info.*.white_x = decode_fraction(edid[@as(c_int, 33)], get_bits(edid[@as(c_int, 26)], 2, 3));
    info.*.white_y = decode_fraction(edid[@as(c_int, 34)], get_bits(edid[@as(c_int, 26)], 0, 1));
    return TRUE;
}
pub fn decode_established_timings(edid: [*c]const uchar, info: [*c]MonitorInfo) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const static_local_established = struct {
        var established: [3][8]Timing = [3][8]Timing{
            [8]Timing{
                Timing{
                    .width = 800,
                    .height = 600,
                    .frequency = 60,
                },
                Timing{
                    .width = 800,
                    .height = 600,
                    .frequency = 56,
                },
                Timing{
                    .width = 640,
                    .height = 480,
                    .frequency = 75,
                },
                Timing{
                    .width = 640,
                    .height = 480,
                    .frequency = 72,
                },
                Timing{
                    .width = 640,
                    .height = 480,
                    .frequency = 67,
                },
                Timing{
                    .width = 640,
                    .height = 480,
                    .frequency = 60,
                },
                Timing{
                    .width = 720,
                    .height = 400,
                    .frequency = 88,
                },
                Timing{
                    .width = 720,
                    .height = 400,
                    .frequency = 70,
                },
            },
            [8]Timing{
                Timing{
                    .width = 1280,
                    .height = 1024,
                    .frequency = 75,
                },
                Timing{
                    .width = 1024,
                    .height = 768,
                    .frequency = 75,
                },
                Timing{
                    .width = 1024,
                    .height = 768,
                    .frequency = 70,
                },
                Timing{
                    .width = 1024,
                    .height = 768,
                    .frequency = 60,
                },
                Timing{
                    .width = 1024,
                    .height = 768,
                    .frequency = 87,
                },
                Timing{
                    .width = 832,
                    .height = 624,
                    .frequency = 75,
                },
                Timing{
                    .width = 800,
                    .height = 600,
                    .frequency = 75,
                },
                Timing{
                    .width = 800,
                    .height = 600,
                    .frequency = 72,
                },
            },
            [8]Timing{
                Timing{
                    .width = 0,
                    .height = 0,
                    .frequency = 0,
                },
                Timing{
                    .width = 0,
                    .height = 0,
                    .frequency = 0,
                },
                Timing{
                    .width = 0,
                    .height = 0,
                    .frequency = 0,
                },
                Timing{
                    .width = 0,
                    .height = 0,
                    .frequency = 0,
                },
                Timing{
                    .width = 0,
                    .height = 0,
                    .frequency = 0,
                },
                Timing{
                    .width = 0,
                    .height = 0,
                    .frequency = 0,
                },
                Timing{
                    .width = 0,
                    .height = 0,
                    .frequency = 0,
                },
                Timing{
                    .width = 1152,
                    .height = 870,
                    .frequency = 75,
                },
            },
        };
    };
    _ = &static_local_established;
    var i: c_int = undefined;
    _ = &i;
    var j: c_int = undefined;
    _ = &j;
    var idx: c_int = undefined;
    _ = &idx;
    idx = 0;
    {
        i = 0;
        while (i < @as(c_int, 3)) : (i += 1) {
            {
                j = 0;
                while (j < @as(c_int, 8)) : (j += 1) {
                    var byte: c_int = edid[@bitCast(@as(isize, @intCast(@as(c_int, 35) + i)))];
                    _ = &byte;
                    if ((get_bit(byte, j) != 0) and (static_local_established.established[@bitCast(@as(isize, @intCast(i)))][@bitCast(@as(isize, @intCast(j)))].frequency != @as(c_int, 0))) {
                        info.*.established[
                            @bitCast(@as(isize, @intCast(blk: {
                                const ref = &idx;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            })))
                        ] = static_local_established.established[@bitCast(@as(isize, @intCast(i)))][@bitCast(@as(isize, @intCast(j)))];
                    }
                }
            }
        }
    }
    return TRUE;
}
pub fn decode_standard_timings(edid: [*c]const uchar, info: [*c]MonitorInfo) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var first: c_int = undefined;
    _ = &first;
    var second: c_int = undefined;
    _ = &second;
    var w: c_int = undefined;
    _ = &w;
    var h: c_int = undefined;
    _ = &h;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                i = 0;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            1 => {
                if (i < @as(c_int, 8)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 4;
                    continue;
                }
            },
            2 => {
                first = edid[@bitCast(@as(isize, @intCast(@as(c_int, 38) + (@as(c_int, 2) * i))))];
                second = edid[@bitCast(@as(isize, @intCast(@as(c_int, 39) + (@as(c_int, 2) * i))))];
                if ((first != @as(c_int, 1)) and (second != @as(c_int, 1))) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            3 => {
                i += 1;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                return TRUE;
            },
            5 => {
                w = @as(c_int, 8) * (first + @as(c_int, 31));
                h = 0;
                switch (get_bits(second, 6, 7)) {
                    @as(c_int, 0) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 12;
                        continue;
                    },
                    else => {
                        sdl_pc = 8;
                        continue;
                    },
                }
            },
            6 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            8 => {
                info.*.standard[@bitCast(@as(isize, @intCast(i)))].width = w;
                info.*.standard[@bitCast(@as(isize, @intCast(i)))].height = h;
                info.*.standard[@bitCast(@as(isize, @intCast(i)))].frequency = get_bits(second, 0, 5) + @as(c_int, 60);
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            9 => {
                h = @divTrunc(w, @as(c_int, 16)) * @as(c_int, 10);
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            10 => {
                h = @divTrunc(w, @as(c_int, 4)) * @as(c_int, 3);
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            11 => {
                h = @divTrunc(w, @as(c_int, 5)) * @as(c_int, 4);
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            12 => {
                h = @divTrunc(w, @as(c_int, 16)) * @as(c_int, 9);
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn decode_lf_string(s: [*c]const uchar, n_chars: c_int, arg_result: [*c]u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var result = arg_result;
    _ = &result;
    var i: c_int = undefined;
    _ = &i;
    {
        i = 0;
        while (i < n_chars) : (i += 1) {
            if (@as(c_int, s[@bitCast(@as(isize, @intCast(i)))]) == @as(c_int, 10)) {
                (blk: {
                    const ref = &result;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = '\x00';
                break;
            } else if (@as(c_int, s[@bitCast(@as(isize, @intCast(i)))]) == @as(c_int, 0)) {
                (blk: {
                    const ref = &result;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = ' ';
            } else {
                (blk: {
                    const ref = &result;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @truncate(s[@bitCast(@as(isize, @intCast(i)))]);
            }
        }
    }
}
pub fn decode_display_descriptor(desc: [*c]const uchar, info: [*c]MonitorInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (@as(c_int, desc[@as(c_int, 3)])) {
                    @as(c_int, 252) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(c_int, 255) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(c_int, 254) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(c_int, 253) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(c_int, 251) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(c_int, 250) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(c_int, 249) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(c_int, 248) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(c_int, 247) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(c_int, 16) => {
                        sdl_pc = 11;
                        continue;
                    },
                    else => {
                        sdl_pc = 1;
                        continue;
                    },
                }
            },
            1 => {
                {}
            },
            2 => {
                decode_lf_string(desc + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 5))))), 13, @ptrCast(@alignCast(&info.*.dsc_product_name)));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                decode_lf_string(desc + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 5))))), 13, @ptrCast(@alignCast(&info.*.dsc_serial_number)));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                decode_lf_string(desc + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 5))))), 13, @ptrCast(@alignCast(&info.*.dsc_string)));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            5 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            6 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            7 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            8 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            9 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            10 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            11 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn decode_detailed_timing(timing: [*c]const uchar, detailed: [*c]DetailedTiming) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var bits: c_int = undefined;
    _ = &bits;
    var stereo: [8]StereoType = [8]StereoType{
        NO_STEREO,
        NO_STEREO,
        FIELD_RIGHT,
        FIELD_LEFT,
        TWO_WAY_RIGHT_ON_EVEN,
        TWO_WAY_LEFT_ON_EVEN,
        FOUR_WAY_INTERLEAVED,
        SIDE_BY_SIDE,
    };
    _ = &stereo;
    detailed.*.pixel_clock = (@as(c_int, timing[@as(c_int, 0)]) | (@as(c_int, timing[@as(c_int, 1)]) << @intCast(@as(c_int, 8)))) * @as(c_int, 10000);
    detailed.*.h_addr = @as(c_int, timing[@as(c_int, 2)]) | ((@as(c_int, timing[@as(c_int, 4)]) & @as(c_int, 240)) << @intCast(@as(c_int, 4)));
    detailed.*.h_blank = @as(c_int, timing[@as(c_int, 3)]) | ((@as(c_int, timing[@as(c_int, 4)]) & @as(c_int, 15)) << @intCast(@as(c_int, 8)));
    detailed.*.v_addr = @as(c_int, timing[@as(c_int, 5)]) | ((@as(c_int, timing[@as(c_int, 7)]) & @as(c_int, 240)) << @intCast(@as(c_int, 4)));
    detailed.*.v_blank = @as(c_int, timing[@as(c_int, 6)]) | ((@as(c_int, timing[@as(c_int, 7)]) & @as(c_int, 15)) << @intCast(@as(c_int, 8)));
    detailed.*.h_front_porch = @as(c_int, timing[@as(c_int, 8)]) | (get_bits(timing[@as(c_int, 11)], 6, 7) << @intCast(@as(c_int, 8)));
    detailed.*.h_sync = @as(c_int, timing[@as(c_int, 9)]) | (get_bits(timing[@as(c_int, 11)], 4, 5) << @intCast(@as(c_int, 8)));
    detailed.*.v_front_porch = get_bits(timing[@as(c_int, 10)], 4, 7) | (get_bits(timing[@as(c_int, 11)], 2, 3) << @intCast(@as(c_int, 4)));
    detailed.*.v_sync = get_bits(timing[@as(c_int, 10)], 0, 3) | (get_bits(timing[@as(c_int, 11)], 0, 1) << @intCast(@as(c_int, 4)));
    detailed.*.width_mm = @as(c_int, timing[@as(c_int, 12)]) | (get_bits(timing[@as(c_int, 14)], 4, 7) << @intCast(@as(c_int, 8)));
    detailed.*.height_mm = @as(c_int, timing[@as(c_int, 13)]) | (get_bits(timing[@as(c_int, 14)], 0, 3) << @intCast(@as(c_int, 8)));
    detailed.*.right_border = timing[@as(c_int, 15)];
    detailed.*.top_border = timing[@as(c_int, 16)];
    detailed.*.interlaced = get_bit(timing[@as(c_int, 17)], 7);
    bits = (get_bits(timing[@as(c_int, 17)], 5, 6) << @intCast(@as(c_int, 1))) | get_bit(timing[@as(c_int, 17)], 0);
    detailed.*.stereo = stereo[@bitCast(@as(isize, @intCast(bits)))];
    bits = timing[@as(c_int, 17)];
    detailed.*.digital_sync = get_bit(bits, 4);
    if (detailed.*.digital_sync != 0) {
        detailed.*.ad.digital.composite = @intFromBool(!(get_bit(bits, 3) != 0));
        if (detailed.*.ad.digital.composite != 0) {
            detailed.*.ad.digital.serrations = get_bit(bits, 2);
            detailed.*.ad.digital.negative_vsync = FALSE;
        } else {
            detailed.*.ad.digital.serrations = FALSE;
            detailed.*.ad.digital.negative_vsync = @intFromBool(!(get_bit(bits, 2) != 0));
        }
        detailed.*.ad.digital.negative_hsync = @intFromBool(!(get_bit(bits, 0) != 0));
    } else {
        detailed.*.ad.analog.bipolar = get_bit(bits, 3);
        detailed.*.ad.analog.serrations = get_bit(bits, 2);
        detailed.*.ad.analog.sync_on_green = @intFromBool(!(get_bit(bits, 1) != 0));
    }
}
pub fn decode_descriptors(edid: [*c]const uchar, info: [*c]MonitorInfo) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var timing_idx: c_int = undefined;
    _ = &timing_idx;
    timing_idx = 0;
    {
        i = 0;
        while (i < @as(c_int, 4)) : (i += 1) {
            var index_1: c_int = @as(c_int, 54) + (i * @as(c_int, 18));
            _ = &index_1;
            if ((@as(c_int, edid[@bitCast(@as(isize, @intCast(index_1 + @as(c_int, 0))))]) == @as(c_int, 0)) and (@as(c_int, edid[@bitCast(@as(isize, @intCast(index_1 + @as(c_int, 1))))]) == @as(c_int, 0))) {
                decode_display_descriptor(edid + @as(usize, @bitCast(@as(isize, @intCast(index_1)))), info);
            } else {
                decode_detailed_timing(edid + @as(usize, @bitCast(@as(isize, @intCast(index_1)))), &info.*.detailed_timings[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &timing_idx;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ]);
            }
        }
    }
    info.*.n_detailed_timings = timing_idx;
    return TRUE;
}
pub fn decode_check_sum(edid: [*c]const uchar, info: [*c]MonitorInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var check: uchar = 0;
    _ = &check;
    {
        i = 0;
        while (i < @as(c_int, 128)) : (i += 1) {
            {
                const ref = &check;
                ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) + @as(c_int, edid[@bitCast(@as(isize, @intCast(i)))]))));
            }
        }
    }
    info.*.checksum = check;
}
pub fn decode_HDR_metadata_block(data: [*c]const uchar, arg_length: c_int, info: [*c]MonitorInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var length = arg_length;
    _ = &length;
    if (length >= @as(c_int, 3)) {
        info.*.max_luminance = @as(f64, 50.0) * SDL_pow_REAL(@floatFromInt(@as(c_int, 2)), @as(f64, @floatFromInt(@as(c_int, data[@as(c_int, 2)]))) / @as(f64, 32.0));
    }
    if (length >= @as(c_int, 4)) {
        info.*.max_frame_average_luminance = @as(f64, 50.0) * SDL_pow_REAL(@floatFromInt(@as(c_int, 2)), @as(f64, @floatFromInt(@as(c_int, data[@as(c_int, 3)]))) / @as(f64, 32.0));
    }
    if (length >= @as(c_int, 5)) {
        info.*.min_luminance = @as(f64, 50.0) * SDL_pow_REAL(@floatFromInt(@as(c_int, 2)), @as(f64, @floatFromInt(@as(c_int, data[@as(c_int, 4)]))) / @as(f64, 32.0));
    }
}
pub fn decode_cta_block(edid: [*c]const uchar, info: [*c]MonitorInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var offset: c_int = 4;
    _ = &offset;
    while (offset < @as(c_int, 128)) {
        var length: c_int = @as(c_int, edid[@bitCast(@as(isize, @intCast(offset)))]) & @as(c_int, 31);
        _ = &length;
        var @"type": c_int = @as(c_int, edid[@bitCast(@as(isize, @intCast(offset)))]) >> @intCast(@as(c_int, 5));
        _ = &@"type";
        if (length == @as(c_int, 0)) {
            break;
        }
        if (@"type" == @as(c_int, 7)) {
            @"type" <<= @intCast(@as(c_int, 8));
            @"type" |= edid[@bitCast(@as(isize, @intCast(offset + @as(c_int, 1))))];
        }
        if (@"type" == @as(c_int, 1798)) {
            decode_HDR_metadata_block(&edid[@bitCast(@as(isize, @intCast(offset + @as(c_int, 2))))], length - @as(c_int, 1), info);
        }
        offset += @as(c_int, 1) + length;
    }
}
pub export fn decode_edid(edid: [*c]const uchar, size: usize) [*c]MonitorInfo {
    @setEvalBranchQuota(100000);
    const EDID_PAGE_SIZE: c_int = 128;
    _ = &EDID_PAGE_SIZE;
    var num_blocks: c_int = @bitCast(@as(c_uint, @truncate(size / @as(usize, @bitCast(@as(c_long, EDID_PAGE_SIZE))))));
    _ = &num_blocks;
    var info: [*c]MonitorInfo = undefined;
    _ = &info;
    if ((size % @as(usize, @bitCast(@as(c_long, EDID_PAGE_SIZE)))) != @as(usize, 0)) {
        return null;
    }
    info = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(MonitorInfo))));
    decode_check_sum(edid, info);
    if (((((((!(decode_header(edid) != 0) or !(decode_vendor_and_product_identification(edid, info) != 0)) or !(decode_edid_version(edid, info) != 0)) or !(decode_display_parameters(edid, info) != 0)) or !(decode_color_characteristics(edid, info) != 0)) or !(decode_established_timings(edid, info) != 0)) or !(decode_standard_timings(edid, info) != 0)) or !(decode_descriptors(edid, info) != 0)) {
        SDL_free_REAL(@ptrCast(@alignCast(info)));
        return null;
    }
    if (num_blocks > @as(c_int, 1)) {
        {
            var i: c_int = 1;
            _ = &i;
            while (i < num_blocks) : (i += 1) {
                var offset: c_int = i * EDID_PAGE_SIZE;
                _ = &offset;
                var extension: uchar = edid[@bitCast(@as(isize, @intCast(offset)))];
                _ = &extension;
                if (@as(c_int, extension) == @as(c_int, 2)) {
                    decode_cta_block(&edid[@bitCast(@as(isize, @intCast(offset)))], info);
                }
            }
        }
    }
    return info;
}
pub fn yesno(v: c_int) callconv(.c) [*c]const u8 {
    @setEvalBranchQuota(100000);
    return if (v != 0) @as([*c]u8, @as([*c]u8, @constCast("yes"))) else @as([*c]u8, @as([*c]u8, @constCast("no")));
}
pub export fn dump_monitor_info(info: [*c]MonitorInfo) void {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var interface: [*c]const u8 = undefined;
    _ = &interface;
    var s: [*c]const u8 = undefined;
    _ = &s;
    var timing: [*c]Timing = undefined;
    _ = &timing;
    var timing_1: [*c]Timing = undefined;
    _ = &timing_1;
    var timing_2: [*c]DetailedTiming = undefined;
    _ = &timing_2;
    var s_3: [*c]const u8 = undefined;
    _ = &s_3;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                _ = printf("Checksum: %d (%s)\n", info.*.checksum, if (info.*.checksum != 0) @as([*c]u8, @as([*c]u8, @constCast("incorrect"))) else @as([*c]u8, @as([*c]u8, @constCast("correct"))));
                _ = printf("Manufacturer Code: %s\n", @as([*c]u8, @ptrCast(@alignCast(&info.*.manufacturer_code))));
                _ = printf("Product Code: 0x%x\n", info.*.product_code);
                _ = printf("Serial Number: %u\n", info.*.serial_number);
                if (info.*.production_week != -@as(c_int, 1)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                _ = printf("Production Week: %d\n", info.*.production_week);
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            2 => {
                _ = printf("Production Week: unspecified\n");
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                if (info.*.production_year != -@as(c_int, 1)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                _ = printf("Production Year: %d\n", info.*.production_year);
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                _ = printf("Production Year: unspecified\n");
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                if (info.*.model_year != -@as(c_int, 1)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                _ = printf("Model Year: %d\n", info.*.model_year);
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                _ = printf("Model Year: unspecified\n");
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                _ = printf("EDID revision: %d.%d\n", info.*.major_version, info.*.minor_version);
                _ = printf("Display is %s\n", if (info.*.is_digital != 0) @as([*c]u8, @as([*c]u8, @constCast("digital"))) else @as([*c]u8, @as([*c]u8, @constCast("analog"))));
                if (info.*.is_digital != 0) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                if (info.*.ad.digital.bits_per_primary != -@as(c_int, 1)) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            11 => {
                _ = printf("Video Signal Level: %f\n", info.*.ad.analog.video_signal_level);
                _ = printf("Sync Signal Level: %f\n", info.*.ad.analog.sync_signal_level);
                _ = printf("Total Signal Level: %f\n", info.*.ad.analog.total_signal_level);
                _ = printf("Blank to Black: %s\n", yesno(info.*.ad.analog.blank_to_black));
                _ = printf("Separate HV Sync: %s\n", yesno(info.*.ad.analog.separate_hv_sync));
                _ = printf("Composite Sync on H: %s\n", yesno(info.*.ad.analog.composite_sync_on_h));
                _ = printf("Serration on VSync: %s\n", yesno(info.*.ad.analog.serration_on_vsync));
                switch (info.*.ad.analog.color_type) {
                    @as(ColorType, UNDEFINED_COLOR) => {
                        sdl_pc = 25;
                        continue;
                    },
                    @as(ColorType, MONOCHROME) => {
                        sdl_pc = 26;
                        continue;
                    },
                    @as(ColorType, RGB) => {
                        sdl_pc = 27;
                        continue;
                    },
                    @as(ColorType, OTHER_COLOR) => {
                        sdl_pc = 28;
                        continue;
                    },
                    else => {
                        sdl_pc = 29;
                        continue;
                    },
                }
            },
            12 => {
                if (info.*.width_mm == -@as(c_int, 1)) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            13 => {
                _ = printf("Bits Per Primary: %d\n", info.*.ad.digital.bits_per_primary);
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                _ = printf("Bits Per Primary: undefined\n");
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                switch (info.*.ad.digital.interface) {
                    @as(Interface, DVI) => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(Interface, HDMI_A) => {
                        sdl_pc = 18;
                        continue;
                    },
                    @as(Interface, HDMI_B) => {
                        sdl_pc = 19;
                        continue;
                    },
                    @as(Interface, MDDI) => {
                        sdl_pc = 20;
                        continue;
                    },
                    @as(Interface, DISPLAY_PORT) => {
                        sdl_pc = 21;
                        continue;
                    },
                    @as(Interface, UNDEFINED) => {
                        sdl_pc = 22;
                        continue;
                    },
                    else => {
                        sdl_pc = 23;
                        continue;
                    },
                }
            },
            16 => {
                _ = printf("Interface: %s\n", interface);
                _ = printf("RGB 4:4:4: %s\n", yesno(info.*.ad.digital.rgb444));
                _ = printf("YCrCb 4:4:4: %s\n", yesno(info.*.ad.digital.ycrcb444));
                _ = printf("YCrCb 4:2:2: %s\n", yesno(info.*.ad.digital.ycrcb422));
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            17 => {
                interface = "DVI";
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            18 => {
                interface = "HDMI-a";
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            19 => {
                interface = "HDMI-b";
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            20 => {
                interface = "MDDI";
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            21 => {
                interface = "DisplayPort";
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            22 => {
                interface = "undefined";
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            23 => {
                interface = "unknown";
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            24 => {
                _ = printf("Color: %s\n", s);
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            25 => {
                s = "undefined";
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            26 => {
                s = "monochrome";
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            27 => {
                s = "rgb";
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            28 => {
                s = "other color";
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            29 => {
                s = "unknown";
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            30 => {
                _ = printf("Width: undefined\n");
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            31 => {
                _ = printf("Width: %d mm\n", info.*.width_mm);
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            32 => {
                if (info.*.height_mm == -@as(c_int, 1)) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 34;
                    continue;
                }
            },
            33 => {
                _ = printf("Height: undefined\n");
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            34 => {
                _ = printf("Height: %d mm\n", info.*.height_mm);
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            35 => {
                if (info.*.aspect_ratio > @as(f64, @floatFromInt(@as(c_int, 0)))) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 37;
                    continue;
                }
            },
            36 => {
                _ = printf("Aspect Ratio: %f\n", info.*.aspect_ratio);
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            37 => {
                _ = printf("Aspect Ratio: undefined\n");
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            38 => {
                if (info.*.gamma >= @as(f64, @floatFromInt(@as(c_int, 0)))) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 40;
                    continue;
                }
            },
            39 => {
                _ = printf("Gamma: %f\n", info.*.gamma);
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            40 => {
                _ = printf("Gamma: undefined\n");
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            41 => {
                _ = printf("Standby: %s\n", yesno(info.*.standby));
                _ = printf("Suspend: %s\n", yesno(info.*.@"suspend"));
                _ = printf("Active Off: %s\n", yesno(info.*.active_off));
                _ = printf("SRGB is Standard: %s\n", yesno(info.*.srgb_is_standard));
                _ = printf("Preferred Timing Includes Native: %s\n", yesno(info.*.preferred_timing_includes_native));
                _ = printf("Continuous Frequency: %s\n", yesno(info.*.continuous_frequency));
                _ = printf("Red X: %f\n", info.*.red_x);
                _ = printf("Red Y: %f\n", info.*.red_y);
                _ = printf("Green X: %f\n", info.*.green_x);
                _ = printf("Green Y: %f\n", info.*.green_y);
                _ = printf("Blue X: %f\n", info.*.blue_x);
                _ = printf("Blue Y: %f\n", info.*.blue_y);
                _ = printf("White X: %f\n", info.*.white_x);
                _ = printf("White Y: %f\n", info.*.white_y);
                _ = printf("Min luminance: %f\n", info.*.min_luminance);
                _ = printf("Max luminance: %f\n", info.*.max_luminance);
                _ = printf("Max frame average luminance %f\n", info.*.max_frame_average_luminance);
                _ = printf("Established Timings:\n");
                i = 0;
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            42 => {
                if (i < @as(c_int, 24)) {
                    sdl_pc = 43;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            43 => {
                timing = &info.*.established[@bitCast(@as(isize, @intCast(i)))];
                if (timing.*.frequency == @as(c_int, 0)) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 47;
                    continue;
                }
            },
            44 => {
                i += 1;
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            45 => {
                _ = printf("Standard Timings:\n");
                i = 0;
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            46 => {
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            47 => {
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            48 => {
                _ = printf("  %d x %d @ %d Hz\n", timing.*.width, timing.*.height, timing.*.frequency);
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            49 => {
                if (i < @as(c_int, 8)) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 52;
                    continue;
                }
            },
            50 => {
                timing_1 = &info.*.standard[@bitCast(@as(isize, @intCast(i)))];
                if (timing_1.*.frequency == @as(c_int, 0)) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 54;
                    continue;
                }
            },
            51 => {
                i += 1;
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            52 => {
                i = 0;
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            53 => {
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            54 => {
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            55 => {
                _ = printf("  %d x %d @ %d Hz\n", timing_1.*.width, timing_1.*.height, timing_1.*.frequency);
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            56 => {
                if (i < info.*.n_detailed_timings) {
                    sdl_pc = 57;
                    continue;
                } else {
                    sdl_pc = 59;
                    continue;
                }
            },
            57 => {
                timing_2 = &info.*.detailed_timings[@bitCast(@as(isize, @intCast(i)))];
                _ = printf("Timing%s: \n", if ((i == @as(c_int, 0)) and (info.*.preferred_timing_includes_native != 0)) @as([*c]u8, @as([*c]u8, @constCast(" (Preferred)"))) else @as([*c]u8, @as([*c]u8, @constCast(""))));
                _ = printf("  Pixel Clock: %d\n", timing_2.*.pixel_clock);
                _ = printf("  H Addressable: %d\n", timing_2.*.h_addr);
                _ = printf("  H Blank: %d\n", timing_2.*.h_blank);
                _ = printf("  H Front Porch: %d\n", timing_2.*.h_front_porch);
                _ = printf("  H Sync: %d\n", timing_2.*.h_sync);
                _ = printf("  V Addressable: %d\n", timing_2.*.v_addr);
                _ = printf("  V Blank: %d\n", timing_2.*.v_blank);
                _ = printf("  V Front Porch: %d\n", timing_2.*.v_front_porch);
                _ = printf("  V Sync: %d\n", timing_2.*.v_sync);
                _ = printf("  Width: %d mm\n", timing_2.*.width_mm);
                _ = printf("  Height: %d mm\n", timing_2.*.height_mm);
                _ = printf("  Right Border: %d\n", timing_2.*.right_border);
                _ = printf("  Top Border: %d\n", timing_2.*.top_border);
                switch (timing_2.*.stereo) {
                    @as(StereoType, NO_STEREO) => {
                        sdl_pc = 62;
                        continue;
                    },
                    @as(StereoType, FIELD_RIGHT) => {
                        sdl_pc = 63;
                        continue;
                    },
                    @as(StereoType, FIELD_LEFT) => {
                        sdl_pc = 64;
                        continue;
                    },
                    @as(StereoType, TWO_WAY_RIGHT_ON_EVEN) => {
                        sdl_pc = 65;
                        continue;
                    },
                    @as(StereoType, TWO_WAY_LEFT_ON_EVEN) => {
                        sdl_pc = 66;
                        continue;
                    },
                    @as(StereoType, FOUR_WAY_INTERLEAVED) => {
                        sdl_pc = 67;
                        continue;
                    },
                    @as(StereoType, SIDE_BY_SIDE) => {
                        sdl_pc = 68;
                        continue;
                    },
                    else => {
                        sdl_pc = 61;
                        continue;
                    },
                }
            },
            58 => {
                i += 1;
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            59 => {
                _ = printf("Detailed Product information:\n");
                _ = printf("  Product Name: %s\n", @as([*c]u8, @ptrCast(@alignCast(&info.*.dsc_product_name))));
                _ = printf("  Serial Number: %s\n", @as([*c]u8, @ptrCast(@alignCast(&info.*.dsc_serial_number))));
                _ = printf("  Unspecified String: %s\n", @as([*c]u8, @ptrCast(@alignCast(&info.*.dsc_string))));
                {}
            },
            60 => {
                _ = printf("  Stereo: %s\n", s_3);
                if (timing_2.*.digital_sync != 0) {
                    sdl_pc = 69;
                    continue;
                } else {
                    sdl_pc = 70;
                    continue;
                }
            },
            61 => {
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            62 => {
                s_3 = "No Stereo";
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            63 => {
                s_3 = "Field Sequential, Right on Sync";
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            64 => {
                s_3 = "Field Sequential, Left on Sync";
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            65 => {
                s_3 = "Two-way, Right on Even";
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            66 => {
                s_3 = "Two-way, Left on Even";
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            67 => {
                s_3 = "Four-way Interleaved";
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            68 => {
                s_3 = "Side-by-Side";
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            69 => {
                _ = printf("  Digital Sync:\n");
                _ = printf("    composite: %s\n", yesno(timing_2.*.ad.digital.composite));
                _ = printf("    serrations: %s\n", yesno(timing_2.*.ad.digital.serrations));
                _ = printf("    negative vsync: %s\n", yesno(timing_2.*.ad.digital.negative_vsync));
                _ = printf("    negative hsync: %s\n", yesno(timing_2.*.ad.digital.negative_hsync));
                {
                    sdl_pc = 71;
                    continue;
                }
            },
            70 => {
                _ = printf("  Analog Sync:\n");
                _ = printf("    bipolar: %s\n", yesno(timing_2.*.ad.analog.bipolar));
                _ = printf("    serrations: %s\n", yesno(timing_2.*.ad.analog.serrations));
                _ = printf("    sync on green: %s\n", yesno(timing_2.*.ad.analog.sync_on_green));
                {
                    sdl_pc = 71;
                    continue;
                }
            },
            71 => {
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}

pub const TRUE = @as(c_int, 1);
pub const FALSE = @as(c_int, 0);
