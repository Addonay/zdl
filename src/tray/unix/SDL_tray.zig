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
pub const Uint32 = u32;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
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
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_PropertiesID = Uint32;
pub extern fn SDL_CreateProperties_REAL() SDL_PropertiesID;
pub extern fn SDL_SetPointerProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: ?*anyopaque) bool;
pub extern fn SDL_SetStringProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: [*c]const u8) bool;
pub extern fn SDL_DestroyProperties_REAL(props: SDL_PropertiesID) void;
pub const struct_SDL_Surface = opaque {
};
pub const SDL_Surface = struct_SDL_Surface;
pub extern fn SDL_IsMainThread_REAL() bool;
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
    SetTrayIcon: ?*const fn ([*c]SDL_Tray, ?*SDL_Surface) callconv(.c) void = null,
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
pub const SDL_OBJECT_TYPE_TRAY: c_int = 11;
pub const SDL_ObjectType = c_uint;
pub extern fn SDL_FindObject(object: ?*anyopaque, @"type": SDL_ObjectType) bool;
pub extern fn SDL_GetObjects(@"type": SDL_ObjectType, objects: [*c]?*anyopaque, count: c_int) c_int;
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
pub extern fn SDL_RegisterTray(tray: [*c]SDL_Tray) void;
pub extern fn SDL_UnregisterTray(tray: [*c]SDL_Tray) void;
pub extern fn SDL_GetActiveTrayCount() c_int;
pub extern fn SDL_Tray_CreateDBusDriver() [*c]SDL_TrayDriver;
pub var driver: [*c]SDL_TrayDriver = null;
pub export fn SDL_UpdateTrays_REAL() void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [20:0]u8 = "SDL_UpdateTrays_REAL".*;
    };
    _ = &static_local___func__;
    var trays: [*c][*c]SDL_Tray = undefined;
    _ = &trays;
    var active_trays: c_int = undefined;
    _ = &active_trays;
    var count: c_int = undefined;
    _ = &count;
    var i: c_int = undefined;
    _ = &i;
    active_trays = SDL_GetActiveTrayCount();
    if (!(active_trays != 0)) {
        return;
    }
    trays = @ptrCast(@alignCast(SDL_calloc_REAL(@bitCast(@as(c_long, active_trays)), @sizeOf([*c]SDL_Tray))));
    if (!(trays != null)) {
        return;
    }
    count = SDL_GetObjects(SDL_OBJECT_TYPE_TRAY, @ptrCast(@alignCast(trays)), active_trays);
    while (true) {
        while (!(count == active_trays)) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "count == active_trays",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_tray.c", 47);
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
    {
        i = 0;
        while (i < count) : (i += 1) {
            if (trays[@bitCast(@as(isize, @intCast(i)))] != null) {
                if (SDL_ObjectValid(@ptrCast(@alignCast(trays[@bitCast(@as(isize, @intCast(i)))])), SDL_OBJECT_TYPE_TRAY)) {
                    trays[@bitCast(@as(isize, @intCast(i)))].*.driver.*.UpdateTray.?(trays[@bitCast(@as(isize, @intCast(i)))]);
                }
            }
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(trays)));
}
pub export fn SDL_CreateTrayWithProperties_REAL(props: SDL_PropertiesID) [*c]SDL_Tray {
    @setEvalBranchQuota(100000);
    var tray: [*c]SDL_Tray = undefined;
    _ = &tray;
    if (!SDL_IsMainThread_REAL()) {
        _ = SDL_SetError_REAL("This function should be called on the main thread");
        return null;
    }
    if (!(driver != null)) {
        driver = SDL_Tray_CreateDBusDriver();
    }
    if (driver != null) {
        tray = driver.*.CreateTray.?(driver, props);
        if (tray != null) {
            SDL_RegisterTray(tray);
        }
    } else {
        tray = null;
    }
    return tray;
}
pub export fn SDL_CreateTray_REAL(icon: ?*SDL_Surface, tooltip: [*c]const u8) [*c]SDL_Tray {
    @setEvalBranchQuota(100000);
    var tray: [*c]SDL_Tray = undefined;
    _ = &tray;
    var props: SDL_PropertiesID = undefined;
    _ = &props;
    props = SDL_CreateProperties_REAL();
    if (!(props != 0)) {
        return null;
    }
    if (icon != null) {
        _ = SDL_SetPointerProperty_REAL(props, "SDL.tray.create.icon", @ptrCast(@alignCast(icon)));
    }
    if (tooltip != null) {
        _ = SDL_SetStringProperty_REAL(props, "SDL.tray.create.tooltip", tooltip);
    }
    tray = SDL_CreateTrayWithProperties_REAL(props);
    SDL_DestroyProperties_REAL(props);
    return tray;
}
pub export fn SDL_SetTrayIcon_REAL(tray: [*c]SDL_Tray, icon: ?*SDL_Surface) void {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(tray)), SDL_OBJECT_TYPE_TRAY)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("tray"))));
        return;
    }
    tray.*.driver.*.SetTrayIcon.?(tray, icon);
}
pub export fn SDL_SetTrayTooltip_REAL(tray: [*c]SDL_Tray, tooltip: [*c]const u8) void {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(tray)), SDL_OBJECT_TYPE_TRAY)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("tray"))));
        return;
    }
    tray.*.driver.*.SetTrayTooltip.?(tray, tooltip);
}
pub export fn SDL_CreateTrayMenu_REAL(tray: [*c]SDL_Tray) [*c]SDL_TrayMenu {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(tray)), SDL_OBJECT_TYPE_TRAY)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("tray"))));
        return null;
    }
    return tray.*.driver.*.CreateTrayMenu.?(tray);
}
pub export fn SDL_GetTrayMenu_REAL(tray: [*c]SDL_Tray) [*c]SDL_TrayMenu {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(tray)), SDL_OBJECT_TYPE_TRAY)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("tray"))));
        return null;
    }
    return tray.*.menu;
}
pub export fn SDL_CreateTraySubmenu_REAL(entry: [*c]SDL_TrayEntry) [*c]SDL_TrayMenu {
    @setEvalBranchQuota(100000);
    if (!(entry != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("entry"))));
        return null;
    }
    return entry.*.parent.*.parent_tray.*.driver.*.CreateTraySubmenu.?(entry);
}
pub export fn SDL_GetTraySubmenu_REAL(entry: [*c]SDL_TrayEntry) [*c]SDL_TrayMenu {
    @setEvalBranchQuota(100000);
    if (!(entry != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("entry"))));
        return null;
    }
    return entry.*.parent.*.parent_tray.*.driver.*.GetTraySubmenu.?(entry);
}
pub export fn SDL_GetTrayEntries_REAL(menu: [*c]SDL_TrayMenu, count: [*c]c_int) [*c][*c]const SDL_TrayEntry {
    @setEvalBranchQuota(100000);
    if (!(menu != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("menu"))));
        return null;
    }
    if (!(count != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("count"))));
        return null;
    }
    return @ptrCast(@alignCast(menu.*.parent_tray.*.driver.*.GetTrayEntries.?(menu, count)));
}
pub export fn SDL_RemoveTrayEntry_REAL(entry: [*c]SDL_TrayEntry) void {
    @setEvalBranchQuota(100000);
    if (!(entry != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("entry"))));
        return;
    }
    entry.*.parent.*.parent_tray.*.driver.*.RemoveTrayEntry.?(entry);
}
pub export fn SDL_InsertTrayEntryAt_REAL(menu: [*c]SDL_TrayMenu, pos: c_int, label: [*c]const u8, flags: SDL_TrayEntryFlags) [*c]SDL_TrayEntry {
    @setEvalBranchQuota(100000);
    if (!(menu != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("menu"))));
        return null;
    }
    return menu.*.parent_tray.*.driver.*.InsertTrayEntryAt.?(menu, pos, label, flags);
}
pub export fn SDL_SetTrayEntryLabel_REAL(entry: [*c]SDL_TrayEntry, label: [*c]const u8) void {
    @setEvalBranchQuota(100000);
    if (!(entry != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("entry"))));
        return;
    }
    entry.*.parent.*.parent_tray.*.driver.*.SetTrayEntryLabel.?(entry, label);
}
pub export fn SDL_GetTrayEntryLabel_REAL(entry: [*c]SDL_TrayEntry) [*c]const u8 {
    @setEvalBranchQuota(100000);
    if (!(entry != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("entry"))));
        return null;
    }
    return entry.*.parent.*.parent_tray.*.driver.*.GetTrayEntryLabel.?(entry);
}
pub export fn SDL_SetTrayEntryChecked_REAL(entry: [*c]SDL_TrayEntry, checked: bool) void {
    @setEvalBranchQuota(100000);
    if (!(entry != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("entry"))));
        return;
    }
    entry.*.parent.*.parent_tray.*.driver.*.SetTrayEntryChecked.?(entry, checked);
}
pub export fn SDL_GetTrayEntryChecked_REAL(entry: [*c]SDL_TrayEntry) bool {
    @setEvalBranchQuota(100000);
    if (!(entry != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("entry"))));
        return @as(?*anyopaque, null) != null;
    }
    return entry.*.parent.*.parent_tray.*.driver.*.GetTrayEntryChecked.?(entry);
}
pub export fn SDL_SetTrayEntryEnabled_REAL(entry: [*c]SDL_TrayEntry, enabled: bool) void {
    @setEvalBranchQuota(100000);
    if (!(entry != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("entry"))));
        return;
    }
    entry.*.parent.*.parent_tray.*.driver.*.SetTrayEntryEnabled.?(entry, enabled);
}
pub export fn SDL_GetTrayEntryEnabled_REAL(entry: [*c]SDL_TrayEntry) bool {
    @setEvalBranchQuota(100000);
    if (!(entry != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("entry"))));
        return @as(?*anyopaque, null) != null;
    }
    return entry.*.parent.*.parent_tray.*.driver.*.GetTrayEntryEnabled.?(entry);
}
pub export fn SDL_SetTrayEntryCallback_REAL(entry: [*c]SDL_TrayEntry, callback: SDL_TrayCallback, userdata: ?*anyopaque) void {
    @setEvalBranchQuota(100000);
    if (!(entry != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("entry"))));
        return;
    }
    if (!(callback != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("callback"))));
        return;
    }
    entry.*.parent.*.parent_tray.*.driver.*.SetTrayEntryCallback.?(entry, callback, userdata);
}
pub export fn SDL_ClickTrayEntry_REAL(entry: [*c]SDL_TrayEntry) void {
    @setEvalBranchQuota(100000);
    if (!(entry != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("entry"))));
        return;
    }
    _ = entry.*.parent.*.parent_tray.*.driver.*.GetTrayEntryEnabled.?(entry);
}
pub export fn SDL_GetTrayEntryParent_REAL(entry: [*c]SDL_TrayEntry) [*c]SDL_TrayMenu {
    @setEvalBranchQuota(100000);
    if (!(entry != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("entry"))));
        return null;
    }
    return entry.*.parent;
}
pub export fn SDL_GetTrayMenuParentEntry_REAL(menu: [*c]SDL_TrayMenu) [*c]SDL_TrayEntry {
    @setEvalBranchQuota(100000);
    if (!(menu != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("menu"))));
        return null;
    }
    return menu.*.parent_entry;
}
pub export fn SDL_GetTrayMenuParentTray_REAL(menu: [*c]SDL_TrayMenu) [*c]SDL_Tray {
    @setEvalBranchQuota(100000);
    if (!(menu != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("menu"))));
        return null;
    }
    return menu.*.parent_tray;
}
pub export fn SDL_DestroyTray_REAL(tray: [*c]SDL_Tray) void {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(tray)), SDL_OBJECT_TYPE_TRAY)) {
        return;
    }
    SDL_UnregisterTray(tray);
    tray.*.driver.*.DestroyTray.?(tray);
    if (!(SDL_GetActiveTrayCount() != 0)) {
        driver.*.DestroyDriver.?(driver);
        driver = null;
    }
}

