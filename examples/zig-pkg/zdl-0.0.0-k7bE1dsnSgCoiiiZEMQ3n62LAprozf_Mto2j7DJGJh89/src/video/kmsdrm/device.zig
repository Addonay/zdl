//! Linux KMS/DRM output, scanout buffers and cursor plane operations.
//!
//! This port follows SDL's KMSDRM path: choose a connected connector and
//! preferred mode, keep the prior CRTC state, create GBM scanout buffers, try
//! atomic modesetting and fall back to legacy modeset/page flips. DRM and GBM
//! are loaded only by `Device.open`; this module requires libc for opening the
//! card node. Rendering here is software-to-GBM. EGL callers can create their
//! own EGL window surface from `gbm_surface` and `egl_platform`.
const std = @import("std");
const binding = @import("binding.zig");
const pixels = @import("../pixels.zig");
const surface = @import("../surface.zig");
const egl_display = @import("../egl/display.zig");
const vt_switch = @import("vt.zig");

const drm_format_xrgb8888: u32 = 0x3432_5258;
const drm_format_argb8888: u32 = 0x3432_5241;
const gbm_bo_use_scanout: u32 = 1;
const gbm_bo_use_cursor: u32 = 2;
const gbm_bo_use_write: u32 = 8;
const gbm_bo_use_linear: u32 = 16;
const gbm_bo_transfer_write: u32 = 2;
const drm_client_cap_universal_planes: u64 = 2;
const drm_client_cap_atomic: u64 = 3;
const drm_mode_connected: c_int = 1;
const drm_mode_type_preferred: u32 = 1 << 3;
const drm_mode_object_crtc: u32 = 0xcccc_cccc;
const drm_mode_object_connector: u32 = 0xc0c0_c0c0;
const drm_mode_object_plane: u32 = 0xeeee_eeee;
const drm_mode_page_flip_event: u32 = 1;
const drm_mode_atomic_nonblock: u32 = 0x0200;
const drm_mode_atomic_allow_modeset: u32 = 0x0400;

/// Device, DRM/GBM ABI, mode and scanout failures.
pub const Error = surface.Error || pixels.Error || std.mem.Allocator.Error || error{
    Unavailable,
    DeviceOpenFailed,
    MasterUnavailable,
    DeviceFailure,
    NoResources,
    NoConnector,
    NoEncoder,
    NoCompatibleCrtc,
    NoMode,
    InvalidSize,
    BufferMappingFailed,
    UnsupportedCursor,
    PollFailed,
    AtomicUnavailable,
};

/// A copied display mode. `refresh_millihz` uses a thousandth-of-Hz unit to
/// avoid floating-point mode selection.
pub const Mode = struct { width: u16, height: u16, refresh_millihz: u32 };

/// Device-selection options. A missing node uses `/dev/dri/card0`; a missing
/// connector selects the first connected connector with a preferred mode.
pub const Options = struct {
    node: []const u8 = "/dev/dri/card0",
    connector_id: ?u32 = null,
    width: ?u16 = null,
    height: ?u16 = null,
    prefer_atomic: bool = true,
};

const OriginalCrtc = struct {
    buffer_id: u32,
    x: u32,
    y: u32,
    mode: ?binding.ModeInfo,
};

const AtomicProperties = struct {
    connector_crtc_id: u32,
    crtc_mode_id: u32,
    crtc_active: u32,
    plane_fb_id: u32,
    plane_crtc_id: u32,
    plane_src_x: u32,
    plane_src_y: u32,
    plane_src_w: u32,
    plane_src_h: u32,
    plane_crtc_x: u32,
    plane_crtc_y: u32,
    plane_crtc_w: u32,
    plane_crtc_h: u32,
};

const Scanout = struct { bo: *binding.OpaqueGbmBo, fb_id: u32 };

/// A page flip the kernel has accepted whose completion has not been handled.
/// It is heap-allocated because its address is the kernel's user data, and it
/// owns `next` (the buffer that becomes scanout on completion) until then.
const PendingFlip = struct {
    completed: bool = false,
    next: Scanout,
    gbm_surface: ?*binding.OpaqueGbmSurface,
};

/// Usable CRTC indices are bits of a 32-bit `possible_crtcs` mask.
const max_crtc_index = 32;

