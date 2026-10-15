//! Valve Steam Controller over USB, wired and through the 2.4 GHz dongle (HIDAPI).
//!
//! Port of SDL_hidapi_steam.c for the wired controller (interface 2) and the
//! dongle (interfaces 1 to 4, one controller per interface). The protocol is the
//! Valve feature-report protocol in steam/controller_structs.h, with constants
//! from the generated `steam_constants.zig`.
//!
//! Protocol summary:
//!   - Feature reports are 65 bytes: report ID 0, message ID, payload length,
//!     then the payload. Requests are sent with `send_feature_report`; replies
//!     come back from `get_feature_report` with the message ID at byte 1.
//!   - Open: read the connection interval (attribute 11, default 9000 us), clear
//!     digital mappings, load defaults, then set trackpad modes and lizard mode.
//!   - Input report: version 1 header, type 1 (state) with a 44-byte payload that
//!     carries buttons, trigger bytes, two pads, triggers, accelerometer and gyro.
//!   - Dongle: type 3 wireless events (byte 4: 1 disconnect, 2 established,
//!     3 newly paired) say whether the paired controller is online.
//!
//! Behavior notes:
//! - Lizard mode is turned off on open (`setting_lizard_mode = lizard_mode_off`)
//!   and turned back on at close. SDL's Linux driver achieves the same through
//!   cleared digital mappings and the trackpad settings; the explicit lizard
//!   setting is added here as the port's requirement.
//! - Haptics: `trigger_haptic_pulse_report` builds the pulse feature report, which
//!   `send_effect` writes. SDL only accepts pre-built 65-byte reports there, and
//!   that rule is kept.
//!
//! Bluetooth (BLE) controllers:
//!   - Reports and feature requests are segmented: each 20-byte segment is report
//!     number 0x03, a header byte (0x80 data flag, 0x40 last-segment flag, low
//!     three bits the segment number) and 18 payload bytes. `Assembler` rebuilds
//!     inbound packets; outbound requests are split by `set_feature`.
//!   - A state packet is either version 1 with type 7 (the BLE state payload:
//!     packet number, buttons and triggers, pads, the gyro-data type and one
//!     shorts vector), or the chunked form whose low nibble of byte 0 is 4, with
//!     an option mask that says which fields follow (buttons, triggers, sticks,
//!     pads, accelerometer, gyro, quaternion).
//!   - BLE controllers connect as soon as HIDAPI sees them, like wired ones.
//!
//! Not ported:
//! - Pairing mode (SDL_JOYSTICK_HIDAPI_STEAM_PAIRING_ENABLED) and the home LED
//!   hint. These need hint-driven config the registry does not carry.
//! - Rumble and trigger rumble return Unsupported, as SDL does; use the Steam
//!   Input API for those.
//!
//! Deliberate differences from SDL:
//! - SDL sleeps 500 us between feature-report retries and 3 ms between
//!   mapping-clear polls. Retries are immediate here, bounded to 50 and 2 attempts.
//! - The reset runs in `open` and ignores its errors. SDL fails OpenJoystick
//!   when the reset fails; the port keeps the joystick connected instead so a
//!   failed setup cannot abort the registry scan.
const std = @import("std");
const hidraw = @import("../../hid/hidraw.zig");
const joystick = @import("../joystick.zig");
const common = @import("common.zig");
const device = @import("device.zig");
const sc = @import("steam_constants.zig");

const Error = device.Error;
const Device = device.Device;
const Output = common.Output;
const Report = device.Report;

const vendor_valve: u16 = 0x28de;
const product_dongle: u16 = 0x1142;
const wired_controller_interface: u8 = 2;
const dongle_first_interface: u8 = 1;
const dongle_last_interface: u8 = 4;

/// Feature and output reports are padded to this length (the 65-byte quirk).
const feature_size = 65;
const input_size = 128;
/// Message ids that are not in the generated table (controller_structs.h).
const id_controller_state: u8 = 1;
const id_controller_wireless: u8 = 3;
/// Wireless event types (D0G_* in SDL_hidapi_steam.c).
const wireless_disconnected: u8 = 1;

/// Packet payload offsets, after the 4-byte ValveInReportHeader_t (little-endian).
const state_payload_offset = 4;
const state_payload_length = 44;

/// Buttons in the packed 64-bit state mask (STEAM_*_MASK in SDL_hidapi_steam.c).
const mask_right_trigger: u64 = 0x00000001;
const mask_left_trigger: u64 = 0x00000002;
const mask_right_bumper: u64 = 0x00000004;
const mask_left_bumper: u64 = 0x00000008;
const mask_button_north: u64 = 0x00000010;
const mask_button_east: u64 = 0x00000020;
const mask_button_west: u64 = 0x00000040;
const mask_button_south: u64 = 0x00000080;
const mask_dpad_up: u64 = 0x00000100;
const mask_dpad_right: u64 = 0x00000200;
const mask_dpad_left: u64 = 0x00000400;
const mask_dpad_down: u64 = 0x00000800;
const mask_button_menu: u64 = 0x00001000;
const mask_button_steam: u64 = 0x00002000;
const mask_button_escape: u64 = 0x00004000;
const mask_button_back_left: u64 = 0x00008000;
const mask_button_back_right: u64 = 0x00010000;
const mask_leftpad_clicked: u64 = 0x00020000;
const mask_rightpad_clicked: u64 = 0x00040000;
const mask_leftpad_fingerdown: u64 = 0x00080000;
const mask_rightpad_fingerdown: u64 = 0x00100000;
const mask_joystick_button: u64 = 0x00400000;
const mask_leftpad_and_joystick: u64 = 0x00800000;
/// Bits 24..39 hold a copy of the trigger bytes, cleared from the button mask.
const mask_trigger_copy: u64 = 0xffff000000;

