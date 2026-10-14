//! Linux evdev joystick backend, pure Zig over `std.os.linux` syscalls.
//!
//! Device discovery scans `/dev/input/event*` and classifies each node the way
//! SDL does without udev: capability bitmaps decide whether a node is a joystick
//! (SDL_EVDEV_GuessDeviceClass). The bitmaps come from sysfs when readable, which
//! avoids opening unrelated nodes, and from EVIOCGBIT otherwise. Axis, hat, button
//! and ball layout follow SDL_sysjoystick.c (ConfigJoystick, HandleHat,
//! AxisCorrect, PollAllValues, HandleInputEvents).
//!
//! Kernel records are decoded from byte buffers with explicit offsets:
//! - `struct input_event` (linux/input.h): `timeval` (two native `long`s), then
//!   `u16 type`, `u16 code`, `i32 value`. The record is 2*usize + 8 bytes.
//! - `struct input_id`: four native-endian `u16`s (bustype, vendor, product, version).
//! - `struct input_absinfo`: six native-endian `i32`s (value, minimum, maximum,
//!   fuzz, flat, resolution), 24 bytes.
//! Capability bitmaps are arrays of kernel `unsigned long`, so they are read
//! straight into `usize` words and tested per bit, with no byte-order handling.
//!
//! Ownership: `Device` owns its file descriptor and name. `deinit` closes the
//! descriptor. Polling writes changes into a caller-owned `ArrayList`.
//!
//! Force-feedback rumble (LINUX_JoystickRumble) uploads an `ff_effect` with
//! EVIOCSFF and triggers it by writing an `EV_FF` event; see `Device.rumble`.
//! The `struct ff_effect` layout is documented next to its offsets below.
//!
//! Deliberate differences from SDL:
//! - Only `/dev/input/event*` nodes are used. The legacy `js*` interface (classic
//!   JSIOCG* ioctls) is not ported (pending).
//! - Sensors (accelerometer/gyro axes) and LED effects are detected or skipped but
//!   not implemented. Trigger rumble is unsupported on Linux, as in SDL.
//! - The effect duration is the kernel maximum (SDL_MAX_RUMBLE_DURATION_MS); the
//!   caller-visible expiry is tracked by `rumble.zig`, not by the kernel.
//! - Event timestamps are the kernel timestamps converted to nanoseconds. Polled
//!   state uses CLOCK_MONOTONIC, which is what SDL_GetTicksNS uses.
//! - AxisCorrect uses 64-bit intermediates, avoiding SDL's C int overflow.
const std = @import("std");
const builtin = @import("builtin");
const joystick = @import("joystick.zig");
const gamepad = @import("gamepad.zig");

pub const Guid = joystick.Guid;

const linux = std.os.linux;
const native_endian = builtin.target.cpu.arch.endian();

// Event, key and axis numbers from linux/input-event-codes.h.
const ev_syn = 0x00;
const ev_key = 0x01;
const ev_rel = 0x02;
const ev_abs = 0x03;
const ev_max = 0x1f;
const ev_ff = 0x15;
const syn_report = 0;
const syn_dropped = 3;
const rel_x = 0x00;
const rel_y = 0x01;
const rel_max = 0x0f;
const abs_x = 0x00;
const abs_y = 0x01;
const abs_z = 0x02;
const abs_rx = 0x03;
const abs_ry = 0x04;
const abs_rz = 0x05;
const abs_throttle = 0x06;
const abs_rudder = 0x07;
const abs_wheel = 0x08;
const abs_gas = 0x09;
const abs_brake = 0x0a;
const abs_hat0x = 0x10;
const abs_hat3y = 0x17;
const abs_max = 0x3f;
const abs_cnt = 0x40;
const key_max = 0x2ff;
const key_count = key_max + 1;
const btn_misc = 0x100;
const btn_1 = 0x101;
const btn_mouse = 0x110;
const btn_joystick = 0x120;
const btn_trigger = 0x120;
const btn_a = 0x130;
const btn_tool_pen = 0x140;
const btn_tool_finger = 0x145;
const btn_touch = 0x14a;
const btn_stylus = 0x14b;
const key_ok = 0x160;
const btn_dpad_up = 0x220;
const key_als_toggle = 0x230;
const btn_trigger_happy = 0x2c0;
const input_prop_max = 0x1f;
const ff_max = 0x7f;
const ff_rumble = 0x50;
const ff_periodic = 0x51;
const ff_sine = 0x5a;
const prop_buttonpad = 0x02;
const prop_semi_mt = 0x03;
const prop_topbuttonpad = 0x04;
const prop_pointing_stick = 0x05;
const prop_accelerometer = 0x06;

// ioctl request numbers: _IOC(dir, type, nr, size) with dir=READ(2) and type 'E'.
const ioc_read: u32 = 2 << 30;
const ioc_type_e: u32 = 'E' << 8;

fn ioc(nr: u32, size: usize) u32 {
    return ioc_read | (@as(u32, @intCast(size)) << 16) | ioc_type_e | nr;
}

/// EVIOCGID: `struct input_id`, 8 bytes.
const eviocgid = ioc(0x02, 8);
/// EVIOCGNAME(len): device name string.
fn eviocgname(len: usize) u32 {
    return ioc(0x06, len);
}
/// EVIOCGPROP(len): device property bitmap.
fn eviocgprop(len: usize) u32 {
    return ioc(0x09, len);
}
/// EVIOCGKEY(len): current key state bitmap.
fn eviocgkey(len: usize) u32 {
    return ioc(0x18, len);
}
/// EVIOCGBIT(ev, len): capability bitmap for event type `ev`.
fn eviocgbit(ev: usize, len: usize) u32 {
    return ioc(0x20 + @as(u32, @intCast(ev)), len);
}
/// EVIOCGABS(abs): `struct input_absinfo`, 24 bytes.
fn eviocgabs(axis: usize) u32 {
    return ioc(0x40 + @as(u32, @intCast(axis)), 24);
}

