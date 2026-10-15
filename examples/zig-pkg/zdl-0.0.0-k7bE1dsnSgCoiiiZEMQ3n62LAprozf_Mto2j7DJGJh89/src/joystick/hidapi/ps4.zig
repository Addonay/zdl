//! DualShock 4 and third-party PlayStation 4-compatible controllers (HIDAPI).
//!
//! Port of SDL_hidapi_ps4.c. Input comes in two report families: the 10-byte or
//! 64-byte USB report (ID 1) and the Bluetooth reports (IDs 17..25). Extended
//! ("enhanced") reports carry the touchpad, battery and motion data and are
//! only produced after the controller is switched into enhanced mode, which the
//! driver does by sending an effects packet. Rumble and LEDs are also effects
//! packets, so they require enhanced mode too. Bluetooth effects packets carry
//! a CRC-32 over the HIDP header and body (0xA2 header).
//!
//! Deliberate differences from SDL:
//! - Report decoding copies the report into a zeroed 54-byte packet, so fields
//!   beyond a short report read as zero where SDL reads stale buffer bytes.
//! - Hints are replaced by `common.Config`, read once per device. Changing the
//!   report interval at runtime is not observed.
//! - Calibration retries are not delayed by 2 ms as in SDL.
//! - Touchpad, battery and sensor values are typed state (`Device.state`,
//!   `Updates.device`); there are no SDL joystick "add" calls.
const std = @import("std");
const hidraw = @import("../../hid/hidraw.zig");
const gamepad = @import("../gamepad.zig");
const joystick = @import("../joystick.zig");
const common = @import("common.zig");
const device = @import("device.zig");

const Error = device.Error;
const Device = device.Device;
const Output = common.Output;
const Report = device.Report;

/// Largest USB packet for HID devices (USB_PACKET_LENGTH).
const usb_packet_length = 64;
/// Time without packets before a Bluetooth controller is probed or dropped.
const bluetooth_disconnect_timeout_ns: u64 = 500 * std.time.ns_per_ms;

const vendor_sony: u16 = 0x054c;
const product_sony_dongle: u16 = 0x0ba0;
const product_sony_strikepad: u16 = 0x05c5;
const vendor_nacon_alt: u16 = 0x3285;
const product_nacon_revolution5_ps4_wireless: u16 = 0x0d16;
const vendor_pdp: u16 = 0x0e6f;
const product_victrix_fs_pro: u16 = 0x0203;
const product_victrix_fs_pro_v2: u16 = 0x0207;
const vendor_razer: u16 = 0x1532;

/// Report IDs and feature reports (EPS4ReportId / EPS4FeatureReportID).
const report_usb_state: u8 = 1;
const report_usb_effects: u8 = 5;
const report_bluetooth_state_first: u8 = 17;
const report_bluetooth_state_last: u8 = 25;
const report_bluetooth_effects: u8 = 17;
const feature_gyro_calibration_usb: u8 = 0x02;
const feature_capabilities: u8 = 0x03;
const feature_gyro_calibration_bt: u8 = 0x05;
const feature_serial_number: u8 = 0x12;

/// Effect enable bits in the output report (k_EPS4Effect*).
const effect_rumble: u8 = 1 << 0;
const effect_led: u8 = 1 << 1;
const effect_led_blink: u8 = 1 << 2;

/// Size of the effects payload (DS4EffectsState_t).
const effects_size = 19;

/// Joystick button index of the touchpad click. SDL defines this as
/// SDL_GAMEPAD_BUTTON_PS4_TOUCHPAD = 11 in the driver, which is not the
/// gamepad enum's TOUCHPAD (20), so it stays a driver-local index.
const button_touchpad: usize = 11;

/// Touchpad scale: 1/1920 across X and 1/920 across Y (the pad is 944 high,
/// but SDL uses 920 because it feels better).
const touchpad_scale_x: f32 = 1.0 / 1920.0;
const touchpad_scale_y: f32 = 1.0 / 920.0;

