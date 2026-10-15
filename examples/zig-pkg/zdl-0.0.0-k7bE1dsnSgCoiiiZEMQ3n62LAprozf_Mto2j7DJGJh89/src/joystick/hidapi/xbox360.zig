//! Xbox 360 controllers over USB (HIDAPI), the wired XInput-style protocol.
//!
//! Port of SDL_hidapi_xbox360.c for Linux. The controller sends a 20-byte state
//! report with ID 0x00 at 1 kHz (buttons, hat, triggers, two sticks). Output is
//! a small rumble packet and a player-slot LED packet. There is no handshake,
//! so the joystick connects as soon as the driver claims the node.
//!
//! State report layout (XINPUT_GAMEPAD over the wire, little-endian):
//!   byte 2: D-pad bits (0x01 up, 0x02 down, 0x04 left, 0x08 right), Start 0x10,
//!           Back 0x20, left stick click 0x40, right stick click 0x80.
//!   byte 3: left shoulder 0x01, right shoulder 0x02, Guide 0x04, A 0x10, B 0x20,
//!           X 0x40, Y 0x80.
//!   bytes 4, 5: left and right trigger, 8 bits each.
//!   bytes 6..14: left X, left Y, right X, right Y as i16.
//! Stick Y values are inverted relative to SDL's convention.
//!
//! Ownership: the context holds only the last raw state and the player index.
//! Output packets go through the device's rumble queue, not written directly.
//!
//! Deliberate differences from SDL:
//! - SDL reads the controller subtype and capabilities over libusb control
//!   transfers (FetchXInputCapabilities). That path needs libusb and is not
//!   ported, so the joystick type stays `gamepad` and the GUID keeps SDL's
//!   default subtype byte.
//! - SDL's macOS-only 360Controller and MFi branches are not compiled for Linux.
//! - The chatpad and other non-controller interfaces are filtered by the USB
//!   interface number from sysfs, as SDL does with `interface_number`.
const std = @import("std");
const joystick = @import("../joystick.zig");
const common = @import("common.zig");
const device = @import("device.zig");

const Error = device.Error;
const Device = device.Device;
const Output = common.Output;
const Report = device.Report;

const usb_packet_length = 64;
const state_report_id: u8 = 0x00;
/// Length of the wired state report we decode (bytes 0..19).
const state_report_length = 20;

const vendor_astro: u16 = 0x9886;
const product_astro_c40_xbox360: u16 = 0x0024;
const vendor_microsoft: u16 = 0x045e;
const vendor_nvidia: u16 = 0x0955;
const product_wireless_receiver: u16 = 0x0719;
const product_wireless_receiver_third_party1: u16 = 0x02a9;
const product_wireless_receiver_third_party2: u16 = 0x0291;
const product_bigbutton_receiver: u16 = 0x02a0;

/// Driver state for one wired Xbox 360 controller (SDL_DriverXbox360_Context).
pub const Context = struct {
    /// Player index from the host, or -1 when unassigned.
    player_index: i32 = -1,
    /// SDL_JOYSTICK_HIDAPI_XBOX_360_PLAYER_LED, copied from the device config.
    player_lights: bool = true,
    /// Raw copy of the last state report, compared bytewise as SDL does.
    last_state: [usb_packet_length]u8 = @splat(0),
};

/// SDL_HIDAPI_DriverXbox360 IsSupportedDevice. Wireless receivers, the BigButton
/// receiver and the NVIDIA Shield (which does not speak this protocol) are
/// rejected. Interfaces other than 0 are chatpad or audio interfaces.
pub fn supports(probe: device.Probe) bool {
    if (probe.vendor_id == vendor_astro and probe.product_id == product_astro_c40_xbox360) return true;
    if (probe.vendor_id == vendor_nvidia) return false;
    if (probe.vendor_id == vendor_microsoft) {
        const receiver = probe.product_id == product_wireless_receiver or
            probe.product_id == product_wireless_receiver_third_party2 or
            probe.product_id == product_bigbutton_receiver;
        if (receiver) return false;
    }
    if ((probe.interface_number orelse 0) > 0) return false;
    return probe.gamepad_type == .xbox360;
}

/// Init: the wired controller needs no handshake, so the joystick connects now.
pub fn init(ctx: *Context, dev: *Device, env: device.Env) Error!bool {
    _ = env;
    ctx.* = .{ .player_lights = dev.config.xbox360_player_lights };
    dev.gamepad_type = .xbox360;
    return true;
}

