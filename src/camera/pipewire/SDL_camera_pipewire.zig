const __helpers = @import("std").zig.c_translation.helpers;
// /*
//   Simple DirectMedia Layer
//   Copyright (C) 1997-2026 Sam Lantinga <slouken@libsdl.org>
//   Copyright (C) 2024 Wim Taymans <wtaymans@redhat.com>
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
pub const __off_t = c_long;
pub const __time_t = c_long;
pub const time_t = __time_t;
pub const ptrdiff_t = c_long;
pub const struct___va_list_tag_2 = extern struct {
    unnamed_0: c_uint = 0,
    unnamed_1: c_uint = 0,
    unnamed_2: ?*anyopaque = null,
    unnamed_3: ?*anyopaque = null,
};
pub const __builtin_va_list = [1]struct___va_list_tag_2;
pub const va_list = __builtin_va_list;
pub extern fn malloc(__size: usize) ?*anyopaque;
pub extern fn realloc(__ptr: ?*anyopaque, __size: usize) ?*anyopaque;
pub extern fn free(__ptr: ?*anyopaque) void;
pub extern fn system(__command: [*c]const u8) c_int;
pub const __compar_fn_t = ?*const fn (?*const anyopaque, ?*const anyopaque) callconv(.c) c_int;
pub extern fn bsearch(__key: ?*const anyopaque, __base: ?*const anyopaque, __nmemb: usize, __size: usize, __compar: __compar_fn_t) ?*anyopaque;
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memmove(__dest: ?*anyopaque, __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub extern fn strcmp(__s1: [*c]const u8, __s2: [*c]const u8) c_int;
pub extern fn strdup(__s: [*c]const u8) [*c]u8;
pub extern fn strlen(__s: [*c]const u8) usize;
pub extern fn index(__s: [*c]const u8, __c: c_int) [*c]u8;
pub const Uint8 = u8;
pub const Uint32 = u32;
pub const Uint64 = u64;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_sscanf_REAL(text: [*c]const u8, fmt: [*c]const u8, ...) c_int;
pub const SDL_FunctionPointer = ?*const fn () callconv(.c) void;
pub const struct_SDL_AtomicInt = extern struct {
    value: c_int = 0,
};
pub const SDL_AtomicInt = struct_SDL_AtomicInt;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_PropertiesID = Uint32;
pub const struct_SDL_Thread = opaque {
};
pub const SDL_Thread = struct_SDL_Thread;
pub const struct_SDL_Mutex = opaque {
};
pub const SDL_Mutex = struct_SDL_Mutex;
pub const SDL_PIXELFORMAT_UNKNOWN: c_int = 0;
pub const SDL_PIXELFORMAT_RGB24: c_int = 386930691;
pub const SDL_PIXELFORMAT_BGR24: c_int = 390076419;
pub const SDL_PIXELFORMAT_YV12: c_int = 842094169;
pub const SDL_PIXELFORMAT_IYUV: c_int = 1448433993;
pub const SDL_PIXELFORMAT_YUY2: c_int = 844715353;
pub const SDL_PIXELFORMAT_UYVY: c_int = 1498831189;
pub const SDL_PIXELFORMAT_YVYU: c_int = 1431918169;
pub const SDL_PIXELFORMAT_NV12: c_int = 842094158;
pub const SDL_PIXELFORMAT_NV21: c_int = 825382478;
pub const SDL_PIXELFORMAT_MJPG: c_int = 1196444237;
pub const SDL_PIXELFORMAT_RGBA32: c_int = 376840196;
pub const SDL_PIXELFORMAT_ARGB32: c_int = 377888772;
pub const SDL_PIXELFORMAT_BGRA32: c_int = 372645892;
pub const SDL_PIXELFORMAT_ABGR32: c_int = 373694468;
pub const SDL_PIXELFORMAT_RGBX32: c_int = 374740996;
pub const SDL_PIXELFORMAT_XRGB32: c_int = 375789572;
pub const SDL_PIXELFORMAT_BGRX32: c_int = 370546692;
pub const SDL_PIXELFORMAT_XBGR32: c_int = 371595268;
pub const enum_SDL_PixelFormat = c_uint;
pub const SDL_PixelFormat = enum_SDL_PixelFormat;
pub const SDL_COLORSPACE_UNKNOWN: c_int = 0;
pub const SDL_COLORSPACE_SRGB: c_int = 301991328;
pub const SDL_COLORSPACE_JPEG: c_int = 570426566;
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
pub const struct_pw_stream = opaque {
};
pub const struct_spa_list = extern struct {
    next: [*c]struct_spa_list = null,
    prev: [*c]struct_spa_list = null,
};
pub const struct_spa_callbacks = extern struct {
    funcs: ?*const anyopaque = null,
    data: ?*anyopaque = null,
};
pub const struct_spa_hook = extern struct {
    link: struct_spa_list = @import("std").mem.zeroes(struct_spa_list),
    cb: struct_spa_callbacks = @import("std").mem.zeroes(struct_spa_callbacks),
    removed: ?*const fn (hook: [*c]struct_spa_hook) callconv(.c) void = null,
    priv: ?*anyopaque = null,
};
pub const struct_pw_array = extern struct {
    data: ?*anyopaque = null,
    size: usize = 0,
    alloc: usize = 0,
    extend: usize = 0,
};
pub const struct_SDL_PrivateCameraData = extern struct {
    stream: ?*struct_pw_stream = null,
    stream_listener: struct_spa_hook = @import("std").mem.zeroes(struct_spa_hook),
    buffers: struct_pw_array = @import("std").mem.zeroes(struct_pw_array),
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
    thread: ?*SDL_Thread = null,
    props: SDL_PropertiesID = 0,
    permission: SDL_CameraPermissionState = @import("std").mem.zeroes(SDL_CameraPermissionState),
    hidden: [*c]struct_SDL_PrivateCameraData = null,
};
pub const struct_SDL_SharedObject = opaque {
};
pub const SDL_SharedObject = struct_SDL_SharedObject;
pub extern fn SDL_LoadObject_REAL(sofile: [*c]const u8) ?*SDL_SharedObject;
pub extern fn SDL_LoadFunction_REAL(handle: ?*SDL_SharedObject, name: [*c]const u8) SDL_FunctionPointer;
pub extern fn SDL_UnloadObject_REAL(handle: ?*SDL_SharedObject) void;
pub extern fn SDL_Log_REAL(fmt: [*c]const u8, ...) void;
pub extern fn SDL_GetTicksNS_REAL() Uint64;
pub const struct_SDL_HashTable = opaque {
};
pub const SDL_HashTable = struct_SDL_HashTable;
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
pub extern fn SDL_AddCamera(name: [*c]const u8, position: SDL_CameraPosition, num_specs: c_int, specs: [*c]const SDL_CameraSpec, handle: ?*anyopaque) [*c]SDL_Camera;
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
pub extern fn SDL_DBus_CameraPortalRequestAccess() c_int;
pub extern fn link(__from: [*c]const u8, __to: [*c]const u8) c_int;
pub extern fn sync() void;
pub extern fn truncate(__file: [*c]const u8, __length: __off_t) c_int;
pub const SPA_DIRECTION_INPUT: c_int = 0;
pub const enum_spa_direction = c_uint;
pub const struct_spa_rectangle = extern struct {
    width: u32 = 0,
    height: u32 = 0,
};
pub const struct_spa_fraction = extern struct {
    num: u32 = 0,
    denom: u32 = 0,
};
pub fn spa_ptrinside(p1: ?*const anyopaque, s1: usize, p2: ?*const anyopaque, arg_s2: usize, remaining: [*c]usize) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var s2 = arg_s2;
    _ = &s2;
    if (__builtin.expect(@as(c_long, @intFromBool(!!(((@as(usize, @intCast(@intFromPtr(p1))) <= @as(usize, @intCast(@intFromPtr(p2)))) and (s2 <= s1)) and ((@as(usize, @intCast(@intFromPtr(p2))) -% @as(usize, @intCast(@intFromPtr(p1)))) <= (s1 -% s2))))), @as(c_long, 1)) != 0) {
        if (@as(?*anyopaque, @ptrCast(@alignCast(remaining))) != @as(?*anyopaque, null)) {
            remaining.* = (@as(usize, @intCast(@intFromPtr(p1))) +% s1) -% (@as(usize, @intCast(@intFromPtr(p2))) +% s2);
        }
        return @"true" != 0;
    } else {
        if (@as(?*anyopaque, @ptrCast(@alignCast(remaining))) != @as(?*anyopaque, null)) {
            remaining.* = 0;
        }
        return @"false" != 0;
    }
}
pub fn spa_ptr_inside_and_aligned(p1: ?*const anyopaque, s1: usize, p2: ?*const anyopaque, s2: usize, arg_align: usize, remaining: [*c]usize) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var @"align" = arg_align;
    _ = &@"align";
    if ((@as(usize, @intCast(@intFromPtr(p2))) & (@"align" -% @as(usize, 1))) == @as(usize, 0)) {
        return spa_ptrinside(p1, s1, p2, s2, remaining);
    } else {
        if (@as(?*anyopaque, @ptrCast(@alignCast(remaining))) != @as(?*anyopaque, null)) {
            remaining.* = 0;
        }
        return @"false" != 0;
    }
}
pub extern fn __errno_location() [*c]c_int;
pub fn spa_streq(s1: [*c]const u8, s2: [*c]const u8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return (if (__builtin.expect(@as(c_long, @intFromBool(!!((s1 != null) and (s2 != null)))), @as(c_long, 1)) != 0) @intFromBool(strcmp(s1, s2) == @as(c_int, 0)) else @intFromBool(s1 == s2)) != 0;
}
pub const SPA_TYPE_None: c_int = 1;
pub const SPA_TYPE_Bool: c_int = 2;
pub const SPA_TYPE_Id: c_int = 3;
pub const SPA_TYPE_Int: c_int = 4;
pub const SPA_TYPE_Long: c_int = 5;
pub const SPA_TYPE_Float: c_int = 6;
pub const SPA_TYPE_Double: c_int = 7;
pub const SPA_TYPE_String: c_int = 8;
pub const SPA_TYPE_Bytes: c_int = 9;
pub const SPA_TYPE_Rectangle: c_int = 10;
pub const SPA_TYPE_Fraction: c_int = 11;
pub const SPA_TYPE_Bitmap: c_int = 12;
pub const SPA_TYPE_Array: c_int = 13;
pub const SPA_TYPE_Struct: c_int = 14;
pub const SPA_TYPE_Object: c_int = 15;
pub const SPA_TYPE_Sequence: c_int = 16;
pub const SPA_TYPE_Pointer: c_int = 17;
pub const SPA_TYPE_Fd: c_int = 18;
pub const SPA_TYPE_Choice: c_int = 19;
pub const SPA_TYPE_Pod: c_int = 20;
pub const SPA_TYPE_OBJECT_Format: c_int = 262147;
pub fn spa_list_init(list: [*c]struct_spa_list) callconv(.c) void {
    @setEvalBranchQuota(100000);
    list.* = @as(struct_spa_list, struct_spa_list{
        .next = list,
        .prev = list,
    });
}
pub fn spa_list_is_initialized(list: [*c]struct_spa_list) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return @intFromBool(!!(list.*.prev != null));
}
pub fn spa_list_insert(list: [*c]struct_spa_list, elem: [*c]struct_spa_list) callconv(.c) void {
    @setEvalBranchQuota(100000);
    elem.*.prev = list;
    elem.*.next = list.*.next;
    list.*.next = elem;
    elem.*.next.*.prev = elem;
}
pub fn spa_list_remove(elem: [*c]struct_spa_list) callconv(.c) void {
    @setEvalBranchQuota(100000);
    elem.*.prev.*.next = elem.*.next;
    elem.*.next.*.prev = elem.*.prev;
}
pub const struct_spa_interface = extern struct {
    type: [*c]const u8 = null,
    version: u32 = 0,
    cb: struct_spa_callbacks = @import("std").mem.zeroes(struct_spa_callbacks),
};
pub fn spa_hook_remove(hook: [*c]struct_spa_hook) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (spa_list_is_initialized(&hook.*.link) != 0) {
        spa_list_remove(&hook.*.link);
    }
    if (hook.*.removed != null) {
        hook.*.removed.?(hook);
    }
}
pub const struct_spa_pod = extern struct {
    size: u32 = 0,
    type: u32 = 0,
};
pub const struct_spa_pod_bool = extern struct {
    pod: struct_spa_pod = @import("std").mem.zeroes(struct_spa_pod),
    value: i32 = 0,
    _padding: i32 = 0,
};
pub const struct_spa_pod_id = extern struct {
    pod: struct_spa_pod = @import("std").mem.zeroes(struct_spa_pod),
    value: u32 = 0,
    _padding: i32 = 0,
};
pub const struct_spa_pod_int = extern struct {
    pod: struct_spa_pod = @import("std").mem.zeroes(struct_spa_pod),
    value: i32 = 0,
    _padding: i32 = 0,
};
pub const struct_spa_pod_long = extern struct {
    pod: struct_spa_pod = @import("std").mem.zeroes(struct_spa_pod),
    value: i64 = 0,
};
pub const struct_spa_pod_float = extern struct {
    pod: struct_spa_pod = @import("std").mem.zeroes(struct_spa_pod),
    value: f32 = 0,
    _padding: i32 = 0,
};
pub const struct_spa_pod_double = extern struct {
    pod: struct_spa_pod = @import("std").mem.zeroes(struct_spa_pod),
    value: f64 = 0,
};
pub const struct_spa_pod_string = extern struct {
    pod: struct_spa_pod = @import("std").mem.zeroes(struct_spa_pod),
};
pub const struct_spa_pod_bytes = extern struct {
    pod: struct_spa_pod = @import("std").mem.zeroes(struct_spa_pod),
};
pub const struct_spa_pod_rectangle = extern struct {
    pod: struct_spa_pod = @import("std").mem.zeroes(struct_spa_pod),
    value: struct_spa_rectangle = @import("std").mem.zeroes(struct_spa_rectangle),
};
pub const struct_spa_pod_fraction = extern struct {
    pod: struct_spa_pod = @import("std").mem.zeroes(struct_spa_pod),
    value: struct_spa_fraction = @import("std").mem.zeroes(struct_spa_fraction),
};
pub const struct_spa_pod_array_body = extern struct {
    child: struct_spa_pod = @import("std").mem.zeroes(struct_spa_pod),
};
pub const struct_spa_pod_array = extern struct {
    pod: struct_spa_pod = @import("std").mem.zeroes(struct_spa_pod),
    body: struct_spa_pod_array_body = @import("std").mem.zeroes(struct_spa_pod_array_body),
};
pub const SPA_CHOICE_None: c_int = 0;
pub const SPA_CHOICE_Range: c_int = 1;
pub const SPA_CHOICE_Step: c_int = 2;
pub const SPA_CHOICE_Enum: c_int = 3;
pub const SPA_CHOICE_Flags: c_int = 4;
pub const struct_spa_pod_choice_body = extern struct {
    type: u32 = 0,
    flags: u32 = 0,
    child: struct_spa_pod = @import("std").mem.zeroes(struct_spa_pod),
};
pub const struct_spa_pod_choice = extern struct {
    pod: struct_spa_pod = @import("std").mem.zeroes(struct_spa_pod),
    body: struct_spa_pod_choice_body = @import("std").mem.zeroes(struct_spa_pod_choice_body),
};
pub const struct_spa_pod_object_body = extern struct {
    type: u32 = 0,
    id: u32 = 0,
};
pub const struct_spa_pod_object = extern struct {
    pod: struct_spa_pod = @import("std").mem.zeroes(struct_spa_pod),
    body: struct_spa_pod_object_body = @import("std").mem.zeroes(struct_spa_pod_object_body),
};
pub const struct_spa_pod_pointer_body = extern struct {
    type: u32 = 0,
    _padding: u32 = 0,
    value: ?*const anyopaque = null,
};
pub const struct_spa_pod_pointer = extern struct {
    pod: struct_spa_pod = @import("std").mem.zeroes(struct_spa_pod),
    body: struct_spa_pod_pointer_body = @import("std").mem.zeroes(struct_spa_pod_pointer_body),
};
pub const struct_spa_pod_fd = extern struct {
    pod: struct_spa_pod = @import("std").mem.zeroes(struct_spa_pod),
    value: i64 = 0,
};
pub const struct_spa_pod_prop = extern struct {
    key: u32 = 0,
    flags: u32 = 0,
    value: struct_spa_pod = @import("std").mem.zeroes(struct_spa_pod),
};
pub const struct_spa_pod_sequence_body = extern struct {
    unit: u32 = 0,
    pad: u32 = 0,
};
pub const struct_spa_pod_frame = extern struct {
    pod: struct_spa_pod = @import("std").mem.zeroes(struct_spa_pod),
    parent: [*c]struct_spa_pod_frame = null,
    offset: u32 = 0,
    flags: u32 = 0,
};
pub fn spa_pod_type_size(arg_type: u32) callconv(.c) u32 {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (@"type") {
                    @as(u32, SPA_TYPE_None) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(u32, SPA_TYPE_Bytes) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(u32, SPA_TYPE_Struct) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(u32, SPA_TYPE_Pod) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(u32, SPA_TYPE_String) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(u32, SPA_TYPE_Bool) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(u32, SPA_TYPE_Int) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(u32, SPA_TYPE_Id) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(u32, SPA_TYPE_Long) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(u32, SPA_TYPE_Float) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(u32, SPA_TYPE_Double) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(u32, SPA_TYPE_Rectangle) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(u32, SPA_TYPE_Fraction) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(u32, SPA_TYPE_Bitmap) => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(u32, SPA_TYPE_Array) => {
                        sdl_pc = 16;
                        continue;
                    },
                    @as(u32, SPA_TYPE_Object) => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(u32, SPA_TYPE_Sequence) => {
                        sdl_pc = 18;
                        continue;
                    },
                    @as(u32, SPA_TYPE_Pointer) => {
                        sdl_pc = 19;
                        continue;
                    },
                    @as(u32, SPA_TYPE_Fd) => {
                        sdl_pc = 20;
                        continue;
                    },
                    @as(u32, SPA_TYPE_Choice) => {
                        sdl_pc = 21;
                        continue;
                    },
                    else => {
                        sdl_pc = 1;
                        continue;
                    },
                }
            },
            1 => {
                return 0;
            },
            2 => {
                {
                    sdl_pc = 3;
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
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            5 => {
                return 0;
            },
            6 => {
                return 1;
            },
            7 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            8 => {
                return @truncate(@sizeOf(i32));
            },
            9 => {
                return @truncate(@sizeOf(u32));
            },
            10 => {
                return @truncate(@sizeOf(i64));
            },
            11 => {
                return @truncate(@sizeOf(f32));
            },
            12 => {
                return @truncate(@sizeOf(f64));
            },
            13 => {
                return @truncate(@sizeOf(struct_spa_rectangle));
            },
            14 => {
                return @truncate(@sizeOf(struct_spa_fraction));
            },
            15 => {
                return @truncate(@sizeOf(u8));
            },
            16 => {
                return @truncate(@sizeOf(struct_spa_pod_array_body));
            },
            17 => {
                return @truncate(@sizeOf(struct_spa_pod_object_body));
            },
            18 => {
                return @truncate(@sizeOf(struct_spa_pod_sequence_body));
            },
            19 => {
                return @truncate(@sizeOf(struct_spa_pod_pointer_body));
            },
            20 => {
                return @truncate(@sizeOf(i64));
            },
            21 => {
                return @truncate(@sizeOf(struct_spa_pod_choice_body));
            },
            else => unreachable,
        }
    }
}
pub fn spa_pod_choice_n_values(choice_type: u32, min: [*c]u32, max: [*c]u32) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (choice_type) {
                    @as(u32, SPA_CHOICE_Enum) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(u32, SPA_CHOICE_Range) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(u32, SPA_CHOICE_Step) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(u32, SPA_CHOICE_None) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(u32, SPA_CHOICE_Flags) => {
                        sdl_pc = 6;
                        continue;
                    },
                    else => {
                        sdl_pc = 7;
                        continue;
                    },
                }
            },
            1 => {
                return 1;
            },
            2 => {
                min.* = 2;
                max.* = @as(c_uint, 4294967295);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                min.* = blk: {
                    const tmp = @as(u32, 3);
                    max.* = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                min.* = blk: {
                    const tmp = @as(u32, 4);
                    max.* = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 1;
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
                min.* = blk: {
                    const tmp = @as(u32, 1);
                    max.* = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            7 => {
                min.* = 1;
                max.* = @as(c_uint, 4294967295);
                return 0;
            },
            else => unreachable,
        }
    }
}
pub fn spa_pod_is_choice(pod: [*c]const struct_spa_pod) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return @intFromBool(((@as([*c]struct_spa_pod, @ptrCast(@alignCast(@constCast(pod)))).*.size < (@as(c_uint, 1) << @intCast(@as(c_uint, 20)))) and (pod.*.type == @as(u32, @bitCast(@as(c_int, SPA_TYPE_Choice))))) and (@as(c_ulong, pod.*.size) >= @sizeOf(struct_spa_pod_choice_body)));
}
pub fn spa_pod_choice_body_get_values(pod: [*c]const struct_spa_pod_choice, body: ?*const anyopaque, n_values: [*c]u32, choice: [*c]u32, val_size: [*c]u32, val_type: [*c]u32) callconv(.c) ?*const anyopaque {
    @setEvalBranchQuota(100000);
    var child_size: u32 = pod.*.body.child.size;
    _ = &child_size;
    var min: u32 = undefined;
    _ = &min;
    var max: u32 = undefined;
    _ = &max;
    val_size.* = child_size;
    val_type.* = pod.*.body.child.type;
    n_values.* = @truncate(if (child_size != 0) (@as(c_ulong, pod.*.pod.size) -% @sizeOf(@TypeOf(pod.*.body))) / @as(c_ulong, child_size) else @as(c_ulong, 0));
    choice.* = pod.*.body.type;
    _ = spa_pod_choice_n_values(choice.*, &min, &max);
    if ((n_values.* < min) or (val_size.* < spa_pod_type_size(val_type.*))) {
        n_values.* = 0;
    } else if (n_values.* > max) {
        n_values.* = max;
    }
    return body;
}
pub fn spa_pod_is_object(pod: [*c]const struct_spa_pod) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return @intFromBool(((@as([*c]struct_spa_pod, @ptrCast(@alignCast(@constCast(pod)))).*.size < (@as(c_uint, 1) << @intCast(@as(c_uint, 20)))) and (pod.*.type == @as(u32, @bitCast(@as(c_int, SPA_TYPE_Object))))) and (@as(c_ulong, pod.*.size) >= @sizeOf(struct_spa_pod_object_body)));
}
pub const struct_spa_pod_builder_state = extern struct {
    offset: u32 = 0,
    flags: u32 = 0,
    frame: [*c]struct_spa_pod_frame = null,
};
pub const struct_spa_pod_builder = extern struct {
    data: ?*anyopaque = null,
    size: u32 = 0,
    _padding: u32 = 0,
    state: struct_spa_pod_builder_state = @import("std").mem.zeroes(struct_spa_pod_builder_state),
    callbacks: struct_spa_callbacks = @import("std").mem.zeroes(struct_spa_callbacks),
};
pub const struct_spa_pod_builder_callbacks = extern struct {
    version: u32 = 0,
    overflow: ?*const fn (data: ?*anyopaque, size: u32) callconv(.c) c_int = null,
};
pub fn spa_pod_builder_frame(builder: [*c]struct_spa_pod_builder, frame: [*c]struct_spa_pod_frame) callconv(.c) [*c]struct_spa_pod {
    @setEvalBranchQuota(100000);
    if ((@as(u64, frame.*.offset) +% (@sizeOf(struct_spa_pod) +% @as(u64, (&frame.*.pod).*.size))) <= @as(u64, builder.*.size)) return @as([*c]struct_spa_pod, @ptrFromInt(@as(usize, @intCast(@intFromPtr(builder.*.data))) +% @as(usize, @bitCast(@as(c_long, @as(ptrdiff_t, frame.*.offset))))));
    return null;
}
pub fn spa_pod_builder_push(builder: [*c]struct_spa_pod_builder, frame: [*c]struct_spa_pod_frame, pod: [*c]const struct_spa_pod, offset: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    frame.*.pod = pod.*;
    frame.*.offset = offset;
    frame.*.parent = builder.*.state.frame;
    frame.*.flags = builder.*.state.flags;
    builder.*.state.frame = frame;
    if ((frame.*.pod.type == @as(u32, SPA_TYPE_Array)) or (frame.*.pod.type == @as(u32, SPA_TYPE_Choice))) {
        builder.*.state.flags = @bitCast(@as(c_int, (@as(c_int, 1) << @intCast(@as(c_int, 1))) | (@as(c_int, 1) << @intCast(@as(c_int, 0)))));
    }
}
pub fn spa_pod_builder_raw(builder: [*c]struct_spa_pod_builder, arg_data: ?*const anyopaque, size: u32) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var data = arg_data;
    _ = &data;
    var res: c_int = 0;
    _ = &res;
    var f: [*c]struct_spa_pod_frame = undefined;
    _ = &f;
    var offset: u32 = builder.*.state.offset;
    _ = &offset;
    var data_offset: usize = @bitCast(@as(c_long, -@as(c_int, 1)));
    _ = &data_offset;
    var total_size: u64 = @as(u64, offset) +% @as(u64, size);
    _ = &total_size;
    if (total_size > @as(u64, builder.*.size)) {
        if (total_size > @as(u64, @as(c_uint, 4294967295))) return -ENOSPC;
        if (spa_ptrinside(builder.*.data, builder.*.size, data, size, null)) {
            data_offset = @bitCast(@as(c_long, @as(isize, @intCast(@intFromPtr(data))) - @as(isize, @intCast(@intFromPtr(builder.*.data)))));
        }
        res = -ENOSPC;
        if (offset <= builder.*.size) {
            {
                var _f: [*c]const struct_spa_pod_builder_callbacks = @ptrCast(@alignCast((&builder.*.callbacks).*.funcs));
                _ = &_f;
                if (__builtin.expect(@as(c_long, @intFromBool(!!(((_f != null) and ((@as(c_int, 0) == @as(c_int, 0)) or (_f.*.version > @as(u32, @bitCast(@as(c_int, @as(c_int, 0) - @as(c_int, 1))))))) and (_f.*.overflow != null)))), @as(c_long, 1)) != 0) {
                    res = _f.*.overflow.?((&builder.*.callbacks).*.data, @truncate(total_size));
                }
                _ = &res;
            }
        }
    }
    if ((res == @as(c_int, 0)) and (data != null)) {
        if (data_offset != @as(usize, @bitCast(@as(c_long, -@as(c_int, 1))))) {
            data = @as(?*const anyopaque, @ptrFromInt(@as(usize, @intCast(@intFromPtr(builder.*.data))) +% @as(usize, @bitCast(@as(c_long, @as(ptrdiff_t, @bitCast(@as(c_ulong, @truncate(data_offset)))))))));
        }
        _ = memcpy(@as(?*anyopaque, @ptrFromInt(@as(usize, @intCast(@intFromPtr(builder.*.data))) +% @as(usize, @bitCast(@as(c_long, @as(ptrdiff_t, offset)))))), data, size);
    }
    builder.*.state.offset = @truncate(total_size);
    {
        f = builder.*.state.frame;
        while (f != null) : (f = f.*.parent) {
            f.*.pod.size +%= size;
        }
    }
    return res;
}
pub fn spa_pod_builder_pad(builder: [*c]struct_spa_pod_builder, arg_size: u32) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var size = arg_size;
    _ = &size;
    var zeroes: u64 = 0;
    _ = &zeroes;
    if (builder.*.state.flags == @as(u32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))))) return 0;
    size = (((size -% @as(u32, 1)) | @as(@TypeOf(size), @bitCast(@as(c_int, SPA_POD_ALIGN - @as(c_int, 1))))) +% @as(u32, 1)) -% size;
    return if (size != 0) spa_pod_builder_raw(builder, @ptrCast(@alignCast(&zeroes)), size) else @as(c_int, 0);
}
pub fn spa_pod_builder_pop(builder: [*c]struct_spa_pod_builder, frame: [*c]struct_spa_pod_frame) callconv(.c) ?*anyopaque {
    @setEvalBranchQuota(100000);
    var pod: [*c]struct_spa_pod = undefined;
    _ = &pod;
    if ((builder.*.state.flags & @as(u32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 1)))))) == @as(u32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 1)))))) {
        const p: struct_spa_pod = struct_spa_pod{
            .size = 0,
            .type = SPA_TYPE_None,
        };
        _ = &p;
        _ = spa_pod_builder_raw(builder, @ptrCast(@alignCast(&p)), @truncate(@sizeOf(@TypeOf(p))));
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(blk: {
        const tmp = spa_pod_builder_frame(builder, frame);
        pod = tmp;
        break :blk tmp;
    }))) != @as(?*anyopaque, null)) {
        pod.* = frame.*.pod;
    }
    builder.*.state.frame = frame.*.parent;
    builder.*.state.flags = frame.*.flags;
    _ = spa_pod_builder_pad(builder, builder.*.state.offset);
    return @ptrCast(@alignCast(pod));
}
pub fn spa_pod_builder_primitive_body(builder: [*c]struct_spa_pod_builder, p: [*c]const struct_spa_pod, body: ?*const anyopaque, body_size: u32, suffix: [*c]const u8, suffix_size: u32) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var res: c_int = 0;
    _ = &res;
    var r: c_int = undefined;
    _ = &r;
    var size: u32 = @truncate(((@sizeOf(struct_spa_pod) +% @as(u64, @as([*c]struct_spa_pod, @ptrCast(@alignCast(@constCast(p)))).*.size)) -% @as(u64, body_size)) -% @as(u64, suffix_size));
    _ = &size;
    if (builder.*.state.flags != @as(u32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))))) {
        {
            comptime {
                if (!((if (@as(c_int, 0) != 0) @intFromBool(@as(@TypeOf(@as(c_int, 1) << @intCast(@as(c_int, 1))), @bitCast(@as(c_uint, @truncate(@as(@TypeOf(builder.*.state.flags), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 1))))))))) == (@as(c_int, 1) << @intCast(@as(c_int, 1)))) else @intFromBool(@sizeOf(@TypeOf(builder.*.state.flags)) >= @sizeOf(@TypeOf(@as(c_int, 1) << @intCast(@as(c_int, 1)))))) != 0)) @compileError("static assertion failed \"truncation problem when masking builder->state.flags with ~SPA_POD_BUILDER_FLAG_FIRST\"");
            }
            builder.*.state.flags &= ~@as(@TypeOf(builder.*.state.flags), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 1)))));
        }
        res = spa_pod_builder_raw(builder, @ptrCast(@alignCast(p)), size);
    }
    if ((body_size > @as(u32, 0)) and ((blk: {
        const tmp = spa_pod_builder_raw(builder, body, body_size);
        r = tmp;
        break :blk tmp;
    }) < @as(c_int, 0))) {
        res = r;
    }
    if ((suffix_size > @as(u32, 0)) and ((blk: {
        const tmp = spa_pod_builder_raw(builder, @ptrCast(@alignCast(suffix)), suffix_size);
        r = tmp;
        break :blk tmp;
    }) < @as(c_int, 0))) {
        res = r;
    }
    if ((blk: {
        const tmp = spa_pod_builder_pad(builder, builder.*.state.offset);
        r = tmp;
        break :blk tmp;
    }) < @as(c_int, 0)) {
        res = r;
    }
    return res;
}
pub fn spa_pod_builder_primitive(builder: [*c]struct_spa_pod_builder, p: [*c]const struct_spa_pod) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return spa_pod_builder_primitive_body(builder, p, @as(?*const anyopaque, @ptrFromInt(@as(usize, @intCast(@intFromPtr(p))) +% @as(usize, @bitCast(@as(c_long, @as(ptrdiff_t, @bitCast(@as(c_ulong, @truncate(@sizeOf(struct_spa_pod)))))))))), p.*.size, null, 0);
}
pub fn spa_pod_builder_none(builder: [*c]struct_spa_pod_builder) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const p: struct_spa_pod = @as(struct_spa_pod, struct_spa_pod{
        .size = @bitCast(@as(c_int, @as(c_int, 0))),
        .type = @bitCast(@as(c_int, SPA_TYPE_None)),
    });
    _ = &p;
    return spa_pod_builder_primitive(builder, &p);
}
pub fn spa_pod_builder_bool(builder: [*c]struct_spa_pod_builder, val: bool) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const p: struct_spa_pod_bool = @as(struct_spa_pod_bool, struct_spa_pod_bool{
        .pod = struct_spa_pod{
            .size = @truncate(@sizeOf(u32)),
            .type = SPA_TYPE_Bool,
        },
        .value = if (val) @as(c_int, 1) else @as(c_int, 0),
        ._padding = 0,
    });
    _ = &p;
    return spa_pod_builder_primitive(builder, &p.pod);
}
pub fn spa_pod_builder_id(builder: [*c]struct_spa_pod_builder, val: u32) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const p: struct_spa_pod_id = @as(struct_spa_pod_id, struct_spa_pod_id{
        .pod = struct_spa_pod{
            .size = @truncate(@sizeOf(u32)),
            .type = SPA_TYPE_Id,
        },
        .value = val,
        ._padding = 0,
    });
    _ = &p;
    return spa_pod_builder_primitive(builder, &p.pod);
}
pub fn spa_pod_builder_int(builder: [*c]struct_spa_pod_builder, val: i32) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const p: struct_spa_pod_int = @as(struct_spa_pod_int, struct_spa_pod_int{
        .pod = struct_spa_pod{
            .size = @truncate(@sizeOf(i32)),
            .type = SPA_TYPE_Int,
        },
        .value = val,
        ._padding = 0,
    });
    _ = &p;
    return spa_pod_builder_primitive(builder, &p.pod);
}
pub fn spa_pod_builder_long(builder: [*c]struct_spa_pod_builder, val: i64) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const p: struct_spa_pod_long = @as(struct_spa_pod_long, struct_spa_pod_long{
        .pod = struct_spa_pod{
            .size = @truncate(@sizeOf(i64)),
            .type = SPA_TYPE_Long,
        },
        .value = val,
    });
    _ = &p;
    return spa_pod_builder_primitive(builder, &p.pod);
}
pub fn spa_pod_builder_float(builder: [*c]struct_spa_pod_builder, val: f32) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const p: struct_spa_pod_float = @as(struct_spa_pod_float, struct_spa_pod_float{
        .pod = struct_spa_pod{
            .size = @truncate(@sizeOf(f32)),
            .type = SPA_TYPE_Float,
        },
        .value = val,
        ._padding = 0,
    });
    _ = &p;
    return spa_pod_builder_primitive(builder, &p.pod);
}
pub fn spa_pod_builder_double(builder: [*c]struct_spa_pod_builder, val: f64) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const p: struct_spa_pod_double = @as(struct_spa_pod_double, struct_spa_pod_double{
        .pod = struct_spa_pod{
            .size = @truncate(@sizeOf(f64)),
            .type = SPA_TYPE_Double,
        },
        .value = val,
    });
    _ = &p;
    return spa_pod_builder_primitive(builder, &p.pod);
}
pub fn spa_pod_builder_string_len(builder: [*c]struct_spa_pod_builder, str: [*c]const u8, len: u32) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const p: struct_spa_pod_string = @as(struct_spa_pod_string, struct_spa_pod_string{
        .pod = struct_spa_pod{
            .size = len +% @as(u32, 1),
            .type = SPA_TYPE_String,
        },
    });
    _ = &p;
    return spa_pod_builder_primitive_body(builder, &p.pod, @ptrCast(@alignCast(str)), len, "", 1);
}
pub fn spa_pod_builder_bytes(builder: [*c]struct_spa_pod_builder, bytes: ?*const anyopaque, len: u32) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const p: struct_spa_pod_bytes = @as(struct_spa_pod_bytes, struct_spa_pod_bytes{
        .pod = struct_spa_pod{
            .size = len,
            .type = SPA_TYPE_Bytes,
        },
    });
    _ = &p;
    return spa_pod_builder_primitive_body(builder, &p.pod, bytes, len, null, 0);
}
pub fn spa_pod_builder_pointer(builder: [*c]struct_spa_pod_builder, arg_type: u32, val: ?*const anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    const p: struct_spa_pod_pointer = @as(struct_spa_pod_pointer, struct_spa_pod_pointer{
        .pod = struct_spa_pod{
            .size = @truncate(@sizeOf(struct_spa_pod_pointer_body)),
            .type = SPA_TYPE_Pointer,
        },
        .body = struct_spa_pod_pointer_body{
            .type = @"type",
            ._padding = 0,
            .value = val,
        },
    });
    _ = &p;
    return spa_pod_builder_primitive(builder, &p.pod);
}
pub fn spa_pod_builder_fd(builder: [*c]struct_spa_pod_builder, fd: i64) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const p: struct_spa_pod_fd = @as(struct_spa_pod_fd, struct_spa_pod_fd{
        .pod = struct_spa_pod{
            .size = @truncate(@sizeOf(i64)),
            .type = SPA_TYPE_Fd,
        },
        .value = fd,
    });
    _ = &p;
    return spa_pod_builder_primitive(builder, &p.pod);
}
pub fn spa_pod_builder_rectangle(builder: [*c]struct_spa_pod_builder, width: u32, height: u32) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const p: struct_spa_pod_rectangle = @as(struct_spa_pod_rectangle, struct_spa_pod_rectangle{
        .pod = struct_spa_pod{
            .size = @truncate(@sizeOf(struct_spa_rectangle)),
            .type = SPA_TYPE_Rectangle,
        },
        .value = @as(struct_spa_rectangle, struct_spa_rectangle{
            .width = width,
            .height = height,
        }),
    });
    _ = &p;
    return spa_pod_builder_primitive(builder, &p.pod);
}
pub fn spa_pod_builder_fraction(builder: [*c]struct_spa_pod_builder, num: u32, denom: u32) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const p: struct_spa_pod_fraction = @as(struct_spa_pod_fraction, struct_spa_pod_fraction{
        .pod = struct_spa_pod{
            .size = @truncate(@sizeOf(struct_spa_fraction)),
            .type = SPA_TYPE_Fraction,
        },
        .value = @as(struct_spa_fraction, struct_spa_fraction{
            .num = num,
            .denom = denom,
        }),
    });
    _ = &p;
    return spa_pod_builder_primitive(builder, &p.pod);
}
pub fn spa_pod_builder_array(builder: [*c]struct_spa_pod_builder, child_size: u32, child_type: u32, n_elems: u32, elems: ?*const anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const p: struct_spa_pod_array = struct_spa_pod_array{
        .pod = struct_spa_pod{
            .size = @truncate(@sizeOf(struct_spa_pod_array_body) +% @as(c_ulong, n_elems *% child_size)),
            .type = SPA_TYPE_Array,
        },
        .body = struct_spa_pod_array_body{
            .child = struct_spa_pod{
                .size = child_size,
                .type = child_type,
            },
        },
    };
    _ = &p;
    return spa_pod_builder_primitive_body(builder, &p.pod, elems, n_elems *% child_size, null, 0);
}
pub fn spa_pod_builder_push_choice(builder: [*c]struct_spa_pod_builder, frame: [*c]struct_spa_pod_frame, arg_type: u32, flags: u32) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    const p: struct_spa_pod_choice = struct_spa_pod_choice{
        .pod = struct_spa_pod{
            .size = @truncate(@sizeOf(struct_spa_pod_choice_body) -% @sizeOf(struct_spa_pod)),
            .type = SPA_TYPE_Choice,
        },
        .body = struct_spa_pod_choice_body{
            .type = @"type",
            .flags = flags,
            .child = struct_spa_pod{
                .size = 0,
                .type = 0,
            },
        },
    };
    _ = &p;
    var offset: u32 = builder.*.state.offset;
    _ = &offset;
    var res: c_int = spa_pod_builder_raw(builder, @ptrCast(@alignCast(&p)), @truncate(@sizeOf(@TypeOf(p)) -% @sizeOf(struct_spa_pod)));
    _ = &res;
    spa_pod_builder_push(builder, frame, &p.pod, offset);
    return res;
}
pub fn spa_pod_builder_push_object(builder: [*c]struct_spa_pod_builder, frame: [*c]struct_spa_pod_frame, arg_type: u32, id: u32) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    const p: struct_spa_pod_object = @as(struct_spa_pod_object, struct_spa_pod_object{
        .pod = struct_spa_pod{
            .size = @truncate(@sizeOf(struct_spa_pod_object_body)),
            .type = SPA_TYPE_Object,
        },
        .body = struct_spa_pod_object_body{
            .type = @"type",
            .id = id,
        },
    });
    _ = &p;
    var offset: u32 = builder.*.state.offset;
    _ = &offset;
    var res: c_int = spa_pod_builder_raw(builder, @ptrCast(@alignCast(&p)), @truncate(@sizeOf(@TypeOf(p))));
    _ = &res;
    spa_pod_builder_push(builder, frame, &p.pod, offset);
    return res;
}
pub fn spa_pod_builder_prop(builder: [*c]struct_spa_pod_builder, key: u32, flags: u32) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const struct_unnamed_44 = extern struct {
        key: u32 = 0,
        flags: u32 = 0,
    };
    _ = &struct_unnamed_44;
    const p: struct_unnamed_44 = struct_unnamed_44{
        .key = key,
        .flags = flags,
    };
    _ = &p;
    return spa_pod_builder_raw(builder, @ptrCast(@alignCast(&p)), @truncate(@sizeOf(@TypeOf(p))));
}
pub fn spa_pod_builder_control(builder: [*c]struct_spa_pod_builder, offset: u32, arg_type: u32) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    const struct_unnamed_45 = extern struct {
        offset: u32 = 0,
        type: u32 = 0,
    };
    _ = &struct_unnamed_45;
    const p: struct_unnamed_45 = struct_unnamed_45{
        .offset = offset,
        .type = @"type",
    };
    _ = &p;
    return spa_pod_builder_raw(builder, @ptrCast(@alignCast(&p)), @truncate(@sizeOf(@TypeOf(p))));
}
pub fn spa_choice_from_id_flags(id: u8, flags: [*c]u32) callconv(.c) u32 {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (@as(c_int, id)) {
                    @as(c_int, 'r') => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(c_int, 's') => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(c_int, 'e') => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(c_int, 'F') => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(c_int, 'f') => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(c_int, 'n') => {
                        sdl_pc = 7;
                        continue;
                    },
                    else => {
                        sdl_pc = 8;
                        continue;
                    },
                }
            },
            1 => {
                return undefined;
            },
            2 => {
                return SPA_CHOICE_Range;
            },
            3 => {
                return SPA_CHOICE_Step;
            },
            4 => {
                return SPA_CHOICE_Enum;
            },
            5 => {
                flags.* |= @as(c_uint, 1) << @intCast(@as(c_uint, 5));
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                return SPA_CHOICE_Flags;
            },
            7 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            8 => {
                return SPA_CHOICE_None;
            },
            else => unreachable,
        }
    }
}
pub fn spa_pod_builder_addv(builder: [*c]struct_spa_pod_builder, args: [*c]struct___va_list_tag_2) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var res: c_int = undefined;
    _ = &res;
    var frame: [*c]struct_spa_pod_frame = undefined;
    _ = &frame;
    var ftype: u32 = undefined;
    _ = &ftype;
    var format: [*c]const u8 = undefined;
    _ = &format;
    var n_values: c_int = undefined;
    _ = &n_values;
    var f: struct_spa_pod_frame = undefined;
    _ = &f;
    var choice: bool = undefined;
    _ = &choice;
    var key: u32 = undefined;
    _ = &key;
    var flags: u32 = undefined;
    _ = &flags;
    var offset: u32 = undefined;
    _ = &offset;
    var @"type": u32 = undefined;
    _ = &@"type";
    var ctype: u32 = undefined;
    _ = &ctype;
    var strval: [*c]u8 = undefined;
    _ = &strval;
    var len: usize = undefined;
    _ = &len;
    var strval_1: [*c]u8 = undefined;
    _ = &strval_1;
    var len_2: usize = undefined;
    _ = &len_2;
    var ptr: ?*anyopaque = undefined;
    _ = &ptr;
    var len_3: c_int = undefined;
    _ = &len_3;
    var rectval: [*c]struct_spa_rectangle = undefined;
    _ = &rectval;
    var fracval: [*c]struct_spa_fraction = undefined;
    _ = &fracval;
    var child_size: c_int = undefined;
    _ = &child_size;
    var child_type: c_int = undefined;
    _ = &child_type;
    var n_elems: c_int = undefined;
    _ = &n_elems;
    var elems: ?*anyopaque = undefined;
    _ = &elems;
    var t: c_int = undefined;
    _ = &t;
    var pod: [*c]struct_spa_pod = undefined;
    _ = &pod;
    var pod_4: [*c]struct_spa_pod = undefined;
    _ = &pod_4;
    var body: ?*const anyopaque = undefined;
    _ = &body;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                res = 0;
                frame = builder.*.state.frame;
                ftype = if (frame != null) frame.*.pod.type else @as(u32, @bitCast(@as(c_int, SPA_TYPE_None)));
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return res;
            },
            2 => {
                n_values = 1;
                key = 0;
                flags = 0;
                offset = 0;
                @"type" = 0;
                ctype = 0;
                switch (ftype) {
                    @as(u32, SPA_TYPE_Object) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(u32, SPA_TYPE_Sequence) => {
                        sdl_pc = 13;
                        continue;
                    },
                    else => {
                        sdl_pc = 5;
                        continue;
                    },
                }
            },
            3 => {
                if (true) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            5 => {
                if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(blk: {
                    const tmp = __builtin.va_arg(args, [*c]const u8);
                    format = tmp;
                    break :blk tmp;
                })))) == @as(?*anyopaque, null)) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            6 => {
                key = __builtin.va_arg(args, u32);
                if (key == @as(u32, 0)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
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
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                if (key == @as(c_uint, 4294967295)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                key = __builtin.va_arg(args, u32);
                flags = __builtin.va_arg(args, u32);
                {
                    sdl_pc = 12;
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
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            13 => {
                offset = __builtin.va_arg(args, u32);
                @"type" = __builtin.va_arg(args, u32);
                if (@"type" == @as(u32, 0)) {
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
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 4;
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
                choice = @as(c_int, format.*) == @as(c_int, '?');
                if (choice) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                ctype = spa_choice_from_id_flags((blk: {
                    const ref = &format;
                    ref.* += 1;
                    break :blk ref.*;
                }).*, &flags);
                if (@as(c_int, format.*) != @as(c_int, '\x00')) {
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
                switch (ftype) {
                    @as(u32, SPA_TYPE_Object) => {
                        sdl_pc = 27;
                        continue;
                    },
                    @as(u32, SPA_TYPE_Sequence) => {
                        sdl_pc = 28;
                        continue;
                    },
                    else => {
                        sdl_pc = 26;
                        continue;
                    },
                }
            },
            23 => {
                format += 1;
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
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            26 => {
                if (choice) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            27 => {
                _ = spa_pod_builder_prop(builder, key, flags);
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            28 => {
                _ = spa_pod_builder_control(builder, offset, @"type");
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            29 => {
                _ = spa_pod_builder_push_choice(builder, &f, ctype, 0);
                n_values = __builtin.va_arg(args, c_int);
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
                    sdl_pc = 32;
                    continue;
                }
            },
            32 => {
                if ((blk: {
                    const ref = &n_values;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) > @as(c_int, 0)) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 34;
                    continue;
                }
            },
            33 => {
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            34 => {
                if (choice) {
                    sdl_pc = 67;
                    continue;
                } else {
                    sdl_pc = 68;
                    continue;
                }
            },
            35 => {
                switch (@as(c_int, format.*)) {
                    @as(c_int, 'b') => {
                        sdl_pc = 39;
                        continue;
                    },
                    @as(c_int, 'I') => {
                        sdl_pc = 40;
                        continue;
                    },
                    @as(c_int, 'i') => {
                        sdl_pc = 41;
                        continue;
                    },
                    @as(c_int, 'l') => {
                        sdl_pc = 42;
                        continue;
                    },
                    @as(c_int, 'f') => {
                        sdl_pc = 43;
                        continue;
                    },
                    @as(c_int, 'd') => {
                        sdl_pc = 44;
                        continue;
                    },
                    @as(c_int, 's') => {
                        sdl_pc = 45;
                        continue;
                    },
                    @as(c_int, 'S') => {
                        sdl_pc = 49;
                        continue;
                    },
                    @as(c_int, 'y') => {
                        sdl_pc = 50;
                        continue;
                    },
                    @as(c_int, 'R') => {
                        sdl_pc = 51;
                        continue;
                    },
                    @as(c_int, 'F') => {
                        sdl_pc = 52;
                        continue;
                    },
                    @as(c_int, 'a') => {
                        sdl_pc = 53;
                        continue;
                    },
                    @as(c_int, 'p') => {
                        sdl_pc = 54;
                        continue;
                    },
                    @as(c_int, 'h') => {
                        sdl_pc = 55;
                        continue;
                    },
                    @as(c_int, 'P') => {
                        sdl_pc = 56;
                        continue;
                    },
                    @as(c_int, 'O') => {
                        sdl_pc = 57;
                        continue;
                    },
                    @as(c_int, 'T') => {
                        sdl_pc = 58;
                        continue;
                    },
                    @as(c_int, 'V') => {
                        sdl_pc = 59;
                        continue;
                    },
                    @as(c_int, 'Q') => {
                        sdl_pc = 63;
                        continue;
                    },
                    @as(c_int, 'N') => {
                        sdl_pc = 64;
                        continue;
                    },
                    @as(c_int, 'U') => {
                        sdl_pc = 65;
                        continue;
                    },
                    @as(c_int, 'W') => {
                        sdl_pc = 66;
                        continue;
                    },
                    else => {
                        sdl_pc = 38;
                        continue;
                    },
                }
            },
            36 => {
                if (false) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 37;
                    continue;
                }
            },
            37 => {
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            38 => {
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            39 => {
                _ = spa_pod_builder_bool(builder, !!(__builtin.va_arg(args, c_int) != 0));
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            40 => {
                _ = spa_pod_builder_id(builder, __builtin.va_arg(args, u32));
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            41 => {
                _ = spa_pod_builder_int(builder, __builtin.va_arg(args, c_int));
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            42 => {
                _ = spa_pod_builder_long(builder, __builtin.va_arg(args, i64));
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            43 => {
                _ = spa_pod_builder_float(builder, @floatCast(__builtin.va_arg(args, f64)));
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            44 => {
                _ = spa_pod_builder_double(builder, __builtin.va_arg(args, f64));
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            45 => {
                strval = __builtin.va_arg(args, [*c]u8);
                if (@as(?*anyopaque, @ptrCast(@alignCast(strval))) != @as(?*anyopaque, null)) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 47;
                    continue;
                }
            },
            46 => {
                len = strlen(strval);
                _ = spa_pod_builder_string_len(builder, strval, @truncate(len));
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            47 => {
                _ = spa_pod_builder_none(builder);
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            48 => {
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            49 => {
                strval_1 = __builtin.va_arg(args, [*c]u8);
                len_2 = @bitCast(@as(c_long, __builtin.va_arg(args, c_int)));
                _ = spa_pod_builder_string_len(builder, strval_1, @truncate(len_2));
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            50 => {
                ptr = __builtin.va_arg(args, ?*anyopaque);
                len_3 = __builtin.va_arg(args, c_int);
                _ = spa_pod_builder_bytes(builder, ptr, @bitCast(@as(c_int, len_3)));
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            51 => {
                rectval = __builtin.va_arg(args, [*c]struct_spa_rectangle);
                _ = spa_pod_builder_rectangle(builder, rectval.*.width, rectval.*.height);
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            52 => {
                fracval = __builtin.va_arg(args, [*c]struct_spa_fraction);
                _ = spa_pod_builder_fraction(builder, fracval.*.num, fracval.*.denom);
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            53 => {
                child_size = __builtin.va_arg(args, c_int);
                child_type = __builtin.va_arg(args, c_int);
                n_elems = __builtin.va_arg(args, c_int);
                elems = __builtin.va_arg(args, ?*anyopaque);
                _ = spa_pod_builder_array(builder, @bitCast(@as(c_int, child_size)), @bitCast(@as(c_int, child_type)), @bitCast(@as(c_int, n_elems)), elems);
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            54 => {
                t = @bitCast(@as(c_uint, @truncate(__builtin.va_arg(args, u32))));
                _ = spa_pod_builder_pointer(builder, @bitCast(@as(c_int, t)), __builtin.va_arg(args, ?*anyopaque));
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            55 => {
                _ = spa_pod_builder_fd(builder, __builtin.va_arg(args, c_int));
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            56 => {
                {
                    sdl_pc = 57;
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
                    sdl_pc = 59;
                    continue;
                }
            },
            59 => {
                pod = __builtin.va_arg(args, [*c]struct_spa_pod);
                if (@as(?*anyopaque, @ptrCast(@alignCast(pod))) == @as(?*anyopaque, null)) {
                    sdl_pc = 60;
                    continue;
                } else {
                    sdl_pc = 61;
                    continue;
                }
            },
            60 => {
                _ = spa_pod_builder_none(builder);
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            61 => {
                _ = spa_pod_builder_primitive(builder, pod);
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            62 => {
                {
                    sdl_pc = 38;
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
                {
                    sdl_pc = 65;
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
                pod_4 = __builtin.va_arg(args, [*c]struct_spa_pod);
                body = __builtin.va_arg(args, ?*const anyopaque);
                _ = spa_pod_builder_primitive_body(builder, pod_4, body, pod_4.*.size, null, 0);
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            67 => {
                _ = spa_pod_builder_pop(builder, &f);
                {
                    sdl_pc = 69;
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
                    sdl_pc = 3;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn spa_pod_builder_add(builder: [*c]struct_spa_pod_builder, ...) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var res: c_int = undefined;
    _ = &res;
    var args: va_list = undefined;
    _ = &args;
    __builtin.va_start(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&args))), @cVaStart());
    res = spa_pod_builder_addv(builder, @ptrCast(@alignCast(&args)));
    __builtin.va_end(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&args))));
    return res;
}
pub fn spa_pod_prop_first(body: [*c]const struct_spa_pod_object_body) callconv(.c) [*c]struct_spa_pod_prop {
    @setEvalBranchQuota(100000);
    return @as([*c]struct_spa_pod_prop, @ptrFromInt(@as(usize, @intCast(@intFromPtr(body))) +% @as(usize, @bitCast(@as(c_long, @as(ptrdiff_t, @bitCast(@as(c_ulong, @truncate(@sizeOf(struct_spa_pod_object_body))))))))));
}
pub fn spa_pod_prop_is_inside(body: [*c]const struct_spa_pod_object_body, size: u32, iter: [*c]const struct_spa_pod_prop) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var remaining: usize = undefined;
    _ = &remaining;
    return spa_ptr_inside_and_aligned(@ptrCast(@alignCast(body)), size, @ptrCast(@alignCast(iter)), @sizeOf(struct_spa_pod_prop), @alignOf(struct_spa_pod_prop), &remaining) and (remaining >= @as(usize, iter.*.value.size));
}
pub fn spa_pod_prop_next(iter: [*c]const struct_spa_pod_prop) callconv(.c) [*c]struct_spa_pod_prop {
    @setEvalBranchQuota(100000);
    return @as([*c]struct_spa_pod_prop, @ptrFromInt(@as(usize, @intCast(@intFromPtr(iter))) +% @as(usize, @bitCast(@as(c_long, @as(ptrdiff_t, @bitCast(@as(c_ulong, @truncate((((@sizeOf(struct_spa_pod_prop) +% @as(c_ulong, iter.*.value.size)) -% @as(c_ulong, 1)) | @as(@TypeOf(@sizeOf(struct_spa_pod_prop) +% @as(c_ulong, iter.*.value.size)), @bitCast(@as(c_long, SPA_POD_ALIGN - @as(c_int, 1))))) +% @as(c_ulong, 1))))))))));
}
pub fn spa_pod_get_values(pod: [*c]const struct_spa_pod, n_vals: [*c]u32, choice: [*c]u32) callconv(.c) [*c]struct_spa_pod {
    @setEvalBranchQuota(100000);
    if (spa_pod_is_choice(pod) != 0) {
        var p: [*c]const struct_spa_pod_choice = @ptrCast(@alignCast(pod));
        _ = &p;
        var @"type": u32 = undefined;
        _ = &@"type";
        var size: u32 = undefined;
        _ = &size;
        _ = spa_pod_choice_body_get_values(p, @as(?*const anyopaque, @ptrFromInt(@as(usize, @intCast(@intFromPtr(p))) +% @as(usize, @bitCast(@as(c_long, @as(ptrdiff_t, @bitCast(@as(c_ulong, @truncate(@sizeOf(struct_spa_pod)))))))))), n_vals, choice, &size, &@"type");
        return __helpers.cast([*c]struct_spa_pod, &p.*.body.child);
    } else {
        n_vals.* = @bitCast(@as(c_int, if (pod.*.size < spa_pod_type_size(pod.*.type)) @as(c_int, 0) else @as(c_int, 1)));
        choice.* = SPA_CHOICE_None;
        return @ptrCast(@alignCast(@constCast(pod)));
    }
}
pub fn spa_pod_object_find_prop(pod: [*c]const struct_spa_pod_object, arg_start: [*c]const struct_spa_pod_prop, key: u32) callconv(.c) [*c]const struct_spa_pod_prop {
    @setEvalBranchQuota(100000);
    var start = arg_start;
    _ = &start;
    var first: [*c]const struct_spa_pod_prop = undefined;
    _ = &first;
    var res: [*c]const struct_spa_pod_prop = undefined;
    _ = &res;
    first = spa_pod_prop_first(&pod.*.body);
    start = if (start != null) @as([*c]const struct_spa_pod_prop, @ptrCast(@alignCast(spa_pod_prop_next(start)))) else first;
    {
        res = start;
        while (spa_pod_prop_is_inside(&pod.*.body, pod.*.pod.size, res)) : (res = spa_pod_prop_next(res)) {
            if (res.*.key == key) return res;
        }
    }
    {
        res = first;
        while (res != start) : (res = spa_pod_prop_next(res)) {
            if (res.*.key == key) return res;
        }
    }
    return null;
}
pub fn spa_pod_find_prop(pod: [*c]const struct_spa_pod, start: [*c]const struct_spa_pod_prop, key: u32) callconv(.c) [*c]const struct_spa_pod_prop {
    @setEvalBranchQuota(100000);
    if (!(spa_pod_is_object(pod) != 0)) return null;
    return spa_pod_object_find_prop(@ptrCast(@alignCast(pod)), start, key);
}
pub const SPA_PARAM_EnumFormat: c_int = 3;
pub const struct_spa_param_info = extern struct {
    id: u32 = 0,
    flags: u32 = 0,
    user: u32 = 0,
    seq: i32 = 0,
    padding: [4]u32 = @import("std").mem.zeroes([4]u32),
};
pub const SPA_MEDIA_TYPE_video: c_int = 2;
pub const SPA_MEDIA_SUBTYPE_raw: c_int = 1;
pub const SPA_MEDIA_SUBTYPE_mjpg: c_int = 131074;
pub const SPA_FORMAT_mediaType: c_int = 1;
pub const SPA_FORMAT_mediaSubtype: c_int = 2;
pub const SPA_FORMAT_VIDEO_format: c_int = 131073;
pub const SPA_FORMAT_VIDEO_size: c_int = 131075;
pub const SPA_FORMAT_VIDEO_framerate: c_int = 131076;
pub const SPA_VIDEO_FORMAT_UNKNOWN: c_int = 0;
pub const SPA_VIDEO_FORMAT_I420: c_int = 2;
pub const SPA_VIDEO_FORMAT_YV12: c_int = 3;
pub const SPA_VIDEO_FORMAT_YUY2: c_int = 4;
pub const SPA_VIDEO_FORMAT_UYVY: c_int = 5;
pub const SPA_VIDEO_FORMAT_RGBx: c_int = 7;
pub const SPA_VIDEO_FORMAT_BGRx: c_int = 8;
pub const SPA_VIDEO_FORMAT_xRGB: c_int = 9;
pub const SPA_VIDEO_FORMAT_xBGR: c_int = 10;
pub const SPA_VIDEO_FORMAT_RGBA: c_int = 11;
pub const SPA_VIDEO_FORMAT_BGRA: c_int = 12;
pub const SPA_VIDEO_FORMAT_ARGB: c_int = 13;
pub const SPA_VIDEO_FORMAT_ABGR: c_int = 14;
pub const SPA_VIDEO_FORMAT_RGB: c_int = 15;
pub const SPA_VIDEO_FORMAT_BGR: c_int = 16;
pub const SPA_VIDEO_FORMAT_YVYU: c_int = 19;
pub const SPA_VIDEO_FORMAT_NV12: c_int = 23;
pub const SPA_VIDEO_FORMAT_NV21: c_int = 24;
pub const struct_spa_dict_item = extern struct {
    key: [*c]const u8 = null,
    value: [*c]const u8 = null,
};
pub const struct_spa_dict = extern struct {
    flags: u32 = 0,
    n_items: u32 = 0,
    items: [*c]const struct_spa_dict_item = null,
};
pub fn spa_dict_item_compare(arg_i1: ?*const anyopaque, arg_i2: ?*const anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var @"i1" = arg_i1;
    _ = &@"i1";
    var @"i2" = arg_i2;
    _ = &@"i2";
    var it1: [*c]const struct_spa_dict_item = @ptrCast(@alignCast(@"i1"));
    _ = &it1;
    var it2: [*c]const struct_spa_dict_item = @ptrCast(@alignCast(@"i2"));
    _ = &it2;
    return strcmp(it1.*.key, it2.*.key);
}
pub fn spa_dict_lookup_item(dict: [*c]const struct_spa_dict, key: [*c]const u8) callconv(.c) [*c]const struct_spa_dict_item {
    @setEvalBranchQuota(100000);
    var item: [*c]const struct_spa_dict_item = undefined;
    _ = &item;
    if (((dict.*.flags & @as(u32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))))) == @as(u32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))))) and (dict.*.n_items > @as(u32, 0))) {
        var k: struct_spa_dict_item = @as(struct_spa_dict_item, struct_spa_dict_item{
            .key = key,
            .value = null,
        });
        _ = &k;
        item = @ptrCast(@alignCast(@as(?*const anyopaque, @ptrCast(@alignCast(bsearch(@ptrCast(@alignCast(&k)), @ptrCast(@alignCast(dict.*.items)), dict.*.n_items, @sizeOf(struct_spa_dict_item), spa_dict_item_compare))))));
        if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(item)))) != @as(?*anyopaque, null)) return item;
    } else {
        {
            item = dict.*.items;
            while (item < (&dict.*.items[dict.*.n_items])) : (item += 1) {
                if (!(strcmp(item.*.key, key) != 0)) return item;
            }
        }
    }
    return null;
}
pub fn spa_dict_lookup(dict: [*c]const struct_spa_dict, key: [*c]const u8) callconv(.c) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var item: [*c]const struct_spa_dict_item = spa_dict_lookup_item(dict, key);
    _ = &item;
    return @ptrCast(@alignCast(if (item != null) @as(?*const anyopaque, @ptrCast(@alignCast(item.*.value))) else @as(?*const anyopaque, @ptrCast(@alignCast(@as(?*anyopaque, null))))));
}
pub fn pw_array_init(arr: [*c]struct_pw_array, extend: usize) callconv(.c) void {
    @setEvalBranchQuota(100000);
    arr.*.data = null;
    arr.*.size = blk: {
        const tmp = @as(usize, 0);
        arr.*.alloc = tmp;
        break :blk tmp;
    };
    arr.*.extend = extend;
}
pub fn pw_array_clear(arr: [*c]struct_pw_array) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (arr.*.extend > @as(usize, 0)) {
        free(arr.*.data);
    }
    pw_array_init(arr, arr.*.extend);
}
pub fn pw_array_ensure_size(arr: [*c]struct_pw_array, size: usize) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var alloc: usize = undefined;
    _ = &alloc;
    var need: usize = undefined;
    _ = &need;
    alloc = arr.*.alloc;
    need = arr.*.size +% size;
    if (__builtin.expect(@as(c_long, @intFromBool(!!(alloc < need))), @as(c_long, 0)) != 0) {
        var data: ?*anyopaque = undefined;
        _ = &data;
        if (arr.*.extend == @as(usize, 0)) return -ENOSPC;
        alloc = blk: {
            var _v: @TypeOf(arr.*.extend) = arr.*.extend;
            _ = &_v;
            break :blk (((need +% _v) -% @as(usize, 1)) / _v) *% _v;
        };
        if (__builtin.expect(@as(c_long, @intFromBool(!!((blk: {
            const tmp = realloc(arr.*.data, alloc);
            data = tmp;
            break :blk tmp;
        }) == @as(?*anyopaque, null)))), @as(c_long, 0)) != 0) return -__errno_location().*;
        arr.*.data = data;
        arr.*.alloc = alloc;
    }
    return 0;
}
pub fn pw_array_add(arr: [*c]struct_pw_array, size: usize) callconv(.c) ?*anyopaque {
    @setEvalBranchQuota(100000);
    var p: ?*anyopaque = undefined;
    _ = &p;
    if (pw_array_ensure_size(arr, size) < @as(c_int, 0)) return null;
    p = @as(?*anyopaque, @ptrFromInt(@as(usize, @intCast(@intFromPtr(arr.*.data))) +% @as(usize, @bitCast(@as(c_long, @as(ptrdiff_t, @bitCast(@as(c_ulong, @truncate(arr.*.size)))))))));
    arr.*.size +%= size;
    return p;
}
pub fn pw_array_add_ptr(arr: [*c]struct_pw_array, ptr: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var p: [*c]?*anyopaque = @ptrCast(@alignCast(pw_array_add(arr, @sizeOf(?*anyopaque))));
    _ = &p;
    if (@as(?*anyopaque, @ptrCast(@alignCast(p))) == @as(?*anyopaque, null)) return -__errno_location().*;
    p.* = ptr;
    return 0;
}
pub const struct_pw_proxy = opaque {
};
pub const struct_pw_context = opaque {
};
pub const struct_pw_core = opaque {
};
pub const struct_pw_registry = opaque {
};
pub const struct_pw_core_info = extern struct {
    id: u32 = 0,
    cookie: u32 = 0,
    user_name: [*c]const u8 = null,
    host_name: [*c]const u8 = null,
    version: [*c]const u8 = null,
    name: [*c]const u8 = null,
    change_mask: u64 = 0,
    props: [*c]struct_spa_dict = null,
};
pub const struct_pw_properties = extern struct {
    dict: struct_spa_dict = @import("std").mem.zeroes(struct_spa_dict),
    flags: u32 = 0,
};
pub const struct_pw_core_events = extern struct {
    version: u32 = 0,
    info: ?*const fn (data: ?*anyopaque, info: [*c]const struct_pw_core_info) callconv(.c) void = null,
    done: ?*const fn (data: ?*anyopaque, id: u32, seq: c_int) callconv(.c) void = null,
    ping: ?*const fn (data: ?*anyopaque, id: u32, seq: c_int) callconv(.c) void = null,
    @"error": ?*const fn (data: ?*anyopaque, id: u32, seq: c_int, res: c_int, message: [*c]const u8) callconv(.c) void = null,
    remove_id: ?*const fn (data: ?*anyopaque, id: u32) callconv(.c) void = null,
    bound_id: ?*const fn (data: ?*anyopaque, id: u32, global_id: u32) callconv(.c) void = null,
    add_mem: ?*const fn (data: ?*anyopaque, id: u32, @"type": u32, fd: c_int, flags: u32) callconv(.c) void = null,
    remove_mem: ?*const fn (data: ?*anyopaque, id: u32) callconv(.c) void = null,
    bound_props: ?*const fn (data: ?*anyopaque, id: u32, global_id: u32, props: [*c]const struct_spa_dict) callconv(.c) void = null,
};
pub const struct_pw_core_methods = extern struct {
    version: u32 = 0,
    add_listener: ?*const fn (object: ?*anyopaque, listener: [*c]struct_spa_hook, events: [*c]const struct_pw_core_events, data: ?*anyopaque) callconv(.c) c_int = null,
    hello: ?*const fn (object: ?*anyopaque, version: u32) callconv(.c) c_int = null,
    sync: ?*const fn (object: ?*anyopaque, id: u32, seq: c_int) callconv(.c) c_int = null,
    pong: ?*const fn (object: ?*anyopaque, id: u32, seq: c_int) callconv(.c) c_int = null,
    @"error": ?*const fn (object: ?*anyopaque, id: u32, seq: c_int, res: c_int, message: [*c]const u8) callconv(.c) c_int = null,
    get_registry: ?*const fn (object: ?*anyopaque, version: u32, user_data_size: usize) callconv(.c) ?*struct_pw_registry = null,
    create_object: ?*const fn (object: ?*anyopaque, factory_name: [*c]const u8, @"type": [*c]const u8, version: u32, props: [*c]const struct_spa_dict, user_data_size: usize) callconv(.c) ?*anyopaque = null,
    destroy: ?*const fn (object: ?*anyopaque, proxy: ?*anyopaque) callconv(.c) c_int = null,
};
pub fn pw_core_add_listener(object: ?*struct_pw_core, listener: [*c]struct_spa_hook, events: [*c]const struct_pw_core_events, data: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return blk: {
        var _res: c_int = -EOPNOTSUPP;
        _ = &_res;
        var _i: [*c]struct_spa_interface = @ptrCast(@alignCast(object));
        _ = &_i;
        {
            var _f: [*c]const struct_pw_core_methods = @ptrCast(@alignCast((&_i.*.cb).*.funcs));
            _ = &_f;
            if (__builtin.expect(@as(c_long, @intFromBool(!!(((_f != null) and ((@as(c_int, 0) == @as(c_int, 0)) or (_f.*.version > @as(u32, @bitCast(@as(c_int, @as(c_int, 0) - @as(c_int, 1))))))) and (_f.*.add_listener != null)))), @as(c_long, 1)) != 0) {
                _res = _f.*.add_listener.?((&_i.*.cb).*.data, listener, events, data);
            }
            _ = &_res;
        }
        break :blk _res;
    };
}
pub fn pw_core_sync(object: ?*struct_pw_core, id: u32, seq: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return blk: {
        var _res: c_int = -EOPNOTSUPP;
        _ = &_res;
        var _i: [*c]struct_spa_interface = @ptrCast(@alignCast(object));
        _ = &_i;
        {
            var _f: [*c]const struct_pw_core_methods = @ptrCast(@alignCast((&_i.*.cb).*.funcs));
            _ = &_f;
            if (__builtin.expect(@as(c_long, @intFromBool(!!(((_f != null) and ((@as(c_int, 0) == @as(c_int, 0)) or (_f.*.version > @as(u32, @bitCast(@as(c_int, @as(c_int, 0) - @as(c_int, 1))))))) and (_f.*.sync != null)))), @as(c_long, 1)) != 0) {
                _res = _f.*.sync.?((&_i.*.cb).*.data, id, seq);
            }
            _ = &_res;
        }
        break :blk _res;
    };
}
pub fn pw_core_get_registry(core: ?*struct_pw_core, version: u32, user_data_size: usize) callconv(.c) ?*struct_pw_registry {
    @setEvalBranchQuota(100000);
    return blk: {
        var _res: ?*struct_pw_registry = null;
        _ = &_res;
        var _i: [*c]struct_spa_interface = @ptrCast(@alignCast(core));
        _ = &_i;
        {
            var _f: [*c]const struct_pw_core_methods = @ptrCast(@alignCast((&_i.*.cb).*.funcs));
            _ = &_f;
            if (__builtin.expect(@as(c_long, @intFromBool(!!(((_f != null) and ((@as(c_int, 0) == @as(c_int, 0)) or (_f.*.version > @as(u32, @bitCast(@as(c_int, @as(c_int, 0) - @as(c_int, 1))))))) and (_f.*.get_registry != null)))), @as(c_long, 1)) != 0) {
                _res = _f.*.get_registry.?((&_i.*.cb).*.data, version, user_data_size);
            }
            _ = &_res;
        }
        break :blk _res;
    };
}
pub const struct_pw_registry_events = extern struct {
    version: u32 = 0,
    global: ?*const fn (data: ?*anyopaque, id: u32, permissions: u32, @"type": [*c]const u8, version: u32, props: [*c]const struct_spa_dict) callconv(.c) void = null,
    global_remove: ?*const fn (data: ?*anyopaque, id: u32) callconv(.c) void = null,
};
pub const struct_pw_registry_methods = extern struct {
    version: u32 = 0,
    add_listener: ?*const fn (object: ?*anyopaque, listener: [*c]struct_spa_hook, events: [*c]const struct_pw_registry_events, data: ?*anyopaque) callconv(.c) c_int = null,
    bind: ?*const fn (object: ?*anyopaque, id: u32, @"type": [*c]const u8, version: u32, use_data_size: usize) callconv(.c) ?*anyopaque = null,
    destroy: ?*const fn (object: ?*anyopaque, id: u32) callconv(.c) c_int = null,
};
pub fn pw_registry_add_listener(registry: ?*struct_pw_registry, listener: [*c]struct_spa_hook, events: [*c]const struct_pw_registry_events, data: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return blk: {
        var _res: c_int = -EOPNOTSUPP;
        _ = &_res;
        var _i: [*c]struct_spa_interface = @ptrCast(@alignCast(registry));
        _ = &_i;
        {
            var _f: [*c]const struct_pw_registry_methods = @ptrCast(@alignCast((&_i.*.cb).*.funcs));
            _ = &_f;
            if (__builtin.expect(@as(c_long, @intFromBool(!!(((_f != null) and ((@as(c_int, 0) == @as(c_int, 0)) or (_f.*.version > @as(u32, @bitCast(@as(c_int, @as(c_int, 0) - @as(c_int, 1))))))) and (_f.*.add_listener != null)))), @as(c_long, 1)) != 0) {
                _res = _f.*.add_listener.?((&_i.*.cb).*.data, listener, events, data);
            }
            _ = &_res;
        }
        break :blk _res;
    };
}
pub fn pw_registry_bind(registry: ?*struct_pw_registry, id: u32, arg_type: [*c]const u8, version: u32, user_data_size: usize) callconv(.c) ?*anyopaque {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    return blk: {
        var _res: ?*anyopaque = null;
        _ = &_res;
        var _i: [*c]struct_spa_interface = @ptrCast(@alignCast(registry));
        _ = &_i;
        {
            var _f: [*c]const struct_pw_registry_methods = @ptrCast(@alignCast((&_i.*.cb).*.funcs));
            _ = &_f;
            if (__builtin.expect(@as(c_long, @intFromBool(!!(((_f != null) and ((@as(c_int, 0) == @as(c_int, 0)) or (_f.*.version > @as(u32, @bitCast(@as(c_int, @as(c_int, 0) - @as(c_int, 1))))))) and (_f.*.bind != null)))), @as(c_long, 1)) != 0) {
                _res = _f.*.bind.?((&_i.*.cb).*.data, id, @"type", version, user_data_size);
            }
            _ = &_res;
        }
        break :blk _res;
    };
}
pub extern fn time(__timer: [*c]time_t) time_t;
pub const struct_spa_system = extern struct {
    iface: struct_spa_interface = @import("std").mem.zeroes(struct_spa_interface),
};
pub const struct_spa_loop = extern struct {
    iface: struct_spa_interface = @import("std").mem.zeroes(struct_spa_interface),
};
pub const struct_spa_loop_control = extern struct {
    iface: struct_spa_interface = @import("std").mem.zeroes(struct_spa_interface),
};
pub const struct_spa_loop_utils = extern struct {
    iface: struct_spa_interface = @import("std").mem.zeroes(struct_spa_interface),
};
pub const struct_pw_loop = extern struct {
    system: [*c]struct_spa_system = null,
    loop: [*c]struct_spa_loop = null,
    control: [*c]struct_spa_loop_control = null,
    utils: [*c]struct_spa_loop_utils = null,
    name: [*c]const u8 = null,
};
pub const struct_pw_proxy_events = extern struct {
    version: u32 = 0,
    destroy: ?*const fn (data: ?*anyopaque) callconv(.c) void = null,
    bound: ?*const fn (data: ?*anyopaque, global_id: u32) callconv(.c) void = null,
    removed: ?*const fn (data: ?*anyopaque) callconv(.c) void = null,
    done: ?*const fn (data: ?*anyopaque, seq: c_int) callconv(.c) void = null,
    @"error": ?*const fn (data: ?*anyopaque, seq: c_int, res: c_int, message: [*c]const u8) callconv(.c) void = null,
    bound_props: ?*const fn (data: ?*anyopaque, global_id: u32, props: [*c]const struct_spa_dict) callconv(.c) void = null,
};
pub const struct_spa_meta = extern struct {
    type: u32 = 0,
    size: u32 = 0,
    data: ?*anyopaque = null,
};
pub const struct_spa_chunk = extern struct {
    offset: u32 = 0,
    size: u32 = 0,
    stride: i32 = 0,
    flags: i32 = 0,
};
pub const struct_spa_data = extern struct {
    type: u32 = 0,
    flags: u32 = 0,
    fd: i64 = 0,
    mapoffset: u32 = 0,
    maxsize: u32 = 0,
    data: ?*anyopaque = null,
    chunk: [*c]struct_spa_chunk = null,
};
pub const struct_spa_buffer = extern struct {
    n_metas: u32 = 0,
    n_datas: u32 = 0,
    metas: [*c]struct_spa_meta = null,
    datas: [*c]struct_spa_data = null,
};
pub const struct_spa_command_body = extern struct {
    body: struct_spa_pod_object_body = @import("std").mem.zeroes(struct_spa_pod_object_body),
};
pub const struct_spa_command = extern struct {
    pod: struct_spa_pod = @import("std").mem.zeroes(struct_spa_pod),
    body: struct_spa_command_body = @import("std").mem.zeroes(struct_spa_command_body),
};
pub const struct_pw_main_loop = opaque {
};
pub const struct_pw_node = opaque {
};
pub const enum_pw_node_state = c_int;
pub const struct_pw_node_info = extern struct {
    id: u32 = 0,
    max_input_ports: u32 = 0,
    max_output_ports: u32 = 0,
    change_mask: u64 = 0,
    n_input_ports: u32 = 0,
    n_output_ports: u32 = 0,
    state: enum_pw_node_state = @import("std").mem.zeroes(enum_pw_node_state),
    @"error": [*c]const u8 = null,
    props: [*c]struct_spa_dict = null,
    params: [*c]struct_spa_param_info = null,
    n_params: u32 = 0,
};
pub const struct_pw_node_events = extern struct {
    version: u32 = 0,
    info: ?*const fn (data: ?*anyopaque, info: [*c]const struct_pw_node_info) callconv(.c) void = null,
    param: ?*const fn (data: ?*anyopaque, seq: c_int, id: u32, index: u32, next: u32, param: [*c]const struct_spa_pod) callconv(.c) void = null,
};
pub const struct_pw_node_methods = extern struct {
    version: u32 = 0,
    add_listener: ?*const fn (object: ?*anyopaque, listener: [*c]struct_spa_hook, events: [*c]const struct_pw_node_events, data: ?*anyopaque) callconv(.c) c_int = null,
    subscribe_params: ?*const fn (object: ?*anyopaque, ids: [*c]u32, n_ids: u32) callconv(.c) c_int = null,
    enum_params: ?*const fn (object: ?*anyopaque, seq: c_int, id: u32, start: u32, num: u32, filter: [*c]const struct_spa_pod) callconv(.c) c_int = null,
    set_param: ?*const fn (object: ?*anyopaque, id: u32, flags: u32, param: [*c]const struct_spa_pod) callconv(.c) c_int = null,
    send_command: ?*const fn (object: ?*anyopaque, command: [*c]const struct_spa_command) callconv(.c) c_int = null,
};
pub fn pw_node_enum_params(object: ?*struct_pw_node, seq: c_int, id: u32, start: u32, num: u32, filter: [*c]const struct_spa_pod) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return blk: {
        var _res: c_int = -EOPNOTSUPP;
        _ = &_res;
        var _i: [*c]struct_spa_interface = @ptrCast(@alignCast(object));
        _ = &_i;
        {
            var _f: [*c]const struct_pw_node_methods = @ptrCast(@alignCast((&_i.*.cb).*.funcs));
            _ = &_f;
            if (__builtin.expect(@as(c_long, @intFromBool(!!(((_f != null) and ((@as(c_int, 0) == @as(c_int, 0)) or (_f.*.version > @as(u32, @bitCast(@as(c_int, @as(c_int, 0) - @as(c_int, 1))))))) and (_f.*.enum_params != null)))), @as(c_long, 1)) != 0) {
                _res = _f.*.enum_params.?((&_i.*.cb).*.data, seq, id, start, num, filter);
            }
            _ = &_res;
        }
        break :blk _res;
    };
}
pub const PW_STREAM_STATE_UNCONNECTED: c_int = 0;
pub const PW_STREAM_STATE_STREAMING: c_int = 3;
pub const enum_pw_stream_state = c_int;
pub const struct_pw_buffer = extern struct {
    buffer: [*c]struct_spa_buffer = null,
    user_data: ?*anyopaque = null,
    size: u64 = 0,
    requested: u64 = 0,
    time: u64 = 0,
};
pub const struct_pw_stream_control = extern struct {
    name: [*c]const u8 = null,
    flags: u32 = 0,
    def: f32 = 0,
    min: f32 = 0,
    max: f32 = 0,
    values: [*c]f32 = null,
    n_values: u32 = 0,
    max_values: u32 = 0,
};
pub const struct_pw_stream_events = extern struct {
    version: u32 = 0,
    destroy: ?*const fn (data: ?*anyopaque) callconv(.c) void = null,
    state_changed: ?*const fn (data: ?*anyopaque, old: enum_pw_stream_state, state: enum_pw_stream_state, @"error": [*c]const u8) callconv(.c) void = null,
    control_info: ?*const fn (data: ?*anyopaque, id: u32, control: [*c]const struct_pw_stream_control) callconv(.c) void = null,
    io_changed: ?*const fn (data: ?*anyopaque, id: u32, area: ?*anyopaque, size: u32) callconv(.c) void = null,
    param_changed: ?*const fn (data: ?*anyopaque, id: u32, param: [*c]const struct_spa_pod) callconv(.c) void = null,
    add_buffer: ?*const fn (data: ?*anyopaque, buffer: [*c]struct_pw_buffer) callconv(.c) void = null,
    remove_buffer: ?*const fn (data: ?*anyopaque, buffer: [*c]struct_pw_buffer) callconv(.c) void = null,
    process: ?*const fn (data: ?*anyopaque) callconv(.c) void = null,
    drained: ?*const fn (data: ?*anyopaque) callconv(.c) void = null,
    command: ?*const fn (data: ?*anyopaque, command: [*c]const struct_spa_command) callconv(.c) void = null,
    trigger_done: ?*const fn (data: ?*anyopaque) callconv(.c) void = null,
};
pub const PW_STREAM_FLAG_AUTOCONNECT: c_int = 1;
pub const PW_STREAM_FLAG_MAP_BUFFERS: c_int = 4;
pub const enum_pw_stream_flags = c_uint;
pub const struct_pw_thread_loop = opaque {
};
pub var pipewire_initialized: bool = @"false" != 0;
pub var PIPEWIRE_pw_get_library_version: ?*const fn () callconv(.c) [*c]const u8 = null;
pub var PIPEWIRE_pw_check_library_version: ?*const fn (major: c_int, minor: c_int, micro: c_int) callconv(.c) bool = null;
pub var PIPEWIRE_pw_init: ?*const fn ([*c]c_int, [*c][*c][*c]u8) callconv(.c) void = null;
pub var PIPEWIRE_pw_deinit: ?*const fn () callconv(.c) void = null;
pub var PIPEWIRE_pw_main_loop_new: ?*const fn (loop: [*c]const struct_spa_dict) callconv(.c) ?*struct_pw_main_loop = null;
pub var PIPEWIRE_pw_main_loop_get_loop: ?*const fn (loop: ?*struct_pw_main_loop) callconv(.c) [*c]struct_pw_loop = null;
pub var PIPEWIRE_pw_main_loop_run: ?*const fn (loop: ?*struct_pw_main_loop) callconv(.c) c_int = null;
pub var PIPEWIRE_pw_main_loop_quit: ?*const fn (loop: ?*struct_pw_main_loop) callconv(.c) c_int = null;
pub var PIPEWIRE_pw_main_loop_destroy: ?*const fn (loop: ?*struct_pw_main_loop) callconv(.c) void = null;
pub var PIPEWIRE_pw_thread_loop_new: ?*const fn ([*c]const u8, [*c]const struct_spa_dict) callconv(.c) ?*struct_pw_thread_loop = null;
pub var PIPEWIRE_pw_thread_loop_destroy: ?*const fn (?*struct_pw_thread_loop) callconv(.c) void = null;
pub var PIPEWIRE_pw_thread_loop_stop: ?*const fn (?*struct_pw_thread_loop) callconv(.c) void = null;
pub var PIPEWIRE_pw_thread_loop_get_loop: ?*const fn (?*struct_pw_thread_loop) callconv(.c) [*c]struct_pw_loop = null;
pub var PIPEWIRE_pw_thread_loop_lock: ?*const fn (?*struct_pw_thread_loop) callconv(.c) void = null;
pub var PIPEWIRE_pw_thread_loop_unlock: ?*const fn (?*struct_pw_thread_loop) callconv(.c) void = null;
pub var PIPEWIRE_pw_thread_loop_signal: ?*const fn (?*struct_pw_thread_loop, bool) callconv(.c) void = null;
pub var PIPEWIRE_pw_thread_loop_wait: ?*const fn (?*struct_pw_thread_loop) callconv(.c) void = null;
pub var PIPEWIRE_pw_thread_loop_start: ?*const fn (?*struct_pw_thread_loop) callconv(.c) c_int = null;
pub var PIPEWIRE_pw_context_new: ?*const fn ([*c]struct_pw_loop, [*c]struct_pw_properties, usize) callconv(.c) ?*struct_pw_context = null;
pub var PIPEWIRE_pw_context_destroy: ?*const fn (?*struct_pw_context) callconv(.c) void = null;
pub var PIPEWIRE_pw_context_connect: ?*const fn (?*struct_pw_context, [*c]struct_pw_properties, usize) callconv(.c) ?*struct_pw_core = null;
pub var PIPEWIRE_pw_context_connect_fd: ?*const fn (?*struct_pw_context, c_int, [*c]struct_pw_properties, usize) callconv(.c) ?*struct_pw_core = null;
pub var PIPEWIRE_pw_proxy_add_object_listener: ?*const fn (?*struct_pw_proxy, [*c]struct_spa_hook, ?*const anyopaque, ?*anyopaque) callconv(.c) void = null;
pub var PIPEWIRE_pw_proxy_add_listener: ?*const fn (?*struct_pw_proxy, [*c]struct_spa_hook, [*c]const struct_pw_proxy_events, ?*anyopaque) callconv(.c) void = null;
pub var PIPEWIRE_pw_proxy_get_user_data: ?*const fn (?*struct_pw_proxy) callconv(.c) ?*anyopaque = null;
pub var PIPEWIRE_pw_proxy_destroy: ?*const fn (?*struct_pw_proxy) callconv(.c) void = null;
pub var PIPEWIRE_pw_core_disconnect: ?*const fn (?*struct_pw_core) callconv(.c) c_int = null;
pub var PIPEWIRE_pw_node_info_merge: ?*const fn (info: [*c]struct_pw_node_info, update: [*c]const struct_pw_node_info, reset: bool) callconv(.c) [*c]struct_pw_node_info = null;
pub var PIPEWIRE_pw_node_info_free: ?*const fn (info: [*c]struct_pw_node_info) callconv(.c) void = null;
pub var PIPEWIRE_pw_stream_new: ?*const fn (?*struct_pw_core, [*c]const u8, [*c]struct_pw_properties) callconv(.c) ?*struct_pw_stream = null;
pub var PIPEWIRE_pw_stream_add_listener: ?*const fn (stream: ?*struct_pw_stream, listener: [*c]struct_spa_hook, events: [*c]const struct_pw_stream_events, data: ?*anyopaque) callconv(.c) void = null;
pub var PIPEWIRE_pw_stream_destroy: ?*const fn (?*struct_pw_stream) callconv(.c) void = null;
pub var PIPEWIRE_pw_stream_connect: ?*const fn (?*struct_pw_stream, enum_spa_direction, u32, enum_pw_stream_flags, [*c][*c]const struct_spa_pod, u32) callconv(.c) c_int = null;
pub var PIPEWIRE_pw_stream_get_state: ?*const fn (stream: ?*struct_pw_stream, @"error": [*c][*c]const u8) callconv(.c) enum_pw_stream_state = null;
pub var PIPEWIRE_pw_stream_dequeue_buffer: ?*const fn (?*struct_pw_stream) callconv(.c) [*c]struct_pw_buffer = null;
pub var PIPEWIRE_pw_stream_queue_buffer: ?*const fn (?*struct_pw_stream, [*c]struct_pw_buffer) callconv(.c) c_int = null;
pub var PIPEWIRE_pw_properties_new: ?*const fn ([*c]const u8, ...) callconv(.c) [*c]struct_pw_properties = null;
pub var PIPEWIRE_pw_properties_new_dict: ?*const fn (dict: [*c]const struct_spa_dict) callconv(.c) [*c]struct_pw_properties = null;
pub var PIPEWIRE_pw_properties_set: ?*const fn ([*c]struct_pw_properties, [*c]const u8, [*c]const u8) callconv(.c) c_int = null;
pub var PIPEWIRE_pw_properties_setf: ?*const fn ([*c]struct_pw_properties, [*c]const u8, [*c]const u8, ...) callconv(.c) c_int = null;
pub var pipewire_library: [*c]const u8 = "libpipewire-0.3.so.0";
pub var pipewire_handle: ?*SDL_SharedObject = null;
pub fn pipewire_dlsym(arg_fn: [*c]const u8, addr: [*c]?*anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var @"fn" = arg_fn;
    _ = &@"fn";
    addr.* = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(pipewire_handle, @"fn"))));
    if (!(addr.* != null)) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn load_pipewire_library() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    pipewire_handle = SDL_LoadObject_REAL(pipewire_library);
    return (if (pipewire_handle != null) @"true" else @"false") != 0;
}
pub fn unload_pipewire_library() callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (pipewire_handle != null) {
        SDL_UnloadObject_REAL(pipewire_handle);
        pipewire_handle = null;
    }
}
pub fn load_pipewire_syms() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (!pipewire_dlsym("pw_get_library_version", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_get_library_version))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_check_library_version", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_check_library_version))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_init", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_init))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_deinit", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_deinit))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_main_loop_new", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_main_loop_new))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_main_loop_get_loop", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_main_loop_get_loop))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_main_loop_run", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_main_loop_run))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_main_loop_quit", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_main_loop_quit))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_main_loop_destroy", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_main_loop_destroy))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_thread_loop_new", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_thread_loop_new))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_thread_loop_destroy", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_thread_loop_destroy))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_thread_loop_stop", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_thread_loop_stop))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_thread_loop_get_loop", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_thread_loop_get_loop))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_thread_loop_lock", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_thread_loop_lock))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_thread_loop_unlock", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_thread_loop_unlock))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_thread_loop_signal", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_thread_loop_signal))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_thread_loop_wait", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_thread_loop_wait))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_thread_loop_start", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_thread_loop_start))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_context_new", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_context_new))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_context_destroy", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_context_destroy))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_context_connect", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_context_connect))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_context_connect_fd", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_context_connect_fd))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_proxy_add_listener", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_proxy_add_listener))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_proxy_add_object_listener", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_proxy_add_object_listener))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_proxy_get_user_data", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_proxy_get_user_data))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_proxy_destroy", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_proxy_destroy))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_core_disconnect", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_core_disconnect))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_node_info_merge", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_node_info_merge))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_node_info_free", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_node_info_free))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_stream_new", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_stream_new))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_stream_add_listener", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_stream_add_listener))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_stream_destroy", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_stream_destroy))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_stream_connect", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_stream_connect))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_stream_get_state", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_stream_get_state))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_stream_dequeue_buffer", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_stream_dequeue_buffer))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_stream_queue_buffer", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_stream_queue_buffer))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_properties_new", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_properties_new))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_properties_new_dict", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_properties_new_dict))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_properties_set", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_properties_set))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_properties_setf", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_properties_setf))))))) return @"false" != 0;
    return @"true" != 0;
}
pub fn init_pipewire_library() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (load_pipewire_library()) {
        if (load_pipewire_syms()) {
            PIPEWIRE_pw_init.?(null, null);
            return @"true" != 0;
        }
    }
    return @"false" != 0;
}
pub fn deinit_pipewire_library() callconv(.c) void {
    @setEvalBranchQuota(100000);
    PIPEWIRE_pw_deinit.?();
    unload_pipewire_library();
}
const struct_unnamed_53 = extern struct {
    loop: ?*struct_pw_thread_loop = null,
    context: ?*struct_pw_context = null,
    core: ?*struct_pw_core = null,
    core_listener: struct_spa_hook = @import("std").mem.zeroes(struct_spa_hook),
    server_major: c_int = 0,
    server_minor: c_int = 0,
    server_patch: c_int = 0,
    last_seq: c_int = 0,
    pending_seq: c_int = 0,
    registry: ?*struct_pw_registry = null,
    registry_listener: struct_spa_hook = @import("std").mem.zeroes(struct_spa_hook),
    global_list: struct_spa_list = @import("std").mem.zeroes(struct_spa_list),
    have_1_0_5: bool = false,
    init_complete: bool = false,
    events_enabled: bool = false,
};
pub var hotplug: struct_unnamed_53 = @import("std").mem.zeroes(struct_unnamed_53);
pub const struct_global_class = extern struct {
    type: [*c]const u8 = null,
    version: u32 = 0,
    events: ?*const anyopaque = null,
    init: ?*const fn (g: [*c]struct_global) callconv(.c) c_int = null,
    destroy: ?*const fn (g: [*c]struct_global) callconv(.c) void = null,
};
pub const struct_global = extern struct {
    link: struct_spa_list = @import("std").mem.zeroes(struct_spa_list),
    class: [*c]const struct_global_class = null,
    id: u32 = 0,
    permissions: u32 = 0,
    props: [*c]struct_pw_properties = null,
    name: [*c]u8 = null,
    proxy: ?*struct_pw_proxy = null,
    proxy_listener: struct_spa_hook = @import("std").mem.zeroes(struct_spa_hook),
    object_listener: struct_spa_hook = @import("std").mem.zeroes(struct_spa_hook),
    changed: c_int = 0,
    info: ?*anyopaque = null,
    pending_list: struct_spa_list = @import("std").mem.zeroes(struct_spa_list),
    param_list: struct_spa_list = @import("std").mem.zeroes(struct_spa_list),
    added: bool = false,
};
pub const struct_param = extern struct {
    id: u32 = 0,
    seq: i32 = 0,
    link: struct_spa_list = @import("std").mem.zeroes(struct_spa_list),
    param: [*c]struct_spa_pod = null,
};
pub fn param_clear(param_list: [*c]struct_spa_list, id: u32) callconv(.c) u32 {
    @setEvalBranchQuota(100000);
    var p: [*c]struct_param = undefined;
    _ = &p;
    var t: [*c]struct_param = undefined;
    _ = &t;
    var count: u32 = 0;
    _ = &count;
    {
        p = @as([*c]@TypeOf(p.*), @ptrFromInt(@as(usize, @intCast(@intFromPtr(param_list.*.next))) -% @intFromPtr(&@as(*allowzero @TypeOf(p.*), @ptrFromInt(0)).link)));
        while ((blk: {
            t = @as([*c]@TypeOf(p.*), @ptrFromInt(@as(usize, @intCast(@intFromPtr(p.*.link.next))) -% @intFromPtr(&@as(*allowzero @TypeOf(p.*), @ptrFromInt(0)).link)));
            break :blk @intFromBool(!((&p.*.link) == param_list));
        }) != 0) : (p = t) {
            if ((id == @as(c_uint, 4294967295)) or (p.*.id == id)) {
                spa_list_remove(&p.*.link);
                free(@ptrCast(@alignCast(p)));
                count +%= 1;
            }
        }
    }
    return count;
}
pub fn param_add(params: [*c]struct_spa_list, seq: c_int, arg_id: u32, param_1: [*c]const struct_spa_pod) callconv(.c) [*c]struct_param {
    @setEvalBranchQuota(100000);
    var id = arg_id;
    _ = &id;
    var p: [*c]struct_param = undefined;
    _ = &p;
    if (id == @as(c_uint, 4294967295)) {
        if ((@as(?*anyopaque, @ptrCast(@alignCast(@constCast(param_1)))) == @as(?*anyopaque, null)) or !(spa_pod_is_object(param_1) != 0)) {
            __errno_location().* = EINVAL;
            return null;
        }
        id = @as([*c]struct_spa_pod_object, @ptrCast(@alignCast(@constCast(param_1)))).*.body.id;
    }
    p = @ptrCast(@alignCast(malloc(@sizeOf(@TypeOf(p.*)) +% (if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(param_1)))) != @as(?*anyopaque, null)) @sizeOf(struct_spa_pod) +% @as(u64, @as([*c]struct_spa_pod, @ptrCast(@alignCast(@constCast(param_1)))).*.size) else @as(u64, 0)))));
    if (@as(?*anyopaque, @ptrCast(@alignCast(p))) == @as(?*anyopaque, null)) return null;
    p.*.id = id;
    p.*.seq = seq;
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(param_1)))) != @as(?*anyopaque, null)) {
        p.*.param = @as([*c]struct_spa_pod, @ptrFromInt(@as(usize, @intCast(@intFromPtr(p))) +% @as(usize, @bitCast(@as(c_long, @as(ptrdiff_t, @bitCast(@as(c_ulong, @truncate(@sizeOf(@TypeOf(p.*)))))))))));
        _ = memcpy(@ptrCast(@alignCast(p.*.param)), @ptrCast(@alignCast(param_1)), @sizeOf(struct_spa_pod) +% @as(u64, @as([*c]struct_spa_pod, @ptrCast(@alignCast(@constCast(param_1)))).*.size));
    } else {
        _ = param_clear(params, id);
        p.*.param = null;
    }
    spa_list_insert(params.*.prev, &p.*.link);
    return p;
}
pub fn param_update(param_list: [*c]struct_spa_list, pending_list: [*c]struct_spa_list, n_params: u32, params: [*c]struct_spa_param_info) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var p: [*c]struct_param = undefined;
    _ = &p;
    var t: [*c]struct_param = undefined;
    _ = &t;
    var i: u32 = undefined;
    _ = &i;
    {
        i = 0;
        while (i < n_params) : (i +%= 1) {
            {
                p = @as([*c]@TypeOf(p.*), @ptrFromInt(@as(usize, @intCast(@intFromPtr(pending_list.*.next))) -% @intFromPtr(&@as(*allowzero @TypeOf(p.*), @ptrFromInt(0)).link)));
                while ((blk: {
                    t = @as([*c]@TypeOf(p.*), @ptrFromInt(@as(usize, @intCast(@intFromPtr(p.*.link.next))) -% @intFromPtr(&@as(*allowzero @TypeOf(p.*), @ptrFromInt(0)).link)));
                    break :blk @intFromBool(!((&p.*.link) == pending_list));
                }) != 0) : (p = t) {
                    if (((p.*.id == params[i].id) and (p.*.seq != params[i].seq)) and (@as(?*anyopaque, @ptrCast(@alignCast(p.*.param))) != @as(?*anyopaque, null))) {
                        spa_list_remove(&p.*.link);
                        free(@ptrCast(@alignCast(p)));
                    }
                }
            }
        }
    }
    {
        p = @as([*c]@TypeOf(p.*), @ptrFromInt(@as(usize, @intCast(@intFromPtr(pending_list.*.next))) -% @intFromPtr(&@as(*allowzero @TypeOf(p.*), @ptrFromInt(0)).link)));
        while (!(pending_list.*.next == pending_list)) : (p = @as([*c]@TypeOf(p.*), @ptrFromInt(@as(usize, @intCast(@intFromPtr(pending_list.*.next))) -% @intFromPtr(&@as(*allowzero @TypeOf(p.*), @ptrFromInt(0)).link)))) {
            spa_list_remove(&p.*.link);
            if (@as(?*anyopaque, @ptrCast(@alignCast(p.*.param))) == @as(?*anyopaque, null)) {
                _ = param_clear(param_list, p.*.id);
                free(@ptrCast(@alignCast(p)));
            } else {
                spa_list_insert(param_list.*.prev, &p.*.link);
            }
        }
    }
}
pub const struct_sdl_video_format = extern struct {
    format: SDL_PixelFormat = @import("std").mem.zeroes(SDL_PixelFormat),
    colorspace: SDL_Colorspace = @import("std").mem.zeroes(SDL_Colorspace),
    id: u32 = 0,
};
pub var sdl_video_formats: [17]struct_sdl_video_format = [17]struct_sdl_video_format{
    struct_sdl_video_format{
        .format = SDL_PIXELFORMAT_RGBX32,
        .colorspace = SDL_COLORSPACE_SRGB,
        .id = SPA_VIDEO_FORMAT_RGBx,
    },
    struct_sdl_video_format{
        .format = SDL_PIXELFORMAT_XRGB32,
        .colorspace = SDL_COLORSPACE_SRGB,
        .id = SPA_VIDEO_FORMAT_xRGB,
    },
    struct_sdl_video_format{
        .format = SDL_PIXELFORMAT_BGRX32,
        .colorspace = SDL_COLORSPACE_SRGB,
        .id = SPA_VIDEO_FORMAT_BGRx,
    },
    struct_sdl_video_format{
        .format = SDL_PIXELFORMAT_XBGR32,
        .colorspace = SDL_COLORSPACE_SRGB,
        .id = SPA_VIDEO_FORMAT_xBGR,
    },
    struct_sdl_video_format{
        .format = SDL_PIXELFORMAT_RGBA32,
        .colorspace = SDL_COLORSPACE_SRGB,
        .id = SPA_VIDEO_FORMAT_RGBA,
    },
    struct_sdl_video_format{
        .format = SDL_PIXELFORMAT_ARGB32,
        .colorspace = SDL_COLORSPACE_SRGB,
        .id = SPA_VIDEO_FORMAT_ARGB,
    },
    struct_sdl_video_format{
        .format = SDL_PIXELFORMAT_BGRA32,
        .colorspace = SDL_COLORSPACE_SRGB,
        .id = SPA_VIDEO_FORMAT_BGRA,
    },
    struct_sdl_video_format{
        .format = SDL_PIXELFORMAT_ABGR32,
        .colorspace = SDL_COLORSPACE_SRGB,
        .id = SPA_VIDEO_FORMAT_ABGR,
    },
    struct_sdl_video_format{
        .format = SDL_PIXELFORMAT_RGB24,
        .colorspace = SDL_COLORSPACE_SRGB,
        .id = SPA_VIDEO_FORMAT_RGB,
    },
    struct_sdl_video_format{
        .format = SDL_PIXELFORMAT_BGR24,
        .colorspace = SDL_COLORSPACE_SRGB,
        .id = SPA_VIDEO_FORMAT_BGR,
    },
    struct_sdl_video_format{
        .format = SDL_PIXELFORMAT_YV12,
        .colorspace = SDL_COLORSPACE_BT709_LIMITED,
        .id = SPA_VIDEO_FORMAT_YV12,
    },
    struct_sdl_video_format{
        .format = SDL_PIXELFORMAT_IYUV,
        .colorspace = SDL_COLORSPACE_BT709_LIMITED,
        .id = SPA_VIDEO_FORMAT_I420,
    },
    struct_sdl_video_format{
        .format = SDL_PIXELFORMAT_YUY2,
        .colorspace = SDL_COLORSPACE_BT709_LIMITED,
        .id = SPA_VIDEO_FORMAT_YUY2,
    },
    struct_sdl_video_format{
        .format = SDL_PIXELFORMAT_UYVY,
        .colorspace = SDL_COLORSPACE_BT709_LIMITED,
        .id = SPA_VIDEO_FORMAT_UYVY,
    },
    struct_sdl_video_format{
        .format = SDL_PIXELFORMAT_YVYU,
        .colorspace = SDL_COLORSPACE_BT709_LIMITED,
        .id = SPA_VIDEO_FORMAT_YVYU,
    },
    struct_sdl_video_format{
        .format = SDL_PIXELFORMAT_NV12,
        .colorspace = SDL_COLORSPACE_BT709_LIMITED,
        .id = SPA_VIDEO_FORMAT_NV12,
    },
    struct_sdl_video_format{
        .format = SDL_PIXELFORMAT_NV21,
        .colorspace = SDL_COLORSPACE_BT709_LIMITED,
        .id = SPA_VIDEO_FORMAT_NV21,
    },
};
pub fn sdl_format_to_id(format: SDL_PixelFormat) callconv(.c) u32 {
    @setEvalBranchQuota(100000);
    var f: [*c]struct_sdl_video_format = undefined;
    _ = &f;
    {
        f = @ptrCast(@alignCast(&sdl_video_formats));
        while (f < (@as([*c]struct_sdl_video_format, @ptrCast(@alignCast(&sdl_video_formats))) + (@sizeOf(@TypeOf(sdl_video_formats)) / @sizeOf(@TypeOf(sdl_video_formats[@as(c_int, 0)]))))) : (f += 1) {
            if (f.*.format == format) return f.*.id;
        }
    }
    return SPA_VIDEO_FORMAT_UNKNOWN;
}
pub fn id_to_sdl_format(id: u32, format: [*c]SDL_PixelFormat, colorspace: [*c]SDL_Colorspace) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var f: [*c]struct_sdl_video_format = undefined;
    _ = &f;
    {
        f = @ptrCast(@alignCast(&sdl_video_formats));
        while (f < (@as([*c]struct_sdl_video_format, @ptrCast(@alignCast(&sdl_video_formats))) + (@sizeOf(@TypeOf(sdl_video_formats)) / @sizeOf(@TypeOf(sdl_video_formats[@as(c_int, 0)]))))) : (f += 1) {
            if (f.*.id == id) {
                format.* = f.*.format;
                colorspace.* = f.*.colorspace;
                return;
            }
        }
    }
    format.* = SDL_PIXELFORMAT_UNKNOWN;
    colorspace.* = SDL_COLORSPACE_UNKNOWN;
}
pub fn on_process(_: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    PIPEWIRE_pw_thread_loop_signal.?(hotplug.loop, @"false" != 0);
}
pub fn on_stream_state_changed(data: ?*anyopaque, _: enum_pw_stream_state, state: enum_pw_stream_state, arg_error: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var @"error" = arg_error;
    _ = &@"error";
    var device: [*c]SDL_Camera = undefined;
    _ = &device;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                device = @ptrCast(@alignCast(data));
                switch (state) {
                    PW_STREAM_STATE_UNCONNECTED => {
                        sdl_pc = 2;
                        continue;
                    },
                    PW_STREAM_STATE_STREAMING => {
                        sdl_pc = 3;
                        continue;
                    },
                    else => {
                        sdl_pc = 4;
                        continue;
                    },
                }
            },
            1 => {
                {}
            },
            2 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                SDL_CameraPermissionOutcome(device, @"true" != 0);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn on_stream_param_changed(_: ?*anyopaque, _: u32, _: [*c]const struct_spa_pod) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn on_add_buffer(data: ?*anyopaque, buffer: [*c]struct_pw_buffer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var device: [*c]SDL_Camera = @ptrCast(@alignCast(data));
    _ = &device;
    _ = pw_array_add_ptr(&device.*.hidden.*.buffers, @ptrCast(@alignCast(buffer)));
}
pub fn on_remove_buffer(data: ?*anyopaque, buffer: [*c]struct_pw_buffer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var device: [*c]SDL_Camera = @ptrCast(@alignCast(data));
    _ = &device;
    var p: [*c][*c]struct_pw_buffer = undefined;
    _ = &p;
    {
        p = @ptrCast(@alignCast((&device.*.hidden.*.buffers).*.data));
        while ((@intFromPtr(@as(?*anyopaque, @ptrFromInt(@as(usize, @intCast(@intFromPtr(p))) +% @as(usize, @bitCast(@as(c_long, @as(ptrdiff_t, @bitCast(@as(c_ulong, @truncate(@sizeOf(@TypeOf(p.*)))))))))))) <= @intFromPtr(@as(?*anyopaque, @ptrFromInt(@as(usize, @intCast(@intFromPtr((&device.*.hidden.*.buffers).*.data))) +% @as(usize, @bitCast(@as(c_long, @as(ptrdiff_t, @bitCast(@as(c_ulong, @truncate((&device.*.hidden.*.buffers).*.size)))))))))))) : (p += 1) {
            if (p.* == buffer) {
                {
                    (&device.*.hidden.*.buffers).*.size -%= @sizeOf(@TypeOf(p.*));
                    _ = memmove(@ptrCast(@alignCast(p)), @as(?*anyopaque, @ptrFromInt(@as(usize, @intCast(@intFromPtr(p))) +% @as(usize, @bitCast(@as(c_long, @as(ptrdiff_t, @bitCast(@as(c_ulong, @truncate(@sizeOf(@TypeOf(p.*))))))))))), @bitCast(@as(c_long, @as(isize, @intCast(@intFromPtr(@as(?*anyopaque, @ptrFromInt(@as(usize, @intCast(@intFromPtr((&device.*.hidden.*.buffers).*.data))) +% @as(usize, @bitCast(@as(c_long, @as(ptrdiff_t, @bitCast(@as(c_ulong, @truncate((&device.*.hidden.*.buffers).*.size)))))))))))) - @as(isize, @intCast(@intFromPtr(p))))));
                }
                return;
            }
        }
    }
}
pub const stream_events: struct_pw_stream_events = struct_pw_stream_events{
    .version = PW_VERSION_STREAM_EVENTS,
    .destroy = null,
    .state_changed = on_stream_state_changed,
    .control_info = null,
    .io_changed = null,
    .param_changed = on_stream_param_changed,
    .add_buffer = on_add_buffer,
    .remove_buffer = on_remove_buffer,
    .process = on_process,
    .drained = null,
    .command = null,
    .trigger_done = null,
};
pub fn PIPEWIRECAMERA_OpenDevice(device: [*c]SDL_Camera, spec: [*c]const SDL_CameraSpec) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var props: [*c]struct_pw_properties = undefined;
    _ = &props;
    var params: [3][*c]const struct_spa_pod = undefined;
    _ = &params;
    var res: c_int = undefined;
    _ = &res;
    var n_params: c_int = 0;
    _ = &n_params;
    var buffer: [1024]u8 = undefined;
    _ = &buffer;
    var b: struct_spa_pod_builder = @as(struct_spa_pod_builder, struct_spa_pod_builder{
        .data = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&buffer))))),
        .size = @truncate(@sizeOf(@TypeOf(buffer))),
        ._padding = 0,
        .state = struct_spa_pod_builder_state{
            .offset = 0,
            .flags = 0,
            .frame = null,
        },
        .callbacks = struct_spa_callbacks{
            .funcs = null,
            .data = null,
        },
    });
    _ = &b;
    if (!(device != null)) {
        return @"false" != 0;
    }
    device.*.hidden = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(struct_SDL_PrivateCameraData))));
    if (@as(?*anyopaque, @ptrCast(@alignCast(device.*.hidden))) == @as(?*anyopaque, null)) {
        return @"false" != 0;
    }
    pw_array_init(&device.*.hidden.*.buffers, 64);
    PIPEWIRE_pw_thread_loop_lock.?(hotplug.loop);
    props = PIPEWIRE_pw_properties_new.?("media.type", @as([*c]u8, @as([*c]u8, @constCast("Video"))), @as([*c]u8, @as([*c]u8, @constCast("media.category"))), @as([*c]u8, @as([*c]u8, @constCast("Capture"))), @as([*c]u8, @as([*c]u8, @constCast("media.role"))), @as([*c]u8, @as([*c]u8, @constCast("Camera"))), @as([*c]u8, @as([*c]u8, @constCast("target.object"))), device.*.name, @as(?*anyopaque, null));
    if (@as(?*anyopaque, @ptrCast(@alignCast(props))) == @as(?*anyopaque, null)) {
        return @"false" != 0;
    }
    device.*.hidden.*.stream = PIPEWIRE_pw_stream_new.?(hotplug.core, "SDL PipeWire Camera", props);
    if (@as(?*anyopaque, @ptrCast(@alignCast(device.*.hidden.*.stream))) == @as(?*anyopaque, null)) {
        return @"false" != 0;
    }
    PIPEWIRE_pw_stream_add_listener.?(device.*.hidden.*.stream, &device.*.hidden.*.stream_listener, &stream_events, @ptrCast(@alignCast(device)));
    if (spec.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_MJPG)) {
        params[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &n_params;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = @ptrCast(@alignCast(blk: {
            var _b: [*c]struct_spa_pod_builder = &b;
            _ = &_b;
            var _f: struct_spa_pod_frame = undefined;
            _ = &_f;
            _ = spa_pod_builder_push_object(_b, &_f, SPA_TYPE_OBJECT_Format, SPA_PARAM_EnumFormat);
            _ = spa_pod_builder_add(_b, SPA_FORMAT_mediaType, @as([*c]u8, @as([*c]u8, @constCast("I"))), SPA_MEDIA_TYPE_video, SPA_FORMAT_mediaSubtype, @as([*c]u8, @as([*c]u8, @constCast("I"))), SPA_MEDIA_SUBTYPE_mjpg, SPA_FORMAT_VIDEO_size, @as([*c]u8, @as([*c]u8, @constCast("R"))), &@as(struct_spa_rectangle, struct_spa_rectangle{
                .width = @bitCast(@as(c_int, spec.*.width)),
                .height = @bitCast(@as(c_int, spec.*.height)),
            }), SPA_FORMAT_VIDEO_framerate, @as([*c]u8, @as([*c]u8, @constCast("F"))), &@as(struct_spa_fraction, struct_spa_fraction{
                .num = @bitCast(@as(c_int, spec.*.framerate_numerator)),
                .denom = @bitCast(@as(c_int, spec.*.framerate_denominator)),
            }), @as(c_int, 0));
            break :blk spa_pod_builder_pop(_b, &_f);
        }));
    } else {
        params[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &n_params;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = @ptrCast(@alignCast(blk: {
            var _b: [*c]struct_spa_pod_builder = &b;
            _ = &_b;
            var _f: struct_spa_pod_frame = undefined;
            _ = &_f;
            _ = spa_pod_builder_push_object(_b, &_f, SPA_TYPE_OBJECT_Format, SPA_PARAM_EnumFormat);
            _ = spa_pod_builder_add(_b, SPA_FORMAT_mediaType, @as([*c]u8, @as([*c]u8, @constCast("I"))), SPA_MEDIA_TYPE_video, SPA_FORMAT_mediaSubtype, @as([*c]u8, @as([*c]u8, @constCast("I"))), SPA_MEDIA_SUBTYPE_raw, SPA_FORMAT_VIDEO_format, @as([*c]u8, @as([*c]u8, @constCast("I"))), sdl_format_to_id(spec.*.format), SPA_FORMAT_VIDEO_size, @as([*c]u8, @as([*c]u8, @constCast("R"))), &@as(struct_spa_rectangle, struct_spa_rectangle{
                .width = @bitCast(@as(c_int, spec.*.width)),
                .height = @bitCast(@as(c_int, spec.*.height)),
            }), SPA_FORMAT_VIDEO_framerate, @as([*c]u8, @as([*c]u8, @constCast("F"))), &@as(struct_spa_fraction, struct_spa_fraction{
                .num = @bitCast(@as(c_int, spec.*.framerate_numerator)),
                .denom = @bitCast(@as(c_int, spec.*.framerate_denominator)),
            }), @as(c_int, 0));
            break :blk spa_pod_builder_pop(_b, &_f);
        }));
    }
    if ((blk: {
        const tmp = PIPEWIRE_pw_stream_connect.?(device.*.hidden.*.stream, SPA_DIRECTION_INPUT, @as(c_uint, 4294967295), @bitCast(PW_STREAM_FLAG_AUTOCONNECT | PW_STREAM_FLAG_MAP_BUFFERS), @ptrCast(@alignCast(&params)), @bitCast(@as(c_int, n_params)));
        res = tmp;
        break :blk tmp;
    }) < @as(c_int, 0)) {
        return @"false" != 0;
    }
    PIPEWIRE_pw_thread_loop_unlock.?(hotplug.loop);
    return @"true" != 0;
}
pub fn PIPEWIRECAMERA_CloseDevice(device: [*c]SDL_Camera) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (!(device != null)) {
        return;
    }
    PIPEWIRE_pw_thread_loop_lock.?(hotplug.loop);
    if (device.*.hidden != null) {
        if (device.*.hidden.*.stream != null) {
            PIPEWIRE_pw_stream_destroy.?(device.*.hidden.*.stream);
        }
        pw_array_clear(&device.*.hidden.*.buffers);
        SDL_free_REAL(@ptrCast(@alignCast(device.*.hidden)));
        device.*.hidden = null;
    }
    PIPEWIRE_pw_thread_loop_unlock.?(hotplug.loop);
}
pub fn PIPEWIRECAMERA_WaitDevice(_: [*c]SDL_Camera) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    PIPEWIRE_pw_thread_loop_lock.?(hotplug.loop);
    PIPEWIRE_pw_thread_loop_wait.?(hotplug.loop);
    PIPEWIRE_pw_thread_loop_unlock.?(hotplug.loop);
    return @"true" != 0;
}
pub fn PIPEWIRECAMERA_AcquireFrame(device: [*c]SDL_Camera, frame: [*c]SDL_Surface, timestampNS: [*c]Uint64, _: [*c]f32) callconv(.c) SDL_CameraFrameResult {
    @setEvalBranchQuota(100000);
    var b: [*c]struct_pw_buffer = undefined;
    _ = &b;
    PIPEWIRE_pw_thread_loop_lock.?(hotplug.loop);
    b = null;
    while (true) {
        var t: [*c]struct_pw_buffer = undefined;
        _ = &t;
        if (@as(?*anyopaque, @ptrCast(@alignCast(blk: {
            const tmp = PIPEWIRE_pw_stream_dequeue_buffer.?(device.*.hidden.*.stream);
            t = tmp;
            break :blk tmp;
        }))) == @as(?*anyopaque, null)) break;
        if (b != null) {
            _ = PIPEWIRE_pw_stream_queue_buffer.?(device.*.hidden.*.stream, b);
        }
        b = t;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(b))) == @as(?*anyopaque, null)) {
        PIPEWIRE_pw_thread_loop_unlock.?(hotplug.loop);
        return SDL_CAMERA_FRAME_SKIP;
    }
    timestampNS.* = if (hotplug.have_1_0_5) b.*.time else SDL_GetTicksNS_REAL();
    frame.*.pixels = b.*.buffer.*.datas[@as(c_int, 0)].data;
    if (frame.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_MJPG)) {
        frame.*.pitch = @bitCast(@as(c_uint, @truncate(b.*.buffer.*.datas[@as(c_int, 0)].chunk.*.size)));
    } else {
        frame.*.pitch = b.*.buffer.*.datas[@as(c_int, 0)].chunk.*.stride;
    }
    PIPEWIRE_pw_thread_loop_unlock.?(hotplug.loop);
    return SDL_CAMERA_FRAME_READY;
}
pub fn PIPEWIRECAMERA_ReleaseFrame(device: [*c]SDL_Camera, frame: [*c]SDL_Surface) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var p: [*c][*c]struct_pw_buffer = undefined;
    _ = &p;
    PIPEWIRE_pw_thread_loop_lock.?(hotplug.loop);
    {
        p = @ptrCast(@alignCast((&device.*.hidden.*.buffers).*.data));
        while ((@intFromPtr(@as(?*anyopaque, @ptrFromInt(@as(usize, @intCast(@intFromPtr(p))) +% @as(usize, @bitCast(@as(c_long, @as(ptrdiff_t, @bitCast(@as(c_ulong, @truncate(@sizeOf(@TypeOf(p.*)))))))))))) <= @intFromPtr(@as(?*anyopaque, @ptrFromInt(@as(usize, @intCast(@intFromPtr((&device.*.hidden.*.buffers).*.data))) +% @as(usize, @bitCast(@as(c_long, @as(ptrdiff_t, @bitCast(@as(c_ulong, @truncate((&device.*.hidden.*.buffers).*.size)))))))))))) : (p += 1) {
            if (p.*.*.buffer.*.datas[@as(c_int, 0)].data == frame.*.pixels) {
                _ = PIPEWIRE_pw_stream_queue_buffer.?(device.*.hidden.*.stream, p.*);
                break;
            }
        }
    }
    PIPEWIRE_pw_thread_loop_unlock.?(hotplug.loop);
}
pub fn collect_rates(data: [*c]CameraFormatAddData, p: [*c]struct_param, sdlfmt: SDL_PixelFormat, colorspace: SDL_Colorspace, size: [*c]const struct_spa_rectangle) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var prop: [*c]const struct_spa_pod_prop = undefined;
    _ = &prop;
    var values: [*c]struct_spa_pod = undefined;
    _ = &values;
    var i: u32 = undefined;
    _ = &i;
    var n_vals: u32 = undefined;
    _ = &n_vals;
    var choice: u32 = undefined;
    _ = &choice;
    var rates: [*c]struct_spa_fraction = undefined;
    _ = &rates;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                prop = spa_pod_find_prop(p.*.param, null, SPA_FORMAT_VIDEO_framerate);
                if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(prop)))) == @as(?*anyopaque, null)) {
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
                values = spa_pod_get_values(&prop.*.value, &n_vals, &choice);
                if ((values.*.type != @as(u32, SPA_TYPE_Fraction)) or (n_vals == @as(u32, 0))) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                return;
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                rates = @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(usize, @intCast(@intFromPtr(values))) +% @as(usize, @bitCast(@as(c_long, @as(ptrdiff_t, @bitCast(@as(c_ulong, @truncate(@sizeOf(struct_spa_pod))))))))))));
                switch (choice) {
                    @as(u32, SPA_CHOICE_None) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(u32, SPA_CHOICE_Enum) => {
                        sdl_pc = 9;
                        continue;
                    },
                    else => {
                        sdl_pc = 17;
                        continue;
                    },
                }
            },
            7 => {
                {}
            },
            8 => {
                n_vals = 1;
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                i = 0;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                if (i < n_vals) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            11 => {
                if (!SDL_AddCameraFormat(data, sdlfmt, colorspace, @bitCast(@as(c_uint, @truncate(size.*.width))), @bitCast(@as(c_uint, @truncate(size.*.height))), @bitCast(@as(c_uint, @truncate(rates[i].num))), @bitCast(@as(c_uint, @truncate(rates[i].denom))))) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            12 => {
                i +%= 1;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            13 => {
                {
                    sdl_pc = 7;
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
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            17 => {
                SDL_Log_REAL("CAMERA: unimplemented choice:%d", choice);
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn collect_size(data: [*c]CameraFormatAddData, p: [*c]struct_param, sdlfmt: SDL_PixelFormat, colorspace: SDL_Colorspace) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var prop: [*c]const struct_spa_pod_prop = undefined;
    _ = &prop;
    var values: [*c]struct_spa_pod = undefined;
    _ = &values;
    var i: u32 = undefined;
    _ = &i;
    var n_vals: u32 = undefined;
    _ = &n_vals;
    var choice: u32 = undefined;
    _ = &choice;
    var rectangles: [*c]struct_spa_rectangle = undefined;
    _ = &rectangles;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                prop = spa_pod_find_prop(p.*.param, null, SPA_FORMAT_VIDEO_size);
                if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(prop)))) == @as(?*anyopaque, null)) {
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
                values = spa_pod_get_values(&prop.*.value, &n_vals, &choice);
                if ((values.*.type != @as(u32, SPA_TYPE_Rectangle)) or (n_vals == @as(u32, 0))) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                return;
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                rectangles = @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(usize, @intCast(@intFromPtr(values))) +% @as(usize, @bitCast(@as(c_long, @as(ptrdiff_t, @bitCast(@as(c_ulong, @truncate(@sizeOf(struct_spa_pod))))))))))));
                switch (choice) {
                    @as(u32, SPA_CHOICE_None) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(u32, SPA_CHOICE_Enum) => {
                        sdl_pc = 9;
                        continue;
                    },
                    else => {
                        sdl_pc = 14;
                        continue;
                    },
                }
            },
            7 => {
                {}
            },
            8 => {
                n_vals = 1;
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                i = 0;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                if (i < n_vals) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            11 => {
                collect_rates(data, p, sdlfmt, colorspace, &rectangles[i]);
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                i +%= 1;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            13 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            14 => {
                SDL_Log_REAL("CAMERA: unimplemented choice:%d", choice);
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn collect_raw(data: [*c]CameraFormatAddData, p: [*c]struct_param) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var prop: [*c]const struct_spa_pod_prop = undefined;
    _ = &prop;
    var sdlfmt: SDL_PixelFormat = undefined;
    _ = &sdlfmt;
    var colorspace: SDL_Colorspace = undefined;
    _ = &colorspace;
    var values: [*c]struct_spa_pod = undefined;
    _ = &values;
    var i: u32 = undefined;
    _ = &i;
    var n_vals: u32 = undefined;
    _ = &n_vals;
    var choice: u32 = undefined;
    _ = &choice;
    var ids: [*c]u32 = undefined;
    _ = &ids;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                prop = spa_pod_find_prop(p.*.param, null, SPA_FORMAT_VIDEO_format);
                if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(prop)))) == @as(?*anyopaque, null)) {
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
                values = spa_pod_get_values(&prop.*.value, &n_vals, &choice);
                if ((values.*.type != @as(u32, SPA_TYPE_Id)) or (n_vals == @as(u32, 0))) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                return;
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                ids = @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(usize, @intCast(@intFromPtr(values))) +% @as(usize, @bitCast(@as(c_long, @as(ptrdiff_t, @bitCast(@as(c_ulong, @truncate(@sizeOf(struct_spa_pod))))))))))));
                switch (choice) {
                    @as(u32, SPA_CHOICE_None) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(u32, SPA_CHOICE_Enum) => {
                        sdl_pc = 9;
                        continue;
                    },
                    else => {
                        sdl_pc = 17;
                        continue;
                    },
                }
            },
            7 => {
                {}
            },
            8 => {
                n_vals = 1;
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                i = 0;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                if (i < n_vals) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            11 => {
                id_to_sdl_format(ids[i], &sdlfmt, &colorspace);
                if (sdlfmt == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UNKNOWN)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            12 => {
                i +%= 1;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            13 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            14 => {
                {
                    sdl_pc = 12;
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
                collect_size(data, p, sdlfmt, colorspace);
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            17 => {
                SDL_Log_REAL("CAMERA: unimplemented choice: %d", choice);
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn collect_format(data: [*c]CameraFormatAddData, p: [*c]struct_param) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var prop: [*c]const struct_spa_pod_prop = undefined;
    _ = &prop;
    var values: [*c]struct_spa_pod = undefined;
    _ = &values;
    var i: u32 = undefined;
    _ = &i;
    var n_vals: u32 = undefined;
    _ = &n_vals;
    var choice: u32 = undefined;
    _ = &choice;
    var ids: [*c]u32 = undefined;
    _ = &ids;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                prop = spa_pod_find_prop(p.*.param, null, SPA_FORMAT_mediaSubtype);
                if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(prop)))) == @as(?*anyopaque, null)) {
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
                values = spa_pod_get_values(&prop.*.value, &n_vals, &choice);
                if ((values.*.type != @as(u32, SPA_TYPE_Id)) or (n_vals == @as(u32, 0))) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                return;
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                ids = @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(usize, @intCast(@intFromPtr(values))) +% @as(usize, @bitCast(@as(c_long, @as(ptrdiff_t, @bitCast(@as(c_ulong, @truncate(@sizeOf(struct_spa_pod))))))))))));
                switch (choice) {
                    @as(u32, SPA_CHOICE_None) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(u32, SPA_CHOICE_Enum) => {
                        sdl_pc = 9;
                        continue;
                    },
                    else => {
                        sdl_pc = 18;
                        continue;
                    },
                }
            },
            7 => {
                {}
            },
            8 => {
                n_vals = 1;
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                i = 0;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                if (i < n_vals) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            11 => {
                switch (ids[i]) {
                    @as(u32, SPA_MEDIA_SUBTYPE_raw) => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(u32, SPA_MEDIA_SUBTYPE_mjpg) => {
                        sdl_pc = 16;
                        continue;
                    },
                    else => {
                        sdl_pc = 17;
                        continue;
                    },
                }
            },
            12 => {
                i +%= 1;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            13 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            14 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            15 => {
                collect_raw(data, p);
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            16 => {
                collect_size(data, p, SDL_PIXELFORMAT_MJPG, SDL_COLORSPACE_JPEG);
                {
                    sdl_pc = 14;
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
                SDL_Log_REAL("CAMERA: unimplemented choice: %d", choice);
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn add_device(g: [*c]struct_global) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var p: [*c]struct_param = undefined;
    _ = &p;
    var data: CameraFormatAddData = undefined;
    _ = &data;
    _ = memset(@ptrCast(@alignCast(&data)), 0, @sizeOf(@TypeOf(data)));
    {
        p = @as([*c]@TypeOf(p.*), @ptrFromInt(@as(usize, @intCast(@intFromPtr((&g.*.param_list).*.next))) -% @intFromPtr(&@as(*allowzero @TypeOf(p.*), @ptrFromInt(0)).link)));
        while (!((&p.*.link) == (&g.*.param_list))) : (p = @as([*c]@TypeOf(p.*), @ptrFromInt(@as(usize, @intCast(@intFromPtr(p.*.link.next))) -% @intFromPtr(&@as(*allowzero @TypeOf(p.*), @ptrFromInt(0)).link)))) {
            if (p.*.id != @as(u32, SPA_PARAM_EnumFormat)) continue;
            collect_format(&data, p);
        }
    }
    if (data.num_specs > @as(c_int, 0)) {
        _ = SDL_AddCamera(g.*.name, SDL_CAMERA_POSITION_UNKNOWN, data.num_specs, data.specs, @ptrCast(@alignCast(g)));
    }
    SDL_free_REAL(@ptrCast(@alignCast(data.specs)));
    g.*.added = @"true" != 0;
}
pub fn PIPEWIRECAMERA_DetectDevices() callconv(.c) void {
    @setEvalBranchQuota(100000);
    var g: [*c]struct_global = undefined;
    _ = &g;
    PIPEWIRE_pw_thread_loop_lock.?(hotplug.loop);
    while (!hotplug.init_complete) {
        PIPEWIRE_pw_thread_loop_wait.?(hotplug.loop);
    }
    {
        g = @as([*c]@TypeOf(g.*), @ptrFromInt(@as(usize, @intCast(@intFromPtr((&hotplug.global_list).*.next))) -% @intFromPtr(&@as(*allowzero @TypeOf(g.*), @ptrFromInt(0)).link)));
        while (!((&g.*.link) == (&hotplug.global_list))) : (g = @as([*c]@TypeOf(g.*), @ptrFromInt(@as(usize, @intCast(@intFromPtr(g.*.link.next))) -% @intFromPtr(&@as(*allowzero @TypeOf(g.*), @ptrFromInt(0)).link)))) {
            if (!g.*.added) {
                add_device(g);
            }
        }
    }
    hotplug.events_enabled = @"true" != 0;
    PIPEWIRE_pw_thread_loop_unlock.?(hotplug.loop);
}
pub fn PIPEWIRECAMERA_FreeDeviceHandle(_: [*c]SDL_Camera) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn do_resync() callconv(.c) void {
    @setEvalBranchQuota(100000);
    hotplug.pending_seq = pw_core_sync(hotplug.core, PW_ID_CORE, 0);
}
pub fn node_event_info(object: ?*anyopaque, arg_info: [*c]const struct_pw_node_info) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var info = arg_info;
    _ = &info;
    var g: [*c]struct_global = @ptrCast(@alignCast(object));
    _ = &g;
    var i: u32 = undefined;
    _ = &i;
    info = @ptrCast(@alignCast(blk: {
        const tmp = @as(?*anyopaque, @ptrCast(@alignCast(PIPEWIRE_pw_node_info_merge.?(@ptrCast(@alignCast(g.*.info)), info, g.*.changed == @as(c_int, 0)))));
        g.*.info = tmp;
        break :blk tmp;
    }));
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(info)))) == @as(?*anyopaque, null)) return;
    if ((info.*.change_mask & @as(u64, @bitCast(@as(c_long, @as(c_int, 1) << @intCast(@as(c_int, 4)))))) != 0) {
        {
            i = 0;
            while (i < info.*.n_params) : (i +%= 1) {
                var id: u32 = info.*.params[i].id;
                _ = &id;
                var res: c_int = undefined;
                _ = &res;
                if (info.*.params[i].user == @as(u32, 0)) continue;
                info.*.params[i].user = 0;
                if (id != @as(u32, SPA_PARAM_EnumFormat)) continue;
                _ = param_add(&g.*.pending_list, info.*.params[i].seq, id, null);
                if (!((info.*.params[i].flags & @as(u32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 1)))))) != 0)) continue;
                res = pw_node_enum_params(@ptrCast(@alignCast(g.*.proxy)), blk: {
                    const ref = &info.*.params[i].seq;
                    ref.* += 1;
                    break :blk ref.*;
                }, id, 0, @bitCast(@as(c_int, -@as(c_int, 1))), null);
                if ((res & ~((@as(c_int, 1) << @intCast(@as(c_int, 30))) - @as(c_int, 1))) == (@as(c_int, 1) << @intCast(@as(c_int, 30)))) {
                    info.*.params[i].seq = res;
                }
                g.*.changed += 1;
            }
        }
    }
    do_resync();
}
pub fn node_event_param(object: ?*anyopaque, seq: c_int, id: u32, _: u32, _: u32, param_2: [*c]const struct_spa_pod) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var g: [*c]struct_global = @ptrCast(@alignCast(object));
    _ = &g;
    _ = param_add(&g.*.pending_list, seq, id, param_2);
}
pub const node_events: struct_pw_node_events = struct_pw_node_events{
    .version = PW_VERSION_NODE_EVENTS,
    .info = node_event_info,
    .param = node_event_param,
};
pub fn node_destroy(g: [*c]struct_global) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (g.*.info != null) {
        PIPEWIRE_pw_node_info_free.?(@ptrCast(@alignCast(g.*.info)));
        g.*.info = null;
    }
}
pub const node_class: struct_global_class = struct_global_class{
    .type = "PipeWire:Interface:Node",
    .version = PW_VERSION_NODE,
    .events = @ptrCast(@alignCast(&node_events)),
    .init = null,
    .destroy = node_destroy,
};
pub fn proxy_removed(data: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var g: [*c]struct_global = @ptrCast(@alignCast(data));
    _ = &g;
    PIPEWIRE_pw_proxy_destroy.?(g.*.proxy);
}
pub fn proxy_destroy(data: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var g: [*c]struct_global = @ptrCast(@alignCast(data));
    _ = &g;
    spa_list_remove(&g.*.link);
    g.*.proxy = null;
    if (g.*.class != null) {
        if (g.*.class.*.events != null) {
            spa_hook_remove(&g.*.object_listener);
        }
        if (g.*.class.*.destroy != null) {
            g.*.class.*.destroy.?(g);
        }
    }
    _ = param_clear(&g.*.param_list, @as(c_uint, 4294967295));
    _ = param_clear(&g.*.pending_list, @as(c_uint, 4294967295));
    free(@ptrCast(@alignCast(g.*.name)));
}
pub const proxy_events: struct_pw_proxy_events = struct_pw_proxy_events{
    .version = PW_VERSION_PROXY_EVENTS,
    .destroy = proxy_destroy,
    .bound = null,
    .removed = proxy_removed,
    .done = null,
    .@"error" = null,
    .bound_props = null,
};
pub fn hotplug_registry_global_callback(_: ?*anyopaque, id: u32, permissions: u32, arg_type: [*c]const u8, _: u32, props: [*c]const struct_spa_dict) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var class: [*c]const struct_global_class = null;
    _ = &class;
    var proxy: ?*struct_pw_proxy = undefined;
    _ = &proxy;
    var str: [*c]const u8 = undefined;
    _ = &str;
    var name: [*c]const u8 = null;
    _ = &name;
    if (spa_streq(@"type", "PipeWire:Interface:Node")) {
        if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(props)))) == @as(?*anyopaque, null)) return;
        if ((@as(?*anyopaque, @ptrCast(@alignCast(@constCast(blk: {
            const tmp = spa_dict_lookup(props, "media.class");
            str = tmp;
            break :blk tmp;
        })))) == @as(?*anyopaque, null)) or !spa_streq(str, "Video/Source")) return;
        if ((@as(?*anyopaque, @ptrCast(@alignCast(@constCast(blk: {
            const tmp = spa_dict_lookup(props, "node.description");
            name = tmp;
            break :blk tmp;
        })))) == @as(?*anyopaque, null)) and (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(blk: {
            const tmp = spa_dict_lookup(props, "node.name");
            name = tmp;
            break :blk tmp;
        })))) == @as(?*anyopaque, null))) {
            name = "unnamed camera";
        }
        class = &node_class;
    }
    if (class != null) {
        var g: [*c]struct_global = undefined;
        _ = &g;
        proxy = @ptrCast(@alignCast(pw_registry_bind(hotplug.registry, id, class.*.type, class.*.version, @sizeOf(struct_global))));
        g = @ptrCast(@alignCast(PIPEWIRE_pw_proxy_get_user_data.?(proxy)));
        g.*.class = class;
        g.*.id = id;
        g.*.permissions = permissions;
        g.*.props = @ptrCast(@alignCast(if (props != null) @as(?*anyopaque, @ptrCast(@alignCast(PIPEWIRE_pw_properties_new_dict.?(props)))) else @as(?*anyopaque, null)));
        g.*.proxy = proxy;
        g.*.name = strdup(name);
        spa_list_init(&g.*.pending_list);
        spa_list_init(&g.*.param_list);
        spa_list_insert((&hotplug.global_list).*.prev, &g.*.link);
        PIPEWIRE_pw_proxy_add_listener.?(proxy, &g.*.proxy_listener, &proxy_events, @ptrCast(@alignCast(g)));
        if (class.*.events != null) {
            PIPEWIRE_pw_proxy_add_object_listener.?(proxy, &g.*.object_listener, class.*.events, @ptrCast(@alignCast(g)));
        }
        if (class.*.init != null) {
            _ = class.*.init.?(g);
        }
        do_resync();
    }
}
pub fn hotplug_registry_global_remove_callback(_: ?*anyopaque, _: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub const hotplug_registry_events: struct_pw_registry_events = struct_pw_registry_events{
    .version = PW_VERSION_REGISTRY_EVENTS,
    .global = hotplug_registry_global_callback,
    .global_remove = hotplug_registry_global_remove_callback,
};
pub fn parse_version(str: [*c]const u8, major: [*c]c_int, minor: [*c]c_int, patch: [*c]c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (SDL_sscanf_REAL(str, "%d.%d.%d", major, minor, patch) < @as(c_int, 3)) {
        major.* = 0;
        minor.* = 0;
        patch.* = 0;
    }
}
pub fn hotplug_core_info_callback(_: ?*anyopaque, info: [*c]const struct_pw_core_info) callconv(.c) void {
    @setEvalBranchQuota(100000);
    parse_version(info.*.version, &hotplug.server_major, &hotplug.server_minor, &hotplug.server_patch);
}
pub fn hotplug_core_done_callback(_: ?*anyopaque, id: u32, seq: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    hotplug.last_seq = seq;
    if ((id == @as(u32, PW_ID_CORE)) and (seq == hotplug.pending_seq)) {
        var g: [*c]struct_global = undefined;
        _ = &g;
        var info: [*c]struct_pw_node_info = undefined;
        _ = &info;
        {
            g = @as([*c]@TypeOf(g.*), @ptrFromInt(@as(usize, @intCast(@intFromPtr((&hotplug.global_list).*.next))) -% @intFromPtr(&@as(*allowzero @TypeOf(g.*), @ptrFromInt(0)).link)));
            while (!((&g.*.link) == (&hotplug.global_list))) : (g = @as([*c]@TypeOf(g.*), @ptrFromInt(@as(usize, @intCast(@intFromPtr(g.*.link.next))) -% @intFromPtr(&@as(*allowzero @TypeOf(g.*), @ptrFromInt(0)).link)))) {
                if (!(g.*.changed != 0)) continue;
                info = @ptrCast(@alignCast(g.*.info));
                param_update(&g.*.param_list, &g.*.pending_list, info.*.n_params, info.*.params);
                if (!g.*.added and hotplug.events_enabled) {
                    add_device(g);
                }
            }
        }
        hotplug.init_complete = @"true" != 0;
        PIPEWIRE_pw_thread_loop_signal.?(hotplug.loop, @"false" != 0);
    }
}
pub const hotplug_core_events: struct_pw_core_events = struct_pw_core_events{
    .version = PW_VERSION_CORE_EVENTS,
    .info = hotplug_core_info_callback,
    .done = hotplug_core_done_callback,
    .ping = null,
    .@"error" = null,
    .remove_id = null,
    .bound_id = null,
    .add_mem = null,
    .remove_mem = null,
    .bound_props = null,
};
pub fn pipewire_server_version_at_least(major: c_int, minor: c_int, patch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return ((hotplug.server_major >= major) and ((hotplug.server_major > major) or (hotplug.server_minor >= minor))) and (((hotplug.server_major > major) or (hotplug.server_minor > minor)) or (hotplug.server_patch >= patch));
}
pub fn hotplug_loop_init() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var res: c_int = undefined;
    _ = &res;
    var fd: c_int = undefined;
    _ = &fd;
    fd = SDL_DBus_CameraPortalRequestAccess();
    if (fd == -@as(c_int, 1)) return @"false" != 0;
    spa_list_init(&hotplug.global_list);
    hotplug.have_1_0_5 = PIPEWIRE_pw_check_library_version.?(1, 0, 5);
    hotplug.loop = PIPEWIRE_pw_thread_loop_new.?("SDLPwCameraPlug", null);
    if (!(hotplug.loop != null)) {
        return SDL_SetError_REAL("Pipewire: Failed to create hotplug detection loop (%i)", __errno_location().*);
    }
    hotplug.context = PIPEWIRE_pw_context_new.?(PIPEWIRE_pw_thread_loop_get_loop.?(hotplug.loop), null, 0);
    if (!(hotplug.context != null)) {
        return SDL_SetError_REAL("Pipewire: Failed to create hotplug detection context (%i)", __errno_location().*);
    }
    if (fd >= @as(c_int, 0)) {
        hotplug.core = PIPEWIRE_pw_context_connect_fd.?(hotplug.context, fd, null, 0);
    } else {
        hotplug.core = PIPEWIRE_pw_context_connect.?(hotplug.context, null, 0);
    }
    if (!(hotplug.core != null)) {
        return SDL_SetError_REAL("Pipewire: Failed to connect hotplug detection context (%i)", __errno_location().*);
    }
    _ = memset(@ptrCast(@alignCast(&hotplug.core_listener)), 0, @sizeOf(@TypeOf(hotplug.core_listener)));
    _ = pw_core_add_listener(hotplug.core, &hotplug.core_listener, &hotplug_core_events, null);
    hotplug.registry = pw_core_get_registry(hotplug.core, PW_VERSION_REGISTRY, 0);
    if (!(hotplug.registry != null)) {
        return SDL_SetError_REAL("Pipewire: Failed to acquire hotplug detection registry (%i)", __errno_location().*);
    }
    _ = memset(@ptrCast(@alignCast(&hotplug.registry_listener)), 0, @sizeOf(@TypeOf(hotplug.registry_listener)));
    _ = pw_registry_add_listener(hotplug.registry, &hotplug.registry_listener, &hotplug_registry_events, null);
    do_resync();
    res = PIPEWIRE_pw_thread_loop_start.?(hotplug.loop);
    if (res != @as(c_int, 0)) {
        return SDL_SetError_REAL("Pipewire: Failed to start hotplug detection loop");
    }
    PIPEWIRE_pw_thread_loop_lock.?(hotplug.loop);
    while (!hotplug.init_complete) {
        PIPEWIRE_pw_thread_loop_wait.?(hotplug.loop);
    }
    PIPEWIRE_pw_thread_loop_unlock.?(hotplug.loop);
    if (!pipewire_server_version_at_least(PW_REQUIRED_MAJOR, PW_REQUIRED_MINOR, PW_REQUIRED_PATCH)) {
        return SDL_SetError_REAL("Pipewire: server version is too old %d.%d.%d < %d.%d.%d", hotplug.server_major, hotplug.server_minor, hotplug.server_patch, PW_REQUIRED_MAJOR, PW_REQUIRED_MINOR, PW_REQUIRED_PATCH);
    }
    return @"true" != 0;
}
pub fn PIPEWIRECAMERA_Deinitialize() callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (pipewire_initialized) {
        if (hotplug.loop != null) {
            PIPEWIRE_pw_thread_loop_lock.?(hotplug.loop);
        }
        if (hotplug.registry != null) {
            spa_hook_remove(&hotplug.registry_listener);
            PIPEWIRE_pw_proxy_destroy.?(@ptrCast(@alignCast(hotplug.registry)));
        }
        if (hotplug.core != null) {
            spa_hook_remove(&hotplug.core_listener);
            _ = PIPEWIRE_pw_core_disconnect.?(hotplug.core);
        }
        if (hotplug.context != null) {
            PIPEWIRE_pw_context_destroy.?(hotplug.context);
        }
        if (hotplug.loop != null) {
            PIPEWIRE_pw_thread_loop_unlock.?(hotplug.loop);
            PIPEWIRE_pw_thread_loop_destroy.?(hotplug.loop);
        }
        deinit_pipewire_library();
        _ = memset(@ptrCast(@alignCast(&hotplug)), 0, @sizeOf(@TypeOf(hotplug)));
        pipewire_initialized = @"false" != 0;
    }
}
pub fn PIPEWIRECAMERA_Init(impl: [*c]SDL_CameraDriverImpl) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (!pipewire_initialized) {
        if (!init_pipewire_library()) {
            return @"false" != 0;
        }
        pipewire_initialized = @"true" != 0;
        if (!hotplug_loop_init()) {
            PIPEWIRECAMERA_Deinitialize();
            return @"false" != 0;
        }
    }
    impl.*.DetectDevices = PIPEWIRECAMERA_DetectDevices;
    impl.*.OpenDevice = PIPEWIRECAMERA_OpenDevice;
    impl.*.CloseDevice = PIPEWIRECAMERA_CloseDevice;
    impl.*.WaitDevice = PIPEWIRECAMERA_WaitDevice;
    impl.*.AcquireFrame = PIPEWIRECAMERA_AcquireFrame;
    impl.*.ReleaseFrame = PIPEWIRECAMERA_ReleaseFrame;
    impl.*.FreeDeviceHandle = PIPEWIRECAMERA_FreeDeviceHandle;
    impl.*.Deinitialize = PIPEWIRECAMERA_Deinitialize;
    return @"true" != 0;
}
pub export var PIPEWIRECAMERA_bootstrap: CameraBootStrap = CameraBootStrap{
    .name = "pipewire",
    .desc = "SDL PipeWire camera driver",
    .init = PIPEWIRECAMERA_Init,
    .demand_only = @"false" != 0,
};

