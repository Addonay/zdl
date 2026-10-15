//! SDL renderer/19-affine-textures: rotate a cube and texture its visible faces.
const std = @import("std");
const common = @import("common");

const App = struct { texture: common.Texture };

pub fn main(init: std.process.Init) !void {
    var image = try common.load_sample(init.gpa, init.io);
    defer image.deinit();
    var app = App{ .texture = try common.Texture.init_copy(init.gpa, image.surface.view, .static) };
    defer app.texture.deinit();
    try common.run(App, &app, init, "examples/renderer/affine-textures", frame);
}

fn frame(app: *App, renderer: *common.Renderer, index: usize) !void {
    const x0: f32 = 320;
    const y0: f32 = 240;
    const pixel_scale = @as(f32, 480) / @sqrt(@as(f32, 3));
    const radians = @as(f32, @floatFromInt((index % 120) * 1000 / 60)) / 2000 * std.math.pi * 2;
    const cosine = @cos(radians);
    const sine = @sin(radians);
    const k = [_]f32{ 3 / @sqrt(@as(f32, 50)), 4 / @sqrt(@as(f32, 50)), 5 / @sqrt(@as(f32, 50)) };
    const matrix = [_]f32{
        cosine + (1 - cosine) * k[0] * k[0],       -sine * k[2] + (1 - cosine) * k[0] * k[1], sine * k[1] + (1 - cosine) * k[0] * k[2],
        sine * k[2] + (1 - cosine) * k[0] * k[1],  cosine + (1 - cosine) * k[1] * k[1],       -sine * k[0] + (1 - cosine) * k[1] * k[2],
        -sine * k[1] + (1 - cosine) * k[0] * k[2], sine * k[0] + (1 - cosine) * k[1] * k[2],  cosine + (1 - cosine) * k[2] * k[2],
    };

    var corners: [8]common.FPoint = undefined;
    for (0..8) |i| {
        const bits: u32 = @intCast(i);
        const x: f32 = if (bits & 1 != 0) -0.5 else 0.5;
        const y: f32 = if (bits & 2 != 0) -0.5 else 0.5;
        const z: f32 = if (bits & 4 != 0) -0.5 else 0.5;
        corners[i] = .{
            .x = matrix[0] * x + matrix[1] * y + matrix[2] * z,
            .y = matrix[3] * x + matrix[4] * y + matrix[5] * z,
        };
    }

    try common.clear(renderer, .{ .r = 0x42, .g = 0x87, .b = 0xf5, .a = 255 });
    for (1..7) |index_value| {
        const i: u32 = @intCast(index_value);
        const direction = 3 & (if (i & 4 != 0) ~i else i);
        const odd = ((i & 1) ^ ((i & 2) >> 1) ^ ((i & 4) >> 2)) != 0;
        const front_sign: f32 = if (odd) 1 else -1;
        if (front_sign * matrix[5 + direction] > 0) continue;

        var origin_index = @as(u32, 1) << @intCast((direction - 1) % 3);
        var right_index = (@as(u32, 1) << @intCast((direction + @intFromBool(odd)) % 3)) | origin_index;
        var down_index = (@as(u32, 1) << @intCast((direction + @intFromBool(!odd)) % 3)) | origin_index;
        if (!odd) {
            origin_index ^= 7;
            right_index ^= 7;
            down_index ^= 7;
        }
        const origin = screen_point(corners[origin_index], x0, y0, pixel_scale);
        const right = screen_point(corners[right_index], x0, y0, pixel_scale);
        const down = screen_point(corners[down_index], x0, y0, pixel_scale);
        try renderer.copy_affine(&app.texture, null, origin, right, down);
    }
}

fn screen_point(point: common.FPoint, x0: f32, y0: f32, scale: f32) common.FPoint {
    return .{ .x = x0 + scale * point.x, .y = y0 + scale * point.y };
}
