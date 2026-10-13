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
pub const __pid_t = c_int;
pub const struct___va_list_tag_2 = extern struct {
    unnamed_0: c_uint = 0,
    unnamed_1: c_uint = 0,
    unnamed_2: ?*anyopaque = null,
    unnamed_3: ?*anyopaque = null,
};
pub extern fn free(__ptr: ?*anyopaque) void;
pub const Uint8 = u8;
pub const Sint32 = i32;
pub const Uint32 = u32;
pub const Uint64 = u64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_asprintf_REAL(strp: [*c][*c]u8, fmt: [*c]const u8, ...) c_int;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_PropertiesID = Uint32;
pub extern fn SDL_GetPointerProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: ?*anyopaque) ?*anyopaque;
pub extern fn SDL_GetStringProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: [*c]const u8) [*c]const u8;
pub const SDL_PIXELFORMAT_ARGB32: c_int = 377888772;
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
pub extern fn SDL_ConvertSurface_REAL(surface: [*c]SDL_Surface, format: SDL_PixelFormat) [*c]SDL_Surface;
pub const SDL_SANDBOX_FLATPAK: c_int = 2;
pub const enum_SDL_Sandbox = c_uint;
pub const SDL_Sandbox = enum_SDL_Sandbox;
pub extern fn SDL_GetSandbox_REAL() SDL_Sandbox;
pub extern fn SDL_DelayNS_REAL(ns: Uint64) void;
pub const SDL_Tray = struct_SDL_Tray;
pub const struct_SDL_TrayEntry = extern struct {
    parent: [*c]SDL_TrayMenu = null,
    internal: ?*anyopaque = null,
};
pub const SDL_TrayEntry = struct_SDL_TrayEntry;
pub const struct_SDL_TrayMenu = extern struct {
    parent_tray: [*c]SDL_Tray = null,
    parent_entry: [*c]SDL_TrayEntry = null,
    internal: ?*anyopaque = null,
};
pub const SDL_TrayMenu = struct_SDL_TrayMenu;
pub const SDL_TrayEntryFlags = Uint32;
pub const SDL_TrayCallback = ?*const fn (userdata: ?*anyopaque, entry: [*c]SDL_TrayEntry) callconv(.c) void;
pub const struct_SDL_TrayDriver = extern struct {
    name: [*c]const u8 = null,
    count: c_uint = 0,
    CreateTray: ?*const fn ([*c]struct_SDL_TrayDriver, SDL_PropertiesID) callconv(.c) [*c]SDL_Tray = null,
    DestroyTray: ?*const fn ([*c]SDL_Tray) callconv(.c) void = null,
    UpdateTray: ?*const fn ([*c]SDL_Tray) callconv(.c) void = null,
    SetTrayIcon: ?*const fn ([*c]SDL_Tray, [*c]SDL_Surface) callconv(.c) void = null,
    SetTrayTooltip: ?*const fn ([*c]SDL_Tray, [*c]const u8) callconv(.c) void = null,
    CreateTrayMenu: ?*const fn ([*c]SDL_Tray) callconv(.c) [*c]SDL_TrayMenu = null,
    InsertTrayEntryAt: ?*const fn ([*c]SDL_TrayMenu, c_int, [*c]const u8, SDL_TrayEntryFlags) callconv(.c) [*c]SDL_TrayEntry = null,
    CreateTraySubmenu: ?*const fn ([*c]SDL_TrayEntry) callconv(.c) [*c]SDL_TrayMenu = null,
    GetTraySubmenu: ?*const fn ([*c]SDL_TrayEntry) callconv(.c) [*c]SDL_TrayMenu = null,
    GetTrayEntries: ?*const fn ([*c]SDL_TrayMenu, [*c]c_int) callconv(.c) [*c][*c]SDL_TrayEntry = null,
    RemoveTrayEntry: ?*const fn ([*c]SDL_TrayEntry) callconv(.c) void = null,
    SetTrayEntryLabel: ?*const fn ([*c]SDL_TrayEntry, [*c]const u8) callconv(.c) void = null,
    GetTrayEntryLabel: ?*const fn ([*c]SDL_TrayEntry) callconv(.c) [*c]const u8 = null,
    SetTrayEntryChecked: ?*const fn ([*c]SDL_TrayEntry, bool) callconv(.c) void = null,
    ClickTrayEntry: ?*const fn ([*c]SDL_TrayEntry) callconv(.c) void = null,
    GetTrayEntryChecked: ?*const fn ([*c]SDL_TrayEntry) callconv(.c) bool = null,
    SetTrayEntryEnabled: ?*const fn ([*c]SDL_TrayEntry, bool) callconv(.c) void = null,
    GetTrayEntryEnabled: ?*const fn ([*c]SDL_TrayEntry) callconv(.c) bool = null,
    SetTrayEntryCallback: ?*const fn ([*c]SDL_TrayEntry, SDL_TrayCallback, ?*anyopaque) callconv(.c) void = null,
    DestroyDriver: ?*const fn ([*c]struct_SDL_TrayDriver) callconv(.c) void = null,
    internal: ?*anyopaque = null,
};
pub const SDL_TrayDriver = struct_SDL_TrayDriver;
pub const struct_SDL_Tray = extern struct {
    driver: [*c]SDL_TrayDriver = null,
    menu: [*c]SDL_TrayMenu = null,
    internal: ?*anyopaque = null,
};
pub const SDL_TrayClickCallback = ?*const fn (userdata: ?*anyopaque, tray: [*c]SDL_Tray) callconv(.c) bool;
pub const SDL_OBJECT_TYPE_TRAY: c_int = 11;
pub const SDL_ObjectType = c_uint;
pub extern fn SDL_FindObject(object: ?*anyopaque, @"type": SDL_ObjectType) bool;
pub extern var SDL_object_validation: bool;
pub inline fn SDL_ObjectValid(object: ?*anyopaque, arg_type: SDL_ObjectType) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    if (!(object != null)) {
        return @"false" != 0;
    }
    if (!SDL_object_validation) {
        return @"true" != 0;
    }
    return SDL_FindObject(object, @"type");
}
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
pub const DBUS_BUS_SESSION: c_int = 0;
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
pub extern fn SDL_ListInsertAtPosition(head: [*c][*c]SDL_ListNode, pos: c_int, ent: ?*anyopaque) bool;
pub extern fn SDL_ListRemove(head: [*c][*c]SDL_ListNode, ent: ?*anyopaque) void;
pub extern fn SDL_ListClear(head: [*c][*c]SDL_ListNode) void;
pub extern fn SDL_ListCountEntries(head: [*c][*c]SDL_ListNode) c_int;
pub const SDL_MENU_ITEM_TYPE_NORMAL: c_int = 0;
pub const SDL_MENU_ITEM_TYPE_SEPERATOR: c_int = 1;
pub const SDL_MENU_ITEM_TYPE_CHECKBOX: c_int = 2;
pub const enum_SDL_MenuItemType = c_uint;
pub const SDL_MenuItemType = enum_SDL_MenuItemType;
pub const SDL_MENU_ITEM_FLAGS_NONE: c_int = 0;
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
pub extern fn SDL_DBus_Init() void;
pub extern fn SDL_DBus_Quit() void;
pub extern fn SDL_DBus_GetContext() [*c]SDL_DBusContext;
pub extern fn SDL_DBus_CallMethod(save_reply: [*c]?*DBusMessage, node: [*c]const u8, path: [*c]const u8, interface: [*c]const u8, method: [*c]const u8, ...) bool;
pub extern fn SDL_DBus_QueryProperty(save_reply: [*c]?*DBusMessage, node: [*c]const u8, path: [*c]const u8, interface: [*c]const u8, property: [*c]const u8, expectedtype: c_int, result: ?*anyopaque) bool;
pub extern fn SDL_DBus_CallVoidMethodOnConnection(conn: ?*DBusConnection, node: [*c]const u8, path: [*c]const u8, interface: [*c]const u8, method: [*c]const u8, ...) bool;
pub extern fn SDL_DBus_FreeReply(saved_reply: [*c]?*DBusMessage) void;
pub extern fn SDL_DBus_CreateMenuItem() [*c]SDL_MenuItem;
pub extern fn SDL_DBus_ExportMenu(ctx: [*c]SDL_DBusContext, conn: ?*DBusConnection, menu: [*c]SDL_ListNode) [*c]const u8;
pub extern fn SDL_DBus_UpdateMenu(ctx: [*c]SDL_DBusContext, conn: ?*DBusConnection, menu: [*c]SDL_ListNode, path: [*c]const u8, cb: ?*const fn ([*c]SDL_ListNode, [*c]const u8, ?*anyopaque) callconv(.c) void, cbdata: ?*anyopaque, flags: u8) void;
pub extern fn SDL_DBus_RegisterMenuOpenCallback(menu: [*c]SDL_ListNode, cb: ?*const fn ([*c]SDL_ListNode, ?*anyopaque) callconv(.c) bool, cbdata: ?*anyopaque) void;
pub extern fn SDL_DBus_TransferMenuItemProperties(src: [*c]SDL_MenuItem, dst: [*c]SDL_MenuItem) void;
pub extern fn SDL_DBus_RetractMenu(ctx: [*c]SDL_DBusContext, conn: ?*DBusConnection, path: [*c][*c]const u8) void;
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
pub extern fn SDL_GetAppID() [*c]const u8;
pub extern fn getpid() __pid_t;
pub const struct_SDL_TrayDriverDBus = extern struct {
    dbus: [*c]SDL_DBusContext = null,
};
pub const SDL_TrayDriverDBus = struct_SDL_TrayDriverDBus;
pub const struct_SDL_TrayDBus = extern struct {
    connection: ?*DBusConnection = null,
    service_name: [*c]u8 = null,
    tooltip: [*c]u8 = null,
    surface: [*c]SDL_Surface = null,
    l_cb: SDL_TrayClickCallback = null,
    r_cb: SDL_TrayClickCallback = null,
    m_cb: SDL_TrayClickCallback = null,
    udata: ?*anyopaque = null,
    block: bool = false,
};
pub const SDL_TrayDBus = struct_SDL_TrayDBus;
pub const struct_SDL_TrayMenuDBus = extern struct {
    menu: [*c]SDL_ListNode = null,
    menu_path: [*c]const u8 = null,
    array_representation: [*c][*c]SDL_TrayEntry = null,
};
pub const SDL_TrayMenuDBus = struct_SDL_TrayMenuDBus;
pub const struct_SDL_TrayEntryDBus = extern struct {
    item: [*c]SDL_MenuItem = null,
    sub_menu: [*c]SDL_TrayMenu = null,
};
pub const SDL_TrayEntryDBus = struct_SDL_TrayEntryDBus;
pub var sni_introspect: [*c]const u8 = "<!DOCTYPE node PUBLIC \"-//freedesktop//DTD D-BUS Object Introspection 1.0//EN\" \"http://www.freedesktop.org/standards/dbus/1.0/introspect.dtd\">\r\n<node>\r\n  <interface name=\"org.kde.StatusNotifierItem\">\r\n\r\n    <property name=\"Category\" type=\"s\" access=\"read\"/>\r\n    <property name=\"Id\" type=\"s\" access=\"read\"/>\r\n    <property name=\"Title\" type=\"s\" access=\"read\"/>\r\n    <property name=\"Status\" type=\"s\" access=\"read\"/>\r\n    <property name=\"WindowId\" type=\"i\" access=\"read\"/>\r\n\r\n    <!-- An additional path to add to the theme search path to find the icons specified above. -->\r\n    <property name=\"IconThemePath\" type=\"s\" access=\"read\"/>\r\n    <property name=\"Menu\" type=\"o\" access=\"read\"/>\r\n    <property name=\"ItemIsMenu\" type=\"b\" access=\"read\"/>\r\n\r\n\r\n    <!-- main icon -->\r\n    <!-- names are preferred over pixmaps -->\r\n    <property name=\"IconName\" type=\"s\" access=\"read\"/>\r\n\r\n    <!--struct containing width, height and image data-->\r\n    <property name=\"IconPixmap\" type=\"a(iiay)\" access=\"read\">\r\n      <annotation name=\"org.qtproject.QtDBus.QtTypeName\" value=\"KDbusImageVector\"/>\r\n    </property>\r\n\r\n    <property name=\"OverlayIconName\" type=\"s\" access=\"read\"/>\r\n\r\n    <property name=\"OverlayIconPixmap\" type=\"a(iiay)\" access=\"read\">\r\n      <annotation name=\"org.qtproject.QtDBus.QtTypeName\" value=\"KDbusImageVector\"/>\r\n    </property>\r\n\r\n\r\n    <!-- Requesting attention icon -->\r\n    <property name=\"AttentionIconName\" type=\"s\" access=\"read\"/>\r\n\r\n    <!--same definition as image-->\r\n    <property name=\"AttentionIconPixmap\" type=\"a(iiay)\" access=\"read\">\r\n      <annotation name=\"org.qtproject.QtDBus.QtTypeName\" value=\"KDbusImageVector\"/>\r\n    </property>\r\n\r\n    <property name=\"AttentionMovieName\" type=\"s\" access=\"read\"/>\r\n\r\n\r\n\r\n    <!-- tooltip data -->\r\n\r\n    <!--(iiay) is an image-->\r\n    <property name=\"ToolTip\" type=\"(sa(iiay)ss)\" access=\"read\">\r\n      <annotation name=\"org.qtproject.QtDBus.QtTypeName\" value=\"KDbusToolTipStruct\"/>\r\n    </property>\r\n\r\n    <method name=\"ProvideXdgActivationToken\">\r\n        <arg name=\"token\" type=\"s\" direction=\"in\"/>\r\n    </method>\r\n\r\n    <!-- interaction: the systemtray wants the application to do something -->\r\n    <method name=\"ContextMenu\">\r\n        <!-- we're passing the coordinates of the icon, so the app knows where to put the popup window -->\r\n        <arg name=\"x\" type=\"i\" direction=\"in\"/>\r\n        <arg name=\"y\" type=\"i\" direction=\"in\"/>\r\n    </method>\r\n\r\n    <method name=\"Activate\">\r\n        <arg name=\"x\" type=\"i\" direction=\"in\"/>\r\n        <arg name=\"y\" type=\"i\" direction=\"in\"/>\r\n    </method>\r\n\r\n    <method name=\"SecondaryActivate\">\r\n        <arg name=\"x\" type=\"i\" direction=\"in\"/>\r\n        <arg name=\"y\" type=\"i\" direction=\"in\"/>\r\n    </method>\r\n\r\n    <method name=\"Scroll\">\r\n      <arg name=\"delta\" type=\"i\" direction=\"in\"/>\r\n      <arg name=\"orientation\" type=\"s\" direction=\"in\"/>\r\n    </method>\r\n\r\n    <!-- Signals: the client wants to change something in the status-->\r\n    <signal name=\"NewTitle\">\r\n    </signal>\r\n\r\n    <signal name=\"NewIcon\">\r\n    </signal>\r\n\r\n    <signal name=\"NewAttentionIcon\">\r\n    </signal>\r\n\r\n    <signal name=\"NewOverlayIcon\">\r\n    </signal>\r\n\r\n    <signal name=\"NewMenu\">\r\n    </signal>\r\n\r\n    <signal name=\"NewToolTip\">\r\n    </signal>\r\n\r\n    <signal name=\"NewStatus\">\r\n      <arg name=\"status\" type=\"s\"/>\r\n    </signal>\r\n\r\n  </interface>\r\n</node>";
pub fn TrayHandleGetAllProps(tray: [*c]SDL_Tray, tray_dbus: [*c]SDL_TrayDBus, driver: [*c]SDL_TrayDriverDBus, msg: ?*DBusMessage) callconv(.c) DBusHandlerResult {
    @setEvalBranchQuota(100000);
    var menu_dbus: [*c]SDL_TrayMenuDBus = undefined;
    _ = &menu_dbus;
    var iter: DBusMessageIter = undefined;
    _ = &iter;
    var dict_iter: DBusMessageIter = undefined;
    _ = &dict_iter;
    var entry_iter: DBusMessageIter = undefined;
    _ = &entry_iter;
    var variant_iter: DBusMessageIter = undefined;
    _ = &variant_iter;
    var struct_iter: DBusMessageIter = undefined;
    _ = &struct_iter;
    var array_iter: DBusMessageIter = undefined;
    _ = &array_iter;
    var reply: ?*DBusMessage = undefined;
    _ = &reply;
    var interface: [*c]const u8 = undefined;
    _ = &interface;
    var key: [*c]const u8 = undefined;
    _ = &key;
    var value: [*c]const u8 = undefined;
    _ = &value;
    var empty: [*c]const u8 = undefined;
    _ = &empty;
    var uint32_val: dbus_uint32_t = undefined;
    _ = &uint32_val;
    var bool_value: dbus_bool_t = undefined;
    _ = &bool_value;
    empty = "";
    _ = driver.*.dbus.*.message_iter_init.?(msg, &iter);
    driver.*.dbus.*.message_iter_get_basic.?(&iter, @ptrCast(@alignCast(&interface)));
    reply = driver.*.dbus.*.message_new_method_return.?(msg);
    driver.*.dbus.*.message_iter_init_append.?(reply, &iter);
    _ = driver.*.dbus.*.message_iter_open_container.?(&iter, @as(c_int, 'a'), "{sv}", &dict_iter);
    key = "Category";
    value = "ApplicationStatus";
    _ = driver.*.dbus.*.message_iter_open_container.?(&dict_iter, @as(c_int, 'e'), null, &entry_iter);
    _ = driver.*.dbus.*.message_iter_append_basic.?(&entry_iter, @as(c_int, 's'), @ptrCast(@alignCast(&key)));
    _ = driver.*.dbus.*.message_iter_open_container.?(&entry_iter, @as(c_int, 'v'), "s", &variant_iter);
    _ = driver.*.dbus.*.message_iter_append_basic.?(&variant_iter, @as(c_int, 's'), @ptrCast(@alignCast(&value)));
    _ = driver.*.dbus.*.message_iter_close_container.?(&entry_iter, &variant_iter);
    _ = driver.*.dbus.*.message_iter_close_container.?(&dict_iter, &entry_iter);
    key = "Id";
    value = SDL_GetAppID();
    _ = driver.*.dbus.*.message_iter_open_container.?(&dict_iter, @as(c_int, 'e'), null, &entry_iter);
    _ = driver.*.dbus.*.message_iter_append_basic.?(&entry_iter, @as(c_int, 's'), @ptrCast(@alignCast(&key)));
    _ = driver.*.dbus.*.message_iter_open_container.?(&entry_iter, @as(c_int, 'v'), "s", &variant_iter);
    _ = driver.*.dbus.*.message_iter_append_basic.?(&variant_iter, @as(c_int, 's'), @ptrCast(@alignCast(&value)));
    _ = driver.*.dbus.*.message_iter_close_container.?(&entry_iter, &variant_iter);
    _ = driver.*.dbus.*.message_iter_close_container.?(&dict_iter, &entry_iter);
    key = "Title";
    _ = driver.*.dbus.*.message_iter_open_container.?(&dict_iter, @as(c_int, 'e'), null, &entry_iter);
    _ = driver.*.dbus.*.message_iter_append_basic.?(&entry_iter, @as(c_int, 's'), @ptrCast(@alignCast(&key)));
    _ = driver.*.dbus.*.message_iter_open_container.?(&entry_iter, @as(c_int, 'v'), "s", &variant_iter);
    _ = driver.*.dbus.*.message_iter_append_basic.?(&variant_iter, @as(c_int, 's'), @ptrCast(@alignCast(&empty)));
    _ = driver.*.dbus.*.message_iter_close_container.?(&entry_iter, &variant_iter);
    _ = driver.*.dbus.*.message_iter_close_container.?(&dict_iter, &entry_iter);
    key = "Status";
    value = "Active";
    _ = driver.*.dbus.*.message_iter_open_container.?(&dict_iter, @as(c_int, 'e'), null, &entry_iter);
    _ = driver.*.dbus.*.message_iter_append_basic.?(&entry_iter, @as(c_int, 's'), @ptrCast(@alignCast(&key)));
    _ = driver.*.dbus.*.message_iter_open_container.?(&entry_iter, @as(c_int, 'v'), "s", &variant_iter);
    _ = driver.*.dbus.*.message_iter_append_basic.?(&variant_iter, @as(c_int, 's'), @ptrCast(@alignCast(&value)));
    _ = driver.*.dbus.*.message_iter_close_container.?(&entry_iter, &variant_iter);
    _ = driver.*.dbus.*.message_iter_close_container.?(&dict_iter, &entry_iter);
    key = "IconName";
    _ = driver.*.dbus.*.message_iter_open_container.?(&dict_iter, @as(c_int, 'e'), null, &entry_iter);
    _ = driver.*.dbus.*.message_iter_append_basic.?(&entry_iter, @as(c_int, 's'), @ptrCast(@alignCast(&key)));
    _ = driver.*.dbus.*.message_iter_open_container.?(&entry_iter, @as(c_int, 'v'), "s", &variant_iter);
    _ = driver.*.dbus.*.message_iter_append_basic.?(&variant_iter, @as(c_int, 's'), @ptrCast(@alignCast(&empty)));
    _ = driver.*.dbus.*.message_iter_close_container.?(&entry_iter, &variant_iter);
    _ = driver.*.dbus.*.message_iter_close_container.?(&dict_iter, &entry_iter);
    key = "WindowId";
    uint32_val = 0;
    _ = driver.*.dbus.*.message_iter_open_container.?(&dict_iter, @as(c_int, 'e'), null, &entry_iter);
    _ = driver.*.dbus.*.message_iter_append_basic.?(&entry_iter, @as(c_int, 's'), @ptrCast(@alignCast(&key)));
    _ = driver.*.dbus.*.message_iter_open_container.?(&entry_iter, @as(c_int, 'v'), "i", &variant_iter);
    _ = driver.*.dbus.*.message_iter_append_basic.?(&variant_iter, @as(c_int, 'i'), @ptrCast(@alignCast(&uint32_val)));
    _ = driver.*.dbus.*.message_iter_close_container.?(&entry_iter, &variant_iter);
    _ = driver.*.dbus.*.message_iter_close_container.?(&dict_iter, &entry_iter);
    key = "ItemIsMenu";
    menu_dbus = @ptrCast(@alignCast(if (tray.*.menu != null) @as(?*anyopaque, @ptrCast(@alignCast(@as([*c]SDL_TrayMenuDBus, @ptrCast(@alignCast(tray.*.menu.*.internal)))))) else @as(?*anyopaque, null)));
    if ((menu_dbus != null) and (menu_dbus.*.menu_path != null)) {
        bool_value = TRUE;
    } else {
        bool_value = FALSE;
    }
    _ = driver.*.dbus.*.message_iter_open_container.?(&dict_iter, @as(c_int, 'e'), null, &entry_iter);
    _ = driver.*.dbus.*.message_iter_append_basic.?(&entry_iter, @as(c_int, 's'), @ptrCast(@alignCast(&key)));
    _ = driver.*.dbus.*.message_iter_open_container.?(&entry_iter, @as(c_int, 'v'), "b", &variant_iter);
    _ = driver.*.dbus.*.message_iter_append_basic.?(&variant_iter, @as(c_int, 'b'), @ptrCast(@alignCast(&bool_value)));
    _ = driver.*.dbus.*.message_iter_close_container.?(&entry_iter, &variant_iter);
    _ = driver.*.dbus.*.message_iter_close_container.?(&dict_iter, &entry_iter);
    if ((menu_dbus != null) and (menu_dbus.*.menu_path != null)) {
        key = "Menu";
        value = menu_dbus.*.menu_path;
        _ = driver.*.dbus.*.message_iter_open_container.?(&dict_iter, @as(c_int, 'e'), null, &entry_iter);
        _ = driver.*.dbus.*.message_iter_append_basic.?(&entry_iter, @as(c_int, 's'), @ptrCast(@alignCast(&key)));
        _ = driver.*.dbus.*.message_iter_open_container.?(&entry_iter, @as(c_int, 'v'), "o", &variant_iter);
        _ = driver.*.dbus.*.message_iter_append_basic.?(&variant_iter, @as(c_int, 'o'), @ptrCast(@alignCast(&value)));
        _ = driver.*.dbus.*.message_iter_close_container.?(&entry_iter, &variant_iter);
        _ = driver.*.dbus.*.message_iter_close_container.?(&dict_iter, &entry_iter);
    } else {
        key = "Menu";
        value = "/NO_DBUSMENU";
        _ = driver.*.dbus.*.message_iter_open_container.?(&dict_iter, @as(c_int, 'e'), null, &entry_iter);
        _ = driver.*.dbus.*.message_iter_append_basic.?(&entry_iter, @as(c_int, 's'), @ptrCast(@alignCast(&key)));
        _ = driver.*.dbus.*.message_iter_open_container.?(&entry_iter, @as(c_int, 'v'), "o", &variant_iter);
        _ = driver.*.dbus.*.message_iter_append_basic.?(&variant_iter, @as(c_int, 'o'), @ptrCast(@alignCast(&value)));
        _ = driver.*.dbus.*.message_iter_close_container.?(&entry_iter, &variant_iter);
        _ = driver.*.dbus.*.message_iter_close_container.?(&dict_iter, &entry_iter);
    }
    if (tray_dbus.*.surface != null) {
        var pixmap_array_iter: DBusMessageIter = undefined;
        _ = &pixmap_array_iter;
        var pixmap_struct_iter: DBusMessageIter = undefined;
        _ = &pixmap_struct_iter;
        var pixmap_byte_array_iter: DBusMessageIter = undefined;
        _ = &pixmap_byte_array_iter;
        key = "IconPixmap";
        _ = driver.*.dbus.*.message_iter_open_container.?(&dict_iter, @as(c_int, 'e'), null, &entry_iter);
        _ = driver.*.dbus.*.message_iter_append_basic.?(&entry_iter, @as(c_int, 's'), @ptrCast(@alignCast(&key)));
        _ = driver.*.dbus.*.message_iter_open_container.?(&entry_iter, @as(c_int, 'v'), "a(iiay)", &variant_iter);
        _ = driver.*.dbus.*.message_iter_open_container.?(&variant_iter, @as(c_int, 'a'), "(iiay)", &pixmap_array_iter);
        _ = driver.*.dbus.*.message_iter_open_container.?(&pixmap_array_iter, @as(c_int, 'r'), null, &pixmap_struct_iter);
        _ = driver.*.dbus.*.message_iter_append_basic.?(&pixmap_struct_iter, @as(c_int, 'i'), @ptrCast(@alignCast(&tray_dbus.*.surface.*.w)));
        _ = driver.*.dbus.*.message_iter_append_basic.?(&pixmap_struct_iter, @as(c_int, 'i'), @ptrCast(@alignCast(&tray_dbus.*.surface.*.h)));
        _ = driver.*.dbus.*.message_iter_open_container.?(&pixmap_struct_iter, @as(c_int, 'a'), "y", &pixmap_byte_array_iter);
        _ = driver.*.dbus.*.message_iter_append_fixed_array.?(&pixmap_byte_array_iter, @as(c_int, 'y'), @ptrCast(@alignCast(&tray_dbus.*.surface.*.pixels)), tray_dbus.*.surface.*.pitch * tray_dbus.*.surface.*.h);
        _ = driver.*.dbus.*.message_iter_close_container.?(&pixmap_struct_iter, &pixmap_byte_array_iter);
        _ = driver.*.dbus.*.message_iter_close_container.?(&pixmap_array_iter, &pixmap_struct_iter);
        _ = driver.*.dbus.*.message_iter_close_container.?(&variant_iter, &pixmap_array_iter);
        _ = driver.*.dbus.*.message_iter_close_container.?(&entry_iter, &variant_iter);
        _ = driver.*.dbus.*.message_iter_close_container.?(&dict_iter, &entry_iter);
    }
    if (tray_dbus.*.tooltip != null) {
        key = "ToolTip";
        _ = driver.*.dbus.*.message_iter_open_container.?(&dict_iter, @as(c_int, 'e'), null, &entry_iter);
        _ = driver.*.dbus.*.message_iter_append_basic.?(&entry_iter, @as(c_int, 's'), @ptrCast(@alignCast(&key)));
        _ = driver.*.dbus.*.message_iter_open_container.?(&entry_iter, @as(c_int, 'v'), "(sa(iiay)ss)", &variant_iter);
        _ = driver.*.dbus.*.message_iter_open_container.?(&variant_iter, @as(c_int, 'r'), null, &struct_iter);
        _ = driver.*.dbus.*.message_iter_append_basic.?(&struct_iter, @as(c_int, 's'), @ptrCast(@alignCast(&empty)));
        _ = driver.*.dbus.*.message_iter_open_container.?(&struct_iter, @as(c_int, 'a'), "(iiay)", &array_iter);
        _ = driver.*.dbus.*.message_iter_close_container.?(&struct_iter, &array_iter);
        _ = driver.*.dbus.*.message_iter_append_basic.?(&struct_iter, @as(c_int, 's'), @ptrCast(@alignCast(&tray_dbus.*.tooltip)));
        _ = driver.*.dbus.*.message_iter_append_basic.?(&struct_iter, @as(c_int, 's'), @ptrCast(@alignCast(&empty)));
        _ = driver.*.dbus.*.message_iter_close_container.?(&variant_iter, &struct_iter);
        _ = driver.*.dbus.*.message_iter_close_container.?(&entry_iter, &variant_iter);
        _ = driver.*.dbus.*.message_iter_close_container.?(&dict_iter, &entry_iter);
        _ = driver.*.dbus.*.message_iter_close_container.?(&iter, &dict_iter);
    }
    _ = driver.*.dbus.*.connection_send.?(tray_dbus.*.connection, reply, null);
    driver.*.dbus.*.message_unref.?(reply);
    return DBUS_HANDLER_RESULT_HANDLED;
}
pub fn TrayHandleGetProp(tray: [*c]SDL_Tray, tray_dbus: [*c]SDL_TrayDBus, driver: [*c]SDL_TrayDriverDBus, msg: ?*DBusMessage) callconv(.c) DBusHandlerResult {
    @setEvalBranchQuota(100000);
    var menu_dbus: [*c]SDL_TrayMenuDBus = undefined;
    _ = &menu_dbus;
    var iter: DBusMessageIter = undefined;
    _ = &iter;
    var variant_iter: DBusMessageIter = undefined;
    _ = &variant_iter;
    var reply: ?*DBusMessage = undefined;
    _ = &reply;
    var interface: [*c]const u8 = undefined;
    _ = &interface;
    var property: [*c]const u8 = undefined;
    _ = &property;
    var value: [*c]const u8 = undefined;
    _ = &value;
    var empty: [*c]const u8 = undefined;
    _ = &empty;
    var bool_value: dbus_bool_t = undefined;
    _ = &bool_value;
    menu_dbus = @ptrCast(@alignCast(if (tray.*.menu != null) @as(?*anyopaque, @ptrCast(@alignCast(@as([*c]SDL_TrayMenuDBus, @ptrCast(@alignCast(tray.*.menu.*.internal)))))) else @as(?*anyopaque, null)));
    empty = "";
    _ = driver.*.dbus.*.message_iter_init.?(msg, &iter);
    driver.*.dbus.*.message_iter_get_basic.?(&iter, @ptrCast(@alignCast(&interface)));
    _ = driver.*.dbus.*.message_iter_next.?(&iter);
    driver.*.dbus.*.message_iter_get_basic.?(&iter, @ptrCast(@alignCast(&property)));
    reply = driver.*.dbus.*.message_new_method_return.?(msg);
    driver.*.dbus.*.message_iter_init_append.?(reply, &iter);
    if (!(SDL_strcmp_REAL(property, "Category") != 0)) {
        value = "ApplicationStatus";
        _ = driver.*.dbus.*.message_iter_open_container.?(&iter, @as(c_int, 'v'), "s", &variant_iter);
        _ = driver.*.dbus.*.message_iter_append_basic.?(&variant_iter, @as(c_int, 's'), @ptrCast(@alignCast(&value)));
        _ = driver.*.dbus.*.message_iter_close_container.?(&iter, &variant_iter);
    } else if (!(SDL_strcmp_REAL(property, "Id") != 0)) {
        value = SDL_GetAppID();
        _ = driver.*.dbus.*.message_iter_open_container.?(&iter, @as(c_int, 'v'), "s", &variant_iter);
        _ = driver.*.dbus.*.message_iter_append_basic.?(&variant_iter, @as(c_int, 's'), @ptrCast(@alignCast(&value)));
        _ = driver.*.dbus.*.message_iter_close_container.?(&iter, &variant_iter);
    } else if (!(SDL_strcmp_REAL(property, "Title") != 0)) {
        _ = driver.*.dbus.*.message_iter_open_container.?(&iter, @as(c_int, 'v'), "s", &variant_iter);
        _ = driver.*.dbus.*.message_iter_append_basic.?(&variant_iter, @as(c_int, 's'), @ptrCast(@alignCast(&empty)));
        _ = driver.*.dbus.*.message_iter_close_container.?(&iter, &variant_iter);
    } else if (!(SDL_strcmp_REAL(property, "Status") != 0)) {
        value = "Active";
        _ = driver.*.dbus.*.message_iter_open_container.?(&iter, @as(c_int, 'v'), "s", &variant_iter);
        _ = driver.*.dbus.*.message_iter_append_basic.?(&variant_iter, @as(c_int, 's'), @ptrCast(@alignCast(&value)));
        _ = driver.*.dbus.*.message_iter_close_container.?(&iter, &variant_iter);
    } else if (!(SDL_strcmp_REAL(property, "IconName") != 0)) {
        _ = driver.*.dbus.*.message_iter_open_container.?(&iter, @as(c_int, 'v'), "s", &variant_iter);
        _ = driver.*.dbus.*.message_iter_append_basic.?(&variant_iter, @as(c_int, 's'), @ptrCast(@alignCast(&empty)));
        _ = driver.*.dbus.*.message_iter_close_container.?(&iter, &variant_iter);
    } else if (!(SDL_strcmp_REAL(property, "ItemIsMenu") != 0)) {
        if ((menu_dbus != null) and (menu_dbus.*.menu_path != null)) {
            bool_value = TRUE;
        } else {
            bool_value = FALSE;
        }
        _ = driver.*.dbus.*.message_iter_open_container.?(&iter, @as(c_int, 'v'), "b", &variant_iter);
        _ = driver.*.dbus.*.message_iter_append_basic.?(&variant_iter, @as(c_int, 'b'), @ptrCast(@alignCast(&bool_value)));
        _ = driver.*.dbus.*.message_iter_close_container.?(&iter, &variant_iter);
    } else if (!(SDL_strcmp_REAL(property, "Menu") != 0)) {
        if ((menu_dbus != null) and (menu_dbus.*.menu_path != null)) {
            value = menu_dbus.*.menu_path;
            _ = driver.*.dbus.*.message_iter_open_container.?(&iter, @as(c_int, 'v'), "o", &variant_iter);
            _ = driver.*.dbus.*.message_iter_append_basic.?(&variant_iter, @as(c_int, 'o'), @ptrCast(@alignCast(&value)));
            _ = driver.*.dbus.*.message_iter_close_container.?(&iter, &variant_iter);
        } else {
            value = "/NO_DBUSMENU";
            _ = driver.*.dbus.*.message_iter_open_container.?(&iter, @as(c_int, 'v'), "o", &variant_iter);
            _ = driver.*.dbus.*.message_iter_append_basic.?(&variant_iter, @as(c_int, 'o'), @ptrCast(@alignCast(&value)));
            _ = driver.*.dbus.*.message_iter_close_container.?(&iter, &variant_iter);
        }
    } else if (!(SDL_strcmp_REAL(property, "IconPixmap") != 0) and (tray_dbus.*.surface != null)) {
        var array_iter: DBusMessageIter = undefined;
        _ = &array_iter;
        var struct_iter: DBusMessageIter = undefined;
        _ = &struct_iter;
        var byte_array_iter: DBusMessageIter = undefined;
        _ = &byte_array_iter;
        _ = driver.*.dbus.*.message_iter_open_container.?(&iter, @as(c_int, 'v'), "a(iiay)", &variant_iter);
        _ = driver.*.dbus.*.message_iter_open_container.?(&variant_iter, @as(c_int, 'a'), "(iiay)", &array_iter);
        _ = driver.*.dbus.*.message_iter_open_container.?(&array_iter, @as(c_int, 'r'), null, &struct_iter);
        _ = driver.*.dbus.*.message_iter_append_basic.?(&struct_iter, @as(c_int, 'i'), @ptrCast(@alignCast(&tray_dbus.*.surface.*.w)));
        _ = driver.*.dbus.*.message_iter_append_basic.?(&struct_iter, @as(c_int, 'i'), @ptrCast(@alignCast(&tray_dbus.*.surface.*.h)));
        _ = driver.*.dbus.*.message_iter_open_container.?(&struct_iter, @as(c_int, 'a'), "y", &byte_array_iter);
        _ = driver.*.dbus.*.message_iter_append_fixed_array.?(&byte_array_iter, @as(c_int, 'y'), @ptrCast(@alignCast(&tray_dbus.*.surface.*.pixels)), tray_dbus.*.surface.*.pitch * tray_dbus.*.surface.*.h);
        _ = driver.*.dbus.*.message_iter_close_container.?(&struct_iter, &byte_array_iter);
        _ = driver.*.dbus.*.message_iter_close_container.?(&array_iter, &struct_iter);
        _ = driver.*.dbus.*.message_iter_close_container.?(&variant_iter, &array_iter);
        _ = driver.*.dbus.*.message_iter_close_container.?(&iter, &variant_iter);
    } else if (!(SDL_strcmp_REAL(property, "ToolTip") != 0) and (tray_dbus.*.tooltip != null)) {
        var struct_iter: DBusMessageIter = undefined;
        _ = &struct_iter;
        var array_iter: DBusMessageIter = undefined;
        _ = &array_iter;
        _ = driver.*.dbus.*.message_iter_open_container.?(&iter, @as(c_int, 'v'), "(sa(iiay)ss)", &variant_iter);
        _ = driver.*.dbus.*.message_iter_open_container.?(&variant_iter, @as(c_int, 'r'), null, &struct_iter);
        _ = driver.*.dbus.*.message_iter_append_basic.?(&struct_iter, @as(c_int, 's'), @ptrCast(@alignCast(&empty)));
        _ = driver.*.dbus.*.message_iter_open_container.?(&struct_iter, @as(c_int, 'a'), "(iiay)", &array_iter);
        _ = driver.*.dbus.*.message_iter_close_container.?(&struct_iter, &array_iter);
        _ = driver.*.dbus.*.message_iter_append_basic.?(&struct_iter, @as(c_int, 's'), @ptrCast(@alignCast(&tray_dbus.*.tooltip)));
        _ = driver.*.dbus.*.message_iter_append_basic.?(&struct_iter, @as(c_int, 's'), @ptrCast(@alignCast(&empty)));
        _ = driver.*.dbus.*.message_iter_close_container.?(&variant_iter, &struct_iter);
        _ = driver.*.dbus.*.message_iter_close_container.?(&iter, &variant_iter);
    } else if (!(SDL_strcmp_REAL(property, "WindowId") != 0)) {
        var uint32_val: dbus_uint32_t = undefined;
        _ = &uint32_val;
        uint32_val = 0;
        _ = driver.*.dbus.*.message_iter_open_container.?(&iter, @as(c_int, 'v'), "i", &variant_iter);
        _ = driver.*.dbus.*.message_iter_append_basic.?(&variant_iter, @as(c_int, 'i'), @ptrCast(@alignCast(&uint32_val)));
        _ = driver.*.dbus.*.message_iter_close_container.?(&iter, &variant_iter);
    } else {
        driver.*.dbus.*.message_unref.?(reply);
        reply = driver.*.dbus.*.message_new_error.?(msg, "org.freedesktop.DBus.Error.UnknownProperty", "Unknown property");
    }
    _ = driver.*.dbus.*.connection_send.?(tray_dbus.*.connection, reply, null);
    driver.*.dbus.*.message_unref.?(reply);
    return DBUS_HANDLER_RESULT_HANDLED;
}
pub fn TrayMessageHandler(_: ?*DBusConnection, msg: ?*DBusMessage, user_data: ?*anyopaque) callconv(.c) DBusHandlerResult {
    @setEvalBranchQuota(100000);
    var tray: [*c]SDL_Tray = undefined;
    _ = &tray;
    var tray_dbus: [*c]SDL_TrayDBus = undefined;
    _ = &tray_dbus;
    var driver: [*c]SDL_TrayDriverDBus = undefined;
    _ = &driver;
    var reply: ?*DBusMessage = undefined;
    _ = &reply;
    tray = @ptrCast(@alignCast(user_data));
    tray_dbus = @ptrCast(@alignCast(tray.*.internal));
    driver = @ptrCast(@alignCast(tray.*.driver.*.internal));
    if (driver.*.dbus.*.message_is_method_call.?(msg, "org.freedesktop.DBus.Properties", "Get") != 0) {
        return TrayHandleGetProp(tray, tray_dbus, driver, msg);
    } else if (driver.*.dbus.*.message_is_method_call.?(msg, "org.freedesktop.DBus.Properties", "GetAll") != 0) {
        return TrayHandleGetAllProps(tray, tray_dbus, driver, msg);
    } else if (driver.*.dbus.*.message_is_method_call.?(msg, "org.freedesktop.DBus.Introspectable", "Introspect") != 0) {
        reply = driver.*.dbus.*.message_new_method_return.?(msg);
        _ = driver.*.dbus.*.message_append_args.?(reply, @as(c_int, 's'), &sni_introspect, @as(c_int, '\x00'));
        _ = driver.*.dbus.*.connection_send.?(tray_dbus.*.connection, reply, null);
        driver.*.dbus.*.message_unref.?(reply);
        return DBUS_HANDLER_RESULT_HANDLED;
    } else if (driver.*.dbus.*.message_is_method_call.?(msg, "org.kde.StatusNotifierItem", "ContextMenu") != 0) {
        if (tray_dbus.*.r_cb != null) {
            _ = tray_dbus.*.r_cb.?(tray_dbus.*.udata, tray);
        }
        reply = driver.*.dbus.*.message_new_method_return.?(msg);
        _ = driver.*.dbus.*.connection_send.?(tray_dbus.*.connection, reply, null);
        driver.*.dbus.*.message_unref.?(reply);
        return DBUS_HANDLER_RESULT_HANDLED;
    } else if (driver.*.dbus.*.message_is_method_call.?(msg, "org.kde.StatusNotifierItem", "Activate") != 0) {
        if (tray_dbus.*.l_cb != null) {
            _ = tray_dbus.*.l_cb.?(tray_dbus.*.udata, tray);
        }
        reply = driver.*.dbus.*.message_new_method_return.?(msg);
        _ = driver.*.dbus.*.connection_send.?(tray_dbus.*.connection, reply, null);
        driver.*.dbus.*.message_unref.?(reply);
        return DBUS_HANDLER_RESULT_HANDLED;
    } else if (driver.*.dbus.*.message_is_method_call.?(msg, "org.kde.StatusNotifierItem", "SecondaryActivate") != 0) {
        if (tray_dbus.*.m_cb != null) {
            _ = tray_dbus.*.m_cb.?(tray_dbus.*.udata, tray);
        }
        reply = driver.*.dbus.*.message_new_method_return.?(msg);
        _ = driver.*.dbus.*.connection_send.?(tray_dbus.*.connection, reply, null);
        driver.*.dbus.*.message_unref.?(reply);
        return DBUS_HANDLER_RESULT_HANDLED;
    } else if (driver.*.dbus.*.message_is_method_call.?(msg, "org.kde.StatusNotifierItem", "Scroll") != 0) {
        var err: DBusError = undefined;
        _ = &err;
        var orientation: [*c]u8 = undefined;
        _ = &orientation;
        var delta: Sint32 = undefined;
        _ = &delta;
        driver.*.dbus.*.error_init.?(&err);
        _ = driver.*.dbus.*.message_get_args.?(msg, &err, @as(c_int, 'i'), &delta, @as(c_int, 's'), &orientation, @as(c_int, '\x00'));
        if (!(driver.*.dbus.*.error_is_set.?(&err) != 0)) {} else {
            driver.*.dbus.*.error_free.?(&err);
        }
        reply = driver.*.dbus.*.message_new_method_return.?(msg);
        _ = driver.*.dbus.*.connection_send.?(tray_dbus.*.connection, reply, null);
        driver.*.dbus.*.message_unref.?(reply);
        return DBUS_HANDLER_RESULT_HANDLED;
    }
    return DBUS_HANDLER_RESULT_NOT_YET_HANDLED;
}
pub export fn CreateTray(driver: [*c]SDL_TrayDriver, props: SDL_PropertiesID) [*c]SDL_Tray {
    @setEvalBranchQuota(100000);
    var dbus_driver: [*c]SDL_TrayDriverDBus = undefined;
    _ = &dbus_driver;
    var tray_dbus: [*c]SDL_TrayDBus = undefined;
    _ = &tray_dbus;
    var tray: [*c]SDL_Tray = undefined;
    _ = &tray;
    var icon: [*c]SDL_Surface = undefined;
    _ = &icon;
    var tooltip: [*c]const u8 = undefined;
    _ = &tooltip;
    var object_path: [*c]const u8 = undefined;
    _ = &object_path;
    var register_name: [*c]u8 = undefined;
    _ = &register_name;
    var vtable: DBusObjectPathVTable = undefined;
    _ = &vtable;
    var err: DBusError = undefined;
    _ = &err;
    var status: c_int = undefined;
    _ = &status;
    var bool_status: dbus_bool_t = undefined;
    _ = &bool_status;
    tooltip = SDL_GetStringProperty_REAL(props, "SDL.tray.create.tooltip", null);
    icon = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(props, "SDL.tray.create.icon", null)));
    tray_dbus = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(SDL_TrayDBus))));
    if (!(tray_dbus != null)) {
        return null;
    }
    tray = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(SDL_Tray))));
    if (!(tray != null)) {
        SDL_free_REAL(@ptrCast(@alignCast(tray_dbus.*.tooltip)));
        SDL_DestroySurface_REAL(tray_dbus.*.surface);
        SDL_free_REAL(@ptrCast(@alignCast(tray)));
        SDL_free_REAL(@ptrCast(@alignCast(tray_dbus)));
        return null;
    }
    tray.*.menu = null;
    tray.*.driver = driver;
    tray.*.internal = @ptrCast(@alignCast(tray_dbus));
    if (tooltip != null) {
        tray_dbus.*.tooltip = SDL_strdup_REAL(tooltip);
    } else {
        tray_dbus.*.tooltip = null;
    }
    tray_dbus.*.surface = SDL_ConvertSurface_REAL(icon, SDL_PIXELFORMAT_ARGB32);
    tray_dbus.*.block = @"false" != 0;
    dbus_driver = @ptrCast(@alignCast(driver.*.internal));
    dbus_driver.*.dbus.*.error_init.?(&err);
    tray_dbus.*.connection = dbus_driver.*.dbus.*.bus_get_private.?(DBUS_BUS_SESSION, &err);
    if (dbus_driver.*.dbus.*.error_is_set.?(&err) != 0) {
        _ = SDL_SetError_REAL("Unable to create tray: %s", err.message);
        dbus_driver.*.dbus.*.error_free.?(&err);
        SDL_free_REAL(@ptrCast(@alignCast(tray_dbus.*.tooltip)));
        SDL_DestroySurface_REAL(tray_dbus.*.surface);
        SDL_free_REAL(@ptrCast(@alignCast(tray)));
        SDL_free_REAL(@ptrCast(@alignCast(tray_dbus)));
        return null;
    }
    if (!(tray_dbus.*.connection != null)) {
        _ = SDL_SetError_REAL("Unable to create tray: unable to get connection!");
        SDL_free_REAL(@ptrCast(@alignCast(tray_dbus.*.tooltip)));
        SDL_DestroySurface_REAL(tray_dbus.*.surface);
        SDL_free_REAL(@ptrCast(@alignCast(tray)));
        SDL_free_REAL(@ptrCast(@alignCast(tray_dbus)));
        return null;
    }
    driver.*.count +%= 1;
    if (SDL_GetSandbox_REAL() == @as(SDL_Sandbox, SDL_SANDBOX_FLATPAK)) {
        _ = SDL_asprintf_REAL(&tray_dbus.*.service_name, "%s.tray%d", SDL_GetAppID(), driver.*.count);
    } else {
        _ = SDL_asprintf_REAL(&tray_dbus.*.service_name, "org.kde.StatusNotifierItem-%d-%d", getpid(), driver.*.count);
    }
    status = dbus_driver.*.dbus.*.bus_request_name.?(tray_dbus.*.connection, tray_dbus.*.service_name, DBUS_NAME_FLAG_REPLACE_EXISTING, &err);
    if (dbus_driver.*.dbus.*.error_is_set.?(&err) != 0) {
        _ = SDL_SetError_REAL("Unable to create tray: %s", err.message);
        dbus_driver.*.dbus.*.error_free.?(&err);
        dbus_driver.*.dbus.*.connection_close.?(tray_dbus.*.connection);
        SDL_free_REAL(@ptrCast(@alignCast(tray_dbus.*.tooltip)));
        SDL_DestroySurface_REAL(tray_dbus.*.surface);
        SDL_free_REAL(@ptrCast(@alignCast(tray)));
        SDL_free_REAL(@ptrCast(@alignCast(tray_dbus)));
        return null;
    }
    if (status != DBUS_REQUEST_NAME_REPLY_PRIMARY_OWNER) {
        _ = SDL_SetError_REAL("Unable to create tray: unable to request a unique name!");
        dbus_driver.*.dbus.*.connection_close.?(tray_dbus.*.connection);
        SDL_free_REAL(@ptrCast(@alignCast(tray_dbus.*.tooltip)));
        SDL_DestroySurface_REAL(tray_dbus.*.surface);
        SDL_free_REAL(@ptrCast(@alignCast(tray)));
        SDL_free_REAL(@ptrCast(@alignCast(tray_dbus)));
        return null;
    }
    object_path = "/StatusNotifierItem";
    vtable.message_function = TrayMessageHandler;
    bool_status = dbus_driver.*.dbus.*.connection_try_register_object_path.?(tray_dbus.*.connection, object_path, &vtable, @ptrCast(@alignCast(tray)), &err);
    if (dbus_driver.*.dbus.*.error_is_set.?(&err) != 0) {
        _ = SDL_SetError_REAL("Unable to create tray: %s", err.message);
        dbus_driver.*.dbus.*.error_free.?(&err);
        dbus_driver.*.dbus.*.connection_close.?(tray_dbus.*.connection);
        SDL_free_REAL(@ptrCast(@alignCast(tray_dbus.*.tooltip)));
        SDL_DestroySurface_REAL(tray_dbus.*.surface);
        SDL_free_REAL(@ptrCast(@alignCast(tray)));
        SDL_free_REAL(@ptrCast(@alignCast(tray_dbus)));
        return null;
    }
    if (!(bool_status != 0)) {
        _ = SDL_SetError_REAL("Unable to create tray: unable to register object path!");
        dbus_driver.*.dbus.*.connection_close.?(tray_dbus.*.connection);
        SDL_free_REAL(@ptrCast(@alignCast(tray_dbus.*.tooltip)));
        SDL_DestroySurface_REAL(tray_dbus.*.surface);
        SDL_free_REAL(@ptrCast(@alignCast(tray)));
        SDL_free_REAL(@ptrCast(@alignCast(tray_dbus)));
        return null;
    }
    register_name = tray_dbus.*.service_name;
    if (!SDL_DBus_CallVoidMethodOnConnection(tray_dbus.*.connection, "org.kde.StatusNotifierWatcher", "/StatusNotifierWatcher", "org.kde.StatusNotifierWatcher", "RegisterStatusNotifierItem", @as(c_int, 's'), &register_name, @as(c_int, '\x00'))) {
        _ = SDL_SetError_REAL("Unable to create tray: unable to register status notifier item!");
        dbus_driver.*.dbus.*.connection_close.?(tray_dbus.*.connection);
        SDL_free_REAL(@ptrCast(@alignCast(tray_dbus.*.tooltip)));
        SDL_DestroySurface_REAL(tray_dbus.*.surface);
        SDL_free_REAL(@ptrCast(@alignCast(tray)));
        SDL_free_REAL(@ptrCast(@alignCast(tray_dbus)));
        return null;
    }
    tray_dbus.*.l_cb = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(props, "SDL.tray.create.leftclick_callback", null)));
    tray_dbus.*.r_cb = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(props, "SDL.tray.create.rightclick_callback", null)));
    tray_dbus.*.m_cb = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(props, "SDL.tray.create.middleclick_callback", null)));
    tray_dbus.*.udata = SDL_GetPointerProperty_REAL(props, "SDL.tray.create.userdata", null);
    return tray;
}
pub export fn DestroyDriver(driver: [*c]SDL_TrayDriver) void {
    @setEvalBranchQuota(100000);
    SDL_DBus_Quit();
    SDL_free_REAL(@ptrCast(@alignCast(driver)));
}
pub export fn DestroyMenu(menu: [*c]SDL_TrayMenu) void {
    @setEvalBranchQuota(100000);
    var menu_dbus: [*c]SDL_TrayMenuDBus = undefined;
    _ = &menu_dbus;
    if (!(menu != null)) {
        return;
    }
    menu_dbus = @ptrCast(@alignCast(menu.*.internal));
    if (menu_dbus.*.menu != null) {
        var cursor: [*c]SDL_ListNode = undefined;
        _ = &cursor;
        cursor = menu_dbus.*.menu;
        while (cursor != null) {
            var item: [*c]SDL_MenuItem = undefined;
            _ = &item;
            var entry: [*c]SDL_TrayEntry = undefined;
            _ = &entry;
            var entry_dbus: [*c]SDL_TrayEntryDBus = undefined;
            _ = &entry_dbus;
            item = @ptrCast(@alignCast(cursor.*.entry));
            entry = @ptrCast(@alignCast(item.*.udata));
            entry_dbus = @ptrCast(@alignCast(entry.*.internal));
            if (entry_dbus.*.sub_menu != null) {
                DestroyMenu(entry_dbus.*.sub_menu);
                entry_dbus.*.sub_menu = null;
            }
            SDL_free_REAL(@ptrCast(@alignCast(item)));
            SDL_free_REAL(@ptrCast(@alignCast(entry)));
            cursor = cursor.*.next;
        }
        SDL_ListClear(&menu_dbus.*.menu);
    }
    SDL_free_REAL(@ptrCast(@alignCast(menu_dbus.*.array_representation)));
    SDL_free_REAL(@ptrCast(@alignCast(menu_dbus)));
    SDL_free_REAL(@ptrCast(@alignCast(menu)));
}
pub export fn DestroyTray(tray: [*c]SDL_Tray) void {
    @setEvalBranchQuota(100000);
    var tray_dbus: [*c]SDL_TrayDBus = undefined;
    _ = &tray_dbus;
    var driver: [*c]SDL_TrayDriverDBus = undefined;
    _ = &driver;
    driver = @ptrCast(@alignCast(tray.*.driver.*.internal));
    tray_dbus = @ptrCast(@alignCast(tray.*.internal));
    driver.*.dbus.*.connection_flush.?(tray_dbus.*.connection);
    tray_dbus.*.block = @"true" != 0;
    driver.*.dbus.*.connection_close.?(tray_dbus.*.connection);
    tray_dbus.*.connection = null;
    SDL_free_REAL(@ptrCast(@alignCast(tray_dbus.*.tooltip)));
    SDL_DestroySurface_REAL(tray_dbus.*.surface);
    if (tray.*.menu != null) {
        DestroyMenu(tray.*.menu);
        tray.*.menu = null;
    }
    SDL_free_REAL(@ptrCast(@alignCast(tray)));
}
pub export fn UpdateTray(tray: [*c]SDL_Tray) void {
    @setEvalBranchQuota(100000);
    var tray_dbus: [*c]SDL_TrayDBus = undefined;
    _ = &tray_dbus;
    var driver: [*c]SDL_TrayDriverDBus = undefined;
    _ = &driver;
    driver = @ptrCast(@alignCast(tray.*.driver.*.internal));
    tray_dbus = @ptrCast(@alignCast(tray.*.internal));
    if (!SDL_ObjectValid(@ptrCast(@alignCast(tray)), SDL_OBJECT_TYPE_TRAY)) {
        return;
    }
    if (tray_dbus.*.block) {
        return;
    }
    _ = driver.*.dbus.*.connection_read_write.?(tray_dbus.*.connection, 0);
    while (driver.*.dbus.*.connection_dispatch.?(tray_dbus.*.connection) == @as(DBusDispatchStatus, DBUS_DISPATCH_DATA_REMAINS)) {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(tray)), SDL_OBJECT_TYPE_TRAY)) {
            break;
        }
        if (tray_dbus.*.block) {
            break;
        }
        SDL_DelayNS_REAL(@as(Uint64, @bitCast(@as(c_long, @as(c_int, 10)))) *% @as(Uint64, SDL_NS_PER_US));
    }
}
pub export fn SetTrayIcon(tray: [*c]SDL_Tray, surface: [*c]SDL_Surface) void {
    @setEvalBranchQuota(100000);
    var tray_dbus: [*c]SDL_TrayDBus = undefined;
    _ = &tray_dbus;
    var driver: [*c]SDL_TrayDriverDBus = undefined;
    _ = &driver;
    var signal: ?*DBusMessage = undefined;
    _ = &signal;
    driver = @ptrCast(@alignCast(tray.*.driver.*.internal));
    tray_dbus = @ptrCast(@alignCast(tray.*.internal));
    if (tray_dbus.*.surface != null) {
        SDL_DestroySurface_REAL(tray_dbus.*.surface);
    }
    tray_dbus.*.surface = SDL_ConvertSurface_REAL(surface, SDL_PIXELFORMAT_ARGB32);
    signal = driver.*.dbus.*.message_new_signal.?("/StatusNotifierItem", "org.kde.StatusNotifierItem", "NewIcon");
    _ = driver.*.dbus.*.connection_send.?(tray_dbus.*.connection, signal, null);
    driver.*.dbus.*.connection_flush.?(tray_dbus.*.connection);
    driver.*.dbus.*.message_unref.?(signal);
}
pub export fn SetTrayTooltip(tray: [*c]SDL_Tray, text: [*c]const u8) void {
    @setEvalBranchQuota(100000);
    var tray_dbus: [*c]SDL_TrayDBus = undefined;
    _ = &tray_dbus;
    var driver: [*c]SDL_TrayDriverDBus = undefined;
    _ = &driver;
    var signal: ?*DBusMessage = undefined;
    _ = &signal;
    driver = @ptrCast(@alignCast(tray.*.driver.*.internal));
    tray_dbus = @ptrCast(@alignCast(tray.*.internal));
    SDL_free_REAL(@ptrCast(@alignCast(tray_dbus.*.tooltip)));
    if (text != null) {
        tray_dbus.*.tooltip = SDL_strdup_REAL(text);
    } else {
        tray_dbus.*.tooltip = null;
    }
    signal = driver.*.dbus.*.message_new_signal.?("/StatusNotifierItem", "org.kde.StatusNotifierItem", "NewToolTip");
    _ = driver.*.dbus.*.connection_send.?(tray_dbus.*.connection, signal, null);
    driver.*.dbus.*.connection_flush.?(tray_dbus.*.connection);
    driver.*.dbus.*.message_unref.?(signal);
}
pub export fn CreateTrayMenu(tray: [*c]SDL_Tray) [*c]SDL_TrayMenu {
    @setEvalBranchQuota(100000);
    var menu_dbus: [*c]SDL_TrayMenuDBus = undefined;
    _ = &menu_dbus;
    menu_dbus = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(SDL_TrayMenuDBus))));
    if (!(menu_dbus != null)) {
        _ = SDL_SetError_REAL("Unable to create tray menu: allocation failure!");
        return null;
    }
    tray.*.menu = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(SDL_TrayMenu))));
    if (!(tray.*.menu != null)) {
        SDL_free_REAL(@ptrCast(@alignCast(menu_dbus)));
        _ = SDL_SetError_REAL("Unable to create tray menu: allocation failure!");
        return null;
    }
    menu_dbus.*.menu = null;
    menu_dbus.*.menu_path = null;
    tray.*.menu.*.parent_tray = tray;
    tray.*.menu.*.parent_entry = null;
    tray.*.menu.*.internal = @ptrCast(@alignCast(menu_dbus));
    menu_dbus.*.array_representation = null;
    return tray.*.menu;
}
pub export fn CreateTraySubmenu(entry: [*c]SDL_TrayEntry) [*c]SDL_TrayMenu {
    @setEvalBranchQuota(100000);
    var menu_dbus: [*c]SDL_TrayMenuDBus = undefined;
    _ = &menu_dbus;
    var menu: [*c]SDL_TrayMenu = undefined;
    _ = &menu;
    var entry_dbus: [*c]SDL_TrayEntryDBus = undefined;
    _ = &entry_dbus;
    entry_dbus = @ptrCast(@alignCast(entry.*.internal));
    menu_dbus = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(SDL_TrayMenuDBus))));
    if (!(menu_dbus != null)) {
        _ = SDL_SetError_REAL("Unable to create tray submenu: allocation failure!");
        return null;
    }
    menu = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(SDL_TrayMenu))));
    if (!(menu != null)) {
        SDL_free_REAL(@ptrCast(@alignCast(menu_dbus)));
        _ = SDL_SetError_REAL("Unable to create tray submenu: allocation failure!");
        return null;
    }
    menu_dbus.*.menu = null;
    menu_dbus.*.menu_path = null;
    menu.*.parent_tray = entry.*.parent.*.parent_tray;
    menu.*.parent_entry = entry;
    menu.*.internal = @ptrCast(@alignCast(menu_dbus));
    entry_dbus.*.sub_menu = menu;
    menu_dbus.*.array_representation = null;
    return menu;
}
pub export fn GetTraySubmenu(entry: [*c]SDL_TrayEntry) [*c]SDL_TrayMenu {
    @setEvalBranchQuota(100000);
    var entry_dbus: [*c]SDL_TrayEntryDBus = undefined;
    _ = &entry_dbus;
    entry_dbus = @ptrCast(@alignCast(entry.*.internal));
    return entry_dbus.*.sub_menu;
}
pub export fn TrayRightClickHandler(_: [*c]SDL_ListNode, udata: ?*anyopaque) bool {
    @setEvalBranchQuota(100000);
    var tray: [*c]SDL_Tray = @ptrCast(@alignCast(udata));
    _ = &tray;
    var tray_dbus: [*c]SDL_TrayDBus = @ptrCast(@alignCast(tray.*.internal));
    _ = &tray_dbus;
    return tray_dbus.*.r_cb.?(tray_dbus.*.udata, tray);
}
pub export fn TraySendNewMenu(tray: [*c]SDL_Tray, new_path: [*c]const u8) void {
    @setEvalBranchQuota(100000);
    var driver: [*c]SDL_TrayDriverDBus = undefined;
    _ = &driver;
    var tray_dbus: [*c]SDL_TrayDBus = undefined;
    _ = &tray_dbus;
    var menu_dbus: [*c]SDL_TrayMenuDBus = undefined;
    _ = &menu_dbus;
    var signal: ?*DBusMessage = undefined;
    _ = &signal;
    tray_dbus = @ptrCast(@alignCast(tray.*.internal));
    driver = @ptrCast(@alignCast(tray.*.driver.*.internal));
    menu_dbus = @ptrCast(@alignCast(tray.*.menu.*.internal));
    driver.*.dbus.*.connection_flush.?(tray_dbus.*.connection);
    signal = driver.*.dbus.*.message_new_signal.?("/StatusNotifierItem", "org.freedesktop.DBus.Properties", "PropertiesChanged");
    if (signal != null) {
        var iter: DBusMessageIter = undefined;
        _ = &iter;
        var dict: DBusMessageIter = undefined;
        _ = &dict;
        var ientry: DBusMessageIter = undefined;
        _ = &ientry;
        var value: DBusMessageIter = undefined;
        _ = &value;
        var iface: [*c]const u8 = undefined;
        _ = &iface;
        var prop: [*c]const u8 = undefined;
        _ = &prop;
        var path: [*c]const u8 = undefined;
        _ = &path;
        var bool_val: dbus_bool_t = undefined;
        _ = &bool_val;
        iface = "org.kde.StatusNotifierItem";
        prop = "Menu";
        if (new_path != null) {
            path = blk: {
                const tmp = new_path;
                menu_dbus.*.menu_path = tmp;
                break :blk tmp;
            };
        } else {
            path = menu_dbus.*.menu_path;
        }
        bool_val = TRUE;
        driver.*.dbus.*.message_iter_init_append.?(signal, &iter);
        _ = driver.*.dbus.*.message_iter_append_basic.?(&iter, @as(c_int, 's'), @ptrCast(@alignCast(&iface)));
        _ = driver.*.dbus.*.message_iter_open_container.?(&iter, @as(c_int, 'a'), "{sv}", &dict);
        _ = driver.*.dbus.*.message_iter_open_container.?(&dict, @as(c_int, 'e'), null, &ientry);
        _ = driver.*.dbus.*.message_iter_append_basic.?(&ientry, @as(c_int, 's'), @ptrCast(@alignCast(&prop)));
        _ = driver.*.dbus.*.message_iter_open_container.?(&ientry, @as(c_int, 'v'), "o", &value);
        _ = driver.*.dbus.*.message_iter_append_basic.?(&value, @as(c_int, 'o'), @ptrCast(@alignCast(&path)));
        _ = driver.*.dbus.*.message_iter_close_container.?(&ientry, &value);
        _ = driver.*.dbus.*.message_iter_close_container.?(&dict, &ientry);
        prop = "ItemIsMenu";
        _ = driver.*.dbus.*.message_iter_open_container.?(&dict, @as(c_int, 'e'), null, &ientry);
        _ = driver.*.dbus.*.message_iter_append_basic.?(&ientry, @as(c_int, 's'), @ptrCast(@alignCast(&prop)));
        _ = driver.*.dbus.*.message_iter_open_container.?(&ientry, @as(c_int, 'v'), "b", &value);
        _ = driver.*.dbus.*.message_iter_append_basic.?(&value, @as(c_int, 'b'), @ptrCast(@alignCast(&bool_val)));
        _ = driver.*.dbus.*.message_iter_close_container.?(&ientry, &value);
        _ = driver.*.dbus.*.message_iter_close_container.?(&dict, &ientry);
        _ = driver.*.dbus.*.message_iter_close_container.?(&iter, &dict);
        _ = driver.*.dbus.*.message_iter_open_container.?(&iter, @as(c_int, 'a'), "s", &dict);
        _ = driver.*.dbus.*.message_iter_close_container.?(&iter, &dict);
        _ = driver.*.dbus.*.connection_send.?(tray_dbus.*.connection, signal, null);
        driver.*.dbus.*.connection_flush.?(tray_dbus.*.connection);
        driver.*.dbus.*.message_unref.?(signal);
    }
    signal = driver.*.dbus.*.message_new_signal.?("/StatusNotifierItem", "org.kde.StatusNotifierItem", "NewMenu");
    if (signal != null) {
        _ = driver.*.dbus.*.connection_send.?(tray_dbus.*.connection, signal, null);
        driver.*.dbus.*.connection_flush.?(tray_dbus.*.connection);
        driver.*.dbus.*.message_unref.?(signal);
    }
    driver.*.dbus.*.connection_flush.?(tray_dbus.*.connection);
}
pub export fn TrayNewMenuOnMenuUpdateCallback(_: [*c]SDL_ListNode, path: [*c]const u8, cbdata: ?*anyopaque) void {
    @setEvalBranchQuota(100000);
    TraySendNewMenu(@ptrCast(@alignCast(cbdata)), path);
}
pub export fn InsertTrayEntryAt(menu: [*c]SDL_TrayMenu, pos: c_int, label: [*c]const u8, flags: SDL_TrayEntryFlags) [*c]SDL_TrayEntry {
    @setEvalBranchQuota(100000);
    var tray: [*c]SDL_Tray = undefined;
    _ = &tray;
    var driver: [*c]SDL_TrayDriverDBus = undefined;
    _ = &driver;
    var menu_dbus: [*c]SDL_TrayMenuDBus = undefined;
    _ = &menu_dbus;
    var tray_dbus: [*c]SDL_TrayDBus = undefined;
    _ = &tray_dbus;
    var entry: [*c]SDL_TrayEntry = undefined;
    _ = &entry;
    var entry_dbus: [*c]SDL_TrayEntryDBus = undefined;
    _ = &entry_dbus;
    var update: bool = undefined;
    _ = &update;
    tray = menu.*.parent_tray;
    menu_dbus = @ptrCast(@alignCast(menu.*.internal));
    tray_dbus = @ptrCast(@alignCast(tray.*.internal));
    driver = @ptrCast(@alignCast(tray.*.driver.*.internal));
    entry_dbus = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(SDL_TrayEntryDBus))));
    if (!(entry_dbus != null)) {
        _ = SDL_SetError_REAL("Unable to create tray entry: allocation failure!");
        return null;
    }
    entry = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(SDL_TrayEntry))));
    if (!(entry != null)) {
        SDL_free_REAL(@ptrCast(@alignCast(entry_dbus)));
        _ = SDL_SetError_REAL("Unable to create tray entry: allocation failure!");
        return null;
    }
    entry.*.parent = menu;
    entry.*.internal = @ptrCast(@alignCast(entry_dbus));
    entry_dbus.*.item = SDL_DBus_CreateMenuItem();
    entry_dbus.*.item.*.utf8 = label;
    if (!(label != null)) {
        entry_dbus.*.item.*.type = SDL_MENU_ITEM_TYPE_SEPERATOR;
    } else if ((flags & SDL_TRAYENTRY_CHECKBOX) != 0) {
        entry_dbus.*.item.*.type = SDL_MENU_ITEM_TYPE_CHECKBOX;
    } else {
        entry_dbus.*.item.*.type = SDL_MENU_ITEM_TYPE_NORMAL;
    }
    entry_dbus.*.item.*.flags = SDL_MENU_ITEM_FLAGS_NONE;
    entry_dbus.*.item.*.cb_data = null;
    entry_dbus.*.item.*.cb = null;
    entry_dbus.*.item.*.sub_menu = null;
    entry_dbus.*.item.*.udata = @ptrCast(@alignCast(entry));
    entry_dbus.*.sub_menu = null;
    if (menu_dbus.*.menu != null) {
        update = @"true" != 0;
    } else {
        update = @"false" != 0;
    }
    if (menu.*.parent_entry != null) {
        update = @"true" != 0;
    }
    _ = SDL_ListInsertAtPosition(&menu_dbus.*.menu, pos, @ptrCast(@alignCast(entry_dbus.*.item)));
    if (menu.*.parent_entry != null) {
        var parent_entry_dbus: [*c]SDL_TrayEntryDBus = undefined;
        _ = &parent_entry_dbus;
        parent_entry_dbus = @ptrCast(@alignCast(menu.*.parent_entry.*.internal));
        parent_entry_dbus.*.item.*.sub_menu = menu_dbus.*.menu;
    }
    if (update) {
        var main_menu_dbus: [*c]SDL_TrayMenuDBus = undefined;
        _ = &main_menu_dbus;
        main_menu_dbus = @ptrCast(@alignCast(tray.*.menu.*.internal));
        SDL_DBus_UpdateMenu(driver.*.dbus, tray_dbus.*.connection, main_menu_dbus.*.menu, main_menu_dbus.*.menu_path, TrayNewMenuOnMenuUpdateCallback, @ptrCast(@alignCast(tray)), SDL_DBUS_UPDATE_MENU_FLAGS_NONE);
    } else {
        menu_dbus.*.menu_path = SDL_DBus_ExportMenu(driver.*.dbus, tray_dbus.*.connection, menu_dbus.*.menu);
        if (menu_dbus.*.menu_path != null) {
            TraySendNewMenu(tray, null);
        }
    }
    if (((menu.*.parent_tray != null) and !(menu.*.parent_entry != null)) and (tray_dbus.*.r_cb != null)) {
        SDL_DBus_RegisterMenuOpenCallback(menu_dbus.*.menu, TrayRightClickHandler, @ptrCast(@alignCast(tray)));
    }
    return entry;
}
pub export fn GetTrayEntries(menu: [*c]SDL_TrayMenu, count: [*c]c_int) [*c][*c]SDL_TrayEntry {
    @setEvalBranchQuota(100000);
    var array_representation: [*c][*c]SDL_TrayEntry = undefined;
    _ = &array_representation;
    var menu_dbus: [*c]SDL_TrayMenuDBus = undefined;
    _ = &menu_dbus;
    var cursor: [*c]SDL_ListNode = undefined;
    _ = &cursor;
    var sz: c_int = undefined;
    _ = &sz;
    var i: c_int = undefined;
    _ = &i;
    menu_dbus = @ptrCast(@alignCast(menu.*.internal));
    SDL_free_REAL(@ptrCast(@alignCast(menu_dbus.*.array_representation)));
    sz = SDL_ListCountEntries(&menu_dbus.*.menu);
    array_representation = @ptrCast(@alignCast(SDL_calloc_REAL(@bitCast(@as(c_long, sz + @as(c_int, 1))), @sizeOf([*c]SDL_TrayEntry))));
    if (!(array_representation != null)) {
        _ = SDL_SetError_REAL("Memory allocation failure!");
        return null;
    }
    i = 0;
    cursor = menu_dbus.*.menu;
    while (cursor != null) {
        var item: [*c]SDL_MenuItem = undefined;
        _ = &item;
        item = @ptrCast(@alignCast(cursor.*.entry));
        array_representation[@bitCast(@as(isize, @intCast(i)))] = @ptrCast(@alignCast(item.*.udata));
        cursor = cursor.*.next;
        i += 1;
    }
    array_representation[@bitCast(@as(isize, @intCast(sz)))] = null;
    count.* = sz;
    return array_representation;
}
pub export fn RemoveTrayEntry(entry: [*c]SDL_TrayEntry) void {
    @setEvalBranchQuota(100000);
    var entry_dbus: [*c]SDL_TrayEntryDBus = undefined;
    _ = &entry_dbus;
    var menu_dbus: [*c]SDL_TrayMenuDBus = undefined;
    _ = &menu_dbus;
    var tray: [*c]SDL_Tray = undefined;
    _ = &tray;
    var driver: [*c]SDL_TrayDriverDBus = undefined;
    _ = &driver;
    var tray_dbus: [*c]SDL_TrayDBus = undefined;
    _ = &tray_dbus;
    var main_menu_dbus: [*c]SDL_TrayMenuDBus = undefined;
    _ = &main_menu_dbus;
    var old_path: [*c]const u8 = undefined;
    _ = &old_path;
    tray = entry.*.parent.*.parent_tray;
    tray_dbus = @ptrCast(@alignCast(tray.*.internal));
    driver = @ptrCast(@alignCast(tray.*.driver.*.internal));
    entry_dbus = @ptrCast(@alignCast(entry.*.internal));
    menu_dbus = @ptrCast(@alignCast(entry.*.parent.*.internal));
    main_menu_dbus = @ptrCast(@alignCast(tray.*.menu.*.internal));
    tray_dbus.*.block = @"true" != 0;
    if ((menu_dbus.*.menu.*.entry == @as(?*anyopaque, @ptrCast(@alignCast(entry_dbus.*.item)))) and (menu_dbus.*.menu.*.next != null)) {
        SDL_DBus_TransferMenuItemProperties(entry_dbus.*.item, @ptrCast(@alignCast(menu_dbus.*.menu.*.next.*.entry)));
    }
    old_path = null;
    if (!(main_menu_dbus.*.menu.*.next != null)) {
        old_path = main_menu_dbus.*.menu_path;
    }
    driver.*.dbus.*.connection_flush.?(tray_dbus.*.connection);
    DestroyMenu(entry_dbus.*.sub_menu);
    SDL_ListRemove(&menu_dbus.*.menu, @ptrCast(@alignCast(entry_dbus.*.item)));
    SDL_free_REAL(@ptrCast(@alignCast(entry_dbus.*.item)));
    SDL_free_REAL(@ptrCast(@alignCast(entry_dbus)));
    SDL_free_REAL(@ptrCast(@alignCast(entry)));
    if (old_path != null) {
        SDL_DBus_RetractMenu(driver.*.dbus, tray_dbus.*.connection, &main_menu_dbus.*.menu_path);
    }
    SDL_DBus_UpdateMenu(driver.*.dbus, tray_dbus.*.connection, main_menu_dbus.*.menu, main_menu_dbus.*.menu_path, TrayNewMenuOnMenuUpdateCallback, @ptrCast(@alignCast(tray)), SDL_DBUS_UPDATE_MENU_FLAGS_NONE);
    driver.*.dbus.*.connection_flush.?(tray_dbus.*.connection);
    tray_dbus.*.block = @"false" != 0;
}
pub export fn EntryCallback(item: [*c]SDL_MenuItem, udata: ?*anyopaque) void {
    @setEvalBranchQuota(100000);
    var entry_cb: SDL_TrayCallback = undefined;
    _ = &entry_cb;
    entry_cb = @ptrCast(@alignCast(item.*.udata2));
    entry_cb.?(udata, @ptrCast(@alignCast(item.*.udata)));
}
pub export fn SetTrayEntryCallback(entry: [*c]SDL_TrayEntry, callback: SDL_TrayCallback, userdata: ?*anyopaque) void {
    @setEvalBranchQuota(100000);
    var entry_dbus: [*c]SDL_TrayEntryDBus = undefined;
    _ = &entry_dbus;
    var tray: [*c]SDL_Tray = undefined;
    _ = &tray;
    var driver: [*c]SDL_TrayDriverDBus = undefined;
    _ = &driver;
    var tray_dbus: [*c]SDL_TrayDBus = undefined;
    _ = &tray_dbus;
    var main_menu_dbus: [*c]SDL_TrayMenuDBus = undefined;
    _ = &main_menu_dbus;
    tray = entry.*.parent.*.parent_tray;
    tray_dbus = @ptrCast(@alignCast(tray.*.internal));
    driver = @ptrCast(@alignCast(tray.*.driver.*.internal));
    entry_dbus = @ptrCast(@alignCast(entry.*.internal));
    main_menu_dbus = @ptrCast(@alignCast(tray.*.menu.*.internal));
    entry_dbus.*.item.*.cb = EntryCallback;
    entry_dbus.*.item.*.cb_data = userdata;
    entry_dbus.*.item.*.udata2 = @ptrCast(@alignCast(@constCast(callback)));
    SDL_DBus_UpdateMenu(driver.*.dbus, tray_dbus.*.connection, main_menu_dbus.*.menu, main_menu_dbus.*.menu_path, TrayNewMenuOnMenuUpdateCallback, @ptrCast(@alignCast(tray)), SDL_DBUS_UPDATE_MENU_FLAGS_NONE);
}
pub export fn SetTrayEntryLabel(entry: [*c]SDL_TrayEntry, label: [*c]const u8) void {
    @setEvalBranchQuota(100000);
    var entry_dbus: [*c]SDL_TrayEntryDBus = undefined;
    _ = &entry_dbus;
    var tray: [*c]SDL_Tray = undefined;
    _ = &tray;
    var driver: [*c]SDL_TrayDriverDBus = undefined;
    _ = &driver;
    var tray_dbus: [*c]SDL_TrayDBus = undefined;
    _ = &tray_dbus;
    var main_menu_dbus: [*c]SDL_TrayMenuDBus = undefined;
    _ = &main_menu_dbus;
    tray = entry.*.parent.*.parent_tray;
    tray_dbus = @ptrCast(@alignCast(tray.*.internal));
    driver = @ptrCast(@alignCast(tray.*.driver.*.internal));
    entry_dbus = @ptrCast(@alignCast(entry.*.internal));
    main_menu_dbus = @ptrCast(@alignCast(tray.*.menu.*.internal));
    entry_dbus.*.item.*.utf8 = label;
    SDL_DBus_UpdateMenu(driver.*.dbus, tray_dbus.*.connection, main_menu_dbus.*.menu, main_menu_dbus.*.menu_path, TrayNewMenuOnMenuUpdateCallback, @ptrCast(@alignCast(tray)), SDL_DBUS_UPDATE_MENU_FLAGS_NONE);
}
pub export fn GetTrayEntryLabel(entry: [*c]SDL_TrayEntry) [*c]const u8 {
    @setEvalBranchQuota(100000);
    return @as([*c]SDL_TrayEntryDBus, @ptrCast(@alignCast(entry.*.internal))).*.item.*.utf8;
}
pub export fn SetTrayEntryChecked(entry: [*c]SDL_TrayEntry, val: bool) void {
    @setEvalBranchQuota(100000);
    var entry_dbus: [*c]SDL_TrayEntryDBus = undefined;
    _ = &entry_dbus;
    var tray: [*c]SDL_Tray = undefined;
    _ = &tray;
    var driver: [*c]SDL_TrayDriverDBus = undefined;
    _ = &driver;
    var tray_dbus: [*c]SDL_TrayDBus = undefined;
    _ = &tray_dbus;
    var main_menu_dbus: [*c]SDL_TrayMenuDBus = undefined;
    _ = &main_menu_dbus;
    tray = entry.*.parent.*.parent_tray;
    tray_dbus = @ptrCast(@alignCast(tray.*.internal));
    driver = @ptrCast(@alignCast(tray.*.driver.*.internal));
    entry_dbus = @ptrCast(@alignCast(entry.*.internal));
    main_menu_dbus = @ptrCast(@alignCast(tray.*.menu.*.internal));
    if (val) {
        entry_dbus.*.item.*.flags |= SDL_MENU_ITEM_FLAGS_CHECKED;
    } else {
        entry_dbus.*.item.*.flags &= @bitCast(~SDL_MENU_ITEM_FLAGS_CHECKED);
    }
    SDL_DBus_UpdateMenu(driver.*.dbus, tray_dbus.*.connection, main_menu_dbus.*.menu, main_menu_dbus.*.menu_path, TrayNewMenuOnMenuUpdateCallback, @ptrCast(@alignCast(tray)), SDL_DBUS_UPDATE_MENU_FLAGS_NONE);
}
pub export fn GetTrayEntryChecked(entry: [*c]SDL_TrayEntry) bool {
    @setEvalBranchQuota(100000);
    return (@as([*c]SDL_TrayEntryDBus, @ptrCast(@alignCast(entry.*.internal))).*.item.*.flags & @as(SDL_MenuItemFlags, SDL_MENU_ITEM_FLAGS_CHECKED)) != 0;
}
pub export fn SetTrayEntryEnabled(entry: [*c]SDL_TrayEntry, val: bool) void {
    @setEvalBranchQuota(100000);
    var entry_dbus: [*c]SDL_TrayEntryDBus = undefined;
    _ = &entry_dbus;
    var tray: [*c]SDL_Tray = undefined;
    _ = &tray;
    var driver: [*c]SDL_TrayDriverDBus = undefined;
    _ = &driver;
    var tray_dbus: [*c]SDL_TrayDBus = undefined;
    _ = &tray_dbus;
    var main_menu_dbus: [*c]SDL_TrayMenuDBus = undefined;
    _ = &main_menu_dbus;
    tray = entry.*.parent.*.parent_tray;
    tray_dbus = @ptrCast(@alignCast(tray.*.internal));
    driver = @ptrCast(@alignCast(tray.*.driver.*.internal));
    entry_dbus = @ptrCast(@alignCast(entry.*.internal));
    main_menu_dbus = @ptrCast(@alignCast(tray.*.menu.*.internal));
    if (!val) {
        entry_dbus.*.item.*.flags |= SDL_MENU_ITEM_FLAGS_DISABLED;
    } else {
        entry_dbus.*.item.*.flags &= @bitCast(~SDL_MENU_ITEM_FLAGS_DISABLED);
    }
    SDL_DBus_UpdateMenu(driver.*.dbus, tray_dbus.*.connection, main_menu_dbus.*.menu, main_menu_dbus.*.menu_path, TrayNewMenuOnMenuUpdateCallback, @ptrCast(@alignCast(tray)), SDL_DBUS_UPDATE_MENU_FLAGS_NONE);
}
pub export fn GetTrayEntryEnabled(entry: [*c]SDL_TrayEntry) bool {
    @setEvalBranchQuota(100000);
    return !((@as([*c]SDL_TrayEntryDBus, @ptrCast(@alignCast(entry.*.internal))).*.item.*.flags & @as(SDL_MenuItemFlags, SDL_MENU_ITEM_FLAGS_DISABLED)) != 0);
}
pub export fn ClickTrayEntry(entry: [*c]SDL_TrayEntry) void {
    @setEvalBranchQuota(100000);
    var dbus_entry: [*c]SDL_TrayEntryDBus = undefined;
    _ = &dbus_entry;
    var entry_cb: SDL_TrayCallback = undefined;
    _ = &entry_cb;
    dbus_entry = @ptrCast(@alignCast(entry.*.internal));
    if (dbus_entry.*.item.*.type == @as(SDL_MenuItemType, SDL_MENU_ITEM_TYPE_CHECKBOX)) {
        var tray: [*c]SDL_Tray = undefined;
        _ = &tray;
        var driver: [*c]SDL_TrayDriverDBus = undefined;
        _ = &driver;
        var tray_dbus: [*c]SDL_TrayDBus = undefined;
        _ = &tray_dbus;
        var main_menu_dbus: [*c]SDL_TrayMenuDBus = undefined;
        _ = &main_menu_dbus;
        tray = entry.*.parent.*.parent_tray;
        tray_dbus = @ptrCast(@alignCast(tray.*.internal));
        driver = @ptrCast(@alignCast(tray.*.driver.*.internal));
        main_menu_dbus = @ptrCast(@alignCast(tray.*.menu.*.internal));
        dbus_entry.*.item.*.flags ^= SDL_MENU_ITEM_FLAGS_CHECKED;
        SDL_DBus_UpdateMenu(driver.*.dbus, tray_dbus.*.connection, main_menu_dbus.*.menu, main_menu_dbus.*.menu_path, TrayNewMenuOnMenuUpdateCallback, @ptrCast(@alignCast(tray)), SDL_DBUS_UPDATE_MENU_FLAGS_NONE);
    }
    entry_cb = @ptrCast(@alignCast(dbus_entry.*.item.*.udata2));
    entry_cb.?(dbus_entry.*.item.*.cb_data, @ptrCast(@alignCast(dbus_entry.*.item.*.udata)));
}
pub export fn SDL_Tray_CreateDBusDriver() [*c]SDL_TrayDriver {
    @setEvalBranchQuota(100000);
    var dbus_driver: [*c]SDL_TrayDriverDBus = undefined;
    _ = &dbus_driver;
    var driver: [*c]SDL_TrayDriver = undefined;
    _ = &driver;
    var ctx: [*c]SDL_DBusContext = undefined;
    _ = &ctx;
    var saved: ?*DBusMessage = undefined;
    _ = &saved;
    var paths: [*c][*c]u8 = undefined;
    _ = &paths;
    var count: c_int = undefined;
    _ = &count;
    var i: c_int = undefined;
    _ = &i;
    var sni_supported: bool = undefined;
    _ = &sni_supported;
    SDL_DBus_Init();
    ctx = SDL_DBus_GetContext();
    if (!(ctx != null)) {
        return null;
    }
    sni_supported = @"false" != 0;
    paths = null;
    count = 0;
    if (SDL_DBus_CallMethod(&saved, "org.freedesktop.DBus", "/org/freedesktop/DBus", "org.freedesktop.DBus", "ListNames", @as(c_int, '\x00'), @as(c_int, 'a'), @as(c_int, 's'), &paths, &count, @as(c_int, '\x00'))) {
        SDL_DBus_FreeReply(&saved);
        if (paths != null) {
            var watcher_found: bool = undefined;
            _ = &watcher_found;
            watcher_found = @"false" != 0;
            {
                i = 0;
                while (i < count) : (i += 1) {
                    if (!(SDL_strcmp_REAL(paths[@bitCast(@as(isize, @intCast(i)))], "org.kde.StatusNotifierWatcher") != 0)) {
                        watcher_found = @"true" != 0;
                    }
                }
            }
            ctx.*.free_string_array.?(paths);
            if (watcher_found) {
                var host_registered: dbus_bool_t = undefined;
                _ = &host_registered;
                host_registered = FALSE;
                _ = SDL_DBus_QueryProperty(&saved, "org.kde.StatusNotifierWatcher", "/StatusNotifierWatcher", "org.kde.StatusNotifierWatcher", "IsStatusNotifierHostRegistered", @as(c_int, 'b'), @ptrCast(@alignCast(&host_registered)));
                SDL_DBus_FreeReply(&saved);
                if (host_registered != 0) {
                    sni_supported = @"true" != 0;
                }
            }
        }
    }
    if (!sni_supported) {
        _ = SDL_SetError_REAL("Unable to create tray: no SNI support!");
        SDL_DBus_Quit();
        return null;
    }
    dbus_driver = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(SDL_TrayDriverDBus))));
    if (!(dbus_driver != null)) {
        return null;
    }
    driver = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(SDL_TrayDriver))));
    if (!(driver != null)) {
        SDL_free_REAL(@ptrCast(@alignCast(dbus_driver)));
        return null;
    }
    dbus_driver.*.dbus = ctx;
    driver.*.internal = @ptrCast(@alignCast(dbus_driver));
    driver.*.name = "dbus";
    driver.*.count = 0;
    driver.*.CreateTray = CreateTray;
    driver.*.DestroyTray = DestroyTray;
    driver.*.UpdateTray = UpdateTray;
    driver.*.SetTrayIcon = SetTrayIcon;
    driver.*.SetTrayTooltip = SetTrayTooltip;
    driver.*.CreateTrayMenu = CreateTrayMenu;
    driver.*.InsertTrayEntryAt = InsertTrayEntryAt;
    driver.*.CreateTraySubmenu = CreateTraySubmenu;
    driver.*.GetTraySubmenu = GetTraySubmenu;
    driver.*.GetTrayEntries = GetTrayEntries;
    driver.*.RemoveTrayEntry = RemoveTrayEntry;
    driver.*.SetTrayEntryCallback = SetTrayEntryCallback;
    driver.*.SetTrayEntryLabel = SetTrayEntryLabel;
    driver.*.GetTrayEntryLabel = GetTrayEntryLabel;
    driver.*.SetTrayEntryChecked = SetTrayEntryChecked;
    driver.*.GetTrayEntryChecked = GetTrayEntryChecked;
    driver.*.SetTrayEntryEnabled = SetTrayEntryEnabled;
    driver.*.GetTrayEntryEnabled = GetTrayEntryEnabled;
    driver.*.ClickTrayEntry = ClickTrayEntry;
    driver.*.DestroyDriver = DestroyDriver;
    return driver;
}

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_NS_PER_US = @as(c_int, 1000);
pub const SDL_TRAYENTRY_CHECKBOX = @as(c_uint, 0x00000002);
pub const TRUE = @as(c_int, 1);
pub const FALSE = @as(c_int, 0);
pub const DBUS_NAME_FLAG_REPLACE_EXISTING = @as(c_int, 0x2);
pub const DBUS_REQUEST_NAME_REPLY_PRIMARY_OWNER = @as(c_int, 1);
pub const SDL_DBUS_UPDATE_MENU_FLAGS_NONE = @as(c_int, 0);
