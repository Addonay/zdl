//! NVIDIA SHIELD controllers over USB (HIDAPI): the 2015 controller (product
//! 0x7210, "V103", with a touchpad and Minus and Plus buttons) and the 2017
//! controller (product 0x7214, "V104").
//!
//! Port of SDL_hidapi_shield.c. Reports are dispatched by their first byte:
//!   0x01 state: 16 bytes on V103, 23 or more on V104 (the layouts differ).
//!   0x02 touch: V103 touchpad position and click.
//!   0x03 command response: byte 1 is the command, the payload starts at byte 3.
//!   0x04 command request: the output form used for every command.
//! Commands are 33-byte reports: {0x04, command, sequence, payload...}. Rumble
//! (command 0x39) carries {0x01, left, right} amplitudes, which are the 16-bit
//! motor values shifted down to 0..31. Battery and charge state (0x07 and 0x3a)
//! are requested when the joystick opens and again once a minute.
//!
//! Timing: SDL reads the clock in milliseconds. This driver takes the packet
//! timestamp in nanoseconds from `update`. A rumble change clears the refresh
//! stamp, which the next update sets, so a repeat of the same amplitudes is
//! sent about half a second after the change.
//!
//! Deliberate differences from SDL:
//! - SDL's macOS-only guard for command writes is not compiled for Linux.
//! - The battery percentage is clamped to 100. SDL multiplies the raw level by
//!   20 without a clamp.
//! - SDL's `rumble_report_pending` flag is never set in the reference, so rumble
//!   is written at once here, with no wait for the acknowledgement.
const std = @import("std");
const joystick = @import("../joystick.zig");
const common = @import("common.zig");
const device = @import("device.zig");

const Error = device.Error;
const Device = device.Device;
const Output = common.Output;
const Report = device.Report;

pub const vendor_nvidia: u16 = 0x0955;
pub const product_controller_v103: u16 = 0x7210;
pub const product_controller_v104: u16 = 0x7214;

const usb_packet_length = 64;
const hid_report_size = 33;
const max_payload = hid_report_size - 3;

const report_state: u8 = 0x01;
const report_touch: u8 = 0x02;
const report_command_response: u8 = 0x03;
const report_command_request: u8 = 0x04;

const command_rumble: u8 = 0x39;
const command_charge_state: u8 = 0x3a;
const command_battery_state: u8 = 0x07;

/// Milliseconds between battery queries, and between rumble refreshes, in nanoseconds.
const battery_poll_interval_ns: u64 = 60_000_000_000;
const rumble_refresh_interval_ns: u64 = 500_000_000;

/// Button indices past the standard set (SDL_GAMEPAD_BUTTON_SHIELD_*).
pub const button_share: usize = 11;
pub const button_v103_touchpad: usize = 12;
pub const button_v103_minus: usize = 13;
pub const button_v103_plus: usize = 14;
pub const button_count_v103: usize = 15;
pub const button_count_v104: usize = 12;

/// Driver state. Owns no resources.
pub const Context = struct {
    /// Sequence number of the next command request.
    seq_num: u8 = 0,
    has_charging: bool = false,
    charging: u8 = 0,
    has_battery_level: bool = false,
    battery_level: u8 = 0,
    /// Stamp of the last battery query (null until the first update after open).
    last_battery_query_ns: ?u64 = null,
    rumble_update_pending: bool = false,
    left_motor_amplitude: u8 = 0,
    right_motor_amplitude: u8 = 0,
    /// Stamp of the last rumble command (null after a change, see the module comment).
    last_rumble_ns: ?u64 = null,
    last_state: [usb_packet_length]u8 = @splat(0),
};

/// Matches the two NVIDIA SHIELD controller products.
pub fn supports(probe: device.Probe) bool {
    if (probe.vendor_id != vendor_nvidia) return false;
    return probe.product_id == product_controller_v103 or probe.product_id == product_controller_v104;
}

/// Names the device and connects it at once; the controller needs no handshake.
pub fn init(ctx: *Context, dev: *Device, env: device.Env) Error!bool {
    _ = env;
    ctx.* = .{};
    try dev.set_name("NVIDIA SHIELD Controller");
    return true;
}

