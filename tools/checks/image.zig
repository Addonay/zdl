//! Real calls instantiate image API bodies; this consumer must never be run.
const std = @import("std");
const zdl = @import("zdl");
const image = zdl.image;

pub fn check() !void {
    if (std.os.linux.getpid() != 0) return;
    const a = std.heap.page_allocator;
    const bytes: []const u8 = "";
    _ = image.jpeg.is_jpeg(bytes);
    _ = image.png.is_png(bytes);
    _ = image.detect(bytes);
    _ = image.isDecodable(.png);
    _ = try image.probe(bytes);
    _ = try image.probe_module.probeAs(bytes, .tga);

    inline for (.{ image.load_png, image.load_jpeg, image.load_bmp, image.load_qoi, image.load_gif, image.load_pnm, image.load_tga, image.load_webp }) |decode| {
        var decoded = try decode(a, bytes, .{});
        defer decoded.deinit();
        _ = decoded.width();
        _ = decoded.height();
        _ = decoded.hasTransparency();
        var rgba = try decoded.toRgba8();
        defer rgba.deinit();
    }
    var detected = try image.decode(a, bytes, .{});
    defer detected.deinit();
    var explicit = try image.decodeAs(a, bytes, .qoi, .{});
    defer explicit.deinit();
    inline for (.{ image.load_gif_animation, image.load_webp_animation, image.load_apng_animation }) |decode| {
        var animation = try decode(a, bytes, .{});
        defer animation.deinit();
    }
    var jpeg = try image.jpeg.decode(a, bytes, .rgba);
    defer jpeg.deinit();
    var png = try image.png.decode_with_options(a, bytes, .{});
    defer png.deinit();
    var y: [1]u8 = undefined;
    var uv: [2]u8 = undefined;
    try image.jpeg.decode_nv12(a, bytes, .{ .width = 1, .height = 1, .y = &y, .y_stride = 1, .uv = &uv, .uv_stride = 2 });
    var target = try zdl.surface.Surface.init(a, 1, 1, .rgba8, null);
    defer target.deinit();
    const encoded_png = try image.encode_png(a, target.view, .{});
    defer a.free(encoded_png);
    const encoded_qoi = try image.encode_qoi(a, target.view);
    defer a.free(encoded_qoi);
    var nv12 = try image.mjpg.frame_to_nv12(a, bytes, 1, 1);
    defer nv12.deinit();
    const frame: zdl.video.blit_yuv.Frame = .{ .format = .mjpg, .width = 1, .height = 1, .stride = 0, .data = bytes, .encoding = .bt601_limited };
    var frame_nv12 = try image.mjpg.frame_to_nv12_from(a, frame);
    defer frame_nv12.deinit();
    var frame_rgb = try image.mjpg.frame_to_surface(a, frame, .rgba8, null);
    defer frame_rgb.deinit();
}
