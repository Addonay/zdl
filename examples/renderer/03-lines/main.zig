//! SDL renderer/03-lines: connected roof outline, brown box, and colorful radial rays.
const std = @import("std");
const common = @import("common");

const outline = [_]common.FPoint{
    .{ .x = 100, .y = 354 }, .{ .x = 220, .y = 230 }, .{ .x = 140, .y = 230 },
    .{ .x = 320, .y = 100 }, .{ .x = 500, .y = 230 }, .{ .x = 420, .y = 230 },
    .{ .x = 540, .y = 354 }, .{ .x = 400, .y = 354 }, .{ .x = 100, .y = 354 },
};
const App = struct { random: std.Random.DefaultPrng = .init(0x360) };

pub fn main(init: std.process.Init) !void {
    var app: App = .{};
    try common.run(App, &app, init, "examples/renderer/lines", frame);
}

fn frame(app: *App, renderer: *common.Renderer, _: usize) !void {
    try common.clear(renderer, .{ .r = 100, .g = 100, .b = 100, .a = 255 });
    renderer.set_draw_color(.{ .r = 127, .g = 49, .b = 32, .a = 255 });
    try renderer.draw_line(.{ .x = 240, .y = 450 }, .{ .x = 400, .y = 450 });
    try renderer.draw_line(.{ .x = 240, .y = 356 }, .{ .x = 400, .y = 356 });
    try renderer.draw_line(.{ .x = 240, .y = 356 }, .{ .x = 240, .y = 450 });
    try renderer.draw_line(.{ .x = 400, .y = 356 }, .{ .x = 400, .y = 450 });
    renderer.set_draw_color(.{ .r = 0, .g = 255, .b = 0, .a = 255 });
    try renderer.draw_lines(&outline);

    const rng = app.random.random();
    const radius: f32 = 30;
    const center = common.FPoint{ .x = 320, .y = 80 };
    for (0..360) |degree| {
        const angle = @as(f32, @floatFromInt(degree)) * (std.math.pi / 180.0);
        renderer.set_draw_color(.{ .r = rng.int(u8), .g = rng.int(u8), .b = rng.int(u8), .a = 255 });
        try renderer.draw_line(center, .{ .x = center.x + @cos(angle) * radius, .y = center.y + @sin(angle) * radius });
    }
}