/// SDL_GAMEPAD_BUTTON_STEAM_RIGHT_PADDLE and _LEFT_PADDLE. The driver numbers
/// its buttons 0..12 (SDL_GAMEPAD_NUM_STEAM_BUTTONS is 13).
const button_steam_right_paddle: usize = 11;
const button_steam_left_paddle: usize = 12;

/// BLE segment layout (SDL_hidapi_steam.c MAX_REPORT_SEGMENT_*).
const ble_report_number: u8 = 0x03;
const segment_payload = 18;
const segment_size = segment_payload + 2;
const segment_data_flag: u8 = 0x80;
const segment_last_flag: u8 = 0x40;
const ble_max_read_retries = 8;
/// Packet types inside the BLE state formats.
const ble_report_state: u8 = 4;
const id_controller_ble_state: u8 = 7;
/// Payload of a type-7 state: packet number, 8 bytes of buttons and triggers,
/// two pads, the gyro-data type (byte 20) and four shorts (21 to 28).
const ble_state_payload_length = 29;

/// Trackpad maximum for trigger scaling (STEAMCONTROLLER_TRIGGER_MAX_ANALOG).
const trigger_max_analog: f32 = 26000;
/// Rotation applied to the pads, 15 degrees in radians.
const pad_rotation: f32 = 0.261799;
/// Pad offset used while a finger is down, so pads read as past their rim.
const pad_offset_fingerdown: i32 = 1000;
/// Gyro full scale: 2000 degrees per second, in radians per second.
const gyro_scale: f32 = 2000.0 * (std.math.pi / 180.0);
const standard_gravity: f32 = common.standard_gravity;

/// Decoded controller state (SteamControllerStateInternal_t without the
/// fields the port does not use). `prev_*` carry the last valid pad or stick
/// position across packets that interleave the two (SDL's sPrevLeftPad).
pub const State = struct {
    packet_num: u32 = 0,
    buttons: u64 = 0,
    left_pad_x: i16 = 0,
    left_pad_y: i16 = 0,
    right_pad_x: i16 = 0,
    right_pad_y: i16 = 0,
    left_stick_x: i16 = 0,
    left_stick_y: i16 = 0,
    trigger_l: u16 = 0,
    trigger_r: u16 = 0,
    accel: [3]i16 = @splat(0),
    gyro: [3]i16 = @splat(0),
    prev_left_pad: [2]i16 = @splat(0),
    prev_left_stick: [2]i16 = @splat(0),
};

/// Reassembles BLE segments into one packet (SteamControllerPacketAssembler).
/// Segments must arrive in order starting at 0; a gap or a bad segment drops the
/// partial packet. Owns a fixed buffer and needs no allocator.
pub const Assembler = struct {
    buffer: [segment_payload * 8 + 1]u8 = @splat(0),
    expected: u8 = 0,

    pub fn reset(self: *Assembler) void {
        self.buffer = @splat(0);
        self.expected = 0;
    }

    /// Adds one 20-byte segment. Returns the assembled length when the last
    /// segment arrives, else null. Keyboard and mouse events on the same node
    /// (report ID other than 0x03) and empty segments are ignored.
    pub fn write(self: *Assembler, segment: []const u8) ?usize {
        if (segment.len == 0 or segment[0] != ble_report_number) return null;
        if (segment.len != segment_size) {
            self.reset();
            return null;
        }
        const header = segment[1];
        if (header & segment_data_flag == 0) return null;
        const number: u8 = header & 0x07;
        if (number != self.expected) {
            self.reset();
            if (number != 0) return null;
        }
        const at = @as(usize, number) * segment_payload;
        @memcpy(self.buffer[at..][0..segment_payload], segment[2..segment_size]);
        if (header & segment_last_flag != 0) {
            self.expected = 0;
            return (@as(usize, number) + 1) * segment_payload;
        }
        self.expected += 1;
        return null;
    }
};

/// Driver state for one Steam Controller node (SDL_DriverSteam_Context).
pub const Context = struct {
    dongle: bool = false,
    /// Bluetooth node: packets arrive as segments and are reassembled here.
    ble: bool = false,
    assembler: Assembler = .{},
    /// Wired controllers are always connected. The dongle connects on a
    /// wireless event or on a state packet from a paired controller.
    connected: bool = false,
    update_rate_us: u32 = 9000,
    report_sensors: bool = false,
    state: State = .{},
    last_buttons: u64 = 0,
    /// Nanosecond clock for the sensor samples, advanced by the update rate.
    sensor_timestamp_ns: u64 = 0,
    left_touch_down: bool = false,
    left_touch_x: f32 = 0,
    left_touch_y: f32 = 0,
    right_touch_down: bool = false,
    right_touch_x: f32 = 0,
    right_touch_y: f32 = 0,
};

