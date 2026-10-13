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
pub const __helpers = @import("std").zig.c_translation.helpers;
pub const __ino_t = c_ulong;
pub const __off_t = c_long;
pub const struct___va_list_tag_2 = extern struct {
    unnamed_0: c_uint = 0,
    unnamed_1: c_uint = 0,
    unnamed_2: ?*anyopaque = null,
    unnamed_3: ?*anyopaque = null,
};
pub extern fn free(__ptr: ?*anyopaque) void;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_strlen_REAL(str: [*c]const u8) usize;
pub extern fn SDL_atoi_REAL(str: [*c]const u8) c_int;
pub extern fn SDL_strtol_REAL(str: [*c]const u8, endp: [*c][*c]u8, base: c_int) c_long;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_strcasecmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_snprintf_REAL(text: [*c]u8, maxlen: usize, fmt: [*c]const u8, ...) c_int;
pub const SDL_POWERSTATE_UNKNOWN: c_int = 0;
pub const SDL_POWERSTATE_ON_BATTERY: c_int = 1;
pub const SDL_POWERSTATE_NO_BATTERY: c_int = 2;
pub const SDL_POWERSTATE_CHARGING: c_int = 3;
pub const SDL_POWERSTATE_CHARGED: c_int = 4;
pub const enum_SDL_PowerState = c_int;
pub const SDL_PowerState = enum_SDL_PowerState;
pub extern fn close(__fd: c_int) c_int;
pub extern fn read(__fd: c_int, __buf: ?*anyopaque, __nbytes: usize) isize;
pub extern fn truncate(__file: [*c]const u8, __length: __off_t) c_int;
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
pub extern fn open(__file: [*c]const u8, __oflag: c_int, ...) c_int;
pub const dbus_uint32_t = c_uint;
pub const dbus_bool_t = dbus_uint32_t;
pub const struct_DBusError = extern struct {
    name: [*c]const u8 = null,
    message: [*c]const u8 = null,
    reserved_bits: c_uint = 0,
    padding1: ?*anyopaque = null,
};
pub const DBusError = struct_DBusError;
pub const DBusFreeFunction = ?*const fn (memory: ?*anyopaque) callconv(.c) void;
pub const struct_DBusMessage = opaque {
};
pub const DBusMessage = struct_DBusMessage;
pub const struct_DBusMessageIter = extern struct {
    dummy1: ?*anyopaque = null,
    dummy2: ?*anyopaque = null,
    dummy3: dbus_uint32_t = 0,
    dummy4: c_int = 0,
    dummy5: c_int = 0,
    dummy6: c_int = 0,
    dummy7: c_int = 0,
    dummy8: c_int = 0,
    dummy9: c_int = 0,
    dummy10: c_int = 0,
    dummy11: c_int = 0,
    pad1: c_int = 0,
    pad2: ?*anyopaque = null,
    pad3: ?*anyopaque = null,
};
pub const DBusMessageIter = struct_DBusMessageIter;
pub const DBusBusType = c_uint;
pub const DBusHandlerResult = c_uint;
pub const struct_DBusConnection = opaque {
};
pub const DBusConnection = struct_DBusConnection;
pub const DBusObjectPathUnregisterFunction = ?*const fn (connection: ?*DBusConnection, user_data: ?*anyopaque) callconv(.c) void;
pub const DBusObjectPathMessageFunction = ?*const fn (connection: ?*DBusConnection, message: ?*DBusMessage, user_data: ?*anyopaque) callconv(.c) DBusHandlerResult;
pub const struct_DBusObjectPathVTable = extern struct {
    unregister_function: DBusObjectPathUnregisterFunction = null,
    message_function: DBusObjectPathMessageFunction = null,
    dbus_internal_pad1: ?*const fn (?*anyopaque) callconv(.c) void = null,
    dbus_internal_pad2: ?*const fn (?*anyopaque) callconv(.c) void = null,
    dbus_internal_pad3: ?*const fn (?*anyopaque) callconv(.c) void = null,
    dbus_internal_pad4: ?*const fn (?*anyopaque) callconv(.c) void = null,
};
pub const DBusObjectPathVTable = struct_DBusObjectPathVTable;
pub const DBusDispatchStatus = c_uint;
pub const DBusHandleMessageFunction = ?*const fn (connection: ?*DBusConnection, message: ?*DBusMessage, user_data: ?*anyopaque) callconv(.c) DBusHandlerResult;
pub const struct_SDL_DBusContext = extern struct {
    session_conn: ?*DBusConnection = null,
    system_conn: ?*DBusConnection = null,
    bus_get_private: ?*const fn (DBusBusType, [*c]DBusError) callconv(.c) ?*DBusConnection = null,
    bus_register: ?*const fn (?*DBusConnection, [*c]DBusError) callconv(.c) dbus_bool_t = null,
    bus_add_match: ?*const fn (?*DBusConnection, [*c]const u8, [*c]DBusError) callconv(.c) void = null,
    bus_remove_match: ?*const fn (?*DBusConnection, [*c]const u8, [*c]DBusError) callconv(.c) void = null,
    bus_get_unique_name: ?*const fn (?*DBusConnection) callconv(.c) [*c]const u8 = null,
    connection_open_private: ?*const fn ([*c]const u8, [*c]DBusError) callconv(.c) ?*DBusConnection = null,
    connection_set_exit_on_disconnect: ?*const fn (?*DBusConnection, dbus_bool_t) callconv(.c) void = null,
    connection_get_is_connected: ?*const fn (?*DBusConnection) callconv(.c) dbus_bool_t = null,
    connection_add_filter: ?*const fn (?*DBusConnection, DBusHandleMessageFunction, ?*anyopaque, DBusFreeFunction) callconv(.c) dbus_bool_t = null,
    connection_remove_filter: ?*const fn (?*DBusConnection, DBusHandleMessageFunction, ?*anyopaque) callconv(.c) dbus_bool_t = null,
    connection_try_register_object_path: ?*const fn (?*DBusConnection, [*c]const u8, [*c]const DBusObjectPathVTable, ?*anyopaque, [*c]DBusError) callconv(.c) dbus_bool_t = null,
    connection_send: ?*const fn (?*DBusConnection, ?*DBusMessage, [*c]dbus_uint32_t) callconv(.c) dbus_bool_t = null,
    connection_send_with_reply_and_block: ?*const fn (?*DBusConnection, ?*DBusMessage, c_int, [*c]DBusError) callconv(.c) ?*DBusMessage = null,
    connection_close: ?*const fn (?*DBusConnection) callconv(.c) void = null,
    connection_ref: ?*const fn (?*DBusConnection) callconv(.c) void = null,
    connection_unref: ?*const fn (?*DBusConnection) callconv(.c) void = null,
    connection_flush: ?*const fn (?*DBusConnection) callconv(.c) void = null,
    connection_read_write: ?*const fn (?*DBusConnection, c_int) callconv(.c) dbus_bool_t = null,
    connection_read_write_dispatch: ?*const fn (?*DBusConnection, c_int) callconv(.c) dbus_bool_t = null,
    connection_dispatch: ?*const fn (?*DBusConnection) callconv(.c) DBusDispatchStatus = null,
    type_is_fixed: ?*const fn (c_int) callconv(.c) dbus_bool_t = null,
    message_is_signal: ?*const fn (?*DBusMessage, [*c]const u8, [*c]const u8) callconv(.c) dbus_bool_t = null,
    message_has_path: ?*const fn (?*DBusMessage, [*c]const u8) callconv(.c) dbus_bool_t = null,
    message_new_method_call: ?*const fn ([*c]const u8, [*c]const u8, [*c]const u8, [*c]const u8) callconv(.c) ?*DBusMessage = null,
    message_new_signal: ?*const fn ([*c]const u8, [*c]const u8, [*c]const u8) callconv(.c) ?*DBusMessage = null,
    message_set_no_reply: ?*const fn (?*DBusMessage, dbus_bool_t) callconv(.c) void = null,
    message_append_args: ?*const fn (?*DBusMessage, c_int, ...) callconv(.c) dbus_bool_t = null,
    message_append_args_valist: ?*const fn (?*DBusMessage, c_int, [*c]struct___va_list_tag_2) callconv(.c) dbus_bool_t = null,
    message_iter_init_append: ?*const fn (?*DBusMessage, [*c]DBusMessageIter) callconv(.c) void = null,
    message_iter_open_container: ?*const fn ([*c]DBusMessageIter, c_int, [*c]const u8, [*c]DBusMessageIter) callconv(.c) dbus_bool_t = null,
    message_iter_append_basic: ?*const fn ([*c]DBusMessageIter, c_int, ?*const anyopaque) callconv(.c) dbus_bool_t = null,
    message_iter_close_container: ?*const fn ([*c]DBusMessageIter, [*c]DBusMessageIter) callconv(.c) dbus_bool_t = null,
    message_get_args: ?*const fn (?*DBusMessage, [*c]DBusError, c_int, ...) callconv(.c) dbus_bool_t = null,
    message_get_args_valist: ?*const fn (?*DBusMessage, [*c]DBusError, c_int, [*c]struct___va_list_tag_2) callconv(.c) dbus_bool_t = null,
    message_iter_init: ?*const fn (?*DBusMessage, [*c]DBusMessageIter) callconv(.c) dbus_bool_t = null,
    message_iter_next: ?*const fn ([*c]DBusMessageIter) callconv(.c) dbus_bool_t = null,
    message_iter_get_basic: ?*const fn ([*c]DBusMessageIter, ?*anyopaque) callconv(.c) void = null,
    message_iter_get_arg_type: ?*const fn ([*c]DBusMessageIter) callconv(.c) c_int = null,
    message_iter_recurse: ?*const fn ([*c]DBusMessageIter, [*c]DBusMessageIter) callconv(.c) void = null,
    message_unref: ?*const fn (?*DBusMessage) callconv(.c) void = null,
    threads_init_default: ?*const fn () callconv(.c) dbus_bool_t = null,
    error_init: ?*const fn ([*c]DBusError) callconv(.c) void = null,
    error_is_set: ?*const fn ([*c]const DBusError) callconv(.c) dbus_bool_t = null,
    error_has_name: ?*const fn ([*c]const DBusError, [*c]const u8) callconv(.c) dbus_bool_t = null,
    error_free: ?*const fn ([*c]DBusError) callconv(.c) void = null,
    get_local_machine_id: ?*const fn () callconv(.c) [*c]u8 = null,
    try_get_local_machine_id: ?*const fn ([*c]DBusError) callconv(.c) [*c]u8 = null,
    free: ?*const fn (?*anyopaque) callconv(.c) void = null,
    free_string_array: ?*const fn ([*c][*c]u8) callconv(.c) void = null,
    shutdown: ?*const fn () callconv(.c) void = null,
    bus_request_name: ?*const fn (?*DBusConnection, [*c]const u8, c_uint, [*c]DBusError) callconv(.c) c_int = null,
    message_is_method_call: ?*const fn (?*DBusMessage, [*c]const u8, [*c]const u8) callconv(.c) dbus_bool_t = null,
    message_new_error: ?*const fn (?*DBusMessage, [*c]const u8, [*c]const u8) callconv(.c) ?*DBusMessage = null,
    message_new_method_return: ?*const fn (?*DBusMessage) callconv(.c) ?*DBusMessage = null,
    message_iter_append_fixed_array: ?*const fn ([*c]DBusMessageIter, c_int, ?*const anyopaque, c_int) callconv(.c) dbus_bool_t = null,
    message_iter_get_fixed_array: ?*const fn ([*c]DBusMessageIter, ?*anyopaque, [*c]c_int) callconv(.c) void = null,
    connection_unregister_object_path: ?*const fn (?*DBusConnection, [*c]const u8) callconv(.c) dbus_bool_t = null,
    connection_get_object_path_data: ?*const fn (?*DBusConnection, [*c]const u8, [*c]?*anyopaque) callconv(.c) dbus_bool_t = null,
};
pub const SDL_DBusContext = struct_SDL_DBusContext;
pub extern fn SDL_DBus_GetContext() [*c]SDL_DBusContext;
pub extern fn SDL_DBus_CallMethodOnConnection(conn: ?*DBusConnection, save_reply: [*c]?*DBusMessage, node: [*c]const u8, path: [*c]const u8, interface: [*c]const u8, method: [*c]const u8, ...) bool;
pub extern fn SDL_DBus_QueryPropertyOnConnection(conn: ?*DBusConnection, save_reply: [*c]?*DBusMessage, node: [*c]const u8, path: [*c]const u8, interface: [*c]const u8, property: [*c]const u8, expectedtype: c_int, result: ?*anyopaque) bool;
pub extern fn SDL_DBus_FreeReply(saved_reply: [*c]?*DBusMessage) void;
pub var proc_apm_path: [*c]const u8 = "/proc/apm";
pub var proc_acpi_battery_path: [*c]const u8 = "/proc/acpi/battery";
pub var proc_acpi_ac_adapter_path: [*c]const u8 = "/proc/acpi/ac_adapter";
pub var sys_class_power_supply_path: [*c]const u8 = "/sys/class/power_supply";
pub fn open_power_file(base: [*c]const u8, node: [*c]const u8, key: [*c]const u8) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var fd: c_int = undefined;
    _ = &fd;
    const pathlen: usize = ((SDL_strlen_REAL(base) +% SDL_strlen_REAL(node)) +% SDL_strlen_REAL(key)) +% @as(usize, 3);
    _ = &pathlen;
    var path: [*c]u8 = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(u8) *% pathlen)));
    _ = &path;
    if (!(path != null)) {
        return -@as(c_int, 1);
    }
    _ = SDL_snprintf_REAL(path, pathlen, "%s/%s/%s", base, node, key);
    fd = open(path, O_RDONLY | __O_CLOEXEC);
    SDL_free_REAL(@ptrCast(@alignCast(path)));
    return fd;
}
pub fn read_power_file(base: [*c]const u8, node: [*c]const u8, key: [*c]const u8, buf: [*c]u8, buflen: usize) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var br: isize = 0;
    _ = &br;
    const fd: c_int = open_power_file(base, node, key);
    _ = &fd;
    if (fd == -@as(c_int, 1)) {
        return @"false" != 0;
    }
    br = read(fd, @ptrCast(@alignCast(buf)), buflen -% @as(usize, 1));
    _ = close(fd);
    if (br < @as(isize, 0)) {
        return @"false" != 0;
    }
    buf[@bitCast(@as(isize, @intCast(br)))] = '\x00';
    return @"true" != 0;
}
pub fn make_proc_acpi_key_val(_ptr: [*c][*c]u8, _key: [*c][*c]u8, _val: [*c][*c]u8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ptr: [*c]u8 = _ptr.*;
    _ = &ptr;
    while (@as(c_int, ptr.*) == @as(c_int, ' ')) {
        ptr += 1;
    }
    if (@as(c_int, ptr.*) == @as(c_int, '\x00')) {
        return @"false" != 0;
    }
    _key.* = ptr;
    while ((@as(c_int, ptr.*) != @as(c_int, ':')) and (@as(c_int, ptr.*) != @as(c_int, '\x00'))) {
        ptr += 1;
    }
    if (@as(c_int, ptr.*) == @as(c_int, '\x00')) {
        return @"false" != 0;
    }
    (blk: {
        const ref = &ptr;
        const tmp = ref.*;
        ref.* += 1;
        break :blk tmp;
    }).* = '\x00';
    while (@as(c_int, ptr.*) == @as(c_int, ' ')) {
        ptr += 1;
    }
    if (@as(c_int, ptr.*) == @as(c_int, '\x00')) {
        return @"false" != 0;
    }
    _val.* = ptr;
    while ((@as(c_int, ptr.*) != @as(c_int, '\n')) and (@as(c_int, ptr.*) != @as(c_int, '\x00'))) {
        ptr += 1;
    }
    if (@as(c_int, ptr.*) != @as(c_int, '\x00')) {
        (blk: {
            const ref = &ptr;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        }).* = '\x00';
    }
    _ptr.* = ptr;
    return @"true" != 0;
}
pub fn check_proc_acpi_battery(node: [*c]const u8, have_battery: [*c]bool, charging: [*c]bool, seconds: [*c]c_int, percent: [*c]c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var base: [*c]const u8 = proc_acpi_battery_path;
    _ = &base;
    var info: [1024]u8 = undefined;
    _ = &info;
    var state: [1024]u8 = undefined;
    _ = &state;
    var ptr: [*c]u8 = null;
    _ = &ptr;
    var key: [*c]u8 = null;
    _ = &key;
    var val: [*c]u8 = null;
    _ = &val;
    var charge: bool = @"false" != 0;
    _ = &charge;
    var choose: bool = @"false" != 0;
    _ = &choose;
    var maximum: c_int = -@as(c_int, 1);
    _ = &maximum;
    var remaining: c_int = -@as(c_int, 1);
    _ = &remaining;
    var secs: c_int = -@as(c_int, 1);
    _ = &secs;
    var pct: c_int = -@as(c_int, 1);
    _ = &pct;
    if (!read_power_file(base, node, "state", @ptrCast(@alignCast(&state)), @sizeOf(@TypeOf(state)))) {
        return;
    } else if (!read_power_file(base, node, "info", @ptrCast(@alignCast(&info)), @sizeOf(@TypeOf(info)))) {
        return;
    }
    ptr = &state[@as(c_int, 0)];
    while (make_proc_acpi_key_val(&ptr, &key, &val)) {
        if (SDL_strcasecmp_REAL(key, "present") == @as(c_int, 0)) {
            if (SDL_strcasecmp_REAL(val, "yes") == @as(c_int, 0)) {
                have_battery.* = @"true" != 0;
            }
        } else if (SDL_strcasecmp_REAL(key, "charging state") == @as(c_int, 0)) {
            if (SDL_strcasecmp_REAL(val, "charging/discharging") == @as(c_int, 0)) {
                charge = @"true" != 0;
            } else if (SDL_strcasecmp_REAL(val, "charging") == @as(c_int, 0)) {
                charge = @"true" != 0;
            }
        } else if (SDL_strcasecmp_REAL(key, "remaining capacity") == @as(c_int, 0)) {
            var endptr: [*c]u8 = null;
            _ = &endptr;
            const cvt: c_int = @truncate(SDL_strtol_REAL(val, &endptr, 10));
            _ = &cvt;
            if (@as(c_int, endptr.*) == @as(c_int, ' ')) {
                remaining = cvt;
            }
        }
    }
    ptr = &info[@as(c_int, 0)];
    while (make_proc_acpi_key_val(&ptr, &key, &val)) {
        if (SDL_strcasecmp_REAL(key, "design capacity") == @as(c_int, 0)) {
            var endptr: [*c]u8 = null;
            _ = &endptr;
            const cvt: c_int = @truncate(SDL_strtol_REAL(val, &endptr, 10));
            _ = &cvt;
            if (@as(c_int, endptr.*) == @as(c_int, ' ')) {
                maximum = cvt;
            }
        }
    }
    if ((maximum >= @as(c_int, 0)) and (remaining >= @as(c_int, 0))) {
        pct = @intFromFloat((@as(f32, @floatFromInt(remaining)) / @as(f32, @floatFromInt(maximum))) * @as(f32, 100.0));
        if (pct < @as(c_int, 0)) {
            pct = 0;
        } else if (pct > @as(c_int, 100)) {
            pct = 100;
        }
    }
    if ((secs < @as(c_int, 0)) and (seconds.* < @as(c_int, 0))) {
        if ((pct < @as(c_int, 0)) and (percent.* < @as(c_int, 0))) {
            choose = @"true" != 0;
        }
        if (pct > percent.*) {
            choose = @"true" != 0;
        }
    } else if (secs > seconds.*) {
        choose = @"true" != 0;
    }
    if (choose) {
        seconds.* = secs;
        percent.* = pct;
        charging.* = charge;
    }
}
pub fn check_proc_acpi_ac_adapter(node: [*c]const u8, have_ac: [*c]bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var base: [*c]const u8 = proc_acpi_ac_adapter_path;
    _ = &base;
    var state: [256]u8 = undefined;
    _ = &state;
    var ptr: [*c]u8 = null;
    _ = &ptr;
    var key: [*c]u8 = null;
    _ = &key;
    var val: [*c]u8 = null;
    _ = &val;
    if (!read_power_file(base, node, "state", @ptrCast(@alignCast(&state)), @sizeOf(@TypeOf(state)))) {
        return;
    }
    ptr = &state[@as(c_int, 0)];
    while (make_proc_acpi_key_val(&ptr, &key, &val)) {
        if (SDL_strcasecmp_REAL(key, "state") == @as(c_int, 0)) {
            if (SDL_strcasecmp_REAL(val, "on-line") == @as(c_int, 0)) {
                have_ac.* = @"true" != 0;
            }
        }
    }
}
pub export fn SDL_GetPowerInfo_Linux_proc_acpi(state: [*c]SDL_PowerState, seconds: [*c]c_int, percent: [*c]c_int) bool {
    @setEvalBranchQuota(100000);
    var dent: [*c]struct_dirent = null;
    _ = &dent;
    var dirp: ?*DIR = null;
    _ = &dirp;
    var have_battery: bool = @"false" != 0;
    _ = &have_battery;
    var have_ac: bool = @"false" != 0;
    _ = &have_ac;
    var charging: bool = @"false" != 0;
    _ = &charging;
    seconds.* = -@as(c_int, 1);
    percent.* = -@as(c_int, 1);
    state.* = SDL_POWERSTATE_UNKNOWN;
    dirp = opendir(proc_acpi_battery_path);
    if (!(dirp != null)) {
        return @"false" != 0;
    } else {
        while (@as(?*anyopaque, @ptrCast(@alignCast(blk: {
            const tmp = readdir(dirp);
            dent = tmp;
            break :blk tmp;
        }))) != @as(?*anyopaque, null)) {
            var node: [*c]const u8 = @ptrCast(@alignCast(&dent.*.d_name));
            _ = &node;
            check_proc_acpi_battery(node, &have_battery, &charging, seconds, percent);
        }
        _ = closedir(dirp);
    }
    dirp = opendir(proc_acpi_ac_adapter_path);
    if (!(dirp != null)) {
        return @"false" != 0;
    } else {
        while (@as(?*anyopaque, @ptrCast(@alignCast(blk: {
            const tmp = readdir(dirp);
            dent = tmp;
            break :blk tmp;
        }))) != @as(?*anyopaque, null)) {
            var node: [*c]const u8 = @ptrCast(@alignCast(&dent.*.d_name));
            _ = &node;
            check_proc_acpi_ac_adapter(node, &have_ac);
        }
        _ = closedir(dirp);
    }
    if (!have_battery) {
        state.* = SDL_POWERSTATE_NO_BATTERY;
    } else if (charging) {
        state.* = SDL_POWERSTATE_CHARGING;
    } else if (have_ac) {
        state.* = SDL_POWERSTATE_CHARGED;
    } else {
        state.* = SDL_POWERSTATE_ON_BATTERY;
    }
    return @"true" != 0;
}
pub fn next_string(_ptr: [*c][*c]u8, _str: [*c][*c]u8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ptr: [*c]u8 = _ptr.*;
    _ = &ptr;
    var str: [*c]u8 = undefined;
    _ = &str;
    while (@as(c_int, ptr.*) == @as(c_int, ' ')) {
        ptr += 1;
    }
    if (@as(c_int, ptr.*) == @as(c_int, '\x00')) {
        return @"false" != 0;
    }
    str = ptr;
    while (((@as(c_int, ptr.*) != @as(c_int, ' ')) and (@as(c_int, ptr.*) != @as(c_int, '\n'))) and (@as(c_int, ptr.*) != @as(c_int, '\x00'))) {
        ptr += 1;
    }
    if (@as(c_int, ptr.*) != @as(c_int, '\x00')) {
        (blk: {
            const ref = &ptr;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        }).* = '\x00';
    }
    _str.* = str;
    _ptr.* = ptr;
    return @"true" != 0;
}
pub fn int_string(str: [*c]u8, val: [*c]c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var endptr: [*c]u8 = null;
    _ = &endptr;
    val.* = @truncate(SDL_strtol_REAL(str, &endptr, 0));
    return (@as(c_int, str.*) != @as(c_int, '\x00')) and (@as(c_int, endptr.*) == @as(c_int, '\x00'));
}
pub export fn SDL_GetPowerInfo_Linux_proc_apm(state: [*c]SDL_PowerState, seconds: [*c]c_int, percent: [*c]c_int) bool {
    @setEvalBranchQuota(100000);
    var need_details: bool = @"false" != 0;
    _ = &need_details;
    var ac_status: c_int = 0;
    _ = &ac_status;
    var battery_status: c_int = 0;
    _ = &battery_status;
    var battery_flag: c_int = 0;
    _ = &battery_flag;
    var battery_percent: c_int = 0;
    _ = &battery_percent;
    var battery_time: c_int = 0;
    _ = &battery_time;
    const fd: c_int = open(proc_apm_path, O_RDONLY | __O_CLOEXEC);
    _ = &fd;
    var buf: [128]u8 = undefined;
    _ = &buf;
    var ptr: [*c]u8 = &buf[@as(c_int, 0)];
    _ = &ptr;
    var str: [*c]u8 = null;
    _ = &str;
    var br: isize = undefined;
    _ = &br;
    if (fd == -@as(c_int, 1)) {
        return @"false" != 0;
    }
    br = read(fd, @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&buf))))), @sizeOf(@TypeOf(buf)) -% @as(c_ulong, 1));
    _ = close(fd);
    if (br < @as(isize, 0)) {
        return @"false" != 0;
    }
    buf[@bitCast(@as(isize, @intCast(br)))] = '\x00';
    if (!next_string(&ptr, &str)) {
        return @"false" != 0;
    }
    if (!next_string(&ptr, &str)) {
        return @"false" != 0;
    }
    if (!next_string(&ptr, &str)) {
        return @"false" != 0;
    }
    if (!next_string(&ptr, &str)) {
        return @"false" != 0;
    } else if (!int_string(str, &ac_status)) {
        return @"false" != 0;
    }
    if (!next_string(&ptr, &str)) {
        return @"false" != 0;
    } else if (!int_string(str, &battery_status)) {
        return @"false" != 0;
    }
    if (!next_string(&ptr, &str)) {
        return @"false" != 0;
    } else if (!int_string(str, &battery_flag)) {
        return @"false" != 0;
    }
    if (!next_string(&ptr, &str)) {
        return @"false" != 0;
    }
    if (@as(c_int, str[SDL_strlen_REAL(str) -% @as(usize, 1)]) == @as(c_int, '%')) {
        str[SDL_strlen_REAL(str) -% @as(usize, 1)] = '\x00';
    }
    if (!int_string(str, &battery_percent)) {
        return @"false" != 0;
    }
    if (!next_string(&ptr, &str)) {
        return @"false" != 0;
    } else if (!int_string(str, &battery_time)) {
        return @"false" != 0;
    }
    if (!next_string(&ptr, &str)) {
        return @"false" != 0;
    } else if (SDL_strcasecmp_REAL(str, "min") == @as(c_int, 0)) {
        battery_time *= 60;
    }
    if (battery_flag == @as(c_int, 255)) {
        state.* = SDL_POWERSTATE_UNKNOWN;
    } else if ((battery_flag & (@as(c_int, 1) << @intCast(@as(c_int, 7)))) != 0) {
        state.* = SDL_POWERSTATE_NO_BATTERY;
    } else if ((battery_flag & (@as(c_int, 1) << @intCast(@as(c_int, 3)))) != 0) {
        state.* = SDL_POWERSTATE_CHARGING;
        need_details = @"true" != 0;
    } else if (ac_status == @as(c_int, 1)) {
        state.* = SDL_POWERSTATE_CHARGED;
        need_details = @"true" != 0;
    } else {
        state.* = SDL_POWERSTATE_ON_BATTERY;
        need_details = @"true" != 0;
    }
    percent.* = -@as(c_int, 1);
    seconds.* = -@as(c_int, 1);
    if (need_details) {
        const pct: c_int = battery_percent;
        _ = &pct;
        const secs: c_int = battery_time;
        _ = &secs;
        if (pct >= @as(c_int, 0)) {
            percent.* = if (pct > @as(c_int, 100)) @as(c_int, 100) else pct;
        }
        if (secs >= @as(c_int, 0)) {
            seconds.* = secs;
        }
    }
    return @"true" != 0;
}
pub export fn SDL_GetPowerInfo_Linux_sys_class_power_supply(state: [*c]SDL_PowerState, seconds: [*c]c_int, percent: [*c]c_int) bool {
    @setEvalBranchQuota(100000);
    var base: [*c]const u8 = sys_class_power_supply_path;
    _ = &base;
    var dent: [*c]struct_dirent = undefined;
    _ = &dent;
    var dirp: ?*DIR = undefined;
    _ = &dirp;
    dirp = opendir(base);
    if (!(dirp != null)) {
        return @"false" != 0;
    }
    state.* = SDL_POWERSTATE_NO_BATTERY;
    seconds.* = -@as(c_int, 1);
    percent.* = -@as(c_int, 1);
    while (@as(?*anyopaque, @ptrCast(@alignCast(blk: {
        const tmp = readdir(dirp);
        dent = tmp;
        break :blk tmp;
    }))) != @as(?*anyopaque, null)) {
        var name: [*c]const u8 = @ptrCast(@alignCast(&dent.*.d_name));
        _ = &name;
        var choose: bool = @"false" != 0;
        _ = &choose;
        var str: [64]u8 = undefined;
        _ = &str;
        var st: SDL_PowerState = undefined;
        _ = &st;
        var secs: c_int = undefined;
        _ = &secs;
        var pct: c_int = undefined;
        _ = &pct;
        var energy: c_int = undefined;
        _ = &energy;
        var power: c_int = undefined;
        _ = &power;
        if ((SDL_strcmp_REAL(name, ".") == @as(c_int, 0)) or (SDL_strcmp_REAL(name, "..") == @as(c_int, 0))) {
            continue;
        } else if (!read_power_file(base, name, "type", @ptrCast(@alignCast(&str)), @sizeOf(@TypeOf(str)))) {
            continue;
        } else if (SDL_strcasecmp_REAL(@ptrCast(@alignCast(&str)), "Battery\n") != @as(c_int, 0)) {
            continue;
        }
        if (read_power_file(base, name, "scope", @ptrCast(@alignCast(&str)), @sizeOf(@TypeOf(str)))) {
            if (SDL_strcasecmp_REAL(@ptrCast(@alignCast(&str)), "Device\n") == @as(c_int, 0)) {
                continue;
            }
        }
        if (read_power_file(base, name, "present", @ptrCast(@alignCast(&str)), @sizeOf(@TypeOf(str))) and (SDL_strcmp_REAL(@ptrCast(@alignCast(&str)), "0\n") == @as(c_int, 0))) {
            st = SDL_POWERSTATE_NO_BATTERY;
        } else if (!read_power_file(base, name, "status", @ptrCast(@alignCast(&str)), @sizeOf(@TypeOf(str)))) {
            st = SDL_POWERSTATE_UNKNOWN;
        } else if (SDL_strcasecmp_REAL(@ptrCast(@alignCast(&str)), "Charging\n") == @as(c_int, 0)) {
            st = SDL_POWERSTATE_CHARGING;
        } else if (SDL_strcasecmp_REAL(@ptrCast(@alignCast(&str)), "Discharging\n") == @as(c_int, 0)) {
            st = SDL_POWERSTATE_ON_BATTERY;
        } else if ((SDL_strcasecmp_REAL(@ptrCast(@alignCast(&str)), "Full\n") == @as(c_int, 0)) or (SDL_strcasecmp_REAL(@ptrCast(@alignCast(&str)), "Not charging\n") == @as(c_int, 0))) {
            st = SDL_POWERSTATE_CHARGED;
        } else {
            st = SDL_POWERSTATE_UNKNOWN;
        }
        if (!read_power_file(base, name, "capacity", @ptrCast(@alignCast(&str)), @sizeOf(@TypeOf(str)))) {
            pct = -@as(c_int, 1);
        } else {
            pct = SDL_atoi_REAL(@ptrCast(@alignCast(&str)));
            pct = if (pct > @as(c_int, 100)) @as(c_int, 100) else pct;
        }
        if (read_power_file(base, name, "time_to_empty_now", @ptrCast(@alignCast(&str)), @sizeOf(@TypeOf(str)))) {
            secs = SDL_atoi_REAL(@ptrCast(@alignCast(&str)));
            secs = if (secs <= @as(c_int, 0)) -@as(c_int, 1) else secs;
        } else if (st == SDL_POWERSTATE_ON_BATTERY) {
            energy = if (read_power_file(base, name, "energy_now", @ptrCast(@alignCast(&str)), @sizeOf(@TypeOf(str)))) SDL_atoi_REAL(@ptrCast(@alignCast(&str))) else -@as(c_int, 1);
            power = if (read_power_file(base, name, "power_now", @ptrCast(@alignCast(&str)), @sizeOf(@TypeOf(str)))) SDL_atoi_REAL(@ptrCast(@alignCast(&str))) else -@as(c_int, 1);
            secs = @truncate(if ((energy >= @as(c_int, 0)) and (power > @as(c_int, 0))) @divTrunc(@as(c_longlong, 3600) * @as(c_longlong, energy), @as(c_longlong, power)) else @as(c_longlong, -@as(c_int, 1)));
        } else {
            secs = -@as(c_int, 1);
        }
        if ((secs < @as(c_int, 0)) and (seconds.* < @as(c_int, 0))) {
            if ((pct < @as(c_int, 0)) and (percent.* < @as(c_int, 0))) {
                choose = @"true" != 0;
            } else if (pct > percent.*) {
                choose = @"true" != 0;
            }
        } else if (secs > seconds.*) {
            choose = @"true" != 0;
        }
        if (choose) {
            seconds.* = secs;
            percent.* = pct;
            state.* = st;
        }
    }
    _ = closedir(dirp);
    return @"true" != 0;
}
pub fn check_upower_device(conn: ?*DBusConnection, path: [*c]const u8, state: [*c]SDL_PowerState, seconds: [*c]c_int, percent: [*c]c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var choose: bool = @"false" != 0;
    _ = &choose;
    var st: SDL_PowerState = undefined;
    _ = &st;
    var secs: c_int = undefined;
    _ = &secs;
    var pct: c_int = undefined;
    _ = &pct;
    var ui32: Uint32 = 0;
    _ = &ui32;
    var si64: Sint64 = 0;
    _ = &si64;
    var d: f64 = 0.0;
    _ = &d;
    if (!SDL_DBus_QueryPropertyOnConnection(conn, null, "org.freedesktop.UPower", path, "org.freedesktop.UPower.Device", "Type", @as(c_int, 'u'), @ptrCast(@alignCast(&ui32)))) {
        return;
    } else if (ui32 != @as(Uint32, 2)) {
        return;
    } else if (!SDL_DBus_QueryPropertyOnConnection(conn, null, "org.freedesktop.UPower", path, "org.freedesktop.UPower.Device", "PowerSupply", @as(c_int, 'b'), @ptrCast(@alignCast(&ui32)))) {
        return;
    } else if (!(ui32 != 0)) {
        return;
    }
    if (!SDL_DBus_QueryPropertyOnConnection(conn, null, "org.freedesktop.UPower", path, "org.freedesktop.UPower.Device", "IsPresent", @as(c_int, 'b'), @ptrCast(@alignCast(&ui32)))) {
        return;
    }
    if (!(ui32 != 0)) {
        st = SDL_POWERSTATE_NO_BATTERY;
    } else {
        _ = SDL_DBus_CallMethodOnConnection(conn, null, "org.freedesktop.UPower", path, "org.freedesktop.UPower.Device", "Refresh", @as(c_int, '\x00'), @as(c_int, '\x00'));
        if (!SDL_DBus_QueryPropertyOnConnection(conn, null, "org.freedesktop.UPower", path, "org.freedesktop.UPower.Device", "State", @as(c_int, 'u'), @ptrCast(@alignCast(&ui32)))) {
            st = SDL_POWERSTATE_UNKNOWN;
        } else if (ui32 == @as(Uint32, 1)) {
            st = SDL_POWERSTATE_CHARGING;
        } else if (((ui32 == @as(Uint32, 2)) or (ui32 == @as(Uint32, 3))) or (ui32 == @as(Uint32, 6))) {
            st = SDL_POWERSTATE_ON_BATTERY;
        } else if ((ui32 == @as(Uint32, 4)) or (ui32 == @as(Uint32, 5))) {
            st = SDL_POWERSTATE_CHARGED;
        } else {
            st = SDL_POWERSTATE_UNKNOWN;
        }
    }
    if (!SDL_DBus_QueryPropertyOnConnection(conn, null, "org.freedesktop.UPower", path, "org.freedesktop.UPower.Device", "Percentage", @as(c_int, 'd'), @ptrCast(@alignCast(&d)))) {
        pct = -@as(c_int, 1);
    } else {
        pct = @intFromFloat(d);
        pct = if (pct > @as(c_int, 100)) @as(c_int, 100) else pct;
    }
    if (!SDL_DBus_QueryPropertyOnConnection(conn, null, "org.freedesktop.UPower", path, "org.freedesktop.UPower.Device", "TimeToEmpty", @as(c_int, 'x'), @ptrCast(@alignCast(&si64)))) {
        secs = -@as(c_int, 1);
    } else {
        secs = @truncate(si64);
        secs = if (secs <= @as(c_int, 0)) -@as(c_int, 1) else secs;
    }
    if ((secs < @as(c_int, 0)) and (seconds.* < @as(c_int, 0))) {
        if ((pct < @as(c_int, 0)) and (percent.* < @as(c_int, 0))) {
            choose = @"true" != 0;
        } else if (pct > percent.*) {
            choose = @"true" != 0;
        }
    } else if (secs > seconds.*) {
        choose = @"true" != 0;
    }
    if (choose) {
        seconds.* = secs;
        percent.* = pct;
        state.* = st;
    }
}
pub export fn SDL_GetPowerInfo_Linux_org_freedesktop_upower(state: [*c]SDL_PowerState, seconds: [*c]c_int, percent: [*c]c_int) bool {
    @setEvalBranchQuota(100000);
    var result: bool = @"false" != 0;
    _ = &result;
    var dbus: [*c]SDL_DBusContext = SDL_DBus_GetContext();
    _ = &dbus;
    var reply: ?*DBusMessage = null;
    _ = &reply;
    var paths: [*c][*c]u8 = null;
    _ = &paths;
    var path: [*c]u8 = null;
    _ = &path;
    var i: c_int = undefined;
    _ = &i;
    var numpaths: c_int = 0;
    _ = &numpaths;
    if (!(dbus != null)) {
        return @"false" != 0;
    }
    if (SDL_DBus_CallMethodOnConnection(dbus.*.system_conn, &reply, "org.freedesktop.UPower", "/org/freedesktop/UPower", "org.freedesktop.UPower", "GetDisplayDevice", @as(c_int, '\x00'), @as(c_int, 'o'), &path, @as(c_int, '\x00'))) {
        result = @"true" != 0;
        state.* = SDL_POWERSTATE_NO_BATTERY;
        seconds.* = -@as(c_int, 1);
        percent.* = -@as(c_int, 1);
        check_upower_device(dbus.*.system_conn, path, state, seconds, percent);
        SDL_DBus_FreeReply(&reply);
    } else if (SDL_DBus_CallMethodOnConnection(dbus.*.system_conn, null, "org.freedesktop.UPower", "/org/freedesktop/UPower", "org.freedesktop.UPower", "EnumerateDevices", @as(c_int, '\x00'), @as(c_int, 'a'), @as(c_int, 'o'), &paths, &numpaths, @as(c_int, '\x00'))) {
        result = @"true" != 0;
        state.* = SDL_POWERSTATE_NO_BATTERY;
        seconds.* = -@as(c_int, 1);
        percent.* = -@as(c_int, 1);
        {
            i = 0;
            while (i < numpaths) : (i += 1) {
                check_upower_device(dbus.*.system_conn, paths[@bitCast(@as(isize, @intCast(i)))], state, seconds, percent);
            }
        }
        dbus.*.free_string_array.?(paths);
    }
    return result;
}

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const O_RDONLY = @as(c_int, 0o0);
pub const __O_CLOEXEC = __helpers.promoteIntLiteral(c_int, 0o2000000, .octal);