/// V103 has 15 buttons and one touchpad; V104 has 12 buttons. Both have one hat.
pub fn layout(ctx: *const Context, dev: *const Device) joystick.Layout {
    _ = ctx;
    const buttons = if (dev.info.product_id == product_controller_v103) button_count_v103 else button_count_v104;
    return .{ .axes = common.axis.count, .buttons = buttons, .hats = 1 };
}

/// OpenJoystick: resets rumble and the last state, declares the touchpad on V103,
/// and requests the charge and battery state.
pub fn open(ctx: *Context, dev: *Device) Error!void {
    ctx.rumble_update_pending = false;
    ctx.left_motor_amplitude = 0;
    ctx.right_motor_amplitude = 0;
    ctx.last_rumble_ns = null;
    ctx.last_state = @splat(0);
    if (dev.info.product_id == product_controller_v103) dev.state.add_touchpad(1);
    try send_command(ctx, dev, command_charge_state, &.{});
    try send_command(ctx, dev, command_battery_state, &.{});
    ctx.last_battery_query_ns = null;
}

/// Rumble is available on both products.
pub fn capabilities(ctx: *const Context) device.Capabilities {
    _ = ctx;
    return .{ .rumble = true };
}

/// Queues one command request. The payload is zero-padded to the report size.
fn send_command(ctx: *Context, dev: *Device, command: u8, payload: []const u8) Error!void {
    if (payload.len > max_payload) return error.InvalidArgument;
    var packet: [hid_report_size]u8 = @splat(0);
    packet[0] = report_command_request;
    packet[1] = command;
    packet[2] = ctx.seq_num;
    ctx.seq_num +%= 1;
    @memcpy(packet[3..][0..payload.len], payload);
    _ = try dev.send_report(&packet, .report_id);
}

/// Sends the current motor amplitudes as a rumble command (SendNextRumble).
fn send_rumble(ctx: *Context, dev: *Device) Error!void {
    if (!ctx.rumble_update_pending) return;
    ctx.rumble_update_pending = false;
    const payload = [_]u8{ 0x01, ctx.left_motor_amplitude, ctx.right_motor_amplitude };
    try send_command(ctx, dev, command_rumble, &payload);
}

/// Rumbles one motor pair. V103 takes the raw 16-bit values in a 7-byte report;
/// V104 takes the amplitudes through the command protocol.
pub fn rumble(ctx: *Context, dev: *Device, low: u16, high: u16) Error!void {
    if (dev.info.product_id == product_controller_v103) {
        const packet = [_]u8{ 0x01, 0x00, @truncate(low >> 8), 0x00, @truncate(high >> 8), 0x00, 0x00 };
        _ = try dev.send_report(&packet, .report_id);
        return;
    }
    ctx.left_motor_amplitude = @truncate(low >> 11);
    ctx.right_motor_amplitude = @truncate(high >> 11);
    ctx.rumble_update_pending = true;
    // A change restarts the refresh timer; the next timer pass stamps it.
    ctx.last_rumble_ns = null;
    try send_rumble(ctx, dev);
}

/// Sends a raw command: the first byte is the command, the rest the payload.
pub fn send_effect(ctx: *Context, dev: *Device, data: []const u8) Error!void {
    if (data.len == 0) return error.InvalidArgument;
    try send_command(ctx, dev, data[0], data[1..]);
}

/// Stick and trigger word from two bytes, minus 0x8000 (LOAD16 - 0x8000 in SDL).
fn word_axis(lo: u8, hi: u8) i16 {
    const raw: i32 = @as(i32, lo) | (@as(i32, hi) << 8);
    return @intCast(raw - 0x8000);
}

/// Hat from a code 0 to 7, clockwise from up, with 8 or more centred (SDL's switch).
fn hat_from_code(code: u8) joystick.Hat {
    return common.hat_from_dpad(code);
}

