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
pub const __sigset_t = extern struct {
    __val: [16]c_ulong = @import("std").mem.zeroes([16]c_ulong),
};
pub const sigset_t = __sigset_t;
pub const struct_timespec = extern struct {
    tv_sec: __time_t = 0,
    tv_nsec: __syscall_slong_t = 0,
};
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub extern fn strerror(__errnum: c_int) [*c]u8;
pub const Sint32 = i32;
pub const Sint64 = i64;
pub const Uint64 = u64;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
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
pub const SDL_AsyncIO = struct_SDL_AsyncIO;
pub const SDL_ASYNCIO_TASK_READ: c_int = 0;
pub const SDL_ASYNCIO_TASK_WRITE: c_int = 1;
pub const SDL_ASYNCIO_TASK_CLOSE: c_int = 2;
pub const enum_SDL_AsyncIOTaskType = c_uint;
pub const SDL_AsyncIOTaskType = enum_SDL_AsyncIOTaskType;
pub const struct_SDL_AsyncIOQueueInterface = extern struct {
    queue_task: ?*const fn (userdata: ?*anyopaque, task: [*c]SDL_AsyncIOTask) callconv(.c) bool = null,
    cancel_task: ?*const fn (userdata: ?*anyopaque, task: [*c]SDL_AsyncIOTask) callconv(.c) void = null,
    get_results: ?*const fn (userdata: ?*anyopaque) callconv(.c) [*c]SDL_AsyncIOTask = null,
    wait_results: ?*const fn (userdata: ?*anyopaque, timeoutMS: Sint32) callconv(.c) [*c]SDL_AsyncIOTask = null,
    signal: ?*const fn (userdata: ?*anyopaque) callconv(.c) void = null,
    destroy: ?*const fn (userdata: ?*anyopaque) callconv(.c) void = null,
};
pub const SDL_AsyncIOQueueInterface = struct_SDL_AsyncIOQueueInterface;
pub const struct_SDL_AtomicInt = extern struct {
    value: c_int = 0,
};
pub const SDL_AtomicInt = struct_SDL_AtomicInt;
pub const struct_SDL_AsyncIOQueue = extern struct {
    iface: SDL_AsyncIOQueueInterface = @import("std").mem.zeroes(SDL_AsyncIOQueueInterface),
    userdata: ?*anyopaque = null,
    tasks_inflight: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
};
pub const SDL_AsyncIOQueue = struct_SDL_AsyncIOQueue;
pub const SDL_ASYNCIO_FAILURE: c_int = 1;
pub const SDL_ASYNCIO_CANCELED: c_int = 2;
pub const enum_SDL_AsyncIOResult = c_uint;
pub const SDL_AsyncIOResult = enum_SDL_AsyncIOResult;
pub const struct_SDL_AsyncIOTask = extern struct {
    asyncio: [*c]SDL_AsyncIO = null,
    type: SDL_AsyncIOTaskType = @import("std").mem.zeroes(SDL_AsyncIOTaskType),
    queue: [*c]SDL_AsyncIOQueue = null,
    offset: Uint64 = 0,
    flush: bool = false,
    buffer: ?*anyopaque = null,
    @"error": [*c]u8 = null,
    result: SDL_AsyncIOResult = @import("std").mem.zeroes(SDL_AsyncIOResult),
    requested_size: Uint64 = 0,
    result_size: Uint64 = 0,
    app_userdata: ?*anyopaque = null,
    asyncioprev: [*c]struct_SDL_AsyncIOTask = null,
    asyncionext: [*c]struct_SDL_AsyncIOTask = null,
    queueprev: [*c]struct_SDL_AsyncIOTask = null,
    queuenext: [*c]struct_SDL_AsyncIOTask = null,
    threadpoolprev: [*c]struct_SDL_AsyncIOTask = null,
    threadpoolnext: [*c]struct_SDL_AsyncIOTask = null,
};
pub const SDL_AsyncIOTask = struct_SDL_AsyncIOTask;
pub const struct_SDL_AsyncIOInterface = extern struct {
    size: ?*const fn (userdata: ?*anyopaque) callconv(.c) Sint64 = null,
    read: ?*const fn (userdata: ?*anyopaque, task: [*c]SDL_AsyncIOTask) callconv(.c) bool = null,
    write: ?*const fn (userdata: ?*anyopaque, task: [*c]SDL_AsyncIOTask) callconv(.c) bool = null,
    close: ?*const fn (userdata: ?*anyopaque, task: [*c]SDL_AsyncIOTask) callconv(.c) bool = null,
    destroy: ?*const fn (userdata: ?*anyopaque) callconv(.c) void = null,
};
pub const SDL_AsyncIOInterface = struct_SDL_AsyncIOInterface;
pub const struct_SDL_Mutex = opaque {
};
pub const SDL_Mutex = struct_SDL_Mutex;
pub const struct_SDL_AsyncIO = extern struct {
    iface: SDL_AsyncIOInterface = @import("std").mem.zeroes(SDL_AsyncIOInterface),
    userdata: ?*anyopaque = null,
    lock: ?*SDL_Mutex = null,
    tasks: SDL_AsyncIOTask = @import("std").mem.zeroes(SDL_AsyncIOTask),
    closing: [*c]SDL_AsyncIOTask = null,
    oneshot: bool = false,
    readonly: bool = false,
};
pub extern fn SDL_SetAtomicInt_REAL(a: [*c]SDL_AtomicInt, v: c_int) c_int;
pub extern fn SDL_GetAtomicInt_REAL(a: [*c]SDL_AtomicInt) c_int;
pub extern fn SDL_AddAtomicInt_REAL(a: [*c]SDL_AtomicInt, v: c_int) c_int;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_ThreadID = Uint64;
pub extern fn SDL_CreateMutex_REAL() ?*SDL_Mutex;
pub extern fn SDL_LockMutex_REAL(mutex: ?*SDL_Mutex) void;
pub extern fn SDL_UnlockMutex_REAL(mutex: ?*SDL_Mutex) void;
pub extern fn SDL_DestroyMutex_REAL(mutex: ?*SDL_Mutex) void;
pub const struct_SDL_InitState = extern struct {
    status: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
    thread: SDL_ThreadID = 0,
    reserved: ?*anyopaque = null,
};
pub const SDL_InitState = struct_SDL_InitState;
pub extern fn SDL_ShouldInit_REAL(state: [*c]SDL_InitState) bool;
pub extern fn SDL_ShouldQuit_REAL(state: [*c]SDL_InitState) bool;
pub extern fn SDL_SetInitialized_REAL(state: [*c]SDL_InitState, initialized: bool) void;
pub const struct_SDL_SharedObject = opaque {
};
pub const SDL_SharedObject = struct_SDL_SharedObject;
pub extern fn SDL_LoadObject_REAL(sofile: [*c]const u8) ?*SDL_SharedObject;
pub extern fn SDL_LoadFunction_REAL(handle: ?*SDL_SharedObject, name: [*c]const u8) SDL_FunctionPointer;
pub extern fn SDL_UnloadObject_REAL(handle: ?*SDL_SharedObject) void;
pub extern fn SDL_DebugLogBackend(subsystem: [*c]const u8, backend: [*c]const u8) void;
pub extern fn SDL_SYS_AsyncIOFromFile_Generic(file: [*c]const u8, mode: [*c]const u8, asyncio: [*c]SDL_AsyncIO) bool;
pub extern fn SDL_SYS_CreateAsyncIOQueue_Generic(queue: [*c]SDL_AsyncIOQueue) bool;
pub extern fn SDL_SYS_QuitAsyncIO_Generic() void;
pub const __kernel_time64_t = c_longlong;
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
pub const __u8 = u8;
pub const __u16 = c_ushort;
pub const __s32 = c_int;
pub const __u32 = c_uint;
pub const __u64 = c_ulonglong;
pub extern fn __errno_location() [*c]c_int;
pub const __sighandler_t = ?*const fn (c_int) callconv(.c) void;
pub extern fn signal(__sig: c_int, __handler: __sighandler_t) __sighandler_t;
pub extern fn close(__fd: c_int) c_int;
pub extern fn read(__fd: c_int, __buf: ?*anyopaque, __nbytes: usize) isize;
pub extern fn write(__fd: c_int, __buf: ?*const anyopaque, __n: usize) isize;
pub extern fn truncate(__file: [*c]const u8, __length: __off_t) c_int;
pub extern fn open(__file: [*c]const u8, __oflag: c_int, ...) c_int;
pub const struct___kernel_timespec = extern struct {
    tv_sec: __kernel_time64_t = 0,
    tv_nsec: c_longlong = 0,
};
pub const __kernel_rwf_t = c_int;
const struct_unnamed_62 = extern struct {
    cmd_op: __u32 = 0,
    __pad1: __u32 = 0,
};
const union_unnamed_61 = extern union {
    off: __u64,
    addr2: __u64,
    unnamed_0: struct_unnamed_62,
};
const struct_unnamed_64 = extern struct {
    level: __u32 = 0,
    optname: __u32 = 0,
};
const union_unnamed_63 = extern union {
    addr: __u64,
    splice_off_in: __u64,
    unnamed_0: struct_unnamed_64,
};
const union_unnamed_65 = extern union {
    rw_flags: __kernel_rwf_t,
    fsync_flags: __u32,
    poll_events: __u16,
    poll32_events: __u32,
    sync_range_flags: __u32,
    msg_flags: __u32,
    timeout_flags: __u32,
    accept_flags: __u32,
    cancel_flags: __u32,
    open_flags: __u32,
    statx_flags: __u32,
    fadvise_advice: __u32,
    splice_flags: __u32,
    rename_flags: __u32,
    unlink_flags: __u32,
    hardlink_flags: __u32,
    xattr_flags: __u32,
    msg_ring_flags: __u32,
    uring_cmd_flags: __u32,
    waitid_flags: __u32,
    futex_flags: __u32,
    install_fd_flags: __u32,
    nop_flags: __u32,
    pipe_flags: __u32,
};
const union_unnamed_66 = extern union {
    buf_index: __u16 align(1),
    buf_group: __u16 align(1),
};
const struct_unnamed_68 = extern struct {
    addr_len: __u16 = 0,
    __pad3: [1]__u16 = @import("std").mem.zeroes([1]__u16),
};
const union_unnamed_67 = extern union {
    splice_fd_in: __s32,
    file_index: __u32,
    zcrx_ifq_idx: __u32,
    optlen: __u32,
    unnamed_0: struct_unnamed_68,
};
const struct_unnamed_70 = extern struct {
    addr3: __u64 = 0,
    __pad2: [1]__u64 = @import("std").mem.zeroes([1]__u64),
};
const struct_unnamed_71 = extern struct {
    attr_ptr: __u64 = 0,
    attr_type_mask: __u64 = 0,
};
const union_unnamed_69 = extern union {
    unnamed_0: struct_unnamed_70,
    unnamed_1: struct_unnamed_71,
    optval: __u64,
    _cmd: [0]__u8,
    pub fn cmd(_self: anytype) __helpers.FlexibleArrayType(@TypeOf(_self), @typeInfo(@TypeOf(_self.*._cmd)).array.child) {
        return @ptrCast(@alignCast(&_self.*._cmd));
    }
};
pub const struct_io_uring_sqe = extern struct {
    opcode: __u8 = 0,
    flags: __u8 = 0,
    ioprio: __u16 = 0,
    fd: __s32 = 0,
    unnamed_0: union_unnamed_61 = @import("std").mem.zeroes(union_unnamed_61),
    unnamed_1: union_unnamed_63 = @import("std").mem.zeroes(union_unnamed_63),
    len: __u32 = 0,
    unnamed_2: union_unnamed_65 = @import("std").mem.zeroes(union_unnamed_65),
    user_data: __u64 = 0,
    unnamed_3: union_unnamed_66 = @import("std").mem.zeroes(union_unnamed_66),
    personality: __u16 = 0,
    unnamed_4: union_unnamed_67 = @import("std").mem.zeroes(union_unnamed_67),
    unnamed_5: union_unnamed_69 = @import("std").mem.zeroes(union_unnamed_69),
};
pub const IOSQE_IO_HARDLINK_BIT: c_int = 3;
pub const IORING_OP_NOP: c_int = 0;
pub const IORING_OP_FSYNC: c_int = 3;
pub const IORING_OP_TIMEOUT: c_int = 11;
pub const IORING_OP_ASYNC_CANCEL: c_int = 14;
pub const IORING_OP_CLOSE: c_int = 19;
pub const IORING_OP_READ: c_int = 22;
pub const IORING_OP_WRITE: c_int = 23;
pub const struct_io_uring_cqe = extern struct {
    user_data: __u64 = 0,
    res: __s32 = 0,
    flags: __u32 = 0,
    _big_cqe: [0]__u64 = @import("std").mem.zeroes([0]__u64),
    pub fn big_cqe(_self: anytype) __helpers.FlexibleArrayType(@TypeOf(_self), @typeInfo(@TypeOf(_self.*._big_cqe)).array.child) {
        return @ptrCast(@alignCast(&_self.*._big_cqe));
    }
};
pub const struct_io_uring_probe_op = extern struct {
    op: __u8 = 0,
    resv: __u8 = 0,
    flags: __u16 = 0,
    resv2: __u32 = 0,
};
pub const struct_io_uring_probe = extern struct {
    last_op: __u8 = 0,
    ops_len: __u8 = 0,
    resv: __u16 = 0,
    resv2: [3]__u32 = @import("std").mem.zeroes([3]__u32),
    _ops: [0]struct_io_uring_probe_op = @import("std").mem.zeroes([0]struct_io_uring_probe_op),
    pub fn ops(_self: anytype) __helpers.FlexibleArrayType(@TypeOf(_self), @typeInfo(@TypeOf(_self.*._ops)).array.child) {
        return @ptrCast(@alignCast(&_self.*._ops));
    }
};
pub const struct_io_uring_sq = extern struct {
    khead: [*c]c_uint = null,
    ktail: [*c]c_uint = null,
    kring_mask: [*c]c_uint = null,
    kring_entries: [*c]c_uint = null,
    kflags: [*c]c_uint = null,
    kdropped: [*c]c_uint = null,
    array: [*c]c_uint = null,
    sqes: [*c]struct_io_uring_sqe = null,
    sqe_head: c_uint = 0,
    sqe_tail: c_uint = 0,
    ring_sz: usize = 0,
    ring_ptr: ?*anyopaque = null,
    ring_mask: c_uint = 0,
    ring_entries: c_uint = 0,
    pad: [2]c_uint = @import("std").mem.zeroes([2]c_uint),
};
pub const struct_io_uring_cq = extern struct {
    khead: [*c]c_uint = null,
    ktail: [*c]c_uint = null,
    kring_mask: [*c]c_uint = null,
    kring_entries: [*c]c_uint = null,
    kflags: [*c]c_uint = null,
    koverflow: [*c]c_uint = null,
    cqes: [*c]struct_io_uring_cqe = null,
    ring_sz: usize = 0,
    ring_ptr: ?*anyopaque = null,
    ring_mask: c_uint = 0,
    ring_entries: c_uint = 0,
    pad: [2]c_uint = @import("std").mem.zeroes([2]c_uint),
};
pub const struct_io_uring = extern struct {
    sq: struct_io_uring_sq = @import("std").mem.zeroes(struct_io_uring_sq),
    cq: struct_io_uring_cq = @import("std").mem.zeroes(struct_io_uring_cq),
    flags: c_uint = 0,
    ring_fd: c_int = 0,
    features: c_uint = 0,
    enter_ring_fd: c_int = 0,
    int_flags: __u8 = 0,
    pad: [3]__u8 = @import("std").mem.zeroes([3]__u8),
    pad2: c_uint = 0,
};
pub extern fn io_uring_get_probe() [*c]struct_io_uring_probe;
pub extern fn io_uring_free_probe(probe: [*c]struct_io_uring_probe) void;
pub fn io_uring_opcode_supported(p: [*c]const struct_io_uring_probe, op: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    if (op > @as(c_int, p.*.last_op)) return 0;
    return @intFromBool((@as(c_uint, @bitCast(@as(c_int, @as(c_int, p.*.ops()[@bitCast(@as(isize, @intCast(op)))].flags)))) & (@as(c_uint, 1) << @intCast(@as(c_uint, 0)))) != @as(c_uint, 0));
}
pub extern fn io_uring_queue_init(entries: c_uint, ring: [*c]struct_io_uring, flags: c_uint) c_int;
pub extern fn io_uring_queue_exit(ring: [*c]struct_io_uring) void;
pub extern fn io_uring_wait_cqe_timeout(ring: [*c]struct_io_uring, cqe_ptr: [*c][*c]struct_io_uring_cqe, ts: [*c]struct___kernel_timespec) c_int;
pub extern fn io_uring_submit(ring: [*c]struct_io_uring) c_int;
pub extern fn __io_uring_get_cqe(ring: [*c]struct_io_uring, cqe_ptr: [*c][*c]struct_io_uring_cqe, submit: c_uint, wait_nr: c_uint, sigmask: [*c]sigset_t) c_int;
pub fn io_uring_cqe_shift_from_flags(flags: c_uint) callconv(.c) c_uint {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(c_int, @intFromBool(!!((flags & (@as(c_uint, 1) << @intCast(@as(c_uint, 11)))) != 0))));
}
pub fn io_uring_cqe_shift(ring: [*c]const struct_io_uring) callconv(.c) c_uint {
    @setEvalBranchQuota(100000);
    return io_uring_cqe_shift_from_flags(ring.*.flags);
}
pub fn io_uring_cqe_nr(cqe: [*c]const struct_io_uring_cqe) callconv(.c) c_uint {
    @setEvalBranchQuota(100000);
    return @as(c_uint, 1) << @intCast(@as(c_uint, @bitCast(@as(c_int, @intFromBool(!!((cqe.*.flags & (@as(c_uint, 1) << @intCast(@as(c_uint, 15)))) != 0))))));
}
pub extern fn io_uring_cq_advance(arg_ring: [*c]struct_io_uring, arg_nr: c_uint) callconv(.c) void;
pub fn io_uring_cqe_seen(ring: [*c]struct_io_uring, cqe: [*c]struct_io_uring_cqe) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (cqe != null) {
        io_uring_cq_advance(ring, io_uring_cqe_nr(cqe));
    }
}
pub fn io_uring_sqe_set_data(sqe: [*c]struct_io_uring_sqe, data: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    sqe.*.user_data = @as(c_ulong, @intCast(@intFromPtr(data)));
}
pub fn io_uring_cqe_get_data(cqe: [*c]const struct_io_uring_cqe) callconv(.c) ?*anyopaque {
    @setEvalBranchQuota(100000);
    return @ptrFromInt(@as(usize, @truncate(cqe.*.user_data)));
}
pub fn io_uring_sqe_set_flags(sqe: [*c]struct_io_uring_sqe, flags: c_uint) callconv(.c) void {
    @setEvalBranchQuota(100000);
    sqe.*.flags = @truncate(flags);
}
pub fn io_uring_initialize_sqe(sqe: [*c]struct_io_uring_sqe) callconv(.c) void {
    @setEvalBranchQuota(100000);
    sqe.*.flags = 0;
    sqe.*.ioprio = 0;
    sqe.*.unnamed_2.rw_flags = 0;
    sqe.*.unnamed_3.buf_index = 0;
    sqe.*.personality = 0;
    sqe.*.unnamed_4.file_index = 0;
    sqe.*.unnamed_5.unnamed_0.addr3 = 0;
    sqe.*.unnamed_5.unnamed_0.__pad2[@as(c_int, 0)] = 0;
}
pub fn io_uring_prep_rw(op: c_int, sqe: [*c]struct_io_uring_sqe, fd: c_int, addr: ?*const anyopaque, len: c_uint, offset: __u64) callconv(.c) void {
    @setEvalBranchQuota(100000);
    sqe.*.opcode = @bitCast(@as(i8, @truncate(op)));
    sqe.*.fd = fd;
    sqe.*.unnamed_0.off = offset;
    sqe.*.unnamed_1.addr = @as(c_ulong, @intCast(@intFromPtr(addr)));
    sqe.*.len = len;
}
pub fn io_uring_prep_fsync(sqe: [*c]struct_io_uring_sqe, fd: c_int, fsync_flags: c_uint) callconv(.c) void {
    @setEvalBranchQuota(100000);
    io_uring_prep_rw(IORING_OP_FSYNC, sqe, fd, null, 0, 0);
    sqe.*.unnamed_2.fsync_flags = fsync_flags;
}
pub fn io_uring_prep_nop(sqe: [*c]struct_io_uring_sqe) callconv(.c) void {
    @setEvalBranchQuota(100000);
    io_uring_prep_rw(IORING_OP_NOP, sqe, -@as(c_int, 1), null, 0, 0);
}
pub fn io_uring_prep_timeout(sqe: [*c]struct_io_uring_sqe, ts: [*c]const struct___kernel_timespec, count: c_uint, flags: c_uint) callconv(.c) void {
    @setEvalBranchQuota(100000);
    io_uring_prep_rw(IORING_OP_TIMEOUT, sqe, -@as(c_int, 1), @ptrCast(@alignCast(ts)), 1, count);
    sqe.*.unnamed_2.timeout_flags = flags;
}
pub fn io_uring_prep_cancel64(sqe: [*c]struct_io_uring_sqe, user_data: __u64, flags: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    io_uring_prep_rw(IORING_OP_ASYNC_CANCEL, sqe, -@as(c_int, 1), null, 0, 0);
    sqe.*.unnamed_1.addr = user_data;
    sqe.*.unnamed_2.cancel_flags = @bitCast(@as(c_int, flags));
}
pub fn io_uring_prep_cancel(sqe: [*c]struct_io_uring_sqe, user_data: ?*const anyopaque, flags: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    io_uring_prep_cancel64(sqe, @as(usize, @intCast(@intFromPtr(user_data))), flags);
}
pub fn io_uring_prep_close(sqe: [*c]struct_io_uring_sqe, fd: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    io_uring_prep_rw(IORING_OP_CLOSE, sqe, fd, null, 0, 0);
}
pub fn io_uring_prep_read(sqe: [*c]struct_io_uring_sqe, fd: c_int, buf: ?*anyopaque, nbytes: c_uint, offset: __u64) callconv(.c) void {
    @setEvalBranchQuota(100000);
    io_uring_prep_rw(IORING_OP_READ, sqe, fd, buf, nbytes, offset);
}
pub fn io_uring_prep_write(sqe: [*c]struct_io_uring_sqe, fd: c_int, buf: ?*const anyopaque, nbytes: c_uint, offset: __u64) callconv(.c) void {
    @setEvalBranchQuota(100000);
    io_uring_prep_rw(IORING_OP_WRITE, sqe, fd, buf, nbytes, offset);
}
pub extern fn io_uring_load_sq_head(arg_ring: [*c]const struct_io_uring) callconv(.c) c_uint;
pub fn io_uring_sqe_shift_from_flags(flags: c_uint) callconv(.c) c_uint {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(c_int, @intFromBool(!!((flags & (@as(c_uint, 1) << @intCast(@as(c_uint, 10)))) != 0))));
}
pub fn io_uring_sqe_shift(ring: [*c]const struct_io_uring) callconv(.c) c_uint {
    @setEvalBranchQuota(100000);
    return io_uring_sqe_shift_from_flags(ring.*.flags);
}
pub fn io_uring_wait_cqe_nr(ring: [*c]struct_io_uring, cqe_ptr: [*c][*c]struct_io_uring_cqe, wait_nr: c_uint) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return __io_uring_get_cqe(ring, cqe_ptr, 0, wait_nr, null);
}
pub fn io_uring_skip_cqe(ring: [*c]struct_io_uring, cqe: [*c]struct_io_uring_cqe, err: [*c]c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if ((cqe.*.flags & (@as(c_uint, 1) << @intCast(@as(c_uint, 5)))) != 0) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                io_uring_cq_advance(ring, io_uring_cqe_nr(cqe));
                return !(err.* != 0);
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
                if ((ring.*.features & (@as(c_uint, 1) << @intCast(@as(c_uint, 8)))) != 0) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                return @"false" != 0;
            },
            6 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                if (cqe.*.user_data != @as(__u64, @bitCast(@as(c_longlong, -@as(c_int, 1))))) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                return @"false" != 0;
            },
            9 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                if (cqe.*.res < @as(c_int, 0)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                err.* = cqe.*.res;
                {
                    sdl_pc = 13;
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
            else => unreachable,
        }
    }
}
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/stdatomic.h:145:30: warning: TODO implement function '__c11_atomic_load' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/stdatomic.h:145:30: warning: TODO implement function '__c11_atomic_load' in std.zig.c_builtins
pub fn __io_uring_peek_cqe(ring: [*c]struct_io_uring, cqe_ptr: [*c][*c]struct_io_uring_cqe, nr_available: [*c]c_uint) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var cqe: [*c]struct_io_uring_cqe = undefined;
    _ = &cqe;
    var err: c_int = 0;
    _ = &err;
    var available: c_uint = undefined;
    _ = &available;
    var mask: c_uint = ring.*.cq.ring_mask;
    _ = &mask;
    var shift: c_uint = io_uring_cqe_shift(ring);
    _ = &shift;
    while (true) {
        const tail = if (true) @compileError("unable to resolve var init expr");
        _ = &tail;
        const head = if (true) @compileError("unable to resolve var init expr");
        _ = &head;
        cqe = null;
        available = tail -% head;
        if (!(available != 0)) break;
        cqe = &ring.*.cq.cqes[(head & mask) << @intCast(shift)];
        if (!io_uring_skip_cqe(ring, cqe, &err)) break;
        cqe = null;
    }
    cqe_ptr.* = cqe;
    if (nr_available != null) {
        nr_available.* = available;
    }
    return err;
}
pub fn io_uring_peek_cqe(ring: [*c]struct_io_uring, cqe_ptr: [*c][*c]struct_io_uring_cqe) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    if (!(__io_uring_peek_cqe(ring, cqe_ptr, null) != 0) and (cqe_ptr.* != null)) return 0;
    return io_uring_wait_cqe_nr(ring, cqe_ptr, 0);
}
pub fn io_uring_wait_cqe(ring: [*c]struct_io_uring, cqe_ptr: [*c][*c]struct_io_uring_cqe) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    if (!(__io_uring_peek_cqe(ring, cqe_ptr, null) != 0) and (cqe_ptr.* != null)) return 0;
    return io_uring_wait_cqe_nr(ring, cqe_ptr, 1);
}
pub fn _io_uring_get_sqe(ring: [*c]struct_io_uring) callconv(.c) [*c]struct_io_uring_sqe {
    @setEvalBranchQuota(100000);
    var sq: [*c]struct_io_uring_sq = &ring.*.sq;
    _ = &sq;
    var head: c_uint = io_uring_load_sq_head(ring);
    _ = &head;
    var tail: c_uint = sq.*.sqe_tail;
    _ = &tail;
    var sqe: [*c]struct_io_uring_sqe = undefined;
    _ = &sqe;
    if ((tail -% head) >= sq.*.ring_entries) return null;
    sqe = &sq.*.sqes[(tail & sq.*.ring_mask) << @intCast(io_uring_sqe_shift(ring))];
    sq.*.sqe_tail = tail +% @as(c_uint, 1);
    io_uring_initialize_sqe(sqe);
    return sqe;
}
pub fn io_uring_get_sqe(ring: [*c]struct_io_uring) callconv(.c) [*c]struct_io_uring_sqe {
    @setEvalBranchQuota(100000);
    return _io_uring_get_sqe(ring);
}
pub extern fn dlsym(noalias __handle: ?*anyopaque, noalias __name: [*c]const u8) ?*anyopaque;
pub fn TsanNoOp(_: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub const TsanAcquireReleaseFn = ?*const fn (addr: ?*anyopaque) callconv(.c) void;
pub var TsanAcquire: TsanAcquireReleaseFn = TsanNoOp;
pub var TsanRelease: TsanAcquireReleaseFn = TsanNoOp;
pub fn InitTSanAnnotations() callconv(.c) void {
    @setEvalBranchQuota(100000);
    TsanAcquire = @ptrCast(@alignCast(dlsym(null, "__tsan_acquire")));
    TsanRelease = @ptrCast(@alignCast(dlsym(null, "__tsan_release")));
    if (!(TsanAcquire != null) or !(TsanRelease != null)) {
        TsanAcquire = blk: {
            const tmp = TsanNoOp;
            TsanRelease = tmp;
            break :blk tmp;
        };
    }
}
pub var liburing_init: SDL_InitState = @import("std").mem.zeroes(SDL_InitState);
pub var CreateAsyncIOQueue: ?*const fn (queue: [*c]SDL_AsyncIOQueue) callconv(.c) bool = null;
pub var QuitAsyncIO: ?*const fn () callconv(.c) void = null;
pub var AsyncIOFromFile: ?*const fn (file: [*c]const u8, mode: [*c]const u8, asyncio: [*c]SDL_AsyncIO) callconv(.c) bool = null;
pub var liburing_library: [*c]const u8 = "liburing-ffi.so.2";
pub var liburing_handle: ?*anyopaque = null;
pub const SDL_fntype_io_uring_queue_init = ?*const fn (entries: c_uint, ring: [*c]struct_io_uring, flags: c_uint) callconv(.c) c_int;
pub const SDL_fntype_io_uring_get_probe = ?*const fn () callconv(.c) [*c]struct_io_uring_probe;
pub const SDL_fntype_io_uring_free_probe = ?*const fn (probe: [*c]struct_io_uring_probe) callconv(.c) void;
pub const SDL_fntype_io_uring_opcode_supported = ?*const fn (p: [*c]const struct_io_uring_probe, op: c_int) callconv(.c) c_int;
pub const SDL_fntype_io_uring_get_sqe = ?*const fn (ring: [*c]struct_io_uring) callconv(.c) [*c]struct_io_uring_sqe;
pub const SDL_fntype_io_uring_prep_read = ?*const fn (sqe: [*c]struct_io_uring_sqe, fd: c_int, buf: ?*anyopaque, nbytes: c_uint, offset: __u64) callconv(.c) void;
pub const SDL_fntype_io_uring_prep_write = ?*const fn (sqe: [*c]struct_io_uring_sqe, fd: c_int, buf: ?*const anyopaque, nbytes: c_uint, offset: __u64) callconv(.c) void;
pub const SDL_fntype_io_uring_prep_close = ?*const fn (sqe: [*c]struct_io_uring_sqe, fd: c_int) callconv(.c) void;
pub const SDL_fntype_io_uring_prep_fsync = ?*const fn (sqe: [*c]struct_io_uring_sqe, fd: c_int, fsync_flags: c_uint) callconv(.c) void;
pub const SDL_fntype_io_uring_prep_cancel = ?*const fn (sqe: [*c]struct_io_uring_sqe, user_data: ?*anyopaque, flags: c_int) callconv(.c) void;
pub const SDL_fntype_io_uring_prep_timeout = ?*const fn (sqe: [*c]struct_io_uring_sqe, ts: [*c]struct___kernel_timespec, count: c_uint, flags: c_uint) callconv(.c) void;
pub const SDL_fntype_io_uring_prep_nop = ?*const fn (sqe: [*c]struct_io_uring_sqe) callconv(.c) void;
pub const SDL_fntype_io_uring_sqe_set_data = ?*const fn (sqe: [*c]struct_io_uring_sqe, data: ?*anyopaque) callconv(.c) void;
pub const SDL_fntype_io_uring_sqe_set_flags = ?*const fn (sqe: [*c]struct_io_uring_sqe, flags: c_uint) callconv(.c) void;
pub const SDL_fntype_io_uring_submit = ?*const fn (ring: [*c]struct_io_uring) callconv(.c) c_int;
pub const SDL_fntype_io_uring_peek_cqe = ?*const fn (ring: [*c]struct_io_uring, cqe_ptr: [*c][*c]struct_io_uring_cqe) callconv(.c) c_int;
pub const SDL_fntype_io_uring_wait_cqe = ?*const fn (ring: [*c]struct_io_uring, cqe_ptr: [*c][*c]struct_io_uring_cqe) callconv(.c) c_int;
pub const SDL_fntype_io_uring_wait_cqe_timeout = ?*const fn (ring: [*c]struct_io_uring, cqe_ptr: [*c][*c]struct_io_uring_cqe, ts: [*c]struct___kernel_timespec) callconv(.c) c_int;
pub const SDL_fntype_io_uring_cqe_seen = ?*const fn (ring: [*c]struct_io_uring, cqe: [*c]struct_io_uring_cqe) callconv(.c) void;
pub const SDL_fntype_io_uring_queue_exit = ?*const fn (ring: [*c]struct_io_uring) callconv(.c) void;
pub const struct_SDL_LibUringFunctions = extern struct {
    io_uring_queue_init: SDL_fntype_io_uring_queue_init = null,
    io_uring_get_probe: SDL_fntype_io_uring_get_probe = null,
    io_uring_free_probe: SDL_fntype_io_uring_free_probe = null,
    io_uring_opcode_supported: SDL_fntype_io_uring_opcode_supported = null,
    io_uring_get_sqe: SDL_fntype_io_uring_get_sqe = null,
    io_uring_prep_read: SDL_fntype_io_uring_prep_read = null,
    io_uring_prep_write: SDL_fntype_io_uring_prep_write = null,
    io_uring_prep_close: SDL_fntype_io_uring_prep_close = null,
    io_uring_prep_fsync: SDL_fntype_io_uring_prep_fsync = null,
    io_uring_prep_cancel: SDL_fntype_io_uring_prep_cancel = null,
    io_uring_prep_timeout: SDL_fntype_io_uring_prep_timeout = null,
    io_uring_prep_nop: SDL_fntype_io_uring_prep_nop = null,
    io_uring_sqe_set_data: SDL_fntype_io_uring_sqe_set_data = null,
    io_uring_sqe_set_flags: SDL_fntype_io_uring_sqe_set_flags = null,
    io_uring_submit: SDL_fntype_io_uring_submit = null,
    io_uring_peek_cqe: SDL_fntype_io_uring_peek_cqe = null,
    io_uring_wait_cqe: SDL_fntype_io_uring_wait_cqe = null,
    io_uring_wait_cqe_timeout: SDL_fntype_io_uring_wait_cqe_timeout = null,
    io_uring_cqe_seen: SDL_fntype_io_uring_cqe_seen = null,
    io_uring_queue_exit: SDL_fntype_io_uring_queue_exit = null,
};
pub const SDL_LibUringFunctions = struct_SDL_LibUringFunctions;
pub var liburing: SDL_LibUringFunctions = @import("std").mem.zeroes(SDL_LibUringFunctions);
pub const struct_LibUringAsyncIOQueueData = extern struct {
    sqe_lock: ?*SDL_Mutex = null,
    cqe_lock: ?*SDL_Mutex = null,
    ring: struct_io_uring = @import("std").mem.zeroes(struct_io_uring),
    num_waiting: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
};
pub const LibUringAsyncIOQueueData = struct_LibUringAsyncIOQueueData;
pub fn UnloadLibUringLibrary() callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (liburing_library != null) {
        SDL_UnloadObject_REAL(@ptrCast(@alignCast(liburing_handle)));
        liburing_library = null;
    }
    _ = memset(@ptrCast(@alignCast(&liburing)), 0, @sizeOf(@TypeOf(liburing)));
}
pub fn LoadLibUringSyms() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    {
        liburing.io_uring_queue_init = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(@ptrCast(@alignCast(liburing_handle)), "io_uring_queue_init"))));
        if (!(liburing.io_uring_queue_init != null)) {
            return @"false" != 0;
        }
    }
    {
        liburing.io_uring_get_probe = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(@ptrCast(@alignCast(liburing_handle)), "io_uring_get_probe"))));
        if (!(liburing.io_uring_get_probe != null)) {
            return @"false" != 0;
        }
    }
    {
        liburing.io_uring_free_probe = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(@ptrCast(@alignCast(liburing_handle)), "io_uring_free_probe"))));
        if (!(liburing.io_uring_free_probe != null)) {
            return @"false" != 0;
        }
    }
    {
        liburing.io_uring_opcode_supported = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(@ptrCast(@alignCast(liburing_handle)), "io_uring_opcode_supported"))));
        if (!(liburing.io_uring_opcode_supported != null)) {
            return @"false" != 0;
        }
    }
    {
        liburing.io_uring_get_sqe = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(@ptrCast(@alignCast(liburing_handle)), "io_uring_get_sqe"))));
        if (!(liburing.io_uring_get_sqe != null)) {
            return @"false" != 0;
        }
    }
    {
        liburing.io_uring_prep_read = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(@ptrCast(@alignCast(liburing_handle)), "io_uring_prep_read"))));
        if (!(liburing.io_uring_prep_read != null)) {
            return @"false" != 0;
        }
    }
    {
        liburing.io_uring_prep_write = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(@ptrCast(@alignCast(liburing_handle)), "io_uring_prep_write"))));
        if (!(liburing.io_uring_prep_write != null)) {
            return @"false" != 0;
        }
    }
    {
        liburing.io_uring_prep_close = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(@ptrCast(@alignCast(liburing_handle)), "io_uring_prep_close"))));
        if (!(liburing.io_uring_prep_close != null)) {
            return @"false" != 0;
        }
    }
    {
        liburing.io_uring_prep_fsync = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(@ptrCast(@alignCast(liburing_handle)), "io_uring_prep_fsync"))));
        if (!(liburing.io_uring_prep_fsync != null)) {
            return @"false" != 0;
        }
    }
    {
        liburing.io_uring_prep_cancel = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(@ptrCast(@alignCast(liburing_handle)), "io_uring_prep_cancel"))));
        if (!(liburing.io_uring_prep_cancel != null)) {
            return @"false" != 0;
        }
    }
    {
        liburing.io_uring_prep_timeout = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(@ptrCast(@alignCast(liburing_handle)), "io_uring_prep_timeout"))));
        if (!(liburing.io_uring_prep_timeout != null)) {
            return @"false" != 0;
        }
    }
    {
        liburing.io_uring_prep_nop = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(@ptrCast(@alignCast(liburing_handle)), "io_uring_prep_nop"))));
        if (!(liburing.io_uring_prep_nop != null)) {
            return @"false" != 0;
        }
    }
    {
        liburing.io_uring_sqe_set_data = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(@ptrCast(@alignCast(liburing_handle)), "io_uring_sqe_set_data"))));
        if (!(liburing.io_uring_sqe_set_data != null)) {
            return @"false" != 0;
        }
    }
    {
        liburing.io_uring_sqe_set_flags = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(@ptrCast(@alignCast(liburing_handle)), "io_uring_sqe_set_flags"))));
        if (!(liburing.io_uring_sqe_set_flags != null)) {
            return @"false" != 0;
        }
    }
    {
        liburing.io_uring_submit = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(@ptrCast(@alignCast(liburing_handle)), "io_uring_submit"))));
        if (!(liburing.io_uring_submit != null)) {
            return @"false" != 0;
        }
    }
    {
        liburing.io_uring_peek_cqe = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(@ptrCast(@alignCast(liburing_handle)), "io_uring_peek_cqe"))));
        if (!(liburing.io_uring_peek_cqe != null)) {
            return @"false" != 0;
        }
    }
    {
        liburing.io_uring_wait_cqe = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(@ptrCast(@alignCast(liburing_handle)), "io_uring_wait_cqe"))));
        if (!(liburing.io_uring_wait_cqe != null)) {
            return @"false" != 0;
        }
    }
    {
        liburing.io_uring_wait_cqe_timeout = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(@ptrCast(@alignCast(liburing_handle)), "io_uring_wait_cqe_timeout"))));
        if (!(liburing.io_uring_wait_cqe_timeout != null)) {
            return @"false" != 0;
        }
    }
    {
        liburing.io_uring_cqe_seen = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(@ptrCast(@alignCast(liburing_handle)), "io_uring_cqe_seen"))));
        if (!(liburing.io_uring_cqe_seen != null)) {
            return @"false" != 0;
        }
    }
    {
        liburing.io_uring_queue_exit = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(@ptrCast(@alignCast(liburing_handle)), "io_uring_queue_exit"))));
        if (!(liburing.io_uring_queue_exit != null)) {
            return @"false" != 0;
        }
    }
    return @"true" != 0;
}
pub fn LoadLibUring() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var result: bool = @"true" != 0;
    _ = &result;
    if (!(liburing_handle != null)) {
        liburing_handle = @ptrCast(@alignCast(SDL_LoadObject_REAL(liburing_library)));
        if (!(liburing_handle != null)) {
            result = @"false" != 0;
        } else {
            result = LoadLibUringSyms();
            if (result) {
                const static_local_needed_ops = struct {
                    const needed_ops: [7]c_int = [7]c_int{
                        IORING_OP_NOP,
                        IORING_OP_FSYNC,
                        IORING_OP_TIMEOUT,
                        IORING_OP_CLOSE,
                        IORING_OP_READ,
                        IORING_OP_WRITE,
                        IORING_OP_ASYNC_CANCEL,
                    };
                };
                _ = &static_local_needed_ops;
                var probe: [*c]struct_io_uring_probe = liburing.io_uring_get_probe.?();
                _ = &probe;
                if (!(probe != null)) {
                    result = @"false" != 0;
                } else {
                    {
                        var i: c_int = 0;
                        _ = &i;
                        while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(static_local_needed_ops.needed_ops)) / @sizeOf(@TypeOf(static_local_needed_ops.needed_ops[@as(c_int, 0)])))) : (i += 1) {
                            if (!(io_uring_opcode_supported(probe, static_local_needed_ops.needed_ops[@bitCast(@as(isize, @intCast(i)))]) != 0)) {
                                result = @"false" != 0;
                                break;
                            }
                        }
                    }
                    liburing.io_uring_free_probe.?(probe);
                }
            }
            if (!result) {
                UnloadLibUringLibrary();
            }
        }
    }
    return result;
}
pub fn liburing_SetError(what: [*c]const u8, arg_err: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var err = arg_err;
    _ = &err;
    const static_local___func__ = struct {
        const __func__: [17:0]u8 = "liburing_SetError".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!(err <= @as(c_int, 0))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "err <= 0",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_asyncio_liburing.c", 192);
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
    return SDL_SetError_REAL("%s failed: %s", what, strerror(-err));
}
pub fn liburing_asyncio_size(userdata: ?*anyopaque) callconv(.c) Sint64 {
    @setEvalBranchQuota(100000);
    const fd: c_int = @truncate(@as(isize, @intCast(@intFromPtr(userdata))));
    _ = &fd;
    var statbuf: struct_stat = undefined;
    _ = &statbuf;
    if (fstat(fd, &statbuf) < @as(c_int, 0)) {
        _ = SDL_SetError_REAL("fstat failed: %s", strerror(__errno_location().*));
        return -@as(c_int, 1);
    }
    return statbuf.st_size;
}
pub fn liburing_asyncioqueue_queue_task(userdata: ?*anyopaque, task: [*c]SDL_AsyncIOTask) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    TsanRelease.?(@ptrCast(@alignCast(task)));
    var queuedata: [*c]LibUringAsyncIOQueueData = @ptrCast(@alignCast(userdata));
    _ = &queuedata;
    const rc: c_int = liburing.io_uring_submit.?(&queuedata.*.ring);
    _ = &rc;
    return (if (rc < @as(c_int, 0)) @as(c_int, @intFromBool(liburing_SetError("io_uring_submit", rc))) else @"true") != 0;
}
pub fn liburing_asyncioqueue_cancel_task(userdata: ?*anyopaque, task: [*c]SDL_AsyncIOTask) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var cancel_task: [*c]SDL_AsyncIOTask = undefined;
    cancel_task = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(cancel_task.*)))));
    _ = &cancel_task;
    if (!(cancel_task != null)) {
        return;
    }
    var queuedata: [*c]LibUringAsyncIOQueueData = @ptrCast(@alignCast(userdata));
    _ = &queuedata;
    SDL_LockMutex_REAL(queuedata.*.sqe_lock);
    var sqe: [*c]struct_io_uring_sqe = liburing.io_uring_get_sqe.?(&queuedata.*.ring);
    _ = &sqe;
    if (!(sqe != null)) {
        SDL_UnlockMutex_REAL(queuedata.*.sqe_lock);
        SDL_free_REAL(@ptrCast(@alignCast(cancel_task)));
        return;
    }
    cancel_task.*.app_userdata = @ptrCast(@alignCast(task));
    liburing.io_uring_prep_cancel.?(sqe, @ptrCast(@alignCast(task)), 0);
    liburing.io_uring_sqe_set_data.?(sqe, @ptrCast(@alignCast(cancel_task)));
    _ = liburing_asyncioqueue_queue_task(userdata, task);
    SDL_UnlockMutex_REAL(queuedata.*.sqe_lock);
}
pub fn ProcessCQE(_: [*c]LibUringAsyncIOQueueData, cqe: [*c]struct_io_uring_cqe) callconv(.c) [*c]SDL_AsyncIOTask {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [10:0]u8 = "ProcessCQE".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(cqe))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "cqe != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_asyncio_liburing.c", 243);
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
    var task: [*c]SDL_AsyncIOTask = @ptrCast(@alignCast(io_uring_cqe_get_data(cqe)));
    _ = &task;
    if (task != null) {
        TsanAcquire.?(@ptrCast(@alignCast(task)));
        if (!(task.*.queue != null)) {
            var cancel_task: [*c]SDL_AsyncIOTask = task;
            _ = &cancel_task;
            task = @ptrCast(@alignCast(cancel_task.*.app_userdata));
            TsanAcquire.?(@ptrCast(@alignCast(task)));
            SDL_free_REAL(@ptrCast(@alignCast(cancel_task)));
            if (cqe.*.res >= @as(c_int, 0)) {
                task.*.result = SDL_ASYNCIO_CANCELED;
            } else {
                TsanRelease.?(@ptrCast(@alignCast(task)));
                task = null;
            }
        } else if (cqe.*.res < @as(c_int, 0)) {
            task.*.result = SDL_ASYNCIO_FAILURE;
        } else {
            if ((task.*.type == @as(SDL_AsyncIOTaskType, SDL_ASYNCIO_TASK_WRITE)) and (@as(Uint64, @bitCast(@as(c_long, cqe.*.res))) < task.*.requested_size)) {
                task.*.result = SDL_ASYNCIO_FAILURE;
            }
            if ((task.*.type == @as(SDL_AsyncIOTaskType, SDL_ASYNCIO_TASK_READ)) or (task.*.type == @as(SDL_AsyncIOTaskType, SDL_ASYNCIO_TASK_WRITE))) {
                task.*.result_size = @bitCast(@as(c_long, cqe.*.res));
            }
        }
        if (((task != null) and (task.*.type == @as(SDL_AsyncIOTaskType, SDL_ASYNCIO_TASK_CLOSE))) and task.*.flush) {
            task.*.flush = @"false" != 0;
            TsanRelease.?(@ptrCast(@alignCast(task)));
            task = null;
        }
    }
    return task;
}
pub fn liburing_asyncioqueue_get_results(userdata: ?*anyopaque) callconv(.c) [*c]SDL_AsyncIOTask {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [33:0]u8 = "liburing_asyncioqueue_get_results".*;
    };
    _ = &static_local___func__;
    var queuedata: [*c]LibUringAsyncIOQueueData = @ptrCast(@alignCast(userdata));
    _ = &queuedata;
    SDL_LockMutex_REAL(queuedata.*.cqe_lock);
    var cqe: [*c]struct_io_uring_cqe = null;
    _ = &cqe;
    const rc: c_int = liburing.io_uring_peek_cqe.?(&queuedata.*.ring, &cqe);
    _ = &rc;
    if (rc != @as(c_int, 0)) {
        while (true) {
            while (!(rc == -EAGAIN)) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "rc == -11",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_asyncio_liburing.c", 293);
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
        SDL_UnlockMutex_REAL(queuedata.*.cqe_lock);
        return null;
    }
    var cqe_copy: struct_io_uring_cqe = undefined;
    _ = &cqe_copy;
    {
        comptime {
            if (!(@sizeOf(@TypeOf((&cqe_copy).*)) == @sizeOf(@TypeOf(cqe.*)))) @compileError("static assertion failed \"sizeof (*(&cqe_copy)) == sizeof (*( cqe))\"");
        }
    }
    _ = memcpy(@ptrCast(@alignCast(&cqe_copy)), @ptrCast(@alignCast(cqe)), @sizeOf(@TypeOf(cqe.*)));
    liburing.io_uring_cqe_seen.?(&queuedata.*.ring, cqe);
    SDL_UnlockMutex_REAL(queuedata.*.cqe_lock);
    return ProcessCQE(queuedata, &cqe_copy);
}
pub fn liburing_asyncioqueue_wait_results(userdata: ?*anyopaque, timeoutMS: Sint32) callconv(.c) [*c]SDL_AsyncIOTask {
    @setEvalBranchQuota(100000);
    var queuedata: [*c]LibUringAsyncIOQueueData = @ptrCast(@alignCast(userdata));
    _ = &queuedata;
    var cqe: [*c]struct_io_uring_cqe = null;
    _ = &cqe;
    _ = SDL_AddAtomicInt_REAL(&queuedata.*.num_waiting, 1);
    if (timeoutMS < @as(c_int, 0)) {
        _ = liburing.io_uring_wait_cqe.?(&queuedata.*.ring, &cqe);
    } else {
        var ts: struct___kernel_timespec = struct___kernel_timespec{
            .tv_sec = @divTrunc(@as(Sint64, timeoutMS), @as(Sint64, SDL_MS_PER_SECOND)),
            .tv_nsec = @as(Sint64, @bitCast(@as(c_ulong, @truncate(@as(Uint64, @bitCast(@as(c_long, __helpers.signedRemainder(timeoutMS, SDL_MS_PER_SECOND)))) *% @as(Uint64, SDL_NS_PER_MS))))),
        };
        _ = &ts;
        _ = liburing.io_uring_wait_cqe_timeout.?(&queuedata.*.ring, &cqe, &ts);
    }
    _ = SDL_AddAtomicInt_REAL(&queuedata.*.num_waiting, -@as(c_int, 1));
    return liburing_asyncioqueue_get_results(userdata);
}
pub fn liburing_asyncioqueue_signal(userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var queuedata: [*c]LibUringAsyncIOQueueData = @ptrCast(@alignCast(userdata));
    _ = &queuedata;
    const num_waiting: c_int = SDL_GetAtomicInt_REAL(&queuedata.*.num_waiting);
    _ = &num_waiting;
    SDL_LockMutex_REAL(queuedata.*.sqe_lock);
    {
        var i: c_int = 0;
        _ = &i;
        while (i < num_waiting) : (i += 1) {
            var sqe: [*c]struct_io_uring_sqe = liburing.io_uring_get_sqe.?(&queuedata.*.ring);
            _ = &sqe;
            if (sqe != null) {
                const static_local_ts = struct {
                    var ts: struct___kernel_timespec = @import("std").mem.zeroes(struct___kernel_timespec);
                };
                _ = &static_local_ts;
                liburing.io_uring_prep_timeout.?(sqe, &static_local_ts.ts, 0, 0);
                liburing.io_uring_sqe_set_data.?(sqe, null);
            }
        }
    }
    _ = liburing.io_uring_submit.?(&queuedata.*.ring);
    SDL_UnlockMutex_REAL(queuedata.*.sqe_lock);
}
pub fn liburing_asyncioqueue_destroy(userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var queuedata: [*c]LibUringAsyncIOQueueData = @ptrCast(@alignCast(userdata));
    _ = &queuedata;
    liburing.io_uring_queue_exit.?(&queuedata.*.ring);
    SDL_DestroyMutex_REAL(queuedata.*.sqe_lock);
    SDL_DestroyMutex_REAL(queuedata.*.cqe_lock);
    SDL_free_REAL(@ptrCast(@alignCast(queuedata)));
}
pub fn SDL_SYS_CreateAsyncIOQueue_liburing(queue: [*c]SDL_AsyncIOQueue) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var queuedata: [*c]LibUringAsyncIOQueueData = undefined;
    queuedata = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(queuedata.*)))));
    _ = &queuedata;
    if (!(queuedata != null)) {
        return @"false" != 0;
    }
    _ = SDL_SetAtomicInt_REAL(&queuedata.*.num_waiting, 0);
    queuedata.*.sqe_lock = SDL_CreateMutex_REAL();
    if (!(queuedata.*.sqe_lock != null)) {
        SDL_free_REAL(@ptrCast(@alignCast(queuedata)));
        return @"false" != 0;
    }
    queuedata.*.cqe_lock = SDL_CreateMutex_REAL();
    if (!(queuedata.*.cqe_lock != null)) {
        SDL_DestroyMutex_REAL(queuedata.*.sqe_lock);
        SDL_free_REAL(@ptrCast(@alignCast(queuedata)));
        return @"false" != 0;
    }
    const rc: c_int = liburing.io_uring_queue_init.?(128, &queuedata.*.ring, 0);
    _ = &rc;
    if (rc != @as(c_int, 0)) {
        SDL_DestroyMutex_REAL(queuedata.*.sqe_lock);
        SDL_DestroyMutex_REAL(queuedata.*.cqe_lock);
        SDL_free_REAL(@ptrCast(@alignCast(queuedata)));
        return liburing_SetError("io_uring_queue_init", rc);
    }
    const static_local_SDL_AsyncIOQueue_liburing = struct {
        const SDL_AsyncIOQueue_liburing: SDL_AsyncIOQueueInterface = SDL_AsyncIOQueueInterface{
            .queue_task = liburing_asyncioqueue_queue_task,
            .cancel_task = liburing_asyncioqueue_cancel_task,
            .get_results = liburing_asyncioqueue_get_results,
            .wait_results = liburing_asyncioqueue_wait_results,
            .signal = liburing_asyncioqueue_signal,
            .destroy = liburing_asyncioqueue_destroy,
        };
    };
    _ = &static_local_SDL_AsyncIOQueue_liburing;
    {
        comptime {
            if (!(@sizeOf(@TypeOf((&queue.*.iface).*)) == @sizeOf(@TypeOf((&static_local_SDL_AsyncIOQueue_liburing.SDL_AsyncIOQueue_liburing).*)))) @compileError("static assertion failed \"sizeof (*(&queue->iface)) == sizeof (*( &SDL_AsyncIOQueue_liburing))\"");
        }
    }
    _ = memcpy(@ptrCast(@alignCast(&queue.*.iface)), @ptrCast(@alignCast(&static_local_SDL_AsyncIOQueue_liburing.SDL_AsyncIOQueue_liburing)), @sizeOf(@TypeOf((&static_local_SDL_AsyncIOQueue_liburing.SDL_AsyncIOQueue_liburing).*)));
    queue.*.userdata = @ptrCast(@alignCast(queuedata));
    return @"true" != 0;
}
pub fn liburing_asyncio_read(userdata: ?*anyopaque, task: [*c]SDL_AsyncIOTask) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var queuedata: [*c]LibUringAsyncIOQueueData = @ptrCast(@alignCast(task.*.queue.*.userdata));
    _ = &queuedata;
    const fd: c_int = @truncate(@as(isize, @intCast(@intFromPtr(userdata))));
    _ = &fd;
    if (task.*.requested_size > @as(Uint64, ~@as(c_uint, @bitCast(@as(c_int, @as(c_int, 0)))))) {
        return SDL_SetError_REAL("io_uring: i/o task is too large");
    }
    SDL_LockMutex_REAL(queuedata.*.sqe_lock);
    var retval: bool = undefined;
    _ = &retval;
    var sqe: [*c]struct_io_uring_sqe = liburing.io_uring_get_sqe.?(&queuedata.*.ring);
    _ = &sqe;
    if (!(sqe != null)) {
        retval = SDL_SetError_REAL("io_uring: submission queue is full");
    } else {
        liburing.io_uring_prep_read.?(sqe, fd, task.*.buffer, @truncate(task.*.requested_size), task.*.offset);
        liburing.io_uring_sqe_set_data.?(sqe, @ptrCast(@alignCast(task)));
        retval = task.*.queue.*.iface.queue_task.?(task.*.queue.*.userdata, task);
    }
    SDL_UnlockMutex_REAL(queuedata.*.sqe_lock);
    return retval;
}
pub fn liburing_asyncio_write(userdata: ?*anyopaque, task: [*c]SDL_AsyncIOTask) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var queuedata: [*c]LibUringAsyncIOQueueData = @ptrCast(@alignCast(task.*.queue.*.userdata));
    _ = &queuedata;
    const fd: c_int = @truncate(@as(isize, @intCast(@intFromPtr(userdata))));
    _ = &fd;
    if (task.*.requested_size > @as(Uint64, ~@as(c_uint, @bitCast(@as(c_int, @as(c_int, 0)))))) {
        return SDL_SetError_REAL("io_uring: i/o task is too large");
    }
    SDL_LockMutex_REAL(queuedata.*.sqe_lock);
    var retval: bool = undefined;
    _ = &retval;
    var sqe: [*c]struct_io_uring_sqe = liburing.io_uring_get_sqe.?(&queuedata.*.ring);
    _ = &sqe;
    if (!(sqe != null)) {
        retval = SDL_SetError_REAL("io_uring: submission queue is full");
    } else {
        liburing.io_uring_prep_write.?(sqe, fd, task.*.buffer, @truncate(task.*.requested_size), task.*.offset);
        liburing.io_uring_sqe_set_data.?(sqe, @ptrCast(@alignCast(task)));
        retval = task.*.queue.*.iface.queue_task.?(task.*.queue.*.userdata, task);
    }
    SDL_UnlockMutex_REAL(queuedata.*.sqe_lock);
    return retval;
}
pub fn liburing_asyncio_close(userdata: ?*anyopaque, task: [*c]SDL_AsyncIOTask) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var queuedata: [*c]LibUringAsyncIOQueueData = @ptrCast(@alignCast(task.*.queue.*.userdata));
    _ = &queuedata;
    const fd: c_int = @truncate(@as(isize, @intCast(@intFromPtr(userdata))));
    _ = &fd;
    SDL_LockMutex_REAL(queuedata.*.sqe_lock);
    var retval: bool = undefined;
    _ = &retval;
    var sqe: [*c]struct_io_uring_sqe = liburing.io_uring_get_sqe.?(&queuedata.*.ring);
    _ = &sqe;
    if (!(sqe != null)) {
        retval = SDL_SetError_REAL("io_uring: submission queue is full");
    } else {
        if (task.*.flush) {
            var flush_sqe: [*c]struct_io_uring_sqe = sqe;
            _ = &flush_sqe;
            sqe = liburing.io_uring_get_sqe.?(&queuedata.*.ring);
            if (!(sqe != null)) {
                liburing.io_uring_prep_nop.?(flush_sqe);
                liburing.io_uring_sqe_set_data.?(flush_sqe, null);
                _ = task.*.queue.*.iface.queue_task.?(task.*.queue.*.userdata, task);
                SDL_UnlockMutex_REAL(queuedata.*.sqe_lock);
                return SDL_SetError_REAL("io_uring: submission queue is full");
            }
            liburing.io_uring_prep_fsync.?(flush_sqe, fd, @as(c_uint, 1) << @intCast(@as(c_uint, 0)));
            liburing.io_uring_sqe_set_data.?(flush_sqe, @ptrCast(@alignCast(task)));
            liburing.io_uring_sqe_set_flags.?(flush_sqe, @as(c_uint, 1) << @intCast(@as(c_uint, IOSQE_IO_HARDLINK_BIT)));
        }
        liburing.io_uring_prep_close.?(sqe, fd);
        liburing.io_uring_sqe_set_data.?(sqe, @ptrCast(@alignCast(task)));
        retval = task.*.queue.*.iface.queue_task.?(task.*.queue.*.userdata, task);
    }
    SDL_UnlockMutex_REAL(queuedata.*.sqe_lock);
    return retval;
}
pub fn liburing_asyncio_destroy(_: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn PosixOpenModeFromString(mode: [*c]const u8) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [23:0]u8 = "PosixOpenModeFromString".*;
    };
    _ = &static_local___func__;
    const struct_unnamed_86 = extern struct {
        str: [*c]const u8 = null,
        flags: c_int = 0,
    };
    _ = &struct_unnamed_86;
    const static_local_mappings = struct {
        const mappings: [4]struct_unnamed_86 = [4]struct_unnamed_86{
            struct_unnamed_86{
                .str = "rb",
                .flags = O_RDONLY,
            },
            struct_unnamed_86{
                .str = "wb",
                .flags = (O_WRONLY | O_CREAT) | O_TRUNC,
            },
            struct_unnamed_86{
                .str = "r+b",
                .flags = O_RDWR,
            },
            struct_unnamed_86{
                .str = "w+b",
                .flags = (O_RDWR | O_CREAT) | O_TRUNC,
            },
        };
    };
    _ = &static_local_mappings;
    {
        var i: c_int = 0;
        _ = &i;
        while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(static_local_mappings.mappings)) / @sizeOf(@TypeOf(static_local_mappings.mappings[@as(c_int, 0)])))) : (i += 1) {
            if (SDL_strcmp_REAL(static_local_mappings.mappings[@bitCast(@as(isize, @intCast(i)))].str, mode) == @as(c_int, 0)) {
                return static_local_mappings.mappings[@bitCast(@as(isize, @intCast(i)))].flags;
            }
        }
    }
    while (true) {
        while (!!(@intFromPtr("Shouldn't have reached this code") != 0)) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "!\"Shouldn't have reached this code\"",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_asyncio_liburing.c", 510);
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
    return 0;
}
pub fn SDL_SYS_AsyncIOFromFile_liburing(file: [*c]const u8, mode: [*c]const u8, asyncio: [*c]SDL_AsyncIO) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const fd: c_int = open(file, PosixOpenModeFromString(mode), @as(c_int, 420));
    _ = &fd;
    if (fd == -@as(c_int, 1)) {
        return SDL_SetError_REAL("open failed: %s", strerror(__errno_location().*));
    }
    const static_local_SDL_AsyncIOFile_liburing = struct {
        const SDL_AsyncIOFile_liburing: SDL_AsyncIOInterface = SDL_AsyncIOInterface{
            .size = liburing_asyncio_size,
            .read = liburing_asyncio_read,
            .write = liburing_asyncio_write,
            .close = liburing_asyncio_close,
            .destroy = liburing_asyncio_destroy,
        };
    };
    _ = &static_local_SDL_AsyncIOFile_liburing;
    {
        comptime {
            if (!(@sizeOf(@TypeOf((&asyncio.*.iface).*)) == @sizeOf(@TypeOf((&static_local_SDL_AsyncIOFile_liburing.SDL_AsyncIOFile_liburing).*)))) @compileError("static assertion failed \"sizeof (*(&asyncio->iface)) == sizeof (*( &SDL_AsyncIOFile_liburing))\"");
        }
    }
    _ = memcpy(@ptrCast(@alignCast(&asyncio.*.iface)), @ptrCast(@alignCast(&static_local_SDL_AsyncIOFile_liburing.SDL_AsyncIOFile_liburing)), @sizeOf(@TypeOf((&static_local_SDL_AsyncIOFile_liburing.SDL_AsyncIOFile_liburing).*)));
    asyncio.*.userdata = @ptrFromInt(@as(usize, @intCast(@as(isize, fd))));
    return @"true" != 0;
}
pub fn SDL_SYS_QuitAsyncIO_liburing() callconv(.c) void {
    @setEvalBranchQuota(100000);
    UnloadLibUringLibrary();
}
pub fn MaybeInitializeLibUring() callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (SDL_ShouldInit_REAL(&liburing_init)) {
        if (LoadLibUring()) {
            SDL_DebugLogBackend("asyncio", "liburing");
            InitTSanAnnotations();
            CreateAsyncIOQueue = SDL_SYS_CreateAsyncIOQueue_liburing;
            QuitAsyncIO = SDL_SYS_QuitAsyncIO_liburing;
            AsyncIOFromFile = SDL_SYS_AsyncIOFromFile_liburing;
        } else {
            SDL_DebugLogBackend("asyncio", "generic");
            CreateAsyncIOQueue = SDL_SYS_CreateAsyncIOQueue_Generic;
            QuitAsyncIO = SDL_SYS_QuitAsyncIO_Generic;
            AsyncIOFromFile = SDL_SYS_AsyncIOFromFile_Generic;
        }
        SDL_SetInitialized_REAL(&liburing_init, @"true" != 0);
    }
}
pub export fn SDL_SYS_CreateAsyncIOQueue(queue: [*c]SDL_AsyncIOQueue) bool {
    @setEvalBranchQuota(100000);
    MaybeInitializeLibUring();
    return CreateAsyncIOQueue.?(queue);
}
pub export fn SDL_SYS_AsyncIOFromFile(file: [*c]const u8, mode: [*c]const u8, asyncio: [*c]SDL_AsyncIO) bool {
    @setEvalBranchQuota(100000);
    MaybeInitializeLibUring();
    return AsyncIOFromFile.?(file, mode, asyncio);
}
pub export fn SDL_SYS_QuitAsyncIO() void {
    @setEvalBranchQuota(100000);
    if (SDL_ShouldQuit_REAL(&liburing_init)) {
        QuitAsyncIO.?();
        CreateAsyncIOQueue = null;
        QuitAsyncIO = null;
        AsyncIOFromFile = null;
        SDL_SetInitialized_REAL(&liburing_init, @"false" != 0);
    }
}

pub const __glibc_macro_warning = @compileError("unable to translate macro: undefined identifier `GCC`");
// /usr/include/sys/cdefs.h:808:10
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_MS_PER_SECOND = @as(c_int, 1000);
pub const SDL_NS_PER_MS = __helpers.promoteIntLiteral(c_int, 1000000, .decimal);
pub const EAGAIN = @as(c_int, 11);
pub inline fn sigmask(sig: anytype) @TypeOf(__glibc_macro_warning("sigmask is deprecated")(__helpers.cast(c_int, @as(c_uint, 1) << (sig - @as(c_int, 1))))) {
    @setEvalBranchQuota(100000);
    _ = &sig;
    return __glibc_macro_warning("sigmask is deprecated")(__helpers.cast(c_int, @as(c_uint, 1) << (sig - @as(c_int, 1))));
}
pub const O_RDONLY = @as(c_int, 0o0);
pub const O_WRONLY = @as(c_int, 0o1);
pub const O_RDWR = @as(c_int, 0o2);
pub const O_CREAT = @as(c_int, 0o100);
pub const O_TRUNC = @as(c_int, 0o1000);