/// `_IOW('E', nr, size)`: a write ioctl, the argument is copied from user space.
fn iow(nr: u32, size: usize) u32 {
    const ioc_write: u32 = 1 << 30;
    return ioc_write | (@as(u32, @intCast(size)) << 16) | ioc_type_e | nr;
}

/// Size of `struct ff_effect` (linux/input.h). The layout is 48 bytes on LP64 and
/// 44 bytes on ILP32: a 16-byte header, then a union whose largest member,
/// `ff_periodic_effect`, carries a pointer. The kernel ignores the size field of
/// EVIOCSFF, but the request number still encodes it, so it matches the ABI.
const ff_effect_size: usize = if (@sizeOf(usize) == 8) 48 else 44;
/// Offsets inside `struct ff_effect`, written in native byte order.
const ff_type_offset = 0;
const ff_id_offset = 2;
const ff_replay_length_offset = 10;
/// Union start: 14 bytes of header, aligned to 4 or 8 bytes, which gives 16 on both ABIs.
const ff_union_offset = 16;
/// Replay length used for every rumble effect (SDL_MAX_RUMBLE_DURATION_MS).
const ff_max_replay_length: u16 = 0xffff;
/// EVIOCSFF: upload or update an effect; the kernel writes the allocated id back.
fn eviocsff() u32 {
    return iow(0x80, ff_effect_size);
}
/// EVIOCRMFF: remove the effect whose id is the integer argument.
fn eviocrmff() u32 {
    return iow(0x81, @sizeOf(c_int));
}

/// Bit set over a kernel `unsigned long` array (native word order).
fn Bitmap(comptime bit_count: usize) type {
    return struct {
        const Self = @This();
        const word_bits = @bitSizeOf(usize);
        words: [(bit_count + word_bits - 1) / word_bits]usize = @splat(0),

        fn test_bit(self: Self, index: usize) bool {
            if (index >= bit_count) return false;
            return (self.words[index / word_bits] >> @intCast(index % word_bits)) & 1 != 0;
        }

        fn bytes(self: *Self) []u8 {
            return std.mem.sliceAsBytes(&self.words);
        }
    };
}

/// Errors from device probing and I/O.
pub const Error = error{
    /// The node is not a joystick, or its capabilities could not be read.
    NotJoystick,
    /// Path or name does not fit the fixed buffers.
    NameTooLong,
    /// A system call failed; the errno value is `errno`.
    SystemError,
    /// The kernel returned fewer bytes than the record size.
    ShortRead,
    /// The device has neither FF_RUMBLE nor FF_SINE, so it cannot rumble.
    Unsupported,
} || std.mem.Allocator.Error;

/// Device-class flags (SDL_UDEV_DEVICE_* in SDL_evdev_capabilities.h).
pub const DeviceClass = packed struct(u8) {
    mouse: bool = false,
    keyboard: bool = false,
    joystick: bool = false,
    touchpad: bool = false,
    touchscreen: bool = false,
    has_keys: bool = false,
    accelerometer: bool = false,
    _reserved: bool = false,
};

const Props = Bitmap(input_prop_max + 1);
const Ev = Bitmap(ev_max + 1);
const Keys = Bitmap(key_count);
const Abs = Bitmap(abs_cnt);
const Rel = Bitmap(rel_max + 1);

/// Capability bitmaps of one device.
pub const Capabilities = struct {
    props: Props = .{},
    ev: Ev = .{},
    keys: Keys = .{},
    abs: Abs = .{},
    rel: Rel = .{},
};