/// V103 state report (HandleStatePacketV103, 16 bytes).
fn decode_state_v103(ctx: *Context, out: *Output, data: []const u8) Error!void {
    const last = &ctx.last_state;
    if (last[3] != data[3]) try out.hat(hat_from_code(data[3]));
    if (last[1] != data[1]) {
        try out.button(common.button.south, data[1] & 0x01 != 0);
        try out.button(common.button.east, data[1] & 0x02 != 0);
        try out.button(common.button.west, data[1] & 0x04 != 0);
        try out.button(common.button.north, data[1] & 0x08 != 0);
        try out.button(common.button.left_shoulder, data[1] & 0x10 != 0);
        try out.button(common.button.right_shoulder, data[1] & 0x20 != 0);
        try out.button(common.button.left_stick, data[1] & 0x40 != 0);
        try out.button(common.button.right_stick, data[1] & 0x80 != 0);
    }
    if (last[2] != data[2]) {
        try out.button(common.button.start, data[2] & 0x02 != 0);
        try out.button(button_v103_plus, data[2] & 0x08 != 0);
        try out.button(button_v103_minus, data[2] & 0x10 != 0);
        try out.button(common.button.back, data[2] & 0x40 != 0);
        try out.button(common.button.guide, data[2] & 0x80 != 0);
    }
    try out.axis(common.axis.left_x, word_axis(data[4], data[5]));
    try out.axis(common.axis.left_y, word_axis(data[6], data[7]));
    try out.axis(common.axis.right_x, word_axis(data[8], data[9]));
    try out.axis(common.axis.right_y, word_axis(data[10], data[11]));
    try out.axis(common.axis.left_trigger, word_axis(data[12], data[13]));
    try out.axis(common.axis.right_trigger, word_axis(data[14], data[15]));
    copy_state(&ctx.last_state, data);
}

/// V103 touch report (HandleTouchPacketV103). The pad is triangular, so only
/// its centre is used as the touch area.
fn decode_touch_v103(out: *Output, data: []const u8) Error!void {
    try out.button(button_v103_touchpad, data[1] & 0x01 != 0);
    const down = data[1] & 0x80 == 0;
    const x = std.math.clamp(@as(f32, @floatFromInt(@as(i32, data[2]) - 0x70)) / 0x50, 0.0, 1.0);
    const y = std.math.clamp(@as(f32, @floatFromInt(@as(i32, data[4]) - 0x40)) / 0x15, 0.0, 1.0);
    try out.touchpad_finger(0, 0, down, x, y, if (down) 1.0 else 0.0);
}

/// V104 state report (HandleStatePacketV104, 23 bytes or more).
fn decode_state_v104(ctx: *Context, out: *Output, data: []const u8) Error!void {
    if (data.len < 23) return;
    const last = &ctx.last_state;
    if (last[2] != data[2]) try out.hat(hat_from_code(data[2]));
    if (last[3] != data[3]) {
        try out.button(common.button.south, data[3] & 0x01 != 0);
        try out.button(common.button.east, data[3] & 0x02 != 0);
        try out.button(common.button.west, data[3] & 0x04 != 0);
        try out.button(common.button.north, data[3] & 0x08 != 0);
        try out.button(common.button.left_shoulder, data[3] & 0x10 != 0);
        try out.button(common.button.right_shoulder, data[3] & 0x20 != 0);
        try out.button(common.button.left_stick, data[3] & 0x40 != 0);
        try out.button(common.button.right_stick, data[3] & 0x80 != 0);
    }
    if (last[4] != data[4]) try out.button(common.button.start, data[4] & 0x01 != 0);
    try out.axis(common.axis.left_x, word_axis(data[9], data[10]));
    try out.axis(common.axis.left_y, word_axis(data[11], data[12]));
    try out.axis(common.axis.right_x, word_axis(data[13], data[14]));
    try out.axis(common.axis.right_y, word_axis(data[15], data[16]));
    try out.axis(common.axis.left_trigger, word_axis(data[19], data[20]));
    try out.axis(common.axis.right_trigger, word_axis(data[21], data[22]));
    if (last[17] != data[17]) {
        try out.button(common.button.back, data[17] & 0x02 != 0);
        try out.button(common.button.guide, data[17] & 0x01 != 0);
    }
    copy_state(&ctx.last_state, data);
}

fn copy_state(last: *[usb_packet_length]u8, data: []const u8) void {
    const n = @min(data.len, usb_packet_length);
    @memcpy(last[0..n], data[0..n]);
}

/// Sends the battery level when both the charge and the level are known
/// (UpdatePowerInfo). The level is 0 to 5, in steps of 20 percent.
fn update_power(ctx: *const Context, out: *Output) Error!void {
    if (!ctx.has_charging or !ctx.has_battery_level) return;
    const state: common.PowerState = if (ctx.charging != 0) .charging else .on_battery;
    const percent: u8 = @intCast(@min(@as(u16, ctx.battery_level) * 20, 100));
    try out.battery(state, percent);
}

