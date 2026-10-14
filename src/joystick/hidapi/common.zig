//! Vocabulary shared by the HIDAPI controller drivers: input indices, report
//! helpers, the output sink that drivers write into, and typed device state.
//!
//! Port of the shared parts of SDL_hidapijoystick.c, SDL_hidapi_nintendo.h and
//! the sensor/power/touchpad calls that the drivers make into SDL_joystick.c.
//!
//! Index conventions: joystick buttons and axes use SDL's SDL_GamepadButton and
//! SDL_GamepadAxis numbers, because HIDAPI devices are described through the
//! gamepad layout and their GUIDs select built-in mappings. Button numbers
//! above the standard set (touchpad, microphone, paddles) are the same values
//! SDL's drivers use, so the constants below must not be renumbered.
//!
//! Ownership: `Output` borrows the joystick, the `Updates` lists and the device
//! `State` for the duration of one update call. Nothing here allocates except
//! the list appends made through `Updates`, which the caller owns.
const std = @import("std");
const hidraw = @import("../../hid/hidraw.zig");
const gamepad = @import("../gamepad.zig");
const joystick = @import("../joystick.zig");
const timestamp = @import("../../events/timestamp.zig");

pub const Allocator = std.mem.Allocator;
/// Nanoseconds in the host monotonic clock domain.
pub const Timestamp = joystick.Timestamp;

/// Gamepad button numbers used as raw joystick button indices (SDL_GamepadButton).
pub const button = struct {
    pub const south: usize = 0;
    pub const east: usize = 1;
    pub const west: usize = 2;
    pub const north: usize = 3;
    pub const back: usize = 4;
    pub const guide: usize = 5;
    pub const start: usize = 6;
    pub const left_stick: usize = 7;
    pub const right_stick: usize = 8;
    pub const left_shoulder: usize = 9;
    pub const right_shoulder: usize = 10;
    pub const misc1: usize = 15;
    pub const right_paddle1: usize = 16;
    pub const left_paddle1: usize = 17;
    pub const right_paddle2: usize = 18;
    pub const left_paddle2: usize = 19;
    pub const touchpad: usize = 20;
    pub const misc2: usize = 21;
};

/// Gamepad axis numbers used as raw joystick axis indices (SDL_GamepadAxis).
pub const axis = struct {
    pub const left_x: usize = 0;
    pub const left_y: usize = 1;
    pub const right_x: usize = 2;
    pub const right_y: usize = 3;
    pub const left_trigger: usize = 4;
    pub const right_trigger: usize = 5;
    /// Number of axes every HIDAPI joystick exposes (SDL_GAMEPAD_AXIS_COUNT).
    pub const count: usize = 6;
};

/// Sensor kinds (SDL_SensorType). Gyroscope values are radians per second and
/// accelerometer values are m/s^2, matching SDL_STANDARD_GRAVITY.
pub const Sensor = enum { gyro, accel };

/// Battery state, as SDL_PowerState.
pub const PowerState = enum { unknown, on_battery, no_battery, charging, charged };

/// Standard gravity in m/s^2 (SDL_STANDARD_GRAVITY).
pub const standard_gravity: f32 = 9.80665;

/// Converts an 8-bit stick or trigger sample to SDL's signed 16-bit range with
/// SDL's rounding: `value * 257 - 32768`, so 0 maps to -32768 and 255 to 32767.
pub fn scale_u8(value: u8) i16 {
    return @intCast(@as(i32, value) * 257 - 32768);
}

/// Trigger value with a digital fallback: when a fightstick reports only its
/// digital trigger bit and the analog byte is zero, the trigger reads fully on.
pub fn trigger_with_digital(value: u8, digital: bool) i16 {
    if (value == 0 and digital) return joystick.axis_max;
    return scale_u8(value);
}

/// Reads a little-endian u16 at `offset`. Bounds are the caller's responsibility.
pub fn read_u16(bytes: []const u8, offset: usize) u16 {
    return std.mem.readInt(u16, bytes[offset..][0..2], .little);
}

/// Reads a little-endian i16 at `offset`.
pub fn read_i16(bytes: []const u8, offset: usize) i16 {
    return std.mem.readInt(i16, bytes[offset..][0..2], .little);
}

/// Reads a little-endian u32 at `offset`.
pub fn read_u32(bytes: []const u8, offset: usize) u32 {
    return std.mem.readInt(u32, bytes[offset..][0..4], .little);
}