/// Valve controllers: every Bluetooth node, and the wired and dongle nodes on
/// the interfaces SDL uses (IsSupportedDevice).
pub fn supports(probe: device.Probe) bool {
    if (probe.vendor_id != vendor_valve) return false;
    const kind = joystick.guess_controller_type(probe.vendor_id, probe.product_id);
    if (kind != .steam_controller and kind != .steam_controller_v2) return false;
    if (probe.bluetooth) return true;
    const iface = probe.interface_number orelse return false;
    if (probe.product_id == product_dongle) {
        return iface >= dongle_first_interface and iface <= dongle_last_interface;
    }
    return iface == wired_controller_interface;
}

/// Sends a feature report. The controller requires every request to be 65 bytes
/// (the firmware quirk noted in SDL's ResetSteamController), so `data` is
/// zero-padded to that size. Device-busy failures are retried a bounded number
/// of times; SDL sleeps between retries, the port does not.
pub fn set_feature(dev: *Device, data: []const u8) Error!void {
    std.debug.assert(data.len <= feature_size);
    const hid = if (dev.hid) |*h| h else return error.NoDevice;
    if (dev.info.bluetooth) return send_segments(hid, data);
    var buf: [feature_size]u8 = @splat(0);
    @memcpy(buf[0..data.len], data);
    var attempt: usize = 0;
    while (true) : (attempt += 1) {
        _ = hid.send_feature_report(&buf) catch |err| {
            if (attempt + 1 < 50) continue;
            return err;
        };
        return;
    }
}

/// Splits a feature request into BLE segments (SetFeatureReport for Bluetooth).
/// The report number is skipped, and the last segment carries the last-flag.
fn send_segments(hid: *hidraw.Device, data: []const u8) Error!void {
    var pos: usize = 1;
    var number: u8 = 0;
    while (pos < data.len) : (number +%= 1) {
        const n = @min(data.len - pos, segment_payload);
        const last = pos + n == data.len;
        var packet: [segment_size]u8 = @splat(0);
        packet[0] = ble_report_number;
        packet[1] = segment_data_flag | (number & 0x07) | (if (last) segment_last_flag else 0);
        @memcpy(packet[2..][0..n], data[pos..][0..n]);
        _ = try hid.send_feature_report(&packet);
        pos += n;
    }
}

/// Reads a 65-byte feature report (GetFeatureReport) with report ID 0. Bluetooth
/// replies are read as 20-byte segments, reassembled, and returned with report
/// ID 0 in front, as the USB path does.
fn get_feature(dev: *Device, buf: *[feature_size]u8) Error!usize {
    const hid = if (dev.hid) |*h| h else return error.NoDevice;
    @memset(buf, 0);
    if (dev.info.bluetooth) return get_feature_segments(hid, buf);
    return hid.get_feature_report(buf);
}

/// GetFeatureReport for Bluetooth: reads segments until a complete packet
/// assembles, giving up after `ble_max_read_retries` idle reads.
fn get_feature_segments(hid: *hidraw.Device, buf: *[feature_size]u8) Error!usize {
    var assembler: Assembler = .{};
    var retries: usize = 0;
    while (retries < ble_max_read_retries) {
        var segment: [segment_size]u8 = @splat(0);
        segment[0] = ble_report_number;
        const n = hid.get_feature_report(&segment) catch 0;
        if (n > 2 and segment[1] & segment_data_flag != 0) retries = 0 else retries += 1;
        if (n == 0) continue;
        if (assembler.write(segment[0..n])) |length| {
            if (length < feature_size) {
                buf[0] = 0;
                @memcpy(buf[1..][0..length], assembler.buffer[0..length]);
                return length;
            }
        }
    }
    return error.DeviceUnavailable;
}

/// Asks the controller for `expected` and reads the reply (ReadResponse, up to
/// ten attempts). Returns the reply length, or null when no matching reply came.
fn read_response(dev: *Device, buf: *[feature_size]u8, expected: u8) Error!?usize {
    var attempt: usize = 0;
    while (attempt < 10) : (attempt += 1) {
        const n = get_feature(dev, buf) catch continue;
        if (buf[1] != expected) continue;
        return n;
    }
    return null;
}

/// Writes one setting into a SET_SETTINGS_VALUES payload at index `count`.
pub fn put_setting(buf: *[feature_size]u8, count: *usize, setting: u8, value: u16) void {
    const at = 3 + count.* * 3;
    buf[at] = setting;
    std.mem.writeInt(u16, buf[at + 1 ..][0..2], value, .little);
    count.* += 1;
}

/// Sends a SET_SETTINGS_VALUES report with the given (setting, value) pairs.
pub fn send_settings(dev: *Device, settings: []const [2]u16) Error!void {
    var buf: [feature_size]u8 = @splat(0);
    buf[1] = sc.id_set_settings_values;
    var count: usize = 0;
    for (settings) |entry| {
        put_setting(&buf, &count, @intCast(entry[0]), entry[1]);
    }
    buf[2] = @intCast(count * 3);
    try set_feature(dev, buf[0 .. 3 + count * 3]);
}

