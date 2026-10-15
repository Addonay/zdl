//! SDL renderer/17-read-pixels: rotate, read back, threshold, then draw a thumbnail.
const std = @import("std");
const common = @import("common");

const App = struct {
    texture: common.Texture,
    converted: common.Texture,
};

pub fn main(init: std.process.Init) !void {
    var image = try common.load_sample(init.gpa, init.io);
    defer image.deinit();
    var app = App{
        .texture = try common.Texture.init_copy(init.gpa, image.surface.view, .static),
        .converted = try common.Texture.init(init.gpa, common.width, common.height, .rgba8, null, .streaming),
    };
    defer app.texture.deinit();
    defer app.converted.deinit();
    try common.run(App, &app, init, "examples/renderer/read-pixels", frame);
}

fn frame(app: *App, renderer: *common.Renderer, index: usize) !void {
    try common.clear(renderer, .{ .r = 0, .g = 0, .b = 0, .a = 255 });
    const tw: f32 = @floatFromInt(app.texture.width());
    const th: f32 = @floatFromInt(app.texture.height());
    const destination = common.FRect{ .x = (640 - tw) / 2, .y = (480 - th) / 2, .width = tw, .height = th };
    const angle = @as(f64, @floatFromInt((index * 1000 / 60) % 2000)) / 2000 * 360;
    try renderer.copy_ex(&app.texture, null, destination, angle, .{ .x = tw / 2, .y = th / 2 }, .{});

    var captured = try renderer.read_pixels(null);
    defer captured.deinit();
    // SDL indexes the bytes of packed RGBA8888 (A,B,G,R in memory on little
    // endian); read_pixels returns byte-ordered rgba8, so name the channels.
    std.debug.assert(captured.view.format == .rgba8);
    for (0..captured.view.height) |y| {
        const row = try captured.view.row(y);
        for (0..captured.view.width) |x| {
            const pixel = row[x * 4 ..][0..4];
            const r, const g, const b = .{ pixel[0], pixel[1], pixel[2] };
            const average: u8 = @intCast((@as(u16, r) + g + b) / 3);
            if (average == 0) {
                pixel.* = .{ 255, 0, 0, 255 }; // make pure black pixels red.
            } else {
                const level: u8 = if (average > 50) 255 else 0; // everything else black or white.
                pixel[0..3].* = .{ level, level, level };
            }
        }
    }
    try app.converted.update(null, captured.view);
    try renderer.copy(&app.converted, null, .{ .x = 0, .y = 0, .width = 160, .height = 120 });
}
