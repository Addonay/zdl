//! SDL renderer/08-rotating-textures: rotate the sample image around its center.
const std = @import("std");
const common = @import("common");

const App = struct { texture: common.Texture };

pub fn main(init: std.process.Init) !void {
    var image = try common.load_sample(init.gpa, init.io);
    defer image.deinit();
    var app = App{ .texture = try common.Texture.init_copy(init.gpa, image.surface.view, .static) };
    defer app.texture.deinit();
    try common.run(App, &app, init, "examples/renderer/rotating-textures", frame);
}

fn frame(app: *App, renderer: *common.Renderer, index: usize) !void {
    try common.clear(renderer, .{ .r = 0, .g = 0, .b = 0, .a = 255 });
    const tw: f32 = @floatFromInt(app.texture.width());
    const th: f32 = @floatFromInt(app.texture.height());
    const destination = common.FRect{ .x = (640 - tw) / 2, .y = (480 - th) / 2, .width = tw, .height = th };
    const center = common.FPoint{ .x = tw / 2, .y = th / 2 };
    const angle = @as(f64, @floatFromInt((index * 1000 / 60) % 2000)) / 2000 * 360;
    try renderer.copy_ex(&app.texture, null, destination, angle, center, .{});
}