/// Decoded PS4 state (PS4StatePacket_t). `decode` reads the offsets documented
/// below from a report body that starts right after the report ID.
pub const Packet = struct {
    left_x: u8 = 0,
    left_y: u8 = 0,
    right_x: u8 = 0,
    right_y: u8 = 0,
    /// [0] face buttons (high nibble) and D-pad (low nibble), [1] shoulders,
    /// options, sticks and digital trigger bits, [2] guide and touchpad button.
    buttons: [3]u8 = @splat(0),
    trigger_left: u8 = 0,
    trigger_right: u8 = 0,
    timestamp: u16 = 0,
    gyro: [3]i16 = @splat(0),
    accel: [3]i16 = @splat(0),
    battery: u8 = 0,
    touch_counter: [2]u8 = @splat(0),
    touch: [2][3]u8 = @splat(@splat(0)),
    device_specific: [12]u8 = @splat(0),

    /// Bytes read from a report body. Offsets: sticks 0..3, buttons 4..6,
    /// triggers 7..8, timestamp 9..10, gyro 12..17, accel 18..23, battery 29,
    /// touch counters 34 and 38, touch data 35..37 and 39..41, device specific 42..53.
    pub const wire_size = 54;

    pub fn decode(body: []const u8) Packet {
        var raw: [wire_size]u8 = @splat(0);
        const n = @min(body.len, wire_size);
        @memcpy(raw[0..n], body[0..n]);
        return .{
            .left_x = raw[0],
            .left_y = raw[1],
            .right_x = raw[2],
            .right_y = raw[3],
            .buttons = raw[4..7].*,
            .trigger_left = raw[7],
            .trigger_right = raw[8],
            .timestamp = std.mem.readInt(u16, raw[9..11], .little),
            .gyro = .{
                std.mem.readInt(i16, raw[12..14], .little),
                std.mem.readInt(i16, raw[14..16], .little),
                std.mem.readInt(i16, raw[16..18], .little),
            },
            .accel = .{
                std.mem.readInt(i16, raw[18..20], .little),
                std.mem.readInt(i16, raw[20..22], .little),
                std.mem.readInt(i16, raw[22..24], .little),
            },
            .battery = raw[29],
            .touch_counter = .{ raw[34], raw[38] },
            .touch = .{ raw[35..38].*, raw[39..42].* },
            .device_specific = raw[42..54].*,
        };
    }
};

/// Per-axis IMU calibration: value = (raw - bias) * scale. Before loading,
/// scale holds the sensitivity; after loading it holds the output unit factor.
const Calibration = struct {
    bias: i16 = 0,
    scale: f32 = 1.0,
};

/// Driver state for one PS4-family controller (SDL_DriverPS4_Context).
pub const Context = struct {
    official: bool = false,
    is_dongle: bool = false,
    is_nacon_dongle: bool = false,
    sensors_supported: bool = false,
    lightbar_supported: bool = false,
    vibration_supported: bool = false,
    touchpad_supported: bool = false,
    effects_supported: bool = false,
    guitar_whammy_supported: bool = false,
    guitar_tilt_supported: bool = false,
    guitar_effects_selector_supported: bool = false,
    enhanced_report_hint: common.EnhancedReports = .on,
    enhanced_reports: bool = false,
    enhanced_mode: bool = false,
    enhanced_mode_available: bool = false,
    report_interval: u8 = 4,
    report_sensors: bool = false,
    report_touchpad: bool = false,
    report_battery: bool = false,
    hardware_calibration: bool = false,
    calibration: [6]Calibration = @splat(.{}),
    gyro_numerator: u16 = 1,
    gyro_denominator: u16 = 16,
    accel_numerator: u16 = 1,
    accel_denominator: u16 = 8192,
    /// Time of the last accepted packet, in nanoseconds. Zero before the first update.
    last_packet_ns: u64 = 0,
    player_index: i32 = -1,
    rumble_left: u8 = 0,
    rumble_right: u8 = 0,
    color_set: bool = false,
    led: [3]u8 = @splat(0),
    sensor_ticks: u64 = 0,
    last_tick: u16 = 0,
    valid_crc_packets: u16 = 0,
    last_state: Packet = .{},
};

/// Features the open joystick advertises (SDL_GetJoystickCapabilities).
pub fn capabilities(ctx: *const Context) device.Capabilities {
    var caps: device.Capabilities = .{};
    if (ctx.enhanced_mode_available) {
        caps.rgb_led = ctx.lightbar_supported;
        caps.rumble = ctx.vibration_supported;
    }
    return caps;
}

/// IsSupportedDevice. Known PlayStation-compatible vendors are asked for their
/// capability report when the node is open; otherwise they are accepted and
/// the report decides after the node is opened.
pub fn supports(probe: device.Probe) bool {
    if (probe.gamepad_type == .ps4) return true;
    if (!common.supports_playstation_detection(probe.vendor_id, probe.product_id)) return false;
    const hid = probe.hid orelse return true;
    var data: [usb_packet_length]u8 = undefined;
    const size = common.read_feature(hid, feature_capabilities, &data);
    return size == 48 and data[2] == 0x27;
}

/// Initial layout: 11 buttons, plus the touchpad button when present; six axes;
/// one hat. Matches SDL_HIDAPI_DriverPS4 OpenJoystick.
pub fn layout(ctx: *const Context, dev: *const Device) joystick.Layout {
    _ = dev;
    return .{
        .axes = common.axis.count,
        .buttons = 11 + @as(usize, if (ctx.touchpad_supported) 1 else 0),
        .hats = 1,
        .balls = 0,
    };
}

