//! SDL renderer/06-textures: stamp the same loaded PNG at three positions.
const std = @import("std");
const common = @import("common");

const App = struct { texture: common.Texture };

pub fn main(init: std.process.Init) !void {
    var image = try common.load_sample(init.gpa, init.io);
    defer image.deinit();
    var app = App{ .texture = try common.Texture.init_copy(init.gpa, image.surface.view, .static) };
    defer app.texture.deinit();
    try common.run(App, &app, init, "examples/renderer/textures", frame);
}

fn frame(app: *App, renderer: *common.Renderer, index: usize) !void {
    const scale = common.animation_scale(index);
    try common.clear(renderer, .{ .r = 0, .g = 0, .b = 0, .a = 255 });
    const tw: f32 = @floatFromInt(app.texture.width());
    const th: f32 = @floatFromInt(app.texture.height());
    try renderer.copy(&app.texture, null, .{ .x = 100 * scale, .y = 0, .width = tw, .height = th });
    try renderer.copy(&app.texture, null, .{ .x = (640 - tw) / 2, .y = (480 - th) / 2, .width = tw, .height = th });
    try renderer.copy(&app.texture, null, .{ .x = 640 - tw - 100 * scale, .y = 480 - th, .width = tw, .height = th });
}
