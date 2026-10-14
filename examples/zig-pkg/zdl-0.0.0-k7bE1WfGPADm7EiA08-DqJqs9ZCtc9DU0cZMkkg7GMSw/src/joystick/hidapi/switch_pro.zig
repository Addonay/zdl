//! Nintendo Switch Pro Controller over USB and Bluetooth (HIDAPI).
//!
//! Port of the Pro Controller path of SDL_hidapi_switch.c: the USB handshake
//! (handshake, high speed, handshake, force USB), device identity, stick and IMU
//! calibration from SPI flash, input reports 0x30/0x31 (buttons, hat, sticks,
//! triggers, battery, IMU samples), output subcommands with replies (input mode,
//! vibration enable, player lights, home light, IMU enable), and HD rumble
//! encoding.
//!
//! Not ported:
//! - Joy-Cons, the NES, SNES, N64 and Genesis controllers, GameCube and other
//!   input-only modes, and the Switch 2 Pro layout. These controllers are not
//!   claimed by this driver.
//! - Simple (0x3F) input reports are ignored. The driver requests the full
//!   report mode unless enhanced reports are configured off.
//! - Combined Joy-Con sensor routing and the vertical-mode options.
//!
//! Deliberate differences from SDL:
//! - SDL waits with SDL_Delay: 250 ms before the open sequence, 1 ms between
//!   reply polls, and 100 ms per reply window. Here each reply window is 100
//!   polls of 1 ms, and the open sequence does not pause first.
//! - Rumble writes go straight to the device (as SDL's WriteOutput does), so the
//!   output queue is not used by this driver.
//! - The 0.7 scale for stick extents, and the remap when an extent is zero,
//!   return zero instead of undefined float-to-integer conversion.
//! - The Home LED is set only through `set_led`; SDL's hint-driven brightness is
//!   not read.
const std = @import("std");
const joystick = @import("../joystick.zig");
const common = @import("common.zig");
const device = @import("device.zig");

const Error = device.Error;
const Device = device.Device;
const Output = common.Output;
const Report = device.Report;

const vendor_nintendo: u16 = 0x057e;
const product_pro_controller: u16 = 0x2009;
const product_joycon_left: u16 = 0x2006;
const product_joycon_right: u16 = 0x2007;

/// Controller types from the device info reply (ESwitchDeviceInfoControllerType).
const controller_unknown: u8 = 0;
const controller_pro: u8 = 3;
const controller_lic_pro: u8 = 6;

/// Input report IDs.
const report_subcommand_reply: u8 = 0x21;
const report_full: u8 = 0x30;
const report_full_mcu: u8 = 0x31;
const report_simple: u8 = 0x3f;
const report_command_ack: u8 = 0x81;

/// Output report IDs.
const out_rumble_subcommand: u8 = 0x01;
const out_rumble: u8 = 0x10;
const out_proprietary: u8 = 0x80;

/// Subcommand IDs (ESwitchSubcommandIDs).
const sub_request_device_info: u8 = 0x02;
const sub_set_input_report_mode: u8 = 0x03;
const sub_spi_flash_read: u8 = 0x10;
const sub_set_player_lights: u8 = 0x30;
const sub_set_home_light: u8 = 0x38;
const sub_enable_imu: u8 = 0x40;
const sub_enable_vibration: u8 = 0x48;

/// Proprietary command IDs (ESwitchProprietaryCommandIDs).
const prop_status: u8 = 0x01;
const prop_handshake: u8 = 0x02;
const prop_high_speed: u8 = 0x03;
const prop_force_usb: u8 = 0x04;

/// SPI flash ranges as (address, length), from SDL's k_unSPI*Offset constants.
const stick_factory = .{ .address = 0x603d, .length = 0x12 };
const stick_user = .{ .address = 0x8010, .length = 0x16 };
const imu_factory = .{ .address = 0x6020, .length = 0x18 };
const imu_user = .{ .address = 0x8026, .length = 0x14 };

/// Attempts per subcommand or proprietary command (GetMaxWriteAttempts).
const max_write_attempts = 5;
/// Polls of 1 ms each while waiting for a reply.
const reply_poll_limit = 100;
/// Subcommand reply payload size (SwitchSubcommandInputPacket_t after the ack and ID bytes).
const reply_data_size = 35;

/// Rumble timing: a new packet waits this long after the previous one, and an
/// active rumble is refreshed after the refresh period (RUMBLE_*_FREQUENCY_MS).
const rumble_write_interval_ns: u64 = 30 * std.time.ns_per_ms;
const rumble_refresh_interval_ns: u64 = 50 * std.time.ns_per_ms;
/// IMU reset after data stops arriving (IMU_RESET_DELAY_MS).
const imu_reset_delay_ns: u64 = 3000 * std.time.ns_per_ms;
/// USB keep-alive: force USB again after this much silence.
const usb_input_wait_ns: u64 = 100 * std.time.ns_per_ms;
/// Bluetooth controllers are dropped after this much silence in full mode.
const bluetooth_input_wait_ns: u64 = 3000 * std.time.ns_per_ms;

/// Gyro and accelerometer constants from SDL_hidapi_switch.c.
const gyro_scale_mult: f32 = 936.0;
const accel_scale_mult: f32 = 4.0;
const gyro_default_divisor: f32 = 14.2842;
const accel_default_divisor: f32 = 4096.0;
const imu_sample_frequency: u32 = 1000;
const imu_initial_interval_ns: u64 = 5 * std.time.ns_per_ms;

/// Player light patterns for players 1 to 8.
const player_pattern = [8]u8{ 0x1, 0x3, 0x7, 0xf, 0x9, 0x5, 0xd, 0x6 };

/// Calibrated stick data, per axis: center, minimum and maximum.
const StickCalibration = struct {
    center: [2]i16 = .{ 0, 0 },
    min: [2]i16 = .{ 0, 0 },
    max: [2]i16 = .{ 0, 0 },
};

/// Running extents used to scale stick values to the full range.
const StickExtents = struct {
    min: [2]i16 = .{ 0, 0 },
    max: [2]i16 = .{ 0, 0 },
};

/// Per-axis IMU scale and gyro offsets (SDL's IMUScaleData).
const ImuScale = struct {
    accel: [3]f32 = @splat(standard_gravity / accel_default_divisor),
    gyro: [3]f32 = @splat(std.math.pi / 180.0 / gyro_default_divisor),
    gyro_offset: [3]i16 = @splat(0),
};

const standard_gravity: f32 = common.standard_gravity;

