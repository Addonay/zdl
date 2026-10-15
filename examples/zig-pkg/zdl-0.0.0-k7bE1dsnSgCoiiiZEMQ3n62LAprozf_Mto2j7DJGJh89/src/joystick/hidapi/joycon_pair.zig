//! Combined Nintendo Joy-Con pair (left and right on one joystick).
//!
//! Port of the combined-controller mapping in SDL_hidapi_switch.c
//! (HandleCombinedSimpleControllerStateL and HandleCombinedSimpleControllerStateR)
//! and of the parent/child arrangement in SDL_hidapi_combined.c. SDL attaches
//! the two Joy-Con devices as children of one combined device. Each child decodes
//! its own simple reports into the same joystick.
//!
//! Registry integration: the registry creates a combined device for a left and a
//! right Joy-Con (SDL's HIDAPI_CreateCombinedJoyCons, with `Config.combine_joycons`).
//! The combined device is the only joystick of the pair. Its driver is the
//! `Context` below; `update` drains both children through `Pair.poll`, and the
//! children are skipped by the registry's update loop. The registry removes the
//! combined device when either child disappears.
//!
//! `Pair` stays usable on its own: a caller can create one and feed it both
//! devices (`poll`) or decoded packets (`handle_left`, `handle_right`). SDL's
//! pair-serial bookkeeping is not ported; the registry pairs by side only.
//!
//! Mapping on the combined joystick (rotated sideways pair, as SDL):
//!   - Left Joy-Con: D-pad hat from buttons[0] bits 0..3, SL and SR as left
//!     paddles 1 and 2, Back, left-stick click, Share and L on buttons[1];
//!     ZL is the left trigger axis; the stick direction drives the left stick.
//!   - Right Joy-Con: face buttons from buttons[0] bits 0..3 (east, north,
//!     south, west), SR and SL as right paddles 2 and 1, Start, right-stick click,
//!     Home on buttons[1] bit 4, and R; ZR is the right trigger axis. The stick
//!     direction drives the right stick.
//!
//! Ownership: the pair stores only the last packet of each side. Output goes
//! through the `Output` the caller passes in, and the pair does not allocate.
//!
//! Deliberate differences from SDL:
//! - The direction tables for the rotated pair are derived from one table: the
//!   right Joy-Con's code c maps to the left table's code (c + 4) mod 8, which
//!   matches SDL's two switch statements.
//! - SDL's pair serial and child-ordering bookkeeping is not ported.
const std = @import("std");
const joystick = @import("../joystick.zig");
const common = @import("common.zig");
const device = @import("device.zig");
const joycon = @import("joycon.zig");
const switch_pro = @import("switch_pro.zig");

const Error = device.Error;
const Device = device.Device;
const Output = common.Output;
const Report = device.Report;
const SimplePacket = joycon.SimplePacket;

const report_simple: u8 = 0x3f;
const report_full: u8 = 0x30;
const report_full_mcu: u8 = 0x31;

/// Driver context of a combined device: the two children and the decoder state.
/// The children are borrowed; the registry keeps them alive while the pair exists.
pub const Context = struct {
    left: ?*Device = null,
    right: ?*Device = null,
    pair: Pair = .{},
};

/// Never matched from sysfs; the registry creates the combined device itself.
pub fn supports(probe: device.Probe) bool {
    _ = probe;
    return false;
}

/// Not used: the registry attaches the combined joystick after creating it.
pub fn init(ctx: *Context, dev: *Device, env: device.Env) Error!bool {
    _ = ctx;
    _ = dev;
    _ = env;
    return false;
}

/// Features of the pair: rumble, player lights and the right Joy-Con's home
/// light, as the union of the children's features (SDL's combined capabilities).
pub fn capabilities(ctx: *const Context) device.Capabilities {
    var caps: device.Capabilities = .{};
    for ([_]?*Device{ ctx.left, ctx.right }) |maybe| {
        const child = maybe orelse continue;
        const c = child_context(child) orelse continue;
        const child_caps = joycon.capabilities(c);
        caps.rumble = caps.rumble or child_caps.rumble;
        caps.player_led = caps.player_led or child_caps.player_led;
        caps.mono_led = caps.mono_led or child_caps.mono_led;
    }
    return caps;
}

