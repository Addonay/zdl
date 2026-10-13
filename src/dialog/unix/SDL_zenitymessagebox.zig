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
pub const Uint8 = u8;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_strlen_REAL(str: [*c]const u8) usize;
pub extern fn SDL_strrchr_REAL(str: [*c]const u8, c: c_int) [*c]u8;
pub extern fn SDL_strtol_REAL(str: [*c]const u8, endp: [*c][*c]u8, base: c_int) c_long;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_PropertiesID = Uint32;
pub extern fn SDL_CreateProperties_REAL() SDL_PropertiesID;
pub extern fn SDL_SetPointerProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: ?*anyopaque) bool;
pub extern fn SDL_SetNumberProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: Sint64) bool;
pub extern fn SDL_DestroyProperties_REAL(props: SDL_PropertiesID) void;
pub const struct_SDL_Window = opaque {
};
pub const SDL_Window = struct_SDL_Window;
pub const SDL_MessageBoxFlags = Uint32;
pub const SDL_MessageBoxButtonFlags = Uint32;
pub const struct_SDL_MessageBoxButtonData = extern struct {
    flags: SDL_MessageBoxButtonFlags = 0,
    buttonID: c_int = 0,
    text: [*c]const u8 = null,
};
pub const SDL_MessageBoxButtonData = struct_SDL_MessageBoxButtonData;
pub const struct_SDL_MessageBoxColor = extern struct {
    r: Uint8 = 0,
    g: Uint8 = 0,
    b: Uint8 = 0,
};
pub const SDL_MessageBoxColor = struct_SDL_MessageBoxColor;
pub const struct_SDL_MessageBoxColorScheme = extern struct {
    colors: [5]SDL_MessageBoxColor = @import("std").mem.zeroes([5]SDL_MessageBoxColor),
};
pub const SDL_MessageBoxColorScheme = struct_SDL_MessageBoxColorScheme;
pub const struct_SDL_MessageBoxData = extern struct {
    flags: SDL_MessageBoxFlags = 0,
    window: ?*SDL_Window = null,
    title: [*c]const u8 = null,
    message: [*c]const u8 = null,
    numbuttons: c_int = 0,
    buttons: [*c]const SDL_MessageBoxButtonData = null,
    colorScheme: [*c]const SDL_MessageBoxColorScheme = null,
};
pub const SDL_MessageBoxData = struct_SDL_MessageBoxData;
pub const struct_SDL_Process = opaque {
};
pub const SDL_Process = struct_SDL_Process;
pub extern fn SDL_CreateProcess_REAL(args: [*c]const [*c]const u8, pipe_stdio: bool) ?*SDL_Process;
pub const SDL_PROCESS_STDIO_NULL: c_int = 1;
pub const SDL_PROCESS_STDIO_APP: c_int = 2;
pub extern fn SDL_CreateProcessWithProperties_REAL(props: SDL_PropertiesID) ?*SDL_Process;
pub extern fn SDL_ReadProcess_REAL(process: ?*SDL_Process, datasize: [*c]usize, exitcode: [*c]c_int) ?*anyopaque;
pub extern fn SDL_WaitProcess_REAL(process: ?*SDL_Process, block: bool, exitcode: [*c]c_int) bool;
pub extern fn SDL_DestroyProcess_REAL(process: ?*SDL_Process) void;
pub export fn SDL_Zenity_ShowMessageBox(messageboxdata: [*c]const SDL_MessageBoxData, buttonID: [*c]c_int) bool {
    @setEvalBranchQuota(100000);
    var exit_code: c_int = undefined;
    _ = &exit_code;
    var zenity_major: c_int = undefined;
    _ = &zenity_major;
    var zenity_minor: c_int = undefined;
    _ = &zenity_minor;
    var output_len: c_int = undefined;
    _ = &output_len;
    var argc: c_int = undefined;
    _ = &argc;
    var i: c_int = undefined;
    _ = &i;
    var argv: [28][*c]const u8 = undefined;
    _ = &argv;
    var process: ?*SDL_Process = undefined;
    _ = &process;
    var len: c_int = undefined;
    _ = &len;
    var props: SDL_PropertiesID = undefined;
    _ = &props;
    var output: [*c]u8 = undefined;
    _ = &output;
    var tmp: [*c]u8 = undefined;
    _ = &tmp;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                exit_code = -@as(c_int, 1);
                zenity_major = 0;
                zenity_minor = 0;
                output_len = 0;
                argc = 5;
                argv = [5][*c]const u8{
                    "zenity",
                    "--question",
                    "--switch",
                    "--no-wrap",
                    "--no-markup",
                } ++ @as([23][*c]const u8, @splat(null));
                if (messageboxdata.*.numbuttons > MAX_BUTTONS) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return SDL_SetError_REAL("Too many buttons (%d max allowed)", MAX_BUTTONS);
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                if (!SDL_get_zenity_version(&zenity_major, &zenity_minor)) {
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
                argv[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &argc;
                        const tmp_1 = ref.*;
                        ref.* += 1;
                        break :blk tmp_1;
                    })))
                ] = if ((zenity_major > @as(c_int, 3)) or ((zenity_major == @as(c_int, 3)) and (zenity_minor >= @as(c_int, 90)))) @as([*c]u8, @as([*c]u8, @constCast("--icon"))) else @as([*c]u8, @as([*c]u8, @constCast("--icon-name")));
                switch (messageboxdata.*.flags & ((SDL_MESSAGEBOX_ERROR | SDL_MESSAGEBOX_WARNING) | SDL_MESSAGEBOX_INFORMATION)) {
                    SDL_MESSAGEBOX_ERROR => {
                        sdl_pc = 8;
                        continue;
                    },
                    SDL_MESSAGEBOX_WARNING => {
                        sdl_pc = 9;
                        continue;
                    },
                    SDL_MESSAGEBOX_INFORMATION => {
                        sdl_pc = 10;
                        continue;
                    },
                    else => {
                        sdl_pc = 11;
                        continue;
                    },
                }
            },
            7 => {
                if ((messageboxdata.*.title != null) and (@as(c_int, messageboxdata.*.title[@as(c_int, 0)]) != 0)) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            8 => {
                argv[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &argc;
                        const tmp_1 = ref.*;
                        ref.* += 1;
                        break :blk tmp_1;
                    })))
                ] = "dialog-error";
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            9 => {
                argv[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &argc;
                        const tmp_1 = ref.*;
                        ref.* += 1;
                        break :blk tmp_1;
                    })))
                ] = "dialog-warning";
                {
                    sdl_pc = 7;
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
                argv[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &argc;
                        const tmp_1 = ref.*;
                        ref.* += 1;
                        break :blk tmp_1;
                    })))
                ] = "dialog-information";
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            12 => {
                argv[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &argc;
                        const tmp_1 = ref.*;
                        ref.* += 1;
                        break :blk tmp_1;
                    })))
                ] = "--title";
                argv[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &argc;
                        const tmp_1 = ref.*;
                        ref.* += 1;
                        break :blk tmp_1;
                    })))
                ] = messageboxdata.*.title;
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            13 => {
                argv[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &argc;
                        const tmp_1 = ref.*;
                        ref.* += 1;
                        break :blk tmp_1;
                    })))
                ] = "--title=";
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            14 => {
                if ((messageboxdata.*.message != null) and (@as(c_int, messageboxdata.*.message[@as(c_int, 0)]) != 0)) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            15 => {
                argv[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &argc;
                        const tmp_1 = ref.*;
                        ref.* += 1;
                        break :blk tmp_1;
                    })))
                ] = "--text";
                argv[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &argc;
                        const tmp_1 = ref.*;
                        ref.* += 1;
                        break :blk tmp_1;
                    })))
                ] = messageboxdata.*.message;
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            16 => {
                argv[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &argc;
                        const tmp_1 = ref.*;
                        ref.* += 1;
                        break :blk tmp_1;
                    })))
                ] = "--text=";
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            17 => {
                i = 0;
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            18 => {
                if (i < messageboxdata.*.numbuttons) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            19 => {
                if ((messageboxdata.*.buttons[@bitCast(@as(isize, @intCast(i)))].text != null) and (@as(c_int, messageboxdata.*.buttons[@bitCast(@as(isize, @intCast(i)))].text[@as(c_int, 0)]) != 0)) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            20 => {
                i += 1;
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            21 => {
                if (messageboxdata.*.numbuttons == @as(c_int, 0)) {
                    sdl_pc = 28;
                    continue;
                } else {
                    sdl_pc = 29;
                    continue;
                }
            },
            22 => {
                len = @bitCast(@as(c_uint, @truncate(SDL_strlen_REAL(messageboxdata.*.buttons[@bitCast(@as(isize, @intCast(i)))].text))));
                if (len > output_len) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            23 => {
                argv[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &argc;
                        const tmp_1 = ref.*;
                        ref.* += 1;
                        break :blk tmp_1;
                    })))
                ] = "--extra-button=";
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            24 => {
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            25 => {
                output_len = len;
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            26 => {
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            27 => {
                argv[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &argc;
                        const tmp_1 = ref.*;
                        ref.* += 1;
                        break :blk tmp_1;
                    })))
                ] = "--extra-button";
                argv[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &argc;
                        const tmp_1 = ref.*;
                        ref.* += 1;
                        break :blk tmp_1;
                    })))
                ] = messageboxdata.*.buttons[@bitCast(@as(isize, @intCast(i)))].text;
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            28 => {
                argv[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &argc;
                        const tmp_1 = ref.*;
                        ref.* += 1;
                        break :blk tmp_1;
                    })))
                ] = "--extra-button=OK";
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            29 => {
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            30 => {
                argv[@bitCast(@as(isize, @intCast(argc)))] = null;
                props = SDL_CreateProperties_REAL();
                if (!(props != 0)) {
                    sdl_pc = 31;
                    continue;
                } else {
                    sdl_pc = 32;
                    continue;
                }
            },
            31 => {
                return @"false" != 0;
            },
            32 => {
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            33 => {
                _ = SDL_SetPointerProperty_REAL(props, "SDL.process.create.args", @ptrCast(@alignCast(@as([*c][*c]const u8, @ptrCast(@alignCast(&argv))))));
                if (buttonID != null) {
                    sdl_pc = 34;
                    continue;
                } else {
                    sdl_pc = 35;
                    continue;
                }
            },
            34 => {
                _ = SDL_SetNumberProperty_REAL(props, "SDL.process.create.stdout_option", SDL_PROCESS_STDIO_APP);
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            35 => {
                _ = SDL_SetNumberProperty_REAL(props, "SDL.process.create.stdout_option", SDL_PROCESS_STDIO_NULL);
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            36 => {
                process = SDL_CreateProcessWithProperties_REAL(props);
                SDL_DestroyProperties_REAL(props);
                if (!(process != null)) {
                    sdl_pc = 37;
                    continue;
                } else {
                    sdl_pc = 38;
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
                if (buttonID != null) {
                    sdl_pc = 40;
                    continue;
                } else {
                    sdl_pc = 41;
                    continue;
                }
            },
            40 => {
                output = @ptrCast(@alignCast(SDL_ReadProcess_REAL(process, null, &exit_code)));
                if ((exit_code < @as(c_int, 0)) or (exit_code == @as(c_int, 255))) {
                    sdl_pc = 43;
                    continue;
                } else {
                    sdl_pc = 44;
                    continue;
                }
            },
            41 => {
                _ = SDL_WaitProcess_REAL(process, @"true" != 0, &exit_code);
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            42 => {
                SDL_DestroyProcess_REAL(process);
                return !((exit_code < @as(c_int, 0)) or (exit_code == @as(c_int, 255)));
            },
            43 => {
                SDL_free_REAL(@ptrCast(@alignCast(output)));
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            44 => {
                if (output != null) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 47;
                    continue;
                }
            },
            45 => {
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            46 => {
                tmp = SDL_strrchr_REAL(output, '\n');
                if (tmp != null) {
                    sdl_pc = 49;
                    continue;
                } else {
                    sdl_pc = 50;
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
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            49 => {
                tmp.* = '\x00';
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
                i = 0;
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            52 => {
                if (i < messageboxdata.*.numbuttons) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 55;
                    continue;
                }
            },
            53 => {
                if (messageboxdata.*.buttons[@bitCast(@as(isize, @intCast(i)))].text != null) {
                    sdl_pc = 56;
                    continue;
                } else {
                    sdl_pc = 57;
                    continue;
                }
            },
            54 => {
                i += 1;
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            55 => {
                SDL_free_REAL(@ptrCast(@alignCast(output)));
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            56 => {
                if (SDL_strcmp_REAL(output, messageboxdata.*.buttons[@bitCast(@as(isize, @intCast(i)))].text) == @as(c_int, 0)) {
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
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            59 => {
                buttonID.* = messageboxdata.*.buttons[@bitCast(@as(isize, @intCast(i)))].buttonID;
                {
                    sdl_pc = 55;
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
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}

pub export fn SDL_get_zenity_version(major: [*c]c_int, minor: [*c]c_int) bool {
    @setEvalBranchQuota(100000);
    var argv: [3][*c]const u8 = [3][*c]const u8{
        "zenity",
        "--version",
        null,
    };
    _ = &argv;
    var result: bool = @"false" != 0;
    _ = &result;
    var process: ?*SDL_Process = SDL_CreateProcess_REAL(@ptrCast(@alignCast(&argv)), @"true" != 0);
    _ = &process;
    if (!(process != null)) {
        return @"false" != 0;
    }
    var output: [*c]u8 = @ptrCast(@alignCast(SDL_ReadProcess_REAL(process, null, null)));
    _ = &output;
    if (output != null) {
        result = parse_zenity_version(output, major, minor);
        SDL_free_REAL(@ptrCast(@alignCast(output)));
    }
    SDL_DestroyProcess_REAL(process);
    return result;
}
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_MESSAGEBOX_ERROR = @as(c_uint, 0x00000010);
pub const SDL_MESSAGEBOX_WARNING = @as(c_uint, 0x00000020);
pub const SDL_MESSAGEBOX_INFORMATION = @as(c_uint, 0x00000040);
pub fn parse_zenity_version(version: [*c]const u8, major: [*c]c_int, minor: [*c]c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var version_ptr: [*c]const u8 = version;
    _ = &version_ptr;
    var end_ptr: [*c]u8 = null;
    _ = &end_ptr;
    var tmp: c_int = @truncate(SDL_strtol_REAL(version_ptr, &end_ptr, 10));
    _ = &tmp;
    if ((tmp == @as(c_int, 0)) and (end_ptr == version_ptr)) {
        return SDL_SetError_REAL("failed to get zenity major version number");
    }
    major.* = tmp;
    if (@as(c_int, end_ptr.*) == @as(c_int, '.')) {
        version_ptr = end_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
        tmp = @truncate(SDL_strtol_REAL(version_ptr, &end_ptr, 10));
        if ((tmp == @as(c_int, 0)) and (end_ptr == version_ptr)) {
            return SDL_SetError_REAL("failed to get zenity minor version number");
        }
        minor.* = tmp;
    } else {
        minor.* = 0;
    }
    return @"true" != 0;
}
pub const MAX_BUTTONS = @as(c_int, 8);
