//! Steam Deck controls over HIDAPI.
//!
//! Port of SDL_hidapi_steamdeck.c. The Deck's controller endpoint sends 64-byte
//! deck-state reports (version 1, type 9, length 64) about every 4 ms. The
//! same USB device also exposes keyboard and mouse interfaces; only the
//! controller endpoint answers the first read, which is how init picks it.
//!
//! Report layout (offsets into the payload, which follows the 4-byte header;
//! the code reads the report at +4 from these):
//!   0: packet number (u32)     4: buttons L (u32), 8: buttons H (u32)
//!   12/14: left pad X/Y, 16/18: right pad X/Y (i16)
//!   20..26: accelerometer X, Y, Z (i16), 26..32: gyro X, Y, Z (i16)
//!   32..40: quaternion (unused)  40/42: raw trigger L/R (u16)
//!   44/46: left stick X/Y (i16), 48/50: right stick X/Y (i16)
//!   52/54: pad pressure left/right (u16)
//!
//! Lizard mode: the Deck's firmware re-enables lizard (mouse and keyboard)
//! output on its own. SDL clears the mappings and disables the trackpad and
//! click settings at init, and feeds a watchdog every 200 updates. The port
//! keeps both behaviors.
//!
//! Deliberate differences from SDL:
//! - SDL's capacitive-sense events (stick touch) are not modeled; the joystick
//!   model has no cap-sense channel, so those two bits are read but dropped.
//! - The init read waits 16 ms for the first report, as SDL does. A timeout
//!   leaves the node unclaimed.
const std = @import("std");
const joystick = @import("../joystick.zig");
const common = @import("common.zig");
const device = @import("device.zig");
const steam = @import("steam.zig");
const sc = @import("steam_constants.zig");

const Error = device.Error;
const Device = device.Device;
const Output = common.Output;
const Report = device.Report;

const usb_packet_length = 64;
const feature_size = 65;
const vendor_valve: u16 = 0x28de;

const deck_message_id: u8 = 9;
const deck_payload_length: u8 = 64;

/// Steam Deck buttons above the standard set (SDL_GAMEPAD_BUTTON_STEAM_DECK_*).
const button_qam: usize = 11;
const button_right_paddle1: usize = 12;
const button_left_paddle1: usize = 13;
const button_right_paddle2: usize = 14;
const button_left_paddle2: usize = 15;
const button_right_touchpad: usize = 16;
const button_left_touchpad: usize = 17;
/// Buttons the Deck driver numbers (SDL_GAMEPAD_NUM_STEAM_DECK_BUTTONS).
const button_count: usize = 18;

/// Deck button bits in the low 32-bit word (STEAMDECK_LBUTTON_*).
const l_r2: u32 = 0x00000001;
const l_l2: u32 = 0x00000002;
const l_r: u32 = 0x00000004;
const l_l: u32 = 0x00000008;
const l_y: u32 = 0x00000010;
const l_b: u32 = 0x00000020;
const l_x: u32 = 0x00000040;
const l_a: u32 = 0x00000080;
const l_dpad_up: u32 = 0x00000100;
const l_dpad_right: u32 = 0x00000200;
const l_dpad_left: u32 = 0x00000400;
const l_dpad_down: u32 = 0x00000800;
const l_view: u32 = 0x00001000;
const l_steam: u32 = 0x00002000;
const l_menu: u32 = 0x00004000;
const l_l5: u32 = 0x00008000;
const l_r5: u32 = 0x00010000;
const l_left_pad: u32 = 0x00020000;
const l_right_pad: u32 = 0x00040000;
const l_left_touch: u32 = 0x00080000;
const l_right_touch: u32 = 0x00100000;
const l_l3: u32 = 0x00400000;
const l_r3: u32 = 0x04000000;
/// Deck button bits in the high 32-bit word (STEAMDECK_HBUTTON_*).
const h_l4: u32 = 0x00000200;
const h_r4: u32 = 0x00000400;
const h_lstick_touch: u32 = 0x00004000;
const h_rstick_touch: u32 = 0x00008000;
const h_qam: u32 = 0x00040000;

