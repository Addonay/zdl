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
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_realloc_REAL(mem: ?*anyopaque, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_strlen_REAL(str: [*c]const u8) usize;
pub extern fn SDL_strlcat_REAL(dst: [*c]u8, src: [*c]const u8, maxlen: usize) usize;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_snprintf_REAL(text: [*c]u8, maxlen: usize, fmt: [*c]const u8, ...) c_int;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const struct_SDL_DialogFileFilter = extern struct {
    name: [*c]const u8 = null,
    pattern: [*c]const u8 = null,
};
pub const SDL_DialogFileFilter = struct_SDL_DialogFileFilter;
pub const NameTransform = ?*const fn (name: [*c]const u8) callconv(.c) [*c]u8;
pub export fn convert_filters(filters: [*c]const SDL_DialogFileFilter, nfilters: c_int, ntf: NameTransform, prefix: [*c]const u8, separator: [*c]const u8, suffix: [*c]const u8, filt_prefix: [*c]const u8, filt_separator: [*c]const u8, filt_suffix: [*c]const u8, ext_prefix: [*c]const u8, ext_separator: [*c]const u8, ext_suffix: [*c]const u8, anycase: bool) [*c]u8 {
    @setEvalBranchQuota(100000);
    var combined: [*c]u8 = undefined;
    _ = &combined;
    var new_combined: [*c]u8 = undefined;
    _ = &new_combined;
    var converted: [*c]u8 = undefined;
    _ = &converted;
    var terminator: [*c]const u8 = undefined;
    _ = &terminator;
    var new_length: usize = undefined;
    _ = &new_length;
    var i: c_int = undefined;
    _ = &i;
    if (!(filters != null)) {
        _ = SDL_SetError_REAL("Called convert_filters() with NULL filters (SDL bug)");
        return null;
    }
    combined = SDL_strdup_REAL(prefix);
    if (!(combined != null)) {
        return null;
    }
    {
        i = 0;
        while (i < nfilters) : (i += 1) {
            var f: [*c]const SDL_DialogFileFilter = &filters[@bitCast(@as(isize, @intCast(i)))];
            _ = &f;
            converted = convert_filter(f.*, ntf, filt_prefix, filt_separator, filt_suffix, ext_prefix, ext_separator, ext_suffix, anycase);
            if (!(converted != null)) {
                SDL_free_REAL(@ptrCast(@alignCast(combined)));
                return null;
            }
            terminator = if ((i + @as(c_int, 1)) < nfilters) separator else suffix;
            new_length = ((SDL_strlen_REAL(combined) +% SDL_strlen_REAL(converted)) +% SDL_strlen_REAL(terminator)) +% @as(usize, 1);
            new_combined = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(combined)), new_length)));
            if (!(new_combined != null)) {
                SDL_free_REAL(@ptrCast(@alignCast(converted)));
                SDL_free_REAL(@ptrCast(@alignCast(combined)));
                return null;
            }
            combined = new_combined;
            _ = SDL_strlcat_REAL(combined, converted, new_length);
            _ = SDL_strlcat_REAL(combined, terminator, new_length);
            SDL_free_REAL(@ptrCast(@alignCast(converted)));
        }
    }
    new_length = (SDL_strlen_REAL(combined) +% SDL_strlen_REAL(suffix)) +% @as(usize, 1);
    new_combined = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(combined)), new_length)));
    if (!(new_combined != null)) {
        SDL_free_REAL(@ptrCast(@alignCast(combined)));
        return null;
    }
    combined = new_combined;
    _ = SDL_strlcat_REAL(combined, suffix, new_length);
    return combined;
}
pub export fn convert_filter(filter: SDL_DialogFileFilter, ntf: NameTransform, prefix: [*c]const u8, separator: [*c]const u8, suffix: [*c]const u8, ext_prefix: [*c]const u8, ext_separator: [*c]const u8, ext_suffix: [*c]const u8, anycase: bool) [*c]u8 {
    @setEvalBranchQuota(100000);
    var converted: [*c]u8 = undefined;
    _ = &converted;
    var name_filtered: [*c]u8 = undefined;
    _ = &name_filtered;
    var total_length: usize = undefined;
    _ = &total_length;
    var list: [*c]u8 = undefined;
    _ = &list;
    list = convert_ext_list(filter.pattern, ext_prefix, ext_separator, ext_suffix, anycase);
    if (!(list != null)) {
        return null;
    }
    if (ntf != null) {
        name_filtered = ntf.?(filter.name);
    } else {
        name_filtered = SDL_strdup_REAL(filter.name);
    }
    if (!(name_filtered != null)) {
        SDL_free_REAL(@ptrCast(@alignCast(list)));
        return null;
    }
    total_length = ((((SDL_strlen_REAL(prefix) +% SDL_strlen_REAL(name_filtered)) +% SDL_strlen_REAL(separator)) +% SDL_strlen_REAL(list)) +% SDL_strlen_REAL(suffix)) +% @as(usize, 1);
    converted = @ptrCast(@alignCast(SDL_malloc_REAL(total_length)));
    if (!(converted != null)) {
        SDL_free_REAL(@ptrCast(@alignCast(list)));
        SDL_free_REAL(@ptrCast(@alignCast(name_filtered)));
        return null;
    }
    _ = SDL_snprintf_REAL(converted, total_length, "%s%s%s%s%s", prefix, name_filtered, separator, list, suffix);
    SDL_free_REAL(@ptrCast(@alignCast(list)));
    SDL_free_REAL(@ptrCast(@alignCast(name_filtered)));
    return converted;
}
pub export fn convert_ext_list(list: [*c]const u8, prefix: [*c]const u8, separator: [*c]const u8, suffix: [*c]const u8, anycase: bool) [*c]u8 {
    @setEvalBranchQuota(100000);
    var converted: [*c]u8 = undefined;
    _ = &converted;
    var semicolons: c_int = undefined;
    _ = &semicolons;
    var total_length: usize = undefined;
    _ = &total_length;
    semicolons = 0;
    {
        var c: [*c]const u8 = list;
        _ = &c;
        while (@as(c_int, c.*) != 0) : (c += 1) {
            semicolons += @intFromBool(@as(c_int, c.*) == @as(c_int, ';'));
        }
    }
    total_length = (((((SDL_strlen_REAL(list) -% @as(usize, @bitCast(@as(c_long, semicolons)))) *% @as(usize, 4)) +% (@as(usize, @bitCast(@as(c_long, semicolons))) *% SDL_strlen_REAL(separator))) +% SDL_strlen_REAL(prefix)) +% SDL_strlen_REAL(suffix)) +% @as(usize, 1);
    converted = @ptrCast(@alignCast(SDL_malloc_REAL(total_length)));
    if (!(converted != null)) {
        return null;
    }
    converted.* = '\x00';
    _ = SDL_strlcat_REAL(converted, prefix, total_length);
    if (SDL_strcmp_REAL(list, "*") == @as(c_int, 0)) {
        _ = SDL_strlcat_REAL(converted, "*", total_length);
    } else {
        {
            var c: [*c]const u8 = list;
            _ = &c;
            while (@as(c_int, c.*) != 0) : (c += 1) {
                if (anycase and (((@as(c_int, c.*) >= @as(c_int, 'a')) and (@as(c_int, c.*) <= @as(c_int, 'z'))) or ((@as(c_int, c.*) >= @as(c_int, 'A')) and (@as(c_int, c.*) <= @as(c_int, 'Z'))))) {
                    var str: [5]u8 = undefined;
                    _ = &str;
                    str[@as(c_int, 0)] = '[';
                    str[@as(c_int, 1)] = c.*;
                    str[@as(c_int, 2)] = @bitCast(@as(i8, @truncate(@as(c_int, c.*) ^ @as(c_int, 32))));
                    str[@as(c_int, 3)] = ']';
                    str[@as(c_int, 4)] = '\x00';
                    _ = SDL_strlcat_REAL(converted, @ptrCast(@alignCast(&str)), total_length);
                } else if (((((((@as(c_int, c.*) >= @as(c_int, 'a')) and (@as(c_int, c.*) <= @as(c_int, 'z'))) or ((@as(c_int, c.*) >= @as(c_int, 'A')) and (@as(c_int, c.*) <= @as(c_int, 'Z')))) or ((@as(c_int, c.*) >= @as(c_int, '0')) and (@as(c_int, c.*) <= @as(c_int, '9')))) or (@as(c_int, c.*) == @as(c_int, '-'))) or (@as(c_int, c.*) == @as(c_int, '_'))) or (@as(c_int, c.*) == @as(c_int, '.'))) {
                    var str: [2]u8 = undefined;
                    _ = &str;
                    str[@as(c_int, 0)] = c.*;
                    str[@as(c_int, 1)] = '\x00';
                    _ = SDL_strlcat_REAL(converted, @ptrCast(@alignCast(&str)), total_length);
                } else if (@as(c_int, c.*) == @as(c_int, ';')) {
                    if ((c == list) or (@as(c_int, c[@bitCast(@as(isize, @intCast(-@as(c_int, 1))))]) == @as(c_int, ';'))) {
                        _ = SDL_SetError_REAL("Empty pattern not allowed");
                        SDL_free_REAL(@ptrCast(@alignCast(converted)));
                        return null;
                    }
                    _ = SDL_strlcat_REAL(converted, separator, total_length);
                } else {
                    _ = SDL_SetError_REAL("Invalid character '%c' in pattern (Only [a-zA-Z0-9_.-] allowed, or a single *)", c.*);
                    SDL_free_REAL(@ptrCast(@alignCast(converted)));
                    return null;
                }
            }
        }
    }
    if (@as(c_int, list[SDL_strlen_REAL(list) -% @as(usize, 1)]) == @as(c_int, ';')) {
        _ = SDL_SetError_REAL("Empty pattern not allowed");
        SDL_free_REAL(@ptrCast(@alignCast(converted)));
        return null;
    }
    _ = SDL_strlcat_REAL(converted, suffix, total_length);
    return converted;
}
pub export fn validate_filters(filters: [*c]const SDL_DialogFileFilter, nfilters: c_int) [*c]const u8 {
    @setEvalBranchQuota(100000);
    if (filters != null) {
        {
            var i: c_int = 0;
            _ = &i;
            while (i < nfilters) : (i += 1) {
                var msg: [*c]const u8 = validate_list(filters[@bitCast(@as(isize, @intCast(i)))].pattern);
                _ = &msg;
                if (msg != null) {
                    return msg;
                }
            }
        }
    }
    return null;
}
pub export fn validate_list(list: [*c]const u8) [*c]const u8 {
    @setEvalBranchQuota(100000);
    if (SDL_strcmp_REAL(list, "*") == @as(c_int, 0)) {
        return null;
    } else {
        {
            var c: [*c]const u8 = list;
            _ = &c;
            while (@as(c_int, c.*) != 0) : (c += 1) {
                if (((((((@as(c_int, c.*) >= @as(c_int, 'a')) and (@as(c_int, c.*) <= @as(c_int, 'z'))) or ((@as(c_int, c.*) >= @as(c_int, 'A')) and (@as(c_int, c.*) <= @as(c_int, 'Z')))) or ((@as(c_int, c.*) >= @as(c_int, '0')) and (@as(c_int, c.*) <= @as(c_int, '9')))) or (@as(c_int, c.*) == @as(c_int, '-'))) or (@as(c_int, c.*) == @as(c_int, '_'))) or (@as(c_int, c.*) == @as(c_int, '.'))) {
                    continue;
                } else if (@as(c_int, c.*) == @as(c_int, ';')) {
                    if ((c == list) or (@as(c_int, c[@bitCast(@as(isize, @intCast(-@as(c_int, 1))))]) == @as(c_int, ';'))) {
                        return "Empty pattern not allowed";
                    }
                } else {
                    return "Invalid character in pattern (Only [a-zA-Z0-9_.-] allowed, or a single *)";
                }
            }
        }
    }
    if (@as(c_int, list[SDL_strlen_REAL(list) -% @as(usize, 1)]) == @as(c_int, ';')) {
        return "Empty pattern not allowed";
    }
    return null;
}

