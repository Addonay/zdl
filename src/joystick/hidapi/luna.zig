//! Amazon Luna controller over USB and Bluetooth (HIDAPI).
//!
//! Port of SDL_hidapi_luna.c. The two transports send different reports, so the
//! packet length and ID pick the decoder:
//!
//! USB state, 10 bytes:
//!   byte 1: 0x01 south, 0x02 east, 0x04 west, 0x08 north, 0x10 left bumper,
//!           0x20 right bumper, 0x40 back, 0x80 start.
//!   byte 2: 0x01 guide, 0x02 microphone, 0x04 left stick, 0x08 right stick.
//!   byte 3: D-pad code in the low nibble (0 up, clockwise; 8 or more centred).
//!   bytes 4..7: left X, left Y, right X, right Y; 0x7f is centre.
//!   bytes 8, 9: left and right trigger, 8 bits each.
//!
//! Bluetooth: report 0x02 (byte 1, bit 0 is the guide button), report 0x04
//! (byte 1 is the battery level out of 255), and report 0x01 with 17 or more
//! bytes for the state. The state has the D-pad in byte 13 (1 up, clockwise, 8
//! up-left), face buttons and bumpers in bytes 14 and 15, Back and microphone in
//! byte 16, sticks at bytes 2, 4, 6 and 8, and 10-bit triggers at bytes 9 and 11.
//!
//! Rumble: SDL sends the Bluetooth rumble packet whenever the product ID matches
//! (the USB and Bluetooth product IDs are both 0x0419), so USB reports rumble
//! too. The packet is {0x03, 0x0f, 0, 0, lo, hi, 0xff, 0, 0xeb} with magnitudes
//! of 1..100 (SDL's 655 scale).
//!
//! Deliberate differences from SDL:
//! - SDL's macOS-only guard is not compiled for Linux, and its Bluetooth rumble
//!   switch is always on. This port keeps both.
//! - Luna exposes 12 buttons: 11 gamepad buttons plus the microphone.
const std = @import("std");
const joystick = @import("../joystick.zig");
const common = @import("common.zig");
const device = @import("device.zig");

const Error = device.Error;
const Device = device.Device;
const Output = common.Output;
const Report = device.Report;

pub const vendor_amazon_usb: u16 = 0x1949;
pub const vendor_amazon_bluetooth: u16 = 0x0171;
pub const product_luna_controller: u16 = 0x0419;

const usb_packet_length = 64;
const usb_state_length = 10;
const bluetooth_state_id: u8 = 0x01;
const bluetooth_state_length = 17;
const bluetooth_guide_id: u8 = 0x02;
const bluetooth_battery_id: u8 = 0x04;
const bluetooth_rumble_id: u8 = 0x03;

/// Index of the microphone button (SDL_GAMEPAD_BUTTON_LUNA_MICROPHONE).
pub const button_microphone: usize = 11;
pub const button_count: usize = 12;

/// Driver state: the last raw report, compared bytewise as SDL does.
pub const Context = struct {
    last_state: [usb_packet_length]u8 = @splat(0),
};

/// Matches the Luna product on both the USB and the Bluetooth vendor IDs.
pub fn supports(probe: device.Probe) bool {
    if (probe.product_id != product_luna_controller) return false;
    return probe.vendor_id == vendor_amazon_usb or probe.vendor_id == vendor_amazon_bluetooth;
}

/// The controller needs no handshake, so the joystick connects now.
pub fn init(ctx: *Context, dev: *Device, env: device.Env) Error!bool {
    _ = env;
    ctx.* = .{};
    try dev.set_name("Amazon Luna Controller");
    return true;
}

/// Six axes, 12 buttons and one hat.
pub fn layout(ctx: *const Context, dev: *const Device) joystick.Layout {
    _ = ctx;
    _ = dev;
    return .{ .axes = common.axis.count, .buttons = button_count, .hats = 1 };
}

/// OpenJoystick: forgets the last raw report.
pub fn open(ctx: *Context, dev: *Device) Error!void {
    _ = dev;
    ctx.last_state = @splat(0);
}

/// Rumble is advertised for the product ID (see the module comment).
pub fn capabilities(ctx: *const Context) device.Capabilities {
    _ = ctx;
    return .{ .rumble = true };
}

