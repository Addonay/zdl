//! Linux Video4Linux2 capture backend: /dev discovery, format and mode
//! enumeration, and mmap-streaming capture sessions. No libc, no udev, no thread.
//! Altered native port of SDL's v4l2 camera driver (SDL_camera_v4l2.c).
//!
//! Kernel records are not declared as C-layout structs. Each ioctl argument is a
//! byte array encoded and decoded at documented offsets from linux/videodev2.h,
//! using the x86_64/LP64 layouts (`struct timeval` is two 64-bit fields,
//! `unsigned long` is 64 bits, and `struct v4l2_format` and `v4l2_streamparm`
//! are 208 bytes). The ioctl numbers are computed from those sizes and checked
//! at comptime against the well-known kernel values.
//!
//! Ownership: a `Registry` owns the discovered `Entry` values. A `Session` owns
//! its descriptor, mapped buffers and held-frame state, and does not refer to the
//! registry, so rescanning never invalidates an open session. Frames borrow the
//! session's mapped memory until released.
//!
//! Deliberate differences from SDL:
//! - Only mmap streaming is implemented. READ and USERPTR I/O are unported, and
//!   devices without streaming are rejected with `NoStreamingIo`. SDL's READ
//!   and USERPTR buffer sizing also read the unset `device->spec` (zero), a
//!   confirmed upstream defect that these paths would have inherited.
//! - The driver's answer to S_FMT is checked (pixel format and size), and
//!   mismatches are `FormatRejected`. SDL only reads the pitch back.
//! - Frame ioctl and poll failures map to typed errors. ENODEV/ENXIO/poll
//!   hangup mean `DeviceLost`, which is the caller's cue to close and rescan.
//!   There is no zombie frame substitution.
//! - Zero step values in stepwise size and interval ranges enumerate one value,
//!   instead of looping forever as SDL does.
//! - Only `/dev/videoN` nodes are scanned, without udev. Hotplug is handled by
//!   calling `Registry.rescan` again.
//! - Entry names come from the device's driver card string, matching SDL.
const std = @import("std");
const linux = std.os.linux;
const camera = @import("camera.zig");

pub const Error = camera.Error || error{
    /// The path could not be opened.
    OpenFailed,
    /// The opened node is not a character device.
    NotCharacterDevice,
    /// The node does not answer VIDIOC_QUERYCAP as a V4L2 device.
    NotV4l2Device,
    /// The device is not a video capture device.
    NotCaptureDevice,
    /// The device has no mmap streaming I/O, which is the only supported I/O.
    NoStreamingIo,
    /// The device rejected the requested pixel format or size, or returned a
    /// different one.
    FormatRejected,
    /// The device rejected the requested frame interval.
    FrameRateRejected,
    /// The driver could not allocate or describe the mmap buffers.
    BufferSetupFailed,
    /// mmap of a driver buffer failed.
    MapFailed,
    /// Queueing a buffer to the driver failed.
    QueueFailed,
    /// STREAMON failed.
    StreamFailed,
    /// Dequeueing a frame failed for a reason other than EAGAIN.
    DequeueFailed,
    /// The driver returned an out-of-range or already-held buffer index, or a
    /// released frame does not belong to this session.
    BadBufferIndex,
    /// Waiting for the device failed.
    PollFailed,
    /// The device disappeared, or reported an error or hangup condition.
    DeviceLost,
    /// The session is not streaming.
    NotStreaming,
    /// The frame was already released.
    FrameNotHeld,
    /// The driver pixel format has no V4L2 fourcc mapping.
    UnsupportedFormat,
    /// The device path or directory name does not fit the path buffer.
    NameTooLong,
    /// The /dev directory could not be read.
    DirectoryFailed,
};

pub const AllocError = std.mem.Allocator.Error;

/// Maximum path length handled without allocation.
const max_path = 4096;

// ---------------------------------------------------------------------------
// Ioctl numbers (linux/ioctl.h): dir in bits 30-31, size in 16-29, type in 8-15,
// number in 0-7. The type byte is 'V' for V4L2.

const ioc_write: u32 = 1;
const ioc_read: u32 = 2;

fn ioc(dir: u32, nr: u32, size: u32) u32 {
    return (dir << 30) | (size << 16) | (@as(u32, 'V') << 8) | nr;
}
fn ior(nr: u32, size: u32) u32 {
    return ioc(ioc_read, nr, size);
}
fn iow(nr: u32, size: u32) u32 {
    return ioc(ioc_write, nr, size);
}
fn iowr(nr: u32, size: u32) u32 {
    return ioc(ioc_read | ioc_write, nr, size);
}

const VIDIOC_QUERYCAP = ior(0, 104);
const VIDIOC_ENUM_FMT = iowr(2, 64);
const VIDIOC_G_FMT = iowr(4, 208);
const VIDIOC_S_FMT = iowr(5, 208);
const VIDIOC_REQBUFS = iowr(8, 20);
const VIDIOC_QUERYBUF = iowr(9, 88);
const VIDIOC_QBUF = iowr(15, 88);
const VIDIOC_DQBUF = iowr(17, 88);
const VIDIOC_STREAMON = iow(18, 4);
const VIDIOC_STREAMOFF = iow(19, 4);
const VIDIOC_G_PARM = iowr(21, 204);
const VIDIOC_S_PARM = iowr(22, 204);
const VIDIOC_CROPCAP = iowr(58, 44);
const VIDIOC_S_CROP = iow(60, 20);
const VIDIOC_ENUM_FRAMESIZES = iowr(74, 44);
const VIDIOC_ENUM_FRAMEINTERVALS = iowr(75, 52);