/// Decodes a command response (the 0x03 report).
fn decode_response(ctx: *Context, dev: *Device, out: *Output, data: []const u8) Error!void {
    if (data.len < 4) return;
    switch (data[1]) {
        command_rumble => try send_rumble(ctx, dev),
        command_charge_state => {
            ctx.has_charging = true;
            ctx.charging = data[3];
            try update_power(ctx, out);
        },
        command_battery_state => {
            if (data.len < 6) return;
            ctx.has_battery_level = true;
            ctx.battery_level = data[5];
            try update_power(ctx, out);
        },
        else => {},
    }
}

/// Decodes one input report and dispatches on its ID.
fn decode_report(ctx: *Context, dev: *Device, out: *Output, data: []const u8) Error!void {
    if (data.len == 0) return;
    switch (data[0]) {
        report_state => {
            if (dev.info.product_id == product_controller_v103) {
                if (data.len == 16) try decode_state_v103(ctx, out, data);
            } else {
                try decode_state_v104(ctx, out, data);
            }
        },
        report_touch => {
            if (dev.info.product_id == product_controller_v103 and data.len >= 5) try decode_touch_v103(out, data);
        },
        report_command_response => try decode_response(ctx, dev, out, data),
        else => {},
    }
}

/// Drains the input queue, then runs the timers: a battery query once a minute
/// and a rumble refresh every half second while the motors run.
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
        try decode_report(ctx, dev, out, data);
    }

    try battery_timer(ctx, dev, out.timestamp);
    try rumble_timer(ctx, dev, out.timestamp);
    return report;
}

/// Queries the battery state once a minute. `open` already asked for it, so the
/// first pass only starts the timer.
fn battery_timer(ctx: *Context, dev: *Device, now: u64) Error!void {
    if (ctx.last_battery_query_ns) |last| {
        if (now >= last +| battery_poll_interval_ns) {
            ctx.last_battery_query_ns = now;
            try send_command(ctx, dev, command_battery_state, &.{});
        }
    } else {
        ctx.last_battery_query_ns = now;
    }
}

/// Resends the motor amplitudes every half second while they are not zero, as
/// SDL does for hardware that stops after a short time. The first pass after a
/// change only starts the timer, because the change itself was already sent.
fn rumble_timer(ctx: *Context, dev: *Device, now: u64) Error!void {
    if (ctx.left_motor_amplitude == 0 and ctx.right_motor_amplitude == 0) return;
    if (ctx.last_rumble_ns) |last| {
        if (now >= last +| rumble_refresh_interval_ns) {
            ctx.rumble_update_pending = true;
            ctx.last_rumble_ns = now;
            try send_rumble(ctx, dev);
        }
    } else {
        ctx.last_rumble_ns = now;
    }
}

test "SHIELD V104 state maps hat, buttons and 16-bit axes" {
    var sink = try common.TestSink.init(std.testing.allocator, .{ .axes = 6, .buttons = button_count_v104, .hats = 1 });
    defer sink.deinit();
    var ctx: Context = .{};
    var out = sink.output(1);
    var packet: [23]u8 = @splat(0);
    packet[0] = report_state;
    packet[2] = 2; // right
    packet[3] = 0x01 | 0x40; // south and left stick
    packet[4] = 0x01; // start
    packet[9] = 0x00;
    packet[10] = 0x80; // left X, centre at 0x8000
    packet[11] = 0xff;
    packet[12] = 0xff; // left Y at the maximum
    packet[17] = 0x01; // guide
    try decode_state_v104(&ctx, &out, &packet);
    try std.testing.expectEqual(@as(u8, 0x2), sink.js.hat_value(0).bits());
    try std.testing.expect(sink.js.button_down(common.button.south));
    try std.testing.expect(sink.js.button_down(common.button.left_stick));
    try std.testing.expect(sink.js.button_down(common.button.start));
    try std.testing.expect(sink.js.button_down(common.button.guide));
    try std.testing.expect(!sink.js.button_down(common.button.back));
    try std.testing.expectEqual(@as(i16, 0), sink.js.axis_value(common.axis.left_x));
    try std.testing.expectEqual(@as(i16, 32767), sink.js.axis_value(common.axis.left_y));
}