/// InitDevice: detects the connection type and the controller's capabilities,
/// then decides whether to connect now. Returns false when the controller must
/// wait (a USB copy is present, or a dongle has no paired controller yet).
pub fn init(ctx: *Context, dev: *Device, env: device.Env) Error!bool {
    ctx.* = .{};
    const vendor = dev.info.vendor_id;
    const product = dev.info.product_id;
    var data: [2 * usb_packet_length]u8 = undefined;
    var serial_text: [17]u8 = undefined;
    var serial: []const u8 = "";
    if (dev.info.serial.len == 12) {
        serial = format_serial12(dev.info.serial, &serial_text);
    }

    ctx.is_dongle = vendor == vendor_sony and product == product_sony_dongle;
    if (ctx.is_dongle) {
        if (read_wired_serial(dev, &serial_text)) |text| serial = text;
        ctx.enhanced_reports = true;
    } else if (vendor == vendor_sony and product == product_sony_strikepad) {
        ctx.enhanced_reports = true;
    } else if (vendor == vendor_sony) {
        if (dev.info.bluetooth) {
            // The first report tells us whether the controller is already in
            // enhanced mode (its ID is in the Bluetooth range).
            if (dev.read_report_timeout(&data, 16) catch null) |first| {
                if (first[0] >= report_bluetooth_state_first and first[0] <= report_bluetooth_state_last) {
                    ctx.enhanced_reports = true;
                }
            }
        } else {
            if (read_wired_serial(dev, &serial_text)) |text| serial = text;
            ctx.enhanced_reports = true;
        }
    } else {
        // Third-party controllers appear to be wired and always use enhanced reports.
        ctx.enhanced_reports = true;
    }

    if (vendor == vendor_sony) {
        ctx.official = true;
        ctx.sensors_supported = true;
        ctx.lightbar_supported = true;
        ctx.vibration_supported = true;
        ctx.touchpad_supported = true;
    } else {
        const size = dev.read_feature(feature_capabilities, &data);
        if (size == 48 and data[2] == 0x27) {
            const caps = data[4];
            const device_type = data[5];
            const device_specific_caps = data[24];
            const gyro_num = common.read_u16(&data, 10);
            const gyro_den = common.read_u16(&data, 12);
            const accel_num = common.read_u16(&data, 14);
            const accel_den = common.read_u16(&data, 16);
            if (caps & 0x02 != 0) ctx.sensors_supported = true;
            if (caps & 0x04 != 0) ctx.lightbar_supported = true;
            if (caps & 0x08 != 0) ctx.vibration_supported = true;
            if (caps & 0x40 != 0) ctx.touchpad_supported = true;
            dev.joystick_type = joystick_type_for(device_type);
            if (device_type == 0x01) {
                ctx.guitar_effects_selector_supported = device_specific_caps & 0x01 != 0;
                ctx.guitar_tilt_supported = device_specific_caps & 0x02 != 0;
                ctx.guitar_whammy_supported = device_specific_caps & 0x04 != 0;
            }
            if (gyro_num != 0 and gyro_den != 0) {
                ctx.gyro_numerator = gyro_num;
                ctx.gyro_denominator = gyro_den;
            }
            if (accel_num != 0 and accel_den != 0) {
                ctx.accel_numerator = accel_num;
                ctx.accel_denominator = accel_den;
            }
        } else if (vendor == vendor_razer) {
            // The Raiju does not answer the detection query but has a touchpad and vibration.
            ctx.vibration_supported = true;
            ctx.touchpad_supported = true;
        }
    }

    ctx.effects_supported = ctx.lightbar_supported or ctx.vibration_supported;
    if (vendor == vendor_nacon_alt and product == product_nacon_revolution5_ps4_wireless) {
        ctx.is_nacon_dongle = true;
    }
    if (vendor == vendor_pdp and (product == product_victrix_fs_pro or product == product_victrix_fs_pro_v2)) {
        // Reports lightbar support, but the effects packet hangs the controller on reboot.
        ctx.effects_supported = false;
    }

    dev.gamepad_type = .ps4;
    if (ctx.official) try dev.set_name("PS4 Controller");
    try dev.set_serial(serial);

    if (dev.info.bluetooth and env.has_connected_usb(dev.info.serial)) return false;
    if ((ctx.is_dongle or ctx.is_nacon_dongle) and serial.len == 0) return false;
    return true;
}

/// Maps the capability-report device type to SDL_JoystickType.
fn joystick_type_for(device_type: u8) device.JoystickType {
    return switch (device_type) {
        0x00 => .gamepad,
        0x01 => .guitar,
        0x02 => .drum_kit,
        0x04 => .dance_pad,
        0x06 => .wheel,
        0x07 => .arcade_stick,
        0x08 => .flight_stick,
        else => .unknown,
    };
}