/// Sends the Bluetooth rumble packet. Magnitudes are 1..100 on the wire, so the
/// 16-bit motor values are divided by 655.
pub fn rumble(ctx: *Context, dev: *Device, low: u16, high: u16) Error!void {
    _ = ctx;
    const packet = [_]u8{
        bluetooth_rumble_id,
        0x0f,
        0x00,
        0x00,
        @truncate(low / 655),
        @truncate(high / 655),
        0xff,
        0x00,
        0xeb,
    };
    _ = try dev.send_report(&packet, .report_id);
}

/// Stick byte to the signed range; the centre byte 0x7f is exactly zero.
pub fn stick_axis(raw: u8) i16 {
    if (raw == 0x7f) return 0;
    return common.scale_u8(raw);
}

/// Ten-bit trigger from two bytes (SDL's READ_TRIGGER_AXIS for Bluetooth), mapped
/// from -512..511 to the signed range.
pub fn bluetooth_trigger(lo: u8, hi: u8) i16 {
    const raw: i32 = (@as(i32, lo) | (@as(i32, hi) << 8)) & 0x3ff;
    const x: f32 = @floatFromInt(raw - 0x200);
    const value = (x + 512.0) * 65535.0 / 1023.0 - 32768.0;
    return @intFromFloat(std.math.clamp(value, -32768.0, 32767.0));
}

/// D-pad from a code 1 to 8 (up, clockwise), with 0 and 9 or more centred.
fn bluetooth_hat(code: u8) joystick.Hat {
    if (code == 0 or code > 8) return joystick.Hat.centered;
    return common.hat_from_dpad(code - 1);
}

/// Decodes a USB state report (HandleUSBStatePacket).
pub fn decode_usb(ctx: *Context, out: *Output, data: []const u8) Error!void {
    const last = &ctx.last_state;
    if (last[1] != data[1]) {
        try out.button(common.button.south, data[1] & 0x01 != 0);
        try out.button(common.button.east, data[1] & 0x02 != 0);
        try out.button(common.button.west, data[1] & 0x04 != 0);
        try out.button(common.button.north, data[1] & 0x08 != 0);
        try out.button(common.button.left_shoulder, data[1] & 0x10 != 0);
        try out.button(common.button.right_shoulder, data[1] & 0x20 != 0);
        try out.button(common.button.back, data[1] & 0x40 != 0);
        try out.button(common.button.start, data[1] & 0x80 != 0);
    }
    if (last[2] != data[2]) {
        try out.button(common.button.guide, data[2] & 0x01 != 0);
        try out.button(button_microphone, data[2] & 0x02 != 0);
        try out.button(common.button.left_stick, data[2] & 0x04 != 0);
        try out.button(common.button.right_stick, data[2] & 0x08 != 0);
    }
    if (last[3] != data[3]) try out.hat(common.hat_from_dpad(data[3] & 0x0f));
    try out.axis(common.axis.left_x, stick_axis(data[4]));
    try out.axis(common.axis.left_y, stick_axis(data[5]));
    try out.axis(common.axis.right_x, stick_axis(data[6]));
    try out.axis(common.axis.right_y, stick_axis(data[7]));
    try out.axis(common.axis.left_trigger, common.scale_u8(data[8]));
    try out.axis(common.axis.right_trigger, common.scale_u8(data[9]));
    copy_state(last, data);
}

/// Decodes a Bluetooth report (HandleBluetoothStatePacket). Guide and battery
/// reports are handled without touching the last state.
pub fn decode_bluetooth(ctx: *Context, out: *Output, data: []const u8) Error!void {
    if (data.len >= 2 and data[0] == bluetooth_guide_id) {
        try out.button(common.button.guide, data[1] & 0x01 != 0);
        return;
    }
    if (data.len >= 2 and data[0] == bluetooth_battery_id) {
        const percent: u8 = @intFromFloat(@round(@as(f32, @floatFromInt(data[1])) / 255.0 * 100.0));
        try out.battery(.on_battery, percent);
        return;
    }
    if (data.len < bluetooth_state_length or data[0] != bluetooth_state_id) return;
    const last = &ctx.last_state;
    if (last[13] != data[13]) try out.hat(bluetooth_hat(data[13] & 0x0f));
    if (last[14] != data[14]) {
        try out.button(common.button.south, data[14] & 0x01 != 0);
        try out.button(common.button.east, data[14] & 0x02 != 0);
        try out.button(common.button.west, data[14] & 0x08 != 0);
        try out.button(common.button.north, data[14] & 0x10 != 0);
        try out.button(common.button.left_shoulder, data[14] & 0x40 != 0);
        try out.button(common.button.right_shoulder, data[14] & 0x80 != 0);
    }
    if (last[15] != data[15]) {
        try out.button(common.button.start, data[15] & 0x08 != 0);
        try out.button(common.button.left_stick, data[15] & 0x20 != 0);
        try out.button(common.button.right_stick, data[15] & 0x40 != 0);
    }
    if (last[16] != data[16]) {
        try out.button(common.button.back, data[16] & 0x01 != 0);
        try out.button(button_microphone, data[16] & 0x02 != 0);
    }
    try out.axis(common.axis.left_x, stick_axis(data[2]));
    try out.axis(common.axis.left_y, stick_axis(data[4]));
    try out.axis(common.axis.right_x, stick_axis(data[6]));
    try out.axis(common.axis.right_y, stick_axis(data[8]));
    try out.axis(common.axis.left_trigger, bluetooth_trigger(data[9], data[10]));
    try out.axis(common.axis.right_trigger, bluetooth_trigger(data[11], data[12]));
    copy_state(&ctx.last_state, data);
}

