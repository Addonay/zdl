//! DualSense, DualSense Edge and third-party PlayStation 5-compatible controllers
//! (HIDAPI).
//!
//! Port of SDL_hidapi_ps5.c. Three input layouts exist and are decoded into one
//! `State` so that button and hat comparisons work the same way for all of them:
//! the simple report (IDs 1, size 10 or 78), the full report (ID 1, or ID 0x31
//! over Bluetooth) and the alternate report used by third-party pads
//! (`use_alternate_report`). Output is an effects packet (47-byte payload) sent
//! as ID 2 over USB or ID 0x31 with a CRC-32 over Bluetooth.
//!
//! Deliberate differences from SDL:
//! - Timestamps for a pass come from the pass's `now` value, not one clock read
//!   per packet. Sensor timestamps are unaffected.
//! - The 5 ms pause SDL inserts after the first effects packet is not made.
//! - Bluetooth "no packets" handling reports a disconnect through the registry
//!   instead of calling the joystick disconnect directly.
//! - Hints are replaced by `common.Config`, read once per device.
const std = @import("std");
const gamepad = @import("../gamepad.zig");
const joystick = @import("../joystick.zig");
const common = @import("common.zig");
const device = @import("device.zig");

const Error = device.Error;
const Device = device.Device;
const Output = common.Output;
const Report = device.Report;

const usb_packet_length = 64;
const bluetooth_disconnect_timeout_ns: u64 = 500 * std.time.ns_per_ms;
/// LED animation at connection time completes after this sensor tick count.
const connection_complete_ticks: u32 = 10_200_000;

const vendor_sony: u16 = 0x054c;
const product_dualsense_edge: u16 = 0x0df2;
const vendor_nacon_alt: u16 = 0x3285;
const product_nacon_revolution5_ps5_wired: u16 = 0x0d19;
const product_nacon_revolution5_ps5_wireless: u16 = 0x0d18;
const vendor_razer: u16 = 0x1532;
const product_razer_kitsune: u16 = 0x1012;
const product_razer_raiju_v3_wired: u16 = 0x1024;
const product_razer_raiju_v3_wireless: u16 = 0x1026;
const product_razer_wolverine_v2_wired: u16 = 0x100b;
const product_razer_wolverine_v2_wireless: u16 = 0x100c;
const vendor_backbone: u16 = 0x358a;
const product_backbone_one_ps5_v2: u16 = 0x0304;

/// Report IDs (EPS5ReportId) and feature reports (EPS5FeatureReportId).
const report_state: u8 = 0x01;
const report_usb_effects: u8 = 0x02;
const report_bluetooth: u8 = 0x31;
const feature_capabilities: u8 = 0x03;
const feature_calibration: u8 = 0x05;
const feature_serial_number: u8 = 0x09;
const feature_firmware_info: u8 = 0x20;

/// Joystick button indices for DualSense-only inputs (SDL's local enum after
/// SDL_GAMEPAD_BUTTON_PS5_TOUCHPAD = 11).
const button_touchpad: usize = 11;
const button_microphone: usize = 12;
const button_left_function: usize = 13;
const button_right_function: usize = 14;
const button_left_paddle: usize = 15;
const button_right_paddle: usize = 16;

/// Effect enable bits for `update_effects` (EDS5Effect).
const effect_rumble_start: u8 = 1 << 0;
const effect_rumble: u8 = 1 << 1;
const effect_led_reset: u8 = 1 << 2;
const effect_led: u8 = 1 << 3;
const effect_pad_lights: u8 = 1 << 4;
const effect_mic_light: u8 = 1 << 5;

/// Size of the DS5EffectsState_t payload, from the first byte to the LED blue byte.
const effects_size = 47;

const touchpad_scale_x: f32 = 1.0 / 1920.0;
const touchpad_scale_y: f32 = 1.0 / 1070.0;
const gyro_res_per_degree: f32 = 1024.0;
const accel_res_per_g: f32 = 8192.0;

/// Which of the three input layouts a report body uses.
pub const Family = enum { simple, full, alternate };