/// Owns a DRM card connection, DRM master lease, GBM device and current
/// scanout. One Device controls one connector/CRTC at a time. Closing restores
/// the saved CRTC mode before releasing buffers and DRM master.
pub const Device = struct {
    allocator: std.mem.Allocator,
    library: binding.Library,
    fd: c_int,
    drm_device: *binding.OpaqueGbmDevice,
    connector_id: u32,
    crtc_id: u32,
    crtc_index: u5,
    mode: binding.ModeInfo,
    original: OriginalCrtc,
    vt: ?vt_switch.Session = null,
    has_master: bool = true,
    vt_generation: u64 = 0,
    current: ?Scanout = null,
    current_gbm_surface: ?*binding.OpaqueGbmSurface = null,
    pending_flip: ?*PendingFlip = null,
    atomic: ?AtomicProperties = null,
    primary_plane_id: ?u32 = null,
    atomic_enabled: bool = false,
    cursor: ?*binding.OpaqueGbmBo = null,

    /// Opens the selected DRM node, becomes master, selects a connected output
    /// and mode, and creates a GBM device. All failure paths unwind in reverse.
    pub fn open(allocator: std.mem.Allocator, options: Options) Error!Device {
        var library = binding.Library.open() catch return error.Unavailable;
        errdefer library.deinit();
        const node = try allocator.dupeSentinel(u8, options.node, 0);
        defer allocator.free(node);
        const fd = std.c.open(node, .{ .ACCMODE = .RDWR, .CLOEXEC = true });
        if (fd < 0) return error.DeviceOpenFailed;
        errdefer _ = std.c.close(fd);
        const drm = &library.drm_functions;
        if (drm.drmSetMaster(fd) != 0) return error.MasterUnavailable;
        errdefer _ = drm.drmDropMaster(fd);
        const resources = drm.drmModeGetResources(fd) orelse return error.NoResources;
        defer drm.drmModeFreeResources(resources);
        if (resources.count_connectors <= 0 or resources.count_crtcs <= 0) return error.NoResources;

        var selected_connector: ?*binding.Connector = null;
        defer if (selected_connector) |connector| drm.drmModeFreeConnector(connector);
        var selected_encoder_id: u32 = 0;
        var chosen_mode: ?binding.ModeInfo = null;
        var selected_crtc: u32 = 0;
        var selected_crtc_index: u5 = 0;

        const connector_ids = resources.connectors orelse return error.NoResources;
        for (0..@intCast(resources.count_connectors)) |connector_index| {
            const connector_id = connector_ids[connector_index];
            if (options.connector_id) |wanted| if (connector_id != wanted) continue;
            const connector = drm.drmModeGetConnector(fd, connector_id) orelse continue;
            if (connector.connection != drm_mode_connected or connector.count_modes <= 0) {
                drm.drmModeFreeConnector(connector);
                continue;
            }
            selected_connector = connector;
            const modes = connector.modes orelse return error.NoMode;
            chosen_mode = choose_mode(modes[0..@intCast(connector.count_modes)], options) orelse return error.NoMode;
            selected_encoder_id = connector.encoder_id;
            if (selected_encoder_id == 0 and connector.count_encoders > 0) {
                selected_encoder_id = (connector.encoders orelse return error.NoEncoder)[0];
            }
            if (selected_encoder_id == 0) return error.NoEncoder;
            break;
        }
        const connector = selected_connector orelse return error.NoConnector;

        const encoder = drm.drmModeGetEncoder(fd, selected_encoder_id) orelse return error.NoEncoder;
        defer drm.drmModeFreeEncoder(encoder);
        const crtc_ids = resources.crtcs orelse return error.NoResources;
        const crtc_count: usize = @min(@as(usize, @intCast(resources.count_crtcs)), max_crtc_index);
        var busy: [max_crtc_index]bool = @splat(false);
        for (0..crtc_count) |index| {
            busy[index] = crtc_routed_to_other_output(fd, drm, resources, crtc_ids[index], connector.connector_id);
        }
        const crtc_index = pick_crtc_index(crtc_ids[0..crtc_count], encoder.crtc_id, encoder.possible_crtcs, busy[0..crtc_count]) orelse return error.NoCompatibleCrtc;
        selected_crtc = crtc_ids[crtc_index];
        selected_crtc_index = @intCast(crtc_index);
        const old_crtc = drm.drmModeGetCrtc(fd, selected_crtc) orelse return error.DeviceFailure;
        const original: OriginalCrtc = .{
            .buffer_id = old_crtc.buffer_id,
            .x = old_crtc.x,
            .y = old_crtc.y,
            .mode = if (old_crtc.mode_valid != 0) old_crtc.mode else null,
        };
        drm.drmModeFreeCrtc(old_crtc);

        // Atomic support is optional. Enabling the cap also exposes universal
        // primary/cursor planes; a missing primary plane leaves legacy modeset.
        if (options.prefer_atomic) {
            _ = drm.drmSetClientCap(fd, drm_client_cap_universal_planes, 1);
            _ = drm.drmSetClientCap(fd, drm_client_cap_atomic, 1);
        }
        const gbm = library.gbm_functions.gbm_create_device(fd) orelse return error.Unavailable;
        errdefer library.gbm_functions.gbm_device_destroy(gbm);
        var device: Device = .{
            .allocator = allocator,
            .library = library,
            .fd = fd,
            .drm_device = gbm,
            .connector_id = connector.connector_id,
            .crtc_id = selected_crtc,
            .crtc_index = selected_crtc_index,
            .mode = chosen_mode.?,
            .original = original,
        };
        if (options.prefer_atomic) {
            device.primary_plane_id = find_primary_plane(fd, drm, selected_crtc_index);
            if (device.primary_plane_id != null) device.atomic = find_atomic_properties(fd, drm, connector.connector_id, selected_crtc, selected_crtc_index);
        }
        device.vt = vt_switch.Session.open();
        return device;
    }

    /// Chosen output mode.
    pub fn selected_mode(self: *const Device) Mode {
        return public_mode(self.mode);
    }

    /// Width and height of the active scanout mode.
    pub fn size(self: *const Device) struct { width: u16, height: u16 } {
        return .{ .width = self.mode.hdisplay, .height = self.mode.vdisplay };
    }

    /// Renders `view` into a mapped GBM scanout buffer and presents it. The
    /// first frame modesets; later frames use atomic FB_ID commits when the
    /// driver exposes the needed properties, then fall back to legacy flips.
    pub fn present(self: *Device, view: surface.View) Error!void {
        if (!self.has_master) return error.MasterUnavailable;
        if (view.width != self.mode.hdisplay or view.height != self.mode.vdisplay) return error.InvalidSize;
        const gbm = &self.library.gbm_functions;
        const bo = gbm.gbm_bo_create(self.drm_device, self.mode.hdisplay, self.mode.vdisplay, drm_format_xrgb8888, gbm_bo_use_scanout | gbm_bo_use_write | gbm_bo_use_linear) orelse return error.DeviceFailure;
        self.write_scanout_pixels(bo, view) catch |err| {
            gbm.gbm_bo_destroy(bo);
            return err;
        };
        const fb_id = self.add_framebuffer(bo, self.mode.hdisplay, self.mode.vdisplay) catch |err| {
            gbm.gbm_bo_destroy(bo);
            return err;
        };
        return self.present_scanout(.{ .bo = bo, .fb_id = fb_id }, null);
    }

    /// Creates or replaces the hardware cursor (maximum 64×64). Source pixels
    /// are converted to ARGB8888 in a GBM cursor buffer and installed by DRM.
    pub fn set_cursor(self: *Device, view: surface.View, hotspot_x: i32, hotspot_y: i32) Error!void {
        if (!self.has_master) return error.MasterUnavailable;
        if (view.width == 0 or view.height == 0 or view.width > 64 or view.height > 64) return error.UnsupportedCursor;
        const gbm = &self.library.gbm_functions;
        const bo = gbm.gbm_bo_create(self.drm_device, view.width, view.height, drm_format_argb8888, gbm_bo_use_cursor | gbm_bo_use_write) orelse return error.UnsupportedCursor;
        errdefer gbm.gbm_bo_destroy(bo);
        var stride: u32 = 0;
        var map_data: ?*anyopaque = null;
        const mapped = gbm.gbm_bo_map(bo, 0, 0, view.width, view.height, gbm_bo_transfer_write, &stride, &map_data) orelse return error.BufferMappingFailed;
        var map_active = true;
        errdefer if (map_active) gbm.gbm_bo_unmap(bo, map_data);
        const bytes: [*]u8 = @ptrCast(mapped);
        for (0..view.height) |y| {
            for (0..view.width) |x| {
                const color = try view.read(x, y);
                const offset = y * stride + x * 4;
                bytes[offset + 0] = color.b;
                bytes[offset + 1] = color.g;
                bytes[offset + 2] = color.r;
                bytes[offset + 3] = color.a;
            }
        }
        gbm.gbm_bo_unmap(bo, map_data);
        map_active = false;
        map_data = null;
        const handle = gbm.gbm_bo_get_handle(bo).u32;
        if (self.library.drm_functions.drmModeSetCursor2(self.fd, self.crtc_id, handle, view.width, view.height, hotspot_x, hotspot_y) != 0) return error.UnsupportedCursor;
        if (self.cursor) |old| gbm.gbm_bo_destroy(old);
        self.cursor = bo;
    }

    /// Moves the currently installed hardware cursor in framebuffer pixels.
    pub fn move_cursor(self: *Device, x: i32, y: i32) Error!void {
        if (!self.has_master) return error.MasterUnavailable;
        if (self.cursor == null) return error.UnsupportedCursor;
        if (self.library.drm_functions.drmModeMoveCursor(self.fd, self.crtc_id, x, y) != 0) return error.DeviceFailure;
    }

    /// Removes the hardware cursor from the CRTC.
    pub fn hide_cursor(self: *Device) void {
        if (self.has_master) _ = self.library.drm_functions.drmModeSetCursor2(self.fd, self.crtc_id, 0, 0, 0, 0, 0);
        if (self.cursor) |bo| self.library.gbm_functions.gbm_bo_destroy(bo);
        self.cursor = null;
    }

    /// Polls for an optional VT release/acquire notification.
    pub fn poll_vt(self: *Device) ?vt_switch.Event {
        const session = if (self.vt) |*value| value else return null;
        return session.poll();
    }

    /// Descriptor to add to the platform poll set, or null without a console VT.
    pub fn vt_poll_fd(self: *const Device) ?std.posix.fd_t {
        const session = self.vt orelse return null;
        return session.event_fd;
    }

    /// Drops scanout/cursor state and DRM master before acknowledging VT release.
    pub fn release_vt(self: *Device) Error!void {
        if (!self.has_master) return;
        // The CRTC must not be restored under an accepted flip that could still
        // complete onto it.
        try self.finish_pending_flip();
        self.hide_cursor();
        if (self.current != null) try self.restore_crtc();
        if (self.library.drm_functions.drmDropMaster(self.fd) != 0) return error.DeviceFailure;
        self.has_master = false;
        self.atomic_enabled = false;
        self.vt_generation +%= 1;
    }

    /// Reclaims DRM master and restores the selected mode on the current buffer.
    pub fn acquire_vt(self: *Device) Error!void {
        if (self.has_master) return;
        if (self.library.drm_functions.drmSetMaster(self.fd) != 0) return error.MasterUnavailable;
        self.has_master = true;
        if (self.current) |scanout| self.initial_modeset(scanout) catch {
            _ = self.library.drm_functions.drmDropMaster(self.fd);
            self.has_master = false;
            return error.DeviceFailure;
        };
        self.vt_generation +%= 1;
    }

    /// Completes the kernel VT handshake after `release_vt` or `acquire_vt`.
    pub fn acknowledge_vt(self: *Device, transition: vt_switch.Event) Error!void {
        const session = if (self.vt) |*value| value else return;
        try session.acknowledge(transition);
    }

    /// The GBM device pointer required as EGL's `EGL_PLATFORM_GBM_MESA` native
    /// display. It is borrowed and valid until `deinit`.
    pub fn egl_native_display(self: *const Device) *anyopaque {
        return self.drm_device;
    }

    /// Native platform value for `egl.Display.open`.
    pub fn egl_platform(self: *const Device) egl_display.Platform {
        return .{ .gbm = self.drm_device };
    }

    /// Restores the saved CRTC, removes scanout and cursor buffers, drops DRM
    /// master, destroys GBM, unloads both libraries and closes the card fd.
    pub fn deinit(self: *Device) void {
        self.hide_cursor();
        // An accepted flip is settled before its buffers are touched. If it
        // cannot be observed, the kernel may still scan them out, so those
        // buffers are leaked rather than released. Closing the fd below stops
        // event delivery, so the completion record itself is freed.
        const flip_settled = if (self.finish_pending_flip()) |_| true else |_| false;
        if (self.current) |current| {
            if (self.has_master) self.restore_crtc() catch {};
            if (flip_settled) self.release_scanout(current, self.current_gbm_surface);
            self.current = null;
            self.current_gbm_surface = null;
        }
        if (self.pending_flip) |pending| {
            self.allocator.destroy(pending);
            self.pending_flip = null;
        }
        self.library.gbm_functions.gbm_device_destroy(self.drm_device);
        if (self.has_master) _ = self.library.drm_functions.drmDropMaster(self.fd);
        if (self.vt) |*session| session.deinit();
        _ = std.c.close(self.fd);
        self.library.deinit();
        self.* = undefined;
    }

    fn initial_modeset(self: *Device, scanout: Scanout) Error!void {
        if (self.atomic) |properties| {
            if (self.atomic_modeset(properties, scanout.fb_id)) {
                self.atomic_enabled = true;
                return;
            }
        }
        const connector_ids = [_]u32{self.connector_id};
        if (self.library.drm_functions.drmModeSetCrtc(self.fd, self.crtc_id, scanout.fb_id, 0, 0, &connector_ids, 1, &self.mode) != 0) return error.DeviceFailure;
    }

    /// Presents `next`, taking ownership of its framebuffer and buffer. Before
    /// the kernel accepts a flip, any failure releases them. After acceptance
    /// the buffers belong to `pending_flip` until completion, so a failed wait
    /// returns the error with them still retained.
    fn present_scanout(self: *Device, next: Scanout, gbm_surface: ?*binding.OpaqueGbmSurface) Error!void {
        var owned = true;
        errdefer if (owned) self.release_scanout(next, gbm_surface);

        // One flip may be in flight at a time, and `current` must be settled
        // before it is replaced.
        try self.finish_pending_flip();
        if (self.current == null) {
            self.initial_modeset(next) catch return error.DeviceFailure;
            self.current = next;
            self.current_gbm_surface = gbm_surface;
            return;
        }

        const pending = try self.allocator.create(PendingFlip);
        pending.* = .{ .next = next, .gbm_surface = gbm_surface };
        self.submit_flip(pending) catch |err| {
            // Not accepted: the kernel holds no reference to `pending`.
            self.allocator.destroy(pending);
            return err;
        };
        owned = false;
        self.pending_flip = pending;
        try self.finish_pending_flip();
    }

    /// Queues a page flip whose completion event will set `pending.completed`.
    /// The kernel keeps `pending` as user data until the event is handled.
    fn submit_flip(self: *Device, pending: *PendingFlip) Error!void {
        if (self.atomic_enabled) {
            if (self.atomic_page_flip(pending.next.fb_id, pending)) return;
            self.atomic_enabled = false;
        }
        if (self.library.drm_functions.drmModePageFlip(self.fd, self.crtc_id, pending.next.fb_id, drm_mode_page_flip_event, pending) != 0) return error.DeviceFailure;
    }

    /// Waits until the pending flip completes, then makes it the current
    /// scanout and releases the buffer it replaced. A failed wait leaves the
    /// flip pending, so the next call continues waiting for it.
    fn finish_pending_flip(self: *Device) Error!void {
        const pending = self.pending_flip orelse return;
        var context: binding.EventContext = .{ .version = 2, .vblank_handler = null, .page_flip_handler = on_page_flip, .page_flip_handler2 = null, .sequence_handler = null };
        while (!pending.completed) {
            var pollfd = [1]std.posix.pollfd{.{ .fd = self.fd, .events = std.posix.POLL.IN, .revents = 0 }};
            _ = std.posix.poll(&pollfd, -1) catch return error.PollFailed;
            if (self.library.drm_functions.drmHandleEvent(self.fd, &context) != 0) return error.DeviceFailure;
        }
        self.pending_flip = null;
        if (self.current) |old| self.release_scanout(old, self.current_gbm_surface);
        self.current = pending.next;
        self.current_gbm_surface = pending.gbm_surface;
        self.allocator.destroy(pending);
    }

    /// Removes a framebuffer and returns its buffer to GBM (or its surface).
    fn release_scanout(self: *Device, scanout: Scanout, gbm_surface: ?*binding.OpaqueGbmSurface) void {
        _ = self.library.drm_functions.drmModeRmFB(self.fd, scanout.fb_id);
        if (gbm_surface) |surface_handle| {
            self.library.gbm_functions.gbm_surface_release_buffer(surface_handle, scanout.bo);
        } else {
            self.library.gbm_functions.gbm_bo_destroy(scanout.bo);
        }
    }

    /// Registers a scanout-format buffer as a framebuffer object.
    fn add_framebuffer(self: *Device, bo: *binding.OpaqueGbmBo, width: u32, height: u32) Error!u32 {
        const gbm = &self.library.gbm_functions;
        const handles = [4]u32{ gbm.gbm_bo_get_handle(bo).u32, 0, 0, 0 };
        const pitches = [4]u32{ gbm.gbm_bo_get_stride(bo), 0, 0, 0 };
        const offsets = [4]u32{ 0, 0, 0, 0 };
        var fb_id: u32 = 0;
        if (self.library.drm_functions.drmModeAddFB2(self.fd, width, height, drm_format_xrgb8888, &handles, &pitches, &offsets, &fb_id, 0) != 0) return error.DeviceFailure;
        return fb_id;
    }

    /// Converts `view` into the mapped XRGB8888 scanout buffer `bo`.
    fn write_scanout_pixels(self: *Device, bo: *binding.OpaqueGbmBo, view: surface.View) Error!void {
        const gbm = &self.library.gbm_functions;
        var stride: u32 = 0;
        var map_data: ?*anyopaque = null;
        const mapped = gbm.gbm_bo_map(bo, 0, 0, self.mode.hdisplay, self.mode.vdisplay, gbm_bo_transfer_write, &stride, &map_data) orelse return error.BufferMappingFailed;
        defer gbm.gbm_bo_unmap(bo, map_data);
        if (stride < @as(u32, self.mode.hdisplay) * 4) return error.BufferMappingFailed;
        const bytes: [*]u8 = @ptrCast(mapped);
        for (0..self.mode.vdisplay) |y| {
            const row = bytes[y * stride ..][0 .. @as(usize, self.mode.hdisplay) * 4];
            for (0..self.mode.hdisplay) |x| {
                const color = try view.read(x, y);
                row[x * 4 + 0] = color.b;
                row[x * 4 + 1] = color.g;
                row[x * 4 + 2] = color.r;
                row[x * 4 + 3] = 0;
            }
        }
    }

    fn atomic_modeset(self: *Device, properties: AtomicProperties, fb_id: u32) bool {
        const drm = &self.library.drm_functions;
        var blob_id: u32 = 0;
        if (drm.drmModeCreatePropertyBlob(self.fd, &self.mode, @sizeOf(binding.ModeInfo), &blob_id) != 0) return false;
        defer _ = drm.drmModeDestroyPropertyBlob(self.fd, blob_id);
        const request = drm.drmModeAtomicAlloc() orelse return false;
        defer drm.drmModeAtomicFree(request);
        const width: u64 = self.mode.hdisplay;
        const height: u64 = self.mode.vdisplay;
        const updates = [_]struct { object: u32, property: u32, value: u64 }{
            .{ .object = self.connector_id, .property = properties.connector_crtc_id, .value = self.crtc_id },
            .{ .object = self.crtc_id, .property = properties.crtc_mode_id, .value = blob_id },
            .{ .object = self.crtc_id, .property = properties.crtc_active, .value = 1 },
            .{ .object = self.primary_plane_id orelse return false, .property = properties.plane_fb_id, .value = fb_id },
            .{ .object = self.primary_plane_id.?, .property = properties.plane_crtc_id, .value = self.crtc_id },
            .{ .object = self.primary_plane_id.?, .property = properties.plane_src_x, .value = 0 },
            .{ .object = self.primary_plane_id.?, .property = properties.plane_src_y, .value = 0 },
            .{ .object = self.primary_plane_id.?, .property = properties.plane_src_w, .value = width << 16 },
            .{ .object = self.primary_plane_id.?, .property = properties.plane_src_h, .value = height << 16 },
            .{ .object = self.primary_plane_id.?, .property = properties.plane_crtc_x, .value = 0 },
            .{ .object = self.primary_plane_id.?, .property = properties.plane_crtc_y, .value = 0 },
            .{ .object = self.primary_plane_id.?, .property = properties.plane_crtc_w, .value = width },
            .{ .object = self.primary_plane_id.?, .property = properties.plane_crtc_h, .value = height },
        };
        for (updates) |update| if (drm.drmModeAtomicAddProperty(request, update.object, update.property, update.value) < 0) return false;
        return drm.drmModeAtomicCommit(self.fd, request, drm_mode_atomic_allow_modeset, null) == 0;
    }

    fn atomic_page_flip(self: *Device, fb_id: u32, pending: *PendingFlip) bool {
        const properties = self.atomic orelse return false;
        const plane_id = self.primary_plane_id orelse return false;
        const drm = &self.library.drm_functions;
        const request = drm.drmModeAtomicAlloc() orelse return false;
        defer drm.drmModeAtomicFree(request);
        if (drm.drmModeAtomicAddProperty(request, plane_id, properties.plane_fb_id, fb_id) < 0) return false;
        return drm.drmModeAtomicCommit(self.fd, request, drm_mode_atomic_nonblock | drm_mode_page_flip_event, pending) == 0;
    }

    /// Restores the CRTC's original mode and buffer, connected to the connector
    /// that was attached to it. `crtc_routed_to_other_output` guarantees that
    /// no other connected output was routed to this CRTC, so this single
    /// connector is the only routing that changes.
    fn restore_crtc(self: *Device) Error!void {
        const connector_ids = [_]u32{self.connector_id};
        if (self.original.mode) |*mode| {
            if (self.library.drm_functions.drmModeSetCrtc(self.fd, self.crtc_id, self.original.buffer_id, self.original.x, self.original.y, &connector_ids, 1, mode) != 0) return error.DeviceFailure;
        } else {
            if (self.library.drm_functions.drmModeSetCrtc(self.fd, self.crtc_id, 0, 0, 0, &connector_ids, 0, null) != 0) return error.DeviceFailure;
        }
    }
};

