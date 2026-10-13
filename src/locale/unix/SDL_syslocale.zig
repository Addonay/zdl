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
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_getenv_REAL(name: [*c]const u8) [*c]const u8;
pub extern fn SDL_strlcpy_REAL(dst: [*c]u8, src: [*c]const u8, maxlen: usize) usize;
pub extern fn SDL_strlcat_REAL(dst: [*c]u8, src: [*c]const u8, maxlen: usize) usize;
pub extern fn SDL_strchr_REAL(str: [*c]const u8, c: c_int) [*c]u8;
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
pub fn normalize_locale_str(dst: [*c]u8, str: [*c]u8, buflen: usize) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ptr: [*c]u8 = undefined;
    _ = &ptr;
    ptr = SDL_strchr_REAL(str, '.');
    if (ptr != null) {
        ptr.* = '\x00';
    }
    ptr = SDL_strchr_REAL(str, '@');
    if (ptr != null) {
        ptr.* = '\x00';
    }
    if ((@as(c_int, str[@as(c_int, 0)]) == @as(c_int, 'C')) and (@as(c_int, str[@as(c_int, 1)]) == @as(c_int, '\x00'))) {
        return;
    }
    if (@as(c_int, str.*) != 0) {
        if (@as(c_int, dst.*) != 0) {
            _ = SDL_strlcat_REAL(dst, ",", buflen);
        }
        _ = SDL_strlcat_REAL(dst, str, buflen);
    }
}
pub fn normalize_locales(dst: [*c]u8, arg_src: [*c]u8, buflen: usize) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var src = arg_src;
    _ = &src;
    var ptr: [*c]u8 = undefined;
    _ = &ptr;
    while (@as(?*anyopaque, @ptrCast(@alignCast(blk: {
        const tmp = SDL_strchr_REAL(src, ':');
        ptr = tmp;
        break :blk tmp;
    }))) != @as(?*anyopaque, null)) {
        ptr.* = '\x00';
        normalize_locale_str(dst, src, buflen);
        src = ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
    }
    normalize_locale_str(dst, src, buflen);
}
pub export fn SDL_SYS_GetPreferredLocales(buf: [*c]u8, buflen: usize) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [27:0]u8 = "SDL_SYS_GetPreferredLocales".*;
    };
    _ = &static_local___func__;
    var isstack: bool = undefined;
    _ = &isstack;
    var envr: [*c]const u8 = undefined;
    _ = &envr;
    var tmp: [*c]u8 = undefined;
    _ = &tmp;
    while (true) {
        while (!(buflen > @as(usize, 0))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "buflen > 0",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_syslocale.c", 72);
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
    tmp = blk: {
        (&isstack).* = (@sizeOf(u8) *% buflen) < @as(c_ulong, SDL_MAX_SMALL_ALLOC_STACKSIZE);
        break :blk if ((&isstack).*) @as([*c]u8, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(u8) *% buflen)))) else @as([*c]u8, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(u8) *% buflen))));
    };
    if (!(tmp != null)) {
        return @"false" != 0;
    }
    tmp.* = '\x00';
    envr = SDL_getenv_REAL("LANG");
    if (envr != null) {
        _ = SDL_strlcpy_REAL(tmp, envr, buflen);
    }
    envr = SDL_getenv_REAL("LANGUAGE");
    if (envr != null) {
        if (@as(c_int, tmp.*) != 0) {
            _ = SDL_strlcat_REAL(tmp, ":", buflen);
        }
        _ = SDL_strlcat_REAL(tmp, envr, buflen);
    }
    if (@as(c_int, tmp.*) == @as(c_int, '\x00')) {
        _ = SDL_SetError_REAL("LANG environment variable isn't set");
    } else {
        normalize_locales(buf, tmp, buflen);
    }
    if (isstack) {
        SDL_free_REAL(@ptrCast(@alignCast(tmp)));
    } else {
        SDL_free_REAL(@ptrCast(@alignCast(tmp)));
    }
    return @"true" != 0;
}

pub const SDL_MAX_SMALL_ALLOC_STACKSIZE = @as(c_int, 128);
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
