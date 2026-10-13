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
pub const __ssize_t = c_long;
pub const struct___va_list_tag_2 = extern struct {
    unnamed_0: c_uint = 0,
    unnamed_1: c_uint = 0,
    unnamed_2: ?*anyopaque = null,
    unnamed_3: ?*anyopaque = null,
};
pub const struct__IO_FILE = opaque {
};
pub const FILE = struct__IO_FILE;
pub extern fn fclose(__stream: ?*FILE) c_int;
pub extern fn fopen(noalias __filename: [*c]const u8, noalias __modes: [*c]const u8) ?*FILE;
pub extern fn getline(noalias __lineptr: [*c][*c]u8, noalias __n: [*c]usize, noalias __stream: ?*FILE) __ssize_t;
pub extern fn free(__ptr: ?*anyopaque) void;
pub const Uint32 = u32;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_strncmp_REAL(str1: [*c]const u8, str2: [*c]const u8, maxlen: usize) c_int;
pub const SDL_SYSTEM_THEME_UNKNOWN: c_int = 0;
pub const SDL_SYSTEM_THEME_LIGHT: c_int = 1;
pub const SDL_SYSTEM_THEME_DARK: c_int = 2;
pub const enum_SDL_SystemTheme = c_uint;
pub const SDL_SystemTheme = enum_SDL_SystemTheme;
pub export fn SDL_SystemTheme_Init() bool {
    @setEvalBranchQuota(100000);
    var dbus: [*c]SDL_DBusContext = undefined;
    _ = &dbus;
    var msg: ?*DBusMessage = undefined;
    _ = &msg;
    const static_local_namespace = struct {
        var namespace: [*c]const u8 = "org.freedesktop.appearance";
    };
    _ = &static_local_namespace;
    const static_local_key = struct {
        var key: [*c]const u8 = "color-scheme";
    };
    _ = &static_local_key;
    var reply: ?*DBusMessage = undefined;
    _ = &reply;
    var reply_iter: DBusMessageIter = undefined;
    _ = &reply_iter;
    var variant_outer_iter: DBusMessageIter = undefined;
    _ = &variant_outer_iter;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                dbus = SDL_DBus_GetContext();
                system_theme_data.theme = SDL_SYSTEM_THEME_UNKNOWN;
                system_theme_data.dbus = dbus;
                if (!(dbus != null)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                dbus.*.message_unref.?(reply);
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            2 => {
                return @"false" != 0;
            },
            3 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                msg = dbus.*.message_new_method_call.?("org.freedesktop.portal.Desktop", "/org/freedesktop/portal/desktop", "org.freedesktop.portal.Settings", "Read");
                if (msg != null) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                if (dbus.*.message_append_args.?(msg, @as(c_int, 's'), &static_local_namespace.namespace, @as(c_int, 's'), &static_local_key.key, @as(c_int, '\x00')) != 0) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
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
                dbus.*.bus_add_match.?(dbus.*.session_conn, "type='signal', interface='org.freedesktop.portal.Settings',member='SettingChanged', arg0='org.freedesktop.appearance',arg1='color-scheme'", null);
                _ = dbus.*.connection_add_filter.?(dbus.*.session_conn, &DBus_MessageFilter, @ptrCast(@alignCast(dbus)), null);
                dbus.*.connection_flush.?(dbus.*.session_conn);
                return @"true" != 0;
            },
            8 => {
                reply = dbus.*.connection_send_with_reply_and_block.?(dbus.*.session_conn, msg, 300, null);
                if (reply != null) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
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
                dbus.*.message_unref.?(msg);
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            11 => {
                _ = dbus.*.message_iter_init.?(reply, &reply_iter);
                if (dbus.*.message_iter_get_arg_type.?(&reply_iter) != @as(c_int, 'v')) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
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
                {
                    sdl_pc = 10;
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
                dbus.*.message_iter_recurse.?(&reply_iter, &variant_outer_iter);
                if (!DBus_ExtractThemeVariant(&variant_outer_iter, &system_theme_data.theme)) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
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
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_SystemTheme_Get() SDL_SystemTheme {
    @setEvalBranchQuota(100000);
    if (system_theme_data.theme == @as(SDL_SystemTheme, SDL_SYSTEM_THEME_UNKNOWN)) {
        return UbuntuTouch_GetSystemTheme();
    }
    return system_theme_data.theme;
}

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
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
pub const DBUS_HANDLER_RESULT_HANDLED: c_int = 0;
pub const DBUS_HANDLER_RESULT_NOT_YET_HANDLED: c_int = 1;
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
pub extern fn SDL_SetSystemTheme(theme: SDL_SystemTheme) void;
pub const struct_SystemThemeData = extern struct {
    dbus: [*c]SDL_DBusContext = null,
    theme: SDL_SystemTheme = @import("std").mem.zeroes(SDL_SystemTheme),
};
pub const SystemThemeData = struct_SystemThemeData;
pub var system_theme_data: SystemThemeData = @import("std").mem.zeroes(SystemThemeData);
pub fn DBus_ExtractThemeVariant(iter: [*c]DBusMessageIter, theme: [*c]SDL_SystemTheme) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var dbus: [*c]SDL_DBusContext = undefined;
    _ = &dbus;
    var color_scheme: Uint32 = undefined;
    _ = &color_scheme;
    var variant_iter: DBusMessageIter = undefined;
    _ = &variant_iter;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                dbus = system_theme_data.dbus;
                if (dbus.*.message_iter_get_arg_type.?(iter) != @as(c_int, 'v')) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return @"false" != 0;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                dbus.*.message_iter_recurse.?(iter, &variant_iter);
                if (dbus.*.message_iter_get_arg_type.?(&variant_iter) != @as(c_int, 'u')) {
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
                dbus.*.message_iter_get_basic.?(&variant_iter, @ptrCast(@alignCast(&color_scheme)));
                switch (color_scheme) {
                    @as(Uint32, 0) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(Uint32, 1) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(Uint32, 2) => {
                        sdl_pc = 10;
                        continue;
                    },
                    else => {
                        sdl_pc = 7;
                        continue;
                    },
                }
            },
            7 => {
                return @"true" != 0;
            },
            8 => {
                theme.* = SDL_SYSTEM_THEME_UNKNOWN;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            9 => {
                theme.* = SDL_SYSTEM_THEME_DARK;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            10 => {
                theme.* = SDL_SYSTEM_THEME_LIGHT;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn DBus_MessageFilter(_: ?*DBusConnection, msg: ?*DBusMessage, data: ?*anyopaque) callconv(.c) DBusHandlerResult {
    @setEvalBranchQuota(100000);
    var dbus: [*c]SDL_DBusContext = undefined;
    _ = &dbus;
    var signal_iter: DBusMessageIter = undefined;
    _ = &signal_iter;
    var namespace: [*c]const u8 = undefined;
    _ = &namespace;
    var key: [*c]const u8 = undefined;
    _ = &key;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                dbus = @ptrCast(@alignCast(data));
                if (dbus.*.message_is_signal.?(msg, "org.freedesktop.portal.Settings", "SettingChanged") != 0) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                return DBUS_HANDLER_RESULT_NOT_YET_HANDLED;
            },
            2 => {
                _ = dbus.*.message_iter_init.?(msg, &signal_iter);
                if (dbus.*.message_iter_get_arg_type.?(&signal_iter) != @as(c_int, 's')) {
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
                {
                    sdl_pc = 1;
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
                dbus.*.message_iter_get_basic.?(&signal_iter, @ptrCast(@alignCast(&namespace)));
                if (SDL_strcmp_REAL("org.freedesktop.appearance", namespace) != @as(c_int, 0)) {
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
                if (!(dbus.*.message_iter_next.?(&signal_iter) != 0)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
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
                if (dbus.*.message_iter_get_arg_type.?(&signal_iter) != @as(c_int, 's')) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
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
                dbus.*.message_iter_get_basic.?(&signal_iter, @ptrCast(@alignCast(&key)));
                if (SDL_strcmp_REAL("color-scheme", key) != @as(c_int, 0)) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
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
                if (!(dbus.*.message_iter_next.?(&signal_iter) != 0)) {
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
                if (!DBus_ExtractThemeVariant(&signal_iter, &system_theme_data.theme)) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
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
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            25 => {
                SDL_SetSystemTheme(system_theme_data.theme);
                return DBUS_HANDLER_RESULT_HANDLED;
            },
            else => unreachable,
        }
    }
}
pub export fn UbuntuTouch_GetSystemTheme() SDL_SystemTheme {
    @setEvalBranchQuota(100000);
    var theme: SDL_SystemTheme = SDL_SYSTEM_THEME_UNKNOWN;
    _ = &theme;
    var config_file: ?*FILE = null;
    _ = &config_file;
    var line: [*c]u8 = null;
    _ = &line;
    var line_alloc: usize = 0;
    _ = &line_alloc;
    var line_size: isize = 0;
    _ = &line_size;
    var is_in_general_category: bool = @"false" != 0;
    _ = &is_in_general_category;
    config_file = fopen("/home/phablet/.config/lomiri-ui-toolkit/theme.ini", "r");
    if (!(config_file != null)) {
        config_file = fopen("/home/phablet/.config/ubuntu-ui-toolkit/theme.ini", "r");
        if (!(config_file != null)) {
            return SDL_SYSTEM_THEME_UNKNOWN;
        }
    }
    while ((blk: {
        const tmp = getline(&line, &line_alloc, config_file);
        line_size = tmp;
        break :blk tmp;
    }) != @as(isize, -@as(c_int, 1))) {
        if ((line_size >= @as(isize, 1)) and (@as(c_int, line[@as(c_int, 0)]) == @as(c_int, '['))) {
            is_in_general_category = SDL_strcmp_REAL(line, "[General]\n") == @as(c_int, 0);
        } else if (is_in_general_category and (SDL_strncmp_REAL(line, "theme=", 6) == @as(c_int, 0))) {
            if ((SDL_strcmp_REAL(line, "theme=Lomiri.Components.Themes.SuruDark\n") == @as(c_int, 0)) or (SDL_strcmp_REAL(line, "theme=Ubuntu.Components.Themes.SuruDark\n") == @as(c_int, 0))) {
                theme = SDL_SYSTEM_THEME_DARK;
            } else if ((SDL_strcmp_REAL(line, "theme=Lomiri.Components.Themes.Ambiance\n") == @as(c_int, 0)) or (SDL_strcmp_REAL(line, "theme=Ubuntu.Components.Themes.Ambiance\n") == @as(c_int, 0))) {
                theme = SDL_SYSTEM_THEME_LIGHT;
            } else {
                theme = SDL_SYSTEM_THEME_UNKNOWN;
            }
        }
    }
    free(@ptrCast(@alignCast(line)));
    _ = fclose(config_file);
    return theme;
}
