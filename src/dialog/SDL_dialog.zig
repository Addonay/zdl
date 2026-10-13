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
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_PropertiesID = Uint32;
pub extern fn SDL_CreateProperties_REAL() SDL_PropertiesID;
pub extern fn SDL_SetPointerProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: ?*anyopaque) bool;
pub extern fn SDL_SetStringProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: [*c]const u8) bool;
pub extern fn SDL_SetNumberProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: Sint64) bool;
pub extern fn SDL_SetBooleanProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: bool) bool;
pub extern fn SDL_GetPointerProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: ?*anyopaque) ?*anyopaque;
pub extern fn SDL_GetNumberProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: Sint64) Sint64;
pub extern fn SDL_DestroyProperties_REAL(props: SDL_PropertiesID) void;
pub const struct_SDL_Window = opaque {
};
pub const SDL_Window = struct_SDL_Window;
pub const struct_SDL_DialogFileFilter = extern struct {
    name: [*c]const u8 = null,
    pattern: [*c]const u8 = null,
};
pub const SDL_DialogFileFilter = struct_SDL_DialogFileFilter;
pub const SDL_DialogFileCallback = ?*const fn (userdata: ?*anyopaque, filelist: [*c]const [*c]const u8, filter: c_int) callconv(.c) void;
pub export fn SDL_ShowOpenFileDialog_REAL(callback: SDL_DialogFileCallback, userdata: ?*anyopaque, window: ?*SDL_Window, filters: [*c]const SDL_DialogFileFilter, nfilters: c_int, default_location: [*c]const u8, allow_many: bool) void {
    @setEvalBranchQuota(100000);
    var props: SDL_PropertiesID = SDL_CreateProperties_REAL();
    _ = &props;
    _ = SDL_SetPointerProperty_REAL(props, "SDL.filedialog.filters", @ptrCast(@alignCast(@constCast(filters))));
    _ = SDL_SetNumberProperty_REAL(props, "SDL.filedialog.nfilters", nfilters);
    _ = SDL_SetPointerProperty_REAL(props, "SDL.filedialog.window", @ptrCast(@alignCast(window)));
    _ = SDL_SetStringProperty_REAL(props, "SDL.filedialog.location", default_location);
    _ = SDL_SetBooleanProperty_REAL(props, "SDL.filedialog.many", allow_many);
    SDL_ShowFileDialogWithProperties_REAL(SDL_FILEDIALOG_OPENFILE, callback, userdata, props);
    SDL_DestroyProperties_REAL(props);
}
pub export fn SDL_ShowSaveFileDialog_REAL(callback: SDL_DialogFileCallback, userdata: ?*anyopaque, window: ?*SDL_Window, filters: [*c]const SDL_DialogFileFilter, nfilters: c_int, default_location: [*c]const u8) void {
    @setEvalBranchQuota(100000);
    var props: SDL_PropertiesID = SDL_CreateProperties_REAL();
    _ = &props;
    _ = SDL_SetPointerProperty_REAL(props, "SDL.filedialog.filters", @ptrCast(@alignCast(@constCast(filters))));
    _ = SDL_SetNumberProperty_REAL(props, "SDL.filedialog.nfilters", nfilters);
    _ = SDL_SetPointerProperty_REAL(props, "SDL.filedialog.window", @ptrCast(@alignCast(window)));
    _ = SDL_SetStringProperty_REAL(props, "SDL.filedialog.location", default_location);
    SDL_ShowFileDialogWithProperties_REAL(SDL_FILEDIALOG_SAVEFILE, callback, userdata, props);
    SDL_DestroyProperties_REAL(props);
}
pub export fn SDL_ShowOpenFolderDialog_REAL(callback: SDL_DialogFileCallback, userdata: ?*anyopaque, window: ?*SDL_Window, default_location: [*c]const u8, allow_many: bool) void {
    @setEvalBranchQuota(100000);
    var props: SDL_PropertiesID = SDL_CreateProperties_REAL();
    _ = &props;
    _ = SDL_SetPointerProperty_REAL(props, "SDL.filedialog.window", @ptrCast(@alignCast(window)));
    _ = SDL_SetStringProperty_REAL(props, "SDL.filedialog.location", default_location);
    _ = SDL_SetBooleanProperty_REAL(props, "SDL.filedialog.many", allow_many);
    SDL_ShowFileDialogWithProperties_REAL(SDL_FILEDIALOG_OPENFOLDER, callback, userdata, props);
    SDL_DestroyProperties_REAL(props);
}

pub const SDL_FILEDIALOG_OPENFILE: c_int = 0;
pub const SDL_FILEDIALOG_SAVEFILE: c_int = 1;
pub const SDL_FILEDIALOG_OPENFOLDER: c_int = 2;
pub const enum_SDL_FileDialogType = c_uint;
pub const SDL_FileDialogType = enum_SDL_FileDialogType;
pub export fn SDL_ShowFileDialogWithProperties_REAL(arg_type: SDL_FileDialogType, callback: SDL_DialogFileCallback, userdata: ?*anyopaque, props: SDL_PropertiesID) void {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var filters: [*c]SDL_DialogFileFilter = undefined;
    _ = &filters;
    var nfilters: c_int = undefined;
    _ = &nfilters;
    var msg: [*c]const u8 = undefined;
    _ = &msg;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (!(callback != null)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                filters = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(props, "SDL.filedialog.filters", null)));
                nfilters = @truncate(SDL_GetNumberProperty_REAL(props, "SDL.filedialog.nfilters", -@as(c_int, 1)));
                if ((filters != null) and (nfilters == -@as(c_int, 1))) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                _ = SDL_SetError_REAL("Set filter pointers, but didn't set number of filters (SDL_PROP_FILE_DIALOG_NFILTERS_NUMBER)");
                callback.?(userdata, null, -@as(c_int, 1));
                return;
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                msg = validate_filters(filters, nfilters);
                if (msg != null) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                _ = SDL_SetError_REAL("Invalid dialog file filters: %s", msg);
                callback.?(userdata, null, -@as(c_int, 1));
                return;
            },
            8 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                switch (@"type") {
                    @as(SDL_FileDialogType, SDL_FILEDIALOG_OPENFILE) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(SDL_FileDialogType, SDL_FILEDIALOG_SAVEFILE) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(SDL_FileDialogType, SDL_FILEDIALOG_OPENFOLDER) => {
                        sdl_pc = 13;
                        continue;
                    },
                    else => {
                        sdl_pc = 14;
                        continue;
                    },
                }
            },
            10 => {
                {}
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
                SDL_SYS_ShowFileDialogWithProperties(@"type", callback, userdata, props);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            14 => {
                _ = SDL_SetError_REAL("Unsupported file dialog type: %d", @as(c_int, @bitCast(@"type")));
                callback.?(userdata, null, -@as(c_int, 1));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub extern fn SDL_SYS_ShowFileDialogWithProperties(@"type": SDL_FileDialogType, callback: SDL_DialogFileCallback, userdata: ?*anyopaque, props: SDL_PropertiesID) void;
pub const SDL_ShowOpenFileDialog = SDL_ShowOpenFileDialog_REAL;
pub const SDL_ShowOpenFolderDialog = SDL_ShowOpenFolderDialog_REAL;
pub const SDL_ShowSaveFileDialog = SDL_ShowSaveFileDialog_REAL;
pub const SDL_ShowFileDialogWithProperties = SDL_ShowFileDialogWithProperties_REAL;
pub extern fn validate_filters(filters: [*c]const SDL_DialogFileFilter, nfilters: c_int) [*c]const u8;
