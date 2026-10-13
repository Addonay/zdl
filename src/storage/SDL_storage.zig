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
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
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
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_strlen_REAL(str: [*c]const u8) usize;
pub extern fn SDL_strchr_REAL(str: [*c]const u8, c: c_int) [*c]u8;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_strncmp_REAL(str1: [*c]const u8, str2: [*c]const u8, maxlen: usize) c_int;
pub extern fn SDL_strncasecmp_REAL(str1: [*c]const u8, str2: [*c]const u8, maxlen: usize) c_int;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_PropertiesID = Uint32;
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
pub const enum_SDL_EnumerationResult = c_uint;
pub const SDL_EnumerationResult = enum_SDL_EnumerationResult;
pub const SDL_EnumerateDirectoryCallback = ?*const fn (userdata: ?*anyopaque, dirname: [*c]const u8, fname: [*c]const u8) callconv(.c) SDL_EnumerationResult;
pub extern fn SDL_GetHint_REAL(name: [*c]const u8) [*c]const u8;
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
pub const struct_SDL_Storage = extern struct {
    iface: SDL_StorageInterface = @import("std").mem.zeroes(SDL_StorageInterface),
    userdata: ?*anyopaque = null,
};
pub const SDL_Storage = struct_SDL_Storage;
pub extern fn SDL_DebugLogBackend(subsystem: [*c]const u8, backend: [*c]const u8) void;
pub const struct_TitleStorageBootStrap = extern struct {
    name: [*c]const u8 = null,
    desc: [*c]const u8 = null,
    create: ?*const fn ([*c]const u8, SDL_PropertiesID) callconv(.c) [*c]SDL_Storage = null,
};
pub const TitleStorageBootStrap = struct_TitleStorageBootStrap;
pub const struct_UserStorageBootStrap = extern struct {
    name: [*c]const u8 = null,
    desc: [*c]const u8 = null,
    create: ?*const fn ([*c]const u8, [*c]const u8, SDL_PropertiesID) callconv(.c) [*c]SDL_Storage = null,
};
pub const UserStorageBootStrap = struct_UserStorageBootStrap;
pub extern var GENERIC_titlebootstrap: TitleStorageBootStrap;
pub extern var GENERIC_userbootstrap: UserStorageBootStrap;
pub extern var STEAM_userbootstrap: UserStorageBootStrap;
pub extern fn GENERIC_OpenFileStorage(path: [*c]const u8) [*c]SDL_Storage;
pub const SDL_GlobEnumeratorFunc = ?*const fn (path: [*c]const u8, cb: SDL_EnumerateDirectoryCallback, cbuserdata: ?*anyopaque, userdata: ?*anyopaque) callconv(.c) bool;
pub const SDL_GlobGetPathInfoFunc = ?*const fn (path: [*c]const u8, info: [*c]SDL_PathInfo, userdata: ?*anyopaque) callconv(.c) bool;
pub extern fn SDL_InternalGlobDirectory(path: [*c]const u8, pattern: [*c]const u8, flags: SDL_GlobFlags, count: [*c]c_int, enumerator: SDL_GlobEnumeratorFunc, getpathinfo: SDL_GlobGetPathInfoFunc, userdata: ?*anyopaque) [*c][*c]u8;
pub var titlebootstrap: [2][*c]TitleStorageBootStrap = [2][*c]TitleStorageBootStrap{
    &GENERIC_titlebootstrap,
    null,
};
pub var userbootstrap: [3][*c]UserStorageBootStrap = [3][*c]UserStorageBootStrap{
    &STEAM_userbootstrap,
    &GENERIC_userbootstrap,
    null,
};
pub fn ValidateStoragePath(path: [*c]const u8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (SDL_strchr_REAL(path, '\\') != null) {
        return SDL_SetError_REAL("Windows-style path separators ('\\') not permitted, use '/' instead.");
    }
    var ptr: [*c]const u8 = undefined;
    _ = &ptr;
    var prev: [*c]const u8 = path;
    _ = &prev;
    while (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(blk: {
        const tmp = SDL_strchr_REAL(prev, '/');
        ptr = tmp;
        break :blk tmp;
    })))) != @as(?*anyopaque, null)) {
        if ((SDL_strncmp_REAL(prev, "./", 2) == @as(c_int, 0)) or (SDL_strncmp_REAL(prev, "../", 3) == @as(c_int, 0))) {
            return SDL_SetError_REAL("Relative paths not permitted");
        }
        prev = ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
    }
    if ((SDL_strcmp_REAL(prev, ".") == @as(c_int, 0)) or (SDL_strcmp_REAL(prev, "..") == @as(c_int, 0))) {
        return SDL_SetError_REAL("Relative paths not permitted");
    }
    return @"true" != 0;
}
pub export fn SDL_OpenTitleStorage_REAL(override: [*c]const u8, props: SDL_PropertiesID) [*c]SDL_Storage {
    @setEvalBranchQuota(100000);
    var storage: [*c]SDL_Storage = null;
    _ = &storage;
    var i: c_int = 0;
    _ = &i;
    var driver_name: [*c]const u8 = SDL_GetHint_REAL("SDL_STORAGE_TITLE_DRIVER");
    _ = &driver_name;
    if ((driver_name != null) and (@as(c_int, driver_name.*) != @as(c_int, 0))) {
        var driver_attempt: [*c]const u8 = driver_name;
        _ = &driver_attempt;
        while (((driver_attempt != null) and (@as(c_int, driver_attempt.*) != @as(c_int, 0))) and !(storage != null)) {
            var driver_attempt_end: [*c]const u8 = SDL_strchr_REAL(driver_attempt, ',');
            _ = &driver_attempt_end;
            var driver_attempt_len: usize = if (driver_attempt_end != null) @as(usize, @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(driver_attempt_end) -% @intFromPtr(driver_attempt))), @sizeOf(u8))))) else SDL_strlen_REAL(driver_attempt);
            _ = &driver_attempt_len;
            {
                i = 0;
                while (titlebootstrap[@bitCast(@as(isize, @intCast(i)))] != null) : (i += 1) {
                    if ((driver_attempt_len == SDL_strlen_REAL(titlebootstrap[@bitCast(@as(isize, @intCast(i)))].*.name)) and (SDL_strncasecmp_REAL(titlebootstrap[@bitCast(@as(isize, @intCast(i)))].*.name, driver_attempt, driver_attempt_len) == @as(c_int, 0))) {
                        storage = titlebootstrap[@bitCast(@as(isize, @intCast(i)))].*.create.?(override, props);
                        break;
                    }
                }
            }
            driver_attempt = @ptrCast(@alignCast(if (driver_attempt_end != null) @as(?*const anyopaque, @ptrCast(@alignCast(driver_attempt_end + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))))))) else @as(?*const anyopaque, @ptrCast(@alignCast(@as(?*anyopaque, null))))));
        }
    } else {
        {
            i = 0;
            while (titlebootstrap[@bitCast(@as(isize, @intCast(i)))] != null) : (i += 1) {
                storage = titlebootstrap[@bitCast(@as(isize, @intCast(i)))].*.create.?(override, props);
                if (storage != null) {
                    break;
                }
            }
        }
    }
    if (storage != null) {
        SDL_DebugLogBackend("title_storage", titlebootstrap[@bitCast(@as(isize, @intCast(i)))].*.name);
    } else {
        if (driver_name != null) {
            _ = SDL_SetError_REAL("%s not available", driver_name);
        } else {
            _ = SDL_SetError_REAL("No available title storage driver");
        }
    }
    return storage;
}
pub export fn SDL_OpenUserStorage_REAL(org: [*c]const u8, app: [*c]const u8, props: SDL_PropertiesID) [*c]SDL_Storage {
    @setEvalBranchQuota(100000);
    var storage: [*c]SDL_Storage = null;
    _ = &storage;
    var i: c_int = 0;
    _ = &i;
    var driver_name: [*c]const u8 = SDL_GetHint_REAL("SDL_STORAGE_USER_DRIVER");
    _ = &driver_name;
    if ((driver_name != null) and (@as(c_int, driver_name.*) != @as(c_int, 0))) {
        var driver_attempt: [*c]const u8 = driver_name;
        _ = &driver_attempt;
        while (((driver_attempt != null) and (@as(c_int, driver_attempt.*) != @as(c_int, 0))) and !(storage != null)) {
            var driver_attempt_end: [*c]const u8 = SDL_strchr_REAL(driver_attempt, ',');
            _ = &driver_attempt_end;
            var driver_attempt_len: usize = if (driver_attempt_end != null) @as(usize, @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(driver_attempt_end) -% @intFromPtr(driver_attempt))), @sizeOf(u8))))) else SDL_strlen_REAL(driver_attempt);
            _ = &driver_attempt_len;
            {
                i = 0;
                while (userbootstrap[@bitCast(@as(isize, @intCast(i)))] != null) : (i += 1) {
                    if ((driver_attempt_len == SDL_strlen_REAL(userbootstrap[@bitCast(@as(isize, @intCast(i)))].*.name)) and (SDL_strncasecmp_REAL(userbootstrap[@bitCast(@as(isize, @intCast(i)))].*.name, driver_attempt, driver_attempt_len) == @as(c_int, 0))) {
                        storage = userbootstrap[@bitCast(@as(isize, @intCast(i)))].*.create.?(org, app, props);
                        break;
                    }
                }
            }
            driver_attempt = @ptrCast(@alignCast(if (driver_attempt_end != null) @as(?*const anyopaque, @ptrCast(@alignCast(driver_attempt_end + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))))))) else @as(?*const anyopaque, @ptrCast(@alignCast(@as(?*anyopaque, null))))));
        }
    } else {
        {
            i = 0;
            while (userbootstrap[@bitCast(@as(isize, @intCast(i)))] != null) : (i += 1) {
                storage = userbootstrap[@bitCast(@as(isize, @intCast(i)))].*.create.?(org, app, props);
                if (storage != null) {
                    break;
                }
            }
        }
    }
    if (storage != null) {
        SDL_DebugLogBackend("user_storage", userbootstrap[@bitCast(@as(isize, @intCast(i)))].*.name);
    } else {
        if (driver_name != null) {
            _ = SDL_SetError_REAL("%s not available", driver_name);
        } else {
            _ = SDL_SetError_REAL("No available user storage driver");
        }
    }
    return storage;
}
pub export fn SDL_OpenFileStorage_REAL(path: [*c]const u8) [*c]SDL_Storage {
    @setEvalBranchQuota(100000);
    return GENERIC_OpenFileStorage(path);
}
pub export fn SDL_OpenStorage_REAL(iface: [*c]const SDL_StorageInterface, userdata: ?*anyopaque) [*c]SDL_Storage {
    @setEvalBranchQuota(100000);
    var storage: [*c]SDL_Storage = undefined;
    _ = &storage;
    if (!(iface != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("iface"))));
        return null;
    }
    if (@as(c_ulong, iface.*.version) < @sizeOf(@TypeOf(iface.*))) {
        _ = SDL_SetError_REAL("Invalid interface, should be initialized with SDL_INIT_INTERFACE()");
        return null;
    }
    storage = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(storage.*)))));
    if (storage != null) {
        {
            comptime {
                if (!(@sizeOf(@TypeOf((&storage.*.iface).*)) == @sizeOf(@TypeOf(iface.*)))) @compileError("static assertion failed \"sizeof (*(&storage->iface)) == sizeof (*( iface))\"");
            }
        }
        _ = memcpy(@ptrCast(@alignCast(&storage.*.iface)), @ptrCast(@alignCast(iface)), @sizeOf(@TypeOf(iface.*)));
        storage.*.userdata = userdata;
    }
    return storage;
}
pub export fn SDL_CloseStorage_REAL(storage: [*c]SDL_Storage) bool {
    @setEvalBranchQuota(100000);
    var result: bool = @"true" != 0;
    _ = &result;
    if (!(storage != null)) {
        return SDL_SetError_REAL("Invalid storage container");
    }
    if (storage.*.iface.close != null) {
        result = storage.*.iface.close.?(storage.*.userdata);
    }
    SDL_free_REAL(@ptrCast(@alignCast(storage)));
    return result;
}
pub export fn SDL_StorageReady_REAL(storage: [*c]SDL_Storage) bool {
    @setEvalBranchQuota(100000);
    if (!(storage != null)) {
        _ = SDL_SetError_REAL("Invalid storage container");
        return @"false" != 0;
    }
    if (storage.*.iface.ready != null) {
        return storage.*.iface.ready.?(storage.*.userdata);
    }
    return @"true" != 0;
}
pub export fn SDL_GetStorageFileSize_REAL(storage: [*c]SDL_Storage, path: [*c]const u8, length: [*c]Uint64) bool {
    @setEvalBranchQuota(100000);
    var info: SDL_PathInfo = undefined;
    _ = &info;
    if (SDL_GetStoragePathInfo_REAL(storage, path, &info)) {
        if (length != null) {
            length.* = info.size;
        }
        return @"true" != 0;
    } else {
        if (length != null) {
            length.* = 0;
        }
        return @"false" != 0;
    }
}
pub export fn SDL_ReadStorageFile_REAL(storage: [*c]SDL_Storage, path: [*c]const u8, destination: ?*anyopaque, length: Uint64) bool {
    @setEvalBranchQuota(100000);
    if (!(storage != null)) {
        return SDL_SetError_REAL("Invalid storage container");
    }
    if (!(path != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("path"))));
    }
    if (!ValidateStoragePath(path)) {
        return @"false" != 0;
    }
    if ((length > @as(Uint64, 0)) and !(destination != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("destination"))));
    }
    if (!(storage.*.iface.read_file != null)) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    return storage.*.iface.read_file.?(storage.*.userdata, path, destination, length);
}
pub export fn SDL_WriteStorageFile_REAL(storage: [*c]SDL_Storage, path: [*c]const u8, source: ?*const anyopaque, length: Uint64) bool {
    @setEvalBranchQuota(100000);
    if (!(storage != null)) {
        return SDL_SetError_REAL("Invalid storage container");
    }
    if (!(path != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("path"))));
    }
    if (!ValidateStoragePath(path)) {
        return @"false" != 0;
    }
    if ((length > @as(Uint64, 0)) and !(source != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("source"))));
    }
    if (!(storage.*.iface.write_file != null)) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    return storage.*.iface.write_file.?(storage.*.userdata, path, source, length);
}
pub export fn SDL_CreateStorageDirectory_REAL(storage: [*c]SDL_Storage, path: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    if (!(storage != null)) {
        return SDL_SetError_REAL("Invalid storage container");
    }
    if (!(path != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("path"))));
    }
    if (!ValidateStoragePath(path)) {
        return @"false" != 0;
    }
    if (!(storage.*.iface.mkdir != null)) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    return storage.*.iface.mkdir.?(storage.*.userdata, path);
}
pub export fn SDL_EnumerateStorageDirectory_REAL(storage: [*c]SDL_Storage, arg_path: [*c]const u8, callback: SDL_EnumerateDirectoryCallback, userdata: ?*anyopaque) bool {
    @setEvalBranchQuota(100000);
    var path = arg_path;
    _ = &path;
    if (!(storage != null)) {
        return SDL_SetError_REAL("Invalid storage container");
    }
    if (!(path != null)) {
        path = "";
    }
    if (!ValidateStoragePath(path)) {
        return @"false" != 0;
    } else if (!(storage.*.iface.enumerate != null)) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    return storage.*.iface.enumerate.?(storage.*.userdata, path, callback, userdata);
}
pub export fn SDL_RemoveStoragePath_REAL(storage: [*c]SDL_Storage, path: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    if (!(storage != null)) {
        return SDL_SetError_REAL("Invalid storage container");
    }
    if (!(path != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("path"))));
    }
    if (!ValidateStoragePath(path)) {
        return @"false" != 0;
    }
    if (!(storage.*.iface.remove != null)) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    return storage.*.iface.remove.?(storage.*.userdata, path);
}
pub export fn SDL_RenameStoragePath_REAL(storage: [*c]SDL_Storage, oldpath: [*c]const u8, newpath: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    if (!(storage != null)) {
        return SDL_SetError_REAL("Invalid storage container");
    }
    if (!(oldpath != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("oldpath"))));
    }
    if (!(newpath != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("newpath"))));
    }
    if (!ValidateStoragePath(oldpath)) {
        return @"false" != 0;
    }
    if (!ValidateStoragePath(newpath)) {
        return @"false" != 0;
    }
    if (!(storage.*.iface.rename != null)) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    return storage.*.iface.rename.?(storage.*.userdata, oldpath, newpath);
}
pub export fn SDL_CopyStorageFile_REAL(storage: [*c]SDL_Storage, oldpath: [*c]const u8, newpath: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    if (!(storage != null)) {
        return SDL_SetError_REAL("Invalid storage container");
    }
    if (!(oldpath != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("oldpath"))));
    }
    if (!(newpath != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("newpath"))));
    }
    if (!ValidateStoragePath(oldpath)) {
        return @"false" != 0;
    }
    if (!ValidateStoragePath(newpath)) {
        return @"false" != 0;
    }
    if (!(storage.*.iface.copy != null)) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    return storage.*.iface.copy.?(storage.*.userdata, oldpath, newpath);
}
pub export fn SDL_GetStoragePathInfo_REAL(storage: [*c]SDL_Storage, path: [*c]const u8, arg_info: [*c]SDL_PathInfo) bool {
    @setEvalBranchQuota(100000);
    var info = arg_info;
    _ = &info;
    var dummy: SDL_PathInfo = undefined;
    _ = &dummy;
    if (!(info != null)) {
        info = &dummy;
    }
    _ = memset(@ptrCast(@alignCast(info)), 0, @sizeOf(@TypeOf(info.*)));
    if (!(storage != null)) {
        return SDL_SetError_REAL("Invalid storage container");
    }
    if (!(path != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("path"))));
    }
    if (!ValidateStoragePath(path)) {
        return @"false" != 0;
    }
    if (!(storage.*.iface.info != null)) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    return storage.*.iface.info.?(storage.*.userdata, path, info);
}
pub export fn SDL_GetStorageSpaceRemaining_REAL(storage: [*c]SDL_Storage) Uint64 {
    @setEvalBranchQuota(100000);
    if (!(storage != null)) {
        _ = SDL_SetError_REAL("Invalid storage container");
        return 0;
    }
    if (!(storage.*.iface.space_remaining != null)) {
        _ = SDL_SetError_REAL("That operation is not supported");
        return 0;
    }
    return storage.*.iface.space_remaining.?(storage.*.userdata);
}
pub fn GlobStorageDirectoryGetPathInfo(path: [*c]const u8, info: [*c]SDL_PathInfo, userdata: ?*anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_GetStoragePathInfo_REAL(@ptrCast(@alignCast(userdata)), path, info);
}
pub fn GlobStorageDirectoryEnumerator(path: [*c]const u8, cb: SDL_EnumerateDirectoryCallback, cbuserdata: ?*anyopaque, userdata: ?*anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_EnumerateStorageDirectory_REAL(@ptrCast(@alignCast(userdata)), path, cb, cbuserdata);
}
pub export fn SDL_GlobStorageDirectory_REAL(storage: [*c]SDL_Storage, arg_path: [*c]const u8, pattern: [*c]const u8, flags: SDL_GlobFlags, count: [*c]c_int) [*c][*c]u8 {
    @setEvalBranchQuota(100000);
    var path = arg_path;
    _ = &path;
    if (!(storage != null)) {
        _ = SDL_SetError_REAL("Invalid storage container");
        return null;
    }
    if (!(path != null)) {
        path = "";
    }
    if (!ValidateStoragePath(path)) {
        return null;
    }
    return SDL_InternalGlobDirectory(path, pattern, flags, count, GlobStorageDirectoryEnumerator, GlobStorageDirectoryGetPathInfo, @ptrCast(@alignCast(storage)));
}

