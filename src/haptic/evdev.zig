//! Linux evdev force-feedback backend for haptic devices.
//!
//! Devices are `/dev/input/eventN` nodes that advertise `EV_FF` capabilities.
//! Effects are uploaded with the EVIOCSFF ioctl, played by writing `EV_FF`
//! records to the device, and removed with EVIOCRMFF. Kernel records are encoded
//! into byte buffers at the offsets below, following `<linux/input.h>`, so this
//! module declares no foreign-layout structs and performs no C calls.
//!
//! Offsets assume the native word size: `struct ff_effect` is 48 bytes on 64-bit
//! targets and 44 bytes on 32-bit targets, and `struct input_event` is 24 or 16
//! bytes. Both layouts were derived from the header and checked against the
//! kernel's sizeof(struct ff_effect) for x86_64.
//!
//! Altered native port of SDL's linux/SDL_syshaptic.c and the device layer of
//! SDL_haptic.c. Deliberate differences from SDL are listed on each function.

const std = @import("std");
const builtin = @import("builtin");
const linux = std.os.linux;
const effect_mod = @import("effect.zig");

const Allocator = std.mem.Allocator;
const Effect = effect_mod.Effect;
const Features = effect_mod.Features;
const Direction = effect_mod.Direction;
const Kind = effect_mod.Kind;
const Envelope = effect_mod.Envelope;

const native_endian = builtin.target.cpu.arch.endian();
const word_size = @sizeOf(usize);

/// Error set for device operations. Syscall errnos are mapped to these names;
/// the module keeps no thread-local last-error state.
pub const Error = Allocator.Error || effect_mod.Custom.Error || error{
    /// Device node exists but the process may not open or control it.
    PermissionDenied,
    /// Device disappeared or is not a character device node.
    DeviceUnavailable,
    /// Kernel rejected a request for an unspecified I/O reason.
    Io,
    /// The file is not an evdev node with force-feedback capabilities.
    NotHaptic,
    /// The device lacks the capability required by the request.
    Unsupported,
    /// The kernel refused the effect parameters.
    InvalidEffect,
    /// The effect slot is empty or outside the device's effect table.
    InvalidEffectId,
    /// A percentage or other scalar argument is out of range.
    InvalidParameter,
    /// The device has no free effect slots or no room in its playback table.
    NoFreeSlots,
    /// An update tried to change an effect's type; SDL forbids this too.
    TypeMismatch,
    /// The path does not fit in a NUL-terminated buffer.
    NameTooLong,
};

// ---- Kernel constants (<linux/input-event-codes.h>, <linux/input.h>) ----

const ev_key: u16 = 0x01;
const ev_ff: u16 = 0x15;
const btn_mouse: u16 = 0x110;
const btn_gamepad: u16 = 0x130;
const ff_gain: u16 = 0x60;
const ff_autocenter: u16 = 0x61;
const ff_max: u16 = 0x7f;

const ff_rumble: u16 = 0x50;
const ff_periodic: u16 = 0x51;
const ff_constant: u16 = 0x52;
const ff_spring: u16 = 0x53;
const ff_friction: u16 = 0x54;
const ff_damper: u16 = 0x55;
const ff_inertia: u16 = 0x56;
const ff_ramp: u16 = 0x57;
const ff_square: u16 = 0x58;
const ff_triangle: u16 = 0x59;
const ff_sine: u16 = 0x5a;
const ff_saw_up: u16 = 0x5b;
const ff_saw_down: u16 = 0x5c;

/// Kernel clamps replay and envelope fields with SDL's CLAMP, which caps at
/// 32767 (not 65535). Reproduced exactly so durations match SDL.
const linux_clamp_max: u32 = 32767;

/// Bytes of the EV_FF capability bitmap: FF_MAX bits (0x7f) need 16 bytes.
const ff_bitmap_bytes = 16;
/// Bytes of the EV_KEY bitmap, large enough for KEY_MAX (0x2ff).
const key_bitmap_bytes = 96;
const name_buf_len = 128;

/// Size of `struct ff_effect` for the native word size.
const ff_effect_size: usize = if (word_size == 8) 48 else 44;
const ff_union_offset = 16;

