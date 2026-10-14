//! Xbox One and Xbox Series controllers over USB, using the GIP protocol
//! (HIDAPI).
//!
//! Port of the USB (GIP) path of SDL_hidapi_xboxone.c as built for Linux
//! (XBOX_ONE_DRIVER_ACTIVE is 0 there, so the driver performs identification,
//! startup and acknowledgements itself). The driver handles the GIP framing,
//! the init sequence, input reports 0x20 (buttons, hat, sticks, triggers, the
//! Share button and the Elite paddles), rumble (0x09) and the color LED (0x0E).
//!
//! Not ported, so these controllers are handled differently from SDL:
//! - Bluetooth Xbox controllers are not claimed (SDL's Bluetooth report path).
//! - Nodes with a HID report descriptor are not claimed. SDL decodes them with
//!   the report-descriptor path; porting it is pending.
//! - Chunked GIP packets are acknowledged but their payloads are not reassembled.
//! - The unmapped-state report (0x0C) is ignored, so Elite paddles use the mapped
//!   state only.
//! - SDL's interface-class check (USB interface 0 with class 0xFF, subclass 71,
//!   protocol 208) is not available from sysfs; support follows the vendor/product table.
//!
//! Deliberate differences: the serial number is printed with two hex digits per
//! byte (SDL_uitoa omits leading zeros, which can make the text ambiguous).
//! SDL waits 10 ms after the PowerA rumble init packet; that pause is not made.
const std = @import("std");
const joystick = @import("../joystick.zig");
const common = @import("common.zig");
const device = @import("device.zig");

const Error = device.Error;
const Device = device.Device;
const Output = common.Output;
const Report = device.Report;

const usb_packet_length = 64;
const vendor_microsoft: u16 = 0x045e;
const product_xbox_one_elite_series_2: u16 = 0x0b00;
const vendor_razer: u16 = 0x1532;
const product_razer_atrox: u16 = 0x0a00;
const vendor_pdp: u16 = 0x0e6f;
const vendor_powera: u16 = 0x24c6;
const vendor_powera_alt: u16 = 0x20d6;

const identify_timeout_ns: u64 = 100 * std.time.ns_per_ms;
const prepare_input_timeout_ns: u64 = 50 * std.time.ns_per_ms;

/// GIP command identifiers (GIP_CMD_*).
const cmd_acknowledge: u8 = 0x01;
const cmd_announce: u8 = 0x02;
const cmd_status: u8 = 0x03;
const cmd_identify: u8 = 0x04;
const cmd_virtual_key: u8 = 0x07;
const cmd_led: u8 = 0x0a;
const cmd_rumble: u8 = 0x09;
const cmd_unmapped_state: u8 = 0x0c;
const cmd_input: u8 = 0x20;
const cmd_serial_number: u8 = 0x1e;
/// GIP option bits (GIP_OPT_*).
const opt_acknowledge: u8 = 0x10;
const opt_internal: u8 = 0x20;
const opt_chunk_start: u8 = 0x40;
const opt_chunk: u8 = 0x80;
const gip_min_header_length = 3;

/// Init packets, sent in order to controllers that need the startup sequence.
/// The sequence byte (index 2) is filled in when each packet is sent.
const init_power_on = [_]u8{ 0x05, 0x20, 0x00, 0x01, 0x00 };
const init_enable_led = [_]u8{ 0x0a, 0x20, 0x00, 0x03, 0x00, 0x01, 0x14 };
const init_security_passed = [_]u8{ 0x06, 0x20, 0x00, 0x02, 0x01, 0x00 };
const init_powera_rumble = [_]u8{ 0x09, 0x00, 0x00, 0x09, 0x00, 0x0f, 0x00, 0x00, 0x1d, 0x1d, 0xff, 0x00, 0x00 };
const init_rumble = [_]u8{ 0x09, 0x00, 0x00, 0x09, 0x00, 0x0f, 0x00, 0x00, 0x00, 0x00, 0xff, 0x00, 0xeb };

/// One entry of the startup sequence. Zero vendor or product matches any device.
const InitPacket = struct {
    vendor: u16 = 0,
    product: u16 = 0,
    data: []const u8,
};

const init_packets = [_]InitPacket{
    .{ .data = &init_power_on },
    .{ .data = &init_enable_led },
    .{ .data = &init_security_passed },
    .{ .vendor = vendor_powera, .product = 0x541a, .data = &init_powera_rumble },
    .{ .vendor = vendor_powera, .product = 0x542a, .data = &init_powera_rumble },
    .{ .vendor = vendor_powera, .product = 0x543a, .data = &init_powera_rumble },
    .{ .data = &init_rumble },
};

