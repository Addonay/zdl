//! SDL renderer/18-debug-text: show font size, color, scale, and unsupported Unicode behavior.
const std = @import("std");
const common = @import("common");

const App = struct {};

pub fn main(init: std.process.Init) !void {
    var app: App = .{};
    try common.run(App, &app, init, "examples/renderer/debug-text", frame);
}

fn frame(_: *App, renderer: *common.Renderer, index: usize) !void {
    try common.clear(renderer, .{ .r = 0, .g = 0, .b = 0, .a = 255 });
    renderer.set_draw_color(.{ .r = 255, .g = 255, .b = 255, .a = 255 });
    try renderer.debug_text(272, 100, "Hello world!");
    try renderer.debug_text(224, 150, "This is some debug text.");
    renderer.set_draw_color(.{ .r = 51, .g = 102, .b = 255, .a = 255 });
    try renderer.debug_text(184, 200, "You can do it in different colors.");
    renderer.set_draw_color(.{ .r = 255, .g = 255, .b = 255, .a = 255 });
    try renderer.set_scale(4, 4);
    try renderer.debug_text(14, 65, "It can be scaled.");
    try renderer.set_scale(1, 1);
    try renderer.debug_text(64, 350, "Only ASCII chars: unsupported emoji 🤣 uses the fallback glyph.");
    try renderer.debug_text_format(136, 400, "(This program has been running for {d} seconds.)", .{index / 60});
}
