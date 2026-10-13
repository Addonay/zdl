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
pub const __mode_t = c_uint;
pub const __off_t = c_long;
pub const __pid_t = c_int;
pub const struct__IO_FILE = opaque {
};
pub const FILE = struct__IO_FILE;
pub extern fn fclose(__stream: ?*FILE) c_int;
pub extern fn fopen(noalias __filename: [*c]const u8, noalias __modes: [*c]const u8) ?*FILE;
pub extern fn fgets(noalias __s: [*c]u8, __n: c_int, noalias __stream: ?*FILE) [*c]u8;
pub extern fn memmove(__dest: ?*anyopaque, __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn strerror(__errnum: c_int) [*c]u8;
pub const Uint32 = u32;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_realloc_REAL(mem: ?*anyopaque, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_getenv_REAL(name: [*c]const u8) [*c]const u8;
pub extern fn SDL_strlen_REAL(str: [*c]const u8) usize;
pub extern fn SDL_strlcpy_REAL(dst: [*c]u8, src: [*c]const u8, maxlen: usize) usize;
pub extern fn SDL_strlcat_REAL(dst: [*c]u8, src: [*c]const u8, maxlen: usize) usize;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_strrchr_REAL(str: [*c]const u8, c: c_int) [*c]u8;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_strncmp_REAL(str1: [*c]const u8, str2: [*c]const u8, maxlen: usize) c_int;
pub extern fn SDL_snprintf_REAL(text: [*c]u8, maxlen: usize, fmt: [*c]const u8, ...) c_int;
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
pub const SDL_PropertiesID = Uint32;
pub extern fn SDL_GetGlobalProperties_REAL() SDL_PropertiesID;
pub extern fn SDL_GetStringProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: [*c]const u8) [*c]const u8;
pub const SDL_FOLDER_HOME: c_int = 0;
pub const SDL_FOLDER_DESKTOP: c_int = 1;
pub const SDL_FOLDER_DOCUMENTS: c_int = 2;
pub const SDL_FOLDER_DOWNLOADS: c_int = 3;
pub const SDL_FOLDER_MUSIC: c_int = 4;
pub const SDL_FOLDER_PICTURES: c_int = 5;
pub const SDL_FOLDER_PUBLICSHARE: c_int = 6;
pub const SDL_FOLDER_SAVEDGAMES: c_int = 7;
pub const SDL_FOLDER_SCREENSHOTS: c_int = 8;
pub const SDL_FOLDER_TEMPLATES: c_int = 9;
pub const SDL_FOLDER_VIDEOS: c_int = 10;
pub const enum_SDL_Folder = c_uint;
pub const SDL_Folder = enum_SDL_Folder;
pub extern fn SDL_IsUbuntuTouch_REAL() bool;
pub extern fn mkdir(__path: [*c]const u8, __mode: __mode_t) c_int;
pub extern fn __errno_location() [*c]c_int;
pub extern fn access(__name: [*c]const u8, __type: c_int) c_int;
pub extern fn getpid() __pid_t;
pub extern fn readlink(noalias __path: [*c]const u8, noalias __buf: [*c]u8, __len: usize) isize;
pub extern fn truncate(__file: [*c]const u8, __length: __off_t) c_int;
pub fn readSymLink(path: [*c]const u8) callconv(.c) [*c]u8 {
    @setEvalBranchQuota(100000);
    var result: [*c]u8 = null;
    _ = &result;
    var len: isize = 64;
    _ = &len;
    var rc: isize = -@as(c_int, 1);
    _ = &rc;
    while (true) {
        var ptr: [*c]u8 = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(result)), @bitCast(@as(c_long, len)))));
        _ = &ptr;
        if (!(ptr != null)) {
            break;
        }
        result = ptr;
        rc = readlink(path, result, @bitCast(@as(c_long, len)));
        if (rc == @as(isize, -@as(c_int, 1))) {
            break;
        } else if (rc < len) {
            result[@bitCast(@as(isize, @intCast(rc)))] = '\x00';
            return result;
        }
        len *= 2;
    }
    SDL_free_REAL(@ptrCast(@alignCast(result)));
    return null;
}
pub fn GetExePath() callconv(.c) [*c]u8 {
    @setEvalBranchQuota(100000);
    var result: [*c]u8 = null;
    _ = &result;
    if (!(result != null) and (access("/proc", F_OK) == @as(c_int, 0))) {
        result = readSymLink("/proc/self/exe");
        if (!(result != null)) {
            var path: [64]u8 = undefined;
            _ = &path;
            const rc: c_int = SDL_snprintf_REAL(@ptrCast(@alignCast(&path)), @sizeOf(@TypeOf(path)), "/proc/%llu/exe", @as(c_ulonglong, @bitCast(@as(c_longlong, getpid()))));
            _ = &rc;
            if ((rc > @as(c_int, 0)) and (@as(c_ulong, @bitCast(@as(c_long, rc))) < @sizeOf(@TypeOf(path)))) {
                result = readSymLink(@ptrCast(@alignCast(&path)));
            }
        }
    }
    return result;
}
pub export fn SDL_SYS_GetBasePath() [*c]u8 {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [19:0]u8 = "SDL_SYS_GetBasePath".*;
    };
    _ = &static_local___func__;
    var path: [*c]u8 = GetExePath();
    _ = &path;
    if (!(path != null)) {
        return null;
    }
    var ptr: [*c]u8 = SDL_strrchr_REAL(path, '/');
    _ = &ptr;
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(ptr))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "ptr != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_sysfilesystem.c", 268);
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
    ptr[@as(c_int, 1)] = '\x00';
    ptr = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(path)), @as(usize, @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(ptr) -% @intFromPtr(path))), @sizeOf(u8))))) +% @as(usize, 2))));
    return if (ptr != null) ptr else path;
}
pub export fn SDL_SYS_GetExeName() [*c]u8 {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [18:0]u8 = "SDL_SYS_GetExeName".*;
    };
    _ = &static_local___func__;
    var path: [*c]u8 = GetExePath();
    _ = &path;
    if (!(path != null)) {
        return null;
    }
    var ptr: [*c]u8 = SDL_strrchr_REAL(path, '/');
    _ = &ptr;
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(ptr))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "ptr != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_sysfilesystem.c", 285);
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
    const slen: usize = SDL_strlen_REAL(ptr);
    _ = &slen;
    _ = memmove(@ptrCast(@alignCast(path)), @ptrCast(@alignCast(ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1))))))), slen);
    ptr = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(path)), slen)));
    return if (ptr != null) ptr else path;
}
pub export fn SDL_SYS_GetPrefPath(arg_org: [*c]const u8, arg_app: [*c]const u8) [*c]u8 {
    @setEvalBranchQuota(100000);
    var org = arg_org;
    _ = &org;
    var app = arg_app;
    _ = &app;
    var envr: [*c]const u8 = undefined;
    _ = &envr;
    var prepend: [*c]const u8 = undefined;
    _ = &prepend;
    var result: [*c]u8 = undefined;
    _ = &result;
    var ptr: [*c]u8 = undefined;
    _ = &ptr;
    var props: SDL_PropertiesID = undefined;
    _ = &props;
    var appid: [*c]const u8 = undefined;
    _ = &appid;
    var len: usize = undefined;
    _ = &len;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                envr = SDL_getenv_REAL("XDG_DATA_HOME");
                result = null;
                ptr = null;
                if (SDL_IsUbuntuTouch_REAL()) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                _ = SDL_SetError_REAL("Couldn't create directory '%s': '%s'", result, strerror(__errno_location().*));
                SDL_free_REAL(@ptrCast(@alignCast(result)));
                return null;
            },
            2 => {
                props = SDL_GetGlobalProperties_REAL();
                if (!(props != 0)) {
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
                if (!(envr != null)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            5 => {
                return null;
            },
            6 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                appid = SDL_GetStringProperty_REAL(props, "SDL.system.ubuntu_touch.appid", null);
                if (!(appid != null)) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                _ = SDL_SetError_REAL("Ubuntu Touch App ID missing from global properties");
                return null;
            },
            9 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                app = appid;
                org = "";
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            11 => {
                envr = SDL_getenv_REAL("HOME");
                if (!(envr != null)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            12 => {
                prepend = "/";
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                len = SDL_strlen_REAL(envr);
                if (@as(c_int, envr[len -% @as(usize, 1)]) == @as(c_int, '/')) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            14 => {
                _ = SDL_SetError_REAL("neither XDG_DATA_HOME nor HOME environment is set");
                return null;
            },
            15 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                prepend = "/.local/share/";
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            17 => {
                prepend += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
                {
                    sdl_pc = 19;
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
                len +%= ((SDL_strlen_REAL(prepend) +% SDL_strlen_REAL(org)) +% SDL_strlen_REAL(app)) +% @as(usize, 3);
                result = @ptrCast(@alignCast(SDL_malloc_REAL(len)));
                if (!(result != null)) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                return null;
            },
            21 => {
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            22 => {
                if (@as(c_int, org.*) != 0) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                _ = SDL_snprintf_REAL(result, len, "%s%s%s/%s/", envr, prepend, org, app);
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            24 => {
                _ = SDL_snprintf_REAL(result, len, "%s%s%s/", envr, prepend, app);
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            25 => {
                ptr = result + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            26 => {
                if (@as(c_int, ptr.*) != 0) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 29;
                    continue;
                }
            },
            27 => {
                if (@as(c_int, ptr.*) == @as(c_int, '/')) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            28 => {
                ptr += 1;
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            29 => {
                if ((mkdir(result, 448) != @as(c_int, 0)) and (__errno_location().* != EEXIST)) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 37;
                    continue;
                }
            },
            30 => {
                ptr.* = '\x00';
                if ((mkdir(result, 448) != @as(c_int, 0)) and (__errno_location().* != EEXIST)) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 34;
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
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            33 => {
                {
                    sdl_pc = 1;
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
                ptr.* = '/';
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            36 => {
                {
                    sdl_pc = 1;
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
                return result;
            },
            else => unreachable,
        }
    }
}
pub fn xdg_user_dir_lookup_with_fallback(arg_type: [*c]const u8, fallback: [*c]const u8) callconv(.c) [*c]u8 {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var file: ?*FILE = undefined;
    _ = &file;
    var home_dir: [*c]const u8 = undefined;
    _ = &home_dir;
    var config_home: [*c]const u8 = undefined;
    _ = &config_home;
    var config_file: [*c]u8 = undefined;
    _ = &config_file;
    var buffer: [512]u8 = undefined;
    _ = &buffer;
    var user_dir: [*c]u8 = undefined;
    _ = &user_dir;
    var p: [*c]u8 = undefined;
    _ = &p;
    var d: [*c]u8 = undefined;
    _ = &d;
    var len: c_int = undefined;
    _ = &len;
    var relative: c_int = undefined;
    _ = &relative;
    var l: usize = undefined;
    _ = &l;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                home_dir = SDL_getenv_REAL("HOME");
                if (!(home_dir != null)) {
                    sdl_pc = 3;
                    continue;
                } else {
                    sdl_pc = 4;
                    continue;
                }
            },
            1 => {
                _ = fclose(file);
                if (user_dir != null) {
                    sdl_pc = 69;
                    continue;
                } else {
                    sdl_pc = 70;
                    continue;
                }
            },
            2 => {
                if (fallback != null) {
                    sdl_pc = 72;
                    continue;
                } else {
                    sdl_pc = 73;
                    continue;
                }
            },
            3 => {
                {
                    sdl_pc = 2;
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
                config_home = SDL_getenv_REAL("XDG_CONFIG_HOME");
                if (!(config_home != null) or (@as(c_int, config_home[@as(c_int, 0)]) == @as(c_int, 0))) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 7;
                    continue;
                }
            },
            6 => {
                l = (SDL_strlen_REAL(home_dir) +% SDL_strlen_REAL("/.config/user-dirs.dirs")) +% @as(usize, 1);
                config_file = @ptrCast(@alignCast(SDL_malloc_REAL(l)));
                if (!(config_file != null)) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
            },
            7 => {
                l = (SDL_strlen_REAL(config_home) +% SDL_strlen_REAL("/user-dirs.dirs")) +% @as(usize, 1);
                config_file = @ptrCast(@alignCast(SDL_malloc_REAL(l)));
                if (!(config_file != null)) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            8 => {
                file = fopen(config_file, "r");
                SDL_free_REAL(@ptrCast(@alignCast(config_file)));
                if (!(file != null)) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            9 => {
                {
                    sdl_pc = 2;
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
                _ = SDL_strlcpy_REAL(config_file, home_dir, l);
                _ = SDL_strlcat_REAL(config_file, "/.config/user-dirs.dirs", l);
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 2;
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
                _ = SDL_strlcpy_REAL(config_file, config_home, l);
                _ = SDL_strlcat_REAL(config_file, "/user-dirs.dirs", l);
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            15 => {
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            16 => {
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            17 => {
                user_dir = null;
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            18 => {
                if (fgets(@ptrCast(@alignCast(&buffer)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(buffer))))), file) != null) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            19 => {
                len = @bitCast(@as(c_uint, @truncate(SDL_strlen_REAL(@ptrCast(@alignCast(&buffer))))));
                if ((len > @as(c_int, 0)) and (@as(c_int, buffer[@bitCast(@as(isize, @intCast(len - @as(c_int, 1))))]) == @as(c_int, '\n'))) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            20 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            21 => {
                buffer[@bitCast(@as(isize, @intCast(len - @as(c_int, 1))))] = 0;
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
                p = @ptrCast(@alignCast(&buffer));
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            24 => {
                if ((@as(c_int, p.*) == @as(c_int, ' ')) or (@as(c_int, p.*) == @as(c_int, '\t'))) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            25 => {
                p += 1;
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            26 => {
                if (SDL_strncmp_REAL(p, "XDG_", 4) != @as(c_int, 0)) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            27 => {
                {
                    sdl_pc = 18;
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
                p += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                if (SDL_strncmp_REAL(p, @"type", SDL_strlen_REAL(@"type")) != @as(c_int, 0)) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            30 => {
                {
                    sdl_pc = 18;
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
                p += SDL_strlen_REAL(@"type");
                if (SDL_strncmp_REAL(p, "_DIR", 4) != @as(c_int, 0)) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 34;
                    continue;
                }
            },
            33 => {
                {
                    sdl_pc = 18;
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
                p += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            36 => {
                if ((@as(c_int, p.*) == @as(c_int, ' ')) or (@as(c_int, p.*) == @as(c_int, '\t'))) {
                    sdl_pc = 37;
                    continue;
                } else {
                    sdl_pc = 38;
                    continue;
                }
            },
            37 => {
                p += 1;
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            38 => {
                if (@as(c_int, p.*) != @as(c_int, '=')) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 40;
                    continue;
                }
            },
            39 => {
                {
                    sdl_pc = 18;
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
                p += 1;
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            42 => {
                if ((@as(c_int, p.*) == @as(c_int, ' ')) or (@as(c_int, p.*) == @as(c_int, '\t'))) {
                    sdl_pc = 43;
                    continue;
                } else {
                    sdl_pc = 44;
                    continue;
                }
            },
            43 => {
                p += 1;
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            44 => {
                if (@as(c_int, p.*) != @as(c_int, '"')) {
                    sdl_pc = 45;
                    continue;
                } else {
                    sdl_pc = 46;
                    continue;
                }
            },
            45 => {
                {
                    sdl_pc = 18;
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
                p += 1;
                relative = 0;
                if (SDL_strncmp_REAL(p, "$HOME/", 6) == @as(c_int, 0)) {
                    sdl_pc = 48;
                    continue;
                } else {
                    sdl_pc = 49;
                    continue;
                }
            },
            48 => {
                p += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 6)))));
                relative = 1;
                {
                    sdl_pc = 50;
                    continue;
                }
            },
            49 => {
                if (@as(c_int, p.*) != @as(c_int, '/')) {
                    sdl_pc = 51;
                    continue;
                } else {
                    sdl_pc = 52;
                    continue;
                }
            },
            50 => {
                SDL_free_REAL(@ptrCast(@alignCast(user_dir)));
                if (relative != 0) {
                    sdl_pc = 54;
                    continue;
                } else {
                    sdl_pc = 55;
                    continue;
                }
            },
            51 => {
                {
                    sdl_pc = 18;
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
                l = ((SDL_strlen_REAL(home_dir) +% @as(usize, 1)) +% SDL_strlen_REAL(p)) +% @as(usize, 1);
                user_dir = @ptrCast(@alignCast(SDL_malloc_REAL(l)));
                if (!(user_dir != null)) {
                    sdl_pc = 57;
                    continue;
                } else {
                    sdl_pc = 58;
                    continue;
                }
            },
            55 => {
                user_dir = @ptrCast(@alignCast(SDL_malloc_REAL(SDL_strlen_REAL(p) +% @as(usize, 1))));
                if (!(user_dir != null)) {
                    sdl_pc = 60;
                    continue;
                } else {
                    sdl_pc = 61;
                    continue;
                }
            },
            56 => {
                d = user_dir + SDL_strlen_REAL(user_dir);
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            57 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            58 => {
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            59 => {
                _ = SDL_strlcpy_REAL(user_dir, home_dir, l);
                _ = SDL_strlcat_REAL(user_dir, "/", l);
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            60 => {
                {
                    sdl_pc = 1;
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
                user_dir.* = 0;
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            63 => {
                if ((@as(c_int, p.*) != 0) and (@as(c_int, p.*) != @as(c_int, '"'))) {
                    sdl_pc = 64;
                    continue;
                } else {
                    sdl_pc = 65;
                    continue;
                }
            },
            64 => {
                if ((@as(c_int, p.*) == @as(c_int, '\\')) and (@as(c_int, (p + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))))).*) != @as(c_int, 0))) {
                    sdl_pc = 66;
                    continue;
                } else {
                    sdl_pc = 67;
                    continue;
                }
            },
            65 => {
                d.* = 0;
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            66 => {
                p += 1;
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
                (blk: {
                    const ref = &d;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = (blk: {
                    const ref = &p;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            69 => {
                return user_dir;
            },
            70 => {
                {
                    sdl_pc = 71;
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
                return SDL_strdup_REAL(fallback);
            },
            73 => {
                {
                    sdl_pc = 74;
                    continue;
                }
            },
            74 => {
                return null;
            },
            else => unreachable,
        }
    }
}
pub fn xdg_user_dir_lookup(arg_type: [*c]const u8) callconv(.c) [*c]u8 {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var home_dir: [*c]const u8 = undefined;
    _ = &home_dir;
    var dir: [*c]u8 = undefined;
    _ = &dir;
    var user_dir: [*c]u8 = undefined;
    _ = &user_dir;
    dir = xdg_user_dir_lookup_with_fallback(@"type", null);
    if (dir != null) return dir;
    home_dir = SDL_getenv_REAL("HOME");
    if (!(home_dir != null)) return null;
    if (SDL_strcmp_REAL(@"type", "DESKTOP") == @as(c_int, 0)) {
        var length: usize = (SDL_strlen_REAL(home_dir) +% SDL_strlen_REAL("/Desktop")) +% @as(usize, 1);
        _ = &length;
        user_dir = @ptrCast(@alignCast(SDL_malloc_REAL(length)));
        if (!(user_dir != null)) return null;
        _ = SDL_strlcpy_REAL(user_dir, home_dir, length);
        _ = SDL_strlcat_REAL(user_dir, "/Desktop", length);
        return user_dir;
    }
    return null;
}
pub export fn SDL_SYS_GetUserFolder(folder: SDL_Folder) [*c]u8 {
    @setEvalBranchQuota(100000);
    var param: [*c]const u8 = undefined;
    _ = &param;
    var result: [*c]u8 = undefined;
    _ = &result;
    var newresult: [*c]u8 = undefined;
    _ = &newresult;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                param = null;
                switch (folder) {
                    @as(SDL_Folder, SDL_FOLDER_HOME) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SDL_Folder, SDL_FOLDER_DESKTOP) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(SDL_Folder, SDL_FOLDER_DOCUMENTS) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(SDL_Folder, SDL_FOLDER_DOWNLOADS) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(SDL_Folder, SDL_FOLDER_MUSIC) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(SDL_Folder, SDL_FOLDER_PICTURES) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(SDL_Folder, SDL_FOLDER_PUBLICSHARE) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(SDL_Folder, SDL_FOLDER_SAVEDGAMES) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(SDL_Folder, SDL_FOLDER_SCREENSHOTS) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(SDL_Folder, SDL_FOLDER_TEMPLATES) => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(SDL_Folder, SDL_FOLDER_VIDEOS) => {
                        sdl_pc = 16;
                        continue;
                    },
                    else => {
                        sdl_pc = 17;
                        continue;
                    },
                }
            },
            1 => {
                newresult = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(result)), SDL_strlen_REAL(result) +% @as(usize, 2))));
                if (!(newresult != null)) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            2 => {
                if (!(param != null)) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            3 => {
                param = SDL_getenv_REAL("HOME");
                if (!(param != null)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                _ = SDL_SetError_REAL("No $HOME environment variable available");
                return null;
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                result = SDL_strdup_REAL(param);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            7 => {
                param = "DESKTOP";
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            8 => {
                param = "DOCUMENTS";
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            9 => {
                param = "DOWNLOAD";
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            10 => {
                param = "MUSIC";
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            11 => {
                param = "PICTURES";
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            12 => {
                param = "PUBLICSHARE";
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            13 => {
                _ = SDL_SetError_REAL("Saved Games folder unavailable on XDG");
                return null;
            },
            14 => {
                _ = SDL_SetError_REAL("Screenshots folder unavailable on XDG");
                return null;
            },
            15 => {
                param = "TEMPLATES";
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            16 => {
                param = "VIDEOS";
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            17 => {
                _ = SDL_SetError_REAL("Invalid SDL_Folder: %d", @as(c_int, @bitCast(folder)));
                return null;
            },
            18 => {
                _ = SDL_SetError_REAL("No corresponding XDG user directory");
                return null;
            },
            19 => {
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            20 => {
                result = xdg_user_dir_lookup(param);
                if (!(result != null)) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            21 => {
                _ = SDL_SetError_REAL("XDG directory not available");
                return null;
            },
            22 => {
                {
                    sdl_pc = 23;
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
                SDL_free_REAL(@ptrCast(@alignCast(result)));
                return null;
            },
            25 => {
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            26 => {
                result = newresult;
                _ = SDL_strlcat_REAL(result, "/", SDL_strlen_REAL(result) +% @as(usize, 2));
                return result;
            },
            else => unreachable,
        }
    }
}

pub const @"false" = @as(c_int, 0);
pub const EEXIST = @as(c_int, 17);
pub const F_OK = @as(c_int, 0);