/// Vendor/product pairs whose controllers predate the Share button (SDL's
/// old_xboxone_controllers list in SDL_joystick.c, generated from that file).
pub const old_xboxone_controllers = [_]struct { u16, u16 }{
    .{ 0x0000, 0x6686 },
    .{ 0x0079, 0x18a1 },
    .{ 0x0079, 0x18c2 },
    .{ 0x0079, 0x18c8 },
    .{ 0x0079, 0x18cf },
    .{ 0x03f0, 0x0495 },
    .{ 0x045e, 0x02d1 },
    .{ 0x045e, 0x02dd },
    .{ 0x045e, 0x02e0 },
    .{ 0x045e, 0x02e3 },
    .{ 0x045e, 0x02ea },
    .{ 0x045e, 0x02fd },
    .{ 0x045e, 0x02ff },
    .{ 0x045e, 0x0867 },
    .{ 0x045e, 0x0b00 },
    .{ 0x045e, 0x0b05 },
    .{ 0x045e, 0x0b0a },
    .{ 0x045e, 0x0b0c },
    .{ 0x045e, 0x0b20 },
    .{ 0x045e, 0x0b21 },
    .{ 0x045e, 0x0b22 },
    .{ 0x046d, 0x0000 },
    .{ 0x046d, 0x1004 },
    .{ 0x046d, 0x1007 },
    .{ 0x046d, 0x1008 },
    .{ 0x046d, 0xf301 },
    .{ 0x0738, 0x02a0 },
    .{ 0x0738, 0x4a01 },
    .{ 0x0738, 0x7263 },
    .{ 0x0738, 0xb738 },
    .{ 0x0738, 0xcb29 },
    .{ 0x0738, 0xf401 },
    .{ 0x0c12, 0x0e17 },
    .{ 0x0c12, 0x0e1c },
    .{ 0x0c12, 0x0e22 },
    .{ 0x0c12, 0x0e30 },
    .{ 0x0d62, 0x9a1a },
    .{ 0x0d62, 0x9a1b },
    .{ 0x0e00, 0x0e00 },
    .{ 0x0e6f, 0x012a },
    .{ 0x0e6f, 0x0139 },
    .{ 0x0e6f, 0x013b },
    .{ 0x0e6f, 0x013a },
    .{ 0x0e6f, 0x0145 },
    .{ 0x0e6f, 0x0146 },
    .{ 0x0e6f, 0x0152 },
    .{ 0x0e6f, 0x015b },
    .{ 0x0e6f, 0x015c },
    .{ 0x0e6f, 0x015d },
    .{ 0x0e6f, 0x015f },
    .{ 0x0e6f, 0x0160 },
    .{ 0x0e6f, 0x0161 },
    .{ 0x0e6f, 0x0162 },
    .{ 0x0e6f, 0x0163 },
    .{ 0x0e6f, 0x0164 },
    .{ 0x0e6f, 0x0165 },
    .{ 0x0e6f, 0x0166 },
    .{ 0x0e6f, 0x0167 },
    .{ 0x0e6f, 0x0205 },
    .{ 0x0e6f, 0x0206 },
    .{ 0x0e6f, 0x0246 },
    .{ 0x0e6f, 0x0261 },
    .{ 0x0e6f, 0x0262 },
    .{ 0x0e6f, 0x02a0 },
    .{ 0x0e6f, 0x02a1 },
    .{ 0x0e6f, 0x02a2 },
    .{ 0x0e6f, 0x02a3 },
    .{ 0x0e6f, 0x02a4 },
    .{ 0x0e6f, 0x02a5 },
    .{ 0x0e6f, 0x02a6 },
    .{ 0x0e6f, 0x02a7 },
    .{ 0x0e6f, 0x02a8 },
    .{ 0x0e6f, 0x02a9 },
    .{ 0x0e6f, 0x02aa },
    .{ 0x0e6f, 0x02ab },
    .{ 0x0e6f, 0x02ac },
    .{ 0x0e6f, 0x02ad },
    .{ 0x0e6f, 0x02ae },
    .{ 0x0e6f, 0x02af },
    .{ 0x0e6f, 0x02b0 },
    .{ 0x0e6f, 0x02b1 },
    .{ 0x0e6f, 0x02b2 },
    .{ 0x0e6f, 0x02b3 },
    .{ 0x0e6f, 0x02b5 },
    .{ 0x0e6f, 0x02b6 },
    .{ 0x0e6f, 0x02b8 },
    .{ 0x0e6f, 0x02bd },
    .{ 0x0e6f, 0x02be },
    .{ 0x0e6f, 0x02bf },
    .{ 0x0e6f, 0x02c0 },
    .{ 0x0e6f, 0x02c1 },
    .{ 0x0e6f, 0x02c2 },
    .{ 0x0e6f, 0x02c3 },
    .{ 0x0e6f, 0x02c4 },
    .{ 0x0e6f, 0x02c5 },
    .{ 0x0e6f, 0x02c6 },
    .{ 0x0e6f, 0x02c7 },
    .{ 0x0e6f, 0x02c8 },
    .{ 0x0e6f, 0x02c9 },
    .{ 0x0e6f, 0x02ca },
    .{ 0x0e6f, 0x02cb },
    .{ 0x0e6f, 0x02cd },
    .{ 0x0e6f, 0x02ce },
    .{ 0x0e6f, 0x02cf },
    .{ 0x0e6f, 0x02d5 },
    .{ 0x0e6f, 0x0346 },
    .{ 0x0e6f, 0x0446 },
    .{ 0x0e6f, 0xf501 },
    .{ 0x0f0d, 0x0063 },
    .{ 0x0f0d, 0x0067 },
    .{ 0x0f0d, 0x0078 },
    .{ 0x0f0d, 0x0097 },
    .{ 0x0f0d, 0x00ba },
    .{ 0x0f0d, 0x00c0 },
    .{ 0x0f0d, 0x00c5 },
    .{ 0x0f0d, 0x00d8 },
    .{ 0x0f0d, 0x00ed },
    .{ 0x0fff, 0x02a1 },
    .{ 0x12ab, 0x0304 },
    .{ 0x1430, 0x0291 },
    .{ 0x1430, 0x02a9 },
    .{ 0x1430, 0x070b },
    .{ 0x1430, 0x0719 },
    .{ 0x146b, 0x0611 },
    .{ 0x1532, 0x0a00 },
    .{ 0x1532, 0x0a03 },
    .{ 0x1532, 0x0a14 },
    .{ 0x1532, 0x0a15 },
    .{ 0x16d0, 0x0f3f },
    .{ 0x1bad, 0x028e },
    .{ 0x1bad, 0x02a0 },
    .{ 0x1bad, 0x5500 },
    .{ 0x20ab, 0x55ef },
    .{ 0x24c6, 0x541a },
    .{ 0x24c6, 0x542a },
    .{ 0x24c6, 0x543a },
    .{ 0x24c6, 0x5509 },
    .{ 0x24c6, 0x551a },
    .{ 0x24c6, 0x561a },
    .{ 0x24c6, 0x581a },
    .{ 0x24c6, 0x591a },
    .{ 0x24c6, 0x592a },
    .{ 0x24c6, 0x791a },
    .{ 0x2516, 0x0069 },
    .{ 0x25b1, 0x0360 },
    .{ 0x2c22, 0x2203 },
    .{ 0x2e24, 0x0652 },
    .{ 0x2e24, 0x1618 },
    .{ 0x2e24, 0x1688 },
    .{ 0x2f24, 0x0011 },
    .{ 0x2f24, 0x002e },
    .{ 0x2f24, 0x0050 },
    .{ 0x2f24, 0x0053 },
    .{ 0x2f24, 0x008f },
    .{ 0x2f24, 0x0091 },
    .{ 0x2f24, 0x00b7 },
    .{ 0xd2d2, 0xd2d2 },
};
/// Startup phase of a controller (SDL_XboxOneInitState).
const InitState = enum { announced, identifying, startup, prepare_input, complete };

