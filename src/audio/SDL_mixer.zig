// /*
//   Simple DirectMedia Layer
//   Copyright (C) 1997-2026 Sam Lantinga <slouken@libsdl.org>
// 
//   This software is provided 'as-is', without any express or implied
//   warranty.  In no event will the authors be held liable for any damages
//   arising from the use of this software.
// 
//   Permission is granted to anyone to use this software for any purpose,
//   including commercial applications, and to alter it and redistribute it
//   freely, subject to the following restrictions:
// 
//   1. The origin of this software must not be misrepresented; you must not
//      claim that you wrote the original software. If you use this software
//      in a product, an acknowledgment in the product documentation would be
//      appreciated but is not required.
//   2. Altered source versions must be plainly marked as such, and must not be
//      misrepresented as being the original software.
//   3. This notice may not be removed or altered from any source distribution.
// */
// SDL implementation ported to Zig; generated scaffolding removed.
pub const Sint8 = i8;
pub const Uint8 = u8;
pub const Sint16 = i16;
pub const Sint32 = i32;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub extern fn SDL_roundf_REAL(x: f32) f32;
pub inline fn SDL_SwapFloat(x: f32) f32 {
    @setEvalBranchQuota(100000);
    const union_unnamed_7 = extern union {
        f: f32,
        ui32: Uint32,
    };
    _ = &union_unnamed_7;
    var swapper: union_unnamed_7 = undefined;
    _ = &swapper;
    swapper.f = x;
    swapper.ui32 = @byteSwap(@as(Uint32, swapper.ui32));
    return swapper.f;
}
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_AUDIO_U8: c_int = 8;
pub const SDL_AUDIO_S8: c_int = 32776;
pub const SDL_AUDIO_S16LE: c_int = 32784;
pub const SDL_AUDIO_S16BE: c_int = 36880;
pub const SDL_AUDIO_S32LE: c_int = 32800;
pub const SDL_AUDIO_S32BE: c_int = 36896;
pub const SDL_AUDIO_F32LE: c_int = 33056;
pub const SDL_AUDIO_F32BE: c_int = 37152;
pub const enum_SDL_AudioFormat = c_uint;
pub const SDL_AudioFormat = enum_SDL_AudioFormat;
pub const mix8: [512]Uint8 = [512]Uint8{
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
pub export fn SDL_MixAudio_REAL(arg_dst: [*c]Uint8, arg_src: [*c]const Uint8, format: SDL_AudioFormat, arg_len: Uint32, fvolume: f32) bool {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var len = arg_len;
    _ = &len;
    var volume: c_int = undefined;
    _ = &volume;
    var src_sample: Uint8 = undefined;
    _ = &src_sample;
    var dst8: [*c]Sint8 = undefined;
    _ = &dst8;
    var src8: [*c]Sint8 = undefined;
    _ = &src8;
    var src_sample_1: Sint8 = undefined;
    _ = &src_sample_1;
    var dst_sample: c_int = undefined;
    _ = &dst_sample;
    var max_audioval: c_int = undefined;
    _ = &max_audioval;
    var min_audioval: c_int = undefined;
    _ = &min_audioval;
    var src1: Sint16 = undefined;
    _ = &src1;
    var src2: Sint16 = undefined;
    _ = &src2;
    var dst_sample_2: c_int = undefined;
    _ = &dst_sample_2;
    var max_audioval_3: c_int = undefined;
    _ = &max_audioval_3;
    var min_audioval_4: c_int = undefined;
    _ = &min_audioval_4;
    var src1_5: Sint16 = undefined;
    _ = &src1_5;
    var src2_6: Sint16 = undefined;
    _ = &src2_6;
    var dst_sample_7: c_int = undefined;
    _ = &dst_sample_7;
    var max_audioval_8: c_int = undefined;
    _ = &max_audioval_8;
    var min_audioval_9: c_int = undefined;
    _ = &min_audioval_9;
    var src32: [*c]const Uint32 = undefined;
    _ = &src32;
    var dst32: [*c]Uint32 = undefined;
    _ = &dst32;
    var src1_10: Sint64 = undefined;
    _ = &src1_10;
    var src2_11: Sint64 = undefined;
    _ = &src2_11;
    var dst_sample_12: Sint64 = undefined;
    _ = &dst_sample_12;
    var max_audioval_13: Sint64 = undefined;
    _ = &max_audioval_13;
    var min_audioval_14: Sint64 = undefined;
    _ = &min_audioval_14;
    var src32_15: [*c]const Uint32 = undefined;
    _ = &src32_15;
    var dst32_16: [*c]Uint32 = undefined;
    _ = &dst32_16;
    var src1_17: Sint64 = undefined;
    _ = &src1_17;
    var src2_18: Sint64 = undefined;
    _ = &src2_18;
    var dst_sample_19: Sint64 = undefined;
    _ = &dst_sample_19;
    var max_audioval_20: Sint64 = undefined;
    _ = &max_audioval_20;
    var min_audioval_21: Sint64 = undefined;
    _ = &min_audioval_21;
    var src32_22: [*c]const f32 = undefined;
    _ = &src32_22;
    var dst32_23: [*c]f32 = undefined;
    _ = &dst32_23;
    var src1_24: f32 = undefined;
    _ = &src1_24;
    var src2_25: f32 = undefined;
    _ = &src2_25;
    var dst_sample_26: f32 = undefined;
    _ = &dst_sample_26;
    var max_audioval_27: f32 = undefined;
    _ = &max_audioval_27;
    var min_audioval_28: f32 = undefined;
    _ = &min_audioval_28;
    var src32_29: [*c]const f32 = undefined;
    _ = &src32_29;
    var dst32_30: [*c]f32 = undefined;
    _ = &dst32_30;
    var src1_31: f32 = undefined;
    _ = &src1_31;
    var src2_32: f32 = undefined;
    _ = &src2_32;
    var dst_sample_33: f32 = undefined;
    _ = &dst_sample_33;
    var max_audioval_34: f32 = undefined;
    _ = &max_audioval_34;
    var min_audioval_35: f32 = undefined;
    _ = &min_audioval_35;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                volume = @intFromFloat(SDL_roundf_REAL(fvolume * @as(f32, @floatFromInt(MIX_MAXVOLUME))));
                if (volume == @as(c_int, 0)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return @"true" != 0;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                switch (format) {
                    @as(SDL_AudioFormat, SDL_AUDIO_U8) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_AudioFormat, SDL_AUDIO_S8) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(SDL_AudioFormat, SDL_AUDIO_S16LE) => {
                        sdl_pc = 19;
                        continue;
                    },
                    @as(SDL_AudioFormat, SDL_AUDIO_S16BE) => {
                        sdl_pc = 29;
                        continue;
                    },
                    @as(SDL_AudioFormat, SDL_AUDIO_S32LE) => {
                        sdl_pc = 39;
                        continue;
                    },
                    @as(SDL_AudioFormat, SDL_AUDIO_S32BE) => {
                        sdl_pc = 49;
                        continue;
                    },
                    @as(SDL_AudioFormat, SDL_AUDIO_F32LE) => {
                        sdl_pc = 59;
                        continue;
                    },
                    @as(SDL_AudioFormat, SDL_AUDIO_F32BE) => {
                        sdl_pc = 69;
                        continue;
                    },
                    else => {
                        sdl_pc = 79;
                        continue;
                    },
                }
            },
            4 => {
                return @"true" != 0;
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                if ((blk: {
                    const ref = &len;
                    const tmp = ref.*;
                    ref.* -%= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                src_sample = src.*;
                src_sample = @bitCast(@as(i8, @truncate(@divTrunc((@as(c_int, src_sample) - @as(c_int, 128)) * volume, MIX_MAXVOLUME) + @as(c_int, 128))));
                dst.* = mix8[@bitCast(@as(isize, @intCast(@as(c_int, dst.*) + @as(c_int, src_sample))))];
                dst += 1;
                src += 1;
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            8 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            9 => {
                max_audioval = @as(Sint8, @truncate(@as(c_int, 127)));
                min_audioval = @as(Sint8, @truncate(~@as(c_int, 127)));
                src8 = @ptrCast(@alignCast(@constCast(src)));
                dst8 = @ptrCast(@alignCast(dst));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                if ((blk: {
                    const ref = &len;
                    const tmp = ref.*;
                    ref.* -%= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                src_sample_1 = src8.*;
                src_sample_1 = @truncate(@divTrunc(@as(c_int, src_sample_1) * volume, MIX_MAXVOLUME));
                dst_sample = @as(c_int, dst8.*) + @as(c_int, src_sample_1);
                if (dst_sample > max_audioval) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            13 => {
                dst_sample = max_audioval;
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                if (dst_sample < min_audioval) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            15 => {
                dst8.* = @truncate(dst_sample);
                dst8 += 1;
                src8 += 1;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            16 => {
                dst_sample = min_audioval;
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            18 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            19 => {
                max_audioval_3 = @as(Sint16, @truncate(@as(c_int, 32767)));
                min_audioval_4 = @as(Sint16, @truncate(~@as(c_int, 32767)));
                len /= 2;
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            20 => {
                if ((blk: {
                    const ref = &len;
                    const tmp = ref.*;
                    ref.* -%= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            21 => {
                src1 = @as([*c]Sint16, @ptrCast(@alignCast(@constCast(src)))).*;
                src1 = @truncate(@divTrunc(@as(c_int, src1) * volume, MIX_MAXVOLUME));
                src2 = @as([*c]Sint16, @ptrCast(@alignCast(dst))).*;
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                dst_sample_2 = @as(c_int, src1) + @as(c_int, src2);
                if (dst_sample_2 > max_audioval_3) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            22 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            23 => {
                dst_sample_2 = max_audioval_3;
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            24 => {
                if (dst_sample_2 < min_audioval_4) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            25 => {
                @as([*c]Sint16, @ptrCast(@alignCast(dst))).* = @as(Sint16, @truncate(dst_sample_2));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            26 => {
                dst_sample_2 = min_audioval_4;
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            27 => {
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            28 => {
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            29 => {
                max_audioval_8 = @as(Sint16, @truncate(@as(c_int, 32767)));
                min_audioval_9 = @as(Sint16, @truncate(~@as(c_int, 32767)));
                len /= 2;
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            30 => {
                if ((blk: {
                    const ref = &len;
                    const tmp = ref.*;
                    ref.* -%= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 31;
                    continue;
                } else {
                    sdl_pc = 32;
                    continue;
                }
            },
            31 => {
                src1_5 = @bitCast(@as(c_ushort, @truncate(@byteSwap(@as(c_ushort, @bitCast(@as(c_short, @as([*c]Sint16, @ptrCast(@alignCast(@constCast(src)))).*)))))));
                src1_5 = @truncate(@divTrunc(@as(c_int, src1_5) * volume, MIX_MAXVOLUME));
                src2_6 = @bitCast(@as(c_ushort, @truncate(@byteSwap(@as(c_ushort, @bitCast(@as(c_short, @as([*c]Sint16, @ptrCast(@alignCast(dst))).*)))))));
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                dst_sample_7 = @as(c_int, src1_5) + @as(c_int, src2_6);
                if (dst_sample_7 > max_audioval_8) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 34;
                    continue;
                }
            },
            32 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            33 => {
                dst_sample_7 = max_audioval_8;
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            34 => {
                if (dst_sample_7 < min_audioval_9) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 37;
                    continue;
                }
            },
            35 => {
                @as([*c]Sint16, @ptrCast(@alignCast(dst))).* = @bitCast(@as(c_ushort, @truncate(@byteSwap(@as(c_ushort, @bitCast(@as(c_short, @as(Sint16, @truncate(dst_sample_7)))))))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            36 => {
                dst_sample_7 = min_audioval_9;
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            37 => {
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            38 => {
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            39 => {
                src32 = @ptrCast(@alignCast(src));
                dst32 = @ptrCast(@alignCast(dst));
                max_audioval_13 = @as(c_int, 2147483647);
                min_audioval_14 = ~@as(c_int, 2147483647);
                len /= 4;
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            40 => {
                if ((blk: {
                    const ref = &len;
                    const tmp = ref.*;
                    ref.* -%= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            41 => {
                src1_10 = @as(Sint32, @bitCast(@as(c_uint, @truncate(src32.*))));
                src32 += 1;
                src1_10 = @divTrunc(src1_10 * @as(Sint64, volume), @as(Sint64, MIX_MAXVOLUME));
                src2_11 = @as(Sint32, @bitCast(@as(c_uint, @truncate(dst32.*))));
                dst_sample_12 = src1_10 + src2_11;
                if (dst_sample_12 > max_audioval_13) {
                    sdl_pc = 43;
                    continue;
                } else {
                    sdl_pc = 44;
                    continue;
                }
            },
            42 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            43 => {
                dst_sample_12 = max_audioval_13;
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            44 => {
                if (dst_sample_12 < min_audioval_14) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 47;
                    continue;
                }
            },
            45 => {
                (blk: {
                    const ref = &dst32;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @as(Uint32, @bitCast(@as(c_int, @as(Sint32, @truncate(dst_sample_12)))));
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            46 => {
                dst_sample_12 = min_audioval_14;
                {
                    sdl_pc = 48;
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
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            49 => {
                src32_15 = @ptrCast(@alignCast(src));
                dst32_16 = @ptrCast(@alignCast(dst));
                max_audioval_20 = @as(c_int, 2147483647);
                min_audioval_21 = ~@as(c_int, 2147483647);
                len /= 4;
                {
                    sdl_pc = 50;
                    continue;
                }
            },
            50 => {
                if ((blk: {
                    const ref = &len;
                    const tmp = ref.*;
                    ref.* -%= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 51;
                    continue;
                } else {
                    sdl_pc = 52;
                    continue;
                }
            },
            51 => {
                src1_17 = @as(Sint32, @bitCast(@as(c_uint, @truncate(@byteSwap(@as(Uint32, src32_15.*))))));
                src32_15 += 1;
                src1_17 = @divTrunc(src1_17 * @as(Sint64, volume), @as(Sint64, MIX_MAXVOLUME));
                src2_18 = @as(Sint32, @bitCast(@as(c_uint, @truncate(@byteSwap(@as(Uint32, dst32_16.*))))));
                dst_sample_19 = src1_17 + src2_18;
                if (dst_sample_19 > max_audioval_20) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 54;
                    continue;
                }
            },
            52 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            53 => {
                dst_sample_19 = max_audioval_20;
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            54 => {
                if (dst_sample_19 < min_audioval_21) {
                    sdl_pc = 56;
                    continue;
                } else {
                    sdl_pc = 57;
                    continue;
                }
            },
            55 => {
                (blk: {
                    const ref = &dst32_16;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @byteSwap(@as(Uint32, @bitCast(@as(c_int, @as(Sint32, @truncate(dst_sample_19))))));
                {
                    sdl_pc = 50;
                    continue;
                }
            },
            56 => {
                dst_sample_19 = min_audioval_21;
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            57 => {
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            58 => {
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            59 => {
                src32_22 = @ptrCast(@alignCast(src));
                dst32_23 = @ptrCast(@alignCast(dst));
                max_audioval_27 = 1.0;
                min_audioval_28 = -@as(f32, 1.0);
                len /= 4;
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            60 => {
                if ((blk: {
                    const ref = &len;
                    const tmp = ref.*;
                    ref.* -%= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 61;
                    continue;
                } else {
                    sdl_pc = 62;
                    continue;
                }
            },
            61 => {
                src1_24 = src32_22.* * fvolume;
                src2_25 = dst32_23.*;
                src32_22 += 1;
                dst_sample_26 = src1_24 + src2_25;
                if (dst_sample_26 > max_audioval_27) {
                    sdl_pc = 63;
                    continue;
                } else {
                    sdl_pc = 64;
                    continue;
                }
            },
            62 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            63 => {
                dst_sample_26 = max_audioval_27;
                {
                    sdl_pc = 65;
                    continue;
                }
            },
            64 => {
                if (dst_sample_26 < min_audioval_28) {
                    sdl_pc = 66;
                    continue;
                } else {
                    sdl_pc = 67;
                    continue;
                }
            },
            65 => {
                (blk: {
                    const ref = &dst32_23;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = dst_sample_26;
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            66 => {
                dst_sample_26 = min_audioval_28;
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            67 => {
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            68 => {
                {
                    sdl_pc = 65;
                    continue;
                }
            },
            69 => {
                src32_29 = @ptrCast(@alignCast(src));
                dst32_30 = @ptrCast(@alignCast(dst));
                max_audioval_34 = 1.0;
                min_audioval_35 = -@as(f32, 1.0);
                len /= 4;
                {
                    sdl_pc = 70;
                    continue;
                }
            },
            70 => {
                if ((blk: {
                    const ref = &len;
                    const tmp = ref.*;
                    ref.* -%= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 71;
                    continue;
                } else {
                    sdl_pc = 72;
                    continue;
                }
            },
            71 => {
                src1_31 = SDL_SwapFloat(src32_29.*) * fvolume;
                src2_32 = SDL_SwapFloat(dst32_30.*);
                src32_29 += 1;
                dst_sample_33 = src1_31 + src2_32;
                if (dst_sample_33 > max_audioval_34) {
                    sdl_pc = 73;
                    continue;
                } else {
                    sdl_pc = 74;
                    continue;
                }
            },
            72 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            73 => {
                dst_sample_33 = max_audioval_34;
                {
                    sdl_pc = 75;
                    continue;
                }
            },
            74 => {
                if (dst_sample_33 < min_audioval_35) {
                    sdl_pc = 76;
                    continue;
                } else {
                    sdl_pc = 77;
                    continue;
                }
            },
            75 => {
                (blk: {
                    const ref = &dst32_30;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = SDL_SwapFloat(dst_sample_33);
                {
                    sdl_pc = 70;
                    continue;
                }
            },
            76 => {
                dst_sample_33 = min_audioval_35;
                {
                    sdl_pc = 78;
                    continue;
                }
            },
            77 => {
                {
                    sdl_pc = 78;
                    continue;
                }
            },
            78 => {
                {
                    sdl_pc = 75;
                    continue;
                }
            },
            79 => {
                return SDL_SetError_REAL("SDL_MixAudio(): unknown audio format");
            },
            else => unreachable,
        }
    }
}

pub const @"true" = @as(c_int, 1);
pub const MIX_MAXVOLUME = @as(c_int, 128);
pub const ADJUST_VOLUME = @compileError("unable to translate C expr: expected ')' instead got '='");
// /home/addo/dev/stupid/zdl/.ref/SDL/src/audio/SDL_mixer.c:82:9
