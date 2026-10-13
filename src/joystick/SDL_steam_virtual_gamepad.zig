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
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint16 = u16;
pub const Uint64 = u64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_realloc_REAL(mem: ?*anyopaque, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_getenv_unsafe_REAL(name: [*c]const u8) [*c]const u8;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_strchr_REAL(str: [*c]const u8, c: c_int) [*c]u8;
pub extern fn SDL_strtoul_REAL(str: [*c]const u8, endp: [*c][*c]u8, base: c_int) c_ulong;
pub extern fn SDL_strtoull_REAL(str: [*c]const u8, endp: [*c][*c]u8, base: c_int) c_ulonglong;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_sscanf_REAL(text: [*c]const u8, fmt: [*c]const u8, ...) c_int;
pub extern fn SDL_LoadFile_REAL(file: [*c]const u8, datasize: [*c]usize) ?*anyopaque;
pub const enum_SDL_GamepadType = c_uint;
pub const SDL_GamepadType = enum_SDL_GamepadType;
pub extern fn SDL_GetGamepadTypeFromString_REAL(str: [*c]const u8) SDL_GamepadType;
pub const SDL_LOG_CATEGORY_INPUT: c_int = 7;
pub extern fn SDL_LogDebug_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub const SDL_SANDBOX_MACOS: c_int = 4;
pub const enum_SDL_Sandbox = c_uint;
pub const SDL_Sandbox = enum_SDL_Sandbox;
pub extern fn SDL_GetSandbox_REAL() SDL_Sandbox;
pub extern fn SDL_GetTicks_REAL() Uint64;
pub extern fn SDL_GetExeName() [*c]const u8;
pub const struct_SDL_SteamVirtualGamepadInfo = extern struct {
    handle: Uint64 = 0,
    name: [*c]u8 = null,
    vendor_id: Uint16 = 0,
    product_id: Uint16 = 0,
    type: SDL_GamepadType = @import("std").mem.zeroes(SDL_GamepadType),
};
pub const SDL_SteamVirtualGamepadInfo = struct_SDL_SteamVirtualGamepadInfo;
pub export fn SDL_InitSteamVirtualGamepadInfo() void {
    @setEvalBranchQuota(100000);
    var file: [*c]const u8 = undefined;
    _ = &file;
    SDL_AssertJoysticksLocked();
    if (SDL_GetSandbox_REAL() == @as(SDL_Sandbox, SDL_SANDBOX_MACOS)) {
        return;
    }
    file = SDL_getenv_unsafe_REAL("SteamVirtualGamepadInfo");
    if ((file != null) and (@as(c_int, file.*) != 0)) {
        var exe: [*c]const u8 = SDL_GetExeName();
        _ = &exe;
        if ((exe != null) and (SDL_strcmp_REAL(exe, "wine64-preloader") == @as(c_int, 0))) {
            SDL_LogDebug_REAL(SDL_LOG_CATEGORY_INPUT, "Wine launched by Steam, ignoring SteamVirtualGamepadInfo");
            return;
        }
        SDL_steam_virtual_gamepad_info_file = SDL_strdup_REAL(file);
    }
    _ = SDL_UpdateSteamVirtualGamepadInfo();
}
pub export fn SDL_SteamVirtualGamepadEnabled() bool {
    @setEvalBranchQuota(100000);
    SDL_AssertJoysticksLocked();
    return @as(?*anyopaque, @ptrCast(@alignCast(SDL_steam_virtual_gamepad_info))) != @as(?*anyopaque, null);
}
pub export fn SDL_UpdateSteamVirtualGamepadInfo() bool {
    @setEvalBranchQuota(100000);
    const UPDATE_CHECK_INTERVAL_MS: c_int = 3000;
    _ = &UPDATE_CHECK_INTERVAL_MS;
    var now: Uint64 = undefined;
    _ = &now;
    var mtime: Uint64 = undefined;
    _ = &mtime;
    var data: [*c]u8 = undefined;
    _ = &data;
    var end: [*c]u8 = undefined;
    _ = &end;
    var next: [*c]u8 = undefined;
    _ = &next;
    var line: [*c]u8 = undefined;
    _ = &line;
    var value: [*c]u8 = undefined;
    _ = &value;
    var size: usize = undefined;
    _ = &size;
    var slot: c_int = undefined;
    _ = &slot;
    var new_slot: c_int = undefined;
    _ = &new_slot;
    var info: SDL_SteamVirtualGamepadInfo = undefined;
    _ = &info;
    SDL_AssertJoysticksLocked();
    if (!(SDL_steam_virtual_gamepad_info_file != null)) {
        return @"false" != 0;
    }
    now = SDL_GetTicks_REAL();
    if ((SDL_steam_virtual_gamepad_info_check_time != 0) and (@as(Uint64, @bitCast(@as(c_long, @intFromBool(now < (SDL_steam_virtual_gamepad_info_check_time +% @as(Uint64, @bitCast(@as(c_long, UPDATE_CHECK_INTERVAL_MS)))))))) != 0)) {
        return @"false" != 0;
    }
    SDL_steam_virtual_gamepad_info_check_time = now;
    mtime = GetFileModificationTime(SDL_steam_virtual_gamepad_info_file);
    if ((mtime == @as(Uint64, 0)) or (mtime == SDL_steam_virtual_gamepad_info_file_mtime)) {
        return @"false" != 0;
    }
    data = @ptrCast(@alignCast(SDL_LoadFile_REAL(SDL_steam_virtual_gamepad_info_file, &size)));
    if (!(data != null)) {
        return @"false" != 0;
    }
    SDL_FreeSteamVirtualGamepadInfo();
    slot = -@as(c_int, 1);
    _ = memset(@ptrCast(@alignCast(&info)), 0, @sizeOf(@TypeOf(info)));
    {
        next = data;
        end = data + size;
        while (next < end) {
            while ((next < end) and (((@as(c_int, next.*) == @as(c_int, '\x00')) or (@as(c_int, next.*) == @as(c_int, '\r'))) or (@as(c_int, next.*) == @as(c_int, '\n')))) {
                next += 1;
            }
            line = next;
            while ((next < end) and ((@as(c_int, next.*) != @as(c_int, '\r')) and (@as(c_int, next.*) != @as(c_int, '\n')))) {
                next += 1;
            }
            next.* = '\x00';
            if (SDL_sscanf_REAL(line, "[slot %d]", &new_slot) == @as(c_int, 1)) {
                if (slot >= @as(c_int, 0)) {
                    AddVirtualGamepadInfo(slot, &info);
                }
                slot = new_slot;
            } else {
                value = SDL_strchr_REAL(line, '=');
                if (value != null) {
                    (blk: {
                        const ref = &value;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).* = '\x00';
                    if (SDL_strcmp_REAL(line, "name") == @as(c_int, 0)) {
                        SDL_free_REAL(@ptrCast(@alignCast(info.name)));
                        info.name = SDL_strdup_REAL(value);
                    } else if (SDL_strcmp_REAL(line, "VID") == @as(c_int, 0)) {
                        info.vendor_id = @truncate(SDL_strtoul_REAL(value, null, 0));
                    } else if (SDL_strcmp_REAL(line, "PID") == @as(c_int, 0)) {
                        info.product_id = @truncate(SDL_strtoul_REAL(value, null, 0));
                    } else if (SDL_strcmp_REAL(line, "type") == @as(c_int, 0)) {
                        info.type = SDL_GetGamepadTypeFromString_REAL(value);
                    } else if (SDL_strcmp_REAL(line, "handle") == @as(c_int, 0)) {
                        info.handle = @truncate(SDL_strtoull_REAL(value, null, 0));
                    }
                }
            }
        }
    }
    if (slot >= @as(c_int, 0)) {
        AddVirtualGamepadInfo(slot, &info);
    }
    SDL_free_REAL(@ptrCast(@alignCast(info.name)));
    SDL_free_REAL(@ptrCast(@alignCast(data)));
    SDL_steam_virtual_gamepad_info_file_mtime = mtime;
    return @"true" != 0;
}
pub export fn SDL_GetSteamVirtualGamepadInfo(arg_slot: c_int) [*c]const SDL_SteamVirtualGamepadInfo {
    @setEvalBranchQuota(100000);
    var slot = arg_slot;
    _ = &slot;
    SDL_AssertJoysticksLocked();
    if ((slot < @as(c_int, 0)) or (slot >= SDL_steam_virtual_gamepad_info_count)) {
        return null;
    }
    return SDL_steam_virtual_gamepad_info[@bitCast(@as(isize, @intCast(slot)))];
}
pub export fn SDL_QuitSteamVirtualGamepadInfo() void {
    @setEvalBranchQuota(100000);
    SDL_AssertJoysticksLocked();
    if (SDL_steam_virtual_gamepad_info_file != null) {
        SDL_FreeSteamVirtualGamepadInfo();
        SDL_free_REAL(@ptrCast(@alignCast(SDL_steam_virtual_gamepad_info_file)));
        SDL_steam_virtual_gamepad_info_file = null;
        SDL_steam_virtual_gamepad_info_file_mtime = 0;
        SDL_steam_virtual_gamepad_info_check_time = 0;
    }
}

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub extern fn SDL_AssertJoysticksLocked() void;
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
pub var SDL_steam_virtual_gamepad_info_file: [*c]u8 = null;
pub var SDL_steam_virtual_gamepad_info_file_mtime: Uint64 = 0;
pub var SDL_steam_virtual_gamepad_info_check_time: Uint64 = 0;
pub var SDL_steam_virtual_gamepad_info: [*c][*c]SDL_SteamVirtualGamepadInfo = null;
pub var SDL_steam_virtual_gamepad_info_count: c_int = 0;
pub fn GetFileModificationTime(file: [*c]const u8) callconv(.c) Uint64 {
    @setEvalBranchQuota(100000);
    var modification_time: Uint64 = 0;
    _ = &modification_time;
    var sb: struct_stat = undefined;
    _ = &sb;
    if (stat(file, &sb) == @as(c_int, 0)) {
        modification_time = @bitCast(@as(c_long, sb.st_mtim.tv_sec));
    }
    return modification_time;
}
pub fn SDL_FreeSteamVirtualGamepadInfo() callconv(.c) void {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    SDL_AssertJoysticksLocked();
    {
        i = 0;
        while (i < SDL_steam_virtual_gamepad_info_count) : (i += 1) {
            var entry: [*c]SDL_SteamVirtualGamepadInfo = SDL_steam_virtual_gamepad_info[@bitCast(@as(isize, @intCast(i)))];
            _ = &entry;
            if (entry != null) {
                SDL_free_REAL(@ptrCast(@alignCast(entry.*.name)));
                SDL_free_REAL(@ptrCast(@alignCast(entry)));
            }
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(SDL_steam_virtual_gamepad_info)));
    SDL_steam_virtual_gamepad_info = null;
    SDL_steam_virtual_gamepad_info_count = 0;
}
pub fn AddVirtualGamepadInfo(arg_slot: c_int, info: [*c]SDL_SteamVirtualGamepadInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var slot = arg_slot;
    _ = &slot;
    var new_info: [*c]SDL_SteamVirtualGamepadInfo = undefined;
    _ = &new_info;
    SDL_AssertJoysticksLocked();
    if (slot < @as(c_int, 0)) {
        return;
    }
    if (slot >= SDL_steam_virtual_gamepad_info_count) {
        var slots: [*c][*c]SDL_SteamVirtualGamepadInfo = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(SDL_steam_virtual_gamepad_info)), @as(c_ulong, @bitCast(@as(c_long, slot + @as(c_int, 1)))) *% @sizeOf(@TypeOf(SDL_steam_virtual_gamepad_info.*)))));
        _ = &slots;
        if (!(slots != null)) {
            return;
        }
        while (SDL_steam_virtual_gamepad_info_count <= slot) {
            slots[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &SDL_steam_virtual_gamepad_info_count;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ] = null;
        }
        SDL_steam_virtual_gamepad_info = slots;
    }
    if (SDL_steam_virtual_gamepad_info[@bitCast(@as(isize, @intCast(slot)))] != null) {
        return;
    }
    new_info = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(@TypeOf(new_info.*)))));
    if (!(new_info != null)) {
        return;
    }
    {
        comptime {
            if (!(@sizeOf(@TypeOf(new_info.*)) == @sizeOf(@TypeOf(info.*)))) @compileError("static assertion failed \"sizeof (*(new_info)) == sizeof (*( info))\"");
        }
    }
    _ = memcpy(@ptrCast(@alignCast(new_info)), @ptrCast(@alignCast(info)), @sizeOf(@TypeOf(info.*)));
    SDL_steam_virtual_gamepad_info[@bitCast(@as(isize, @intCast(slot)))] = new_info;
    _ = memset(@ptrCast(@alignCast(info)), 0, @sizeOf(@TypeOf(info.*)));
}