// Values checked against the kernel's published request numbers.
comptime {
    std.debug.assert(VIDIOC_QUERYCAP == 0x80685600);
    std.debug.assert(VIDIOC_G_FMT == 0xc0d05604);
    std.debug.assert(VIDIOC_QUERYBUF == 0xc0585609);
    std.debug.assert(VIDIOC_QBUF == 0xc058560f);
    std.debug.assert(VIDIOC_DQBUF == 0xc0585611);
    std.debug.assert(VIDIOC_STREAMON == 0x40045612);
    std.debug.assert(VIDIOC_STREAMOFF == 0x40045613);
}

// Constants from linux/videodev2.h.
const CAP_VIDEO_CAPTURE: u32 = 0x00000001;
const CAP_READWRITE: u32 = 0x01000000;
const CAP_STREAMING: u32 = 0x04000000;
const CAP_DEVICE_CAPS: u32 = 0x80000000;
const BUF_TYPE_VIDEO_CAPTURE: u32 = 1;
const MEMORY_MMAP: u32 = 1;
const FIELD_ANY: u32 = 0;
const FRMSIZE_TYPE_DISCRETE: u32 = 1;
const FRMSIZE_TYPE_CONTINUOUS: u32 = 2;
const FRMSIZE_TYPE_STEPWISE: u32 = 3;
const FRMIVAL_TYPE_DISCRETE: u32 = 1;
const FRMIVAL_TYPE_CONTINUOUS: u32 = 2;
const FRMIVAL_TYPE_STEPWISE: u32 = 3;

fn fourcc(a: u8, b: u8, c: u8, d: u8) u32 {
    return @as(u32, a) | (@as(u32, b) << 8) | (@as(u32, c) << 16) | (@as(u32, d) << 24);
}
const PIX_FMT_YUYV = fourcc('Y', 'U', 'Y', 'V');
const PIX_FMT_MJPEG = fourcc('M', 'J', 'P', 'G');
const PIX_FMT_RGBX32 = fourcc('X', 'B', '2', '4');

// Field offsets. Each comment names the header struct and member.
// struct v4l2_capability (104 bytes)
const cap_card = 16; // card[32]
const cap_bus_info = 48; // bus_info[32]
const cap_capabilities = 84;
const cap_device_caps = 88;

// struct v4l2_fmtdesc (64 bytes)
const fmtdesc_index = 0;
const fmtdesc_type = 4;
const fmtdesc_pixelformat = 44;

// struct v4l2_frmsizeenum (44 bytes); the union starts at 12.
const frmsize_index = 0;
const frmsize_pixel_format = 4;
const frmsize_type = 8;
const frmsize_discrete_width = 12;
const frmsize_discrete_height = 16;
const frmsize_stepwise_min_width = 12;
const frmsize_stepwise_max_width = 16;
const frmsize_stepwise_step_width = 20;
const frmsize_stepwise_min_height = 24;
const frmsize_stepwise_max_height = 28;
const frmsize_stepwise_step_height = 32;

// struct v4l2_frmivalenum (52 bytes); the union starts at 20.
const frmival_index = 0;
const frmival_pixel_format = 4;
const frmival_width = 8;
const frmival_height = 12;
const frmival_type = 16;
const frmival_discrete_num = 20;
const frmival_discrete_den = 24;
const frmival_min_num = 20;
const frmival_min_den = 24;
const frmival_max_num = 28;
const frmival_max_den = 32;
const frmival_step_num = 36;
const frmival_step_den = 40;

// struct v4l2_format (208 bytes). The union begins at 8 because v4l2_window
// contains a pointer. struct v4l2_pix_format occupies that union from offset 8.
const format_size = 208;
const format_type = 0;
const pix_width = 8;
const pix_height = 12;
const pix_pixelformat = 16;
const pix_field = 20;
const pix_bytesperline = 24;
const pix_sizeimage = 28;

// struct v4l2_streamparm (204 bytes: u32 type + 200-byte union). The union begins at 4.
// struct v4l2_captureparm.timeperframe begins at union offset 8.
const parm_size = 204;
const parm_type = 0;
const parm_timeperframe_num = 12;
const parm_timeperframe_den = 16;

// struct v4l2_requestbuffers (20 bytes)
const reqbufs_count = 0;
const reqbufs_type = 4;
const reqbufs_memory = 8;

// struct v4l2_buffer (88 bytes)
const buf_index = 0;
const buf_type = 4;
const buf_bytesused = 8;
const buf_timestamp_sec = 24; // struct timeval tv_sec, 64-bit
const buf_timestamp_usec = 32; // struct timeval tv_usec, 64-bit
const buf_memory = 60;
const buf_m_offset = 64; // union m: __u32 offset
const buf_length = 72;

// struct v4l2_cropcap (44 bytes) and struct v4l2_crop (20 bytes)
const cropcap_defrect = 20; // v4l2_rect defrect, 16 bytes
const crop_c = 4; // v4l2_rect c, 16 bytes

