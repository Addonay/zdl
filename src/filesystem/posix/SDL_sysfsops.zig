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
pub const __dev_t = c_ulong;
pub const __uid_t = c_uint;
pub const __gid_t = c_uint;
pub const __ino_t = c_ulong;
pub const __mode_t = c_uint;
pub const __nlink_t = c_ulong;
pub const __off_t = c_long;
pub const __time_t = c_long;
pub const __blksize_t = c_long;
pub const __blkcnt_t = c_long;
pub const __syscall_slong_t = c_long;
pub const struct_timespec = extern struct {
    tv_sec: __time_t = 0,
    tv_nsec: __syscall_slong_t = 0,
};
pub extern fn remove(__filename: [*c]const u8) c_int;
pub extern fn rename(__old: [*c]const u8, __new: [*c]const u8) c_int;
pub extern fn strerror(__errnum: c_int) [*c]u8;
pub const Sint8 = i8;
pub const Uint8 = u8;
pub const Sint16 = i16;
pub const Uint16 = u16;
pub const Sint32 = i32;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub const Uint64 = u64;
pub const SDL_Time = Sint64;
comptime {
    if (!(@sizeOf(bool) == @as(c_ulong, 1))) @compileError("static assertion failed \"sizeof(bool) == 1\"");
}
comptime {
    if (!(@sizeOf(Uint8) == @as(c_ulong, 1))) @compileError("static assertion failed \"sizeof(Uint8) == 1\"");
}
comptime {
    if (!(@sizeOf(Sint8) == @as(c_ulong, 1))) @compileError("static assertion failed \"sizeof(Sint8) == 1\"");
}
comptime {
    if (!(@sizeOf(Uint16) == @as(c_ulong, 2))) @compileError("static assertion failed \"sizeof(Uint16) == 2\"");
}
comptime {
    if (!(@sizeOf(Sint16) == @as(c_ulong, 2))) @compileError("static assertion failed \"sizeof(Sint16) == 2\"");
}
comptime {
    if (!(@sizeOf(Uint32) == @as(c_ulong, 4))) @compileError("static assertion failed \"sizeof(Uint32) == 4\"");
}
comptime {
    if (!(@sizeOf(Sint32) == @as(c_ulong, 4))) @compileError("static assertion failed \"sizeof(Sint32) == 4\"");
}
comptime {
    if (!(@sizeOf(Uint64) == @as(c_ulong, 8))) @compileError("static assertion failed \"sizeof(Uint64) == 8\"");
}
comptime {
    if (!(@sizeOf(Sint64) == @as(c_ulong, 8))) @compileError("static assertion failed \"sizeof(Sint64) == 8\"");
}
comptime {
    if (!(@sizeOf(Uint64) <= @sizeOf(c_ulonglong))) @compileError("static assertion failed \"sizeof(Uint64) <= sizeof(unsigned long long)\"");
}
comptime {
    if (!(@sizeOf(usize) <= @sizeOf(c_ulonglong))) @compileError("static assertion failed \"sizeof(size_t) <= sizeof(unsigned long long)\"");
}
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_realloc_REAL(mem: ?*anyopaque, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_strlen_REAL(str: [*c]const u8) usize;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_asprintf_REAL(strp: [*c][*c]u8, fmt: [*c]const u8, ...) c_int;
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
pub const SDL_IO_STATUS_EOF: c_int = 2;
pub const enum_SDL_IOStatus = c_uint;
pub const SDL_IOStatus = enum_SDL_IOStatus;
pub const struct_SDL_IOStream = opaque {
};
pub const SDL_IOStream = struct_SDL_IOStream;
pub extern fn SDL_IOFromFile_REAL(file: [*c]const u8, mode: [*c]const u8) ?*SDL_IOStream;
pub extern fn SDL_CloseIO_REAL(context: ?*SDL_IOStream) bool;
pub extern fn SDL_GetIOStatus_REAL(context: ?*SDL_IOStream) SDL_IOStatus;
pub extern fn SDL_ReadIO_REAL(context: ?*SDL_IOStream, ptr: ?*anyopaque, size: usize) usize;
pub extern fn SDL_WriteIO_REAL(context: ?*SDL_IOStream, ptr: ?*const anyopaque, size: usize) usize;
pub extern fn SDL_FlushIO_REAL(context: ?*SDL_IOStream) bool;
pub const SDL_PATHTYPE_FILE: c_int = 1;
pub const SDL_PATHTYPE_DIRECTORY: c_int = 2;
pub const SDL_PATHTYPE_OTHER: c_int = 3;
pub const enum_SDL_PathType = c_uint;
pub const SDL_PathType = enum_SDL_PathType;
pub const struct_SDL_PathInfo = extern struct {
    type: SDL_PathType = @import("std").mem.zeroes(SDL_PathType),
    size: Uint64 = 0,
    create_time: SDL_Time = 0,
    modify_time: SDL_Time = 0,
    access_time: SDL_Time = 0,
};
pub const SDL_PathInfo = struct_SDL_PathInfo;
pub const SDL_ENUM_CONTINUE: c_int = 0;
pub const SDL_ENUM_FAILURE: c_int = 2;
pub const enum_SDL_EnumerationResult = c_uint;
pub const SDL_EnumerationResult = enum_SDL_EnumerationResult;
pub const SDL_EnumerateDirectoryCallback = ?*const fn (userdata: ?*anyopaque, dirname: [*c]const u8, fname: [*c]const u8) callconv(.c) SDL_EnumerationResult;
pub extern fn __errno_location() [*c]c_int;
pub const struct_dirent = extern struct {
    d_ino: __ino_t = 0,
    d_off: __off_t = 0,
    d_reclen: c_ushort = 0,
    d_type: u8 = 0,
    d_name: [256]u8 = @import("std").mem.zeroes([256]u8),
};
pub const struct___dirstream = opaque {
};
pub const DIR = struct___dirstream;
pub extern fn closedir(__dirp: ?*DIR) c_int;
pub extern fn opendir(__name: [*c]const u8) ?*DIR;
pub extern fn readdir(__dirp: ?*DIR) [*c]struct_dirent;
pub const struct_stat = extern struct {
    st_dev: __dev_t = 0,
    st_ino: __ino_t = 0,
    st_nlink: __nlink_t = 0,
    st_mode: __mode_t = 0,
    st_uid: __uid_t = 0,
    st_gid: __gid_t = 0,
    __pad0: c_int = 0,
    st_rdev: __dev_t = 0,
    st_size: __off_t = 0,
    st_blksize: __blksize_t = 0,
    st_blocks: __blkcnt_t = 0,
    st_atim: struct_timespec = @import("std").mem.zeroes(struct_timespec),
    st_mtim: struct_timespec = @import("std").mem.zeroes(struct_timespec),
    st_ctim: struct_timespec = @import("std").mem.zeroes(struct_timespec),
    __glibc_reserved: [3]__syscall_slong_t = @import("std").mem.zeroes([3]__syscall_slong_t),
};
pub extern fn stat(noalias __file: [*c]const u8, noalias __buf: [*c]struct_stat) c_int;
pub extern fn mkdir(__path: [*c]const u8, __mode: __mode_t) c_int;
pub extern fn getcwd(__buf: [*c]u8, __size: usize) [*c]u8;
pub extern fn truncate(__file: [*c]const u8, __length: __off_t) c_int;
pub export fn SDL_SYS_EnumerateDirectory(path: [*c]const u8, cb: SDL_EnumerateDirectoryCallback, userdata: ?*anyopaque) bool {
    @setEvalBranchQuota(100000);
    var apath: [*c]u8 = null;
    _ = &apath;
    var pathwithsep: [*c]u8 = null;
    _ = &pathwithsep;
    var pathwithseplen: c_int = SDL_asprintf_REAL(&pathwithsep, "%s%s", if (apath != null) @as([*c]const u8, @ptrCast(@alignCast(apath))) else path, if ((if (apath != null) @as(c_int, apath.*) else @as(c_int, path.*)) != 0) @as([*c]u8, @as([*c]u8, @constCast("/"))) else @as([*c]u8, @as([*c]u8, @constCast(""))));
    _ = &pathwithseplen;
    const extralen: usize = if (apath != null) SDL_strlen_REAL(apath) -% SDL_strlen_REAL(path) else @as(usize, 0);
    _ = &extralen;
    SDL_free_REAL(@ptrCast(@alignCast(apath)));
    if ((pathwithseplen == -@as(c_int, 1)) or !(pathwithsep != null)) {
        return @"false" != 0;
    }
    pathwithseplen -= 1;
    while ((pathwithseplen > @as(c_int, 0)) and (@as(c_int, pathwithsep[@bitCast(@as(isize, @intCast(pathwithseplen - @as(c_int, 1))))]) == @as(c_int, '/'))) {
        pathwithsep[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &pathwithseplen;
                const tmp = ref.*;
                ref.* -= 1;
                break :blk tmp;
            })))
        ] = '\x00';
    }
    var dir: ?*DIR = opendir(pathwithsep);
    _ = &dir;
    if (!(dir != null)) {
        SDL_free_REAL(@ptrCast(@alignCast(pathwithsep)));
        return SDL_SetError_REAL("Can't open directory: %s", strerror(__errno_location().*));
    }
    var result: SDL_EnumerationResult = SDL_ENUM_CONTINUE;
    _ = &result;
    var ent: [*c]struct_dirent = undefined;
    _ = &ent;
    while ((result == @as(SDL_EnumerationResult, SDL_ENUM_CONTINUE)) and (@as(?*anyopaque, @ptrCast(@alignCast(blk: {
        const tmp = readdir(dir);
        ent = tmp;
        break :blk tmp;
    }))) != @as(?*anyopaque, null))) {
        var name: [*c]const u8 = @ptrCast(@alignCast(&ent.*.d_name));
        _ = &name;
        if ((SDL_strcmp_REAL(name, ".") == @as(c_int, 0)) or (SDL_strcmp_REAL(name, "..") == @as(c_int, 0))) {
            continue;
        }
        result = cb.?(userdata, pathwithsep + extralen, name);
    }
    _ = closedir(dir);
    SDL_free_REAL(@ptrCast(@alignCast(pathwithsep)));
    return result != @as(SDL_EnumerationResult, SDL_ENUM_FAILURE);
}
pub export fn SDL_SYS_RemovePath(path: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    var rc: c_int = undefined;
    _ = &rc;
    rc = remove(path);
    if (rc < @as(c_int, 0)) {
        if (__errno_location().* == ENOENT) {
            return @"true" != 0;
        }
        return SDL_SetError_REAL("Can't remove path: %s", strerror(__errno_location().*));
    }
    return @"true" != 0;
}
pub export fn SDL_SYS_RenamePath(oldpath: [*c]const u8, newpath: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    var rc: c_int = undefined;
    _ = &rc;
    rc = rename(oldpath, newpath);
    if (rc < @as(c_int, 0)) {
        return SDL_SetError_REAL("Can't rename path: %s", strerror(__errno_location().*));
    }
    return @"true" != 0;
}
pub export fn SDL_SYS_CopyFile(oldpath: [*c]const u8, newpath: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    var buffer: [*c]u8 = undefined;
    _ = &buffer;
    var input: ?*SDL_IOStream = undefined;
    _ = &input;
    var output: ?*SDL_IOStream = undefined;
    _ = &output;
    var maxlen: usize = undefined;
    _ = &maxlen;
    var len: usize = undefined;
    _ = &len;
    var result: bool = undefined;
    _ = &result;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                buffer = null;
                input = null;
                output = null;
                maxlen = 4096;
                result = @"false" != 0;
                input = SDL_IOFromFile_REAL(oldpath, "rb");
                if (!(input != null)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                if (output != null) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            2 => {
                {
                    sdl_pc = 1;
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
                output = SDL_IOFromFile_REAL(newpath, "wb");
                if (!(output != null)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
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
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                buffer = @ptrCast(@alignCast(SDL_malloc_REAL(maxlen)));
                if (!(buffer != null)) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                {
                    sdl_pc = 1;
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
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                if ((blk: {
                    const tmp = SDL_ReadIO_REAL(input, @ptrCast(@alignCast(buffer)), maxlen);
                    len = tmp;
                    break :blk tmp;
                }) > @as(usize, 0)) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            12 => {
                if (SDL_WriteIO_REAL(output, @ptrCast(@alignCast(buffer)), len) < len) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            13 => {
                if (SDL_GetIOStatus_REAL(input) != @as(SDL_IOStatus, SDL_IO_STATUS_EOF)) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            14 => {
                {
                    sdl_pc = 1;
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
                    sdl_pc = 11;
                    continue;
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
                _ = SDL_CloseIO_REAL(input);
                input = null;
                if (!SDL_FlushIO_REAL(output)) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
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
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            22 => {
                result = SDL_CloseIO_REAL(output);
                output = null;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            23 => {
                _ = SDL_CloseIO_REAL(output);
                {
                    sdl_pc = 25;
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
                if (input != null) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            26 => {
                _ = SDL_CloseIO_REAL(input);
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
                SDL_free_REAL(@ptrCast(@alignCast(buffer)));
                return result;
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_SYS_CreateDirectory(path: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    var rc: c_int = undefined;
    _ = &rc;
    rc = mkdir(path, 504);
    if (rc < @as(c_int, 0)) {
        const origerrno: c_int = __errno_location().*;
        _ = &origerrno;
        if (origerrno == EEXIST) {
            var statbuf: struct_stat = undefined;
            _ = &statbuf;
            if ((stat(path, &statbuf) == @as(c_int, 0)) and ((statbuf.st_mode & @as(__mode_t, __S_IFMT)) == @as(__mode_t, @bitCast(@as(c_int, __S_IFDIR))))) {
                return @"true" != 0;
            }
        }
        return SDL_SetError_REAL("Can't create directory: %s", strerror(origerrno));
    }
    return @"true" != 0;
}
pub export fn SDL_SYS_GetPathInfo(path: [*c]const u8, info: [*c]SDL_PathInfo) bool {
    @setEvalBranchQuota(100000);
    var statbuf: struct_stat = undefined;
    _ = &statbuf;
    var rc: c_int = undefined;
    _ = &rc;
    rc = stat(path, &statbuf);
    if (rc < @as(c_int, 0)) {
        return SDL_SetError_REAL("Can't stat: %s", strerror(__errno_location().*));
    } else if ((statbuf.st_mode & @as(__mode_t, __S_IFMT)) == @as(__mode_t, @bitCast(@as(c_int, __S_IFREG)))) {
        info.*.type = SDL_PATHTYPE_FILE;
        info.*.size = @bitCast(@as(c_long, statbuf.st_size));
    } else if ((statbuf.st_mode & @as(__mode_t, __S_IFMT)) == @as(__mode_t, @bitCast(@as(c_int, __S_IFDIR)))) {
        info.*.type = SDL_PATHTYPE_DIRECTORY;
        info.*.size = 0;
    } else {
        info.*.type = SDL_PATHTYPE_OTHER;
        info.*.size = @bitCast(@as(c_long, statbuf.st_size));
    }
    info.*.create_time = @as(SDL_Time, @bitCast(@as(c_ulong, @truncate(@as(c_ulonglong, @as(Uint64, @bitCast(@as(c_long, statbuf.st_ctim.tv_sec)))) *% @as(c_ulonglong, SDL_NS_PER_SECOND))))) + statbuf.st_ctim.tv_nsec;
    info.*.modify_time = @as(SDL_Time, @bitCast(@as(c_ulong, @truncate(@as(c_ulonglong, @as(Uint64, @bitCast(@as(c_long, statbuf.st_mtim.tv_sec)))) *% @as(c_ulonglong, SDL_NS_PER_SECOND))))) + statbuf.st_mtim.tv_nsec;
    info.*.access_time = @as(SDL_Time, @bitCast(@as(c_ulong, @truncate(@as(c_ulonglong, @as(Uint64, @bitCast(@as(c_long, statbuf.st_atim.tv_sec)))) *% @as(c_ulonglong, SDL_NS_PER_SECOND))))) + statbuf.st_atim.tv_nsec;
    return @"true" != 0;
}
pub export fn SDL_SYS_GetCurrentDirectory() [*c]u8 {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [27:0]u8 = "SDL_SYS_GetCurrentDirectory".*;
    };
    _ = &static_local___func__;
    var buflen: usize = 64;
    _ = &buflen;
    var buf: [*c]u8 = null;
    _ = &buf;
    while (true) {
        var ptr: ?*anyopaque = SDL_realloc_REAL(@ptrCast(@alignCast(buf)), buflen);
        _ = &ptr;
        if (!(ptr != null)) {
            SDL_free_REAL(@ptrCast(@alignCast(buf)));
            return null;
        }
        buf = @ptrCast(@alignCast(ptr));
        if (@as(?*anyopaque, @ptrCast(@alignCast(getcwd(buf, buflen -% @as(usize, 1))))) != @as(?*anyopaque, null)) {
            break;
        }
        if (__errno_location().* == ERANGE) {
            buflen *%= 2;
            continue;
        }
        SDL_free_REAL(@ptrCast(@alignCast(buf)));
        _ = SDL_SetError_REAL("getcwd failed: %s", strerror(__errno_location().*));
        return null;
    }
    while (true) {
        while (!(SDL_strlen_REAL(buf) < (buflen +% @as(usize, 2)))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "SDL_strlen_REAL(buf) < (buflen + 2)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_sysfsops.c", 460);
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
    buflen = SDL_strlen_REAL(buf);
    if ((buflen == @as(usize, 0)) or (@as(c_int, buf[buflen -% @as(usize, 1)]) != @as(c_int, '/'))) {
        buf[buflen] = '/';
        buf[buflen +% @as(usize, 1)] = '\x00';
    }
    return buf;
}

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_NS_PER_SECOND = @as(c_longlong, 1000000000);
pub const ENOENT = @as(c_int, 2);
pub const EEXIST = @as(c_int, 17);
pub const ERANGE = @as(c_int, 34);
pub const __S_IFMT = __helpers.promoteIntLiteral(c_int, 0o170000, .octal);
pub const __S_IFDIR = @as(c_int, 0o040000);
pub const __S_IFREG = __helpers.promoteIntLiteral(c_int, 0o100000, .octal);