/// Classifies a device from its capability bits (SDL_EVDEV_GuessDeviceClass).
pub fn guess_device_class(caps: Capabilities) DeviceClass {
    var class: DeviceClass = .{};
    // Explicit kernel properties take precedence.
    if (caps.props.test_bit(prop_accelerometer)) return .{ .accelerometer = true };
    if (caps.props.test_bit(prop_pointing_stick)) return .{ .mouse = true };
    if (caps.props.test_bit(prop_topbuttonpad) or caps.props.test_bit(prop_buttonpad) or caps.props.test_bit(prop_semi_mt)) {
        return .{ .touchpad = true };
    }
    // X, Y, Z without keys: an accelerometer.
    if (caps.ev.test_bit(ev_abs) and caps.abs.test_bit(abs_x) and caps.abs.test_bit(abs_y) and caps.abs.test_bit(abs_z) and !caps.ev.test_bit(ev_key)) {
        return .{ .accelerometer = true };
    }
    // RX, RY, RZ without keys: a gyro, reported as an accelerometer.
    if (caps.ev.test_bit(ev_abs) and caps.abs.test_bit(abs_rx) and caps.abs.test_bit(abs_ry) and caps.abs.test_bit(abs_rz) and !caps.ev.test_bit(ev_key)) {
        return .{ .accelerometer = true };
    }

    if (caps.ev.test_bit(ev_abs) and caps.abs.test_bit(abs_x) and caps.abs.test_bit(abs_y)) {
        if (caps.keys.test_bit(btn_stylus) or caps.keys.test_bit(btn_tool_pen)) {
            // Tablet: none of the flags below apply.
        } else if (caps.keys.test_bit(btn_tool_finger) and !caps.keys.test_bit(btn_tool_pen)) {
            class.touchpad = true;
        } else if (caps.keys.test_bit(btn_mouse)) {
            class.mouse = true;
        } else if (caps.keys.test_bit(btn_touch)) {
            class.touchscreen = true;
        }

        const joystick_axes = [_]usize{ abs_rx, abs_ry, abs_rz, abs_throttle, abs_rudder, abs_wheel, abs_gas, abs_brake };
        var has_joystick_axis = caps.keys.test_bit(btn_trigger) or caps.keys.test_bit(btn_a) or caps.keys.test_bit(btn_1);
        for (joystick_axes) |axis| has_joystick_axis = has_joystick_axis or caps.abs.test_bit(axis);
        if (has_joystick_axis) class.joystick = true;
    }

    if (caps.ev.test_bit(ev_rel) and caps.rel.test_bit(rel_x) and caps.rel.test_bit(rel_y) and caps.keys.test_bit(btn_mouse)) {
        class.mouse = true;
    }

    if (caps.ev.test_bit(ev_key)) {
        // Any key below BTN_MISC counts; otherwise check the high key blocks.
        var found = false;
        const low_words = btn_misc / Keys.word_bits;
        for (caps.keys.words[0..low_words]) |word| {
            if (word != 0) found = true;
        }
        if (!found) {
            const blocks = [_]struct { start: usize, end: usize }{
                .{ .start = key_ok, .end = btn_dpad_up },
                .{ .start = key_als_toggle, .end = btn_trigger_happy },
            };
            for (blocks) |block| {
                var key = block.start;
                while (key < block.end) : (key += 1) {
                    if (caps.keys.test_bit(key)) found = true;
                }
            }
        }
        if (found) class.has_keys = true;
    }

    // A full ESC/number/Q-D row (all bits except KEY_RESERVED) makes a keyboard.
    const keyboard_mask: usize = 0xFFFF_FFFE;
    if ((caps.keys.words[0] & keyboard_mask) == keyboard_mask) class.keyboard = true;

    return class;
}

fn native_bytes_to_i32(bytes: []const u8, index: usize) i32 {
    return std.mem.readInt(i32, bytes[index * 4 ..][0..4], native_endian);
}

/// `struct input_absinfo` decoded from its 24-byte kernel form.
const AbsInfo = struct {
    value: i32,
    minimum: i32,
    maximum: i32,
    fuzz: i32,
    flat: i32,
    resolution: i32,

    fn decode(bytes: []const u8) AbsInfo {
        return .{
            .value = native_bytes_to_i32(bytes, 0),
            .minimum = native_bytes_to_i32(bytes, 1),
            .maximum = native_bytes_to_i32(bytes, 2),
            .fuzz = native_bytes_to_i32(bytes, 3),
            .flat = native_bytes_to_i32(bytes, 4),
            .resolution = native_bytes_to_i32(bytes, 5),
        };
    }
};

/// Hardware options (SDL hints for Linux joysticks).
pub const Options = struct {
    /// Treat every hat-like axis pair as digital (SDL_HINT_JOYSTICK_LINUX_DIGITAL_HATS).
    digital_hats: bool = false,
    /// Apply flat/deadzone filtering to analog axes (SDL_HINT_JOYSTICK_LINUX_DEADZONES).
    deadzones: bool = false,
    /// Apply the deadzone logic to digital-hat axes (SDL_HINT_JOYSTICK_LINUX_HAT_DEADZONES).
    hat_deadzones: bool = true,
};

const AxisCorrect = struct {
    minimum: i32 = 0,
    maximum: i32 = 0,
    use_deadzones: bool = false,
    coef: [3]i64 = .{ 0, 0, 0 },
    scale: f32 = 1,
};

const HatCorrect = struct {
    minimum: [2]i32 = .{ -1, -1 },
    maximum: [2]i32 = .{ 1, 1 },
    use_deadzones: bool = false,
};

