//! SDL renderer/07-streaming-textures: rewrite a streaming texture every frame.
const std = @import("std");
const common = @import("common");

const texture_size: u31 = 150;
const App = struct { texture: common.Texture };

pub fn main(init: std.process.Init) !void {
    var app = App{ .texture = try common.Texture.init(init.gpa, texture_size, texture_size, .rgba8, null, .streaming) };
    defer app.texture.deinit();
    try common.run(App, &app, init, "examples/renderer/streaming-textures", frame);
}

fn frame(app: *App, renderer: *common.Renderer, index: usize) !void {
    const scale = common.animation_scale(index);
    var pixels = try app.texture.lock(app.texture.bounds());
    defer app.texture.unlock() catch {};
    try pixels.fill(.{ .r = 0, .g = 0, .b = 0, .a = 255 }, null);
    const strip_height: f32 = @as(f32, @floatFromInt(texture_size)) / 10;
    const strip_y = (@as(f32, @floatFromInt(texture_size)) - strip_height) * ((scale + 1) / 2);
    try pixels.fill(.{ .r = 0, .g = 255, .b = 0, .a = 255 }, .{
        .x = 0,
        .y = @intFromFloat(strip_y),
        .width = texture_size,
        .height = @intFromFloat(strip_height),
    });
    try app.texture.unlock();

    try common.clear(renderer, .{ .r = 66, .g = 66, .b = 66, .a = 255 });
    try renderer.copy(&app.texture, null, .{ .x = 245, .y = 165, .width = 150, .height = 150 });
}
