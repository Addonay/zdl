//! Xbox One and Xbox Series controllers over Bluetooth (HIDAPI).
//!
//! Port of the Bluetooth path of SDL_hidapi_xboxone.c. Bluetooth controllers do
//! not speak GIP: they send their own reports, selected by the first byte.
//!   0x01  input state (16 bytes on the original Xbox One S, 17 or more later)
//!   0x02  Guide button, in a separate report on some firmware
//!   0x04  battery state (flags in byte 1)
//! Output is a 9-byte rumble report {0x03, 0x0f, left trigger, right trigger,
//! low, high, 0xff, 0x00, 0xeb}. There is no init handshake; the controller is
//! connected as soon as the driver claims the node.
//!
//! The USB (GIP) driver in xboxone.zig is separate and does not claim these
//! devices; this driver claims only Bluetooth Xbox One controllers.
//!
//! Ownership: the context holds the last raw state and the rumble motor state.
//! Rumble packets are queued on the device and written by the registry update.
//!
//! Deliberate differences from SDL:
//! - SDL's Linux report-descriptor path (SDL_ParseReportDescriptor) is not used.
//!   Bluetooth controllers that expose a descriptor are decoded from the fixed
//!   byte layout, as SDL does when no descriptor is present.
//! - Bluetooth LED control is not ported (SDL's GIP LED packet is not sent over
//!   Bluetooth in this path either).
//! - Paddles follow SDL's numbering: they start at the Share button index (11)
//!   even when the controller also has a Share button. SDL does this too; the
//!   overlap is an upstream quirk kept for compatibility.
//! - Triggers are truncated to 16 bits after the 64x scale, as SDL's
//!   Sint16 conversion does, instead of being clamped.
const std = @import("std");
const joystick = @import("../joystick.zig");
const common = @import("common.zig");
const device = @import("device.zig");
const xboxone = @import("xboxone.zig");

const Error = device.Error;
const Device = device.Device;
const Output = common.Output;
const Report = device.Report;

const usb_packet_length = 64;
const vendor_microsoft: u16 = 0x045e;
const vendor_razer: u16 = 0x1532;
const product_razer_atrox: u16 = 0x0a00;

const report_state: u8 = 0x01;
const report_guide: u8 = 0x02;
const report_battery: u8 = 0x04;

/// Xbox One share button index (SDL_GAMEPAD_BUTTON_XBOX_SHARE_BUTTON).
const share_button: usize = 11;

/// Time the motors stay busy after a rumble packet (50 ms on Bluetooth).
const rumble_busy_ns: u64 = 50 * std.time.ns_per_ms;

const RumbleState = enum { idle, queued, busy };

/// Driver state for one Bluetooth Xbox controller (SDL_DriverXboxOne_Context).
pub const Context = struct {
    vendor_id: u16 = 0,
    product_id: u16 = 0,
    has_share_button: bool = false,
    has_paddles: bool = false,
    has_trigger_rumble: bool = false,
    /// Set once a Guide report arrives; the state report then leaves Guide alone.
    has_guide_packet: bool = false,
    last_paddle_state: u8 = 0,
    /// Raw copy of the last state report (mapped paddles are zeroed first).
    last_state: [usb_packet_length]u8 = @splat(0),
    low_frequency_rumble: u8 = 0,
    high_frequency_rumble: u8 = 0,
    left_trigger_rumble: u8 = 0,
    right_trigger_rumble: u8 = 0,
    rumble_state: RumbleState = .idle,
    rumble_time_ns: u64 = 0,
    rumble_pending: bool = false,
    /// Timestamp of the current update pass.
    now_ns: u64 = 0,
};

/// Bluetooth Xbox One controllers only. The USB driver handles the wired ones.
pub fn supports(probe: device.Probe) bool {
    return probe.bluetooth and probe.gamepad_type == .xbox_one;
}

/// Init: no handshake is needed, so the joystick connects immediately.
pub fn init(ctx: *Context, dev: *Device, env: device.Env) Error!bool {
    _ = env;
    const vendor = dev.info.vendor_id;
    const product = dev.info.product_id;
    ctx.* = .{
        .vendor_id = vendor,
        .product_id = product,
        .has_share_button = has_share_button(vendor, product),
        .has_paddles = joystick.guess_controller_type(vendor, product) == .xbox_elite_controller,
        .has_trigger_rumble = vendor == vendor_microsoft,
    };
    dev.gamepad_type = .xbox_one;
    return true;
}

/// Share button and paddle count as in OpenJoystick: 11 buttons plus the
/// optional Share button and four paddles.
pub fn layout(ctx: *const Context, dev: *const Device) joystick.Layout {
    _ = dev;
    var buttons: usize = 11;
    if (ctx.has_share_button) buttons += 1;
    if (ctx.has_paddles) buttons += 4;
    return .{ .axes = common.axis.count, .buttons = buttons, .hats = 1, .balls = 0 };
}

/// Whether the device predates the Share button (the shared USB table).
fn has_share_button(vendor: u16, product: u16) bool {
    for (xboxone.old_xboxone_controllers) |entry| {
        if (entry[0] == vendor and entry[1] == product) return false;
    }
    return true;
}

