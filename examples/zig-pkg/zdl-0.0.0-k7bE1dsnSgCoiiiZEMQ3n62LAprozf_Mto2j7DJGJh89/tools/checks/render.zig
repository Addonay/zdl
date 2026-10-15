const std = @import("std");
const zdl = @import("zdl").render;
const r = zdl.renderer;
const rotate_module = zdl.rotate;

const tex = zdl.texture;

fn exercise(allocator: std.mem.Allocator, out: *tex.Texture, t: *tex.Texture) !void {
    var renderer = r.Renderer.init(allocator, out.view());
    renderer.set_draw_color(.{ .r = 1, .g = 2, .b = 3, .a = 255 });
    try renderer.set_draw_color_float(0.5, 0.25, 1, 1);
    renderer.set_blend(r.Blend.ALPHA);
    try renderer.set_viewport(.{ .x = 1, .y = 1, .width = 10, .height = 10 });
    try renderer.set_clip(.{ .x = 0, .y = 0, .width = 5, .height = 5 });
    try renderer.set_scale(1, 1);
    try renderer.set_logical_presentation(.{ .width = 320, .height = 200, .mode = .letterbox });
    _ = try renderer.window_to_render(.{ .x = 3, .y = 4 });
    _ = try renderer.render_to_window(.{ .x = 3, .y = 4 });
    try renderer.clear();
    try renderer.draw_point(.{ .x = 1, .y = 2 });
    try renderer.draw_line(.{ .x = 0, .y = 0 }, .{ .x = 9, .y = 4 });
    try renderer.draw_line_antialiased(.{ .x = 0, .y = 0 }, .{ .x = 9, .y = 4 });
    try renderer.draw_rect(.{ .x = 1, .y = 1, .width = 4, .height = 4 });
    try renderer.fill_rect(.{ .x = 1, .y = 1, .width = 4, .height = 4 });
    try renderer.copy(t, null, .{ .x = 0, .y = 0, .width = 8, .height = 8 });
    try renderer.copy_ex(t, null, .{ .x = 0, .y = 0, .width = 8, .height = 8 }, 33.0, null, .{ .horizontal = true });
    try renderer.copy_tiled(t, null, 1.5, .{ .x = 0, .y = 0, .width = 40, .height = 40 });
    try renderer.copy_9grid(t, null, 1, 1, 1, 1, 2, .{ .x = 0, .y = 0, .width = 40, .height = 40 });
    const vertices = [_]r.Vertex{
        .{ .position = .{ .x = 0, .y = 0 }, .uv = .{ .x = 0, .y = 0 } },
        .{ .position = .{ .x = 8, .y = 0 }, .uv = .{ .x = 1, .y = 0 } },
        .{ .position = .{ .x = 0, .y = 8 }, .uv = .{ .x = 0, .y = 1 } },
    };
    try renderer.render_geometry(t, &vertices, null);
    var pixels_out = try renderer.read_pixels(null);
    pixels_out.deinit();
    try renderer.set_target(t);
    renderer.set_target(null) catch {};
    _ = renderer.viewport_rect();
    _ = renderer.clip_region();
    _ = renderer.render_scale();
    _ = renderer.draw_color_float();
    _ = renderer.render_target();
    renderer.set_vsync(true);
    renderer.present();
    try renderer.draw_points(&.{.{ .x = 2, .y = 3 }});
    try renderer.draw_lines(&.{ .{ .x = 0, .y = 0 }, .{ .x = 5, .y = 5 } });
    try renderer.draw_rects(&.{.{ .x = 0, .y = 0, .width = 3, .height = 3 }});
    try renderer.fill_rects(&.{.{ .x = 0, .y = 0, .width = 3, .height = 3 }});
    renderer.set_output(out.view());
    var sub = try renderer.read_pixels(.{ .x = 0, .y = 0, .width = 4, .height = 4 });
    sub.deinit();
    try t.update(null, out.view());
    t.set_blend(r.Blend.ADD);
    t.set_color_mod(10, 20, 30);
    t.set_alpha_mod(128);
    t.set_scale_mode(.nearest);
    const view = try t.sub_view(.{ .x = 0, .y = 0, .width = 2, .height = 2 });
    _ = view;
    _ = try rotateCheck();
    try t.convert(.bgra8, null);
    _ = t.pixel_format();
    _ = t.bounds();
    if (std.os.linux.getpid() == 0) {
        _ = t.lock(.{ .x = 0, .y = 0, .width = 1, .height = 1 }) catch {};
        t.unlock() catch {};
    }
}

fn rotateCheck() !rotate_module.Transform {
    return try rotate_module.transform_for(10, 10, 45, .{ .x = 5, .y = 5 });
}

pub fn check() void {
    if (std.os.linux.getpid() != 0) return;
    const allocator = std.heap.page_allocator;
    var output = tex.Texture.init(allocator, 64, 64, .rgba8, null, .target) catch return;
    defer output.deinit();
    var texture = tex.Texture.init(allocator, 16, 16, .rgba8, null, .target) catch return;
    defer texture.deinit();
    exercise(allocator, &output, &texture) catch {};
}