/// Rumble progress: idle until a pending packet is written, then busy for a
/// short time so the motors are not overdriven.
const RumbleState = enum { idle, busy };

/// Driver state for one Xbox One controller (SDL_DriverXboxOne_Context).
pub const Context = struct {
    vendor_id: u16 = 0,
    product_id: u16 = 0,
    init_state: InitState = .complete,
    /// Time of the last protocol packet, in nanoseconds; drives the init timeouts.
    send_time_ns: u64 = 0,
    /// Timestamp of the current update pass; rumble and protocol sends use it.
    now_ns: u64 = 0,
    sequence: u8 = 0,
    has_color_led: bool = false,
    has_paddles: bool = false,
    has_trigger_rumble: bool = false,
    has_share_button: bool = false,
    last_paddle_state: u8 = 0,
    low_frequency_rumble: u8 = 0,
    high_frequency_rumble: u8 = 0,
    left_trigger_rumble: u8 = 0,
    right_trigger_rumble: u8 = 0,
    rumble_state: RumbleState = .idle,
    rumble_time_ns: u64 = 0,
    rumble_pending: bool = false,
    /// Raw copy of the last input body, compared bytewise as SDL does.
    last_state: [usb_packet_length]u8 = @splat(0),
};

/// GIP header fields (struct gip_header).
const Header = struct {
    command: u8 = 0,
    options: u8 = 0,
    sequence: u8 = 0,
    packet_length: u32 = 0,
    chunk_offset: u32 = 0,
};

