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
pub const __off_t = c_long;
pub extern fn _Exit(__status: c_int) noreturn;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Uint32 = u32;
pub const Uint64 = u64;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_getenv_REAL(name: [*c]const u8) [*c]const u8;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
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
pub extern fn SDL_GetError_REAL() [*c]const u8;
pub extern fn SDL_ClearError_REAL() bool;
pub const SDL_PropertiesID = Uint32;
pub extern fn SDL_GetGlobalProperties_REAL() SDL_PropertiesID;
pub extern fn SDL_SetStringProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: [*c]const u8) bool;
pub extern fn SDL_GetStringProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: [*c]const u8) [*c]const u8;
pub const SDL_ThreadID = Uint64;
pub extern fn SDL_GetCurrentThreadID_REAL() SDL_ThreadID;
pub inline fn SDL_MostSignificantBitIndex32(x: Uint32) c_int {
    @setEvalBranchQuota(100000);
    if (x == @as(Uint32, 0)) {
        return -@as(c_int, 1);
    }
    return @as(c_int, 31) - __builtin.clz(x);
}
pub inline fn SDL_HasExactlyOneBitSet32(arg_x: Uint32) bool {
    @setEvalBranchQuota(100000);
    var x = arg_x;
    _ = &x;
    if ((x != 0) and (@as(Uint32, @bitCast(@as(c_int, @intFromBool(!((x & (x -% @as(Uint32, 1))) != 0))))) != 0)) {
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub extern fn SDL_GetHint_REAL(name: [*c]const u8) [*c]const u8;
pub const SDL_InitFlags = Uint32;
pub const SDL_LOG_CATEGORY_SYSTEM: c_int = 3;
pub extern fn SDL_LogInfo_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub const SDL_FORMFACTOR_UNKNOWN: c_int = 0;
pub const SDL_FORMFACTOR_DESKTOP: c_int = 1;
pub const SDL_FORMFACTOR_LAPTOP: c_int = 2;
pub const SDL_FORMFACTOR_PHONE: c_int = 3;
pub const SDL_FORMFACTOR_TABLET: c_int = 4;
pub const SDL_FORMFACTOR_CONSOLE: c_int = 5;
pub const SDL_FORMFACTOR_HANDHELD: c_int = 6;
pub const SDL_FORMFACTOR_WATCH: c_int = 7;
pub const SDL_FORMFACTOR_TV: c_int = 8;
pub const SDL_FORMFACTOR_HEADSET: c_int = 9;
pub const SDL_FORMFACTOR_CAR: c_int = 10;
pub const enum_SDL_FormFactor = c_uint;
pub const SDL_FormFactor = enum_SDL_FormFactor;
pub const SDL_SANDBOX_NONE: c_int = 0;
pub const SDL_SANDBOX_UNKNOWN_CONTAINER: c_int = 1;
pub const SDL_SANDBOX_FLATPAK: c_int = 2;
pub const SDL_SANDBOX_SNAP: c_int = 3;
pub const SDL_SANDBOX_LOMIRI: c_int = 5;
pub const enum_SDL_Sandbox = c_uint;
pub const SDL_Sandbox = enum_SDL_Sandbox;
pub extern fn SDL_IsUbuntuTouch_REAL() bool;
pub extern fn SDL_SetObjectsInvalid() void;
pub extern fn SDL_GetExeName() [*c]const u8;
pub extern fn access(__name: [*c]const u8, __type: c_int) c_int;
pub extern fn truncate(__file: [*c]const u8, __length: __off_t) c_int;
pub extern fn SDL_DBus_Init() void;
pub extern fn SDL_DBus_Quit() void;
pub extern fn SDL_AssertionsQuit() void;
pub extern fn SDL_QuitHints() void;
pub extern fn SDL_QuitLog() void;
pub extern fn SDL_QuitProperties() void;
pub extern fn SDL_InitAudio(driver_name: [*c]const u8) bool;
pub extern fn SDL_QuitAudio() void;
pub extern fn SDL_InitCamera(driver_name: [*c]const u8) bool;
pub extern fn SDL_QuitCamera() void;
pub extern fn SDL_QuitCPUInfo() void;
pub extern fn SDL_CreateEventLock() void;
pub extern fn SDL_DestroyEventLock() void;
pub extern fn SDL_InitEvents() bool;
pub extern fn SDL_QuitEvents() void;
pub extern fn SDL_InitFilesystem() void;
pub extern fn SDL_QuitFilesystem() void;
pub extern fn SDL_InitHaptics() bool;
pub extern fn SDL_QuitHaptics() void;
pub extern fn SDL_QuitAsyncIO() void;
pub extern fn SDL_InitGamepads() bool;
pub extern fn SDL_QuitGamepads() void;
pub extern fn SDL_InitJoysticks() bool;
pub extern fn SDL_QuitJoysticks() void;
pub extern fn SDL_CleanupNotifications() void;
pub extern fn SDL_QuitRender() void;
pub extern fn SDL_InitSensors() bool;
pub extern fn SDL_QuitSensors() void;
pub extern fn SDL_InitEnvironment() bool;
pub extern fn SDL_QuitEnvironment() void;
pub extern fn SDL_InitTLSData() void;
pub extern fn SDL_QuitTLSData() void;
pub extern fn SDL_CleanupTrays() void;
pub extern fn SDL_QuitPixelFormatDetails() void;
pub extern fn SDL_InitVideo(driver_name: [*c]const u8) bool;
pub extern fn SDL_QuitVideo() void;
pub extern fn SDL_InitTicks() void;
pub extern fn SDL_QuitTicks() void;
pub extern fn SDL_QuitTimers() void;
pub export fn SDL_ExitProcess(exitcode: c_int) noreturn {
    @setEvalBranchQuota(100000);
    _Exit(exitcode);
}
pub export fn SDL_SetAppMetadata_REAL(appname: [*c]const u8, appversion: [*c]const u8, appidentifier: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    _ = SDL_SetAppMetadataProperty_REAL("SDL.app.metadata.name", appname);
    _ = SDL_SetAppMetadataProperty_REAL("SDL.app.metadata.version", appversion);
    _ = SDL_SetAppMetadataProperty_REAL("SDL.app.metadata.identifier", appidentifier);
    return @"true" != 0;
}
pub fn SDL_ValidMetadataProperty(name: [*c]const u8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (!(name != null) or !(@as(c_int, name.*) != 0)) {
        return @"false" != 0;
    }
    if (((((((SDL_strcmp_REAL(name, "SDL.app.metadata.name") == @as(c_int, 0)) or (SDL_strcmp_REAL(name, "SDL.app.metadata.version") == @as(c_int, 0))) or (SDL_strcmp_REAL(name, "SDL.app.metadata.identifier") == @as(c_int, 0))) or (SDL_strcmp_REAL(name, "SDL.app.metadata.creator") == @as(c_int, 0))) or (SDL_strcmp_REAL(name, "SDL.app.metadata.copyright") == @as(c_int, 0))) or (SDL_strcmp_REAL(name, "SDL.app.metadata.url") == @as(c_int, 0))) or (SDL_strcmp_REAL(name, "SDL.app.metadata.type") == @as(c_int, 0))) {
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub export fn SDL_SetAppMetadataProperty_REAL(name: [*c]const u8, value: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    if (!SDL_ValidMetadataProperty(name)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("name"))));
    }
    return SDL_SetStringProperty_REAL(SDL_GetGlobalProperties_REAL(), name, value);
}
pub export fn SDL_GetAppMetadataProperty_REAL(name: [*c]const u8) [*c]const u8 {
    @setEvalBranchQuota(100000);
    if (!SDL_ValidMetadataProperty(name)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("name"))));
        return null;
    }
    var value: [*c]const u8 = null;
    _ = &value;
    if (SDL_strcmp_REAL(name, "SDL.app.metadata.name") == @as(c_int, 0)) {
        value = SDL_GetHint_REAL("SDL_APP_NAME");
    } else if (SDL_strcmp_REAL(name, "SDL.app.metadata.identifier") == @as(c_int, 0)) {
        value = SDL_GetHint_REAL("SDL_APP_ID");
    }
    if (!(value != null) or !(@as(c_int, value.*) != 0)) {
        value = SDL_GetStringProperty_REAL(SDL_GetGlobalProperties_REAL(), name, null);
    }
    if (!(value != null) or !(@as(c_int, value.*) != 0)) {
        if (SDL_IsUbuntuTouch_REAL()) {
            if (SDL_strcmp_REAL(name, "SDL.app.metadata.identifier") == @as(c_int, 0)) {
                value = SDL_GetStringProperty_REAL(SDL_GetGlobalProperties_REAL(), "SDL.system.ubuntu_touch.appid", null);
            } else if (SDL_strcmp_REAL(name, "SDL.app.metadata.version") == @as(c_int, 0)) {
                value = SDL_GetStringProperty_REAL(SDL_GetGlobalProperties_REAL(), "SDL.system.ubuntu_touch.app_version", null);
            }
        }
        if (SDL_strcmp_REAL(name, "SDL.app.metadata.name") == @as(c_int, 0)) {
            value = SDL_GetExeName();
            if (!(value != null)) {
                value = "SDL Application";
            }
        } else if (SDL_strcmp_REAL(name, "SDL.app.metadata.type") == @as(c_int, 0)) {
            value = "application";
        }
    }
    return value;
}
pub var SDL_MainIsReady: bool = @"true" != 0;
pub var SDL_MainThreadID: SDL_ThreadID = 0;
pub var SDL_EventsThreadID: SDL_ThreadID = 0;
pub var SDL_VideoThreadID: SDL_ThreadID = 0;
pub var SDL_bInMainQuit: bool = @"false" != 0;
pub var SDL_SubsystemRefCount: [32]Uint8 = @import("std").mem.zeroes([32]Uint8);
pub fn SDL_IncrementSubsystemRefCount(subsystem: Uint32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [30:0]u8 = "SDL_IncrementSubsystemRefCount".*;
    };
    _ = &static_local___func__;
    const subsystem_index: c_int = SDL_MostSignificantBitIndex32(subsystem);
    _ = &subsystem_index;
    while (true) {
        while (!((subsystem_index < @as(c_int, 0)) or (@as(c_int, SDL_SubsystemRefCount[@bitCast(@as(isize, @intCast(subsystem_index)))]) < @as(c_int, 255)))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "(subsystem_index < 0) || (SDL_SubsystemRefCount[subsystem_index] < 255)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL.c", 214);
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
    if (subsystem_index >= @as(c_int, 0)) {
        SDL_SubsystemRefCount[@bitCast(@as(isize, @intCast(subsystem_index)))] +%= 1;
    }
}
pub fn SDL_DecrementSubsystemRefCount(subsystem: Uint32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const subsystem_index: c_int = SDL_MostSignificantBitIndex32(subsystem);
    _ = &subsystem_index;
    if ((subsystem_index >= @as(c_int, 0)) and (@as(c_int, SDL_SubsystemRefCount[@bitCast(@as(isize, @intCast(subsystem_index)))]) > @as(c_int, 0))) {
        if (SDL_bInMainQuit) {
            SDL_SubsystemRefCount[@bitCast(@as(isize, @intCast(subsystem_index)))] = 0;
        } else {
            SDL_SubsystemRefCount[@bitCast(@as(isize, @intCast(subsystem_index)))] -%= 1;
        }
    }
}
pub fn SDL_ShouldInitSubsystem(subsystem: Uint32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [23:0]u8 = "SDL_ShouldInitSubsystem".*;
    };
    _ = &static_local___func__;
    const subsystem_index: c_int = SDL_MostSignificantBitIndex32(subsystem);
    _ = &subsystem_index;
    while (true) {
        while (!((subsystem_index < @as(c_int, 0)) or (@as(c_int, SDL_SubsystemRefCount[@bitCast(@as(isize, @intCast(subsystem_index)))]) < @as(c_int, 255)))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "(subsystem_index < 0) || (SDL_SubsystemRefCount[subsystem_index] < 255)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL.c", 237);
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
    return (subsystem_index >= @as(c_int, 0)) and (@as(c_int, SDL_SubsystemRefCount[@bitCast(@as(isize, @intCast(subsystem_index)))]) == @as(c_int, 0));
}
pub fn SDL_ShouldQuitSubsystem(subsystem: Uint32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const subsystem_index: c_int = SDL_MostSignificantBitIndex32(subsystem);
    _ = &subsystem_index;
    if ((subsystem_index >= @as(c_int, 0)) and (@as(c_int, SDL_SubsystemRefCount[@bitCast(@as(isize, @intCast(subsystem_index)))]) == @as(c_int, 0))) {
        return @"false" != 0;
    }
    return ((subsystem_index >= @as(c_int, 0)) and (@as(c_int, SDL_SubsystemRefCount[@bitCast(@as(isize, @intCast(subsystem_index)))]) == @as(c_int, 1))) or SDL_bInMainQuit;
}
pub fn SDL_InitOrIncrementSubsystem(subsystem: Uint32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [28:0]u8 = "SDL_InitOrIncrementSubsystem".*;
    };
    _ = &static_local___func__;
    var subsystem_index: c_int = SDL_MostSignificantBitIndex32(subsystem);
    _ = &subsystem_index;
    while (true) {
        while (!((subsystem_index < @as(c_int, 0)) or (@as(c_int, SDL_SubsystemRefCount[@bitCast(@as(isize, @intCast(subsystem_index)))]) < @as(c_int, 255)))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "(subsystem_index < 0) || (SDL_SubsystemRefCount[subsystem_index] < 255)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL.c", 261);
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
    if (subsystem_index < @as(c_int, 0)) {
        return @"false" != 0;
    }
    if (@as(c_int, SDL_SubsystemRefCount[@bitCast(@as(isize, @intCast(subsystem_index)))]) > @as(c_int, 0)) {
        SDL_SubsystemRefCount[@bitCast(@as(isize, @intCast(subsystem_index)))] +%= 1;
        return @"true" != 0;
    }
    return SDL_InitSubSystem_REAL(subsystem);
}
pub export fn SDL_SetMainReady_REAL() void {
    @setEvalBranchQuota(100000);
    SDL_MainIsReady = @"true" != 0;
    if (SDL_MainThreadID == @as(SDL_ThreadID, 0)) {
        SDL_MainThreadID = SDL_GetCurrentThreadID_REAL();
    }
}
pub export fn SDL_IsMainThread_REAL() bool {
    @setEvalBranchQuota(100000);
    if (SDL_VideoThreadID != 0) {
        return SDL_GetCurrentThreadID_REAL() == SDL_VideoThreadID;
    }
    if (SDL_EventsThreadID != 0) {
        return SDL_GetCurrentThreadID_REAL() == SDL_EventsThreadID;
    }
    if (SDL_MainThreadID != 0) {
        return SDL_GetCurrentThreadID_REAL() == SDL_MainThreadID;
    }
    return @"true" != 0;
}
pub export fn SDL_IsVideoThread() bool {
    @setEvalBranchQuota(100000);
    return SDL_GetCurrentThreadID_REAL() == SDL_VideoThreadID;
}
pub export fn SDL_InitMainThread() void {
    @setEvalBranchQuota(100000);
    const static_local_done_info = struct {
        var done_info: bool = @"false" != 0;
    };
    _ = &static_local_done_info;
    if (SDL_MainThreadID == @as(SDL_ThreadID, 0)) {
        SDL_MainThreadID = SDL_GetCurrentThreadID_REAL();
    }
    SDL_InitTLSData();
    _ = SDL_InitEnvironment();
    SDL_InitTicks();
    SDL_InitFilesystem();
    SDL_CreateEventLock();
    if (!static_local_done_info.done_info) {
        var value: [*c]const u8 = undefined;
        _ = &value;
        value = SDL_GetAppMetadataProperty_REAL("SDL.app.metadata.name");
        SDL_LogInfo_REAL(SDL_LOG_CATEGORY_SYSTEM, "App name: %s", if (value != null) value else @as([*c]const u8, @ptrCast(@alignCast(@as([*c]u8, @as([*c]u8, @constCast("<unspecified>")))))));
        value = SDL_GetAppMetadataProperty_REAL("SDL.app.metadata.version");
        SDL_LogInfo_REAL(SDL_LOG_CATEGORY_SYSTEM, "App version: %s", if (value != null) value else @as([*c]const u8, @ptrCast(@alignCast(@as([*c]u8, @as([*c]u8, @constCast("<unspecified>")))))));
        value = SDL_GetAppMetadataProperty_REAL("SDL.app.metadata.identifier");
        SDL_LogInfo_REAL(SDL_LOG_CATEGORY_SYSTEM, "App ID: %s", if (value != null) value else @as([*c]const u8, @ptrCast(@alignCast(@as([*c]u8, @as([*c]u8, @constCast("<unspecified>")))))));
        SDL_LogInfo_REAL(SDL_LOG_CATEGORY_SYSTEM, "SDL revision: %s", @as([*c]u8, @as([*c]u8, @constCast("SDL-3.5.0-341496b"))));
        static_local_done_info.done_info = @"true" != 0;
    }
}
pub fn SDL_QuitMainThread() callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_DestroyEventLock();
    SDL_QuitFilesystem();
    SDL_QuitTicks();
    SDL_QuitEnvironment();
    SDL_QuitTLSData();
}
pub export fn SDL_InitSubSystem_REAL(flags: SDL_InitFlags) bool {
    @setEvalBranchQuota(100000);
    var flags_initialized: Uint32 = undefined;
    _ = &flags_initialized;
    var saved_error: [*c]u8 = undefined;
    _ = &saved_error;
    var saved_error_1: [*c]u8 = undefined;
    _ = &saved_error_1;
    var saved_error_2: [*c]u8 = undefined;
    _ = &saved_error_2;
    var saved_error_3: [*c]u8 = undefined;
    _ = &saved_error_3;
    var saved_error_4: [*c]u8 = undefined;
    _ = &saved_error_4;
    var saved_error_5: [*c]u8 = undefined;
    _ = &saved_error_5;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                flags_initialized = 0;
                if (!SDL_MainIsReady) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                {
                    sdl_pc = 122;
                    continue;
                }
            },
            2 => {
                return SDL_SetError_REAL("Application didn't initialize properly, did you include SDL_main.h in the file containing your main() function?");
            },
            3 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                SDL_InitMainThread();
                SDL_DBus_Init();
                if ((flags & SDL_INIT_EVENTS) != 0) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                if (SDL_ShouldInitSubsystem(SDL_INIT_EVENTS)) {
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
                if ((flags & SDL_INIT_VIDEO) != 0) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            8 => {
                SDL_IncrementSubsystemRefCount(SDL_INIT_EVENTS);
                SDL_EventsThreadID = SDL_GetCurrentThreadID_REAL();
                if (!SDL_InitEvents()) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            9 => {
                SDL_IncrementSubsystemRefCount(SDL_INIT_EVENTS);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                flags_initialized |= SDL_INIT_EVENTS;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            11 => {
                SDL_DecrementSubsystemRefCount(SDL_INIT_EVENTS);
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
                if (SDL_ShouldInitSubsystem(SDL_INIT_VIDEO)) {
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
                if ((flags & SDL_INIT_AUDIO) != 0) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            17 => {
                if (!SDL_InitOrIncrementSubsystem(SDL_INIT_EVENTS)) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            18 => {
                SDL_IncrementSubsystemRefCount(SDL_INIT_VIDEO);
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            19 => {
                flags_initialized |= SDL_INIT_VIDEO;
                {
                    sdl_pc = 16;
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
                SDL_IncrementSubsystemRefCount(SDL_INIT_VIDEO);
                SDL_VideoThreadID = SDL_GetCurrentThreadID_REAL();
                if (!SDL_InitVideo(null)) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                SDL_DecrementSubsystemRefCount(SDL_INIT_VIDEO);
                {
                    sdl_pc = 26;
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
                    sdl_pc = 19;
                    continue;
                }
            },
            26 => {
                saved_error = SDL_strdup_REAL(SDL_GetError_REAL());
                SDL_QuitSubSystem_REAL(SDL_INIT_EVENTS);
                if (saved_error != null) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            27 => {
                if (false) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            28 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            29 => {
                _ = SDL_SetError_REAL("%s", saved_error);
                SDL_free_REAL(@ptrCast(@alignCast(saved_error)));
                {
                    sdl_pc = 31;
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
                    sdl_pc = 27;
                    continue;
                }
            },
            32 => {
                if (SDL_ShouldInitSubsystem(SDL_INIT_AUDIO)) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
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
                if ((flags & SDL_INIT_JOYSTICK) != 0) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            35 => {
                if (!SDL_InitOrIncrementSubsystem(SDL_INIT_EVENTS)) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
                    continue;
                }
            },
            36 => {
                SDL_IncrementSubsystemRefCount(SDL_INIT_AUDIO);
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            37 => {
                flags_initialized |= SDL_INIT_AUDIO;
                {
                    sdl_pc = 34;
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
                SDL_IncrementSubsystemRefCount(SDL_INIT_AUDIO);
                if (!SDL_InitAudio(null)) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            41 => {
                SDL_DecrementSubsystemRefCount(SDL_INIT_AUDIO);
                {
                    sdl_pc = 44;
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
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            44 => {
                saved_error_1 = SDL_strdup_REAL(SDL_GetError_REAL());
                SDL_QuitSubSystem_REAL(SDL_INIT_EVENTS);
                if (saved_error_1 != null) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            45 => {
                if (false) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 46;
                    continue;
                }
            },
            46 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            47 => {
                _ = SDL_SetError_REAL("%s", saved_error_1);
                SDL_free_REAL(@ptrCast(@alignCast(saved_error_1)));
                {
                    sdl_pc = 49;
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
                    sdl_pc = 45;
                    continue;
                }
            },
            50 => {
                if (SDL_ShouldInitSubsystem(SDL_INIT_JOYSTICK)) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 54;
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
                if ((flags & SDL_INIT_GAMEPAD) != 0) {
                    sdl_pc = 68;
                    continue;
                } else {
                    sdl_pc = 69;
                    continue;
                }
            },
            53 => {
                if (!SDL_InitOrIncrementSubsystem(SDL_INIT_EVENTS)) {
                    sdl_pc = 56;
                    continue;
                } else {
                    sdl_pc = 57;
                    continue;
                }
            },
            54 => {
                SDL_IncrementSubsystemRefCount(SDL_INIT_JOYSTICK);
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            55 => {
                flags_initialized |= SDL_INIT_JOYSTICK;
                {
                    sdl_pc = 52;
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
                SDL_IncrementSubsystemRefCount(SDL_INIT_JOYSTICK);
                if (!SDL_InitJoysticks()) {
                    sdl_pc = 59;
                    continue;
                } else {
                    sdl_pc = 60;
                    continue;
                }
            },
            59 => {
                SDL_DecrementSubsystemRefCount(SDL_INIT_JOYSTICK);
                {
                    sdl_pc = 62;
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
                    sdl_pc = 55;
                    continue;
                }
            },
            62 => {
                saved_error_2 = SDL_strdup_REAL(SDL_GetError_REAL());
                SDL_QuitSubSystem_REAL(SDL_INIT_EVENTS);
                if (saved_error_2 != null) {
                    sdl_pc = 65;
                    continue;
                } else {
                    sdl_pc = 66;
                    continue;
                }
            },
            63 => {
                if (false) {
                    sdl_pc = 62;
                    continue;
                } else {
                    sdl_pc = 64;
                    continue;
                }
            },
            64 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            65 => {
                _ = SDL_SetError_REAL("%s", saved_error_2);
                SDL_free_REAL(@ptrCast(@alignCast(saved_error_2)));
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
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            68 => {
                if (SDL_ShouldInitSubsystem(SDL_INIT_GAMEPAD)) {
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
                if ((flags & SDL_INIT_HAPTIC) != 0) {
                    sdl_pc = 86;
                    continue;
                } else {
                    sdl_pc = 87;
                    continue;
                }
            },
            71 => {
                if (!SDL_InitOrIncrementSubsystem(SDL_INIT_JOYSTICK)) {
                    sdl_pc = 74;
                    continue;
                } else {
                    sdl_pc = 75;
                    continue;
                }
            },
            72 => {
                SDL_IncrementSubsystemRefCount(SDL_INIT_GAMEPAD);
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            73 => {
                flags_initialized |= SDL_INIT_GAMEPAD;
                {
                    sdl_pc = 70;
                    continue;
                }
            },
            74 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            75 => {
                {
                    sdl_pc = 76;
                    continue;
                }
            },
            76 => {
                SDL_IncrementSubsystemRefCount(SDL_INIT_GAMEPAD);
                if (!SDL_InitGamepads()) {
                    sdl_pc = 77;
                    continue;
                } else {
                    sdl_pc = 78;
                    continue;
                }
            },
            77 => {
                SDL_DecrementSubsystemRefCount(SDL_INIT_GAMEPAD);
                {
                    sdl_pc = 80;
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
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            80 => {
                saved_error_3 = SDL_strdup_REAL(SDL_GetError_REAL());
                SDL_QuitSubSystem_REAL(SDL_INIT_JOYSTICK);
                if (saved_error_3 != null) {
                    sdl_pc = 83;
                    continue;
                } else {
                    sdl_pc = 84;
                    continue;
                }
            },
            81 => {
                if (false) {
                    sdl_pc = 80;
                    continue;
                } else {
                    sdl_pc = 82;
                    continue;
                }
            },
            82 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            83 => {
                _ = SDL_SetError_REAL("%s", saved_error_3);
                SDL_free_REAL(@ptrCast(@alignCast(saved_error_3)));
                {
                    sdl_pc = 85;
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
                {
                    sdl_pc = 81;
                    continue;
                }
            },
            86 => {
                if (SDL_ShouldInitSubsystem(SDL_INIT_HAPTIC)) {
                    sdl_pc = 89;
                    continue;
                } else {
                    sdl_pc = 90;
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
                if ((flags & SDL_INIT_SENSOR) != 0) {
                    sdl_pc = 95;
                    continue;
                } else {
                    sdl_pc = 96;
                    continue;
                }
            },
            89 => {
                SDL_IncrementSubsystemRefCount(SDL_INIT_HAPTIC);
                if (!SDL_InitHaptics()) {
                    sdl_pc = 92;
                    continue;
                } else {
                    sdl_pc = 93;
                    continue;
                }
            },
            90 => {
                SDL_IncrementSubsystemRefCount(SDL_INIT_HAPTIC);
                {
                    sdl_pc = 91;
                    continue;
                }
            },
            91 => {
                flags_initialized |= SDL_INIT_HAPTIC;
                {
                    sdl_pc = 88;
                    continue;
                }
            },
            92 => {
                SDL_DecrementSubsystemRefCount(SDL_INIT_HAPTIC);
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
                {
                    sdl_pc = 91;
                    continue;
                }
            },
            95 => {
                if (SDL_ShouldInitSubsystem(SDL_INIT_SENSOR)) {
                    sdl_pc = 98;
                    continue;
                } else {
                    sdl_pc = 99;
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
                if ((flags & SDL_INIT_CAMERA) != 0) {
                    sdl_pc = 104;
                    continue;
                } else {
                    sdl_pc = 105;
                    continue;
                }
            },
            98 => {
                SDL_IncrementSubsystemRefCount(SDL_INIT_SENSOR);
                if (!SDL_InitSensors()) {
                    sdl_pc = 101;
                    continue;
                } else {
                    sdl_pc = 102;
                    continue;
                }
            },
            99 => {
                SDL_IncrementSubsystemRefCount(SDL_INIT_SENSOR);
                {
                    sdl_pc = 100;
                    continue;
                }
            },
            100 => {
                flags_initialized |= SDL_INIT_SENSOR;
                {
                    sdl_pc = 97;
                    continue;
                }
            },
            101 => {
                SDL_DecrementSubsystemRefCount(SDL_INIT_SENSOR);
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
                {
                    sdl_pc = 100;
                    continue;
                }
            },
            104 => {
                if (SDL_ShouldInitSubsystem(SDL_INIT_CAMERA)) {
                    sdl_pc = 107;
                    continue;
                } else {
                    sdl_pc = 108;
                    continue;
                }
            },
            105 => {
                {
                    sdl_pc = 106;
                    continue;
                }
            },
            106 => {
                _ = &flags_initialized;
                return SDL_ClearError_REAL();
            },
            107 => {
                if (!SDL_InitOrIncrementSubsystem(SDL_INIT_EVENTS)) {
                    sdl_pc = 110;
                    continue;
                } else {
                    sdl_pc = 111;
                    continue;
                }
            },
            108 => {
                SDL_IncrementSubsystemRefCount(SDL_INIT_CAMERA);
                {
                    sdl_pc = 109;
                    continue;
                }
            },
            109 => {
                flags_initialized |= SDL_INIT_CAMERA;
                {
                    sdl_pc = 106;
                    continue;
                }
            },
            110 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            111 => {
                {
                    sdl_pc = 112;
                    continue;
                }
            },
            112 => {
                SDL_IncrementSubsystemRefCount(SDL_INIT_CAMERA);
                if (!SDL_InitCamera(null)) {
                    sdl_pc = 113;
                    continue;
                } else {
                    sdl_pc = 114;
                    continue;
                }
            },
            113 => {
                SDL_DecrementSubsystemRefCount(SDL_INIT_CAMERA);
                {
                    sdl_pc = 116;
                    continue;
                }
            },
            114 => {
                {
                    sdl_pc = 115;
                    continue;
                }
            },
            115 => {
                {
                    sdl_pc = 109;
                    continue;
                }
            },
            116 => {
                saved_error_4 = SDL_strdup_REAL(SDL_GetError_REAL());
                SDL_QuitSubSystem_REAL(SDL_INIT_EVENTS);
                if (saved_error_4 != null) {
                    sdl_pc = 119;
                    continue;
                } else {
                    sdl_pc = 120;
                    continue;
                }
            },
            117 => {
                if (false) {
                    sdl_pc = 116;
                    continue;
                } else {
                    sdl_pc = 118;
                    continue;
                }
            },
            118 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            119 => {
                _ = SDL_SetError_REAL("%s", saved_error_4);
                SDL_free_REAL(@ptrCast(@alignCast(saved_error_4)));
                {
                    sdl_pc = 121;
                    continue;
                }
            },
            120 => {
                {
                    sdl_pc = 121;
                    continue;
                }
            },
            121 => {
                {
                    sdl_pc = 117;
                    continue;
                }
            },
            122 => {
                saved_error_5 = SDL_strdup_REAL(SDL_GetError_REAL());
                SDL_QuitSubSystem_REAL(flags_initialized);
                if (saved_error_5 != null) {
                    sdl_pc = 125;
                    continue;
                } else {
                    sdl_pc = 126;
                    continue;
                }
            },
            123 => {
                if (false) {
                    sdl_pc = 122;
                    continue;
                } else {
                    sdl_pc = 124;
                    continue;
                }
            },
            124 => {
                return @"false" != 0;
            },
            125 => {
                _ = SDL_SetError_REAL("%s", saved_error_5);
                SDL_free_REAL(@ptrCast(@alignCast(saved_error_5)));
                {
                    sdl_pc = 127;
                    continue;
                }
            },
            126 => {
                {
                    sdl_pc = 127;
                    continue;
                }
            },
            127 => {
                {
                    sdl_pc = 123;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_Init_REAL(flags: SDL_InitFlags) bool {
    @setEvalBranchQuota(100000);
    return SDL_InitSubSystem_REAL(flags);
}
pub export fn SDL_QuitSubSystem_REAL(flags: SDL_InitFlags) void {
    @setEvalBranchQuota(100000);
    if ((flags & SDL_INIT_CAMERA) != 0) {
        if (SDL_ShouldQuitSubsystem(SDL_INIT_CAMERA)) {
            SDL_QuitCamera();
            SDL_QuitSubSystem_REAL(SDL_INIT_EVENTS);
        }
        SDL_DecrementSubsystemRefCount(SDL_INIT_CAMERA);
    }
    if ((flags & SDL_INIT_SENSOR) != 0) {
        if (SDL_ShouldQuitSubsystem(SDL_INIT_SENSOR)) {
            SDL_QuitSensors();
        }
        SDL_DecrementSubsystemRefCount(SDL_INIT_SENSOR);
    }
    if ((flags & SDL_INIT_GAMEPAD) != 0) {
        if (SDL_ShouldQuitSubsystem(SDL_INIT_GAMEPAD)) {
            SDL_QuitGamepads();
            SDL_QuitSubSystem_REAL(SDL_INIT_JOYSTICK);
        }
        SDL_DecrementSubsystemRefCount(SDL_INIT_GAMEPAD);
    }
    if ((flags & SDL_INIT_JOYSTICK) != 0) {
        if (SDL_ShouldQuitSubsystem(SDL_INIT_JOYSTICK)) {
            SDL_QuitJoysticks();
            SDL_QuitSubSystem_REAL(SDL_INIT_EVENTS);
        }
        SDL_DecrementSubsystemRefCount(SDL_INIT_JOYSTICK);
    }
    if ((flags & SDL_INIT_HAPTIC) != 0) {
        if (SDL_ShouldQuitSubsystem(SDL_INIT_HAPTIC)) {
            SDL_QuitHaptics();
        }
        SDL_DecrementSubsystemRefCount(SDL_INIT_HAPTIC);
    }
    if ((flags & SDL_INIT_AUDIO) != 0) {
        if (SDL_ShouldQuitSubsystem(SDL_INIT_AUDIO)) {
            SDL_QuitAudio();
            SDL_QuitSubSystem_REAL(SDL_INIT_EVENTS);
        }
        SDL_DecrementSubsystemRefCount(SDL_INIT_AUDIO);
    }
    if ((flags & SDL_INIT_VIDEO) != 0) {
        if (SDL_ShouldQuitSubsystem(SDL_INIT_VIDEO)) {
            SDL_QuitRender();
            SDL_QuitVideo();
            SDL_VideoThreadID = 0;
            SDL_QuitSubSystem_REAL(SDL_INIT_EVENTS);
        }
        SDL_DecrementSubsystemRefCount(SDL_INIT_VIDEO);
    }
    if ((flags & SDL_INIT_EVENTS) != 0) {
        if (SDL_ShouldQuitSubsystem(SDL_INIT_EVENTS)) {
            SDL_QuitEvents();
            SDL_EventsThreadID = 0;
        }
        SDL_DecrementSubsystemRefCount(SDL_INIT_EVENTS);
    }
}
pub export fn SDL_WasInit_REAL(arg_flags: SDL_InitFlags) Uint32 {
    @setEvalBranchQuota(100000);
    var flags = arg_flags;
    _ = &flags;
    var i: c_int = undefined;
    _ = &i;
    var num_subsystems: c_int = @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(SDL_SubsystemRefCount)) / @sizeOf(@TypeOf(SDL_SubsystemRefCount[@as(c_int, 0)])))));
    _ = &num_subsystems;
    var initialized: Uint32 = 0;
    _ = &initialized;
    if (SDL_HasExactlyOneBitSet32(flags)) {
        var subsystem_index: c_int = SDL_MostSignificantBitIndex32(flags);
        _ = &subsystem_index;
        return if (SDL_SubsystemRefCount[@bitCast(@as(isize, @intCast(subsystem_index)))] != 0) flags else @as(SDL_InitFlags, 0);
    }
    if (!(flags != 0)) {
        flags = ~@as(c_uint, 0);
    }
    num_subsystems = if (num_subsystems < (SDL_MostSignificantBitIndex32(flags) + @as(c_int, 1))) num_subsystems else SDL_MostSignificantBitIndex32(flags) + @as(c_int, 1);
    {
        i = 0;
        while (i < num_subsystems) : (i += 1) {
            if (((flags & @as(SDL_InitFlags, 1)) != 0) and (@as(SDL_InitFlags, @bitCast(@as(c_int, @intFromBool(@as(c_int, SDL_SubsystemRefCount[@bitCast(@as(isize, @intCast(i)))]) > @as(c_int, 0))))) != 0)) {
                initialized |= @bitCast(@as(c_int, @as(c_int, 1) << @intCast(i)));
            }
            flags >>= @intCast(@as(SDL_InitFlags, 1));
        }
    }
    return initialized;
}
pub export fn SDL_Quit_REAL() void {
    @setEvalBranchQuota(100000);
    SDL_bInMainQuit = @"true" != 0;
    SDL_QuitSubSystem_REAL(~@as(c_uint, 0));
    SDL_CleanupTrays();
    SDL_CleanupNotifications();
    SDL_DBus_Quit();
    SDL_QuitTimers();
    SDL_QuitAsyncIO();
    SDL_SetObjectsInvalid();
    SDL_AssertionsQuit();
    SDL_QuitPixelFormatDetails();
    SDL_QuitCPUInfo();
    _ = memset(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&SDL_SubsystemRefCount))))), 0, @sizeOf(@TypeOf(SDL_SubsystemRefCount)));
    SDL_QuitLog();
    SDL_QuitHints();
    SDL_QuitProperties();
    SDL_QuitMainThread();
    SDL_bInMainQuit = @"false" != 0;
}
pub export fn SDL_GetVersion_REAL() c_int {
    @setEvalBranchQuota(100000);
    return ((SDL_MAJOR_VERSION * @as(c_int, 1000000)) + (SDL_MINOR_VERSION * @as(c_int, 1000))) + SDL_MICRO_VERSION;
}
pub export fn SDL_GetRevision_REAL() [*c]const u8 {
    @setEvalBranchQuota(100000);
    return "SDL-3.5.0-341496b";
}
pub export fn SDL_GetPlatform_REAL() [*c]const u8 {
    @setEvalBranchQuota(100000);
    return "Linux";
}
pub export fn SDL_IsPhone_REAL() bool {
    @setEvalBranchQuota(100000);
    return SDL_GetDeviceFormFactor_REAL() == @as(SDL_FormFactor, SDL_FORMFACTOR_PHONE);
}
pub export fn SDL_IsTablet_REAL() bool {
    @setEvalBranchQuota(100000);
    return SDL_GetDeviceFormFactor_REAL() == @as(SDL_FormFactor, SDL_FORMFACTOR_TABLET);
}
pub export fn SDL_IsTV_REAL() bool {
    @setEvalBranchQuota(100000);
    return SDL_GetDeviceFormFactor_REAL() == @as(SDL_FormFactor, SDL_FORMFACTOR_TV);
}
pub export fn SDL_GetDeviceFormFactor_REAL() SDL_FormFactor {
    @setEvalBranchQuota(100000);
    return SDL_FORMFACTOR_DESKTOP;
}
pub export fn SDL_GetDeviceFormFactorName_REAL(form_factor: SDL_FormFactor) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (form_factor) {
                    @as(SDL_FormFactor, SDL_FORMFACTOR_UNKNOWN) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SDL_FormFactor, SDL_FORMFACTOR_DESKTOP) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(SDL_FormFactor, SDL_FORMFACTOR_LAPTOP) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_FormFactor, SDL_FORMFACTOR_PHONE) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(SDL_FormFactor, SDL_FORMFACTOR_TABLET) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(SDL_FormFactor, SDL_FORMFACTOR_CONSOLE) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(SDL_FormFactor, SDL_FORMFACTOR_HANDHELD) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(SDL_FormFactor, SDL_FORMFACTOR_WATCH) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(SDL_FormFactor, SDL_FORMFACTOR_TV) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(SDL_FormFactor, SDL_FORMFACTOR_HEADSET) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(SDL_FormFactor, SDL_FORMFACTOR_CAR) => {
                        sdl_pc = 13;
                        continue;
                    },
                    else => {
                        sdl_pc = 2;
                        continue;
                    },
                }
            },
            1 => {
                return undefined;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                return "SDL_FORMFACTOR_UNKNOWN";
            },
            4 => {
                return "SDL_FORMFACTOR_DESKTOP";
            },
            5 => {
                return "SDL_FORMFACTOR_LAPTOP";
            },
            6 => {
                return "SDL_FORMFACTOR_PHONE";
            },
            7 => {
                return "SDL_FORMFACTOR_TABLET";
            },
            8 => {
                return "SDL_FORMFACTOR_CONSOLE";
            },
            9 => {
                return "SDL_FORMFACTOR_HANDHELD";
            },
            10 => {
                return "SDL_FORMFACTOR_WATCH";
            },
            11 => {
                return "SDL_FORMFACTOR_TV";
            },
            12 => {
                return "SDL_FORMFACTOR_HEADSET";
            },
            13 => {
                return "SDL_FORMFACTOR_CAR";
            },
            else => unreachable,
        }
    }
}
pub fn SDL_DetectSandbox() callconv(.c) SDL_Sandbox {
    @setEvalBranchQuota(100000);
    if (access("/.flatpak-info", F_OK) == @as(c_int, 0)) {
        return SDL_SANDBOX_FLATPAK;
    }
    if (((SDL_getenv_REAL("SNAP") != null) and (SDL_getenv_REAL("SNAP_NAME") != null)) and (SDL_getenv_REAL("SNAP_REVISION") != null)) {
        return SDL_SANDBOX_SNAP;
    }
    if ((SDL_getenv_REAL("LOMIRI_APPLICATION_ISOLATION") != null) or (SDL_getenv_REAL("CLICKABLE_DESKTOP_MODE") != null)) {
        return SDL_SANDBOX_LOMIRI;
    }
    if (access("/run/host/container-manager", F_OK) == @as(c_int, 0)) {
        return SDL_SANDBOX_UNKNOWN_CONTAINER;
    }
    return SDL_SANDBOX_NONE;
}
pub export fn SDL_GetSandbox_REAL() SDL_Sandbox {
    @setEvalBranchQuota(100000);
    const static_local_sandbox = struct {
        var sandbox: SDL_Sandbox = @import("std").mem.zeroes(SDL_Sandbox);
    };
    _ = &static_local_sandbox;
    const static_local_sandbox_initialized = struct {
        var sandbox_initialized: bool = false;
    };
    _ = &static_local_sandbox_initialized;
    if (!static_local_sandbox_initialized.sandbox_initialized) {
        static_local_sandbox.sandbox = SDL_DetectSandbox();
        static_local_sandbox_initialized.sandbox_initialized = @"true" != 0;
    }
    return static_local_sandbox.sandbox;
}

pub const SDL_GetAppMetadataProperty = SDL_GetAppMetadataProperty_REAL;
pub const SDL_GetPlatform = SDL_GetPlatform_REAL;
pub const SDL_GetRevision = SDL_GetRevision_REAL;
pub const SDL_GetVersion = SDL_GetVersion_REAL;
pub const SDL_Init = SDL_Init_REAL;
pub const SDL_InitSubSystem = SDL_InitSubSystem_REAL;
pub const SDL_IsTV = SDL_IsTV_REAL;
pub const SDL_IsTablet = SDL_IsTablet_REAL;
pub const SDL_Quit = SDL_Quit_REAL;
pub const SDL_QuitSubSystem = SDL_QuitSubSystem_REAL;
pub const SDL_SetAppMetadata = SDL_SetAppMetadata_REAL;
pub const SDL_SetAppMetadataProperty = SDL_SetAppMetadataProperty_REAL;
pub const SDL_SetMainReady = SDL_SetMainReady_REAL;
pub const SDL_WasInit = SDL_WasInit_REAL;
pub const SDL_GetSandbox = SDL_GetSandbox_REAL;
pub const SDL_IsMainThread = SDL_IsMainThread_REAL;
pub const SDL_IsPhone = SDL_IsPhone_REAL;
pub const SDL_GetDeviceFormFactor = SDL_GetDeviceFormFactor_REAL;
pub const SDL_GetDeviceFormFactorName = SDL_GetDeviceFormFactorName_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_INIT_AUDIO = @as(c_uint, 0x00000010);
pub const SDL_INIT_VIDEO = @as(c_uint, 0x00000020);
pub const SDL_INIT_JOYSTICK = @as(c_uint, 0x00000200);
pub const SDL_INIT_HAPTIC = @as(c_uint, 0x00001000);
pub const SDL_INIT_GAMEPAD = @as(c_uint, 0x00002000);
pub const SDL_INIT_EVENTS = @as(c_uint, 0x00004000);
pub const SDL_INIT_SENSOR = @as(c_uint, 0x00008000);
pub const SDL_INIT_CAMERA = __helpers.promoteIntLiteral(c_uint, 0x00010000, .hex);
pub const SDL_MAJOR_VERSION = @as(c_int, 3);
pub const SDL_MINOR_VERSION = @as(c_int, 5);
pub const SDL_MICRO_VERSION = @as(c_int, 0);
pub const F_OK = @as(c_int, 0);
