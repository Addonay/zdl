//! Linux evdev readers shared by direct-display input backends.
//!
//! This uses the kernel's input_event stream and no libudev dependency. Device
//! discovery is explicit to the caller's std.Io context; inaccessible or
//! disappearing nodes are skipped. Event timestamps are carried only as raw
//! input data: the platform stamps public events with its own monotonic clock.
//!
//! Each device keeps the key and button state its events have reported, so
//! that resynchronization changes only what differs from the device. SYN_DROPPED
//! starts a resynchronization: the records up to the next SYN_REPORT are
//! discarded because the kernel lost them, and the device's EVIOCGKEY snapshot
//! is then reconciled with the reported state through synthesized key events.
const std = @import("std");
const linux = std.os.linux;

const ev_syn: u16 = 0;
const ev_key: u16 = 1;
const ev_rel: u16 = 2;
const ev_abs: u16 = 3;
const syn_report: u16 = 0;
const syn_dropped: u16 = 3;
const key_max: u16 = 0x2ff;
/// Keys and buttons share one bitmap, codes 0 through `key_max`.
const key_codes = @as(usize, key_max) + 1;
const key_bytes = key_codes / 8;
const max_events = 1024;
pub const max_devices = 64;
const events_per_read = 16;

/// Normalized subset of Linux input_event types used by the platform layer.
/// `dropped` marks a SYN_DROPPED: the packet in progress is incomplete.
pub const Type = enum { sync, key, relative, absolute, other, dropped };

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

const KeyBits = [key_bytes]u8;

/// Bounded scratch batch. Callers keep `len` below `max_events`.
const Batch = struct {
    items: [max_events]Event = undefined,
    len: usize = 0,

    fn push(self: *Batch, event: Event) void {
        std.debug.assert(self.len < self.items.len);
        self.items[self.len] = event;
        self.len += 1;
    }

    fn space(self: *const Batch) usize {
        return self.items.len - self.len;
    }

    fn slice(self: *const Batch) []const Event {
        return self.items[0..self.len];
    }
};

const Device = struct {
    fd: std.posix.fd_t,
    carry: [@sizeOf(InputEvent)]u8 = undefined,
    carry_len: usize = 0,
    /// Key and button state as reported through the events, so that a
    /// resynchronization reports only the differences.
    keys: KeyBits = @splat(0),
    /// Set by SYN_DROPPED. Records are discarded until the next SYN_REPORT.
    dropped: bool = false,
    /// A drop has ended, so the device's key state must be read again.
    resync_needed: bool = false,
};