/// Features the open joystick advertises (SDL_GetJoystickCapabilities).
pub fn capabilities(ctx: *const Context) device.Capabilities {
    return .{
        .rumble = true,
        .trigger_rumble = ctx.has_trigger_rumble,
        .rgb_led = ctx.has_color_led,
    };
}

/// IsSupportedDevice. Bluetooth and descriptor-bearing nodes are not claimed
/// (see the module comment). Support otherwise follows the controller table.
pub fn supports(probe: device.Probe) bool {
    if (probe.bluetooth) return false;
    return probe.gamepad_type == .xbox_one;
}

/// Controllers that never send the GIP announcement need the startup sequence sent at once.
fn controller_sends_announcement(vendor: u16) bool {
    return vendor != vendor_pdp and vendor != vendor_powera and vendor != vendor_powera_alt;
}

/// Whether the device predates the Share button (old_xboxone_controllers).
fn has_share_button(vendor: u16, product: u16) bool {
    for (old_xboxone_controllers) |entry| {
        if (entry[0] == vendor and entry[1] == product) return false;
    }
    return true;
}

/// InitDevice: sets feature flags and the initial startup state. A node that
/// exposes a HID report descriptor is rejected, since the descriptor path is not
/// ported (see module comment).
pub fn init(ctx: *Context, dev: *Device, env: device.Env) Error!bool {
    _ = env;
    if (dev.hid) |*handle| {
        const descriptor = handle.report_descriptor(dev.allocator) catch null;
        if (descriptor) |bytes| {
            defer dev.allocator.free(bytes);
            if (bytes.len > 0) return error.Unsupported;
        }
    }
    const vendor = dev.info.vendor_id;
    const product = dev.info.product_id;
    ctx.* = .{};
    ctx.vendor_id = vendor;
    ctx.product_id = product;
    ctx.has_color_led = vendor == vendor_microsoft and product == product_xbox_one_elite_series_2;
    ctx.has_paddles = joystick.guess_controller_type(vendor, product) == .xbox_elite_controller;
    ctx.has_trigger_rumble = vendor == vendor_microsoft;
    ctx.has_share_button = has_share_button(vendor, product);
    ctx.init_state = if (controller_sends_announcement(vendor)) .complete else .startup;
    dev.gamepad_type = .xbox_one;
    return true;
}

/// Input layout: 11 buttons, the Share button when present, and four paddles on
/// Elite controllers; six axes and one hat.
pub fn layout(ctx: *const Context, dev: *const Device) joystick.Layout {
    _ = dev;
    var buttons: usize = 11;
    if (ctx.has_share_button) buttons += 1;
    if (ctx.has_paddles) buttons += 4;
    return .{ .axes = common.axis.count, .buttons = buttons, .hats = 1, .balls = 0 };
}

/// OpenJoystick: resets rumble and the last input state.
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
}

/// Rumble: magnitudes are scaled from 16 bits to the protocol's 0..100 range.
/// The packet is sent on the next update pass when the motors are idle.
pub fn rumble(ctx: *Context, dev: *Device, low: u16, high: u16) Error!void {
    ctx.low_frequency_rumble = @truncate(low / 655);
    ctx.high_frequency_rumble = @truncate(high / 655);
    ctx.rumble_pending = true;
    try update_rumble(ctx, dev);
}

/// Trigger rumble, for controllers that report it (Microsoft).
pub fn rumble_triggers(ctx: *Context, dev: *Device, left: u16, right: u16) Error!void {
    if (!ctx.has_trigger_rumble) return error.Unsupported;
    ctx.left_trigger_rumble = @truncate(left / 655);
    ctx.right_trigger_rumble = @truncate(right / 655);
    ctx.rumble_pending = true;
    try update_rumble(ctx, dev);
}

