const std = @import("std");
const zdl = struct {
    const renderer = @import("zdl").render.gpu.renderer;
    const texture = @import("zdl").render.gpu.texture;
    const pipeline_cache = @import("zdl").render.gpu.pipeline_cache;
    const shaders = @import("zdl").render.gpu.shaders;
    const layout = @import("zdl").render.gpu.layout;
    const types = @import("zdl").gpu.types;
    const device = @import("zdl").gpu.device;
    const pixels = @import("zdl").pixels;
};

// Compile-only consumer. Nothing here runs: the guard below returns before any
// call that would touch the GPU driver.
pub fn check() !void {
    comptime {
        std.testing.refAllDecls(zdl.renderer);
        std.testing.refAllDecls(zdl.renderer.GpuRenderer);
        std.testing.refAllDecls(zdl.texture);
        std.testing.refAllDecls(zdl.pipeline_cache);
        std.testing.refAllDecls(zdl.shaders);
        std.testing.refAllDecls(zdl.layout);
    }
    if (std.os.linux.getpid() != 0) return;
    const allocator = std.heap.page_allocator;
    const dev = try zdl.device.Device.create(allocator, .{});
    defer dev.destroy();

    const r = try zdl.renderer.GpuRenderer.create_offscreen(allocator, dev, 64, 64, .r8g8b8a8_unorm);
    defer r.destroy();
    r.set_draw_color(.{ .r = 255, .g = 0, .b = 0, .a = 255 });
    try r.set_clip(null);
    try r.clear();
    try r.fill_rect(.{ .x = 1, .y = 1, .width = 10, .height = 10 });
    try r.draw_line(.{ .x = 0, .y = 0 }, .{ .x = 5, .y = 5 });
    try r.draw_rect(.{ .x = 0, .y = 0, .width = 4, .height = 4 });
    const tex = try r.create_texture(8, 8, .{ .rgba8 = {} }, .streaming);
    defer r.destroy_texture(tex) catch {};
    try r.copy(tex, null, null);
    try r.present();
    var surf = try r.read_pixels(null);
    surf.deinit();
}
