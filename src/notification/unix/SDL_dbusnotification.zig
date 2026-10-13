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
pub const off_t = __off_t;
pub const __sigset_t = extern struct {
    __val: [16]c_ulong = @import("std").mem.zeroes([16]c_ulong),
};
pub const sigset_t = __sigset_t;
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
pub extern fn free(__ptr: ?*anyopaque) void;
pub extern fn realpath(noalias __name: [*c]const u8, noalias __resolved: [*c]u8) [*c]u8;
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memmove(__dest: ?*anyopaque, __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Sint32 = i32;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub const Uint64 = u64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_getenv_REAL(name: [*c]const u8) [*c]const u8;
pub extern fn SDL_strlen_REAL(str: [*c]const u8) usize;
pub extern fn SDL_strlcpy_REAL(dst: [*c]u8, src: [*c]const u8, maxlen: usize) usize;
pub extern fn SDL_strlcat_REAL(dst: [*c]u8, src: [*c]const u8, maxlen: usize) usize;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_strtoul_REAL(str: [*c]const u8, endp: [*c][*c]u8, base: c_int) c_ulong;
pub extern fn SDL_strtoull_REAL(str: [*c]const u8, endp: [*c][*c]u8, base: c_int) c_ulonglong;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_strncmp_REAL(str1: [*c]const u8, str2: [*c]const u8, maxlen: usize) c_int;
pub extern fn SDL_snprintf_REAL(text: [*c]u8, maxlen: usize, fmt: [*c]const u8, ...) c_int;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub extern fn SDL_OutOfMemory_REAL() bool;
pub const SDL_PropertiesID = Uint32;
pub extern fn SDL_GetGlobalProperties_REAL() SDL_PropertiesID;
pub extern fn SDL_GetPointerProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: ?*anyopaque) ?*anyopaque;
pub extern fn SDL_GetStringProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: [*c]const u8) [*c]const u8;
pub extern fn SDL_GetNumberProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: Sint64) Sint64;
pub extern fn SDL_GetBooleanProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: bool) bool;
pub const struct_SDL_IOStream = opaque {
};
pub const SDL_IOStream = struct_SDL_IOStream;
pub extern fn SDL_IOFromDynamicMem_REAL() ?*SDL_IOStream;
pub extern fn SDL_CloseIO_REAL(context: ?*SDL_IOStream) bool;
pub extern fn SDL_GetIOProperties_REAL(context: ?*SDL_IOStream) SDL_PropertiesID;
pub extern fn SDL_GetIOSize_REAL(context: ?*SDL_IOStream) Sint64;
pub const SDL_PIXELFORMAT_ABGR8888: c_int = 376840196;
pub const enum_SDL_PixelFormat = c_uint;
pub const SDL_PixelFormat = enum_SDL_PixelFormat;
pub const enum_SDL_Colorspace = c_uint;
pub const SDL_Colorspace = enum_SDL_Colorspace;
pub const struct_SDL_Color = extern struct {
    r: Uint8 = 0,
    g: Uint8 = 0,
    b: Uint8 = 0,
    a: Uint8 = 0,
};
pub const SDL_Color = struct_SDL_Color;
pub const struct_SDL_Palette = extern struct {
    ncolors: c_int = 0,
    colors: [*c]SDL_Color = null,
    version: Uint32 = 0,
    refcount: c_int = 0,
};
pub const SDL_Palette = struct_SDL_Palette;
pub const struct_SDL_PixelFormatDetails = extern struct {
    format: SDL_PixelFormat = @import("std").mem.zeroes(SDL_PixelFormat),
    bits_per_pixel: Uint8 = 0,
    bytes_per_pixel: Uint8 = 0,
    padding: [2]Uint8 = @import("std").mem.zeroes([2]Uint8),
    Rmask: Uint32 = 0,
    Gmask: Uint32 = 0,
    Bmask: Uint32 = 0,
    Amask: Uint32 = 0,
    Rbits: Uint8 = 0,
    Gbits: Uint8 = 0,
    Bbits: Uint8 = 0,
    Abits: Uint8 = 0,
    Rshift: Uint8 = 0,
    Gshift: Uint8 = 0,
    Bshift: Uint8 = 0,
    Ashift: Uint8 = 0,
};
pub const SDL_PixelFormatDetails = struct_SDL_PixelFormatDetails;
pub const struct_SDL_Rect = extern struct {
    x: c_int = 0,
    y: c_int = 0,
    w: c_int = 0,
    h: c_int = 0,
};
pub const SDL_Rect = struct_SDL_Rect;
pub const SDL_SurfaceFlags = Uint32;
pub const SDL_SurfaceDataFlags = Uint32;
pub const SDL_Surface = struct_SDL_Surface;
pub const SDL_Blit = ?*const fn (src: [*c]struct_SDL_Surface, srcrect: [*c]const SDL_Rect, dst: [*c]struct_SDL_Surface, dstrect: [*c]const SDL_Rect) callconv(.c) bool;
pub const struct_SDL_BlitMap = extern struct {
    identity: c_int = 0,
    blit: SDL_Blit = null,
    data: ?*anyopaque = null,
    info: SDL_BlitInfo = @import("std").mem.zeroes(SDL_BlitInfo),
    dst_palette_version: Uint32 = 0,
    src_palette_version: Uint32 = 0,
};
pub const SDL_BlitMap = struct_SDL_BlitMap;
pub const struct_SDL_Surface = extern struct {
    flags: SDL_SurfaceFlags = 0,
    format: SDL_PixelFormat = @import("std").mem.zeroes(SDL_PixelFormat),
    w: c_int = 0,
    h: c_int = 0,
    pitch: c_int = 0,
    pixels: ?*anyopaque = null,
    refcount: c_int = 0,
    reserved: ?*anyopaque = null,
    internal_flags: SDL_SurfaceDataFlags = 0,
    props: SDL_PropertiesID = 0,
    fmt: [*c]const SDL_PixelFormatDetails = null,
    colorspace: SDL_Colorspace = @import("std").mem.zeroes(SDL_Colorspace),
    palette: [*c]SDL_Palette = null,
    num_images: c_int = 0,
    images: [*c][*c]SDL_Surface = null,
    locked: c_int = 0,
    clip_rect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    map: SDL_BlitMap = @import("std").mem.zeroes(SDL_BlitMap),
    saved_pixels: ?*anyopaque = null,
};
pub extern fn SDL_DestroySurface_REAL(surface: [*c]SDL_Surface) void;
pub extern fn SDL_SavePNG_IO_REAL(surface: [*c]SDL_Surface, dst: ?*SDL_IOStream, closeio: bool) bool;
pub extern fn SDL_ConvertSurface_REAL(surface: [*c]SDL_Surface, format: SDL_PixelFormat) [*c]SDL_Surface;
pub const SDL_NotificationID = Uint32;
pub const SDL_NOTIFICATION_PRIORITY_LOW: c_int = -1;
pub const SDL_NOTIFICATION_PRIORITY_NORMAL: c_int = 0;
pub const SDL_NOTIFICATION_PRIORITY_HIGH: c_int = 1;
pub const SDL_NOTIFICATION_PRIORITY_CRITICAL: c_int = 2;
pub const enum_SDL_NotificationPriority = c_int;
pub const SDL_NotificationPriority = enum_SDL_NotificationPriority;
pub const SDL_NOTIFICATION_ACTION_TYPE_BUTTON: c_int = 1;
pub const enum_SDL_NotificationActionType = c_uint;
pub const SDL_NotificationActionType = enum_SDL_NotificationActionType;
const struct_unnamed_13 = extern struct {
    type: SDL_NotificationActionType = @import("std").mem.zeroes(SDL_NotificationActionType),
    action_id: [*c]const u8 = null,
    action_label: [*c]const u8 = null,
};
pub const union_SDL_NotificationAction = extern union {
    type: SDL_NotificationActionType,
    button: struct_unnamed_13,
    padding: [128]Uint8,
};
pub const SDL_NotificationAction = union_SDL_NotificationAction;
pub extern fn SDL_GetAppMetadataProperty_REAL(name: [*c]const u8) [*c]const u8;
pub const SDL_LOG_CATEGORY_APPLICATION: c_int = 0;
pub extern fn SDL_LogDebug_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_LogError_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub const SDL_SANDBOX_NONE: c_int = 0;
pub const enum_SDL_Sandbox = c_uint;
pub const SDL_Sandbox = enum_SDL_Sandbox;
pub extern fn SDL_GetSandbox_REAL() SDL_Sandbox;
pub extern fn SDL_GetTicksNS_REAL() Uint64;
pub const struct_SDL_HashTable = opaque {
};
pub const SDL_HashTable = struct_SDL_HashTable;
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
pub extern fn SDL_DBus_QueryProperty(save_reply: [*c]?*DBusMessage, node: [*c]const u8, path: [*c]const u8, interface: [*c]const u8, property: [*c]const u8, expectedtype: c_int, result: ?*anyopaque) bool;
pub extern fn SDL_GetAppID() [*c]const u8;
pub extern fn SDL_SendNotificationAction(notification_id: SDL_NotificationID, action_id: [*c]const u8) bool;
pub extern fn SDL_IOFromFD(fd: c_int, autoclose: bool) ?*SDL_IOStream;
pub const SDL_BlitInfo = extern struct {
    src_surface: [*c]SDL_Surface = null,
    src: [*c]Uint8 = null,
    src_w: c_int = 0,
    src_h: c_int = 0,
    src_pitch: c_int = 0,
    src_skip: c_int = 0,
    leading_skip: c_int = 0,
    dst_surface: [*c]SDL_Surface = null,
    dst: [*c]Uint8 = null,
    dst_w: c_int = 0,
    dst_h: c_int = 0,
    dst_pitch: c_int = 0,
    dst_skip: c_int = 0,
    src_fmt: [*c]const SDL_PixelFormatDetails = null,
    src_pal: [*c]const SDL_Palette = null,
    dst_fmt: [*c]const SDL_PixelFormatDetails = null,
    dst_pal: [*c]const SDL_Palette = null,
    table: [*c]Uint8 = null,
    palette_map: ?*SDL_HashTable = null,
    flags: c_int = 0,
    colorkey: Uint32 = 0,
    r: Uint8 = 0,
    g: Uint8 = 0,
    b: Uint8 = 0,
    a: Uint8 = 0,
};
pub extern fn __errno_location() [*c]c_int;
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
pub extern fn posix_fallocate(__fd: c_int, __offset: off_t, __len: off_t) c_int;
pub extern fn sigemptyset(__set: [*c]sigset_t) c_int;
pub extern fn sigaddset(__set: [*c]sigset_t, __signo: c_int) c_int;
pub extern fn sigprocmask(__how: c_int, noalias __set: [*c]const sigset_t, noalias __oset: [*c]sigset_t) c_int;
pub extern fn close(__fd: c_int) c_int;
pub extern fn read(__fd: c_int, __buf: ?*anyopaque, __nbytes: usize) isize;
pub extern fn truncate(__file: [*c]const u8, __length: __off_t) c_int;
pub extern fn ftruncate(__fd: c_int, __length: __off_t) c_int;
pub extern fn stat(noalias __file: [*c]const u8, noalias __buf: [*c]struct_stat) c_int;
pub extern fn memfd_create(__name: [*c]const u8, __flags: c_uint) c_int;
pub extern fn mmap(__addr: ?*anyopaque, __len: usize, __prot: c_int, __flags: c_int, __fd: c_int, __offset: __off_t) ?*anyopaque;
pub extern fn munmap(__addr: ?*anyopaque, __len: usize) c_int;
pub var activation_token_time_ns: Uint64 = 0;
pub var activation_token: [*c]u8 = null;
pub var icon_uri: [*c]u8 = null;
pub var session_id: Uint64 = 0;
pub var core_id_list: [32]Uint32 = @import("std").mem.zeroes([32]Uint32);
pub var core_id_count: Uint32 = 0;
pub var interface_version: Uint32 = 0;
pub var core_interface_initialized: bool = false;
pub var portal_interface_initialized: bool = false;
pub fn GetRandom(dst: ?*anyopaque, size: usize) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var fd: c_int = open("/dev/urandom", O_RDONLY);
    _ = &fd;
    if (fd < @as(c_int, 0)) {
        fd = open("/dev/random", O_RDONLY);
    }
    if (fd >= @as(c_int, 0)) {
        while (@as(usize, @bitCast(@as(c_long, read(fd, dst, size)))) != size) {}
        _ = close(fd);
    } else {
        var written: usize = 0;
        _ = &written;
        while (written < size) {
            const tval: Uint64 = SDL_GetTicksNS_REAL();
            _ = &tval;
            const towrite: usize = if ((size -% written) < @sizeOf(@TypeOf(tval))) size -% written else @sizeOf(@TypeOf(tval));
            _ = &towrite;
            _ = memcpy(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(dst))) + written)), @ptrCast(@alignCast(&tval)), towrite);
            written +%= towrite;
        }
    }
}
pub fn AppendOption(dbus: [*c]SDL_DBusContext, options: [*c]DBusMessageIter, arg_type: [*c]const u8, arg_key: [*c]const u8, value: ?*const anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var key = arg_key;
    _ = &key;
    var options_pair: DBusMessageIter = undefined;
    _ = &options_pair;
    var options_value: DBusMessageIter = undefined;
    _ = &options_value;
    if (!(dbus.*.message_iter_open_container.?(options, @as(c_int, 'e'), null, &options_pair) != 0)) {
        return @"false" != 0;
    }
    if (!(dbus.*.message_iter_append_basic.?(&options_pair, @as(c_int, 's'), @ptrCast(@alignCast(&key))) != 0)) {
        return @"false" != 0;
    }
    if (!(dbus.*.message_iter_open_container.?(&options_pair, @as(c_int, 'v'), @"type", &options_value) != 0)) {
        return @"false" != 0;
    }
    if (!(dbus.*.message_iter_append_basic.?(&options_value, @"type"[@as(c_int, 0)], value) != 0)) {
        return @"false" != 0;
    }
    if (!(dbus.*.message_iter_close_container.?(&options_pair, &options_value) != 0)) {
        return @"false" != 0;
    }
    return dbus.*.message_iter_close_container.?(options, &options_pair) != 0;
}
pub fn AppendStringOption(dbus: [*c]SDL_DBusContext, options: [*c]DBusMessageIter, arg_key: [*c]const u8, arg_value: [*c]const u8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var key = arg_key;
    _ = &key;
    var value = arg_value;
    _ = &value;
    var options_pair: DBusMessageIter = undefined;
    _ = &options_pair;
    var options_value: DBusMessageIter = undefined;
    _ = &options_value;
    if (!(dbus.*.message_iter_open_container.?(options, @as(c_int, 'e'), null, &options_pair) != 0)) {
        return @"false" != 0;
    }
    if (!(dbus.*.message_iter_append_basic.?(&options_pair, @as(c_int, 's'), @ptrCast(@alignCast(&key))) != 0)) {
        return @"false" != 0;
    }
    if (!(dbus.*.message_iter_open_container.?(&options_pair, @as(c_int, 'v'), "s", &options_value) != 0)) {
        return @"false" != 0;
    }
    if (!(dbus.*.message_iter_append_basic.?(&options_value, @as(c_int, 's'), @ptrCast(@alignCast(&value))) != 0)) {
        return @"false" != 0;
    }
    if (!(dbus.*.message_iter_close_container.?(&options_pair, &options_value) != 0)) {
        return @"false" != 0;
    }
    return dbus.*.message_iter_close_container.?(options, &options_pair) != 0;
}
pub fn AppendTargetString(dbus: [*c]SDL_DBusContext, options: [*c]DBusMessageIter, arg_key: [*c]const u8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var key = arg_key;
    _ = &key;
    var target_buf: [128]u8 = undefined;
    _ = &target_buf;
    var target_val: [*c]const u8 = @ptrCast(@alignCast(&target_buf));
    _ = &target_val;
    var options_pair: DBusMessageIter = undefined;
    _ = &options_pair;
    var target_variant: DBusMessageIter = undefined;
    _ = &target_variant;
    var target_string: DBusMessageIter = undefined;
    _ = &target_string;
    _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&target_buf)), @sizeOf(@TypeOf(target_buf)), "%lu", session_id);
    if (!(dbus.*.message_iter_open_container.?(options, @as(c_int, 'e'), null, &options_pair) != 0)) {
        return @"false" != 0;
    }
    if (!(dbus.*.message_iter_append_basic.?(&options_pair, @as(c_int, 's'), @ptrCast(@alignCast(&key))) != 0)) {
        return @"false" != 0;
    }
    if (!(dbus.*.message_iter_open_container.?(&options_pair, @as(c_int, 'v'), "v", &target_variant) != 0)) {
        return @"false" != 0;
    }
    if (!(dbus.*.message_iter_open_container.?(&target_variant, @as(c_int, 'v'), "s", &target_string) != 0)) {
        return @"false" != 0;
    }
    if (!(dbus.*.message_iter_append_basic.?(&target_string, @as(c_int, 's'), @ptrCast(@alignCast(&target_val))) != 0)) {
        return @"false" != 0;
    }
    if (!(dbus.*.message_iter_close_container.?(&target_variant, &target_string) != 0)) {
        return @"false" != 0;
    }
    if (!(dbus.*.message_iter_close_container.?(&options_pair, &target_variant) != 0)) {
        return @"false" != 0;
    }
    return dbus.*.message_iter_close_container.?(options, &options_pair) != 0;
}
pub fn RemoveIDFromListAtIndex(index_1: Uint32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    core_id_count -%= 1;
    if (index_1 < core_id_count) {
        _ = memmove(@ptrCast(@alignCast(&core_id_list[index_1])), @ptrCast(@alignCast(&core_id_list[index_1 +% @as(Uint32, 1)])), @as(c_ulong, core_id_count -% index_1) *% @sizeOf(Uint32));
    }
}
pub fn HasDesktopFile(app_id: [*c]const u8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var path: [4096]u8 = undefined;
    _ = &path;
    var st: struct_stat = undefined;
    _ = &st;
    if (!(app_id != null)) {
        return @as(?*anyopaque, null) != null;
    }
    var xdg_data_home: [*c]const u8 = SDL_getenv_REAL("XDG_DATA_HOME");
    _ = &xdg_data_home;
    if (xdg_data_home != null) {
        _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&path)), @sizeOf(@TypeOf(path)) / @sizeOf(@TypeOf(path[@as(c_int, 0)])), "%s/applications/%s.desktop", xdg_data_home, app_id);
        if (stat(@ptrCast(@alignCast(&path)), &st) == @as(c_int, 0)) {
            return @"true" != 0;
        }
    } else {
        xdg_data_home = SDL_getenv_REAL("HOME");
        if (xdg_data_home != null) {
            _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&path)), @sizeOf(@TypeOf(path)) / @sizeOf(@TypeOf(path[@as(c_int, 0)])), "%s/.local/share/applications/%s.desktop", xdg_data_home, app_id);
            if (stat(@ptrCast(@alignCast(&path)), &st) == @as(c_int, 0)) {
                return @"true" != 0;
            }
        }
    }
    if (xdg_data_home != null) {
        _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&path)), @sizeOf(@TypeOf(path)) / @sizeOf(@TypeOf(path[@as(c_int, 0)])), "%s/.local/share/applications/%s.desktop", xdg_data_home, app_id);
        if (stat(@ptrCast(@alignCast(&path)), &st) == @as(c_int, 0)) {
            return @"true" != 0;
        }
    }
    _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&path)), @sizeOf(@TypeOf(path)) / @sizeOf(@TypeOf(path[@as(c_int, 0)])), "/usr/share/local/applications/%s.desktop", app_id);
    if (stat(@ptrCast(@alignCast(&path)), &st) == @as(c_int, 0)) {
        return @"true" != 0;
    }
    _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&path)), @sizeOf(@TypeOf(path)) / @sizeOf(@TypeOf(path[@as(c_int, 0)])), "/usr/share/applications/%s.desktop", app_id);
    if (stat(@ptrCast(@alignCast(&path)), &st) == @as(c_int, 0)) {
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub fn CoreNotificationFilter(_: ?*DBusConnection, msg: ?*DBusMessage, _: ?*anyopaque) callconv(.c) DBusHandlerResult {
    @setEvalBranchQuota(100000);
    var dbus: [*c]SDL_DBusContext = undefined;
    _ = &dbus;
    var signal_iter: DBusMessageIter = undefined;
    _ = &signal_iter;
    var button: [*c]const u8 = undefined;
    _ = &button;
    var id: Uint32 = undefined;
    _ = &id;
    var own_id: bool = undefined;
    _ = &own_id;
    var i: Uint32 = undefined;
    _ = &i;
    var signal_iter_1: DBusMessageIter = undefined;
    _ = &signal_iter_1;
    var id_2: Uint32 = undefined;
    _ = &id_2;
    var reason: Uint32 = undefined;
    _ = &reason;
    var i_3: Uint32 = undefined;
    _ = &i_3;
    var signal_iter_4: DBusMessageIter = undefined;
    _ = &signal_iter_4;
    var token: [*c]const u8 = undefined;
    _ = &token;
    var id_5: Uint32 = undefined;
    _ = &id_5;
    var i_6: Uint32 = undefined;
    _ = &i_6;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                dbus = SDL_DBus_GetContext();
                if (dbus.*.message_is_signal.?(msg, "org.freedesktop.Notifications", "ActionInvoked") != 0) {
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
                button = null;
                id = 0;
                own_id = @"false" != 0;
                if (!(dbus.*.message_iter_init.?(msg, &signal_iter) != 0)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            3 => {
                if (dbus.*.message_is_signal.?(msg, "org.freedesktop.Notifications", "NotificationClosed") != 0) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
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
                if (dbus.*.message_iter_get_arg_type.?(&signal_iter) != @as(c_int, 'u')) {
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
                dbus.*.message_iter_get_basic.?(&signal_iter, @ptrCast(@alignCast(&id)));
                i = 0;
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                if (i < core_id_count) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            12 => {
                if (id == core_id_list[i]) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            13 => {
                i +%= 1;
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            14 => {
                if (!own_id) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            15 => {
                RemoveIDFromListAtIndex(i);
                own_id = @"true" != 0;
                {
                    sdl_pc = 14;
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
                {
                    sdl_pc = 13;
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
                if (!(dbus.*.message_iter_next.?(&signal_iter) != 0)) {
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
                if (dbus.*.message_iter_get_arg_type.?(&signal_iter) != @as(c_int, 's')) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
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
                dbus.*.message_iter_get_basic.?(&signal_iter, @ptrCast(@alignCast(&button)));
                if (button != null) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            27 => {
                _ = SDL_SendNotificationAction(id, button);
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
                return DBUS_HANDLER_RESULT_HANDLED;
            },
            30 => {
                id_2 = 0;
                reason = 0;
                _ = dbus.*.message_iter_init.?(msg, &signal_iter_1);
                if (dbus.*.message_iter_get_arg_type.?(&signal_iter_1) != @as(c_int, 'u')) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 34;
                    continue;
                }
            },
            31 => {
                if (dbus.*.message_is_signal.?(msg, "org.freedesktop.Notifications", "ActivationToken") != 0) {
                    sdl_pc = 52;
                    continue;
                } else {
                    sdl_pc = 53;
                    continue;
                }
            },
            32 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            33 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            34 => {
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            35 => {
                dbus.*.message_iter_get_basic.?(&signal_iter_1, @ptrCast(@alignCast(&id_2)));
                if (!(dbus.*.message_iter_next.?(&signal_iter_1) != 0)) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 37;
                    continue;
                }
            },
            36 => {
                {
                    sdl_pc = 1;
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
                if (dbus.*.message_iter_get_arg_type.?(&signal_iter_1) != @as(c_int, 'u')) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 40;
                    continue;
                }
            },
            39 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            40 => {
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            41 => {
                dbus.*.message_iter_get_basic.?(&signal_iter_1, @ptrCast(@alignCast(&reason)));
                if ((id_2 != 0) and (reason != 0)) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 43;
                    continue;
                }
            },
            42 => {
                i_3 = 0;
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            43 => {
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            44 => {
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            45 => {
                if (i_3 < core_id_count) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            46 => {
                if (core_id_list[i_3] == id_2) {
                    sdl_pc = 49;
                    continue;
                } else {
                    sdl_pc = 50;
                    continue;
                }
            },
            47 => {
                i_3 +%= 1;
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            48 => {
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            49 => {
                RemoveIDFromListAtIndex(i_3);
                return DBUS_HANDLER_RESULT_HANDLED;
            },
            50 => {
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            51 => {
                {
                    sdl_pc = 47;
                    continue;
                }
            },
            52 => {
                token = null;
                id_5 = 0;
                _ = dbus.*.message_iter_init.?(msg, &signal_iter_4);
                if (dbus.*.message_iter_get_arg_type.?(&signal_iter_4) != @as(c_int, 'u')) {
                    sdl_pc = 55;
                    continue;
                } else {
                    sdl_pc = 56;
                    continue;
                }
            },
            53 => {
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            54 => {
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            55 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            56 => {
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            57 => {
                dbus.*.message_iter_get_basic.?(&signal_iter_4, @ptrCast(@alignCast(&id_5)));
                if (!(dbus.*.message_iter_next.?(&signal_iter_4) != 0)) {
                    sdl_pc = 58;
                    continue;
                } else {
                    sdl_pc = 59;
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
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            60 => {
                if (dbus.*.message_iter_get_arg_type.?(&signal_iter_4) != @as(c_int, 's')) {
                    sdl_pc = 61;
                    continue;
                } else {
                    sdl_pc = 62;
                    continue;
                }
            },
            61 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            62 => {
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            63 => {
                dbus.*.message_iter_get_basic.?(&signal_iter_4, @ptrCast(@alignCast(&token)));
                if ((id_5 != 0) and (token != null)) {
                    sdl_pc = 64;
                    continue;
                } else {
                    sdl_pc = 65;
                    continue;
                }
            },
            64 => {
                i_6 = 0;
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            65 => {
                {
                    sdl_pc = 66;
                    continue;
                }
            },
            66 => {
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            67 => {
                if (i_6 < core_id_count) {
                    sdl_pc = 68;
                    continue;
                } else {
                    sdl_pc = 70;
                    continue;
                }
            },
            68 => {
                if (core_id_list[i_6] == id_5) {
                    sdl_pc = 71;
                    continue;
                } else {
                    sdl_pc = 72;
                    continue;
                }
            },
            69 => {
                i_6 +%= 1;
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            70 => {
                {
                    sdl_pc = 66;
                    continue;
                }
            },
            71 => {
                SDL_free_REAL(@ptrCast(@alignCast(activation_token)));
                activation_token = SDL_strdup_REAL(token);
                activation_token_time_ns = SDL_GetTicksNS_REAL();
                return DBUS_HANDLER_RESULT_HANDLED;
            },
            72 => {
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            73 => {
                {
                    sdl_pc = 69;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn SetCoreImage(dbus: [*c]SDL_DBusContext, iterInit: [*c]DBusMessageIter, surface: [*c]SDL_Surface) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var iterEntry: DBusMessageIter = undefined;
    _ = &iterEntry;
    var iterValue: DBusMessageIter = undefined;
    _ = &iterValue;
    var iter: DBusMessageIter = undefined;
    _ = &iter;
    var array: DBusMessageIter = undefined;
    _ = &array;
    const alpha: dbus_bool_t = @"true";
    _ = &alpha;
    var bpp: Sint32 = 8;
    _ = &bpp;
    if (!(dbus.*.message_iter_open_container.?(iterInit, @as(c_int, 'e'), null, &iterEntry) != 0)) {
        return @"false" != 0;
    }
    var key: [*c]const u8 = "image-data";
    _ = &key;
    if (!(dbus.*.message_iter_append_basic.?(&iterEntry, @as(c_int, 's'), @ptrCast(@alignCast(&key))) != 0)) {
        return @"false" != 0;
    }
    if (!(dbus.*.message_iter_open_container.?(&iterEntry, @as(c_int, 'v'), "(iiibiiay)", &iterValue) != 0)) {
        return @"false" != 0;
    }
    if (!(dbus.*.message_iter_open_container.?(&iterValue, @as(c_int, 'r'), null, &iter) != 0)) {
        return @"false" != 0;
    }
    if (!(dbus.*.message_iter_append_basic.?(&iter, @as(c_int, 'i'), @ptrCast(@alignCast(&surface.*.w))) != 0)) {
        return @"false" != 0;
    }
    if (!(dbus.*.message_iter_append_basic.?(&iter, @as(c_int, 'i'), @ptrCast(@alignCast(&surface.*.h))) != 0)) {
        return @"false" != 0;
    }
    if (!(dbus.*.message_iter_append_basic.?(&iter, @as(c_int, 'i'), @ptrCast(@alignCast(&surface.*.pitch))) != 0)) {
        return @"false" != 0;
    }
    if (!(dbus.*.message_iter_append_basic.?(&iter, @as(c_int, 'b'), @ptrCast(@alignCast(&alpha))) != 0)) {
        return @"false" != 0;
    }
    if (!(dbus.*.message_iter_append_basic.?(&iter, @as(c_int, 'i'), @ptrCast(@alignCast(&bpp))) != 0)) {
        return @"false" != 0;
    }
    bpp = 4;
    if (!(dbus.*.message_iter_append_basic.?(&iter, @as(c_int, 'i'), @ptrCast(@alignCast(&bpp))) != 0)) {
        return @"false" != 0;
    }
    if (!(dbus.*.message_iter_open_container.?(&iter, @as(c_int, 'a'), "y", &array) != 0)) {
        return @"false" != 0;
    }
    var pixels: [*c]const Uint8 = @ptrCast(@alignCast(surface.*.pixels));
    _ = &pixels;
    {
        var i: c_int = 0;
        _ = &i;
        while (i < (surface.*.pitch * surface.*.h)) : (i += 1) {
            if (!(dbus.*.message_iter_append_basic.?(&array, @as(c_int, 'y'), @ptrCast(@alignCast(&pixels[@bitCast(@as(isize, @intCast(i)))]))) != 0)) {
                return @"false" != 0;
            }
        }
    }
    if (!(dbus.*.message_iter_close_container.?(&iter, &array) != 0)) {
        return @"false" != 0;
    }
    if (!(dbus.*.message_iter_close_container.?(&iterValue, &iter) != 0)) {
        return @"false" != 0;
    }
    if (!(dbus.*.message_iter_close_container.?(&iterEntry, &iterValue) != 0)) {
        return @"false" != 0;
    }
    if (!(dbus.*.message_iter_close_container.?(iterInit, &iterEntry) != 0)) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn SetCoreHints(dbus: [*c]SDL_DBusContext, iterInit: [*c]DBusMessageIter, props: SDL_PropertiesID) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var iterDict: DBusMessageIter = undefined;
    _ = &iterDict;
    var app_id: [*c]const u8 = undefined;
    _ = &app_id;
    var sound: [*c]const u8 = undefined;
    _ = &sound;
    var image: [*c]SDL_Surface = undefined;
    _ = &image;
    var priority: SDL_NotificationPriority = undefined;
    _ = &priority;
    var transient: bool = undefined;
    _ = &transient;
    var dbus_priority: Uint8 = undefined;
    _ = &dbus_priority;
    var db_transient: dbus_bool_t = undefined;
    _ = &db_transient;
    var sound_path: [4096]u8 = undefined;
    _ = &sound_path;
    var image_surface: [*c]SDL_Surface = undefined;
    _ = &image_surface;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                app_id = SDL_GetAppMetadataProperty_REAL("SDL.app.metadata.identifier");
                sound = SDL_GetStringProperty_REAL(props, "SDL.notification.sound", "default");
                image = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(props, "SDL.notification.image", null)));
                priority = @truncate(SDL_GetNumberProperty_REAL(props, "SDL.notification.priority", SDL_NOTIFICATION_PRIORITY_NORMAL));
                transient = SDL_GetBooleanProperty_REAL(props, "SDL.notification.transient", @"false" != 0);
                if (!(dbus.*.message_iter_open_container.?(iterInit, @as(c_int, 'a'), "{sv}", &iterDict) != 0)) {
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
                switch (priority) {
                    SDL_NOTIFICATION_PRIORITY_NORMAL => {
                        sdl_pc = 5;
                        continue;
                    },
                    SDL_NOTIFICATION_PRIORITY_HIGH => {
                        sdl_pc = 6;
                        continue;
                    },
                    SDL_NOTIFICATION_PRIORITY_LOW => {
                        sdl_pc = 8;
                        continue;
                    },
                    SDL_NOTIFICATION_PRIORITY_CRITICAL => {
                        sdl_pc = 9;
                        continue;
                    },
                    else => {
                        sdl_pc = 7;
                        continue;
                    },
                }
            },
            4 => {
                if (!AppendOption(dbus, &iterDict, "y", "urgency", @ptrCast(@alignCast(&dbus_priority)))) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            5 => {
                {
                    sdl_pc = 6;
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
                dbus_priority = 1;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            8 => {
                dbus_priority = 0;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            9 => {
                dbus_priority = 2;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            10 => {
                return @"false" != 0;
            },
            11 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                if (app_id != null) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            13 => {
                if (HasDesktopFile(app_id)) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            14 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                db_transient = @intFromBool(transient);
                if (!AppendOption(dbus, &iterDict, "b", "transient", @ptrCast(@alignCast(&db_transient)))) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            16 => {
                if (!AppendOption(dbus, &iterDict, "s", "desktop-entry", @ptrCast(@alignCast(&app_id)))) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            18 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            19 => {
                return @"false" != 0;
            },
            20 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            21 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            22 => {
                return @"false" != 0;
            },
            23 => {
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            24 => {
                if (SDL_strcmp_REAL(sound, "default") == @as(c_int, 0)) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            25 => {
                if (!AppendStringOption(dbus, &iterDict, "sound-name", "dialog-information")) {
                    sdl_pc = 28;
                    continue;
                } else {
                    sdl_pc = 29;
                    continue;
                }
            },
            26 => {
                if (SDL_strcmp_REAL(sound, "silent") != @as(c_int, 0)) {
                    sdl_pc = 31;
                    continue;
                } else {
                    sdl_pc = 32;
                    continue;
                }
            },
            27 => {
                if (image != null) {
                    sdl_pc = 43;
                    continue;
                } else {
                    sdl_pc = 44;
                    continue;
                }
            },
            28 => {
                return @"false" != 0;
            },
            29 => {
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            30 => {
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            31 => {
                if (realpath(sound, @ptrCast(@alignCast(&sound_path))) != null) {
                    sdl_pc = 34;
                    continue;
                } else {
                    sdl_pc = 35;
                    continue;
                }
            },
            32 => {
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            33 => {
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            34 => {
                if (!AppendStringOption(dbus, &iterDict, "sound-file", @ptrCast(@alignCast(&sound_path)))) {
                    sdl_pc = 37;
                    continue;
                } else {
                    sdl_pc = 38;
                    continue;
                }
            },
            35 => {
                SDL_LogError_REAL(SDL_LOG_CATEGORY_APPLICATION, "Notification sound '%s' not found", sound);
                if (!AppendStringOption(dbus, &iterDict, "sound-name", "dialog-information")) {
                    sdl_pc = 40;
                    continue;
                } else {
                    sdl_pc = 41;
                    continue;
                }
            },
            36 => {
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            37 => {
                return @"false" != 0;
            },
            38 => {
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            39 => {
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            40 => {
                return @"false" != 0;
            },
            41 => {
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            42 => {
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            43 => {
                image_surface = image;
                if (image.*.format != @as(SDL_PixelFormat, SDL_PIXELFORMAT_ABGR8888)) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 47;
                    continue;
                }
            },
            44 => {
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            45 => {
                if (!(dbus.*.message_iter_close_container.?(iterInit, &iterDict) != 0)) {
                    sdl_pc = 52;
                    continue;
                } else {
                    sdl_pc = 53;
                    continue;
                }
            },
            46 => {
                image_surface = SDL_ConvertSurface_REAL(image, SDL_PIXELFORMAT_ABGR8888);
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            47 => {
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            48 => {
                _ = SetCoreImage(dbus, &iterDict, image_surface);
                if (image_surface != image) {
                    sdl_pc = 49;
                    continue;
                } else {
                    sdl_pc = 50;
                    continue;
                }
            },
            49 => {
                SDL_DestroySurface_REAL(image_surface);
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            50 => {
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            51 => {
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            52 => {
                return @"false" != 0;
            },
            53 => {
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            54 => {
                return @"true" != 0;
            },
            else => unreachable,
        }
    }
}
pub fn InitCoreSignalListener(dbus: [*c]SDL_DBusContext) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local_interface_unavailable = struct {
        var interface_unavailable: bool = @"false" != 0;
    };
    _ = &static_local_interface_unavailable;
    var msg: ?*DBusMessage = undefined;
    _ = &msg;
    var reply: ?*DBusMessage = undefined;
    _ = &reply;
    var @"error": DBusError = undefined;
    _ = &@"error";
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (static_local_interface_unavailable.interface_unavailable) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            1 => {
                dbus.*.bus_remove_match.?(dbus.*.session_conn, "type='signal', interface='org.freedesktop.Notifications',member='ActivationToken'", null);
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            2 => {
                dbus.*.bus_remove_match.?(dbus.*.session_conn, "type='signal', interface='org.freedesktop.Notifications',member='NotificationClosed'", null);
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                dbus.*.bus_remove_match.?(dbus.*.session_conn, "type='signal', interface='org.freedesktop.Notifications',member='ActionInvoked'", null);
                return @"false" != 0;
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
                msg = dbus.*.message_new_method_call.?("org.freedesktop.Notifications", "/org/freedesktop/Notifications", "org.freedesktop.Notifications", "GetServerInformation");
                if (@as(?*anyopaque, @ptrCast(@alignCast(msg))) == @as(?*anyopaque, null)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                return @"false" != 0;
            },
            8 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                reply = dbus.*.connection_send_with_reply_and_block.?(dbus.*.session_conn, msg, -@as(c_int, 1), null);
                dbus.*.message_unref.?(msg);
                if (!(reply != null)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                static_local_interface_unavailable.interface_unavailable = @"true" != 0;
                return @"false" != 0;
            },
            11 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                dbus.*.message_unref.?(reply);
                if (!(session_id != 0)) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            13 => {
                GetRandom(@ptrCast(@alignCast(&session_id)), @sizeOf(@TypeOf(session_id)));
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                dbus.*.error_init.?(&@"error");
                dbus.*.bus_add_match.?(dbus.*.session_conn, "type='signal', interface='org.freedesktop.Notifications',member='ActionInvoked'", &@"error");
                if (dbus.*.error_is_set.?(&@"error") != 0) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            16 => {
                SDL_LogDebug_REAL(SDL_LOG_CATEGORY_APPLICATION, "Failed to register DBus notification filter: %s", @"error".message);
                dbus.*.error_free.?(&@"error");
                return @"false" != 0;
            },
            17 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            18 => {
                dbus.*.bus_add_match.?(dbus.*.session_conn, "type='signal', interface='org.freedesktop.Notifications',member='NotificationClosed'", &@"error");
                if (dbus.*.error_is_set.?(&@"error") != 0) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            19 => {
                SDL_LogDebug_REAL(SDL_LOG_CATEGORY_APPLICATION, "Failed to register DBus notification filter: %s", @"error".message);
                dbus.*.error_free.?(&@"error");
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            20 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            21 => {
                dbus.*.bus_add_match.?(dbus.*.session_conn, "type='signal', interface='org.freedesktop.Notifications',member='ActivationToken'", &@"error");
                if (dbus.*.error_is_set.?(&@"error") != 0) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            22 => {
                SDL_LogDebug_REAL(SDL_LOG_CATEGORY_APPLICATION, "Failed to register DBus notification filter: %s", @"error".message);
                dbus.*.error_free.?(&@"error");
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            23 => {
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            24 => {
                dbus.*.error_free.?(&@"error");
                if (dbus.*.connection_add_filter.?(dbus.*.session_conn, &CoreNotificationFilter, null, null) != 0) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            25 => {
                dbus.*.connection_flush.?(dbus.*.session_conn);
                SDL_LogDebug_REAL(SDL_LOG_CATEGORY_APPLICATION, "Registered DBus portal notification filter");
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            26 => {
                SDL_LogDebug_REAL(SDL_LOG_CATEGORY_APPLICATION, "Failed to register DBus notification filter: %s", @"error".message);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            27 => {
                core_interface_initialized = @"true" != 0;
                return @"true" != 0;
            },
            else => unreachable,
        }
    }
}
pub fn GetIconURI() callconv(.c) [*c]const u8 {
    @setEvalBranchQuota(100000);
    if (icon_uri != null) {
        return icon_uri;
    }
    var full_path: [4096]u8 = undefined;
    _ = &full_path;
    var props: SDL_PropertiesID = SDL_GetGlobalProperties_REAL();
    _ = &props;
    var icon: [*c]const u8 = SDL_GetStringProperty_REAL(props, "SDL.notification.header_icon", null);
    _ = &icon;
    if ((icon != null) and (realpath(icon, @ptrCast(@alignCast(&full_path))) != null)) {
        const len: usize = SDL_strlen_REAL(@ptrCast(@alignCast(&full_path))) +% @as(usize, 8);
        _ = &len;
        icon_uri = @ptrCast(@alignCast(SDL_malloc_REAL(len)));
        if (icon_uri != null) {
            _ = SDL_strlcpy_REAL(icon_uri, "file://", len);
            _ = SDL_strlcat_REAL(icon_uri, @ptrCast(@alignCast(&full_path)), len);
        }
    } else if (icon != null) {
        icon_uri = SDL_strdup_REAL(icon);
    }
    return icon_uri;
}
pub fn ShowCoreNotification(dbus: [*c]SDL_DBusContext, props: SDL_PropertiesID) callconv(.c) SDL_NotificationID {
    @setEvalBranchQuota(100000);
    var conn: ?*DBusConnection = undefined;
    _ = &conn;
    var msg: ?*DBusMessage = undefined;
    _ = &msg;
    var iter: DBusMessageIter = undefined;
    _ = &iter;
    var array: DBusMessageIter = undefined;
    _ = &array;
    var tmpstr: [*c]const u8 = undefined;
    _ = &tmpstr;
    var timeout: Sint32 = undefined;
    _ = &timeout;
    var message_id: Uint32 = undefined;
    _ = &message_id;
    var error_set: bool = undefined;
    _ = &error_set;
    var replaces: SDL_PropertiesID = undefined;
    _ = &replaces;
    var title: [*c]const u8 = undefined;
    _ = &title;
    var message: [*c]const u8 = undefined;
    _ = &message;
    var actions: [*c]const SDL_NotificationAction = undefined;
    _ = &actions;
    var num_actions: c_int = undefined;
    _ = &num_actions;
    var i: c_int = undefined;
    _ = &i;
    var reply_iter: DBusMessageIter = undefined;
    _ = &reply_iter;
    var @"error": DBusError = undefined;
    _ = &@"error";
    var reply: ?*DBusMessage = undefined;
    _ = &reply;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                conn = dbus.*.session_conn;
                msg = null;
                tmpstr = null;
                timeout = -@as(c_int, 1);
                message_id = 0;
                error_set = @"false" != 0;
                replaces = @bitCast(@as(c_int, @truncate(SDL_GetNumberProperty_REAL(props, "SDL.notification.replaces", 0))));
                title = SDL_GetStringProperty_REAL(props, "SDL.notification.title", null);
                message = SDL_GetStringProperty_REAL(props, "SDL.notification.message", null);
                actions = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(props, "SDL.notification.actions", null)));
                num_actions = @truncate(SDL_GetNumberProperty_REAL(props, "SDL.notification.action_count", 0));
                msg = dbus.*.message_new_method_call.?("org.freedesktop.Notifications", "/org/freedesktop/Notifications", "org.freedesktop.Notifications", "Notify");
                if (@as(?*anyopaque, @ptrCast(@alignCast(msg))) == @as(?*anyopaque, null)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                if (msg != null) {
                    sdl_pc = 75;
                    continue;
                } else {
                    sdl_pc = 76;
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
                dbus.*.message_iter_init_append.?(msg, &iter);
                tmpstr = SDL_GetAppMetadataProperty_REAL("SDL.app.metadata.name");
                if (!(tmpstr != null)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                _ = SDL_GetAppID();
                {
                    sdl_pc = 7;
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
                if (!(dbus.*.message_iter_append_basic.?(&iter, @as(c_int, 's'), @ptrCast(@alignCast(&tmpstr))) != 0)) {
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
                if (!(dbus.*.message_iter_append_basic.?(&iter, @as(c_int, 'u'), @ptrCast(@alignCast(&replaces))) != 0)) {
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
                tmpstr = GetIconURI();
                if (!(tmpstr != null)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                tmpstr = "";
                {
                    sdl_pc = 16;
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
                if (!(dbus.*.message_iter_append_basic.?(&iter, @as(c_int, 's'), @ptrCast(@alignCast(&tmpstr))) != 0)) {
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
                if (!(dbus.*.message_iter_append_basic.?(&iter, @as(c_int, 's'), @ptrCast(@alignCast(&title))) != 0)) {
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
                tmpstr = if (message != null) message else @as([*c]const u8, @ptrCast(@alignCast(@as([*c]u8, @as([*c]u8, @constCast(""))))));
                if (!(dbus.*.message_iter_append_basic.?(&iter, @as(c_int, 's'), @ptrCast(@alignCast(&message))) != 0)) {
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
                if (!(dbus.*.message_iter_open_container.?(&iter, @as(c_int, 'a'), "s", &array) != 0)) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
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
                tmpstr = "default";
                if (!(dbus.*.message_iter_append_basic.?(&array, @as(c_int, 's'), @ptrCast(@alignCast(&tmpstr))) != 0)) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            29 => {
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
                if (!(dbus.*.message_iter_append_basic.?(&array, @as(c_int, 's'), @ptrCast(@alignCast(&tmpstr))) != 0)) {
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
                if (actions != null) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            35 => {
                i = 0;
                {
                    sdl_pc = 38;
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
                if (!(dbus.*.message_iter_close_container.?(&iter, &array) != 0)) {
                    sdl_pc = 51;
                    continue;
                } else {
                    sdl_pc = 52;
                    continue;
                }
            },
            38 => {
                if (i < num_actions) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 41;
                    continue;
                }
            },
            39 => {
                if (actions[@bitCast(@as(isize, @intCast(i)))].type == @as(SDL_NotificationActionType, SDL_NOTIFICATION_ACTION_TYPE_BUTTON)) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 43;
                    continue;
                }
            },
            40 => {
                i += 1;
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            41 => {
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            42 => {
                if (!(dbus.*.message_iter_append_basic.?(&array, @as(c_int, 's'), @ptrCast(@alignCast(&actions[@bitCast(@as(isize, @intCast(i)))].button.action_id))) != 0)) {
                    sdl_pc = 45;
                    continue;
                } else {
                    sdl_pc = 46;
                    continue;
                }
            },
            43 => {
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            44 => {
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            45 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            46 => {
                {
                    sdl_pc = 47;
                    continue;
                }
            },
            47 => {
                if (!(dbus.*.message_iter_append_basic.?(&array, @as(c_int, 's'), @ptrCast(@alignCast(&actions[@bitCast(@as(isize, @intCast(i)))].button.action_label))) != 0)) {
                    sdl_pc = 48;
                    continue;
                } else {
                    sdl_pc = 49;
                    continue;
                }
            },
            48 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            49 => {
                {
                    sdl_pc = 50;
                    continue;
                }
            },
            50 => {
                {
                    sdl_pc = 44;
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
                {
                    sdl_pc = 53;
                    continue;
                }
            },
            53 => {
                if (!SetCoreHints(dbus, &iter, props)) {
                    sdl_pc = 54;
                    continue;
                } else {
                    sdl_pc = 55;
                    continue;
                }
            },
            54 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            55 => {
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            56 => {
                if (!(dbus.*.message_iter_append_basic.?(&iter, @as(c_int, 'i'), @ptrCast(@alignCast(&timeout))) != 0)) {
                    sdl_pc = 57;
                    continue;
                } else {
                    sdl_pc = 58;
                    continue;
                }
            },
            57 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            58 => {
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            59 => {
                dbus.*.error_init.?(&@"error");
                reply = dbus.*.connection_send_with_reply_and_block.?(conn, msg, -@as(c_int, 1), &@"error");
                if (!(reply != null)) {
                    sdl_pc = 60;
                    continue;
                } else {
                    sdl_pc = 61;
                    continue;
                }
            },
            60 => {
                if (@"error".message != null) {
                    sdl_pc = 63;
                    continue;
                } else {
                    sdl_pc = 64;
                    continue;
                }
            },
            61 => {
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            62 => {
                dbus.*.error_free.?(&@"error");
                dbus.*.message_unref.?(msg);
                if (!(dbus.*.message_iter_init.?(reply, &reply_iter) != 0)) {
                    sdl_pc = 66;
                    continue;
                } else {
                    sdl_pc = 67;
                    continue;
                }
            },
            63 => {
                _ = SDL_SetError_REAL("Notification failed: %s", @"error".message);
                error_set = @"true" != 0;
                {
                    sdl_pc = 65;
                    continue;
                }
            },
            64 => {
                {
                    sdl_pc = 65;
                    continue;
                }
            },
            65 => {
                dbus.*.error_free.?(&@"error");
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            66 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            67 => {
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            68 => {
                if (dbus.*.message_iter_get_arg_type.?(&reply_iter) != @as(c_int, 'u')) {
                    sdl_pc = 69;
                    continue;
                } else {
                    sdl_pc = 70;
                    continue;
                }
            },
            69 => {
                dbus.*.message_unref.?(reply);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            70 => {
                {
                    sdl_pc = 71;
                    continue;
                }
            },
            71 => {
                dbus.*.message_iter_get_basic.?(&reply_iter, @ptrCast(@alignCast(&message_id)));
                dbus.*.message_unref.?(reply);
                if (@as(c_ulong, core_id_count) == (@sizeOf(@TypeOf(core_id_list)) / @sizeOf(@TypeOf(core_id_list[@as(c_int, 0)])))) {
                    sdl_pc = 72;
                    continue;
                } else {
                    sdl_pc = 73;
                    continue;
                }
            },
            72 => {
                RemoveIDFromListAtIndex(0);
                {
                    sdl_pc = 74;
                    continue;
                }
            },
            73 => {
                {
                    sdl_pc = 74;
                    continue;
                }
            },
            74 => {
                core_id_list[
                    blk: {
                        const ref = &core_id_count;
                        const tmp = ref.*;
                        ref.* +%= 1;
                        break :blk tmp;
                    }
                ] = message_id;
                return message_id;
            },
            75 => {
                dbus.*.message_unref.?(msg);
                {
                    sdl_pc = 77;
                    continue;
                }
            },
            76 => {
                {
                    sdl_pc = 77;
                    continue;
                }
            },
            77 => {
                if (!error_set) {
                    sdl_pc = 78;
                    continue;
                } else {
                    sdl_pc = 79;
                    continue;
                }
            },
            78 => {
                _ = SDL_SetError_REAL("Failed to dispatch org.freedesktop.Notifications request (Out of memory?)");
                {
                    sdl_pc = 80;
                    continue;
                }
            },
            79 => {
                {
                    sdl_pc = 80;
                    continue;
                }
            },
            80 => {
                return 0;
            },
            else => unreachable,
        }
    }
}
pub fn RemoveCoreNotification(dbus: [*c]SDL_DBusContext, arg_id: SDL_NotificationID) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var id = arg_id;
    _ = &id;
    if (!(id != 0)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("id"))));
    }
    var iter: DBusMessageIter = undefined;
    _ = &iter;
    var ret: bool = @"false" != 0;
    _ = &ret;
    var msg: ?*DBusMessage = dbus.*.message_new_method_call.?("org.freedesktop.Notifications", "/org/freedesktop/Notifications", "org.freedesktop.Notifications", "CloseNotification");
    _ = &msg;
    if (!(msg != null)) {
        return SDL_OutOfMemory_REAL();
    }
    dbus.*.message_iter_init_append.?(msg, &iter);
    if (dbus.*.message_iter_append_basic.?(&iter, @as(c_int, 'u'), @ptrCast(@alignCast(&id))) != 0) {
        ret = dbus.*.connection_send.?(dbus.*.session_conn, msg, null) != 0;
        if (!ret) {
            _ = SDL_SetError_REAL("Failed to send notification removal request");
        }
    } else {
        ret = SDL_OutOfMemory_REAL();
    }
    dbus.*.message_unref.?(msg);
    return ret;
}
pub fn PortalNotificationFilter(_: ?*DBusConnection, msg: ?*DBusMessage, _: ?*anyopaque) callconv(.c) DBusHandlerResult {
    @setEvalBranchQuota(100000);
    var dbus: [*c]SDL_DBusContext = undefined;
    _ = &dbus;
    var signal_iter: DBusMessageIter = undefined;
    _ = &signal_iter;
    var str: [*c]const u8 = undefined;
    _ = &str;
    var id: Uint32 = undefined;
    _ = &id;
    var target: [*c]const u8 = undefined;
    _ = &target;
    var token: [*c]const u8 = undefined;
    _ = &token;
    var param_iter: DBusMessageIter = undefined;
    _ = &param_iter;
    var target_variant: DBusMessageIter = undefined;
    _ = &target_variant;
    var target_string: DBusMessageIter = undefined;
    _ = &target_string;
    var pdata_iter: DBusMessageIter = undefined;
    _ = &pdata_iter;
    var dict_entry_iter: DBusMessageIter = undefined;
    _ = &dict_entry_iter;
    var key: [*c]const u8 = undefined;
    _ = &key;
    var dict_val_iter: DBusMessageIter = undefined;
    _ = &dict_val_iter;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                dbus = SDL_DBus_GetContext();
                if (dbus.*.message_is_signal.?(msg, "org.freedesktop.portal.Notification", "ActionInvoked") != 0) {
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
                str = null;
                if (!(dbus.*.message_iter_init.?(msg, &signal_iter) != 0)) {
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
                if (dbus.*.message_iter_get_arg_type.?(&signal_iter) != @as(c_int, 's')) {
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
                dbus.*.message_iter_get_basic.?(&signal_iter, @ptrCast(@alignCast(&str)));
                if (SDL_strncmp_REAL(str, "SDL_LocalNotification-", @sizeOf(@TypeOf("SDL_LocalNotification-".*)) -% @as(c_ulong, 1)) != @as(c_int, 0)) {
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
                id = @truncate(SDL_strtoul_REAL(str + @sizeOf(@TypeOf("SDL_LocalNotification-".*)), null, 10));
                if (!(id != 0)) {
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
                if (!(dbus.*.message_iter_next.?(&signal_iter) != 0)) {
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
                if (dbus.*.message_iter_get_arg_type.?(&signal_iter) != @as(c_int, 's')) {
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
                dbus.*.message_iter_get_basic.?(&signal_iter, @ptrCast(@alignCast(&str)));
                target = null;
                token = null;
                if ((dbus.*.message_iter_next.?(&signal_iter) != 0) and (@as(dbus_bool_t, @bitCast(@as(c_int, @intFromBool(dbus.*.message_iter_get_arg_type.?(&signal_iter) == @as(c_int, 'a'))))) != 0)) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                dbus.*.message_iter_recurse.?(&signal_iter, &param_iter);
                if (dbus.*.message_iter_get_arg_type.?(&param_iter) == @as(c_int, 'v')) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
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
                if ((target != null) and (SDL_strtoull_REAL(target, null, 10) == @as(c_ulonglong, session_id))) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            26 => {
                dbus.*.message_iter_recurse.?(&param_iter, &target_variant);
                if (dbus.*.message_iter_get_arg_type.?(&target_variant) == @as(c_int, 'v')) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
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
                if (dbus.*.message_iter_get_arg_type.?(&param_iter) == @as(c_int, 'a')) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            29 => {
                dbus.*.message_iter_recurse.?(&target_variant, &target_string);
                if (dbus.*.message_iter_get_arg_type.?(&target_string) == @as(c_int, 's')) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
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
                _ = dbus.*.message_iter_next.?(&param_iter);
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            32 => {
                dbus.*.message_iter_get_basic.?(&target_string, @ptrCast(@alignCast(&target)));
                {
                    sdl_pc = 34;
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
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            35 => {
                dbus.*.message_iter_recurse.?(&param_iter, &pdata_iter);
                {
                    sdl_pc = 38;
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
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            38 => {
                if (dbus.*.message_iter_get_arg_type.?(&pdata_iter) == @as(c_int, 'e')) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 40;
                    continue;
                }
            },
            39 => {
                dbus.*.message_iter_recurse.?(&param_iter, &dict_entry_iter);
                key = null;
                dbus.*.message_iter_get_basic.?(&dict_entry_iter, @ptrCast(@alignCast(&key)));
                if (SDL_strcmp_REAL(key, "activation-token") == @as(c_int, 0)) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
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
                dbus.*.message_iter_recurse.?(&dict_entry_iter, &dict_val_iter);
                if (dbus.*.message_iter_get_arg_type.?(&dict_val_iter) == @as(c_int, 's')) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
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
                _ = dbus.*.message_iter_next.?(&pdata_iter);
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            44 => {
                dbus.*.message_iter_get_basic.?(&dict_val_iter, @ptrCast(@alignCast(&token)));
                {
                    sdl_pc = 46;
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
                    sdl_pc = 40;
                    continue;
                }
            },
            47 => {
                if (token != null) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
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
                    sdl_pc = 4;
                    continue;
                }
            },
            50 => {
                SDL_free_REAL(@ptrCast(@alignCast(activation_token)));
                activation_token = SDL_strdup_REAL(token);
                activation_token_time_ns = SDL_GetTicksNS_REAL();
                {
                    sdl_pc = 52;
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
                _ = SDL_SendNotificationAction(id, str);
                return DBUS_HANDLER_RESULT_HANDLED;
            },
            else => unreachable,
        }
    }
}
pub fn SetPortalImage(dbus: [*c]SDL_DBusContext, iterInit: [*c]DBusMessageIter, surface: [*c]SDL_Surface) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local_fd_string = struct {
        var fd_string: [*c]const u8 = "file-descriptor";
    };
    _ = &static_local_fd_string;
    const static_local_key = struct {
        var key: [*c]const u8 = "icon";
    };
    _ = &static_local_key;
    var options_pair: DBusMessageIter = undefined;
    _ = &options_pair;
    var variant_iter: DBusMessageIter = undefined;
    _ = &variant_iter;
    var struct_iter: DBusMessageIter = undefined;
    _ = &struct_iter;
    var png: ?*SDL_IOStream = undefined;
    _ = &png;
    var fd: c_int = undefined;
    _ = &fd;
    var ret: bool = undefined;
    _ = &ret;
    var size: Sint64 = undefined;
    _ = &size;
    var fd_variant_iter: DBusMessageIter = undefined;
    _ = &fd_variant_iter;
    var array_iter: DBusMessageIter = undefined;
    _ = &array_iter;
    var byte_array_iter: DBusMessageIter = undefined;
    _ = &byte_array_iter;
    var bytes_string: [*c]const u8 = undefined;
    _ = &bytes_string;
    var io_props: SDL_PropertiesID = undefined;
    _ = &io_props;
    var png_ptr: [*c]Uint8 = undefined;
    _ = &png_ptr;
    var i: Sint64 = undefined;
    _ = &i;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                png = null;
                fd = -@as(c_int, 1);
                ret = @"false" != 0;
                if (interface_version >= @as(Uint32, 2)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                _ = SDL_CloseIO_REAL(png);
                return ret;
            },
            2 => {
                fd = memfd_create("SDL_NotificationImage", MFD_ALLOW_SEALING);
                if (fd >= @as(c_int, 0)) {
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
                if (!(png != null)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            5 => {
                png = SDL_IOFromFD(fd, @"true" != 0);
                if (!(png != null)) {
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
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            8 => {
                _ = close(fd);
                fd = -@as(c_int, 1);
                {
                    sdl_pc = 10;
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
                    sdl_pc = 7;
                    continue;
                }
            },
            11 => {
                png = SDL_IOFromDynamicMem_REAL();
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
                if (!(png != null)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                return @"false" != 0;
            },
            15 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                if (!SDL_SavePNG_IO_REAL(surface, png, @"false" != 0)) {
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
                size = SDL_GetIOSize_REAL(png);
                if (!(dbus.*.message_iter_open_container.?(iterInit, @as(c_int, 'e'), null, &options_pair) != 0)) {
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
                if (!(dbus.*.message_iter_append_basic.?(&options_pair, @as(c_int, 's'), @ptrCast(@alignCast(&static_local_key.key))) != 0)) {
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
                if (fd >= @as(c_int, 0)) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            26 => {
                if (!(dbus.*.message_iter_open_container.?(&options_pair, @as(c_int, 'v'), "(sv)", &variant_iter) != 0)) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            27 => {
                bytes_string = "bytes";
                io_props = SDL_GetIOProperties_REAL(png);
                png_ptr = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(io_props, "SDL.iostream.dynamic.memory", null)));
                if (!(dbus.*.message_iter_open_container.?(&options_pair, @as(c_int, 'v'), "(sv)", &variant_iter) != 0)) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 54;
                    continue;
                }
            },
            28 => {
                ret = dbus.*.message_iter_close_container.?(iterInit, &options_pair) != 0;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            29 => {
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
                if (!(dbus.*.message_iter_open_container.?(&variant_iter, @as(c_int, 'r'), null, &struct_iter) != 0)) {
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
                if (!(dbus.*.message_iter_append_basic.?(&struct_iter, @as(c_int, 's'), @ptrCast(@alignCast(&static_local_fd_string.fd_string))) != 0)) {
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
                if (!(dbus.*.message_iter_open_container.?(&struct_iter, @as(c_int, 'v'), "h", &fd_variant_iter) != 0)) {
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
                if (!(dbus.*.message_iter_append_basic.?(&fd_variant_iter, @as(c_int, 'h'), @ptrCast(@alignCast(&fd))) != 0)) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
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
                if (!(dbus.*.message_iter_close_container.?(&struct_iter, &fd_variant_iter) != 0)) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
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
                if (!(dbus.*.message_iter_close_container.?(&variant_iter, &struct_iter) != 0)) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
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
                if (!(dbus.*.message_iter_close_container.?(&options_pair, &variant_iter) != 0)) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
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
                {
                    sdl_pc = 28;
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
                if (!(dbus.*.message_iter_open_container.?(&variant_iter, @as(c_int, 'r'), null, &struct_iter) != 0)) {
                    sdl_pc = 56;
                    continue;
                } else {
                    sdl_pc = 57;
                    continue;
                }
            },
            56 => {
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
                if (!(dbus.*.message_iter_append_basic.?(&struct_iter, @as(c_int, 's'), @ptrCast(@alignCast(&bytes_string))) != 0)) {
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
                if (!(dbus.*.message_iter_open_container.?(&struct_iter, @as(c_int, 'v'), "ay", &byte_array_iter) != 0)) {
                    sdl_pc = 62;
                    continue;
                } else {
                    sdl_pc = 63;
                    continue;
                }
            },
            62 => {
                {
                    sdl_pc = 1;
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
                if (!(dbus.*.message_iter_open_container.?(&byte_array_iter, @as(c_int, 'a'), "y", &array_iter) != 0)) {
                    sdl_pc = 65;
                    continue;
                } else {
                    sdl_pc = 66;
                    continue;
                }
            },
            65 => {
                {
                    sdl_pc = 1;
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
                i = 0;
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            68 => {
                if (i < size) {
                    sdl_pc = 69;
                    continue;
                } else {
                    sdl_pc = 71;
                    continue;
                }
            },
            69 => {
                if (!(dbus.*.message_iter_append_basic.?(&array_iter, @as(c_int, 'y'), @ptrCast(@alignCast(&png_ptr[@bitCast(@as(isize, @intCast(i)))]))) != 0)) {
                    sdl_pc = 72;
                    continue;
                } else {
                    sdl_pc = 73;
                    continue;
                }
            },
            70 => {
                i += 1;
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            71 => {
                if (!(dbus.*.message_iter_close_container.?(&byte_array_iter, &array_iter) != 0)) {
                    sdl_pc = 75;
                    continue;
                } else {
                    sdl_pc = 76;
                    continue;
                }
            },
            72 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            73 => {
                {
                    sdl_pc = 74;
                    continue;
                }
            },
            74 => {
                {
                    sdl_pc = 70;
                    continue;
                }
            },
            75 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            76 => {
                {
                    sdl_pc = 77;
                    continue;
                }
            },
            77 => {
                if (!(dbus.*.message_iter_close_container.?(&struct_iter, &byte_array_iter) != 0)) {
                    sdl_pc = 78;
                    continue;
                } else {
                    sdl_pc = 79;
                    continue;
                }
            },
            78 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            79 => {
                {
                    sdl_pc = 80;
                    continue;
                }
            },
            80 => {
                if (!(dbus.*.message_iter_close_container.?(&variant_iter, &struct_iter) != 0)) {
                    sdl_pc = 81;
                    continue;
                } else {
                    sdl_pc = 82;
                    continue;
                }
            },
            81 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            82 => {
                {
                    sdl_pc = 83;
                    continue;
                }
            },
            83 => {
                if (!(dbus.*.message_iter_close_container.?(&options_pair, &variant_iter) != 0)) {
                    sdl_pc = 84;
                    continue;
                } else {
                    sdl_pc = 85;
                    continue;
                }
            },
            84 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            85 => {
                {
                    sdl_pc = 86;
                    continue;
                }
            },
            86 => {
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn SetFileSize(fd: c_int, size: off_t) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var set: sigset_t = undefined;
    _ = &set;
    var old_set: sigset_t = undefined;
    _ = &old_set;
    var ret: c_int = undefined;
    _ = &ret;
    _ = sigemptyset(&set);
    _ = sigaddset(&set, SIGALRM);
    _ = sigprocmask(SIG_BLOCK, &set, &old_set);
    while (true) {
        ret = posix_fallocate(fd, 0, size);
        if (!(ret == EINTR)) break;
    }
    _ = sigprocmask(SIG_SETMASK, &old_set, null);
    if (ret == @as(c_int, 0)) {
        return @"true" != 0;
    } else if ((ret != EINVAL) and (__errno_location().* != EOPNOTSUPP)) {
        return @"false" != 0;
    }
    if (ftruncate(fd, size) < @as(c_int, 0)) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn SetPortalSound(dbus: [*c]SDL_DBusContext, iterInit: [*c]DBusMessageIter, sound: [*c]const u8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local_key = struct {
        var key: [*c]const u8 = "sound";
    };
    _ = &static_local_key;
    var ret: bool = undefined;
    _ = &ret;
    const static_local_fd_string = struct {
        var fd_string: [*c]const u8 = "file-descriptor";
    };
    _ = &static_local_fd_string;
    var options_pair: DBusMessageIter = undefined;
    _ = &options_pair;
    var variant_iter: DBusMessageIter = undefined;
    _ = &variant_iter;
    var struct_iter: DBusMessageIter = undefined;
    _ = &struct_iter;
    var fd_variant_iter: DBusMessageIter = undefined;
    _ = &fd_variant_iter;
    var st: struct_stat = undefined;
    _ = &st;
    var mem_fd: c_int = undefined;
    _ = &mem_fd;
    var read_fd: c_int = undefined;
    _ = &read_fd;
    var data: ?*anyopaque = undefined;
    _ = &data;
    var res: isize = undefined;
    _ = &res;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                ret = @"true" != 0;
                if (SDL_strcmp_REAL(sound, "default") == @as(c_int, 0)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                if (mem_fd >= @as(c_int, 0)) {
                    sdl_pc = 56;
                    continue;
                } else {
                    sdl_pc = 57;
                    continue;
                }
            },
            2 => {
                return AppendStringOption(dbus, iterInit, static_local_key.key, "default");
            },
            3 => {
                if (SDL_strcmp_REAL(sound, "silent") == @as(c_int, 0)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            4 => {
                mem_fd = -@as(c_int, 1);
                ret = @"false" != 0;
                if (stat(sound, &st) != @as(c_int, 0)) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            5 => {
                return @"true" != 0;
            },
            6 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            8 => {
                SDL_LogError_REAL(SDL_LOG_CATEGORY_APPLICATION, "Notification sound file '%s' not found", sound);
                return AppendStringOption(dbus, iterInit, static_local_key.key, "default");
            },
            9 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                read_fd = open(sound, O_RDONLY | __O_CLOEXEC);
                if (read_fd >= @as(c_int, 0)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                mem_fd = memfd_create(sound, MFD_ALLOW_SEALING | MFD_CLOEXEC);
                if (mem_fd < @as(c_int, 0)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            12 => {
                SDL_LogError_REAL(SDL_LOG_CATEGORY_APPLICATION, "Notification sound file '%s' cannot be opened; check file permissions", sound);
                return AppendStringOption(dbus, iterInit, static_local_key.key, "default");
            },
            13 => {
                if (!SetFileSize(mem_fd, st.st_size)) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            14 => {
                _ = close(read_fd);
                return @"false" != 0;
            },
            15 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            17 => {
                return @"false" != 0;
            },
            18 => {
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            19 => {
                data = mmap(null, @bitCast(@as(c_long, st.st_size)), PROT_READ | PROT_WRITE, MAP_SHARED, mem_fd, 0);
                if (data == @as(?*anyopaque, @ptrFromInt(@as(usize, @intCast(__helpers.cast(usize, @as(isize, -@as(c_int, 1)))))))) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                _ = close(read_fd);
                _ = close(mem_fd);
                return @"false" != 0;
            },
            21 => {
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            22 => {
                res = read(read_fd, data, @bitCast(@as(c_long, st.st_size)));
                _ = munmap(data, @bitCast(@as(c_long, st.st_size)));
                _ = close(read_fd);
                if (res != st.st_size) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                _ = close(mem_fd);
                return @"false" != 0;
            },
            24 => {
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            25 => {
                if (!(dbus.*.message_iter_open_container.?(iterInit, @as(c_int, 'e'), null, &options_pair) != 0)) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
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
                if (!(dbus.*.message_iter_append_basic.?(&options_pair, @as(c_int, 's'), @ptrCast(@alignCast(&static_local_key.key))) != 0)) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            29 => {
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
                if (!(dbus.*.message_iter_open_container.?(&options_pair, @as(c_int, 'v'), "(sv)", &variant_iter) != 0)) {
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
                if (!(dbus.*.message_iter_open_container.?(&variant_iter, @as(c_int, 'r'), null, &struct_iter) != 0)) {
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
                if (!(dbus.*.message_iter_append_basic.?(&struct_iter, @as(c_int, 's'), @ptrCast(@alignCast(&static_local_fd_string.fd_string))) != 0)) {
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
                if (!(dbus.*.message_iter_open_container.?(&struct_iter, @as(c_int, 'v'), "h", &fd_variant_iter) != 0)) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
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
                if (!(dbus.*.message_iter_append_basic.?(&fd_variant_iter, @as(c_int, 'h'), @ptrCast(@alignCast(&mem_fd))) != 0)) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
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
                if (!(dbus.*.message_iter_close_container.?(&struct_iter, &fd_variant_iter) != 0)) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
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
                if (!(dbus.*.message_iter_close_container.?(&variant_iter, &struct_iter) != 0)) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
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
                if (!(dbus.*.message_iter_close_container.?(&options_pair, &variant_iter) != 0)) {
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
                ret = dbus.*.message_iter_close_container.?(iterInit, &options_pair) != 0;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            56 => {
                _ = close(mem_fd);
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
                return ret;
            },
            else => unreachable,
        }
    }
}
pub fn AddPortalActions(dbus: [*c]SDL_DBusContext, iterInit: [*c]DBusMessageIter, actions: [*c]const SDL_NotificationAction, num_actions: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var options_pair: DBusMessageIter = undefined;
    _ = &options_pair;
    var options_value: DBusMessageIter = undefined;
    _ = &options_value;
    var button_array: DBusMessageIter = undefined;
    _ = &button_array;
    var properties_array: DBusMessageIter = undefined;
    _ = &properties_array;
    var key: [*c]const u8 = "buttons";
    _ = &key;
    if (!(dbus.*.message_iter_open_container.?(iterInit, @as(c_int, 'e'), null, &options_pair) != 0)) {
        return @"false" != 0;
    }
    if (!(dbus.*.message_iter_append_basic.?(&options_pair, @as(c_int, 's'), @ptrCast(@alignCast(&key))) != 0)) {
        return @"false" != 0;
    }
    if (!(dbus.*.message_iter_open_container.?(&options_pair, @as(c_int, 'v'), "aa{sv}", &options_value) != 0)) {
        return @"false" != 0;
    }
    if (!(dbus.*.message_iter_open_container.?(&options_value, @as(c_int, 'a'), "a{sv}", &button_array) != 0)) {
        return @"false" != 0;
    }
    {
        var i: c_int = 0;
        _ = &i;
        while (i < num_actions) : (i += 1) {
            if (actions[@bitCast(@as(isize, @intCast(i)))].type == @as(SDL_NotificationActionType, SDL_NOTIFICATION_ACTION_TYPE_BUTTON)) {
                if (!(dbus.*.message_iter_open_container.?(&button_array, @as(c_int, 'a'), "{sv}", &properties_array) != 0)) {
                    return @"false" != 0;
                }
                if (!AppendStringOption(dbus, &properties_array, "action", actions[@bitCast(@as(isize, @intCast(i)))].button.action_id)) {
                    return @"false" != 0;
                }
                if (!AppendStringOption(dbus, &properties_array, "label", actions[@bitCast(@as(isize, @intCast(i)))].button.action_label)) {
                    return @"false" != 0;
                }
                if (!AppendTargetString(dbus, &properties_array, "target")) {
                    return @"false" != 0;
                }
                if (!(dbus.*.message_iter_close_container.?(&button_array, &properties_array) != 0)) {
                    return @"false" != 0;
                }
            }
        }
    }
    if (!(dbus.*.message_iter_close_container.?(&options_value, &button_array) != 0)) {
        return @"false" != 0;
    }
    if (!(dbus.*.message_iter_close_container.?(&options_pair, &options_value) != 0)) {
        return @"false" != 0;
    }
    if (!(dbus.*.message_iter_close_container.?(iterInit, &options_pair) != 0)) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn SetPortalDisplayHints(dbus: [*c]SDL_DBusContext, iterInit: [*c]DBusMessageIter, props: SDL_PropertiesID) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var options_pair: DBusMessageIter = undefined;
    _ = &options_pair;
    var options_value: DBusMessageIter = undefined;
    _ = &options_value;
    var var_struct: DBusMessageIter = undefined;
    _ = &var_struct;
    var string_array: DBusMessageIter = undefined;
    _ = &string_array;
    var key: [*c]const u8 = "display-hint";
    _ = &key;
    const transient: bool = SDL_GetBooleanProperty_REAL(props, "SDL.notification.transient", @"false" != 0);
    _ = &transient;
    if (!(dbus.*.message_iter_open_container.?(iterInit, @as(c_int, 'e'), null, &options_pair) != 0)) {
        return @"false" != 0;
    }
    if (!(dbus.*.message_iter_append_basic.?(&options_pair, @as(c_int, 's'), @ptrCast(@alignCast(&key))) != 0)) {
        return @"false" != 0;
    }
    if (!(dbus.*.message_iter_open_container.?(&options_pair, @as(c_int, 'v'), "(as)", &options_value) != 0)) {
        return @"false" != 0;
    }
    if (!(dbus.*.message_iter_open_container.?(&options_value, @as(c_int, 'r'), null, &var_struct) != 0)) {
        return @"false" != 0;
    }
    if (!(dbus.*.message_iter_open_container.?(&var_struct, @as(c_int, 'a'), "s", &string_array) != 0)) {
        return @"false" != 0;
    }
    if (transient) {
        var val: [*c]const u8 = "transient";
        _ = &val;
        if (!(dbus.*.message_iter_append_basic.?(&string_array, @as(c_int, 's'), @ptrCast(@alignCast(&val))) != 0)) {
            return @"false" != 0;
        }
    }
    if (!(dbus.*.message_iter_close_container.?(&var_struct, &string_array) != 0)) {
        return @"false" != 0;
    }
    if (!(dbus.*.message_iter_close_container.?(&options_value, &var_struct) != 0)) {
        return @"false" != 0;
    }
    if (!(dbus.*.message_iter_close_container.?(&options_pair, &options_value) != 0)) {
        return @"false" != 0;
    }
    return dbus.*.message_iter_close_container.?(iterInit, &options_pair) != 0;
}
pub fn InitPortalSignalListener(dbus: [*c]SDL_DBusContext) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local_interface_unavailable = struct {
        var interface_unavailable: bool = @"false" != 0;
    };
    _ = &static_local_interface_unavailable;
    if (static_local_interface_unavailable.interface_unavailable) {
        return @"false" != 0;
    }
    if (!SDL_DBus_QueryProperty(null, "org.freedesktop.portal.Desktop", "/org/freedesktop/portal/desktop", "org.freedesktop.portal.Notification", "version", @as(c_int, 'u'), @ptrCast(@alignCast(&interface_version)))) {
        static_local_interface_unavailable.interface_unavailable = @"true" != 0;
        return @"false" != 0;
    }
    if (!(session_id != 0)) {
        GetRandom(@ptrCast(@alignCast(&session_id)), @sizeOf(@TypeOf(session_id)));
    }
    var @"error": DBusError = undefined;
    _ = &@"error";
    dbus.*.error_init.?(&@"error");
    dbus.*.bus_add_match.?(dbus.*.session_conn, "type='signal', interface='org.freedesktop.portal.Notification',member='ActionInvoked'", &@"error");
    if (dbus.*.error_is_set.?(&@"error") != 0) {
        SDL_LogDebug_REAL(SDL_LOG_CATEGORY_APPLICATION, "Failed to register DBus portal notification filter: %s", @"error".message);
        dbus.*.error_free.?(&@"error");
        return @"false" != 0;
    }
    dbus.*.error_free.?(&@"error");
    if (dbus.*.connection_add_filter.?(dbus.*.session_conn, &PortalNotificationFilter, null, null) != 0) {
        dbus.*.connection_flush.?(dbus.*.session_conn);
        SDL_LogDebug_REAL(SDL_LOG_CATEGORY_APPLICATION, "Registered DBus portal notification filter");
    } else {
        dbus.*.bus_remove_match.?(dbus.*.session_conn, "type='signal', interface='org.freedesktop.portal.Notification',member='ActionInvoked'", null);
        return @"false" != 0;
    }
    portal_interface_initialized = @"true" != 0;
    return @"true" != 0;
}
pub fn ShowPortalNotification(dbus: [*c]SDL_DBusContext, props: SDL_PropertiesID) callconv(.c) SDL_NotificationID {
    @setEvalBranchQuota(100000);
    var conn: ?*DBusConnection = undefined;
    _ = &conn;
    var msg: ?*DBusMessage = undefined;
    _ = &msg;
    var iter: DBusMessageIter = undefined;
    _ = &iter;
    var array: DBusMessageIter = undefined;
    _ = &array;
    var error_set: bool = undefined;
    _ = &error_set;
    var replaces: SDL_PropertiesID = undefined;
    _ = &replaces;
    var title: [*c]const u8 = undefined;
    _ = &title;
    var message: [*c]const u8 = undefined;
    _ = &message;
    var sound: [*c]const u8 = undefined;
    _ = &sound;
    var priority: SDL_NotificationPriority = undefined;
    _ = &priority;
    var image: [*c]SDL_Surface = undefined;
    _ = &image;
    var actions: [*c]const SDL_NotificationAction = undefined;
    _ = &actions;
    var num_actions: c_int = undefined;
    _ = &num_actions;
    var new_id: Uint32 = undefined;
    _ = &new_id;
    var id_str: [128]u8 = undefined;
    _ = &id_str;
    var id: [*c]const u8 = undefined;
    _ = &id;
    var priority_str: [*c]const u8 = undefined;
    _ = &priority_str;
    var image_surface: [*c]SDL_Surface = undefined;
    _ = &image_surface;
    var res: bool = undefined;
    _ = &res;
    var err: DBusError = undefined;
    _ = &err;
    var reply: ?*DBusMessage = undefined;
    _ = &reply;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                conn = dbus.*.session_conn;
                msg = null;
                error_set = @"false" != 0;
                replaces = @bitCast(@as(c_int, @truncate(SDL_GetNumberProperty_REAL(props, "SDL.notification.replaces", 0))));
                title = SDL_GetStringProperty_REAL(props, "SDL.notification.title", null);
                message = SDL_GetStringProperty_REAL(props, "SDL.notification.message", null);
                sound = SDL_GetStringProperty_REAL(props, "SDL.notification.sound", "default");
                priority = @truncate(SDL_GetNumberProperty_REAL(props, "SDL.notification.priority", SDL_NOTIFICATION_PRIORITY_NORMAL));
                image = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(props, "SDL.notification.image", null)));
                actions = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(props, "SDL.notification.actions", null)));
                num_actions = @truncate(SDL_GetNumberProperty_REAL(props, "SDL.notification.action_count", 0));
                msg = dbus.*.message_new_method_call.?("org.freedesktop.portal.Desktop", "/org/freedesktop/portal/desktop", "org.freedesktop.portal.Notification", "AddNotification");
                if (@as(?*anyopaque, @ptrCast(@alignCast(msg))) == @as(?*anyopaque, null)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                if (msg != null) {
                    sdl_pc = 62;
                    continue;
                } else {
                    sdl_pc = 63;
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
                dbus.*.message_iter_init_append.?(msg, &iter);
                new_id = 0;
                if (!(replaces != 0)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                GetRandom(@ptrCast(@alignCast(&new_id)), @sizeOf(@TypeOf(new_id)));
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            6 => {
                new_id = replaces;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&id_str)), @sizeOf(@TypeOf(id_str)) / @sizeOf(@TypeOf(id_str[@as(c_int, 0)])), "SDL_LocalNotification-%u", new_id);
                id = @ptrCast(@alignCast(&id_str));
                _ = dbus.*.message_iter_append_basic.?(&iter, @as(c_int, 's'), @ptrCast(@alignCast(&id)));
                _ = dbus.*.message_iter_open_container.?(&iter, @as(c_int, 'a'), "{sv}", &array);
                if (!AppendStringOption(dbus, &array, "title", title)) {
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
                if (!AppendStringOption(dbus, &array, "body", message)) {
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
                if (!AppendStringOption(dbus, &array, "default-action", "default")) {
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
                if (!AppendTargetString(dbus, &array, "default-action-target")) {
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
                if (!SetPortalSound(dbus, &array, sound)) {
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
                switch (priority) {
                    SDL_NOTIFICATION_PRIORITY_NORMAL => {
                        sdl_pc = 24;
                        continue;
                    },
                    SDL_NOTIFICATION_PRIORITY_LOW => {
                        sdl_pc = 26;
                        continue;
                    },
                    SDL_NOTIFICATION_PRIORITY_HIGH => {
                        sdl_pc = 27;
                        continue;
                    },
                    SDL_NOTIFICATION_PRIORITY_CRITICAL => {
                        sdl_pc = 28;
                        continue;
                    },
                    else => {
                        sdl_pc = 25;
                        continue;
                    },
                }
            },
            23 => {
                if (!AppendStringOption(dbus, &array, "priority", priority_str)) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
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
                priority_str = "normal";
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            26 => {
                priority_str = "low";
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            27 => {
                priority_str = "high";
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            28 => {
                priority_str = "urgent";
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            29 => {
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
                if (!SetPortalDisplayHints(dbus, &array, props)) {
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
                if (image != null) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            35 => {
                image_surface = image;
                if (image_surface.*.format != @as(SDL_PixelFormat, SDL_PIXELFORMAT_ABGR8888)) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
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
                if ((actions != null) and (num_actions != 0)) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            38 => {
                image_surface = SDL_ConvertSurface_REAL(image_surface, SDL_PIXELFORMAT_ABGR8888);
                {
                    sdl_pc = 40;
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
                res = SetPortalImage(dbus, &array, image_surface);
                if (image_surface != image) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            41 => {
                SDL_DestroySurface_REAL(image_surface);
                {
                    sdl_pc = 43;
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
                if (!res) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
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
                    sdl_pc = 37;
                    continue;
                }
            },
            47 => {
                if (!AddPortalActions(dbus, &array, actions, num_actions)) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
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
                if (!(dbus.*.message_iter_close_container.?(&iter, &array) != 0)) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 54;
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
                {
                    sdl_pc = 49;
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
                dbus.*.error_init.?(&err);
                reply = dbus.*.connection_send_with_reply_and_block.?(conn, msg, -@as(c_int, 1), &err);
                dbus.*.message_unref.?(msg);
                if (!(reply != null)) {
                    sdl_pc = 56;
                    continue;
                } else {
                    sdl_pc = 57;
                    continue;
                }
            },
            56 => {
                if (err.message != null) {
                    sdl_pc = 59;
                    continue;
                } else {
                    sdl_pc = 60;
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
                dbus.*.message_unref.?(reply);
                return new_id;
            },
            59 => {
                _ = SDL_SetError_REAL("Notification failed: %s", err.message);
                error_set = @"true" != 0;
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
                dbus.*.message_unref.?(reply);
                dbus.*.error_free.?(&err);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            62 => {
                dbus.*.message_unref.?(msg);
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
                if (!error_set) {
                    sdl_pc = 65;
                    continue;
                } else {
                    sdl_pc = 66;
                    continue;
                }
            },
            65 => {
                _ = SDL_SetError_REAL("Failed to dispatch org.freedesktop.portal.Notification request (Out of memory?)");
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
                return 0;
            },
            else => unreachable,
        }
    }
}
pub fn RemovePortalNotification(dbus: [*c]SDL_DBusContext, id: SDL_NotificationID) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (!(id != 0)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("id"))));
    }
    var id_str: [128]u8 = undefined;
    _ = &id_str;
    var iter: DBusMessageIter = undefined;
    _ = &iter;
    var ret: bool = @"false" != 0;
    _ = &ret;
    var msg: ?*DBusMessage = dbus.*.message_new_method_call.?("org.freedesktop.portal.Desktop", "/org/freedesktop/portal/desktop", "org.freedesktop.portal.Notification", "RemoveNotification");
    _ = &msg;
    if (@as(?*anyopaque, @ptrCast(@alignCast(msg))) == @as(?*anyopaque, null)) {
        return SDL_OutOfMemory_REAL();
    }
    dbus.*.message_iter_init_append.?(msg, &iter);
    _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&id_str)), @sizeOf(@TypeOf(id_str)) / @sizeOf(@TypeOf(id_str[@as(c_int, 0)])), "SDL_LocalNotification-%u", id);
    var cstr: [*c]const u8 = @ptrCast(@alignCast(&id_str));
    _ = &cstr;
    if (dbus.*.message_iter_append_basic.?(&iter, @as(c_int, 's'), @ptrCast(@alignCast(&cstr))) != 0) {
        ret = dbus.*.connection_send.?(dbus.*.session_conn, msg, null) != 0;
        if (!ret) {
            _ = SDL_SetError_REAL("Failed to send notification removal request");
        }
    } else {
        ret = SDL_OutOfMemory_REAL();
    }
    dbus.*.message_unref.?(msg);
    return ret;
}
pub fn CheckInitNotifications(dbus: [*c]SDL_DBusContext) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ret: bool = @"false" != 0;
    _ = &ret;
    if (!(dbus != null) or !(dbus.*.session_conn != null)) {
        return SDL_SetError_REAL("D-Bus not available");
    }
    if (core_interface_initialized or portal_interface_initialized) {
        return @"true" != 0;
    }
    if (SDL_GetSandbox_REAL() != @as(SDL_Sandbox, SDL_SANDBOX_NONE)) {
        ret = InitPortalSignalListener(dbus);
        if (!ret) {
            ret = InitCoreSignalListener(dbus);
        }
    } else {
        ret = InitCoreSignalListener(dbus);
        if (!ret) {
            ret = InitPortalSignalListener(dbus);
        }
    }
    return (if (ret) @as(c_int, @intFromBool(ret)) else @as(c_int, @intFromBool(SDL_SetError_REAL("Notification interface not available")))) != 0;
}
pub export fn SDL_SYS_ShowNotification(props: SDL_PropertiesID) SDL_NotificationID {
    @setEvalBranchQuota(100000);
    var dbus: [*c]SDL_DBusContext = SDL_DBus_GetContext();
    _ = &dbus;
    if (!CheckInitNotifications(dbus)) {
        return 0;
    }
    if (portal_interface_initialized) {
        return ShowPortalNotification(dbus, props);
    } else if (core_interface_initialized) {
        return ShowCoreNotification(dbus, props);
    }
    return 0;
}
pub export fn SDL_RemoveNotification_REAL(notification: SDL_NotificationID) bool {
    @setEvalBranchQuota(100000);
    var dbus: [*c]SDL_DBusContext = SDL_DBus_GetContext();
    _ = &dbus;
    if (!CheckInitNotifications(dbus)) {
        return @"false" != 0;
    }
    if (portal_interface_initialized) {
        return RemovePortalNotification(dbus, notification);
    } else if (core_interface_initialized) {
        return RemoveCoreNotification(dbus, notification);
    }
    return @"false" != 0;
}
pub export fn SDL_CleanupNotifications() void {
    @setEvalBranchQuota(100000);
    var dbus: [*c]SDL_DBusContext = SDL_DBus_GetContext();
    _ = &dbus;
    if ((dbus != null) and (dbus.*.session_conn != null)) {
        var conn: ?*DBusConnection = dbus.*.session_conn;
        _ = &conn;
        if (portal_interface_initialized) {
            _ = dbus.*.connection_remove_filter.?(conn, &PortalNotificationFilter, null);
            dbus.*.bus_remove_match.?(conn, "type='signal', interface='org.freedesktop.portal.Notification',member='ActionInvoked'", null);
        }
        if (core_interface_initialized) {
            _ = dbus.*.connection_remove_filter.?(conn, &CoreNotificationFilter, null);
            dbus.*.bus_remove_match.?(dbus.*.session_conn, "type='signal', interface='org.freedesktop.Notifications',member='ActionInvoked'", null);
            dbus.*.bus_remove_match.?(dbus.*.session_conn, "type='signal', interface='org.freedesktop.Notifications',member='NotificationClosed'", null);
            dbus.*.bus_remove_match.?(dbus.*.session_conn, "type='signal', interface='org.freedesktop.Notifications',member='ActivationToken'", null);
        }
        dbus.*.connection_flush.?(conn);
        portal_interface_initialized = @"false" != 0;
        core_interface_initialized = @"false" != 0;
    }
    SDL_free_REAL(@ptrCast(@alignCast(icon_uri)));
    icon_uri = null;
    SDL_free_REAL(@ptrCast(@alignCast(activation_token)));
    activation_token = null;
}
pub export fn SDL_RequestNotificationPermission_REAL() bool {
    @setEvalBranchQuota(100000);
    var dbus: [*c]SDL_DBusContext = SDL_DBus_GetContext();
    _ = &dbus;
    return CheckInitNotifications(dbus);
}
pub export fn SDL_GetNotificationActivationToken() [*c]const u8 {
    @setEvalBranchQuota(100000);
    if ((activation_token != null) and (@as(c_ulonglong, SDL_GetTicksNS_REAL() -% activation_token_time_ns) < (@as(c_ulonglong, @as(Uint64, @bitCast(@as(c_long, @as(c_int, 1))))) *% @as(c_ulonglong, SDL_NS_PER_SECOND)))) {
        activation_token_time_ns = 0;
        return activation_token;
    }
    return null;
}

pub const SDL_RequestNotificationPermission = SDL_RequestNotificationPermission_REAL;
pub const SDL_RemoveNotification = SDL_RemoveNotification_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_NS_PER_SECOND = @as(c_longlong, 1000000000);
pub const EINTR = @as(c_int, 4);
pub const EINVAL = @as(c_int, 22);
pub const EOPNOTSUPP = @as(c_int, 95);
pub const O_RDONLY = @as(c_int, 0o0);
pub const __O_CLOEXEC = __helpers.promoteIntLiteral(c_int, 0o2000000, .octal);
pub const SIGALRM = @as(c_int, 14);
pub const SIG_BLOCK = @as(c_int, 0);
pub const SIG_SETMASK = @as(c_int, 2);
pub const PROT_READ = @as(c_int, 0x1);
pub const PROT_WRITE = @as(c_int, 0x2);
pub const MAP_SHARED = @as(c_int, 0x01);
pub const MFD_CLOEXEC = @as(c_uint, 1);
pub const MFD_ALLOW_SEALING = @as(c_uint, 2);