test "SHIELD V103 touch report presses the touchpad and places the finger" {
    var sink = try common.TestSink.init(std.testing.allocator, .{ .axes = 6, .buttons = button_count_v103, .hats = 1 });
    defer sink.deinit();
    sink.state.add_touchpad(1);
    var out = sink.output(1);
    // Touchpad button down, finger down (bit 7 clear), X at 0.6 and Y at 10/21 of the pad.
    const packet = [_]u8{ report_touch, 0x01, 0xa0, 0, 0x4a, 0, 0, 0 };
    try decode_touch_v103(&out, &packet);
    try std.testing.expect(sink.js.button_down(button_v103_touchpad));
    try std.testing.expect(sink.state.touchpads[0][0].down);
    try std.testing.expectApproxEqAbs(@as(f32, 0.6), sink.state.touchpads[0][0].x, 0.001);
    try std.testing.expectApproxEqAbs(@as(f32, 10.0 / 21.0), sink.state.touchpads[0][0].y, 0.001);
}

/// The bytes of the first queued report.
fn first_queued(dev: *const Device) []const u8 {
    const request = &dev.rumble.pending.items[0];
    return request.data[0..request.len];
}

test "SHIELD command requests carry a sequence number and zero padding" {
    var ctx: Context = .{ .seq_num = 7 };
    var dev = try testing_device(std.testing.allocator);
    defer dev.deinit();
    try send_command(&ctx, &dev, command_battery_state, &.{});
    try std.testing.expectEqual(@as(u8, 8), ctx.seq_num);
    const queued = first_queued(&dev);
    try std.testing.expectEqual(@as(usize, hid_report_size), queued.len);
    try std.testing.expectEqualSlices(u8, &.{ report_command_request, command_battery_state, 7 }, queued[0..3]);
    try std.testing.expectEqual(@as(u8, 0), queued[3]);
}

test "SHIELD rumble converts the 16-bit motors and refreshes every half second" {
    var ctx: Context = .{};
    var dev = try testing_device(std.testing.allocator);
    defer dev.deinit();
    try rumble(&ctx, &dev, 0xffff, 0x0800);
    try std.testing.expectEqual(@as(u8, 0x1f), ctx.left_motor_amplitude);
    try std.testing.expectEqual(@as(u8, 0x01), ctx.right_motor_amplitude);
    const queued = first_queued(&dev);
    try std.testing.expectEqual(command_rumble, queued[1]);
    try std.testing.expectEqualSlices(u8, &.{ 0x01, 0x1f, 0x01 }, queued[3..6]);

    // The first timer pass after the change starts the clock; nothing is resent yet.
    dev.rumble.pending.clearRetainingCapacity();
    try rumble_timer(&ctx, &dev, 1_000_000_000);
    try std.testing.expect(dev.rumble.is_empty());
    try rumble_timer(&ctx, &dev, 1_400_000_000);
    try std.testing.expect(dev.rumble.is_empty());
    try rumble_timer(&ctx, &dev, 1_500_000_000);
    try std.testing.expectEqual(command_rumble, first_queued(&dev)[1]);

    // Stopping the motors sends a zero command and no further refresh.
    dev.rumble.pending.clearRetainingCapacity();
    try rumble(&ctx, &dev, 0, 0);
    try std.testing.expectEqualSlices(u8, &.{ 0x01, 0x00, 0x00 }, first_queued(&dev)[3..6]);
    dev.rumble.pending.clearRetainingCapacity();
    try rumble_timer(&ctx, &dev, 3_000_000_000);
    try std.testing.expect(dev.rumble.is_empty());
}

/// A device with no hidraw node, for tests of the queued output.
fn testing_device(allocator: std.mem.Allocator) Error!Device {
    const record: @import("../../hid/sysfs.zig").DeviceInfo = .{
        .path = try allocator.dupe(u8, "/dev/null"),
        .manufacturer = try allocator.dupe(u8, ""),
        .product = try allocator.dupe(u8, ""),
        .serial_number = try allocator.dupe(u8, ""),
        .vendor_id = vendor_nvidia,
        .product_id = product_controller_v104,
        .release_number = 0,
        .bus = .usb,
        .usage_page = 0,
        .usage = 0,
        .interface_number = null,
    };
    return Device.from_record(allocator, record);
}
