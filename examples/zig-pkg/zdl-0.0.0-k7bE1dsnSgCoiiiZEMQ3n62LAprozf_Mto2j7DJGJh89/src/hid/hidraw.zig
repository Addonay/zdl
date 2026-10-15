//! Open HID devices through the Linux hidraw character interface.
//!
//! The device owns its file descriptor and path. Reads wait with poll(2) so a
//! timeout never depends on O_NONBLOCK, which some kernels mishandle on
//! disconnect. Feature and input reports use the HIDIOC* ioctls from
//! <linux/hidraw.h>, and the report descriptor comes from HIDIOCGRDESC.
//!
//! Altered native port of hid_open_path, hid_read_timeout, hid_write, the
//! report functions and get_hid_report_descriptor in SDL's hidapi/linux/hid.c.
//! Deliberate differences: strings are returned as UTF-8 slices (not wchar_t),
//! there is no global last-error string, and the BLE report repair is decided
//! from HIDIOCGRAWINFO rather than from udev.

const std = @import("std");
const builtin = @import("builtin");
const linux = std.os.linux;
const Allocator = std.mem.Allocator;
const sysfs = @import("sysfs.zig");
const filter = @import("filter.zig");

const native_endian = builtin.target.cpu.arch.endian();

/// Errors from hidraw operations.
pub const Error = Allocator.Error || error{
    PermissionDenied,
    DeviceUnavailable,
    /// The node is not a hidraw device (HIDIOCGRDESCSIZE failed).
    NotHidraw,
    /// The device was unplugged or reported a poll error.
    Disconnected,
    /// The caller passed an empty buffer or a zero-length write.
    InvalidArgument,
    /// The kernel reported a report-descriptor size larger than the buffer.
    DescriptorTooLarge,
    Io,
    NameTooLong,
};

/// Number of attempts for EACCES while udev is still applying permissions.
const open_attempts = 50;
/// Retries for EPIPE on feature-report sends, as SDL does.
const send_retries = 50;

// ---- ioctl encoding ----

/// `_IOR` / `_IOW` / `_IOWR` with a runtime payload size. The direction bits come
/// from std's IOCTL helpers so the arch-specific encoding is respected.
fn ioc_read(io_type: u8, nr: u8, size: usize) u32 {
    return linux.IOCTL.IOR(io_type, nr, [0]u8) | (@as(u32, @intCast(size)) << 16);
}

fn ioc_readwrite(io_type: u8, nr: u8, size: usize) u32 {
    return linux.IOCTL.IOWR(io_type, nr, [0]u8) | (@as(u32, @intCast(size)) << 16);
}

const hidiocgrdescsize = linux.IOCTL.IOR('H', 0x01, i32);
const hidiocgrdesc = ioc_read('H', 0x02, 4 + max_descriptor_size);
const hidiocgrawinfo = linux.IOCTL.IOR('H', 0x03, RawInfoRecord);
const max_descriptor_size = sysfs.max_descriptor_size;

/// `struct hidraw_devinfo` from <linux/hidraw.h>: bustype u32, vendor s16,
/// product s16. Decoded explicitly from bytes; no foreign-layout declaration is used.
const RawInfoRecord = [8]u8;

/// Bus, vendor and product reported by the kernel for an open device.
pub const RawInfo = struct {
    bus: u32,
    vendor_id: u16,
    product_id: u16,
};

// ---- Syscall helpers ----

fn map_errno(e: linux.E) Error {
    return switch (e) {
        .ACCES, .PERM => error.PermissionDenied,
        .NOENT, .NODEV, .NXIO => error.DeviceUnavailable,
        .NOMEM => error.OutOfMemory,
        .NOTTY => error.NotHidraw,
        else => error.Io,
    };
}

fn check(rc: usize) Error!usize {
    const e = linux.errno(rc);
    if (e != .SUCCESS) return map_errno(e);
    return rc;
}

fn sleep_ms(ms: u32) void {
    const ts: linux.timespec = .{ .sec = 0, .nsec = @intCast(@as(u64, ms) * std.time.ns_per_ms) };
    _ = linux.nanosleep(&ts, null);
}

// ---- Device ----

