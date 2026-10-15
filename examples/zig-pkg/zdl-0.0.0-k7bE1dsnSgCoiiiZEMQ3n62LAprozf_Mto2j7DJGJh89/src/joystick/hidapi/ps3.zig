//! Sony DualShock 3 (PlayStation 3 controller) over USB and Bluetooth, and the
//! ShanWan clones that use the same report layout (HIDAPI).
//!
//! Port of the DualShock 3 path of SDL_hidapi_ps3.c: the feature-report setup,
//! the 49-byte state report 0x01 (buttons, hat, sticks, analog buttons as axes,
//! and the accelerometer), the 7-byte report of ShanWan PS2-to-PS3 converters,
//! and the output effect report (rumble and LED).
//!
//! Setup: over Bluetooth, feature {0xf4 0x42 0x03 0x00 0x00} switches the
//! controller to report mode. Over USB, feature reports 0xf2 and 0xf5 are read
//! (both must answer) and, for non-ShanWan clones, a single 0xf5 byte is written.
//! An output report with the rumble and LED effect is sent once the first state
//! report arrives, so the LED stops blinking.
//!
//! Layout: 11 buttons, 16 axes (six sticks and triggers, then the ten analog
//! buttons: south, east, west, north, L1, R1, D-pad up/down/left/right), one hat,
//! and one accelerometer at 100 Hz.
//!
//! Deliberate differences from SDL:
//! - The ShanWan detection uses the vendor ID only. SDL also checks the device
//!   name for Sony-vendor clones, and that check is not ported.
//! - Player LEDs use the effect's LED mask, computed as SDL computes it, including
//!   its value for an unassigned player (-1).
//! - Rumble and effects are queued on the device and written by the registry
//!   update, instead of through SDL's rumble thread.
const std = @import("std");
const joystick = @import("../joystick.zig");
const common = @import("common.zig");
const device = @import("device.zig");

const Error = device.Error;
const Device = device.Device;
const Output = common.Output;
const Report = device.Report;

const usb_packet_length = 64;
const vendor_sony: u16 = 0x054c;
const product_ds3: u16 = 0x0268;
const vendor_shanwan: u16 = 0x2563;
const vendor_shanwan_alt: u16 = 0x20bc;
const product_shanwan_ds3: u16 = 0x0523;

const report_state: u8 = 0x01;
const report_effects: u8 = 0x01;
const report_feature_setup: u8 = 0xf4;
const report_feature_usb_a: u8 = 0xf2;
const report_feature_usb_b: u8 = 0xf5;

/// Effect block sent as the body of report 0x01 (the first byte is the command).
/// Byte 2 is the right motor on/off, byte 4 the left motor strength, and byte 9
/// the player LED mask. The rest are the LED flash patterns, kept as SDL sends them.
const effects_template = [_]u8{
    0x01, 0xff, 0x00, 0xff, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00,
    0xff, 0x27, 0x10, 0x00, 0x32,
    0xff, 0x27, 0x10, 0x00, 0x32,
    0xff, 0x27, 0x10, 0x00, 0x32,
    0xff, 0x27, 0x10, 0x00, 0x32,
    0x00, 0x00, 0x00, 0x00, 0x00,
};

/// Analog button bytes in the state report, with the axis each one drives
/// (offset 0 means the button is not an analog axis). Axes 6 and up, in order.
const analog_button_offsets = [_]u8{ 24, 23, 25, 22, 0, 0, 0, 0, 0, 20, 21, 14, 16, 17, 15 };

/// Number of analog-button axes, derived from the table above.
const analog_axis_count = blk: {
    var n: usize = 0;
    for (analog_button_offsets) |offset| {
        if (offset != 0) n += 1;
    }
    break :blk n;
};

/// Driver state for one DualShock 3 (SDL_DriverPS3_Context).
pub const Context = struct {
    is_shanwan: bool = false,
    report_sensors: bool = false,
    effects_updated: bool = false,
    player_index: i32 = -1,
    rumble_left: u8 = 0,
    rumble_right: u8 = 0,
    /// Raw copy of the last state report, compared bytewise as SDL does.
    last_state: [usb_packet_length]u8 = @splat(0),
};

/// DualShock 3 and its ShanWan clone (SDL IsSupportedDevice).
pub fn supports(probe: device.Probe) bool {
    if (probe.vendor_id == vendor_sony and probe.product_id == product_ds3) return true;
    if (probe.vendor_id == vendor_shanwan and probe.product_id == product_shanwan_ds3) return true;
    return false;
}

