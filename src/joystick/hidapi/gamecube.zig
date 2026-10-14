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
//! driver hooks are `init`, `layout`, `update`, `rumble_slot`, `capabilities_slot`
//! and `close`. `Adapter` stays usable on its own for callers that do
//! not use the registry.
//!
//! PC mode (SDL's `pc_mode`): third-party DragonRise-based EVORETRO adapters
//! (vendor 0x0079, products 0x1843, 0x1844 and 0x1846) use their own packets. A
//! 9-byte packet is one controller on firmware 0x7 or newer; a 10-byte packet
//! starts with the port number (1 to 4) and follows the 9-byte layout with the
//! C stick inverted. The button bits differ from the Nintendo layout. Rumble is
//! one motor state for every port, sent as the 3-byte report {0, m, m} and
//! repeated every 16 ms while it runs. It is allowed only when the first packet
//! after open has 9 bytes, as SDL checks.
//!
//! Reachability on Linux: `hid/filter.zig` ignores the Nintendo adapter
//! (0x057e:0x0337) on hidraw, as SDL does, because SDL drives that device
//! through libusb. The Nintendo-mode code here is therefore reached only by a
//! caller that opens the node itself. PC mode (EVORETRO) is the path that
//! enumerates on Linux.
//!
//! Not ported: the libusb step that sends the enable command to the adapter.
//!
//! Deliberate differences from SDL:
//! - SDL's libusb step that sends the adapter enable command is not performed.
//!   The init byte 0x13 is the only setup written here, and SDL's 10 ms wait
//!   after it is not reproduced: the first status packets arrive in `update`.
//! - The auto-calibration keeps the running minimum and maximum per axis, as SDL
//!   does, and maps values with the same linear remap to the signed range.
//! - PC-mode ports connect when their first packet arrives. SDL connects all four
//!   joysticks at init, so a port with no controller is not listed here.
//! - PC mode has no per-port rumble state. SDL keeps one motor flag for all ports,
//!   and so does this driver; the stop report is sent from the close hook.
//! - Rumble brake (SDL_HINT_JOYSTICK_HIDAPI_GAMECUBE_RUMBLE_BRAKE) is not ported in
//!   PC mode either: the motors are on or off.
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
/// DragonRise vendor and the EVORETRO GameCube adapters that speak the PC-mode packets.
const vendor_dragonrise: u16 = 0x0079;
const product_evoretro_adapter1: u16 = 0x1843;
const product_evoretro_adapter2: u16 = 0x1844;
const product_evoretro_adapter3: u16 = 0x1846;

pub const port_count = 4;
const block_length = 9;
const input_report_id: u8 = 0x21;
const input_length = 37;
const init_byte: u8 = 0x13;
const rumble_report_id: u8 = 0x11;
const rumble_report_length = 5;
const pc_rumble_report_length = 3;
/// PC-mode rumble must be repeated while the motors run (PC_RUMBLE_REFRESH).
const pc_rumble_refresh_ns: u64 = 16_000_000;

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
    /// PC-mode adapter (third-party firmware). Set once by `init`.
    pc_mode: bool = false,
    /// PC mode: the first packet after open had 9 bytes (firmware 0x7 or newer
    /// with the second USB cable), which allows rumble.
    pc_rumble_allowed: bool = false,
    /// PC mode: one motor state shared by every port (SDL's rumbleActive).
    pc_rumble_active: bool = false,
    /// PC mode: when the rumble report was last queued, in nanoseconds. Null
    /// after a change, so the next refresh sends at once.
    pc_rumble_sent_ns: ?u64 = null,

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

    /// Decodes one PC-mode joystick packet for `slot` (HandleJoystickPacket).
    /// `data` starts at the first button byte and has nine bytes. The C stick is
    /// inverted on the older 10-byte firmware. The port is marked connected.
    pub fn parse_pc(self: *Adapter, slot: usize, data: []const u8, invert_c_stick: bool) void {
        const port = &self.ports[slot];
        port.connected = true;
        port.wireless = false;
        port.rumble_allowed = self.pc_rumble_allowed;
        port.buttons = pc_buttons(data);
        const sources = [_]struct { axis: usize, offset: usize, invert: bool }{
            .{ .axis = common.axis.left_x, .offset = 2, .invert = false },
            .{ .axis = common.axis.left_y, .offset = 3, .invert = true },
            .{ .axis = common.axis.right_x, .offset = 5, .invert = invert_c_stick },
            .{ .axis = common.axis.right_y, .offset = 4, .invert = !invert_c_stick },
            .{ .axis = common.axis.left_trigger, .offset = 6, .invert = false },
            .{ .axis = common.axis.right_trigger, .offset = 7, .invert = false },
        };
        for (sources) |source| {
            const raw = data[source.offset];
            const value: u8 = if (source.invert) 0xff - raw else raw;
            port.axes[source.axis] = self.calibrate(slot, source.axis, value);
        }
    }

    /// Sets the shared PC-mode motor state from one port's rumble request. Returns
    /// the rumble report to queue when the state changed. Without the second cable
    /// (no rumble allowed) the result is Unsupported, as SDL reports.
    pub fn set_pc_rumble(self: *Adapter, slot: usize, low: u16, high: u16) Error!?[pc_rumble_report_length]u8 {
        if (slot >= port_count) return error.InvalidArgument;
        if (!self.pc_rumble_allowed) return error.Unsupported;
        const active = low > 0 or high > 0;
        if (active == self.pc_rumble_active) return null;
        self.pc_rumble_active = active;
        self.pc_rumble_sent_ns = null;
        return pc_rumble_report(active);
    }

    /// The PC-mode rumble report to send now: the first call after a change and
    /// then once every 16 ms while the motors run. Null when no send is due.
    pub fn pc_rumble_refresh(self: *Adapter, now_ns: u64) ?[pc_rumble_report_length]u8 {
        if (!self.pc_rumble_active) return null;
        if (self.pc_rumble_sent_ns) |sent| {
            if (now_ns < sent +| pc_rumble_refresh_ns) return null;
        }
        self.pc_rumble_sent_ns = now_ns;
        return pc_rumble_report(true);
    }
};