/// Normalized input state. Fields are filled from whichever layout the report
/// used; absent fields stay zero. `buttons` uses the full layout's byte order
/// (the simple layout's three bytes map to buttons[0..3]).
pub const State = struct {
    left_x: u8 = 0,
    left_y: u8 = 0,
    right_x: u8 = 0,
    right_y: u8 = 0,
    trigger_left: u8 = 0,
    trigger_right: u8 = 0,
    counter: u8 = 0,
    buttons: [4]u8 = @splat(0),
    sequence: u32 = 0,
    gyro: [3]i16 = @splat(0),
    accel: [3]i16 = @splat(0),
    sensor_timestamp: u32 = 0,
    battery: u8 = 0,
    touch_counter: [2]u8 = @splat(0),
    touch: [2][3]u8 = @splat(@splat(0)),
    device_specific: [8]u8 = @splat(0),
    connect_state: u8 = 0,

    /// Body lengths the decoder needs, after the report ID.
    pub const simple_size = 9;
    pub const full_size = 54;
    pub const alternate_size = 48;

    /// Decodes a report body (the bytes after the report ID or the Bluetooth
    /// header). Short bodies read as zero past their end.
    pub fn decode(family: Family, body: []const u8) State {
        var raw: [full_size]u8 = @splat(0);
        const n = @min(body.len, full_size);
        @memcpy(raw[0..n], body[0..n]);
        var state: State = .{
            .left_x = raw[0],
            .left_y = raw[1],
            .right_x = raw[2],
            .right_y = raw[3],
        };
        switch (family) {
            .simple => {
                state.buttons = .{ raw[4], raw[5], raw[6], 0 };
                state.trigger_left = raw[7];
                state.trigger_right = raw[8];
            },
            .full, .alternate => {
                state.trigger_left = raw[4];
                state.trigger_right = raw[5];
                state.counter = raw[6];
                state.buttons = raw[7..11].*;
                state.sequence = std.mem.readInt(u32, raw[11..15], .little);
                state.gyro = .{
                    std.mem.readInt(i16, raw[15..17], .little),
                    std.mem.readInt(i16, raw[17..19], .little),
                    std.mem.readInt(i16, raw[19..21], .little),
                };
                state.accel = .{
                    std.mem.readInt(i16, raw[21..23], .little),
                    std.mem.readInt(i16, raw[23..25], .little),
                    std.mem.readInt(i16, raw[25..27], .little),
                };
                if (family == .full) {
                    state.sensor_timestamp = std.mem.readInt(u32, raw[27..31], .little);
                    state.battery = raw[52];
                    state.touch_counter = .{ raw[32], raw[36] };
                    state.touch = .{ raw[33..36].*, raw[37..40].* };
                    state.connect_state = raw[53];
                } else {
                    state.sensor_timestamp = std.mem.readInt(u16, raw[27..29], .little);
                    state.battery = raw[29];
                    state.touch_counter = .{ raw[31], raw[35] };
                    state.touch = .{ raw[32..35].*, raw[36..39].* };
                    state.device_specific = raw[40..48].*;
                }
            },
        }
        return state;
    }
};

/// Per-axis IMU calibration: value = (raw - bias) * sensitivity before conversion.
const Calibration = struct {
    bias: i16 = 0,
    sensitivity: f32 = 1.0,
};

/// Bluetooth connection sequence progress for the LED (k_EDS5LEDResetState*).
const LedResetState = enum { none, pending, complete };

/// Driver state for one DualSense-family controller (SDL_DriverPS5_Context).
pub const Context = struct {
    is_dongle: bool = false,
    use_alternate_report: bool = false,
    sensors_supported: bool = false,
    lightbar_supported: bool = false,
    vibration_supported: bool = false,
    playerled_supported: bool = false,
    touchpad_supported: bool = false,
    effects_supported: bool = false,
    guitar_whammy_supported: bool = false,
    guitar_tilt_supported: bool = false,
    guitar_effects_selector_supported: bool = false,
    enhanced_report_hint: common.EnhancedReports = .on,
    enhanced_reports: bool = false,
    enhanced_mode: bool = false,
    enhanced_mode_available: bool = false,
    report_sensors: bool = false,
    report_touchpad: bool = false,
    report_battery: bool = false,
    hardware_calibration: bool = false,
    calibration: [6]Calibration = @splat(.{ .bias = 0, .sensitivity = 1.0 }),
    firmware_version: u16 = 0,
    enhanced_rumble: bool = false,
    last_packet_ns: u64 = 0,
    player_index: i32 = -1,
    player_lights: bool = true,
    rumble_left: u8 = 0,
    rumble_right: u8 = 0,
    color_set: bool = false,
    led: [3]u8 = @splat(0),
    led_reset_state: LedResetState = .none,
    sensor_ticks: u64 = 0,
    last_tick: u32 = 0,
    last_state: State = .{},
};

/// Features the open joystick advertises (SDL_GetJoystickCapabilities).
pub fn capabilities(ctx: *const Context) device.Capabilities {
    var caps: device.Capabilities = .{};
    if (ctx.enhanced_mode_available) {
        caps.rgb_led = ctx.lightbar_supported;
        caps.player_led = ctx.playerled_supported;
        caps.rumble = ctx.vibration_supported;
    }
    return caps;
}

/// IsSupportedDevice. The Backbone One for PS5 v2 does not use this protocol.
pub fn supports(probe: device.Probe) bool {
    if (probe.vendor_id == vendor_backbone and probe.product_id == product_backbone_one_ps5_v2) return false;
    if (probe.gamepad_type == .ps5) return true;
    if (!common.supports_playstation_detection(probe.vendor_id, probe.product_id)) return false;
    const hid = probe.hid orelse return true;
    var data: [usb_packet_length]u8 = undefined;
    const size = common.read_feature(hid, feature_capabilities, &data);
    return size == 48 and data[2] == 0x28;
}

/// Initial layout: DualSense Edge has 17 buttons (paddles and function keys),
/// other touchpad models 13 (touchpad and microphone), and the rest 11.
pub fn layout(ctx: *const Context, dev: *const Device) joystick.Layout {
    const buttons: usize = if (is_dualsense_edge(dev)) 17 else if (ctx.touchpad_supported) 13 else 11;
    return .{ .axes = common.axis.count, .buttons = buttons, .hats = 1, .balls = 0 };
}

fn is_dualsense_edge(dev: *const Device) bool {
    return dev.info.vendor_id == vendor_sony and dev.info.product_id == product_dualsense_edge;
}