// ff_effect field offsets relative to the start of the record.
const off_type = 0;
const off_id = 2;
const off_direction = 4;
const off_trigger_button = 6;
const off_trigger_interval = 8;
const off_replay_length = 10;
const off_replay_delay = 12;
const off_union = ff_union_offset;

// Union members, relative to `off_union`.
const off_constant_level = off_union + 0;
const off_constant_envelope = off_union + 2;
const off_ramp_start = off_union + 0;
const off_ramp_end = off_union + 2;
const off_ramp_envelope = off_union + 4;
const off_periodic_waveform = off_union + 0;
const off_periodic_period = off_union + 2;
const off_periodic_magnitude = off_union + 4;
const off_periodic_offset = off_union + 6;
const off_periodic_phase = off_union + 8;
const off_periodic_envelope = off_union + 10;
const off_periodic_custom_len = off_union + 20;
const off_periodic_custom_data = off_union + 24;
/// `condition[2]` stores one 12-byte record per axis, starting at the union.
const condition_axis_size = 12;
const off_rumble_strong = off_union + 0;
const off_rumble_weak = off_union + 2;

/// Envelope layout: attack_length, attack_level, fade_length, fade_level.
const envelope_size = 8;

// ---- ioctl request encoding (asm-generic layout used on Linux targets) ----

/// `_IOR(type, nr, size)`. Built from std's IOCTL.IOR so the direction bits
/// follow the target's encoding, then the runtime payload size is OR-ed in.
fn ioc_read(io_type: u8, nr: u8, size: usize) u32 {
    return linux.IOCTL.IOR(io_type, nr, [0]u8) | (@as(u32, @intCast(size)) << 16);
}

/// `_IOW(type, nr, size)`, built the same way as `ioc_read`.
fn ioc_write(io_type: u8, nr: u8, size: usize) u32 {
    return linux.IOCTL.IOW(io_type, nr, [0]u8) | (@as(u32, @intCast(size)) << 16);
}

/// EVIOCGBIT(ev, len): read the capability bitmap for event type `ev`.
fn eviocgbit(ev: u16, len: usize) u32 {
    return ioc_read('E', @intCast(0x20 + ev), len);
}

const eviocgname = ioc_read('E', 0x06, name_buf_len);
const eviocgeffects = linux.IOCTL.IOR('E', 0x84, i32);
const eviocsff = ioc_write('E', 0x80, ff_effect_size);
const eviocrmff = linux.IOCTL.IOW('E', 0x81, i32);

// ---- Syscall helpers ----

fn map_errno(e: linux.E) Error {
    return switch (e) {
        .ACCES, .PERM => error.PermissionDenied,
        .NOENT, .NODEV, .NXIO => error.DeviceUnavailable,
        .NOMEM => error.OutOfMemory,
        .NOSPC => error.NoFreeSlots,
        .INVAL => error.InvalidEffect,
        .NOTTY => error.NotHaptic,
        else => error.Io,
    };
}

/// Converts a raw syscall result into an unsigned count or an errno-derived error.
fn check(rc: usize) Error!usize {
    const e = linux.errno(rc);
    if (e != .SUCCESS) return map_errno(e);
    return rc;
}

fn open_path(path: []const u8, flags: linux.O) Error!i32 {
    const z = std.posix.toPosixPath(path) catch return error.NameTooLong;
    const fd = try check(linux.open(&z, flags, 0));
    return @intCast(fd);
}

fn close_fd(fd: i32) void {
    _ = linux.close(fd);
}

// ---- Bitmaps and capability queries ----

/// Tests bit `n` of a kernel bitmap. Bitmaps are little-endian byte arrays on
/// the Linux targets this backend supports, so bit `n` lives in byte `n / 8`.
fn has_bit(bitmap: []const u8, n: usize) bool {
    const byte = n / 8;
    if (byte >= bitmap.len) return false;
    return (bitmap[byte] >> @intCast(n % 8)) & 1 != 0;
}