pub const SDL_CloseStorage = SDL_CloseStorage_REAL;
pub const SDL_CopyStorageFile = SDL_CopyStorageFile_REAL;
pub const SDL_CreateStorageDirectory = SDL_CreateStorageDirectory_REAL;
pub const SDL_EnumerateStorageDirectory = SDL_EnumerateStorageDirectory_REAL;
pub const SDL_GetStorageFileSize = SDL_GetStorageFileSize_REAL;
pub const SDL_GetStoragePathInfo = SDL_GetStoragePathInfo_REAL;
pub const SDL_GetStorageSpaceRemaining = SDL_GetStorageSpaceRemaining_REAL;
pub const SDL_GlobStorageDirectory = SDL_GlobStorageDirectory_REAL;
pub const SDL_OpenFileStorage = SDL_OpenFileStorage_REAL;
pub const SDL_OpenStorage = SDL_OpenStorage_REAL;
pub const SDL_OpenTitleStorage = SDL_OpenTitleStorage_REAL;
pub const SDL_OpenUserStorage = SDL_OpenUserStorage_REAL;
pub const SDL_ReadStorageFile = SDL_ReadStorageFile_REAL;
pub const SDL_RemoveStoragePath = SDL_RemoveStoragePath_REAL;
pub const SDL_RenameStoragePath = SDL_RenameStoragePath_REAL;
pub const SDL_StorageReady = SDL_StorageReady_REAL;
pub const SDL_WriteStorageFile = SDL_WriteStorageFile_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
