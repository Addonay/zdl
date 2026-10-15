//! Compile-only consumer for the joystick port. Every hardware path is guarded
//! by a process-id test that never holds, so running this binary does nothing.
const std = @import("std");
const zdl = @import("zdl").joystick;

const Owner = struct {
    rumbled: bool = false,

    pub fn rumble(self: *Owner, low: u16, high: u16) bool {
        self.rumbled = low != 0 or high != 0;
        return true;
    }
};

pub fn check() !void {
    if (std.os.linux.getpid() != 0) return;
    const allocator = std.heap.page_allocator;

    var db = try zdl.gamepad.Database.init(allocator);
    defer db.deinit();
    _ = try db.add("03000000c82d00001930000011010000,Test,a:b0,b:b1,platform:Linux", .user, .{});
    _ = try db.load_text("", .{});

    var owner: Owner = .{};
    var virt = try zdl.virtual.Virtual(Owner).init(allocator, &owner, .{ .name = "test", .axes = 2, .buttons = 4, .hats = 1, .balls = 1 });
    defer virt.deinit();
    var changes: std.ArrayList(zdl.joystick.Change) = .empty;
    defer changes.deinit(allocator);
    try virt.set_axis(&changes, 1, 0, 1000);
    try virt.set_button(&changes, 2, 0, true);
    try virt.set_hat(&changes, 3, 0, .{ .up = true });
    try virt.set_ball(&changes, 4, 0, 2, 3);
    _ = virt.rumble(1, 0);
    virt.request_update();

    var guid_info = zdl.joystick.guid_info(virt.joystick_state().guid);
    _ = &guid_info;
    _ = zdl.joystick.guess_controller_type(0x045e, 0x028e);
    _ = zdl.gamepad.joystick_name;

    var gamepad_changes: std.ArrayList(zdl.gamepad.Gamepad.Change) = .empty;
    defer gamepad_changes.deinit(allocator);
    if (db.find(virt.state.guid, false)) |entry| {
        var gamepad = try zdl.gamepad.Gamepad.init(allocator, entry, &virt.state, "Test");
        defer gamepad.deinit();
        try gamepad.process(allocator, &gamepad_changes, .{ .timestamp = 5, .event = .{ .button = .{ .index = 0, .down = true } } });
        _ = gamepad.read_button(&virt.state, .south);
        _ = gamepad.read_axis(&virt.state, .left_x);
        _ = gamepad.has_axis(.left_x);
        _ = gamepad.has_button(.south);
        _ = gamepad.button_label(.south);
    }
    _ = zdl.gamepad.type_from_guid(virt.state.guid, "Test");
    _ = zdl.gamepad.ButtonLabel.for_type(.xbox360, .south);
    _ = zdl.gamepad.Button.from_name("a", false, false);
    _ = zdl.gamepad.Axis.from_name("leftx");
    _ = zdl.gamepad.GamepadType.from_name("ps4");
    _ = zdl.joystick.guid_uses_version(virt.state.guid);
    _ = virt.state.take_ball(0);
    try virt.state.recenter(allocator, &changes, 9);
    const name = try zdl.gamepad.joystick_name(allocator, 0x045e, 0x028e, null, null);
    allocator.free(name);
    const bindings = try zdl.gamepad.parse_bindings(allocator, "a:b0,leftx:a0");
    allocator.free(bindings);

    var device_changes: std.ArrayList(zdl.joystick.Change) = .empty;
    defer device_changes.deinit(allocator);
    const devices = try zdl.linux_evdev.scan(allocator, .{});
    defer {
        for (devices) |*device| device.deinit();
        allocator.free(devices);
    }
    for (devices) |*device| {
        var js = try device.create_joystick(allocator);
        defer js.deinit();
        try device.poll(allocator, &js, &device_changes);
    }
}