pub const SDL_CreateTray = SDL_CreateTray_REAL;
pub const SDL_SetTrayIcon = SDL_SetTrayIcon_REAL;
pub const SDL_SetTrayTooltip = SDL_SetTrayTooltip_REAL;
pub const SDL_CreateTrayMenu = SDL_CreateTrayMenu_REAL;
pub const SDL_CreateTraySubmenu = SDL_CreateTraySubmenu_REAL;
pub const SDL_GetTrayMenu = SDL_GetTrayMenu_REAL;
pub const SDL_GetTraySubmenu = SDL_GetTraySubmenu_REAL;
pub const SDL_GetTrayEntries = SDL_GetTrayEntries_REAL;
pub const SDL_RemoveTrayEntry = SDL_RemoveTrayEntry_REAL;
pub const SDL_InsertTrayEntryAt = SDL_InsertTrayEntryAt_REAL;
pub const SDL_SetTrayEntryLabel = SDL_SetTrayEntryLabel_REAL;
pub const SDL_GetTrayEntryLabel = SDL_GetTrayEntryLabel_REAL;
pub const SDL_SetTrayEntryChecked = SDL_SetTrayEntryChecked_REAL;
pub const SDL_GetTrayEntryChecked = SDL_GetTrayEntryChecked_REAL;
pub const SDL_SetTrayEntryEnabled = SDL_SetTrayEntryEnabled_REAL;
pub const SDL_GetTrayEntryEnabled = SDL_GetTrayEntryEnabled_REAL;
pub const SDL_SetTrayEntryCallback = SDL_SetTrayEntryCallback_REAL;
pub const SDL_DestroyTray = SDL_DestroyTray_REAL;
pub const SDL_GetTrayEntryParent = SDL_GetTrayEntryParent_REAL;
pub const SDL_GetTrayMenuParentEntry = SDL_GetTrayMenuParentEntry_REAL;
pub const SDL_GetTrayMenuParentTray = SDL_GetTrayMenuParentTray_REAL;
pub const SDL_ClickTrayEntry = SDL_ClickTrayEntry_REAL;
pub const SDL_UpdateTrays = SDL_UpdateTrays_REAL;
pub const SDL_CreateTrayWithProperties = SDL_CreateTrayWithProperties_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
