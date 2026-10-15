//! Xbox 360 wireless controllers through the Xbox 360 wireless receiver (HIDAPI).
//!
//! Port of SDL_hidapi_xbox360w.c for Linux. The receiver node carries status
//! packets for up to four paired controllers and forwards their state reports
//! with a 4-byte prefix. This driver claims the receiver and creates one
//! joystick when the controller on the receiver reports itself connected.
//!
//! Protocol summary (offsets are into the receiver's report):
//!   - Init: an 0x08 "presence" request (0x0f, 0xc0) asks the receiver for its
//!     controller list; replies are two bytes {0x08, flags} with bit 0x80 set
//!     when a controller is connected.
//!   - Battery: 29-byte reports with byte 3 == 0x13 (level at byte 4).
//!   - Capabilities: 29-byte reports with bytes 0..3 == {00 0f 00 f0}. The
//!     subtype is at byte 25, and a follow-up request (0x02, 0x80) is sent.
//!   - State: 29-byte reports with byte 1 bit 0 set; the 25-byte state body
//!     starts at byte 4 and uses the same layout as the wired controller.
//!   - LED: 12-byte packet {00 00 08 (0x40 + mode)} with mode 0x06 + slot.
//!   - Rumble: 12-byte packet {00 01 0f c0 00 low high ...}.
//!
//! Ownership: the context holds only connection and state bookkeeping. Writes
//! for init, LEDs and capability replies go straight to the receiver, as SDL's
//! SDL_hid_write calls do; rumble goes through the device's output queue.
//!
//! Deliberate differences from SDL:
//! - SDL checks interface_protocol == 0 to pick the receiver interface. The
//!   protocol byte is not read from sysfs, so the receiver check uses the USB
//!   interface number (interface 0), which is the controller interface.
//! - SDL's wireless connection state is a joystick connection flag (wireless).
//!   The model has no connection-state field, so it is not reported.
//! - The 0x00 0x05 0x12 capability packet (per-controller caps) is parsed only
//!   for its bytes, not stored: the joystick model has no use for them.
const std = @import("std");
const joystick = @import("../joystick.zig");
const common = @import("common.zig");
const device = @import("device.zig");
const xbox360 = @import("xbox360.zig");

const Error = device.Error;
const Device = device.Device;
const Output = common.Output;
const Report = device.Report;

const usb_packet_length = 64;
const vendor_microsoft: u16 = 0x045e;
const product_bigbutton_receiver: u16 = 0x02a0;
const product_wireless_receiver: u16 = 0x0719;
const product_wireless_receiver_third_party1: u16 = 0x02a9;
const product_wireless_receiver_third_party2: u16 = 0x0291;