/// OpenJoystick: clears rumble and the last state.
pub fn open(ctx: *Context, dev: *Device) Error!void {
    _ = dev;
    ctx.low_frequency_rumble = 0;
    ctx.high_frequency_rumble = 0;
    ctx.left_trigger_rumble = 0;
    ctx.right_trigger_rumble = 0;
    ctx.rumble_state = .idle;
    ctx.rumble_time_ns = 0;
    ctx.rumble_pending = false;
    ctx.last_state = @splat(0);
    ctx.last_paddle_state = 0;
}

/// Features: rumble, and trigger rumble on Microsoft controllers.
pub fn capabilities(ctx: *const Context) device.Capabilities {
    return .{ .rumble = true, .trigger_rumble = ctx.has_trigger_rumble };
}

/// Rumble magnitudes are scaled from 16 bits to the 0..100 range the controller uses.
pub fn rumble(ctx: *Context, dev: *Device, low: u16, high: u16) Error!void {
    ctx.low_frequency_rumble = @truncate(low / 655);
    ctx.high_frequency_rumble = @truncate(high / 655);
    ctx.rumble_pending = true;
    try update_rumble(ctx, dev);
}

/// Trigger rumble, for controllers that have trigger motors.
pub fn rumble_triggers(ctx: *Context, dev: *Device, left: u16, right: u16) Error!void {
    if (!ctx.has_trigger_rumble) return error.Unsupported;
    ctx.left_trigger_rumble = @truncate(left / 655);
    ctx.right_trigger_rumble = @truncate(right / 655);
    ctx.rumble_pending = true;
    try update_rumble(ctx, dev);
}

/// Rumble state machine (UpdateRumble): a pending request is queued once the
/// previous one has had 50 ms to settle, and the motors then stay busy for the
/// same window.
fn update_rumble(ctx: *Context, dev: *Device) Error!void {
    if (ctx.rumble_state == .busy and ctx.now_ns >= ctx.rumble_time_ns + rumble_busy_ns) {
        ctx.rumble_state = .idle;
    }
    if (!ctx.rumble_pending or ctx.rumble_state != .idle) return;
    // The request is consumed even if the queue rejects it, as SDL does.
    ctx.rumble_pending = false;
    const packet = [_]u8{
        0x03, 0x0f, ctx.left_trigger_rumble, ctx.right_trigger_rumble, ctx.low_frequency_rumble, ctx.high_frequency_rumble, 0xff, 0x00, 0xeb,
    };
    _ = try dev.send_report(&packet, .report_id);
    ctx.rumble_state = .busy;
    ctx.rumble_time_ns = ctx.now_ns;
}

/// Guide report (0x02): the Guide button in bit 0 of byte 1.
fn handle_guide(ctx: *Context, out: *Output, data: []const u8) Error!void {
    ctx.has_guide_packet = true;
    try out.button(common.button.guide, data[1] & 0x01 != 0);
}

/// Battery report (0x04). Flags in byte 1: bits 0..1 are the level (10, 40, 70
/// or 100 percent), bits 2..3 the connection (zero means USB, which reads as
/// charging).
fn handle_battery(out: *Output, flags: u8) Error!void {
    const on_usb = ((flags & 0x0c) >> 2) == 0;
    const percent: u8 = switch (flags & 0x03) {
        0 => 10,
        1 => 40,
        2 => 70,
        else => 100,
    };
    const state: common.PowerState = if (on_usb) .charging else .on_battery;
    try out.battery(state, percent);
}

/// Maps the eight-way hat code (1 up, clockwise to 8 up-left) to joystick.Hat.
fn hat_from_code(code: u8) joystick.Hat {
    return switch (code) {
        1 => .{ .up = true },
        2 => .{ .up = true, .right = true },
        3 => .{ .right = true },
        4 => .{ .right = true, .down = true },
        5 => .{ .down = true },
        6 => .{ .down = true, .left = true },
        7 => .{ .left = true },
        8 => .{ .left = true, .up = true },
        else => joystick.Hat.centered,
    };
}

/// Buttons from bytes 14 and 15 for 16-byte reports (original Xbox One S).
fn handle_buttons16(ctx: *Context, out: *Output, data: []u8) Error!void {
    if (ctx.last_state[14] != data[14]) {
        const b = data[14];
        try out.button(common.button.south, b & 0x01 != 0);
        try out.button(common.button.east, b & 0x02 != 0);
        try out.button(common.button.west, b & 0x04 != 0);
        try out.button(common.button.north, b & 0x08 != 0);
        try out.button(common.button.left_shoulder, b & 0x10 != 0);
        try out.button(common.button.right_shoulder, b & 0x20 != 0);
        try out.button(common.button.back, b & 0x40 != 0);
        try out.button(common.button.start, b & 0x80 != 0);
    }
    if (ctx.last_state[15] != data[15]) {
        const b = data[15];
        try out.button(common.button.left_stick, b & 0x01 != 0);
        try out.button(common.button.right_stick, b & 0x02 != 0);
    }
}

