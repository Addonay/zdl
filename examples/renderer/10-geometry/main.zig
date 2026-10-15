//! SDL renderer/10-geometry: color-interpolated triangle and textured triangles.
const std = @import("std");
const common = @import("common");

const App = struct { texture: common.Texture };

pub fn main(init: std.process.Init) !void {
    var image = try common.load_sample(init.gpa, init.io);
    defer image.deinit();
    var app = App{ .texture = try common.Texture.init_copy(init.gpa, image.surface.view, .static) };
    defer app.texture.deinit();
    try common.run(App, &app, init, "examples/renderer/geometry", frame);
}

fn frame(app: *App, renderer: *common.Renderer, index: usize) !void {
    const size = 200 + 200 * common.animation_scale(index);
    try common.clear(renderer, .{ .r = 0, .g = 0, .b = 0, .a = 255 });

    const triangle = [_]common.Vertex{
        .{ .position = .{ .x = 320, .y = (480 - size) / 2 }, .color = .{ .r = 255, .g = 0, .b = 0, .a = 255 } },
        .{ .position = .{ .x = (640 + size) / 2, .y = (480 + size) / 2 }, .color = .{ .r = 0, .g = 255, .b = 0, .a = 255 } },
        .{ .position = .{ .x = (640 - size) / 2, .y = (480 + size) / 2 }, .color = .{ .r = 0, .g = 0, .b = 255, .a = 255 } },
    };
    try renderer.render_geometry(null, &triangle, null);

    const white = common.Color{ .r = 255, .g = 255, .b = 255, .a = 255 };
    var textured = [_]common.Vertex{
        .{ .position = .{ .x = 10, .y = 10 }, .color = white, .uv = .{ .x = 0, .y = 0 } },
        .{ .position = .{ .x = 150, .y = 10 }, .color = white, .uv = .{ .x = 1, .y = 0 } },
        .{ .position = .{ .x = 10, .y = 150 }, .color = white, .uv = .{ .x = 0, .y = 1 } },
    };
    try renderer.render_geometry(&app.texture, &textured, null);
    for (&textured) |*vertex| vertex.position.x += 450;
    const fourth = common.Vertex{ .position = .{ .x = 600, .y = 150 }, .color = white, .uv = .{ .x = 1, .y = 1 } };
    const vertices = [_]common.Vertex{ textured[0], textured[1], textured[2], fourth };
    const indices = [_]u32{ 0, 1, 2, 1, 2, 3 };
    try renderer.render_geometry(&app.texture, &vertices, &indices);
}
