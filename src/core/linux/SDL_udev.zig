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
pub const dev_t = __dev_t;
pub const struct_timespec = extern struct {
    tv_sec: __time_t = 0,
    tv_nsec: __syscall_slong_t = 0,
};
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Sint64 = i64;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_strlcpy_REAL(dst: [*c]u8, src: [*c]const u8, maxlen: usize) usize;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_strrchr_REAL(str: [*c]const u8, c: c_int) [*c]u8;
pub extern fn SDL_strcasestr_REAL(haystack: [*c]const u8, needle: [*c]const u8) [*c]u8;
pub extern fn SDL_strtol_REAL(str: [*c]const u8, endp: [*c][*c]u8, base: c_int) c_long;
pub extern fn SDL_strtoul_REAL(str: [*c]const u8, endp: [*c][*c]u8, base: c_int) c_ulong;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
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
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const struct_SDL_SharedObject = opaque {
};
pub const SDL_SharedObject = struct_SDL_SharedObject;
pub extern fn SDL_LoadObject_REAL(sofile: [*c]const u8) ?*SDL_SharedObject;
pub extern fn SDL_LoadFunction_REAL(handle: ?*SDL_SharedObject, name: [*c]const u8) SDL_FunctionPointer;
pub extern fn SDL_UnloadObject_REAL(handle: ?*SDL_SharedObject) void;
pub const struct_udev = opaque {
};
pub extern fn udev_unref(udev: ?*struct_udev) ?*struct_udev;
pub extern fn udev_new() ?*struct_udev;
pub const struct_udev_list_entry = opaque {
};
pub extern fn udev_list_entry_get_next(list_entry: ?*struct_udev_list_entry) ?*struct_udev_list_entry;
pub extern fn udev_list_entry_get_name(list_entry: ?*struct_udev_list_entry) [*c]const u8;
pub extern fn udev_list_entry_get_value(list_entry: ?*struct_udev_list_entry) [*c]const u8;
pub const struct_udev_device = opaque {
};
pub extern fn udev_device_unref(udev_device: ?*struct_udev_device) ?*struct_udev_device;
pub extern fn udev_device_new_from_syspath(udev: ?*struct_udev, syspath: [*c]const u8) ?*struct_udev_device;
pub extern fn udev_device_new_from_devnum(udev: ?*struct_udev, @"type": u8, devnum: dev_t) ?*struct_udev_device;
pub extern fn udev_device_get_parent_with_subsystem_devtype(udev_device: ?*struct_udev_device, subsystem: [*c]const u8, devtype: [*c]const u8) ?*struct_udev_device;
pub extern fn udev_device_get_subsystem(udev_device: ?*struct_udev_device) [*c]const u8;
pub extern fn udev_device_get_syspath(udev_device: ?*struct_udev_device) [*c]const u8;
pub extern fn udev_device_get_devnode(udev_device: ?*struct_udev_device) [*c]const u8;
pub extern fn udev_device_get_property_value(udev_device: ?*struct_udev_device, key: [*c]const u8) [*c]const u8;
pub extern fn udev_device_get_driver(udev_device: ?*struct_udev_device) [*c]const u8;
pub extern fn udev_device_get_devnum(udev_device: ?*struct_udev_device) dev_t;
pub extern fn udev_device_get_action(udev_device: ?*struct_udev_device) [*c]const u8;
pub extern fn udev_device_get_sysattr_value(udev_device: ?*struct_udev_device, sysattr: [*c]const u8) [*c]const u8;
pub const struct_udev_monitor = opaque {
};
pub extern fn udev_monitor_unref(udev_monitor: ?*struct_udev_monitor) ?*struct_udev_monitor;
pub extern fn udev_monitor_new_from_netlink(udev: ?*struct_udev, name: [*c]const u8) ?*struct_udev_monitor;
pub extern fn udev_monitor_enable_receiving(udev_monitor: ?*struct_udev_monitor) c_int;
pub extern fn udev_monitor_get_fd(udev_monitor: ?*struct_udev_monitor) c_int;
pub extern fn udev_monitor_receive_device(udev_monitor: ?*struct_udev_monitor) ?*struct_udev_device;
pub extern fn udev_monitor_filter_add_match_subsystem_devtype(udev_monitor: ?*struct_udev_monitor, subsystem: [*c]const u8, devtype: [*c]const u8) c_int;
pub const struct_udev_enumerate = opaque {
};
pub extern fn udev_enumerate_unref(udev_enumerate: ?*struct_udev_enumerate) ?*struct_udev_enumerate;
pub extern fn udev_enumerate_new(udev: ?*struct_udev) ?*struct_udev_enumerate;
pub extern fn udev_enumerate_add_match_subsystem(udev_enumerate: ?*struct_udev_enumerate, subsystem: [*c]const u8) c_int;
pub extern fn udev_enumerate_add_match_property(udev_enumerate: ?*struct_udev_enumerate, property: [*c]const u8, value: [*c]const u8) c_int;
pub extern fn udev_enumerate_scan_devices(udev_enumerate: ?*struct_udev_enumerate) c_int;
pub extern fn udev_enumerate_get_list_entry(udev_enumerate: ?*struct_udev_enumerate) ?*struct_udev_list_entry;
pub const struct_udev_hwdb = opaque {
};
pub extern fn udev_hwdb_new(udev: ?*struct_udev) ?*struct_udev_hwdb;
pub extern fn udev_hwdb_unref(hwdb: ?*struct_udev_hwdb) ?*struct_udev_hwdb;
pub extern fn udev_hwdb_get_properties_list_entry(hwdb: ?*struct_udev_hwdb, modalias: [*c]const u8, flags: c_uint) ?*struct_udev_list_entry;
pub const __u16 = c_ushort;
pub const struct_input_id = extern struct {
    bustype: __u16 = 0,
    vendor: __u16 = 0,
    product: __u16 = 0,
    version: __u16 = 0,
};
pub const SDL_UDEV_DEVICEADDED: c_int = 1;
pub const SDL_UDEV_DEVICEREMOVED: c_int = 2;
pub const SDL_UDEV_deviceevent = c_uint;
pub const SDL_UDEV_Callback = ?*const fn (udev_type: SDL_UDEV_deviceevent, udev_class: c_int, devpath: [*c]const u8) callconv(.c) void;
pub const struct_SDL_UDEV_CallbackList = extern struct {
    callback: SDL_UDEV_Callback = null,
    next: [*c]struct_SDL_UDEV_CallbackList = null,
};
pub const SDL_UDEV_CallbackList = struct_SDL_UDEV_CallbackList;
pub const struct_SDL_UDEV_Symbols = extern struct {
    udev_device_get_action: ?*const fn (?*struct_udev_device) callconv(.c) [*c]const u8 = null,
    udev_device_get_devnode: ?*const fn (?*struct_udev_device) callconv(.c) [*c]const u8 = null,
    udev_device_get_driver: ?*const fn (?*struct_udev_device) callconv(.c) [*c]const u8 = null,
    udev_device_get_syspath: ?*const fn (?*struct_udev_device) callconv(.c) [*c]const u8 = null,
    udev_device_get_subsystem: ?*const fn (?*struct_udev_device) callconv(.c) [*c]const u8 = null,
    udev_device_get_parent_with_subsystem_devtype: ?*const fn (udev_device: ?*struct_udev_device, subsystem: [*c]const u8, devtype: [*c]const u8) callconv(.c) ?*struct_udev_device = null,
    udev_device_get_property_value: ?*const fn (?*struct_udev_device, [*c]const u8) callconv(.c) [*c]const u8 = null,
    udev_device_get_sysattr_value: ?*const fn (udev_device: ?*struct_udev_device, sysattr: [*c]const u8) callconv(.c) [*c]const u8 = null,
    udev_device_new_from_syspath: ?*const fn (?*struct_udev, [*c]const u8) callconv(.c) ?*struct_udev_device = null,
    udev_device_unref: ?*const fn (?*struct_udev_device) callconv(.c) ?*struct_udev_device = null,
    udev_enumerate_add_match_property: ?*const fn (?*struct_udev_enumerate, [*c]const u8, [*c]const u8) callconv(.c) c_int = null,
    udev_enumerate_add_match_subsystem: ?*const fn (?*struct_udev_enumerate, [*c]const u8) callconv(.c) c_int = null,
    udev_enumerate_get_list_entry: ?*const fn (?*struct_udev_enumerate) callconv(.c) ?*struct_udev_list_entry = null,
    udev_enumerate_new: ?*const fn (?*struct_udev) callconv(.c) ?*struct_udev_enumerate = null,
    udev_enumerate_scan_devices: ?*const fn (?*struct_udev_enumerate) callconv(.c) c_int = null,
    udev_enumerate_unref: ?*const fn (?*struct_udev_enumerate) callconv(.c) ?*struct_udev_enumerate = null,
    udev_list_entry_get_name: ?*const fn (?*struct_udev_list_entry) callconv(.c) [*c]const u8 = null,
    udev_list_entry_get_value: ?*const fn (?*struct_udev_list_entry) callconv(.c) [*c]const u8 = null,
    udev_list_entry_get_next: ?*const fn (?*struct_udev_list_entry) callconv(.c) ?*struct_udev_list_entry = null,
    udev_monitor_enable_receiving: ?*const fn (?*struct_udev_monitor) callconv(.c) c_int = null,
    udev_monitor_filter_add_match_subsystem_devtype: ?*const fn (?*struct_udev_monitor, [*c]const u8, [*c]const u8) callconv(.c) c_int = null,
    udev_monitor_get_fd: ?*const fn (?*struct_udev_monitor) callconv(.c) c_int = null,
    udev_monitor_new_from_netlink: ?*const fn (?*struct_udev, [*c]const u8) callconv(.c) ?*struct_udev_monitor = null,
    udev_monitor_receive_device: ?*const fn (?*struct_udev_monitor) callconv(.c) ?*struct_udev_device = null,
    udev_monitor_unref: ?*const fn (?*struct_udev_monitor) callconv(.c) ?*struct_udev_monitor = null,
    udev_new: ?*const fn () callconv(.c) ?*struct_udev = null,
    udev_unref: ?*const fn (?*struct_udev) callconv(.c) ?*struct_udev = null,
    udev_device_new_from_devnum: ?*const fn (udev: ?*struct_udev, @"type": u8, devnum: dev_t) callconv(.c) ?*struct_udev_device = null,
    udev_device_get_devnum: ?*const fn (udev_device: ?*struct_udev_device) callconv(.c) dev_t = null,
    udev_hwdb_new: ?*const fn (udev: ?*struct_udev) callconv(.c) ?*struct_udev_hwdb = null,
    udev_hwdb_unref: ?*const fn (hwdb: ?*struct_udev_hwdb) callconv(.c) ?*struct_udev_hwdb = null,
    udev_hwdb_get_properties_list_entry: ?*const fn (hwdb: ?*struct_udev_hwdb, modalias: [*c]const u8, flags: c_uint) callconv(.c) ?*struct_udev_list_entry = null,
};
pub const SDL_UDEV_Symbols = struct_SDL_UDEV_Symbols;
pub const struct_SDL_UDEV_PrivateData = extern struct {
    udev_library: [*c]const u8 = null,
    udev_handle: ?*SDL_SharedObject = null,
    udev: ?*struct_udev = null,
    udev_mon: ?*struct_udev_monitor = null,
    ref_count: c_int = 0,
    first: [*c]SDL_UDEV_CallbackList = null,
    last: [*c]SDL_UDEV_CallbackList = null,
    syms: SDL_UDEV_Symbols = @import("std").mem.zeroes(SDL_UDEV_Symbols),
};
pub const SDL_UDEV_PrivateData = struct_SDL_UDEV_PrivateData;
pub export fn SDL_UDEV_Init() bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _this = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(_this.*)))));
        if (!(_this != null)) {
            return @"false" != 0;
        }
        if (!SDL_UDEV_LoadLibrary()) {
            SDL_UDEV_Quit();
            return @"false" != 0;
        }
        _this.*.udev = _this.*.syms.udev_new.?();
        if (!(_this.*.udev != null)) {
            SDL_UDEV_Quit();
            return SDL_SetError_REAL("udev_new() failed");
        }
        _this.*.udev_mon = _this.*.syms.udev_monitor_new_from_netlink.?(_this.*.udev, "udev");
        if (!(_this.*.udev_mon != null)) {
            SDL_UDEV_Quit();
            return SDL_SetError_REAL("udev_monitor_new_from_netlink() failed");
        }
        _ = _this.*.syms.udev_monitor_filter_add_match_subsystem_devtype.?(_this.*.udev_mon, "input", null);
        _ = _this.*.syms.udev_monitor_filter_add_match_subsystem_devtype.?(_this.*.udev_mon, "sound", null);
        _ = _this.*.syms.udev_monitor_filter_add_match_subsystem_devtype.?(_this.*.udev_mon, "video4linux", null);
        _ = _this.*.syms.udev_monitor_enable_receiving.?(_this.*.udev_mon);
        _ = SDL_UDEV_Scan();
    }
    _this.*.ref_count += 1;
    return @"true" != 0;
}
pub export fn SDL_UDEV_Quit() void {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        return;
    }
    _this.*.ref_count -= 1;
    if (_this.*.ref_count < @as(c_int, 1)) {
        if (_this.*.udev_mon != null) {
            _ = _this.*.syms.udev_monitor_unref.?(_this.*.udev_mon);
            _this.*.udev_mon = null;
        }
        if (_this.*.udev != null) {
            _ = _this.*.syms.udev_unref.?(_this.*.udev);
            _this.*.udev = null;
        }
        while (_this.*.first != null) {
            var item: [*c]SDL_UDEV_CallbackList = _this.*.first;
            _ = &item;
            _this.*.first = _this.*.first.*.next;
            SDL_free_REAL(@ptrCast(@alignCast(item)));
        }
        SDL_UDEV_UnloadLibrary();
        SDL_free_REAL(@ptrCast(@alignCast(_this)));
        _this = null;
    }
}
pub export fn SDL_UDEV_UnloadLibrary() void {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        return;
    }
    if (_this.*.udev_handle != null) {
        SDL_UnloadObject_REAL(_this.*.udev_handle);
        _this.*.udev_handle = null;
    }
}
pub export fn SDL_UDEV_LoadLibrary() bool {
    @setEvalBranchQuota(100000);
    var result: bool = @"true" != 0;
    _ = &result;
    if (!(_this != null)) {
        return SDL_SetError_REAL("UDEV not initialized");
    }
    if (SDL_UDEV_load_syms()) {
        return @"true" != 0;
    }
    if (!(_this.*.udev_handle != null)) {
        _this.*.udev_handle = SDL_LoadObject_REAL("libudev.so.1");
        if (_this.*.udev_handle != null) {
            result = SDL_UDEV_load_syms();
            if (!result) {
                SDL_UDEV_UnloadLibrary();
            }
        }
    }
    if (!(_this.*.udev_handle != null)) {
        {
            var i: c_int = 0;
            _ = &i;
            while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(SDL_UDEV_LIBS)) / @sizeOf(@TypeOf(SDL_UDEV_LIBS[@as(c_int, 0)])))) : (i += 1) {
                _this.*.udev_handle = SDL_LoadObject_REAL(SDL_UDEV_LIBS[@bitCast(@as(isize, @intCast(i)))]);
                if (_this.*.udev_handle != null) {
                    result = SDL_UDEV_load_syms();
                    if (!result) {
                        SDL_UDEV_UnloadLibrary();
                    } else {
                        break;
                    }
                }
            }
        }
        if (!(_this.*.udev_handle != null)) {
            result = @"false" != 0;
        }
    }
    return result;
}
pub export fn SDL_UDEV_Poll() void {
    @setEvalBranchQuota(100000);
    var dev: ?*struct_udev_device = null;
    _ = &dev;
    var action: [*c]const u8 = null;
    _ = &action;
    if (!(_this != null)) {
        return;
    }
    while (SDL_UDEV_hotplug_update_available()) {
        dev = _this.*.syms.udev_monitor_receive_device.?(_this.*.udev_mon);
        if (!(dev != null)) {
            break;
        }
        action = _this.*.syms.udev_device_get_action.?(dev);
        if (action != null) {
            if (SDL_strcmp_REAL(action, "add") == @as(c_int, 0)) {
                device_event(SDL_UDEV_DEVICEADDED, dev);
            } else if (SDL_strcmp_REAL(action, "remove") == @as(c_int, 0)) {
                device_event(SDL_UDEV_DEVICEREMOVED, dev);
            }
        }
        _ = _this.*.syms.udev_device_unref.?(dev);
    }
}
pub export fn SDL_UDEV_Scan() bool {
    @setEvalBranchQuota(100000);
    var enumerate: ?*struct_udev_enumerate = null;
    _ = &enumerate;
    var devs: ?*struct_udev_list_entry = null;
    _ = &devs;
    var item: ?*struct_udev_list_entry = null;
    _ = &item;
    if (!(_this != null)) {
        return @"true" != 0;
    }
    enumerate = _this.*.syms.udev_enumerate_new.?(_this.*.udev);
    if (!(enumerate != null)) {
        SDL_UDEV_Quit();
        return SDL_SetError_REAL("udev_enumerate_new() failed");
    }
    _ = _this.*.syms.udev_enumerate_add_match_subsystem.?(enumerate, "input");
    _ = _this.*.syms.udev_enumerate_add_match_subsystem.?(enumerate, "sound");
    _ = _this.*.syms.udev_enumerate_add_match_subsystem.?(enumerate, "video4linux");
    _ = _this.*.syms.udev_enumerate_scan_devices.?(enumerate);
    devs = _this.*.syms.udev_enumerate_get_list_entry.?(enumerate);
    {
        item = devs;
        while (item != null) : (item = _this.*.syms.udev_list_entry_get_next.?(item)) {
            var path: [*c]const u8 = _this.*.syms.udev_list_entry_get_name.?(item);
            _ = &path;
            var dev: ?*struct_udev_device = _this.*.syms.udev_device_new_from_syspath.?(_this.*.udev, path);
            _ = &dev;
            if (dev != null) {
                device_event(SDL_UDEV_DEVICEADDED, dev);
                _ = _this.*.syms.udev_device_unref.?(dev);
            }
        }
    }
    _ = _this.*.syms.udev_enumerate_unref.?(enumerate);
    return @"true" != 0;
}
pub export fn SDL_UDEV_GetProductInfo(device_path: [*c]const u8, inpid: [*c]struct_input_id, class: [*c]c_int, driver: [*c][*c]u8) bool {
    @setEvalBranchQuota(100000);
    var statbuf: struct_stat = undefined;
    _ = &statbuf;
    var @"type": u8 = undefined;
    _ = &@"type";
    var dev: ?*struct_udev_device = undefined;
    _ = &dev;
    var val: [*c]const u8 = undefined;
    _ = &val;
    var class_temp: c_int = undefined;
    _ = &class_temp;
    if (!(_this != null)) {
        return @"false" != 0;
    }
    if (stat(device_path, &statbuf) < @as(c_int, 0)) {
        return @"false" != 0;
    }
    if ((statbuf.st_mode & @as(__mode_t, __S_IFMT)) == @as(__mode_t, @bitCast(@as(c_int, __S_IFBLK)))) {
        @"type" = 'b';
    } else if ((statbuf.st_mode & @as(__mode_t, __S_IFMT)) == @as(__mode_t, @bitCast(@as(c_int, __S_IFCHR)))) {
        @"type" = 'c';
    } else {
        return @"false" != 0;
    }
    dev = _this.*.syms.udev_device_new_from_devnum.?(_this.*.udev, @"type", statbuf.st_rdev);
    if (!(dev != null)) {
        return @"false" != 0;
    }
    val = _this.*.syms.udev_device_get_property_value.?(dev, "ID_VENDOR_ID");
    if (val != null) {
        inpid.*.vendor = @bitCast(@as(c_short, @truncate(SDL_strtol_REAL(val, null, 16))));
    }
    val = _this.*.syms.udev_device_get_property_value.?(dev, "ID_MODEL_ID");
    if (val != null) {
        inpid.*.product = @bitCast(@as(c_short, @truncate(SDL_strtol_REAL(val, null, 16))));
    }
    val = _this.*.syms.udev_device_get_property_value.?(dev, "ID_REVISION");
    if (val != null) {
        inpid.*.version = @bitCast(@as(c_short, @truncate(SDL_strtol_REAL(val, null, 16))));
    }
    if (driver != null) {
        val = _this.*.syms.udev_device_get_driver.?(dev);
        if (!(val != null)) {
            val = _this.*.syms.udev_device_get_property_value.?(dev, "ID_USB_DRIVER");
        }
        if (val != null) {
            driver.* = SDL_strdup_REAL(val);
        }
    }
    class_temp = device_class(dev);
    if (class_temp != 0) {
        class.* = class_temp;
    }
    _ = _this.*.syms.udev_device_unref.?(dev);
    return @"true" != 0;
}
pub export fn SDL_UDEV_GetProductSerial(device_path: [*c]const u8) [*c]u8 {
    @setEvalBranchQuota(100000);
    var statbuf: struct_stat = undefined;
    _ = &statbuf;
    var @"type": u8 = undefined;
    _ = &@"type";
    var dev: ?*struct_udev_device = undefined;
    _ = &dev;
    var val: [*c]const u8 = undefined;
    _ = &val;
    var result: [*c]u8 = null;
    _ = &result;
    if (!(_this != null)) {
        return null;
    }
    if (stat(device_path, &statbuf) < @as(c_int, 0)) {
        return null;
    }
    if ((statbuf.st_mode & @as(__mode_t, __S_IFMT)) == @as(__mode_t, @bitCast(@as(c_int, __S_IFBLK)))) {
        @"type" = 'b';
    } else if ((statbuf.st_mode & @as(__mode_t, __S_IFMT)) == @as(__mode_t, @bitCast(@as(c_int, __S_IFCHR)))) {
        @"type" = 'c';
    } else {
        return null;
    }
    dev = _this.*.syms.udev_device_new_from_devnum.?(_this.*.udev, @"type", statbuf.st_rdev);
    if (!(dev != null)) {
        return null;
    }
    val = _this.*.syms.udev_device_get_property_value.?(dev, "ID_SERIAL_SHORT");
    if ((val != null) and (@as(c_int, val.*) != 0)) {
        result = SDL_strdup_REAL(val);
    }
    _ = _this.*.syms.udev_device_unref.?(dev);
    return result;
}
pub export fn SDL_UDEV_AddCallback(cb: SDL_UDEV_Callback) bool {
    @setEvalBranchQuota(100000);
    var item: [*c]SDL_UDEV_CallbackList = undefined;
    _ = &item;
    item = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(SDL_UDEV_CallbackList))));
    if (!(item != null)) {
        return @"false" != 0;
    }
    item.*.callback = cb;
    if (!(_this.*.last != null)) {
        _this.*.first = blk: {
            const tmp = item;
            _this.*.last = tmp;
            break :blk tmp;
        };
    } else {
        _this.*.last.*.next = item;
        _this.*.last = item;
    }
    return @"true" != 0;
}
pub export fn SDL_UDEV_DelCallback(cb: SDL_UDEV_Callback) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [20:0]u8 = "SDL_UDEV_DelCallback".*;
    };
    _ = &static_local___func__;
    var item: [*c]SDL_UDEV_CallbackList = undefined;
    _ = &item;
    var prev: [*c]SDL_UDEV_CallbackList = null;
    _ = &prev;
    if (!(_this != null)) {
        return;
    }
    {
        item = _this.*.first;
        while (item != null) : (item = item.*.next) {
            if (item.*.callback == cb) {
                if (prev != null) {
                    prev.*.next = item.*.next;
                } else {
                    while (true) {
                        while (!(_this.*.first == item)) {
                            const static_local_sdl_assert_data = struct {
                                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                    .always_ignore = @"false" != 0,
                                    .trigger_count = 0,
                                    .condition = "_this->first == item",
                                    .filename = null,
                                    .linenum = 0,
                                    .function = null,
                                    .next = null,
                                };
                            };
                            _ = &static_local_sdl_assert_data;
                            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_udev.c", 662);
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
                    _this.*.first = item.*.next;
                }
                if (item == _this.*.last) {
                    _this.*.last = prev;
                }
                SDL_free_REAL(@ptrCast(@alignCast(item)));
                return;
            }
            prev = item;
        }
    }
}
pub export fn SDL_UDEV_GetUdevSyms() [*c]const SDL_UDEV_Symbols {
    @setEvalBranchQuota(100000);
    if (!SDL_UDEV_Init()) {
        _ = SDL_SetError_REAL("Could not initialize UDEV");
        return null;
    }
    return &_this.*.syms;
}
pub export fn SDL_UDEV_ReleaseUdevSyms() void {
    @setEvalBranchQuota(100000);
    SDL_UDEV_Quit();
}

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const udev = struct_udev;
pub const udev_device = struct_udev_device;
pub const udev_monitor = struct_udev_monitor;
pub const udev_enumerate = struct_udev_enumerate;
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
pub const SDL_UDEV_DEVICE_MOUSE: c_int = 1;
pub const SDL_UDEV_DEVICE_KEYBOARD: c_int = 2;
pub const SDL_UDEV_DEVICE_JOYSTICK: c_int = 4;
pub const SDL_UDEV_DEVICE_SOUND: c_int = 8;
pub const SDL_UDEV_DEVICE_TOUCHSCREEN: c_int = 16;
pub const SDL_UDEV_DEVICE_ACCELEROMETER: c_int = 32;
pub const SDL_UDEV_DEVICE_HAS_KEYS: c_int = 128;
pub const SDL_UDEV_DEVICE_VIDEO_CAPTURE: c_int = 256;
pub extern fn SDL_EVDEV_GuessDeviceClass(bitmask_props: [*c]const c_ulong, bitmask_ev: [*c]const c_ulong, bitmask_abs: [*c]const c_ulong, bitmask_key: [*c]const c_ulong, bitmask_rel: [*c]const c_ulong) c_int;
pub extern fn SDL_IOReady(fd: c_int, flags: c_int, timeoutNS: Sint64) c_int;
pub var SDL_UDEV_LIBS: [2][*c]const u8 = [2][*c]const u8{
    "libudev.so.1",
    "libudev.so.0",
};
pub var _this: [*c]SDL_UDEV_PrivateData = null;
pub fn SDL_UDEV_load_sym(arg_fn: [*c]const u8, addr: [*c]?*anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var @"fn" = arg_fn;
    _ = &@"fn";
    addr.* = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(_this.*.udev_handle, @"fn"))));
    if (!(addr.* != null)) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn SDL_UDEV_load_syms() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (!SDL_UDEV_load_sym("udev_device_get_action", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&_this.*.syms.udev_device_get_action))))))) return @"false" != 0;
    if (!SDL_UDEV_load_sym("udev_device_get_devnode", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&_this.*.syms.udev_device_get_devnode))))))) return @"false" != 0;
    if (!SDL_UDEV_load_sym("udev_device_get_driver", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&_this.*.syms.udev_device_get_driver))))))) return @"false" != 0;
    if (!SDL_UDEV_load_sym("udev_device_get_syspath", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&_this.*.syms.udev_device_get_syspath))))))) return @"false" != 0;
    if (!SDL_UDEV_load_sym("udev_device_get_subsystem", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&_this.*.syms.udev_device_get_subsystem))))))) return @"false" != 0;
    if (!SDL_UDEV_load_sym("udev_device_get_parent_with_subsystem_devtype", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&_this.*.syms.udev_device_get_parent_with_subsystem_devtype))))))) return @"false" != 0;
    if (!SDL_UDEV_load_sym("udev_device_get_property_value", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&_this.*.syms.udev_device_get_property_value))))))) return @"false" != 0;
    if (!SDL_UDEV_load_sym("udev_device_get_sysattr_value", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&_this.*.syms.udev_device_get_sysattr_value))))))) return @"false" != 0;
    if (!SDL_UDEV_load_sym("udev_device_new_from_syspath", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&_this.*.syms.udev_device_new_from_syspath))))))) return @"false" != 0;
    if (!SDL_UDEV_load_sym("udev_device_unref", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&_this.*.syms.udev_device_unref))))))) return @"false" != 0;
    if (!SDL_UDEV_load_sym("udev_enumerate_add_match_property", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&_this.*.syms.udev_enumerate_add_match_property))))))) return @"false" != 0;
    if (!SDL_UDEV_load_sym("udev_enumerate_add_match_subsystem", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&_this.*.syms.udev_enumerate_add_match_subsystem))))))) return @"false" != 0;
    if (!SDL_UDEV_load_sym("udev_enumerate_get_list_entry", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&_this.*.syms.udev_enumerate_get_list_entry))))))) return @"false" != 0;
    if (!SDL_UDEV_load_sym("udev_enumerate_new", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&_this.*.syms.udev_enumerate_new))))))) return @"false" != 0;
    if (!SDL_UDEV_load_sym("udev_enumerate_scan_devices", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&_this.*.syms.udev_enumerate_scan_devices))))))) return @"false" != 0;
    if (!SDL_UDEV_load_sym("udev_enumerate_unref", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&_this.*.syms.udev_enumerate_unref))))))) return @"false" != 0;
    if (!SDL_UDEV_load_sym("udev_list_entry_get_name", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&_this.*.syms.udev_list_entry_get_name))))))) return @"false" != 0;
    if (!SDL_UDEV_load_sym("udev_list_entry_get_value", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&_this.*.syms.udev_list_entry_get_value))))))) return @"false" != 0;
    if (!SDL_UDEV_load_sym("udev_list_entry_get_next", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&_this.*.syms.udev_list_entry_get_next))))))) return @"false" != 0;
    if (!SDL_UDEV_load_sym("udev_monitor_enable_receiving", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&_this.*.syms.udev_monitor_enable_receiving))))))) return @"false" != 0;
    if (!SDL_UDEV_load_sym("udev_monitor_filter_add_match_subsystem_devtype", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&_this.*.syms.udev_monitor_filter_add_match_subsystem_devtype))))))) return @"false" != 0;
    if (!SDL_UDEV_load_sym("udev_monitor_get_fd", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&_this.*.syms.udev_monitor_get_fd))))))) return @"false" != 0;
    if (!SDL_UDEV_load_sym("udev_monitor_new_from_netlink", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&_this.*.syms.udev_monitor_new_from_netlink))))))) return @"false" != 0;
    if (!SDL_UDEV_load_sym("udev_monitor_receive_device", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&_this.*.syms.udev_monitor_receive_device))))))) return @"false" != 0;
    if (!SDL_UDEV_load_sym("udev_monitor_unref", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&_this.*.syms.udev_monitor_unref))))))) return @"false" != 0;
    if (!SDL_UDEV_load_sym("udev_new", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&_this.*.syms.udev_new))))))) return @"false" != 0;
    if (!SDL_UDEV_load_sym("udev_unref", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&_this.*.syms.udev_unref))))))) return @"false" != 0;
    if (!SDL_UDEV_load_sym("udev_device_new_from_devnum", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&_this.*.syms.udev_device_new_from_devnum))))))) return @"false" != 0;
    if (!SDL_UDEV_load_sym("udev_device_get_devnum", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&_this.*.syms.udev_device_get_devnum))))))) return @"false" != 0;
    _ = SDL_UDEV_load_sym("udev_hwdb_new", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&_this.*.syms.udev_hwdb_new))))));
    _ = SDL_UDEV_load_sym("udev_hwdb_unref", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&_this.*.syms.udev_hwdb_unref))))));
    _ = SDL_UDEV_load_sym("udev_hwdb_get_properties_list_entry", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&_this.*.syms.udev_hwdb_get_properties_list_entry))))));
    return @"true" != 0;
}
pub fn SDL_UDEV_hotplug_update_available() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (_this.*.udev_mon != null) {
        const fd: c_int = _this.*.syms.udev_monitor_get_fd.?(_this.*.udev_mon);
        _ = &fd;
        if (SDL_IOReady(fd, SDL_IOR_READ, 0) != 0) {
            return @"true" != 0;
        }
    }
    return @"false" != 0;
}
pub fn get_caps(_: ?*struct_udev_device, pdev: ?*struct_udev_device, attr: [*c]const u8, bitmask: [*c]c_ulong, bitmask_len: usize) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var value: [*c]const u8 = undefined;
    _ = &value;
    var text: [4096]u8 = undefined;
    _ = &text;
    var word: [*c]u8 = undefined;
    _ = &word;
    var i: c_int = undefined;
    _ = &i;
    var v: c_ulong = undefined;
    _ = &v;
    _ = memset(@ptrCast(@alignCast(bitmask)), 0, bitmask_len *% @sizeOf(@TypeOf(bitmask.*)));
    value = _this.*.syms.udev_device_get_sysattr_value.?(pdev, attr);
    if (!(value != null)) {
        return;
    }
    _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&text)), value, @sizeOf(@TypeOf(text)));
    i = 0;
    while (@as(?*anyopaque, @ptrCast(@alignCast(blk: {
        const tmp = SDL_strrchr_REAL(@ptrCast(@alignCast(&text)), ' ');
        word = tmp;
        break :blk tmp;
    }))) != @as(?*anyopaque, null)) {
        v = SDL_strtoul_REAL(word + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1))))), null, 16);
        if (@as(usize, @bitCast(@as(c_long, i))) < bitmask_len) {
            bitmask[@bitCast(@as(isize, @intCast(i)))] = v;
        }
        i += 1;
        word.* = '\x00';
    }
    v = SDL_strtoul_REAL(@ptrCast(@alignCast(&text)), null, 16);
    if (@as(usize, @bitCast(@as(c_long, i))) < bitmask_len) {
        bitmask[@bitCast(@as(isize, @intCast(i)))] = v;
    }
}
pub fn guess_device_class(dev: ?*struct_udev_device) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var pdev: ?*struct_udev_device = undefined;
    _ = &pdev;
    var bitmask_props: [1]c_ulong = undefined;
    _ = &bitmask_props;
    var bitmask_ev: [1]c_ulong = undefined;
    _ = &bitmask_ev;
    var bitmask_abs: [1]c_ulong = undefined;
    _ = &bitmask_abs;
    var bitmask_key: [12]c_ulong = undefined;
    _ = &bitmask_key;
    var bitmask_rel: [1]c_ulong = undefined;
    _ = &bitmask_rel;
    pdev = dev;
    while ((pdev != null) and !(_this.*.syms.udev_device_get_sysattr_value.?(pdev, "capabilities/ev") != null)) {
        pdev = _this.*.syms.udev_device_get_parent_with_subsystem_devtype.?(pdev, "input", null);
    }
    if (!(pdev != null)) {
        return 0;
    }
    get_caps(dev, pdev, "properties", @ptrCast(@alignCast(&bitmask_props)), @sizeOf(@TypeOf(bitmask_props)) / @sizeOf(@TypeOf(bitmask_props[@as(c_int, 0)])));
    get_caps(dev, pdev, "capabilities/ev", @ptrCast(@alignCast(&bitmask_ev)), @sizeOf(@TypeOf(bitmask_ev)) / @sizeOf(@TypeOf(bitmask_ev[@as(c_int, 0)])));
    get_caps(dev, pdev, "capabilities/abs", @ptrCast(@alignCast(&bitmask_abs)), @sizeOf(@TypeOf(bitmask_abs)) / @sizeOf(@TypeOf(bitmask_abs[@as(c_int, 0)])));
    get_caps(dev, pdev, "capabilities/rel", @ptrCast(@alignCast(&bitmask_rel)), @sizeOf(@TypeOf(bitmask_rel)) / @sizeOf(@TypeOf(bitmask_rel[@as(c_int, 0)])));
    get_caps(dev, pdev, "capabilities/key", @ptrCast(@alignCast(&bitmask_key)), @sizeOf(@TypeOf(bitmask_key)) / @sizeOf(@TypeOf(bitmask_key[@as(c_int, 0)])));
    return SDL_EVDEV_GuessDeviceClass(&bitmask_props[@as(c_int, 0)], &bitmask_ev[@as(c_int, 0)], &bitmask_abs[@as(c_int, 0)], &bitmask_key[@as(c_int, 0)], &bitmask_rel[@as(c_int, 0)]);
}
pub fn device_class(dev: ?*struct_udev_device) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var subsystem: [*c]const u8 = undefined;
    _ = &subsystem;
    var val: [*c]const u8 = null;
    _ = &val;
    var attr: [*c]const u8 = null;
    _ = &attr;
    var devclass: c_int = 0;
    _ = &devclass;
    subsystem = _this.*.syms.udev_device_get_subsystem.?(dev);
    if (!(subsystem != null)) {
        return 0;
    }
    if (SDL_strcmp_REAL(subsystem, "sound") == @as(c_int, 0)) {
        devclass = SDL_UDEV_DEVICE_SOUND;
    } else if (SDL_strcmp_REAL(subsystem, "video4linux") == @as(c_int, 0)) {
        val = _this.*.syms.udev_device_get_property_value.?(dev, "ID_V4L_CAPABILITIES");
        if (val != null) {
            if (SDL_strcasestr_REAL(val, "capture") != null) {
                devclass = SDL_UDEV_DEVICE_VIDEO_CAPTURE;
            } else if (SDL_strcasestr_REAL(val, "video_output") != null) {
                attr = _this.*.syms.udev_device_get_sysattr_value.?(dev, "state");
                if ((attr != null) and (SDL_strcmp_REAL(attr, "capture") == @as(c_int, 0))) {
                    devclass = SDL_UDEV_DEVICE_VIDEO_CAPTURE;
                }
            }
        }
    } else if (SDL_strcmp_REAL(subsystem, "input") == @as(c_int, 0)) {
        val = _this.*.syms.udev_device_get_property_value.?(dev, "ID_INPUT_JOYSTICK");
        if ((val != null) and (SDL_strcmp_REAL(val, "1") == @as(c_int, 0))) {
            devclass |= SDL_UDEV_DEVICE_JOYSTICK;
        }
        val = _this.*.syms.udev_device_get_property_value.?(dev, "ID_INPUT_ACCELEROMETER");
        if ((val != null) and (SDL_strcmp_REAL(val, "1") == @as(c_int, 0))) {
            devclass |= SDL_UDEV_DEVICE_ACCELEROMETER;
        }
        val = _this.*.syms.udev_device_get_property_value.?(dev, "ID_INPUT_MOUSE");
        if ((val != null) and (SDL_strcmp_REAL(val, "1") == @as(c_int, 0))) {
            devclass |= SDL_UDEV_DEVICE_MOUSE;
        }
        val = _this.*.syms.udev_device_get_property_value.?(dev, "ID_INPUT_TOUCHSCREEN");
        if ((val != null) and (SDL_strcmp_REAL(val, "1") == @as(c_int, 0))) {
            devclass |= SDL_UDEV_DEVICE_TOUCHSCREEN;
        }
        val = _this.*.syms.udev_device_get_property_value.?(dev, "ID_INPUT_KEY");
        if ((val != null) and (SDL_strcmp_REAL(val, "1") == @as(c_int, 0))) {
            devclass |= SDL_UDEV_DEVICE_HAS_KEYS;
        }
        val = _this.*.syms.udev_device_get_property_value.?(dev, "ID_INPUT_KEYBOARD");
        if ((val != null) and (SDL_strcmp_REAL(val, "1") == @as(c_int, 0))) {
            devclass |= SDL_UDEV_DEVICE_KEYBOARD;
        }
        if (devclass == @as(c_int, 0)) {
            val = _this.*.syms.udev_device_get_property_value.?(dev, "ID_CLASS");
            if (val != null) {
                if (SDL_strcmp_REAL(val, "joystick") == @as(c_int, 0)) {
                    devclass = SDL_UDEV_DEVICE_JOYSTICK;
                } else if (SDL_strcmp_REAL(val, "mouse") == @as(c_int, 0)) {
                    devclass = SDL_UDEV_DEVICE_MOUSE;
                } else if (SDL_strcmp_REAL(val, "kbd") == @as(c_int, 0)) {
                    devclass = SDL_UDEV_DEVICE_HAS_KEYS | SDL_UDEV_DEVICE_KEYBOARD;
                }
            } else {
                devclass = guess_device_class(dev);
            }
        }
    }
    return devclass;
}
pub fn device_event(arg_type: SDL_UDEV_deviceevent, dev: ?*struct_udev_device) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var devclass: c_int = 0;
    _ = &devclass;
    var path: [*c]const u8 = undefined;
    _ = &path;
    var item: [*c]SDL_UDEV_CallbackList = undefined;
    _ = &item;
    path = _this.*.syms.udev_device_get_devnode.?(dev);
    if (!(path != null)) {
        return;
    }
    if (@"type" == @as(SDL_UDEV_deviceevent, SDL_UDEV_DEVICEADDED)) {
        devclass = device_class(dev);
        if (!(devclass != 0)) {
            return;
        }
    } else {}
    {
        item = _this.*.first;
        while (item != null) : (item = item.*.next) {
            item.*.callback.?(@"type", devclass, path);
        }
    }
}
pub const __S_IFMT = __helpers.promoteIntLiteral(c_int, 0o170000, .octal);
pub const __S_IFCHR = @as(c_int, 0o020000);
pub const __S_IFBLK = @as(c_int, 0o060000);
pub const SDL_IOR_READ = @as(c_int, 0x1);