/// Resets the controller to the state the port drives it in (SDL's
/// ResetSteamController with mouse mode disabled). Returns the connection
/// interval in microseconds read from the attributes, or null on failure.
fn reset_controller(dev: *Device) Error!?u32 {
    var buf: [feature_size]u8 = @splat(0);
    var interval_us: u32 = 9000;

    buf[1] = sc.id_get_attributes_values;
    try set_feature(dev, buf[0..2]);
    const reply = (try read_response(dev, &buf, sc.id_get_attributes_values)) orelse return null;
    if (buf[2] > reply) return null;
    // Attributes are packed 5-byte entries (tag, u32 value) starting at byte 3.
    const attribute_bytes: usize = buf[2];
    var at: usize = 3;
    while (at + 5 <= 3 + attribute_bytes and at + 5 <= reply) : (at += 5) {
        if (buf[at] == sc.attrib_connection_interval_in_us) {
            interval_us = std.mem.readInt(u32, buf[at + 1 ..][0..4], .little);
        }
    }

    @memset(&buf, 0);
    buf[1] = sc.id_clear_digital_mappings;
    try set_feature(dev, buf[0..2]);

    @memset(&buf, 0);
    buf[1] = sc.id_load_default_settings;
    buf[2] = 0;
    try set_feature(dev, buf[0..3]);

    // Trackpads off, touchpad smoothing off, lizard mode off (see module comment).
    try send_settings(dev, &.{
        .{ sc.setting_wireless_packet_version, 2 },
        .{ sc.setting_left_trackpad_mode, sc.trackpad_none },
        .{ sc.setting_right_trackpad_mode, sc.trackpad_none },
        .{ sc.setting_smooth_absolute_mouse, 0 },
        .{ sc.setting_lizard_mode, sc.lizard_mode_off },
    });
    return interval_us;
}

/// Restores lizard mode and the default digital mappings (CloseSteamController).
/// Errors are ignored: the device may already be gone.
fn restore_lizard_mode(dev: *Device) void {
    var buf: [feature_size]u8 = @splat(0);
    buf[1] = sc.id_set_default_digital_mappings;
    set_feature(dev, buf[0..2]) catch {};

    @memset(&buf, 0);
    buf[1] = sc.id_load_default_settings;
    set_feature(dev, buf[0..3]) catch {};

    send_settings(dev, &.{
        .{ sc.setting_right_trackpad_mode, sc.trackpad_absolute_mouse },
        .{ sc.setting_lizard_mode, sc.lizard_mode_on },
    }) catch {};
}

/// Dongle wireless event check (D0G_IS_VALID_WIRELESS_EVENT): header version 1,
/// type 3, and a payload length of at least one event byte.
fn is_wireless_event(data: []const u8) bool {
    return data.len >= 5 and data[0] == 1 and data[1] == 0 and data[2] == id_controller_wireless and data[3] >= 1;
}

fn is_wireless_connect(data: []const u8) bool {
    return is_wireless_event(data) and data[4] != wireless_disconnected;
}

fn is_wireless_disconnect(data: []const u8) bool {
    return is_wireless_event(data) and data[4] == wireless_disconnected;
}

/// Asks the dongle for its wireless state and reads the answer. A connect event
/// means a controller is paired and online. Five short reads are tried.
fn query_dongle(dev: *Device) Error!?bool {
    var request: [feature_size]u8 = @splat(0);
    request[1] = sc.id_dongle_get_wireless_state;
    try set_feature(dev, request[0..2]);

    var data: [input_size]u8 = undefined;
    var attempt: usize = 0;
    while (attempt < 5) : (attempt += 1) {
        const bytes = (try dev.read_report_timeout(&data, 1)) orelse continue;
        if (is_wireless_connect(bytes)) return true;
        if (is_wireless_disconnect(bytes)) return false;
    }
    return null;
}

/// Commits a paired controller to the dongle slot (ControllerConnected).
fn commit_pairing(dev: *Device) void {
    var buf: [feature_size]u8 = @splat(0);
    buf[1] = sc.id_dongle_commit_device;
    set_feature(dev, buf[0..2]) catch {};
}

/// Init (HIDAPI_DriverSteam_InitDevice). The wired controller connects now. The
/// dongle asks for its wireless state; a connected controller connects now, and
/// otherwise the node waits for a wireless event in update.
pub fn init(ctx: *Context, dev: *Device, env: device.Env) Error!bool {
    _ = env;
    try dev.set_name("Steam Controller");
    ctx.* = .{ .dongle = dev.info.product_id == product_dongle, .ble = dev.info.bluetooth };
    dev.gamepad_type = .steam;
    if (!ctx.dongle) {
        ctx.connected = true;
        return true;
    }
    const online = (try query_dongle(dev)) orelse false;
    ctx.connected = online;
    if (online) {
        commit_pairing(dev);
    }
    return online;
}

/// Steam Controller layout: 13 buttons, the stick and pad axes, one hat, and
/// two touchpads (one finger each).
pub fn layout(ctx: *const Context, dev: *const Device) joystick.Layout {
    _ = ctx;
    _ = dev;
    return .{ .axes = common.axis.count, .buttons = button_steam_left_paddle + 1, .hats = 1, .balls = 0 };
}

/// OpenJoystick: resets the controller, starts the sensors and touchpads.
/// The reset result is not checked; see the module comment.
pub fn open(ctx: *Context, dev: *Device) Error!void {
    ctx.report_sensors = false;
    ctx.state = .{};
    ctx.last_buttons = 0;
    ctx.left_touch_down = false;
    ctx.right_touch_down = false;
    if (reset_controller(dev) catch null) |interval| ctx.update_rate_us = interval;
    const rate_hz: f32 = if (ctx.update_rate_us > 0) 1_000_000.0 / @as(f32, @floatFromInt(ctx.update_rate_us)) else 0;
    dev.state.set_sensor_rate(.gyro, rate_hz);
    dev.state.set_sensor_rate(.accel, rate_hz);
    dev.state.add_touchpad(2);
}