/// Buttons for the 17-byte-and-larger reports, with the Guide and Back placement
/// that changed across firmware (see SDL's comment table). Paddle bytes are
/// zeroed in `data` when mapped, so they are not reported twice; the zeroed
/// copy is what the last-state comparison stores.
fn handle_buttons(ctx: *Context, out: *Output, data: []u8, size: usize) Error!void {
    if (ctx.last_state[14] != data[14]) {
        const b = data[14];
        try out.button(common.button.south, b & 0x01 != 0);
        try out.button(common.button.east, b & 0x02 != 0);
        try out.button(common.button.west, b & 0x08 != 0);
        try out.button(common.button.north, b & 0x10 != 0);
        try out.button(common.button.left_shoulder, b & 0x40 != 0);
        try out.button(common.button.right_shoulder, b & 0x80 != 0);
    }
    if (ctx.last_state[15] != data[15]) {
        const b = data[15];
        if (!ctx.has_guide_packet) try out.button(common.button.guide, b & 0x10 != 0);
        try out.button(common.button.start, b & 0x08 != 0);
        try out.button(common.button.left_stick, b & 0x20 != 0);
        try out.button(common.button.right_stick, b & 0x40 != 0);
    }
    if (ctx.has_share_button) {
        try out.button(common.button.back, data[15] & 0x04 != 0);
        try out.button(share_button, data[16] & 0x01 != 0);
    } else {
        try out.button(common.button.back, (data[15] & 0x04 != 0) or (data[16] & 0x01 != 0));
    }

    // Paddle bits: P3 0x04 (A), P1 0x01 (B), P4 0x08 (X), P2 0x02 (Y).
    if (ctx.has_paddles and (size == 20 or size == 39 or size == 55)) {
        const paddle_index: usize = if (size == 55) 33 else if (size == 39) 17 else 19;
        const mapped = if (size == 55) data[35] != 0 else if (size == 39) data[19] != 0 else data[17] != 0;
        // Mapped paddles are used for other controls, so the app does not see them.
        if (mapped) data[paddle_index] = 0;
        if (ctx.last_paddle_state != data[paddle_index]) {
            var index: usize = share_button;
            for ([_]u8{ 0x01, 0x02, 0x04, 0x08 }) |bit| {
                try out.button(index, data[paddle_index] & bit != 0);
                index += 1;
            }
            ctx.last_paddle_state = data[paddle_index];
        }
    }
}

/// State report (0x01): buttons, hat, triggers, sticks. Sticks use the
/// unsigned-centered encoding of the Bluetooth report, so the offset 0x8000
/// maps the rest position to zero.
fn handle_state(ctx: *Context, out: *Output, data: []u8) Error!void {
    const size = data.len;
    if (size == 16) {
        try handle_buttons16(ctx, out, data);
    } else {
        try handle_buttons(ctx, out, data, size);
    }

    if (ctx.last_state[13] != data[13]) {
        try out.hat(hat_from_code(data[13]));
    }

    // Triggers are 16-bit samples scaled by 64 and offset by 32768. The top
    // value is clamped to full, then the result is truncated to 16 bits.
    var left: i32 = @as(i32, common.read_u16(data, 9)) * 64 - 32768;
    if (left == 32704) left = 32767;
    try out.axis(common.axis.left_trigger, @truncate(left));
    var right: i32 = @as(i32, common.read_u16(data, 11)) * 64 - 32768;
    if (right == 32704) right = 32767;
    try out.axis(common.axis.right_trigger, @truncate(right));

    try out.axis(common.axis.left_x, centered(data, 1));
    try out.axis(common.axis.left_y, centered(data, 3));
    try out.axis(common.axis.right_x, centered(data, 5));
    try out.axis(common.axis.right_y, centered(data, 7));

    const n = @min(size, usb_packet_length);
    @memcpy(ctx.last_state[0..n], data[0..n]);
}

/// Unsigned 16-bit stick sample at `offset` shifted to the signed range
/// (SDL's `(Uint16)LOAD16(...) - 0x8000`, computed without overflow).
fn centered(data: []const u8, offset: usize) i16 {
    return @bitCast(common.read_u16(data, offset) ^ 0x8000);
}

/// Drains every queued report and runs the rumble state machine. A read
/// failure is a disconnect. Input before the joystick exists is dropped.
pub fn update(ctx: *Context, dev: *Device, out: *Output, env: device.Env) Error!Report {
    _ = env;
    var report: Report = .{};
    if (!dev.is_connected()) return report;
    ctx.now_ns = out.timestamp;

    var buf: [usb_packet_length]u8 = undefined;
    while (true) {
        const data = dev.poll_report(&buf) catch {
            report.read_failed = true;
            break;
        } orelse break;
        switch (data[0]) {
            report_state => {
                // A report shorter than 16 bytes is an unknown format, and is skipped.
                if (data.len >= 16) try handle_state(ctx, out, data);
            },
            report_guide => {
                if (data.len >= 2) try handle_guide(ctx, out, data);
            },
            report_battery => {
                if (data.len >= 2) try handle_battery(out, data[1]);
            },
            else => {},
        }
    }
    try update_rumble(ctx, dev);
    return report;
}
