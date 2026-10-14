//! Camera device descriptions, format negotiation, permission state and frame
//! timestamp rebasing shared by camera backends.
//! Altered native port of SDL_camera.c and SDL_syscamera.h. The pure decision
//! logic (spec ordering, duplicate removal, closest-spec matching, app spec
//! defaults and timestamp mapping) is ported with SDL's comparison order and
//! float arithmetic. Backends own the device handle, the capture loop and the
//! frame buffers.
//!
//! Deliberate differences from SDL:
//! - There is no global device table, pending-event queue, SDL_Camera ID or
//!   device thread. Devices are plain values owned by the caller, and frames
//!   are pulled explicitly from a backend session (see v4l2.zig).
//! - There is no frame conversion or scaling pipeline yet. A requested spec whose
//!   format or size differs from the device's closest native spec is rejected
//!   with `ConversionUnsupported` instead of being converted with SDL's
//!   pixel-conversion and stretch paths.
//! - A disconnect is reported as a backend error rather than replaced by
//!   synthetic black "zombie" frames, which relied on the device thread.
const std = @import("std");

/// Errors from spec validation and negotiation. Backend-specific failures are
/// defined by each backend.
pub const Error = error{
    /// A device spec had an unknown format or a zero dimension.
    InvalidSpec,
    /// The requested format or size needs conversion or scaling, which this
    /// library does not perform yet.
    ConversionUnsupported,
};

/// Pixel formats the camera layer reasons about. These are storage layouts of
/// camera output rather than SDL_PixelFormat values. Only the subset produced by
/// the V4L2 backend is mapped there; the other planar and packed YUV layouts
/// keep SDL's ordering semantics for future backends.
pub const Format = enum {
    /// No format is known yet (SDL_PIXELFORMAT_UNKNOWN).
    unknown,
    /// Packed 4:2:2 bytes Y0 U Y1 V (fourcc 'YUY2' / V4L2 'YUYV').
    yuy2,
    /// Packed 4:2:2 bytes U Y0 V Y1.
    uyvy,
    /// Packed 4:2:2 bytes Y0 V Y1 U.
    yvyu,
    /// Planar 4:2:0 bytes: full-size Y plane, then V plane, then U plane.
    yv12,
    /// Planar 4:2:0 bytes: full-size Y plane, then U plane, then V plane.
    iyuv,
    /// Semi-planar 4:2:0: Y plane, then interleaved UV pairs.
    nv12,
    /// Semi-planar 4:2:0: Y plane, then interleaved VU pairs.
    nv21,
    /// Motion JPEG. Compressed, so a frame's byte length varies.
    mjpg,
    /// Four bytes per pixel in memory order R, G, B, unused. The X byte is
    /// ignored by consumers.
    rgbx32,

    /// True for storage described by a fourcc rather than a fixed bit depth.
    pub fn is_fourcc(self: Format) bool {
        return self != .unknown and self != .rgbx32;
    }

    /// SDL_BITSPERPIXEL semantics: fourcc layouts report zero, since their
    /// storage is not a fixed number of bits per pixel.
    pub fn bits_per_pixel(self: Format) u8 {
        return if (self == .rgbx32) 32 else 0;
    }
};

/// Color encoding of camera frames. Only the values the V4L2 backend can report
/// are named; the full-range test follows SDL's SDL_COLORSPACERANGE.
pub const Colorspace = enum {
    unknown,
    /// sRGB with full-range components.
    srgb,
    /// BT.709 primaries and matrix with limited (video) range.
    bt709_limited,

    /// True when the colorspace encodes full-range samples.
    pub fn is_full_range(self: Colorspace) bool {
        return self == .srgb;
    }
};

/// One supported or requested capture mode. A zero width, height or framerate
/// denominator means "unspecified" when used as a request.
/// The framerate is numerator/denominator frames per second.
pub const Spec = struct {
    format: Format = .unknown,
    colorspace: Colorspace = .unknown,
    width: u32 = 0,
    height: u32 = 0,
    framerate_numerator: u32 = 0,
    framerate_denominator: u32 = 0,
};

/// Physical placement of a camera relative to the display.
pub const Position = enum { unknown, front_facing, back_facing };

/// User permission state for a camera. Denied devices cannot produce frames;
/// backends without a permission prompt report approved once opened.
pub const PermissionState = enum(i8) {
    denied = -1,
    pending = 0,
    approved = 1,
};