/// Hat position from the 4-bit D-pad code used by the Sony and Xbox reports:
/// 0 is up, then clockwise in 45 degree steps, and 8 or more is centered.
pub fn hat_from_dpad(code: u8) joystick.Hat {
    // Bits follow joystick.Hat: up=1, right=2, down=4, left=8.
    const table = [8]u8{ 0x1, 0x3, 0x2, 0x6, 0x4, 0xc, 0x8, 0x9 };
    if (code >= table.len) return joystick.Hat.centered;
    return joystick.Hat.from_bits(table[code]);
}

/// Lowercase "aa-bb-cc-dd-ee-ff" text for a Bluetooth address given in the
/// reverse byte order that the controllers report it in (SDL_snprintf with
/// data[6] down to data[1]).
pub fn format_reversed_mac(bytes: []const u8, buf: *[17]u8) ?[]const u8 {
    if (bytes.len < 6) return null;
    const alphabet = "0123456789abcdef";
    var out: usize = 0;
    var i: usize = 6;
    while (i > 0) {
        i -= 1;
        const b = bytes[i];
        buf[out] = alphabet[b >> 4];
        buf[out + 1] = alphabet[b & 0x0f];
        out += 2;
        if (out < 17) {
            buf[out] = '-';
            out += 1;
        }
    }
    return buf[0..out];
}

/// Verifies the trailing CRC-32 of a Bluetooth HID report. The HIDP transaction
/// header byte (0xA1 for input, 0xA2 for output) is part of the checksum, so it
/// is hashed before the report body, and the last four bytes hold the CRC.
pub fn bluetooth_crc_valid(header: u8, report: []const u8) bool {
    if (report.len < 5) return false;
    const body = report[0 .. report.len - 4];
    const expected = std.mem.readInt(u32, report[report.len - 4 ..][0..4], .little);
    return bluetooth_crc(header, body) == expected;
}

/// Writes the Bluetooth output CRC into the last four bytes of `report`.
/// Uses the output header 0xA2 (SDL_hidapi_ps4.c and SDL_hidapi_ps5.c).
pub fn write_bluetooth_crc(report: []u8) void {
    const crc = bluetooth_crc(0xa2, report[0 .. report.len - 4]);
    std.mem.writeInt(u32, report[report.len - 4 ..][0..4], crc, .little);
}

/// CRC-32 (ISO-HDLC, the zlib polynomial) over a header byte followed by `body`.
pub fn bluetooth_crc(header: u8, body: []const u8) u32 {
    var crc = std.hash.crc.@"CRC-32/ISO-HDLC".init();
    crc.update(&.{header});
    crc.update(body);
    return crc.final();
}

/// Touchpad finger state, in normalized 0..1 coordinates after the driver's
/// scale. Stored per device so callers can read the last known contact.
pub const Finger = struct {
    down: bool = false,
    x: f32 = 0,
    y: f32 = 0,
    pressure: f32 = 0,
};

/// Latest typed values from a device that have no joystick-model equivalent:
/// touchpads (up to two touchpads of two fingers), sensors and battery.
/// Availability is recorded here too: `touchpad_count` and a nonzero
/// `*_rate_hz` mean the device offers that feature (SDL_PrivateJoystickAddTouchpad
/// and SDL_PrivateJoystickAddSensor).
pub const State = struct {
    touchpads: [2][2]Finger = @splat(@splat(.{})),
    touchpad_count: u8 = 0,
    gyro: [3]f32 = @splat(0),
    accel: [3]f32 = @splat(0),
    gyro_rate_hz: f32 = 0,
    accel_rate_hz: f32 = 0,
    /// Sensor sample timestamp rebased to the host monotonic clock.
    sensor_timestamp_ns: timestamp.Timestamp = 0,
    /// Device sensor-clock offset used to rebase sample times.
    sensor_clock: timestamp.SourceClock = .{},
    battery: PowerState = .unknown,
    battery_percent: u8 = 0,

    /// Declares `count` touchpads (at most two are reported).
    pub fn add_touchpad(self: *State, count: u8) void {
        self.touchpad_count = @min(count, 2);
    }

    /// Declares a sensor at `rate_hz`, or changes its rate when already declared.
    pub fn set_sensor_rate(self: *State, kind: Sensor, rate_hz: f32) void {
        switch (kind) {
            .gyro => self.gyro_rate_hz = rate_hz,
            .accel => self.accel_rate_hz = rate_hz,
        }
    }
};