/// Closes the controller: restores lizard mode and default mappings.
pub fn close(ctx: *Context, dev: *Device) void {
    _ = ctx;
    restore_lizard_mode(dev);
}

/// Output is a 65-byte haptic feature report, written as-is. SDL does not
/// accept other sizes here, and neither does the port.
pub fn send_effect(ctx: *Context, dev: *Device, data: []const u8) Error!void {
    _ = ctx;
    if (data.len != feature_size) return error.Unsupported;
    try set_feature(dev, data);
}

/// Builds a trigger-haptic pulse report (ID_TRIGGER_HAPTIC_PULSE, payload
/// MsgFireHapticPulse, 10 bytes). `which_pad` is 0 for the left pad and 1 for
/// the right; durations and intervals are in the controller's units. The result
/// goes to `send_effect`.
pub fn trigger_haptic_pulse_report(
    buf: *[feature_size]u8,
    which_pad: u8,
    pulse_duration: u16,
    pulse_interval: u16,
    pulse_count: u16,
    gain_db: i16,
    priority: u8,
) void {
    @memset(buf, 0);
    buf[1] = sc.id_trigger_haptic_pulse;
    buf[2] = 10;
    buf[3] = which_pad;
    std.mem.writeInt(u16, buf[4..6], pulse_duration, .little);
    std.mem.writeInt(u16, buf[6..8], pulse_interval, .little);
    std.mem.writeInt(u16, buf[8..10], pulse_count, .little);
    std.mem.writeInt(i16, buf[10..12], gain_db, .little);
    buf[12] = priority;
}

/// Enables or disables the gyro and accelerometer reports (ID_SET_SETTINGS_VALUES
/// with SETTING_IMU_MODE).
pub fn set_sensors_enabled(ctx: *Context, dev: *Device, enabled: bool) Error!void {
    const mode: u16 = if (enabled) sc.setting_gyro_mode_send_raw_accel | sc.setting_gyro_mode_send_raw_gyro else sc.setting_gyro_mode_off;
    try send_settings(dev, &.{.{ sc.setting_imu_mode, mode }});
    ctx.report_sensors = enabled;
}

/// Remaps a float between two ranges, clamped (RemapValClamped).
fn remap_clamped(value: f32, a: f32, b: f32, c: f32, d: f32) f32 {
    if (a == b) return if (value - b >= 0) d else c;
    const t = std.math.clamp((value - a) / (b - a), 0.0, 1.0);
    return c + (d - c) * t;
}

/// Rotates an integer pad point by `angle` radians, truncating toward zero as the C cast does.
fn rotate_pad(x: i32, y: i32, angle: f32) struct { x: i32, y: i32 } {
    const fx: f32 = @floatFromInt(x);
    const fy: f32 = @floatFromInt(y);
    const c = @cos(angle);
    const s = @sin(angle);
    return .{
        .x = @intFromFloat(c * fx - s * fy),
        .y = @intFromFloat(s * fx + c * fy),
    };
}

fn clamp_i16(value: i32) i16 {
    return @intCast(std.math.clamp(value, std.math.minInt(i16), std.math.maxInt(i16)));
}

/// Decodes the state payload into `prev`-aware state (FormatStatePacketUntilGyro).
/// Pad coordinates are interpreted as the firmware describes: when the left
/// finger bit is clear, the "left pad" values are the joystick.
fn format_state(prev: State, payload: []const u8) State {
    var s: State = .{
        .prev_left_pad = prev.prev_left_pad,
        .prev_left_stick = prev.prev_left_stick,
    };
    s.packet_num = std.mem.readInt(u32, payload[0..4], .little);
    const raw: u64 = std.mem.readInt(u64, payload[4..12], .little);
    const left_x = std.mem.readInt(i16, payload[12..14], .little);
    const left_y = std.mem.readInt(i16, payload[14..16], .little);
    s.buttons = raw & ~mask_trigger_copy;

    if (raw & mask_leftpad_fingerdown != 0) {
        // Left pad is a trackpad: its finger is on the pad.
        s.left_pad_x = left_x;
        s.left_pad_y = left_y;
        s.prev_left_pad = .{ left_x, left_y };
        if (raw & mask_leftpad_and_joystick != 0) {
            s.left_stick_x = s.prev_left_stick[0];
            s.left_stick_y = s.prev_left_stick[1];
        } else {
            s.prev_left_stick = .{ 0, 0 };
        }
    } else {
        // Left pad is the joystick.
        s.left_stick_x = left_x;
        s.left_stick_y = left_y;
        s.prev_left_stick = .{ left_x, left_y };
        if (raw & mask_leftpad_and_joystick != 0) {
            s.left_pad_x = s.prev_left_pad[0];
            s.left_pad_y = s.prev_left_pad[1];
        } else {
            s.prev_left_pad = .{ 0, 0 };
            // Older controllers report the joystick click as a pad click when the pad is idle.
            if (s.buttons & mask_leftpad_clicked != 0) {
                s.buttons &= ~mask_leftpad_clicked;
                s.buttons |= mask_joystick_button;
            }
        }
    }
    if (raw & mask_leftpad_and_joystick != 0) s.buttons |= mask_leftpad_fingerdown;

    s.right_pad_x = std.mem.readInt(i16, payload[16..18], .little);
    s.right_pad_y = std.mem.readInt(i16, payload[18..20], .little);

    const left = rotate_pad(s.left_pad_x, s.left_pad_y, -pad_rotation);
    const right = rotate_pad(s.right_pad_x, s.right_pad_y, pad_rotation);
    const left_off: i32 = if (s.buttons & mask_leftpad_fingerdown != 0) pad_offset_fingerdown else 0;
    s.left_pad_x = clamp_i16(left.x + left_off);
    s.left_pad_y = clamp_i16(left.y + left_off);
    const right_off: i32 = if (s.buttons & mask_rightpad_fingerdown != 0) pad_offset_fingerdown else 0;
    s.right_pad_x = clamp_i16(right.x + right_off);
    s.right_pad_y = clamp_i16(right.y + right_off);

    // Trigger bytes are copied to both nibbles of a 16-bit value before scaling.
    // The trigger bytes sit at payload offsets 7 (left) and 8 (right).
    const trig_l: u32 = @as(u32, payload[7]) << 7 | payload[7];
    const trig_r: u32 = @as(u32, payload[8]) << 7 | payload[8];
    s.trigger_l = @intFromFloat(remap_clamped(@floatFromInt(trig_l), 0, trigger_max_analog, 0, 32767));
    s.trigger_r = @intFromFloat(remap_clamped(@floatFromInt(trig_r), 0, trigger_max_analog, 0, 32767));
    return s;
}

