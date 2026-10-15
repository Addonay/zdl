//! Compile-only consumer for message boxes, joystick rumble and automatic
//! gamepad mappings. Every hardware, process or device path is guarded by a
//! process-id test that never holds, so running this binary does nothing.
const std = @import("std");
const zdl = struct {
    const message_box = @import("zdl").messagebox.message_box;
    const zenity = @import("zdl").messagebox.zenity;
    const rumble = @import("zdl").joystick.rumble;
    const auto_mapping = @import("zdl").joystick.auto_mapping;
    const linux_evdev = @import("zdl").joystick.linux_evdev;
    const joystick = @import("zdl").joystick.joystick;
    const gamepad = @import("zdl").joystick.gamepad;
};

/// A rumble backend that records calls, used with `rumble.Rumble`.
const Backend = struct {
    calls: usize = 0,
    fail: bool = false,

    pub fn rumble(self: *Backend, low: u16, high: u16) error{Failed}!void {
        _ = low;
        _ = high;
        if (self.fail) return error.Failed;
        self.calls += 1;
    }
};

pub fn check() !void {
    if (std.os.linux.getpid() != 0) return;
    const allocator = std.heap.page_allocator;
    var threaded: std.Io.Threaded = .init_single_threaded;
    const io = threaded.io();

    // Rumble bookkeeping against a fake backend.
    var backend: Backend = .{};
    var state: zdl.rumble.Rumble = .{};
    try state.set(&backend, 100, 0x8000, 0x4000, 500);
    try state.update(&backend, 300);
    try state.set(&backend, 310, 0x8000, 0x4000, 0);
    try state.stop(&backend, 400);
    _ = state.next_deadline_ms();
    _ = zdl.rumble.max_duration_ms;

    // Evdev force-feedback rumble on a device value that is never opened.
    var name_storage = "pad".*;
    var device: zdl.linux_evdev.Device = .{
        .allocator = allocator,
        .fd = -1,
        .name = &name_storage,
        .guid = zdl.joystick.create_guid(.{ .bus = 0x03, .vendor = 0x045e, .product = 0x028e }),
        .options = .{},
    };
    _ = device.supports_rumble();
    try state.set(&device, 500, 0xffff, 0, 100);
    try state.update(&device, 600);
    device.rumble(0, 0) catch {};

    // Device enumeration uses the extended error set (Unsupported).
    if (zdl.linux_evdev.scan(allocator, .{})) |devices| {
        for (devices) |*opened| opened.deinit();
        allocator.free(devices);
    } else |_| {}

    // Automatic mapping text parses with the gamepad database.
    if (try zdl.auto_mapping.text(allocator, &device, .{ .driver = "xpad" })) |text| {
        defer allocator.free(text);
        var db = try zdl.gamepad.Database.init(allocator);
        defer db.deinit();
        _ = try db.add(text, .default, .{});
    }
    var raw = zdl.auto_mapping.generate(&device, .{}) orelse return;
    _ = raw.get(.a);
    raw.set(.a, .{ .button = 0 });
    _ = zdl.auto_mapping.Half.positive;

    // Message boxes: flags, simple form, zenity version parsing and dialog.
    const flags: zdl.message_box.Flags = .{ .error_dialog = true, .buttons_left_to_right = true };
    const data = zdl.message_box.simple(flags, "title", "message");
    _ = data.flags.severity();
    _ = zdl.zenity.Version.parse("4.0.0");
    _ = zdl.zenity.show(allocator, io, data) catch null;
    _ = zdl.message_box.Button{ .id = 1, .text = "Retry", .flags = .{ .return_key_default = true } };
}