/// Host-selected behavior that SDL reads from hints (SDL_JOYSTICK_*). Set on the
/// registry; every device copies it when discovered.
pub const Config = struct {
    /// SDL_JOYSTICK_ENHANCED_REPORTS. Bluetooth PlayStation controllers honor
    /// all three values; wired controllers always use enhanced reports.
    enhanced_reports: EnhancedReports = .on,
    /// SDL_JOYSTICK_HIDAPI_PS4_REPORT_INTERVAL: 1, 2 or 4 ms. Other values use 4.
    ps4_report_interval_ms: u8 = 4,
    /// SDL_JOYSTICK_HIDAPI_PS5_PLAYER_LED: DualSense touchpad player lights.
    ps5_player_lights: bool = true,
    /// SDL_JOYSTICK_HIDAPI_SWITCH_PLAYER_LED.
    switch_player_lights: bool = true,
    /// SDL_JOYSTICK_HIDAPI_XBOX_360_PLAYER_LED: wired and wireless Xbox 360 slot lights.
    xbox360_player_lights: bool = true,
    /// SDL_JOYSTICK_HIDAPI_XBOX_ONE_HOME_LED brightness, 0 to 50; 0 turns the
    /// Xbox home light off. The default matches SDL's value of 20 when unset.
    xbox_one_home_led: u8 = 20,
    /// SDL_JOYSTICK_HIDAPI_COMBINE_JOY_CONS (default on): a left and a right Joy-Con
    /// are presented as one joystick and their own joysticks are closed.
    combine_joycons: bool = true,
};

/// SDL_JOYSTICK_ENHANCED_REPORTS values. `auto` advertises the features but
/// leaves the controller in its simple report mode until the application asks.
pub const EnhancedReports = enum { off, on, auto };

/// HIDAPI_SupportsPlaystationDetection: vendors whose controllers answer the
/// PlayStation capability query. Razer and Logitech are excluded because some
/// of their devices lock up when probed.
pub fn supports_playstation_detection(vendor: u16, product: u16) bool {
    if (gamepad.type_from_vid_pid(vendor, product, null, false) != .standard) return false;
    return switch (vendor) {
        0x3651, // CRKD
        0x0079, // DragonRise
        0x1b1c, // Corsair
        0x0f0d, // Hori
        0x33df, // Mayflash
        0x146b, // Nacon
        0x3285, // Nacon (alternate)
        0x0e6f, // PDP
        0x24c6, // PowerA
        0x20d6, // PowerA (alternate)
        0x2c22, // Qanba
        0x3958, // Red Octane Games
        0x2563, // Shanwan
        0x20bc, // Shanwan (alternate)
        0x0c12, // ZeroPlus
        0x7545, // SZ-MYPOWER
        => true,
        0x0738 => product != 0x2218, // Mad Catz, except the Saitek side panel
        else => false,
    };
}

/// Reads a feature report with `report_id` as its first byte (SDL's
/// ReadFeatureReport). The buffer is zeroed first. Returns the byte count, or
/// zero on failure, which the drivers treat as "report not available".
pub fn read_feature(hid: *hidraw.Device, report_id: u8, buf: []u8) usize {
    @memset(buf, 0);
    buf[0] = report_id;
    return hid.get_feature_report(buf) catch 0;
}

/// A typed event from a device that the joystick model cannot express.
/// `added` and `removed` mark the device gaining its first or losing its last
/// joystick; `slot_added` and `slot_removed` name one joystick slot.
pub const DeviceEvent = union(enum) {
    added,
    removed,
    slot_added: u8,
    slot_removed: u8,
    touchpad: struct { timestamp: joystick.Timestamp, touchpad: u8, finger: u8, down: bool, x: f32, y: f32, pressure: f32 },
    sensor: struct { timestamp: joystick.Timestamp, sensor: Sensor, data: [3]f32, sensor_timestamp_ns: timestamp.Timestamp },
    battery: struct { timestamp: joystick.Timestamp, state: PowerState, percent: u8 },
};

/// Events produced by one update pass. The caller owns both lists and clears
/// them between passes; `deinit` frees them with the allocator used to fill them.
pub const Updates = struct {
    changes: std.ArrayList(joystick.Change) = .empty,
    device: std.ArrayList(DeviceEvent) = .empty,

    pub fn deinit(self: *Updates, allocator: Allocator) void {
        self.changes.deinit(allocator);
        self.device.deinit(allocator);
        self.* = undefined;
    }

    /// Empties both lists and keeps their capacity.
    pub fn clear(self: *Updates) void {
        self.changes.clearRetainingCapacity();
        self.device.clearRetainingCapacity();
    }
};