/// Maps the EV_FF capability bitmap onto SDL_HAPTIC_* features.
///
/// Deliberate difference: SDL also maps FF_CUSTOM to SDL_HAPTIC_CUSTOM, but the
/// kernel reports that bit as a periodic waveform and this backend cannot
/// upload samples to it, so custom effects are not advertised.
fn query_features(fd: i32) Error!Features {
    var bitmap: [ff_bitmap_bytes]u8 = @splat(0);
    _ = try check(linux.ioctl(fd, eviocgbit(ev_ff, bitmap.len), @intFromPtr(&bitmap)));

    const table = [_]struct { code: u16, feature: Features }{
        .{ .code = ff_constant, .feature = .{ .constant = true } },
        .{ .code = ff_sine, .feature = .{ .sine = true } },
        .{ .code = ff_square, .feature = .{ .square = true } },
        .{ .code = ff_triangle, .feature = .{ .triangle = true } },
        .{ .code = ff_saw_up, .feature = .{ .saw_up = true } },
        .{ .code = ff_saw_down, .feature = .{ .saw_down = true } },
        .{ .code = ff_ramp, .feature = .{ .ramp = true } },
        .{ .code = ff_spring, .feature = .{ .spring = true } },
        .{ .code = ff_damper, .feature = .{ .damper = true } },
        .{ .code = ff_inertia, .feature = .{ .inertia = true } },
        .{ .code = ff_friction, .feature = .{ .friction = true } },
        .{ .code = ff_gain, .feature = .{ .gain = true } },
        .{ .code = ff_autocenter, .feature = .{ .autocenter = true } },
        .{ .code = ff_rumble, .feature = .{ .left_right = true } },
    };
    var result: Features = .none;
    for (table) |entry| {
        if (has_bit(&bitmap, entry.code)) result = result.either(entry.feature);
    }
    return result;
}

/// True when the device reports a left mouse button (BTN_MOUSE) in EV_KEY.
///
/// Deliberate difference: SDL's EV_IsMouse returns true for every device,
/// because both branches of its BTN_MOUSE test return true. This port reports
/// only devices that really expose BTN_MOUSE.
fn query_is_mouse(fd: i32) bool {
    var bitmap: [key_bitmap_bytes]u8 = @splat(0);
    _ = check(linux.ioctl(fd, eviocgbit(ev_key, bitmap.len), @intFromPtr(&bitmap))) catch return false;
    return has_bit(&bitmap, btn_mouse);
}

/// Reads the evdev product name, falling back to `fallback` (the node path)
/// when the driver reports none.
fn read_name(allocator: Allocator, fd: i32, fallback: []const u8) Allocator.Error![]u8 {
    var buf: [name_buf_len]u8 = @splat(0);
    if (check(linux.ioctl(fd, eviocgname, @intFromPtr(&buf)))) |_| {
        const text = std.mem.sliceTo(&buf, 0);
        if (text.len != 0) return allocator.dupe(u8, text);
    } else |_| {}
    return allocator.dupe(u8, fallback);
}

// ---- Direction conversion (SDL_SYS_ToDirection) ----

/// Converts an angle in hundredths of a degree to the kernel's 16-bit scale,
/// where 0x0000 is a full turn of 0 degrees and 0x8000 is 180 degrees.
/// Divisions truncate toward zero as in C.
fn angle_to_kernel(angle: i64) u16 {
    const wrapped = @rem(angle, 36000);
    const scaled = @divTrunc(wrapped * 0x8000, 18000);
    return @truncate(@as(u64, @bitCast(scaled)));
}

/// Cartesian components to kernel direction. Axis-aligned cases avoid atan2,
/// and the general case uses float atan2 as SDL does.
fn cartesian_to_kernel(x: i32, y: i32) u16 {
    if (y == 0) return if (x >= 0) 0x4000 else 0xC000;
    if (x == 0) return if (y >= 0) 0x8000 else 0;
    const radians: f32 = std.math.atan2(@as(f32, @floatFromInt(y)), @as(f32, @floatFromInt(x)));
    // Hundredths of a degree, shifted so the result is positive before wrapping.
    const hundredths: i64 = @intFromFloat(@as(f64, radians) * 18000.0 / std.math.pi);
    return angle_to_kernel(hundredths + 45000);
}

/// Converts an SDL direction to the kernel's 16-bit direction field.
///
/// Confirmed upstream defect: SDL computes the spherical case as
/// `tmp = (dir + 9000) % 36000` into a Uint32 and then divides in unsigned
/// arithmetic, so negative angles produce unrelated values. This port performs
/// the same modular conversion in signed 64-bit arithmetic for every angle.
pub fn kernel_direction(direction: Direction) u16 {
    return switch (direction) {
        .polar => |angle| angle_to_kernel(angle),
        .spherical => |dir| angle_to_kernel(@as(i64, dir[0]) + 9000),
        .cartesian => |dir| cartesian_to_kernel(dir[0], dir[1]),
        .steering_axis => 0x4000,
    };
}