/// Init: sets report mode and reads the USB feature reports. A USB node that
/// does not answer 0xf2 or 0xf5 is not claimed (error.ProtocolError).
pub fn init(ctx: *Context, dev: *Device, env: device.Env) Error!bool {
    _ = env;
    const vendor = dev.info.vendor_id;
    ctx.* = .{ .is_shanwan = vendor == vendor_shanwan or vendor == vendor_shanwan_alt };
    try dev.set_name("PS3 Controller");
    dev.gamepad_type = .ps3;

    if (dev.info.bluetooth) {
        // Report mode over Bluetooth is a feature report. Its result is not checked, as in SDL.
        if (dev.hid) |*handle| {
            _ = handle.send_feature_report(&.{ report_feature_setup, 0x42, 0x03, 0x00, 0x00 }) catch {};
        }
        return true;
    }

    var buf: [usb_packet_length]u8 = undefined;
    if (dev.read_feature(report_feature_usb_a, buf[0..17]) == 0) return error.ProtocolError;
    if (dev.read_feature(report_feature_usb_b, buf[0..8]) == 0) return error.ProtocolError;
    // A write of the 0xf5 byte wakes the controller. ShanWan clones rumble
    // without stopping if they get this write, so they skip it.
    if (!ctx.is_shanwan) _ = dev.write_report_now(&.{report_feature_usb_b}) catch {};
    return true;
}

/// Five axes plus the ten analog buttons, 11 buttons and one hat.
pub fn layout(ctx: *const Context, dev: *const Device) joystick.Layout {
    _ = ctx;
    _ = dev;
    return .{ .axes = common.axis.count + analog_axis_count, .buttons = 11, .hats = 1, .balls = 0 };
}

/// OpenJoystick: resets the rumble state and declares the accelerometer at 100 Hz.
pub fn open(ctx: *Context, dev: *Device) Error!void {
    ctx.effects_updated = false;
    ctx.rumble_left = 0;
    ctx.rumble_right = 0;
    ctx.last_state = @splat(0);
    dev.state.set_sensor_rate(.accel, 100);
}

/// Features: rumble only (no LED or trigger rumble).
pub fn capabilities(ctx: *const Context) device.Capabilities {
    _ = ctx;
    return .{ .rumble = true };
}

/// Stores the player index and refreshes the LED mask. Ignored while disconnected.
pub fn set_player_index(ctx: *Context, dev: *Device, index: i32) void {
    ctx.player_index = index;
    if (!dev.is_connected()) return;
    update_effects(ctx, dev) catch {};
}

/// Rumble: the high bytes of each motor value, as SDL stores them. The motors
/// are on the next effect report.
pub fn rumble(ctx: *Context, dev: *Device, low: u16, high: u16) Error!void {
    ctx.rumble_left = @truncate(low >> 8);
    ctx.rumble_right = @truncate(high >> 8);
    try update_effects(ctx, dev);
}

/// Builds and queues effect report 0x01 (UpdateEffects). The player LED mask is
/// 1 << (1 + player % 4), computed with C remainder semantics as SDL does.
fn update_effects(ctx: *Context, dev: *Device) Error!void {
    var effects = effects_template;
    effects[2] = if (ctx.rumble_right != 0) 1 else 0;
    effects[4] = ctx.rumble_left;
    const slot: i32 = @rem(ctx.player_index, 4);
    const shift: u3 = @intCast(1 + slot);
    effects[9] = @as(u8, 1) << shift;
    try send_effect_block(dev, &effects);
}

/// Queues `block` (after the 0x01 command byte) as one 49-byte effect report.
fn send_effect_block(dev: *Device, block: []const u8) Error!void {
    var packet: [49]u8 = @splat(0);
    packet[0] = report_effects;
    const n = @min(block.len, packet.len - 1);
    @memcpy(packet[1 .. 1 + n], block[0..n]);
    _ = try dev.send_report(&packet, .report_id);
}

/// Raw effect report, as SDL's SendJoystickEffect: the bytes after the report ID.
pub fn send_effect(ctx: *Context, dev: *Device, data: []const u8) Error!void {
    _ = ctx;
    try send_effect_block(dev, data);
}

/// Enables or disables reporting of the accelerometer.
pub fn set_sensors_enabled(ctx: *Context, dev: *Device, enabled: bool) Error!void {
    _ = dev;
    ctx.report_sensors = enabled;
}

/// Accelerometer value from a 16-bit field that is stored big-endian in the
/// report. The conversion is ((value - 511) / 113) times standard gravity.
fn scale_accel(raw_le: i16) f32 {
    const value: i16 = @byteSwap(raw_le);
    return (@as(f32, @floatFromInt(value - 511)) / 113.0) * common.standard_gravity;
}