/// "aabbccddeeff" -> "aa-bb-cc-dd-ee-ff" in `buf`, as the SDL serial fallback does.
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

/// Reads the wired serial (feature 0x12). Returns the formatted address when
/// the report carries a non-zero value.
fn read_wired_serial(dev: *Device, buf: *[17]u8) ?[]const u8 {
    var data: [usb_packet_length]u8 = undefined;
    const size = dev.read_feature(feature_serial_number, &data);
    if (size < 7) return null;
    if (data[1] == 0 and data[2] == 0 and data[3] == 0 and data[4] == 0 and data[5] == 0 and data[6] == 0) return null;
    return common.format_reversed_mac(data[1..7], buf);
}

/// OpenJoystick: resets per-connection state and applies the enhanced-report
/// policy. Bluetooth controllers follow the configured setting; wired ones
/// always enable enhanced mode on request.
pub fn open(ctx: *Context, dev: *Device) Error!void {
    ctx.report_sensors = false;
    ctx.report_touchpad = false;
    ctx.rumble_left = 0;
    ctx.rumble_right = 0;
    ctx.color_set = false;
    ctx.last_state = .{};
    ctx.last_packet_ns = 0;
    ctx.report_interval = switch (dev.config.ps4_report_interval_ms) {
        1, 2, 4 => dev.config.ps4_report_interval_ms,
        else => 4,
    };
    const hint: common.EnhancedReports = if (dev.info.bluetooth) dev.config.enhanced_reports else .on;
    try set_enhanced_report_hint(ctx, dev, hint);
}

/// Releases per-connection state (CloseJoystick).
pub fn close(ctx: *Context, dev: *Device) void {
    _ = dev;
    ctx.report_sensors = false;
    ctx.enhanced_mode = false;
    ctx.enhanced_mode_available = false;
}

/// Advertises the enhanced features without switching the controller: touchpad,
/// sensors and battery become available to the host.
fn set_enhanced_mode_available(ctx: *Context, dev: *Device) void {
    if (ctx.enhanced_mode_available) return;
    ctx.enhanced_mode_available = true;
    if (ctx.touchpad_supported) {
        dev.state.add_touchpad(2);
        ctx.report_touchpad = true;
    }
    if (ctx.sensors_supported) {
        const rate = report_rate_hz(ctx);
        dev.state.set_sensor_rate(.gyro, rate);
        dev.state.set_sensor_rate(.accel, rate);
    }
    if (ctx.guitar_tilt_supported) {
        dev.state.set_sensor_rate(.accel, report_rate_hz(ctx));
    }
    if (ctx.official) ctx.report_battery = true;
}

fn report_rate_hz(ctx: *const Context) f32 {
    return @floatFromInt(1000 / @as(u32, ctx.report_interval));
}

/// Switches the controller into enhanced mode by sending an effects packet.
/// Enhanced mode is one-way until the device is closed.
fn set_enhanced_mode(ctx: *Context, dev: *Device) Error!void {
    set_enhanced_mode_available(ctx, dev);
    if (ctx.enhanced_mode) return;
    ctx.enhanced_mode = true;
    try tolerate_unsupported(update_effects(ctx, dev, 0, false));
}

/// SDL's enhanced-report hint handling. `off` does nothing; `on` enters enhanced
/// mode; `auto` only advertises the features.
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

/// Lightbar colors per player slot, the same table as hid-sony in Linux.
const player_colors = [7][3]u8{
    .{ 0x00, 0x00, 0x40 }, // blue
    .{ 0x40, 0x00, 0x00 }, // red
    .{ 0x00, 0x40, 0x00 }, // green
    .{ 0x20, 0x00, 0x20 }, // pink
    .{ 0x02, 0x01, 0x00 }, // orange
    .{ 0x00, 0x01, 0x01 }, // teal
    .{ 0x01, 0x01, 0x01 }, // white
};

/// Builds the effects payload (DS4EffectsState_t) and sends it with `mask`.
fn update_effects(ctx: *Context, dev: *Device, mask: u8, application_usage: bool) Error!void {
    var effects: [effects_size]u8 = @splat(0);
    if (ctx.vibration_supported) {
        effects[0] = ctx.rumble_right;
        effects[1] = ctx.rumble_left;
    }
    if (ctx.lightbar_supported) {
        const rgb = if (ctx.color_set) ctx.led else player_color(ctx.player_index);
        effects[2..5].* = rgb;
    }
    try send_effects(ctx, dev, &effects, mask, application_usage);
}