/// Driver state for one Switch Pro Controller (SDL_DriverSwitch_Context).
pub const Context = struct {
    controller_type: u8 = controller_unknown,
    initial_input_mode: u8 = 0,
    current_input_mode: u8 = 0,
    /// 4-bit packet counter carried in every output report.
    command_number: u8 = 0,
    enhanced_report_hint: common.EnhancedReports = .on,
    enhanced_mode: bool = false,
    enhanced_mode_available: bool = false,
    /// Rumble data for the two motors: [0..4] left, [4..8] right.
    rumble_data: [8]u8 = neutral_rumble ++ neutral_rumble,
    rumble_sent_ns: u64 = 0,
    rumble_active: bool = false,
    rumble_pending: bool = false,
    rumble_zero_pending: bool = false,
    /// Highest pending value packed as low<<16 | high (m_unRumblePending).
    rumble_pending_value: u32 = 0,
    sensors_supported: bool = false,
    report_sensors: bool = false,
    has_sensor_data: bool = false,
    last_input_ns: u64 = 0,
    last_imu_reset_ns: u64 = 0,
    imu_sample_timestamp_ns: u64 = 0,
    imu_samples: u32 = 0,
    imu_update_interval_ns: u64 = imu_initial_interval_ns,
    timestamp_ns: u64 = 0,
    player_index: i32 = -1,
    player_lights: bool = true,
    stick_calibration: [2]StickCalibration = @splat(.{}),
    stick_extents: [2]StickExtents = @splat(.{}),
    imu: ImuScale = .{},
    last_buttons: [3]u8 = @splat(0),
    /// Time of the current update pass, in nanoseconds.
    now_ns: u64 = 0,
    power_state: common.PowerState = .unknown,
    power_percent: u8 = 0,
};

/// The neutral rumble for one motor: standard value (rgucData in SetNeutralRumble).
const neutral_rumble = [4]u8{ 0x00, 0x01, 0x40, 0x40 };

/// Features the open joystick advertises (SDL_GetJoystickCapabilities).
pub fn capabilities(ctx: *const Context) device.Capabilities {
    _ = ctx;
    return .{ .rumble = true };
}

/// IsSupportedDevice: the Pro Controller over either transport.
pub fn supports(probe: device.Probe) bool {
    if (probe.gamepad_type == .switch_pro) return true;
    return probe.vendor_id == vendor_nintendo and probe.product_id == product_pro_controller;
}

/// Layout: 11 buttons, the Share button at index 11, then four paddle slots
/// that the Pro Controller leaves unused (SDL_GAMEPAD_NUM_SWITCH_BUTTONS = 16).
pub fn layout(ctx: *const Context, dev: *const Device) joystick.Layout {
    _ = ctx;
    _ = dev;
    return .{ .axes = common.axis.count, .buttons = 16, .hats = 1, .balls = 0 };
}

/// Reads the device info, sets the identity (controller type in the GUID
/// driver-data byte, the MAC as serial), and prefers a USB copy when present.
pub fn init(ctx: *Context, dev: *Device, env: device.Env) Error!bool {
    ctx.* = .{};
    ctx.rumble_data = neutral_rumble ++ neutral_rumble;
    var mac: [6]u8 = @splat(0);
    if (try read_device_identity(ctx, dev, &mac)) |kind| {
        ctx.controller_type = kind;
    }
    if (ctx.controller_type == controller_unknown and dev.info.product_id == product_pro_controller) {
        ctx.controller_type = controller_pro;
    }
    if (ctx.controller_type == controller_pro or ctx.controller_type == controller_lic_pro) {
        dev.gamepad_type = .switch_pro;
        dev.guid.data[15] = ctx.controller_type;
        var text: [17]u8 = undefined;
        try dev.set_serial(format_mac(&mac, &text));
    }
    if (dev.info.bluetooth and env.has_connected_usb(dev.info.serial)) return false;
    return true;
}

/// Device type and MAC from the device info. Over USB the answer is the
/// proprietary status reply, and the MAC arrives in reverse byte order.
pub fn read_device_identity(ctx: *Context, dev: *Device, mac: *[6]u8) Error!?u8 {
    if (dev.info.bluetooth) {
        const reply = (try write_subcommand(ctx, dev, sub_request_device_info, &.{}, null)) orelse return null;
        // Device info: firmware (2 bytes), device type, filler, MAC (6 bytes).
        @memcpy(mac[0..6], reply[4..10]);
        return reply[2];
    }
    const status = (try send_proprietary(ctx, dev, prop_status, &.{}, true)) orelse return null;
    for (mac, 0..) |*byte, i| byte.* = status[4 + (mac.len - i - 1)];
    return status[3];
}

/// "aa-bb-cc-dd-ee-ff" for the MAC address, as the serial string SDL builds.
pub fn format_mac(mac: *const [6]u8, buf: *[17]u8) []const u8 {
    const alphabet = "0123456789abcdef";
    var out: usize = 0;
    for (mac, 0..) |byte, i| {
        if (i > 0) {
            buf[out] = '-';
            out += 1;
        }
        buf[out] = alphabet[byte >> 4];
        buf[out + 1] = alphabet[byte & 0x0f];
        out += 2;
    }
    return buf[0..out];
}

/// OpenJoystick: performs the USB handshake, loads calibration, enables
/// vibration and the enhanced report mode, and sets the player lights. Errors
/// mean the controller did not answer and the joystick does not open.
pub fn open(ctx: *Context, dev: *Device) Error!void {
    ctx.last_input_ns = 0;
    ctx.player_lights = dev.config.switch_player_lights;
    if (ctx.initial_input_mode == 0) {
        var buf: [64]u8 = undefined;
        _ = try read_input(ctx, dev, &buf, 1);
    }
    ctx.current_input_mode = ctx.initial_input_mode;
    ctx.rumble_data = neutral_rumble ++ neutral_rumble;

    if (!dev.info.bluetooth) {
        if (!(try setup_usb(ctx, dev))) return error.ProtocolError;
    }
    if (!(try load_stick_calibration(ctx, dev))) return error.ProtocolError;
    try load_imu_calibration(ctx, dev);
    ctx.sensors_supported = true;

    _ = try set_vibration(ctx, dev, true);
    try set_enhanced_report_hint(ctx, dev, dev.config.enhanced_reports);
    if (!dev.info.bluetooth) {
        if (try send_proprietary(ctx, dev, prop_force_usb, &.{}, false) == null) return error.ProtocolError;
    }
    try update_slot_led(ctx, dev);
    ctx.imu_samples = 0;
    ctx.imu_sample_timestamp_ns = 0;
    ctx.imu_update_interval_ns = imu_initial_interval_ns;
}

/// Releases the controller: restores simple reports for other applications
/// when that is how the controller started, and clears enhanced state.
pub fn close(ctx: *Context, dev: *Device) void {
    if (ctx.initial_input_mode == 0 or ctx.initial_input_mode == report_simple) {
        set_input_mode(ctx, dev, report_simple) catch {};
    }
    ctx.report_sensors = false;
    ctx.enhanced_mode = false;
    ctx.enhanced_mode_available = false;
}

/// USB handshake: handshake, high speed, handshake again, then force USB. The
/// first handshake must succeed; the others may fail, as SDL allows.
fn setup_usb(ctx: *Context, dev: *Device) Error!bool {
    if (try send_proprietary(ctx, dev, prop_handshake, &.{}, true) == null) return false;
    _ = try send_proprietary(ctx, dev, prop_high_speed, &.{}, true);
    _ = try send_proprietary(ctx, dev, prop_handshake, &.{}, true);
    if (try send_proprietary(ctx, dev, prop_force_usb, &.{}, false) == null) return false;
    return true;
}