/// GBM window surface for EGL. The returned native handle borrows both Device
/// and surface; destroy the EGLSurface before calling `deinit`.
pub const GbmWindow = struct {
    device: *Device,
    native: *binding.OpaqueGbmSurface,
    width: u32,
    height: u32,
    vt_generation: u64,

    pub fn create(device: *Device, width: u32, height: u32) Error!GbmWindow {
        if (width == 0 or height == 0) return error.InvalidSize;
        const native = device.library.gbm_functions.gbm_surface_create(device.drm_device, width, height, drm_format_xrgb8888, gbm_bo_use_scanout | 4) orelse return error.DeviceFailure;
        return .{ .device = device, .native = native, .width = width, .height = height, .vt_generation = device.vt_generation };
    }

    pub fn egl_native_window(self: *const GbmWindow) *anyopaque {
        return self.native;
    }

    /// Presents an EGL swap by locking GBM's completed front buffer and queuing
    /// its framebuffer through the same atomic/page-flip path as software frames.
    pub fn present(self: *GbmWindow) Error!void {
        if (!self.device.has_master or self.vt_generation != self.device.vt_generation) return error.MasterUnavailable;
        const gbm = &self.device.library.gbm_functions;
        const bo = gbm.gbm_surface_lock_front_buffer(self.native) orelse return error.DeviceFailure;
        const fb_id = self.device.add_framebuffer(bo, self.width, self.height) catch |err| {
            gbm.gbm_surface_release_buffer(self.native, bo);
            return err;
        };
        return self.device.present_scanout(.{ .bo = bo, .fb_id = fb_id }, self.native);
    }

    pub fn deinit(self: *GbmWindow) void {
        const device = self.device;
        // A pending flip may own a buffer of this surface, so it is settled
        // first. If it cannot be settled, the surface stays alive because the
        // kernel may still scan out from it.
        if (device.finish_pending_flip()) |_| {
            // A currently scanned-out buffer must first be replaced by the saved
            // desktop state. Device.deinit owns that restore; keep GBM storage alive.
            if (device.current) |current| if (device.current_gbm_surface == self.native) {
                if (device.has_master) device.restore_crtc() catch {};
                device.release_scanout(current, self.native);
                device.current = null;
                device.current_gbm_surface = null;
            };
            device.library.gbm_functions.gbm_surface_destroy(self.native);
        } else |_| {}
        self.* = undefined;
    }
};

