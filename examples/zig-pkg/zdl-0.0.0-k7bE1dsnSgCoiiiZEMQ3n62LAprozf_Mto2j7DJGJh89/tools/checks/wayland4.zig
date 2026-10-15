//! Compile-only consumer for the wayland4 area: instantiates drag source, pen
//! tablets, popup scale/frame callbacks, text-input content type and surrounding
//! text, and seat release. Returns before any socket, device or library call can act.
const std = @import("std");
const wl = @import("zdl").wayland.window;
const text_input = @import("zdl").wayland.text_input;
const tablet = @import("zdl").wayland.tablet;
const surface = @import("zdl").surface;

pub fn check() !void {
    if (std.os.linux.getpid() != 0) return;
    const allocator = std.heap.page_allocator;

    var win = try wl.Window.open(allocator, .{ .title = "zdl", .app_id = "zdl.check" });
    defer win.deinit();
    try win.dispatch(true);

    while (win.poll_event()) |event| switch (event) {
        .pen_added => |info| _ = .{ info.id, info.kind, info.wacom_id, info.capabilities.pressure },
        .pen_removed => |id| _ = id,
        .pen => |sample| switch (sample.sample) {
            .proximity => |in| _ = in,
            .touch => |down| _ = down,
            .motion => |point| _ = .{ point.x, point.y },
            .axis => |axis| _ = .{ axis.axis, axis.value },
            .button => |button| _ = .{ button.button, button.pressed },
        },
        .popup_frame_done => |id| _ = id,
        .popup_scale_changed => |id| _ = id,
        .drag_source_ended => |ended| _ = ended.dropped,
        else => {},
    };

    const entries = [_]wl.SelectionEntry{
        .{ .mime = "text/plain;charset=utf-8", .data = "hello" },
        .{ .mime = "text/uri-list", .data = "file:///tmp/a" },
    };
    try win.start_drag(&entries);

    try win.set_content_type(.{ .input_type = .password_hidden, .capitalization = .sentences, .autocorrect = true, .multiline = true });
    try win.start_text_input();
    try win.set_surrounding_text("hello world", 5, 5);
    try win.stop_text_input();
    _ = text_input.wire(.{ .input_type = .number_password_visible });

    const popup = try win.open_popup(.{
        .anchor_rect = .{ .x = 0, .y = 0, .width = 10, .height = 10 },
        .size = .{ .width = 100, .height = 50 },
    });
    if (win.popup_buffer_size(popup)) |size| {
        const pixels = try allocator.alloc(u8, @as(usize, size.width) * size.height * 4);
        defer allocator.free(pixels);
        const raster = try surface.View.init(pixels, size.width, size.height, @as(usize, size.width) * 4, .bgra8, null);
        win.present_popup(popup, raster) catch {};
    }
    try win.close_popup(popup);

    _ = tablet.Kind;
    _ = tablet.Axis;
    _ = wl.PenKind;
}