fn copy_state(last: *[usb_packet_length]u8, data: []const u8) void {
    const n = @min(data.len, usb_packet_length);
    @memcpy(last[0..n], data[0..n]);
}

/// Drains every queued report. A read failure is a disconnect.
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
        if (data.len == usb_state_length) {
            try decode_usb(ctx, out, data);
        } else {
            try decode_bluetooth(ctx, out, data);
        }
    }
    return report;
}

test "Luna USB state maps the D-pad, sticks and triggers" {
    var sink = try common.TestSink.init(std.testing.allocator, .{ .axes = 6, .buttons = button_count, .hats = 1 });
    defer sink.deinit();
    var ctx: Context = .{};
    var out = sink.output(1);
    // A and the microphone; D-pad left (code 6); centred left stick; full right trigger.
    const packet = [_]u8{ 0x03, 0x01, 0x02, 0x06, 0x7f, 0x7f, 0xff, 0x00, 0x00, 0xff };
    try decode_usb(&ctx, &out, &packet);
    try std.testing.expect(sink.js.button_down(common.button.south));
    try std.testing.expect(sink.js.button_down(button_microphone));
    try std.testing.expectEqual(@as(u8, 0x8), sink.js.hat_value(0).bits()); // left
    try std.testing.expectEqual(@as(i16, 0), sink.js.axis_value(common.axis.left_x));
    try std.testing.expectEqual(@as(i16, 32767), sink.js.axis_value(common.axis.right_x));
    try std.testing.expectEqual(@as(i16, -32768), sink.js.axis_value(common.axis.right_y));
    try std.testing.expectEqual(@as(i16, 32767), sink.js.axis_value(common.axis.right_trigger));
}

test "Luna Bluetooth trigger uses ten bits" {
    try std.testing.expectEqual(@as(i16, -32768), bluetooth_trigger(0x00, 0x00));
    try std.testing.expectEqual(@as(i16, 32767), bluetooth_trigger(0xff, 0x03));
    // Bits above the ten-bit field are ignored.
    try std.testing.expectEqual(bluetooth_trigger(0xff, 0x03), bluetooth_trigger(0xff, 0xff));
}

test "Luna Bluetooth D-pad codes 1 to 8 are up, clockwise" {
    try std.testing.expectEqual(@as(u8, 0x1), bluetooth_hat(1).bits());
    try std.testing.expectEqual(@as(u8, 0x3), bluetooth_hat(2).bits());
    try std.testing.expectEqual(@as(u8, 0x9), bluetooth_hat(8).bits());
    try std.testing.expectEqual(@as(u8, 0), bluetooth_hat(0).bits());
    try std.testing.expectEqual(@as(u8, 0), bluetooth_hat(9).bits());
}

test "Luna Bluetooth battery and guide reports" {
    var sink = try common.TestSink.init(std.testing.allocator, .{ .axes = 6, .buttons = button_count, .hats = 1 });
    defer sink.deinit();
    var ctx: Context = .{};
    var out = sink.output(1);
    try decode_bluetooth(&ctx, &out, &[_]u8{ 0x02, 0x01 });
    try std.testing.expect(sink.js.button_down(common.button.guide));
    try decode_bluetooth(&ctx, &out, &[_]u8{ 0x04, 255 });
    try std.testing.expectEqual(@as(u8, 100), sink.state.battery_percent);
    try std.testing.expectEqual(common.PowerState.on_battery, sink.state.battery);
}