/// Trigger byte to the 16-bit trigger range (the `(b << 7) | b` expansion and remap).
fn trigger_from_byte(byte: u8) u16 {
    const expanded: u32 = (@as(u32, byte) << 7) | byte;
    return @intFromFloat(remap_clamped(@floatFromInt(expanded), 0, trigger_max_analog, 0, 32767));
}

/// Applies one state packet (UpdateSteamControllerState). Returns false when the
/// bytes are not a state packet. A repeated packet number returns true with no
/// change, as SDL does. Version 1 carries type 1 (wired and dongle) or type 7
/// (Bluetooth); other versions may carry the chunked Bluetooth state.
fn update_state(ctx: *Context, data: []const u8) bool {
    if (data.len < 4) return false;
    if (std.mem.readInt(u16, data[0..2], .little) != 1) {
        if (ctx.ble and data[0] & 0x0f == ble_report_state) return update_ble_chunks(ctx, data);
        return false;
    }
    switch (data[2]) {
        id_controller_state => return update_wired_state(ctx, data),
        id_controller_ble_state => return update_ble_state(ctx, data),
        else => return false,
    }
}

/// Type 1 state: the full payload, with the accelerometer and gyro after the pads.
fn update_wired_state(ctx: *Context, data: []const u8) bool {
    if (data.len < 4 + state_payload_length) return false;
    const payload = data[state_payload_offset..][0..state_payload_length];
    const packet_num = std.mem.readInt(u32, payload[0..4], .little);
    if (ctx.state.packet_num == packet_num) return true;

    var next = format_state(ctx.state, payload);
    // Payload offsets: accelerometer X, Y, Z at 24, 26, 28; gyro at 30, 32, 34.
    next.accel = .{
        std.mem.readInt(i16, payload[24..26], .little),
        std.mem.readInt(i16, payload[26..28], .little),
        std.mem.readInt(i16, payload[28..30], .little),
    };
    next.gyro = .{
        std.mem.readInt(i16, payload[30..32], .little),
        std.mem.readInt(i16, payload[32..34], .little),
        std.mem.readInt(i16, payload[34..36], .little),
    };
    ctx.state = next;
    return true;
}

/// Type 7 state (ID_CONTROLLER_BLE_STATE). The buttons, triggers and pads decode
/// as the wired state does, since the first 20 payload bytes share its layout.
/// The gyro-data type says what the four shorts are: 1 quaternion (not stored),
/// 2 accelerometer, 3 gyro.
fn update_ble_state(ctx: *Context, data: []const u8) bool {
    if (data.len < 4 + ble_state_payload_length) return false;
    const payload = data[4..][0..ble_state_payload_length];
    const packet_num = std.mem.readInt(u32, payload[0..4], .little);
    if (ctx.state.packet_num == packet_num) return true;

    var next = format_state(ctx.state, payload);
    const shorts = [3]i16{
        std.mem.readInt(i16, payload[21..23], .little),
        std.mem.readInt(i16, payload[23..25], .little),
        std.mem.readInt(i16, payload[25..27], .little),
    };
    switch (payload[20]) {
        2 => next.accel = shorts,
        3 => next.gyro = shorts,
        else => {},
    }
    ctx.state = next;
    return true;
}