/// The PC-mode rumble packet: report ID 0, then both motors at full or off.
fn pc_rumble_report(active: bool) [pc_rumble_report_length]u8 {
    const value: u8 = if (active) 0xff else 0;
    return .{ 0x00, value, value };
}

/// Button levels from a PC-mode packet (HandleJoystickPacket): the face buttons
/// and shoulders sit in byte 0, the D-pad and Start in byte 1.
fn pc_buttons(data: []const u8) [button_count]bool {
    var out: [button_count]bool = @splat(false);
    out[button_south] = data[0] & 0x02 != 0;
    out[button_east] = data[0] & 0x04 != 0;
    out[button_west] = data[0] & 0x01 != 0;
    out[button_north] = data[0] & 0x08 != 0;
    out[button_dpad_left] = data[1] & 0x80 != 0;
    out[button_dpad_right] = data[1] & 0x20 != 0;
    out[button_dpad_down] = data[1] & 0x40 != 0;
    out[button_dpad_up] = data[1] & 0x10 != 0;
    out[button_start] = data[1] & 0x02 != 0;
    out[button_right_shoulder] = data[0] & 0x80 != 0;
    out[button_trigger_right] = data[0] & 0x20 != 0;
    out[button_trigger_left] = data[0] & 0x10 != 0;
    return out;
}

/// Adapter-level errors (device.Error).
const Error = device.Error;

/// Driver entry: the adapter is matched by vendor and product only. The
/// Nintendo adapter and the EVORETRO adapters are the two supported vendors.
pub fn supports(probe: device.Probe) bool {
    if (probe.vendor_id == vendor_nintendo and probe.product_id == product_gamecube_adapter) return true;
    if (probe.vendor_id != vendor_dragonrise) return false;
    return probe.product_id == product_evoretro_adapter1 or
        probe.product_id == product_evoretro_adapter2 or
        probe.product_id == product_evoretro_adapter3;
}