/// An opened evdev joystick node and its mapping from kernel codes to SDL indices.
pub const Device = struct {
    allocator: std.mem.Allocator,
    fd: i32,
    name: []u8,
    guid: Guid,
    options: Options,
    layout: joystick.Layout = .{},
    /// Kernel key code -> button index, valid where `has_key` is set.
    key_map: [key_count]u16 = @splat(0),
    has_key: [key_count]bool = @splat(false),
    /// Kernel absolute code -> axis index, valid where `has_abs` is set.
    abs_map: [abs_cnt]u16 = @splat(0),
    has_abs: [abs_cnt]bool = @splat(false),
    abs_correct: [abs_cnt]AxisCorrect = @splat(.{}),
    /// Hat index for each digital-hat pair (ABS_HAT0X/Y ... ABS_HAT3X/Y).
    hat_index: [4]u8 = @splat(0),
    has_hat: [4]bool = @splat(false),
    hat_correct: [4]HatCorrect = @splat(.{}),
    /// Current per-axis hat state, 0 negative, 1 centered, 2 positive.
    hat_state: [4][2]u8 = .{ .{ 1, 1 }, .{ 1, 1 }, .{ 1, 1 }, .{ 1, 1 } },
    /// Ball motion accumulated until SYN_REPORT.
    ball_pending: [2]i32 = .{ 0, 0 },
    recovering_from_dropped: bool = false,
    fresh: bool = true,
    /// True when the device advertises FF_RUMBLE, the preferred rumble effect.
    ff_rumble: bool = false,
    /// True when the device advertises FF_SINE; used only when FF_RUMBLE is absent.
    ff_sine: bool = false,
    /// The `struct ff_effect` passed to EVIOCSFF. Its id starts at -1 and is
    /// updated by the kernel on each upload.
    effect: [ff_effect_size]u8 = @splat(0),

    /// Closes the descriptor and frees the name. A rumble effect uploaded to the
    /// kernel is removed first (LINUX_JoystickClose).
    pub fn deinit(self: *Device) void {
        const id = self.effect_id();
        if (id >= 0) _ = linux.ioctl(self.fd, eviocrmff(), @intCast(id));
        _ = linux.close(self.fd);
        self.allocator.free(self.name);
        self.* = undefined;
    }

    /// True when `rumble` can drive this device (FF_RUMBLE or FF_SINE).
    pub fn supports_rumble(self: *const Device) bool {
        return self.ff_rumble or self.ff_sine;
    }

    /// The kernel effect id, or -1 before the first upload.
    fn effect_id(self: *const Device) i16 {
        return std.mem.readInt(i16, self.effect[ff_id_offset..][0..2], native_endian);
    }

    /// Starts a rumble effect (LINUX_JoystickRumble). `low` drives the strong
    /// motor and `high` the weak motor, both on the 0..65535 scale. Zero values
    /// are sent too, which stops the motors.
    ///
    /// With FF_RUMBLE the effect carries both magnitudes. With only FF_SINE it is
    /// a periodic sine whose magnitude is the mean of the two motors, halved to
    /// fit the signed 16-bit kernel field. The effect runs for the kernel maximum
    /// duration; callers stop it sooner by calling `rumble(0, 0)` (see rumble.zig).
    ///
    /// The effect is re-uploaded on every call. If the kernel has lost the id, the
    /// upload is retried with a fresh id. The kernel then gets an EV_FF write
    /// that starts the effect.
    pub fn rumble(self: *Device, low: u16, high: u16) Error!void {
        const effect = &self.effect;
        if (self.ff_rumble) {
            put_int(u16, effect, ff_type_offset, ff_rumble);
            put_int(u16, effect, ff_replay_length_offset, ff_max_replay_length);
            put_int(u16, effect, ff_union_offset + 0, low);
            put_int(u16, effect, ff_union_offset + 2, high);
        } else if (self.ff_sine) {
            // SDL: magnitude = (low/2 + high/2) / 2, as Sint16.
            const magnitude: u32 = (@as(u32, low / 2) + @as(u32, high / 2)) / 2;
            put_int(u16, effect, ff_type_offset, ff_periodic);
            put_int(u16, effect, ff_replay_length_offset, ff_max_replay_length);
            put_int(u16, effect, ff_union_offset + 0, ff_sine);
            put_int(i16, effect, ff_union_offset + 4, @intCast(magnitude));
        } else {
            return error.Unsupported;
        }

        upload_effect(self) catch {
            // The kernel may have dropped the effect; allocate a new id and retry.
            put_int(i16, effect, ff_id_offset, -1);
            try upload_effect(self);
        };

        var record: [2 * @sizeOf(usize) + 8]u8 = @splat(0);
        const type_offset = 2 * @sizeOf(usize);
        put_int(u16, &record, type_offset, ev_ff);
        put_int(u16, &record, type_offset + 2, @intCast(self.effect_id()));
        put_int(i32, &record, type_offset + 4, 1);
        const rc = linux.write(self.fd, &record, record.len);
        if (linux.errno(rc) != .SUCCESS) return error.SystemError;
    }

    /// Builds a joystick state object sized to this device's layout. The caller
    /// owns the result and must call `Joystick.deinit`.
    pub fn create_joystick(self: *const Device, allocator: std.mem.Allocator) std.mem.Allocator.Error!joystick.Joystick {
        return joystick.Joystick.init(allocator, self.guid, self.layout);
    }

    /// Reads all pending kernel events without blocking and applies them to `js`.
    /// The first call after open also reads the current state of every input.
    /// Changes are appended to `out`.
    pub fn poll(
        self: *Device,
        allocator: std.mem.Allocator,
        js: *joystick.Joystick,
        out: *std.ArrayList(joystick.Change),
    ) Error!void {
        if (self.fresh) {
            self.fresh = false;
            try self.poll_all_values(allocator, js, out, now_ns());
        }

        const record_size = 2 * @sizeOf(usize) + 8;
        var buffer: [32 * (2 * @sizeOf(usize) + 8)]u8 = undefined;
        while (true) {
            const rc = linux.read(self.fd, &buffer, buffer.len);
            switch (linux.errno(rc)) {
                .SUCCESS => {},
                .AGAIN => return,
                .INTR => continue,
                else => return error.SystemError,
            }
            const got: usize = rc;
            if (got == 0) return;
            if (got % record_size != 0) return error.ShortRead;
            var offset: usize = 0;
            while (offset < got) : (offset += record_size) {
                try self.handle_record(allocator, js, out, buffer[offset..][0..record_size]);
            }
            if (got < buffer.len) return;
        }
    }

    fn handle_record(
        self: *Device,
        allocator: std.mem.Allocator,
        js: *joystick.Joystick,
        out: *std.ArrayList(joystick.Change),
        record: []const u8,
    ) Error!void {
        const sec = std.mem.readInt(usize, record[0..@sizeOf(usize)], native_endian);
        const usec = std.mem.readInt(usize, record[@sizeOf(usize)..][0..@sizeOf(usize)], native_endian);
        const type_offset = 2 * @sizeOf(usize);
        const event_type = std.mem.readInt(u16, record[type_offset..][0..2], native_endian);
        const code: usize = std.mem.readInt(u16, record[type_offset + 2 ..][0..2], native_endian);
        const value = std.mem.readInt(i32, record[type_offset + 4 ..][0..4], native_endian);
        const timestamp = @max(1, @as(u64, sec) *% std.time.ns_per_s +% @as(u64, usec) *% std.time.ns_per_us);

        if (self.recovering_from_dropped and !(event_type == ev_syn and code == syn_report)) return;

        switch (event_type) {
            ev_key => {
                if (code < key_count and self.has_key[code]) {
                    try js.set_button(allocator, out, timestamp, self.key_map[code], value != 0);
                }
            },
            ev_abs => {
                if (code >= abs_hat0x and code <= abs_hat3y) {
                    const hat_index = (code - abs_hat0x) / 2;
                    if (self.has_hat[hat_index]) {
                        try self.handle_hat(allocator, js, out, timestamp, hat_index, (code - abs_hat0x) % 2, value);
                        return;
                    }
                }
                if (code < abs_cnt and self.has_abs[code]) {
                    const corrected = self.axis_correct(code, value);
                    try js.set_axis(allocator, out, timestamp, self.abs_map[code], corrected);
                }
            },
            ev_rel => {
                if (code == rel_x or code == rel_y) {
                    self.ball_pending[code - rel_x] += value;
                }
            },
            ev_syn => switch (code) {
                syn_dropped => self.recovering_from_dropped = true,
                syn_report => {
                    if (self.recovering_from_dropped) {
                        self.recovering_from_dropped = false;
                        try self.poll_all_values(allocator, js, out, timestamp);
                    }
                    if (self.layout.balls > 0 and (self.ball_pending[0] != 0 or self.ball_pending[1] != 0)) {
                        const dx: i16 = @intCast(std.math.clamp(self.ball_pending[0], std.math.minInt(i16), std.math.maxInt(i16)));
                        const dy: i16 = @intCast(std.math.clamp(self.ball_pending[1], std.math.minInt(i16), std.math.maxInt(i16)));
                        self.ball_pending = .{ 0, 0 };
                        try js.set_ball(allocator, out, timestamp, 0, dx, dy);
                    }
                },
                else => {},
            },
            else => {},
        }
    }

    /// HandleHat: maps a raw hat-axis value to the three-state position, with
    /// deadzones when enabled, and emits a hat change when the position moves.
    fn handle_hat(
        self: *Device,
        allocator: std.mem.Allocator,
        js: *joystick.Joystick,
        out: *std.ArrayList(joystick.Change),
        timestamp: u64,
        hat_index: usize,
        axis: usize,
        raw: i32,
    ) Error!void {
        const correct = &self.hat_correct[hat_index];
        // 0 = negative, 1 = centered, 2 = positive (SDL HandleHat).
        var state: u8 = 1;
        if (raw < 0) {
            if (raw <= correct.minimum[axis]) {
                correct.minimum[axis] = raw;
                state = 0;
            } else if (!correct.use_deadzones or raw < @divTrunc(correct.minimum[axis], 3)) {
                state = 0;
            }
        } else if (raw > 0) {
            if (raw >= correct.maximum[axis]) {
                correct.maximum[axis] = raw;
                state = 2;
            } else if (!correct.use_deadzones or raw > @divTrunc(correct.maximum[axis], 3)) {
                state = 2;
            }
        }

        if (state != self.hat_state[hat_index][axis]) {
            self.hat_state[hat_index][axis] = state;
            const x: joystick.HatAxis = @fromBackingInt(@intCast(self.hat_state[hat_index][0]));
            const y: joystick.HatAxis = @fromBackingInt(@intCast(self.hat_state[hat_index][1]));
            try js.set_hat(allocator, out, timestamp, self.hat_index[hat_index], joystick.Hat.from_axis_states(x, y));
        }
    }

    /// AxisCorrect: applies deadzones or linear scaling to a raw axis value and
    /// clamps it to the SDL axis range.
    fn axis_correct(self: *const Device, code: usize, raw: i32) i16 {
        const correct = self.abs_correct[code];
        var value: i64 = raw;
        if (correct.minimum != correct.maximum) {
            if (correct.use_deadzones) {
                value *= 2;
                if (value > correct.coef[0]) {
                    if (value < correct.coef[1]) return 0;
                    value -= correct.coef[1];
                } else {
                    value -= correct.coef[0];
                }
                value *= correct.coef[2];
                value >>= 13;
            } else {
                const scaled = (@as(f32, @floatFromInt(raw - correct.minimum)) * correct.scale) + @as(f32, @floatFromInt(joystick.axis_min)) + 0.5;
                value = @intFromFloat(@floor(scaled));
            }
        }
        return @intCast(std.math.clamp(value, joystick.axis_min, joystick.axis_max));
    }

    /// PollAllValues: reads every axis, hat and key state from the kernel.
    fn poll_all_values(
        self: *Device,
        allocator: std.mem.Allocator,
        js: *joystick.Joystick,
        out: *std.ArrayList(joystick.Change),
        timestamp: u64,
    ) Error!void {
        var abs_bytes: [24]u8 = undefined;
        for (0..abs_cnt) |code| {
            if (code >= abs_hat0x and code <= abs_hat3y and self.has_hat[(code - abs_hat0x) / 2]) continue;
            if (!self.has_abs[code]) continue;
            if (!self.read_abs(code, &abs_bytes)) continue;
            const info = AbsInfo.decode(&abs_bytes);
            try js.set_axis(allocator, out, timestamp, self.abs_map[code], self.axis_correct(code, info.value));
        }
        for (abs_hat0x..abs_hat3y + 1) |code| {
            const hat_index = (code - abs_hat0x) / 2;
            if (!self.has_hat[hat_index]) continue;
            if (!self.read_abs(code, &abs_bytes)) continue;
            const info = AbsInfo.decode(&abs_bytes);
            try self.handle_hat(allocator, js, out, timestamp, hat_index, (code - abs_hat0x) % 2, info.value);
        }
        var keys: Keys = .{};
        if (ioctl_read(self.fd, eviocgkey(keys.bytes().len), keys.bytes())) |_| {
            for (0..key_count) |code| {
                if (self.has_key[code]) try js.set_button(allocator, out, timestamp, self.key_map[code], keys.test_bit(code));
            }
        } else |_| {}
    }

    fn read_abs(self: *const Device, code: usize, bytes: *[24]u8) bool {
        _ = ioctl_read(self.fd, eviocgabs(code), bytes) catch return false;
        return true;
    }
};