fn choose_mode(modes: []const binding.ModeInfo, options: Options) ?binding.ModeInfo {
    if (options.width) |width| if (options.height) |height| {
        for (modes) |mode| if (mode.hdisplay == width and mode.vdisplay == height) return mode;
        return null;
    };
    for (modes) |mode| if (mode.kind & drm_mode_type_preferred != 0) return mode;
    return if (modes.len == 0) null else modes[0];
}

fn public_mode(mode: binding.ModeInfo) Mode {
    const denominator: u64 = @as(u64, mode.htotal) * mode.vtotal;
    var numerator: u64 = @as(u64, mode.clock) * 1_000_000;
    var adjusted_denominator = denominator;
    if ((mode.flags & (1 << 4)) != 0) numerator *= 2; // interlace
    if ((mode.flags & (1 << 5)) != 0) adjusted_denominator *= 2; // doublescan
    if (mode.vscan > 1) adjusted_denominator *= mode.vscan;
    const refresh: u32 = if (adjusted_denominator == 0)
        @intCast(@min(@as(u64, mode.vrefresh) * 1000, std.math.maxInt(u32)))
    else
        @intCast(@min(numerator / adjusted_denominator, std.math.maxInt(u32)));
    return .{ .width = mode.hdisplay, .height = mode.vdisplay, .refresh_millihz = refresh };
}

