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
pub const __uint32_t = c_uint;
pub const __uid_t = c_uint;
pub const __ino_t = c_ulong;
pub const __mode_t = c_uint;
pub const __off_t = c_long;
pub const __pid_t = c_int;
pub const __clock_t = c_long;
pub const mode_t = __mode_t;
pub const pid_t = __pid_t;
pub const __sigset_t = extern struct {
    __val: [16]c_ulong = @import("std").mem.zeroes([16]c_ulong),
};
pub const sigset_t = __sigset_t;
pub extern fn strerror(__errnum: c_int) [*c]u8;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub const struct_SDL_Environment = opaque {
};
pub const SDL_Environment = struct_SDL_Environment;
pub extern fn SDL_GetEnvironment_REAL() ?*SDL_Environment;
pub extern fn SDL_GetEnvironmentVariables_REAL(env: ?*SDL_Environment) [*c][*c]u8;
pub extern fn SDL_atoi_REAL(str: [*c]const u8) c_int;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub extern fn SDL_ClearError_REAL() bool;
pub const SDL_PropertiesID = Uint32;
pub const SDL_CleanupPropertyCallback = ?*const fn (userdata: ?*anyopaque, value: ?*anyopaque) callconv(.c) void;
pub extern fn SDL_SetPointerPropertyWithCleanup_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: ?*anyopaque, cleanup: SDL_CleanupPropertyCallback, userdata: ?*anyopaque) bool;
pub extern fn SDL_SetPointerProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: ?*anyopaque) bool;
pub extern fn SDL_SetNumberProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: Sint64) bool;
pub extern fn SDL_HasProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8) bool;
pub extern fn SDL_GetPointerProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: ?*anyopaque) ?*anyopaque;
pub extern fn SDL_GetStringProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: [*c]const u8) [*c]const u8;
pub extern fn SDL_GetNumberProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: Sint64) Sint64;
pub extern fn SDL_GetBooleanProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: bool) bool;
pub extern fn SDL_ClearProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8) bool;
pub const struct_SDL_IOStream = opaque {
};
pub const SDL_IOStream = struct_SDL_IOStream;
pub extern fn SDL_CloseIO_REAL(context: ?*SDL_IOStream) bool;
pub extern fn SDL_GetIOProperties_REAL(context: ?*SDL_IOStream) SDL_PropertiesID;
pub const struct_SDL_ProcessData = extern struct {
    pid: pid_t = 0,
};
pub const SDL_ProcessData = struct_SDL_ProcessData;
pub const struct_SDL_Process = extern struct {
    alive: bool = false,
    background: bool = false,
    exitcode: c_int = 0,
    props: SDL_PropertiesID = 0,
    internal: [*c]SDL_ProcessData = null,
};
pub const SDL_Process = struct_SDL_Process;
pub const SDL_PROCESS_STDIO_INHERITED: c_int = 0;
pub const SDL_PROCESS_STDIO_NULL: c_int = 1;
pub const SDL_PROCESS_STDIO_APP: c_int = 2;
pub const SDL_PROCESS_STDIO_REDIRECT: c_int = 3;
pub const enum_SDL_ProcessIO = c_uint;
pub const SDL_ProcessIO = enum_SDL_ProcessIO;
pub extern fn SDL_Delay_REAL(ms: Uint32) void;
pub const struct_dirent = extern struct {
    d_ino: __ino_t = 0,
    d_off: __off_t = 0,
    d_reclen: c_ushort = 0,
    d_type: u8 = 0,
    d_name: [256]u8 = @import("std").mem.zeroes([256]u8),
};
pub const struct___dirstream = opaque {
};
pub const DIR = struct___dirstream;
pub extern fn closedir(__dirp: ?*DIR) c_int;
pub extern fn opendir(__name: [*c]const u8) ?*DIR;
pub extern fn readdir(__dirp: ?*DIR) [*c]struct_dirent;
pub extern fn fcntl(__fd: c_int, __cmd: c_int, ...) c_int;
pub extern fn __errno_location() [*c]c_int;
pub const union_sigval = extern union {
    sival_int: c_int,
    sival_ptr: ?*anyopaque,
};
pub const __sigval_t = union_sigval;
const struct_unnamed_16 = extern struct {
    si_pid: __pid_t = 0,
    si_uid: __uid_t = 0,
};
const struct_unnamed_17 = extern struct {
    si_tid: c_int = 0,
    si_overrun: c_int = 0,
    si_sigval: __sigval_t = @import("std").mem.zeroes(__sigval_t),
};
const struct_unnamed_18 = extern struct {
    si_pid: __pid_t = 0,
    si_uid: __uid_t = 0,
    si_sigval: __sigval_t = @import("std").mem.zeroes(__sigval_t),
};
const struct_unnamed_19 = extern struct {
    si_pid: __pid_t = 0,
    si_uid: __uid_t = 0,
    si_status: c_int = 0,
    si_utime: __clock_t = 0,
    si_stime: __clock_t = 0,
};
const struct_unnamed_22 = extern struct {
    _lower: ?*anyopaque = null,
    _upper: ?*anyopaque = null,
};
const union_unnamed_21 = extern union {
    _addr_bnd: struct_unnamed_22,
    _pkey: __uint32_t,
};
const struct_unnamed_20 = extern struct {
    si_addr: ?*anyopaque = null,
    si_addr_lsb: c_short = 0,
    _bounds: union_unnamed_21 = @import("std").mem.zeroes(union_unnamed_21),
};
const struct_unnamed_23 = extern struct {
    si_band: c_long = 0,
    si_fd: c_int = 0,
};
const struct_unnamed_24 = extern struct {
    _call_addr: ?*anyopaque = null,
    _syscall: c_int = 0,
    _arch: c_uint = 0,
};
const union_unnamed_15 = extern union {
    _pad: [28]c_int,
    _kill: struct_unnamed_16,
    _timer: struct_unnamed_17,
    _rt: struct_unnamed_18,
    _sigchld: struct_unnamed_19,
    _sigfault: struct_unnamed_20,
    _sigpoll: struct_unnamed_23,
    _sigsys: struct_unnamed_24,
};
pub const siginfo_t = extern struct {
    si_signo: c_int = 0,
    si_errno: c_int = 0,
    si_code: c_int = 0,
    __pad0: c_int = 0,
    _sifields: union_unnamed_15 = @import("std").mem.zeroes(union_unnamed_15),
};
pub const __sighandler_t = ?*const fn (c_int) callconv(.c) void;
pub extern fn kill(__pid: __pid_t, __sig: c_int) c_int;
const union_unnamed_37 = extern union {
    sa_handler: __sighandler_t,
    sa_sigaction: ?*const fn (c_int, [*c]siginfo_t, ?*anyopaque) callconv(.c) void,
};
pub const struct_sigaction = extern struct {
    __sigaction_handler: union_unnamed_37 = @import("std").mem.zeroes(union_unnamed_37),
    sa_mask: __sigset_t = @import("std").mem.zeroes(__sigset_t),
    sa_flags: c_int = 0,
    sa_restorer: ?*const fn () callconv(.c) void = null,
};
pub extern fn sigaction(__sig: c_int, noalias __act: [*c]const struct_sigaction, noalias __oact: [*c]struct_sigaction) c_int;
pub extern fn close(__fd: c_int) c_int;
pub extern fn pipe(__pipedes: [*c]c_int) c_int;
pub extern fn _exit(__status: c_int) noreturn;
pub const _SC_OPEN_MAX: c_int = 4;
pub extern fn sysconf(__name: c_int) c_long;
pub extern fn setsid() __pid_t;
pub extern fn vfork() __pid_t;
pub extern fn truncate(__file: [*c]const u8, __length: __off_t) c_int;
pub const struct_sched_param = extern struct {
    sched_priority: c_int = 0,
};
pub const posix_spawnattr_t = extern struct {
    __flags: c_short = 0,
    __pgrp: pid_t = 0,
    __sd: sigset_t = @import("std").mem.zeroes(sigset_t),
    __ss: sigset_t = @import("std").mem.zeroes(sigset_t),
    __sp: struct_sched_param = @import("std").mem.zeroes(struct_sched_param),
    __policy: c_int = 0,
    __cgroup: c_int = 0,
    __pad: [15]c_int = @import("std").mem.zeroes([15]c_int),
};
pub const struct___spawn_action_44 = opaque {};
pub const posix_spawn_file_actions_t = extern struct {
    __allocated: c_int = 0,
    __used: c_int = 0,
    __actions: ?*struct___spawn_action_44 = null,
    __pad: [16]c_int = @import("std").mem.zeroes([16]c_int),
};
pub extern fn posix_spawnp(__pid: [*c]pid_t, __file: [*c]const u8, __file_actions: [*c]const posix_spawn_file_actions_t, __attrp: [*c]const posix_spawnattr_t, __argv: [*c]const [*c]u8, __envp: [*c]const [*c]u8) c_int;
pub extern fn posix_spawnattr_init(__attr: [*c]posix_spawnattr_t) c_int;
pub extern fn posix_spawnattr_destroy(__attr: [*c]posix_spawnattr_t) c_int;
pub extern fn posix_spawn_file_actions_init(__file_actions: [*c]posix_spawn_file_actions_t) c_int;
pub extern fn posix_spawn_file_actions_destroy(__file_actions: [*c]posix_spawn_file_actions_t) c_int;
pub extern fn posix_spawn_file_actions_addopen(noalias __file_actions: [*c]posix_spawn_file_actions_t, __fd: c_int, noalias __path: [*c]const u8, __oflag: c_int, __mode: mode_t) c_int;
pub extern fn posix_spawn_file_actions_addclose(__file_actions: [*c]posix_spawn_file_actions_t, __fd: c_int) c_int;
pub extern fn posix_spawn_file_actions_adddup2(__file_actions: [*c]posix_spawn_file_actions_t, __fd: c_int, __newfd: c_int) c_int;
pub extern fn posix_spawn_file_actions_addchdir_np(noalias __actions: [*c]posix_spawn_file_actions_t, noalias __path: [*c]const u8) c_int;
pub extern fn waitpid(__pid: __pid_t, __stat_loc: [*c]c_int, __options: c_int) __pid_t;
pub extern fn SDL_IOFromFD(fd: c_int, autoclose: bool) ?*SDL_IOStream;
pub fn CleanupStream(userdata: ?*anyopaque, value: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var process: [*c]SDL_Process = @ptrCast(@alignCast(value));
    _ = &process;
    var property: [*c]const u8 = @ptrCast(@alignCast(userdata));
    _ = &property;
    _ = SDL_ClearProperty_REAL(process.*.props, property);
}
pub fn SetupStream(process: [*c]SDL_Process, fd: c_int, _: [*c]const u8, property: [*c]const u8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    _ = fcntl(fd, F_SETFL, fcntl(fd, F_GETFL) | O_NONBLOCK);
    var io: ?*SDL_IOStream = SDL_IOFromFD(fd, @"true" != 0);
    _ = &io;
    if (!(io != null)) {
        return @"false" != 0;
    }
    _ = SDL_SetPointerPropertyWithCleanup_REAL(SDL_GetIOProperties_REAL(io), "SDL.internal.process", @ptrCast(@alignCast(process)), CleanupStream, @ptrCast(@alignCast(@constCast(property))));
    _ = SDL_SetPointerProperty_REAL(process.*.props, property, @ptrCast(@alignCast(io)));
    return @"true" != 0;
}
pub fn IgnoreSignal(sig: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var action: struct_sigaction = undefined;
    _ = &action;
    _ = sigaction(SIGPIPE, null, &action);
    if ((action.__sigaction_handler.sa_handler == @as(__sighandler_t, null)) and (@as(?*const fn (c_int) callconv(.c) void, @ptrCast(@alignCast(@constCast(action.__sigaction_handler.sa_sigaction)))) == @as(__sighandler_t, null))) {
        action.__sigaction_handler.sa_handler = @as(__sighandler_t, @ptrFromInt(@as(usize, @intCast(@as(c_int, 1)))));
        _ = sigaction(sig, &action, null);
    }
}
pub fn CreatePipe(fds: [*c]c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (pipe(fds) < @as(c_int, 0)) {
        return @"false" != 0;
    }
    _ = fcntl(fds[READ_END], F_SETFD, fcntl(fds[READ_END], F_GETFD) | FD_CLOEXEC);
    _ = fcntl(fds[WRITE_END], F_SETFD, fcntl(fds[WRITE_END], F_GETFD) | FD_CLOEXEC);
    IgnoreSignal(SIGPIPE);
    return @"true" != 0;
}
pub fn GetStreamFD(props: SDL_PropertiesID, property: [*c]const u8, result: [*c]c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var io: ?*SDL_IOStream = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(props, property, null)));
    _ = &io;
    if (!(io != null)) {
        _ = SDL_SetError_REAL("%s is not set", property);
        return @"false" != 0;
    }
    var fd: c_int = @truncate(SDL_GetNumberProperty_REAL(SDL_GetIOProperties_REAL(io), "SDL.iostream.file_descriptor", -@as(c_int, 1)));
    _ = &fd;
    if (fd < @as(c_int, 0)) {
        _ = SDL_SetError_REAL("%s doesn't have SDL_PROP_IOSTREAM_FILE_DESCRIPTOR_NUMBER available", property);
        return @"false" != 0;
    }
    result.* = fd;
    return @"true" != 0;
}
pub fn AddFileDescriptorCloseActions(fa: [*c]posix_spawn_file_actions_t) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var dir: ?*DIR = opendir("/proc/self/fd");
    _ = &dir;
    if (dir != null) {
        var entry: [*c]struct_dirent = undefined;
        _ = &entry;
        while (@as(?*anyopaque, @ptrCast(@alignCast(blk: {
            const tmp = readdir(dir);
            entry = tmp;
            break :blk tmp;
        }))) != @as(?*anyopaque, null)) {
            var fd: c_int = SDL_atoi_REAL(@ptrCast(@alignCast(&entry.*.d_name)));
            _ = &fd;
            if (fd <= STDERR_FILENO) {
                continue;
            }
            var flags: c_int = fcntl(fd, F_GETFD);
            _ = &flags;
            if ((flags < @as(c_int, 0)) or ((flags & FD_CLOEXEC) != 0)) {
                continue;
            }
            if (posix_spawn_file_actions_addclose(fa, fd) != @as(c_int, 0)) {
                _ = closedir(dir);
                return SDL_SetError_REAL("posix_spawn_file_actions_addclose failed: %s", strerror(__errno_location().*));
            }
        }
        _ = closedir(dir);
    } else {
        {
            var fd: c_int = @truncate(sysconf(_SC_OPEN_MAX) - @as(c_long, 1));
            _ = &fd;
            while (fd > STDERR_FILENO) : (fd -= 1) {
                var flags: c_int = fcntl(fd, F_GETFD);
                _ = &flags;
                if ((flags < @as(c_int, 0)) or ((flags & FD_CLOEXEC) != 0)) {
                    continue;
                }
                if (posix_spawn_file_actions_addclose(fa, fd) != @as(c_int, 0)) {
                    return SDL_SetError_REAL("posix_spawn_file_actions_addclose failed: %s", strerror(__errno_location().*));
                }
            }
        }
    }
    return @"true" != 0;
}
pub export fn SDL_SYS_CreateProcessWithProperties(process: [*c]SDL_Process, props: SDL_PropertiesID) bool {
    @setEvalBranchQuota(100000);
    var args: [*c]const [*c]u8 = undefined;
    _ = &args;
    var env: ?*SDL_Environment = undefined;
    _ = &env;
    var envp: [*c][*c]u8 = undefined;
    _ = &envp;
    var working_directory: [*c]const u8 = undefined;
    _ = &working_directory;
    var stdin_option: SDL_ProcessIO = undefined;
    _ = &stdin_option;
    var stdout_option: SDL_ProcessIO = undefined;
    _ = &stdout_option;
    var stderr_option: SDL_ProcessIO = undefined;
    _ = &stderr_option;
    var redirect_stderr: bool = undefined;
    _ = &redirect_stderr;
    var stdin_pipe: [2]c_int = undefined;
    _ = &stdin_pipe;
    var stdout_pipe: [2]c_int = undefined;
    _ = &stdout_pipe;
    var stderr_pipe: [2]c_int = undefined;
    _ = &stderr_pipe;
    var fd: c_int = undefined;
    _ = &fd;
    var data: [*c]SDL_ProcessData = undefined;
    _ = &data;
    var attr: posix_spawnattr_t = undefined;
    _ = &attr;
    var fa: posix_spawn_file_actions_t = undefined;
    _ = &fa;
    var status: c_int = undefined;
    _ = &status;
    var pid: pid_t = undefined;
    _ = &pid;
    var forkname: [*c]const u8 = undefined;
    _ = &forkname;
    var result: c_int = undefined;
    _ = &result;
    var result_1: c_int = undefined;
    _ = &result_1;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                args = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(props, "SDL.process.create.args", null)));
                env = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(props, "SDL.process.create.environment", @ptrCast(@alignCast(SDL_GetEnvironment_REAL())))));
                envp = null;
                working_directory = SDL_GetStringProperty_REAL(props, "SDL.process.create.working_directory", null);
                stdin_option = @bitCast(@as(c_int, @truncate(SDL_GetNumberProperty_REAL(props, "SDL.process.create.stdin_option", SDL_PROCESS_STDIO_NULL))));
                stdout_option = @bitCast(@as(c_int, @truncate(SDL_GetNumberProperty_REAL(props, "SDL.process.create.stdout_option", SDL_PROCESS_STDIO_INHERITED))));
                stderr_option = @bitCast(@as(c_int, @truncate(SDL_GetNumberProperty_REAL(props, "SDL.process.create.stderr_option", SDL_PROCESS_STDIO_INHERITED))));
                redirect_stderr = SDL_GetBooleanProperty_REAL(props, "SDL.process.create.stderr_to_stdout", @"false" != 0) and !SDL_HasProperty_REAL(props, "SDL.process.create.stderr_option");
                stdin_pipe = [2]c_int{
                    -@as(c_int, 1),
                    -@as(c_int, 1),
                };
                stdout_pipe = [2]c_int{
                    -@as(c_int, 1),
                    -@as(c_int, 1),
                };
                stderr_pipe = [2]c_int{
                    -@as(c_int, 1),
                    -@as(c_int, 1),
                };
                fd = -@as(c_int, 1);
                envp = SDL_GetEnvironmentVariables_REAL(env);
                if (!(envp != null)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            1 => {
                _ = posix_spawn_file_actions_destroy(&fa);
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            2 => {
                _ = posix_spawnattr_destroy(&attr);
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                if (stdin_pipe[READ_END] >= @as(c_int, 0)) {
                    sdl_pc = 140;
                    continue;
                } else {
                    sdl_pc = 141;
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
                data = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(data.*)))));
                if (!(data != null)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                SDL_free_REAL(@ptrCast(@alignCast(envp)));
                return @"false" != 0;
            },
            8 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                process.*.internal = data;
                if (posix_spawnattr_init(&attr) != @as(c_int, 0)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                _ = SDL_SetError_REAL("posix_spawnattr_init failed: %s", strerror(__errno_location().*));
                {
                    sdl_pc = 3;
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
                if (posix_spawn_file_actions_init(&fa) != @as(c_int, 0)) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            13 => {
                _ = SDL_SetError_REAL("posix_spawn_file_actions_init failed: %s", strerror(__errno_location().*));
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            14 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                if (working_directory != null) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            16 => {
                if (posix_spawn_file_actions_addchdir_np(&fa, working_directory) != @as(c_int, 0)) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
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
                if (process.*.background) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            19 => {
                _ = SDL_SetError_REAL("posix_spawn_file_actions_addchdir failed: %s", strerror(__errno_location().*));
                {
                    sdl_pc = 1;
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
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            22 => {
                if (stdin_option == @as(SDL_ProcessIO, SDL_PROCESS_STDIO_INHERITED)) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
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
                switch (stdin_option) {
                    @as(SDL_ProcessIO, SDL_PROCESS_STDIO_REDIRECT) => {
                        sdl_pc = 35;
                        continue;
                    },
                    @as(SDL_ProcessIO, SDL_PROCESS_STDIO_APP) => {
                        sdl_pc = 42;
                        continue;
                    },
                    @as(SDL_ProcessIO, SDL_PROCESS_STDIO_NULL) => {
                        sdl_pc = 49;
                        continue;
                    },
                    @as(SDL_ProcessIO, SDL_PROCESS_STDIO_INHERITED) => {
                        sdl_pc = 53;
                        continue;
                    },
                    else => {
                        sdl_pc = 54;
                        continue;
                    },
                }
            },
            25 => {
                stdin_option = SDL_PROCESS_STDIO_NULL;
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
                if (stdout_option == @as(SDL_ProcessIO, SDL_PROCESS_STDIO_INHERITED)) {
                    sdl_pc = 28;
                    continue;
                } else {
                    sdl_pc = 29;
                    continue;
                }
            },
            28 => {
                stdout_option = SDL_PROCESS_STDIO_NULL;
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
                if (stderr_option == @as(SDL_ProcessIO, SDL_PROCESS_STDIO_INHERITED)) {
                    sdl_pc = 31;
                    continue;
                } else {
                    sdl_pc = 32;
                    continue;
                }
            },
            31 => {
                stderr_option = SDL_PROCESS_STDIO_NULL;
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            32 => {
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            33 => {
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            34 => {
                switch (stdout_option) {
                    @as(SDL_ProcessIO, SDL_PROCESS_STDIO_REDIRECT) => {
                        sdl_pc = 56;
                        continue;
                    },
                    @as(SDL_ProcessIO, SDL_PROCESS_STDIO_APP) => {
                        sdl_pc = 63;
                        continue;
                    },
                    @as(SDL_ProcessIO, SDL_PROCESS_STDIO_NULL) => {
                        sdl_pc = 70;
                        continue;
                    },
                    @as(SDL_ProcessIO, SDL_PROCESS_STDIO_INHERITED) => {
                        sdl_pc = 74;
                        continue;
                    },
                    else => {
                        sdl_pc = 75;
                        continue;
                    },
                }
            },
            35 => {
                if (!GetStreamFD(props, "SDL.process.create.stdin_source", &fd)) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 37;
                    continue;
                }
            },
            36 => {
                {
                    sdl_pc = 1;
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
                if (posix_spawn_file_actions_adddup2(&fa, fd, STDIN_FILENO) != @as(c_int, 0)) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 40;
                    continue;
                }
            },
            39 => {
                _ = SDL_SetError_REAL("posix_spawn_file_actions_adddup2 failed: %s", strerror(__errno_location().*));
                {
                    sdl_pc = 1;
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
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            42 => {
                if (!CreatePipe(@ptrCast(@alignCast(&stdin_pipe)))) {
                    sdl_pc = 43;
                    continue;
                } else {
                    sdl_pc = 44;
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
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            45 => {
                if (posix_spawn_file_actions_adddup2(&fa, stdin_pipe[READ_END], STDIN_FILENO) != @as(c_int, 0)) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 47;
                    continue;
                }
            },
            46 => {
                _ = SDL_SetError_REAL("posix_spawn_file_actions_adddup2 failed: %s", strerror(__errno_location().*));
                {
                    sdl_pc = 1;
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
                    sdl_pc = 34;
                    continue;
                }
            },
            49 => {
                if (posix_spawn_file_actions_addopen(&fa, STDIN_FILENO, "/dev/null", O_RDONLY, 0) != @as(c_int, 0)) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            50 => {
                _ = SDL_SetError_REAL("posix_spawn_file_actions_addopen failed: %s", strerror(__errno_location().*));
                {
                    sdl_pc = 1;
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
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            53 => {
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            54 => {
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            55 => {
                if (redirect_stderr) {
                    sdl_pc = 76;
                    continue;
                } else {
                    sdl_pc = 77;
                    continue;
                }
            },
            56 => {
                if (!GetStreamFD(props, "SDL.process.create.stdout_source", &fd)) {
                    sdl_pc = 57;
                    continue;
                } else {
                    sdl_pc = 58;
                    continue;
                }
            },
            57 => {
                {
                    sdl_pc = 1;
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
                if (posix_spawn_file_actions_adddup2(&fa, fd, STDOUT_FILENO) != @as(c_int, 0)) {
                    sdl_pc = 60;
                    continue;
                } else {
                    sdl_pc = 61;
                    continue;
                }
            },
            60 => {
                _ = SDL_SetError_REAL("posix_spawn_file_actions_adddup2 failed: %s", strerror(__errno_location().*));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            61 => {
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            62 => {
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            63 => {
                if (!CreatePipe(@ptrCast(@alignCast(&stdout_pipe)))) {
                    sdl_pc = 64;
                    continue;
                } else {
                    sdl_pc = 65;
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
                {
                    sdl_pc = 66;
                    continue;
                }
            },
            66 => {
                if (posix_spawn_file_actions_adddup2(&fa, stdout_pipe[WRITE_END], STDOUT_FILENO) != @as(c_int, 0)) {
                    sdl_pc = 67;
                    continue;
                } else {
                    sdl_pc = 68;
                    continue;
                }
            },
            67 => {
                _ = SDL_SetError_REAL("posix_spawn_file_actions_adddup2 failed: %s", strerror(__errno_location().*));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            68 => {
                {
                    sdl_pc = 69;
                    continue;
                }
            },
            69 => {
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            70 => {
                if (posix_spawn_file_actions_addopen(&fa, STDOUT_FILENO, "/dev/null", O_WRONLY, 420) != @as(c_int, 0)) {
                    sdl_pc = 71;
                    continue;
                } else {
                    sdl_pc = 72;
                    continue;
                }
            },
            71 => {
                _ = SDL_SetError_REAL("posix_spawn_file_actions_addopen failed: %s", strerror(__errno_location().*));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            72 => {
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            73 => {
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            74 => {
                {
                    sdl_pc = 75;
                    continue;
                }
            },
            75 => {
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            76 => {
                if (posix_spawn_file_actions_adddup2(&fa, STDOUT_FILENO, STDERR_FILENO) != @as(c_int, 0)) {
                    sdl_pc = 79;
                    continue;
                } else {
                    sdl_pc = 80;
                    continue;
                }
            },
            77 => {
                switch (stderr_option) {
                    @as(SDL_ProcessIO, SDL_PROCESS_STDIO_REDIRECT) => {
                        sdl_pc = 83;
                        continue;
                    },
                    @as(SDL_ProcessIO, SDL_PROCESS_STDIO_APP) => {
                        sdl_pc = 90;
                        continue;
                    },
                    @as(SDL_ProcessIO, SDL_PROCESS_STDIO_NULL) => {
                        sdl_pc = 97;
                        continue;
                    },
                    @as(SDL_ProcessIO, SDL_PROCESS_STDIO_INHERITED) => {
                        sdl_pc = 101;
                        continue;
                    },
                    else => {
                        sdl_pc = 102;
                        continue;
                    },
                }
            },
            78 => {
                if (!AddFileDescriptorCloseActions(&fa)) {
                    sdl_pc = 103;
                    continue;
                } else {
                    sdl_pc = 104;
                    continue;
                }
            },
            79 => {
                _ = SDL_SetError_REAL("posix_spawn_file_actions_adddup2 failed: %s", strerror(__errno_location().*));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            80 => {
                {
                    sdl_pc = 81;
                    continue;
                }
            },
            81 => {
                {
                    sdl_pc = 78;
                    continue;
                }
            },
            82 => {
                {
                    sdl_pc = 78;
                    continue;
                }
            },
            83 => {
                if (!GetStreamFD(props, "SDL.process.create.stderr_source", &fd)) {
                    sdl_pc = 84;
                    continue;
                } else {
                    sdl_pc = 85;
                    continue;
                }
            },
            84 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            85 => {
                {
                    sdl_pc = 86;
                    continue;
                }
            },
            86 => {
                if (posix_spawn_file_actions_adddup2(&fa, fd, STDERR_FILENO) != @as(c_int, 0)) {
                    sdl_pc = 87;
                    continue;
                } else {
                    sdl_pc = 88;
                    continue;
                }
            },
            87 => {
                _ = SDL_SetError_REAL("posix_spawn_file_actions_adddup2 failed: %s", strerror(__errno_location().*));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            88 => {
                {
                    sdl_pc = 89;
                    continue;
                }
            },
            89 => {
                {
                    sdl_pc = 82;
                    continue;
                }
            },
            90 => {
                if (!CreatePipe(@ptrCast(@alignCast(&stderr_pipe)))) {
                    sdl_pc = 91;
                    continue;
                } else {
                    sdl_pc = 92;
                    continue;
                }
            },
            91 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            92 => {
                {
                    sdl_pc = 93;
                    continue;
                }
            },
            93 => {
                if (posix_spawn_file_actions_adddup2(&fa, stderr_pipe[WRITE_END], STDERR_FILENO) != @as(c_int, 0)) {
                    sdl_pc = 94;
                    continue;
                } else {
                    sdl_pc = 95;
                    continue;
                }
            },
            94 => {
                _ = SDL_SetError_REAL("posix_spawn_file_actions_adddup2 failed: %s", strerror(__errno_location().*));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            95 => {
                {
                    sdl_pc = 96;
                    continue;
                }
            },
            96 => {
                {
                    sdl_pc = 82;
                    continue;
                }
            },
            97 => {
                if (posix_spawn_file_actions_addopen(&fa, STDERR_FILENO, "/dev/null", O_WRONLY, 420) != @as(c_int, 0)) {
                    sdl_pc = 98;
                    continue;
                } else {
                    sdl_pc = 99;
                    continue;
                }
            },
            98 => {
                _ = SDL_SetError_REAL("posix_spawn_file_actions_addopen failed: %s", strerror(__errno_location().*));
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
                {
                    sdl_pc = 82;
                    continue;
                }
            },
            101 => {
                {
                    sdl_pc = 102;
                    continue;
                }
            },
            102 => {
                {
                    sdl_pc = 82;
                    continue;
                }
            },
            103 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            104 => {
                {
                    sdl_pc = 105;
                    continue;
                }
            },
            105 => {
                if (process.*.background) {
                    sdl_pc = 106;
                    continue;
                } else {
                    sdl_pc = 107;
                    continue;
                }
            },
            106 => {
                status = -@as(c_int, 1);
                pid = vfork();
                forkname = "vfork";
                switch (pid) {
                    -@as(c_int, 1) => {
                        sdl_pc = 110;
                        continue;
                    },
                    @as(c_int, 0) => {
                        sdl_pc = 111;
                        continue;
                    },
                    else => {
                        sdl_pc = 112;
                        continue;
                    },
                }
            },
            107 => {
                result_1 = posix_spawnp(&data.*.pid, args[@as(c_int, 0)], &fa, &attr, args, envp);
                if (result_1 != @as(c_int, 0)) {
                    sdl_pc = 119;
                    continue;
                } else {
                    sdl_pc = 120;
                    continue;
                }
            },
            108 => {
                _ = SDL_SetNumberProperty_REAL(process.*.props, "SDL.process.pid", data.*.pid);
                if (stdin_option == @as(SDL_ProcessIO, SDL_PROCESS_STDIO_APP)) {
                    sdl_pc = 122;
                    continue;
                } else {
                    sdl_pc = 123;
                    continue;
                }
            },
            109 => {
                {
                    sdl_pc = 108;
                    continue;
                }
            },
            110 => {
                _ = SDL_SetError_REAL("%s() failed: %s", forkname, strerror(__errno_location().*));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            111 => {
                _ = setsid();
                result = posix_spawnp(&data.*.pid, args[@as(c_int, 0)], &fa, &attr, args, envp);
                _exit(result);
                {
                    sdl_pc = 112;
                    continue;
                }
            },
            112 => {
                if (waitpid(pid, &status, 0) < @as(c_int, 0)) {
                    sdl_pc = 113;
                    continue;
                } else {
                    sdl_pc = 114;
                    continue;
                }
            },
            113 => {
                _ = SDL_SetError_REAL("waitpid() failed: %s", strerror(__errno_location().*));
                {
                    sdl_pc = 1;
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
                if (status != @as(c_int, 0)) {
                    sdl_pc = 116;
                    continue;
                } else {
                    sdl_pc = 117;
                    continue;
                }
            },
            116 => {
                _ = SDL_SetError_REAL("posix_spawn() failed: %d", status);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            117 => {
                {
                    sdl_pc = 118;
                    continue;
                }
            },
            118 => {
                {
                    sdl_pc = 109;
                    continue;
                }
            },
            119 => {
                _ = SDL_SetError_REAL("posix_spawn() failed: %s", strerror(result_1));
                {
                    sdl_pc = 1;
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
                    sdl_pc = 108;
                    continue;
                }
            },
            122 => {
                if (!SetupStream(process, stdin_pipe[WRITE_END], "wb", "SDL.process.stdin")) {
                    sdl_pc = 125;
                    continue;
                } else {
                    sdl_pc = 126;
                    continue;
                }
            },
            123 => {
                {
                    sdl_pc = 124;
                    continue;
                }
            },
            124 => {
                if (stdout_option == @as(SDL_ProcessIO, SDL_PROCESS_STDIO_APP)) {
                    sdl_pc = 128;
                    continue;
                } else {
                    sdl_pc = 129;
                    continue;
                }
            },
            125 => {
                _ = close(stdin_pipe[WRITE_END]);
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
                _ = close(stdin_pipe[READ_END]);
                {
                    sdl_pc = 124;
                    continue;
                }
            },
            128 => {
                if (!SetupStream(process, stdout_pipe[READ_END], "rb", "SDL.process.stdout")) {
                    sdl_pc = 131;
                    continue;
                } else {
                    sdl_pc = 132;
                    continue;
                }
            },
            129 => {
                {
                    sdl_pc = 130;
                    continue;
                }
            },
            130 => {
                if (stderr_option == @as(SDL_ProcessIO, SDL_PROCESS_STDIO_APP)) {
                    sdl_pc = 134;
                    continue;
                } else {
                    sdl_pc = 135;
                    continue;
                }
            },
            131 => {
                _ = close(stdout_pipe[READ_END]);
                {
                    sdl_pc = 133;
                    continue;
                }
            },
            132 => {
                {
                    sdl_pc = 133;
                    continue;
                }
            },
            133 => {
                _ = close(stdout_pipe[WRITE_END]);
                {
                    sdl_pc = 130;
                    continue;
                }
            },
            134 => {
                if (!SetupStream(process, stderr_pipe[READ_END], "rb", "SDL.process.stderr")) {
                    sdl_pc = 137;
                    continue;
                } else {
                    sdl_pc = 138;
                    continue;
                }
            },
            135 => {
                {
                    sdl_pc = 136;
                    continue;
                }
            },
            136 => {
                _ = posix_spawn_file_actions_destroy(&fa);
                _ = posix_spawnattr_destroy(&attr);
                SDL_free_REAL(@ptrCast(@alignCast(envp)));
                return @"true" != 0;
            },
            137 => {
                _ = close(stderr_pipe[READ_END]);
                {
                    sdl_pc = 139;
                    continue;
                }
            },
            138 => {
                {
                    sdl_pc = 139;
                    continue;
                }
            },
            139 => {
                _ = close(stderr_pipe[WRITE_END]);
                {
                    sdl_pc = 136;
                    continue;
                }
            },
            140 => {
                _ = close(stdin_pipe[READ_END]);
                {
                    sdl_pc = 142;
                    continue;
                }
            },
            141 => {
                {
                    sdl_pc = 142;
                    continue;
                }
            },
            142 => {
                if (stdin_pipe[WRITE_END] >= @as(c_int, 0)) {
                    sdl_pc = 143;
                    continue;
                } else {
                    sdl_pc = 144;
                    continue;
                }
            },
            143 => {
                _ = close(stdin_pipe[WRITE_END]);
                {
                    sdl_pc = 145;
                    continue;
                }
            },
            144 => {
                {
                    sdl_pc = 145;
                    continue;
                }
            },
            145 => {
                if (stdout_pipe[READ_END] >= @as(c_int, 0)) {
                    sdl_pc = 146;
                    continue;
                } else {
                    sdl_pc = 147;
                    continue;
                }
            },
            146 => {
                _ = close(stdout_pipe[READ_END]);
                {
                    sdl_pc = 148;
                    continue;
                }
            },
            147 => {
                {
                    sdl_pc = 148;
                    continue;
                }
            },
            148 => {
                if (stdout_pipe[WRITE_END] >= @as(c_int, 0)) {
                    sdl_pc = 149;
                    continue;
                } else {
                    sdl_pc = 150;
                    continue;
                }
            },
            149 => {
                _ = close(stdout_pipe[WRITE_END]);
                {
                    sdl_pc = 151;
                    continue;
                }
            },
            150 => {
                {
                    sdl_pc = 151;
                    continue;
                }
            },
            151 => {
                if (stderr_pipe[READ_END] >= @as(c_int, 0)) {
                    sdl_pc = 152;
                    continue;
                } else {
                    sdl_pc = 153;
                    continue;
                }
            },
            152 => {
                _ = close(stderr_pipe[READ_END]);
                {
                    sdl_pc = 154;
                    continue;
                }
            },
            153 => {
                {
                    sdl_pc = 154;
                    continue;
                }
            },
            154 => {
                if (stderr_pipe[WRITE_END] >= @as(c_int, 0)) {
                    sdl_pc = 155;
                    continue;
                } else {
                    sdl_pc = 156;
                    continue;
                }
            },
            155 => {
                _ = close(stderr_pipe[WRITE_END]);
                {
                    sdl_pc = 157;
                    continue;
                }
            },
            156 => {
                {
                    sdl_pc = 157;
                    continue;
                }
            },
            157 => {
                SDL_free_REAL(@ptrCast(@alignCast(envp)));
                return @"false" != 0;
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_SYS_KillProcess(process: [*c]SDL_Process, force: bool) bool {
    @setEvalBranchQuota(100000);
    var ret: c_int = kill(process.*.internal.*.pid, if (force) SIGKILL else SIGTERM);
    _ = &ret;
    if (ret == @as(c_int, 0)) {
        return @"true" != 0;
    } else {
        return SDL_SetError_REAL("Could not kill(): %s", strerror(__errno_location().*));
    }
}
pub export fn SDL_SYS_WaitProcess(process: [*c]SDL_Process, block: bool, exitcode: [*c]c_int) bool {
    @setEvalBranchQuota(100000);
    var wstatus: c_int = 0;
    _ = &wstatus;
    var ret: c_int = undefined;
    _ = &ret;
    var pid: pid_t = process.*.internal.*.pid;
    _ = &pid;
    if (process.*.background) {
        if (block) {
            while (kill(pid, 0) == @as(c_int, 0)) {
                SDL_Delay_REAL(10);
            }
        } else {
            if (kill(pid, 0) == @as(c_int, 0)) {
                return @"false" != 0;
            }
        }
        exitcode.* = 0;
        return @"true" != 0;
    } else {
        ret = waitpid(pid, &wstatus, if (block) @as(c_int, 0) else WNOHANG);
        if (ret < @as(c_int, 0)) {
            return SDL_SetError_REAL("Could not waitpid(): %s", strerror(__errno_location().*));
        }
        if (ret == @as(c_int, 0)) {
            _ = SDL_ClearError_REAL();
            return @"false" != 0;
        }
        if ((wstatus & @as(c_int, 127)) == @as(c_int, 0)) {
            exitcode.* = (wstatus & @as(c_int, 65280)) >> @intCast(@as(c_int, 8));
        } else if ((@as(c_int, @as(i8, @truncate((wstatus & @as(c_int, 127)) + @as(c_int, 1)))) >> @intCast(@as(c_int, 1))) > @as(c_int, 0)) {
            exitcode.* = -(wstatus & @as(c_int, 127));
        } else {
            exitcode.* = -@as(c_int, 255);
        }
        return @"true" != 0;
    }
    return undefined;
}
pub export fn SDL_SYS_DestroyProcess(process: [*c]SDL_Process) void {
    @setEvalBranchQuota(100000);
    var io: ?*SDL_IOStream = undefined;
    _ = &io;
    io = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(process.*.props, "SDL.process.stdin", null)));
    if (io != null) {
        _ = SDL_CloseIO_REAL(io);
    }
    io = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(process.*.props, "SDL.process.stdout", null)));
    if (io != null) {
        _ = SDL_CloseIO_REAL(io);
    }
    io = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(process.*.props, "SDL.process.stderr", null)));
    if (io != null) {
        _ = SDL_CloseIO_REAL(io);
    }
    SDL_free_REAL(@ptrCast(@alignCast(process.*.internal)));
}

pub const WNOHANG = @as(c_int, 1);
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const O_RDONLY = @as(c_int, 0o0);
pub const O_WRONLY = @as(c_int, 0o1);
pub const O_NONBLOCK = @as(c_int, 0o4000);
pub const F_GETFD = @as(c_int, 1);
pub const F_SETFD = @as(c_int, 2);
pub const F_GETFL = @as(c_int, 3);
pub const F_SETFL = @as(c_int, 4);
pub const FD_CLOEXEC = @as(c_int, 1);
pub const SIGTERM = @as(c_int, 15);
pub const SIGKILL = @as(c_int, 9);
pub const SIGPIPE = @as(c_int, 13);
pub const si_pid = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:128:9
pub const si_uid = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:129:9
pub const si_overrun = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:131:9
pub const si_status = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:132:9
pub const si_utime = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:133:9
pub const si_stime = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:134:9
pub const si_addr = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:138:9
pub const si_addr_lsb = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:139:9
pub const si_band = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:143:9
pub const si_fd = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:144:9
pub const sa_handler = @compileError("unable to translate macro: undefined identifier `__sigaction_handler`");
// /usr/include/bits/sigaction.h:39:10
pub const sa_sigaction = @compileError("unable to translate macro: undefined identifier `__sigaction_handler`");
// /usr/include/bits/sigaction.h:40:10
pub const STDIN_FILENO = @as(c_int, 0);
pub const STDOUT_FILENO = @as(c_int, 1);
pub const STDERR_FILENO = @as(c_int, 2);
pub const sched_priority = @compileError("unable to translate macro: undefined identifier `sched_priority`");
// /usr/include/sched.h:47:9
pub const READ_END = @as(c_int, 0);
pub const WRITE_END = @as(c_int, 1);
