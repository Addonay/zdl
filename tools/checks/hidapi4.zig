//! Compile-only consumer for the simple vendor pads (Stadia, Amazon Luna and
//! NVIDIA SHIELD) and the GameCube adapter's PC mode. Every hardware path is
//! guarded by a process-id test that never holds, so running this binary does
//! nothing.
const std = @import("std");
const zdl = @import("zdl");

pub fn check() !void {
    if (std.os.linux.getpid() != 0) return;
    const allocator = std.heap.page_allocator;
    const hid = zdl.joystick.hidapi;

    // Stadia: driver hooks and the pure report decoder.
    _ = &hid.stadia.supports;
    _ = &hid.stadia.init;
    _ = &hid.stadia.layout;
    _ = &hid.stadia.open;
    _ = &hid.stadia.capabilities;
    _ = &hid.stadia.rumble;
    _ = &hid.stadia.update;
    _ = &hid.stadia.stick_axis;

    // Amazon Luna: both transports and the Bluetooth trigger decoder.
    _ = &hid.luna.supports;
    _ = &hid.luna.init;
    _ = &hid.luna.layout;
    _ = &hid.luna.open;
    _ = &hid.luna.capabilities;
    _ = &hid.luna.rumble;
    _ = &hid.luna.update;
    _ = &hid.luna.stick_axis;
    _ = &hid.luna.bluetooth_trigger;

    // NVIDIA SHIELD: hooks, the command path and both state decoders.
    _ = &hid.shield.supports;
    _ = &hid.shield.init;
    _ = &hid.shield.layout;
    _ = &hid.shield.open;
    _ = &hid.shield.capabilities;
    _ = &hid.shield.rumble;
    _ = &hid.shield.send_effect;
    _ = &hid.shield.update;

    // GameCube adapter: PC-mode hooks and the standalone adapter methods.
    _ = &hid.gamecube.close;
    _ = &hid.gamecube.rumble_slot;
    _ = &hid.gamecube.capabilities_slot;
    var adapter: hid.gamecube.Adapter = .{ .pc_mode = true, .pc_rumble_allowed = true };
    adapter.parse_pc(0, &.{ 0, 0, 0, 0, 0, 0, 0, 0, 0 }, true);
    _ = try adapter.set_pc_rumble(0, 1, 0);
    _ = adapter.pc_rumble_refresh(0);

    // The fixture runs the decoders on a joystick model without any device.
    var sink = try hid.common.TestSink.init(allocator, .{ .axes = 6, .buttons = 13, .hats = 1 });
    defer sink.deinit();
    var out = sink.output(1);
    var stadia_ctx: hid.stadia.Context = .{};
    try hid.stadia.decode_report(&stadia_ctx, &out, &.{ 0x03, 0, 0, 0, 0, 0, 0, 0, 0, 0 });
    var luna_ctx: hid.luna.Context = .{};
    try hid.luna.decode_usb(&luna_ctx, &out, &.{ 0x03, 0, 0, 0, 0, 0, 0, 0, 0, 0 });
    try hid.luna.decode_bluetooth(&luna_ctx, &out, &.{ 0x02, 1 });
}
