//! Nintendo Joy-Con (left and right, single controller) over Bluetooth (HIDAPI).
//!
//! Port of the single Joy-Con path of SDL_hidapi_switch.c: device identity from
//! the device-info reply, stick and IMU calibration from SPI flash, the open
//! sequence, the input-mode choice (including SDL's AUTO enhanced-report rule),
//! the simple (0x3F) mini handlers HandleMiniSimpleControllerStateL/R, the full
//! (0x30) mini handlers HandleMiniControllerStateL/R with the IMU and power
//! sections of HandleFullControllerState, HD rumble, and the player and home lights.
//!
//! The Joy-Con shares its state machine with the Pro Controller. Its full-mode
//! state is `switch_pro.Context` (`Context.pro`): calibration, IMU timing,
//! rumble, input mode and the enhanced-report hint all come from the Pro
//! driver's helpers, which are public for this reason. What is specific here is
//! the Joy-Con button and stick mapping and the axis remap for sensors.
//!
//! Protocol summary (Bluetooth; the Joy-Con grip and wired Joy-Cons are not
//! claimed):
//!   - Output: 49-byte report 0x01 with a counter nibble and a rumble block, the
//!     subcommand ID at byte 10 and its payload after.
//!   - Replies: report 0x21 whose subcommand byte at 14 echoes the request and
//!     whose acknowledge (bit 0x80 at byte 13) is set.
//!   - Input: report 0x3F (simple: two button bytes and a stick direction code)
//!     or report 0x30 (full: buttons, 12-bit sticks, battery and three IMU samples).
//!
//! Input mode (SDL_JOYSTICK_ENHANCED_REPORTS, default on): "on" selects full
//! reports; "auto" selects full reports for Joy-Cons because their sticks become
//! a D-pad in simple mode, and switches to "on" once the application uses an
//! enhanced feature; "off" keeps simple reports.
//!
//! Deliberate differences from SDL:
//! - Calibration and rumble subcommands are best effort: a failed SPI read keeps
//!   the centered defaults, and the open sequence never fails, so the Joy-Con
//!   still reports input. SDL fails the open when stick calibration cannot be read.
//! - Face-button labels (RemapButton) are not applied: single Joy-Cons use
//!   positions, as SDL does, because AlwaysUsesLabels is false for them.
//! - The home light is driven by `set_led` (the Pro curve); the hint-driven
//!   brightness of SDL is not read.
//! - Wired Joy-Cons and the Joy-Con grip (USB) are not claimed.
const std = @import("std");
const joystick = @import("../joystick.zig");
const common = @import("common.zig");
const device = @import("device.zig");
const switch_pro = @import("switch_pro.zig");

const Error = device.Error;
const Device = device.Device;
const Output = common.Output;
const Report = device.Report;

const vendor_nintendo: u16 = 0x057e;
const product_joycon_left: u16 = 0x2006;
const product_joycon_right: u16 = 0x2007;

/// Controller types from the device info reply (ESwitchDeviceInfoControllerType).
const controller_joycon_left: u8 = 1;
const controller_joycon_right: u8 = 2;

const report_subcommand_reply: u8 = 0x21;
const report_full: u8 = 0x30;
const report_full_mcu: u8 = 0x31;
const report_simple: u8 = 0x3f;

/// Motion reset and input timing, as the Pro Controller uses them (SDL values).
const imu_reset_delay_ns: u64 = 3000 * std.time.ns_per_ms;
const bluetooth_input_wait_ns: u64 = 3000 * std.time.ns_per_ms;
const rumble_refresh_interval_ns: u64 = 50 * std.time.ns_per_ms;

/// Which Joy-Con a device is. Chosen from the product ID, then corrected by the
/// device-info reply.
pub const Side = enum { left, right };

/// Button bytes and stick code of one simple report, as the controller sends them.
pub const SimplePacket = struct {
    /// Zero by default, as SDL's zeroed last-state (so a first report of code 0 is sent).
    buttons: [2]u8 = .{ 0, 0 },
    stick: u8 = 0,

    /// Parses the bytes after the report ID: buttons (two bytes) then the stick code.
    pub fn parse(bytes: []const u8) SimplePacket {
        return .{ .buttons = .{ bytes[0], bytes[1] }, .stick = bytes[2] };
    }
};

