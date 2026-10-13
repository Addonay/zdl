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
pub const struct___va_list_tag_2 = extern struct {
    unnamed_0: c_uint = 0,
    unnamed_1: c_uint = 0,
    unnamed_2: ?*anyopaque = null,
    unnamed_3: ?*anyopaque = null,
};
pub const __builtin_va_list = [1]struct___va_list_tag_2;
pub const va_list = __builtin_va_list;
pub extern fn free(__ptr: ?*anyopaque) void;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint32 = u32;
pub const Uint64 = u64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_strlen_REAL(str: [*c]const u8) usize;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_strncasecmp_REAL(str1: [*c]const u8, str2: [*c]const u8, maxlen: usize) c_int;
pub const SDL_FunctionPointer = ?*const fn () callconv(.c) void;
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
pub const struct_SDL_AtomicInt = extern struct {
    value: c_int = 0,
};
pub const SDL_AtomicInt = struct_SDL_AtomicInt;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub extern fn SDL_OutOfMemory_REAL() bool;
pub const SDL_ThreadID = Uint64;
pub const struct_SDL_InitState = extern struct {
    status: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
    thread: SDL_ThreadID = 0,
    reserved: ?*anyopaque = null,
};
pub const SDL_InitState = struct_SDL_InitState;
pub extern fn SDL_ShouldInit_REAL(state: [*c]SDL_InitState) bool;
pub extern fn SDL_ShouldQuit_REAL(state: [*c]SDL_InitState) bool;
pub extern fn SDL_SetInitialized_REAL(state: [*c]SDL_InitState, initialized: bool) void;
pub extern fn SDL_GetHint_REAL(name: [*c]const u8) [*c]const u8;
pub extern fn SDL_GetHintBoolean_REAL(name: [*c]const u8, default_value: bool) bool;
pub extern fn SDL_GetAppMetadataProperty_REAL(name: [*c]const u8) [*c]const u8;
pub const struct_SDL_SharedObject = opaque {
};
pub const SDL_SharedObject = struct_SDL_SharedObject;
pub extern fn SDL_LoadObject_REAL(sofile: [*c]const u8) ?*SDL_SharedObject;
pub extern fn SDL_LoadFunction_REAL(handle: ?*SDL_SharedObject, name: [*c]const u8) SDL_FunctionPointer;
pub extern fn SDL_UnloadObject_REAL(handle: ?*SDL_SharedObject) void;
pub const SDL_SANDBOX_NONE: c_int = 0;
pub const enum_SDL_Sandbox = c_uint;
pub const SDL_Sandbox = enum_SDL_Sandbox;
pub extern fn SDL_GetSandbox_REAL() SDL_Sandbox;
pub extern fn SDL_DelayNS_REAL(ns: Uint64) void;
pub extern fn SDL_URIToLocal(src: [*c]const u8, dst: [*c]u8) c_int;
pub extern fn SDL_IsURI(uri: [*c]const u8) bool;
pub const dbus_int32_t = c_int;
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
pub const DBUS_BUS_SESSION: c_int = 0;
pub const DBUS_BUS_SYSTEM: c_int = 1;
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
pub const DBUS_DISPATCH_DATA_REMAINS: c_int = 0;
pub const DBusDispatchStatus = c_uint;
pub const DBusHandleMessageFunction = ?*const fn (connection: ?*DBusConnection, message: ?*DBusMessage, user_data: ?*anyopaque) callconv(.c) DBusHandlerResult;
pub const struct_SDL_ListNode = extern struct {
    entry: ?*anyopaque = null,
    next: [*c]struct_SDL_ListNode = null,
};
pub const SDL_ListNode = struct_SDL_ListNode;
pub const SDL_MENU_ITEM_TYPE_SEPERATOR: c_int = 1;
pub const SDL_MENU_ITEM_TYPE_CHECKBOX: c_int = 2;
pub const enum_SDL_MenuItemType = c_uint;
pub const SDL_MenuItemType = enum_SDL_MenuItemType;
pub const SDL_MENU_ITEM_FLAGS_DISABLED: c_int = 1;
pub const SDL_MENU_ITEM_FLAGS_CHECKED: c_int = 2;
pub const enum_SDL_MenuItemFlags = c_uint;
pub const SDL_MenuItemFlags = enum_SDL_MenuItemFlags;
pub const struct_SDL_MenuItem = extern struct {
    utf8: [*c]const u8 = null,
    type: SDL_MenuItemType = @import("std").mem.zeroes(SDL_MenuItemType),
    flags: SDL_MenuItemFlags = @import("std").mem.zeroes(SDL_MenuItemFlags),
    cb_data: ?*anyopaque = null,
    cb: ?*const fn ([*c]struct_SDL_MenuItem, ?*anyopaque) callconv(.c) void = null,
    sub_menu: [*c]SDL_ListNode = null,
    udata: ?*anyopaque = null,
    udata2: ?*anyopaque = null,
    udata3: ?*anyopaque = null,
};
pub const SDL_MenuItem = struct_SDL_MenuItem;
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
pub export fn SDL_DBus_Init() void {
    @setEvalBranchQuota(100000);
    const static_local_is_dbus_available = struct {
        var is_dbus_available: bool = @"true" != 0;
    };
    _ = &static_local_is_dbus_available;
    var err: DBusError = undefined;
    _ = &err;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (!static_local_is_dbus_available.is_dbus_available) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                static_local_is_dbus_available.is_dbus_available = @"false" != 0;
                SDL_SetInitialized_REAL(&dbus_init, @"true" != 0);
                SDL_DBus_Quit();
                {}
            },
            2 => {
                return;
            },
            3 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                if (!SDL_ShouldInit_REAL(&dbus_init)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                return;
            },
            6 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                if (!LoadDBUSLibrary()) {
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
                if (!(dbus.threads_init_default.?() != 0)) {
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
                dbus.error_init.?(&err);
                dbus.session_conn = dbus.bus_get_private.?(DBUS_BUS_SESSION, &err);
                if (dbus.error_is_set.?(&err) != 0) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                dbus.error_free.?(&err);
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
                dbus.connection_set_exit_on_disconnect.?(dbus.session_conn, 0);
                dbus.system_conn = dbus.bus_get_private.?(DBUS_BUS_SYSTEM, &err);
                if (!(dbus.error_is_set.?(&err) != 0)) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            17 => {
                dbus.connection_set_exit_on_disconnect.?(dbus.system_conn, 0);
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
                dbus.error_free.?(&err);
                SDL_SetInitialized_REAL(&dbus_init, @"true" != 0);
                return;
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_DBus_Quit() void {
    @setEvalBranchQuota(100000);
    if (!SDL_ShouldQuit_REAL(&dbus_init)) {
        return;
    }
    if (dbus.system_conn != null) {
        dbus.connection_close.?(dbus.system_conn);
        dbus.connection_unref.?(dbus.system_conn);
    }
    if (dbus.session_conn != null) {
        dbus.connection_close.?(dbus.session_conn);
        dbus.connection_unref.?(dbus.session_conn);
    }
    if (SDL_GetHintBoolean_REAL("SDL_SHUTDOWN_DBUS_ON_QUIT", @"false" != 0)) {
        if (dbus.shutdown != null) {
            dbus.shutdown.?();
        }
        UnloadDBUSLibrary();
    } else {
        dbus_handle = null;
    }
    _ = memset(@ptrCast(@alignCast(&dbus)), 0, @sizeOf(@TypeOf(dbus)));
    if (inhibit_handle != null) {
        SDL_free_REAL(@ptrCast(@alignCast(inhibit_handle)));
        inhibit_handle = null;
    }
    SDL_SetInitialized_REAL(&dbus_init, @"false" != 0);
}
pub export fn SDL_DBus_GetContext() [*c]SDL_DBusContext {
    @setEvalBranchQuota(100000);
    if (!(dbus_handle != null) or !(dbus.session_conn != null)) {
        SDL_DBus_Init();
    }
    return @ptrCast(@alignCast(if ((dbus_handle != null) and (dbus.session_conn != null)) @as(?*anyopaque, @ptrCast(@alignCast(&dbus))) else @as(?*anyopaque, null)));
}
pub export fn SDL_DBus_CallMethod(save_reply: [*c]?*DBusMessage, node: [*c]const u8, path: [*c]const u8, interface: [*c]const u8, method: [*c]const u8, ...) bool {
    @setEvalBranchQuota(100000);
    var result: bool = undefined;
    _ = &result;
    var ap: va_list = undefined;
    _ = &ap;
    __builtin.va_start(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&ap))), @cVaStart());
    result = SDL_DBus_CallMethodInternal(dbus.session_conn, save_reply, node, path, interface, method, @ptrCast(@alignCast(&ap)));
    __builtin.va_end(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&ap))));
    return result;
}
pub export fn SDL_DBus_CallVoidMethod(node: [*c]const u8, path: [*c]const u8, interface: [*c]const u8, method: [*c]const u8, ...) bool {
    @setEvalBranchQuota(100000);
    var result: bool = undefined;
    _ = &result;
    var ap: va_list = undefined;
    _ = &ap;
    __builtin.va_start(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&ap))), @cVaStart());
    result = SDL_DBus_CallVoidMethodInternal(dbus.session_conn, node, path, interface, method, @ptrCast(@alignCast(&ap)));
    __builtin.va_end(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&ap))));
    return result;
}
pub export fn SDL_DBus_QueryProperty(save_reply: [*c]?*DBusMessage, node: [*c]const u8, path: [*c]const u8, interface: [*c]const u8, property: [*c]const u8, expectedtype: c_int, result: ?*anyopaque) bool {
    @setEvalBranchQuota(100000);
    return SDL_DBus_QueryPropertyOnConnection(dbus.session_conn, save_reply, node, path, interface, property, expectedtype, result);
}
pub export fn SDL_DBus_CallMethodOnConnection(conn: ?*DBusConnection, save_reply: [*c]?*DBusMessage, node: [*c]const u8, path: [*c]const u8, interface: [*c]const u8, method: [*c]const u8, ...) bool {
    @setEvalBranchQuota(100000);
    var result: bool = undefined;
    _ = &result;
    var ap: va_list = undefined;
    _ = &ap;
    __builtin.va_start(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&ap))), @cVaStart());
    result = SDL_DBus_CallMethodInternal(conn, save_reply, node, path, interface, method, @ptrCast(@alignCast(&ap)));
    __builtin.va_end(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&ap))));
    return result;
}
pub export fn SDL_DBus_CallVoidMethodOnConnection(conn: ?*DBusConnection, node: [*c]const u8, path: [*c]const u8, interface: [*c]const u8, method: [*c]const u8, ...) bool {
    @setEvalBranchQuota(100000);
    var result: bool = undefined;
    _ = &result;
    var ap: va_list = undefined;
    _ = &ap;
    __builtin.va_start(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&ap))), @cVaStart());
    result = SDL_DBus_CallVoidMethodInternal(conn, node, path, interface, method, @ptrCast(@alignCast(&ap)));
    __builtin.va_end(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&ap))));
    return result;
}
pub export fn SDL_DBus_QueryPropertyOnConnection(conn: ?*DBusConnection, save_reply: [*c]?*DBusMessage, node: [*c]const u8, path: [*c]const u8, arg_interface: [*c]const u8, arg_property: [*c]const u8, expectedtype: c_int, result: ?*anyopaque) bool {
    @setEvalBranchQuota(100000);
    var interface = arg_interface;
    _ = &interface;
    var property = arg_property;
    _ = &property;
    var retval: bool = @"false" != 0;
    _ = &retval;
    if (conn != null) {
        var msg: ?*DBusMessage = dbus.message_new_method_call.?(node, path, "org.freedesktop.DBus.Properties", "Get");
        _ = &msg;
        if (msg != null) {
            if (dbus.message_append_args.?(msg, @as(c_int, 's'), &interface, @as(c_int, 's'), &property, @as(c_int, '\x00')) != 0) {
                retval = SDL_DBus_CallWithBasicReply(conn, save_reply, msg, expectedtype, result);
            }
            dbus.message_unref.?(msg);
        }
    }
    return retval;
}
pub export fn SDL_DBus_FreeReply(saved_reply: [*c]?*DBusMessage) void {
    @setEvalBranchQuota(100000);
    var reply: ?*DBusMessage = saved_reply.*;
    _ = &reply;
    if (reply != null) {
        dbus.message_unref.?(reply);
        saved_reply.* = null;
    }
}
pub export fn SDL_DBus_ScreensaverTickle() void {
    @setEvalBranchQuota(100000);
    if ((screensaver_cookie == @as(c_uint, 0)) and !(inhibit_handle != null)) {
        _ = SDL_DBus_CallVoidMethod("org.gnome.ScreenSaver", "/org/gnome/ScreenSaver", "org.gnome.ScreenSaver", "SimulateUserActivity", @as(c_int, '\x00'));
        _ = SDL_DBus_CallVoidMethod("org.freedesktop.ScreenSaver", "/org/freedesktop/ScreenSaver", "org.freedesktop.ScreenSaver", "SimulateUserActivity", @as(c_int, '\x00'));
    }
}
pub export fn SDL_DBus_ScreensaverInhibit(inhibit: bool) bool {
    @setEvalBranchQuota(100000);
    const static_local_interface_unavailable = struct {
        var interface_unavailable: bool = @"false" != 0;
    };
    _ = &static_local_interface_unavailable;
    var default_inhibit_reason: [*c]const u8 = "Playing a game";
    _ = &default_inhibit_reason;
    if (static_local_interface_unavailable.interface_unavailable) {
        return @"false" != 0;
    }
    if ((inhibit and ((screensaver_cookie != @as(c_uint, 0)) or (inhibit_handle != null))) or (!inhibit and ((screensaver_cookie == @as(c_uint, 0)) and !(inhibit_handle != null)))) {
        return @"true" != 0;
    }
    if (!(dbus.session_conn != null)) {
        return @"false" != 0;
    }
    if (SDL_GetSandbox_REAL() != @as(SDL_Sandbox, SDL_SANDBOX_NONE)) {
        var bus_name: [*c]const u8 = "org.freedesktop.portal.Desktop";
        _ = &bus_name;
        var path: [*c]const u8 = "/org/freedesktop/portal/desktop";
        _ = &path;
        var interface: [*c]const u8 = "org.freedesktop.portal.Inhibit";
        _ = &interface;
        var window: [*c]const u8 = "";
        _ = &window;
        const static_local_INHIBIT_IDLE = struct {
            const INHIBIT_IDLE: c_uint = 8;
        };
        _ = &static_local_INHIBIT_IDLE;
        var iterInit: DBusMessageIter = undefined;
        _ = &iterInit;
        if (inhibit) {
            var msg: ?*DBusMessage = undefined;
            _ = &msg;
            var result: bool = @"false" != 0;
            _ = &result;
            var key: [*c]const u8 = "reason";
            _ = &key;
            var reply_path: [*c]const u8 = null;
            _ = &reply_path;
            var reason: [*c]const u8 = SDL_GetHint_REAL("SDL_SCREENSAVER_INHIBIT_ACTIVITY_NAME");
            _ = &reason;
            if (!(reason != null) or !(@as(c_int, reason[@as(c_int, 0)]) != 0)) {
                reason = default_inhibit_reason;
            }
            msg = dbus.message_new_method_call.?(bus_name, path, interface, "Inhibit");
            if (!(msg != null)) {
                return @"false" != 0;
            }
            if (!(dbus.message_append_args.?(msg, @as(c_int, 's'), &window, @as(c_int, 'u'), &static_local_INHIBIT_IDLE.INHIBIT_IDLE, @as(c_int, '\x00')) != 0)) {
                dbus.message_unref.?(msg);
                return @"false" != 0;
            }
            dbus.message_iter_init_append.?(msg, &iterInit);
            if (!SDL_DBus_AppendDictWithKeyValue(&iterInit, key, reason)) {
                dbus.message_unref.?(msg);
                return @"false" != 0;
            }
            var reply: ?*DBusMessage = null;
            _ = &reply;
            if (SDL_DBus_CallWithBasicReply(dbus.session_conn, &reply, msg, @as(c_int, 'o'), @ptrCast(@alignCast(&reply_path)))) {
                inhibit_handle = SDL_strdup_REAL(reply_path);
                result = @"true" != 0;
            } else {
                static_local_interface_unavailable.interface_unavailable = @"true" != 0;
            }
            SDL_DBus_FreeReply(&reply);
            dbus.message_unref.?(msg);
            return result;
        } else {
            if (!SDL_DBus_CallVoidMethod(bus_name, inhibit_handle, "org.freedesktop.portal.Request", "Close", @as(c_int, '\x00'))) {
                return @"false" != 0;
            }
            SDL_free_REAL(@ptrCast(@alignCast(inhibit_handle)));
            inhibit_handle = null;
        }
    } else {
        var bus_name: [*c]const u8 = "org.freedesktop.ScreenSaver";
        _ = &bus_name;
        var path: [*c]const u8 = "/org/freedesktop/ScreenSaver";
        _ = &path;
        var interface: [*c]const u8 = "org.freedesktop.ScreenSaver";
        _ = &interface;
        if (inhibit) {
            var app: [*c]const u8 = SDL_GetAppMetadataProperty_REAL("SDL.app.metadata.name");
            _ = &app;
            var reason: [*c]const u8 = SDL_GetHint_REAL("SDL_SCREENSAVER_INHIBIT_ACTIVITY_NAME");
            _ = &reason;
            if (!(reason != null) or !(@as(c_int, reason[@as(c_int, 0)]) != 0)) {
                reason = default_inhibit_reason;
            }
            if (!SDL_DBus_CallMethod(null, bus_name, path, interface, "Inhibit", @as(c_int, 's'), &app, @as(c_int, 's'), &reason, @as(c_int, '\x00'), @as(c_int, 'u'), &screensaver_cookie, @as(c_int, '\x00'))) {
                static_local_interface_unavailable.interface_unavailable = @"true" != 0;
                return @"false" != 0;
            }
            return screensaver_cookie != @as(c_uint, 0);
        } else {
            if (!SDL_DBus_CallVoidMethod(bus_name, path, interface, "UnInhibit", @as(c_int, 'u'), &screensaver_cookie, @as(c_int, '\x00'))) {
                return @"false" != 0;
            }
            screensaver_cookie = 0;
        }
    }
    return @"true" != 0;
}
pub export fn SDL_DBus_OpenURI(arg_uri: [*c]const u8, arg_window_id: [*c]const u8, activation_token: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    var uri = arg_uri;
    _ = &uri;
    var window_id = arg_window_id;
    _ = &window_id;
    const static_local_bus_name = struct {
        var bus_name: [*c]const u8 = "org.freedesktop.portal.Desktop";
    };
    _ = &static_local_bus_name;
    const static_local_path = struct {
        var path: [*c]const u8 = "/org/freedesktop/portal/desktop";
    };
    _ = &static_local_path;
    const static_local_interface = struct {
        var interface: [*c]const u8 = "org.freedesktop.portal.OpenURI";
    };
    _ = &static_local_interface;
    var iterInit: DBusMessageIter = undefined;
    _ = &iterInit;
    var msg: ?*DBusMessage = undefined;
    _ = &msg;
    var fd: c_int = undefined;
    _ = &fd;
    var ret: bool = undefined;
    _ = &ret;
    var has_file_scheme: bool = undefined;
    _ = &has_file_scheme;
    var decoded_path: [*c]u8 = undefined;
    _ = &decoded_path;
    var len: usize = undefined;
    _ = &len;
    var st: struct_stat = undefined;
    _ = &st;
    var oflags: c_int = undefined;
    _ = &oflags;
    var iterArray: DBusMessageIter = undefined;
    _ = &iterArray;
    var reply: ?*DBusMessage = undefined;
    _ = &reply;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (!(dbus.session_conn != null)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                if (msg != null) {
                    sdl_pc = 59;
                    continue;
                } else {
                    sdl_pc = 60;
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
                msg = null;
                fd = -@as(c_int, 1);
                ret = @"false" != 0;
                has_file_scheme = SDL_strncasecmp_REAL(uri, "file:/", 6) == @as(c_int, 0);
                if (has_file_scheme or !SDL_IsURI(uri)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                decoded_path = null;
                if (has_file_scheme) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            6 => {
                msg = dbus.message_new_method_call.?(static_local_bus_name.bus_name, static_local_path.path, static_local_interface.interface, "OpenURI");
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                if (!(msg != null)) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            8 => {
                len = SDL_strlen_REAL(uri) +% @as(usize, 1);
                decoded_path = @ptrCast(@alignCast(SDL_malloc_REAL(len)));
                if (!(decoded_path != null)) {
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
                if (stat(uri, &st) == @as(c_int, 0)) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
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
                if (SDL_URIToLocal(uri, decoded_path) < @as(c_int, 0)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                SDL_free_REAL(@ptrCast(@alignCast(decoded_path)));
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
                uri = decoded_path;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            17 => {
                oflags = O_RDONLY | __O_CLOEXEC;
                if ((st.st_mode & @as(__mode_t, __S_IFMT)) == @as(__mode_t, @bitCast(@as(c_int, __S_IFDIR)))) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
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
                SDL_free_REAL(@ptrCast(@alignCast(decoded_path)));
                if (fd >= @as(c_int, 0)) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            20 => {
                oflags |= __O_DIRECTORY;
                {
                    sdl_pc = 22;
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
                fd = open(uri, oflags);
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            23 => {
                msg = dbus.message_new_method_call.?(static_local_bus_name.bus_name, static_local_path.path, static_local_interface.interface, "OpenFile");
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
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            26 => {
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
                dbus.message_iter_init_append.?(msg, &iterInit);
                if (!(window_id != null)) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            29 => {
                window_id = "";
                {
                    sdl_pc = 31;
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
                if (!(dbus.message_iter_append_basic.?(&iterInit, @as(c_int, 's'), @ptrCast(@alignCast(&window_id))) != 0)) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            32 => {
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
                if (fd >= @as(c_int, 0)) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            35 => {
                if (!(dbus.message_iter_append_basic.?(&iterInit, @as(c_int, 'h'), @ptrCast(@alignCast(&fd))) != 0)) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
                    continue;
                }
            },
            36 => {
                if (!(dbus.message_iter_append_basic.?(&iterInit, @as(c_int, 's'), @ptrCast(@alignCast(&uri))) != 0)) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            37 => {
                if (activation_token != null) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            38 => {
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
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            41 => {
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
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            44 => {
                if (!SDL_DBus_AppendDictWithKeyValue(&iterInit, "activation_token", activation_token)) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            45 => {
                if (!(dbus.message_iter_open_container.?(&iterInit, @as(c_int, 'a'), "{sv}", &iterArray) != 0)) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            46 => {
                reply = dbus.connection_send_with_reply_and_block.?(dbus.session_conn, msg, -@as(c_int, 1), null);
                if (reply != null) {
                    sdl_pc = 56;
                    continue;
                } else {
                    sdl_pc = 57;
                    continue;
                }
            },
            47 => {
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
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            50 => {
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
                if (!(dbus.message_iter_close_container.?(&iterInit, &iterArray) != 0)) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 54;
                    continue;
                }
            },
            53 => {
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
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            56 => {
                ret = @"true" != 0;
                dbus.message_unref.?(reply);
                {
                    sdl_pc = 58;
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
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            59 => {
                dbus.message_unref.?(msg);
                {
                    sdl_pc = 61;
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
                if (fd >= @as(c_int, 0)) {
                    sdl_pc = 62;
                    continue;
                } else {
                    sdl_pc = 63;
                    continue;
                }
            },
            62 => {
                _ = close(fd);
                {
                    sdl_pc = 64;
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
                return ret;
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_DBus_PumpEvents() void {
    @setEvalBranchQuota(100000);
    if (dbus.session_conn != null) {
        _ = dbus.connection_read_write.?(dbus.session_conn, 0);
        while (dbus.connection_dispatch.?(dbus.session_conn) == @as(DBusDispatchStatus, DBUS_DISPATCH_DATA_REMAINS)) {
            SDL_DelayNS_REAL(@as(Uint64, @bitCast(@as(c_long, @as(c_int, 10)))) *% @as(Uint64, SDL_NS_PER_US));
        }
    }
}
pub export fn SDL_DBus_GetLocalMachineId() [*c]u8 {
    @setEvalBranchQuota(100000);
    var err: DBusError = undefined;
    _ = &err;
    var result: [*c]u8 = undefined;
    _ = &result;
    dbus.error_init.?(&err);
    if (dbus.try_get_local_machine_id != null) {
        result = dbus.try_get_local_machine_id.?(&err);
    } else {
        result = dbus.get_local_machine_id.?();
    }
    if (result != null) {
        return result;
    }
    if (dbus.error_is_set.?(&err) != 0) {
        _ = SDL_SetError_REAL("%s: %s", err.name, err.message);
        dbus.error_free.?(&err);
    } else {
        _ = SDL_SetError_REAL("Error getting D-Bus machine ID");
    }
    return null;
}
pub export fn SDL_DBus_DocumentsPortalRetrieveFiles(arg_key: [*c]const u8, path_count: [*c]c_int) [*c][*c]u8 {
    @setEvalBranchQuota(100000);
    var key = arg_key;
    _ = &key;
    var err: DBusError = undefined;
    _ = &err;
    var iter: DBusMessageIter = undefined;
    _ = &iter;
    var iterDict: DBusMessageIter = undefined;
    _ = &iterDict;
    var paths: [*c][*c]u8 = undefined;
    _ = &paths;
    var reply: ?*DBusMessage = undefined;
    _ = &reply;
    var msg: ?*DBusMessage = undefined;
    _ = &msg;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                paths = null;
                reply = null;
                msg = dbus.message_new_method_call.?("org.freedesktop.portal.Documents", "/org/freedesktop/portal/documents", "org.freedesktop.portal.FileTransfer", "RetrieveFiles");
                if (!(SDL_DBus_GetContext() != null) or !(dbus.session_conn != null)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                if (dbus.error_is_set.?(&err) != 0) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
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
                dbus.error_init.?(&err);
                if (!(dbus.message_append_args.?(msg, @as(c_int, 's'), &key, @as(c_int, '\x00')) != 0)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                _ = SDL_OutOfMemory_REAL();
                dbus.message_unref.?(msg);
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
                dbus.message_iter_init_append.?(msg, &iter);
                if (!(dbus.message_iter_open_container.?(&iter, @as(c_int, 'a'), "{sv}", &iterDict) != 0) or !(dbus.message_iter_close_container.?(&iter, &iterDict) != 0)) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                _ = SDL_OutOfMemory_REAL();
                dbus.message_unref.?(msg);
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
                reply = dbus.connection_send_with_reply_and_block.?(dbus.session_conn, msg, -@as(c_int, 1), &err);
                dbus.message_unref.?(msg);
                if (reply != null) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                _ = dbus.message_get_args.?(reply, &err, @as(c_int, 'a'), @as(c_int, 's'), &paths, path_count, @as(c_int, '\x00'));
                dbus.message_unref.?(reply);
                {
                    sdl_pc = 13;
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
                if (paths != null) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                return paths;
            },
            15 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            17 => {
                _ = SDL_SetError_REAL("%s: %s", err.name, err.message);
                dbus.error_free.?(&err);
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            18 => {
                _ = SDL_SetError_REAL("Error retrieving paths for documents portal \"%s\"", key);
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            19 => {
                return null;
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_DBus_CameraPortalRequestAccess() c_int {
    @setEvalBranchQuota(100000);
    var data: SDL_DBus_CameraPortalMessageHandlerData = undefined;
    _ = &data;
    var err: DBusError = undefined;
    _ = &err;
    var iter: DBusMessageIter = undefined;
    _ = &iter;
    var iterDict: DBusMessageIter = undefined;
    _ = &iterDict;
    var reply: ?*DBusMessage = undefined;
    _ = &reply;
    var msg: ?*DBusMessage = undefined;
    _ = &msg;
    var fd: c_int = undefined;
    _ = &fd;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (SDL_GetSandbox_REAL() == @as(SDL_Sandbox, SDL_SANDBOX_NONE)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                if (dbus.error_is_set.?(&err) != 0) {
                    sdl_pc = 56;
                    continue;
                } else {
                    sdl_pc = 57;
                    continue;
                }
            },
            2 => {
                return -@as(c_int, 2);
            },
            3 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                if (!(SDL_DBus_GetContext() != null)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                return -@as(c_int, 2);
            },
            6 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                dbus.error_init.?(&err);
                msg = dbus.message_new_method_call.?("org.freedesktop.portal.Desktop", "/org/freedesktop/portal/desktop", "org.freedesktop.portal.Camera", "AccessCamera");
                dbus.message_iter_init_append.?(msg, &iter);
                if (!(dbus.message_iter_open_container.?(&iter, @as(c_int, 'a'), "{sv}", &iterDict) != 0) or !(dbus.message_iter_close_container.?(&iter, &iterDict) != 0)) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                _ = SDL_OutOfMemory_REAL();
                dbus.message_unref.?(msg);
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
                reply = dbus.connection_send_with_reply_and_block.?(dbus.session_conn, msg, -@as(c_int, 1), &err);
                dbus.message_unref.?(msg);
                if (reply != null) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                _ = dbus.message_get_args.?(reply, &err, @as(c_int, 'o'), &data.path, @as(c_int, '\x00'));
                if (dbus.error_is_set.?(&err) != 0) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            12 => {
                if (dbus.error_has_name.?(&err, "org.freedesktop.DBus.Error.NameHasNoOwner") != 0) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            13 => {
                dbus.bus_add_match.?(dbus.session_conn, "type='signal',        sender='org.freedesktop.DBus',        interface='org.freedesktop.DBus',        member='NameOwnerChanged',        arg0='org.freedesktop.portal.Desktop',        arg2=''", &err);
                if (dbus.error_is_set.?(&err) != 0) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            14 => {
                dbus.message_unref.?(reply);
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
                if (@as(?*anyopaque, @ptrCast(@alignCast(blk: {
                    const tmp = SDL_strdup_REAL(data.path);
                    data.path = tmp;
                    break :blk tmp;
                }))) == @as(?*anyopaque, null)) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            17 => {
                dbus.message_unref.?(reply);
                _ = SDL_OutOfMemory_REAL();
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
                dbus.message_unref.?(reply);
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            20 => {
                return -@as(c_int, 2);
            },
            21 => {
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            22 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            23 => {
                SDL_free_REAL(@ptrCast(@alignCast(data.path)));
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
                data.err = &err;
                data.done = @"false" != 0;
                if (!(dbus.connection_add_filter.?(dbus.session_conn, SDL_DBus_CameraPortalMessageHandler, @ptrCast(@alignCast(&data)), null) != 0)) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            26 => {
                SDL_free_REAL(@ptrCast(@alignCast(data.path)));
                _ = SDL_OutOfMemory_REAL();
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
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            29 => {
                if ((@as(dbus_bool_t, @bitCast(@as(c_int, @intFromBool(!data.done)))) != 0) and (dbus.connection_read_write_dispatch.?(dbus.session_conn, -@as(c_int, 1)) != 0)) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            30 => {
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            31 => {
                dbus.bus_remove_match.?(dbus.session_conn, "type='signal',        sender='org.freedesktop.DBus',        interface='org.freedesktop.DBus',        member='NameOwnerChanged',        arg0='org.freedesktop.portal.Desktop',        arg2=''", &err);
                if (dbus.error_is_set.?(&err) != 0) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            32 => {
                SDL_free_REAL(@ptrCast(@alignCast(data.path)));
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
                _ = dbus.connection_remove_filter.?(dbus.session_conn, SDL_DBus_CameraPortalMessageHandler, @ptrCast(@alignCast(&data)));
                SDL_free_REAL(@ptrCast(@alignCast(data.path)));
                if (!data.done) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            35 => {
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
                if (dbus.error_is_set.?(&err) != 0) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
                    continue;
                }
            },
            38 => {
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
                if ((data.response == @as(u32, 1)) or (data.response == @as(u32, 2))) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            41 => {
                return -@as(c_int, 2);
            },
            42 => {
                if (data.response != @as(u32, 0)) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            43 => {
                msg = dbus.message_new_method_call.?("org.freedesktop.portal.Desktop", "/org/freedesktop/portal/desktop", "org.freedesktop.portal.Camera", "OpenPipeWireRemote");
                dbus.message_iter_init_append.?(msg, &iter);
                if (!(dbus.message_iter_open_container.?(&iter, @as(c_int, 'a'), "{sv}", &iterDict) != 0) or !(dbus.message_iter_close_container.?(&iter, &iterDict) != 0)) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            44 => {
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
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            47 => {
                _ = SDL_OutOfMemory_REAL();
                dbus.message_unref.?(msg);
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
                reply = dbus.connection_send_with_reply_and_block.?(dbus.session_conn, msg, -@as(c_int, 1), &err);
                dbus.message_unref.?(msg);
                if (reply != null) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            50 => {
                _ = dbus.message_get_args.?(reply, &err, @as(c_int, 'h'), &fd, @as(c_int, '\x00'));
                dbus.message_unref.?(reply);
                if (dbus.error_is_set.?(&err) != 0) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 54;
                    continue;
                }
            },
            51 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            52 => {
                return fd;
            },
            53 => {
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
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            56 => {
                if (dbus.error_has_name.?(&err, "org.freedesktop.DBus.Error.NoMemory") != 0) {
                    sdl_pc = 59;
                    continue;
                } else {
                    sdl_pc = 60;
                    continue;
                }
            },
            57 => {
                _ = SDL_SetError_REAL("Error requesting access for the camera");
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            58 => {
                return -@as(c_int, 1);
            },
            59 => {
                _ = SDL_OutOfMemory_REAL();
                {
                    sdl_pc = 61;
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
                _ = SDL_SetError_REAL("%s: %s", err.name, err.message);
                dbus.error_free.?(&err);
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_DBus_CreateMenuItem() [*c]SDL_MenuItem {
    @setEvalBranchQuota(100000);
    var item: [*c]SDL_DBusMenuItem = undefined;
    _ = &item;
    item = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(SDL_DBusMenuItem))));
    item.*.id = 0;
    item.*.revision = 0;
    item.*.cb = null;
    item.*.cbdata = null;
    return @ptrCast(@alignCast(item));
}
pub export fn SDL_DBus_ExportMenu(ctx: [*c]SDL_DBusContext, conn: ?*DBusConnection, menu: [*c]SDL_ListNode) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var vtable: DBusObjectPathVTable = undefined;
    _ = &vtable;
    var next_id: dbus_int32_t = undefined;
    _ = &next_id;
    if (!(ctx != null) or !(menu != null)) {
        return null;
    }
    next_id = 1;
    MenuAssignItemIds(menu, &next_id);
    if (menu.*.entry != null) {
        var item: [*c]SDL_DBusMenuItem = undefined;
        _ = &item;
        item = @ptrCast(@alignCast(menu.*.entry));
        item.*.dbus = ctx;
        item.*.revision +%= 1;
    }
    vtable.message_function = MenuMessageHandler;
    vtable.unregister_function = null;
    if (!(ctx.*.connection_try_register_object_path.?(conn, "/StatusNotifierItem/menu", &vtable, @ptrCast(@alignCast(menu)), null) != 0)) {
        return null;
    }
    return "/StatusNotifierItem/menu";
}
pub export fn SDL_DBus_UpdateMenu(ctx: [*c]SDL_DBusContext, conn: ?*DBusConnection, menu: [*c]SDL_ListNode, path: [*c]const u8, cb: ?*const fn ([*c]SDL_ListNode, [*c]const u8, ?*anyopaque) callconv(.c) void, cbdata: ?*anyopaque, flags: u8) void {
    @setEvalBranchQuota(100000);
    var signal: ?*DBusMessage = undefined;
    _ = &signal;
    var revision: dbus_uint32_t = undefined;
    _ = &revision;
    var next_id: dbus_int32_t = undefined;
    _ = &next_id;
    var item: [*c]SDL_DBusMenuItem = undefined;
    _ = &item;
    var udata: ?*anyopaque = undefined;
    _ = &udata;
    var vtable: DBusObjectPathVTable = undefined;
    _ = &vtable;
    var vtable_1: DBusObjectPathVTable = undefined;
    _ = &vtable_1;
    var item_2: [*c]SDL_DBusMenuItem = undefined;
    _ = &item_2;
    var parent: dbus_int32_t = undefined;
    _ = &parent;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (!(ctx != null)) {
                    sdl_pc = 3;
                    continue;
                } else {
                    sdl_pc = 4;
                    continue;
                }
            },
            1 => {
                if (path != null) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            2 => {
                if (path != null) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 34;
                    continue;
                }
            },
            3 => {
                return;
            },
            4 => {
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            5 => {
                if (!(menu != null)) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 7;
                    continue;
                }
            },
            6 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            7 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            8 => {
                next_id = MenuGetMaxItemId(menu) + @as(c_int, 1);
                MenuAssignItemIds(menu, &next_id);
                revision = 0;
                if (menu.*.entry != null) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
            },
            9 => {
                item = @ptrCast(@alignCast(menu.*.entry));
                item.*.revision +%= 1;
                item.*.dbus = ctx;
                revision = item.*.revision;
                {
                    sdl_pc = 11;
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
                if ((@as(c_int, flags) & (@as(c_int, 1) << @intCast(@as(c_int, 0)))) != 0) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 13;
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
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            15 => {
                _ = ctx.*.connection_get_object_path_data.?(conn, path, &udata);
                if (udata != @as(?*anyopaque, @ptrCast(@alignCast(menu)))) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            16 => {
                if (!(menu != null)) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            18 => {
                vtable.message_function = MenuMessageHandler;
                vtable.unregister_function = null;
                _ = ctx.*.connection_unregister_object_path.?(conn, path);
                _ = ctx.*.connection_try_register_object_path.?(conn, path, &vtable, @ptrCast(@alignCast(menu)), null);
                ctx.*.connection_flush.?(conn);
                if (cb != null) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            19 => {
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            20 => {
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            21 => {
                cb.?(menu, null, cbdata);
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
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            24 => {
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            25 => {
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            26 => {
                next_id = MenuGetMaxItemId(menu) + @as(c_int, 1);
                MenuAssignItemIds(menu, &next_id);
                revision = 0;
                if (menu.*.entry != null) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            27 => {
                item_2 = @ptrCast(@alignCast(menu.*.entry));
                item_2.*.dbus = ctx;
                item_2.*.revision +%= 1;
                revision = item_2.*.revision;
                {
                    sdl_pc = 29;
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
                vtable_1.message_function = MenuMessageHandler;
                vtable_1.unregister_function = null;
                _ = ctx.*.connection_try_register_object_path.?(conn, "/StatusNotifierItem/menu", &vtable_1, @ptrCast(@alignCast(menu)), null);
                ctx.*.connection_flush.?(conn);
                if (cb != null) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            30 => {
                cb.?(menu, "/StatusNotifierItem/menu", cbdata);
                {
                    sdl_pc = 32;
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
                ctx.*.connection_flush.?(conn);
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            33 => {
                signal = ctx.*.message_new_signal.?(path, "com.canonical.dbusmenu", "LayoutUpdated");
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            34 => {
                signal = ctx.*.message_new_signal.?("/StatusNotifierItem/menu", "com.canonical.dbusmenu", "LayoutUpdated");
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            35 => {
                if (signal != null) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 37;
                    continue;
                }
            },
            36 => {
                parent = 0;
                _ = ctx.*.message_append_args.?(signal, @as(c_int, 'u'), &revision, @as(c_int, 'i'), &parent, @as(c_int, '\x00'));
                _ = ctx.*.connection_send.?(conn, signal, null);
                ctx.*.message_unref.?(signal);
                ctx.*.connection_flush.?(conn);
                {
                    sdl_pc = 38;
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
                {}
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_DBus_RegisterMenuOpenCallback(menu: [*c]SDL_ListNode, cb: ?*const fn ([*c]SDL_ListNode, ?*anyopaque) callconv(.c) bool, cbdata: ?*anyopaque) void {
    @setEvalBranchQuota(100000);
    var item: [*c]SDL_DBusMenuItem = undefined;
    _ = &item;
    item = @ptrCast(@alignCast(menu.*.entry));
    item.*.cb = cb;
    item.*.cbdata = cbdata;
}
pub export fn SDL_DBus_TransferMenuItemProperties(src: [*c]SDL_MenuItem, dst: [*c]SDL_MenuItem) void {
    @setEvalBranchQuota(100000);
    var src_dbus: [*c]SDL_DBusMenuItem = undefined;
    _ = &src_dbus;
    var dst_dbus: [*c]SDL_DBusMenuItem = undefined;
    _ = &dst_dbus;
    src_dbus = @ptrCast(@alignCast(src));
    dst_dbus = @ptrCast(@alignCast(dst));
    dst_dbus.*.dbus = src_dbus.*.dbus;
    dst_dbus.*.revision = src_dbus.*.revision;
    dst_dbus.*.cb = src_dbus.*.cb;
    dst_dbus.*.cbdata = src_dbus.*.cbdata;
}
pub export fn SDL_DBus_RetractMenu(ctx: [*c]SDL_DBusContext, conn: ?*DBusConnection, path: [*c][*c]const u8) void {
    @setEvalBranchQuota(100000);
    _ = ctx.*.connection_unregister_object_path.?(conn, path.*);
    path.* = null;
}

pub const va_start = @compileError("unable to translate macro: undefined identifier `__builtin_va_start`");
// /home/addo/dev/stupid/zdl/.cache/zig-lib/compiler/aro/include/stdarg.h:12:9
pub inline fn va_end(ap: anytype) @TypeOf(__builtin.va_end(ap)) {
    @setEvalBranchQuota(100000);
    _ = &ap;
    return __builtin.va_end(ap);
}
pub const va_arg = @compileError("unable to translate macro: undefined identifier `__builtin_va_arg`");
// /home/addo/dev/stupid/zdl/.cache/zig-lib/compiler/aro/include/stdarg.h:15:9
pub inline fn va_copy(d: anytype, s: anytype) @TypeOf(__builtin.va_copy(d, s)) {
    @setEvalBranchQuota(100000);
    _ = &d;
    _ = &s;
    return __builtin.va_copy(d, s);
}
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_ELF_NOTE_DLOPEN = @compileError("unable to translate C expr: unexpected token '__VA_ARGS__'");
// /home/addo/dev/stupid/zdl/.ref/SDL/include/SDL3/SDL_dlopennote.h:212:9
pub const SDL_NS_PER_US = @as(c_int, 1000);
pub const TRUE = @as(c_int, 1);
pub const FALSE = @as(c_int, 0);
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
pub extern fn open(__file: [*c]const u8, __oflag: c_int, ...) c_int;
pub extern fn stat(noalias __file: [*c]const u8, noalias __buf: [*c]struct_stat) c_int;
pub extern fn close(__fd: c_int) c_int;
pub extern fn truncate(__file: [*c]const u8, __length: __off_t) c_int;
pub const struct_SDL_DBusMenuItem = extern struct {
    _parent: SDL_MenuItem = @import("std").mem.zeroes(SDL_MenuItem),
    dbus: [*c]SDL_DBusContext = null,
    id: dbus_int32_t = 0,
    revision: dbus_uint32_t = 0,
    cbdata: ?*anyopaque = null,
    cb: ?*const fn ([*c]SDL_ListNode, ?*anyopaque) callconv(.c) bool = null,
};
pub const SDL_DBusMenuItem = struct_SDL_DBusMenuItem;
pub var dbus_library: [*c]const u8 = "libdbus-1.so.3";
pub var dbus_handle: ?*SDL_SharedObject = null;
pub var inhibit_handle: [*c]u8 = null;
pub var screensaver_cookie: c_uint = 0;
pub var dbus: SDL_DBusContext = @import("std").mem.zeroes(SDL_DBusContext);
pub var menu_introspect: [*c]const u8 = "<?xml version=\"1.0\"?><node name=\"/\"><interface name=\"com.canonical.dbusmenu\"><property name=\"Version\" type=\"u\" access=\"read\"></property><property name=\"TextDirection\" type=\"s\" access=\"read\"></property><property name=\"Status\" type=\"s\" access=\"read\"></property><property name=\"IconThemePath\" type=\"as\" access=\"read\"></property><method name=\"GetLayout\"><arg type=\"i\" name=\"parentId\" direction=\"in\"></arg><arg type=\"i\" name=\"recursionDepth\" direction=\"in\"></arg><arg type=\"as\" name=\"propertyNames\" direction=\"in\"></arg><arg type=\"u\" name=\"revision\" direction=\"out\"></arg><arg type=\"(ia{sv}av)\" name=\"layout\" direction=\"out\"></arg></method><method name=\"GetGroupProperties\"><arg type=\"ai\" name=\"ids\" direction=\"in\"></arg><arg type=\"as\" name=\"propertyNames\" direction=\"in\"></arg><arg type=\"a(ia{sv})\" name=\"properties\" direction=\"out\"></arg></method><method name=\"GetProperty\"><arg type=\"i\" name=\"id\" direction=\"in\"></arg><arg type=\"s\" name=\"name\" direction=\"in\"></arg><arg type=\"v\" name=\"value\" direction=\"out\"></arg></method><method name=\"Event\"><arg type=\"i\" name=\"id\" direction=\"in\"></arg><arg type=\"s\" name=\"eventId\" direction=\"in\"></arg><arg type=\"v\" name=\"data\" direction=\"in\"></arg><arg type=\"u\" name=\"timestamp\" direction=\"in\"></arg></method><method name=\"EventGroup\"><arg type=\"a(isvu)\" name=\"events\" direction=\"in\"></arg><arg type=\"ai\" name=\"idErrors\" direction=\"out\"></arg></method><method name=\"AboutToShow\"><arg type=\"i\" name=\"id\" direction=\"in\"></arg><arg type=\"b\" name=\"needUpdate\" direction=\"out\"></arg></method><method name=\"AboutToShowGroup\"><arg type=\"ai\" name=\"ids\" direction=\"in\"></arg><arg type=\"ai\" name=\"updatesNeeded\" direction=\"out\"></arg><arg type=\"ai\" name=\"idErrors\" direction=\"out\"></arg></method><signal name=\"ItemsPropertiesUpdated\"><arg type=\"a(ia{sv})\" name=\"updatedProps\" direction=\"out\"/><arg type=\"a(ias)\" name=\"removedProps\" direction=\"out\"/></signal><signal name=\"LayoutUpdated\"><arg type=\"u\" name=\"revision\" direction=\"out\"></arg><arg type=\"i\" name=\"parent\" direction=\"out\"></arg></signal><signal name=\"ItemActivationRequested\"><arg type=\"i\" name=\"id\" direction=\"out\"></arg><arg type=\"u\" name=\"timestamp\" direction=\"out\"></arg></signal></interface></node>";
pub fn LoadDBUSSyms() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (!((blk: {
        const tmp = @as(?*const fn (DBusBusType, [*c]DBusError) callconv(.c) ?*DBusConnection, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_bus_get_private")))));
        dbus.bus_get_private = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn (?*DBusConnection, [*c]DBusError) callconv(.c) dbus_bool_t, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_bus_register")))));
        dbus.bus_register = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn (?*DBusConnection, [*c]const u8, [*c]DBusError) callconv(.c) void, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_bus_add_match")))));
        dbus.bus_add_match = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn (?*DBusConnection, [*c]const u8, [*c]DBusError) callconv(.c) void, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_bus_remove_match")))));
        dbus.bus_remove_match = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn (?*DBusConnection) callconv(.c) [*c]const u8, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_bus_get_unique_name")))));
        dbus.bus_get_unique_name = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn ([*c]const u8, [*c]DBusError) callconv(.c) ?*DBusConnection, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_connection_open_private")))));
        dbus.connection_open_private = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn (?*DBusConnection, dbus_bool_t) callconv(.c) void, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_connection_set_exit_on_disconnect")))));
        dbus.connection_set_exit_on_disconnect = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn (?*DBusConnection) callconv(.c) dbus_bool_t, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_connection_get_is_connected")))));
        dbus.connection_get_is_connected = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn (?*DBusConnection, DBusHandleMessageFunction, ?*anyopaque, DBusFreeFunction) callconv(.c) dbus_bool_t, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_connection_add_filter")))));
        dbus.connection_add_filter = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn (?*DBusConnection, DBusHandleMessageFunction, ?*anyopaque) callconv(.c) dbus_bool_t, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_connection_remove_filter")))));
        dbus.connection_remove_filter = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn (?*DBusConnection, [*c]const u8, [*c]const DBusObjectPathVTable, ?*anyopaque, [*c]DBusError) callconv(.c) dbus_bool_t, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_connection_try_register_object_path")))));
        dbus.connection_try_register_object_path = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn (?*DBusConnection, ?*DBusMessage, [*c]dbus_uint32_t) callconv(.c) dbus_bool_t, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_connection_send")))));
        dbus.connection_send = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn (?*DBusConnection, ?*DBusMessage, c_int, [*c]DBusError) callconv(.c) ?*DBusMessage, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_connection_send_with_reply_and_block")))));
        dbus.connection_send_with_reply_and_block = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn (?*DBusConnection) callconv(.c) void, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_connection_close")))));
        dbus.connection_close = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn (?*DBusConnection) callconv(.c) void, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_connection_ref")))));
        dbus.connection_ref = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn (?*DBusConnection) callconv(.c) void, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_connection_unref")))));
        dbus.connection_unref = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn (?*DBusConnection) callconv(.c) void, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_connection_flush")))));
        dbus.connection_flush = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn (?*DBusConnection, c_int) callconv(.c) dbus_bool_t, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_connection_read_write")))));
        dbus.connection_read_write = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn (?*DBusConnection, c_int) callconv(.c) dbus_bool_t, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_connection_read_write_dispatch")))));
        dbus.connection_read_write_dispatch = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn (?*DBusConnection) callconv(.c) DBusDispatchStatus, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_connection_dispatch")))));
        dbus.connection_dispatch = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn (c_int) callconv(.c) dbus_bool_t, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_type_is_fixed")))));
        dbus.type_is_fixed = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn (?*DBusMessage, [*c]const u8, [*c]const u8) callconv(.c) dbus_bool_t, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_message_is_signal")))));
        dbus.message_is_signal = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn (?*DBusMessage, [*c]const u8) callconv(.c) dbus_bool_t, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_message_has_path")))));
        dbus.message_has_path = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn ([*c]const u8, [*c]const u8, [*c]const u8, [*c]const u8) callconv(.c) ?*DBusMessage, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_message_new_method_call")))));
        dbus.message_new_method_call = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn ([*c]const u8, [*c]const u8, [*c]const u8) callconv(.c) ?*DBusMessage, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_message_new_signal")))));
        dbus.message_new_signal = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn (?*DBusMessage, dbus_bool_t) callconv(.c) void, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_message_set_no_reply")))));
        dbus.message_set_no_reply = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn (?*DBusMessage, c_int, ...) callconv(.c) dbus_bool_t, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_message_append_args")))));
        dbus.message_append_args = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn (?*DBusMessage, c_int, [*c]struct___va_list_tag_2) callconv(.c) dbus_bool_t, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_message_append_args_valist")))));
        dbus.message_append_args_valist = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn (?*DBusMessage, [*c]DBusMessageIter) callconv(.c) void, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_message_iter_init_append")))));
        dbus.message_iter_init_append = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn ([*c]DBusMessageIter, c_int, [*c]const u8, [*c]DBusMessageIter) callconv(.c) dbus_bool_t, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_message_iter_open_container")))));
        dbus.message_iter_open_container = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn ([*c]DBusMessageIter, c_int, ?*const anyopaque) callconv(.c) dbus_bool_t, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_message_iter_append_basic")))));
        dbus.message_iter_append_basic = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn ([*c]DBusMessageIter, [*c]DBusMessageIter) callconv(.c) dbus_bool_t, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_message_iter_close_container")))));
        dbus.message_iter_close_container = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn (?*DBusMessage, [*c]DBusError, c_int, ...) callconv(.c) dbus_bool_t, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_message_get_args")))));
        dbus.message_get_args = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn (?*DBusMessage, [*c]DBusError, c_int, [*c]struct___va_list_tag_2) callconv(.c) dbus_bool_t, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_message_get_args_valist")))));
        dbus.message_get_args_valist = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn (?*DBusMessage, [*c]DBusMessageIter) callconv(.c) dbus_bool_t, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_message_iter_init")))));
        dbus.message_iter_init = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn ([*c]DBusMessageIter) callconv(.c) dbus_bool_t, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_message_iter_next")))));
        dbus.message_iter_next = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn ([*c]DBusMessageIter, ?*anyopaque) callconv(.c) void, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_message_iter_get_basic")))));
        dbus.message_iter_get_basic = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn ([*c]DBusMessageIter) callconv(.c) c_int, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_message_iter_get_arg_type")))));
        dbus.message_iter_get_arg_type = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn ([*c]DBusMessageIter, [*c]DBusMessageIter) callconv(.c) void, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_message_iter_recurse")))));
        dbus.message_iter_recurse = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn (?*DBusMessage) callconv(.c) void, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_message_unref")))));
        dbus.message_unref = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn () callconv(.c) dbus_bool_t, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_threads_init_default")))));
        dbus.threads_init_default = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn ([*c]DBusError) callconv(.c) void, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_error_init")))));
        dbus.error_init = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn ([*c]const DBusError) callconv(.c) dbus_bool_t, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_error_is_set")))));
        dbus.error_is_set = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn ([*c]const DBusError, [*c]const u8) callconv(.c) dbus_bool_t, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_error_has_name")))));
        dbus.error_has_name = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn ([*c]DBusError) callconv(.c) void, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_error_free")))));
        dbus.error_free = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn () callconv(.c) [*c]u8, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_get_local_machine_id")))));
        dbus.get_local_machine_id = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    dbus.try_get_local_machine_id = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_try_get_local_machine_id"))));
    if (!((blk: {
        const tmp = @as(?*const fn (?*anyopaque) callconv(.c) void, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_free")))));
        dbus.free = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn ([*c][*c]u8) callconv(.c) void, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_free_string_array")))));
        dbus.free_string_array = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = SDL_LoadFunction_REAL(dbus_handle, "dbus_shutdown");
        dbus.shutdown = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn (?*DBusConnection, [*c]const u8, c_uint, [*c]DBusError) callconv(.c) c_int, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_bus_request_name")))));
        dbus.bus_request_name = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn (?*DBusMessage, [*c]const u8, [*c]const u8) callconv(.c) dbus_bool_t, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_message_is_method_call")))));
        dbus.message_is_method_call = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn (?*DBusMessage, [*c]const u8, [*c]const u8) callconv(.c) ?*DBusMessage, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_message_new_error")))));
        dbus.message_new_error = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn (?*DBusMessage) callconv(.c) ?*DBusMessage, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_message_new_method_return")))));
        dbus.message_new_method_return = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn ([*c]DBusMessageIter, c_int, ?*const anyopaque, c_int) callconv(.c) dbus_bool_t, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_message_iter_append_fixed_array")))));
        dbus.message_iter_append_fixed_array = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn ([*c]DBusMessageIter, ?*anyopaque, [*c]c_int) callconv(.c) void, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_message_iter_get_fixed_array")))));
        dbus.message_iter_get_fixed_array = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn (?*DBusConnection, [*c]const u8, [*c]?*anyopaque) callconv(.c) dbus_bool_t, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_connection_get_object_path_data")))));
        dbus.connection_get_object_path_data = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    if (!((blk: {
        const tmp = @as(?*const fn (?*DBusConnection, [*c]const u8) callconv(.c) dbus_bool_t, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dbus_handle, "dbus_connection_unregister_object_path")))));
        dbus.connection_unregister_object_path = tmp;
        break :blk tmp;
    }) != null)) return @"false" != 0;
    return @"true" != 0;
}
pub fn UnloadDBUSLibrary() callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (dbus_handle != null) {
        SDL_UnloadObject_REAL(dbus_handle);
        dbus_handle = null;
    }
}
pub fn LoadDBUSLibrary() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var result: bool = @"true" != 0;
    _ = &result;
    if (!(dbus_handle != null)) {
        dbus_handle = SDL_LoadObject_REAL(dbus_library);
        if (!(dbus_handle != null)) {
            result = @"false" != 0;
        } else {
            result = LoadDBUSSyms();
            if (!result) {
                UnloadDBUSLibrary();
            }
        }
    }
    return result;
}
pub var dbus_init: SDL_InitState = @import("std").mem.zeroes(SDL_InitState);
pub fn SDL_DBus_CallMethodInternal(conn: ?*DBusConnection, save_reply: [*c]?*DBusMessage, node: [*c]const u8, path: [*c]const u8, interface: [*c]const u8, method: [*c]const u8, ap: [*c]struct___va_list_tag_2) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var result: bool = @"false" != 0;
    _ = &result;
    if (conn != null) {
        var msg: ?*DBusMessage = dbus.message_new_method_call.?(node, path, interface, method);
        _ = &msg;
        if (msg != null) {
            var firstarg: c_int = undefined;
            _ = &firstarg;
            var ap_reply: va_list = undefined;
            _ = &ap_reply;
            __builtin.va_copy(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&ap_reply))), ap);
            firstarg = __builtin.va_arg(ap, c_int);
            if ((@as(dbus_bool_t, @bitCast(@as(c_int, @intFromBool(firstarg == @as(c_int, '\x00'))))) != 0) or (dbus.message_append_args_valist.?(msg, firstarg, ap) != 0)) {
                var reply: ?*DBusMessage = dbus.connection_send_with_reply_and_block.?(conn, msg, 300, null);
                _ = &reply;
                if (reply != null) {
                    while ((blk: {
                        const tmp = __builtin.va_arg(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&ap_reply))), c_int);
                        firstarg = tmp;
                        break :blk tmp;
                    }) != @as(c_int, '\x00')) {
                        {
                            var dumpptr: ?*anyopaque = __builtin.va_arg(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&ap_reply))), ?*anyopaque);
                            _ = &dumpptr;
                            _ = &dumpptr;
                        }
                        if (firstarg == @as(c_int, 'a')) {
                            {
                                const dumpint: c_int = __builtin.va_arg(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&ap_reply))), c_int);
                                _ = &dumpint;
                                _ = &dumpint;
                            }
                        }
                    }
                    firstarg = __builtin.va_arg(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&ap_reply))), c_int);
                    if ((@as(dbus_bool_t, @bitCast(@as(c_int, @intFromBool(firstarg == @as(c_int, '\x00'))))) != 0) or (dbus.message_get_args_valist.?(reply, null, firstarg, @ptrCast(@alignCast(&ap_reply))) != 0)) {
                        result = @"true" != 0;
                    }
                    if (save_reply != null) {
                        save_reply.* = reply;
                    } else {
                        dbus.message_unref.?(reply);
                    }
                }
            }
            __builtin.va_end(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&ap_reply))));
            dbus.message_unref.?(msg);
        }
    }
    return result;
}
pub fn SDL_DBus_CallVoidMethodInternal(conn: ?*DBusConnection, node: [*c]const u8, path: [*c]const u8, interface: [*c]const u8, method: [*c]const u8, ap: [*c]struct___va_list_tag_2) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var result: bool = @"false" != 0;
    _ = &result;
    if (conn != null) {
        var msg: ?*DBusMessage = dbus.message_new_method_call.?(node, path, interface, method);
        _ = &msg;
        if (msg != null) {
            var firstarg: c_int = __builtin.va_arg(ap, c_int);
            _ = &firstarg;
            if ((@as(dbus_bool_t, @bitCast(@as(c_int, @intFromBool(firstarg == @as(c_int, '\x00'))))) != 0) or (dbus.message_append_args_valist.?(msg, firstarg, ap) != 0)) {
                dbus.message_set_no_reply.?(msg, @"true");
                if (dbus.connection_send.?(conn, msg, null) != 0) {
                    dbus.connection_flush.?(conn);
                    result = @"true" != 0;
                }
            }
            dbus.message_unref.?(msg);
        }
    }
    return result;
}
pub fn SDL_DBus_CallWithBasicReply(conn: ?*DBusConnection, save_reply: [*c]?*DBusMessage, msg: ?*DBusMessage, expectedtype: c_int, result: ?*anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    _ = &expectedtype;
    const static_local___func__ = struct {
        const __func__: [27:0]u8 = "SDL_DBus_CallWithBasicReply".*;
    };
    _ = &static_local___func__;
    var retval: bool = @"false" != 0;
    _ = &retval;
    while (true) {
        while (!((@as(?*anyopaque, @ptrCast(@alignCast(save_reply))) == @as(?*anyopaque, null)) or (@as(?*anyopaque, @ptrCast(@alignCast(save_reply.*))) == @as(?*anyopaque, null)))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "save_reply == ((void*)0) || *save_reply == ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_dbus.c", 386);
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
        while (!((@as(dbus_bool_t, @bitCast(@as(c_int, @intFromBool(@as(?*anyopaque, @ptrCast(@alignCast(save_reply))) != @as(?*anyopaque, null))))) != 0) or (dbus.type_is_fixed.?(expectedtype) != 0))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "save_reply != ((void*)0) || dbus.type_is_fixed(expectedtype)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_dbus.c", 387);
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
    var reply: ?*DBusMessage = dbus.connection_send_with_reply_and_block.?(conn, msg, 300, null);
    _ = &reply;
    if (reply != null) {
        var iter: DBusMessageIter = undefined;
        _ = &iter;
        var actual_iter: DBusMessageIter = undefined;
        _ = &actual_iter;
        _ = dbus.message_iter_init.?(reply, &iter);
        if (dbus.message_iter_get_arg_type.?(&iter) == @as(c_int, 'v')) {
            dbus.message_iter_recurse.?(&iter, &actual_iter);
        } else {
            actual_iter = iter;
        }
        if (dbus.message_iter_get_arg_type.?(&actual_iter) == expectedtype) {
            dbus.message_iter_get_basic.?(&actual_iter, result);
            retval = @"true" != 0;
        }
        if (save_reply != null) {
            save_reply.* = reply;
        } else {
            dbus.message_unref.?(reply);
        }
    }
    return retval;
}
pub fn SDL_DBus_AppendDictWithKeysAndValues(iterInit: [*c]DBusMessageIter, keys: [*c][*c]const u8, values: [*c][*c]const u8, count: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var iterDict: DBusMessageIter = undefined;
    _ = &iterDict;
    var i: c_int = undefined;
    _ = &i;
    var iterEntry: DBusMessageIter = undefined;
    _ = &iterEntry;
    var iterValue: DBusMessageIter = undefined;
    _ = &iterValue;
    var key: [*c]const u8 = undefined;
    _ = &key;
    var value: [*c]const u8 = undefined;
    _ = &value;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (!(dbus.message_iter_open_container.?(iterInit, @as(c_int, 'a'), "{sv}", &iterDict) != 0)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                return @"false" != 0;
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
                i = 0;
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            5 => {
                if (i < count) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            6 => {
                key = keys[@bitCast(@as(isize, @intCast(i)))];
                value = values[@bitCast(@as(isize, @intCast(i)))];
                if (!(dbus.message_iter_open_container.?(&iterDict, @as(c_int, 'e'), null, &iterEntry) != 0)) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
            },
            7 => {
                i += 1;
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            8 => {
                if (!(dbus.message_iter_close_container.?(iterInit, &iterDict) != 0)) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            9 => {
                {
                    sdl_pc = 1;
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
                if (!(dbus.message_iter_append_basic.?(&iterEntry, @as(c_int, 's'), @ptrCast(@alignCast(&key))) != 0)) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 1;
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
                if (!(dbus.message_iter_open_container.?(&iterEntry, @as(c_int, 'v'), "s", &iterValue) != 0)) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            15 => {
                {
                    sdl_pc = 1;
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
                if (!(dbus.message_iter_append_basic.?(&iterValue, @as(c_int, 's'), @ptrCast(@alignCast(&value))) != 0)) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            18 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            19 => {
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            20 => {
                if (!(dbus.message_iter_close_container.?(&iterEntry, &iterValue) != 0) or !(dbus.message_iter_close_container.?(&iterDict, &iterEntry) != 0)) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            21 => {
                {
                    sdl_pc = 1;
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
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            24 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            25 => {
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            26 => {
                return @"true" != 0;
            },
            else => unreachable,
        }
    }
}
pub fn SDL_DBus_AppendDictWithKeyValue(iterInit: [*c]DBusMessageIter, key: [*c]const u8, value: [*c]const u8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var keys: [1][*c]const u8 = undefined;
    _ = &keys;
    var values: [1][*c]const u8 = undefined;
    _ = &values;
    keys[@as(c_int, 0)] = key;
    values[@as(c_int, 0)] = value;
    return SDL_DBus_AppendDictWithKeysAndValues(iterInit, @ptrCast(@alignCast(&keys)), @ptrCast(@alignCast(&values)), 1);
}
pub const struct_SDL_DBus_CameraPortalMessageHandlerData = extern struct {
    response: u32 = 0,
    path: [*c]u8 = null,
    err: [*c]DBusError = null,
    done: bool = false,
};
pub const SDL_DBus_CameraPortalMessageHandlerData = struct_SDL_DBus_CameraPortalMessageHandlerData;
pub fn SDL_DBus_CameraPortalMessageHandler(_: ?*DBusConnection, msg: ?*DBusMessage, v: ?*anyopaque) callconv(.c) DBusHandlerResult {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_DBus_CameraPortalMessageHandlerData = @ptrCast(@alignCast(v));
    _ = &data;
    var name: [*c]const u8 = undefined;
    _ = &name;
    var old: [*c]const u8 = undefined;
    _ = &old;
    var new: [*c]const u8 = undefined;
    _ = &new;
    if (dbus.message_is_signal.?(msg, "org.freedesktop.DBus", "NameOwnerChanged") != 0) {
        if (!(dbus.message_get_args.?(msg, data.*.err, @as(c_int, 's'), &name, @as(c_int, 's'), &old, @as(c_int, 's'), &new, @as(c_int, '\x00')) != 0)) {
            data.*.done = @"true" != 0;
            return DBUS_HANDLER_RESULT_NOT_YET_HANDLED;
        }
        if ((SDL_strcmp_REAL(name, "org.freedesktop.portal.Desktop") != @as(c_int, 0)) or (SDL_strcmp_REAL(new, "") != @as(c_int, 0))) {
            return DBUS_HANDLER_RESULT_NOT_YET_HANDLED;
        }
        data.*.done = @"true" != 0;
        data.*.response = @bitCast(@as(c_int, -@as(c_int, 1)));
        return DBUS_HANDLER_RESULT_HANDLED;
    }
    if (!(dbus.message_has_path.?(msg, data.*.path) != 0) or !(dbus.message_is_signal.?(msg, "org.freedesktop.portal.Request", "Response") != 0)) {
        return DBUS_HANDLER_RESULT_NOT_YET_HANDLED;
    }
    _ = dbus.message_get_args.?(msg, data.*.err, @as(c_int, 'u'), &data.*.response, @as(c_int, '\x00'));
    data.*.done = @"true" != 0;
    return DBUS_HANDLER_RESULT_HANDLED;
}
pub fn MenuGetItemById(menu: [*c]SDL_ListNode, id: dbus_int32_t) callconv(.c) [*c]SDL_DBusMenuItem {
    @setEvalBranchQuota(100000);
    var cursor: [*c]SDL_ListNode = undefined;
    _ = &cursor;
    cursor = menu;
    while (cursor != null) {
        var item: [*c]SDL_MenuItem = undefined;
        _ = &item;
        var dbus_item: [*c]SDL_DBusMenuItem = undefined;
        _ = &dbus_item;
        item = @ptrCast(@alignCast(cursor.*.entry));
        dbus_item = @ptrCast(@alignCast(cursor.*.entry));
        if (dbus_item.*.id == id) {
            return dbus_item;
        }
        if (item.*.sub_menu != null) {
            var found: [*c]SDL_DBusMenuItem = undefined;
            _ = &found;
            found = MenuGetItemById(item.*.sub_menu, id);
            if (found != null) {
                return found;
            }
        }
        cursor = cursor.*.next;
    }
    return null;
}
pub fn MenuAppendItemProperties(ctx: [*c]SDL_DBusContext, dbus_item: [*c]SDL_DBusMenuItem, dict_iter: [*c]DBusMessageIter) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var item: [*c]SDL_MenuItem = undefined;
    _ = &item;
    var entry_iter: DBusMessageIter = undefined;
    _ = &entry_iter;
    var variant_iter: DBusMessageIter = undefined;
    _ = &variant_iter;
    var key: [*c]const u8 = undefined;
    _ = &key;
    var value: [*c]const u8 = undefined;
    _ = &value;
    var value_int: c_int = undefined;
    _ = &value_int;
    var value_bool: dbus_bool_t = undefined;
    _ = &value_bool;
    item = @ptrCast(@alignCast(dbus_item));
    key = "label";
    value = if (item.*.utf8 != null) item.*.utf8 else @as([*c]const u8, @ptrCast(@alignCast(@as([*c]u8, @as([*c]u8, @constCast(""))))));
    _ = ctx.*.message_iter_open_container.?(dict_iter, @as(c_int, 'e'), null, &entry_iter);
    _ = ctx.*.message_iter_append_basic.?(&entry_iter, @as(c_int, 's'), @ptrCast(@alignCast(&key)));
    _ = ctx.*.message_iter_open_container.?(&entry_iter, @as(c_int, 'v'), "s", &variant_iter);
    _ = ctx.*.message_iter_append_basic.?(&variant_iter, @as(c_int, 's'), @ptrCast(@alignCast(&value)));
    _ = ctx.*.message_iter_close_container.?(&entry_iter, &variant_iter);
    _ = ctx.*.message_iter_close_container.?(dict_iter, &entry_iter);
    key = "type";
    if (item.*.type == @as(SDL_MenuItemType, SDL_MENU_ITEM_TYPE_SEPERATOR)) {
        value = "separator";
    } else {
        value = "standard";
    }
    _ = ctx.*.message_iter_open_container.?(dict_iter, @as(c_int, 'e'), null, &entry_iter);
    _ = ctx.*.message_iter_append_basic.?(&entry_iter, @as(c_int, 's'), @ptrCast(@alignCast(&key)));
    _ = ctx.*.message_iter_open_container.?(&entry_iter, @as(c_int, 'v'), "s", &variant_iter);
    _ = ctx.*.message_iter_append_basic.?(&variant_iter, @as(c_int, 's'), @ptrCast(@alignCast(&value)));
    _ = ctx.*.message_iter_close_container.?(&entry_iter, &variant_iter);
    _ = ctx.*.message_iter_close_container.?(dict_iter, &entry_iter);
    key = "enabled";
    value_bool = @bitCast(@as(c_int, @intFromBool(!((item.*.flags & @as(SDL_MenuItemFlags, SDL_MENU_ITEM_FLAGS_DISABLED)) != 0))));
    _ = ctx.*.message_iter_open_container.?(dict_iter, @as(c_int, 'e'), null, &entry_iter);
    _ = ctx.*.message_iter_append_basic.?(&entry_iter, @as(c_int, 's'), @ptrCast(@alignCast(&key)));
    _ = ctx.*.message_iter_open_container.?(&entry_iter, @as(c_int, 'v'), "b", &variant_iter);
    _ = ctx.*.message_iter_append_basic.?(&variant_iter, @as(c_int, 'b'), @ptrCast(@alignCast(&value_bool)));
    _ = ctx.*.message_iter_close_container.?(&entry_iter, &variant_iter);
    _ = ctx.*.message_iter_close_container.?(dict_iter, &entry_iter);
    key = "visible";
    value_bool = TRUE;
    _ = ctx.*.message_iter_open_container.?(dict_iter, @as(c_int, 'e'), null, &entry_iter);
    _ = ctx.*.message_iter_append_basic.?(&entry_iter, @as(c_int, 's'), @ptrCast(@alignCast(&key)));
    _ = ctx.*.message_iter_open_container.?(&entry_iter, @as(c_int, 'v'), "b", &variant_iter);
    _ = ctx.*.message_iter_append_basic.?(&variant_iter, @as(c_int, 'b'), @ptrCast(@alignCast(&value_bool)));
    _ = ctx.*.message_iter_close_container.?(&entry_iter, &variant_iter);
    _ = ctx.*.message_iter_close_container.?(dict_iter, &entry_iter);
    key = "toggle-type";
    value = if (item.*.type == @as(SDL_MenuItemType, SDL_MENU_ITEM_TYPE_CHECKBOX)) @as([*c]u8, @as([*c]u8, @constCast("checkmark"))) else @as([*c]u8, @as([*c]u8, @constCast("")));
    _ = ctx.*.message_iter_open_container.?(dict_iter, @as(c_int, 'e'), null, &entry_iter);
    _ = ctx.*.message_iter_append_basic.?(&entry_iter, @as(c_int, 's'), @ptrCast(@alignCast(&key)));
    _ = ctx.*.message_iter_open_container.?(&entry_iter, @as(c_int, 'v'), "s", &variant_iter);
    _ = ctx.*.message_iter_append_basic.?(&variant_iter, @as(c_int, 's'), @ptrCast(@alignCast(&value)));
    _ = ctx.*.message_iter_close_container.?(&entry_iter, &variant_iter);
    _ = ctx.*.message_iter_close_container.?(dict_iter, &entry_iter);
    key = "toggle-state";
    value_int = if ((item.*.flags & @as(SDL_MenuItemFlags, SDL_MENU_ITEM_FLAGS_CHECKED)) != 0) @as(c_int, 1) else @as(c_int, 0);
    _ = ctx.*.message_iter_open_container.?(dict_iter, @as(c_int, 'e'), null, &entry_iter);
    _ = ctx.*.message_iter_append_basic.?(&entry_iter, @as(c_int, 's'), @ptrCast(@alignCast(&key)));
    _ = ctx.*.message_iter_open_container.?(&entry_iter, @as(c_int, 'v'), "i", &variant_iter);
    _ = ctx.*.message_iter_append_basic.?(&variant_iter, @as(c_int, 'i'), @ptrCast(@alignCast(&value_int)));
    _ = ctx.*.message_iter_close_container.?(&entry_iter, &variant_iter);
    _ = ctx.*.message_iter_close_container.?(dict_iter, &entry_iter);
    key = "children-display";
    value = if (item.*.sub_menu != null) @as([*c]u8, @as([*c]u8, @constCast("submenu"))) else @as([*c]u8, @as([*c]u8, @constCast("")));
    _ = ctx.*.message_iter_open_container.?(dict_iter, @as(c_int, 'e'), null, &entry_iter);
    _ = ctx.*.message_iter_append_basic.?(&entry_iter, @as(c_int, 's'), @ptrCast(@alignCast(&key)));
    _ = ctx.*.message_iter_open_container.?(&entry_iter, @as(c_int, 'v'), "s", &variant_iter);
    _ = ctx.*.message_iter_append_basic.?(&variant_iter, @as(c_int, 's'), @ptrCast(@alignCast(&value)));
    _ = ctx.*.message_iter_close_container.?(&entry_iter, &variant_iter);
    _ = ctx.*.message_iter_close_container.?(dict_iter, &entry_iter);
}
pub fn MenuAppendItem(ctx: [*c]SDL_DBusContext, dbus_item: [*c]SDL_DBusMenuItem, array_iter: [*c]DBusMessageIter, depth: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var item: [*c]SDL_MenuItem = undefined;
    _ = &item;
    var struct_iter: DBusMessageIter = undefined;
    _ = &struct_iter;
    var dict_iter: DBusMessageIter = undefined;
    _ = &dict_iter;
    var children_iter: DBusMessageIter = undefined;
    _ = &children_iter;
    item = @ptrCast(@alignCast(dbus_item));
    _ = ctx.*.message_iter_open_container.?(array_iter, @as(c_int, 'r'), null, &struct_iter);
    _ = ctx.*.message_iter_append_basic.?(&struct_iter, @as(c_int, 'i'), @ptrCast(@alignCast(&dbus_item.*.id)));
    _ = ctx.*.message_iter_open_container.?(&struct_iter, @as(c_int, 'a'), "{sv}", &dict_iter);
    MenuAppendItemProperties(ctx, dbus_item, &dict_iter);
    _ = ctx.*.message_iter_close_container.?(&struct_iter, &dict_iter);
    _ = ctx.*.message_iter_open_container.?(&struct_iter, @as(c_int, 'a'), "v", &children_iter);
    if ((item.*.sub_menu != null) and (depth > @as(c_int, 0))) {
        var cursor: [*c]SDL_ListNode = undefined;
        _ = &cursor;
        cursor = item.*.sub_menu;
        while (cursor != null) {
            var child: [*c]SDL_DBusMenuItem = undefined;
            _ = &child;
            var variant_iter: DBusMessageIter = undefined;
            _ = &variant_iter;
            child = @ptrCast(@alignCast(cursor.*.entry));
            _ = ctx.*.message_iter_open_container.?(&children_iter, @as(c_int, 'v'), "(ia{sv}av)", &variant_iter);
            MenuAppendItem(ctx, child, &variant_iter, depth - @as(c_int, 1));
            _ = ctx.*.message_iter_close_container.?(&children_iter, &variant_iter);
            cursor = cursor.*.next;
        }
    }
    _ = ctx.*.message_iter_close_container.?(&struct_iter, &children_iter);
    _ = ctx.*.message_iter_close_container.?(array_iter, &struct_iter);
}
pub fn MenuHandleGetLayout(ctx: [*c]SDL_DBusContext, menu: [*c]SDL_ListNode, conn: ?*DBusConnection, msg: ?*DBusMessage) callconv(.c) DBusHandlerResult {
    @setEvalBranchQuota(100000);
    var reply: ?*DBusMessage = undefined;
    _ = &reply;
    var reply_iter: DBusMessageIter = undefined;
    _ = &reply_iter;
    var struct_iter: DBusMessageIter = undefined;
    _ = &struct_iter;
    var dict_iter: DBusMessageIter = undefined;
    _ = &dict_iter;
    var children_iter: DBusMessageIter = undefined;
    _ = &children_iter;
    var entry_iter: DBusMessageIter = undefined;
    _ = &entry_iter;
    var variant_iter: DBusMessageIter = undefined;
    _ = &variant_iter;
    var args: DBusMessageIter = undefined;
    _ = &args;
    var key: [*c]const u8 = undefined;
    _ = &key;
    var val: [*c]const u8 = undefined;
    _ = &val;
    var parent_id: dbus_int32_t = undefined;
    _ = &parent_id;
    var recursion_depth: dbus_int32_t = undefined;
    _ = &recursion_depth;
    var root_id: dbus_int32_t = undefined;
    _ = &root_id;
    var revision: dbus_uint32_t = undefined;
    _ = &revision;
    _ = ctx.*.message_iter_init.?(msg, &args);
    if (ctx.*.message_iter_get_arg_type.?(&args) != @as(c_int, 'i')) {
        return DBUS_HANDLER_RESULT_NOT_YET_HANDLED;
    }
    ctx.*.message_iter_get_basic.?(&args, @ptrCast(@alignCast(&parent_id)));
    _ = ctx.*.message_iter_next.?(&args);
    if (ctx.*.message_iter_get_arg_type.?(&args) != @as(c_int, 'i')) {
        return DBUS_HANDLER_RESULT_NOT_YET_HANDLED;
    }
    ctx.*.message_iter_get_basic.?(&args, @ptrCast(@alignCast(&recursion_depth)));
    if (recursion_depth == -@as(c_int, 1)) {
        recursion_depth = 100;
    }
    reply = ctx.*.message_new_method_return.?(msg);
    ctx.*.message_iter_init_append.?(reply, &reply_iter);
    revision = 0;
    if (menu != null) {
        if (menu.*.entry != null) {
            revision = @as([*c]SDL_DBusMenuItem, @ptrCast(@alignCast(menu.*.entry))).*.revision;
        }
    }
    _ = ctx.*.message_iter_append_basic.?(&reply_iter, @as(c_int, 'u'), @ptrCast(@alignCast(&revision)));
    _ = ctx.*.message_iter_open_container.?(&reply_iter, @as(c_int, 'r'), null, &struct_iter);
    root_id = 0;
    _ = ctx.*.message_iter_append_basic.?(&struct_iter, @as(c_int, 'i'), @ptrCast(@alignCast(&root_id)));
    key = "children-display";
    val = "submenu";
    _ = ctx.*.message_iter_open_container.?(&struct_iter, @as(c_int, 'a'), "{sv}", &dict_iter);
    _ = ctx.*.message_iter_open_container.?(&dict_iter, @as(c_int, 'e'), null, &entry_iter);
    _ = ctx.*.message_iter_append_basic.?(&entry_iter, @as(c_int, 's'), @ptrCast(@alignCast(&key)));
    _ = ctx.*.message_iter_open_container.?(&entry_iter, @as(c_int, 'v'), "s", &variant_iter);
    _ = ctx.*.message_iter_append_basic.?(&variant_iter, @as(c_int, 's'), @ptrCast(@alignCast(&val)));
    _ = ctx.*.message_iter_close_container.?(&entry_iter, &variant_iter);
    _ = ctx.*.message_iter_close_container.?(&dict_iter, &entry_iter);
    _ = ctx.*.message_iter_close_container.?(&struct_iter, &dict_iter);
    _ = ctx.*.message_iter_open_container.?(&struct_iter, @as(c_int, 'a'), "v", &children_iter);
    if (!(parent_id != 0) and (menu != null)) {
        var cursor: [*c]SDL_ListNode = undefined;
        _ = &cursor;
        cursor = menu;
        while (cursor != null) {
            var item: [*c]SDL_MenuItem = undefined;
            _ = &item;
            var dbus_item: [*c]SDL_DBusMenuItem = undefined;
            _ = &dbus_item;
            var cvariant_iter: DBusMessageIter = undefined;
            _ = &cvariant_iter;
            var item_struct: DBusMessageIter = undefined;
            _ = &item_struct;
            var item_dict: DBusMessageIter = undefined;
            _ = &item_dict;
            var item_children: DBusMessageIter = undefined;
            _ = &item_children;
            item = @ptrCast(@alignCast(cursor.*.entry));
            dbus_item = @ptrCast(@alignCast(cursor.*.entry));
            _ = ctx.*.message_iter_open_container.?(&children_iter, @as(c_int, 'v'), "(ia{sv}av)", &cvariant_iter);
            _ = ctx.*.message_iter_open_container.?(&cvariant_iter, @as(c_int, 'r'), null, &item_struct);
            _ = ctx.*.message_iter_append_basic.?(&item_struct, @as(c_int, 'i'), @ptrCast(@alignCast(&dbus_item.*.id)));
            _ = ctx.*.message_iter_open_container.?(&item_struct, @as(c_int, 'a'), "{sv}", &item_dict);
            MenuAppendItemProperties(ctx, dbus_item, &item_dict);
            _ = ctx.*.message_iter_close_container.?(&item_struct, &item_dict);
            _ = ctx.*.message_iter_open_container.?(&item_struct, @as(c_int, 'a'), "v", &item_children);
            if ((item.*.sub_menu != null) and (recursion_depth != 0)) {
                var child_cursor: [*c]SDL_ListNode = undefined;
                _ = &child_cursor;
                child_cursor = item.*.sub_menu;
                while (child_cursor != null) {
                    var child: [*c]SDL_DBusMenuItem = undefined;
                    _ = &child;
                    var child_variant: DBusMessageIter = undefined;
                    _ = &child_variant;
                    child = @ptrCast(@alignCast(child_cursor.*.entry));
                    _ = ctx.*.message_iter_open_container.?(&item_children, @as(c_int, 'v'), "(ia{sv}av)", &child_variant);
                    MenuAppendItem(ctx, child, &child_variant, recursion_depth - @as(c_int, 1));
                    _ = ctx.*.message_iter_close_container.?(&item_children, &child_variant);
                    child_cursor = child_cursor.*.next;
                }
            }
            _ = ctx.*.message_iter_close_container.?(&item_struct, &item_children);
            _ = ctx.*.message_iter_close_container.?(&cvariant_iter, &item_struct);
            _ = ctx.*.message_iter_close_container.?(&children_iter, &cvariant_iter);
            cursor = cursor.*.next;
        }
    } else if (parent_id != 0) {
        var parent: [*c]SDL_DBusMenuItem = undefined;
        _ = &parent;
        var parent_item: [*c]SDL_MenuItem = undefined;
        _ = &parent_item;
        parent = MenuGetItemById(menu, parent_id);
        parent_item = @ptrCast(@alignCast(parent));
        if ((parent_item != null) and (parent_item.*.sub_menu != null)) {
            var cursor: [*c]SDL_ListNode = undefined;
            _ = &cursor;
            cursor = parent_item.*.sub_menu;
            while (cursor != null) {
                var item: [*c]SDL_MenuItem = undefined;
                _ = &item;
                var dbus_item: [*c]SDL_DBusMenuItem = undefined;
                _ = &dbus_item;
                var cvariant_iter: DBusMessageIter = undefined;
                _ = &cvariant_iter;
                var item_struct: DBusMessageIter = undefined;
                _ = &item_struct;
                var item_dict: DBusMessageIter = undefined;
                _ = &item_dict;
                var item_children: DBusMessageIter = undefined;
                _ = &item_children;
                item = @ptrCast(@alignCast(cursor.*.entry));
                dbus_item = @ptrCast(@alignCast(cursor.*.entry));
                _ = ctx.*.message_iter_open_container.?(&children_iter, @as(c_int, 'v'), "(ia{sv}av)", &cvariant_iter);
                _ = ctx.*.message_iter_open_container.?(&cvariant_iter, @as(c_int, 'r'), null, &item_struct);
                _ = ctx.*.message_iter_append_basic.?(&item_struct, @as(c_int, 'i'), @ptrCast(@alignCast(&dbus_item.*.id)));
                _ = ctx.*.message_iter_open_container.?(&item_struct, @as(c_int, 'a'), "{sv}", &item_dict);
                MenuAppendItemProperties(ctx, dbus_item, &item_dict);
                _ = ctx.*.message_iter_close_container.?(&item_struct, &item_dict);
                _ = ctx.*.message_iter_open_container.?(&item_struct, @as(c_int, 'a'), "v", &item_children);
                if ((item.*.sub_menu != null) and (recursion_depth != 0)) {
                    var child_cursor: [*c]SDL_ListNode = undefined;
                    _ = &child_cursor;
                    child_cursor = item.*.sub_menu;
                    while (child_cursor != null) {
                        var child: [*c]SDL_DBusMenuItem = undefined;
                        _ = &child;
                        var child_variant: DBusMessageIter = undefined;
                        _ = &child_variant;
                        child = @ptrCast(@alignCast(child_cursor.*.entry));
                        _ = ctx.*.message_iter_open_container.?(&item_children, @as(c_int, 'v'), "(ia{sv}av)", &child_variant);
                        MenuAppendItem(ctx, child, &child_variant, recursion_depth - @as(c_int, 1));
                        _ = ctx.*.message_iter_close_container.?(&item_children, &child_variant);
                        child_cursor = child_cursor.*.next;
                    }
                }
                _ = ctx.*.message_iter_close_container.?(&item_struct, &item_children);
                _ = ctx.*.message_iter_close_container.?(&cvariant_iter, &item_struct);
                _ = ctx.*.message_iter_close_container.?(&children_iter, &cvariant_iter);
                cursor = cursor.*.next;
            }
        }
    }
    _ = ctx.*.message_iter_close_container.?(&struct_iter, &children_iter);
    _ = ctx.*.message_iter_close_container.?(&reply_iter, &struct_iter);
    _ = ctx.*.connection_send.?(conn, reply, null);
    ctx.*.message_unref.?(reply);
    return DBUS_HANDLER_RESULT_HANDLED;
}
pub fn MenuHandleEvent(ctx: [*c]SDL_DBusContext, menu: [*c]SDL_ListNode, conn: ?*DBusConnection, msg: ?*DBusMessage) callconv(.c) DBusHandlerResult {
    @setEvalBranchQuota(100000);
    var item: [*c]SDL_MenuItem = undefined;
    _ = &item;
    var dbus_item: [*c]SDL_DBusMenuItem = undefined;
    _ = &dbus_item;
    var reply: ?*DBusMessage = undefined;
    _ = &reply;
    var event_id: [*c]const u8 = undefined;
    _ = &event_id;
    var args: DBusMessageIter = undefined;
    _ = &args;
    var id: Uint32 = undefined;
    _ = &id;
    _ = ctx.*.message_iter_init.?(msg, &args);
    ctx.*.message_iter_get_basic.?(&args, @ptrCast(@alignCast(&id)));
    _ = ctx.*.message_iter_next.?(&args);
    ctx.*.message_iter_get_basic.?(&args, @ptrCast(@alignCast(&event_id)));
    item = null;
    dbus_item = null;
    if (!(SDL_strcmp_REAL(event_id, "clicked") != 0)) {
        dbus_item = MenuGetItemById(menu, @bitCast(@as(c_uint, @truncate(id))));
        item = @ptrCast(@alignCast(dbus_item));
    }
    reply = ctx.*.message_new_method_return.?(msg);
    _ = ctx.*.connection_send.?(conn, reply, null);
    ctx.*.message_unref.?(reply);
    if (item != null) {
        if (item.*.type == @as(SDL_MenuItemType, SDL_MENU_ITEM_TYPE_CHECKBOX)) {
            item.*.flags ^= SDL_MENU_ITEM_FLAGS_CHECKED;
            SDL_DBus_UpdateMenu(ctx, conn, menu, null, null, null, @bitCast(@as(i8, @truncate(@as(c_int, 1) << @intCast(@as(c_int, 0))))));
        }
        if (item.*.cb != null) {
            item.*.cb.?(item, item.*.cb_data);
        }
    }
    return DBUS_HANDLER_RESULT_HANDLED;
}
pub fn MenuHandleEventGroup(ctx: [*c]SDL_DBusContext, menu: [*c]SDL_ListNode, conn: ?*DBusConnection, msg: ?*DBusMessage) callconv(.c) DBusHandlerResult {
    @setEvalBranchQuota(100000);
    var reply: ?*DBusMessage = undefined;
    _ = &reply;
    var reply_iter: DBusMessageIter = undefined;
    _ = &reply_iter;
    var id_errors_iter: DBusMessageIter = undefined;
    _ = &id_errors_iter;
    var args: DBusMessageIter = undefined;
    _ = &args;
    var array_iter: DBusMessageIter = undefined;
    _ = &array_iter;
    _ = ctx.*.message_iter_init.?(msg, &args);
    if (ctx.*.message_iter_get_arg_type.?(&args) == @as(c_int, 'a')) {
        ctx.*.message_iter_recurse.?(&args, &array_iter);
        while (ctx.*.message_iter_get_arg_type.?(&array_iter) == @as(c_int, 'r')) {
            var struct_iter: DBusMessageIter = undefined;
            _ = &struct_iter;
            var event_id: [*c]const u8 = undefined;
            _ = &event_id;
            var id: dbus_int32_t = undefined;
            _ = &id;
            ctx.*.message_iter_recurse.?(&array_iter, &struct_iter);
            if (ctx.*.message_iter_get_arg_type.?(&struct_iter) == @as(c_int, 'i')) {
                ctx.*.message_iter_get_basic.?(&struct_iter, @ptrCast(@alignCast(&id)));
                _ = ctx.*.message_iter_next.?(&struct_iter);
                if (ctx.*.message_iter_get_arg_type.?(&struct_iter) == @as(c_int, 's')) {
                    ctx.*.message_iter_get_basic.?(&struct_iter, @ptrCast(@alignCast(&event_id)));
                    if (!(SDL_strcmp_REAL(event_id, "clicked") != 0)) {
                        var dbus_item: [*c]SDL_DBusMenuItem = undefined;
                        _ = &dbus_item;
                        var item: [*c]SDL_MenuItem = undefined;
                        _ = &item;
                        dbus_item = MenuGetItemById(menu, id);
                        item = @ptrCast(@alignCast(dbus_item));
                        if (item != null) {
                            if (item.*.type == @as(SDL_MenuItemType, SDL_MENU_ITEM_TYPE_CHECKBOX)) {
                                item.*.flags ^= SDL_MENU_ITEM_FLAGS_CHECKED;
                                SDL_DBus_UpdateMenu(ctx, conn, menu, null, null, null, @bitCast(@as(i8, @truncate(@as(c_int, 1) << @intCast(@as(c_int, 0))))));
                            }
                            if (item.*.cb != null) {
                                item.*.cb.?(item, item.*.cb_data);
                            }
                        }
                    }
                }
            }
            _ = ctx.*.message_iter_next.?(&array_iter);
        }
    }
    reply = ctx.*.message_new_method_return.?(msg);
    ctx.*.message_iter_init_append.?(reply, &reply_iter);
    _ = ctx.*.message_iter_open_container.?(&reply_iter, @as(c_int, 'a'), "i", &id_errors_iter);
    _ = ctx.*.message_iter_close_container.?(&reply_iter, &id_errors_iter);
    _ = ctx.*.connection_send.?(conn, reply, null);
    ctx.*.message_unref.?(reply);
    return DBUS_HANDLER_RESULT_HANDLED;
}
pub fn MenuHandleGetProperty(ctx: [*c]SDL_DBusContext, menu: [*c]SDL_ListNode, conn: ?*DBusConnection, msg: ?*DBusMessage) callconv(.c) DBusHandlerResult {
    @setEvalBranchQuota(100000);
    var item: [*c]SDL_MenuItem = undefined;
    _ = &item;
    var dbus_item: [*c]SDL_DBusMenuItem = undefined;
    _ = &dbus_item;
    var reply: ?*DBusMessage = undefined;
    _ = &reply;
    var property: [*c]const u8 = undefined;
    _ = &property;
    var val: [*c]const u8 = undefined;
    _ = &val;
    var args: DBusMessageIter = undefined;
    _ = &args;
    var iter: DBusMessageIter = undefined;
    _ = &iter;
    var variant_iter: DBusMessageIter = undefined;
    _ = &variant_iter;
    var id: dbus_int32_t = undefined;
    _ = &id;
    var int_val: c_int = undefined;
    _ = &int_val;
    var bool_val: dbus_bool_t = undefined;
    _ = &bool_val;
    _ = ctx.*.message_iter_init.?(msg, &args);
    if (ctx.*.message_iter_get_arg_type.?(&args) != @as(c_int, 'i')) {
        return DBUS_HANDLER_RESULT_NOT_YET_HANDLED;
    }
    ctx.*.message_iter_get_basic.?(&args, @ptrCast(@alignCast(&id)));
    _ = ctx.*.message_iter_next.?(&args);
    if (ctx.*.message_iter_get_arg_type.?(&args) != @as(c_int, 's')) {
        return DBUS_HANDLER_RESULT_NOT_YET_HANDLED;
    }
    ctx.*.message_iter_get_basic.?(&args, @ptrCast(@alignCast(&property)));
    dbus_item = MenuGetItemById(menu, id);
    item = @ptrCast(@alignCast(dbus_item));
    if (!(item != null)) {
        var @"error": ?*DBusMessage = undefined;
        _ = &@"error";
        @"error" = ctx.*.message_new_error.?(msg, "com.canonical.dbusmenu.Error", "Item not found");
        _ = ctx.*.connection_send.?(conn, @"error", null);
        ctx.*.message_unref.?(@"error");
        return DBUS_HANDLER_RESULT_HANDLED;
    }
    reply = ctx.*.message_new_method_return.?(msg);
    ctx.*.message_iter_init_append.?(reply, &iter);
    if (!(SDL_strcmp_REAL(property, "label") != 0)) {
        val = if (item.*.utf8 != null) item.*.utf8 else @as([*c]const u8, @ptrCast(@alignCast(@as([*c]u8, @as([*c]u8, @constCast(""))))));
        _ = ctx.*.message_iter_open_container.?(&iter, @as(c_int, 'v'), "s", &variant_iter);
        _ = ctx.*.message_iter_append_basic.?(&variant_iter, @as(c_int, 's'), @ptrCast(@alignCast(&val)));
        _ = ctx.*.message_iter_close_container.?(&iter, &variant_iter);
    } else if (!(SDL_strcmp_REAL(property, "enabled") != 0)) {
        bool_val = @bitCast(@as(c_int, @intFromBool(!((item.*.flags & @as(SDL_MenuItemFlags, SDL_MENU_ITEM_FLAGS_DISABLED)) != 0))));
        _ = ctx.*.message_iter_open_container.?(&iter, @as(c_int, 'v'), "b", &variant_iter);
        _ = ctx.*.message_iter_append_basic.?(&variant_iter, @as(c_int, 'b'), @ptrCast(@alignCast(&bool_val)));
        _ = ctx.*.message_iter_close_container.?(&iter, &variant_iter);
    } else if (!(SDL_strcmp_REAL(property, "visible") != 0)) {
        bool_val = 1;
        _ = ctx.*.message_iter_open_container.?(&iter, @as(c_int, 'v'), "b", &variant_iter);
        _ = ctx.*.message_iter_append_basic.?(&variant_iter, @as(c_int, 'b'), @ptrCast(@alignCast(&bool_val)));
        _ = ctx.*.message_iter_close_container.?(&iter, &variant_iter);
    } else if (!(SDL_strcmp_REAL(property, "type") != 0)) {
        if (item.*.type == @as(SDL_MenuItemType, SDL_MENU_ITEM_TYPE_SEPERATOR)) {
            val = "separator";
        } else {
            val = "standard";
        }
        _ = ctx.*.message_iter_open_container.?(&iter, @as(c_int, 'v'), "s", &variant_iter);
        _ = ctx.*.message_iter_append_basic.?(&variant_iter, @as(c_int, 's'), @ptrCast(@alignCast(&val)));
        _ = ctx.*.message_iter_close_container.?(&iter, &variant_iter);
    } else if (!(SDL_strcmp_REAL(property, "toggle-type") != 0)) {
        if (item.*.type == @as(SDL_MenuItemType, SDL_MENU_ITEM_TYPE_CHECKBOX)) {
            val = "checkmark";
        } else {
            val = "";
        }
        _ = ctx.*.message_iter_open_container.?(&iter, @as(c_int, 'v'), "s", &variant_iter);
        _ = ctx.*.message_iter_append_basic.?(&variant_iter, @as(c_int, 's'), @ptrCast(@alignCast(&val)));
        _ = ctx.*.message_iter_close_container.?(&iter, &variant_iter);
    } else if (!(SDL_strcmp_REAL(property, "toggle-state") != 0)) {
        int_val = if ((item.*.flags & @as(SDL_MenuItemFlags, SDL_MENU_ITEM_FLAGS_CHECKED)) != 0) @as(c_int, 1) else @as(c_int, 0);
        _ = ctx.*.message_iter_open_container.?(&iter, @as(c_int, 'v'), "i", &variant_iter);
        _ = ctx.*.message_iter_append_basic.?(&variant_iter, @as(c_int, 'i'), @ptrCast(@alignCast(&int_val)));
        _ = ctx.*.message_iter_close_container.?(&iter, &variant_iter);
    } else if (!(SDL_strcmp_REAL(property, "children-display") != 0)) {
        val = if (item.*.sub_menu != null) @as([*c]u8, @as([*c]u8, @constCast("submenu"))) else @as([*c]u8, @as([*c]u8, @constCast("")));
        _ = ctx.*.message_iter_open_container.?(&iter, @as(c_int, 'v'), "s", &variant_iter);
        _ = ctx.*.message_iter_append_basic.?(&variant_iter, @as(c_int, 's'), @ptrCast(@alignCast(&val)));
        _ = ctx.*.message_iter_close_container.?(&iter, &variant_iter);
    } else {
        val = "";
        _ = ctx.*.message_iter_open_container.?(&iter, @as(c_int, 'v'), "s", &variant_iter);
        _ = ctx.*.message_iter_append_basic.?(&variant_iter, @as(c_int, 's'), @ptrCast(@alignCast(&val)));
        _ = ctx.*.message_iter_close_container.?(&iter, &variant_iter);
    }
    _ = ctx.*.connection_send.?(conn, reply, null);
    ctx.*.message_unref.?(reply);
    return DBUS_HANDLER_RESULT_HANDLED;
}
pub fn MenuHandleGetGroupProperties(ctx: [*c]SDL_DBusContext, menu: [*c]SDL_ListNode, conn: ?*DBusConnection, msg: ?*DBusMessage) callconv(.c) DBusHandlerResult {
    @setEvalBranchQuota(100000);
    var reply: ?*DBusMessage = undefined;
    _ = &reply;
    var args: DBusMessageIter = undefined;
    _ = &args;
    var array_iter: DBusMessageIter = undefined;
    _ = &array_iter;
    var prop_iter: DBusMessageIter = undefined;
    _ = &prop_iter;
    var iter: DBusMessageIter = undefined;
    _ = &iter;
    var reply_array_iter: DBusMessageIter = undefined;
    _ = &reply_array_iter;
    var filter_props: [32][*c]const u8 = undefined;
    _ = &filter_props;
    var ids: [*c]dbus_int32_t = undefined;
    _ = &ids;
    var ids_sz: c_int = undefined;
    _ = &ids_sz;
    var filter_sz: c_int = undefined;
    _ = &filter_sz;
    var i: c_int = undefined;
    _ = &i;
    var j: c_int = undefined;
    _ = &j;
    ids_sz = 0;
    _ = ctx.*.message_iter_init.?(msg, &args);
    if (ctx.*.message_iter_get_arg_type.?(&args) != @as(c_int, 'a')) {
        return DBUS_HANDLER_RESULT_NOT_YET_HANDLED;
    }
    ctx.*.message_iter_recurse.?(&args, &array_iter);
    if (ctx.*.message_iter_get_arg_type.?(&array_iter) == @as(c_int, 'i')) {
        ctx.*.message_iter_get_fixed_array.?(&array_iter, @ptrCast(@alignCast(&ids)), &ids_sz);
    }
    _ = ctx.*.message_iter_next.?(&args);
    if (ctx.*.message_iter_get_arg_type.?(&args) != @as(c_int, 'a')) {
        return DBUS_HANDLER_RESULT_NOT_YET_HANDLED;
    }
    ctx.*.message_iter_recurse.?(&args, &prop_iter);
    filter_sz = 0;
    while (ctx.*.message_iter_get_arg_type.?(&prop_iter) == @as(c_int, 's')) {
        if (filter_sz < FILTER_PROPS_SZ) {
            ctx.*.message_iter_get_basic.?(&prop_iter, @ptrCast(@alignCast(&filter_props[@bitCast(@as(isize, @intCast(filter_sz)))])));
            filter_sz += 1;
        }
        _ = ctx.*.message_iter_next.?(&prop_iter);
    }
    reply = ctx.*.message_new_method_return.?(msg);
    ctx.*.message_iter_init_append.?(reply, &iter);
    _ = ctx.*.message_iter_open_container.?(&iter, @as(c_int, 'a'), "(ia{sv})", &reply_array_iter);
    {
        i = 0;
        while (i < ids_sz) : (i += 1) {
            var item: [*c]SDL_MenuItem = undefined;
            _ = &item;
            var dbus_item: [*c]SDL_DBusMenuItem = undefined;
            _ = &dbus_item;
            dbus_item = MenuGetItemById(menu, ids[@bitCast(@as(isize, @intCast(i)))]);
            item = @ptrCast(@alignCast(dbus_item));
            if (item != null) {
                var struct_iter: DBusMessageIter = undefined;
                _ = &struct_iter;
                var dict_iter: DBusMessageIter = undefined;
                _ = &dict_iter;
                _ = ctx.*.message_iter_open_container.?(&reply_array_iter, @as(c_int, 'r'), null, &struct_iter);
                _ = ctx.*.message_iter_append_basic.?(&struct_iter, @as(c_int, 'i'), @ptrCast(@alignCast(&ids[@bitCast(@as(isize, @intCast(i)))])));
                _ = ctx.*.message_iter_open_container.?(&struct_iter, @as(c_int, 'a'), "{sv}", &dict_iter);
                if (filter_sz == @as(c_int, 0)) {
                    MenuAppendItemProperties(ctx, dbus_item, &dict_iter);
                } else {
                    {
                        j = 0;
                        while (j < filter_sz) : (j += 1) {
                            var entry_iter: DBusMessageIter = undefined;
                            _ = &entry_iter;
                            var variant_iter: DBusMessageIter = undefined;
                            _ = &variant_iter;
                            var prop: [*c]const u8 = undefined;
                            _ = &prop;
                            var val: [*c]const u8 = undefined;
                            _ = &val;
                            var int_val: c_int = undefined;
                            _ = &int_val;
                            var bool_val: dbus_bool_t = undefined;
                            _ = &bool_val;
                            prop = filter_props[@bitCast(@as(isize, @intCast(j)))];
                            if (!(SDL_strcmp_REAL(prop, "label") != 0)) {
                                val = if (item.*.utf8 != null) item.*.utf8 else @as([*c]const u8, @ptrCast(@alignCast(@as([*c]u8, @as([*c]u8, @constCast(""))))));
                                _ = ctx.*.message_iter_open_container.?(&dict_iter, @as(c_int, 'e'), null, &entry_iter);
                                _ = ctx.*.message_iter_append_basic.?(&entry_iter, @as(c_int, 's'), @ptrCast(@alignCast(&prop)));
                                _ = ctx.*.message_iter_open_container.?(&entry_iter, @as(c_int, 'v'), "s", &variant_iter);
                                _ = ctx.*.message_iter_append_basic.?(&variant_iter, @as(c_int, 's'), @ptrCast(@alignCast(&val)));
                                _ = ctx.*.message_iter_close_container.?(&entry_iter, &variant_iter);
                                _ = ctx.*.message_iter_close_container.?(&dict_iter, &entry_iter);
                            } else if (!(SDL_strcmp_REAL(prop, "type") != 0)) {
                                val = if (item.*.type == @as(SDL_MenuItemType, SDL_MENU_ITEM_TYPE_SEPERATOR)) @as([*c]u8, @as([*c]u8, @constCast("separator"))) else @as([*c]u8, @as([*c]u8, @constCast("standard")));
                                _ = ctx.*.message_iter_open_container.?(&dict_iter, @as(c_int, 'e'), null, &entry_iter);
                                _ = ctx.*.message_iter_append_basic.?(&entry_iter, @as(c_int, 's'), @ptrCast(@alignCast(&prop)));
                                _ = ctx.*.message_iter_open_container.?(&entry_iter, @as(c_int, 'v'), "s", &variant_iter);
                                _ = ctx.*.message_iter_append_basic.?(&variant_iter, @as(c_int, 's'), @ptrCast(@alignCast(&val)));
                                _ = ctx.*.message_iter_close_container.?(&entry_iter, &variant_iter);
                                _ = ctx.*.message_iter_close_container.?(&dict_iter, &entry_iter);
                            } else if (!(SDL_strcmp_REAL(prop, "enabled") != 0)) {
                                bool_val = @bitCast(@as(c_int, @intFromBool(!((item.*.flags & @as(SDL_MenuItemFlags, SDL_MENU_ITEM_FLAGS_DISABLED)) != 0))));
                                _ = ctx.*.message_iter_open_container.?(&dict_iter, @as(c_int, 'e'), null, &entry_iter);
                                _ = ctx.*.message_iter_append_basic.?(&entry_iter, @as(c_int, 's'), @ptrCast(@alignCast(&prop)));
                                _ = ctx.*.message_iter_open_container.?(&entry_iter, @as(c_int, 'v'), "b", &variant_iter);
                                _ = ctx.*.message_iter_append_basic.?(&variant_iter, @as(c_int, 'b'), @ptrCast(@alignCast(&bool_val)));
                                _ = ctx.*.message_iter_close_container.?(&entry_iter, &variant_iter);
                                _ = ctx.*.message_iter_close_container.?(&dict_iter, &entry_iter);
                            } else if (!(SDL_strcmp_REAL(prop, "visible") != 0)) {
                                bool_val = 1;
                                _ = ctx.*.message_iter_open_container.?(&dict_iter, @as(c_int, 'e'), null, &entry_iter);
                                _ = ctx.*.message_iter_append_basic.?(&entry_iter, @as(c_int, 's'), @ptrCast(@alignCast(&prop)));
                                _ = ctx.*.message_iter_open_container.?(&entry_iter, @as(c_int, 'v'), "b", &variant_iter);
                                _ = ctx.*.message_iter_append_basic.?(&variant_iter, @as(c_int, 'b'), @ptrCast(@alignCast(&bool_val)));
                                _ = ctx.*.message_iter_close_container.?(&entry_iter, &variant_iter);
                                _ = ctx.*.message_iter_close_container.?(&dict_iter, &entry_iter);
                            } else if (!(SDL_strcmp_REAL(prop, "toggle-type") != 0)) {
                                val = if (item.*.type == @as(SDL_MenuItemType, SDL_MENU_ITEM_TYPE_CHECKBOX)) @as([*c]u8, @as([*c]u8, @constCast("checkmark"))) else @as([*c]u8, @as([*c]u8, @constCast("")));
                                _ = ctx.*.message_iter_open_container.?(&dict_iter, @as(c_int, 'e'), null, &entry_iter);
                                _ = ctx.*.message_iter_append_basic.?(&entry_iter, @as(c_int, 's'), @ptrCast(@alignCast(&prop)));
                                _ = ctx.*.message_iter_open_container.?(&entry_iter, @as(c_int, 'v'), "s", &variant_iter);
                                _ = ctx.*.message_iter_append_basic.?(&variant_iter, @as(c_int, 's'), @ptrCast(@alignCast(&val)));
                                _ = ctx.*.message_iter_close_container.?(&entry_iter, &variant_iter);
                                _ = ctx.*.message_iter_close_container.?(&dict_iter, &entry_iter);
                            } else if (!(SDL_strcmp_REAL(prop, "toggle-state") != 0)) {
                                int_val = if ((item.*.flags & @as(SDL_MenuItemFlags, SDL_MENU_ITEM_FLAGS_CHECKED)) != 0) @as(c_int, 1) else @as(c_int, 0);
                                _ = ctx.*.message_iter_open_container.?(&dict_iter, @as(c_int, 'e'), null, &entry_iter);
                                _ = ctx.*.message_iter_append_basic.?(&entry_iter, @as(c_int, 's'), @ptrCast(@alignCast(&prop)));
                                _ = ctx.*.message_iter_open_container.?(&entry_iter, @as(c_int, 'v'), "i", &variant_iter);
                                _ = ctx.*.message_iter_append_basic.?(&variant_iter, @as(c_int, 'i'), @ptrCast(@alignCast(&int_val)));
                                _ = ctx.*.message_iter_close_container.?(&entry_iter, &variant_iter);
                                _ = ctx.*.message_iter_close_container.?(&dict_iter, &entry_iter);
                            } else if (!(SDL_strcmp_REAL(prop, "children-display") != 0)) {
                                val = if (item.*.sub_menu != null) @as([*c]u8, @as([*c]u8, @constCast("submenu"))) else @as([*c]u8, @as([*c]u8, @constCast("")));
                                _ = ctx.*.message_iter_open_container.?(&dict_iter, @as(c_int, 'e'), null, &entry_iter);
                                _ = ctx.*.message_iter_append_basic.?(&entry_iter, @as(c_int, 's'), @ptrCast(@alignCast(&prop)));
                                _ = ctx.*.message_iter_open_container.?(&entry_iter, @as(c_int, 'v'), "s", &variant_iter);
                                _ = ctx.*.message_iter_append_basic.?(&variant_iter, @as(c_int, 's'), @ptrCast(@alignCast(&val)));
                                _ = ctx.*.message_iter_close_container.?(&entry_iter, &variant_iter);
                                _ = ctx.*.message_iter_close_container.?(&dict_iter, &entry_iter);
                            }
                        }
                    }
                }
                _ = ctx.*.message_iter_close_container.?(&struct_iter, &dict_iter);
                _ = ctx.*.message_iter_close_container.?(&reply_array_iter, &struct_iter);
            }
        }
    }
    _ = ctx.*.message_iter_close_container.?(&iter, &reply_array_iter);
    _ = ctx.*.connection_send.?(conn, reply, null);
    ctx.*.message_unref.?(reply);
    return DBUS_HANDLER_RESULT_HANDLED;
}
pub fn MenuGetMaxItemId(menu: [*c]SDL_ListNode) callconv(.c) dbus_int32_t {
    @setEvalBranchQuota(100000);
    var cursor: [*c]SDL_ListNode = undefined;
    _ = &cursor;
    var max_id: dbus_int32_t = undefined;
    _ = &max_id;
    max_id = 0;
    cursor = menu;
    while (cursor != null) {
        var item: [*c]SDL_MenuItem = undefined;
        _ = &item;
        var dbus_item: [*c]SDL_DBusMenuItem = undefined;
        _ = &dbus_item;
        dbus_item = @ptrCast(@alignCast(cursor.*.entry));
        item = @ptrCast(@alignCast(cursor.*.entry));
        if (item != null) {
            if (dbus_item.*.id > max_id) {
                max_id = dbus_item.*.id;
            }
            if (item.*.sub_menu != null) {
                var sub_max: dbus_int32_t = undefined;
                _ = &sub_max;
                sub_max = MenuGetMaxItemId(item.*.sub_menu);
                if (sub_max > max_id) {
                    max_id = sub_max;
                }
            }
        }
        cursor = cursor.*.next;
    }
    return max_id;
}
pub fn MenuAssignItemIds(menu: [*c]SDL_ListNode, next_id: [*c]dbus_int32_t) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var cursor: [*c]SDL_ListNode = undefined;
    _ = &cursor;
    cursor = menu;
    while (cursor != null) {
        var item: [*c]SDL_MenuItem = undefined;
        _ = &item;
        var dbus_item: [*c]SDL_DBusMenuItem = undefined;
        _ = &dbus_item;
        dbus_item = @ptrCast(@alignCast(cursor.*.entry));
        item = @ptrCast(@alignCast(cursor.*.entry));
        if (item != null) {
            if (!(dbus_item.*.id != 0)) {
                dbus_item.*.id = blk: {
                    const ref = &next_id.*;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                };
            }
            if (item.*.sub_menu != null) {
                MenuAssignItemIds(item.*.sub_menu, next_id);
            }
        }
        cursor = cursor.*.next;
    }
}
pub fn MenuMessageHandler(conn: ?*DBusConnection, msg: ?*DBusMessage, user_data: ?*anyopaque) callconv(.c) DBusHandlerResult {
    @setEvalBranchQuota(100000);
    var menu: [*c]SDL_ListNode = undefined;
    _ = &menu;
    var item: [*c]SDL_DBusMenuItem = undefined;
    _ = &item;
    var ctx: [*c]SDL_DBusContext = undefined;
    _ = &ctx;
    menu = @ptrCast(@alignCast(user_data));
    if (!(menu != null)) {
        return DBUS_HANDLER_RESULT_NOT_YET_HANDLED;
    }
    if (!(menu.*.entry != null)) {
        return DBUS_HANDLER_RESULT_NOT_YET_HANDLED;
    }
    item = @ptrCast(@alignCast(menu.*.entry));
    ctx = item.*.dbus;
    if (ctx.*.message_is_method_call.?(msg, "com.canonical.dbusmenu", "GetLayout") != 0) {
        return MenuHandleGetLayout(ctx, menu, conn, msg);
    } else if (ctx.*.message_is_method_call.?(msg, "com.canonical.dbusmenu", "Event") != 0) {
        return MenuHandleEvent(ctx, menu, conn, msg);
    } else if (ctx.*.message_is_method_call.?(msg, "com.canonical.dbusmenu", "EventGroup") != 0) {
        return MenuHandleEventGroup(ctx, menu, conn, msg);
    } else if (ctx.*.message_is_method_call.?(msg, "com.canonical.dbusmenu", "AboutToShow") != 0) {
        var reply: ?*DBusMessage = undefined;
        _ = &reply;
        var need_update: dbus_bool_t = undefined;
        _ = &need_update;
        if (item.*.cb != null) {
            _ = item.*.cb.?(menu, item.*.cbdata);
        }
        need_update = FALSE;
        reply = ctx.*.message_new_method_return.?(msg);
        _ = ctx.*.message_append_args.?(reply, @as(c_int, 'b'), &need_update, @as(c_int, '\x00'));
        _ = ctx.*.connection_send.?(conn, reply, null);
        ctx.*.message_unref.?(reply);
        return DBUS_HANDLER_RESULT_HANDLED;
    } else if (ctx.*.message_is_method_call.?(msg, "com.canonical.dbusmenu", "AboutToShowGroup") != 0) {
        var reply: ?*DBusMessage = undefined;
        _ = &reply;
        var iter: DBusMessageIter = undefined;
        _ = &iter;
        var arr_iter: DBusMessageIter = undefined;
        _ = &arr_iter;
        reply = ctx.*.message_new_method_return.?(msg);
        ctx.*.message_iter_init_append.?(reply, &iter);
        _ = ctx.*.message_iter_open_container.?(&iter, @as(c_int, 'a'), "i", &arr_iter);
        _ = ctx.*.message_iter_close_container.?(&iter, &arr_iter);
        _ = ctx.*.message_iter_open_container.?(&iter, @as(c_int, 'a'), "i", &arr_iter);
        _ = ctx.*.message_iter_close_container.?(&iter, &arr_iter);
        _ = ctx.*.connection_send.?(conn, reply, null);
        ctx.*.message_unref.?(reply);
        return DBUS_HANDLER_RESULT_HANDLED;
    } else if (ctx.*.message_is_method_call.?(msg, "com.canonical.dbusmenu", "GetGroupProperties") != 0) {
        return MenuHandleGetGroupProperties(ctx, menu, conn, msg);
    } else if (ctx.*.message_is_method_call.?(msg, "com.canonical.dbusmenu", "GetProperty") != 0) {
        return MenuHandleGetProperty(ctx, menu, conn, msg);
    } else if (ctx.*.message_is_method_call.?(msg, "org.freedesktop.DBus.Properties", "Get") != 0) {
        var reply: ?*DBusMessage = undefined;
        _ = &reply;
        var interface_name: [*c]const u8 = undefined;
        _ = &interface_name;
        var property_name: [*c]const u8 = undefined;
        _ = &property_name;
        var str_val: [*c]const u8 = undefined;
        _ = &str_val;
        var args: DBusMessageIter = undefined;
        _ = &args;
        var iter: DBusMessageIter = undefined;
        _ = &iter;
        var variant_iter: DBusMessageIter = undefined;
        _ = &variant_iter;
        var version: dbus_uint32_t = undefined;
        _ = &version;
        _ = ctx.*.message_iter_init.?(msg, &args);
        if (ctx.*.message_iter_get_arg_type.?(&args) != @as(c_int, 's')) {
            return DBUS_HANDLER_RESULT_NOT_YET_HANDLED;
        }
        ctx.*.message_iter_get_basic.?(&args, @ptrCast(@alignCast(&interface_name)));
        _ = ctx.*.message_iter_next.?(&args);
        if (ctx.*.message_iter_get_arg_type.?(&args) != @as(c_int, 's')) {
            return DBUS_HANDLER_RESULT_NOT_YET_HANDLED;
        }
        ctx.*.message_iter_get_basic.?(&args, @ptrCast(@alignCast(&property_name)));
        if (!(SDL_strcmp_REAL(interface_name, "com.canonical.dbusmenu") != 0)) {
            reply = ctx.*.message_new_method_return.?(msg);
            ctx.*.message_iter_init_append.?(reply, &iter);
            if (!(SDL_strcmp_REAL(property_name, "Version") != 0)) {
                version = 3;
                _ = ctx.*.message_iter_open_container.?(&iter, @as(c_int, 'v'), "u", &variant_iter);
                _ = ctx.*.message_iter_append_basic.?(&variant_iter, @as(c_int, 'u'), @ptrCast(@alignCast(&version)));
                _ = ctx.*.message_iter_close_container.?(&iter, &variant_iter);
            } else if (!(SDL_strcmp_REAL(property_name, "Status") != 0)) {
                str_val = "normal";
                _ = ctx.*.message_iter_open_container.?(&iter, @as(c_int, 'v'), "s", &variant_iter);
                _ = ctx.*.message_iter_append_basic.?(&variant_iter, @as(c_int, 's'), @ptrCast(@alignCast(&str_val)));
                _ = ctx.*.message_iter_close_container.?(&iter, &variant_iter);
            } else if (!(SDL_strcmp_REAL(property_name, "TextDirection") != 0)) {
                str_val = "ltr";
                _ = ctx.*.message_iter_open_container.?(&iter, @as(c_int, 'v'), "s", &variant_iter);
                _ = ctx.*.message_iter_append_basic.?(&variant_iter, @as(c_int, 's'), @ptrCast(@alignCast(&str_val)));
                _ = ctx.*.message_iter_close_container.?(&iter, &variant_iter);
            } else if (!(SDL_strcmp_REAL(property_name, "IconThemePath") != 0)) {
                var array_iter: DBusMessageIter = undefined;
                _ = &array_iter;
                _ = ctx.*.message_iter_open_container.?(&iter, @as(c_int, 'v'), "as", &variant_iter);
                _ = ctx.*.message_iter_open_container.?(&variant_iter, @as(c_int, 'a'), "s", &array_iter);
                _ = ctx.*.message_iter_close_container.?(&variant_iter, &array_iter);
                _ = ctx.*.message_iter_close_container.?(&iter, &variant_iter);
            } else {
                ctx.*.message_unref.?(reply);
                return DBUS_HANDLER_RESULT_NOT_YET_HANDLED;
            }
            _ = ctx.*.connection_send.?(conn, reply, null);
            ctx.*.message_unref.?(reply);
            return DBUS_HANDLER_RESULT_HANDLED;
        }
    } else if (ctx.*.message_is_method_call.?(msg, "org.freedesktop.DBus.Properties", "GetAll") != 0) {
        var reply: ?*DBusMessage = undefined;
        _ = &reply;
        var interface_name: [*c]const u8 = undefined;
        _ = &interface_name;
        var key: [*c]const u8 = undefined;
        _ = &key;
        var args: DBusMessageIter = undefined;
        _ = &args;
        var iter: DBusMessageIter = undefined;
        _ = &iter;
        var dict_iter: DBusMessageIter = undefined;
        _ = &dict_iter;
        var entry_iter: DBusMessageIter = undefined;
        _ = &entry_iter;
        var variant_iter: DBusMessageIter = undefined;
        _ = &variant_iter;
        var version: dbus_uint32_t = undefined;
        _ = &version;
        _ = ctx.*.message_iter_init.?(msg, &args);
        if (ctx.*.message_iter_get_arg_type.?(&args) != @as(c_int, 's')) {
            return DBUS_HANDLER_RESULT_NOT_YET_HANDLED;
        }
        ctx.*.message_iter_get_basic.?(&args, @ptrCast(@alignCast(&interface_name)));
        if (!(SDL_strcmp_REAL(interface_name, "com.canonical.dbusmenu") != 0)) {
            var array_iter: DBusMessageIter = undefined;
            _ = &array_iter;
            var str_val: [*c]const u8 = undefined;
            _ = &str_val;
            reply = ctx.*.message_new_method_return.?(msg);
            ctx.*.message_iter_init_append.?(reply, &iter);
            _ = ctx.*.message_iter_open_container.?(&iter, @as(c_int, 'a'), "{sv}", &dict_iter);
            key = "Version";
            version = 3;
            _ = ctx.*.message_iter_open_container.?(&dict_iter, @as(c_int, 'e'), null, &entry_iter);
            _ = ctx.*.message_iter_append_basic.?(&entry_iter, @as(c_int, 's'), @ptrCast(@alignCast(&key)));
            _ = ctx.*.message_iter_open_container.?(&entry_iter, @as(c_int, 'v'), "u", &variant_iter);
            _ = ctx.*.message_iter_append_basic.?(&variant_iter, @as(c_int, 'u'), @ptrCast(@alignCast(&version)));
            _ = ctx.*.message_iter_close_container.?(&entry_iter, &variant_iter);
            _ = ctx.*.message_iter_close_container.?(&dict_iter, &entry_iter);
            key = "Status";
            str_val = "normal";
            _ = ctx.*.message_iter_open_container.?(&dict_iter, @as(c_int, 'e'), null, &entry_iter);
            _ = ctx.*.message_iter_append_basic.?(&entry_iter, @as(c_int, 's'), @ptrCast(@alignCast(&key)));
            _ = ctx.*.message_iter_open_container.?(&entry_iter, @as(c_int, 'v'), "s", &variant_iter);
            _ = ctx.*.message_iter_append_basic.?(&variant_iter, @as(c_int, 's'), @ptrCast(@alignCast(&str_val)));
            _ = ctx.*.message_iter_close_container.?(&entry_iter, &variant_iter);
            _ = ctx.*.message_iter_close_container.?(&dict_iter, &entry_iter);
            key = "TextDirection";
            str_val = "ltr";
            _ = ctx.*.message_iter_open_container.?(&dict_iter, @as(c_int, 'e'), null, &entry_iter);
            _ = ctx.*.message_iter_append_basic.?(&entry_iter, @as(c_int, 's'), @ptrCast(@alignCast(&key)));
            _ = ctx.*.message_iter_open_container.?(&entry_iter, @as(c_int, 'v'), "s", &variant_iter);
            _ = ctx.*.message_iter_append_basic.?(&variant_iter, @as(c_int, 's'), @ptrCast(@alignCast(&str_val)));
            _ = ctx.*.message_iter_close_container.?(&entry_iter, &variant_iter);
            _ = ctx.*.message_iter_close_container.?(&dict_iter, &entry_iter);
            key = "IconThemePath";
            _ = ctx.*.message_iter_open_container.?(&dict_iter, @as(c_int, 'e'), null, &entry_iter);
            _ = ctx.*.message_iter_append_basic.?(&entry_iter, @as(c_int, 's'), @ptrCast(@alignCast(&key)));
            _ = ctx.*.message_iter_open_container.?(&entry_iter, @as(c_int, 'v'), "as", &variant_iter);
            _ = ctx.*.message_iter_open_container.?(&variant_iter, @as(c_int, 'a'), "s", &array_iter);
            _ = ctx.*.message_iter_close_container.?(&variant_iter, &array_iter);
            _ = ctx.*.message_iter_close_container.?(&entry_iter, &variant_iter);
            _ = ctx.*.message_iter_close_container.?(&dict_iter, &entry_iter);
            _ = ctx.*.message_iter_close_container.?(&iter, &dict_iter);
            _ = ctx.*.connection_send.?(conn, reply, null);
            ctx.*.message_unref.?(reply);
            return DBUS_HANDLER_RESULT_HANDLED;
        }
    } else if (ctx.*.message_is_method_call.?(msg, "org.freedesktop.DBus.Introspectable", "Introspect") != 0) {
        var reply: ?*DBusMessage = undefined;
        _ = &reply;
        reply = ctx.*.message_new_method_return.?(msg);
        _ = ctx.*.message_append_args.?(reply, @as(c_int, 's'), &menu_introspect, @as(c_int, '\x00'));
        _ = ctx.*.connection_send.?(conn, reply, null);
        ctx.*.message_unref.?(reply);
        return DBUS_HANDLER_RESULT_HANDLED;
    }
    return DBUS_HANDLER_RESULT_NOT_YET_HANDLED;
}
pub const O_RDONLY = @as(c_int, 0o0);
pub const __O_DIRECTORY = __helpers.promoteIntLiteral(c_int, 0o200000, .octal);
pub const __O_CLOEXEC = __helpers.promoteIntLiteral(c_int, 0o2000000, .octal);
pub const __S_IFMT = __helpers.promoteIntLiteral(c_int, 0o170000, .octal);
pub const __S_IFDIR = @as(c_int, 0o040000);
pub const FILTER_PROPS_SZ = @as(c_int, 32);