/// Writes an integer into `bytes` at `offset` in native byte order.
fn put_int(comptime T: type, bytes: []u8, offset: usize, value: T) void {
    std.mem.writeInt(T, bytes[offset..][0..@sizeOf(T)], value, native_endian);
}

/// EVIOCSFF on `self.effect`, with no retry.
fn upload_effect(self: *Device) Error!void {
    const rc = linux.ioctl(self.fd, eviocsff(), @intFromPtr(&self.effect));
    if (linux.errno(rc) != .SUCCESS) return error.SystemError;
}

/// Monotonic clock in nanoseconds, used for polled state.
fn now_ns() u64 {
    var ts: linux.timespec = undefined;
    _ = linux.clock_gettime(.MONOTONIC, &ts);
    return @as(u64, @intCast(ts.sec)) * std.time.ns_per_s + @as(u64, @intCast(ts.nsec));
}

/// Issues an ioctl that writes into `buffer`. Returns the byte count the kernel reported.
fn ioctl_read(fd: i32, request: u32, buffer: []u8) Error!usize {
    const rc = linux.ioctl(fd, request, @intFromPtr(buffer.ptr));
    if (linux.errno(rc) != .SUCCESS) return error.SystemError;
    return rc;
}

/// Formats `fmt` into `buf` and NUL-terminates it. Null when it does not fit.
fn zero_terminated(buf: []u8, comptime fmt: []const u8, args: anytype) ?[:0]const u8 {
    if (buf.len == 0) return null;
    const text = std.fmt.bufPrint(buf[0 .. buf.len - 1], fmt, args) catch return null;
    buf[text.len] = 0;
    return buf[0..text.len :0];
}

