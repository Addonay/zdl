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
pub const Uint32 = u32;
pub const Sint64 = i64;
pub const Uint64 = u64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_realloc_REAL(mem: ?*anyopaque, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub const struct_SDL_Environment = opaque {
};
pub const SDL_Environment = struct_SDL_Environment;
pub extern fn SDL_CreateEnvironment_REAL(populated: bool) ?*SDL_Environment;
pub extern fn SDL_SetEnvironmentVariable_REAL(env: ?*SDL_Environment, name: [*c]const u8, value: [*c]const u8, overwrite: bool) bool;
pub extern fn SDL_DestroyEnvironment_REAL(env: ?*SDL_Environment) void;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_snprintf_REAL(text: [*c]u8, maxlen: usize, fmt: [*c]const u8, ...) c_int;
pub const SDL_FunctionPointer = ?*const fn () callconv(.c) void;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_PropertiesID = Uint32;
pub extern fn SDL_CreateProperties_REAL() SDL_PropertiesID;
pub extern fn SDL_SetPointerProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: ?*anyopaque) bool;
pub extern fn SDL_SetNumberProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: Sint64) bool;
pub extern fn SDL_GetPointerProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: ?*anyopaque) ?*anyopaque;
pub extern fn SDL_GetStringProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: [*c]const u8) [*c]const u8;
pub extern fn SDL_GetNumberProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: Sint64) Sint64;
pub extern fn SDL_GetBooleanProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: bool) bool;
pub extern fn SDL_DestroyProperties_REAL(props: SDL_PropertiesID) void;
pub const struct_SDL_Thread = opaque {
};
pub const SDL_Thread = struct_SDL_Thread;
pub const SDL_ThreadFunction = ?*const fn (data: ?*anyopaque) callconv(.c) c_int;
pub extern fn SDL_CreateThreadRuntime_REAL(@"fn": SDL_ThreadFunction, name: [*c]const u8, data: ?*anyopaque, pfnBeginThread: SDL_FunctionPointer, pfnEndThread: SDL_FunctionPointer) ?*SDL_Thread;
pub extern fn SDL_DetachThread_REAL(thread: ?*SDL_Thread) void;
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
pub const struct_SDL_Process = opaque {
};
pub const SDL_Process = struct_SDL_Process;
pub const SDL_PROCESS_STDIO_NULL: c_int = 1;
pub const SDL_PROCESS_STDIO_APP: c_int = 2;
pub extern fn SDL_CreateProcessWithProperties_REAL(props: SDL_PropertiesID) ?*SDL_Process;
pub extern fn SDL_ReadProcess_REAL(process: ?*SDL_Process, datasize: [*c]usize, exitcode: [*c]c_int) ?*anyopaque;
pub extern fn SDL_WaitProcess_REAL(process: ?*SDL_Process, block: bool, exitcode: [*c]c_int) bool;
pub extern fn SDL_DestroyProcess_REAL(process: ?*SDL_Process) void;
pub export fn SDL_Zenity_ShowFileDialogWithProperties(arg_type: SDL_FileDialogType, callback: SDL_DialogFileCallback, userdata: ?*anyopaque, props: SDL_PropertiesID) void {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var args: [*c]zenityArgs = create_zenity_args(@"type", callback, userdata, props);
    _ = &args;
    if (!(args != null)) {
        callback.?(userdata, null, -@as(c_int, 1));
        return;
    }
    var thread: ?*SDL_Thread = SDL_CreateThreadRuntime_REAL(run_zenity_thread, "SDL_ZenityFileDialog", @as(?*anyopaque, @ptrCast(@alignCast(args))), null, null);
    _ = &thread;
    if (!(thread != null)) {
        free_zenity_args(args);
        callback.?(userdata, null, -@as(c_int, 1));
        return;
    }
    SDL_DetachThread_REAL(thread);
}
pub export fn SDL_Zenity_detect() bool {
    @setEvalBranchQuota(100000);
    var args: [3][*c]const u8 = [3][*c]const u8{
        "zenity",
        "--version",
        null,
    };
    _ = &args;
    var status: c_int = -@as(c_int, 1);
    _ = &status;
    var props: SDL_PropertiesID = SDL_CreateProperties_REAL();
    _ = &props;
    _ = SDL_SetPointerProperty_REAL(props, "SDL.process.create.args", @ptrCast(@alignCast(@as([*c][*c]const u8, @ptrCast(@alignCast(&args))))));
    _ = SDL_SetNumberProperty_REAL(props, "SDL.process.create.stdin_option", SDL_PROCESS_STDIO_NULL);
    _ = SDL_SetNumberProperty_REAL(props, "SDL.process.create.stdout_option", SDL_PROCESS_STDIO_NULL);
    _ = SDL_SetNumberProperty_REAL(props, "SDL.process.create.stderr_option", SDL_PROCESS_STDIO_NULL);
    var process: ?*SDL_Process = SDL_CreateProcessWithProperties_REAL(props);
    _ = &process;
    SDL_DestroyProperties_REAL(props);
    if (process != null) {
        _ = SDL_WaitProcess_REAL(process, @"true" != 0, &status);
        SDL_DestroyProcess_REAL(process);
    }
    return status == @as(c_int, 0);
}

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const NameTransform = ?*const fn (name: [*c]const u8) callconv(.c) [*c]u8;
pub extern fn convert_filter(filter: SDL_DialogFileFilter, ntf: NameTransform, prefix: [*c]const u8, separator: [*c]const u8, suffix: [*c]const u8, ext_prefix: [*c]const u8, ext_separator: [*c]const u8, ext_suffix: [*c]const u8, anycase: bool) [*c]u8;
pub extern fn SDL_get_zenity_version(major: [*c]c_int, minor: [*c]c_int) bool;
pub const zenityArgs = extern struct {
    callback: SDL_DialogFileCallback = null,
    userdata: ?*anyopaque = null,
    argv: ?*anyopaque = null,
    x11_window_handle: [28]u8 = @import("std").mem.zeroes([28]u8),
    nfilters: c_int = 0,
    filters_slice: [*c][*c]u8 = null,
    filename: [*c]u8 = null,
    title: [*c]u8 = null,
    accept: [*c]u8 = null,
    cancel: [*c]u8 = null,
};
pub fn zenity_clean_name(name: [*c]const u8) callconv(.c) [*c]u8 {
    @setEvalBranchQuota(100000);
    var newname: [*c]u8 = SDL_strdup_REAL(name);
    _ = &newname;
    {
        var c: [*c]u8 = newname;
        _ = &c;
        while (@as(c_int, c.*) != 0) : (c += 1) {
            if (@as(c_int, c.*) == @as(c_int, '|')) {
                c.* = '/';
            }
        }
    }
    return newname;
}
pub fn get_x11_window_handle(props: SDL_PropertiesID, out: [*c]u8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var window: ?*SDL_Window = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(props, "SDL.filedialog.window", null)));
    _ = &window;
    if (!(window != null)) {
        return @"false" != 0;
    }
    var window_props: SDL_PropertiesID = SDL_GetWindowProperties_REAL(window);
    _ = &window_props;
    if (!(window_props != 0)) {
        return @"false" != 0;
    }
    var handle: Uint64 = @bitCast(@as(c_long, SDL_GetNumberProperty_REAL(window_props, "SDL.window.x11.window", 0)));
    _ = &handle;
    if (!(handle != 0)) {
        return @"false" != 0;
    }
    if (SDL_snprintf_REAL(out, X11_HANDLE_MAX_WIDTH, "0x%lx", handle) >= X11_HANDLE_MAX_WIDTH) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn create_zenity_args(arg_type: SDL_FileDialogType, callback: SDL_DialogFileCallback, userdata: ?*anyopaque, props: SDL_PropertiesID) callconv(.c) [*c]zenityArgs {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var args: [*c]zenityArgs = undefined;
    _ = &args;
    var zenity_major: c_int = undefined;
    _ = &zenity_major;
    var zenity_minor: c_int = undefined;
    _ = &zenity_minor;
    var argv: [*c][*c]const u8 = undefined;
    _ = &argv;
    var str: [*c]const u8 = undefined;
    _ = &str;
    var str_1: [*c]const u8 = undefined;
    _ = &str_1;
    var str_2: [*c]const u8 = undefined;
    _ = &str_2;
    var str_3: [*c]const u8 = undefined;
    _ = &str_3;
    var argc: c_int = undefined;
    _ = &argc;
    var filters: [*c]const SDL_DialogFileFilter = undefined;
    _ = &filters;
    var i: c_int = undefined;
    _ = &i;
    var filter_str: [*c]u8 = undefined;
    _ = &filter_str;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                args = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(args.*)))));
                zenity_major = 0;
                zenity_minor = 0;
                if (!(args != null)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                SDL_free_REAL(@ptrCast(@alignCast(args.*.filename)));
                SDL_free_REAL(@ptrCast(@alignCast(args.*.title)));
                SDL_free_REAL(@ptrCast(@alignCast(args.*.accept)));
                SDL_free_REAL(@ptrCast(@alignCast(args.*.cancel)));
                SDL_free_REAL(@ptrCast(@alignCast(argv)));
                SDL_free_REAL(@ptrCast(@alignCast(args)));
                return null;
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
                args.*.callback = callback;
                args.*.userdata = userdata;
                args.*.nfilters = @truncate(SDL_GetNumberProperty_REAL(props, "SDL.filedialog.nfilters", 0));
                argv = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(@TypeOf(argv.*)) *% @as(c_ulong, @bitCast(@as(c_long, ((((((((@as(c_int, 3) + @as(c_int, 1)) + @as(c_int, 2)) + @as(c_int, 2)) + @as(c_int, 3)) + @as(c_int, 2)) + @as(c_int, 2)) + @as(c_int, 2)) + args.*.nfilters) + @as(c_int, 1)))))));
                if (!(argv != null)) {
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
                args.*.argv = @ptrCast(@alignCast(argv));
                _ = SDL_get_zenity_version(&zenity_major, &zenity_minor);
                str = SDL_GetStringProperty_REAL(props, "SDL.filedialog.location", null);
                if (str != null) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                args.*.filename = SDL_strdup_REAL(str);
                if (!(args.*.filename != null)) {
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
                str_1 = SDL_GetStringProperty_REAL(props, "SDL.filedialog.title", null);
                if (str_1 != null) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
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
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            14 => {
                args.*.title = SDL_strdup_REAL(str_1);
                if (!(args.*.title != null)) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
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
                str_2 = SDL_GetStringProperty_REAL(props, "SDL.filedialog.accept", null);
                if (str_2 != null) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
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
                    sdl_pc = 16;
                    continue;
                }
            },
            20 => {
                args.*.accept = SDL_strdup_REAL(str_2);
                if (!(args.*.accept != null)) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
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
                str_3 = SDL_GetStringProperty_REAL(props, "SDL.filedialog.cancel", null);
                if (str_3 != null) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
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
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            26 => {
                args.*.cancel = SDL_strdup_REAL(str_3);
                if (!(args.*.cancel != null)) {
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
                argc = 0;
                argv[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &argc;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = "zenity";
                argv[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &argc;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = "--file-selection";
                argv[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &argc;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = "--separator=\n";
                if (SDL_GetBooleanProperty_REAL(props, "SDL.filedialog.many", @"false" != 0)) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
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
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            32 => {
                argv[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &argc;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = "--multiple";
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
                switch (@"type") {
                    @as(SDL_FileDialogType, SDL_FILEDIALOG_OPENFILE) => {
                        sdl_pc = 36;
                        continue;
                    },
                    @as(SDL_FileDialogType, SDL_FILEDIALOG_SAVEFILE) => {
                        sdl_pc = 37;
                        continue;
                    },
                    @as(SDL_FileDialogType, SDL_FILEDIALOG_OPENFOLDER) => {
                        sdl_pc = 38;
                        continue;
                    },
                    else => {
                        sdl_pc = 35;
                        continue;
                    },
                }
            },
            35 => {
                if (args.*.filename != null) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 40;
                    continue;
                }
            },
            36 => {
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            37 => {
                argv[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &argc;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = "--save";
                argv[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &argc;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = "--confirm-overwrite";
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            38 => {
                argv[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &argc;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = "--directory";
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            39 => {
                argv[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &argc;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = "--filename";
                argv[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &argc;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = args.*.filename;
                {
                    sdl_pc = 41;
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
                if (get_x11_window_handle(props, @ptrCast(@alignCast(&args.*.x11_window_handle))) and ((zenity_major > @as(c_int, 3)) or ((zenity_major == @as(c_int, 3)) and (zenity_minor >= @as(c_int, 6))))) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 43;
                    continue;
                }
            },
            42 => {
                argv[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &argc;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = "--modal";
                argv[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &argc;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = "--attach";
                argv[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &argc;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = @ptrCast(@alignCast(&args.*.x11_window_handle));
                {
                    sdl_pc = 44;
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
                if (args.*.title != null) {
                    sdl_pc = 45;
                    continue;
                } else {
                    sdl_pc = 46;
                    continue;
                }
            },
            45 => {
                argv[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &argc;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = "--title";
                argv[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &argc;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = args.*.title;
                {
                    sdl_pc = 47;
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
                if (args.*.accept != null) {
                    sdl_pc = 48;
                    continue;
                } else {
                    sdl_pc = 49;
                    continue;
                }
            },
            48 => {
                argv[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &argc;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = "--ok-label";
                argv[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &argc;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = args.*.accept;
                {
                    sdl_pc = 50;
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
                if (args.*.cancel != null) {
                    sdl_pc = 51;
                    continue;
                } else {
                    sdl_pc = 52;
                    continue;
                }
            },
            51 => {
                argv[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &argc;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = "--cancel-label";
                argv[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &argc;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = args.*.cancel;
                {
                    sdl_pc = 53;
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
                filters = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(props, "SDL.filedialog.filters", null)));
                if (filters != null) {
                    sdl_pc = 54;
                    continue;
                } else {
                    sdl_pc = 55;
                    continue;
                }
            },
            54 => {
                args.*.filters_slice = @ptrCast(@alignCast(&argv[@bitCast(@as(isize, @intCast(argc)))]));
                i = 0;
                {
                    sdl_pc = 57;
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
                argv[@bitCast(@as(isize, @intCast(argc)))] = null;
                return args;
            },
            57 => {
                if (i < args.*.nfilters) {
                    sdl_pc = 58;
                    continue;
                } else {
                    sdl_pc = 60;
                    continue;
                }
            },
            58 => {
                filter_str = convert_filter(filters[@bitCast(@as(isize, @intCast(i)))], zenity_clean_name, "--file-filter=", " | ", "", "*.", " *.", "", @"true" != 0);
                if (!(filter_str != null)) {
                    sdl_pc = 61;
                    continue;
                } else {
                    sdl_pc = 62;
                    continue;
                }
            },
            59 => {
                i += 1;
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            60 => {
                argc += args.*.nfilters;
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            61 => {
                {
                    sdl_pc = 64;
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
                args.*.filters_slice[@bitCast(@as(isize, @intCast(i)))] = filter_str;
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            64 => {
                if ((blk: {
                    const ref = &i;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 65;
                    continue;
                } else {
                    sdl_pc = 66;
                    continue;
                }
            },
            65 => {
                SDL_free_REAL(@ptrCast(@alignCast(args.*.filters_slice[@bitCast(@as(isize, @intCast(i)))])));
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            66 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn run_zenity(callback: SDL_DialogFileCallback, userdata: ?*anyopaque, argv: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var process: ?*SDL_Process = undefined;
    _ = &process;
    var env: ?*SDL_Environment = undefined;
    _ = &env;
    var status: c_int = undefined;
    _ = &status;
    var bytes_read: usize = undefined;
    _ = &bytes_read;
    var container: [*c]u8 = undefined;
    _ = &container;
    var narray: usize = undefined;
    _ = &narray;
    var array: [*c][*c]u8 = undefined;
    _ = &array;
    var result: bool = undefined;
    _ = &result;
    var props: SDL_PropertiesID = undefined;
    _ = &props;
    var i: c_int = undefined;
    _ = &i;
    var new_array: [*c][*c]u8 = undefined;
    _ = &new_array;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                process = null;
                env = null;
                status = -@as(c_int, 1);
                bytes_read = 0;
                container = null;
                narray = 1;
                array = null;
                result = @"false" != 0;
                env = SDL_CreateEnvironment_REAL(@"true" != 0);
                if (!(env != null)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                SDL_free_REAL(@ptrCast(@alignCast(array)));
                SDL_free_REAL(@ptrCast(@alignCast(container)));
                SDL_DestroyEnvironment_REAL(env);
                SDL_DestroyProcess_REAL(process);
                if (!result) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
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
                _ = SDL_SetEnvironmentVariable_REAL(env, "ZENITY_OK", "0", @"true" != 0);
                _ = SDL_SetEnvironmentVariable_REAL(env, "ZENITY_CANCEL", "1", @"true" != 0);
                _ = SDL_SetEnvironmentVariable_REAL(env, "ZENITY_ESC", "1", @"true" != 0);
                _ = SDL_SetEnvironmentVariable_REAL(env, "ZENITY_EXTRA", "2", @"true" != 0);
                _ = SDL_SetEnvironmentVariable_REAL(env, "ZENITY_ERROR", "2", @"true" != 0);
                _ = SDL_SetEnvironmentVariable_REAL(env, "ZENITY_TIMEOUT", "2", @"true" != 0);
                props = SDL_CreateProperties_REAL();
                _ = SDL_SetPointerProperty_REAL(props, "SDL.process.create.args", argv);
                _ = SDL_SetPointerProperty_REAL(props, "SDL.process.create.environment", @ptrCast(@alignCast(env)));
                _ = SDL_SetNumberProperty_REAL(props, "SDL.process.create.stdin_option", SDL_PROCESS_STDIO_NULL);
                _ = SDL_SetNumberProperty_REAL(props, "SDL.process.create.stdout_option", SDL_PROCESS_STDIO_APP);
                _ = SDL_SetNumberProperty_REAL(props, "SDL.process.create.stderr_option", SDL_PROCESS_STDIO_NULL);
                process = SDL_CreateProcessWithProperties_REAL(props);
                SDL_DestroyProperties_REAL(props);
                if (!(process != null)) {
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
                container = @ptrCast(@alignCast(SDL_ReadProcess_REAL(process, &bytes_read, &status)));
                if (!(container != null)) {
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
                array = @ptrCast(@alignCast(SDL_malloc_REAL((narray +% @as(usize, 1)) *% @sizeOf([*c]u8))));
                if (!(array != null)) {
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
                array[@as(c_int, 0)] = container;
                array[@as(c_int, 1)] = null;
                i = 0;
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            14 => {
                if (@as(usize, @bitCast(@as(c_long, i))) < bytes_read) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            15 => {
                if (@as(c_int, container[@bitCast(@as(isize, @intCast(i)))]) == @as(c_int, '\n')) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            16 => {
                i += 1;
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            17 => {
                if ((status == @as(c_int, 0)) or (status == @as(c_int, 1))) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            18 => {
                container[@bitCast(@as(isize, @intCast(i)))] = '\x00';
                if (@as(usize, @bitCast(@as(c_long, i))) < (bytes_read -% @as(usize, 1))) {
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
                    sdl_pc = 16;
                    continue;
                }
            },
            21 => {
                array[narray] = (container + @as(usize, @bitCast(@as(isize, @intCast(i))))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
                narray +%= 1;
                new_array = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(array)), (narray +% @as(usize, 1)) *% @sizeOf([*c]u8))));
                if (!(new_array != null)) {
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
                    sdl_pc = 20;
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
                array = new_array;
                array[narray] = null;
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            27 => {
                callback.?(userdata, @ptrCast(@alignCast(array)), -@as(c_int, 1));
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            28 => {
                _ = SDL_SetError_REAL("Could not run zenity: exit code %d", status);
                callback.?(userdata, null, -@as(c_int, 1));
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            29 => {
                result = @"true" != 0;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            30 => {
                callback.?(userdata, null, -@as(c_int, 1));
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
                {}
            },
            else => unreachable,
        }
    }
}
pub fn free_zenity_args(args: [*c]zenityArgs) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (args.*.filters_slice != null) {
        {
            var i: c_int = 0;
            _ = &i;
            while (i < args.*.nfilters) : (i += 1) {
                SDL_free_REAL(@ptrCast(@alignCast(args.*.filters_slice[@bitCast(@as(isize, @intCast(i)))])));
            }
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(args.*.filename)));
    SDL_free_REAL(@ptrCast(@alignCast(args.*.title)));
    SDL_free_REAL(@ptrCast(@alignCast(args.*.accept)));
    SDL_free_REAL(@ptrCast(@alignCast(args.*.cancel)));
    SDL_free_REAL(args.*.argv);
    SDL_free_REAL(@ptrCast(@alignCast(args)));
}
pub fn run_zenity_thread(ptr: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var args: [*c]zenityArgs = @ptrCast(@alignCast(ptr));
    _ = &args;
    run_zenity(args.*.callback, args.*.userdata, args.*.argv);
    free_zenity_args(args);
    return 0;
}
pub const X11_HANDLE_MAX_WIDTH = @as(c_int, 28);