/// Rumbles both Joy-Cons with the same motor values (SDL forwards the request to
/// each child). Unsupported only when neither child accepts it.
pub fn rumble(ctx: *Context, dev: *Device, low: u16, high: u16) Error!void {
    _ = dev;
    var accepted = false;
    for ([_]?*Device{ ctx.left, ctx.right }) |maybe| {
        const child = maybe orelse continue;
        const c = child_context(child) orelse continue;
        joycon.rumble(c, child, low, high) catch continue;
        accepted = true;
    }
    if (!accepted) return error.Unsupported;
}

/// Sets the home light of the right Joy-Con (the left one has none in this model).
pub fn set_led(ctx: *Context, dev: *Device, red: u8, green: u8, blue: u8) Error!void {
    _ = dev;
    var accepted = false;
    for ([_]?*Device{ ctx.left, ctx.right }) |maybe| {
        const child = maybe orelse continue;
        const c = child_context(child) orelse continue;
        joycon.set_led(c, child, red, green, blue) catch continue;
        accepted = true;
    }
    if (!accepted) return error.Unsupported;
}

/// Enables or disables the motion sensors of both children. Unsupported when
/// neither child can change them.
pub fn set_sensors_enabled(ctx: *Context, dev: *Device, enabled: bool) Error!void {
    _ = dev;
    var accepted = false;
    for ([_]?*Device{ ctx.left, ctx.right }) |maybe| {
        const child = maybe orelse continue;
        const c = child_context(child) orelse continue;
        joycon.set_sensors_enabled(c, child, enabled) catch continue;
        accepted = true;
    }
    if (!accepted) return error.Unsupported;
}

/// The combined joystick: 16 buttons, six axes and one hat.
pub fn layout(ctx: *const Context, dev: *const Device) joystick.Layout {
    _ = ctx;
    _ = dev;
    return Pair.layout();
}

/// Decodes both children's queued reports onto the combined joystick. A read
/// failure on either child is returned as a read failure of the pair.
pub fn update(ctx: *Context, dev: *Device, out: *Output, env: device.Env) Error!Report {
    _ = dev;
    _ = env;
    const left = ctx.left orelse return .{ .read_failed = true };
    const right = ctx.right orelse return .{ .read_failed = true };
    return ctx.pair.poll(out, left, right);
}

/// A stick position as signed axis values.
const Axes = struct { x: i16, y: i16 };

/// Stick axes of the left Joy-Con in the rotated pair (SDL's combined L switch).
fn left_stick_axes(code: u8) Axes {
    const max = joystick.axis_max;
    const min = joystick.axis_min;
    return switch (code) {
        0 => .{ .x = max, .y = 0 },
        1 => .{ .x = max, .y = max },
        2 => .{ .x = 0, .y = max },
        3 => .{ .x = min, .y = max },
        4 => .{ .x = min, .y = 0 },
        5 => .{ .x = min, .y = min },
        6 => .{ .x = 0, .y = min },
        7 => .{ .x = max, .y = min },
        else => .{ .x = 0, .y = 0 },
    };
}

/// Stick axes of the right Joy-Con, from the left table rotated by four codes
/// (180 degrees), as SDL's combined R switch is.
fn right_stick_axes(code: u8) Axes {
    if (code >= 8) return .{ .x = 0, .y = 0 };
    return left_stick_axes((code + 4) % 8);
}

/// Left Joy-Con hat from buttons[0]: bit 0 left, bit 1 down, bit 2 up, bit 3 right.
fn left_hat(b: u8) joystick.Hat {
    return .{
        .left = b & 0x01 != 0,
        .down = b & 0x02 != 0,
        .up = b & 0x04 != 0,
        .right = b & 0x08 != 0,
    };
}