/// Color LED for Elite Series 2 controllers. The packet replaces a pending LED
/// update for the same device, as SDL_HIDAPI_SendRumble does.
pub fn set_led(ctx: *Context, dev: *Device, red: u8, green: u8, blue: u8) Error!void {
    if (!ctx.has_color_led) return error.Unsupported;
    const packet = [_]u8{ 0x0e, 0x00, 0x00, 0x05, 0x00, 0x00, red, green, blue };
    _ = try dev.send_report(&packet, .report_id);
}

/// Rumble packet builder and motor state machine (UpdateRumble). A pending
/// request is written only once the previous rumble has had time to settle.
fn update_rumble(ctx: *Context, dev: *Device) Error!void {
    if (ctx.rumble_state == .busy) {
        const busy_ns: u64 = if (dev.info.bluetooth) 50 * std.time.ns_per_ms else 10 * std.time.ns_per_ms;
        if (ctx.now_ns >= ctx.rumble_time_ns + busy_ns) ctx.rumble_state = .idle;
    }
    if (!ctx.rumble_pending or ctx.rumble_state != .idle) return;
    // The request is consumed even if the write fails, as SDL does.
    ctx.rumble_pending = false;
    const packet = [_]u8{
        0x09,                    0x00,                     0x00,                     0x09,                      0x00, 0x0f,
        ctx.left_trigger_rumble, ctx.right_trigger_rumble, ctx.low_frequency_rumble, ctx.high_frequency_rumble, 0xff, 0x00,
        0xeb,
    };
    _ = try dev.send_report(&packet, .none);
    ctx.rumble_state = .busy;
    ctx.rumble_time_ns = ctx.now_ns;
}

/// Next GIP sequence number: 1..255, never 0.
fn next_sequence(ctx: *Context) u8 {
    ctx.sequence +%= 1;
    if (ctx.sequence == 0) ctx.sequence = 1;
    return ctx.sequence;
}

/// Sends a raw protocol packet and records the time for the init timeouts.
fn send_protocol(ctx: *Context, dev: *Device, data: []const u8) Error!void {
    ctx.send_time_ns = ctx.now_ns;
    _ = try dev.send_report(data, .none);
}

/// Bytes a variable-length integer takes: 7 bits per byte, at least one byte.
fn variable_int_length(value: u32) usize {
    var v = value;
    var n: usize = 0;
    while (true) {
        n += 1;
        v >>= 7;
        if (v == 0 or n == 4) break;
    }
    return n;
}

/// Length of the header as written, before the even-length padding.
fn actual_header_length(hdr: Header) usize {
    return gip_min_header_length + variable_int_length(hdr.packet_length);
}

/// Header length on the wire: an odd header is padded to even length.
fn header_length(hdr: Header) usize {
    const actual = actual_header_length(hdr);
    return actual + actual % 2;
}

/// Encodes a header into `buf`. An odd header gets a zero byte, which the decoder
/// reads as the continuation of the length field.
fn encode_header(hdr: Header, buf: []u8) usize {
    buf[0] = hdr.command;
    buf[1] = hdr.options;
    buf[2] = hdr.sequence;
    var n: usize = gip_min_header_length;
    var v = hdr.packet_length;
    var i: usize = 0;
    while (true) : (i += 1) {
        const more = (v >> 7) != 0;
        buf[n + i] = @truncate((v & 0x7f) | (if (more) @as(u32, 0x80) else 0));
        v >>= 7;
        if (!more or i == 3) break;
    }
    n += i + 1;
    if (actual_header_length(hdr) % 2 == 1) {
        buf[n - 1] |= 0x80;
        buf[n] = 0;
        n += 1;
    }
    return n;
}

/// Decodes a variable-length integer; returns the value and the bytes used.
fn decode_variable_int(data: []const u8) struct { value: u32, used: usize } {
    var value: u32 = 0;
    var i: usize = 0;
    while (i < 4 and i < data.len) : (i += 1) {
        value |= @as(u32, data[i] & 0x7f) << @intCast(i * 7);
        if (data[i] & 0x80 == 0) break;
    }
    return .{ .value = value, .used = i + 1 };
}

/// Decodes a header; returns it with the number of header bytes consumed.
fn decode_header(data: []const u8) struct { hdr: Header, used: usize } {
    var hdr: Header = .{ .command = data[0], .options = data[1], .sequence = data[2] };
    const length = decode_variable_int(data[3..]);
    hdr.packet_length = length.value;
    var used = 3 + length.used;
    if (hdr.options & opt_chunk != 0 and used < data.len) {
        const offset = decode_variable_int(data[used..]);
        hdr.chunk_offset = offset.value;
        used += offset.used;
    }
    return .{ .hdr = hdr, .used = used };
}