/// Stick axes for a direction code. Codes run clockwise from up (0) to up-left (7),
/// and 8 or more is centered. The table matches both side handlers in SDL.
pub fn stick_axes(code: u8) struct { x: i16, y: i16 } {
    const max = joystick.axis_max;
    const min = joystick.axis_min;
    return switch (code) {
        0 => .{ .x = 0, .y = min },
        1 => .{ .x = max, .y = min },
        2 => .{ .x = max, .y = 0 },
        3 => .{ .x = max, .y = max },
        4 => .{ .x = 0, .y = max },
        5 => .{ .x = min, .y = max },
        6 => .{ .x = min, .y = 0 },
        7 => .{ .x = min, .y = min },
        else => .{ .x = 0, .y = 0 },
    };
}

/// Driver state for one Joy-Con (SDL_DriverSwitch_Context, Joy-Con fields).
pub const Context = struct {
    side: Side = .left,
    /// Shared Switch state: calibration, IMU, rumble, input mode and lights.
    pro: switch_pro.Context = .{},
    /// Last simple-report packet, for changed-byte detection in simple mode.
    last: SimplePacket = .{},
};

/// Joy-Con (left or right) over Bluetooth. Joy-Con grips and wired controllers
/// are rejected because they need the grip protocol.
pub fn supports(probe: device.Probe) bool {
    if (!probe.bluetooth) return false;
    if (probe.vendor_id != vendor_nintendo) return false;
    return probe.product_id == product_joycon_left or probe.product_id == product_joycon_right;
}

/// Init: reads the device info (side and MAC address). The side comes from the
/// reply when it is known, else from the product ID. A Bluetooth copy of a
/// Joy-Con that is connected over USB does not connect.
pub fn init(ctx: *Context, dev: *Device, env: device.Env) Error!bool {
    ctx.* = .{ .side = if (dev.info.product_id == product_joycon_left) .left else .right };
    var mac: [6]u8 = @splat(0);
    const kind = switch_pro.read_device_identity(&ctx.pro, dev, &mac) catch null;
    if (kind) |value| {
        if (value == controller_joycon_left) ctx.side = .left;
        if (value == controller_joycon_right) ctx.side = .right;
    }
    dev.gamepad_type = if (ctx.side == .left) .joycon_left else .joycon_right;
    if (!std.mem.allEqual(u8, &mac, 0)) {
        var text: [17]u8 = undefined;
        try dev.set_serial(switch_pro.format_mac(&mac, &text));
    }
    if (dev.info.bluetooth and env.has_connected_usb(dev.info.serial)) return false;
    return true;
}

/// 16 buttons (SDL_GAMEPAD_NUM_SWITCH_BUTTONS), six axes and one hat.
pub fn layout(ctx: *const Context, dev: *const Device) joystick.Layout {
    _ = ctx;
    _ = dev;
    return .{ .axes = common.axis.count, .buttons = 16, .hats = 1, .balls = 0 };
}

/// Rumble (HD rumble, full reports only), player lights, and the home light on
/// the right Joy-Con (SDL's mono LED).
pub fn capabilities(ctx: *const Context) device.Capabilities {
    return .{
        .rumble = true,
        .player_led = ctx.pro.player_lights,
        .mono_led = ctx.side == .right,
    };
}

/// Open: the input mode, stick and IMU calibration, vibration, the enhanced
/// report hint and the player lights, in SDL's order. Subcommands are best effort.
pub fn open(ctx: *Context, dev: *Device) Error!void {
    ctx.last = .{};
    ctx.pro.last_input_ns = 0;
    ctx.pro.player_lights = dev.config.switch_player_lights;
    if (ctx.pro.initial_input_mode == 0) {
        var buf: [64]u8 = undefined;
        _ = switch_pro.read_input(&ctx.pro, dev, &buf, 1) catch null;
    }
    ctx.pro.current_input_mode = ctx.pro.initial_input_mode;

    _ = switch_pro.load_stick_calibration(&ctx.pro, dev) catch false;
    switch_pro.load_imu_calibration(&ctx.pro, dev) catch {};
    ctx.pro.sensors_supported = true;

    _ = switch_pro.set_vibration(&ctx.pro, dev, true) catch false;
    switch_pro.set_enhanced_report_hint(&ctx.pro, dev, dev.config.enhanced_reports) catch {};
    switch_pro.update_slot_led(&ctx.pro, dev) catch {};
    ctx.pro.imu_samples = 0;
    ctx.pro.imu_sample_timestamp_ns = 0;
}

