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
pub const __suseconds_t = c_long;
pub const __blksize_t = c_long;
pub const __blkcnt_t = c_long;
pub const __syscall_slong_t = c_long;
pub const struct_timeval = extern struct {
    tv_sec: __time_t = 0,
    tv_usec: __suseconds_t = 0,
};
pub const struct_timespec = extern struct {
    tv_sec: __time_t = 0,
    tv_nsec: __syscall_slong_t = 0,
};
pub const __fd_mask = c_long;
pub const fd_set = extern struct {
    fds_bits: [16]__fd_mask = @import("std").mem.zeroes([16]__fd_mask),
};
pub extern fn select(__nfds: c_int, noalias __readfds: [*c]fd_set, noalias __writefds: [*c]fd_set, noalias __exceptfds: [*c]fd_set, noalias __timeout: [*c]struct_timeval) c_int;
pub const pthread_t = c_ulong;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub extern fn strerror(__errnum: c_int) [*c]u8;
pub extern fn index(__s: [*c]const u8, __c: c_int) [*c]u8;
pub const Uint8 = u8;
pub const Uint32 = u32;
pub const Uint64 = u64;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub const SDL_realloc_func = ?*const fn (mem: ?*anyopaque, size: usize) callconv(.c) ?*anyopaque;
pub const SDL_free_func = ?*const fn (mem: ?*anyopaque) callconv(.c) void;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_sscanf_REAL(text: [*c]const u8, fmt: [*c]const u8, ...) c_int;
pub extern fn SDL_snprintf_REAL(text: [*c]u8, maxlen: usize, fmt: [*c]const u8, ...) c_int;
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
pub extern fn SDL_GetAtomicInt_REAL(a: [*c]SDL_AtomicInt) c_int;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_PropertiesID = Uint32;
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
pub const struct_SDL_Mutex = opaque {
};
pub const SDL_Mutex = struct_SDL_Mutex;
pub const SDL_PIXELFORMAT_UNKNOWN: c_int = 0;
pub const SDL_PIXELFORMAT_YUY2: c_int = 844715353;
pub const SDL_PIXELFORMAT_MJPG: c_int = 1196444237;
pub const SDL_PIXELFORMAT_RGBX32: c_int = 374740996;
pub const enum_SDL_PixelFormat = c_uint;
pub const SDL_PixelFormat = enum_SDL_PixelFormat;
pub const SDL_COLORSPACE_UNKNOWN: c_int = 0;
pub const SDL_COLORSPACE_SRGB: c_int = 301991328;
pub const SDL_COLORSPACE_BT709_LIMITED: c_int = 554697761;
pub const enum_SDL_Colorspace = c_uint;
pub const SDL_Colorspace = enum_SDL_Colorspace;
pub const struct_SDL_Color = extern struct {
    r: Uint8 = 0,
    g: Uint8 = 0,
    b: Uint8 = 0,
    a: Uint8 = 0,
};
pub const SDL_Color = struct_SDL_Color;
pub const struct_SDL_Palette = extern struct {
    ncolors: c_int = 0,
    colors: [*c]SDL_Color = null,
    version: Uint32 = 0,
    refcount: c_int = 0,
};
pub const SDL_Palette = struct_SDL_Palette;
pub const struct_SDL_PixelFormatDetails = extern struct {
    format: SDL_PixelFormat = @import("std").mem.zeroes(SDL_PixelFormat),
    bits_per_pixel: Uint8 = 0,
    bytes_per_pixel: Uint8 = 0,
    padding: [2]Uint8 = @import("std").mem.zeroes([2]Uint8),
    Rmask: Uint32 = 0,
    Gmask: Uint32 = 0,
    Bmask: Uint32 = 0,
    Amask: Uint32 = 0,
    Rbits: Uint8 = 0,
    Gbits: Uint8 = 0,
    Bbits: Uint8 = 0,
    Abits: Uint8 = 0,
    Rshift: Uint8 = 0,
    Gshift: Uint8 = 0,
    Bshift: Uint8 = 0,
    Ashift: Uint8 = 0,
};
pub const SDL_PixelFormatDetails = struct_SDL_PixelFormatDetails;
pub const struct_SDL_Rect = extern struct {
    x: c_int = 0,
    y: c_int = 0,
    w: c_int = 0,
    h: c_int = 0,
};
pub const SDL_Rect = struct_SDL_Rect;
pub const SDL_SurfaceFlags = Uint32;
pub const SDL_SurfaceDataFlags = Uint32;
pub const SDL_Surface = struct_SDL_Surface;
pub const SDL_Blit = ?*const fn (src: [*c]struct_SDL_Surface, srcrect: [*c]const SDL_Rect, dst: [*c]struct_SDL_Surface, dstrect: [*c]const SDL_Rect) callconv(.c) bool;
pub const struct_SDL_BlitMap = extern struct {
    identity: c_int = 0,
    blit: SDL_Blit = null,
    data: ?*anyopaque = null,
    info: SDL_BlitInfo = @import("std").mem.zeroes(SDL_BlitInfo),
    dst_palette_version: Uint32 = 0,
    src_palette_version: Uint32 = 0,
};
pub const SDL_BlitMap = struct_SDL_BlitMap;
pub const struct_SDL_Surface = extern struct {
    flags: SDL_SurfaceFlags = 0,
    format: SDL_PixelFormat = @import("std").mem.zeroes(SDL_PixelFormat),
    w: c_int = 0,
    h: c_int = 0,
    pitch: c_int = 0,
    pixels: ?*anyopaque = null,
    refcount: c_int = 0,
    reserved: ?*anyopaque = null,
    internal_flags: SDL_SurfaceDataFlags = 0,
    props: SDL_PropertiesID = 0,
    fmt: [*c]const SDL_PixelFormatDetails = null,
    colorspace: SDL_Colorspace = @import("std").mem.zeroes(SDL_Colorspace),
    palette: [*c]SDL_Palette = null,
    num_images: c_int = 0,
    images: [*c][*c]SDL_Surface = null,
    locked: c_int = 0,
    clip_rect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    map: SDL_BlitMap = @import("std").mem.zeroes(SDL_BlitMap),
    saved_pixels: ?*anyopaque = null,
};
pub const SDL_CameraID = Uint32;
pub const SDL_CAMERA_POSITION_UNKNOWN: c_int = 0;
pub const enum_SDL_CameraPosition = c_uint;
pub const SDL_CameraPosition = enum_SDL_CameraPosition;
pub const SDL_Camera = struct_SDL_Camera;
pub const SDL_CAMERA_FRAME_ERROR: c_int = 0;
pub const SDL_CAMERA_FRAME_SKIP: c_int = 1;
pub const SDL_CAMERA_FRAME_READY: c_int = 2;
pub const enum_SDL_CameraFrameResult = c_uint;
pub const SDL_CameraFrameResult = enum_SDL_CameraFrameResult;
pub const struct_SDL_CameraSpec = extern struct {
    format: SDL_PixelFormat = @import("std").mem.zeroes(SDL_PixelFormat),
    colorspace: SDL_Colorspace = @import("std").mem.zeroes(SDL_Colorspace),
    width: c_int = 0,
    height: c_int = 0,
    framerate_numerator: c_int = 0,
    framerate_denominator: c_int = 0,
};
pub const SDL_CameraSpec = struct_SDL_CameraSpec;
pub const struct_SurfaceList = extern struct {
    surface: [*c]SDL_Surface = null,
    timestampNS: Uint64 = 0,
    next: [*c]struct_SurfaceList = null,
};
pub const SurfaceList = struct_SurfaceList;
pub const enum_SDL_CameraPermissionState = c_int;
pub const SDL_CameraPermissionState = enum_SDL_CameraPermissionState;
pub const IO_METHOD_INVALID: c_int = 0;
pub const IO_METHOD_READ: c_int = 1;
pub const IO_METHOD_MMAP: c_int = 2;
pub const IO_METHOD_USERPTR: c_int = 3;
pub const enum_io_method = c_uint;
pub const io_method = enum_io_method;
pub const struct_buffer = extern struct {
    start: ?*anyopaque = null,
    length: usize = 0,
    available: c_int = 0,
};
pub const struct_SDL_PrivateCameraData = extern struct {
    fd: c_int = 0,
    io: io_method = @import("std").mem.zeroes(io_method),
    nb_buffers: c_int = 0,
    buffers: [*c]struct_buffer = null,
    driver_pitch: c_int = 0,
};
pub const struct_SDL_Camera = extern struct {
    lock: ?*SDL_Mutex = null,
    name: [*c]u8 = null,
    position: SDL_CameraPosition = @import("std").mem.zeroes(SDL_CameraPosition),
    refcount: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
    WaitDevice: ?*const fn (device: [*c]SDL_Camera) callconv(.c) bool = null,
    AcquireFrame: ?*const fn (device: [*c]SDL_Camera, frame: [*c]SDL_Surface, timestampNS: [*c]Uint64, rotation: [*c]f32) callconv(.c) SDL_CameraFrameResult = null,
    ReleaseFrame: ?*const fn (device: [*c]SDL_Camera, frame: [*c]SDL_Surface) callconv(.c) void = null,
    all_specs: [*c]SDL_CameraSpec = null,
    num_specs: c_int = 0,
    actual_spec: SDL_CameraSpec = @import("std").mem.zeroes(SDL_CameraSpec),
    spec: SDL_CameraSpec = @import("std").mem.zeroes(SDL_CameraSpec),
    instance_id: SDL_CameraID = 0,
    handle: ?*anyopaque = null,
    drop_frames: c_int = 0,
    base_timestamp: Uint64 = 0,
    adjust_timestamp: Uint64 = 0,
    acquire_surface: [*c]SDL_Surface = null,
    conversion_surface: [*c]SDL_Surface = null,
    output_surfaces: [8]SurfaceList = @import("std").mem.zeroes([8]SurfaceList),
    filled_output_surfaces: SurfaceList = @import("std").mem.zeroes(SurfaceList),
    empty_output_surfaces: SurfaceList = @import("std").mem.zeroes(SurfaceList),
    app_held_output_surfaces: SurfaceList = @import("std").mem.zeroes(SurfaceList),
    zombie_pixels: [*c]Uint8 = null,
    needs_scaling: c_int = 0,
    needs_conversion: bool = false,
    shutdown: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
    zombie: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
    thread: [*c]SDL_Thread = null,
    props: SDL_PropertiesID = 0,
    permission: SDL_CameraPermissionState = @import("std").mem.zeroes(SDL_CameraPermissionState),
    hidden: [*c]struct_SDL_PrivateCameraData = null,
};
pub extern fn SDL_GetTicksNS_REAL() Uint64;
pub const struct_SDL_HashTable = opaque {
};
pub const SDL_HashTable = struct_SDL_HashTable;
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
pub extern fn __errno_location() [*c]c_int;
pub const __u8 = u8;
pub const __u16 = c_ushort;
pub const __s32 = c_int;
pub const __u32 = c_uint;
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
pub extern fn ioctl(__fd: c_int, __request: c_ulong, ...) c_int;
pub extern fn mmap(__addr: ?*anyopaque, __len: usize, __prot: c_int, __flags: c_int, __fd: c_int, __offset: __off_t) ?*anyopaque;
pub extern fn munmap(__addr: ?*anyopaque, __len: usize) c_int;
pub extern fn fstat(__fd: c_int, __buf: [*c]struct_stat) c_int;
pub extern fn close(__fd: c_int) c_int;
pub extern fn read(__fd: c_int, __buf: ?*anyopaque, __nbytes: usize) isize;
pub extern fn truncate(__file: [*c]const u8, __length: __off_t) c_int;
pub const V4L2_FIELD_ANY: c_int = 0;
pub const V4L2_BUF_TYPE_VIDEO_CAPTURE: c_int = 1;
pub const enum_v4l2_buf_type = c_uint;
pub const V4L2_MEMORY_MMAP: c_int = 1;
pub const V4L2_MEMORY_USERPTR: c_int = 2;
pub const struct_v4l2_rect = extern struct {
    left: __s32 = 0,
    top: __s32 = 0,
    width: __u32 = 0,
    height: __u32 = 0,
};
pub const struct_v4l2_fract = extern struct {
    numerator: __u32 = 0,
    denominator: __u32 = 0,
};
pub const struct_v4l2_capability = extern struct {
    driver: [16]__u8 = @import("std").mem.zeroes([16]__u8),
    card: [32]__u8 = @import("std").mem.zeroes([32]__u8),
    bus_info: [32]__u8 = @import("std").mem.zeroes([32]__u8),
    version: __u32 = 0,
    capabilities: __u32 = 0,
    device_caps: __u32 = 0,
    reserved: [3]__u32 = @import("std").mem.zeroes([3]__u32),
};
const union_unnamed_18 = extern union {
    ycbcr_enc: __u32,
    hsv_enc: __u32,
};
pub const struct_v4l2_pix_format = extern struct {
    width: __u32 = 0,
    height: __u32 = 0,
    pixelformat: __u32 = 0,
    field: __u32 = 0,
    bytesperline: __u32 = 0,
    sizeimage: __u32 = 0,
    colorspace: __u32 = 0,
    priv: __u32 = 0,
    flags: __u32 = 0,
    unnamed_0: union_unnamed_18 = @import("std").mem.zeroes(union_unnamed_18),
    quantization: __u32 = 0,
    xfer_func: __u32 = 0,
};
pub const struct_v4l2_fmtdesc = extern struct {
    index: __u32 = 0,
    type: __u32 = 0,
    flags: __u32 = 0,
    description: [32]__u8 = @import("std").mem.zeroes([32]__u8),
    pixelformat: __u32 = 0,
    mbus_code: __u32 = 0,
    reserved: [3]__u32 = @import("std").mem.zeroes([3]__u32),
};
pub const V4L2_FRMSIZE_TYPE_DISCRETE: c_int = 1;
pub const V4L2_FRMSIZE_TYPE_CONTINUOUS: c_int = 2;
pub const V4L2_FRMSIZE_TYPE_STEPWISE: c_int = 3;
pub const struct_v4l2_frmsize_discrete = extern struct {
    width: __u32 = 0,
    height: __u32 = 0,
};
pub const struct_v4l2_frmsize_stepwise = extern struct {
    min_width: __u32 = 0,
    max_width: __u32 = 0,
    step_width: __u32 = 0,
    min_height: __u32 = 0,
    max_height: __u32 = 0,
    step_height: __u32 = 0,
};
const union_unnamed_19 = extern union {
    discrete: struct_v4l2_frmsize_discrete,
    stepwise: struct_v4l2_frmsize_stepwise,
};
pub const struct_v4l2_frmsizeenum = extern struct {
    index: __u32 = 0,
    pixel_format: __u32 = 0,
    type: __u32 = 0,
    unnamed_0: union_unnamed_19 = @import("std").mem.zeroes(union_unnamed_19),
    reserved: [2]__u32 = @import("std").mem.zeroes([2]__u32),
};
pub const V4L2_FRMIVAL_TYPE_DISCRETE: c_int = 1;
pub const V4L2_FRMIVAL_TYPE_CONTINUOUS: c_int = 2;
pub const V4L2_FRMIVAL_TYPE_STEPWISE: c_int = 3;
pub const struct_v4l2_frmival_stepwise = extern struct {
    min: struct_v4l2_fract = @import("std").mem.zeroes(struct_v4l2_fract),
    max: struct_v4l2_fract = @import("std").mem.zeroes(struct_v4l2_fract),
    step: struct_v4l2_fract = @import("std").mem.zeroes(struct_v4l2_fract),
};
const union_unnamed_20 = extern union {
    discrete: struct_v4l2_fract,
    stepwise: struct_v4l2_frmival_stepwise,
};
pub const struct_v4l2_frmivalenum = extern struct {
    index: __u32 = 0,
    pixel_format: __u32 = 0,
    width: __u32 = 0,
    height: __u32 = 0,
    type: __u32 = 0,
    unnamed_0: union_unnamed_20 = @import("std").mem.zeroes(union_unnamed_20),
    reserved: [2]__u32 = @import("std").mem.zeroes([2]__u32),
};
pub const struct_v4l2_timecode = extern struct {
    type: __u32 = 0,
    flags: __u32 = 0,
    frames: __u8 = 0,
    seconds: __u8 = 0,
    minutes: __u8 = 0,
    hours: __u8 = 0,
    userbits: [4]__u8 = @import("std").mem.zeroes([4]__u8),
};
pub const struct_v4l2_requestbuffers = extern struct {
    count: __u32 = 0,
    type: __u32 = 0,
    memory: __u32 = 0,
    capabilities: __u32 = 0,
    flags: __u8 = 0,
    reserved: [3]__u8 = @import("std").mem.zeroes([3]__u8),
};
const union_unnamed_21 = extern union {
    mem_offset: __u32,
    userptr: c_ulong,
    fd: __s32,
};
pub const struct_v4l2_plane = extern struct {
    bytesused: __u32 = 0,
    length: __u32 = 0,
    m: union_unnamed_21 = @import("std").mem.zeroes(union_unnamed_21),
    data_offset: __u32 = 0,
    reserved: [11]__u32 = @import("std").mem.zeroes([11]__u32),
};
const union_unnamed_22 = extern union {
    offset: __u32,
    userptr: c_ulong,
    planes: [*c]struct_v4l2_plane,
    fd: __s32,
};
const union_unnamed_23 = extern union {
    request_fd: __s32,
    reserved: __u32,
};
pub const struct_v4l2_buffer = extern struct {
    index: __u32 = 0,
    type: __u32 = 0,
    bytesused: __u32 = 0,
    flags: __u32 = 0,
    field: __u32 = 0,
    timestamp: struct_timeval = @import("std").mem.zeroes(struct_timeval),
    timecode: struct_v4l2_timecode = @import("std").mem.zeroes(struct_v4l2_timecode),
    sequence: __u32 = 0,
    memory: __u32 = 0,
    m: union_unnamed_22 = @import("std").mem.zeroes(union_unnamed_22),
    length: __u32 = 0,
    reserved2: __u32 = 0,
    unnamed_0: union_unnamed_23 = @import("std").mem.zeroes(union_unnamed_23),
};
pub const struct_v4l2_clip = extern struct {
    c: struct_v4l2_rect = @import("std").mem.zeroes(struct_v4l2_rect),
    next: [*c]struct_v4l2_clip = null,
};
pub const struct_v4l2_window = extern struct {
    w: struct_v4l2_rect = @import("std").mem.zeroes(struct_v4l2_rect),
    field: __u32 = 0,
    chromakey: __u32 = 0,
    clips: [*c]struct_v4l2_clip = null,
    clipcount: __u32 = 0,
    bitmap: ?*anyopaque = null,
    global_alpha: __u8 = 0,
};
pub const struct_v4l2_captureparm = extern struct {
    capability: __u32 = 0,
    capturemode: __u32 = 0,
    timeperframe: struct_v4l2_fract = @import("std").mem.zeroes(struct_v4l2_fract),
    extendedmode: __u32 = 0,
    readbuffers: __u32 = 0,
    reserved: [4]__u32 = @import("std").mem.zeroes([4]__u32),
};
pub const struct_v4l2_outputparm = extern struct {
    capability: __u32 = 0,
    outputmode: __u32 = 0,
    timeperframe: struct_v4l2_fract = @import("std").mem.zeroes(struct_v4l2_fract),
    extendedmode: __u32 = 0,
    writebuffers: __u32 = 0,
    reserved: [4]__u32 = @import("std").mem.zeroes([4]__u32),
};
pub const struct_v4l2_cropcap = extern struct {
    type: __u32 = 0,
    bounds: struct_v4l2_rect = @import("std").mem.zeroes(struct_v4l2_rect),
    defrect: struct_v4l2_rect = @import("std").mem.zeroes(struct_v4l2_rect),
    pixelaspect: struct_v4l2_fract = @import("std").mem.zeroes(struct_v4l2_fract),
};
pub const struct_v4l2_crop = extern struct {
    type: __u32 = 0,
    c: struct_v4l2_rect = @import("std").mem.zeroes(struct_v4l2_rect),
};
pub const struct_v4l2_vbi_format = extern struct {
    sampling_rate: __u32 = 0,
    offset: __u32 = 0,
    samples_per_line: __u32 = 0,
    sample_format: __u32 = 0,
    start: [2]__s32 = @import("std").mem.zeroes([2]__s32),
    count: [2]__u32 = @import("std").mem.zeroes([2]__u32),
    flags: __u32 = 0,
    reserved: [2]__u32 = @import("std").mem.zeroes([2]__u32),
};
pub const struct_v4l2_sliced_vbi_format = extern struct {
    service_set: __u16 = 0,
    service_lines: [2][24]__u16 = @import("std").mem.zeroes([2][24]__u16),
    io_size: __u32 = 0,
    reserved: [2]__u32 = @import("std").mem.zeroes([2]__u32),
};
pub const struct_v4l2_plane_pix_format = extern struct {
    sizeimage: __u32 align(1) = 0,
    bytesperline: __u32 align(1) = 0,
    reserved: [6]__u16 align(1) = @import("std").mem.zeroes([6]__u16),
};
const union_unnamed_37 = extern union {
    ycbcr_enc: __u8,
    hsv_enc: __u8,
};
pub const struct_v4l2_pix_format_mplane = extern struct {
    width: __u32 align(1) = 0,
    height: __u32 align(1) = 0,
    pixelformat: __u32 align(1) = 0,
    field: __u32 align(1) = 0,
    colorspace: __u32 align(1) = 0,
    plane_fmt: [8]struct_v4l2_plane_pix_format = @import("std").mem.zeroes([8]struct_v4l2_plane_pix_format),
    num_planes: __u8 = 0,
    flags: __u8 = 0,
    unnamed_0: union_unnamed_37 = @import("std").mem.zeroes(union_unnamed_37),
    quantization: __u8 = 0,
    xfer_func: __u8 = 0,
    reserved: [7]__u8 = @import("std").mem.zeroes([7]__u8),
};
pub const struct_v4l2_sdr_format = extern struct {
    pixelformat: __u32 align(1) = 0,
    buffersize: __u32 align(1) = 0,
    reserved: [24]__u8 = @import("std").mem.zeroes([24]__u8),
};
pub const struct_v4l2_meta_format = extern struct {
    dataformat: __u32 align(1) = 0,
    buffersize: __u32 align(1) = 0,
    width: __u32 align(1) = 0,
    height: __u32 align(1) = 0,
    bytesperline: __u32 align(1) = 0,
};
const union_unnamed_38 = extern union {
    pix: struct_v4l2_pix_format,
    pix_mp: struct_v4l2_pix_format_mplane,
    win: struct_v4l2_window,
    vbi: struct_v4l2_vbi_format,
    sliced: struct_v4l2_sliced_vbi_format,
    sdr: struct_v4l2_sdr_format,
    meta: struct_v4l2_meta_format,
    raw_data: [200]__u8,
};
pub const struct_v4l2_format = extern struct {
    type: __u32 = 0,
    fmt: union_unnamed_38 = @import("std").mem.zeroes(union_unnamed_38),
};
const union_unnamed_39 = extern union {
    capture: struct_v4l2_captureparm,
    output: struct_v4l2_outputparm,
    raw_data: [200]__u8,
};
pub const struct_v4l2_streamparm = extern struct {
    type: __u32 = 0,
    parm: union_unnamed_39 = @import("std").mem.zeroes(union_unnamed_39),
};
pub const SDL_BlitInfo = extern struct {
    src_surface: [*c]SDL_Surface = null,
    src: [*c]Uint8 = null,
    src_w: c_int = 0,
    src_h: c_int = 0,
    src_pitch: c_int = 0,
    src_skip: c_int = 0,
    leading_skip: c_int = 0,
    dst_surface: [*c]SDL_Surface = null,
    dst: [*c]Uint8 = null,
    dst_w: c_int = 0,
    dst_h: c_int = 0,
    dst_pitch: c_int = 0,
    dst_skip: c_int = 0,
    src_fmt: [*c]const SDL_PixelFormatDetails = null,
    src_pal: [*c]const SDL_Palette = null,
    dst_fmt: [*c]const SDL_PixelFormatDetails = null,
    dst_pal: [*c]const SDL_Palette = null,
    table: [*c]Uint8 = null,
    palette_map: ?*SDL_HashTable = null,
    flags: c_int = 0,
    colorkey: Uint32 = 0,
    r: Uint8 = 0,
    g: Uint8 = 0,
    b: Uint8 = 0,
    a: Uint8 = 0,
};
pub extern fn SDL_CalculateSurfaceSize(format: SDL_PixelFormat, width: c_int, height: c_int, size: [*c]usize, pitch: [*c]usize, minimalPitch: bool) bool;
pub extern fn SDL_AddCamera(name: [*c]const u8, position: SDL_CameraPosition, num_specs: c_int, specs: [*c]const SDL_CameraSpec, handle: ?*anyopaque) [*c]SDL_Camera;
pub extern fn SDL_CameraDisconnected(device: [*c]SDL_Camera) void;
pub extern fn SDL_FindPhysicalCameraByCallback(callback: ?*const fn (userdata: ?*anyopaque, device: [*c]SDL_Camera) callconv(.c) bool, userdata: ?*anyopaque) [*c]SDL_Camera;
pub extern fn SDL_CameraPermissionOutcome(device: [*c]SDL_Camera, approved: bool) void;
pub const struct_CameraFormatAddData = extern struct {
    specs: [*c]SDL_CameraSpec = null,
    num_specs: c_int = 0,
    allocated_specs: c_int = 0,
};
pub const CameraFormatAddData = struct_CameraFormatAddData;
pub extern fn SDL_AddCameraFormat(data: [*c]CameraFormatAddData, format: SDL_PixelFormat, colorspace: SDL_Colorspace, w: c_int, h: c_int, framerate_numerator: c_int, framerate_denominator: c_int) bool;
pub const struct_SDL_CameraDriverImpl = extern struct {
    DetectDevices: ?*const fn () callconv(.c) void = null,
    OpenDevice: ?*const fn (device: [*c]SDL_Camera, spec: [*c]const SDL_CameraSpec) callconv(.c) bool = null,
    CloseDevice: ?*const fn (device: [*c]SDL_Camera) callconv(.c) void = null,
    WaitDevice: ?*const fn (device: [*c]SDL_Camera) callconv(.c) bool = null,
    AcquireFrame: ?*const fn (device: [*c]SDL_Camera, frame: [*c]SDL_Surface, timestampNS: [*c]Uint64, rotation: [*c]f32) callconv(.c) SDL_CameraFrameResult = null,
    ReleaseFrame: ?*const fn (device: [*c]SDL_Camera, frame: [*c]SDL_Surface) callconv(.c) void = null,
    FreeDeviceHandle: ?*const fn (device: [*c]SDL_Camera) callconv(.c) void = null,
    Deinitialize: ?*const fn () callconv(.c) void = null,
    ProvidesOwnCallbackThread: bool = false,
};
pub const SDL_CameraDriverImpl = struct_SDL_CameraDriverImpl;
pub const struct_CameraBootStrap = extern struct {
    name: [*c]const u8 = null,
    desc: [*c]const u8 = null,
    init: ?*const fn (impl: [*c]SDL_CameraDriverImpl) callconv(.c) bool = null,
    demand_only: bool = false,
};
pub const CameraBootStrap = struct_CameraBootStrap;
pub const SDL_ErrorCode = c_uint;
pub const SDL_UDEV_DEVICE_VIDEO_CAPTURE: c_int = 256;
pub const SDL_UDEV_DEVICEADDED: c_int = 1;
pub const SDL_UDEV_DEVICEREMOVED: c_int = 2;
pub const SDL_UDEV_deviceevent = c_uint;
pub const SDL_UDEV_Callback = ?*const fn (udev_type: SDL_UDEV_deviceevent, udev_class: c_int, devpath: [*c]const u8) callconv(.c) void;
pub extern fn SDL_UDEV_Init() bool;
pub extern fn SDL_UDEV_Quit() void;
pub extern fn SDL_UDEV_Scan() bool;
pub extern fn SDL_UDEV_AddCallback(cb: SDL_UDEV_Callback) bool;
pub extern fn SDL_UDEV_DelCallback(cb: SDL_UDEV_Callback) void;
pub const struct_V4L2DeviceHandle = extern struct {
    bus_info: [*c]u8 = null,
    path: [*c]u8 = null,
};
pub const V4L2DeviceHandle = struct_V4L2DeviceHandle;
pub fn xioctl(fh: c_int, request: c_int, arg: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var r: c_int = undefined;
    _ = &r;
    while (true) {
        r = ioctl(fh, @bitCast(@as(c_long, request)), arg);
        if (!((r == -@as(c_int, 1)) and (__errno_location().* == EINTR))) break;
    }
    return r;
}
pub fn V4L2_WaitDevice(device: [*c]SDL_Camera) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const fd: c_int = device.*.hidden.*.fd;
    _ = &fd;
    var rc: c_int = undefined;
    _ = &rc;
    while (true) {
        var fds: fd_set = undefined;
        _ = &fds;
        while (true) {
            var __i: c_uint = undefined;
            _ = &__i;
            var __arr: [*c]fd_set = &fds;
            _ = &__arr;
            {
                __i = 0;
                while (@as(c_ulong, __i) < (@sizeOf(fd_set) / @sizeOf(__fd_mask))) : (__i +%= 1) {
                    __arr.*.fds_bits[__i] = 0;
                }
            }
            if (!false) break;
        }
        (&fds).*.fds_bits[@bitCast(@as(isize, @intCast(@divTrunc(fd, @as(c_int, 8) * @as(c_int, @bitCast(@as(c_uint, @truncate(@sizeOf(__fd_mask)))))))))] |= @as(__fd_mask, @bitCast(@as(c_ulong, @truncate(@as(c_ulong, 1) << @intCast(@as(c_ulong, @bitCast(@as(c_long, __helpers.signedRemainder(fd, @as(c_int, 8) * @as(c_int, @bitCast(@as(c_uint, @truncate(@sizeOf(__fd_mask))))))))))))));
        var tv: struct_timeval = undefined;
        _ = &tv;
        tv.tv_sec = 0;
        tv.tv_usec = @as(c_int, 100) * @as(c_int, 1000);
        rc = select(fd + @as(c_int, 1), &fds, null, null, &tv);
        if ((rc == -@as(c_int, 1)) and (__errno_location().* == EINTR)) {
            rc = 0;
        } else if (rc > @as(c_int, 0)) {
            return @"true" != 0;
        }
        if (SDL_GetAtomicInt_REAL(&device.*.shutdown) != 0) {
            return @"true" != 0;
        }
        if (!(rc == @as(c_int, 0))) break;
    }
    return @"false" != 0;
}
pub fn V4L2_AcquireFrame(device: [*c]SDL_Camera, frame: [*c]SDL_Surface, timestampNS: [*c]Uint64, _: [*c]f32) callconv(.c) SDL_CameraFrameResult {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [17:0]u8 = "V4L2_AcquireFrame".*;
    };
    _ = &static_local___func__;
    var fd: c_int = undefined;
    _ = &fd;
    var io: io_method = undefined;
    _ = &io;
    var size: usize = undefined;
    _ = &size;
    var buf: struct_v4l2_buffer = undefined;
    _ = &buf;
    var amount: isize = undefined;
    _ = &amount;
    var i: c_int = undefined;
    _ = &i;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "!\"Shouldn't have hit this\"",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data;
    var sdl_assert_state: SDL_AssertState = undefined;
    _ = &sdl_assert_state;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                fd = device.*.hidden.*.fd;
                io = device.*.hidden.*.io;
                size = device.*.hidden.*.buffers[@as(c_int, 0)].length;
                switch (io) {
                    @as(io_method, IO_METHOD_READ) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(io_method, IO_METHOD_MMAP) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(io_method, IO_METHOD_USERPTR) => {
                        sdl_pc = 27;
                        continue;
                    },
                    @as(io_method, IO_METHOD_INVALID) => {
                        sdl_pc = 48;
                        continue;
                    },
                    else => {
                        sdl_pc = 1;
                        continue;
                    },
                }
            },
            1 => {
                return SDL_CAMERA_FRAME_READY;
            },
            2 => {
                if ((blk: {
                    const tmp = read(fd, device.*.hidden.*.buffers[@as(c_int, 0)].start, size);
                    amount = tmp;
                    break :blk tmp;
                }) == @as(isize, -@as(c_int, 1))) {
                    sdl_pc = 3;
                    continue;
                } else {
                    sdl_pc = 4;
                    continue;
                }
            },
            3 => {
                switch (__errno_location().*) {
                    EAGAIN => {
                        sdl_pc = 7;
                        continue;
                    },
                    EIO => {
                        sdl_pc = 8;
                        continue;
                    },
                    else => {
                        sdl_pc = 9;
                        continue;
                    },
                }
            },
            4 => {
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            5 => {
                timestampNS.* = SDL_GetTicksNS_REAL();
                frame.*.pixels = device.*.hidden.*.buffers[@as(c_int, 0)].start;
                if (device.*.hidden.*.driver_pitch != 0) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            6 => {
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            7 => {
                return SDL_CAMERA_FRAME_SKIP;
            },
            8 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                _ = SDL_SetError_REAL("read");
                return SDL_CAMERA_FRAME_ERROR;
            },
            10 => {
                frame.*.pitch = device.*.hidden.*.driver_pitch;
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                frame.*.pitch = @truncate(amount);
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            13 => {
                _ = memset(@ptrCast(@alignCast(&buf)), 0, @sizeOf(@TypeOf(buf)));
                buf.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
                buf.memory = V4L2_MEMORY_MMAP;
                if (xioctl(fd, @bitCast(@as(c_uint, @truncate(@as(c_ulong, (((_IOC_READ | _IOC_WRITE) << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'V') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 17) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(struct_v4l2_buffer) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS)))))))), @ptrCast(@alignCast(&buf))) == -@as(c_int, 1)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                switch (__errno_location().*) {
                    EAGAIN => {
                        sdl_pc = 18;
                        continue;
                    },
                    EIO => {
                        sdl_pc = 19;
                        continue;
                    },
                    else => {
                        sdl_pc = 20;
                        continue;
                    },
                }
            },
            15 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                if ((@as(c_int, @bitCast(@as(c_uint, @truncate(buf.index)))) < @as(c_int, 0)) or (@as(c_int, @bitCast(@as(c_uint, @truncate(buf.index)))) >= device.*.hidden.*.nb_buffers)) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            18 => {
                return SDL_CAMERA_FRAME_SKIP;
            },
            19 => {
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            20 => {
                _ = SDL_SetError_REAL("VIDIOC_DQBUF: %d", __errno_location().*);
                return SDL_CAMERA_FRAME_ERROR;
            },
            21 => {
                _ = SDL_SetError_REAL("invalid buffer index");
                return SDL_CAMERA_FRAME_ERROR;
            },
            22 => {
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            23 => {
                frame.*.pixels = device.*.hidden.*.buffers[buf.index].start;
                if (device.*.hidden.*.driver_pitch != 0) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            24 => {
                frame.*.pitch = device.*.hidden.*.driver_pitch;
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            25 => {
                frame.*.pitch = @bitCast(@as(c_uint, @truncate(buf.bytesused)));
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            26 => {
                device.*.hidden.*.buffers[buf.index].available = 1;
                timestampNS.* = @truncate((@as(c_ulonglong, @as(Uint64, @bitCast(@as(c_long, buf.timestamp.tv_sec)))) *% @as(c_ulonglong, SDL_NS_PER_SECOND)) +% @as(c_ulonglong, @as(Uint64, @bitCast(@as(c_long, buf.timestamp.tv_usec))) *% @as(Uint64, SDL_NS_PER_US)));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            27 => {
                _ = memset(@ptrCast(@alignCast(&buf)), 0, @sizeOf(@TypeOf(buf)));
                buf.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
                buf.memory = V4L2_MEMORY_USERPTR;
                if (xioctl(fd, @bitCast(@as(c_uint, @truncate(@as(c_ulong, (((_IOC_READ | _IOC_WRITE) << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'V') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 17) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(struct_v4l2_buffer) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS)))))))), @ptrCast(@alignCast(&buf))) == -@as(c_int, 1)) {
                    sdl_pc = 28;
                    continue;
                } else {
                    sdl_pc = 29;
                    continue;
                }
            },
            28 => {
                switch (__errno_location().*) {
                    EAGAIN => {
                        sdl_pc = 32;
                        continue;
                    },
                    EIO => {
                        sdl_pc = 33;
                        continue;
                    },
                    else => {
                        sdl_pc = 34;
                        continue;
                    },
                }
            },
            29 => {
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            30 => {
                i = 0;
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            31 => {
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            32 => {
                return SDL_CAMERA_FRAME_SKIP;
            },
            33 => {
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            34 => {
                _ = SDL_SetError_REAL("VIDIOC_DQBUF");
                return SDL_CAMERA_FRAME_ERROR;
            },
            35 => {
                if (i < device.*.hidden.*.nb_buffers) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 38;
                    continue;
                }
            },
            36 => {
                if ((buf.m.userptr == @as(c_ulong, @intCast(@intFromPtr(device.*.hidden.*.buffers[@bitCast(@as(isize, @intCast(i)))].start)))) and (@as(usize, buf.length) == size)) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 40;
                    continue;
                }
            },
            37 => {
                i += 1;
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            38 => {
                if (i >= device.*.hidden.*.nb_buffers) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 43;
                    continue;
                }
            },
            39 => {
                {
                    sdl_pc = 38;
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
                    sdl_pc = 37;
                    continue;
                }
            },
            42 => {
                _ = SDL_SetError_REAL("invalid buffer index");
                return SDL_CAMERA_FRAME_ERROR;
            },
            43 => {
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            44 => {
                frame.*.pixels = @ptrFromInt(buf.m.userptr);
                if (device.*.hidden.*.driver_pitch != 0) {
                    sdl_pc = 45;
                    continue;
                } else {
                    sdl_pc = 46;
                    continue;
                }
            },
            45 => {
                frame.*.pitch = device.*.hidden.*.driver_pitch;
                {
                    sdl_pc = 47;
                    continue;
                }
            },
            46 => {
                frame.*.pitch = @bitCast(@as(c_uint, @truncate(buf.bytesused)));
                {
                    sdl_pc = 47;
                    continue;
                }
            },
            47 => {
                device.*.hidden.*.buffers[@bitCast(@as(isize, @intCast(i)))].available = 1;
                timestampNS.* = @truncate((@as(c_ulonglong, @as(Uint64, @bitCast(@as(c_long, buf.timestamp.tv_sec)))) *% @as(c_ulonglong, SDL_NS_PER_SECOND)) +% @as(c_ulonglong, @as(Uint64, @bitCast(@as(c_long, buf.timestamp.tv_usec))) *% @as(Uint64, SDL_NS_PER_US)));
                {
                    sdl_pc = 1;
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
                    sdl_pc = 52;
                    continue;
                }
            },
            50 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 49;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            51 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            52 => {
                if (!!(@intFromPtr("Shouldn't have hit this") != 0)) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 54;
                    continue;
                }
            },
            53 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_camera_v4l2.c", 252);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 55;
                    continue;
                } else {
                    sdl_pc = 56;
                    continue;
                }
            },
            54 => {
                {
                    sdl_pc = 50;
                    continue;
                }
            },
            55 => {
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            56 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 58;
                    continue;
                } else {
                    sdl_pc = 59;
                    continue;
                }
            },
            57 => {
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            58 => {
                __builtin.debugtrap();
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            59 => {
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            60 => {
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn V4L2_ReleaseFrame(device: [*c]SDL_Camera, frame: [*c]SDL_Surface) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [17:0]u8 = "V4L2_ReleaseFrame".*;
    };
    _ = &static_local___func__;
    var buf: struct_v4l2_buffer = undefined;
    _ = &buf;
    var fd: c_int = undefined;
    _ = &fd;
    var io: io_method = undefined;
    _ = &io;
    var i: c_int = undefined;
    _ = &i;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "!\"Shouldn't have hit this\"",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data;
    var sdl_assert_state: SDL_AssertState = undefined;
    _ = &sdl_assert_state;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                fd = device.*.hidden.*.fd;
                io = device.*.hidden.*.io;
                i = 0;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            1 => {
                if (i < device.*.hidden.*.nb_buffers) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 4;
                    continue;
                }
            },
            2 => {
                if (frame.*.pixels == device.*.hidden.*.buffers[@bitCast(@as(isize, @intCast(i)))].start) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            3 => {
                i += 1;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                if (i >= device.*.hidden.*.nb_buffers) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            5 => {
                {
                    sdl_pc = 4;
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
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            8 => {
                return;
            },
            9 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                switch (io) {
                    @as(io_method, IO_METHOD_READ) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(io_method, IO_METHOD_MMAP) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(io_method, IO_METHOD_USERPTR) => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(io_method, IO_METHOD_INVALID) => {
                        sdl_pc = 21;
                        continue;
                    },
                    else => {
                        sdl_pc = 11;
                        continue;
                    },
                }
            },
            11 => {
                {}
            },
            12 => {
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            13 => {
                _ = memset(@ptrCast(@alignCast(&buf)), 0, @sizeOf(@TypeOf(buf)));
                buf.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
                buf.memory = V4L2_MEMORY_MMAP;
                buf.index = @bitCast(@as(c_int, i));
                if (xioctl(fd, @bitCast(@as(c_uint, @truncate(@as(c_ulong, (((_IOC_READ | _IOC_WRITE) << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'V') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 15) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(struct_v4l2_buffer) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS)))))))), @ptrCast(@alignCast(&buf))) == -@as(c_int, 1)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                return;
            },
            15 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                device.*.hidden.*.buffers[@bitCast(@as(isize, @intCast(i)))].available = 0;
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            17 => {
                _ = memset(@ptrCast(@alignCast(&buf)), 0, @sizeOf(@TypeOf(buf)));
                buf.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
                buf.memory = V4L2_MEMORY_USERPTR;
                buf.index = @bitCast(@as(c_int, i));
                buf.m.userptr = @intCast(@intFromPtr(frame.*.pixels));
                buf.length = @bitCast(@as(c_int, @as(c_int, @bitCast(@as(c_uint, @truncate(device.*.hidden.*.buffers[@bitCast(@as(isize, @intCast(i)))].length))))));
                if (xioctl(fd, @bitCast(@as(c_uint, @truncate(@as(c_ulong, (((_IOC_READ | _IOC_WRITE) << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'V') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 15) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(struct_v4l2_buffer) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS)))))))), @ptrCast(@alignCast(&buf))) == -@as(c_int, 1)) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            18 => {
                return;
            },
            19 => {
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            20 => {
                device.*.hidden.*.buffers[@bitCast(@as(isize, @intCast(i)))].available = 0;
                {
                    sdl_pc = 11;
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
                    sdl_pc = 25;
                    continue;
                }
            },
            23 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            24 => {
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            25 => {
                if (!!(@intFromPtr("Shouldn't have hit this") != 0)) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            26 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_camera_v4l2.c", 311);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 28;
                    continue;
                } else {
                    sdl_pc = 29;
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
                    sdl_pc = 25;
                    continue;
                }
            },
            29 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 31;
                    continue;
                } else {
                    sdl_pc = 32;
                    continue;
                }
            },
            30 => {
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            31 => {
                __builtin.debugtrap();
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
                    sdl_pc = 30;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn EnqueueBuffers(device: [*c]SDL_Camera) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [14:0]u8 = "EnqueueBuffers".*;
    };
    _ = &static_local___func__;
    var fd: c_int = undefined;
    _ = &fd;
    var io: io_method = undefined;
    _ = &io;
    var i: c_int = undefined;
    _ = &i;
    var buf: struct_v4l2_buffer = undefined;
    _ = &buf;
    var i_1: c_int = undefined;
    _ = &i_1;
    var buf_2: struct_v4l2_buffer = undefined;
    _ = &buf_2;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "!\"Shouldn't have hit this\"",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data;
    var sdl_assert_state: SDL_AssertState = undefined;
    _ = &sdl_assert_state;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                fd = device.*.hidden.*.fd;
                io = device.*.hidden.*.io;
                switch (io) {
                    @as(io_method, IO_METHOD_READ) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(io_method, IO_METHOD_MMAP) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(io_method, IO_METHOD_USERPTR) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(io_method, IO_METHOD_INVALID) => {
                        sdl_pc = 25;
                        continue;
                    },
                    else => {
                        sdl_pc = 1;
                        continue;
                    },
                }
            },
            1 => {
                return @"true" != 0;
            },
            2 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                i = 0;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                if (i < device.*.hidden.*.nb_buffers) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 7;
                    continue;
                }
            },
            5 => {
                if (device.*.hidden.*.buffers[@bitCast(@as(isize, @intCast(i)))].available == @as(c_int, 0)) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            6 => {
                i += 1;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            7 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            8 => {
                _ = memset(@ptrCast(@alignCast(&buf)), 0, @sizeOf(@TypeOf(buf)));
                buf.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
                buf.memory = V4L2_MEMORY_MMAP;
                buf.index = @bitCast(@as(c_int, i));
                if (xioctl(fd, @bitCast(@as(c_uint, @truncate(@as(c_ulong, (((_IOC_READ | _IOC_WRITE) << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'V') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 15) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(struct_v4l2_buffer) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS)))))))), @ptrCast(@alignCast(&buf))) == -@as(c_int, 1)) {
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
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            11 => {
                return SDL_SetError_REAL("VIDIOC_QBUF");
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
                i_1 = 0;
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                if (i_1 < device.*.hidden.*.nb_buffers) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            16 => {
                if (device.*.hidden.*.buffers[@bitCast(@as(isize, @intCast(i_1)))].available == @as(c_int, 0)) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            17 => {
                i_1 += 1;
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            18 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            19 => {
                _ = memset(@ptrCast(@alignCast(&buf_2)), 0, @sizeOf(@TypeOf(buf_2)));
                buf_2.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
                buf_2.memory = V4L2_MEMORY_USERPTR;
                buf_2.index = @bitCast(@as(c_int, i_1));
                buf_2.m.userptr = @intCast(@intFromPtr(device.*.hidden.*.buffers[@bitCast(@as(isize, @intCast(i_1)))].start));
                buf_2.length = @bitCast(@as(c_int, @as(c_int, @bitCast(@as(c_uint, @truncate(device.*.hidden.*.buffers[@bitCast(@as(isize, @intCast(i_1)))].length))))));
                if (xioctl(fd, @bitCast(@as(c_uint, @truncate(@as(c_ulong, (((_IOC_READ | _IOC_WRITE) << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'V') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 15) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(struct_v4l2_buffer) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS)))))))), @ptrCast(@alignCast(&buf_2))) == -@as(c_int, 1)) {
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
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            22 => {
                return SDL_SetError_REAL("VIDIOC_QBUF");
            },
            23 => {
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
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            26 => {
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            27 => {
                if (@as(c_int, 0) != 0) {
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
                if (!!(@intFromPtr("Shouldn't have hit this") != 0)) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            30 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_camera_v4l2.c", 360);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
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
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            33 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            34 => {
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            35 => {
                __builtin.debugtrap();
                {
                    sdl_pc = 37;
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
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn AllocBufferRead(device: [*c]SDL_Camera, buffer_size: usize) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    device.*.hidden.*.buffers[@as(c_int, 0)].length = buffer_size;
    device.*.hidden.*.buffers[@as(c_int, 0)].start = SDL_calloc_REAL(1, buffer_size);
    return device.*.hidden.*.buffers[@as(c_int, 0)].start != @as(?*anyopaque, null);
}
pub fn AllocBufferMmap(device: [*c]SDL_Camera) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const fd: c_int = device.*.hidden.*.fd;
    _ = &fd;
    var i: c_int = undefined;
    _ = &i;
    {
        i = 0;
        while (i < device.*.hidden.*.nb_buffers) : (i += 1) {
            var buf: struct_v4l2_buffer = undefined;
            _ = &buf;
            _ = memset(@ptrCast(@alignCast(&buf)), 0, @sizeOf(@TypeOf(buf)));
            buf.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
            buf.memory = V4L2_MEMORY_MMAP;
            buf.index = @bitCast(@as(c_int, i));
            if (xioctl(fd, @bitCast(@as(c_uint, @truncate(@as(c_ulong, (((_IOC_READ | _IOC_WRITE) << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'V') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 9) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(struct_v4l2_buffer) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS)))))))), @ptrCast(@alignCast(&buf))) == -@as(c_int, 1)) {
                return SDL_SetError_REAL("VIDIOC_QUERYBUF");
            }
            device.*.hidden.*.buffers[@bitCast(@as(isize, @intCast(i)))].length = buf.length;
            device.*.hidden.*.buffers[@bitCast(@as(isize, @intCast(i)))].start = mmap(null, buf.length, PROT_READ | PROT_WRITE, MAP_SHARED, fd, buf.m.offset);
            if (@as(?*anyopaque, @ptrFromInt(@as(usize, @intCast(__helpers.cast(usize, @as(isize, -@as(c_int, 1))))))) == device.*.hidden.*.buffers[@bitCast(@as(isize, @intCast(i)))].start) {
                return SDL_SetError_REAL("mmap");
            }
        }
    }
    return @"true" != 0;
}
pub fn AllocBufferUserPtr(device: [*c]SDL_Camera, buffer_size: usize) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    {
        i = 0;
        while (i < device.*.hidden.*.nb_buffers) : (i += 1) {
            device.*.hidden.*.buffers[@bitCast(@as(isize, @intCast(i)))].length = buffer_size;
            device.*.hidden.*.buffers[@bitCast(@as(isize, @intCast(i)))].start = SDL_calloc_REAL(1, buffer_size);
            if (!(device.*.hidden.*.buffers[@bitCast(@as(isize, @intCast(i)))].start != null)) {
                return @"false" != 0;
            }
        }
    }
    return @"true" != 0;
}
pub fn format_v4l2_to_sdl(fmt: Uint32, format: [*c]SDL_PixelFormat, colorspace: [*c]SDL_Colorspace) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (fmt) {
                    ((@as(__u32, @bitCast(@as(c_int, @as(c_int, 'Y')))) | (@as(__u32, @bitCast(@as(c_int, @as(c_int, 'U')))) << @intCast(@as(__u32, 8)))) | (@as(__u32, @bitCast(@as(c_int, @as(c_int, 'Y')))) << @intCast(@as(__u32, 16)))) | (@as(__u32, @bitCast(@as(c_int, @as(c_int, 'V')))) << @intCast(@as(__u32, 24))) => {
                        sdl_pc = 2;
                        continue;
                    },
                    ((@as(__u32, @bitCast(@as(c_int, @as(c_int, 'M')))) | (@as(__u32, @bitCast(@as(c_int, @as(c_int, 'J')))) << @intCast(@as(__u32, 8)))) | (@as(__u32, @bitCast(@as(c_int, @as(c_int, 'P')))) << @intCast(@as(__u32, 16)))) | (@as(__u32, @bitCast(@as(c_int, @as(c_int, 'G')))) << @intCast(@as(__u32, 24))) => {
                        sdl_pc = 3;
                        continue;
                    },
                    ((@as(__u32, @bitCast(@as(c_int, @as(c_int, 'X')))) | (@as(__u32, @bitCast(@as(c_int, @as(c_int, 'B')))) << @intCast(@as(__u32, 8)))) | (@as(__u32, @bitCast(@as(c_int, @as(c_int, '2')))) << @intCast(@as(__u32, 16)))) | (@as(__u32, @bitCast(@as(c_int, @as(c_int, '4')))) << @intCast(@as(__u32, 24))) => {
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
                format.* = SDL_PIXELFORMAT_UNKNOWN;
                colorspace.* = SDL_COLORSPACE_UNKNOWN;
                {}
            },
            2 => {
                format.* = SDL_PIXELFORMAT_YUY2;
                colorspace.* = SDL_COLORSPACE_BT709_LIMITED;
                return;
            },
            3 => {
                format.* = SDL_PIXELFORMAT_MJPG;
                colorspace.* = SDL_COLORSPACE_SRGB;
                return;
            },
            4 => {
                format.* = SDL_PIXELFORMAT_RGBX32;
                colorspace.* = SDL_COLORSPACE_SRGB;
                return;
            },
            5 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn format_sdl_to_v4l2(fmt: SDL_PixelFormat) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (fmt) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_MJPG) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBX32) => {
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
                return undefined;
            },
            2 => {
                return ((@as(__u32, @bitCast(@as(c_int, @as(c_int, 'Y')))) | (@as(__u32, @bitCast(@as(c_int, @as(c_int, 'U')))) << @intCast(@as(__u32, 8)))) | (@as(__u32, @bitCast(@as(c_int, @as(c_int, 'Y')))) << @intCast(@as(__u32, 16)))) | (@as(__u32, @bitCast(@as(c_int, @as(c_int, 'V')))) << @intCast(@as(__u32, 24)));
            },
            3 => {
                return ((@as(__u32, @bitCast(@as(c_int, @as(c_int, 'M')))) | (@as(__u32, @bitCast(@as(c_int, @as(c_int, 'J')))) << @intCast(@as(__u32, 8)))) | (@as(__u32, @bitCast(@as(c_int, @as(c_int, 'P')))) << @intCast(@as(__u32, 16)))) | (@as(__u32, @bitCast(@as(c_int, @as(c_int, 'G')))) << @intCast(@as(__u32, 24)));
            },
            4 => {
                return ((@as(__u32, @bitCast(@as(c_int, @as(c_int, 'X')))) | (@as(__u32, @bitCast(@as(c_int, @as(c_int, 'B')))) << @intCast(@as(__u32, 8)))) | (@as(__u32, @bitCast(@as(c_int, @as(c_int, '2')))) << @intCast(@as(__u32, 16)))) | (@as(__u32, @bitCast(@as(c_int, @as(c_int, '4')))) << @intCast(@as(__u32, 24)));
            },
            5 => {
                return 0;
            },
            else => unreachable,
        }
    }
}
pub fn V4L2_CloseDevice(device: [*c]SDL_Camera) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var io: io_method = undefined;
    _ = &io;
    var fd: c_int = undefined;
    _ = &fd;
    var @"type": enum_v4l2_buf_type = undefined;
    _ = &@"type";
    var i: c_int = undefined;
    _ = &i;
    var i_1: c_int = undefined;
    _ = &i_1;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (!(device != null)) {
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
                if (device.*.hidden != null) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                io = device.*.hidden.*.io;
                fd = device.*.hidden.*.fd;
                if ((io == @as(io_method, IO_METHOD_MMAP)) or (io == @as(io_method, IO_METHOD_USERPTR))) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                {}
            },
            7 => {
                @"type" = V4L2_BUF_TYPE_VIDEO_CAPTURE;
                _ = xioctl(fd, @bitCast(@as(c_uint, @truncate(@as(c_ulong, ((_IOC_WRITE << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'V') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 19) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(c_int) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS)))))))), @ptrCast(@alignCast(&@"type")));
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                if (device.*.hidden.*.buffers != null) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                switch (io) {
                    @as(io_method, IO_METHOD_INVALID) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(io_method, IO_METHOD_READ) => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(io_method, IO_METHOD_MMAP) => {
                        sdl_pc = 16;
                        continue;
                    },
                    @as(io_method, IO_METHOD_USERPTR) => {
                        sdl_pc = 24;
                        continue;
                    },
                    else => {
                        sdl_pc = 13;
                        continue;
                    },
                }
            },
            11 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                if (fd != -@as(c_int, 1)) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            13 => {
                SDL_free_REAL(@ptrCast(@alignCast(device.*.hidden.*.buffers)));
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            14 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            15 => {
                SDL_free_REAL(device.*.hidden.*.buffers[@as(c_int, 0)].start);
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            16 => {
                i = 0;
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            17 => {
                if (i < device.*.hidden.*.nb_buffers) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            18 => {
                if (munmap(device.*.hidden.*.buffers[@bitCast(@as(isize, @intCast(i)))].start, device.*.hidden.*.buffers[@bitCast(@as(isize, @intCast(i)))].length) == -@as(c_int, 1)) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            19 => {
                i += 1;
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            20 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            21 => {
                _ = SDL_SetError_REAL("munmap");
                {
                    sdl_pc = 23;
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
                    sdl_pc = 19;
                    continue;
                }
            },
            24 => {
                i_1 = 0;
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            25 => {
                if (i_1 < device.*.hidden.*.nb_buffers) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            26 => {
                SDL_free_REAL(device.*.hidden.*.buffers[@bitCast(@as(isize, @intCast(i_1)))].start);
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            27 => {
                i_1 += 1;
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            28 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            29 => {
                _ = close(fd);
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
                SDL_free_REAL(@ptrCast(@alignCast(device.*.hidden)));
                device.*.hidden = null;
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn V4L2_OpenDevice(device: [*c]SDL_Camera, spec: [*c]const SDL_CameraSpec) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [15:0]u8 = "V4L2_OpenDevice".*;
    };
    _ = &static_local___func__;
    var handle: [*c]const V4L2DeviceHandle = undefined;
    _ = &handle;
    var st: struct_stat = undefined;
    _ = &st;
    var cap: struct_v4l2_capability = undefined;
    _ = &cap;
    var fd: c_int = undefined;
    _ = &fd;
    var err: c_int = undefined;
    _ = &err;
    var cropcap: struct_v4l2_cropcap = undefined;
    _ = &cropcap;
    var crop: struct_v4l2_crop = undefined;
    _ = &crop;
    var fmt: struct_v4l2_format = undefined;
    _ = &fmt;
    var setfps: struct_v4l2_streamparm = undefined;
    _ = &setfps;
    var io: io_method = undefined;
    _ = &io;
    var req: struct_v4l2_requestbuffers = undefined;
    _ = &req;
    var size: usize = undefined;
    _ = &size;
    var pitch: usize = undefined;
    _ = &pitch;
    var rc: bool = undefined;
    _ = &rc;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "!\"Shouldn't have hit this\"",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data;
    var sdl_assert_state: SDL_AssertState = undefined;
    _ = &sdl_assert_state;
    var @"type": enum_v4l2_buf_type = undefined;
    _ = &@"type";
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                handle = @ptrCast(@alignCast(device.*.handle));
                fd = open(handle.*.path, O_RDWR | O_NONBLOCK, @as(c_int, 0));
                if (fd == -@as(c_int, 1)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return SDL_SetError_REAL("Cannot open '%s': %d, %s", handle.*.path, __errno_location().*, strerror(__errno_location().*));
            },
            2 => {
                if (fstat(fd, &st) == -@as(c_int, 1)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            3 => {
                device.*.hidden = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(struct_SDL_PrivateCameraData))));
                if (@as(?*anyopaque, @ptrCast(@alignCast(device.*.hidden))) == @as(?*anyopaque, null)) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            4 => {
                _ = close(fd);
                return SDL_SetError_REAL("Cannot identify '%s': %d, %s", handle.*.path, __errno_location().*, strerror(__errno_location().*));
            },
            5 => {
                if (!((st.st_mode & @as(__mode_t, __S_IFMT)) == @as(__mode_t, @bitCast(@as(c_int, __S_IFCHR))))) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            6 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            7 => {
                _ = close(fd);
                return SDL_SetError_REAL("%s is not a character device", handle.*.path);
            },
            8 => {
                if (xioctl(fd, @bitCast(@as(c_uint, @truncate(@as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'V') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 0) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(struct_v4l2_capability) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS)))))))), @ptrCast(@alignCast(&cap))) == -@as(c_int, 1)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            9 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            10 => {
                err = __errno_location().*;
                _ = close(fd);
                if (err == EINVAL) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            11 => {
                if ((cap.device_caps & @as(__u32, V4L2_CAP_VIDEO_CAPTURE)) == @as(__u32, 0)) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            13 => {
                return SDL_SetError_REAL("%s is unexpectedly not a V4L2 device", handle.*.path);
            },
            14 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                return SDL_SetError_REAL("Error VIDIOC_QUERYCAP errno=%d device%s is no V4L2 device", err, handle.*.path);
            },
            16 => {
                _ = close(fd);
                return SDL_SetError_REAL("%s is unexpectedly not a video capture device", handle.*.path);
            },
            17 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            18 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            19 => {
                _ = close(fd);
                return @"false" != 0;
            },
            20 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            21 => {
                device.*.hidden.*.fd = fd;
                device.*.hidden.*.io = IO_METHOD_INVALID;
                _ = memset(@ptrCast(@alignCast(&cropcap)), 0, @sizeOf(@TypeOf(cropcap)));
                cropcap.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
                if (xioctl(fd, @bitCast(@as(c_uint, @truncate(@as(c_ulong, (((_IOC_READ | _IOC_WRITE) << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'V') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 58) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(struct_v4l2_cropcap) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS)))))))), @ptrCast(@alignCast(&cropcap))) == @as(c_int, 0)) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            22 => {
                _ = memset(@ptrCast(@alignCast(&crop)), 0, @sizeOf(@TypeOf(crop)));
                crop.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
                crop.c = cropcap.defrect;
                _ = xioctl(fd, @bitCast(@as(c_uint, @truncate(@as(c_ulong, ((_IOC_WRITE << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'V') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 60) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(struct_v4l2_crop) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS)))))))), @ptrCast(@alignCast(&crop)));
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
                _ = memset(@ptrCast(@alignCast(&fmt)), 0, @sizeOf(@TypeOf(fmt)));
                fmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
                fmt.fmt.pix.width = @bitCast(@as(c_int, spec.*.width));
                fmt.fmt.pix.height = @bitCast(@as(c_int, spec.*.height));
                fmt.fmt.pix.pixelformat = format_sdl_to_v4l2(spec.*.format);
                fmt.fmt.pix.field = V4L2_FIELD_ANY;
                if (xioctl(fd, @bitCast(@as(c_uint, @truncate(@as(c_ulong, (((_IOC_READ | _IOC_WRITE) << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'V') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 5) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(struct_v4l2_format) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS)))))))), @ptrCast(@alignCast(&fmt))) == -@as(c_int, 1)) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            25 => {
                return SDL_SetError_REAL("Error VIDIOC_S_FMT");
            },
            26 => {
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            27 => {
                if ((spec.*.framerate_numerator != 0) and (spec.*.framerate_denominator != 0)) {
                    sdl_pc = 28;
                    continue;
                } else {
                    sdl_pc = 29;
                    continue;
                }
            },
            28 => {
                _ = memset(@ptrCast(@alignCast(&setfps)), 0, @sizeOf(@TypeOf(setfps)));
                setfps.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
                if (xioctl(fd, @bitCast(@as(c_uint, @truncate(@as(c_ulong, (((_IOC_READ | _IOC_WRITE) << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'V') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 21) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(struct_v4l2_streamparm) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS)))))))), @ptrCast(@alignCast(&setfps))) == @as(c_int, 0)) {
                    sdl_pc = 31;
                    continue;
                } else {
                    sdl_pc = 32;
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
                _ = memset(@ptrCast(@alignCast(&fmt)), 0, @sizeOf(@TypeOf(fmt)));
                fmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
                if (xioctl(fd, @bitCast(@as(c_uint, @truncate(@as(c_ulong, (((_IOC_READ | _IOC_WRITE) << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'V') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 4) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(struct_v4l2_format) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS)))))))), @ptrCast(@alignCast(&fmt))) == -@as(c_int, 1)) {
                    sdl_pc = 40;
                    continue;
                } else {
                    sdl_pc = 41;
                    continue;
                }
            },
            31 => {
                if ((setfps.parm.capture.timeperframe.denominator != @as(__u32, @bitCast(@as(c_int, spec.*.framerate_numerator)))) or (setfps.parm.capture.timeperframe.numerator != @as(__u32, @bitCast(@as(c_int, spec.*.framerate_denominator))))) {
                    sdl_pc = 34;
                    continue;
                } else {
                    sdl_pc = 35;
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
                    sdl_pc = 30;
                    continue;
                }
            },
            34 => {
                setfps.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
                setfps.parm.capture.timeperframe.numerator = @bitCast(@as(c_int, spec.*.framerate_denominator));
                setfps.parm.capture.timeperframe.denominator = @bitCast(@as(c_int, spec.*.framerate_numerator));
                if (xioctl(fd, @bitCast(@as(c_uint, @truncate(@as(c_ulong, (((_IOC_READ | _IOC_WRITE) << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'V') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 22) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(struct_v4l2_streamparm) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS)))))))), @ptrCast(@alignCast(&setfps))) == -@as(c_int, 1)) {
                    sdl_pc = 37;
                    continue;
                } else {
                    sdl_pc = 38;
                    continue;
                }
            },
            35 => {
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            36 => {
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            37 => {
                return SDL_SetError_REAL("Error VIDIOC_S_PARM");
            },
            38 => {
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            39 => {
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            40 => {
                return SDL_SetError_REAL("Error VIDIOC_G_FMT");
            },
            41 => {
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            42 => {
                device.*.hidden.*.driver_pitch = @bitCast(@as(c_uint, @truncate(fmt.fmt.pix.bytesperline)));
                io = IO_METHOD_INVALID;
                if ((@as(__u32, @bitCast(@as(c_int, @intFromBool(io == @as(io_method, IO_METHOD_INVALID))))) != 0) and ((cap.device_caps & @as(__u32, V4L2_CAP_STREAMING)) != 0)) {
                    sdl_pc = 43;
                    continue;
                } else {
                    sdl_pc = 44;
                    continue;
                }
            },
            43 => {
                _ = memset(@ptrCast(@alignCast(&req)), 0, @sizeOf(@TypeOf(req)));
                req.count = 8;
                req.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
                req.memory = V4L2_MEMORY_MMAP;
                if ((xioctl(fd, @bitCast(@as(c_uint, @truncate(@as(c_ulong, (((_IOC_READ | _IOC_WRITE) << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'V') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(struct_v4l2_requestbuffers) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS)))))))), @ptrCast(@alignCast(&req))) == @as(c_int, 0)) and (req.count >= @as(__u32, 2))) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 47;
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
                if ((@as(__u32, @bitCast(@as(c_int, @intFromBool(io == @as(io_method, IO_METHOD_INVALID))))) != 0) and ((cap.device_caps & @as(__u32, V4L2_CAP_READWRITE)) != 0)) {
                    sdl_pc = 52;
                    continue;
                } else {
                    sdl_pc = 53;
                    continue;
                }
            },
            46 => {
                io = IO_METHOD_MMAP;
                device.*.hidden.*.nb_buffers = @bitCast(@as(c_uint, @truncate(req.count)));
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            47 => {
                _ = memset(@ptrCast(@alignCast(&req)), 0, @sizeOf(@TypeOf(req)));
                req.count = 8;
                req.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
                req.memory = V4L2_MEMORY_USERPTR;
                if (xioctl(fd, @bitCast(@as(c_uint, @truncate(@as(c_ulong, (((_IOC_READ | _IOC_WRITE) << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'V') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(struct_v4l2_requestbuffers) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS)))))))), @ptrCast(@alignCast(&req))) == @as(c_int, 0)) {
                    sdl_pc = 49;
                    continue;
                } else {
                    sdl_pc = 50;
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
                io = IO_METHOD_USERPTR;
                device.*.hidden.*.nb_buffers = 8;
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
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            52 => {
                io = IO_METHOD_READ;
                device.*.hidden.*.nb_buffers = 1;
                {
                    sdl_pc = 54;
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
                if (io == @as(io_method, IO_METHOD_INVALID)) {
                    sdl_pc = 55;
                    continue;
                } else {
                    sdl_pc = 56;
                    continue;
                }
            },
            55 => {
                return SDL_SetError_REAL("Don't have a way to talk to this device");
            },
            56 => {
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            57 => {
                device.*.hidden.*.io = io;
                device.*.hidden.*.buffers = @ptrCast(@alignCast(SDL_calloc_REAL(@bitCast(@as(c_long, device.*.hidden.*.nb_buffers)), @sizeOf(@TypeOf(device.*.hidden.*.buffers.*)))));
                if (!(device.*.hidden.*.buffers != null)) {
                    sdl_pc = 58;
                    continue;
                } else {
                    sdl_pc = 59;
                    continue;
                }
            },
            58 => {
                return @"false" != 0;
            },
            59 => {
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            60 => {
                if (!SDL_CalculateSurfaceSize(device.*.spec.format, device.*.spec.width, device.*.spec.height, &size, &pitch, @"false" != 0)) {
                    sdl_pc = 61;
                    continue;
                } else {
                    sdl_pc = 62;
                    continue;
                }
            },
            61 => {
                return @"false" != 0;
            },
            62 => {
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            63 => {
                rc = @"true" != 0;
                switch (io) {
                    @as(io_method, IO_METHOD_READ) => {
                        sdl_pc = 65;
                        continue;
                    },
                    @as(io_method, IO_METHOD_MMAP) => {
                        sdl_pc = 66;
                        continue;
                    },
                    @as(io_method, IO_METHOD_USERPTR) => {
                        sdl_pc = 67;
                        continue;
                    },
                    @as(io_method, IO_METHOD_INVALID) => {
                        sdl_pc = 68;
                        continue;
                    },
                    else => {
                        sdl_pc = 64;
                        continue;
                    },
                }
            },
            64 => {
                if (!rc) {
                    sdl_pc = 81;
                    continue;
                } else {
                    sdl_pc = 82;
                    continue;
                }
            },
            65 => {
                rc = AllocBufferRead(device, size);
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            66 => {
                rc = AllocBufferMmap(device);
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            67 => {
                rc = AllocBufferUserPtr(device, size);
                {
                    sdl_pc = 64;
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
                    sdl_pc = 72;
                    continue;
                }
            },
            70 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 69;
                    continue;
                } else {
                    sdl_pc = 71;
                    continue;
                }
            },
            71 => {
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            72 => {
                if (!!(@intFromPtr("Shouldn't have hit this") != 0)) {
                    sdl_pc = 73;
                    continue;
                } else {
                    sdl_pc = 74;
                    continue;
                }
            },
            73 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_camera_v4l2.c", 654);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 75;
                    continue;
                } else {
                    sdl_pc = 76;
                    continue;
                }
            },
            74 => {
                {
                    sdl_pc = 70;
                    continue;
                }
            },
            75 => {
                {
                    sdl_pc = 72;
                    continue;
                }
            },
            76 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 78;
                    continue;
                } else {
                    sdl_pc = 79;
                    continue;
                }
            },
            77 => {
                {
                    sdl_pc = 74;
                    continue;
                }
            },
            78 => {
                __builtin.debugtrap();
                {
                    sdl_pc = 80;
                    continue;
                }
            },
            79 => {
                {
                    sdl_pc = 80;
                    continue;
                }
            },
            80 => {
                {
                    sdl_pc = 77;
                    continue;
                }
            },
            81 => {
                return @"false" != 0;
            },
            82 => {
                if (!EnqueueBuffers(device)) {
                    sdl_pc = 84;
                    continue;
                } else {
                    sdl_pc = 85;
                    continue;
                }
            },
            83 => {
                SDL_CameraPermissionOutcome(device, @"true" != 0);
                return @"true" != 0;
            },
            84 => {
                return @"false" != 0;
            },
            85 => {
                if (io != @as(io_method, IO_METHOD_READ)) {
                    sdl_pc = 87;
                    continue;
                } else {
                    sdl_pc = 88;
                    continue;
                }
            },
            86 => {
                {
                    sdl_pc = 83;
                    continue;
                }
            },
            87 => {
                @"type" = V4L2_BUF_TYPE_VIDEO_CAPTURE;
                if (xioctl(fd, @bitCast(@as(c_uint, @truncate(@as(c_ulong, ((_IOC_WRITE << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'V') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 18) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(c_int) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS)))))))), @ptrCast(@alignCast(&@"type"))) == -@as(c_int, 1)) {
                    sdl_pc = 90;
                    continue;
                } else {
                    sdl_pc = 91;
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
                    sdl_pc = 86;
                    continue;
                }
            },
            90 => {
                return SDL_SetError_REAL("VIDIOC_STREAMON");
            },
            91 => {
                {
                    sdl_pc = 92;
                    continue;
                }
            },
            92 => {
                {
                    sdl_pc = 89;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn FindV4L2CameraByBusInfoCallback(userdata: ?*anyopaque, device: [*c]SDL_Camera) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var handle: [*c]const V4L2DeviceHandle = @ptrCast(@alignCast(device.*.handle));
    _ = &handle;
    return SDL_strcmp_REAL(handle.*.bus_info, @ptrCast(@alignCast(userdata))) == @as(c_int, 0);
}
pub fn AddCameraFormat(fd: c_int, data: [*c]CameraFormatAddData, sdlfmt: SDL_PixelFormat, colorspace: SDL_Colorspace, v4l2fmt: Uint32, w: c_int, h: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    _ = &fd;
    var frmivalenum: struct_v4l2_frmivalenum = undefined;
    _ = &frmivalenum;
    _ = memset(@ptrCast(@alignCast(&frmivalenum)), 0, @sizeOf(@TypeOf(frmivalenum)));
    frmivalenum.pixel_format = v4l2fmt;
    frmivalenum.width = @bitCast(@as(c_int, w));
    frmivalenum.height = @bitCast(@as(c_int, h));
    while (ioctl(fd, @as(c_ulong, (((_IOC_READ | _IOC_WRITE) << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'V') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 75) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(struct_v4l2_frmivalenum) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), &frmivalenum) == @as(c_int, 0)) {
        if (frmivalenum.type == @as(__u32, V4L2_FRMIVAL_TYPE_DISCRETE)) {
            const numerator: c_int = @bitCast(@as(c_uint, @truncate(frmivalenum.unnamed_0.discrete.numerator)));
            _ = &numerator;
            const denominator: c_int = @bitCast(@as(c_uint, @truncate(frmivalenum.unnamed_0.discrete.denominator)));
            _ = &denominator;
            if (!SDL_AddCameraFormat(data, sdlfmt, colorspace, w, h, denominator, numerator)) {
                return @"false" != 0;
            }
            frmivalenum.index +%= 1;
        } else if (frmivalenum.type == @as(__u32, V4L2_FRMIVAL_TYPE_STEPWISE)) {
            var d: c_int = @bitCast(@as(c_uint, @truncate(frmivalenum.unnamed_0.stepwise.min.denominator)));
            _ = &d;
            {
                var n: c_int = @bitCast(@as(c_uint, @truncate(frmivalenum.unnamed_0.stepwise.min.numerator)));
                _ = &n;
                while (n <= @as(c_int, @bitCast(@as(c_uint, @truncate(frmivalenum.unnamed_0.stepwise.max.numerator))))) : (n += @bitCast(@as(c_uint, @truncate(frmivalenum.unnamed_0.stepwise.step.numerator)))) {
                    if (!SDL_AddCameraFormat(data, sdlfmt, colorspace, w, h, d, n)) {
                        return @"false" != 0;
                    }
                    d += @bitCast(@as(c_uint, @truncate(frmivalenum.unnamed_0.stepwise.step.denominator)));
                }
            }
            break;
        } else if (frmivalenum.type == @as(__u32, V4L2_FRMIVAL_TYPE_CONTINUOUS)) {
            const min_numer: c_int = @bitCast(@as(c_uint, @truncate(frmivalenum.unnamed_0.stepwise.min.numerator)));
            _ = &min_numer;
            const min_denom: c_int = @bitCast(@as(c_uint, @truncate(frmivalenum.unnamed_0.stepwise.min.denominator)));
            _ = &min_denom;
            const max_numer: c_int = @bitCast(@as(c_uint, @truncate(frmivalenum.unnamed_0.stepwise.max.numerator)));
            _ = &max_numer;
            const max_denom: c_int = @bitCast(@as(c_uint, @truncate(frmivalenum.unnamed_0.stepwise.max.denominator)));
            _ = &max_denom;
            const minrate: f32 = @as(f32, @floatFromInt(min_numer)) / @as(f32, @floatFromInt(min_denom));
            _ = &minrate;
            const maxrate: f32 = @as(f32, @floatFromInt(max_numer)) / @as(f32, @floatFromInt(max_denom));
            _ = &maxrate;
            if ((@as(f64, @floatCast(minrate)) <= (@as(f64, 1.001) / @as(f64, @floatFromInt(@as(c_int, 24))))) and (@as(f64, @floatCast(maxrate)) >= (@as(f64, 1.001) / @as(f64, @floatFromInt(@as(c_int, 24)))))) {
                if (!SDL_AddCameraFormat(data, sdlfmt, colorspace, w, h, 24000, 1001)) {
                    return @"false" != 0;
                }
            }
            if ((@as(f64, @floatCast(minrate)) <= (@as(f64, 1.0) / @as(f64, @floatFromInt(@as(c_int, 24))))) and (@as(f64, @floatCast(maxrate)) >= (@as(f64, 1.0) / @as(f64, @floatFromInt(@as(c_int, 24)))))) {
                if (!SDL_AddCameraFormat(data, sdlfmt, colorspace, w, h, 24000, 1000)) {
                    return @"false" != 0;
                }
            }
            if ((@as(f64, @floatCast(minrate)) <= (@as(f64, 1.001) / @as(f64, @floatFromInt(@as(c_int, 30))))) and (@as(f64, @floatCast(maxrate)) >= (@as(f64, 1.001) / @as(f64, @floatFromInt(@as(c_int, 30)))))) {
                if (!SDL_AddCameraFormat(data, sdlfmt, colorspace, w, h, 30000, 1001)) {
                    return @"false" != 0;
                }
            }
            if ((@as(f64, @floatCast(minrate)) <= (@as(f64, 1.0) / @as(f64, @floatFromInt(@as(c_int, 30))))) and (@as(f64, @floatCast(maxrate)) >= (@as(f64, 1.0) / @as(f64, @floatFromInt(@as(c_int, 30)))))) {
                if (!SDL_AddCameraFormat(data, sdlfmt, colorspace, w, h, 30000, 1000)) {
                    return @"false" != 0;
                }
            }
            if ((@as(f64, @floatCast(minrate)) <= (@as(f64, 1.0) / @as(f64, @floatFromInt(@as(c_int, 50))))) and (@as(f64, @floatCast(maxrate)) >= (@as(f64, 1.0) / @as(f64, @floatFromInt(@as(c_int, 50)))))) {
                if (!SDL_AddCameraFormat(data, sdlfmt, colorspace, w, h, 50000, 1000)) {
                    return @"false" != 0;
                }
            }
            if ((@as(f64, @floatCast(minrate)) <= (@as(f64, 1.001) / @as(f64, @floatFromInt(@as(c_int, 60))))) and (@as(f64, @floatCast(maxrate)) >= (@as(f64, 1.001) / @as(f64, @floatFromInt(@as(c_int, 60)))))) {
                if (!SDL_AddCameraFormat(data, sdlfmt, colorspace, w, h, 60000, 1001)) {
                    return @"false" != 0;
                }
            }
            if ((@as(f64, @floatCast(minrate)) <= (@as(f64, 1.0) / @as(f64, @floatFromInt(@as(c_int, 60))))) and (@as(f64, @floatCast(maxrate)) >= (@as(f64, 1.0) / @as(f64, @floatFromInt(@as(c_int, 60)))))) {
                if (!SDL_AddCameraFormat(data, sdlfmt, colorspace, w, h, 60000, 1000)) {
                    return @"false" != 0;
                }
            }
            break;
        }
    }
    return @"true" != 0;
}
pub fn MaybeAddDevice(path: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (!(path != null)) {
        return;
    }
    var st: struct_stat = undefined;
    _ = &st;
    const fd: c_int = open(path, O_RDWR | O_NONBLOCK, @as(c_int, 0));
    _ = &fd;
    if (fd == -@as(c_int, 1)) {
        return;
    } else if (fstat(fd, &st) == -@as(c_int, 1)) {
        _ = close(fd);
        return;
    } else if (!((st.st_mode & @as(__mode_t, __S_IFMT)) == @as(__mode_t, @bitCast(@as(c_int, __S_IFCHR))))) {
        _ = close(fd);
        return;
    }
    var vcap: struct_v4l2_capability = undefined;
    _ = &vcap;
    const rc: c_int = ioctl(fd, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'V') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 0) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(struct_v4l2_capability) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), &vcap);
    _ = &rc;
    if (rc != @as(c_int, 0)) {
        _ = close(fd);
        return;
    } else if ((vcap.device_caps & @as(__u32, V4L2_CAP_VIDEO_CAPTURE)) == @as(__u32, 0)) {
        _ = close(fd);
        return;
    } else if (SDL_FindPhysicalCameraByCallback(FindV4L2CameraByBusInfoCallback, @ptrCast(@alignCast(@as([*c]__u8, @ptrCast(@alignCast(&vcap.bus_info)))))) != null) {
        _ = close(fd);
        return;
    }
    var add_data: CameraFormatAddData = undefined;
    _ = &add_data;
    _ = memset(@ptrCast(@alignCast(&add_data)), 0, @sizeOf(@TypeOf(add_data)));
    var fmtdesc: struct_v4l2_fmtdesc = undefined;
    _ = &fmtdesc;
    _ = memset(@ptrCast(@alignCast(&fmtdesc)), 0, @sizeOf(@TypeOf(fmtdesc)));
    fmtdesc.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
    while (ioctl(fd, @as(c_ulong, (((_IOC_READ | _IOC_WRITE) << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'V') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 2) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(struct_v4l2_fmtdesc) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), &fmtdesc) == @as(c_int, 0)) {
        var sdlfmt: SDL_PixelFormat = SDL_PIXELFORMAT_UNKNOWN;
        _ = &sdlfmt;
        var colorspace: SDL_Colorspace = SDL_COLORSPACE_UNKNOWN;
        _ = &colorspace;
        format_v4l2_to_sdl(fmtdesc.pixelformat, &sdlfmt, &colorspace);
        fmtdesc.index +%= 1;
        if (sdlfmt == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UNKNOWN)) {
            continue;
        }
        var frmsizeenum: struct_v4l2_frmsizeenum = undefined;
        _ = &frmsizeenum;
        _ = memset(@ptrCast(@alignCast(&frmsizeenum)), 0, @sizeOf(@TypeOf(frmsizeenum)));
        frmsizeenum.pixel_format = fmtdesc.pixelformat;
        while (ioctl(fd, @as(c_ulong, (((_IOC_READ | _IOC_WRITE) << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'V') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 74) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(struct_v4l2_frmsizeenum) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), &frmsizeenum) == @as(c_int, 0)) {
            if (frmsizeenum.type == @as(__u32, V4L2_FRMSIZE_TYPE_DISCRETE)) {
                const w: c_int = @bitCast(@as(c_uint, @truncate(frmsizeenum.unnamed_0.discrete.width)));
                _ = &w;
                const h: c_int = @bitCast(@as(c_uint, @truncate(frmsizeenum.unnamed_0.discrete.height)));
                _ = &h;
                if (!AddCameraFormat(fd, &add_data, sdlfmt, colorspace, fmtdesc.pixelformat, w, h)) {
                    break;
                }
                frmsizeenum.index +%= 1;
            } else if ((frmsizeenum.type == @as(__u32, V4L2_FRMSIZE_TYPE_STEPWISE)) or (frmsizeenum.type == @as(__u32, V4L2_FRMSIZE_TYPE_CONTINUOUS))) {
                const minw: c_int = @bitCast(@as(c_uint, @truncate(frmsizeenum.unnamed_0.stepwise.min_width)));
                _ = &minw;
                const minh: c_int = @bitCast(@as(c_uint, @truncate(frmsizeenum.unnamed_0.stepwise.min_height)));
                _ = &minh;
                const maxw: c_int = @bitCast(@as(c_uint, @truncate(frmsizeenum.unnamed_0.stepwise.max_width)));
                _ = &maxw;
                const maxh: c_int = @bitCast(@as(c_uint, @truncate(frmsizeenum.unnamed_0.stepwise.max_height)));
                _ = &maxh;
                const stepw: c_int = @bitCast(@as(c_uint, @truncate(frmsizeenum.unnamed_0.stepwise.step_width)));
                _ = &stepw;
                const steph: c_int = @bitCast(@as(c_uint, @truncate(frmsizeenum.unnamed_0.stepwise.step_height)));
                _ = &steph;
                {
                    var w: c_int = minw;
                    _ = &w;
                    while (w <= maxw) : (w += stepw) {
                        {
                            var h: c_int = minh;
                            _ = &h;
                            while (h <= maxh) : (h += steph) {
                                if (!AddCameraFormat(fd, &add_data, sdlfmt, colorspace, fmtdesc.pixelformat, w, h)) {
                                    break;
                                }
                            }
                        }
                    }
                }
                break;
            }
        }
    }
    _ = close(fd);
    if (add_data.num_specs > @as(c_int, 0)) {
        var handle: [*c]V4L2DeviceHandle = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(V4L2DeviceHandle))));
        _ = &handle;
        if (handle != null) {
            handle.*.path = SDL_strdup_REAL(path);
            if (handle.*.path != null) {
                handle.*.bus_info = SDL_strdup_REAL(@ptrCast(@alignCast(@as([*c]__u8, @ptrCast(@alignCast(&vcap.bus_info))))));
                if (handle.*.bus_info != null) {
                    if (SDL_AddCamera(@ptrCast(@alignCast(@as([*c]__u8, @ptrCast(@alignCast(&vcap.card))))), SDL_CAMERA_POSITION_UNKNOWN, add_data.num_specs, add_data.specs, @ptrCast(@alignCast(handle))) != null) {
                        SDL_free_REAL(@ptrCast(@alignCast(add_data.specs)));
                        return;
                    }
                    SDL_free_REAL(@ptrCast(@alignCast(handle.*.bus_info)));
                }
                SDL_free_REAL(@ptrCast(@alignCast(handle.*.path)));
            }
            SDL_free_REAL(@ptrCast(@alignCast(handle)));
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(add_data.specs)));
}
pub fn V4L2_FreeDeviceHandle(device: [*c]SDL_Camera) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (device != null) {
        var handle: [*c]V4L2DeviceHandle = @ptrCast(@alignCast(device.*.handle));
        _ = &handle;
        SDL_free_REAL(@ptrCast(@alignCast(handle.*.path)));
        SDL_free_REAL(@ptrCast(@alignCast(handle.*.bus_info)));
        SDL_free_REAL(@ptrCast(@alignCast(handle)));
    }
}
pub fn FindV4L2CameraByPathCallback(userdata: ?*anyopaque, device: [*c]SDL_Camera) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var handle: [*c]const V4L2DeviceHandle = @ptrCast(@alignCast(device.*.handle));
    _ = &handle;
    return SDL_strcmp_REAL(handle.*.path, @ptrCast(@alignCast(userdata))) == @as(c_int, 0);
}
pub fn MaybeRemoveDevice(path: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (path != null) {
        SDL_CameraDisconnected(SDL_FindPhysicalCameraByCallback(FindV4L2CameraByPathCallback, @ptrCast(@alignCast(@constCast(path)))));
    }
}
pub fn CameraUdevCallback(udev_type: SDL_UDEV_deviceevent, udev_class: c_int, devpath: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if ((devpath != null) and ((udev_class & SDL_UDEV_DEVICE_VIDEO_CAPTURE) != 0)) {
        if (udev_type == @as(SDL_UDEV_deviceevent, SDL_UDEV_DEVICEADDED)) {
            MaybeAddDevice(devpath);
        } else if (udev_type == @as(SDL_UDEV_deviceevent, SDL_UDEV_DEVICEREMOVED)) {
            MaybeRemoveDevice(devpath);
        }
    }
}
pub fn V4L2_Deinitialize() callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_UDEV_DelCallback(CameraUdevCallback);
    SDL_UDEV_Quit();
}
pub fn V4L2_DetectDevices() callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (SDL_UDEV_Init()) {
        if (SDL_UDEV_AddCallback(CameraUdevCallback)) {
            _ = SDL_UDEV_Scan();
        }
        return;
    }
    var dirp: ?*DIR = opendir("/dev");
    _ = &dirp;
    if (dirp != null) {
        var dent: [*c]struct_dirent = undefined;
        _ = &dent;
        while (@as(?*anyopaque, @ptrCast(@alignCast(blk: {
            const tmp = readdir(dirp);
            dent = tmp;
            break :blk tmp;
        }))) != @as(?*anyopaque, null)) {
            var num: c_int = 0;
            _ = &num;
            if (SDL_sscanf_REAL(@ptrCast(@alignCast(&dent.*.d_name)), "video%d", &num) == @as(c_int, 1)) {
                var fullpath: [64]u8 = undefined;
                _ = &fullpath;
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&fullpath)), @sizeOf(@TypeOf(fullpath)), "/dev/video%d", num);
                MaybeAddDevice(@ptrCast(@alignCast(&fullpath)));
            }
        }
        _ = closedir(dirp);
    }
}
pub fn V4L2_Init(impl: [*c]SDL_CameraDriverImpl) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    impl.*.DetectDevices = V4L2_DetectDevices;
    impl.*.OpenDevice = V4L2_OpenDevice;
    impl.*.CloseDevice = V4L2_CloseDevice;
    impl.*.WaitDevice = V4L2_WaitDevice;
    impl.*.AcquireFrame = V4L2_AcquireFrame;
    impl.*.ReleaseFrame = V4L2_ReleaseFrame;
    impl.*.FreeDeviceHandle = V4L2_FreeDeviceHandle;
    impl.*.Deinitialize = V4L2_Deinitialize;
    return @"true" != 0;
}
pub export var V4L2_bootstrap: CameraBootStrap = CameraBootStrap{
    .name = "v4l2",
    .desc = "SDL Video4Linux2 camera driver",
    .init = V4L2_Init,
    .demand_only = @"false" != 0,
};

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_NS_PER_SECOND = @as(c_longlong, 1000000000);
pub const SDL_NS_PER_US = @as(c_int, 1000);
pub const EINTR = @as(c_int, 4);
pub const EIO = @as(c_int, 5);
pub const EAGAIN = @as(c_int, 11);
pub const EINVAL = @as(c_int, 22);
pub const O_RDWR = @as(c_int, 0o2);
pub const O_NONBLOCK = @as(c_int, 0o4000);
pub const __S_IFMT = __helpers.promoteIntLiteral(c_int, 0o170000, .octal);
pub const __S_IFCHR = @as(c_int, 0o020000);
pub const _IOC_NRBITS = @as(c_int, 8);
pub const _IOC_TYPEBITS = @as(c_int, 8);
pub const _IOC_SIZEBITS = @as(c_int, 14);
pub const _IOC_NRSHIFT = @as(c_int, 0);
pub const _IOC_WRITE = @as(c_uint, 1);
pub const _IOC_READ = @as(c_uint, 2);
pub const PROT_READ = @as(c_int, 0x1);
pub const PROT_WRITE = @as(c_int, 0x2);
pub const MAP_SHARED = @as(c_int, 0x01);
pub const V4L2_CAP_VIDEO_CAPTURE = @as(c_int, 0x00000001);
pub const V4L2_CAP_READWRITE = __helpers.promoteIntLiteral(c_int, 0x01000000, .hex);
pub const V4L2_CAP_STREAMING = __helpers.promoteIntLiteral(c_int, 0x04000000, .hex);