/// InitDevice: determines the mode from the first report, reads the serial and
/// firmware, and sets capabilities. Returns whether the joystick connects now.
pub fn init(ctx: *Context, dev: *Device, env: device.Env) Error!bool {
    ctx.* = .{};
    const vendor = dev.info.vendor_id;
    const product = dev.info.product_id;
    var data: [2 * usb_packet_length]u8 = undefined;
    var serial_text: [17]u8 = undefined;
    var serial: []const u8 = "";
    if (dev.info.serial.len == 12) serial = format_serial12(dev.info.serial, &serial_text);

    // A 64-byte report means USB; a Bluetooth report with ID 0x31 means enhanced
    // reports. Anything else is a simple-mode Bluetooth link.
    const first = dev.read_report_timeout(&data, 16) catch null;
    if (first) |bytes| {
        if (bytes.len == 64) {
            ctx.enhanced_reports = true;
        } else if (bytes[0] == report_bluetooth) {
            ctx.enhanced_reports = true;
        }
    }

    if (vendor == vendor_sony and ctx.enhanced_reports) {
        // Reading the serial also switches a Bluetooth controller into enhanced mode.
        const serial_size = dev.read_feature(feature_serial_number, &data);
        if (serial_size >= 7) serial = common.format_reversed_mac(data[1..7], &serial_text) orelse serial;
        const firmware_size = dev.read_feature(feature_firmware_info, &data);
        if (firmware_size >= 46) ctx.firmware_version = @as(u16, data[44]) | (@as(u16, data[45]) << 8);
    }
    if (vendor == vendor_sony) {
        if (product == product_dualsense_edge or ctx.firmware_version == 0 or ctx.firmware_version >= 0x0224) {
            ctx.enhanced_rumble = true;
        }
    }

    var joystick_type: device.JoystickType = .gamepad;
    if (vendor == vendor_sony) {
        ctx.sensors_supported = true;
        ctx.lightbar_supported = true;
        ctx.vibration_supported = true;
        ctx.playerled_supported = true;
        ctx.touchpad_supported = true;
    } else {
        const size = dev.read_feature(feature_capabilities, &data);
        if (size == 48 and data[2] == 0x28) {
            const caps = data[4];
            const caps2 = data[20];
            const specific = data[24];
            const device_type = data[5];
            if (caps & 0x02 != 0) ctx.sensors_supported = true;
            if (caps & 0x04 != 0) ctx.lightbar_supported = true;
            if (caps & 0x08 != 0) ctx.vibration_supported = true;
            if (caps & 0x40 != 0) ctx.touchpad_supported = true;
            if (caps2 & 0x80 != 0) ctx.playerled_supported = true;
            if (caps2 & 0x01 != 0) ctx.report_battery = true;
            joystick_type = switch (device_type) {
                0x00 => .gamepad,
                0x01 => blk: {
                    ctx.guitar_effects_selector_supported = specific & 0x01 != 0;
                    ctx.guitar_tilt_supported = specific & 0x02 != 0;
                    ctx.guitar_whammy_supported = specific & 0x04 != 0;
                    break :blk .guitar;
                },
                0x02 => .drum_kit,
                0x06 => .wheel,
                0x07 => .arcade_stick,
                0x08 => .flight_stick,
                else => .unknown,
            };
            ctx.use_alternate_report = true;
            ctx.report_battery = true;
            if (vendor == vendor_nacon_alt and (product == product_nacon_revolution5_ps5_wired or product == product_nacon_revolution5_ps5_wireless)) {
                // Does not report vibration capability, but can rumble.
                ctx.vibration_supported = true;
            }
        } else if (vendor == vendor_razer and (product == product_razer_wolverine_v2_wired or product == product_razer_wolverine_v2_wireless)) {
            // Wolverine V2 Pro: touchpad and sensors, no vibration, no capability answer.
            ctx.sensors_supported = true;
            ctx.touchpad_supported = true;
            ctx.use_alternate_report = true;
        } else if (vendor == vendor_razer and (product == product_razer_kitsune or product == product_razer_raiju_v3_wired or product == product_razer_raiju_v3_wireless)) {
            joystick_type = .arcade_stick;
            ctx.touchpad_supported = true;
            ctx.use_alternate_report = true;
        }
    }

    ctx.effects_supported = ctx.lightbar_supported or ctx.vibration_supported or ctx.playerled_supported;
    // Dongles report the controller's presence only in their input reports.
    if ((vendor == vendor_nacon_alt and product == product_nacon_revolution5_ps5_wireless) or
        (vendor == vendor_razer and (product == product_nacon_revolution5_ps5_wireless or
            product == product_razer_wolverine_v2_wireless or product == product_razer_raiju_v3_wireless)))
    {
        ctx.is_dongle = true;
    }

    dev.joystick_type = joystick_type;
    dev.gamepad_type = .ps5;
    if (vendor == vendor_sony) {
        try dev.set_name(if (is_dualsense_edge(dev)) "DualSense Edge Wireless Controller" else "DualSense Wireless Controller");
    }
    try dev.set_serial(serial);

    if (ctx.is_dongle) return false;
    if (dev.info.bluetooth and env.has_connected_usb(dev.info.serial)) return false;
    return true;
}

fn format_serial12(text: []const u8, buf: *[17]u8) []const u8 {
    var out: usize = 0;
    var i: usize = 0;
    while (i < 12) : (i += 2) {
        if (out > 0) {
            buf[out] = '-';
            out += 1;
        }
        @memcpy(buf[out..][0..2], text[i..][0..2]);
        out += 2;
    }
    return buf[0..out];
}

