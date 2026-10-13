const __builtin = @import("translation_builtins");
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
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Uint16 = u16;
pub const Uint32 = u32;
pub const Uint64 = u64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_memcmp_REAL(s1: ?*const anyopaque, s2: ?*const anyopaque, len: usize) c_int;
pub extern fn SDL_powf_REAL(x: f32, y: f32) f32;
pub const struct_SDL_AtomicInt = extern struct {
    value: c_int = 0,
};
pub const SDL_AtomicInt = struct_SDL_AtomicInt;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_PropertiesID = Uint32;
pub const SDL_ThreadID = Uint64;
pub const struct_SDL_InitState = extern struct {
    status: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
    thread: SDL_ThreadID = 0,
    reserved: ?*anyopaque = null,
};
pub const SDL_InitState = struct_SDL_InitState;
pub extern fn SDL_ShouldInit_REAL(state: [*c]SDL_InitState) bool;
pub extern fn SDL_ShouldQuit_REAL(state: [*c]SDL_InitState) bool;
pub extern fn SDL_SetInitialized_REAL(state: [*c]SDL_InitState, initialized: bool) void;
pub const SDL_PIXELTYPE_INDEX1: c_int = 1;
pub const SDL_PIXELTYPE_INDEX4: c_int = 2;
pub const SDL_PIXELTYPE_INDEX8: c_int = 3;
pub const SDL_PIXELTYPE_PACKED8: c_int = 4;
pub const SDL_PIXELTYPE_PACKED16: c_int = 5;
pub const SDL_PIXELTYPE_PACKED32: c_int = 6;
pub const SDL_PIXELTYPE_ARRAYU8: c_int = 7;
pub const SDL_PIXELTYPE_ARRAYF16: c_int = 10;
pub const SDL_PIXELTYPE_ARRAYF32: c_int = 11;
pub const SDL_PIXELTYPE_INDEX2: c_int = 12;
pub const SDL_PACKEDORDER_XRGB: c_int = 1;
pub const SDL_PACKEDORDER_RGBX: c_int = 2;
pub const SDL_PACKEDORDER_ARGB: c_int = 3;
pub const SDL_PACKEDORDER_RGBA: c_int = 4;
pub const SDL_PACKEDORDER_XBGR: c_int = 5;
pub const SDL_PACKEDORDER_BGRX: c_int = 6;
pub const SDL_PACKEDORDER_ABGR: c_int = 7;
pub const SDL_PACKEDORDER_BGRA: c_int = 8;
pub const SDL_ARRAYORDER_RGB: c_int = 1;
pub const SDL_ARRAYORDER_RGBA: c_int = 2;
pub const SDL_ARRAYORDER_ARGB: c_int = 3;
pub const SDL_ARRAYORDER_BGR: c_int = 4;
pub const SDL_ARRAYORDER_BGRA: c_int = 5;
pub const SDL_ARRAYORDER_ABGR: c_int = 6;
pub const SDL_PACKEDLAYOUT_332: c_int = 1;
pub const SDL_PACKEDLAYOUT_4444: c_int = 2;
pub const SDL_PACKEDLAYOUT_1555: c_int = 3;
pub const SDL_PACKEDLAYOUT_5551: c_int = 4;
pub const SDL_PACKEDLAYOUT_565: c_int = 5;
pub const SDL_PACKEDLAYOUT_8888: c_int = 6;
pub const SDL_PACKEDLAYOUT_2101010: c_int = 7;
pub const SDL_PACKEDLAYOUT_1010102: c_int = 8;
pub const SDL_PIXELFORMAT_UNKNOWN: c_int = 0;
pub const SDL_PIXELFORMAT_INDEX1LSB: c_int = 286261504;
pub const SDL_PIXELFORMAT_INDEX1MSB: c_int = 287310080;
pub const SDL_PIXELFORMAT_INDEX2LSB: c_int = 470811136;
pub const SDL_PIXELFORMAT_INDEX2MSB: c_int = 471859712;
pub const SDL_PIXELFORMAT_INDEX4LSB: c_int = 303039488;
pub const SDL_PIXELFORMAT_INDEX4MSB: c_int = 304088064;
pub const SDL_PIXELFORMAT_INDEX8: c_int = 318769153;
pub const SDL_PIXELFORMAT_RGB332: c_int = 336660481;
pub const SDL_PIXELFORMAT_XRGB4444: c_int = 353504258;
pub const SDL_PIXELFORMAT_XBGR4444: c_int = 357698562;
pub const SDL_PIXELFORMAT_XRGB1555: c_int = 353570562;
pub const SDL_PIXELFORMAT_XBGR1555: c_int = 357764866;
pub const SDL_PIXELFORMAT_ARGB4444: c_int = 355602434;
pub const SDL_PIXELFORMAT_RGBA4444: c_int = 356651010;
pub const SDL_PIXELFORMAT_ABGR4444: c_int = 359796738;
pub const SDL_PIXELFORMAT_BGRA4444: c_int = 360845314;
pub const SDL_PIXELFORMAT_ARGB1555: c_int = 355667970;
pub const SDL_PIXELFORMAT_RGBA5551: c_int = 356782082;
pub const SDL_PIXELFORMAT_ABGR1555: c_int = 359862274;
pub const SDL_PIXELFORMAT_BGRA5551: c_int = 360976386;
pub const SDL_PIXELFORMAT_RGB565: c_int = 353701890;
pub const SDL_PIXELFORMAT_BGR565: c_int = 357896194;
pub const SDL_PIXELFORMAT_RGB24: c_int = 386930691;
pub const SDL_PIXELFORMAT_BGR24: c_int = 390076419;
pub const SDL_PIXELFORMAT_XRGB8888: c_int = 370546692;
pub const SDL_PIXELFORMAT_RGBX8888: c_int = 371595268;
pub const SDL_PIXELFORMAT_XBGR8888: c_int = 374740996;
pub const SDL_PIXELFORMAT_BGRX8888: c_int = 375789572;
pub const SDL_PIXELFORMAT_ARGB8888: c_int = 372645892;
pub const SDL_PIXELFORMAT_RGBA8888: c_int = 373694468;
pub const SDL_PIXELFORMAT_ABGR8888: c_int = 376840196;
pub const SDL_PIXELFORMAT_BGRA8888: c_int = 377888772;
pub const SDL_PIXELFORMAT_XRGB2101010: c_int = 370614276;
pub const SDL_PIXELFORMAT_XBGR2101010: c_int = 374808580;
pub const SDL_PIXELFORMAT_ARGB2101010: c_int = 372711428;
pub const SDL_PIXELFORMAT_ABGR2101010: c_int = 376905732;
pub const SDL_PIXELFORMAT_RGB48: c_int = 403714054;
pub const SDL_PIXELFORMAT_BGR48: c_int = 406859782;
pub const SDL_PIXELFORMAT_RGBA64: c_int = 404766728;
pub const SDL_PIXELFORMAT_ARGB64: c_int = 405815304;
pub const SDL_PIXELFORMAT_BGRA64: c_int = 407912456;
pub const SDL_PIXELFORMAT_ABGR64: c_int = 408961032;
pub const SDL_PIXELFORMAT_RGB48_FLOAT: c_int = 437268486;
pub const SDL_PIXELFORMAT_BGR48_FLOAT: c_int = 440414214;
pub const SDL_PIXELFORMAT_RGBA64_FLOAT: c_int = 438321160;
pub const SDL_PIXELFORMAT_ARGB64_FLOAT: c_int = 439369736;
pub const SDL_PIXELFORMAT_BGRA64_FLOAT: c_int = 441466888;
pub const SDL_PIXELFORMAT_ABGR64_FLOAT: c_int = 442515464;
pub const SDL_PIXELFORMAT_RGB96_FLOAT: c_int = 454057996;
pub const SDL_PIXELFORMAT_BGR96_FLOAT: c_int = 457203724;
pub const SDL_PIXELFORMAT_RGBA128_FLOAT: c_int = 455114768;
pub const SDL_PIXELFORMAT_ARGB128_FLOAT: c_int = 456163344;
pub const SDL_PIXELFORMAT_BGRA128_FLOAT: c_int = 458260496;
pub const SDL_PIXELFORMAT_ABGR128_FLOAT: c_int = 459309072;
pub const SDL_PIXELFORMAT_YV12: c_int = 842094169;
pub const SDL_PIXELFORMAT_IYUV: c_int = 1448433993;
pub const SDL_PIXELFORMAT_YUY2: c_int = 844715353;
pub const SDL_PIXELFORMAT_UYVY: c_int = 1498831189;
pub const SDL_PIXELFORMAT_YVYU: c_int = 1431918169;
pub const SDL_PIXELFORMAT_NV12: c_int = 842094158;
pub const SDL_PIXELFORMAT_NV21: c_int = 825382478;
pub const SDL_PIXELFORMAT_I444: c_int = 875836489;
pub const SDL_PIXELFORMAT_P010: c_int = 808530000;
pub const SDL_PIXELFORMAT_I0FL: c_int = 1279668297;
pub const SDL_PIXELFORMAT_I4FL: c_int = 1279669321;
pub const SDL_PIXELFORMAT_EXTERNAL_OES: c_int = 542328143;
pub const SDL_PIXELFORMAT_MJPG: c_int = 1196444237;
pub const enum_SDL_PixelFormat = c_uint;
pub const SDL_PixelFormat = enum_SDL_PixelFormat;
pub const SDL_COLOR_RANGE_UNKNOWN: c_int = 0;
pub const SDL_COLOR_RANGE_LIMITED: c_int = 1;
pub const SDL_COLOR_RANGE_FULL: c_int = 2;
pub const enum_SDL_ColorRange = c_uint;
pub const SDL_ColorRange = enum_SDL_ColorRange;
pub const SDL_COLOR_PRIMARIES_BT709: c_int = 1;
pub const SDL_COLOR_PRIMARIES_BT601: c_int = 6;
pub const SDL_COLOR_PRIMARIES_SMPTE240: c_int = 7;
pub const SDL_COLOR_PRIMARIES_BT2020: c_int = 9;
pub const SDL_COLOR_PRIMARIES_SMPTE431: c_int = 11;
pub const SDL_COLOR_PRIMARIES_SMPTE432: c_int = 12;
pub const enum_SDL_ColorPrimaries = c_uint;
pub const SDL_ColorPrimaries = enum_SDL_ColorPrimaries;
pub const SDL_MATRIX_COEFFICIENTS_BT709: c_int = 1;
pub const SDL_MATRIX_COEFFICIENTS_UNSPECIFIED: c_int = 2;
pub const SDL_MATRIX_COEFFICIENTS_BT470BG: c_int = 5;
pub const SDL_MATRIX_COEFFICIENTS_BT601: c_int = 6;
pub const SDL_MATRIX_COEFFICIENTS_BT2020_NCL: c_int = 9;
pub const enum_SDL_MatrixCoefficients = c_uint;
pub const SDL_MatrixCoefficients = enum_SDL_MatrixCoefficients;
pub const SDL_COLORSPACE_SRGB: c_int = 301991328;
pub const SDL_COLORSPACE_SRGB_LINEAR: c_int = 301991168;
pub const SDL_COLORSPACE_HDR10: c_int = 301999616;
pub const SDL_COLORSPACE_RGB_DEFAULT: c_int = 301991328;
pub const SDL_COLORSPACE_YUV_DEFAULT: c_int = 554703046;
pub const enum_SDL_Colorspace = c_uint;
pub const SDL_Colorspace = enum_SDL_Colorspace;
pub const struct_SDL_Color = extern struct {
    r: Uint8 = 0,
    g: Uint8 = 0,
    b: Uint8 = 0,
    a: Uint8 = 0,
};
pub const SDL_Color = struct_SDL_Color;
pub const struct_SDL_Palette = extern struct {
    ncolors: c_int = 0,
    colors: [*c]SDL_Color = null,
    version: Uint32 = 0,
    refcount: c_int = 0,
};
pub const SDL_Palette = struct_SDL_Palette;
pub const struct_SDL_PixelFormatDetails = extern struct {
    format: SDL_PixelFormat = @import("std").mem.zeroes(SDL_PixelFormat),
    bits_per_pixel: Uint8 = 0,
    bytes_per_pixel: Uint8 = 0,
    padding: [2]Uint8 = @import("std").mem.zeroes([2]Uint8),
    Rmask: Uint32 = 0,
    Gmask: Uint32 = 0,
    Bmask: Uint32 = 0,
    Amask: Uint32 = 0,
    Rbits: Uint8 = 0,
    Gbits: Uint8 = 0,
    Bbits: Uint8 = 0,
    Abits: Uint8 = 0,
    Rshift: Uint8 = 0,
    Gshift: Uint8 = 0,
    Bshift: Uint8 = 0,
    Ashift: Uint8 = 0,
};
pub const SDL_PixelFormatDetails = struct_SDL_PixelFormatDetails;
pub const struct_SDL_Rect = extern struct {
    x: c_int = 0,
    y: c_int = 0,
    w: c_int = 0,
    h: c_int = 0,
};
pub const SDL_Rect = struct_SDL_Rect;
pub const SDL_SurfaceFlags = Uint32;
pub const SDL_SurfaceDataFlags = Uint32;
pub const SDL_Surface = struct_SDL_Surface;
pub const SDL_Blit = ?*const fn (src: [*c]struct_SDL_Surface, srcrect: [*c]const SDL_Rect, dst: [*c]struct_SDL_Surface, dstrect: [*c]const SDL_Rect) callconv(.c) bool;
pub const struct_SDL_BlitMap = extern struct {
    identity: c_int = 0,
    blit: SDL_Blit = null,
    data: ?*anyopaque = null,
    info: SDL_BlitInfo = @import("std").mem.zeroes(SDL_BlitInfo),
    dst_palette_version: Uint32 = 0,
    src_palette_version: Uint32 = 0,
};
pub const SDL_BlitMap = struct_SDL_BlitMap;
pub const struct_SDL_Surface = extern struct {
    flags: SDL_SurfaceFlags = 0,
    format: SDL_PixelFormat = @import("std").mem.zeroes(SDL_PixelFormat),
    w: c_int = 0,
    h: c_int = 0,
    pitch: c_int = 0,
    pixels: ?*anyopaque = null,
    refcount: c_int = 0,
    reserved: ?*anyopaque = null,
    internal_flags: SDL_SurfaceDataFlags = 0,
    props: SDL_PropertiesID = 0,
    fmt: [*c]const SDL_PixelFormatDetails = null,
    colorspace: SDL_Colorspace = @import("std").mem.zeroes(SDL_Colorspace),
    palette: [*c]SDL_Palette = null,
    num_images: c_int = 0,
    images: [*c][*c]SDL_Surface = null,
    locked: c_int = 0,
    clip_rect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    map: SDL_BlitMap = @import("std").mem.zeroes(SDL_BlitMap),
    saved_pixels: ?*anyopaque = null,
};
pub const struct_SDL_HashTable = opaque {
};
pub const SDL_HashTable = struct_SDL_HashTable;
pub const SDL_HashCallback = ?*const fn (userdata: ?*anyopaque, key: ?*const anyopaque) callconv(.c) Uint32;
pub const SDL_HashKeyMatchCallback = ?*const fn (userdata: ?*anyopaque, a: ?*const anyopaque, b: ?*const anyopaque) callconv(.c) bool;
pub const SDL_HashDestroyCallback = ?*const fn (userdata: ?*anyopaque, key: ?*const anyopaque, value: ?*const anyopaque) callconv(.c) void;
pub extern fn SDL_CreateHashTable(estimated_capacity: c_int, threadsafe: bool, hash: SDL_HashCallback, keymatch: SDL_HashKeyMatchCallback, destroy: SDL_HashDestroyCallback, userdata: ?*anyopaque) ?*SDL_HashTable;
pub extern fn SDL_DestroyHashTable(table: ?*SDL_HashTable) void;
pub extern fn SDL_InsertIntoHashTable(table: ?*SDL_HashTable, key: ?*const anyopaque, value: ?*const anyopaque, replace: bool) bool;
pub extern fn SDL_FindInHashTable(table: ?*const SDL_HashTable, key: ?*const anyopaque, value: [*c]?*const anyopaque) bool;
pub extern fn SDL_HashID(unused: ?*anyopaque, key: ?*const anyopaque) Uint32;
pub extern fn SDL_KeyMatchID(unused: ?*anyopaque, a: ?*const anyopaque, b: ?*const anyopaque) bool;
pub extern fn SDL_DestroyHashValue(unused: ?*anyopaque, key: ?*const anyopaque, value: ?*const anyopaque) void;
pub const SDL_BlitInfo = extern struct {
    src_surface: [*c]SDL_Surface = null,
    src: [*c]Uint8 = null,
    src_w: c_int = 0,
    src_h: c_int = 0,
    src_pitch: c_int = 0,
    src_skip: c_int = 0,
    leading_skip: c_int = 0,
    dst_surface: [*c]SDL_Surface = null,
    dst: [*c]Uint8 = null,
    dst_w: c_int = 0,
    dst_h: c_int = 0,
    dst_pitch: c_int = 0,
    dst_skip: c_int = 0,
    src_fmt: [*c]const SDL_PixelFormatDetails = null,
    src_pal: [*c]const SDL_Palette = null,
    dst_fmt: [*c]const SDL_PixelFormatDetails = null,
    dst_pal: [*c]const SDL_Palette = null,
    table: [*c]Uint8 = null,
    palette_map: ?*SDL_HashTable = null,
    flags: c_int = 0,
    colorkey: Uint32 = 0,
    r: Uint8 = 0,
    g: Uint8 = 0,
    b: Uint8 = 0,
    a: Uint8 = 0,
};
pub extern fn SDL_CalculateBlit(surface: [*c]SDL_Surface, dst: [*c]SDL_Surface) bool;
pub extern fn SDL_UnRLESurface(surface: [*c]SDL_Surface) void;
pub const lookup_0: [1]Uint8 = [1]Uint8{
    255,
};
pub const lookup_1: [2]Uint8 = [2]Uint8{
    0,
    255,
};
pub const lookup_2: [4]Uint8 = [4]Uint8{
    0,
    85,
    170,
    255,
};
pub const lookup_3: [8]Uint8 = [8]Uint8{
    0,
    36,
    73,
    109,
    146,
    182,
    219,
    255,
};
pub const lookup_4: [16]Uint8 = [16]Uint8{
    0,
    17,
    34,
    51,
    68,
    85,
    102,
    119,
    136,
    153,
    170,
    187,
    204,
    221,
    238,
    255,
};
pub const lookup_5: [32]Uint8 = [32]Uint8{
    0,
    8,
    16,
    24,
    33,
    41,
    49,
    57,
    66,
    74,
    82,
    90,
    99,
    107,
    115,
    123,
    132,
    140,
    148,
    156,
    165,
    173,
    181,
    189,
    198,
    206,
    214,
    222,
    231,
    239,
    247,
    255,
};
pub const lookup_6: [64]Uint8 = [64]Uint8{
    0,
    4,
    8,
    12,
    16,
    20,
    24,
    28,
    32,
    36,
    40,
    44,
    48,
    52,
    56,
    60,
    65,
    69,
    73,
    77,
    81,
    85,
    89,
    93,
    97,
    101,
    105,
    109,
    113,
    117,
    121,
    125,
    130,
    134,
    138,
    142,
    146,
    150,
    154,
    158,
    162,
    166,
    170,
    174,
    178,
    182,
    186,
    190,
    195,
    199,
    203,
    207,
    211,
    215,
    219,
    223,
    227,
    231,
    235,
    239,
    243,
    247,
    251,
    255,
};
pub const lookup_7: [128]Uint8 = [128]Uint8{
    0,
    2,
    4,
    6,
    8,
    10,
    12,
    14,
    16,
    18,
    20,
    22,
    24,
    26,
    28,
    30,
    32,
    34,
    36,
    38,
    40,
    42,
    44,
    46,
    48,
    50,
    52,
    54,
    56,
    58,
    60,
    62,
    64,
    66,
    68,
    70,
    72,
    74,
    76,
    78,
    80,
    82,
    84,
    86,
    88,
    90,
    92,
    94,
    96,
    98,
    100,
    102,
    104,
    106,
    108,
    110,
    112,
    114,
    116,
    118,
    120,
    122,
    124,
    126,
    129,
    131,
    133,
    135,
    137,
    139,
    141,
    143,
    145,
    147,
    149,
    151,
    153,
    155,
    157,
    159,
    161,
    163,
    165,
    167,
    169,
    171,
    173,
    175,
    177,
    179,
    181,
    183,
    185,
    187,
    189,
    191,
    193,
    195,
    197,
    199,
    201,
    203,
    205,
    207,
    209,
    211,
    213,
    215,
    217,
    219,
    221,
    223,
    225,
    227,
    229,
    231,
    233,
    235,
    237,
    239,
    241,
    243,
    245,
    247,
    249,
    251,
    253,
    255,
};
pub const lookup_8: [256]Uint8 = [256]Uint8{
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
};
pub export var SDL_expand_byte: [9][*c]const Uint8 = [9][*c]const Uint8{
    @ptrCast(@alignCast(&lookup_0)),
    @ptrCast(@alignCast(&lookup_1)),
    @ptrCast(@alignCast(&lookup_2)),
    @ptrCast(@alignCast(&lookup_3)),
    @ptrCast(@alignCast(&lookup_4)),
    @ptrCast(@alignCast(&lookup_5)),
    @ptrCast(@alignCast(&lookup_6)),
    @ptrCast(@alignCast(&lookup_7)),
    @ptrCast(@alignCast(&lookup_8)),
};
pub export const SDL_expand_byte_10: [256]Uint16 = [256]Uint16{
    0,
    4,
    8,
    12,
    16,
    20,
    24,
    28,
    32,
    36,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76,
    80,
    84,
    88,
    92,
    96,
    100,
    104,
    108,
    112,
    116,
    120,
    124,
    128,
    132,
    136,
    140,
    144,
    148,
    152,
    156,
    160,
    164,
    168,
    173,
    177,
    181,
    185,
    189,
    193,
    197,
    201,
    205,
    209,
    213,
    217,
    221,
    225,
    229,
    233,
    237,
    241,
    245,
    249,
    253,
    257,
    261,
    265,
    269,
    273,
    277,
    281,
    285,
    289,
    293,
    297,
    301,
    305,
    309,
    313,
    317,
    321,
    325,
    329,
    333,
    337,
    341,
    345,
    349,
    353,
    357,
    361,
    365,
    369,
    373,
    377,
    381,
    385,
    389,
    393,
    397,
    401,
    405,
    409,
    413,
    417,
    421,
    425,
    429,
    433,
    437,
    441,
    445,
    449,
    453,
    457,
    461,
    465,
    469,
    473,
    477,
    481,
    485,
    489,
    493,
    497,
    501,
    505,
    509,
    514,
    518,
    522,
    526,
    530,
    534,
    538,
    542,
    546,
    550,
    554,
    558,
    562,
    566,
    570,
    574,
    578,
    582,
    586,
    590,
    594,
    598,
    602,
    606,
    610,
    614,
    618,
    622,
    626,
    630,
    634,
    638,
    642,
    646,
    650,
    654,
    658,
    662,
    666,
    670,
    674,
    678,
    682,
    686,
    690,
    694,
    698,
    702,
    706,
    710,
    714,
    718,
    722,
    726,
    730,
    734,
    738,
    742,
    746,
    750,
    754,
    758,
    762,
    766,
    770,
    774,
    778,
    782,
    786,
    790,
    794,
    798,
    802,
    806,
    810,
    814,
    818,
    822,
    826,
    830,
    834,
    838,
    842,
    846,
    850,
    855,
    859,
    863,
    867,
    871,
    875,
    879,
    883,
    887,
    891,
    895,
    899,
    903,
    907,
    911,
    915,
    919,
    923,
    927,
    931,
    935,
    939,
    943,
    947,
    951,
    955,
    959,
    963,
    967,
    971,
    975,
    979,
    983,
    987,
    991,
    995,
    999,
    1003,
    1007,
    1011,
    1015,
    1019,
    1023,
};
comptime {
    if (!((@sizeOf(@TypeOf(SDL_expand_byte_10)) / @sizeOf(@TypeOf(SDL_expand_byte_10[@as(c_int, 0)]))) == @as(c_ulong, @bitCast(@as(c_long, @as(c_int, 1) << @intCast(@as(c_int, 8))))))) @compileError("static assertion failed \"SDL_arraysize(SDL_expand_byte_10) == (1 << 8)\"");
}
pub export fn SDL_GetPixelFormatName_REAL(format: SDL_PixelFormat) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_INDEX1LSB) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_INDEX1MSB) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_INDEX2LSB) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_INDEX2MSB) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_INDEX4LSB) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_INDEX4MSB) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_INDEX8) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGB332) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_XRGB4444) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_XBGR4444) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_XRGB1555) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_XBGR1555) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ARGB4444) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBA4444) => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ABGR4444) => {
                        sdl_pc = 16;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRA4444) => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ARGB1555) => {
                        sdl_pc = 18;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBA5551) => {
                        sdl_pc = 19;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ABGR1555) => {
                        sdl_pc = 20;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRA5551) => {
                        sdl_pc = 21;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGB565) => {
                        sdl_pc = 22;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGR565) => {
                        sdl_pc = 23;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGB24) => {
                        sdl_pc = 24;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGR24) => {
                        sdl_pc = 25;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_XRGB8888) => {
                        sdl_pc = 26;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBX8888) => {
                        sdl_pc = 27;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_XBGR8888) => {
                        sdl_pc = 28;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRX8888) => {
                        sdl_pc = 29;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ARGB8888) => {
                        sdl_pc = 30;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBA8888) => {
                        sdl_pc = 31;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ABGR8888) => {
                        sdl_pc = 32;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRA8888) => {
                        sdl_pc = 33;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_XRGB2101010) => {
                        sdl_pc = 34;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_XBGR2101010) => {
                        sdl_pc = 35;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ARGB2101010) => {
                        sdl_pc = 36;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ABGR2101010) => {
                        sdl_pc = 37;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGB48) => {
                        sdl_pc = 38;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGR48) => {
                        sdl_pc = 39;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBA64) => {
                        sdl_pc = 40;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ARGB64) => {
                        sdl_pc = 41;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRA64) => {
                        sdl_pc = 42;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ABGR64) => {
                        sdl_pc = 43;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGB48_FLOAT) => {
                        sdl_pc = 44;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGR48_FLOAT) => {
                        sdl_pc = 45;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBA64_FLOAT) => {
                        sdl_pc = 46;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ARGB64_FLOAT) => {
                        sdl_pc = 47;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRA64_FLOAT) => {
                        sdl_pc = 48;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ABGR64_FLOAT) => {
                        sdl_pc = 49;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGB96_FLOAT) => {
                        sdl_pc = 50;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGR96_FLOAT) => {
                        sdl_pc = 51;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBA128_FLOAT) => {
                        sdl_pc = 52;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ARGB128_FLOAT) => {
                        sdl_pc = 53;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRA128_FLOAT) => {
                        sdl_pc = 54;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ABGR128_FLOAT) => {
                        sdl_pc = 55;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YV12) => {
                        sdl_pc = 56;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_IYUV) => {
                        sdl_pc = 57;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2) => {
                        sdl_pc = 58;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY) => {
                        sdl_pc = 59;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU) => {
                        sdl_pc = 60;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV12) => {
                        sdl_pc = 61;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV21) => {
                        sdl_pc = 62;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010) => {
                        sdl_pc = 63;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_I444) => {
                        sdl_pc = 64;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL) => {
                        sdl_pc = 65;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL) => {
                        sdl_pc = 66;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_EXTERNAL_OES) => {
                        sdl_pc = 67;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_MJPG) => {
                        sdl_pc = 68;
                        continue;
                    },
                    else => {
                        sdl_pc = 69;
                        continue;
                    },
                }
            },
            1 => {
                return undefined;
            },
            2 => {
                return "SDL_PIXELFORMAT_INDEX1LSB";
            },
            3 => {
                return "SDL_PIXELFORMAT_INDEX1MSB";
            },
            4 => {
                return "SDL_PIXELFORMAT_INDEX2LSB";
            },
            5 => {
                return "SDL_PIXELFORMAT_INDEX2MSB";
            },
            6 => {
                return "SDL_PIXELFORMAT_INDEX4LSB";
            },
            7 => {
                return "SDL_PIXELFORMAT_INDEX4MSB";
            },
            8 => {
                return "SDL_PIXELFORMAT_INDEX8";
            },
            9 => {
                return "SDL_PIXELFORMAT_RGB332";
            },
            10 => {
                return "SDL_PIXELFORMAT_XRGB4444";
            },
            11 => {
                return "SDL_PIXELFORMAT_XBGR4444";
            },
            12 => {
                return "SDL_PIXELFORMAT_XRGB1555";
            },
            13 => {
                return "SDL_PIXELFORMAT_XBGR1555";
            },
            14 => {
                return "SDL_PIXELFORMAT_ARGB4444";
            },
            15 => {
                return "SDL_PIXELFORMAT_RGBA4444";
            },
            16 => {
                return "SDL_PIXELFORMAT_ABGR4444";
            },
            17 => {
                return "SDL_PIXELFORMAT_BGRA4444";
            },
            18 => {
                return "SDL_PIXELFORMAT_ARGB1555";
            },
            19 => {
                return "SDL_PIXELFORMAT_RGBA5551";
            },
            20 => {
                return "SDL_PIXELFORMAT_ABGR1555";
            },
            21 => {
                return "SDL_PIXELFORMAT_BGRA5551";
            },
            22 => {
                return "SDL_PIXELFORMAT_RGB565";
            },
            23 => {
                return "SDL_PIXELFORMAT_BGR565";
            },
            24 => {
                return "SDL_PIXELFORMAT_RGB24";
            },
            25 => {
                return "SDL_PIXELFORMAT_BGR24";
            },
            26 => {
                return "SDL_PIXELFORMAT_XRGB8888";
            },
            27 => {
                return "SDL_PIXELFORMAT_RGBX8888";
            },
            28 => {
                return "SDL_PIXELFORMAT_XBGR8888";
            },
            29 => {
                return "SDL_PIXELFORMAT_BGRX8888";
            },
            30 => {
                return "SDL_PIXELFORMAT_ARGB8888";
            },
            31 => {
                return "SDL_PIXELFORMAT_RGBA8888";
            },
            32 => {
                return "SDL_PIXELFORMAT_ABGR8888";
            },
            33 => {
                return "SDL_PIXELFORMAT_BGRA8888";
            },
            34 => {
                return "SDL_PIXELFORMAT_XRGB2101010";
            },
            35 => {
                return "SDL_PIXELFORMAT_XBGR2101010";
            },
            36 => {
                return "SDL_PIXELFORMAT_ARGB2101010";
            },
            37 => {
                return "SDL_PIXELFORMAT_ABGR2101010";
            },
            38 => {
                return "SDL_PIXELFORMAT_RGB48";
            },
            39 => {
                return "SDL_PIXELFORMAT_BGR48";
            },
            40 => {
                return "SDL_PIXELFORMAT_RGBA64";
            },
            41 => {
                return "SDL_PIXELFORMAT_ARGB64";
            },
            42 => {
                return "SDL_PIXELFORMAT_BGRA64";
            },
            43 => {
                return "SDL_PIXELFORMAT_ABGR64";
            },
            44 => {
                return "SDL_PIXELFORMAT_RGB48_FLOAT";
            },
            45 => {
                return "SDL_PIXELFORMAT_BGR48_FLOAT";
            },
            46 => {
                return "SDL_PIXELFORMAT_RGBA64_FLOAT";
            },
            47 => {
                return "SDL_PIXELFORMAT_ARGB64_FLOAT";
            },
            48 => {
                return "SDL_PIXELFORMAT_BGRA64_FLOAT";
            },
            49 => {
                return "SDL_PIXELFORMAT_ABGR64_FLOAT";
            },
            50 => {
                return "SDL_PIXELFORMAT_RGB96_FLOAT";
            },
            51 => {
                return "SDL_PIXELFORMAT_BGR96_FLOAT";
            },
            52 => {
                return "SDL_PIXELFORMAT_RGBA128_FLOAT";
            },
            53 => {
                return "SDL_PIXELFORMAT_ARGB128_FLOAT";
            },
            54 => {
                return "SDL_PIXELFORMAT_BGRA128_FLOAT";
            },
            55 => {
                return "SDL_PIXELFORMAT_ABGR128_FLOAT";
            },
            56 => {
                return "SDL_PIXELFORMAT_YV12";
            },
            57 => {
                return "SDL_PIXELFORMAT_IYUV";
            },
            58 => {
                return "SDL_PIXELFORMAT_YUY2";
            },
            59 => {
                return "SDL_PIXELFORMAT_UYVY";
            },
            60 => {
                return "SDL_PIXELFORMAT_YVYU";
            },
            61 => {
                return "SDL_PIXELFORMAT_NV12";
            },
            62 => {
                return "SDL_PIXELFORMAT_NV21";
            },
            63 => {
                return "SDL_PIXELFORMAT_P010";
            },
            64 => {
                return "SDL_PIXELFORMAT_I444";
            },
            65 => {
                return "SDL_PIXELFORMAT_I0FL";
            },
            66 => {
                return "SDL_PIXELFORMAT_I4FL";
            },
            67 => {
                return "SDL_PIXELFORMAT_EXTERNAL_OES";
            },
            68 => {
                return "SDL_PIXELFORMAT_MJPG";
            },
            69 => {
                return "SDL_PIXELFORMAT_UNKNOWN";
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_GetMasksForPixelFormat_REAL(format: SDL_PixelFormat, bpp: [*c]c_int, Rmask: [*c]Uint32, Gmask: [*c]Uint32, Bmask: [*c]Uint32, Amask: [*c]Uint32) bool {
    @setEvalBranchQuota(100000);
    var masks: [4]Uint32 = undefined;
    _ = &masks;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if ((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                Rmask.* = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = blk_2: {
                            const tmp_3 = @as(Uint32, 0);
                            Amask.* = tmp_3;
                            break :blk_2 tmp_3;
                        };
                        Bmask.* = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    Gmask.* = tmp;
                    break :blk tmp;
                };
                switch (format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU) => {
                        sdl_pc = 7;
                        continue;
                    },
                    else => {
                        sdl_pc = 8;
                        continue;
                    },
                }
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                if ((if ((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255)))) <= @as(c_int, 2)) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
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
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                bpp.* = 32;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            8 => {
                bpp.* = 0;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            9 => {
                bpp.* = if ((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) @as(c_int, 0) else @as(c_int, @bitCast((format >> @intCast(@as(SDL_PixelFormat, 8))) & @as(SDL_PixelFormat, 255)));
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                bpp.* = (if ((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255)))) * @as(c_int, 8);
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                Rmask.* = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = blk_2: {
                            const tmp_3 = @as(Uint32, 0);
                            Amask.* = tmp_3;
                            break :blk_2 tmp_3;
                        };
                        Bmask.* = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    Gmask.* = tmp;
                    break :blk tmp;
                };
                if (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU8)) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            12 => {
                switch (if ((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255)))) {
                    @as(c_int, 3) => {
                        sdl_pc = 16;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 21;
                        continue;
                    },
                    else => {
                        sdl_pc = 28;
                        continue;
                    },
                }
            },
            13 => {
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            14 => {
                if (((((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED8)) and (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED16))) and (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32))) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            15 => {
                return SDL_SetError_REAL("Unknown pixel format");
            },
            16 => {
                switch ((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) {
                    @as(SDL_PixelFormat, SDL_ARRAYORDER_RGB) => {
                        sdl_pc = 18;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_ARRAYORDER_BGR) => {
                        sdl_pc = 19;
                        continue;
                    },
                    else => {
                        sdl_pc = 20;
                        continue;
                    },
                }
            },
            17 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            18 => {
                Rmask.* = 255;
                Gmask.* = 65280;
                Bmask.* = 16711680;
                return @"true" != 0;
            },
            19 => {
                Rmask.* = 16711680;
                Gmask.* = 65280;
                Bmask.* = 255;
                return @"true" != 0;
            },
            20 => {
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            21 => {
                switch ((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) {
                    @as(SDL_PixelFormat, SDL_ARRAYORDER_RGBA) => {
                        sdl_pc = 23;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_ARRAYORDER_ARGB) => {
                        sdl_pc = 24;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_ARRAYORDER_BGRA) => {
                        sdl_pc = 25;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_ARRAYORDER_ABGR) => {
                        sdl_pc = 26;
                        continue;
                    },
                    else => {
                        sdl_pc = 27;
                        continue;
                    },
                }
            },
            22 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            23 => {
                Rmask.* = 255;
                Gmask.* = 65280;
                Bmask.* = 16711680;
                Amask.* = 4278190080;
                return @"true" != 0;
            },
            24 => {
                Rmask.* = 65280;
                Gmask.* = 16711680;
                Bmask.* = 4278190080;
                Amask.* = 255;
                return @"true" != 0;
            },
            25 => {
                Rmask.* = 16711680;
                Gmask.* = 65280;
                Bmask.* = 255;
                Amask.* = 4278190080;
                return @"true" != 0;
            },
            26 => {
                Rmask.* = 4278190080;
                Gmask.* = 16711680;
                Bmask.* = 65280;
                Amask.* = 255;
                return @"true" != 0;
            },
            27 => {
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            28 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            29 => {
                return @"true" != 0;
            },
            30 => {
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            31 => {
                switch ((format >> @intCast(@as(SDL_PixelFormat, 16))) & @as(SDL_PixelFormat, 15)) {
                    @as(SDL_PixelFormat, SDL_PACKEDLAYOUT_332) => {
                        sdl_pc = 33;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PACKEDLAYOUT_4444) => {
                        sdl_pc = 34;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PACKEDLAYOUT_1555) => {
                        sdl_pc = 35;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PACKEDLAYOUT_5551) => {
                        sdl_pc = 36;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PACKEDLAYOUT_565) => {
                        sdl_pc = 37;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PACKEDLAYOUT_8888) => {
                        sdl_pc = 38;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PACKEDLAYOUT_2101010) => {
                        sdl_pc = 39;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PACKEDLAYOUT_1010102) => {
                        sdl_pc = 40;
                        continue;
                    },
                    else => {
                        sdl_pc = 41;
                        continue;
                    },
                }
            },
            32 => {
                switch ((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) {
                    @as(SDL_PixelFormat, SDL_PACKEDORDER_XRGB) => {
                        sdl_pc = 43;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PACKEDORDER_RGBX) => {
                        sdl_pc = 44;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PACKEDORDER_ARGB) => {
                        sdl_pc = 45;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PACKEDORDER_RGBA) => {
                        sdl_pc = 46;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PACKEDORDER_XBGR) => {
                        sdl_pc = 47;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PACKEDORDER_BGRX) => {
                        sdl_pc = 48;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PACKEDORDER_BGRA) => {
                        sdl_pc = 49;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PACKEDORDER_ABGR) => {
                        sdl_pc = 50;
                        continue;
                    },
                    else => {
                        sdl_pc = 51;
                        continue;
                    },
                }
            },
            33 => {
                masks[@as(c_int, 0)] = 0;
                masks[@as(c_int, 1)] = 224;
                masks[@as(c_int, 2)] = 28;
                masks[@as(c_int, 3)] = 3;
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            34 => {
                masks[@as(c_int, 0)] = 61440;
                masks[@as(c_int, 1)] = 3840;
                masks[@as(c_int, 2)] = 240;
                masks[@as(c_int, 3)] = 15;
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            35 => {
                masks[@as(c_int, 0)] = 32768;
                masks[@as(c_int, 1)] = 31744;
                masks[@as(c_int, 2)] = 992;
                masks[@as(c_int, 3)] = 31;
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            36 => {
                masks[@as(c_int, 0)] = 63488;
                masks[@as(c_int, 1)] = 1984;
                masks[@as(c_int, 2)] = 62;
                masks[@as(c_int, 3)] = 1;
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            37 => {
                masks[@as(c_int, 0)] = 0;
                masks[@as(c_int, 1)] = 63488;
                masks[@as(c_int, 2)] = 2016;
                masks[@as(c_int, 3)] = 31;
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            38 => {
                masks[@as(c_int, 0)] = 4278190080;
                masks[@as(c_int, 1)] = 16711680;
                masks[@as(c_int, 2)] = 65280;
                masks[@as(c_int, 3)] = 255;
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            39 => {
                masks[@as(c_int, 0)] = 3221225472;
                masks[@as(c_int, 1)] = 1072693248;
                masks[@as(c_int, 2)] = 1047552;
                masks[@as(c_int, 3)] = 1023;
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            40 => {
                masks[@as(c_int, 0)] = 4290772992;
                masks[@as(c_int, 1)] = 4190208;
                masks[@as(c_int, 2)] = 4092;
                masks[@as(c_int, 3)] = 3;
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            41 => {
                return SDL_SetError_REAL("Unknown pixel format");
            },
            42 => {
                return @"true" != 0;
            },
            43 => {
                Rmask.* = masks[@as(c_int, 1)];
                Gmask.* = masks[@as(c_int, 2)];
                Bmask.* = masks[@as(c_int, 3)];
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            44 => {
                Rmask.* = masks[@as(c_int, 0)];
                Gmask.* = masks[@as(c_int, 1)];
                Bmask.* = masks[@as(c_int, 2)];
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            45 => {
                Amask.* = masks[@as(c_int, 0)];
                Rmask.* = masks[@as(c_int, 1)];
                Gmask.* = masks[@as(c_int, 2)];
                Bmask.* = masks[@as(c_int, 3)];
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            46 => {
                Rmask.* = masks[@as(c_int, 0)];
                Gmask.* = masks[@as(c_int, 1)];
                Bmask.* = masks[@as(c_int, 2)];
                Amask.* = masks[@as(c_int, 3)];
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            47 => {
                Bmask.* = masks[@as(c_int, 1)];
                Gmask.* = masks[@as(c_int, 2)];
                Rmask.* = masks[@as(c_int, 3)];
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            48 => {
                Bmask.* = masks[@as(c_int, 0)];
                Gmask.* = masks[@as(c_int, 1)];
                Rmask.* = masks[@as(c_int, 2)];
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            49 => {
                Bmask.* = masks[@as(c_int, 0)];
                Gmask.* = masks[@as(c_int, 1)];
                Rmask.* = masks[@as(c_int, 2)];
                Amask.* = masks[@as(c_int, 3)];
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            50 => {
                Amask.* = masks[@as(c_int, 0)];
                Bmask.* = masks[@as(c_int, 1)];
                Gmask.* = masks[@as(c_int, 2)];
                Rmask.* = masks[@as(c_int, 3)];
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            51 => {
                return SDL_SetError_REAL("Unknown pixel format");
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_GetPixelFormatForMasks_REAL(bpp: c_int, Rmask: Uint32, Gmask: Uint32, Bmask: Uint32, Amask: Uint32) SDL_PixelFormat {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (bpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(c_int, 8) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(c_int, 12) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(c_int, 15) => {
                        sdl_pc = 19;
                        continue;
                    },
                    @as(c_int, 16) => {
                        sdl_pc = 23;
                        continue;
                    },
                    @as(c_int, 24) => {
                        sdl_pc = 66;
                        continue;
                    },
                    @as(c_int, 30) => {
                        sdl_pc = 71;
                        continue;
                    },
                    @as(c_int, 32) => {
                        sdl_pc = 78;
                        continue;
                    },
                    else => {
                        sdl_pc = 1;
                        continue;
                    },
                }
            },
            1 => {
                return SDL_PIXELFORMAT_UNKNOWN;
            },
            2 => {
                return SDL_PIXELFORMAT_INDEX1MSB;
            },
            3 => {
                return SDL_PIXELFORMAT_INDEX2MSB;
            },
            4 => {
                return SDL_PIXELFORMAT_INDEX4MSB;
            },
            5 => {
                if ((((Rmask == @as(Uint32, 224)) and (Gmask == @as(Uint32, 28))) and (Bmask == @as(Uint32, 3))) and (Amask == @as(Uint32, 0))) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 7;
                    continue;
                }
            },
            6 => {
                return SDL_PIXELFORMAT_RGB332;
            },
            7 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            8 => {
                return SDL_PIXELFORMAT_INDEX8;
            },
            9 => {
                if (Rmask == @as(Uint32, 0)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                return SDL_PIXELFORMAT_XRGB4444;
            },
            11 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                if ((((Rmask == @as(Uint32, 3840)) and (Gmask == @as(Uint32, 240))) and (Bmask == @as(Uint32, 15))) and (Amask == @as(Uint32, 0))) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            13 => {
                return SDL_PIXELFORMAT_XRGB4444;
            },
            14 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                if ((((Rmask == @as(Uint32, 15)) and (Gmask == @as(Uint32, 240))) and (Bmask == @as(Uint32, 3840))) and (Amask == @as(Uint32, 0))) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            16 => {
                return SDL_PIXELFORMAT_XBGR4444;
            },
            17 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            18 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            19 => {
                if (Rmask == @as(Uint32, 0)) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                return SDL_PIXELFORMAT_XRGB1555;
            },
            21 => {
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            22 => {
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            23 => {
                if (Rmask == @as(Uint32, 0)) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            24 => {
                return SDL_PIXELFORMAT_RGB565;
            },
            25 => {
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            26 => {
                if ((((Rmask == @as(Uint32, 31744)) and (Gmask == @as(Uint32, 992))) and (Bmask == @as(Uint32, 31))) and (Amask == @as(Uint32, 0))) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            27 => {
                return SDL_PIXELFORMAT_XRGB1555;
            },
            28 => {
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            29 => {
                if ((((Rmask == @as(Uint32, 31)) and (Gmask == @as(Uint32, 992))) and (Bmask == @as(Uint32, 31744))) and (Amask == @as(Uint32, 0))) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            30 => {
                return SDL_PIXELFORMAT_XBGR1555;
            },
            31 => {
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            32 => {
                if ((((Rmask == @as(Uint32, 3840)) and (Gmask == @as(Uint32, 240))) and (Bmask == @as(Uint32, 15))) and (Amask == @as(Uint32, 61440))) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 34;
                    continue;
                }
            },
            33 => {
                return SDL_PIXELFORMAT_ARGB4444;
            },
            34 => {
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            35 => {
                if ((((Rmask == @as(Uint32, 61440)) and (Gmask == @as(Uint32, 3840))) and (Bmask == @as(Uint32, 240))) and (Amask == @as(Uint32, 15))) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 37;
                    continue;
                }
            },
            36 => {
                return SDL_PIXELFORMAT_RGBA4444;
            },
            37 => {
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            38 => {
                if ((((Rmask == @as(Uint32, 15)) and (Gmask == @as(Uint32, 240))) and (Bmask == @as(Uint32, 3840))) and (Amask == @as(Uint32, 61440))) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 40;
                    continue;
                }
            },
            39 => {
                return SDL_PIXELFORMAT_ABGR4444;
            },
            40 => {
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            41 => {
                if ((((Rmask == @as(Uint32, 240)) and (Gmask == @as(Uint32, 3840))) and (Bmask == @as(Uint32, 61440))) and (Amask == @as(Uint32, 15))) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 43;
                    continue;
                }
            },
            42 => {
                return SDL_PIXELFORMAT_BGRA4444;
            },
            43 => {
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            44 => {
                if ((((Rmask == @as(Uint32, 31744)) and (Gmask == @as(Uint32, 992))) and (Bmask == @as(Uint32, 31))) and (Amask == @as(Uint32, 32768))) {
                    sdl_pc = 45;
                    continue;
                } else {
                    sdl_pc = 46;
                    continue;
                }
            },
            45 => {
                return SDL_PIXELFORMAT_ARGB1555;
            },
            46 => {
                {
                    sdl_pc = 47;
                    continue;
                }
            },
            47 => {
                if ((((Rmask == @as(Uint32, 63488)) and (Gmask == @as(Uint32, 1984))) and (Bmask == @as(Uint32, 62))) and (Amask == @as(Uint32, 1))) {
                    sdl_pc = 48;
                    continue;
                } else {
                    sdl_pc = 49;
                    continue;
                }
            },
            48 => {
                return SDL_PIXELFORMAT_RGBA5551;
            },
            49 => {
                {
                    sdl_pc = 50;
                    continue;
                }
            },
            50 => {
                if ((((Rmask == @as(Uint32, 31)) and (Gmask == @as(Uint32, 992))) and (Bmask == @as(Uint32, 31744))) and (Amask == @as(Uint32, 32768))) {
                    sdl_pc = 51;
                    continue;
                } else {
                    sdl_pc = 52;
                    continue;
                }
            },
            51 => {
                return SDL_PIXELFORMAT_ABGR1555;
            },
            52 => {
                {
                    sdl_pc = 53;
                    continue;
                }
            },
            53 => {
                if ((((Rmask == @as(Uint32, 62)) and (Gmask == @as(Uint32, 1984))) and (Bmask == @as(Uint32, 63488))) and (Amask == @as(Uint32, 1))) {
                    sdl_pc = 54;
                    continue;
                } else {
                    sdl_pc = 55;
                    continue;
                }
            },
            54 => {
                return SDL_PIXELFORMAT_BGRA5551;
            },
            55 => {
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            56 => {
                if ((((Rmask == @as(Uint32, 63488)) and (Gmask == @as(Uint32, 2016))) and (Bmask == @as(Uint32, 31))) and (Amask == @as(Uint32, 0))) {
                    sdl_pc = 57;
                    continue;
                } else {
                    sdl_pc = 58;
                    continue;
                }
            },
            57 => {
                return SDL_PIXELFORMAT_RGB565;
            },
            58 => {
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            59 => {
                if ((((Rmask == @as(Uint32, 31)) and (Gmask == @as(Uint32, 2016))) and (Bmask == @as(Uint32, 63488))) and (Amask == @as(Uint32, 0))) {
                    sdl_pc = 60;
                    continue;
                } else {
                    sdl_pc = 61;
                    continue;
                }
            },
            60 => {
                return SDL_PIXELFORMAT_BGR565;
            },
            61 => {
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            62 => {
                if ((((Rmask == @as(Uint32, 63)) and (Gmask == @as(Uint32, 1984))) and (Bmask == @as(Uint32, 63488))) and (Amask == @as(Uint32, 0))) {
                    sdl_pc = 63;
                    continue;
                } else {
                    sdl_pc = 64;
                    continue;
                }
            },
            63 => {
                return SDL_PIXELFORMAT_RGB565;
            },
            64 => {
                {
                    sdl_pc = 65;
                    continue;
                }
            },
            65 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            66 => {
                switch (Rmask) {
                    @as(Uint32, 0) => {
                        sdl_pc = 68;
                        continue;
                    },
                    @as(Uint32, 16711680) => {
                        sdl_pc = 69;
                        continue;
                    },
                    @as(Uint32, 255) => {
                        sdl_pc = 70;
                        continue;
                    },
                    else => {
                        sdl_pc = 67;
                        continue;
                    },
                }
            },
            67 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            68 => {
                {
                    sdl_pc = 69;
                    continue;
                }
            },
            69 => {
                return SDL_PIXELFORMAT_BGR24;
            },
            70 => {
                return SDL_PIXELFORMAT_RGB24;
            },
            71 => {
                if ((((Rmask == @as(Uint32, 1072693248)) and (Gmask == @as(Uint32, 1047552))) and (Bmask == @as(Uint32, 1023))) and (Amask == @as(Uint32, 0))) {
                    sdl_pc = 72;
                    continue;
                } else {
                    sdl_pc = 73;
                    continue;
                }
            },
            72 => {
                return SDL_PIXELFORMAT_XRGB2101010;
            },
            73 => {
                {
                    sdl_pc = 74;
                    continue;
                }
            },
            74 => {
                if ((((Rmask == @as(Uint32, 1023)) and (Gmask == @as(Uint32, 1047552))) and (Bmask == @as(Uint32, 1072693248))) and (Amask == @as(Uint32, 0))) {
                    sdl_pc = 75;
                    continue;
                } else {
                    sdl_pc = 76;
                    continue;
                }
            },
            75 => {
                return SDL_PIXELFORMAT_XBGR2101010;
            },
            76 => {
                {
                    sdl_pc = 77;
                    continue;
                }
            },
            77 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            78 => {
                if (Rmask == @as(Uint32, 0)) {
                    sdl_pc = 79;
                    continue;
                } else {
                    sdl_pc = 80;
                    continue;
                }
            },
            79 => {
                return SDL_PIXELFORMAT_XRGB8888;
            },
            80 => {
                {
                    sdl_pc = 81;
                    continue;
                }
            },
            81 => {
                if ((((Rmask == @as(Uint32, 16711680)) and (Gmask == @as(Uint32, 65280))) and (Bmask == @as(Uint32, 255))) and (Amask == @as(Uint32, 0))) {
                    sdl_pc = 82;
                    continue;
                } else {
                    sdl_pc = 83;
                    continue;
                }
            },
            82 => {
                return SDL_PIXELFORMAT_XRGB8888;
            },
            83 => {
                {
                    sdl_pc = 84;
                    continue;
                }
            },
            84 => {
                if ((((Rmask == @as(c_uint, 4278190080)) and (Gmask == @as(Uint32, 16711680))) and (Bmask == @as(Uint32, 65280))) and (Amask == @as(Uint32, 0))) {
                    sdl_pc = 85;
                    continue;
                } else {
                    sdl_pc = 86;
                    continue;
                }
            },
            85 => {
                return SDL_PIXELFORMAT_RGBX8888;
            },
            86 => {
                {
                    sdl_pc = 87;
                    continue;
                }
            },
            87 => {
                if ((((Rmask == @as(Uint32, 255)) and (Gmask == @as(Uint32, 65280))) and (Bmask == @as(Uint32, 16711680))) and (Amask == @as(Uint32, 0))) {
                    sdl_pc = 88;
                    continue;
                } else {
                    sdl_pc = 89;
                    continue;
                }
            },
            88 => {
                return SDL_PIXELFORMAT_XBGR8888;
            },
            89 => {
                {
                    sdl_pc = 90;
                    continue;
                }
            },
            90 => {
                if ((((Rmask == @as(Uint32, 65280)) and (Gmask == @as(Uint32, 16711680))) and (Bmask == @as(c_uint, 4278190080))) and (Amask == @as(Uint32, 0))) {
                    sdl_pc = 91;
                    continue;
                } else {
                    sdl_pc = 92;
                    continue;
                }
            },
            91 => {
                return SDL_PIXELFORMAT_BGRX8888;
            },
            92 => {
                {
                    sdl_pc = 93;
                    continue;
                }
            },
            93 => {
                if ((((Rmask == @as(Uint32, 16711680)) and (Gmask == @as(Uint32, 65280))) and (Bmask == @as(Uint32, 255))) and (Amask == @as(c_uint, 4278190080))) {
                    sdl_pc = 94;
                    continue;
                } else {
                    sdl_pc = 95;
                    continue;
                }
            },
            94 => {
                return SDL_PIXELFORMAT_ARGB8888;
            },
            95 => {
                {
                    sdl_pc = 96;
                    continue;
                }
            },
            96 => {
                if ((((Rmask == @as(c_uint, 4278190080)) and (Gmask == @as(Uint32, 16711680))) and (Bmask == @as(Uint32, 65280))) and (Amask == @as(Uint32, 255))) {
                    sdl_pc = 97;
                    continue;
                } else {
                    sdl_pc = 98;
                    continue;
                }
            },
            97 => {
                return SDL_PIXELFORMAT_RGBA8888;
            },
            98 => {
                {
                    sdl_pc = 99;
                    continue;
                }
            },
            99 => {
                if ((((Rmask == @as(Uint32, 255)) and (Gmask == @as(Uint32, 65280))) and (Bmask == @as(Uint32, 16711680))) and (Amask == @as(c_uint, 4278190080))) {
                    sdl_pc = 100;
                    continue;
                } else {
                    sdl_pc = 101;
                    continue;
                }
            },
            100 => {
                return SDL_PIXELFORMAT_ABGR8888;
            },
            101 => {
                {
                    sdl_pc = 102;
                    continue;
                }
            },
            102 => {
                if ((((Rmask == @as(Uint32, 65280)) and (Gmask == @as(Uint32, 16711680))) and (Bmask == @as(c_uint, 4278190080))) and (Amask == @as(Uint32, 255))) {
                    sdl_pc = 103;
                    continue;
                } else {
                    sdl_pc = 104;
                    continue;
                }
            },
            103 => {
                return SDL_PIXELFORMAT_BGRA8888;
            },
            104 => {
                {
                    sdl_pc = 105;
                    continue;
                }
            },
            105 => {
                if ((((Rmask == @as(Uint32, 1072693248)) and (Gmask == @as(Uint32, 1047552))) and (Bmask == @as(Uint32, 1023))) and (Amask == @as(Uint32, 0))) {
                    sdl_pc = 106;
                    continue;
                } else {
                    sdl_pc = 107;
                    continue;
                }
            },
            106 => {
                return SDL_PIXELFORMAT_XRGB2101010;
            },
            107 => {
                {
                    sdl_pc = 108;
                    continue;
                }
            },
            108 => {
                if ((((Rmask == @as(Uint32, 1023)) and (Gmask == @as(Uint32, 1047552))) and (Bmask == @as(Uint32, 1072693248))) and (Amask == @as(Uint32, 0))) {
                    sdl_pc = 109;
                    continue;
                } else {
                    sdl_pc = 110;
                    continue;
                }
            },
            109 => {
                return SDL_PIXELFORMAT_XBGR2101010;
            },
            110 => {
                {
                    sdl_pc = 111;
                    continue;
                }
            },
            111 => {
                if ((((Rmask == @as(Uint32, 1072693248)) and (Gmask == @as(Uint32, 1047552))) and (Bmask == @as(Uint32, 1023))) and (Amask == @as(c_uint, 3221225472))) {
                    sdl_pc = 112;
                    continue;
                } else {
                    sdl_pc = 113;
                    continue;
                }
            },
            112 => {
                return SDL_PIXELFORMAT_ARGB2101010;
            },
            113 => {
                {
                    sdl_pc = 114;
                    continue;
                }
            },
            114 => {
                if ((((Rmask == @as(Uint32, 1023)) and (Gmask == @as(Uint32, 1047552))) and (Bmask == @as(Uint32, 1072693248))) and (Amask == @as(c_uint, 3221225472))) {
                    sdl_pc = 115;
                    continue;
                } else {
                    sdl_pc = 116;
                    continue;
                }
            },
            115 => {
                return SDL_PIXELFORMAT_ABGR2101010;
            },
            116 => {
                {
                    sdl_pc = 117;
                    continue;
                }
            },
            117 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub var SDL_format_details_init: SDL_InitState = @import("std").mem.zeroes(SDL_InitState);
pub var SDL_format_details: ?*SDL_HashTable = null;
pub fn SDL_InitPixelFormatDetails(details: [*c]SDL_PixelFormatDetails, format: SDL_PixelFormat) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var bpp: c_int = undefined;
    _ = &bpp;
    var Rmask: Uint32 = undefined;
    _ = &Rmask;
    var Gmask: Uint32 = undefined;
    _ = &Gmask;
    var Bmask: Uint32 = undefined;
    _ = &Bmask;
    var Amask: Uint32 = undefined;
    _ = &Amask;
    var mask: Uint32 = undefined;
    _ = &mask;
    if (!SDL_GetMasksForPixelFormat_REAL(format, &bpp, &Rmask, &Gmask, &Bmask, &Amask)) {
        return @"false" != 0;
    }
    _ = memset(@ptrCast(@alignCast(details)), 0, @sizeOf(@TypeOf(details.*)));
    details.*.format = format;
    details.*.bits_per_pixel = @bitCast(@as(i8, @truncate(bpp)));
    details.*.bytes_per_pixel = @bitCast(@as(i8, @truncate(@divTrunc(bpp + @as(c_int, 7), @as(c_int, 8)))));
    details.*.Rmask = Rmask;
    details.*.Rshift = 0;
    details.*.Rbits = 0;
    if (Rmask != 0) {
        {
            mask = Rmask;
            while (!((mask & @as(Uint32, 1)) != 0)) : (mask >>= @intCast(@as(Uint32, 1))) {
                details.*.Rshift +%= 1;
            }
        }
        while ((mask & @as(Uint32, 1)) != 0) : (mask >>= @intCast(@as(Uint32, 1))) {
            details.*.Rbits +%= 1;
        }
    }
    details.*.Gmask = Gmask;
    details.*.Gshift = 0;
    details.*.Gbits = 0;
    if (Gmask != 0) {
        {
            mask = Gmask;
            while (!((mask & @as(Uint32, 1)) != 0)) : (mask >>= @intCast(@as(Uint32, 1))) {
                details.*.Gshift +%= 1;
            }
        }
        while ((mask & @as(Uint32, 1)) != 0) : (mask >>= @intCast(@as(Uint32, 1))) {
            details.*.Gbits +%= 1;
        }
    }
    details.*.Bmask = Bmask;
    details.*.Bshift = 0;
    details.*.Bbits = 0;
    if (Bmask != 0) {
        {
            mask = Bmask;
            while (!((mask & @as(Uint32, 1)) != 0)) : (mask >>= @intCast(@as(Uint32, 1))) {
                details.*.Bshift +%= 1;
            }
        }
        while ((mask & @as(Uint32, 1)) != 0) : (mask >>= @intCast(@as(Uint32, 1))) {
            details.*.Bbits +%= 1;
        }
    }
    details.*.Amask = Amask;
    details.*.Ashift = 0;
    details.*.Abits = 0;
    if (Amask != 0) {
        {
            mask = Amask;
            while (!((mask & @as(Uint32, 1)) != 0)) : (mask >>= @intCast(@as(Uint32, 1))) {
                details.*.Ashift +%= 1;
            }
        }
        while ((mask & @as(Uint32, 1)) != 0) : (mask >>= @intCast(@as(Uint32, 1))) {
            details.*.Abits +%= 1;
        }
    }
    return @"true" != 0;
}
pub export fn SDL_GetPixelFormatDetails_REAL(format: SDL_PixelFormat) [*c]const SDL_PixelFormatDetails {
    @setEvalBranchQuota(100000);
    var details: [*c]SDL_PixelFormatDetails = undefined;
    _ = &details;
    if (SDL_ShouldInit_REAL(&SDL_format_details_init)) {
        SDL_format_details = SDL_CreateHashTable(0, @"true" != 0, SDL_HashID, SDL_KeyMatchID, SDL_DestroyHashValue, null);
        if (!(SDL_format_details != null)) {
            SDL_SetInitialized_REAL(&SDL_format_details_init, @"false" != 0);
            return null;
        }
        SDL_SetInitialized_REAL(&SDL_format_details_init, @"true" != 0);
    }
    if (SDL_FindInHashTable(SDL_format_details, @ptrFromInt(@as(usize, format)), @ptrCast(@alignCast(&details)))) {
        return details;
    }
    details = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(@TypeOf(details.*)))));
    if (!(details != null)) {
        return null;
    }
    if (!SDL_InitPixelFormatDetails(details, format)) {
        SDL_free_REAL(@ptrCast(@alignCast(details)));
        return null;
    }
    if (!SDL_InsertIntoHashTable(SDL_format_details, @ptrFromInt(@as(usize, format)), @ptrCast(@alignCast(details)), @"false" != 0)) {
        SDL_free_REAL(@ptrCast(@alignCast(details)));
        if (SDL_FindInHashTable(SDL_format_details, @ptrFromInt(@as(usize, format)), @ptrCast(@alignCast(&details)))) {
            return details;
        }
        return null;
    }
    return details;
}
pub export fn SDL_QuitPixelFormatDetails() void {
    @setEvalBranchQuota(100000);
    if (SDL_ShouldQuit_REAL(&SDL_format_details_init)) {
        SDL_DestroyHashTable(SDL_format_details);
        SDL_format_details = null;
        SDL_SetInitialized_REAL(&SDL_format_details_init, @"false" != 0);
    }
}
pub export fn SDL_Get8888AlphaMaskAndShift(fmt: [*c]const SDL_PixelFormatDetails, mask: [*c]Uint32, shift: [*c]Uint32) void {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (fmt.*.Amask != 0) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                mask.* = fmt.*.Amask;
                shift.* = fmt.*.Ashift;
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            2 => {
                mask.* = ~((fmt.*.Rmask | fmt.*.Gmask) | fmt.*.Bmask);
                switch (mask.*) {
                    @as(Uint32, 255) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(Uint32, 65280) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(Uint32, 16711680) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(c_uint, 4278190080) => {
                        sdl_pc = 8;
                        continue;
                    },
                    else => {
                        sdl_pc = 9;
                        continue;
                    },
                }
            },
            3 => {
                {}
            },
            4 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            5 => {
                shift.* = 0;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            6 => {
                shift.* = 8;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            7 => {
                shift.* = 16;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            8 => {
                shift.* = 24;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            9 => {
                shift.* = 0;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_GetDefaultColorspaceForFormat(format: SDL_PixelFormat) SDL_Colorspace {
    @setEvalBranchQuota(100000);
    if ((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) {
        if (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_MJPG)) {
            return SDL_COLORSPACE_SRGB;
        } else if (((format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010)) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) {
            return SDL_COLORSPACE_HDR10;
        } else {
            return SDL_COLORSPACE_YUV_DEFAULT;
        }
    } else if (!((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF16)) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF32)))) {
        return SDL_COLORSPACE_SRGB_LINEAR;
    } else if (!((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)) and (((format >> @intCast(@as(SDL_PixelFormat, 16))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDLAYOUT_2101010)))) {
        return SDL_COLORSPACE_HDR10;
    } else {
        return SDL_COLORSPACE_RGB_DEFAULT;
    }
}
pub export fn SDL_sRGBtoLinear(arg_v: f32) f32 {
    @setEvalBranchQuota(100000);
    var v = arg_v;
    _ = &v;
    if (v <= @as(f32, 0.04045)) {
        v = v / @as(f32, 12.92);
    } else {
        v = SDL_powf_REAL((v + @as(f32, 0.055)) / @as(f32, 1.055), 2.4);
    }
    return v;
}
pub export fn SDL_sRGBfromLinear(arg_v: f32) f32 {
    @setEvalBranchQuota(100000);
    var v = arg_v;
    _ = &v;
    if (v <= @as(f32, 0.003131)) {
        v = v * @as(f32, 12.92);
    } else {
        v = (SDL_powf_REAL(v, @as(f32, 1.0) / @as(f32, 2.4)) * @as(f32, 1.055)) - @as(f32, 0.055);
    }
    return v;
}
pub export fn SDL_PQtoNits(v: f32) f32 {
    @setEvalBranchQuota(100000);
    const c1: f32 = 0.835938;
    _ = &c1;
    const c2: f32 = 18.851563;
    _ = &c2;
    const c3: f32 = 18.6875;
    _ = &c3;
    const oo_m1: f32 = @as(f32, 1.0) / @as(f32, 0.159302);
    _ = &oo_m1;
    const oo_m2: f32 = @as(f32, 1.0) / @as(f32, 78.84375);
    _ = &oo_m2;
    var num: f32 = if ((SDL_powf_REAL(v, oo_m2) - c1) > @as(f32, 0.0)) SDL_powf_REAL(v, oo_m2) - c1 else @as(f32, 0.0);
    _ = &num;
    var den: f32 = c2 - (c3 * SDL_powf_REAL(v, oo_m2));
    _ = &den;
    return @as(f32, 10000.0) * SDL_powf_REAL(num / den, oo_m1);
}
pub export fn SDL_PQfromNits(v: f32) f32 {
    @setEvalBranchQuota(100000);
    const c1: f32 = 0.835938;
    _ = &c1;
    const c2: f32 = 18.851563;
    _ = &c2;
    const c3: f32 = 18.6875;
    _ = &c3;
    const m1: f32 = 0.159302;
    _ = &m1;
    const m2: f32 = 78.84375;
    _ = &m2;
    var y: f32 = if ((v / @as(f32, 10000.0)) < @as(f32, 0.0)) @as(f32, 0.0) else if ((v / @as(f32, 10000.0)) > @as(f32, 1.0)) @as(f32, 1.0) else v / @as(f32, 10000.0);
    _ = &y;
    var num: f32 = c1 + (c2 * SDL_powf_REAL(y, m1));
    _ = &num;
    var den: f32 = @as(f32, 1.0) + (c3 * SDL_powf_REAL(y, m1));
    _ = &den;
    return SDL_powf_REAL(num / den, m2);
}
pub const mat_BT601_Limited_8bit: [16]f32 = [16]f32{
    -@as(f32, 0.062745),
    -@as(f32, 0.501961),
    -@as(f32, 0.501961),
    0.0,
    1.1644,
    0.0,
    1.596,
    0.0,
    1.1644,
    -@as(f32, 0.3918),
    -@as(f32, 0.813),
    0.0,
    1.1644,
    2.0172,
    0.0,
    0.0,
};
pub const mat_BT601_Full_8bit: [16]f32 = [16]f32{
    0.0,
    -@as(f32, 0.501961),
    -@as(f32, 0.501961),
    0.0,
    1.0,
    0.0,
    1.4075,
    0.0,
    1.0,
    -@as(f32, 0.3455),
    -@as(f32, 0.7169),
    0.0,
    1.0,
    1.779,
    0.0,
    0.0,
};
pub const mat_BT709_Limited_8bit: [16]f32 = [16]f32{
    -@as(f32, 0.062745),
    -@as(f32, 0.501961),
    -@as(f32, 0.501961),
    0.0,
    1.1644,
    0.0,
    1.7927,
    0.0,
    1.1644,
    -@as(f32, 0.2132),
    -@as(f32, 0.5329),
    0.0,
    1.1644,
    2.1124,
    0.0,
    0.0,
};
pub const mat_BT709_Full_8bit: [16]f32 = [16]f32{
    0.0,
    -@as(f32, 0.501961),
    -@as(f32, 0.501961),
    0.0,
    1.0,
    0.0,
    1.581,
    0.0,
    1.0,
    -@as(f32, 0.1881),
    -@as(f32, 0.47),
    0.0,
    1.0,
    1.8629,
    0.0,
    0.0,
};
pub const mat_BT2020_Limited_10bit: [16]f32 = [16]f32{
    -@as(f32, 0.062561),
    -@as(f32, 0.500489),
    -@as(f32, 0.500489),
    0.0,
    1.1678,
    0.0,
    1.6836,
    0.0,
    1.1678,
    -@as(f32, 0.1879),
    -@as(f32, 0.6523),
    0.0,
    1.1678,
    2.1481,
    0.0,
    0.0,
};
pub const mat_BT2020_Full_10bit: [16]f32 = [16]f32{
    0.0,
    -@as(f32, 0.500489),
    -@as(f32, 0.500489),
    0.0,
    1.0,
    0.0,
    1.476,
    0.0,
    1.0,
    -@as(f32, 0.1647),
    -@as(f32, 0.5719),
    0.0,
    1.0,
    1.8832,
    0.0,
    0.0,
};
pub fn SDL_GetBT601ConversionMatrix(colorspace: SDL_Colorspace) callconv(.c) [*c]const f32 {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (@as(SDL_ColorRange, (colorspace >> @intCast(@as(SDL_Colorspace, 24))) & @as(SDL_Colorspace, 15))) {
                    @as(SDL_ColorRange, SDL_COLOR_RANGE_LIMITED) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_ColorRange, SDL_COLOR_RANGE_UNKNOWN) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SDL_ColorRange, SDL_COLOR_RANGE_FULL) => {
                        sdl_pc = 4;
                        continue;
                    },
                    else => {
                        sdl_pc = 5;
                        continue;
                    },
                }
            },
            1 => {
                return null;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                return @ptrCast(@alignCast(&mat_BT601_Limited_8bit));
            },
            4 => {
                return @ptrCast(@alignCast(&mat_BT601_Full_8bit));
            },
            5 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn SDL_GetBT709ConversionMatrix(colorspace: SDL_Colorspace) callconv(.c) [*c]const f32 {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (@as(SDL_ColorRange, (colorspace >> @intCast(@as(SDL_Colorspace, 24))) & @as(SDL_Colorspace, 15))) {
                    @as(SDL_ColorRange, SDL_COLOR_RANGE_LIMITED) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_ColorRange, SDL_COLOR_RANGE_UNKNOWN) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SDL_ColorRange, SDL_COLOR_RANGE_FULL) => {
                        sdl_pc = 4;
                        continue;
                    },
                    else => {
                        sdl_pc = 5;
                        continue;
                    },
                }
            },
            1 => {
                return null;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                return @ptrCast(@alignCast(&mat_BT709_Limited_8bit));
            },
            4 => {
                return @ptrCast(@alignCast(&mat_BT709_Full_8bit));
            },
            5 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn SDL_GetBT2020ConversionMatrix(colorspace: SDL_Colorspace) callconv(.c) [*c]const f32 {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (@as(SDL_ColorRange, (colorspace >> @intCast(@as(SDL_Colorspace, 24))) & @as(SDL_Colorspace, 15))) {
                    @as(SDL_ColorRange, SDL_COLOR_RANGE_LIMITED) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_ColorRange, SDL_COLOR_RANGE_UNKNOWN) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SDL_ColorRange, SDL_COLOR_RANGE_FULL) => {
                        sdl_pc = 4;
                        continue;
                    },
                    else => {
                        sdl_pc = 5;
                        continue;
                    },
                }
            },
            1 => {
                return null;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                return @ptrCast(@alignCast(&mat_BT2020_Limited_10bit));
            },
            4 => {
                return @ptrCast(@alignCast(&mat_BT2020_Full_10bit));
            },
            5 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_GetYCbCRtoRGBConversionMatrix(colorspace: SDL_Colorspace, _: c_int, arg_h: c_int, bits_per_pixel: c_int) [*c]const f32 {
    @setEvalBranchQuota(100000);
    var h = arg_h;
    _ = &h;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (@as(SDL_MatrixCoefficients, colorspace & @as(SDL_Colorspace, 31))) {
                    @as(SDL_MatrixCoefficients, SDL_MATRIX_COEFFICIENTS_BT601) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_MatrixCoefficients, SDL_MATRIX_COEFFICIENTS_BT470BG) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SDL_MatrixCoefficients, SDL_MATRIX_COEFFICIENTS_BT709) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(SDL_MatrixCoefficients, SDL_MATRIX_COEFFICIENTS_BT2020_NCL) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_MatrixCoefficients, SDL_MATRIX_COEFFICIENTS_UNSPECIFIED) => {
                        sdl_pc = 6;
                        continue;
                    },
                    else => {
                        sdl_pc = 15;
                        continue;
                    },
                }
            },
            1 => {
                return null;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                return SDL_GetBT601ConversionMatrix(colorspace);
            },
            4 => {
                return SDL_GetBT709ConversionMatrix(colorspace);
            },
            5 => {
                return SDL_GetBT2020ConversionMatrix(colorspace);
            },
            6 => {
                switch (bits_per_pixel) {
                    @as(c_int, 8) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(c_int, 10) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(c_int, 16) => {
                        sdl_pc = 13;
                        continue;
                    },
                    else => {
                        sdl_pc = 14;
                        continue;
                    },
                }
            },
            7 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            8 => {
                if (h <= YUV_SD_THRESHOLD) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
            },
            9 => {
                return SDL_GetBT601ConversionMatrix(colorspace);
            },
            10 => {
                return SDL_GetBT709ConversionMatrix(colorspace);
            },
            11 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                return SDL_GetBT2020ConversionMatrix(colorspace);
            },
            14 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            15 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub const mat601to709: [9]f32 = [9]f32{
    0.939542,
    0.050181,
    0.010277,
    0.017772,
    0.965793,
    0.016435,
    -@as(f32, 0.001622),
    -@as(f32, 0.00437),
    1.005991,
};
pub const mat601to2020: [9]f32 = [9]f32{
    0.595254,
    0.349314,
    0.055432,
    0.081244,
    0.891503,
    0.027253,
    0.015512,
    0.081912,
    0.902576,
};
pub const mat709to601: [9]f32 = [9]f32{
    1.065379,
    -@as(f32, 0.055401),
    -@as(f32, 0.009978),
    -@as(f32, 0.019633),
    1.036363,
    -@as(f32, 0.016731),
    0.001632,
    0.004412,
    0.993956,
};
pub const mat709to2020: [9]f32 = [9]f32{
    0.627404,
    0.329283,
    0.043313,
    0.069097,
    0.919541,
    0.011362,
    0.016391,
    0.088013,
    0.895595,
};
pub const mat2020to601: [9]f32 = [9]f32{
    1.776133,
    -@as(f32, 0.68782),
    -@as(f32, 0.088313),
    -@as(f32, 0.161376),
    1.187315,
    -@as(f32, 0.02594),
    -@as(f32, 0.015881),
    -@as(f32, 0.095931),
    1.111812,
};
pub const mat2020to709: [9]f32 = [9]f32{
    1.660496,
    -@as(f32, 0.587656),
    -@as(f32, 0.07284),
    -@as(f32, 0.124547),
    1.132895,
    -@as(f32, 0.008348),
    -@as(f32, 0.018154),
    -@as(f32, 0.100597),
    1.118751,
};
pub const matSMPTE431to709: [9]f32 = [9]f32{
    1.120713,
    -@as(f32, 0.234649),
    0.0,
    -@as(f32, 0.038478),
    1.087034,
    0.0,
    -@as(f32, 0.017967),
    -@as(f32, 0.08203),
    0.954576,
};
pub const matSMPTE431to2020: [9]f32 = [9]f32{
    0.689691,
    0.207169,
    0.041346,
    0.041852,
    0.982426,
    0.010846,
    -@as(f32, 0.001107),
    0.018362,
    0.854914,
};
pub const matSMPTE432to709: [9]f32 = [9]f32{
    1.22494,
    -@as(f32, 0.22494),
    -@as(f32, 0.0),
    -@as(f32, 0.042057),
    1.042057,
    0.0,
    -@as(f32, 0.019638),
    -@as(f32, 0.078636),
    1.098273,
};
pub const matSMPTE432to2020: [9]f32 = [9]f32{
    0.753833,
    0.198597,
    0.04757,
    0.045744,
    0.941777,
    0.012479,
    -@as(f32, 0.00121),
    0.017602,
    0.983609,
};
pub export fn SDL_GetColorPrimariesConversionMatrix(src: SDL_ColorPrimaries, dst: SDL_ColorPrimaries) [*c]const f32 {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (dst) {
                    @as(SDL_ColorPrimaries, SDL_COLOR_PRIMARIES_BT601) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_ColorPrimaries, SDL_COLOR_PRIMARIES_SMPTE240) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SDL_ColorPrimaries, SDL_COLOR_PRIMARIES_BT709) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(SDL_ColorPrimaries, SDL_COLOR_PRIMARIES_BT2020) => {
                        sdl_pc = 16;
                        continue;
                    },
                    else => {
                        sdl_pc = 24;
                        continue;
                    },
                }
            },
            1 => {
                return null;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                switch (src) {
                    @as(SDL_ColorPrimaries, SDL_COLOR_PRIMARIES_BT709) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_ColorPrimaries, SDL_COLOR_PRIMARIES_BT2020) => {
                        sdl_pc = 6;
                        continue;
                    },
                    else => {
                        sdl_pc = 7;
                        continue;
                    },
                }
            },
            4 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            5 => {
                return @ptrCast(@alignCast(&mat709to601));
            },
            6 => {
                return @ptrCast(@alignCast(&mat2020to601));
            },
            7 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            8 => {
                switch (src) {
                    @as(SDL_ColorPrimaries, SDL_COLOR_PRIMARIES_BT601) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(SDL_ColorPrimaries, SDL_COLOR_PRIMARIES_SMPTE240) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(SDL_ColorPrimaries, SDL_COLOR_PRIMARIES_BT2020) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(SDL_ColorPrimaries, SDL_COLOR_PRIMARIES_SMPTE431) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(SDL_ColorPrimaries, SDL_COLOR_PRIMARIES_SMPTE432) => {
                        sdl_pc = 14;
                        continue;
                    },
                    else => {
                        sdl_pc = 15;
                        continue;
                    },
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
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                return @ptrCast(@alignCast(&mat601to709));
            },
            12 => {
                return @ptrCast(@alignCast(&mat2020to709));
            },
            13 => {
                return @ptrCast(@alignCast(&matSMPTE431to709));
            },
            14 => {
                return @ptrCast(@alignCast(&matSMPTE432to709));
            },
            15 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            16 => {
                switch (src) {
                    @as(SDL_ColorPrimaries, SDL_COLOR_PRIMARIES_BT601) => {
                        sdl_pc = 18;
                        continue;
                    },
                    @as(SDL_ColorPrimaries, SDL_COLOR_PRIMARIES_SMPTE240) => {
                        sdl_pc = 19;
                        continue;
                    },
                    @as(SDL_ColorPrimaries, SDL_COLOR_PRIMARIES_BT709) => {
                        sdl_pc = 20;
                        continue;
                    },
                    @as(SDL_ColorPrimaries, SDL_COLOR_PRIMARIES_SMPTE431) => {
                        sdl_pc = 21;
                        continue;
                    },
                    @as(SDL_ColorPrimaries, SDL_COLOR_PRIMARIES_SMPTE432) => {
                        sdl_pc = 22;
                        continue;
                    },
                    else => {
                        sdl_pc = 23;
                        continue;
                    },
                }
            },
            17 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            18 => {
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            19 => {
                return @ptrCast(@alignCast(&mat601to2020));
            },
            20 => {
                return @ptrCast(@alignCast(&mat709to2020));
            },
            21 => {
                return @ptrCast(@alignCast(&matSMPTE431to2020));
            },
            22 => {
                return @ptrCast(@alignCast(&matSMPTE432to2020));
            },
            23 => {
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            24 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_ConvertColorPrimaries(fR: [*c]f32, fG: [*c]f32, fB: [*c]f32, matrix: [*c]const f32) void {
    @setEvalBranchQuota(100000);
    var v: [3]f32 = undefined;
    _ = &v;
    v[@as(c_int, 0)] = fR.*;
    v[@as(c_int, 1)] = fG.*;
    v[@as(c_int, 2)] = fB.*;
    fR.* = ((matrix[(@as(c_int, 0) * @as(c_int, 3)) + @as(c_int, 0)] * v[@as(c_int, 0)]) + (matrix[(@as(c_int, 0) * @as(c_int, 3)) + @as(c_int, 1)] * v[@as(c_int, 1)])) + (matrix[(@as(c_int, 0) * @as(c_int, 3)) + @as(c_int, 2)] * v[@as(c_int, 2)]);
    fG.* = ((matrix[(@as(c_int, 1) * @as(c_int, 3)) + @as(c_int, 0)] * v[@as(c_int, 0)]) + (matrix[(@as(c_int, 1) * @as(c_int, 3)) + @as(c_int, 1)] * v[@as(c_int, 1)])) + (matrix[(@as(c_int, 1) * @as(c_int, 3)) + @as(c_int, 2)] * v[@as(c_int, 2)]);
    fB.* = ((matrix[(@as(c_int, 2) * @as(c_int, 3)) + @as(c_int, 0)] * v[@as(c_int, 0)]) + (matrix[(@as(c_int, 2) * @as(c_int, 3)) + @as(c_int, 1)] * v[@as(c_int, 1)])) + (matrix[(@as(c_int, 2) * @as(c_int, 3)) + @as(c_int, 2)] * v[@as(c_int, 2)]);
}
pub export fn SDL_ConvertColor709to2020(fR: [*c]f32, fG: [*c]f32, fB: [*c]f32) void {
    @setEvalBranchQuota(100000);
    SDL_ConvertColorPrimaries(fR, fG, fB, @ptrCast(@alignCast(&mat709to2020)));
}
pub export fn SDL_CreatePalette_REAL(ncolors: c_int) [*c]SDL_Palette {
    @setEvalBranchQuota(100000);
    var palette: [*c]SDL_Palette = undefined;
    _ = &palette;
    if (ncolors < @as(c_int, 1)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("ncolors"))));
        return null;
    }
    palette = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(@TypeOf(palette.*)))));
    if (!(palette != null)) {
        return null;
    }
    palette.*.colors = @ptrCast(@alignCast(SDL_malloc_REAL(@as(c_ulong, @bitCast(@as(c_long, ncolors))) *% @sizeOf(@TypeOf(palette.*.colors.*)))));
    if (!(palette.*.colors != null)) {
        SDL_free_REAL(@ptrCast(@alignCast(palette)));
        return null;
    }
    palette.*.ncolors = ncolors;
    palette.*.version = 1;
    palette.*.refcount = 1;
    _ = memset(@ptrCast(@alignCast(palette.*.colors)), 255, @as(c_ulong, @bitCast(@as(c_long, ncolors))) *% @sizeOf(@TypeOf(palette.*.colors.*)));
    return palette;
}
pub export fn SDL_SetPaletteColors_REAL(palette: [*c]SDL_Palette, colors: [*c]const SDL_Color, firstcolor: c_int, arg_ncolors: c_int) bool {
    @setEvalBranchQuota(100000);
    var ncolors = arg_ncolors;
    _ = &ncolors;
    if (!(palette != null)) {
        return @"false" != 0;
    }
    if (ncolors > (palette.*.ncolors - firstcolor)) {
        ncolors = palette.*.ncolors - firstcolor;
    }
    if (colors != (palette.*.colors + @as(usize, @bitCast(@as(isize, @intCast(firstcolor)))))) {
        _ = memcpy(@ptrCast(@alignCast(palette.*.colors + @as(usize, @bitCast(@as(isize, @intCast(firstcolor)))))), @ptrCast(@alignCast(colors)), @as(c_ulong, @bitCast(@as(c_long, ncolors))) *% @sizeOf(@TypeOf(colors.*)));
    }
    palette.*.version +%= 1;
    if (!(palette.*.version != 0)) {
        palette.*.version = 1;
    }
    return @"true" != 0;
}
pub export fn SDL_DestroyPalette_REAL(palette: [*c]SDL_Palette) void {
    @setEvalBranchQuota(100000);
    if (!(palette != null)) {
        return;
    }
    if ((blk: {
        const ref = &palette.*.refcount;
        ref.* -= 1;
        break :blk ref.*;
    }) > @as(c_int, 0)) {
        return;
    }
    SDL_free_REAL(@ptrCast(@alignCast(palette.*.colors)));
    SDL_free_REAL(@ptrCast(@alignCast(palette)));
}
pub export fn SDL_DitherPalette(palette: [*c]SDL_Palette) void {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    if (palette.*.ncolors != @as(c_int, 256)) {
        return;
    }
    {
        i = 0;
        while (i < palette.*.ncolors) : (i += 1) {
            var r: c_int = undefined;
            _ = &r;
            var g: c_int = undefined;
            _ = &g;
            var b: c_int = undefined;
            _ = &b;
            r = i & @as(c_int, 224);
            r |= (r >> @intCast(@as(c_int, 3))) | (r >> @intCast(@as(c_int, 6)));
            palette.*.colors[@bitCast(@as(isize, @intCast(i)))].r = @bitCast(@as(i8, @truncate(r)));
            g = (i << @intCast(@as(c_int, 3))) & @as(c_int, 224);
            g |= (g >> @intCast(@as(c_int, 3))) | (g >> @intCast(@as(c_int, 6)));
            palette.*.colors[@bitCast(@as(isize, @intCast(i)))].g = @bitCast(@as(i8, @truncate(g)));
            b = i & @as(c_int, 3);
            b |= b << @intCast(@as(c_int, 2));
            b |= b << @intCast(@as(c_int, 4));
            palette.*.colors[@bitCast(@as(isize, @intCast(i)))].b = @bitCast(@as(i8, @truncate(b)));
            palette.*.colors[@bitCast(@as(isize, @intCast(i)))].a = SDL_ALPHA_OPAQUE;
        }
    }
}
pub fn SDL_FindColor(pal: [*c]const SDL_Palette, r: Uint8, g: Uint8, b: Uint8, a: Uint8) callconv(.c) Uint8 {
    @setEvalBranchQuota(100000);
    var smallest: c_uint = undefined;
    _ = &smallest;
    var distance: c_uint = undefined;
    _ = &distance;
    var rd: c_int = undefined;
    _ = &rd;
    var gd: c_int = undefined;
    _ = &gd;
    var bd: c_int = undefined;
    _ = &bd;
    var ad: c_int = undefined;
    _ = &ad;
    var i: c_int = undefined;
    _ = &i;
    var pixelvalue: Uint8 = 0;
    _ = &pixelvalue;
    smallest = ~@as(c_uint, 0);
    {
        i = 0;
        while (i < pal.*.ncolors) : (i += 1) {
            rd = @as(c_int, pal.*.colors[@bitCast(@as(isize, @intCast(i)))].r) - @as(c_int, r);
            gd = @as(c_int, pal.*.colors[@bitCast(@as(isize, @intCast(i)))].g) - @as(c_int, g);
            bd = @as(c_int, pal.*.colors[@bitCast(@as(isize, @intCast(i)))].b) - @as(c_int, b);
            ad = @as(c_int, pal.*.colors[@bitCast(@as(isize, @intCast(i)))].a) - @as(c_int, a);
            distance = @bitCast(@as(c_int, (((rd * rd) + (gd * gd)) + (bd * bd)) + (ad * ad)));
            if (distance < smallest) {
                pixelvalue = @bitCast(@as(i8, @truncate(i)));
                if (distance == @as(c_uint, 0)) {
                    break;
                }
                smallest = distance;
            }
        }
    }
    return pixelvalue;
}
pub export fn SDL_LookupRGBAColor(palette_map: ?*SDL_HashTable, pixelvalue: Uint32, pal: [*c]const SDL_Palette) Uint8 {
    @setEvalBranchQuota(100000);
    var color_index: Uint8 = 0;
    _ = &color_index;
    if (pal != null) {
        var value: ?*const anyopaque = undefined;
        _ = &value;
        if (SDL_FindInHashTable(palette_map, @ptrFromInt(@as(usize, pixelvalue)), &value)) {
            color_index = @truncate(@as(usize, @intCast(@intFromPtr(value))));
        } else {
            var r: Uint8 = @truncate((pixelvalue >> @intCast(@as(Uint32, 24))) & @as(Uint32, 255));
            _ = &r;
            var g: Uint8 = @truncate((pixelvalue >> @intCast(@as(Uint32, 16))) & @as(Uint32, 255));
            _ = &g;
            var b: Uint8 = @truncate((pixelvalue >> @intCast(@as(Uint32, 8))) & @as(Uint32, 255));
            _ = &b;
            var a: Uint8 = @truncate((pixelvalue >> @intCast(@as(Uint32, 0))) & @as(Uint32, 255));
            _ = &a;
            color_index = SDL_FindColor(pal, r, g, b, a);
            _ = SDL_InsertIntoHashTable(palette_map, @ptrFromInt(@as(usize, pixelvalue)), @ptrFromInt(@as(usize, color_index)), @"true" != 0);
        }
    }
    return color_index;
}
pub export fn SDL_DetectPalette(pal: [*c]const SDL_Palette, is_opaque: [*c]bool, has_alpha_channel: [*c]bool) void {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    {
        var all_opaque: bool = @"true" != 0;
        _ = &all_opaque;
        {
            i = 0;
            while (i < pal.*.ncolors) : (i += 1) {
                var alpha_value: Uint8 = pal.*.colors[@bitCast(@as(isize, @intCast(i)))].a;
                _ = &alpha_value;
                if (@as(c_int, alpha_value) != SDL_ALPHA_OPAQUE) {
                    all_opaque = @"false" != 0;
                    break;
                }
            }
        }
        if (all_opaque) {
            is_opaque.* = @"true" != 0;
            has_alpha_channel.* = @"true" != 0;
            return;
        }
    }
    {
        var all_transparent: bool = @"true" != 0;
        _ = &all_transparent;
        {
            i = 0;
            while (i < pal.*.ncolors) : (i += 1) {
                var alpha_value: Uint8 = pal.*.colors[@bitCast(@as(isize, @intCast(i)))].a;
                _ = &alpha_value;
                if (@as(c_int, alpha_value) != SDL_ALPHA_TRANSPARENT) {
                    all_transparent = @"false" != 0;
                    break;
                }
            }
        }
        if (all_transparent) {
            is_opaque.* = @"true" != 0;
            has_alpha_channel.* = @"false" != 0;
            return;
        }
    }
    is_opaque.* = @"false" != 0;
    has_alpha_channel.* = @"true" != 0;
}
pub export fn SDL_MapRGB_REAL(format: [*c]const SDL_PixelFormatDetails, palette: [*c]const SDL_Palette, r: Uint8, g: Uint8, b: Uint8) Uint32 {
    @setEvalBranchQuota(100000);
    if (!(format != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("format"))));
        return 0;
    }
    if (!((format.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((((format.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX1)) or (((format.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX2))) or (((format.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX4))) or (((format.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX8)))) {
        if (!(palette != null)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("palette"))));
            return 0;
        }
        return SDL_FindColor(palette, r, g, b, SDL_ALPHA_OPAQUE);
    }
    if (!((format.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((format.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)) and (((format.*.format >> @intCast(@as(SDL_PixelFormat, 16))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDLAYOUT_2101010)))) {
        return (((@as(Uint32, SDL_expand_byte_10[r]) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, format.*.Rshift)))))) | (@as(Uint32, SDL_expand_byte_10[g]) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, format.*.Gshift))))))) | (@as(Uint32, SDL_expand_byte_10[b]) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, format.*.Bshift))))))) | format.*.Amask;
    } else {
        return (((@as(Uint32, @bitCast(@as(c_int, @as(c_int, r) >> @intCast(@as(c_int, 8) - @as(c_int, format.*.Rbits))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, format.*.Rshift)))))) | (@as(Uint32, @bitCast(@as(c_int, @as(c_int, g) >> @intCast(@as(c_int, 8) - @as(c_int, format.*.Gbits))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, format.*.Gshift))))))) | (@as(Uint32, @bitCast(@as(c_int, @as(c_int, b) >> @intCast(@as(c_int, 8) - @as(c_int, format.*.Bbits))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, format.*.Bshift))))))) | format.*.Amask;
    }
}
pub export fn SDL_MapRGBA_REAL(format: [*c]const SDL_PixelFormatDetails, palette: [*c]const SDL_Palette, r: Uint8, g: Uint8, b: Uint8, a: Uint8) Uint32 {
    @setEvalBranchQuota(100000);
    if (!(format != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("format"))));
        return 0;
    }
    if (!((format.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((((format.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX1)) or (((format.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX2))) or (((format.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX4))) or (((format.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX8)))) {
        if (!(palette != null)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("palette"))));
            return 0;
        }
        return SDL_FindColor(palette, r, g, b, a);
    }
    if (!((format.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((format.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)) and (((format.*.format >> @intCast(@as(SDL_PixelFormat, 16))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDLAYOUT_2101010)))) {
        return (((@as(Uint32, SDL_expand_byte_10[r]) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, format.*.Rshift)))))) | (@as(Uint32, SDL_expand_byte_10[g]) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, format.*.Gshift))))))) | (@as(Uint32, SDL_expand_byte_10[b]) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, format.*.Bshift))))))) | ((@as(Uint32, @bitCast(@as(c_int, @as(c_int, a) >> @intCast(@as(c_int, 8) - @as(c_int, format.*.Abits))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, format.*.Ashift)))))) & format.*.Amask);
    } else {
        return (((@as(Uint32, @bitCast(@as(c_int, @as(c_int, r) >> @intCast(@as(c_int, 8) - @as(c_int, format.*.Rbits))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, format.*.Rshift)))))) | (@as(Uint32, @bitCast(@as(c_int, @as(c_int, g) >> @intCast(@as(c_int, 8) - @as(c_int, format.*.Gbits))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, format.*.Gshift))))))) | (@as(Uint32, @bitCast(@as(c_int, @as(c_int, b) >> @intCast(@as(c_int, 8) - @as(c_int, format.*.Bbits))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, format.*.Bshift))))))) | ((@as(Uint32, @bitCast(@as(c_int, @as(c_int, a) >> @intCast(@as(c_int, 8) - @as(c_int, format.*.Abits))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, format.*.Ashift)))))) & format.*.Amask);
    }
}
pub export fn SDL_GetRGB_REAL(pixelvalue: Uint32, format: [*c]const SDL_PixelFormatDetails, palette: [*c]const SDL_Palette, arg_r: [*c]Uint8, arg_g: [*c]Uint8, arg_b: [*c]Uint8) void {
    @setEvalBranchQuota(100000);
    var r = arg_r;
    _ = &r;
    var g = arg_g;
    _ = &g;
    var b = arg_b;
    _ = &b;
    var unused: Uint8 = undefined;
    _ = &unused;
    if (!(r != null)) {
        r = &unused;
    }
    if (!(g != null)) {
        g = &unused;
    }
    if (!(b != null)) {
        b = &unused;
    }
    if (!(format != null)) {
        r.* = blk: {
            const tmp = blk_1: {
                const tmp_2 = @as(Uint8, 0);
                b.* = tmp_2;
                break :blk_1 tmp_2;
            };
            g.* = tmp;
            break :blk tmp;
        };
        return;
    }
    if (!((format.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((((format.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX1)) or (((format.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX2))) or (((format.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX4))) or (((format.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX8)))) {
        if ((palette != null) and (pixelvalue < @as(c_uint, @bitCast(@as(c_int, palette.*.ncolors))))) {
            r.* = palette.*.colors[pixelvalue].r;
            g.* = palette.*.colors[pixelvalue].g;
            b.* = palette.*.colors[pixelvalue].b;
        } else {
            r.* = blk: {
                const tmp = blk_1: {
                    const tmp_2 = @as(Uint8, 0);
                    b.* = tmp_2;
                    break :blk_1 tmp_2;
                };
                g.* = tmp;
                break :blk tmp;
            };
        }
        return;
    }
    if (!((format.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((format.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)) and (((format.*.format >> @intCast(@as(SDL_PixelFormat, 16))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDLAYOUT_2101010)))) {
        var v: c_uint = undefined;
        _ = &v;
        v = (pixelvalue & format.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, format.*.Rshift)))));
        r.* = @truncate(v >> @intCast(@as(c_uint, 2)));
        v = (pixelvalue & format.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, format.*.Gshift)))));
        g.* = @truncate(v >> @intCast(@as(c_uint, 2)));
        v = (pixelvalue & format.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, format.*.Bshift)))));
        b.* = @truncate(v >> @intCast(@as(c_uint, 2)));
    } else {
        var v: c_uint = undefined;
        _ = &v;
        v = (pixelvalue & format.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, format.*.Rshift)))));
        r.* = SDL_expand_byte[format.*.Rbits][v];
        v = (pixelvalue & format.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, format.*.Gshift)))));
        g.* = SDL_expand_byte[format.*.Gbits][v];
        v = (pixelvalue & format.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, format.*.Bshift)))));
        b.* = SDL_expand_byte[format.*.Bbits][v];
    }
}
pub export fn SDL_GetRGBA_REAL(pixelvalue: Uint32, format: [*c]const SDL_PixelFormatDetails, palette: [*c]const SDL_Palette, arg_r: [*c]Uint8, arg_g: [*c]Uint8, arg_b: [*c]Uint8, arg_a: [*c]Uint8) void {
    @setEvalBranchQuota(100000);
    var r = arg_r;
    _ = &r;
    var g = arg_g;
    _ = &g;
    var b = arg_b;
    _ = &b;
    var a = arg_a;
    _ = &a;
    var unused: Uint8 = undefined;
    _ = &unused;
    if (!(r != null)) {
        r = &unused;
    }
    if (!(g != null)) {
        g = &unused;
    }
    if (!(b != null)) {
        b = &unused;
    }
    if (!(a != null)) {
        a = &unused;
    }
    if (!(format != null)) {
        r.* = blk: {
            const tmp = blk_1: {
                const tmp_2 = blk_2: {
                    const tmp_3 = @as(Uint8, 0);
                    a.* = tmp_3;
                    break :blk_2 tmp_3;
                };
                b.* = tmp_2;
                break :blk_1 tmp_2;
            };
            g.* = tmp;
            break :blk tmp;
        };
        return;
    }
    if (!((format.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((((format.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX1)) or (((format.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX2))) or (((format.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX4))) or (((format.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX8)))) {
        if ((palette != null) and (pixelvalue < @as(c_uint, @bitCast(@as(c_int, palette.*.ncolors))))) {
            r.* = palette.*.colors[pixelvalue].r;
            g.* = palette.*.colors[pixelvalue].g;
            b.* = palette.*.colors[pixelvalue].b;
            a.* = palette.*.colors[pixelvalue].a;
        } else {
            r.* = blk: {
                const tmp = blk_1: {
                    const tmp_2 = blk_2: {
                        const tmp_3 = @as(Uint8, 0);
                        a.* = tmp_3;
                        break :blk_2 tmp_3;
                    };
                    b.* = tmp_2;
                    break :blk_1 tmp_2;
                };
                g.* = tmp;
                break :blk tmp;
            };
        }
        return;
    }
    if (!((format.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((format.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)) and (((format.*.format >> @intCast(@as(SDL_PixelFormat, 16))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDLAYOUT_2101010)))) {
        var v: c_uint = undefined;
        _ = &v;
        v = (pixelvalue & format.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, format.*.Rshift)))));
        r.* = @truncate(v >> @intCast(@as(c_uint, 2)));
        v = (pixelvalue & format.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, format.*.Gshift)))));
        g.* = @truncate(v >> @intCast(@as(c_uint, 2)));
        v = (pixelvalue & format.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, format.*.Bshift)))));
        b.* = @truncate(v >> @intCast(@as(c_uint, 2)));
        v = (pixelvalue & format.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, format.*.Ashift)))));
        a.* = SDL_expand_byte[format.*.Abits][v];
    } else {
        var v: c_uint = undefined;
        _ = &v;
        v = (pixelvalue & format.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, format.*.Rshift)))));
        r.* = SDL_expand_byte[format.*.Rbits][v];
        v = (pixelvalue & format.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, format.*.Gshift)))));
        g.* = SDL_expand_byte[format.*.Gbits][v];
        v = (pixelvalue & format.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, format.*.Bshift)))));
        b.* = SDL_expand_byte[format.*.Bbits][v];
        v = (pixelvalue & format.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, format.*.Ashift)))));
        a.* = SDL_expand_byte[format.*.Abits][v];
    }
}
pub export fn SDL_IsSamePalette(src: [*c]const SDL_Palette, dst: [*c]const SDL_Palette) bool {
    @setEvalBranchQuota(100000);
    if (src.*.ncolors <= dst.*.ncolors) {
        if ((src == dst) or (SDL_memcmp_REAL(@ptrCast(@alignCast(src.*.colors)), @ptrCast(@alignCast(dst.*.colors)), @as(c_ulong, @bitCast(@as(c_long, src.*.ncolors))) *% @sizeOf(SDL_Color)) == @as(c_int, 0))) {
            return @"true" != 0;
        }
    }
    return @"false" != 0;
}
pub fn Map1to1(src: [*c]const SDL_Palette, dst: [*c]const SDL_Palette, identical: [*c]c_int) callconv(.c) [*c]Uint8 {
    @setEvalBranchQuota(100000);
    var map: [*c]Uint8 = undefined;
    _ = &map;
    var i: c_int = undefined;
    _ = &i;
    if (SDL_IsSamePalette(src, dst)) {
        identical.* = 1;
        return null;
    }
    identical.* = 0;
    map = @ptrCast(@alignCast(SDL_calloc_REAL(256, @sizeOf(Uint8))));
    if (!(map != null)) {
        return null;
    }
    {
        i = 0;
        while (i < src.*.ncolors) : (i += 1) {
            map[@bitCast(@as(isize, @intCast(i)))] = SDL_FindColor(dst, src.*.colors[@bitCast(@as(isize, @intCast(i)))].r, src.*.colors[@bitCast(@as(isize, @intCast(i)))].g, src.*.colors[@bitCast(@as(isize, @intCast(i)))].b, src.*.colors[@bitCast(@as(isize, @intCast(i)))].a);
        }
    }
    return map;
}
pub fn Map1toN(pal: [*c]const SDL_Palette, Rmod: Uint8, Gmod: Uint8, Bmod: Uint8, Amod: Uint8, dst: [*c]const SDL_PixelFormatDetails) callconv(.c) [*c]Uint8 {
    @setEvalBranchQuota(100000);
    var map: [*c]Uint8 = undefined;
    _ = &map;
    var i: c_int = undefined;
    _ = &i;
    var bpp: c_int = undefined;
    _ = &bpp;
    var R: Uint8 = undefined;
    _ = &R;
    var G: Uint8 = undefined;
    _ = &G;
    var B: Uint8 = undefined;
    _ = &B;
    var A: Uint8 = undefined;
    _ = &A;
    var _pixel: Uint8 = undefined;
    _ = &_pixel;
    var _pixel_1: Uint16 = undefined;
    _ = &_pixel_1;
    var _pixel_2: Uint32 = undefined;
    _ = &_pixel_2;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (!(pal != null)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                _ = SDL_SetError_REAL("src does not have a palette set");
                return null;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                bpp = if ((if ((dst.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((dst.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((dst.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (dst.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (dst.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (dst.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (dst.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (dst.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((dst.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255)))) == @as(c_int, 3)) @as(c_int, 4) else if ((dst.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((dst.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((dst.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (dst.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (dst.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (dst.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (dst.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (dst.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((dst.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255)));
                map = @ptrCast(@alignCast(SDL_calloc_REAL(256, @bitCast(@as(c_long, bpp)))));
                if (!(map != null)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                return null;
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                i = 0;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                if (i < pal.*.ncolors) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
            },
            8 => {
                R = @bitCast(@as(i8, @truncate(@divTrunc(@as(c_int, pal.*.colors[@bitCast(@as(isize, @intCast(i)))].r) * @as(c_int, Rmod), @as(c_int, 255)))));
                G = @bitCast(@as(i8, @truncate(@divTrunc(@as(c_int, pal.*.colors[@bitCast(@as(isize, @intCast(i)))].g) * @as(c_int, Gmod), @as(c_int, 255)))));
                B = @bitCast(@as(i8, @truncate(@divTrunc(@as(c_int, pal.*.colors[@bitCast(@as(isize, @intCast(i)))].b) * @as(c_int, Bmod), @as(c_int, 255)))));
                A = @bitCast(@as(i8, @truncate(@divTrunc(@as(c_int, pal.*.colors[@bitCast(@as(isize, @intCast(i)))].a) * @as(c_int, Amod), @as(c_int, 255)))));
                switch (if ((dst.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((dst.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((dst.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (dst.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (dst.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (dst.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (dst.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (dst.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((dst.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255)))) {
                    @as(c_int, 1) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 15;
                        continue;
                    },
                    else => {
                        sdl_pc = 11;
                        continue;
                    },
                }
            },
            9 => {
                i += 1;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            10 => {
                return map;
            },
            11 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            12 => {
                _pixel = @truncate(((((@as(Uint32, R) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst.*.Rbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst.*.Rshift)))))) | ((@as(Uint32, G) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst.*.Gbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst.*.Gshift))))))) | ((@as(Uint32, B) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst.*.Bbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst.*.Bshift))))))) | ((@as(Uint32, A) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst.*.Abits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst.*.Ashift)))))));
                (&map[@bitCast(@as(isize, @intCast(i * bpp)))]).* = _pixel;
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            13 => {
                _pixel_1 = @truncate(((((@as(Uint32, R) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst.*.Rbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst.*.Rshift)))))) | ((@as(Uint32, G) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst.*.Gbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst.*.Gshift))))))) | ((@as(Uint32, B) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst.*.Bbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst.*.Bshift))))))) | ((@as(Uint32, A) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst.*.Abits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst.*.Ashift)))))));
                @as([*c]Uint16, @ptrCast(@alignCast(&map[@bitCast(@as(isize, @intCast(i * bpp)))]))).* = _pixel_1;
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            14 => {
                ((__builtin.as_c_pointer((&map[@bitCast(@as(isize, @intCast(i * bpp)))])) + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dst.*.Rshift), @as(c_int, 8)))))))).* = @truncate(@as(Uint32, R));
                (__builtin.as_c_pointer((&map[@bitCast(@as(isize, @intCast(i * bpp)))])) + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dst.*.Gshift), @as(c_int, 8))))))).* = @truncate(@as(Uint32, G));
                (__builtin.as_c_pointer((&map[@bitCast(@as(isize, @intCast(i * bpp)))])) + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dst.*.Bshift), @as(c_int, 8))))))).* = @truncate(@as(Uint32, B));
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            15 => {
                _pixel_2 = ((((@as(Uint32, R) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst.*.Rbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst.*.Rshift)))))) | ((@as(Uint32, G) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst.*.Gbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst.*.Gshift))))))) | ((@as(Uint32, B) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst.*.Bbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst.*.Bshift))))))) | ((@as(Uint32, A) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst.*.Abits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst.*.Ashift))))));
                @as([*c]Uint32, @ptrCast(@alignCast(&map[@bitCast(@as(isize, @intCast(i * bpp)))]))).* = _pixel_2;
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_ValidateMap(src: [*c]SDL_Surface, dst: [*c]SDL_Surface) bool {
    @setEvalBranchQuota(100000);
    var map: [*c]SDL_BlitMap = &src.*.map;
    _ = &map;
    if ((((map.*.info.dst_fmt != dst.*.fmt) or (map.*.info.dst_pal != dst.*.palette)) or ((dst.*.palette != null) and (map.*.dst_palette_version != dst.*.palette.*.version))) or ((src.*.palette != null) and (map.*.src_palette_version != src.*.palette.*.version))) {
        if (!SDL_MapSurface(src, dst)) {
            return @"false" != 0;
        }
    } else {
        map.*.info.dst_surface = dst;
    }
    return @"true" != 0;
}
pub export fn SDL_InvalidateMap(map: [*c]SDL_BlitMap) void {
    @setEvalBranchQuota(100000);
    map.*.info.dst_fmt = null;
    map.*.info.dst_pal = null;
    map.*.src_palette_version = 0;
    map.*.dst_palette_version = 0;
    if (map.*.info.table != null) {
        SDL_free_REAL(@ptrCast(@alignCast(map.*.info.table)));
        map.*.info.table = null;
    }
    if (map.*.info.palette_map != null) {
        SDL_DestroyHashTable(map.*.info.palette_map);
        map.*.info.palette_map = null;
    }
}
pub export fn SDL_MapSurface(src: [*c]SDL_Surface, dst: [*c]SDL_Surface) bool {
    @setEvalBranchQuota(100000);
    var srcfmt: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &srcfmt;
    var srcpal: [*c]const SDL_Palette = undefined;
    _ = &srcpal;
    var dstfmt: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &dstfmt;
    var dstpal: [*c]const SDL_Palette = undefined;
    _ = &dstpal;
    var map: [*c]SDL_BlitMap = undefined;
    _ = &map;
    map = &src.*.map;
    if ((src.*.internal_flags & SDL_INTERNAL_SURFACE_RLEACCEL) != 0) {
        SDL_UnRLESurface(src);
    }
    SDL_InvalidateMap(map);
    map.*.identity = 0;
    srcfmt = src.*.fmt;
    srcpal = src.*.palette;
    dstfmt = dst.*.fmt;
    dstpal = dst.*.palette;
    if (!((srcfmt.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((srcfmt.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((((srcfmt.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX1)) or (((srcfmt.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX2))) or (((srcfmt.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX4))) or (((srcfmt.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX8)))) {
        if (!((dstfmt.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((dstfmt.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((((dstfmt.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX1)) or (((dstfmt.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX2))) or (((dstfmt.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX4))) or (((dstfmt.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX8)))) {
            if ((srcpal != null) and (dstpal != null)) {
                map.*.info.table = Map1to1(srcpal, dstpal, &map.*.identity);
            } else {
                map.*.identity = 1;
            }
            if (!(map.*.identity != 0)) {
                if (!(map.*.info.table != null)) {
                    return @"false" != 0;
                }
            }
            if (@as(c_int, srcfmt.*.bits_per_pixel) != @as(c_int, dstfmt.*.bits_per_pixel)) {
                map.*.identity = 0;
            }
        } else {
            map.*.info.table = Map1toN(srcpal, src.*.map.info.r, src.*.map.info.g, src.*.map.info.b, src.*.map.info.a, dstfmt);
            if (!(map.*.info.table != null)) {
                return @"false" != 0;
            }
        }
    } else {
        if (!((dstfmt.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((dstfmt.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((((dstfmt.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX1)) or (((dstfmt.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX2))) or (((dstfmt.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX4))) or (((dstfmt.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX8)))) {
            map.*.info.palette_map = SDL_CreateHashTable(0, @"false" != 0, SDL_HashID, SDL_KeyMatchID, null, null);
        } else {
            if (srcfmt == dstfmt) {
                map.*.identity = 1;
            }
        }
    }
    if (dstpal != null) {
        map.*.dst_palette_version = dstpal.*.version;
    } else {
        map.*.dst_palette_version = 0;
    }
    if (srcpal != null) {
        map.*.src_palette_version = srcpal.*.version;
    } else {
        map.*.src_palette_version = 0;
    }
    return SDL_CalculateBlit(src, dst);
}

pub const SDL_CreatePalette = SDL_CreatePalette_REAL;
pub const SDL_DestroyPalette = SDL_DestroyPalette_REAL;
pub const SDL_GetMasksForPixelFormat = SDL_GetMasksForPixelFormat_REAL;
pub const SDL_GetPixelFormatDetails = SDL_GetPixelFormatDetails_REAL;
pub const SDL_GetPixelFormatForMasks = SDL_GetPixelFormatForMasks_REAL;
pub const SDL_GetPixelFormatName = SDL_GetPixelFormatName_REAL;
pub const SDL_GetRGB = SDL_GetRGB_REAL;
pub const SDL_GetRGBA = SDL_GetRGBA_REAL;
pub const SDL_MapRGB = SDL_MapRGB_REAL;
pub const SDL_MapRGBA = SDL_MapRGBA_REAL;
pub const SDL_SetPaletteColors = SDL_SetPaletteColors_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_ALPHA_OPAQUE = @as(c_int, 255);
pub const SDL_ALPHA_TRANSPARENT = @as(c_int, 0);
pub const SDL_INTERNAL_SURFACE_RLEACCEL = @as(c_uint, 0x00000004);
pub const YUV_SD_THRESHOLD = @as(c_int, 576);