// ---- Encoding of ff_effect records (SDL_SYS_ToFFEffect) ----

fn put(buf: []u8, comptime T: type, offset: usize, value: T) void {
    std.mem.writeInt(T, buf[offset..][0..@sizeOf(T)], value, native_endian);
}

/// Clamps to SDL's Linux limit of 32767 and narrows to the kernel's u16 field.
fn clamp_u16(value: anytype) u16 {
    const widened: u32 = @intCast(value);
    return @intCast(@min(widened, linux_clamp_max));
}

/// Button index to kernel BTN_GAMEPAD code. Zero means no trigger button.
/// Wrapping matches C's conversion to Uint16.
fn trigger_button(button: u16) u16 {
    if (button == 0) return 0;
    return btn_gamepad +% (button - 1);
}

fn put_envelope(buf: []u8, offset: usize, envelope: Envelope) void {
    put(buf, u16, offset + 0, clamp_u16(envelope.attack_length));
    put(buf, u16, offset + 2, clamp_u16(envelope.attack_level));
    put(buf, u16, offset + 4, clamp_u16(envelope.fade_length));
    put(buf, u16, offset + 6, clamp_u16(envelope.fade_level));
}

/// Writes the replay and trigger sections shared by every effect type. An
/// unlimited effect (null length) is encoded as length zero, which the kernel
/// treats as "until stopped".
fn put_timing(buf: []u8, length: ?u32, delay: u16, button: u16, interval: u16) void {
    put(buf, u16, off_replay_length, if (length) |value| clamp_u16(value) else 0);
    put(buf, u16, off_replay_delay, clamp_u16(delay));
    put(buf, u16, off_trigger_button, trigger_button(button));
    put(buf, u16, off_trigger_interval, clamp_u16(interval));
}

fn put_header(buf: []u8, ff_type: u16, id: i16, direction: u16) void {
    put(buf, u16, off_type, ff_type);
    put(buf, i16, off_id, id);
    put(buf, u16, off_direction, direction);
}

fn waveform_code(waveform: effect_mod.Waveform) u16 {
    return switch (waveform) {
        .sine => ff_sine,
        .square => ff_square,
        .triangle => ff_triangle,
        .saw_up => ff_saw_up,
        .saw_down => ff_saw_down,
    };
}

fn condition_code(kind: effect_mod.ConditionKind) u16 {
    return switch (kind) {
        .spring => ff_spring,
        .damper => ff_damper,
        .inertia => ff_inertia,
        .friction => ff_friction,
    };
}