pub const va_start = @compileError("unable to translate macro: undefined identifier `__builtin_va_start`");
// /home/addo/dev/stupid/zdl/.cache/zig-lib/compiler/aro/include/stdarg.h:12:9
pub inline fn va_end(ap: anytype) @TypeOf(__builtin.va_end(ap)) {
    @setEvalBranchQuota(100000);
    _ = &ap;
    return __builtin.va_end(ap);
}
pub const va_arg = @compileError("unable to translate macro: undefined identifier `__builtin_va_arg`");
// /home/addo/dev/stupid/zdl/.cache/zig-lib/compiler/aro/include/stdarg.h:15:9
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const EINVAL = @as(c_int, 22);
pub const ENOSPC = @as(c_int, 28);
pub const EOPNOTSUPP = @as(c_int, 95);
pub const SPA_POD_ALIGN = @as(c_int, 8);
pub const PW_VERSION_REGISTRY = @as(c_int, 3);
pub const PW_ID_CORE = @as(c_int, 0);
pub const PW_VERSION_CORE_EVENTS = @as(c_int, 1);
pub const PW_VERSION_REGISTRY_EVENTS = @as(c_int, 0);
pub const PW_VERSION_PROXY_EVENTS = @as(c_int, 1);
pub const PW_VERSION_NODE = @as(c_int, 3);
pub const PW_VERSION_NODE_EVENTS = @as(c_int, 0);
pub const PW_VERSION_STREAM_EVENTS = @as(c_int, 2);
pub const PW_MAJOR = @as(c_int, 1);
pub const PW_MINOR = @as(c_int, 6);
pub const PW_MICRO = @as(c_int, 9);
pub inline fn PW_CHECK_VERSION(major: anytype, minor: anytype, micro: anytype) @TypeOf(((PW_MAJOR > major) or ((PW_MAJOR == major) and (PW_MINOR > minor))) or (((PW_MAJOR == major) and (PW_MINOR == minor)) and (PW_MICRO >= micro))) {
    @setEvalBranchQuota(100000);
    _ = &major;
    _ = &minor;
    _ = &micro;
    return ((PW_MAJOR > major) or ((PW_MAJOR == major) and (PW_MINOR > minor))) or (((PW_MAJOR == major) and (PW_MINOR == minor)) and (PW_MICRO >= micro));
}
pub const PW_REQUIRED_MAJOR = @as(c_int, 1);
pub const PW_REQUIRED_MINOR = @as(c_int, 0);
pub const PW_REQUIRED_PATCH = @as(c_int, 0);
pub const SDL_PIPEWIRE_SYM = @compileError("unable to translate macro: undefined identifier `PIPEWIRE_`");
// /home/addo/dev/stupid/zdl/.ref/SDL/src/camera/pipewire/SDL_camera_pipewire.c:133:9
pub const global = struct_global;
pub const param = struct_param;