const max_buffers = 32;
const buf_size: usize = 88;

fn get_u32(bytes: []const u8, offset: usize) u32 {
    return std.mem.readInt(u32, bytes[offset..][0..4], .little);
}

fn put_u32(bytes: []u8, offset: usize, value: u32) void {
    std.mem.writeInt(u32, bytes[offset..][0..4], value, .little);
}

fn get_i64(bytes: []const u8, offset: usize) i64 {
    return std.mem.readInt(i64, bytes[offset..][0..8], .little);
}

fn put_u64(bytes: []u8, offset: usize, value: u64) void {
    std.mem.writeInt(u64, bytes[offset..][0..8], value, .little);
}

/// Issues an ioctl, retrying on EINTR, and returns the final errno.
fn ioctl_errno(fd: i32, request: u32, arg: anytype) linux.E {
    while (true) {
        const rc = linux.ioctl(fd, request, @intFromPtr(arg));
        const err = linux.errno(rc);
        if (err != .INTR) return err;
    }
}

fn monotonic_ns() u64 {
    var ts: linux.timespec = undefined;
    if (linux.errno(linux.clock_gettime(linux.CLOCK.MONOTONIC, &ts)) != .SUCCESS) return 0;
    return @as(u64, @intCast(ts.sec)) *% 1_000_000_000 +% @as(u64, @intCast(ts.nsec));
}

/// Copies `path` into `buffer` with a terminating zero.
fn as_c_path(path: []const u8, buffer: *[max_path]u8) Error![:0]const u8 {
    if (path.len >= buffer.len) return error.NameTooLong;
    @memcpy(buffer[0..path.len], path);
    buffer[path.len] = 0;
    return buffer[0..path.len :0];
}

/// True when `path` names a character device, checked with statx(2).
fn is_char_device_path(path: []const u8) bool {
    var buffer: [max_path]u8 = undefined;
    const c_path = as_c_path(path, &buffer) catch return false;
    var st: linux.Statx = undefined;
    const rc = linux.statx(linux.AT.FDCWD, c_path, 0, .{ .TYPE = true }, &st);
    if (linux.errno(rc) != .SUCCESS) return false;
    return linux.S.ISCHR(st.mode);
}

/// True when the open descriptor refers to a character device.
fn is_char_device_fd(fd: i32) bool {
    var st: linux.Statx = undefined;
    // AT_EMPTY_PATH (0x1000) makes statx describe the descriptor itself.
    const rc = linux.statx(fd, "", 0x1000, .{ .TYPE = true }, &st);
    if (linux.errno(rc) != .SUCCESS) return false;
    return linux.S.ISCHR(st.mode);
}

/// Capabilities that matter for capture. Kernels from 3.4 report the
/// per-node set in `device_caps` when CAP_DEVICE_CAPS is set. Older kernels
/// only fill `capabilities`.
fn effective_caps(capability: []const u8) u32 {
    const caps = get_u32(capability, cap_capabilities);
    if (caps & CAP_DEVICE_CAPS != 0) return get_u32(capability, cap_device_caps);
    return caps;
}

/// Maps a V4L2 fourcc to SDL-compatible format and colorspace, or null when
/// the layout is not supported.
fn format_from_fourcc(pixelformat: u32) ?struct { format: camera.Format, colorspace: camera.Colorspace } {
    return switch (pixelformat) {
        PIX_FMT_YUYV => .{ .format = .yuy2, .colorspace = .bt709_limited },
        PIX_FMT_MJPEG => .{ .format = .mjpg, .colorspace = .srgb },
        PIX_FMT_RGBX32 => .{ .format = .rgbx32, .colorspace = .srgb },
        else => null,
    };
}

fn fourcc_from_format(format: camera.Format) Error!u32 {
    return switch (format) {
        .yuy2 => PIX_FMT_YUYV,
        .mjpg => PIX_FMT_MJPEG,
        .rgbx32 => PIX_FMT_RGBX32,
        else => error.UnsupportedFormat,
    };
}

// ---------------------------------------------------------------------------
// Discovery

/// One capture device found by `Registry.rescan`. Owns its path, bus string
/// and camera description.
pub const Entry = struct {
    info: camera.Info,
    /// Device node, for example "/dev/video0".
    path: []u8,
    /// Kernel bus identifier, for example "usb-0000:00:14.0-2". It identifies
    /// the physical device across renumbering.
    bus_info: []u8,

    /// Releases all owned storage. The entry must not be used afterwards.
    pub fn deinit(self: *Entry) void {
        const allocator = self.info.allocator;
        self.info.deinit();
        allocator.free(self.path);
        allocator.free(self.bus_info);
        self.* = undefined;
    }
};