/// Turns the advertised features on (SDL SetEnhancedModeAvailable): the gyro and
/// accelerometer report at 200 Hz.
pub fn set_enhanced_mode_available(ctx: *Context, dev: *Device) void {
    if (ctx.enhanced_mode_available) return;
    ctx.enhanced_mode_available = true;
    if (ctx.sensors_supported) {
        dev.state.set_sensor_rate(.gyro, 200.0);
        dev.state.set_sensor_rate(.accel, 200.0);
    }
}

pub fn set_enhanced_report_hint(ctx: *Context, dev: *Device, hint: common.EnhancedReports) Error!void {
    ctx.enhanced_report_hint = hint;
    switch (hint) {
        .off => ctx.enhanced_mode = false,
        .on => {
            set_enhanced_mode_available(ctx, dev);
            ctx.enhanced_mode = true;
        },
        .auto => set_enhanced_mode_available(ctx, dev),
    }
    try update_input_mode(ctx, dev);
}

pub fn update_enhanced_on_enhanced_report(ctx: *Context, dev: *Device) Error!void {
    if (ctx.enhanced_report_hint == .auto) try set_enhanced_report_hint(ctx, dev, .on);
}

fn update_enhanced_on_application_usage(ctx: *Context, dev: *Device) Error!void {
    if (ctx.enhanced_report_hint == .auto) try set_enhanced_report_hint(ctx, dev, .on);
}

/// Input mode for normal use: the initial mode when known, else full, with the
/// enhanced-report hint applied (GetDefaultInputMode).
fn default_input_mode(ctx: *const Context, dev: *const Device) u8 {
    var mode: u8 = if (ctx.initial_input_mode != 0)
        ctx.initial_input_mode
    else if (dev.info.bluetooth) report_simple else report_full;
    switch (ctx.enhanced_report_hint) {
        .off => mode = report_simple,
        .on => if (mode == report_simple) {
            mode = report_full;
        },
        // Joy-Cons turn their sticks into a D-pad in simple mode, so they use full reports.
        .auto => if (dev.info.vendor_id == vendor_nintendo and
            (dev.info.product_id == product_joycon_left or dev.info.product_id == product_joycon_right))
        {
            mode = report_full;
        },
    }
    if (mode == report_simple and !dev.info.bluetooth) mode = report_full;
    return mode;
}

/// Input mode while motion data is wanted: full reports are needed for IMU samples.
fn sensor_input_mode(ctx: *const Context) u8 {
    if (ctx.initial_input_mode == 0 or ctx.initial_input_mode == report_simple) return report_full;
    return ctx.initial_input_mode;
}

pub fn update_input_mode(ctx: *Context, dev: *Device) Error!void {
    const mode = if (ctx.report_sensors) sensor_input_mode(ctx) else default_input_mode(ctx, dev);
    try set_input_mode(ctx, dev, mode);
}

/// Sets the report mode with a subcommand. Unchanged modes are not resent.
pub fn set_input_mode(ctx: *Context, dev: *Device, mode: u8) Error!void {
    if (mode == ctx.current_input_mode) return;
    ctx.current_input_mode = mode;
    _ = try write_subcommand(ctx, dev, sub_set_input_report_mode, &.{mode}, null);
}

/// Enables or disables vibration. Returns whether the controller acknowledged it.
pub fn set_vibration(ctx: *Context, dev: *Device, enabled: bool) Error!bool {
    const value = [_]u8{@intFromBool(enabled)};
    return (try write_subcommand(ctx, dev, sub_enable_vibration, &value, null)) != null;
}

/// Enables or disables the IMU sensors.
pub fn set_imu_enabled(ctx: *Context, dev: *Device, enabled: bool) Error!bool {
    const value = [_]u8{@intFromBool(enabled)};
    return (try write_subcommand(ctx, dev, sub_enable_imu, &value, null)) != null;
}

/// Sets the player lights from the player index, as SDL's UpdateSlotLED does.
pub fn update_slot_led(ctx: *Context, dev: *Device) Error!void {
    var pattern: u8 = 0;
    if (ctx.player_lights and ctx.player_index >= 0) {
        pattern = player_pattern[@as(usize, @intCast(@mod(ctx.player_index, 8)))];
    }
    _ = try write_subcommand(ctx, dev, sub_set_player_lights, &.{pattern}, null);
}

/// Stores the player index and refreshes the lights (SetDevicePlayerIndex).
pub fn set_player_index(ctx: *Context, dev: *Device, index: i32) void {
    if (!dev.is_connected()) return;
    ctx.player_index = index;
    update_slot_led(ctx, dev) catch {};
}

/// Home light brightness (SetHomeLED): a 0 to 100 percent request, mapped to the
/// controller's 0..15 intensity with the curve SDL uses.
pub fn set_home_led(ctx: *Context, dev: *Device, brightness: u8) Error!void {
    var intensity: u8 = 0;
    if (brightness > 0) {
        if (brightness < 65) {
            intensity = (brightness + 5) / 10;
        } else {
            const ratio = @as(f32, @floatFromInt(brightness)) / 100.0;
            intensity = @intFromFloat(@ceil(15.0 * std.math.pow(f32, ratio, 2.13)));
        }
    }
    const buf = [4]u8{
        0x01, // no extra cycles, 8 ms cycle duration
        (intensity & 0x0f) << 4,
        (intensity & 0x0f) << 4,
        0x00,
    };
    _ = try write_subcommand(ctx, dev, sub_set_home_light, &buf, null);
}

/// LED for Pro Controllers: the largest channel, as a percentage, sets the home light.
pub fn set_led(ctx: *Context, dev: *Device, red: u8, green: u8, blue: u8) Error!void {
    const peak = @max(red, @max(green, blue));
    const percent: u8 = @intFromFloat(@as(f32, @floatFromInt(peak)) / 255.0 * 100.0);
    try set_home_led(ctx, dev, percent);
}

