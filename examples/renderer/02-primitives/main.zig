//! SDL renderer/02-primitives: filled blue field, random red dots, green inset, yellow X.
const std = @import("std");
const common = @import("common");

const App = struct {
    points: [500]common.FPoint = undefined,

    fn init(self: *App) void {
        var random = std.Random.DefaultPrng.init(0x5d1);
        const rng = random.random();
        for (&self.points) |*point| {
            point.* = .{ .x = 100 + rng.float(f32) * 440, .y = 100 + rng.float(f32) * 280 };
        }
    }
};

pub fn main(init: std.process.Init) !void {
    var app: App = .{};
    app.init();
    try common.run(App, &app, init, "examples/renderer/primitives", frame);
}

fn frame(app: *App, renderer: *common.Renderer, _: usize) !void {
    try common.clear(renderer, .{ .r = 33, .g = 33, .b = 33, .a = 255 });
    renderer.set_draw_color(.{ .r = 0, .g = 0, .b = 255, .a = 255 });
    try renderer.fill_rect(.{ .x = 100, .y = 100, .width = 440, .height = 280 });
    renderer.set_draw_color(.{ .r = 255, .g = 0, .b = 0, .a = 255 });
    try renderer.draw_points(&app.points);
    renderer.set_draw_color(.{ .r = 0, .g = 255, .b = 0, .a = 255 });
    try renderer.draw_rect(.{ .x = 130, .y = 130, .width = 380, .height = 220 });
    renderer.set_draw_color(.{ .r = 255, .g = 255, .b = 0, .a = 255 });
    try renderer.draw_line(.{ .x = 0, .y = 0 }, .{ .x = 640, .y = 480 });
    try renderer.draw_line(.{ .x = 0, .y = 480 }, .{ .x = 640, .y = 0 });
}
