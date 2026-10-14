//! Nintendo GameCube controller adapter (WUP-028) with four ports (HIDAPI).
//!
//! Port of the native-adapter path of SDL_hidapi_gamecube.c: the initialization
//! byte, the 37-byte input report 0x21 with four 9-byte port blocks, per-port
//! axis calibration that widens from the observed range, and the rumble report
//! 0x11 with one motor byte per port.
//!
//! Port block layout (offsets within a 9-byte block that starts at report
//! byte 1 + 9 * port):
//!   0: status (0x10 wired, 0x20 wireless, 0x04 second USB cable for rumble)
//!   1: buttons A 0x01, B 0x02, X 0x04, Y 0x08, D-left 0x10, D-right 0x20,
//!      D-down 0x40, D-up 0x80
//!   2: START 0x01, R 0x02, Z (right trigger click) 0x04, L (left trigger click) 0x08
//!   3..8: left X, left Y, C-stick X, C-stick Y, left trigger, right trigger
//!
//! Registry integration: the adapter is a driver for the Nintendo product
//! 0x0337 and hosts four joysticks on one device (one slot per port,
//! `Device.slot_count` is 4). Ports connect and disconnect as their status byte
//! changes, as SDL's HIDAPI_JoystickConnected/Disconnected calls do. The
//! driver hooks are `init`, `layout`, `update`, `rumble_slot` and
//! `capabilities_slot`. `Adapter` stays usable on its own for callers that do
//! not use the registry.
//!
//! Not ported: the third-party PC-mode packet formats (DragonRise and EVORETRO
//! adapters, and the 10-byte older firmware), and the libusb step that sends the
//! enable command to the adapter.
//!
//! Deliberate differences from SDL:
//! - SDL's libusb step that sends the adapter enable command is not performed.
//!   The init byte 0x13 is the only setup written here, and SDL's 10 ms wait
//!   after it is not reproduced: the first status packets arrive in `update`.
//! - Rumble brake (SDL_HINT_JOYSTICK_HIDAPI_GAMECUBE_RUMBLE_BRAKE) is not
//!   ported; motors are on or off.
//! - The auto-calibration keeps the running minimum and maximum per axis, as SDL
//!   does, and maps values with the same linear remap to the signed range.
const std = @import("std");
const joystick = @import("../joystick.zig");
const common = @import("common.zig");
const device = @import("device.zig");

const Output = common.Output;

/// Device-level context used by the driver registry.
pub const Context = Adapter;

/// Nintendo vendor and the Wii U GameCube Controller Adapter (WUP-028).
const vendor_nintendo: u16 = 0x057e;
const product_gamecube_adapter: u16 = 0x0337;

pub const port_count = 4;
const block_length = 9;
const input_report_id: u8 = 0x21;
const input_length = 37;
const init_byte: u8 = 0x13;
const rumble_report_id: u8 = 0x11;
const rumble_report_length = 5;

/// Calibration limits at reset: the stick resting range is 128 plus or minus 88,
/// and the triggers rest higher, at 40 (ResetAxisRange).
const axis_rest_min: u8 = 128 - 88;
const axis_rest_max: u8 = 128 + 88;
const trigger_rest_min: u8 = 40;

/// Button numbers on the joystick model for each port, as SDL assigns them.
const button_south: usize = 0;
const button_east: usize = 1;
const button_west: usize = 2;
const button_north: usize = 3;
const button_dpad_left: usize = 4;
const button_dpad_right: usize = 5;
const button_dpad_down: usize = 6;
const button_dpad_up: usize = 7;
const button_start: usize = 8;
const button_right_shoulder: usize = 9;
const button_trigger_right: usize = 10;
const button_trigger_left: usize = 11;
pub const button_count: usize = 12;

/// Decoded state of one port for one report.
pub const Port = struct {
    /// True when the port reports a controller (status bit 0x10 or 0x20).
    connected: bool = false,
    /// Wireless (WaveBird) controllers have status 0x20 and cannot rumble.
    wireless: bool = false,
    /// Rumble is allowed when the adapter's second USB cable is connected.
    rumble_allowed: bool = false,
    /// Button levels, indexed by the button constants above.
    buttons: [button_count]bool = @splat(false),
    /// Axes in joystick order: left X, left Y, right X, right Y, left trigger, right trigger.
    axes: [common.axis.count]i16 = @splat(0),
};