/// Opens `/dev/input/event<index>` read-only and nonblocking, then builds the
/// device layout. Returns `error.NotJoystick` for nodes that are not joysticks.
pub fn open_index(allocator: std.mem.Allocator, index: u32, options: Options) Error!Device {
    var path_buf: [32]u8 = undefined;
    const path = zero_terminated(&path_buf, "/dev/input/event{d}", .{index}) orelse return error.NameTooLong;
    return open_path(allocator, path, options);
}

/// Opens an evdev node by path (NUL-terminated) and returns the configured device.
pub fn open_path(allocator: std.mem.Allocator, path: [:0]const u8, options: Options) Error!Device {
    // Read-write enables force feedback; fall back to read-only as SDL does.
    var rc = linux.open(path.ptr, .{ .ACCMODE = .RDWR, .NONBLOCK = true, .CLOEXEC = true }, 0);
    if (linux.errno(rc) != .SUCCESS) rc = linux.open(path.ptr, .{ .ACCMODE = .RDONLY, .NONBLOCK = true, .CLOEXEC = true }, 0);
    if (linux.errno(rc) != .SUCCESS) return error.SystemError;
    const fd: i32 = @intCast(rc);
    errdefer _ = linux.close(fd);

    var caps: Capabilities = .{};
    if (!read_capabilities(fd, &caps)) return error.NotJoystick;
    if (!guess_device_class(caps).joystick) return error.NotJoystick;

    var id_bytes: [8]u8 = undefined;
    _ = ioctl_read(fd, eviocgid, &id_bytes) catch return error.NotJoystick;
    const bustype = std.mem.readInt(u16, id_bytes[0..2], native_endian);
    const vendor = std.mem.readInt(u16, id_bytes[2..4], native_endian);
    const product = std.mem.readInt(u16, id_bytes[4..6], native_endian);
    const version = std.mem.readInt(u16, id_bytes[6..8], native_endian);
    // Known firmware variants share one mapping (SDL FixupDeviceInfoForMapping).
    const fixed_version: u16 = if (vendor == 0x3250 and (product == 0x1001 or product == 0x1002)) 0 else version;

    var name_bytes: [128]u8 = undefined;
    const name_len = ioctl_read(fd, eviocgname(name_bytes.len), &name_bytes) catch return error.NotJoystick;
    const raw_name = name_bytes[0..@min(name_len, name_bytes.len)];
    const product_name = raw_name[0 .. std.mem.indexOfScalar(u8, raw_name, 0) orelse raw_name.len];
    const name = try allocator.dupe(u8, product_name);
    errdefer allocator.free(name);

    var device: Device = .{
        .allocator = allocator,
        .fd = fd,
        .name = name,
        .guid = joystick.create_guid(.{
            .bus = bustype,
            .vendor = vendor,
            .product = product,
            .version = fixed_version,
            .product_name = product_name,
        }),
        .options = options,
    };
    if (caps.ev.test_bit(ev_ff)) {
        var ff: Bitmap(ff_max + 1) = .{};
        if (ioctl_read(fd, eviocgbit(ev_ff, ff.bytes().len), ff.bytes())) |_| {
            device.ff_rumble = ff.test_bit(ff_rumble);
            device.ff_sine = ff.test_bit(ff_sine);
        } else |_| {}
    }
    // Empty effect with id -1: the kernel assigns an id on the first upload.
    put_int(i16, &device.effect, ff_id_offset, -1);
    configure(&device, caps);
    return device;
}