/// The set of V4L2 capture devices currently visible under /dev. Holds no
/// device handles. Call `rescan` to discover new devices and drop unplugged ones.
pub const Registry = struct {
    allocator: std.mem.Allocator,
    entries: std.ArrayList(Entry) = .empty,

    /// Counts of devices added and removed by one rescan.
    pub const Changes = struct {
        added: usize = 0,
        removed: usize = 0,
    };

    /// Creates an empty registry. Nothing is scanned until `rescan`.
    pub fn init(allocator: std.mem.Allocator) Registry {
        return .{ .allocator = allocator };
    }

    /// Releases every entry.
    pub fn deinit(self: *Registry) void {
        for (self.entries.items) |*entry| entry.deinit();
        self.entries.deinit(self.allocator);
        self.* = undefined;
    }

    /// Devices in path order. Slices from this method are invalidated by rescan.
    pub fn devices(self: *const Registry) []const Entry {
        return self.entries.items;
    }

    /// Drops entries whose node no longer exists, then probes every `video<N>`
    /// node under /dev and adds capture devices not already known by bus string.
    /// Probing opens each node briefly, as SDL does. Devices without any usable
    /// capture mode are skipped.
    pub fn rescan(self: *Registry) (Error || AllocError)!Changes {
        var changes: Changes = .{};

        var index: usize = 0;
        while (index < self.entries.items.len) {
            if (is_char_device_path(self.entries.items[index].path)) {
                index += 1;
                continue;
            }
            var gone = self.entries.orderedRemove(index);
            gone.deinit();
            changes.removed += 1;
        }

        const dir_fd = try open_directory("/dev");
        defer _ = linux.close(dir_fd);

        var buffer: [4096]u8 align(8) = undefined;
        scan: while (true) {
            const rc = linux.getdents64(dir_fd, &buffer, buffer.len);
            switch (linux.errno(rc)) {
                .SUCCESS => {},
                else => return error.DirectoryFailed,
            }
            const bytes = rc;
            if (bytes == 0) break :scan;

            var offset: usize = 0;
            while (offset < bytes) {
                // struct linux_dirent64: ino (8), off (8), reclen u16 at 16,
                // type (1) at 18, name from 19, NUL-terminated.
                const reclen = std.mem.readInt(u16, buffer[offset + 16 ..][0..2], .little);
                if (reclen == 0) break :scan;
                const record_end = offset + reclen;
                const name_start = offset + 19;
                const name_len = std.mem.indexOfScalar(u8, buffer[name_start..record_end], 0) orelse 0;
                const name = buffer[name_start..][0..name_len];
                offset = record_end;
                if (!is_video_node(name)) continue;

                var path_buffer: [max_path]u8 = undefined;
                const path = std.fmt.bufPrint(&path_buffer, "/dev/{s}", .{name}) catch return error.NameTooLong;
                if (try self.probe(path)) changes.added += 1;
            }
        }

        std.mem.sort(Entry, self.entries.items, {}, entry_path_less);
        return changes;
    }

    fn probe(self: *Registry, path: []const u8) (Error || AllocError)!bool {
        const fd = open_device(path) catch return false;
        defer _ = linux.close(fd);

        if (!is_char_device_fd(fd)) return false;

        var capability: [104]u8 = std.mem.zeroes([104]u8);
        if (ioctl_errno(fd, VIDIOC_QUERYCAP, &capability) != .SUCCESS) return false;
        if (effective_caps(&capability) & CAP_VIDEO_CAPTURE == 0) return false;

        const bus_info = std.mem.sliceTo(capability[cap_bus_info..][0..32], 0);
        for (self.entries.items) |entry| {
            if (std.mem.eql(u8, entry.bus_info, bus_info)) return false;
        }

        var collector: SpecCollector = .{ .allocator = self.allocator };
        defer collector.deinit();
        try enumerate_formats(fd, &collector);
        if (collector.specs.items.len == 0) return false;

        const name = std.mem.sliceTo(capability[cap_card..][0..32], 0);
        var info = try camera.Info.init(self.allocator, name, .unknown, collector.specs.items);
        errdefer info.deinit();
        const owned_path = try self.allocator.dupe(u8, path);
        errdefer self.allocator.free(owned_path);
        const owned_bus = try self.allocator.dupe(u8, bus_info);
        errdefer self.allocator.free(owned_bus);
        try self.entries.append(self.allocator, .{ .info = info, .path = owned_path, .bus_info = owned_bus });
        return true;
    }
};

fn entry_path_less(_: void, a: Entry, b: Entry) bool {
    return std.mem.lessThan(u8, a.path, b.path);
}

/// Accepts "video" followed by at least one digit, as SDL's scan did.
fn is_video_node(name: []const u8) bool {
    if (!std.mem.startsWith(u8, name, "video")) return false;
    const digits = name["video".len..];
    if (digits.len == 0) return false;
    for (digits) |c| {
        if (!std.ascii.isDigit(c)) return false;
    }
    return true;
}

fn open_directory(path: []const u8) Error!i32 {
    var buffer: [max_path]u8 = undefined;
    const c_path = try as_c_path(path, &buffer);
    const flags: linux.O = .{ .DIRECTORY = true, .CLOEXEC = true };
    const rc = linux.open(c_path, flags, 0);
    if (linux.errno(rc) != .SUCCESS) return error.DirectoryFailed;
    return @intCast(rc);
}

/// Opens a device node read-write and non-blocking, as SDL does. CLOEXEC keeps
/// the descriptor out of spawned processes.
fn open_device(path: []const u8) Error!i32 {
    var buffer: [max_path]u8 = undefined;
    const c_path = try as_c_path(path, &buffer);
    const flags: linux.O = .{ .ACCMODE = .RDWR, .NONBLOCK = true, .CLOEXEC = true };
    const rc = linux.open(c_path, flags, 0);
    if (linux.errno(rc) != .SUCCESS) return error.OpenFailed;
    return @intCast(rc);
}

