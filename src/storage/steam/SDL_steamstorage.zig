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
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_strlen_REAL(str: [*c]const u8) usize;
pub extern fn SDL_strchr_REAL(str: [*c]const u8, c: c_int) [*c]u8;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_strncmp_REAL(str1: [*c]const u8, str2: [*c]const u8, maxlen: usize) c_int;
pub const SDL_FunctionPointer = ?*const fn () callconv(.c) void;
pub const struct_SDL_AtomicInt = extern struct {
    value: c_int = 0,
};
pub const SDL_AtomicInt = struct_SDL_AtomicInt;
pub extern fn SDL_AddAtomicInt_REAL(a: [*c]SDL_AtomicInt, v: c_int) c_int;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_PropertiesID = Uint32;
pub const SDL_PATHTYPE_FILE: c_int = 1;
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
pub const SDL_ENUM_SUCCESS: c_int = 1;
pub const SDL_ENUM_FAILURE: c_int = 2;
pub const enum_SDL_EnumerationResult = c_uint;
pub const SDL_EnumerationResult = enum_SDL_EnumerationResult;
pub const SDL_EnumerateDirectoryCallback = ?*const fn (userdata: ?*anyopaque, dirname: [*c]const u8, fname: [*c]const u8) callconv(.c) SDL_EnumerationResult;
pub const struct_SDL_SharedObject = opaque {
};
pub const SDL_SharedObject = struct_SDL_SharedObject;
pub extern fn SDL_LoadObject_REAL(sofile: [*c]const u8) ?*SDL_SharedObject;
pub extern fn SDL_LoadFunction_REAL(handle: ?*SDL_SharedObject, name: [*c]const u8) SDL_FunctionPointer;
pub extern fn SDL_UnloadObject_REAL(handle: ?*SDL_SharedObject) void;
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
pub const struct_UserStorageBootStrap = extern struct {
    name: [*c]const u8 = null,
    desc: [*c]const u8 = null,
    create: ?*const fn ([*c]const u8, [*c]const u8, SDL_PropertiesID) callconv(.c) ?*SDL_Storage = null,
};
pub const UserStorageBootStrap = struct_UserStorageBootStrap;
pub const steamfntype_SteamAPI_SteamRemoteStorage_v016 = ?*const fn () callconv(.c) ?*anyopaque;
pub const steamfntype_SteamAPI_ISteamRemoteStorage_IsCloudEnabledForAccount = ?*const fn (?*anyopaque) callconv(.c) bool;
pub const steamfntype_SteamAPI_ISteamRemoteStorage_IsCloudEnabledForApp = ?*const fn (?*anyopaque) callconv(.c) bool;
pub const steamfntype_SteamAPI_ISteamRemoteStorage_BeginFileWriteBatch = ?*const fn (?*anyopaque) callconv(.c) bool;
pub const steamfntype_SteamAPI_ISteamRemoteStorage_EndFileWriteBatch = ?*const fn (?*anyopaque) callconv(.c) bool;
pub const steamfntype_SteamAPI_ISteamRemoteStorage_FileExists = ?*const fn (?*anyopaque, [*c]const u8) callconv(.c) bool;
pub const steamfntype_SteamAPI_ISteamRemoteStorage_GetFileSize = ?*const fn (?*anyopaque, [*c]const u8) callconv(.c) Sint32;
pub const steamfntype_SteamAPI_ISteamRemoteStorage_GetFileTimestamp = ?*const fn (?*anyopaque, [*c]const u8) callconv(.c) Sint64;
pub const steamfntype_SteamAPI_ISteamRemoteStorage_FileRead = ?*const fn (?*anyopaque, [*c]const u8, ?*anyopaque, Sint32) callconv(.c) Sint32;
pub const steamfntype_SteamAPI_ISteamRemoteStorage_FileWrite = ?*const fn (?*anyopaque, [*c]const u8, ?*const anyopaque, Sint32) callconv(.c) Sint32;
pub const steamfntype_SteamAPI_ISteamRemoteStorage_FileDelete = ?*const fn (?*anyopaque, [*c]const u8) callconv(.c) bool;
pub const steamfntype_SteamAPI_ISteamRemoteStorage_GetQuota = ?*const fn (?*anyopaque, [*c]Uint64, [*c]Uint64) callconv(.c) bool;
pub const steamfntype_SteamAPI_ISteamRemoteStorage_GetFileCount = ?*const fn (?*anyopaque) callconv(.c) Sint32;
pub const steamfntype_SteamAPI_ISteamRemoteStorage_GetFileNameAndSize = ?*const fn (?*anyopaque, c_int, [*c]Sint32) callconv(.c) [*c]const u8;
pub const struct_STEAM_RemoteStorage = extern struct {
    libsteam_api: ?*SDL_SharedObject = null,
    SteamAPI_SteamRemoteStorage_v016: steamfntype_SteamAPI_SteamRemoteStorage_v016 = null,
    SteamAPI_ISteamRemoteStorage_IsCloudEnabledForAccount: steamfntype_SteamAPI_ISteamRemoteStorage_IsCloudEnabledForAccount = null,
    SteamAPI_ISteamRemoteStorage_IsCloudEnabledForApp: steamfntype_SteamAPI_ISteamRemoteStorage_IsCloudEnabledForApp = null,
    SteamAPI_ISteamRemoteStorage_BeginFileWriteBatch: steamfntype_SteamAPI_ISteamRemoteStorage_BeginFileWriteBatch = null,
    SteamAPI_ISteamRemoteStorage_EndFileWriteBatch: steamfntype_SteamAPI_ISteamRemoteStorage_EndFileWriteBatch = null,
    SteamAPI_ISteamRemoteStorage_FileExists: steamfntype_SteamAPI_ISteamRemoteStorage_FileExists = null,
    SteamAPI_ISteamRemoteStorage_GetFileSize: steamfntype_SteamAPI_ISteamRemoteStorage_GetFileSize = null,
    SteamAPI_ISteamRemoteStorage_GetFileTimestamp: steamfntype_SteamAPI_ISteamRemoteStorage_GetFileTimestamp = null,
    SteamAPI_ISteamRemoteStorage_FileRead: steamfntype_SteamAPI_ISteamRemoteStorage_FileRead = null,
    SteamAPI_ISteamRemoteStorage_FileWrite: steamfntype_SteamAPI_ISteamRemoteStorage_FileWrite = null,
    SteamAPI_ISteamRemoteStorage_FileDelete: steamfntype_SteamAPI_ISteamRemoteStorage_FileDelete = null,
    SteamAPI_ISteamRemoteStorage_GetQuota: steamfntype_SteamAPI_ISteamRemoteStorage_GetQuota = null,
    SteamAPI_ISteamRemoteStorage_GetFileCount: steamfntype_SteamAPI_ISteamRemoteStorage_GetFileCount = null,
    SteamAPI_ISteamRemoteStorage_GetFileNameAndSize: steamfntype_SteamAPI_ISteamRemoteStorage_GetFileNameAndSize = null,
};
pub const STEAM_RemoteStorage = struct_STEAM_RemoteStorage;
pub var SDL_steam_storage_refcount: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt);
pub fn STEAM_CloseStorage(userdata: ?*anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var result: bool = @"true" != 0;
    _ = &result;
    var steam: [*c]STEAM_RemoteStorage = @ptrCast(@alignCast(userdata));
    _ = &steam;
    var steamremotestorage: ?*anyopaque = steam.*.SteamAPI_SteamRemoteStorage_v016.?();
    _ = &steamremotestorage;
    var end_batch: bool = SDL_AddAtomicInt_REAL(&SDL_steam_storage_refcount, -@as(c_int, 1)) == @as(c_int, 1);
    _ = &end_batch;
    if (steamremotestorage == @as(?*anyopaque, null)) {
        result = SDL_SetError_REAL("SteamRemoteStorage unavailable");
    } else if (end_batch) {
        if (!steam.*.SteamAPI_ISteamRemoteStorage_EndFileWriteBatch.?(steamremotestorage)) {
            result = SDL_SetError_REAL("SteamRemoteStorage()->EndFileWriteBatch() failed");
        }
    }
    SDL_UnloadObject_REAL(steam.*.libsteam_api);
    SDL_free_REAL(@ptrCast(@alignCast(steam)));
    return result;
}
pub fn STEAM_StorageReady(_: ?*anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return @"true" != 0;
}
pub fn GetNormalizedStoragePath(arg_path: [*c]const u8, add_separator: bool) callconv(.c) [*c]u8 {
    @setEvalBranchQuota(100000);
    var path = arg_path;
    _ = &path;
    if (SDL_strcmp_REAL(path, ".") == @as(c_int, 0)) {
        path = "";
    } else {
        while (@as(c_int, path.*) == @as(c_int, '/')) {
            path += 1;
        }
    }
    var pathlen: usize = SDL_strlen_REAL(path);
    _ = &pathlen;
    while ((pathlen > @as(usize, 0)) and (@as(c_int, path[pathlen -% @as(usize, 1)]) == @as(c_int, '/'))) {
        pathlen -%= 1;
    }
    var normalized: [*c]u8 = @ptrCast(@alignCast(SDL_malloc_REAL((pathlen +% @as(usize, @bitCast(@as(c_long, @as(c_int, @intFromBool(add_separator)))))) +% @as(usize, 1))));
    _ = &normalized;
    if (normalized != null) {
        _ = memcpy(@ptrCast(@alignCast(normalized)), @ptrCast(@alignCast(path)), pathlen);
        if (add_separator) {
            normalized[
                blk: {
                    const ref = &pathlen;
                    const tmp = ref.*;
                    ref.* +%= 1;
                    break :blk tmp;
                }
            ] = '/';
        }
        normalized[pathlen] = '\x00';
    }
    return normalized;
}
pub fn STEAM_EnumerateStorageDirectory(userdata: ?*anyopaque, path: [*c]const u8, callback: SDL_EnumerateDirectoryCallback, callback_userdata: ?*anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var result: bool = undefined;
    _ = &result;
    var steam: [*c]STEAM_RemoteStorage = undefined;
    _ = &steam;
    var steamremotestorage: ?*anyopaque = undefined;
    _ = &steamremotestorage;
    var dirname: [*c]u8 = undefined;
    _ = &dirname;
    var dirlen: usize = undefined;
    _ = &dirlen;
    var done: bool = undefined;
    _ = &done;
    var count: Sint32 = undefined;
    _ = &count;
    var i: Sint32 = undefined;
    _ = &i;
    var file: [*c]const u8 = undefined;
    _ = &file;
    var fname: [*c]const u8 = undefined;
    _ = &fname;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                result = @"true" != 0;
                steam = @ptrCast(@alignCast(userdata));
                steamremotestorage = steam.*.SteamAPI_SteamRemoteStorage_v016.?();
                if (steamremotestorage == @as(?*anyopaque, null)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return SDL_SetError_REAL("SteamRemoteStorage unavailable");
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                dirname = GetNormalizedStoragePath(path, @"true" != 0);
                if (!(dirname != null)) {
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
                dirlen = SDL_strlen_REAL(dirname);
                done = @"false" != 0;
                count = steam.*.SteamAPI_ISteamRemoteStorage_GetFileCount.?(steamremotestorage);
                i = count;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                if (((blk: {
                    const ref = &i;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) and !done) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
            },
            8 => {
                file = steam.*.SteamAPI_ISteamRemoteStorage_GetFileNameAndSize.?(steamremotestorage, i, null);
                if (!(file != null)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            9 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            10 => {
                SDL_free_REAL(@ptrCast(@alignCast(dirname)));
                return result;
            },
            11 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                if (dirlen > @as(usize, 1)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                if (SDL_strncmp_REAL(dirname, file, dirlen) != @as(c_int, 0)) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            15 => {
                fname = file;
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                if (@as(?*anyopaque, @ptrCast(@alignCast(SDL_strchr_REAL(fname, '/')))) != @as(?*anyopaque, null)) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 9;
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
                fname = file + dirlen;
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            20 => {
                {
                    sdl_pc = 9;
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
                switch (callback.?(callback_userdata, dirname, fname)) {
                    @as(SDL_EnumerationResult, SDL_ENUM_SUCCESS) => {
                        sdl_pc = 24;
                        continue;
                    },
                    @as(SDL_EnumerationResult, SDL_ENUM_FAILURE) => {
                        sdl_pc = 25;
                        continue;
                    },
                    else => {
                        sdl_pc = 26;
                        continue;
                    },
                }
            },
            23 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            24 => {
                done = @"true" != 0;
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            25 => {
                result = @"false" != 0;
                done = @"true" != 0;
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            26 => {
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn STEAM_GetStoragePathInfo(userdata: ?*anyopaque, path: [*c]const u8, info: [*c]SDL_PathInfo) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var steam: [*c]STEAM_RemoteStorage = @ptrCast(@alignCast(userdata));
    _ = &steam;
    var steamremotestorage: ?*anyopaque = steam.*.SteamAPI_SteamRemoteStorage_v016.?();
    _ = &steamremotestorage;
    if (steamremotestorage == @as(?*anyopaque, null)) {
        return SDL_SetError_REAL("SteamRemoteStorage unavailable");
    }
    if (!steam.*.SteamAPI_ISteamRemoteStorage_FileExists.?(steamremotestorage, path)) {
        return SDL_SetError_REAL("Can't stat");
    }
    if (info != null) {
        _ = memset(@ptrCast(@alignCast(info)), 0, @sizeOf(@TypeOf(info.*)));
        info.*.type = SDL_PATHTYPE_FILE;
        info.*.size = @bitCast(@as(c_long, steam.*.SteamAPI_ISteamRemoteStorage_GetFileSize.?(steamremotestorage, path)));
        var mtime: Sint64 = steam.*.SteamAPI_ISteamRemoteStorage_GetFileTimestamp.?(steamremotestorage, path);
        _ = &mtime;
        info.*.modify_time = @bitCast(@as(c_ulong, @truncate(@as(c_ulonglong, @as(Uint64, @bitCast(@as(c_long, mtime)))) *% @as(c_ulonglong, SDL_NS_PER_SECOND))));
    }
    return @"true" != 0;
}
pub fn STEAM_ReadStorageFile(userdata: ?*anyopaque, path: [*c]const u8, destination: ?*anyopaque, length: Uint64) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var result: bool = @"false" != 0;
    _ = &result;
    var steam: [*c]STEAM_RemoteStorage = @ptrCast(@alignCast(userdata));
    _ = &steam;
    var steamremotestorage: ?*anyopaque = steam.*.SteamAPI_SteamRemoteStorage_v016.?();
    _ = &steamremotestorage;
    if (steamremotestorage == @as(?*anyopaque, null)) {
        return SDL_SetError_REAL("SteamRemoteStorage unavailable");
    }
    if (length > @as(Uint64, @bitCast(@as(c_long, @as(c_int, 2147483647))))) {
        return SDL_SetError_REAL("SteamRemoteStorage only supports INT32_MAX read size");
    }
    if (@as(Uint64, @bitCast(@as(c_long, steam.*.SteamAPI_ISteamRemoteStorage_FileRead.?(steamremotestorage, path, destination, @bitCast(@as(c_uint, @truncate(length))))))) == length) {
        result = @"true" != 0;
    } else {
        _ = SDL_SetError_REAL("SteamRemoteStorage()->FileRead() failed");
    }
    return result;
}
pub fn STEAM_WriteStorageFile(userdata: ?*anyopaque, path: [*c]const u8, source: ?*const anyopaque, length: Uint64) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var result: bool = @"false" != 0;
    _ = &result;
    var steam: [*c]STEAM_RemoteStorage = @ptrCast(@alignCast(userdata));
    _ = &steam;
    var steamremotestorage: ?*anyopaque = steam.*.SteamAPI_SteamRemoteStorage_v016.?();
    _ = &steamremotestorage;
    if (steamremotestorage == @as(?*anyopaque, null)) {
        return SDL_SetError_REAL("SteamRemoteStorage unavailable");
    }
    if (length > @as(Uint64, @bitCast(@as(c_long, @as(c_int, 2147483647))))) {
        return SDL_SetError_REAL("SteamRemoteStorage only supports INT32_MAX write size");
    }
    if (steam.*.SteamAPI_ISteamRemoteStorage_FileWrite.?(steamremotestorage, path, source, @bitCast(@as(c_uint, @truncate(length)))) != 0) {
        result = @"true" != 0;
    } else {
        _ = SDL_SetError_REAL("SteamRemoteStorage()->FileWrite() failed");
    }
    return result;
}
pub fn STEAM_RemoveStoragePath(userdata: ?*anyopaque, path: [*c]const u8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var steam: [*c]STEAM_RemoteStorage = @ptrCast(@alignCast(userdata));
    _ = &steam;
    var steamremotestorage: ?*anyopaque = steam.*.SteamAPI_SteamRemoteStorage_v016.?();
    _ = &steamremotestorage;
    if (steamremotestorage == @as(?*anyopaque, null)) {
        return SDL_SetError_REAL("SteamRemoteStorage unavailable");
    }
    if (!steam.*.SteamAPI_ISteamRemoteStorage_FileDelete.?(steamremotestorage, path)) {
        return SDL_SetError_REAL("SteamRemoteStorage()->FileDelete() failed");
    }
    return @"true" != 0;
}
pub fn STEAM_GetStorageSpaceRemaining(userdata: ?*anyopaque) callconv(.c) Uint64 {
    @setEvalBranchQuota(100000);
    var total: Uint64 = undefined;
    _ = &total;
    var remaining: Uint64 = undefined;
    _ = &remaining;
    var steam: [*c]STEAM_RemoteStorage = @ptrCast(@alignCast(userdata));
    _ = &steam;
    var steamremotestorage: ?*anyopaque = steam.*.SteamAPI_SteamRemoteStorage_v016.?();
    _ = &steamremotestorage;
    if (steamremotestorage == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("SteamRemoteStorage unavailable");
        return 0;
    }
    if (!steam.*.SteamAPI_ISteamRemoteStorage_GetQuota.?(steamremotestorage, &total, &remaining)) {
        _ = SDL_SetError_REAL("SteamRemoteStorage()->GetQuota() failed");
        return 0;
    }
    return remaining;
}
pub const STEAM_user_iface: SDL_StorageInterface = SDL_StorageInterface{
    .version = @truncate(@sizeOf(SDL_StorageInterface)),
    .close = STEAM_CloseStorage,
    .ready = STEAM_StorageReady,
    .enumerate = STEAM_EnumerateStorageDirectory,
    .info = STEAM_GetStoragePathInfo,
    .read_file = STEAM_ReadStorageFile,
    .write_file = STEAM_WriteStorageFile,
    .mkdir = null,
    .remove = STEAM_RemoveStoragePath,
    .rename = null,
    .copy = null,
    .space_remaining = STEAM_GetStorageSpaceRemaining,
};
pub fn STEAM_User_Create(_: [*c]const u8, _: [*c]const u8, _: SDL_PropertiesID) callconv(.c) ?*SDL_Storage {
    @setEvalBranchQuota(100000);
    var result: ?*SDL_Storage = undefined;
    _ = &result;
    var steam: [*c]STEAM_RemoteStorage = undefined;
    _ = &steam;
    var steamremotestorage: ?*anyopaque = undefined;
    _ = &steamremotestorage;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                steam = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(STEAM_RemoteStorage))));
                if (@as(?*anyopaque, @ptrCast(@alignCast(steam))) == @as(?*anyopaque, null)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                SDL_UnloadObject_REAL(steam.*.libsteam_api);
                SDL_free_REAL(@ptrCast(@alignCast(steam)));
                return null;
            },
            2 => {
                return null;
            },
            3 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                steam.*.libsteam_api = SDL_LoadObject_REAL("libsteam_api.so");
                if (@as(?*anyopaque, @ptrCast(@alignCast(steam.*.libsteam_api))) == @as(?*anyopaque, null)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                SDL_free_REAL(@ptrCast(@alignCast(steam)));
                return null;
            },
            6 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                steam.*.SteamAPI_SteamRemoteStorage_v016 = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(steam.*.libsteam_api, "SteamAPI_SteamRemoteStorage_v016"))));
                if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(steam.*.SteamAPI_SteamRemoteStorage_v016)))) == @as(?*anyopaque, null)) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                _ = SDL_SetError_REAL("Could not load function SteamAPI_SteamRemoteStorage_v016");
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
                steam.*.SteamAPI_ISteamRemoteStorage_IsCloudEnabledForAccount = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(steam.*.libsteam_api, "SteamAPI_ISteamRemoteStorage_IsCloudEnabledForAccount"))));
                if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(steam.*.SteamAPI_ISteamRemoteStorage_IsCloudEnabledForAccount)))) == @as(?*anyopaque, null)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                _ = SDL_SetError_REAL("Could not load function SteamAPI_ISteamRemoteStorage_IsCloudEnabledForAccount");
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                steam.*.SteamAPI_ISteamRemoteStorage_IsCloudEnabledForApp = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(steam.*.libsteam_api, "SteamAPI_ISteamRemoteStorage_IsCloudEnabledForApp"))));
                if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(steam.*.SteamAPI_ISteamRemoteStorage_IsCloudEnabledForApp)))) == @as(?*anyopaque, null)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                _ = SDL_SetError_REAL("Could not load function SteamAPI_ISteamRemoteStorage_IsCloudEnabledForApp");
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
                steam.*.SteamAPI_ISteamRemoteStorage_BeginFileWriteBatch = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(steam.*.libsteam_api, "SteamAPI_ISteamRemoteStorage_BeginFileWriteBatch"))));
                if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(steam.*.SteamAPI_ISteamRemoteStorage_BeginFileWriteBatch)))) == @as(?*anyopaque, null)) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            17 => {
                _ = SDL_SetError_REAL("Could not load function SteamAPI_ISteamRemoteStorage_BeginFileWriteBatch");
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
                steam.*.SteamAPI_ISteamRemoteStorage_EndFileWriteBatch = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(steam.*.libsteam_api, "SteamAPI_ISteamRemoteStorage_EndFileWriteBatch"))));
                if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(steam.*.SteamAPI_ISteamRemoteStorage_EndFileWriteBatch)))) == @as(?*anyopaque, null)) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                _ = SDL_SetError_REAL("Could not load function SteamAPI_ISteamRemoteStorage_EndFileWriteBatch");
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
                steam.*.SteamAPI_ISteamRemoteStorage_FileExists = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(steam.*.libsteam_api, "SteamAPI_ISteamRemoteStorage_FileExists"))));
                if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(steam.*.SteamAPI_ISteamRemoteStorage_FileExists)))) == @as(?*anyopaque, null)) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                _ = SDL_SetError_REAL("Could not load function SteamAPI_ISteamRemoteStorage_FileExists");
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
                steam.*.SteamAPI_ISteamRemoteStorage_GetFileSize = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(steam.*.libsteam_api, "SteamAPI_ISteamRemoteStorage_GetFileSize"))));
                if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(steam.*.SteamAPI_ISteamRemoteStorage_GetFileSize)))) == @as(?*anyopaque, null)) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            26 => {
                _ = SDL_SetError_REAL("Could not load function SteamAPI_ISteamRemoteStorage_GetFileSize");
                {
                    sdl_pc = 1;
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
                steam.*.SteamAPI_ISteamRemoteStorage_GetFileTimestamp = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(steam.*.libsteam_api, "SteamAPI_ISteamRemoteStorage_GetFileTimestamp"))));
                if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(steam.*.SteamAPI_ISteamRemoteStorage_GetFileTimestamp)))) == @as(?*anyopaque, null)) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            29 => {
                _ = SDL_SetError_REAL("Could not load function SteamAPI_ISteamRemoteStorage_GetFileTimestamp");
                {
                    sdl_pc = 1;
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
                steam.*.SteamAPI_ISteamRemoteStorage_FileRead = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(steam.*.libsteam_api, "SteamAPI_ISteamRemoteStorage_FileRead"))));
                if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(steam.*.SteamAPI_ISteamRemoteStorage_FileRead)))) == @as(?*anyopaque, null)) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            32 => {
                _ = SDL_SetError_REAL("Could not load function SteamAPI_ISteamRemoteStorage_FileRead");
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            33 => {
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            34 => {
                steam.*.SteamAPI_ISteamRemoteStorage_FileWrite = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(steam.*.libsteam_api, "SteamAPI_ISteamRemoteStorage_FileWrite"))));
                if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(steam.*.SteamAPI_ISteamRemoteStorage_FileWrite)))) == @as(?*anyopaque, null)) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            35 => {
                _ = SDL_SetError_REAL("Could not load function SteamAPI_ISteamRemoteStorage_FileWrite");
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            36 => {
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            37 => {
                steam.*.SteamAPI_ISteamRemoteStorage_FileDelete = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(steam.*.libsteam_api, "SteamAPI_ISteamRemoteStorage_FileDelete"))));
                if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(steam.*.SteamAPI_ISteamRemoteStorage_FileDelete)))) == @as(?*anyopaque, null)) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
                    continue;
                }
            },
            38 => {
                _ = SDL_SetError_REAL("Could not load function SteamAPI_ISteamRemoteStorage_FileDelete");
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
                steam.*.SteamAPI_ISteamRemoteStorage_GetQuota = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(steam.*.libsteam_api, "SteamAPI_ISteamRemoteStorage_GetQuota"))));
                if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(steam.*.SteamAPI_ISteamRemoteStorage_GetQuota)))) == @as(?*anyopaque, null)) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            41 => {
                _ = SDL_SetError_REAL("Could not load function SteamAPI_ISteamRemoteStorage_GetQuota");
                {
                    sdl_pc = 1;
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
                steam.*.SteamAPI_ISteamRemoteStorage_GetFileCount = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(steam.*.libsteam_api, "SteamAPI_ISteamRemoteStorage_GetFileCount"))));
                if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(steam.*.SteamAPI_ISteamRemoteStorage_GetFileCount)))) == @as(?*anyopaque, null)) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            44 => {
                _ = SDL_SetError_REAL("Could not load function SteamAPI_ISteamRemoteStorage_GetFileCount");
                {
                    sdl_pc = 1;
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
                steam.*.SteamAPI_ISteamRemoteStorage_GetFileNameAndSize = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(steam.*.libsteam_api, "SteamAPI_ISteamRemoteStorage_GetFileNameAndSize"))));
                if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(steam.*.SteamAPI_ISteamRemoteStorage_GetFileNameAndSize)))) == @as(?*anyopaque, null)) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            47 => {
                _ = SDL_SetError_REAL("Could not load function SteamAPI_ISteamRemoteStorage_GetFileNameAndSize");
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            48 => {
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            49 => {
                steamremotestorage = steam.*.SteamAPI_SteamRemoteStorage_v016.?();
                if (steamremotestorage == @as(?*anyopaque, null)) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            50 => {
                _ = SDL_SetError_REAL("SteamRemoteStorage unavailable");
                {
                    sdl_pc = 1;
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
                if (!steam.*.SteamAPI_ISteamRemoteStorage_IsCloudEnabledForAccount.?(steamremotestorage)) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 54;
                    continue;
                }
            },
            53 => {
                _ = SDL_SetError_REAL("Steam cloud is disabled for this user");
                {
                    sdl_pc = 1;
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
                if (!steam.*.SteamAPI_ISteamRemoteStorage_IsCloudEnabledForApp.?(steamremotestorage)) {
                    sdl_pc = 56;
                    continue;
                } else {
                    sdl_pc = 57;
                    continue;
                }
            },
            56 => {
                _ = SDL_SetError_REAL("Steam cloud is disabled for this application");
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            57 => {
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            58 => {
                result = SDL_OpenStorage_REAL(&STEAM_user_iface, @ptrCast(@alignCast(steam)));
                if (!(result != null)) {
                    sdl_pc = 59;
                    continue;
                } else {
                    sdl_pc = 60;
                    continue;
                }
            },
            59 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            60 => {
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            61 => {
                if (SDL_AddAtomicInt_REAL(&SDL_steam_storage_refcount, 1) == @as(c_int, 0)) {
                    sdl_pc = 62;
                    continue;
                } else {
                    sdl_pc = 63;
                    continue;
                }
            },
            62 => {
                if (!steam.*.SteamAPI_ISteamRemoteStorage_BeginFileWriteBatch.?(steamremotestorage)) {
                    sdl_pc = 65;
                    continue;
                } else {
                    sdl_pc = 66;
                    continue;
                }
            },
            63 => {
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            64 => {
                return result;
            },
            65 => {
                {
                    sdl_pc = 67;
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
                    sdl_pc = 64;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export var STEAM_userbootstrap: UserStorageBootStrap = UserStorageBootStrap{
    .name = "steam",
    .desc = "SDL Steam user storage driver",
    .create = STEAM_User_Create,
};

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_NS_PER_SECOND = @as(c_longlong, 1000000000);