/// Encodes an effect into a `struct ff_effect` byte image. `id` is the kernel
/// effect id; -1 asks the kernel to allocate one, and EVIOCSFF writes it back.
///
/// Deliberate difference: custom effects are rejected with `Unsupported`. SDL's
/// conversion has no FF_CUSTOM case and fails the same way, but SDL also
/// advertises the capability, so callers can only find out at upload time.
fn encode_effect(buf: *[ff_effect_size]u8, id: i16, effect: Effect) Error!void {
    @memset(buf, 0);
    switch (effect) {
        .constant => |c| {
            put_header(buf, ff_constant, id, kernel_direction(c.direction));
            put_timing(buf, c.timing.length, c.timing.delay, c.timing.button, c.timing.interval);
            put(buf, i16, off_constant_level, c.level);
            put_envelope(buf, off_constant_envelope, c.envelope);
        },
        .periodic => |p| {
            put_header(buf, ff_periodic, id, kernel_direction(p.direction));
            put_timing(buf, p.timing.length, p.timing.delay, p.timing.button, p.timing.interval);
            put(buf, u16, off_periodic_waveform, waveform_code(p.waveform));
            put(buf, u16, off_periodic_period, clamp_u16(p.period));
            put(buf, i16, off_periodic_magnitude, p.magnitude);
            put(buf, i16, off_periodic_offset, p.offset);
            // The kernel phase spans [0, 0x10000) over a full turn, so hundredths
            // of a degree are scaled by 0x10000 / 36000 and truncated to 16 bits.
            const phase: u32 = (@as(u32, p.phase) * 0x10000) / 36000;
            put(buf, u16, off_periodic_phase, @truncate(phase));
            put_envelope(buf, off_periodic_envelope, p.envelope);
            // Custom samples are not used; their fields stay zero.
            put(buf, u32, off_periodic_custom_len, 0);
        },
        .condition => |c| {
            put_header(buf, condition_code(c.kind), id, kernel_direction(c.direction));
            put_timing(buf, c.timing.length, c.timing.delay, c.timing.button, c.timing.interval);
            // The kernel has no envelope for conditions. Only the first two
            // axes exist on Linux; the third axis of `axes` is ignored.
            for (c.axes[0..2], 0..) |axis, index| {
                const base = off_union + index * condition_axis_size;
                put(buf, u16, base + 0, axis.right_saturation);
                put(buf, u16, base + 2, axis.left_saturation);
                put(buf, i16, base + 4, axis.right_coeff);
                put(buf, i16, base + 6, axis.left_coeff);
                put(buf, u16, base + 8, axis.deadband);
                put(buf, i16, base + 10, axis.center);
            }
        },
        .ramp => |r| {
            put_header(buf, ff_ramp, id, kernel_direction(r.direction));
            put_timing(buf, r.timing.length, r.timing.delay, r.timing.button, r.timing.interval);
            put(buf, i16, off_ramp_start, r.start);
            put(buf, i16, off_ramp_end, r.end);
            put_envelope(buf, off_ramp_envelope, r.envelope);
        },
        .left_right => |lr| {
            // Rumble has no direction. Kernel magnitudes span 0..65535 while SDL
            // clamps to 32767 first, so the doubled value stays within u16.
            put_header(buf, ff_rumble, id, 0x4000);
            put_timing(buf, lr.length, 0, 0, 0);
            put(buf, u16, off_rumble_strong, clamp_u16(lr.large_magnitude) * 2);
            put(buf, u16, off_rumble_weak, clamp_u16(lr.small_magnitude) * 2);
        },
        .custom => return error.Unsupported,
    }
}

/// Writes one `struct input_event` into `buf`. The kernel ignores the timestamp
/// on writes, so it stays zero.
fn encode_event(buf: *[event_size]u8, ev_type: u16, code: u16, value: i32) void {
    @memset(buf, 0);
    put(buf, u16, timeval_size + 0, ev_type);
    put(buf, u16, timeval_size + 2, code);
    put(buf, i32, timeval_size + 4, value);
}

/// `struct timeval` size: two native words. Event payload follows it.
const timeval_size = 2 * word_size;
const event_size = timeval_size + 8;

/// `ff_effect.id` of an effect in the kernel, read back after EVIOCSFF.
fn read_kernel_id(buf: *const [ff_effect_size]u8) i16 {
    return std.mem.readInt(i16, buf[off_id..][0..2], native_endian);
}

// ---- Device enumeration ----

/// A force-feedback capable input node.
pub const DeviceInfo = struct {
    /// Device node, for example "/dev/input/event5". Owned.
    path: []u8,
    /// Driver name from EVIOCGNAME, or the path when the driver reports none. Owned.
    name: []u8,
    features: Features,
    /// Whether the node exposes BTN_MOUSE. Used to find a mouse with haptics.
    is_mouse: bool,

    pub fn deinit(self: DeviceInfo, allocator: Allocator) void {
        allocator.free(self.path);
        allocator.free(self.name);
    }
};

/// Frees a slice returned by `enumerate`.
pub fn free_device_infos(allocator: Allocator, infos: []DeviceInfo) void {
    for (infos) |info| info.deinit(allocator);
    allocator.free(infos);
}

/// Opens and inspects one node. Returns null for nodes that cannot be opened
/// read-write or that have no force-feedback capability, as SDL skips them.
///
/// Deliberate difference: SDL opens at most 32 numbered nodes. This port scans
/// the directory, so higher-numbered devices are not limited.
pub fn probe(allocator: Allocator, path: []const u8) Error!?DeviceInfo {
    const fd = open_path(path, .{ .ACCMODE = .RDWR, .CLOEXEC = true }) catch return null;
    defer close_fd(fd);
    const features = query_features(fd) catch return null;
    if (features.bits() == 0) return null;
    const owned_path = try allocator.dupe(u8, path);
    errdefer allocator.free(owned_path);
    const name = try read_name(allocator, fd, path);
    errdefer allocator.free(name);
    return .{
        .path = owned_path,
        .name = name,
        .features = features,
        .is_mouse = query_is_mouse(fd),
    };
}

