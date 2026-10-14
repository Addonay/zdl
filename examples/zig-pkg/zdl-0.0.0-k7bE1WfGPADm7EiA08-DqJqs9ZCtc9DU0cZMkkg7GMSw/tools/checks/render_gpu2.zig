const std = @import("std");
const zdl = struct {
    const renderer = @import("zdl").render.gpu.renderer;
    const texture = @import("zdl").render.gpu.texture;
    const shaders = @import("zdl").render.gpu.shaders;
    const color = @import("zdl").render.gpu.color;
    const layout = @import("zdl").render.gpu.layout;
    const pipeline_cache = @import("zdl").render.gpu.pipeline_cache;
    const device = @import("zdl").gpu.device;
    const pixels = @import("zdl").pixels;
    const types = @import("zdl").gpu.types;
};

// Compile-only consumer for the YUV, palette, color scale, HDR and cycling paths.
// Nothing here runs: the guard below returns before any call that would touch the GPU driver.
pub fn check() !void {
    comptime {
        std.testing.refAllDecls(zdl.renderer);
        std.testing.refAllDecls(zdl.renderer.GpuRenderer);
        std.testing.refAllDecls(zdl.texture);
        std.testing.refAllDecls(zdl.shaders);
        std.testing.refAllDecls(zdl.color);
        std.testing.refAllDecls(zdl.layout);
        std.testing.refAllDecls(zdl.pipeline_cache);
    }
    if (std.os.linux.getpid() != 0) return;
    const allocator = std.heap.page_allocator;
    const dev = try zdl.device.Device.create(allocator, .{});
    defer dev.destroy();

    const r = try zdl.renderer.GpuRenderer.create_offscreen(allocator, dev, 64, 64, .r8g8b8a8_unorm);
    defer r.destroy();
    try r.set_color_scale(0.5);
    try r.set_hdr_properties(1.25, 2.0);
    r.set_draw_color(.{ .r = 255, .g = 0, .b = 0, .a = 255 });
    try r.clear();
    try r.fill_rect(.{ .x = 1, .y = 1, .width = 10, .height = 10 });

    const rgba = try r.create_texture(8, 8, .rgba8, .streaming);
    defer r.destroy_texture(rgba) catch {};
    var rgba_bytes: [8 * 8 * 4]u8 = @splat(0);
    try r.update(rgba, null, &rgba_bytes, 8 * 4);
    var locked = try r.lock(rgba, null);
    locked.pixels[0] = 1;
    try r.unlock(rgba);
    try r.copy(rgba, null, null);

    const yuv_bytes: [64]u8 = @splat(128);
    const iyuv = try r.create_yuv_texture(8, 8, .iyuv, .{ .matrix = .bt709, .range = .full }, .static);
    defer r.destroy_texture(iyuv) catch {};
    const chroma_bytes: [16]u8 = @splat(128);
    try r.update_yuv(iyuv, null, &yuv_bytes, 8, &chroma_bytes, 4, &chroma_bytes, 4);
    try r.copy(iyuv, null, null);

    const nv = try r.create_yuv_texture(8, 8, .p010, .{}, .streaming);
    defer r.destroy_texture(nv) catch {};
    const uv_bytes: [64]u8 = @splat(0);
    try r.update_nv(nv, null, &yuv_bytes, 16, &uv_bytes, 16);
    nv.set_colorspace(.hdr10);
    nv.set_hdr(1.0, 4.0);
    try r.copy(nv, null, null);

    const indexed = try r.create_texture(8, 8, .{ .indexed = try zdl.pixels.Indexed.init(8, .msb_first) }, .static);
    defer r.destroy_texture(indexed) catch {};
    const palette: [16]zdl.pixels.Color = @splat(.{ .r = 0, .g = 0, .b = 0 });
    try r.set_palette(indexed, &palette);
    indexed.set_scale_mode(.pixel_art);
    try r.copy(indexed, null, null);

    try r.present();
    var surf = try r.read_pixels(null);
    surf.deinit();
}