/// Stick calibration from SPI flash (LoadStickCalibration). User calibration is
/// used per stick when its magic bytes are present; factory calibration fills
/// in the rest. Returns false when the flash cannot be read.
pub fn load_stick_calibration(ctx: *Context, dev: *Device) Error!bool {
    var left: [9]u8 = @splat(0);
    var right: [9]u8 = @splat(0);
    var have_left = false;
    var have_right = false;

    if (try read_spi(ctx, dev, stick_user.address, stick_user.length)) |user| {
        // SPI data starts at byte 5 of the reply (after the 5-byte address/length header).
        if (user[5] == 0xb2 and user[6] == 0xa1) {
            have_left = true;
            @memcpy(&left, user[7..16]);
        }
        if (user[16] == 0xb2 and user[17] == 0xa1) {
            have_right = true;
            @memcpy(&right, user[18..27]);
        }
    }

    if (!have_left or !have_right) {
        const max_factory_attempts = 3;
        var attempt: usize = 0;
        while (true) : (attempt += 1) {
            const factory = (try read_spi(ctx, dev, stick_factory.address, stick_factory.length)) orelse return false;
            if (std.mem.readInt(u32, factory[0..4], .little) == stick_factory.address) {
                if (!have_left) {
                    have_left = true;
                    @memcpy(&left, factory[5..14]);
                }
                if (!have_right) {
                    have_right = true;
                    @memcpy(&right, factory[14..23]);
                }
                break;
            }
            if (attempt == max_factory_attempts) return false;
        }
    }
    if (!have_left or !have_right) return false;

    ctx.stick_calibration[0] = decode_left_stick(left);
    ctx.stick_calibration[1] = decode_right_stick(right);
    for (&ctx.stick_calibration) |*stick| {
        for (0..2) |axis| {
            // 0xFFF marks an unset field: center defaults to 2048, extents to 70% of center.
            if (stick.center[axis] == 0xfff) stick.center[axis] = 2048;
            if (stick.max[axis] == 0xfff) stick.max[axis] = scale_to_70(stick.center[axis]);
            if (stick.min[axis] == 0xfff) stick.min[axis] = scale_to_70(stick.center[axis]);
        }
    }
    for (ctx.stick_calibration, 0..) |stick, index| {
        for (0..2) |axis| {
            ctx.stick_extents[index].min[axis] = -scale_to_70(stick.min[axis]);
            ctx.stick_extents[index].max[axis] = scale_to_70(stick.max[axis]);
        }
    }
    return true;
}

/// Truncating 0.7 scale used for stick extents (`(Sint16)(v * 0.7f)` in SDL).
fn scale_to_70(value: i16) i16 {
    return @intFromFloat(@as(f32, @floatFromInt(value)) * 0.7);
}

/// The left stick's 12-bit fields are packed as max, center, min.
fn decode_left_stick(cal: [9]u8) StickCalibration {
    return .{
        .max = .{ unpack12(cal[1], cal[0]), unpack12_hi(cal[2], cal[1]) },
        .center = .{ unpack12(cal[4], cal[3]), unpack12_hi(cal[5], cal[4]) },
        .min = .{ unpack12(cal[7], cal[6]), unpack12_hi(cal[8], cal[7]) },
    };
}

/// The right stick's 12-bit fields are packed as center, min, max.
fn decode_right_stick(cal: [9]u8) StickCalibration {
    return .{
        .center = .{ unpack12(cal[1], cal[0]), unpack12_hi(cal[2], cal[1]) },
        .min = .{ unpack12(cal[4], cal[3]), unpack12_hi(cal[5], cal[4]) },
        .max = .{ unpack12(cal[7], cal[6]), unpack12_hi(cal[8], cal[7]) },
    };
}

/// Low 12-bit field from a byte pair (x-axis form: high nibble of byte 1 is discarded).
fn unpack12(hi: u8, lo: u8) i16 {
    return @intCast(((@as(u16, hi) << 8) & 0xf00) | lo);
}

/// The second 12-bit field of a three-byte group (y-axis form).
fn unpack12_hi(hi: u8, lo: u8) i16 {
    return @intCast((@as(u16, hi) << 4) | (@as(u16, lo) >> 4));
}

/// IMU scale and offset from factory flash, replaced by user calibration when its
/// magic (0xA1B2) is present. Without either, the documented defaults apply.
pub fn load_imu_calibration(ctx: *Context, dev: *Device) Error!void {
    const factory = try read_spi(ctx, dev, imu_factory.address, imu_factory.length);
    const reply = factory orelse {
        ctx.imu = .{};
        return;
    };
    const p = reply[5..];
    var accel_raw: [3]i16 = .{ read_i16(p, 0), read_i16(p, 2), read_i16(p, 4) };
    const accel_sens: [3]i16 = .{ read_i16(p, 6), read_i16(p, 8), read_i16(p, 10) };
    var gyro_raw: [3]i16 = .{ read_i16(p, 12), read_i16(p, 14), read_i16(p, 16) };
    const gyro_sens: [3]i16 = .{ read_i16(p, 18), read_i16(p, 20), read_i16(p, 22) };

    if (try read_spi(ctx, dev, imu_user.address, imu_user.length)) |user| {
        const u = user[5..];
        if (read_u16(u, 0) == 0xa1b2) {
            accel_raw = .{ read_i16(u, 2), read_i16(u, 4), read_i16(u, 6) };
            gyro_raw = .{ read_i16(u, 14), read_i16(u, 16), read_i16(u, 18) };
        }
    }

    ctx.imu.gyro_offset = gyro_raw;
    for (0..3) |axis| {
        ctx.imu.accel[axis] = accel_scale_mult / (@as(f32, @floatFromInt(accel_sens[axis])) - @as(f32, @floatFromInt(accel_raw[axis]))) * standard_gravity;
        ctx.imu.gyro[axis] = gyro_scale_mult / (@as(f32, @floatFromInt(gyro_sens[axis])) - @as(f32, @floatFromInt(gyro_raw[axis]))) * std.math.pi / 180.0;
    }
}

fn read_i16(bytes: []const u8, offset: usize) i16 {
    return std.mem.readInt(i16, bytes[offset..][0..2], .little);
}

fn read_u16(bytes: []const u8, offset: usize) u16 {
    return std.mem.readInt(u16, bytes[offset..][0..2], .little);
}

/// Applies calibration to a 12-bit stick sample (ApplyStickCalibration). Values
/// beyond the known extents widen them, and the result is scaled to the 16-bit range.
pub fn apply_stick_calibration(ctx: *Context, stick: usize, axis: usize, raw: i16) i16 {
    const centered: i16 = raw -% ctx.stick_calibration[stick].center[axis];
    const extents = &ctx.stick_extents[stick];
    if (centered >= 0) {
        if (centered > extents.max[axis]) extents.max[axis] = centered;
        return remap_to_i16(centered, 0, extents.max[axis], 0, std.math.maxInt(i16));
    }
    if (centered < extents.min[axis]) extents.min[axis] = centered;
    return remap_to_i16(centered, extents.min[axis], 0, std.math.minInt(i16), 0);
}

/// HIDAPI_RemapVal followed by truncation to i16. A degenerate range returns
/// zero, where SDL would convert a NaN to an integer.
fn remap_to_i16(value: i16, in_min: i16, in_max: i16, out_min: i16, out_max: i16) i16 {
    const span = @as(f32, @floatFromInt(in_max)) - @as(f32, @floatFromInt(in_min));
    if (span == 0) return 0;
    const v = @as(f32, @floatFromInt(out_min)) + (@as(f32, @floatFromInt(out_max)) - @as(f32, @floatFromInt(out_min))) *
        (@as(f32, @floatFromInt(value)) - @as(f32, @floatFromInt(in_min))) / span;
    return @intFromFloat(v);
}

/// Encodes one motor's rumble into four bytes. The frequencies are fixed, and the
/// amplitudes come from the lookup tables below.
fn encode_rumble(data: *[4]u8, high_freq: u16, high_amp: u8, low_freq: u8, low_amp: u16) void {
    data[0] = @truncate(high_freq & 0xff);
    data[1] = high_amp | @as(u8, @truncate((high_freq >> 8) & 0x01));
    data[2] = low_freq | @as(u8, @truncate((low_amp >> 8) & 0x80));
    data[3] = @truncate(low_amp & 0xff);
}

