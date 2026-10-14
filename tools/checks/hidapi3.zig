//! Compile-only consumer for the hidapi3 area (multi-joystick nodes, GameCube
//! and combined Joy-Con drivers). Every hardware path is guarded by a process-id
//! test that never holds, so running this binary does nothing.
const std = @import("std");
const zdl = struct {
    const joystick = @import("zdl").joystick.joystick;
    const common = @import("zdl").joystick.hidapi.common;
    const rumble = @import("zdl").joystick.hidapi.rumble;
    const device = @import("zdl").joystick.hidapi.device;
    const registry = @import("zdl").joystick.hidapi.registry;
    const gamecube = @import("zdl").joystick.hidapi.gamecube;
    const joycon = @import("zdl").joystick.hidapi.joycon;
    const joycon_pair = @import("zdl").joystick.hidapi.joycon_pair;
    const ps4 = @import("zdl").joystick.hidapi.ps4;
    const ps5 = @import("zdl").joystick.hidapi.ps5;
    const xboxone = @import("zdl").joystick.hidapi.xboxone;
    const switch_pro = @import("zdl").joystick.hidapi.switch_pro;
    const xbox360 = @import("zdl").joystick.hidapi.xbox360;
    const xbox360w = @import("zdl").joystick.hidapi.xbox360w;
    const xboxone_bt = @import("zdl").joystick.hidapi.xboxone_bt;
    const steam = @import("zdl").joystick.hidapi.steam;
    const steam_constants = @import("zdl").joystick.hidapi.steam_constants;
    const steamdeck = @import("zdl").joystick.hidapi.steamdeck;
    const ps3 = @import("zdl").joystick.hidapi.ps3;
};

pub fn check() !void {
    if (std.os.linux.getpid() != 0) return;
    const allocator = std.heap.page_allocator;

    var registry = zdl.registry.Registry.init(allocator, .{}, .{ .combine_joycons = true });
    defer registry.deinit();
    var updates: zdl.common.Updates = .{};
    defer updates.deinit(allocator);
    try registry.scan(&updates, 1);
    try registry.update(&updates, 2);
    _ = registry.joystick_count();
    _ = registry.connected_joystick_count();

    if (registry.joystick_at(0)) |dev| {
        _ = dev.is_connected();
        _ = dev.connected_count();
        _ = dev.joystick_slot(0);
        _ = dev.slot_connected(1);
        _ = dev.slot_capabilities(0);
        _ = dev.capabilities();
        try dev.rumble_slot_motors(3, 0xffff, 0);
        try dev.rumble_motors(0xffff, 0);
        try dev.attach_slot(0, &updates);
        try dev.detach_slot(0, &updates, 3);
        try dev.disconnect_with_recenter(&updates, 3);
        _ = dev.parent;
    }

    var state: zdl.common.State = .{};
    var js = try zdl.joystick.Joystick.init(allocator, zdl.device.Guid{}, .{ .axes = 6, .buttons = 16, .hats = 1 });
    defer js.deinit();
    var output: zdl.common.Output = .{
        .allocator = allocator,
        .joystick = &js,
        .updates = &updates,
        .state = &state,
        .timestamp = 3,
    };
    var port_out = output.with_joystick(null);
    try port_out.button(0, true);
    _ = output.with_joystick(&js);

    // GameCube adapter: driver hooks and the standalone adapter object.
    _ = &zdl.gamecube.supports;
    _ = &zdl.gamecube.init;
    _ = &zdl.gamecube.layout;
    _ = &zdl.gamecube.update;
    _ = &zdl.gamecube.rumble_slot;
    _ = &zdl.gamecube.capabilities_slot;
    var adapter: zdl.gamecube.Adapter = .{};
    adapter.reset_axes(0);
    _ = adapter.parse(&.{ 0x21, 0 });
    try adapter.emit(0, &output);
    try adapter.set_rumble(0, 1, 0);
    _ = adapter.take_rumble_report();
    _ = zdl.gamecube.Adapter.init_packet();

    // Combined Joy-Con pair: standalone combiner and driver hooks.
    var pair: zdl.joycon_pair.Pair = .{};
    try pair.handle_left(&output, .{});
    try pair.handle_right(&output, .{ .buttons = .{ 1, 2 }, .stick = 3 });
    _ = zdl.joycon_pair.Pair.layout();
    _ = &zdl.joycon_pair.supports;
    _ = &zdl.joycon_pair.update;
    var pair_ctx: zdl.joycon_pair.Context = .{};
    _ = &pair_ctx;
    if (registry.joystick_at(0)) |dev| {
        _ = try pair.poll(&output, dev, dev);
        var combined = try zdl.device.Device.combined(allocator, dev, dev);
        defer combined.deinit();
    }

    // Joy-Con full mode, Steam Controller Bluetooth segments and the pair's rumble and sensors.
    var jc: zdl.joycon.Context = .{};
    _ = &jc;
    _ = zdl.joycon.power_from_report(&@as([48]u8, @splat(0)));
    _ = zdl.joycon.stick_x(&.{ 1, 2 });
    _ = zdl.joycon.stick_y(&.{ 1, 2 });
    _ = &zdl.joycon.update;
    _ = &zdl.joycon.rumble;
    _ = &zdl.joycon.set_led;
    _ = &zdl.joycon.set_sensors_enabled;
    _ = &zdl.joycon.capabilities;
    _ = &zdl.joycon_pair.capabilities;
    _ = &zdl.joycon_pair.rumble;
    _ = &zdl.joycon_pair.set_led;
    _ = &zdl.joycon_pair.set_sensors_enabled;
    _ = &zdl.switch_pro.scale_imu;
    _ = &zdl.switch_pro.next_imu_timestamps;
    _ = &zdl.steam.update;
    var assembler: zdl.steam.Assembler = .{};
    assembler.reset();
    _ = assembler.write(&.{ 3, 0x80 | 0x40, 1, 2, 3 });
    _ = zdl.steam.supports;

    // Driver-table entries that the registry dispatches to.
    _ = zdl.device.DriverId.gamecube;
    _ = zdl.device.DriverId.joycon_pair;
    _ = zdl.device.max_joystick_slots;
    _ = zdl.common.DeviceEvent{ .slot_added = 0 };
    _ = zdl.common.DeviceEvent{ .slot_removed = 1 };
    _ = zdl.device.Probe;
}