/// A discovered camera with its supported modes. Owns its name and specs and
/// releases both through the allocator it captured.
pub const Info = struct {
    allocator: std.mem.Allocator,
    name: []u8,
    position: Position,
    /// Supported specs, best first. Sorted with `spec_precedes` and free of
    /// adjacent duplicates, as SDL_AddCamera produces.
    specs: []Spec,

    /// Copies `name` and `specs`, validates the specs, then sorts and removes
    /// adjacent duplicate entries. Zero specs are accepted.
    pub fn init(allocator: std.mem.Allocator, name: []const u8, position: Position, specs: []const Spec) (Error || std.mem.Allocator.Error)!Info {
        for (specs) |spec| {
            if (spec.format == .unknown or spec.width == 0 or spec.height == 0) return error.InvalidSpec;
        }
        const owned_name = try allocator.dupe(u8, name);
        errdefer allocator.free(owned_name);
        const owned_specs = try allocator.dupe(Spec, specs);
        errdefer allocator.free(owned_specs);

        std.mem.sort(Spec, owned_specs, {}, sort_less);
        const unique = remove_adjacent_duplicates(owned_specs);
        const shrunk = try allocator.realloc(owned_specs, unique);
        return .{
            .allocator = allocator,
            .name = owned_name,
            .position = position,
            .specs = shrunk,
        };
    }

    /// Releases the name and spec storage. The Info must not be used afterwards.
    pub fn deinit(self: *Info) void {
        self.allocator.free(self.name);
        self.allocator.free(self.specs);
        self.* = undefined;
    }
};

/// Strict ordering used to sort supported specs, best first. Mirrors
/// SDL's CameraSpecCmp: fourcc layouts first, then higher bits per pixel,
/// larger width, larger height, specs with a framerate, faster framerates, and
/// full-range colorspaces. Equal specs compare as not preceding each other.
pub fn spec_precedes(a: Spec, b: Spec) bool {
    const a_fourcc = a.format.is_fourcc();
    const b_fourcc = b.format.is_fourcc();
    if (a_fourcc != b_fourcc) return a_fourcc;

    const a_bpp = a.format.bits_per_pixel();
    const b_bpp = b.format.bits_per_pixel();
    if (a_bpp != b_bpp) return a_bpp > b_bpp;

    if (a.width != b.width) return a.width > b.width;
    if (a.height != b.height) return a.height > b.height;

    const a_has_rate = a.framerate_numerator != 0;
    const b_has_rate = b.framerate_numerator != 0;
    if (a_has_rate != b_has_rate) return a_has_rate;

    // SDL divides without a zero check here. A zero denominator yields inf or
    // NaN, and NaN compares equal in both directions as it does in C.
    const a_fps = raw_fps(a);
    const b_fps = raw_fps(b);
    if (a_fps > b_fps) return true;
    if (b_fps > a_fps) return false;

    const a_full = a.colorspace.is_full_range();
    const b_full = b.colorspace.is_full_range();
    if (a_full != b_full) return a_full;
    return false;
}

fn sort_less(_: void, a: Spec, b: Spec) bool {
    return spec_precedes(a, b);
}

/// Frames per second as a float, without SDL's zero-denominator guard.
fn raw_fps(spec: Spec) f32 {
    return @as(f32, @floatFromInt(spec.framerate_numerator)) / @as(f32, @floatFromInt(spec.framerate_denominator));
}

/// Frames per second, or zero when the framerate is unspecified.
fn fps_or_zero(spec: Spec) f32 {
    return if (spec.framerate_denominator != 0) raw_fps(spec) else 0.0;
}

/// Removes each element equal to its predecessor among the kept elements, and
/// returns the new length. Only adjacent duplicates are removed, as in SDL.
/// Operates in place on a sorted slice.
fn remove_adjacent_duplicates(specs: []Spec) usize {
    if (specs.len == 0) return 0;
    var kept: usize = 1;
    for (specs[1..]) |spec| {
        if (std.meta.eql(specs[kept - 1], spec)) continue;
        specs[kept] = spec;
        kept += 1;
    }
    return kept;
}

fn absolute_difference(a: u32, b: u32) u32 {
    return if (a > b) a - b else b - a;
}

