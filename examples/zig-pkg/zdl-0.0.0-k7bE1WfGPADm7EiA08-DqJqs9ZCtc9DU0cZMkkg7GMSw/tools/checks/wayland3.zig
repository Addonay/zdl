//! Compile-only consumer for the wayland3 area: instantiates the outputs, scroll,
//! drag-and-drop, popup, window-state and XKB additions. Returns before any socket,
//! device or library call can act.
const std = @import("std");
const zdl = struct {
    const window = @import("zdl").wayland.window;
    const dnd = @import("zdl").wayland.dnd;
    const cursor = @import("zdl").wayland.cursor;
    const clipboard = @import("zdl").wayland.clipboard;
    const text_input = @import("zdl").wayland.text_input;
    const shm = @import("zdl").wayland.shm;
    const surface = @import("zdl").surface;
    const xkb_keymap = @import("zdl").xkb.keymap;
    const xkb_library = @import("zdl").xkb.library;
};
const wl = zdl.window;

pub fn check() !void {
    if (std.os.linux.getpid() != 0) return;
    const allocator = std.heap.page_allocator;

    var win = try wl.Window.open(allocator, .{ .title = "zdl", .app_id = "zdl.check" });
    defer win.deinit();
    try win.dispatch(true);
    try win.roundtrip();
    while (win.poll_event()) |event| switch (event) {
        .output_added, .output_changed, .output_removed => |id| _ = id,
        .pointer_scroll => |scroll| _ = .{ scroll.ticks, scroll.steps, scroll.source, scroll.inverted },
        .drag_enter, .drag_motion => |pos| _ = pos.x,
        .drag_drop => |kind| _ = kind,
        .popup_configure => |configure| _ = configure.size,
        .popup_done => |id| _ = id,
        .popup_repositioned => |moved| _ = moved.token,
        else => {},
    };

    const infos = try win.outputs(allocator);
    defer wl.Window.free_outputs(allocator, infos);
    for (infos) |info| _ = .{ info.name.slice(), info.size, info.scale, info.mode, info.modes.len };

    try win.set_minimized();
    try win.set_min_size(.{ .width = 100, .height = 100 });
    try win.set_max_size(.{ .width = 0, .height = 0 });
    try win.set_window_geometry(0, 0, 640, 480);
    try win.set_parent(null);
    _ = win.decoration_mode();
    try win.set_decoration_mode(.server_side);
    try win.hide();
    try win.show();
    _ = win.visible();
    try win.warp_pointer(10, 10);

    const popup = try win.open_popup(.{
        .anchor_rect = .{ .x = 0, .y = 0, .width = 10, .height = 10 },
        .size = .{ .width = 100, .height = 50 },
        .anchor = .bottom_left,
        .gravity = .bottom_right,
        .constraints = .{ .slide_x = true, .flip_y = true },
        .reactive = true,
        .grab = false,
    });
    try win.reposition_popup(popup, .{
        .anchor_rect = .{ .x = 5, .y = 5, .width = 10, .height = 10 },
        .size = .{ .width = 120, .height = 60 },
    });
    _ = win.popup_size(popup);
    var pixels: [4 * 4 * 4]u8 = @splat(0);
    const raster = try zdl.surface.View.init(&pixels, 4, 4, 16, .bgra8, null);
    try win.present_popup(popup, raster);
    try win.close_popup(popup);

    _ = win.drag_mime_types();
    try win.accept_drag("text/uri-list");
    try win.accept_drag(null);
    var pipe = try win.drag_receive("text/uri-list");
    pipe.close();
    try win.finish_drag();

    const paths = try zdl.dnd.file_paths(allocator, "file:///tmp/a%20b\r\n# comment\r\n");
    zdl.dnd.free_paths(allocator, paths);
    _ = zdl.dnd.classify(&.{});
    _ = zdl.dnd.preferred_text(&.{});
}