fn player_color(player_index: i32) [3]u8 {
    const slot: usize = if (player_index >= 0) @intCast(@mod(player_index, 7)) else 0;
    return player_colors[slot];
}

/// Wraps an effects payload in the USB (ID 5, 32 bytes) or Bluetooth (ID 17,
/// 78 bytes, CRC-32) output report and queues it.
fn send_effects(ctx: *Context, dev: *Device, effect: []const u8, mask: u8, application_usage: bool) Error!void {
    if (!ctx.effects_supported) return error.Unsupported;
    if (!ctx.enhanced_mode) {
        if (application_usage) try update_enhanced_on_application_usage(ctx, dev);
        if (!ctx.enhanced_mode) return error.Unsupported;
    }

    var data: [78]u8 = @splat(0);
    var report_size: usize = undefined;
    var offset: usize = undefined;
    if (dev.info.bluetooth and ctx.official) {
        data[0] = report_bluetooth_effects;
        // Magic HID header bits plus the update interval.
        data[1] = 0xc0 | ctx.report_interval;
        data[3] = mask;
        report_size = 78;
        offset = 6;
    } else {
        data[0] = report_usb_effects;
        // Third-party pads expect rumble and LED together, so only official pads
        // get the caller's mask.
        data[1] = if (ctx.official) mask else effect_rumble | effect_led | effect_led_blink;
        report_size = 32;
        offset = 4;
    }
    const n = @min(data.len - offset, effect.len);
    @memcpy(data[offset..][0..n], effect[0..n]);
    if (dev.info.bluetooth) common.write_bluetooth_crc(data[0..report_size]);
    _ = try dev.send_report(data[0..report_size], .report_id);
}

/// Treats `Unsupported` as success, as SDL ignores the return value of
/// effect updates made on the controller's own initiative.
fn tolerate_unsupported(result: Error!void) Error!void {
    result catch |err| if (err != error.Unsupported) return err;
}

/// RumbleJoystick: the high byte of each 16-bit motor value goes into the effects.
pub fn rumble(ctx: *Context, dev: *Device, low: u16, high: u16) Error!void {
    if (!ctx.vibration_supported) return error.Unsupported;
    ctx.rumble_left = @truncate(low >> 8);
    ctx.rumble_right = @truncate(high >> 8);
    try update_effects(ctx, dev, effect_rumble, true);
}

/// SetJoystickLED: stores the color and sends it with the lightbar effect.
pub fn set_led(ctx: *Context, dev: *Device, red: u8, green: u8, blue: u8) Error!void {
    if (!ctx.lightbar_supported) return error.Unsupported;
    ctx.color_set = true;
    ctx.led = .{ red, green, blue };
    try update_effects(ctx, dev, effect_led, true);
}

/// SendJoystickEffect: a raw effects payload from the application.
pub fn send_effect(ctx: *Context, dev: *Device, data: []const u8) Error!void {
    const mask: u8 = if (dev.info.bluetooth and ctx.official)
        effect_rumble | effect_led
    else
        effect_rumble | effect_led | effect_led_blink;
    try send_effects(ctx, dev, data, mask, true);
}

/// SetJoystickSensorsEnabled: loads calibration when enabling and records the
/// request. Guitar tilt sensors work without enhanced mode.
pub fn set_sensors_enabled(ctx: *Context, dev: *Device, enabled: bool) Error!void {
    try update_enhanced_on_application_usage(ctx, dev);
    if ((!ctx.sensors_supported or (enabled and !ctx.enhanced_mode)) and !ctx.guitar_tilt_supported) {
        return error.Unsupported;
    }
    if (enabled) load_calibration(ctx, dev);
    ctx.report_sensors = enabled;
}

/// SetDevicePlayerIndex: stores the index and refreshes the lightbar. SDL does
/// not report failures from this path, so neither does this.
pub fn set_player_index(ctx: *Context, dev: *Device, index: i32) void {
    if (!dev.is_connected()) return;
    ctx.player_index = index;
    tolerate_unsupported(update_effects(ctx, dev, effect_led, false)) catch {};
}

