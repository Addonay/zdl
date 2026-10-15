//! SDL renderer/15-cliprect: move a 250-pixel clip rectangle diagonally over a texture.
const std = @import("std");
const common = @import("common");

const App = struct {
    texture: common.Texture,
    position: common.FPoint = .{ .x = 0, .y = 0 },
    direction: common.FPoint = .{ .x = 1, .y = 1 },
    previous_frame: usize = 0,
};

pub fn main(init: std.process.Init) !void {
    var image = try common.load_sample(init.gpa, init.io);
    defer image.deinit();
    var app = App{ .texture = try common.Texture.init_copy(init.gpa, image.surface.view, .static) };
    defer app.texture.deinit();
    try common.run(App, &app, init, "examples/renderer/cliprect", frame);
}

fn frame(app: *App, renderer: *common.Renderer, index: usize) !void {
    try renderer.set_clip(.{ .x = @round(app.position.x), .y = @round(app.position.y), .width = 250, .height = 250 });
    const elapsed = if (index == 0) 0 else @as(f32, @floatFromInt(index - app.previous_frame)) / 60;
    app.previous_frame = index;
    const distance = elapsed * 200;
    app.position.x += distance * app.direction.x;
    if (app.position.x < -250) {
        app.position.x = -250;
        app.direction.x = 1;
    } else if (app.position.x >= 640) {
        app.position.x = 639;
        app.direction.x = -1;
    }
    app.position.y += distance * app.direction.y;
    if (app.position.y < -250) {
        app.position.y = -250;
        app.direction.y = 1;
    } else if (app.position.y >= 480) {
        app.position.y = 479;
        app.direction.y = -1;
    }

    try common.clear(renderer, .{ .r = 33, .g = 33, .b = 33, .a = 255 });
    try renderer.copy(&app.texture, null, null);
}
