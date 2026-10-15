//! SDL renderer/09-scaling-textures: grow and shrink a centered sample texture.
const std = @import("std");
const common = @import("common");

const App = struct { texture: common.Texture };

pub fn main(init: std.process.Init) !void {
    var image = try common.load_sample(init.gpa, init.io);
    defer image.deinit();
    var app = App{ .texture = try common.Texture.init_copy(init.gpa, image.surface.view, .static) };
    defer app.texture.deinit();
    try common.run(App, &app, init, "examples/renderer/scaling-textures", frame);
}

fn frame(app: *App, renderer: *common.Renderer, index: usize) !void {
    const scale = common.animation_scale(index);
    const tw: f32 = @floatFromInt(app.texture.width());
    const th: f32 = @floatFromInt(app.texture.height());
    const dw = tw + tw * scale;
    const dh = th + th * scale;
    try common.clear(renderer, .{ .r = 0, .g = 0, .b = 0, .a = 255 });
    try renderer.copy(&app.texture, null, .{ .x = (640 - dw) / 2, .y = (480 - dh) / 2, .width = dw, .height = dh });
}
