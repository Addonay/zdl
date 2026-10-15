//! SDL renderer/05-rectangles: outlined and filled rectangles breathe in size.
const std = @import("std");
const common = @import("common");

const App = struct {};

pub fn main(init: std.process.Init) !void {
    var app: App = .{};
    try common.run(App, &app, init, "examples/renderer/rectangles", frame);
}

fn frame(_: *App, renderer: *common.Renderer, index: usize) !void {
    const ms = (index * 1000 / 60) % 2000;
    const direction: f32 = if (ms >= 1000) 1 else -1;
    const scale = (@as(f32, @floatFromInt(@as(isize, @intCast(ms % 1000)) - 500)) / 500.0) * direction;
    try common.clear(renderer, .{ .r = 0, .g = 0, .b = 0, .a = 255 });

    const size = 100 + (100 * scale);
    renderer.set_draw_color(.{ .r = 255, .g = 0, .b = 0, .a = 255 });
    try renderer.draw_rect(.{ .x = 100, .y = 100, .width = size, .height = size });

    var outlines: [3]common.FRect = undefined;
    for (&outlines, 0..) |*rect, i| {
        const base = @as(f32, @floatFromInt(i + 1)) * 50;
        const extent = base + base * scale;
        rect.* = .{ .x = (640 - extent) / 2, .y = (480 - extent) / 2, .width = extent, .height = extent };
    }
    renderer.set_draw_color(.{ .r = 0, .g = 255, .b = 0, .a = 255 });
    try renderer.draw_rects(&outlines);

    renderer.set_draw_color(.{ .r = 0, .g = 0, .b = 255, .a = 255 });
    try renderer.fill_rect(.{ .x = 400, .y = 50, .width = size, .height = 50 + 50 * scale });

    var bars: [16]common.FRect = undefined;
    for (&bars, 0..) |*rect, i| {
        const w = @as(f32, 640) / @as(f32, @floatFromInt(bars.len));
        const h = @as(f32, @floatFromInt(i)) * 8;
        rect.* = .{ .x = @as(f32, @floatFromInt(i)) * w, .y = 480 - h, .width = w, .height = h };
    }
    renderer.set_draw_color(.{ .r = 255, .g = 255, .b = 255, .a = 255 });
    try renderer.fill_rects(&bars);
}
