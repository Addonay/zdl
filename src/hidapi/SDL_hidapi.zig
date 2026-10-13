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
pub const __useconds_t = c_uint;
pub const __blksize_t = c_long;
pub const __blkcnt_t = c_long;
pub const __syscall_slong_t = c_long;
pub const dev_t = __dev_t;
pub const wchar_t = c_int;
pub const struct_timespec = extern struct {
    tv_sec: __time_t = 0,
    tv_nsec: __syscall_slong_t = 0,
};
pub const pthread_t = c_ulong;
pub const struct___va_list_tag_2 = extern struct {
    unnamed_0: c_uint = 0,
    unnamed_1: c_uint = 0,
    unnamed_2: ?*anyopaque = null,
    unnamed_3: ?*anyopaque = null,
};
pub const __builtin_va_list = [1]struct___va_list_tag_2;
pub const va_list = __builtin_va_list;
pub extern fn printf(noalias __format: [*c]const u8, ...) c_int;
pub extern fn snprintf(noalias __s: [*c]u8, __maxlen: usize, noalias __format: [*c]const u8, ...) c_int;
pub extern fn vsnprintf(noalias __s: [*c]u8, __maxlen: usize, noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag_2) c_int;
pub extern fn sscanf(noalias __s: [*c]const u8, noalias __format: [*c]const u8, ...) c_int;
pub extern fn strtol(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __base: c_int) c_long;
pub extern fn calloc(__nmemb: usize, __size: usize) ?*anyopaque;
pub extern fn free(__ptr: ?*anyopaque) void;
pub extern fn exit(__status: c_int) noreturn;
pub extern fn mbstowcs(noalias __pwcs: [*c]wchar_t, noalias __s: [*c]const u8, __n: usize) usize;
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memmove(__dest: ?*anyopaque, __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub extern fn strcmp(__s1: [*c]const u8, __s2: [*c]const u8) c_int;
pub extern fn strdup(__s: [*c]const u8) [*c]u8;
pub extern fn strchr(__s: [*c]const u8, __c: c_int) [*c]u8;
pub extern fn strtok_r(noalias __s: [*c]u8, noalias __delim: [*c]const u8, noalias __save_ptr: [*c][*c]u8) [*c]u8;
pub extern fn strlen(__s: [*c]const u8) usize;
pub extern fn strerror(__errnum: c_int) [*c]u8;
pub extern fn wcsncpy(noalias __dest: [*c]wchar_t, noalias __src: [*c]const wchar_t, __n: usize) [*c]wchar_t;
pub extern fn wcscmp(__s1: [*c]const wchar_t, __s2: [*c]const wchar_t) c_int;
pub extern fn wcsdup(__s: [*c]const wchar_t) [*c]wchar_t;
pub const Uint16 = u16;
pub const Sint32 = i32;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub const Uint64 = u64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_realloc_REAL(mem: ?*anyopaque, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub const SDL_realloc_func = ?*const fn (mem: ?*anyopaque, size: usize) callconv(.c) ?*anyopaque;
pub const SDL_free_func = ?*const fn (mem: ?*anyopaque) callconv(.c) void;
pub extern fn SDL_tolower_REAL(x: c_int) c_int;
pub extern fn SDL_wcslcpy_REAL(dst: [*c]wchar_t, src: [*c]const wchar_t, maxlen: usize) usize;
pub extern fn SDL_wcsdup_REAL(wstr: [*c]const wchar_t) [*c]wchar_t;
pub extern fn SDL_wcscmp_REAL(str1: [*c]const wchar_t, str2: [*c]const wchar_t) c_int;
pub extern fn SDL_strlen_REAL(str: [*c]const u8) usize;
pub extern fn SDL_strlcpy_REAL(dst: [*c]u8, src: [*c]const u8, maxlen: usize) usize;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_strcasestr_REAL(haystack: [*c]const u8, needle: [*c]const u8) [*c]u8;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_strncmp_REAL(str1: [*c]const u8, str2: [*c]const u8, maxlen: usize) c_int;
pub extern fn SDL_snprintf_REAL(text: [*c]u8, maxlen: usize, fmt: [*c]const u8, ...) c_int;
pub const struct_SDL_iconv_data_t = opaque {
};
pub const SDL_iconv_t = ?*struct_SDL_iconv_data_t;
pub extern fn SDL_iconv_open_REAL(tocode: [*c]const u8, fromcode: [*c]const u8) SDL_iconv_t;
pub extern fn SDL_iconv_close_REAL(cd: SDL_iconv_t) c_int;
pub extern fn SDL_iconv_REAL(cd: SDL_iconv_t, inbuf: [*c][*c]const u8, inbytesleft: [*c]usize, outbuf: [*c][*c]u8, outbytesleft: [*c]usize) usize;
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
pub extern fn SDL_ClearError_REAL() bool;
pub const SDL_PropertiesID = Uint32;
pub extern fn SDL_CreateProperties_REAL() SDL_PropertiesID;
pub extern fn SDL_SetPointerProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: ?*anyopaque) bool;
pub extern fn SDL_DestroyProperties_REAL(props: SDL_PropertiesID) void;
pub const SDL_ThreadID = Uint64;
pub const SYS_ThreadHandle = pthread_t;
pub const struct_SDL_ErrorInfo = extern struct {
    @"error": SDL_ErrorCode = @import("std").mem.zeroes(SDL_ErrorCode),
    str: [*c]u8 = null,
    len: usize = 0,
};
pub const SDL_ErrorInfo = struct_SDL_ErrorInfo;
pub const struct_SDL_error = extern struct {
    info: [2]SDL_ErrorInfo = @import("std").mem.zeroes([2]SDL_ErrorInfo),
    current: c_int = 0,
    realloc_func: SDL_realloc_func = null,
    free_func: SDL_free_func = null,
};
pub const SDL_error = struct_SDL_error;
pub const struct_SDL_Thread = extern struct {
    threadid: SDL_ThreadID = 0,
    handle: SYS_ThreadHandle = 0,
    status: c_int = 0,
    state: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
    errbuf: SDL_error = @import("std").mem.zeroes(SDL_error),
    name: [*c]u8 = null,
    stacksize: usize = 0,
    userfunc: ?*const fn (?*anyopaque) callconv(.c) c_int = null,
    userdata: ?*anyopaque = null,
    data: ?*anyopaque = null,
    endfunc: SDL_FunctionPointer = null,
};
pub const SDL_Thread = struct_SDL_Thread;
pub const SDL_ThreadFunction = ?*const fn (data: ?*anyopaque) callconv(.c) c_int;
pub extern fn SDL_CreateThreadRuntime_REAL(@"fn": SDL_ThreadFunction, name: [*c]const u8, data: ?*anyopaque, pfnBeginThread: SDL_FunctionPointer, pfnEndThread: SDL_FunctionPointer) [*c]SDL_Thread;
pub extern fn SDL_WaitThread_REAL(thread: [*c]SDL_Thread, status: [*c]c_int) void;
pub const struct_SDL_Mutex = opaque {
};
pub const SDL_Mutex = struct_SDL_Mutex;
pub extern fn SDL_CreateMutex_REAL() ?*SDL_Mutex;
pub extern fn SDL_LockMutex_REAL(mutex: ?*SDL_Mutex) void;
pub extern fn SDL_UnlockMutex_REAL(mutex: ?*SDL_Mutex) void;
pub extern fn SDL_DestroyMutex_REAL(mutex: ?*SDL_Mutex) void;
pub const struct_SDL_Condition = opaque {
};
pub const SDL_Condition = struct_SDL_Condition;
pub extern fn SDL_CreateCondition_REAL() ?*SDL_Condition;
pub extern fn SDL_DestroyCondition_REAL(cond: ?*SDL_Condition) void;
pub extern fn SDL_SignalCondition_REAL(cond: ?*SDL_Condition) void;
pub extern fn SDL_BroadcastCondition_REAL(cond: ?*SDL_Condition) void;
pub extern fn SDL_WaitCondition_REAL(cond: ?*SDL_Condition, mutex: ?*SDL_Mutex) void;
pub extern fn SDL_WaitConditionTimeout_REAL(cond: ?*SDL_Condition, mutex: ?*SDL_Mutex, timeoutMS: Sint32) bool;
pub const struct_hid_device_ = opaque {
};
pub const hid_device = struct_hid_device_;
pub const struct_hid_device_info = extern struct {
    path: [*c]u8 = null,
    vendor_id: c_ushort = 0,
    product_id: c_ushort = 0,
    serial_number: [*c]wchar_t = null,
    release_number: c_ushort = 0,
    manufacturer_string: [*c]wchar_t = null,
    product_string: [*c]wchar_t = null,
    usage_page: c_ushort = 0,
    usage: c_ushort = 0,
    interface_number: c_int = 0,
    next: [*c]struct_hid_device_info = null,
    bus_type: hid_bus_type = @import("std").mem.zeroes(hid_bus_type),
    interface_class: c_int = 0,
    interface_subclass: c_int = 0,
    interface_protocol: c_int = 0,
};
pub const struct_hidapi_backend = extern struct {
    hid_write: ?*const fn (device: ?*hid_device, data: [*c]const u8, length: usize) callconv(.c) c_int = null,
    hid_read_timeout: ?*const fn (device: ?*hid_device, data: [*c]u8, length: usize, milliseconds: c_int) callconv(.c) c_int = null,
    hid_read: ?*const fn (device: ?*hid_device, data: [*c]u8, length: usize) callconv(.c) c_int = null,
    hid_set_nonblocking: ?*const fn (device: ?*hid_device, nonblock: c_int) callconv(.c) c_int = null,
    hid_send_feature_report: ?*const fn (device: ?*hid_device, data: [*c]const u8, length: usize) callconv(.c) c_int = null,
    hid_get_feature_report: ?*const fn (device: ?*hid_device, data: [*c]u8, length: usize) callconv(.c) c_int = null,
    hid_get_input_report: ?*const fn (device: ?*hid_device, data: [*c]u8, length: usize) callconv(.c) c_int = null,
    hid_close: ?*const fn (device: ?*hid_device) callconv(.c) void = null,
    hid_get_manufacturer_string: ?*const fn (device: ?*hid_device, string: [*c]wchar_t, maxlen: usize) callconv(.c) c_int = null,
    hid_get_product_string: ?*const fn (device: ?*hid_device, string: [*c]wchar_t, maxlen: usize) callconv(.c) c_int = null,
    hid_get_serial_number_string: ?*const fn (device: ?*hid_device, string: [*c]wchar_t, maxlen: usize) callconv(.c) c_int = null,
    hid_get_indexed_string: ?*const fn (device: ?*hid_device, string_index: c_int, string: [*c]wchar_t, maxlen: usize) callconv(.c) c_int = null,
    hid_get_device_info: ?*const fn (device: ?*hid_device) callconv(.c) [*c]struct_hid_device_info = null,
    hid_get_report_descriptor: ?*const fn (device: ?*hid_device, buf: [*c]u8, buf_size: usize) callconv(.c) c_int = null,
    hid_error: ?*const fn (device: ?*hid_device) callconv(.c) [*c]const wchar_t = null,
};
pub const enum_SDL_hid_bus_type = c_uint;
pub const SDL_hid_bus_type = enum_SDL_hid_bus_type;
pub const struct_SDL_hid_device_info = extern struct {
    path: [*c]u8 = null,
    vendor_id: c_ushort = 0,
    product_id: c_ushort = 0,
    serial_number: [*c]wchar_t = null,
    release_number: c_ushort = 0,
    manufacturer_string: [*c]wchar_t = null,
    product_string: [*c]wchar_t = null,
    usage_page: c_ushort = 0,
    usage: c_ushort = 0,
    interface_number: c_int = 0,
    interface_class: c_int = 0,
    interface_subclass: c_int = 0,
    interface_protocol: c_int = 0,
    bus_type: SDL_hid_bus_type = @import("std").mem.zeroes(SDL_hid_bus_type),
    next: [*c]struct_SDL_hid_device_info = null,
};
pub const SDL_hid_device_info = struct_SDL_hid_device_info;
pub const struct_SDL_hid_device = extern struct {
    device: ?*anyopaque = null,
    backend: [*c]const struct_hidapi_backend = null,
    info: SDL_hid_device_info = @import("std").mem.zeroes(SDL_hid_device_info),
    props: SDL_PropertiesID = 0,
};
pub const SDL_hid_device = struct_SDL_hid_device;
pub extern fn SDL_GetHintBoolean_REAL(name: [*c]const u8, default_value: bool) bool;
pub const SDL_HintCallback = ?*const fn (userdata: ?*anyopaque, name: [*c]const u8, oldValue: [*c]const u8, newValue: [*c]const u8) callconv(.c) void;
pub extern fn SDL_AddHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) bool;
pub extern fn SDL_RemoveHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) void;
pub const SDL_LOG_CATEGORY_INPUT: c_int = 7;
pub extern fn SDL_LogDebug_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_LogWarn_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub const SDL_SANDBOX_NONE: c_int = 0;
pub const enum_SDL_Sandbox = c_uint;
pub const SDL_Sandbox = enum_SDL_Sandbox;
pub extern fn SDL_GetSandbox_REAL() SDL_Sandbox;
pub extern fn SDL_GetTicks_REAL() Uint64;
pub extern fn SDL_GetTicksNS_REAL() Uint64;
pub const SDL_OBJECT_TYPE_HIDAPI_DEVICE: c_int = 8;
pub const SDL_ObjectType = c_uint;
pub extern fn SDL_SetObjectValid(object: ?*anyopaque, @"type": SDL_ObjectType, valid: bool) void;
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
pub extern fn SDL_GetStringBoolean(value: [*c]const u8, default_value: bool) bool;
pub const struct_hid_api_version = extern struct {
    major: c_int = 0,
    minor: c_int = 0,
    patch: c_int = 0,
};
pub const HID_API_BUS_USB: c_int = 1;
pub const HID_API_BUS_BLUETOOTH: c_int = 2;
pub const HID_API_BUS_I2C: c_int = 3;
pub const HID_API_BUS_SPI: c_int = 4;
pub const hid_bus_type = c_uint;
pub extern fn hid_write(dev: ?*hid_device, data: [*c]const u8, length: usize) c_int;
pub extern fn hid_read_timeout(dev: ?*hid_device, data: [*c]u8, length: usize, milliseconds: c_int) c_int;
pub extern fn hid_read(dev: ?*hid_device, data: [*c]u8, length: usize) c_int;
pub extern fn hid_set_nonblocking(dev: ?*hid_device, nonblock: c_int) c_int;
pub extern fn hid_send_feature_report(dev: ?*hid_device, data: [*c]const u8, length: usize) c_int;
pub extern fn hid_get_feature_report(dev: ?*hid_device, data: [*c]u8, length: usize) c_int;
pub extern fn hid_get_input_report(dev: ?*hid_device, data: [*c]u8, length: usize) c_int;
pub extern fn hid_close(dev: ?*hid_device) void;
pub extern fn hid_get_manufacturer_string(dev: ?*hid_device, string: [*c]wchar_t, maxlen: usize) c_int;
pub extern fn hid_get_product_string(dev: ?*hid_device, string: [*c]wchar_t, maxlen: usize) c_int;
pub extern fn hid_get_serial_number_string(dev: ?*hid_device, string: [*c]wchar_t, maxlen: usize) c_int;
pub extern fn hid_get_device_info(dev: ?*hid_device) [*c]struct_hid_device_info;
pub extern fn hid_get_indexed_string(dev: ?*hid_device, string_index: c_int, string: [*c]wchar_t, maxlen: usize) c_int;
pub extern fn hid_get_report_descriptor(dev: ?*hid_device, buf: [*c]u8, buf_size: usize) c_int;
pub extern fn hid_error(dev: ?*hid_device) [*c]const wchar_t;
pub extern fn gnu_dev_major(__dev: __dev_t) c_uint;
pub extern fn gnu_dev_minor(__dev: __dev_t) c_uint;
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
pub extern fn ioctl(__fd: c_int, __request: c_ulong, ...) c_int;
pub const __u8 = u8;
pub const __u32 = c_uint;
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
pub extern fn SDL_UDEV_GetUdevSyms() [*c]const SDL_UDEV_Symbols;
pub extern fn SDL_UDEV_ReleaseUdevSyms() void;
pub const nfds_t = c_ulong;
pub const struct_pollfd = extern struct {
    fd: c_int = 0,
    events: c_short = 0,
    revents: c_short = 0,
};
pub extern fn poll(__fds: [*c]struct_pollfd, __nfds: nfds_t, __timeout: c_int) c_int;
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
pub const IN_CLOEXEC: c_int = 524288;
pub const IN_NONBLOCK: c_int = 2048;
pub const struct_inotify_event = extern struct {
    wd: c_int = 0,
    mask: u32 = 0,
    cookie: u32 = 0,
    len: u32 = 0,
    _name: [0]u8 = @import("std").mem.zeroes([0]u8),
    pub fn name(_self: anytype) __helpers.FlexibleArrayType(@TypeOf(_self), @typeInfo(@TypeOf(_self.*._name)).array.child) {
        return @ptrCast(@alignCast(&_self.*._name));
    }
};
pub extern fn inotify_init1(__flags: c_int) c_int;
pub extern fn inotify_add_watch(__fd: c_int, __name: [*c]const u8, __mask: u32) c_int;
pub extern fn close(__fd: c_int) c_int;
pub extern fn read(__fd: c_int, __buf: ?*anyopaque, __nbytes: usize) isize;
pub extern fn write(__fd: c_int, __buf: ?*const anyopaque, __n: usize) isize;
pub extern fn usleep(__useconds: __useconds_t) c_int;
pub extern fn truncate(__file: [*c]const u8, __length: __off_t) c_int;
pub const ENUMERATION_UNSET: c_int = 0;
pub const ENUMERATION_LIBUDEV: c_int = 1;
pub const ENUMERATION_FALLBACK: c_int = 2;
pub const LinuxEnumerationMethod = c_uint;
pub var linux_enumeration_method: LinuxEnumerationMethod = ENUMERATION_UNSET;
pub var inotify_fd: c_int = -@as(c_int, 1);
pub var usyms: [*c]const SDL_UDEV_Symbols = null;
const struct_unnamed_21 = extern struct {
    m_bInitialized: bool = false,
    m_unDeviceChangeCounter: Uint32 = 0,
    m_bCanGetNotifications: bool = false,
    m_unLastDetect: Uint64 = 0,
    m_pUdev: ?*struct_udev = null,
    m_pUdevMonitor: ?*struct_udev_monitor = null,
    m_nUdevFd: c_int = 0,
};
pub var SDL_HIDAPI_discovery: struct_unnamed_21 = @import("std").mem.zeroes(struct_unnamed_21);
pub fn SDL_inotify_init1() callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return inotify_init1(IN_NONBLOCK | IN_CLOEXEC);
}
pub fn StrHasPrefix(string: [*c]const u8, prefix: [*c]const u8) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return @intFromBool(SDL_strncmp_REAL(string, prefix, SDL_strlen_REAL(prefix)) == @as(c_int, 0));
}
pub fn StrIsInteger(string: [*c]const u8) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var p: [*c]const u8 = undefined;
    _ = &p;
    if (@as(c_int, string.*) == @as(c_int, '\x00')) {
        return 0;
    }
    {
        p = string;
        while (@as(c_int, p.*) != @as(c_int, '\x00')) : (p += 1) {
            if ((@as(c_int, p.*) < @as(c_int, '0')) or (@as(c_int, p.*) > @as(c_int, '9'))) {
                return 0;
            }
        }
    }
    return 1;
}
pub fn HIDAPI_InitializeDiscovery() callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_HIDAPI_discovery.m_bInitialized = @"true" != 0;
    SDL_HIDAPI_discovery.m_unDeviceChangeCounter = 1;
    SDL_HIDAPI_discovery.m_bCanGetNotifications = @"false" != 0;
    SDL_HIDAPI_discovery.m_unLastDetect = 0;
    if (linux_enumeration_method == @as(LinuxEnumerationMethod, ENUMERATION_LIBUDEV)) {
        SDL_HIDAPI_discovery.m_pUdev = null;
        SDL_HIDAPI_discovery.m_pUdevMonitor = null;
        SDL_HIDAPI_discovery.m_nUdevFd = -@as(c_int, 1);
        usyms = SDL_UDEV_GetUdevSyms();
        if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(usyms)))) != @as(?*anyopaque, null)) {
            SDL_HIDAPI_discovery.m_pUdev = usyms.*.udev_new.?();
            if (@as(?*anyopaque, @ptrCast(@alignCast(SDL_HIDAPI_discovery.m_pUdev))) != @as(?*anyopaque, null)) {
                SDL_HIDAPI_discovery.m_pUdevMonitor = usyms.*.udev_monitor_new_from_netlink.?(SDL_HIDAPI_discovery.m_pUdev, "udev");
                if (@as(?*anyopaque, @ptrCast(@alignCast(SDL_HIDAPI_discovery.m_pUdevMonitor))) != @as(?*anyopaque, null)) {
                    _ = usyms.*.udev_monitor_enable_receiving.?(SDL_HIDAPI_discovery.m_pUdevMonitor);
                    SDL_HIDAPI_discovery.m_nUdevFd = usyms.*.udev_monitor_get_fd.?(SDL_HIDAPI_discovery.m_pUdevMonitor);
                    SDL_HIDAPI_discovery.m_bCanGetNotifications = @"true" != 0;
                }
            }
        }
    } else {
        inotify_fd = SDL_inotify_init1();
        if (inotify_fd < @as(c_int, 0)) {
            SDL_LogWarn_REAL(SDL_LOG_CATEGORY_INPUT, "Unable to initialize inotify, falling back to polling: %s", strerror(__errno_location().*));
            return;
        }
        if (inotify_add_watch(inotify_fd, "/dev", @bitCast(@as(c_int, ((IN_CREATE | IN_DELETE) | (IN_MOVED_FROM | IN_MOVED_TO)) | IN_ATTRIB))) < @as(c_int, 0)) {
            _ = close(inotify_fd);
            inotify_fd = -@as(c_int, 1);
            SDL_LogWarn_REAL(SDL_LOG_CATEGORY_INPUT, "Unable to add inotify watch, falling back to polling: %s", strerror(__errno_location().*));
            return;
        }
        SDL_HIDAPI_discovery.m_bCanGetNotifications = @"true" != 0;
    }
}
pub fn HIDAPI_UpdateDiscovery() callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (!SDL_HIDAPI_discovery.m_bInitialized) {
        HIDAPI_InitializeDiscovery();
    }
    if (!SDL_HIDAPI_discovery.m_bCanGetNotifications) {
        const SDL_HIDAPI_DETECT_INTERVAL_MS: Uint32 = 3000;
        _ = &SDL_HIDAPI_DETECT_INTERVAL_MS;
        var now: Uint64 = SDL_GetTicks_REAL();
        _ = &now;
        if (!(SDL_HIDAPI_discovery.m_unLastDetect != 0) or (now >= (SDL_HIDAPI_discovery.m_unLastDetect +% @as(Uint64, SDL_HIDAPI_DETECT_INTERVAL_MS)))) {
            SDL_HIDAPI_discovery.m_unDeviceChangeCounter +%= 1;
            SDL_HIDAPI_discovery.m_unLastDetect = now;
        }
        return;
    }
    if (linux_enumeration_method == @as(LinuxEnumerationMethod, ENUMERATION_LIBUDEV)) {
        if (SDL_HIDAPI_discovery.m_nUdevFd >= @as(c_int, 0)) {
            while (true) {
                var PollUdev: struct_pollfd = undefined;
                _ = &PollUdev;
                var pUdevDevice: ?*struct_udev_device = undefined;
                _ = &pUdevDevice;
                PollUdev.fd = SDL_HIDAPI_discovery.m_nUdevFd;
                PollUdev.events = POLLIN;
                if (poll(&PollUdev, 1, 0) != @as(c_int, 1)) {
                    break;
                }
                pUdevDevice = usyms.*.udev_monitor_receive_device.?(SDL_HIDAPI_discovery.m_pUdevMonitor);
                if (pUdevDevice != null) {
                    var action: [*c]const u8 = null;
                    _ = &action;
                    action = usyms.*.udev_device_get_action.?(pUdevDevice);
                    if (((@as(?*anyopaque, @ptrCast(@alignCast(@constCast(action)))) == @as(?*anyopaque, null)) or (SDL_strcmp_REAL(action, "add") == @as(c_int, 0))) or (SDL_strcmp_REAL(action, "remove") == @as(c_int, 0))) {
                        SDL_HIDAPI_discovery.m_unDeviceChangeCounter +%= 1;
                    }
                    _ = usyms.*.udev_device_unref.?(pUdevDevice);
                }
            }
        }
    } else {
        if (inotify_fd >= @as(c_int, 0)) {
            const union_unnamed_22 = extern union {
                event: struct_inotify_event,
                storage: [4096]u8,
                enough_for_inotify: [272]u8,
            };
            _ = &union_unnamed_22;
            var buf: union_unnamed_22 = undefined;
            _ = &buf;
            var bytes: isize = undefined;
            _ = &bytes;
            var remain: usize = 0;
            _ = &remain;
            var len: usize = undefined;
            _ = &len;
            bytes = read(inotify_fd, @ptrCast(@alignCast(&buf)), @sizeOf(@TypeOf(buf)));
            if (bytes > @as(isize, 0)) {
                remain = @bitCast(@as(c_long, bytes));
            }
            while (remain > @as(usize, 0)) {
                if (buf.event.len > @as(u32, 0)) {
                    if ((StrHasPrefix(buf.event.name(), "hidraw") != 0) and (StrIsInteger(buf.event.name() + SDL_strlen_REAL("hidraw")) != 0)) {
                        SDL_HIDAPI_discovery.m_unDeviceChangeCounter +%= 1;
                    }
                }
                len = @sizeOf(struct_inotify_event) +% @as(c_ulong, buf.event.len);
                remain -%= len;
                if (remain != @as(usize, 0)) {
                    _ = memmove(@ptrCast(@alignCast(&buf.storage[@as(c_int, 0)])), @ptrCast(@alignCast(&buf.storage[len])), remain);
                }
            }
        }
    }
}
pub fn HIDAPI_ShutdownDiscovery() callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (!SDL_HIDAPI_discovery.m_bInitialized) {
        return;
    }
    if (linux_enumeration_method == @as(LinuxEnumerationMethod, ENUMERATION_LIBUDEV)) {
        if (usyms != null) {
            if (SDL_HIDAPI_discovery.m_pUdevMonitor != null) {
                _ = usyms.*.udev_monitor_unref.?(SDL_HIDAPI_discovery.m_pUdevMonitor);
            }
            if (SDL_HIDAPI_discovery.m_pUdev != null) {
                _ = usyms.*.udev_unref.?(SDL_HIDAPI_discovery.m_pUdev);
            }
            SDL_UDEV_ReleaseUdevSyms();
            usyms = null;
        }
    } else {
        if (inotify_fd >= @as(c_int, 0)) {
            _ = close(inotify_fd);
            inotify_fd = -@as(c_int, 1);
        }
    }
    SDL_HIDAPI_discovery.m_bInitialized = @"false" != 0;
}
pub const struct_PLATFORM_hid_device_ = extern struct {
    device_handle: c_int = 0,
    blocking: c_int = 0,
    needs_ble_hack: c_int = 0,
    last_error_str: [*c]wchar_t = null,
    device_info: [*c]struct_hid_device_info = null,
};
pub const PLATFORM_hid_device = struct_PLATFORM_hid_device_;
pub var udev_ctx: [*c]const SDL_UDEV_Symbols = null;
pub extern fn setlocale(__category: c_int, __locale: [*c]const u8) [*c]u8;
pub extern fn fstat(__fd: c_int, __buf: [*c]struct_stat) c_int;
pub const struct_hidraw_report_descriptor = extern struct {
    size: __u32 = 0,
    value: [4096]__u8 = @import("std").mem.zeroes([4096]__u8),
};
pub var PLATFORM_api_version: struct_hid_api_version = struct_hid_api_version{
    .major = HID_API_VERSION_MAJOR,
    .minor = HID_API_VERSION_MINOR,
    .patch = HID_API_VERSION_PATCH,
};
pub var last_global_error_str: [*c]wchar_t = null;
pub fn PLATFORM_new_hid_device() callconv(.c) [*c]PLATFORM_hid_device {
    @setEvalBranchQuota(100000);
    var dev: [*c]PLATFORM_hid_device = @ptrCast(@alignCast(calloc(1, @sizeOf(PLATFORM_hid_device))));
    _ = &dev;
    if (@as(?*anyopaque, @ptrCast(@alignCast(dev))) == @as(?*anyopaque, null)) {
        return null;
    }
    dev.*.device_handle = -@as(c_int, 1);
    dev.*.blocking = 1;
    dev.*.last_error_str = null;
    dev.*.device_info = null;
    return dev;
}
pub fn utf8_to_wchar_t(utf8: [*c]const u8) callconv(.c) [*c]wchar_t {
    @setEvalBranchQuota(100000);
    var ret: [*c]wchar_t = null;
    _ = &ret;
    if (utf8 != null) {
        var wlen: usize = mbstowcs(null, utf8, 0);
        _ = &wlen;
        if (@as(usize, @bitCast(@as(c_long, -@as(c_int, 1)))) == wlen) {
            const wide_string_23 = [0:0]c_int{};
            return wcsdup(&wide_string_23);
        }
        ret = @ptrCast(@alignCast(calloc(wlen +% @as(usize, 1), @sizeOf(wchar_t))));
        if (@as(?*anyopaque, @ptrCast(@alignCast(ret))) == @as(?*anyopaque, null)) {
            return null;
        }
        _ = mbstowcs(ret, utf8, wlen +% @as(usize, 1));
        ret[wlen] = 0;
    }
    return ret;
}
pub fn register_error_str(_: [*c][*c]wchar_t, msg: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (msg != null) {
        _ = SDL_SetError_REAL("%s", msg);
    } else {
        _ = SDL_ClearError_REAL();
    }
}
pub fn register_error_str_vformat(error_str: [*c][*c]wchar_t, format: [*c]const u8, args: [*c]struct___va_list_tag_2) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var msg: [256]u8 = undefined;
    _ = &msg;
    _ = vsnprintf(@ptrCast(@alignCast(&msg)), @sizeOf(@TypeOf(msg)), format, args);
    register_error_str(error_str, @ptrCast(@alignCast(&msg)));
}
pub fn register_global_error(msg: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    register_error_str(&last_global_error_str, msg);
}
pub fn register_global_error_format(format: [*c]const u8, ...) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var args: va_list = undefined;
    _ = &args;
    __builtin.va_start(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&args))), @cVaStart());
    register_error_str_vformat(&last_global_error_str, format, @ptrCast(@alignCast(&args)));
    __builtin.va_end(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&args))));
}
pub fn register_device_error(dev: [*c]PLATFORM_hid_device, msg: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    register_error_str(&dev.*.last_error_str, msg);
}
pub fn register_device_error_format(dev: [*c]PLATFORM_hid_device, format: [*c]const u8, ...) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var args: va_list = undefined;
    _ = &args;
    __builtin.va_start(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&args))), @cVaStart());
    register_error_str_vformat(&dev.*.last_error_str, format, @ptrCast(@alignCast(&args)));
    __builtin.va_end(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&args))));
}
pub fn copy_udev_string(dev: ?*struct_udev_device, udev_name: [*c]const u8) callconv(.c) [*c]wchar_t {
    @setEvalBranchQuota(100000);
    return utf8_to_wchar_t(udev_ctx.*.udev_device_get_sysattr_value.?(dev, udev_name));
}
pub fn get_hid_item_size(report_descriptor: [*c]const __u8, size: __u32, pos: c_uint, data_len: [*c]c_int, key_size: [*c]c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var key: c_int = undefined;
    _ = &key;
    var size_code: c_int = undefined;
    _ = &size_code;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                key = report_descriptor[pos];
                if ((key & @as(c_int, 240)) == @as(c_int, 240)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                if ((pos +% @as(c_uint, 1)) < size) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                size_code = key & @as(c_int, 3);
                switch (size_code) {
                    @as(c_int, 0) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 11;
                        continue;
                    },
                    else => {
                        sdl_pc = 12;
                        continue;
                    },
                }
            },
            4 => {
                data_len.* = report_descriptor[pos +% @as(c_uint, 1)];
                key_size.* = 3;
                return 1;
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                data_len.* = 0;
                key_size.* = 0;
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            7 => {
                return 0;
            },
            8 => {
                {
                    sdl_pc = 9;
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
                data_len.* = size_code;
                key_size.* = 1;
                return 1;
            },
            11 => {
                data_len.* = 4;
                key_size.* = 1;
                return 1;
            },
            12 => {
                data_len.* = 0;
                key_size.* = 0;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn get_hid_report_bytes(rpt: [*c]const __u8, len: usize, num_bytes: usize, cur: usize) callconv(.c) __u32 {
    @setEvalBranchQuota(100000);
    if ((cur +% num_bytes) >= len) return 0;
    if (num_bytes == @as(usize, 0)) return 0 else if (num_bytes == @as(usize, 1)) return rpt[cur +% @as(usize, 1)] else if (num_bytes == @as(usize, 2)) return @bitCast(@as(c_int, (@as(c_int, rpt[cur +% @as(usize, 2)]) * @as(c_int, 256)) + @as(c_int, rpt[cur +% @as(usize, 1)]))) else if (num_bytes == @as(usize, 4)) return @bitCast(@as(c_int, (((@as(c_int, rpt[cur +% @as(usize, 4)]) * @as(c_int, 16777216)) + (@as(c_int, rpt[cur +% @as(usize, 3)]) * @as(c_int, 65536))) + (@as(c_int, rpt[cur +% @as(usize, 2)]) * @as(c_int, 256))) + (@as(c_int, rpt[cur +% @as(usize, 1)]) * @as(c_int, 1)))) else return 0;
}
pub fn hid_iterate_over_collection(report_descriptor: [*c]const __u8, size: __u32, pos: [*c]c_uint, data_len: [*c]c_int, key_size: [*c]c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var collection_level: c_int = undefined;
    _ = &collection_level;
    var key: c_int = undefined;
    _ = &key;
    var key_cmd: c_int = undefined;
    _ = &key_cmd;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                collection_level = 0;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            1 => {
                if (pos.* < size) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            2 => {
                key = report_descriptor[pos.*];
                key_cmd = key & @as(c_int, 252);
                if (!(get_hid_item_size(report_descriptor, size, pos.*, data_len, key_size) != 0)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            3 => {
                return 0;
            },
            4 => {
                return 0;
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                switch (key_cmd) {
                    @as(c_int, 160) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(c_int, 192) => {
                        sdl_pc = 9;
                        continue;
                    },
                    else => {
                        sdl_pc = 7;
                        continue;
                    },
                }
            },
            7 => {
                if (collection_level < @as(c_int, 0)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            8 => {
                collection_level += 1;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            9 => {
                collection_level -= 1;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            10 => {
                return 0;
            },
            11 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                if (collection_level == @as(c_int, 0)) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            13 => {
                return 1;
            },
            14 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                pos.* +%= @bitCast(@as(c_int, data_len.* + key_size.*));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub const struct_hid_usage_iterator = extern struct {
    pos: c_uint = 0,
    usage_page_found: c_int = 0,
    usage_page: c_ushort = 0,
};
pub fn get_next_hid_usage(report_descriptor: [*c]const __u8, size: __u32, ctx: [*c]struct_hid_usage_iterator, usage_page: [*c]c_ushort, usage: [*c]c_ushort) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var data_len: c_int = undefined;
    _ = &data_len;
    var key_size: c_int = undefined;
    _ = &key_size;
    var initial: c_int = undefined;
    _ = &initial;
    var usage_found: c_int = undefined;
    _ = &usage_found;
    var key: c_int = undefined;
    _ = &key;
    var key_cmd: c_int = undefined;
    _ = &key_cmd;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                initial = @intFromBool(ctx.*.pos == @as(c_uint, 0));
                usage_found = 0;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            1 => {
                if (ctx.*.pos < size) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            2 => {
                key = report_descriptor[ctx.*.pos];
                key_cmd = key & @as(c_int, 252);
                if (!(get_hid_item_size(report_descriptor, size, ctx.*.pos, &data_len, &key_size) != 0)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            3 => {
                if (((initial != 0) and (usage_found != 0)) and (ctx.*.usage_page_found != 0)) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            4 => {
                return -@as(c_int, 1);
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                switch (key_cmd) {
                    @as(c_int, 4) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(c_int, 8) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(c_int, 160) => {
                        sdl_pc = 13;
                        continue;
                    },
                    else => {
                        sdl_pc = 7;
                        continue;
                    },
                }
            },
            7 => {
                ctx.*.pos +%= @bitCast(@as(c_int, data_len + key_size));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            8 => {
                ctx.*.usage_page = @truncate(get_hid_report_bytes(report_descriptor, size, @bitCast(@as(c_long, data_len)), ctx.*.pos));
                ctx.*.usage_page_found = 1;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            9 => {
                if (data_len == @as(c_int, 4)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                ctx.*.usage_page = @truncate(get_hid_report_bytes(report_descriptor, size, 2, ctx.*.pos +% @as(c_uint, 2)));
                ctx.*.usage_page_found = 1;
                usage.* = @truncate(get_hid_report_bytes(report_descriptor, size, 2, ctx.*.pos));
                usage_found = 1;
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                usage.* = @truncate(get_hid_report_bytes(report_descriptor, size, @bitCast(@as(c_long, data_len)), ctx.*.pos));
                usage_found = 1;
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            13 => {
                if (!(hid_iterate_over_collection(report_descriptor, size, &ctx.*.pos, &data_len, &key_size) != 0)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                return -@as(c_int, 1);
            },
            15 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                if ((usage_found != 0) and (ctx.*.usage_page_found != 0)) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            17 => {
                usage_page.* = ctx.*.usage_page;
                return 0;
            },
            18 => {
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            19 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            20 => {
                usage_page.* = ctx.*.usage_page;
                return 0;
            },
            21 => {
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            22 => {
                return 1;
            },
            else => unreachable,
        }
    }
}
pub fn get_hid_report_descriptor(rpt_path: [*c]const u8, rpt_desc: [*c]struct_hidraw_report_descriptor) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var rpt_handle: c_int = undefined;
    _ = &rpt_handle;
    var res: isize = undefined;
    _ = &res;
    rpt_handle = open(rpt_path, O_RDONLY | __O_CLOEXEC);
    if (rpt_handle < @as(c_int, 0)) {
        register_global_error_format("open failed (%s): %s", rpt_path, strerror(__errno_location().*));
        return -@as(c_int, 1);
    }
    _ = memset(@ptrCast(@alignCast(rpt_desc)), 0, @sizeOf(@TypeOf(rpt_desc.*)));
    res = read(rpt_handle, @ptrCast(@alignCast(@as([*c]__u8, @ptrCast(@alignCast(&rpt_desc.*.value))))), HID_MAX_DESCRIPTOR_SIZE);
    if (res < @as(isize, 0)) {
        register_global_error_format("read failed (%s): %s", rpt_path, strerror(__errno_location().*));
    }
    rpt_desc.*.size = @bitCast(@as(c_int, @truncate(res)));
    _ = close(rpt_handle);
    return @truncate(res);
}
pub fn get_hid_report_descriptor_from_sysfs(sysfs_path: [*c]const u8, rpt_desc: [*c]struct_hidraw_report_descriptor) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var res: c_int = -@as(c_int, 1);
    _ = &res;
    var rpt_path_len: usize = (strlen(sysfs_path) +% @as(usize, 25)) +% @as(usize, 1);
    _ = &rpt_path_len;
    var rpt_path: [*c]u8 = @ptrCast(@alignCast(calloc(1, rpt_path_len)));
    _ = &rpt_path;
    _ = snprintf(rpt_path, rpt_path_len, "%s/device/report_descriptor", sysfs_path);
    res = get_hid_report_descriptor(rpt_path, rpt_desc);
    free(@ptrCast(@alignCast(rpt_path)));
    return res;
}
pub fn parse_hid_vid_pid_from_uevent(uevent: [*c]const u8, bus_type: [*c]c_uint, vendor_id: [*c]c_ushort, product_id: [*c]c_ushort) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var tmp: [1024]u8 = undefined;
    _ = &tmp;
    var uevent_len: usize = undefined;
    _ = &uevent_len;
    var saveptr: [*c]u8 = undefined;
    _ = &saveptr;
    var line: [*c]u8 = undefined;
    _ = &line;
    var key: [*c]u8 = undefined;
    _ = &key;
    var value: [*c]u8 = undefined;
    _ = &value;
    var ret: c_int = undefined;
    _ = &ret;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                uevent_len = strlen(uevent);
                if (uevent_len > (@sizeOf(@TypeOf(tmp)) -% @as(c_ulong, 1))) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                line = strtok_r(null, "\n", &saveptr);
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            2 => {
                uevent_len = @sizeOf(@TypeOf(tmp)) -% @as(c_ulong, 1);
                {
                    sdl_pc = 4;
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
                _ = memcpy(@ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&tmp))))), @ptrCast(@alignCast(uevent)), uevent_len);
                tmp[uevent_len] = '\x00';
                saveptr = null;
                line = strtok_r(@ptrCast(@alignCast(&tmp)), "\n", &saveptr);
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            5 => {
                if (@as(?*anyopaque, @ptrCast(@alignCast(line))) != @as(?*anyopaque, null)) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 7;
                    continue;
                }
            },
            6 => {
                key = line;
                value = strchr(line, '=');
                if (!(value != null)) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            7 => {
                register_global_error("Couldn't find/parse HID_ID");
                return 0;
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
                value.* = '\x00';
                value += 1;
                if (strcmp(key, "HID_ID") == @as(c_int, 0)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                ret = sscanf(value, "%x:%hx:%hx", bus_type, vendor_id, product_id);
                if (ret == @as(c_int, 3)) {
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
                    sdl_pc = 1;
                    continue;
                }
            },
            14 => {
                return 1;
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
            else => unreachable,
        }
    }
}
pub fn parse_hid_vid_pid_from_uevent_path(uevent_path: [*c]const u8, bus_type: [*c]c_uint, vendor_id: [*c]c_ushort, product_id: [*c]c_ushort) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var handle: c_int = undefined;
    _ = &handle;
    var res: isize = undefined;
    _ = &res;
    handle = open(uevent_path, O_RDONLY | __O_CLOEXEC);
    if (handle < @as(c_int, 0)) {
        register_global_error_format("open failed (%s): %s", uevent_path, strerror(__errno_location().*));
        return 0;
    }
    var buf: [1024]u8 = undefined;
    _ = &buf;
    res = read(handle, @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&buf))))), @sizeOf(@TypeOf(buf)) -% @as(c_ulong, 1));
    _ = close(handle);
    if (res < @as(isize, 0)) {
        register_global_error_format("read failed (%s): %s", uevent_path, strerror(__errno_location().*));
        return 0;
    }
    buf[@bitCast(@as(isize, @intCast(res)))] = '\x00';
    return parse_hid_vid_pid_from_uevent(@ptrCast(@alignCast(&buf)), bus_type, vendor_id, product_id);
}
pub fn parse_hid_vid_pid_from_sysfs(sysfs_path: [*c]const u8, bus_type: [*c]c_uint, vendor_id: [*c]c_ushort, product_id: [*c]c_ushort) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var res: c_int = 0;
    _ = &res;
    var uevent_path_len: usize = (strlen(sysfs_path) +% @as(usize, 14)) +% @as(usize, 1);
    _ = &uevent_path_len;
    var uevent_path: [*c]u8 = @ptrCast(@alignCast(calloc(1, uevent_path_len)));
    _ = &uevent_path;
    _ = snprintf(uevent_path, uevent_path_len, "%s/device/uevent", sysfs_path);
    res = parse_hid_vid_pid_from_uevent_path(uevent_path, bus_type, vendor_id, product_id);
    free(@ptrCast(@alignCast(uevent_path)));
    return res;
}
pub fn get_hid_report_descriptor_from_hidraw(dev: [*c]PLATFORM_hid_device, rpt_desc: [*c]struct_hidraw_report_descriptor) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var desc_size: c_int = 0;
    _ = &desc_size;
    var res: c_int = ioctl(dev.*.device_handle, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'H') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(c_int) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), &desc_size);
    _ = &res;
    if (res < @as(c_int, 0)) {
        register_device_error_format(dev, "ioctl(GRDESCSIZE): %s", strerror(__errno_location().*));
        return res;
    }
    _ = memset(@ptrCast(@alignCast(rpt_desc)), 0, @sizeOf(@TypeOf(rpt_desc.*)));
    rpt_desc.*.size = @bitCast(@as(c_int, desc_size));
    res = ioctl(dev.*.device_handle, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'H') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 2) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(struct_hidraw_report_descriptor) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), rpt_desc);
    if (res < @as(c_int, 0)) {
        register_device_error_format(dev, "ioctl(GRDESC): %s", strerror(__errno_location().*));
    }
    return res;
}
pub fn parse_uevent_info(uevent: [*c]const u8, bus_type: [*c]c_uint, vendor_id: [*c]c_ushort, product_id: [*c]c_ushort, serial_number_utf8: [*c][*c]u8, product_name_utf8: [*c][*c]u8) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var tmp: [1024]u8 = undefined;
    _ = &tmp;
    var uevent_len: usize = undefined;
    _ = &uevent_len;
    var saveptr: [*c]u8 = undefined;
    _ = &saveptr;
    var line: [*c]u8 = undefined;
    _ = &line;
    var key: [*c]u8 = undefined;
    _ = &key;
    var value: [*c]u8 = undefined;
    _ = &value;
    var found_id: c_int = undefined;
    _ = &found_id;
    var found_serial: c_int = undefined;
    _ = &found_serial;
    var found_name: c_int = undefined;
    _ = &found_name;
    var ret: c_int = undefined;
    _ = &ret;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (!(uevent != null)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                line = strtok_r(null, "\n", &saveptr);
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            2 => {
                return 0;
            },
            3 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                uevent_len = strlen(uevent);
                if (uevent_len > (@sizeOf(@TypeOf(tmp)) -% @as(c_ulong, 1))) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                uevent_len = @sizeOf(@TypeOf(tmp)) -% @as(c_ulong, 1);
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
                _ = memcpy(@ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&tmp))))), @ptrCast(@alignCast(uevent)), uevent_len);
                tmp[uevent_len] = '\x00';
                saveptr = null;
                found_id = 0;
                found_serial = 0;
                found_name = 0;
                line = strtok_r(@ptrCast(@alignCast(&tmp)), "\n", &saveptr);
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            8 => {
                if (@as(?*anyopaque, @ptrCast(@alignCast(line))) != @as(?*anyopaque, null)) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
            },
            9 => {
                key = line;
                value = strchr(line, '=');
                if (!(value != null)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            10 => {
                return @intFromBool(((found_id != 0) and (found_name != 0)) and (found_serial != 0));
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
                value.* = '\x00';
                value += 1;
                if (strcmp(key, "HID_ID") == @as(c_int, 0)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                ret = sscanf(value, "%x:%hx:%hx", bus_type, vendor_id, product_id);
                if (ret == @as(c_int, 3)) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            15 => {
                if (strcmp(key, "HID_NAME") == @as(c_int, 0)) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
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
                found_id = 1;
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
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            20 => {
                product_name_utf8.* = strdup(value);
                found_name = 1;
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            21 => {
                if (strcmp(key, "HID_UNIQ") == @as(c_int, 0)) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            22 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            23 => {
                serial_number_utf8.* = strdup(value);
                found_serial = 1;
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
                    sdl_pc = 22;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn is_BLE(dev: [*c]PLATFORM_hid_device) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var udev_1: ?*struct_udev = undefined;
    _ = &udev_1;
    var udev_dev: ?*struct_udev_device = undefined;
    _ = &udev_dev;
    var hid_dev: ?*struct_udev_device = undefined;
    _ = &hid_dev;
    var s: struct_stat = undefined;
    _ = &s;
    var ret: c_int = undefined;
    _ = &ret;
    udev_1 = udev_ctx.*.udev_new.?();
    if (!(udev_1 != null)) {
        _ = printf("Can't create udev\n");
        return -@as(c_int, 1);
    }
    if (fstat(dev.*.device_handle, &s) < @as(c_int, 0)) {
        _ = udev_ctx.*.udev_unref.?(udev_1);
        return -@as(c_int, 1);
    }
    ret = 0;
    udev_dev = udev_ctx.*.udev_device_new_from_devnum.?(udev_1, 'c', s.st_rdev);
    if (udev_dev != null) {
        hid_dev = udev_ctx.*.udev_device_get_parent_with_subsystem_devtype.?(udev_dev, "hid", null);
        if (hid_dev != null) {
            var dev_vid: c_ushort = 0;
            _ = &dev_vid;
            var dev_pid: c_ushort = 0;
            _ = &dev_pid;
            var bus_type: c_uint = 0;
            _ = &bus_type;
            var serial_number_utf8: [*c]u8 = null;
            _ = &serial_number_utf8;
            var product_name_utf8: [*c]u8 = null;
            _ = &product_name_utf8;
            _ = parse_uevent_info(udev_ctx.*.udev_device_get_sysattr_value.?(hid_dev, "uevent"), &bus_type, &dev_vid, &dev_pid, &serial_number_utf8, &product_name_utf8);
            free(@ptrCast(@alignCast(serial_number_utf8)));
            free(@ptrCast(@alignCast(product_name_utf8)));
            if (bus_type == @as(c_uint, BUS_BLUETOOTH)) {
                if (@as(c_int, dev_vid) == @as(c_int, 10462)) {
                    ret = 1;
                }
            }
        }
        _ = udev_ctx.*.udev_device_unref.?(udev_dev);
    }
    _ = udev_ctx.*.udev_unref.?(udev_1);
    return ret;
}
pub fn PLATFORM_create_device_info_for_device(raw_dev: ?*struct_udev_device) callconv(.c) [*c]struct_hid_device_info {
    @setEvalBranchQuota(100000);
    var root: [*c]struct_hid_device_info = undefined;
    _ = &root;
    var cur_dev: [*c]struct_hid_device_info = undefined;
    _ = &cur_dev;
    var sysfs_path: [*c]const u8 = undefined;
    _ = &sysfs_path;
    var dev_path: [*c]const u8 = undefined;
    _ = &dev_path;
    var str: [*c]const u8 = undefined;
    _ = &str;
    var hid_dev: ?*struct_udev_device = undefined;
    _ = &hid_dev;
    var usb_dev: ?*struct_udev_device = undefined;
    _ = &usb_dev;
    var intf_dev: ?*struct_udev_device = undefined;
    _ = &intf_dev;
    var dev_vid: c_ushort = undefined;
    _ = &dev_vid;
    var dev_pid: c_ushort = undefined;
    _ = &dev_pid;
    var serial_number_utf8: [*c]u8 = undefined;
    _ = &serial_number_utf8;
    var product_name_utf8: [*c]u8 = undefined;
    _ = &product_name_utf8;
    var bus_type: c_uint = undefined;
    _ = &bus_type;
    var result: c_int = undefined;
    _ = &result;
    var report_desc: struct_hidraw_report_descriptor = undefined;
    _ = &report_desc;
    var page: c_ushort = undefined;
    _ = &page;
    var usage: c_ushort = undefined;
    _ = &usage;
    var usage_iterator: struct_hid_usage_iterator = undefined;
    _ = &usage_iterator;
    var tmp: [*c]struct_hid_device_info = undefined;
    _ = &tmp;
    var prev_dev: [*c]struct_hid_device_info = undefined;
    _ = &prev_dev;
    var prev_dev_1: [*c]struct_hid_device_info = undefined;
    _ = &prev_dev_1;
    var tmp_2: [*c]struct_hid_device_info = undefined;
    _ = &tmp_2;
    const wide_string_24 = [0:0]c_int{};
    const wide_string_25 = [0:0]c_int{};
    const wide_string_26 = [0:0]c_int{};
    const wide_string_27 = [0:0]c_int{};
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                root = null;
                cur_dev = null;
                serial_number_utf8 = null;
                product_name_utf8 = null;
                sysfs_path = udev_ctx.*.udev_device_get_syspath.?(raw_dev);
                dev_path = udev_ctx.*.udev_device_get_devnode.?(raw_dev);
                hid_dev = udev_ctx.*.udev_device_get_parent_with_subsystem_devtype.?(raw_dev, "hid", null);
                if (!(hid_dev != null)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                free(@ptrCast(@alignCast(serial_number_utf8)));
                free(@ptrCast(@alignCast(product_name_utf8)));
                return root;
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
                result = parse_uevent_info(udev_ctx.*.udev_device_get_sysattr_value.?(hid_dev, "uevent"), &bus_type, &dev_vid, &dev_pid, &serial_number_utf8, &product_name_utf8);
                if (!(result != 0)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
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
                switch (bus_type) {
                    @as(c_uint, BUS_BLUETOOTH) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(c_uint, BUS_I2C) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(c_uint, BUS_USB) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(c_uint, BUS_SPI) => {
                        sdl_pc = 12;
                        continue;
                    },
                    else => {
                        sdl_pc = 13;
                        continue;
                    },
                }
            },
            8 => {
                root = @ptrCast(@alignCast(calloc(1, @sizeOf(struct_hid_device_info))));
                if (!(root != null)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
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
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            13 => {
                {
                    sdl_pc = 1;
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
                cur_dev = root;
                cur_dev.*.next = null;
                cur_dev.*.path = @ptrCast(@alignCast(if (dev_path != null) @as(?*anyopaque, @ptrCast(@alignCast(strdup(dev_path)))) else @as(?*anyopaque, null)));
                cur_dev.*.vendor_id = dev_vid;
                cur_dev.*.product_id = dev_pid;
                cur_dev.*.serial_number = utf8_to_wchar_t(serial_number_utf8);
                cur_dev.*.release_number = 0;
                cur_dev.*.interface_number = -@as(c_int, 1);
                switch (bus_type) {
                    @as(c_uint, BUS_USB) => {
                        sdl_pc = 18;
                        continue;
                    },
                    @as(c_uint, BUS_BLUETOOTH) => {
                        sdl_pc = 25;
                        continue;
                    },
                    @as(c_uint, BUS_I2C) => {
                        sdl_pc = 26;
                        continue;
                    },
                    @as(c_uint, BUS_SPI) => {
                        sdl_pc = 27;
                        continue;
                    },
                    else => {
                        sdl_pc = 28;
                        continue;
                    },
                }
            },
            17 => {
                result = get_hid_report_descriptor_from_sysfs(sysfs_path, &report_desc);
                if (result >= @as(c_int, 0)) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            18 => {
                usb_dev = udev_ctx.*.udev_device_get_parent_with_subsystem_devtype.?(raw_dev, "usb", "usb_device");
                if (!(usb_dev != null)) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            19 => {
                cur_dev.*.manufacturer_string = wcsdup(&wide_string_24);
                cur_dev.*.product_string = utf8_to_wchar_t(product_name_utf8);
                {
                    sdl_pc = 17;
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
                cur_dev.*.manufacturer_string = copy_udev_string(usb_dev, "manufacturer");
                cur_dev.*.product_string = copy_udev_string(usb_dev, "product");
                cur_dev.*.bus_type = HID_API_BUS_USB;
                str = udev_ctx.*.udev_device_get_sysattr_value.?(usb_dev, "bcdDevice");
                cur_dev.*.release_number = @bitCast(@as(c_short, @truncate(if (str != null) strtol(str, null, 16) else @as(c_long, 0))));
                intf_dev = udev_ctx.*.udev_device_get_parent_with_subsystem_devtype.?(raw_dev, "usb", "usb_interface");
                if (intf_dev != null) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            22 => {
                str = udev_ctx.*.udev_device_get_sysattr_value.?(intf_dev, "bInterfaceNumber");
                cur_dev.*.interface_number = @truncate(if (str != null) strtol(str, null, 16) else @as(c_long, -@as(c_int, 1)));
                {
                    sdl_pc = 24;
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
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            25 => {
                cur_dev.*.manufacturer_string = wcsdup(&wide_string_25);
                cur_dev.*.product_string = utf8_to_wchar_t(product_name_utf8);
                cur_dev.*.bus_type = HID_API_BUS_BLUETOOTH;
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            26 => {
                cur_dev.*.manufacturer_string = wcsdup(&wide_string_26);
                cur_dev.*.product_string = utf8_to_wchar_t(product_name_utf8);
                cur_dev.*.bus_type = HID_API_BUS_I2C;
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            27 => {
                cur_dev.*.manufacturer_string = wcsdup(&wide_string_27);
                cur_dev.*.product_string = utf8_to_wchar_t(product_name_utf8);
                cur_dev.*.bus_type = HID_API_BUS_SPI;
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            28 => {
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            29 => {
                page = 0;
                usage = 0;
                _ = memset(@ptrCast(@alignCast(&usage_iterator)), 0, @sizeOf(@TypeOf(usage_iterator)));
                if (!(get_next_hid_usage(@ptrCast(@alignCast(&report_desc.value)), report_desc.size, &usage_iterator, &page, &usage) != 0)) {
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
                prev_dev_1 = null;
                cur_dev = root;
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            32 => {
                cur_dev.*.usage_page = page;
                cur_dev.*.usage = usage;
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
                    sdl_pc = 35;
                    continue;
                }
            },
            35 => {
                if (!(get_next_hid_usage(@ptrCast(@alignCast(&report_desc.value)), report_desc.size, &usage_iterator, &page, &usage) != 0)) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 37;
                    continue;
                }
            },
            36 => {
                tmp = @ptrCast(@alignCast(calloc(1, @sizeOf(struct_hid_device_info))));
                prev_dev = cur_dev;
                if (!(tmp != null)) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
                    continue;
                }
            },
            37 => {
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            38 => {
                {
                    sdl_pc = 35;
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
                cur_dev.*.next = tmp;
                cur_dev = tmp;
                cur_dev.*.path = @ptrCast(@alignCast(if (dev_path != null) @as(?*anyopaque, @ptrCast(@alignCast(strdup(dev_path)))) else @as(?*anyopaque, null)));
                cur_dev.*.vendor_id = dev_vid;
                cur_dev.*.product_id = dev_pid;
                cur_dev.*.serial_number = @ptrCast(@alignCast(if (prev_dev.*.serial_number != null) @as(?*anyopaque, @ptrCast(@alignCast(wcsdup(prev_dev.*.serial_number)))) else @as(?*anyopaque, null)));
                cur_dev.*.release_number = prev_dev.*.release_number;
                cur_dev.*.interface_number = prev_dev.*.interface_number;
                cur_dev.*.manufacturer_string = @ptrCast(@alignCast(if (prev_dev.*.manufacturer_string != null) @as(?*anyopaque, @ptrCast(@alignCast(wcsdup(prev_dev.*.manufacturer_string)))) else @as(?*anyopaque, null)));
                cur_dev.*.product_string = @ptrCast(@alignCast(if (prev_dev.*.product_string != null) @as(?*anyopaque, @ptrCast(@alignCast(wcsdup(prev_dev.*.product_string)))) else @as(?*anyopaque, null)));
                cur_dev.*.usage_page = page;
                cur_dev.*.usage = usage;
                cur_dev.*.bus_type = prev_dev.*.bus_type;
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            41 => {
                if (cur_dev != null) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 43;
                    continue;
                }
            },
            42 => {
                if (SDL_HIDAPI_ShouldIgnoreDevice(@bitCast(cur_dev.*.bus_type), cur_dev.*.vendor_id, cur_dev.*.product_id, cur_dev.*.usage_page, cur_dev.*.usage, @"false" != 0, @"false" != 0)) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            43 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            44 => {
                tmp_2 = cur_dev;
                cur_dev = tmp_2.*.next;
                if (prev_dev_1 != null) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            45 => {
                prev_dev_1 = cur_dev;
                cur_dev = cur_dev.*.next;
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            46 => {
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            47 => {
                prev_dev_1.*.next = cur_dev;
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            48 => {
                root = cur_dev;
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            49 => {
                tmp_2.*.next = null;
                PLATFORM_hid_free_enumeration(tmp_2);
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn create_device_info_for_hid_device(dev: [*c]PLATFORM_hid_device) callconv(.c) [*c]struct_hid_device_info {
    @setEvalBranchQuota(100000);
    var udev_1: ?*struct_udev = undefined;
    _ = &udev_1;
    var udev_dev: ?*struct_udev_device = undefined;
    _ = &udev_dev;
    var s: struct_stat = undefined;
    _ = &s;
    var ret: c_int = -@as(c_int, 1);
    _ = &ret;
    var root: [*c]struct_hid_device_info = null;
    _ = &root;
    register_device_error(dev, null);
    ret = fstat(dev.*.device_handle, &s);
    if (-@as(c_int, 1) == ret) {
        register_device_error(dev, "Failed to stat device handle");
        return null;
    }
    udev_1 = udev_ctx.*.udev_new.?();
    if (!(udev_1 != null)) {
        register_device_error(dev, "Couldn't create udev context");
        return null;
    }
    udev_dev = udev_ctx.*.udev_device_new_from_devnum.?(udev_1, 'c', s.st_rdev);
    if (udev_dev != null) {
        root = PLATFORM_create_device_info_for_device(udev_dev);
    }
    if (!(root != null)) {
        register_device_error(dev, "Couldn't create hid_device_info");
    }
    _ = udev_ctx.*.udev_device_unref.?(udev_dev);
    _ = udev_ctx.*.udev_unref.?(udev_1);
    return root;
}
pub export fn PLATFORM_hid_version() [*c]const struct_hid_api_version {
    @setEvalBranchQuota(100000);
    return &PLATFORM_api_version;
}
pub export fn PLATFORM_hid_version_str() [*c]const u8 {
    @setEvalBranchQuota(100000);
    return "0. 14. 0";
}
pub export fn PLATFORM_hid_init() c_int {
    @setEvalBranchQuota(100000);
    var locale: [*c]const u8 = undefined;
    _ = &locale;
    register_global_error(null);
    locale = setlocale(__LC_CTYPE, null);
    if (!(locale != null)) {
        _ = setlocale(__LC_CTYPE, "");
    }
    return 0;
}
pub export fn PLATFORM_hid_exit() c_int {
    @setEvalBranchQuota(100000);
    register_global_error(null);
    return 0;
}
pub export fn PLATFORM_hid_enumerate(vendor_id: c_ushort, product_id: c_ushort) [*c]struct_hid_device_info {
    @setEvalBranchQuota(100000);
    var hwdb: ?*struct_udev_hwdb = null;
    _ = &hwdb;
    var entry: ?*struct_udev_list_entry = undefined;
    _ = &entry;
    var modalias: [64]u8 = undefined;
    _ = &modalias;
    var key: [*c]const u8 = undefined;
    _ = &key;
    var manufacturer_string: [*c]const u8 = undefined;
    _ = &manufacturer_string;
    var udev_1: ?*struct_udev = undefined;
    _ = &udev_1;
    var enumerate: ?*struct_udev_enumerate = undefined;
    _ = &enumerate;
    var devices: ?*struct_udev_list_entry = undefined;
    _ = &devices;
    var dev_list_entry: ?*struct_udev_list_entry = undefined;
    _ = &dev_list_entry;
    var root: [*c]struct_hid_device_info = null;
    _ = &root;
    var cur_dev: [*c]struct_hid_device_info = null;
    _ = &cur_dev;
    _ = PLATFORM_hid_init();
    udev_1 = udev_ctx.*.udev_new.?();
    if (!(udev_1 != null)) {
        register_global_error("Couldn't create udev context");
        return null;
    }
    enumerate = udev_ctx.*.udev_enumerate_new.?(udev_1);
    _ = udev_ctx.*.udev_enumerate_add_match_subsystem.?(enumerate, "hidraw");
    _ = udev_ctx.*.udev_enumerate_scan_devices.?(enumerate);
    devices = udev_ctx.*.udev_enumerate_get_list_entry.?(enumerate);
    {
        dev_list_entry = devices;
        while (dev_list_entry != null) : (dev_list_entry = udev_ctx.*.udev_list_entry_get_next.?(dev_list_entry)) {
            var sysfs_path: [*c]const u8 = undefined;
            _ = &sysfs_path;
            var dev_vid: c_ushort = 0;
            _ = &dev_vid;
            var dev_pid: c_ushort = 0;
            _ = &dev_pid;
            var bus_type: c_uint = 0;
            _ = &bus_type;
            var raw_dev: ?*struct_udev_device = undefined;
            _ = &raw_dev;
            var tmp: [*c]struct_hid_device_info = undefined;
            _ = &tmp;
            sysfs_path = udev_ctx.*.udev_list_entry_get_name.?(dev_list_entry);
            if (!(sysfs_path != null)) continue;
            if ((@as(c_int, vendor_id) != @as(c_int, 0)) or (@as(c_int, product_id) != @as(c_int, 0))) {
                if (!(parse_hid_vid_pid_from_sysfs(sysfs_path, &bus_type, &dev_vid, &dev_pid) != 0)) continue;
                if ((@as(c_int, vendor_id) != @as(c_int, 0)) and (@as(c_int, vendor_id) != @as(c_int, dev_vid))) continue;
                if ((@as(c_int, product_id) != @as(c_int, 0)) and (@as(c_int, product_id) != @as(c_int, dev_pid))) continue;
            }
            raw_dev = udev_ctx.*.udev_device_new_from_syspath.?(udev_1, sysfs_path);
            if (!(raw_dev != null)) continue;
            tmp = PLATFORM_create_device_info_for_device(raw_dev);
            if (tmp != null) {
                if (!(tmp.*.manufacturer_string != null) and (udev_ctx.*.udev_hwdb_new != null)) {
                    key = "ID_VENDOR_FROM_DATABASE";
                    if (@as(?*anyopaque, @ptrCast(@alignCast(blk: {
                        const tmp_1 = udev_ctx.*.udev_hwdb_new.?(udev_1);
                        hwdb = tmp_1;
                        break :blk tmp_1;
                    }))) != @as(?*anyopaque, null)) {
                        _ = snprintf(@ptrCast(@alignCast(&modalias)), @sizeOf(@TypeOf(modalias)), "usb:v%04X*", vendor_id);
                        {
                            entry = udev_ctx.*.udev_hwdb_get_properties_list_entry.?(hwdb, @ptrCast(@alignCast(&modalias)), 0);
                            while (entry != null) : (entry = udev_ctx.*.udev_list_entry_get_next.?(entry)) {
                                if (strcmp(udev_ctx.*.udev_list_entry_get_name.?(entry), key) == @as(c_int, 0)) {
                                    manufacturer_string = udev_ctx.*.udev_list_entry_get_value.?(entry);
                                    if (manufacturer_string != null) {
                                        tmp.*.manufacturer_string = utf8_to_wchar_t(manufacturer_string);
                                    }
                                    break;
                                }
                            }
                        }
                        hwdb = udev_ctx.*.udev_hwdb_unref.?(hwdb);
                    }
                }
                if (cur_dev != null) {
                    cur_dev.*.next = tmp;
                } else {
                    root = tmp;
                }
                cur_dev = tmp;
                while (@as(?*anyopaque, @ptrCast(@alignCast(cur_dev.*.next))) != @as(?*anyopaque, null)) {
                    cur_dev = cur_dev.*.next;
                }
            }
            _ = udev_ctx.*.udev_device_unref.?(raw_dev);
        }
    }
    _ = udev_ctx.*.udev_enumerate_unref.?(enumerate);
    _ = udev_ctx.*.udev_unref.?(udev_1);
    if (@as(?*anyopaque, @ptrCast(@alignCast(root))) == @as(?*anyopaque, null)) {
        if ((@as(c_int, vendor_id) == @as(c_int, 0)) and (@as(c_int, product_id) == @as(c_int, 0))) {
            register_global_error("No HID devices found in the system.");
        } else {
            register_global_error("No HID devices with requested VID/PID found in the system.");
        }
    }
    return root;
}
pub export fn PLATFORM_hid_free_enumeration(devs: [*c]struct_hid_device_info) void {
    @setEvalBranchQuota(100000);
    var d: [*c]struct_hid_device_info = devs;
    _ = &d;
    while (d != null) {
        var next: [*c]struct_hid_device_info = d.*.next;
        _ = &next;
        free(@ptrCast(@alignCast(d.*.path)));
        free(@ptrCast(@alignCast(d.*.serial_number)));
        free(@ptrCast(@alignCast(d.*.manufacturer_string)));
        free(@ptrCast(@alignCast(d.*.product_string)));
        free(@ptrCast(@alignCast(d)));
        d = next;
    }
}
pub export fn PLATFORM_hid_open(vendor_id: c_ushort, product_id: c_ushort, serial_number: [*c]const wchar_t) [*c]PLATFORM_hid_device {
    @setEvalBranchQuota(100000);
    var devs: [*c]struct_hid_device_info = undefined;
    _ = &devs;
    var cur_dev: [*c]struct_hid_device_info = undefined;
    _ = &cur_dev;
    var path_to_open: [*c]const u8 = null;
    _ = &path_to_open;
    var handle: [*c]PLATFORM_hid_device = null;
    _ = &handle;
    devs = PLATFORM_hid_enumerate(vendor_id, product_id);
    if (@as(?*anyopaque, @ptrCast(@alignCast(devs))) == @as(?*anyopaque, null)) {
        return null;
    }
    cur_dev = devs;
    while (cur_dev != null) {
        if ((@as(c_int, cur_dev.*.vendor_id) == @as(c_int, vendor_id)) and (@as(c_int, cur_dev.*.product_id) == @as(c_int, product_id))) {
            if (serial_number != null) {
                if (wcscmp(serial_number, cur_dev.*.serial_number) == @as(c_int, 0)) {
                    path_to_open = cur_dev.*.path;
                    break;
                }
            } else {
                path_to_open = cur_dev.*.path;
                break;
            }
        }
        cur_dev = cur_dev.*.next;
    }
    if (path_to_open != null) {
        handle = PLATFORM_hid_open_path(path_to_open);
    } else {
        register_global_error("Device with requested VID/PID/(SerialNumber) not found");
    }
    PLATFORM_hid_free_enumeration(devs);
    return handle;
}
pub export fn PLATFORM_hid_open_path(path: [*c]const u8) [*c]PLATFORM_hid_device {
    @setEvalBranchQuota(100000);
    var dev: [*c]PLATFORM_hid_device = null;
    _ = &dev;
    _ = PLATFORM_hid_init();
    dev = PLATFORM_new_hid_device();
    if (!(dev != null)) {
        register_global_error("Couldn't allocate memory");
        return null;
    }
    const MAX_ATTEMPTS: c_int = 50;
    _ = &MAX_ATTEMPTS;
    var attempt: c_int = undefined;
    _ = &attempt;
    {
        attempt = 1;
        while (attempt <= MAX_ATTEMPTS) : (attempt += 1) {
            dev.*.device_handle = open(path, O_RDWR | __O_CLOEXEC);
            if ((dev.*.device_handle < @as(c_int, 0)) and (__errno_location().* == EACCES)) {
                _ = usleep(@bitCast(@as(c_int, @as(c_int, 1) * @as(c_int, 1000))));
                continue;
            }
            break;
        }
    }
    if (dev.*.device_handle >= @as(c_int, 0)) {
        var res: c_int = undefined;
        _ = &res;
        var desc_size: c_int = 0;
        _ = &desc_size;
        res = ioctl(dev.*.device_handle, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'H') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(c_int) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), &desc_size);
        if (res < @as(c_int, 0)) {
            PLATFORM_hid_close(dev);
            register_global_error_format("ioctl(GRDESCSIZE) error for '%s', not a HIDRAW device?: %s", path, strerror(__errno_location().*));
            return null;
        }
        dev.*.needs_ble_hack = @intFromBool(is_BLE(dev) == @as(c_int, 1));
        return dev;
    } else {
        free(@ptrCast(@alignCast(dev)));
        register_global_error_format("Failed to open a device with path '%s': %s", path, strerror(__errno_location().*));
        return null;
    }
}
pub export fn PLATFORM_hid_write(dev: [*c]PLATFORM_hid_device, data: [*c]const u8, length: usize) c_int {
    @setEvalBranchQuota(100000);
    var bytes_written: c_int = undefined;
    _ = &bytes_written;
    if (!(data != null) or (length == @as(usize, 0))) {
        __errno_location().* = EINVAL;
        register_device_error(dev, strerror(__errno_location().*));
        return -@as(c_int, 1);
    }
    bytes_written = @truncate(write(dev.*.device_handle, @ptrCast(@alignCast(data)), length));
    register_device_error(dev, @ptrCast(@alignCast(if (bytes_written == -@as(c_int, 1)) @as(?*anyopaque, @ptrCast(@alignCast(strerror(__errno_location().*)))) else @as(?*anyopaque, null))));
    return bytes_written;
}
pub export fn PLATFORM_hid_read_timeout(dev: [*c]PLATFORM_hid_device, data: [*c]u8, length: usize, arg_milliseconds: c_int) c_int {
    @setEvalBranchQuota(100000);
    var milliseconds = arg_milliseconds;
    _ = &milliseconds;
    register_device_error(dev, null);
    var bytes_read: c_int = undefined;
    _ = &bytes_read;
    if (milliseconds >= @as(c_int, 0)) {
        var ret: c_int = undefined;
        _ = &ret;
        var fds: struct_pollfd = undefined;
        _ = &fds;
        fds.fd = dev.*.device_handle;
        fds.events = POLLIN;
        fds.revents = 0;
        ret = poll(&fds, 1, milliseconds);
        if (ret == @as(c_int, 0)) {
            return ret;
        }
        if (ret == -@as(c_int, 1)) {
            register_device_error(dev, strerror(__errno_location().*));
            return ret;
        } else {
            if ((@as(c_int, fds.revents) & ((POLLERR | POLLHUP) | POLLNVAL)) != 0) {
                register_device_error(dev, "hid_read_timeout: unexpected poll error (device disconnected)");
                return -@as(c_int, 1);
            }
        }
    }
    bytes_read = @truncate(read(dev.*.device_handle, @ptrCast(@alignCast(data)), length));
    if (bytes_read < @as(c_int, 0)) {
        if ((__errno_location().* == EAGAIN) or (__errno_location().* == EINPROGRESS)) {
            bytes_read = 0;
        } else {
            register_device_error(dev, strerror(__errno_location().*));
        }
    }
    return bytes_read;
}
pub export fn PLATFORM_hid_read(dev: [*c]PLATFORM_hid_device, data: [*c]u8, length: usize) c_int {
    @setEvalBranchQuota(100000);
    return PLATFORM_hid_read_timeout(dev, data, length, if (dev.*.blocking != 0) -@as(c_int, 1) else @as(c_int, 0));
}
pub export fn PLATFORM_hid_set_nonblocking(dev: [*c]PLATFORM_hid_device, nonblock: c_int) c_int {
    @setEvalBranchQuota(100000);
    dev.*.blocking = @intFromBool(!(nonblock != 0));
    return 0;
}
pub export fn PLATFORM_hid_send_feature_report(dev: [*c]PLATFORM_hid_device, data: [*c]const u8, length: usize) c_int {
    @setEvalBranchQuota(100000);
    const static_local_MAX_RETRIES = struct {
        const MAX_RETRIES: c_int = 50;
    };
    _ = &static_local_MAX_RETRIES;
    var retry: c_int = undefined;
    _ = &retry;
    var res: c_int = undefined;
    _ = &res;
    register_device_error(dev, null);
    {
        retry = 0;
        while (retry < static_local_MAX_RETRIES.MAX_RETRIES) : (retry += 1) {
            res = ioctl(dev.*.device_handle, @as(usize, (((_IOC_WRITE | _IOC_READ) << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'H') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 6) << @intCast(_IOC_NRSHIFT))))) | (length << @intCast(@as(usize, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), data);
            if ((res < @as(c_int, 0)) and (__errno_location().* == EPIPE)) {
                continue;
            }
            if (res < @as(c_int, 0)) {
                register_device_error_format(dev, "ioctl (SFEATURE): %s", strerror(__errno_location().*));
            }
            break;
        }
    }
    return res;
}
pub export fn PLATFORM_hid_get_feature_report(dev: [*c]PLATFORM_hid_device, data: [*c]u8, length: usize) c_int {
    @setEvalBranchQuota(100000);
    var res: c_int = undefined;
    _ = &res;
    var report: u8 = data[@as(c_int, 0)];
    _ = &report;
    register_device_error(dev, null);
    res = ioctl(dev.*.device_handle, @as(usize, (((_IOC_WRITE | _IOC_READ) << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'H') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 7) << @intCast(_IOC_NRSHIFT))))) | (length << @intCast(@as(usize, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), data);
    if (res < @as(c_int, 0)) {
        register_device_error_format(dev, "ioctl (GFEATURE): %s", strerror(__errno_location().*));
    } else if (dev.*.needs_ble_hack != 0) {
        if ((@as(c_int, data[@as(c_int, 0)]) == @as(c_int, report)) and (@as(c_int, data[@as(c_int, 1)]) == @as(c_int, report))) {
            _ = memmove(@ptrCast(@alignCast(&data[@as(c_int, 0)])), @ptrCast(@alignCast(&data[@as(c_int, 1)])), @bitCast(@as(c_long, res)));
        } else if (@as(c_int, data[@as(c_int, 0)]) != @as(c_int, report)) {
            _ = memmove(@ptrCast(@alignCast(&data[@as(c_int, 1)])), @ptrCast(@alignCast(&data[@as(c_int, 0)])), @bitCast(@as(c_long, res)));
            data[@as(c_int, 0)] = report;
            res += 1;
        }
    }
    return res;
}
pub export fn PLATFORM_hid_get_input_report(dev: [*c]PLATFORM_hid_device, data: [*c]u8, length: usize) c_int {
    @setEvalBranchQuota(100000);
    var res: c_int = undefined;
    _ = &res;
    register_device_error(dev, null);
    res = ioctl(dev.*.device_handle, @as(usize, (((_IOC_WRITE | _IOC_READ) << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'H') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 10) << @intCast(_IOC_NRSHIFT))))) | (length << @intCast(@as(usize, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), data);
    if (res < @as(c_int, 0)) {
        register_device_error_format(dev, "ioctl (GINPUT): %s", strerror(__errno_location().*));
    }
    return res;
}
pub export fn PLATFORM_hid_close(dev: [*c]PLATFORM_hid_device) void {
    @setEvalBranchQuota(100000);
    if (!(dev != null)) return;
    _ = close(dev.*.device_handle);
    register_device_error(dev, null);
    PLATFORM_hid_free_enumeration(dev.*.device_info);
    free(@ptrCast(@alignCast(dev)));
}
pub export fn PLATFORM_hid_get_manufacturer_string(dev: [*c]PLATFORM_hid_device, string: [*c]wchar_t, maxlen: usize) c_int {
    @setEvalBranchQuota(100000);
    if (!(string != null) or !(maxlen != 0)) {
        register_device_error(dev, "Zero buffer/length");
        return -@as(c_int, 1);
    }
    var info: [*c]struct_hid_device_info = PLATFORM_hid_get_device_info(dev);
    _ = &info;
    if (!(info != null)) {
        return -@as(c_int, 1);
    }
    if (info.*.manufacturer_string != null) {
        _ = wcsncpy(string, info.*.manufacturer_string, maxlen);
        string[maxlen -% @as(usize, 1)] = '\u{0}';
    } else {
        string[@as(c_int, 0)] = '\u{0}';
    }
    return 0;
}
pub export fn PLATFORM_hid_get_product_string(dev: [*c]PLATFORM_hid_device, string: [*c]wchar_t, maxlen: usize) c_int {
    @setEvalBranchQuota(100000);
    if (!(string != null) or !(maxlen != 0)) {
        register_device_error(dev, "Zero buffer/length");
        return -@as(c_int, 1);
    }
    var info: [*c]struct_hid_device_info = PLATFORM_hid_get_device_info(dev);
    _ = &info;
    if (!(info != null)) {
        return -@as(c_int, 1);
    }
    if (info.*.product_string != null) {
        _ = wcsncpy(string, info.*.product_string, maxlen);
        string[maxlen -% @as(usize, 1)] = '\u{0}';
    } else {
        string[@as(c_int, 0)] = '\u{0}';
    }
    return 0;
}
pub export fn PLATFORM_hid_get_serial_number_string(dev: [*c]PLATFORM_hid_device, string: [*c]wchar_t, maxlen: usize) c_int {
    @setEvalBranchQuota(100000);
    if (!(string != null) or !(maxlen != 0)) {
        register_device_error(dev, "Zero buffer/length");
        return -@as(c_int, 1);
    }
    var info: [*c]struct_hid_device_info = PLATFORM_hid_get_device_info(dev);
    _ = &info;
    if (!(info != null)) {
        return -@as(c_int, 1);
    }
    if (info.*.serial_number != null) {
        _ = wcsncpy(string, info.*.serial_number, maxlen);
        string[maxlen -% @as(usize, 1)] = '\u{0}';
    } else {
        string[@as(c_int, 0)] = '\u{0}';
    }
    return 0;
}
pub export fn PLATFORM_hid_get_device_info(dev: [*c]PLATFORM_hid_device) [*c]struct_hid_device_info {
    @setEvalBranchQuota(100000);
    if (!(dev.*.device_info != null)) {
        dev.*.device_info = create_device_info_for_hid_device(dev);
    }
    return dev.*.device_info;
}
pub export fn PLATFORM_hid_get_indexed_string(dev: [*c]PLATFORM_hid_device, arg_string_index: c_int, arg_string: [*c]wchar_t, arg_maxlen: usize) c_int {
    @setEvalBranchQuota(100000);
    var string_index = arg_string_index;
    _ = &string_index;
    var string = arg_string;
    _ = &string;
    var maxlen = arg_maxlen;
    _ = &maxlen;
    _ = &string_index;
    _ = &string;
    _ = &maxlen;
    register_device_error(dev, "hid_get_indexed_string: not supported by hidraw");
    return -@as(c_int, 1);
}
pub export fn PLATFORM_hid_get_report_descriptor(dev: [*c]PLATFORM_hid_device, buf: [*c]u8, arg_buf_size: usize) c_int {
    @setEvalBranchQuota(100000);
    var buf_size = arg_buf_size;
    _ = &buf_size;
    var rpt_desc: struct_hidraw_report_descriptor = undefined;
    _ = &rpt_desc;
    var res: c_int = get_hid_report_descriptor_from_hidraw(dev, &rpt_desc);
    _ = &res;
    if (res < @as(c_int, 0)) {
        return res;
    }
    if (@as(usize, rpt_desc.size) < buf_size) {
        buf_size = rpt_desc.size;
    }
    _ = memcpy(@ptrCast(@alignCast(buf)), @ptrCast(@alignCast(@as([*c]__u8, @ptrCast(@alignCast(&rpt_desc.value))))), buf_size);
    return @bitCast(@as(c_uint, @truncate(buf_size)));
}
pub export fn PLATFORM_hid_error(dev: [*c]PLATFORM_hid_device) [*c]const wchar_t {
    @setEvalBranchQuota(100000);
    if (dev != null) {
        const wide_string_28 = [7:0]c_int{
            '\u{53}',
            '\u{75}',
            '\u{63}',
            '\u{63}',
            '\u{65}',
            '\u{73}',
            '\u{73}',
        };
        if (@as(?*anyopaque, @ptrCast(@alignCast(dev.*.last_error_str))) == @as(?*anyopaque, null)) return &wide_string_28;
        return dev.*.last_error_str;
    }
    const wide_string_29 = [7:0]c_int{
        '\u{53}',
        '\u{75}',
        '\u{63}',
        '\u{63}',
        '\u{65}',
        '\u{73}',
        '\u{73}',
    };
    if (@as(?*anyopaque, @ptrCast(@alignCast(last_global_error_str))) == @as(?*anyopaque, null)) return &wide_string_29;
    return last_global_error_str;
}
// /usr/include/bits/types.h:31:1: warning: struct demoted to opaque type - has bitfield
pub const LIBUSB_CLASS_HID: c_int = 3;
pub const LIBUSB_CLASS_VENDOR_SPEC: c_int = 255;
pub const LIBUSB_DT_STRING: c_int = 3;
pub const LIBUSB_DT_HID: c_int = 33;
pub const LIBUSB_DT_REPORT: c_int = 34;
pub const LIBUSB_ENDPOINT_OUT: c_int = 0;
pub const LIBUSB_ENDPOINT_IN: c_int = 128;
pub const LIBUSB_REQUEST_GET_DESCRIPTOR: c_int = 6;
pub const LIBUSB_REQUEST_TYPE_CLASS: c_int = 32;
pub const LIBUSB_RECIPIENT_INTERFACE: c_int = 1;
pub const struct_libusb_device_descriptor = extern struct {
    bLength: u8 = 0,
    bDescriptorType: u8 = 0,
    bcdUSB: u16 = 0,
    bDeviceClass: u8 = 0,
    bDeviceSubClass: u8 = 0,
    bDeviceProtocol: u8 = 0,
    bMaxPacketSize0: u8 = 0,
    idVendor: u16 = 0,
    idProduct: u16 = 0,
    bcdDevice: u16 = 0,
    iManufacturer: u8 = 0,
    iProduct: u8 = 0,
    iSerialNumber: u8 = 0,
    bNumConfigurations: u8 = 0,
};
pub const struct_libusb_endpoint_descriptor = extern struct {
    bLength: u8 = 0,
    bDescriptorType: u8 = 0,
    bEndpointAddress: u8 = 0,
    bmAttributes: u8 = 0,
    wMaxPacketSize: u16 = 0,
    bInterval: u8 = 0,
    bRefresh: u8 = 0,
    bSynchAddress: u8 = 0,
    extra: [*c]const u8 = null,
    extra_length: c_int = 0,
};
pub const struct_libusb_interface_descriptor = extern struct {
    bLength: u8 = 0,
    bDescriptorType: u8 = 0,
    bInterfaceNumber: u8 = 0,
    bAlternateSetting: u8 = 0,
    bNumEndpoints: u8 = 0,
    bInterfaceClass: u8 = 0,
    bInterfaceSubClass: u8 = 0,
    bInterfaceProtocol: u8 = 0,
    iInterface: u8 = 0,
    endpoint: [*c]const struct_libusb_endpoint_descriptor = null,
    extra: [*c]const u8 = null,
    extra_length: c_int = 0,
};
pub const struct_libusb_interface = extern struct {
    altsetting: [*c]const struct_libusb_interface_descriptor = null,
    num_altsetting: c_int = 0,
};
pub const struct_libusb_config_descriptor = extern struct {
    bLength: u8 = 0,
    bDescriptorType: u8 = 0,
    wTotalLength: u16 = 0,
    bNumInterfaces: u8 = 0,
    bConfigurationValue: u8 = 0,
    iConfiguration: u8 = 0,
    bmAttributes: u8 = 0,
    MaxPower: u8 = 0,
    interface: [*c]const struct_libusb_interface = null,
    extra: [*c]const u8 = null,
    extra_length: c_int = 0,
};
pub const struct_libusb_context = opaque {
};
pub const struct_libusb_device = opaque {
};
pub const struct_libusb_device_handle = opaque {
};
pub const libusb_context = struct_libusb_context;
pub const libusb_device = struct_libusb_device;
pub const libusb_device_handle = struct_libusb_device_handle;
pub const LIBUSB_ERROR_OVERFLOW: c_int = -8;
pub const LIBUSB_TRANSFER_TYPE_INTERRUPT: c_int = 3;
pub const LIBUSB_TRANSFER_COMPLETED: c_int = 0;
pub const LIBUSB_TRANSFER_TIMED_OUT: c_int = 2;
pub const LIBUSB_TRANSFER_CANCELLED: c_int = 3;
pub const LIBUSB_TRANSFER_NO_DEVICE: c_int = 5;
pub const enum_libusb_transfer_status = c_uint;
pub const struct_libusb_iso_packet_descriptor = extern struct {
    length: c_uint = 0,
    actual_length: c_uint = 0,
    status: enum_libusb_transfer_status = @import("std").mem.zeroes(enum_libusb_transfer_status),
};
pub const libusb_transfer_cb_fn = ?*const fn (transfer: [*c]struct_libusb_transfer) callconv(.c) void;
pub const struct_libusb_transfer = extern struct {
    dev_handle: ?*libusb_device_handle = null,
    flags: u8 = 0,
    endpoint: u8 = 0,
    type: u8 = 0,
    timeout: c_uint = 0,
    status: enum_libusb_transfer_status = @import("std").mem.zeroes(enum_libusb_transfer_status),
    length: c_int = 0,
    actual_length: c_int = 0,
    callback: libusb_transfer_cb_fn = null,
    user_data: ?*anyopaque = null,
    buffer: [*c]u8 = null,
    num_iso_packets: c_int = 0,
    _iso_packet_desc: [0]struct_libusb_iso_packet_descriptor = @import("std").mem.zeroes([0]struct_libusb_iso_packet_descriptor),
    pub fn iso_packet_desc(_self: anytype) __helpers.FlexibleArrayType(@TypeOf(_self), @typeInfo(@TypeOf(_self.*._iso_packet_desc)).array.child) {
        return @ptrCast(@alignCast(&_self.*._iso_packet_desc));
    }
};
pub const LIBUSB_CAP_HAS_HOTPLUG: c_int = 1;
pub const libusb_hotplug_callback_handle = c_int;
pub const LIBUSB_HOTPLUG_EVENT_DEVICE_ARRIVED: c_int = 1;
pub const LIBUSB_HOTPLUG_EVENT_DEVICE_LEFT: c_int = 2;
pub const libusb_hotplug_event = c_uint;
pub const libusb_hotplug_callback_fn = ?*const fn (ctx: ?*libusb_context, device: ?*libusb_device, event: libusb_hotplug_event, user_data: ?*anyopaque) callconv(.c) c_int;
pub const struct_SDL_LibUSBContext = extern struct {
    init: ?*const fn (ctx: [*c]?*libusb_context) callconv(.c) c_int = null,
    exit: ?*const fn (ctx: ?*libusb_context) callconv(.c) void = null,
    get_device_list: ?*const fn (ctx: ?*libusb_context, list: [*c][*c]?*libusb_device) callconv(.c) isize = null,
    free_device_list: ?*const fn (list: [*c]?*libusb_device, unref_devices: c_int) callconv(.c) void = null,
    get_device_descriptor: ?*const fn (dev: ?*libusb_device, desc: [*c]struct_libusb_device_descriptor) callconv(.c) c_int = null,
    get_active_config_descriptor: ?*const fn (dev: ?*libusb_device, config: [*c][*c]struct_libusb_config_descriptor) callconv(.c) c_int = null,
    get_config_descriptor: ?*const fn (dev: ?*libusb_device, config_index: u8, config: [*c][*c]struct_libusb_config_descriptor) callconv(.c) c_int = null,
    free_config_descriptor: ?*const fn (config: [*c]struct_libusb_config_descriptor) callconv(.c) void = null,
    get_bus_number: ?*const fn (dev: ?*libusb_device) callconv(.c) u8 = null,
    get_port_numbers: ?*const fn (dev: ?*libusb_device, port_numbers: [*c]u8, port_numbers_len: c_int) callconv(.c) c_int = null,
    get_device_address: ?*const fn (dev: ?*libusb_device) callconv(.c) u8 = null,
    open: ?*const fn (dev: ?*libusb_device, dev_handle: [*c]?*libusb_device_handle) callconv(.c) c_int = null,
    close: ?*const fn (dev_handle: ?*libusb_device_handle) callconv(.c) void = null,
    get_device: ?*const fn (dev_handle: ?*libusb_device_handle) callconv(.c) ?*libusb_device = null,
    claim_interface: ?*const fn (dev_handle: ?*libusb_device_handle, interface_number: c_int) callconv(.c) c_int = null,
    release_interface: ?*const fn (dev_handle: ?*libusb_device_handle, interface_number: c_int) callconv(.c) c_int = null,
    kernel_driver_active: ?*const fn (dev_handle: ?*libusb_device_handle, interface_number: c_int) callconv(.c) c_int = null,
    detach_kernel_driver: ?*const fn (dev_handle: ?*libusb_device_handle, interface_number: c_int) callconv(.c) c_int = null,
    attach_kernel_driver: ?*const fn (dev_handle: ?*libusb_device_handle, interface_number: c_int) callconv(.c) c_int = null,
    set_auto_detach_kernel_driver: ?*const fn (dev_handle: ?*libusb_device_handle, enable: c_int) callconv(.c) c_int = null,
    set_interface_alt_setting: ?*const fn (dev: ?*libusb_device_handle, interface_number: c_int, alternate_setting: c_int) callconv(.c) c_int = null,
    alloc_transfer: ?*const fn (iso_packets: c_int) callconv(.c) [*c]struct_libusb_transfer = null,
    submit_transfer: ?*const fn (transfer: [*c]struct_libusb_transfer) callconv(.c) c_int = null,
    cancel_transfer: ?*const fn (transfer: [*c]struct_libusb_transfer) callconv(.c) c_int = null,
    free_transfer: ?*const fn (transfer: [*c]struct_libusb_transfer) callconv(.c) void = null,
    control_transfer: ?*const fn (dev_handle: ?*libusb_device_handle, request_type: u8, bRequest: u8, wValue: u16, wIndex: u16, data: [*c]u8, wLength: u16, timeout: c_uint) callconv(.c) c_int = null,
    interrupt_transfer: ?*const fn (dev_handle: ?*libusb_device_handle, endpoint: u8, data: [*c]u8, length: c_int, actual_length: [*c]c_int, timeout: c_uint) callconv(.c) c_int = null,
    bulk_transfer: ?*const fn (dev_handle: ?*libusb_device_handle, endpoint: u8, data: [*c]u8, length: c_int, transferred: [*c]c_int, timeout: c_uint) callconv(.c) c_int = null,
    handle_events: ?*const fn (ctx: ?*libusb_context) callconv(.c) c_int = null,
    handle_events_completed: ?*const fn (ctx: ?*libusb_context, completed: [*c]c_int) callconv(.c) c_int = null,
    interrupt_event_handler: ?*const fn (ctx: ?*libusb_context) callconv(.c) void = null,
    has_capability: ?*const fn (capability: u32) callconv(.c) c_int = null,
    hotplug_register_callback: ?*const fn (ctx: ?*libusb_context, events: c_int, flags: c_int, vendor_id: c_int, product_id: c_int, dev_class: c_int, cb_fn: libusb_hotplug_callback_fn, user_data: ?*anyopaque, callback_handle: [*c]libusb_hotplug_callback_handle) callconv(.c) c_int = null,
    hotplug_deregister_callback: ?*const fn (ctx: ?*libusb_context, callback_handle: libusb_hotplug_callback_handle) callconv(.c) void = null,
    error_name: ?*const fn (errcode: c_int) callconv(.c) [*c]const u8 = null,
};
pub const SDL_LibUSBContext = struct_SDL_LibUSBContext;
pub extern fn SDL_InitLibUSB(ctx: [*c][*c]SDL_LibUSBContext) bool;
pub extern fn SDL_QuitLibUSB() void;
pub var libusb_ctx: [*c]SDL_LibUSBContext = null;
pub const struct_LIBUSB_input_report = extern struct {
    data: [*c]u8 = null,
    len: usize = 0,
    next: [*c]struct_LIBUSB_input_report = null,
};
pub const struct_LIBUSB_hid_device_ = extern struct {
    device_handle: ?*libusb_device_handle = null,
    config_number: c_int = 0,
    interface: c_int = 0,
    interface_class: c_int = 0,
    interface_subclass: c_int = 0,
    interface_protocol: c_int = 0,
    report_descriptor_size: u16 = 0,
    input_endpoint: c_int = 0,
    output_endpoint: c_int = 0,
    input_ep_max_packet_size: c_int = 0,
    manufacturer_index: c_int = 0,
    product_index: c_int = 0,
    serial_index: c_int = 0,
    device_info: [*c]struct_hid_device_info = null,
    blocking: c_int = 0,
    thread_state: hidapi_thread_state = @import("std").mem.zeroes(hidapi_thread_state),
    shutdown_thread: c_int = 0,
    transfer_loop_finished: c_int = 0,
    transfer: [*c]struct_libusb_transfer = null,
    skip_output_report_id: c_int = 0,
    no_skip_output_report_id: c_int = 0,
    no_output_reports_on_intr_ep: c_int = 0,
    input_reports: [*c]struct_LIBUSB_input_report = null,
    is_driver_detached: c_int = 0,
};
pub const LIBUSB_hid_device = struct_LIBUSB_hid_device_;
pub fn SDL_libusb_get_string_descriptor(dev: ?*libusb_device_handle, descriptor_index: u8, lang_id: u16, data: [*c]u8, length: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return libusb_ctx.*.control_transfer.?(dev, @bitCast(@as(i8, @truncate(LIBUSB_ENDPOINT_IN | @as(c_int, 0)))), LIBUSB_REQUEST_GET_DESCRIPTOR, @bitCast(@as(c_short, @truncate((LIBUSB_DT_STRING << @intCast(@as(c_int, 8))) | @as(c_int, descriptor_index)))), lang_id, data, @bitCast(@as(c_short, @truncate(length))), 1000);
}
pub fn SDL_libusb_fill_interrupt_transfer(transfer: [*c]struct_libusb_transfer, dev_handle: ?*libusb_device_handle, endpoint: u8, buffer: [*c]u8, length: c_int, callback: libusb_transfer_cb_fn, user_data: ?*anyopaque, timeout: c_uint) callconv(.c) void {
    @setEvalBranchQuota(100000);
    transfer.*.dev_handle = dev_handle;
    transfer.*.endpoint = endpoint;
    transfer.*.type = LIBUSB_TRANSFER_TYPE_INTERRUPT;
    transfer.*.timeout = timeout;
    transfer.*.buffer = buffer;
    transfer.*.length = length;
    transfer.*.user_data = user_data;
    transfer.*.callback = callback;
}
pub const struct__SDL_ThreadBarrier = extern struct {
    mutex: ?*SDL_Mutex = null,
    cond: ?*SDL_Condition = null,
    count: Uint32 = 0,
    trip_count: Uint32 = 0,
};
pub const SDL_ThreadBarrier = struct__SDL_ThreadBarrier;
pub fn SDL_CreateThreadBarrier(barrier: [*c]SDL_ThreadBarrier, count: Uint32) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [23:0]u8 = "SDL_CreateThreadBarrier".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(barrier))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "barrier != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "hidapi_thread_sdl.h", 36);
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
        while (!(count != @as(Uint32, 0))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "count != 0",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "hidapi_thread_sdl.h", 37);
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
    barrier.*.mutex = SDL_CreateMutex_REAL();
    if (@as(?*anyopaque, @ptrCast(@alignCast(barrier.*.mutex))) == @as(?*anyopaque, null)) {
        return -@as(c_int, 1);
    }
    barrier.*.cond = SDL_CreateCondition_REAL();
    if (@as(?*anyopaque, @ptrCast(@alignCast(barrier.*.cond))) == @as(?*anyopaque, null)) {
        return -@as(c_int, 1);
    }
    barrier.*.trip_count = count;
    barrier.*.count = 0;
    return 0;
}
pub fn SDL_DestroyThreadBarrier(barrier: [*c]SDL_ThreadBarrier) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (barrier.*.cond != null) {
        SDL_DestroyCondition_REAL(barrier.*.cond);
        barrier.*.cond = null;
    }
    if (barrier.*.mutex != null) {
        SDL_DestroyMutex_REAL(barrier.*.mutex);
        barrier.*.mutex = null;
    }
}
pub const SDL_ErrorCode = c_uint;
pub const hidapi_timespec = Uint64;
pub const hidapi_thread_state = extern struct {
    thread: [*c]SDL_Thread = null,
    mutex: ?*SDL_Mutex = null,
    condition: ?*SDL_Condition = null,
    barrier: SDL_ThreadBarrier = @import("std").mem.zeroes(SDL_ThreadBarrier),
};
pub fn hidapi_thread_state_init(state: [*c]hidapi_thread_state) callconv(.c) void {
    @setEvalBranchQuota(100000);
    state.*.mutex = SDL_CreateMutex_REAL();
    state.*.condition = SDL_CreateCondition_REAL();
    _ = SDL_CreateThreadBarrier(&state.*.barrier, 2);
}
pub fn hidapi_thread_state_destroy(state: [*c]hidapi_thread_state) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_DestroyThreadBarrier(&state.*.barrier);
    if (state.*.condition != null) {
        SDL_DestroyCondition_REAL(state.*.condition);
        state.*.condition = null;
    }
    if (state.*.mutex != null) {
        SDL_DestroyMutex_REAL(state.*.mutex);
        state.*.mutex = null;
    }
}
pub fn hidapi_thread_cleanup_push(_: ?*const fn (?*anyopaque) callconv(.c) void, _: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn hidapi_thread_cleanup_pop(_: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn hidapi_thread_mutex_lock(state: [*c]hidapi_thread_state) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_LockMutex_REAL(state.*.mutex);
}
pub fn hidapi_thread_mutex_unlock(state: [*c]hidapi_thread_state) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_UnlockMutex_REAL(state.*.mutex);
}
pub fn hidapi_thread_cond_wait(state: [*c]hidapi_thread_state) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_WaitCondition_REAL(state.*.condition, state.*.mutex);
}
pub fn hidapi_thread_cond_timedwait(state: [*c]hidapi_thread_state, ts: [*c]hidapi_timespec) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var timeout_ns: Sint64 = undefined;
    _ = &timeout_ns;
    var timeout_ms: Sint32 = undefined;
    _ = &timeout_ms;
    timeout_ns = @bitCast(@as(c_ulong, @truncate(ts.* -% SDL_GetTicksNS_REAL())));
    if (timeout_ns <= @as(Sint64, 0)) {
        timeout_ms = 0;
    } else {
        timeout_ms = @truncate(@divTrunc(timeout_ns, @as(Sint64, SDL_NS_PER_MS)));
    }
    if (SDL_WaitConditionTimeout_REAL(state.*.condition, state.*.mutex, timeout_ms)) {
        return 0;
    } else {
        return HIDAPI_THREAD_TIMED_OUT;
    }
}
pub fn hidapi_thread_cond_signal(state: [*c]hidapi_thread_state) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_SignalCondition_REAL(state.*.condition);
}
pub fn hidapi_thread_cond_broadcast(state: [*c]hidapi_thread_state) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_BroadcastCondition_REAL(state.*.condition);
}
pub const RunInputThreadParam = extern struct {
    func: ?*const fn (?*anyopaque) callconv(.c) ?*anyopaque = null,
    func_arg: ?*anyopaque = null,
};
pub fn RunInputThread(param: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var data: [*c]RunInputThreadParam = @ptrCast(@alignCast(param));
    _ = &data;
    var func: ?*const fn (?*anyopaque) callconv(.c) ?*anyopaque = data.*.func;
    _ = &func;
    var func_arg: ?*anyopaque = data.*.func_arg;
    _ = &func_arg;
    SDL_free_REAL(@ptrCast(@alignCast(data)));
    _ = func.?(func_arg);
    return 0;
}
pub fn hidapi_thread_create(state: [*c]hidapi_thread_state, func: ?*const fn (?*anyopaque) callconv(.c) ?*anyopaque, func_arg: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var param: [*c]RunInputThreadParam = undefined;
    param = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(@TypeOf(param.*)))));
    _ = &param;
    param.*.func = func;
    param.*.func_arg = func_arg;
    state.*.thread = SDL_CreateThreadRuntime_REAL(RunInputThread, "libusb", @ptrCast(@alignCast(param)), null, null);
}
pub fn hidapi_thread_join(state: [*c]hidapi_thread_state) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_WaitThread_REAL(state.*.thread, null);
}
pub fn hidapi_thread_gettime(ts: [*c]hidapi_timespec) callconv(.c) void {
    @setEvalBranchQuota(100000);
    ts.* = SDL_GetTicksNS_REAL();
}
pub fn hidapi_thread_addtime(ts: [*c]hidapi_timespec, milliseconds: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    ts.* +%= @as(Uint64, @bitCast(@as(c_long, milliseconds))) *% @as(Uint64, SDL_NS_PER_MS);
}
pub var api_version: struct_hid_api_version = struct_hid_api_version{
    .major = HID_API_VERSION_MAJOR,
    .minor = HID_API_VERSION_MINOR,
    .patch = HID_API_VERSION_PATCH,
};
pub var usb_context: ?*libusb_context = null;
pub fn LIBUSB_new_hid_device() callconv(.c) [*c]LIBUSB_hid_device {
    @setEvalBranchQuota(100000);
    var dev: [*c]LIBUSB_hid_device = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(LIBUSB_hid_device))));
    _ = &dev;
    dev.*.blocking = 1;
    hidapi_thread_state_init(&dev.*.thread_state);
    return dev;
}
pub fn LIBUSB_free_hid_device(dev: [*c]LIBUSB_hid_device) callconv(.c) void {
    @setEvalBranchQuota(100000);
    hidapi_thread_state_destroy(&dev.*.thread_state);
    LIBUSB_hid_free_enumeration(dev.*.device_info);
    SDL_free_REAL(@ptrCast(@alignCast(dev)));
}
pub fn get_bytes(rpt: [*c]u8, len: usize, num_bytes: usize, cur: usize) callconv(.c) u32 {
    @setEvalBranchQuota(100000);
    if ((cur +% num_bytes) >= len) return 0;
    if (num_bytes == @as(usize, 0)) return 0 else if (num_bytes == @as(usize, 1)) {
        return rpt[cur +% @as(usize, 1)];
    } else if (num_bytes == @as(usize, 2)) {
        return @bitCast(@as(c_int, (@as(c_int, rpt[cur +% @as(usize, 2)]) * @as(c_int, 256)) + @as(c_int, rpt[cur +% @as(usize, 1)])));
    } else if (num_bytes == @as(usize, 4)) {
        return @bitCast(@as(c_int, (((@as(c_int, rpt[cur +% @as(usize, 4)]) * @as(c_int, 16777216)) + (@as(c_int, rpt[cur +% @as(usize, 3)]) * @as(c_int, 65536))) + (@as(c_int, rpt[cur +% @as(usize, 2)]) * @as(c_int, 256))) + (@as(c_int, rpt[cur +% @as(usize, 1)]) * @as(c_int, 1))));
    } else return 0;
}
pub fn get_usage(report_descriptor: [*c]u8, size: usize, usage_page: [*c]c_ushort, usage: [*c]c_ushort) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var i: c_uint = undefined;
    _ = &i;
    var size_code: c_int = undefined;
    _ = &size_code;
    var data_len: c_int = undefined;
    _ = &data_len;
    var key_size: c_int = undefined;
    _ = &key_size;
    var usage_found: c_int = undefined;
    _ = &usage_found;
    var usage_page_found: c_int = undefined;
    _ = &usage_page_found;
    var key: c_int = undefined;
    _ = &key;
    var key_cmd: c_int = undefined;
    _ = &key_cmd;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                i = 0;
                usage_found = 0;
                usage_page_found = 0;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            1 => {
                if (@as(usize, i) < size) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            2 => {
                key = report_descriptor[i];
                key_cmd = key & @as(c_int, 252);
                if ((key & @as(c_int, 240)) == @as(c_int, 240)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            3 => {
                return -@as(c_int, 1);
            },
            4 => {
                if (@as(usize, i +% @as(c_uint, 1)) < size) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            5 => {
                size_code = key & @as(c_int, 3);
                switch (size_code) {
                    @as(c_int, 0) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 14;
                        continue;
                    },
                    else => {
                        sdl_pc = 15;
                        continue;
                    },
                }
            },
            6 => {
                if (key_cmd == @as(c_int, 4)) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            7 => {
                data_len = report_descriptor[i +% @as(c_uint, 1)];
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                data_len = 0;
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                key_size = 3;
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            10 => {
                key_size = 1;
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            11 => {
                {
                    sdl_pc = 12;
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
                data_len = size_code;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            14 => {
                data_len = 4;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            15 => {
                data_len = 0;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            16 => {
                usage_page.* = @truncate(get_bytes(report_descriptor, size, @bitCast(@as(c_long, data_len)), i));
                usage_page_found = 1;
                {
                    sdl_pc = 18;
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
                if (key_cmd == @as(c_int, 8)) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            19 => {
                if (data_len == @as(c_int, 4)) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
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
                if ((usage_page_found != 0) and (usage_found != 0)) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            22 => {
                usage_page.* = @truncate(get_bytes(report_descriptor, size, 2, i +% @as(c_uint, 2)));
                usage_page_found = 1;
                usage.* = @truncate(get_bytes(report_descriptor, size, 2, i));
                usage_found = 1;
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                usage.* = @truncate(get_bytes(report_descriptor, size, @bitCast(@as(c_long, data_len)), i));
                usage_found = 1;
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            24 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            25 => {
                return 0;
            },
            26 => {
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            27 => {
                i +%= @bitCast(@as(c_int, data_len + key_size));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn get_first_language(dev: ?*libusb_device_handle) callconv(.c) u16 {
    @setEvalBranchQuota(100000);
    var buf: [32]u16 = undefined;
    _ = &buf;
    var len: c_int = undefined;
    _ = &len;
    len = SDL_libusb_get_string_descriptor(dev, 0, 0, @ptrCast(@alignCast(@as([*c]u16, @ptrCast(@alignCast(&buf))))), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(buf))))));
    if (len < @as(c_int, 4)) return 0;
    return buf[@as(c_int, 1)];
}
pub fn is_language_supported(dev: ?*libusb_device_handle, lang: u16) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var buf: [32]u16 = undefined;
    _ = &buf;
    var len: c_int = undefined;
    _ = &len;
    var i: c_int = undefined;
    _ = &i;
    len = SDL_libusb_get_string_descriptor(dev, 0, 0, @ptrCast(@alignCast(@as([*c]u16, @ptrCast(@alignCast(&buf))))), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(buf))))));
    if (len < @as(c_int, 4)) return 0;
    {
        const ref = &len;
        ref.* = @divTrunc(ref.*, @as(c_int, 2));
    }
    {
        i = 1;
        while (i < len) : (i += 1) {
            if (@as(c_int, buf[@bitCast(@as(isize, @intCast(i)))]) == @as(c_int, lang)) return 1;
        }
    }
    return 0;
}
pub fn get_usb_string(dev: ?*libusb_device_handle, idx: u8) callconv(.c) [*c]wchar_t {
    @setEvalBranchQuota(100000);
    var buf: [512]u8 = undefined;
    _ = &buf;
    var len: c_int = undefined;
    _ = &len;
    var str: [*c]wchar_t = undefined;
    _ = &str;
    var wbuf: [256]wchar_t = undefined;
    _ = &wbuf;
    var ic: SDL_iconv_t = undefined;
    _ = &ic;
    var inbytes: usize = undefined;
    _ = &inbytes;
    var outbytes: usize = undefined;
    _ = &outbytes;
    var res: usize = undefined;
    _ = &res;
    var inptr: [*c]u8 = undefined;
    _ = &inptr;
    var outptr: [*c]u8 = undefined;
    _ = &outptr;
    var lang: u16 = undefined;
    _ = &lang;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                str = null;
                lang = LIBUSB_get_usb_code_for_current_locale();
                if (!(is_language_supported(dev, lang) != 0)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                _ = SDL_iconv_close_REAL(ic);
                return str;
            },
            2 => {
                lang = get_first_language(dev);
                {
                    sdl_pc = 4;
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
                len = SDL_libusb_get_string_descriptor(dev, idx, lang, @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&buf))))), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(buf))))));
                if (len < @as(c_int, 2)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                return null;
            },
            6 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                ic = SDL_iconv_open_REAL("WCHAR_T", "UTF-16LE");
                if (ic == @as(SDL_iconv_t, @ptrFromInt(@as(usize, @intCast(__helpers.cast(usize, @as(isize, -@as(c_int, 1)))))))) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                {
                    sdl_pc = 11;
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
                inptr = @as([*c]u8, @ptrCast(@alignCast(&buf))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                inbytes = @bitCast(@as(c_long, len - @as(c_int, 2)));
                outptr = @ptrCast(@alignCast(@as([*c]wchar_t, @ptrCast(@alignCast(&wbuf)))));
                outbytes = @sizeOf(@TypeOf(wbuf));
                res = SDL_iconv_REAL(ic, @ptrCast(@alignCast(&inptr)), &inbytes, &outptr, &outbytes);
                if (res == @as(usize, @bitCast(@as(c_long, -@as(c_int, 1))))) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            11 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                if (false) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                return null;
            },
            14 => {
                {
                    sdl_pc = 17;
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
                wbuf[(@sizeOf(@TypeOf(wbuf)) / @sizeOf(@TypeOf(wbuf[@as(c_int, 0)]))) -% @as(c_ulong, 1)] = 0;
                if (outbytes >= @sizeOf(@TypeOf(wbuf[@as(c_int, 0)]))) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
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
                if (false) {
                    sdl_pc = 17;
                    continue;
                } else {
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
            20 => {
                @as([*c]wchar_t, @ptrCast(@alignCast(outptr))).* = 0;
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
                str = SDL_wcsdup_REAL(@ptrCast(@alignCast(&wbuf)));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub const struct_usb_string_cache_entry = extern struct {
    vid: u16 = 0,
    pid: u16 = 0,
    vendor: [*c]wchar_t = null,
    product: [*c]wchar_t = null,
};
pub var usb_string_cache: [*c]struct_usb_string_cache_entry = null;
pub var usb_string_cache_size: usize = 0;
pub var usb_string_cache_insert_pos: usize = 0;
pub fn usb_string_cache_grow() callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var new_cache: [*c]struct_usb_string_cache_entry = undefined;
    _ = &new_cache;
    var allocSize: usize = undefined;
    _ = &allocSize;
    var new_cache_size: usize = undefined;
    _ = &new_cache_size;
    new_cache_size = usb_string_cache_size +% @as(usize, 8);
    allocSize = @sizeOf(struct_usb_string_cache_entry) *% new_cache_size;
    new_cache = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(usb_string_cache)), allocSize)));
    if (!(new_cache != null)) return -@as(c_int, 1);
    usb_string_cache = new_cache;
    usb_string_cache_size = new_cache_size;
    return 0;
}
pub fn usb_string_cache_destroy() callconv(.c) void {
    @setEvalBranchQuota(100000);
    var i: usize = undefined;
    _ = &i;
    {
        i = 0;
        while (i < usb_string_cache_insert_pos) : (i +%= 1) {
            SDL_free_REAL(@ptrCast(@alignCast(usb_string_cache[i].vendor)));
            SDL_free_REAL(@ptrCast(@alignCast(usb_string_cache[i].product)));
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(usb_string_cache)));
    usb_string_cache = null;
    usb_string_cache_size = 0;
    usb_string_cache_insert_pos = 0;
}
pub fn usb_string_cache_insert() callconv(.c) [*c]struct_usb_string_cache_entry {
    @setEvalBranchQuota(100000);
    var new_entry: [*c]struct_usb_string_cache_entry = null;
    _ = &new_entry;
    if (usb_string_cache_insert_pos >= usb_string_cache_size) {
        if (usb_string_cache_grow() < @as(c_int, 0)) return null;
    }
    new_entry = &usb_string_cache[usb_string_cache_insert_pos];
    usb_string_cache_insert_pos +%= 1;
    return new_entry;
}
pub fn usb_string_can_cache(vid: u16, pid: u16) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    if (!(@as(c_int, vid) != 0) or !(@as(c_int, pid) != 0)) {
        return 0;
    }
    if ((@as(c_int, vid) == @as(c_int, 3853)) and (@as(c_int, pid) == @as(c_int, 220))) {
        return 0;
    }
    return 1;
}
pub fn usb_string_cache_find(desc: [*c]struct_libusb_device_descriptor, handle: ?*struct_libusb_device_handle) callconv(.c) [*c]const struct_usb_string_cache_entry {
    @setEvalBranchQuota(100000);
    var entry: [*c]struct_usb_string_cache_entry = null;
    _ = &entry;
    var i: usize = undefined;
    _ = &i;
    {
        i = 0;
        while (i < usb_string_cache_insert_pos) : (i +%= 1) {
            entry = &usb_string_cache[i];
            if (@as(c_int, entry.*.vid) != @as(c_int, desc.*.idVendor)) continue;
            if (@as(c_int, entry.*.pid) != @as(c_int, desc.*.idProduct)) continue;
            return entry;
        }
    }
    entry = usb_string_cache_insert();
    if (!(entry != null)) return null;
    entry.*.vid = desc.*.idVendor;
    entry.*.pid = desc.*.idProduct;
    if (@as(c_int, desc.*.iManufacturer) > @as(c_int, 0)) {
        entry.*.vendor = get_usb_string(handle, desc.*.iManufacturer);
    } else {
        entry.*.vendor = null;
    }
    if (@as(c_int, desc.*.iProduct) > @as(c_int, 0)) {
        entry.*.product = get_usb_string(handle, desc.*.iProduct);
    } else {
        entry.*.product = null;
    }
    return entry;
}
pub fn get_path(result: [*c][64]u8, dev: ?*libusb_device, config_number: c_int, interface_number: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var str: [*c]u8 = @ptrCast(@alignCast(&result.*));
    _ = &str;
    var port_numbers: [8]u8 = [8]u8{
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
    };
    _ = &port_numbers;
    var num_ports: c_int = libusb_ctx.*.get_port_numbers.?(dev, @ptrCast(@alignCast(&port_numbers)), 8);
    _ = &num_ports;
    if (num_ports > @as(c_int, 0)) {
        var n: c_int = SDL_snprintf_REAL(str, @sizeOf(@TypeOf("000-000".*)), "%u-%u", libusb_ctx.*.get_bus_number.?(dev), port_numbers[@as(c_int, 0)]);
        _ = &n;
        {
            var i: u8 = 1;
            _ = &i;
            while (@as(c_int, i) < num_ports) : (i +%= 1) {
                n += SDL_snprintf_REAL(&str[@bitCast(@as(isize, @intCast(n)))], @sizeOf(@TypeOf(".000".*)), ".%u", port_numbers[i]);
            }
        }
        n += SDL_snprintf_REAL(&str[@bitCast(@as(isize, @intCast(n)))], @sizeOf(@TypeOf(":000.000".*)), ":%u.%u", @as(u8, @bitCast(@as(i8, @truncate(config_number)))), @as(u8, @bitCast(@as(i8, @truncate(interface_number)))));
        str[@bitCast(@as(isize, @intCast(n)))] = '\x00';
    } else {
        if (num_ports == LIBUSB_ERROR_OVERFLOW) {
            while (true) {
                if (!false) break;
            }
        } else {
            while (true) {
                if (!false) break;
            }
        }
        str[@as(c_int, 0)] = '\x00';
    }
}
pub fn LIBUSB_make_path(dev: ?*libusb_device, config_number: c_int, interface_number: c_int) callconv(.c) [*c]u8 {
    @setEvalBranchQuota(100000);
    var str: [64]u8 = undefined;
    _ = &str;
    get_path(&str, dev, config_number, interface_number);
    return SDL_strdup_REAL(@ptrCast(@alignCast(&str)));
}
pub export fn LIBUSB_hid_version() [*c]const struct_hid_api_version {
    @setEvalBranchQuota(100000);
    return &api_version;
}
pub export fn LIBUSB_hid_version_str() [*c]const u8 {
    @setEvalBranchQuota(100000);
    return "0. 14. 0";
}
pub var hotplug_callback_handle: libusb_hotplug_callback_handle = 0;
pub var shutdown_event_thread: c_int = 0;
pub var event_thread_state: hidapi_thread_state = @import("std").mem.zeroes(hidapi_thread_state);
pub fn hotplug_callback(_: ?*struct_libusb_context, _: ?*struct_libusb_device, event: libusb_hotplug_event, _: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (event) {
                    @as(libusb_hotplug_event, LIBUSB_HOTPLUG_EVENT_DEVICE_ARRIVED) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(libusb_hotplug_event, LIBUSB_HOTPLUG_EVENT_DEVICE_LEFT) => {
                        sdl_pc = 3;
                        continue;
                    },
                    else => {
                        sdl_pc = 4;
                        continue;
                    },
                }
            },
            1 => {
                return 0;
            },
            2 => {
                SDL_HIDAPI_discovery.m_unDeviceChangeCounter +%= 1;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                SDL_HIDAPI_discovery.m_unDeviceChangeCounter +%= 1;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn event_thread(_: ?*anyopaque) callconv(.c) ?*anyopaque {
    @setEvalBranchQuota(100000);
    while (!(shutdown_event_thread != 0)) {
        var res: c_int = libusb_ctx.*.handle_events.?(usb_context);
        _ = &res;
        if (res < @as(c_int, 0)) {
            while (true) {
                if (!false) break;
            }
        }
    }
    return null;
}
pub fn start_event_thread() callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (libusb_ctx.*.has_capability.?(LIBUSB_CAP_HAS_HOTPLUG) != 0) {
        var res: c_int = libusb_ctx.*.hotplug_register_callback.?(usb_context, LIBUSB_HOTPLUG_EVENT_DEVICE_ARRIVED | LIBUSB_HOTPLUG_EVENT_DEVICE_LEFT, 0, -@as(c_int, 1), -@as(c_int, 1), -@as(c_int, 1), hotplug_callback, null, &hotplug_callback_handle);
        _ = &res;
        if (res < @as(c_int, 0)) {
            while (true) {
                if (!false) break;
            }
        }
    }
    hidapi_thread_create(&event_thread_state, event_thread, null);
}
pub fn stop_event_thread() callconv(.c) void {
    @setEvalBranchQuota(100000);
    shutdown_event_thread = 1;
    libusb_ctx.*.interrupt_event_handler.?(usb_context);
    hidapi_thread_join(&event_thread_state);
    shutdown_event_thread = 0;
    if (hotplug_callback_handle != 0) {
        libusb_ctx.*.hotplug_deregister_callback.?(usb_context, hotplug_callback_handle);
        hotplug_callback_handle = 0;
    }
}
pub export fn LIBUSB_hid_init() c_int {
    @setEvalBranchQuota(100000);
    if (!(usb_context != null)) {
        var locale: [*c]const u8 = undefined;
        _ = &locale;
        if (libusb_ctx.*.init.?(&usb_context) != 0) return -@as(c_int, 1);
        locale = null;
        if (!(locale != null)) {
            _ = @as(c_int, 0);
        }
        start_event_thread();
    }
    return 0;
}
pub export fn LIBUSB_hid_exit() c_int {
    @setEvalBranchQuota(100000);
    usb_string_cache_destroy();
    stop_event_thread();
    if (usb_context != null) {
        libusb_ctx.*.exit.?(usb_context);
        usb_context = null;
    }
    return 0;
}
pub fn hid_get_report_descriptor_libusb(handle: ?*libusb_device_handle, interface_num: c_int, arg_expected_report_descriptor_size: u16, buf: [*c]u8, buf_size: usize) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var expected_report_descriptor_size = arg_expected_report_descriptor_size;
    _ = &expected_report_descriptor_size;
    var tmp: [*c]u8 = @ptrCast(@alignCast(SDL_malloc_REAL(HID_API_MAX_REPORT_DESCRIPTOR_SIZE)));
    _ = &tmp;
    if (@as(c_int, expected_report_descriptor_size) > HID_API_MAX_REPORT_DESCRIPTOR_SIZE) {
        expected_report_descriptor_size = HID_API_MAX_REPORT_DESCRIPTOR_SIZE;
    }
    var res: c_int = libusb_ctx.*.control_transfer.?(handle, @bitCast(@as(i8, @truncate(LIBUSB_ENDPOINT_IN | LIBUSB_RECIPIENT_INTERFACE))), LIBUSB_REQUEST_GET_DESCRIPTOR, @bitCast(@as(c_short, @truncate(LIBUSB_DT_REPORT << @intCast(@as(c_int, 8))))), @bitCast(@as(c_short, @truncate(interface_num))), tmp, expected_report_descriptor_size, 5000);
    _ = &res;
    if (res >= @as(c_int, 0)) {
        if (res > @as(c_int, @bitCast(@as(c_uint, @truncate(buf_size))))) {
            res = @bitCast(@as(c_uint, @truncate(buf_size)));
        }
        _ = memcpy(@ptrCast(@alignCast(buf)), @ptrCast(@alignCast(tmp)), @bitCast(@as(c_long, res)));
    } else {
        while (true) {
            if (!false) break;
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(tmp)));
    return res;
}
pub fn fill_device_info_usage(cur_dev: [*c]struct_hid_device_info, handle: ?*libusb_device_handle, interface_num: c_int, expected_report_descriptor_size: u16) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var hid_report_descriptor: [*c]u8 = @ptrCast(@alignCast(SDL_malloc_REAL(HID_API_MAX_REPORT_DESCRIPTOR_SIZE)));
    _ = &hid_report_descriptor;
    var page: c_ushort = 0;
    _ = &page;
    var usage: c_ushort = 0;
    _ = &usage;
    var res: c_int = hid_get_report_descriptor_libusb(handle, interface_num, expected_report_descriptor_size, hid_report_descriptor, HID_API_MAX_REPORT_DESCRIPTOR_SIZE);
    _ = &res;
    if (res >= @as(c_int, 0)) {
        _ = get_usage(hid_report_descriptor, @bitCast(@as(c_long, res)), &page, &usage);
    }
    cur_dev.*.usage_page = page;
    cur_dev.*.usage = usage;
    SDL_free_REAL(@ptrCast(@alignCast(hid_report_descriptor)));
}
pub fn create_device_info_for_device(device: ?*libusb_device, handle: ?*libusb_device_handle, desc: [*c]struct_libusb_device_descriptor, config_number: c_int, interface_num: c_int, interface_class: c_int, interface_subclass: c_int, interface_protocol: c_int) callconv(.c) [*c]struct_hid_device_info {
    @setEvalBranchQuota(100000);
    var cur_dev: [*c]struct_hid_device_info = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(struct_hid_device_info))));
    _ = &cur_dev;
    if (@as(?*anyopaque, @ptrCast(@alignCast(cur_dev))) == @as(?*anyopaque, null)) {
        return null;
    }
    cur_dev.*.vendor_id = desc.*.idVendor;
    cur_dev.*.product_id = desc.*.idProduct;
    cur_dev.*.release_number = desc.*.bcdDevice;
    cur_dev.*.interface_number = interface_num;
    cur_dev.*.interface_class = interface_class;
    cur_dev.*.interface_subclass = interface_subclass;
    cur_dev.*.interface_protocol = interface_protocol;
    cur_dev.*.bus_type = HID_API_BUS_USB;
    cur_dev.*.path = LIBUSB_make_path(device, config_number, interface_num);
    if (!(handle != null)) {
        return cur_dev;
    }
    if (@as(c_int, desc.*.iSerialNumber) > @as(c_int, 0)) {
        cur_dev.*.serial_number = get_usb_string(handle, desc.*.iSerialNumber);
    }
    var string_cache: [*c]const struct_usb_string_cache_entry = undefined;
    _ = &string_cache;
    if ((usb_string_can_cache(desc.*.idVendor, desc.*.idProduct) != 0) and (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(blk: {
        const tmp = usb_string_cache_find(desc, handle);
        string_cache = tmp;
        break :blk tmp;
    })))) != @as(?*anyopaque, null))) {
        if (string_cache.*.vendor != null) {
            cur_dev.*.manufacturer_string = SDL_wcsdup_REAL(string_cache.*.vendor);
        }
        if (string_cache.*.product != null) {
            cur_dev.*.product_string = SDL_wcsdup_REAL(string_cache.*.product);
        }
    } else {
        if (@as(c_int, desc.*.iManufacturer) > @as(c_int, 0)) {
            cur_dev.*.manufacturer_string = get_usb_string(handle, desc.*.iManufacturer);
        }
        if (@as(c_int, desc.*.iProduct) > @as(c_int, 0)) {
            cur_dev.*.product_string = get_usb_string(handle, desc.*.iProduct);
        }
    }
    return cur_dev;
}
pub fn get_report_descriptor_size_from_interface_descriptors(intf_desc: [*c]const struct_libusb_interface_descriptor) callconv(.c) u16 {
    @setEvalBranchQuota(100000);
    var i: c_int = 0;
    _ = &i;
    var found_hid_report_descriptor: c_int = 0;
    _ = &found_hid_report_descriptor;
    var result: u16 = HID_API_MAX_REPORT_DESCRIPTOR_SIZE;
    _ = &result;
    var extra: [*c]const u8 = intf_desc.*.extra;
    _ = &extra;
    var extra_length: c_int = intf_desc.*.extra_length;
    _ = &extra_length;
    while (extra_length >= @as(c_int, 2)) {
        if (@as(c_int, extra[@as(c_int, 1)]) == LIBUSB_DT_HID) {
            if (extra_length < @as(c_int, 6)) {
                while (true) {
                    if (!false) break;
                }
                break;
            }
            var bNumDescriptors: u8 = extra[@as(c_int, 5)];
            _ = &bNumDescriptors;
            if (extra_length < (@as(c_int, 6) + (@as(c_int, 3) * @as(c_int, bNumDescriptors)))) {
                while (true) {
                    if (!false) break;
                }
                break;
            }
            {
                i = 0;
                while (i < @as(c_int, bNumDescriptors)) : (i += 1) {
                    if (@as(c_int, extra[@bitCast(@as(isize, @intCast(@as(c_int, 6) + (@as(c_int, 3) * i))))]) == LIBUSB_DT_REPORT) {
                        result = @bitCast(@as(c_short, @truncate((@as(c_int, @as(u16, extra[@bitCast(@as(isize, @intCast((@as(c_int, 6) + (@as(c_int, 3) * i)) + @as(c_int, 2))))])) << @intCast(@as(c_int, 8))) | @as(c_int, extra[@bitCast(@as(isize, @intCast((@as(c_int, 6) + (@as(c_int, 3) * i)) + @as(c_int, 1))))]))));
                        found_hid_report_descriptor = 1;
                        break;
                    }
                }
            }
            if (!(found_hid_report_descriptor != 0)) {
                while (true) {
                    if (!false) break;
                }
            }
            break;
        }
        if (@as(c_int, extra[@as(c_int, 0)]) == @as(c_int, 0)) {
            while (true) {
                if (!false) break;
            }
            break;
        }
        extra_length -= extra[@as(c_int, 0)];
        extra += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, extra[@as(c_int, 0)])))));
    }
    return result;
}
pub fn is_xbox360(vendor_id: c_ushort, intf_desc: [*c]const struct_libusb_interface_descriptor) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const static_local_xb360_iface_subclass = struct {
        const xb360_iface_subclass: c_int = 93;
    };
    _ = &static_local_xb360_iface_subclass;
    const static_local_xb360_iface_protocol = struct {
        const xb360_iface_protocol: c_int = 1;
    };
    _ = &static_local_xb360_iface_protocol;
    const static_local_xb360w_iface_protocol = struct {
        const xb360w_iface_protocol: c_int = 129;
    };
    _ = &static_local_xb360w_iface_protocol;
    const static_local_xb360bb_iface_protocol = struct {
        const xb360bb_iface_protocol: c_int = 4;
    };
    _ = &static_local_xb360bb_iface_protocol;
    const static_local_supported_vendors = struct {
        const supported_vendors: [33]c_int = [33]c_int{
            121,
            849,
            1103,
            1118,
            1133,
            1390,
            1699,
            1848,
            2047,
            3695,
            3853,
            4152,
            4341,
            4553,
            4617,
            4779,
            5168,
            5227,
            5426,
            5604,
            5678,
            5769,
            6473,
            7085,
            8406,
            9414,
            11298,
            11720,
            13623,
            13905,
            14295,
            14680,
            39046,
        };
    };
    _ = &static_local_supported_vendors;
    if (((@as(c_int, intf_desc.*.bInterfaceClass) == LIBUSB_CLASS_VENDOR_SPEC) and (@as(c_int, intf_desc.*.bInterfaceSubClass) == static_local_xb360_iface_subclass.xb360_iface_subclass)) and (((@as(c_int, intf_desc.*.bInterfaceProtocol) == static_local_xb360_iface_protocol.xb360_iface_protocol) or (@as(c_int, intf_desc.*.bInterfaceProtocol) == static_local_xb360w_iface_protocol.xb360w_iface_protocol)) or (@as(c_int, intf_desc.*.bInterfaceProtocol) == static_local_xb360bb_iface_protocol.xb360bb_iface_protocol))) {
        var i: usize = undefined;
        _ = &i;
        {
            i = 0;
            while (i < (@sizeOf(@TypeOf(static_local_supported_vendors.supported_vendors)) / @sizeOf(@TypeOf(static_local_supported_vendors.supported_vendors[@as(c_int, 0)])))) : (i +%= 1) {
                if (@as(c_int, vendor_id) == static_local_supported_vendors.supported_vendors[i]) {
                    return 1;
                }
            }
        }
    }
    return 0;
}
pub fn is_xboxone(vendor_id: c_ushort, intf_desc: [*c]const struct_libusb_interface_descriptor) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const static_local_xb1_iface_subclass = struct {
        const xb1_iface_subclass: c_int = 71;
    };
    _ = &static_local_xb1_iface_subclass;
    const static_local_xb1_iface_protocol = struct {
        const xb1_iface_protocol: c_int = 208;
    };
    _ = &static_local_xb1_iface_protocol;
    const static_local_supported_vendors = struct {
        const supported_vendors: [22]c_int = [22]c_int{
            849,
            1008,
            1103,
            1118,
            1848,
            2821,
            3695,
            3853,
            4341,
            4617,
            5426,
            8406,
            9414,
            10571,
            11720,
            11812,
            11925,
            12933,
            13623,
            13905,
            13932,
            14680,
        };
    };
    _ = &static_local_supported_vendors;
    if ((((@as(c_int, intf_desc.*.bInterfaceNumber) == @as(c_int, 0)) and (@as(c_int, intf_desc.*.bInterfaceClass) == LIBUSB_CLASS_VENDOR_SPEC)) and (@as(c_int, intf_desc.*.bInterfaceSubClass) == static_local_xb1_iface_subclass.xb1_iface_subclass)) and (@as(c_int, intf_desc.*.bInterfaceProtocol) == static_local_xb1_iface_protocol.xb1_iface_protocol)) {
        var i: usize = undefined;
        _ = &i;
        {
            i = 0;
            while (i < (@sizeOf(@TypeOf(static_local_supported_vendors.supported_vendors)) / @sizeOf(@TypeOf(static_local_supported_vendors.supported_vendors[@as(c_int, 0)])))) : (i +%= 1) {
                if (@as(c_int, vendor_id) == static_local_supported_vendors.supported_vendors[i]) {
                    return 1;
                }
            }
        }
    }
    return 0;
}
pub fn should_enumerate_interface(vendor_id: c_ushort, product_id: c_ushort, intf_desc: [*c]const struct_libusb_interface_descriptor) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var is_xbox: c_int = @intFromBool((is_xbox360(vendor_id, intf_desc) != 0) or (is_xboxone(vendor_id, intf_desc) != 0));
    _ = &is_xbox;
    if (SDL_HIDAPI_ShouldIgnoreDevice(HID_API_BUS_USB, vendor_id, product_id, 0, 0, @"true" != 0, is_xbox != 0)) {
        return 0;
    }
    if (is_xbox != 0) return 1;
    if (@as(c_int, intf_desc.*.bInterfaceClass) == LIBUSB_CLASS_HID) return 1;
    return 0;
}
pub fn libusb_blacklist(vendor_id: c_ushort, product_id: c_ushort) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var i: usize = undefined;
    _ = &i;
    const struct_unnamed_43 = extern struct {
        vid: c_ushort = 0,
        pid: c_ushort = 0,
    };
    _ = &struct_unnamed_43;
    const static_local_known_bad = struct {
        const known_bad: [1]struct_unnamed_43 = [1]struct_unnamed_43{
            struct_unnamed_43{
                .vid = 5426,
                .pid = 551,
            },
        };
    };
    _ = &static_local_known_bad;
    {
        i = 0;
        while (i < (@sizeOf(@TypeOf(static_local_known_bad.known_bad)) / @sizeOf(@TypeOf(static_local_known_bad.known_bad[@as(c_int, 0)])))) : (i +%= 1) {
            if ((@as(c_int, vendor_id) == @as(c_int, static_local_known_bad.known_bad[i].vid)) and ((@as(c_int, product_id) == @as(c_int, static_local_known_bad.known_bad[i].pid)) or (@as(c_int, static_local_known_bad.known_bad[i].pid) == @as(c_int, 0)))) {
                return 1;
            }
        }
    }
    return 0;
}
pub export fn LIBUSB_hid_enumerate(vendor_id: c_ushort, product_id: c_ushort) [*c]struct_hid_device_info {
    @setEvalBranchQuota(100000);
    var devs: [*c]?*libusb_device = undefined;
    _ = &devs;
    var dev: ?*libusb_device = undefined;
    _ = &dev;
    var handle: ?*libusb_device_handle = null;
    _ = &handle;
    var num_devs: isize = undefined;
    _ = &num_devs;
    var i: c_int = 0;
    _ = &i;
    var root: [*c]struct_hid_device_info = null;
    _ = &root;
    var cur_dev: [*c]struct_hid_device_info = null;
    _ = &cur_dev;
    if (LIBUSB_hid_init() < @as(c_int, 0)) return null;
    num_devs = libusb_ctx.*.get_device_list.?(usb_context, &devs);
    if (num_devs < @as(isize, 0)) return null;
    while (@as(?*anyopaque, @ptrCast(@alignCast(blk: {
        const tmp = devs[
            @bitCast(@as(isize, @intCast(blk_1: {
                const ref = &i;
                const tmp_2 = ref.*;
                ref.* += 1;
                break :blk_1 tmp_2;
            })))
        ];
        dev = tmp;
        break :blk tmp;
    }))) != @as(?*anyopaque, null)) {
        var desc: struct_libusb_device_descriptor = undefined;
        _ = &desc;
        var conf_desc: [*c]struct_libusb_config_descriptor = null;
        _ = &conf_desc;
        var j: c_int = undefined;
        _ = &j;
        var k: c_int = undefined;
        _ = &k;
        var res: c_int = libusb_ctx.*.get_device_descriptor.?(dev, &desc);
        _ = &res;
        if (res < @as(c_int, 0)) continue;
        var dev_vid: c_ushort = desc.idVendor;
        _ = &dev_vid;
        var dev_pid: c_ushort = desc.idProduct;
        _ = &dev_pid;
        if ((((@as(c_int, vendor_id) != @as(c_int, 0)) and (@as(c_int, vendor_id) != @as(c_int, dev_vid))) or ((@as(c_int, product_id) != @as(c_int, 0)) and (@as(c_int, product_id) != @as(c_int, dev_pid)))) or (libusb_blacklist(dev_vid, dev_pid) != 0)) {
            continue;
        }
        res = libusb_ctx.*.get_active_config_descriptor.?(dev, &conf_desc);
        if (res < @as(c_int, 0)) {
            _ = libusb_ctx.*.get_config_descriptor.?(dev, 0, &conf_desc);
        }
        if (conf_desc != null) {
            {
                j = 0;
                while (j < @as(c_int, conf_desc.*.bNumInterfaces)) : (j += 1) {
                    var intf: [*c]const struct_libusb_interface = &conf_desc.*.interface[@bitCast(@as(isize, @intCast(j)))];
                    _ = &intf;
                    {
                        k = 0;
                        while (k < intf.*.num_altsetting) : (k += 1) {
                            var intf_desc: [*c]const struct_libusb_interface_descriptor = undefined;
                            _ = &intf_desc;
                            intf_desc = &intf.*.altsetting[@bitCast(@as(isize, @intCast(k)))];
                            if (should_enumerate_interface(dev_vid, dev_pid, intf_desc) != 0) {
                                var tmp: [*c]struct_hid_device_info = undefined;
                                _ = &tmp;
                                res = libusb_ctx.*.open.?(dev, &handle);
                                tmp = create_device_info_for_device(dev, handle, &desc, conf_desc.*.bConfigurationValue, intf_desc.*.bInterfaceNumber, intf_desc.*.bInterfaceClass, intf_desc.*.bInterfaceSubClass, intf_desc.*.bInterfaceProtocol);
                                if (tmp != null) {
                                    if (cur_dev != null) {
                                        cur_dev.*.next = tmp;
                                    } else {
                                        root = tmp;
                                    }
                                    cur_dev = tmp;
                                }
                                if (res >= @as(c_int, 0)) {
                                    libusb_ctx.*.close.?(handle);
                                    handle = null;
                                }
                                break;
                            }
                        }
                    }
                }
            }
            libusb_ctx.*.free_config_descriptor.?(conf_desc);
        }
    }
    libusb_ctx.*.free_device_list.?(devs, 1);
    return root;
}
pub export fn LIBUSB_hid_free_enumeration(devs: [*c]struct_hid_device_info) void {
    @setEvalBranchQuota(100000);
    var d: [*c]struct_hid_device_info = devs;
    _ = &d;
    while (d != null) {
        var next: [*c]struct_hid_device_info = d.*.next;
        _ = &next;
        SDL_free_REAL(@ptrCast(@alignCast(d.*.path)));
        SDL_free_REAL(@ptrCast(@alignCast(d.*.serial_number)));
        SDL_free_REAL(@ptrCast(@alignCast(d.*.manufacturer_string)));
        SDL_free_REAL(@ptrCast(@alignCast(d.*.product_string)));
        SDL_free_REAL(@ptrCast(@alignCast(d)));
        d = next;
    }
}
pub export fn LIBUSB_hid_open(vendor_id: c_ushort, product_id: c_ushort, serial_number: [*c]const wchar_t) [*c]LIBUSB_hid_device {
    @setEvalBranchQuota(100000);
    var devs: [*c]struct_hid_device_info = undefined;
    _ = &devs;
    var cur_dev: [*c]struct_hid_device_info = undefined;
    _ = &cur_dev;
    var path_to_open: [*c]const u8 = null;
    _ = &path_to_open;
    var handle: [*c]LIBUSB_hid_device = null;
    _ = &handle;
    devs = LIBUSB_hid_enumerate(vendor_id, product_id);
    cur_dev = devs;
    while (cur_dev != null) {
        if ((@as(c_int, cur_dev.*.vendor_id) == @as(c_int, vendor_id)) and (@as(c_int, cur_dev.*.product_id) == @as(c_int, product_id))) {
            if (serial_number != null) {
                if ((cur_dev.*.serial_number != null) and (SDL_wcscmp_REAL(serial_number, cur_dev.*.serial_number) == @as(c_int, 0))) {
                    path_to_open = cur_dev.*.path;
                    break;
                }
            } else {
                path_to_open = cur_dev.*.path;
                break;
            }
        }
        cur_dev = cur_dev.*.next;
    }
    if (path_to_open != null) {
        handle = LIBUSB_hid_open_path(path_to_open);
    }
    LIBUSB_hid_free_enumeration(devs);
    return handle;
}
pub fn read_callback(transfer: [*c]struct_libusb_transfer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dev: [*c]LIBUSB_hid_device = @ptrCast(@alignCast(transfer.*.user_data));
    _ = &dev;
    var res: c_int = undefined;
    _ = &res;
    if (transfer.*.status == @as(enum_libusb_transfer_status, LIBUSB_TRANSFER_COMPLETED)) {
        var rpt: [*c]struct_LIBUSB_input_report = undefined;
        rpt = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(@TypeOf(rpt.*)))));
        _ = &rpt;
        rpt.*.data = @ptrCast(@alignCast(SDL_malloc_REAL(@bitCast(@as(c_long, transfer.*.actual_length)))));
        _ = memcpy(@ptrCast(@alignCast(rpt.*.data)), @ptrCast(@alignCast(transfer.*.buffer)), @bitCast(@as(c_long, transfer.*.actual_length)));
        rpt.*.len = @bitCast(@as(c_long, transfer.*.actual_length));
        rpt.*.next = null;
        hidapi_thread_mutex_lock(&dev.*.thread_state);
        if (@as(?*anyopaque, @ptrCast(@alignCast(dev.*.input_reports))) == @as(?*anyopaque, null)) {
            dev.*.input_reports = rpt;
            hidapi_thread_cond_signal(&dev.*.thread_state);
        } else {
            var cur: [*c]struct_LIBUSB_input_report = dev.*.input_reports;
            _ = &cur;
            var num_queued: c_int = 0;
            _ = &num_queued;
            while (@as(?*anyopaque, @ptrCast(@alignCast(cur.*.next))) != @as(?*anyopaque, null)) {
                cur = cur.*.next;
                num_queued += 1;
            }
            cur.*.next = rpt;
            if (num_queued > @as(c_int, 30)) {
                _ = LIBUSB_return_data(dev, null, 0);
            }
        }
        hidapi_thread_mutex_unlock(&dev.*.thread_state);
    } else if (transfer.*.status == @as(enum_libusb_transfer_status, LIBUSB_TRANSFER_CANCELLED)) {
        dev.*.shutdown_thread = 1;
    } else if (transfer.*.status == @as(enum_libusb_transfer_status, LIBUSB_TRANSFER_NO_DEVICE)) {
        dev.*.shutdown_thread = 1;
    } else if (transfer.*.status == @as(enum_libusb_transfer_status, LIBUSB_TRANSFER_TIMED_OUT)) {} else {
        while (true) {
            if (!false) break;
        }
    }
    if (dev.*.shutdown_thread != 0) {
        dev.*.transfer_loop_finished = 1;
        return;
    }
    res = libusb_ctx.*.submit_transfer.?(transfer);
    if (res != @as(c_int, 0)) {
        while (true) {
            if (!false) break;
        }
        dev.*.shutdown_thread = 1;
        dev.*.transfer_loop_finished = 1;
    }
}
pub fn start_read_operations(dev: [*c]LIBUSB_hid_device) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var res: c_int = undefined;
    _ = &res;
    var buf: [*c]u8 = undefined;
    _ = &buf;
    const length: usize = @bitCast(@as(c_long, dev.*.input_ep_max_packet_size));
    _ = &length;
    buf = @ptrCast(@alignCast(SDL_malloc_REAL(length)));
    dev.*.transfer = libusb_ctx.*.alloc_transfer.?(0);
    SDL_libusb_fill_interrupt_transfer(dev.*.transfer, dev.*.device_handle, @bitCast(@as(i8, @truncate(dev.*.input_endpoint))), buf, @bitCast(@as(c_uint, @truncate(length))), read_callback, @ptrCast(@alignCast(dev)), 5000);
    res = libusb_ctx.*.submit_transfer.?(dev.*.transfer);
    if (res < @as(c_int, 0)) {
        while (true) {
            if (!false) break;
        }
        dev.*.shutdown_thread = 1;
        dev.*.transfer_loop_finished = 1;
    }
}
pub fn stop_read_operations(dev: [*c]LIBUSB_hid_device) callconv(.c) void {
    @setEvalBranchQuota(100000);
    while (!(dev.*.transfer_loop_finished != 0)) {
        _ = libusb_ctx.*.handle_events_completed.?(usb_context, &dev.*.transfer_loop_finished);
    }
    hidapi_thread_mutex_lock(&dev.*.thread_state);
    hidapi_thread_cond_broadcast(&dev.*.thread_state);
    hidapi_thread_mutex_unlock(&dev.*.thread_state);
}
pub fn init_xbox360(device_handle: ?*libusb_device_handle, idVendor: c_ushort, idProduct: c_ushort, arg_conf_desc: [*c]const struct_libusb_config_descriptor) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var conf_desc = arg_conf_desc;
    _ = &conf_desc;
    _ = &conf_desc;
    if (((((@as(c_int, idVendor) == @as(c_int, 1452)) and (@as(c_int, idProduct) == @as(c_int, 1371))) or ((@as(c_int, idVendor) == @as(c_int, 8406)) and (@as(c_int, idProduct) == @as(c_int, 16400)))) or ((@as(c_int, idVendor) == @as(c_int, 8406)) and (@as(c_int, idProduct) == @as(c_int, 16421)))) or (@as(c_int, idVendor) == @as(c_int, 3853))) {
        var data: [20]u8 = undefined;
        _ = &data;
        _ = memset(@ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&data))))), 0, @sizeOf(@TypeOf(data)));
        _ = libusb_ctx.*.control_transfer.?(device_handle, 193, 1, 256, 0, @ptrCast(@alignCast(&data)), @truncate(@sizeOf(@TypeOf(data))), 100);
    }
}
pub fn init_xboxone(device_handle: ?*libusb_device_handle, idVendor: c_ushort, arg_idProduct: c_ushort, conf_desc: [*c]const struct_libusb_config_descriptor) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var idProduct = arg_idProduct;
    _ = &idProduct;
    const static_local_vendor_microsoft = struct {
        const vendor_microsoft: c_int = 1118;
    };
    _ = &static_local_vendor_microsoft;
    const static_local_xb1_iface_subclass = struct {
        const xb1_iface_subclass: c_int = 71;
    };
    _ = &static_local_xb1_iface_subclass;
    const static_local_xb1_iface_protocol = struct {
        const xb1_iface_protocol: c_int = 208;
    };
    _ = &static_local_xb1_iface_protocol;
    var j: c_int = undefined;
    _ = &j;
    var k: c_int = undefined;
    _ = &k;
    var res: c_int = undefined;
    _ = &res;
    _ = &idProduct;
    {
        j = 0;
        while (j < @as(c_int, conf_desc.*.bNumInterfaces)) : (j += 1) {
            var intf: [*c]const struct_libusb_interface = &conf_desc.*.interface[@bitCast(@as(isize, @intCast(j)))];
            _ = &intf;
            {
                k = 0;
                while (k < intf.*.num_altsetting) : (k += 1) {
                    var intf_desc: [*c]const struct_libusb_interface_descriptor = &intf.*.altsetting[@bitCast(@as(isize, @intCast(k)))];
                    _ = &intf_desc;
                    if (((@as(c_int, intf_desc.*.bInterfaceClass) == LIBUSB_CLASS_VENDOR_SPEC) and (@as(c_int, intf_desc.*.bInterfaceSubClass) == static_local_xb1_iface_subclass.xb1_iface_subclass)) and (@as(c_int, intf_desc.*.bInterfaceProtocol) == static_local_xb1_iface_protocol.xb1_iface_protocol)) {
                        var bSetAlternateSetting: c_int = 0;
                        _ = &bSetAlternateSetting;
                        if (((@as(c_int, idVendor) == static_local_vendor_microsoft.vendor_microsoft) and (@as(c_int, intf_desc.*.bInterfaceNumber) == @as(c_int, 0))) and (@as(c_int, intf_desc.*.bAlternateSetting) == @as(c_int, 1))) {
                            bSetAlternateSetting = 1;
                        } else if ((@as(c_int, intf_desc.*.bInterfaceNumber) != @as(c_int, 0)) and (@as(c_int, intf_desc.*.bAlternateSetting) == @as(c_int, 0))) {
                            bSetAlternateSetting = 1;
                        }
                        if (bSetAlternateSetting != 0) {
                            res = libusb_ctx.*.claim_interface.?(device_handle, intf_desc.*.bInterfaceNumber);
                            if (res < @as(c_int, 0)) {
                                while (true) {
                                    if (!false) break;
                                }
                                continue;
                            }
                            while (true) {
                                if (!false) break;
                            }
                            res = libusb_ctx.*.set_interface_alt_setting.?(device_handle, intf_desc.*.bInterfaceNumber, intf_desc.*.bAlternateSetting);
                            if (res < @as(c_int, 0)) {
                                while (true) {
                                    if (!false) break;
                                }
                            }
                            _ = libusb_ctx.*.release_interface.?(device_handle, intf_desc.*.bInterfaceNumber);
                        }
                    }
                }
            }
        }
    }
}
pub fn calculate_device_quirks(dev: [*c]LIBUSB_hid_device, idVendor: c_ushort, idProduct: c_ushort) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local_VENDOR_SONY = struct {
        const VENDOR_SONY: c_int = 1356;
    };
    _ = &static_local_VENDOR_SONY;
    const static_local_PRODUCT_PS3_CONTROLLER = struct {
        const PRODUCT_PS3_CONTROLLER: c_int = 616;
    };
    _ = &static_local_PRODUCT_PS3_CONTROLLER;
    const static_local_PRODUCT_NAVIGATION_CONTROLLER = struct {
        const PRODUCT_NAVIGATION_CONTROLLER: c_int = 1071;
    };
    _ = &static_local_PRODUCT_NAVIGATION_CONTROLLER;
    if ((@as(c_int, idVendor) == static_local_VENDOR_SONY.VENDOR_SONY) and ((@as(c_int, idProduct) == static_local_PRODUCT_PS3_CONTROLLER.PRODUCT_PS3_CONTROLLER) or (@as(c_int, idProduct) == static_local_PRODUCT_NAVIGATION_CONTROLLER.PRODUCT_NAVIGATION_CONTROLLER))) {
        dev.*.skip_output_report_id = 1;
        dev.*.no_output_reports_on_intr_ep = 1;
    }
}
pub fn hidapi_initialize_device(dev: [*c]LIBUSB_hid_device, intf_desc: [*c]const struct_libusb_interface_descriptor, conf_desc: [*c]const struct_libusb_config_descriptor) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var i: c_int = 0;
    _ = &i;
    var res: c_int = 0;
    _ = &res;
    var desc: struct_libusb_device_descriptor = undefined;
    _ = &desc;
    _ = libusb_ctx.*.get_device_descriptor.?(libusb_ctx.*.get_device.?(dev.*.device_handle), &desc);
    dev.*.is_driver_detached = 0;
    if (libusb_ctx.*.kernel_driver_active.?(dev.*.device_handle, intf_desc.*.bInterfaceNumber) == @as(c_int, 1)) {
        res = libusb_ctx.*.detach_kernel_driver.?(dev.*.device_handle, intf_desc.*.bInterfaceNumber);
        if (res < @as(c_int, 0)) {
            while (true) {
                if (!false) break;
            }
            return 0;
        } else {
            dev.*.is_driver_detached = 1;
            while (true) {
                if (!false) break;
            }
        }
    }
    res = libusb_ctx.*.claim_interface.?(dev.*.device_handle, intf_desc.*.bInterfaceNumber);
    if (res < @as(c_int, 0)) {
        while (true) {
            if (!false) break;
        }
        if (dev.*.is_driver_detached != 0) {
            res = libusb_ctx.*.attach_kernel_driver.?(dev.*.device_handle, intf_desc.*.bInterfaceNumber);
            if (res < @as(c_int, 0)) while (true) {
                if (!false) break;
            };
        }
        return 0;
    }
    if (is_xbox360(desc.idVendor, intf_desc) != 0) {
        dev.*.no_skip_output_report_id = 1;
        init_xbox360(dev.*.device_handle, desc.idVendor, desc.idProduct, conf_desc);
    }
    if (is_xboxone(desc.idVendor, intf_desc) != 0) {
        init_xboxone(dev.*.device_handle, desc.idVendor, desc.idProduct, conf_desc);
    }
    dev.*.manufacturer_index = desc.iManufacturer;
    dev.*.product_index = desc.iProduct;
    dev.*.serial_index = desc.iSerialNumber;
    dev.*.config_number = conf_desc.*.bConfigurationValue;
    dev.*.interface = intf_desc.*.bInterfaceNumber;
    dev.*.interface_class = intf_desc.*.bInterfaceClass;
    dev.*.interface_subclass = intf_desc.*.bInterfaceSubClass;
    dev.*.interface_protocol = intf_desc.*.bInterfaceProtocol;
    dev.*.report_descriptor_size = get_report_descriptor_size_from_interface_descriptors(intf_desc);
    dev.*.input_endpoint = 0;
    dev.*.input_ep_max_packet_size = 0;
    dev.*.output_endpoint = 0;
    {
        i = 0;
        while (i < @as(c_int, intf_desc.*.bNumEndpoints)) : (i += 1) {
            var ep: [*c]const struct_libusb_endpoint_descriptor = &intf_desc.*.endpoint[@bitCast(@as(isize, @intCast(i)))];
            _ = &ep;
            var is_interrupt: c_int = @intFromBool((@as(c_int, ep.*.bmAttributes) & LIBUSB_TRANSFER_TYPE_MASK) == LIBUSB_TRANSFER_TYPE_INTERRUPT);
            _ = &is_interrupt;
            var is_output: c_int = @intFromBool((@as(c_int, ep.*.bEndpointAddress) & LIBUSB_ENDPOINT_DIR_MASK) == LIBUSB_ENDPOINT_OUT);
            _ = &is_output;
            var is_input: c_int = @intFromBool((@as(c_int, ep.*.bEndpointAddress) & LIBUSB_ENDPOINT_DIR_MASK) == LIBUSB_ENDPOINT_IN);
            _ = &is_input;
            if (((dev.*.input_endpoint == @as(c_int, 0)) and (is_interrupt != 0)) and (is_input != 0)) {
                dev.*.input_endpoint = ep.*.bEndpointAddress;
                dev.*.input_ep_max_packet_size = ep.*.wMaxPacketSize;
            }
            if (((dev.*.output_endpoint == @as(c_int, 0)) and (is_interrupt != 0)) and (is_output != 0)) {
                dev.*.output_endpoint = ep.*.bEndpointAddress;
            }
        }
    }
    calculate_device_quirks(dev, desc.idVendor, desc.idProduct);
    start_read_operations(dev);
    return 1;
}
pub export fn LIBUSB_hid_open_path(path: [*c]const u8) [*c]LIBUSB_hid_device {
    @setEvalBranchQuota(100000);
    var dev: [*c]LIBUSB_hid_device = null;
    _ = &dev;
    var devs: [*c]?*libusb_device = null;
    _ = &devs;
    var usb_dev: ?*libusb_device = null;
    _ = &usb_dev;
    var res: c_int = 0;
    _ = &res;
    var d: c_int = 0;
    _ = &d;
    var good_open: c_int = 0;
    _ = &good_open;
    if (LIBUSB_hid_init() < @as(c_int, 0)) return null;
    dev = LIBUSB_new_hid_device();
    _ = libusb_ctx.*.get_device_list.?(usb_context, &devs);
    while ((@as(?*anyopaque, @ptrCast(@alignCast(blk: {
        const tmp = devs[
            @bitCast(@as(isize, @intCast(blk_1: {
                const ref = &d;
                const tmp_2 = ref.*;
                ref.* += 1;
                break :blk_1 tmp_2;
            })))
        ];
        usb_dev = tmp;
        break :blk tmp;
    }))) != @as(?*anyopaque, null)) and !(good_open != 0)) {
        var desc: struct_libusb_device_descriptor = undefined;
        _ = &desc;
        var conf_desc: [*c]struct_libusb_config_descriptor = null;
        _ = &conf_desc;
        var j: c_int = undefined;
        _ = &j;
        var k: c_int = undefined;
        _ = &k;
        res = libusb_ctx.*.get_device_descriptor.?(usb_dev, &desc);
        if (res < @as(c_int, 0)) continue;
        res = libusb_ctx.*.get_active_config_descriptor.?(usb_dev, &conf_desc);
        if (res < @as(c_int, 0)) {
            _ = libusb_ctx.*.get_config_descriptor.?(usb_dev, 0, &conf_desc);
        }
        if (!(conf_desc != null)) continue;
        {
            j = 0;
            while ((j < @as(c_int, conf_desc.*.bNumInterfaces)) and !(good_open != 0)) : (j += 1) {
                var intf: [*c]const struct_libusb_interface = &conf_desc.*.interface[@bitCast(@as(isize, @intCast(j)))];
                _ = &intf;
                {
                    k = 0;
                    while ((k < intf.*.num_altsetting) and !(good_open != 0)) : (k += 1) {
                        var intf_desc: [*c]const struct_libusb_interface_descriptor = &intf.*.altsetting[@bitCast(@as(isize, @intCast(k)))];
                        _ = &intf_desc;
                        if (should_enumerate_interface(desc.idVendor, desc.idProduct, intf_desc) != 0) {
                            var dev_path: [64]u8 = undefined;
                            _ = &dev_path;
                            get_path(&dev_path, usb_dev, conf_desc.*.bConfigurationValue, intf_desc.*.bInterfaceNumber);
                            if (!(SDL_strcmp_REAL(@ptrCast(@alignCast(&dev_path)), path) != 0)) {
                                res = libusb_ctx.*.open.?(usb_dev, &dev.*.device_handle);
                                if (res < @as(c_int, 0)) {
                                    while (true) {
                                        if (!false) break;
                                    }
                                    break;
                                }
                                good_open = hidapi_initialize_device(dev, intf_desc, conf_desc);
                                if (!(good_open != 0)) {
                                    libusb_ctx.*.close.?(dev.*.device_handle);
                                }
                            }
                        }
                    }
                }
            }
        }
        libusb_ctx.*.free_config_descriptor.?(conf_desc);
    }
    libusb_ctx.*.free_device_list.?(devs, 1);
    if (good_open != 0) {
        return dev;
    } else {
        LIBUSB_free_hid_device(dev);
        return null;
    }
}
pub export fn LIBUSB_hid_libusb_wrap_sys_device(arg_sys_dev: isize, arg_interface_num: c_int) [*c]LIBUSB_hid_device {
    @setEvalBranchQuota(100000);
    var sys_dev = arg_sys_dev;
    _ = &sys_dev;
    var interface_num = arg_interface_num;
    _ = &interface_num;
    _ = &sys_dev;
    _ = &interface_num;
    while (true) {
        if (!false) break;
    }
    return null;
}
pub export fn LIBUSB_hid_write(dev: [*c]LIBUSB_hid_device, arg_data: [*c]const u8, arg_length: usize) c_int {
    @setEvalBranchQuota(100000);
    var data = arg_data;
    _ = &data;
    var length = arg_length;
    _ = &length;
    var res: c_int = undefined;
    _ = &res;
    var report_number: c_int = undefined;
    _ = &report_number;
    var skipped_report_id: c_int = 0;
    _ = &skipped_report_id;
    if (!(data != null) or (length == @as(usize, 0))) {
        return -@as(c_int, 1);
    }
    report_number = data[@as(c_int, 0)];
    if ((!(dev.*.no_skip_output_report_id != 0) and (report_number == @as(c_int, 0))) or (dev.*.skip_output_report_id != 0)) {
        data += 1;
        length -%= 1;
        skipped_report_id = 1;
    }
    if ((dev.*.output_endpoint <= @as(c_int, 0)) or (dev.*.no_output_reports_on_intr_ep != 0)) {
        res = libusb_ctx.*.control_transfer.?(dev.*.device_handle, @bitCast(@as(i8, @truncate((LIBUSB_REQUEST_TYPE_CLASS | LIBUSB_RECIPIENT_INTERFACE) | LIBUSB_ENDPOINT_OUT))), 9, @bitCast(@as(c_short, @truncate((@as(c_int, 2) << @intCast(@as(c_int, 8))) | report_number))), @bitCast(@as(c_short, @truncate(dev.*.interface))), @ptrCast(@alignCast(@constCast(data))), @truncate(length), 1000);
        if (res < @as(c_int, 0)) return -@as(c_int, 1);
        if (skipped_report_id != 0) {
            length +%= 1;
        }
        return @bitCast(@as(c_uint, @truncate(length)));
    } else {
        var actual_length: c_int = undefined;
        _ = &actual_length;
        res = libusb_ctx.*.interrupt_transfer.?(dev.*.device_handle, @bitCast(@as(i8, @truncate(dev.*.output_endpoint))), @ptrCast(@alignCast(@constCast(data))), @bitCast(@as(c_uint, @truncate(length))), &actual_length, 1000);
        if (res < @as(c_int, 0)) return -@as(c_int, 1);
        if (skipped_report_id != 0) {
            actual_length += 1;
        }
        return actual_length;
    }
}
pub fn LIBUSB_return_data(dev: [*c]LIBUSB_hid_device, data: [*c]u8, length: usize) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var rpt: [*c]struct_LIBUSB_input_report = dev.*.input_reports;
    _ = &rpt;
    var len: usize = if (length < rpt.*.len) length else rpt.*.len;
    _ = &len;
    if (len > @as(usize, 0)) {
        _ = memcpy(@ptrCast(@alignCast(data)), @ptrCast(@alignCast(rpt.*.data)), len);
    }
    dev.*.input_reports = rpt.*.next;
    SDL_free_REAL(@ptrCast(@alignCast(rpt.*.data)));
    SDL_free_REAL(@ptrCast(@alignCast(rpt)));
    return @bitCast(@as(c_uint, @truncate(len)));
}
pub fn cleanup_mutex(param: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dev: [*c]LIBUSB_hid_device = @ptrCast(@alignCast(param));
    _ = &dev;
    hidapi_thread_mutex_unlock(&dev.*.thread_state);
}
pub export fn LIBUSB_hid_read_timeout(dev: [*c]LIBUSB_hid_device, data: [*c]u8, length: usize, milliseconds: c_int) c_int {
    @setEvalBranchQuota(100000);
    var bytes_read: c_int = undefined;
    _ = &bytes_read;
    var res: c_int = undefined;
    _ = &res;
    var ts: hidapi_timespec = undefined;
    _ = &ts;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                hidapi_thread_mutex_lock(&dev.*.thread_state);
                hidapi_thread_cleanup_push(cleanup_mutex, @ptrCast(@alignCast(dev)));
                bytes_read = -@as(c_int, 1);
                if (dev.*.input_reports != null) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                hidapi_thread_mutex_unlock(&dev.*.thread_state);
                hidapi_thread_cleanup_pop(0);
                return bytes_read;
            },
            2 => {
                bytes_read = LIBUSB_return_data(dev, data, length);
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
                if (dev.*.shutdown_thread != 0) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                bytes_read = -@as(c_int, 1);
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
                if (milliseconds == -@as(c_int, 1)) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            9 => {
                if (milliseconds > @as(c_int, 0)) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            10 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            11 => {
                if (!(dev.*.input_reports != null) and !(dev.*.shutdown_thread != 0)) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            12 => {
                hidapi_thread_cond_wait(&dev.*.thread_state);
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            13 => {
                if (dev.*.input_reports != null) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                bytes_read = LIBUSB_return_data(dev, data, length);
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
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            17 => {
                hidapi_thread_gettime(&ts);
                hidapi_thread_addtime(&ts, milliseconds);
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            18 => {
                bytes_read = 0;
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            19 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            20 => {
                if (!(dev.*.input_reports != null) and !(dev.*.shutdown_thread != 0)) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            21 => {
                res = hidapi_thread_cond_timedwait(&dev.*.thread_state, &ts);
                if (res == @as(c_int, 0)) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            22 => {
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            23 => {
                if (dev.*.input_reports != null) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            24 => {
                if (res == HIDAPI_THREAD_TIMED_OUT) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            25 => {
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            26 => {
                bytes_read = LIBUSB_return_data(dev, data, length);
                {
                    sdl_pc = 22;
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
                    sdl_pc = 25;
                    continue;
                }
            },
            29 => {
                bytes_read = 0;
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            30 => {
                bytes_read = -@as(c_int, 1);
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            31 => {
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn LIBUSB_hid_read(dev: [*c]LIBUSB_hid_device, data: [*c]u8, length: usize) c_int {
    @setEvalBranchQuota(100000);
    return LIBUSB_hid_read_timeout(dev, data, length, if (dev.*.blocking != 0) -@as(c_int, 1) else @as(c_int, 0));
}
pub export fn LIBUSB_hid_set_nonblocking(dev: [*c]LIBUSB_hid_device, nonblock: c_int) c_int {
    @setEvalBranchQuota(100000);
    dev.*.blocking = @intFromBool(!(nonblock != 0));
    return 0;
}
pub export fn LIBUSB_hid_send_feature_report(dev: [*c]LIBUSB_hid_device, arg_data: [*c]const u8, arg_length: usize) c_int {
    @setEvalBranchQuota(100000);
    var data = arg_data;
    _ = &data;
    var length = arg_length;
    _ = &length;
    var res: c_int = -@as(c_int, 1);
    _ = &res;
    var skipped_report_id: c_int = 0;
    _ = &skipped_report_id;
    var report_number: c_int = data[@as(c_int, 0)];
    _ = &report_number;
    if (report_number == @as(c_int, 0)) {
        data += 1;
        length -%= 1;
        skipped_report_id = 1;
    }
    res = libusb_ctx.*.control_transfer.?(dev.*.device_handle, @bitCast(@as(i8, @truncate((LIBUSB_REQUEST_TYPE_CLASS | LIBUSB_RECIPIENT_INTERFACE) | LIBUSB_ENDPOINT_OUT))), 9, @bitCast(@as(c_short, @truncate((@as(c_int, 3) << @intCast(@as(c_int, 8))) | report_number))), @bitCast(@as(c_short, @truncate(dev.*.interface))), @ptrCast(@alignCast(@constCast(data))), @truncate(length), 1000);
    if (res < @as(c_int, 0)) return -@as(c_int, 1);
    if (skipped_report_id != 0) {
        length +%= 1;
    }
    return @bitCast(@as(c_uint, @truncate(length)));
}
pub export fn LIBUSB_hid_get_feature_report(dev: [*c]LIBUSB_hid_device, arg_data: [*c]u8, arg_length: usize) c_int {
    @setEvalBranchQuota(100000);
    var data = arg_data;
    _ = &data;
    var length = arg_length;
    _ = &length;
    var res: c_int = -@as(c_int, 1);
    _ = &res;
    var skipped_report_id: c_int = 0;
    _ = &skipped_report_id;
    var report_number: c_int = data[@as(c_int, 0)];
    _ = &report_number;
    if (report_number == @as(c_int, 0)) {
        data += 1;
        length -%= 1;
        skipped_report_id = 1;
    }
    res = libusb_ctx.*.control_transfer.?(dev.*.device_handle, @bitCast(@as(i8, @truncate((LIBUSB_REQUEST_TYPE_CLASS | LIBUSB_RECIPIENT_INTERFACE) | LIBUSB_ENDPOINT_IN))), 1, @bitCast(@as(c_short, @truncate((@as(c_int, 3) << @intCast(@as(c_int, 8))) | report_number))), @bitCast(@as(c_short, @truncate(dev.*.interface))), data, @truncate(length), 1000);
    if (res < @as(c_int, 0)) return -@as(c_int, 1);
    if (skipped_report_id != 0) {
        res += 1;
    }
    return res;
}
pub export fn LIBUSB_hid_get_input_report(dev: [*c]LIBUSB_hid_device, arg_data: [*c]u8, arg_length: usize) c_int {
    @setEvalBranchQuota(100000);
    var data = arg_data;
    _ = &data;
    var length = arg_length;
    _ = &length;
    var res: c_int = -@as(c_int, 1);
    _ = &res;
    var skipped_report_id: c_int = 0;
    _ = &skipped_report_id;
    var report_number: c_int = data[@as(c_int, 0)];
    _ = &report_number;
    if (report_number == @as(c_int, 0)) {
        data += 1;
        length -%= 1;
        skipped_report_id = 1;
    }
    res = libusb_ctx.*.control_transfer.?(dev.*.device_handle, @bitCast(@as(i8, @truncate((LIBUSB_REQUEST_TYPE_CLASS | LIBUSB_RECIPIENT_INTERFACE) | LIBUSB_ENDPOINT_IN))), 1, @bitCast(@as(c_short, @truncate((@as(c_int, 1) << @intCast(@as(c_int, 8))) | report_number))), @bitCast(@as(c_short, @truncate(dev.*.interface))), data, @truncate(length), 1000);
    if (res < @as(c_int, 0)) return -@as(c_int, 1);
    if (skipped_report_id != 0) {
        res += 1;
    }
    return res;
}
pub export fn LIBUSB_hid_close(dev: [*c]LIBUSB_hid_device) void {
    @setEvalBranchQuota(100000);
    if (!(dev != null)) return;
    dev.*.shutdown_thread = 1;
    _ = libusb_ctx.*.cancel_transfer.?(dev.*.transfer);
    stop_read_operations(dev);
    SDL_free_REAL(@ptrCast(@alignCast(dev.*.transfer.*.buffer)));
    dev.*.transfer.*.buffer = null;
    libusb_ctx.*.free_transfer.?(dev.*.transfer);
    _ = libusb_ctx.*.release_interface.?(dev.*.device_handle, dev.*.interface);
    if (dev.*.is_driver_detached != 0) {
        var res: c_int = libusb_ctx.*.attach_kernel_driver.?(dev.*.device_handle, dev.*.interface);
        _ = &res;
        if (res < @as(c_int, 0)) while (true) {
            if (!false) break;
        };
    }
    libusb_ctx.*.close.?(dev.*.device_handle);
    hidapi_thread_mutex_lock(&dev.*.thread_state);
    while (dev.*.input_reports != null) {
        _ = LIBUSB_return_data(dev, null, 0);
    }
    hidapi_thread_mutex_unlock(&dev.*.thread_state);
    LIBUSB_free_hid_device(dev);
}
pub export fn LIBUSB_hid_get_manufacturer_string(dev: [*c]LIBUSB_hid_device, string: [*c]wchar_t, maxlen: usize) c_int {
    @setEvalBranchQuota(100000);
    return LIBUSB_hid_get_indexed_string(dev, dev.*.manufacturer_index, string, maxlen);
}
pub export fn LIBUSB_hid_get_product_string(dev: [*c]LIBUSB_hid_device, string: [*c]wchar_t, maxlen: usize) c_int {
    @setEvalBranchQuota(100000);
    return LIBUSB_hid_get_indexed_string(dev, dev.*.product_index, string, maxlen);
}
pub export fn LIBUSB_hid_get_serial_number_string(dev: [*c]LIBUSB_hid_device, string: [*c]wchar_t, maxlen: usize) c_int {
    @setEvalBranchQuota(100000);
    return LIBUSB_hid_get_indexed_string(dev, dev.*.serial_index, string, maxlen);
}
pub export fn LIBUSB_hid_get_device_info(dev: [*c]LIBUSB_hid_device) [*c]struct_hid_device_info {
    @setEvalBranchQuota(100000);
    if (!(dev.*.device_info != null)) {
        var desc: struct_libusb_device_descriptor = undefined;
        _ = &desc;
        var usb_device: ?*libusb_device = libusb_ctx.*.get_device.?(dev.*.device_handle);
        _ = &usb_device;
        _ = libusb_ctx.*.get_device_descriptor.?(usb_device, &desc);
        dev.*.device_info = create_device_info_for_device(usb_device, dev.*.device_handle, &desc, dev.*.config_number, dev.*.interface, dev.*.interface_class, dev.*.interface_subclass, dev.*.interface_protocol);
        if (dev.*.device_info != null) {
            fill_device_info_usage(dev.*.device_info, dev.*.device_handle, dev.*.interface, dev.*.report_descriptor_size);
        }
    }
    return dev.*.device_info;
}
pub export fn LIBUSB_hid_get_indexed_string(dev: [*c]LIBUSB_hid_device, string_index: c_int, string: [*c]wchar_t, maxlen: usize) c_int {
    @setEvalBranchQuota(100000);
    var str: [*c]wchar_t = undefined;
    _ = &str;
    str = get_usb_string(dev.*.device_handle, @bitCast(@as(i8, @truncate(string_index))));
    if (str != null) {
        _ = SDL_wcslcpy_REAL(string, str, maxlen);
        string[maxlen -% @as(usize, 1)] = '\u{0}';
        SDL_free_REAL(@ptrCast(@alignCast(str)));
        return 0;
    } else return -@as(c_int, 1);
}
pub export fn LIBUSB_hid_get_report_descriptor(dev: [*c]LIBUSB_hid_device, buf: [*c]u8, buf_size: usize) c_int {
    @setEvalBranchQuota(100000);
    return hid_get_report_descriptor_libusb(dev.*.device_handle, dev.*.interface, dev.*.report_descriptor_size, buf, buf_size);
}
pub export fn LIBUSB_hid_error(arg_dev: [*c]LIBUSB_hid_device) [*c]const wchar_t {
    @setEvalBranchQuota(100000);
    var dev = arg_dev;
    _ = &dev;
    _ = &dev;
    const wide_string_44 = [32:0]c_int{
        '\u{68}',
        '\u{69}',
        '\u{64}',
        '\u{5f}',
        '\u{65}',
        '\u{72}',
        '\u{72}',
        '\u{6f}',
        '\u{72}',
        '\u{20}',
        '\u{69}',
        '\u{73}',
        '\u{20}',
        '\u{6e}',
        '\u{6f}',
        '\u{74}',
        '\u{20}',
        '\u{69}',
        '\u{6d}',
        '\u{70}',
        '\u{6c}',
        '\u{65}',
        '\u{6d}',
        '\u{65}',
        '\u{6e}',
        '\u{74}',
        '\u{65}',
        '\u{64}',
        '\u{20}',
        '\u{79}',
        '\u{65}',
        '\u{74}',
    };
    return &wide_string_44;
}
pub const struct_lang_map_entry = extern struct {
    name: [*c]const u8 = null,
    string_code: [*c]const u8 = null,
    usb_code: u16 = 0,
};
pub var lang_map: [134]struct_lang_map_entry = [134]struct_lang_map_entry{
    struct_lang_map_entry{
        .name = "Afrikaans",
        .string_code = "af",
        .usb_code = 1078,
    },
    struct_lang_map_entry{
        .name = "Albanian",
        .string_code = "sq",
        .usb_code = 1052,
    },
    struct_lang_map_entry{
        .name = "Arabic - United Arab Emirates",
        .string_code = "ar_ae",
        .usb_code = 14337,
    },
    struct_lang_map_entry{
        .name = "Arabic - Bahrain",
        .string_code = "ar_bh",
        .usb_code = 15361,
    },
    struct_lang_map_entry{
        .name = "Arabic - Algeria",
        .string_code = "ar_dz",
        .usb_code = 5121,
    },
    struct_lang_map_entry{
        .name = "Arabic - Egypt",
        .string_code = "ar_eg",
        .usb_code = 3073,
    },
    struct_lang_map_entry{
        .name = "Arabic - Iraq",
        .string_code = "ar_iq",
        .usb_code = 2049,
    },
    struct_lang_map_entry{
        .name = "Arabic - Jordan",
        .string_code = "ar_jo",
        .usb_code = 11265,
    },
    struct_lang_map_entry{
        .name = "Arabic - Kuwait",
        .string_code = "ar_kw",
        .usb_code = 13313,
    },
    struct_lang_map_entry{
        .name = "Arabic - Lebanon",
        .string_code = "ar_lb",
        .usb_code = 12289,
    },
    struct_lang_map_entry{
        .name = "Arabic - Libya",
        .string_code = "ar_ly",
        .usb_code = 4097,
    },
    struct_lang_map_entry{
        .name = "Arabic - Morocco",
        .string_code = "ar_ma",
        .usb_code = 6145,
    },
    struct_lang_map_entry{
        .name = "Arabic - Oman",
        .string_code = "ar_om",
        .usb_code = 8193,
    },
    struct_lang_map_entry{
        .name = "Arabic - Qatar",
        .string_code = "ar_qa",
        .usb_code = 16385,
    },
    struct_lang_map_entry{
        .name = "Arabic - Saudi Arabia",
        .string_code = "ar_sa",
        .usb_code = 1025,
    },
    struct_lang_map_entry{
        .name = "Arabic - Syria",
        .string_code = "ar_sy",
        .usb_code = 10241,
    },
    struct_lang_map_entry{
        .name = "Arabic - Tunisia",
        .string_code = "ar_tn",
        .usb_code = 7169,
    },
    struct_lang_map_entry{
        .name = "Arabic - Yemen",
        .string_code = "ar_ye",
        .usb_code = 9217,
    },
    struct_lang_map_entry{
        .name = "Armenian",
        .string_code = "hy",
        .usb_code = 1067,
    },
    struct_lang_map_entry{
        .name = "Azeri - Latin",
        .string_code = "az_az",
        .usb_code = 1068,
    },
    struct_lang_map_entry{
        .name = "Azeri - Cyrillic",
        .string_code = "az_az",
        .usb_code = 2092,
    },
    struct_lang_map_entry{
        .name = "Basque",
        .string_code = "eu",
        .usb_code = 1069,
    },
    struct_lang_map_entry{
        .name = "Belarusian",
        .string_code = "be",
        .usb_code = 1059,
    },
    struct_lang_map_entry{
        .name = "Bulgarian",
        .string_code = "bg",
        .usb_code = 1026,
    },
    struct_lang_map_entry{
        .name = "Catalan",
        .string_code = "ca",
        .usb_code = 1027,
    },
    struct_lang_map_entry{
        .name = "Chinese - China",
        .string_code = "zh_cn",
        .usb_code = 2052,
    },
    struct_lang_map_entry{
        .name = "Chinese - Hong Kong SAR",
        .string_code = "zh_hk",
        .usb_code = 3076,
    },
    struct_lang_map_entry{
        .name = "Chinese - Macau SAR",
        .string_code = "zh_mo",
        .usb_code = 5124,
    },
    struct_lang_map_entry{
        .name = "Chinese - Singapore",
        .string_code = "zh_sg",
        .usb_code = 4100,
    },
    struct_lang_map_entry{
        .name = "Chinese - Taiwan",
        .string_code = "zh_tw",
        .usb_code = 1028,
    },
    struct_lang_map_entry{
        .name = "Croatian",
        .string_code = "hr",
        .usb_code = 1050,
    },
    struct_lang_map_entry{
        .name = "Czech",
        .string_code = "cs",
        .usb_code = 1029,
    },
    struct_lang_map_entry{
        .name = "Danish",
        .string_code = "da",
        .usb_code = 1030,
    },
    struct_lang_map_entry{
        .name = "Dutch - Netherlands",
        .string_code = "nl_nl",
        .usb_code = 1043,
    },
    struct_lang_map_entry{
        .name = "Dutch - Belgium",
        .string_code = "nl_be",
        .usb_code = 2067,
    },
    struct_lang_map_entry{
        .name = "English - Australia",
        .string_code = "en_au",
        .usb_code = 3081,
    },
    struct_lang_map_entry{
        .name = "English - Belize",
        .string_code = "en_bz",
        .usb_code = 10249,
    },
    struct_lang_map_entry{
        .name = "English - Canada",
        .string_code = "en_ca",
        .usb_code = 4105,
    },
    struct_lang_map_entry{
        .name = "English - Caribbean",
        .string_code = "en_cb",
        .usb_code = 9225,
    },
    struct_lang_map_entry{
        .name = "English - Ireland",
        .string_code = "en_ie",
        .usb_code = 6153,
    },
    struct_lang_map_entry{
        .name = "English - Jamaica",
        .string_code = "en_jm",
        .usb_code = 8201,
    },
    struct_lang_map_entry{
        .name = "English - New Zealand",
        .string_code = "en_nz",
        .usb_code = 5129,
    },
    struct_lang_map_entry{
        .name = "English - Philippines",
        .string_code = "en_ph",
        .usb_code = 13321,
    },
    struct_lang_map_entry{
        .name = "English - Southern Africa",
        .string_code = "en_za",
        .usb_code = 7177,
    },
    struct_lang_map_entry{
        .name = "English - Trinidad",
        .string_code = "en_tt",
        .usb_code = 11273,
    },
    struct_lang_map_entry{
        .name = "English - Great Britain",
        .string_code = "en_gb",
        .usb_code = 2057,
    },
    struct_lang_map_entry{
        .name = "English - United States",
        .string_code = "en_us",
        .usb_code = 1033,
    },
    struct_lang_map_entry{
        .name = "Estonian",
        .string_code = "et",
        .usb_code = 1061,
    },
    struct_lang_map_entry{
        .name = "Farsi",
        .string_code = "fa",
        .usb_code = 1065,
    },
    struct_lang_map_entry{
        .name = "Finnish",
        .string_code = "fi",
        .usb_code = 1035,
    },
    struct_lang_map_entry{
        .name = "Faroese",
        .string_code = "fo",
        .usb_code = 1080,
    },
    struct_lang_map_entry{
        .name = "French - France",
        .string_code = "fr_fr",
        .usb_code = 1036,
    },
    struct_lang_map_entry{
        .name = "French - Belgium",
        .string_code = "fr_be",
        .usb_code = 2060,
    },
    struct_lang_map_entry{
        .name = "French - Canada",
        .string_code = "fr_ca",
        .usb_code = 3084,
    },
    struct_lang_map_entry{
        .name = "French - Luxembourg",
        .string_code = "fr_lu",
        .usb_code = 5132,
    },
    struct_lang_map_entry{
        .name = "French - Switzerland",
        .string_code = "fr_ch",
        .usb_code = 4108,
    },
    struct_lang_map_entry{
        .name = "Gaelic - Ireland",
        .string_code = "gd_ie",
        .usb_code = 2108,
    },
    struct_lang_map_entry{
        .name = "Gaelic - Scotland",
        .string_code = "gd",
        .usb_code = 1084,
    },
    struct_lang_map_entry{
        .name = "German - Germany",
        .string_code = "de_de",
        .usb_code = 1031,
    },
    struct_lang_map_entry{
        .name = "German - Austria",
        .string_code = "de_at",
        .usb_code = 3079,
    },
    struct_lang_map_entry{
        .name = "German - Liechtenstein",
        .string_code = "de_li",
        .usb_code = 5127,
    },
    struct_lang_map_entry{
        .name = "German - Luxembourg",
        .string_code = "de_lu",
        .usb_code = 4103,
    },
    struct_lang_map_entry{
        .name = "German - Switzerland",
        .string_code = "de_ch",
        .usb_code = 2055,
    },
    struct_lang_map_entry{
        .name = "Greek",
        .string_code = "el",
        .usb_code = 1032,
    },
    struct_lang_map_entry{
        .name = "Hebrew",
        .string_code = "he",
        .usb_code = 1037,
    },
    struct_lang_map_entry{
        .name = "Hindi",
        .string_code = "hi",
        .usb_code = 1081,
    },
    struct_lang_map_entry{
        .name = "Hungarian",
        .string_code = "hu",
        .usb_code = 1038,
    },
    struct_lang_map_entry{
        .name = "Icelandic",
        .string_code = "is",
        .usb_code = 1039,
    },
    struct_lang_map_entry{
        .name = "Indonesian",
        .string_code = "id",
        .usb_code = 1057,
    },
    struct_lang_map_entry{
        .name = "Italian - Italy",
        .string_code = "it_it",
        .usb_code = 1040,
    },
    struct_lang_map_entry{
        .name = "Italian - Switzerland",
        .string_code = "it_ch",
        .usb_code = 2064,
    },
    struct_lang_map_entry{
        .name = "Japanese",
        .string_code = "ja",
        .usb_code = 1041,
    },
    struct_lang_map_entry{
        .name = "Korean",
        .string_code = "ko",
        .usb_code = 1042,
    },
    struct_lang_map_entry{
        .name = "Latvian",
        .string_code = "lv",
        .usb_code = 1062,
    },
    struct_lang_map_entry{
        .name = "Lithuanian",
        .string_code = "lt",
        .usb_code = 1063,
    },
    struct_lang_map_entry{
        .name = "F.Y.R.O. Macedonia",
        .string_code = "mk",
        .usb_code = 1071,
    },
    struct_lang_map_entry{
        .name = "Malay - Malaysia",
        .string_code = "ms_my",
        .usb_code = 1086,
    },
    struct_lang_map_entry{
        .name = "Malay – Brunei",
        .string_code = "ms_bn",
        .usb_code = 2110,
    },
    struct_lang_map_entry{
        .name = "Maltese",
        .string_code = "mt",
        .usb_code = 1082,
    },
    struct_lang_map_entry{
        .name = "Marathi",
        .string_code = "mr",
        .usb_code = 1102,
    },
    struct_lang_map_entry{
        .name = "Norwegian - Bokml",
        .string_code = "no_no",
        .usb_code = 1044,
    },
    struct_lang_map_entry{
        .name = "Norwegian - Nynorsk",
        .string_code = "no_no",
        .usb_code = 2068,
    },
    struct_lang_map_entry{
        .name = "Polish",
        .string_code = "pl",
        .usb_code = 1045,
    },
    struct_lang_map_entry{
        .name = "Portuguese - Portugal",
        .string_code = "pt_pt",
        .usb_code = 2070,
    },
    struct_lang_map_entry{
        .name = "Portuguese - Brazil",
        .string_code = "pt_br",
        .usb_code = 1046,
    },
    struct_lang_map_entry{
        .name = "Raeto-Romance",
        .string_code = "rm",
        .usb_code = 1047,
    },
    struct_lang_map_entry{
        .name = "Romanian - Romania",
        .string_code = "ro",
        .usb_code = 1048,
    },
    struct_lang_map_entry{
        .name = "Romanian - Republic of Moldova",
        .string_code = "ro_mo",
        .usb_code = 2072,
    },
    struct_lang_map_entry{
        .name = "Russian",
        .string_code = "ru",
        .usb_code = 1049,
    },
    struct_lang_map_entry{
        .name = "Russian - Republic of Moldova",
        .string_code = "ru_mo",
        .usb_code = 2073,
    },
    struct_lang_map_entry{
        .name = "Sanskrit",
        .string_code = "sa",
        .usb_code = 1103,
    },
    struct_lang_map_entry{
        .name = "Serbian - Cyrillic",
        .string_code = "sr_sp",
        .usb_code = 3098,
    },
    struct_lang_map_entry{
        .name = "Serbian - Latin",
        .string_code = "sr_sp",
        .usb_code = 2074,
    },
    struct_lang_map_entry{
        .name = "Setsuana",
        .string_code = "tn",
        .usb_code = 1074,
    },
    struct_lang_map_entry{
        .name = "Slovenian",
        .string_code = "sl",
        .usb_code = 1060,
    },
    struct_lang_map_entry{
        .name = "Slovak",
        .string_code = "sk",
        .usb_code = 1051,
    },
    struct_lang_map_entry{
        .name = "Sorbian",
        .string_code = "sb",
        .usb_code = 1070,
    },
    struct_lang_map_entry{
        .name = "Spanish - Spain (Traditional)",
        .string_code = "es_es",
        .usb_code = 1034,
    },
    struct_lang_map_entry{
        .name = "Spanish - Argentina",
        .string_code = "es_ar",
        .usb_code = 11274,
    },
    struct_lang_map_entry{
        .name = "Spanish - Bolivia",
        .string_code = "es_bo",
        .usb_code = 16394,
    },
    struct_lang_map_entry{
        .name = "Spanish - Chile",
        .string_code = "es_cl",
        .usb_code = 13322,
    },
    struct_lang_map_entry{
        .name = "Spanish - Colombia",
        .string_code = "es_co",
        .usb_code = 9226,
    },
    struct_lang_map_entry{
        .name = "Spanish - Costa Rica",
        .string_code = "es_cr",
        .usb_code = 5130,
    },
    struct_lang_map_entry{
        .name = "Spanish - Dominican Republic",
        .string_code = "es_do",
        .usb_code = 7178,
    },
    struct_lang_map_entry{
        .name = "Spanish - Ecuador",
        .string_code = "es_ec",
        .usb_code = 12298,
    },
    struct_lang_map_entry{
        .name = "Spanish - Guatemala",
        .string_code = "es_gt",
        .usb_code = 4106,
    },
    struct_lang_map_entry{
        .name = "Spanish - Honduras",
        .string_code = "es_hn",
        .usb_code = 18442,
    },
    struct_lang_map_entry{
        .name = "Spanish - Mexico",
        .string_code = "es_mx",
        .usb_code = 2058,
    },
    struct_lang_map_entry{
        .name = "Spanish - Nicaragua",
        .string_code = "es_ni",
        .usb_code = 19466,
    },
    struct_lang_map_entry{
        .name = "Spanish - Panama",
        .string_code = "es_pa",
        .usb_code = 6154,
    },
    struct_lang_map_entry{
        .name = "Spanish - Peru",
        .string_code = "es_pe",
        .usb_code = 10250,
    },
    struct_lang_map_entry{
        .name = "Spanish - Puerto Rico",
        .string_code = "es_pr",
        .usb_code = 20490,
    },
    struct_lang_map_entry{
        .name = "Spanish - Paraguay",
        .string_code = "es_py",
        .usb_code = 15370,
    },
    struct_lang_map_entry{
        .name = "Spanish - El Salvador",
        .string_code = "es_sv",
        .usb_code = 17418,
    },
    struct_lang_map_entry{
        .name = "Spanish - Uruguay",
        .string_code = "es_uy",
        .usb_code = 14346,
    },
    struct_lang_map_entry{
        .name = "Spanish - Venezuela",
        .string_code = "es_ve",
        .usb_code = 8202,
    },
    struct_lang_map_entry{
        .name = "Southern Sotho",
        .string_code = "st",
        .usb_code = 1072,
    },
    struct_lang_map_entry{
        .name = "Swahili",
        .string_code = "sw",
        .usb_code = 1089,
    },
    struct_lang_map_entry{
        .name = "Swedish - Sweden",
        .string_code = "sv_se",
        .usb_code = 1053,
    },
    struct_lang_map_entry{
        .name = "Swedish - Finland",
        .string_code = "sv_fi",
        .usb_code = 2077,
    },
    struct_lang_map_entry{
        .name = "Tamil",
        .string_code = "ta",
        .usb_code = 1097,
    },
    struct_lang_map_entry{
        .name = "Tatar",
        .string_code = "tt",
        .usb_code = 1092,
    },
    struct_lang_map_entry{
        .name = "Thai",
        .string_code = "th",
        .usb_code = 1054,
    },
    struct_lang_map_entry{
        .name = "Turkish",
        .string_code = "tr",
        .usb_code = 1055,
    },
    struct_lang_map_entry{
        .name = "Tsonga",
        .string_code = "ts",
        .usb_code = 1073,
    },
    struct_lang_map_entry{
        .name = "Ukrainian",
        .string_code = "uk",
        .usb_code = 1058,
    },
    struct_lang_map_entry{
        .name = "Urdu",
        .string_code = "ur",
        .usb_code = 1056,
    },
    struct_lang_map_entry{
        .name = "Uzbek - Cyrillic",
        .string_code = "uz_uz",
        .usb_code = 2115,
    },
    struct_lang_map_entry{
        .name = "Uzbek – Latin",
        .string_code = "uz_uz",
        .usb_code = 1091,
    },
    struct_lang_map_entry{
        .name = "Vietnamese",
        .string_code = "vi",
        .usb_code = 1066,
    },
    struct_lang_map_entry{
        .name = "Xhosa",
        .string_code = "xh",
        .usb_code = 1076,
    },
    struct_lang_map_entry{
        .name = "Yiddish",
        .string_code = "yi",
        .usb_code = 1085,
    },
    struct_lang_map_entry{
        .name = "Zulu",
        .string_code = "zu",
        .usb_code = 1077,
    },
    struct_lang_map_entry{
        .name = null,
        .string_code = null,
        .usb_code = 0,
    },
};
pub export fn LIBUSB_get_usb_code_for_current_locale() u16 {
    @setEvalBranchQuota(100000);
    var locale: [*c]u8 = undefined;
    _ = &locale;
    var search_string: [64]u8 = undefined;
    _ = &search_string;
    var ptr: [*c]u8 = undefined;
    _ = &ptr;
    var lang: [*c]struct_lang_map_entry = undefined;
    _ = &lang;
    locale = null;
    if (!(locale != null)) return 0;
    _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&search_string)), locale, @sizeOf(@TypeOf(search_string)) -% @as(c_ulong, 1));
    search_string[@sizeOf(@TypeOf(search_string)) -% @as(c_ulong, 1)] = '\x00';
    ptr = @ptrCast(@alignCast(&search_string));
    while (@as(c_int, ptr.*) != 0) {
        ptr.* = @bitCast(@as(i8, @truncate(SDL_tolower_REAL(ptr.*))));
        if (@as(c_int, ptr.*) == @as(c_int, '.')) {
            ptr.* = '\x00';
            break;
        }
        ptr += 1;
    }
    lang = @ptrCast(@alignCast(&lang_map));
    while (lang.*.string_code != null) {
        if (!(SDL_strcmp_REAL(lang.*.string_code, @ptrCast(@alignCast(&search_string))) != 0)) {
            return lang.*.usb_code;
        }
        lang += 1;
    }
    ptr = @ptrCast(@alignCast(&search_string));
    while (@as(c_int, ptr.*) != 0) {
        ptr.* = @bitCast(@as(i8, @truncate(SDL_tolower_REAL(ptr.*))));
        if (@as(c_int, ptr.*) == @as(c_int, '_')) {
            ptr.* = '\x00';
            break;
        }
        ptr += 1;
    }
    return 0;
}
const struct_unnamed_45 = extern struct {
    vendor: Uint16 = 0,
    product: Uint16 = 0,
};
pub const SDL_libusb_required: [6]struct_unnamed_45 = [6]struct_unnamed_45{
    struct_unnamed_45{
        .vendor = USB_VENDOR_NINTENDO,
        .product = USB_PRODUCT_NINTENDO_GAMECUBE_ADAPTER,
    },
    struct_unnamed_45{
        .vendor = USB_VENDOR_NINTENDO,
        .product = USB_PRODUCT_NINTENDO_SWITCH2_GAMECUBE_CONTROLLER,
    },
    struct_unnamed_45{
        .vendor = USB_VENDOR_NINTENDO,
        .product = USB_PRODUCT_NINTENDO_SWITCH2_JOYCON_LEFT,
    },
    struct_unnamed_45{
        .vendor = USB_VENDOR_NINTENDO,
        .product = USB_PRODUCT_NINTENDO_SWITCH2_JOYCON_RIGHT,
    },
    struct_unnamed_45{
        .vendor = USB_VENDOR_NINTENDO,
        .product = USB_PRODUCT_NINTENDO_SWITCH2_PRO,
    },
    struct_unnamed_45{
        .vendor = USB_VENDOR_MICROSOFT,
        .product = USB_PRODUCT_XBOX360_BIGBUTTON_RECEIVER,
    },
};
pub fn RequiresLibUSB(vendor: Uint16, product: Uint16, _: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    {
        var i: c_int = 0;
        _ = &i;
        while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(SDL_libusb_required)) / @sizeOf(@TypeOf(SDL_libusb_required[@as(c_int, 0)])))) : (i += 1) {
            if ((@as(c_int, vendor) == @as(c_int, SDL_libusb_required[@bitCast(@as(isize, @intCast(i)))].vendor)) and (@as(c_int, product) == @as(c_int, SDL_libusb_required[@bitCast(@as(isize, @intCast(i)))].product))) {
                return @"true" != 0;
            }
        }
    }
    return @"false" != 0;
}
pub var use_libusb_whitelist: bool = @"true" != 0;
pub var use_libusb_gamecube: bool = @"true" != 0;
pub fn PLATFORM_hid_write_backend(device: ?*hid_device, data: [*c]const u8, length: usize) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return PLATFORM_hid_write(@ptrCast(@alignCast(device)), data, length);
}
pub fn PLATFORM_hid_read_timeout_backend(device: ?*hid_device, data: [*c]u8, length: usize, milliseconds: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return PLATFORM_hid_read_timeout(@ptrCast(@alignCast(device)), data, length, milliseconds);
}
pub fn PLATFORM_hid_read_backend(device: ?*hid_device, data: [*c]u8, length: usize) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return PLATFORM_hid_read(@ptrCast(@alignCast(device)), data, length);
}
pub fn PLATFORM_hid_set_nonblocking_backend(device: ?*hid_device, nonblock: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return PLATFORM_hid_set_nonblocking(@ptrCast(@alignCast(device)), nonblock);
}
pub fn PLATFORM_hid_send_feature_report_backend(device: ?*hid_device, data: [*c]const u8, length: usize) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return PLATFORM_hid_send_feature_report(@ptrCast(@alignCast(device)), data, length);
}
pub fn PLATFORM_hid_get_feature_report_backend(device: ?*hid_device, data: [*c]u8, length: usize) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return PLATFORM_hid_get_feature_report(@ptrCast(@alignCast(device)), data, length);
}
pub fn PLATFORM_hid_get_input_report_backend(device: ?*hid_device, data: [*c]u8, length: usize) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return PLATFORM_hid_get_input_report(@ptrCast(@alignCast(device)), data, length);
}
pub fn PLATFORM_hid_close_backend(device: ?*hid_device) callconv(.c) void {
    @setEvalBranchQuota(100000);
    PLATFORM_hid_close(@ptrCast(@alignCast(device)));
}
pub fn PLATFORM_hid_get_manufacturer_string_backend(device: ?*hid_device, string: [*c]wchar_t, maxlen: usize) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return PLATFORM_hid_get_manufacturer_string(@ptrCast(@alignCast(device)), string, maxlen);
}
pub fn PLATFORM_hid_get_product_string_backend(device: ?*hid_device, string: [*c]wchar_t, maxlen: usize) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return PLATFORM_hid_get_product_string(@ptrCast(@alignCast(device)), string, maxlen);
}
pub fn PLATFORM_hid_get_serial_number_string_backend(device: ?*hid_device, string: [*c]wchar_t, maxlen: usize) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return PLATFORM_hid_get_serial_number_string(@ptrCast(@alignCast(device)), string, maxlen);
}
pub fn PLATFORM_hid_get_indexed_string_backend(device: ?*hid_device, string_index: c_int, string: [*c]wchar_t, maxlen: usize) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return PLATFORM_hid_get_indexed_string(@ptrCast(@alignCast(device)), string_index, string, maxlen);
}
pub fn PLATFORM_hid_get_device_info_backend(device: ?*hid_device) callconv(.c) [*c]struct_hid_device_info {
    @setEvalBranchQuota(100000);
    return PLATFORM_hid_get_device_info(@ptrCast(@alignCast(device)));
}
pub fn PLATFORM_hid_get_report_descriptor_backend(device: ?*hid_device, buf: [*c]u8, buf_size: usize) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return PLATFORM_hid_get_report_descriptor(@ptrCast(@alignCast(device)), buf, buf_size);
}
pub fn PLATFORM_hid_error_backend(device: ?*hid_device) callconv(.c) [*c]const wchar_t {
    @setEvalBranchQuota(100000);
    return PLATFORM_hid_error(@ptrCast(@alignCast(device)));
}
pub const PLATFORM_Backend: struct_hidapi_backend = struct_hidapi_backend{
    .hid_write = PLATFORM_hid_write_backend,
    .hid_read_timeout = PLATFORM_hid_read_timeout_backend,
    .hid_read = PLATFORM_hid_read_backend,
    .hid_set_nonblocking = PLATFORM_hid_set_nonblocking_backend,
    .hid_send_feature_report = PLATFORM_hid_send_feature_report_backend,
    .hid_get_feature_report = PLATFORM_hid_get_feature_report_backend,
    .hid_get_input_report = PLATFORM_hid_get_input_report_backend,
    .hid_close = PLATFORM_hid_close_backend,
    .hid_get_manufacturer_string = PLATFORM_hid_get_manufacturer_string_backend,
    .hid_get_product_string = PLATFORM_hid_get_product_string_backend,
    .hid_get_serial_number_string = PLATFORM_hid_get_serial_number_string_backend,
    .hid_get_indexed_string = PLATFORM_hid_get_indexed_string_backend,
    .hid_get_device_info = PLATFORM_hid_get_device_info_backend,
    .hid_get_report_descriptor = PLATFORM_hid_get_report_descriptor_backend,
    .hid_error = PLATFORM_hid_error_backend,
};
pub fn LIBUSB_hid_write_backend(device: ?*hid_device, data: [*c]const u8, length: usize) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return LIBUSB_hid_write(@ptrCast(@alignCast(device)), data, length);
}
pub fn LIBUSB_hid_read_timeout_backend(device: ?*hid_device, data: [*c]u8, length: usize, milliseconds: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return LIBUSB_hid_read_timeout(@ptrCast(@alignCast(device)), data, length, milliseconds);
}
pub fn LIBUSB_hid_read_backend(device: ?*hid_device, data: [*c]u8, length: usize) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return LIBUSB_hid_read(@ptrCast(@alignCast(device)), data, length);
}
pub fn LIBUSB_hid_set_nonblocking_backend(device: ?*hid_device, nonblock: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return LIBUSB_hid_set_nonblocking(@ptrCast(@alignCast(device)), nonblock);
}
pub fn LIBUSB_hid_send_feature_report_backend(device: ?*hid_device, data: [*c]const u8, length: usize) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return LIBUSB_hid_send_feature_report(@ptrCast(@alignCast(device)), data, length);
}
pub fn LIBUSB_hid_get_feature_report_backend(device: ?*hid_device, data: [*c]u8, length: usize) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return LIBUSB_hid_get_feature_report(@ptrCast(@alignCast(device)), data, length);
}
pub fn LIBUSB_hid_get_input_report_backend(device: ?*hid_device, data: [*c]u8, length: usize) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return LIBUSB_hid_get_input_report(@ptrCast(@alignCast(device)), data, length);
}
pub fn LIBUSB_hid_close_backend(device: ?*hid_device) callconv(.c) void {
    @setEvalBranchQuota(100000);
    LIBUSB_hid_close(@ptrCast(@alignCast(device)));
}
pub fn LIBUSB_hid_get_manufacturer_string_backend(device: ?*hid_device, string: [*c]wchar_t, maxlen: usize) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return LIBUSB_hid_get_manufacturer_string(@ptrCast(@alignCast(device)), string, maxlen);
}
pub fn LIBUSB_hid_get_product_string_backend(device: ?*hid_device, string: [*c]wchar_t, maxlen: usize) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return LIBUSB_hid_get_product_string(@ptrCast(@alignCast(device)), string, maxlen);
}
pub fn LIBUSB_hid_get_serial_number_string_backend(device: ?*hid_device, string: [*c]wchar_t, maxlen: usize) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return LIBUSB_hid_get_serial_number_string(@ptrCast(@alignCast(device)), string, maxlen);
}
pub fn LIBUSB_hid_get_indexed_string_backend(device: ?*hid_device, string_index: c_int, string: [*c]wchar_t, maxlen: usize) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return LIBUSB_hid_get_indexed_string(@ptrCast(@alignCast(device)), string_index, string, maxlen);
}
pub fn LIBUSB_hid_get_device_info_backend(device: ?*hid_device) callconv(.c) [*c]struct_hid_device_info {
    @setEvalBranchQuota(100000);
    return LIBUSB_hid_get_device_info(@ptrCast(@alignCast(device)));
}
pub fn LIBUSB_hid_get_report_descriptor_backend(device: ?*hid_device, buf: [*c]u8, buf_size: usize) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return LIBUSB_hid_get_report_descriptor(@ptrCast(@alignCast(device)), buf, buf_size);
}
pub fn LIBUSB_hid_error_backend(device: ?*hid_device) callconv(.c) [*c]const wchar_t {
    @setEvalBranchQuota(100000);
    return LIBUSB_hid_error(@ptrCast(@alignCast(device)));
}
pub const LIBUSB_Backend: struct_hidapi_backend = struct_hidapi_backend{
    .hid_write = LIBUSB_hid_write_backend,
    .hid_read_timeout = LIBUSB_hid_read_timeout_backend,
    .hid_read = LIBUSB_hid_read_backend,
    .hid_set_nonblocking = LIBUSB_hid_set_nonblocking_backend,
    .hid_send_feature_report = LIBUSB_hid_send_feature_report_backend,
    .hid_get_feature_report = LIBUSB_hid_get_feature_report_backend,
    .hid_get_input_report = LIBUSB_hid_get_input_report_backend,
    .hid_close = LIBUSB_hid_close_backend,
    .hid_get_manufacturer_string = LIBUSB_hid_get_manufacturer_string_backend,
    .hid_get_product_string = LIBUSB_hid_get_product_string_backend,
    .hid_get_serial_number_string = LIBUSB_hid_get_serial_number_string_backend,
    .hid_get_indexed_string = LIBUSB_hid_get_indexed_string_backend,
    .hid_get_device_info = LIBUSB_hid_get_device_info_backend,
    .hid_get_report_descriptor = LIBUSB_hid_get_report_descriptor_backend,
    .hid_error = LIBUSB_hid_error_backend,
};
pub fn CreateHIDDeviceWrapper(device: ?*anyopaque, backend: [*c]const struct_hidapi_backend) callconv(.c) [*c]SDL_hid_device {
    @setEvalBranchQuota(100000);
    var wrapper: [*c]SDL_hid_device = undefined;
    wrapper = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(wrapper.*)))));
    _ = &wrapper;
    SDL_SetObjectValid(@ptrCast(@alignCast(wrapper)), SDL_OBJECT_TYPE_HIDAPI_DEVICE, @"true" != 0);
    wrapper.*.device = device;
    wrapper.*.backend = backend;
    _ = memset(@ptrCast(@alignCast(&wrapper.*.info)), 0, @sizeOf(@TypeOf(wrapper.*.info)));
    return wrapper;
}
pub fn DeleteHIDDeviceWrapper(wrapper: [*c]SDL_hid_device) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_SetObjectValid(@ptrCast(@alignCast(wrapper)), SDL_OBJECT_TYPE_HIDAPI_DEVICE, @"false" != 0);
    SDL_free_REAL(@ptrCast(@alignCast(wrapper.*.info.path)));
    SDL_free_REAL(@ptrCast(@alignCast(wrapper.*.info.serial_number)));
    SDL_free_REAL(@ptrCast(@alignCast(wrapper.*.info.manufacturer_string)));
    SDL_free_REAL(@ptrCast(@alignCast(wrapper.*.info.product_string)));
    SDL_free_REAL(@ptrCast(@alignCast(wrapper)));
}
pub fn CopyHIDDeviceInfo(pSrc: [*c]struct_hid_device_info, pDst: [*c]struct_SDL_hid_device_info) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (@as(?*anyopaque, @ptrCast(@alignCast(pSrc.*.path))) != @as(?*anyopaque, null)) {
        pDst.*.path = SDL_strdup_REAL(pSrc.*.path);
    } else {
        pDst.*.path = null;
    }
    pDst.*.vendor_id = pSrc.*.vendor_id;
    pDst.*.product_id = pSrc.*.product_id;
    if (@as(?*anyopaque, @ptrCast(@alignCast(pSrc.*.serial_number))) != @as(?*anyopaque, null)) {
        pDst.*.serial_number = SDL_wcsdup_REAL(pSrc.*.serial_number);
    } else {
        pDst.*.serial_number = null;
    }
    pDst.*.release_number = pSrc.*.release_number;
    if (@as(?*anyopaque, @ptrCast(@alignCast(pSrc.*.manufacturer_string))) != @as(?*anyopaque, null)) {
        pDst.*.manufacturer_string = SDL_wcsdup_REAL(pSrc.*.manufacturer_string);
    } else {
        pDst.*.manufacturer_string = null;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(pSrc.*.product_string))) != @as(?*anyopaque, null)) {
        pDst.*.product_string = SDL_wcsdup_REAL(pSrc.*.product_string);
    } else {
        pDst.*.product_string = null;
    }
    pDst.*.usage_page = pSrc.*.usage_page;
    pDst.*.usage = pSrc.*.usage;
    pDst.*.interface_number = pSrc.*.interface_number;
    pDst.*.interface_class = pSrc.*.interface_class;
    pDst.*.interface_subclass = pSrc.*.interface_subclass;
    pDst.*.interface_protocol = pSrc.*.interface_protocol;
    pDst.*.bus_type = pSrc.*.bus_type;
    pDst.*.next = null;
}
pub var SDL_hidapi_refcount: c_int = 0;
pub var SDL_hidapi_only_controllers: bool = false;
pub var SDL_hidapi_ignored_devices: [*c]u8 = null;
pub fn OnlyControllersChanged(_: ?*anyopaque, _: [*c]const u8, _: [*c]const u8, hint: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_hidapi_only_controllers = SDL_GetStringBoolean(hint, @"true" != 0);
}
pub fn IgnoredDevicesChanged(_: ?*anyopaque, _: [*c]const u8, _: [*c]const u8, hint: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_free_REAL(@ptrCast(@alignCast(SDL_hidapi_ignored_devices)));
    if ((hint != null) and (@as(c_int, hint.*) != 0)) {
        SDL_hidapi_ignored_devices = SDL_strdup_REAL(hint);
    } else {
        SDL_hidapi_ignored_devices = null;
    }
}
pub export fn SDL_HIDAPI_ShouldIgnoreDevice(bus: c_int, vendor_id: Uint16, product_id: Uint16, usage_page: Uint16, usage: Uint16, libusb: bool, libusb_xbox: bool) bool {
    @setEvalBranchQuota(100000);
    if (libusb) {
        if (use_libusb_whitelist and !RequiresLibUSB(vendor_id, product_id, libusb_xbox)) {
            return @"true" != 0;
        }
        if ((!use_libusb_gamecube and (@as(c_int, vendor_id) == USB_VENDOR_NINTENDO)) and (@as(c_int, product_id) == USB_PRODUCT_NINTENDO_GAMECUBE_ADAPTER)) {
            return @"true" != 0;
        }
    } else {
        if (RequiresLibUSB(vendor_id, product_id, libusb_xbox)) {
            return @"true" != 0;
        }
    }
    if (SDL_hidapi_only_controllers and (@as(c_int, usage_page) != 0)) {
        if (@as(c_int, vendor_id) == USB_VENDOR_VALVE) {
            if (((bus == HID_API_BUS_USB) and (@as(c_int, usage_page) == USB_USAGEPAGE_GENERIC_DESKTOP)) and ((@as(c_int, usage) == USB_USAGE_GENERIC_KEYBOARD) or (@as(c_int, usage) == USB_USAGE_GENERIC_MOUSE))) {
                return @"true" != 0;
            }
        } else if ((@as(c_int, vendor_id) == USB_VENDOR_FLYDIGI_V1) and (@as(c_int, product_id) == USB_PRODUCT_FLYDIGI_V1_GAMEPAD)) {
            if (@as(c_int, usage_page) == USB_USAGEPAGE_VENDOR_FLYDIGI) {
                return @"false" != 0;
            }
            return @"true" != 0;
        } else if ((@as(c_int, vendor_id) == USB_VENDOR_FLYDIGI_V2) and (((@as(c_int, product_id) == USB_PRODUCT_FLYDIGI_V2_APEX) or (@as(c_int, product_id) == USB_PRODUCT_FLYDIGI_V2_VADER)) or (@as(c_int, product_id) == USB_PRODUCT_FLYDIGI_V2_APEX6))) {
            if (@as(c_int, usage_page) == USB_USAGEPAGE_VENDOR_FLYDIGI) {
                return @"false" != 0;
            }
            return @"true" != 0;
        } else if ((@as(c_int, usage_page) == USB_USAGEPAGE_GENERIC_DESKTOP) and (((@as(c_int, usage) == USB_USAGE_GENERIC_JOYSTICK) or (@as(c_int, usage) == USB_USAGE_GENERIC_GAMEPAD)) or (@as(c_int, usage) == USB_USAGE_GENERIC_MULTIAXISCONTROLLER))) {} else {
            return @"true" != 0;
        }
    }
    if (SDL_hidapi_ignored_devices != null) {
        var vendor_match: [16]u8 = undefined;
        _ = &vendor_match;
        var product_match: [16]u8 = undefined;
        _ = &product_match;
        _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&vendor_match)), @sizeOf(@TypeOf(vendor_match)), "0x%.4x/0x0000", vendor_id);
        _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&product_match)), @sizeOf(@TypeOf(product_match)), "0x%.4x/0x%.4x", vendor_id, product_id);
        if ((SDL_strcasestr_REAL(SDL_hidapi_ignored_devices, @ptrCast(@alignCast(&vendor_match))) != null) or (SDL_strcasestr_REAL(SDL_hidapi_ignored_devices, @ptrCast(@alignCast(&product_match))) != null)) {
            return @"true" != 0;
        }
    }
    return @"false" != 0;
}
pub export fn SDL_hid_init_REAL() c_int {
    @setEvalBranchQuota(100000);
    var attempts: c_int = 0;
    _ = &attempts;
    var success: c_int = 0;
    _ = &success;
    if (SDL_hidapi_refcount > @as(c_int, 0)) {
        SDL_hidapi_refcount += 1;
        return 0;
    }
    _ = SDL_AddHintCallback_REAL("SDL_HIDAPI_ENUMERATE_ONLY_CONTROLLERS", OnlyControllersChanged, null);
    _ = SDL_AddHintCallback_REAL("SDL_HIDAPI_IGNORE_DEVICES", IgnoredDevicesChanged, null);
    if (!SDL_GetHintBoolean_REAL("SDL_HIDAPI_UDEV", @"true" != 0)) {
        SDL_LogDebug_REAL(SDL_LOG_CATEGORY_INPUT, "udev disabled by SDL_HINT_HIDAPI_UDEV");
        linux_enumeration_method = ENUMERATION_FALLBACK;
    } else if (SDL_GetSandbox_REAL() != @as(SDL_Sandbox, SDL_SANDBOX_NONE)) {
        SDL_LogDebug_REAL(SDL_LOG_CATEGORY_INPUT, "Container detected, disabling HIDAPI udev integration");
        linux_enumeration_method = ENUMERATION_FALLBACK;
    } else {
        SDL_LogDebug_REAL(SDL_LOG_CATEGORY_INPUT, "Using udev for HIDAPI joystick device discovery");
        linux_enumeration_method = ENUMERATION_LIBUDEV;
    }
    use_libusb_whitelist = SDL_GetHintBoolean_REAL("SDL_HIDAPI_LIBUSB_WHITELIST", @"true" != 0);
    use_libusb_gamecube = SDL_GetHintBoolean_REAL("SDL_HIDAPI_LIBUSB_GAMECUBE", @"true" != 0);
    if (!SDL_GetHintBoolean_REAL("SDL_HIDAPI_LIBUSB", @"true" != 0)) {
        SDL_LogDebug_REAL(SDL_LOG_CATEGORY_INPUT, "libusb disabled with SDL_HINT_HIDAPI_LIBUSB");
    } else {
        attempts += 1;
        if (!SDL_InitLibUSB(&libusb_ctx)) {
            SDL_LogDebug_REAL(SDL_LOG_CATEGORY_INPUT, "Couldn't load libusb");
        } else if (LIBUSB_hid_init() < @as(c_int, 0)) {
            SDL_QuitLibUSB();
            libusb_ctx = null;
        } else {
            success += 1;
        }
    }
    attempts += 1;
    udev_ctx = SDL_UDEV_GetUdevSyms();
    if ((udev_ctx != null) and (PLATFORM_hid_init() == @as(c_int, 0))) {
        success += 1;
    }
    if ((attempts > @as(c_int, 0)) and (success == @as(c_int, 0))) {
        return -@as(c_int, 1);
    }
    SDL_hidapi_refcount += 1;
    return 0;
}
pub export fn SDL_hid_exit_REAL() c_int {
    @setEvalBranchQuota(100000);
    var result: c_int = 0;
    _ = &result;
    if (SDL_hidapi_refcount == @as(c_int, 0)) {
        return 0;
    }
    SDL_hidapi_refcount -= 1;
    if (SDL_hidapi_refcount > @as(c_int, 0)) {
        return 0;
    }
    SDL_hidapi_refcount = 0;
    HIDAPI_ShutdownDiscovery();
    if (udev_ctx != null) {
        result |= PLATFORM_hid_exit();
    }
    SDL_UDEV_ReleaseUdevSyms();
    if (libusb_ctx != null) {
        result |= LIBUSB_hid_exit();
        SDL_QuitLibUSB();
        libusb_ctx = null;
    }
    SDL_RemoveHintCallback_REAL("SDL_HIDAPI_ENUMERATE_ONLY_CONTROLLERS", OnlyControllersChanged, null);
    SDL_RemoveHintCallback_REAL("SDL_HIDAPI_IGNORE_DEVICES", IgnoredDevicesChanged, null);
    if (SDL_hidapi_ignored_devices != null) {
        SDL_free_REAL(@ptrCast(@alignCast(SDL_hidapi_ignored_devices)));
        SDL_hidapi_ignored_devices = null;
    }
    return result;
}
pub export fn SDL_hid_device_change_count_REAL() Uint32 {
    @setEvalBranchQuota(100000);
    var counter: Uint32 = 0;
    _ = &counter;
    if ((SDL_hidapi_refcount == @as(c_int, 0)) and (SDL_hid_init_REAL() < @as(c_int, 0))) {
        return 0;
    }
    HIDAPI_UpdateDiscovery();
    if (SDL_HIDAPI_discovery.m_unDeviceChangeCounter == @as(Uint32, 0)) {
        SDL_HIDAPI_discovery.m_unDeviceChangeCounter +%= 1;
    }
    counter = SDL_HIDAPI_discovery.m_unDeviceChangeCounter;
    return counter;
}
pub fn AddDeviceToEnumeration(arg_driver_name: [*c]const u8, dev: [*c]struct_hid_device_info, devs: [*c][*c]struct_SDL_hid_device_info, last: [*c][*c]struct_SDL_hid_device_info) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var driver_name = arg_driver_name;
    _ = &driver_name;
    var new_dev: [*c]struct_SDL_hid_device_info = undefined;
    _ = &new_dev;
    _ = &driver_name;
    new_dev = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(struct_SDL_hid_device_info))));
    if (@as(?*anyopaque, @ptrCast(@alignCast(new_dev))) == @as(?*anyopaque, null)) {
        return;
    }
    CopyHIDDeviceInfo(dev, new_dev);
    if (@as(?*anyopaque, @ptrCast(@alignCast(last.*))) != @as(?*anyopaque, null)) {
        last.*.*.next = new_dev;
    } else {
        devs.* = new_dev;
    }
    last.* = new_dev;
}
pub fn RemoveDeviceFromEnumeration(arg_driver_name: [*c]const u8, dev: [*c]struct_hid_device_info, devs: [*c][*c]struct_hid_device_info, free_device_info: ?*const fn ([*c]struct_hid_device_info) callconv(.c) void) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var driver_name = arg_driver_name;
    _ = &driver_name;
    var last: [*c]struct_hid_device_info = null;
    _ = &last;
    var curr: [*c]struct_hid_device_info = undefined;
    _ = &curr;
    var next: [*c]struct_hid_device_info = undefined;
    _ = &next;
    {
        curr = devs.*;
        while (curr != null) : (curr = next) {
            next = curr.*.next;
            if (((@as(c_int, dev.*.vendor_id) == @as(c_int, curr.*.vendor_id)) and (@as(c_int, dev.*.product_id) == @as(c_int, curr.*.product_id))) and (((dev.*.interface_number < @as(c_int, 0)) or (curr.*.interface_number < @as(c_int, 0))) or (dev.*.interface_number == curr.*.interface_number))) {
                _ = &driver_name;
                if (last != null) {
                    last.*.next = next;
                } else {
                    devs.* = next;
                }
                curr.*.next = null;
                free_device_info.?(curr);
                continue;
            }
            last = curr;
        }
    }
}
pub export fn SDL_hid_enumerate_REAL(vendor_id: c_ushort, product_id: c_ushort) [*c]struct_SDL_hid_device_info {
    @setEvalBranchQuota(100000);
    var driver_devs: [*c]struct_hid_device_info = null;
    _ = &driver_devs;
    var usb_devs: [*c]struct_hid_device_info = null;
    _ = &usb_devs;
    var raw_devs: [*c]struct_hid_device_info = null;
    _ = &raw_devs;
    var dev: [*c]struct_hid_device_info = undefined;
    _ = &dev;
    var devs: [*c]struct_SDL_hid_device_info = null;
    _ = &devs;
    var last: [*c]struct_SDL_hid_device_info = null;
    _ = &last;
    if ((SDL_hidapi_refcount == @as(c_int, 0)) and (SDL_hid_init_REAL() < @as(c_int, 0))) {
        return null;
    }
    if (libusb_ctx != null) {
        usb_devs = LIBUSB_hid_enumerate(vendor_id, product_id);
    }
    if (udev_ctx != null) {
        raw_devs = PLATFORM_hid_enumerate(vendor_id, product_id);
    }
    {
        dev = driver_devs;
        while (dev != null) : (dev = dev.*.next) {
            AddDeviceToEnumeration("driver", dev, &devs, &last);
            RemoveDeviceFromEnumeration("libusb", dev, &usb_devs, LIBUSB_hid_free_enumeration);
            RemoveDeviceFromEnumeration("raw", dev, &raw_devs, PLATFORM_hid_free_enumeration);
        }
    }
    if (use_libusb_whitelist) {
        {
            dev = usb_devs;
            while (dev != null) : (dev = dev.*.next) {
                AddDeviceToEnumeration("libusb", dev, &devs, &last);
                RemoveDeviceFromEnumeration("raw", dev, &raw_devs, PLATFORM_hid_free_enumeration);
            }
        }
        {
            dev = raw_devs;
            while (dev != null) : (dev = dev.*.next) {
                AddDeviceToEnumeration("platform", dev, &devs, &last);
            }
        }
    } else {
        {
            dev = raw_devs;
            while (dev != null) : (dev = dev.*.next) {
                AddDeviceToEnumeration("raw", dev, &devs, &last);
                RemoveDeviceFromEnumeration("libusb", dev, &usb_devs, LIBUSB_hid_free_enumeration);
            }
        }
        {
            dev = usb_devs;
            while (dev != null) : (dev = dev.*.next) {
                AddDeviceToEnumeration("libusb", dev, &devs, &last);
            }
        }
    }
    LIBUSB_hid_free_enumeration(usb_devs);
    PLATFORM_hid_free_enumeration(raw_devs);
    return devs;
}
pub export fn SDL_hid_free_enumeration_REAL(arg_devs: [*c]struct_SDL_hid_device_info) void {
    @setEvalBranchQuota(100000);
    var devs = arg_devs;
    _ = &devs;
    while (devs != null) {
        var next: [*c]struct_SDL_hid_device_info = devs.*.next;
        _ = &next;
        SDL_free_REAL(@ptrCast(@alignCast(devs.*.path)));
        SDL_free_REAL(@ptrCast(@alignCast(devs.*.serial_number)));
        SDL_free_REAL(@ptrCast(@alignCast(devs.*.manufacturer_string)));
        SDL_free_REAL(@ptrCast(@alignCast(devs.*.product_string)));
        SDL_free_REAL(@ptrCast(@alignCast(devs)));
        devs = next;
    }
}
pub export fn SDL_hid_open_REAL(vendor_id: c_ushort, product_id: c_ushort, serial_number: [*c]const wchar_t) [*c]SDL_hid_device {
    @setEvalBranchQuota(100000);
    var pDevice: ?*anyopaque = null;
    _ = &pDevice;
    if ((SDL_hidapi_refcount == @as(c_int, 0)) and (SDL_hid_init_REAL() < @as(c_int, 0))) {
        return null;
    }
    if (udev_ctx != null) {
        pDevice = @ptrCast(@alignCast(PLATFORM_hid_open(vendor_id, product_id, serial_number)));
        if (pDevice != @as(?*anyopaque, null)) {
            return CreateHIDDeviceWrapper(pDevice, &PLATFORM_Backend);
        }
    }
    if (libusb_ctx != null) {
        pDevice = @ptrCast(@alignCast(LIBUSB_hid_open(vendor_id, product_id, serial_number)));
        if (pDevice != @as(?*anyopaque, null)) {
            var dev: [*c]SDL_hid_device = CreateHIDDeviceWrapper(pDevice, &LIBUSB_Backend);
            _ = &dev;
            _ = SDL_SetPointerProperty_REAL(SDL_hid_get_properties_REAL(dev), "SDL.hidapi.libusb.device.handle", @ptrCast(@alignCast(@as([*c]LIBUSB_hid_device, @ptrCast(@alignCast(pDevice))).*.device_handle)));
            return dev;
        }
    }
    return null;
}
pub export fn SDL_hid_open_path_REAL(path: [*c]const u8) [*c]SDL_hid_device {
    @setEvalBranchQuota(100000);
    var pDevice: ?*anyopaque = null;
    _ = &pDevice;
    if ((SDL_hidapi_refcount == @as(c_int, 0)) and (SDL_hid_init_REAL() < @as(c_int, 0))) {
        return null;
    }
    if (udev_ctx != null) {
        pDevice = @ptrCast(@alignCast(PLATFORM_hid_open_path(path)));
        if (pDevice != @as(?*anyopaque, null)) {
            return CreateHIDDeviceWrapper(pDevice, &PLATFORM_Backend);
        }
    }
    if (libusb_ctx != null) {
        pDevice = @ptrCast(@alignCast(LIBUSB_hid_open_path(path)));
        if (pDevice != @as(?*anyopaque, null)) {
            var dev: [*c]SDL_hid_device = CreateHIDDeviceWrapper(pDevice, &LIBUSB_Backend);
            _ = &dev;
            _ = SDL_SetPointerProperty_REAL(SDL_hid_get_properties_REAL(dev), "SDL.hidapi.libusb.device.handle", @ptrCast(@alignCast(@as([*c]LIBUSB_hid_device, @ptrCast(@alignCast(pDevice))).*.device_handle)));
            return dev;
        }
    }
    return null;
}
pub export fn SDL_hid_get_properties_REAL(device: [*c]SDL_hid_device) SDL_PropertiesID {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(device)), SDL_OBJECT_TYPE_HIDAPI_DEVICE)) {
        _ = SDL_SetError_REAL("Invalid device");
        return 0;
    }
    if (!(device.*.props != 0)) {
        device.*.props = SDL_CreateProperties_REAL();
    }
    return device.*.props;
}
pub export fn SDL_hid_write_REAL(device: [*c]SDL_hid_device, data: [*c]const u8, length: usize) c_int {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(device)), SDL_OBJECT_TYPE_HIDAPI_DEVICE)) {
        _ = SDL_SetError_REAL("Invalid device");
        return -@as(c_int, 1);
    }
    return device.*.backend.*.hid_write.?(@ptrCast(@alignCast(device.*.device)), data, length);
}
pub export fn SDL_hid_read_timeout_REAL(device: [*c]SDL_hid_device, data: [*c]u8, length: usize, milliseconds: c_int) c_int {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(device)), SDL_OBJECT_TYPE_HIDAPI_DEVICE)) {
        _ = SDL_SetError_REAL("Invalid device");
        return -@as(c_int, 1);
    }
    return device.*.backend.*.hid_read_timeout.?(@ptrCast(@alignCast(device.*.device)), data, length, milliseconds);
}
pub export fn SDL_hid_read_REAL(device: [*c]SDL_hid_device, data: [*c]u8, length: usize) c_int {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(device)), SDL_OBJECT_TYPE_HIDAPI_DEVICE)) {
        _ = SDL_SetError_REAL("Invalid device");
        return -@as(c_int, 1);
    }
    return device.*.backend.*.hid_read.?(@ptrCast(@alignCast(device.*.device)), data, length);
}
pub export fn SDL_hid_set_nonblocking_REAL(device: [*c]SDL_hid_device, nonblock: c_int) c_int {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(device)), SDL_OBJECT_TYPE_HIDAPI_DEVICE)) {
        _ = SDL_SetError_REAL("Invalid device");
        return -@as(c_int, 1);
    }
    return device.*.backend.*.hid_set_nonblocking.?(@ptrCast(@alignCast(device.*.device)), nonblock);
}
pub export fn SDL_hid_send_feature_report_REAL(device: [*c]SDL_hid_device, data: [*c]const u8, length: usize) c_int {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(device)), SDL_OBJECT_TYPE_HIDAPI_DEVICE)) {
        _ = SDL_SetError_REAL("Invalid device");
        return -@as(c_int, 1);
    }
    return device.*.backend.*.hid_send_feature_report.?(@ptrCast(@alignCast(device.*.device)), data, length);
}
pub export fn SDL_hid_get_feature_report_REAL(device: [*c]SDL_hid_device, data: [*c]u8, length: usize) c_int {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(device)), SDL_OBJECT_TYPE_HIDAPI_DEVICE)) {
        _ = SDL_SetError_REAL("Invalid device");
        return -@as(c_int, 1);
    }
    return device.*.backend.*.hid_get_feature_report.?(@ptrCast(@alignCast(device.*.device)), data, length);
}
pub export fn SDL_hid_get_input_report_REAL(device: [*c]SDL_hid_device, data: [*c]u8, length: usize) c_int {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(device)), SDL_OBJECT_TYPE_HIDAPI_DEVICE)) {
        _ = SDL_SetError_REAL("Invalid device");
        return -@as(c_int, 1);
    }
    return device.*.backend.*.hid_get_input_report.?(@ptrCast(@alignCast(device.*.device)), data, length);
}
pub export fn SDL_hid_close_REAL(device: [*c]SDL_hid_device) c_int {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(device)), SDL_OBJECT_TYPE_HIDAPI_DEVICE)) {
        _ = SDL_SetError_REAL("Invalid device");
        return -@as(c_int, 1);
    }
    device.*.backend.*.hid_close.?(@ptrCast(@alignCast(device.*.device)));
    SDL_DestroyProperties_REAL(device.*.props);
    DeleteHIDDeviceWrapper(device);
    return 0;
}
pub export fn SDL_hid_get_manufacturer_string_REAL(device: [*c]SDL_hid_device, string: [*c]wchar_t, maxlen: usize) c_int {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(device)), SDL_OBJECT_TYPE_HIDAPI_DEVICE)) {
        _ = SDL_SetError_REAL("Invalid device");
        return -@as(c_int, 1);
    }
    return device.*.backend.*.hid_get_manufacturer_string.?(@ptrCast(@alignCast(device.*.device)), string, maxlen);
}
pub export fn SDL_hid_get_product_string_REAL(device: [*c]SDL_hid_device, string: [*c]wchar_t, maxlen: usize) c_int {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(device)), SDL_OBJECT_TYPE_HIDAPI_DEVICE)) {
        _ = SDL_SetError_REAL("Invalid device");
        return -@as(c_int, 1);
    }
    return device.*.backend.*.hid_get_product_string.?(@ptrCast(@alignCast(device.*.device)), string, maxlen);
}
pub export fn SDL_hid_get_serial_number_string_REAL(device: [*c]SDL_hid_device, string: [*c]wchar_t, maxlen: usize) c_int {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(device)), SDL_OBJECT_TYPE_HIDAPI_DEVICE)) {
        _ = SDL_SetError_REAL("Invalid device");
        return -@as(c_int, 1);
    }
    return device.*.backend.*.hid_get_serial_number_string.?(@ptrCast(@alignCast(device.*.device)), string, maxlen);
}
pub export fn SDL_hid_get_indexed_string_REAL(device: [*c]SDL_hid_device, string_index: c_int, string: [*c]wchar_t, maxlen: usize) c_int {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(device)), SDL_OBJECT_TYPE_HIDAPI_DEVICE)) {
        _ = SDL_SetError_REAL("Invalid device");
        return -@as(c_int, 1);
    }
    return device.*.backend.*.hid_get_indexed_string.?(@ptrCast(@alignCast(device.*.device)), string_index, string, maxlen);
}
pub export fn SDL_hid_get_device_info_REAL(device: [*c]SDL_hid_device) [*c]SDL_hid_device_info {
    @setEvalBranchQuota(100000);
    var info: [*c]struct_hid_device_info = undefined;
    _ = &info;
    if (!SDL_ObjectValid(@ptrCast(@alignCast(device)), SDL_OBJECT_TYPE_HIDAPI_DEVICE)) {
        _ = SDL_SetError_REAL("Invalid device");
        return null;
    }
    info = device.*.backend.*.hid_get_device_info.?(@ptrCast(@alignCast(device.*.device)));
    if (info != null) {
        CopyHIDDeviceInfo(info, &device.*.info);
        return &device.*.info;
    } else {
        return null;
    }
}
pub export fn SDL_hid_get_report_descriptor_REAL(device: [*c]SDL_hid_device, buf: [*c]u8, buf_size: usize) c_int {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(device)), SDL_OBJECT_TYPE_HIDAPI_DEVICE)) {
        _ = SDL_SetError_REAL("Invalid device");
        return -@as(c_int, 1);
    }
    return device.*.backend.*.hid_get_report_descriptor.?(@ptrCast(@alignCast(device.*.device)), buf, buf_size);
}
pub export fn SDL_hid_ble_scan_REAL(_: bool) void {
    @setEvalBranchQuota(100000);
}