/// OpenJoystick: resets the connection state and applies the enhanced-report
/// policy and the player-light setting.
pub fn open(ctx: *Context, dev: *Device) Error!void {
    ctx.report_sensors = false;
    ctx.report_touchpad = false;
    ctx.rumble_left = 0;
    ctx.rumble_right = 0;
    ctx.color_set = false;
    ctx.led_reset_state = .none;
    ctx.last_state = .{};
    ctx.last_packet_ns = 0;
    ctx.player_lights = dev.config.ps5_player_lights;
    const hint: common.EnhancedReports = if (dev.info.bluetooth) dev.config.enhanced_reports else .on;
    try set_enhanced_report_hint(ctx, dev, hint);
}

/// CloseJoystick: releases per-connection state.
pub fn close(ctx: *Context, dev: *Device) void {
    _ = dev;
    ctx.report_sensors = false;
    ctx.enhanced_mode = false;
    ctx.enhanced_mode_available = false;
}

fn set_enhanced_mode_available(ctx: *Context, dev: *Device) void {
    if (ctx.enhanced_mode_available) return;
    ctx.enhanced_mode_available = true;
    if (ctx.touchpad_supported) {
        dev.state.add_touchpad(2);
        ctx.report_touchpad = true;
    }
    if (ctx.sensors_supported) {
        // USB runs at 250 Hz, Bluetooth and the Edge at 1000 Hz.
        var rate: f32 = 250.0;
        if (dev.info.bluetooth or is_dualsense_edge(dev)) rate = 1000.0;
        dev.state.set_sensor_rate(.gyro, rate);
        dev.state.set_sensor_rate(.accel, rate);
    }
    if (ctx.guitar_tilt_supported) dev.state.set_sensor_rate(.accel, 250.0);
    ctx.report_battery = true;
}

fn set_enhanced_mode(ctx: *Context, dev: *Device) Error!void {
    set_enhanced_mode_available(ctx, dev);
    if (ctx.enhanced_mode) return;
    ctx.enhanced_mode = true;
    try tolerate_unsupported(update_effects(ctx, dev, 0, false));
    try tolerate_unsupported(update_effects(ctx, dev, effect_led | effect_pad_lights, false));
}

fn set_enhanced_report_hint(ctx: *Context, dev: *Device, hint: common.EnhancedReports) Error!void {
    switch (hint) {
        .off => {},
        .on => try set_enhanced_mode(ctx, dev),
        .auto => set_enhanced_mode_available(ctx, dev),
    }
    ctx.enhanced_report_hint = hint;
}

fn update_enhanced_on_enhanced_report(ctx: *Context, dev: *Device) Error!void {
    ctx.enhanced_reports = true;
    if (ctx.enhanced_report_hint == .auto) try set_enhanced_report_hint(ctx, dev, .on);
}

fn update_enhanced_on_application_usage(ctx: *Context, dev: *Device) Error!void {
    if (ctx.enhanced_report_hint == .auto) try set_enhanced_report_hint(ctx, dev, .on);
}

/// Lightbar colors per player slot, as in hid-sony.c.
const player_colors = [7][3]u8{
    .{ 0x00, 0x00, 0x40 },
    .{ 0x40, 0x00, 0x00 },
    .{ 0x00, 0x40, 0x00 },
    .{ 0x20, 0x00, 0x20 },
    .{ 0x20, 0x10, 0x00 },
    .{ 0x00, 0x10, 0x10 },
    .{ 0x10, 0x10, 0x10 },
};

/// Touchpad light patterns per player slot. Bit 0x20 makes the change instant.
const player_lights = [7]u8{ 0x04, 0x0a, 0x15, 0x1b, 0x1f, 0x11, 0x0e };

// Offsets in DS5EffectsState_t.
const fx_enable1 = 0;
const fx_enable2 = 1;
const fx_rumble_right = 2;
const fx_rumble_left = 3;
const fx_enable3 = 38;
const fx_pad_lights = 43;
const fx_led_red = 44;

/// Builds the effects payload for `mask` and sends it. Bluetooth controllers
/// hold LED changes until the connection animation has finished, so LED and
/// pad-light requests only mark the reset state as pending in that case.
fn update_effects(ctx: *Context, dev: *Device, mask: u8, application_usage: bool) Error!void {
    if (dev.info.bluetooth and ctx.enhanced_reports and (mask & (effect_led | effect_pad_lights)) != 0) {
        if (ctx.led_reset_state != .complete) {
            ctx.led_reset_state = .pending;
            return;
        }
    }

    var effects: [effects_size]u8 = @splat(0);
    if (ctx.vibration_supported) {
        if (ctx.rumble_left != 0 or ctx.rumble_right != 0) {
            if (ctx.enhanced_rumble) {
                effects[fx_enable3] |= 0x04;
                effects[fx_rumble_left] = ctx.rumble_left;
                effects[fx_rumble_right] = ctx.rumble_right;
            } else {
                // Older firmware emulates rumble with the audio path, at half strength to match Xbox pads.
                effects[fx_enable1] |= 0x01;
                effects[fx_rumble_left] = ctx.rumble_left >> 1;
                effects[fx_rumble_right] = ctx.rumble_right >> 1;
            }
            effects[fx_enable1] |= 0x02;
        }
        if (mask & effect_rumble_start != 0) effects[fx_enable1] |= 0x02;
    }
    if (ctx.lightbar_supported) {
        if (mask & effect_led_reset != 0) effects[fx_enable2] |= 0x08;
        if (mask & effect_led != 0) {
            effects[fx_enable2] |= 0x04;
            const rgb = if (ctx.color_set) ctx.led else player_color(ctx.player_index);
            effects[fx_led_red..][0..3].* = rgb;
        }
    }
    if (ctx.playerled_supported and mask & effect_pad_lights != 0) {
        effects[fx_enable2] |= 0x10;
        effects[fx_pad_lights] = if (ctx.player_lights) player_light(ctx.player_index) else 0;
    }
    if (mask & effect_mic_light != 0) {
        // Microphone light off: mode 0.
        effects[fx_enable2] |= 0x01;
    }
    try send_effects(ctx, dev, &effects, application_usage);
}