/// Reads the factory IMU calibration (feature 0x02, plus 0x05 on Bluetooth).
/// Returns true when the data is present and plausible. SDL waits 2 ms between
/// retries when the report is all zeros; this port retries immediately.
fn load_official_calibration(ctx: *Context, dev: *Device) bool {
    if (!ctx.official) return false;
    var data: [usb_packet_length]u8 = undefined;
    var have_data = false;
    var tries: usize = 0;
    while (tries < 5) : (tries += 1) {
        var size = dev.read_feature(feature_gyro_calibration_usb, &data);
        if (size < 35) return false;
        if (dev.info.bluetooth) {
            size = dev.read_feature(feature_gyro_calibration_bt, &data);
            if (size < 35) return false;
        }
        for (data[0..size]) |byte| {
            if (byte != 0) {
                have_data = true;
                break;
            }
        }
        if (have_data) break;
    }
    if (!have_data) return false;

    const bt_layout = dev.info.bluetooth or ctx.is_dongle;
    const gyro_bias = [3]i16{ common.read_i16(&data, 1), common.read_i16(&data, 3), common.read_i16(&data, 5) };
    var gyro_plus: [3]i16 = undefined;
    var gyro_minus: [3]i16 = undefined;
    if (bt_layout) {
        gyro_plus = .{ common.read_i16(&data, 7), common.read_i16(&data, 9), common.read_i16(&data, 11) };
        gyro_minus = .{ common.read_i16(&data, 13), common.read_i16(&data, 15), common.read_i16(&data, 17) };
    } else {
        gyro_plus = .{ common.read_i16(&data, 7), common.read_i16(&data, 11), common.read_i16(&data, 15) };
        gyro_minus = .{ common.read_i16(&data, 9), common.read_i16(&data, 13), common.read_i16(&data, 17) };
    }
    const speed_plus = common.read_i16(&data, 19);
    const speed_minus = common.read_i16(&data, 21);
    const acc_plus = [3]i16{ common.read_i16(&data, 23), common.read_i16(&data, 27), common.read_i16(&data, 31) };
    const acc_minus = [3]i16{ common.read_i16(&data, 25), common.read_i16(&data, 29), common.read_i16(&data, 33) };

    const numerator: f32 = @as(f32, @floatFromInt(@as(i32, speed_plus) + speed_minus)) *
        @as(f32, @floatFromInt(ctx.gyro_denominator)) / @as(f32, @floatFromInt(ctx.gyro_numerator));
    for (0..3) |axis_index| {
        const denominator: f32 = @floatFromInt(@abs(@as(i32, gyro_plus[axis_index]) - gyro_bias[axis_index]) +
            @abs(@as(i32, gyro_minus[axis_index]) - gyro_bias[axis_index]));
        if (denominator != 0) {
            ctx.calibration[axis_index] = .{ .bias = gyro_bias[axis_index], .scale = numerator / denominator };
        }
    }
    for (0..3) |axis_index| {
        // The accelerometer is centered between the +1g and -1g readings.
        const range: i16 = @truncate(@as(i32, acc_plus[axis_index]) - acc_minus[axis_index]);
        const bias: i16 = @truncate(@as(i32, acc_plus[axis_index]) - @divTrunc(range, 2));
        const sensitivity = (2.0 * @as(f32, @floatFromInt(ctx.accel_denominator)) / @as(f32, @floatFromInt(ctx.accel_numerator))) /
            @as(f32, @floatFromInt(range));
        ctx.calibration[3 + axis_index] = .{ .bias = bias, .scale = sensitivity };
    }

    ctx.hardware_calibration = true;
    for (ctx.calibration) |c| {
        // Some controllers ship bad calibration; fall back to the defaults then.
        if (@abs(@as(i32, c.bias)) > 1024 or @abs(1.0 - c.scale) > 0.5) ctx.hardware_calibration = false;
    }
    return ctx.hardware_calibration;
}

/// Loads calibration (or defaults) and converts every IMU axis to SDL's units:
/// radians per second for the gyroscope and m/s^2 for the accelerometer.
fn load_calibration(ctx: *Context, dev: *Device) void {
    if (!load_official_calibration(ctx, dev)) {
        for (&ctx.calibration) |*c| c.* = .{ .bias = 0, .scale = 1.0 };
    }
    const strikepad = dev.info.vendor_id == vendor_sony and dev.info.product_id == product_sony_strikepad;
    for (&ctx.calibration, 0..) |*c, index| {
        var scale: f64 = c.scale;
        if (index < 3) {
            scale *= (@as(f64, @floatFromInt(ctx.gyro_numerator)) / @as(f64, @floatFromInt(ctx.gyro_denominator))) * std.math.pi / 180.0;
            // The Armor-X Pro delivers half the rotation.
            if (strikepad) scale *= 2.0;
        } else {
            scale *= (@as(f64, @floatFromInt(ctx.accel_numerator)) / @as(f64, @floatFromInt(ctx.accel_denominator))) * @as(f64, common.standard_gravity);
            // The Armor-X Pro delivers half the acceleration, mirrored on every axis.
            if (strikepad) scale *= -2.0;
        }
        c.scale = @floatCast(scale);
    }
}

fn apply_calibration(ctx: *const Context, index: usize, value: i16) f32 {
    const c = ctx.calibration[index];
    return (@as(f32, @floatFromInt(value)) - @as(f32, @floatFromInt(c.bias))) * c.scale;
}