/// 11 buttons, 6 axes and one hat (SDL sets nbuttons, naxes and nhats in OpenJoystick).
pub fn layout(ctx: *const Context, dev: *const Device) joystick.Layout {
    _ = ctx;
    _ = dev;
    return .{ .axes = common.axis.count, .buttons = 11, .hats = 1, .balls = 0 };
}

/// OpenJoystick: clears the last state and sets the slot LED for the player index.
pub fn open(ctx: *Context, dev: *Device) Error!void {
    ctx.last_state = @splat(0);
    ctx.player_lights = dev.config.xbox360_player_lights;
    try send_slot_led(ctx, dev);
}

/// Features: rumble, and a player LED when player lights are enabled.
pub fn capabilities(ctx: *const Context) device.Capabilities {
    return .{ .rumble = true, .player_led = ctx.player_lights };
}

/// Player slot LED: packet {0x01, 0x03, mode}, with mode 0x06 + slot for the
/// steady light on slot 0..3 and mode 0 to turn the ring off (SetSlotLED).
fn send_slot_led(ctx: *Context, dev: *Device) Error!void {
    const slot: u8 = if (ctx.player_lights and ctx.player_index >= 0)
        0x06 + @as(u8, @intCast(@mod(ctx.player_index, 4)))
    else
        0;
    const packet = [_]u8{ 0x01, 0x03, slot };
    _ = try dev.send_report(&packet, .report_id);
}

/// Sets the player index and refreshes the slot LED. The packet is queued only
/// once the joystick exists, as SDL's UpdateSlotLED runs only then.
pub fn set_player_index(ctx: *Context, dev: *Device, index: i32) void {
    ctx.player_index = index;
    if (!dev.is_connected()) return;
    send_slot_led(ctx, dev) catch {};
}

/// Rumble: magnitudes are the high byte of each 16-bit motor value.
pub fn rumble(ctx: *Context, dev: *Device, low: u16, high: u16) Error!void {
    _ = ctx;
    const packet = [_]u8{ 0x00, 0x08, 0x00, @truncate(low >> 8), @truncate(high >> 8), 0x00, 0x00, 0x00 };
    _ = try dev.send_report(&packet, .report_id);
}

/// Hat from the D-pad bits of byte 2. The bits are re-encoded to joystick.Hat's layout.
fn hat_from_byte(b: u8) joystick.Hat {
    return .{
        .up = b & 0x01 != 0,
        .down = b & 0x02 != 0,
        .left = b & 0x04 != 0,
        .right = b & 0x08 != 0,
    };
}

/// Decodes one state report (HandleStatePacket). Only the fields that changed
/// since `last_state` are sent, as SDL does; axes are always sent. `last_state`
/// is updated from the received bytes. Shared with the wireless receiver driver,
/// whose state body has the same layout.
pub fn decode_state(last_state: *[usb_packet_length]u8, out: *Output, data: []const u8) Error!void {
    const size = data.len;
    if (last_state[2] != data[2]) {
        const b = data[2];
        try out.hat(hat_from_byte(b));
        try out.button(common.button.start, b & 0x10 != 0);
        try out.button(common.button.back, b & 0x20 != 0);
        try out.button(common.button.left_stick, b & 0x40 != 0);
        try out.button(common.button.right_stick, b & 0x80 != 0);
    }
    if (last_state[3] != data[3]) {
        const b = data[3];
        try out.button(common.button.left_shoulder, b & 0x01 != 0);
        try out.button(common.button.right_shoulder, b & 0x02 != 0);
        try out.button(common.button.guide, b & 0x04 != 0);
        try out.button(common.button.south, b & 0x10 != 0);
        try out.button(common.button.east, b & 0x20 != 0);
        try out.button(common.button.west, b & 0x40 != 0);
        try out.button(common.button.north, b & 0x80 != 0);
    }
    try out.axis(common.axis.left_trigger, common.scale_u8(data[4]));
    try out.axis(common.axis.right_trigger, common.scale_u8(data[5]));
    try out.axis(common.axis.left_x, common.read_i16(data, 6));
    try out.axis(common.axis.left_y, ~common.read_i16(data, 8));
    try out.axis(common.axis.right_x, common.read_i16(data, 10));
    try out.axis(common.axis.right_y, ~common.read_i16(data, 12));
    const n = @min(size, usb_packet_length);
    @memcpy(last_state[0..n], data[0..n]);
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
        if (data[0] == state_report_id and data.len >= state_report_length) {
            try decode_state(&ctx.last_state, out, data);
        }
    }
    return report;
}
