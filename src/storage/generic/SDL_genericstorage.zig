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
pub extern fn remove(__filename: [*c]const u8) c_int;
pub extern fn rename(__old: [*c]const u8, __new: [*c]const u8) c_int;
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
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_strlen_REAL(str: [*c]const u8) usize;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_asprintf_REAL(strp: [*c][*c]u8, fmt: [*c]const u8, ...) c_int;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_PropertiesID = Uint32;
pub const struct_SDL_IOStream = opaque {
};
pub const SDL_IOStream = struct_SDL_IOStream;
pub extern fn SDL_IOFromFile_REAL(file: [*c]const u8, mode: [*c]const u8) ?*SDL_IOStream;
pub extern fn SDL_CloseIO_REAL(context: ?*SDL_IOStream) bool;
pub extern fn SDL_ReadIO_REAL(context: ?*SDL_IOStream, ptr: ?*anyopaque, size: usize) usize;
pub extern fn SDL_WriteIO_REAL(context: ?*SDL_IOStream, ptr: ?*const anyopaque, size: usize) usize;
pub extern fn SDL_GetBasePath_REAL() [*c]const u8;
pub extern fn SDL_GetPrefPath_REAL(org: [*c]const u8, app: [*c]const u8) [*c]u8;
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
pub extern fn SDL_CreateDirectory_REAL(path: [*c]const u8) bool;
pub const enum_SDL_EnumerationResult = c_uint;
pub const SDL_EnumerationResult = enum_SDL_EnumerationResult;
pub const SDL_EnumerateDirectoryCallback = ?*const fn (userdata: ?*anyopaque, dirname: [*c]const u8, fname: [*c]const u8) callconv(.c) SDL_EnumerationResult;
pub extern fn SDL_EnumerateDirectory_REAL(path: [*c]const u8, callback: SDL_EnumerateDirectoryCallback, userdata: ?*anyopaque) bool;
pub extern fn SDL_RemovePath_REAL(path: [*c]const u8) bool;
pub extern fn SDL_RenamePath_REAL(oldpath: [*c]const u8, newpath: [*c]const u8) bool;
pub extern fn SDL_CopyFile_REAL(oldpath: [*c]const u8, newpath: [*c]const u8) bool;
pub extern fn SDL_GetPathInfo_REAL(path: [*c]const u8, info: [*c]SDL_PathInfo) bool;
pub extern fn SDL_GetCurrentDirectory_REAL() [*c]u8;
pub const struct_SDL_StorageInterface = extern struct {
    version: Uint32 = 0,
    close: ?*const fn (userdata: ?*anyopaque) callconv(.c) bool = null,
    ready: ?*const fn (userdata: ?*anyopaque) callconv(.c) bool = null,
    enumerate: ?*const fn (userdata: ?*anyopaque, path: [*c]const u8, callback: SDL_EnumerateDirectoryCallback, callback_userdata: ?*anyopaque) callconv(.c) bool = null,
    info: ?*const fn (userdata: ?*anyopaque, path: [*c]const u8, info: [*c]SDL_PathInfo) callconv(.c) bool = null,
    read_file: ?*const fn (userdata: ?*anyopaque, path: [*c]const u8, destination: ?*anyopaque, length: Uint64) callconv(.c) bool = null,
    write_file: ?*const fn (userdata: ?*anyopaque, path: [*c]const u8, source: ?*const anyopaque, length: Uint64) callconv(.c) bool = null,
    mkdir: ?*const fn (userdata: ?*anyopaque, path: [*c]const u8) callconv(.c) bool = null,
    remove: ?*const fn (userdata: ?*anyopaque, path: [*c]const u8) callconv(.c) bool = null,
    rename: ?*const fn (userdata: ?*anyopaque, oldpath: [*c]const u8, newpath: [*c]const u8) callconv(.c) bool = null,
    copy: ?*const fn (userdata: ?*anyopaque, oldpath: [*c]const u8, newpath: [*c]const u8) callconv(.c) bool = null,
    space_remaining: ?*const fn (userdata: ?*anyopaque) callconv(.c) Uint64 = null,
};
pub const SDL_StorageInterface = struct_SDL_StorageInterface;
comptime {
    if (!(((@sizeOf(?*anyopaque) == @as(c_ulong, 4)) and (@sizeOf(SDL_StorageInterface) == @as(c_ulong, 48))) or ((@sizeOf(?*anyopaque) == @as(c_ulong, 8)) and (@sizeOf(SDL_StorageInterface) == @as(c_ulong, 96))))) @compileError("static assertion failed \"(sizeof(void *) == 4 && sizeof(SDL_StorageInterface) == 48) || (sizeof(void *) == 8 && sizeof(SDL_StorageInterface) == 96)\"");
}
pub const struct_SDL_Storage = opaque {
};
pub const SDL_Storage = struct_SDL_Storage;
pub extern fn SDL_OpenStorage_REAL(iface: [*c]const SDL_StorageInterface, userdata: ?*anyopaque) ?*SDL_Storage;
pub const struct_TitleStorageBootStrap = extern struct {
    name: [*c]const u8 = null,
    desc: [*c]const u8 = null,
    create: ?*const fn ([*c]const u8, SDL_PropertiesID) callconv(.c) ?*SDL_Storage = null,
};
pub const TitleStorageBootStrap = struct_TitleStorageBootStrap;
pub const struct_UserStorageBootStrap = extern struct {
    name: [*c]const u8 = null,
    desc: [*c]const u8 = null,
    create: ?*const fn ([*c]const u8, [*c]const u8, SDL_PropertiesID) callconv(.c) ?*SDL_Storage = null,
};
pub const UserStorageBootStrap = struct_UserStorageBootStrap;
pub fn GENERIC_INTERNAL_CreateFullPath(base: [*c]const u8, relative: [*c]const u8) callconv(.c) [*c]u8 {
    @setEvalBranchQuota(100000);
    var rel: [*c]const u8 = relative;
    _ = &rel;
    var result: [*c]u8 = null;
    _ = &result;
    _ = SDL_asprintf_REAL(&result, "%s%s", if (base != null) base else @as([*c]const u8, @ptrCast(@alignCast(@as([*c]u8, @as([*c]u8, @constCast("")))))), if (rel != null) rel else @as([*c]const u8, @ptrCast(@alignCast(@as([*c]u8, @as([*c]u8, @constCast("")))))));
    return result;
}
pub fn GENERIC_CloseStorage(userdata: ?*anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    SDL_free_REAL(userdata);
    return @"true" != 0;
}
pub const struct_GenericEnumerateData = extern struct {
    base_len: usize = 0,
    real_callback: SDL_EnumerateDirectoryCallback = null,
    real_userdata: ?*anyopaque = null,
};
pub const GenericEnumerateData = struct_GenericEnumerateData;
pub fn GENERIC_EnumerateDirectory(userdata: ?*anyopaque, arg_dirname: [*c]const u8, fname: [*c]const u8) callconv(.c) SDL_EnumerationResult {
    @setEvalBranchQuota(100000);
    var dirname = arg_dirname;
    _ = &dirname;
    var wrap_data: [*c]const GenericEnumerateData = @ptrCast(@alignCast(userdata));
    _ = &wrap_data;
    dirname += wrap_data.*.base_len;
    return wrap_data.*.real_callback.?(wrap_data.*.real_userdata, dirname, fname);
}
pub fn GENERIC_EnumerateStorageDirectory(userdata: ?*anyopaque, path: [*c]const u8, callback: SDL_EnumerateDirectoryCallback, callback_userdata: ?*anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var result: bool = @"false" != 0;
    _ = &result;
    var wrap_data: GenericEnumerateData = undefined;
    _ = &wrap_data;
    var fullpath: [*c]u8 = GENERIC_INTERNAL_CreateFullPath(@ptrCast(@alignCast(userdata)), path);
    _ = &fullpath;
    if (fullpath != null) {
        wrap_data.base_len = if (userdata != null) SDL_strlen_REAL(@ptrCast(@alignCast(userdata))) else @as(usize, 0);
        wrap_data.real_callback = callback;
        wrap_data.real_userdata = callback_userdata;
        result = SDL_EnumerateDirectory_REAL(fullpath, GENERIC_EnumerateDirectory, @ptrCast(@alignCast(&wrap_data)));
        SDL_free_REAL(@ptrCast(@alignCast(fullpath)));
    }
    return result;
}
pub fn GENERIC_GetStoragePathInfo(userdata: ?*anyopaque, path: [*c]const u8, info: [*c]SDL_PathInfo) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var result: bool = @"false" != 0;
    _ = &result;
    var fullpath: [*c]u8 = GENERIC_INTERNAL_CreateFullPath(@ptrCast(@alignCast(userdata)), path);
    _ = &fullpath;
    if (fullpath != null) {
        result = SDL_GetPathInfo_REAL(fullpath, info);
        SDL_free_REAL(@ptrCast(@alignCast(fullpath)));
    }
    return result;
}
pub fn GENERIC_ReadStorageFile(userdata: ?*anyopaque, path: [*c]const u8, destination: ?*anyopaque, length: Uint64) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var result: bool = @"false" != 0;
    _ = &result;
    if (length > @as(c_ulong, 18446744073709551615)) {
        return SDL_SetError_REAL("Read size exceeds SDL_SIZE_MAX");
    }
    var fullpath: [*c]u8 = GENERIC_INTERNAL_CreateFullPath(@ptrCast(@alignCast(userdata)), path);
    _ = &fullpath;
    if (fullpath != null) {
        var stream: ?*SDL_IOStream = SDL_IOFromFile_REAL(fullpath, "rb");
        _ = &stream;
        if (stream != null) {
            if (SDL_ReadIO_REAL(stream, destination, length) == length) {
                result = @"true" != 0;
            } else {
                _ = SDL_SetError_REAL("File length did not exactly match the destination length");
            }
            _ = SDL_CloseIO_REAL(stream);
        }
        SDL_free_REAL(@ptrCast(@alignCast(fullpath)));
    }
    return result;
}
pub fn GENERIC_WriteStorageFile(userdata: ?*anyopaque, path: [*c]const u8, source: ?*const anyopaque, length: Uint64) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var result: bool = @"false" != 0;
    _ = &result;
    if (length > @as(c_ulong, 18446744073709551615)) {
        return SDL_SetError_REAL("Write size exceeds SDL_SIZE_MAX");
    }
    var fullpath: [*c]u8 = GENERIC_INTERNAL_CreateFullPath(@ptrCast(@alignCast(userdata)), path);
    _ = &fullpath;
    if (fullpath != null) {
        var stream: ?*SDL_IOStream = SDL_IOFromFile_REAL(fullpath, "wb");
        _ = &stream;
        if (stream != null) {
            if (SDL_WriteIO_REAL(stream, source, length) == length) {
                result = @"true" != 0;
            } else {
                _ = SDL_SetError_REAL("Resulting file length did not exactly match the source length");
            }
            _ = SDL_CloseIO_REAL(stream);
        }
        SDL_free_REAL(@ptrCast(@alignCast(fullpath)));
    }
    return result;
}
pub fn GENERIC_CreateStorageDirectory(userdata: ?*anyopaque, path: [*c]const u8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var result: bool = @"false" != 0;
    _ = &result;
    var fullpath: [*c]u8 = GENERIC_INTERNAL_CreateFullPath(@ptrCast(@alignCast(userdata)), path);
    _ = &fullpath;
    if (fullpath != null) {
        result = SDL_CreateDirectory_REAL(fullpath);
        SDL_free_REAL(@ptrCast(@alignCast(fullpath)));
    }
    return result;
}
pub fn GENERIC_RemoveStoragePath(userdata: ?*anyopaque, path: [*c]const u8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var result: bool = @"false" != 0;
    _ = &result;
    var fullpath: [*c]u8 = GENERIC_INTERNAL_CreateFullPath(@ptrCast(@alignCast(userdata)), path);
    _ = &fullpath;
    if (fullpath != null) {
        result = SDL_RemovePath_REAL(fullpath);
        SDL_free_REAL(@ptrCast(@alignCast(fullpath)));
    }
    return result;
}
pub fn GENERIC_RenameStoragePath(userdata: ?*anyopaque, oldpath: [*c]const u8, newpath: [*c]const u8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var result: bool = @"false" != 0;
    _ = &result;
    var fulloldpath: [*c]u8 = GENERIC_INTERNAL_CreateFullPath(@ptrCast(@alignCast(userdata)), oldpath);
    _ = &fulloldpath;
    var fullnewpath: [*c]u8 = GENERIC_INTERNAL_CreateFullPath(@ptrCast(@alignCast(userdata)), newpath);
    _ = &fullnewpath;
    if ((fulloldpath != null) and (fullnewpath != null)) {
        result = SDL_RenamePath_REAL(fulloldpath, fullnewpath);
    }
    SDL_free_REAL(@ptrCast(@alignCast(fulloldpath)));
    SDL_free_REAL(@ptrCast(@alignCast(fullnewpath)));
    return result;
}
pub fn GENERIC_CopyStorageFile(userdata: ?*anyopaque, oldpath: [*c]const u8, newpath: [*c]const u8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var result: bool = @"false" != 0;
    _ = &result;
    var fulloldpath: [*c]u8 = GENERIC_INTERNAL_CreateFullPath(@ptrCast(@alignCast(userdata)), oldpath);
    _ = &fulloldpath;
    var fullnewpath: [*c]u8 = GENERIC_INTERNAL_CreateFullPath(@ptrCast(@alignCast(userdata)), newpath);
    _ = &fullnewpath;
    if ((fulloldpath != null) and (fullnewpath != null)) {
        result = SDL_CopyFile_REAL(fulloldpath, fullnewpath);
    }
    SDL_free_REAL(@ptrCast(@alignCast(fulloldpath)));
    SDL_free_REAL(@ptrCast(@alignCast(fullnewpath)));
    return result;
}
pub fn GENERIC_GetStorageSpaceRemaining(_: ?*anyopaque) callconv(.c) Uint64 {
    @setEvalBranchQuota(100000);
    return 18446744073709551615;
}
pub const GENERIC_title_iface: SDL_StorageInterface = SDL_StorageInterface{
    .version = @truncate(@sizeOf(SDL_StorageInterface)),
    .close = GENERIC_CloseStorage,
    .ready = null,
    .enumerate = GENERIC_EnumerateStorageDirectory,
    .info = GENERIC_GetStoragePathInfo,
    .read_file = GENERIC_ReadStorageFile,
    .write_file = null,
    .mkdir = null,
    .remove = null,
    .rename = null,
    .copy = null,
    .space_remaining = null,
};
pub fn GENERIC_Title_Create(override: [*c]const u8, _: SDL_PropertiesID) callconv(.c) ?*SDL_Storage {
    @setEvalBranchQuota(100000);
    var result: ?*SDL_Storage = null;
    _ = &result;
    var basepath: [*c]u8 = null;
    _ = &basepath;
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(override)))) != @as(?*anyopaque, null)) {
        const slen: usize = SDL_strlen_REAL(override);
        _ = &slen;
        if (slen > @as(usize, 0)) {
            const need_sep: bool = (@as(c_int, override[slen -% @as(usize, 1)]) != @as(c_int, '/')) and (@as(c_int, override[slen -% @as(usize, 1)]) != @as(c_int, '\\'));
            _ = &need_sep;
            if (SDL_asprintf_REAL(&basepath, "%s%s", override, if (need_sep) @as([*c]u8, @as([*c]u8, @constCast("/"))) else @as([*c]u8, @as([*c]u8, @constCast("")))) == -@as(c_int, 1)) {
                return null;
            }
        } else {
            basepath = SDL_strdup_REAL("");
        }
    } else {
        var base: [*c]const u8 = SDL_GetBasePath_REAL();
        _ = &base;
        basepath = @ptrCast(@alignCast(if (base != null) @as(?*anyopaque, @ptrCast(@alignCast(SDL_strdup_REAL(base)))) else @as(?*anyopaque, null)));
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(basepath))) != @as(?*anyopaque, null)) {
        result = SDL_OpenStorage_REAL(&GENERIC_title_iface, @ptrCast(@alignCast(basepath)));
        if (@as(?*anyopaque, @ptrCast(@alignCast(result))) == @as(?*anyopaque, null)) {
            SDL_free_REAL(@ptrCast(@alignCast(basepath)));
        }
    }
    return result;
}
pub export var GENERIC_titlebootstrap: TitleStorageBootStrap = TitleStorageBootStrap{
    .name = "generic",
    .desc = "SDL generic title storage driver",
    .create = GENERIC_Title_Create,
};
pub const GENERIC_user_iface: SDL_StorageInterface = SDL_StorageInterface{
    .version = @truncate(@sizeOf(SDL_StorageInterface)),
    .close = GENERIC_CloseStorage,
    .ready = null,
    .enumerate = GENERIC_EnumerateStorageDirectory,
    .info = GENERIC_GetStoragePathInfo,
    .read_file = GENERIC_ReadStorageFile,
    .write_file = GENERIC_WriteStorageFile,
    .mkdir = GENERIC_CreateStorageDirectory,
    .remove = GENERIC_RemoveStoragePath,
    .rename = GENERIC_RenameStoragePath,
    .copy = GENERIC_CopyStorageFile,
    .space_remaining = GENERIC_GetStorageSpaceRemaining,
};
pub fn GENERIC_User_Create(org: [*c]const u8, app: [*c]const u8, _: SDL_PropertiesID) callconv(.c) ?*SDL_Storage {
    @setEvalBranchQuota(100000);
    var result: ?*SDL_Storage = undefined;
    _ = &result;
    var prefpath: [*c]u8 = SDL_GetPrefPath_REAL(org, app);
    _ = &prefpath;
    if (@as(?*anyopaque, @ptrCast(@alignCast(prefpath))) == @as(?*anyopaque, null)) {
        return null;
    }
    result = SDL_OpenStorage_REAL(&GENERIC_user_iface, @ptrCast(@alignCast(prefpath)));
    if (@as(?*anyopaque, @ptrCast(@alignCast(result))) == @as(?*anyopaque, null)) {
        SDL_free_REAL(@ptrCast(@alignCast(prefpath)));
    }
    return result;
}
pub export var GENERIC_userbootstrap: UserStorageBootStrap = UserStorageBootStrap{
    .name = "generic",
    .desc = "SDL generic user storage driver",
    .create = GENERIC_User_Create,
};
pub const GENERIC_file_iface: SDL_StorageInterface = SDL_StorageInterface{
    .version = @truncate(@sizeOf(SDL_StorageInterface)),
    .close = GENERIC_CloseStorage,
    .ready = null,
    .enumerate = GENERIC_EnumerateStorageDirectory,
    .info = GENERIC_GetStoragePathInfo,
    .read_file = GENERIC_ReadStorageFile,
    .write_file = GENERIC_WriteStorageFile,
    .mkdir = GENERIC_CreateStorageDirectory,
    .remove = GENERIC_RemoveStoragePath,
    .rename = GENERIC_RenameStoragePath,
    .copy = GENERIC_CopyStorageFile,
    .space_remaining = GENERIC_GetStorageSpaceRemaining,
};
pub export fn GENERIC_OpenFileStorage(arg_path: [*c]const u8) ?*SDL_Storage {
    @setEvalBranchQuota(100000);
    var path = arg_path;
    _ = &path;
    var result: ?*SDL_Storage = undefined;
    _ = &result;
    var basepath: [*c]u8 = null;
    _ = &basepath;
    var prepend: [*c]u8 = null;
    _ = &prepend;
    if (!(path != null) or !(@as(c_int, path.*) != 0)) {
        path = "/";
    }
    var is_absolute: bool = @"false" != 0;
    _ = &is_absolute;
    is_absolute = @as(c_int, path[@as(c_int, 0)]) == @as(c_int, '/');
    if (!is_absolute) {
        prepend = SDL_GetCurrentDirectory_REAL();
        if (!(prepend != null)) {
            return null;
        }
    }
    const len: usize = SDL_strlen_REAL(path);
    _ = &len;
    var appended_separator: [*c]const u8 = "";
    _ = &appended_separator;
    if (@as(c_int, path[len -% @as(usize, 1)]) != @as(c_int, '/')) {
        appended_separator = "/";
    }
    const rc: c_int = SDL_asprintf_REAL(&basepath, "%s%s%s", if (prepend != null) prepend else @as([*c]u8, @as([*c]u8, @constCast(""))), path, appended_separator);
    _ = &rc;
    SDL_free_REAL(@ptrCast(@alignCast(prepend)));
    if (rc < @as(c_int, 0)) {
        return null;
    }
    result = SDL_OpenStorage_REAL(&GENERIC_file_iface, @ptrCast(@alignCast(basepath)));
    if (@as(?*anyopaque, @ptrCast(@alignCast(result))) == @as(?*anyopaque, null)) {
        SDL_free_REAL(@ptrCast(@alignCast(basepath)));
    }
    return result;
}

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