pub const SDL_hid_ble_scan = SDL_hid_ble_scan_REAL;
pub const SDL_hid_close = SDL_hid_close_REAL;
pub const SDL_hid_device_change_count = SDL_hid_device_change_count_REAL;
pub const SDL_hid_enumerate = SDL_hid_enumerate_REAL;
pub const SDL_hid_exit = SDL_hid_exit_REAL;
pub const SDL_hid_free_enumeration = SDL_hid_free_enumeration_REAL;
pub const SDL_hid_get_device_info = SDL_hid_get_device_info_REAL;
pub const SDL_hid_get_feature_report = SDL_hid_get_feature_report_REAL;
pub const SDL_hid_get_indexed_string = SDL_hid_get_indexed_string_REAL;
pub const SDL_hid_get_input_report = SDL_hid_get_input_report_REAL;
pub const SDL_hid_get_manufacturer_string = SDL_hid_get_manufacturer_string_REAL;
pub const SDL_hid_get_product_string = SDL_hid_get_product_string_REAL;
pub const SDL_hid_get_report_descriptor = SDL_hid_get_report_descriptor_REAL;
pub const SDL_hid_get_serial_number_string = SDL_hid_get_serial_number_string_REAL;
pub const SDL_hid_init = SDL_hid_init_REAL;
pub const SDL_hid_open = SDL_hid_open_REAL;
pub const SDL_hid_open_path = SDL_hid_open_path_REAL;
pub const SDL_hid_read = SDL_hid_read_REAL;
pub const SDL_hid_read_timeout = SDL_hid_read_timeout_REAL;
pub const SDL_hid_send_feature_report = SDL_hid_send_feature_report_REAL;
pub const SDL_hid_set_nonblocking = SDL_hid_set_nonblocking_REAL;
pub const SDL_hid_write = SDL_hid_write_REAL;
pub const SDL_hid_get_properties = SDL_hid_get_properties_REAL;
pub const va_start = @compileError("unable to translate macro: undefined identifier `__builtin_va_start`");
// /home/addo/dev/stupid/zdl/.cache/zig-lib/compiler/aro/include/stdarg.h:12:9
pub inline fn va_end(ap: anytype) @TypeOf(__builtin.va_end(ap)) {
    @setEvalBranchQuota(100000);
    _ = &ap;
    return __builtin.va_end(ap);
}
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_NS_PER_MS = __helpers.promoteIntLiteral(c_int, 1000000, .decimal);
pub const USB_VENDOR_FLYDIGI_V1 = @as(c_int, 0x04b4);
pub const USB_VENDOR_FLYDIGI_V2 = @as(c_int, 0x37d7);
pub const USB_VENDOR_MICROSOFT = @as(c_int, 0x045e);
pub const USB_VENDOR_NINTENDO = @as(c_int, 0x057e);
pub const USB_VENDOR_VALVE = @as(c_int, 0x28de);
pub const USB_PRODUCT_FLYDIGI_V1_GAMEPAD = @as(c_int, 0x2412);
pub const USB_PRODUCT_FLYDIGI_V2_APEX = @as(c_int, 0x2501);
pub const USB_PRODUCT_FLYDIGI_V2_APEX6 = @as(c_int, 0x2502);
pub const USB_PRODUCT_FLYDIGI_V2_VADER = @as(c_int, 0x2401);
pub const USB_PRODUCT_NINTENDO_GAMECUBE_ADAPTER = @as(c_int, 0x0337);
pub const USB_PRODUCT_NINTENDO_SWITCH2_GAMECUBE_CONTROLLER = @as(c_int, 0x2073);
pub const USB_PRODUCT_NINTENDO_SWITCH2_JOYCON_LEFT = @as(c_int, 0x2067);
pub const USB_PRODUCT_NINTENDO_SWITCH2_JOYCON_RIGHT = @as(c_int, 0x2066);
pub const USB_PRODUCT_NINTENDO_SWITCH2_PRO = @as(c_int, 0x2069);
pub const USB_PRODUCT_XBOX360_BIGBUTTON_RECEIVER = @as(c_int, 0x02a0);
pub const USB_USAGEPAGE_GENERIC_DESKTOP = @as(c_int, 0x0001);
pub const USB_USAGEPAGE_VENDOR_FLYDIGI = __helpers.promoteIntLiteral(c_int, 0xFFA0, .hex);
pub const USB_USAGE_GENERIC_MOUSE = @as(c_int, 0x0002);
pub const USB_USAGE_GENERIC_JOYSTICK = @as(c_int, 0x0004);
pub const USB_USAGE_GENERIC_GAMEPAD = @as(c_int, 0x0005);
pub const USB_USAGE_GENERIC_KEYBOARD = @as(c_int, 0x0006);
pub const USB_USAGE_GENERIC_MULTIAXISCONTROLLER = @as(c_int, 0x0008);
pub const HID_API_VERSION_MAJOR = @as(c_int, 0);
pub const HID_API_VERSION_MINOR = @as(c_int, 14);
pub const HID_API_VERSION_PATCH = @as(c_int, 0);
pub const HID_API_MAX_REPORT_DESCRIPTOR_SIZE = @as(c_int, 4096);
pub inline fn major(dev: anytype) @TypeOf(gnu_dev_major(dev)) {
    @setEvalBranchQuota(100000);
    _ = &dev;
    return gnu_dev_major(dev);
}
pub inline fn minor(dev: anytype) @TypeOf(gnu_dev_minor(dev)) {
    @setEvalBranchQuota(100000);
    _ = &dev;
    return gnu_dev_minor(dev);
}
pub const _IOC_NRBITS = @as(c_int, 8);
pub const _IOC_TYPEBITS = @as(c_int, 8);
pub const _IOC_SIZEBITS = @as(c_int, 14);
pub const _IOC_NRSHIFT = @as(c_int, 0);
pub const _IOC_WRITE = @as(c_uint, 1);
pub const _IOC_READ = @as(c_uint, 2);
pub const BUS_USB = @as(c_int, 0x03);
pub const BUS_BLUETOOTH = @as(c_int, 0x05);
pub const BUS_I2C = @as(c_int, 0x18);
pub const BUS_SPI = @as(c_int, 0x1C);
pub const POLLIN = @as(c_int, 0x001);
pub const POLLERR = @as(c_int, 0x008);
pub const POLLHUP = @as(c_int, 0x010);
pub const POLLNVAL = @as(c_int, 0x020);
pub const EAGAIN = @as(c_int, 11);
pub const EACCES = @as(c_int, 13);
pub const EINVAL = @as(c_int, 22);
pub const EPIPE = @as(c_int, 32);
pub const EINPROGRESS = @as(c_int, 115);
pub const O_RDONLY = @as(c_int, 0o0);
pub const O_RDWR = @as(c_int, 0o2);
pub const __O_CLOEXEC = __helpers.promoteIntLiteral(c_int, 0o2000000, .octal);
pub const IN_ATTRIB = @as(c_int, 0x00000004);
pub const IN_MOVED_FROM = @as(c_int, 0x00000040);
pub const IN_MOVED_TO = @as(c_int, 0x00000080);
pub const IN_CREATE = @as(c_int, 0x00000100);
pub const IN_DELETE = @as(c_int, 0x00000200);
pub const __LC_CTYPE = @as(c_int, 0);
pub const HID_MAX_DESCRIPTOR_SIZE = @as(c_int, 4096);
pub const LIBUSB_ENDPOINT_DIR_MASK = @as(c_int, 0x80);
pub const LIBUSB_TRANSFER_TYPE_MASK = @as(c_int, 0x03);
pub const HIDAPI_THREAD_TIMED_OUT = @as(c_int, 1);
pub const udev = struct_udev;
pub const udev_device = struct_udev_device;
pub const udev_monitor = struct_udev_monitor;
pub const udev_enumerate = struct_udev_enumerate;