/// Adapter state: calibration per port, the last decoded state, and the
/// pending rumble report. Owns no resources. Call `reset_axes` for a port when
/// its controller connects, as SDL does.
pub const Adapter = struct {
    ports: [port_count]Port = @splat(.{}),
    min_axis: [port_count][common.axis.count]u8 = @splat(@splat(axis_rest_min)),
    max_axis: [port_count][common.axis.count]u8 = @splat(@splat(axis_rest_max)),
    /// Last rumble motor bytes per port: 0 off, 1 on (the value SDL sends).
    rumble: [port_count]u8 = @splat(0),
    rumble_changed: bool = false,
    /// Last buttons and axes sent to the joystick of each port, for emit().
    sent_buttons: [port_count][button_count]bool = @splat(@splat(false)),
    sent_axes: [port_count][common.axis.count]i16 = @splat(@splat(0)),

    /// Resets the calibration of one port (ResetAxisRange).
    pub fn reset_axes(self: *Adapter, index: usize) void {
        self.min_axis[index] = @splat(axis_rest_min);
        self.max_axis[index] = @splat(axis_rest_max);
        self.min_axis[index][common.axis.left_trigger] = trigger_rest_min;
        self.min_axis[index][common.axis.right_trigger] = trigger_rest_min;
    }

    /// The byte written once after the adapter is found (InitDevice's 0x13).
    pub fn init_packet() [1]u8 {
        return .{init_byte};
    }

    /// Decodes an input report. Reports other than 0x21, or shorter than 37 bytes,
    /// return null. For each port, the status byte decides whether the port is
    /// connected, and calibration widens with every sample.
    pub fn parse(self: *Adapter, packet: []const u8) ?[port_count]Port {
        if (packet.len < input_length or packet[0] != input_report_id) return null;
        for (0..port_count) |index| {
            const block = packet[1 + index * block_length ..][0..block_length];
            const status = block[0];
            const port = &self.ports[index];
            port.connected = status & 0x30 != 0;
            port.wireless = status & 0x20 != 0;
            port.rumble_allowed = status & 0x04 != 0 and !port.wireless;
            if (!port.connected) {
                port.buttons = @splat(false);
                port.axes = @splat(0);
                continue;
            }
            port.buttons = buttons_from_block(block);
            for ([_]usize{ common.axis.left_x, common.axis.left_y, common.axis.right_x, common.axis.right_y, common.axis.left_trigger, common.axis.right_trigger }, 0..) |axis, source| {
                const raw = block[3 + source];
                port.axes[axis] = self.calibrate(index, axis, raw);
            }
        }
        return self.ports;
    }

    /// Widens the port's calibration with `raw` and maps it to the signed range
    /// (the READ_AXIS macro in HandleNintendoPacket).
    fn calibrate(self: *Adapter, index: usize, axis: usize, raw: u8) i16 {
        if (raw < self.min_axis[index][axis]) self.min_axis[index][axis] = raw;
        if (raw > self.max_axis[index][axis]) self.max_axis[index][axis] = raw;
        const lo: f32 = @floatFromInt(self.min_axis[index][axis]);
        const hi: f32 = @floatFromInt(self.max_axis[index][axis]);
        const v: f32 = @floatFromInt(raw);
        // Equal bounds only happen before any spread is seen; the centre value is the safe answer.
        if (hi == lo) return 0;
        const scaled = (v - lo) * 65535.0 / (hi - lo) - 32768.0;
        return @intFromFloat(std.math.clamp(scaled, -32768.0, 32767.0));
    }

    /// Button levels from the 9-byte port block, in the button order above.
    fn buttons_from_block(block: []const u8) [button_count]bool {
        var out: [button_count]bool = @splat(false);
        out[button_south] = block[1] & 0x01 != 0;
        out[button_east] = block[1] & 0x02 != 0;
        out[button_west] = block[1] & 0x04 != 0;
        out[button_north] = block[1] & 0x08 != 0;
        out[button_dpad_left] = block[1] & 0x10 != 0;
        out[button_dpad_right] = block[1] & 0x20 != 0;
        out[button_dpad_down] = block[1] & 0x40 != 0;
        out[button_dpad_up] = block[1] & 0x80 != 0;
        out[button_start] = block[2] & 0x01 != 0;
        out[button_right_shoulder] = block[2] & 0x02 != 0;
        out[button_trigger_right] = block[2] & 0x04 != 0;
        out[button_trigger_left] = block[2] & 0x08 != 0;
        return out;
    }

    /// Sends the changed buttons and axes of port `index` to `out`, the joystick
    /// the caller opened for that port. A port that is disconnected sends nothing.
    pub fn emit(self: *Adapter, index: usize, out: *Output) Error!void {
        const port = self.ports[index];
        if (!port.connected) return;
        for (port.buttons, 0..) |down, button| {
            if (self.sent_buttons[index][button] == down) continue;
            self.sent_buttons[index][button] = down;
            try out.button(button, down);
        }
        for (port.axes, 0..) |value, axis| {
            if (self.sent_axes[index][axis] == value) continue;
            self.sent_axes[index][axis] = value;
            try out.axis(axis, value);
        }
    }

    /// Sets the rumble of one port. The motor is on when either magnitude is nonzero.
    /// A wireless port or one without the second cable cannot rumble.
    pub fn set_rumble(self: *Adapter, index: usize, low: u16, high: u16) Error!void {
        if (index >= port_count) return error.InvalidArgument;
        const port = self.ports[index];
        if (port.wireless) return error.Unsupported;
        if (!port.rumble_allowed) return error.Unsupported;
        const value: u8 = if (low > 0 or high > 0) 1 else 0;
        if (self.rumble[index] != value) {
            self.rumble[index] = value;
            self.rumble_changed = true;
        }
    }

    /// The rumble report for the current motor bytes (0x11 then one byte per
    /// port), or null when nothing changed since the last call.
    pub fn take_rumble_report(self: *Adapter) ?[rumble_report_length]u8 {
        if (!self.rumble_changed) return null;
        self.rumble_changed = false;
        return .{ rumble_report_id, self.rumble[0], self.rumble[1], self.rumble[2], self.rumble[3] };
    }
};