/// Nintendo adapter: sets the four-slot count, the device name and writes the
/// init byte. Ports connect from `update` once their status bytes show a
/// controller. PC-mode adapters (any other vendor) read one packet to learn
/// whether rumble is allowed and connect their ports from `update`.
pub fn init(ctx: *Context, dev: *device.Device, env: device.Env) Error!bool {
    _ = env;
    ctx.* = .{};
    dev.slot_count = port_count;
    if (dev.info.vendor_id != vendor_nintendo) {
        ctx.pc_mode = true;
        // SDL reads one packet without waiting. Nine bytes means firmware 0x7 or newer.
        var buf: [64]u8 = undefined;
        if (dev.poll_report(&buf) catch null) |first| {
            ctx.pc_rumble_allowed = first.len == 9;
        }
        return false;
    }
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
/// detached with its inputs recentered, and the rest emit their changes. PC-mode
/// packets are handled by `handle_pc_packet`, and the rumble refresh is sent here.
pub fn update(ctx: *Context, dev: *device.Device, out: *Output, env: device.Env) device.Error!device.Report {
    _ = env;
    var report: device.Report = .{};
    var buf: [64]u8 = undefined;
    while (true) {
        const data = dev.poll_report(&buf) catch {
            report.read_failed = true;
            break;
        } orelse break;
        if (ctx.pc_mode) {
            try handle_pc_packet(ctx, dev, out, data);
            continue;
        }
        if (data.len < input_length or data[0] != input_report_id) continue;
        try handle_packet(ctx, dev, out, data);
    }
    if (ctx.pc_mode) {
        if (ctx.pc_rumble_refresh(out.timestamp)) |rumble_packet| {
            _ = dev.send_report(&rumble_packet, .report_id) catch {};
        }
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

/// Applies one PC-mode packet (HandleJoystickPacket via UpdateDevice). A 9-byte
/// packet is the single controller of firmware 0x7 and newer. A 10-byte packet
/// starts with the port number, 1 to 4, and has the C stick inverted.
fn handle_pc_packet(ctx: *Context, dev: *device.Device, out: *Output, packet: []const u8) device.Error!void {
    if (packet.len == 10) {
        // Port 0 wraps to 255 here and is rejected by the range check below.
        try handle_pc_port(ctx, dev, out, @as(usize, packet[0] -% 1), packet[1..], true);
    } else if (packet.len == 9) {
        try handle_pc_port(ctx, dev, out, 0, packet, false);
    }
}

/// Decodes one port's PC-mode state, connecting the port on its first packet.
/// Calibration is reset when the port connects, as SDL's ResetAxisRange does.
fn handle_pc_port(ctx: *Context, dev: *device.Device, out: *Output, slot: usize, data: []const u8, invert_c_stick: bool) device.Error!void {
    if (slot >= port_count) return;
    if (!dev.slot_connected(slot)) {
        ctx.reset_axes(slot);
        ctx.sent_buttons[slot] = @splat(false);
        ctx.sent_axes[slot] = @splat(0);
        try dev.attach_slot(slot, out.updates);
    }
    ctx.parse_pc(slot, data, invert_c_stick);
    var port_out = out.with_joystick(dev.joystick_slot(slot));
    try ctx.emit(slot, &port_out);
}

/// Rumbles one port. A wireless port or one without the second USB cable
/// returns Unsupported; the rumble report goes out on the next registry update.
pub fn rumble_slot(ctx: *Context, dev: *device.Device, slot: usize, low: u16, high: u16) Error!void {
    if (ctx.pc_mode) {
        const packet = (try ctx.set_pc_rumble(slot, low, high)) orelse return;
        _ = dev.send_report(&packet, .report_id) catch {};
        return;
    }
    try ctx.set_rumble(slot, low, high);
    if (ctx.take_rumble_report()) |report| {
        _ = dev.send_report(&report, .report_id) catch {};
    }
}

/// Rumble is available on a wired port whose adapter has the second cable. PC
/// mode shares one motor state, so every port reports the same allowance.
pub fn capabilities_slot(ctx: *const Context, dev: *const device.Device, slot: usize) device.Capabilities {
    _ = dev;
    if (slot >= port_count) return .{};
    if (ctx.pc_mode) return .{ .rumble = ctx.pc_rumble_allowed };
    return .{ .rumble = ctx.ports[slot].rumble_allowed };
}

/// Close hook, run when the last port leaves (SDL's CloseJoystick). PC mode
/// stops the motors. Nintendo mode writes any motor change that is still pending.
pub fn close(ctx: *Context, dev: *device.Device) void {
    if (ctx.pc_mode) {
        if (!ctx.pc_rumble_active) return;
        ctx.pc_rumble_active = false;
        ctx.pc_rumble_sent_ns = null;
        const stop = pc_rumble_report(false);
        _ = dev.write_report_now(&stop) catch {};
        return;
    }
    if (ctx.take_rumble_report()) |report| {
        _ = dev.write_report_now(&report) catch {};
    }
}

test "Nintendo adapter reports a wired port and calibrates its sticks" {
    var adapter: Adapter = .{};
    var packet: [input_length]u8 = @splat(0);
    packet[0] = input_report_id;
    packet[1] = 0x10; // port 0 wired
    packet[2] = 0x01; // A
    packet[4] = 216; // left X at the top of the resting range
    const ports = adapter.parse(&packet).?;
    try std.testing.expect(ports[0].connected);
    try std.testing.expect(!ports[0].wireless);
    try std.testing.expect(ports[0].buttons[button_south]);
    try std.testing.expectEqual(@as(i16, 32767), ports[0].axes[common.axis.left_x]);
    try std.testing.expect(!ports[1].connected);
}

test "Nintendo adapter ignores short or foreign reports" {
    var adapter: Adapter = .{};
    var packet: [input_length]u8 = @splat(0);
    packet[0] = 0x20;
    try std.testing.expect(adapter.parse(&packet) == null);
    packet[0] = input_report_id;
    try std.testing.expect(adapter.parse(packet[0 .. input_length - 1]) == null);
}

test "Nintendo rumble reports one motor byte per port" {
    var adapter: Adapter = .{};
    adapter.ports[2].rumble_allowed = true;
    try adapter.set_rumble(2, 1000, 0);
    const report = adapter.take_rumble_report().?;
    try std.testing.expectEqualSlices(u8, &.{ 0x11, 0, 0, 1, 0 }, &report);
    try std.testing.expect(adapter.take_rumble_report() == null);
    adapter.ports[3].wireless = true;
    adapter.ports[3].rumble_allowed = true;
    try std.testing.expectError(error.Unsupported, adapter.set_rumble(3, 1000, 0));
}

test "PC-mode packets map buttons and calibrate the sticks" {
    var adapter: Adapter = .{ .pc_mode = true };
    // A, right shoulder and the D-pad up; then Start in the second byte.
    const data = [_]u8{ 0x02 | 0x80, 0x10 | 0x02, 0, 128, 128, 128, 0, 0, 0 };
    adapter.parse_pc(0, &data, false);
    const port = adapter.ports[0];
    try std.testing.expect(port.connected);
    try std.testing.expect(port.buttons[button_south]);
    try std.testing.expect(port.buttons[button_right_shoulder]);
    try std.testing.expect(port.buttons[button_dpad_up]);
    try std.testing.expect(port.buttons[button_start]);
    try std.testing.expect(!port.buttons[button_east]);
    try std.testing.expect(!port.buttons[button_trigger_left]);
    // Raw 0 on a stick widens the range to the bottom, so it maps to the minimum.
    try std.testing.expectEqual(@as(i16, -32768), port.axes[common.axis.left_x]);
}

test "PC-mode C stick is inverted only on the 10-byte firmware" {
    // Raw 0 on the right stick X: inverted reads 255, the top of the range.
    const data = [_]u8{ 0, 0, 128, 128, 128, 0, 0, 0, 0 };
    var inverted: Adapter = .{ .pc_mode = true };
    inverted.parse_pc(0, &data, true);
    try std.testing.expectEqual(@as(i16, 32767), inverted.ports[0].axes[common.axis.right_x]);
    var plain: Adapter = .{ .pc_mode = true };
    plain.parse_pc(0, &data, false);
    try std.testing.expectEqual(@as(i16, -32768), plain.ports[0].axes[common.axis.right_x]);
}

test "PC-mode rumble sends on change and refreshes every 16 ms" {
    var adapter: Adapter = .{ .pc_mode = true, .pc_rumble_allowed = true };
    const on = (try adapter.set_pc_rumble(0, 1000, 0)).?;
    try std.testing.expectEqualSlices(u8, &.{ 0, 0xff, 0xff }, &on);
    // Same state again: nothing to send.
    try std.testing.expect((try adapter.set_pc_rumble(1, 5, 0)) == null);
    try std.testing.expect(adapter.pc_rumble_refresh(1_000_000_000) != null);
    try std.testing.expect(adapter.pc_rumble_refresh(1_015_000_000) == null);
    try std.testing.expect(adapter.pc_rumble_refresh(1_016_000_000) != null);
    const off = (try adapter.set_pc_rumble(0, 0, 0)).?;
    try std.testing.expectEqualSlices(u8, &.{ 0, 0, 0 }, &off);
    try std.testing.expect(adapter.pc_rumble_refresh(2_000_000_000) == null);
}

test "PC-mode rumble needs the 9-byte firmware" {
    var adapter: Adapter = .{ .pc_mode = true };
    try std.testing.expectError(error.Unsupported, adapter.set_pc_rumble(0, 1000, 0));
}
