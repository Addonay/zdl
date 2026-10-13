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
pub const SDL_FunctionPointer = ?*const fn () callconv(.c) void;
pub extern fn SDL_ClearError_REAL() bool;
pub const struct_SDL_SharedObject = opaque {
};
pub const SDL_SharedObject = struct_SDL_SharedObject;
pub extern fn SDL_LoadObject_REAL(sofile: [*c]const u8) ?*SDL_SharedObject;
pub extern fn SDL_LoadFunction_REAL(handle: ?*SDL_SharedObject, name: [*c]const u8) SDL_FunctionPointer;
pub extern fn SDL_UnloadObject_REAL(handle: ?*SDL_SharedObject) void;
pub const __u64 = c_ulonglong;
pub const drm_magic_t = c_uint;
pub const struct_drm_mode_property_enum = extern struct {
    value: __u64 = 0,
    name: [32]u8 = @import("std").mem.zeroes([32]u8),
};
pub const struct__drmEventContext = extern struct {
    version: c_int = 0,
    vblank_handler: ?*const fn (fd: c_int, sequence: c_uint, tv_sec: c_uint, tv_usec: c_uint, user_data: ?*anyopaque) callconv(.c) void = null,
    page_flip_handler: ?*const fn (fd: c_int, sequence: c_uint, tv_sec: c_uint, tv_usec: c_uint, user_data: ?*anyopaque) callconv(.c) void = null,
    page_flip_handler2: ?*const fn (fd: c_int, sequence: c_uint, tv_sec: c_uint, tv_usec: c_uint, crtc_id: c_uint, user_data: ?*anyopaque) callconv(.c) void = null,
    sequence_handler: ?*const fn (fd: c_int, sequence: u64, ns: u64, user_data: u64) callconv(.c) void = null,
};
pub const drmEventContextPtr = [*c]struct__drmEventContext;
pub const struct__drmModeRes = extern struct {
    count_fbs: c_int = 0,
    fbs: [*c]u32 = null,
    count_crtcs: c_int = 0,
    crtcs: [*c]u32 = null,
    count_connectors: c_int = 0,
    connectors: [*c]u32 = null,
    count_encoders: c_int = 0,
    encoders: [*c]u32 = null,
    min_width: u32 = 0,
    max_width: u32 = 0,
    min_height: u32 = 0,
    max_height: u32 = 0,
};
pub const drmModeResPtr = [*c]struct__drmModeRes;
pub const struct__drmModeModeInfo = extern struct {
    clock: u32 = 0,
    hdisplay: u16 = 0,
    hsync_start: u16 = 0,
    hsync_end: u16 = 0,
    htotal: u16 = 0,
    hskew: u16 = 0,
    vdisplay: u16 = 0,
    vsync_start: u16 = 0,
    vsync_end: u16 = 0,
    vtotal: u16 = 0,
    vscan: u16 = 0,
    vrefresh: u32 = 0,
    flags: u32 = 0,
    type: u32 = 0,
    name: [32]u8 = @import("std").mem.zeroes([32]u8),
};
pub const drmModeModeInfo = struct__drmModeModeInfo;
pub const drmModeModeInfoPtr = [*c]struct__drmModeModeInfo;
pub const struct__drmModeFB = extern struct {
    fb_id: u32 = 0,
    width: u32 = 0,
    height: u32 = 0,
    pitch: u32 = 0,
    bpp: u32 = 0,
    depth: u32 = 0,
    handle: u32 = 0,
};
pub const drmModeFBPtr = [*c]struct__drmModeFB;
pub const struct__drmModeProperty = extern struct {
    prop_id: u32 = 0,
    flags: u32 = 0,
    name: [32]u8 = @import("std").mem.zeroes([32]u8),
    count_values: c_int = 0,
    values: [*c]u64 = null,
    count_enums: c_int = 0,
    enums: [*c]struct_drm_mode_property_enum = null,
    count_blobs: c_int = 0,
    blob_ids: [*c]u32 = null,
};
pub const drmModePropertyPtr = [*c]struct__drmModeProperty;
pub const struct__drmModeCrtc = extern struct {
    crtc_id: u32 = 0,
    buffer_id: u32 = 0,
    x: u32 = 0,
    y: u32 = 0,
    width: u32 = 0,
    height: u32 = 0,
    mode_valid: c_int = 0,
    mode: drmModeModeInfo = @import("std").mem.zeroes(drmModeModeInfo),
    gamma_size: c_int = 0,
};
pub const drmModeCrtcPtr = [*c]struct__drmModeCrtc;
pub const struct__drmModeEncoder = extern struct {
    encoder_id: u32 = 0,
    encoder_type: u32 = 0,
    crtc_id: u32 = 0,
    possible_crtcs: u32 = 0,
    possible_clones: u32 = 0,
};
pub const drmModeEncoderPtr = [*c]struct__drmModeEncoder;
pub const drmModeConnection = c_uint;
pub const drmModeSubPixel = c_uint;
pub const struct__drmModeConnector = extern struct {
    connector_id: u32 = 0,
    encoder_id: u32 = 0,
    connector_type: u32 = 0,
    connector_type_id: u32 = 0,
    connection: drmModeConnection = @import("std").mem.zeroes(drmModeConnection),
    mmWidth: u32 = 0,
    mmHeight: u32 = 0,
    subpixel: drmModeSubPixel = @import("std").mem.zeroes(drmModeSubPixel),
    count_modes: c_int = 0,
    modes: drmModeModeInfoPtr = null,
    count_props: c_int = 0,
    props: [*c]u32 = null,
    prop_values: [*c]u64 = null,
    count_encoders: c_int = 0,
    encoders: [*c]u32 = null,
};
pub const drmModeConnectorPtr = [*c]struct__drmModeConnector;
pub const struct__drmModeObjectProperties = extern struct {
    count_props: u32 = 0,
    props: [*c]u32 = null,
    prop_values: [*c]u64 = null,
};
pub const drmModeObjectPropertiesPtr = [*c]struct__drmModeObjectProperties;
pub const struct__drmModePlane = extern struct {
    count_formats: u32 = 0,
    formats: [*c]u32 = null,
    plane_id: u32 = 0,
    crtc_id: u32 = 0,
    fb_id: u32 = 0,
    crtc_x: u32 = 0,
    crtc_y: u32 = 0,
    x: u32 = 0,
    y: u32 = 0,
    possible_crtcs: u32 = 0,
    gamma_size: u32 = 0,
};
pub const drmModePlanePtr = [*c]struct__drmModePlane;
pub const struct__drmModePlaneRes = extern struct {
    count_planes: u32 = 0,
    planes: [*c]u32 = null,
};
pub const drmModePlaneResPtr = [*c]struct__drmModePlaneRes;
pub const struct__drmModeAtomicReq = opaque {
};
pub const drmModeAtomicReqPtr = ?*struct__drmModeAtomicReq;
pub const struct_gbm_device = opaque {
};
pub const struct_gbm_bo = opaque {
};
pub const struct_gbm_surface = opaque {
};
pub const union_gbm_bo_handle = extern union {
    ptr: ?*anyopaque,
    s32: i32,
    u32: u32,
    s64: i64,
    u64: u64,
};
pub const SDL_DYNKMSDRMFN_drmModeFreeResources = ?*const fn (ptr: drmModeResPtr) callconv(.c) void;
pub const SDL_DYNKMSDRMFN_drmModeFreeFB = ?*const fn (ptr: drmModeFBPtr) callconv(.c) void;
pub const SDL_DYNKMSDRMFN_drmModeFreeCrtc = ?*const fn (ptr: drmModeCrtcPtr) callconv(.c) void;
pub const SDL_DYNKMSDRMFN_drmModeFreeConnector = ?*const fn (ptr: drmModeConnectorPtr) callconv(.c) void;
pub const SDL_DYNKMSDRMFN_drmModeFreeEncoder = ?*const fn (ptr: drmModeEncoderPtr) callconv(.c) void;
pub const SDL_DYNKMSDRMFN_drmGetCap = ?*const fn (fd: c_int, capability: u64, value: [*c]u64) callconv(.c) c_int;
pub const SDL_DYNKMSDRMFN_drmSetMaster = ?*const fn (fd: c_int) callconv(.c) c_int;
pub const SDL_DYNKMSDRMFN_drmDropMaster = ?*const fn (fd: c_int) callconv(.c) c_int;
pub const SDL_DYNKMSDRMFN_drmAuthMagic = ?*const fn (fd: c_int, magic: drm_magic_t) callconv(.c) c_int;
pub const SDL_DYNKMSDRMFN_drmModeGetResources = ?*const fn (fd: c_int) callconv(.c) drmModeResPtr;
pub const SDL_DYNKMSDRMFN_drmModeAddFB = ?*const fn (fd: c_int, width: u32, height: u32, depth: u8, bpp: u8, pitch: u32, bo_handle: u32, buf_id: [*c]u32) callconv(.c) c_int;
pub const SDL_DYNKMSDRMFN_drmModeAddFB2 = ?*const fn (fd: c_int, width: u32, height: u32, pixel_format: u32, bo_handles: [*c]const u32, pitches: [*c]const u32, offsets: [*c]const u32, buf_id: [*c]u32, flags: u32) callconv(.c) c_int;
pub const SDL_DYNKMSDRMFN_drmModeAddFB2WithModifiers = ?*const fn (fd: c_int, width: u32, height: u32, pixel_format: u32, bo_handles: [*c]const u32, pitches: [*c]const u32, offsets: [*c]const u32, modifier: [*c]const u64, buf_id: [*c]u32, flags: u32) callconv(.c) c_int;
pub const SDL_DYNKMSDRMFN_drmModeGetConnectorTypeName = ?*const fn (connector_type: u32) callconv(.c) [*c]const u8;
pub const SDL_DYNKMSDRMFN_drmModeRmFB = ?*const fn (fd: c_int, bufferId: u32) callconv(.c) c_int;
pub const SDL_DYNKMSDRMFN_drmModeGetFB = ?*const fn (fd: c_int, buf: u32) callconv(.c) drmModeFBPtr;
pub const SDL_DYNKMSDRMFN_drmModeGetCrtc = ?*const fn (fd: c_int, crtcId: u32) callconv(.c) drmModeCrtcPtr;
pub const SDL_DYNKMSDRMFN_drmModeSetCrtc = ?*const fn (fd: c_int, crtcId: u32, bufferId: u32, x: u32, y: u32, connectors: [*c]u32, count: c_int, mode: drmModeModeInfoPtr) callconv(.c) c_int;
pub const SDL_DYNKMSDRMFN_drmModeSetCursor = ?*const fn (fd: c_int, crtcId: u32, bo_handle: u32, width: u32, height: u32) callconv(.c) c_int;
pub const SDL_DYNKMSDRMFN_drmModeSetCursor2 = ?*const fn (fd: c_int, crtcId: u32, bo_handle: u32, width: u32, height: u32, hot_x: i32, hot_y: i32) callconv(.c) c_int;
pub const SDL_DYNKMSDRMFN_drmModeMoveCursor = ?*const fn (fd: c_int, crtcId: u32, x: c_int, y: c_int) callconv(.c) c_int;
pub const SDL_DYNKMSDRMFN_drmModeGetEncoder = ?*const fn (fd: c_int, encoder_id: u32) callconv(.c) drmModeEncoderPtr;
pub const SDL_DYNKMSDRMFN_drmModeGetConnector = ?*const fn (fd: c_int, connector_id: u32) callconv(.c) drmModeConnectorPtr;
pub const SDL_DYNKMSDRMFN_drmHandleEvent = ?*const fn (fd: c_int, evctx: drmEventContextPtr) callconv(.c) c_int;
pub const SDL_DYNKMSDRMFN_drmModePageFlip = ?*const fn (fd: c_int, crtc_id: u32, fb_id: u32, flags: u32, user_data: ?*anyopaque) callconv(.c) c_int;
pub const SDL_DYNKMSDRMFN_drmSetClientCap = ?*const fn (fd: c_int, capability: u64, value: u64) callconv(.c) c_int;
pub const SDL_DYNKMSDRMFN_drmModeGetPlaneResources = ?*const fn (fd: c_int) callconv(.c) drmModePlaneResPtr;
pub const SDL_DYNKMSDRMFN_drmModeGetPlane = ?*const fn (fd: c_int, plane_id: u32) callconv(.c) drmModePlanePtr;
pub const SDL_DYNKMSDRMFN_drmModeObjectGetProperties = ?*const fn (fd: c_int, object_id: u32, object_type: u32) callconv(.c) drmModeObjectPropertiesPtr;
pub const SDL_DYNKMSDRMFN_drmModeObjectSetProperty = ?*const fn (fd: c_int, object_id: u32, object_type: u32, property_id: u32, value: u64) callconv(.c) c_int;
pub const SDL_DYNKMSDRMFN_drmModeGetProperty = ?*const fn (fd: c_int, propertyId: u32) callconv(.c) drmModePropertyPtr;
pub const SDL_DYNKMSDRMFN_drmModeFreeProperty = ?*const fn (ptr: drmModePropertyPtr) callconv(.c) void;
pub const SDL_DYNKMSDRMFN_drmModeFreeObjectProperties = ?*const fn (ptr: drmModeObjectPropertiesPtr) callconv(.c) void;
pub const SDL_DYNKMSDRMFN_drmModeFreePlane = ?*const fn (ptr: drmModePlanePtr) callconv(.c) void;
pub const SDL_DYNKMSDRMFN_drmModeFreePlaneResources = ?*const fn (ptr: drmModePlaneResPtr) callconv(.c) void;
pub const SDL_DYNKMSDRMFN_drmModeSetPlane = ?*const fn (fd: c_int, plane_id: u32, crtc_id: u32, fb_id: u32, flags: u32, crtc_x: i32, crtc_y: i32, crtc_w: u32, crtc_h: u32, src_x: u32, src_y: u32, src_w: u32, src_h: u32) callconv(.c) c_int;
pub const SDL_DYNKMSDRMFN_gbm_device_is_format_supported = ?*const fn (gbm: ?*struct_gbm_device, format: u32, usage: u32) callconv(.c) c_int;
pub const SDL_DYNKMSDRMFN_gbm_device_destroy = ?*const fn (gbm: ?*struct_gbm_device) callconv(.c) void;
pub const SDL_DYNKMSDRMFN_gbm_create_device = ?*const fn (fd: c_int) callconv(.c) ?*struct_gbm_device;
pub const SDL_DYNKMSDRMFN_gbm_bo_get_width = ?*const fn (bo: ?*struct_gbm_bo) callconv(.c) c_uint;
pub const SDL_DYNKMSDRMFN_gbm_bo_get_height = ?*const fn (bo: ?*struct_gbm_bo) callconv(.c) c_uint;
pub const SDL_DYNKMSDRMFN_gbm_bo_get_stride = ?*const fn (bo: ?*struct_gbm_bo) callconv(.c) u32;
pub const SDL_DYNKMSDRMFN_gbm_bo_get_format = ?*const fn (bo: ?*struct_gbm_bo) callconv(.c) u32;
pub const SDL_DYNKMSDRMFN_gbm_bo_get_handle = ?*const fn (bo: ?*struct_gbm_bo) callconv(.c) union_gbm_bo_handle;
pub const SDL_DYNKMSDRMFN_gbm_bo_write = ?*const fn (bo: ?*struct_gbm_bo, buf: ?*const anyopaque, count: usize) callconv(.c) c_int;
pub const SDL_DYNKMSDRMFN_gbm_bo_get_device = ?*const fn (bo: ?*struct_gbm_bo) callconv(.c) ?*struct_gbm_device;
pub const SDL_DYNKMSDRMFN_gbm_bo_set_user_data = ?*const fn (bo: ?*struct_gbm_bo, data: ?*anyopaque, destroy_user_data: ?*const fn (?*struct_gbm_bo, ?*anyopaque) callconv(.c) void) callconv(.c) void;
pub const SDL_DYNKMSDRMFN_gbm_bo_get_user_data = ?*const fn (bo: ?*struct_gbm_bo) callconv(.c) ?*anyopaque;
pub const SDL_DYNKMSDRMFN_gbm_bo_destroy = ?*const fn (bo: ?*struct_gbm_bo) callconv(.c) void;
pub const SDL_DYNKMSDRMFN_gbm_bo_create = ?*const fn (gbm: ?*struct_gbm_device, width: u32, height: u32, format: u32, usage: u32) callconv(.c) ?*struct_gbm_bo;
pub const SDL_DYNKMSDRMFN_gbm_surface_create = ?*const fn (gbm: ?*struct_gbm_device, width: u32, height: u32, format: u32, flags: u32) callconv(.c) ?*struct_gbm_surface;
pub const SDL_DYNKMSDRMFN_gbm_surface_destroy = ?*const fn (surf: ?*struct_gbm_surface) callconv(.c) void;
pub const SDL_DYNKMSDRMFN_gbm_surface_lock_front_buffer = ?*const fn (surf: ?*struct_gbm_surface) callconv(.c) ?*struct_gbm_bo;
pub const SDL_DYNKMSDRMFN_gbm_surface_release_buffer = ?*const fn (surf: ?*struct_gbm_surface, bo: ?*struct_gbm_bo) callconv(.c) void;
pub const SDL_DYNKMSDRMFN_gbm_bo_get_modifier = ?*const fn (bo: ?*struct_gbm_bo) callconv(.c) u64;
pub const SDL_DYNKMSDRMFN_gbm_bo_get_plane_count = ?*const fn (bo: ?*struct_gbm_bo) callconv(.c) c_int;
pub const SDL_DYNKMSDRMFN_gbm_bo_get_offset = ?*const fn (bo: ?*struct_gbm_bo, plane: c_int) callconv(.c) u32;
pub const SDL_DYNKMSDRMFN_gbm_bo_get_stride_for_plane = ?*const fn (bo: ?*struct_gbm_bo, plane: c_int) callconv(.c) u32;
pub const SDL_DYNKMSDRMFN_gbm_bo_get_handle_for_plane = ?*const fn (bo: ?*struct_gbm_bo, plane: c_int) callconv(.c) union_gbm_bo_handle;
pub const SDL_DYNKMSDRMFN_drmIoctl = ?*const fn (fd: c_int, request: c_ulong, arg: ?*anyopaque) callconv(.c) c_int;
pub const SDL_DYNKMSDRMFN_drmModeAtomicAlloc = ?*const fn () callconv(.c) drmModeAtomicReqPtr;
pub const SDL_DYNKMSDRMFN_drmModeAtomicFree = ?*const fn (req: drmModeAtomicReqPtr) callconv(.c) void;
pub const SDL_DYNKMSDRMFN_drmModeAtomicCommit = ?*const fn (fd: c_int, req: drmModeAtomicReqPtr, flags: u32, user_data: ?*anyopaque) callconv(.c) c_int;
pub const SDL_DYNKMSDRMFN_drmModeAtomicAddProperty = ?*const fn (req: drmModeAtomicReqPtr, object_id: u32, property_id: u32, value: u64) callconv(.c) c_int;
pub const SDL_DYNKMSDRMFN_drmModeCreatePropertyBlob = ?*const fn (fd: c_int, data: ?*const anyopaque, size: usize, id: [*c]u32) callconv(.c) c_int;
pub const kmsdrmdynlib = extern struct {
    lib: ?*anyopaque = null,
    libname: [*c]const u8 = null,
};
pub var kmsdrmlibs: [2]kmsdrmdynlib = [2]kmsdrmdynlib{
    kmsdrmdynlib{
        .lib = null,
        .libname = "libgbm.so.1",
    },
    kmsdrmdynlib{
        .lib = null,
        .libname = "libdrm.so.2",
    },
};
pub fn KMSDRM_GetSym(fnname: [*c]const u8, pHasModule: [*c]c_int, required: bool) callconv(.c) ?*anyopaque {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var @"fn": ?*anyopaque = null;
    _ = &@"fn";
    {
        i = 0;
        while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(kmsdrmlibs)) / @sizeOf(@TypeOf(kmsdrmlibs[@as(c_int, 0)])))) : (i += 1) {
            if (kmsdrmlibs[@bitCast(@as(isize, @intCast(i)))].lib != null) {
                @"fn" = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(@ptrCast(@alignCast(kmsdrmlibs[@bitCast(@as(isize, @intCast(i)))].lib)), fnname))));
                if (@"fn" != null) {
                    break;
                }
            }
        }
    }
    if (!(@"fn" != null) and required) {
        pHasModule.* = 0;
    }
    return @"fn";
}
pub export var SDL_KMSDRM_HAVE_LIBDRM: c_int = 0;
pub export var KMSDRM_drmModeFreeResources: SDL_DYNKMSDRMFN_drmModeFreeResources = null;
pub export var KMSDRM_drmModeFreeFB: SDL_DYNKMSDRMFN_drmModeFreeFB = null;
pub export var KMSDRM_drmModeFreeCrtc: SDL_DYNKMSDRMFN_drmModeFreeCrtc = null;
pub export var KMSDRM_drmModeFreeConnector: SDL_DYNKMSDRMFN_drmModeFreeConnector = null;
pub export var KMSDRM_drmModeFreeEncoder: SDL_DYNKMSDRMFN_drmModeFreeEncoder = null;
pub export var KMSDRM_drmGetCap: SDL_DYNKMSDRMFN_drmGetCap = null;
pub export var KMSDRM_drmSetMaster: SDL_DYNKMSDRMFN_drmSetMaster = null;
pub export var KMSDRM_drmDropMaster: SDL_DYNKMSDRMFN_drmDropMaster = null;
pub export var KMSDRM_drmAuthMagic: SDL_DYNKMSDRMFN_drmAuthMagic = null;
pub export var KMSDRM_drmModeGetResources: SDL_DYNKMSDRMFN_drmModeGetResources = null;
pub export var KMSDRM_drmModeAddFB: SDL_DYNKMSDRMFN_drmModeAddFB = null;
pub export var KMSDRM_drmModeAddFB2: SDL_DYNKMSDRMFN_drmModeAddFB2 = null;
pub export var KMSDRM_drmModeAddFB2WithModifiers: SDL_DYNKMSDRMFN_drmModeAddFB2WithModifiers = null;
pub export var KMSDRM_drmModeGetConnectorTypeName: SDL_DYNKMSDRMFN_drmModeGetConnectorTypeName = null;
pub export var KMSDRM_drmModeRmFB: SDL_DYNKMSDRMFN_drmModeRmFB = null;
pub export var KMSDRM_drmModeGetFB: SDL_DYNKMSDRMFN_drmModeGetFB = null;
pub export var KMSDRM_drmModeGetCrtc: SDL_DYNKMSDRMFN_drmModeGetCrtc = null;
pub export var KMSDRM_drmModeSetCrtc: SDL_DYNKMSDRMFN_drmModeSetCrtc = null;
pub export var KMSDRM_drmModeSetCursor: SDL_DYNKMSDRMFN_drmModeSetCursor = null;
pub export var KMSDRM_drmModeSetCursor2: SDL_DYNKMSDRMFN_drmModeSetCursor2 = null;
pub export var KMSDRM_drmModeMoveCursor: SDL_DYNKMSDRMFN_drmModeMoveCursor = null;
pub export var KMSDRM_drmModeGetEncoder: SDL_DYNKMSDRMFN_drmModeGetEncoder = null;
pub export var KMSDRM_drmModeGetConnector: SDL_DYNKMSDRMFN_drmModeGetConnector = null;
pub export var KMSDRM_drmHandleEvent: SDL_DYNKMSDRMFN_drmHandleEvent = null;
pub export var KMSDRM_drmModePageFlip: SDL_DYNKMSDRMFN_drmModePageFlip = null;
pub export var KMSDRM_drmSetClientCap: SDL_DYNKMSDRMFN_drmSetClientCap = null;
pub export var KMSDRM_drmModeGetPlaneResources: SDL_DYNKMSDRMFN_drmModeGetPlaneResources = null;
pub export var KMSDRM_drmModeGetPlane: SDL_DYNKMSDRMFN_drmModeGetPlane = null;
pub export var KMSDRM_drmModeObjectGetProperties: SDL_DYNKMSDRMFN_drmModeObjectGetProperties = null;
pub export var KMSDRM_drmModeObjectSetProperty: SDL_DYNKMSDRMFN_drmModeObjectSetProperty = null;
pub export var KMSDRM_drmModeGetProperty: SDL_DYNKMSDRMFN_drmModeGetProperty = null;
pub export var KMSDRM_drmModeFreeProperty: SDL_DYNKMSDRMFN_drmModeFreeProperty = null;
pub export var KMSDRM_drmModeFreeObjectProperties: SDL_DYNKMSDRMFN_drmModeFreeObjectProperties = null;
pub export var KMSDRM_drmModeFreePlane: SDL_DYNKMSDRMFN_drmModeFreePlane = null;
pub export var KMSDRM_drmModeFreePlaneResources: SDL_DYNKMSDRMFN_drmModeFreePlaneResources = null;
pub export var KMSDRM_drmModeSetPlane: SDL_DYNKMSDRMFN_drmModeSetPlane = null;
pub export var SDL_KMSDRM_HAVE_GBM: c_int = 0;
pub export var KMSDRM_gbm_device_is_format_supported: SDL_DYNKMSDRMFN_gbm_device_is_format_supported = null;
pub export var KMSDRM_gbm_device_destroy: SDL_DYNKMSDRMFN_gbm_device_destroy = null;
pub export var KMSDRM_gbm_create_device: SDL_DYNKMSDRMFN_gbm_create_device = null;
pub export var KMSDRM_gbm_bo_get_width: SDL_DYNKMSDRMFN_gbm_bo_get_width = null;
pub export var KMSDRM_gbm_bo_get_height: SDL_DYNKMSDRMFN_gbm_bo_get_height = null;
pub export var KMSDRM_gbm_bo_get_stride: SDL_DYNKMSDRMFN_gbm_bo_get_stride = null;
pub export var KMSDRM_gbm_bo_get_format: SDL_DYNKMSDRMFN_gbm_bo_get_format = null;
pub export var KMSDRM_gbm_bo_get_handle: SDL_DYNKMSDRMFN_gbm_bo_get_handle = null;
pub export var KMSDRM_gbm_bo_write: SDL_DYNKMSDRMFN_gbm_bo_write = null;
pub export var KMSDRM_gbm_bo_get_device: SDL_DYNKMSDRMFN_gbm_bo_get_device = null;
pub export var KMSDRM_gbm_bo_set_user_data: SDL_DYNKMSDRMFN_gbm_bo_set_user_data = null;
pub export var KMSDRM_gbm_bo_get_user_data: SDL_DYNKMSDRMFN_gbm_bo_get_user_data = null;
pub export var KMSDRM_gbm_bo_destroy: SDL_DYNKMSDRMFN_gbm_bo_destroy = null;
pub export var KMSDRM_gbm_bo_create: SDL_DYNKMSDRMFN_gbm_bo_create = null;
pub export var KMSDRM_gbm_surface_create: SDL_DYNKMSDRMFN_gbm_surface_create = null;
pub export var KMSDRM_gbm_surface_destroy: SDL_DYNKMSDRMFN_gbm_surface_destroy = null;
pub export var KMSDRM_gbm_surface_lock_front_buffer: SDL_DYNKMSDRMFN_gbm_surface_lock_front_buffer = null;
pub export var KMSDRM_gbm_surface_release_buffer: SDL_DYNKMSDRMFN_gbm_surface_release_buffer = null;
pub export var KMSDRM_gbm_bo_get_modifier: SDL_DYNKMSDRMFN_gbm_bo_get_modifier = null;
pub export var KMSDRM_gbm_bo_get_plane_count: SDL_DYNKMSDRMFN_gbm_bo_get_plane_count = null;
pub export var KMSDRM_gbm_bo_get_offset: SDL_DYNKMSDRMFN_gbm_bo_get_offset = null;
pub export var KMSDRM_gbm_bo_get_stride_for_plane: SDL_DYNKMSDRMFN_gbm_bo_get_stride_for_plane = null;
pub export var KMSDRM_gbm_bo_get_handle_for_plane: SDL_DYNKMSDRMFN_gbm_bo_get_handle_for_plane = null;
pub export var SDL_KMSDRM_HAVE_ATOMIC: c_int = 0;
pub export var KMSDRM_drmIoctl: SDL_DYNKMSDRMFN_drmIoctl = null;
pub export var KMSDRM_drmModeAtomicAlloc: SDL_DYNKMSDRMFN_drmModeAtomicAlloc = null;
pub export var KMSDRM_drmModeAtomicFree: SDL_DYNKMSDRMFN_drmModeAtomicFree = null;
pub export var KMSDRM_drmModeAtomicCommit: SDL_DYNKMSDRMFN_drmModeAtomicCommit = null;
pub export var KMSDRM_drmModeAtomicAddProperty: SDL_DYNKMSDRMFN_drmModeAtomicAddProperty = null;
pub export var KMSDRM_drmModeCreatePropertyBlob: SDL_DYNKMSDRMFN_drmModeCreatePropertyBlob = null;
pub var kmsdrm_load_refcount: c_int = 0;
pub export fn SDL_KMSDRM_UnloadSymbols() void {
    @setEvalBranchQuota(100000);
    if (kmsdrm_load_refcount > @as(c_int, 0)) {
        if ((blk: {
            const ref = &kmsdrm_load_refcount;
            ref.* -= 1;
            break :blk ref.*;
        }) == @as(c_int, 0)) {
            var i: c_int = undefined;
            _ = &i;
            SDL_KMSDRM_HAVE_LIBDRM = 0;
            KMSDRM_drmModeFreeResources = null;
            KMSDRM_drmModeFreeFB = null;
            KMSDRM_drmModeFreeCrtc = null;
            KMSDRM_drmModeFreeConnector = null;
            KMSDRM_drmModeFreeEncoder = null;
            KMSDRM_drmGetCap = null;
            KMSDRM_drmSetMaster = null;
            KMSDRM_drmDropMaster = null;
            KMSDRM_drmAuthMagic = null;
            KMSDRM_drmModeGetResources = null;
            KMSDRM_drmModeAddFB = null;
            KMSDRM_drmModeAddFB2 = null;
            KMSDRM_drmModeAddFB2WithModifiers = null;
            KMSDRM_drmModeGetConnectorTypeName = null;
            KMSDRM_drmModeRmFB = null;
            KMSDRM_drmModeGetFB = null;
            KMSDRM_drmModeGetCrtc = null;
            KMSDRM_drmModeSetCrtc = null;
            KMSDRM_drmModeSetCursor = null;
            KMSDRM_drmModeSetCursor2 = null;
            KMSDRM_drmModeMoveCursor = null;
            KMSDRM_drmModeGetEncoder = null;
            KMSDRM_drmModeGetConnector = null;
            KMSDRM_drmHandleEvent = null;
            KMSDRM_drmModePageFlip = null;
            KMSDRM_drmSetClientCap = null;
            KMSDRM_drmModeGetPlaneResources = null;
            KMSDRM_drmModeGetPlane = null;
            KMSDRM_drmModeObjectGetProperties = null;
            KMSDRM_drmModeObjectSetProperty = null;
            KMSDRM_drmModeGetProperty = null;
            KMSDRM_drmModeFreeProperty = null;
            KMSDRM_drmModeFreeObjectProperties = null;
            KMSDRM_drmModeFreePlane = null;
            KMSDRM_drmModeFreePlaneResources = null;
            KMSDRM_drmModeSetPlane = null;
            SDL_KMSDRM_HAVE_GBM = 0;
            KMSDRM_gbm_device_is_format_supported = null;
            KMSDRM_gbm_device_destroy = null;
            KMSDRM_gbm_create_device = null;
            KMSDRM_gbm_bo_get_width = null;
            KMSDRM_gbm_bo_get_height = null;
            KMSDRM_gbm_bo_get_stride = null;
            KMSDRM_gbm_bo_get_format = null;
            KMSDRM_gbm_bo_get_handle = null;
            KMSDRM_gbm_bo_write = null;
            KMSDRM_gbm_bo_get_device = null;
            KMSDRM_gbm_bo_set_user_data = null;
            KMSDRM_gbm_bo_get_user_data = null;
            KMSDRM_gbm_bo_destroy = null;
            KMSDRM_gbm_bo_create = null;
            KMSDRM_gbm_surface_create = null;
            KMSDRM_gbm_surface_destroy = null;
            KMSDRM_gbm_surface_lock_front_buffer = null;
            KMSDRM_gbm_surface_release_buffer = null;
            KMSDRM_gbm_bo_get_modifier = null;
            KMSDRM_gbm_bo_get_plane_count = null;
            KMSDRM_gbm_bo_get_offset = null;
            KMSDRM_gbm_bo_get_stride_for_plane = null;
            KMSDRM_gbm_bo_get_handle_for_plane = null;
            SDL_KMSDRM_HAVE_ATOMIC = 0;
            KMSDRM_drmIoctl = null;
            KMSDRM_drmModeAtomicAlloc = null;
            KMSDRM_drmModeAtomicFree = null;
            KMSDRM_drmModeAtomicCommit = null;
            KMSDRM_drmModeAtomicAddProperty = null;
            KMSDRM_drmModeCreatePropertyBlob = null;
            {
                i = 0;
                while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(kmsdrmlibs)) / @sizeOf(@TypeOf(kmsdrmlibs[@as(c_int, 0)])))) : (i += 1) {
                    if (kmsdrmlibs[@bitCast(@as(isize, @intCast(i)))].lib != null) {
                        SDL_UnloadObject_REAL(@ptrCast(@alignCast(kmsdrmlibs[@bitCast(@as(isize, @intCast(i)))].lib)));
                        kmsdrmlibs[@bitCast(@as(isize, @intCast(i)))].lib = null;
                    }
                }
            }
        }
    }
}
pub export fn SDL_KMSDRM_LoadSymbols() bool {
    @setEvalBranchQuota(100000);
    var result: bool = @"true" != 0;
    _ = &result;
    if ((blk: {
        const ref = &kmsdrm_load_refcount;
        const tmp = ref.*;
        ref.* += 1;
        break :blk tmp;
    }) == @as(c_int, 0)) {
        var i: c_int = undefined;
        _ = &i;
        var thismod: [*c]c_int = null;
        _ = &thismod;
        {
            i = 0;
            while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(kmsdrmlibs)) / @sizeOf(@TypeOf(kmsdrmlibs[@as(c_int, 0)])))) : (i += 1) {
                if (kmsdrmlibs[@bitCast(@as(isize, @intCast(i)))].libname != null) {
                    kmsdrmlibs[@bitCast(@as(isize, @intCast(i)))].lib = @ptrCast(@alignCast(SDL_LoadObject_REAL(kmsdrmlibs[@bitCast(@as(isize, @intCast(i)))].libname)));
                }
            }
        }
        SDL_KMSDRM_HAVE_LIBDRM = 1;
        SDL_KMSDRM_HAVE_GBM = 1;
        SDL_KMSDRM_HAVE_ATOMIC = 1;
        thismod = &SDL_KMSDRM_HAVE_LIBDRM;
        KMSDRM_drmModeFreeResources = @ptrCast(@alignCast(KMSDRM_GetSym("drmModeFreeResources", thismod, @"true" != 0)));
        KMSDRM_drmModeFreeFB = @ptrCast(@alignCast(KMSDRM_GetSym("drmModeFreeFB", thismod, @"true" != 0)));
        KMSDRM_drmModeFreeCrtc = @ptrCast(@alignCast(KMSDRM_GetSym("drmModeFreeCrtc", thismod, @"true" != 0)));
        KMSDRM_drmModeFreeConnector = @ptrCast(@alignCast(KMSDRM_GetSym("drmModeFreeConnector", thismod, @"true" != 0)));
        KMSDRM_drmModeFreeEncoder = @ptrCast(@alignCast(KMSDRM_GetSym("drmModeFreeEncoder", thismod, @"true" != 0)));
        KMSDRM_drmGetCap = @ptrCast(@alignCast(KMSDRM_GetSym("drmGetCap", thismod, @"true" != 0)));
        KMSDRM_drmSetMaster = @ptrCast(@alignCast(KMSDRM_GetSym("drmSetMaster", thismod, @"true" != 0)));
        KMSDRM_drmDropMaster = @ptrCast(@alignCast(KMSDRM_GetSym("drmDropMaster", thismod, @"true" != 0)));
        KMSDRM_drmAuthMagic = @ptrCast(@alignCast(KMSDRM_GetSym("drmAuthMagic", thismod, @"true" != 0)));
        KMSDRM_drmModeGetResources = @ptrCast(@alignCast(KMSDRM_GetSym("drmModeGetResources", thismod, @"true" != 0)));
        KMSDRM_drmModeAddFB = @ptrCast(@alignCast(KMSDRM_GetSym("drmModeAddFB", thismod, @"true" != 0)));
        KMSDRM_drmModeAddFB2 = @ptrCast(@alignCast(KMSDRM_GetSym("drmModeAddFB2", thismod, @"false" != 0)));
        KMSDRM_drmModeAddFB2WithModifiers = @ptrCast(@alignCast(KMSDRM_GetSym("drmModeAddFB2WithModifiers", thismod, @"false" != 0)));
        KMSDRM_drmModeGetConnectorTypeName = @ptrCast(@alignCast(KMSDRM_GetSym("drmModeGetConnectorTypeName", thismod, @"false" != 0)));
        KMSDRM_drmModeRmFB = @ptrCast(@alignCast(KMSDRM_GetSym("drmModeRmFB", thismod, @"true" != 0)));
        KMSDRM_drmModeGetFB = @ptrCast(@alignCast(KMSDRM_GetSym("drmModeGetFB", thismod, @"true" != 0)));
        KMSDRM_drmModeGetCrtc = @ptrCast(@alignCast(KMSDRM_GetSym("drmModeGetCrtc", thismod, @"true" != 0)));
        KMSDRM_drmModeSetCrtc = @ptrCast(@alignCast(KMSDRM_GetSym("drmModeSetCrtc", thismod, @"true" != 0)));
        KMSDRM_drmModeSetCursor = @ptrCast(@alignCast(KMSDRM_GetSym("drmModeSetCursor", thismod, @"true" != 0)));
        KMSDRM_drmModeSetCursor2 = @ptrCast(@alignCast(KMSDRM_GetSym("drmModeSetCursor2", thismod, @"true" != 0)));
        KMSDRM_drmModeMoveCursor = @ptrCast(@alignCast(KMSDRM_GetSym("drmModeMoveCursor", thismod, @"true" != 0)));
        KMSDRM_drmModeGetEncoder = @ptrCast(@alignCast(KMSDRM_GetSym("drmModeGetEncoder", thismod, @"true" != 0)));
        KMSDRM_drmModeGetConnector = @ptrCast(@alignCast(KMSDRM_GetSym("drmModeGetConnector", thismod, @"true" != 0)));
        KMSDRM_drmHandleEvent = @ptrCast(@alignCast(KMSDRM_GetSym("drmHandleEvent", thismod, @"true" != 0)));
        KMSDRM_drmModePageFlip = @ptrCast(@alignCast(KMSDRM_GetSym("drmModePageFlip", thismod, @"true" != 0)));
        KMSDRM_drmSetClientCap = @ptrCast(@alignCast(KMSDRM_GetSym("drmSetClientCap", thismod, @"true" != 0)));
        KMSDRM_drmModeGetPlaneResources = @ptrCast(@alignCast(KMSDRM_GetSym("drmModeGetPlaneResources", thismod, @"true" != 0)));
        KMSDRM_drmModeGetPlane = @ptrCast(@alignCast(KMSDRM_GetSym("drmModeGetPlane", thismod, @"true" != 0)));
        KMSDRM_drmModeObjectGetProperties = @ptrCast(@alignCast(KMSDRM_GetSym("drmModeObjectGetProperties", thismod, @"true" != 0)));
        KMSDRM_drmModeObjectSetProperty = @ptrCast(@alignCast(KMSDRM_GetSym("drmModeObjectSetProperty", thismod, @"true" != 0)));
        KMSDRM_drmModeGetProperty = @ptrCast(@alignCast(KMSDRM_GetSym("drmModeGetProperty", thismod, @"true" != 0)));
        KMSDRM_drmModeFreeProperty = @ptrCast(@alignCast(KMSDRM_GetSym("drmModeFreeProperty", thismod, @"true" != 0)));
        KMSDRM_drmModeFreeObjectProperties = @ptrCast(@alignCast(KMSDRM_GetSym("drmModeFreeObjectProperties", thismod, @"true" != 0)));
        KMSDRM_drmModeFreePlane = @ptrCast(@alignCast(KMSDRM_GetSym("drmModeFreePlane", thismod, @"true" != 0)));
        KMSDRM_drmModeFreePlaneResources = @ptrCast(@alignCast(KMSDRM_GetSym("drmModeFreePlaneResources", thismod, @"true" != 0)));
        KMSDRM_drmModeSetPlane = @ptrCast(@alignCast(KMSDRM_GetSym("drmModeSetPlane", thismod, @"true" != 0)));
        thismod = &SDL_KMSDRM_HAVE_GBM;
        KMSDRM_gbm_device_is_format_supported = @ptrCast(@alignCast(KMSDRM_GetSym("gbm_device_is_format_supported", thismod, @"true" != 0)));
        KMSDRM_gbm_device_destroy = @ptrCast(@alignCast(KMSDRM_GetSym("gbm_device_destroy", thismod, @"true" != 0)));
        KMSDRM_gbm_create_device = @ptrCast(@alignCast(KMSDRM_GetSym("gbm_create_device", thismod, @"true" != 0)));
        KMSDRM_gbm_bo_get_width = @ptrCast(@alignCast(KMSDRM_GetSym("gbm_bo_get_width", thismod, @"true" != 0)));
        KMSDRM_gbm_bo_get_height = @ptrCast(@alignCast(KMSDRM_GetSym("gbm_bo_get_height", thismod, @"true" != 0)));
        KMSDRM_gbm_bo_get_stride = @ptrCast(@alignCast(KMSDRM_GetSym("gbm_bo_get_stride", thismod, @"true" != 0)));
        KMSDRM_gbm_bo_get_format = @ptrCast(@alignCast(KMSDRM_GetSym("gbm_bo_get_format", thismod, @"true" != 0)));
        KMSDRM_gbm_bo_get_handle = @ptrCast(@alignCast(KMSDRM_GetSym("gbm_bo_get_handle", thismod, @"true" != 0)));
        KMSDRM_gbm_bo_write = @ptrCast(@alignCast(KMSDRM_GetSym("gbm_bo_write", thismod, @"true" != 0)));
        KMSDRM_gbm_bo_get_device = @ptrCast(@alignCast(KMSDRM_GetSym("gbm_bo_get_device", thismod, @"true" != 0)));
        KMSDRM_gbm_bo_set_user_data = @ptrCast(@alignCast(KMSDRM_GetSym("gbm_bo_set_user_data", thismod, @"true" != 0)));
        KMSDRM_gbm_bo_get_user_data = @ptrCast(@alignCast(KMSDRM_GetSym("gbm_bo_get_user_data", thismod, @"true" != 0)));
        KMSDRM_gbm_bo_destroy = @ptrCast(@alignCast(KMSDRM_GetSym("gbm_bo_destroy", thismod, @"true" != 0)));
        KMSDRM_gbm_bo_create = @ptrCast(@alignCast(KMSDRM_GetSym("gbm_bo_create", thismod, @"true" != 0)));
        KMSDRM_gbm_surface_create = @ptrCast(@alignCast(KMSDRM_GetSym("gbm_surface_create", thismod, @"true" != 0)));
        KMSDRM_gbm_surface_destroy = @ptrCast(@alignCast(KMSDRM_GetSym("gbm_surface_destroy", thismod, @"true" != 0)));
        KMSDRM_gbm_surface_lock_front_buffer = @ptrCast(@alignCast(KMSDRM_GetSym("gbm_surface_lock_front_buffer", thismod, @"true" != 0)));
        KMSDRM_gbm_surface_release_buffer = @ptrCast(@alignCast(KMSDRM_GetSym("gbm_surface_release_buffer", thismod, @"true" != 0)));
        KMSDRM_gbm_bo_get_modifier = @ptrCast(@alignCast(KMSDRM_GetSym("gbm_bo_get_modifier", thismod, @"false" != 0)));
        KMSDRM_gbm_bo_get_plane_count = @ptrCast(@alignCast(KMSDRM_GetSym("gbm_bo_get_plane_count", thismod, @"false" != 0)));
        KMSDRM_gbm_bo_get_offset = @ptrCast(@alignCast(KMSDRM_GetSym("gbm_bo_get_offset", thismod, @"false" != 0)));
        KMSDRM_gbm_bo_get_stride_for_plane = @ptrCast(@alignCast(KMSDRM_GetSym("gbm_bo_get_stride_for_plane", thismod, @"false" != 0)));
        KMSDRM_gbm_bo_get_handle_for_plane = @ptrCast(@alignCast(KMSDRM_GetSym("gbm_bo_get_handle_for_plane", thismod, @"false" != 0)));
        thismod = &SDL_KMSDRM_HAVE_ATOMIC;
        KMSDRM_drmIoctl = @ptrCast(@alignCast(KMSDRM_GetSym("drmIoctl", thismod, @"true" != 0)));
        KMSDRM_drmModeAtomicAlloc = @ptrCast(@alignCast(KMSDRM_GetSym("drmModeAtomicAlloc", thismod, @"true" != 0)));
        KMSDRM_drmModeAtomicFree = @ptrCast(@alignCast(KMSDRM_GetSym("drmModeAtomicFree", thismod, @"true" != 0)));
        KMSDRM_drmModeAtomicCommit = @ptrCast(@alignCast(KMSDRM_GetSym("drmModeAtomicCommit", thismod, @"true" != 0)));
        KMSDRM_drmModeAtomicAddProperty = @ptrCast(@alignCast(KMSDRM_GetSym("drmModeAtomicAddProperty", thismod, @"true" != 0)));
        KMSDRM_drmModeCreatePropertyBlob = @ptrCast(@alignCast(KMSDRM_GetSym("drmModeCreatePropertyBlob", thismod, @"true" != 0)));
        if ((SDL_KMSDRM_HAVE_LIBDRM != 0) and (SDL_KMSDRM_HAVE_GBM != 0)) {
            _ = SDL_ClearError_REAL();
        } else {
            SDL_KMSDRM_UnloadSymbols();
            result = @"false" != 0;
        }
    }
    return result;
}

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