/// Chunked Bluetooth state (UpdateBLESteamControllerState). Byte 0's upper nibble
/// and byte 1 form a mask; each set bit adds a field, in order. Fields that are
/// absent keep their previous values. The packet number advances on every packet.
fn update_ble_chunks(ctx: *Context, data: []const u8) bool {
    var next = ctx.state;
    next.packet_num +%= 1;
    const mask: u32 = (@as(u32, data[0]) & 0xf0) | (@as(u32, data[1]) << 8);
    var at: usize = 2;
    const sizes = [_]struct { bit: u32, size: usize }{
        .{ .bit = 0x10, .size = 3 },
        .{ .bit = 0x20, .size = 2 },
        .{ .bit = 0x40, .size = 3 },
        .{ .bit = 0x80, .size = 4 },
        .{ .bit = 0x100, .size = 4 },
        .{ .bit = 0x200, .size = 4 },
        .{ .bit = 0x400, .size = 6 },
        .{ .bit = 0x800, .size = 6 },
        .{ .bit = 0x1000, .size = 8 },
    };
    // Every chunk must fit in the packet; a short packet is dropped.
    var needed: usize = 2;
    for (sizes) |chunk| {
        if (mask & chunk.bit != 0) needed += chunk.size;
    }
    if (data.len < needed) return false;

    if (mask & 0x10 != 0) {
        const low = @as(u64, data[at]) | (@as(u64, data[at + 1]) << 8) | (@as(u64, data[at + 2]) << 16);
        next.buttons = (next.buttons & ~@as(u64, 0xffffff)) | low;
        at += 3;
    }
    if (mask & 0x20 != 0) {
        next.trigger_l = trigger_from_byte(data[at]);
        next.trigger_r = trigger_from_byte(data[at + 1]);
        at += 2;
    }
    if (mask & 0x40 != 0) {
        const high = (@as(u64, data[at]) << 40) | (@as(u64, data[at + 1]) << 48) | (@as(u64, data[at + 2]) << 56);
        next.buttons = (next.buttons & ~(@as(u64, 0xffffff) << 40)) | high;
        at += 3;
    }
    if (mask & 0x80 != 0) {
        next.left_stick_x = std.mem.readInt(i16, data[at..][0..2], .little);
        next.left_stick_y = std.mem.readInt(i16, data[at + 2 ..][0..2], .little);
        at += 4;
    }
    if (mask & 0x100 != 0) {
        const raw_x = std.mem.readInt(i16, data[at..][0..2], .little);
        const raw_y = std.mem.readInt(i16, data[at + 2 ..][0..2], .little);
        const rotated = rotate_pad(raw_x, raw_y, -pad_rotation);
        const offset: i32 = if (next.buttons & mask_leftpad_fingerdown != 0) pad_offset_fingerdown else 0;
        next.left_pad_x = clamp_i16(rotated.x + offset);
        next.left_pad_y = clamp_i16(rotated.y + offset);
        at += 4;
    }
    if (mask & 0x200 != 0) {
        const raw_x = std.mem.readInt(i16, data[at..][0..2], .little);
        const raw_y = std.mem.readInt(i16, data[at + 2 ..][0..2], .little);
        const rotated = rotate_pad(raw_x, raw_y, pad_rotation);
        const offset: i32 = if (next.buttons & mask_rightpad_fingerdown != 0) pad_offset_fingerdown else 0;
        next.right_pad_x = clamp_i16(rotated.x + offset);
        next.right_pad_y = clamp_i16(rotated.y + offset);
        at += 4;
    }
    if (mask & 0x400 != 0) {
        next.accel = .{
            std.mem.readInt(i16, data[at..][0..2], .little),
            std.mem.readInt(i16, data[at + 2 ..][0..2], .little),
            std.mem.readInt(i16, data[at + 4 ..][0..2], .little),
        };
        at += 6;
    }
    if (mask & 0x800 != 0) {
        next.gyro = .{
            std.mem.readInt(i16, data[at..][0..2], .little),
            std.mem.readInt(i16, data[at + 2 ..][0..2], .little),
            std.mem.readInt(i16, data[at + 4 ..][0..2], .little),
        };
        at += 6;
    }
    // The quaternion (0x1000) is 8 bytes and is not stored.
    ctx.state = next;
    return true;
}

/// Feather-touch filter from SDL's FilterTouch: suppresses jitter below the
/// sensor's least significant step.
fn filter_touch(new_value: f32, old_value: f32) f32 {
    const jitter: f32 = 256.0 / 65536.0;
    if (new_value > old_value - jitter * 0.5 and new_value < old_value + jitter * 0.5) return old_value;
    if (new_value > old_value - jitter and new_value < old_value + jitter) {
        return old_value * 0.75 + new_value * 0.25;
    }
    if (new_value > old_value - jitter * 2.0 and new_value < old_value + jitter * 2.0) {
        return (old_value + new_value) * 0.5;
    }
    return new_value;
}

