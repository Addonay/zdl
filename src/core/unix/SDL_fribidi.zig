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
pub const __helpers = @import("std").zig.c_translation.helpers;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_strlen_REAL(str: [*c]const u8) usize;
pub extern fn SDL_utf8strnlen_REAL(str: [*c]const u8, bytes: usize) usize;
pub const SDL_FunctionPointer = ?*const fn () callconv(.c) void;
pub const struct_SDL_SharedObject = opaque {
};
pub const SDL_SharedObject = struct_SDL_SharedObject;
pub extern fn SDL_LoadObject_REAL(sofile: [*c]const u8) ?*SDL_SharedObject;
pub extern fn SDL_LoadFunction_REAL(handle: ?*SDL_SharedObject, name: [*c]const u8) SDL_FunctionPointer;
pub extern fn SDL_UnloadObject_REAL(handle: ?*SDL_SharedObject) void;
pub const SDL_ELF_NOTE_DLOPEN = @compileError("unable to translate C expr: unexpected token '__VA_ARGS__'");
// /home/addo/dev/stupid/zdl/.ref/SDL/include/SDL3/SDL_dlopennote.h:212:9
pub const FriBidiChar = u32;
pub const FriBidiStrIndex = c_int;
pub const FriBidiFlags = u32;
pub const FriBidiLevel = i8;
pub const FriBidiCharType = c_uint;
pub const FRIBIDI_PAR_LTR: c_int = 272;
pub const FriBidiParType = c_uint;
pub const FriBidiJoiningType = u8;
pub const FriBidiArabicProp = u8;
pub const FRIBIDI_CHAR_SET_UTF8: c_int = 1;
pub const FriBidiCharSet = c_uint;
pub const SDL_FriBidiUnicodeToCharset = ?*const fn (FriBidiCharSet, [*c]const FriBidiChar, FriBidiStrIndex, [*c]u8) callconv(.c) FriBidiStrIndex;
pub const SDL_FriBidiCharsetToUnicode = ?*const fn (FriBidiCharSet, [*c]const u8, FriBidiStrIndex, [*c]FriBidiChar) callconv(.c) FriBidiStrIndex;
pub const SDL_FriBidiGetBidiTypes = ?*const fn ([*c]const FriBidiChar, FriBidiStrIndex, [*c]FriBidiCharType) callconv(.c) void;
pub const SDL_FriBidiGetParDirection = ?*const fn ([*c]const FriBidiCharType, FriBidiStrIndex) callconv(.c) FriBidiParType;
pub const SDL_FriBidiGetParEmbeddingLevels = ?*const fn ([*c]const FriBidiCharType, FriBidiStrIndex, [*c]FriBidiParType, [*c]FriBidiLevel) callconv(.c) FriBidiLevel;
pub const SDL_FriBidiGetJoiningTypes = ?*const fn ([*c]const FriBidiChar, FriBidiStrIndex, [*c]FriBidiJoiningType) callconv(.c) void;
pub const SDL_FriBidiJoinArabic = ?*const fn ([*c]const FriBidiCharType, FriBidiStrIndex, [*c]const FriBidiLevel, [*c]FriBidiArabicProp) callconv(.c) void;
pub const SDL_FriBidiShape = ?*const fn (flags: FriBidiFlags, [*c]const FriBidiLevel, FriBidiStrIndex, [*c]FriBidiArabicProp, str: [*c]FriBidiChar) callconv(.c) void;
pub const SDL_FriBidiReorderLine = ?*const fn (flags: FriBidiFlags, [*c]const FriBidiCharType, FriBidiStrIndex, FriBidiStrIndex, FriBidiParType, [*c]FriBidiLevel, [*c]FriBidiChar, [*c]FriBidiStrIndex) callconv(.c) FriBidiLevel;
pub const struct_SDL_FriBidi = extern struct {
    lib: ?*SDL_SharedObject = null,
    unicode_to_charset: SDL_FriBidiUnicodeToCharset = null,
    charset_to_unicode: SDL_FriBidiCharsetToUnicode = null,
    get_bidi_types: SDL_FriBidiGetBidiTypes = null,
    get_par_direction: SDL_FriBidiGetParDirection = null,
    get_par_embedding_levels: SDL_FriBidiGetParEmbeddingLevels = null,
    get_joining_types: SDL_FriBidiGetJoiningTypes = null,
    join_arabic: SDL_FriBidiJoinArabic = null,
    shape: SDL_FriBidiShape = null,
    reorder_line: SDL_FriBidiReorderLine = null,
};
pub const SDL_FriBidi = struct_SDL_FriBidi;
pub export fn SDL_FriBidi_Create() [*c]SDL_FriBidi {
    @setEvalBranchQuota(100000);
    var fribidi: [*c]SDL_FriBidi = undefined;
    _ = &fribidi;
    fribidi = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(SDL_FriBidi))));
    if (!(fribidi != null)) {
        return null;
    }
    fribidi.*.lib = SDL_LoadObject_REAL("libfribidi.so.0");
    if (!(fribidi.*.lib != null)) {
        SDL_free_REAL(@ptrCast(@alignCast(fribidi)));
        return null;
    }
    fribidi.*.unicode_to_charset = @as(SDL_FriBidiUnicodeToCharset, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(fribidi.*.lib, "fribidi_unicode_to_charset")))));
    if (!(fribidi.*.unicode_to_charset != null)) {
        SDL_UnloadObject_REAL(fribidi.*.lib);
        SDL_free_REAL(@ptrCast(@alignCast(fribidi)));
        return null;
    }
    fribidi.*.charset_to_unicode = @as(SDL_FriBidiCharsetToUnicode, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(fribidi.*.lib, "fribidi_charset_to_unicode")))));
    if (!(fribidi.*.charset_to_unicode != null)) {
        SDL_UnloadObject_REAL(fribidi.*.lib);
        SDL_free_REAL(@ptrCast(@alignCast(fribidi)));
        return null;
    }
    fribidi.*.get_bidi_types = @as(SDL_FriBidiGetBidiTypes, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(fribidi.*.lib, "fribidi_get_bidi_types")))));
    if (!(fribidi.*.get_bidi_types != null)) {
        SDL_UnloadObject_REAL(fribidi.*.lib);
        SDL_free_REAL(@ptrCast(@alignCast(fribidi)));
        return null;
    }
    fribidi.*.get_par_direction = @as(SDL_FriBidiGetParDirection, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(fribidi.*.lib, "fribidi_get_par_direction")))));
    if (!(fribidi.*.get_par_direction != null)) {
        SDL_UnloadObject_REAL(fribidi.*.lib);
        SDL_free_REAL(@ptrCast(@alignCast(fribidi)));
        return null;
    }
    fribidi.*.get_par_embedding_levels = @as(SDL_FriBidiGetParEmbeddingLevels, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(fribidi.*.lib, "fribidi_get_par_embedding_levels")))));
    if (!(fribidi.*.get_par_embedding_levels != null)) {
        SDL_UnloadObject_REAL(fribidi.*.lib);
        SDL_free_REAL(@ptrCast(@alignCast(fribidi)));
        return null;
    }
    fribidi.*.get_joining_types = @as(SDL_FriBidiGetJoiningTypes, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(fribidi.*.lib, "fribidi_get_joining_types")))));
    if (!(fribidi.*.get_joining_types != null)) {
        SDL_UnloadObject_REAL(fribidi.*.lib);
        SDL_free_REAL(@ptrCast(@alignCast(fribidi)));
        return null;
    }
    fribidi.*.join_arabic = @as(SDL_FriBidiJoinArabic, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(fribidi.*.lib, "fribidi_join_arabic")))));
    if (!(fribidi.*.join_arabic != null)) {
        SDL_UnloadObject_REAL(fribidi.*.lib);
        SDL_free_REAL(@ptrCast(@alignCast(fribidi)));
        return null;
    }
    fribidi.*.shape = @as(SDL_FriBidiShape, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(fribidi.*.lib, "fribidi_shape")))));
    if (!(fribidi.*.shape != null)) {
        SDL_UnloadObject_REAL(fribidi.*.lib);
        SDL_free_REAL(@ptrCast(@alignCast(fribidi)));
        return null;
    }
    fribidi.*.reorder_line = @as(SDL_FriBidiReorderLine, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(fribidi.*.lib, "fribidi_reorder_line")))));
    if (!(fribidi.*.reorder_line != null)) {
        SDL_UnloadObject_REAL(fribidi.*.lib);
        SDL_free_REAL(@ptrCast(@alignCast(fribidi)));
        return null;
    }
    return fribidi;
}
pub export fn SDL_FriBidi_Process(fribidi: [*c]SDL_FriBidi, utf8: [*c]u8, arg_utf8_len: isize, shaping: bool, out_par_type: [*c]FriBidiParType) [*c]u8 {
    @setEvalBranchQuota(100000);
    var utf8_len = arg_utf8_len;
    _ = &utf8_len;
    var types: [*c]FriBidiCharType = undefined;
    _ = &types;
    var levels: [*c]FriBidiLevel = undefined;
    _ = &levels;
    var props: [*c]FriBidiArabicProp = undefined;
    _ = &props;
    var str: [*c]FriBidiChar = undefined;
    _ = &str;
    var result: [*c]u8 = undefined;
    _ = &result;
    var len: FriBidiStrIndex = undefined;
    _ = &len;
    var max_level: FriBidiLevel = undefined;
    _ = &max_level;
    var start: FriBidiStrIndex = undefined;
    _ = &start;
    var end: FriBidiStrIndex = undefined;
    _ = &end;
    var direction: FriBidiParType = undefined;
    _ = &direction;
    var str_direction: FriBidiParType = undefined;
    _ = &str_direction;
    var i: c_uint = undefined;
    _ = &i;
    var c: c_uint = undefined;
    _ = &c;
    if (!(fribidi != null) or !(utf8 != null)) {
        return null;
    }
    if (utf8_len < @as(isize, 0)) {
        utf8_len = @bitCast(@as(c_ulong, @truncate(SDL_strlen_REAL(utf8))));
    }
    str = @ptrCast(@alignCast(SDL_calloc_REAL(SDL_utf8strnlen_REAL(utf8, @bitCast(@as(c_long, utf8_len))), @sizeOf(FriBidiChar))));
    len = fribidi.*.charset_to_unicode.?(FRIBIDI_CHAR_SET_UTF8, utf8, @truncate(utf8_len), str);
    direction = FRIBIDI_PAR_LTR;
    types = null;
    levels = null;
    props = @ptrCast(@alignCast(SDL_calloc_REAL(@bitCast(@as(c_long, len + @as(c_int, 1))), @sizeOf(FriBidiArabicProp))));
    levels = @ptrCast(@alignCast(SDL_calloc_REAL(@bitCast(@as(c_long, len + @as(c_int, 1))), @sizeOf(FriBidiLevel))));
    types = @ptrCast(@alignCast(SDL_calloc_REAL(@bitCast(@as(c_long, len + @as(c_int, 1))), @sizeOf(FriBidiCharType))));
    fribidi.*.get_bidi_types.?(str, len, types);
    str_direction = fribidi.*.get_par_direction.?(types, len);
    max_level = fribidi.*.get_par_embedding_levels.?(types, len, &direction, levels);
    if (shaping) {
        fribidi.*.get_joining_types.?(str, len, props);
        fribidi.*.join_arabic.?(types, len, levels, props);
        fribidi.*.shape.?(@bitCast(@as(c_int, ((FRIBIDI_FLAG_SHAPE_MIRRORING | FRIBIDI_FLAG_REORDER_NSM) | FRIBIDI_FLAG_REMOVE_SPECIALS) | (FRIBIDI_FLAG_SHAPE_ARAB_PRES | FRIBIDI_FLAG_SHAPE_ARAB_LIGA))), levels, len, props, str);
    }
    {
        end = 0;
        start = 0;
        while (end < len) : (end += 1) {
            if (((((str[@bitCast(@as(isize, @intCast(end)))] == @as(FriBidiChar, '\n')) or (str[@bitCast(@as(isize, @intCast(end)))] == @as(FriBidiChar, '\r'))) or (str[@bitCast(@as(isize, @intCast(end)))] == @as(FriBidiChar, '\x0c'))) or (str[@bitCast(@as(isize, @intCast(end)))] == @as(FriBidiChar, '\x0b'))) or (end == (len - @as(c_int, 1)))) {
                max_level = fribidi.*.reorder_line.?(@bitCast(@as(c_int, ((FRIBIDI_FLAG_SHAPE_MIRRORING | FRIBIDI_FLAG_REORDER_NSM) | FRIBIDI_FLAG_REMOVE_SPECIALS) | (FRIBIDI_FLAG_SHAPE_ARAB_PRES | FRIBIDI_FLAG_SHAPE_ARAB_LIGA))), types, (end - start) + @as(c_int, 1), start, direction, levels, str, null);
                start = end + @as(c_int, 1);
            }
        }
    }
    _ = &max_level;
    {
        i = 0;
        c = 0;
        while (i < @as(c_uint, @bitCast(@as(c_int, len)))) : (i +%= 1) {
            if (str[i] != @as(FriBidiChar, FRIBIDI_CHAR_ZWNBSP)) {
                str[
                    blk: {
                        const ref = &c;
                        const tmp = ref.*;
                        ref.* +%= 1;
                        break :blk tmp;
                    }
                ] = str[i];
            }
        }
    }
    len = @bitCast(@as(c_uint, @truncate(c)));
    result = @ptrCast(@alignCast(SDL_malloc_REAL(@bitCast(@as(c_long, (len * @as(c_int, 4)) + @as(c_int, 1))))));
    _ = fribidi.*.unicode_to_charset.?(FRIBIDI_CHAR_SET_UTF8, str, len, result);
    SDL_free_REAL(@ptrCast(@alignCast(levels)));
    SDL_free_REAL(@ptrCast(@alignCast(props)));
    SDL_free_REAL(@ptrCast(@alignCast(types)));
    if (out_par_type != null) {
        out_par_type.* = str_direction;
    }
    return result;
}
pub export fn SDL_FriBidi_Destroy(fribidi: [*c]SDL_FriBidi) void {
    @setEvalBranchQuota(100000);
    if (!(fribidi != null)) {
        return;
    }
    SDL_UnloadObject_REAL(fribidi.*.lib);
    SDL_free_REAL(@ptrCast(@alignCast(fribidi)));
}

pub const FRIBIDI_CHAR_ZWNBSP = __helpers.promoteIntLiteral(c_int, 0xFEFF, .hex);
pub const FRIBIDI_FLAG_SHAPE_MIRRORING = @as(c_int, 0x00000001);
pub const FRIBIDI_FLAG_REORDER_NSM = @as(c_int, 0x00000002);
pub const FRIBIDI_FLAG_SHAPE_ARAB_PRES = @as(c_int, 0x00000100);
pub const FRIBIDI_FLAG_SHAPE_ARAB_LIGA = @as(c_int, 0x00000200);
pub const FRIBIDI_FLAG_REMOVE_SPECIALS = __helpers.promoteIntLiteral(c_int, 0x00040000, .hex);