/// Reads the capability bitmaps through EVIOCGBIT/EVIOCGPROP. False when the
/// device does not support the unified event API.
fn read_capabilities(fd: i32, caps: *Capabilities) bool {
    _ = ioctl_read(fd, eviocgbit(ev_key, caps.keys.bytes().len), caps.keys.bytes()) catch return false;
    _ = ioctl_read(fd, eviocgbit(ev_abs, caps.abs.bytes().len), caps.abs.bytes()) catch return false;
    _ = ioctl_read(fd, eviocgbit(ev_rel, caps.rel.bytes().len), caps.rel.bytes()) catch return false;
    _ = ioctl_read(fd, eviocgbit(0, caps.ev.bytes().len), caps.ev.bytes()) catch return false;
    _ = ioctl_read(fd, eviocgprop(caps.props.bytes().len), caps.props.bytes()) catch {};
    return true;
}

/// Reads the same bitmaps from `/sys/class/input/eventN/device/`, without
/// opening the node. Returns false when any file is missing; the caller then
/// falls back to the ioctl path.
pub fn read_sysfs_capabilities(index: u32, caps: *Capabilities) bool {
    var path_buf: [128]u8 = undefined;
    var text_buf: [512]u8 = undefined;
    const files = .{
        .{ .name = "capabilities/ev", .words = &caps.ev.words },
        .{ .name = "capabilities/key", .words = &caps.keys.words },
        .{ .name = "capabilities/abs", .words = &caps.abs.words },
        .{ .name = "capabilities/rel", .words = &caps.rel.words },
    };
    inline for (files) |file| {
        const text = read_small_file(&path_buf, &text_buf, index, file.name) orelse return false;
        if (!parse_hex_words(text, file.words)) return false;
    }
    if (read_small_file(&path_buf, &text_buf, index, "properties")) |text| {
        _ = parse_hex_words(text, &caps.props.words);
    }
    return true;
}

/// Reads `/sys/class/input/event<index>/device/<name>` into `text_buf`.
fn read_small_file(path_buf: []u8, text_buf: []u8, index: u32, name: []const u8) ?[]const u8 {
    const path = zero_terminated(path_buf, "/sys/class/input/event{d}/device/{s}", .{ index, name }) orelse return null;
    const rc = linux.open(path.ptr, .{ .ACCMODE = .RDONLY, .CLOEXEC = true }, 0);
    if (linux.errno(rc) != .SUCCESS) return null;
    const fd: i32 = @intCast(rc);
    defer _ = linux.close(fd);
    const read_rc = linux.read(fd, text_buf.ptr, text_buf.len);
    if (linux.errno(read_rc) != .SUCCESS) return null;
    return std.mem.trim(u8, text_buf[0..read_rc], " \n\t");
}

/// Parses sysfs capability text: space-separated hex words, most significant
/// first. Words are stored in ascending order so word 0 holds the lowest bits.
fn parse_hex_words(text: []const u8, words: []usize) bool {
    var count: usize = 0;
    var it = std.mem.tokenizeScalar(u8, text, ' ');
    var tokens: [64][]const u8 = undefined;
    while (it.next()) |token| {
        if (count == tokens.len) return false;
        tokens[count] = token;
        count += 1;
    }
    if (count == 0 or count > words.len) return false;
    @memset(words, 0);
    for (tokens[0..count], 0..) |token, i| {
        const word = std.fmt.parseInt(usize, token, 16) catch return false;
        words[count - 1 - i] = word;
    }
    return true;
}

/// Lists the event indices present in `/dev/input`, in ascending order. Caller
/// frees the slice. Uses getdents64 directly; the entry layout is `struct
/// linux_dirent64` (d_ino u64 at 0, d_off i64 at 8, d_reclen u16 at 16, d_type
/// u8 at 18, d_name at 19).
pub fn list_event_indices(allocator: std.mem.Allocator) Error![]u32 {
    const rc = linux.open("/dev/input", .{ .ACCMODE = .RDONLY, .DIRECTORY = true, .CLOEXEC = true }, 0);
    if (linux.errno(rc) != .SUCCESS) return error.SystemError;
    const fd: i32 = @intCast(rc);
    defer _ = linux.close(fd);

    var indices: std.ArrayList(u32) = .empty;
    errdefer indices.deinit(allocator);
    var buffer: [4096]u8 align(8) = undefined;
    while (true) {
        const got_rc = linux.getdents64(fd, &buffer, buffer.len);
        switch (linux.errno(got_rc)) {
            .SUCCESS => {},
            .INTR => continue,
            else => return error.SystemError,
        }
        const got: usize = got_rc;
        if (got == 0) break;
        var offset: usize = 0;
        while (offset < got) {
            const reclen = std.mem.readInt(u16, buffer[offset + 16 ..][0..2], native_endian);
            const name_bytes = buffer[offset + 19 .. offset + reclen];
            const name = name_bytes[0 .. std.mem.indexOfScalar(u8, name_bytes, 0) orelse name_bytes.len];
            if (std.mem.startsWith(u8, name, "event")) {
                const digits = name["event".len..];
                if (digits.len > 0) {
                    if (std.fmt.parseInt(u32, digits, 10)) |index| {
                        try indices.append(allocator, index);
                    } else |_| {}
                }
            }
            offset += reclen;
        }
    }
    std.mem.sort(u32, indices.items, {}, std.sort.asc(u32));
    return indices.toOwnedSlice(allocator);
}