/// Lizard-off settings sent at init (DisableDeckLizardMode).
const pressure_disabled: u16 = 0xffff;
/// Watchdog period in updates (FeedDeckLizardWatchdog runs when the counter passes it).
const watchdog_period: u32 = 200;
/// Connection interval, in microseconds, of the Deck's controller endpoint.
const update_rate_us: u32 = 4000;

/// Driver state for one Deck controller node (SDL_DriverSteamDeck_Context).
pub const Context = struct {
    sensor_timestamp_ns: u64 = 0,
    last_buttons: u64 = 0,
    watchdog_counter: u32 = 0,
    left_touch_down: bool = false,
    left_touch_x: f32 = 0,
    left_touch_y: f32 = 0,
    right_touch_down: bool = false,
    right_touch_x: f32 = 0,
    right_touch_y: f32 = 0,
};

/// SDL_IsJoystickSteamDeck: the Neptune controller type.
pub fn supports(probe: device.Probe) bool {
    if (probe.vendor_id != vendor_valve) return false;
    return joystick.guess_controller_type(probe.vendor_id, probe.product_id) == .steam_controller_neptune;
}

/// Clears the digital mappings and turns off the trackpads and click pressure,
/// then discards any reply still queued (DisableDeckLizardMode).
fn disable_lizard(dev: *Device) Error!void {
    try steam.set_feature(dev, &.{ 0, sc.id_clear_digital_mappings, 0 });
    try steam.send_settings(dev, &.{
        .{ sc.setting_smooth_absolute_mouse, 0 },
        .{ sc.setting_left_trackpad_mode, sc.trackpad_none },
        .{ sc.setting_right_trackpad_mode, sc.trackpad_none },
        .{ sc.setting_left_trackpad_click_pressure, pressure_disabled },
        .{ sc.setting_right_trackpad_click_pressure, pressure_disabled },
    });
    discard_feature_reply(dev);
}

/// The periodic watchdog: clears mappings again and keeps the right trackpad off.
fn feed_watchdog(dev: *Device) Error!void {
    try steam.set_feature(dev, &.{ 0, sc.id_clear_digital_mappings, 0 });
    try steam.send_settings(dev, &.{.{ sc.setting_right_trackpad_mode, sc.trackpad_none }});
    discard_feature_reply(dev);
}

/// Reads and drops a feature reply left over from a settings change. Failures
/// are ignored, as SDL ignores the read's result.
fn discard_feature_reply(dev: *Device) void {
    var buf: [feature_size]u8 = @splat(0);
    _ = dev.read_feature(0, &buf);
}

/// Init: waits up to 16 ms for a report, which selects the controller endpoint.
/// A node that stays silent is not claimed (error.NoDevice).
pub fn init(ctx: *Context, dev: *Device, env: device.Env) Error!bool {
    _ = env;
    ctx.* = .{};
    var data: [usb_packet_length]u8 = undefined;
    _ = (try dev.read_report_timeout(&data, 16)) orelse return error.NoDevice;
    try disable_lizard(dev);
    try dev.set_name("Steam Deck");
    dev.gamepad_type = .steam;
    return true;
}

/// 18 buttons, six axes and one hat. Sensors and touchpads are added at open.
pub fn layout(ctx: *const Context, dev: *const Device) joystick.Layout {
    _ = ctx;
    _ = dev;
    return .{ .axes = common.axis.count, .buttons = button_count, .hats = 1, .balls = 0 };
}

/// OpenJoystick: declares the gyro and accelerometer at the endpoint's rate, and
/// two touchpads with one finger each.
pub fn open(ctx: *Context, dev: *Device) Error!void {
    _ = ctx;
    const rate_hz: f32 = 1_000_000.0 / @as(f32, @floatFromInt(update_rate_us));
    dev.state.set_sensor_rate(.gyro, rate_hz);
    dev.state.set_sensor_rate(.accel, rate_hz);
    dev.state.add_touchpad(2);
}

