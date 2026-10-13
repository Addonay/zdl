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
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_PropertiesID = Uint32;
pub extern fn SDL_CreateProperties_REAL() SDL_PropertiesID;
pub extern fn SDL_SetPointerProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: ?*anyopaque) bool;
pub extern fn SDL_SetNumberProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: Sint64) bool;
pub extern fn SDL_SetBooleanProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: bool) bool;
pub extern fn SDL_GetPointerProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: ?*anyopaque) ?*anyopaque;
pub extern fn SDL_GetBooleanProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: bool) bool;
pub extern fn SDL_DestroyProperties_REAL(props: SDL_PropertiesID) void;
pub const struct_SDL_IOStream = opaque {
};
pub const SDL_IOStream = struct_SDL_IOStream;
pub extern fn SDL_LoadFile_IO_REAL(src: ?*SDL_IOStream, datasize: [*c]usize, closeio: bool) ?*anyopaque;
pub const struct_SDL_ProcessData = opaque {};
pub const SDL_ProcessData = struct_SDL_ProcessData;
pub const struct_SDL_Process = extern struct {
    alive: bool = false,
    background: bool = false,
    exitcode: c_int = 0,
    props: SDL_PropertiesID = 0,
    internal: ?*SDL_ProcessData = null,
};
pub const SDL_Process = struct_SDL_Process;
pub const SDL_PROCESS_STDIO_APP: c_int = 2;
pub extern fn SDL_SYS_CreateProcessWithProperties(process: [*c]SDL_Process, props: SDL_PropertiesID) bool;
pub extern fn SDL_SYS_KillProcess(process: [*c]SDL_Process, force: bool) bool;
pub extern fn SDL_SYS_WaitProcess(process: [*c]SDL_Process, block: bool, exitcode: [*c]c_int) bool;
pub extern fn SDL_SYS_DestroyProcess(process: [*c]SDL_Process) void;
pub export fn SDL_CreateProcess_REAL(args: [*c]const [*c]const u8, pipe_stdio: bool) [*c]SDL_Process {
    @setEvalBranchQuota(100000);
    if ((!(args != null) or !(args[@as(c_int, 0)] != null)) or !(@as(c_int, args[@as(c_int, 0)][@as(c_int, 0)]) != 0)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("args"))));
        return null;
    }
    var process: [*c]SDL_Process = undefined;
    _ = &process;
    var props: SDL_PropertiesID = SDL_CreateProperties_REAL();
    _ = &props;
    _ = SDL_SetPointerProperty_REAL(props, "SDL.process.create.args", @ptrCast(@alignCast(@constCast(args))));
    if (pipe_stdio) {
        _ = SDL_SetNumberProperty_REAL(props, "SDL.process.create.stdin_option", SDL_PROCESS_STDIO_APP);
        _ = SDL_SetNumberProperty_REAL(props, "SDL.process.create.stdout_option", SDL_PROCESS_STDIO_APP);
    }
    process = SDL_CreateProcessWithProperties_REAL(props);
    SDL_DestroyProperties_REAL(props);
    return process;
}
pub export fn SDL_CreateProcessWithProperties_REAL(props: SDL_PropertiesID) [*c]SDL_Process {
    @setEvalBranchQuota(100000);
    var args: [*c]const [*c]const u8 = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(props, "SDL.process.create.args", null)));
    _ = &args;
    if ((!(args != null) or !(args[@as(c_int, 0)] != null)) or !(@as(c_int, args[@as(c_int, 0)][@as(c_int, 0)]) != 0)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("SDL_PROP_PROCESS_CREATE_ARGS_POINTER"))));
        return null;
    }
    var process: [*c]SDL_Process = undefined;
    process = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(process.*)))));
    _ = &process;
    if (!(process != null)) {
        return null;
    }
    process.*.background = SDL_GetBooleanProperty_REAL(props, "SDL.process.create.background", @"false" != 0);
    process.*.props = SDL_CreateProperties_REAL();
    if (!(process.*.props != 0)) {
        SDL_DestroyProcess_REAL(process);
        return null;
    }
    _ = SDL_SetBooleanProperty_REAL(process.*.props, "SDL.process.background", process.*.background);
    if (!SDL_SYS_CreateProcessWithProperties(process, props)) {
        SDL_DestroyProcess_REAL(process);
        return null;
    }
    process.*.alive = @"true" != 0;
    return process;
}
pub export fn SDL_GetProcessProperties_REAL(process: [*c]SDL_Process) SDL_PropertiesID {
    @setEvalBranchQuota(100000);
    if (!(process != null)) {
        return @intFromBool(SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("process")))));
    }
    return process.*.props;
}
pub export fn SDL_ReadProcess_REAL(process: [*c]SDL_Process, datasize: [*c]usize, exitcode: [*c]c_int) ?*anyopaque {
    @setEvalBranchQuota(100000);
    var result: ?*anyopaque = undefined;
    _ = &result;
    if (datasize != null) {
        datasize.* = 0;
    }
    if (exitcode != null) {
        exitcode.* = -@as(c_int, 1);
    }
    if (!(process != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("process"))));
        return null;
    }
    var io: ?*SDL_IOStream = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(process.*.props, "SDL.process.stdout", null)));
    _ = &io;
    if (!(io != null)) {
        _ = SDL_SetError_REAL("Process not created with I/O enabled");
        return null;
    }
    result = SDL_LoadFile_IO_REAL(io, datasize, @"false" != 0);
    _ = SDL_WaitProcess_REAL(process, @"true" != 0, exitcode);
    return result;
}
pub export fn SDL_GetProcessInput_REAL(process: [*c]SDL_Process) ?*SDL_IOStream {
    @setEvalBranchQuota(100000);
    if (!(process != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("process"))));
        return null;
    }
    var io: ?*SDL_IOStream = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(process.*.props, "SDL.process.stdin", null)));
    _ = &io;
    if (!(io != null)) {
        _ = SDL_SetError_REAL("Process not created with standard input available");
        return null;
    }
    return io;
}
pub export fn SDL_GetProcessOutput_REAL(process: [*c]SDL_Process) ?*SDL_IOStream {
    @setEvalBranchQuota(100000);
    if (!(process != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("process"))));
        return null;
    }
    var io: ?*SDL_IOStream = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(process.*.props, "SDL.process.stdout", null)));
    _ = &io;
    if (!(io != null)) {
        _ = SDL_SetError_REAL("Process not created with standard output available");
        return null;
    }
    return io;
}
pub export fn SDL_KillProcess_REAL(process: [*c]SDL_Process, force: bool) bool {
    @setEvalBranchQuota(100000);
    if (!(process != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("process"))));
    }
    if (!process.*.alive) {
        return SDL_SetError_REAL("Process isn't running");
    }
    return SDL_SYS_KillProcess(process, force);
}
pub export fn SDL_WaitProcess_REAL(process: [*c]SDL_Process, block: bool, exitcode: [*c]c_int) bool {
    @setEvalBranchQuota(100000);
    if (!(process != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("process"))));
    }
    if (!process.*.alive) {
        if (exitcode != null) {
            exitcode.* = process.*.exitcode;
        }
        return @"true" != 0;
    }
    if (SDL_SYS_WaitProcess(process, block, &process.*.exitcode)) {
        process.*.alive = @"false" != 0;
        if (exitcode != null) {
            if (process.*.background) {
                process.*.exitcode = 0;
            }
            exitcode.* = process.*.exitcode;
        }
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub export fn SDL_DestroyProcess_REAL(process: [*c]SDL_Process) void {
    @setEvalBranchQuota(100000);
    if (!(process != null)) {
        return;
    }
    if (process.*.alive) {
        _ = SDL_WaitProcess_REAL(process, @"false" != 0, null);
    }
    SDL_SYS_DestroyProcess(process);
    SDL_DestroyProperties_REAL(process.*.props);
    SDL_free_REAL(@ptrCast(@alignCast(process)));
}

pub const SDL_CreateProcess = SDL_CreateProcess_REAL;
pub const SDL_CreateProcessWithProperties = SDL_CreateProcessWithProperties_REAL;
pub const SDL_DestroyProcess = SDL_DestroyProcess_REAL;
pub const SDL_GetProcessInput = SDL_GetProcessInput_REAL;
pub const SDL_GetProcessOutput = SDL_GetProcessOutput_REAL;
pub const SDL_GetProcessProperties = SDL_GetProcessProperties_REAL;
pub const SDL_KillProcess = SDL_KillProcess_REAL;
pub const SDL_ReadProcess = SDL_ReadProcess_REAL;
pub const SDL_WaitProcess = SDL_WaitProcess_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
