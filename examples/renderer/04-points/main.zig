//! SDL renderer/04-points: 500 points drift diagonally, respawning at a random edge.
const std = @import("std");
const common = @import("common");

const Point = struct { position: common.FPoint, speed: f32 };
const App = struct {
    points: [500]Point = undefined,
    last_frame: usize = 0,
    random: std.Random.DefaultPrng = .init(0x504),

    fn init(self: *App) void {
        const rng = self.random.random();
        for (&self.points) |*point| point.* = .{
            .position = .{ .x = rng.float(f32) * 640, .y = rng.float(f32) * 480 },
            .speed = 30 + rng.float(f32) * 30,
        };
    }
};

pub fn main(init: std.process.Init) !void {
    var app: App = .{};
    app.init();
    try common.run(App, &app, init, "examples/renderer/points", frame);
}

fn frame(app: *App, renderer: *common.Renderer, index: usize) !void {
    const elapsed = if (index == 0) 0 else @as(f32, @floatFromInt(index - app.last_frame)) / 60.0;
    app.last_frame = index;
    const rng = app.random.random();
    for (&app.points) |*point| {
        const distance = elapsed * point.speed;
        point.position.x += distance;
        point.position.y += distance;
        if (point.position.x >= 640 or point.position.y >= 480) {
            if (rng.boolean()) {
                point.position = .{ .x = rng.float(f32) * 640, .y = 0 };
            } else {
                point.position = .{ .x = 0, .y = rng.float(f32) * 480 };
            }
            point.speed = 30 + rng.float(f32) * 30;
        }
    }
    try common.clear(renderer, .{ .r = 0, .g = 0, .b = 0, .a = 255 });
    renderer.set_draw_color(.{ .r = 255, .g = 255, .b = 255, .a = 255 });
    const positions = try renderer.allocator.alloc(common.FPoint, app.points.len);
    defer renderer.allocator.free(positions);
    for (app.points, 0..) |point, i| positions[i] = point.position;
    try renderer.draw_points(positions);
}