/// Owns a bounded list of nonblocking event nodes and a scratch batch. It does
/// not grab devices, request exclusive access or start a polling thread.
pub const Input = struct {
    allocator: std.mem.Allocator,
    devices: std.ArrayList(Device) = .empty,
    batch: Batch = .{},

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
    /// The slice is valid until the next call that reads, `resynchronize_device`
    /// or `deinit`. A device whose records do not fit is left for the next call.
    pub fn poll(self: *Input) []const Event {
        self.batch.len = 0;
        var device_index: usize = 0;
        while (device_index < self.devices.items.len) {
            if (self.batch.space() < events_per_read + 1) break;
            const device = &self.devices.items[device_index];
            var bytes: [@sizeOf(InputEvent) * events_per_read]u8 = undefined;
            const count = std.posix.read(device.fd, &bytes) catch |err| switch (err) {
                error.WouldBlock => {
                    device_index += 1;
                    continue;
                },
                else => {
                    self.close_device(device_index);
                    continue;
                },
            };
            if (count == 0) {
                self.close_device(device_index);
                continue;
            }
            feed_bytes(device, &self.batch, bytes[0..count]);
            // The key snapshot needs room for a full resynchronization. If there
            // is none, it is taken by a later call and the state stays flagged.
            if (device.resync_needed and self.batch.space() >= key_codes) reconcile_device(device, &self.batch);
            device_index += 1;
        }
        return self.batch.slice();
    }

    /// Number of open devices. `resynchronize_device` takes an index below this.
    pub fn device_count(self: *const Input) usize {
        return self.devices.items.len;
    }

    /// Reconciles one device's key state with the kernel and returns the key
    /// events that changed it. Used when the session is reacquired, after the
    /// consumer released every key with `reset_keys`, so that keys still held
    /// are reported as pressed. The slice is borrowed until the next call.
    pub fn resynchronize_device(self: *Input, index: usize) []const Event {
        self.batch.len = 0;
        reconcile_device(&self.devices.items[index], &self.batch);
        return self.batch.slice();
    }

    /// Forgets the key state reported so far. Call after the consumer releases
    /// every key, so that the next resynchronization reports what is still held.
    pub fn reset_keys(self: *Input) void {
        for (self.devices.items) |*device| device.keys = @splat(0);
    }

    /// Reads and drops every pending record on every device without publishing
    /// anything. Used while the session is inactive, so that input from that time
    /// is not delivered afterwards. Partial records and drop state are cleared.
    pub fn discard(self: *Input) void {
        var device_index: usize = 0;
        while (device_index < self.devices.items.len) {
            if (drain(&self.devices.items[device_index])) {
                device_index += 1;
            } else {
                self.close_device(device_index);
            }
        }
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

    fn close_device(self: *Input, index: usize) void {
        _ = std.c.close(self.devices.items[index].fd);
        _ = self.devices.orderedRemove(index);
    }

    fn try_add_path(self: *Input, path: []const u8) Error!void {
        const terminated = self.allocator.dupeSentinel(u8, path, 0) catch return error.OutOfMemory;
        defer self.allocator.free(terminated);
        const fd = std.posix.openatZ(std.posix.AT.FDCWD, terminated, .{ .ACCMODE = .RDONLY, .CLOEXEC = true, .NONBLOCK = true }, 0) catch return;
        errdefer _ = std.c.close(fd);
        self.devices.append(self.allocator, .{ .fd = fd }) catch return error.OutOfMemory;
    }
};

/// Reads everything pending from one device. Returns false when the node has
/// gone away and should be closed.
fn drain(device: *Device) bool {
    device.carry_len = 0;
    device.dropped = false;
    device.resync_needed = false;
    var bytes: [@sizeOf(InputEvent) * events_per_read]u8 = undefined;
    while (true) {
        const count = std.posix.read(device.fd, &bytes) catch |err| return err == error.WouldBlock;
        if (count == 0) return false;
    }
}

/// Splits raw bytes into input_event records, carrying a partial record over to
/// the next read, and feeds each record through `feed`.
fn feed_bytes(device: *Device, batch: *Batch, bytes: []const u8) void {
    var offset: usize = 0;
    if (device.carry_len != 0) {
        const take = @min(device.carry.len - device.carry_len, bytes.len);
        @memcpy(device.carry[device.carry_len..][0..take], bytes[0..take]);
        device.carry_len += take;
        offset += take;
        if (device.carry_len == device.carry.len) {
            var raw: InputEvent = undefined;
            @memcpy(std.mem.asBytes(&raw), &device.carry);
            feed(device, raw, batch);
            device.carry_len = 0;
        }
    }
    while (offset + @sizeOf(InputEvent) <= bytes.len) : (offset += @sizeOf(InputEvent)) {
        var raw: InputEvent = undefined;
        @memcpy(std.mem.asBytes(&raw), bytes[offset..][0..@sizeOf(InputEvent)]);
        feed(device, raw, batch);
    }
    const remainder = bytes.len - offset;
    if (remainder > 0) {
        @memcpy(device.carry[0..remainder], bytes[offset..]);
        device.carry_len = remainder;
    }
}

/// Applies one kernel record to a device's stream state and appends what the
/// consumer should see. Records from SYN_DROPPED up to the next SYN_REPORT are
/// discarded because the packet is incomplete; the report then requests a key
/// resynchronization.
fn feed(device: *Device, raw: InputEvent, batch: *Batch) void {
    if (raw.kind == ev_syn and raw.code == syn_dropped) {
        device.dropped = true;
        batch.push(.{ .type = .dropped, .code = raw.code, .value = raw.value });
        return;
    }
    if (device.dropped) {
        if (raw.kind == ev_syn and raw.code == syn_report) {
            device.dropped = false;
            device.resync_needed = true;
        }
        return;
    }
    if (raw.kind == ev_key and raw.code <= key_max) set_key(&device.keys, raw.code, raw.value != 0);
    batch.push(classify(raw));
}

fn classify(raw: InputEvent) Event {
    const kind: Type = switch (raw.kind) {
        ev_syn => .sync,
        ev_key => .key,
        ev_rel => .relative,
        ev_abs => .absolute,
        else => .other,
    };
    return .{ .type = kind, .code = raw.code, .value = raw.value };
}

/// Reads the device's key state (EVIOCGKEY) and reconciles it with the reported
/// state. A failed read leaves the resynchronization pending for the next call.
fn reconcile_device(device: *Device, batch: *Batch) void {
    const snapshot = read_key_state(device.fd) orelse return;
    device.resync_needed = false;
    reconcile_keys(device, &snapshot, batch);
}

/// Appends the key and button events that bring the reported state to `snapshot`.
fn reconcile_keys(device: *Device, snapshot: *const KeyBits, batch: *Batch) void {
    var code: u16 = 0;
    while (code < key_codes) : (code += 1) {
        const down = key_is_set(snapshot, code);
        if (down == key_is_set(&device.keys, code)) continue;
        set_key(&device.keys, code, down);
        batch.push(.{ .type = .key, .code = code, .value = @intFromBool(down) });
    }
}

/// EVIOCGKEY: the device's current key and button bitmap, `_IOR('E', 0x18, ...)`.
fn read_key_state(fd: std.posix.fd_t) ?KeyBits {
    const request: u32 = (2 << 30) | (@as(u32, key_bytes) << 16) | (@as(u32, 'E') << 8) | 0x18;
    var bits: KeyBits = @splat(0);
    while (true) {
        const rc = linux.ioctl(fd, request, @intFromPtr(&bits));
        switch (linux.errno(rc)) {
            .SUCCESS => return bits,
            .INTR => continue,
            else => return null,
        }
    }
}

fn key_is_set(bits: *const KeyBits, code: u16) bool {
    return bits[code / 8] & (@as(u8, 1) << @intCast(code % 8)) != 0;
}

fn set_key(bits: *KeyBits, code: u16, down: bool) void {
    const mask = @as(u8, 1) << @intCast(code % 8);
    if (down) bits[code / 8] |= mask else bits[code / 8] &= ~mask;
}

/// Relative motion gathered between SYN_REPORT records. Wheel values are in
/// the kernel's sign convention, positive up and right, and are forwarded as
/// they are.
pub const Motion = struct {
    dx: f32 = 0,
    dy: f32 = 0,
    /// Detent counts from REL_HWHEEL and REL_WHEEL.
    wheel_x: f32 = 0,
    wheel_y: f32 = 0,
    /// High-resolution counts from REL_HWHEEL_HI_RES and REL_WHEEL_HI_RES, in
    /// units of 1/120 of a detent.
    high_res_x: f32 = 0,
    high_res_y: f32 = 0,
    has_high_res_x: bool = false,
    has_high_res_y: bool = false,

    /// Accumulates one relative-axis record. Other codes are ignored.
    pub fn add(self: *Motion, code: u16, value: i32) void {
        const amount: f32 = @floatFromInt(value);
        switch (code) {
            0 => self.dx += amount, // REL_X
            1 => self.dy += amount, // REL_Y
            6 => self.wheel_x += amount, // REL_HWHEEL
            8 => self.wheel_y += amount, // REL_WHEEL
            11 => { // REL_WHEEL_HI_RES
                self.high_res_y += amount / 120.0;
                self.has_high_res_y = true;
            },
            12 => { // REL_HWHEEL_HI_RES
                self.high_res_x += amount / 120.0;
                self.has_high_res_x = true;
            },
            else => {},
        }
    }

    /// Scroll ticks with positive x right and positive y up. High-resolution
    /// values replace the detent counts on an axis that reports them.
    pub fn scroll(self: Motion) struct { x: f32, y: f32 } {
        return .{
            .x = if (self.has_high_res_x) self.high_res_x else self.wheel_x,
            .y = if (self.has_high_res_y) self.high_res_y else self.wheel_y,
        };
    }
};

fn input_record(kind: u16, code: u16, value: i32) InputEvent {
    return .{ .seconds = 0, .microseconds = 0, .kind = kind, .code = code, .value = value };
}

test "SYN_DROPPED discards the lost packet and reconciles keys from the snapshot" {
    var device: Device = .{ .fd = -1 };
    var batch: Batch = .{};
    feed(&device, input_record(ev_key, 30, 1), &batch);
    feed(&device, input_record(ev_syn, syn_dropped, 0), &batch);
    // Lost in the drop: the release of 30, the press of 31 and the motion.
    feed(&device, input_record(ev_key, 30, 0), &batch);
    feed(&device, input_record(ev_key, 31, 1), &batch);
    feed(&device, input_record(ev_rel, 0, 5), &batch);
    try std.testing.expectEqual(@as(usize, 2), batch.len);
    try std.testing.expectEqual(Type.dropped, batch.items[1].type);
    try std.testing.expect(!device.resync_needed);

    feed(&device, input_record(ev_syn, syn_report, 0), &batch);
    try std.testing.expectEqual(@as(usize, 2), batch.len);
    try std.testing.expect(device.resync_needed);

    // The kernel now reports 31 held and 30 released.
    var snapshot: KeyBits = @splat(0);
    set_key(&snapshot, 31, true);
    reconcile_keys(&device, &snapshot, &batch);
    try std.testing.expectEqual(@as(usize, 4), batch.len);
    try std.testing.expectEqual(Event{ .type = .key, .code = 30, .value = 0 }, batch.items[2]);
    try std.testing.expectEqual(Event{ .type = .key, .code = 31, .value = 1 }, batch.items[3]);
    try std.testing.expect(!key_is_set(&device.keys, 30));
    try std.testing.expect(key_is_set(&device.keys, 31));

    // A second reconciliation against the same snapshot changes nothing.
    reconcile_keys(&device, &snapshot, &batch);
    try std.testing.expectEqual(@as(usize, 4), batch.len);
}

test "partial input_event records are carried across reads" {
    var device: Device = .{ .fd = -1 };
    var batch: Batch = .{};
    var bytes: [2 * @sizeOf(InputEvent)]u8 = undefined;
    @memcpy(bytes[0..@sizeOf(InputEvent)], std.mem.asBytes(&input_record(ev_key, 30, 1)));
    @memcpy(bytes[@sizeOf(InputEvent)..], std.mem.asBytes(&input_record(ev_rel, 8, -1)));
    feed_bytes(&device, &batch, bytes[0 .. @sizeOf(InputEvent) + 6]);
    try std.testing.expectEqual(@as(usize, 1), batch.len);
    feed_bytes(&device, &batch, bytes[@sizeOf(InputEvent) + 6 ..]);
    try std.testing.expectEqual(@as(usize, 2), batch.len);
    try std.testing.expectEqual(Event{ .type = .relative, .code = 8, .value = -1 }, batch.items[1]);
}

test "wheel values keep the kernel sign, with high-resolution precedence" {
    var up: Motion = .{};
    up.add(8, 1); // REL_WHEEL, one detent up
    try std.testing.expectEqual(@as(f32, 1), up.scroll().y);

    var down: Motion = .{};
    down.add(8, -1);
    try std.testing.expectEqual(@as(f32, -1), down.scroll().y);

    var high_res: Motion = .{};
    high_res.add(11, 120); // REL_WHEEL_HI_RES, one detent up
    high_res.add(8, 1); // the detent count of the same movement is ignored
    try std.testing.expectEqual(@as(f32, 1), high_res.scroll().y);

    var sideways: Motion = .{};
    sideways.add(6, 2); // REL_HWHEEL, right
    sideways.add(12, -60); // REL_HWHEEL_HI_RES, half a detent left
    try std.testing.expectEqual(@as(f32, -0.5), sideways.scroll().x);
}

comptime {
    if (@sizeOf(InputEvent) != 2 * @sizeOf(isize) + 8) @compileError("Linux input_event layout mismatch");
}