fn player_color(player_index: i32) [3]u8 {
    const slot: usize = if (player_index >= 0) @intCast(@mod(player_index, 7)) else 0;
    return player_colors[slot];
}

fn player_light(player_index: i32) u8 {
    if (player_index < 0) return 0;
    const slot: usize = @intCast(@mod(player_index, 7));
    return player_lights[slot] | 0x20;
}

/// Wraps the payload in a USB (ID 2, 48 bytes) or Bluetooth (ID 0x31, 78 bytes,
/// CRC-32) output report and queues it. Pending reports whose enable bits match
/// are overwritten instead of queued, so rumble updates do not pile up.
fn send_effects(ctx: *Context, dev: *Device, effect: []const u8, application_usage: bool) Error!void {
    if (!ctx.effects_supported) return error.Unsupported;
    if (!ctx.enhanced_mode) {
        if (application_usage) try update_enhanced_on_application_usage(ctx, dev);
        if (!ctx.enhanced_mode) return error.Unsupported;
    }

    var data: [78]u8 = @splat(0);
    var report_size: usize = undefined;
    var offset: usize = undefined;
    if (dev.info.bluetooth) {
        data[0] = report_bluetooth;
        data[1] = 0x00; // Tag and sequence.
        data[2] = 0x10; // Magic value.
        report_size = 78;
        offset = 3;
    } else {
        data[0] = report_usb_effects;
        report_size = 48;
        offset = 1;
    }
    const n = @min(data.len - offset, effect.len);
    @memcpy(data[offset..][0..n], effect[0..n]);
    if (dev.info.bluetooth) common.write_bluetooth_crc(data[0..report_size]);
    _ = try dev.send_report(data[0..report_size], .{ .effect_bits = offset });
}

fn tolerate_unsupported(result: Error!void) Error!void {
    result catch |err| if (err != error.Unsupported) return err;
}

/// RumbleJoystick. The first non-zero rumble also sends the rumble-start bit so
/// audio haptics are disabled while the motors run.
pub fn rumble(ctx: *Context, dev: *Device, low: u16, high: u16) Error!void {
    if (!ctx.vibration_supported) return error.Unsupported;
    if (ctx.rumble_left == 0 and ctx.rumble_right == 0) {
        try update_effects(ctx, dev, effect_rumble_start, true);
    }
    ctx.rumble_left = @truncate(low >> 8);
    ctx.rumble_right = @truncate(high >> 8);
    try update_effects(ctx, dev, effect_rumble, true);
}

/// SetJoystickLED.
pub fn set_led(ctx: *Context, dev: *Device, red: u8, green: u8, blue: u8) Error!void {
    if (!ctx.lightbar_supported) return error.Unsupported;
    ctx.color_set = true;
    ctx.led = .{ red, green, blue };
    try update_effects(ctx, dev, effect_led, true);
}

/// SendJoystickEffect: a raw DS5EffectsState_t payload from the application.
pub fn send_effect(ctx: *Context, dev: *Device, data: []const u8) Error!void {
    try send_effects(ctx, dev, data, true);
}

/// SetJoystickSensorsEnabled.
pub fn set_sensors_enabled(ctx: *Context, dev: *Device, enabled: bool) Error!void {
    try update_enhanced_on_application_usage(ctx, dev);
    if ((!ctx.sensors_supported or (enabled and !ctx.enhanced_mode)) and !ctx.guitar_tilt_supported) {
        return error.Unsupported;
    }
    if (enabled) load_calibration(ctx, dev);
    ctx.report_sensors = enabled;
}

/// SetDevicePlayerIndex: refreshes the lightbar and the pad lights.
pub fn set_player_index(ctx: *Context, dev: *Device, index: i32) void {
    if (!dev.is_connected()) return;
    ctx.player_index = index;
    tolerate_unsupported(update_effects(ctx, dev, effect_led | effect_pad_lights, false)) catch {};
}

