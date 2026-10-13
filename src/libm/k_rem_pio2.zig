// SDL implementation ported to Zig; generated scaffolding removed.
pub const __builtin = @import("translation_builtins");
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const SDL_ASSERTION_RETRY: c_int = 0;
pub const SDL_ASSERTION_BREAK: c_int = 1;
pub const enum_SDL_AssertState = c_uint;
pub const SDL_AssertState = enum_SDL_AssertState;
pub const struct_SDL_AssertData = extern struct {
    always_ignore: bool = false,
    trigger_count: c_uint = 0,
    condition: [*c]const u8 = null,
    filename: [*c]const u8 = null,
    linenum: c_int = 0,
    function: [*c]const u8 = null,
    next: [*c]const struct_SDL_AssertData = null,
};
pub const SDL_AssertData = struct_SDL_AssertData;
pub extern fn SDL_ReportAssertion_REAL(data: [*c]SDL_AssertData, func: [*c]const u8, file: [*c]const u8, line: c_int) SDL_AssertState;
pub extern fn SDL_uclibc_floor(x: f64) f64;
pub extern fn SDL_uclibc_scalbn(x: f64, n: c_int) f64;
pub const init_jk: [4]c_int = [4]c_int{
    2,
    3,
    4,
    6,
};
pub const PIo2: [8]f64 = [8]f64{
    1.570796251296997,
    0.00000007549789415861596,
    0.000000000000005390302529957765,
    0.0000000000000000000003282003415807913,
    0.00000000000000000000000000001270655753080676,
    0.0000000000000000000000000000000000012293330898111133,
    0.000000000000000000000000000000000000000000027337005381646456,
    0.0000000000000000000000000000000000000000000000000021674168387780482,
};
pub const zero: f64 = 0.0;
pub const one: f64 = 1.0;
pub const two24: f64 = 16777216.0;
pub const twon24: f64 = 0.00000005960464477539063;
pub export fn __kernel_rem_pio2(x: [*c]const f64, y: [*c]f64, e0: c_int, nx: c_int, prec: c_uint, ipio2: [*c]const i32) i32 {
    @setEvalBranchQuota(100000);
    _ = &prec;
    const static_local___func__ = struct {
        const __func__: [17:0]u8 = "__kernel_rem_pio2".*;
    };
    _ = &static_local___func__;
    var jz: i32 = undefined;
    _ = &jz;
    var jx: i32 = undefined;
    _ = &jx;
    var jv: i32 = undefined;
    _ = &jv;
    var jp: i32 = undefined;
    _ = &jp;
    var jk: i32 = undefined;
    _ = &jk;
    var carry: i32 = undefined;
    _ = &carry;
    var n: i32 = undefined;
    _ = &n;
    var iq: [20]i32 = undefined;
    _ = &iq;
    var i: i32 = undefined;
    _ = &i;
    var j: i32 = undefined;
    _ = &j;
    var k: i32 = undefined;
    _ = &k;
    var m: i32 = undefined;
    _ = &m;
    var q0: i32 = undefined;
    _ = &q0;
    var ih: i32 = undefined;
    _ = &ih;
    var z: f64 = undefined;
    _ = &z;
    var fw: f64 = undefined;
    _ = &fw;
    var f: [20]f64 = undefined;
    _ = &f;
    var fq: [20]f64 = undefined;
    _ = &fq;
    var q: [20]f64 = undefined;
    _ = &q;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "prec < (sizeof(init_jk)/sizeof(init_jk[0]))",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data;
    var sdl_assert_state: SDL_AssertState = undefined;
    _ = &sdl_assert_state;
    const static_local_sdl_assert_data_1 = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "jk > 0",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data_1;
    var sdl_assert_state_2: SDL_AssertState = undefined;
    _ = &sdl_assert_state_2;
    const static_local_sdl_assert_data_3 = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "jz >= 0",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data_3;
    var sdl_assert_state_4: SDL_AssertState = undefined;
    _ = &sdl_assert_state_4;
    const static_local_sdl_assert_data_5 = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "jz >= 0",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data_5;
    var sdl_assert_state_6: SDL_AssertState = undefined;
    _ = &sdl_assert_state_6;
    i += 1;
    j = 0;
    i = 0;
    j = jz;
    i += 1;
    j = 0;
    fw = 0.0;
    fw = 0.0;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (nx < @as(c_int, 1)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                z = q[@bitCast(@as(isize, @intCast(jz)))];
                {
                    sdl_pc = 47;
                    continue;
                }
            },
            2 => {
                return 0;
            },
            3 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            5 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            6 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                jk = init_jk[prec];
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            8 => {
                if (!(@as(c_ulong, prec) < (@sizeOf(@TypeOf(init_jk)) / @sizeOf(@TypeOf(init_jk[@as(c_int, 0)]))))) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
            },
            9 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "k_rem_pio2.c", 162);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            10 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            11 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            12 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            13 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            14 => {
                __builtin.debugtrap();
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            15 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            18 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            19 => {
                jp = jk;
                jx = nx - @as(c_int, 1);
                jv = @divTrunc(e0 - @as(c_int, 3), @as(c_int, 24));
                if (jv < @as(c_int, 0)) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            20 => {
                if (!(jk > @as(c_int, 0))) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            21 => {
                sdl_assert_state_2 = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data_1.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "k_rem_pio2.c", 164);
                if (sdl_assert_state_2 == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            22 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            23 => {
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            24 => {
                if (sdl_assert_state_2 == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            25 => {
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            26 => {
                __builtin.debugtrap();
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
                jv = 0;
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            30 => {
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            31 => {
                q0 = e0 - (@as(c_int, 24) * (jv + @as(c_int, 1)));
                j = jv - jx;
                m = jx + jk;
                i = 0;
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            32 => {
                if (i <= m) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 35;
                    continue;
                }
            },
            33 => {
                f[@bitCast(@as(isize, @intCast(i)))] = if (j < @as(c_int, 0)) zero else @as(f64, @floatFromInt(ipio2[@bitCast(@as(isize, @intCast(j)))]));
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            34 => {
                j += 1;
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            35 => {
                if (@as(c_ulong, @bitCast(@as(c_long, m + @as(c_int, 1)))) < (@sizeOf(@TypeOf(f)) / @sizeOf(@TypeOf(f[@as(c_int, 0)])))) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 37;
                    continue;
                }
            },
            36 => {
                _ = memset(@ptrCast(@alignCast(&f[@bitCast(@as(isize, @intCast(m + @as(c_int, 1))))])), 0, @sizeOf(@TypeOf(f)) -% (@as(c_ulong, @bitCast(@as(c_long, m + @as(c_int, 1)))) *% @sizeOf(@TypeOf(f[@as(c_int, 0)]))));
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
                i = 0;
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            39 => {
                if (i <= jk) {
                    sdl_pc = 40;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            40 => {
                fw = 0.0;
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            41 => {
                i += 1;
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            42 => {
                jz = jk;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            43 => {
                if (j <= jx) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 46;
                    continue;
                }
            },
            44 => {
                fw += x[@bitCast(@as(isize, @intCast(j)))] * f[@bitCast(@as(isize, @intCast((jx + i) - j)))];
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            45 => {
                j += 1;
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            46 => {
                q[@bitCast(@as(isize, @intCast(i)))] = fw;
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            47 => {
                if (j > @as(c_int, 0)) {
                    sdl_pc = 48;
                    continue;
                } else {
                    sdl_pc = 50;
                    continue;
                }
            },
            48 => {
                fw = @floatFromInt(@as(i32, @intFromFloat(twon24 * z)));
                iq[@bitCast(@as(isize, @intCast(i)))] = @intFromFloat(z - (two24 * fw));
                z = q[@bitCast(@as(isize, @intCast(j - @as(c_int, 1))))] + fw;
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            49 => {
                j -= 1;
                {
                    sdl_pc = 47;
                    continue;
                }
            },
            50 => {
                if (@as(c_ulong, @bitCast(@as(c_long, jz))) < (@sizeOf(@TypeOf(iq)) / @sizeOf(@TypeOf(iq[@as(c_int, 0)])))) {
                    sdl_pc = 51;
                    continue;
                } else {
                    sdl_pc = 52;
                    continue;
                }
            },
            51 => {
                _ = memset(@ptrCast(@alignCast(&iq[@bitCast(@as(isize, @intCast(jz)))])), 0, @sizeOf(@TypeOf(iq)) -% (@as(c_ulong, @bitCast(@as(c_long, jz))) *% @sizeOf(@TypeOf(iq[@as(c_int, 0)]))));
                {
                    sdl_pc = 53;
                    continue;
                }
            },
            52 => {
                {
                    sdl_pc = 53;
                    continue;
                }
            },
            53 => {
                z = SDL_uclibc_scalbn(z, q0);
                z -= @as(f64, 8.0) * SDL_uclibc_floor(z * @as(f64, 0.125));
                n = @intFromFloat(z);
                z -= @floatFromInt(n);
                ih = 0;
                if (q0 > @as(c_int, 0)) {
                    sdl_pc = 54;
                    continue;
                } else {
                    sdl_pc = 55;
                    continue;
                }
            },
            54 => {
                i = iq[@bitCast(@as(isize, @intCast(jz - @as(c_int, 1))))] >> @intCast(@as(c_int, 24) - q0);
                n += i;
                iq[@bitCast(@as(isize, @intCast(jz - @as(c_int, 1))))] -= i << @intCast(@as(c_int, 24) - q0);
                ih = iq[@bitCast(@as(isize, @intCast(jz - @as(c_int, 1))))] >> @intCast(@as(c_int, 23) - q0);
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            55 => {
                if (q0 == @as(c_int, 0)) {
                    sdl_pc = 57;
                    continue;
                } else {
                    sdl_pc = 58;
                    continue;
                }
            },
            56 => {
                if (ih > @as(c_int, 0)) {
                    sdl_pc = 63;
                    continue;
                } else {
                    sdl_pc = 64;
                    continue;
                }
            },
            57 => {
                ih = iq[@bitCast(@as(isize, @intCast(jz - @as(c_int, 1))))] >> @intCast(@as(c_int, 23));
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            58 => {
                if (z >= @as(f64, 0.5)) {
                    sdl_pc = 60;
                    continue;
                } else {
                    sdl_pc = 61;
                    continue;
                }
            },
            59 => {
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            60 => {
                ih = 2;
                {
                    sdl_pc = 62;
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
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            63 => {
                n += 1;
                carry = 0;
                i = 0;
                {
                    sdl_pc = 66;
                    continue;
                }
            },
            64 => {
                {
                    sdl_pc = 65;
                    continue;
                }
            },
            65 => {
                if (z == zero) {
                    sdl_pc = 88;
                    continue;
                } else {
                    sdl_pc = 89;
                    continue;
                }
            },
            66 => {
                if (i < jz) {
                    sdl_pc = 67;
                    continue;
                } else {
                    sdl_pc = 69;
                    continue;
                }
            },
            67 => {
                j = iq[@bitCast(@as(isize, @intCast(i)))];
                if (carry == @as(c_int, 0)) {
                    sdl_pc = 70;
                    continue;
                } else {
                    sdl_pc = 71;
                    continue;
                }
            },
            68 => {
                i += 1;
                {
                    sdl_pc = 66;
                    continue;
                }
            },
            69 => {
                if (q0 > @as(c_int, 0)) {
                    sdl_pc = 76;
                    continue;
                } else {
                    sdl_pc = 77;
                    continue;
                }
            },
            70 => {
                if (j != @as(c_int, 0)) {
                    sdl_pc = 73;
                    continue;
                } else {
                    sdl_pc = 74;
                    continue;
                }
            },
            71 => {
                iq[@bitCast(@as(isize, @intCast(i)))] = @as(c_int, 16777215) - j;
                {
                    sdl_pc = 72;
                    continue;
                }
            },
            72 => {
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            73 => {
                carry = 1;
                iq[@bitCast(@as(isize, @intCast(i)))] = @as(c_int, 16777216) - j;
                {
                    sdl_pc = 75;
                    continue;
                }
            },
            74 => {
                {
                    sdl_pc = 75;
                    continue;
                }
            },
            75 => {
                {
                    sdl_pc = 72;
                    continue;
                }
            },
            76 => {
                switch (q0) {
                    @as(c_int, 1) => {
                        sdl_pc = 80;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 81;
                        continue;
                    },
                    else => {
                        sdl_pc = 79;
                        continue;
                    },
                }
            },
            77 => {
                {
                    sdl_pc = 78;
                    continue;
                }
            },
            78 => {
                if (ih == @as(c_int, 2)) {
                    sdl_pc = 82;
                    continue;
                } else {
                    sdl_pc = 83;
                    continue;
                }
            },
            79 => {
                {
                    sdl_pc = 78;
                    continue;
                }
            },
            80 => {
                iq[@bitCast(@as(isize, @intCast(jz - @as(c_int, 1))))] &= 8388607;
                {
                    sdl_pc = 79;
                    continue;
                }
            },
            81 => {
                iq[@bitCast(@as(isize, @intCast(jz - @as(c_int, 1))))] &= 4194303;
                {
                    sdl_pc = 79;
                    continue;
                }
            },
            82 => {
                z = one - z;
                if (carry != @as(c_int, 0)) {
                    sdl_pc = 85;
                    continue;
                } else {
                    sdl_pc = 86;
                    continue;
                }
            },
            83 => {
                {
                    sdl_pc = 84;
                    continue;
                }
            },
            84 => {
                {
                    sdl_pc = 65;
                    continue;
                }
            },
            85 => {
                z -= SDL_uclibc_scalbn(one, q0);
                {
                    sdl_pc = 87;
                    continue;
                }
            },
            86 => {
                {
                    sdl_pc = 87;
                    continue;
                }
            },
            87 => {
                {
                    sdl_pc = 84;
                    continue;
                }
            },
            88 => {
                j = 0;
                i = jz - @as(c_int, 1);
                {
                    sdl_pc = 91;
                    continue;
                }
            },
            89 => {
                {
                    sdl_pc = 90;
                    continue;
                }
            },
            90 => {
                if (z == @as(f64, 0.0)) {
                    sdl_pc = 110;
                    continue;
                } else {
                    sdl_pc = 111;
                    continue;
                }
            },
            91 => {
                if (i >= jk) {
                    sdl_pc = 92;
                    continue;
                } else {
                    sdl_pc = 94;
                    continue;
                }
            },
            92 => {
                j |= iq[@bitCast(@as(isize, @intCast(i)))];
                {
                    sdl_pc = 93;
                    continue;
                }
            },
            93 => {
                i -= 1;
                {
                    sdl_pc = 91;
                    continue;
                }
            },
            94 => {
                if (j == @as(c_int, 0)) {
                    sdl_pc = 95;
                    continue;
                } else {
                    sdl_pc = 96;
                    continue;
                }
            },
            95 => {
                k = 1;
                {
                    sdl_pc = 98;
                    continue;
                }
            },
            96 => {
                {
                    sdl_pc = 97;
                    continue;
                }
            },
            97 => {
                {
                    sdl_pc = 90;
                    continue;
                }
            },
            98 => {
                if (iq[@bitCast(@as(isize, @intCast(jk - k)))] == @as(c_int, 0)) {
                    sdl_pc = 99;
                    continue;
                } else {
                    sdl_pc = 101;
                    continue;
                }
            },
            99 => {
                {
                    sdl_pc = 100;
                    continue;
                }
            },
            100 => {
                k += 1;
                {
                    sdl_pc = 98;
                    continue;
                }
            },
            101 => {
                i = jz + @as(c_int, 1);
                {
                    sdl_pc = 102;
                    continue;
                }
            },
            102 => {
                if (i <= (jz + k)) {
                    sdl_pc = 103;
                    continue;
                } else {
                    sdl_pc = 105;
                    continue;
                }
            },
            103 => {
                f[@bitCast(@as(isize, @intCast(jx + i)))] = @floatFromInt(ipio2[@bitCast(@as(isize, @intCast(jv + i)))]);
                fw = 0.0;
                {
                    sdl_pc = 106;
                    continue;
                }
            },
            104 => {
                i += 1;
                {
                    sdl_pc = 102;
                    continue;
                }
            },
            105 => {
                jz += k;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            106 => {
                if (j <= jx) {
                    sdl_pc = 107;
                    continue;
                } else {
                    sdl_pc = 109;
                    continue;
                }
            },
            107 => {
                fw += x[@bitCast(@as(isize, @intCast(j)))] * f[@bitCast(@as(isize, @intCast((jx + i) - j)))];
                {
                    sdl_pc = 108;
                    continue;
                }
            },
            108 => {
                j += 1;
                {
                    sdl_pc = 106;
                    continue;
                }
            },
            109 => {
                q[@bitCast(@as(isize, @intCast(i)))] = fw;
                {
                    sdl_pc = 104;
                    continue;
                }
            },
            110 => {
                jz -= 1;
                q0 -= 24;
                {
                    sdl_pc = 113;
                    continue;
                }
            },
            111 => {
                z = SDL_uclibc_scalbn(z, -q0);
                if (z >= two24) {
                    sdl_pc = 140;
                    continue;
                } else {
                    sdl_pc = 141;
                    continue;
                }
            },
            112 => {
                fw = SDL_uclibc_scalbn(one, q0);
                i = jz;
                {
                    sdl_pc = 143;
                    continue;
                }
            },
            113 => {
                {
                    sdl_pc = 116;
                    continue;
                }
            },
            114 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 113;
                    continue;
                } else {
                    sdl_pc = 115;
                    continue;
                }
            },
            115 => {
                {
                    sdl_pc = 125;
                    continue;
                }
            },
            116 => {
                if (!(jz >= @as(c_int, 0))) {
                    sdl_pc = 117;
                    continue;
                } else {
                    sdl_pc = 118;
                    continue;
                }
            },
            117 => {
                sdl_assert_state_4 = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data_3.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "k_rem_pio2.c", 255);
                if (sdl_assert_state_4 == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 119;
                    continue;
                } else {
                    sdl_pc = 120;
                    continue;
                }
            },
            118 => {
                {
                    sdl_pc = 114;
                    continue;
                }
            },
            119 => {
                {
                    sdl_pc = 116;
                    continue;
                }
            },
            120 => {
                if (sdl_assert_state_4 == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 122;
                    continue;
                } else {
                    sdl_pc = 123;
                    continue;
                }
            },
            121 => {
                {
                    sdl_pc = 118;
                    continue;
                }
            },
            122 => {
                __builtin.debugtrap();
                {
                    sdl_pc = 124;
                    continue;
                }
            },
            123 => {
                {
                    sdl_pc = 124;
                    continue;
                }
            },
            124 => {
                {
                    sdl_pc = 121;
                    continue;
                }
            },
            125 => {
                if (iq[@bitCast(@as(isize, @intCast(jz)))] == @as(c_int, 0)) {
                    sdl_pc = 126;
                    continue;
                } else {
                    sdl_pc = 127;
                    continue;
                }
            },
            126 => {
                jz -= 1;
                {
                    sdl_pc = 128;
                    continue;
                }
            },
            127 => {
                {
                    sdl_pc = 112;
                    continue;
                }
            },
            128 => {
                {
                    sdl_pc = 131;
                    continue;
                }
            },
            129 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 128;
                    continue;
                } else {
                    sdl_pc = 130;
                    continue;
                }
            },
            130 => {
                q0 -= 24;
                {
                    sdl_pc = 125;
                    continue;
                }
            },
            131 => {
                if (!(jz >= @as(c_int, 0))) {
                    sdl_pc = 132;
                    continue;
                } else {
                    sdl_pc = 133;
                    continue;
                }
            },
            132 => {
                sdl_assert_state_6 = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data_5.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "k_rem_pio2.c", 256);
                if (sdl_assert_state_6 == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 134;
                    continue;
                } else {
                    sdl_pc = 135;
                    continue;
                }
            },
            133 => {
                {
                    sdl_pc = 129;
                    continue;
                }
            },
            134 => {
                {
                    sdl_pc = 131;
                    continue;
                }
            },
            135 => {
                if (sdl_assert_state_6 == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 137;
                    continue;
                } else {
                    sdl_pc = 138;
                    continue;
                }
            },
            136 => {
                {
                    sdl_pc = 133;
                    continue;
                }
            },
            137 => {
                __builtin.debugtrap();
                {
                    sdl_pc = 139;
                    continue;
                }
            },
            138 => {
                {
                    sdl_pc = 139;
                    continue;
                }
            },
            139 => {
                {
                    sdl_pc = 136;
                    continue;
                }
            },
            140 => {
                fw = @floatFromInt(@as(i32, @intFromFloat(twon24 * z)));
                iq[@bitCast(@as(isize, @intCast(jz)))] = @intFromFloat(z - (two24 * fw));
                jz += 1;
                q0 += 24;
                iq[@bitCast(@as(isize, @intCast(jz)))] = @intFromFloat(fw);
                {
                    sdl_pc = 142;
                    continue;
                }
            },
            141 => {
                iq[@bitCast(@as(isize, @intCast(jz)))] = @intFromFloat(z);
                {
                    sdl_pc = 142;
                    continue;
                }
            },
            142 => {
                {
                    sdl_pc = 112;
                    continue;
                }
            },
            143 => {
                if (i >= @as(c_int, 0)) {
                    sdl_pc = 144;
                    continue;
                } else {
                    sdl_pc = 146;
                    continue;
                }
            },
            144 => {
                q[@bitCast(@as(isize, @intCast(i)))] = fw * @as(f64, @floatFromInt(iq[@bitCast(@as(isize, @intCast(i)))]));
                fw *= twon24;
                {
                    sdl_pc = 145;
                    continue;
                }
            },
            145 => {
                i -= 1;
                {
                    sdl_pc = 143;
                    continue;
                }
            },
            146 => {
                _ = memset(@ptrCast(@alignCast(&fq)), 0, @sizeOf(@TypeOf(fq)));
                i = jz;
                {
                    sdl_pc = 147;
                    continue;
                }
            },
            147 => {
                if (i >= @as(c_int, 0)) {
                    sdl_pc = 148;
                    continue;
                } else {
                    sdl_pc = 150;
                    continue;
                }
            },
            148 => {
                k = 0;
                {
                    sdl_pc = 151;
                    continue;
                }
            },
            149 => {
                i -= 1;
                {
                    sdl_pc = 147;
                    continue;
                }
            },
            150 => {
                switch (prec) {
                    @as(c_uint, 0) => {
                        sdl_pc = 156;
                        continue;
                    },
                    @as(c_uint, 1) => {
                        sdl_pc = 161;
                        continue;
                    },
                    @as(c_uint, 2) => {
                        sdl_pc = 162;
                        continue;
                    },
                    @as(c_uint, 3) => {
                        sdl_pc = 171;
                        continue;
                    },
                    else => {
                        sdl_pc = 155;
                        continue;
                    },
                }
            },
            151 => {
                if ((k <= jp) and (k <= (jz - i))) {
                    sdl_pc = 152;
                    continue;
                } else {
                    sdl_pc = 154;
                    continue;
                }
            },
            152 => {
                fw += PIo2[@bitCast(@as(isize, @intCast(k)))] * q[@bitCast(@as(isize, @intCast(i + k)))];
                {
                    sdl_pc = 153;
                    continue;
                }
            },
            153 => {
                k += 1;
                {
                    sdl_pc = 151;
                    continue;
                }
            },
            154 => {
                fq[@bitCast(@as(isize, @intCast(jz - i)))] = fw;
                {
                    sdl_pc = 149;
                    continue;
                }
            },
            155 => {
                return n & @as(c_int, 7);
            },
            156 => {
                fw = 0.0;
                i = jz;
                {
                    sdl_pc = 157;
                    continue;
                }
            },
            157 => {
                if (i >= @as(c_int, 0)) {
                    sdl_pc = 158;
                    continue;
                } else {
                    sdl_pc = 160;
                    continue;
                }
            },
            158 => {
                fw += fq[@bitCast(@as(isize, @intCast(i)))];
                {
                    sdl_pc = 159;
                    continue;
                }
            },
            159 => {
                i -= 1;
                {
                    sdl_pc = 157;
                    continue;
                }
            },
            160 => {
                y[@as(c_int, 0)] = if (ih == @as(c_int, 0)) fw else -fw;
                {
                    sdl_pc = 155;
                    continue;
                }
            },
            161 => {
                {
                    sdl_pc = 162;
                    continue;
                }
            },
            162 => {
                fw = 0.0;
                i = jz;
                {
                    sdl_pc = 163;
                    continue;
                }
            },
            163 => {
                if (i >= @as(c_int, 0)) {
                    sdl_pc = 164;
                    continue;
                } else {
                    sdl_pc = 166;
                    continue;
                }
            },
            164 => {
                fw += fq[@bitCast(@as(isize, @intCast(i)))];
                {
                    sdl_pc = 165;
                    continue;
                }
            },
            165 => {
                i -= 1;
                {
                    sdl_pc = 163;
                    continue;
                }
            },
            166 => {
                y[@as(c_int, 0)] = if (ih == @as(c_int, 0)) fw else -fw;
                fw = fq[@as(c_int, 0)] - fw;
                i = 1;
                {
                    sdl_pc = 167;
                    continue;
                }
            },
            167 => {
                if (i <= jz) {
                    sdl_pc = 168;
                    continue;
                } else {
                    sdl_pc = 170;
                    continue;
                }
            },
            168 => {
                fw += fq[@bitCast(@as(isize, @intCast(i)))];
                {
                    sdl_pc = 169;
                    continue;
                }
            },
            169 => {
                i += 1;
                {
                    sdl_pc = 167;
                    continue;
                }
            },
            170 => {
                y[@as(c_int, 1)] = if (ih == @as(c_int, 0)) fw else -fw;
                {
                    sdl_pc = 155;
                    continue;
                }
            },
            171 => {
                i = jz;
                {
                    sdl_pc = 172;
                    continue;
                }
            },
            172 => {
                if (i > @as(c_int, 0)) {
                    sdl_pc = 173;
                    continue;
                } else {
                    sdl_pc = 175;
                    continue;
                }
            },
            173 => {
                fw = fq[@bitCast(@as(isize, @intCast(i - @as(c_int, 1))))] + fq[@bitCast(@as(isize, @intCast(i)))];
                fq[@bitCast(@as(isize, @intCast(i)))] += fq[@bitCast(@as(isize, @intCast(i - @as(c_int, 1))))] - fw;
                fq[@bitCast(@as(isize, @intCast(i - @as(c_int, 1))))] = fw;
                {
                    sdl_pc = 174;
                    continue;
                }
            },
            174 => {
                i -= 1;
                {
                    sdl_pc = 172;
                    continue;
                }
            },
            175 => {
                i = jz;
                {
                    sdl_pc = 176;
                    continue;
                }
            },
            176 => {
                if (i > @as(c_int, 1)) {
                    sdl_pc = 177;
                    continue;
                } else {
                    sdl_pc = 179;
                    continue;
                }
            },
            177 => {
                fw = fq[@bitCast(@as(isize, @intCast(i - @as(c_int, 1))))] + fq[@bitCast(@as(isize, @intCast(i)))];
                fq[@bitCast(@as(isize, @intCast(i)))] += fq[@bitCast(@as(isize, @intCast(i - @as(c_int, 1))))] - fw;
                fq[@bitCast(@as(isize, @intCast(i - @as(c_int, 1))))] = fw;
                {
                    sdl_pc = 178;
                    continue;
                }
            },
            178 => {
                i -= 1;
                {
                    sdl_pc = 176;
                    continue;
                }
            },
            179 => {
                i = jz;
                {
                    sdl_pc = 180;
                    continue;
                }
            },
            180 => {
                if (i >= @as(c_int, 2)) {
                    sdl_pc = 181;
                    continue;
                } else {
                    sdl_pc = 183;
                    continue;
                }
            },
            181 => {
                fw += fq[@bitCast(@as(isize, @intCast(i)))];
                {
                    sdl_pc = 182;
                    continue;
                }
            },
            182 => {
                i -= 1;
                {
                    sdl_pc = 180;
                    continue;
                }
            },
            183 => {
                if (ih == @as(c_int, 0)) {
                    sdl_pc = 184;
                    continue;
                } else {
                    sdl_pc = 185;
                    continue;
                }
            },
            184 => {
                y[@as(c_int, 0)] = fq[@as(c_int, 0)];
                y[@as(c_int, 1)] = fq[@as(c_int, 1)];
                y[@as(c_int, 2)] = fw;
                {
                    sdl_pc = 186;
                    continue;
                }
            },
            185 => {
                y[@as(c_int, 0)] = -fq[@as(c_int, 0)];
                y[@as(c_int, 1)] = -fq[@as(c_int, 1)];
                y[@as(c_int, 2)] = -fw;
                {
                    sdl_pc = 186;
                    continue;
                }
            },
            186 => {
                {
                    sdl_pc = 155;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}

pub const @"false" = @as(c_int, 0);
