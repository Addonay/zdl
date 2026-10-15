//! SDL renderer/01-clear: cycle the output through the familiar three-phase sine palette.
const std = @import("std");
const common = @import("common");

const App = struct {};

pub fn main(init: std.process.Init) !void {
    var app: App = .{};
    try common.run(App, &app, init, "examples/renderer/clear", frame);
}

fn frame(_: *App, renderer: *common.Renderer, index: usize) !void {
    const t = @as(f64, @floatFromInt(index)) / 60.0;
    const tau = 2.0 * std.math.pi;
    const red: f32 = @floatCast(0.5 + 0.5 * @sin(t));
    const green: f32 = @floatCast(0.5 + 0.5 * @sin(t + tau / 3.0));
    const blue: f32 = @floatCast(0.5 + 0.5 * @sin(t + 2.0 * tau / 3.0));
    try renderer.set_draw_color_float(red, green, blue, 1);
    try renderer.clear();
}