/// Sends a GIP packet: header plus payload, at most one USB packet.
fn send_gip(ctx: *Context, dev: *Device, hdr_in: Header, payload: []const u8) Error!void {
    var hdr = hdr_in;
    const hdr_len = header_length(hdr);
    const size = hdr_len + payload.len;
    if (size > usb_packet_length) return error.InvalidArgument;
    if (hdr.sequence == 0) hdr.sequence = next_sequence(ctx);
    var packet: [usb_packet_length]u8 = undefined;
    hdr.packet_length = @intCast(payload.len);
    _ = encode_header(hdr, &packet);
    @memcpy(packet[hdr_len..][0..payload.len], payload);
    try send_protocol(ctx, dev, packet[0..size]);
}

/// Acknowledges a packet that requested it. SDL sends a 9-byte acknowledge body
/// carrying the command, the length received and, for chunks, the remaining length.
fn acknowledge(ctx: *Context, dev: *Device, ack: Header) Error!void {
    var body: [9]u8 = @splat(0);
    body[1] = ack.command;
    body[2] = opt_internal;
    std.mem.writeInt(u16, body[3..5], @truncate(ack.chunk_offset + ack.packet_length), .little);
    try send_gip(ctx, dev, .{
        .command = cmd_acknowledge,
        .options = opt_internal,
        .sequence = ack.sequence,
        .packet_length = body.len,
    }, &body);
}

/// Identification request, sent after an announcement.
fn send_identification(ctx: *Context, dev: *Device) Error!void {
    var packet = [_]u8{ 0x04, 0x20, 0x00, 0x00 };
    packet[2] = next_sequence(ctx);
    try send_protocol(ctx, dev, &packet);
}

/// Startup sequence: power on, LED with the configured brightness, security
/// passed, and the rumble setup. Filtered by the device's vendor and product.
fn send_startup(ctx: *Context, dev: *Device) Error!void {
    const brightness = @min(dev.config.xbox_one_home_led, 50);
    for (init_packets) |entry| {
        if (entry.vendor != 0 and entry.vendor != ctx.vendor_id) continue;
        if (entry.product != 0 and entry.product != ctx.product_id) continue;
        var packet: [usb_packet_length]u8 = @splat(0);
        @memcpy(packet[0..entry.data.len], entry.data);
        packet[2] = next_sequence(ctx);
        if (packet[0] == 0x0a) {
            // Home LED: brightness 0 means off, anything else turns it on.
            packet[5] = if (brightness > 0) 0x01 else 0x00;
            packet[6] = brightness;
        }
        try send_protocol(ctx, dev, packet[0..entry.data.len]);
    }
}

/// Moves the init state machine forward as far as the timers allow (UpdateInitState).
fn update_init_state(ctx: *Context, dev: *Device) Error!void {
    while (true) {
        const previous = ctx.init_state;
        switch (ctx.init_state) {
            .announced => {
                try send_identification(ctx, dev);
                ctx.init_state = .identifying;
            },
            .identifying => {
                if (ctx.now_ns >= ctx.send_time_ns + identify_timeout_ns) ctx.init_state = .startup;
            },
            .startup => {
                try send_startup(ctx, dev);
                ctx.init_state = .prepare_input;
            },
            .prepare_input => {
                if (ctx.now_ns >= ctx.send_time_ns + prepare_input_timeout_ns) ctx.init_state = .complete;
            },
            .complete => {},
        }
        if (ctx.init_state == previous) break;
    }
}

/// Dispatches one GIP packet (GIP_CMD_* handling in HIDAPI_GIP_DispatchPacket).
fn dispatch(ctx: *Context, dev: *Device, out: *Output, hdr: Header, payload: []const u8) Error!void {
    // Packets for devices attached to the controller are not ours.
    if (hdr.options & 0x0f != 0) return;
    if (hdr.options & opt_internal != 0) {
        switch (hdr.command) {
            cmd_announce => ctx.init_state = .announced,
            cmd_status => {
                if (ctx.init_state != .complete) ctx.init_state = .complete;
            },
            cmd_identify => ctx.init_state = .startup,
            cmd_virtual_key => {
                if (payload.len >= 1) try out.button(common.button.guide, payload[0] & 0x01 != 0);
            },
            cmd_serial_number => try handle_serial(dev, payload),
            else => {},
        }
        return;
    }
    switch (hdr.command) {
        cmd_input => {
            // The first input after connecting may be spurious; it completes init and is dropped.
            if (ctx.init_state != .complete) {
                ctx.init_state = .complete;
                return;
            }
            try handle_state(ctx, dev, out, payload);
        },
        cmd_unmapped_state => {},
        else => {},
    }
}