/// Sink a driver writes one packet's input into. Each method corresponds to an
/// SDL_SendJoystick* call and carries the host monotonic packet timestamp.
/// `joystick` is null while the device is not connected; then every method is a
/// no-op, as SDL ignores SDL_SendJoystick* calls for a NULL joystick.
pub const Output = struct {
    allocator: Allocator,
    joystick: ?*joystick.Joystick,
    updates: *Updates,
    state: *State,
    timestamp: joystick.Timestamp,

    /// A copy of this sink that writes to `js` instead, for drivers that host
    /// several joysticks (one per slot). Null makes every write a no-op.
    pub fn with_joystick(self: Output, js: ?*joystick.Joystick) Output {
        var copy = self;
        copy.joystick = js;
        return copy;
    }

    pub fn button(self: *Output, index: usize, down: bool) Allocator.Error!void {
        const js = self.joystick orelse return;
        try js.set_button(self.allocator, &self.updates.changes, self.timestamp, index, down);
    }

    pub fn axis(self: *Output, index: usize, value: i16) Allocator.Error!void {
        const js = self.joystick orelse return;
        try js.set_axis(self.allocator, &self.updates.changes, self.timestamp, index, value);
    }

    pub fn hat(self: *Output, value: joystick.Hat) Allocator.Error!void {
        const js = self.joystick orelse return;
        try js.set_hat(self.allocator, &self.updates.changes, self.timestamp, 0, value);
    }

    /// Records one touchpad finger. Coordinates are normalized to 0..1.
    pub fn touchpad_finger(self: *Output, touchpad: u8, finger: u8, down: bool, x: f32, y: f32, pressure: f32) Allocator.Error!void {
        if (self.joystick == null) return;
        if (touchpad >= self.state.touchpads.len or finger >= 2) return;
        self.state.touchpads[touchpad][finger] = .{ .down = down, .x = x, .y = y, .pressure = pressure };
        try self.updates.device.append(self.allocator, .{ .touchpad = .{
            .timestamp = self.timestamp,
            .touchpad = touchpad,
            .finger = finger,
            .down = down,
            .x = x,
            .y = y,
            .pressure = pressure,
        } });
    }

    /// Records one three-axis sample. The driver's nanosecond clock is rebased
    /// onto the host monotonic domain before it is exposed in state or events.
    pub fn sensor(self: *Output, kind: Sensor, data: [3]f32, sensor_clock_ns: u64) Allocator.Error!void {
        if (self.joystick == null) return;
        const sample_timestamp = self.state.sensor_clock.rebase(sensor_clock_ns, self.timestamp);
        switch (kind) {
            .gyro => self.state.gyro = data,
            .accel => self.state.accel = data,
        }
        self.state.sensor_timestamp_ns = sample_timestamp;
        try self.updates.device.append(self.allocator, .{ .sensor = .{
            .timestamp = self.timestamp,
            .sensor = kind,
            .data = data,
            .sensor_timestamp_ns = sample_timestamp,
        } });
    }

    pub fn battery(self: *Output, state: PowerState, percent: u8) Allocator.Error!void {
        if (self.joystick == null) return;
        self.state.battery = state;
        self.state.battery_percent = percent;
        try self.updates.device.append(self.allocator, .{ .battery = .{
            .timestamp = self.timestamp,
            .state = state,
            .percent = percent,
        } });
    }
};

/// Touch position from the 3-byte packed form used by both Sony touchpads:
/// X is 12 bits in byte 0 and the low nibble of byte 1, Y is 12 bits from the
/// high nibble of byte 1 and byte 2. Values are raw sensor units.
pub fn touch_position(data: [3]u8) struct { x: u16, y: u16 } {
    const x = @as(u16, data[0]) | (@as(u16, data[1] & 0x0f) << 8);
    const y = (@as(u16, data[1]) >> 4) | (@as(u16, data[2]) << 4);
    return .{ .x = x, .y = y };
}

/// Battery decoding for the DualSense report (SDL_hidapi_ps5.c): the low nibble
/// is the level in tens of percent, and the high nibble selects discharging,
/// charging or full. Level 0x0C means the controller reports no level.
pub fn battery_from_sony(status: u8, level: u8) struct { state: PowerState, percent: u8 } {
    return switch (status) {
        0 => .{ .state = .on_battery, .percent = @min(level * 10 + 5, 100) },
        1 => .{ .state = .charging, .percent = @min(level * 10 + 5, 100) },
        2 => .{ .state = .charged, .percent = 100 },
        else => .{ .state = .unknown, .percent = 0 },
    };
}