/// An open hidraw device. The device owns its path and file descriptor; `close`
/// releases both. Operations take `*Device` because the blocking flag may change.
pub const Device = struct {
    allocator: Allocator,
    fd: i32,
    path: []u8,
    /// Set for Bluetooth Steam controllers, whose BlueZ reports feature reports
    /// with the report ID duplicated or omitted. See `get_feature_report`.
    needs_ble_hack: bool,
    /// When false, `read` polls with a zero timeout. When true it blocks.
    blocking: bool = true,

    /// Opens `path` read-write, such as "/dev/hidraw3". Retries EACCES briefly
    /// while udev applies permissions, then checks that the node is hidraw.
    pub fn open(allocator: Allocator, path: []const u8) Error!Device {
        const z = std.posix.toPosixPath(path) catch return error.NameTooLong;
        var fd_rc: usize = 0;
        for (0..open_attempts) |_| {
            fd_rc = linux.open(&z, .{ .ACCMODE = .RDWR, .CLOEXEC = true }, 0);
            if (linux.errno(fd_rc) == .ACCES) {
                sleep_ms(1);
                continue;
            }
            break;
        }
        _ = try check(fd_rc);
        const fd: i32 = @intCast(fd_rc);
        errdefer _ = linux.close(fd);

        var desc_size: i32 = 0;
        _ = check(linux.ioctl(fd, hidiocgrdescsize, @intFromPtr(&desc_size))) catch return error.NotHidraw;

        const owned_path = try allocator.dupe(u8, path);
        errdefer allocator.free(owned_path);

        return .{
            .allocator = allocator,
            .fd = fd,
            .path = owned_path,
            .needs_ble_hack = needs_ble_hack(fd),
        };
    }

    /// Closes the descriptor and frees the path.
    pub fn close(self: *Device) void {
        _ = linux.close(self.fd);
        self.allocator.free(self.path);
        self.* = undefined;
    }

    /// Bus, vendor and product from the kernel. Used by `needs_ble_hack`.
    pub fn raw_info(self: Device) Error!RawInfo {
        var record: RawInfoRecord = @splat(0);
        _ = try check(linux.ioctl(self.fd, hidiocgrawinfo, @intFromPtr(&record)));
        return .{
            .bus = std.mem.readInt(u32, record[0..4], native_endian),
            .vendor_id = @bitCast(std.mem.readInt(i16, record[4..6], native_endian)),
            .product_id = @bitCast(std.mem.readInt(i16, record[6..8], native_endian)),
        };
    }

    /// Owned copy of the device's report descriptor. Free the slice with `allocator`.
    pub fn report_descriptor(self: Device, allocator: Allocator) Error![]u8 {
        var size_value: i32 = 0;
        _ = try check(linux.ioctl(self.fd, hidiocgrdescsize, @intFromPtr(&size_value)));
        if (size_value < 0 or size_value > max_descriptor_size) return error.DescriptorTooLarge;
        const size: usize = @intCast(size_value);

        // struct hidraw_report_descriptor: u32 size, then the descriptor bytes.
        var record: [4 + max_descriptor_size]u8 = @splat(0);
        std.mem.writeInt(u32, record[0..4], @intCast(size), native_endian);
        _ = try check(linux.ioctl(self.fd, hidiocgrdesc, @intFromPtr(&record)));
        const returned = std.mem.readInt(u32, record[0..4], native_endian);
        const count = @min(@as(usize, returned), max_descriptor_size);
        return allocator.dupe(u8, record[4 .. 4 + count]);
    }

    /// Writes one output report. `data[0]` is the report ID when the device uses
    /// IDs, and zero otherwise. Returns the number of bytes written.
    pub fn write(self: Device, data: []const u8) Error!usize {
        if (data.len == 0) return error.InvalidArgument;
        return check(linux.write(self.fd, data.ptr, data.len));
    }

    /// Reads one input report. `timeout_ms` null waits forever; otherwise a zero
    /// or positive timeout uses poll before reading. Returns null on timeout, and
    /// zero on EAGAIN. Poll errors and hangup return `error.Disconnected`.
    pub fn read_timeout(self: Device, buf: []u8, timeout_ms: ?u32) Error!?usize {
        if (buf.len == 0) return error.InvalidArgument;
        if (timeout_ms) |ms| {
            var fds = [_]linux.pollfd{.{ .fd = self.fd, .events = linux.POLL.IN, .revents = 0 }};
            const wait: i32 = @intCast(@min(ms, std.math.maxInt(i32)));
            const ready = try check(linux.poll(&fds, 1, wait));
            if (ready == 0) return null;
            const bad = linux.POLL.ERR | linux.POLL.HUP | linux.POLL.NVAL;
            if (fds[0].revents & bad != 0) return error.Disconnected;
        }
        const rc = linux.read(self.fd, buf.ptr, buf.len);
        const e = linux.errno(rc);
        if (e == .AGAIN or e == .INPROGRESS) return 0;
        return try check(rc);
    }

    /// Reads with the device's blocking mode: wait forever when blocking,
    /// otherwise return null immediately when no report is ready.
    pub fn read(self: Device, buf: []u8) Error!?usize {
        return self.read_timeout(buf, if (self.blocking) null else 0);
    }

    /// Changes the blocking mode used by `read`. Non-blocking reads use poll,
    /// not O_NONBLOCK, because some kernels fail to report disconnects through
    /// non-blocking read.
    pub fn set_blocking(self: *Device, blocking: bool) void {
        self.blocking = blocking;
    }

    /// Sends a feature report. `data[0]` is the report ID. EPIPE means the device
    /// is busy, so the send is retried up to 50 times as SDL does.
    pub fn send_feature_report(self: Device, data: []const u8) Error!usize {
        if (data.len == 0) return error.InvalidArgument;
        const request = ioc_readwrite('H', 0x06, data.len);
        var attempt: usize = 0;
        while (true) : (attempt += 1) {
            const rc = linux.ioctl(self.fd, request, @intFromPtr(data.ptr));
            if (linux.errno(rc) == .PIPE and attempt + 1 < send_retries) continue;
            return check(rc);
        }
    }

    /// Reads a feature report into `buf`, where `buf[0]` is the report ID to
    /// request. Returns the number of bytes stored, including the ID.
    ///
    /// Bluetooth Steam controllers need a repair: older BlueZ omits the report ID
    /// from the reply, and newer BlueZ repeats it. The repair moves the data so
    /// that exactly one copy of the ID precedes the payload.
    pub fn get_feature_report(self: Device, buf: []u8) Error!usize {
        if (buf.len == 0) return error.InvalidArgument;
        const report = buf[0];
        const request = ioc_readwrite('H', 0x07, buf.len);
        const rc = try check(linux.ioctl(self.fd, request, @intFromPtr(buf.ptr)));
        var count: usize = @min(rc, buf.len);
        if (self.needs_ble_hack and count >= 2) {
            if (buf[0] == report and buf[1] == report) {
                std.mem.copyForwards(u8, buf[0 .. count - 1], buf[1..count]);
                // Deliberate difference: SDL keeps the old length here, which
                // reports one stale trailing byte. The duplicate ID is dropped.
                count -= 1;
            } else if (buf[0] != report and count < buf.len) {
                std.mem.copyBackwards(u8, buf[1 .. count + 1], buf[0..count]);
                buf[0] = report;
                count += 1;
            }
        }
        return count;
    }

    /// Reads the current input report, with `buf[0]` as the report ID.
    pub fn get_input_report(self: Device, buf: []u8) Error!usize {
        if (buf.len == 0) return error.InvalidArgument;
        const request = ioc_readwrite('H', 0x0a, buf.len);
        return check(linux.ioctl(self.fd, request, @intFromPtr(buf.ptr)));
    }

    /// Device records (one per HID usage collection) read from sysfs for this
    /// node. The caller frees the slice with `sysfs.free_device_infos`.
    pub fn info(self: Device, allocator: Allocator, options: filter.Options) Error![]sysfs.DeviceInfo {
        const node = std.fs.path.basename(self.path);
        return sysfs.info_for_node(allocator, node, options);
    }
};

/// BLE repair applies only to Bluetooth devices from Valve (vendor 0x28de).
/// Returns false when the kernel does not answer HIDIOCGRAWINFO.
fn needs_ble_hack(fd: i32) bool {
    var record: RawInfoRecord = @splat(0);
    _ = check(linux.ioctl(fd, hidiocgrawinfo, @intFromPtr(&record))) catch return false;
    const bus = std.mem.readInt(u32, record[0..4], native_endian);
    const vendor: u16 = @bitCast(std.mem.readInt(i16, record[4..6], native_endian));
    return bus == 0x05 and vendor == 0x28de;
}
