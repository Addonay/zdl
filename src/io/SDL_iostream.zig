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
pub const __off64_t = c_long;
pub const __time_t = c_long;
pub const __blksize_t = c_long;
pub const __blkcnt_t = c_long;
pub const __syscall_slong_t = c_long;
pub const off_t = __off_t;
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
pub const __builtin_va_list = [1]struct___va_list_tag_2;
pub const va_list = __builtin_va_list;
pub const struct__IO_FILE = opaque {
};
pub const FILE = struct__IO_FILE;
pub extern fn fclose(__stream: ?*FILE) c_int;
pub extern fn fflush(__stream: ?*FILE) c_int;
pub extern fn fopen64(noalias __filename: [*c]const u8, noalias __modes: [*c]const u8) ?*FILE;
pub extern fn fread(noalias __ptr: ?*anyopaque, __size: usize, __n: usize, noalias __stream: ?*FILE) usize;
pub extern fn fwrite(noalias __ptr: ?*const anyopaque, __size: usize, __n: usize, noalias __s: ?*FILE) usize;
pub extern fn fseeko64(__stream: ?*FILE, __off: __off64_t, __whence: c_int) c_int;
pub extern fn ftello64(__stream: ?*FILE) __off64_t;
pub extern fn clearerr(__stream: ?*FILE) void;
pub extern fn feof(__stream: ?*FILE) c_int;
pub extern fn ferror(__stream: ?*FILE) c_int;
pub extern fn fileno(__stream: ?*FILE) c_int;
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub extern fn strerror(__errnum: c_int) [*c]u8;
pub const Sint8 = i8;
pub const Uint8 = u8;
pub const Sint16 = i16;
pub const Uint16 = u16;
pub const Sint32 = i32;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub const Uint64 = u64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_realloc_REAL(mem: ?*anyopaque, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub const SDL_free_func = ?*const fn (mem: ?*anyopaque) callconv(.c) void;
pub extern fn SDL_vasprintf_REAL(strp: [*c][*c]u8, fmt: [*c]const u8, ap: [*c]struct___va_list_tag_2) c_int;
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
pub extern fn SDL_ClearError_REAL() bool;
pub const SDL_PropertiesID = Uint32;
pub extern fn SDL_CreateProperties_REAL() SDL_PropertiesID;
pub extern fn SDL_SetPointerProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: ?*anyopaque) bool;
pub extern fn SDL_SetNumberProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: Sint64) bool;
pub extern fn SDL_GetPointerProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: ?*anyopaque) ?*anyopaque;
pub extern fn SDL_GetNumberProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: Sint64) Sint64;
pub extern fn SDL_DestroyProperties_REAL(props: SDL_PropertiesID) void;
pub const SDL_IO_STATUS_READY: c_int = 0;
pub const SDL_IO_STATUS_ERROR: c_int = 1;
pub const SDL_IO_STATUS_EOF: c_int = 2;
pub const SDL_IO_STATUS_NOT_READY: c_int = 3;
pub const SDL_IO_STATUS_READONLY: c_int = 4;
pub const SDL_IO_STATUS_WRITEONLY: c_int = 5;
pub const enum_SDL_IOStatus = c_uint;
pub const SDL_IOStatus = enum_SDL_IOStatus;
pub const SDL_IO_SEEK_SET: c_int = 0;
pub const SDL_IO_SEEK_CUR: c_int = 1;
pub const SDL_IO_SEEK_END: c_int = 2;
pub const enum_SDL_IOWhence = c_uint;
pub const SDL_IOWhence = enum_SDL_IOWhence;
pub const struct_SDL_IOStreamInterface = extern struct {
    version: Uint32 = 0,
    size: ?*const fn (userdata: ?*anyopaque) callconv(.c) Sint64 = null,
    seek: ?*const fn (userdata: ?*anyopaque, offset: Sint64, whence: SDL_IOWhence) callconv(.c) Sint64 = null,
    read: ?*const fn (userdata: ?*anyopaque, ptr: ?*anyopaque, size: usize, status: [*c]SDL_IOStatus) callconv(.c) usize = null,
    write: ?*const fn (userdata: ?*anyopaque, ptr: ?*const anyopaque, size: usize, status: [*c]SDL_IOStatus) callconv(.c) usize = null,
    flush: ?*const fn (userdata: ?*anyopaque, status: [*c]SDL_IOStatus) callconv(.c) bool = null,
    close: ?*const fn (userdata: ?*anyopaque) callconv(.c) bool = null,
};
pub const SDL_IOStreamInterface = struct_SDL_IOStreamInterface;
comptime {
    if (!(((@sizeOf(?*anyopaque) == @as(c_ulong, 4)) and (@sizeOf(SDL_IOStreamInterface) == @as(c_ulong, 28))) or ((@sizeOf(?*anyopaque) == @as(c_ulong, 8)) and (@sizeOf(SDL_IOStreamInterface) == @as(c_ulong, 56))))) @compileError("static assertion failed \"(sizeof(void *) == 4 && sizeof(SDL_IOStreamInterface) == 28) || (sizeof(void *) == 8 && sizeof(SDL_IOStreamInterface) == 56)\"");
}
pub const SetIOPropertiesFn = ?*const fn (props: SDL_PropertiesID, userdata: ?*anyopaque) callconv(.c) bool;
pub const struct_SDL_IOStream = extern struct {
    iface: SDL_IOStreamInterface = @import("std").mem.zeroes(SDL_IOStreamInterface),
    userdata: ?*anyopaque = null,
    setioprops: SetIOPropertiesFn = null,
    status: SDL_IOStatus = @import("std").mem.zeroes(SDL_IOStatus),
    props: SDL_PropertiesID = 0,
};
pub const SDL_IOStream = struct_SDL_IOStream;
pub extern fn SDL_Delay_REAL(ms: Uint32) void;
pub extern fn lseek(__fd: c_int, __offset: __off_t, __whence: c_int) __off_t;
pub extern fn close(__fd: c_int) c_int;
pub extern fn read(__fd: c_int, __buf: ?*anyopaque, __nbytes: usize) isize;
pub extern fn write(__fd: c_int, __buf: ?*const anyopaque, __n: usize) isize;
pub extern fn truncate(__file: [*c]const u8, __length: __off_t) c_int;
pub extern fn fdatasync(__fildes: c_int) c_int;
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
pub extern fn fstat(__fd: c_int, __buf: [*c]struct_stat) c_int;
pub const struct_IOStreamFDData = extern struct {
    fd: c_int = 0,
    autoclose: bool = false,
};
pub const IOStreamFDData = struct_IOStreamFDData;
pub fn SDL_fdatasync(fd: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var result: c_int = 0;
    _ = &result;
    result = fdatasync(fd);
    return result;
}
pub fn fd_seek(userdata: ?*anyopaque, offset: Sint64, whence: SDL_IOWhence) callconv(.c) Sint64 {
    @setEvalBranchQuota(100000);
    var iodata: [*c]IOStreamFDData = undefined;
    _ = &iodata;
    var fdwhence: c_int = undefined;
    _ = &fdwhence;
    var result: off_t = undefined;
    _ = &result;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                iodata = @ptrCast(@alignCast(userdata));
                switch (whence) {
                    @as(SDL_IOWhence, SDL_IO_SEEK_SET) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_IOWhence, SDL_IO_SEEK_CUR) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SDL_IOWhence, SDL_IO_SEEK_END) => {
                        sdl_pc = 4;
                        continue;
                    },
                    else => {
                        sdl_pc = 5;
                        continue;
                    },
                }
            },
            1 => {
                result = lseek(iodata.*.fd, offset, fdwhence);
                if (result < @as(off_t, 0)) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 7;
                    continue;
                }
            },
            2 => {
                fdwhence = SEEK_SET;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                fdwhence = SEEK_CUR;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                fdwhence = SEEK_END;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            5 => {
                _ = SDL_SetError_REAL("Unknown value for 'whence'");
                return -@as(c_int, 1);
            },
            6 => {
                _ = SDL_SetError_REAL("Couldn't get stream offset: %s", strerror(__errno_location().*));
                {
                    sdl_pc = 8;
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
                return result;
            },
            else => unreachable,
        }
    }
}
pub fn fd_read(userdata: ?*anyopaque, ptr: ?*anyopaque, size: usize, status: [*c]SDL_IOStatus) callconv(.c) usize {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [7:0]u8 = "fd_read".*;
    };
    _ = &static_local___func__;
    var iodata: [*c]IOStreamFDData = @ptrCast(@alignCast(userdata));
    _ = &iodata;
    var bytes: isize = undefined;
    _ = &bytes;
    while (true) {
        bytes = read(iodata.*.fd, ptr, size);
        if (!((bytes < @as(isize, 0)) and (__errno_location().* == EINTR))) break;
    }
    var result: isize = bytes;
    _ = &result;
    if ((bytes > @as(isize, 0)) and (@as(usize, @bitCast(@as(c_long, bytes))) < size)) {
        while (true) {
            result = read(iodata.*.fd, @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(ptr))) + @as(usize, @bitCast(@as(isize, @intCast(bytes)))))), size -% @as(usize, @bitCast(@as(c_long, bytes))));
            if (!((result < @as(isize, 0)) and (__errno_location().* == EINTR))) break;
        }
        if (result > @as(isize, 0)) {
            bytes += result;
            result = bytes;
            while (true) {
                while (!(@as(usize, @bitCast(@as(c_long, bytes))) <= size)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "bytes <= size",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_iostream.c", 565);
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
        }
    }
    if (result < @as(isize, 0)) {
        if (__errno_location().* == EAGAIN) {
            status.* = SDL_IO_STATUS_NOT_READY;
        } else {
            status.* = SDL_IO_STATUS_ERROR;
            _ = SDL_SetError_REAL("Error reading from datastream: %s", strerror(__errno_location().*));
        }
        if (bytes < @as(isize, 0)) {
            bytes = 0;
        }
    } else if (result == @as(isize, 0)) {
        status.* = SDL_IO_STATUS_EOF;
    } else if (@as(usize, @bitCast(@as(c_long, result))) < size) {
        status.* = SDL_IO_STATUS_NOT_READY;
    }
    return @bitCast(@as(c_long, bytes));
}
pub fn fd_write(userdata: ?*anyopaque, ptr: ?*const anyopaque, size: usize, status: [*c]SDL_IOStatus) callconv(.c) usize {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [8:0]u8 = "fd_write".*;
    };
    _ = &static_local___func__;
    var iodata: [*c]IOStreamFDData = @ptrCast(@alignCast(userdata));
    _ = &iodata;
    var bytes: isize = undefined;
    _ = &bytes;
    while (true) {
        bytes = write(iodata.*.fd, ptr, size);
        if (!((bytes < @as(isize, 0)) and (__errno_location().* == EINTR))) break;
    }
    var result: isize = bytes;
    _ = &result;
    if ((bytes > @as(isize, 0)) and (@as(usize, @bitCast(@as(c_long, bytes))) < size)) {
        while (true) {
            result = write(iodata.*.fd, @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(@constCast(ptr)))) + @as(usize, @bitCast(@as(isize, @intCast(bytes)))))), size -% @as(usize, @bitCast(@as(c_long, bytes))));
            if (!((result < @as(isize, 0)) and (__errno_location().* == EINTR))) break;
        }
        if (result > @as(isize, 0)) {
            bytes += result;
            result = bytes;
            while (true) {
                while (!(@as(usize, @bitCast(@as(c_long, bytes))) <= size)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "bytes <= size",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_iostream.c", 605);
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
        }
    }
    if (result < @as(isize, 0)) {
        if (__errno_location().* == EAGAIN) {
            status.* = SDL_IO_STATUS_NOT_READY;
        } else {
            status.* = SDL_IO_STATUS_ERROR;
            _ = SDL_SetError_REAL("Error writing to datastream: %s", strerror(__errno_location().*));
        }
        if (bytes < @as(isize, 0)) {
            bytes = 0;
        }
    } else if (@as(usize, @bitCast(@as(c_long, result))) < size) {
        status.* = SDL_IO_STATUS_NOT_READY;
    }
    return @bitCast(@as(c_long, bytes));
}
pub fn fd_flush(userdata: ?*anyopaque, _: [*c]SDL_IOStatus) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var iodata: [*c]IOStreamFDData = @ptrCast(@alignCast(userdata));
    _ = &iodata;
    var result: c_int = undefined;
    _ = &result;
    while (true) {
        result = SDL_fdatasync(iodata.*.fd);
        if (!((result < @as(c_int, 0)) and (__errno_location().* == EINTR))) break;
    }
    if ((result < @as(c_int, 0)) and (__errno_location().* != EINVAL)) {
        return SDL_SetError_REAL("Error flushing datastream: %s", strerror(__errno_location().*));
    }
    return @"true" != 0;
}
pub fn fd_close(userdata: ?*anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var iodata: [*c]IOStreamFDData = @ptrCast(@alignCast(userdata));
    _ = &iodata;
    var status: bool = @"true" != 0;
    _ = &status;
    if (iodata.*.autoclose) {
        if (close(iodata.*.fd) < @as(c_int, 0)) {
            status = SDL_SetError_REAL("Error closing datastream: %s", strerror(__errno_location().*));
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(iodata)));
    return status;
}
pub fn fd_setioprops(props: SDL_PropertiesID, userdata: ?*anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var iodata: [*c]const IOStreamFDData = @ptrCast(@alignCast(userdata));
    _ = &iodata;
    return SDL_SetNumberProperty_REAL(props, "SDL.iostream.file_descriptor", iodata.*.fd);
}
pub export fn SDL_IOFromFD(fd: c_int, autoclose: bool) [*c]SDL_IOStream {
    @setEvalBranchQuota(100000);
    var iodata: [*c]IOStreamFDData = undefined;
    iodata = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(iodata.*)))));
    _ = &iodata;
    if (!(iodata != null)) {
        if (autoclose) {
            _ = close(fd);
        }
        return null;
    }
    var iface: SDL_IOStreamInterface = undefined;
    _ = &iface;
    while (true) {
        _ = memset(@ptrCast(@alignCast(&iface)), 0, @sizeOf(@TypeOf((&iface).*)));
        (&iface).*.version = @truncate(@sizeOf(@TypeOf((&iface).*)));
        if (!false) break;
    }
    iface.seek = fd_seek;
    iface.read = fd_read;
    iface.write = fd_write;
    iface.flush = fd_flush;
    iface.close = fd_close;
    iodata.*.fd = fd;
    iodata.*.autoclose = autoclose;
    var iostr: [*c]SDL_IOStream = SDL_OpenIO_REAL(&iface, @ptrCast(@alignCast(iodata)));
    _ = &iostr;
    if (!(iostr != null)) {
        _ = iface.close.?(@ptrCast(@alignCast(iodata)));
    } else {
        iostr.*.setioprops = fd_setioprops;
    }
    return iostr;
}
pub const struct_IOStreamStdioData = extern struct {
    fp: ?*FILE = null,
    autoclose: bool = false,
};
pub const IOStreamStdioData = struct_IOStreamStdioData;
pub fn stdio_seek(userdata: ?*anyopaque, offset: Sint64, whence: SDL_IOWhence) callconv(.c) Sint64 {
    @setEvalBranchQuota(100000);
    var iodata: [*c]IOStreamStdioData = undefined;
    _ = &iodata;
    var stdiowhence: c_int = undefined;
    _ = &stdiowhence;
    var is_noop: bool = undefined;
    _ = &is_noop;
    var pos: Sint64 = undefined;
    _ = &pos;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                iodata = @ptrCast(@alignCast(userdata));
                switch (whence) {
                    @as(SDL_IOWhence, SDL_IO_SEEK_SET) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_IOWhence, SDL_IO_SEEK_CUR) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SDL_IOWhence, SDL_IO_SEEK_END) => {
                        sdl_pc = 4;
                        continue;
                    },
                    else => {
                        sdl_pc = 5;
                        continue;
                    },
                }
            },
            1 => {
                is_noop = (whence == @as(SDL_IOWhence, SDL_IO_SEEK_CUR)) and (offset == @as(Sint64, 0));
                if (is_noop or (fseeko64(iodata.*.fp, offset, stdiowhence) == @as(c_int, 0))) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 7;
                    continue;
                }
            },
            2 => {
                stdiowhence = SEEK_SET;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                stdiowhence = SEEK_CUR;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                stdiowhence = SEEK_END;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            5 => {
                _ = SDL_SetError_REAL("Unknown value for 'whence'");
                return -@as(c_int, 1);
            },
            6 => {
                pos = ftello64(iodata.*.fp);
                if (pos < @as(Sint64, 0)) {
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
                _ = SDL_SetError_REAL("Error seeking in datastream: %s", strerror(__errno_location().*));
                return -@as(c_int, 1);
            },
            9 => {
                _ = SDL_SetError_REAL("Couldn't get stream offset: %s", strerror(__errno_location().*));
                return -@as(c_int, 1);
            },
            10 => {
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                return pos;
            },
            else => unreachable,
        }
    }
}
pub fn stdio_read(userdata: ?*anyopaque, ptr: ?*anyopaque, size: usize, status: [*c]SDL_IOStatus) callconv(.c) usize {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [10:0]u8 = "stdio_read".*;
    };
    _ = &static_local___func__;
    var iodata: [*c]IOStreamStdioData = @ptrCast(@alignCast(userdata));
    _ = &iodata;
    const bytes: usize = fread(ptr, 1, size, iodata.*.fp);
    _ = &bytes;
    if (bytes < size) {
        if (ferror(iodata.*.fp) != 0) {
            if (__errno_location().* == EAGAIN) {
                status.* = SDL_IO_STATUS_NOT_READY;
                clearerr(iodata.*.fp);
            } else {
                status.* = SDL_IO_STATUS_ERROR;
                _ = SDL_SetError_REAL("Error reading from datastream: %s", strerror(__errno_location().*));
            }
        } else {
            while (true) {
                while (!(feof(iodata.*.fp) != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "feof(iodata->fp)",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_iostream.c", 795);
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
            status.* = SDL_IO_STATUS_EOF;
        }
    }
    return bytes;
}
pub fn stdio_write(userdata: ?*anyopaque, ptr: ?*const anyopaque, size: usize, status: [*c]SDL_IOStatus) callconv(.c) usize {
    @setEvalBranchQuota(100000);
    var iodata: [*c]IOStreamStdioData = @ptrCast(@alignCast(userdata));
    _ = &iodata;
    const bytes: usize = fwrite(ptr, 1, size, iodata.*.fp);
    _ = &bytes;
    if ((bytes == @as(usize, 0)) and (ferror(iodata.*.fp) != 0)) {
        if (__errno_location().* == EAGAIN) {
            status.* = SDL_IO_STATUS_NOT_READY;
            clearerr(iodata.*.fp);
        } else {
            status.* = SDL_IO_STATUS_ERROR;
            _ = SDL_SetError_REAL("Error writing to datastream: %s", strerror(__errno_location().*));
        }
    }
    return bytes;
}
pub fn stdio_flush(userdata: ?*anyopaque, status: [*c]SDL_IOStatus) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var iodata: [*c]IOStreamStdioData = @ptrCast(@alignCast(userdata));
    _ = &iodata;
    if (fflush(iodata.*.fp) != @as(c_int, 0)) {
        if (__errno_location().* == EAGAIN) {
            status.* = SDL_IO_STATUS_NOT_READY;
            return @"false" != 0;
        } else {
            return SDL_SetError_REAL("Error flushing datastream: %s", strerror(__errno_location().*));
        }
    }
    var result: c_int = undefined;
    _ = &result;
    var fd: c_int = fileno(iodata.*.fp);
    _ = &fd;
    while (true) {
        result = SDL_fdatasync(fd);
        if (!((result < @as(c_int, 0)) and (__errno_location().* == EINTR))) break;
    }
    if (result < @as(c_int, 0)) {
        return SDL_SetError_REAL("Error flushing datastream: %s", strerror(__errno_location().*));
    }
    return @"true" != 0;
}
pub fn stdio_close(userdata: ?*anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var iodata: [*c]IOStreamStdioData = @ptrCast(@alignCast(userdata));
    _ = &iodata;
    var status: bool = @"true" != 0;
    _ = &status;
    if (iodata.*.autoclose) {
        if (fclose(iodata.*.fp) != @as(c_int, 0)) {
            status = SDL_SetError_REAL("Error closing datastream: %s", strerror(__errno_location().*));
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(iodata)));
    return status;
}
pub fn stdio_setioprops(props: SDL_PropertiesID, userdata: ?*anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var iodata: [*c]const IOStreamStdioData = @ptrCast(@alignCast(userdata));
    _ = &iodata;
    var fp: ?*FILE = iodata.*.fp;
    _ = &fp;
    return SDL_SetPointerProperty_REAL(props, "SDL.iostream.stdio.file", @ptrCast(@alignCast(fp))) and SDL_SetNumberProperty_REAL(props, "SDL.iostream.file_descriptor", fileno(fp));
}
pub export fn SDL_IOFromFP(fp: ?*FILE, autoclose: bool) [*c]SDL_IOStream {
    @setEvalBranchQuota(100000);
    var iodata: [*c]IOStreamStdioData = undefined;
    iodata = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(iodata.*)))));
    _ = &iodata;
    if (!(iodata != null)) {
        if (autoclose) {
            _ = fclose(fp);
        }
        return null;
    }
    var iface: SDL_IOStreamInterface = undefined;
    _ = &iface;
    while (true) {
        _ = memset(@ptrCast(@alignCast(&iface)), 0, @sizeOf(@TypeOf((&iface).*)));
        (&iface).*.version = @truncate(@sizeOf(@TypeOf((&iface).*)));
        if (!false) break;
    }
    iface.seek = stdio_seek;
    iface.read = stdio_read;
    iface.write = stdio_write;
    iface.flush = stdio_flush;
    iface.close = stdio_close;
    iodata.*.fp = fp;
    iodata.*.autoclose = autoclose;
    var iostr: [*c]SDL_IOStream = SDL_OpenIO_REAL(&iface, @ptrCast(@alignCast(iodata)));
    _ = &iostr;
    if (!(iostr != null)) {
        _ = iface.close.?(@ptrCast(@alignCast(iodata)));
    } else {
        iostr.*.setioprops = stdio_setioprops;
    }
    return iostr;
}
pub const struct_IOStreamMemData = extern struct {
    base: [*c]Uint8 = null,
    here: [*c]Uint8 = null,
    stop: [*c]Uint8 = null,
    size: usize = 0,
    props: SDL_PropertiesID = 0,
};
pub const IOStreamMemData = struct_IOStreamMemData;
pub fn mem_size(userdata: ?*anyopaque) callconv(.c) Sint64 {
    @setEvalBranchQuota(100000);
    var iodata: [*c]const IOStreamMemData = @ptrCast(@alignCast(userdata));
    _ = &iodata;
    return @divExact(@as(c_long, @bitCast(@intFromPtr(iodata.*.stop) -% @intFromPtr(iodata.*.base))), @sizeOf(Uint8));
}
pub fn mem_seek(userdata: ?*anyopaque, offset: Sint64, whence: SDL_IOWhence) callconv(.c) Sint64 {
    @setEvalBranchQuota(100000);
    var iodata: [*c]IOStreamMemData = undefined;
    _ = &iodata;
    var newpos: [*c]Uint8 = undefined;
    _ = &newpos;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                iodata = @ptrCast(@alignCast(userdata));
                switch (whence) {
                    @as(SDL_IOWhence, SDL_IO_SEEK_SET) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_IOWhence, SDL_IO_SEEK_CUR) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SDL_IOWhence, SDL_IO_SEEK_END) => {
                        sdl_pc = 4;
                        continue;
                    },
                    else => {
                        sdl_pc = 5;
                        continue;
                    },
                }
            },
            1 => {
                if (newpos < iodata.*.base) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 7;
                    continue;
                }
            },
            2 => {
                newpos = iodata.*.base + @as(usize, @bitCast(@as(isize, @intCast(offset))));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                newpos = iodata.*.here + @as(usize, @bitCast(@as(isize, @intCast(offset))));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                newpos = iodata.*.stop + @as(usize, @bitCast(@as(isize, @intCast(offset))));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            5 => {
                _ = SDL_SetError_REAL("Unknown value for 'whence'");
                return -@as(c_int, 1);
            },
            6 => {
                newpos = iodata.*.base;
                {
                    sdl_pc = 8;
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
                if (newpos > iodata.*.stop) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
            },
            9 => {
                newpos = iodata.*.stop;
                {
                    sdl_pc = 11;
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
                iodata.*.here = newpos;
                return @divExact(@as(c_long, @bitCast(@intFromPtr(iodata.*.here) -% @intFromPtr(iodata.*.base))), @sizeOf(Uint8));
            },
            else => unreachable,
        }
    }
}
pub fn mem_io(userdata: ?*anyopaque, dst: ?*anyopaque, src: ?*const anyopaque, arg_size: usize) callconv(.c) usize {
    @setEvalBranchQuota(100000);
    var size = arg_size;
    _ = &size;
    var iodata: [*c]IOStreamMemData = @ptrCast(@alignCast(userdata));
    _ = &iodata;
    const mem_available: usize = @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(iodata.*.stop) -% @intFromPtr(iodata.*.here))), @sizeOf(Uint8))));
    _ = &mem_available;
    if (size > mem_available) {
        size = mem_available;
    }
    _ = memcpy(dst, src, size);
    iodata.*.here += size;
    return size;
}
pub fn mem_read(userdata: ?*anyopaque, ptr: ?*anyopaque, size: usize, status: [*c]SDL_IOStatus) callconv(.c) usize {
    @setEvalBranchQuota(100000);
    var iodata: [*c]IOStreamMemData = @ptrCast(@alignCast(userdata));
    _ = &iodata;
    const retval: usize = mem_io(userdata, ptr, @ptrCast(@alignCast(iodata.*.here)), size);
    _ = &retval;
    if ((retval < size) and (iodata.*.stop == iodata.*.here)) {
        status.* = SDL_IO_STATUS_EOF;
    }
    return retval;
}
pub fn mem_write(userdata: ?*anyopaque, ptr: ?*const anyopaque, size: usize, status: [*c]SDL_IOStatus) callconv(.c) usize {
    @setEvalBranchQuota(100000);
    var iodata: [*c]IOStreamMemData = @ptrCast(@alignCast(userdata));
    _ = &iodata;
    const retval: usize = mem_io(userdata, @ptrCast(@alignCast(iodata.*.here)), ptr, size);
    _ = &retval;
    if ((retval < size) and (iodata.*.stop == iodata.*.here)) {
        _ = SDL_SetError_REAL("Memory buffer is full");
        status.* = SDL_IO_STATUS_ERROR;
    }
    return retval;
}
pub fn mem_close(userdata: ?*anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var iodata: [*c]IOStreamMemData = @ptrCast(@alignCast(userdata));
    _ = &iodata;
    var free_func: SDL_free_func = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(iodata.*.props, "SDL.iostream.memory.free", null)));
    _ = &free_func;
    if (free_func != null) {
        free_func.?(@ptrCast(@alignCast(iodata.*.base)));
    }
    SDL_free_REAL(userdata);
    return @"true" != 0;
}
pub fn mem_setioprops(props: SDL_PropertiesID, userdata: ?*anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [14:0]u8 = "mem_setioprops".*;
    };
    _ = &static_local___func__;
    var iodata: [*c]IOStreamMemData = @ptrCast(@alignCast(userdata));
    _ = &iodata;
    if (!SDL_SetPointerProperty_REAL(props, "SDL.iostream.memory.base", @ptrCast(@alignCast(iodata.*.base))) or !SDL_SetNumberProperty_REAL(props, "SDL.iostream.memory.size", @bitCast(@as(c_ulong, @truncate(iodata.*.size))))) {
        return @"false" != 0;
    }
    while (true) {
        while (!(iodata.*.props == @as(SDL_PropertiesID, 0))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "iodata->props == 0",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_iostream.c", 993);
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
    iodata.*.props = props;
    return @"true" != 0;
}
pub fn IsStdioFileADirectory(f: ?*FILE) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var st: struct_stat = undefined;
    _ = &st;
    return (fstat(fileno(f), &st) == @as(c_int, 0)) and ((st.st_mode & @as(__mode_t, __S_IFMT)) == @as(__mode_t, @bitCast(@as(c_int, __S_IFDIR))));
}
pub export fn SDL_IOFromFile_REAL(file: [*c]const u8, mode: [*c]const u8) [*c]SDL_IOStream {
    @setEvalBranchQuota(100000);
    var iostr: [*c]SDL_IOStream = null;
    _ = &iostr;
    if (!(file != null) or !(@as(c_int, file.*) != 0)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("file"))));
        return null;
    }
    if (!(mode != null) or !(@as(c_int, mode.*) != 0)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("mode"))));
        return null;
    }
    {
        var fp: ?*FILE = fopen64(file, mode);
        _ = &fp;
        if (!(fp != null)) {
            _ = SDL_SetError_REAL("Couldn't open %s: %s", file, strerror(__errno_location().*));
        } else if (IsStdioFileADirectory(fp)) {
            _ = fclose(fp);
            _ = SDL_SetError_REAL("%s is a directory", file);
        } else {
            iostr = SDL_IOFromFP(fp, @"true" != 0);
        }
    }
    return iostr;
}
pub export fn SDL_IOFromMem_REAL(mem: ?*anyopaque, size: usize) [*c]SDL_IOStream {
    @setEvalBranchQuota(100000);
    if ((size != 0) and (@as(usize, @bitCast(@as(c_long, @intFromBool(!(mem != null))))) != 0)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("mem"))));
        return null;
    }
    var iodata: [*c]IOStreamMemData = undefined;
    iodata = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(iodata.*)))));
    _ = &iodata;
    if (!(iodata != null)) {
        return null;
    }
    var iface: SDL_IOStreamInterface = undefined;
    _ = &iface;
    while (true) {
        _ = memset(@ptrCast(@alignCast(&iface)), 0, @sizeOf(@TypeOf((&iface).*)));
        (&iface).*.version = @truncate(@sizeOf(@TypeOf((&iface).*)));
        if (!false) break;
    }
    iface.size = mem_size;
    iface.seek = mem_seek;
    iface.read = mem_read;
    iface.write = mem_write;
    iface.close = mem_close;
    iodata.*.base = @ptrCast(@alignCast(mem));
    iodata.*.here = iodata.*.base;
    iodata.*.stop = iodata.*.base + size;
    iodata.*.size = size;
    var iostr: [*c]SDL_IOStream = SDL_OpenIO_REAL(&iface, @ptrCast(@alignCast(iodata)));
    _ = &iostr;
    if (!(iostr != null)) {
        SDL_free_REAL(@ptrCast(@alignCast(iodata)));
    } else {
        iostr.*.setioprops = mem_setioprops;
    }
    return iostr;
}
pub export fn SDL_IOFromConstMem_REAL(mem: ?*const anyopaque, size: usize) [*c]SDL_IOStream {
    @setEvalBranchQuota(100000);
    if ((size != 0) and (@as(usize, @bitCast(@as(c_long, @intFromBool(!(mem != null))))) != 0)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("mem"))));
        return null;
    }
    var iodata: [*c]IOStreamMemData = undefined;
    iodata = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(iodata.*)))));
    _ = &iodata;
    if (!(iodata != null)) {
        return null;
    }
    var iface: SDL_IOStreamInterface = undefined;
    _ = &iface;
    while (true) {
        _ = memset(@ptrCast(@alignCast(&iface)), 0, @sizeOf(@TypeOf((&iface).*)));
        (&iface).*.version = @truncate(@sizeOf(@TypeOf((&iface).*)));
        if (!false) break;
    }
    iface.size = mem_size;
    iface.seek = mem_seek;
    iface.read = mem_read;
    iface.close = mem_close;
    iodata.*.base = @ptrCast(@alignCast(@constCast(mem)));
    iodata.*.here = iodata.*.base;
    iodata.*.stop = iodata.*.base + size;
    iodata.*.size = size;
    var iostr: [*c]SDL_IOStream = SDL_OpenIO_REAL(&iface, @ptrCast(@alignCast(iodata)));
    _ = &iostr;
    if (!(iostr != null)) {
        SDL_free_REAL(@ptrCast(@alignCast(iodata)));
    } else {
        iostr.*.setioprops = mem_setioprops;
    }
    return iostr;
}
pub const struct_IOStreamDynamicMemData = extern struct {
    props: SDL_PropertiesID = 0,
    data: IOStreamMemData = @import("std").mem.zeroes(IOStreamMemData),
    end: [*c]Uint8 = null,
};
pub const IOStreamDynamicMemData = struct_IOStreamDynamicMemData;
pub fn dynamic_mem_size(userdata: ?*anyopaque) callconv(.c) Sint64 {
    @setEvalBranchQuota(100000);
    var iodata: [*c]IOStreamDynamicMemData = @ptrCast(@alignCast(userdata));
    _ = &iodata;
    return mem_size(@ptrCast(@alignCast(&iodata.*.data)));
}
pub fn dynamic_mem_seek(userdata: ?*anyopaque, offset: Sint64, whence: SDL_IOWhence) callconv(.c) Sint64 {
    @setEvalBranchQuota(100000);
    var iodata: [*c]IOStreamDynamicMemData = @ptrCast(@alignCast(userdata));
    _ = &iodata;
    return mem_seek(@ptrCast(@alignCast(&iodata.*.data)), offset, whence);
}
pub fn dynamic_mem_read(userdata: ?*anyopaque, ptr: ?*anyopaque, size: usize, status: [*c]SDL_IOStatus) callconv(.c) usize {
    @setEvalBranchQuota(100000);
    var iodata: [*c]IOStreamDynamicMemData = @ptrCast(@alignCast(userdata));
    _ = &iodata;
    const retval: usize = mem_io(@ptrCast(@alignCast(&iodata.*.data)), ptr, @ptrCast(@alignCast(iodata.*.data.here)), size);
    _ = &retval;
    if ((retval < size) and (iodata.*.data.stop == iodata.*.data.here)) {
        status.* = SDL_IO_STATUS_EOF;
    }
    return retval;
}
pub fn dynamic_mem_realloc(iodata: [*c]IOStreamDynamicMemData, size: usize) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var chunksize: usize = @bitCast(@as(c_long, SDL_GetNumberProperty_REAL(iodata.*.props, "SDL.iostream.dynamic.chunksize", 1024)));
    _ = &chunksize;
    if (!(chunksize != 0)) {
        chunksize = 1024;
    }
    var chunks: usize = ((@as(usize, @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(iodata.*.end) -% @intFromPtr(iodata.*.data.base))), @sizeOf(Uint8))))) +% size) / chunksize) +% @as(usize, 1);
    _ = &chunks;
    var length: usize = chunks *% chunksize;
    _ = &length;
    var base: [*c]Uint8 = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(iodata.*.data.base)), length)));
    _ = &base;
    if (!(base != null)) {
        return @"false" != 0;
    }
    var here_offset: usize = @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(iodata.*.data.here) -% @intFromPtr(iodata.*.data.base))), @sizeOf(Uint8))));
    _ = &here_offset;
    var stop_offset: usize = @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(iodata.*.data.stop) -% @intFromPtr(iodata.*.data.base))), @sizeOf(Uint8))));
    _ = &stop_offset;
    iodata.*.data.base = base;
    iodata.*.data.here = base + here_offset;
    iodata.*.data.stop = base + stop_offset;
    iodata.*.end = base + length;
    return (if (iodata.*.props != 0) @as(c_int, @intFromBool(SDL_SetPointerProperty_REAL(iodata.*.props, "SDL.iostream.dynamic.memory", @ptrCast(@alignCast(base))))) else @"true") != 0;
}
pub fn dynamic_mem_write(userdata: ?*anyopaque, ptr: ?*const anyopaque, size: usize, status: [*c]SDL_IOStatus) callconv(.c) usize {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [17:0]u8 = "dynamic_mem_write".*;
    };
    _ = &static_local___func__;
    var iodata: [*c]IOStreamDynamicMemData = @ptrCast(@alignCast(userdata));
    _ = &iodata;
    if (size > @as(usize, @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(iodata.*.data.stop) -% @intFromPtr(iodata.*.data.here))), @sizeOf(Uint8)))))) {
        if (size > @as(usize, @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(iodata.*.end) -% @intFromPtr(iodata.*.data.here))), @sizeOf(Uint8)))))) {
            if (!dynamic_mem_realloc(iodata, size)) {
                status.* = SDL_IO_STATUS_ERROR;
                return 0;
            }
        }
        iodata.*.data.stop = iodata.*.data.here + size;
    }
    const retval: usize = mem_io(@ptrCast(@alignCast(&iodata.*.data)), @ptrCast(@alignCast(iodata.*.data.here)), ptr, size);
    _ = &retval;
    while (true) {
        while (!(retval == size)) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "retval == size",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_iostream.c", 1337);
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
    return retval;
}
pub fn dynamic_mem_close(userdata: ?*anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var iodata: [*c]const IOStreamDynamicMemData = @ptrCast(@alignCast(userdata));
    _ = &iodata;
    var mem: ?*anyopaque = if (iodata.*.props != 0) SDL_GetPointerProperty_REAL(iodata.*.props, "SDL.iostream.dynamic.memory", null) else @as(?*anyopaque, @ptrCast(@alignCast(iodata.*.data.base)));
    _ = &mem;
    SDL_free_REAL(mem);
    SDL_free_REAL(userdata);
    return @"true" != 0;
}
pub fn dynamic_mem_setioprops(props: SDL_PropertiesID, userdata: ?*anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [22:0]u8 = "dynamic_mem_setioprops".*;
    };
    _ = &static_local___func__;
    var iodata: [*c]IOStreamDynamicMemData = @ptrCast(@alignCast(userdata));
    _ = &iodata;
    if (!SDL_SetPointerProperty_REAL(props, "SDL.iostream.dynamic.memory", @ptrCast(@alignCast(iodata.*.data.base)))) {
        return @"false" != 0;
    }
    while (true) {
        while (!(iodata.*.props == @as(SDL_PropertiesID, 0))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "iodata->props == 0",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_iostream.c", 1356);
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
    iodata.*.props = props;
    return @"true" != 0;
}
pub export fn SDL_IOFromDynamicMem_REAL() [*c]SDL_IOStream {
    @setEvalBranchQuota(100000);
    var iodata: [*c]IOStreamDynamicMemData = undefined;
    iodata = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(iodata.*)))));
    _ = &iodata;
    if (!(iodata != null)) {
        return null;
    }
    var iface: SDL_IOStreamInterface = undefined;
    _ = &iface;
    while (true) {
        _ = memset(@ptrCast(@alignCast(&iface)), 0, @sizeOf(@TypeOf((&iface).*)));
        (&iface).*.version = @truncate(@sizeOf(@TypeOf((&iface).*)));
        if (!false) break;
    }
    iface.size = dynamic_mem_size;
    iface.seek = dynamic_mem_seek;
    iface.read = dynamic_mem_read;
    iface.write = dynamic_mem_write;
    iface.close = dynamic_mem_close;
    var iostr: [*c]SDL_IOStream = SDL_OpenIO_REAL(&iface, @ptrCast(@alignCast(iodata)));
    _ = &iostr;
    if (!(iostr != null)) {
        SDL_free_REAL(@ptrCast(@alignCast(iodata)));
    } else {
        iostr.*.setioprops = dynamic_mem_setioprops;
    }
    return iostr;
}
pub export fn SDL_GetIOStatus_REAL(context: [*c]SDL_IOStream) SDL_IOStatus {
    @setEvalBranchQuota(100000);
    if (!(context != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("context"))));
        return SDL_IO_STATUS_ERROR;
    }
    return context.*.status;
}
pub export fn SDL_OpenIO_REAL(iface: [*c]const SDL_IOStreamInterface, userdata: ?*anyopaque) [*c]SDL_IOStream {
    @setEvalBranchQuota(100000);
    if (!(iface != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("iface"))));
        return null;
    }
    if (@as(c_ulong, iface.*.version) < @sizeOf(@TypeOf(iface.*))) {
        _ = SDL_SetError_REAL("Invalid interface, should be initialized with SDL_INIT_INTERFACE()");
        return null;
    }
    var iostr: [*c]SDL_IOStream = undefined;
    iostr = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(iostr.*)))));
    _ = &iostr;
    if (iostr != null) {
        {
            comptime {
                if (!(@sizeOf(@TypeOf((&iostr.*.iface).*)) == @sizeOf(@TypeOf(iface.*)))) @compileError("static assertion failed \"sizeof (*(&iostr->iface)) == sizeof (*( iface))\"");
            }
        }
        _ = memcpy(@ptrCast(@alignCast(&iostr.*.iface)), @ptrCast(@alignCast(iface)), @sizeOf(@TypeOf(iface.*)));
        iostr.*.userdata = userdata;
    }
    return iostr;
}
pub export fn SDL_CloseIO_REAL(iostr: [*c]SDL_IOStream) bool {
    @setEvalBranchQuota(100000);
    var result: bool = @"true" != 0;
    _ = &result;
    if (iostr != null) {
        if (iostr.*.iface.close != null) {
            result = iostr.*.iface.close.?(iostr.*.userdata);
        }
        SDL_DestroyProperties_REAL(iostr.*.props);
        SDL_free_REAL(@ptrCast(@alignCast(iostr)));
    }
    return result;
}
pub export fn SDL_LoadFile_IO_REAL(src: [*c]SDL_IOStream, datasize: [*c]usize, closeio: bool) ?*anyopaque {
    @setEvalBranchQuota(100000);
    var FILE_CHUNK_SIZE: c_int = undefined;
    _ = &FILE_CHUNK_SIZE;
    var size: Sint64 = undefined;
    _ = &size;
    var size_total: Sint64 = undefined;
    _ = &size_total;
    var size_read: usize = undefined;
    _ = &size_read;
    var data: [*c]u8 = undefined;
    _ = &data;
    var newdata: [*c]u8 = undefined;
    _ = &newdata;
    var loading_chunks: bool = undefined;
    _ = &loading_chunks;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                FILE_CHUNK_SIZE = 1024;
                size_total = 0;
                data = null;
                loading_chunks = @"false" != 0;
                if (!(src != null)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                if (datasize != null) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 37;
                    continue;
                }
            },
            2 => {
                _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("src"))));
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
                size = SDL_GetIOSize_REAL(src);
                if (size < @as(Sint64, 0)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                size = FILE_CHUNK_SIZE;
                loading_chunks = @"true" != 0;
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
                if (@as(c_ulong, @bitCast(@as(c_long, size))) >= (@as(c_ulong, 18446744073709551615) -% @as(c_ulong, 1))) {
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
                data = @ptrCast(@alignCast(SDL_malloc_REAL(@bitCast(@as(c_long, size + @as(Sint64, 1))))));
                if (!(data != null)) {
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
                size_total = 0;
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            14 => {
                if (true) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            15 => {
                if (loading_chunks) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            16 => {
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            17 => {
                data[@bitCast(@as(isize, @intCast(size_total)))] = '\x00';
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            18 => {
                if ((size_total + @as(Sint64, FILE_CHUNK_SIZE)) > size) {
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
                size_read = SDL_ReadIO_REAL(src, @ptrCast(@alignCast(data + @as(usize, @bitCast(@as(isize, @intCast(size_total)))))), @bitCast(@as(c_long, size - size_total)));
                if (size_read > @as(usize, 0)) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            21 => {
                size = size_total + @as(Sint64, FILE_CHUNK_SIZE);
                if (@as(c_ulong, @bitCast(@as(c_long, size))) >= (@as(c_ulong, 18446744073709551615) -% @as(c_ulong, 1))) {
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
                newdata = null;
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            25 => {
                newdata = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(data)), @bitCast(@as(c_long, size + @as(Sint64, 1))))));
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            26 => {
                if (!(newdata != null)) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            27 => {
                SDL_free_REAL(@ptrCast(@alignCast(data)));
                data = null;
                {
                    sdl_pc = 1;
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
                data = newdata;
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            30 => {
                {
                    const ref = &size_total;
                    ref.* = @bitCast(@as(c_ulong, @truncate(@as(usize, @bitCast(@as(c_long, ref.*))) +% size_read)));
                }
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            31 => {
                if (SDL_GetIOStatus_REAL(src) == @as(SDL_IOStatus, SDL_IO_STATUS_NOT_READY)) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 34;
                    continue;
                }
            },
            32 => {
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            33 => {
                SDL_Delay_REAL(1);
                {
                    sdl_pc = 16;
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
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            36 => {
                datasize.* = @bitCast(@as(c_long, size_total));
                {
                    sdl_pc = 38;
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
                if (closeio and (src != null)) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 40;
                    continue;
                }
            },
            39 => {
                _ = SDL_CloseIO_REAL(src);
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
                return @ptrCast(@alignCast(data));
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_LoadFile_REAL(file: [*c]const u8, datasize: [*c]usize) ?*anyopaque {
    @setEvalBranchQuota(100000);
    var stream: [*c]SDL_IOStream = SDL_IOFromFile_REAL(file, "rb");
    _ = &stream;
    if (!(stream != null)) {
        if (datasize != null) {
            datasize.* = 0;
        }
        return null;
    }
    return SDL_LoadFile_IO_REAL(stream, datasize, @"true" != 0);
}
pub export fn SDL_SaveFile_IO_REAL(src: [*c]SDL_IOStream, data: ?*const anyopaque, datasize: usize, closeio: bool) bool {
    @setEvalBranchQuota(100000);
    var size_written: usize = undefined;
    _ = &size_written;
    var size_total: usize = undefined;
    _ = &size_total;
    var success: bool = undefined;
    _ = &success;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                size_written = 0;
                size_total = 0;
                success = @"true" != 0;
                if (!(src != null)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                if (closeio and (src != null)) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            2 => {
                _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("src"))));
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
                if (!(data != null) and (datasize > @as(usize, 0))) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("data"))));
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
                if (datasize > @as(usize, 0)) {
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
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            11 => {
                if (size_total < datasize) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            12 => {
                size_written = SDL_WriteIO_REAL(src, @ptrCast(@alignCast(@as([*c]const u8, @ptrCast(@alignCast(data))) + size_written)), datasize -% size_written);
                if (size_written <= @as(usize, 0)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
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
                if (SDL_GetIOStatus_REAL(src) == @as(SDL_IOStatus, SDL_IO_STATUS_NOT_READY)) {
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
                size_total +%= size_written;
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            17 => {
                SDL_Delay_REAL(1);
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            18 => {
                success = @"false" != 0;
                {
                    sdl_pc = 1;
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
                _ = SDL_CloseIO_REAL(src);
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
                return success;
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_SaveFile_REAL(file: [*c]const u8, data: ?*const anyopaque, datasize: usize) bool {
    @setEvalBranchQuota(100000);
    var stream: [*c]SDL_IOStream = SDL_IOFromFile_REAL(file, "wb");
    _ = &stream;
    if (!(stream != null)) {
        return @"false" != 0;
    }
    return SDL_SaveFile_IO_REAL(stream, data, datasize, @"true" != 0);
}
pub export fn SDL_GetIOProperties_REAL(context: [*c]SDL_IOStream) SDL_PropertiesID {
    @setEvalBranchQuota(100000);
    if (!(context != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("context"))));
        return 0;
    }
    if (context.*.props == @as(SDL_PropertiesID, 0)) {
        var props: SDL_PropertiesID = SDL_CreateProperties_REAL();
        _ = &props;
        if (!(props != 0)) {
            return 0;
        }
        if ((context.*.setioprops != null) and !context.*.setioprops.?(props, context.*.userdata)) {
            SDL_DestroyProperties_REAL(props);
            return 0;
        }
        context.*.props = props;
        context.*.setioprops = null;
    }
    return context.*.props;
}
pub export fn SDL_GetIOSize_REAL(context: [*c]SDL_IOStream) Sint64 {
    @setEvalBranchQuota(100000);
    if (!(context != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("context"))));
        return -@as(c_int, 1);
    }
    if (!(context.*.iface.size != null)) {
        var pos: Sint64 = undefined;
        _ = &pos;
        var size: Sint64 = undefined;
        _ = &size;
        pos = SDL_SeekIO_REAL(context, 0, SDL_IO_SEEK_CUR);
        if (pos < @as(Sint64, 0)) {
            return -@as(c_int, 1);
        }
        size = SDL_SeekIO_REAL(context, 0, SDL_IO_SEEK_END);
        _ = SDL_SeekIO_REAL(context, pos, SDL_IO_SEEK_SET);
        return size;
    }
    return context.*.iface.size.?(context.*.userdata);
}
pub export fn SDL_SeekIO_REAL(context: [*c]SDL_IOStream, offset: Sint64, whence: SDL_IOWhence) Sint64 {
    @setEvalBranchQuota(100000);
    if (!(context != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("context"))));
        return -@as(c_int, 1);
    }
    if (!(context.*.iface.seek != null)) {
        _ = SDL_SetError_REAL("That operation is not supported");
        return -@as(c_int, 1);
    }
    return context.*.iface.seek.?(context.*.userdata, offset, whence);
}
pub export fn SDL_TellIO_REAL(context: [*c]SDL_IOStream) Sint64 {
    @setEvalBranchQuota(100000);
    return SDL_SeekIO_REAL(context, 0, SDL_IO_SEEK_CUR);
}
pub export fn SDL_ReadIO_REAL(context: [*c]SDL_IOStream, ptr: ?*anyopaque, size: usize) usize {
    @setEvalBranchQuota(100000);
    if (!(context != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("context"))));
        return 0;
    }
    if (!(context.*.iface.read != null)) {
        context.*.status = SDL_IO_STATUS_WRITEONLY;
        _ = SDL_SetError_REAL("That operation is not supported");
        return 0;
    }
    if (size == @as(usize, 0)) {
        return 0;
    }
    context.*.status = SDL_IO_STATUS_READY;
    _ = SDL_ClearError_REAL();
    return context.*.iface.read.?(context.*.userdata, ptr, size, &context.*.status);
}
pub export fn SDL_WriteIO_REAL(context: [*c]SDL_IOStream, ptr: ?*const anyopaque, size: usize) usize {
    @setEvalBranchQuota(100000);
    if (!(context != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("context"))));
        return 0;
    }
    if (!(context.*.iface.write != null)) {
        context.*.status = SDL_IO_STATUS_READONLY;
        _ = SDL_SetError_REAL("That operation is not supported");
        return 0;
    }
    if (size == @as(usize, 0)) {
        return 0;
    }
    context.*.status = SDL_IO_STATUS_READY;
    _ = SDL_ClearError_REAL();
    return context.*.iface.write.?(context.*.userdata, ptr, size, &context.*.status);
}
pub export fn SDL_IOprintf_REAL(context: [*c]SDL_IOStream, fmt: [*c]const u8, ...) usize {
    @setEvalBranchQuota(100000);
    var ap: va_list = undefined;
    _ = &ap;
    var size: c_int = undefined;
    _ = &size;
    var string: [*c]u8 = undefined;
    _ = &string;
    var bytes: usize = undefined;
    _ = &bytes;
    __builtin.va_start(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&ap))), @cVaStart());
    size = SDL_vasprintf_REAL(&string, fmt, @ptrCast(@alignCast(&ap)));
    __builtin.va_end(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&ap))));
    if (size < @as(c_int, 0)) {
        return 0;
    }
    bytes = SDL_WriteIO_REAL(context, @ptrCast(@alignCast(string)), @bitCast(@as(c_long, size)));
    SDL_free_REAL(@ptrCast(@alignCast(string)));
    return bytes;
}
pub export fn SDL_IOvprintf_REAL(context: [*c]SDL_IOStream, fmt: [*c]const u8, ap: [*c]struct___va_list_tag_2) usize {
    @setEvalBranchQuota(100000);
    var size: c_int = undefined;
    _ = &size;
    var string: [*c]u8 = undefined;
    _ = &string;
    var bytes: usize = undefined;
    _ = &bytes;
    size = SDL_vasprintf_REAL(&string, fmt, ap);
    if (size < @as(c_int, 0)) {
        return 0;
    }
    bytes = SDL_WriteIO_REAL(context, @ptrCast(@alignCast(string)), @bitCast(@as(c_long, size)));
    SDL_free_REAL(@ptrCast(@alignCast(string)));
    return bytes;
}
pub export fn SDL_FlushIO_REAL(context: [*c]SDL_IOStream) bool {
    @setEvalBranchQuota(100000);
    var result: bool = @"true" != 0;
    _ = &result;
    if (!(context != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("context"))));
    }
    context.*.status = SDL_IO_STATUS_READY;
    _ = SDL_ClearError_REAL();
    if (context.*.iface.flush != null) {
        result = context.*.iface.flush.?(context.*.userdata, &context.*.status);
    }
    if (!result and (context.*.status == @as(SDL_IOStatus, SDL_IO_STATUS_READY))) {
        context.*.status = SDL_IO_STATUS_ERROR;
    }
    return result;
}
pub export fn SDL_ReadU8_REAL(src: [*c]SDL_IOStream, value: [*c]Uint8) bool {
    @setEvalBranchQuota(100000);
    var data: Uint8 = 0;
    _ = &data;
    var result: bool = @"false" != 0;
    _ = &result;
    if (SDL_ReadIO_REAL(src, @ptrCast(@alignCast(&data)), @sizeOf(@TypeOf(data))) == @sizeOf(@TypeOf(data))) {
        result = @"true" != 0;
    }
    if (value != null) {
        value.* = data;
    }
    return result;
}
pub export fn SDL_ReadS8_REAL(src: [*c]SDL_IOStream, value: [*c]Sint8) bool {
    @setEvalBranchQuota(100000);
    var data: Sint8 = 0;
    _ = &data;
    var result: bool = @"false" != 0;
    _ = &result;
    if (SDL_ReadIO_REAL(src, @ptrCast(@alignCast(&data)), @sizeOf(@TypeOf(data))) == @sizeOf(@TypeOf(data))) {
        result = @"true" != 0;
    }
    if (value != null) {
        value.* = data;
    }
    return result;
}
pub export fn SDL_ReadU16LE_REAL(src: [*c]SDL_IOStream, value: [*c]Uint16) bool {
    @setEvalBranchQuota(100000);
    var data: Uint16 = 0;
    _ = &data;
    var result: bool = @"false" != 0;
    _ = &result;
    if (SDL_ReadIO_REAL(src, @ptrCast(@alignCast(&data)), @sizeOf(@TypeOf(data))) == @sizeOf(@TypeOf(data))) {
        result = @"true" != 0;
    }
    if (value != null) {
        value.* = data;
    }
    return result;
}
pub export fn SDL_ReadS16LE_REAL(src: [*c]SDL_IOStream, value: [*c]Sint16) bool {
    @setEvalBranchQuota(100000);
    return SDL_ReadU16LE_REAL(src, @ptrCast(@alignCast(value)));
}
pub export fn SDL_ReadU16BE_REAL(src: [*c]SDL_IOStream, value: [*c]Uint16) bool {
    @setEvalBranchQuota(100000);
    var data: Uint16 = 0;
    _ = &data;
    var result: bool = @"false" != 0;
    _ = &result;
    if (SDL_ReadIO_REAL(src, @ptrCast(@alignCast(&data)), @sizeOf(@TypeOf(data))) == @sizeOf(@TypeOf(data))) {
        result = @"true" != 0;
    }
    if (value != null) {
        value.* = @byteSwap(@as(Uint16, data));
    }
    return result;
}
pub export fn SDL_ReadS16BE_REAL(src: [*c]SDL_IOStream, value: [*c]Sint16) bool {
    @setEvalBranchQuota(100000);
    return SDL_ReadU16BE_REAL(src, @ptrCast(@alignCast(value)));
}
pub export fn SDL_ReadU32LE_REAL(src: [*c]SDL_IOStream, value: [*c]Uint32) bool {
    @setEvalBranchQuota(100000);
    var data: Uint32 = 0;
    _ = &data;
    var result: bool = @"false" != 0;
    _ = &result;
    if (SDL_ReadIO_REAL(src, @ptrCast(@alignCast(&data)), @sizeOf(@TypeOf(data))) == @sizeOf(@TypeOf(data))) {
        result = @"true" != 0;
    }
    if (value != null) {
        value.* = data;
    }
    return result;
}
pub export fn SDL_ReadS32LE_REAL(src: [*c]SDL_IOStream, value: [*c]Sint32) bool {
    @setEvalBranchQuota(100000);
    return SDL_ReadU32LE_REAL(src, @ptrCast(@alignCast(value)));
}
pub export fn SDL_ReadU32BE_REAL(src: [*c]SDL_IOStream, value: [*c]Uint32) bool {
    @setEvalBranchQuota(100000);
    var data: Uint32 = 0;
    _ = &data;
    var result: bool = @"false" != 0;
    _ = &result;
    if (SDL_ReadIO_REAL(src, @ptrCast(@alignCast(&data)), @sizeOf(@TypeOf(data))) == @sizeOf(@TypeOf(data))) {
        result = @"true" != 0;
    }
    if (value != null) {
        value.* = @byteSwap(@as(Uint32, data));
    }
    return result;
}
pub export fn SDL_ReadS32BE_REAL(src: [*c]SDL_IOStream, value: [*c]Sint32) bool {
    @setEvalBranchQuota(100000);
    return SDL_ReadU32BE_REAL(src, @ptrCast(@alignCast(value)));
}
pub export fn SDL_ReadU64LE_REAL(src: [*c]SDL_IOStream, value: [*c]Uint64) bool {
    @setEvalBranchQuota(100000);
    var data: Uint64 = 0;
    _ = &data;
    var result: bool = @"false" != 0;
    _ = &result;
    if (SDL_ReadIO_REAL(src, @ptrCast(@alignCast(&data)), @sizeOf(@TypeOf(data))) == @sizeOf(@TypeOf(data))) {
        result = @"true" != 0;
    }
    if (value != null) {
        value.* = data;
    }
    return result;
}
pub export fn SDL_ReadS64LE_REAL(src: [*c]SDL_IOStream, value: [*c]Sint64) bool {
    @setEvalBranchQuota(100000);
    return SDL_ReadU64LE_REAL(src, @ptrCast(@alignCast(value)));
}
pub export fn SDL_ReadU64BE_REAL(src: [*c]SDL_IOStream, value: [*c]Uint64) bool {
    @setEvalBranchQuota(100000);
    var data: Uint64 = 0;
    _ = &data;
    var result: bool = @"false" != 0;
    _ = &result;
    if (SDL_ReadIO_REAL(src, @ptrCast(@alignCast(&data)), @sizeOf(@TypeOf(data))) == @sizeOf(@TypeOf(data))) {
        result = @"true" != 0;
    }
    if (value != null) {
        value.* = @byteSwap(@as(Uint64, data));
    }
    return result;
}
pub export fn SDL_ReadS64BE_REAL(src: [*c]SDL_IOStream, value: [*c]Sint64) bool {
    @setEvalBranchQuota(100000);
    return SDL_ReadU64BE_REAL(src, @ptrCast(@alignCast(value)));
}
pub export fn SDL_WriteU8_REAL(dst: [*c]SDL_IOStream, arg_value: Uint8) bool {
    @setEvalBranchQuota(100000);
    var value = arg_value;
    _ = &value;
    return SDL_WriteIO_REAL(dst, @ptrCast(@alignCast(&value)), @sizeOf(@TypeOf(value))) == @sizeOf(@TypeOf(value));
}
pub export fn SDL_WriteS8_REAL(dst: [*c]SDL_IOStream, arg_value: Sint8) bool {
    @setEvalBranchQuota(100000);
    var value = arg_value;
    _ = &value;
    return SDL_WriteIO_REAL(dst, @ptrCast(@alignCast(&value)), @sizeOf(@TypeOf(value))) == @sizeOf(@TypeOf(value));
}
pub export fn SDL_WriteU16LE_REAL(dst: [*c]SDL_IOStream, value: Uint16) bool {
    @setEvalBranchQuota(100000);
    const swapped: Uint16 = value;
    _ = &swapped;
    return SDL_WriteIO_REAL(dst, @ptrCast(@alignCast(&swapped)), @sizeOf(@TypeOf(swapped))) == @sizeOf(@TypeOf(swapped));
}
pub export fn SDL_WriteS16LE_REAL(dst: [*c]SDL_IOStream, value: Sint16) bool {
    @setEvalBranchQuota(100000);
    return SDL_WriteU16LE_REAL(dst, @bitCast(@as(c_short, value)));
}
pub export fn SDL_WriteU16BE_REAL(dst: [*c]SDL_IOStream, value: Uint16) bool {
    @setEvalBranchQuota(100000);
    const swapped: Uint16 = @byteSwap(@as(Uint16, value));
    _ = &swapped;
    return SDL_WriteIO_REAL(dst, @ptrCast(@alignCast(&swapped)), @sizeOf(@TypeOf(swapped))) == @sizeOf(@TypeOf(swapped));
}
pub export fn SDL_WriteS16BE_REAL(dst: [*c]SDL_IOStream, value: Sint16) bool {
    @setEvalBranchQuota(100000);
    return SDL_WriteU16BE_REAL(dst, @bitCast(@as(c_short, value)));
}
pub export fn SDL_WriteU32LE_REAL(dst: [*c]SDL_IOStream, value: Uint32) bool {
    @setEvalBranchQuota(100000);
    const swapped: Uint32 = value;
    _ = &swapped;
    return SDL_WriteIO_REAL(dst, @ptrCast(@alignCast(&swapped)), @sizeOf(@TypeOf(swapped))) == @sizeOf(@TypeOf(swapped));
}
pub export fn SDL_WriteS32LE_REAL(dst: [*c]SDL_IOStream, value: Sint32) bool {
    @setEvalBranchQuota(100000);
    return SDL_WriteU32LE_REAL(dst, @bitCast(@as(c_int, value)));
}
pub export fn SDL_WriteU32BE_REAL(dst: [*c]SDL_IOStream, value: Uint32) bool {
    @setEvalBranchQuota(100000);
    const swapped: Uint32 = @byteSwap(@as(Uint32, value));
    _ = &swapped;
    return SDL_WriteIO_REAL(dst, @ptrCast(@alignCast(&swapped)), @sizeOf(@TypeOf(swapped))) == @sizeOf(@TypeOf(swapped));
}
pub export fn SDL_WriteS32BE_REAL(dst: [*c]SDL_IOStream, value: Sint32) bool {
    @setEvalBranchQuota(100000);
    return SDL_WriteU32BE_REAL(dst, @bitCast(@as(c_int, value)));
}
pub export fn SDL_WriteU64LE_REAL(dst: [*c]SDL_IOStream, value: Uint64) bool {
    @setEvalBranchQuota(100000);
    const swapped: Uint64 = value;
    _ = &swapped;
    return SDL_WriteIO_REAL(dst, @ptrCast(@alignCast(&swapped)), @sizeOf(@TypeOf(swapped))) == @sizeOf(@TypeOf(swapped));
}
pub export fn SDL_WriteS64LE_REAL(dst: [*c]SDL_IOStream, value: Sint64) bool {
    @setEvalBranchQuota(100000);
    return SDL_WriteU64LE_REAL(dst, @bitCast(@as(c_long, value)));
}
pub export fn SDL_WriteU64BE_REAL(dst: [*c]SDL_IOStream, value: Uint64) bool {
    @setEvalBranchQuota(100000);
    const swapped: Uint64 = @byteSwap(@as(Uint64, value));
    _ = &swapped;
    return SDL_WriteIO_REAL(dst, @ptrCast(@alignCast(&swapped)), @sizeOf(@TypeOf(swapped))) == @sizeOf(@TypeOf(swapped));
}
pub export fn SDL_WriteS64BE_REAL(dst: [*c]SDL_IOStream, value: Sint64) bool {
    @setEvalBranchQuota(100000);
    return SDL_WriteU64BE_REAL(dst, @bitCast(@as(c_long, value)));
}

pub const SDL_CloseIO = SDL_CloseIO_REAL;
pub const SDL_FlushIO = SDL_FlushIO_REAL;
pub const SDL_GetIOProperties = SDL_GetIOProperties_REAL;
pub const SDL_GetIOSize = SDL_GetIOSize_REAL;
pub const SDL_GetIOStatus = SDL_GetIOStatus_REAL;
pub const SDL_IOFromConstMem = SDL_IOFromConstMem_REAL;
pub const SDL_IOFromDynamicMem = SDL_IOFromDynamicMem_REAL;
pub const SDL_IOFromFile = SDL_IOFromFile_REAL;
pub const SDL_IOFromMem = SDL_IOFromMem_REAL;
pub const SDL_IOprintf = SDL_IOprintf_REAL;
pub const SDL_IOvprintf = SDL_IOvprintf_REAL;
pub const SDL_LoadFile = SDL_LoadFile_REAL;
pub const SDL_LoadFile_IO = SDL_LoadFile_IO_REAL;
pub const SDL_OpenIO = SDL_OpenIO_REAL;
pub const SDL_ReadIO = SDL_ReadIO_REAL;
pub const SDL_ReadS16BE = SDL_ReadS16BE_REAL;
pub const SDL_ReadS16LE = SDL_ReadS16LE_REAL;
pub const SDL_ReadS32BE = SDL_ReadS32BE_REAL;
pub const SDL_ReadS32LE = SDL_ReadS32LE_REAL;
pub const SDL_ReadS64BE = SDL_ReadS64BE_REAL;
pub const SDL_ReadS64LE = SDL_ReadS64LE_REAL;
pub const SDL_ReadS8 = SDL_ReadS8_REAL;
pub const SDL_ReadU16BE = SDL_ReadU16BE_REAL;
pub const SDL_ReadU16LE = SDL_ReadU16LE_REAL;
pub const SDL_ReadU32BE = SDL_ReadU32BE_REAL;
pub const SDL_ReadU32LE = SDL_ReadU32LE_REAL;
pub const SDL_ReadU64BE = SDL_ReadU64BE_REAL;
pub const SDL_ReadU64LE = SDL_ReadU64LE_REAL;
pub const SDL_ReadU8 = SDL_ReadU8_REAL;
pub const SDL_SeekIO = SDL_SeekIO_REAL;
pub const SDL_TellIO = SDL_TellIO_REAL;
pub const SDL_WriteIO = SDL_WriteIO_REAL;
pub const SDL_WriteS16BE = SDL_WriteS16BE_REAL;
pub const SDL_WriteS16LE = SDL_WriteS16LE_REAL;
pub const SDL_WriteS32BE = SDL_WriteS32BE_REAL;
pub const SDL_WriteS32LE = SDL_WriteS32LE_REAL;
pub const SDL_WriteS64BE = SDL_WriteS64BE_REAL;
pub const SDL_WriteS64LE = SDL_WriteS64LE_REAL;
pub const SDL_WriteS8 = SDL_WriteS8_REAL;
pub const SDL_WriteU16BE = SDL_WriteU16BE_REAL;
pub const SDL_WriteU16LE = SDL_WriteU16LE_REAL;
pub const SDL_WriteU32BE = SDL_WriteU32BE_REAL;
pub const SDL_WriteU32LE = SDL_WriteU32LE_REAL;
pub const SDL_WriteU64BE = SDL_WriteU64BE_REAL;
pub const SDL_WriteU64LE = SDL_WriteU64LE_REAL;
pub const SDL_WriteU8 = SDL_WriteU8_REAL;
pub const SDL_SaveFile_IO = SDL_SaveFile_IO_REAL;
pub const SDL_SaveFile = SDL_SaveFile_REAL;
pub const va_start = @compileError("unable to translate macro: undefined identifier `__builtin_va_start`");
// /home/addo/dev/stupid/zdl/.cache/zig-lib/compiler/aro/include/stdarg.h:12:9
pub inline fn va_end(ap: anytype) @TypeOf(__builtin.va_end(ap)) {
    @setEvalBranchQuota(100000);
    _ = &ap;
    return __builtin.va_end(ap);
}
pub const SEEK_SET = @as(c_int, 0);
pub const SEEK_CUR = @as(c_int, 1);
pub const SEEK_END = @as(c_int, 2);
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const EINTR = @as(c_int, 4);
pub const EAGAIN = @as(c_int, 11);
pub const EINVAL = @as(c_int, 22);
pub const __S_IFMT = __helpers.promoteIntLiteral(c_int, 0o170000, .octal);
pub const __S_IFDIR = @as(c_int, 0o040000);