/// Serial number: 14 bytes at payload offset 2, printed as hex (see module comment).
fn handle_serial(dev: *Device, payload: []const u8) Error!void {
    if (payload.len < 16) return;
    const alphabet = "0123456789abcdef";
    var text: [28]u8 = undefined;
    for (payload[2..16], 0..) |byte, i| {
        text[i * 2] = alphabet[byte >> 4];
        text[i * 2 + 1] = alphabet[byte & 0x0f];
    }
    try dev.set_serial(&text);
}

/// Splits one USB read into GIP packets and dispatches each (HIDAPI_GIP_ProcessData).
fn process_data(ctx: *Context, dev: *Device, out: *Output, data: []const u8) Error!void {
    var rest = data;
    while (rest.len > gip_min_header_length) {
        const decoded = decode_header(rest);
        if (decoded.used > rest.len) return;
        var hdr = decoded.hdr;
        // A short read (for example a shortened macOS report) truncates the payload.
        const available = rest.len - decoded.used;
        if (hdr.packet_length > available) hdr.packet_length = @intCast(available);
        const payload_len: usize = @intCast(hdr.packet_length);
        const payload = rest[decoded.used..][0..payload_len];
        try process_packet(ctx, dev, out, hdr, payload);
        rest = rest[decoded.used + payload.len ..];
    }
}

/// Acknowledges, then dispatches, one packet. Chunked payloads are not reassembled.
fn process_packet(ctx: *Context, dev: *Device, out: *Output, hdr: Header, payload: []const u8) Error!void {
    if (hdr.options & opt_acknowledge != 0) try acknowledge(ctx, dev, hdr);
    if (hdr.options & (opt_chunk_start | opt_chunk) != 0) return;
    try dispatch(ctx, dev, out, hdr, payload);
}

/// Input report (HIDAPI_DriverXboxOne_HandleStatePacket). The body is copied
/// into a zeroed buffer so reads past a short report see zeros.
fn handle_state(ctx: *Context, dev: *Device, out: *Output, body: []const u8) Error!void {
    const size = body.len;
    var data: [usb_packet_length]u8 = @splat(0);
    @memcpy(data[0..@min(size, usb_packet_length)], body[0..@min(size, usb_packet_length)]);

    // Elite controllers over USB need this packet to report their paddles.
    if (ctx.has_paddles and size == 46) {
        const enable_paddles = [_]u8{ 0x4d, 0x00, 0x00, 0x02, 0x07, 0x00 };
        _ = try dev.send_report(&enable_paddles, .report_id);
    }

    if (ctx.last_state[0] != data[0]) {
        const b = data[0];
        try out.button(common.button.start, b & 0x04 != 0);
        try out.button(common.button.back, b & 0x08 != 0);
        try out.button(common.button.south, b & 0x10 != 0);
        try out.button(common.button.east, b & 0x20 != 0);
        try out.button(common.button.west, b & 0x40 != 0);
        try out.button(common.button.north, b & 0x80 != 0);
    }

    if (ctx.last_state[1] != data[1]) {
        const b = data[1];
        // Hat bits (up 1, down 2, left 4, right 8) are re-encoded to joystick.Hat's layout.
        var hat_bits: u8 = 0;
        if (b & 0x01 != 0) hat_bits |= 0x1;
        if (b & 0x02 != 0) hat_bits |= 0x4;
        if (b & 0x04 != 0) hat_bits |= 0x8;
        if (b & 0x08 != 0) hat_bits |= 0x2;
        try out.hat(joystick.Hat.from_bits(hat_bits));
        if (dev.info.vendor_id == vendor_razer and dev.info.product_id == product_razer_atrox) {
            // The Atrox reports its shoulder bits reversed.
            try out.button(common.button.left_shoulder, b & 0x20 != 0);
            try out.button(common.button.right_shoulder, b & 0x10 != 0);
        } else {
            try out.button(common.button.left_shoulder, b & 0x10 != 0);
            try out.button(common.button.right_shoulder, b & 0x20 != 0);
        }
        try out.button(common.button.left_stick, b & 0x40 != 0);
        try out.button(common.button.right_stick, b & 0x80 != 0);
    }

    if (ctx.has_share_button) {
        // The Share button's byte depends on the firmware's report length.
        const share_index: ?usize = if (size < 44) 14 else if (size == 44) 18 else if (size == 46) 28 else if (size == 60) 42 else null;
        if (share_index) |index| {
            if (ctx.last_state[index] != data[index]) try out.button(share_button, data[index] & 0x01 != 0);
        }
    }

    if (ctx.has_paddles and (size == 29 or size == 34 or size == 46 or size == 47)) {
        try handle_paddles(ctx, out, &data, size);
    }

    // Triggers are 10-bit samples scaled by 64 to the 16-bit range. The top
    // value is clamped, and on 26-byte reports a zero sample with the digital
    // bit set reads fully pressed. Values past the 16-bit range are truncated,
    // as SDL's int-to-Sint16 conversion does.
    var left: i32 = trigger_raw(data[2..4]);
    if (left == 32704) left = 32767;
    if (left == -32768 and size == 26 and data[18] & 0x80 != 0) left = 32767;
    try out.axis(common.axis.left_trigger, @truncate(left));
    var right: i32 = trigger_raw(data[4..6]);
    if (right == -32768 and size == 26 and data[18] & 0x40 != 0) right = 32767;
    if (right == 32704) right = 32767;
    try out.axis(common.axis.right_trigger, @truncate(right));

    // Stick Y axes are inverted relative to SDL's convention.
    try out.axis(common.axis.left_x, std.mem.readInt(i16, data[6..8], .little));
    try out.axis(common.axis.left_y, ~std.mem.readInt(i16, data[8..10], .little));
    try out.axis(common.axis.right_x, std.mem.readInt(i16, data[10..12], .little));
    try out.axis(common.axis.right_y, ~std.mem.readInt(i16, data[12..14], .little));

    // Like SDL, only the received bytes replace the stored state.
    const n = @min(size, usb_packet_length);
    @memcpy(ctx.last_state[0..n], data[0..n]);
}