/// Chooses the supported mode closest to `requested`, as SDL's
/// ChooseBestCameraSpec does. With no request, the best-sorted spec is returned.
/// With a request, the closest aspect ratio wins first, then the closest width
/// to the request. Then the requested format is preferred at that size, and
/// last the closest framerate. Exact framerate matches are taken immediately.
/// Preferring the exact size over an exact format is deliberate: converting
/// the format is cheaper than scaling.
///
/// `specs` must come from `Info.init`, so every spec has a known format and
/// nonzero dimensions. With no specs, the request is returned unchanged.
pub fn choose_closest(specs: []const Spec, requested: ?Spec) Spec {
    if (specs.len == 0) return requested orelse Spec{};
    const want = requested orelse return specs[0];

    var closest = Spec{};
    if (want.width > 0 and want.height > 0) {
        // Pick the closest aspect ratio, then the closest width within it.
        const want_aspect: f32 = @as(f32, @floatFromInt(want.width)) / @as(f32, @floatFromInt(want.height));
        const epsilon: f32 = 1e-6;
        var closest_aspect: f32 = -9999999.0;
        var closest_diff: f32 = 999999.0;
        var closest_diff_w: u32 = 9999999;
        for (specs) |spec| {
            const this_aspect: f32 = @as(f32, @floatFromInt(spec.width)) / @as(f32, @floatFromInt(spec.height));
            const aspect_diff = @abs(want_aspect - this_aspect);
            const diff = @abs(closest_aspect - this_aspect);
            const diff_w = absolute_difference(spec.width, want.width);
            if (diff < epsilon) {
                // Same aspect ratio as the current choice: prefer closer width.
                if (diff_w < closest_diff_w) {
                    closest_diff_w = diff_w;
                    closest.width = spec.width;
                    closest.height = spec.height;
                }
            } else if (aspect_diff < closest_diff) {
                closest_diff = aspect_diff;
                closest_aspect = this_aspect;
                closest_diff_w = diff_w;
                closest.width = spec.width;
                closest.height = spec.height;
            }
        }
    } else {
        closest.width = specs[0].width;
        closest.height = specs[0].height;
    }

    // Prefer the requested format at this size. The list is sorted best-format
    // first, so the first size match is the fallback.
    var best_format: Format = .unknown;
    var best_colorspace: Colorspace = .unknown;
    for (specs) |spec| {
        if (spec.width != closest.width or spec.height != closest.height) continue;
        if (best_format == .unknown) {
            best_format = spec.format;
            best_colorspace = spec.colorspace;
        }
        if (spec.format == want.format) {
            best_format = spec.format;
            best_colorspace = spec.colorspace;
            break;
        }
    }
    closest.format = best_format;
    closest.colorspace = best_colorspace;

    // Finally the closest framerate for this format and size.
    const want_fps = fps_or_zero(want);
    var closest_fps: f32 = 9999999.0;
    for (specs) |spec| {
        if (spec.format != closest.format or spec.width != closest.width or spec.height != closest.height) continue;
        if (spec.framerate_numerator == want.framerate_numerator and spec.framerate_denominator == want.framerate_denominator) {
            closest.framerate_numerator = spec.framerate_numerator;
            closest.framerate_denominator = spec.framerate_denominator;
            break;
        }
        const fps_diff = @abs(want_fps - fps_or_zero(spec));
        if (fps_diff < closest_fps) {
            closest_fps = fps_diff;
            closest.framerate_numerator = spec.framerate_numerator;
            closest.framerate_denominator = spec.framerate_denominator;
        }
    }
    return closest;
}

/// Result of matching a request against a device's supported specs.
pub const Negotiation = struct {
    /// Native mode the backend must configure. Frames arrive in this spec.
    device: Spec,
    /// Spec the application sees. Unset request fields are filled from
    /// `device`, as SDL_PrepareCameraSurfaces does. Colorspace is always the
    /// device's, since frames are not converted.
    app: Spec,
};

/// Chooses the device mode for `requested` and resolves the application spec.
/// Returns `ConversionUnsupported` when the application format or size differs
/// from the device's mode, because no conversion or scaling path exists yet.
pub fn negotiate(specs: []const Spec, requested: ?Spec) Error!Negotiation {
    const device = choose_closest(specs, requested);
    if (device.format == .unknown or device.width == 0 or device.height == 0) return error.InvalidSpec;

    var app = requested orelse device;
    if (app.width == 0 or app.height == 0) {
        app.width = device.width;
        app.height = device.height;
    }
    if (app.format == .unknown) app.format = device.format;
    if (app.framerate_denominator == 0) {
        app.framerate_numerator = device.framerate_numerator;
        app.framerate_denominator = device.framerate_denominator;
    }
    app.colorspace = device.colorspace;

    if (app.format != device.format or app.width != device.width or app.height != device.height) {
        return error.ConversionUnsupported;
    }
    return .{ .device = device, .app = app };
}

/// Maps driver timestamps onto the application's monotonic clock. The first
/// frame is anchored to the current time, and later frames keep their driver
/// spacing, as SDL's CameraThreadIterate does. Arithmetic wraps like SDL's
/// unsigned 64-bit math. The clock is passed in, so this stays pure and testable.
pub const Timestamp = struct {
    /// Driver timestamp of the first frame, in nanoseconds.
    base_ns: u64 = 0,
    /// Application timestamp assigned to the first frame. Zero means unanchored.
    adjust_ns: u64 = 0,

    /// Converts a driver timestamp to application time. `now_ns` is only read for
    /// the first frame after a reset.
    pub fn map(self: *Timestamp, driver_ns: u64, now_ns: u64) u64 {
        if (self.adjust_ns == 0) {
            self.adjust_ns = now_ns;
            self.base_ns = driver_ns;
        }
        return (driver_ns -% self.base_ns) +% self.adjust_ns;
    }

    /// Forgets the anchor, so the next frame re-anchors to the current time.
    pub fn reset(self: *Timestamp) void {
        self.* = .{};
    }
};

/// One captured frame. `data` and `slot` borrow the backend's buffer, which is
/// only valid until the frame is released back to its session. Frames are
/// values, so the backend checks the slot again on release.
pub const Frame = struct {
    /// Backend buffer slot. Used only by the session that produced the frame.
    slot: u32,
    /// Frame bytes in the device's spec. Compressed formats may be shorter than
    /// the buffer.
    data: []const u8,
    /// Row pitch in bytes for uncompressed layouts, or the frame length when
    /// the driver reports no pitch.
    stride: usize,
    /// Application-clock timestamp in nanoseconds.
    timestamp_ns: u64,
};