/// Close: restores the simple reports other applications expect, as the Pro
/// Controller driver does.
pub fn close(ctx: *Context, dev: *Device) void {
    switch_pro.close(&ctx.pro, dev);
}

/// Stores the player index and refreshes the lights. Ignored while disconnected.
pub fn set_player_index(ctx: *Context, dev: *Device, index: i32) void {
    switch_pro.set_player_index(&ctx.pro, dev, index);
}

/// Home light (right Joy-Con) from the largest channel, as the Pro Controller does.
pub fn set_led(ctx: *Context, dev: *Device, red: u8, green: u8, blue: u8) Error!void {
    return switch_pro.set_led(&ctx.pro, dev, red, green, blue);
}

/// HD rumble. Only full reports carry the vibration, and the Pro driver's pacing
/// (30 ms writes, 50 ms refresh) applies.
pub fn rumble(ctx: *Context, dev: *Device, low: u16, high: u16) Error!void {
    return switch_pro.rumble(&ctx.pro, dev, low, high);
}

/// Motion sensors. Enabling switches to full reports (see `switch_pro`).
pub fn set_sensors_enabled(ctx: *Context, dev: *Device, enabled: bool) Error!void {
    return switch_pro.set_sensors_enabled(&ctx.pro, dev, enabled);
}

/// Decodes one simple report for the single Joy-Con (HandleMiniSimpleControllerState L or R).
/// Only changed bytes are sent, and the stick axes follow the direction code.
pub fn handle_simple(ctx: *Context, out: *Output, packet: SimplePacket) Error!void {
    const last = ctx.last;
    if (packet.buttons[0] != last.buttons[0]) {
        const b = packet.buttons[0];
        try out.button(common.button.south, b & 0x01 != 0);
        try out.button(common.button.east, b & 0x02 != 0);
        try out.button(common.button.west, b & 0x04 != 0);
        try out.button(common.button.north, b & 0x08 != 0);
        try out.button(common.button.left_shoulder, b & 0x10 != 0);
        try out.button(common.button.right_shoulder, b & 0x20 != 0);
    }
    if (packet.buttons[1] != last.buttons[1]) {
        const b = packet.buttons[1];
        switch (ctx.side) {
            .left => {
                try out.button(common.button.start, b & 0x01 != 0);
                try out.button(common.button.left_stick, b & 0x04 != 0);
                try out.button(common.button.guide, b & 0x20 != 0);
                try out.button(button_switch_left_paddle1, b & 0x40 != 0);
                try out.button(button_switch_left_paddle2, b & 0x80 != 0);
            },
            .right => {
                try out.button(common.button.start, b & 0x02 != 0);
                try out.button(common.button.left_stick, b & 0x08 != 0);
                try out.button(common.button.guide, b & 0x10 != 0);
                try out.button(button_switch_share, b & 0x20 != 0);
                try out.button(button_switch_right_paddle1, b & 0x40 != 0);
                try out.button(button_switch_right_paddle2, b & 0x80 != 0);
            },
        }
    }
    if (packet.stick != last.stick) {
        const axes = stick_axes(packet.stick);
        try out.axis(common.axis.left_x, axes.x);
        try out.axis(common.axis.left_y, axes.y);
    }
    ctx.last = packet;
}

/// Switch button indices above the standard set (SDL_GAMEPAD_BUTTON_SWITCH_*).
pub const button_switch_share: usize = 11;
pub const button_switch_right_paddle1: usize = 12;
pub const button_switch_left_paddle1: usize = 13;
pub const button_switch_right_paddle2: usize = 14;
pub const button_switch_left_paddle2: usize = 15;

/// Full report (0x30 or 0x31) for a single Joy-Con. `body` is the report without
/// its ID: counter, battery, buttons (body[2..5]), left stick (body[5..8]), right
/// stick (body[8..11]) and the IMU samples from body[12].
pub fn handle_full(ctx: *Context, dev: *Device, out: *Output, report: []const u8) Error!void {
    var body: [48]u8 = @splat(0);
    const n = @min(report.len, body.len);
    @memcpy(body[0..n], report[0..n]);
    switch (ctx.side) {
        .left => try handle_mini_left(ctx, out, &body),
        .right => try handle_mini_right(ctx, out, &body),
    }
    try handle_power(ctx, out, &body);
    if (ctx.pro.report_sensors) try emit_motion(ctx, dev, out, &body, false);
}