/// Sends the button, hat, axis, touchpad and sensor changes for one state
/// (the body of HIDAPI_DriverSteam_UpdateDevice after parsing).
fn emit_state(ctx: *Context, out: *Output) Error!void {
    const s = ctx.state;
    if (s.buttons != ctx.last_buttons) {
        try out.button(common.button.south, s.buttons & mask_button_south != 0);
        try out.button(common.button.east, s.buttons & mask_button_east != 0);
        try out.button(common.button.west, s.buttons & mask_button_west != 0);
        try out.button(common.button.north, s.buttons & mask_button_north != 0);
        try out.button(common.button.left_shoulder, s.buttons & mask_left_bumper != 0);
        try out.button(common.button.right_shoulder, s.buttons & mask_right_bumper != 0);
        try out.button(common.button.back, s.buttons & mask_button_menu != 0);
        try out.button(common.button.start, s.buttons & mask_button_escape != 0);
        try out.button(common.button.guide, s.buttons & mask_button_steam != 0);
        try out.button(common.button.left_stick, s.buttons & mask_joystick_button != 0);
        try out.button(button_steam_left_paddle, s.buttons & mask_button_back_left != 0);
        try out.button(button_steam_right_paddle, s.buttons & mask_button_back_right != 0);
        try out.button(common.button.right_stick, s.buttons & mask_rightpad_clicked != 0);

        var hat: joystick.Hat = .{};
        hat.up = s.buttons & mask_dpad_up != 0;
        hat.down = s.buttons & mask_dpad_down != 0;
        hat.left = s.buttons & mask_dpad_left != 0;
        hat.right = s.buttons & mask_dpad_right != 0;
        try out.hat(hat);
    }
    ctx.last_buttons = s.buttons;

    try out.axis(common.axis.left_trigger, @intCast(@as(i32, s.trigger_l) * 2 - 32768));
    try out.axis(common.axis.right_trigger, @intCast(@as(i32, s.trigger_r) * 2 - 32768));
    try out.axis(common.axis.left_x, s.left_stick_x);
    try out.axis(common.axis.left_y, ~s.left_stick_y);
    try out.axis(common.axis.right_x, s.right_pad_x);
    try out.axis(common.axis.right_y, ~s.right_pad_y);

    // The left pad is normally the D-pad, and the right pad the right stick;
    // the touchpad events are sent alongside for apps that use them.
    const left_down = s.buttons & mask_leftpad_fingerdown != 0;
    if (left_down or ctx.left_touch_down) {
        const clicked = s.buttons & mask_leftpad_clicked != 0;
        const x = @as(f32, @floatFromInt(s.left_pad_x)) / 65536.0 + 0.5;
        const y = -@as(f32, @floatFromInt(s.left_pad_y)) / 65536.0 + 0.5;
        var pressure: f32 = if (left_down) 0.5 else 0.0;
        if (clicked) pressure += 0.5;
        if (left_down) {
            ctx.left_touch_x = filter_touch(x, ctx.left_touch_x);
            ctx.left_touch_y = filter_touch(y, ctx.left_touch_y);
        }
        try out.touchpad_finger(0, 0, left_down, ctx.left_touch_x, ctx.left_touch_y, pressure);
        ctx.left_touch_down = left_down;
    }
    const right_down = s.buttons & mask_rightpad_fingerdown != 0;
    if (right_down or ctx.right_touch_down) {
        const clicked = s.buttons & mask_rightpad_clicked != 0;
        const x = @as(f32, @floatFromInt(s.right_pad_x)) / 65536.0 + 0.5;
        const y = -@as(f32, @floatFromInt(s.right_pad_y)) / 65536.0 + 0.5;
        var pressure: f32 = if (right_down) 0.5 else 0.0;
        if (clicked) pressure += 0.5;
        if (right_down) {
            ctx.right_touch_x = filter_touch(x, ctx.right_touch_x);
            ctx.right_touch_y = filter_touch(y, ctx.right_touch_y);
        }
        try out.touchpad_finger(1, 0, right_down, ctx.right_touch_x, ctx.right_touch_y, pressure);
        ctx.right_touch_down = right_down;
    }

    if (ctx.report_sensors) {
        const step_ns: u64 = @as(u64, ctx.update_rate_us) * std.time.ns_per_us;
        ctx.sensor_timestamp_ns += step_ns;
        const g = s.gyro;
        const a = s.accel;
        const gyro_values = [3]f32{
            @as(f32, @floatFromInt(g[0])) / 32768.0 * gyro_scale,
            @as(f32, @floatFromInt(g[2])) / 32768.0 * gyro_scale,
            @as(f32, @floatFromInt(g[1])) / 32768.0 * gyro_scale,
        };
        try out.sensor(.gyro, gyro_values, ctx.sensor_timestamp_ns);
        const accel_values = [3]f32{
            @as(f32, @floatFromInt(a[0])) / 32768.0 * 2.0 * standard_gravity,
            @as(f32, @floatFromInt(a[2])) / 32768.0 * 2.0 * standard_gravity,
            -@as(f32, @floatFromInt(a[1])) / 32768.0 * 2.0 * standard_gravity,
        };
        try out.sensor(.accel, accel_values, ctx.sensor_timestamp_ns);
    }
}

/// Reads every queued report (HIDAPI_DriverSteam_UpdateDevice). A state packet
/// connects a dongle that missed its wireless event; wireless events connect or
/// disconnect it. A read failure disconnects the controller.
pub fn update(ctx: *Context, dev: *Device, out: *Output, env: device.Env) Error!Report {
    _ = env;
    var report: Report = .{};
    var buf: [input_size]u8 = undefined;
    while (true) {
        const data = dev.poll_report(&buf) catch {
            report.read_failed = true;
            break;
        } orelse break;

        if (ctx.ble) {
            // Bluetooth segments: only a completed packet is a state update.
            if (ctx.assembler.write(data)) |length| {
                if (update_state(ctx, ctx.assembler.buffer[0..length]) and dev.is_connected()) {
                    try emit_state(ctx, out);
                }
            }
            continue;
        }

        if (update_state(ctx, data)) {
            if (!ctx.connected) {
                ctx.connected = true;
                commit_pairing(dev);
                report.connect = true;
                continue;
            }
            if (!dev.is_connected()) continue;
            try emit_state(ctx, out);
        } else if (!ctx.connected and is_wireless_connect(data)) {
            ctx.connected = true;
            commit_pairing(dev);
            report.connect = true;
        } else if (ctx.connected and is_wireless_disconnect(data)) {
            ctx.connected = false;
            report.disconnect = true;
        }
    }
    return report;
}
