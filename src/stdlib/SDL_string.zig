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
pub const __builtin = @import("translation_builtins");
pub const __helpers = @import("std").zig.c_translation.helpers;
pub const wchar_t = c_int;
pub const struct___va_list_tag_2 = extern struct {
    unnamed_0: c_uint = 0,
    unnamed_1: c_uint = 0,
    unnamed_2: ?*anyopaque = null,
    unnamed_3: ?*anyopaque = null,
};
pub const __builtin_va_list = [1]struct___va_list_tag_2;
pub const va_list = __builtin_va_list;
pub extern fn vsnprintf(noalias __s: [*c]u8, __maxlen: usize, noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag_2) c_int;
pub extern fn vsscanf(noalias __s: [*c]const u8, noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag_2) c_int;
pub extern fn atof(__nptr: [*c]const u8) f64;
pub extern fn atoi(__nptr: [*c]const u8) c_int;
pub extern fn strtod(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8) f64;
pub extern fn strtol(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __base: c_int) c_long;
pub extern fn strtoul(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __base: c_int) c_ulong;
pub extern fn strtoll(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __base: c_int) c_longlong;
pub extern fn strtoull(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __base: c_int) c_ulonglong;
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memcmp(__s1: ?*const anyopaque, __s2: ?*const anyopaque, __n: usize) c_int;
pub extern fn strcmp(__s1: [*c]const u8, __s2: [*c]const u8) c_int;
pub extern fn strncmp(__s1: [*c]const u8, __s2: [*c]const u8, __n: usize) c_int;
pub extern fn strchr(__s: [*c]const u8, __c: c_int) [*c]u8;
pub extern fn strrchr(__s: [*c]const u8, __c: c_int) [*c]u8;
pub extern fn strpbrk(__s: [*c]const u8, __accept: [*c]const u8) [*c]u8;
pub extern fn strstr(__haystack: [*c]const u8, __needle: [*c]const u8) [*c]u8;
pub extern fn strlen(__s: [*c]const u8) usize;
pub extern fn strnlen(__string: [*c]const u8, __maxlen: usize) usize;
pub extern fn strlcpy(noalias __dest: [*c]u8, noalias __src: [*c]const u8, __n: usize) usize;
pub extern fn strlcat(noalias __dest: [*c]u8, noalias __src: [*c]const u8, __n: usize) usize;
pub extern fn wcslcpy(noalias __dest: [*c]wchar_t, noalias __src: [*c]const wchar_t, __n: usize) usize;
pub extern fn wcslcat(noalias __dest: [*c]wchar_t, noalias __src: [*c]const wchar_t, __n: usize) usize;
pub extern fn wcscmp(__s1: [*c]const wchar_t, __s2: [*c]const wchar_t) c_int;
pub extern fn wcsncmp(__s1: [*c]const wchar_t, __s2: [*c]const wchar_t, __n: usize) c_int;
pub extern fn wcsstr(__haystack: [*c]const wchar_t, __needle: [*c]const wchar_t) [*c]wchar_t;
pub extern fn wcslen(__s: [*c]const wchar_t) usize;
pub extern fn wcsnlen(__s: [*c]const wchar_t, __maxlen: usize) usize;
pub extern fn wcstol(noalias __nptr: [*c]const wchar_t, noalias __endptr: [*c][*c]wchar_t, __base: c_int) c_long;
pub extern fn wcstoul(noalias __nptr: [*c]const wchar_t, noalias __endptr: [*c][*c]wchar_t, __base: c_int) c_ulong;
pub extern fn wcstoll(noalias __nptr: [*c]const wchar_t, noalias __endptr: [*c][*c]wchar_t, __base: c_int) c_longlong;
pub extern fn wcstoull(noalias __nptr: [*c]const wchar_t, noalias __endptr: [*c][*c]wchar_t, __base: c_int) c_ulonglong;
pub const Uint8 = u8;
pub const Uint16 = u16;
pub const Uint32 = u32;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_realloc_REAL(mem: ?*anyopaque, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_toupper_REAL(x: c_int) c_int;
pub extern fn SDL_tolower_REAL(x: c_int) c_int;
pub extern fn SDL_iconv_string_REAL(tocode: [*c]const u8, fromcode: [*c]const u8, inbuf: [*c]const u8, inbytesleft: usize) [*c]u8;
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
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const struct_CaseFoldMapping1_32 = extern struct {
    from: Uint32 = 0,
    to0: Uint32 = 0,
};
pub const CaseFoldMapping1_32 = struct_CaseFoldMapping1_32;
pub const struct_CaseFoldMapping1_16 = extern struct {
    from: Uint16 = 0,
    to0: Uint16 = 0,
};
pub const CaseFoldMapping1_16 = struct_CaseFoldMapping1_16;
pub const struct_CaseFoldMapping2_16 = extern struct {
    from: Uint16 = 0,
    to0: Uint16 = 0,
    to1: Uint16 = 0,
};
pub const CaseFoldMapping2_16 = struct_CaseFoldMapping2_16;
pub const struct_CaseFoldMapping3_16 = extern struct {
    from: Uint16 = 0,
    to0: Uint16 = 0,
    to1: Uint16 = 0,
    to2: Uint16 = 0,
};
pub const CaseFoldMapping3_16 = struct_CaseFoldMapping3_16;
pub const struct_CaseFoldHashBucket1_16 = extern struct {
    list: [*c]const CaseFoldMapping1_16 = null,
    count: Uint8 = 0,
};
pub const CaseFoldHashBucket1_16 = struct_CaseFoldHashBucket1_16;
pub const struct_CaseFoldHashBucket1_32 = extern struct {
    list: [*c]const CaseFoldMapping1_32 = null,
    count: Uint8 = 0,
};
pub const CaseFoldHashBucket1_32 = struct_CaseFoldHashBucket1_32;
pub const struct_CaseFoldHashBucket2_16 = extern struct {
    list: [*c]const CaseFoldMapping2_16 = null,
    count: Uint8 = 0,
};
pub const CaseFoldHashBucket2_16 = struct_CaseFoldHashBucket2_16;
pub const struct_CaseFoldHashBucket3_16 = extern struct {
    list: [*c]const CaseFoldMapping3_16 = null,
    count: Uint8 = 0,
};
pub const CaseFoldHashBucket3_16 = struct_CaseFoldHashBucket3_16;
pub const case_fold1_16_000: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 514,
        .to0 = 515,
    },
    CaseFoldMapping1_16{
        .from = 1028,
        .to0 = 1108,
    },
    CaseFoldMapping1_16{
        .from = 7710,
        .to0 = 7711,
    },
    CaseFoldMapping1_16{
        .from = 11308,
        .to0 = 11356,
    },
    CaseFoldMapping1_16{
        .from = 43947,
        .to0 = 5083,
    },
};
pub const case_fold1_16_001: [6]CaseFoldMapping1_16 = [6]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 256,
        .to0 = 257,
    },
    CaseFoldMapping1_16{
        .from = 1029,
        .to0 = 1109,
    },
    CaseFoldMapping1_16{
        .from = 1284,
        .to0 = 1285,
    },
    CaseFoldMapping1_16{
        .from = 11309,
        .to0 = 11357,
    },
    CaseFoldMapping1_16{
        .from = 42918,
        .to0 = 42919,
    },
    CaseFoldMapping1_16{
        .from = 43946,
        .to0 = 5082,
    },
};
pub const case_fold1_16_002: [6]CaseFoldMapping1_16 = [6]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 512,
        .to0 = 513,
    },
    CaseFoldMapping1_16{
        .from = 1030,
        .to0 = 1110,
    },
    CaseFoldMapping1_16{
        .from = 7708,
        .to0 = 7709,
    },
    CaseFoldMapping1_16{
        .from = 7965,
        .to0 = 7957,
    },
    CaseFoldMapping1_16{
        .from = 11310,
        .to0 = 11358,
    },
    CaseFoldMapping1_16{
        .from = 43945,
        .to0 = 5081,
    },
};
pub const case_fold1_16_003: [7]CaseFoldMapping1_16 = [7]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 258,
        .to0 = 259,
    },
    CaseFoldMapping1_16{
        .from = 1031,
        .to0 = 1111,
    },
    CaseFoldMapping1_16{
        .from = 1286,
        .to0 = 1287,
    },
    CaseFoldMapping1_16{
        .from = 7964,
        .to0 = 7956,
    },
    CaseFoldMapping1_16{
        .from = 11311,
        .to0 = 11359,
    },
    CaseFoldMapping1_16{
        .from = 42916,
        .to0 = 42917,
    },
    CaseFoldMapping1_16{
        .from = 43944,
        .to0 = 5080,
    },
};
pub const case_fold1_16_004: [6]CaseFoldMapping1_16 = [6]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 518,
        .to0 = 519,
    },
    CaseFoldMapping1_16{
        .from = 1024,
        .to0 = 1104,
    },
    CaseFoldMapping1_16{
        .from = 7706,
        .to0 = 7707,
    },
    CaseFoldMapping1_16{
        .from = 7963,
        .to0 = 7955,
    },
    CaseFoldMapping1_16{
        .from = 11304,
        .to0 = 11352,
    },
    CaseFoldMapping1_16{
        .from = 43951,
        .to0 = 5087,
    },
};
pub const case_fold1_16_005: [7]CaseFoldMapping1_16 = [7]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 260,
        .to0 = 261,
    },
    CaseFoldMapping1_16{
        .from = 1025,
        .to0 = 1105,
    },
    CaseFoldMapping1_16{
        .from = 1280,
        .to0 = 1281,
    },
    CaseFoldMapping1_16{
        .from = 7962,
        .to0 = 7954,
    },
    CaseFoldMapping1_16{
        .from = 11305,
        .to0 = 11353,
    },
    CaseFoldMapping1_16{
        .from = 42914,
        .to0 = 42915,
    },
    CaseFoldMapping1_16{
        .from = 43950,
        .to0 = 5086,
    },
};
pub const case_fold1_16_006: [6]CaseFoldMapping1_16 = [6]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 516,
        .to0 = 517,
    },
    CaseFoldMapping1_16{
        .from = 1026,
        .to0 = 1106,
    },
    CaseFoldMapping1_16{
        .from = 7704,
        .to0 = 7705,
    },
    CaseFoldMapping1_16{
        .from = 7961,
        .to0 = 7953,
    },
    CaseFoldMapping1_16{
        .from = 11306,
        .to0 = 11354,
    },
    CaseFoldMapping1_16{
        .from = 43949,
        .to0 = 5085,
    },
};
pub const case_fold1_16_007: [8]CaseFoldMapping1_16 = [8]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 262,
        .to0 = 263,
    },
    CaseFoldMapping1_16{
        .from = 1027,
        .to0 = 1107,
    },
    CaseFoldMapping1_16{
        .from = 1282,
        .to0 = 1283,
    },
    CaseFoldMapping1_16{
        .from = 7960,
        .to0 = 7952,
    },
    CaseFoldMapping1_16{
        .from = 8486,
        .to0 = 969,
    },
    CaseFoldMapping1_16{
        .from = 11307,
        .to0 = 11355,
    },
    CaseFoldMapping1_16{
        .from = 42912,
        .to0 = 42913,
    },
    CaseFoldMapping1_16{
        .from = 43948,
        .to0 = 5084,
    },
};
pub const case_fold1_16_008: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 522,
        .to0 = 523,
    },
    CaseFoldMapping1_16{
        .from = 1036,
        .to0 = 1116,
    },
    CaseFoldMapping1_16{
        .from = 7702,
        .to0 = 7703,
    },
    CaseFoldMapping1_16{
        .from = 11300,
        .to0 = 11348,
    },
    CaseFoldMapping1_16{
        .from = 43939,
        .to0 = 5075,
    },
};
pub const case_fold1_16_009: [6]CaseFoldMapping1_16 = [6]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 264,
        .to0 = 265,
    },
    CaseFoldMapping1_16{
        .from = 1037,
        .to0 = 1117,
    },
    CaseFoldMapping1_16{
        .from = 1292,
        .to0 = 1293,
    },
    CaseFoldMapping1_16{
        .from = 11301,
        .to0 = 11349,
    },
    CaseFoldMapping1_16{
        .from = 42926,
        .to0 = 618,
    },
    CaseFoldMapping1_16{
        .from = 43938,
        .to0 = 5074,
    },
};
pub const case_fold1_16_010: [7]CaseFoldMapping1_16 = [7]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 520,
        .to0 = 521,
    },
    CaseFoldMapping1_16{
        .from = 1038,
        .to0 = 1118,
    },
    CaseFoldMapping1_16{
        .from = 7700,
        .to0 = 7701,
    },
    CaseFoldMapping1_16{
        .from = 8491,
        .to0 = 229,
    },
    CaseFoldMapping1_16{
        .from = 11302,
        .to0 = 11350,
    },
    CaseFoldMapping1_16{
        .from = 42925,
        .to0 = 620,
    },
    CaseFoldMapping1_16{
        .from = 43937,
        .to0 = 5073,
    },
};
pub const case_fold1_16_011: [7]CaseFoldMapping1_16 = [7]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 266,
        .to0 = 267,
    },
    CaseFoldMapping1_16{
        .from = 1039,
        .to0 = 1119,
    },
    CaseFoldMapping1_16{
        .from = 1294,
        .to0 = 1295,
    },
    CaseFoldMapping1_16{
        .from = 8490,
        .to0 = 107,
    },
    CaseFoldMapping1_16{
        .from = 11303,
        .to0 = 11351,
    },
    CaseFoldMapping1_16{
        .from = 42924,
        .to0 = 609,
    },
    CaseFoldMapping1_16{
        .from = 43936,
        .to0 = 5072,
    },
};
pub const case_fold1_16_012: [6]CaseFoldMapping1_16 = [6]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 526,
        .to0 = 527,
    },
    CaseFoldMapping1_16{
        .from = 1032,
        .to0 = 1112,
    },
    CaseFoldMapping1_16{
        .from = 7698,
        .to0 = 7699,
    },
    CaseFoldMapping1_16{
        .from = 11296,
        .to0 = 11344,
    },
    CaseFoldMapping1_16{
        .from = 42923,
        .to0 = 604,
    },
    CaseFoldMapping1_16{
        .from = 43943,
        .to0 = 5079,
    },
};
pub const case_fold1_16_013: [6]CaseFoldMapping1_16 = [6]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 268,
        .to0 = 269,
    },
    CaseFoldMapping1_16{
        .from = 1033,
        .to0 = 1113,
    },
    CaseFoldMapping1_16{
        .from = 1288,
        .to0 = 1289,
    },
    CaseFoldMapping1_16{
        .from = 11297,
        .to0 = 11345,
    },
    CaseFoldMapping1_16{
        .from = 42922,
        .to0 = 614,
    },
    CaseFoldMapping1_16{
        .from = 43942,
        .to0 = 5078,
    },
};
pub const case_fold1_16_014: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 524,
        .to0 = 525,
    },
    CaseFoldMapping1_16{
        .from = 1034,
        .to0 = 1114,
    },
    CaseFoldMapping1_16{
        .from = 7696,
        .to0 = 7697,
    },
    CaseFoldMapping1_16{
        .from = 11298,
        .to0 = 11346,
    },
    CaseFoldMapping1_16{
        .from = 43941,
        .to0 = 5077,
    },
};
pub const case_fold1_16_015: [6]CaseFoldMapping1_16 = [6]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 270,
        .to0 = 271,
    },
    CaseFoldMapping1_16{
        .from = 1035,
        .to0 = 1115,
    },
    CaseFoldMapping1_16{
        .from = 1290,
        .to0 = 1291,
    },
    CaseFoldMapping1_16{
        .from = 11299,
        .to0 = 11347,
    },
    CaseFoldMapping1_16{
        .from = 42920,
        .to0 = 42921,
    },
    CaseFoldMapping1_16{
        .from = 43940,
        .to0 = 5076,
    },
};
pub const case_fold1_16_016: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 530,
        .to0 = 531,
    },
    CaseFoldMapping1_16{
        .from = 1044,
        .to0 = 1076,
    },
    CaseFoldMapping1_16{
        .from = 7694,
        .to0 = 7695,
    },
    CaseFoldMapping1_16{
        .from = 7951,
        .to0 = 7943,
    },
    CaseFoldMapping1_16{
        .from = 43963,
        .to0 = 5099,
    },
};
pub const case_fold1_16_017: [6]CaseFoldMapping1_16 = [6]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 272,
        .to0 = 273,
    },
    CaseFoldMapping1_16{
        .from = 1045,
        .to0 = 1077,
    },
    CaseFoldMapping1_16{
        .from = 1300,
        .to0 = 1301,
    },
    CaseFoldMapping1_16{
        .from = 7950,
        .to0 = 7942,
    },
    CaseFoldMapping1_16{
        .from = 42934,
        .to0 = 42935,
    },
    CaseFoldMapping1_16{
        .from = 43962,
        .to0 = 5098,
    },
};
pub const case_fold1_16_018: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 528,
        .to0 = 529,
    },
    CaseFoldMapping1_16{
        .from = 1046,
        .to0 = 1078,
    },
    CaseFoldMapping1_16{
        .from = 7692,
        .to0 = 7693,
    },
    CaseFoldMapping1_16{
        .from = 7949,
        .to0 = 7941,
    },
    CaseFoldMapping1_16{
        .from = 43961,
        .to0 = 5097,
    },
};
pub const case_fold1_16_019: [7]CaseFoldMapping1_16 = [7]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 274,
        .to0 = 275,
    },
    CaseFoldMapping1_16{
        .from = 1047,
        .to0 = 1079,
    },
    CaseFoldMapping1_16{
        .from = 1302,
        .to0 = 1303,
    },
    CaseFoldMapping1_16{
        .from = 7948,
        .to0 = 7940,
    },
    CaseFoldMapping1_16{
        .from = 8498,
        .to0 = 8526,
    },
    CaseFoldMapping1_16{
        .from = 42932,
        .to0 = 42933,
    },
    CaseFoldMapping1_16{
        .from = 43960,
        .to0 = 5096,
    },
};
pub const case_fold1_16_020: [6]CaseFoldMapping1_16 = [6]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 534,
        .to0 = 535,
    },
    CaseFoldMapping1_16{
        .from = 1040,
        .to0 = 1072,
    },
    CaseFoldMapping1_16{
        .from = 7690,
        .to0 = 7691,
    },
    CaseFoldMapping1_16{
        .from = 7947,
        .to0 = 7939,
    },
    CaseFoldMapping1_16{
        .from = 42931,
        .to0 = 43859,
    },
    CaseFoldMapping1_16{
        .from = 43967,
        .to0 = 5103,
    },
};
pub const case_fold1_16_021: [6]CaseFoldMapping1_16 = [6]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 276,
        .to0 = 277,
    },
    CaseFoldMapping1_16{
        .from = 1041,
        .to0 = 1073,
    },
    CaseFoldMapping1_16{
        .from = 1296,
        .to0 = 1297,
    },
    CaseFoldMapping1_16{
        .from = 7946,
        .to0 = 7938,
    },
    CaseFoldMapping1_16{
        .from = 42930,
        .to0 = 669,
    },
    CaseFoldMapping1_16{
        .from = 43966,
        .to0 = 5102,
    },
};
pub const case_fold1_16_022: [6]CaseFoldMapping1_16 = [6]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 532,
        .to0 = 533,
    },
    CaseFoldMapping1_16{
        .from = 1042,
        .to0 = 1074,
    },
    CaseFoldMapping1_16{
        .from = 7688,
        .to0 = 7689,
    },
    CaseFoldMapping1_16{
        .from = 7945,
        .to0 = 7937,
    },
    CaseFoldMapping1_16{
        .from = 42929,
        .to0 = 647,
    },
    CaseFoldMapping1_16{
        .from = 43965,
        .to0 = 5101,
    },
};
pub const case_fold1_16_023: [6]CaseFoldMapping1_16 = [6]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 278,
        .to0 = 279,
    },
    CaseFoldMapping1_16{
        .from = 1043,
        .to0 = 1075,
    },
    CaseFoldMapping1_16{
        .from = 1298,
        .to0 = 1299,
    },
    CaseFoldMapping1_16{
        .from = 7944,
        .to0 = 7936,
    },
    CaseFoldMapping1_16{
        .from = 42928,
        .to0 = 670,
    },
    CaseFoldMapping1_16{
        .from = 43964,
        .to0 = 5100,
    },
};
pub const case_fold1_16_024: [4]CaseFoldMapping1_16 = [4]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 538,
        .to0 = 539,
    },
    CaseFoldMapping1_16{
        .from = 1052,
        .to0 = 1084,
    },
    CaseFoldMapping1_16{
        .from = 7686,
        .to0 = 7687,
    },
    CaseFoldMapping1_16{
        .from = 43955,
        .to0 = 5091,
    },
};
pub const case_fold1_16_025: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 280,
        .to0 = 281,
    },
    CaseFoldMapping1_16{
        .from = 1053,
        .to0 = 1085,
    },
    CaseFoldMapping1_16{
        .from = 1308,
        .to0 = 1309,
    },
    CaseFoldMapping1_16{
        .from = 42942,
        .to0 = 42943,
    },
    CaseFoldMapping1_16{
        .from = 43954,
        .to0 = 5090,
    },
};
pub const case_fold1_16_026: [4]CaseFoldMapping1_16 = [4]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 536,
        .to0 = 537,
    },
    CaseFoldMapping1_16{
        .from = 1054,
        .to0 = 1086,
    },
    CaseFoldMapping1_16{
        .from = 7684,
        .to0 = 7685,
    },
    CaseFoldMapping1_16{
        .from = 43953,
        .to0 = 5089,
    },
};
pub const case_fold1_16_027: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 282,
        .to0 = 283,
    },
    CaseFoldMapping1_16{
        .from = 1055,
        .to0 = 1087,
    },
    CaseFoldMapping1_16{
        .from = 1310,
        .to0 = 1311,
    },
    CaseFoldMapping1_16{
        .from = 42940,
        .to0 = 42941,
    },
    CaseFoldMapping1_16{
        .from = 43952,
        .to0 = 5088,
    },
};
pub const case_fold1_16_028: [4]CaseFoldMapping1_16 = [4]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 542,
        .to0 = 543,
    },
    CaseFoldMapping1_16{
        .from = 1048,
        .to0 = 1080,
    },
    CaseFoldMapping1_16{
        .from = 7682,
        .to0 = 7683,
    },
    CaseFoldMapping1_16{
        .from = 43959,
        .to0 = 5095,
    },
};
pub const case_fold1_16_029: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 284,
        .to0 = 285,
    },
    CaseFoldMapping1_16{
        .from = 1049,
        .to0 = 1081,
    },
    CaseFoldMapping1_16{
        .from = 1304,
        .to0 = 1305,
    },
    CaseFoldMapping1_16{
        .from = 42938,
        .to0 = 42939,
    },
    CaseFoldMapping1_16{
        .from = 43958,
        .to0 = 5094,
    },
};
pub const case_fold1_16_030: [4]CaseFoldMapping1_16 = [4]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 540,
        .to0 = 541,
    },
    CaseFoldMapping1_16{
        .from = 1050,
        .to0 = 1082,
    },
    CaseFoldMapping1_16{
        .from = 7680,
        .to0 = 7681,
    },
    CaseFoldMapping1_16{
        .from = 43957,
        .to0 = 5093,
    },
};
pub const case_fold1_16_031: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 286,
        .to0 = 287,
    },
    CaseFoldMapping1_16{
        .from = 1051,
        .to0 = 1083,
    },
    CaseFoldMapping1_16{
        .from = 1306,
        .to0 = 1307,
    },
    CaseFoldMapping1_16{
        .from = 42936,
        .to0 = 42937,
    },
    CaseFoldMapping1_16{
        .from = 43956,
        .to0 = 5092,
    },
};
pub const case_fold1_16_032: [7]CaseFoldMapping1_16 = [7]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 546,
        .to0 = 547,
    },
    CaseFoldMapping1_16{
        .from = 1060,
        .to0 = 1092,
    },
    CaseFoldMapping1_16{
        .from = 7742,
        .to0 = 7743,
    },
    CaseFoldMapping1_16{
        .from = 7999,
        .to0 = 7991,
    },
    CaseFoldMapping1_16{
        .from = 11276,
        .to0 = 11324,
    },
    CaseFoldMapping1_16{
        .from = 42630,
        .to0 = 42631,
    },
    CaseFoldMapping1_16{
        .from = 43915,
        .to0 = 5051,
    },
};
pub const case_fold1_16_033: [7]CaseFoldMapping1_16 = [7]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 288,
        .to0 = 289,
    },
    CaseFoldMapping1_16{
        .from = 1061,
        .to0 = 1093,
    },
    CaseFoldMapping1_16{
        .from = 1316,
        .to0 = 1317,
    },
    CaseFoldMapping1_16{
        .from = 7998,
        .to0 = 7990,
    },
    CaseFoldMapping1_16{
        .from = 11277,
        .to0 = 11325,
    },
    CaseFoldMapping1_16{
        .from = 42886,
        .to0 = 42887,
    },
    CaseFoldMapping1_16{
        .from = 43914,
        .to0 = 5050,
    },
};
pub const case_fold1_16_034: [7]CaseFoldMapping1_16 = [7]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 544,
        .to0 = 414,
    },
    CaseFoldMapping1_16{
        .from = 1062,
        .to0 = 1094,
    },
    CaseFoldMapping1_16{
        .from = 7740,
        .to0 = 7741,
    },
    CaseFoldMapping1_16{
        .from = 7997,
        .to0 = 7989,
    },
    CaseFoldMapping1_16{
        .from = 11278,
        .to0 = 11326,
    },
    CaseFoldMapping1_16{
        .from = 42628,
        .to0 = 42629,
    },
    CaseFoldMapping1_16{
        .from = 43913,
        .to0 = 5049,
    },
};
pub const case_fold1_16_035: [7]CaseFoldMapping1_16 = [7]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 290,
        .to0 = 291,
    },
    CaseFoldMapping1_16{
        .from = 1063,
        .to0 = 1095,
    },
    CaseFoldMapping1_16{
        .from = 1318,
        .to0 = 1319,
    },
    CaseFoldMapping1_16{
        .from = 7996,
        .to0 = 7988,
    },
    CaseFoldMapping1_16{
        .from = 11279,
        .to0 = 11327,
    },
    CaseFoldMapping1_16{
        .from = 42884,
        .to0 = 42885,
    },
    CaseFoldMapping1_16{
        .from = 43912,
        .to0 = 5048,
    },
};
pub const case_fold1_16_036: [7]CaseFoldMapping1_16 = [7]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 550,
        .to0 = 551,
    },
    CaseFoldMapping1_16{
        .from = 1056,
        .to0 = 1088,
    },
    CaseFoldMapping1_16{
        .from = 7738,
        .to0 = 7739,
    },
    CaseFoldMapping1_16{
        .from = 7995,
        .to0 = 7987,
    },
    CaseFoldMapping1_16{
        .from = 11272,
        .to0 = 11320,
    },
    CaseFoldMapping1_16{
        .from = 42626,
        .to0 = 42627,
    },
    CaseFoldMapping1_16{
        .from = 43919,
        .to0 = 5055,
    },
};
pub const case_fold1_16_037: [7]CaseFoldMapping1_16 = [7]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 292,
        .to0 = 293,
    },
    CaseFoldMapping1_16{
        .from = 1057,
        .to0 = 1089,
    },
    CaseFoldMapping1_16{
        .from = 1312,
        .to0 = 1313,
    },
    CaseFoldMapping1_16{
        .from = 7994,
        .to0 = 7986,
    },
    CaseFoldMapping1_16{
        .from = 11273,
        .to0 = 11321,
    },
    CaseFoldMapping1_16{
        .from = 42882,
        .to0 = 42883,
    },
    CaseFoldMapping1_16{
        .from = 43918,
        .to0 = 5054,
    },
};
pub const case_fold1_16_038: [7]CaseFoldMapping1_16 = [7]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 548,
        .to0 = 549,
    },
    CaseFoldMapping1_16{
        .from = 1058,
        .to0 = 1090,
    },
    CaseFoldMapping1_16{
        .from = 7736,
        .to0 = 7737,
    },
    CaseFoldMapping1_16{
        .from = 7993,
        .to0 = 7985,
    },
    CaseFoldMapping1_16{
        .from = 11274,
        .to0 = 11322,
    },
    CaseFoldMapping1_16{
        .from = 42624,
        .to0 = 42625,
    },
    CaseFoldMapping1_16{
        .from = 43917,
        .to0 = 5053,
    },
};
pub const case_fold1_16_039: [7]CaseFoldMapping1_16 = [7]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 294,
        .to0 = 295,
    },
    CaseFoldMapping1_16{
        .from = 1059,
        .to0 = 1091,
    },
    CaseFoldMapping1_16{
        .from = 1314,
        .to0 = 1315,
    },
    CaseFoldMapping1_16{
        .from = 7992,
        .to0 = 7984,
    },
    CaseFoldMapping1_16{
        .from = 11275,
        .to0 = 11323,
    },
    CaseFoldMapping1_16{
        .from = 42880,
        .to0 = 42881,
    },
    CaseFoldMapping1_16{
        .from = 43916,
        .to0 = 5052,
    },
};
pub const case_fold1_16_040: [6]CaseFoldMapping1_16 = [6]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 554,
        .to0 = 555,
    },
    CaseFoldMapping1_16{
        .from = 1068,
        .to0 = 1100,
    },
    CaseFoldMapping1_16{
        .from = 7734,
        .to0 = 7735,
    },
    CaseFoldMapping1_16{
        .from = 11268,
        .to0 = 11316,
    },
    CaseFoldMapping1_16{
        .from = 42638,
        .to0 = 42639,
    },
    CaseFoldMapping1_16{
        .from = 43907,
        .to0 = 5043,
    },
};
pub const case_fold1_16_041: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 296,
        .to0 = 297,
    },
    CaseFoldMapping1_16{
        .from = 1069,
        .to0 = 1101,
    },
    CaseFoldMapping1_16{
        .from = 1324,
        .to0 = 1325,
    },
    CaseFoldMapping1_16{
        .from = 11269,
        .to0 = 11317,
    },
    CaseFoldMapping1_16{
        .from = 43906,
        .to0 = 5042,
    },
};
pub const case_fold1_16_042: [7]CaseFoldMapping1_16 = [7]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 552,
        .to0 = 553,
    },
    CaseFoldMapping1_16{
        .from = 1070,
        .to0 = 1102,
    },
    CaseFoldMapping1_16{
        .from = 7732,
        .to0 = 7733,
    },
    CaseFoldMapping1_16{
        .from = 11270,
        .to0 = 11318,
    },
    CaseFoldMapping1_16{
        .from = 42636,
        .to0 = 42637,
    },
    CaseFoldMapping1_16{
        .from = 42893,
        .to0 = 613,
    },
    CaseFoldMapping1_16{
        .from = 43905,
        .to0 = 5041,
    },
};
pub const case_fold1_16_043: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 298,
        .to0 = 299,
    },
    CaseFoldMapping1_16{
        .from = 1071,
        .to0 = 1103,
    },
    CaseFoldMapping1_16{
        .from = 1326,
        .to0 = 1327,
    },
    CaseFoldMapping1_16{
        .from = 11271,
        .to0 = 11319,
    },
    CaseFoldMapping1_16{
        .from = 43904,
        .to0 = 5040,
    },
};
pub const case_fold1_16_044: [7]CaseFoldMapping1_16 = [7]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 558,
        .to0 = 559,
    },
    CaseFoldMapping1_16{
        .from = 1064,
        .to0 = 1096,
    },
    CaseFoldMapping1_16{
        .from = 7730,
        .to0 = 7731,
    },
    CaseFoldMapping1_16{
        .from = 11264,
        .to0 = 11312,
    },
    CaseFoldMapping1_16{
        .from = 42634,
        .to0 = 42635,
    },
    CaseFoldMapping1_16{
        .from = 42891,
        .to0 = 42892,
    },
    CaseFoldMapping1_16{
        .from = 43911,
        .to0 = 5047,
    },
};
pub const case_fold1_16_045: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 300,
        .to0 = 301,
    },
    CaseFoldMapping1_16{
        .from = 1065,
        .to0 = 1097,
    },
    CaseFoldMapping1_16{
        .from = 1320,
        .to0 = 1321,
    },
    CaseFoldMapping1_16{
        .from = 11265,
        .to0 = 11313,
    },
    CaseFoldMapping1_16{
        .from = 43910,
        .to0 = 5046,
    },
};
pub const case_fold1_16_046: [6]CaseFoldMapping1_16 = [6]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 556,
        .to0 = 557,
    },
    CaseFoldMapping1_16{
        .from = 1066,
        .to0 = 1098,
    },
    CaseFoldMapping1_16{
        .from = 7728,
        .to0 = 7729,
    },
    CaseFoldMapping1_16{
        .from = 11266,
        .to0 = 11314,
    },
    CaseFoldMapping1_16{
        .from = 42632,
        .to0 = 42633,
    },
    CaseFoldMapping1_16{
        .from = 43909,
        .to0 = 5045,
    },
};
pub const case_fold1_16_047: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 302,
        .to0 = 303,
    },
    CaseFoldMapping1_16{
        .from = 1067,
        .to0 = 1099,
    },
    CaseFoldMapping1_16{
        .from = 1322,
        .to0 = 1323,
    },
    CaseFoldMapping1_16{
        .from = 11267,
        .to0 = 11315,
    },
    CaseFoldMapping1_16{
        .from = 43908,
        .to0 = 5044,
    },
};
pub const case_fold1_16_048: [7]CaseFoldMapping1_16 = [7]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 562,
        .to0 = 563,
    },
    CaseFoldMapping1_16{
        .from = 1333,
        .to0 = 1381,
    },
    CaseFoldMapping1_16{
        .from = 7726,
        .to0 = 7727,
    },
    CaseFoldMapping1_16{
        .from = 7983,
        .to0 = 7975,
    },
    CaseFoldMapping1_16{
        .from = 11292,
        .to0 = 11340,
    },
    CaseFoldMapping1_16{
        .from = 42646,
        .to0 = 42647,
    },
    CaseFoldMapping1_16{
        .from = 43931,
        .to0 = 5067,
    },
};
pub const case_fold1_16_049: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 1332,
        .to0 = 1380,
    },
    CaseFoldMapping1_16{
        .from = 7982,
        .to0 = 7974,
    },
    CaseFoldMapping1_16{
        .from = 11293,
        .to0 = 11341,
    },
    CaseFoldMapping1_16{
        .from = 42902,
        .to0 = 42903,
    },
    CaseFoldMapping1_16{
        .from = 43930,
        .to0 = 5066,
    },
};
pub const case_fold1_16_050: [7]CaseFoldMapping1_16 = [7]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 560,
        .to0 = 561,
    },
    CaseFoldMapping1_16{
        .from = 1335,
        .to0 = 1383,
    },
    CaseFoldMapping1_16{
        .from = 7724,
        .to0 = 7725,
    },
    CaseFoldMapping1_16{
        .from = 7981,
        .to0 = 7973,
    },
    CaseFoldMapping1_16{
        .from = 11294,
        .to0 = 11342,
    },
    CaseFoldMapping1_16{
        .from = 42644,
        .to0 = 42645,
    },
    CaseFoldMapping1_16{
        .from = 43929,
        .to0 = 5065,
    },
};
pub const case_fold1_16_051: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 306,
        .to0 = 307,
    },
    CaseFoldMapping1_16{
        .from = 1334,
        .to0 = 1382,
    },
    CaseFoldMapping1_16{
        .from = 7980,
        .to0 = 7972,
    },
    CaseFoldMapping1_16{
        .from = 11295,
        .to0 = 11343,
    },
    CaseFoldMapping1_16{
        .from = 43928,
        .to0 = 5064,
    },
};
pub const case_fold1_16_052: [6]CaseFoldMapping1_16 = [6]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 1329,
        .to0 = 1377,
    },
    CaseFoldMapping1_16{
        .from = 7722,
        .to0 = 7723,
    },
    CaseFoldMapping1_16{
        .from = 7979,
        .to0 = 7971,
    },
    CaseFoldMapping1_16{
        .from = 11288,
        .to0 = 11336,
    },
    CaseFoldMapping1_16{
        .from = 42642,
        .to0 = 42643,
    },
    CaseFoldMapping1_16{
        .from = 43935,
        .to0 = 5071,
    },
};
pub const case_fold1_16_053: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 308,
        .to0 = 309,
    },
    CaseFoldMapping1_16{
        .from = 7978,
        .to0 = 7970,
    },
    CaseFoldMapping1_16{
        .from = 11289,
        .to0 = 11337,
    },
    CaseFoldMapping1_16{
        .from = 42898,
        .to0 = 42899,
    },
    CaseFoldMapping1_16{
        .from = 43934,
        .to0 = 5070,
    },
};
pub const case_fold1_16_054: [6]CaseFoldMapping1_16 = [6]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 1331,
        .to0 = 1379,
    },
    CaseFoldMapping1_16{
        .from = 7720,
        .to0 = 7721,
    },
    CaseFoldMapping1_16{
        .from = 7977,
        .to0 = 7969,
    },
    CaseFoldMapping1_16{
        .from = 11290,
        .to0 = 11338,
    },
    CaseFoldMapping1_16{
        .from = 42640,
        .to0 = 42641,
    },
    CaseFoldMapping1_16{
        .from = 43933,
        .to0 = 5069,
    },
};
pub const case_fold1_16_055: [6]CaseFoldMapping1_16 = [6]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 310,
        .to0 = 311,
    },
    CaseFoldMapping1_16{
        .from = 1330,
        .to0 = 1378,
    },
    CaseFoldMapping1_16{
        .from = 7976,
        .to0 = 7968,
    },
    CaseFoldMapping1_16{
        .from = 11291,
        .to0 = 11339,
    },
    CaseFoldMapping1_16{
        .from = 42896,
        .to0 = 42897,
    },
    CaseFoldMapping1_16{
        .from = 43932,
        .to0 = 5068,
    },
};
pub const case_fold1_16_056: [6]CaseFoldMapping1_16 = [6]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 313,
        .to0 = 314,
    },
    CaseFoldMapping1_16{
        .from = 570,
        .to0 = 11365,
    },
    CaseFoldMapping1_16{
        .from = 1341,
        .to0 = 1389,
    },
    CaseFoldMapping1_16{
        .from = 7718,
        .to0 = 7719,
    },
    CaseFoldMapping1_16{
        .from = 11284,
        .to0 = 11332,
    },
    CaseFoldMapping1_16{
        .from = 43923,
        .to0 = 5059,
    },
};
pub const case_fold1_16_057: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 571,
        .to0 = 572,
    },
    CaseFoldMapping1_16{
        .from = 1340,
        .to0 = 1388,
    },
    CaseFoldMapping1_16{
        .from = 11285,
        .to0 = 11333,
    },
    CaseFoldMapping1_16{
        .from = 42910,
        .to0 = 42911,
    },
    CaseFoldMapping1_16{
        .from = 43922,
        .to0 = 5058,
    },
};
pub const case_fold1_16_058: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 315,
        .to0 = 316,
    },
    CaseFoldMapping1_16{
        .from = 1343,
        .to0 = 1391,
    },
    CaseFoldMapping1_16{
        .from = 7716,
        .to0 = 7717,
    },
    CaseFoldMapping1_16{
        .from = 11286,
        .to0 = 11334,
    },
    CaseFoldMapping1_16{
        .from = 43921,
        .to0 = 5057,
    },
};
pub const case_fold1_16_059: [4]CaseFoldMapping1_16 = [4]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 1342,
        .to0 = 1390,
    },
    CaseFoldMapping1_16{
        .from = 11287,
        .to0 = 11335,
    },
    CaseFoldMapping1_16{
        .from = 42908,
        .to0 = 42909,
    },
    CaseFoldMapping1_16{
        .from = 43920,
        .to0 = 5056,
    },
};
pub const case_fold1_16_060: [7]CaseFoldMapping1_16 = [7]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 317,
        .to0 = 318,
    },
    CaseFoldMapping1_16{
        .from = 574,
        .to0 = 11366,
    },
    CaseFoldMapping1_16{
        .from = 1337,
        .to0 = 1385,
    },
    CaseFoldMapping1_16{
        .from = 7714,
        .to0 = 7715,
    },
    CaseFoldMapping1_16{
        .from = 11280,
        .to0 = 11328,
    },
    CaseFoldMapping1_16{
        .from = 42650,
        .to0 = 42651,
    },
    CaseFoldMapping1_16{
        .from = 43927,
        .to0 = 5063,
    },
};
pub const case_fold1_16_061: [4]CaseFoldMapping1_16 = [4]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 1336,
        .to0 = 1384,
    },
    CaseFoldMapping1_16{
        .from = 11281,
        .to0 = 11329,
    },
    CaseFoldMapping1_16{
        .from = 42906,
        .to0 = 42907,
    },
    CaseFoldMapping1_16{
        .from = 43926,
        .to0 = 5062,
    },
};
pub const case_fold1_16_062: [6]CaseFoldMapping1_16 = [6]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 319,
        .to0 = 320,
    },
    CaseFoldMapping1_16{
        .from = 1339,
        .to0 = 1387,
    },
    CaseFoldMapping1_16{
        .from = 7712,
        .to0 = 7713,
    },
    CaseFoldMapping1_16{
        .from = 11282,
        .to0 = 11330,
    },
    CaseFoldMapping1_16{
        .from = 42648,
        .to0 = 42649,
    },
    CaseFoldMapping1_16{
        .from = 43925,
        .to0 = 5061,
    },
};
pub const case_fold1_16_063: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 573,
        .to0 = 410,
    },
    CaseFoldMapping1_16{
        .from = 1338,
        .to0 = 1386,
    },
    CaseFoldMapping1_16{
        .from = 11283,
        .to0 = 11331,
    },
    CaseFoldMapping1_16{
        .from = 42904,
        .to0 = 42905,
    },
    CaseFoldMapping1_16{
        .from = 43924,
        .to0 = 5060,
    },
};
pub const case_fold1_16_064: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 321,
        .to0 = 322,
    },
    CaseFoldMapping1_16{
        .from = 1349,
        .to0 = 1397,
    },
    CaseFoldMapping1_16{
        .from = 7774,
        .to0 = 7775,
    },
    CaseFoldMapping1_16{
        .from = 8031,
        .to0 = 8023,
    },
    CaseFoldMapping1_16{
        .from = 8545,
        .to0 = 8561,
    },
};
pub const case_fold1_16_065: [4]CaseFoldMapping1_16 = [4]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 579,
        .to0 = 384,
    },
    CaseFoldMapping1_16{
        .from = 1348,
        .to0 = 1396,
    },
    CaseFoldMapping1_16{
        .from = 8544,
        .to0 = 8560,
    },
    CaseFoldMapping1_16{
        .from = 11373,
        .to0 = 593,
    },
};
pub const case_fold1_16_066: [6]CaseFoldMapping1_16 = [6]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 323,
        .to0 = 324,
    },
    CaseFoldMapping1_16{
        .from = 1351,
        .to0 = 1399,
    },
    CaseFoldMapping1_16{
        .from = 7772,
        .to0 = 7773,
    },
    CaseFoldMapping1_16{
        .from = 8029,
        .to0 = 8021,
    },
    CaseFoldMapping1_16{
        .from = 8547,
        .to0 = 8563,
    },
    CaseFoldMapping1_16{
        .from = 11374,
        .to0 = 625,
    },
};
pub const case_fold1_16_067: [4]CaseFoldMapping1_16 = [4]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 577,
        .to0 = 578,
    },
    CaseFoldMapping1_16{
        .from = 1350,
        .to0 = 1398,
    },
    CaseFoldMapping1_16{
        .from = 8546,
        .to0 = 8562,
    },
    CaseFoldMapping1_16{
        .from = 11375,
        .to0 = 592,
    },
};
pub const case_fold1_16_068: [6]CaseFoldMapping1_16 = [6]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 325,
        .to0 = 326,
    },
    CaseFoldMapping1_16{
        .from = 582,
        .to0 = 583,
    },
    CaseFoldMapping1_16{
        .from = 1345,
        .to0 = 1393,
    },
    CaseFoldMapping1_16{
        .from = 7770,
        .to0 = 7771,
    },
    CaseFoldMapping1_16{
        .from = 8027,
        .to0 = 8019,
    },
    CaseFoldMapping1_16{
        .from = 8549,
        .to0 = 8565,
    },
};
pub const case_fold1_16_069: [3]CaseFoldMapping1_16 = [3]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 1344,
        .to0 = 1392,
    },
    CaseFoldMapping1_16{
        .from = 8548,
        .to0 = 8564,
    },
    CaseFoldMapping1_16{
        .from = 11369,
        .to0 = 11370,
    },
};
pub const case_fold1_16_070: [7]CaseFoldMapping1_16 = [7]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 327,
        .to0 = 328,
    },
    CaseFoldMapping1_16{
        .from = 580,
        .to0 = 649,
    },
    CaseFoldMapping1_16{
        .from = 837,
        .to0 = 953,
    },
    CaseFoldMapping1_16{
        .from = 1347,
        .to0 = 1395,
    },
    CaseFoldMapping1_16{
        .from = 7768,
        .to0 = 7769,
    },
    CaseFoldMapping1_16{
        .from = 8025,
        .to0 = 8017,
    },
    CaseFoldMapping1_16{
        .from = 8551,
        .to0 = 8567,
    },
};
pub const case_fold1_16_071: [4]CaseFoldMapping1_16 = [4]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 581,
        .to0 = 652,
    },
    CaseFoldMapping1_16{
        .from = 1346,
        .to0 = 1394,
    },
    CaseFoldMapping1_16{
        .from = 8550,
        .to0 = 8566,
    },
    CaseFoldMapping1_16{
        .from = 11371,
        .to0 = 11372,
    },
};
pub const case_fold1_16_072: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 586,
        .to0 = 587,
    },
    CaseFoldMapping1_16{
        .from = 1357,
        .to0 = 1405,
    },
    CaseFoldMapping1_16{
        .from = 7766,
        .to0 = 7767,
    },
    CaseFoldMapping1_16{
        .from = 8553,
        .to0 = 8569,
    },
    CaseFoldMapping1_16{
        .from = 11364,
        .to0 = 637,
    },
};
pub const case_fold1_16_073: [2]CaseFoldMapping1_16 = [2]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 1356,
        .to0 = 1404,
    },
    CaseFoldMapping1_16{
        .from = 8552,
        .to0 = 8568,
    },
};
pub const case_fold1_16_074: [4]CaseFoldMapping1_16 = [4]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 584,
        .to0 = 585,
    },
    CaseFoldMapping1_16{
        .from = 1359,
        .to0 = 1407,
    },
    CaseFoldMapping1_16{
        .from = 7764,
        .to0 = 7765,
    },
    CaseFoldMapping1_16{
        .from = 8555,
        .to0 = 8571,
    },
};
pub const case_fold1_16_075: [4]CaseFoldMapping1_16 = [4]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 330,
        .to0 = 331,
    },
    CaseFoldMapping1_16{
        .from = 1358,
        .to0 = 1406,
    },
    CaseFoldMapping1_16{
        .from = 8554,
        .to0 = 8570,
    },
    CaseFoldMapping1_16{
        .from = 11367,
        .to0 = 11368,
    },
};
pub const case_fold1_16_076: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 590,
        .to0 = 591,
    },
    CaseFoldMapping1_16{
        .from = 1353,
        .to0 = 1401,
    },
    CaseFoldMapping1_16{
        .from = 7762,
        .to0 = 7763,
    },
    CaseFoldMapping1_16{
        .from = 8557,
        .to0 = 8573,
    },
    CaseFoldMapping1_16{
        .from = 11360,
        .to0 = 11361,
    },
};
pub const case_fold1_16_077: [3]CaseFoldMapping1_16 = [3]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 332,
        .to0 = 333,
    },
    CaseFoldMapping1_16{
        .from = 1352,
        .to0 = 1400,
    },
    CaseFoldMapping1_16{
        .from = 8556,
        .to0 = 8572,
    },
};
pub const case_fold1_16_078: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 588,
        .to0 = 589,
    },
    CaseFoldMapping1_16{
        .from = 1355,
        .to0 = 1403,
    },
    CaseFoldMapping1_16{
        .from = 7760,
        .to0 = 7761,
    },
    CaseFoldMapping1_16{
        .from = 8559,
        .to0 = 8575,
    },
    CaseFoldMapping1_16{
        .from = 11362,
        .to0 = 619,
    },
};
pub const case_fold1_16_079: [4]CaseFoldMapping1_16 = [4]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 334,
        .to0 = 335,
    },
    CaseFoldMapping1_16{
        .from = 1354,
        .to0 = 1402,
    },
    CaseFoldMapping1_16{
        .from = 8558,
        .to0 = 8574,
    },
    CaseFoldMapping1_16{
        .from = 11363,
        .to0 = 7549,
    },
};
pub const case_fold1_16_080: [2]CaseFoldMapping1_16 = [2]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 1365,
        .to0 = 1413,
    },
    CaseFoldMapping1_16{
        .from = 7758,
        .to0 = 7759,
    },
};
pub const case_fold1_16_081: [2]CaseFoldMapping1_16 = [2]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 336,
        .to0 = 337,
    },
    CaseFoldMapping1_16{
        .from = 1364,
        .to0 = 1412,
    },
};
pub const case_fold1_16_082: [4]CaseFoldMapping1_16 = [4]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 7756,
        .to0 = 7757,
    },
    CaseFoldMapping1_16{
        .from = 8013,
        .to0 = 8005,
    },
    CaseFoldMapping1_16{
        .from = 11390,
        .to0 = 575,
    },
    CaseFoldMapping1_16{
        .from = 42997,
        .to0 = 42998,
    },
};
pub const case_fold1_16_083: [4]CaseFoldMapping1_16 = [4]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 338,
        .to0 = 339,
    },
    CaseFoldMapping1_16{
        .from = 1366,
        .to0 = 1414,
    },
    CaseFoldMapping1_16{
        .from = 8012,
        .to0 = 8004,
    },
    CaseFoldMapping1_16{
        .from = 11391,
        .to0 = 576,
    },
};
pub const case_fold1_16_084: [3]CaseFoldMapping1_16 = [3]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 1361,
        .to0 = 1409,
    },
    CaseFoldMapping1_16{
        .from = 7754,
        .to0 = 7755,
    },
    CaseFoldMapping1_16{
        .from = 8011,
        .to0 = 8003,
    },
};
pub const case_fold1_16_085: [3]CaseFoldMapping1_16 = [3]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 340,
        .to0 = 341,
    },
    CaseFoldMapping1_16{
        .from = 1360,
        .to0 = 1408,
    },
    CaseFoldMapping1_16{
        .from = 8010,
        .to0 = 8002,
    },
};
pub const case_fold1_16_086: [3]CaseFoldMapping1_16 = [3]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 1363,
        .to0 = 1411,
    },
    CaseFoldMapping1_16{
        .from = 7752,
        .to0 = 7753,
    },
    CaseFoldMapping1_16{
        .from = 8009,
        .to0 = 8001,
    },
};
pub const case_fold1_16_087: [3]CaseFoldMapping1_16 = [3]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 342,
        .to0 = 343,
    },
    CaseFoldMapping1_16{
        .from = 1362,
        .to0 = 1410,
    },
    CaseFoldMapping1_16{
        .from = 8008,
        .to0 = 8000,
    },
};
pub const case_fold1_16_088: [1]CaseFoldMapping1_16 = [1]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 7750,
        .to0 = 7751,
    },
};
pub const case_fold1_16_089: [2]CaseFoldMapping1_16 = [2]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 344,
        .to0 = 345,
    },
    CaseFoldMapping1_16{
        .from = 11381,
        .to0 = 11382,
    },
};
pub const case_fold1_16_090: [1]CaseFoldMapping1_16 = [1]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 7748,
        .to0 = 7749,
    },
};
pub const case_fold1_16_091: [1]CaseFoldMapping1_16 = [1]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 346,
        .to0 = 347,
    },
};
pub const case_fold1_16_092: [2]CaseFoldMapping1_16 = [2]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 7746,
        .to0 = 7747,
    },
    CaseFoldMapping1_16{
        .from = 11376,
        .to0 = 594,
    },
};
pub const case_fold1_16_093: [1]CaseFoldMapping1_16 = [1]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 348,
        .to0 = 349,
    },
};
pub const case_fold1_16_094: [2]CaseFoldMapping1_16 = [2]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 7744,
        .to0 = 7745,
    },
    CaseFoldMapping1_16{
        .from = 11378,
        .to0 = 11379,
    },
};
pub const case_fold1_16_095: [1]CaseFoldMapping1_16 = [1]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 350,
        .to0 = 351,
    },
};
pub const case_fold1_16_096: [3]CaseFoldMapping1_16 = [3]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 1124,
        .to0 = 1125,
    },
    CaseFoldMapping1_16{
        .from = 7806,
        .to0 = 7807,
    },
    CaseFoldMapping1_16{
        .from = 42951,
        .to0 = 42952,
    },
};
pub const case_fold1_16_097: [2]CaseFoldMapping1_16 = [2]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 352,
        .to0 = 353,
    },
    CaseFoldMapping1_16{
        .from = 42950,
        .to0 = 7566,
    },
};
pub const case_fold1_16_098: [3]CaseFoldMapping1_16 = [3]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 1126,
        .to0 = 1127,
    },
    CaseFoldMapping1_16{
        .from = 7804,
        .to0 = 7805,
    },
    CaseFoldMapping1_16{
        .from = 42949,
        .to0 = 642,
    },
};
pub const case_fold1_16_099: [2]CaseFoldMapping1_16 = [2]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 354,
        .to0 = 355,
    },
    CaseFoldMapping1_16{
        .from = 42948,
        .to0 = 42900,
    },
};
pub const case_fold1_16_100: [2]CaseFoldMapping1_16 = [2]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 1120,
        .to0 = 1121,
    },
    CaseFoldMapping1_16{
        .from = 7802,
        .to0 = 7803,
    },
};
pub const case_fold1_16_101: [2]CaseFoldMapping1_16 = [2]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 356,
        .to0 = 357,
    },
    CaseFoldMapping1_16{
        .from = 42946,
        .to0 = 42947,
    },
};
pub const case_fold1_16_102: [2]CaseFoldMapping1_16 = [2]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 1122,
        .to0 = 1123,
    },
    CaseFoldMapping1_16{
        .from = 7800,
        .to0 = 7801,
    },
};
pub const case_fold1_16_103: [2]CaseFoldMapping1_16 = [2]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 358,
        .to0 = 359,
    },
    CaseFoldMapping1_16{
        .from = 42944,
        .to0 = 42945,
    },
};
pub const case_fold1_16_104: [2]CaseFoldMapping1_16 = [2]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 1132,
        .to0 = 1133,
    },
    CaseFoldMapping1_16{
        .from = 7798,
        .to0 = 7799,
    },
};
pub const case_fold1_16_105: [1]CaseFoldMapping1_16 = [1]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 360,
        .to0 = 361,
    },
};
pub const case_fold1_16_106: [2]CaseFoldMapping1_16 = [2]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 1134,
        .to0 = 1135,
    },
    CaseFoldMapping1_16{
        .from = 7796,
        .to0 = 7797,
    },
};
pub const case_fold1_16_107: [1]CaseFoldMapping1_16 = [1]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 362,
        .to0 = 363,
    },
};
pub const case_fold1_16_108: [2]CaseFoldMapping1_16 = [2]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 1128,
        .to0 = 1129,
    },
    CaseFoldMapping1_16{
        .from = 7794,
        .to0 = 7795,
    },
};
pub const case_fold1_16_109: [1]CaseFoldMapping1_16 = [1]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 364,
        .to0 = 365,
    },
};
pub const case_fold1_16_110: [3]CaseFoldMapping1_16 = [3]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 1130,
        .to0 = 1131,
    },
    CaseFoldMapping1_16{
        .from = 7792,
        .to0 = 7793,
    },
    CaseFoldMapping1_16{
        .from = 42953,
        .to0 = 42954,
    },
};
pub const case_fold1_16_111: [1]CaseFoldMapping1_16 = [1]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 366,
        .to0 = 367,
    },
};
pub const case_fold1_16_112: [3]CaseFoldMapping1_16 = [3]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 1140,
        .to0 = 1141,
    },
    CaseFoldMapping1_16{
        .from = 7790,
        .to0 = 7791,
    },
    CaseFoldMapping1_16{
        .from = 8047,
        .to0 = 8039,
    },
};
pub const case_fold1_16_113: [4]CaseFoldMapping1_16 = [4]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 368,
        .to0 = 369,
    },
    CaseFoldMapping1_16{
        .from = 882,
        .to0 = 883,
    },
    CaseFoldMapping1_16{
        .from = 8046,
        .to0 = 8038,
    },
    CaseFoldMapping1_16{
        .from = 42966,
        .to0 = 42967,
    },
};
pub const case_fold1_16_114: [3]CaseFoldMapping1_16 = [3]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 1142,
        .to0 = 1143,
    },
    CaseFoldMapping1_16{
        .from = 7788,
        .to0 = 7789,
    },
    CaseFoldMapping1_16{
        .from = 8045,
        .to0 = 8037,
    },
};
pub const case_fold1_16_115: [3]CaseFoldMapping1_16 = [3]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 370,
        .to0 = 371,
    },
    CaseFoldMapping1_16{
        .from = 880,
        .to0 = 881,
    },
    CaseFoldMapping1_16{
        .from = 8044,
        .to0 = 8036,
    },
};
pub const case_fold1_16_116: [3]CaseFoldMapping1_16 = [3]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 1136,
        .to0 = 1137,
    },
    CaseFoldMapping1_16{
        .from = 7786,
        .to0 = 7787,
    },
    CaseFoldMapping1_16{
        .from = 8043,
        .to0 = 8035,
    },
};
pub const case_fold1_16_117: [3]CaseFoldMapping1_16 = [3]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 372,
        .to0 = 373,
    },
    CaseFoldMapping1_16{
        .from = 886,
        .to0 = 887,
    },
    CaseFoldMapping1_16{
        .from = 8042,
        .to0 = 8034,
    },
};
pub const case_fold1_16_118: [3]CaseFoldMapping1_16 = [3]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 1138,
        .to0 = 1139,
    },
    CaseFoldMapping1_16{
        .from = 7784,
        .to0 = 7785,
    },
    CaseFoldMapping1_16{
        .from = 8041,
        .to0 = 8033,
    },
};
pub const case_fold1_16_119: [3]CaseFoldMapping1_16 = [3]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 374,
        .to0 = 375,
    },
    CaseFoldMapping1_16{
        .from = 8040,
        .to0 = 8032,
    },
    CaseFoldMapping1_16{
        .from = 42960,
        .to0 = 42961,
    },
};
pub const case_fold1_16_120: [3]CaseFoldMapping1_16 = [3]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 377,
        .to0 = 378,
    },
    CaseFoldMapping1_16{
        .from = 1148,
        .to0 = 1149,
    },
    CaseFoldMapping1_16{
        .from = 7782,
        .to0 = 7783,
    },
};
pub const case_fold1_16_121: [1]CaseFoldMapping1_16 = [1]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 376,
        .to0 = 255,
    },
};
pub const case_fold1_16_122: [3]CaseFoldMapping1_16 = [3]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 379,
        .to0 = 380,
    },
    CaseFoldMapping1_16{
        .from = 1150,
        .to0 = 1151,
    },
    CaseFoldMapping1_16{
        .from = 7780,
        .to0 = 7781,
    },
};
pub const case_fold1_16_124: [4]CaseFoldMapping1_16 = [4]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 381,
        .to0 = 382,
    },
    CaseFoldMapping1_16{
        .from = 895,
        .to0 = 1011,
    },
    CaseFoldMapping1_16{
        .from = 1144,
        .to0 = 1145,
    },
    CaseFoldMapping1_16{
        .from = 7778,
        .to0 = 7779,
    },
};
pub const case_fold1_16_126: [3]CaseFoldMapping1_16 = [3]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 383,
        .to0 = 115,
    },
    CaseFoldMapping1_16{
        .from = 1146,
        .to0 = 1147,
    },
    CaseFoldMapping1_16{
        .from = 7776,
        .to0 = 7777,
    },
};
pub const case_fold1_16_127: [1]CaseFoldMapping1_16 = [1]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 42968,
        .to0 = 42969,
    },
};
pub const case_fold1_16_128: [3]CaseFoldMapping1_16 = [3]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 385,
        .to0 = 595,
    },
    CaseFoldMapping1_16{
        .from = 7324,
        .to0 = 4316,
    },
    CaseFoldMapping1_16{
        .from = 11436,
        .to0 = 11437,
    },
};
pub const case_fold1_16_129: [2]CaseFoldMapping1_16 = [2]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 7325,
        .to0 = 4317,
    },
    CaseFoldMapping1_16{
        .from = 42790,
        .to0 = 42791,
    },
};
pub const case_fold1_16_130: [2]CaseFoldMapping1_16 = [2]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 7326,
        .to0 = 4318,
    },
    CaseFoldMapping1_16{
        .from = 11438,
        .to0 = 11439,
    },
};
pub const case_fold1_16_131: [3]CaseFoldMapping1_16 = [3]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 386,
        .to0 = 387,
    },
    CaseFoldMapping1_16{
        .from = 7327,
        .to0 = 4319,
    },
    CaseFoldMapping1_16{
        .from = 42788,
        .to0 = 42789,
    },
};
pub const case_fold1_16_132: [3]CaseFoldMapping1_16 = [3]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 1152,
        .to0 = 1153,
    },
    CaseFoldMapping1_16{
        .from = 7320,
        .to0 = 4312,
    },
    CaseFoldMapping1_16{
        .from = 11432,
        .to0 = 11433,
    },
};
pub const case_fold1_16_133: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 388,
        .to0 = 389,
    },
    CaseFoldMapping1_16{
        .from = 902,
        .to0 = 940,
    },
    CaseFoldMapping1_16{
        .from = 7321,
        .to0 = 4313,
    },
    CaseFoldMapping1_16{
        .from = 7835,
        .to0 = 7777,
    },
    CaseFoldMapping1_16{
        .from = 42786,
        .to0 = 42787,
    },
};
pub const case_fold1_16_134: [3]CaseFoldMapping1_16 = [3]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 391,
        .to0 = 392,
    },
    CaseFoldMapping1_16{
        .from = 7322,
        .to0 = 4314,
    },
    CaseFoldMapping1_16{
        .from = 11434,
        .to0 = 11435,
    },
};
pub const case_fold1_16_135: [2]CaseFoldMapping1_16 = [2]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 390,
        .to0 = 596,
    },
    CaseFoldMapping1_16{
        .from = 7323,
        .to0 = 4315,
    },
};
pub const case_fold1_16_136: [4]CaseFoldMapping1_16 = [4]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 393,
        .to0 = 598,
    },
    CaseFoldMapping1_16{
        .from = 1164,
        .to0 = 1165,
    },
    CaseFoldMapping1_16{
        .from = 7316,
        .to0 = 4308,
    },
    CaseFoldMapping1_16{
        .from = 11428,
        .to0 = 11429,
    },
};
pub const case_fold1_16_137: [3]CaseFoldMapping1_16 = [3]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 906,
        .to0 = 943,
    },
    CaseFoldMapping1_16{
        .from = 7317,
        .to0 = 4309,
    },
    CaseFoldMapping1_16{
        .from = 42798,
        .to0 = 42799,
    },
};
pub const case_fold1_16_138: [6]CaseFoldMapping1_16 = [6]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 395,
        .to0 = 396,
    },
    CaseFoldMapping1_16{
        .from = 905,
        .to0 = 942,
    },
    CaseFoldMapping1_16{
        .from = 1166,
        .to0 = 1167,
    },
    CaseFoldMapping1_16{
        .from = 7318,
        .to0 = 4310,
    },
    CaseFoldMapping1_16{
        .from = 7828,
        .to0 = 7829,
    },
    CaseFoldMapping1_16{
        .from = 11430,
        .to0 = 11431,
    },
};
pub const case_fold1_16_139: [4]CaseFoldMapping1_16 = [4]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 394,
        .to0 = 599,
    },
    CaseFoldMapping1_16{
        .from = 904,
        .to0 = 941,
    },
    CaseFoldMapping1_16{
        .from = 7319,
        .to0 = 4311,
    },
    CaseFoldMapping1_16{
        .from = 42796,
        .to0 = 42797,
    },
};
pub const case_fold1_16_140: [4]CaseFoldMapping1_16 = [4]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 911,
        .to0 = 974,
    },
    CaseFoldMapping1_16{
        .from = 7312,
        .to0 = 4304,
    },
    CaseFoldMapping1_16{
        .from = 7826,
        .to0 = 7827,
    },
    CaseFoldMapping1_16{
        .from = 11424,
        .to0 = 11425,
    },
};
pub const case_fold1_16_141: [3]CaseFoldMapping1_16 = [3]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 910,
        .to0 = 973,
    },
    CaseFoldMapping1_16{
        .from = 7313,
        .to0 = 4305,
    },
    CaseFoldMapping1_16{
        .from = 42794,
        .to0 = 42795,
    },
};
pub const case_fold1_16_142: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 399,
        .to0 = 601,
    },
    CaseFoldMapping1_16{
        .from = 1162,
        .to0 = 1163,
    },
    CaseFoldMapping1_16{
        .from = 7314,
        .to0 = 4306,
    },
    CaseFoldMapping1_16{
        .from = 7824,
        .to0 = 7825,
    },
    CaseFoldMapping1_16{
        .from = 11426,
        .to0 = 11427,
    },
};
pub const case_fold1_16_143: [4]CaseFoldMapping1_16 = [4]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 398,
        .to0 = 477,
    },
    CaseFoldMapping1_16{
        .from = 908,
        .to0 = 972,
    },
    CaseFoldMapping1_16{
        .from = 7315,
        .to0 = 4307,
    },
    CaseFoldMapping1_16{
        .from = 42792,
        .to0 = 42793,
    },
};
pub const case_fold1_16_144: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 401,
        .to0 = 402,
    },
    CaseFoldMapping1_16{
        .from = 915,
        .to0 = 947,
    },
    CaseFoldMapping1_16{
        .from = 1172,
        .to0 = 1173,
    },
    CaseFoldMapping1_16{
        .from = 7822,
        .to0 = 7823,
    },
    CaseFoldMapping1_16{
        .from = 11452,
        .to0 = 11453,
    },
};
pub const case_fold1_16_145: [3]CaseFoldMapping1_16 = [3]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 400,
        .to0 = 603,
    },
    CaseFoldMapping1_16{
        .from = 914,
        .to0 = 946,
    },
    CaseFoldMapping1_16{
        .from = 42806,
        .to0 = 42807,
    },
};
pub const case_fold1_16_146: [6]CaseFoldMapping1_16 = [6]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 403,
        .to0 = 608,
    },
    CaseFoldMapping1_16{
        .from = 913,
        .to0 = 945,
    },
    CaseFoldMapping1_16{
        .from = 1174,
        .to0 = 1175,
    },
    CaseFoldMapping1_16{
        .from = 7820,
        .to0 = 7821,
    },
    CaseFoldMapping1_16{
        .from = 9398,
        .to0 = 9424,
    },
    CaseFoldMapping1_16{
        .from = 11454,
        .to0 = 11455,
    },
};
pub const case_fold1_16_147: [2]CaseFoldMapping1_16 = [2]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 9399,
        .to0 = 9425,
    },
    CaseFoldMapping1_16{
        .from = 42804,
        .to0 = 42805,
    },
};
pub const case_fold1_16_148: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 919,
        .to0 = 951,
    },
    CaseFoldMapping1_16{
        .from = 1168,
        .to0 = 1169,
    },
    CaseFoldMapping1_16{
        .from = 7304,
        .to0 = 42571,
    },
    CaseFoldMapping1_16{
        .from = 7818,
        .to0 = 7819,
    },
    CaseFoldMapping1_16{
        .from = 11448,
        .to0 = 11449,
    },
};
pub const case_fold1_16_149: [3]CaseFoldMapping1_16 = [3]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 404,
        .to0 = 611,
    },
    CaseFoldMapping1_16{
        .from = 918,
        .to0 = 950,
    },
    CaseFoldMapping1_16{
        .from = 42802,
        .to0 = 42803,
    },
};
pub const case_fold1_16_150: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 407,
        .to0 = 616,
    },
    CaseFoldMapping1_16{
        .from = 917,
        .to0 = 949,
    },
    CaseFoldMapping1_16{
        .from = 1170,
        .to0 = 1171,
    },
    CaseFoldMapping1_16{
        .from = 7816,
        .to0 = 7817,
    },
    CaseFoldMapping1_16{
        .from = 11450,
        .to0 = 11451,
    },
};
pub const case_fold1_16_151: [2]CaseFoldMapping1_16 = [2]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 406,
        .to0 = 617,
    },
    CaseFoldMapping1_16{
        .from = 916,
        .to0 = 948,
    },
};
pub const case_fold1_16_152: [6]CaseFoldMapping1_16 = [6]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 923,
        .to0 = 955,
    },
    CaseFoldMapping1_16{
        .from = 1180,
        .to0 = 1181,
    },
    CaseFoldMapping1_16{
        .from = 7300,
        .to0 = 1090,
    },
    CaseFoldMapping1_16{
        .from = 7814,
        .to0 = 7815,
    },
    CaseFoldMapping1_16{
        .from = 9404,
        .to0 = 9430,
    },
    CaseFoldMapping1_16{
        .from = 11444,
        .to0 = 11445,
    },
};
pub const case_fold1_16_153: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 408,
        .to0 = 409,
    },
    CaseFoldMapping1_16{
        .from = 922,
        .to0 = 954,
    },
    CaseFoldMapping1_16{
        .from = 7301,
        .to0 = 1090,
    },
    CaseFoldMapping1_16{
        .from = 9405,
        .to0 = 9431,
    },
    CaseFoldMapping1_16{
        .from = 42814,
        .to0 = 42815,
    },
};
pub const case_fold1_16_154: [6]CaseFoldMapping1_16 = [6]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 921,
        .to0 = 953,
    },
    CaseFoldMapping1_16{
        .from = 1182,
        .to0 = 1183,
    },
    CaseFoldMapping1_16{
        .from = 7302,
        .to0 = 1098,
    },
    CaseFoldMapping1_16{
        .from = 7812,
        .to0 = 7813,
    },
    CaseFoldMapping1_16{
        .from = 9406,
        .to0 = 9432,
    },
    CaseFoldMapping1_16{
        .from = 11446,
        .to0 = 11447,
    },
};
pub const case_fold1_16_155: [4]CaseFoldMapping1_16 = [4]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 920,
        .to0 = 952,
    },
    CaseFoldMapping1_16{
        .from = 7303,
        .to0 = 1123,
    },
    CaseFoldMapping1_16{
        .from = 9407,
        .to0 = 9433,
    },
    CaseFoldMapping1_16{
        .from = 42812,
        .to0 = 42813,
    },
};
pub const case_fold1_16_156: [7]CaseFoldMapping1_16 = [7]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 413,
        .to0 = 626,
    },
    CaseFoldMapping1_16{
        .from = 927,
        .to0 = 959,
    },
    CaseFoldMapping1_16{
        .from = 1176,
        .to0 = 1177,
    },
    CaseFoldMapping1_16{
        .from = 7296,
        .to0 = 1074,
    },
    CaseFoldMapping1_16{
        .from = 7810,
        .to0 = 7811,
    },
    CaseFoldMapping1_16{
        .from = 9400,
        .to0 = 9426,
    },
    CaseFoldMapping1_16{
        .from = 11440,
        .to0 = 11441,
    },
};
pub const case_fold1_16_157: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 412,
        .to0 = 623,
    },
    CaseFoldMapping1_16{
        .from = 926,
        .to0 = 958,
    },
    CaseFoldMapping1_16{
        .from = 7297,
        .to0 = 1076,
    },
    CaseFoldMapping1_16{
        .from = 9401,
        .to0 = 9427,
    },
    CaseFoldMapping1_16{
        .from = 42810,
        .to0 = 42811,
    },
};
pub const case_fold1_16_158: [7]CaseFoldMapping1_16 = [7]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 415,
        .to0 = 629,
    },
    CaseFoldMapping1_16{
        .from = 925,
        .to0 = 957,
    },
    CaseFoldMapping1_16{
        .from = 1178,
        .to0 = 1179,
    },
    CaseFoldMapping1_16{
        .from = 7298,
        .to0 = 1086,
    },
    CaseFoldMapping1_16{
        .from = 7808,
        .to0 = 7809,
    },
    CaseFoldMapping1_16{
        .from = 9402,
        .to0 = 9428,
    },
    CaseFoldMapping1_16{
        .from = 11442,
        .to0 = 11443,
    },
};
pub const case_fold1_16_159: [4]CaseFoldMapping1_16 = [4]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 924,
        .to0 = 956,
    },
    CaseFoldMapping1_16{
        .from = 7299,
        .to0 = 1089,
    },
    CaseFoldMapping1_16{
        .from = 9403,
        .to0 = 9429,
    },
    CaseFoldMapping1_16{
        .from = 42808,
        .to0 = 42809,
    },
};
pub const case_fold1_16_160: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 931,
        .to0 = 963,
    },
    CaseFoldMapping1_16{
        .from = 1188,
        .to0 = 1189,
    },
    CaseFoldMapping1_16{
        .from = 4272,
        .to0 = 11536,
    },
    CaseFoldMapping1_16{
        .from = 7870,
        .to0 = 7871,
    },
    CaseFoldMapping1_16{
        .from = 11404,
        .to0 = 11405,
    },
};
pub const case_fold1_16_161: [4]CaseFoldMapping1_16 = [4]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 416,
        .to0 = 417,
    },
    CaseFoldMapping1_16{
        .from = 4273,
        .to0 = 11537,
    },
    CaseFoldMapping1_16{
        .from = 7357,
        .to0 = 4349,
    },
    CaseFoldMapping1_16{
        .from = 8126,
        .to0 = 953,
    },
};
pub const case_fold1_16_162: [7]CaseFoldMapping1_16 = [7]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 929,
        .to0 = 961,
    },
    CaseFoldMapping1_16{
        .from = 1190,
        .to0 = 1191,
    },
    CaseFoldMapping1_16{
        .from = 4274,
        .to0 = 11538,
    },
    CaseFoldMapping1_16{
        .from = 7358,
        .to0 = 4350,
    },
    CaseFoldMapping1_16{
        .from = 7868,
        .to0 = 7869,
    },
    CaseFoldMapping1_16{
        .from = 8579,
        .to0 = 8580,
    },
    CaseFoldMapping1_16{
        .from = 11406,
        .to0 = 11407,
    },
};
pub const case_fold1_16_163: [4]CaseFoldMapping1_16 = [4]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 418,
        .to0 = 419,
    },
    CaseFoldMapping1_16{
        .from = 928,
        .to0 = 960,
    },
    CaseFoldMapping1_16{
        .from = 4275,
        .to0 = 11539,
    },
    CaseFoldMapping1_16{
        .from = 7359,
        .to0 = 4351,
    },
};
pub const case_fold1_16_164: [7]CaseFoldMapping1_16 = [7]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 935,
        .to0 = 967,
    },
    CaseFoldMapping1_16{
        .from = 1184,
        .to0 = 1185,
    },
    CaseFoldMapping1_16{
        .from = 4276,
        .to0 = 11540,
    },
    CaseFoldMapping1_16{
        .from = 7352,
        .to0 = 4344,
    },
    CaseFoldMapping1_16{
        .from = 7866,
        .to0 = 7867,
    },
    CaseFoldMapping1_16{
        .from = 8123,
        .to0 = 8049,
    },
    CaseFoldMapping1_16{
        .from = 11400,
        .to0 = 11401,
    },
};
pub const case_fold1_16_165: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 420,
        .to0 = 421,
    },
    CaseFoldMapping1_16{
        .from = 934,
        .to0 = 966,
    },
    CaseFoldMapping1_16{
        .from = 4277,
        .to0 = 11541,
    },
    CaseFoldMapping1_16{
        .from = 7353,
        .to0 = 4345,
    },
    CaseFoldMapping1_16{
        .from = 8122,
        .to0 = 8048,
    },
};
pub const case_fold1_16_166: [8]CaseFoldMapping1_16 = [8]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 423,
        .to0 = 424,
    },
    CaseFoldMapping1_16{
        .from = 933,
        .to0 = 965,
    },
    CaseFoldMapping1_16{
        .from = 1186,
        .to0 = 1187,
    },
    CaseFoldMapping1_16{
        .from = 4278,
        .to0 = 11542,
    },
    CaseFoldMapping1_16{
        .from = 7354,
        .to0 = 4346,
    },
    CaseFoldMapping1_16{
        .from = 7864,
        .to0 = 7865,
    },
    CaseFoldMapping1_16{
        .from = 8121,
        .to0 = 8113,
    },
    CaseFoldMapping1_16{
        .from = 11402,
        .to0 = 11403,
    },
};
pub const case_fold1_16_167: [4]CaseFoldMapping1_16 = [4]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 422,
        .to0 = 640,
    },
    CaseFoldMapping1_16{
        .from = 932,
        .to0 = 964,
    },
    CaseFoldMapping1_16{
        .from = 4279,
        .to0 = 11543,
    },
    CaseFoldMapping1_16{
        .from = 8120,
        .to0 = 8112,
    },
};
pub const case_fold1_16_168: [7]CaseFoldMapping1_16 = [7]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 425,
        .to0 = 643,
    },
    CaseFoldMapping1_16{
        .from = 939,
        .to0 = 971,
    },
    CaseFoldMapping1_16{
        .from = 1196,
        .to0 = 1197,
    },
    CaseFoldMapping1_16{
        .from = 4280,
        .to0 = 11544,
    },
    CaseFoldMapping1_16{
        .from = 7348,
        .to0 = 4340,
    },
    CaseFoldMapping1_16{
        .from = 7862,
        .to0 = 7863,
    },
    CaseFoldMapping1_16{
        .from = 11396,
        .to0 = 11397,
    },
};
pub const case_fold1_16_169: [3]CaseFoldMapping1_16 = [3]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 938,
        .to0 = 970,
    },
    CaseFoldMapping1_16{
        .from = 4281,
        .to0 = 11545,
    },
    CaseFoldMapping1_16{
        .from = 7349,
        .to0 = 4341,
    },
};
pub const case_fold1_16_170: [6]CaseFoldMapping1_16 = [6]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 937,
        .to0 = 969,
    },
    CaseFoldMapping1_16{
        .from = 1198,
        .to0 = 1199,
    },
    CaseFoldMapping1_16{
        .from = 4282,
        .to0 = 11546,
    },
    CaseFoldMapping1_16{
        .from = 7350,
        .to0 = 4342,
    },
    CaseFoldMapping1_16{
        .from = 7860,
        .to0 = 7861,
    },
    CaseFoldMapping1_16{
        .from = 11398,
        .to0 = 11399,
    },
};
pub const case_fold1_16_171: [3]CaseFoldMapping1_16 = [3]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 936,
        .to0 = 968,
    },
    CaseFoldMapping1_16{
        .from = 4283,
        .to0 = 11547,
    },
    CaseFoldMapping1_16{
        .from = 7351,
        .to0 = 4343,
    },
};
pub const case_fold1_16_172: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 1192,
        .to0 = 1193,
    },
    CaseFoldMapping1_16{
        .from = 4284,
        .to0 = 11548,
    },
    CaseFoldMapping1_16{
        .from = 7344,
        .to0 = 4336,
    },
    CaseFoldMapping1_16{
        .from = 7858,
        .to0 = 7859,
    },
    CaseFoldMapping1_16{
        .from = 11392,
        .to0 = 11393,
    },
};
pub const case_fold1_16_173: [3]CaseFoldMapping1_16 = [3]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 428,
        .to0 = 429,
    },
    CaseFoldMapping1_16{
        .from = 4285,
        .to0 = 11549,
    },
    CaseFoldMapping1_16{
        .from = 7345,
        .to0 = 4337,
    },
};
pub const case_fold1_16_174: [6]CaseFoldMapping1_16 = [6]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 431,
        .to0 = 432,
    },
    CaseFoldMapping1_16{
        .from = 1194,
        .to0 = 1195,
    },
    CaseFoldMapping1_16{
        .from = 4286,
        .to0 = 11550,
    },
    CaseFoldMapping1_16{
        .from = 7346,
        .to0 = 4338,
    },
    CaseFoldMapping1_16{
        .from = 7856,
        .to0 = 7857,
    },
    CaseFoldMapping1_16{
        .from = 11394,
        .to0 = 11395,
    },
};
pub const case_fold1_16_175: [3]CaseFoldMapping1_16 = [3]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 430,
        .to0 = 648,
    },
    CaseFoldMapping1_16{
        .from = 4287,
        .to0 = 11551,
    },
    CaseFoldMapping1_16{
        .from = 7347,
        .to0 = 4339,
    },
};
pub const case_fold1_16_176: [6]CaseFoldMapping1_16 = [6]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 433,
        .to0 = 650,
    },
    CaseFoldMapping1_16{
        .from = 1204,
        .to0 = 1205,
    },
    CaseFoldMapping1_16{
        .from = 4256,
        .to0 = 11520,
    },
    CaseFoldMapping1_16{
        .from = 7340,
        .to0 = 4332,
    },
    CaseFoldMapping1_16{
        .from = 7854,
        .to0 = 7855,
    },
    CaseFoldMapping1_16{
        .from = 11420,
        .to0 = 11421,
    },
};
pub const case_fold1_16_177: [2]CaseFoldMapping1_16 = [2]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 4257,
        .to0 = 11521,
    },
    CaseFoldMapping1_16{
        .from = 7341,
        .to0 = 4333,
    },
};
pub const case_fold1_16_178: [6]CaseFoldMapping1_16 = [6]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 435,
        .to0 = 436,
    },
    CaseFoldMapping1_16{
        .from = 1206,
        .to0 = 1207,
    },
    CaseFoldMapping1_16{
        .from = 4258,
        .to0 = 11522,
    },
    CaseFoldMapping1_16{
        .from = 7342,
        .to0 = 4334,
    },
    CaseFoldMapping1_16{
        .from = 7852,
        .to0 = 7853,
    },
    CaseFoldMapping1_16{
        .from = 11422,
        .to0 = 11423,
    },
};
pub const case_fold1_16_179: [3]CaseFoldMapping1_16 = [3]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 434,
        .to0 = 651,
    },
    CaseFoldMapping1_16{
        .from = 4259,
        .to0 = 11523,
    },
    CaseFoldMapping1_16{
        .from = 7343,
        .to0 = 4335,
    },
};
pub const case_fold1_16_180: [6]CaseFoldMapping1_16 = [6]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 437,
        .to0 = 438,
    },
    CaseFoldMapping1_16{
        .from = 1200,
        .to0 = 1201,
    },
    CaseFoldMapping1_16{
        .from = 4260,
        .to0 = 11524,
    },
    CaseFoldMapping1_16{
        .from = 7336,
        .to0 = 4328,
    },
    CaseFoldMapping1_16{
        .from = 7850,
        .to0 = 7851,
    },
    CaseFoldMapping1_16{
        .from = 11416,
        .to0 = 11417,
    },
};
pub const case_fold1_16_181: [3]CaseFoldMapping1_16 = [3]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 181,
        .to0 = 956,
    },
    CaseFoldMapping1_16{
        .from = 4261,
        .to0 = 11525,
    },
    CaseFoldMapping1_16{
        .from = 7337,
        .to0 = 4329,
    },
};
pub const case_fold1_16_182: [6]CaseFoldMapping1_16 = [6]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 439,
        .to0 = 658,
    },
    CaseFoldMapping1_16{
        .from = 1202,
        .to0 = 1203,
    },
    CaseFoldMapping1_16{
        .from = 4262,
        .to0 = 11526,
    },
    CaseFoldMapping1_16{
        .from = 7338,
        .to0 = 4330,
    },
    CaseFoldMapping1_16{
        .from = 7848,
        .to0 = 7849,
    },
    CaseFoldMapping1_16{
        .from = 11418,
        .to0 = 11419,
    },
};
pub const case_fold1_16_183: [2]CaseFoldMapping1_16 = [2]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 4263,
        .to0 = 11527,
    },
    CaseFoldMapping1_16{
        .from = 7339,
        .to0 = 4331,
    },
};
pub const case_fold1_16_184: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 1212,
        .to0 = 1213,
    },
    CaseFoldMapping1_16{
        .from = 4264,
        .to0 = 11528,
    },
    CaseFoldMapping1_16{
        .from = 7332,
        .to0 = 4324,
    },
    CaseFoldMapping1_16{
        .from = 7846,
        .to0 = 7847,
    },
    CaseFoldMapping1_16{
        .from = 11412,
        .to0 = 11413,
    },
};
pub const case_fold1_16_185: [3]CaseFoldMapping1_16 = [3]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 440,
        .to0 = 441,
    },
    CaseFoldMapping1_16{
        .from = 4265,
        .to0 = 11529,
    },
    CaseFoldMapping1_16{
        .from = 7333,
        .to0 = 4325,
    },
};
pub const case_fold1_16_186: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 1214,
        .to0 = 1215,
    },
    CaseFoldMapping1_16{
        .from = 4266,
        .to0 = 11530,
    },
    CaseFoldMapping1_16{
        .from = 7334,
        .to0 = 4326,
    },
    CaseFoldMapping1_16{
        .from = 7844,
        .to0 = 7845,
    },
    CaseFoldMapping1_16{
        .from = 11414,
        .to0 = 11415,
    },
};
pub const case_fold1_16_187: [2]CaseFoldMapping1_16 = [2]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 4267,
        .to0 = 11531,
    },
    CaseFoldMapping1_16{
        .from = 7335,
        .to0 = 4327,
    },
};
pub const case_fold1_16_188: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 1208,
        .to0 = 1209,
    },
    CaseFoldMapping1_16{
        .from = 4268,
        .to0 = 11532,
    },
    CaseFoldMapping1_16{
        .from = 7328,
        .to0 = 4320,
    },
    CaseFoldMapping1_16{
        .from = 7842,
        .to0 = 7843,
    },
    CaseFoldMapping1_16{
        .from = 11408,
        .to0 = 11409,
    },
};
pub const case_fold1_16_189: [3]CaseFoldMapping1_16 = [3]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 444,
        .to0 = 445,
    },
    CaseFoldMapping1_16{
        .from = 4269,
        .to0 = 11533,
    },
    CaseFoldMapping1_16{
        .from = 7329,
        .to0 = 4321,
    },
};
pub const case_fold1_16_190: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 1210,
        .to0 = 1211,
    },
    CaseFoldMapping1_16{
        .from = 4270,
        .to0 = 11534,
    },
    CaseFoldMapping1_16{
        .from = 7330,
        .to0 = 4322,
    },
    CaseFoldMapping1_16{
        .from = 7840,
        .to0 = 7841,
    },
    CaseFoldMapping1_16{
        .from = 11410,
        .to0 = 11411,
    },
};
pub const case_fold1_16_191: [2]CaseFoldMapping1_16 = [2]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 4271,
        .to0 = 11535,
    },
    CaseFoldMapping1_16{
        .from = 7331,
        .to0 = 4323,
    },
};
pub const case_fold1_16_192: [3]CaseFoldMapping1_16 = [3]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 192,
        .to0 = 224,
    },
    CaseFoldMapping1_16{
        .from = 7902,
        .to0 = 7903,
    },
    CaseFoldMapping1_16{
        .from = 42598,
        .to0 = 42599,
    },
};
pub const case_fold1_16_193: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 193,
        .to0 = 225,
    },
    CaseFoldMapping1_16{
        .from = 962,
        .to0 = 963,
    },
    CaseFoldMapping1_16{
        .from = 1221,
        .to0 = 1222,
    },
    CaseFoldMapping1_16{
        .from = 11501,
        .to0 = 11502,
    },
    CaseFoldMapping1_16{
        .from = 42854,
        .to0 = 42855,
    },
};
pub const case_fold1_16_194: [3]CaseFoldMapping1_16 = [3]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 194,
        .to0 = 226,
    },
    CaseFoldMapping1_16{
        .from = 7900,
        .to0 = 7901,
    },
    CaseFoldMapping1_16{
        .from = 42596,
        .to0 = 42597,
    },
};
pub const case_fold1_16_195: [3]CaseFoldMapping1_16 = [3]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 195,
        .to0 = 227,
    },
    CaseFoldMapping1_16{
        .from = 1223,
        .to0 = 1224,
    },
    CaseFoldMapping1_16{
        .from = 42852,
        .to0 = 42853,
    },
};
pub const case_fold1_16_196: [6]CaseFoldMapping1_16 = [6]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 196,
        .to0 = 228,
    },
    CaseFoldMapping1_16{
        .from = 453,
        .to0 = 454,
    },
    CaseFoldMapping1_16{
        .from = 1216,
        .to0 = 1231,
    },
    CaseFoldMapping1_16{
        .from = 7898,
        .to0 = 7899,
    },
    CaseFoldMapping1_16{
        .from = 8155,
        .to0 = 8055,
    },
    CaseFoldMapping1_16{
        .from = 42594,
        .to0 = 42595,
    },
};
pub const case_fold1_16_197: [6]CaseFoldMapping1_16 = [6]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 197,
        .to0 = 229,
    },
    CaseFoldMapping1_16{
        .from = 452,
        .to0 = 454,
    },
    CaseFoldMapping1_16{
        .from = 1217,
        .to0 = 1218,
    },
    CaseFoldMapping1_16{
        .from = 8154,
        .to0 = 8054,
    },
    CaseFoldMapping1_16{
        .from = 42850,
        .to0 = 42851,
    },
    CaseFoldMapping1_16{
        .from = 65338,
        .to0 = 65370,
    },
};
pub const case_fold1_16_198: [6]CaseFoldMapping1_16 = [6]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 198,
        .to0 = 230,
    },
    CaseFoldMapping1_16{
        .from = 455,
        .to0 = 457,
    },
    CaseFoldMapping1_16{
        .from = 7896,
        .to0 = 7897,
    },
    CaseFoldMapping1_16{
        .from = 8153,
        .to0 = 8145,
    },
    CaseFoldMapping1_16{
        .from = 42592,
        .to0 = 42593,
    },
    CaseFoldMapping1_16{
        .from = 65337,
        .to0 = 65369,
    },
};
pub const case_fold1_16_199: [6]CaseFoldMapping1_16 = [6]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 199,
        .to0 = 231,
    },
    CaseFoldMapping1_16{
        .from = 1219,
        .to0 = 1220,
    },
    CaseFoldMapping1_16{
        .from = 8152,
        .to0 = 8144,
    },
    CaseFoldMapping1_16{
        .from = 11499,
        .to0 = 11500,
    },
    CaseFoldMapping1_16{
        .from = 42848,
        .to0 = 42849,
    },
    CaseFoldMapping1_16{
        .from = 65336,
        .to0 = 65368,
    },
};
pub const case_fold1_16_200: [3]CaseFoldMapping1_16 = [3]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 200,
        .to0 = 232,
    },
    CaseFoldMapping1_16{
        .from = 7894,
        .to0 = 7895,
    },
    CaseFoldMapping1_16{
        .from = 65335,
        .to0 = 65367,
    },
};
pub const case_fold1_16_201: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 201,
        .to0 = 233,
    },
    CaseFoldMapping1_16{
        .from = 456,
        .to0 = 457,
    },
    CaseFoldMapping1_16{
        .from = 1229,
        .to0 = 1230,
    },
    CaseFoldMapping1_16{
        .from = 42862,
        .to0 = 42863,
    },
    CaseFoldMapping1_16{
        .from = 65334,
        .to0 = 65366,
    },
};
pub const case_fold1_16_202: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 202,
        .to0 = 234,
    },
    CaseFoldMapping1_16{
        .from = 459,
        .to0 = 460,
    },
    CaseFoldMapping1_16{
        .from = 7892,
        .to0 = 7893,
    },
    CaseFoldMapping1_16{
        .from = 42604,
        .to0 = 42605,
    },
    CaseFoldMapping1_16{
        .from = 65333,
        .to0 = 65365,
    },
};
pub const case_fold1_16_203: [4]CaseFoldMapping1_16 = [4]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 203,
        .to0 = 235,
    },
    CaseFoldMapping1_16{
        .from = 458,
        .to0 = 460,
    },
    CaseFoldMapping1_16{
        .from = 42860,
        .to0 = 42861,
    },
    CaseFoldMapping1_16{
        .from = 65332,
        .to0 = 65364,
    },
};
pub const case_fold1_16_204: [7]CaseFoldMapping1_16 = [7]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 204,
        .to0 = 236,
    },
    CaseFoldMapping1_16{
        .from = 461,
        .to0 = 462,
    },
    CaseFoldMapping1_16{
        .from = 975,
        .to0 = 983,
    },
    CaseFoldMapping1_16{
        .from = 7890,
        .to0 = 7891,
    },
    CaseFoldMapping1_16{
        .from = 11488,
        .to0 = 11489,
    },
    CaseFoldMapping1_16{
        .from = 42602,
        .to0 = 42603,
    },
    CaseFoldMapping1_16{
        .from = 65331,
        .to0 = 65363,
    },
};
pub const case_fold1_16_205: [4]CaseFoldMapping1_16 = [4]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 205,
        .to0 = 237,
    },
    CaseFoldMapping1_16{
        .from = 1225,
        .to0 = 1226,
    },
    CaseFoldMapping1_16{
        .from = 42858,
        .to0 = 42859,
    },
    CaseFoldMapping1_16{
        .from = 65330,
        .to0 = 65362,
    },
};
pub const case_fold1_16_206: [6]CaseFoldMapping1_16 = [6]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 206,
        .to0 = 238,
    },
    CaseFoldMapping1_16{
        .from = 463,
        .to0 = 464,
    },
    CaseFoldMapping1_16{
        .from = 7888,
        .to0 = 7889,
    },
    CaseFoldMapping1_16{
        .from = 11490,
        .to0 = 11491,
    },
    CaseFoldMapping1_16{
        .from = 42600,
        .to0 = 42601,
    },
    CaseFoldMapping1_16{
        .from = 65329,
        .to0 = 65361,
    },
};
pub const case_fold1_16_207: [4]CaseFoldMapping1_16 = [4]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 207,
        .to0 = 239,
    },
    CaseFoldMapping1_16{
        .from = 1227,
        .to0 = 1228,
    },
    CaseFoldMapping1_16{
        .from = 42856,
        .to0 = 42857,
    },
    CaseFoldMapping1_16{
        .from = 65328,
        .to0 = 65360,
    },
};
pub const case_fold1_16_208: [7]CaseFoldMapping1_16 = [7]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 208,
        .to0 = 240,
    },
    CaseFoldMapping1_16{
        .from = 465,
        .to0 = 466,
    },
    CaseFoldMapping1_16{
        .from = 1236,
        .to0 = 1237,
    },
    CaseFoldMapping1_16{
        .from = 4288,
        .to0 = 11552,
    },
    CaseFoldMapping1_16{
        .from = 7886,
        .to0 = 7887,
    },
    CaseFoldMapping1_16{
        .from = 43899,
        .to0 = 5035,
    },
    CaseFoldMapping1_16{
        .from = 65327,
        .to0 = 65359,
    },
};
pub const case_fold1_16_209: [4]CaseFoldMapping1_16 = [4]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 209,
        .to0 = 241,
    },
    CaseFoldMapping1_16{
        .from = 4289,
        .to0 = 11553,
    },
    CaseFoldMapping1_16{
        .from = 43898,
        .to0 = 5034,
    },
    CaseFoldMapping1_16{
        .from = 65326,
        .to0 = 65358,
    },
};
pub const case_fold1_16_210: [8]CaseFoldMapping1_16 = [8]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 210,
        .to0 = 242,
    },
    CaseFoldMapping1_16{
        .from = 467,
        .to0 = 468,
    },
    CaseFoldMapping1_16{
        .from = 977,
        .to0 = 952,
    },
    CaseFoldMapping1_16{
        .from = 1238,
        .to0 = 1239,
    },
    CaseFoldMapping1_16{
        .from = 4290,
        .to0 = 11554,
    },
    CaseFoldMapping1_16{
        .from = 7884,
        .to0 = 7885,
    },
    CaseFoldMapping1_16{
        .from = 43897,
        .to0 = 5033,
    },
    CaseFoldMapping1_16{
        .from = 65325,
        .to0 = 65357,
    },
};
pub const case_fold1_16_211: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 211,
        .to0 = 243,
    },
    CaseFoldMapping1_16{
        .from = 976,
        .to0 = 946,
    },
    CaseFoldMapping1_16{
        .from = 4291,
        .to0 = 11555,
    },
    CaseFoldMapping1_16{
        .from = 43896,
        .to0 = 5032,
    },
    CaseFoldMapping1_16{
        .from = 65324,
        .to0 = 65356,
    },
};
pub const case_fold1_16_212: [8]CaseFoldMapping1_16 = [8]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 212,
        .to0 = 244,
    },
    CaseFoldMapping1_16{
        .from = 469,
        .to0 = 470,
    },
    CaseFoldMapping1_16{
        .from = 1232,
        .to0 = 1233,
    },
    CaseFoldMapping1_16{
        .from = 4292,
        .to0 = 11556,
    },
    CaseFoldMapping1_16{
        .from = 7882,
        .to0 = 7883,
    },
    CaseFoldMapping1_16{
        .from = 8139,
        .to0 = 8053,
    },
    CaseFoldMapping1_16{
        .from = 43903,
        .to0 = 5039,
    },
    CaseFoldMapping1_16{
        .from = 65323,
        .to0 = 65355,
    },
};
pub const case_fold1_16_213: [6]CaseFoldMapping1_16 = [6]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 213,
        .to0 = 245,
    },
    CaseFoldMapping1_16{
        .from = 982,
        .to0 = 960,
    },
    CaseFoldMapping1_16{
        .from = 4293,
        .to0 = 11557,
    },
    CaseFoldMapping1_16{
        .from = 8138,
        .to0 = 8052,
    },
    CaseFoldMapping1_16{
        .from = 43902,
        .to0 = 5038,
    },
    CaseFoldMapping1_16{
        .from = 65322,
        .to0 = 65354,
    },
};
pub const case_fold1_16_214: [8]CaseFoldMapping1_16 = [8]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 214,
        .to0 = 246,
    },
    CaseFoldMapping1_16{
        .from = 471,
        .to0 = 472,
    },
    CaseFoldMapping1_16{
        .from = 981,
        .to0 = 966,
    },
    CaseFoldMapping1_16{
        .from = 1234,
        .to0 = 1235,
    },
    CaseFoldMapping1_16{
        .from = 7880,
        .to0 = 7881,
    },
    CaseFoldMapping1_16{
        .from = 8137,
        .to0 = 8051,
    },
    CaseFoldMapping1_16{
        .from = 43901,
        .to0 = 5037,
    },
    CaseFoldMapping1_16{
        .from = 65321,
        .to0 = 65353,
    },
};
pub const case_fold1_16_215: [4]CaseFoldMapping1_16 = [4]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 4295,
        .to0 = 11559,
    },
    CaseFoldMapping1_16{
        .from = 8136,
        .to0 = 8050,
    },
    CaseFoldMapping1_16{
        .from = 43900,
        .to0 = 5036,
    },
    CaseFoldMapping1_16{
        .from = 65320,
        .to0 = 65352,
    },
};
pub const case_fold1_16_216: [6]CaseFoldMapping1_16 = [6]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 216,
        .to0 = 248,
    },
    CaseFoldMapping1_16{
        .from = 473,
        .to0 = 474,
    },
    CaseFoldMapping1_16{
        .from = 1244,
        .to0 = 1245,
    },
    CaseFoldMapping1_16{
        .from = 7878,
        .to0 = 7879,
    },
    CaseFoldMapping1_16{
        .from = 43891,
        .to0 = 5027,
    },
    CaseFoldMapping1_16{
        .from = 65319,
        .to0 = 65351,
    },
};
pub const case_fold1_16_217: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 217,
        .to0 = 249,
    },
    CaseFoldMapping1_16{
        .from = 986,
        .to0 = 987,
    },
    CaseFoldMapping1_16{
        .from = 42878,
        .to0 = 42879,
    },
    CaseFoldMapping1_16{
        .from = 43890,
        .to0 = 5026,
    },
    CaseFoldMapping1_16{
        .from = 65318,
        .to0 = 65350,
    },
};
pub const case_fold1_16_218: [7]CaseFoldMapping1_16 = [7]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 218,
        .to0 = 250,
    },
    CaseFoldMapping1_16{
        .from = 475,
        .to0 = 476,
    },
    CaseFoldMapping1_16{
        .from = 1246,
        .to0 = 1247,
    },
    CaseFoldMapping1_16{
        .from = 7876,
        .to0 = 7877,
    },
    CaseFoldMapping1_16{
        .from = 42877,
        .to0 = 7545,
    },
    CaseFoldMapping1_16{
        .from = 43889,
        .to0 = 5025,
    },
    CaseFoldMapping1_16{
        .from = 65317,
        .to0 = 65349,
    },
};
pub const case_fold1_16_219: [4]CaseFoldMapping1_16 = [4]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 219,
        .to0 = 251,
    },
    CaseFoldMapping1_16{
        .from = 984,
        .to0 = 985,
    },
    CaseFoldMapping1_16{
        .from = 43888,
        .to0 = 5024,
    },
    CaseFoldMapping1_16{
        .from = 65316,
        .to0 = 65348,
    },
};
pub const case_fold1_16_220: [6]CaseFoldMapping1_16 = [6]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 220,
        .to0 = 252,
    },
    CaseFoldMapping1_16{
        .from = 1240,
        .to0 = 1241,
    },
    CaseFoldMapping1_16{
        .from = 7874,
        .to0 = 7875,
    },
    CaseFoldMapping1_16{
        .from = 42875,
        .to0 = 42876,
    },
    CaseFoldMapping1_16{
        .from = 43895,
        .to0 = 5031,
    },
    CaseFoldMapping1_16{
        .from = 65315,
        .to0 = 65347,
    },
};
pub const case_fold1_16_221: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 221,
        .to0 = 253,
    },
    CaseFoldMapping1_16{
        .from = 990,
        .to0 = 991,
    },
    CaseFoldMapping1_16{
        .from = 4301,
        .to0 = 11565,
    },
    CaseFoldMapping1_16{
        .from = 43894,
        .to0 = 5030,
    },
    CaseFoldMapping1_16{
        .from = 65314,
        .to0 = 65346,
    },
};
pub const case_fold1_16_222: [7]CaseFoldMapping1_16 = [7]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 222,
        .to0 = 254,
    },
    CaseFoldMapping1_16{
        .from = 1242,
        .to0 = 1243,
    },
    CaseFoldMapping1_16{
        .from = 7872,
        .to0 = 7873,
    },
    CaseFoldMapping1_16{
        .from = 11506,
        .to0 = 11507,
    },
    CaseFoldMapping1_16{
        .from = 42873,
        .to0 = 42874,
    },
    CaseFoldMapping1_16{
        .from = 43893,
        .to0 = 5029,
    },
    CaseFoldMapping1_16{
        .from = 65313,
        .to0 = 65345,
    },
};
pub const case_fold1_16_223: [3]CaseFoldMapping1_16 = [3]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 478,
        .to0 = 479,
    },
    CaseFoldMapping1_16{
        .from = 988,
        .to0 = 989,
    },
    CaseFoldMapping1_16{
        .from = 43892,
        .to0 = 5028,
    },
};
pub const case_fold1_16_224: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 1252,
        .to0 = 1253,
    },
    CaseFoldMapping1_16{
        .from = 7934,
        .to0 = 7935,
    },
    CaseFoldMapping1_16{
        .from = 9412,
        .to0 = 9438,
    },
    CaseFoldMapping1_16{
        .from = 11468,
        .to0 = 11469,
    },
    CaseFoldMapping1_16{
        .from = 42566,
        .to0 = 42567,
    },
};
pub const case_fold1_16_225: [4]CaseFoldMapping1_16 = [4]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 480,
        .to0 = 481,
    },
    CaseFoldMapping1_16{
        .from = 994,
        .to0 = 995,
    },
    CaseFoldMapping1_16{
        .from = 9413,
        .to0 = 9439,
    },
    CaseFoldMapping1_16{
        .from = 42822,
        .to0 = 42823,
    },
};
pub const case_fold1_16_226: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 1254,
        .to0 = 1255,
    },
    CaseFoldMapping1_16{
        .from = 7932,
        .to0 = 7933,
    },
    CaseFoldMapping1_16{
        .from = 9414,
        .to0 = 9440,
    },
    CaseFoldMapping1_16{
        .from = 11470,
        .to0 = 11471,
    },
    CaseFoldMapping1_16{
        .from = 42564,
        .to0 = 42565,
    },
};
pub const case_fold1_16_227: [4]CaseFoldMapping1_16 = [4]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 482,
        .to0 = 483,
    },
    CaseFoldMapping1_16{
        .from = 992,
        .to0 = 993,
    },
    CaseFoldMapping1_16{
        .from = 9415,
        .to0 = 9441,
    },
    CaseFoldMapping1_16{
        .from = 42820,
        .to0 = 42821,
    },
};
pub const case_fold1_16_228: [6]CaseFoldMapping1_16 = [6]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 1248,
        .to0 = 1249,
    },
    CaseFoldMapping1_16{
        .from = 7930,
        .to0 = 7931,
    },
    CaseFoldMapping1_16{
        .from = 8187,
        .to0 = 8061,
    },
    CaseFoldMapping1_16{
        .from = 9408,
        .to0 = 9434,
    },
    CaseFoldMapping1_16{
        .from = 11464,
        .to0 = 11465,
    },
    CaseFoldMapping1_16{
        .from = 42562,
        .to0 = 42563,
    },
};
pub const case_fold1_16_229: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 484,
        .to0 = 485,
    },
    CaseFoldMapping1_16{
        .from = 998,
        .to0 = 999,
    },
    CaseFoldMapping1_16{
        .from = 8186,
        .to0 = 8060,
    },
    CaseFoldMapping1_16{
        .from = 9409,
        .to0 = 9435,
    },
    CaseFoldMapping1_16{
        .from = 42818,
        .to0 = 42819,
    },
};
pub const case_fold1_16_230: [6]CaseFoldMapping1_16 = [6]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 1250,
        .to0 = 1251,
    },
    CaseFoldMapping1_16{
        .from = 7928,
        .to0 = 7929,
    },
    CaseFoldMapping1_16{
        .from = 8185,
        .to0 = 8057,
    },
    CaseFoldMapping1_16{
        .from = 9410,
        .to0 = 9436,
    },
    CaseFoldMapping1_16{
        .from = 11466,
        .to0 = 11467,
    },
    CaseFoldMapping1_16{
        .from = 42560,
        .to0 = 42561,
    },
};
pub const case_fold1_16_231: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 486,
        .to0 = 487,
    },
    CaseFoldMapping1_16{
        .from = 996,
        .to0 = 997,
    },
    CaseFoldMapping1_16{
        .from = 8184,
        .to0 = 8056,
    },
    CaseFoldMapping1_16{
        .from = 9411,
        .to0 = 9437,
    },
    CaseFoldMapping1_16{
        .from = 42816,
        .to0 = 42817,
    },
};
pub const case_fold1_16_232: [6]CaseFoldMapping1_16 = [6]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 1260,
        .to0 = 1261,
    },
    CaseFoldMapping1_16{
        .from = 5115,
        .to0 = 5107,
    },
    CaseFoldMapping1_16{
        .from = 7926,
        .to0 = 7927,
    },
    CaseFoldMapping1_16{
        .from = 9420,
        .to0 = 9446,
    },
    CaseFoldMapping1_16{
        .from = 11460,
        .to0 = 11461,
    },
    CaseFoldMapping1_16{
        .from = 42574,
        .to0 = 42575,
    },
};
pub const case_fold1_16_233: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 488,
        .to0 = 489,
    },
    CaseFoldMapping1_16{
        .from = 1002,
        .to0 = 1003,
    },
    CaseFoldMapping1_16{
        .from = 5114,
        .to0 = 5106,
    },
    CaseFoldMapping1_16{
        .from = 9421,
        .to0 = 9447,
    },
    CaseFoldMapping1_16{
        .from = 42830,
        .to0 = 42831,
    },
};
pub const case_fold1_16_234: [6]CaseFoldMapping1_16 = [6]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 1262,
        .to0 = 1263,
    },
    CaseFoldMapping1_16{
        .from = 5113,
        .to0 = 5105,
    },
    CaseFoldMapping1_16{
        .from = 7924,
        .to0 = 7925,
    },
    CaseFoldMapping1_16{
        .from = 9422,
        .to0 = 9448,
    },
    CaseFoldMapping1_16{
        .from = 11462,
        .to0 = 11463,
    },
    CaseFoldMapping1_16{
        .from = 42572,
        .to0 = 42573,
    },
};
pub const case_fold1_16_235: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 490,
        .to0 = 491,
    },
    CaseFoldMapping1_16{
        .from = 1000,
        .to0 = 1001,
    },
    CaseFoldMapping1_16{
        .from = 5112,
        .to0 = 5104,
    },
    CaseFoldMapping1_16{
        .from = 9423,
        .to0 = 9449,
    },
    CaseFoldMapping1_16{
        .from = 42828,
        .to0 = 42829,
    },
};
pub const case_fold1_16_236: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 1256,
        .to0 = 1257,
    },
    CaseFoldMapping1_16{
        .from = 7922,
        .to0 = 7923,
    },
    CaseFoldMapping1_16{
        .from = 9416,
        .to0 = 9442,
    },
    CaseFoldMapping1_16{
        .from = 11456,
        .to0 = 11457,
    },
    CaseFoldMapping1_16{
        .from = 42570,
        .to0 = 42571,
    },
};
pub const case_fold1_16_237: [4]CaseFoldMapping1_16 = [4]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 492,
        .to0 = 493,
    },
    CaseFoldMapping1_16{
        .from = 1006,
        .to0 = 1007,
    },
    CaseFoldMapping1_16{
        .from = 9417,
        .to0 = 9443,
    },
    CaseFoldMapping1_16{
        .from = 42826,
        .to0 = 42827,
    },
};
pub const case_fold1_16_238: [6]CaseFoldMapping1_16 = [6]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 1258,
        .to0 = 1259,
    },
    CaseFoldMapping1_16{
        .from = 5117,
        .to0 = 5109,
    },
    CaseFoldMapping1_16{
        .from = 7920,
        .to0 = 7921,
    },
    CaseFoldMapping1_16{
        .from = 9418,
        .to0 = 9444,
    },
    CaseFoldMapping1_16{
        .from = 11458,
        .to0 = 11459,
    },
    CaseFoldMapping1_16{
        .from = 42568,
        .to0 = 42569,
    },
};
pub const case_fold1_16_239: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 494,
        .to0 = 495,
    },
    CaseFoldMapping1_16{
        .from = 1004,
        .to0 = 1005,
    },
    CaseFoldMapping1_16{
        .from = 5116,
        .to0 = 5108,
    },
    CaseFoldMapping1_16{
        .from = 9419,
        .to0 = 9445,
    },
    CaseFoldMapping1_16{
        .from = 42824,
        .to0 = 42825,
    },
};
pub const case_fold1_16_240: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 497,
        .to0 = 499,
    },
    CaseFoldMapping1_16{
        .from = 1268,
        .to0 = 1269,
    },
    CaseFoldMapping1_16{
        .from = 7918,
        .to0 = 7919,
    },
    CaseFoldMapping1_16{
        .from = 11484,
        .to0 = 11485,
    },
    CaseFoldMapping1_16{
        .from = 42582,
        .to0 = 42583,
    },
};
pub const case_fold1_16_241: [1]CaseFoldMapping1_16 = [1]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 42838,
        .to0 = 42839,
    },
};
pub const case_fold1_16_242: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 1009,
        .to0 = 961,
    },
    CaseFoldMapping1_16{
        .from = 1270,
        .to0 = 1271,
    },
    CaseFoldMapping1_16{
        .from = 7916,
        .to0 = 7917,
    },
    CaseFoldMapping1_16{
        .from = 11486,
        .to0 = 11487,
    },
    CaseFoldMapping1_16{
        .from = 42580,
        .to0 = 42581,
    },
};
pub const case_fold1_16_243: [4]CaseFoldMapping1_16 = [4]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 498,
        .to0 = 499,
    },
    CaseFoldMapping1_16{
        .from = 1008,
        .to0 = 954,
    },
    CaseFoldMapping1_16{
        .from = 8172,
        .to0 = 8165,
    },
    CaseFoldMapping1_16{
        .from = 42836,
        .to0 = 42837,
    },
};
pub const case_fold1_16_244: [6]CaseFoldMapping1_16 = [6]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 1015,
        .to0 = 1016,
    },
    CaseFoldMapping1_16{
        .from = 1264,
        .to0 = 1265,
    },
    CaseFoldMapping1_16{
        .from = 7914,
        .to0 = 7915,
    },
    CaseFoldMapping1_16{
        .from = 8171,
        .to0 = 8059,
    },
    CaseFoldMapping1_16{
        .from = 11480,
        .to0 = 11481,
    },
    CaseFoldMapping1_16{
        .from = 42578,
        .to0 = 42579,
    },
};
pub const case_fold1_16_245: [3]CaseFoldMapping1_16 = [3]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 500,
        .to0 = 501,
    },
    CaseFoldMapping1_16{
        .from = 8170,
        .to0 = 8058,
    },
    CaseFoldMapping1_16{
        .from = 42834,
        .to0 = 42835,
    },
};
pub const case_fold1_16_246: [7]CaseFoldMapping1_16 = [7]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 503,
        .to0 = 447,
    },
    CaseFoldMapping1_16{
        .from = 1013,
        .to0 = 949,
    },
    CaseFoldMapping1_16{
        .from = 1266,
        .to0 = 1267,
    },
    CaseFoldMapping1_16{
        .from = 7912,
        .to0 = 7913,
    },
    CaseFoldMapping1_16{
        .from = 8169,
        .to0 = 8161,
    },
    CaseFoldMapping1_16{
        .from = 11482,
        .to0 = 11483,
    },
    CaseFoldMapping1_16{
        .from = 42576,
        .to0 = 42577,
    },
};
pub const case_fold1_16_247: [4]CaseFoldMapping1_16 = [4]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 502,
        .to0 = 405,
    },
    CaseFoldMapping1_16{
        .from = 1012,
        .to0 = 952,
    },
    CaseFoldMapping1_16{
        .from = 8168,
        .to0 = 8160,
    },
    CaseFoldMapping1_16{
        .from = 42832,
        .to0 = 42833,
    },
};
pub const case_fold1_16_248: [4]CaseFoldMapping1_16 = [4]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 1276,
        .to0 = 1277,
    },
    CaseFoldMapping1_16{
        .from = 7910,
        .to0 = 7911,
    },
    CaseFoldMapping1_16{
        .from = 11476,
        .to0 = 11477,
    },
    CaseFoldMapping1_16{
        .from = 42590,
        .to0 = 42591,
    },
};
pub const case_fold1_16_249: [3]CaseFoldMapping1_16 = [3]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 504,
        .to0 = 505,
    },
    CaseFoldMapping1_16{
        .from = 1018,
        .to0 = 1019,
    },
    CaseFoldMapping1_16{
        .from = 42846,
        .to0 = 42847,
    },
};
pub const case_fold1_16_250: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 1017,
        .to0 = 1010,
    },
    CaseFoldMapping1_16{
        .from = 1278,
        .to0 = 1279,
    },
    CaseFoldMapping1_16{
        .from = 7908,
        .to0 = 7909,
    },
    CaseFoldMapping1_16{
        .from = 11478,
        .to0 = 11479,
    },
    CaseFoldMapping1_16{
        .from = 42588,
        .to0 = 42589,
    },
};
pub const case_fold1_16_251: [2]CaseFoldMapping1_16 = [2]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 506,
        .to0 = 507,
    },
    CaseFoldMapping1_16{
        .from = 42844,
        .to0 = 42845,
    },
};
pub const case_fold1_16_252: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 1023,
        .to0 = 893,
    },
    CaseFoldMapping1_16{
        .from = 1272,
        .to0 = 1273,
    },
    CaseFoldMapping1_16{
        .from = 7906,
        .to0 = 7907,
    },
    CaseFoldMapping1_16{
        .from = 11472,
        .to0 = 11473,
    },
    CaseFoldMapping1_16{
        .from = 42586,
        .to0 = 42587,
    },
};
pub const case_fold1_16_253: [3]CaseFoldMapping1_16 = [3]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 508,
        .to0 = 509,
    },
    CaseFoldMapping1_16{
        .from = 1022,
        .to0 = 892,
    },
    CaseFoldMapping1_16{
        .from = 42842,
        .to0 = 42843,
    },
};
pub const case_fold1_16_254: [5]CaseFoldMapping1_16 = [5]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 1021,
        .to0 = 891,
    },
    CaseFoldMapping1_16{
        .from = 1274,
        .to0 = 1275,
    },
    CaseFoldMapping1_16{
        .from = 7904,
        .to0 = 7905,
    },
    CaseFoldMapping1_16{
        .from = 11474,
        .to0 = 11475,
    },
    CaseFoldMapping1_16{
        .from = 42584,
        .to0 = 42585,
    },
};
pub const case_fold1_16_255: [2]CaseFoldMapping1_16 = [2]CaseFoldMapping1_16{
    CaseFoldMapping1_16{
        .from = 510,
        .to0 = 511,
    },
    CaseFoldMapping1_16{
        .from = 42840,
        .to0 = 42841,
    },
};
pub const case_fold1_32_000: [17]CaseFoldMapping1_32 = [17]CaseFoldMapping1_32{
    CaseFoldMapping1_32{
        .from = 66564,
        .to0 = 66604,
    },
    CaseFoldMapping1_32{
        .from = 66580,
        .to0 = 66620,
    },
    CaseFoldMapping1_32{
        .from = 66596,
        .to0 = 66636,
    },
    CaseFoldMapping1_32{
        .from = 66740,
        .to0 = 66780,
    },
    CaseFoldMapping1_32{
        .from = 66756,
        .to0 = 66796,
    },
    CaseFoldMapping1_32{
        .from = 66933,
        .to0 = 66972,
    },
    CaseFoldMapping1_32{
        .from = 66949,
        .to0 = 66988,
    },
    CaseFoldMapping1_32{
        .from = 66965,
        .to0 = 67004,
    },
    CaseFoldMapping1_32{
        .from = 68748,
        .to0 = 68812,
    },
    CaseFoldMapping1_32{
        .from = 68764,
        .to0 = 68828,
    },
    CaseFoldMapping1_32{
        .from = 68780,
        .to0 = 68844,
    },
    CaseFoldMapping1_32{
        .from = 71848,
        .to0 = 71880,
    },
    CaseFoldMapping1_32{
        .from = 71864,
        .to0 = 71896,
    },
    CaseFoldMapping1_32{
        .from = 93774,
        .to0 = 93806,
    },
    CaseFoldMapping1_32{
        .from = 93790,
        .to0 = 93822,
    },
    CaseFoldMapping1_32{
        .from = 125193,
        .to0 = 125227,
    },
    CaseFoldMapping1_32{
        .from = 125209,
        .to0 = 125243,
    },
};
pub const case_fold1_32_001: [17]CaseFoldMapping1_32 = [17]CaseFoldMapping1_32{
    CaseFoldMapping1_32{
        .from = 66565,
        .to0 = 66605,
    },
    CaseFoldMapping1_32{
        .from = 66581,
        .to0 = 66621,
    },
    CaseFoldMapping1_32{
        .from = 66597,
        .to0 = 66637,
    },
    CaseFoldMapping1_32{
        .from = 66741,
        .to0 = 66781,
    },
    CaseFoldMapping1_32{
        .from = 66757,
        .to0 = 66797,
    },
    CaseFoldMapping1_32{
        .from = 66932,
        .to0 = 66971,
    },
    CaseFoldMapping1_32{
        .from = 66948,
        .to0 = 66987,
    },
    CaseFoldMapping1_32{
        .from = 66964,
        .to0 = 67003,
    },
    CaseFoldMapping1_32{
        .from = 68749,
        .to0 = 68813,
    },
    CaseFoldMapping1_32{
        .from = 68765,
        .to0 = 68829,
    },
    CaseFoldMapping1_32{
        .from = 68781,
        .to0 = 68845,
    },
    CaseFoldMapping1_32{
        .from = 71849,
        .to0 = 71881,
    },
    CaseFoldMapping1_32{
        .from = 71865,
        .to0 = 71897,
    },
    CaseFoldMapping1_32{
        .from = 93775,
        .to0 = 93807,
    },
    CaseFoldMapping1_32{
        .from = 93791,
        .to0 = 93823,
    },
    CaseFoldMapping1_32{
        .from = 125192,
        .to0 = 125226,
    },
    CaseFoldMapping1_32{
        .from = 125208,
        .to0 = 125242,
    },
};
pub const case_fold1_32_002: [16]CaseFoldMapping1_32 = [16]CaseFoldMapping1_32{
    CaseFoldMapping1_32{
        .from = 66566,
        .to0 = 66606,
    },
    CaseFoldMapping1_32{
        .from = 66582,
        .to0 = 66622,
    },
    CaseFoldMapping1_32{
        .from = 66598,
        .to0 = 66638,
    },
    CaseFoldMapping1_32{
        .from = 66742,
        .to0 = 66782,
    },
    CaseFoldMapping1_32{
        .from = 66758,
        .to0 = 66798,
    },
    CaseFoldMapping1_32{
        .from = 66935,
        .to0 = 66974,
    },
    CaseFoldMapping1_32{
        .from = 66951,
        .to0 = 66990,
    },
    CaseFoldMapping1_32{
        .from = 68750,
        .to0 = 68814,
    },
    CaseFoldMapping1_32{
        .from = 68766,
        .to0 = 68830,
    },
    CaseFoldMapping1_32{
        .from = 68782,
        .to0 = 68846,
    },
    CaseFoldMapping1_32{
        .from = 71850,
        .to0 = 71882,
    },
    CaseFoldMapping1_32{
        .from = 71866,
        .to0 = 71898,
    },
    CaseFoldMapping1_32{
        .from = 93772,
        .to0 = 93804,
    },
    CaseFoldMapping1_32{
        .from = 93788,
        .to0 = 93820,
    },
    CaseFoldMapping1_32{
        .from = 125195,
        .to0 = 125229,
    },
    CaseFoldMapping1_32{
        .from = 125211,
        .to0 = 125245,
    },
};
pub const case_fold1_32_003: [16]CaseFoldMapping1_32 = [16]CaseFoldMapping1_32{
    CaseFoldMapping1_32{
        .from = 66567,
        .to0 = 66607,
    },
    CaseFoldMapping1_32{
        .from = 66583,
        .to0 = 66623,
    },
    CaseFoldMapping1_32{
        .from = 66599,
        .to0 = 66639,
    },
    CaseFoldMapping1_32{
        .from = 66743,
        .to0 = 66783,
    },
    CaseFoldMapping1_32{
        .from = 66759,
        .to0 = 66799,
    },
    CaseFoldMapping1_32{
        .from = 66934,
        .to0 = 66973,
    },
    CaseFoldMapping1_32{
        .from = 66950,
        .to0 = 66989,
    },
    CaseFoldMapping1_32{
        .from = 68751,
        .to0 = 68815,
    },
    CaseFoldMapping1_32{
        .from = 68767,
        .to0 = 68831,
    },
    CaseFoldMapping1_32{
        .from = 68783,
        .to0 = 68847,
    },
    CaseFoldMapping1_32{
        .from = 71851,
        .to0 = 71883,
    },
    CaseFoldMapping1_32{
        .from = 71867,
        .to0 = 71899,
    },
    CaseFoldMapping1_32{
        .from = 93773,
        .to0 = 93805,
    },
    CaseFoldMapping1_32{
        .from = 93789,
        .to0 = 93821,
    },
    CaseFoldMapping1_32{
        .from = 125194,
        .to0 = 125228,
    },
    CaseFoldMapping1_32{
        .from = 125210,
        .to0 = 125244,
    },
};
pub const case_fold1_32_004: [18]CaseFoldMapping1_32 = [18]CaseFoldMapping1_32{
    CaseFoldMapping1_32{
        .from = 66560,
        .to0 = 66600,
    },
    CaseFoldMapping1_32{
        .from = 66576,
        .to0 = 66616,
    },
    CaseFoldMapping1_32{
        .from = 66592,
        .to0 = 66632,
    },
    CaseFoldMapping1_32{
        .from = 66736,
        .to0 = 66776,
    },
    CaseFoldMapping1_32{
        .from = 66752,
        .to0 = 66792,
    },
    CaseFoldMapping1_32{
        .from = 66768,
        .to0 = 66808,
    },
    CaseFoldMapping1_32{
        .from = 66929,
        .to0 = 66968,
    },
    CaseFoldMapping1_32{
        .from = 66945,
        .to0 = 66984,
    },
    CaseFoldMapping1_32{
        .from = 66961,
        .to0 = 67000,
    },
    CaseFoldMapping1_32{
        .from = 68744,
        .to0 = 68808,
    },
    CaseFoldMapping1_32{
        .from = 68760,
        .to0 = 68824,
    },
    CaseFoldMapping1_32{
        .from = 68776,
        .to0 = 68840,
    },
    CaseFoldMapping1_32{
        .from = 71852,
        .to0 = 71884,
    },
    CaseFoldMapping1_32{
        .from = 71868,
        .to0 = 71900,
    },
    CaseFoldMapping1_32{
        .from = 93770,
        .to0 = 93802,
    },
    CaseFoldMapping1_32{
        .from = 93786,
        .to0 = 93818,
    },
    CaseFoldMapping1_32{
        .from = 125197,
        .to0 = 125231,
    },
    CaseFoldMapping1_32{
        .from = 125213,
        .to0 = 125247,
    },
};
pub const case_fold1_32_005: [18]CaseFoldMapping1_32 = [18]CaseFoldMapping1_32{
    CaseFoldMapping1_32{
        .from = 66561,
        .to0 = 66601,
    },
    CaseFoldMapping1_32{
        .from = 66577,
        .to0 = 66617,
    },
    CaseFoldMapping1_32{
        .from = 66593,
        .to0 = 66633,
    },
    CaseFoldMapping1_32{
        .from = 66737,
        .to0 = 66777,
    },
    CaseFoldMapping1_32{
        .from = 66753,
        .to0 = 66793,
    },
    CaseFoldMapping1_32{
        .from = 66769,
        .to0 = 66809,
    },
    CaseFoldMapping1_32{
        .from = 66928,
        .to0 = 66967,
    },
    CaseFoldMapping1_32{
        .from = 66944,
        .to0 = 66983,
    },
    CaseFoldMapping1_32{
        .from = 66960,
        .to0 = 66999,
    },
    CaseFoldMapping1_32{
        .from = 68745,
        .to0 = 68809,
    },
    CaseFoldMapping1_32{
        .from = 68761,
        .to0 = 68825,
    },
    CaseFoldMapping1_32{
        .from = 68777,
        .to0 = 68841,
    },
    CaseFoldMapping1_32{
        .from = 71853,
        .to0 = 71885,
    },
    CaseFoldMapping1_32{
        .from = 71869,
        .to0 = 71901,
    },
    CaseFoldMapping1_32{
        .from = 93771,
        .to0 = 93803,
    },
    CaseFoldMapping1_32{
        .from = 93787,
        .to0 = 93819,
    },
    CaseFoldMapping1_32{
        .from = 125196,
        .to0 = 125230,
    },
    CaseFoldMapping1_32{
        .from = 125212,
        .to0 = 125246,
    },
};
pub const case_fold1_32_006: [17]CaseFoldMapping1_32 = [17]CaseFoldMapping1_32{
    CaseFoldMapping1_32{
        .from = 66562,
        .to0 = 66602,
    },
    CaseFoldMapping1_32{
        .from = 66578,
        .to0 = 66618,
    },
    CaseFoldMapping1_32{
        .from = 66594,
        .to0 = 66634,
    },
    CaseFoldMapping1_32{
        .from = 66738,
        .to0 = 66778,
    },
    CaseFoldMapping1_32{
        .from = 66754,
        .to0 = 66794,
    },
    CaseFoldMapping1_32{
        .from = 66770,
        .to0 = 66810,
    },
    CaseFoldMapping1_32{
        .from = 66931,
        .to0 = 66970,
    },
    CaseFoldMapping1_32{
        .from = 66947,
        .to0 = 66986,
    },
    CaseFoldMapping1_32{
        .from = 68746,
        .to0 = 68810,
    },
    CaseFoldMapping1_32{
        .from = 68762,
        .to0 = 68826,
    },
    CaseFoldMapping1_32{
        .from = 68778,
        .to0 = 68842,
    },
    CaseFoldMapping1_32{
        .from = 71854,
        .to0 = 71886,
    },
    CaseFoldMapping1_32{
        .from = 71870,
        .to0 = 71902,
    },
    CaseFoldMapping1_32{
        .from = 93768,
        .to0 = 93800,
    },
    CaseFoldMapping1_32{
        .from = 93784,
        .to0 = 93816,
    },
    CaseFoldMapping1_32{
        .from = 125199,
        .to0 = 125233,
    },
    CaseFoldMapping1_32{
        .from = 125215,
        .to0 = 125249,
    },
};
pub const case_fold1_32_007: [18]CaseFoldMapping1_32 = [18]CaseFoldMapping1_32{
    CaseFoldMapping1_32{
        .from = 66563,
        .to0 = 66603,
    },
    CaseFoldMapping1_32{
        .from = 66579,
        .to0 = 66619,
    },
    CaseFoldMapping1_32{
        .from = 66595,
        .to0 = 66635,
    },
    CaseFoldMapping1_32{
        .from = 66739,
        .to0 = 66779,
    },
    CaseFoldMapping1_32{
        .from = 66755,
        .to0 = 66795,
    },
    CaseFoldMapping1_32{
        .from = 66771,
        .to0 = 66811,
    },
    CaseFoldMapping1_32{
        .from = 66930,
        .to0 = 66969,
    },
    CaseFoldMapping1_32{
        .from = 66946,
        .to0 = 66985,
    },
    CaseFoldMapping1_32{
        .from = 66962,
        .to0 = 67001,
    },
    CaseFoldMapping1_32{
        .from = 68747,
        .to0 = 68811,
    },
    CaseFoldMapping1_32{
        .from = 68763,
        .to0 = 68827,
    },
    CaseFoldMapping1_32{
        .from = 68779,
        .to0 = 68843,
    },
    CaseFoldMapping1_32{
        .from = 71855,
        .to0 = 71887,
    },
    CaseFoldMapping1_32{
        .from = 71871,
        .to0 = 71903,
    },
    CaseFoldMapping1_32{
        .from = 93769,
        .to0 = 93801,
    },
    CaseFoldMapping1_32{
        .from = 93785,
        .to0 = 93817,
    },
    CaseFoldMapping1_32{
        .from = 125198,
        .to0 = 125232,
    },
    CaseFoldMapping1_32{
        .from = 125214,
        .to0 = 125248,
    },
};
pub const case_fold1_32_008: [16]CaseFoldMapping1_32 = [16]CaseFoldMapping1_32{
    CaseFoldMapping1_32{
        .from = 66572,
        .to0 = 66612,
    },
    CaseFoldMapping1_32{
        .from = 66588,
        .to0 = 66628,
    },
    CaseFoldMapping1_32{
        .from = 66748,
        .to0 = 66788,
    },
    CaseFoldMapping1_32{
        .from = 66764,
        .to0 = 66804,
    },
    CaseFoldMapping1_32{
        .from = 66941,
        .to0 = 66980,
    },
    CaseFoldMapping1_32{
        .from = 66957,
        .to0 = 66996,
    },
    CaseFoldMapping1_32{
        .from = 68740,
        .to0 = 68804,
    },
    CaseFoldMapping1_32{
        .from = 68756,
        .to0 = 68820,
    },
    CaseFoldMapping1_32{
        .from = 68772,
        .to0 = 68836,
    },
    CaseFoldMapping1_32{
        .from = 71840,
        .to0 = 71872,
    },
    CaseFoldMapping1_32{
        .from = 71856,
        .to0 = 71888,
    },
    CaseFoldMapping1_32{
        .from = 93766,
        .to0 = 93798,
    },
    CaseFoldMapping1_32{
        .from = 93782,
        .to0 = 93814,
    },
    CaseFoldMapping1_32{
        .from = 125185,
        .to0 = 125219,
    },
    CaseFoldMapping1_32{
        .from = 125201,
        .to0 = 125235,
    },
    CaseFoldMapping1_32{
        .from = 125217,
        .to0 = 125251,
    },
};
pub const case_fold1_32_009: [16]CaseFoldMapping1_32 = [16]CaseFoldMapping1_32{
    CaseFoldMapping1_32{
        .from = 66573,
        .to0 = 66613,
    },
    CaseFoldMapping1_32{
        .from = 66589,
        .to0 = 66629,
    },
    CaseFoldMapping1_32{
        .from = 66749,
        .to0 = 66789,
    },
    CaseFoldMapping1_32{
        .from = 66765,
        .to0 = 66805,
    },
    CaseFoldMapping1_32{
        .from = 66940,
        .to0 = 66979,
    },
    CaseFoldMapping1_32{
        .from = 66956,
        .to0 = 66995,
    },
    CaseFoldMapping1_32{
        .from = 68741,
        .to0 = 68805,
    },
    CaseFoldMapping1_32{
        .from = 68757,
        .to0 = 68821,
    },
    CaseFoldMapping1_32{
        .from = 68773,
        .to0 = 68837,
    },
    CaseFoldMapping1_32{
        .from = 71841,
        .to0 = 71873,
    },
    CaseFoldMapping1_32{
        .from = 71857,
        .to0 = 71889,
    },
    CaseFoldMapping1_32{
        .from = 93767,
        .to0 = 93799,
    },
    CaseFoldMapping1_32{
        .from = 93783,
        .to0 = 93815,
    },
    CaseFoldMapping1_32{
        .from = 125184,
        .to0 = 125218,
    },
    CaseFoldMapping1_32{
        .from = 125200,
        .to0 = 125234,
    },
    CaseFoldMapping1_32{
        .from = 125216,
        .to0 = 125250,
    },
};
pub const case_fold1_32_010: [15]CaseFoldMapping1_32 = [15]CaseFoldMapping1_32{
    CaseFoldMapping1_32{
        .from = 66574,
        .to0 = 66614,
    },
    CaseFoldMapping1_32{
        .from = 66590,
        .to0 = 66630,
    },
    CaseFoldMapping1_32{
        .from = 66750,
        .to0 = 66790,
    },
    CaseFoldMapping1_32{
        .from = 66766,
        .to0 = 66806,
    },
    CaseFoldMapping1_32{
        .from = 66943,
        .to0 = 66982,
    },
    CaseFoldMapping1_32{
        .from = 66959,
        .to0 = 66998,
    },
    CaseFoldMapping1_32{
        .from = 68742,
        .to0 = 68806,
    },
    CaseFoldMapping1_32{
        .from = 68758,
        .to0 = 68822,
    },
    CaseFoldMapping1_32{
        .from = 68774,
        .to0 = 68838,
    },
    CaseFoldMapping1_32{
        .from = 71842,
        .to0 = 71874,
    },
    CaseFoldMapping1_32{
        .from = 71858,
        .to0 = 71890,
    },
    CaseFoldMapping1_32{
        .from = 93764,
        .to0 = 93796,
    },
    CaseFoldMapping1_32{
        .from = 93780,
        .to0 = 93812,
    },
    CaseFoldMapping1_32{
        .from = 125187,
        .to0 = 125221,
    },
    CaseFoldMapping1_32{
        .from = 125203,
        .to0 = 125237,
    },
};
pub const case_fold1_32_011: [15]CaseFoldMapping1_32 = [15]CaseFoldMapping1_32{
    CaseFoldMapping1_32{
        .from = 66575,
        .to0 = 66615,
    },
    CaseFoldMapping1_32{
        .from = 66591,
        .to0 = 66631,
    },
    CaseFoldMapping1_32{
        .from = 66751,
        .to0 = 66791,
    },
    CaseFoldMapping1_32{
        .from = 66767,
        .to0 = 66807,
    },
    CaseFoldMapping1_32{
        .from = 66942,
        .to0 = 66981,
    },
    CaseFoldMapping1_32{
        .from = 66958,
        .to0 = 66997,
    },
    CaseFoldMapping1_32{
        .from = 68743,
        .to0 = 68807,
    },
    CaseFoldMapping1_32{
        .from = 68759,
        .to0 = 68823,
    },
    CaseFoldMapping1_32{
        .from = 68775,
        .to0 = 68839,
    },
    CaseFoldMapping1_32{
        .from = 71843,
        .to0 = 71875,
    },
    CaseFoldMapping1_32{
        .from = 71859,
        .to0 = 71891,
    },
    CaseFoldMapping1_32{
        .from = 93765,
        .to0 = 93797,
    },
    CaseFoldMapping1_32{
        .from = 93781,
        .to0 = 93813,
    },
    CaseFoldMapping1_32{
        .from = 125186,
        .to0 = 125220,
    },
    CaseFoldMapping1_32{
        .from = 125202,
        .to0 = 125236,
    },
};
pub const case_fold1_32_012: [16]CaseFoldMapping1_32 = [16]CaseFoldMapping1_32{
    CaseFoldMapping1_32{
        .from = 66568,
        .to0 = 66608,
    },
    CaseFoldMapping1_32{
        .from = 66584,
        .to0 = 66624,
    },
    CaseFoldMapping1_32{
        .from = 66744,
        .to0 = 66784,
    },
    CaseFoldMapping1_32{
        .from = 66760,
        .to0 = 66800,
    },
    CaseFoldMapping1_32{
        .from = 66937,
        .to0 = 66976,
    },
    CaseFoldMapping1_32{
        .from = 66953,
        .to0 = 66992,
    },
    CaseFoldMapping1_32{
        .from = 68736,
        .to0 = 68800,
    },
    CaseFoldMapping1_32{
        .from = 68752,
        .to0 = 68816,
    },
    CaseFoldMapping1_32{
        .from = 68768,
        .to0 = 68832,
    },
    CaseFoldMapping1_32{
        .from = 68784,
        .to0 = 68848,
    },
    CaseFoldMapping1_32{
        .from = 71844,
        .to0 = 71876,
    },
    CaseFoldMapping1_32{
        .from = 71860,
        .to0 = 71892,
    },
    CaseFoldMapping1_32{
        .from = 93762,
        .to0 = 93794,
    },
    CaseFoldMapping1_32{
        .from = 93778,
        .to0 = 93810,
    },
    CaseFoldMapping1_32{
        .from = 125189,
        .to0 = 125223,
    },
    CaseFoldMapping1_32{
        .from = 125205,
        .to0 = 125239,
    },
};
pub const case_fold1_32_013: [16]CaseFoldMapping1_32 = [16]CaseFoldMapping1_32{
    CaseFoldMapping1_32{
        .from = 66569,
        .to0 = 66609,
    },
    CaseFoldMapping1_32{
        .from = 66585,
        .to0 = 66625,
    },
    CaseFoldMapping1_32{
        .from = 66745,
        .to0 = 66785,
    },
    CaseFoldMapping1_32{
        .from = 66761,
        .to0 = 66801,
    },
    CaseFoldMapping1_32{
        .from = 66936,
        .to0 = 66975,
    },
    CaseFoldMapping1_32{
        .from = 66952,
        .to0 = 66991,
    },
    CaseFoldMapping1_32{
        .from = 68737,
        .to0 = 68801,
    },
    CaseFoldMapping1_32{
        .from = 68753,
        .to0 = 68817,
    },
    CaseFoldMapping1_32{
        .from = 68769,
        .to0 = 68833,
    },
    CaseFoldMapping1_32{
        .from = 68785,
        .to0 = 68849,
    },
    CaseFoldMapping1_32{
        .from = 71845,
        .to0 = 71877,
    },
    CaseFoldMapping1_32{
        .from = 71861,
        .to0 = 71893,
    },
    CaseFoldMapping1_32{
        .from = 93763,
        .to0 = 93795,
    },
    CaseFoldMapping1_32{
        .from = 93779,
        .to0 = 93811,
    },
    CaseFoldMapping1_32{
        .from = 125188,
        .to0 = 125222,
    },
    CaseFoldMapping1_32{
        .from = 125204,
        .to0 = 125238,
    },
};
pub const case_fold1_32_014: [14]CaseFoldMapping1_32 = [14]CaseFoldMapping1_32{
    CaseFoldMapping1_32{
        .from = 66570,
        .to0 = 66610,
    },
    CaseFoldMapping1_32{
        .from = 66586,
        .to0 = 66626,
    },
    CaseFoldMapping1_32{
        .from = 66746,
        .to0 = 66786,
    },
    CaseFoldMapping1_32{
        .from = 66762,
        .to0 = 66802,
    },
    CaseFoldMapping1_32{
        .from = 68738,
        .to0 = 68802,
    },
    CaseFoldMapping1_32{
        .from = 68754,
        .to0 = 68818,
    },
    CaseFoldMapping1_32{
        .from = 68770,
        .to0 = 68834,
    },
    CaseFoldMapping1_32{
        .from = 68786,
        .to0 = 68850,
    },
    CaseFoldMapping1_32{
        .from = 71846,
        .to0 = 71878,
    },
    CaseFoldMapping1_32{
        .from = 71862,
        .to0 = 71894,
    },
    CaseFoldMapping1_32{
        .from = 93760,
        .to0 = 93792,
    },
    CaseFoldMapping1_32{
        .from = 93776,
        .to0 = 93808,
    },
    CaseFoldMapping1_32{
        .from = 125191,
        .to0 = 125225,
    },
    CaseFoldMapping1_32{
        .from = 125207,
        .to0 = 125241,
    },
};
pub const case_fold1_32_015: [15]CaseFoldMapping1_32 = [15]CaseFoldMapping1_32{
    CaseFoldMapping1_32{
        .from = 66571,
        .to0 = 66611,
    },
    CaseFoldMapping1_32{
        .from = 66587,
        .to0 = 66627,
    },
    CaseFoldMapping1_32{
        .from = 66747,
        .to0 = 66787,
    },
    CaseFoldMapping1_32{
        .from = 66763,
        .to0 = 66803,
    },
    CaseFoldMapping1_32{
        .from = 66938,
        .to0 = 66977,
    },
    CaseFoldMapping1_32{
        .from = 66954,
        .to0 = 66993,
    },
    CaseFoldMapping1_32{
        .from = 68739,
        .to0 = 68803,
    },
    CaseFoldMapping1_32{
        .from = 68755,
        .to0 = 68819,
    },
    CaseFoldMapping1_32{
        .from = 68771,
        .to0 = 68835,
    },
    CaseFoldMapping1_32{
        .from = 71847,
        .to0 = 71879,
    },
    CaseFoldMapping1_32{
        .from = 71863,
        .to0 = 71895,
    },
    CaseFoldMapping1_32{
        .from = 93761,
        .to0 = 93793,
    },
    CaseFoldMapping1_32{
        .from = 93777,
        .to0 = 93809,
    },
    CaseFoldMapping1_32{
        .from = 125190,
        .to0 = 125224,
    },
    CaseFoldMapping1_32{
        .from = 125206,
        .to0 = 125240,
    },
};
pub const case_fold2_16_000: [4]CaseFoldMapping2_16 = [4]CaseFoldMapping2_16{
    CaseFoldMapping2_16{
        .from = 7838,
        .to0 = 115,
        .to1 = 115,
    },
    CaseFoldMapping2_16{
        .from = 8079,
        .to0 = 7943,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 8095,
        .to0 = 7975,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 8111,
        .to0 = 8039,
        .to1 = 953,
    },
};
pub const case_fold2_16_001: [5]CaseFoldMapping2_16 = [5]CaseFoldMapping2_16{
    CaseFoldMapping2_16{
        .from = 304,
        .to0 = 105,
        .to1 = 775,
    },
    CaseFoldMapping2_16{
        .from = 496,
        .to0 = 106,
        .to1 = 780,
    },
    CaseFoldMapping2_16{
        .from = 8078,
        .to0 = 7942,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 8094,
        .to0 = 7974,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 8110,
        .to0 = 8038,
        .to1 = 953,
    },
};
pub const case_fold2_16_002: [4]CaseFoldMapping2_16 = [4]CaseFoldMapping2_16{
    CaseFoldMapping2_16{
        .from = 1415,
        .to0 = 1381,
        .to1 = 1410,
    },
    CaseFoldMapping2_16{
        .from = 8077,
        .to0 = 7941,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 8093,
        .to0 = 7973,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 8109,
        .to0 = 8037,
        .to1 = 953,
    },
};
pub const case_fold2_16_003: [6]CaseFoldMapping2_16 = [6]CaseFoldMapping2_16{
    CaseFoldMapping2_16{
        .from = 8076,
        .to0 = 7940,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 8092,
        .to0 = 7972,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 8108,
        .to0 = 8036,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 8124,
        .to0 = 945,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 8140,
        .to0 = 951,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 8188,
        .to0 = 969,
        .to1 = 953,
    },
};
pub const case_fold2_16_004: [4]CaseFoldMapping2_16 = [4]CaseFoldMapping2_16{
    CaseFoldMapping2_16{
        .from = 7834,
        .to0 = 97,
        .to1 = 702,
    },
    CaseFoldMapping2_16{
        .from = 8075,
        .to0 = 7939,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 8091,
        .to0 = 7971,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 8107,
        .to0 = 8035,
        .to1 = 953,
    },
};
pub const case_fold2_16_005: [3]CaseFoldMapping2_16 = [3]CaseFoldMapping2_16{
    CaseFoldMapping2_16{
        .from = 8074,
        .to0 = 7938,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 8090,
        .to0 = 7970,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 8106,
        .to0 = 8034,
        .to1 = 953,
    },
};
pub const case_fold2_16_006: [4]CaseFoldMapping2_16 = [4]CaseFoldMapping2_16{
    CaseFoldMapping2_16{
        .from = 7832,
        .to0 = 119,
        .to1 = 778,
    },
    CaseFoldMapping2_16{
        .from = 8073,
        .to0 = 7937,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 8089,
        .to0 = 7969,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 8105,
        .to0 = 8033,
        .to1 = 953,
    },
};
pub const case_fold2_16_007: [4]CaseFoldMapping2_16 = [4]CaseFoldMapping2_16{
    CaseFoldMapping2_16{
        .from = 7833,
        .to0 = 121,
        .to1 = 778,
    },
    CaseFoldMapping2_16{
        .from = 8072,
        .to0 = 7936,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 8088,
        .to0 = 7968,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 8104,
        .to0 = 8032,
        .to1 = 953,
    },
};
pub const case_fold2_16_008: [6]CaseFoldMapping2_16 = [6]CaseFoldMapping2_16{
    CaseFoldMapping2_16{
        .from = 329,
        .to0 = 700,
        .to1 = 110,
    },
    CaseFoldMapping2_16{
        .from = 7830,
        .to0 = 104,
        .to1 = 817,
    },
    CaseFoldMapping2_16{
        .from = 8071,
        .to0 = 7943,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 8087,
        .to0 = 7975,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 8103,
        .to0 = 8039,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 64275,
        .to0 = 1396,
        .to1 = 1398,
    },
};
pub const case_fold2_16_009: [10]CaseFoldMapping2_16 = [10]CaseFoldMapping2_16{
    CaseFoldMapping2_16{
        .from = 7831,
        .to0 = 116,
        .to1 = 776,
    },
    CaseFoldMapping2_16{
        .from = 8070,
        .to0 = 7942,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 8086,
        .to0 = 7974,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 8102,
        .to0 = 8038,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 8118,
        .to0 = 945,
        .to1 = 834,
    },
    CaseFoldMapping2_16{
        .from = 8134,
        .to0 = 951,
        .to1 = 834,
    },
    CaseFoldMapping2_16{
        .from = 8150,
        .to0 = 953,
        .to1 = 834,
    },
    CaseFoldMapping2_16{
        .from = 8166,
        .to0 = 965,
        .to1 = 834,
    },
    CaseFoldMapping2_16{
        .from = 8182,
        .to0 = 969,
        .to1 = 834,
    },
    CaseFoldMapping2_16{
        .from = 64258,
        .to0 = 102,
        .to1 = 108,
    },
};
pub const case_fold2_16_010: [4]CaseFoldMapping2_16 = [4]CaseFoldMapping2_16{
    CaseFoldMapping2_16{
        .from = 8069,
        .to0 = 7941,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 8085,
        .to0 = 7973,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 8101,
        .to0 = 8037,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 64257,
        .to0 = 102,
        .to1 = 105,
    },
};
pub const case_fold2_16_011: [8]CaseFoldMapping2_16 = [8]CaseFoldMapping2_16{
    CaseFoldMapping2_16{
        .from = 8068,
        .to0 = 7940,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 8084,
        .to0 = 7972,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 8100,
        .to0 = 8036,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 8116,
        .to0 = 940,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 8132,
        .to0 = 942,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 8164,
        .to0 = 961,
        .to1 = 787,
    },
    CaseFoldMapping2_16{
        .from = 8180,
        .to0 = 974,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 64256,
        .to0 = 102,
        .to1 = 102,
    },
};
pub const case_fold2_16_012: [7]CaseFoldMapping2_16 = [7]CaseFoldMapping2_16{
    CaseFoldMapping2_16{
        .from = 8067,
        .to0 = 7939,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 8083,
        .to0 = 7971,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 8099,
        .to0 = 8035,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 8115,
        .to0 = 945,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 8131,
        .to0 = 951,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 8179,
        .to0 = 969,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 64279,
        .to0 = 1396,
        .to1 = 1389,
    },
};
pub const case_fold2_16_013: [8]CaseFoldMapping2_16 = [8]CaseFoldMapping2_16{
    CaseFoldMapping2_16{
        .from = 8066,
        .to0 = 7938,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 8082,
        .to0 = 7970,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 8098,
        .to0 = 8034,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 8114,
        .to0 = 8048,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 8130,
        .to0 = 8052,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 8178,
        .to0 = 8060,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 64262,
        .to0 = 115,
        .to1 = 116,
    },
    CaseFoldMapping2_16{
        .from = 64278,
        .to0 = 1406,
        .to1 = 1398,
    },
};
pub const case_fold2_16_014: [5]CaseFoldMapping2_16 = [5]CaseFoldMapping2_16{
    CaseFoldMapping2_16{
        .from = 8065,
        .to0 = 7937,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 8081,
        .to0 = 7969,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 8097,
        .to0 = 8033,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 64261,
        .to0 = 115,
        .to1 = 116,
    },
    CaseFoldMapping2_16{
        .from = 64277,
        .to0 = 1396,
        .to1 = 1387,
    },
};
pub const case_fold2_16_015: [6]CaseFoldMapping2_16 = [6]CaseFoldMapping2_16{
    CaseFoldMapping2_16{
        .from = 223,
        .to0 = 115,
        .to1 = 115,
    },
    CaseFoldMapping2_16{
        .from = 8016,
        .to0 = 965,
        .to1 = 787,
    },
    CaseFoldMapping2_16{
        .from = 8064,
        .to0 = 7936,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 8080,
        .to0 = 7968,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 8096,
        .to0 = 8032,
        .to1 = 953,
    },
    CaseFoldMapping2_16{
        .from = 64276,
        .to0 = 1396,
        .to1 = 1381,
    },
};
pub const case_fold3_16_000: [8]CaseFoldMapping3_16 = [8]CaseFoldMapping3_16{
    CaseFoldMapping3_16{
        .from = 8119,
        .to0 = 945,
        .to1 = 834,
        .to2 = 953,
    },
    CaseFoldMapping3_16{
        .from = 8135,
        .to0 = 951,
        .to1 = 834,
        .to2 = 953,
    },
    CaseFoldMapping3_16{
        .from = 8147,
        .to0 = 953,
        .to1 = 776,
        .to2 = 769,
    },
    CaseFoldMapping3_16{
        .from = 8151,
        .to0 = 953,
        .to1 = 776,
        .to2 = 834,
    },
    CaseFoldMapping3_16{
        .from = 8163,
        .to0 = 965,
        .to1 = 776,
        .to2 = 769,
    },
    CaseFoldMapping3_16{
        .from = 8167,
        .to0 = 965,
        .to1 = 776,
        .to2 = 834,
    },
    CaseFoldMapping3_16{
        .from = 8183,
        .to0 = 969,
        .to1 = 834,
        .to2 = 953,
    },
    CaseFoldMapping3_16{
        .from = 64259,
        .to0 = 102,
        .to1 = 102,
        .to2 = 105,
    },
};
pub const case_fold3_16_001: [4]CaseFoldMapping3_16 = [4]CaseFoldMapping3_16{
    CaseFoldMapping3_16{
        .from = 8018,
        .to0 = 965,
        .to1 = 787,
        .to2 = 768,
    },
    CaseFoldMapping3_16{
        .from = 8022,
        .to0 = 965,
        .to1 = 787,
        .to2 = 834,
    },
    CaseFoldMapping3_16{
        .from = 8146,
        .to0 = 953,
        .to1 = 776,
        .to2 = 768,
    },
    CaseFoldMapping3_16{
        .from = 8162,
        .to0 = 965,
        .to1 = 776,
        .to2 = 768,
    },
};
pub const case_fold3_16_003: [4]CaseFoldMapping3_16 = [4]CaseFoldMapping3_16{
    CaseFoldMapping3_16{
        .from = 912,
        .to0 = 953,
        .to1 = 776,
        .to2 = 769,
    },
    CaseFoldMapping3_16{
        .from = 944,
        .to0 = 965,
        .to1 = 776,
        .to2 = 769,
    },
    CaseFoldMapping3_16{
        .from = 8020,
        .to0 = 965,
        .to1 = 787,
        .to2 = 769,
    },
    CaseFoldMapping3_16{
        .from = 64260,
        .to0 = 102,
        .to1 = 102,
        .to2 = 108,
    },
};
pub const case_fold_hash1_16: [256]CaseFoldHashBucket1_16 = [256]CaseFoldHashBucket1_16{
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_000)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_000)) / @sizeOf(@TypeOf(case_fold1_16_000[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_001)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_001)) / @sizeOf(@TypeOf(case_fold1_16_001[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_002)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_002)) / @sizeOf(@TypeOf(case_fold1_16_002[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_003)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_003)) / @sizeOf(@TypeOf(case_fold1_16_003[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_004)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_004)) / @sizeOf(@TypeOf(case_fold1_16_004[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_005)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_005)) / @sizeOf(@TypeOf(case_fold1_16_005[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_006)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_006)) / @sizeOf(@TypeOf(case_fold1_16_006[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_007)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_007)) / @sizeOf(@TypeOf(case_fold1_16_007[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_008)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_008)) / @sizeOf(@TypeOf(case_fold1_16_008[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_009)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_009)) / @sizeOf(@TypeOf(case_fold1_16_009[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_010)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_010)) / @sizeOf(@TypeOf(case_fold1_16_010[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_011)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_011)) / @sizeOf(@TypeOf(case_fold1_16_011[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_012)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_012)) / @sizeOf(@TypeOf(case_fold1_16_012[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_013)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_013)) / @sizeOf(@TypeOf(case_fold1_16_013[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_014)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_014)) / @sizeOf(@TypeOf(case_fold1_16_014[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_015)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_015)) / @sizeOf(@TypeOf(case_fold1_16_015[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_016)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_016)) / @sizeOf(@TypeOf(case_fold1_16_016[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_017)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_017)) / @sizeOf(@TypeOf(case_fold1_16_017[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_018)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_018)) / @sizeOf(@TypeOf(case_fold1_16_018[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_019)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_019)) / @sizeOf(@TypeOf(case_fold1_16_019[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_020)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_020)) / @sizeOf(@TypeOf(case_fold1_16_020[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_021)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_021)) / @sizeOf(@TypeOf(case_fold1_16_021[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_022)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_022)) / @sizeOf(@TypeOf(case_fold1_16_022[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_023)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_023)) / @sizeOf(@TypeOf(case_fold1_16_023[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_024)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_024)) / @sizeOf(@TypeOf(case_fold1_16_024[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_025)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_025)) / @sizeOf(@TypeOf(case_fold1_16_025[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_026)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_026)) / @sizeOf(@TypeOf(case_fold1_16_026[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_027)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_027)) / @sizeOf(@TypeOf(case_fold1_16_027[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_028)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_028)) / @sizeOf(@TypeOf(case_fold1_16_028[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_029)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_029)) / @sizeOf(@TypeOf(case_fold1_16_029[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_030)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_030)) / @sizeOf(@TypeOf(case_fold1_16_030[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_031)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_031)) / @sizeOf(@TypeOf(case_fold1_16_031[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_032)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_032)) / @sizeOf(@TypeOf(case_fold1_16_032[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_033)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_033)) / @sizeOf(@TypeOf(case_fold1_16_033[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_034)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_034)) / @sizeOf(@TypeOf(case_fold1_16_034[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_035)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_035)) / @sizeOf(@TypeOf(case_fold1_16_035[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_036)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_036)) / @sizeOf(@TypeOf(case_fold1_16_036[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_037)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_037)) / @sizeOf(@TypeOf(case_fold1_16_037[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_038)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_038)) / @sizeOf(@TypeOf(case_fold1_16_038[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_039)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_039)) / @sizeOf(@TypeOf(case_fold1_16_039[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_040)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_040)) / @sizeOf(@TypeOf(case_fold1_16_040[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_041)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_041)) / @sizeOf(@TypeOf(case_fold1_16_041[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_042)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_042)) / @sizeOf(@TypeOf(case_fold1_16_042[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_043)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_043)) / @sizeOf(@TypeOf(case_fold1_16_043[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_044)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_044)) / @sizeOf(@TypeOf(case_fold1_16_044[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_045)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_045)) / @sizeOf(@TypeOf(case_fold1_16_045[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_046)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_046)) / @sizeOf(@TypeOf(case_fold1_16_046[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_047)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_047)) / @sizeOf(@TypeOf(case_fold1_16_047[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_048)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_048)) / @sizeOf(@TypeOf(case_fold1_16_048[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_049)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_049)) / @sizeOf(@TypeOf(case_fold1_16_049[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_050)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_050)) / @sizeOf(@TypeOf(case_fold1_16_050[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_051)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_051)) / @sizeOf(@TypeOf(case_fold1_16_051[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_052)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_052)) / @sizeOf(@TypeOf(case_fold1_16_052[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_053)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_053)) / @sizeOf(@TypeOf(case_fold1_16_053[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_054)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_054)) / @sizeOf(@TypeOf(case_fold1_16_054[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_055)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_055)) / @sizeOf(@TypeOf(case_fold1_16_055[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_056)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_056)) / @sizeOf(@TypeOf(case_fold1_16_056[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_057)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_057)) / @sizeOf(@TypeOf(case_fold1_16_057[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_058)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_058)) / @sizeOf(@TypeOf(case_fold1_16_058[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_059)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_059)) / @sizeOf(@TypeOf(case_fold1_16_059[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_060)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_060)) / @sizeOf(@TypeOf(case_fold1_16_060[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_061)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_061)) / @sizeOf(@TypeOf(case_fold1_16_061[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_062)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_062)) / @sizeOf(@TypeOf(case_fold1_16_062[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_063)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_063)) / @sizeOf(@TypeOf(case_fold1_16_063[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_064)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_064)) / @sizeOf(@TypeOf(case_fold1_16_064[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_065)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_065)) / @sizeOf(@TypeOf(case_fold1_16_065[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_066)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_066)) / @sizeOf(@TypeOf(case_fold1_16_066[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_067)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_067)) / @sizeOf(@TypeOf(case_fold1_16_067[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_068)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_068)) / @sizeOf(@TypeOf(case_fold1_16_068[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_069)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_069)) / @sizeOf(@TypeOf(case_fold1_16_069[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_070)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_070)) / @sizeOf(@TypeOf(case_fold1_16_070[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_071)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_071)) / @sizeOf(@TypeOf(case_fold1_16_071[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_072)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_072)) / @sizeOf(@TypeOf(case_fold1_16_072[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_073)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_073)) / @sizeOf(@TypeOf(case_fold1_16_073[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_074)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_074)) / @sizeOf(@TypeOf(case_fold1_16_074[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_075)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_075)) / @sizeOf(@TypeOf(case_fold1_16_075[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_076)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_076)) / @sizeOf(@TypeOf(case_fold1_16_076[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_077)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_077)) / @sizeOf(@TypeOf(case_fold1_16_077[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_078)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_078)) / @sizeOf(@TypeOf(case_fold1_16_078[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_079)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_079)) / @sizeOf(@TypeOf(case_fold1_16_079[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_080)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_080)) / @sizeOf(@TypeOf(case_fold1_16_080[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_081)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_081)) / @sizeOf(@TypeOf(case_fold1_16_081[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_082)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_082)) / @sizeOf(@TypeOf(case_fold1_16_082[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_083)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_083)) / @sizeOf(@TypeOf(case_fold1_16_083[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_084)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_084)) / @sizeOf(@TypeOf(case_fold1_16_084[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_085)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_085)) / @sizeOf(@TypeOf(case_fold1_16_085[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_086)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_086)) / @sizeOf(@TypeOf(case_fold1_16_086[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_087)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_087)) / @sizeOf(@TypeOf(case_fold1_16_087[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_088)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_088)) / @sizeOf(@TypeOf(case_fold1_16_088[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_089)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_089)) / @sizeOf(@TypeOf(case_fold1_16_089[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_090)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_090)) / @sizeOf(@TypeOf(case_fold1_16_090[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_091)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_091)) / @sizeOf(@TypeOf(case_fold1_16_091[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_092)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_092)) / @sizeOf(@TypeOf(case_fold1_16_092[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_093)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_093)) / @sizeOf(@TypeOf(case_fold1_16_093[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_094)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_094)) / @sizeOf(@TypeOf(case_fold1_16_094[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_095)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_095)) / @sizeOf(@TypeOf(case_fold1_16_095[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_096)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_096)) / @sizeOf(@TypeOf(case_fold1_16_096[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_097)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_097)) / @sizeOf(@TypeOf(case_fold1_16_097[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_098)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_098)) / @sizeOf(@TypeOf(case_fold1_16_098[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_099)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_099)) / @sizeOf(@TypeOf(case_fold1_16_099[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_100)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_100)) / @sizeOf(@TypeOf(case_fold1_16_100[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_101)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_101)) / @sizeOf(@TypeOf(case_fold1_16_101[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_102)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_102)) / @sizeOf(@TypeOf(case_fold1_16_102[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_103)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_103)) / @sizeOf(@TypeOf(case_fold1_16_103[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_104)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_104)) / @sizeOf(@TypeOf(case_fold1_16_104[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_105)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_105)) / @sizeOf(@TypeOf(case_fold1_16_105[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_106)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_106)) / @sizeOf(@TypeOf(case_fold1_16_106[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_107)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_107)) / @sizeOf(@TypeOf(case_fold1_16_107[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_108)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_108)) / @sizeOf(@TypeOf(case_fold1_16_108[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_109)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_109)) / @sizeOf(@TypeOf(case_fold1_16_109[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_110)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_110)) / @sizeOf(@TypeOf(case_fold1_16_110[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_111)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_111)) / @sizeOf(@TypeOf(case_fold1_16_111[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_112)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_112)) / @sizeOf(@TypeOf(case_fold1_16_112[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_113)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_113)) / @sizeOf(@TypeOf(case_fold1_16_113[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_114)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_114)) / @sizeOf(@TypeOf(case_fold1_16_114[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_115)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_115)) / @sizeOf(@TypeOf(case_fold1_16_115[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_116)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_116)) / @sizeOf(@TypeOf(case_fold1_16_116[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_117)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_117)) / @sizeOf(@TypeOf(case_fold1_16_117[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_118)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_118)) / @sizeOf(@TypeOf(case_fold1_16_118[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_119)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_119)) / @sizeOf(@TypeOf(case_fold1_16_119[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_120)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_120)) / @sizeOf(@TypeOf(case_fold1_16_120[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_121)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_121)) / @sizeOf(@TypeOf(case_fold1_16_121[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_122)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_122)) / @sizeOf(@TypeOf(case_fold1_16_122[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = null,
        .count = 0,
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_124)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_124)) / @sizeOf(@TypeOf(case_fold1_16_124[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = null,
        .count = 0,
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_126)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_126)) / @sizeOf(@TypeOf(case_fold1_16_126[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_127)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_127)) / @sizeOf(@TypeOf(case_fold1_16_127[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_128)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_128)) / @sizeOf(@TypeOf(case_fold1_16_128[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_129)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_129)) / @sizeOf(@TypeOf(case_fold1_16_129[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_130)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_130)) / @sizeOf(@TypeOf(case_fold1_16_130[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_131)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_131)) / @sizeOf(@TypeOf(case_fold1_16_131[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_132)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_132)) / @sizeOf(@TypeOf(case_fold1_16_132[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_133)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_133)) / @sizeOf(@TypeOf(case_fold1_16_133[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_134)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_134)) / @sizeOf(@TypeOf(case_fold1_16_134[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_135)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_135)) / @sizeOf(@TypeOf(case_fold1_16_135[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_136)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_136)) / @sizeOf(@TypeOf(case_fold1_16_136[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_137)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_137)) / @sizeOf(@TypeOf(case_fold1_16_137[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_138)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_138)) / @sizeOf(@TypeOf(case_fold1_16_138[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_139)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_139)) / @sizeOf(@TypeOf(case_fold1_16_139[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_140)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_140)) / @sizeOf(@TypeOf(case_fold1_16_140[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_141)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_141)) / @sizeOf(@TypeOf(case_fold1_16_141[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_142)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_142)) / @sizeOf(@TypeOf(case_fold1_16_142[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_143)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_143)) / @sizeOf(@TypeOf(case_fold1_16_143[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_144)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_144)) / @sizeOf(@TypeOf(case_fold1_16_144[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_145)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_145)) / @sizeOf(@TypeOf(case_fold1_16_145[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_146)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_146)) / @sizeOf(@TypeOf(case_fold1_16_146[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_147)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_147)) / @sizeOf(@TypeOf(case_fold1_16_147[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_148)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_148)) / @sizeOf(@TypeOf(case_fold1_16_148[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_149)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_149)) / @sizeOf(@TypeOf(case_fold1_16_149[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_150)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_150)) / @sizeOf(@TypeOf(case_fold1_16_150[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_151)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_151)) / @sizeOf(@TypeOf(case_fold1_16_151[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_152)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_152)) / @sizeOf(@TypeOf(case_fold1_16_152[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_153)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_153)) / @sizeOf(@TypeOf(case_fold1_16_153[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_154)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_154)) / @sizeOf(@TypeOf(case_fold1_16_154[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_155)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_155)) / @sizeOf(@TypeOf(case_fold1_16_155[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_156)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_156)) / @sizeOf(@TypeOf(case_fold1_16_156[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_157)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_157)) / @sizeOf(@TypeOf(case_fold1_16_157[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_158)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_158)) / @sizeOf(@TypeOf(case_fold1_16_158[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_159)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_159)) / @sizeOf(@TypeOf(case_fold1_16_159[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_160)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_160)) / @sizeOf(@TypeOf(case_fold1_16_160[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_161)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_161)) / @sizeOf(@TypeOf(case_fold1_16_161[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_162)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_162)) / @sizeOf(@TypeOf(case_fold1_16_162[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_163)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_163)) / @sizeOf(@TypeOf(case_fold1_16_163[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_164)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_164)) / @sizeOf(@TypeOf(case_fold1_16_164[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_165)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_165)) / @sizeOf(@TypeOf(case_fold1_16_165[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_166)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_166)) / @sizeOf(@TypeOf(case_fold1_16_166[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_167)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_167)) / @sizeOf(@TypeOf(case_fold1_16_167[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_168)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_168)) / @sizeOf(@TypeOf(case_fold1_16_168[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_169)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_169)) / @sizeOf(@TypeOf(case_fold1_16_169[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_170)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_170)) / @sizeOf(@TypeOf(case_fold1_16_170[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_171)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_171)) / @sizeOf(@TypeOf(case_fold1_16_171[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_172)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_172)) / @sizeOf(@TypeOf(case_fold1_16_172[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_173)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_173)) / @sizeOf(@TypeOf(case_fold1_16_173[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_174)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_174)) / @sizeOf(@TypeOf(case_fold1_16_174[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_175)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_175)) / @sizeOf(@TypeOf(case_fold1_16_175[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_176)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_176)) / @sizeOf(@TypeOf(case_fold1_16_176[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_177)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_177)) / @sizeOf(@TypeOf(case_fold1_16_177[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_178)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_178)) / @sizeOf(@TypeOf(case_fold1_16_178[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_179)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_179)) / @sizeOf(@TypeOf(case_fold1_16_179[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_180)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_180)) / @sizeOf(@TypeOf(case_fold1_16_180[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_181)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_181)) / @sizeOf(@TypeOf(case_fold1_16_181[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_182)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_182)) / @sizeOf(@TypeOf(case_fold1_16_182[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_183)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_183)) / @sizeOf(@TypeOf(case_fold1_16_183[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_184)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_184)) / @sizeOf(@TypeOf(case_fold1_16_184[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_185)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_185)) / @sizeOf(@TypeOf(case_fold1_16_185[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_186)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_186)) / @sizeOf(@TypeOf(case_fold1_16_186[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_187)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_187)) / @sizeOf(@TypeOf(case_fold1_16_187[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_188)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_188)) / @sizeOf(@TypeOf(case_fold1_16_188[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_189)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_189)) / @sizeOf(@TypeOf(case_fold1_16_189[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_190)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_190)) / @sizeOf(@TypeOf(case_fold1_16_190[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_191)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_191)) / @sizeOf(@TypeOf(case_fold1_16_191[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_192)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_192)) / @sizeOf(@TypeOf(case_fold1_16_192[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_193)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_193)) / @sizeOf(@TypeOf(case_fold1_16_193[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_194)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_194)) / @sizeOf(@TypeOf(case_fold1_16_194[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_195)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_195)) / @sizeOf(@TypeOf(case_fold1_16_195[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_196)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_196)) / @sizeOf(@TypeOf(case_fold1_16_196[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_197)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_197)) / @sizeOf(@TypeOf(case_fold1_16_197[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_198)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_198)) / @sizeOf(@TypeOf(case_fold1_16_198[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_199)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_199)) / @sizeOf(@TypeOf(case_fold1_16_199[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_200)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_200)) / @sizeOf(@TypeOf(case_fold1_16_200[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_201)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_201)) / @sizeOf(@TypeOf(case_fold1_16_201[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_202)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_202)) / @sizeOf(@TypeOf(case_fold1_16_202[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_203)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_203)) / @sizeOf(@TypeOf(case_fold1_16_203[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_204)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_204)) / @sizeOf(@TypeOf(case_fold1_16_204[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_205)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_205)) / @sizeOf(@TypeOf(case_fold1_16_205[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_206)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_206)) / @sizeOf(@TypeOf(case_fold1_16_206[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_207)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_207)) / @sizeOf(@TypeOf(case_fold1_16_207[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_208)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_208)) / @sizeOf(@TypeOf(case_fold1_16_208[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_209)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_209)) / @sizeOf(@TypeOf(case_fold1_16_209[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_210)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_210)) / @sizeOf(@TypeOf(case_fold1_16_210[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_211)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_211)) / @sizeOf(@TypeOf(case_fold1_16_211[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_212)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_212)) / @sizeOf(@TypeOf(case_fold1_16_212[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_213)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_213)) / @sizeOf(@TypeOf(case_fold1_16_213[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_214)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_214)) / @sizeOf(@TypeOf(case_fold1_16_214[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_215)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_215)) / @sizeOf(@TypeOf(case_fold1_16_215[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_216)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_216)) / @sizeOf(@TypeOf(case_fold1_16_216[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_217)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_217)) / @sizeOf(@TypeOf(case_fold1_16_217[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_218)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_218)) / @sizeOf(@TypeOf(case_fold1_16_218[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_219)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_219)) / @sizeOf(@TypeOf(case_fold1_16_219[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_220)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_220)) / @sizeOf(@TypeOf(case_fold1_16_220[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_221)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_221)) / @sizeOf(@TypeOf(case_fold1_16_221[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_222)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_222)) / @sizeOf(@TypeOf(case_fold1_16_222[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_223)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_223)) / @sizeOf(@TypeOf(case_fold1_16_223[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_224)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_224)) / @sizeOf(@TypeOf(case_fold1_16_224[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_225)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_225)) / @sizeOf(@TypeOf(case_fold1_16_225[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_226)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_226)) / @sizeOf(@TypeOf(case_fold1_16_226[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_227)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_227)) / @sizeOf(@TypeOf(case_fold1_16_227[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_228)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_228)) / @sizeOf(@TypeOf(case_fold1_16_228[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_229)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_229)) / @sizeOf(@TypeOf(case_fold1_16_229[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_230)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_230)) / @sizeOf(@TypeOf(case_fold1_16_230[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_231)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_231)) / @sizeOf(@TypeOf(case_fold1_16_231[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_232)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_232)) / @sizeOf(@TypeOf(case_fold1_16_232[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_233)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_233)) / @sizeOf(@TypeOf(case_fold1_16_233[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_234)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_234)) / @sizeOf(@TypeOf(case_fold1_16_234[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_235)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_235)) / @sizeOf(@TypeOf(case_fold1_16_235[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_236)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_236)) / @sizeOf(@TypeOf(case_fold1_16_236[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_237)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_237)) / @sizeOf(@TypeOf(case_fold1_16_237[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_238)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_238)) / @sizeOf(@TypeOf(case_fold1_16_238[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_239)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_239)) / @sizeOf(@TypeOf(case_fold1_16_239[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_240)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_240)) / @sizeOf(@TypeOf(case_fold1_16_240[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_241)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_241)) / @sizeOf(@TypeOf(case_fold1_16_241[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_242)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_242)) / @sizeOf(@TypeOf(case_fold1_16_242[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_243)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_243)) / @sizeOf(@TypeOf(case_fold1_16_243[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_244)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_244)) / @sizeOf(@TypeOf(case_fold1_16_244[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_245)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_245)) / @sizeOf(@TypeOf(case_fold1_16_245[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_246)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_246)) / @sizeOf(@TypeOf(case_fold1_16_246[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_247)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_247)) / @sizeOf(@TypeOf(case_fold1_16_247[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_248)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_248)) / @sizeOf(@TypeOf(case_fold1_16_248[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_249)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_249)) / @sizeOf(@TypeOf(case_fold1_16_249[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_250)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_250)) / @sizeOf(@TypeOf(case_fold1_16_250[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_251)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_251)) / @sizeOf(@TypeOf(case_fold1_16_251[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_252)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_252)) / @sizeOf(@TypeOf(case_fold1_16_252[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_253)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_253)) / @sizeOf(@TypeOf(case_fold1_16_253[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_254)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_254)) / @sizeOf(@TypeOf(case_fold1_16_254[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_16{
        .list = @ptrCast(@alignCast(&case_fold1_16_255)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_16_255)) / @sizeOf(@TypeOf(case_fold1_16_255[@as(c_int, 0)]))),
    },
};
pub const case_fold_hash1_32: [16]CaseFoldHashBucket1_32 = [16]CaseFoldHashBucket1_32{
    CaseFoldHashBucket1_32{
        .list = @ptrCast(@alignCast(&case_fold1_32_000)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_32_000)) / @sizeOf(@TypeOf(case_fold1_32_000[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_32{
        .list = @ptrCast(@alignCast(&case_fold1_32_001)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_32_001)) / @sizeOf(@TypeOf(case_fold1_32_001[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_32{
        .list = @ptrCast(@alignCast(&case_fold1_32_002)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_32_002)) / @sizeOf(@TypeOf(case_fold1_32_002[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_32{
        .list = @ptrCast(@alignCast(&case_fold1_32_003)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_32_003)) / @sizeOf(@TypeOf(case_fold1_32_003[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_32{
        .list = @ptrCast(@alignCast(&case_fold1_32_004)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_32_004)) / @sizeOf(@TypeOf(case_fold1_32_004[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_32{
        .list = @ptrCast(@alignCast(&case_fold1_32_005)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_32_005)) / @sizeOf(@TypeOf(case_fold1_32_005[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_32{
        .list = @ptrCast(@alignCast(&case_fold1_32_006)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_32_006)) / @sizeOf(@TypeOf(case_fold1_32_006[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_32{
        .list = @ptrCast(@alignCast(&case_fold1_32_007)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_32_007)) / @sizeOf(@TypeOf(case_fold1_32_007[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_32{
        .list = @ptrCast(@alignCast(&case_fold1_32_008)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_32_008)) / @sizeOf(@TypeOf(case_fold1_32_008[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_32{
        .list = @ptrCast(@alignCast(&case_fold1_32_009)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_32_009)) / @sizeOf(@TypeOf(case_fold1_32_009[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_32{
        .list = @ptrCast(@alignCast(&case_fold1_32_010)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_32_010)) / @sizeOf(@TypeOf(case_fold1_32_010[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_32{
        .list = @ptrCast(@alignCast(&case_fold1_32_011)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_32_011)) / @sizeOf(@TypeOf(case_fold1_32_011[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_32{
        .list = @ptrCast(@alignCast(&case_fold1_32_012)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_32_012)) / @sizeOf(@TypeOf(case_fold1_32_012[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_32{
        .list = @ptrCast(@alignCast(&case_fold1_32_013)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_32_013)) / @sizeOf(@TypeOf(case_fold1_32_013[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_32{
        .list = @ptrCast(@alignCast(&case_fold1_32_014)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_32_014)) / @sizeOf(@TypeOf(case_fold1_32_014[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket1_32{
        .list = @ptrCast(@alignCast(&case_fold1_32_015)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold1_32_015)) / @sizeOf(@TypeOf(case_fold1_32_015[@as(c_int, 0)]))),
    },
};
pub const case_fold_hash2_16: [16]CaseFoldHashBucket2_16 = [16]CaseFoldHashBucket2_16{
    CaseFoldHashBucket2_16{
        .list = @ptrCast(@alignCast(&case_fold2_16_000)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold2_16_000)) / @sizeOf(@TypeOf(case_fold2_16_000[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket2_16{
        .list = @ptrCast(@alignCast(&case_fold2_16_001)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold2_16_001)) / @sizeOf(@TypeOf(case_fold2_16_001[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket2_16{
        .list = @ptrCast(@alignCast(&case_fold2_16_002)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold2_16_002)) / @sizeOf(@TypeOf(case_fold2_16_002[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket2_16{
        .list = @ptrCast(@alignCast(&case_fold2_16_003)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold2_16_003)) / @sizeOf(@TypeOf(case_fold2_16_003[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket2_16{
        .list = @ptrCast(@alignCast(&case_fold2_16_004)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold2_16_004)) / @sizeOf(@TypeOf(case_fold2_16_004[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket2_16{
        .list = @ptrCast(@alignCast(&case_fold2_16_005)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold2_16_005)) / @sizeOf(@TypeOf(case_fold2_16_005[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket2_16{
        .list = @ptrCast(@alignCast(&case_fold2_16_006)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold2_16_006)) / @sizeOf(@TypeOf(case_fold2_16_006[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket2_16{
        .list = @ptrCast(@alignCast(&case_fold2_16_007)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold2_16_007)) / @sizeOf(@TypeOf(case_fold2_16_007[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket2_16{
        .list = @ptrCast(@alignCast(&case_fold2_16_008)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold2_16_008)) / @sizeOf(@TypeOf(case_fold2_16_008[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket2_16{
        .list = @ptrCast(@alignCast(&case_fold2_16_009)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold2_16_009)) / @sizeOf(@TypeOf(case_fold2_16_009[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket2_16{
        .list = @ptrCast(@alignCast(&case_fold2_16_010)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold2_16_010)) / @sizeOf(@TypeOf(case_fold2_16_010[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket2_16{
        .list = @ptrCast(@alignCast(&case_fold2_16_011)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold2_16_011)) / @sizeOf(@TypeOf(case_fold2_16_011[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket2_16{
        .list = @ptrCast(@alignCast(&case_fold2_16_012)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold2_16_012)) / @sizeOf(@TypeOf(case_fold2_16_012[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket2_16{
        .list = @ptrCast(@alignCast(&case_fold2_16_013)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold2_16_013)) / @sizeOf(@TypeOf(case_fold2_16_013[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket2_16{
        .list = @ptrCast(@alignCast(&case_fold2_16_014)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold2_16_014)) / @sizeOf(@TypeOf(case_fold2_16_014[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket2_16{
        .list = @ptrCast(@alignCast(&case_fold2_16_015)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold2_16_015)) / @sizeOf(@TypeOf(case_fold2_16_015[@as(c_int, 0)]))),
    },
};
pub const case_fold_hash3_16: [4]CaseFoldHashBucket3_16 = [4]CaseFoldHashBucket3_16{
    CaseFoldHashBucket3_16{
        .list = @ptrCast(@alignCast(&case_fold3_16_000)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold3_16_000)) / @sizeOf(@TypeOf(case_fold3_16_000[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket3_16{
        .list = @ptrCast(@alignCast(&case_fold3_16_001)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold3_16_001)) / @sizeOf(@TypeOf(case_fold3_16_001[@as(c_int, 0)]))),
    },
    CaseFoldHashBucket3_16{
        .list = null,
        .count = 0,
    },
    CaseFoldHashBucket3_16{
        .list = @ptrCast(@alignCast(&case_fold3_16_003)),
        .count = @truncate(@sizeOf(@TypeOf(case_fold3_16_003)) / @sizeOf(@TypeOf(case_fold3_16_003[@as(c_int, 0)]))),
    },
};
comptime {
    if (!(@sizeOf(wchar_t) == @as(c_ulong, __SIZEOF_WCHAR_T__))) @compileError("static assertion failed \"sizeof(wchar_t) == SDL_SIZEOF_WCHAR_T\"");
}
pub export fn SDL_UCS4ToUTF8_REAL(arg_codepoint: Uint32, arg_dst: [*c]u8) [*c]u8 {
    @setEvalBranchQuota(100000);
    var codepoint = arg_codepoint;
    _ = &codepoint;
    var dst = arg_dst;
    _ = &dst;
    const static_local___func__ = struct {
        const __func__: [19:0]u8 = "SDL_UCS4ToUTF8_REAL".*;
    };
    _ = &static_local___func__;
    if (!(dst != null)) {
        return null;
    } else if (codepoint > @as(Uint32, 1114111)) {
        codepoint = SDL_INVALID_UNICODE_CODEPOINT;
    } else if ((codepoint >= @as(Uint32, 55296)) and (codepoint <= @as(Uint32, 57343))) {
        codepoint = SDL_INVALID_UNICODE_CODEPOINT;
    }
    var p: [*c]Uint8 = @ptrCast(@alignCast(dst));
    _ = &p;
    if (codepoint <= @as(Uint32, 127)) {
        p.* = @truncate(codepoint);
        dst += 1;
    } else if (codepoint <= @as(Uint32, 2047)) {
        p[@as(c_int, 0)] = @bitCast(@as(i8, @truncate(@as(c_int, 192) | @as(c_int, @as(Uint8, @truncate((codepoint >> @intCast(@as(Uint32, 6))) & @as(Uint32, 31)))))));
        p[@as(c_int, 1)] = @bitCast(@as(i8, @truncate(@as(c_int, 128) | @as(c_int, @as(Uint8, @truncate(codepoint & @as(Uint32, 63)))))));
        dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
    } else if (codepoint <= @as(Uint32, 65535)) {
        p[@as(c_int, 0)] = @bitCast(@as(i8, @truncate(@as(c_int, 224) | @as(c_int, @as(Uint8, @truncate((codepoint >> @intCast(@as(Uint32, 12))) & @as(Uint32, 15)))))));
        p[@as(c_int, 1)] = @bitCast(@as(i8, @truncate(@as(c_int, 128) | @as(c_int, @as(Uint8, @truncate((codepoint >> @intCast(@as(Uint32, 6))) & @as(Uint32, 63)))))));
        p[@as(c_int, 2)] = @bitCast(@as(i8, @truncate(@as(c_int, 128) | @as(c_int, @as(Uint8, @truncate(codepoint & @as(Uint32, 63)))))));
        dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
    } else {
        while (true) {
            while (!(codepoint <= @as(Uint32, 1114111))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "codepoint <= 0x10FFFF",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_string.c", 71);
                _ = &sdl_assert_state;
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    continue;
                } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    __builtin.debugtrap();
                }
                break;
            }
            if (!(@as(c_int, 0) != 0)) break;
        }
        p[@as(c_int, 0)] = @bitCast(@as(i8, @truncate(@as(c_int, 240) | @as(c_int, @as(Uint8, @truncate((codepoint >> @intCast(@as(Uint32, 18))) & @as(Uint32, 7)))))));
        p[@as(c_int, 1)] = @bitCast(@as(i8, @truncate(@as(c_int, 128) | @as(c_int, @as(Uint8, @truncate((codepoint >> @intCast(@as(Uint32, 12))) & @as(Uint32, 63)))))));
        p[@as(c_int, 2)] = @bitCast(@as(i8, @truncate(@as(c_int, 128) | @as(c_int, @as(Uint8, @truncate((codepoint >> @intCast(@as(Uint32, 6))) & @as(Uint32, 63)))))));
        p[@as(c_int, 3)] = @bitCast(@as(i8, @truncate(@as(c_int, 128) | @as(c_int, @as(Uint8, @truncate(codepoint & @as(Uint32, 63)))))));
        dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
    }
    return dst;
}
pub export fn SDL_CaseFoldUnicode(arg_from: Uint32, to: [*c]Uint32) c_int {
    @setEvalBranchQuota(100000);
    var from = arg_from;
    _ = &from;
    if (from < @as(Uint32, 128)) {
        if ((from >= @as(Uint32, 'A')) and (from <= @as(Uint32, 'Z'))) {
            to.* = @as(Uint32, 'a') +% (from -% @as(Uint32, 'A'));
            return 1;
        }
    } else if (from <= @as(Uint32, 65535)) {
        const hash: Uint8 = @truncate((from ^ (from >> @intCast(@as(Uint32, 8)))) & @as(Uint32, 255));
        _ = &hash;
        const from16: Uint16 = @truncate(from);
        _ = &from16;
        {
            var bucket: [*c]const CaseFoldHashBucket1_16 = &case_fold_hash1_16[hash];
            _ = &bucket;
            const count: c_int = bucket.*.count;
            _ = &count;
            {
                var i: c_int = 0;
                _ = &i;
                while (i < count) : (i += 1) {
                    var mapping: [*c]const CaseFoldMapping1_16 = &bucket.*.list[@bitCast(@as(isize, @intCast(i)))];
                    _ = &mapping;
                    if (@as(c_int, mapping.*.from) == @as(c_int, from16)) {
                        to.* = mapping.*.to0;
                        return 1;
                    }
                }
            }
        }
        {
            var bucket: [*c]const CaseFoldHashBucket2_16 = &case_fold_hash2_16[@bitCast(@as(isize, @intCast(@as(c_int, hash) & @as(c_int, 15))))];
            _ = &bucket;
            const count: c_int = bucket.*.count;
            _ = &count;
            {
                var i: c_int = 0;
                _ = &i;
                while (i < count) : (i += 1) {
                    var mapping: [*c]const CaseFoldMapping2_16 = &bucket.*.list[@bitCast(@as(isize, @intCast(i)))];
                    _ = &mapping;
                    if (@as(c_int, mapping.*.from) == @as(c_int, from16)) {
                        to[@as(c_int, 0)] = mapping.*.to0;
                        to[@as(c_int, 1)] = mapping.*.to1;
                        return 2;
                    }
                }
            }
        }
        {
            var bucket: [*c]const CaseFoldHashBucket3_16 = &case_fold_hash3_16[@bitCast(@as(isize, @intCast(@as(c_int, hash) & @as(c_int, 3))))];
            _ = &bucket;
            const count: c_int = bucket.*.count;
            _ = &count;
            {
                var i: c_int = 0;
                _ = &i;
                while (i < count) : (i += 1) {
                    var mapping: [*c]const CaseFoldMapping3_16 = &bucket.*.list[@bitCast(@as(isize, @intCast(i)))];
                    _ = &mapping;
                    if (@as(c_int, mapping.*.from) == @as(c_int, from16)) {
                        to[@as(c_int, 0)] = mapping.*.to0;
                        to[@as(c_int, 1)] = mapping.*.to1;
                        to[@as(c_int, 2)] = mapping.*.to2;
                        return 3;
                    }
                }
            }
        }
    } else {
        const hash: Uint8 = @truncate((from ^ (from >> @intCast(@as(Uint32, 8)))) & @as(Uint32, 255));
        _ = &hash;
        var bucket: [*c]const CaseFoldHashBucket1_32 = &case_fold_hash1_32[@bitCast(@as(isize, @intCast(@as(c_int, hash) & @as(c_int, 15))))];
        _ = &bucket;
        const count: c_int = bucket.*.count;
        _ = &count;
        {
            var i: c_int = 0;
            _ = &i;
            while (i < count) : (i += 1) {
                var mapping: [*c]const CaseFoldMapping1_32 = &bucket.*.list[@bitCast(@as(isize, @intCast(i)))];
                _ = &mapping;
                if (mapping.*.from == from) {
                    to.* = mapping.*.to0;
                    return 1;
                }
            }
        }
    }
    to.* = from;
    return 1;
}
pub fn StepUTF8(_str: [*c][*c]const u8, slen: usize) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    _ = &slen;
    var str: [*c]const Uint8 = @ptrCast(@alignCast(_str.*));
    _ = &str;
    const octet: Uint32 = @bitCast(@as(c_int, if (slen != 0) @as(c_int, str.*) else @as(c_int, 0)));
    _ = &octet;
    if (octet == @as(Uint32, 0)) {
        return 0;
    } else if ((octet & @as(Uint32, 128)) == @as(Uint32, 0)) {
        _str.* += 1;
        return octet;
    } else if (((octet & @as(Uint32, 224)) == @as(Uint32, 192)) and (slen >= @as(usize, 2))) {
        const str1: Uint8 = str[@as(c_int, 1)];
        _ = &str1;
        if ((@as(c_int, str1) & @as(c_int, 192)) == @as(c_int, 128)) {
            const result: Uint32 = ((octet & @as(Uint32, 31)) << @intCast(@as(Uint32, 6))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, str1) & @as(c_int, 63))));
            _ = &result;
            if (result >= @as(Uint32, 128)) {
                _str.* += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                return result;
            }
        }
    } else if (((octet & @as(Uint32, 240)) == @as(Uint32, 224)) and (slen >= @as(usize, 3))) {
        const str1: Uint8 = str[@as(c_int, 1)];
        _ = &str1;
        const str2: Uint8 = str[@as(c_int, 2)];
        _ = &str2;
        if (((@as(c_int, str1) & @as(c_int, 192)) == @as(c_int, 128)) and ((@as(c_int, str2) & @as(c_int, 192)) == @as(c_int, 128))) {
            const octet2: Uint32 = @as(Uint32, @bitCast(@as(c_int, @as(c_int, str1) & @as(c_int, 63)))) << @intCast(@as(Uint32, 6));
            _ = &octet2;
            const octet3: Uint32 = @as(Uint32, @bitCast(@as(c_int, @as(c_int, str2) & @as(c_int, 63))));
            _ = &octet3;
            const result: Uint32 = (((octet & @as(Uint32, 15)) << @intCast(@as(Uint32, 12))) | octet2) | octet3;
            _ = &result;
            if (result >= @as(Uint32, 2048)) {
                if ((result < @as(Uint32, 55296)) or (result > @as(Uint32, 57343))) {
                    _str.* += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                    return result;
                }
            }
        }
    } else if (((octet & @as(Uint32, 248)) == @as(Uint32, 240)) and (slen >= @as(usize, 4))) {
        const str1: Uint8 = str[@as(c_int, 1)];
        _ = &str1;
        const str2: Uint8 = str[@as(c_int, 2)];
        _ = &str2;
        const str3: Uint8 = str[@as(c_int, 3)];
        _ = &str3;
        if ((((@as(c_int, str1) & @as(c_int, 192)) == @as(c_int, 128)) and ((@as(c_int, str2) & @as(c_int, 192)) == @as(c_int, 128))) and ((@as(c_int, str3) & @as(c_int, 192)) == @as(c_int, 128))) {
            const octet2: Uint32 = @as(Uint32, @bitCast(@as(c_int, @as(c_int, str1) & @as(c_int, 63)))) << @intCast(@as(Uint32, 12));
            _ = &octet2;
            const octet3: Uint32 = @as(Uint32, @bitCast(@as(c_int, @as(c_int, str2) & @as(c_int, 63)))) << @intCast(@as(Uint32, 6));
            _ = &octet3;
            const octet4: Uint32 = @as(Uint32, @bitCast(@as(c_int, @as(c_int, str3) & @as(c_int, 63))));
            _ = &octet4;
            const result: Uint32 = ((((octet & @as(Uint32, 7)) << @intCast(@as(Uint32, 18))) | octet2) | octet3) | octet4;
            _ = &result;
            if (result >= @as(Uint32, 65536)) {
                _str.* += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                return result;
            }
        }
    }
    _str.* += 1;
    return SDL_INVALID_UNICODE_CODEPOINT;
}
pub export fn SDL_StepUTF8_REAL(pstr: [*c][*c]const u8, pslen: [*c]usize) Uint32 {
    @setEvalBranchQuota(100000);
    if (!(pslen != null)) {
        return StepUTF8(pstr, 4);
    }
    var origstr: [*c]const u8 = pstr.*;
    _ = &origstr;
    const result: Uint32 = StepUTF8(pstr, pslen.*);
    _ = &result;
    pslen.* -%= @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(pstr.*) -% @intFromPtr(origstr))), @sizeOf(u8))));
    return result;
}
pub export fn SDL_StepBackUTF8_REAL(start: [*c]const u8, pstr: [*c][*c]const u8) Uint32 {
    @setEvalBranchQuota(100000);
    if (!(pstr != null) or (pstr.* <= start)) {
        return 0;
    }
    var str: [*c]const u8 = pstr.*;
    _ = &str;
    while (true) {
        if (str == start) {
            break;
        }
        str -= 1;
        if (!((@as(c_int, str.*) & @as(c_int, 192)) == @as(c_int, 128))) break;
    }
    var length: usize = @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(pstr.*) -% @intFromPtr(str))), @sizeOf(u8))));
    _ = &length;
    pstr.* = str;
    return StepUTF8(&str, length);
}
pub fn StepUTF32(_str: [*c][*c]const Uint32, slen: usize) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    _ = &slen;
    if (!(slen != 0)) {
        return 0;
    }
    var str: [*c]const Uint32 = _str.*;
    _ = &str;
    const cp: Uint32 = str.*;
    _ = &cp;
    if (cp == @as(Uint32, 0)) {
        return 0;
    }
    _str.* += 1;
    return if (cp > @as(Uint32, 1114111)) @as(Uint32, SDL_INVALID_UNICODE_CODEPOINT) else cp;
}
pub fn UTF8_GetTrailingBytes(c: u8) callconv(.c) usize {
    @setEvalBranchQuota(100000);
    if ((@as(c_int, c) >= @as(c_int, 192)) and (@as(c_int, c) <= @as(c_int, 223))) {
        return 1;
    } else if ((@as(c_int, c) >= @as(c_int, 224)) and (@as(c_int, c) <= @as(c_int, 239))) {
        return 2;
    } else if ((@as(c_int, c) >= @as(c_int, 240)) and (@as(c_int, c) <= @as(c_int, 244))) {
        return 3;
    }
    return 0;
}
pub export fn SDL_memcmp_REAL(s1: ?*const anyopaque, s2: ?*const anyopaque, len: usize) c_int {
    @setEvalBranchQuota(100000);
    return memcmp(s1, s2, len);
}
pub export fn SDL_strlen_REAL(string: [*c]const u8) usize {
    @setEvalBranchQuota(100000);
    return strlen(string);
}
pub export fn SDL_strnlen_REAL(string: [*c]const u8, maxlen: usize) usize {
    @setEvalBranchQuota(100000);
    return strnlen(string, maxlen);
}
pub export fn SDL_wcslen_REAL(string: [*c]const wchar_t) usize {
    @setEvalBranchQuota(100000);
    return wcslen(string);
}
pub export fn SDL_wcsnlen_REAL(string: [*c]const wchar_t, maxlen: usize) usize {
    @setEvalBranchQuota(100000);
    return wcsnlen(string, maxlen);
}
pub export fn SDL_wcslcpy_REAL(dst: [*c]wchar_t, src: [*c]const wchar_t, maxlen: usize) usize {
    @setEvalBranchQuota(100000);
    return wcslcpy(dst, src, maxlen);
}
pub export fn SDL_wcslcat_REAL(dst: [*c]wchar_t, src: [*c]const wchar_t, maxlen: usize) usize {
    @setEvalBranchQuota(100000);
    return wcslcat(dst, src, maxlen);
}
pub export fn SDL_wcsdup_REAL(string: [*c]const wchar_t) [*c]wchar_t {
    @setEvalBranchQuota(100000);
    var len: usize = (SDL_wcslen_REAL(string) +% @as(usize, 1)) *% @sizeOf(wchar_t);
    _ = &len;
    var newstr: [*c]wchar_t = @ptrCast(@alignCast(SDL_malloc_REAL(len)));
    _ = &newstr;
    if (newstr != null) {
        _ = memcpy(@ptrCast(@alignCast(newstr)), @ptrCast(@alignCast(string)), len);
    }
    return newstr;
}
pub export fn SDL_wcsnstr_REAL(arg_haystack: [*c]const wchar_t, needle: [*c]const wchar_t, arg_maxlen: usize) [*c]wchar_t {
    @setEvalBranchQuota(100000);
    var haystack = arg_haystack;
    _ = &haystack;
    var maxlen = arg_maxlen;
    _ = &maxlen;
    var length: usize = SDL_wcslen_REAL(needle);
    _ = &length;
    if (length == @as(usize, 0)) {
        return @ptrCast(@alignCast(@constCast(haystack)));
    }
    while ((maxlen >= length) and (haystack.* != 0)) {
        if ((maxlen >= length) and (SDL_wcsncmp_REAL(haystack, needle, length) == @as(c_int, 0))) {
            return @ptrCast(@alignCast(@constCast(haystack)));
        }
        haystack += 1;
        maxlen -%= 1;
    }
    return null;
}
pub export fn SDL_wcsstr_REAL(haystack: [*c]const wchar_t, needle: [*c]const wchar_t) [*c]wchar_t {
    @setEvalBranchQuota(100000);
    return @as([*c]wchar_t, @ptrCast(@alignCast(@constCast(@as([*c]const wchar_t, @ptrCast(@alignCast(wcsstr(haystack, needle))))))));
}
pub export fn SDL_wcscmp_REAL(str1: [*c]const wchar_t, str2: [*c]const wchar_t) c_int {
    @setEvalBranchQuota(100000);
    return wcscmp(str1, str2);
}
pub export fn SDL_wcsncmp_REAL(str1: [*c]const wchar_t, str2: [*c]const wchar_t, maxlen: usize) c_int {
    @setEvalBranchQuota(100000);
    return wcsncmp(str1, str2, maxlen);
}
pub export fn SDL_wcscasecmp_REAL(wstr1: [*c]const wchar_t, wstr2: [*c]const wchar_t) c_int {
    @setEvalBranchQuota(100000);
    var str1: [*c]const Uint32 = @ptrCast(@alignCast(wstr1));
    _ = &str1;
    var str2: [*c]const Uint32 = @ptrCast(@alignCast(wstr2));
    _ = &str2;
    var folded1: [3]Uint32 = undefined;
    _ = &folded1;
    var folded2: [3]Uint32 = undefined;
    _ = &folded2;
    var head1: c_int = 0;
    _ = &head1;
    var tail1: c_int = 0;
    _ = &tail1;
    var head2: c_int = 0;
    _ = &head2;
    var tail2: c_int = 0;
    _ = &tail2;
    while (true) {
        var cp1: Uint32 = undefined;
        _ = &cp1;
        var cp2: Uint32 = undefined;
        _ = &cp2;
        if (head1 != tail1) {
            cp1 = folded1[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &tail1;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ];
        } else {
            var str1start: [*c]const Uint32 = str1;
            _ = &str1start;
            head1 = SDL_CaseFoldUnicode(StepUTF32(&str1, 1), @ptrCast(@alignCast(&folded1)));
            _ = &str1start;
            cp1 = folded1[@as(c_int, 0)];
            tail1 = 1;
        }
        if (head2 != tail2) {
            cp2 = folded2[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &tail2;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ];
        } else {
            var str2start: [*c]const Uint32 = str2;
            _ = &str2start;
            head2 = SDL_CaseFoldUnicode(StepUTF32(&str2, 1), @ptrCast(@alignCast(&folded2)));
            _ = &str2start;
            cp2 = folded2[@as(c_int, 0)];
            tail2 = 1;
        }
        if (cp1 < cp2) {
            return -@as(c_int, 1);
        } else if (cp1 > cp2) {
            return 1;
        } else if (cp1 == @as(Uint32, 0)) {
            break;
        }
    }
    return 0;
}
pub export fn SDL_wcsncasecmp_REAL(wstr1: [*c]const wchar_t, wstr2: [*c]const wchar_t, maxlen: usize) c_int {
    @setEvalBranchQuota(100000);
    var slen1: usize = maxlen;
    _ = &slen1;
    var slen2: usize = maxlen;
    _ = &slen2;
    var str1: [*c]const Uint32 = @ptrCast(@alignCast(wstr1));
    _ = &str1;
    var str2: [*c]const Uint32 = @ptrCast(@alignCast(wstr2));
    _ = &str2;
    var folded1: [3]Uint32 = undefined;
    _ = &folded1;
    var folded2: [3]Uint32 = undefined;
    _ = &folded2;
    var head1: c_int = 0;
    _ = &head1;
    var tail1: c_int = 0;
    _ = &tail1;
    var head2: c_int = 0;
    _ = &head2;
    var tail2: c_int = 0;
    _ = &tail2;
    while (true) {
        var cp1: Uint32 = undefined;
        _ = &cp1;
        var cp2: Uint32 = undefined;
        _ = &cp2;
        if (head1 != tail1) {
            cp1 = folded1[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &tail1;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ];
        } else {
            var str1start: [*c]const Uint32 = str1;
            _ = &str1start;
            head1 = SDL_CaseFoldUnicode(StepUTF32(&str1, slen1), @ptrCast(@alignCast(&folded1)));
            slen1 -%= @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(str1) -% @intFromPtr(str1start))), @sizeOf(Uint32))));
            cp1 = folded1[@as(c_int, 0)];
            tail1 = 1;
        }
        if (head2 != tail2) {
            cp2 = folded2[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &tail2;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ];
        } else {
            var str2start: [*c]const Uint32 = str2;
            _ = &str2start;
            head2 = SDL_CaseFoldUnicode(StepUTF32(&str2, slen2), @ptrCast(@alignCast(&folded2)));
            slen2 -%= @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(str2) -% @intFromPtr(str2start))), @sizeOf(Uint32))));
            cp2 = folded2[@as(c_int, 0)];
            tail2 = 1;
        }
        if (cp1 < cp2) {
            return -@as(c_int, 1);
        } else if (cp1 > cp2) {
            return 1;
        } else if (cp1 == @as(Uint32, 0)) {
            break;
        }
    }
    return 0;
}
pub export fn SDL_wcstol_REAL(string: [*c]const wchar_t, endp: [*c][*c]wchar_t, base: c_int) c_long {
    @setEvalBranchQuota(100000);
    return wcstol(string, endp, base);
}
pub export fn SDL_wcstoul_REAL(string: [*c]const wchar_t, endp: [*c][*c]wchar_t, base: c_int) c_ulong {
    @setEvalBranchQuota(100000);
    return wcstoul(string, endp, base);
}
pub export fn SDL_wcstoll_REAL(string: [*c]const wchar_t, endp: [*c][*c]wchar_t, base: c_int) c_longlong {
    @setEvalBranchQuota(100000);
    return wcstoll(string, endp, base);
}
pub export fn SDL_wcstoull_REAL(string: [*c]const wchar_t, endp: [*c][*c]wchar_t, base: c_int) c_ulonglong {
    @setEvalBranchQuota(100000);
    return wcstoull(string, endp, base);
}
pub export fn SDL_strlcpy_REAL(dst: [*c]u8, src: [*c]const u8, maxlen: usize) usize {
    @setEvalBranchQuota(100000);
    return strlcpy(dst, src, maxlen);
}
pub export fn SDL_utf8strlcpy_REAL(dst: [*c]u8, src: [*c]const u8, dst_bytes: usize) usize {
    @setEvalBranchQuota(100000);
    var bytes: usize = 0;
    _ = &bytes;
    if (dst_bytes > @as(usize, 0)) {
        var src_bytes: usize = SDL_strlen_REAL(src);
        _ = &src_bytes;
        var i: usize = 0;
        _ = &i;
        var trailing_bytes: usize = 0;
        _ = &trailing_bytes;
        bytes = if (src_bytes < (dst_bytes -% @as(usize, 1))) src_bytes else dst_bytes -% @as(usize, 1);
        if (bytes != 0) {
            var c: u8 = src[bytes -% @as(usize, 1)];
            _ = &c;
            if ((@as(c_int, c) >= @as(c_int, 192)) and (@as(c_int, c) <= @as(c_int, 244))) {
                bytes -%= 1;
            } else if ((@as(c_int, c) >= @as(c_int, 128)) and (@as(c_int, c) <= @as(c_int, 191))) {
                {
                    i = bytes -% @as(usize, 1);
                    while (i != @as(usize, 0)) : (i -%= 1) {
                        c = src[i];
                        trailing_bytes = UTF8_GetTrailingBytes(c);
                        if (trailing_bytes != 0) {
                            if ((bytes -% i) != (trailing_bytes +% @as(usize, 1))) {
                                bytes = i;
                            }
                            break;
                        }
                    }
                }
            }
            _ = memcpy(@ptrCast(@alignCast(dst)), @ptrCast(@alignCast(src)), bytes);
        }
        dst[bytes] = '\x00';
    }
    return bytes;
}
pub export fn SDL_utf8strlen_REAL(arg_str: [*c]const u8) usize {
    @setEvalBranchQuota(100000);
    var str = arg_str;
    _ = &str;
    var result: usize = 0;
    _ = &result;
    while (SDL_StepUTF8_REAL(&str, null) != 0) {
        result +%= 1;
    }
    return result;
}
pub export fn SDL_utf8strnlen_REAL(arg_str: [*c]const u8, arg_bytes: usize) usize {
    @setEvalBranchQuota(100000);
    var str = arg_str;
    _ = &str;
    var bytes = arg_bytes;
    _ = &bytes;
    var result: usize = 0;
    _ = &result;
    while (SDL_StepUTF8_REAL(&str, &bytes) != 0) {
        result +%= 1;
    }
    return result;
}
pub export fn SDL_strlcat_REAL(dst: [*c]u8, src: [*c]const u8, maxlen: usize) usize {
    @setEvalBranchQuota(100000);
    return strlcat(dst, src, maxlen);
}
pub export fn SDL_strdup_REAL(string: [*c]const u8) [*c]u8 {
    @setEvalBranchQuota(100000);
    var len: usize = SDL_strlen_REAL(string) +% @as(usize, 1);
    _ = &len;
    var newstr: [*c]u8 = @ptrCast(@alignCast(SDL_malloc_REAL(len)));
    _ = &newstr;
    if (newstr != null) {
        _ = memcpy(@ptrCast(@alignCast(newstr)), @ptrCast(@alignCast(string)), len);
    }
    return newstr;
}
pub export fn SDL_strndup_REAL(string: [*c]const u8, maxlen: usize) [*c]u8 {
    @setEvalBranchQuota(100000);
    var len: usize = SDL_strnlen_REAL(string, maxlen);
    _ = &len;
    var newstr: [*c]u8 = @ptrCast(@alignCast(SDL_malloc_REAL(len +% @as(usize, 1))));
    _ = &newstr;
    if (newstr != null) {
        _ = memcpy(@ptrCast(@alignCast(newstr)), @ptrCast(@alignCast(string)), len);
        newstr[len] = '\x00';
    }
    return newstr;
}
pub export fn SDL_strrev_REAL(string: [*c]u8) [*c]u8 {
    @setEvalBranchQuota(100000);
    var len: usize = SDL_strlen_REAL(string);
    _ = &len;
    var a: [*c]u8 = &string[@as(c_int, 0)];
    _ = &a;
    var b: [*c]u8 = &string[len -% @as(usize, 1)];
    _ = &b;
    len /= 2;
    while ((blk: {
        const ref = &len;
        const tmp = ref.*;
        ref.* -%= 1;
        break :blk tmp;
    }) != 0) {
        const c: u8 = a.*;
        _ = &c;
        (blk: {
            const ref = &a;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        }).* = b.*;
        (blk: {
            const ref = &b;
            const tmp = ref.*;
            ref.* -= 1;
            break :blk tmp;
        }).* = c;
    }
    return string;
}
pub export fn SDL_strupr_REAL(string: [*c]u8) [*c]u8 {
    @setEvalBranchQuota(100000);
    var bufp: [*c]u8 = string;
    _ = &bufp;
    while (@as(c_int, bufp.*) != 0) {
        bufp.* = @bitCast(@as(i8, @truncate(SDL_toupper_REAL(@as(u8, bufp.*)))));
        bufp += 1;
    }
    return string;
}
pub export fn SDL_strlwr_REAL(string: [*c]u8) [*c]u8 {
    @setEvalBranchQuota(100000);
    var bufp: [*c]u8 = string;
    _ = &bufp;
    while (@as(c_int, bufp.*) != 0) {
        bufp.* = @bitCast(@as(i8, @truncate(SDL_tolower_REAL(@as(u8, bufp.*)))));
        bufp += 1;
    }
    return string;
}
pub export fn SDL_strchr_REAL(string: [*c]const u8, c: c_int) [*c]u8 {
    @setEvalBranchQuota(100000);
    return @as([*c]u8, @ptrCast(@alignCast(@constCast(@as([*c]const u8, @ptrCast(@alignCast(strchr(string, c))))))));
}
pub export fn SDL_strrchr_REAL(string: [*c]const u8, c: c_int) [*c]u8 {
    @setEvalBranchQuota(100000);
    return @as([*c]u8, @ptrCast(@alignCast(@constCast(@as([*c]const u8, @ptrCast(@alignCast(strrchr(string, c))))))));
}
pub export fn SDL_strnstr_REAL(arg_haystack: [*c]const u8, needle: [*c]const u8, arg_maxlen: usize) [*c]u8 {
    @setEvalBranchQuota(100000);
    var haystack = arg_haystack;
    _ = &haystack;
    var maxlen = arg_maxlen;
    _ = &maxlen;
    var length: usize = SDL_strlen_REAL(needle);
    _ = &length;
    if (length == @as(usize, 0)) {
        return @ptrCast(@alignCast(@constCast(haystack)));
    }
    while ((maxlen >= length) and (@as(c_int, haystack.*) != 0)) {
        if (SDL_strncmp_REAL(haystack, needle, length) == @as(c_int, 0)) {
            return @ptrCast(@alignCast(@constCast(haystack)));
        }
        haystack += 1;
        maxlen -%= 1;
    }
    return null;
}
pub export fn SDL_strstr_REAL(haystack: [*c]const u8, needle: [*c]const u8) [*c]u8 {
    @setEvalBranchQuota(100000);
    return @as([*c]u8, @ptrCast(@alignCast(@constCast(@as([*c]const u8, @ptrCast(@alignCast(strstr(haystack, needle))))))));
}
pub export fn SDL_strcasestr_REAL(arg_haystack: [*c]const u8, needle: [*c]const u8) [*c]u8 {
    @setEvalBranchQuota(100000);
    var haystack = arg_haystack;
    _ = &haystack;
    const length: usize = SDL_strlen_REAL(needle);
    _ = &length;
    while (true) {
        if (SDL_strncasecmp_REAL(haystack, needle, length) == @as(c_int, 0)) {
            return @ptrCast(@alignCast(@constCast(haystack)));
        }
        if (!(SDL_StepUTF8_REAL(&haystack, null) != 0)) break;
    }
    return null;
}
pub const ntoa_table: [36]u8 = [36]u8{
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z',
};
pub export fn SDL_uitoa_REAL(value: c_uint, string: [*c]u8, radix: c_int) [*c]u8 {
    @setEvalBranchQuota(100000);
    return SDL_ultoa_REAL(value, string, radix);
}
pub export fn SDL_itoa_REAL(value: c_int, string: [*c]u8, radix: c_int) [*c]u8 {
    @setEvalBranchQuota(100000);
    return SDL_ltoa_REAL(value, string, radix);
}
pub export fn SDL_ltoa_REAL(value: c_long, string: [*c]u8, radix: c_int) [*c]u8 {
    @setEvalBranchQuota(100000);
    var bufp: [*c]u8 = string;
    _ = &bufp;
    if (value < @as(c_long, 0)) {
        (blk: {
            const ref = &bufp;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        }).* = '-';
        _ = SDL_ultoa_REAL(@bitCast(@as(c_long, -value)), bufp, radix);
    } else {
        _ = SDL_ultoa_REAL(@bitCast(@as(c_long, value)), bufp, radix);
    }
    return string;
}
pub export fn SDL_ultoa_REAL(arg_value: c_ulong, string: [*c]u8, radix: c_int) [*c]u8 {
    @setEvalBranchQuota(100000);
    var value = arg_value;
    _ = &value;
    var bufp: [*c]u8 = string;
    _ = &bufp;
    if (value != 0) {
        while (value > @as(c_ulong, 0)) {
            (blk: {
                const ref = &bufp;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            }).* = ntoa_table[value % @as(c_ulong, @bitCast(@as(c_long, radix)))];
            value /= @bitCast(@as(c_long, radix));
        }
    } else {
        (blk: {
            const ref = &bufp;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        }).* = '0';
    }
    bufp.* = '\x00';
    _ = SDL_strrev_REAL(string);
    return string;
}
pub export fn SDL_lltoa_REAL(value: c_longlong, string: [*c]u8, radix: c_int) [*c]u8 {
    @setEvalBranchQuota(100000);
    var bufp: [*c]u8 = string;
    _ = &bufp;
    if (value < @as(c_longlong, 0)) {
        (blk: {
            const ref = &bufp;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        }).* = '-';
        _ = SDL_ulltoa_REAL(@bitCast(@as(c_longlong, -value)), bufp, radix);
    } else {
        _ = SDL_ulltoa_REAL(@bitCast(@as(c_longlong, value)), bufp, radix);
    }
    return string;
}
pub export fn SDL_ulltoa_REAL(arg_value: c_ulonglong, string: [*c]u8, radix: c_int) [*c]u8 {
    @setEvalBranchQuota(100000);
    var value = arg_value;
    _ = &value;
    var bufp: [*c]u8 = string;
    _ = &bufp;
    if (value != 0) {
        while (value > @as(c_ulonglong, 0)) {
            (blk: {
                const ref = &bufp;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            }).* = ntoa_table[@intCast(value % @as(c_ulonglong, @bitCast(@as(c_longlong, radix))))];
            value /= @bitCast(@as(c_longlong, radix));
        }
    } else {
        (blk: {
            const ref = &bufp;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        }).* = '0';
    }
    bufp.* = '\x00';
    _ = SDL_strrev_REAL(string);
    return string;
}
pub export fn SDL_atoi_REAL(string: [*c]const u8) c_int {
    @setEvalBranchQuota(100000);
    return atoi(string);
}
pub export fn SDL_atof_REAL(string: [*c]const u8) f64 {
    @setEvalBranchQuota(100000);
    return atof(string);
}
pub export fn SDL_strtol_REAL(string: [*c]const u8, endp: [*c][*c]u8, base: c_int) c_long {
    @setEvalBranchQuota(100000);
    return strtol(string, endp, base);
}
pub export fn SDL_strtoul_REAL(string: [*c]const u8, endp: [*c][*c]u8, base: c_int) c_ulong {
    @setEvalBranchQuota(100000);
    return strtoul(string, endp, base);
}
pub export fn SDL_strtoll_REAL(string: [*c]const u8, endp: [*c][*c]u8, base: c_int) c_longlong {
    @setEvalBranchQuota(100000);
    return strtoll(string, endp, base);
}
pub export fn SDL_strtoull_REAL(string: [*c]const u8, endp: [*c][*c]u8, base: c_int) c_ulonglong {
    @setEvalBranchQuota(100000);
    return strtoull(string, endp, base);
}
pub export fn SDL_strtod_REAL(string: [*c]const u8, endp: [*c][*c]u8) f64 {
    @setEvalBranchQuota(100000);
    return strtod(string, endp);
}
pub export fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int {
    @setEvalBranchQuota(100000);
    return strcmp(str1, str2);
}
pub export fn SDL_strncmp_REAL(str1: [*c]const u8, str2: [*c]const u8, maxlen: usize) c_int {
    @setEvalBranchQuota(100000);
    return strncmp(str1, str2, maxlen);
}
pub export fn SDL_strcasecmp_REAL(arg_str1: [*c]const u8, arg_str2: [*c]const u8) c_int {
    @setEvalBranchQuota(100000);
    var str1 = arg_str1;
    _ = &str1;
    var str2 = arg_str2;
    _ = &str2;
    var folded1: [3]Uint32 = undefined;
    _ = &folded1;
    var folded2: [3]Uint32 = undefined;
    _ = &folded2;
    var head1: c_int = 0;
    _ = &head1;
    var tail1: c_int = 0;
    _ = &tail1;
    var head2: c_int = 0;
    _ = &head2;
    var tail2: c_int = 0;
    _ = &tail2;
    while (true) {
        var cp1: Uint32 = undefined;
        _ = &cp1;
        var cp2: Uint32 = undefined;
        _ = &cp2;
        if (head1 != tail1) {
            cp1 = folded1[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &tail1;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ];
        } else {
            var str1start: [*c]const Uint8 = @ptrCast(@alignCast(str1));
            _ = &str1start;
            head1 = SDL_CaseFoldUnicode(StepUTF8(&str1, 4), @ptrCast(@alignCast(&folded1)));
            _ = &str1start;
            cp1 = folded1[@as(c_int, 0)];
            tail1 = 1;
        }
        if (head2 != tail2) {
            cp2 = folded2[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &tail2;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ];
        } else {
            var str2start: [*c]const Uint8 = @ptrCast(@alignCast(str2));
            _ = &str2start;
            head2 = SDL_CaseFoldUnicode(StepUTF8(&str2, 4), @ptrCast(@alignCast(&folded2)));
            _ = &str2start;
            cp2 = folded2[@as(c_int, 0)];
            tail2 = 1;
        }
        if (cp1 < cp2) {
            return -@as(c_int, 1);
        } else if (cp1 > cp2) {
            return 1;
        } else if (cp1 == @as(Uint32, 0)) {
            break;
        }
    }
    return 0;
}
pub export fn SDL_strncasecmp_REAL(arg_str1: [*c]const u8, arg_str2: [*c]const u8, maxlen: usize) c_int {
    @setEvalBranchQuota(100000);
    var str1 = arg_str1;
    _ = &str1;
    var str2 = arg_str2;
    _ = &str2;
    var slen1: usize = maxlen;
    _ = &slen1;
    var slen2: usize = maxlen;
    _ = &slen2;
    var folded1: [3]Uint32 = undefined;
    _ = &folded1;
    var folded2: [3]Uint32 = undefined;
    _ = &folded2;
    var head1: c_int = 0;
    _ = &head1;
    var tail1: c_int = 0;
    _ = &tail1;
    var head2: c_int = 0;
    _ = &head2;
    var tail2: c_int = 0;
    _ = &tail2;
    while (true) {
        var cp1: Uint32 = undefined;
        _ = &cp1;
        var cp2: Uint32 = undefined;
        _ = &cp2;
        if (head1 != tail1) {
            cp1 = folded1[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &tail1;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ];
        } else {
            var str1start: [*c]const Uint8 = @ptrCast(@alignCast(str1));
            _ = &str1start;
            head1 = SDL_CaseFoldUnicode(StepUTF8(&str1, slen1), @ptrCast(@alignCast(&folded1)));
            slen1 -%= @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(str1) -% @intFromPtr(@as([*c]const u8, @ptrCast(@alignCast(str1start)))))), @sizeOf(u8))));
            cp1 = folded1[@as(c_int, 0)];
            tail1 = 1;
        }
        if (head2 != tail2) {
            cp2 = folded2[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &tail2;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ];
        } else {
            var str2start: [*c]const Uint8 = @ptrCast(@alignCast(str2));
            _ = &str2start;
            head2 = SDL_CaseFoldUnicode(StepUTF8(&str2, slen2), @ptrCast(@alignCast(&folded2)));
            slen2 -%= @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(str2) -% @intFromPtr(@as([*c]const u8, @ptrCast(@alignCast(str2start)))))), @sizeOf(u8))));
            cp2 = folded2[@as(c_int, 0)];
            tail2 = 1;
        }
        if (cp1 < cp2) {
            return -@as(c_int, 1);
        } else if (cp1 > cp2) {
            return 1;
        } else if (cp1 == @as(Uint32, 0)) {
            break;
        }
    }
    return 0;
}
pub export fn SDL_sscanf_REAL(text: [*c]const u8, fmt: [*c]const u8, ...) c_int {
    @setEvalBranchQuota(100000);
    var rc: c_int = undefined;
    _ = &rc;
    var ap: va_list = undefined;
    _ = &ap;
    __builtin.va_start(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&ap))), @cVaStart());
    rc = SDL_vsscanf_REAL(text, fmt, @ptrCast(@alignCast(&ap)));
    __builtin.va_end(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&ap))));
    return rc;
}
pub export fn SDL_vsscanf_REAL(text: [*c]const u8, fmt: [*c]const u8, ap: [*c]struct___va_list_tag_2) c_int {
    @setEvalBranchQuota(100000);
    return vsscanf(text, fmt, ap);
}
pub export fn SDL_snprintf_REAL(text: [*c]u8, maxlen: usize, fmt: [*c]const u8, ...) c_int {
    @setEvalBranchQuota(100000);
    var ap: va_list = undefined;
    _ = &ap;
    var result: c_int = undefined;
    _ = &result;
    __builtin.va_start(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&ap))), @cVaStart());
    result = SDL_vsnprintf_REAL(text, maxlen, fmt, @ptrCast(@alignCast(&ap)));
    __builtin.va_end(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&ap))));
    return result;
}
pub export fn SDL_swprintf_REAL(text: [*c]wchar_t, maxlen: usize, fmt: [*c]const wchar_t, ...) c_int {
    @setEvalBranchQuota(100000);
    var ap: va_list = undefined;
    _ = &ap;
    var result: c_int = undefined;
    _ = &result;
    __builtin.va_start(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&ap))), @cVaStart());
    result = SDL_vswprintf_REAL(text, maxlen, fmt, @ptrCast(@alignCast(&ap)));
    __builtin.va_end(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&ap))));
    return result;
}
pub export fn SDL_vsnprintf_REAL(text: [*c]u8, maxlen: usize, arg_fmt: [*c]const u8, ap: [*c]struct___va_list_tag_2) c_int {
    @setEvalBranchQuota(100000);
    var fmt = arg_fmt;
    _ = &fmt;
    if (!(fmt != null)) {
        fmt = "";
    }
    return vsnprintf(text, maxlen, fmt, ap);
}
pub export fn SDL_vswprintf_REAL(text: [*c]wchar_t, maxlen: usize, fmt: [*c]const wchar_t, ap: [*c]struct___va_list_tag_2) c_int {
    @setEvalBranchQuota(100000);
    if (text != null) {
        text[@as(c_int, 0)] = 0;
    }
    var fmt_utf8: [*c]u8 = null;
    _ = &fmt_utf8;
    if (fmt != null) {
        fmt_utf8 = SDL_iconv_string_REAL("UTF-8", "WCHAR_T", @ptrCast(@alignCast(fmt)), (SDL_wcslen_REAL(fmt) +% @as(usize, 1)) *% @sizeOf(wchar_t));
        if (!(fmt_utf8 != null)) {
            return -@as(c_int, 1);
        }
    }
    var tinybuf: [64]u8 = undefined;
    _ = &tinybuf;
    var aq: va_list = undefined;
    _ = &aq;
    __builtin.va_copy(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&aq))), ap);
    const utf8len: c_int = SDL_vsnprintf_REAL(@ptrCast(@alignCast(&tinybuf)), @sizeOf(@TypeOf(tinybuf)), fmt_utf8, @ptrCast(@alignCast(&aq)));
    _ = &utf8len;
    __builtin.va_end(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&aq))));
    if (utf8len < @as(c_int, 0)) {
        SDL_free_REAL(@ptrCast(@alignCast(fmt_utf8)));
        return -@as(c_int, 1);
    }
    var isstack: bool = @"false" != 0;
    _ = &isstack;
    var smallbuf: [*c]u8 = null;
    _ = &smallbuf;
    var utf8buf: [*c]u8 = undefined;
    _ = &utf8buf;
    var result: c_int = undefined;
    _ = &result;
    if (@as(c_ulong, @bitCast(@as(c_long, utf8len))) < @sizeOf(@TypeOf(tinybuf))) {
        utf8buf = @ptrCast(@alignCast(&tinybuf));
    } else {
        utf8buf = blk: {
            const tmp = blk_1: {
                (&isstack).* = (@sizeOf(u8) *% @as(c_ulong, @bitCast(@as(c_long, utf8len + @as(c_int, 1))))) < @as(c_ulong, SDL_MAX_SMALL_ALLOC_STACKSIZE);
                break :blk_1 if ((&isstack).*) @as([*c]u8, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(u8) *% @as(c_ulong, @bitCast(@as(c_long, utf8len + @as(c_int, 1)))))))) else @as([*c]u8, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(u8) *% @as(c_ulong, @bitCast(@as(c_long, utf8len + @as(c_int, 1))))))));
            };
            smallbuf = tmp;
            break :blk tmp;
        };
        if (!(smallbuf != null)) {
            SDL_free_REAL(@ptrCast(@alignCast(fmt_utf8)));
            return -@as(c_int, 1);
        }
        const utf8len2: c_int = SDL_vsnprintf_REAL(smallbuf, @bitCast(@as(c_long, utf8len + @as(c_int, 1))), fmt_utf8, ap);
        _ = &utf8len2;
        if (utf8len2 > utf8len) {
            SDL_free_REAL(@ptrCast(@alignCast(fmt_utf8)));
            return @intFromBool(SDL_SetError_REAL("Formatted output changed between two runs"));
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(fmt_utf8)));
    var wbuf: [*c]wchar_t = @ptrCast(@alignCast(SDL_iconv_string_REAL("WCHAR_T", "UTF-8", utf8buf, @bitCast(@as(c_long, utf8len + @as(c_int, 1))))));
    _ = &wbuf;
    if (wbuf != null) {
        if (text != null) {
            _ = SDL_wcslcpy_REAL(text, wbuf, maxlen);
        }
        result = @bitCast(@as(c_uint, @truncate(SDL_wcslen_REAL(wbuf))));
        SDL_free_REAL(@ptrCast(@alignCast(wbuf)));
    } else {
        result = -@as(c_int, 1);
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(smallbuf))) != @as(?*anyopaque, null)) {
        if (isstack) {
            SDL_free_REAL(@ptrCast(@alignCast(smallbuf)));
        } else {
            SDL_free_REAL(@ptrCast(@alignCast(smallbuf)));
        }
    }
    return result;
}
pub export fn SDL_asprintf_REAL(strp: [*c][*c]u8, fmt: [*c]const u8, ...) c_int {
    @setEvalBranchQuota(100000);
    var ap: va_list = undefined;
    _ = &ap;
    var result: c_int = undefined;
    _ = &result;
    __builtin.va_start(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&ap))), @cVaStart());
    result = SDL_vasprintf_REAL(strp, fmt, @ptrCast(@alignCast(&ap)));
    __builtin.va_end(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&ap))));
    return result;
}
pub export fn SDL_vasprintf_REAL(strp: [*c][*c]u8, fmt: [*c]const u8, ap: [*c]struct___va_list_tag_2) c_int {
    @setEvalBranchQuota(100000);
    var result: c_int = undefined;
    _ = &result;
    var size: c_int = 100;
    _ = &size;
    var p: [*c]u8 = undefined;
    _ = &p;
    var np: [*c]u8 = undefined;
    _ = &np;
    var aq: va_list = undefined;
    _ = &aq;
    strp.* = null;
    p = @ptrCast(@alignCast(SDL_malloc_REAL(@bitCast(@as(c_long, size)))));
    if (!(p != null)) {
        return -@as(c_int, 1);
    }
    while (true) {
        __builtin.va_copy(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&aq))), ap);
        result = SDL_vsnprintf_REAL(p, @bitCast(@as(c_long, size)), fmt, @ptrCast(@alignCast(&aq)));
        __builtin.va_end(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&aq))));
        if (result < @as(c_int, 0)) {
            SDL_free_REAL(@ptrCast(@alignCast(p)));
            return result;
        }
        if (result < size) {
            strp.* = p;
            return result;
        }
        size = result + @as(c_int, 1);
        np = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(p)), @bitCast(@as(c_long, size)))));
        if (!(np != null)) {
            SDL_free_REAL(@ptrCast(@alignCast(p)));
            return -@as(c_int, 1);
        } else {
            p = np;
        }
    }
    return undefined;
}
pub export fn SDL_strpbrk_REAL(str: [*c]const u8, breakset: [*c]const u8) [*c]u8 {
    @setEvalBranchQuota(100000);
    return @as([*c]u8, @ptrCast(@alignCast(@constCast(@as([*c]const u8, @ptrCast(@alignCast(strpbrk(str, breakset))))))));
}

pub const __SIZEOF_WCHAR_T__ = @as(c_int, 4);
pub const SDL_MAX_SMALL_ALLOC_STACKSIZE = @as(c_int, 128);
pub const SDL_StepUTF8 = SDL_StepUTF8_REAL;
pub const SDL_UCS4ToUTF8 = SDL_UCS4ToUTF8_REAL;
pub const SDL_asprintf = SDL_asprintf_REAL;
pub const SDL_atof = SDL_atof_REAL;
pub const SDL_lltoa = SDL_lltoa_REAL;
pub const SDL_ltoa = SDL_ltoa_REAL;
pub const SDL_memcmp = SDL_memcmp_REAL;
pub const SDL_sscanf = SDL_sscanf_REAL;
pub const SDL_strcasecmp = SDL_strcasecmp_REAL;
pub const SDL_strcasestr = SDL_strcasestr_REAL;
pub const SDL_strchr = SDL_strchr_REAL;
pub const SDL_strcmp = SDL_strcmp_REAL;
pub const SDL_strdup = SDL_strdup_REAL;
pub const SDL_strlen = SDL_strlen_REAL;
pub const SDL_strlwr = SDL_strlwr_REAL;
pub const SDL_strncasecmp = SDL_strncasecmp_REAL;
pub const SDL_strncmp = SDL_strncmp_REAL;
pub const SDL_strndup = SDL_strndup_REAL;
pub const SDL_strnlen = SDL_strnlen_REAL;
pub const SDL_strnstr = SDL_strnstr_REAL;
pub const SDL_strpbrk = SDL_strpbrk_REAL;
pub const SDL_strrchr = SDL_strrchr_REAL;
pub const SDL_strrev = SDL_strrev_REAL;
pub const SDL_strstr = SDL_strstr_REAL;
pub const SDL_strtod = SDL_strtod_REAL;
pub const SDL_strtol = SDL_strtol_REAL;
pub const SDL_strtoll = SDL_strtoll_REAL;
pub const SDL_strtoul = SDL_strtoul_REAL;
pub const SDL_strtoull = SDL_strtoull_REAL;
pub const SDL_strupr = SDL_strupr_REAL;
pub const SDL_ulltoa = SDL_ulltoa_REAL;
pub const SDL_ultoa = SDL_ultoa_REAL;
pub const SDL_utf8strlen = SDL_utf8strlen_REAL;
pub const SDL_utf8strnlen = SDL_utf8strnlen_REAL;
pub const SDL_vasprintf = SDL_vasprintf_REAL;
pub const SDL_vsscanf = SDL_vsscanf_REAL;
pub const SDL_wcscasecmp = SDL_wcscasecmp_REAL;
pub const SDL_wcscmp = SDL_wcscmp_REAL;
pub const SDL_wcsdup = SDL_wcsdup_REAL;
pub const SDL_wcslen = SDL_wcslen_REAL;
pub const SDL_wcsncasecmp = SDL_wcsncasecmp_REAL;
pub const SDL_wcsncmp = SDL_wcsncmp_REAL;
pub const SDL_wcsnlen = SDL_wcsnlen_REAL;
pub const SDL_wcsnstr = SDL_wcsnstr_REAL;
pub const SDL_wcsstr = SDL_wcsstr_REAL;
pub const SDL_wcstol = SDL_wcstol_REAL;
pub const SDL_StepBackUTF8 = SDL_StepBackUTF8_REAL;
pub const SDL_wcstoul = SDL_wcstoul_REAL;
pub const SDL_wcstoll = SDL_wcstoll_REAL;
pub const SDL_wcstoull = SDL_wcstoull_REAL;
pub const va_start = @compileError("unable to translate macro: undefined identifier `__builtin_va_start`");
// /home/addo/dev/stupid/zdl/.cache/zig-lib/compiler/aro/include/stdarg.h:12:9
pub inline fn va_end(ap: anytype) @TypeOf(__builtin.va_end(ap)) {
    @setEvalBranchQuota(100000);
    _ = &ap;
    return __builtin.va_end(ap);
}
pub inline fn va_copy(d: anytype, s: anytype) @TypeOf(__builtin.va_copy(d, s)) {
    @setEvalBranchQuota(100000);
    _ = &d;
    _ = &s;
    return __builtin.va_copy(d, s);
}
pub const @"false" = @as(c_int, 0);
pub inline fn SDL_INOUT_Z_CAP(x: anytype) void {
    @setEvalBranchQuota(100000);
    _ = &x;
    return;
}
pub inline fn SDL_OUT_Z_CAP(x: anytype) void {
    @setEvalBranchQuota(100000);
    _ = &x;
    return;
}
pub const SDL_INVALID_UNICODE_CODEPOINT = __helpers.promoteIntLiteral(c_int, 0xFFFD, .hex);
pub inline fn UTF8_IsLeadByte(c: anytype) @TypeOf((c >= @as(c_int, 0xC0)) and (c <= @as(c_int, 0xF4))) {
    @setEvalBranchQuota(100000);
    _ = &c;
    return (c >= @as(c_int, 0xC0)) and (c <= @as(c_int, 0xF4));
}