/// Encodes a 16-bit amplitude to the high-frequency motor's code (EncodeRumbleHighAmplitude).
fn encode_high_amplitude(amplitude: u16) u8 {
    for (high_amplitude) |entry| {
        if (amplitude <= entry[0]) return entry[1];
    }
    return high_amplitude[high_amplitude.len - 1][1];
}

/// Encodes a 16-bit amplitude to the low-frequency motor's code (EncodeRumbleLowAmplitude).
fn encode_low_amplitude(amplitude: u16) u16 {
    for (low_amplitude) |entry| {
        if (amplitude <= entry[0]) return entry[1];
    }
    return low_amplitude[low_amplitude.len - 1][1];
}

/// Sends the current rumble state in an output report 0x10 and advances the packet counter.
pub fn write_rumble(ctx: *Context, dev: *Device) Error!void {
    var packet: [10]u8 = undefined;
    packet[0] = out_rumble;
    packet[1] = next_command_number(ctx);
    @memcpy(packet[2..10], &ctx.rumble_data);
    ctx.rumble_sent_ns = ctx.now_ns;
    try send_packet(dev, &packet);
}

fn next_command_number(ctx: *Context) u8 {
    const number = ctx.command_number;
    ctx.command_number = (ctx.command_number +% 1) & 0x0f;
    return number;
}

/// Applies one rumble request (ActuallyRumbleJoystick).
fn actually_rumble(ctx: *Context, dev: *Device, low: u16, high: u16) Error!void {
    const high_freq: u16 = 0x0074;
    const low_freq: u8 = 0x3d;
    if (low != 0 or high != 0) {
        const high_amp = encode_high_amplitude(high);
        const low_amp = encode_low_amplitude(low);
        var left: [4]u8 = undefined;
        var right: [4]u8 = undefined;
        encode_rumble(&left, high_freq, high_amp, low_freq, low_amp);
        encode_rumble(&right, high_freq, high_amp, low_freq, low_amp);
        ctx.rumble_data = left ++ right;
    } else {
        ctx.rumble_data = neutral_rumble ++ neutral_rumble;
    }
    ctx.rumble_active = low != 0 or high != 0;
    try write_rumble(ctx, dev);
}

/// Sends the pending rumble if the write interval has passed (SendPendingRumble).
pub fn send_pending_rumble(ctx: *Context, dev: *Device) Error!void {
    if (ctx.now_ns < ctx.rumble_sent_ns + rumble_write_interval_ns) return;
    if (ctx.rumble_pending) {
        const low: u16 = @truncate(ctx.rumble_pending_value >> 16);
        const high: u16 = @truncate(ctx.rumble_pending_value);
        ctx.rumble_pending = false;
        ctx.rumble_pending_value = 0;
        try actually_rumble(ctx, dev, low, high);
        return;
    }
    if (ctx.rumble_zero_pending) {
        ctx.rumble_zero_pending = false;
        try actually_rumble(ctx, dev, 0, 0);
    }
}

/// Rumble request. A request that arrives within the write interval is held and
/// the strongest held value is sent later; a zero request clears the motors.
pub fn rumble(ctx: *Context, dev: *Device, low: u16, high: u16) Error!void {
    if (ctx.rumble_pending) try send_pending_rumble(ctx, dev);
    if (ctx.now_ns < ctx.rumble_sent_ns + rumble_write_interval_ns) {
        if (low != 0 or high != 0) {
            const packed_value = (@as(u32, low) << 16) | high;
            if (packed_value > ctx.rumble_pending_value) ctx.rumble_pending_value = packed_value;
            ctx.rumble_pending = true;
            ctx.rumble_zero_pending = false;
        } else {
            ctx.rumble_zero_pending = true;
        }
        return;
    }
    try actually_rumble(ctx, dev, low, high);
}

/// Reads one input report. Returns null when nothing arrives within the timeout.
/// The first full or simple report seen sets the initial input mode.
pub fn read_input(ctx: *Context, dev: *Device, buf: []u8, timeout_ms: u32) Error!?[]u8 {
    const data = (try dev.read_report_timeout(buf, timeout_ms)) orelse return null;
    if (ctx.initial_input_mode == 0) {
        switch (data[0]) {
            report_full, report_full_mcu, report_simple => ctx.initial_input_mode = data[0],
            else => {},
        }
    }
    return data;
}

/// Sends one output report, padded to the transport's size (49 bytes over
/// Bluetooth, 64 over USB). The write is synchronous so replies can be awaited.
fn send_packet(dev: *Device, packet: []const u8) Error!void {
    var padded: [64]u8 = @splat(0);
    const size: usize = if (dev.info.bluetooth) 49 else 64;
    @memcpy(padded[0..packet.len], packet);
    _ = try dev.write_report_now(padded[0..size]);
}

/// Waits for the subcommand reply with `id`. The reply's acknowledge bit must be
/// set, and an SPI read must echo its address and length.
fn wait_subcommand_reply(ctx: *Context, dev: *Device, id: u8, expect_spi: ?[5]u8) Error!?[reply_data_size]u8 {
    var buf: [64]u8 = undefined;
    var poll: usize = 0;
    while (poll < reply_poll_limit) : (poll += 1) {
        const data = (try read_input(ctx, dev, &buf, 1)) orelse continue;
        if (data[0] != report_subcommand_reply or data.len < 15) continue;
        // Layout after the report ID: 12 bytes of controller state, the acknowledge, the subcommand ID, then data.
        if (data[14] != id or data[13] & 0x80 == 0) continue;
        if (expect_spi) |spi| {
            if (data.len < 20 or !std.mem.eql(u8, data[15..20], &spi)) continue;
        }
        var reply: [reply_data_size]u8 = @splat(0);
        const n = @min(data.len - 15, reply_data_size);
        @memcpy(reply[0..n], data[15 .. 15 + n]);
        return reply;
    }
    return null;
}

/// Sends a subcommand and waits for its reply, retrying up to the write limit.
/// Returns the reply's data bytes, or null when the controller never answers.
pub fn write_subcommand(ctx: *Context, dev: *Device, id: u8, payload: []const u8, expect_spi: ?[5]u8) Error!?[reply_data_size]u8 {
    var attempt: usize = 0;
    while (attempt < max_write_attempts) : (attempt += 1) {
        var packet: [49]u8 = @splat(0);
        packet[0] = out_rumble_subcommand;
        packet[1] = next_command_number(ctx);
        @memcpy(packet[2..10], &ctx.rumble_data);
        packet[10] = id;
        @memcpy(packet[11 .. 11 + payload.len], payload);
        try send_packet(dev, &packet);
        if (try wait_subcommand_reply(ctx, dev, id, expect_spi)) |reply| return reply;
    }
    return null;
}

