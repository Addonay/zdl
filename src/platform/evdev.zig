//! Linux evdev readers shared by direct-display input backends.
//!
//! This uses the kernel's input_event stream and no libudev dependency. Device
//! discovery is explicit to the caller's std.Io context; inaccessible or
//! disappearing nodes are skipped. Event timestamps are carried only as raw
//! input data: the platform stamps public events with its own monotonic clock.
const std = @import("std");

const ev_syn: u16 = 0;
const ev_key: u16 = 1;
const ev_rel: u16 = 2;
const ev_abs: u16 = 3;
const syn_dropped: u16 = 3;
const max_events = 1024;
pub const max_devices = 64;
const events_per_read = 16;

/// Normalized subset of Linux input_event types used by the platform layer.
pub const Type = enum { sync, key, relative, absolute, other };

/// One copied event. `value` retains kernel semantics (0/1/2 for key up/down/repeat).
pub const Event = struct { type: Type, code: u16, value: i32 };

/// Errors from explicit input-device setup. Missing directories or denied nodes
/// are ordinary absence and are skipped by `open_all`/`open_paths`.
pub const Error = std.mem.Allocator.Error;

const InputEvent = extern struct {
    seconds: isize,
    microseconds: isize,
    kind: u16,
    code: u16,
    value: i32,
};

const Device = struct {
    fd: std.posix.fd_t,
    carry: [@sizeOf(InputEvent)]u8 = undefined,
    carry_len: usize = 0,
};

/// Owns a bounded list of nonblocking event nodes and a scratch batch. It does
/// not grab devices, request exclusive access or start a polling thread.
pub const Input = struct {
    allocator: std.mem.Allocator,
    devices: std.ArrayList(Device) = .empty,
    buffer: [max_events]Event = undefined,
    event_count: usize = 0,

    /// Opens every accessible `/dev/input/eventN` node. The directory is read
    /// with `io`; inaccessible nodes are ignored as in SDL's evdev startup.
    pub fn open_all(allocator: std.mem.Allocator, io: std.Io) Error!Input {
        var input: Input = .{ .allocator = allocator };
        errdefer input.deinit();
        var directory = std.Io.Dir.cwd().openDir(io, "/dev/input", .{ .iterate = true }) catch return input;
        defer directory.close(io);
        var iterator = directory.iterate();
        while (iterator.next(io) catch null) |entry| {
            if (!std.mem.startsWith(u8, entry.name, "event")) continue;
            if (input.devices.items.len == max_devices) break;
            var path: std.ArrayList(u8) = .empty;
            defer path.deinit(allocator);
            path.appendSlice(allocator, "/dev/input/") catch return error.OutOfMemory;
            path.appendSlice(allocator, entry.name) catch return error.OutOfMemory;
            try input.try_add_path(path.items);
        }
        return input;
    }

    /// Opens the caller-selected nodes, useful for restricted device managers
    /// and tests. Individual path failures are skipped; only allocation fails.
    pub fn open_paths(allocator: std.mem.Allocator, paths: []const []const u8) Error!Input {
        var input: Input = .{ .allocator = allocator };
        errdefer input.deinit();
        for (paths) |path| {
            if (input.devices.items.len == max_devices) break;
            try input.try_add_path(path);
        }
        return input;
    }

    /// Nonblocking read from each device, returning an internal borrowed batch.
    /// The slice is valid until the next `poll` or `deinit`.
    pub fn poll(self: *Input) []const Event {
        self.event_count = 0;
        var device_index: usize = 0;
        while (device_index < self.devices.items.len) {
            const device = &self.devices.items[device_index];
            var bytes: [@sizeOf(InputEvent) * events_per_read]u8 = undefined;
            const count = std.posix.read(device.fd, &bytes) catch |err| switch (err) {
                error.WouldBlock => {
                    device_index += 1;
                    continue;
                },
                else => {
                    _ = std.c.close(device.fd);
                    _ = self.devices.orderedRemove(device_index);
                    continue;
                },
            };
            if (count == 0) {
                _ = std.c.close(device.fd);
                _ = self.devices.orderedRemove(device_index);
                continue;
            }
            var offset: usize = 0;
            if (device.carry_len != 0) {
                const missing = device.carry.len - device.carry_len;
                const take = @min(missing, count);
                @memcpy(device.carry[device.carry_len..][0..take], bytes[0..take]);
                device.carry_len += take;
                offset += take;
                if (device.carry_len == device.carry.len) {
                    var decoded: InputEvent = undefined;
                    @memcpy(std.mem.asBytes(&decoded), &device.carry);
                    self.append_event(decoded);
                    device.carry_len = 0;
                }
            }
            while (offset + @sizeOf(InputEvent) <= count) : (offset += @sizeOf(InputEvent)) {
                if (self.event_count < self.buffer.len) {
                    var decoded: InputEvent = undefined;
                    @memcpy(std.mem.asBytes(&decoded), bytes[offset..][0..@sizeOf(InputEvent)]);
                    self.append_event(decoded);
                }
            }
            const remainder = count - offset;
            if (remainder > 0 and remainder <= device.carry.len) {
                @memcpy(device.carry[0..remainder], bytes[offset..count]);
                device.carry_len = remainder;
            }
            device_index += 1;
        }
        return self.buffer[0..self.event_count];
    }

    /// Adds this reader's descriptors to a poll set. Returns the number written.
    pub fn append_pollfds(self: *const Input, out: []std.posix.pollfd) usize {
        const count = @min(out.len, self.devices.items.len);
        for (self.devices.items[0..count], out[0..count]) |device, *pollfd| {
            pollfd.* = .{ .fd = device.fd, .events = std.posix.POLL.IN, .revents = 0 };
        }
        return count;
    }

    /// Releases every opened node and list storage.
    pub fn deinit(self: *Input) void {
        for (self.devices.items) |device| _ = std.c.close(device.fd);
        self.devices.deinit(self.allocator);
        self.* = undefined;
    }

    fn try_add_path(self: *Input, path: []const u8) Error!void {
        const terminated = self.allocator.dupeSentinel(u8, path, 0) catch return error.OutOfMemory;
        defer self.allocator.free(terminated);
        const fd = std.posix.openatZ(std.posix.AT.FDCWD, terminated, .{ .ACCMODE = .RDONLY, .CLOEXEC = true, .NONBLOCK = true }, 0) catch return;
        errdefer _ = std.c.close(fd);
        self.devices.append(self.allocator, .{ .fd = fd }) catch return error.OutOfMemory;
    }

    fn append_event(self: *Input, raw: InputEvent) void {
        if (self.event_count == self.buffer.len) return;
        const kind: Type = switch (raw.kind) {
            ev_syn => .sync,
            ev_key => .key,
            ev_rel => .relative,
            ev_abs => .absolute,
            else => .other,
        };
        self.buffer[self.event_count] = .{ .type = kind, .code = raw.code, .value = raw.value };
        self.event_count += 1;
    }
};

comptime {
    if (@sizeOf(InputEvent) != 2 * @sizeOf(isize) + 8) @compileError("Linux input_event layout mismatch");
}