/// Returns force-feedback nodes under /dev/input in numeric order, as
/// `event0`, `event1`, and so on. The caller frees the slice with
/// `free_device_infos`.
pub fn enumerate(allocator: Allocator) Error![]DeviceInfo {
    var indices: std.ArrayList(u32) = .empty;
    defer indices.deinit(allocator);

    const dir_fd = try open_path("/dev/input", .{ .DIRECTORY = true, .CLOEXEC = true });
    defer close_fd(dir_fd);

    var buf: [4096]u8 align(8) = undefined;
    while (true) {
        const count = try check(linux.getdents64(dir_fd, &buf, @intCast(buf.len)));
        if (count == 0) break;
        var offset: usize = 0;
        while (offset < count) {
            const reclen = std.mem.readInt(u16, buf[offset + 16 ..][0..2], native_endian);
            const name = std.mem.sliceTo(buf[offset + 19 .. offset + reclen], 0);
            if (parse_event_index(name)) |index| try indices.append(allocator, index);
            offset += reclen;
        }
    }
    std.mem.sort(u32, indices.items, {}, std.sort.asc(u32));

    var infos: std.ArrayList(DeviceInfo) = .empty;
    errdefer {
        for (infos.items) |info| info.deinit(allocator);
        infos.deinit(allocator);
    }
    for (indices.items) |index| {
        var path_buf: [32]u8 = undefined;
        const path = std.fmt.bufPrint(&path_buf, "/dev/input/event{d}", .{index}) catch unreachable;
        if (try probe(allocator, path)) |info| try infos.append(allocator, info);
    }
    return infos.toOwnedSlice(allocator);
}

/// Parses "eventN" and returns N, or null for other directory entries.
fn parse_event_index(name: []const u8) ?u32 {
    const prefix = "event";
    if (!std.mem.startsWith(u8, name, prefix)) return null;
    const digits = name[prefix.len..];
    if (digits.len == 0) return null;
    return std.fmt.parseUnsigned(u32, digits, 10) catch null;
}

// ---- Device ----

/// Effect slot index on one device. Slot indices are local to a `Device`; they
/// are not global IDs and are reused after `destroy_effect`.
pub const EffectId = u32;

/// Kernel-side effect state kept for each slot.
const Slot = struct {
    kind: Kind,
    kernel_id: i16,
};

/// Rumble effect created by `Device.init_rumble`.
const Rumble = struct {
    id: EffectId,
    effect: Effect,
};

