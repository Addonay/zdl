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
pub const Uint64 = u64;
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
pub const enum_SDL_PixelFormat = c_uint;
pub const SDL_PixelFormat = enum_SDL_PixelFormat;
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
pub const enum_SDL_CameraPosition = c_uint;
pub const SDL_CameraPosition = enum_SDL_CameraPosition;
pub const SDL_Camera = struct_SDL_Camera;
pub const SDL_CAMERA_FRAME_ERROR: c_int = 0;
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
    thread: ?*SDL_Thread = null,
    props: SDL_PropertiesID = 0,
    permission: SDL_CameraPermissionState = @import("std").mem.zeroes(SDL_CameraPermissionState),
    hidden: ?*struct_SDL_PrivateCameraData_8 = null,
};
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
pub fn DUMMYCAMERA_OpenDevice(_: [*c]SDL_Camera, _: [*c]const SDL_CameraSpec) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn DUMMYCAMERA_CloseDevice(_: [*c]SDL_Camera) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn DUMMYCAMERA_WaitDevice(_: [*c]SDL_Camera) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn DUMMYCAMERA_AcquireFrame(_: [*c]SDL_Camera, _: [*c]SDL_Surface, _: [*c]Uint64, _: [*c]f32) callconv(.c) SDL_CameraFrameResult {
    @setEvalBranchQuota(100000);
    _ = SDL_SetError_REAL("That operation is not supported");
    return SDL_CAMERA_FRAME_ERROR;
}
pub fn DUMMYCAMERA_ReleaseFrame(_: [*c]SDL_Camera, _: [*c]SDL_Surface) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn DUMMYCAMERA_DetectDevices() callconv(.c) void {}
pub fn DUMMYCAMERA_FreeDeviceHandle(_: [*c]SDL_Camera) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn DUMMYCAMERA_Deinitialize() callconv(.c) void {}
pub fn DUMMYCAMERA_Init(impl: [*c]SDL_CameraDriverImpl) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    impl.*.DetectDevices = DUMMYCAMERA_DetectDevices;
    impl.*.OpenDevice = DUMMYCAMERA_OpenDevice;
    impl.*.CloseDevice = DUMMYCAMERA_CloseDevice;
    impl.*.WaitDevice = DUMMYCAMERA_WaitDevice;
    impl.*.AcquireFrame = DUMMYCAMERA_AcquireFrame;
    impl.*.ReleaseFrame = DUMMYCAMERA_ReleaseFrame;
    impl.*.FreeDeviceHandle = DUMMYCAMERA_FreeDeviceHandle;
    impl.*.Deinitialize = DUMMYCAMERA_Deinitialize;
    return @"true" != 0;
}
pub export var DUMMYCAMERA_bootstrap: CameraBootStrap = CameraBootStrap{
    .name = "dummy",
    .desc = "SDL dummy camera driver",
    .init = DUMMYCAMERA_Init,
    .demand_only = @"true" != 0,
};

pub const @"true" = @as(c_int, 1);
