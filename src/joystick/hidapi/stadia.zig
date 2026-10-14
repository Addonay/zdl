//! Google Stadia controller over USB (HIDAPI).
//!
//! Port of SDL_hidapi_stadia.c. The controller sends a 10- or 11-byte state
//! report with ID 0x03 whenever an input changes:
//!   byte 1: D-pad code, 0 up, clockwise in 45 degree steps, 8 or more centred
//!           (`common.hat_from_dpad`).
//!   byte 2: 0x01 Capture, 0x02 Google Assistant, 0x10 Guide, 0x20 Start,
//!           0x40 Back, 0x80 right stick click.
//!   byte 3: 0x40 south, 0x20 east, 0x10 west, 0x08 north, 0x04 left bumper,
//!           0x02 right bumper, 0x01 left stick click.
//!   bytes 4..7: left X, left Y, right X, right Y; 0x80 is centre.
//!   bytes 8, 9: left and right trigger, 8 bits each.
//! Rumble is a 5-byte report {0x05, low lo, low hi, high lo, high hi}. Support is
//! probed once at init with a zero-strength write, as SDL does.
//!
//! Deliberate differences from SDL:
//! - SDL's joystick model is filled through `SDL_SendJoystick*`, which ignores
//!   unchanged values. Here the byte comparisons come first, as in SDL, and the
//!   joystick model dedupes the rest.
//! - Stadia exposes 13 buttons: 11 gamepad buttons plus Capture and Assistant.
const std = @import("std");
const joystick = @import("../joystick.zig");
const common = @import("common.zig");
const device = @import("device.zig");

const Error = device.Error;
const Device = device.Device;
const Output = common.Output;
const Report = device.Report;

pub const vendor_google: u16 = 0x18d1;
pub const product_stadia_controller: u16 = 0x9400;

const usb_packet_length = 64;
const state_report_id: u8 = 0x03;
const min_state_length = 10;
const rumble_report_id: u8 = 0x05;

/// Index of the Capture button (SDL_GAMEPAD_BUTTON_STADIA_CAPTURE).
pub const button_capture: usize = 11;
/// Index of the Google Assistant button (SDL_GAMEPAD_BUTTON_STADIA_GOOGLE_ASSISTANT).
pub const button_assistant: usize = 12;
pub const button_count: usize = 13;

/// Driver state: whether the firmware accepted rumble, and the last raw report.
pub const Context = struct {
    rumble_supported: bool = false,
    last_state: [usb_packet_length]u8 = @splat(0),
};

/// Matches the Google vendor and the Stadia controller only.
pub fn supports(probe: device.Probe) bool {
    return probe.vendor_id == vendor_google and probe.product_id == product_stadia_controller;
}

/// Probes rumble with a zero-strength packet and connects the joystick now.
pub fn init(ctx: *Context, dev: *Device, env: device.Env) Error!bool {
    _ = env;
    ctx.* = .{};
    const probe = [_]u8{ rumble_report_id, 0, 0, 0, 0 };
    ctx.rumble_supported = (dev.write_report_now(&probe) catch null) != null;
    try dev.set_name("Google Stadia Controller");
    return true;
}

/// Six axes, 13 buttons and one hat (SDL's OpenJoystick values).
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

/// Rumble is available once the probe write was accepted.
pub fn capabilities(ctx: *const Context) device.Capabilities {
    return .{ .rumble = ctx.rumble_supported };
}

/// Sends the two motor strengths as 16-bit little-endian values.
pub fn rumble(ctx: *Context, dev: *Device, low: u16, high: u16) Error!void {
    if (!ctx.rumble_supported) return error.Unsupported;
    const packet = [_]u8{
        rumble_report_id,
        @truncate(low),
        @truncate(low >> 8),
        @truncate(high),
        @truncate(high >> 8),
    };
    _ = try dev.send_report(&packet, .report_id);
}

/// One stick axis from its byte: 0x80 is centre, and 0x01 to 0xff map to the
/// signed range (HIDAPI_RemapVal from -127..127). Out-of-range bytes are clamped.
pub fn stick_axis(raw: u8) i16 {
    if (raw == 0x80) return 0;
    const x: f32 = @floatFromInt(@as(i32, raw) - 0x80);
    const value = (x + 127.0) * 65535.0 / 254.0 - 32768.0;
    return @intFromFloat(std.math.clamp(value, -32768.0, 32767.0));
}