/// An open force-feedback device. The device owns its file descriptor, name,
/// path and effect table, and `deinit` releases them.
///
/// Deliberate differences from SDL: no instance IDs, no global device list,
/// no reference counts, and no joystick or HIDAPI routing. Gain and autocenter
/// are scaled by `gain_scale_percent`, which replaces SDL_HAPTIC_GAIN_MAX.
pub const Device = struct {
    allocator: Allocator,
    fd: i32,
    path: []u8,
    name: []u8,
    supported: Features,
    /// Axes exposed to callers. Linux evdev has no axis query, so this is fixed at two.
    num_axes: u32 = 2,
    /// Gain in SDL_SetHapticGain is multiplied by this value and divided by 100.
    /// Default 100 means no scaling. Callers set it instead of reading an
    /// environment variable.
    gain_scale_percent: u8 = 100,
    slots: []?Slot,
    rumble: ?Rumble = null,

    /// Opens an evdev node and uploads nothing. Like SDL_OpenHaptic, it sets the
    /// gain to 100% and autocenter to 0% when those features exist.
    pub fn open(allocator: Allocator, path: []const u8) Error!Device {
        const fd = try open_path(path, .{ .ACCMODE = .RDWR, .CLOEXEC = true });
        errdefer close_fd(fd);

        const supported = query_features(fd) catch return error.NotHaptic;
        if (supported.bits() == 0) return error.NotHaptic;

        var count: i32 = 0;
        _ = try check(linux.ioctl(fd, eviocgeffects, @intFromPtr(&count)));
        if (count < 0) return error.Io;

        const slots = try allocator.alloc(?Slot, @intCast(count));
        errdefer allocator.free(slots);
        @memset(slots, null);

        const owned_path = try allocator.dupe(u8, path);
        errdefer allocator.free(owned_path);
        const name = try read_name(allocator, fd, path);
        errdefer allocator.free(name);

        var device: Device = .{
            .allocator = allocator,
            .fd = fd,
            .path = owned_path,
            .name = name,
            .supported = supported,
            .slots = slots,
        };
        if (supported.gain) device.set_gain(effect_mod.max_percent) catch {};
        if (supported.autocenter) device.set_autocenter(0) catch {};
        return device;
    }

    /// Destroys every uploaded effect, then closes the node and frees memory.
    pub fn deinit(self: *Device) void {
        for (self.slots, 0..) |slot, index| {
            if (slot != null) self.destroy_effect(@intCast(index)) catch {};
        }
        self.allocator.free(self.slots);
        self.allocator.free(self.name);
        self.allocator.free(self.path);
        close_fd(self.fd);
        self.* = undefined;
    }

    /// Number of effect slots the kernel allows on this device.
    pub fn max_effects(self: Device) usize {
        return self.slots.len;
    }

    /// Linux plays every uploaded effect concurrently, so this equals `max_effects`.
    pub fn max_playing(self: Device) usize {
        return self.slots.len;
    }

    /// Capabilities probed from EV_FF when the device was opened.
    pub fn features(self: Device) Features {
        return self.supported;
    }

    /// Uploads a new effect into the first free slot and returns its id. The
    /// kernel fails the upload when it cannot store the parameters.
    pub fn create_effect(self: *Device, effect: Effect) Error!EffectId {
        try effect.validate();
        if (!self.supported.contains(effect.feature())) return error.Unsupported;
        const index = for (self.slots, 0..) |slot, i| {
            if (slot == null) break i;
        } else return error.NoFreeSlots;

        var record: [ff_effect_size]u8 = undefined;
        try encode_effect(&record, -1, effect);
        _ = try check(linux.ioctl(self.fd, eviocsff, @intFromPtr(&record)));
        self.slots[index] = .{ .kind = effect.kind(), .kernel_id = read_kernel_id(&record) };
        return @intCast(index);
    }

    /// Replaces the parameters of an existing effect. The new effect must have
    /// the same kind, because the kernel keeps the type of an uploaded effect.
    pub fn update_effect(self: *Device, id: EffectId, effect: Effect) Error!void {
        const slot = try self.slot_at(id);
        if (effect.kind() != slot.kind) return error.TypeMismatch;
        try effect.validate();
        var record: [ff_effect_size]u8 = undefined;
        try encode_effect(&record, slot.kernel_id, effect);
        _ = try check(linux.ioctl(self.fd, eviocsff, @intFromPtr(&record)));
    }

    /// Plays an effect `iterations` times. Zero is passed through as zero repeats,
    /// and counts above INT_MAX are clamped to INT_MAX as SDL does.
    pub fn run_effect(self: *Device, id: EffectId, iterations: u32) Error!void {
        const slot = try self.slot_at(id);
        const value: i32 = @intCast(@min(iterations, std.math.maxInt(i32)));
        try self.write_event(ev_ff, @bitCast(slot.kernel_id), value);
    }

    /// Stops an effect that is playing. The effect stays uploaded.
    pub fn stop_effect(self: *Device, id: EffectId) Error!void {
        const slot = try self.slot_at(id);
        try self.write_event(ev_ff, @bitCast(slot.kernel_id), 0);
    }

    /// Erases an effect from the kernel and frees its slot. The slot is freed even
    /// when the kernel rejects the erase, since the kernel cannot be retried safely
    /// from here.
    pub fn destroy_effect(self: *Device, id: EffectId) Error!void {
        const slot = try self.slot_at(id);
        self.slots[id] = null;
        if (self.rumble) |rumble| {
            if (rumble.id == id) self.rumble = null;
        }
        _ = try check(linux.ioctl(self.fd, eviocrmff, @as(usize, @bitCast(@as(isize, slot.kernel_id)))));
    }

    /// Stops every uploaded effect, returning on the first failure.
    pub fn stop_all(self: *Device) Error!void {
        for (self.slots) |slot| {
            if (slot) |found| try self.write_event(ev_ff, @bitCast(found.kernel_id), 0);
        }
    }

    /// Sets device gain from 0 to 100 percent.
    pub fn set_gain(self: *Device, percent: u8) Error!void {
        if (!self.supported.gain) return error.Unsupported;
        if (percent > effect_mod.max_percent) return error.InvalidParameter;
        const scaled = scale_percent(percent, self.gain_scale_percent);
        try self.write_event(ev_ff, ff_gain, scaled);
    }

    /// Sets autocenter strength from 0 to 100 percent.
    pub fn set_autocenter(self: *Device, percent: u8) Error!void {
        if (!self.supported.autocenter) return error.Unsupported;
        if (percent > effect_mod.max_percent) return error.InvalidParameter;
        try self.write_event(ev_ff, ff_autocenter, scale_percent(percent, 100));
    }

    /// Pausing is not available through evdev. Matches SDL's unsupported result.
    pub fn pause(self: *Device) Error!void {
        _ = self;
        return error.Unsupported;
    }

    /// Resuming is a no-op when pause is unsupported, as in SDL_ResumeHaptic.
    pub fn unpause(self: *Device) Error!void {
        _ = self;
    }

    /// Creates the rumble effect used by `play_rumble`. Uses a sine wave when the
    /// device supports one, and left/right motors otherwise.
    pub fn init_rumble(self: *Device) Error!EffectId {
        if (self.rumble) |rumble| return rumble.id;
        const effect: Effect = if (self.supported.sine)
            .{ .periodic = .{
                .timing = .{ .length = 5000 },
                .direction = .{ .cartesian = .{ 0, 0, 0 } },
                .waveform = .sine,
                .period = 1000,
                .magnitude = 0x4000,
            } }
        else if (self.supported.left_right)
            .{ .left_right = .{ .length = 5000, .large_magnitude = 0x4000, .small_magnitude = 0x4000 } }
        else
            return error.Unsupported;
        const id = try self.create_effect(effect);
        self.rumble = .{ .id = id, .effect = effect };
        return id;
    }

    /// Plays rumble at `strength` (clamped to 0..1) for `length_ms` milliseconds.
    pub fn play_rumble(self: *Device, strength: f32, length_ms: u32) Error!void {
        const rumble = self.rumble orelse return error.InvalidEffectId;
        const clamped = std.math.clamp(strength, 0.0, 1.0);
        const magnitude: i16 = @intFromFloat(32767.0 * clamped);
        var effect = rumble.effect;
        switch (effect) {
            .periodic => |*p| {
                p.magnitude = magnitude;
                p.timing.length = length_ms;
            },
            .left_right => |*lr| {
                lr.large_magnitude = @intCast(magnitude);
                lr.small_magnitude = @intCast(magnitude);
                lr.length = length_ms;
            },
            else => unreachable,
        }
        try self.update_effect(rumble.id, effect);
        self.rumble = .{ .id = rumble.id, .effect = effect };
        try self.run_effect(rumble.id, 1);
    }

    /// Stops the rumble effect. Fails when `init_rumble` has not been called.
    pub fn stop_rumble(self: *Device) Error!void {
        const rumble = self.rumble orelse return error.InvalidEffectId;
        try self.stop_effect(rumble.id);
    }

    fn slot_at(self: Device, id: EffectId) Error!Slot {
        if (id >= self.slots.len) return error.InvalidEffectId;
        return self.slots[id] orelse error.InvalidEffectId;
    }

    fn write_event(self: Device, ev_type: u16, code: u16, value: i32) Error!void {
        var record: [event_size]u8 = undefined;
        encode_event(&record, ev_type, code, value);
        const written = try check(linux.write(self.fd, &record, record.len));
        if (written != record.len) return error.Io;
    }
};

/// `(percent * scale) / 100` for gain and autocenter values, using the same
/// 0xFFFF full-scale as SDL's `(0xFFFFUL * gain) / 100`.
fn scale_percent(percent: u8, scale: u8) i32 {
    const real: u32 = (@as(u32, percent) * scale) / 100;
    return @intCast((0xFFFF * real) / 100);
}