/// Xbox button used for the Share button (SDL_GAMEPAD_BUTTON_XBOX_SHARE_BUTTON).
const share_button: usize = 11;

/// Trigger sample times 64, minus 32768, before any clamping.
fn trigger_raw(bytes: []const u8) i32 {
    const raw: i32 = std.mem.readInt(u16, bytes[0..2], .little);
    return raw * 64 - 32768;
}

/// Elite paddles: four buttons read from a size-dependent byte. Mapped paddles
/// are cleared from the state so the app does not see them twice.
fn handle_paddles(ctx: *Context, out: *Output, data: *[usb_packet_length]u8, size: usize) Error!void {
    var paddle_index: usize = undefined;
    var bits: [4]u8 = undefined;
    var mapped: bool = undefined;
    if (size == 29) {
        // Elite Series 1: mapped state at offset 0, raw state at offset 14.
        paddle_index = 28;
        bits = .{ 0x02, 0x08, 0x01, 0x04 };
        mapped = data[0] != data[14] or data[1] != data[15];
    } else if (size == 34) {
        paddle_index = 14;
        bits = .{ 0x01, 0x02, 0x04, 0x08 };
        mapped = data[15] != 0;
    } else if (size == 46) {
        paddle_index = 18;
        bits = .{ 0x01, 0x02, 0x04, 0x08 };
        mapped = data[19] != 0;
    } else {
        paddle_index = 14;
        bits = .{ 0x01, 0x02, 0x04, 0x08 };
        mapped = data[20] != 0;
    }
    if (mapped) data[paddle_index] = 0;
    if (ctx.last_paddle_state != data[paddle_index]) {
        var button = share_button + @as(usize, if (ctx.has_share_button) 1 else 0);
        for (bits) |bit| {
            try out.button(button, data[paddle_index] & bit != 0);
            button += 1;
        }
        ctx.last_paddle_state = data[paddle_index];
    }
}

/// UpdateDevice: reads every queued USB report, runs the init state machine and
/// the rumble state machine. A read failure is reported as a disconnect.
pub fn update(ctx: *Context, dev: *Device, out: *Output, env: device.Env) Error!Report {
    _ = env;
    var report: Report = .{};
    if (!dev.is_connected()) return report;
    ctx.now_ns = out.timestamp;

    var buf: [usb_packet_length]u8 = undefined;
    var read_failed = false;
    while (true) {
        const maybe = dev.poll_report(&buf) catch {
            read_failed = true;
            break;
        };
        const data = maybe orelse break;
        try process_data(ctx, dev, out, data);
    }
    try update_init_state(ctx, dev);
    try update_rumble(ctx, dev);
    if (read_failed) report.read_failed = true;
    return report;
}