/// Adapter-level errors (device.Error).
const Error = device.Error;

/// Driver entry: the adapter is matched by vendor and product only.
pub fn supports(probe: device.Probe) bool {
    return probe.vendor_id == vendor_nintendo and probe.product_id == product_gamecube_adapter;
}

/// Sets the four-slot count, the device name and writes the init byte. Ports
/// connect from `update` once their status bytes show a controller.
pub fn init(ctx: *Context, dev: *device.Device, env: device.Env) Error!bool {
    _ = env;
    ctx.* = .{};
    dev.slot_count = port_count;
    try dev.set_name("Nintendo GameCube Controller");
    // A failed write leaves the adapter silent; the next read reports the node gone.
    _ = dev.write_report_now(&Adapter.init_packet()) catch return false;
    return false;
}

/// Each port has 12 buttons and six axes (SDL's OpenJoystick values).
pub fn layout(ctx: *const Context, dev: *const device.Device) joystick.Layout {
    _ = ctx;
    _ = dev;
    return .{ .axes = common.axis.count, .buttons = button_count };
}

/// Drains the input queue. Each 0x21 packet updates every port: a port that
/// newly reports a controller is reset and attached, a port that goes quiet is
/// detached with its inputs recentered, and the rest emit their changes.
pub fn update(ctx: *Context, dev: *device.Device, out: *Output, env: device.Env) device.Error!device.Report {
    _ = env;
    var report: device.Report = .{};
    var buf: [64]u8 = undefined;
    while (true) {
        const data = dev.poll_report(&buf) catch {
            report.read_failed = true;
            break;
        } orelse break;
        if (data.len < input_length or data[0] != input_report_id) continue;
        try handle_packet(ctx, dev, out, data);
    }
    return report;
}

/// Applies one 0x21 packet to every port (HandleNintendoPacket).
fn handle_packet(ctx: *Context, dev: *device.Device, out: *Output, packet: []const u8) device.Error!void {
    // SDL resets the calibration before it reads the samples of a port that
    // connects in this packet, so the reset comes first.
    for (0..port_count) |index| {
        const status = packet[1 + index * block_length];
        if (status & 0x30 != 0 and !dev.slot_connected(index)) ctx.reset_axes(index);
    }
    const ports = ctx.parse(packet) orelse return;
    for (ports, 0..) |port, index| {
        if (port.connected) {
            if (!dev.slot_connected(index)) {
                ctx.sent_buttons[index] = @splat(false);
                ctx.sent_axes[index] = @splat(0);
                try dev.attach_slot(index, out.updates);
            }
            var port_out = out.with_joystick(dev.joystick_slot(index));
            try ctx.emit(index, &port_out);
        } else if (dev.slot_connected(index)) {
            try dev.detach_slot(index, out.updates, out.timestamp);
        }
    }
}

/// Rumbles one port. A wireless port or one without the second USB cable
/// returns Unsupported; the rumble report goes out on the next registry update.
pub fn rumble_slot(ctx: *Context, dev: *device.Device, slot: usize, low: u16, high: u16) Error!void {
    try ctx.set_rumble(slot, low, high);
    if (ctx.take_rumble_report()) |report| {
        _ = dev.send_report(&report, .report_id) catch {};
    }
}

/// Rumble is available on a wired port whose adapter has the second cable.
pub fn capabilities_slot(ctx: *const Context, dev: *const device.Device, slot: usize) device.Capabilities {
    _ = dev;
    if (slot >= port_count) return .{};
    return .{ .rumble = ctx.ports[slot].rumble_allowed };
}
