//! SDL renderer/11-color-mods: tint the same texture blue, cycling, and red.
const std = @import("std");
const common = @import("common");

const App = struct { texture: common.Texture };

pub fn main(init: std.process.Init) !void {
    var image = try common.load_sample(init.gpa, init.io);
    defer image.deinit();
    var app = App{ .texture = try common.Texture.init_copy(init.gpa, image.surface.view, .static) };
    defer app.texture.deinit();
    try common.run(App, &app, init, "examples/renderer/color-mods", frame);
}

fn frame(app: *App, renderer: *common.Renderer, index: usize) !void {
    const t = @as(f64, @floatFromInt(index)) / 60;
    const tau = 2.0 * std.math.pi;
    const red = byte(@floatCast(0.5 + 0.5 * @sin(t)));
    const green = byte(@floatCast(0.5 + 0.5 * @sin(t + tau / 3.0)));
    const blue = byte(@floatCast(0.5 + 0.5 * @sin(t + 2.0 * tau / 3.0)));
    const tw: f32 = @floatFromInt(app.texture.width());
    const th: f32 = @floatFromInt(app.texture.height());

    try common.clear(renderer, .{ .r = 0, .g = 0, .b = 0, .a = 255 });
    app.texture.set_color_mod(0, 0, 255);
    try renderer.copy(&app.texture, null, .{ .x = 0, .y = 0, .width = tw, .height = th });
    app.texture.set_color_mod(red, green, blue);
    try renderer.copy(&app.texture, null, .{ .x = (640 - tw) / 2, .y = (480 - th) / 2, .width = tw, .height = th });
    app.texture.set_color_mod(255, 0, 0);
    try renderer.copy(&app.texture, null, .{ .x = 640 - tw, .y = 480 - th, .width = tw, .height = th });
}

fn byte(value: f32) u8 {
    return @intFromFloat(@round(std.math.clamp(value, 0, 1) * 255));
}
