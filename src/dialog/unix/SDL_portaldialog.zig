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
pub const Uint32 = u32;
pub const Sint64 = i64;
pub const Uint64 = u64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_realloc_REAL(mem: ?*anyopaque, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_toupper_REAL(x: c_int) c_int;
pub extern fn SDL_tolower_REAL(x: c_int) c_int;
pub extern fn SDL_strlen_REAL(str: [*c]const u8) usize;
pub extern fn SDL_strlcat_REAL(dst: [*c]u8, src: [*c]const u8, maxlen: usize) usize;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_strstr_REAL(haystack: [*c]const u8, needle: [*c]const u8) [*c]u8;
pub extern fn SDL_strtok_r_REAL(str: [*c]u8, delim: [*c]const u8, saveptr: [*c][*c]u8) [*c]u8;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_snprintf_REAL(text: [*c]u8, maxlen: usize, fmt: [*c]const u8, ...) c_int;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_PropertiesID = Uint32;
pub extern fn SDL_GetPointerProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: ?*anyopaque) ?*anyopaque;
pub extern fn SDL_GetStringProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: [*c]const u8) [*c]const u8;
pub extern fn SDL_GetNumberProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: Sint64) Sint64;
pub extern fn SDL_GetBooleanProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: bool) bool;
pub const struct_SDL_Window = opaque {
};
pub const SDL_Window = struct_SDL_Window;
pub extern fn SDL_GetWindowProperties_REAL(window: ?*SDL_Window) SDL_PropertiesID;
pub const struct_SDL_DialogFileFilter = extern struct {
    name: [*c]const u8 = null,
    pattern: [*c]const u8 = null,
};
pub const SDL_DialogFileFilter = struct_SDL_DialogFileFilter;
pub const SDL_DialogFileCallback = ?*const fn (userdata: ?*anyopaque, filelist: [*c]const [*c]const u8, filter: c_int) callconv(.c) void;
pub const SDL_FILEDIALOG_OPENFILE: c_int = 0;
pub const SDL_FILEDIALOG_SAVEFILE: c_int = 1;
pub const SDL_FILEDIALOG_OPENFOLDER: c_int = 2;
pub const enum_SDL_FileDialogType = c_uint;
pub const SDL_FileDialogType = enum_SDL_FileDialogType;
pub extern fn SDL_URIToLocal(src: [*c]const u8, dst: [*c]u8) c_int;
pub export fn SDL_Portal_ShowFileDialogWithProperties(arg_type: SDL_FileDialogType, callback: SDL_DialogFileCallback, userdata: ?*anyopaque, props: SDL_PropertiesID) void {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var method: [*c]const u8 = undefined;
    _ = &method;
    var method_title: [*c]const u8 = undefined;
    _ = &method_title;
    var window: ?*SDL_Window = undefined;
    _ = &window;
    var filters: [*c]SDL_DialogFileFilter = undefined;
    _ = &filters;
    var nfilters: c_int = undefined;
    _ = &nfilters;
    var allow_many: bool = undefined;
    _ = &allow_many;
    var default_location: [*c]const u8 = undefined;
    _ = &default_location;
    var accept: [*c]const u8 = undefined;
    _ = &accept;
    var location_name: [*c]u8 = undefined;
    _ = &location_name;
    var location_folder: [*c]u8 = undefined;
    _ = &location_folder;
    var statbuf: struct_stat = undefined;
    _ = &statbuf;
    var open_folders: bool = undefined;
    _ = &open_folders;
    var save_file_existing: bool = undefined;
    _ = &save_file_existing;
    var save_file_new_named: bool = undefined;
    _ = &save_file_new_named;
    var dirc: [*c]u8 = undefined;
    _ = &dirc;
    var basec: [*c]u8 = undefined;
    _ = &basec;
    var dbus: [*c]SDL_DBusContext = undefined;
    _ = &dbus;
    var @"error": DBusError = undefined;
    _ = &@"error";
    var msg: ?*DBusMessage = undefined;
    _ = &msg;
    var params: DBusMessageIter = undefined;
    _ = &params;
    var options: DBusMessageIter = undefined;
    _ = &options;
    var signal_id: [*c]const u8 = undefined;
    _ = &signal_id;
    var handle_str: [*c]u8 = undefined;
    _ = &handle_str;
    var filter: [*c]u8 = undefined;
    _ = &filter;
    var filter_len: c_int = undefined;
    _ = &filter_len;
    const static_local_handle_id = struct {
        var handle_id: u32 = 0;
    };
    _ = &static_local_handle_id;
    const static_local_default_parent_window = struct {
        var default_parent_window: [*c]u8 = @as([*c]u8, @as([*c]u8, @constCast("")));
    };
    _ = &static_local_default_parent_window;
    var window_props: SDL_PropertiesID = undefined;
    _ = &window_props;
    var err_msg: [*c]const u8 = undefined;
    _ = &err_msg;
    var parent_handle: [*c]const u8 = undefined;
    _ = &parent_handle;
    var len: usize = undefined;
    _ = &len;
    var xid: Uint64 = undefined;
    _ = &xid;
    var len_1: usize = undefined;
    _ = &len_1;
    var reply: ?*DBusMessage = undefined;
    _ = &reply;
    var reply_iter: DBusMessageIter = undefined;
    _ = &reply_iter;
    var data: [*c]SignalCallback = undefined;
    _ = &data;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                window = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(props, "SDL.filedialog.window", null)));
                filters = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(props, "SDL.filedialog.filters", null)));
                nfilters = @truncate(SDL_GetNumberProperty_REAL(props, "SDL.filedialog.nfilters", 0));
                allow_many = SDL_GetBooleanProperty_REAL(props, "SDL.filedialog.many", @"false" != 0);
                default_location = SDL_GetStringProperty_REAL(props, "SDL.filedialog.location", null);
                accept = SDL_GetStringProperty_REAL(props, "SDL.filedialog.accept", null);
                location_name = null;
                location_folder = null;
                open_folders = @"false" != 0;
                save_file_existing = @"false" != 0;
                save_file_new_named = @"false" != 0;
                switch (@"type") {
                    @as(SDL_FileDialogType, SDL_FILEDIALOG_OPENFILE) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(SDL_FileDialogType, SDL_FILEDIALOG_SAVEFILE) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_FileDialogType, SDL_FILEDIALOG_OPENFOLDER) => {
                        sdl_pc = 27;
                        continue;
                    },
                    else => {
                        sdl_pc = 28;
                        continue;
                    },
                }
            },
            1 => {
                dbus.*.message_unref.?(reply);
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            2 => {
                SDL_free_REAL(@ptrCast(@alignCast(location_name)));
                SDL_free_REAL(@ptrCast(@alignCast(location_folder)));
                {}
            },
            3 => {
                dbus = SDL_DBus_GetContext();
                signal_id = null;
                window_props = SDL_GetWindowProperties_REAL(window);
                err_msg = validate_filters(filters, nfilters);
                dbus.*.error_init.?(&@"error");
                if (err_msg != null) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            4 => {
                method = "OpenFile";
                method_title = SDL_GetStringProperty_REAL(props, "SDL.filedialog.title", "Open File");
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            5 => {
                method = "SaveFile";
                method_title = SDL_GetStringProperty_REAL(props, "SDL.filedialog.title", "Save File");
                if (default_location != null) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 7;
                    continue;
                }
            },
            6 => {
                if (stat(default_location, &statbuf) == @as(c_int, 0)) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 10;
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
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            9 => {
                save_file_existing = (statbuf.st_mode & @as(__mode_t, __S_IFMT)) == @as(__mode_t, @bitCast(@as(c_int, __S_IFREG)));
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                if (__errno_location().* == ENOENT) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            11 => {
                if (save_file_existing or save_file_new_named) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            12 => {
                dirc = SDL_strdup_REAL(default_location);
                if (dirc != null) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
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
                    sdl_pc = 11;
                    continue;
                }
            },
            15 => {
                location_folder = SDL_strdup_REAL(dirname(dirc));
                SDL_free_REAL(@ptrCast(@alignCast(dirc)));
                if (location_folder != null) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
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
                    sdl_pc = 14;
                    continue;
                }
            },
            18 => {
                save_file_new_named = (stat(location_folder, &statbuf) == @as(c_int, 0)) and ((statbuf.st_mode & @as(__mode_t, __S_IFMT)) == @as(__mode_t, @bitCast(@as(c_int, __S_IFDIR))));
                {
                    sdl_pc = 20;
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
                basec = SDL_strdup_REAL(default_location);
                if (basec != null) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
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
                    sdl_pc = 8;
                    continue;
                }
            },
            24 => {
                location_name = SDL_strdup_REAL(__xpg_basename(basec));
                SDL_free_REAL(@ptrCast(@alignCast(basec)));
                {
                    sdl_pc = 26;
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
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            27 => {
                method = "OpenFile";
                method_title = SDL_GetStringProperty_REAL(props, "SDL.filedialog.title", "Open Folder");
                open_folders = @"true" != 0;
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            28 => {
                _ = SDL_SetError_REAL("Invalid file dialog type: %d", @"type");
                callback.?(userdata, null, -@as(c_int, 1));
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            29 => {
                _ = SDL_SetError_REAL("%s", err_msg);
                callback.?(userdata, null, -@as(c_int, 1));
                {
                    sdl_pc = 2;
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
                if (@as(?*anyopaque, @ptrCast(@alignCast(dbus))) == @as(?*anyopaque, null)) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            32 => {
                _ = SDL_SetError_REAL("Failed to connect to DBus");
                callback.?(userdata, null, -@as(c_int, 1));
                {
                    sdl_pc = 2;
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
                msg = dbus.*.message_new_method_call.?("org.freedesktop.portal.Desktop", "/org/freedesktop/portal/desktop", "org.freedesktop.portal.FileChooser", method);
                if (@as(?*anyopaque, @ptrCast(@alignCast(msg))) == @as(?*anyopaque, null)) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            35 => {
                _ = SDL_SetError_REAL("Failed to send message to portal");
                callback.?(userdata, null, -@as(c_int, 1));
                {
                    sdl_pc = 2;
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
                dbus.*.message_iter_init_append.?(msg, &params);
                handle_str = static_local_default_parent_window.default_parent_window;
                if (window_props != 0) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
                    continue;
                }
            },
            38 => {
                parent_handle = SDL_GetStringProperty_REAL(window_props, "SDL.window.wayland.xdg_toplevel_export_handle", null);
                if (parent_handle != null) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
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
                _ = dbus.*.message_iter_append_basic.?(&params, @as(c_int, 's'), @ptrCast(@alignCast(&handle_str)));
                if (handle_str != static_local_default_parent_window.default_parent_window) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 54;
                    continue;
                }
            },
            41 => {
                len = SDL_strlen_REAL(parent_handle);
                len +%= @sizeOf(@TypeOf("wayland:".*)) +% @as(c_ulong, 1);
                handle_str = @ptrCast(@alignCast(SDL_malloc_REAL(len *% @sizeOf(u8))));
                if (!(handle_str != null)) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            42 => {
                xid = @bitCast(@as(c_long, SDL_GetNumberProperty_REAL(window_props, "SDL.window.x11.window", 0)));
                if (xid != 0) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            43 => {
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            44 => {
                callback.?(userdata, null, -@as(c_int, 1));
                {
                    sdl_pc = 2;
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
                _ = SDL_snprintf_REAL(handle_str, len, "%s%s", @as([*c]u8, @as([*c]u8, @constCast("wayland:"))), parent_handle);
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            47 => {
                len_1 = @sizeOf(@TypeOf("x11:".*)) +% @as(c_ulong, 24);
                handle_str = @ptrCast(@alignCast(SDL_malloc_REAL(len_1 *% @sizeOf(u8))));
                if (!(handle_str != null)) {
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
                    sdl_pc = 43;
                    continue;
                }
            },
            50 => {
                callback.?(userdata, null, -@as(c_int, 1));
                {
                    sdl_pc = 2;
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
                _ = SDL_snprintf_REAL(handle_str, len_1, "%s%lx", @as([*c]u8, @as([*c]u8, @constCast("x11:"))), xid);
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            53 => {
                SDL_free_REAL(@ptrCast(@alignCast(handle_str)));
                {
                    sdl_pc = 55;
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
                _ = dbus.*.message_iter_append_basic.?(&params, @as(c_int, 's'), @ptrCast(@alignCast(&method_title)));
                _ = dbus.*.message_iter_open_container.?(&params, @as(c_int, 'a'), "{sv}", &options);
                handle_str = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(u8) *% @as(c_ulong, @bitCast(@as(c_long, HANDLE_LEN + @as(c_int, 1)))))));
                if (!(handle_str != null)) {
                    sdl_pc = 56;
                    continue;
                } else {
                    sdl_pc = 57;
                    continue;
                }
            },
            56 => {
                callback.?(userdata, null, -@as(c_int, 1));
                {
                    sdl_pc = 2;
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
                _ = SDL_snprintf_REAL(handle_str, HANDLE_LEN, "%u", blk: {
                    const ref = &static_local_handle_id.handle_id;
                    ref.* +%= 1;
                    break :blk ref.*;
                });
                DBus_AppendStringOption(dbus, &options, "handle_token", handle_str);
                SDL_free_REAL(@ptrCast(@alignCast(handle_str)));
                DBus_AppendBoolOption(dbus, &options, "modal", @intFromBool(!!(window != null)));
                if (allow_many) {
                    sdl_pc = 59;
                    continue;
                } else {
                    sdl_pc = 60;
                    continue;
                }
            },
            59 => {
                DBus_AppendBoolOption(dbus, &options, "multiple", 1);
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
                if (open_folders) {
                    sdl_pc = 62;
                    continue;
                } else {
                    sdl_pc = 63;
                    continue;
                }
            },
            62 => {
                DBus_AppendBoolOption(dbus, &options, "directory", 1);
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
                if (filters != null) {
                    sdl_pc = 65;
                    continue;
                } else {
                    sdl_pc = 66;
                    continue;
                }
            },
            65 => {
                DBus_AppendFilters(dbus, &options, filters, nfilters);
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
                if (default_location != null) {
                    sdl_pc = 68;
                    continue;
                } else {
                    sdl_pc = 69;
                    continue;
                }
            },
            68 => {
                if (save_file_existing and (location_name != null)) {
                    sdl_pc = 71;
                    continue;
                } else {
                    sdl_pc = 72;
                    continue;
                }
            },
            69 => {
                {
                    sdl_pc = 70;
                    continue;
                }
            },
            70 => {
                if (accept != null) {
                    sdl_pc = 77;
                    continue;
                } else {
                    sdl_pc = 78;
                    continue;
                }
            },
            71 => {
                DBus_AppendByteArray(dbus, &options, "current_file", default_location);
                DBus_AppendStringOption(dbus, &options, "current_name", location_name);
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            72 => {
                if ((save_file_new_named and (location_folder != null)) and (location_name != null)) {
                    sdl_pc = 74;
                    continue;
                } else {
                    sdl_pc = 75;
                    continue;
                }
            },
            73 => {
                {
                    sdl_pc = 70;
                    continue;
                }
            },
            74 => {
                DBus_AppendByteArray(dbus, &options, "current_folder", location_folder);
                DBus_AppendStringOption(dbus, &options, "current_name", location_name);
                {
                    sdl_pc = 76;
                    continue;
                }
            },
            75 => {
                DBus_AppendByteArray(dbus, &options, "current_folder", default_location);
                {
                    sdl_pc = 76;
                    continue;
                }
            },
            76 => {
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            77 => {
                DBus_AppendStringOption(dbus, &options, "accept_label", accept);
                {
                    sdl_pc = 79;
                    continue;
                }
            },
            78 => {
                {
                    sdl_pc = 79;
                    continue;
                }
            },
            79 => {
                _ = dbus.*.message_iter_close_container.?(&params, &options);
                reply = dbus.*.connection_send_with_reply_and_block.?(dbus.*.session_conn, msg, @as(c_int, 2147483647), &@"error");
                if (dbus.*.error_is_set.?(&@"error") != 0) {
                    sdl_pc = 80;
                    continue;
                } else {
                    sdl_pc = 81;
                    continue;
                }
            },
            80 => {
                _ = SDL_SetError_REAL("Failed to open dialog via DBus, %s: %s", @"error".name, @"error".message);
                dbus.*.error_free.?(&@"error");
                callback.?(userdata, null, -@as(c_int, 1));
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            81 => {
                {
                    sdl_pc = 82;
                    continue;
                }
            },
            82 => {
                if (reply != null) {
                    sdl_pc = 83;
                    continue;
                } else {
                    sdl_pc = 84;
                    continue;
                }
            },
            83 => {
                _ = dbus.*.message_iter_init.?(reply, &reply_iter);
                if (dbus.*.message_iter_get_arg_type.?(&reply_iter) == @as(c_int, 'o')) {
                    sdl_pc = 86;
                    continue;
                } else {
                    sdl_pc = 87;
                    continue;
                }
            },
            84 => {
                {
                    sdl_pc = 85;
                    continue;
                }
            },
            85 => {
                if (!(signal_id != null)) {
                    sdl_pc = 89;
                    continue;
                } else {
                    sdl_pc = 90;
                    continue;
                }
            },
            86 => {
                dbus.*.message_iter_get_basic.?(&reply_iter, @ptrCast(@alignCast(&signal_id)));
                {
                    sdl_pc = 88;
                    continue;
                }
            },
            87 => {
                {
                    sdl_pc = 88;
                    continue;
                }
            },
            88 => {
                {
                    sdl_pc = 85;
                    continue;
                }
            },
            89 => {
                _ = SDL_SetError_REAL("Invalid response received by DBus");
                callback.?(userdata, null, -@as(c_int, 1));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            90 => {
                {
                    sdl_pc = 91;
                    continue;
                }
            },
            91 => {
                dbus.*.message_unref.?(msg);
                filter_len = @bitCast(@as(c_uint, @truncate((SDL_strlen_REAL("type='signal', sender='org.freedesktop.portal.Desktop', interface='org.freedesktop.portal.Request', member='Response', path='") +% SDL_strlen_REAL(signal_id)) +% @as(usize, 2))));
                filter = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(u8) *% @as(c_ulong, @bitCast(@as(c_long, filter_len))))));
                if (!(filter != null)) {
                    sdl_pc = 92;
                    continue;
                } else {
                    sdl_pc = 93;
                    continue;
                }
            },
            92 => {
                callback.?(userdata, null, -@as(c_int, 1));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            93 => {
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            94 => {
                _ = SDL_snprintf_REAL(filter, @bitCast(@as(c_long, filter_len)), "type='signal', sender='org.freedesktop.portal.Desktop', interface='org.freedesktop.portal.Request', member='Response', path='%s'", signal_id);
                dbus.*.bus_add_match.?(dbus.*.session_conn, filter, &@"error");
                SDL_free_REAL(@ptrCast(@alignCast(filter)));
                if (dbus.*.error_is_set.?(&@"error") != 0) {
                    sdl_pc = 95;
                    continue;
                } else {
                    sdl_pc = 96;
                    continue;
                }
            },
            95 => {
                _ = SDL_SetError_REAL("Failed to set up DBus listener for dialog, %s: %s", @"error".name, @"error".message);
                dbus.*.error_free.?(&@"error");
                callback.?(userdata, null, -@as(c_int, 1));
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            96 => {
                {
                    sdl_pc = 97;
                    continue;
                }
            },
            97 => {
                data = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(SignalCallback))));
                if (!(data != null)) {
                    sdl_pc = 98;
                    continue;
                } else {
                    sdl_pc = 99;
                    continue;
                }
            },
            98 => {
                callback.?(userdata, null, -@as(c_int, 1));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            99 => {
                {
                    sdl_pc = 100;
                    continue;
                }
            },
            100 => {
                data.*.callback = callback;
                data.*.userdata = userdata;
                data.*.path = SDL_strdup_REAL(signal_id);
                if (!(data.*.path != null)) {
                    sdl_pc = 101;
                    continue;
                } else {
                    sdl_pc = 102;
                    continue;
                }
            },
            101 => {
                SDL_free_REAL(@ptrCast(@alignCast(data)));
                callback.?(userdata, null, -@as(c_int, 1));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            102 => {
                {
                    sdl_pc = 103;
                    continue;
                }
            },
            103 => {
                _ = dbus.*.connection_add_filter.?(dbus.*.session_conn, &DBus_MessageFilter, @ptrCast(@alignCast(data)), null);
                dbus.*.connection_flush.?(dbus.*.session_conn);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_Portal_detect() bool {
    @setEvalBranchQuota(100000);
    var dbus: [*c]SDL_DBusContext = undefined;
    _ = &dbus;
    var msg: ?*DBusMessage = undefined;
    _ = &msg;
    var reply: ?*DBusMessage = undefined;
    _ = &reply;
    var reply_str: [*c]u8 = undefined;
    _ = &reply_str;
    var reply_iter: DBusMessageIter = undefined;
    _ = &reply_iter;
    const static_local_portal_present = struct {
        var portal_present: c_int = -@as(c_int, 1);
    };
    _ = &static_local_portal_present;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                dbus = SDL_DBus_GetContext();
                msg = null;
                reply = null;
                reply_str = null;
                if (static_local_portal_present.portal_present != -@as(c_int, 1)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                if (reply != null) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            2 => {
                return static_local_portal_present.portal_present > @as(c_int, 0);
            },
            3 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                static_local_portal_present.portal_present = 0;
                if (!(dbus != null)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("Failed to connect to DBus!"))));
                return @"false" != 0;
            },
            6 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                msg = dbus.*.message_new_method_call.?("org.freedesktop.portal.Desktop", "/org/freedesktop/portal/desktop", "org.freedesktop.DBus.Introspectable", "Introspect");
                if (!(msg != null)) {
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
                reply = dbus.*.connection_send_with_reply_and_block.?(dbus.*.session_conn, msg, -@as(c_int, 1), null);
                dbus.*.message_unref.?(msg);
                if (!(reply != null)) {
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
                if (!(dbus.*.message_iter_init.?(reply, &reply_iter) != 0)) {
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
                if (dbus.*.message_iter_get_arg_type.?(&reply_iter) != @as(c_int, 's')) {
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
                dbus.*.message_iter_get_basic.?(&reply_iter, @ptrCast(@alignCast(&reply_str)));
                if (SDL_strstr_REAL(reply_str, "org.freedesktop.portal.FileChooser") != null) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                static_local_portal_present.portal_present = 1;
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
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            23 => {
                dbus.*.message_unref.?(reply);
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
                return static_local_portal_present.portal_present > @as(c_int, 0);
            },
            else => unreachable,
        }
    }
}

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub extern fn validate_filters(filters: [*c]const SDL_DialogFileFilter, nfilters: c_int) [*c]const u8;
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
pub extern fn __errno_location() [*c]c_int;
pub extern fn dirname(__path: [*c]u8) [*c]u8;
pub extern fn __xpg_basename(__path: [*c]u8) [*c]u8;
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
pub extern fn truncate(__file: [*c]const u8, __length: __off_t) c_int;
pub const SignalCallback = extern struct {
    callback: SDL_DialogFileCallback = null,
    userdata: ?*anyopaque = null,
    path: [*c]const u8 = null,
};
pub fn DBus_AppendStringOption(dbus: [*c]SDL_DBusContext, options: [*c]DBusMessageIter, arg_key: [*c]const u8, arg_value: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var key = arg_key;
    _ = &key;
    var value = arg_value;
    _ = &value;
    var options_pair: DBusMessageIter = undefined;
    _ = &options_pair;
    var options_value: DBusMessageIter = undefined;
    _ = &options_value;
    _ = dbus.*.message_iter_open_container.?(options, @as(c_int, 'e'), null, &options_pair);
    _ = dbus.*.message_iter_append_basic.?(&options_pair, @as(c_int, 's'), @ptrCast(@alignCast(&key)));
    _ = dbus.*.message_iter_open_container.?(&options_pair, @as(c_int, 'v'), "s", &options_value);
    _ = dbus.*.message_iter_append_basic.?(&options_value, @as(c_int, 's'), @ptrCast(@alignCast(&value)));
    _ = dbus.*.message_iter_close_container.?(&options_pair, &options_value);
    _ = dbus.*.message_iter_close_container.?(options, &options_pair);
}
pub fn DBus_AppendBoolOption(dbus: [*c]SDL_DBusContext, options: [*c]DBusMessageIter, arg_key: [*c]const u8, arg_value: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var key = arg_key;
    _ = &key;
    var value = arg_value;
    _ = &value;
    var options_pair: DBusMessageIter = undefined;
    _ = &options_pair;
    var options_value: DBusMessageIter = undefined;
    _ = &options_value;
    _ = dbus.*.message_iter_open_container.?(options, @as(c_int, 'e'), null, &options_pair);
    _ = dbus.*.message_iter_append_basic.?(&options_pair, @as(c_int, 's'), @ptrCast(@alignCast(&key)));
    _ = dbus.*.message_iter_open_container.?(&options_pair, @as(c_int, 'v'), "b", &options_value);
    _ = dbus.*.message_iter_append_basic.?(&options_value, @as(c_int, 'b'), @ptrCast(@alignCast(&value)));
    _ = dbus.*.message_iter_close_container.?(&options_pair, &options_value);
    _ = dbus.*.message_iter_close_container.?(options, &options_pair);
}
pub fn DBus_AppendFilter(dbus: [*c]SDL_DBusContext, parent: [*c]DBusMessageIter, filter: SDL_DialogFileFilter) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = &filter;
    var filter_entry: DBusMessageIter = undefined;
    _ = &filter_entry;
    var filter_array: DBusMessageIter = undefined;
    _ = &filter_array;
    var filter_array_entry: DBusMessageIter = undefined;
    _ = &filter_array_entry;
    var state: [*c]u8 = undefined;
    _ = &state;
    var patterns: [*c]u8 = undefined;
    _ = &patterns;
    var pattern: [*c]u8 = undefined;
    _ = &pattern;
    var glob_pattern: [*c]u8 = undefined;
    _ = &glob_pattern;
    var zero: c_int = undefined;
    _ = &zero;
    var len: usize = undefined;
    _ = &len;
    var i: usize = undefined;
    _ = &i;
    var p: usize = undefined;
    _ = &p;
    var max_len: usize = undefined;
    _ = &max_len;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                state = null;
                zero = 0;
                _ = dbus.*.message_iter_open_container.?(parent, @as(c_int, 'r'), null, &filter_entry);
                _ = dbus.*.message_iter_append_basic.?(&filter_entry, @as(c_int, 's'), @ptrCast(@alignCast(&filter.name)));
                _ = dbus.*.message_iter_open_container.?(&filter_entry, @as(c_int, 'a'), "(us)", &filter_array);
                len = SDL_strlen_REAL(filter.pattern) +% @as(usize, 1);
                patterns = @ptrCast(@alignCast(SDL_malloc_REAL(len *% @as(usize, 4))));
                if (!(patterns != null)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                SDL_free_REAL(@ptrCast(@alignCast(patterns)));
                _ = dbus.*.message_iter_close_container.?(&filter_entry, &filter_array);
                _ = dbus.*.message_iter_close_container.?(parent, &filter_entry);
                {}
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
                p = 0;
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            5 => {
                if (i < len) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            6 => {
                if (((@as(c_int, filter.pattern[i]) >= @as(c_int, 'a')) and (@as(c_int, filter.pattern[i]) <= @as(c_int, 'z'))) or ((@as(c_int, filter.pattern[i]) >= @as(c_int, 'A')) and (@as(c_int, filter.pattern[i]) <= @as(c_int, 'Z')))) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
            },
            7 => {
                i +%= 1;
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            8 => {
                pattern = SDL_strtok_r_REAL(patterns, ";", &state);
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            9 => {
                patterns[
                    blk: {
                        const ref = &p;
                        const tmp = ref.*;
                        ref.* +%= 1;
                        break :blk tmp;
                    }
                ] = '[';
                patterns[
                    blk: {
                        const ref = &p;
                        const tmp = ref.*;
                        ref.* +%= 1;
                        break :blk tmp;
                    }
                ] = @bitCast(@as(i8, @truncate(SDL_tolower_REAL(filter.pattern[i]))));
                patterns[
                    blk: {
                        const ref = &p;
                        const tmp = ref.*;
                        ref.* +%= 1;
                        break :blk tmp;
                    }
                ] = @bitCast(@as(i8, @truncate(SDL_toupper_REAL(filter.pattern[i]))));
                patterns[
                    blk: {
                        const ref = &p;
                        const tmp = ref.*;
                        ref.* +%= 1;
                        break :blk tmp;
                    }
                ] = ']';
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                patterns[
                    blk: {
                        const ref = &p;
                        const tmp = ref.*;
                        ref.* +%= 1;
                        break :blk tmp;
                    }
                ] = filter.pattern[i];
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            12 => {
                if (pattern != null) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            13 => {
                max_len = SDL_strlen_REAL(pattern) +% @as(usize, 3);
                _ = dbus.*.message_iter_open_container.?(&filter_array, @as(c_int, 'r'), null, &filter_array_entry);
                _ = dbus.*.message_iter_append_basic.?(&filter_array_entry, @as(c_int, 'u'), @ptrCast(@alignCast(&zero)));
                glob_pattern = @ptrCast(@alignCast(SDL_calloc_REAL(max_len, @sizeOf(u8))));
                if (!(glob_pattern != null)) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
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
                glob_pattern[@as(c_int, 0)] = '*';
                if ((@as(c_int, pattern[@as(c_int, 0)]) != @as(c_int, '*')) or (@as(c_int, pattern[@as(c_int, 1)]) != 0)) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            18 => {
                glob_pattern[@as(c_int, 1)] = '.';
                _ = SDL_strlcat_REAL(glob_pattern + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))), pattern, max_len);
                {
                    sdl_pc = 20;
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
                _ = dbus.*.message_iter_append_basic.?(&filter_array_entry, @as(c_int, 's'), @ptrCast(@alignCast(&glob_pattern)));
                SDL_free_REAL(@ptrCast(@alignCast(glob_pattern)));
                _ = dbus.*.message_iter_close_container.?(&filter_array, &filter_array_entry);
                pattern = SDL_strtok_r_REAL(null, ";", &state);
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn DBus_AppendFilters(dbus: [*c]SDL_DBusContext, options: [*c]DBusMessageIter, filters: [*c]const SDL_DialogFileFilter, nfilters: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var options_pair: DBusMessageIter = undefined;
    _ = &options_pair;
    var options_value: DBusMessageIter = undefined;
    _ = &options_value;
    var options_value_array: DBusMessageIter = undefined;
    _ = &options_value_array;
    const static_local_filters_name = struct {
        var filters_name: [*c]const u8 = "filters";
    };
    _ = &static_local_filters_name;
    _ = dbus.*.message_iter_open_container.?(options, @as(c_int, 'e'), null, &options_pair);
    _ = dbus.*.message_iter_append_basic.?(&options_pair, @as(c_int, 's'), @ptrCast(@alignCast(&static_local_filters_name.filters_name)));
    _ = dbus.*.message_iter_open_container.?(&options_pair, @as(c_int, 'v'), "a(sa(us))", &options_value);
    _ = dbus.*.message_iter_open_container.?(&options_value, @as(c_int, 'a'), "(sa(us))", &options_value_array);
    {
        var i: c_int = 0;
        _ = &i;
        while (i < nfilters) : (i += 1) {
            DBus_AppendFilter(dbus, &options_value_array, filters[@bitCast(@as(isize, @intCast(i)))]);
        }
    }
    _ = dbus.*.message_iter_close_container.?(&options_value, &options_value_array);
    _ = dbus.*.message_iter_close_container.?(&options_pair, &options_value);
    _ = dbus.*.message_iter_close_container.?(options, &options_pair);
}
pub fn DBus_AppendByteArray(dbus: [*c]SDL_DBusContext, options: [*c]DBusMessageIter, arg_key: [*c]const u8, arg_value: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var key = arg_key;
    _ = &key;
    var value = arg_value;
    _ = &value;
    var options_pair: DBusMessageIter = undefined;
    _ = &options_pair;
    var options_value: DBusMessageIter = undefined;
    _ = &options_value;
    var options_array: DBusMessageIter = undefined;
    _ = &options_array;
    _ = dbus.*.message_iter_open_container.?(options, @as(c_int, 'e'), null, &options_pair);
    _ = dbus.*.message_iter_append_basic.?(&options_pair, @as(c_int, 's'), @ptrCast(@alignCast(&key)));
    _ = dbus.*.message_iter_open_container.?(&options_pair, @as(c_int, 'v'), "ay", &options_value);
    _ = dbus.*.message_iter_open_container.?(&options_value, @as(c_int, 'a'), "y", &options_array);
    while (true) {
        _ = dbus.*.message_iter_append_basic.?(&options_array, @as(c_int, 'y'), @ptrCast(@alignCast(value)));
        if (!(@as(c_int, (blk: {
            const ref = &value;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        }).*) != 0)) break;
    }
    _ = dbus.*.message_iter_close_container.?(&options_value, &options_array);
    _ = dbus.*.message_iter_close_container.?(&options_pair, &options_value);
    _ = dbus.*.message_iter_close_container.?(options, &options_pair);
}
pub fn DBus_MessageFilter(conn: ?*DBusConnection, msg: ?*DBusMessage, data: ?*anyopaque) callconv(.c) DBusHandlerResult {
    @setEvalBranchQuota(100000);
    var dbus: [*c]SDL_DBusContext = undefined;
    _ = &dbus;
    var signal_data: [*c]SignalCallback = undefined;
    _ = &signal_data;
    var signal_iter: DBusMessageIter = undefined;
    _ = &signal_iter;
    var result_array: DBusMessageIter = undefined;
    _ = &result_array;
    var array_entry: DBusMessageIter = undefined;
    _ = &array_entry;
    var value_entry: DBusMessageIter = undefined;
    _ = &value_entry;
    var uri_entry: DBusMessageIter = undefined;
    _ = &uri_entry;
    var result: u32 = undefined;
    _ = &result;
    var length: usize = undefined;
    _ = &length;
    var current: usize = undefined;
    _ = &current;
    var path: [*c][*c]const u8 = undefined;
    _ = &path;
    var result_data: [1][*c]const u8 = undefined;
    _ = &result_data;
    var method: [*c]const u8 = undefined;
    _ = &method;
    var uri: [*c]const u8 = undefined;
    _ = &uri;
    var newpath: [*c][*c]const u8 = undefined;
    _ = &newpath;
    var decoded_uri: [*c]u8 = undefined;
    _ = &decoded_uri;
    var i: usize = undefined;
    _ = &i;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                dbus = SDL_DBus_GetContext();
                signal_data = @ptrCast(@alignCast(data));
                if ((dbus.*.message_is_signal.?(msg, "org.freedesktop.portal.Request", "Response") != 0) and (dbus.*.message_has_path.?(msg, signal_data.*.path) != 0)) {
                    sdl_pc = 3;
                    continue;
                } else {
                    sdl_pc = 4;
                    continue;
                }
            },
            1 => {
                _ = dbus.*.connection_remove_filter.?(conn, &DBus_MessageFilter, @ptrCast(@alignCast(signal_data)));
                if (path != null) {
                    sdl_pc = 57;
                    continue;
                } else {
                    sdl_pc = 58;
                    continue;
                }
            },
            2 => {
                return DBUS_HANDLER_RESULT_NOT_YET_HANDLED;
            },
            3 => {
                length = 2;
                current = 0;
                path = null;
                _ = dbus.*.message_iter_init.?(msg, &signal_iter);
                if (dbus.*.message_iter_get_arg_type.?(&signal_iter) != @as(c_int, 'u')) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 7;
                    continue;
                }
            },
            4 => {
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            5 => {
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            6 => {
                {
                    sdl_pc = 2;
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
                dbus.*.message_iter_get_basic.?(&signal_iter, @ptrCast(@alignCast(&result)));
                if ((result == @as(u32, 1)) or (result == @as(u32, 2))) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
            },
            9 => {
                result_data = [1][*c]const u8{
                    null,
                };
                signal_data.*.callback.?(signal_data.*.userdata, @ptrCast(@alignCast(&result_data)), -@as(c_int, 1));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            10 => {
                if (result != 0) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            11 => {
                if (!(dbus.*.message_iter_next.?(&signal_iter) != 0)) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            12 => {
                signal_data.*.callback.?(signal_data.*.userdata, null, -@as(c_int, 1));
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
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            15 => {
                {
                    sdl_pc = 2;
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
                if (dbus.*.message_iter_get_arg_type.?(&signal_iter) != @as(c_int, 'a')) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            18 => {
                {
                    sdl_pc = 2;
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
                dbus.*.message_iter_recurse.?(&signal_iter, &result_array);
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            21 => {
                if (dbus.*.message_iter_get_arg_type.?(&result_array) == @as(c_int, 'e')) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            22 => {
                dbus.*.message_iter_recurse.?(&result_array, &array_entry);
                if (dbus.*.message_iter_get_arg_type.?(&array_entry) != @as(c_int, 's')) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            23 => {
                if (!(dbus.*.message_iter_next.?(&array_entry) != 0)) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 34;
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
                dbus.*.message_iter_get_basic.?(&array_entry, @ptrCast(@alignCast(&method)));
                if (!(SDL_strcmp_REAL(method, "uris") != 0)) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            27 => {
                {
                    sdl_pc = 23;
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
                if (!(dbus.*.message_iter_next.?(&result_array) != 0)) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            30 => {
                {
                    sdl_pc = 2;
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
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            33 => {
                {
                    sdl_pc = 2;
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
                if (dbus.*.message_iter_get_arg_type.?(&array_entry) != @as(c_int, 'v')) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 37;
                    continue;
                }
            },
            36 => {
                {
                    sdl_pc = 2;
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
                dbus.*.message_iter_recurse.?(&array_entry, &value_entry);
                if (dbus.*.message_iter_get_arg_type.?(&value_entry) != @as(c_int, 'a')) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 40;
                    continue;
                }
            },
            39 => {
                {
                    sdl_pc = 2;
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
                dbus.*.message_iter_recurse.?(&value_entry, &uri_entry);
                path = @ptrCast(@alignCast(SDL_malloc_REAL(length *% @sizeOf([*c]const u8))));
                if (!(path != null)) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 43;
                    continue;
                }
            },
            42 => {
                signal_data.*.callback.?(signal_data.*.userdata, null, -@as(c_int, 1));
                {
                    sdl_pc = 1;
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
                    sdl_pc = 45;
                    continue;
                }
            },
            45 => {
                if (dbus.*.message_iter_get_arg_type.?(&uri_entry) == @as(c_int, 's')) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 47;
                    continue;
                }
            },
            46 => {
                uri = null;
                if (current >= (length -% @as(usize, 1))) {
                    sdl_pc = 48;
                    continue;
                } else {
                    sdl_pc = 49;
                    continue;
                }
            },
            47 => {
                path[current] = null;
                signal_data.*.callback.?(signal_data.*.userdata, path, -@as(c_int, 1));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            48 => {
                length +%= 1;
                newpath = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(path)), length *% @sizeOf([*c]const u8))));
                if (!(newpath != null)) {
                    sdl_pc = 51;
                    continue;
                } else {
                    sdl_pc = 52;
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
                dbus.*.message_iter_get_basic.?(&uri_entry, @ptrCast(@alignCast(&uri)));
                decoded_uri = @ptrCast(@alignCast(SDL_malloc_REAL(SDL_strlen_REAL(uri) +% @as(usize, 1))));
                if (SDL_URIToLocal(uri, decoded_uri) != 0) {
                    sdl_pc = 54;
                    continue;
                } else {
                    sdl_pc = 55;
                    continue;
                }
            },
            51 => {
                signal_data.*.callback.?(signal_data.*.userdata, null, -@as(c_int, 1));
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
                path = newpath;
                {
                    sdl_pc = 50;
                    continue;
                }
            },
            54 => {
                path[current] = decoded_uri;
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            55 => {
                SDL_free_REAL(@ptrCast(@alignCast(decoded_uri)));
                _ = SDL_SetError_REAL("Portal dialogs: Unsupported protocol: %s", uri);
                signal_data.*.callback.?(signal_data.*.userdata, null, -@as(c_int, 1));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            56 => {
                _ = dbus.*.message_iter_next.?(&uri_entry);
                current +%= 1;
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            57 => {
                i = 0;
                {
                    sdl_pc = 60;
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
                SDL_free_REAL(@ptrCast(@alignCast(@constCast(signal_data.*.path))));
                SDL_free_REAL(@ptrCast(@alignCast(signal_data)));
                return DBUS_HANDLER_RESULT_HANDLED;
            },
            60 => {
                if (i < current) {
                    sdl_pc = 61;
                    continue;
                } else {
                    sdl_pc = 63;
                    continue;
                }
            },
            61 => {
                SDL_free_REAL(@ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(@constCast(path[i])))))));
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            62 => {
                i +%= 1;
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            63 => {
                SDL_free_REAL(@ptrCast(@alignCast(path)));
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub const ENOENT = @as(c_int, 2);
pub const __S_IFMT = __helpers.promoteIntLiteral(c_int, 0o170000, .octal);
pub const __S_IFDIR = @as(c_int, 0o040000);
pub const __S_IFREG = __helpers.promoteIntLiteral(c_int, 0o100000, .octal);
pub const HANDLE_LEN = @as(c_int, 10);