/// Reads `length` bytes of SPI flash at `address`. The reply's SPI data begins at
/// byte 5 of the returned array.
pub fn read_spi(ctx: *Context, dev: *Device, address: u32, length: u8) Error!?[reply_data_size]u8 {
    var request: [5]u8 = undefined;
    std.mem.writeInt(u32, request[0..4], address, .little);
    request[4] = length;
    return write_subcommand(ctx, dev, sub_spi_flash_read, &request, request);
}

/// Waits for the proprietary acknowledgement with `id`. Returns the first 11
/// bytes of the reply, which include the device type and the MAC address.
fn wait_proprietary_reply(ctx: *Context, dev: *Device, id: u8) Error!?[11]u8 {
    var buf: [64]u8 = undefined;
    var poll: usize = 0;
    while (poll < reply_poll_limit) : (poll += 1) {
        const data = (try read_input(ctx, dev, &buf, 1)) orelse continue;
        if (data[0] == report_command_ack and data.len > 1 and data[1] == id) {
            var reply: [11]u8 = @splat(0);
            const n = @min(data.len, 11);
            @memcpy(reply[0..n], data[0..n]);
            return reply;
        }
    }
    return null;
}

/// Sends a proprietary command. With `want_reply`, the reply is awaited and
/// returned (null on timeout). Without it, a zero array means the write was sent.
fn send_proprietary(ctx: *Context, dev: *Device, id: u8, payload: []const u8, want_reply: bool) Error!?[11]u8 {
    var attempt: usize = 0;
    while (attempt < max_write_attempts) : (attempt += 1) {
        var packet: [49]u8 = @splat(0);
        packet[0] = out_proprietary;
        packet[1] = id;
        @memcpy(packet[2 .. 2 + payload.len], payload);
        try send_packet(dev, &packet);
        if (!want_reply) return @as([11]u8, @splat(0));
        if (try wait_proprietary_reply(ctx, dev, id)) |reply| return reply;
    }
    return null;
}

/// Scales one raw IMU triple to SDL's units (the first half of SendSensorUpdate):
/// gyro in radians per second and accel in m/s^2, with the gyro offset removed.
/// The axes keep the device's order; each driver remaps them for its layout.
pub fn scale_imu(ctx: *const Context, sensor: common.Sensor, values: [3]i16) [3]f32 {
    var data: [3]f32 = undefined;
    switch (sensor) {
        .gyro => {
            const gx: f32 = @floatFromInt(@as(i32, values[0]) - ctx.imu.gyro_offset[0]);
            const gy: f32 = @floatFromInt(@as(i32, values[1]) - ctx.imu.gyro_offset[1]);
            const gz: f32 = @floatFromInt(@as(i32, values[2]) - ctx.imu.gyro_offset[2]);
            data[0] = -(ctx.imu.gyro[1] * gy);
            data[1] = ctx.imu.gyro[2] * gz;
            data[2] = -(ctx.imu.gyro[0] * gx);
        },
        .accel => {
            data[0] = -(ctx.imu.accel[1] * @as(f32, @floatFromInt(values[1])));
            data[1] = ctx.imu.accel[2] * @as(f32, @floatFromInt(values[2]));
            data[2] = -(ctx.imu.accel[0] * @as(f32, @floatFromInt(values[0])));
        },
    }
    return data;
}

/// Sample count and timestamps for one full report that carries IMU data: three
/// samples, spaced by the measured interval (SDL's m_ulIMUSamples and
/// m_ulTimestampNS bookkeeping). Call only when the report has sample data.
/// Returns the timestamps of samples 0, 1 and 2 in nanoseconds.
pub fn next_imu_timestamps(ctx: *Context) [3]u64 {
    ctx.has_sensor_data = true;
    ctx.imu_samples += 3;
    if (ctx.imu_samples >= imu_sample_frequency) {
        const elapsed = ctx.now_ns -| ctx.imu_sample_timestamp_ns;
        if (elapsed > 0) ctx.imu_update_interval_ns = elapsed / ctx.imu_samples;
        ctx.imu_samples = 0;
        ctx.imu_sample_timestamp_ns = ctx.now_ns;
    }
    ctx.timestamp_ns += ctx.imu_update_interval_ns;
    const ts0 = ctx.timestamp_ns;
    ctx.timestamp_ns += ctx.imu_update_interval_ns;
    const ts1 = ctx.timestamp_ns;
    ctx.timestamp_ns += ctx.imu_update_interval_ns;
    const ts2 = ctx.timestamp_ns;
    return .{ ts0, ts1, ts2 };
}

/// Decodes one IMU sample (6 little-endian i16 values: accel x,y,z then gyro x,y,z)
/// and emits gyro and accel for it (SendSensorUpdate). The device's axes are
/// remapped to the PlayStation order used by other controllers.
fn send_sensor_update(ctx: *const Context, out: *Output, sensor: common.Sensor, sensor_ns: u64, values: [3]i16) Error!void {
    try out.sensor(sensor, scale_imu(ctx, sensor, values), sensor_ns);
}

/// Decodes the three IMU samples carried in a full report (body offset 12) and
/// emits them with timestamps spaced by the measured sample interval.
fn handle_imu(ctx: *Context, dev: *Device, out: *Output, body: []const u8) Error!void {
    _ = dev;
    const first_sample = [_]i16{ read_i16(body, 12), read_i16(body, 14), read_i16(body, 16) };
    const has_data = first_sample[0] != 0 or first_sample[1] != 0 or first_sample[2] != 0;
    if (has_data) {
        const stamps = next_imu_timestamps(ctx);
        // Samples are emitted oldest first, as SDL does: sample 2, then 1, then 0.
        const samples = [3]usize{ 2, 1, 0 };
        for (samples, stamps) |sample, stamp| {
            const offset = 12 + sample * 12;
            const accel = [3]i16{ read_i16(body, offset), read_i16(body, offset + 2), read_i16(body, offset + 4) };
            const gyro = [3]i16{ read_i16(body, offset + 6), read_i16(body, offset + 8), read_i16(body, offset + 10) };
            try send_sensor_update(ctx, out, .gyro, stamp, gyro);
            try send_sensor_update(ctx, out, .accel, stamp, accel);
        }
    }
}