/// Packet filter (HIDAPI_DriverPS4_IsPacketValid). Returns false for packets that
/// must be ignored: duplicates on the Nacon dongle, reports that say no
/// controller is connected, and Bluetooth reports with a bad CRC once the
/// stream has been valid.
fn is_packet_valid(ctx: *Context, data: []const u8) bool {
    switch (data[0]) {
        report_usb_state => {
            if (data.len == 10) return true;
            if (ctx.is_nacon_dongle and data.len >= 1 + Packet.wire_size) {
                const packet = Packet.decode(data[1..]);
                if (packet.timestamp == ctx.last_state.timestamp) return false;
                if (std.mem.allEqual(i16, &ctx.last_state.accel, 0)) {
                    // Nothing to compare against yet: remember this packet and wait for the next one.
                    ctx.last_state = packet;
                    return false;
                }
            }
            // Dongle bit 2 of byte 31 is set while no controller is paired.
            if (data.len >= 64 and data[31] & 0x04 == 0) return true;
            return false;
        },
        report_bluetooth_state_first...report_bluetooth_state_last => {
            // Bluetooth reports carry two extra bytes; the first says whether HID data is present.
            if (data.len >= 78 and data[1] & 0x80 != 0) {
                if (common.bluetooth_crc_valid(0xa1, data[0..78])) {
                    ctx.valid_crc_packets +%= 1;
                } else {
                    if (ctx.valid_crc_packets > 0) ctx.valid_crc_packets -= 1;
                    if (ctx.valid_crc_packets >= 3) return false;
                }
                return true;
            }
            return false;
        },
        else => return false,
    }
}

/// UpdateDevice: drains the input queue, decodes each accepted report, and
/// handles Bluetooth and dongle connection timeouts.
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
            report_usb_state => try handle_state(ctx, dev, out, Packet.decode(data[1..]), data.len - 1),
            report_bluetooth_state_first...report_bluetooth_state_last => {
                // Extended report: enhanced mode may now be enabled in auto mode.
                try update_enhanced_on_enhanced_report(ctx, dev);
                try handle_state(ctx, dev, out, Packet.decode(data[3..]), data.len - 3);
            },
            else => {},
        }
    }

    if (dev.info.bluetooth) {
        if (packet_count == 0) {
            if (now >= ctx.last_packet_ns + bluetooth_disconnect_timeout_ns) {
                // A dummy output report wakes the Bluetooth stack.
                try tickle_bluetooth(ctx, dev);
                ctx.last_packet_ns = now;
            }
        } else if (!dev.is_connected() and !env.has_connected_usb(dev.info.serial)) {
            report.connect = true;
        }
    }

    if (ctx.is_dongle or ctx.is_nacon_dongle) {
        if (packet_count == 0) {
            if (dev.is_connected() and now >= ctx.last_packet_ns + bluetooth_disconnect_timeout_ns) {
                report.disconnect = true;
            }
        } else if (!dev.is_connected()) {
            // A dongle reports its paired controller's address only once it is paired.
            var serial_text: [17]u8 = undefined;
            if (read_wired_serial(dev, &serial_text)) |text| try dev.set_serial(text);
            report.connect = true;
        }
    }

    if (packet_count == 0 and read_failed) report.read_failed = true;
    return report;
}

/// Sends the dummy Bluetooth effects packet (no effect, but it keeps the link alive).
fn tickle_bluetooth(ctx: *const Context, dev: *Device) Error!void {
    if (!ctx.enhanced_reports) return;
    var data: [78]u8 = @splat(0);
    data[0] = report_bluetooth_effects;
    data[1] = 0xc0; // Magic HID header bits; no CRC is set, so the controller ignores the payload.
    _ = try dev.send_report(&data, .none);
}