/// Accumulates the specs of one device while it is probed. Adds are fallible.
const SpecCollector = struct {
    allocator: std.mem.Allocator,
    specs: std.ArrayList(camera.Spec) = .empty,

    fn deinit(self: *SpecCollector) void {
        self.specs.deinit(self.allocator);
    }

    fn add(self: *SpecCollector, format: camera.Format, colorspace: camera.Colorspace, width: u32, height: u32, framerate_numerator: u32, framerate_denominator: u32) AllocError!void {
        try self.specs.append(self.allocator, .{
            .format = format,
            .colorspace = colorspace,
            .width = width,
            .height = height,
            .framerate_numerator = framerate_numerator,
            .framerate_denominator = framerate_denominator,
        });
    }
};

/// Collects every supported (format, size, interval) combination for the device.
fn enumerate_formats(fd: i32, collector: *SpecCollector) (Error || AllocError)!void {
    var index: u32 = 0;
    while (true) : (index += 1) {
        var desc: [64]u8 = std.mem.zeroes([64]u8);
        put_u32(&desc, fmtdesc_index, index);
        put_u32(&desc, fmtdesc_type, BUF_TYPE_VIDEO_CAPTURE);
        if (ioctl_errno(fd, VIDIOC_ENUM_FMT, &desc) != .SUCCESS) break;

        const pixelformat = get_u32(&desc, fmtdesc_pixelformat);
        const mapping = format_from_fourcc(pixelformat) orelse continue;
        try enumerate_sizes(fd, collector, pixelformat, mapping.format, mapping.colorspace);
    }
}

fn enumerate_sizes(
    fd: i32,
    collector: *SpecCollector,
    pixelformat: u32,
    format: camera.Format,
    colorspace: camera.Colorspace,
) (Error || AllocError)!void {
    var index: u32 = 0;
    while (true) {
        var rec: [44]u8 = std.mem.zeroes([44]u8);
        put_u32(&rec, frmsize_index, index);
        put_u32(&rec, frmsize_pixel_format, pixelformat);
        if (ioctl_errno(fd, VIDIOC_ENUM_FRAMESIZES, &rec) != .SUCCESS) break;

        const kind = get_u32(&rec, frmsize_type);
        if (kind == FRMSIZE_TYPE_DISCRETE) {
            const width = get_u32(&rec, frmsize_discrete_width);
            const height = get_u32(&rec, frmsize_discrete_height);
            try enumerate_intervals(fd, collector, pixelformat, format, colorspace, width, height);
            index += 1;
        } else if (kind == FRMSIZE_TYPE_STEPWISE or kind == FRMSIZE_TYPE_CONTINUOUS) {
            // Ranges are walked with their steps. A zero step yields the
            // minimum once, rather than looping forever.
            const min_w = get_u32(&rec, frmsize_stepwise_min_width);
            const max_w = get_u32(&rec, frmsize_stepwise_max_width);
            const step_w = get_u32(&rec, frmsize_stepwise_step_width);
            const min_h = get_u32(&rec, frmsize_stepwise_min_height);
            const max_h = get_u32(&rec, frmsize_stepwise_max_height);
            const step_h = get_u32(&rec, frmsize_stepwise_step_height);
            var width: u64 = min_w;
            while (width <= max_w) {
                var height: u64 = min_h;
                while (height <= max_h) {
                    try enumerate_intervals(fd, collector, pixelformat, format, colorspace, @intCast(width), @intCast(height));
                    if (step_h == 0) break;
                    height += step_h;
                }
                if (step_w == 0) break;
                width += step_w;
            }
            break;
        } else {
            break;
        }
    }
}

/// Frame rates for one size. Discrete intervals map one to one. Stepwise
/// ranges step the interval numerator and offset the denominator, as SDL does.
/// Continuous ranges expose the NTSC and integer rates that fall in range.
fn enumerate_intervals(
    fd: i32,
    collector: *SpecCollector,
    pixelformat: u32,
    format: camera.Format,
    colorspace: camera.Colorspace,
    width: u32,
    height: u32,
) (Error || AllocError)!void {
    var index: u32 = 0;
    while (true) {
        var rec: [52]u8 = std.mem.zeroes([52]u8);
        put_u32(&rec, frmival_index, index);
        put_u32(&rec, frmival_pixel_format, pixelformat);
        put_u32(&rec, frmival_width, width);
        put_u32(&rec, frmival_height, height);
        if (ioctl_errno(fd, VIDIOC_ENUM_FRAMEINTERVALS, &rec) != .SUCCESS) break;

        const kind = get_u32(&rec, frmival_type);
        if (kind == FRMIVAL_TYPE_DISCRETE) {
            // The driver reports an interval (seconds per frame). The framerate
            // is the reversed fraction, so the numerator and denominator swap.
            const num = get_u32(&rec, frmival_discrete_num);
            const den = get_u32(&rec, frmival_discrete_den);
            try collector.add(format, colorspace, width, height, den, num);
            index += 1;
        } else if (kind == FRMIVAL_TYPE_STEPWISE) {
            var den: u64 = get_u32(&rec, frmival_min_den);
            const min_num = get_u32(&rec, frmival_min_num);
            const max_num = get_u32(&rec, frmival_max_num);
            const step_num = get_u32(&rec, frmival_step_num);
            const step_den = get_u32(&rec, frmival_step_den);
            var num: u64 = min_num;
            while (num <= max_num) {
                try collector.add(format, colorspace, width, height, @intCast(den), @intCast(num));
                if (step_num == 0) break;
                num += step_num;
                den += step_den;
            }
            break;
        } else if (kind == FRMIVAL_TYPE_CONTINUOUS) {
            try enumerate_continuous(collector, format, colorspace, width, height, &rec);
            break;
        } else {
            break;
        }
    }
}

