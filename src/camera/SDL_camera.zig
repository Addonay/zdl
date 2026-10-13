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
pub const pthread_t = c_ulong;
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memmove(__dest: ?*anyopaque, __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Sint16 = i16;
pub const Uint16 = u16;
pub const Sint32 = i32;
pub const Uint32 = u32;
pub const Uint64 = u64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_realloc_REAL(mem: ?*anyopaque, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub const SDL_realloc_func = ?*const fn (mem: ?*anyopaque, size: usize) callconv(.c) ?*anyopaque;
pub const SDL_free_func = ?*const fn (mem: ?*anyopaque) callconv(.c) void;
pub extern fn SDL_aligned_alloc_REAL(alignment: usize, size: usize) ?*anyopaque;
pub extern fn SDL_aligned_free_REAL(mem: ?*anyopaque) void;
pub const SDL_CompareCallback = ?*const fn (a: ?*const anyopaque, b: ?*const anyopaque) callconv(.c) c_int;
pub extern fn SDL_qsort_REAL(base: ?*anyopaque, nmemb: usize, size: usize, compare: SDL_CompareCallback) void;
pub extern fn SDL_abs_REAL(x: c_int) c_int;
pub extern fn SDL_memcmp_REAL(s1: ?*const anyopaque, s2: ?*const anyopaque, len: usize) c_int;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_strchr_REAL(str: [*c]const u8, c: c_int) [*c]u8;
pub extern fn SDL_strcasecmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_snprintf_REAL(text: [*c]u8, maxlen: usize, fmt: [*c]const u8, ...) c_int;
pub extern fn SDL_fabsf_REAL(x: f32) f32;
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
pub extern fn SDL_CompareAndSwapAtomicInt_REAL(a: [*c]SDL_AtomicInt, oldval: c_int, newval: c_int) bool;
pub extern fn SDL_SetAtomicInt_REAL(a: [*c]SDL_AtomicInt, v: c_int) c_int;
pub extern fn SDL_GetAtomicInt_REAL(a: [*c]SDL_AtomicInt) c_int;
pub extern fn SDL_AddAtomicInt_REAL(a: [*c]SDL_AtomicInt, v: c_int) c_int;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_PropertiesID = Uint32;
pub extern fn SDL_CreateProperties_REAL() SDL_PropertiesID;
pub extern fn SDL_SetFloatProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: f32) bool;
pub extern fn SDL_DestroyProperties_REAL(props: SDL_PropertiesID) void;
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
pub const SDL_THREAD_PRIORITY_HIGH: c_int = 2;
pub const enum_SDL_ThreadPriority = c_uint;
pub const SDL_ThreadPriority = enum_SDL_ThreadPriority;
pub const SDL_ThreadFunction = ?*const fn (data: ?*anyopaque) callconv(.c) c_int;
pub extern fn SDL_CreateThreadRuntime_REAL(@"fn": SDL_ThreadFunction, name: [*c]const u8, data: ?*anyopaque, pfnBeginThread: SDL_FunctionPointer, pfnEndThread: SDL_FunctionPointer) [*c]SDL_Thread;
pub extern fn SDL_SetCurrentThreadPriority_REAL(priority: SDL_ThreadPriority) bool;
pub extern fn SDL_WaitThread_REAL(thread: [*c]SDL_Thread, status: [*c]c_int) void;
pub const struct_SDL_Mutex = opaque {
};
pub const SDL_Mutex = struct_SDL_Mutex;
pub extern fn SDL_CreateMutex_REAL() ?*SDL_Mutex;
pub extern fn SDL_LockMutex_REAL(mutex: ?*SDL_Mutex) void;
pub extern fn SDL_UnlockMutex_REAL(mutex: ?*SDL_Mutex) void;
pub extern fn SDL_DestroyMutex_REAL(mutex: ?*SDL_Mutex) void;
pub const struct_SDL_RWLock = opaque {
};
pub const SDL_RWLock = struct_SDL_RWLock;
pub extern fn SDL_CreateRWLock_REAL() ?*SDL_RWLock;
pub extern fn SDL_LockRWLockForReading_REAL(rwlock: ?*SDL_RWLock) void;
pub extern fn SDL_LockRWLockForWriting_REAL(rwlock: ?*SDL_RWLock) void;
pub extern fn SDL_UnlockRWLock_REAL(rwlock: ?*SDL_RWLock) void;
pub extern fn SDL_DestroyRWLock_REAL(rwlock: ?*SDL_RWLock) void;
pub const SDL_AudioDeviceID = Uint32;
pub const SDL_PIXELFORMAT_UNKNOWN: c_int = 0;
pub const SDL_PIXELFORMAT_YV12: c_int = 842094169;
pub const SDL_PIXELFORMAT_IYUV: c_int = 1448433993;
pub const SDL_PIXELFORMAT_YUY2: c_int = 844715353;
pub const SDL_PIXELFORMAT_UYVY: c_int = 1498831189;
pub const SDL_PIXELFORMAT_YVYU: c_int = 1431918169;
pub const SDL_PIXELFORMAT_NV12: c_int = 842094158;
pub const SDL_PIXELFORMAT_NV21: c_int = 825382478;
pub const SDL_PIXELFORMAT_P010: c_int = 808530000;
pub const SDL_PIXELFORMAT_I0FL: c_int = 1279668297;
pub const SDL_PIXELFORMAT_I4FL: c_int = 1279669321;
pub const enum_SDL_PixelFormat = c_uint;
pub const SDL_PixelFormat = enum_SDL_PixelFormat;
pub const SDL_COLOR_RANGE_FULL: c_int = 2;
pub const enum_SDL_ColorRange = c_uint;
pub const SDL_ColorRange = enum_SDL_ColorRange;
pub const SDL_COLORSPACE_UNKNOWN: c_int = 0;
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
pub const SDL_SCALEMODE_NEAREST: c_int = 0;
pub const enum_SDL_ScaleMode = c_int;
pub const SDL_ScaleMode = enum_SDL_ScaleMode;
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
pub extern fn SDL_CreateSurfaceFrom_REAL(width: c_int, height: c_int, format: SDL_PixelFormat, pixels: ?*anyopaque, pitch: c_int) [*c]SDL_Surface;
pub extern fn SDL_DestroySurface_REAL(surface: [*c]SDL_Surface) void;
pub extern fn SDL_GetSurfaceProperties_REAL(surface: [*c]SDL_Surface) SDL_PropertiesID;
pub extern fn SDL_SetSurfaceColorspace_REAL(surface: [*c]SDL_Surface, colorspace: SDL_Colorspace) bool;
pub extern fn SDL_ConvertPixels_REAL(width: c_int, height: c_int, src_format: SDL_PixelFormat, src: ?*const anyopaque, src_pitch: c_int, dst_format: SDL_PixelFormat, dst: ?*anyopaque, dst_pitch: c_int) bool;
pub extern fn SDL_StretchSurface_REAL(src: [*c]SDL_Surface, srcrect: [*c]const SDL_Rect, dst: [*c]SDL_Surface, dstrect: [*c]const SDL_Rect, scaleMode: SDL_ScaleMode) bool;
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
pub const SDL_CAMERA_PERMISSION_STATE_DENIED: c_int = -1;
pub const SDL_CAMERA_PERMISSION_STATE_PENDING: c_int = 0;
pub const SDL_CAMERA_PERMISSION_STATE_APPROVED: c_int = 1;
pub const enum_SDL_CameraPermissionState = c_int;
pub const SDL_CameraPermissionState = enum_SDL_CameraPermissionState;
pub const struct_SDL_PrivateCameraData_8 = opaque {};
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
    hidden: ?*struct_SDL_PrivateCameraData_8 = null,
};
pub extern fn SDL_GetSIMDAlignment_REAL() usize;
pub const SDL_DisplayID = Uint32;
pub const SDL_WindowID = Uint32;
pub const enum_SDL_PowerState = c_int;
pub const SDL_PowerState = enum_SDL_PowerState;
pub const SDL_SensorID = Uint32;
pub const SDL_JoystickID = Uint32;
pub const enum_SDL_Scancode = c_uint;
pub const SDL_Scancode = enum_SDL_Scancode;
pub const SDL_Keycode = Uint32;
pub const SDL_Keymod = Uint16;
pub const SDL_KeyboardID = Uint32;
pub const SDL_MouseID = Uint32;
pub const enum_SDL_MouseWheelDirection = c_uint;
pub const SDL_MouseWheelDirection = enum_SDL_MouseWheelDirection;
pub const SDL_MouseButtonFlags = Uint32;
pub const SDL_NotificationID = Uint32;
pub const SDL_TouchID = Uint64;
pub const SDL_FingerID = Uint64;
pub const SDL_PenID = Uint32;
pub const SDL_PenInputFlags = Uint32;
pub const enum_SDL_PenAxis = c_uint;
pub const SDL_PenAxis = enum_SDL_PenAxis;
pub const enum_SDL_PenDeviceType = c_int;
pub const SDL_PenDeviceType = enum_SDL_PenDeviceType;
pub const SDL_EVENT_CAMERA_DEVICE_ADDED: c_int = 5120;
pub const SDL_EVENT_CAMERA_DEVICE_REMOVED: c_int = 5121;
pub const SDL_EVENT_CAMERA_DEVICE_APPROVED: c_int = 5122;
pub const SDL_EVENT_CAMERA_DEVICE_DENIED: c_int = 5123;
pub const enum_SDL_EventType = c_uint;
pub const SDL_EventType = enum_SDL_EventType;
pub const struct_SDL_CommonEvent = extern struct {
    type: Uint32 = 0,
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
};
pub const SDL_CommonEvent = struct_SDL_CommonEvent;
pub const struct_SDL_DisplayEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    displayID: SDL_DisplayID = 0,
    data1: Sint32 = 0,
    data2: Sint32 = 0,
};
pub const SDL_DisplayEvent = struct_SDL_DisplayEvent;
pub const struct_SDL_WindowEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    data1: Sint32 = 0,
    data2: Sint32 = 0,
};
pub const SDL_WindowEvent = struct_SDL_WindowEvent;
pub const struct_SDL_KeyboardDeviceEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_KeyboardID = 0,
};
pub const SDL_KeyboardDeviceEvent = struct_SDL_KeyboardDeviceEvent;
pub const struct_SDL_KeyboardEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_KeyboardID = 0,
    scancode: SDL_Scancode = @import("std").mem.zeroes(SDL_Scancode),
    key: SDL_Keycode = 0,
    mod: SDL_Keymod = 0,
    raw: Uint16 = 0,
    down: bool = false,
    repeat: bool = false,
};
pub const SDL_KeyboardEvent = struct_SDL_KeyboardEvent;
pub const struct_SDL_TextEditingEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    text: [*c]const u8 = null,
    start: Sint32 = 0,
    length: Sint32 = 0,
};
pub const SDL_TextEditingEvent = struct_SDL_TextEditingEvent;
pub const struct_SDL_TextEditingCandidatesEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    candidates: [*c]const [*c]const u8 = null,
    num_candidates: Sint32 = 0,
    selected_candidate: Sint32 = 0,
    horizontal: bool = false,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
    padding3: Uint8 = 0,
};
pub const SDL_TextEditingCandidatesEvent = struct_SDL_TextEditingCandidatesEvent;
pub const struct_SDL_TextInputEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    text: [*c]const u8 = null,
};
pub const SDL_TextInputEvent = struct_SDL_TextInputEvent;
pub const struct_SDL_MouseDeviceEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_MouseID = 0,
};
pub const SDL_MouseDeviceEvent = struct_SDL_MouseDeviceEvent;
pub const struct_SDL_MouseMotionEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_MouseID = 0,
    state: SDL_MouseButtonFlags = 0,
    x: f32 = 0,
    y: f32 = 0,
    xrel: f32 = 0,
    yrel: f32 = 0,
};
pub const SDL_MouseMotionEvent = struct_SDL_MouseMotionEvent;
pub const struct_SDL_MouseButtonEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_MouseID = 0,
    button: Uint8 = 0,
    down: bool = false,
    clicks: Uint8 = 0,
    padding: Uint8 = 0,
    x: f32 = 0,
    y: f32 = 0,
};
pub const SDL_MouseButtonEvent = struct_SDL_MouseButtonEvent;
pub const struct_SDL_MouseWheelEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_MouseID = 0,
    x: f32 = 0,
    y: f32 = 0,
    direction: SDL_MouseWheelDirection = @import("std").mem.zeroes(SDL_MouseWheelDirection),
    mouse_x: f32 = 0,
    mouse_y: f32 = 0,
    integer_x: Sint32 = 0,
    integer_y: Sint32 = 0,
};
pub const SDL_MouseWheelEvent = struct_SDL_MouseWheelEvent;
pub const struct_SDL_JoyAxisEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    axis: Uint8 = 0,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
    padding3: Uint8 = 0,
    value: Sint16 = 0,
    padding4: Uint16 = 0,
};
pub const SDL_JoyAxisEvent = struct_SDL_JoyAxisEvent;
pub const struct_SDL_JoyBallEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    ball: Uint8 = 0,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
    padding3: Uint8 = 0,
    xrel: Sint16 = 0,
    yrel: Sint16 = 0,
};
pub const SDL_JoyBallEvent = struct_SDL_JoyBallEvent;
pub const struct_SDL_JoyHatEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    hat: Uint8 = 0,
    value: Uint8 = 0,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
};
pub const SDL_JoyHatEvent = struct_SDL_JoyHatEvent;
pub const struct_SDL_JoyButtonEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    button: Uint8 = 0,
    down: bool = false,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
};
pub const SDL_JoyButtonEvent = struct_SDL_JoyButtonEvent;
pub const struct_SDL_JoyDeviceEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
};
pub const SDL_JoyDeviceEvent = struct_SDL_JoyDeviceEvent;
pub const struct_SDL_JoyBatteryEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    state: SDL_PowerState = @import("std").mem.zeroes(SDL_PowerState),
    percent: c_int = 0,
};
pub const SDL_JoyBatteryEvent = struct_SDL_JoyBatteryEvent;
pub const struct_SDL_GamepadAxisEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    axis: Uint8 = 0,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
    padding3: Uint8 = 0,
    value: Sint16 = 0,
    padding4: Uint16 = 0,
};
pub const SDL_GamepadAxisEvent = struct_SDL_GamepadAxisEvent;
pub const struct_SDL_GamepadButtonEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    button: Uint8 = 0,
    down: bool = false,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
};
pub const SDL_GamepadButtonEvent = struct_SDL_GamepadButtonEvent;
pub const struct_SDL_GamepadDeviceEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
};
pub const SDL_GamepadDeviceEvent = struct_SDL_GamepadDeviceEvent;
pub const struct_SDL_GamepadTouchpadEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    touchpad: Sint32 = 0,
    finger: Sint32 = 0,
    x: f32 = 0,
    y: f32 = 0,
    pressure: f32 = 0,
};
pub const SDL_GamepadTouchpadEvent = struct_SDL_GamepadTouchpadEvent;
pub const struct_SDL_GamepadSensorEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    sensor: Sint32 = 0,
    data: [3]f32 = @import("std").mem.zeroes([3]f32),
    sensor_timestamp: Uint64 = 0,
};
pub const SDL_GamepadSensorEvent = struct_SDL_GamepadSensorEvent;
pub const struct_SDL_GamepadCapSenseEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    capsense: Uint8 = 0,
    down: bool = false,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
};
pub const SDL_GamepadCapSenseEvent = struct_SDL_GamepadCapSenseEvent;
pub const struct_SDL_AudioDeviceEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_AudioDeviceID = 0,
    recording: bool = false,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
    padding3: Uint8 = 0,
};
pub const SDL_AudioDeviceEvent = struct_SDL_AudioDeviceEvent;
pub const struct_SDL_CameraDeviceEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_CameraID = 0,
};
pub const SDL_CameraDeviceEvent = struct_SDL_CameraDeviceEvent;
pub const struct_SDL_NotificationEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_NotificationID = 0,
    action_id: [*c]const u8 = null,
};
pub const SDL_NotificationEvent = struct_SDL_NotificationEvent;
pub const struct_SDL_RenderEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
};
pub const SDL_RenderEvent = struct_SDL_RenderEvent;
pub const struct_SDL_TouchFingerEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    touchID: SDL_TouchID = 0,
    fingerID: SDL_FingerID = 0,
    x: f32 = 0,
    y: f32 = 0,
    dx: f32 = 0,
    dy: f32 = 0,
    pressure: f32 = 0,
    windowID: SDL_WindowID = 0,
};
pub const SDL_TouchFingerEvent = struct_SDL_TouchFingerEvent;
pub const struct_SDL_PinchFingerEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    scale: f32 = 0,
    windowID: SDL_WindowID = 0,
    span_x: f32 = 0,
    span_y: f32 = 0,
    focus_x: f32 = 0,
    focus_y: f32 = 0,
};
pub const SDL_PinchFingerEvent = struct_SDL_PinchFingerEvent;
pub const struct_SDL_PenProximityEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_PenID = 0,
    pen_state: SDL_PenInputFlags = 0,
    device_type: SDL_PenDeviceType = @import("std").mem.zeroes(SDL_PenDeviceType),
};
pub const SDL_PenProximityEvent = struct_SDL_PenProximityEvent;
pub const struct_SDL_PenMotionEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_PenID = 0,
    pen_state: SDL_PenInputFlags = 0,
    x: f32 = 0,
    y: f32 = 0,
    device_type: SDL_PenDeviceType = @import("std").mem.zeroes(SDL_PenDeviceType),
};
pub const SDL_PenMotionEvent = struct_SDL_PenMotionEvent;
pub const struct_SDL_PenTouchEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_PenID = 0,
    pen_state: SDL_PenInputFlags = 0,
    x: f32 = 0,
    y: f32 = 0,
    eraser: bool = false,
    down: bool = false,
    device_type: SDL_PenDeviceType = @import("std").mem.zeroes(SDL_PenDeviceType),
};
pub const SDL_PenTouchEvent = struct_SDL_PenTouchEvent;
pub const struct_SDL_PenButtonEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_PenID = 0,
    pen_state: SDL_PenInputFlags = 0,
    x: f32 = 0,
    y: f32 = 0,
    button: Uint8 = 0,
    down: bool = false,
    device_type: SDL_PenDeviceType = @import("std").mem.zeroes(SDL_PenDeviceType),
};
pub const SDL_PenButtonEvent = struct_SDL_PenButtonEvent;
pub const struct_SDL_PenAxisEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_PenID = 0,
    pen_state: SDL_PenInputFlags = 0,
    x: f32 = 0,
    y: f32 = 0,
    axis: SDL_PenAxis = @import("std").mem.zeroes(SDL_PenAxis),
    value: f32 = 0,
    device_type: SDL_PenDeviceType = @import("std").mem.zeroes(SDL_PenDeviceType),
};
pub const SDL_PenAxisEvent = struct_SDL_PenAxisEvent;
pub const struct_SDL_DropEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    x: f32 = 0,
    y: f32 = 0,
    source: [*c]const u8 = null,
    data: [*c]const u8 = null,
};
pub const SDL_DropEvent = struct_SDL_DropEvent;
pub const struct_SDL_ClipboardEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    owner: bool = false,
    num_mime_types: Sint32 = 0,
    mime_types: [*c][*c]const u8 = null,
};
pub const SDL_ClipboardEvent = struct_SDL_ClipboardEvent;
pub const struct_SDL_SensorEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_SensorID = 0,
    data: [6]f32 = @import("std").mem.zeroes([6]f32),
    sensor_timestamp: Uint64 = 0,
};
pub const SDL_SensorEvent = struct_SDL_SensorEvent;
pub const struct_SDL_QuitEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
};
pub const SDL_QuitEvent = struct_SDL_QuitEvent;
pub const struct_SDL_UserEvent = extern struct {
    type: Uint32 = 0,
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    code: Sint32 = 0,
    data1: ?*anyopaque = null,
    data2: ?*anyopaque = null,
};
pub const SDL_UserEvent = struct_SDL_UserEvent;
pub const union_SDL_Event = extern union {
    type: Uint32,
    common: SDL_CommonEvent,
    display: SDL_DisplayEvent,
    window: SDL_WindowEvent,
    kdevice: SDL_KeyboardDeviceEvent,
    key: SDL_KeyboardEvent,
    edit: SDL_TextEditingEvent,
    edit_candidates: SDL_TextEditingCandidatesEvent,
    text: SDL_TextInputEvent,
    mdevice: SDL_MouseDeviceEvent,
    motion: SDL_MouseMotionEvent,
    button: SDL_MouseButtonEvent,
    wheel: SDL_MouseWheelEvent,
    jdevice: SDL_JoyDeviceEvent,
    jaxis: SDL_JoyAxisEvent,
    jball: SDL_JoyBallEvent,
    jhat: SDL_JoyHatEvent,
    jbutton: SDL_JoyButtonEvent,
    jbattery: SDL_JoyBatteryEvent,
    gdevice: SDL_GamepadDeviceEvent,
    gaxis: SDL_GamepadAxisEvent,
    gbutton: SDL_GamepadButtonEvent,
    gtouchpad: SDL_GamepadTouchpadEvent,
    gsensor: SDL_GamepadSensorEvent,
    gcapsense: SDL_GamepadCapSenseEvent,
    adevice: SDL_AudioDeviceEvent,
    cdevice: SDL_CameraDeviceEvent,
    sensor: SDL_SensorEvent,
    quit: SDL_QuitEvent,
    user: SDL_UserEvent,
    tfinger: SDL_TouchFingerEvent,
    pinch: SDL_PinchFingerEvent,
    pproximity: SDL_PenProximityEvent,
    ptouch: SDL_PenTouchEvent,
    pmotion: SDL_PenMotionEvent,
    pbutton: SDL_PenButtonEvent,
    paxis: SDL_PenAxisEvent,
    render: SDL_RenderEvent,
    drop: SDL_DropEvent,
    clipboard: SDL_ClipboardEvent,
    notification: SDL_NotificationEvent,
    padding: [128]Uint8,
};
pub const SDL_Event = union_SDL_Event;
comptime {
    if (!(@sizeOf(SDL_Event) == @sizeOf(@TypeOf(@as([*c]SDL_Event, null).*.padding)))) @compileError("static assertion failed \"sizeof(SDL_Event) == sizeof((SDL_static_cast(SDL_Event *, NULL))->padding)\"");
}
pub extern fn SDL_PumpEvents_REAL() void;
pub extern fn SDL_PushEvent_REAL(event: [*c]SDL_Event) bool;
pub extern fn SDL_EventEnabled_REAL(@"type": Uint32) bool;
pub extern fn SDL_GetHint_REAL(name: [*c]const u8) [*c]const u8;
pub extern fn SDL_GetTicksNS_REAL() Uint64;
pub extern fn SDL_Delay_REAL(ms: Uint32) void;
pub extern fn SDL_GetNextObjectID() Uint32;
pub extern fn SDL_GetPersistentString(string: [*c]const u8) [*c]const u8;
pub extern fn SDL_DebugLogBackend(subsystem: [*c]const u8, backend: [*c]const u8) void;
pub const struct_SDL_HashTable = opaque {
};
pub const SDL_HashTable = struct_SDL_HashTable;
pub const SDL_HashCallback = ?*const fn (userdata: ?*anyopaque, key: ?*const anyopaque) callconv(.c) Uint32;
pub const SDL_HashKeyMatchCallback = ?*const fn (userdata: ?*anyopaque, a: ?*const anyopaque, b: ?*const anyopaque) callconv(.c) bool;
pub const SDL_HashDestroyCallback = ?*const fn (userdata: ?*anyopaque, key: ?*const anyopaque, value: ?*const anyopaque) callconv(.c) void;
pub const SDL_HashTableIterateCallback = ?*const fn (userdata: ?*anyopaque, table: ?*const SDL_HashTable, key: ?*const anyopaque, value: ?*const anyopaque) callconv(.c) bool;
pub extern fn SDL_CreateHashTable(estimated_capacity: c_int, threadsafe: bool, hash: SDL_HashCallback, keymatch: SDL_HashKeyMatchCallback, destroy: SDL_HashDestroyCallback, userdata: ?*anyopaque) ?*SDL_HashTable;
pub extern fn SDL_DestroyHashTable(table: ?*SDL_HashTable) void;
pub extern fn SDL_InsertIntoHashTable(table: ?*SDL_HashTable, key: ?*const anyopaque, value: ?*const anyopaque, replace: bool) bool;
pub extern fn SDL_FindInHashTable(table: ?*const SDL_HashTable, key: ?*const anyopaque, value: [*c]?*const anyopaque) bool;
pub extern fn SDL_RemoveFromHashTable(table: ?*SDL_HashTable, key: ?*const anyopaque) bool;
pub extern fn SDL_IterateHashTable(table: ?*const SDL_HashTable, callback: SDL_HashTableIterateCallback, userdata: ?*anyopaque) bool;
pub extern fn SDL_HashID(unused: ?*anyopaque, key: ?*const anyopaque) Uint32;
pub extern fn SDL_KeyMatchID(unused: ?*anyopaque, a: ?*const anyopaque, b: ?*const anyopaque) bool;
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
pub extern fn SDL_CreateSurfaceUninitialized(width: c_int, height: c_int, format: SDL_PixelFormat) [*c]SDL_Surface;
pub const struct_CameraFormatAddData = extern struct {
    specs: [*c]SDL_CameraSpec = null,
    num_specs: c_int = 0,
    allocated_specs: c_int = 0,
};
pub const CameraFormatAddData = struct_CameraFormatAddData;
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
pub const struct_SDL_PendingCameraEvent = extern struct {
    type: Uint32 = 0,
    devid: SDL_CameraID = 0,
    next: [*c]struct_SDL_PendingCameraEvent = null,
};
pub const SDL_PendingCameraEvent = struct_SDL_PendingCameraEvent;
pub const struct_SDL_CameraDriver = extern struct {
    name: [*c]const u8 = null,
    desc: [*c]const u8 = null,
    impl: SDL_CameraDriverImpl = @import("std").mem.zeroes(SDL_CameraDriverImpl),
    device_hash_lock: ?*SDL_RWLock = null,
    device_hash: ?*SDL_HashTable = null,
    pending_events: SDL_PendingCameraEvent = @import("std").mem.zeroes(SDL_PendingCameraEvent),
    pending_events_tail: [*c]SDL_PendingCameraEvent = null,
    device_count: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
    shutting_down: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
};
pub const SDL_CameraDriver = struct_SDL_CameraDriver;
pub const struct_CameraBootStrap = extern struct {
    name: [*c]const u8 = null,
    desc: [*c]const u8 = null,
    init: ?*const fn (impl: [*c]SDL_CameraDriverImpl) callconv(.c) bool = null,
    demand_only: bool = false,
};
pub const CameraBootStrap = struct_CameraBootStrap;
pub extern var DUMMYCAMERA_bootstrap: CameraBootStrap;
pub extern var PIPEWIRECAMERA_bootstrap: CameraBootStrap;
pub extern var V4L2_bootstrap: CameraBootStrap;
pub const SDL_ErrorCode = c_uint;
pub const bootstrap: [4][*c]const CameraBootStrap = [4][*c]const CameraBootStrap{
    &V4L2_bootstrap,
    &PIPEWIRECAMERA_bootstrap,
    &DUMMYCAMERA_bootstrap,
    null,
};
pub var camera_driver: SDL_CameraDriver = @import("std").mem.zeroes(SDL_CameraDriver);
pub export fn SDL_GetNumCameraDrivers_REAL() c_int {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(c_uint, @truncate((@sizeOf(@TypeOf(bootstrap)) / @sizeOf(@TypeOf(bootstrap[@as(c_int, 0)]))) -% @as(c_ulong, 1))));
}
pub export fn SDL_GetCameraDriver_REAL(arg_index_1: c_int) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var index_1 = arg_index_1;
    _ = &index_1;
    if ((index_1 < @as(c_int, 0)) or (index_1 >= SDL_GetNumCameraDrivers_REAL())) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("index"))));
        return null;
    }
    return bootstrap[@bitCast(@as(isize, @intCast(index_1)))].*.name;
}
pub export fn SDL_GetCurrentCameraDriver_REAL() [*c]const u8 {
    @setEvalBranchQuota(100000);
    return camera_driver.name;
}
pub export fn SDL_GetCameraThreadName(device: [*c]SDL_Camera, buf: [*c]u8, buflen: usize) [*c]u8 {
    @setEvalBranchQuota(100000);
    _ = SDL_snprintf_REAL(buf, buflen, "SDLCamera%d", @as(c_int, @bitCast(@as(c_uint, @truncate(device.*.instance_id)))));
    return buf;
}
pub export fn SDL_AddCameraFormat(data: [*c]CameraFormatAddData, format: SDL_PixelFormat, colorspace: SDL_Colorspace, w: c_int, h: c_int, framerate_numerator: c_int, framerate_denominator: c_int) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [19:0]u8 = "SDL_AddCameraFormat".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(data))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "data != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_camera.c", 95);
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
    if (data.*.allocated_specs <= data.*.num_specs) {
        const newalloc: c_int = if (data.*.allocated_specs != 0) data.*.allocated_specs * @as(c_int, 2) else @as(c_int, 16);
        _ = &newalloc;
        var ptr: ?*anyopaque = SDL_realloc_REAL(@ptrCast(@alignCast(data.*.specs)), @sizeOf(SDL_CameraSpec) *% @as(c_ulong, @bitCast(@as(c_long, newalloc))));
        _ = &ptr;
        if (!(ptr != null)) {
            return @"false" != 0;
        }
        data.*.specs = @ptrCast(@alignCast(ptr));
        data.*.allocated_specs = newalloc;
    }
    var spec: [*c]SDL_CameraSpec = &data.*.specs[@bitCast(@as(isize, @intCast(data.*.num_specs)))];
    _ = &spec;
    spec.*.format = format;
    spec.*.colorspace = colorspace;
    spec.*.width = w;
    spec.*.height = h;
    spec.*.framerate_numerator = framerate_numerator;
    spec.*.framerate_denominator = framerate_denominator;
    data.*.num_specs += 1;
    return @"true" != 0;
}
pub fn ZombieWaitDevice(device: [*c]SDL_Camera) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (!(SDL_GetAtomicInt_REAL(&device.*.shutdown) != 0)) {
        const duration: f64 = @as(f64, @floatFromInt(device.*.actual_spec.framerate_denominator)) / @as(f64, @floatFromInt(device.*.actual_spec.framerate_numerator));
        _ = &duration;
        SDL_Delay_REAL(@intFromFloat(duration * @as(f64, 1000.0)));
    }
    return @"true" != 0;
}
pub fn GetFrameBufLen(spec: [*c]const SDL_CameraSpec) callconv(.c) usize {
    @setEvalBranchQuota(100000);
    var w: usize = undefined;
    _ = &w;
    var h: usize = undefined;
    _ = &h;
    var wxh: usize = undefined;
    _ = &wxh;
    var fmt: SDL_PixelFormat = undefined;
    _ = &fmt;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                w = @bitCast(@as(c_long, spec.*.width));
                h = @bitCast(@as(c_long, spec.*.height));
                wxh = w *% h;
                fmt = spec.*.format;
                switch (fmt) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YV12) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_IYUV) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV12) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV21) => {
                        sdl_pc = 5;
                        continue;
                    },
                    else => {
                        sdl_pc = 6;
                        continue;
                    },
                }
            },
            1 => {
                return wxh *% @as(usize, @bitCast(@as(c_long, if ((fmt != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((fmt >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((fmt == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (fmt == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (fmt == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (fmt == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (fmt == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (fmt == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((fmt >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255))))));
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
                return wxh +% (wxh / @as(usize, 2));
            },
            6 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn ZombieAcquireFrame(device: [*c]SDL_Camera, frame: [*c]SDL_Surface, timestampNS: [*c]Uint64, _: [*c]f32) callconv(.c) SDL_CameraFrameResult {
    @setEvalBranchQuota(100000);
    var spec: [*c]const SDL_CameraSpec = undefined;
    _ = &spec;
    var buflen: usize = undefined;
    _ = &buflen;
    var dst: [*c]Uint8 = undefined;
    _ = &dst;
    var i: usize = undefined;
    _ = &i;
    var i_1: usize = undefined;
    _ = &i_1;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                spec = &device.*.actual_spec;
                if (!(device.*.zombie_pixels != null)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                buflen = GetFrameBufLen(&device.*.actual_spec);
                device.*.zombie_pixels = @ptrCast(@alignCast(SDL_aligned_alloc_REAL(SDL_GetSIMDAlignment_REAL(), buflen)));
                if (!(device.*.zombie_pixels != null)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                timestampNS.* = SDL_GetTicksNS_REAL();
                frame.*.pixels = @ptrCast(@alignCast(device.*.zombie_pixels));
                frame.*.pitch = spec.*.width;
                if (!((spec.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((spec.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0))) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            4 => {
                timestampNS.* = 0;
                return SDL_CAMERA_FRAME_SKIP;
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                dst = device.*.zombie_pixels;
                switch (spec.*.format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YV12) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_IYUV) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV12) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV21) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY) => {
                        sdl_pc = 18;
                        continue;
                    },
                    else => {
                        sdl_pc = 23;
                        continue;
                    },
                }
            },
            7 => {
                {
                    sdl_pc = 3;
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
                {
                    sdl_pc = 10;
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
                _ = memset(@ptrCast(@alignCast(dst)), 0, @bitCast(@as(c_long, spec.*.width * spec.*.height)));
                _ = memset(@ptrCast(@alignCast(dst + @as(usize, @bitCast(@as(isize, @intCast(spec.*.width * spec.*.height)))))), 128, @bitCast(@as(c_long, @divTrunc(spec.*.width * spec.*.height, @as(c_int, 2)))));
                {
                    sdl_pc = 7;
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
                i = 0;
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            14 => {
                if (i < buflen) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            15 => {
                dst[i] = 0;
                dst[i +% @as(usize, 1)] = 128;
                dst[i +% @as(usize, 2)] = 0;
                dst[i +% @as(usize, 3)] = 128;
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                i +%= 4;
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            18 => {
                i_1 = 0;
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            19 => {
                if (i_1 < buflen) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            20 => {
                dst[i_1] = 128;
                dst[i_1 +% @as(usize, 1)] = 0;
                dst[i_1 +% @as(usize, 2)] = 128;
                dst[i_1 +% @as(usize, 3)] = 0;
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            21 => {
                i_1 +%= 4;
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            22 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            23 => {
                _ = memset(@ptrCast(@alignCast(dst)), 0, buflen);
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            24 => {
                frame.*.pitch *= if ((spec.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((spec.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((spec.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (spec.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (spec.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (spec.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (spec.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (spec.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((spec.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255)));
                {
                    sdl_pc = 26;
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
                return SDL_CAMERA_FRAME_READY;
            },
            else => unreachable,
        }
    }
}
pub fn ZombieReleaseFrame(device: [*c]SDL_Camera, frame: [*c]SDL_Surface) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (frame.*.pixels != @as(?*anyopaque, @ptrCast(@alignCast(device.*.zombie_pixels)))) {
        camera_driver.impl.ReleaseFrame.?(device, frame);
    }
}
pub fn ClosePhysicalCamera(device: [*c]SDL_Camera) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (!(device != null) or (@as(?*anyopaque, @ptrCast(@alignCast(device.*.hidden))) == @as(?*anyopaque, null))) {
        return;
    }
    _ = SDL_SetAtomicInt_REAL(&device.*.shutdown, 1);
    if (@as(?*anyopaque, @ptrCast(@alignCast(device.*.thread))) != @as(?*anyopaque, null)) {
        SDL_WaitThread_REAL(device.*.thread, null);
        device.*.thread = null;
    }
    ObtainPhysicalCameraObj(device);
    if (!device.*.needs_conversion and !(device.*.needs_scaling != 0)) {
        {
            var i: [*c]SurfaceList = device.*.filled_output_surfaces.next;
            _ = &i;
            while (@as(?*anyopaque, @ptrCast(@alignCast(i))) != @as(?*anyopaque, null)) : (i = i.*.next) {
                device.*.ReleaseFrame.?(device, i.*.surface);
            }
        }
        {
            var i: [*c]SurfaceList = device.*.app_held_output_surfaces.next;
            _ = &i;
            while (@as(?*anyopaque, @ptrCast(@alignCast(i))) != @as(?*anyopaque, null)) : (i = i.*.next) {
                device.*.ReleaseFrame.?(device, i.*.surface);
            }
        }
    }
    camera_driver.impl.CloseDevice.?(device);
    device.*.hidden = null;
    SDL_DestroyProperties_REAL(device.*.props);
    SDL_DestroySurface_REAL(device.*.acquire_surface);
    device.*.acquire_surface = null;
    SDL_DestroySurface_REAL(device.*.conversion_surface);
    device.*.conversion_surface = null;
    {
        var i: c_int = 0;
        _ = &i;
        while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(device.*.output_surfaces)) / @sizeOf(@TypeOf(device.*.output_surfaces[@as(c_int, 0)])))) : (i += 1) {
            SDL_DestroySurface_REAL(device.*.output_surfaces[@bitCast(@as(isize, @intCast(i)))].surface);
        }
    }
    _ = memset(@ptrCast(@alignCast(@as([*c]SurfaceList, @ptrCast(@alignCast(&device.*.output_surfaces))))), 0, @sizeOf(@TypeOf(device.*.output_surfaces)));
    SDL_aligned_free_REAL(@ptrCast(@alignCast(device.*.zombie_pixels)));
    device.*.permission = SDL_CAMERA_PERMISSION_STATE_PENDING;
    device.*.zombie_pixels = null;
    device.*.filled_output_surfaces.next = null;
    device.*.empty_output_surfaces.next = null;
    device.*.app_held_output_surfaces.next = null;
    device.*.base_timestamp = 0;
    device.*.adjust_timestamp = 0;
    _ = memset(@ptrCast(@alignCast(&device.*.spec)), 0, @sizeOf(@TypeOf(device.*.spec)));
    UnrefPhysicalCamera(device);
    ReleaseCamera(device);
}
pub export fn UnrefPhysicalCamera(device: [*c]SDL_Camera) void {
    @setEvalBranchQuota(100000);
    if (SDL_AddAtomicInt_REAL(&device.*.refcount, -@as(c_int, 1)) == @as(c_int, 1)) {
        SDL_LockRWLockForWriting_REAL(camera_driver.device_hash_lock);
        if (SDL_RemoveFromHashTable(camera_driver.device_hash, @ptrFromInt(@as(usize, device.*.instance_id)))) {
            _ = SDL_AddAtomicInt_REAL(&camera_driver.device_count, -@as(c_int, 1));
        }
        SDL_UnlockRWLock_REAL(camera_driver.device_hash_lock);
    }
}
pub export fn RefPhysicalCamera(device: [*c]SDL_Camera) void {
    @setEvalBranchQuota(100000);
    _ = SDL_AddAtomicInt_REAL(&device.*.refcount, 1);
}
pub fn ObtainPhysicalCameraObj(device: [*c]SDL_Camera) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (device != null) {
        RefPhysicalCamera(device);
        SDL_LockMutex_REAL(device.*.lock);
    }
}
pub fn ObtainPhysicalCamera(devid: SDL_CameraID) callconv(.c) [*c]SDL_Camera {
    @setEvalBranchQuota(100000);
    if (!(SDL_GetCurrentCameraDriver_REAL() != null)) {
        _ = SDL_SetError_REAL("Camera subsystem is not initialized");
        return null;
    }
    var device: [*c]SDL_Camera = null;
    _ = &device;
    SDL_LockRWLockForReading_REAL(camera_driver.device_hash_lock);
    _ = SDL_FindInHashTable(camera_driver.device_hash, @ptrFromInt(@as(usize, devid)), @ptrCast(@alignCast(&device)));
    SDL_UnlockRWLock_REAL(camera_driver.device_hash_lock);
    if (!(device != null)) {
        _ = SDL_SetError_REAL("Invalid camera device instance ID");
    } else {
        ObtainPhysicalCameraObj(device);
    }
    return device;
}
pub fn ReleaseCamera(device: [*c]SDL_Camera) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (device != null) {
        SDL_UnlockMutex_REAL(device.*.lock);
        UnrefPhysicalCamera(device);
    }
}
pub fn CameraSpecCmp(vpa: ?*const anyopaque, vpb: ?*const anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [13:0]u8 = "CameraSpecCmp".*;
    };
    _ = &static_local___func__;
    var a: [*c]const SDL_CameraSpec = @ptrCast(@alignCast(vpa));
    _ = &a;
    var b: [*c]const SDL_CameraSpec = @ptrCast(@alignCast(vpb));
    _ = &b;
    while (true) {
        while (!(a.*.format != @as(SDL_PixelFormat, SDL_PIXELFORMAT_UNKNOWN))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "a->format != SDL_PIXELFORMAT_UNKNOWN",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_camera.c", 366);
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
    while (true) {
        while (!(a.*.width > @as(c_int, 0))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "a->width > 0",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_camera.c", 367);
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
    while (true) {
        while (!(a.*.height > @as(c_int, 0))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "a->height > 0",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_camera.c", 368);
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
    while (true) {
        while (!(b.*.format != @as(SDL_PixelFormat, SDL_PIXELFORMAT_UNKNOWN))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "b->format != SDL_PIXELFORMAT_UNKNOWN",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_camera.c", 369);
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
    while (true) {
        while (!(b.*.width > @as(c_int, 0))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "b->width > 0",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_camera.c", 370);
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
    while (true) {
        while (!(b.*.height > @as(c_int, 0))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "b->height > 0",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_camera.c", 371);
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
    const afmt: SDL_PixelFormat = a.*.format;
    _ = &afmt;
    const bfmt: SDL_PixelFormat = b.*.format;
    _ = &bfmt;
    if (((afmt != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((afmt >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and !((bfmt != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((bfmt >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0))) {
        return -@as(c_int, 1);
    } else if (!((afmt != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((afmt >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((bfmt != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((bfmt >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0))) {
        return 1;
    } else if ((if ((afmt != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((afmt >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) @as(c_int, 0) else @as(c_int, @bitCast((afmt >> @intCast(@as(SDL_PixelFormat, 8))) & @as(SDL_PixelFormat, 255)))) > (if ((bfmt != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((bfmt >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) @as(c_int, 0) else @as(c_int, @bitCast((bfmt >> @intCast(@as(SDL_PixelFormat, 8))) & @as(SDL_PixelFormat, 255))))) {
        return -@as(c_int, 1);
    } else if ((if ((bfmt != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((bfmt >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) @as(c_int, 0) else @as(c_int, @bitCast((bfmt >> @intCast(@as(SDL_PixelFormat, 8))) & @as(SDL_PixelFormat, 255)))) > (if ((afmt != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((afmt >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) @as(c_int, 0) else @as(c_int, @bitCast((afmt >> @intCast(@as(SDL_PixelFormat, 8))) & @as(SDL_PixelFormat, 255))))) {
        return 1;
    } else if (a.*.width > b.*.width) {
        return -@as(c_int, 1);
    } else if (b.*.width > a.*.width) {
        return 1;
    } else if (a.*.height > b.*.height) {
        return -@as(c_int, 1);
    } else if (b.*.height > a.*.height) {
        return 1;
    }
    if ((a.*.framerate_numerator != 0) and !(b.*.framerate_numerator != 0)) {
        return -@as(c_int, 1);
    } else if (!(a.*.framerate_numerator != 0) and (b.*.framerate_numerator != 0)) {
        return 1;
    }
    const fpsa: f32 = @as(f32, @floatFromInt(a.*.framerate_numerator)) / @as(f32, @floatFromInt(a.*.framerate_denominator));
    _ = &fpsa;
    const fpsb: f32 = @as(f32, @floatFromInt(b.*.framerate_numerator)) / @as(f32, @floatFromInt(b.*.framerate_denominator));
    _ = &fpsb;
    if (fpsa > fpsb) {
        return -@as(c_int, 1);
    } else if (fpsb > fpsa) {
        return 1;
    }
    if ((@as(SDL_ColorRange, (a.*.colorspace >> @intCast(@as(SDL_Colorspace, 24))) & @as(SDL_Colorspace, 15)) == @as(SDL_ColorRange, SDL_COLOR_RANGE_FULL)) and (@as(SDL_ColorRange, (b.*.colorspace >> @intCast(@as(SDL_Colorspace, 24))) & @as(SDL_Colorspace, 15)) != @as(SDL_ColorRange, SDL_COLOR_RANGE_FULL))) {
        return -@as(c_int, 1);
    }
    if ((@as(SDL_ColorRange, (a.*.colorspace >> @intCast(@as(SDL_Colorspace, 24))) & @as(SDL_Colorspace, 15)) != @as(SDL_ColorRange, SDL_COLOR_RANGE_FULL)) and (@as(SDL_ColorRange, (b.*.colorspace >> @intCast(@as(SDL_Colorspace, 24))) & @as(SDL_Colorspace, 15)) == @as(SDL_ColorRange, SDL_COLOR_RANGE_FULL))) {
        return 1;
    }
    return 0;
}
pub export fn SDL_AddCamera(name: [*c]const u8, position: SDL_CameraPosition, arg_num_specs: c_int, specs: [*c]const SDL_CameraSpec, handle: ?*anyopaque) [*c]SDL_Camera {
    @setEvalBranchQuota(100000);
    var num_specs = arg_num_specs;
    _ = &num_specs;
    const static_local___func__ = struct {
        const __func__: [13:0]u8 = "SDL_AddCamera".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(@constCast(name)))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "name != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_camera.c", 423);
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
    while (true) {
        while (!(num_specs >= @as(c_int, 0))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "num_specs >= 0",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_camera.c", 424);
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
    while (true) {
        while (!(@intFromBool(@as(?*anyopaque, @ptrCast(@alignCast(@constCast(specs)))) != @as(?*anyopaque, null)) == @intFromBool(num_specs > @as(c_int, 0)))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "(specs != ((void*)0)) == (num_specs > 0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_camera.c", 425);
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
    while (true) {
        while (!(handle != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "handle != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_camera.c", 426);
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
    SDL_LockRWLockForReading_REAL(camera_driver.device_hash_lock);
    const shutting_down: c_int = SDL_GetAtomicInt_REAL(&camera_driver.shutting_down);
    _ = &shutting_down;
    SDL_UnlockRWLock_REAL(camera_driver.device_hash_lock);
    if (shutting_down != 0) {
        return null;
    }
    var device: [*c]SDL_Camera = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(SDL_Camera))));
    _ = &device;
    if (!(device != null)) {
        return null;
    }
    device.*.name = SDL_strdup_REAL(name);
    if (!(device.*.name != null)) {
        SDL_free_REAL(@ptrCast(@alignCast(device)));
        return null;
    }
    device.*.position = position;
    device.*.lock = SDL_CreateMutex_REAL();
    if (!(device.*.lock != null)) {
        SDL_free_REAL(@ptrCast(@alignCast(device.*.name)));
        SDL_free_REAL(@ptrCast(@alignCast(device)));
        return null;
    }
    device.*.all_specs = @ptrCast(@alignCast(SDL_calloc_REAL(@bitCast(@as(c_long, num_specs + @as(c_int, 1))), @sizeOf(@TypeOf(specs.*)))));
    if (!(device.*.all_specs != null)) {
        SDL_DestroyMutex_REAL(device.*.lock);
        SDL_free_REAL(@ptrCast(@alignCast(device.*.name)));
        SDL_free_REAL(@ptrCast(@alignCast(device)));
        return null;
    }
    if (num_specs > @as(c_int, 0)) {
        _ = memcpy(@ptrCast(@alignCast(device.*.all_specs)), @ptrCast(@alignCast(specs)), @sizeOf(@TypeOf(specs.*)) *% @as(c_ulong, @bitCast(@as(c_long, num_specs))));
        SDL_qsort_REAL(@ptrCast(@alignCast(device.*.all_specs)), @bitCast(@as(c_long, num_specs)), @sizeOf(@TypeOf(specs.*)), CameraSpecCmp);
        {
            var i: c_int = 0;
            _ = &i;
            while (i < num_specs) : (i += 1) {
                var a: [*c]SDL_CameraSpec = &device.*.all_specs[@bitCast(@as(isize, @intCast(i)))];
                _ = &a;
                var b: [*c]SDL_CameraSpec = &device.*.all_specs[@bitCast(@as(isize, @intCast(i + @as(c_int, 1))))];
                _ = &b;
                if (SDL_memcmp_REAL(@ptrCast(@alignCast(a)), @ptrCast(@alignCast(b)), @sizeOf(@TypeOf(a.*))) == @as(c_int, 0)) {
                    _ = memmove(@ptrCast(@alignCast(a)), @ptrCast(@alignCast(b)), @sizeOf(@TypeOf(specs.*)) *% @as(c_ulong, @bitCast(@as(c_long, num_specs - i))));
                    i -= 1;
                    num_specs -= 1;
                }
            }
        }
    }
    device.*.num_specs = num_specs;
    device.*.handle = handle;
    device.*.instance_id = SDL_GetNextObjectID();
    _ = SDL_SetAtomicInt_REAL(&device.*.shutdown, 0);
    _ = SDL_SetAtomicInt_REAL(&device.*.zombie, 0);
    RefPhysicalCamera(device);
    SDL_LockRWLockForWriting_REAL(camera_driver.device_hash_lock);
    if (SDL_InsertIntoHashTable(camera_driver.device_hash, @ptrFromInt(@as(usize, device.*.instance_id)), @ptrCast(@alignCast(device)), @"false" != 0)) {
        _ = SDL_AddAtomicInt_REAL(&camera_driver.device_count, 1);
    } else {
        SDL_DestroyMutex_REAL(device.*.lock);
        SDL_free_REAL(@ptrCast(@alignCast(device.*.all_specs)));
        SDL_free_REAL(@ptrCast(@alignCast(device.*.name)));
        SDL_free_REAL(@ptrCast(@alignCast(device)));
        device = null;
    }
    if (device != null) {
        var p: [*c]SDL_PendingCameraEvent = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(SDL_PendingCameraEvent))));
        _ = &p;
        if (p != null) {
            p.*.type = SDL_EVENT_CAMERA_DEVICE_ADDED;
            p.*.devid = device.*.instance_id;
            p.*.next = null;
            while (true) {
                while (!(@as(?*anyopaque, @ptrCast(@alignCast(camera_driver.pending_events_tail))) != @as(?*anyopaque, null))) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "camera_driver.pending_events_tail != ((void*)0)",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_camera.c", 518);
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
            while (true) {
                while (!(@as(?*anyopaque, @ptrCast(@alignCast(camera_driver.pending_events_tail.*.next))) == @as(?*anyopaque, null))) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "camera_driver.pending_events_tail->next == ((void*)0)",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_camera.c", 519);
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
            camera_driver.pending_events_tail.*.next = p;
            camera_driver.pending_events_tail = p;
        }
    }
    SDL_UnlockRWLock_REAL(camera_driver.device_hash_lock);
    return device;
}
pub export fn SDL_CameraDisconnected(device: [*c]SDL_Camera) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [22:0]u8 = "SDL_CameraDisconnected".*;
    };
    _ = &static_local___func__;
    if (!(device != null)) {
        return;
    }
    var pending: SDL_PendingCameraEvent = undefined;
    _ = &pending;
    pending.next = null;
    var pending_tail: [*c]SDL_PendingCameraEvent = &pending;
    _ = &pending_tail;
    ObtainPhysicalCameraObj(device);
    const first_disconnect: bool = SDL_CompareAndSwapAtomicInt_REAL(&device.*.zombie, 0, 1);
    _ = &first_disconnect;
    if (first_disconnect) {
        device.*.WaitDevice = ZombieWaitDevice;
        device.*.AcquireFrame = ZombieAcquireFrame;
        device.*.ReleaseFrame = ZombieReleaseFrame;
        device.*.adjust_timestamp = 0;
        device.*.base_timestamp = 0;
        var p: [*c]SDL_PendingCameraEvent = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(SDL_PendingCameraEvent))));
        _ = &p;
        if (p != null) {
            p.*.type = SDL_EVENT_CAMERA_DEVICE_REMOVED;
            p.*.devid = device.*.instance_id;
            p.*.next = null;
            pending_tail.*.next = p;
            pending_tail = p;
        }
        UnrefPhysicalCamera(device);
    }
    ReleaseCamera(device);
    if (first_disconnect) {
        if (pending.next != null) {
            SDL_LockRWLockForWriting_REAL(camera_driver.device_hash_lock);
            while (true) {
                while (!(@as(?*anyopaque, @ptrCast(@alignCast(camera_driver.pending_events_tail))) != @as(?*anyopaque, null))) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "camera_driver.pending_events_tail != ((void*)0)",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_camera.c", 581);
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
            while (true) {
                while (!(@as(?*anyopaque, @ptrCast(@alignCast(camera_driver.pending_events_tail.*.next))) == @as(?*anyopaque, null))) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "camera_driver.pending_events_tail->next == ((void*)0)",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_camera.c", 582);
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
            camera_driver.pending_events_tail.*.next = pending.next;
            camera_driver.pending_events_tail = pending_tail;
            SDL_UnlockRWLock_REAL(camera_driver.device_hash_lock);
        }
    }
}
pub export fn SDL_CameraPermissionOutcome(device: [*c]SDL_Camera, approved: bool) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [27:0]u8 = "SDL_CameraPermissionOutcome".*;
    };
    _ = &static_local___func__;
    if (!(device != null)) {
        return;
    }
    var pending: SDL_PendingCameraEvent = undefined;
    _ = &pending;
    pending.next = null;
    var pending_tail: [*c]SDL_PendingCameraEvent = &pending;
    _ = &pending_tail;
    const permission: SDL_CameraPermissionState = if (approved) SDL_CAMERA_PERMISSION_STATE_APPROVED else SDL_CAMERA_PERMISSION_STATE_DENIED;
    _ = &permission;
    ObtainPhysicalCameraObj(device);
    if (device.*.permission != permission) {
        device.*.permission = permission;
        var p: [*c]SDL_PendingCameraEvent = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(SDL_PendingCameraEvent))));
        _ = &p;
        if (p != null) {
            p.*.type = @bitCast(@as(c_int, if (approved) SDL_EVENT_CAMERA_DEVICE_APPROVED else SDL_EVENT_CAMERA_DEVICE_DENIED));
            p.*.devid = device.*.instance_id;
            p.*.next = null;
            pending_tail.*.next = p;
            pending_tail = p;
        }
    }
    ReleaseCamera(device);
    if (pending.next != null) {
        SDL_LockRWLockForWriting_REAL(camera_driver.device_hash_lock);
        while (true) {
            while (!(@as(?*anyopaque, @ptrCast(@alignCast(camera_driver.pending_events_tail))) != @as(?*anyopaque, null))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "camera_driver.pending_events_tail != ((void*)0)",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_camera.c", 619);
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
        while (true) {
            while (!(@as(?*anyopaque, @ptrCast(@alignCast(camera_driver.pending_events_tail.*.next))) == @as(?*anyopaque, null))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "camera_driver.pending_events_tail->next == ((void*)0)",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_camera.c", 620);
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
        camera_driver.pending_events_tail.*.next = pending.next;
        camera_driver.pending_events_tail = pending_tail;
        SDL_UnlockRWLock_REAL(camera_driver.device_hash_lock);
    }
}
pub const struct_FindOnePhysicalCameraByCallbackData = extern struct {
    callback: ?*const fn (userdata: ?*anyopaque, device: [*c]SDL_Camera) callconv(.c) bool = null,
    userdata: ?*anyopaque = null,
    device: [*c]SDL_Camera = null,
};
pub const FindOnePhysicalCameraByCallbackData = struct_FindOnePhysicalCameraByCallbackData;
pub fn FindOnePhysicalCameraByCallback(userdata: ?*anyopaque, _: ?*const SDL_HashTable, _: ?*const anyopaque, value: ?*const anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]FindOnePhysicalCameraByCallbackData = @ptrCast(@alignCast(userdata));
    _ = &data;
    var device: [*c]SDL_Camera = @ptrCast(@alignCast(@constCast(value)));
    _ = &device;
    if (data.*.callback.?(data.*.userdata, device)) {
        data.*.device = device;
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub export fn SDL_FindPhysicalCameraByCallback(callback: ?*const fn (userdata: ?*anyopaque, device: [*c]SDL_Camera) callconv(.c) bool, userdata: ?*anyopaque) [*c]SDL_Camera {
    @setEvalBranchQuota(100000);
    if (!(SDL_GetCurrentCameraDriver_REAL() != null)) {
        _ = SDL_SetError_REAL("Camera subsystem is not initialized");
        return null;
    }
    var data: FindOnePhysicalCameraByCallbackData = FindOnePhysicalCameraByCallbackData{
        .callback = callback,
        .userdata = userdata,
        .device = null,
    };
    _ = &data;
    SDL_LockRWLockForReading_REAL(camera_driver.device_hash_lock);
    _ = SDL_IterateHashTable(camera_driver.device_hash, FindOnePhysicalCameraByCallback, @ptrCast(@alignCast(&data)));
    SDL_UnlockRWLock_REAL(camera_driver.device_hash_lock);
    if (!(data.device != null)) {
        _ = SDL_SetError_REAL("Device not found");
    }
    return data.device;
}
pub export fn SDL_CloseCamera_REAL(camera: [*c]SDL_Camera) void {
    @setEvalBranchQuota(100000);
    var device: [*c]SDL_Camera = camera;
    _ = &device;
    ClosePhysicalCamera(device);
}
pub export fn SDL_GetCameraFormat_REAL(camera: [*c]SDL_Camera, spec: [*c]SDL_CameraSpec) bool {
    @setEvalBranchQuota(100000);
    var result: bool = undefined;
    _ = &result;
    if (!(camera != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("camera"))));
    }
    if (!(spec != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("spec"))));
    }
    var device: [*c]SDL_Camera = camera;
    _ = &device;
    ObtainPhysicalCameraObj(device);
    if (device.*.permission > SDL_CAMERA_PERMISSION_STATE_PENDING) {
        {
            comptime {
                if (!(@sizeOf(@TypeOf(spec.*)) == @sizeOf(@TypeOf((&device.*.spec).*)))) @compileError("static assertion failed \"sizeof (*(spec)) == sizeof (*( &device->spec))\"");
            }
        }
        _ = memcpy(@ptrCast(@alignCast(spec)), @ptrCast(@alignCast(&device.*.spec)), @sizeOf(@TypeOf((&device.*.spec).*)));
        result = @"true" != 0;
    } else {
        _ = memset(@ptrCast(@alignCast(spec)), 0, @sizeOf(@TypeOf(spec.*)));
        result = SDL_SetError_REAL("Camera permission has not been granted");
    }
    ReleaseCamera(device);
    return result;
}
pub export fn SDL_GetCameraName_REAL(instance_id: SDL_CameraID) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var result: [*c]const u8 = null;
    _ = &result;
    var device: [*c]SDL_Camera = ObtainPhysicalCamera(instance_id);
    _ = &device;
    if (device != null) {
        result = SDL_GetPersistentString(device.*.name);
        ReleaseCamera(device);
    }
    return result;
}
pub export fn SDL_GetCameraPosition_REAL(instance_id: SDL_CameraID) SDL_CameraPosition {
    @setEvalBranchQuota(100000);
    var result: SDL_CameraPosition = SDL_CAMERA_POSITION_UNKNOWN;
    _ = &result;
    var device: [*c]SDL_Camera = ObtainPhysicalCamera(instance_id);
    _ = &device;
    if (device != null) {
        result = device.*.position;
        ReleaseCamera(device);
    }
    return result;
}
pub const struct_GetOneCameraData = extern struct {
    result: [*c]SDL_CameraID = null,
    devs_seen: c_int = 0,
};
pub const GetOneCameraData = struct_GetOneCameraData;
pub fn GetOneCamera(userdata: ?*anyopaque, _: ?*const SDL_HashTable, key: ?*const anyopaque, _: ?*const anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]GetOneCameraData = @ptrCast(@alignCast(userdata));
    _ = &data;
    data.*.result[
        @bitCast(@as(isize, @intCast(blk: {
            const ref = &data.*.devs_seen;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        })))
    ] = @truncate(@as(usize, @intCast(@intFromPtr(key))));
    return @"true" != 0;
}
pub export fn SDL_GetCameras_REAL(arg_count: [*c]c_int) [*c]SDL_CameraID {
    @setEvalBranchQuota(100000);
    var count = arg_count;
    _ = &count;
    const static_local___func__ = struct {
        const __func__: [19:0]u8 = "SDL_GetCameras_REAL".*;
    };
    _ = &static_local___func__;
    var dummy_count: c_int = undefined;
    _ = &dummy_count;
    if (!(count != null)) {
        count = &dummy_count;
    }
    if (!(SDL_GetCurrentCameraDriver_REAL() != null)) {
        count.* = 0;
        _ = SDL_SetError_REAL("Camera subsystem is not initialized");
        return null;
    }
    var result: [*c]SDL_CameraID = null;
    _ = &result;
    SDL_LockRWLockForReading_REAL(camera_driver.device_hash_lock);
    var num_devices: c_int = SDL_GetAtomicInt_REAL(&camera_driver.device_count);
    _ = &num_devices;
    result = @ptrCast(@alignCast(SDL_malloc_REAL(@as(c_ulong, @bitCast(@as(c_long, num_devices + @as(c_int, 1)))) *% @sizeOf(SDL_CameraID))));
    if (!(result != null)) {
        num_devices = 0;
    } else {
        var data: GetOneCameraData = GetOneCameraData{
            .result = result,
            .devs_seen = 0,
        };
        _ = &data;
        _ = SDL_IterateHashTable(camera_driver.device_hash, GetOneCamera, @ptrCast(@alignCast(&data)));
        while (true) {
            while (!(data.devs_seen == num_devices)) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "data.devs_seen == num_devices",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_camera.c", 754);
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
        result[@bitCast(@as(isize, @intCast(num_devices)))] = 0;
    }
    SDL_UnlockRWLock_REAL(camera_driver.device_hash_lock);
    count.* = num_devices;
    return result;
}
pub export fn SDL_GetCameraSupportedFormats_REAL(instance_id: SDL_CameraID, count: [*c]c_int) [*c][*c]SDL_CameraSpec {
    @setEvalBranchQuota(100000);
    if (count != null) {
        count.* = 0;
    }
    var device: [*c]SDL_Camera = ObtainPhysicalCamera(instance_id);
    _ = &device;
    if (!(device != null)) {
        return null;
    }
    var i: c_int = undefined;
    _ = &i;
    var num_specs: c_int = device.*.num_specs;
    _ = &num_specs;
    var result: [*c][*c]SDL_CameraSpec = undefined;
    result = @ptrCast(@alignCast(SDL_malloc_REAL((@as(c_ulong, @bitCast(@as(c_long, num_specs + @as(c_int, 1)))) *% @sizeOf(@TypeOf(result.*))) +% (@as(c_ulong, @bitCast(@as(c_long, num_specs))) *% @sizeOf(@TypeOf(result.*.*))))));
    _ = &result;
    if (result != null) {
        var specs: [*c]SDL_CameraSpec = @ptrCast(@alignCast(result + @as(usize, @bitCast(@as(isize, @intCast(num_specs + @as(c_int, 1)))))));
        _ = &specs;
        _ = memcpy(@ptrCast(@alignCast(specs)), @ptrCast(@alignCast(device.*.all_specs)), @as(c_ulong, @bitCast(@as(c_long, num_specs))) *% @sizeOf(@TypeOf(specs.*)));
        {
            i = 0;
            while (i < num_specs) : (i += 1) {
                result[@bitCast(@as(isize, @intCast(i)))] = blk: {
                    const ref = &specs;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                };
            }
        }
        result[@bitCast(@as(isize, @intCast(i)))] = null;
        if (count != null) {
            count.* = num_specs;
        }
    }
    ReleaseCamera(device);
    return result;
}
pub export fn SDL_CameraThreadSetup(_: [*c]SDL_Camera) void {
    @setEvalBranchQuota(100000);
    _ = SDL_SetCurrentThreadPriority_REAL(SDL_THREAD_PRIORITY_HIGH);
}
pub export fn SDL_CameraThreadIterate(device: [*c]SDL_Camera) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [23:0]u8 = "SDL_CameraThreadIterate".*;
    };
    _ = &static_local___func__;
    SDL_LockMutex_REAL(device.*.lock);
    if (SDL_GetAtomicInt_REAL(&device.*.shutdown) != 0) {
        SDL_UnlockMutex_REAL(device.*.lock);
        return @"false" != 0;
    }
    const permission: c_int = device.*.permission;
    _ = &permission;
    if (permission <= SDL_CAMERA_PERMISSION_STATE_PENDING) {
        SDL_UnlockMutex_REAL(device.*.lock);
        return (if (permission < SDL_CAMERA_PERMISSION_STATE_PENDING) @"false" else @"true") != 0;
    }
    var failed: bool = @"false" != 0;
    _ = &failed;
    var acquired: [*c]SDL_Surface = null;
    _ = &acquired;
    var output_surface: [*c]SDL_Surface = null;
    _ = &output_surface;
    var slist: [*c]SurfaceList = null;
    _ = &slist;
    var timestampNS: Uint64 = 0;
    _ = &timestampNS;
    var rotation: f32 = 0.0;
    _ = &rotation;
    const rc: SDL_CameraFrameResult = device.*.AcquireFrame.?(device, device.*.acquire_surface, &timestampNS, &rotation);
    _ = &rc;
    if (rc == @as(SDL_CameraFrameResult, SDL_CAMERA_FRAME_READY)) {
        if (device.*.drop_frames > @as(c_int, 0)) {
            device.*.drop_frames -= 1;
            device.*.ReleaseFrame.?(device, device.*.acquire_surface);
            device.*.acquire_surface.*.pixels = null;
            device.*.acquire_surface.*.pitch = 0;
        } else if (@as(?*anyopaque, @ptrCast(@alignCast(device.*.empty_output_surfaces.next))) == @as(?*anyopaque, null)) {
            device.*.ReleaseFrame.?(device, device.*.acquire_surface);
            device.*.acquire_surface.*.pixels = null;
            device.*.acquire_surface.*.pitch = 0;
        } else {
            if (!(device.*.adjust_timestamp != 0)) {
                device.*.adjust_timestamp = SDL_GetTicksNS_REAL();
                device.*.base_timestamp = timestampNS;
            }
            timestampNS = (timestampNS -% device.*.base_timestamp) +% device.*.adjust_timestamp;
            slist = device.*.empty_output_surfaces.next;
            output_surface = slist.*.surface;
            device.*.empty_output_surfaces.next = slist.*.next;
            acquired = device.*.acquire_surface;
            slist.*.timestampNS = timestampNS;
        }
    } else if (rc == @as(SDL_CameraFrameResult, SDL_CAMERA_FRAME_SKIP)) {} else {
        failed = @"true" != 0;
    }
    SDL_UnlockMutex_REAL(device.*.lock);
    if (failed) {
        while (true) {
            while (!(@as(?*anyopaque, @ptrCast(@alignCast(slist))) == @as(?*anyopaque, null))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "slist == ((void*)0)",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_camera.c", 891);
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
        while (true) {
            while (!(@as(?*anyopaque, @ptrCast(@alignCast(acquired))) == @as(?*anyopaque, null))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "acquired == ((void*)0)",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_camera.c", 892);
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
        SDL_CameraDisconnected(device);
    } else if (acquired != null) {
        while (true) {
            while (!(@as(?*anyopaque, @ptrCast(@alignCast(slist))) != @as(?*anyopaque, null))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "slist != ((void*)0)",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_camera.c", 895);
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
        if (!(device.*.needs_scaling != 0) and !device.*.needs_conversion) {
            output_surface.*.w = acquired.*.w;
            output_surface.*.h = acquired.*.h;
            output_surface.*.pixels = acquired.*.pixels;
            output_surface.*.pitch = acquired.*.pitch;
        } else {
            var srcsurf: [*c]SDL_Surface = acquired;
            _ = &srcsurf;
            if (device.*.needs_scaling == -@as(c_int, 1)) {
                var dstsurf: [*c]SDL_Surface = if (device.*.needs_conversion) device.*.conversion_surface else output_surface;
                _ = &dstsurf;
                _ = SDL_StretchSurface_REAL(srcsurf, null, dstsurf, null, SDL_SCALEMODE_NEAREST);
                srcsurf = dstsurf;
            }
            if (device.*.needs_conversion) {
                var dstsurf: [*c]SDL_Surface = if (device.*.needs_scaling == @as(c_int, 1)) device.*.conversion_surface else output_surface;
                _ = &dstsurf;
                _ = SDL_ConvertPixels_REAL(srcsurf.*.w, srcsurf.*.h, srcsurf.*.format, srcsurf.*.pixels, srcsurf.*.pitch, dstsurf.*.format, dstsurf.*.pixels, dstsurf.*.pitch);
                srcsurf = dstsurf;
            }
            if (device.*.needs_scaling == @as(c_int, 1)) {
                _ = SDL_StretchSurface_REAL(srcsurf, null, output_surface, null, SDL_SCALEMODE_NEAREST);
            }
            device.*.ReleaseFrame.?(device, acquired);
        }
        acquired.*.pixels = null;
        acquired.*.pitch = 0;
        _ = SDL_SetFloatProperty_REAL(SDL_GetSurfaceProperties_REAL(output_surface), "SDL.surface.rotation", rotation);
        SDL_LockMutex_REAL(device.*.lock);
        slist.*.next = device.*.filled_output_surfaces.next;
        device.*.filled_output_surfaces.next = slist;
        SDL_UnlockMutex_REAL(device.*.lock);
    }
    return @"true" != 0;
}
pub export fn SDL_CameraThreadShutdown(_: [*c]SDL_Camera) void {
    @setEvalBranchQuota(100000);
}
pub fn CameraThread(devicep: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [12:0]u8 = "CameraThread".*;
    };
    _ = &static_local___func__;
    var device: [*c]SDL_Camera = @ptrCast(@alignCast(devicep));
    _ = &device;
    RefPhysicalCamera(device);
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(device))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "device != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_camera.c", 963);
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
    SDL_CameraThreadSetup(device);
    while (true) {
        if (!device.*.WaitDevice.?(device)) {
            SDL_CameraDisconnected(device);
        }
        if (!SDL_CameraThreadIterate(device)) break;
    }
    SDL_CameraThreadShutdown(device);
    UnrefPhysicalCamera(device);
    return 0;
}
pub export fn SDL_PrepareCameraSurfaces(device: [*c]SDL_Camera) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [25:0]u8 = "SDL_PrepareCameraSurfaces".*;
    };
    _ = &static_local___func__;
    var appspec: [*c]SDL_CameraSpec = undefined;
    _ = &appspec;
    var devspec: [*c]const SDL_CameraSpec = undefined;
    _ = &devspec;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "device->acquire_surface == ((void*)0)",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data;
    var sdl_assert_state: SDL_AssertState = undefined;
    _ = &sdl_assert_state;
    const static_local_sdl_assert_data_1 = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "devspec->format != SDL_PIXELFORMAT_UNKNOWN",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data_1;
    var sdl_assert_state_2: SDL_AssertState = undefined;
    _ = &sdl_assert_state_2;
    const static_local_sdl_assert_data_3 = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "devspec->width >= 0",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data_3;
    var sdl_assert_state_4: SDL_AssertState = undefined;
    _ = &sdl_assert_state_4;
    const static_local_sdl_assert_data_5 = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "devspec->height >= 0",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data_5;
    var sdl_assert_state_6: SDL_AssertState = undefined;
    _ = &sdl_assert_state_6;
    var srcarea: Uint64 = undefined;
    _ = &srcarea;
    var dstarea: Uint64 = undefined;
    _ = &dstarea;
    var downscaling_first: bool = undefined;
    _ = &downscaling_first;
    var s: [*c]const SDL_CameraSpec = undefined;
    _ = &s;
    var fmt: SDL_PixelFormat = undefined;
    _ = &fmt;
    var i: c_int = undefined;
    _ = &i;
    var i_7: c_int = undefined;
    _ = &i_7;
    var surf: [*c]SDL_Surface = undefined;
    _ = &surf;
    var i_8: c_int = undefined;
    _ = &i_8;
    var surf_9: [*c]SDL_Surface = undefined;
    _ = &surf_9;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                appspec = &device.*.spec;
                devspec = &device.*.actual_spec;
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                if (device.*.acquire_surface != null) {
                    sdl_pc = 88;
                    continue;
                } else {
                    sdl_pc = 89;
                    continue;
                }
            },
            2 => {
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            3 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            5 => {
                if (!(@as(?*anyopaque, @ptrCast(@alignCast(device.*.acquire_surface))) == @as(?*anyopaque, null))) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 7;
                    continue;
                }
            },
            6 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_camera.c", 988);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
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
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            9 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            10 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            11 => {
                __builtin.debugtrap();
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
                    sdl_pc = 10;
                    continue;
                }
            },
            14 => {
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            15 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            17 => {
                if (!(devspec.*.format != @as(SDL_PixelFormat, SDL_PIXELFORMAT_UNKNOWN))) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            18 => {
                sdl_assert_state_2 = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data_1.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_camera.c", 989);
                if (sdl_assert_state_2 == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            19 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            20 => {
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            21 => {
                if (sdl_assert_state_2 == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            22 => {
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            23 => {
                __builtin.debugtrap();
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
                    sdl_pc = 38;
                    continue;
                }
            },
            29 => {
                if (!(devspec.*.width >= @as(c_int, 0))) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            30 => {
                sdl_assert_state_4 = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data_3.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_camera.c", 990);
                if (sdl_assert_state_4 == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
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
                if (sdl_assert_state_4 == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
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
            38 => {
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            39 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 40;
                    continue;
                }
            },
            40 => {
                if ((appspec.*.width <= @as(c_int, 0)) or (appspec.*.height <= @as(c_int, 0))) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            41 => {
                if (!(devspec.*.height >= @as(c_int, 0))) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 43;
                    continue;
                }
            },
            42 => {
                sdl_assert_state_6 = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data_5.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_camera.c", 991);
                if (sdl_assert_state_6 == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            43 => {
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            44 => {
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            45 => {
                if (sdl_assert_state_6 == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            46 => {
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            47 => {
                __builtin.debugtrap();
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
                    sdl_pc = 46;
                    continue;
                }
            },
            50 => {
                appspec.*.width = devspec.*.width;
                appspec.*.height = devspec.*.height;
                {
                    sdl_pc = 52;
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
                if (appspec.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UNKNOWN)) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 54;
                    continue;
                }
            },
            53 => {
                appspec.*.format = devspec.*.format;
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            54 => {
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            55 => {
                if (appspec.*.framerate_denominator == @as(c_int, 0)) {
                    sdl_pc = 56;
                    continue;
                } else {
                    sdl_pc = 57;
                    continue;
                }
            },
            56 => {
                appspec.*.framerate_numerator = devspec.*.framerate_numerator;
                appspec.*.framerate_denominator = devspec.*.framerate_denominator;
                {
                    sdl_pc = 58;
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
                if ((devspec.*.width == appspec.*.width) and (devspec.*.height == appspec.*.height)) {
                    sdl_pc = 59;
                    continue;
                } else {
                    sdl_pc = 60;
                    continue;
                }
            },
            59 => {
                device.*.needs_scaling = 0;
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            60 => {
                srcarea = @as(Uint64, @bitCast(@as(c_long, devspec.*.width))) *% @as(Uint64, @bitCast(@as(c_long, devspec.*.height)));
                dstarea = @as(Uint64, @bitCast(@as(c_long, appspec.*.width))) *% @as(Uint64, @bitCast(@as(c_long, appspec.*.height)));
                if (dstarea <= srcarea) {
                    sdl_pc = 62;
                    continue;
                } else {
                    sdl_pc = 63;
                    continue;
                }
            },
            61 => {
                device.*.needs_conversion = devspec.*.format != appspec.*.format;
                device.*.acquire_surface = SDL_CreateSurfaceFrom_REAL(devspec.*.width, devspec.*.height, devspec.*.format, null, 0);
                if (!(device.*.acquire_surface != null)) {
                    sdl_pc = 65;
                    continue;
                } else {
                    sdl_pc = 66;
                    continue;
                }
            },
            62 => {
                device.*.needs_scaling = -@as(c_int, 1);
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            63 => {
                device.*.needs_scaling = 1;
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            64 => {
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            65 => {
                {
                    sdl_pc = 1;
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
                _ = SDL_SetSurfaceColorspace_REAL(device.*.acquire_surface, devspec.*.colorspace);
                if ((device.*.needs_scaling != 0) and device.*.needs_conversion) {
                    sdl_pc = 68;
                    continue;
                } else {
                    sdl_pc = 69;
                    continue;
                }
            },
            68 => {
                downscaling_first = device.*.needs_scaling < @as(c_int, 0);
                s = if (downscaling_first) @as([*c]const SDL_CameraSpec, @ptrCast(@alignCast(appspec))) else devspec;
                fmt = if (downscaling_first) devspec.*.format else appspec.*.format;
                device.*.conversion_surface = SDL_CreateSurfaceUninitialized(s.*.width, s.*.height, fmt);
                if (!(device.*.conversion_surface != null)) {
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
                i = 0;
                {
                    sdl_pc = 74;
                    continue;
                }
            },
            71 => {
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
                _ = SDL_SetSurfaceColorspace_REAL(device.*.conversion_surface, devspec.*.colorspace);
                {
                    sdl_pc = 70;
                    continue;
                }
            },
            74 => {
                if (@as(c_ulong, @bitCast(@as(c_long, i))) < ((@sizeOf(@TypeOf(device.*.output_surfaces)) / @sizeOf(@TypeOf(device.*.output_surfaces[@as(c_int, 0)]))) -% @as(c_ulong, 1))) {
                    sdl_pc = 75;
                    continue;
                } else {
                    sdl_pc = 77;
                    continue;
                }
            },
            75 => {
                device.*.output_surfaces[@bitCast(@as(isize, @intCast(i)))].next = &device.*.output_surfaces[@bitCast(@as(isize, @intCast(i + @as(c_int, 1))))];
                {
                    sdl_pc = 76;
                    continue;
                }
            },
            76 => {
                i += 1;
                {
                    sdl_pc = 74;
                    continue;
                }
            },
            77 => {
                device.*.empty_output_surfaces.next = @ptrCast(@alignCast(&device.*.output_surfaces));
                i_7 = 0;
                {
                    sdl_pc = 78;
                    continue;
                }
            },
            78 => {
                if (@as(c_ulong, @bitCast(@as(c_long, i_7))) < (@sizeOf(@TypeOf(device.*.output_surfaces)) / @sizeOf(@TypeOf(device.*.output_surfaces[@as(c_int, 0)])))) {
                    sdl_pc = 79;
                    continue;
                } else {
                    sdl_pc = 81;
                    continue;
                }
            },
            79 => {
                if ((device.*.needs_scaling != 0) or device.*.needs_conversion) {
                    sdl_pc = 82;
                    continue;
                } else {
                    sdl_pc = 83;
                    continue;
                }
            },
            80 => {
                i_7 += 1;
                {
                    sdl_pc = 78;
                    continue;
                }
            },
            81 => {
                return @"true" != 0;
            },
            82 => {
                surf = SDL_CreateSurfaceUninitialized(appspec.*.width, appspec.*.height, appspec.*.format);
                {
                    sdl_pc = 84;
                    continue;
                }
            },
            83 => {
                surf = SDL_CreateSurfaceFrom_REAL(appspec.*.width, appspec.*.height, appspec.*.format, null, 0);
                {
                    sdl_pc = 84;
                    continue;
                }
            },
            84 => {
                if (!(surf != null)) {
                    sdl_pc = 85;
                    continue;
                } else {
                    sdl_pc = 86;
                    continue;
                }
            },
            85 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            86 => {
                {
                    sdl_pc = 87;
                    continue;
                }
            },
            87 => {
                _ = SDL_SetSurfaceColorspace_REAL(surf, devspec.*.colorspace);
                device.*.output_surfaces[@bitCast(@as(isize, @intCast(i_7)))].surface = surf;
                {
                    sdl_pc = 80;
                    continue;
                }
            },
            88 => {
                SDL_DestroySurface_REAL(device.*.acquire_surface);
                device.*.acquire_surface = null;
                {
                    sdl_pc = 90;
                    continue;
                }
            },
            89 => {
                {
                    sdl_pc = 90;
                    continue;
                }
            },
            90 => {
                if (device.*.conversion_surface != null) {
                    sdl_pc = 91;
                    continue;
                } else {
                    sdl_pc = 92;
                    continue;
                }
            },
            91 => {
                SDL_DestroySurface_REAL(device.*.conversion_surface);
                device.*.conversion_surface = null;
                {
                    sdl_pc = 93;
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
                i_8 = 0;
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            94 => {
                if (@as(c_ulong, @bitCast(@as(c_long, i_8))) < (@sizeOf(@TypeOf(device.*.output_surfaces)) / @sizeOf(@TypeOf(device.*.output_surfaces[@as(c_int, 0)])))) {
                    sdl_pc = 95;
                    continue;
                } else {
                    sdl_pc = 97;
                    continue;
                }
            },
            95 => {
                surf_9 = device.*.output_surfaces[@bitCast(@as(isize, @intCast(i_8)))].surface;
                if (surf_9 != null) {
                    sdl_pc = 98;
                    continue;
                } else {
                    sdl_pc = 99;
                    continue;
                }
            },
            96 => {
                i_8 += 1;
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            97 => {
                _ = memset(@ptrCast(@alignCast(@as([*c]SurfaceList, @ptrCast(@alignCast(&device.*.output_surfaces))))), 0, @sizeOf(@TypeOf(device.*.output_surfaces)));
                return @"false" != 0;
            },
            98 => {
                SDL_DestroySurface_REAL(surf_9);
                {
                    sdl_pc = 100;
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
                    sdl_pc = 96;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn ChooseBestCameraSpec(device: [*c]SDL_Camera, spec: [*c]const SDL_CameraSpec, closest: [*c]SDL_CameraSpec) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [20:0]u8 = "ChooseBestCameraSpec".*;
    };
    _ = &static_local___func__;
    _ = memset(@ptrCast(@alignCast(closest)), 0, @sizeOf(@TypeOf(closest.*)));
    if (device.*.num_specs == @as(c_int, 0)) {
        if (spec != null) {
            {
                comptime {
                    if (!(@sizeOf(@TypeOf(closest.*)) == @sizeOf(@TypeOf(spec.*)))) @compileError("static assertion failed \"sizeof (*(closest)) == sizeof (*( spec))\"");
                }
            }
            _ = memcpy(@ptrCast(@alignCast(closest)), @ptrCast(@alignCast(spec)), @sizeOf(@TypeOf(spec.*)));
        }
        return;
    } else if (!(spec != null)) {
        {
            comptime {
                if (!(@sizeOf(@TypeOf(closest.*)) == @sizeOf(@TypeOf((&device.*.all_specs[@as(c_int, 0)]).*)))) @compileError("static assertion failed \"sizeof (*(closest)) == sizeof (*( &device->all_specs[0]))\"");
            }
        }
        _ = memcpy(@ptrCast(@alignCast(closest)), @ptrCast(@alignCast(&device.*.all_specs[@as(c_int, 0)])), @sizeOf(@TypeOf((&device.*.all_specs[@as(c_int, 0)]).*)));
    } else {
        const num_specs: c_int = device.*.num_specs;
        _ = &num_specs;
        var wantw: c_int = spec.*.width;
        _ = &wantw;
        var wanth: c_int = spec.*.height;
        _ = &wanth;
        if ((wantw > @as(c_int, 0)) and (wanth > @as(c_int, 0))) {
            const wantaspect: f32 = @as(f32, @floatFromInt(wantw)) / @as(f32, @floatFromInt(wanth));
            _ = &wantaspect;
            const epsilon: f32 = 0.000001;
            _ = &epsilon;
            var closestaspect: f32 = -@as(f32, 9999999.0);
            _ = &closestaspect;
            var closestdiff: f32 = 999999.0;
            _ = &closestdiff;
            var closestdiffw: c_int = 9999999;
            _ = &closestdiffw;
            {
                var i: c_int = 0;
                _ = &i;
                while (i < num_specs) : (i += 1) {
                    var thisspec: [*c]const SDL_CameraSpec = &device.*.all_specs[@bitCast(@as(isize, @intCast(i)))];
                    _ = &thisspec;
                    const thisw: c_int = thisspec.*.width;
                    _ = &thisw;
                    const thish: c_int = thisspec.*.height;
                    _ = &thish;
                    const thisaspect: f32 = @as(f32, @floatFromInt(thisw)) / @as(f32, @floatFromInt(thish));
                    _ = &thisaspect;
                    const aspectdiff: f32 = SDL_fabsf_REAL(wantaspect - thisaspect);
                    _ = &aspectdiff;
                    const diff: f32 = SDL_fabsf_REAL(closestaspect - thisaspect);
                    _ = &diff;
                    const diffw: c_int = SDL_abs_REAL(thisw - wantw);
                    _ = &diffw;
                    if (diff < epsilon) {
                        if (diffw < closestdiffw) {
                            closestdiffw = diffw;
                            closest.*.width = thisw;
                            closest.*.height = thish;
                        }
                    } else if (aspectdiff < closestdiff) {
                        closestdiff = aspectdiff;
                        closestaspect = thisaspect;
                        closestdiffw = diffw;
                        closest.*.width = thisw;
                        closest.*.height = thish;
                    }
                }
            }
        } else {
            {
                comptime {
                    if (!(@sizeOf(@TypeOf(closest.*)) == @sizeOf(@TypeOf((&device.*.all_specs[@as(c_int, 0)]).*)))) @compileError("static assertion failed \"sizeof (*(closest)) == sizeof (*( &device->all_specs[0]))\"");
                }
            }
            _ = memcpy(@ptrCast(@alignCast(closest)), @ptrCast(@alignCast(&device.*.all_specs[@as(c_int, 0)])), @sizeOf(@TypeOf((&device.*.all_specs[@as(c_int, 0)]).*)));
        }
        while (true) {
            while (!(closest.*.width > @as(c_int, 0))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "closest->width > 0",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_camera.c", 1148);
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
        while (true) {
            while (!(closest.*.height > @as(c_int, 0))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "closest->height > 0",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_camera.c", 1149);
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
        const wantfmt: SDL_PixelFormat = spec.*.format;
        _ = &wantfmt;
        var best_format: SDL_PixelFormat = SDL_PIXELFORMAT_UNKNOWN;
        _ = &best_format;
        var best_colorspace: SDL_Colorspace = SDL_COLORSPACE_UNKNOWN;
        _ = &best_colorspace;
        {
            var i: c_int = 0;
            _ = &i;
            while (i < num_specs) : (i += 1) {
                var thisspec: [*c]const SDL_CameraSpec = &device.*.all_specs[@bitCast(@as(isize, @intCast(i)))];
                _ = &thisspec;
                if ((thisspec.*.width == closest.*.width) and (thisspec.*.height == closest.*.height)) {
                    if (best_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UNKNOWN)) {
                        best_format = thisspec.*.format;
                        best_colorspace = thisspec.*.colorspace;
                    }
                    if (thisspec.*.format == wantfmt) {
                        best_format = thisspec.*.format;
                        best_colorspace = thisspec.*.colorspace;
                        break;
                    }
                }
            }
        }
        while (true) {
            while (!(best_format != @as(SDL_PixelFormat, SDL_PIXELFORMAT_UNKNOWN))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "best_format != SDL_PIXELFORMAT_UNKNOWN",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_camera.c", 1170);
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
        while (true) {
            while (!(best_colorspace != @as(SDL_Colorspace, SDL_COLORSPACE_UNKNOWN))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "best_colorspace != SDL_COLORSPACE_UNKNOWN",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_camera.c", 1171);
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
        closest.*.format = best_format;
        closest.*.colorspace = best_colorspace;
        const wantfps: f32 = if (spec.*.framerate_denominator != 0) @as(f32, @floatFromInt(spec.*.framerate_numerator)) / @as(f32, @floatFromInt(spec.*.framerate_denominator)) else @as(f32, 0.0);
        _ = &wantfps;
        var closestfps: f32 = 9999999.0;
        _ = &closestfps;
        {
            var i: c_int = 0;
            _ = &i;
            while (i < num_specs) : (i += 1) {
                var thisspec: [*c]const SDL_CameraSpec = &device.*.all_specs[@bitCast(@as(isize, @intCast(i)))];
                _ = &thisspec;
                if (((thisspec.*.format == closest.*.format) and (thisspec.*.width == closest.*.width)) and (thisspec.*.height == closest.*.height)) {
                    if ((thisspec.*.framerate_numerator == spec.*.framerate_numerator) and (thisspec.*.framerate_denominator == spec.*.framerate_denominator)) {
                        closest.*.framerate_numerator = thisspec.*.framerate_numerator;
                        closest.*.framerate_denominator = thisspec.*.framerate_denominator;
                        break;
                    }
                    const thisfps: f32 = if (thisspec.*.framerate_denominator != 0) @as(f32, @floatFromInt(thisspec.*.framerate_numerator)) / @as(f32, @floatFromInt(thisspec.*.framerate_denominator)) else @as(f32, 0.0);
                    _ = &thisfps;
                    const fpsdiff: f32 = SDL_fabsf_REAL(wantfps - thisfps);
                    _ = &fpsdiff;
                    if (fpsdiff < closestfps) {
                        closestfps = fpsdiff;
                        closest.*.framerate_numerator = thisspec.*.framerate_numerator;
                        closest.*.framerate_denominator = thisspec.*.framerate_denominator;
                    }
                }
            }
        }
    }
    while (true) {
        while (!(closest.*.width > @as(c_int, 0))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "closest->width > 0",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_camera.c", 1198);
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
    while (true) {
        while (!(closest.*.height > @as(c_int, 0))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "closest->height > 0",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_camera.c", 1199);
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
    while (true) {
        while (!(closest.*.format != @as(SDL_PixelFormat, SDL_PIXELFORMAT_UNKNOWN))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "closest->format != SDL_PIXELFORMAT_UNKNOWN",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_camera.c", 1200);
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
pub export fn SDL_OpenCamera_REAL(instance_id: SDL_CameraID, spec: [*c]const SDL_CameraSpec) [*c]SDL_Camera {
    @setEvalBranchQuota(100000);
    var device: [*c]SDL_Camera = ObtainPhysicalCamera(instance_id);
    _ = &device;
    if (!(device != null)) {
        return null;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(device.*.hidden))) != @as(?*anyopaque, null)) {
        ReleaseCamera(device);
        _ = SDL_SetError_REAL("Camera already opened");
        return null;
    }
    _ = SDL_SetAtomicInt_REAL(&device.*.shutdown, 0);
    device.*.WaitDevice = camera_driver.impl.WaitDevice;
    device.*.AcquireFrame = camera_driver.impl.AcquireFrame;
    device.*.ReleaseFrame = camera_driver.impl.ReleaseFrame;
    var closest: SDL_CameraSpec = undefined;
    _ = &closest;
    ChooseBestCameraSpec(device, spec, &closest);
    if (!camera_driver.impl.OpenDevice.?(device, &closest)) {
        ClosePhysicalCamera(device);
        ReleaseCamera(device);
        return null;
    }
    {
        comptime {
            if (!(@sizeOf(@TypeOf((&device.*.spec).*)) == @sizeOf(@TypeOf((if (spec != null) spec else @as([*c]const SDL_CameraSpec, @ptrCast(@alignCast(&closest)))).*)))) @compileError("static assertion failed \"sizeof (*(&device->spec)) == sizeof (*( spec ? spec : &closest))\"");
        }
    }
    _ = memcpy(@ptrCast(@alignCast(&device.*.spec)), @ptrCast(@alignCast(if (spec != null) spec else @as([*c]const SDL_CameraSpec, @ptrCast(@alignCast(&closest))))), @sizeOf(@TypeOf((if (spec != null) spec else @as([*c]const SDL_CameraSpec, @ptrCast(@alignCast(&closest)))).*)));
    {
        comptime {
            if (!(@sizeOf(@TypeOf((&device.*.actual_spec).*)) == @sizeOf(@TypeOf((&closest).*)))) @compileError("static assertion failed \"sizeof (*(&device->actual_spec)) == sizeof (*( &closest))\"");
        }
    }
    _ = memcpy(@ptrCast(@alignCast(&device.*.actual_spec)), @ptrCast(@alignCast(&closest)), @sizeOf(@TypeOf((&closest).*)));
    if (closest.format != @as(SDL_PixelFormat, SDL_PIXELFORMAT_UNKNOWN)) {
        if (!SDL_PrepareCameraSurfaces(device)) {
            ClosePhysicalCamera(device);
            ReleaseCamera(device);
            return null;
        }
    }
    device.*.drop_frames = 1;
    if (!camera_driver.impl.ProvidesOwnCallbackThread) {
        var threadname: [64]u8 = undefined;
        _ = &threadname;
        _ = SDL_GetCameraThreadName(device, @ptrCast(@alignCast(&threadname)), @sizeOf(@TypeOf(threadname)));
        device.*.thread = SDL_CreateThreadRuntime_REAL(CameraThread, @ptrCast(@alignCast(&threadname)), @ptrCast(@alignCast(device)), null, null);
        if (!(device.*.thread != null)) {
            ClosePhysicalCamera(device);
            ReleaseCamera(device);
            _ = SDL_SetError_REAL("Couldn't create camera thread");
            return null;
        }
    }
    RefPhysicalCamera(device);
    ReleaseCamera(device);
    return device;
}
pub export fn SDL_AcquireCameraFrame_REAL(camera: [*c]SDL_Camera, timestampNS: [*c]Uint64) [*c]SDL_Surface {
    @setEvalBranchQuota(100000);
    if (timestampNS != null) {
        timestampNS.* = 0;
    }
    if (!(camera != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("camera"))));
        return null;
    }
    var device: [*c]SDL_Camera = camera;
    _ = &device;
    ObtainPhysicalCameraObj(device);
    if (device.*.permission <= SDL_CAMERA_PERMISSION_STATE_PENDING) {
        ReleaseCamera(device);
        _ = SDL_SetError_REAL("Camera permission has not been granted");
        return null;
    }
    var result: [*c]SDL_Surface = null;
    _ = &result;
    var slistprev: [*c]SurfaceList = &device.*.filled_output_surfaces;
    _ = &slistprev;
    var slist: [*c]SurfaceList = slistprev;
    _ = &slist;
    while (slist.*.next != null) {
        slistprev = slist;
        slist = slist.*.next;
    }
    const list_is_empty: bool = slist == slistprev;
    _ = &list_is_empty;
    if (!list_is_empty) {
        if (timestampNS != null) {
            timestampNS.* = slist.*.timestampNS;
        }
        result = slist.*.surface;
        slistprev.*.next = slist.*.next;
        slist.*.next = device.*.app_held_output_surfaces.next;
        device.*.app_held_output_surfaces.next = slist;
    }
    ReleaseCamera(device);
    return result;
}
pub export fn SDL_ReleaseCameraFrame_REAL(camera: [*c]SDL_Camera, frame: [*c]SDL_Surface) void {
    @setEvalBranchQuota(100000);
    if (!(camera != null) or !(frame != null)) {
        return;
    }
    var device: [*c]SDL_Camera = camera;
    _ = &device;
    ObtainPhysicalCameraObj(device);
    var slistprev: [*c]SurfaceList = &device.*.app_held_output_surfaces;
    _ = &slistprev;
    var slist: [*c]SurfaceList = undefined;
    _ = &slist;
    {
        slist = slistprev.*.next;
        while (@as(?*anyopaque, @ptrCast(@alignCast(slist))) != @as(?*anyopaque, null)) : (slist = slist.*.next) {
            if (slist.*.surface == frame) {
                break;
            }
            slistprev = slist;
        }
    }
    if (!(slist != null)) {
        ReleaseCamera(device);
        return;
    }
    if (!device.*.needs_conversion and !(device.*.needs_scaling != 0)) {
        device.*.ReleaseFrame.?(device, frame);
        frame.*.pixels = null;
        frame.*.pitch = 0;
    }
    slist.*.timestampNS = 0;
    slistprev.*.next = slist.*.next;
    slist.*.next = device.*.empty_output_surfaces.next;
    device.*.empty_output_surfaces.next = slist;
    ReleaseCamera(device);
}
pub export fn SDL_GetCameraID_REAL(camera: [*c]SDL_Camera) SDL_CameraID {
    @setEvalBranchQuota(100000);
    var result: SDL_CameraID = undefined;
    _ = &result;
    if (!(camera != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("camera"))));
        return 0;
    }
    var device: [*c]SDL_Camera = camera;
    _ = &device;
    ObtainPhysicalCameraObj(device);
    result = device.*.instance_id;
    ReleaseCamera(device);
    return result;
}
pub export fn SDL_GetCameraProperties_REAL(camera: [*c]SDL_Camera) SDL_PropertiesID {
    @setEvalBranchQuota(100000);
    var result: SDL_PropertiesID = undefined;
    _ = &result;
    if (!(camera != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("camera"))));
        return 0;
    }
    var device: [*c]SDL_Camera = camera;
    _ = &device;
    ObtainPhysicalCameraObj(device);
    if (device.*.props == @as(SDL_PropertiesID, 0)) {
        device.*.props = SDL_CreateProperties_REAL();
    }
    result = device.*.props;
    ReleaseCamera(device);
    return result;
}
pub export fn SDL_GetCameraPermissionState_REAL(camera: [*c]SDL_Camera) SDL_CameraPermissionState {
    @setEvalBranchQuota(100000);
    var result: SDL_CameraPermissionState = undefined;
    _ = &result;
    if (!(camera != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("camera"))));
        return SDL_CAMERA_PERMISSION_STATE_DENIED;
    }
    var device: [*c]SDL_Camera = camera;
    _ = &device;
    ObtainPhysicalCameraObj(device);
    result = device.*.permission;
    ReleaseCamera(device);
    return result;
}
pub fn CompleteCameraEntryPoints() callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [25:0]u8 = "CompleteCameraEntryPoints".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(@constCast(camera_driver.impl.DetectDevices)))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "camera_driver.impl.DetectDevices != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_camera.c", 1423);
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
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(@constCast(camera_driver.impl.OpenDevice)))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "camera_driver.impl.OpenDevice != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_camera.c", 1424);
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
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(@constCast(camera_driver.impl.CloseDevice)))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "camera_driver.impl.CloseDevice != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_camera.c", 1425);
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
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(@constCast(camera_driver.impl.AcquireFrame)))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "camera_driver.impl.AcquireFrame != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_camera.c", 1426);
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
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(@constCast(camera_driver.impl.ReleaseFrame)))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "camera_driver.impl.ReleaseFrame != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_camera.c", 1427);
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
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(@constCast(camera_driver.impl.FreeDeviceHandle)))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "camera_driver.impl.FreeDeviceHandle != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_camera.c", 1428);
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
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(@constCast(camera_driver.impl.Deinitialize)))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "camera_driver.impl.Deinitialize != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_camera.c", 1429);
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
pub export fn SDL_QuitCamera() void {
    @setEvalBranchQuota(100000);
    if (!(camera_driver.name != null)) {
        return;
    }
    SDL_LockRWLockForWriting_REAL(camera_driver.device_hash_lock);
    _ = SDL_SetAtomicInt_REAL(&camera_driver.shutting_down, 1);
    var device_hash: ?*SDL_HashTable = camera_driver.device_hash;
    _ = &device_hash;
    camera_driver.device_hash = null;
    var pending_events: [*c]SDL_PendingCameraEvent = camera_driver.pending_events.next;
    _ = &pending_events;
    camera_driver.pending_events.next = null;
    _ = SDL_SetAtomicInt_REAL(&camera_driver.device_count, 0);
    SDL_UnlockRWLock_REAL(camera_driver.device_hash_lock);
    var pending_next: [*c]SDL_PendingCameraEvent = null;
    _ = &pending_next;
    {
        var i: [*c]SDL_PendingCameraEvent = pending_events;
        _ = &i;
        while (i != null) : (i = pending_next) {
            pending_next = i.*.next;
            SDL_free_REAL(@ptrCast(@alignCast(i)));
        }
    }
    SDL_DestroyHashTable(device_hash);
    camera_driver.impl.Deinitialize.?();
    SDL_DestroyRWLock_REAL(camera_driver.device_hash_lock);
    _ = memset(@ptrCast(@alignCast(&camera_driver)), 0, @sizeOf(@TypeOf(camera_driver)));
}
pub fn DestroyCameraHashItem(_: ?*anyopaque, _: ?*const anyopaque, value: ?*const anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var device: [*c]SDL_Camera = @ptrCast(@alignCast(@constCast(value)));
    _ = &device;
    ClosePhysicalCamera(device);
    camera_driver.impl.FreeDeviceHandle.?(device);
    SDL_DestroyMutex_REAL(device.*.lock);
    SDL_free_REAL(@ptrCast(@alignCast(device.*.all_specs)));
    SDL_free_REAL(@ptrCast(@alignCast(device.*.name)));
    SDL_free_REAL(@ptrCast(@alignCast(device)));
}
pub export fn SDL_InitCamera(arg_driver_name: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    var driver_name = arg_driver_name;
    _ = &driver_name;
    if (SDL_GetCurrentCameraDriver_REAL() != null) {
        SDL_QuitCamera();
    }
    var device_hash_lock: ?*SDL_RWLock = SDL_CreateRWLock_REAL();
    _ = &device_hash_lock;
    if (!(device_hash_lock != null)) {
        return @"false" != 0;
    }
    var device_hash: ?*SDL_HashTable = SDL_CreateHashTable(0, @"false" != 0, SDL_HashID, SDL_KeyMatchID, DestroyCameraHashItem, null);
    _ = &device_hash;
    if (!(device_hash != null)) {
        SDL_DestroyRWLock_REAL(device_hash_lock);
        return @"false" != 0;
    }
    if (!(driver_name != null)) {
        driver_name = SDL_GetHint_REAL("SDL_CAMERA_DRIVER");
    }
    var initialized: bool = @"false" != 0;
    _ = &initialized;
    var tried_to_init: bool = @"false" != 0;
    _ = &tried_to_init;
    if ((driver_name != null) and (@as(c_int, driver_name.*) != @as(c_int, 0))) {
        var driver_name_copy: [*c]u8 = SDL_strdup_REAL(driver_name);
        _ = &driver_name_copy;
        var driver_attempt: [*c]const u8 = driver_name_copy;
        _ = &driver_attempt;
        if (!(driver_name_copy != null)) {
            SDL_DestroyRWLock_REAL(device_hash_lock);
            SDL_DestroyHashTable(device_hash);
            return @"false" != 0;
        }
        while (((driver_attempt != null) and (@as(c_int, driver_attempt.*) != @as(c_int, 0))) and !initialized) {
            var driver_attempt_end: [*c]u8 = SDL_strchr_REAL(driver_attempt, ',');
            _ = &driver_attempt_end;
            if (driver_attempt_end != null) {
                driver_attempt_end.* = '\x00';
            }
            {
                var i: c_int = 0;
                _ = &i;
                while (bootstrap[@bitCast(@as(isize, @intCast(i)))] != null) : (i += 1) {
                    if (SDL_strcasecmp_REAL(bootstrap[@bitCast(@as(isize, @intCast(i)))].*.name, driver_attempt) == @as(c_int, 0)) {
                        tried_to_init = @"true" != 0;
                        _ = memset(@ptrCast(@alignCast(&camera_driver)), 0, @sizeOf(@TypeOf(camera_driver)));
                        camera_driver.pending_events_tail = &camera_driver.pending_events;
                        camera_driver.device_hash_lock = device_hash_lock;
                        camera_driver.device_hash = device_hash;
                        if (bootstrap[@bitCast(@as(isize, @intCast(i)))].*.init.?(&camera_driver.impl)) {
                            camera_driver.name = bootstrap[@bitCast(@as(isize, @intCast(i)))].*.name;
                            camera_driver.desc = bootstrap[@bitCast(@as(isize, @intCast(i)))].*.desc;
                            initialized = @"true" != 0;
                        }
                        break;
                    }
                }
            }
            driver_attempt = @ptrCast(@alignCast(if (driver_attempt_end != null) @as(?*anyopaque, @ptrCast(@alignCast(driver_attempt_end + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))))))) else @as(?*anyopaque, null)));
        }
        SDL_free_REAL(@ptrCast(@alignCast(driver_name_copy)));
    } else {
        {
            var i: c_int = 0;
            _ = &i;
            while (!initialized and (bootstrap[@bitCast(@as(isize, @intCast(i)))] != null)) : (i += 1) {
                if (bootstrap[@bitCast(@as(isize, @intCast(i)))].*.demand_only) {
                    continue;
                }
                tried_to_init = @"true" != 0;
                _ = memset(@ptrCast(@alignCast(&camera_driver)), 0, @sizeOf(@TypeOf(camera_driver)));
                camera_driver.pending_events_tail = &camera_driver.pending_events;
                camera_driver.device_hash_lock = device_hash_lock;
                camera_driver.device_hash = device_hash;
                if (bootstrap[@bitCast(@as(isize, @intCast(i)))].*.init.?(&camera_driver.impl)) {
                    camera_driver.name = bootstrap[@bitCast(@as(isize, @intCast(i)))].*.name;
                    camera_driver.desc = bootstrap[@bitCast(@as(isize, @intCast(i)))].*.desc;
                    initialized = @"true" != 0;
                }
            }
        }
    }
    if (initialized) {
        SDL_DebugLogBackend("camera", camera_driver.name);
    } else {
        if (!tried_to_init) {
            if (driver_name != null) {
                _ = SDL_SetError_REAL("Camera driver '%s' not available", driver_name);
            } else {
                _ = SDL_SetError_REAL("No available camera driver");
            }
        }
        _ = memset(@ptrCast(@alignCast(&camera_driver)), 0, @sizeOf(@TypeOf(camera_driver)));
        SDL_DestroyRWLock_REAL(device_hash_lock);
        SDL_DestroyHashTable(device_hash);
        return @"false" != 0;
    }
    CompleteCameraEntryPoints();
    camera_driver.impl.DetectDevices.?();
    return @"true" != 0;
}
pub export fn SDL_UpdateCamera() void {
    @setEvalBranchQuota(100000);
    SDL_LockRWLockForReading_REAL(camera_driver.device_hash_lock);
    var pending_events: [*c]SDL_PendingCameraEvent = camera_driver.pending_events.next;
    _ = &pending_events;
    SDL_UnlockRWLock_REAL(camera_driver.device_hash_lock);
    if (!(pending_events != null)) {
        return;
    }
    SDL_LockRWLockForWriting_REAL(camera_driver.device_hash_lock);
    pending_events = camera_driver.pending_events.next;
    camera_driver.pending_events.next = null;
    camera_driver.pending_events_tail = &camera_driver.pending_events;
    SDL_UnlockRWLock_REAL(camera_driver.device_hash_lock);
    var pending_next: [*c]SDL_PendingCameraEvent = null;
    _ = &pending_next;
    {
        var i: [*c]SDL_PendingCameraEvent = pending_events;
        _ = &i;
        while (i != null) : (i = pending_next) {
            pending_next = i.*.next;
            if (SDL_EventEnabled_REAL(i.*.type)) {
                var event: SDL_Event = undefined;
                _ = &event;
                _ = memset(@ptrCast(@alignCast(&event)), 0, @sizeOf(@TypeOf(event)));
                event.type = i.*.type;
                event.cdevice.which = i.*.devid;
                _ = SDL_PushEvent_REAL(&event);
            }
            SDL_free_REAL(@ptrCast(@alignCast(i)));
        }
    }
}

pub const SDL_AcquireCameraFrame = SDL_AcquireCameraFrame_REAL;
pub const SDL_CloseCamera = SDL_CloseCamera_REAL;
pub const SDL_GetCameraDriver = SDL_GetCameraDriver_REAL;
pub const SDL_GetCameraFormat = SDL_GetCameraFormat_REAL;
pub const SDL_GetCameraID = SDL_GetCameraID_REAL;
pub const SDL_GetCameraName = SDL_GetCameraName_REAL;
pub const SDL_GetCameraPermissionState = SDL_GetCameraPermissionState_REAL;
pub const SDL_GetCameraPosition = SDL_GetCameraPosition_REAL;
pub const SDL_GetCameraProperties = SDL_GetCameraProperties_REAL;
pub const SDL_GetCameraSupportedFormats = SDL_GetCameraSupportedFormats_REAL;
pub const SDL_GetCameras = SDL_GetCameras_REAL;
pub const SDL_GetCurrentCameraDriver = SDL_GetCurrentCameraDriver_REAL;
pub const SDL_GetNumCameraDrivers = SDL_GetNumCameraDrivers_REAL;
pub const SDL_OpenCamera = SDL_OpenCamera_REAL;
pub const SDL_PumpEvents = SDL_PumpEvents_REAL;
pub const SDL_ReleaseCameraFrame = SDL_ReleaseCameraFrame_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