/// The left mini mapping of a full report (HandleMiniControllerStateL). Its
/// stick is read with the axes swapped and inverted, as SDL does.
fn handle_mini_left(ctx: *Context, out: *Output, body: *const [48]u8) Error!void {
    const b1 = body[3];
    const b2 = body[4];
    try out.button(common.button.start, b1 & 0x01 != 0);
    try out.button(common.button.left_stick, b1 & 0x08 != 0);
    try out.button(common.button.guide, b1 & 0x20 != 0);

    try out.button(common.button.south, b2 & 0x08 != 0);
    try out.button(common.button.east, b2 & 0x01 != 0);
    try out.button(common.button.west, b2 & 0x02 != 0);
    try out.button(common.button.north, b2 & 0x04 != 0);
    try out.button(common.button.right_shoulder, b2 & 0x10 != 0);
    try out.button(common.button.left_shoulder, b2 & 0x20 != 0);
    try out.button(button_switch_left_paddle1, b2 & 0x40 != 0);
    try out.button(button_switch_left_paddle2, b2 & 0x80 != 0);

    const x = switch_pro.apply_stick_calibration(&ctx.pro, 0, 0, stick_x(body[5..8]));
    const y = switch_pro.apply_stick_calibration(&ctx.pro, 0, 1, stick_y(body[6..9]));
    try out.axis(common.axis.left_y, ~x);
    try out.axis(common.axis.left_x, ~y);
}

/// The right mini mapping of a full report (HandleMiniControllerStateR). Its
/// stick writes the left axes with the same orientation as the left Joy-Con.
fn handle_mini_right(ctx: *Context, out: *Output, body: *const [48]u8) Error!void {
    const b0 = body[2];
    const b1 = body[3];
    try out.button(common.button.south, b0 & 0x08 != 0);
    try out.button(common.button.east, b0 & 0x02 != 0);
    try out.button(common.button.west, b0 & 0x04 != 0);
    try out.button(common.button.north, b0 & 0x01 != 0);
    try out.button(common.button.right_shoulder, b0 & 0x10 != 0);
    try out.button(common.button.left_shoulder, b0 & 0x20 != 0);
    try out.button(button_switch_right_paddle1, b0 & 0x40 != 0);
    try out.button(button_switch_right_paddle2, b0 & 0x80 != 0);

    try out.button(common.button.start, b1 & 0x02 != 0);
    try out.button(common.button.right_stick, b1 & 0x04 != 0);
    try out.button(common.button.guide, b1 & 0x10 != 0);

    const x = switch_pro.apply_stick_calibration(&ctx.pro, 1, 0, stick_x(body[8..11]));
    const y = switch_pro.apply_stick_calibration(&ctx.pro, 1, 1, stick_y(body[9..12]));
    try out.axis(common.axis.left_y, x);
    try out.axis(common.axis.left_x, y);
}

/// 12-bit X value of a packed stick: low byte, then the low nibble of the next.
pub fn stick_x(bytes: []const u8) i16 {
    return @intCast(@as(u16, bytes[0]) | ((@as(u16, bytes[1]) & 0x0f) << 8));
}

/// 12-bit Y value: the high nibble of the first byte, then the second byte.
pub fn stick_y(bytes: []const u8) i16 {
    return @intCast((@as(u16, bytes[0]) >> 4) | (@as(u16, bytes[1]) << 4));
}

/// Battery state and percent of a full report (SDL_hidapi_switch.c): the high
/// three bits of byte 1 are the level, 0 to 8 in eighths, and bit 4 is charging.
pub fn power_from_report(body: *const [48]u8) struct { state: common.PowerState, percent: u8 } {
    const charging = body[1] & 0x10 != 0;
    const level: u8 = (body[1] & 0xe0) >> 4;
    const state: common.PowerState = if (!charging) .on_battery else if (level == 8) .charged else .charging;
    const percent: u8 = @intFromFloat(@round(@as(f32, @floatFromInt(level)) / 8.0 * 100.0));
    return .{ .state = state, .percent = percent };
}

/// The battery level and charging state of a single Joy-Con (HandleFullControllerState).
fn handle_power(ctx: *Context, out: *Output, body: *const [48]u8) Error!void {
    const power = power_from_report(body);
    ctx.pro.power_state = power.state;
    ctx.pro.power_percent = power.percent;
    try out.battery(power.state, power.percent);
}

