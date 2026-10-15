//! Private libdrm and GBM C ABI declarations for the Linux KMS backend.
//!
//! The records mirror xf86drmMode.h and gbm.h. Public code uses copied mode
//! values and typed handles; no C record escapes this file.
const std = @import("std");

pub const ModeInfo = extern struct {
    clock: u32,
    hdisplay: u16,
    hsync_start: u16,
    hsync_end: u16,
    htotal: u16,
    hskew: u16,
    vdisplay: u16,
    vsync_start: u16,
    vsync_end: u16,
    vtotal: u16,
    vscan: u16,
    vrefresh: u32,
    flags: u32,
    kind: u32,
    name: [32]u8,
};

pub const Resources = extern struct {
    count_fbs: c_int,
    fbs: ?[*]u32,
    count_crtcs: c_int,
    crtcs: ?[*]u32,
    count_connectors: c_int,
    connectors: ?[*]u32,
    count_encoders: c_int,
    encoders: ?[*]u32,
    min_width: u32,
    max_width: u32,
    min_height: u32,
    max_height: u32,
};

pub const Connector = extern struct {
    connector_id: u32,
    encoder_id: u32,
    connector_type: u32,
    connector_type_id: u32,
    connection: c_int,
    width_mm: u32,
    height_mm: u32,
    subpixel: c_int,
    count_modes: c_int,
    modes: ?[*]ModeInfo,
    count_props: c_int,
    props: ?[*]u32,
    prop_values: ?[*]u64,
    count_encoders: c_int,
    encoders: ?[*]u32,
};

pub const Encoder = extern struct {
    encoder_id: u32,
    encoder_type: u32,
    crtc_id: u32,
    possible_crtcs: u32,
    possible_clones: u32,
};

pub const Crtc = extern struct {
    crtc_id: u32,
    buffer_id: u32,
    x: u32,
    y: u32,
    width: u32,
    height: u32,
    mode_valid: c_int,
    mode: ModeInfo,
    gamma_size: c_int,
};

pub const PlaneResources = extern struct { count_planes: u32, planes: ?[*]u32 };
pub const Plane = extern struct {
    count_formats: u32,
    formats: ?[*]u32,
    plane_id: u32,
    crtc_id: u32,
    fb_id: u32,
    crtc_x: u32,
    crtc_y: u32,
    x: u32,
    y: u32,
    possible_crtcs: u32,
    gamma_size: u32,
};
pub const ObjectProperties = extern struct { count_props: u32, props: ?[*]u32, prop_values: ?[*]u64 };
pub const Property = extern struct {
    prop_id: u32,
    flags: u32,
    name: [32]u8,
    count_values: c_int,
    values: ?[*]u64,
    count_enums: c_int,
    enums: ?*anyopaque,
    count_blobs: c_int,
    blob_ids: ?[*]u32,
};

pub const OpaqueAtomicRequest = opaque {};
pub const OpaqueGbmDevice = opaque {};
pub const OpaqueGbmSurface = opaque {};
pub const OpaqueGbmBo = opaque {};
pub const BoHandle = extern union { ptr: ?*anyopaque, s32: i32, u32: u32, s64: i64, u64: u64 };

pub const FlipHandler = *const fn (c_int, u32, u32, u32, ?*anyopaque) callconv(.c) void;
pub const EventContext = extern struct {
    version: c_int,
    vblank_handler: ?FlipHandler,
    page_flip_handler: ?FlipHandler,
    page_flip_handler2: ?*const anyopaque,
    sequence_handler: ?*const anyopaque,
};