/// The DualShock 3 state report (HandleStatePacket). Only changed bytes produce
/// button and hat events, as SDL does; axes and analog buttons are always sent.
fn handle_state(ctx: *Context, out: *Output, data: []const u8) Error!void {
    if (ctx.last_state[2] != data[2]) {
        const b = data[2];
        try out.button(common.button.back, b & 0x01 != 0);
        try out.button(common.button.left_stick, b & 0x02 != 0);
        try out.button(common.button.right_stick, b & 0x04 != 0);
        try out.button(common.button.start, b & 0x08 != 0);
        try out.hat(.{ .up = b & 0x10 != 0, .right = b & 0x20 != 0, .down = b & 0x40 != 0, .left = b & 0x80 != 0 });
    }
    if (ctx.last_state[3] != data[3]) {
        const b = data[3];
        try out.button(common.button.left_shoulder, b & 0x04 != 0);
        try out.button(common.button.right_shoulder, b & 0x08 != 0);
        try out.button(common.button.north, b & 0x10 != 0);
        try out.button(common.button.east, b & 0x20 != 0);
        try out.button(common.button.south, b & 0x40 != 0);
        try out.button(common.button.west, b & 0x80 != 0);
    }
    if (ctx.last_state[4] != data[4]) {
        try out.button(common.button.guide, data[4] & 0x01 != 0);
    }

    try out.axis(common.axis.left_trigger, common.scale_u8(data[18]));
    try out.axis(common.axis.right_trigger, common.scale_u8(data[19]));
    try out.axis(common.axis.left_x, common.scale_u8(data[6]));
    try out.axis(common.axis.left_y, common.scale_u8(data[7]));
    try out.axis(common.axis.right_x, common.scale_u8(data[8]));
    try out.axis(common.axis.right_y, common.scale_u8(data[9]));

    var axis_index: usize = common.axis.count;
    for (analog_button_offsets) |offset| {
        if (offset == 0) continue;
        try out.axis(axis_index, common.scale_u8(data[offset]));
        axis_index += 1;
    }

    if (ctx.report_sensors) {
        const values = [3]f32{
            scale_accel(std.mem.readInt(i16, data[41..43], .little)),
            -scale_accel(std.mem.readInt(i16, data[45..47], .little)),
            -scale_accel(std.mem.readInt(i16, data[43..45], .little)),
        };
        try out.sensor(.accel, values, out.timestamp);
    }
}

/// The 7-byte report of ShanWan PS2-to-PS3 converters (HandleMiniStatePacket):
/// the sticks are the first four bytes, the buttons follow.
fn handle_mini_state(ctx: *Context, out: *Output, data: []const u8) Error!void {
    if (ctx.last_state[4] != data[4]) {
        const hat_code = data[4] & 0x0f;
        try out.hat(hat_from_code(hat_code));
        try out.button(common.button.north, data[4] & 0x10 != 0);
        try out.button(common.button.east, data[4] & 0x20 != 0);
        try out.button(common.button.south, data[4] & 0x40 != 0);
        try out.button(common.button.west, data[4] & 0x80 != 0);
    }
    if (ctx.last_state[5] != data[5]) {
        const b = data[5];
        try out.button(common.button.left_shoulder, b & 0x01 != 0);
        try out.button(common.button.right_shoulder, b & 0x02 != 0);
        try out.axis(common.axis.left_trigger, if (b & 0x04 != 0) joystick.axis_max else joystick.axis_min);
        try out.axis(common.axis.right_trigger, if (b & 0x08 != 0) joystick.axis_max else joystick.axis_min);
        try out.button(common.button.back, b & 0x10 != 0);
        try out.button(common.button.start, b & 0x20 != 0);
        try out.button(common.button.left_stick, b & 0x40 != 0);
        try out.button(common.button.right_stick, b & 0x80 != 0);
    }
    try out.axis(common.axis.left_x, common.scale_u8(data[2]));
    try out.axis(common.axis.left_y, common.scale_u8(data[3]));
    try out.axis(common.axis.right_x, common.scale_u8(data[0]));
    try out.axis(common.axis.right_y, common.scale_u8(data[1]));
}

/// Hat from the PlayStation 4-bit D-pad code (0 up, clockwise, 8 centered).
fn hat_from_code(code: u8) joystick.Hat {
    return switch (code) {
        0 => .{ .up = true },
        1 => .{ .up = true, .right = true },
        2 => .{ .right = true },
        3 => .{ .right = true, .down = true },
        4 => .{ .down = true },
        5 => .{ .down = true, .left = true },
        6 => .{ .left = true },
        7 => .{ .left = true, .up = true },
        else => joystick.Hat.centered,
    };
}

/// Sends the LED and rumble effect once, after the first state report, so the
/// controller stops blinking its startup pattern (UpdateEffects after first report).
fn ensure_effects(ctx: *Context, dev: *Device) Error!void {
    if (ctx.effects_updated) return;
    ctx.effects_updated = true;
    try update_effects(ctx, dev);
}

/// Reads every queued report. Input is skipped while the joystick is not
/// connected. A read failure is a disconnect.
pub fn update(ctx: *Context, dev: *Device, out: *Output, env: device.Env) Error!Report {
    _ = env;
    var report: Report = .{};
    if (!dev.is_connected()) return report;
    var buf: [usb_packet_length]u8 = undefined;
    while (true) {
        const data = dev.poll_report(&buf) catch {
            report.read_failed = true;
            break;
        } orelse break;
        if (data.len == 7) {
            try handle_mini_state(ctx, out, data);
            try ensure_effects(ctx, dev);
            @memcpy(ctx.last_state[0..7], data);
            continue;
        }
        if (data[0] == report_state and data.len >= 47 and data[1] != 0xff) {
            try handle_state(ctx, out, data);
            try ensure_effects(ctx, dev);
            const n = @min(data.len, usb_packet_length);
            @memcpy(ctx.last_state[0..n], data[0..n]);
        }
    }
    return report;
}