/// Decodes one state report. Groups of bytes are compared with the last report
/// and only the changed groups are sent, as in SDL.
pub fn decode_report(ctx: *Context, out: *Output, data: []const u8) Error!void {
    if (data.len < min_state_length or data[0] != state_report_id) return;
    const last = &ctx.last_state;
    if (last[1] != data[1]) try out.hat(common.hat_from_dpad(data[1]));
    if (last[2] != data[2]) {
        try out.button(common.button.back, data[2] & 0x40 != 0);
        try out.button(common.button.guide, data[2] & 0x10 != 0);
        try out.button(common.button.start, data[2] & 0x20 != 0);
        try out.button(common.button.right_stick, data[2] & 0x80 != 0);
        try out.button(button_capture, data[2] & 0x01 != 0);
        try out.button(button_assistant, data[2] & 0x02 != 0);
    }
    if (last[3] != data[3]) {
        try out.button(common.button.south, data[3] & 0x40 != 0);
        try out.button(common.button.east, data[3] & 0x20 != 0);
        try out.button(common.button.west, data[3] & 0x10 != 0);
        try out.button(common.button.north, data[3] & 0x08 != 0);
        try out.button(common.button.left_shoulder, data[3] & 0x04 != 0);
        try out.button(common.button.right_shoulder, data[3] & 0x02 != 0);
        try out.button(common.button.left_stick, data[3] & 0x01 != 0);
    }
    try out.axis(common.axis.left_x, stick_axis(data[4]));
    try out.axis(common.axis.left_y, stick_axis(data[5]));
    try out.axis(common.axis.right_x, stick_axis(data[6]));
    try out.axis(common.axis.right_y, stick_axis(data[7]));
    try out.axis(common.axis.left_trigger, common.scale_u8(data[8]));
    try out.axis(common.axis.right_trigger, common.scale_u8(data[9]));
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
        try decode_report(ctx, out, data);
    }
    return report;
}

test "Stadia stick bytes map to the signed range" {
    try std.testing.expectEqual(@as(i16, 0), stick_axis(0x80));
    try std.testing.expectEqual(@as(i16, -32768), stick_axis(0x01));
    try std.testing.expectEqual(@as(i16, 32767), stick_axis(0xff));
    // Byte 0x00 is below the range and clamps to the minimum.
    try std.testing.expectEqual(@as(i16, -32768), stick_axis(0x00));
}

test "Stadia state report sets hat, buttons, sticks and triggers" {
    var sink = try common.TestSink.init(std.testing.allocator, .{ .axes = 6, .buttons = button_count, .hats = 1 });
    defer sink.deinit();
    var ctx: Context = .{};
    var out = sink.output(1);
    const first = [_]u8{ 0x03, 0x02, 0x41, 0x42, 0x80, 0x80, 0xff, 0x01, 0xff, 0x00 };
    try decode_report(&ctx, &out, &first);
    try std.testing.expectEqual(@as(u8, 0x2), sink.js.hat_value(0).bits()); // right
    try std.testing.expect(sink.js.button_down(common.button.back));
    try std.testing.expect(sink.js.button_down(button_capture));
    try std.testing.expect(sink.js.button_down(common.button.south));
    try std.testing.expect(sink.js.button_down(common.button.right_shoulder));
    try std.testing.expect(!sink.js.button_down(button_assistant));
    try std.testing.expectEqual(@as(i16, 0), sink.js.axis_value(common.axis.left_x));
    try std.testing.expectEqual(@as(i16, 32767), sink.js.axis_value(common.axis.right_x));
    try std.testing.expectEqual(@as(i16, -32768), sink.js.axis_value(common.axis.right_y));
    try std.testing.expectEqual(@as(i16, 32767), sink.js.axis_value(common.axis.left_trigger));
    try std.testing.expectEqual(@as(i16, -32768), sink.js.axis_value(common.axis.right_trigger));

    // Releasing Back and Capture changes byte 2 only.
    const second = [_]u8{ 0x03, 0x02, 0x00, 0x42, 0x80, 0x80, 0xff, 0x01, 0xff, 0x00 };
    try decode_report(&ctx, &out, &second);
    try std.testing.expect(!sink.js.button_down(common.button.back));
    try std.testing.expect(!sink.js.button_down(button_capture));
    try std.testing.expect(sink.js.button_down(common.button.south));
}

test "Stadia ignores reports with another ID or a short length" {
    var sink = try common.TestSink.init(std.testing.allocator, .{ .axes = 6, .buttons = button_count, .hats = 1 });
    defer sink.deinit();
    var ctx: Context = .{};
    var out = sink.output(1);
    try decode_report(&ctx, &out, &[_]u8{ 0x04, 0, 0x40, 0, 0x80, 0x80, 0x80, 0x80, 0, 0 });
    try decode_report(&ctx, &out, &[_]u8{ 0x03, 0, 0x40, 0, 0x80, 0x80, 0x80, 0x80, 0 });
    try std.testing.expect(!sink.js.button_down(common.button.back));
}
