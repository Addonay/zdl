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
pub const __off_t = c_long;
pub const __pid_t = c_int;
pub const __rlim_t = c_ulong;
pub const __id_t = c_uint;
pub const pid_t = __pid_t;
pub const id_t = __id_t;
pub const pthread_once_t = c_int;
pub const struct___va_list_tag_2 = extern struct {
    unnamed_0: c_uint = 0,
    unnamed_1: c_uint = 0,
    unnamed_2: ?*anyopaque = null,
    unnamed_3: ?*anyopaque = null,
};
pub extern fn free(__ptr: ?*anyopaque) void;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Sint32 = i32;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub const Uint64 = u64;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_THREAD_PRIORITY_LOW: c_int = 0;
pub const SDL_THREAD_PRIORITY_HIGH: c_int = 2;
pub const SDL_THREAD_PRIORITY_TIME_CRITICAL: c_int = 3;
pub const __RLIMIT_RTTIME: c_int = 15;
pub const enum___rlimit_resource = c_uint;
pub const rlim_t = __rlim_t;
pub const struct_rlimit = extern struct {
    rlim_cur: rlim_t = 0,
    rlim_max: rlim_t = 0,
};
pub const PRIO_PROCESS: c_int = 0;
pub const enum___priority_which = c_uint;
pub const __rlimit_resource_t = enum___rlimit_resource;
pub const __priority_which_t = enum___priority_which;
pub extern fn getrlimit(__resource: __rlimit_resource_t, __rlimits: [*c]struct_rlimit) c_int;
pub extern fn setrlimit(__resource: __rlimit_resource_t, __rlimits: [*c]const struct_rlimit) c_int;
pub extern fn setpriority(__which: __priority_which_t, __who: id_t, __prio: c_int) c_int;
pub const struct_sched_param = extern struct {
    sched_priority: c_int = 0,
};
pub extern fn sched_getparam(__pid: __pid_t, __param: [*c]struct_sched_param) c_int;
pub extern fn sched_setscheduler(__pid: __pid_t, __policy: c_int, __param: [*c]const struct_sched_param) c_int;
pub extern fn sched_getscheduler(__pid: __pid_t) c_int;
pub extern fn pthread_once(__once_control: [*c]pthread_once_t, __init_routine: ?*const fn () callconv(.c) void) c_int;
pub extern fn getpid() __pid_t;
pub extern fn truncate(__file: [*c]const u8, __length: __off_t) c_int;
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
pub var rtkit_use_session_conn: bool = false;
pub var rtkit_dbus_node: [*c]const u8 = null;
pub var rtkit_dbus_path: [*c]const u8 = null;
pub var rtkit_dbus_interface: [*c]const u8 = null;
pub var rtkit_initialize_once: pthread_once_t = PTHREAD_ONCE_INIT;
pub var rtkit_min_nice_level: Sint32 = -@as(c_int, 20);
pub var rtkit_max_realtime_priority: Sint32 = 99;
pub var rtkit_max_rttime_usec: Sint64 = 200000;
pub fn realtime_portal_supported(conn: ?*DBusConnection) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var res: Sint64 = undefined;
    _ = &res;
    return SDL_DBus_QueryPropertyOnConnection(conn, null, "org.freedesktop.portal.Desktop", "/org/freedesktop/portal/desktop", "org.freedesktop.portal.Realtime", "RTTimeUSecMax", @as(c_int, 'x'), @ptrCast(@alignCast(&res)));
}
pub fn set_rtkit_interface() callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dbus: [*c]SDL_DBusContext = SDL_DBus_GetContext();
    _ = &dbus;
    if ((dbus != null) and realtime_portal_supported(dbus.*.session_conn)) {
        rtkit_use_session_conn = @"true" != 0;
        rtkit_dbus_node = "org.freedesktop.portal.Desktop";
        rtkit_dbus_path = "/org/freedesktop/portal/desktop";
        rtkit_dbus_interface = "org.freedesktop.portal.Realtime";
    } else {
        rtkit_use_session_conn = @"false" != 0;
        rtkit_dbus_node = "org.freedesktop.RealtimeKit1";
        rtkit_dbus_path = "/org/freedesktop/RealtimeKit1";
        rtkit_dbus_interface = "org.freedesktop.RealtimeKit1";
    }
}
pub fn get_rtkit_dbus_connection() callconv(.c) ?*DBusConnection {
    @setEvalBranchQuota(100000);
    var dbus: [*c]SDL_DBusContext = SDL_DBus_GetContext();
    _ = &dbus;
    if (dbus != null) {
        return if (rtkit_use_session_conn) dbus.*.session_conn else dbus.*.system_conn;
    }
    return null;
}
pub fn rtkit_initialize() callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dbus_conn: ?*DBusConnection = undefined;
    _ = &dbus_conn;
    set_rtkit_interface();
    dbus_conn = get_rtkit_dbus_connection();
    if (!(dbus_conn != null) or !SDL_DBus_QueryPropertyOnConnection(dbus_conn, null, rtkit_dbus_node, rtkit_dbus_path, rtkit_dbus_interface, "MinNiceLevel", @as(c_int, 'i'), @ptrCast(@alignCast(&rtkit_min_nice_level)))) {
        rtkit_min_nice_level = -@as(c_int, 20);
    }
    if (!(dbus_conn != null) or !SDL_DBus_QueryPropertyOnConnection(dbus_conn, null, rtkit_dbus_node, rtkit_dbus_path, rtkit_dbus_interface, "MaxRealtimePriority", @as(c_int, 'i'), @ptrCast(@alignCast(&rtkit_max_realtime_priority)))) {
        rtkit_max_realtime_priority = 99;
    }
    if (!(dbus_conn != null) or !SDL_DBus_QueryPropertyOnConnection(dbus_conn, null, rtkit_dbus_node, rtkit_dbus_path, rtkit_dbus_interface, "RTTimeUSecMax", @as(c_int, 'x'), @ptrCast(@alignCast(&rtkit_max_rttime_usec)))) {
        rtkit_max_rttime_usec = 200000;
    }
}
pub fn rtkit_initialize_realtime_thread() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var err: c_int = undefined;
    _ = &err;
    var rlimit_1: struct_rlimit = undefined;
    _ = &rlimit_1;
    var nLimit: c_int = __RLIMIT_RTTIME;
    _ = &nLimit;
    var nPid: pid_t = 0;
    _ = &nPid;
    var nSchedPolicy: c_int = sched_getscheduler(nPid) | SCHED_RESET_ON_FORK;
    _ = &nSchedPolicy;
    var schedParam: struct_sched_param = undefined;
    _ = &schedParam;
    _ = memset(@ptrCast(@alignCast(&schedParam)), 0, @sizeOf(@TypeOf(schedParam)));
    err = getrlimit(@bitCast(nLimit), &rlimit_1);
    if (err != 0) {
        return @"false" != 0;
    }
    rlimit_1.rlim_max = @bitCast(@as(c_long, rtkit_max_rttime_usec));
    rlimit_1.rlim_cur = rlimit_1.rlim_max / @as(rlim_t, 2);
    err = setrlimit(@bitCast(nLimit), &rlimit_1);
    if (err != 0) {
        return @"false" != 0;
    }
    err = sched_getparam(nPid, &schedParam);
    if (err != 0) {
        return @"false" != 0;
    }
    err = sched_setscheduler(nPid, nSchedPolicy, &schedParam);
    if (err != 0) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn rtkit_setpriority_nice(thread: pid_t, nice_level: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var dbus_conn: ?*DBusConnection = undefined;
    _ = &dbus_conn;
    var pid: Uint64 = @bitCast(@as(c_long, getpid()));
    _ = &pid;
    var tid: Uint64 = @bitCast(@as(c_long, thread));
    _ = &tid;
    var nice_1: Sint32 = nice_level;
    _ = &nice_1;
    _ = pthread_once(&rtkit_initialize_once, rtkit_initialize);
    dbus_conn = get_rtkit_dbus_connection();
    if (nice_1 < rtkit_min_nice_level) {
        nice_1 = rtkit_min_nice_level;
    }
    if (!(dbus_conn != null) or !SDL_DBus_CallMethodOnConnection(dbus_conn, null, rtkit_dbus_node, rtkit_dbus_path, rtkit_dbus_interface, "MakeThreadHighPriorityWithPID", @as(c_int, 't'), &pid, @as(c_int, 't'), &tid, @as(c_int, 'i'), &nice_1, @as(c_int, '\x00'), @as(c_int, '\x00'))) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn rtkit_setpriority_realtime(thread: pid_t, rt_priority: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var dbus_conn: ?*DBusConnection = undefined;
    _ = &dbus_conn;
    var pid: Uint64 = @bitCast(@as(c_long, getpid()));
    _ = &pid;
    var tid: Uint64 = @bitCast(@as(c_long, thread));
    _ = &tid;
    var priority: Uint32 = @bitCast(@as(c_int, rt_priority));
    _ = &priority;
    _ = pthread_once(&rtkit_initialize_once, rtkit_initialize);
    dbus_conn = get_rtkit_dbus_connection();
    if (priority > @as(Uint32, @bitCast(@as(c_int, rtkit_max_realtime_priority)))) {
        priority = @bitCast(@as(c_int, rtkit_max_realtime_priority));
    }
    _ = rtkit_initialize_realtime_thread();
    if (!(dbus_conn != null) or !SDL_DBus_CallMethodOnConnection(dbus_conn, null, rtkit_dbus_node, rtkit_dbus_path, rtkit_dbus_interface, "MakeThreadRealtimeWithPID", @as(c_int, 't'), &pid, @as(c_int, 't'), &tid, @as(c_int, 'u'), &priority, @as(c_int, '\x00'), @as(c_int, '\x00'))) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub export fn SDL_SetLinuxThreadPriority_REAL(threadID: Sint64, priority: c_int) bool {
    @setEvalBranchQuota(100000);
    if (setpriority(PRIO_PROCESS, @bitCast(@as(c_int, @truncate(threadID))), priority) == @as(c_int, 0)) {
        return @"true" != 0;
    }
    if (rtkit_setpriority_nice(@truncate(threadID), priority)) {
        return @"true" != 0;
    }
    return SDL_SetError_REAL("setpriority() failed");
}
pub export fn SDL_SetLinuxThreadPriorityAndPolicy_REAL(threadID: Sint64, sdlPriority: c_int, schedPolicy: c_int) bool {
    @setEvalBranchQuota(100000);
    var osPriority: c_int = undefined;
    _ = &osPriority;
    if ((schedPolicy == SCHED_RR) or (schedPolicy == SCHED_FIFO)) {
        if (sdlPriority == SDL_THREAD_PRIORITY_LOW) {
            osPriority = 1;
        } else if (sdlPriority == SDL_THREAD_PRIORITY_HIGH) {
            osPriority = @divTrunc(rtkit_max_realtime_priority * @as(c_int, 3), @as(c_int, 4));
        } else if (sdlPriority == SDL_THREAD_PRIORITY_TIME_CRITICAL) {
            osPriority = rtkit_max_realtime_priority;
        } else {
            osPriority = @divTrunc(rtkit_max_realtime_priority, @as(c_int, 2));
        }
    } else {
        if (sdlPriority == SDL_THREAD_PRIORITY_LOW) {
            osPriority = 19;
        } else if (sdlPriority == SDL_THREAD_PRIORITY_HIGH) {
            osPriority = -@as(c_int, 10);
        } else if (sdlPriority == SDL_THREAD_PRIORITY_TIME_CRITICAL) {
            osPriority = -@as(c_int, 20);
        } else {
            osPriority = 0;
        }
        if (setpriority(PRIO_PROCESS, @bitCast(@as(c_int, @truncate(threadID))), osPriority) == @as(c_int, 0)) {
            return @"true" != 0;
        }
    }
    if ((schedPolicy == SCHED_RR) or (schedPolicy == SCHED_FIFO)) {
        if (rtkit_setpriority_realtime(@truncate(threadID), osPriority)) {
            return @"true" != 0;
        }
    } else {
        if (rtkit_setpriority_nice(@truncate(threadID), osPriority)) {
            return @"true" != 0;
        }
    }
    return SDL_SetError_REAL("setpriority() failed");
}

pub const SDL_SetLinuxThreadPriority = SDL_SetLinuxThreadPriority_REAL;
pub const SDL_SetLinuxThreadPriorityAndPolicy = SDL_SetLinuxThreadPriorityAndPolicy_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SCHED_FIFO = @as(c_int, 1);
pub const SCHED_RR = @as(c_int, 2);
pub const SCHED_RESET_ON_FORK = __helpers.promoteIntLiteral(c_int, 0x40000000, .hex);
pub const sched_priority = @compileError("unable to translate macro: undefined identifier `sched_priority`");
// /usr/include/sched.h:47:9
pub const PTHREAD_ONCE_INIT = @as(c_int, 0);