fn on_page_flip(_: c_int, _: u32, _: u32, _: u32, user_data: ?*anyopaque) callconv(.c) void {
    const pending: *PendingFlip = @ptrCast(@alignCast(user_data.?));
    pending.completed = true;
}

/// Index of the CRTC for an encoder. The encoder's current CRTC wins so that
/// existing routing is kept. Otherwise the first compatible CRTC not marked
/// `busy` is used; a busy CRTC drives another connected output.
fn pick_crtc_index(crtc_ids: []const u32, current_crtc: u32, possible_crtcs: u32, busy: []const bool) ?usize {
    if (current_crtc != 0) {
        for (crtc_ids, 0..) |crtc_id, index| {
            if (crtc_id == current_crtc) return index;
        }
    }
    for (crtc_ids, busy, 0..) |_, is_busy, index| {
        if (index >= max_crtc_index) break;
        if (possible_crtcs & (@as(u32, 1) << @intCast(index)) == 0 or is_busy) continue;
        return index;
    }
    return null;
}

/// True when a connected connector other than `own_connector_id` is currently
/// routed to `crtc_id`. Taking such a CRTC would displace that output.
fn crtc_routed_to_other_output(fd: c_int, drm: *const binding.DrmFunctions, resources: *const binding.Resources, crtc_id: u32, own_connector_id: u32) bool {
    const connector_ids = resources.connectors orelse return true;
    for (0..@intCast(resources.count_connectors)) |index| {
        const connector_id = connector_ids[index];
        if (connector_id == own_connector_id) continue;
        const connector = drm.drmModeGetConnector(fd, connector_id) orelse continue;
        defer drm.drmModeFreeConnector(connector);
        if (connector.connection != drm_mode_connected or connector.encoder_id == 0) continue;
        const encoder = drm.drmModeGetEncoder(fd, connector.encoder_id) orelse continue;
        defer drm.drmModeFreeEncoder(encoder);
        if (encoder.crtc_id == crtc_id) return true;
    }
    return false;
}