/// Opens every joystick node present, skipping others. Nodes whose sysfs
/// capabilities say they are not joysticks are skipped without being opened.
/// Caller deinitializes each device and frees the slice.
pub fn scan(allocator: std.mem.Allocator, options: Options) Error![]Device {
    const indices = try list_event_indices(allocator);
    defer allocator.free(indices);

    var devices: std.ArrayList(Device) = .empty;
    errdefer {
        for (devices.items) |*device| device.deinit();
        devices.deinit(allocator);
    }
    for (indices) |index| {
        var caps: Capabilities = .{};
        if (read_sysfs_capabilities(index, &caps) and !guess_device_class(caps).joystick) continue;
        const device = open_index(allocator, index, options) catch |err| switch (err) {
            error.NotJoystick, error.SystemError, error.ShortRead, error.NameTooLong, error.Unsupported => continue,
            error.OutOfMemory => return error.OutOfMemory,
        };
        try devices.append(allocator, device);
    }
    return devices.toOwnedSlice(allocator);
}

/// Assigns button, axis, hat and ball indices from the kernel capability bits
/// (ConfigJoystick). Buttons from BTN_JOYSTICK upward come first, then the lower
/// codes, as in SDL.
fn configure(self: *Device, caps: Capabilities) void {
    var button_count: usize = 0;
    var code: usize = btn_joystick;
    while (code < key_count) : (code += 1) {
        if (caps.keys.test_bit(code)) {
            self.key_map[code] = @intCast(button_count);
            self.has_key[code] = true;
            button_count += 1;
        }
    }
    for (0..btn_joystick) |low| {
        if (caps.keys.test_bit(low)) {
            self.key_map[low] = @intCast(button_count);
            self.has_key[low] = true;
            button_count += 1;
        }
    }
    self.layout.buttons = button_count;

    // Digital hats: pairs of hat axes (ABS_HAT0X/Y ... ABS_HAT3X/Y).
    var hat_count: usize = 0;
    var hat_code: usize = abs_hat0x;
    while (hat_code <= abs_hat3y) : (hat_code += 2) {
        const has_x = caps.abs.test_bit(hat_code);
        const has_y = caps.abs.test_bit(hat_code + 1);
        if (!has_x and !has_y) continue;
        var info_x: ?AbsInfo = null;
        var info_y: ?AbsInfo = null;
        var buf: [24]u8 = undefined;
        if (has_x and self.read_abs(hat_code, &buf)) info_x = AbsInfo.decode(&buf);
        if (has_y and self.read_abs(hat_code + 1, &buf)) info_y = AbsInfo.decode(&buf);
        if (!guess_digital_hat(self.options, info_x, info_y)) continue;

        const index = (hat_code - abs_hat0x) / 2;
        self.hat_index[index] = @intCast(hat_count);
        self.has_hat[index] = true;
        self.hat_correct[index] = .{
            .use_deadzones = self.options.hat_deadzones,
            .minimum = .{ if (info_x) |i| i.minimum else -1, if (info_y) |i| i.minimum else -1 },
            .maximum = .{ if (info_x) |i| i.maximum else 1, if (info_y) |i| i.maximum else 1 },
        };
        hat_count += 1;
    }
    self.layout.hats = hat_count;

    // Analog axes, skipping the digital hat pairs.
    var axis_count: usize = 0;
    var axis: usize = 0;
    while (axis < abs_max) : (axis += 1) {
        if (axis >= abs_hat0x and axis <= abs_hat3y and self.has_hat[(axis - abs_hat0x) / 2]) continue;
        if (!caps.abs.test_bit(axis)) continue;
        var buf: [24]u8 = undefined;
        if (!self.read_abs(axis, &buf)) continue;
        const info = AbsInfo.decode(&buf);
        self.abs_map[axis] = @intCast(axis_count);
        self.has_abs[axis] = true;
        var correct: AxisCorrect = .{ .minimum = info.minimum, .maximum = info.maximum };
        if (info.minimum != info.maximum) {
            if (self.options.deadzones) {
                correct.use_deadzones = true;
                const sum: i64 = @as(i64, info.maximum) + info.minimum;
                const flat: i64 = info.flat;
                correct.coef[0] = sum - 2 * flat;
                correct.coef[1] = sum + 2 * flat;
                const span: i64 = (@as(i64, info.maximum) - info.minimum) - 4 * flat;
                correct.coef[2] = if (span != 0) @divTrunc(@as(i64, 1) << 28, span) else 0;
            } else {
                const value_range: f32 = @floatFromInt(@as(i64, info.maximum) - info.minimum);
                const output_range: f32 = @floatFromInt(@as(i64, joystick.axis_max) - joystick.axis_min);
                correct.scale = output_range / value_range;
            }
        }
        self.abs_correct[axis] = correct;
        axis_count += 1;
    }
    self.layout.axes = axis_count;

    if (caps.rel.test_bit(rel_x) or caps.rel.test_bit(rel_y)) self.layout.balls = 1;
}

/// Decides whether a hat-axis pair is digital (GuessIfAxesAreDigitalHat).
fn guess_digital_hat(options: Options, x: ?AbsInfo, y: ?AbsInfo) bool {
    if (x == null and y == null) return false;
    if (options.digital_hats) return true;
    const range_ok = (x == null or (x.?.minimum == -1 and x.?.maximum == 1)) and
        (y == null or (y.?.minimum == -1 and y.?.maximum == 1));
    if (range_ok) return true;
    const no_filter = (x == null or (x.?.fuzz == 0 and x.?.flat == 0 and x.?.resolution == 0)) and
        (y == null or (y.?.fuzz == 0 and y.?.flat == 0 and y.?.resolution == 0));
    return no_filter;
}