/// Presence request sent once at init (SDL's init_packet).
const init_packet = [_]u8{ 0x08, 0x00, 0x0f, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
/// Reply to a capability report (SDL's capabilities_packet).
const capabilities_packet = [_]u8{ 0x00, 0x00, 0x02, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
/// Name given to the joystick (HIDAPI_SetDeviceName).
const device_name = "Xbox 360 Wireless Controller";

/// Driver state for one wireless receiver (SDL_DriverXbox360W_Context).
pub const Context = struct {
    /// Whether the receiver reports a controller on its slot.
    connected: bool = false,
    player_index: i32 = -1,
    player_lights: bool = true,
    last_state: [usb_packet_length]u8 = @splat(0),
};

/// Receiver ids that speak the wireless protocol on interface 0. The BigButton
/// receiver uses a different protocol and is excluded (SDL IsSupportedDevice).
pub fn supports(probe: device.Probe) bool {
    if (probe.vendor_id != vendor_microsoft) return false;
    if (probe.product_id == product_bigbutton_receiver) return false;
    const receiver = probe.product_id == product_wireless_receiver or
        probe.product_id == product_wireless_receiver_third_party1 or
        probe.product_id == product_wireless_receiver_third_party2;
    return receiver and (probe.interface_number orelse 0) == 0;
}

/// Init: names the device and sends the presence request. A failed write leaves
/// the node unclaimed, as SDL does.
pub fn init(ctx: *Context, dev: *Device, env: device.Env) Error!bool {
    _ = env;
    try dev.set_name(device_name);
    ctx.* = .{ .player_lights = dev.config.xbox360_player_lights };
    _ = try dev.write_report_now(&init_packet);
    dev.gamepad_type = .xbox360;
    return false;
}

/// 11 buttons, 6 axes and one hat, as the wired controller.
pub fn layout(ctx: *const Context, dev: *const Device) joystick.Layout {
    _ = ctx;
    _ = dev;
    return .{ .axes = common.axis.count, .buttons = 11, .hats = 1, .balls = 0 };
}

/// OpenJoystick: clears the state and sets the slot LED.
pub fn open(ctx: *Context, dev: *Device) Error!void {
    ctx.last_state = @splat(0);
    ctx.player_lights = dev.config.xbox360_player_lights;
    send_slot_led(ctx, dev);
}

/// Features: rumble, and a player LED when player lights are enabled.
pub fn capabilities(ctx: *const Context) device.Capabilities {
    return .{ .rumble = true, .player_led = ctx.player_lights };
}

/// Player LED: the receiver's slot packet, with mode 0x06 + slot when lit and 0
/// when off, offset by 0x40 (SetSlotLED). Write failures are ignored, as SDL does.
fn send_slot_led(ctx: *Context, dev: *Device) void {
    const mode: u8 = if (ctx.player_lights and ctx.player_index >= 0)
        0x06 + @as(u8, @intCast(@mod(ctx.player_index, 4)))
    else
        0;
    var packet = [_]u8{ 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
    packet[3] = 0x40 + (mode % 0x0e);
    _ = dev.write_report_now(&packet) catch {};
}

/// Sets the player index and refreshes the LED.
pub fn set_player_index(ctx: *Context, dev: *Device, index: i32) void {
    ctx.player_index = index;
    send_slot_led(ctx, dev);
}

/// Rumble: motor high bytes at packet offsets 5 and 6, queued like the other drivers.
pub fn rumble(ctx: *Context, dev: *Device, low: u16, high: u16) Error!void {
    _ = ctx;
    const packet = [_]u8{ 0x00, 0x01, 0x0f, 0xc0, 0x00, @truncate(low >> 8), @truncate(high >> 8), 0x00, 0x00, 0x00, 0x00, 0x00 };
    _ = try dev.send_report(&packet, .report_id);
}

/// Battery level 0..255 as a percentage, rounded (UpdatePowerLevel).
fn battery_percent(level: u8) u8 {
    const scaled = (@as(u32, level) * 100 + 127) / 255;
    return @intCast(scaled);
}

/// Stores the controller subtype in the GUID's last byte, as SDL does when it
/// learns the subtype. The joystick kind itself is not derived from it yet.
fn apply_subtype(dev: *Device, subtype: u8) void {
    dev.guid.data[15] = subtype;
}

/// Update: drains the receiver, handling connection, battery, capability and
/// state reports. Connection changes are returned as registry requests.
pub fn update(ctx: *Context, dev: *Device, out: *Output, env: device.Env) Error!Report {
    _ = env;
    var report: Report = .{};
    var buf: [usb_packet_length]u8 = undefined;
    while (true) {
        const data = dev.poll_report(&buf) catch {
            report.read_failed = true;
            break;
        } orelse break;
        if (data.len == 2 and data[0] == 0x08) {
            const connected = data[1] & 0x80 != 0;
            if (connected != ctx.connected) {
                ctx.connected = connected;
                if (connected) {
                    report.connect = true;
                } else {
                    report.disconnect = true;
                }
            }
        } else if (data.len == 29 and data[0] == 0x00 and data[1] == 0x0f and data[2] == 0x00 and data[3] == 0xf0) {
            // Initial battery level and controller subtype.
            try out.battery(.on_battery, battery_percent(data[17]));
            const subtype = data[25] & 0x7f;
            apply_subtype(dev, subtype);
            _ = dev.write_report_now(&capabilities_packet) catch {};
        } else if (data.len == 29 and data[0] == 0x00 and data[1] == 0x00 and data[2] == 0x00 and data[3] == 0x13) {
            try out.battery(.on_battery, battery_percent(data[4]));
        } else if (data.len == 29 and data[0] == 0x00 and data[1] & 0x01 == 0x01) {
            if (dev.is_connected()) try xbox360.decode_state(&ctx.last_state, out, data[4..]);
        }
    }
    return report;
}