/// Full input report (HandleFullControllerState for the Pro Controller). `body`
/// is the report without its ID byte: counter, battery, buttons, sticks, then IMU.
fn handle_full(ctx: *Context, dev: *Device, out: *Output, report: []const u8) Error!void {
    var body: [48]u8 = @splat(0);
    @memcpy(body[0..@min(report.len, body.len)], report[0..@min(report.len, body.len)]);

    if (body[2] != ctx.last_buttons[0]) {
        const b = body[2];
        try out.button(common.button.south, b & 0x04 != 0);
        try out.button(common.button.east, b & 0x08 != 0);
        try out.button(common.button.west, b & 0x01 != 0);
        try out.button(common.button.north, b & 0x02 != 0);
        try out.button(common.button.right_shoulder, b & 0x40 != 0);
    }
    if (body[3] != ctx.last_buttons[1]) {
        const b = body[3];
        try out.button(common.button.back, b & 0x01 != 0);
        try out.button(common.button.start, b & 0x02 != 0);
        try out.button(common.button.right_stick, b & 0x04 != 0);
        try out.button(common.button.left_stick, b & 0x08 != 0);
        try out.button(common.button.guide, b & 0x10 != 0);
        try out.button(share_button, b & 0x20 != 0);
    }
    if (body[4] != ctx.last_buttons[2]) {
        const b = body[4];
        var hat_bits: u8 = 0;
        if (b & 0x01 != 0) hat_bits |= 0x4; // down
        if (b & 0x02 != 0) hat_bits |= 0x1; // up
        if (b & 0x04 != 0) hat_bits |= 0x2; // right
        if (b & 0x08 != 0) hat_bits |= 0x8; // left
        try out.hat(joystick.Hat.from_bits(hat_bits));
        try out.button(common.button.left_shoulder, b & 0x40 != 0);
    }
    ctx.last_buttons = .{ body[2], body[3], body[4] };

    try out.axis(common.axis.right_trigger, if (body[2] & 0x80 != 0) joystick.axis_max else joystick.axis_min);
    try out.axis(common.axis.left_trigger, if (body[4] & 0x80 != 0) joystick.axis_max else joystick.axis_min);

    const left_x = @as(i16, @intCast(@as(u16, body[5]) | (@as(u16, body[6] & 0x0f) << 8)));
    const left_y = @as(i16, @intCast((@as(u16, body[6]) >> 4) | (@as(u16, body[7]) << 4)));
    const right_x = @as(i16, @intCast(@as(u16, body[8]) | (@as(u16, body[9] & 0x0f) << 8)));
    const right_y = @as(i16, @intCast((@as(u16, body[9]) >> 4) | (@as(u16, body[10]) << 4)));
    try out.axis(common.axis.left_x, apply_stick_calibration(ctx, 0, 0, left_x));
    try out.axis(common.axis.left_y, ~apply_stick_calibration(ctx, 0, 1, left_y));
    try out.axis(common.axis.right_x, apply_stick_calibration(ctx, 1, 0, right_x));
    try out.axis(common.axis.right_y, ~apply_stick_calibration(ctx, 1, 1, right_y));

    const charging = body[1] & 0x10 != 0;
    const level = (body[1] & 0xe0) >> 4;
    const state: common.PowerState = if (!charging) .on_battery else if (level == 8) .charged else .charging;
    const percent: u8 = @intFromFloat(@round(@as(f32, @floatFromInt(level)) / 8.0 * 100.0));
    ctx.power_state = state;
    ctx.power_percent = percent;
    try out.battery(state, percent);

    if (ctx.report_sensors) {
        if (has_motion(body[12..24])) {
            try handle_imu(ctx, dev, out, &body);
        } else if (ctx.has_sensor_data) {
            if (ctx.now_ns >= ctx.last_imu_reset_ns + imu_reset_delay_ns) {
                _ = set_imu_enabled(ctx, dev, true) catch false;
                ctx.last_imu_reset_ns = ctx.now_ns;
            }
        }
    }
}

/// True when the first IMU sample has any non-zero accelerometer value.
pub fn has_motion(sample: []const u8) bool {
    return read_i16(sample, 0) != 0 or read_i16(sample, 2) != 0 or read_i16(sample, 4) != 0;
}

/// Logical button used for the Share button (SDL_GAMEPAD_BUTTON_SWITCH_SHARE).
const share_button: usize = 11;

/// Sensor enable (SetJoystickSensorsEnabled). Enabling switches to full reports
/// and turns on the IMU; the IMU needs the full report to carry samples.
pub fn set_sensors_enabled(ctx: *Context, dev: *Device, enabled: bool) Error!void {
    try update_enhanced_on_application_usage(ctx, dev);
    if (!ctx.sensors_supported or (enabled and !ctx.enhanced_mode)) return error.Unsupported;
    ctx.report_sensors = enabled;
    ctx.imu_samples = 0;
    ctx.imu_sample_timestamp_ns = ctx.now_ns;
    try update_input_mode(ctx, dev);
    _ = try set_imu_enabled(ctx, dev, enabled);
}

/// Reads and processes input for one pass (UpdateDevice). Writes that fail are
/// ignored here: a dead device stops answering reads, which becomes a disconnect.
pub fn update(ctx: *Context, dev: *Device, out: *Output, env: device.Env) Error!Report {
    var report: Report = .{};
    const now = out.timestamp;
    ctx.now_ns = now;
    if (ctx.last_input_ns == 0) ctx.last_input_ns = now;

    var buf: [64]u8 = undefined;
    var packet_count: usize = 0;
    var read_failed = false;
    while (true) {
        const maybe = dev.poll_report(&buf) catch {
            read_failed = true;
            break;
        };
        const data = maybe orelse break;
        packet_count += 1;
        ctx.last_input_ns = now;
        if (!dev.is_connected()) continue;
        if (data[0] == report_subcommand_reply) continue;
        ctx.current_input_mode = data[0];
        switch (data[0]) {
            report_full, report_full_mcu => {
                update_enhanced_on_enhanced_report(ctx, dev) catch {};
                try handle_full(ctx, dev, out, data[1..]);
            },
            else => {},
        }
    }

    if (dev.is_connected()) {
        if (packet_count == 0) {
            if (!dev.info.bluetooth) {
                if (now >= ctx.last_input_ns + usb_input_wait_ns) {
                    _ = send_proprietary(ctx, dev, prop_force_usb, &.{}, false) catch null;
                }
            } else if (ctx.current_input_mode != report_simple) {
                if (now >= ctx.last_input_ns + bluetooth_input_wait_ns) read_failed = true;
            }
        }
        if (ctx.rumble_pending or ctx.rumble_zero_pending) {
            send_pending_rumble(ctx, dev) catch {};
        } else if (ctx.rumble_active and now >= ctx.rumble_sent_ns + rumble_refresh_interval_ns) {
            write_rumble(ctx, dev) catch {};
        }
    }

    if (!dev.is_connected() and dev.info.bluetooth and packet_count > 0 and !env.has_connected_usb(dev.info.serial)) {
        report.connect = true;
    }
    if (read_failed) report.read_failed = true;
    return report;
}