/// Explicit two-Joy-Con combiner. Create with `.{}`; it owns no resources.
pub const Pair = struct {
    left: SimplePacket = .{},
    right: SimplePacket = .{},

    /// Layout of the combined joystick: 16 buttons, six axes and one hat.
    pub fn layout() joystick.Layout {
        return .{ .axes = common.axis.count, .buttons = 16, .hats = 1, .balls = 0 };
    }

    /// Decodes one left Joy-Con simple report onto the combined joystick.
    pub fn handle_left(self: *Pair, out: *Output, packet: SimplePacket) Error!void {
        const last = self.left;
        if (packet.buttons[0] != last.buttons[0]) {
            const b = packet.buttons[0];
            try out.hat(left_hat(b));
            try out.button(joycon.button_switch_left_paddle1, b & 0x10 != 0);
            try out.button(joycon.button_switch_left_paddle2, b & 0x20 != 0);
        }
        if (packet.buttons[1] != last.buttons[1]) {
            const b = packet.buttons[1];
            try out.button(common.button.back, b & 0x01 != 0);
            try out.button(common.button.left_stick, b & 0x04 != 0);
            try out.button(joycon.button_switch_share, b & 0x20 != 0);
            try out.button(common.button.left_shoulder, b & 0x40 != 0);
        }
        // ZL is a trigger axis that the report encodes as a single bit.
        try out.axis(common.axis.left_trigger, if (packet.buttons[1] & 0x80 != 0) joystick.axis_max else joystick.axis_min);
        if (packet.stick != last.stick) {
            const axes = left_stick_axes(packet.stick);
            try out.axis(common.axis.left_x, axes.x);
            try out.axis(common.axis.left_y, axes.y);
        }
        self.left = packet;
    }

    /// Decodes one right Joy-Con simple report onto the combined joystick.
    pub fn handle_right(self: *Pair, out: *Output, packet: SimplePacket) Error!void {
        const last = self.right;
        if (packet.buttons[0] != last.buttons[0]) {
            const b = packet.buttons[0];
            try out.button(common.button.east, b & 0x01 != 0);
            try out.button(common.button.north, b & 0x02 != 0);
            try out.button(common.button.south, b & 0x04 != 0);
            try out.button(common.button.west, b & 0x08 != 0);
            try out.button(joycon.button_switch_right_paddle2, b & 0x10 != 0);
            try out.button(joycon.button_switch_right_paddle1, b & 0x20 != 0);
        }
        if (packet.buttons[1] != last.buttons[1]) {
            const b = packet.buttons[1];
            try out.button(common.button.start, b & 0x02 != 0);
            try out.button(common.button.right_stick, b & 0x08 != 0);
            try out.button(common.button.guide, b & 0x10 != 0);
            try out.button(common.button.right_shoulder, b & 0x40 != 0);
        }
        try out.axis(common.axis.right_trigger, if (packet.buttons[1] & 0x80 != 0) joystick.axis_max else joystick.axis_min);
        if (packet.stick != last.stick) {
            const axes = right_stick_axes(packet.stick);
            try out.axis(common.axis.right_x, axes.x);
            try out.axis(common.axis.right_y, axes.y);
        }
        self.right = packet;
    }

    /// Drains both Joy-Con devices and decodes their reports into `out`: simple
    /// reports (0x3F) through the simple handlers, full reports (0x30 and 0x31)
    /// through `handle_full_left` and `handle_full_right`. Each device must be
    /// open and claimed by the caller. A read failure on either side is returned
    /// as a read failure of the pair.
    pub fn poll(self: *Pair, out: *Output, left_dev: *Device, right_dev: *Device) Error!device.Report {
        var report: device.Report = .{};
        var buf: [64]u8 = undefined;
        inline for (.{ left_dev, right_dev }, 0..) |dev, side| {
            const child = child_context(dev);
            if (child) |ctx| ctx.pro.now_ns = out.timestamp;
            while (true) {
                const data = dev.poll_report(&buf) catch {
                    report.read_failed = true;
                    break;
                } orelse break;
                if (data[0] == report_simple and data.len >= 4) {
                    const packet = SimplePacket.parse(data[1..]);
                    if (side == 0) try self.handle_left(out, packet) else try self.handle_right(out, packet);
                } else if ((data[0] == report_full or data[0] == report_full_mcu) and child != null and data.len >= 12) {
                    var body: [48]u8 = @splat(0);
                    const n = @min(data.len - 1, body.len);
                    @memcpy(body[0..n], data[1 .. 1 + n]);
                    const power = joycon.power_from_report(&body);
                    child.?.pro.power_state = power.state;
                    child.?.pro.power_percent = power.percent;
                    if (side == 0) {
                        try handle_full_left(out, child.?, &body);
                    } else {
                        try handle_full_right(out, child.?, &body);
                        // Only the right Joy-Con's IMU is used (SDL's "use the right sensor" rule).
                        if (child.?.pro.report_sensors) try joycon.emit_motion(child.?, right_dev, out, &body, true);
                        // SDL reports the pair's battery from the right Joy-Con, with the lower of both levels.
                        try emit_battery(out, child_context(left_dev), child.?);
                    }
                }
            }
        }
        return report;
    }
};