test "CRTC choice prefers the encoder's current CRTC" {
    const crtcs = [_]u32{ 10, 11 };
    const none = [_]bool{ false, false };
    // Both CRTCs are compatible; the current one is index 1, not the first.
    try std.testing.expectEqual(@as(?usize, 1), pick_crtc_index(&crtcs, 11, 0b11, &none));
    // Without a current CRTC, the first compatible CRTC is used.
    try std.testing.expectEqual(@as(?usize, 0), pick_crtc_index(&crtcs, 0, 0b11, &none));
    // A CRTC driving another output is never taken as a fallback.
    try std.testing.expectEqual(@as(?usize, 1), pick_crtc_index(&crtcs, 0, 0b11, &[_]bool{ true, false }));
    // Incompatible CRTCs are skipped, and no usable one yields null.
    try std.testing.expectEqual(@as(?usize, 1), pick_crtc_index(&crtcs, 0, 0b10, &none));
    try std.testing.expectEqual(@as(?usize, null), pick_crtc_index(&crtcs, 0, 0b01, &[_]bool{ true, false }));
}

fn find_atomic_properties(fd: c_int, drm: *const binding.DrmFunctions, connector_id: u32, crtc_id: u32, crtc_index: u5) ?AtomicProperties {
    const plane_id = find_primary_plane(fd, drm, crtc_index) orelse return null;
    const connector_crtc_id = property_id(fd, drm, connector_id, drm_mode_object_connector, "CRTC_ID") orelse return null;
    const crtc_mode_id = property_id(fd, drm, crtc_id, drm_mode_object_crtc, "MODE_ID") orelse return null;
    const crtc_active = property_id(fd, drm, crtc_id, drm_mode_object_crtc, "ACTIVE") orelse return null;
    return .{
        .connector_crtc_id = connector_crtc_id,
        .crtc_mode_id = crtc_mode_id,
        .crtc_active = crtc_active,
        .plane_fb_id = property_id(fd, drm, plane_id, drm_mode_object_plane, "FB_ID") orelse return null,
        .plane_crtc_id = property_id(fd, drm, plane_id, drm_mode_object_plane, "CRTC_ID") orelse return null,
        .plane_src_x = property_id(fd, drm, plane_id, drm_mode_object_plane, "SRC_X") orelse return null,
        .plane_src_y = property_id(fd, drm, plane_id, drm_mode_object_plane, "SRC_Y") orelse return null,
        .plane_src_w = property_id(fd, drm, plane_id, drm_mode_object_plane, "SRC_W") orelse return null,
        .plane_src_h = property_id(fd, drm, plane_id, drm_mode_object_plane, "SRC_H") orelse return null,
        .plane_crtc_x = property_id(fd, drm, plane_id, drm_mode_object_plane, "CRTC_X") orelse return null,
        .plane_crtc_y = property_id(fd, drm, plane_id, drm_mode_object_plane, "CRTC_Y") orelse return null,
        .plane_crtc_w = property_id(fd, drm, plane_id, drm_mode_object_plane, "CRTC_W") orelse return null,
        .plane_crtc_h = property_id(fd, drm, plane_id, drm_mode_object_plane, "CRTC_H") orelse return null,
    };
}