/// Reads and validates the factory IMU calibration (feature 0x05). Returns
/// false when the report is short; the caller then keeps the raw conversion.
fn load_official_calibration(ctx: *Context, dev: *Device) bool {
    var data: [usb_packet_length]u8 = undefined;
    const size = dev.read_feature(feature_calibration, &data);
    if (size < 35) return false;

    const gyro_bias = [3]i16{ common.read_i16(&data, 1), common.read_i16(&data, 3), common.read_i16(&data, 5) };
    const gyro_plus = [3]i16{ common.read_i16(&data, 7), common.read_i16(&data, 11), common.read_i16(&data, 15) };
    const gyro_minus = [3]i16{ common.read_i16(&data, 9), common.read_i16(&data, 13), common.read_i16(&data, 17) };
    const speed_plus = common.read_i16(&data, 19);
    const speed_minus = common.read_i16(&data, 21);
    const acc_plus = [3]i16{ common.read_i16(&data, 23), common.read_i16(&data, 27), common.read_i16(&data, 31) };
    const acc_minus = [3]i16{ common.read_i16(&data, 25), common.read_i16(&data, 29), common.read_i16(&data, 33) };

    const numerator: f32 = @as(f32, @floatFromInt(@as(i32, speed_plus) + speed_minus)) * gyro_res_per_degree;
    for (0..3) |axis_index| {
        const span = @as(i32, gyro_plus[axis_index]) - gyro_minus[axis_index];
        ctx.calibration[axis_index] = .{
            .bias = gyro_bias[axis_index],
            .sensitivity = numerator / @as(f32, @floatFromInt(span)),
        };
    }
    for (0..3) |axis_index| {
        const range: i16 = @truncate(@as(i32, acc_plus[axis_index]) - acc_minus[axis_index]);
        const bias: i16 = @truncate(@as(i32, acc_plus[axis_index]) - @divTrunc(range, 2));
        ctx.calibration[3 + axis_index] = .{
            .bias = bias,
            .sensitivity = 2.0 * accel_res_per_g / @as(f32, @floatFromInt(range)),
        };
    }

    ctx.hardware_calibration = true;
    for (ctx.calibration, 0..) |c, index| {
        const divisor: f32 = if (index < 3) 64.0 else 1.0;
        // Some controllers ship bad calibration; the raw conversion is used then.
        if (@abs(@as(i32, c.bias)) > 1024 or @abs(1.0 - c.sensitivity / divisor) > 0.5) {
            ctx.hardware_calibration = false;
        }
    }
    return true;
}

/// LoadCalibrationData. A short calibration report leaves the state unchanged.
fn load_calibration(ctx: *Context, dev: *Device) void {
    _ = load_official_calibration(ctx, dev);
}

/// Converts a raw IMU sample to SDL units: radians per second for the gyroscope
/// and m/s^2 for the accelerometer. Without calibration, gyroscope values are
/// scaled by 64 and accelerometer values are used as-is, as SDL does.
fn apply_calibration(ctx: *const Context, index: usize, value: i16) f32 {
    var result: f32 = undefined;
    if (ctx.hardware_calibration) {
        const c = ctx.calibration[index];
        result = (@as(f32, @floatFromInt(value)) - @as(f32, @floatFromInt(c.bias))) * c.sensitivity;
    } else if (index < 3) {
        result = @as(f32, @floatFromInt(value)) * 64.0;
    } else {
        result = @floatFromInt(value);
    }
    if (index < 3) {
        return (result / gyro_res_per_degree) * std.math.pi / 180.0;
    }
    return (result / accel_res_per_g) * common.standard_gravity;
}

/// Packet filter (HIDAPI_DriverPS5_IsPacketValid). The Nacon and Razer dongles
/// repeat the last state while no controller is paired, so a repeated packet
/// sequence number is dropped. Bluetooth reports must carry a valid CRC.
fn is_packet_valid(ctx: *Context, data: []const u8) bool {
    switch (data[0]) {
        report_state => {
            if (ctx.is_dongle and data.len >= 1 + State.alternate_size) {
                const packet = State.decode(.alternate, data[1..]);
                if (packet.sequence == ctx.last_state.sequence) return false;
                if (ctx.last_state.sequence == 0) {
                    ctx.last_state = packet;
                    return false;
                }
            }
            return true;
        },
        report_bluetooth => return common.bluetooth_crc_valid(0xa1, data),
        else => return false,
    }
}

/// UpdateDevice: drains the input queue and decodes accepted reports, then
/// applies the Bluetooth and dongle timeouts.
pub fn update(ctx: *Context, dev: *Device, out: *Output, env: device.Env) Error!Report {
    var report: Report = .{};
    const now = out.timestamp;
    if (ctx.last_packet_ns == 0) ctx.last_packet_ns = now;

    var buf: [2 * usb_packet_length]u8 = undefined;
    var packet_count: usize = 0;
    var read_failed = false;
    while (true) {
        const maybe = dev.poll_report(&buf) catch {
            read_failed = true;
            break;
        };
        const data = maybe orelse break;
        if (!is_packet_valid(ctx, data)) continue;
        packet_count += 1;
        ctx.last_packet_ns = now;
        if (!dev.is_connected()) continue;

        switch (data[0]) {
            report_state => {
                if (data.len == 10 or data.len == 78) {
                    try handle_state(ctx, out, .simple, data[1..]);
                } else if (ctx.use_alternate_report) {
                    try handle_state(ctx, out, .alternate, data[1..]);
                } else {
                    try handle_state(ctx, out, .full, data[1..]);
                }
            },
            report_bluetooth => {
                // Extended Bluetooth report: enhanced mode is enabled in auto mode now.
                try update_enhanced_on_enhanced_report(ctx, dev);
                const family: Family = if (ctx.use_alternate_report) .alternate else .full;
                try handle_state(ctx, out, family, data[2..]);
                if (ctx.led_reset_state == .pending) try check_pending_led_reset(ctx, dev);
            },
            else => {},
        }
    }

    if (dev.info.bluetooth) {
        if (packet_count == 0) {
            if (now >= ctx.last_packet_ns + bluetooth_disconnect_timeout_ns) {
                // Without enhanced reports, even a dummy effects packet would switch
                // the controller into enhanced mode, so the link is dropped instead.
                if (ctx.enhanced_reports) {
                    try tickle_bluetooth(ctx, dev);
                } else if (dev.is_connected()) {
                    report.disconnect = true;
                }
                ctx.last_packet_ns = now;
            }
        } else if (!dev.is_connected() and !env.has_connected_usb(dev.info.serial)) {
            report.connect = true;
        }
    }

    if (ctx.is_dongle) {
        if (packet_count == 0) {
            if (dev.is_connected() and now >= ctx.last_packet_ns + bluetooth_disconnect_timeout_ns) {
                report.disconnect = true;
            }
        } else if (!dev.is_connected()) {
            report.connect = true;
        }
    }

    if (packet_count == 0 and read_failed) report.read_failed = true;
    return report;
}