pub const DrmFunctions = struct {
    drmSetMaster: *const fn (c_int) callconv(.c) c_int,
    drmDropMaster: *const fn (c_int) callconv(.c) c_int,
    drmSetClientCap: *const fn (c_int, u64, u64) callconv(.c) c_int,
    drmModeGetResources: *const fn (c_int) callconv(.c) ?*Resources,
    drmModeFreeResources: *const fn (*Resources) callconv(.c) void,
    drmModeGetConnector: *const fn (c_int, u32) callconv(.c) ?*Connector,
    drmModeFreeConnector: *const fn (*Connector) callconv(.c) void,
    drmModeGetEncoder: *const fn (c_int, u32) callconv(.c) ?*Encoder,
    drmModeFreeEncoder: *const fn (*Encoder) callconv(.c) void,
    drmModeGetCrtc: *const fn (c_int, u32) callconv(.c) ?*Crtc,
    drmModeFreeCrtc: *const fn (*Crtc) callconv(.c) void,
    drmModeSetCrtc: *const fn (c_int, u32, u32, u32, u32, [*]const u32, c_int, ?*const ModeInfo) callconv(.c) c_int,
    drmModePageFlip: *const fn (c_int, u32, u32, u32, ?*anyopaque) callconv(.c) c_int,
    drmHandleEvent: *const fn (c_int, *EventContext) callconv(.c) c_int,
    drmModeAddFB2: *const fn (c_int, u32, u32, u32, *const [4]u32, *const [4]u32, *const [4]u32, *u32, u32) callconv(.c) c_int,
    drmModeRmFB: *const fn (c_int, u32) callconv(.c) c_int,
    drmModeGetPlaneResources: *const fn (c_int) callconv(.c) ?*PlaneResources,
    drmModeFreePlaneResources: *const fn (*PlaneResources) callconv(.c) void,
    drmModeGetPlane: *const fn (c_int, u32) callconv(.c) ?*Plane,
    drmModeFreePlane: *const fn (*Plane) callconv(.c) void,
    drmModeObjectGetProperties: *const fn (c_int, u32, u32) callconv(.c) ?*ObjectProperties,
    drmModeFreeObjectProperties: *const fn (*ObjectProperties) callconv(.c) void,
    drmModeGetProperty: *const fn (c_int, u32) callconv(.c) ?*Property,
    drmModeFreeProperty: *const fn (*Property) callconv(.c) void,
    drmModeAtomicAlloc: *const fn () callconv(.c) ?*OpaqueAtomicRequest,
    drmModeAtomicFree: *const fn (*OpaqueAtomicRequest) callconv(.c) void,
    drmModeAtomicAddProperty: *const fn (*OpaqueAtomicRequest, u32, u32, u64) callconv(.c) c_int,
    drmModeAtomicCommit: *const fn (c_int, *const OpaqueAtomicRequest, u32, ?*anyopaque) callconv(.c) c_int,
    drmModeCreatePropertyBlob: *const fn (c_int, *const anyopaque, usize, *u32) callconv(.c) c_int,
    drmModeDestroyPropertyBlob: *const fn (c_int, u32) callconv(.c) c_int,
    drmModeSetCursor2: *const fn (c_int, u32, u32, u32, u32, i32, i32) callconv(.c) c_int,
    drmModeMoveCursor: *const fn (c_int, u32, c_int, c_int) callconv(.c) c_int,
};

pub const GbmFunctions = struct {
    gbm_create_device: *const fn (c_int) callconv(.c) ?*OpaqueGbmDevice,
    gbm_device_destroy: *const fn (*OpaqueGbmDevice) callconv(.c) void,
    gbm_bo_create: *const fn (*OpaqueGbmDevice, u32, u32, u32, u32) callconv(.c) ?*OpaqueGbmBo,
    gbm_bo_destroy: *const fn (*OpaqueGbmBo) callconv(.c) void,
    gbm_bo_get_width: *const fn (*OpaqueGbmBo) callconv(.c) u32,
    gbm_bo_get_height: *const fn (*OpaqueGbmBo) callconv(.c) u32,
    gbm_bo_get_stride: *const fn (*OpaqueGbmBo) callconv(.c) u32,
    gbm_bo_get_handle: *const fn (*OpaqueGbmBo) callconv(.c) BoHandle,
    gbm_bo_map: *const fn (*OpaqueGbmBo, u32, u32, u32, u32, u32, *u32, *?*anyopaque) callconv(.c) ?*anyopaque,
    gbm_bo_unmap: *const fn (*OpaqueGbmBo, ?*anyopaque) callconv(.c) void,
    gbm_surface_create: *const fn (*OpaqueGbmDevice, u32, u32, u32, u32) callconv(.c) ?*OpaqueGbmSurface,
    gbm_surface_destroy: *const fn (*OpaqueGbmSurface) callconv(.c) void,
    gbm_surface_lock_front_buffer: *const fn (*OpaqueGbmSurface) callconv(.c) ?*OpaqueGbmBo,
    gbm_surface_release_buffer: *const fn (*OpaqueGbmSurface, *OpaqueGbmBo) callconv(.c) void,
};

/// Runtime-loaded libdrm and libgbm. Missing libraries or required entry points
/// are normalized to Unavailable so importing zdl never loads either library.
pub const Library = struct {
    drm: std.DynLib,
    gbm: std.DynLib,
    drm_functions: DrmFunctions,
    gbm_functions: GbmFunctions,

    pub fn open() error{Unavailable}!Library {
        var drm = std.DynLib.open("libdrm.so.2") catch return error.Unavailable;
        errdefer drm.close();
        var gbm = std.DynLib.open("libgbm.so.1") catch return error.Unavailable;
        errdefer gbm.close();
        var drm_functions: DrmFunctions = undefined;
        inline for (@typeInfo(DrmFunctions).@"struct".field_names) |name| {
            @field(drm_functions, name) = drm.lookup(@FieldType(DrmFunctions, name), name) orelse return error.Unavailable;
        }
        var gbm_functions: GbmFunctions = undefined;
        inline for (@typeInfo(GbmFunctions).@"struct".field_names) |name| {
            @field(gbm_functions, name) = gbm.lookup(@FieldType(GbmFunctions, name), name) orelse return error.Unavailable;
        }
        return .{ .drm = drm, .gbm = gbm, .drm_functions = drm_functions, .gbm_functions = gbm_functions };
    }

    pub fn deinit(self: *Library) void {
        self.gbm.close();
        self.drm.close();
        self.* = undefined;
    }
};

comptime {
    if (@sizeOf(ModeInfo) != 68) @compileError("drmModeModeInfo ABI size mismatch");
    if (@offsetOf(ModeInfo, "name") != 36) @compileError("drmModeModeInfo.name ABI offset mismatch");
}
