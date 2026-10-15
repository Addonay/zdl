//! SDL renderer/14-viewport: draw one image through four viewports.
const std = @import("std");
const common = @import("common");

const App = struct { texture: common.Texture };

pub fn main(init: std.process.Init) !void {
    var image = try common.load_sample(init.gpa, init.io);
    defer image.deinit();
    var app = App{ .texture = try common.Texture.init_copy(init.gpa, image.surface.view, .static) };
    defer app.texture.deinit();
    try common.run(App, &app, init, "examples/renderer/viewport", frame);
}

fn frame(app: *App, renderer: *common.Renderer, _: usize) !void {
    try common.clear(renderer, .{ .r = 0, .g = 0, .b = 0, .a = 255 });
    const tw: f32 = @floatFromInt(app.texture.width());
    const th: f32 = @floatFromInt(app.texture.height());
    var destination = common.FRect{ .x = 0, .y = 0, .width = tw, .height = th };

    try renderer.set_viewport(null);
    try renderer.copy(&app.texture, null, destination);
    try renderer.set_viewport(.{ .x = 320, .y = 240, .width = 320, .height = 240 });
    try renderer.copy(&app.texture, null, destination);
    try renderer.set_viewport(.{ .x = 0, .y = 384, .width = 128, .height = 96 });
    try renderer.copy(&app.texture, null, destination);
    try renderer.set_viewport(.{ .x = 100, .y = 200, .width = 640, .height = 480 });
    destination.y = -50;
    try renderer.copy(&app.texture, null, destination);
    try renderer.set_viewport(null);
}