/// Waits for the Bluetooth connection animation to finish, then enables the
/// lightbar and pad lights (CheckPendingLEDReset). Without a timer source
/// (no sensors, or alternate reports) the reset is assumed complete.
fn check_pending_led_reset(ctx: *Context, dev: *Device) Error!void {
    var complete = true;
    if (ctx.enhanced_reports and ctx.sensors_supported and !ctx.use_alternate_report) {
        complete = ctx.last_state.sensor_timestamp >= connection_complete_ticks;
    }
    if (!complete) return;
    try tolerate_unsupported(update_effects(ctx, dev, effect_led_reset, false));
    ctx.led_reset_state = .complete;
    try tolerate_unsupported(update_effects(ctx, dev, effect_led | effect_pad_lights, false));
}

/// Sends the dummy Bluetooth effects packet that keeps the link alive.
fn tickle_bluetooth(ctx: *const Context, dev: *Device) Error!void {
    if (!ctx.enhanced_reports) return;
    var data: [78]u8 = @splat(0);
    data[0] = report_bluetooth;
    data[1] = 0x02; // Magic value; no CRC, so the controller ignores the payload.
    _ = try dev.send_report(&data, .none);
}

/// Emits updates for one decoded report. The three families share button and
/// axis handling; the full and alternate families add touchpad, battery and
/// sensor data, and the alternate family adds the guitar extras.
fn handle_state(ctx: *Context, out: *Output, family: Family, body: []const u8) Error!void {
    var state = State.decode(family, body);
    switch (family) {
        .simple => {
            try handle_simple(ctx, out, &state);
        },
        .full, .alternate => {
            if (ctx.report_touchpad) try emit_touchpad(out, &state);
            if (family == .full) {
                if (ctx.report_battery) try emit_battery_full(out, &state);
            } else if (ctx.report_battery and state.battery & 0x0f != 0x0c) {
                // Level 0x0C means the controller does not report a battery level.
                try emit_battery_full(out, &state);
            }
            try handle_common(ctx, out, &state);
            if (family == .alternate) try handle_guitar(ctx, out, &state);
        },
    }
    ctx.last_state = state;
}

fn handle_simple(ctx: *Context, out: *Output, state: *State) Error!void {
    if (ctx.last_state.buttons[0] != state.buttons[0]) {
        try emit_face_and_hat(out, state.buttons[0]);
    }
    if (ctx.last_state.buttons[1] != state.buttons[1]) {
        try emit_shoulders(out, state.buttons[1]);
    }
    if (ctx.last_state.buttons[2] != state.buttons[2]) {
        const data = state.buttons[2] & 0x03;
        try out.button(common.button.guide, data & 0x01 != 0);
        try out.button(button_touchpad, data & 0x02 != 0);
    }
    // Digital trigger bit: a zero analog value reads fully pressed.
    try out.axis(common.axis.left_trigger, common.trigger_with_digital(state.trigger_left, state.buttons[1] & 0x04 != 0));
    try out.axis(common.axis.right_trigger, common.trigger_with_digital(state.trigger_right, state.buttons[1] & 0x08 != 0));
    try emit_sticks(out, state);
}

/// Button, hat and axis handling for the full and alternate families.
fn handle_common(ctx: *Context, out: *Output, state: *State) Error!void {
    if (ctx.last_state.buttons[0] != state.buttons[0]) {
        try emit_face_and_hat(out, state.buttons[0]);
    }
    if (ctx.last_state.buttons[1] != state.buttons[1]) {
        try emit_shoulders(out, state.buttons[1]);
    }
    if (ctx.last_state.buttons[2] != state.buttons[2]) {
        const data = state.buttons[2];
        try out.button(common.button.guide, data & 0x01 != 0);
        try out.button(button_touchpad, data & 0x02 != 0);
        try out.button(button_microphone, data & 0x04 != 0);
        try out.button(button_left_function, data & 0x10 != 0);
        try out.button(button_right_function, data & 0x20 != 0);
        try out.button(button_left_paddle, data & 0x40 != 0);
        try out.button(button_right_paddle, data & 0x80 != 0);
    }
    try out.axis(common.axis.left_trigger, common.trigger_with_digital(state.trigger_left, state.buttons[1] & 0x04 != 0));
    try out.axis(common.axis.right_trigger, common.trigger_with_digital(state.trigger_right, state.buttons[1] & 0x08 != 0));
    try emit_sticks(out, state);

    if (ctx.report_sensors) try emit_sensors(ctx, out, state);
}

