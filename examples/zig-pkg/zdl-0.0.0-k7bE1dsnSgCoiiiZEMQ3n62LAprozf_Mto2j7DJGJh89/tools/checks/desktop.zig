//! Compile-only consumer for D-Bus desktop helpers, dialogs and notifications.
//! Guarded so nothing touches the bus, spawns zenity or opens a dialog.
const std = @import("std");
const zdl = @import("zdl");

pub fn check() !void {
    if (std.os.linux.getpid() != 0) return;
    const gpa = std.heap.page_allocator;
    var threaded: std.Io.Threaded = .init_single_threaded;
    const io = threaded.io();
    var lib = try zdl.dbus.connection.Library.open();
    defer lib.close();
    var conn = try zdl.dbus.connection.Connection.open(&lib, .session);
    defer conn.close();

    const desktop = zdl.dbus.desktop;
    _ = desktop.is_sandboxed(null);
    var inhibition = try desktop.inhibit_screensaver(&conn, gpa, "playing video", null);
    try inhibition.release(&conn, gpa);
    try desktop.simulate_user_activity(&conn, gpa);
    try desktop.open_uri(&conn, gpa, "https://example.invalid");
    _ = try desktop.color_scheme(&conn, gpa);
    _ = desktop.is_uri("file:///tmp/a");
    gpa.free(try desktop.file_uri_to_path(gpa, "file:///tmp/a%20b"));
    gpa.free(try desktop.percent_decode(gpa, "a%20b"));

    const dialog = zdl.dialog.dialog;
    const filters = [_]dialog.Filter{.{ .name = "Images", .pattern = "png;jpg" }};
    try dialog.validate_filters(&filters);
    gpa.free(try dialog.glob_for(gpa, "png"));
    gpa.free(try dialog.glob_list(gpa, "png;jpg"));
    var it = dialog.extensions("png;jpg");
    while (it.next()) |_| {}
    const request: dialog.Request = .{ .kind = .open_file, .filters = &filters, .allow_many = true, .parent = .{ .x11 = 42 } };
    var pending = try zdl.dialog.portal.show(&conn, gpa, request);
    var outcome = try pending.wait(&conn, -1);
    outcome.deinit(gpa);
    var fallback = try zdl.dialog.zenity.run(gpa, io, .{ .kind = .save_file, .default_location = "/tmp/x.png" });
    fallback.deinit(gpa);

    const id = try zdl.notify.notify.show(&conn, gpa, .{ .app_name = "zdl", .summary = "Done", .urgency = .normal, .actions = &.{ "default", "Open" } });
    try zdl.notify.notify.close(&conn, gpa, id);
}
