pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Uint16 = u16;
pub const Uint32 = u32;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_realloc_REAL(mem: ?*anyopaque, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub const SDL_PropertiesID = Uint32;
pub const SDL_PIXELTYPE_PACKED8: c_int = 4;
pub const SDL_PIXELTYPE_PACKED16: c_int = 5;
pub const SDL_PIXELTYPE_PACKED32: c_int = 6;
pub const SDL_PIXELTYPE_ARRAYU8: c_int = 7;
pub const SDL_PIXELTYPE_ARRAYU16: c_int = 8;
pub const SDL_PIXELTYPE_ARRAYU32: c_int = 9;
pub const SDL_PIXELTYPE_ARRAYF16: c_int = 10;
pub const SDL_PIXELTYPE_ARRAYF32: c_int = 11;
pub const SDL_PACKEDORDER_ARGB: c_int = 3;
pub const SDL_PACKEDORDER_RGBA: c_int = 4;
pub const SDL_PACKEDORDER_ABGR: c_int = 7;
pub const SDL_PACKEDORDER_BGRA: c_int = 8;
pub const SDL_ARRAYORDER_RGBA: c_int = 2;
pub const SDL_ARRAYORDER_ARGB: c_int = 3;
pub const SDL_ARRAYORDER_BGRA: c_int = 5;
pub const SDL_ARRAYORDER_ABGR: c_int = 6;
pub const enum_SDL_PixelFormat = c_uint;
pub const SDL_PixelFormat = enum_SDL_PixelFormat;
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
pub extern fn SDL_LockSurface_REAL(surface: [*c]SDL_Surface) bool;
pub extern fn SDL_UnlockSurface_REAL(surface: [*c]SDL_Surface) void;
pub const struct_SDL_HashTable = opaque {
};
pub const SDL_HashTable = struct_SDL_HashTable;
pub extern var SDL_expand_byte: [9][*c]const Uint8;
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
pub extern fn SDL_UpdateSurfaceLockFlag(surface: [*c]SDL_Surface) void;
pub extern fn SDL_InvalidateMap(map: [*c]SDL_BlitMap) void;
pub fn RLEClipBlit(w: c_int, arg_srcbuf: [*c]Uint8, surf_dst: [*c]SDL_Surface, arg_dstbuf: [*c]Uint8, srcrect: [*c]const SDL_Rect, alpha: c_uint) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var srcbuf = arg_srcbuf;
    _ = &srcbuf;
    var dstbuf = arg_dstbuf;
    _ = &dstbuf;
    var fmt: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &fmt;
    var linecount: c_int = undefined;
    _ = &linecount;
    var ofs: c_int = undefined;
    _ = &ofs;
    var left: c_int = undefined;
    _ = &left;
    var right: c_int = undefined;
    _ = &right;
    var run: c_int = undefined;
    _ = &run;
    var start: c_int = undefined;
    _ = &start;
    var len: c_int = undefined;
    _ = &len;
    var startcol: c_int = undefined;
    _ = &startcol;
    var linecount_1: c_int = undefined;
    _ = &linecount_1;
    var ofs_2: c_int = undefined;
    _ = &ofs_2;
    var left_3: c_int = undefined;
    _ = &left_3;
    var right_4: c_int = undefined;
    _ = &right_4;
    var run_5: c_int = undefined;
    _ = &run_5;
    var start_6: c_int = undefined;
    _ = &start_6;
    var len_7: c_int = undefined;
    _ = &len_7;
    var startcol_8: c_int = undefined;
    _ = &startcol_8;
    var linecount_9: c_int = undefined;
    _ = &linecount_9;
    var ofs_10: c_int = undefined;
    _ = &ofs_10;
    var left_11: c_int = undefined;
    _ = &left_11;
    var right_12: c_int = undefined;
    _ = &right_12;
    var run_13: c_int = undefined;
    _ = &run_13;
    var start_14: c_int = undefined;
    _ = &start_14;
    var len_15: c_int = undefined;
    _ = &len_15;
    var startcol_16: c_int = undefined;
    _ = &startcol_16;
    var linecount_17: c_int = undefined;
    _ = &linecount_17;
    var ofs_18: c_int = undefined;
    _ = &ofs_18;
    var left_19: c_int = undefined;
    _ = &left_19;
    var right_20: c_int = undefined;
    _ = &right_20;
    var run_21: c_int = undefined;
    _ = &run_21;
    var start_22: c_int = undefined;
    _ = &start_22;
    var len_23: c_int = undefined;
    _ = &len_23;
    var startcol_24: c_int = undefined;
    _ = &startcol_24;
    var linecount_25: c_int = undefined;
    _ = &linecount_25;
    var ofs_26: c_int = undefined;
    _ = &ofs_26;
    var left_27: c_int = undefined;
    _ = &left_27;
    var right_28: c_int = undefined;
    _ = &right_28;
    var run_29: c_int = undefined;
    _ = &run_29;
    var start_30: c_int = undefined;
    _ = &start_30;
    var len_31: c_int = undefined;
    _ = &len_31;
    var startcol_32: c_int = undefined;
    _ = &startcol_32;
    var n: c_uint = undefined;
    _ = &n;
    var src: [*c]Uint16 = undefined;
    _ = &src;
    var dst: [*c]Uint16 = undefined;
    _ = &dst;
    var s: Uint32 = undefined;
    _ = &s;
    var d: Uint32 = undefined;
    _ = &d;
    var s_33: Uint32 = undefined;
    _ = &s_33;
    var d_34: Uint32 = undefined;
    _ = &d_34;
    var s_35: Uint32 = undefined;
    _ = &s_35;
    var d_36: Uint32 = undefined;
    _ = &d_36;
    var s_37: Uint32 = undefined;
    _ = &s_37;
    var d_38: Uint32 = undefined;
    _ = &d_38;
    var linecount_39: c_int = undefined;
    _ = &linecount_39;
    var ofs_40: c_int = undefined;
    _ = &ofs_40;
    var left_41: c_int = undefined;
    _ = &left_41;
    var right_42: c_int = undefined;
    _ = &right_42;
    var run_43: c_int = undefined;
    _ = &run_43;
    var start_44: c_int = undefined;
    _ = &start_44;
    var len_45: c_int = undefined;
    _ = &len_45;
    var startcol_46: c_int = undefined;
    _ = &startcol_46;
    var i: c_int = undefined;
    _ = &i;
    var src_47: [*c]Uint16 = undefined;
    _ = &src_47;
    var dst_48: [*c]Uint16 = undefined;
    _ = &dst_48;
    var ALPHA: Uint32 = undefined;
    _ = &ALPHA;
    var s_49: Uint32 = undefined;
    _ = &s_49;
    var d_50: Uint32 = undefined;
    _ = &d_50;
    var linecount_51: c_int = undefined;
    _ = &linecount_51;
    var ofs_52: c_int = undefined;
    _ = &ofs_52;
    var left_53: c_int = undefined;
    _ = &left_53;
    var right_54: c_int = undefined;
    _ = &right_54;
    var run_55: c_int = undefined;
    _ = &run_55;
    var start_56: c_int = undefined;
    _ = &start_56;
    var len_57: c_int = undefined;
    _ = &len_57;
    var startcol_58: c_int = undefined;
    _ = &startcol_58;
    var n_59: c_uint = undefined;
    _ = &n_59;
    var src_60: [*c]Uint16 = undefined;
    _ = &src_60;
    var dst_61: [*c]Uint16 = undefined;
    _ = &dst_61;
    var s_62: Uint32 = undefined;
    _ = &s_62;
    var d_63: Uint32 = undefined;
    _ = &d_63;
    var s_64: Uint32 = undefined;
    _ = &s_64;
    var d_65: Uint32 = undefined;
    _ = &d_65;
    var s_66: Uint32 = undefined;
    _ = &s_66;
    var d_67: Uint32 = undefined;
    _ = &d_67;
    var s_68: Uint32 = undefined;
    _ = &s_68;
    var d_69: Uint32 = undefined;
    _ = &d_69;
    var linecount_70: c_int = undefined;
    _ = &linecount_70;
    var ofs_71: c_int = undefined;
    _ = &ofs_71;
    var left_72: c_int = undefined;
    _ = &left_72;
    var right_73: c_int = undefined;
    _ = &right_73;
    var run_74: c_int = undefined;
    _ = &run_74;
    var start_75: c_int = undefined;
    _ = &start_75;
    var len_76: c_int = undefined;
    _ = &len_76;
    var startcol_77: c_int = undefined;
    _ = &startcol_77;
    var i_78: c_int = undefined;
    _ = &i_78;
    var src_79: [*c]Uint16 = undefined;
    _ = &src_79;
    var dst_80: [*c]Uint16 = undefined;
    _ = &dst_80;
    var ALPHA_81: Uint32 = undefined;
    _ = &ALPHA_81;
    var s_82: Uint32 = undefined;
    _ = &s_82;
    var d_83: Uint32 = undefined;
    _ = &d_83;
    var linecount_84: c_int = undefined;
    _ = &linecount_84;
    var ofs_85: c_int = undefined;
    _ = &ofs_85;
    var left_86: c_int = undefined;
    _ = &left_86;
    var right_87: c_int = undefined;
    _ = &right_87;
    var run_88: c_int = undefined;
    _ = &run_88;
    var start_89: c_int = undefined;
    _ = &start_89;
    var len_90: c_int = undefined;
    _ = &len_90;
    var startcol_91: c_int = undefined;
    _ = &startcol_91;
    var i_92: c_int = undefined;
    _ = &i_92;
    var src_93: [*c]Uint8 = undefined;
    _ = &src_93;
    var dst_94: [*c]Uint8 = undefined;
    _ = &dst_94;
    var s_95: Uint32 = undefined;
    _ = &s_95;
    var d_96: Uint32 = undefined;
    _ = &d_96;
    var rs: c_uint = undefined;
    _ = &rs;
    var gs: c_uint = undefined;
    _ = &gs;
    var bs: c_uint = undefined;
    _ = &bs;
    var rd: c_uint = undefined;
    _ = &rd;
    var gd: c_uint = undefined;
    _ = &gd;
    var bd: c_uint = undefined;
    _ = &bd;
    var linecount_97: c_int = undefined;
    _ = &linecount_97;
    var ofs_98: c_int = undefined;
    _ = &ofs_98;
    var left_99: c_int = undefined;
    _ = &left_99;
    var right_100: c_int = undefined;
    _ = &right_100;
    var run_101: c_int = undefined;
    _ = &run_101;
    var start_102: c_int = undefined;
    _ = &start_102;
    var len_103: c_int = undefined;
    _ = &len_103;
    var startcol_104: c_int = undefined;
    _ = &startcol_104;
    var i_105: c_int = undefined;
    _ = &i_105;
    var src_106: [*c]Uint8 = undefined;
    _ = &src_106;
    var dst_107: [*c]Uint8 = undefined;
    _ = &dst_107;
    var s_108: Uint32 = undefined;
    _ = &s_108;
    var d_109: Uint32 = undefined;
    _ = &d_109;
    var rs_110: c_uint = undefined;
    _ = &rs_110;
    var gs_111: c_uint = undefined;
    _ = &gs_111;
    var bs_112: c_uint = undefined;
    _ = &bs_112;
    var rd_113: c_uint = undefined;
    _ = &rd_113;
    var gd_114: c_uint = undefined;
    _ = &gd_114;
    var bd_115: c_uint = undefined;
    _ = &bd_115;
    var linecount_116: c_int = undefined;
    _ = &linecount_116;
    var ofs_117: c_int = undefined;
    _ = &ofs_117;
    var left_118: c_int = undefined;
    _ = &left_118;
    var right_119: c_int = undefined;
    _ = &right_119;
    var run_120: c_int = undefined;
    _ = &run_120;
    var start_121: c_int = undefined;
    _ = &start_121;
    var len_122: c_int = undefined;
    _ = &len_122;
    var startcol_123: c_int = undefined;
    _ = &startcol_123;
    var i_124: c_int = undefined;
    _ = &i_124;
    var src_125: [*c]Uint32 = undefined;
    _ = &src_125;
    var dst_126: [*c]Uint32 = undefined;
    _ = &dst_126;
    var s_127: Uint32 = undefined;
    _ = &s_127;
    var d_128: Uint32 = undefined;
    _ = &d_128;
    var linecount_129: c_int = undefined;
    _ = &linecount_129;
    var ofs_130: c_int = undefined;
    _ = &ofs_130;
    var left_131: c_int = undefined;
    _ = &left_131;
    var right_132: c_int = undefined;
    _ = &right_132;
    var run_133: c_int = undefined;
    _ = &run_133;
    var start_134: c_int = undefined;
    _ = &start_134;
    var len_135: c_int = undefined;
    _ = &len_135;
    var startcol_136: c_int = undefined;
    _ = &startcol_136;
    var i_137: c_int = undefined;
    _ = &i_137;
    var src_138: [*c]Uint32 = undefined;
    _ = &src_138;
    var dst_139: [*c]Uint32 = undefined;
    _ = &dst_139;
    var s_140: Uint32 = undefined;
    _ = &s_140;
    var d_141: Uint32 = undefined;
    _ = &d_141;
    var s1: Uint32 = undefined;
    _ = &s1;
    var d1: Uint32 = undefined;
    _ = &d1;
    var linecount_142: c_int = undefined;
    _ = &linecount_142;
    var ofs_143: c_int = undefined;
    _ = &ofs_143;
    var left_144: c_int = undefined;
    _ = &left_144;
    var right_145: c_int = undefined;
    _ = &right_145;
    var run_146: c_int = undefined;
    _ = &run_146;
    var start_147: c_int = undefined;
    _ = &start_147;
    var len_148: c_int = undefined;
    _ = &len_148;
    var startcol_149: c_int = undefined;
    _ = &startcol_149;
    var i_150: c_int = undefined;
    _ = &i_150;
    var src_151: [*c]Uint8 = undefined;
    _ = &src_151;
    var dst_152: [*c]Uint8 = undefined;
    _ = &dst_152;
    var s_153: Uint32 = undefined;
    _ = &s_153;
    var d_154: Uint32 = undefined;
    _ = &d_154;
    var rs_155: c_uint = undefined;
    _ = &rs_155;
    var gs_156: c_uint = undefined;
    _ = &gs_156;
    var bs_157: c_uint = undefined;
    _ = &bs_157;
    var rd_158: c_uint = undefined;
    _ = &rd_158;
    var gd_159: c_uint = undefined;
    _ = &gd_159;
    var bd_160: c_uint = undefined;
    _ = &bd_160;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                fmt = surf_dst.*.fmt;
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            1 => {
                srcbuf += @as(usize, @bitCast(@as(isize, @intCast(run * @as(c_int, 1)))));
                ofs += run;
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            2 => {
                srcbuf += @as(usize, @bitCast(@as(isize, @intCast(run_5 * @as(c_int, 2)))));
                ofs_2 += run_5;
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            3 => {
                srcbuf += @as(usize, @bitCast(@as(isize, @intCast(run_13 * @as(c_int, 3)))));
                ofs_10 += run_13;
                {
                    sdl_pc = 96;
                    continue;
                }
            },
            4 => {
                srcbuf += @as(usize, @bitCast(@as(isize, @intCast(run_21 * @as(c_int, 4)))));
                ofs_18 += run_21;
                {
                    sdl_pc = 128;
                    continue;
                }
            },
            5 => {
                srcbuf += @as(usize, @bitCast(@as(isize, @intCast(run_29 * @as(c_int, 2)))));
                ofs_26 += run_29;
                {
                    sdl_pc = 170;
                    continue;
                }
            },
            6 => {
                srcbuf += @as(usize, @bitCast(@as(isize, @intCast(run_43 * @as(c_int, 2)))));
                ofs_40 += run_43;
                {
                    sdl_pc = 229;
                    continue;
                }
            },
            7 => {
                srcbuf += @as(usize, @bitCast(@as(isize, @intCast(run_55 * @as(c_int, 2)))));
                ofs_52 += run_55;
                {
                    sdl_pc = 274;
                    continue;
                }
            },
            8 => {
                srcbuf += @as(usize, @bitCast(@as(isize, @intCast(run_74 * @as(c_int, 2)))));
                ofs_71 += run_74;
                {
                    sdl_pc = 333;
                    continue;
                }
            },
            9 => {
                {
                    sdl_pc = 363;
                    continue;
                }
            },
            10 => {
                srcbuf += @as(usize, @bitCast(@as(isize, @intCast(run_88 * @as(c_int, 2)))));
                ofs_85 += run_88;
                {
                    sdl_pc = 372;
                    continue;
                }
            },
            11 => {
                srcbuf += @as(usize, @bitCast(@as(isize, @intCast(run_101 * @as(c_int, 3)))));
                ofs_98 += run_101;
                {
                    sdl_pc = 419;
                    continue;
                }
            },
            12 => {
                srcbuf += @as(usize, @bitCast(@as(isize, @intCast(run_120 * @as(c_int, 4)))));
                ofs_117 += run_120;
                {
                    sdl_pc = 472;
                    continue;
                }
            },
            13 => {
                srcbuf += @as(usize, @bitCast(@as(isize, @intCast(run_133 * @as(c_int, 4)))));
                ofs_130 += run_133;
                {
                    sdl_pc = 510;
                    continue;
                }
            },
            14 => {
                srcbuf += @as(usize, @bitCast(@as(isize, @intCast(run_146 * @as(c_int, 4)))));
                ofs_143 += run_146;
                {
                    sdl_pc = 548;
                    continue;
                }
            },
            15 => {
                if (alpha == @as(c_uint, 255)) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            16 => {
                if (false) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            17 => {
                {}
            },
            18 => {
                switch (@as(c_int, fmt.*.bytes_per_pixel)) {
                    @as(c_int, 1) => {
                        sdl_pc = 22;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 54;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 86;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 118;
                        continue;
                    },
                    else => {
                        sdl_pc = 21;
                        continue;
                    },
                }
            },
            19 => {
                switch (@as(c_int, fmt.*.bytes_per_pixel)) {
                    @as(c_int, 1) => {
                        sdl_pc = 151;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 152;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 409;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 456;
                        continue;
                    },
                    else => {
                        sdl_pc = 150;
                        continue;
                    },
                }
            },
            20 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            21 => {
                {
                    sdl_pc = 20;
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
                linecount = srcrect.*.h;
                ofs = 0;
                left = srcrect.*.x;
                right = left + srcrect.*.w;
                dstbuf -= @as(usize, @bitCast(@as(isize, @intCast(left * @as(c_int, 1)))));
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            24 => {
                if (false) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            25 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            26 => {
                if (true) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 29;
                    continue;
                }
            },
            27 => {
                ofs += srcbuf.*;
                run = srcbuf[@as(c_int, 1)];
                srcbuf += @as(c_ulong, 2) *% @sizeOf(Uint8);
                if (run != 0) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            28 => {
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            29 => {
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            30 => {
                if (ofs < right) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 34;
                    continue;
                }
            },
            31 => {
                if (!(ofs != 0)) {
                    sdl_pc = 45;
                    continue;
                } else {
                    sdl_pc = 46;
                    continue;
                }
            },
            32 => {
                if (ofs == w) {
                    sdl_pc = 48;
                    continue;
                } else {
                    sdl_pc = 49;
                    continue;
                }
            },
            33 => {
                start = 0;
                len = run;
                if ((left - ofs) > @as(c_int, 0)) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 37;
                    continue;
                }
            },
            34 => {
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            35 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            36 => {
                start = left - ofs;
                len -= start;
                if (len <= @as(c_int, 0)) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 40;
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
                startcol = ofs + start;
                if (len > (right - startcol)) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 43;
                    continue;
                }
            },
            39 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            40 => {
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            41 => {
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            42 => {
                len = right - startcol;
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            43 => {
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            44 => {
                _ = memcpy(@ptrCast(@alignCast(dstbuf + @as(usize, @bitCast(@as(isize, @intCast(startcol * @as(c_int, 1))))))), @ptrCast(@alignCast(srcbuf + @as(usize, @bitCast(@as(isize, @intCast(start * @as(c_int, 1))))))), @as(usize, @bitCast(@as(c_long, len))) *% @as(usize, @bitCast(@as(c_long, @as(c_int, 1)))));
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            45 => {
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            46 => {
                {
                    sdl_pc = 47;
                    continue;
                }
            },
            47 => {
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            48 => {
                ofs = 0;
                dstbuf += @as(usize, @bitCast(@as(isize, @intCast(surf_dst.*.pitch))));
                if (!((blk: {
                    const ref = &linecount;
                    ref.* -= 1;
                    break :blk ref.*;
                }) != 0)) {
                    sdl_pc = 51;
                    continue;
                } else {
                    sdl_pc = 52;
                    continue;
                }
            },
            49 => {
                {
                    sdl_pc = 50;
                    continue;
                }
            },
            50 => {
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            51 => {
                {
                    sdl_pc = 29;
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
                {
                    sdl_pc = 50;
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
                linecount_1 = srcrect.*.h;
                ofs_2 = 0;
                left_3 = srcrect.*.x;
                right_4 = left_3 + srcrect.*.w;
                dstbuf -= @as(usize, @bitCast(@as(isize, @intCast(left_3 * @as(c_int, 2)))));
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            56 => {
                if (false) {
                    sdl_pc = 55;
                    continue;
                } else {
                    sdl_pc = 57;
                    continue;
                }
            },
            57 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            58 => {
                if (true) {
                    sdl_pc = 59;
                    continue;
                } else {
                    sdl_pc = 61;
                    continue;
                }
            },
            59 => {
                ofs_2 += srcbuf.*;
                run_5 = srcbuf[@as(c_int, 1)];
                srcbuf += @as(c_ulong, 2) *% @sizeOf(Uint8);
                if (run_5 != 0) {
                    sdl_pc = 62;
                    continue;
                } else {
                    sdl_pc = 63;
                    continue;
                }
            },
            60 => {
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            61 => {
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            62 => {
                if (ofs_2 < right_4) {
                    sdl_pc = 65;
                    continue;
                } else {
                    sdl_pc = 66;
                    continue;
                }
            },
            63 => {
                if (!(ofs_2 != 0)) {
                    sdl_pc = 77;
                    continue;
                } else {
                    sdl_pc = 78;
                    continue;
                }
            },
            64 => {
                if (ofs_2 == w) {
                    sdl_pc = 80;
                    continue;
                } else {
                    sdl_pc = 81;
                    continue;
                }
            },
            65 => {
                start_6 = 0;
                len_7 = run_5;
                if ((left_3 - ofs_2) > @as(c_int, 0)) {
                    sdl_pc = 68;
                    continue;
                } else {
                    sdl_pc = 69;
                    continue;
                }
            },
            66 => {
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            67 => {
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            68 => {
                start_6 = left_3 - ofs_2;
                len_7 -= start_6;
                if (len_7 <= @as(c_int, 0)) {
                    sdl_pc = 71;
                    continue;
                } else {
                    sdl_pc = 72;
                    continue;
                }
            },
            69 => {
                {
                    sdl_pc = 70;
                    continue;
                }
            },
            70 => {
                startcol_8 = ofs_2 + start_6;
                if (len_7 > (right_4 - startcol_8)) {
                    sdl_pc = 74;
                    continue;
                } else {
                    sdl_pc = 75;
                    continue;
                }
            },
            71 => {
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            72 => {
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            73 => {
                {
                    sdl_pc = 70;
                    continue;
                }
            },
            74 => {
                len_7 = right_4 - startcol_8;
                {
                    sdl_pc = 76;
                    continue;
                }
            },
            75 => {
                {
                    sdl_pc = 76;
                    continue;
                }
            },
            76 => {
                _ = memcpy(@ptrCast(@alignCast(dstbuf + @as(usize, @bitCast(@as(isize, @intCast(startcol_8 * @as(c_int, 2))))))), @ptrCast(@alignCast(srcbuf + @as(usize, @bitCast(@as(isize, @intCast(start_6 * @as(c_int, 2))))))), @as(usize, @bitCast(@as(c_long, len_7))) *% @as(usize, @bitCast(@as(c_long, @as(c_int, 2)))));
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            77 => {
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            78 => {
                {
                    sdl_pc = 79;
                    continue;
                }
            },
            79 => {
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            80 => {
                ofs_2 = 0;
                dstbuf += @as(usize, @bitCast(@as(isize, @intCast(surf_dst.*.pitch))));
                if (!((blk: {
                    const ref = &linecount_1;
                    ref.* -= 1;
                    break :blk ref.*;
                }) != 0)) {
                    sdl_pc = 83;
                    continue;
                } else {
                    sdl_pc = 84;
                    continue;
                }
            },
            81 => {
                {
                    sdl_pc = 82;
                    continue;
                }
            },
            82 => {
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            83 => {
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            84 => {
                {
                    sdl_pc = 85;
                    continue;
                }
            },
            85 => {
                {
                    sdl_pc = 82;
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
                linecount_9 = srcrect.*.h;
                ofs_10 = 0;
                left_11 = srcrect.*.x;
                right_12 = left_11 + srcrect.*.w;
                dstbuf -= @as(usize, @bitCast(@as(isize, @intCast(left_11 * @as(c_int, 3)))));
                {
                    sdl_pc = 90;
                    continue;
                }
            },
            88 => {
                if (false) {
                    sdl_pc = 87;
                    continue;
                } else {
                    sdl_pc = 89;
                    continue;
                }
            },
            89 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            90 => {
                if (true) {
                    sdl_pc = 91;
                    continue;
                } else {
                    sdl_pc = 93;
                    continue;
                }
            },
            91 => {
                ofs_10 += srcbuf.*;
                run_13 = srcbuf[@as(c_int, 1)];
                srcbuf += @as(c_ulong, 2) *% @sizeOf(Uint8);
                if (run_13 != 0) {
                    sdl_pc = 94;
                    continue;
                } else {
                    sdl_pc = 95;
                    continue;
                }
            },
            92 => {
                {
                    sdl_pc = 90;
                    continue;
                }
            },
            93 => {
                {
                    sdl_pc = 88;
                    continue;
                }
            },
            94 => {
                if (ofs_10 < right_12) {
                    sdl_pc = 97;
                    continue;
                } else {
                    sdl_pc = 98;
                    continue;
                }
            },
            95 => {
                if (!(ofs_10 != 0)) {
                    sdl_pc = 109;
                    continue;
                } else {
                    sdl_pc = 110;
                    continue;
                }
            },
            96 => {
                if (ofs_10 == w) {
                    sdl_pc = 112;
                    continue;
                } else {
                    sdl_pc = 113;
                    continue;
                }
            },
            97 => {
                start_14 = 0;
                len_15 = run_13;
                if ((left_11 - ofs_10) > @as(c_int, 0)) {
                    sdl_pc = 100;
                    continue;
                } else {
                    sdl_pc = 101;
                    continue;
                }
            },
            98 => {
                {
                    sdl_pc = 99;
                    continue;
                }
            },
            99 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            100 => {
                start_14 = left_11 - ofs_10;
                len_15 -= start_14;
                if (len_15 <= @as(c_int, 0)) {
                    sdl_pc = 103;
                    continue;
                } else {
                    sdl_pc = 104;
                    continue;
                }
            },
            101 => {
                {
                    sdl_pc = 102;
                    continue;
                }
            },
            102 => {
                startcol_16 = ofs_10 + start_14;
                if (len_15 > (right_12 - startcol_16)) {
                    sdl_pc = 106;
                    continue;
                } else {
                    sdl_pc = 107;
                    continue;
                }
            },
            103 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            104 => {
                {
                    sdl_pc = 105;
                    continue;
                }
            },
            105 => {
                {
                    sdl_pc = 102;
                    continue;
                }
            },
            106 => {
                len_15 = right_12 - startcol_16;
                {
                    sdl_pc = 108;
                    continue;
                }
            },
            107 => {
                {
                    sdl_pc = 108;
                    continue;
                }
            },
            108 => {
                _ = memcpy(@ptrCast(@alignCast(dstbuf + @as(usize, @bitCast(@as(isize, @intCast(startcol_16 * @as(c_int, 3))))))), @ptrCast(@alignCast(srcbuf + @as(usize, @bitCast(@as(isize, @intCast(start_14 * @as(c_int, 3))))))), @as(usize, @bitCast(@as(c_long, len_15))) *% @as(usize, @bitCast(@as(c_long, @as(c_int, 3)))));
                {
                    sdl_pc = 99;
                    continue;
                }
            },
            109 => {
                {
                    sdl_pc = 93;
                    continue;
                }
            },
            110 => {
                {
                    sdl_pc = 111;
                    continue;
                }
            },
            111 => {
                {
                    sdl_pc = 96;
                    continue;
                }
            },
            112 => {
                ofs_10 = 0;
                dstbuf += @as(usize, @bitCast(@as(isize, @intCast(surf_dst.*.pitch))));
                if (!((blk: {
                    const ref = &linecount_9;
                    ref.* -= 1;
                    break :blk ref.*;
                }) != 0)) {
                    sdl_pc = 115;
                    continue;
                } else {
                    sdl_pc = 116;
                    continue;
                }
            },
            113 => {
                {
                    sdl_pc = 114;
                    continue;
                }
            },
            114 => {
                {
                    sdl_pc = 92;
                    continue;
                }
            },
            115 => {
                {
                    sdl_pc = 93;
                    continue;
                }
            },
            116 => {
                {
                    sdl_pc = 117;
                    continue;
                }
            },
            117 => {
                {
                    sdl_pc = 114;
                    continue;
                }
            },
            118 => {
                {
                    sdl_pc = 119;
                    continue;
                }
            },
            119 => {
                linecount_17 = srcrect.*.h;
                ofs_18 = 0;
                left_19 = srcrect.*.x;
                right_20 = left_19 + srcrect.*.w;
                dstbuf -= @as(usize, @bitCast(@as(isize, @intCast(left_19 * @as(c_int, 4)))));
                {
                    sdl_pc = 122;
                    continue;
                }
            },
            120 => {
                if (false) {
                    sdl_pc = 119;
                    continue;
                } else {
                    sdl_pc = 121;
                    continue;
                }
            },
            121 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            122 => {
                if (true) {
                    sdl_pc = 123;
                    continue;
                } else {
                    sdl_pc = 125;
                    continue;
                }
            },
            123 => {
                ofs_18 += @as([*c]Uint16, @ptrCast(@alignCast(srcbuf))).*;
                run_21 = @as([*c]Uint16, @ptrCast(@alignCast(srcbuf)))[@as(c_int, 1)];
                srcbuf += @as(c_ulong, 2) *% @sizeOf(Uint16);
                if (run_21 != 0) {
                    sdl_pc = 126;
                    continue;
                } else {
                    sdl_pc = 127;
                    continue;
                }
            },
            124 => {
                {
                    sdl_pc = 122;
                    continue;
                }
            },
            125 => {
                {
                    sdl_pc = 120;
                    continue;
                }
            },
            126 => {
                if (ofs_18 < right_20) {
                    sdl_pc = 129;
                    continue;
                } else {
                    sdl_pc = 130;
                    continue;
                }
            },
            127 => {
                if (!(ofs_18 != 0)) {
                    sdl_pc = 141;
                    continue;
                } else {
                    sdl_pc = 142;
                    continue;
                }
            },
            128 => {
                if (ofs_18 == w) {
                    sdl_pc = 144;
                    continue;
                } else {
                    sdl_pc = 145;
                    continue;
                }
            },
            129 => {
                start_22 = 0;
                len_23 = run_21;
                if ((left_19 - ofs_18) > @as(c_int, 0)) {
                    sdl_pc = 132;
                    continue;
                } else {
                    sdl_pc = 133;
                    continue;
                }
            },
            130 => {
                {
                    sdl_pc = 131;
                    continue;
                }
            },
            131 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            132 => {
                start_22 = left_19 - ofs_18;
                len_23 -= start_22;
                if (len_23 <= @as(c_int, 0)) {
                    sdl_pc = 135;
                    continue;
                } else {
                    sdl_pc = 136;
                    continue;
                }
            },
            133 => {
                {
                    sdl_pc = 134;
                    continue;
                }
            },
            134 => {
                startcol_24 = ofs_18 + start_22;
                if (len_23 > (right_20 - startcol_24)) {
                    sdl_pc = 138;
                    continue;
                } else {
                    sdl_pc = 139;
                    continue;
                }
            },
            135 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            136 => {
                {
                    sdl_pc = 137;
                    continue;
                }
            },
            137 => {
                {
                    sdl_pc = 134;
                    continue;
                }
            },
            138 => {
                len_23 = right_20 - startcol_24;
                {
                    sdl_pc = 140;
                    continue;
                }
            },
            139 => {
                {
                    sdl_pc = 140;
                    continue;
                }
            },
            140 => {
                _ = memcpy(@ptrCast(@alignCast(dstbuf + @as(usize, @bitCast(@as(isize, @intCast(startcol_24 * @as(c_int, 4))))))), @ptrCast(@alignCast(srcbuf + @as(usize, @bitCast(@as(isize, @intCast(start_22 * @as(c_int, 4))))))), @as(usize, @bitCast(@as(c_long, len_23))) *% @as(usize, @bitCast(@as(c_long, @as(c_int, 4)))));
                {
                    sdl_pc = 131;
                    continue;
                }
            },
            141 => {
                {
                    sdl_pc = 125;
                    continue;
                }
            },
            142 => {
                {
                    sdl_pc = 143;
                    continue;
                }
            },
            143 => {
                {
                    sdl_pc = 128;
                    continue;
                }
            },
            144 => {
                ofs_18 = 0;
                dstbuf += @as(usize, @bitCast(@as(isize, @intCast(surf_dst.*.pitch))));
                if (!((blk: {
                    const ref = &linecount_17;
                    ref.* -= 1;
                    break :blk ref.*;
                }) != 0)) {
                    sdl_pc = 147;
                    continue;
                } else {
                    sdl_pc = 148;
                    continue;
                }
            },
            145 => {
                {
                    sdl_pc = 146;
                    continue;
                }
            },
            146 => {
                {
                    sdl_pc = 124;
                    continue;
                }
            },
            147 => {
                {
                    sdl_pc = 125;
                    continue;
                }
            },
            148 => {
                {
                    sdl_pc = 149;
                    continue;
                }
            },
            149 => {
                {
                    sdl_pc = 146;
                    continue;
                }
            },
            150 => {
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            151 => {
                {
                    sdl_pc = 150;
                    continue;
                }
            },
            152 => {
                switch ((fmt.*.Rmask | fmt.*.Gmask) | fmt.*.Bmask) {
                    @as(Uint32, 65535) => {
                        sdl_pc = 154;
                        continue;
                    },
                    @as(Uint32, 32767) => {
                        sdl_pc = 258;
                        continue;
                    },
                    else => {
                        sdl_pc = 362;
                        continue;
                    },
                }
            },
            153 => {
                {
                    sdl_pc = 150;
                    continue;
                }
            },
            154 => {
                if (((fmt.*.Gmask == @as(Uint32, 2016)) or (fmt.*.Rmask == @as(Uint32, 2016))) or (fmt.*.Bmask == @as(Uint32, 2016))) {
                    sdl_pc = 155;
                    continue;
                } else {
                    sdl_pc = 156;
                    continue;
                }
            },
            155 => {
                if (alpha == @as(c_uint, 128)) {
                    sdl_pc = 158;
                    continue;
                } else {
                    sdl_pc = 159;
                    continue;
                }
            },
            156 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            157 => {
                {
                    sdl_pc = 153;
                    continue;
                }
            },
            158 => {
                {
                    sdl_pc = 161;
                    continue;
                }
            },
            159 => {
                {
                    sdl_pc = 220;
                    continue;
                }
            },
            160 => {
                {
                    sdl_pc = 157;
                    continue;
                }
            },
            161 => {
                linecount_25 = srcrect.*.h;
                ofs_26 = 0;
                left_27 = srcrect.*.x;
                right_28 = left_27 + srcrect.*.w;
                dstbuf -= @as(usize, @bitCast(@as(isize, @intCast(left_27 * @as(c_int, 2)))));
                {
                    sdl_pc = 164;
                    continue;
                }
            },
            162 => {
                if (false) {
                    sdl_pc = 161;
                    continue;
                } else {
                    sdl_pc = 163;
                    continue;
                }
            },
            163 => {
                {
                    sdl_pc = 160;
                    continue;
                }
            },
            164 => {
                if (true) {
                    sdl_pc = 165;
                    continue;
                } else {
                    sdl_pc = 167;
                    continue;
                }
            },
            165 => {
                ofs_26 += srcbuf.*;
                run_29 = srcbuf[@as(c_int, 1)];
                srcbuf += @as(c_ulong, 2) *% @sizeOf(Uint8);
                if (run_29 != 0) {
                    sdl_pc = 168;
                    continue;
                } else {
                    sdl_pc = 169;
                    continue;
                }
            },
            166 => {
                {
                    sdl_pc = 164;
                    continue;
                }
            },
            167 => {
                {
                    sdl_pc = 162;
                    continue;
                }
            },
            168 => {
                if (ofs_26 < right_28) {
                    sdl_pc = 171;
                    continue;
                } else {
                    sdl_pc = 172;
                    continue;
                }
            },
            169 => {
                if (!(ofs_26 != 0)) {
                    sdl_pc = 211;
                    continue;
                } else {
                    sdl_pc = 212;
                    continue;
                }
            },
            170 => {
                if (ofs_26 == w) {
                    sdl_pc = 214;
                    continue;
                } else {
                    sdl_pc = 215;
                    continue;
                }
            },
            171 => {
                start_30 = 0;
                len_31 = run_29;
                if ((left_27 - ofs_26) > @as(c_int, 0)) {
                    sdl_pc = 174;
                    continue;
                } else {
                    sdl_pc = 175;
                    continue;
                }
            },
            172 => {
                {
                    sdl_pc = 173;
                    continue;
                }
            },
            173 => {
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            174 => {
                start_30 = left_27 - ofs_26;
                len_31 -= start_30;
                if (len_31 <= @as(c_int, 0)) {
                    sdl_pc = 177;
                    continue;
                } else {
                    sdl_pc = 178;
                    continue;
                }
            },
            175 => {
                {
                    sdl_pc = 176;
                    continue;
                }
            },
            176 => {
                startcol_32 = ofs_26 + start_30;
                if (len_31 > (right_28 - startcol_32)) {
                    sdl_pc = 180;
                    continue;
                } else {
                    sdl_pc = 181;
                    continue;
                }
            },
            177 => {
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            178 => {
                {
                    sdl_pc = 179;
                    continue;
                }
            },
            179 => {
                {
                    sdl_pc = 176;
                    continue;
                }
            },
            180 => {
                len_31 = right_28 - startcol_32;
                {
                    sdl_pc = 182;
                    continue;
                }
            },
            181 => {
                {
                    sdl_pc = 182;
                    continue;
                }
            },
            182 => {
                {
                    sdl_pc = 183;
                    continue;
                }
            },
            183 => {
                n = @bitCast(@as(c_int, len_31));
                src = @ptrCast(@alignCast(srcbuf + @as(usize, @bitCast(@as(isize, @intCast(start_30 * @as(c_int, 2)))))));
                dst = @ptrCast(@alignCast(dstbuf + @as(usize, @bitCast(@as(isize, @intCast(startcol_32 * @as(c_int, 2)))))));
                if (((@as(usize, @intCast(@intFromPtr(src))) ^ @as(usize, @intCast(@intFromPtr(dst)))) & @as(usize, 3)) != 0) {
                    sdl_pc = 186;
                    continue;
                } else {
                    sdl_pc = 187;
                    continue;
                }
            },
            184 => {
                if (false) {
                    sdl_pc = 183;
                    continue;
                } else {
                    sdl_pc = 185;
                    continue;
                }
            },
            185 => {
                {
                    sdl_pc = 173;
                    continue;
                }
            },
            186 => {
                {
                    sdl_pc = 189;
                    continue;
                }
            },
            187 => {
                if ((@as(usize, @intCast(@intFromPtr(src))) & @as(usize, 3)) != 0) {
                    sdl_pc = 195;
                    continue;
                } else {
                    sdl_pc = 196;
                    continue;
                }
            },
            188 => {
                {
                    sdl_pc = 184;
                    continue;
                }
            },
            189 => {
                if ((blk: {
                    const ref = &n;
                    const tmp = ref.*;
                    ref.* -%= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 190;
                    continue;
                } else {
                    sdl_pc = 191;
                    continue;
                }
            },
            190 => {
                {
                    sdl_pc = 192;
                    continue;
                }
            },
            191 => {
                {
                    sdl_pc = 188;
                    continue;
                }
            },
            192 => {
                s = (blk: {
                    const ref = &src;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                d = dst.*;
                (blk: {
                    const ref = &dst;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @truncate((((s & @as(c_uint, 63454)) +% (d & @as(c_uint, 63454))) >> @intCast(@as(Uint32, 1))) +% ((s & d) & (~@as(c_uint, 63454) & @as(c_uint, 65535))));
                {
                    sdl_pc = 193;
                    continue;
                }
            },
            193 => {
                if (false) {
                    sdl_pc = 192;
                    continue;
                } else {
                    sdl_pc = 194;
                    continue;
                }
            },
            194 => {
                {
                    sdl_pc = 189;
                    continue;
                }
            },
            195 => {
                {
                    sdl_pc = 198;
                    continue;
                }
            },
            196 => {
                {
                    sdl_pc = 197;
                    continue;
                }
            },
            197 => {
                {
                    sdl_pc = 201;
                    continue;
                }
            },
            198 => {
                s_33 = (blk: {
                    const ref = &src;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                d_34 = dst.*;
                (blk: {
                    const ref = &dst;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @truncate((((s_33 & @as(c_uint, 63454)) +% (d_34 & @as(c_uint, 63454))) >> @intCast(@as(Uint32, 1))) +% ((s_33 & d_34) & (~@as(c_uint, 63454) & @as(c_uint, 65535))));
                {
                    sdl_pc = 199;
                    continue;
                }
            },
            199 => {
                if (false) {
                    sdl_pc = 198;
                    continue;
                } else {
                    sdl_pc = 200;
                    continue;
                }
            },
            200 => {
                n -%= 1;
                {
                    sdl_pc = 197;
                    continue;
                }
            },
            201 => {
                if (n > @as(c_uint, 1)) {
                    sdl_pc = 202;
                    continue;
                } else {
                    sdl_pc = 204;
                    continue;
                }
            },
            202 => {
                s_35 = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
                d_36 = @as([*c]Uint32, @ptrCast(@alignCast(dst))).*;
                @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = (((s_35 & (@as(c_uint, 63454) | (@as(c_uint, 63454) << @intCast(@as(c_uint, 16))))) >> @intCast(@as(Uint32, 1))) +% ((d_36 & (@as(c_uint, 63454) | (@as(c_uint, 63454) << @intCast(@as(c_uint, 16))))) >> @intCast(@as(Uint32, 1)))) +% ((s_35 & d_36) & ~(@as(c_uint, 63454) | (@as(c_uint, 63454) << @intCast(@as(c_uint, 16)))));
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                {
                    sdl_pc = 203;
                    continue;
                }
            },
            203 => {
                n -%= 2;
                {
                    sdl_pc = 201;
                    continue;
                }
            },
            204 => {
                if (n != 0) {
                    sdl_pc = 205;
                    continue;
                } else {
                    sdl_pc = 206;
                    continue;
                }
            },
            205 => {
                {
                    sdl_pc = 208;
                    continue;
                }
            },
            206 => {
                {
                    sdl_pc = 207;
                    continue;
                }
            },
            207 => {
                {
                    sdl_pc = 188;
                    continue;
                }
            },
            208 => {
                s_37 = (blk: {
                    const ref = &src;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                d_38 = dst.*;
                (blk: {
                    const ref = &dst;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @truncate((((s_37 & @as(c_uint, 63454)) +% (d_38 & @as(c_uint, 63454))) >> @intCast(@as(Uint32, 1))) +% ((s_37 & d_38) & (~@as(c_uint, 63454) & @as(c_uint, 65535))));
                {
                    sdl_pc = 209;
                    continue;
                }
            },
            209 => {
                if (false) {
                    sdl_pc = 208;
                    continue;
                } else {
                    sdl_pc = 210;
                    continue;
                }
            },
            210 => {
                {
                    sdl_pc = 207;
                    continue;
                }
            },
            211 => {
                {
                    sdl_pc = 167;
                    continue;
                }
            },
            212 => {
                {
                    sdl_pc = 213;
                    continue;
                }
            },
            213 => {
                {
                    sdl_pc = 170;
                    continue;
                }
            },
            214 => {
                ofs_26 = 0;
                dstbuf += @as(usize, @bitCast(@as(isize, @intCast(surf_dst.*.pitch))));
                if (!((blk: {
                    const ref = &linecount_25;
                    ref.* -= 1;
                    break :blk ref.*;
                }) != 0)) {
                    sdl_pc = 217;
                    continue;
                } else {
                    sdl_pc = 218;
                    continue;
                }
            },
            215 => {
                {
                    sdl_pc = 216;
                    continue;
                }
            },
            216 => {
                {
                    sdl_pc = 166;
                    continue;
                }
            },
            217 => {
                {
                    sdl_pc = 167;
                    continue;
                }
            },
            218 => {
                {
                    sdl_pc = 219;
                    continue;
                }
            },
            219 => {
                {
                    sdl_pc = 216;
                    continue;
                }
            },
            220 => {
                linecount_39 = srcrect.*.h;
                ofs_40 = 0;
                left_41 = srcrect.*.x;
                right_42 = left_41 + srcrect.*.w;
                dstbuf -= @as(usize, @bitCast(@as(isize, @intCast(left_41 * @as(c_int, 2)))));
                {
                    sdl_pc = 223;
                    continue;
                }
            },
            221 => {
                if (false) {
                    sdl_pc = 220;
                    continue;
                } else {
                    sdl_pc = 222;
                    continue;
                }
            },
            222 => {
                {
                    sdl_pc = 160;
                    continue;
                }
            },
            223 => {
                if (true) {
                    sdl_pc = 224;
                    continue;
                } else {
                    sdl_pc = 226;
                    continue;
                }
            },
            224 => {
                ofs_40 += srcbuf.*;
                run_43 = srcbuf[@as(c_int, 1)];
                srcbuf += @as(c_ulong, 2) *% @sizeOf(Uint8);
                if (run_43 != 0) {
                    sdl_pc = 227;
                    continue;
                } else {
                    sdl_pc = 228;
                    continue;
                }
            },
            225 => {
                {
                    sdl_pc = 223;
                    continue;
                }
            },
            226 => {
                {
                    sdl_pc = 221;
                    continue;
                }
            },
            227 => {
                if (ofs_40 < right_42) {
                    sdl_pc = 230;
                    continue;
                } else {
                    sdl_pc = 231;
                    continue;
                }
            },
            228 => {
                if (!(ofs_40 != 0)) {
                    sdl_pc = 249;
                    continue;
                } else {
                    sdl_pc = 250;
                    continue;
                }
            },
            229 => {
                if (ofs_40 == w) {
                    sdl_pc = 252;
                    continue;
                } else {
                    sdl_pc = 253;
                    continue;
                }
            },
            230 => {
                start_44 = 0;
                len_45 = run_43;
                if ((left_41 - ofs_40) > @as(c_int, 0)) {
                    sdl_pc = 233;
                    continue;
                } else {
                    sdl_pc = 234;
                    continue;
                }
            },
            231 => {
                {
                    sdl_pc = 232;
                    continue;
                }
            },
            232 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            233 => {
                start_44 = left_41 - ofs_40;
                len_45 -= start_44;
                if (len_45 <= @as(c_int, 0)) {
                    sdl_pc = 236;
                    continue;
                } else {
                    sdl_pc = 237;
                    continue;
                }
            },
            234 => {
                {
                    sdl_pc = 235;
                    continue;
                }
            },
            235 => {
                startcol_46 = ofs_40 + start_44;
                if (len_45 > (right_42 - startcol_46)) {
                    sdl_pc = 239;
                    continue;
                } else {
                    sdl_pc = 240;
                    continue;
                }
            },
            236 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            237 => {
                {
                    sdl_pc = 238;
                    continue;
                }
            },
            238 => {
                {
                    sdl_pc = 235;
                    continue;
                }
            },
            239 => {
                len_45 = right_42 - startcol_46;
                {
                    sdl_pc = 241;
                    continue;
                }
            },
            240 => {
                {
                    sdl_pc = 241;
                    continue;
                }
            },
            241 => {
                {
                    sdl_pc = 242;
                    continue;
                }
            },
            242 => {
                src_47 = @ptrCast(@alignCast(srcbuf + @as(usize, @bitCast(@as(isize, @intCast(start_44 * @as(c_int, 2)))))));
                dst_48 = @ptrCast(@alignCast(dstbuf + @as(usize, @bitCast(@as(isize, @intCast(startcol_46 * @as(c_int, 2)))))));
                ALPHA = alpha >> @intCast(@as(c_uint, 3));
                i = 0;
                {
                    sdl_pc = 245;
                    continue;
                }
            },
            243 => {
                if (false) {
                    sdl_pc = 242;
                    continue;
                } else {
                    sdl_pc = 244;
                    continue;
                }
            },
            244 => {
                {
                    sdl_pc = 232;
                    continue;
                }
            },
            245 => {
                if (i < len_45) {
                    sdl_pc = 246;
                    continue;
                } else {
                    sdl_pc = 248;
                    continue;
                }
            },
            246 => {
                s_49 = (blk: {
                    const ref = &src_47;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                d_50 = dst_48.*;
                s_49 = (s_49 | (s_49 << @intCast(@as(Uint32, 16)))) & @as(Uint32, 132184095);
                d_50 = (d_50 | (d_50 << @intCast(@as(Uint32, 16)))) & @as(Uint32, 132184095);
                d_50 +%= ((s_49 -% d_50) *% ALPHA) >> @intCast(@as(Uint32, 5));
                d_50 &= 132184095;
                (blk: {
                    const ref = &dst_48;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @truncate(d_50 | (d_50 >> @intCast(@as(Uint32, 16))));
                {
                    sdl_pc = 247;
                    continue;
                }
            },
            247 => {
                i += 1;
                {
                    sdl_pc = 245;
                    continue;
                }
            },
            248 => {
                {
                    sdl_pc = 243;
                    continue;
                }
            },
            249 => {
                {
                    sdl_pc = 226;
                    continue;
                }
            },
            250 => {
                {
                    sdl_pc = 251;
                    continue;
                }
            },
            251 => {
                {
                    sdl_pc = 229;
                    continue;
                }
            },
            252 => {
                ofs_40 = 0;
                dstbuf += @as(usize, @bitCast(@as(isize, @intCast(surf_dst.*.pitch))));
                if (!((blk: {
                    const ref = &linecount_39;
                    ref.* -= 1;
                    break :blk ref.*;
                }) != 0)) {
                    sdl_pc = 255;
                    continue;
                } else {
                    sdl_pc = 256;
                    continue;
                }
            },
            253 => {
                {
                    sdl_pc = 254;
                    continue;
                }
            },
            254 => {
                {
                    sdl_pc = 225;
                    continue;
                }
            },
            255 => {
                {
                    sdl_pc = 226;
                    continue;
                }
            },
            256 => {
                {
                    sdl_pc = 257;
                    continue;
                }
            },
            257 => {
                {
                    sdl_pc = 254;
                    continue;
                }
            },
            258 => {
                if (((fmt.*.Gmask == @as(Uint32, 992)) or (fmt.*.Rmask == @as(Uint32, 992))) or (fmt.*.Bmask == @as(Uint32, 992))) {
                    sdl_pc = 259;
                    continue;
                } else {
                    sdl_pc = 260;
                    continue;
                }
            },
            259 => {
                if (alpha == @as(c_uint, 128)) {
                    sdl_pc = 262;
                    continue;
                } else {
                    sdl_pc = 263;
                    continue;
                }
            },
            260 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            261 => {
                {
                    sdl_pc = 153;
                    continue;
                }
            },
            262 => {
                {
                    sdl_pc = 265;
                    continue;
                }
            },
            263 => {
                {
                    sdl_pc = 324;
                    continue;
                }
            },
            264 => {
                {
                    sdl_pc = 153;
                    continue;
                }
            },
            265 => {
                linecount_51 = srcrect.*.h;
                ofs_52 = 0;
                left_53 = srcrect.*.x;
                right_54 = left_53 + srcrect.*.w;
                dstbuf -= @as(usize, @bitCast(@as(isize, @intCast(left_53 * @as(c_int, 2)))));
                {
                    sdl_pc = 268;
                    continue;
                }
            },
            266 => {
                if (false) {
                    sdl_pc = 265;
                    continue;
                } else {
                    sdl_pc = 267;
                    continue;
                }
            },
            267 => {
                {
                    sdl_pc = 264;
                    continue;
                }
            },
            268 => {
                if (true) {
                    sdl_pc = 269;
                    continue;
                } else {
                    sdl_pc = 271;
                    continue;
                }
            },
            269 => {
                ofs_52 += srcbuf.*;
                run_55 = srcbuf[@as(c_int, 1)];
                srcbuf += @as(c_ulong, 2) *% @sizeOf(Uint8);
                if (run_55 != 0) {
                    sdl_pc = 272;
                    continue;
                } else {
                    sdl_pc = 273;
                    continue;
                }
            },
            270 => {
                {
                    sdl_pc = 268;
                    continue;
                }
            },
            271 => {
                {
                    sdl_pc = 266;
                    continue;
                }
            },
            272 => {
                if (ofs_52 < right_54) {
                    sdl_pc = 275;
                    continue;
                } else {
                    sdl_pc = 276;
                    continue;
                }
            },
            273 => {
                if (!(ofs_52 != 0)) {
                    sdl_pc = 315;
                    continue;
                } else {
                    sdl_pc = 316;
                    continue;
                }
            },
            274 => {
                if (ofs_52 == w) {
                    sdl_pc = 318;
                    continue;
                } else {
                    sdl_pc = 319;
                    continue;
                }
            },
            275 => {
                start_56 = 0;
                len_57 = run_55;
                if ((left_53 - ofs_52) > @as(c_int, 0)) {
                    sdl_pc = 278;
                    continue;
                } else {
                    sdl_pc = 279;
                    continue;
                }
            },
            276 => {
                {
                    sdl_pc = 277;
                    continue;
                }
            },
            277 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            278 => {
                start_56 = left_53 - ofs_52;
                len_57 -= start_56;
                if (len_57 <= @as(c_int, 0)) {
                    sdl_pc = 281;
                    continue;
                } else {
                    sdl_pc = 282;
                    continue;
                }
            },
            279 => {
                {
                    sdl_pc = 280;
                    continue;
                }
            },
            280 => {
                startcol_58 = ofs_52 + start_56;
                if (len_57 > (right_54 - startcol_58)) {
                    sdl_pc = 284;
                    continue;
                } else {
                    sdl_pc = 285;
                    continue;
                }
            },
            281 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            282 => {
                {
                    sdl_pc = 283;
                    continue;
                }
            },
            283 => {
                {
                    sdl_pc = 280;
                    continue;
                }
            },
            284 => {
                len_57 = right_54 - startcol_58;
                {
                    sdl_pc = 286;
                    continue;
                }
            },
            285 => {
                {
                    sdl_pc = 286;
                    continue;
                }
            },
            286 => {
                {
                    sdl_pc = 287;
                    continue;
                }
            },
            287 => {
                n_59 = @bitCast(@as(c_int, len_57));
                src_60 = @ptrCast(@alignCast(srcbuf + @as(usize, @bitCast(@as(isize, @intCast(start_56 * @as(c_int, 2)))))));
                dst_61 = @ptrCast(@alignCast(dstbuf + @as(usize, @bitCast(@as(isize, @intCast(startcol_58 * @as(c_int, 2)))))));
                if (((@as(usize, @intCast(@intFromPtr(src_60))) ^ @as(usize, @intCast(@intFromPtr(dst_61)))) & @as(usize, 3)) != 0) {
                    sdl_pc = 290;
                    continue;
                } else {
                    sdl_pc = 291;
                    continue;
                }
            },
            288 => {
                if (false) {
                    sdl_pc = 287;
                    continue;
                } else {
                    sdl_pc = 289;
                    continue;
                }
            },
            289 => {
                {
                    sdl_pc = 277;
                    continue;
                }
            },
            290 => {
                {
                    sdl_pc = 293;
                    continue;
                }
            },
            291 => {
                if ((@as(usize, @intCast(@intFromPtr(src_60))) & @as(usize, 3)) != 0) {
                    sdl_pc = 299;
                    continue;
                } else {
                    sdl_pc = 300;
                    continue;
                }
            },
            292 => {
                {
                    sdl_pc = 288;
                    continue;
                }
            },
            293 => {
                if ((blk: {
                    const ref = &n_59;
                    const tmp = ref.*;
                    ref.* -%= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 294;
                    continue;
                } else {
                    sdl_pc = 295;
                    continue;
                }
            },
            294 => {
                {
                    sdl_pc = 296;
                    continue;
                }
            },
            295 => {
                {
                    sdl_pc = 292;
                    continue;
                }
            },
            296 => {
                s_62 = (blk: {
                    const ref = &src_60;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                d_63 = dst_61.*;
                (blk: {
                    const ref = &dst_61;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @truncate((((s_62 & @as(c_uint, 64478)) +% (d_63 & @as(c_uint, 64478))) >> @intCast(@as(Uint32, 1))) +% ((s_62 & d_63) & (~@as(c_uint, 64478) & @as(c_uint, 65535))));
                {
                    sdl_pc = 297;
                    continue;
                }
            },
            297 => {
                if (false) {
                    sdl_pc = 296;
                    continue;
                } else {
                    sdl_pc = 298;
                    continue;
                }
            },
            298 => {
                {
                    sdl_pc = 293;
                    continue;
                }
            },
            299 => {
                {
                    sdl_pc = 302;
                    continue;
                }
            },
            300 => {
                {
                    sdl_pc = 301;
                    continue;
                }
            },
            301 => {
                {
                    sdl_pc = 305;
                    continue;
                }
            },
            302 => {
                s_64 = (blk: {
                    const ref = &src_60;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                d_65 = dst_61.*;
                (blk: {
                    const ref = &dst_61;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @truncate((((s_64 & @as(c_uint, 64478)) +% (d_65 & @as(c_uint, 64478))) >> @intCast(@as(Uint32, 1))) +% ((s_64 & d_65) & (~@as(c_uint, 64478) & @as(c_uint, 65535))));
                {
                    sdl_pc = 303;
                    continue;
                }
            },
            303 => {
                if (false) {
                    sdl_pc = 302;
                    continue;
                } else {
                    sdl_pc = 304;
                    continue;
                }
            },
            304 => {
                n_59 -%= 1;
                {
                    sdl_pc = 301;
                    continue;
                }
            },
            305 => {
                if (n_59 > @as(c_uint, 1)) {
                    sdl_pc = 306;
                    continue;
                } else {
                    sdl_pc = 308;
                    continue;
                }
            },
            306 => {
                s_66 = @as([*c]Uint32, @ptrCast(@alignCast(src_60))).*;
                d_67 = @as([*c]Uint32, @ptrCast(@alignCast(dst_61))).*;
                @as([*c]Uint32, @ptrCast(@alignCast(dst_61))).* = (((s_66 & (@as(c_uint, 64478) | (@as(c_uint, 64478) << @intCast(@as(c_uint, 16))))) >> @intCast(@as(Uint32, 1))) +% ((d_67 & (@as(c_uint, 64478) | (@as(c_uint, 64478) << @intCast(@as(c_uint, 16))))) >> @intCast(@as(Uint32, 1)))) +% ((s_66 & d_67) & ~(@as(c_uint, 64478) | (@as(c_uint, 64478) << @intCast(@as(c_uint, 16)))));
                src_60 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                dst_61 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                {
                    sdl_pc = 307;
                    continue;
                }
            },
            307 => {
                n_59 -%= 2;
                {
                    sdl_pc = 305;
                    continue;
                }
            },
            308 => {
                if (n_59 != 0) {
                    sdl_pc = 309;
                    continue;
                } else {
                    sdl_pc = 310;
                    continue;
                }
            },
            309 => {
                {
                    sdl_pc = 312;
                    continue;
                }
            },
            310 => {
                {
                    sdl_pc = 311;
                    continue;
                }
            },
            311 => {
                {
                    sdl_pc = 292;
                    continue;
                }
            },
            312 => {
                s_68 = (blk: {
                    const ref = &src_60;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                d_69 = dst_61.*;
                (blk: {
                    const ref = &dst_61;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @truncate((((s_68 & @as(c_uint, 64478)) +% (d_69 & @as(c_uint, 64478))) >> @intCast(@as(Uint32, 1))) +% ((s_68 & d_69) & (~@as(c_uint, 64478) & @as(c_uint, 65535))));
                {
                    sdl_pc = 313;
                    continue;
                }
            },
            313 => {
                if (false) {
                    sdl_pc = 312;
                    continue;
                } else {
                    sdl_pc = 314;
                    continue;
                }
            },
            314 => {
                {
                    sdl_pc = 311;
                    continue;
                }
            },
            315 => {
                {
                    sdl_pc = 271;
                    continue;
                }
            },
            316 => {
                {
                    sdl_pc = 317;
                    continue;
                }
            },
            317 => {
                {
                    sdl_pc = 274;
                    continue;
                }
            },
            318 => {
                ofs_52 = 0;
                dstbuf += @as(usize, @bitCast(@as(isize, @intCast(surf_dst.*.pitch))));
                if (!((blk: {
                    const ref = &linecount_51;
                    ref.* -= 1;
                    break :blk ref.*;
                }) != 0)) {
                    sdl_pc = 321;
                    continue;
                } else {
                    sdl_pc = 322;
                    continue;
                }
            },
            319 => {
                {
                    sdl_pc = 320;
                    continue;
                }
            },
            320 => {
                {
                    sdl_pc = 270;
                    continue;
                }
            },
            321 => {
                {
                    sdl_pc = 271;
                    continue;
                }
            },
            322 => {
                {
                    sdl_pc = 323;
                    continue;
                }
            },
            323 => {
                {
                    sdl_pc = 320;
                    continue;
                }
            },
            324 => {
                linecount_70 = srcrect.*.h;
                ofs_71 = 0;
                left_72 = srcrect.*.x;
                right_73 = left_72 + srcrect.*.w;
                dstbuf -= @as(usize, @bitCast(@as(isize, @intCast(left_72 * @as(c_int, 2)))));
                {
                    sdl_pc = 327;
                    continue;
                }
            },
            325 => {
                if (false) {
                    sdl_pc = 324;
                    continue;
                } else {
                    sdl_pc = 326;
                    continue;
                }
            },
            326 => {
                {
                    sdl_pc = 264;
                    continue;
                }
            },
            327 => {
                if (true) {
                    sdl_pc = 328;
                    continue;
                } else {
                    sdl_pc = 330;
                    continue;
                }
            },
            328 => {
                ofs_71 += srcbuf.*;
                run_74 = srcbuf[@as(c_int, 1)];
                srcbuf += @as(c_ulong, 2) *% @sizeOf(Uint8);
                if (run_74 != 0) {
                    sdl_pc = 331;
                    continue;
                } else {
                    sdl_pc = 332;
                    continue;
                }
            },
            329 => {
                {
                    sdl_pc = 327;
                    continue;
                }
            },
            330 => {
                {
                    sdl_pc = 325;
                    continue;
                }
            },
            331 => {
                if (ofs_71 < right_73) {
                    sdl_pc = 334;
                    continue;
                } else {
                    sdl_pc = 335;
                    continue;
                }
            },
            332 => {
                if (!(ofs_71 != 0)) {
                    sdl_pc = 353;
                    continue;
                } else {
                    sdl_pc = 354;
                    continue;
                }
            },
            333 => {
                if (ofs_71 == w) {
                    sdl_pc = 356;
                    continue;
                } else {
                    sdl_pc = 357;
                    continue;
                }
            },
            334 => {
                start_75 = 0;
                len_76 = run_74;
                if ((left_72 - ofs_71) > @as(c_int, 0)) {
                    sdl_pc = 337;
                    continue;
                } else {
                    sdl_pc = 338;
                    continue;
                }
            },
            335 => {
                {
                    sdl_pc = 336;
                    continue;
                }
            },
            336 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            337 => {
                start_75 = left_72 - ofs_71;
                len_76 -= start_75;
                if (len_76 <= @as(c_int, 0)) {
                    sdl_pc = 340;
                    continue;
                } else {
                    sdl_pc = 341;
                    continue;
                }
            },
            338 => {
                {
                    sdl_pc = 339;
                    continue;
                }
            },
            339 => {
                startcol_77 = ofs_71 + start_75;
                if (len_76 > (right_73 - startcol_77)) {
                    sdl_pc = 343;
                    continue;
                } else {
                    sdl_pc = 344;
                    continue;
                }
            },
            340 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            341 => {
                {
                    sdl_pc = 342;
                    continue;
                }
            },
            342 => {
                {
                    sdl_pc = 339;
                    continue;
                }
            },
            343 => {
                len_76 = right_73 - startcol_77;
                {
                    sdl_pc = 345;
                    continue;
                }
            },
            344 => {
                {
                    sdl_pc = 345;
                    continue;
                }
            },
            345 => {
                {
                    sdl_pc = 346;
                    continue;
                }
            },
            346 => {
                src_79 = @ptrCast(@alignCast(srcbuf + @as(usize, @bitCast(@as(isize, @intCast(start_75 * @as(c_int, 2)))))));
                dst_80 = @ptrCast(@alignCast(dstbuf + @as(usize, @bitCast(@as(isize, @intCast(startcol_77 * @as(c_int, 2)))))));
                ALPHA_81 = alpha >> @intCast(@as(c_uint, 3));
                i_78 = 0;
                {
                    sdl_pc = 349;
                    continue;
                }
            },
            347 => {
                if (false) {
                    sdl_pc = 346;
                    continue;
                } else {
                    sdl_pc = 348;
                    continue;
                }
            },
            348 => {
                {
                    sdl_pc = 336;
                    continue;
                }
            },
            349 => {
                if (i_78 < len_76) {
                    sdl_pc = 350;
                    continue;
                } else {
                    sdl_pc = 352;
                    continue;
                }
            },
            350 => {
                s_82 = (blk: {
                    const ref = &src_79;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                d_83 = dst_80.*;
                s_82 = (s_82 | (s_82 << @intCast(@as(Uint32, 16)))) & @as(Uint32, 65043487);
                d_83 = (d_83 | (d_83 << @intCast(@as(Uint32, 16)))) & @as(Uint32, 65043487);
                d_83 +%= ((s_82 -% d_83) *% ALPHA_81) >> @intCast(@as(Uint32, 5));
                d_83 &= 65043487;
                (blk: {
                    const ref = &dst_80;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @truncate(d_83 | (d_83 >> @intCast(@as(Uint32, 16))));
                {
                    sdl_pc = 351;
                    continue;
                }
            },
            351 => {
                i_78 += 1;
                {
                    sdl_pc = 349;
                    continue;
                }
            },
            352 => {
                {
                    sdl_pc = 347;
                    continue;
                }
            },
            353 => {
                {
                    sdl_pc = 330;
                    continue;
                }
            },
            354 => {
                {
                    sdl_pc = 355;
                    continue;
                }
            },
            355 => {
                {
                    sdl_pc = 333;
                    continue;
                }
            },
            356 => {
                ofs_71 = 0;
                dstbuf += @as(usize, @bitCast(@as(isize, @intCast(surf_dst.*.pitch))));
                if (!((blk: {
                    const ref = &linecount_70;
                    ref.* -= 1;
                    break :blk ref.*;
                }) != 0)) {
                    sdl_pc = 359;
                    continue;
                } else {
                    sdl_pc = 360;
                    continue;
                }
            },
            357 => {
                {
                    sdl_pc = 358;
                    continue;
                }
            },
            358 => {
                {
                    sdl_pc = 329;
                    continue;
                }
            },
            359 => {
                {
                    sdl_pc = 330;
                    continue;
                }
            },
            360 => {
                {
                    sdl_pc = 361;
                    continue;
                }
            },
            361 => {
                {
                    sdl_pc = 358;
                    continue;
                }
            },
            362 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            363 => {
                linecount_84 = srcrect.*.h;
                ofs_85 = 0;
                left_86 = srcrect.*.x;
                right_87 = left_86 + srcrect.*.w;
                dstbuf -= @as(usize, @bitCast(@as(isize, @intCast(left_86 * @as(c_int, 2)))));
                {
                    sdl_pc = 366;
                    continue;
                }
            },
            364 => {
                if (false) {
                    sdl_pc = 363;
                    continue;
                } else {
                    sdl_pc = 365;
                    continue;
                }
            },
            365 => {
                {
                    sdl_pc = 153;
                    continue;
                }
            },
            366 => {
                if (true) {
                    sdl_pc = 367;
                    continue;
                } else {
                    sdl_pc = 369;
                    continue;
                }
            },
            367 => {
                ofs_85 += srcbuf.*;
                run_88 = srcbuf[@as(c_int, 1)];
                srcbuf += @as(c_ulong, 2) *% @sizeOf(Uint8);
                if (run_88 != 0) {
                    sdl_pc = 370;
                    continue;
                } else {
                    sdl_pc = 371;
                    continue;
                }
            },
            368 => {
                {
                    sdl_pc = 366;
                    continue;
                }
            },
            369 => {
                {
                    sdl_pc = 364;
                    continue;
                }
            },
            370 => {
                if (ofs_85 < right_87) {
                    sdl_pc = 373;
                    continue;
                } else {
                    sdl_pc = 374;
                    continue;
                }
            },
            371 => {
                if (!(ofs_85 != 0)) {
                    sdl_pc = 400;
                    continue;
                } else {
                    sdl_pc = 401;
                    continue;
                }
            },
            372 => {
                if (ofs_85 == w) {
                    sdl_pc = 403;
                    continue;
                } else {
                    sdl_pc = 404;
                    continue;
                }
            },
            373 => {
                start_89 = 0;
                len_90 = run_88;
                if ((left_86 - ofs_85) > @as(c_int, 0)) {
                    sdl_pc = 376;
                    continue;
                } else {
                    sdl_pc = 377;
                    continue;
                }
            },
            374 => {
                {
                    sdl_pc = 375;
                    continue;
                }
            },
            375 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            376 => {
                start_89 = left_86 - ofs_85;
                len_90 -= start_89;
                if (len_90 <= @as(c_int, 0)) {
                    sdl_pc = 379;
                    continue;
                } else {
                    sdl_pc = 380;
                    continue;
                }
            },
            377 => {
                {
                    sdl_pc = 378;
                    continue;
                }
            },
            378 => {
                startcol_91 = ofs_85 + start_89;
                if (len_90 > (right_87 - startcol_91)) {
                    sdl_pc = 382;
                    continue;
                } else {
                    sdl_pc = 383;
                    continue;
                }
            },
            379 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            380 => {
                {
                    sdl_pc = 381;
                    continue;
                }
            },
            381 => {
                {
                    sdl_pc = 378;
                    continue;
                }
            },
            382 => {
                len_90 = right_87 - startcol_91;
                {
                    sdl_pc = 384;
                    continue;
                }
            },
            383 => {
                {
                    sdl_pc = 384;
                    continue;
                }
            },
            384 => {
                {
                    sdl_pc = 385;
                    continue;
                }
            },
            385 => {
                src_93 = srcbuf + @as(usize, @bitCast(@as(isize, @intCast(start_89 * @as(c_int, 2)))));
                dst_94 = dstbuf + @as(usize, @bitCast(@as(isize, @intCast(startcol_91 * @as(c_int, 2)))));
                i_92 = 0;
                {
                    sdl_pc = 388;
                    continue;
                }
            },
            386 => {
                if (false) {
                    sdl_pc = 385;
                    continue;
                } else {
                    sdl_pc = 387;
                    continue;
                }
            },
            387 => {
                {
                    sdl_pc = 375;
                    continue;
                }
            },
            388 => {
                if (i_92 < len_90) {
                    sdl_pc = 389;
                    continue;
                } else {
                    sdl_pc = 391;
                    continue;
                }
            },
            389 => {
                s_95 = 0;
                d_96 = 0;
                switch (@as(c_int, 2)) {
                    @as(c_int, 2) => {
                        sdl_pc = 393;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 394;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 395;
                        continue;
                    },
                    else => {
                        sdl_pc = 392;
                        continue;
                    },
                }
            },
            390 => {
                i_92 += 1;
                {
                    sdl_pc = 388;
                    continue;
                }
            },
            391 => {
                {
                    sdl_pc = 386;
                    continue;
                }
            },
            392 => {
                rs = SDL_expand_byte[fmt.*.Rbits][(s_95 & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                gs = SDL_expand_byte[fmt.*.Gbits][(s_95 & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                bs = SDL_expand_byte[fmt.*.Bbits][(s_95 & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                rd = SDL_expand_byte[fmt.*.Rbits][(d_96 & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                gd = SDL_expand_byte[fmt.*.Gbits][(d_96 & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                bd = SDL_expand_byte[fmt.*.Bbits][(d_96 & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                rd +%= ((rs -% rd) *% alpha) >> @intCast(@as(c_uint, 8));
                gd +%= ((gs -% gd) *% alpha) >> @intCast(@as(c_uint, 8));
                bd +%= ((bs -% bd) *% alpha) >> @intCast(@as(c_uint, 8));
                d_96 = ((((rd >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((gd >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((bd >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask;
                switch (@as(c_int, 2)) {
                    @as(c_int, 2) => {
                        sdl_pc = 397;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 398;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 399;
                        continue;
                    },
                    else => {
                        sdl_pc = 396;
                        continue;
                    },
                }
            },
            393 => {
                s_95 = @as([*c]Uint16, @ptrCast(@alignCast(src_93))).*;
                d_96 = @as([*c]Uint16, @ptrCast(@alignCast(dst_94))).*;
                {
                    sdl_pc = 392;
                    continue;
                }
            },
            394 => {
                s_95 = @bitCast(@as(c_int, ((@as(c_int, src_93[@as(c_int, 2)]) << @intCast(@as(c_int, 16))) | (@as(c_int, src_93[@as(c_int, 1)]) << @intCast(@as(c_int, 8)))) | @as(c_int, src_93[@as(c_int, 0)])));
                d_96 = @bitCast(@as(c_int, ((@as(c_int, dst_94[@as(c_int, 2)]) << @intCast(@as(c_int, 16))) | (@as(c_int, dst_94[@as(c_int, 1)]) << @intCast(@as(c_int, 8)))) | @as(c_int, dst_94[@as(c_int, 0)])));
                {
                    sdl_pc = 392;
                    continue;
                }
            },
            395 => {
                s_95 = @as([*c]Uint32, @ptrCast(@alignCast(src_93))).*;
                d_96 = @as([*c]Uint32, @ptrCast(@alignCast(dst_94))).*;
                {
                    sdl_pc = 392;
                    continue;
                }
            },
            396 => {
                src_93 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                dst_94 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                {
                    sdl_pc = 390;
                    continue;
                }
            },
            397 => {
                @as([*c]Uint16, @ptrCast(@alignCast(dst_94))).* = @truncate(d_96);
                {
                    sdl_pc = 396;
                    continue;
                }
            },
            398 => {
                dst_94[@as(c_int, 0)] = @truncate(d_96);
                dst_94[@as(c_int, 1)] = @truncate(d_96 >> @intCast(@as(Uint32, 8)));
                dst_94[@as(c_int, 2)] = @truncate(d_96 >> @intCast(@as(Uint32, 16)));
                {
                    sdl_pc = 396;
                    continue;
                }
            },
            399 => {
                @as([*c]Uint32, @ptrCast(@alignCast(dst_94))).* = d_96;
                {
                    sdl_pc = 396;
                    continue;
                }
            },
            400 => {
                {
                    sdl_pc = 369;
                    continue;
                }
            },
            401 => {
                {
                    sdl_pc = 402;
                    continue;
                }
            },
            402 => {
                {
                    sdl_pc = 372;
                    continue;
                }
            },
            403 => {
                ofs_85 = 0;
                dstbuf += @as(usize, @bitCast(@as(isize, @intCast(surf_dst.*.pitch))));
                if (!((blk: {
                    const ref = &linecount_84;
                    ref.* -= 1;
                    break :blk ref.*;
                }) != 0)) {
                    sdl_pc = 406;
                    continue;
                } else {
                    sdl_pc = 407;
                    continue;
                }
            },
            404 => {
                {
                    sdl_pc = 405;
                    continue;
                }
            },
            405 => {
                {
                    sdl_pc = 368;
                    continue;
                }
            },
            406 => {
                {
                    sdl_pc = 369;
                    continue;
                }
            },
            407 => {
                {
                    sdl_pc = 408;
                    continue;
                }
            },
            408 => {
                {
                    sdl_pc = 405;
                    continue;
                }
            },
            409 => {
                {
                    sdl_pc = 410;
                    continue;
                }
            },
            410 => {
                linecount_97 = srcrect.*.h;
                ofs_98 = 0;
                left_99 = srcrect.*.x;
                right_100 = left_99 + srcrect.*.w;
                dstbuf -= @as(usize, @bitCast(@as(isize, @intCast(left_99 * @as(c_int, 3)))));
                {
                    sdl_pc = 413;
                    continue;
                }
            },
            411 => {
                if (false) {
                    sdl_pc = 410;
                    continue;
                } else {
                    sdl_pc = 412;
                    continue;
                }
            },
            412 => {
                {
                    sdl_pc = 150;
                    continue;
                }
            },
            413 => {
                if (true) {
                    sdl_pc = 414;
                    continue;
                } else {
                    sdl_pc = 416;
                    continue;
                }
            },
            414 => {
                ofs_98 += srcbuf.*;
                run_101 = srcbuf[@as(c_int, 1)];
                srcbuf += @as(c_ulong, 2) *% @sizeOf(Uint8);
                if (run_101 != 0) {
                    sdl_pc = 417;
                    continue;
                } else {
                    sdl_pc = 418;
                    continue;
                }
            },
            415 => {
                {
                    sdl_pc = 413;
                    continue;
                }
            },
            416 => {
                {
                    sdl_pc = 411;
                    continue;
                }
            },
            417 => {
                if (ofs_98 < right_100) {
                    sdl_pc = 420;
                    continue;
                } else {
                    sdl_pc = 421;
                    continue;
                }
            },
            418 => {
                if (!(ofs_98 != 0)) {
                    sdl_pc = 447;
                    continue;
                } else {
                    sdl_pc = 448;
                    continue;
                }
            },
            419 => {
                if (ofs_98 == w) {
                    sdl_pc = 450;
                    continue;
                } else {
                    sdl_pc = 451;
                    continue;
                }
            },
            420 => {
                start_102 = 0;
                len_103 = run_101;
                if ((left_99 - ofs_98) > @as(c_int, 0)) {
                    sdl_pc = 423;
                    continue;
                } else {
                    sdl_pc = 424;
                    continue;
                }
            },
            421 => {
                {
                    sdl_pc = 422;
                    continue;
                }
            },
            422 => {
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            423 => {
                start_102 = left_99 - ofs_98;
                len_103 -= start_102;
                if (len_103 <= @as(c_int, 0)) {
                    sdl_pc = 426;
                    continue;
                } else {
                    sdl_pc = 427;
                    continue;
                }
            },
            424 => {
                {
                    sdl_pc = 425;
                    continue;
                }
            },
            425 => {
                startcol_104 = ofs_98 + start_102;
                if (len_103 > (right_100 - startcol_104)) {
                    sdl_pc = 429;
                    continue;
                } else {
                    sdl_pc = 430;
                    continue;
                }
            },
            426 => {
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            427 => {
                {
                    sdl_pc = 428;
                    continue;
                }
            },
            428 => {
                {
                    sdl_pc = 425;
                    continue;
                }
            },
            429 => {
                len_103 = right_100 - startcol_104;
                {
                    sdl_pc = 431;
                    continue;
                }
            },
            430 => {
                {
                    sdl_pc = 431;
                    continue;
                }
            },
            431 => {
                {
                    sdl_pc = 432;
                    continue;
                }
            },
            432 => {
                src_106 = srcbuf + @as(usize, @bitCast(@as(isize, @intCast(start_102 * @as(c_int, 3)))));
                dst_107 = dstbuf + @as(usize, @bitCast(@as(isize, @intCast(startcol_104 * @as(c_int, 3)))));
                i_105 = 0;
                {
                    sdl_pc = 435;
                    continue;
                }
            },
            433 => {
                if (false) {
                    sdl_pc = 432;
                    continue;
                } else {
                    sdl_pc = 434;
                    continue;
                }
            },
            434 => {
                {
                    sdl_pc = 422;
                    continue;
                }
            },
            435 => {
                if (i_105 < len_103) {
                    sdl_pc = 436;
                    continue;
                } else {
                    sdl_pc = 438;
                    continue;
                }
            },
            436 => {
                s_108 = 0;
                d_109 = 0;
                switch (@as(c_int, 3)) {
                    @as(c_int, 2) => {
                        sdl_pc = 440;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 441;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 442;
                        continue;
                    },
                    else => {
                        sdl_pc = 439;
                        continue;
                    },
                }
            },
            437 => {
                i_105 += 1;
                {
                    sdl_pc = 435;
                    continue;
                }
            },
            438 => {
                {
                    sdl_pc = 433;
                    continue;
                }
            },
            439 => {
                rs_110 = SDL_expand_byte[fmt.*.Rbits][(s_108 & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                gs_111 = SDL_expand_byte[fmt.*.Gbits][(s_108 & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                bs_112 = SDL_expand_byte[fmt.*.Bbits][(s_108 & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                rd_113 = SDL_expand_byte[fmt.*.Rbits][(d_109 & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                gd_114 = SDL_expand_byte[fmt.*.Gbits][(d_109 & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                bd_115 = SDL_expand_byte[fmt.*.Bbits][(d_109 & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                rd_113 +%= ((rs_110 -% rd_113) *% alpha) >> @intCast(@as(c_uint, 8));
                gd_114 +%= ((gs_111 -% gd_114) *% alpha) >> @intCast(@as(c_uint, 8));
                bd_115 +%= ((bs_112 -% bd_115) *% alpha) >> @intCast(@as(c_uint, 8));
                d_109 = ((((rd_113 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((gd_114 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((bd_115 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask;
                switch (@as(c_int, 3)) {
                    @as(c_int, 2) => {
                        sdl_pc = 444;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 445;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 446;
                        continue;
                    },
                    else => {
                        sdl_pc = 443;
                        continue;
                    },
                }
            },
            440 => {
                s_108 = @as([*c]Uint16, @ptrCast(@alignCast(src_106))).*;
                d_109 = @as([*c]Uint16, @ptrCast(@alignCast(dst_107))).*;
                {
                    sdl_pc = 439;
                    continue;
                }
            },
            441 => {
                s_108 = @bitCast(@as(c_int, ((@as(c_int, src_106[@as(c_int, 2)]) << @intCast(@as(c_int, 16))) | (@as(c_int, src_106[@as(c_int, 1)]) << @intCast(@as(c_int, 8)))) | @as(c_int, src_106[@as(c_int, 0)])));
                d_109 = @bitCast(@as(c_int, ((@as(c_int, dst_107[@as(c_int, 2)]) << @intCast(@as(c_int, 16))) | (@as(c_int, dst_107[@as(c_int, 1)]) << @intCast(@as(c_int, 8)))) | @as(c_int, dst_107[@as(c_int, 0)])));
                {
                    sdl_pc = 439;
                    continue;
                }
            },
            442 => {
                s_108 = @as([*c]Uint32, @ptrCast(@alignCast(src_106))).*;
                d_109 = @as([*c]Uint32, @ptrCast(@alignCast(dst_107))).*;
                {
                    sdl_pc = 439;
                    continue;
                }
            },
            443 => {
                src_106 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                dst_107 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                {
                    sdl_pc = 437;
                    continue;
                }
            },
            444 => {
                @as([*c]Uint16, @ptrCast(@alignCast(dst_107))).* = @truncate(d_109);
                {
                    sdl_pc = 443;
                    continue;
                }
            },
            445 => {
                dst_107[@as(c_int, 0)] = @truncate(d_109);
                dst_107[@as(c_int, 1)] = @truncate(d_109 >> @intCast(@as(Uint32, 8)));
                dst_107[@as(c_int, 2)] = @truncate(d_109 >> @intCast(@as(Uint32, 16)));
                {
                    sdl_pc = 443;
                    continue;
                }
            },
            446 => {
                @as([*c]Uint32, @ptrCast(@alignCast(dst_107))).* = d_109;
                {
                    sdl_pc = 443;
                    continue;
                }
            },
            447 => {
                {
                    sdl_pc = 416;
                    continue;
                }
            },
            448 => {
                {
                    sdl_pc = 449;
                    continue;
                }
            },
            449 => {
                {
                    sdl_pc = 419;
                    continue;
                }
            },
            450 => {
                ofs_98 = 0;
                dstbuf += @as(usize, @bitCast(@as(isize, @intCast(surf_dst.*.pitch))));
                if (!((blk: {
                    const ref = &linecount_97;
                    ref.* -= 1;
                    break :blk ref.*;
                }) != 0)) {
                    sdl_pc = 453;
                    continue;
                } else {
                    sdl_pc = 454;
                    continue;
                }
            },
            451 => {
                {
                    sdl_pc = 452;
                    continue;
                }
            },
            452 => {
                {
                    sdl_pc = 415;
                    continue;
                }
            },
            453 => {
                {
                    sdl_pc = 416;
                    continue;
                }
            },
            454 => {
                {
                    sdl_pc = 455;
                    continue;
                }
            },
            455 => {
                {
                    sdl_pc = 452;
                    continue;
                }
            },
            456 => {
                if ((((fmt.*.Rmask | fmt.*.Gmask) | fmt.*.Bmask) == @as(Uint32, 16777215)) and (((fmt.*.Gmask == @as(Uint32, 65280)) or (fmt.*.Rmask == @as(Uint32, 65280))) or (fmt.*.Bmask == @as(Uint32, 65280)))) {
                    sdl_pc = 457;
                    continue;
                } else {
                    sdl_pc = 458;
                    continue;
                }
            },
            457 => {
                if (alpha == @as(c_uint, 128)) {
                    sdl_pc = 460;
                    continue;
                } else {
                    sdl_pc = 461;
                    continue;
                }
            },
            458 => {
                {
                    sdl_pc = 539;
                    continue;
                }
            },
            459 => {
                {
                    sdl_pc = 150;
                    continue;
                }
            },
            460 => {
                {
                    sdl_pc = 463;
                    continue;
                }
            },
            461 => {
                {
                    sdl_pc = 501;
                    continue;
                }
            },
            462 => {
                {
                    sdl_pc = 459;
                    continue;
                }
            },
            463 => {
                linecount_116 = srcrect.*.h;
                ofs_117 = 0;
                left_118 = srcrect.*.x;
                right_119 = left_118 + srcrect.*.w;
                dstbuf -= @as(usize, @bitCast(@as(isize, @intCast(left_118 * @as(c_int, 4)))));
                {
                    sdl_pc = 466;
                    continue;
                }
            },
            464 => {
                if (false) {
                    sdl_pc = 463;
                    continue;
                } else {
                    sdl_pc = 465;
                    continue;
                }
            },
            465 => {
                {
                    sdl_pc = 462;
                    continue;
                }
            },
            466 => {
                if (true) {
                    sdl_pc = 467;
                    continue;
                } else {
                    sdl_pc = 469;
                    continue;
                }
            },
            467 => {
                ofs_117 += @as([*c]Uint16, @ptrCast(@alignCast(srcbuf))).*;
                run_120 = @as([*c]Uint16, @ptrCast(@alignCast(srcbuf)))[@as(c_int, 1)];
                srcbuf += @as(c_ulong, 2) *% @sizeOf(Uint16);
                if (run_120 != 0) {
                    sdl_pc = 470;
                    continue;
                } else {
                    sdl_pc = 471;
                    continue;
                }
            },
            468 => {
                {
                    sdl_pc = 466;
                    continue;
                }
            },
            469 => {
                {
                    sdl_pc = 464;
                    continue;
                }
            },
            470 => {
                if (ofs_117 < right_119) {
                    sdl_pc = 473;
                    continue;
                } else {
                    sdl_pc = 474;
                    continue;
                }
            },
            471 => {
                if (!(ofs_117 != 0)) {
                    sdl_pc = 492;
                    continue;
                } else {
                    sdl_pc = 493;
                    continue;
                }
            },
            472 => {
                if (ofs_117 == w) {
                    sdl_pc = 495;
                    continue;
                } else {
                    sdl_pc = 496;
                    continue;
                }
            },
            473 => {
                start_121 = 0;
                len_122 = run_120;
                if ((left_118 - ofs_117) > @as(c_int, 0)) {
                    sdl_pc = 476;
                    continue;
                } else {
                    sdl_pc = 477;
                    continue;
                }
            },
            474 => {
                {
                    sdl_pc = 475;
                    continue;
                }
            },
            475 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            476 => {
                start_121 = left_118 - ofs_117;
                len_122 -= start_121;
                if (len_122 <= @as(c_int, 0)) {
                    sdl_pc = 479;
                    continue;
                } else {
                    sdl_pc = 480;
                    continue;
                }
            },
            477 => {
                {
                    sdl_pc = 478;
                    continue;
                }
            },
            478 => {
                startcol_123 = ofs_117 + start_121;
                if (len_122 > (right_119 - startcol_123)) {
                    sdl_pc = 482;
                    continue;
                } else {
                    sdl_pc = 483;
                    continue;
                }
            },
            479 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            480 => {
                {
                    sdl_pc = 481;
                    continue;
                }
            },
            481 => {
                {
                    sdl_pc = 478;
                    continue;
                }
            },
            482 => {
                len_122 = right_119 - startcol_123;
                {
                    sdl_pc = 484;
                    continue;
                }
            },
            483 => {
                {
                    sdl_pc = 484;
                    continue;
                }
            },
            484 => {
                {
                    sdl_pc = 485;
                    continue;
                }
            },
            485 => {
                src_125 = @ptrCast(@alignCast(srcbuf + @as(usize, @bitCast(@as(isize, @intCast(start_121 * @as(c_int, 4)))))));
                dst_126 = @ptrCast(@alignCast(dstbuf + @as(usize, @bitCast(@as(isize, @intCast(startcol_123 * @as(c_int, 4)))))));
                i_124 = 0;
                {
                    sdl_pc = 488;
                    continue;
                }
            },
            486 => {
                if (false) {
                    sdl_pc = 485;
                    continue;
                } else {
                    sdl_pc = 487;
                    continue;
                }
            },
            487 => {
                {
                    sdl_pc = 475;
                    continue;
                }
            },
            488 => {
                if (i_124 < len_122) {
                    sdl_pc = 489;
                    continue;
                } else {
                    sdl_pc = 491;
                    continue;
                }
            },
            489 => {
                s_127 = (blk: {
                    const ref = &src_125;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                d_128 = dst_126.*;
                (blk: {
                    const ref = &dst_126;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = (((s_127 & @as(Uint32, 16711422)) +% (d_128 & @as(Uint32, 16711422))) >> @intCast(@as(Uint32, 1))) +% ((s_127 & d_128) & @as(Uint32, 65793));
                {
                    sdl_pc = 490;
                    continue;
                }
            },
            490 => {
                i_124 += 1;
                {
                    sdl_pc = 488;
                    continue;
                }
            },
            491 => {
                {
                    sdl_pc = 486;
                    continue;
                }
            },
            492 => {
                {
                    sdl_pc = 469;
                    continue;
                }
            },
            493 => {
                {
                    sdl_pc = 494;
                    continue;
                }
            },
            494 => {
                {
                    sdl_pc = 472;
                    continue;
                }
            },
            495 => {
                ofs_117 = 0;
                dstbuf += @as(usize, @bitCast(@as(isize, @intCast(surf_dst.*.pitch))));
                if (!((blk: {
                    const ref = &linecount_116;
                    ref.* -= 1;
                    break :blk ref.*;
                }) != 0)) {
                    sdl_pc = 498;
                    continue;
                } else {
                    sdl_pc = 499;
                    continue;
                }
            },
            496 => {
                {
                    sdl_pc = 497;
                    continue;
                }
            },
            497 => {
                {
                    sdl_pc = 468;
                    continue;
                }
            },
            498 => {
                {
                    sdl_pc = 469;
                    continue;
                }
            },
            499 => {
                {
                    sdl_pc = 500;
                    continue;
                }
            },
            500 => {
                {
                    sdl_pc = 497;
                    continue;
                }
            },
            501 => {
                linecount_129 = srcrect.*.h;
                ofs_130 = 0;
                left_131 = srcrect.*.x;
                right_132 = left_131 + srcrect.*.w;
                dstbuf -= @as(usize, @bitCast(@as(isize, @intCast(left_131 * @as(c_int, 4)))));
                {
                    sdl_pc = 504;
                    continue;
                }
            },
            502 => {
                if (false) {
                    sdl_pc = 501;
                    continue;
                } else {
                    sdl_pc = 503;
                    continue;
                }
            },
            503 => {
                {
                    sdl_pc = 462;
                    continue;
                }
            },
            504 => {
                if (true) {
                    sdl_pc = 505;
                    continue;
                } else {
                    sdl_pc = 507;
                    continue;
                }
            },
            505 => {
                ofs_130 += @as([*c]Uint16, @ptrCast(@alignCast(srcbuf))).*;
                run_133 = @as([*c]Uint16, @ptrCast(@alignCast(srcbuf)))[@as(c_int, 1)];
                srcbuf += @as(c_ulong, 2) *% @sizeOf(Uint16);
                if (run_133 != 0) {
                    sdl_pc = 508;
                    continue;
                } else {
                    sdl_pc = 509;
                    continue;
                }
            },
            506 => {
                {
                    sdl_pc = 504;
                    continue;
                }
            },
            507 => {
                {
                    sdl_pc = 502;
                    continue;
                }
            },
            508 => {
                if (ofs_130 < right_132) {
                    sdl_pc = 511;
                    continue;
                } else {
                    sdl_pc = 512;
                    continue;
                }
            },
            509 => {
                if (!(ofs_130 != 0)) {
                    sdl_pc = 530;
                    continue;
                } else {
                    sdl_pc = 531;
                    continue;
                }
            },
            510 => {
                if (ofs_130 == w) {
                    sdl_pc = 533;
                    continue;
                } else {
                    sdl_pc = 534;
                    continue;
                }
            },
            511 => {
                start_134 = 0;
                len_135 = run_133;
                if ((left_131 - ofs_130) > @as(c_int, 0)) {
                    sdl_pc = 514;
                    continue;
                } else {
                    sdl_pc = 515;
                    continue;
                }
            },
            512 => {
                {
                    sdl_pc = 513;
                    continue;
                }
            },
            513 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            514 => {
                start_134 = left_131 - ofs_130;
                len_135 -= start_134;
                if (len_135 <= @as(c_int, 0)) {
                    sdl_pc = 517;
                    continue;
                } else {
                    sdl_pc = 518;
                    continue;
                }
            },
            515 => {
                {
                    sdl_pc = 516;
                    continue;
                }
            },
            516 => {
                startcol_136 = ofs_130 + start_134;
                if (len_135 > (right_132 - startcol_136)) {
                    sdl_pc = 520;
                    continue;
                } else {
                    sdl_pc = 521;
                    continue;
                }
            },
            517 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            518 => {
                {
                    sdl_pc = 519;
                    continue;
                }
            },
            519 => {
                {
                    sdl_pc = 516;
                    continue;
                }
            },
            520 => {
                len_135 = right_132 - startcol_136;
                {
                    sdl_pc = 522;
                    continue;
                }
            },
            521 => {
                {
                    sdl_pc = 522;
                    continue;
                }
            },
            522 => {
                {
                    sdl_pc = 523;
                    continue;
                }
            },
            523 => {
                src_138 = @ptrCast(@alignCast(srcbuf + @as(usize, @bitCast(@as(isize, @intCast(start_134 * @as(c_int, 4)))))));
                dst_139 = @ptrCast(@alignCast(dstbuf + @as(usize, @bitCast(@as(isize, @intCast(startcol_136 * @as(c_int, 4)))))));
                i_137 = 0;
                {
                    sdl_pc = 526;
                    continue;
                }
            },
            524 => {
                if (false) {
                    sdl_pc = 523;
                    continue;
                } else {
                    sdl_pc = 525;
                    continue;
                }
            },
            525 => {
                {
                    sdl_pc = 513;
                    continue;
                }
            },
            526 => {
                if (i_137 < len_135) {
                    sdl_pc = 527;
                    continue;
                } else {
                    sdl_pc = 529;
                    continue;
                }
            },
            527 => {
                s_140 = (blk: {
                    const ref = &src_138;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                d_141 = dst_139.*;
                s1 = s_140 & @as(Uint32, 16711935);
                d1 = d_141 & @as(Uint32, 16711935);
                d1 = (d1 +% (((s1 -% d1) *% alpha) >> @intCast(@as(Uint32, 8)))) & @as(Uint32, 16711935);
                s_140 &= 65280;
                d_141 &= 65280;
                d_141 = (d_141 +% (((s_140 -% d_141) *% alpha) >> @intCast(@as(Uint32, 8)))) & @as(Uint32, 65280);
                (blk: {
                    const ref = &dst_139;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = d1 | d_141;
                {
                    sdl_pc = 528;
                    continue;
                }
            },
            528 => {
                i_137 += 1;
                {
                    sdl_pc = 526;
                    continue;
                }
            },
            529 => {
                {
                    sdl_pc = 524;
                    continue;
                }
            },
            530 => {
                {
                    sdl_pc = 507;
                    continue;
                }
            },
            531 => {
                {
                    sdl_pc = 532;
                    continue;
                }
            },
            532 => {
                {
                    sdl_pc = 510;
                    continue;
                }
            },
            533 => {
                ofs_130 = 0;
                dstbuf += @as(usize, @bitCast(@as(isize, @intCast(surf_dst.*.pitch))));
                if (!((blk: {
                    const ref = &linecount_129;
                    ref.* -= 1;
                    break :blk ref.*;
                }) != 0)) {
                    sdl_pc = 536;
                    continue;
                } else {
                    sdl_pc = 537;
                    continue;
                }
            },
            534 => {
                {
                    sdl_pc = 535;
                    continue;
                }
            },
            535 => {
                {
                    sdl_pc = 506;
                    continue;
                }
            },
            536 => {
                {
                    sdl_pc = 507;
                    continue;
                }
            },
            537 => {
                {
                    sdl_pc = 538;
                    continue;
                }
            },
            538 => {
                {
                    sdl_pc = 535;
                    continue;
                }
            },
            539 => {
                linecount_142 = srcrect.*.h;
                ofs_143 = 0;
                left_144 = srcrect.*.x;
                right_145 = left_144 + srcrect.*.w;
                dstbuf -= @as(usize, @bitCast(@as(isize, @intCast(left_144 * @as(c_int, 4)))));
                {
                    sdl_pc = 542;
                    continue;
                }
            },
            540 => {
                if (false) {
                    sdl_pc = 539;
                    continue;
                } else {
                    sdl_pc = 541;
                    continue;
                }
            },
            541 => {
                {
                    sdl_pc = 459;
                    continue;
                }
            },
            542 => {
                if (true) {
                    sdl_pc = 543;
                    continue;
                } else {
                    sdl_pc = 545;
                    continue;
                }
            },
            543 => {
                ofs_143 += @as([*c]Uint16, @ptrCast(@alignCast(srcbuf))).*;
                run_146 = @as([*c]Uint16, @ptrCast(@alignCast(srcbuf)))[@as(c_int, 1)];
                srcbuf += @as(c_ulong, 2) *% @sizeOf(Uint16);
                if (run_146 != 0) {
                    sdl_pc = 546;
                    continue;
                } else {
                    sdl_pc = 547;
                    continue;
                }
            },
            544 => {
                {
                    sdl_pc = 542;
                    continue;
                }
            },
            545 => {
                {
                    sdl_pc = 540;
                    continue;
                }
            },
            546 => {
                if (ofs_143 < right_145) {
                    sdl_pc = 549;
                    continue;
                } else {
                    sdl_pc = 550;
                    continue;
                }
            },
            547 => {
                if (!(ofs_143 != 0)) {
                    sdl_pc = 576;
                    continue;
                } else {
                    sdl_pc = 577;
                    continue;
                }
            },
            548 => {
                if (ofs_143 == w) {
                    sdl_pc = 579;
                    continue;
                } else {
                    sdl_pc = 580;
                    continue;
                }
            },
            549 => {
                start_147 = 0;
                len_148 = run_146;
                if ((left_144 - ofs_143) > @as(c_int, 0)) {
                    sdl_pc = 552;
                    continue;
                } else {
                    sdl_pc = 553;
                    continue;
                }
            },
            550 => {
                {
                    sdl_pc = 551;
                    continue;
                }
            },
            551 => {
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            552 => {
                start_147 = left_144 - ofs_143;
                len_148 -= start_147;
                if (len_148 <= @as(c_int, 0)) {
                    sdl_pc = 555;
                    continue;
                } else {
                    sdl_pc = 556;
                    continue;
                }
            },
            553 => {
                {
                    sdl_pc = 554;
                    continue;
                }
            },
            554 => {
                startcol_149 = ofs_143 + start_147;
                if (len_148 > (right_145 - startcol_149)) {
                    sdl_pc = 558;
                    continue;
                } else {
                    sdl_pc = 559;
                    continue;
                }
            },
            555 => {
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            556 => {
                {
                    sdl_pc = 557;
                    continue;
                }
            },
            557 => {
                {
                    sdl_pc = 554;
                    continue;
                }
            },
            558 => {
                len_148 = right_145 - startcol_149;
                {
                    sdl_pc = 560;
                    continue;
                }
            },
            559 => {
                {
                    sdl_pc = 560;
                    continue;
                }
            },
            560 => {
                {
                    sdl_pc = 561;
                    continue;
                }
            },
            561 => {
                src_151 = srcbuf + @as(usize, @bitCast(@as(isize, @intCast(start_147 * @as(c_int, 4)))));
                dst_152 = dstbuf + @as(usize, @bitCast(@as(isize, @intCast(startcol_149 * @as(c_int, 4)))));
                i_150 = 0;
                {
                    sdl_pc = 564;
                    continue;
                }
            },
            562 => {
                if (false) {
                    sdl_pc = 561;
                    continue;
                } else {
                    sdl_pc = 563;
                    continue;
                }
            },
            563 => {
                {
                    sdl_pc = 551;
                    continue;
                }
            },
            564 => {
                if (i_150 < len_148) {
                    sdl_pc = 565;
                    continue;
                } else {
                    sdl_pc = 567;
                    continue;
                }
            },
            565 => {
                s_153 = 0;
                d_154 = 0;
                switch (@as(c_int, 4)) {
                    @as(c_int, 2) => {
                        sdl_pc = 569;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 570;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 571;
                        continue;
                    },
                    else => {
                        sdl_pc = 568;
                        continue;
                    },
                }
            },
            566 => {
                i_150 += 1;
                {
                    sdl_pc = 564;
                    continue;
                }
            },
            567 => {
                {
                    sdl_pc = 562;
                    continue;
                }
            },
            568 => {
                rs_155 = SDL_expand_byte[fmt.*.Rbits][(s_153 & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                gs_156 = SDL_expand_byte[fmt.*.Gbits][(s_153 & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                bs_157 = SDL_expand_byte[fmt.*.Bbits][(s_153 & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                rd_158 = SDL_expand_byte[fmt.*.Rbits][(d_154 & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                gd_159 = SDL_expand_byte[fmt.*.Gbits][(d_154 & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                bd_160 = SDL_expand_byte[fmt.*.Bbits][(d_154 & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                rd_158 +%= ((rs_155 -% rd_158) *% alpha) >> @intCast(@as(c_uint, 8));
                gd_159 +%= ((gs_156 -% gd_159) *% alpha) >> @intCast(@as(c_uint, 8));
                bd_160 +%= ((bs_157 -% bd_160) *% alpha) >> @intCast(@as(c_uint, 8));
                d_154 = ((((rd_158 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((gd_159 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((bd_160 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask;
                switch (@as(c_int, 4)) {
                    @as(c_int, 2) => {
                        sdl_pc = 573;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 574;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 575;
                        continue;
                    },
                    else => {
                        sdl_pc = 572;
                        continue;
                    },
                }
            },
            569 => {
                s_153 = @as([*c]Uint16, @ptrCast(@alignCast(src_151))).*;
                d_154 = @as([*c]Uint16, @ptrCast(@alignCast(dst_152))).*;
                {
                    sdl_pc = 568;
                    continue;
                }
            },
            570 => {
                s_153 = @bitCast(@as(c_int, ((@as(c_int, src_151[@as(c_int, 2)]) << @intCast(@as(c_int, 16))) | (@as(c_int, src_151[@as(c_int, 1)]) << @intCast(@as(c_int, 8)))) | @as(c_int, src_151[@as(c_int, 0)])));
                d_154 = @bitCast(@as(c_int, ((@as(c_int, dst_152[@as(c_int, 2)]) << @intCast(@as(c_int, 16))) | (@as(c_int, dst_152[@as(c_int, 1)]) << @intCast(@as(c_int, 8)))) | @as(c_int, dst_152[@as(c_int, 0)])));
                {
                    sdl_pc = 568;
                    continue;
                }
            },
            571 => {
                s_153 = @as([*c]Uint32, @ptrCast(@alignCast(src_151))).*;
                d_154 = @as([*c]Uint32, @ptrCast(@alignCast(dst_152))).*;
                {
                    sdl_pc = 568;
                    continue;
                }
            },
            572 => {
                src_151 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                dst_152 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                {
                    sdl_pc = 566;
                    continue;
                }
            },
            573 => {
                @as([*c]Uint16, @ptrCast(@alignCast(dst_152))).* = @truncate(d_154);
                {
                    sdl_pc = 572;
                    continue;
                }
            },
            574 => {
                dst_152[@as(c_int, 0)] = @truncate(d_154);
                dst_152[@as(c_int, 1)] = @truncate(d_154 >> @intCast(@as(Uint32, 8)));
                dst_152[@as(c_int, 2)] = @truncate(d_154 >> @intCast(@as(Uint32, 16)));
                {
                    sdl_pc = 572;
                    continue;
                }
            },
            575 => {
                @as([*c]Uint32, @ptrCast(@alignCast(dst_152))).* = d_154;
                {
                    sdl_pc = 572;
                    continue;
                }
            },
            576 => {
                {
                    sdl_pc = 545;
                    continue;
                }
            },
            577 => {
                {
                    sdl_pc = 578;
                    continue;
                }
            },
            578 => {
                {
                    sdl_pc = 548;
                    continue;
                }
            },
            579 => {
                ofs_143 = 0;
                dstbuf += @as(usize, @bitCast(@as(isize, @intCast(surf_dst.*.pitch))));
                if (!((blk: {
                    const ref = &linecount_142;
                    ref.* -= 1;
                    break :blk ref.*;
                }) != 0)) {
                    sdl_pc = 582;
                    continue;
                } else {
                    sdl_pc = 583;
                    continue;
                }
            },
            580 => {
                {
                    sdl_pc = 581;
                    continue;
                }
            },
            581 => {
                {
                    sdl_pc = 544;
                    continue;
                }
            },
            582 => {
                {
                    sdl_pc = 545;
                    continue;
                }
            },
            583 => {
                {
                    sdl_pc = 584;
                    continue;
                }
            },
            584 => {
                {
                    sdl_pc = 581;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn SDL_RLEBlit(surf_src: [*c]SDL_Surface, srcrect: [*c]const SDL_Rect, surf_dst: [*c]SDL_Surface, dstrect: [*c]const SDL_Rect) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var dstbuf: [*c]Uint8 = undefined;
    _ = &dstbuf;
    var srcbuf: [*c]Uint8 = undefined;
    _ = &srcbuf;
    var x: c_int = undefined;
    _ = &x;
    var y: c_int = undefined;
    _ = &y;
    var w: c_int = undefined;
    _ = &w;
    var alpha: c_uint = undefined;
    _ = &alpha;
    var vskip: c_int = undefined;
    _ = &vskip;
    var ofs: c_int = undefined;
    _ = &ofs;
    var run: c_int = undefined;
    _ = &run;
    var run_1: c_int = undefined;
    _ = &run_1;
    var run_2: c_int = undefined;
    _ = &run_2;
    var run_3: c_int = undefined;
    _ = &run_3;
    var fmt: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &fmt;
    var linecount: c_int = undefined;
    _ = &linecount;
    var ofs_4: c_int = undefined;
    _ = &ofs_4;
    var run_5: c_uint = undefined;
    _ = &run_5;
    var linecount_6: c_int = undefined;
    _ = &linecount_6;
    var ofs_7: c_int = undefined;
    _ = &ofs_7;
    var run_8: c_uint = undefined;
    _ = &run_8;
    var linecount_9: c_int = undefined;
    _ = &linecount_9;
    var ofs_10: c_int = undefined;
    _ = &ofs_10;
    var run_11: c_uint = undefined;
    _ = &run_11;
    var linecount_12: c_int = undefined;
    _ = &linecount_12;
    var ofs_13: c_int = undefined;
    _ = &ofs_13;
    var run_14: c_uint = undefined;
    _ = &run_14;
    var linecount_15: c_int = undefined;
    _ = &linecount_15;
    var ofs_16: c_int = undefined;
    _ = &ofs_16;
    var run_17: c_uint = undefined;
    _ = &run_17;
    var n: c_uint = undefined;
    _ = &n;
    var src: [*c]Uint16 = undefined;
    _ = &src;
    var dst: [*c]Uint16 = undefined;
    _ = &dst;
    var s: Uint32 = undefined;
    _ = &s;
    var d: Uint32 = undefined;
    _ = &d;
    var s_18: Uint32 = undefined;
    _ = &s_18;
    var d_19: Uint32 = undefined;
    _ = &d_19;
    var s_20: Uint32 = undefined;
    _ = &s_20;
    var d_21: Uint32 = undefined;
    _ = &d_21;
    var s_22: Uint32 = undefined;
    _ = &s_22;
    var d_23: Uint32 = undefined;
    _ = &d_23;
    var linecount_24: c_int = undefined;
    _ = &linecount_24;
    var ofs_25: c_int = undefined;
    _ = &ofs_25;
    var run_26: c_uint = undefined;
    _ = &run_26;
    var i: c_int = undefined;
    _ = &i;
    var src_27: [*c]Uint16 = undefined;
    _ = &src_27;
    var dst_28: [*c]Uint16 = undefined;
    _ = &dst_28;
    var ALPHA: Uint32 = undefined;
    _ = &ALPHA;
    var s_29: Uint32 = undefined;
    _ = &s_29;
    var d_30: Uint32 = undefined;
    _ = &d_30;
    var linecount_31: c_int = undefined;
    _ = &linecount_31;
    var ofs_32: c_int = undefined;
    _ = &ofs_32;
    var run_33: c_uint = undefined;
    _ = &run_33;
    var n_34: c_uint = undefined;
    _ = &n_34;
    var src_35: [*c]Uint16 = undefined;
    _ = &src_35;
    var dst_36: [*c]Uint16 = undefined;
    _ = &dst_36;
    var s_37: Uint32 = undefined;
    _ = &s_37;
    var d_38: Uint32 = undefined;
    _ = &d_38;
    var s_39: Uint32 = undefined;
    _ = &s_39;
    var d_40: Uint32 = undefined;
    _ = &d_40;
    var s_41: Uint32 = undefined;
    _ = &s_41;
    var d_42: Uint32 = undefined;
    _ = &d_42;
    var s_43: Uint32 = undefined;
    _ = &s_43;
    var d_44: Uint32 = undefined;
    _ = &d_44;
    var linecount_45: c_int = undefined;
    _ = &linecount_45;
    var ofs_46: c_int = undefined;
    _ = &ofs_46;
    var run_47: c_uint = undefined;
    _ = &run_47;
    var i_48: c_int = undefined;
    _ = &i_48;
    var src_49: [*c]Uint16 = undefined;
    _ = &src_49;
    var dst_50: [*c]Uint16 = undefined;
    _ = &dst_50;
    var ALPHA_51: Uint32 = undefined;
    _ = &ALPHA_51;
    var s_52: Uint32 = undefined;
    _ = &s_52;
    var d_53: Uint32 = undefined;
    _ = &d_53;
    var linecount_54: c_int = undefined;
    _ = &linecount_54;
    var ofs_55: c_int = undefined;
    _ = &ofs_55;
    var run_56: c_uint = undefined;
    _ = &run_56;
    var i_57: c_int = undefined;
    _ = &i_57;
    var src_58: [*c]Uint8 = undefined;
    _ = &src_58;
    var dst_59: [*c]Uint8 = undefined;
    _ = &dst_59;
    var s_60: Uint32 = undefined;
    _ = &s_60;
    var d_61: Uint32 = undefined;
    _ = &d_61;
    var rs: c_uint = undefined;
    _ = &rs;
    var gs: c_uint = undefined;
    _ = &gs;
    var bs: c_uint = undefined;
    _ = &bs;
    var rd: c_uint = undefined;
    _ = &rd;
    var gd: c_uint = undefined;
    _ = &gd;
    var bd: c_uint = undefined;
    _ = &bd;
    var linecount_62: c_int = undefined;
    _ = &linecount_62;
    var ofs_63: c_int = undefined;
    _ = &ofs_63;
    var run_64: c_uint = undefined;
    _ = &run_64;
    var i_65: c_int = undefined;
    _ = &i_65;
    var src_66: [*c]Uint8 = undefined;
    _ = &src_66;
    var dst_67: [*c]Uint8 = undefined;
    _ = &dst_67;
    var s_68: Uint32 = undefined;
    _ = &s_68;
    var d_69: Uint32 = undefined;
    _ = &d_69;
    var rs_70: c_uint = undefined;
    _ = &rs_70;
    var gs_71: c_uint = undefined;
    _ = &gs_71;
    var bs_72: c_uint = undefined;
    _ = &bs_72;
    var rd_73: c_uint = undefined;
    _ = &rd_73;
    var gd_74: c_uint = undefined;
    _ = &gd_74;
    var bd_75: c_uint = undefined;
    _ = &bd_75;
    var linecount_76: c_int = undefined;
    _ = &linecount_76;
    var ofs_77: c_int = undefined;
    _ = &ofs_77;
    var run_78: c_uint = undefined;
    _ = &run_78;
    var i_79: c_int = undefined;
    _ = &i_79;
    var src_80: [*c]Uint32 = undefined;
    _ = &src_80;
    var dst_81: [*c]Uint32 = undefined;
    _ = &dst_81;
    var s_82: Uint32 = undefined;
    _ = &s_82;
    var d_83: Uint32 = undefined;
    _ = &d_83;
    var linecount_84: c_int = undefined;
    _ = &linecount_84;
    var ofs_85: c_int = undefined;
    _ = &ofs_85;
    var run_86: c_uint = undefined;
    _ = &run_86;
    var i_87: c_int = undefined;
    _ = &i_87;
    var src_88: [*c]Uint32 = undefined;
    _ = &src_88;
    var dst_89: [*c]Uint32 = undefined;
    _ = &dst_89;
    var s_90: Uint32 = undefined;
    _ = &s_90;
    var d_91: Uint32 = undefined;
    _ = &d_91;
    var s1: Uint32 = undefined;
    _ = &s1;
    var d1: Uint32 = undefined;
    _ = &d1;
    var linecount_92: c_int = undefined;
    _ = &linecount_92;
    var ofs_93: c_int = undefined;
    _ = &ofs_93;
    var run_94: c_uint = undefined;
    _ = &run_94;
    var i_95: c_int = undefined;
    _ = &i_95;
    var src_96: [*c]Uint8 = undefined;
    _ = &src_96;
    var dst_97: [*c]Uint8 = undefined;
    _ = &dst_97;
    var s_98: Uint32 = undefined;
    _ = &s_98;
    var d_99: Uint32 = undefined;
    _ = &d_99;
    var rs_100: c_uint = undefined;
    _ = &rs_100;
    var gs_101: c_uint = undefined;
    _ = &gs_101;
    var bs_102: c_uint = undefined;
    _ = &bs_102;
    var rd_103: c_uint = undefined;
    _ = &rd_103;
    var gd_104: c_uint = undefined;
    _ = &gd_104;
    var bd_105: c_uint = undefined;
    _ = &bd_105;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                w = surf_src.*.w;
                if ((surf_dst.*.flags & SDL_SURFACE_LOCK_NEEDED) == SDL_SURFACE_LOCK_NEEDED) {
                    sdl_pc = 3;
                    continue;
                } else {
                    sdl_pc = 4;
                    continue;
                }
            },
            1 => {
                {
                    sdl_pc = 336;
                    continue;
                }
            },
            2 => {
                if ((surf_dst.*.flags & SDL_SURFACE_LOCK_NEEDED) == SDL_SURFACE_LOCK_NEEDED) {
                    sdl_pc = 498;
                    continue;
                } else {
                    sdl_pc = 499;
                    continue;
                }
            },
            3 => {
                if (!SDL_LockSurface_REAL(surf_dst)) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 7;
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
                x = dstrect.*.x;
                y = dstrect.*.y;
                dstbuf = (@as([*c]Uint8, @ptrCast(@alignCast(surf_dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * surf_dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, surf_src.*.fmt.*.bytes_per_pixel)))));
                srcbuf = @as([*c]Uint8, @ptrCast(@alignCast(surf_src.*.map.data))) + @sizeOf(SDL_PixelFormat);
                vskip = srcrect.*.y;
                ofs = 0;
                if (vskip != 0) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
            },
            6 => {
                return @"false" != 0;
            },
            7 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            8 => {
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            9 => {
                switch (@as(c_int, surf_src.*.fmt.*.bytes_per_pixel)) {
                    @as(c_int, 1) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 30;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 47;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 64;
                        continue;
                    },
                    else => {
                        sdl_pc = 12;
                        continue;
                    },
                }
            },
            10 => {
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                alpha = surf_src.*.map.info.a;
                if ((srcrect.*.x != 0) or (srcrect.*.w != surf_src.*.w)) {
                    sdl_pc = 81;
                    continue;
                } else {
                    sdl_pc = 82;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            13 => {
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            14 => {
                if (true) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            15 => {
                ofs += srcbuf.*;
                run = srcbuf[@as(c_int, 1)];
                srcbuf += @sizeOf(Uint8) *% @as(c_ulong, 2);
                if (run != 0) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            16 => {
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            18 => {
                srcbuf += @as(usize, @bitCast(@as(isize, @intCast(run * @as(c_int, 1)))));
                ofs += run;
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            19 => {
                if (!(ofs != 0)) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            20 => {
                if (ofs == w) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            21 => {
                {
                    sdl_pc = 2;
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
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            24 => {
                ofs = 0;
                if (!((blk: {
                    const ref = &vskip;
                    ref.* -= 1;
                    break :blk ref.*;
                }) != 0)) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            25 => {
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            26 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            27 => {
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            28 => {
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            29 => {
                {
                    sdl_pc = 26;
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
                if (true) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 34;
                    continue;
                }
            },
            32 => {
                ofs += srcbuf.*;
                run_1 = srcbuf[@as(c_int, 1)];
                srcbuf += @sizeOf(Uint8) *% @as(c_ulong, 2);
                if (run_1 != 0) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            33 => {
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            34 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            35 => {
                srcbuf += @as(usize, @bitCast(@as(isize, @intCast(run_1 * @as(c_int, 2)))));
                ofs += run_1;
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            36 => {
                if (!(ofs != 0)) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
                    continue;
                }
            },
            37 => {
                if (ofs == w) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            38 => {
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            39 => {
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            40 => {
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            41 => {
                ofs = 0;
                if (!((blk: {
                    const ref = &vskip;
                    ref.* -= 1;
                    break :blk ref.*;
                }) != 0)) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            42 => {
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            43 => {
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            44 => {
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            45 => {
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            46 => {
                {
                    sdl_pc = 43;
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
                if (true) {
                    sdl_pc = 49;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            49 => {
                ofs += srcbuf.*;
                run_2 = srcbuf[@as(c_int, 1)];
                srcbuf += @sizeOf(Uint8) *% @as(c_ulong, 2);
                if (run_2 != 0) {
                    sdl_pc = 52;
                    continue;
                } else {
                    sdl_pc = 53;
                    continue;
                }
            },
            50 => {
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            51 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            52 => {
                srcbuf += @as(usize, @bitCast(@as(isize, @intCast(run_2 * @as(c_int, 3)))));
                ofs += run_2;
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            53 => {
                if (!(ofs != 0)) {
                    sdl_pc = 55;
                    continue;
                } else {
                    sdl_pc = 56;
                    continue;
                }
            },
            54 => {
                if (ofs == w) {
                    sdl_pc = 58;
                    continue;
                } else {
                    sdl_pc = 59;
                    continue;
                }
            },
            55 => {
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            56 => {
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            57 => {
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            58 => {
                ofs = 0;
                if (!((blk: {
                    const ref = &vskip;
                    ref.* -= 1;
                    break :blk ref.*;
                }) != 0)) {
                    sdl_pc = 61;
                    continue;
                } else {
                    sdl_pc = 62;
                    continue;
                }
            },
            59 => {
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            60 => {
                {
                    sdl_pc = 50;
                    continue;
                }
            },
            61 => {
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            62 => {
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            63 => {
                {
                    sdl_pc = 60;
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
                if (true) {
                    sdl_pc = 66;
                    continue;
                } else {
                    sdl_pc = 68;
                    continue;
                }
            },
            66 => {
                ofs += @as([*c]Uint16, @ptrCast(@alignCast(srcbuf))).*;
                run_3 = @as([*c]Uint16, @ptrCast(@alignCast(srcbuf)))[@as(c_int, 1)];
                srcbuf += @sizeOf(Uint16) *% @as(c_ulong, 2);
                if (run_3 != 0) {
                    sdl_pc = 69;
                    continue;
                } else {
                    sdl_pc = 70;
                    continue;
                }
            },
            67 => {
                {
                    sdl_pc = 65;
                    continue;
                }
            },
            68 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            69 => {
                srcbuf += @as(usize, @bitCast(@as(isize, @intCast(run_3 * @as(c_int, 4)))));
                ofs += run_3;
                {
                    sdl_pc = 71;
                    continue;
                }
            },
            70 => {
                if (!(ofs != 0)) {
                    sdl_pc = 72;
                    continue;
                } else {
                    sdl_pc = 73;
                    continue;
                }
            },
            71 => {
                if (ofs == w) {
                    sdl_pc = 75;
                    continue;
                } else {
                    sdl_pc = 76;
                    continue;
                }
            },
            72 => {
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            73 => {
                {
                    sdl_pc = 74;
                    continue;
                }
            },
            74 => {
                {
                    sdl_pc = 71;
                    continue;
                }
            },
            75 => {
                ofs = 0;
                if (!((blk: {
                    const ref = &vskip;
                    ref.* -= 1;
                    break :blk ref.*;
                }) != 0)) {
                    sdl_pc = 78;
                    continue;
                } else {
                    sdl_pc = 79;
                    continue;
                }
            },
            76 => {
                {
                    sdl_pc = 77;
                    continue;
                }
            },
            77 => {
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            78 => {
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            79 => {
                {
                    sdl_pc = 80;
                    continue;
                }
            },
            80 => {
                {
                    sdl_pc = 77;
                    continue;
                }
            },
            81 => {
                RLEClipBlit(w, srcbuf, surf_dst, dstbuf, srcrect, alpha);
                {
                    sdl_pc = 83;
                    continue;
                }
            },
            82 => {
                fmt = surf_src.*.fmt;
                {
                    sdl_pc = 84;
                    continue;
                }
            },
            83 => {
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            84 => {
                if (alpha == @as(c_uint, 255)) {
                    sdl_pc = 87;
                    continue;
                } else {
                    sdl_pc = 88;
                    continue;
                }
            },
            85 => {
                if (false) {
                    sdl_pc = 84;
                    continue;
                } else {
                    sdl_pc = 86;
                    continue;
                }
            },
            86 => {
                {
                    sdl_pc = 83;
                    continue;
                }
            },
            87 => {
                switch (@as(c_int, fmt.*.bytes_per_pixel)) {
                    @as(c_int, 1) => {
                        sdl_pc = 91;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 111;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 131;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 151;
                        continue;
                    },
                    else => {
                        sdl_pc = 90;
                        continue;
                    },
                }
            },
            88 => {
                switch (@as(c_int, fmt.*.bytes_per_pixel)) {
                    @as(c_int, 1) => {
                        sdl_pc = 172;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 173;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 370;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 405;
                        continue;
                    },
                    else => {
                        sdl_pc = 171;
                        continue;
                    },
                }
            },
            89 => {
                {
                    sdl_pc = 85;
                    continue;
                }
            },
            90 => {
                {
                    sdl_pc = 89;
                    continue;
                }
            },
            91 => {
                {
                    sdl_pc = 92;
                    continue;
                }
            },
            92 => {
                linecount = srcrect.*.h;
                ofs_4 = 0;
                {
                    sdl_pc = 95;
                    continue;
                }
            },
            93 => {
                if (false) {
                    sdl_pc = 92;
                    continue;
                } else {
                    sdl_pc = 94;
                    continue;
                }
            },
            94 => {
                {
                    sdl_pc = 90;
                    continue;
                }
            },
            95 => {
                if (true) {
                    sdl_pc = 96;
                    continue;
                } else {
                    sdl_pc = 98;
                    continue;
                }
            },
            96 => {
                ofs_4 += srcbuf.*;
                run_5 = srcbuf[@as(c_int, 1)];
                srcbuf += @as(c_ulong, 2) *% @sizeOf(Uint8);
                if (run_5 != 0) {
                    sdl_pc = 99;
                    continue;
                } else {
                    sdl_pc = 100;
                    continue;
                }
            },
            97 => {
                {
                    sdl_pc = 95;
                    continue;
                }
            },
            98 => {
                {
                    sdl_pc = 93;
                    continue;
                }
            },
            99 => {
                _ = memcpy(@ptrCast(@alignCast(dstbuf + @as(usize, @bitCast(@as(isize, @intCast(ofs_4 * @as(c_int, 1))))))), @ptrCast(@alignCast(srcbuf)), @as(usize, run_5) *% @as(usize, @bitCast(@as(c_long, @as(c_int, 1)))));
                srcbuf += run_5 *% @as(c_uint, 1);
                {
                    const ref = &ofs_4;
                    ref.* = @bitCast(@as(c_uint, @truncate(@as(c_uint, @bitCast(@as(c_int, ref.*))) +% run_5)));
                }
                {
                    sdl_pc = 101;
                    continue;
                }
            },
            100 => {
                if (!(ofs_4 != 0)) {
                    sdl_pc = 102;
                    continue;
                } else {
                    sdl_pc = 103;
                    continue;
                }
            },
            101 => {
                if (ofs_4 == w) {
                    sdl_pc = 105;
                    continue;
                } else {
                    sdl_pc = 106;
                    continue;
                }
            },
            102 => {
                {
                    sdl_pc = 98;
                    continue;
                }
            },
            103 => {
                {
                    sdl_pc = 104;
                    continue;
                }
            },
            104 => {
                {
                    sdl_pc = 101;
                    continue;
                }
            },
            105 => {
                ofs_4 = 0;
                dstbuf += @as(usize, @bitCast(@as(isize, @intCast(surf_dst.*.pitch))));
                if (!((blk: {
                    const ref = &linecount;
                    ref.* -= 1;
                    break :blk ref.*;
                }) != 0)) {
                    sdl_pc = 108;
                    continue;
                } else {
                    sdl_pc = 109;
                    continue;
                }
            },
            106 => {
                {
                    sdl_pc = 107;
                    continue;
                }
            },
            107 => {
                {
                    sdl_pc = 97;
                    continue;
                }
            },
            108 => {
                {
                    sdl_pc = 98;
                    continue;
                }
            },
            109 => {
                {
                    sdl_pc = 110;
                    continue;
                }
            },
            110 => {
                {
                    sdl_pc = 107;
                    continue;
                }
            },
            111 => {
                {
                    sdl_pc = 112;
                    continue;
                }
            },
            112 => {
                linecount_6 = srcrect.*.h;
                ofs_7 = 0;
                {
                    sdl_pc = 115;
                    continue;
                }
            },
            113 => {
                if (false) {
                    sdl_pc = 112;
                    continue;
                } else {
                    sdl_pc = 114;
                    continue;
                }
            },
            114 => {
                {
                    sdl_pc = 90;
                    continue;
                }
            },
            115 => {
                if (true) {
                    sdl_pc = 116;
                    continue;
                } else {
                    sdl_pc = 118;
                    continue;
                }
            },
            116 => {
                ofs_7 += srcbuf.*;
                run_8 = srcbuf[@as(c_int, 1)];
                srcbuf += @as(c_ulong, 2) *% @sizeOf(Uint8);
                if (run_8 != 0) {
                    sdl_pc = 119;
                    continue;
                } else {
                    sdl_pc = 120;
                    continue;
                }
            },
            117 => {
                {
                    sdl_pc = 115;
                    continue;
                }
            },
            118 => {
                {
                    sdl_pc = 113;
                    continue;
                }
            },
            119 => {
                _ = memcpy(@ptrCast(@alignCast(dstbuf + @as(usize, @bitCast(@as(isize, @intCast(ofs_7 * @as(c_int, 2))))))), @ptrCast(@alignCast(srcbuf)), @as(usize, run_8) *% @as(usize, @bitCast(@as(c_long, @as(c_int, 2)))));
                srcbuf += run_8 *% @as(c_uint, 2);
                {
                    const ref = &ofs_7;
                    ref.* = @bitCast(@as(c_uint, @truncate(@as(c_uint, @bitCast(@as(c_int, ref.*))) +% run_8)));
                }
                {
                    sdl_pc = 121;
                    continue;
                }
            },
            120 => {
                if (!(ofs_7 != 0)) {
                    sdl_pc = 122;
                    continue;
                } else {
                    sdl_pc = 123;
                    continue;
                }
            },
            121 => {
                if (ofs_7 == w) {
                    sdl_pc = 125;
                    continue;
                } else {
                    sdl_pc = 126;
                    continue;
                }
            },
            122 => {
                {
                    sdl_pc = 118;
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
                ofs_7 = 0;
                dstbuf += @as(usize, @bitCast(@as(isize, @intCast(surf_dst.*.pitch))));
                if (!((blk: {
                    const ref = &linecount_6;
                    ref.* -= 1;
                    break :blk ref.*;
                }) != 0)) {
                    sdl_pc = 128;
                    continue;
                } else {
                    sdl_pc = 129;
                    continue;
                }
            },
            126 => {
                {
                    sdl_pc = 127;
                    continue;
                }
            },
            127 => {
                {
                    sdl_pc = 117;
                    continue;
                }
            },
            128 => {
                {
                    sdl_pc = 118;
                    continue;
                }
            },
            129 => {
                {
                    sdl_pc = 130;
                    continue;
                }
            },
            130 => {
                {
                    sdl_pc = 127;
                    continue;
                }
            },
            131 => {
                {
                    sdl_pc = 132;
                    continue;
                }
            },
            132 => {
                linecount_9 = srcrect.*.h;
                ofs_10 = 0;
                {
                    sdl_pc = 135;
                    continue;
                }
            },
            133 => {
                if (false) {
                    sdl_pc = 132;
                    continue;
                } else {
                    sdl_pc = 134;
                    continue;
                }
            },
            134 => {
                {
                    sdl_pc = 90;
                    continue;
                }
            },
            135 => {
                if (true) {
                    sdl_pc = 136;
                    continue;
                } else {
                    sdl_pc = 138;
                    continue;
                }
            },
            136 => {
                ofs_10 += srcbuf.*;
                run_11 = srcbuf[@as(c_int, 1)];
                srcbuf += @as(c_ulong, 2) *% @sizeOf(Uint8);
                if (run_11 != 0) {
                    sdl_pc = 139;
                    continue;
                } else {
                    sdl_pc = 140;
                    continue;
                }
            },
            137 => {
                {
                    sdl_pc = 135;
                    continue;
                }
            },
            138 => {
                {
                    sdl_pc = 133;
                    continue;
                }
            },
            139 => {
                _ = memcpy(@ptrCast(@alignCast(dstbuf + @as(usize, @bitCast(@as(isize, @intCast(ofs_10 * @as(c_int, 3))))))), @ptrCast(@alignCast(srcbuf)), @as(usize, run_11) *% @as(usize, @bitCast(@as(c_long, @as(c_int, 3)))));
                srcbuf += run_11 *% @as(c_uint, 3);
                {
                    const ref = &ofs_10;
                    ref.* = @bitCast(@as(c_uint, @truncate(@as(c_uint, @bitCast(@as(c_int, ref.*))) +% run_11)));
                }
                {
                    sdl_pc = 141;
                    continue;
                }
            },
            140 => {
                if (!(ofs_10 != 0)) {
                    sdl_pc = 142;
                    continue;
                } else {
                    sdl_pc = 143;
                    continue;
                }
            },
            141 => {
                if (ofs_10 == w) {
                    sdl_pc = 145;
                    continue;
                } else {
                    sdl_pc = 146;
                    continue;
                }
            },
            142 => {
                {
                    sdl_pc = 138;
                    continue;
                }
            },
            143 => {
                {
                    sdl_pc = 144;
                    continue;
                }
            },
            144 => {
                {
                    sdl_pc = 141;
                    continue;
                }
            },
            145 => {
                ofs_10 = 0;
                dstbuf += @as(usize, @bitCast(@as(isize, @intCast(surf_dst.*.pitch))));
                if (!((blk: {
                    const ref = &linecount_9;
                    ref.* -= 1;
                    break :blk ref.*;
                }) != 0)) {
                    sdl_pc = 148;
                    continue;
                } else {
                    sdl_pc = 149;
                    continue;
                }
            },
            146 => {
                {
                    sdl_pc = 147;
                    continue;
                }
            },
            147 => {
                {
                    sdl_pc = 137;
                    continue;
                }
            },
            148 => {
                {
                    sdl_pc = 138;
                    continue;
                }
            },
            149 => {
                {
                    sdl_pc = 150;
                    continue;
                }
            },
            150 => {
                {
                    sdl_pc = 147;
                    continue;
                }
            },
            151 => {
                {
                    sdl_pc = 152;
                    continue;
                }
            },
            152 => {
                linecount_12 = srcrect.*.h;
                ofs_13 = 0;
                {
                    sdl_pc = 155;
                    continue;
                }
            },
            153 => {
                if (false) {
                    sdl_pc = 152;
                    continue;
                } else {
                    sdl_pc = 154;
                    continue;
                }
            },
            154 => {
                {
                    sdl_pc = 90;
                    continue;
                }
            },
            155 => {
                if (true) {
                    sdl_pc = 156;
                    continue;
                } else {
                    sdl_pc = 158;
                    continue;
                }
            },
            156 => {
                ofs_13 += @as([*c]Uint16, @ptrCast(@alignCast(srcbuf))).*;
                run_14 = @as([*c]Uint16, @ptrCast(@alignCast(srcbuf)))[@as(c_int, 1)];
                srcbuf += @as(c_ulong, 2) *% @sizeOf(Uint16);
                if (run_14 != 0) {
                    sdl_pc = 159;
                    continue;
                } else {
                    sdl_pc = 160;
                    continue;
                }
            },
            157 => {
                {
                    sdl_pc = 155;
                    continue;
                }
            },
            158 => {
                {
                    sdl_pc = 153;
                    continue;
                }
            },
            159 => {
                _ = memcpy(@ptrCast(@alignCast(dstbuf + @as(usize, @bitCast(@as(isize, @intCast(ofs_13 * @as(c_int, 4))))))), @ptrCast(@alignCast(srcbuf)), @as(usize, run_14) *% @as(usize, @bitCast(@as(c_long, @as(c_int, 4)))));
                srcbuf += run_14 *% @as(c_uint, 4);
                {
                    const ref = &ofs_13;
                    ref.* = @bitCast(@as(c_uint, @truncate(@as(c_uint, @bitCast(@as(c_int, ref.*))) +% run_14)));
                }
                {
                    sdl_pc = 161;
                    continue;
                }
            },
            160 => {
                if (!(ofs_13 != 0)) {
                    sdl_pc = 162;
                    continue;
                } else {
                    sdl_pc = 163;
                    continue;
                }
            },
            161 => {
                if (ofs_13 == w) {
                    sdl_pc = 165;
                    continue;
                } else {
                    sdl_pc = 166;
                    continue;
                }
            },
            162 => {
                {
                    sdl_pc = 158;
                    continue;
                }
            },
            163 => {
                {
                    sdl_pc = 164;
                    continue;
                }
            },
            164 => {
                {
                    sdl_pc = 161;
                    continue;
                }
            },
            165 => {
                ofs_13 = 0;
                dstbuf += @as(usize, @bitCast(@as(isize, @intCast(surf_dst.*.pitch))));
                if (!((blk: {
                    const ref = &linecount_12;
                    ref.* -= 1;
                    break :blk ref.*;
                }) != 0)) {
                    sdl_pc = 168;
                    continue;
                } else {
                    sdl_pc = 169;
                    continue;
                }
            },
            166 => {
                {
                    sdl_pc = 167;
                    continue;
                }
            },
            167 => {
                {
                    sdl_pc = 157;
                    continue;
                }
            },
            168 => {
                {
                    sdl_pc = 158;
                    continue;
                }
            },
            169 => {
                {
                    sdl_pc = 170;
                    continue;
                }
            },
            170 => {
                {
                    sdl_pc = 167;
                    continue;
                }
            },
            171 => {
                {
                    sdl_pc = 89;
                    continue;
                }
            },
            172 => {
                {
                    sdl_pc = 171;
                    continue;
                }
            },
            173 => {
                switch ((fmt.*.Rmask | fmt.*.Gmask) | fmt.*.Bmask) {
                    @as(Uint32, 65535) => {
                        sdl_pc = 175;
                        continue;
                    },
                    @as(Uint32, 32767) => {
                        sdl_pc = 255;
                        continue;
                    },
                    else => {
                        sdl_pc = 335;
                        continue;
                    },
                }
            },
            174 => {
                {
                    sdl_pc = 171;
                    continue;
                }
            },
            175 => {
                if (((fmt.*.Gmask == @as(Uint32, 2016)) or (fmt.*.Rmask == @as(Uint32, 2016))) or (fmt.*.Bmask == @as(Uint32, 2016))) {
                    sdl_pc = 176;
                    continue;
                } else {
                    sdl_pc = 177;
                    continue;
                }
            },
            176 => {
                if (alpha == @as(c_uint, 128)) {
                    sdl_pc = 179;
                    continue;
                } else {
                    sdl_pc = 180;
                    continue;
                }
            },
            177 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            178 => {
                {
                    sdl_pc = 174;
                    continue;
                }
            },
            179 => {
                {
                    sdl_pc = 182;
                    continue;
                }
            },
            180 => {
                {
                    sdl_pc = 229;
                    continue;
                }
            },
            181 => {
                {
                    sdl_pc = 178;
                    continue;
                }
            },
            182 => {
                linecount_15 = srcrect.*.h;
                ofs_16 = 0;
                {
                    sdl_pc = 185;
                    continue;
                }
            },
            183 => {
                if (false) {
                    sdl_pc = 182;
                    continue;
                } else {
                    sdl_pc = 184;
                    continue;
                }
            },
            184 => {
                {
                    sdl_pc = 181;
                    continue;
                }
            },
            185 => {
                if (true) {
                    sdl_pc = 186;
                    continue;
                } else {
                    sdl_pc = 188;
                    continue;
                }
            },
            186 => {
                ofs_16 += srcbuf.*;
                run_17 = srcbuf[@as(c_int, 1)];
                srcbuf += @as(c_ulong, 2) *% @sizeOf(Uint8);
                if (run_17 != 0) {
                    sdl_pc = 189;
                    continue;
                } else {
                    sdl_pc = 190;
                    continue;
                }
            },
            187 => {
                {
                    sdl_pc = 185;
                    continue;
                }
            },
            188 => {
                {
                    sdl_pc = 183;
                    continue;
                }
            },
            189 => {
                {
                    sdl_pc = 192;
                    continue;
                }
            },
            190 => {
                if (!(ofs_16 != 0)) {
                    sdl_pc = 220;
                    continue;
                } else {
                    sdl_pc = 221;
                    continue;
                }
            },
            191 => {
                if (ofs_16 == w) {
                    sdl_pc = 223;
                    continue;
                } else {
                    sdl_pc = 224;
                    continue;
                }
            },
            192 => {
                n = run_17;
                src = @ptrCast(@alignCast(srcbuf));
                dst = @ptrCast(@alignCast(dstbuf + @as(usize, @bitCast(@as(isize, @intCast(ofs_16 * @as(c_int, 2)))))));
                if (((@as(usize, @intCast(@intFromPtr(src))) ^ @as(usize, @intCast(@intFromPtr(dst)))) & @as(usize, 3)) != 0) {
                    sdl_pc = 195;
                    continue;
                } else {
                    sdl_pc = 196;
                    continue;
                }
            },
            193 => {
                if (false) {
                    sdl_pc = 192;
                    continue;
                } else {
                    sdl_pc = 194;
                    continue;
                }
            },
            194 => {
                srcbuf += run_17 *% @as(c_uint, 2);
                {
                    const ref = &ofs_16;
                    ref.* = @bitCast(@as(c_uint, @truncate(@as(c_uint, @bitCast(@as(c_int, ref.*))) +% run_17)));
                }
                {
                    sdl_pc = 191;
                    continue;
                }
            },
            195 => {
                {
                    sdl_pc = 198;
                    continue;
                }
            },
            196 => {
                if ((@as(usize, @intCast(@intFromPtr(src))) & @as(usize, 3)) != 0) {
                    sdl_pc = 204;
                    continue;
                } else {
                    sdl_pc = 205;
                    continue;
                }
            },
            197 => {
                {
                    sdl_pc = 193;
                    continue;
                }
            },
            198 => {
                if ((blk: {
                    const ref = &n;
                    const tmp = ref.*;
                    ref.* -%= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 199;
                    continue;
                } else {
                    sdl_pc = 200;
                    continue;
                }
            },
            199 => {
                {
                    sdl_pc = 201;
                    continue;
                }
            },
            200 => {
                {
                    sdl_pc = 197;
                    continue;
                }
            },
            201 => {
                s = (blk: {
                    const ref = &src;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                d = dst.*;
                (blk: {
                    const ref = &dst;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @truncate((((s & @as(c_uint, 63454)) +% (d & @as(c_uint, 63454))) >> @intCast(@as(Uint32, 1))) +% ((s & d) & (~@as(c_uint, 63454) & @as(c_uint, 65535))));
                {
                    sdl_pc = 202;
                    continue;
                }
            },
            202 => {
                if (false) {
                    sdl_pc = 201;
                    continue;
                } else {
                    sdl_pc = 203;
                    continue;
                }
            },
            203 => {
                {
                    sdl_pc = 198;
                    continue;
                }
            },
            204 => {
                {
                    sdl_pc = 207;
                    continue;
                }
            },
            205 => {
                {
                    sdl_pc = 206;
                    continue;
                }
            },
            206 => {
                {
                    sdl_pc = 210;
                    continue;
                }
            },
            207 => {
                s_18 = (blk: {
                    const ref = &src;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                d_19 = dst.*;
                (blk: {
                    const ref = &dst;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @truncate((((s_18 & @as(c_uint, 63454)) +% (d_19 & @as(c_uint, 63454))) >> @intCast(@as(Uint32, 1))) +% ((s_18 & d_19) & (~@as(c_uint, 63454) & @as(c_uint, 65535))));
                {
                    sdl_pc = 208;
                    continue;
                }
            },
            208 => {
                if (false) {
                    sdl_pc = 207;
                    continue;
                } else {
                    sdl_pc = 209;
                    continue;
                }
            },
            209 => {
                n -%= 1;
                {
                    sdl_pc = 206;
                    continue;
                }
            },
            210 => {
                if (n > @as(c_uint, 1)) {
                    sdl_pc = 211;
                    continue;
                } else {
                    sdl_pc = 213;
                    continue;
                }
            },
            211 => {
                s_20 = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
                d_21 = @as([*c]Uint32, @ptrCast(@alignCast(dst))).*;
                @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = (((s_20 & (@as(c_uint, 63454) | (@as(c_uint, 63454) << @intCast(@as(c_uint, 16))))) >> @intCast(@as(Uint32, 1))) +% ((d_21 & (@as(c_uint, 63454) | (@as(c_uint, 63454) << @intCast(@as(c_uint, 16))))) >> @intCast(@as(Uint32, 1)))) +% ((s_20 & d_21) & ~(@as(c_uint, 63454) | (@as(c_uint, 63454) << @intCast(@as(c_uint, 16)))));
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                {
                    sdl_pc = 212;
                    continue;
                }
            },
            212 => {
                n -%= 2;
                {
                    sdl_pc = 210;
                    continue;
                }
            },
            213 => {
                if (n != 0) {
                    sdl_pc = 214;
                    continue;
                } else {
                    sdl_pc = 215;
                    continue;
                }
            },
            214 => {
                {
                    sdl_pc = 217;
                    continue;
                }
            },
            215 => {
                {
                    sdl_pc = 216;
                    continue;
                }
            },
            216 => {
                {
                    sdl_pc = 197;
                    continue;
                }
            },
            217 => {
                s_22 = (blk: {
                    const ref = &src;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                d_23 = dst.*;
                (blk: {
                    const ref = &dst;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @truncate((((s_22 & @as(c_uint, 63454)) +% (d_23 & @as(c_uint, 63454))) >> @intCast(@as(Uint32, 1))) +% ((s_22 & d_23) & (~@as(c_uint, 63454) & @as(c_uint, 65535))));
                {
                    sdl_pc = 218;
                    continue;
                }
            },
            218 => {
                if (false) {
                    sdl_pc = 217;
                    continue;
                } else {
                    sdl_pc = 219;
                    continue;
                }
            },
            219 => {
                {
                    sdl_pc = 216;
                    continue;
                }
            },
            220 => {
                {
                    sdl_pc = 188;
                    continue;
                }
            },
            221 => {
                {
                    sdl_pc = 222;
                    continue;
                }
            },
            222 => {
                {
                    sdl_pc = 191;
                    continue;
                }
            },
            223 => {
                ofs_16 = 0;
                dstbuf += @as(usize, @bitCast(@as(isize, @intCast(surf_dst.*.pitch))));
                if (!((blk: {
                    const ref = &linecount_15;
                    ref.* -= 1;
                    break :blk ref.*;
                }) != 0)) {
                    sdl_pc = 226;
                    continue;
                } else {
                    sdl_pc = 227;
                    continue;
                }
            },
            224 => {
                {
                    sdl_pc = 225;
                    continue;
                }
            },
            225 => {
                {
                    sdl_pc = 187;
                    continue;
                }
            },
            226 => {
                {
                    sdl_pc = 188;
                    continue;
                }
            },
            227 => {
                {
                    sdl_pc = 228;
                    continue;
                }
            },
            228 => {
                {
                    sdl_pc = 225;
                    continue;
                }
            },
            229 => {
                linecount_24 = srcrect.*.h;
                ofs_25 = 0;
                {
                    sdl_pc = 232;
                    continue;
                }
            },
            230 => {
                if (false) {
                    sdl_pc = 229;
                    continue;
                } else {
                    sdl_pc = 231;
                    continue;
                }
            },
            231 => {
                {
                    sdl_pc = 181;
                    continue;
                }
            },
            232 => {
                if (true) {
                    sdl_pc = 233;
                    continue;
                } else {
                    sdl_pc = 235;
                    continue;
                }
            },
            233 => {
                ofs_25 += srcbuf.*;
                run_26 = srcbuf[@as(c_int, 1)];
                srcbuf += @as(c_ulong, 2) *% @sizeOf(Uint8);
                if (run_26 != 0) {
                    sdl_pc = 236;
                    continue;
                } else {
                    sdl_pc = 237;
                    continue;
                }
            },
            234 => {
                {
                    sdl_pc = 232;
                    continue;
                }
            },
            235 => {
                {
                    sdl_pc = 230;
                    continue;
                }
            },
            236 => {
                {
                    sdl_pc = 239;
                    continue;
                }
            },
            237 => {
                if (!(ofs_25 != 0)) {
                    sdl_pc = 246;
                    continue;
                } else {
                    sdl_pc = 247;
                    continue;
                }
            },
            238 => {
                if (ofs_25 == w) {
                    sdl_pc = 249;
                    continue;
                } else {
                    sdl_pc = 250;
                    continue;
                }
            },
            239 => {
                src_27 = @ptrCast(@alignCast(srcbuf));
                dst_28 = @ptrCast(@alignCast(dstbuf + @as(usize, @bitCast(@as(isize, @intCast(ofs_25 * @as(c_int, 2)))))));
                ALPHA = alpha >> @intCast(@as(c_uint, 3));
                i = 0;
                {
                    sdl_pc = 242;
                    continue;
                }
            },
            240 => {
                if (false) {
                    sdl_pc = 239;
                    continue;
                } else {
                    sdl_pc = 241;
                    continue;
                }
            },
            241 => {
                srcbuf += run_26 *% @as(c_uint, 2);
                {
                    const ref = &ofs_25;
                    ref.* = @bitCast(@as(c_uint, @truncate(@as(c_uint, @bitCast(@as(c_int, ref.*))) +% run_26)));
                }
                {
                    sdl_pc = 238;
                    continue;
                }
            },
            242 => {
                if (i < @as(c_int, @bitCast(@as(c_uint, @truncate(run_26))))) {
                    sdl_pc = 243;
                    continue;
                } else {
                    sdl_pc = 245;
                    continue;
                }
            },
            243 => {
                s_29 = (blk: {
                    const ref = &src_27;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                d_30 = dst_28.*;
                s_29 = (s_29 | (s_29 << @intCast(@as(Uint32, 16)))) & @as(Uint32, 132184095);
                d_30 = (d_30 | (d_30 << @intCast(@as(Uint32, 16)))) & @as(Uint32, 132184095);
                d_30 +%= ((s_29 -% d_30) *% ALPHA) >> @intCast(@as(Uint32, 5));
                d_30 &= 132184095;
                (blk: {
                    const ref = &dst_28;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @truncate(d_30 | (d_30 >> @intCast(@as(Uint32, 16))));
                {
                    sdl_pc = 244;
                    continue;
                }
            },
            244 => {
                i += 1;
                {
                    sdl_pc = 242;
                    continue;
                }
            },
            245 => {
                {
                    sdl_pc = 240;
                    continue;
                }
            },
            246 => {
                {
                    sdl_pc = 235;
                    continue;
                }
            },
            247 => {
                {
                    sdl_pc = 248;
                    continue;
                }
            },
            248 => {
                {
                    sdl_pc = 238;
                    continue;
                }
            },
            249 => {
                ofs_25 = 0;
                dstbuf += @as(usize, @bitCast(@as(isize, @intCast(surf_dst.*.pitch))));
                if (!((blk: {
                    const ref = &linecount_24;
                    ref.* -= 1;
                    break :blk ref.*;
                }) != 0)) {
                    sdl_pc = 252;
                    continue;
                } else {
                    sdl_pc = 253;
                    continue;
                }
            },
            250 => {
                {
                    sdl_pc = 251;
                    continue;
                }
            },
            251 => {
                {
                    sdl_pc = 234;
                    continue;
                }
            },
            252 => {
                {
                    sdl_pc = 235;
                    continue;
                }
            },
            253 => {
                {
                    sdl_pc = 254;
                    continue;
                }
            },
            254 => {
                {
                    sdl_pc = 251;
                    continue;
                }
            },
            255 => {
                if (((fmt.*.Gmask == @as(Uint32, 992)) or (fmt.*.Rmask == @as(Uint32, 992))) or (fmt.*.Bmask == @as(Uint32, 992))) {
                    sdl_pc = 256;
                    continue;
                } else {
                    sdl_pc = 257;
                    continue;
                }
            },
            256 => {
                if (alpha == @as(c_uint, 128)) {
                    sdl_pc = 259;
                    continue;
                } else {
                    sdl_pc = 260;
                    continue;
                }
            },
            257 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            258 => {
                {
                    sdl_pc = 174;
                    continue;
                }
            },
            259 => {
                {
                    sdl_pc = 262;
                    continue;
                }
            },
            260 => {
                {
                    sdl_pc = 309;
                    continue;
                }
            },
            261 => {
                {
                    sdl_pc = 174;
                    continue;
                }
            },
            262 => {
                linecount_31 = srcrect.*.h;
                ofs_32 = 0;
                {
                    sdl_pc = 265;
                    continue;
                }
            },
            263 => {
                if (false) {
                    sdl_pc = 262;
                    continue;
                } else {
                    sdl_pc = 264;
                    continue;
                }
            },
            264 => {
                {
                    sdl_pc = 261;
                    continue;
                }
            },
            265 => {
                if (true) {
                    sdl_pc = 266;
                    continue;
                } else {
                    sdl_pc = 268;
                    continue;
                }
            },
            266 => {
                ofs_32 += srcbuf.*;
                run_33 = srcbuf[@as(c_int, 1)];
                srcbuf += @as(c_ulong, 2) *% @sizeOf(Uint8);
                if (run_33 != 0) {
                    sdl_pc = 269;
                    continue;
                } else {
                    sdl_pc = 270;
                    continue;
                }
            },
            267 => {
                {
                    sdl_pc = 265;
                    continue;
                }
            },
            268 => {
                {
                    sdl_pc = 263;
                    continue;
                }
            },
            269 => {
                {
                    sdl_pc = 272;
                    continue;
                }
            },
            270 => {
                if (!(ofs_32 != 0)) {
                    sdl_pc = 300;
                    continue;
                } else {
                    sdl_pc = 301;
                    continue;
                }
            },
            271 => {
                if (ofs_32 == w) {
                    sdl_pc = 303;
                    continue;
                } else {
                    sdl_pc = 304;
                    continue;
                }
            },
            272 => {
                n_34 = run_33;
                src_35 = @ptrCast(@alignCast(srcbuf));
                dst_36 = @ptrCast(@alignCast(dstbuf + @as(usize, @bitCast(@as(isize, @intCast(ofs_32 * @as(c_int, 2)))))));
                if (((@as(usize, @intCast(@intFromPtr(src_35))) ^ @as(usize, @intCast(@intFromPtr(dst_36)))) & @as(usize, 3)) != 0) {
                    sdl_pc = 275;
                    continue;
                } else {
                    sdl_pc = 276;
                    continue;
                }
            },
            273 => {
                if (false) {
                    sdl_pc = 272;
                    continue;
                } else {
                    sdl_pc = 274;
                    continue;
                }
            },
            274 => {
                srcbuf += run_33 *% @as(c_uint, 2);
                {
                    const ref = &ofs_32;
                    ref.* = @bitCast(@as(c_uint, @truncate(@as(c_uint, @bitCast(@as(c_int, ref.*))) +% run_33)));
                }
                {
                    sdl_pc = 271;
                    continue;
                }
            },
            275 => {
                {
                    sdl_pc = 278;
                    continue;
                }
            },
            276 => {
                if ((@as(usize, @intCast(@intFromPtr(src_35))) & @as(usize, 3)) != 0) {
                    sdl_pc = 284;
                    continue;
                } else {
                    sdl_pc = 285;
                    continue;
                }
            },
            277 => {
                {
                    sdl_pc = 273;
                    continue;
                }
            },
            278 => {
                if ((blk: {
                    const ref = &n_34;
                    const tmp = ref.*;
                    ref.* -%= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 279;
                    continue;
                } else {
                    sdl_pc = 280;
                    continue;
                }
            },
            279 => {
                {
                    sdl_pc = 281;
                    continue;
                }
            },
            280 => {
                {
                    sdl_pc = 277;
                    continue;
                }
            },
            281 => {
                s_37 = (blk: {
                    const ref = &src_35;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                d_38 = dst_36.*;
                (blk: {
                    const ref = &dst_36;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @truncate((((s_37 & @as(c_uint, 64478)) +% (d_38 & @as(c_uint, 64478))) >> @intCast(@as(Uint32, 1))) +% ((s_37 & d_38) & (~@as(c_uint, 64478) & @as(c_uint, 65535))));
                {
                    sdl_pc = 282;
                    continue;
                }
            },
            282 => {
                if (false) {
                    sdl_pc = 281;
                    continue;
                } else {
                    sdl_pc = 283;
                    continue;
                }
            },
            283 => {
                {
                    sdl_pc = 278;
                    continue;
                }
            },
            284 => {
                {
                    sdl_pc = 287;
                    continue;
                }
            },
            285 => {
                {
                    sdl_pc = 286;
                    continue;
                }
            },
            286 => {
                {
                    sdl_pc = 290;
                    continue;
                }
            },
            287 => {
                s_39 = (blk: {
                    const ref = &src_35;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                d_40 = dst_36.*;
                (blk: {
                    const ref = &dst_36;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @truncate((((s_39 & @as(c_uint, 64478)) +% (d_40 & @as(c_uint, 64478))) >> @intCast(@as(Uint32, 1))) +% ((s_39 & d_40) & (~@as(c_uint, 64478) & @as(c_uint, 65535))));
                {
                    sdl_pc = 288;
                    continue;
                }
            },
            288 => {
                if (false) {
                    sdl_pc = 287;
                    continue;
                } else {
                    sdl_pc = 289;
                    continue;
                }
            },
            289 => {
                n_34 -%= 1;
                {
                    sdl_pc = 286;
                    continue;
                }
            },
            290 => {
                if (n_34 > @as(c_uint, 1)) {
                    sdl_pc = 291;
                    continue;
                } else {
                    sdl_pc = 293;
                    continue;
                }
            },
            291 => {
                s_41 = @as([*c]Uint32, @ptrCast(@alignCast(src_35))).*;
                d_42 = @as([*c]Uint32, @ptrCast(@alignCast(dst_36))).*;
                @as([*c]Uint32, @ptrCast(@alignCast(dst_36))).* = (((s_41 & (@as(c_uint, 64478) | (@as(c_uint, 64478) << @intCast(@as(c_uint, 16))))) >> @intCast(@as(Uint32, 1))) +% ((d_42 & (@as(c_uint, 64478) | (@as(c_uint, 64478) << @intCast(@as(c_uint, 16))))) >> @intCast(@as(Uint32, 1)))) +% ((s_41 & d_42) & ~(@as(c_uint, 64478) | (@as(c_uint, 64478) << @intCast(@as(c_uint, 16)))));
                src_35 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                dst_36 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                {
                    sdl_pc = 292;
                    continue;
                }
            },
            292 => {
                n_34 -%= 2;
                {
                    sdl_pc = 290;
                    continue;
                }
            },
            293 => {
                if (n_34 != 0) {
                    sdl_pc = 294;
                    continue;
                } else {
                    sdl_pc = 295;
                    continue;
                }
            },
            294 => {
                {
                    sdl_pc = 297;
                    continue;
                }
            },
            295 => {
                {
                    sdl_pc = 296;
                    continue;
                }
            },
            296 => {
                {
                    sdl_pc = 277;
                    continue;
                }
            },
            297 => {
                s_43 = (blk: {
                    const ref = &src_35;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                d_44 = dst_36.*;
                (blk: {
                    const ref = &dst_36;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @truncate((((s_43 & @as(c_uint, 64478)) +% (d_44 & @as(c_uint, 64478))) >> @intCast(@as(Uint32, 1))) +% ((s_43 & d_44) & (~@as(c_uint, 64478) & @as(c_uint, 65535))));
                {
                    sdl_pc = 298;
                    continue;
                }
            },
            298 => {
                if (false) {
                    sdl_pc = 297;
                    continue;
                } else {
                    sdl_pc = 299;
                    continue;
                }
            },
            299 => {
                {
                    sdl_pc = 296;
                    continue;
                }
            },
            300 => {
                {
                    sdl_pc = 268;
                    continue;
                }
            },
            301 => {
                {
                    sdl_pc = 302;
                    continue;
                }
            },
            302 => {
                {
                    sdl_pc = 271;
                    continue;
                }
            },
            303 => {
                ofs_32 = 0;
                dstbuf += @as(usize, @bitCast(@as(isize, @intCast(surf_dst.*.pitch))));
                if (!((blk: {
                    const ref = &linecount_31;
                    ref.* -= 1;
                    break :blk ref.*;
                }) != 0)) {
                    sdl_pc = 306;
                    continue;
                } else {
                    sdl_pc = 307;
                    continue;
                }
            },
            304 => {
                {
                    sdl_pc = 305;
                    continue;
                }
            },
            305 => {
                {
                    sdl_pc = 267;
                    continue;
                }
            },
            306 => {
                {
                    sdl_pc = 268;
                    continue;
                }
            },
            307 => {
                {
                    sdl_pc = 308;
                    continue;
                }
            },
            308 => {
                {
                    sdl_pc = 305;
                    continue;
                }
            },
            309 => {
                linecount_45 = srcrect.*.h;
                ofs_46 = 0;
                {
                    sdl_pc = 312;
                    continue;
                }
            },
            310 => {
                if (false) {
                    sdl_pc = 309;
                    continue;
                } else {
                    sdl_pc = 311;
                    continue;
                }
            },
            311 => {
                {
                    sdl_pc = 261;
                    continue;
                }
            },
            312 => {
                if (true) {
                    sdl_pc = 313;
                    continue;
                } else {
                    sdl_pc = 315;
                    continue;
                }
            },
            313 => {
                ofs_46 += srcbuf.*;
                run_47 = srcbuf[@as(c_int, 1)];
                srcbuf += @as(c_ulong, 2) *% @sizeOf(Uint8);
                if (run_47 != 0) {
                    sdl_pc = 316;
                    continue;
                } else {
                    sdl_pc = 317;
                    continue;
                }
            },
            314 => {
                {
                    sdl_pc = 312;
                    continue;
                }
            },
            315 => {
                {
                    sdl_pc = 310;
                    continue;
                }
            },
            316 => {
                {
                    sdl_pc = 319;
                    continue;
                }
            },
            317 => {
                if (!(ofs_46 != 0)) {
                    sdl_pc = 326;
                    continue;
                } else {
                    sdl_pc = 327;
                    continue;
                }
            },
            318 => {
                if (ofs_46 == w) {
                    sdl_pc = 329;
                    continue;
                } else {
                    sdl_pc = 330;
                    continue;
                }
            },
            319 => {
                src_49 = @ptrCast(@alignCast(srcbuf));
                dst_50 = @ptrCast(@alignCast(dstbuf + @as(usize, @bitCast(@as(isize, @intCast(ofs_46 * @as(c_int, 2)))))));
                ALPHA_51 = alpha >> @intCast(@as(c_uint, 3));
                i_48 = 0;
                {
                    sdl_pc = 322;
                    continue;
                }
            },
            320 => {
                if (false) {
                    sdl_pc = 319;
                    continue;
                } else {
                    sdl_pc = 321;
                    continue;
                }
            },
            321 => {
                srcbuf += run_47 *% @as(c_uint, 2);
                {
                    const ref = &ofs_46;
                    ref.* = @bitCast(@as(c_uint, @truncate(@as(c_uint, @bitCast(@as(c_int, ref.*))) +% run_47)));
                }
                {
                    sdl_pc = 318;
                    continue;
                }
            },
            322 => {
                if (i_48 < @as(c_int, @bitCast(@as(c_uint, @truncate(run_47))))) {
                    sdl_pc = 323;
                    continue;
                } else {
                    sdl_pc = 325;
                    continue;
                }
            },
            323 => {
                s_52 = (blk: {
                    const ref = &src_49;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                d_53 = dst_50.*;
                s_52 = (s_52 | (s_52 << @intCast(@as(Uint32, 16)))) & @as(Uint32, 65043487);
                d_53 = (d_53 | (d_53 << @intCast(@as(Uint32, 16)))) & @as(Uint32, 65043487);
                d_53 +%= ((s_52 -% d_53) *% ALPHA_51) >> @intCast(@as(Uint32, 5));
                d_53 &= 65043487;
                (blk: {
                    const ref = &dst_50;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @truncate(d_53 | (d_53 >> @intCast(@as(Uint32, 16))));
                {
                    sdl_pc = 324;
                    continue;
                }
            },
            324 => {
                i_48 += 1;
                {
                    sdl_pc = 322;
                    continue;
                }
            },
            325 => {
                {
                    sdl_pc = 320;
                    continue;
                }
            },
            326 => {
                {
                    sdl_pc = 315;
                    continue;
                }
            },
            327 => {
                {
                    sdl_pc = 328;
                    continue;
                }
            },
            328 => {
                {
                    sdl_pc = 318;
                    continue;
                }
            },
            329 => {
                ofs_46 = 0;
                dstbuf += @as(usize, @bitCast(@as(isize, @intCast(surf_dst.*.pitch))));
                if (!((blk: {
                    const ref = &linecount_45;
                    ref.* -= 1;
                    break :blk ref.*;
                }) != 0)) {
                    sdl_pc = 332;
                    continue;
                } else {
                    sdl_pc = 333;
                    continue;
                }
            },
            330 => {
                {
                    sdl_pc = 331;
                    continue;
                }
            },
            331 => {
                {
                    sdl_pc = 314;
                    continue;
                }
            },
            332 => {
                {
                    sdl_pc = 315;
                    continue;
                }
            },
            333 => {
                {
                    sdl_pc = 334;
                    continue;
                }
            },
            334 => {
                {
                    sdl_pc = 331;
                    continue;
                }
            },
            335 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            336 => {
                linecount_54 = srcrect.*.h;
                ofs_55 = 0;
                {
                    sdl_pc = 339;
                    continue;
                }
            },
            337 => {
                if (false) {
                    sdl_pc = 336;
                    continue;
                } else {
                    sdl_pc = 338;
                    continue;
                }
            },
            338 => {
                {
                    sdl_pc = 174;
                    continue;
                }
            },
            339 => {
                if (true) {
                    sdl_pc = 340;
                    continue;
                } else {
                    sdl_pc = 342;
                    continue;
                }
            },
            340 => {
                ofs_55 += srcbuf.*;
                run_56 = srcbuf[@as(c_int, 1)];
                srcbuf += @as(c_ulong, 2) *% @sizeOf(Uint8);
                if (run_56 != 0) {
                    sdl_pc = 343;
                    continue;
                } else {
                    sdl_pc = 344;
                    continue;
                }
            },
            341 => {
                {
                    sdl_pc = 339;
                    continue;
                }
            },
            342 => {
                {
                    sdl_pc = 337;
                    continue;
                }
            },
            343 => {
                {
                    sdl_pc = 346;
                    continue;
                }
            },
            344 => {
                if (!(ofs_55 != 0)) {
                    sdl_pc = 361;
                    continue;
                } else {
                    sdl_pc = 362;
                    continue;
                }
            },
            345 => {
                if (ofs_55 == w) {
                    sdl_pc = 364;
                    continue;
                } else {
                    sdl_pc = 365;
                    continue;
                }
            },
            346 => {
                src_58 = srcbuf;
                dst_59 = dstbuf + @as(usize, @bitCast(@as(isize, @intCast(ofs_55 * @as(c_int, 2)))));
                i_57 = 0;
                {
                    sdl_pc = 349;
                    continue;
                }
            },
            347 => {
                if (false) {
                    sdl_pc = 346;
                    continue;
                } else {
                    sdl_pc = 348;
                    continue;
                }
            },
            348 => {
                srcbuf += run_56 *% @as(c_uint, 2);
                {
                    const ref = &ofs_55;
                    ref.* = @bitCast(@as(c_uint, @truncate(@as(c_uint, @bitCast(@as(c_int, ref.*))) +% run_56)));
                }
                {
                    sdl_pc = 345;
                    continue;
                }
            },
            349 => {
                if (i_57 < @as(c_int, @bitCast(@as(c_uint, @truncate(run_56))))) {
                    sdl_pc = 350;
                    continue;
                } else {
                    sdl_pc = 352;
                    continue;
                }
            },
            350 => {
                s_60 = 0;
                d_61 = 0;
                switch (@as(c_int, 2)) {
                    @as(c_int, 2) => {
                        sdl_pc = 354;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 355;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 356;
                        continue;
                    },
                    else => {
                        sdl_pc = 353;
                        continue;
                    },
                }
            },
            351 => {
                i_57 += 1;
                {
                    sdl_pc = 349;
                    continue;
                }
            },
            352 => {
                {
                    sdl_pc = 347;
                    continue;
                }
            },
            353 => {
                rs = SDL_expand_byte[fmt.*.Rbits][(s_60 & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                gs = SDL_expand_byte[fmt.*.Gbits][(s_60 & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                bs = SDL_expand_byte[fmt.*.Bbits][(s_60 & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                rd = SDL_expand_byte[fmt.*.Rbits][(d_61 & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                gd = SDL_expand_byte[fmt.*.Gbits][(d_61 & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                bd = SDL_expand_byte[fmt.*.Bbits][(d_61 & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                rd +%= ((rs -% rd) *% alpha) >> @intCast(@as(c_uint, 8));
                gd +%= ((gs -% gd) *% alpha) >> @intCast(@as(c_uint, 8));
                bd +%= ((bs -% bd) *% alpha) >> @intCast(@as(c_uint, 8));
                d_61 = ((((rd >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((gd >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((bd >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask;
                switch (@as(c_int, 2)) {
                    @as(c_int, 2) => {
                        sdl_pc = 358;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 359;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 360;
                        continue;
                    },
                    else => {
                        sdl_pc = 357;
                        continue;
                    },
                }
            },
            354 => {
                s_60 = @as([*c]Uint16, @ptrCast(@alignCast(src_58))).*;
                d_61 = @as([*c]Uint16, @ptrCast(@alignCast(dst_59))).*;
                {
                    sdl_pc = 353;
                    continue;
                }
            },
            355 => {
                s_60 = @bitCast(@as(c_int, ((@as(c_int, src_58[@as(c_int, 2)]) << @intCast(@as(c_int, 16))) | (@as(c_int, src_58[@as(c_int, 1)]) << @intCast(@as(c_int, 8)))) | @as(c_int, src_58[@as(c_int, 0)])));
                d_61 = @bitCast(@as(c_int, ((@as(c_int, dst_59[@as(c_int, 2)]) << @intCast(@as(c_int, 16))) | (@as(c_int, dst_59[@as(c_int, 1)]) << @intCast(@as(c_int, 8)))) | @as(c_int, dst_59[@as(c_int, 0)])));
                {
                    sdl_pc = 353;
                    continue;
                }
            },
            356 => {
                s_60 = @as([*c]Uint32, @ptrCast(@alignCast(src_58))).*;
                d_61 = @as([*c]Uint32, @ptrCast(@alignCast(dst_59))).*;
                {
                    sdl_pc = 353;
                    continue;
                }
            },
            357 => {
                src_58 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                dst_59 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                {
                    sdl_pc = 351;
                    continue;
                }
            },
            358 => {
                @as([*c]Uint16, @ptrCast(@alignCast(dst_59))).* = @truncate(d_61);
                {
                    sdl_pc = 357;
                    continue;
                }
            },
            359 => {
                dst_59[@as(c_int, 0)] = @truncate(d_61);
                dst_59[@as(c_int, 1)] = @truncate(d_61 >> @intCast(@as(Uint32, 8)));
                dst_59[@as(c_int, 2)] = @truncate(d_61 >> @intCast(@as(Uint32, 16)));
                {
                    sdl_pc = 357;
                    continue;
                }
            },
            360 => {
                @as([*c]Uint32, @ptrCast(@alignCast(dst_59))).* = d_61;
                {
                    sdl_pc = 357;
                    continue;
                }
            },
            361 => {
                {
                    sdl_pc = 342;
                    continue;
                }
            },
            362 => {
                {
                    sdl_pc = 363;
                    continue;
                }
            },
            363 => {
                {
                    sdl_pc = 345;
                    continue;
                }
            },
            364 => {
                ofs_55 = 0;
                dstbuf += @as(usize, @bitCast(@as(isize, @intCast(surf_dst.*.pitch))));
                if (!((blk: {
                    const ref = &linecount_54;
                    ref.* -= 1;
                    break :blk ref.*;
                }) != 0)) {
                    sdl_pc = 367;
                    continue;
                } else {
                    sdl_pc = 368;
                    continue;
                }
            },
            365 => {
                {
                    sdl_pc = 366;
                    continue;
                }
            },
            366 => {
                {
                    sdl_pc = 341;
                    continue;
                }
            },
            367 => {
                {
                    sdl_pc = 342;
                    continue;
                }
            },
            368 => {
                {
                    sdl_pc = 369;
                    continue;
                }
            },
            369 => {
                {
                    sdl_pc = 366;
                    continue;
                }
            },
            370 => {
                {
                    sdl_pc = 371;
                    continue;
                }
            },
            371 => {
                linecount_62 = srcrect.*.h;
                ofs_63 = 0;
                {
                    sdl_pc = 374;
                    continue;
                }
            },
            372 => {
                if (false) {
                    sdl_pc = 371;
                    continue;
                } else {
                    sdl_pc = 373;
                    continue;
                }
            },
            373 => {
                {
                    sdl_pc = 171;
                    continue;
                }
            },
            374 => {
                if (true) {
                    sdl_pc = 375;
                    continue;
                } else {
                    sdl_pc = 377;
                    continue;
                }
            },
            375 => {
                ofs_63 += srcbuf.*;
                run_64 = srcbuf[@as(c_int, 1)];
                srcbuf += @as(c_ulong, 2) *% @sizeOf(Uint8);
                if (run_64 != 0) {
                    sdl_pc = 378;
                    continue;
                } else {
                    sdl_pc = 379;
                    continue;
                }
            },
            376 => {
                {
                    sdl_pc = 374;
                    continue;
                }
            },
            377 => {
                {
                    sdl_pc = 372;
                    continue;
                }
            },
            378 => {
                {
                    sdl_pc = 381;
                    continue;
                }
            },
            379 => {
                if (!(ofs_63 != 0)) {
                    sdl_pc = 396;
                    continue;
                } else {
                    sdl_pc = 397;
                    continue;
                }
            },
            380 => {
                if (ofs_63 == w) {
                    sdl_pc = 399;
                    continue;
                } else {
                    sdl_pc = 400;
                    continue;
                }
            },
            381 => {
                src_66 = srcbuf;
                dst_67 = dstbuf + @as(usize, @bitCast(@as(isize, @intCast(ofs_63 * @as(c_int, 3)))));
                i_65 = 0;
                {
                    sdl_pc = 384;
                    continue;
                }
            },
            382 => {
                if (false) {
                    sdl_pc = 381;
                    continue;
                } else {
                    sdl_pc = 383;
                    continue;
                }
            },
            383 => {
                srcbuf += run_64 *% @as(c_uint, 3);
                {
                    const ref = &ofs_63;
                    ref.* = @bitCast(@as(c_uint, @truncate(@as(c_uint, @bitCast(@as(c_int, ref.*))) +% run_64)));
                }
                {
                    sdl_pc = 380;
                    continue;
                }
            },
            384 => {
                if (i_65 < @as(c_int, @bitCast(@as(c_uint, @truncate(run_64))))) {
                    sdl_pc = 385;
                    continue;
                } else {
                    sdl_pc = 387;
                    continue;
                }
            },
            385 => {
                s_68 = 0;
                d_69 = 0;
                switch (@as(c_int, 3)) {
                    @as(c_int, 2) => {
                        sdl_pc = 389;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 390;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 391;
                        continue;
                    },
                    else => {
                        sdl_pc = 388;
                        continue;
                    },
                }
            },
            386 => {
                i_65 += 1;
                {
                    sdl_pc = 384;
                    continue;
                }
            },
            387 => {
                {
                    sdl_pc = 382;
                    continue;
                }
            },
            388 => {
                rs_70 = SDL_expand_byte[fmt.*.Rbits][(s_68 & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                gs_71 = SDL_expand_byte[fmt.*.Gbits][(s_68 & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                bs_72 = SDL_expand_byte[fmt.*.Bbits][(s_68 & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                rd_73 = SDL_expand_byte[fmt.*.Rbits][(d_69 & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                gd_74 = SDL_expand_byte[fmt.*.Gbits][(d_69 & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                bd_75 = SDL_expand_byte[fmt.*.Bbits][(d_69 & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                rd_73 +%= ((rs_70 -% rd_73) *% alpha) >> @intCast(@as(c_uint, 8));
                gd_74 +%= ((gs_71 -% gd_74) *% alpha) >> @intCast(@as(c_uint, 8));
                bd_75 +%= ((bs_72 -% bd_75) *% alpha) >> @intCast(@as(c_uint, 8));
                d_69 = ((((rd_73 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((gd_74 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((bd_75 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask;
                switch (@as(c_int, 3)) {
                    @as(c_int, 2) => {
                        sdl_pc = 393;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 394;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 395;
                        continue;
                    },
                    else => {
                        sdl_pc = 392;
                        continue;
                    },
                }
            },
            389 => {
                s_68 = @as([*c]Uint16, @ptrCast(@alignCast(src_66))).*;
                d_69 = @as([*c]Uint16, @ptrCast(@alignCast(dst_67))).*;
                {
                    sdl_pc = 388;
                    continue;
                }
            },
            390 => {
                s_68 = @bitCast(@as(c_int, ((@as(c_int, src_66[@as(c_int, 2)]) << @intCast(@as(c_int, 16))) | (@as(c_int, src_66[@as(c_int, 1)]) << @intCast(@as(c_int, 8)))) | @as(c_int, src_66[@as(c_int, 0)])));
                d_69 = @bitCast(@as(c_int, ((@as(c_int, dst_67[@as(c_int, 2)]) << @intCast(@as(c_int, 16))) | (@as(c_int, dst_67[@as(c_int, 1)]) << @intCast(@as(c_int, 8)))) | @as(c_int, dst_67[@as(c_int, 0)])));
                {
                    sdl_pc = 388;
                    continue;
                }
            },
            391 => {
                s_68 = @as([*c]Uint32, @ptrCast(@alignCast(src_66))).*;
                d_69 = @as([*c]Uint32, @ptrCast(@alignCast(dst_67))).*;
                {
                    sdl_pc = 388;
                    continue;
                }
            },
            392 => {
                src_66 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                dst_67 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                {
                    sdl_pc = 386;
                    continue;
                }
            },
            393 => {
                @as([*c]Uint16, @ptrCast(@alignCast(dst_67))).* = @truncate(d_69);
                {
                    sdl_pc = 392;
                    continue;
                }
            },
            394 => {
                dst_67[@as(c_int, 0)] = @truncate(d_69);
                dst_67[@as(c_int, 1)] = @truncate(d_69 >> @intCast(@as(Uint32, 8)));
                dst_67[@as(c_int, 2)] = @truncate(d_69 >> @intCast(@as(Uint32, 16)));
                {
                    sdl_pc = 392;
                    continue;
                }
            },
            395 => {
                @as([*c]Uint32, @ptrCast(@alignCast(dst_67))).* = d_69;
                {
                    sdl_pc = 392;
                    continue;
                }
            },
            396 => {
                {
                    sdl_pc = 377;
                    continue;
                }
            },
            397 => {
                {
                    sdl_pc = 398;
                    continue;
                }
            },
            398 => {
                {
                    sdl_pc = 380;
                    continue;
                }
            },
            399 => {
                ofs_63 = 0;
                dstbuf += @as(usize, @bitCast(@as(isize, @intCast(surf_dst.*.pitch))));
                if (!((blk: {
                    const ref = &linecount_62;
                    ref.* -= 1;
                    break :blk ref.*;
                }) != 0)) {
                    sdl_pc = 402;
                    continue;
                } else {
                    sdl_pc = 403;
                    continue;
                }
            },
            400 => {
                {
                    sdl_pc = 401;
                    continue;
                }
            },
            401 => {
                {
                    sdl_pc = 376;
                    continue;
                }
            },
            402 => {
                {
                    sdl_pc = 377;
                    continue;
                }
            },
            403 => {
                {
                    sdl_pc = 404;
                    continue;
                }
            },
            404 => {
                {
                    sdl_pc = 401;
                    continue;
                }
            },
            405 => {
                if ((((fmt.*.Rmask | fmt.*.Gmask) | fmt.*.Bmask) == @as(Uint32, 16777215)) and (((fmt.*.Gmask == @as(Uint32, 65280)) or (fmt.*.Rmask == @as(Uint32, 65280))) or (fmt.*.Bmask == @as(Uint32, 65280)))) {
                    sdl_pc = 406;
                    continue;
                } else {
                    sdl_pc = 407;
                    continue;
                }
            },
            406 => {
                if (alpha == @as(c_uint, 128)) {
                    sdl_pc = 409;
                    continue;
                } else {
                    sdl_pc = 410;
                    continue;
                }
            },
            407 => {
                {
                    sdl_pc = 464;
                    continue;
                }
            },
            408 => {
                {
                    sdl_pc = 171;
                    continue;
                }
            },
            409 => {
                {
                    sdl_pc = 412;
                    continue;
                }
            },
            410 => {
                {
                    sdl_pc = 438;
                    continue;
                }
            },
            411 => {
                {
                    sdl_pc = 408;
                    continue;
                }
            },
            412 => {
                linecount_76 = srcrect.*.h;
                ofs_77 = 0;
                {
                    sdl_pc = 415;
                    continue;
                }
            },
            413 => {
                if (false) {
                    sdl_pc = 412;
                    continue;
                } else {
                    sdl_pc = 414;
                    continue;
                }
            },
            414 => {
                {
                    sdl_pc = 411;
                    continue;
                }
            },
            415 => {
                if (true) {
                    sdl_pc = 416;
                    continue;
                } else {
                    sdl_pc = 418;
                    continue;
                }
            },
            416 => {
                ofs_77 += @as([*c]Uint16, @ptrCast(@alignCast(srcbuf))).*;
                run_78 = @as([*c]Uint16, @ptrCast(@alignCast(srcbuf)))[@as(c_int, 1)];
                srcbuf += @as(c_ulong, 2) *% @sizeOf(Uint16);
                if (run_78 != 0) {
                    sdl_pc = 419;
                    continue;
                } else {
                    sdl_pc = 420;
                    continue;
                }
            },
            417 => {
                {
                    sdl_pc = 415;
                    continue;
                }
            },
            418 => {
                {
                    sdl_pc = 413;
                    continue;
                }
            },
            419 => {
                {
                    sdl_pc = 422;
                    continue;
                }
            },
            420 => {
                if (!(ofs_77 != 0)) {
                    sdl_pc = 429;
                    continue;
                } else {
                    sdl_pc = 430;
                    continue;
                }
            },
            421 => {
                if (ofs_77 == w) {
                    sdl_pc = 432;
                    continue;
                } else {
                    sdl_pc = 433;
                    continue;
                }
            },
            422 => {
                src_80 = @ptrCast(@alignCast(srcbuf));
                dst_81 = @ptrCast(@alignCast(dstbuf + @as(usize, @bitCast(@as(isize, @intCast(ofs_77 * @as(c_int, 4)))))));
                i_79 = 0;
                {
                    sdl_pc = 425;
                    continue;
                }
            },
            423 => {
                if (false) {
                    sdl_pc = 422;
                    continue;
                } else {
                    sdl_pc = 424;
                    continue;
                }
            },
            424 => {
                srcbuf += run_78 *% @as(c_uint, 4);
                {
                    const ref = &ofs_77;
                    ref.* = @bitCast(@as(c_uint, @truncate(@as(c_uint, @bitCast(@as(c_int, ref.*))) +% run_78)));
                }
                {
                    sdl_pc = 421;
                    continue;
                }
            },
            425 => {
                if (i_79 < @as(c_int, @bitCast(@as(c_uint, @truncate(run_78))))) {
                    sdl_pc = 426;
                    continue;
                } else {
                    sdl_pc = 428;
                    continue;
                }
            },
            426 => {
                s_82 = (blk: {
                    const ref = &src_80;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                d_83 = dst_81.*;
                (blk: {
                    const ref = &dst_81;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = (((s_82 & @as(Uint32, 16711422)) +% (d_83 & @as(Uint32, 16711422))) >> @intCast(@as(Uint32, 1))) +% ((s_82 & d_83) & @as(Uint32, 65793));
                {
                    sdl_pc = 427;
                    continue;
                }
            },
            427 => {
                i_79 += 1;
                {
                    sdl_pc = 425;
                    continue;
                }
            },
            428 => {
                {
                    sdl_pc = 423;
                    continue;
                }
            },
            429 => {
                {
                    sdl_pc = 418;
                    continue;
                }
            },
            430 => {
                {
                    sdl_pc = 431;
                    continue;
                }
            },
            431 => {
                {
                    sdl_pc = 421;
                    continue;
                }
            },
            432 => {
                ofs_77 = 0;
                dstbuf += @as(usize, @bitCast(@as(isize, @intCast(surf_dst.*.pitch))));
                if (!((blk: {
                    const ref = &linecount_76;
                    ref.* -= 1;
                    break :blk ref.*;
                }) != 0)) {
                    sdl_pc = 435;
                    continue;
                } else {
                    sdl_pc = 436;
                    continue;
                }
            },
            433 => {
                {
                    sdl_pc = 434;
                    continue;
                }
            },
            434 => {
                {
                    sdl_pc = 417;
                    continue;
                }
            },
            435 => {
                {
                    sdl_pc = 418;
                    continue;
                }
            },
            436 => {
                {
                    sdl_pc = 437;
                    continue;
                }
            },
            437 => {
                {
                    sdl_pc = 434;
                    continue;
                }
            },
            438 => {
                linecount_84 = srcrect.*.h;
                ofs_85 = 0;
                {
                    sdl_pc = 441;
                    continue;
                }
            },
            439 => {
                if (false) {
                    sdl_pc = 438;
                    continue;
                } else {
                    sdl_pc = 440;
                    continue;
                }
            },
            440 => {
                {
                    sdl_pc = 411;
                    continue;
                }
            },
            441 => {
                if (true) {
                    sdl_pc = 442;
                    continue;
                } else {
                    sdl_pc = 444;
                    continue;
                }
            },
            442 => {
                ofs_85 += @as([*c]Uint16, @ptrCast(@alignCast(srcbuf))).*;
                run_86 = @as([*c]Uint16, @ptrCast(@alignCast(srcbuf)))[@as(c_int, 1)];
                srcbuf += @as(c_ulong, 2) *% @sizeOf(Uint16);
                if (run_86 != 0) {
                    sdl_pc = 445;
                    continue;
                } else {
                    sdl_pc = 446;
                    continue;
                }
            },
            443 => {
                {
                    sdl_pc = 441;
                    continue;
                }
            },
            444 => {
                {
                    sdl_pc = 439;
                    continue;
                }
            },
            445 => {
                {
                    sdl_pc = 448;
                    continue;
                }
            },
            446 => {
                if (!(ofs_85 != 0)) {
                    sdl_pc = 455;
                    continue;
                } else {
                    sdl_pc = 456;
                    continue;
                }
            },
            447 => {
                if (ofs_85 == w) {
                    sdl_pc = 458;
                    continue;
                } else {
                    sdl_pc = 459;
                    continue;
                }
            },
            448 => {
                src_88 = @ptrCast(@alignCast(srcbuf));
                dst_89 = @ptrCast(@alignCast(dstbuf + @as(usize, @bitCast(@as(isize, @intCast(ofs_85 * @as(c_int, 4)))))));
                i_87 = 0;
                {
                    sdl_pc = 451;
                    continue;
                }
            },
            449 => {
                if (false) {
                    sdl_pc = 448;
                    continue;
                } else {
                    sdl_pc = 450;
                    continue;
                }
            },
            450 => {
                srcbuf += run_86 *% @as(c_uint, 4);
                {
                    const ref = &ofs_85;
                    ref.* = @bitCast(@as(c_uint, @truncate(@as(c_uint, @bitCast(@as(c_int, ref.*))) +% run_86)));
                }
                {
                    sdl_pc = 447;
                    continue;
                }
            },
            451 => {
                if (i_87 < @as(c_int, @bitCast(@as(c_uint, @truncate(run_86))))) {
                    sdl_pc = 452;
                    continue;
                } else {
                    sdl_pc = 454;
                    continue;
                }
            },
            452 => {
                s_90 = (blk: {
                    const ref = &src_88;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                d_91 = dst_89.*;
                s1 = s_90 & @as(Uint32, 16711935);
                d1 = d_91 & @as(Uint32, 16711935);
                d1 = (d1 +% (((s1 -% d1) *% alpha) >> @intCast(@as(Uint32, 8)))) & @as(Uint32, 16711935);
                s_90 &= 65280;
                d_91 &= 65280;
                d_91 = (d_91 +% (((s_90 -% d_91) *% alpha) >> @intCast(@as(Uint32, 8)))) & @as(Uint32, 65280);
                (blk: {
                    const ref = &dst_89;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = d1 | d_91;
                {
                    sdl_pc = 453;
                    continue;
                }
            },
            453 => {
                i_87 += 1;
                {
                    sdl_pc = 451;
                    continue;
                }
            },
            454 => {
                {
                    sdl_pc = 449;
                    continue;
                }
            },
            455 => {
                {
                    sdl_pc = 444;
                    continue;
                }
            },
            456 => {
                {
                    sdl_pc = 457;
                    continue;
                }
            },
            457 => {
                {
                    sdl_pc = 447;
                    continue;
                }
            },
            458 => {
                ofs_85 = 0;
                dstbuf += @as(usize, @bitCast(@as(isize, @intCast(surf_dst.*.pitch))));
                if (!((blk: {
                    const ref = &linecount_84;
                    ref.* -= 1;
                    break :blk ref.*;
                }) != 0)) {
                    sdl_pc = 461;
                    continue;
                } else {
                    sdl_pc = 462;
                    continue;
                }
            },
            459 => {
                {
                    sdl_pc = 460;
                    continue;
                }
            },
            460 => {
                {
                    sdl_pc = 443;
                    continue;
                }
            },
            461 => {
                {
                    sdl_pc = 444;
                    continue;
                }
            },
            462 => {
                {
                    sdl_pc = 463;
                    continue;
                }
            },
            463 => {
                {
                    sdl_pc = 460;
                    continue;
                }
            },
            464 => {
                linecount_92 = srcrect.*.h;
                ofs_93 = 0;
                {
                    sdl_pc = 467;
                    continue;
                }
            },
            465 => {
                if (false) {
                    sdl_pc = 464;
                    continue;
                } else {
                    sdl_pc = 466;
                    continue;
                }
            },
            466 => {
                {
                    sdl_pc = 408;
                    continue;
                }
            },
            467 => {
                if (true) {
                    sdl_pc = 468;
                    continue;
                } else {
                    sdl_pc = 470;
                    continue;
                }
            },
            468 => {
                ofs_93 += @as([*c]Uint16, @ptrCast(@alignCast(srcbuf))).*;
                run_94 = @as([*c]Uint16, @ptrCast(@alignCast(srcbuf)))[@as(c_int, 1)];
                srcbuf += @as(c_ulong, 2) *% @sizeOf(Uint16);
                if (run_94 != 0) {
                    sdl_pc = 471;
                    continue;
                } else {
                    sdl_pc = 472;
                    continue;
                }
            },
            469 => {
                {
                    sdl_pc = 467;
                    continue;
                }
            },
            470 => {
                {
                    sdl_pc = 465;
                    continue;
                }
            },
            471 => {
                {
                    sdl_pc = 474;
                    continue;
                }
            },
            472 => {
                if (!(ofs_93 != 0)) {
                    sdl_pc = 489;
                    continue;
                } else {
                    sdl_pc = 490;
                    continue;
                }
            },
            473 => {
                if (ofs_93 == w) {
                    sdl_pc = 492;
                    continue;
                } else {
                    sdl_pc = 493;
                    continue;
                }
            },
            474 => {
                src_96 = srcbuf;
                dst_97 = dstbuf + @as(usize, @bitCast(@as(isize, @intCast(ofs_93 * @as(c_int, 4)))));
                i_95 = 0;
                {
                    sdl_pc = 477;
                    continue;
                }
            },
            475 => {
                if (false) {
                    sdl_pc = 474;
                    continue;
                } else {
                    sdl_pc = 476;
                    continue;
                }
            },
            476 => {
                srcbuf += run_94 *% @as(c_uint, 4);
                {
                    const ref = &ofs_93;
                    ref.* = @bitCast(@as(c_uint, @truncate(@as(c_uint, @bitCast(@as(c_int, ref.*))) +% run_94)));
                }
                {
                    sdl_pc = 473;
                    continue;
                }
            },
            477 => {
                if (i_95 < @as(c_int, @bitCast(@as(c_uint, @truncate(run_94))))) {
                    sdl_pc = 478;
                    continue;
                } else {
                    sdl_pc = 480;
                    continue;
                }
            },
            478 => {
                s_98 = 0;
                d_99 = 0;
                switch (@as(c_int, 4)) {
                    @as(c_int, 2) => {
                        sdl_pc = 482;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 483;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 484;
                        continue;
                    },
                    else => {
                        sdl_pc = 481;
                        continue;
                    },
                }
            },
            479 => {
                i_95 += 1;
                {
                    sdl_pc = 477;
                    continue;
                }
            },
            480 => {
                {
                    sdl_pc = 475;
                    continue;
                }
            },
            481 => {
                rs_100 = SDL_expand_byte[fmt.*.Rbits][(s_98 & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                gs_101 = SDL_expand_byte[fmt.*.Gbits][(s_98 & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                bs_102 = SDL_expand_byte[fmt.*.Bbits][(s_98 & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                rd_103 = SDL_expand_byte[fmt.*.Rbits][(d_99 & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                gd_104 = SDL_expand_byte[fmt.*.Gbits][(d_99 & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                bd_105 = SDL_expand_byte[fmt.*.Bbits][(d_99 & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                rd_103 +%= ((rs_100 -% rd_103) *% alpha) >> @intCast(@as(c_uint, 8));
                gd_104 +%= ((gs_101 -% gd_104) *% alpha) >> @intCast(@as(c_uint, 8));
                bd_105 +%= ((bs_102 -% bd_105) *% alpha) >> @intCast(@as(c_uint, 8));
                d_99 = ((((rd_103 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((gd_104 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((bd_105 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask;
                switch (@as(c_int, 4)) {
                    @as(c_int, 2) => {
                        sdl_pc = 486;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 487;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 488;
                        continue;
                    },
                    else => {
                        sdl_pc = 485;
                        continue;
                    },
                }
            },
            482 => {
                s_98 = @as([*c]Uint16, @ptrCast(@alignCast(src_96))).*;
                d_99 = @as([*c]Uint16, @ptrCast(@alignCast(dst_97))).*;
                {
                    sdl_pc = 481;
                    continue;
                }
            },
            483 => {
                s_98 = @bitCast(@as(c_int, ((@as(c_int, src_96[@as(c_int, 2)]) << @intCast(@as(c_int, 16))) | (@as(c_int, src_96[@as(c_int, 1)]) << @intCast(@as(c_int, 8)))) | @as(c_int, src_96[@as(c_int, 0)])));
                d_99 = @bitCast(@as(c_int, ((@as(c_int, dst_97[@as(c_int, 2)]) << @intCast(@as(c_int, 16))) | (@as(c_int, dst_97[@as(c_int, 1)]) << @intCast(@as(c_int, 8)))) | @as(c_int, dst_97[@as(c_int, 0)])));
                {
                    sdl_pc = 481;
                    continue;
                }
            },
            484 => {
                s_98 = @as([*c]Uint32, @ptrCast(@alignCast(src_96))).*;
                d_99 = @as([*c]Uint32, @ptrCast(@alignCast(dst_97))).*;
                {
                    sdl_pc = 481;
                    continue;
                }
            },
            485 => {
                src_96 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                dst_97 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                {
                    sdl_pc = 479;
                    continue;
                }
            },
            486 => {
                @as([*c]Uint16, @ptrCast(@alignCast(dst_97))).* = @truncate(d_99);
                {
                    sdl_pc = 485;
                    continue;
                }
            },
            487 => {
                dst_97[@as(c_int, 0)] = @truncate(d_99);
                dst_97[@as(c_int, 1)] = @truncate(d_99 >> @intCast(@as(Uint32, 8)));
                dst_97[@as(c_int, 2)] = @truncate(d_99 >> @intCast(@as(Uint32, 16)));
                {
                    sdl_pc = 485;
                    continue;
                }
            },
            488 => {
                @as([*c]Uint32, @ptrCast(@alignCast(dst_97))).* = d_99;
                {
                    sdl_pc = 485;
                    continue;
                }
            },
            489 => {
                {
                    sdl_pc = 470;
                    continue;
                }
            },
            490 => {
                {
                    sdl_pc = 491;
                    continue;
                }
            },
            491 => {
                {
                    sdl_pc = 473;
                    continue;
                }
            },
            492 => {
                ofs_93 = 0;
                dstbuf += @as(usize, @bitCast(@as(isize, @intCast(surf_dst.*.pitch))));
                if (!((blk: {
                    const ref = &linecount_92;
                    ref.* -= 1;
                    break :blk ref.*;
                }) != 0)) {
                    sdl_pc = 495;
                    continue;
                } else {
                    sdl_pc = 496;
                    continue;
                }
            },
            493 => {
                {
                    sdl_pc = 494;
                    continue;
                }
            },
            494 => {
                {
                    sdl_pc = 469;
                    continue;
                }
            },
            495 => {
                {
                    sdl_pc = 470;
                    continue;
                }
            },
            496 => {
                {
                    sdl_pc = 497;
                    continue;
                }
            },
            497 => {
                {
                    sdl_pc = 494;
                    continue;
                }
            },
            498 => {
                SDL_UnlockSurface_REAL(surf_dst);
                {
                    sdl_pc = 500;
                    continue;
                }
            },
            499 => {
                {
                    sdl_pc = 500;
                    continue;
                }
            },
            500 => {
                return @"true" != 0;
            },
            else => unreachable,
        }
    }
}
pub fn RLEAlphaClipBlit(w: c_int, arg_srcbuf: [*c]Uint8, surf_dst: [*c]SDL_Surface, arg_dstbuf: [*c]Uint8, srcrect: [*c]const SDL_Rect) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var srcbuf = arg_srcbuf;
    _ = &srcbuf;
    var dstbuf = arg_dstbuf;
    _ = &dstbuf;
    var df: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &df;
    var linecount: c_int = undefined;
    _ = &linecount;
    var left: c_int = undefined;
    _ = &left;
    var right: c_int = undefined;
    _ = &right;
    var ofs: c_int = undefined;
    _ = &ofs;
    var run: c_uint = undefined;
    _ = &run;
    var cofs: c_int = undefined;
    _ = &cofs;
    var crun: c_int = undefined;
    _ = &crun;
    var psize: usize = undefined;
    _ = &psize;
    var run_1: c_uint = undefined;
    _ = &run_1;
    var cofs_2: c_int = undefined;
    _ = &cofs_2;
    var crun_3: c_int = undefined;
    _ = &crun_3;
    var dst: [*c]Uint16 = undefined;
    _ = &dst;
    var src: [*c]Uint32 = undefined;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    var s: Uint32 = undefined;
    _ = &s;
    var d: Uint32 = undefined;
    _ = &d;
    var alpha: c_uint = undefined;
    _ = &alpha;
    var linecount_4: c_int = undefined;
    _ = &linecount_4;
    var left_5: c_int = undefined;
    _ = &left_5;
    var right_6: c_int = undefined;
    _ = &right_6;
    var ofs_7: c_int = undefined;
    _ = &ofs_7;
    var run_8: c_uint = undefined;
    _ = &run_8;
    var cofs_9: c_int = undefined;
    _ = &cofs_9;
    var crun_10: c_int = undefined;
    _ = &crun_10;
    var psize_11: usize = undefined;
    _ = &psize_11;
    var run_12: c_uint = undefined;
    _ = &run_12;
    var cofs_13: c_int = undefined;
    _ = &cofs_13;
    var crun_14: c_int = undefined;
    _ = &crun_14;
    var dst_15: [*c]Uint16 = undefined;
    _ = &dst_15;
    var src_16: [*c]Uint32 = undefined;
    _ = &src_16;
    var i_17: c_int = undefined;
    _ = &i_17;
    var s_18: Uint32 = undefined;
    _ = &s_18;
    var d_19: Uint32 = undefined;
    _ = &d_19;
    var alpha_20: c_uint = undefined;
    _ = &alpha_20;
    var linecount_21: c_int = undefined;
    _ = &linecount_21;
    var left_22: c_int = undefined;
    _ = &left_22;
    var right_23: c_int = undefined;
    _ = &right_23;
    var ofs_24: c_int = undefined;
    _ = &ofs_24;
    var run_25: c_uint = undefined;
    _ = &run_25;
    var cofs_26: c_int = undefined;
    _ = &cofs_26;
    var crun_27: c_int = undefined;
    _ = &crun_27;
    var psize_28: usize = undefined;
    _ = &psize_28;
    var run_29: c_uint = undefined;
    _ = &run_29;
    var cofs_30: c_int = undefined;
    _ = &cofs_30;
    var crun_31: c_int = undefined;
    _ = &crun_31;
    var dst_32: [*c]Uint32 = undefined;
    _ = &dst_32;
    var src_33: [*c]Uint32 = undefined;
    _ = &src_33;
    var i_34: c_int = undefined;
    _ = &i_34;
    var s_35: Uint32 = undefined;
    _ = &s_35;
    var d_36: Uint32 = undefined;
    _ = &d_36;
    var alpha_37: c_uint = undefined;
    _ = &alpha_37;
    var s1: Uint32 = undefined;
    _ = &s1;
    var d1: Uint32 = undefined;
    _ = &d1;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                df = surf_dst.*.fmt;
                switch (@as(c_int, df.*.bytes_per_pixel)) {
                    @as(c_int, 2) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 104;
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
                if (((df.*.Gmask == @as(Uint32, 2016)) or (df.*.Rmask == @as(Uint32, 2016))) or (df.*.Bmask == @as(Uint32, 2016))) {
                    sdl_pc = 3;
                    continue;
                } else {
                    sdl_pc = 4;
                    continue;
                }
            },
            3 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            4 => {
                {
                    sdl_pc = 55;
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
                linecount = srcrect.*.h;
                left = srcrect.*.x;
                right = left + srcrect.*.w;
                dstbuf -= @as(c_ulong, @bitCast(@as(c_long, left))) *% @sizeOf(Uint16);
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            7 => {
                if (false) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            8 => {
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            9 => {
                ofs = 0;
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            10 => {
                if ((blk: {
                    const ref = &linecount;
                    ref.* -= 1;
                    break :blk ref.*;
                }) != 0) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            12 => {
                ofs += srcbuf[@as(c_int, 0)];
                run = srcbuf[@as(c_int, 1)];
                srcbuf += @as(c_ulong, 2) *% @sizeOf(Uint8);
                if (run != 0) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            13 => {
                if (ofs < w) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            14 => {
                psize = @sizeOf(Uint16);
                if (psize == @as(usize, 2)) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            15 => {
                cofs = ofs;
                crun = @bitCast(@as(c_uint, @truncate(run)));
                if ((left - cofs) > @as(c_int, 0)) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            16 => {
                if (!(ofs != 0)) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            18 => {
                crun -= left - cofs;
                cofs = left;
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            19 => {
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            20 => {
                if (crun > (right - cofs)) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            21 => {
                crun = right - cofs;
                {
                    sdl_pc = 23;
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
                if (crun > @as(c_int, 0)) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            24 => {
                _ = memcpy(@ptrCast(@alignCast(dstbuf + (@as(c_ulong, @bitCast(@as(c_long, cofs))) *% @sizeOf(Uint16)))), @ptrCast(@alignCast(srcbuf + (@as(c_ulong, @bitCast(@as(c_long, cofs - ofs))) *% @sizeOf(Uint16)))), @as(usize, @as(c_uint, @bitCast(@as(c_int, crun)))) *% @sizeOf(Uint16));
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            25 => {
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            26 => {
                srcbuf += @as(c_ulong, run) *% @sizeOf(Uint16);
                {
                    const ref = &ofs;
                    ref.* = @bitCast(@as(c_uint, @truncate(@as(c_uint, @bitCast(@as(c_int, ref.*))) +% run)));
                }
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            27 => {
                return;
            },
            28 => {
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            29 => {
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            30 => {
                srcbuf += @as(usize, @intCast(@intFromPtr(srcbuf))) & @as(usize, 2);
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            31 => {
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            32 => {
                ofs = 0;
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            33 => {
                ofs += @as([*c]Uint16, @ptrCast(@alignCast(srcbuf)))[@as(c_int, 0)];
                run_1 = @as([*c]Uint16, @ptrCast(@alignCast(srcbuf)))[@as(c_int, 1)];
                srcbuf += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                if (run_1 != 0) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 37;
                    continue;
                }
            },
            34 => {
                if (ofs < w) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 35;
                    continue;
                }
            },
            35 => {
                dstbuf += @as(usize, @bitCast(@as(isize, @intCast(surf_dst.*.pitch))));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            36 => {
                cofs_2 = ofs;
                crun_3 = @bitCast(@as(c_uint, @truncate(run_1)));
                if ((left - cofs_2) > @as(c_int, 0)) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 40;
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
                    sdl_pc = 34;
                    continue;
                }
            },
            39 => {
                crun_3 -= left - cofs_2;
                cofs_2 = left;
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            40 => {
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            41 => {
                if (crun_3 > (right - cofs_2)) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 43;
                    continue;
                }
            },
            42 => {
                crun_3 = right - cofs_2;
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            43 => {
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            44 => {
                if (crun_3 > @as(c_int, 0)) {
                    sdl_pc = 45;
                    continue;
                } else {
                    sdl_pc = 46;
                    continue;
                }
            },
            45 => {
                dst = @as([*c]Uint16, @ptrCast(@alignCast(dstbuf))) + @as(usize, @bitCast(@as(isize, @intCast(cofs_2))));
                src = @as([*c]Uint32, @ptrCast(@alignCast(srcbuf))) + @as(usize, @bitCast(@as(isize, @intCast(cofs_2 - ofs))));
                i = 0;
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            46 => {
                {
                    sdl_pc = 47;
                    continue;
                }
            },
            47 => {
                srcbuf += run_1 *% @as(c_uint, 4);
                {
                    const ref = &ofs;
                    ref.* = @bitCast(@as(c_uint, @truncate(@as(c_uint, @bitCast(@as(c_int, ref.*))) +% run_1)));
                }
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            48 => {
                if (i < crun_3) {
                    sdl_pc = 49;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            49 => {
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            50 => {
                i += 1;
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            51 => {
                {
                    sdl_pc = 47;
                    continue;
                }
            },
            52 => {
                s = src[@bitCast(@as(isize, @intCast(i)))];
                d = dst[@bitCast(@as(isize, @intCast(i)))];
                alpha = (s & @as(Uint32, 992)) >> @intCast(@as(Uint32, 5));
                s &= 132184095;
                d = (d | (d << @intCast(@as(Uint32, 16)))) & @as(Uint32, 132184095);
                d +%= ((s -% d) *% alpha) >> @intCast(@as(Uint32, 5));
                d &= 132184095;
                dst[@bitCast(@as(isize, @intCast(i)))] = @truncate(d | (d >> @intCast(@as(Uint32, 16))));
                {
                    sdl_pc = 53;
                    continue;
                }
            },
            53 => {
                if (false) {
                    sdl_pc = 52;
                    continue;
                } else {
                    sdl_pc = 54;
                    continue;
                }
            },
            54 => {
                {
                    sdl_pc = 50;
                    continue;
                }
            },
            55 => {
                linecount_4 = srcrect.*.h;
                left_5 = srcrect.*.x;
                right_6 = left_5 + srcrect.*.w;
                dstbuf -= @as(c_ulong, @bitCast(@as(c_long, left_5))) *% @sizeOf(Uint16);
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            56 => {
                if (false) {
                    sdl_pc = 55;
                    continue;
                } else {
                    sdl_pc = 57;
                    continue;
                }
            },
            57 => {
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            58 => {
                ofs_7 = 0;
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            59 => {
                if ((blk: {
                    const ref = &linecount_4;
                    ref.* -= 1;
                    break :blk ref.*;
                }) != 0) {
                    sdl_pc = 58;
                    continue;
                } else {
                    sdl_pc = 60;
                    continue;
                }
            },
            60 => {
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            61 => {
                ofs_7 += srcbuf[@as(c_int, 0)];
                run_8 = srcbuf[@as(c_int, 1)];
                srcbuf += @as(c_ulong, 2) *% @sizeOf(Uint8);
                if (run_8 != 0) {
                    sdl_pc = 64;
                    continue;
                } else {
                    sdl_pc = 65;
                    continue;
                }
            },
            62 => {
                if (ofs_7 < w) {
                    sdl_pc = 61;
                    continue;
                } else {
                    sdl_pc = 63;
                    continue;
                }
            },
            63 => {
                psize_11 = @sizeOf(Uint16);
                if (psize_11 == @as(usize, 2)) {
                    sdl_pc = 79;
                    continue;
                } else {
                    sdl_pc = 80;
                    continue;
                }
            },
            64 => {
                cofs_9 = ofs_7;
                crun_10 = @bitCast(@as(c_uint, @truncate(run_8)));
                if ((left_5 - cofs_9) > @as(c_int, 0)) {
                    sdl_pc = 67;
                    continue;
                } else {
                    sdl_pc = 68;
                    continue;
                }
            },
            65 => {
                if (!(ofs_7 != 0)) {
                    sdl_pc = 76;
                    continue;
                } else {
                    sdl_pc = 77;
                    continue;
                }
            },
            66 => {
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            67 => {
                crun_10 -= left_5 - cofs_9;
                cofs_9 = left_5;
                {
                    sdl_pc = 69;
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
                if (crun_10 > (right_6 - cofs_9)) {
                    sdl_pc = 70;
                    continue;
                } else {
                    sdl_pc = 71;
                    continue;
                }
            },
            70 => {
                crun_10 = right_6 - cofs_9;
                {
                    sdl_pc = 72;
                    continue;
                }
            },
            71 => {
                {
                    sdl_pc = 72;
                    continue;
                }
            },
            72 => {
                if (crun_10 > @as(c_int, 0)) {
                    sdl_pc = 73;
                    continue;
                } else {
                    sdl_pc = 74;
                    continue;
                }
            },
            73 => {
                _ = memcpy(@ptrCast(@alignCast(dstbuf + (@as(c_ulong, @bitCast(@as(c_long, cofs_9))) *% @sizeOf(Uint16)))), @ptrCast(@alignCast(srcbuf + (@as(c_ulong, @bitCast(@as(c_long, cofs_9 - ofs_7))) *% @sizeOf(Uint16)))), @as(usize, @as(c_uint, @bitCast(@as(c_int, crun_10)))) *% @sizeOf(Uint16));
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
                srcbuf += @as(c_ulong, run_8) *% @sizeOf(Uint16);
                {
                    const ref = &ofs_7;
                    ref.* = @bitCast(@as(c_uint, @truncate(@as(c_uint, @bitCast(@as(c_int, ref.*))) +% run_8)));
                }
                {
                    sdl_pc = 66;
                    continue;
                }
            },
            76 => {
                return;
            },
            77 => {
                {
                    sdl_pc = 78;
                    continue;
                }
            },
            78 => {
                {
                    sdl_pc = 66;
                    continue;
                }
            },
            79 => {
                srcbuf += @as(usize, @intCast(@intFromPtr(srcbuf))) & @as(usize, 2);
                {
                    sdl_pc = 81;
                    continue;
                }
            },
            80 => {
                {
                    sdl_pc = 81;
                    continue;
                }
            },
            81 => {
                ofs_7 = 0;
                {
                    sdl_pc = 82;
                    continue;
                }
            },
            82 => {
                ofs_7 += @as([*c]Uint16, @ptrCast(@alignCast(srcbuf)))[@as(c_int, 0)];
                run_12 = @as([*c]Uint16, @ptrCast(@alignCast(srcbuf)))[@as(c_int, 1)];
                srcbuf += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                if (run_12 != 0) {
                    sdl_pc = 85;
                    continue;
                } else {
                    sdl_pc = 86;
                    continue;
                }
            },
            83 => {
                if (ofs_7 < w) {
                    sdl_pc = 82;
                    continue;
                } else {
                    sdl_pc = 84;
                    continue;
                }
            },
            84 => {
                dstbuf += @as(usize, @bitCast(@as(isize, @intCast(surf_dst.*.pitch))));
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            85 => {
                cofs_13 = ofs_7;
                crun_14 = @bitCast(@as(c_uint, @truncate(run_12)));
                if ((left_5 - cofs_13) > @as(c_int, 0)) {
                    sdl_pc = 88;
                    continue;
                } else {
                    sdl_pc = 89;
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
                    sdl_pc = 83;
                    continue;
                }
            },
            88 => {
                crun_14 -= left_5 - cofs_13;
                cofs_13 = left_5;
                {
                    sdl_pc = 90;
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
                if (crun_14 > (right_6 - cofs_13)) {
                    sdl_pc = 91;
                    continue;
                } else {
                    sdl_pc = 92;
                    continue;
                }
            },
            91 => {
                crun_14 = right_6 - cofs_13;
                {
                    sdl_pc = 93;
                    continue;
                }
            },
            92 => {
                {
                    sdl_pc = 93;
                    continue;
                }
            },
            93 => {
                if (crun_14 > @as(c_int, 0)) {
                    sdl_pc = 94;
                    continue;
                } else {
                    sdl_pc = 95;
                    continue;
                }
            },
            94 => {
                dst_15 = @as([*c]Uint16, @ptrCast(@alignCast(dstbuf))) + @as(usize, @bitCast(@as(isize, @intCast(cofs_13))));
                src_16 = @as([*c]Uint32, @ptrCast(@alignCast(srcbuf))) + @as(usize, @bitCast(@as(isize, @intCast(cofs_13 - ofs_7))));
                i_17 = 0;
                {
                    sdl_pc = 97;
                    continue;
                }
            },
            95 => {
                {
                    sdl_pc = 96;
                    continue;
                }
            },
            96 => {
                srcbuf += run_12 *% @as(c_uint, 4);
                {
                    const ref = &ofs_7;
                    ref.* = @bitCast(@as(c_uint, @truncate(@as(c_uint, @bitCast(@as(c_int, ref.*))) +% run_12)));
                }
                {
                    sdl_pc = 87;
                    continue;
                }
            },
            97 => {
                if (i_17 < crun_14) {
                    sdl_pc = 98;
                    continue;
                } else {
                    sdl_pc = 100;
                    continue;
                }
            },
            98 => {
                {
                    sdl_pc = 101;
                    continue;
                }
            },
            99 => {
                i_17 += 1;
                {
                    sdl_pc = 97;
                    continue;
                }
            },
            100 => {
                {
                    sdl_pc = 96;
                    continue;
                }
            },
            101 => {
                s_18 = src_16[@bitCast(@as(isize, @intCast(i_17)))];
                d_19 = dst_15[@bitCast(@as(isize, @intCast(i_17)))];
                alpha_20 = (s_18 & @as(Uint32, 992)) >> @intCast(@as(Uint32, 5));
                s_18 &= 65043487;
                d_19 = (d_19 | (d_19 << @intCast(@as(Uint32, 16)))) & @as(Uint32, 65043487);
                d_19 +%= ((s_18 -% d_19) *% alpha_20) >> @intCast(@as(Uint32, 5));
                d_19 &= 65043487;
                dst_15[@bitCast(@as(isize, @intCast(i_17)))] = @truncate(d_19 | (d_19 >> @intCast(@as(Uint32, 16))));
                {
                    sdl_pc = 102;
                    continue;
                }
            },
            102 => {
                if (false) {
                    sdl_pc = 101;
                    continue;
                } else {
                    sdl_pc = 103;
                    continue;
                }
            },
            103 => {
                {
                    sdl_pc = 99;
                    continue;
                }
            },
            104 => {
                {
                    sdl_pc = 105;
                    continue;
                }
            },
            105 => {
                linecount_21 = srcrect.*.h;
                left_22 = srcrect.*.x;
                right_23 = left_22 + srcrect.*.w;
                dstbuf -= @as(c_ulong, @bitCast(@as(c_long, left_22))) *% @sizeOf(Uint32);
                {
                    sdl_pc = 108;
                    continue;
                }
            },
            106 => {
                if (false) {
                    sdl_pc = 105;
                    continue;
                } else {
                    sdl_pc = 107;
                    continue;
                }
            },
            107 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            108 => {
                ofs_24 = 0;
                {
                    sdl_pc = 111;
                    continue;
                }
            },
            109 => {
                if ((blk: {
                    const ref = &linecount_21;
                    ref.* -= 1;
                    break :blk ref.*;
                }) != 0) {
                    sdl_pc = 108;
                    continue;
                } else {
                    sdl_pc = 110;
                    continue;
                }
            },
            110 => {
                {
                    sdl_pc = 106;
                    continue;
                }
            },
            111 => {
                ofs_24 += @as([*c]Uint16, @ptrCast(@alignCast(srcbuf)))[@as(c_int, 0)];
                run_25 = @as([*c]Uint16, @ptrCast(@alignCast(srcbuf)))[@as(c_int, 1)];
                srcbuf += @as(c_ulong, 2) *% @sizeOf(Uint16);
                if (run_25 != 0) {
                    sdl_pc = 114;
                    continue;
                } else {
                    sdl_pc = 115;
                    continue;
                }
            },
            112 => {
                if (ofs_24 < w) {
                    sdl_pc = 111;
                    continue;
                } else {
                    sdl_pc = 113;
                    continue;
                }
            },
            113 => {
                psize_28 = @sizeOf(Uint32);
                if (psize_28 == @as(usize, 2)) {
                    sdl_pc = 129;
                    continue;
                } else {
                    sdl_pc = 130;
                    continue;
                }
            },
            114 => {
                cofs_26 = ofs_24;
                crun_27 = @bitCast(@as(c_uint, @truncate(run_25)));
                if ((left_22 - cofs_26) > @as(c_int, 0)) {
                    sdl_pc = 117;
                    continue;
                } else {
                    sdl_pc = 118;
                    continue;
                }
            },
            115 => {
                if (!(ofs_24 != 0)) {
                    sdl_pc = 126;
                    continue;
                } else {
                    sdl_pc = 127;
                    continue;
                }
            },
            116 => {
                {
                    sdl_pc = 112;
                    continue;
                }
            },
            117 => {
                crun_27 -= left_22 - cofs_26;
                cofs_26 = left_22;
                {
                    sdl_pc = 119;
                    continue;
                }
            },
            118 => {
                {
                    sdl_pc = 119;
                    continue;
                }
            },
            119 => {
                if (crun_27 > (right_23 - cofs_26)) {
                    sdl_pc = 120;
                    continue;
                } else {
                    sdl_pc = 121;
                    continue;
                }
            },
            120 => {
                crun_27 = right_23 - cofs_26;
                {
                    sdl_pc = 122;
                    continue;
                }
            },
            121 => {
                {
                    sdl_pc = 122;
                    continue;
                }
            },
            122 => {
                if (crun_27 > @as(c_int, 0)) {
                    sdl_pc = 123;
                    continue;
                } else {
                    sdl_pc = 124;
                    continue;
                }
            },
            123 => {
                _ = memcpy(@ptrCast(@alignCast(dstbuf + (@as(c_ulong, @bitCast(@as(c_long, cofs_26))) *% @sizeOf(Uint32)))), @ptrCast(@alignCast(srcbuf + (@as(c_ulong, @bitCast(@as(c_long, cofs_26 - ofs_24))) *% @sizeOf(Uint32)))), @as(usize, @as(c_uint, @bitCast(@as(c_int, crun_27)))) *% @sizeOf(Uint32));
                {
                    sdl_pc = 125;
                    continue;
                }
            },
            124 => {
                {
                    sdl_pc = 125;
                    continue;
                }
            },
            125 => {
                srcbuf += @as(c_ulong, run_25) *% @sizeOf(Uint32);
                {
                    const ref = &ofs_24;
                    ref.* = @bitCast(@as(c_uint, @truncate(@as(c_uint, @bitCast(@as(c_int, ref.*))) +% run_25)));
                }
                {
                    sdl_pc = 116;
                    continue;
                }
            },
            126 => {
                return;
            },
            127 => {
                {
                    sdl_pc = 128;
                    continue;
                }
            },
            128 => {
                {
                    sdl_pc = 116;
                    continue;
                }
            },
            129 => {
                srcbuf += @as(usize, @intCast(@intFromPtr(srcbuf))) & @as(usize, 2);
                {
                    sdl_pc = 131;
                    continue;
                }
            },
            130 => {
                {
                    sdl_pc = 131;
                    continue;
                }
            },
            131 => {
                ofs_24 = 0;
                {
                    sdl_pc = 132;
                    continue;
                }
            },
            132 => {
                ofs_24 += @as([*c]Uint16, @ptrCast(@alignCast(srcbuf)))[@as(c_int, 0)];
                run_29 = @as([*c]Uint16, @ptrCast(@alignCast(srcbuf)))[@as(c_int, 1)];
                srcbuf += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                if (run_29 != 0) {
                    sdl_pc = 135;
                    continue;
                } else {
                    sdl_pc = 136;
                    continue;
                }
            },
            133 => {
                if (ofs_24 < w) {
                    sdl_pc = 132;
                    continue;
                } else {
                    sdl_pc = 134;
                    continue;
                }
            },
            134 => {
                dstbuf += @as(usize, @bitCast(@as(isize, @intCast(surf_dst.*.pitch))));
                {
                    sdl_pc = 109;
                    continue;
                }
            },
            135 => {
                cofs_30 = ofs_24;
                crun_31 = @bitCast(@as(c_uint, @truncate(run_29)));
                if ((left_22 - cofs_30) > @as(c_int, 0)) {
                    sdl_pc = 138;
                    continue;
                } else {
                    sdl_pc = 139;
                    continue;
                }
            },
            136 => {
                {
                    sdl_pc = 137;
                    continue;
                }
            },
            137 => {
                {
                    sdl_pc = 133;
                    continue;
                }
            },
            138 => {
                crun_31 -= left_22 - cofs_30;
                cofs_30 = left_22;
                {
                    sdl_pc = 140;
                    continue;
                }
            },
            139 => {
                {
                    sdl_pc = 140;
                    continue;
                }
            },
            140 => {
                if (crun_31 > (right_23 - cofs_30)) {
                    sdl_pc = 141;
                    continue;
                } else {
                    sdl_pc = 142;
                    continue;
                }
            },
            141 => {
                crun_31 = right_23 - cofs_30;
                {
                    sdl_pc = 143;
                    continue;
                }
            },
            142 => {
                {
                    sdl_pc = 143;
                    continue;
                }
            },
            143 => {
                if (crun_31 > @as(c_int, 0)) {
                    sdl_pc = 144;
                    continue;
                } else {
                    sdl_pc = 145;
                    continue;
                }
            },
            144 => {
                dst_32 = @as([*c]Uint32, @ptrCast(@alignCast(dstbuf))) + @as(usize, @bitCast(@as(isize, @intCast(cofs_30))));
                src_33 = @as([*c]Uint32, @ptrCast(@alignCast(srcbuf))) + @as(usize, @bitCast(@as(isize, @intCast(cofs_30 - ofs_24))));
                i_34 = 0;
                {
                    sdl_pc = 147;
                    continue;
                }
            },
            145 => {
                {
                    sdl_pc = 146;
                    continue;
                }
            },
            146 => {
                srcbuf += run_29 *% @as(c_uint, 4);
                {
                    const ref = &ofs_24;
                    ref.* = @bitCast(@as(c_uint, @truncate(@as(c_uint, @bitCast(@as(c_int, ref.*))) +% run_29)));
                }
                {
                    sdl_pc = 137;
                    continue;
                }
            },
            147 => {
                if (i_34 < crun_31) {
                    sdl_pc = 148;
                    continue;
                } else {
                    sdl_pc = 150;
                    continue;
                }
            },
            148 => {
                {
                    sdl_pc = 151;
                    continue;
                }
            },
            149 => {
                i_34 += 1;
                {
                    sdl_pc = 147;
                    continue;
                }
            },
            150 => {
                {
                    sdl_pc = 146;
                    continue;
                }
            },
            151 => {
                s_35 = src_33[@bitCast(@as(isize, @intCast(i_34)))];
                d_36 = dst_32[@bitCast(@as(isize, @intCast(i_34)))];
                alpha_37 = s_35 >> @intCast(@as(Uint32, 24));
                s1 = s_35 & @as(Uint32, 16711935);
                d1 = d_36 & @as(Uint32, 16711935);
                d1 = (d1 +% (((s1 -% d1) *% alpha_37) >> @intCast(@as(Uint32, 8)))) & @as(Uint32, 16711935);
                s_35 &= 65280;
                d_36 &= 65280;
                d_36 = (d_36 +% (((s_35 -% d_36) *% alpha_37) >> @intCast(@as(Uint32, 8)))) & @as(Uint32, 65280);
                dst_32[@bitCast(@as(isize, @intCast(i_34)))] = (d1 | d_36) | @as(c_uint, 4278190080);
                {
                    sdl_pc = 152;
                    continue;
                }
            },
            152 => {
                if (false) {
                    sdl_pc = 151;
                    continue;
                } else {
                    sdl_pc = 153;
                    continue;
                }
            },
            153 => {
                {
                    sdl_pc = 149;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn SDL_RLEAlphaBlit(surf_src: [*c]SDL_Surface, srcrect: [*c]const SDL_Rect, surf_dst: [*c]SDL_Surface, dstrect: [*c]const SDL_Rect) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var x: c_int = undefined;
    _ = &x;
    var y: c_int = undefined;
    _ = &y;
    var w: c_int = undefined;
    _ = &w;
    var srcbuf: [*c]Uint8 = undefined;
    _ = &srcbuf;
    var dstbuf: [*c]Uint8 = undefined;
    _ = &dstbuf;
    var df: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &df;
    var vskip: c_int = undefined;
    _ = &vskip;
    var ofs: c_int = undefined;
    _ = &ofs;
    var run: c_int = undefined;
    _ = &run;
    var run_1: c_int = undefined;
    _ = &run_1;
    var run_2: c_int = undefined;
    _ = &run_2;
    var linecount: c_int = undefined;
    _ = &linecount;
    var ofs_3: c_int = undefined;
    _ = &ofs_3;
    var run_4: c_uint = undefined;
    _ = &run_4;
    var psize: usize = undefined;
    _ = &psize;
    var run_5: c_uint = undefined;
    _ = &run_5;
    var dst: [*c]Uint16 = undefined;
    _ = &dst;
    var i: c_uint = undefined;
    _ = &i;
    var src: Uint32 = undefined;
    _ = &src;
    var s: Uint32 = undefined;
    _ = &s;
    var d: Uint32 = undefined;
    _ = &d;
    var alpha: c_uint = undefined;
    _ = &alpha;
    var linecount_6: c_int = undefined;
    _ = &linecount_6;
    var ofs_7: c_int = undefined;
    _ = &ofs_7;
    var run_8: c_uint = undefined;
    _ = &run_8;
    var psize_9: usize = undefined;
    _ = &psize_9;
    var run_10: c_uint = undefined;
    _ = &run_10;
    var dst_11: [*c]Uint16 = undefined;
    _ = &dst_11;
    var i_12: c_uint = undefined;
    _ = &i_12;
    var src_13: Uint32 = undefined;
    _ = &src_13;
    var s_14: Uint32 = undefined;
    _ = &s_14;
    var d_15: Uint32 = undefined;
    _ = &d_15;
    var alpha_16: c_uint = undefined;
    _ = &alpha_16;
    var linecount_17: c_int = undefined;
    _ = &linecount_17;
    var ofs_18: c_int = undefined;
    _ = &ofs_18;
    var run_19: c_uint = undefined;
    _ = &run_19;
    var psize_20: usize = undefined;
    _ = &psize_20;
    var run_21: c_uint = undefined;
    _ = &run_21;
    var dst_22: [*c]Uint32 = undefined;
    _ = &dst_22;
    var i_23: c_uint = undefined;
    _ = &i_23;
    var src_24: Uint32 = undefined;
    _ = &src_24;
    var s_25: Uint32 = undefined;
    _ = &s_25;
    var d_26: Uint32 = undefined;
    _ = &d_26;
    var alpha_27: c_uint = undefined;
    _ = &alpha_27;
    var s1: Uint32 = undefined;
    _ = &s1;
    var d1: Uint32 = undefined;
    _ = &d1;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                w = surf_src.*.w;
                df = surf_dst.*.fmt;
                if ((surf_dst.*.flags & SDL_SURFACE_LOCK_NEEDED) == SDL_SURFACE_LOCK_NEEDED) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                if ((surf_dst.*.flags & SDL_SURFACE_LOCK_NEEDED) == SDL_SURFACE_LOCK_NEEDED) {
                    sdl_pc = 143;
                    continue;
                } else {
                    sdl_pc = 144;
                    continue;
                }
            },
            2 => {
                if (!SDL_LockSurface_REAL(surf_dst)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            3 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                x = dstrect.*.x;
                y = dstrect.*.y;
                dstbuf = (@as([*c]Uint8, @ptrCast(@alignCast(surf_dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * surf_dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, df.*.bytes_per_pixel)))));
                srcbuf = @as([*c]Uint8, @ptrCast(@alignCast(surf_src.*.map.data))) + @sizeOf(SDL_PixelFormat);
                vskip = srcrect.*.y;
                if (vskip != 0) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            5 => {
                return @"false" != 0;
            },
            6 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            8 => {
                if (@as(c_int, df.*.bytes_per_pixel) == @as(c_int, 2)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            9 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                if ((srcrect.*.x != 0) or (srcrect.*.w != surf_src.*.w)) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            11 => {
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            12 => {
                vskip <<= @intCast(@as(c_int, 1));
                {
                    sdl_pc = 29;
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
                ofs = 0;
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            15 => {
                if ((blk: {
                    const ref = &vskip;
                    ref.* -= 1;
                    break :blk ref.*;
                }) != 0) {
                    sdl_pc = 14;
                    continue;
                } else {
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
                ofs += srcbuf[@as(c_int, 0)];
                run = srcbuf[@as(c_int, 1)];
                srcbuf += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                if (run != 0) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            18 => {
                if (ofs < w) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            19 => {
                srcbuf += @as(usize, @intCast(@intFromPtr(srcbuf))) & @as(usize, 2);
                ofs = 0;
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            20 => {
                srcbuf += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * run))));
                ofs += run;
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            21 => {
                if (ofs == @as(c_int, 0)) {
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
                    sdl_pc = 1;
                    continue;
                }
            },
            24 => {
                {
                    sdl_pc = 25;
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
                ofs += @as([*c]Uint16, @ptrCast(@alignCast(srcbuf)))[@as(c_int, 0)];
                run_1 = @as([*c]Uint16, @ptrCast(@alignCast(srcbuf)))[@as(c_int, 1)];
                srcbuf += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4) * (run_1 + @as(c_int, 1))))));
                ofs += run_1;
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            27 => {
                if (ofs < w) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 28;
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
                ofs = 0;
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            30 => {
                if ((blk: {
                    const ref = &vskip;
                    ref.* -= 1;
                    break :blk ref.*;
                }) != 0) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            31 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            32 => {
                ofs += @as([*c]Uint16, @ptrCast(@alignCast(srcbuf)))[@as(c_int, 0)];
                run_2 = @as([*c]Uint16, @ptrCast(@alignCast(srcbuf)))[@as(c_int, 1)];
                srcbuf += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                if (run_2 != 0) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            33 => {
                if (ofs < w) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 34;
                    continue;
                }
            },
            34 => {
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            35 => {
                srcbuf += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4) * run_2))));
                ofs += run_2;
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            36 => {
                if (ofs == @as(c_int, 0)) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
                    continue;
                }
            },
            37 => {
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            38 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            39 => {
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            40 => {
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            41 => {
                RLEAlphaClipBlit(w, srcbuf, surf_dst, dstbuf, srcrect);
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            42 => {
                switch (@as(c_int, df.*.bytes_per_pixel)) {
                    @as(c_int, 2) => {
                        sdl_pc = 45;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 111;
                        continue;
                    },
                    else => {
                        sdl_pc = 44;
                        continue;
                    },
                }
            },
            43 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            44 => {
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            45 => {
                if (((df.*.Gmask == @as(Uint32, 2016)) or (df.*.Rmask == @as(Uint32, 2016))) or (df.*.Bmask == @as(Uint32, 2016))) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 47;
                    continue;
                }
            },
            46 => {
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            47 => {
                {
                    sdl_pc = 80;
                    continue;
                }
            },
            48 => {
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            49 => {
                linecount = srcrect.*.h;
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            50 => {
                if (false) {
                    sdl_pc = 49;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            51 => {
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            52 => {
                ofs_3 = 0;
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            53 => {
                if ((blk: {
                    const ref = &linecount;
                    ref.* -= 1;
                    break :blk ref.*;
                }) != 0) {
                    sdl_pc = 52;
                    continue;
                } else {
                    sdl_pc = 54;
                    continue;
                }
            },
            54 => {
                {
                    sdl_pc = 50;
                    continue;
                }
            },
            55 => {
                ofs_3 += srcbuf[@as(c_int, 0)];
                run_4 = srcbuf[@as(c_int, 1)];
                srcbuf += @as(c_ulong, 2) *% @sizeOf(Uint8);
                if (run_4 != 0) {
                    sdl_pc = 58;
                    continue;
                } else {
                    sdl_pc = 59;
                    continue;
                }
            },
            56 => {
                if (ofs_3 < w) {
                    sdl_pc = 55;
                    continue;
                } else {
                    sdl_pc = 57;
                    continue;
                }
            },
            57 => {
                psize = @sizeOf(Uint16);
                if (psize == @as(usize, 2)) {
                    sdl_pc = 64;
                    continue;
                } else {
                    sdl_pc = 65;
                    continue;
                }
            },
            58 => {
                _ = memcpy(@ptrCast(@alignCast(dstbuf + (@as(c_ulong, @bitCast(@as(c_long, ofs_3))) *% @sizeOf(Uint16)))), @ptrCast(@alignCast(srcbuf)), @as(usize, run_4) *% @sizeOf(Uint16));
                srcbuf += @as(c_ulong, run_4) *% @sizeOf(Uint16);
                {
                    const ref = &ofs_3;
                    ref.* = @bitCast(@as(c_uint, @truncate(@as(c_uint, @bitCast(@as(c_int, ref.*))) +% run_4)));
                }
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            59 => {
                if (!(ofs_3 != 0)) {
                    sdl_pc = 61;
                    continue;
                } else {
                    sdl_pc = 62;
                    continue;
                }
            },
            60 => {
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            61 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            62 => {
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            63 => {
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            64 => {
                srcbuf += @as(usize, @intCast(@intFromPtr(srcbuf))) & @as(usize, 2);
                {
                    sdl_pc = 66;
                    continue;
                }
            },
            65 => {
                {
                    sdl_pc = 66;
                    continue;
                }
            },
            66 => {
                ofs_3 = 0;
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            67 => {
                ofs_3 += @as([*c]Uint16, @ptrCast(@alignCast(srcbuf)))[@as(c_int, 0)];
                run_5 = @as([*c]Uint16, @ptrCast(@alignCast(srcbuf)))[@as(c_int, 1)];
                srcbuf += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                if (run_5 != 0) {
                    sdl_pc = 70;
                    continue;
                } else {
                    sdl_pc = 71;
                    continue;
                }
            },
            68 => {
                if (ofs_3 < w) {
                    sdl_pc = 67;
                    continue;
                } else {
                    sdl_pc = 69;
                    continue;
                }
            },
            69 => {
                dstbuf += @as(usize, @bitCast(@as(isize, @intCast(surf_dst.*.pitch))));
                {
                    sdl_pc = 53;
                    continue;
                }
            },
            70 => {
                dst = @as([*c]Uint16, @ptrCast(@alignCast(dstbuf))) + @as(usize, @bitCast(@as(isize, @intCast(ofs_3))));
                i = 0;
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            71 => {
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
                if (i < run_5) {
                    sdl_pc = 74;
                    continue;
                } else {
                    sdl_pc = 76;
                    continue;
                }
            },
            74 => {
                src = @as([*c]Uint32, @ptrCast(@alignCast(srcbuf))).*;
                {
                    sdl_pc = 77;
                    continue;
                }
            },
            75 => {
                i +%= 1;
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            76 => {
                {
                    const ref = &ofs_3;
                    ref.* = @bitCast(@as(c_uint, @truncate(@as(c_uint, @bitCast(@as(c_int, ref.*))) +% run_5)));
                }
                {
                    sdl_pc = 72;
                    continue;
                }
            },
            77 => {
                s = src;
                d = dst.*;
                alpha = (s & @as(Uint32, 992)) >> @intCast(@as(Uint32, 5));
                s &= 132184095;
                d = (d | (d << @intCast(@as(Uint32, 16)))) & @as(Uint32, 132184095);
                d +%= ((s -% d) *% alpha) >> @intCast(@as(Uint32, 5));
                d &= 132184095;
                dst.* = @truncate(d | (d >> @intCast(@as(Uint32, 16))));
                {
                    sdl_pc = 78;
                    continue;
                }
            },
            78 => {
                if (false) {
                    sdl_pc = 77;
                    continue;
                } else {
                    sdl_pc = 79;
                    continue;
                }
            },
            79 => {
                srcbuf += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                dst += 1;
                {
                    sdl_pc = 75;
                    continue;
                }
            },
            80 => {
                linecount_6 = srcrect.*.h;
                {
                    sdl_pc = 83;
                    continue;
                }
            },
            81 => {
                if (false) {
                    sdl_pc = 80;
                    continue;
                } else {
                    sdl_pc = 82;
                    continue;
                }
            },
            82 => {
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            83 => {
                ofs_7 = 0;
                {
                    sdl_pc = 86;
                    continue;
                }
            },
            84 => {
                if ((blk: {
                    const ref = &linecount_6;
                    ref.* -= 1;
                    break :blk ref.*;
                }) != 0) {
                    sdl_pc = 83;
                    continue;
                } else {
                    sdl_pc = 85;
                    continue;
                }
            },
            85 => {
                {
                    sdl_pc = 81;
                    continue;
                }
            },
            86 => {
                ofs_7 += srcbuf[@as(c_int, 0)];
                run_8 = srcbuf[@as(c_int, 1)];
                srcbuf += @as(c_ulong, 2) *% @sizeOf(Uint8);
                if (run_8 != 0) {
                    sdl_pc = 89;
                    continue;
                } else {
                    sdl_pc = 90;
                    continue;
                }
            },
            87 => {
                if (ofs_7 < w) {
                    sdl_pc = 86;
                    continue;
                } else {
                    sdl_pc = 88;
                    continue;
                }
            },
            88 => {
                psize_9 = @sizeOf(Uint16);
                if (psize_9 == @as(usize, 2)) {
                    sdl_pc = 95;
                    continue;
                } else {
                    sdl_pc = 96;
                    continue;
                }
            },
            89 => {
                _ = memcpy(@ptrCast(@alignCast(dstbuf + (@as(c_ulong, @bitCast(@as(c_long, ofs_7))) *% @sizeOf(Uint16)))), @ptrCast(@alignCast(srcbuf)), @as(usize, run_8) *% @sizeOf(Uint16));
                srcbuf += @as(c_ulong, run_8) *% @sizeOf(Uint16);
                {
                    const ref = &ofs_7;
                    ref.* = @bitCast(@as(c_uint, @truncate(@as(c_uint, @bitCast(@as(c_int, ref.*))) +% run_8)));
                }
                {
                    sdl_pc = 91;
                    continue;
                }
            },
            90 => {
                if (!(ofs_7 != 0)) {
                    sdl_pc = 92;
                    continue;
                } else {
                    sdl_pc = 93;
                    continue;
                }
            },
            91 => {
                {
                    sdl_pc = 87;
                    continue;
                }
            },
            92 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            93 => {
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            94 => {
                {
                    sdl_pc = 91;
                    continue;
                }
            },
            95 => {
                srcbuf += @as(usize, @intCast(@intFromPtr(srcbuf))) & @as(usize, 2);
                {
                    sdl_pc = 97;
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
                ofs_7 = 0;
                {
                    sdl_pc = 98;
                    continue;
                }
            },
            98 => {
                ofs_7 += @as([*c]Uint16, @ptrCast(@alignCast(srcbuf)))[@as(c_int, 0)];
                run_10 = @as([*c]Uint16, @ptrCast(@alignCast(srcbuf)))[@as(c_int, 1)];
                srcbuf += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                if (run_10 != 0) {
                    sdl_pc = 101;
                    continue;
                } else {
                    sdl_pc = 102;
                    continue;
                }
            },
            99 => {
                if (ofs_7 < w) {
                    sdl_pc = 98;
                    continue;
                } else {
                    sdl_pc = 100;
                    continue;
                }
            },
            100 => {
                dstbuf += @as(usize, @bitCast(@as(isize, @intCast(surf_dst.*.pitch))));
                {
                    sdl_pc = 84;
                    continue;
                }
            },
            101 => {
                dst_11 = @as([*c]Uint16, @ptrCast(@alignCast(dstbuf))) + @as(usize, @bitCast(@as(isize, @intCast(ofs_7))));
                i_12 = 0;
                {
                    sdl_pc = 104;
                    continue;
                }
            },
            102 => {
                {
                    sdl_pc = 103;
                    continue;
                }
            },
            103 => {
                {
                    sdl_pc = 99;
                    continue;
                }
            },
            104 => {
                if (i_12 < run_10) {
                    sdl_pc = 105;
                    continue;
                } else {
                    sdl_pc = 107;
                    continue;
                }
            },
            105 => {
                src_13 = @as([*c]Uint32, @ptrCast(@alignCast(srcbuf))).*;
                {
                    sdl_pc = 108;
                    continue;
                }
            },
            106 => {
                i_12 +%= 1;
                {
                    sdl_pc = 104;
                    continue;
                }
            },
            107 => {
                {
                    const ref = &ofs_7;
                    ref.* = @bitCast(@as(c_uint, @truncate(@as(c_uint, @bitCast(@as(c_int, ref.*))) +% run_10)));
                }
                {
                    sdl_pc = 103;
                    continue;
                }
            },
            108 => {
                s_14 = src_13;
                d_15 = dst_11.*;
                alpha_16 = (s_14 & @as(Uint32, 992)) >> @intCast(@as(Uint32, 5));
                s_14 &= 65043487;
                d_15 = (d_15 | (d_15 << @intCast(@as(Uint32, 16)))) & @as(Uint32, 65043487);
                d_15 +%= ((s_14 -% d_15) *% alpha_16) >> @intCast(@as(Uint32, 5));
                d_15 &= 65043487;
                dst_11.* = @truncate(d_15 | (d_15 >> @intCast(@as(Uint32, 16))));
                {
                    sdl_pc = 109;
                    continue;
                }
            },
            109 => {
                if (false) {
                    sdl_pc = 108;
                    continue;
                } else {
                    sdl_pc = 110;
                    continue;
                }
            },
            110 => {
                srcbuf += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                dst_11 += 1;
                {
                    sdl_pc = 106;
                    continue;
                }
            },
            111 => {
                {
                    sdl_pc = 112;
                    continue;
                }
            },
            112 => {
                linecount_17 = srcrect.*.h;
                {
                    sdl_pc = 115;
                    continue;
                }
            },
            113 => {
                if (false) {
                    sdl_pc = 112;
                    continue;
                } else {
                    sdl_pc = 114;
                    continue;
                }
            },
            114 => {
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            115 => {
                ofs_18 = 0;
                {
                    sdl_pc = 118;
                    continue;
                }
            },
            116 => {
                if ((blk: {
                    const ref = &linecount_17;
                    ref.* -= 1;
                    break :blk ref.*;
                }) != 0) {
                    sdl_pc = 115;
                    continue;
                } else {
                    sdl_pc = 117;
                    continue;
                }
            },
            117 => {
                {
                    sdl_pc = 113;
                    continue;
                }
            },
            118 => {
                ofs_18 += @as([*c]Uint16, @ptrCast(@alignCast(srcbuf)))[@as(c_int, 0)];
                run_19 = @as([*c]Uint16, @ptrCast(@alignCast(srcbuf)))[@as(c_int, 1)];
                srcbuf += @as(c_ulong, 2) *% @sizeOf(Uint16);
                if (run_19 != 0) {
                    sdl_pc = 121;
                    continue;
                } else {
                    sdl_pc = 122;
                    continue;
                }
            },
            119 => {
                if (ofs_18 < w) {
                    sdl_pc = 118;
                    continue;
                } else {
                    sdl_pc = 120;
                    continue;
                }
            },
            120 => {
                psize_20 = @sizeOf(Uint32);
                if (psize_20 == @as(usize, 2)) {
                    sdl_pc = 127;
                    continue;
                } else {
                    sdl_pc = 128;
                    continue;
                }
            },
            121 => {
                _ = memcpy(@ptrCast(@alignCast(dstbuf + (@as(c_ulong, @bitCast(@as(c_long, ofs_18))) *% @sizeOf(Uint32)))), @ptrCast(@alignCast(srcbuf)), @as(usize, run_19) *% @sizeOf(Uint32));
                srcbuf += @as(c_ulong, run_19) *% @sizeOf(Uint32);
                {
                    const ref = &ofs_18;
                    ref.* = @bitCast(@as(c_uint, @truncate(@as(c_uint, @bitCast(@as(c_int, ref.*))) +% run_19)));
                }
                {
                    sdl_pc = 123;
                    continue;
                }
            },
            122 => {
                if (!(ofs_18 != 0)) {
                    sdl_pc = 124;
                    continue;
                } else {
                    sdl_pc = 125;
                    continue;
                }
            },
            123 => {
                {
                    sdl_pc = 119;
                    continue;
                }
            },
            124 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            125 => {
                {
                    sdl_pc = 126;
                    continue;
                }
            },
            126 => {
                {
                    sdl_pc = 123;
                    continue;
                }
            },
            127 => {
                srcbuf += @as(usize, @intCast(@intFromPtr(srcbuf))) & @as(usize, 2);
                {
                    sdl_pc = 129;
                    continue;
                }
            },
            128 => {
                {
                    sdl_pc = 129;
                    continue;
                }
            },
            129 => {
                ofs_18 = 0;
                {
                    sdl_pc = 130;
                    continue;
                }
            },
            130 => {
                ofs_18 += @as([*c]Uint16, @ptrCast(@alignCast(srcbuf)))[@as(c_int, 0)];
                run_21 = @as([*c]Uint16, @ptrCast(@alignCast(srcbuf)))[@as(c_int, 1)];
                srcbuf += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                if (run_21 != 0) {
                    sdl_pc = 133;
                    continue;
                } else {
                    sdl_pc = 134;
                    continue;
                }
            },
            131 => {
                if (ofs_18 < w) {
                    sdl_pc = 130;
                    continue;
                } else {
                    sdl_pc = 132;
                    continue;
                }
            },
            132 => {
                dstbuf += @as(usize, @bitCast(@as(isize, @intCast(surf_dst.*.pitch))));
                {
                    sdl_pc = 116;
                    continue;
                }
            },
            133 => {
                dst_22 = @as([*c]Uint32, @ptrCast(@alignCast(dstbuf))) + @as(usize, @bitCast(@as(isize, @intCast(ofs_18))));
                i_23 = 0;
                {
                    sdl_pc = 136;
                    continue;
                }
            },
            134 => {
                {
                    sdl_pc = 135;
                    continue;
                }
            },
            135 => {
                {
                    sdl_pc = 131;
                    continue;
                }
            },
            136 => {
                if (i_23 < run_21) {
                    sdl_pc = 137;
                    continue;
                } else {
                    sdl_pc = 139;
                    continue;
                }
            },
            137 => {
                src_24 = @as([*c]Uint32, @ptrCast(@alignCast(srcbuf))).*;
                {
                    sdl_pc = 140;
                    continue;
                }
            },
            138 => {
                i_23 +%= 1;
                {
                    sdl_pc = 136;
                    continue;
                }
            },
            139 => {
                {
                    const ref = &ofs_18;
                    ref.* = @bitCast(@as(c_uint, @truncate(@as(c_uint, @bitCast(@as(c_int, ref.*))) +% run_21)));
                }
                {
                    sdl_pc = 135;
                    continue;
                }
            },
            140 => {
                s_25 = src_24;
                d_26 = dst_22.*;
                alpha_27 = s_25 >> @intCast(@as(Uint32, 24));
                s1 = s_25 & @as(Uint32, 16711935);
                d1 = d_26 & @as(Uint32, 16711935);
                d1 = (d1 +% (((s1 -% d1) *% alpha_27) >> @intCast(@as(Uint32, 8)))) & @as(Uint32, 16711935);
                s_25 &= 65280;
                d_26 &= 65280;
                d_26 = (d_26 +% (((s_25 -% d_26) *% alpha_27) >> @intCast(@as(Uint32, 8)))) & @as(Uint32, 65280);
                dst_22.* = (d1 | d_26) | @as(c_uint, 4278190080);
                {
                    sdl_pc = 141;
                    continue;
                }
            },
            141 => {
                if (false) {
                    sdl_pc = 140;
                    continue;
                } else {
                    sdl_pc = 142;
                    continue;
                }
            },
            142 => {
                srcbuf += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                dst_22 += 1;
                {
                    sdl_pc = 138;
                    continue;
                }
            },
            143 => {
                SDL_UnlockSurface_REAL(surf_dst);
                {
                    sdl_pc = 145;
                    continue;
                }
            },
            144 => {
                {
                    sdl_pc = 145;
                    continue;
                }
            },
            145 => {
                return @"true" != 0;
            },
            else => unreachable,
        }
    }
}
pub fn copy_opaque_16(dst: ?*anyopaque, arg_src: [*c]const Uint32, n: c_int, sfmt: [*c]const SDL_PixelFormatDetails, dfmt: [*c]const SDL_PixelFormatDetails) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    var d: [*c]Uint16 = @ptrCast(@alignCast(dst));
    _ = &d;
    {
        i = 0;
        while (i < n) : (i += 1) {
            var r: c_uint = undefined;
            _ = &r;
            var g: c_uint = undefined;
            _ = &g;
            var b: c_uint = undefined;
            _ = &b;
            {
                r = SDL_expand_byte[sfmt.*.Rbits][(src.* & sfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, sfmt.*.Rshift)))))];
                g = SDL_expand_byte[sfmt.*.Gbits][(src.* & sfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, sfmt.*.Gshift)))))];
                b = SDL_expand_byte[sfmt.*.Bbits][(src.* & sfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, sfmt.*.Bshift)))))];
            }
            {
                d.* = @truncate(((((r >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dfmt.*.Rshift)))))) | ((g >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dfmt.*.Gshift))))))) | ((b >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dfmt.*.Bshift))))))) | dfmt.*.Amask);
            }
            src += 1;
            d += 1;
        }
    }
    return n * @as(c_int, 2);
}
pub fn copy_transl_565(dst: ?*anyopaque, arg_src: [*c]const Uint32, n: c_int, sfmt: [*c]const SDL_PixelFormatDetails, dfmt: [*c]const SDL_PixelFormatDetails) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    var d: [*c]Uint32 = @ptrCast(@alignCast(dst));
    _ = &d;
    {
        i = 0;
        while (i < n) : (i += 1) {
            var r: c_uint = undefined;
            _ = &r;
            var g: c_uint = undefined;
            _ = &g;
            var b: c_uint = undefined;
            _ = &b;
            var a: c_uint = undefined;
            _ = &a;
            var pix: Uint16 = undefined;
            _ = &pix;
            {
                r = (src.* & sfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, sfmt.*.Rshift)))));
                g = (src.* & sfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, sfmt.*.Gshift)))));
                b = (src.* & sfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, sfmt.*.Bshift)))));
                a = (src.* & sfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, sfmt.*.Ashift)))));
            }
            {
                pix = @truncate(((((r >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dfmt.*.Rshift)))))) | ((g >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dfmt.*.Gshift))))))) | ((b >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dfmt.*.Bshift))))))) | dfmt.*.Amask);
            }
            d.* = @as(c_uint, @bitCast(@as(c_int, ((@as(c_int, pix) & @as(c_int, 2016)) << @intCast(@as(c_int, 16))) | (@as(c_int, pix) & @as(c_int, 63519))))) | ((a << @intCast(@as(c_uint, 2))) & @as(c_uint, 2016));
            src += 1;
            d += 1;
        }
    }
    return n * @as(c_int, 4);
}
pub fn copy_transl_555(dst: ?*anyopaque, arg_src: [*c]const Uint32, n: c_int, sfmt: [*c]const SDL_PixelFormatDetails, dfmt: [*c]const SDL_PixelFormatDetails) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    var d: [*c]Uint32 = @ptrCast(@alignCast(dst));
    _ = &d;
    {
        i = 0;
        while (i < n) : (i += 1) {
            var r: c_uint = undefined;
            _ = &r;
            var g: c_uint = undefined;
            _ = &g;
            var b: c_uint = undefined;
            _ = &b;
            var a: c_uint = undefined;
            _ = &a;
            var pix: Uint16 = undefined;
            _ = &pix;
            {
                r = (src.* & sfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, sfmt.*.Rshift)))));
                g = (src.* & sfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, sfmt.*.Gshift)))));
                b = (src.* & sfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, sfmt.*.Bshift)))));
                a = (src.* & sfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, sfmt.*.Ashift)))));
            }
            {
                pix = @truncate(((((r >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dfmt.*.Rshift)))))) | ((g >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dfmt.*.Gshift))))))) | ((b >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dfmt.*.Bshift))))))) | dfmt.*.Amask);
            }
            d.* = @as(c_uint, @bitCast(@as(c_int, ((@as(c_int, pix) & @as(c_int, 992)) << @intCast(@as(c_int, 16))) | (@as(c_int, pix) & @as(c_int, 64543))))) | ((a << @intCast(@as(c_uint, 2))) & @as(c_uint, 992));
            src += 1;
            d += 1;
        }
    }
    return n * @as(c_int, 4);
}
pub fn copy_32(dst: ?*anyopaque, arg_src: [*c]const Uint32, n: c_int, sfmt: [*c]const SDL_PixelFormatDetails, dfmt: [*c]const SDL_PixelFormatDetails) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    var d: [*c]Uint32 = @ptrCast(@alignCast(dst));
    _ = &d;
    {
        i = 0;
        while (i < n) : (i += 1) {
            var r: c_uint = undefined;
            _ = &r;
            var g: c_uint = undefined;
            _ = &g;
            var b: c_uint = undefined;
            _ = &b;
            var a: c_uint = undefined;
            _ = &a;
            {
                r = (src.* & sfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, sfmt.*.Rshift)))));
                g = (src.* & sfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, sfmt.*.Gshift)))));
                b = (src.* & sfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, sfmt.*.Bshift)))));
                a = (src.* & sfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, sfmt.*.Ashift)))));
            }
            {
                d.* = ((((r >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dfmt.*.Rshift)))))) | ((g >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dfmt.*.Gshift))))))) | ((b >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dfmt.*.Bshift))))))) | (a << @intCast(@as(c_uint, 24)));
            }
            d += 1;
            src += 1;
        }
    }
    return n * @as(c_int, 4);
}
pub fn RLEAlphaSurface(surface: [*c]SDL_Surface) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var dest: [*c]SDL_Surface = undefined;
    _ = &dest;
    var df: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &df;
    var maxsize: c_int = undefined;
    _ = &maxsize;
    var max_opaque_run: c_int = undefined;
    _ = &max_opaque_run;
    var max_transl_run: c_int = undefined;
    _ = &max_transl_run;
    var masksum: c_uint = undefined;
    _ = &masksum;
    var rlebuf: [*c]Uint8 = undefined;
    _ = &rlebuf;
    var dst: [*c]Uint8 = undefined;
    _ = &dst;
    var copy_opaque: ?*const fn (?*anyopaque, [*c]const Uint32, c_int, [*c]const SDL_PixelFormatDetails, [*c]const SDL_PixelFormatDetails) callconv(.c) c_int = undefined;
    _ = &copy_opaque;
    var copy_transl: ?*const fn (?*anyopaque, [*c]const Uint32, c_int, [*c]const SDL_PixelFormatDetails, [*c]const SDL_PixelFormatDetails) callconv(.c) c_int = undefined;
    _ = &copy_transl;
    var x: c_int = undefined;
    _ = &x;
    var y: c_int = undefined;
    _ = &y;
    var h: c_int = undefined;
    _ = &h;
    var w: c_int = undefined;
    _ = &w;
    var sf: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &sf;
    var src: [*c]Uint32 = undefined;
    _ = &src;
    var lastline: [*c]Uint8 = undefined;
    _ = &lastline;
    var runstart: c_int = undefined;
    _ = &runstart;
    var skipstart: c_int = undefined;
    _ = &skipstart;
    var blankline: c_int = undefined;
    _ = &blankline;
    var run: c_int = undefined;
    _ = &run;
    var skip: c_int = undefined;
    _ = &skip;
    var len: c_int = undefined;
    _ = &len;
    var run_1: c_int = undefined;
    _ = &run_1;
    var skip_2: c_int = undefined;
    _ = &skip_2;
    var len_3: c_int = undefined;
    _ = &len_3;
    var p: [*c]Uint8 = undefined;
    _ = &p;
    @as([*c]Uint16, @ptrCast(@alignCast(dst)))[@as(c_int, 0)] = @bitCast(@as(c_short, @truncate(max_transl_run)));
    @as([*c]Uint16, @ptrCast(@alignCast(dst)))[@as(c_int, 1)] = @bitCast(@as(c_short, @truncate(@as(c_int, 0))));
    @as([*c]Uint16, @ptrCast(@alignCast(dst)))[@as(c_int, 0)] = @bitCast(@as(c_short, @truncate(skip_2)));
    @as([*c]Uint16, @ptrCast(@alignCast(dst)))[@as(c_int, 1)] = @bitCast(@as(c_short, @truncate(len_3)));
    @as([*c]Uint16, @ptrCast(@alignCast(dst)))[@as(c_int, 0)] = @bitCast(@as(c_short, @truncate(@as(c_int, 0))));
    @as([*c]Uint16, @ptrCast(@alignCast(dst)))[@as(c_int, 1)] = @bitCast(@as(c_short, @truncate(len_3)));
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                maxsize = 0;
                max_transl_run = 65535;
                dest = surface.*.map.info.dst_surface;
                if (!(dest != null)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return @"false" != 0;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                df = dest.*.fmt;
                if (@as(c_int, surface.*.fmt.*.bits_per_pixel) != @as(c_int, 32)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                return @"false" != 0;
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                masksum = (df.*.Rmask | df.*.Gmask) | df.*.Bmask;
                switch (@as(c_int, df.*.bytes_per_pixel)) {
                    @as(c_int, 2) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 19;
                        continue;
                    },
                    else => {
                        sdl_pc = 23;
                        continue;
                    },
                }
            },
            7 => {
                {
                    const ref = &maxsize;
                    ref.* = @bitCast(@as(c_uint, @truncate(@as(c_ulong, @bitCast(@as(c_long, ref.*))) +% @sizeOf(SDL_PixelFormat))));
                }
                rlebuf = @ptrCast(@alignCast(SDL_malloc_REAL(@bitCast(@as(c_long, maxsize)))));
                if (!(rlebuf != null)) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            8 => {
                switch (masksum) {
                    @as(c_uint, 65535) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(c_uint, 32767) => {
                        sdl_pc = 14;
                        continue;
                    },
                    else => {
                        sdl_pc = 18;
                        continue;
                    },
                }
            },
            9 => {
                max_opaque_run = 255;
                maxsize = (surface.*.h * (@as(c_int, 2) + ((@as(c_int, 4) + @as(c_int, 2)) * (surface.*.w + @as(c_int, 1))))) + @as(c_int, 2);
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            10 => {
                if (((df.*.Gmask == @as(Uint32, 2016)) or (df.*.Rmask == @as(Uint32, 2016))) or (df.*.Bmask == @as(Uint32, 2016))) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                copy_opaque = copy_opaque_16;
                copy_transl = copy_transl_565;
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            12 => {
                return @"false" != 0;
            },
            13 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            14 => {
                if (((df.*.Gmask == @as(Uint32, 992)) or (df.*.Rmask == @as(Uint32, 992))) or (df.*.Bmask == @as(Uint32, 992))) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            15 => {
                copy_opaque = copy_opaque_16;
                copy_transl = copy_transl_555;
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            16 => {
                return @"false" != 0;
            },
            17 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            18 => {
                return @"false" != 0;
            },
            19 => {
                if (masksum != @as(c_uint, 16777215)) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                return @"false" != 0;
            },
            21 => {
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            22 => {
                copy_opaque = copy_32;
                copy_transl = copy_32;
                max_opaque_run = 255;
                maxsize = (((surface.*.h * @as(c_int, 2)) * @as(c_int, 4)) * (surface.*.w + @as(c_int, 1))) + @as(c_int, 4);
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            23 => {
                return @"false" != 0;
            },
            24 => {
                return @"false" != 0;
            },
            25 => {
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            26 => {
                @as([*c]SDL_PixelFormat, @ptrCast(@alignCast(rlebuf))).* = dest.*.format;
                dst = rlebuf + @sizeOf(SDL_PixelFormat);
                h = surface.*.h;
                w = surface.*.w;
                sf = surface.*.fmt;
                src = @ptrCast(@alignCast(surface.*.pixels));
                lastline = dst;
                y = 0;
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            27 => {
                if (y < h) {
                    sdl_pc = 28;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            28 => {
                blankline = 0;
                x = 0;
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            29 => {
                y += 1;
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            30 => {
                dst = lastline;
                if (@as(c_int, df.*.bytes_per_pixel) == @as(c_int, 4)) {
                    sdl_pc = 76;
                    continue;
                } else {
                    sdl_pc = 77;
                    continue;
                }
            },
            31 => {
                skipstart = x;
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            32 => {
                if (x < w) {
                    sdl_pc = 31;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            33 => {
                dst += @as(usize, @intCast(@intFromPtr(dst))) & @as(usize, 2);
                x = 0;
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            34 => {
                if ((x < w) and !(((src[@bitCast(@as(isize, @intCast(x)))] & sf.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, sf.*.Ashift)))))) == @as(Uint32, 255))) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            35 => {
                x += 1;
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            36 => {
                runstart = x;
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            37 => {
                if ((x < w) and (((src[@bitCast(@as(isize, @intCast(x)))] & sf.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, sf.*.Ashift)))))) == @as(Uint32, 255))) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
                    continue;
                }
            },
            38 => {
                x += 1;
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            39 => {
                skip = runstart - skipstart;
                if (skip == w) {
                    sdl_pc = 40;
                    continue;
                } else {
                    sdl_pc = 41;
                    continue;
                }
            },
            40 => {
                blankline = 1;
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            41 => {
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            42 => {
                run = x - runstart;
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            43 => {
                if (skip > max_opaque_run) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            44 => {
                if (@as(c_int, df.*.bytes_per_pixel) == @as(c_int, 4)) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 47;
                    continue;
                }
            },
            45 => {
                len = if (run < max_opaque_run) run else max_opaque_run;
                if (@as(c_int, df.*.bytes_per_pixel) == @as(c_int, 4)) {
                    sdl_pc = 49;
                    continue;
                } else {
                    sdl_pc = 50;
                    continue;
                }
            },
            46 => {
                @as([*c]Uint16, @ptrCast(@alignCast(dst)))[@as(c_int, 0)] = @bitCast(@as(c_short, @truncate(max_opaque_run)));
                @as([*c]Uint16, @ptrCast(@alignCast(dst)))[@as(c_int, 1)] = @bitCast(@as(c_short, @truncate(@as(c_int, 0))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            47 => {
                dst[@as(c_int, 0)] = @bitCast(@as(i8, @truncate(max_opaque_run)));
                dst[@as(c_int, 1)] = @bitCast(@as(i8, @truncate(@as(c_int, 0))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            48 => {
                skip -= max_opaque_run;
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            49 => {
                @as([*c]Uint16, @ptrCast(@alignCast(dst)))[@as(c_int, 0)] = @bitCast(@as(c_short, @truncate(skip)));
                @as([*c]Uint16, @ptrCast(@alignCast(dst)))[@as(c_int, 1)] = @bitCast(@as(c_short, @truncate(len)));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            50 => {
                dst[@as(c_int, 0)] = @bitCast(@as(i8, @truncate(skip)));
                dst[@as(c_int, 1)] = @bitCast(@as(i8, @truncate(len)));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            51 => {
                dst += @as(usize, @bitCast(@as(isize, @intCast(copy_opaque.?(@ptrCast(@alignCast(dst)), src + @as(usize, @bitCast(@as(isize, @intCast(runstart)))), len, sf, df)))));
                runstart += len;
                run -= len;
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            52 => {
                if (run != 0) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 54;
                    continue;
                }
            },
            53 => {
                len = if (run < max_opaque_run) run else max_opaque_run;
                if (@as(c_int, df.*.bytes_per_pixel) == @as(c_int, 4)) {
                    sdl_pc = 55;
                    continue;
                } else {
                    sdl_pc = 56;
                    continue;
                }
            },
            54 => {
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            55 => {
                @as([*c]Uint16, @ptrCast(@alignCast(dst)))[@as(c_int, 0)] = @bitCast(@as(c_short, @truncate(@as(c_int, 0))));
                @as([*c]Uint16, @ptrCast(@alignCast(dst)))[@as(c_int, 1)] = @bitCast(@as(c_short, @truncate(len)));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            56 => {
                dst[@as(c_int, 0)] = @bitCast(@as(i8, @truncate(@as(c_int, 0))));
                dst[@as(c_int, 1)] = @bitCast(@as(i8, @truncate(len)));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            57 => {
                dst += @as(usize, @bitCast(@as(isize, @intCast(copy_opaque.?(@ptrCast(@alignCast(dst)), src + @as(usize, @bitCast(@as(isize, @intCast(runstart)))), len, sf, df)))));
                runstart += len;
                run -= len;
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            58 => {
                skipstart = x;
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            59 => {
                if (x < w) {
                    sdl_pc = 58;
                    continue;
                } else {
                    sdl_pc = 60;
                    continue;
                }
            },
            60 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(surface.*.pitch >> @intCast(@as(c_int, 2))))));
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            61 => {
                if ((x < w) and !((((src[@bitCast(@as(isize, @intCast(x)))] & sf.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, sf.*.Ashift)))))) -% @as(c_uint, 1)) < @as(c_uint, 254))) {
                    sdl_pc = 62;
                    continue;
                } else {
                    sdl_pc = 63;
                    continue;
                }
            },
            62 => {
                x += 1;
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            63 => {
                runstart = x;
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            64 => {
                if ((x < w) and ((((src[@bitCast(@as(isize, @intCast(x)))] & sf.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, sf.*.Ashift)))))) -% @as(c_uint, 1)) < @as(c_uint, 254))) {
                    sdl_pc = 65;
                    continue;
                } else {
                    sdl_pc = 66;
                    continue;
                }
            },
            65 => {
                x += 1;
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            66 => {
                skip_2 = runstart - skipstart;
                blankline &= @intFromBool(skip_2 == w);
                run_1 = x - runstart;
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            67 => {
                if (skip_2 > max_transl_run) {
                    sdl_pc = 68;
                    continue;
                } else {
                    sdl_pc = 69;
                    continue;
                }
            },
            68 => {
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                skip_2 -= max_transl_run;
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            69 => {
                len_3 = if (run_1 < max_transl_run) run_1 else max_transl_run;
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(copy_transl.?(@ptrCast(@alignCast(dst)), src + @as(usize, @bitCast(@as(isize, @intCast(runstart)))), len_3, sf, df)))));
                runstart += len_3;
                run_1 -= len_3;
                {
                    sdl_pc = 70;
                    continue;
                }
            },
            70 => {
                if (run_1 != 0) {
                    sdl_pc = 71;
                    continue;
                } else {
                    sdl_pc = 72;
                    continue;
                }
            },
            71 => {
                len_3 = if (run_1 < max_transl_run) run_1 else max_transl_run;
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(copy_transl.?(@ptrCast(@alignCast(dst)), src + @as(usize, @bitCast(@as(isize, @intCast(runstart)))), len_3, sf, df)))));
                runstart += len_3;
                run_1 -= len_3;
                {
                    sdl_pc = 70;
                    continue;
                }
            },
            72 => {
                if (!(blankline != 0)) {
                    sdl_pc = 73;
                    continue;
                } else {
                    sdl_pc = 74;
                    continue;
                }
            },
            73 => {
                lastline = dst;
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
                    sdl_pc = 59;
                    continue;
                }
            },
            76 => {
                @as([*c]Uint16, @ptrCast(@alignCast(dst)))[@as(c_int, 0)] = @bitCast(@as(c_short, @truncate(@as(c_int, 0))));
                @as([*c]Uint16, @ptrCast(@alignCast(dst)))[@as(c_int, 1)] = @bitCast(@as(c_short, @truncate(@as(c_int, 0))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                {
                    sdl_pc = 78;
                    continue;
                }
            },
            77 => {
                dst[@as(c_int, 0)] = @bitCast(@as(i8, @truncate(@as(c_int, 0))));
                dst[@as(c_int, 1)] = @bitCast(@as(i8, @truncate(@as(c_int, 0))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                {
                    sdl_pc = 78;
                    continue;
                }
            },
            78 => {
                p = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(rlebuf)), @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(dst) -% @intFromPtr(rlebuf))), @sizeOf(Uint8)))))));
                if (!(p != null)) {
                    sdl_pc = 79;
                    continue;
                } else {
                    sdl_pc = 80;
                    continue;
                }
            },
            79 => {
                p = rlebuf;
                {
                    sdl_pc = 81;
                    continue;
                }
            },
            80 => {
                {
                    sdl_pc = 81;
                    continue;
                }
            },
            81 => {
                surface.*.map.data = @ptrCast(@alignCast(p));
                return @"true" != 0;
            },
            else => unreachable,
        }
    }
}
pub fn getpix_8(srcbuf: [*c]const Uint8) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    return srcbuf.*;
}
pub fn getpix_16(srcbuf: [*c]const Uint8) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    return @as([*c]const Uint16, @ptrCast(@alignCast(srcbuf))).*;
}
pub fn getpix_24(srcbuf: [*c]const Uint8) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(c_int, (@as(c_int, srcbuf[@as(c_int, 0)]) + (@as(c_int, srcbuf[@as(c_int, 1)]) << @intCast(@as(c_int, 8)))) + (@as(c_int, srcbuf[@as(c_int, 2)]) << @intCast(@as(c_int, 16)))));
}
pub fn getpix_32(srcbuf: [*c]const Uint8) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    return @as([*c]const Uint32, @ptrCast(@alignCast(srcbuf))).*;
}
pub const getpix_func = ?*const fn ([*c]const Uint8) callconv(.c) Uint32;
pub const getpixes: [4]getpix_func = [4]getpix_func{
    getpix_8,
    getpix_16,
    getpix_24,
    getpix_32,
};
pub fn RLEColorkeySurface(surface: [*c]SDL_Surface) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var dest: [*c]SDL_Surface = undefined;
    _ = &dest;
    var rlebuf: [*c]Uint8 = undefined;
    _ = &rlebuf;
    var dst: [*c]Uint8 = undefined;
    _ = &dst;
    var maxn: c_int = undefined;
    _ = &maxn;
    var y: c_int = undefined;
    _ = &y;
    var srcbuf: [*c]Uint8 = undefined;
    _ = &srcbuf;
    var lastline: [*c]Uint8 = undefined;
    _ = &lastline;
    var maxsize: c_int = undefined;
    _ = &maxsize;
    var bpp: c_int = undefined;
    _ = &bpp;
    var getpix: getpix_func = undefined;
    _ = &getpix;
    var ckey: Uint32 = undefined;
    _ = &ckey;
    var rgbmask: Uint32 = undefined;
    _ = &rgbmask;
    var w: c_int = undefined;
    _ = &w;
    var h: c_int = undefined;
    _ = &h;
    var x: c_int = undefined;
    _ = &x;
    var blankline: c_int = undefined;
    _ = &blankline;
    var run: c_int = undefined;
    _ = &run;
    var skip: c_int = undefined;
    _ = &skip;
    var len: c_int = undefined;
    _ = &len;
    var runstart: c_int = undefined;
    _ = &runstart;
    var skipstart: c_int = undefined;
    _ = &skipstart;
    var p: [*c]Uint8 = undefined;
    _ = &p;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                maxsize = 0;
                bpp = surface.*.fmt.*.bytes_per_pixel;
                dest = surface.*.map.info.dst_surface;
                if (!(dest != null)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return @"false" != 0;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                switch (bpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 8;
                        continue;
                    },
                    else => {
                        sdl_pc = 9;
                        continue;
                    },
                }
            },
            4 => {
                {
                    const ref = &maxsize;
                    ref.* = @bitCast(@as(c_uint, @truncate(@as(c_ulong, @bitCast(@as(c_long, ref.*))) +% @sizeOf(SDL_PixelFormat))));
                }
                rlebuf = @ptrCast(@alignCast(SDL_malloc_REAL(@bitCast(@as(c_long, maxsize)))));
                if (!(rlebuf != null)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            5 => {
                maxsize = ((surface.*.h * @as(c_int, 3)) * (@divTrunc(surface.*.w, @as(c_int, 2)) + @as(c_int, 1))) + @as(c_int, 2);
                {
                    sdl_pc = 4;
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
                maxsize = (surface.*.h * ((@as(c_int, 2) * (@divTrunc(surface.*.w, @as(c_int, 255)) + @as(c_int, 1))) + (surface.*.w * bpp))) + @as(c_int, 2);
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            8 => {
                maxsize = (surface.*.h * ((@as(c_int, 4) * (@divTrunc(surface.*.w, @as(c_int, 65535)) + @as(c_int, 1))) + (surface.*.w * @as(c_int, 4)))) + @as(c_int, 4);
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            9 => {
                return @"false" != 0;
            },
            10 => {
                return @"false" != 0;
            },
            11 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                @as([*c]SDL_PixelFormat, @ptrCast(@alignCast(rlebuf))).* = dest.*.format;
                srcbuf = @ptrCast(@alignCast(surface.*.pixels));
                maxn = if (bpp == @as(c_int, 4)) @as(c_int, 65535) else @as(c_int, 255);
                dst = rlebuf + @sizeOf(SDL_PixelFormat);
                rgbmask = ~surface.*.fmt.*.Amask;
                ckey = surface.*.map.info.colorkey & rgbmask;
                lastline = dst;
                getpix = getpixes[@bitCast(@as(isize, @intCast(bpp - @as(c_int, 1))))];
                w = surface.*.w;
                h = surface.*.h;
                y = 0;
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                if (y < h) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            14 => {
                x = 0;
                blankline = 0;
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            15 => {
                y += 1;
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            16 => {
                dst = lastline;
                if (bpp == @as(c_int, 4)) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            17 => {
                skipstart = x;
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            18 => {
                if (x < w) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            19 => {
                srcbuf += @as(usize, @bitCast(@as(isize, @intCast(surface.*.pitch))));
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            20 => {
                if ((x < w) and ((getpix.?(srcbuf + @as(usize, @bitCast(@as(isize, @intCast(x * bpp))))) & rgbmask) == ckey)) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            21 => {
                x += 1;
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            22 => {
                runstart = x;
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            23 => {
                if ((x < w) and ((getpix.?(srcbuf + @as(usize, @bitCast(@as(isize, @intCast(x * bpp))))) & rgbmask) != ckey)) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            24 => {
                x += 1;
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            25 => {
                skip = runstart - skipstart;
                if (skip == w) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            26 => {
                blankline = 1;
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
                run = x - runstart;
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            29 => {
                if (skip > maxn) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            30 => {
                if (bpp == @as(c_int, 4)) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            31 => {
                len = if (run < maxn) run else maxn;
                if (bpp == @as(c_int, 4)) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            32 => {
                @as([*c]Uint16, @ptrCast(@alignCast(dst)))[@as(c_int, 0)] = @bitCast(@as(c_short, @truncate(maxn)));
                @as([*c]Uint16, @ptrCast(@alignCast(dst)))[@as(c_int, 1)] = @bitCast(@as(c_short, @truncate(@as(c_int, 0))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            33 => {
                dst[@as(c_int, 0)] = @bitCast(@as(i8, @truncate(maxn)));
                dst[@as(c_int, 1)] = @bitCast(@as(i8, @truncate(@as(c_int, 0))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            34 => {
                skip -= maxn;
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            35 => {
                @as([*c]Uint16, @ptrCast(@alignCast(dst)))[@as(c_int, 0)] = @bitCast(@as(c_short, @truncate(skip)));
                @as([*c]Uint16, @ptrCast(@alignCast(dst)))[@as(c_int, 1)] = @bitCast(@as(c_short, @truncate(len)));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            36 => {
                dst[@as(c_int, 0)] = @bitCast(@as(i8, @truncate(skip)));
                dst[@as(c_int, 1)] = @bitCast(@as(i8, @truncate(len)));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            37 => {
                _ = memcpy(@ptrCast(@alignCast(dst)), @ptrCast(@alignCast(srcbuf + @as(usize, @bitCast(@as(isize, @intCast(runstart * bpp)))))), @as(usize, @bitCast(@as(c_long, len))) *% @as(usize, @bitCast(@as(c_long, bpp))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(len * bpp))));
                run -= len;
                runstart += len;
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            38 => {
                if (run != 0) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 40;
                    continue;
                }
            },
            39 => {
                len = if (run < maxn) run else maxn;
                if (bpp == @as(c_int, 4)) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            40 => {
                if (!(blankline != 0)) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            41 => {
                @as([*c]Uint16, @ptrCast(@alignCast(dst)))[@as(c_int, 0)] = @bitCast(@as(c_short, @truncate(@as(c_int, 0))));
                @as([*c]Uint16, @ptrCast(@alignCast(dst)))[@as(c_int, 1)] = @bitCast(@as(c_short, @truncate(len)));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            42 => {
                dst[@as(c_int, 0)] = @bitCast(@as(i8, @truncate(@as(c_int, 0))));
                dst[@as(c_int, 1)] = @bitCast(@as(i8, @truncate(len)));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            43 => {
                _ = memcpy(@ptrCast(@alignCast(dst)), @ptrCast(@alignCast(srcbuf + @as(usize, @bitCast(@as(isize, @intCast(runstart * bpp)))))), @as(usize, @bitCast(@as(c_long, len))) *% @as(usize, @bitCast(@as(c_long, bpp))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(len * bpp))));
                runstart += len;
                run -= len;
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            44 => {
                lastline = dst;
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            45 => {
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            46 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            47 => {
                @as([*c]Uint16, @ptrCast(@alignCast(dst)))[@as(c_int, 0)] = @bitCast(@as(c_short, @truncate(@as(c_int, 0))));
                @as([*c]Uint16, @ptrCast(@alignCast(dst)))[@as(c_int, 1)] = @bitCast(@as(c_short, @truncate(@as(c_int, 0))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            48 => {
                dst[@as(c_int, 0)] = @bitCast(@as(i8, @truncate(@as(c_int, 0))));
                dst[@as(c_int, 1)] = @bitCast(@as(i8, @truncate(@as(c_int, 0))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            49 => {
                p = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(rlebuf)), @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(dst) -% @intFromPtr(rlebuf))), @sizeOf(Uint8)))))));
                if (!(p != null)) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            50 => {
                p = rlebuf;
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            51 => {
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            52 => {
                surface.*.map.data = @ptrCast(@alignCast(p));
                return @"true" != 0;
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_RLESurface(surface: [*c]SDL_Surface) bool {
    @setEvalBranchQuota(100000);
    var flags: c_int = undefined;
    _ = &flags;
    if ((surface.*.internal_flags & SDL_INTERNAL_SURFACE_RLEACCEL) != 0) {
        SDL_UnRLESurface(surface);
    }
    if ((if ((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) @as(c_int, 0) else @as(c_int, @bitCast((surface.*.format >> @intCast(@as(SDL_PixelFormat, 8))) & @as(SDL_PixelFormat, 255)))) < @as(c_int, 8)) {
        return @"false" != 0;
    }
    if (!(surface.*.pixels != null)) {
        return @"false" != 0;
    }
    flags = surface.*.map.info.flags;
    if ((flags & SDL_COPY_COLORKEY) != 0) {} else if (((flags & SDL_COPY_BLEND) != 0) and (((!((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (((((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED8)) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED16))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)))) and ((((((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_ARGB)) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_RGBA))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_ABGR))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_BGRA)))) or ((!((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (((((((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU8)) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU16))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU32))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF16))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF32)))) and ((((((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_ARGB)) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_RGBA))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_ABGR))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_BGRA)))))) {} else {
        return @"false" != 0;
    }
    if (((((flags & SDL_COPY_MODULATE_COLOR) != 0) or (((flags & SDL_COPY_MODULATE_ALPHA) != 0) and (((!((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (((((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED8)) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED16))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)))) and ((((((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_ARGB)) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_RGBA))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_ABGR))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_BGRA)))) or ((!((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (((((((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU8)) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU16))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU32))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF16))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF32)))) and ((((((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_ARGB)) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_RGBA))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_ABGR))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_BGRA))))))) or ((flags & ((((SDL_COPY_BLEND_PREMULTIPLIED | SDL_COPY_ADD) | SDL_COPY_ADD_PREMULTIPLIED) | SDL_COPY_MOD) | SDL_COPY_MUL)) != 0)) or ((flags & SDL_COPY_NEAREST) != 0)) {
        return @"false" != 0;
    }
    if (!(((!((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (((((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED8)) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED16))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)))) and ((((((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_ARGB)) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_RGBA))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_ABGR))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_BGRA)))) or ((!((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (((((((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU8)) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU16))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU32))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF16))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF32)))) and ((((((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_ARGB)) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_RGBA))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_ABGR))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_BGRA))))) or !((flags & SDL_COPY_BLEND) != 0)) {
        if (!(surface.*.map.identity != 0)) {
            return @"false" != 0;
        }
        if (!RLEColorkeySurface(surface)) {
            return @"false" != 0;
        }
        surface.*.map.blit = SDL_RLEBlit;
        surface.*.map.info.flags |= SDL_COPY_RLE_COLORKEY;
    } else {
        if (!RLEAlphaSurface(surface)) {
            return @"false" != 0;
        }
        surface.*.map.blit = SDL_RLEAlphaBlit;
        surface.*.map.info.flags |= SDL_COPY_RLE_ALPHAKEY;
    }
    if (!((surface.*.flags & SDL_SURFACE_PREALLOCATED) != 0)) {
        surface.*.saved_pixels = surface.*.pixels;
        surface.*.pixels = null;
    }
    surface.*.internal_flags |= SDL_INTERNAL_SURFACE_RLEACCEL;
    SDL_UpdateSurfaceLockFlag(surface);
    return @"true" != 0;
}
pub export fn SDL_UnRLESurface(surface: [*c]SDL_Surface) void {
    @setEvalBranchQuota(100000);
    if ((surface.*.internal_flags & SDL_INTERNAL_SURFACE_RLEACCEL) != 0) {
        surface.*.internal_flags &= ~SDL_INTERNAL_SURFACE_RLEACCEL;
        surface.*.map.info.flags &= ~(SDL_COPY_RLE_COLORKEY | SDL_COPY_RLE_ALPHAKEY);
        if (!((surface.*.flags & SDL_SURFACE_PREALLOCATED) != 0)) {
            surface.*.pixels = surface.*.saved_pixels;
            surface.*.saved_pixels = null;
        }
        SDL_free_REAL(surface.*.map.data);
        surface.*.map.data = null;
        SDL_InvalidateMap(&surface.*.map);
        SDL_UpdateSurfaceLockFlag(surface);
    }
}

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_SURFACE_PREALLOCATED = @as(c_uint, 0x00000001);
pub const SDL_SURFACE_LOCK_NEEDED = @as(c_uint, 0x00000002);
pub const SDL_COPY_MODULATE_COLOR = @as(c_int, 0x00000001);
pub const SDL_COPY_MODULATE_ALPHA = @as(c_int, 0x00000002);
pub const SDL_COPY_BLEND = @as(c_int, 0x00000010);
pub const SDL_COPY_BLEND_PREMULTIPLIED = @as(c_int, 0x00000020);
pub const SDL_COPY_ADD = @as(c_int, 0x00000040);
pub const SDL_COPY_ADD_PREMULTIPLIED = @as(c_int, 0x00000080);
pub const SDL_COPY_MOD = @as(c_int, 0x00000100);
pub const SDL_COPY_MUL = @as(c_int, 0x00000200);
pub const SDL_COPY_COLORKEY = @as(c_int, 0x00000400);
pub const SDL_COPY_NEAREST = @as(c_int, 0x00000800);
pub const SDL_COPY_RLE_COLORKEY = @as(c_int, 0x00002000);
pub const SDL_COPY_RLE_ALPHAKEY = @as(c_int, 0x00004000);
pub const SDL_INTERNAL_SURFACE_RLEACCEL = @as(c_uint, 0x00000004);
pub inline fn ISOPAQUE(pixel: anytype, fmt: anytype) @TypeOf(((pixel & fmt.*.Amask) >> fmt.*.Ashift) == @as(c_int, 255)) {
    @setEvalBranchQuota(100000);
    _ = &pixel;
    _ = &fmt;
    return ((pixel & fmt.*.Amask) >> fmt.*.Ashift) == @as(c_int, 255);
}