/// HD rumble high-frequency amplitude thresholds and codes (101 entries), from SDL.
pub const high_amplitude = [_]struct { u16, u8 }{
    .{ 0, 0x00 },
    .{ 514, 0x02 },
    .{ 775, 0x04 },
    .{ 921, 0x06 },
    .{ 1096, 0x08 },
    .{ 1303, 0x0a },
    .{ 1550, 0x0c },
    .{ 1843, 0x0e },
    .{ 2192, 0x10 },
    .{ 2606, 0x12 },
    .{ 3100, 0x14 },
    .{ 3686, 0x16 },
    .{ 4383, 0x18 },
    .{ 5213, 0x1a },
    .{ 6199, 0x1c },
    .{ 7372, 0x1e },
    .{ 7698, 0x20 },
    .{ 8039, 0x22 },
    .{ 8395, 0x24 },
    .{ 8767, 0x26 },
    .{ 9155, 0x28 },
    .{ 9560, 0x2a },
    .{ 9984, 0x2c },
    .{ 10426, 0x2e },
    .{ 10887, 0x30 },
    .{ 11369, 0x32 },
    .{ 11873, 0x34 },
    .{ 12398, 0x36 },
    .{ 12947, 0x38 },
    .{ 13520, 0x3a },
    .{ 14119, 0x3c },
    .{ 14744, 0x3e },
    .{ 15067, 0x40 },
    .{ 15397, 0x42 },
    .{ 15734, 0x44 },
    .{ 16079, 0x46 },
    .{ 16431, 0x48 },
    .{ 16790, 0x4a },
    .{ 17158, 0x4c },
    .{ 17534, 0x4e },
    .{ 17918, 0x50 },
    .{ 18310, 0x52 },
    .{ 18711, 0x54 },
    .{ 19121, 0x56 },
    .{ 19540, 0x58 },
    .{ 19967, 0x5a },
    .{ 20405, 0x5c },
    .{ 20851, 0x5e },
    .{ 21308, 0x60 },
    .{ 21775, 0x62 },
    .{ 22251, 0x64 },
    .{ 22739, 0x66 },
    .{ 23236, 0x68 },
    .{ 23745, 0x6a },
    .{ 24265, 0x6c },
    .{ 24797, 0x6e },
    .{ 25340, 0x70 },
    .{ 25894, 0x72 },
    .{ 26462, 0x74 },
    .{ 27041, 0x76 },
    .{ 27633, 0x78 },
    .{ 28238, 0x7a },
    .{ 28856, 0x7c },
    .{ 29488, 0x7e },
    .{ 30134, 0x80 },
    .{ 30794, 0x82 },
    .{ 31468, 0x84 },
    .{ 32157, 0x86 },
    .{ 32861, 0x88 },
    .{ 33581, 0x8a },
    .{ 34316, 0x8c },
    .{ 35068, 0x8e },
    .{ 35836, 0x90 },
    .{ 36620, 0x92 },
    .{ 37422, 0x94 },
    .{ 38242, 0x96 },
    .{ 39079, 0x98 },
    .{ 39935, 0x9a },
    .{ 40809, 0x9c },
    .{ 41703, 0x9e },
    .{ 42616, 0xa0 },
    .{ 43549, 0xa2 },
    .{ 44503, 0xa4 },
    .{ 45477, 0xa6 },
    .{ 46473, 0xa8 },
    .{ 47491, 0xaa },
    .{ 48531, 0xac },
    .{ 49593, 0xae },
    .{ 50679, 0xb0 },
    .{ 51789, 0xb2 },
    .{ 52923, 0xb4 },
    .{ 54082, 0xb6 },
    .{ 55266, 0xb8 },
    .{ 56476, 0xba },
    .{ 57713, 0xbc },
    .{ 58977, 0xbe },
    .{ 60268, 0xc0 },
    .{ 61588, 0xc2 },
    .{ 62936, 0xc4 },
    .{ 64315, 0xc6 },
    .{ 65535, 0xc8 },
};

pub const low_amplitude = [_]struct { u16, u16 }{
    .{ 0, 0x0040 },
    .{ 514, 0x8040 },
    .{ 775, 0x0041 },
    .{ 921, 0x8041 },
    .{ 1096, 0x0042 },
    .{ 1303, 0x8042 },
    .{ 1550, 0x0043 },
    .{ 1843, 0x8043 },
    .{ 2192, 0x0044 },
    .{ 2606, 0x8044 },
    .{ 3100, 0x0045 },
    .{ 3686, 0x8045 },
    .{ 4383, 0x0046 },
    .{ 5213, 0x8046 },
    .{ 6199, 0x0047 },
    .{ 7372, 0x8047 },
    .{ 7698, 0x0048 },
    .{ 8039, 0x8048 },
    .{ 8395, 0x0049 },
    .{ 8767, 0x8049 },
    .{ 9155, 0x004a },
    .{ 9560, 0x804a },
    .{ 9984, 0x004b },
    .{ 10426, 0x804b },
    .{ 10887, 0x004c },
    .{ 11369, 0x804c },
    .{ 11873, 0x004d },
    .{ 12398, 0x804d },
    .{ 12947, 0x004e },
    .{ 13520, 0x804e },
    .{ 14119, 0x004f },
    .{ 14744, 0x804f },
    .{ 15067, 0x0050 },
    .{ 15397, 0x8050 },
    .{ 15734, 0x0051 },
    .{ 16079, 0x8051 },
    .{ 16431, 0x0052 },
    .{ 16790, 0x8052 },
    .{ 17158, 0x0053 },
    .{ 17534, 0x8053 },
    .{ 17918, 0x0054 },
    .{ 18310, 0x8054 },
    .{ 18711, 0x0055 },
    .{ 19121, 0x8055 },
    .{ 19540, 0x0056 },
    .{ 19967, 0x8056 },
    .{ 20405, 0x0057 },
    .{ 20851, 0x8057 },
    .{ 21308, 0x0058 },
    .{ 21775, 0x8058 },
    .{ 22251, 0x0059 },
    .{ 22739, 0x8059 },
    .{ 23236, 0x005a },
    .{ 23745, 0x805a },
    .{ 24265, 0x005b },
    .{ 24797, 0x805b },
    .{ 25340, 0x005c },
    .{ 25894, 0x805c },
    .{ 26462, 0x005d },
    .{ 27041, 0x805d },
    .{ 27633, 0x005e },
    .{ 28238, 0x805e },
    .{ 28856, 0x005f },
    .{ 29488, 0x805f },
    .{ 30134, 0x0060 },
    .{ 30794, 0x8060 },
    .{ 31468, 0x0061 },
    .{ 32157, 0x8061 },
    .{ 32861, 0x0062 },
    .{ 33581, 0x8062 },
    .{ 34316, 0x0063 },
    .{ 35068, 0x8063 },
    .{ 35836, 0x0064 },
    .{ 36620, 0x8064 },
    .{ 37422, 0x0065 },
    .{ 38242, 0x8065 },
    .{ 39079, 0x0066 },
    .{ 39935, 0x8066 },
    .{ 40809, 0x0067 },
    .{ 41703, 0x8067 },
    .{ 42616, 0x0068 },
    .{ 43549, 0x8068 },
    .{ 44503, 0x0069 },
    .{ 45477, 0x8069 },
    .{ 46473, 0x006a },
    .{ 47491, 0x806a },
    .{ 48531, 0x006b },
    .{ 49593, 0x806b },
    .{ 50679, 0x006c },
    .{ 51789, 0x806c },
    .{ 52923, 0x006d },
    .{ 54082, 0x806d },
    .{ 55266, 0x006e },
    .{ 56476, 0x806e },
    .{ 57713, 0x006f },
    .{ 58977, 0x806f },
    .{ 60268, 0x0070 },
    .{ 61588, 0x8070 },
    .{ 62936, 0x0071 },
    .{ 64315, 0x8071 },
    .{ 65535, 0x0072 },
};
