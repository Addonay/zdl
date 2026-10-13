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
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_isspace_REAL(x: c_int) c_int;
pub extern fn SDL_strlcpy_REAL(dst: [*c]u8, src: [*c]const u8, maxlen: usize) usize;
pub extern fn SDL_GetHint_REAL(name: [*c]const u8) [*c]const u8;
pub const struct_SDL_Locale = extern struct {
    language: [*c]const u8 = null,
    country: [*c]const u8 = null,
};
pub const SDL_Locale = struct_SDL_Locale;
pub extern fn SDL_SYS_GetPreferredLocales(buf: [*c]u8, buflen: usize) bool;
pub fn build_locales_from_csv_string(arg_csv: [*c]u8, count: [*c]c_int) callconv(.c) [*c][*c]SDL_Locale {
    @setEvalBranchQuota(100000);
    var csv = arg_csv;
    _ = &csv;
    var i: c_int = undefined;
    _ = &i;
    var num_locales: c_int = undefined;
    _ = &num_locales;
    var slen: usize = undefined;
    _ = &slen;
    var alloclen: usize = undefined;
    _ = &alloclen;
    var ptr: [*c]u8 = undefined;
    _ = &ptr;
    var loc: [*c]SDL_Locale = undefined;
    _ = &loc;
    var result: [*c][*c]SDL_Locale = undefined;
    _ = &result;
    if (count != null) {
        count.* = 0;
    }
    while (((csv != null) and (@as(c_int, csv.*) != 0)) and (SDL_isspace_REAL(csv.*) != 0)) {
        csv += 1;
    }
    if (!(csv != null) or !(@as(c_int, csv.*) != 0)) {
        return null;
    }
    num_locales = 1;
    {
        ptr = csv;
        while (@as(c_int, ptr.*) != 0) : (ptr += 1) {
            if (@as(c_int, ptr.*) == @as(c_int, ',')) {
                num_locales += 1;
            }
        }
    }
    slen = @as(usize, @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(ptr) -% @intFromPtr(csv))), @sizeOf(u8))))) +% @as(usize, 1);
    alloclen = ((@as(c_ulong, @bitCast(@as(c_long, num_locales + @as(c_int, 1)))) *% @sizeOf([*c]SDL_Locale)) +% (@as(c_ulong, @bitCast(@as(c_long, num_locales))) *% @sizeOf(SDL_Locale))) +% slen;
    result = @ptrCast(@alignCast(SDL_calloc_REAL(1, alloclen)));
    if (!(result != null)) {
        return null;
    }
    loc = @ptrCast(@alignCast(result + @as(usize, @bitCast(@as(isize, @intCast(num_locales + @as(c_int, 1)))))));
    ptr = @ptrCast(@alignCast(loc + @as(usize, @bitCast(@as(isize, @intCast(num_locales))))));
    _ = memcpy(@ptrCast(@alignCast(ptr)), @ptrCast(@alignCast(csv)), slen);
    i = 0;
    result[
        @bitCast(@as(isize, @intCast(blk: {
            const ref = &i;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        })))
    ] = loc;
    while (true) {
        while (SDL_isspace_REAL(ptr.*) != 0) {
            ptr += 1;
        }
        if (@as(c_int, ptr.*) == @as(c_int, '\x00')) {
            break;
        }
        loc.*.language = blk: {
            const ref = &ptr;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        };
        while (true) {
            const ch: u8 = ptr.*;
            _ = &ch;
            if (@as(c_int, ch) == @as(c_int, '_')) {
                (blk: {
                    const ref = &ptr;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = '\x00';
                loc.*.country = ptr;
            } else if (SDL_isspace_REAL(ch) != 0) {
                (blk: {
                    const ref = &ptr;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = '\x00';
            } else if (@as(c_int, ch) == @as(c_int, ',')) {
                (blk: {
                    const ref = &ptr;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = '\x00';
                loc += 1;
                result[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &i;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = loc;
                break;
            } else if (@as(c_int, ch) == @as(c_int, '\x00')) {
                break;
            } else {
                ptr += 1;
            }
        }
    }
    if (count != null) {
        count.* = num_locales;
    }
    return result;
}
pub export fn SDL_GetPreferredLocales_REAL(count: [*c]c_int) [*c][*c]SDL_Locale {
    @setEvalBranchQuota(100000);
    var locbuf: [128]u8 = undefined;
    _ = &locbuf;
    var hint: [*c]const u8 = SDL_GetHint_REAL("SDL_PREFERRED_LOCALES");
    _ = &hint;
    if (hint != null) {
        _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&locbuf)), hint, @sizeOf(@TypeOf(locbuf)));
    } else {
        _ = memset(@ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&locbuf))))), 0, @sizeOf(@TypeOf(locbuf)));
        _ = SDL_SYS_GetPreferredLocales(@ptrCast(@alignCast(&locbuf)), @sizeOf(@TypeOf(locbuf)));
    }
    return build_locales_from_csv_string(@ptrCast(@alignCast(&locbuf)), count);
}

pub const SDL_GetPreferredLocales = SDL_GetPreferredLocales_REAL;