/// Adds the common NTSC and integer rates within a continuous interval range.
/// Each threshold is the interval (seconds per frame) that the rate needs.
/// Thresholds are copied from SDL, including its double-precision comparisons.
fn enumerate_continuous(
    collector: *SpecCollector,
    format: camera.Format,
    colorspace: camera.Colorspace,
    width: u32,
    height: u32,
    rec: *const [52]u8,
) AllocError!void {
    const min_num = get_u32(rec, frmival_min_num);
    const min_den = get_u32(rec, frmival_min_den);
    const max_num = get_u32(rec, frmival_max_num);
    const max_den = get_u32(rec, frmival_max_den);
    // SDL keeps the interval rates in float and compares them as double.
    const min_interval: f64 = @as(f32, @floatFromInt(min_num)) / @as(f32, @floatFromInt(min_den));
    const max_interval: f64 = @as(f32, @floatFromInt(max_num)) / @as(f32, @floatFromInt(max_den));

    const Candidate = struct { num: u32, den: u32, interval: f64 };
    const candidates = [_]Candidate{
        .{ .num = 24000, .den = 1001, .interval = 1.001 / 24.0 },
        .{ .num = 24000, .den = 1000, .interval = 1.000 / 24.0 },
        .{ .num = 30000, .den = 1001, .interval = 1.001 / 30.0 },
        .{ .num = 30000, .den = 1000, .interval = 1.000 / 30.0 },
        .{ .num = 50000, .den = 1000, .interval = 1.000 / 50.0 },
        .{ .num = 60000, .den = 1001, .interval = 1.001 / 60.0 },
        .{ .num = 60000, .den = 1000, .interval = 1.000 / 60.0 },
    };
    for (candidates) |candidate| {
        if (min_interval <= candidate.interval and max_interval >= candidate.interval) {
            try collector.add(format, colorspace, width, height, candidate.num, candidate.den);
        }
    }
}

// ---------------------------------------------------------------------------
// Capture session