/// HIDAPI_DriverPS4_HandleStatePacket. Emits button, hat, axis, touchpad, battery
/// and sensor updates for the packet, comparing against the previous packet
/// where SDL does. `size` is the length of the body the packet was decoded from.
fn handle_state(ctx: *Context, dev: *Device, out: *Output, packet_in: Packet, size: usize) Error!void {
    var packet = packet_in;
    const extended = size > 9;

    if (extended and ctx.report_touchpad and ctx.enhanced_reports) {
        for (packet.touch_counter, packet.touch, 0..) |counter, bytes, finger| {
            const down = counter & 0x80 == 0;
            const pos = common.touch_position(bytes);
            const x = @as(f32, @floatFromInt(pos.x)) * touchpad_scale_x;
            const y = @as(f32, @floatFromInt(pos.y)) * touchpad_scale_y;
            try out.touchpad_finger(0, @intCast(finger), down, x, y, if (down) 1.0 else 0.0);
        }
    }

    if (ctx.last_state.buttons[0] != packet.buttons[0]) {
        const face = packet.buttons[0] >> 4;
        try out.button(common.button.west, face & 0x01 != 0);
        try out.button(common.button.south, face & 0x02 != 0);
        try out.button(common.button.east, face & 0x04 != 0);
        try out.button(common.button.north, face & 0x08 != 0);
        try out.hat(common.hat_from_dpad(packet.buttons[0] & 0x0f));
    }

    if (ctx.last_state.buttons[1] != packet.buttons[1]) {
        const data = packet.buttons[1];
        try out.button(common.button.left_shoulder, data & 0x01 != 0);
        try out.button(common.button.right_shoulder, data & 0x02 != 0);
        try out.button(common.button.back, data & 0x10 != 0);
        try out.button(common.button.start, data & 0x20 != 0);
        try out.button(common.button.left_stick, data & 0x40 != 0);
        try out.button(common.button.right_stick, data & 0x80 != 0);
    }

    // Some fightsticks (Victrix FS Pro) only report digital trigger bits, so the
    // analog value is forced to full when the digital bit is set and it reads zero.
    if (packet.buttons[1] & 0x0c != 0) {
        const data = packet.buttons[1];
        if (data & 0x04 != 0 and packet.trigger_left == 0) packet.trigger_left = 255;
        if (data & 0x08 != 0 and packet.trigger_right == 0) packet.trigger_right = 255;
    }

    if (ctx.last_state.buttons[2] != packet.buttons[2]) {
        const data = packet.buttons[2] & 0x03;
        try out.button(common.button.guide, data & 0x01 != 0);
        try out.button(button_touchpad, data & 0x02 != 0);
    }

    try out.axis(common.axis.left_trigger, common.scale_u8(packet.trigger_left));
    try out.axis(common.axis.right_trigger, common.scale_u8(packet.trigger_right));
    try out.axis(common.axis.left_x, common.scale_u8(packet.left_x));
    try out.axis(common.axis.left_y, common.scale_u8(packet.left_y));
    try out.axis(common.axis.right_x, common.scale_u8(packet.right_x));
    try out.axis(common.axis.right_y, common.scale_u8(packet.right_y));

    if (extended and ctx.report_battery and ctx.enhanced_reports) {
        const level = packet.battery & 0x0f;
        if (packet.battery & 0x10 != 0) {
            // Charging: levels 0..10 are in progress, 11 is full.
            if (level <= 10) {
                try out.battery(.charging, @min(level * 10 + 5, 100));
            } else if (level == 11) {
                try out.battery(.charged, 100);
            } else {
                try out.battery(.unknown, 0);
            }
        } else {
            try out.battery(.on_battery, @min(level * 10 + 5, 100));
        }
    }

    if (extended and ctx.report_sensors) {
        const tick = packet.timestamp;
        const delta: u16 = if (ctx.last_tick <= tick)
            tick - ctx.last_tick
        else
            @truncate(@as(u32, std.math.maxInt(u16)) - ctx.last_tick + tick + 1);
        ctx.sensor_ticks += @as(u64, delta);
        ctx.last_tick = tick;
        // The sensor clock counts 5.33 us units.
        const sensor_ns = ctx.sensor_ticks * std.time.ns_per_us * 16 / 3;
        const gyro = [3]f32{
            apply_calibration(ctx, 0, packet.gyro[0]),
            apply_calibration(ctx, 1, packet.gyro[1]),
            apply_calibration(ctx, 2, packet.gyro[2]),
        };
        try out.sensor(.gyro, gyro, sensor_ns);
        const accel = [3]f32{
            apply_calibration(ctx, 3, packet.accel[0]),
            apply_calibration(ctx, 4, packet.accel[1]),
            apply_calibration(ctx, 5, packet.accel[2]),
        };
        try out.sensor(.accel, accel, sensor_ns);
    }

    if (ctx.guitar_whammy_supported) {
        try out.axis(common.axis.right_x, common.scale_u8(packet.device_specific[1]));
    }
    if (ctx.guitar_effects_selector_supported) {
        // Aligns the pickup selector with the PS3 instrument values.
        const mappings = [5]i16{ 24576, 11008, -1792, -13568, -26880 };
        const selector = packet.device_specific[0];
        if (selector < mappings.len) try out.axis(common.axis.right_y, mappings[selector]);
    }
    if (ctx.guitar_tilt_supported) {
        const tilt = [3]f32{ @as(f32, @floatFromInt(packet.device_specific[2])) / 255.0 * common.standard_gravity, 0, 0 };
        try out.sensor(.accel, tilt, out.timestamp);
        try out.button(common.button.right_shoulder, packet.device_specific[2] > 0xf0);
    }

    ctx.last_state = packet;
    _ = dev;
}