fn find_primary_plane(fd: c_int, drm: *const binding.DrmFunctions, crtc_index: u5) ?u32 {
    const resources = drm.drmModeGetPlaneResources(fd) orelse return null;
    defer drm.drmModeFreePlaneResources(resources);
    const ids = resources.planes orelse return null;
    for (0..resources.count_planes) |i| {
        const plane = drm.drmModeGetPlane(fd, ids[i]) orelse continue;
        defer drm.drmModeFreePlane(plane);
        if (plane.possible_crtcs & (@as(u32, 1) << crtc_index) == 0) continue;
        const props = drm.drmModeObjectGetProperties(fd, plane.plane_id, drm_mode_object_plane) orelse continue;
        defer drm.drmModeFreeObjectProperties(props);
        const prop_ids = props.props orelse continue;
        const values = props.prop_values orelse continue;
        for (0..props.count_props) |j| {
            const property = drm.drmModeGetProperty(fd, prop_ids[j]) orelse continue;
            defer drm.drmModeFreeProperty(property);
            if (std.mem.eql(u8, std.mem.sliceTo(&property.name, 0), "type") and values[j] == 1) return plane.plane_id;
        }
    }
    return null;
}

fn property_id(fd: c_int, drm: *const binding.DrmFunctions, object_id: u32, object_type: u32, wanted: []const u8) ?u32 {
    const props = drm.drmModeObjectGetProperties(fd, object_id, object_type) orelse return null;
    defer drm.drmModeFreeObjectProperties(props);
    const ids = props.props orelse return null;
    for (0..props.count_props) |i| {
        const property = drm.drmModeGetProperty(fd, ids[i]) orelse continue;
        defer drm.drmModeFreeProperty(property);
        if (std.mem.eql(u8, std.mem.sliceTo(&property.name, 0), wanted)) return property.prop_id;
    }
    return null;
}

test "DRM mode rate calculation retains millihertz precision" {
    const mode: binding.ModeInfo = .{
        .clock = 148_500,
        .hdisplay = 1920,
        .hsync_start = 2008,
        .hsync_end = 2052,
        .htotal = 2200,
        .hskew = 0,
        .vdisplay = 1080,
        .vsync_start = 1084,
        .vsync_end = 1089,
        .vtotal = 1125,
        .vscan = 0,
        .vrefresh = 60,
        .flags = 0,
        .kind = 0,
        .name = @splat(0),
    };
    try std.testing.expectEqual(@as(u32, 60_000), public_mode(mode).refresh_millihz);
}
