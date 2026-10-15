const std = @import("std");
const zdl = struct {
    const model = @import("zdl").tray.model;
    const sni = @import("zdl").tray.sni;
    const connection = @import("zdl").dbus.connection;
    const surface = @import("zdl").surface;
};

const Context = *u32;

fn on_click(ctx: Context, tray: *zdl.model.Tray(Context)) void {
    _ = tray;
    ctx.* += 1;
}

fn on_action(ctx: Context, entry: *zdl.model.Entry(Context)) void {
    _ = entry;
    ctx.* += 1;
}

// Compile-only consumer. The guard below returns before any call that would
// touch the bus, the library or the tray watcher.
pub fn check() !void {
    if (std.os.linux.getpid() != 0) return;
    const gpa = std.heap.page_allocator;
    var counter: u32 = 0;

    var lib = try zdl.connection.Library.open();
    defer lib.close();

    const tray = try zdl.model.Tray(Context).create(gpa);
    defer tray.destroy();
    tray.set_left_click(.{ .context = &counter, .function = on_click });
    tray.set_right_click(.{ .context = &counter, .function = on_click });
    try tray.set_tooltip("zdl tray");

    var icon = try zdl.surface.Surface.init(gpa, 2, 2, .rgba8, null);
    defer icon.deinit();
    try tray.set_icon(icon.view);

    const menu = tray.menu();
    const open_entry = try menu.insert(null, "Open", .{});
    open_entry.set_action(.{ .context = &counter, .function = on_action });
    _ = try menu.insert(null, null, .{});
    const log_entry = try menu.insert(null, "Log", .{ .checkbox = true });
    try log_entry.set_checked(true);
    const sub = try log_entry.create_submenu();
    _ = try sub.insert(null, "Nested", .{ .enabled = false });
    log_entry.remove();

    var item = try zdl.sni.Item(Context).open(&lib, gpa, tray, .{ .id = "zdl.check", .instance = 1 });
    defer item.close();
    try item.process(0);
    _ = item.name();
    const changes = tray.changes();
    _ = changes.any();
    tray.acknowledge();
}