/// The Joy-Con driver context of a child device, or null for another driver.
fn child_context(dev: *Device) ?*joycon.Context {
    const state = if (dev.driver) |*s| s else return null;
    return switch (state.*) {
        .joycon => |*ctx| ctx,
        else => null,
    };
}

/// Hat from the full-report D-pad byte: bit 0 down, bit 1 up, bit 2 right, bit 3 left.
fn full_hat(b: u8) joystick.Hat {
    var bits: u8 = 0;
    if (b & 0x01 != 0) bits |= 0x4;
    if (b & 0x02 != 0) bits |= 0x1;
    if (b & 0x04 != 0) bits |= 0x2;
    if (b & 0x08 != 0) bits |= 0x8;
    return joystick.Hat.from_bits(bits);
}

/// Left Joy-Con of a combined pair, full report (HandleCombinedControllerStateL).
/// `body` is the report without its ID, as in `joycon.handle_full`.
fn handle_full_left(out: *Output, ctx: *joycon.Context, body: *const [48]u8) Error!void {
    const b1 = body[3];
    const b2 = body[4];
    try out.button(common.button.back, b1 & 0x01 != 0);
    try out.button(common.button.left_stick, b1 & 0x08 != 0);
    try out.button(joycon.button_switch_share, b1 & 0x20 != 0);
    try out.hat(full_hat(b2));
    try out.button(joycon.button_switch_left_paddle2, b2 & 0x10 != 0);
    try out.button(joycon.button_switch_left_paddle1, b2 & 0x20 != 0);
    try out.button(common.button.left_shoulder, b2 & 0x40 != 0);
    try out.axis(common.axis.left_trigger, if (b2 & 0x80 != 0) joystick.axis_max else joystick.axis_min);

    const x = switch_pro.apply_stick_calibration(&ctx.pro, 0, 0, joycon.stick_x(body[5..8]));
    const y = switch_pro.apply_stick_calibration(&ctx.pro, 0, 1, joycon.stick_y(body[6..9]));
    try out.axis(common.axis.left_x, x);
    try out.axis(common.axis.left_y, ~y);
}

/// Right Joy-Con of a combined pair, full report (HandleCombinedControllerStateR).
fn handle_full_right(out: *Output, ctx: *joycon.Context, body: *const [48]u8) Error!void {
    const b0 = body[2];
    const b1 = body[3];
    try out.button(common.button.south, b0 & 0x04 != 0);
    try out.button(common.button.east, b0 & 0x08 != 0);
    try out.button(common.button.west, b0 & 0x01 != 0);
    try out.button(common.button.north, b0 & 0x02 != 0);
    try out.button(joycon.button_switch_right_paddle1, b0 & 0x10 != 0);
    try out.button(joycon.button_switch_right_paddle2, b0 & 0x20 != 0);
    try out.button(common.button.right_shoulder, b0 & 0x40 != 0);
    try out.axis(common.axis.right_trigger, if (b0 & 0x80 != 0) joystick.axis_max else joystick.axis_min);

    try out.button(common.button.start, b1 & 0x02 != 0);
    try out.button(common.button.right_stick, b1 & 0x04 != 0);
    try out.button(common.button.guide, b1 & 0x10 != 0);

    const x = switch_pro.apply_stick_calibration(&ctx.pro, 1, 0, joycon.stick_x(body[8..11]));
    const y = switch_pro.apply_stick_calibration(&ctx.pro, 1, 1, joycon.stick_y(body[9..12]));
    try out.axis(common.axis.right_x, x);
    try out.axis(common.axis.right_y, ~y);
}

/// Rank of a battery state in SDL's SDL_PowerState order, where the unknown state
/// sorts first, so the lower of two states is the one SDL reports.
fn power_rank(state: common.PowerState) i8 {
    return switch (state) {
        .unknown => -1,
        .on_battery => 0,
        .no_battery => 1,
        .charging => 2,
        .charged => 3,
    };
}

/// Battery of the pair: the lower state and the lower percent of the two Joy-Cons.
fn emit_battery(out: *Output, left: ?*joycon.Context, right: *joycon.Context) Error!void {
    var state = right.pro.power_state;
    var percent = right.pro.power_percent;
    if (left) |l| {
        if (power_rank(l.pro.power_state) < power_rank(state)) state = l.pro.power_state;
        percent = @min(percent, l.pro.power_percent);
    }
    try out.battery(state, percent);
}