/// Rumble through the simple-rumble command, with the system intensity and the
/// left gain of 2 that SDL uses. Sent immediately, not queued.
pub fn rumble(ctx: *Context, dev: *Device, low: u16, high: u16) Error!void {
    _ = ctx;
    var buf: [feature_size]u8 = @splat(0);
    buf[1] = sc.id_trigger_rumble_cmd;
    // Payload: rumble type (0), intensity (system = 0), left and right motor speeds, gains.
    std.mem.writeInt(u16, buf[6..8], low, .little);
    std.mem.writeInt(u16, buf[8..10], high, .little);
    buf[10] = 2;
    buf[11] = 0;
    try steam.set_feature(dev, &buf);
}

/// Motor rumble is the only output; trigger rumble is not available.
pub fn capabilities(ctx: *const Context) device.Capabilities {
    _ = ctx;
    return .{ .rumble = true };
}

/// The Deck keeps its sensors enabled, so there is nothing to change (SDL returns true).
pub fn set_sensors_enabled(ctx: *Context, dev: *Device, enabled: bool) Error!void {
    _ = ctx;
    _ = dev;
    _ = enabled;
}

/// Writes the button, hat, axis, sensor and touchpad changes for one report.
/// The buttons are compared as one 64-bit word, as SDL does.
fn handle_state(ctx: *Context, out: *Output, data: []const u8) Error!void {
    const l = std.mem.readInt(u32, data[8..12], .little);
    const h = std.mem.readInt(u32, data[12..16], .little);
    const buttons: u64 = @as(u64, h) << 32 | l;

    if (buttons != ctx.last_buttons) {
        try out.button(common.button.south, l & l_a != 0);
        try out.button(common.button.east, l & l_b != 0);
        try out.button(common.button.west, l & l_x != 0);
        try out.button(common.button.north, l & l_y != 0);
        try out.button(common.button.left_shoulder, l & l_l != 0);
        try out.button(common.button.right_shoulder, l & l_r != 0);
        try out.button(common.button.back, l & l_view != 0);
        try out.button(common.button.start, l & l_menu != 0);
        try out.button(common.button.guide, l & l_steam != 0);
        try out.button(button_qam, h & h_qam != 0);
        try out.button(common.button.left_stick, l & l_l3 != 0);
        try out.button(common.button.right_stick, l & l_r3 != 0);
        try out.button(button_right_paddle1, h & h_r4 != 0);
        try out.button(button_left_paddle1, h & h_l4 != 0);
        try out.button(button_right_paddle2, l & l_r5 != 0);
        try out.button(button_left_paddle2, l & l_l5 != 0);
        try out.button(button_right_touchpad, l & l_right_pad != 0);
        try out.button(button_left_touchpad, l & l_left_pad != 0);

        var hat: joystick.Hat = .{};
        hat.up = l & l_dpad_up != 0;
        hat.down = l & l_dpad_down != 0;
        hat.left = l & l_dpad_left != 0;
        hat.right = l & l_dpad_right != 0;
        try out.hat(hat);
        ctx.last_buttons = buttons;
    }

    // Raw triggers are scaled to the signed axis range; the sum is truncated to 16 bits.
    const raw_l = std.mem.readInt(u16, data[44..46], .little);
    const raw_r = std.mem.readInt(u16, data[46..48], .little);
    try out.axis(common.axis.left_trigger, @truncate(@as(i32, raw_l) * 2 - 32768));
    try out.axis(common.axis.right_trigger, @truncate(@as(i32, raw_r) * 2 - 32768));
    const left_x = std.mem.readInt(i16, data[48..50], .little);
    const left_y = std.mem.readInt(i16, data[50..52], .little);
    const right_x = std.mem.readInt(i16, data[52..54], .little);
    const right_y = std.mem.readInt(i16, data[54..56], .little);
    try out.axis(common.axis.left_x, left_x);
    try out.axis(common.axis.left_y, 0 -% left_y);
    try out.axis(common.axis.right_x, right_x);
    try out.axis(common.axis.right_y, 0 -% right_y);

    ctx.sensor_timestamp_ns += @as(u64, update_rate_us) * std.time.ns_per_us;
    const gyro_scale: f32 = 2000.0 * (std.math.pi / 180.0);
    const gx = std.mem.readInt(i16, data[30..32], .little);
    const gy = std.mem.readInt(i16, data[32..34], .little);
    const gz = std.mem.readInt(i16, data[34..36], .little);
    try out.sensor(.gyro, .{
        @as(f32, @floatFromInt(gx)) / 32768.0 * gyro_scale,
        @as(f32, @floatFromInt(gz)) / 32768.0 * gyro_scale,
        @as(f32, @floatFromInt(-@as(i32, gy))) / 32768.0 * gyro_scale,
    }, ctx.sensor_timestamp_ns);
    const g = common.standard_gravity;
    const ax = std.mem.readInt(i16, data[24..26], .little);
    const ay = std.mem.readInt(i16, data[26..28], .little);
    const az = std.mem.readInt(i16, data[28..30], .little);
    try out.sensor(.accel, .{
        @as(f32, @floatFromInt(ax)) / 32768.0 * 2.0 * g,
        @as(f32, @floatFromInt(az)) / 32768.0 * 2.0 * g,
        @as(f32, @floatFromInt(-@as(i32, ay))) / 32768.0 * 2.0 * g,
    }, ctx.sensor_timestamp_ns);

    const pad_lx = std.mem.readInt(i16, data[16..18], .little);
    const pad_ly = std.mem.readInt(i16, data[18..20], .little);
    const pad_rx = std.mem.readInt(i16, data[20..22], .little);
    const pad_ry = std.mem.readInt(i16, data[22..24], .little);
    const pressure_l = @as(f32, @floatFromInt(std.mem.readInt(u16, data[56..58], .little))) / 32768.0;
    const pressure_r = @as(f32, @floatFromInt(std.mem.readInt(u16, data[58..60], .little))) / 32768.0;

    const left_down = l & l_left_touch != 0;
    if (left_down or ctx.left_touch_down) {
        if (left_down) {
            ctx.left_touch_x = @as(f32, @floatFromInt(pad_lx)) / 65536.0 + 0.5;
            ctx.left_touch_y = -@as(f32, @floatFromInt(pad_ly)) / 65536.0 + 0.5;
        }
        try out.touchpad_finger(0, 0, left_down, ctx.left_touch_x, ctx.left_touch_y, pressure_l);
        ctx.left_touch_down = left_down;
    }
    const right_down = l & l_right_touch != 0;
    if (right_down or ctx.right_touch_down) {
        if (right_down) {
            ctx.right_touch_x = @as(f32, @floatFromInt(pad_rx)) / 65536.0 + 0.5;
            ctx.right_touch_y = -@as(f32, @floatFromInt(pad_ry)) / 65536.0 + 0.5;
        }
        try out.touchpad_finger(1, 0, right_down, ctx.right_touch_x, ctx.right_touch_y, pressure_r);
        ctx.right_touch_down = right_down;
    }
}

/// Reads every queued report, runs the lizard watchdog every 200 updates, and
/// reports a read failure as a disconnect. Reports other than deck state are skipped.
pub fn update(ctx: *Context, dev: *Device, out: *Output, env: device.Env) Error!Report {
    _ = env;
    var report: Report = .{};
    if (!dev.is_connected()) return report;

    if (ctx.watchdog_counter > watchdog_period) {
        ctx.watchdog_counter = 0;
        feed_watchdog(dev) catch {
            report.read_failed = true;
            return report;
        };
    } else {
        ctx.watchdog_counter += 1;
    }

    var buf: [usb_packet_length]u8 = undefined;
    while (true) {
        const data = dev.poll_report(&buf) catch {
            report.read_failed = true;
            break;
        } orelse break;
        if (data.len == usb_packet_length and std.mem.readInt(u16, data[0..2], .little) == 1 and
            data[2] == deck_message_id and data[3] == deck_payload_length)
        {
            try handle_state(ctx, out, data);
        }
    }
    return report;
}
