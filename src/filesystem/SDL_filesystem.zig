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
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
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
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_StepUTF8_REAL(pstr: [*c][*c]const u8, pslen: [*c]usize) Uint32;
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
pub const SDL_IO_SEEK_SET: c_int = 0;
pub const enum_SDL_IOWhence = c_uint;
pub const SDL_IOWhence = enum_SDL_IOWhence;
pub const struct_SDL_IOStream = opaque {
};
pub const SDL_IOStream = struct_SDL_IOStream;
pub extern fn SDL_IOFromDynamicMem_REAL() ?*SDL_IOStream;
pub extern fn SDL_CloseIO_REAL(context: ?*SDL_IOStream) bool;
pub extern fn SDL_GetIOSize_REAL(context: ?*SDL_IOStream) Sint64;
pub extern fn SDL_SeekIO_REAL(context: ?*SDL_IOStream, offset: Sint64, whence: SDL_IOWhence) Sint64;
pub extern fn SDL_ReadIO_REAL(context: ?*SDL_IOStream, ptr: ?*anyopaque, size: usize) usize;
pub extern fn SDL_WriteIO_REAL(context: ?*SDL_IOStream, ptr: ?*const anyopaque, size: usize) usize;
pub const enum_SDL_Folder = c_uint;
pub const SDL_Folder = enum_SDL_Folder;
pub const SDL_PATHTYPE_DIRECTORY: c_int = 2;
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
pub const SDL_GlobFlags = Uint32;
pub const SDL_ENUM_CONTINUE: c_int = 0;
pub const SDL_ENUM_FAILURE: c_int = 2;
pub const enum_SDL_EnumerationResult = c_uint;
pub const SDL_EnumerationResult = enum_SDL_EnumerationResult;
pub const SDL_EnumerateDirectoryCallback = ?*const fn (userdata: ?*anyopaque, dirname: [*c]const u8, fname: [*c]const u8) callconv(.c) SDL_EnumerationResult;
pub extern fn SDL_SYS_GetBasePath() [*c]u8;
pub extern fn SDL_SYS_GetExeName() [*c]u8;
pub extern fn SDL_SYS_GetPrefPath(org: [*c]const u8, app: [*c]const u8) [*c]u8;
pub extern fn SDL_SYS_GetUserFolder(folder: SDL_Folder) [*c]u8;
pub extern fn SDL_SYS_GetCurrentDirectory() [*c]u8;
pub extern fn SDL_SYS_EnumerateDirectory(path: [*c]const u8, cb: SDL_EnumerateDirectoryCallback, userdata: ?*anyopaque) bool;
pub extern fn SDL_SYS_RemovePath(path: [*c]const u8) bool;
pub extern fn SDL_SYS_RenamePath(oldpath: [*c]const u8, newpath: [*c]const u8) bool;
pub extern fn SDL_SYS_CopyFile(oldpath: [*c]const u8, newpath: [*c]const u8) bool;
pub extern fn SDL_SYS_CreateDirectory(path: [*c]const u8) bool;
pub extern fn SDL_SYS_GetPathInfo(path: [*c]const u8, info: [*c]SDL_PathInfo) bool;
pub const SDL_GlobEnumeratorFunc = ?*const fn (path: [*c]const u8, cb: SDL_EnumerateDirectoryCallback, cbuserdata: ?*anyopaque, userdata: ?*anyopaque) callconv(.c) bool;
pub const SDL_GlobGetPathInfoFunc = ?*const fn (path: [*c]const u8, info: [*c]SDL_PathInfo, userdata: ?*anyopaque) callconv(.c) bool;
pub extern fn SDL_CaseFoldUnicode(from: Uint32, to: [*c]Uint32) c_int;
pub export fn SDL_RemovePath_REAL(path: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    if (!(path != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("path"))));
    }
    return SDL_SYS_RemovePath(path);
}
pub export fn SDL_RenamePath_REAL(oldpath: [*c]const u8, newpath: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    if (!(oldpath != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("oldpath"))));
    }
    if (!(newpath != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("newpath"))));
    }
    return SDL_SYS_RenamePath(oldpath, newpath);
}
pub export fn SDL_CopyFile_REAL(oldpath: [*c]const u8, newpath: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    if (!(oldpath != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("oldpath"))));
    }
    if (!(newpath != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("newpath"))));
    }
    return SDL_SYS_CopyFile(oldpath, newpath);
}
pub export fn SDL_CreateDirectory_REAL(path: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    if (!(path != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("path"))));
    }
    var retval: bool = SDL_SYS_CreateDirectory(path);
    _ = &retval;
    if (!retval and (@as(c_int, path.*) != 0)) {
        var parents: [*c]u8 = SDL_strdup_REAL(path);
        _ = &parents;
        if (!(parents != null)) {
            return @"false" != 0;
        }
        const slen: usize = SDL_strlen_REAL(parents);
        _ = &slen;
        if (@as(c_int, parents[slen -% @as(usize, 1)]) == @as(c_int, '/')) {
            parents[slen -% @as(usize, 1)] = '\x00';
            retval = SDL_SYS_CreateDirectory(parents);
        }
        if (!retval) {
            {
                var ptr: [*c]u8 = parents;
                _ = &ptr;
                while (@as(c_int, ptr.*) != 0) : (ptr += 1) {
                    const ch: u8 = ptr.*;
                    _ = &ch;
                    const issep: bool = @as(c_int, ch) == @as(c_int, '/');
                    _ = &issep;
                    if (issep and (@divExact(@as(c_long, @bitCast(@intFromPtr(ptr) -% @intFromPtr(parents))), @sizeOf(u8)) == @as(c_long, 0))) {
                        continue;
                    }
                    if (issep) {
                        ptr.* = '\x00';
                        retval = SDL_SYS_CreateDirectory(parents);
                        if (!retval) {
                            break;
                        }
                        ptr.* = ch;
                    }
                }
            }
            retval = SDL_SYS_CreateDirectory(parents);
        }
        SDL_free_REAL(@ptrCast(@alignCast(parents)));
    }
    return retval;
}
pub export fn SDL_EnumerateDirectory_REAL(path: [*c]const u8, callback: SDL_EnumerateDirectoryCallback, userdata: ?*anyopaque) bool {
    @setEvalBranchQuota(100000);
    if (!(path != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("path"))));
    }
    if (!(callback != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("callback"))));
    }
    return SDL_SYS_EnumerateDirectory(path, callback, userdata);
}
pub export fn SDL_GetPathInfo_REAL(path: [*c]const u8, arg_info: [*c]SDL_PathInfo) bool {
    @setEvalBranchQuota(100000);
    var info = arg_info;
    _ = &info;
    var dummy: SDL_PathInfo = undefined;
    _ = &dummy;
    if (!(info != null)) {
        info = &dummy;
    }
    _ = memset(@ptrCast(@alignCast(info)), 0, @sizeOf(@TypeOf(info.*)));
    if (!(path != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("path"))));
    }
    return SDL_SYS_GetPathInfo(path, info);
}
pub fn EverythingMatch(pattern: [*c]const u8, str: [*c]const u8, matched_to_dir: [*c]bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [15:0]u8 = "EverythingMatch".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(@constCast(pattern)))) == @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "pattern == ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_filesystem.c", 147);
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
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(@constCast(str)))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "str != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_filesystem.c", 148);
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
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(matched_to_dir))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "matched_to_dir != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_filesystem.c", 149);
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
    matched_to_dir.* = @"true" != 0;
    return @"true" != 0;
}
pub fn WildcardMatch(arg_pattern: [*c]const u8, arg_str: [*c]const u8, matched_to_dir: [*c]bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var pattern = arg_pattern;
    _ = &pattern;
    var str = arg_str;
    _ = &str;
    const static_local___func__ = struct {
        const __func__: [13:0]u8 = "WildcardMatch".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(@constCast(pattern)))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "pattern != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_filesystem.c", 158);
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
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(@constCast(str)))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "str != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_filesystem.c", 159);
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
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(matched_to_dir))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "matched_to_dir != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_filesystem.c", 160);
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
    var str_backtrack: [*c]const u8 = null;
    _ = &str_backtrack;
    var pattern_backtrack: [*c]const u8 = null;
    _ = &pattern_backtrack;
    var sch_backtrack: u8 = 0;
    _ = &sch_backtrack;
    var sch: u8 = str.*;
    _ = &sch;
    var pch: u8 = pattern.*;
    _ = &pch;
    while (@as(c_int, sch) != 0) {
        if (@as(c_int, pch) == @as(c_int, '*')) {
            str_backtrack = str;
            pattern_backtrack = blk: {
                const ref = &pattern;
                ref.* += 1;
                break :blk ref.*;
            };
            sch_backtrack = sch;
            pch = pattern.*;
        } else if (@as(c_int, pch) == @as(c_int, sch)) {
            if (@as(c_int, pch) == @as(c_int, '/')) {
                str_backtrack = blk: {
                    const tmp = @as([*c]const u8, null);
                    pattern_backtrack = tmp;
                    break :blk tmp;
                };
            }
            sch = (blk: {
                const ref = &str;
                ref.* += 1;
                break :blk ref.*;
            }).*;
            pch = (blk: {
                const ref = &pattern;
                ref.* += 1;
                break :blk ref.*;
            }).*;
        } else if ((@as(c_int, pch) == @as(c_int, '?')) and (@as(c_int, sch) != @as(c_int, '/'))) {
            sch = (blk: {
                const ref = &str;
                ref.* += 1;
                break :blk ref.*;
            }).*;
            pch = (blk: {
                const ref = &pattern;
                ref.* += 1;
                break :blk ref.*;
            }).*;
        } else if (!(pattern_backtrack != null) or (@as(c_int, sch_backtrack) == @as(c_int, '/'))) {
            matched_to_dir.* = @"false" != 0;
            return @"false" != 0;
        } else {
            str = blk: {
                const ref = &str_backtrack;
                ref.* += 1;
                break :blk ref.*;
            };
            pattern = pattern_backtrack;
            sch_backtrack = sch;
            sch = str.*;
            pch = pattern.*;
        }
    }
    while (@as(c_int, pch) == @as(c_int, '*')) {
        pch = (blk: {
            const ref = &pattern;
            ref.* += 1;
            break :blk ref.*;
        }).*;
    }
    matched_to_dir.* = @as(c_int, pch) == @as(c_int, '/');
    return @as(c_int, pch) == @as(c_int, '\x00');
}
pub fn EncodeCodepointToUtf8(ptr: [*c]u8, arg_cp: Uint32, arg_remaining: usize) callconv(.c) usize {
    @setEvalBranchQuota(100000);
    var cp = arg_cp;
    _ = &cp;
    var remaining = arg_remaining;
    _ = &remaining;
    if (cp < @as(Uint32, 128)) {
        if (remaining != 0) {
            ptr.* = @truncate(cp);
            return 1;
        }
    } else if (cp < @as(Uint32, 2048)) {
        if (remaining >= @as(usize, 2)) {
            ptr[@as(c_int, 0)] = @truncate(((cp >> @intCast(@as(Uint32, 6))) | @as(Uint32, 128)) | @as(Uint32, 64));
            ptr[@as(c_int, 1)] = @bitCast(@as(i8, @truncate(@as(c_int, @as(u8, @truncate(cp & @as(Uint32, 63)))) | @as(c_int, 128))));
            return 2;
        }
    } else if (cp < @as(Uint32, 65536)) {
        if (remaining >= @as(usize, 3)) {
            ptr[@as(c_int, 0)] = @truncate((((cp >> @intCast(@as(Uint32, 12))) | @as(Uint32, 128)) | @as(Uint32, 64)) | @as(Uint32, 32));
            ptr[@as(c_int, 1)] = @bitCast(@as(i8, @truncate(@as(c_int, @as(u8, @truncate((cp >> @intCast(@as(Uint32, 6))) & @as(Uint32, 63)))) | @as(c_int, 128))));
            ptr[@as(c_int, 2)] = @bitCast(@as(i8, @truncate(@as(c_int, @as(u8, @truncate(cp & @as(Uint32, 63)))) | @as(c_int, 128))));
            return 3;
        }
    } else if (cp <= @as(Uint32, 1114111)) {
        if (remaining >= @as(usize, 4)) {
            ptr[@as(c_int, 0)] = @truncate(((((cp >> @intCast(@as(Uint32, 18))) | @as(Uint32, 128)) | @as(Uint32, 64)) | @as(Uint32, 32)) | @as(Uint32, 16));
            ptr[@as(c_int, 1)] = @bitCast(@as(i8, @truncate(@as(c_int, @as(u8, @truncate((cp >> @intCast(@as(Uint32, 12))) & @as(Uint32, 63)))) | @as(c_int, 128))));
            ptr[@as(c_int, 2)] = @bitCast(@as(i8, @truncate(@as(c_int, @as(u8, @truncate((cp >> @intCast(@as(Uint32, 6))) & @as(Uint32, 63)))) | @as(c_int, 128))));
            ptr[@as(c_int, 3)] = @bitCast(@as(i8, @truncate(@as(c_int, @as(u8, @truncate(cp & @as(Uint32, 63)))) | @as(c_int, 128))));
            return 4;
        }
    }
    return 0;
}
pub fn CaseFoldUtf8String(arg_fname: [*c]const u8) callconv(.c) [*c]u8 {
    @setEvalBranchQuota(100000);
    var fname = arg_fname;
    _ = &fname;
    const static_local___func__ = struct {
        const __func__: [18:0]u8 = "CaseFoldUtf8String".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(@constCast(fname)))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "fname != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_filesystem.c", 250);
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
    const allocation: usize = ((SDL_strlen_REAL(fname) +% @as(usize, 1)) *% @as(usize, 3)) *% @as(usize, 4);
    _ = &allocation;
    var result: [*c]u8 = @ptrCast(@alignCast(SDL_malloc_REAL(allocation)));
    _ = &result;
    if (!(result != null)) {
        return null;
    }
    var codepoint: Uint32 = undefined;
    _ = &codepoint;
    var ptr: [*c]u8 = result;
    _ = &ptr;
    var remaining: usize = allocation;
    _ = &remaining;
    while ((blk: {
        const tmp = SDL_StepUTF8_REAL(&fname, null);
        codepoint = tmp;
        break :blk tmp;
    }) != @as(Uint32, 0)) {
        var folded: [3]Uint32 = undefined;
        _ = &folded;
        const num_folded: c_int = SDL_CaseFoldUnicode(codepoint, @ptrCast(@alignCast(&folded)));
        _ = &num_folded;
        while (true) {
            while (!(num_folded > @as(c_int, 0))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "num_folded > 0",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_filesystem.c", 263);
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
        while (true) {
            while (!(@as(c_ulong, @bitCast(@as(c_long, num_folded))) <= (@sizeOf(@TypeOf(folded)) / @sizeOf(@TypeOf(folded[@as(c_int, 0)]))))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "num_folded <= (sizeof(folded)/sizeof(folded[0]))",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_filesystem.c", 264);
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
        {
            var i: c_int = 0;
            _ = &i;
            while (i < num_folded) : (i += 1) {
                while (true) {
                    while (!(remaining > @as(usize, 0))) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "remaining > 0",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_filesystem.c", 266);
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
                const rc: usize = EncodeCodepointToUtf8(ptr, folded[@bitCast(@as(isize, @intCast(i)))], remaining);
                _ = &rc;
                while (true) {
                    while (!(rc > @as(usize, 0))) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "rc > 0",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_filesystem.c", 268);
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
                while (true) {
                    while (!(rc < remaining)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "rc < remaining",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_filesystem.c", 269);
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
                remaining -%= rc;
                ptr += rc;
            }
        }
    }
    while (true) {
        while (!(remaining > @as(usize, 0))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "remaining > 0",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_filesystem.c", 275);
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
    remaining -%= 1;
    ptr.* = '\x00';
    if (remaining > @as(usize, 0)) {
        while (true) {
            while (!(allocation > remaining)) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "allocation > remaining",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_filesystem.c", 280);
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
        ptr = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(result)), allocation -% remaining)));
        if (ptr != null) {
            result = ptr;
        }
    }
    return result;
}
pub const struct_GlobDirCallbackData = extern struct {
    matcher: ?*const fn (pattern: [*c]const u8, str: [*c]const u8, matched_to_dir: [*c]bool) callconv(.c) bool = null,
    pattern: [*c]const u8 = null,
    num_entries: c_int = 0,
    flags: SDL_GlobFlags = 0,
    enumerator: SDL_GlobEnumeratorFunc = null,
    getpathinfo: SDL_GlobGetPathInfoFunc = null,
    fsuserdata: ?*anyopaque = null,
    basedirlen: usize = 0,
    string_stream: ?*SDL_IOStream = null,
};
pub const GlobDirCallbackData = struct_GlobDirCallbackData;
pub fn GlobDirectoryCallback(userdata: ?*anyopaque, dirname: [*c]const u8, fname: [*c]const u8) callconv(.c) SDL_EnumerationResult {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [21:0]u8 = "GlobDirectoryCallback".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!(userdata != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "userdata != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_filesystem.c", 306);
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
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(@constCast(dirname)))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "dirname != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_filesystem.c", 307);
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
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(@constCast(fname)))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "fname != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_filesystem.c", 308);
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
    var data: [*c]GlobDirCallbackData = @ptrCast(@alignCast(userdata));
    _ = &data;
    var fullpath: [*c]u8 = null;
    _ = &fullpath;
    if (SDL_asprintf_REAL(&fullpath, "%s%s", dirname, fname) < @as(c_int, 0)) {
        return SDL_ENUM_FAILURE;
    }
    var folded: [*c]u8 = null;
    _ = &folded;
    if ((data.*.flags & (@as(c_uint, 1) << @intCast(@as(c_uint, 0)))) != 0) {
        folded = CaseFoldUtf8String(fullpath);
        if (!(folded != null)) {
            return SDL_ENUM_FAILURE;
        }
    }
    var matched_to_dir: bool = @"false" != 0;
    _ = &matched_to_dir;
    const matched: bool = data.*.matcher.?(data.*.pattern, (if (folded != null) folded else fullpath) + data.*.basedirlen, &matched_to_dir);
    _ = &matched;
    SDL_free_REAL(@ptrCast(@alignCast(folded)));
    if (matched) {
        var subpath: [*c]const u8 = fullpath + data.*.basedirlen;
        _ = &subpath;
        const slen: usize = SDL_strlen_REAL(subpath) +% @as(usize, 1);
        _ = &slen;
        if (SDL_WriteIO_REAL(data.*.string_stream, @ptrCast(@alignCast(subpath)), slen) != slen) {
            SDL_free_REAL(@ptrCast(@alignCast(fullpath)));
            return SDL_ENUM_FAILURE;
        }
        data.*.num_entries += 1;
    }
    var result: SDL_EnumerationResult = SDL_ENUM_CONTINUE;
    _ = &result;
    if (matched_to_dir) {
        var info: SDL_PathInfo = undefined;
        _ = &info;
        if (data.*.getpathinfo.?(fullpath, &info, data.*.fsuserdata) and (info.type == @as(SDL_PathType, SDL_PATHTYPE_DIRECTORY))) {
            if (!data.*.enumerator.?(fullpath, GlobDirectoryCallback, @ptrCast(@alignCast(data)), data.*.fsuserdata)) {
                result = SDL_ENUM_FAILURE;
            }
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(fullpath)));
    return result;
}
pub export fn SDL_InternalGlobDirectory(arg_path: [*c]const u8, pattern: [*c]const u8, arg_flags: SDL_GlobFlags, arg_count: [*c]c_int, enumerator: SDL_GlobEnumeratorFunc, getpathinfo: SDL_GlobGetPathInfoFunc, userdata: ?*anyopaque) [*c][*c]u8 {
    @setEvalBranchQuota(100000);
    var path = arg_path;
    _ = &path;
    var flags = arg_flags;
    _ = &flags;
    var count = arg_count;
    _ = &count;
    const static_local___func__ = struct {
        const __func__: [25:0]u8 = "SDL_InternalGlobDirectory".*;
    };
    _ = &static_local___func__;
    var dummycount: c_int = undefined;
    _ = &dummycount;
    if (!(count != null)) {
        count = &dummycount;
    }
    count.* = 0;
    if (!(path != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("path"))));
        return null;
    }
    var pathcpy: [*c]u8 = null;
    _ = &pathcpy;
    var pathlen: usize = SDL_strlen_REAL(path);
    _ = &pathlen;
    {
        if ((pathlen > @as(usize, 1)) and ((@as(c_int, path[pathlen -% @as(usize, 1)]) == @as(c_int, '/')) or (@as(c_int, path[pathlen -% @as(usize, 1)]) == @as(c_int, '\\')))) {
            pathcpy = SDL_strdup_REAL(path);
            if (!(pathcpy != null)) {
                return null;
            }
            var ptr: [*c]u8 = &pathcpy[pathlen -% @as(usize, 1)];
            _ = &ptr;
            while ((ptr > pathcpy) and ((@as(c_int, ptr.*) == @as(c_int, '/')) or (@as(c_int, ptr.*) == @as(c_int, '\\')))) {
                (blk: {
                    const ref = &ptr;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }).* = '\x00';
                pathlen -%= 1;
            }
            path = pathcpy;
        }
    }
    if (!(pattern != null)) {
        flags &= ~(@as(c_uint, 1) << @intCast(@as(c_uint, 0)));
    }
    var folded: [*c]u8 = null;
    _ = &folded;
    if ((flags & (@as(c_uint, 1) << @intCast(@as(c_uint, 0)))) != 0) {
        while (true) {
            while (!(@as(?*anyopaque, @ptrCast(@alignCast(@constCast(pattern)))) != @as(?*anyopaque, null))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "pattern != ((void*)0)",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_filesystem.c", 404);
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
        folded = CaseFoldUtf8String(pattern);
        if (!(folded != null)) {
            SDL_free_REAL(@ptrCast(@alignCast(pathcpy)));
            return null;
        }
    }
    var data: GlobDirCallbackData = undefined;
    _ = &data;
    _ = memset(@ptrCast(@alignCast(&data)), 0, @sizeOf(@TypeOf(data)));
    data.string_stream = SDL_IOFromDynamicMem_REAL();
    if (!(data.string_stream != null)) {
        SDL_free_REAL(@ptrCast(@alignCast(folded)));
        SDL_free_REAL(@ptrCast(@alignCast(pathcpy)));
        return null;
    }
    if (!(pattern != null)) {
        data.matcher = EverythingMatch;
    } else {
        data.matcher = WildcardMatch;
    }
    data.pattern = if (folded != null) @as([*c]const u8, @ptrCast(@alignCast(folded))) else pattern;
    data.flags = flags;
    data.enumerator = enumerator;
    data.getpathinfo = getpathinfo;
    data.fsuserdata = userdata;
    data.basedirlen = 0;
    if (@as(c_int, path.*) != 0) {
        if ((SDL_strcmp_REAL(path, "/") == @as(c_int, 0)) or (SDL_strcmp_REAL(path, "\\") == @as(c_int, 0))) {
            data.basedirlen = 1;
        } else {
            data.basedirlen = pathlen +% @as(usize, 1);
        }
    }
    var result: [*c][*c]u8 = null;
    _ = &result;
    if (data.enumerator.?(path, GlobDirectoryCallback, @ptrCast(@alignCast(&data)), data.fsuserdata)) {
        const streamlen: usize = @bitCast(@as(c_long, SDL_GetIOSize_REAL(data.string_stream)));
        _ = &streamlen;
        const buflen: usize = streamlen +% (@as(c_ulong, @bitCast(@as(c_long, data.num_entries + @as(c_int, 1)))) *% @sizeOf([*c]u8));
        _ = &buflen;
        result = @ptrCast(@alignCast(SDL_malloc_REAL(buflen)));
        if (result != null) {
            if (data.num_entries > @as(c_int, 0)) {
                var iorc: Sint64 = SDL_SeekIO_REAL(data.string_stream, 0, SDL_IO_SEEK_SET);
                _ = &iorc;
                while (true) {
                    while (!(iorc == @as(Sint64, 0))) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "iorc == 0",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_filesystem.c", 455);
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
                var ptr: [*c]u8 = @ptrCast(@alignCast(result + @as(usize, @bitCast(@as(isize, @intCast(data.num_entries + @as(c_int, 1)))))));
                _ = &ptr;
                iorc = @bitCast(@as(c_ulong, @truncate(SDL_ReadIO_REAL(data.string_stream, @ptrCast(@alignCast(ptr)), streamlen))));
                while (true) {
                    while (!(iorc == @as(Sint64, @bitCast(@as(c_ulong, @truncate(streamlen)))))) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "iorc == (Sint64) streamlen",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_filesystem.c", 458);
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
                {
                    var i: c_int = 0;
                    _ = &i;
                    while (i < data.num_entries) : (i += 1) {
                        result[@bitCast(@as(isize, @intCast(i)))] = ptr;
                        ptr += SDL_strlen_REAL(ptr) +% @as(usize, 1);
                    }
                }
            }
            result[@bitCast(@as(isize, @intCast(data.num_entries)))] = null;
            count.* = data.num_entries;
        }
    }
    _ = SDL_CloseIO_REAL(data.string_stream);
    SDL_free_REAL(@ptrCast(@alignCast(folded)));
    SDL_free_REAL(@ptrCast(@alignCast(pathcpy)));
    return result;
}
pub fn GlobDirectoryGetPathInfo(path: [*c]const u8, info: [*c]SDL_PathInfo, _: ?*anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_GetPathInfo_REAL(path, info);
}
pub fn GlobDirectoryEnumerator(path: [*c]const u8, cb: SDL_EnumerateDirectoryCallback, cbuserdata: ?*anyopaque, _: ?*anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_EnumerateDirectory_REAL(path, cb, cbuserdata);
}
pub export fn SDL_GlobDirectory_REAL(path: [*c]const u8, pattern: [*c]const u8, flags: SDL_GlobFlags, count: [*c]c_int) [*c][*c]u8 {
    @setEvalBranchQuota(100000);
    return SDL_InternalGlobDirectory(path, pattern, flags, count, GlobDirectoryEnumerator, GlobDirectoryGetPathInfo, null);
}
pub var CachedBasePath: [*c]u8 = null;
pub export fn SDL_GetBasePath_REAL() [*c]const u8 {
    @setEvalBranchQuota(100000);
    if (!(CachedBasePath != null)) {
        CachedBasePath = SDL_SYS_GetBasePath();
    }
    return CachedBasePath;
}
pub var CachedUserFolders: [11][*c]u8 = @import("std").mem.zeroes([11][*c]u8);
pub export fn SDL_GetUserFolder_REAL(folder: SDL_Folder) [*c]const u8 {
    @setEvalBranchQuota(100000);
    const idx: c_int = @bitCast(folder);
    _ = &idx;
    if ((idx < @as(c_int, 0)) or (@as(c_ulong, @bitCast(@as(c_long, idx))) >= (@sizeOf(@TypeOf(CachedUserFolders)) / @sizeOf(@TypeOf(CachedUserFolders[@as(c_int, 0)]))))) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("folder"))));
        return null;
    }
    if (!(CachedUserFolders[@bitCast(@as(isize, @intCast(idx)))] != null)) {
        CachedUserFolders[@bitCast(@as(isize, @intCast(idx)))] = SDL_SYS_GetUserFolder(folder);
    }
    return CachedUserFolders[@bitCast(@as(isize, @intCast(idx)))];
}
pub var CachedExeName: [*c]u8 = null;
pub export fn SDL_GetExeName() [*c]const u8 {
    @setEvalBranchQuota(100000);
    if (!(CachedExeName != null)) {
        CachedExeName = SDL_SYS_GetExeName();
    }
    return CachedExeName;
}
pub export fn SDL_GetPrefPath_REAL(arg_org: [*c]const u8, app: [*c]const u8) [*c]u8 {
    @setEvalBranchQuota(100000);
    var org = arg_org;
    _ = &org;
    if (!(app != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("app"))));
        return null;
    }
    if (!(org != null)) {
        org = "";
    }
    return SDL_SYS_GetPrefPath(org, app);
}
pub export fn SDL_GetCurrentDirectory_REAL() [*c]u8 {
    @setEvalBranchQuota(100000);
    return SDL_SYS_GetCurrentDirectory();
}
pub export fn SDL_InitFilesystem() void {}
pub export fn SDL_QuitFilesystem() void {
    @setEvalBranchQuota(100000);
    SDL_free_REAL(@ptrCast(@alignCast(CachedBasePath)));
    CachedBasePath = null;
    SDL_free_REAL(@ptrCast(@alignCast(CachedExeName)));
    CachedExeName = null;
    {
        var i: c_int = 0;
        _ = &i;
        while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(CachedUserFolders)) / @sizeOf(@TypeOf(CachedUserFolders[@as(c_int, 0)])))) : (i += 1) {
            if (CachedUserFolders[@bitCast(@as(isize, @intCast(i)))] != null) {
                SDL_free_REAL(@ptrCast(@alignCast(CachedUserFolders[@bitCast(@as(isize, @intCast(i)))])));
                CachedUserFolders[@bitCast(@as(isize, @intCast(i)))] = null;
            }
        }
    }
}

pub const SDL_CopyFile = SDL_CopyFile_REAL;
pub const SDL_CreateDirectory = SDL_CreateDirectory_REAL;
pub const SDL_EnumerateDirectory = SDL_EnumerateDirectory_REAL;
pub const SDL_GetBasePath = SDL_GetBasePath_REAL;
pub const SDL_GetPathInfo = SDL_GetPathInfo_REAL;
pub const SDL_GetPrefPath = SDL_GetPrefPath_REAL;
pub const SDL_GetUserFolder = SDL_GetUserFolder_REAL;
pub const SDL_GlobDirectory = SDL_GlobDirectory_REAL;
pub const SDL_RemovePath = SDL_RemovePath_REAL;
pub const SDL_RenamePath = SDL_RenamePath_REAL;
pub const SDL_GetCurrentDirectory = SDL_GetCurrentDirectory_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