/// The IMU section of a full report: three samples emitted oldest first, or a
/// periodic re-enable when the motion data stopped. `combined` is set for a
/// child of a combined pair, where the axes are not swapped for mini mode.
pub fn emit_motion(ctx: *Context, dev: *Device, out: *Output, body: *const [48]u8, combined: bool) Error!void {
    if (switch_pro.has_motion(body[12..24])) {
        const stamps = switch_pro.next_imu_timestamps(&ctx.pro);
        const samples = [3]usize{ 2, 1, 0 };
        for (samples, stamps) |sample, stamp| {
            const offset = 12 + sample * 12;
            const accel = [3]i16{ read_i16(body, offset), read_i16(body, offset + 2), read_i16(body, offset + 4) };
            const gyro = [3]i16{ read_i16(body, offset + 6), read_i16(body, offset + 8), read_i16(body, offset + 10) };
            try send_sensor(ctx, out, .gyro, stamp, gyro, combined);
            try send_sensor(ctx, out, .accel, stamp, accel, combined);
        }
    } else if (ctx.pro.has_sensor_data) {
        if (ctx.pro.now_ns >= ctx.pro.last_imu_reset_ns + imu_reset_delay_ns) {
            _ = switch_pro.set_imu_enabled(&ctx.pro, dev, true) catch false;
            ctx.pro.last_imu_reset_ns = ctx.pro.now_ns;
        }
    }
}

fn read_i16(bytes: []const u8, offset: usize) i16 {
    return std.mem.readInt(i16, bytes[offset..][0..2], .little);
}

/// Scales and remaps one IMU triple (SendSensorUpdate). The right Joy-Con flips
/// two axes back; a lone Joy-Con in mini mode also swaps its axes to the
/// sideways layout. A child of a combined pair keeps only the flip.
fn send_sensor(ctx: *const Context, out: *Output, sensor: common.Sensor, ns: u64, values: [3]i16, combined: bool) Error!void {
    var data = switch_pro.scale_imu(&ctx.pro, sensor, values);
    if (ctx.side == .right) {
        data[0] = -data[0];
        data[1] = -data[1];
    }
    if (!combined) {
        switch (ctx.side) {
            .left => {
                const tmp = data[2];
                data[2] = -data[0];
                data[0] = tmp;
            },
            .right => {
                const tmp = data[2];
                data[2] = data[0];
                data[0] = -tmp;
            },
        }
    }
    try out.sensor(sensor, data, ns);
}

/// Reads every queued report. Simple and full reports are decoded, subcommand
/// replies are skipped, and a silent Bluetooth link past its timeout is a
/// disconnect. Pending HD rumble is sent by the pacing rules of the Pro driver.
pub fn update(ctx: *Context, dev: *Device, out: *Output, env: device.Env) Error!Report {
    var report: Report = .{};
    const now = out.timestamp;
    ctx.pro.now_ns = now;
    if (ctx.pro.last_input_ns == 0) ctx.pro.last_input_ns = now;

    var buf: [64]u8 = undefined;
    var packet_count: usize = 0;
    while (true) {
        const data = dev.poll_report(&buf) catch {
            report.read_failed = true;
            break;
        } orelse break;
        packet_count += 1;
        ctx.pro.last_input_ns = now;
        if (!dev.is_connected()) continue;
        if (data[0] == report_subcommand_reply) continue;
        ctx.pro.current_input_mode = data[0];
        switch (data[0]) {
            report_simple => if (data.len >= 4) try handle_simple(ctx, out, SimplePacket.parse(data[1..])),
            report_full, report_full_mcu => {
                switch_pro.update_enhanced_on_enhanced_report(&ctx.pro, dev) catch {};
                try handle_full(ctx, dev, out, data[1..]);
            },
            else => {},
        }
    }

    if (dev.is_connected()) {
        if (packet_count == 0 and ctx.pro.current_input_mode != report_simple) {
            if (now >= ctx.pro.last_input_ns + bluetooth_input_wait_ns) report.read_failed = true;
        }
        if (ctx.pro.rumble_pending or ctx.pro.rumble_zero_pending) {
            switch_pro.send_pending_rumble(&ctx.pro, dev) catch {};
        } else if (ctx.pro.rumble_active and now >= ctx.pro.rumble_sent_ns + rumble_refresh_interval_ns) {
            switch_pro.write_rumble(&ctx.pro, dev) catch {};
        }
    } else if (packet_count > 0 and !env.has_connected_usb(dev.info.serial)) {
        report.connect = true;
    }
    return report;
}