/// An open capture device streaming through mmap'd kernel buffers. Owns the
/// descriptor, the mappings and the held-frame state.
///
/// Frames are pulled, not pushed: `wait` blocks for readiness with poll(2),
/// `acquire` dequeues without blocking, and `release` returns the buffer to the
/// driver. A session is not thread-safe; use one thread or synchronize access.
pub const Session = struct {
    allocator: std.mem.Allocator,
    fd: i32,
    buffers: []Buffer = &.{},
    streaming: bool = false,
    /// Spec the application sees.
    app_spec: camera.Spec,
    /// Native spec the driver streams in.
    device_spec: camera.Spec,
    /// Bytes per row reported by the driver. Zero means no pitch was reported.
    driver_pitch: u32 = 0,
    /// Frames still to drop after start. The first frames are often dark.
    drop_frames: u32 = 1,
    timestamps: camera.Timestamp = .{},

    const Buffer = struct {
        mapping: []u8 = &.{},
        held: bool = false,
    };

    /// Opens `entry`, negotiates the mode for `requested` and starts streaming.
    /// `requested == null` takes the device's best mode. The returned session
    /// holds the descriptor until `deinit`. `entry` is only read during the call.
    pub fn open(allocator: std.mem.Allocator, entry: *const Entry, requested: ?camera.Spec) (Error || AllocError)!Session {
        const negotiated = try camera.negotiate(entry.info.specs, requested);
        const fd = try open_device(entry.path);
        // The session owns the descriptor from here on, so a single errdefer closes it.
        var session: Session = .{
            .allocator = allocator,
            .fd = fd,
            .app_spec = negotiated.app,
            .device_spec = negotiated.device,
        };
        errdefer session.deinit();
        if (!is_char_device_fd(fd)) return error.NotCharacterDevice;
        try session.configure(negotiated.device);
        try session.start_streaming();
        return session;
    }

    /// Stops streaming, unmaps buffers, closes the descriptor, and releases
    /// frames still held by the caller. Frames must not be used after this.
    pub fn deinit(self: *Session) void {
        if (self.streaming) {
            var stream_type: i32 = @intCast(BUF_TYPE_VIDEO_CAPTURE);
            _ = ioctl_errno(self.fd, VIDIOC_STREAMOFF, &stream_type);
            self.streaming = false;
        }
        for (self.buffers) |buffer| {
            if (buffer.mapping.len > 0) _ = linux.munmap(buffer.mapping.ptr, buffer.mapping.len);
        }
        if (self.buffers.len > 0) self.allocator.free(self.buffers);
        self.buffers = &.{};
        if (self.fd >= 0) _ = linux.close(self.fd);
        self.fd = -1;
        self.* = undefined;
    }

    /// Spec the application requested, with unset fields filled from the device.
    pub fn spec(self: *const Session) camera.Spec {
        return self.app_spec;
    }

    /// Permission state. The V4L2 backend has no prompt, so an open session is
    /// approved.
    pub fn permission(self: *const Session) camera.PermissionState {
        _ = self;
        return .approved;
    }

    /// Waits up to `timeout_ms` for a frame. Returns true when `acquire` should
    /// be called. A signal interruption counts as a timeout.
    pub fn wait(self: *Session, timeout_ms: i32) Error!bool {
        var fds: [1]linux.pollfd = .{.{ .fd = self.fd, .events = linux.POLL.IN, .revents = 0 }};
        const rc = linux.poll(&fds, 1, timeout_ms);
        switch (linux.errno(rc)) {
            .SUCCESS => {},
            .INTR => return false,
            else => return error.PollFailed,
        }
        if (rc == 0) return false;
        const bad: i16 = @intCast(linux.POLL.ERR | linux.POLL.HUP | linux.POLL.NVAL);
        if (fds[0].revents & bad != 0) return error.DeviceLost;
        return true;
    }

    /// Dequeues one frame without blocking. Returns null when no frame is ready
    /// or when a startup frame is dropped. The frame borrows the mapped buffer
    /// until `release`.
    pub fn acquire(self: *Session) Error!?camera.Frame {
        if (!self.streaming) return error.NotStreaming;

        var buf: [buf_size]u8 = std.mem.zeroes([buf_size]u8);
        put_u32(&buf, buf_type, BUF_TYPE_VIDEO_CAPTURE);
        put_u32(&buf, buf_memory, MEMORY_MMAP);
        switch (ioctl_errno(self.fd, VIDIOC_DQBUF, &buf)) {
            .SUCCESS => {},
            .AGAIN => return null,
            .NODEV, .NXIO => return error.DeviceLost,
            else => return error.DequeueFailed,
        }

        const index = get_u32(&buf, buf_index);
        if (index >= self.buffers.len or self.buffers[index].held) return error.BadBufferIndex;

        if (self.drop_frames > 0) {
            self.drop_frames -= 1;
            try self.queue(index);
            return null;
        }

        const slot = &self.buffers[index];
        slot.held = true;
        const bytes_used = get_u32(&buf, buf_bytesused);
        const length = slot.mapping.len;
        const used: usize = if (bytes_used == 0 or bytes_used > length) length else bytes_used;
        const stride: usize = if (self.driver_pitch != 0) self.driver_pitch else used;

        // timeval fields are read as signed 64-bit and reinterpreted, since
        // the kernel's signed seconds are never negative for a capture time.
        const sec: u64 = @bitCast(get_i64(&buf, buf_timestamp_sec));
        const usec: u64 = @bitCast(get_i64(&buf, buf_timestamp_usec));
        const driver_ns = sec *% 1_000_000_000 +% usec *% 1000;
        const timestamp_ns = self.timestamps.map(driver_ns, monotonic_ns());

        return .{
            .slot = index,
            .data = slot.mapping[0..used],
            .stride = stride,
            .timestamp_ns = timestamp_ns,
        };
    }

    /// Returns a frame's buffer to the driver. The frame must have come from this
    /// session and not already been released. Its `data` must still be this
    /// session's mapping for that slot.
    pub fn release(self: *Session, frame: camera.Frame) Error!void {
        if (frame.slot >= self.buffers.len) return error.BadBufferIndex;
        const slot = &self.buffers[frame.slot];
        if (!slot.held) return error.FrameNotHeld;
        if (frame.data.ptr != slot.mapping.ptr) return error.BadBufferIndex;
        try self.queue(frame.slot);
    }

    fn queue(self: *Session, index: u32) Error!void {
        var buf: [buf_size]u8 = std.mem.zeroes([buf_size]u8);
        put_u32(&buf, buf_type, BUF_TYPE_VIDEO_CAPTURE);
        put_u32(&buf, buf_memory, MEMORY_MMAP);
        put_u32(&buf, buf_index, index);
        if (ioctl_errno(self.fd, VIDIOC_QBUF, &buf) != .SUCCESS) return error.QueueFailed;
        self.buffers[index].held = false;
    }

    /// Sets the pixel format, then the frame interval, then reads back the
    /// driver's pitch and checks that it accepted the format and size.
    fn configure(self: *Session, device: camera.Spec) (Error || AllocError)!void {
        var caps: [104]u8 = std.mem.zeroes([104]u8);
        if (ioctl_errno(self.fd, VIDIOC_QUERYCAP, &caps) != .SUCCESS) return error.NotV4l2Device;
        const capture_caps = effective_caps(&caps);
        if (capture_caps & CAP_VIDEO_CAPTURE == 0) return error.NotCaptureDevice;

        // Cropping is advisory. Reset to the default rectangle when it exists.
        var cropcap: [44]u8 = std.mem.zeroes([44]u8);
        put_u32(&cropcap, 0, BUF_TYPE_VIDEO_CAPTURE);
        if (ioctl_errno(self.fd, VIDIOC_CROPCAP, &cropcap) == .SUCCESS) {
            var crop: [20]u8 = std.mem.zeroes([20]u8);
            put_u32(&crop, 0, BUF_TYPE_VIDEO_CAPTURE);
            @memcpy(crop[crop_c..][0..16], cropcap[cropcap_defrect..][0..16]);
            _ = ioctl_errno(self.fd, VIDIOC_S_CROP, &crop);
        }

        var fmt: [format_size]u8 = std.mem.zeroes([format_size]u8);
        put_u32(&fmt, format_type, BUF_TYPE_VIDEO_CAPTURE);
        put_u32(&fmt, pix_width, device.width);
        put_u32(&fmt, pix_height, device.height);
        const requested_fourcc = try fourcc_from_format(device.format);
        put_u32(&fmt, pix_pixelformat, requested_fourcc);
        put_u32(&fmt, pix_field, FIELD_ANY);
        if (ioctl_errno(self.fd, VIDIOC_S_FMT, &fmt) != .SUCCESS) return error.FormatRejected;

        if (device.framerate_numerator != 0 and device.framerate_denominator != 0) {
            try self.set_frame_interval(device);
        }

        var readback: [format_size]u8 = std.mem.zeroes([format_size]u8);
        put_u32(&readback, format_type, BUF_TYPE_VIDEO_CAPTURE);
        if (ioctl_errno(self.fd, VIDIOC_G_FMT, &readback) != .SUCCESS) return error.FormatRejected;
        const expected_fourcc = try fourcc_from_format(device.format);
        if (get_u32(&readback, pix_pixelformat) != expected_fourcc or
            get_u32(&readback, pix_width) != device.width or
            get_u32(&readback, pix_height) != device.height)
        {
            return error.FormatRejected;
        }
        self.driver_pitch = get_u32(&readback, pix_bytesperline);

        if (capture_caps & CAP_STREAMING == 0) return error.NoStreamingIo;
        try self.allocate_mmap_buffers();
    }

    /// Requests the framerate as an interval. The driver stores timeperframe as
    /// seconds per frame, so the numerator and denominator are reversed. SDL
    /// only issues S_PARM when G_PARM reports a different interval.
    fn set_frame_interval(self: *Session, device: camera.Spec) Error!void {
        var parm: [parm_size]u8 = std.mem.zeroes([parm_size]u8);
        put_u32(&parm, parm_type, BUF_TYPE_VIDEO_CAPTURE);
        if (ioctl_errno(self.fd, VIDIOC_G_PARM, &parm) != .SUCCESS) return;

        const current_num = get_u32(&parm, parm_timeperframe_num);
        const current_den = get_u32(&parm, parm_timeperframe_den);
        if (current_den == device.framerate_numerator and current_num == device.framerate_denominator) return;

        put_u32(&parm, parm_type, BUF_TYPE_VIDEO_CAPTURE);
        put_u32(&parm, parm_timeperframe_num, device.framerate_denominator);
        put_u32(&parm, parm_timeperframe_den, device.framerate_numerator);
        if (ioctl_errno(self.fd, VIDIOC_S_PARM, &parm) != .SUCCESS) return error.FrameRateRejected;
    }

    /// Requests MMAP buffers, maps each one, and queues them all. Requires at
    /// least two buffers, as SDL does, so capture can overlap with consumption.
    fn allocate_mmap_buffers(self: *Session) (Error || AllocError)!void {
        var req: [20]u8 = std.mem.zeroes([20]u8);
        put_u32(&req, reqbufs_count, 8);
        put_u32(&req, reqbufs_type, BUF_TYPE_VIDEO_CAPTURE);
        put_u32(&req, reqbufs_memory, MEMORY_MMAP);
        if (ioctl_errno(self.fd, VIDIOC_REQBUFS, &req) != .SUCCESS) return error.NoStreamingIo;
        const count = get_u32(&req, reqbufs_count);
        if (count < 2 or count > max_buffers) return error.BufferSetupFailed;

        self.buffers = try self.allocator.alloc(Buffer, count);
        @memset(self.buffers, .{});

        for (self.buffers, 0..) |*slot, index| {
            var query: [buf_size]u8 = std.mem.zeroes([buf_size]u8);
            put_u32(&query, buf_type, BUF_TYPE_VIDEO_CAPTURE);
            put_u32(&query, buf_memory, MEMORY_MMAP);
            put_u32(&query, buf_index, @intCast(index));
            if (ioctl_errno(self.fd, VIDIOC_QUERYBUF, &query) != .SUCCESS) return error.BufferSetupFailed;

            const length: usize = get_u32(&query, buf_length);
            const offset: usize = get_u32(&query, buf_m_offset);
            const prot: linux.PROT = .{ .READ = true, .WRITE = true };
            const flags: linux.MAP = .{ .TYPE = .SHARED };
            const rc = linux.mmap(null, length, prot, flags, self.fd, @intCast(offset));
            if (linux.errno(rc) != .SUCCESS) return error.MapFailed;
            const pointer: [*]u8 = @ptrFromInt(rc);
            slot.mapping = pointer[0..length];
        }
    }

    fn start_streaming(self: *Session) Error!void {
        for (0..self.buffers.len) |index| try self.queue(@intCast(index));
        var stream_type: i32 = @intCast(BUF_TYPE_VIDEO_CAPTURE);
        if (ioctl_errno(self.fd, VIDIOC_STREAMON, &stream_type) != .SUCCESS) return error.StreamFailed;
        self.streaming = true;
    }
};
