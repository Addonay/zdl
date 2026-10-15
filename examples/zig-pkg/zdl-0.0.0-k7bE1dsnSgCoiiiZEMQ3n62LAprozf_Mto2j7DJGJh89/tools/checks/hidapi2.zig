//! Compile-only consumer for the HIDAPI driver port (hidapi2 area). Every
//! hardware path is guarded by a process-id test that never holds, so running
//! this binary does nothing.
const std = @import("std");
const zdl = @import("zdl").joystick.hidapi;

pub fn check() !void {
    if (std.os.linux.getpid() != 0) return;
    const allocator = std.heap.page_allocator;

    var registry = zdl.registry.Registry.init(allocator, .{}, .{});
    defer registry.deinit();
    var updates: zdl.common.Updates = .{};
    defer updates.deinit(allocator);
    try registry.scan(&updates, 1);
    try registry.update(&updates, 2);

    var state: zdl.common.State = .{};
    var output: zdl.common.Output = .{
        .allocator = allocator,
        .joystick = null,
        .updates = &updates,
        .state = &state,
        .timestamp = 3,
    };

    // Xbox 360 wired and wireless, Xbox One Bluetooth, Steam, Steam Deck, Joy-Con, DualShock 3.
    _ = &zdl.xbox360.supports;
    _ = &zdl.xbox360.init;
    _ = &zdl.xbox360.layout;
    _ = &zdl.xbox360.open;
    _ = &zdl.xbox360.update;
    _ = &zdl.xbox360.capabilities;
    _ = &zdl.xbox360.set_player_index;
    _ = &zdl.xbox360.rumble;
    _ = &zdl.xbox360w.supports;
    _ = &zdl.xbox360w.init;
    _ = &zdl.xbox360w.update;
    _ = &zdl.xboxone_bt.supports;
    _ = &zdl.xboxone_bt.init;
    _ = &zdl.xboxone_bt.update;
    _ = &zdl.xboxone_bt.rumble;
    _ = &zdl.xboxone_bt.rumble_triggers;
    _ = &zdl.steam.supports;
    _ = &zdl.steam.init;
    _ = &zdl.steam.open;
    _ = &zdl.steam.close;
    _ = &zdl.steam.update;
    _ = &zdl.steam.send_effect;
    _ = &zdl.steam.set_sensors_enabled;
    _ = &zdl.steam.trigger_haptic_pulse_report;
    _ = &zdl.steamdeck.supports;
    _ = &zdl.steamdeck.init;
    _ = &zdl.steamdeck.open;
    _ = &zdl.steamdeck.update;
    _ = &zdl.steamdeck.rumble;
    _ = &zdl.joycon.supports;
    _ = &zdl.joycon.init;
    _ = &zdl.joycon.open;
    _ = &zdl.joycon.update;
    _ = &zdl.joycon.set_player_index;
    _ = &zdl.ps3.supports;
    _ = &zdl.ps3.init;
    _ = &zdl.ps3.open;
    _ = &zdl.ps3.update;
    _ = &zdl.ps3.rumble;
    _ = &zdl.ps3.send_effect;
    _ = &zdl.ps3.set_sensors_enabled;

    // Explicit objects: the Joy-Con pair combiner and the GameCube four-port adapter.
    var pair: zdl.joycon_pair.Pair = .{};
    _ = try pair.handle_left(&output, .{});
    _ = try pair.handle_right(&output, .{ .buttons = .{ 1, 2 }, .stick = 3 });
    _ = zdl.joycon_pair.Pair.layout();
    if (registry.joystick_at(0)) |dev| {
        _ = try pair.poll(&output, dev, dev);
    }

    var adapter: zdl.gamecube.Adapter = .{};
    adapter.reset_axes(0);
    _ = adapter.parse(&.{ 0x21, 0 });
    _ = try adapter.emit(0, &output);
    _ = try adapter.set_rumble(0, 1, 0);
    _ = adapter.take_rumble_report();
    _ = zdl.gamecube.Adapter.init_packet();

    _ = &zdl.steam_constants.id_set_settings_values;
    _ = zdl.device.DriverId;
    _ = zdl.common.Config{ .xbox360_player_lights = false };
}