fn emit_face_and_hat(out: *Output, byte0: u8) Error!void {
    const face = byte0 >> 4;
    try out.button(common.button.west, face & 0x01 != 0);
    try out.button(common.button.south, face & 0x02 != 0);
    try out.button(common.button.east, face & 0x04 != 0);
    try out.button(common.button.north, face & 0x08 != 0);
    try out.hat(common.hat_from_dpad(byte0 & 0x0f));
}

fn emit_shoulders(out: *Output, byte1: u8) Error!void {
    try out.button(common.button.left_shoulder, byte1 & 0x01 != 0);
    try out.button(common.button.right_shoulder, byte1 & 0x02 != 0);
    try out.button(common.button.back, byte1 & 0x10 != 0);
    try out.button(common.button.start, byte1 & 0x20 != 0);
    try out.button(common.button.left_stick, byte1 & 0x40 != 0);
    try out.button(common.button.right_stick, byte1 & 0x80 != 0);
}

fn emit_sticks(out: *Output, state: *const State) Error!void {
    try out.axis(common.axis.left_x, common.scale_u8(state.left_x));
    try out.axis(common.axis.left_y, common.scale_u8(state.left_y));
    try out.axis(common.axis.right_x, common.scale_u8(state.right_x));
    try out.axis(common.axis.right_y, common.scale_u8(state.right_y));
}

fn emit_touchpad(out: *Output, state: *const State) Error!void {
    for (state.touch_counter, state.touch, 0..) |counter, bytes, finger| {
        const down = counter & 0x80 == 0;
        const pos = common.touch_position(bytes);
        const x = @as(f32, @floatFromInt(pos.x)) * touchpad_scale_x;
        const y = @as(f32, @floatFromInt(pos.y)) * touchpad_scale_y;
        try out.touchpad_finger(0, @intCast(finger), down, x, y, if (down) 1.0 else 0.0);
    }
}

fn emit_battery_full(out: *Output, state: *const State) Error!void {
    const status = (state.battery >> 4) & 0x0f;
    const level = state.battery & 0x0f;
    const battery = common.battery_from_sony(status, level);
    try out.battery(battery.state, battery.percent);
}

/// Motion data for the full and alternate families. The alternate family has a
/// 16-bit timer that wraps; the full family has a 32-bit one.
fn emit_sensors(ctx: *Context, out: *Output, state: *const State) Error!void {
    var sensor_ns: u64 = 0;
    if (ctx.use_alternate_report) {
        const tick: u16 = @truncate(state.sensor_timestamp);
        const last: u16 = @truncate(ctx.last_tick);
        const delta: u32 = if (last <= tick) tick - last else @as(u32, std.math.maxInt(u16)) - last + tick + 1;
        ctx.last_tick = tick;
        ctx.sensor_ticks += delta;
        // The alternate timer counts microseconds.
        sensor_ns = ctx.sensor_ticks * std.time.ns_per_us;
    } else {
        const tick = state.sensor_timestamp;
        const delta: u64 = if (ctx.last_tick < tick) tick - ctx.last_tick else @as(u64, std.math.maxInt(u32)) - ctx.last_tick + tick + 1;
        ctx.last_tick = tick;
        ctx.sensor_ticks += delta;
        // The full timer counts 0.33 us units.
        sensor_ns = ctx.sensor_ticks * std.time.ns_per_us / 3;
    }
    const gyro = [3]f32{
        apply_calibration(ctx, 0, state.gyro[0]),
        apply_calibration(ctx, 1, state.gyro[1]),
        apply_calibration(ctx, 2, state.gyro[2]),
    };
    try out.sensor(.gyro, gyro, sensor_ns);
    const accel = [3]f32{
        apply_calibration(ctx, 3, state.accel[0]),
        apply_calibration(ctx, 4, state.accel[1]),
        apply_calibration(ctx, 5, state.accel[2]),
    };
    try out.sensor(.accel, accel, sensor_ns);
}

/// Guitar inputs for the alternate family: whammy, pickup selector and tilt.
fn handle_guitar(ctx: *Context, out: *Output, state: *const State) Error!void {
    if (ctx.guitar_whammy_supported) {
        try out.axis(common.axis.right_x, common.scale_u8(state.device_specific[1]));
    }
    if (ctx.guitar_effects_selector_supported) {
        const mappings = [5]i16{ 24576, 11008, -1792, -13568, -26880 };
        const selector = state.device_specific[0];
        if (selector < mappings.len) try out.axis(common.axis.right_y, mappings[selector]);
    }
    if (ctx.guitar_tilt_supported) {
        const tilt = [3]f32{ @as(f32, @floatFromInt(state.device_specific[2])) / 255.0 * common.standard_gravity, 0, 0 };
        try out.sensor(.accel, tilt, out.timestamp);
        try out.button(common.button.right_shoulder, state.device_specific[2] > 0xf0);
    }
}
