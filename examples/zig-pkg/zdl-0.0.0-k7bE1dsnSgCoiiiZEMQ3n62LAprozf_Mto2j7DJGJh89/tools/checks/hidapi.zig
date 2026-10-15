//! Compile-only consumer for the HIDAPI joystick port. Every hardware path is
//! guarded by a process-id test that never holds, so running this binary does nothing.
const std = @import("std");
const zdl = struct {
    const common = @import("zdl").joystick.hidapi.common;
    const rumble = @import("zdl").joystick.hidapi.rumble;
    const device = @import("zdl").joystick.hidapi.device;
    const registry = @import("zdl").joystick.hidapi.registry;
    const ps4 = @import("zdl").joystick.hidapi.ps4;
    const ps5 = @import("zdl").joystick.hidapi.ps5;
    const xboxone = @import("zdl").joystick.hidapi.xboxone;
    const switch_pro = @import("zdl").joystick.hidapi.switch_pro;
    const joystick_model = @import("zdl").joystick.joystick;
};

pub fn check() !void {
    if (std.os.linux.getpid() != 0) return;
    const allocator = std.heap.page_allocator;

    var registry = zdl.registry.Registry.init(allocator, .{}, .{});
    defer registry.deinit();
    var updates: zdl.common.Updates = .{};
    defer updates.deinit(allocator);
    try registry.scan(&updates, 1);
    try registry.update(&updates, 2);
    _ = registry.joystick_count();

    if (registry.joystick_at(0)) |dev| {
        _ = dev.is_connected();
        _ = dev.capabilities();
        _ = dev.state;
        _ = dev.info.name;
        dev.rumble_motors(0xffff, 0) catch {};
        dev.rumble_triggers(0xffff, 0) catch {};
        dev.set_led(1, 2, 3) catch {};
        dev.send_effect(&.{ 1, 2, 3 }) catch {};
        dev.set_sensors_enabled(true) catch {};
        dev.set_player_index(0);
        _ = try dev.send_report(&.{ 1, 2, 3 }, .none);
        _ = try dev.send_report(&.{ 1, 2, 3 }, .report_id);
    }

    var rumble_queue: zdl.rumble.RumbleQueue = .{};
    defer rumble_queue.deinit(allocator);
    _ = try rumble_queue.push(allocator, &.{ 0x09, 0x00 }, .{ .effect_bits = 1 });

    var state: zdl.common.State = .{};
    state.add_touchpad(2);
    state.set_sensor_rate(.gyro, 250.0);

    var js = try zdl.joystick_model.Joystick.init(allocator, zdl.device.Guid{}, .{ .axes = 6, .buttons = 16, .hats = 1 });
    defer js.deinit();
    var output: zdl.common.Output = .{
        .allocator = allocator,
        .joystick = &js,
        .updates = &updates,
        .state = &state,
        .timestamp = 3,
    };
    try output.button(0, true);
    try output.axis(0, 1);
    try output.hat(zdl.joystick_model.Hat.centered);
    try output.touchpad_finger(0, 0, true, 0.5, 0.5, 1.0);
    try output.sensor(.gyro, .{ 0, 0, 0 }, 4);
    try output.battery(.charging, 50);

    _ = zdl.common.scale_u8(1);
    _ = zdl.common.hat_from_dpad(0);
    _ = zdl.common.bluetooth_crc(0xa2, &.{ 1, 2, 3 });
    _ = zdl.common.bluetooth_crc_valid(0xa1, &.{ 1, 2, 3, 4, 5 });
    var mac_text: [17]u8 = undefined;
    _ = zdl.common.format_reversed_mac(&.{ 1, 2, 3, 4, 5, 6 }, &mac_text);

    // Keep every driver entry point analyzed even when no device is claimed.
    _ = &zdl.ps4.supports;
    _ = &zdl.ps4.init;
    _ = &zdl.ps4.update;
    _ = &zdl.ps4.capabilities;
    _ = &zdl.ps5.supports;
    _ = &zdl.ps5.init;
    _ = &zdl.ps5.update;
    _ = &zdl.ps5.capabilities;
    _ = &zdl.xboxone.supports;
    _ = &zdl.xboxone.init;
    _ = &zdl.xboxone.update;
    _ = &zdl.xboxone.capabilities;
    _ = &zdl.switch_pro.supports;
    _ = &zdl.switch_pro.init;
    _ = &zdl.switch_pro.update;
    _ = &zdl.switch_pro.capabilities;
}
