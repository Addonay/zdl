const std = @import("std");
const zdl = struct {
    const pixels = @import("zdl").pixels;
    const geometry = @import("zdl").geometry;
    const surface = @import("zdl").surface;
    const colorspace = @import("zdl").video.colorspace;
    const pixels_wide = @import("zdl").video.pixels_wide;
    const yuv_wide = @import("zdl").video.yuv_wide;
    const rle = @import("zdl").video.rle;
};

pub fn check() !void {
    if (std.os.linux.getpid() != 0) return;
    const gpa = std.heap.page_allocator;

    // Colorspace descriptors, transfer functions, primaries and tone mapping.
    const cs = zdl.colorspace.Colorspace.from_bits(zdl.colorspace.hdr10.bits()) orelse return;
    _ = cs;
    _ = zdl.colorspace.default_for(.rgb8);
    _ = zdl.colorspace.srgb_to_linear(0.5);
    _ = zdl.colorspace.srgb_from_linear(0.5);
    _ = zdl.colorspace.pq_to_nits(0.5);
    _ = zdl.colorspace.pq_from_nits(100.0);
    _ = zdl.colorspace.bt709_to_linear(0.5);
    _ = zdl.colorspace.hlg_to_linear(0.5);
    _ = zdl.colorspace.hlg_from_linear(0.5);
    _ = zdl.colorspace.decode(.pq, 0.5, 203.0);
    _ = zdl.colorspace.encode(.hlg, 0.5, 1.0);
    _ = zdl.colorspace.sdr_white_point(zdl.colorspace.hdr10, null);
    _ = zdl.colorspace.hdr_headroom(zdl.colorspace.hdr10, 2.0);
    _ = zdl.colorspace.primaries_matrix(.bt2020, .bt709);
    _ = zdl.colorspace.convert_primaries(.{ 1.0, 0.0, 0.0 }, zdl.colorspace.primaries_matrix(.bt709, .bt2020).?);
    _ = (zdl.colorspace.Chrome.init(2.0, 1.0)).apply(.{ 1.0, 0.5, 0.25 });
    _ = zdl.colorspace.ycbcr_matrix(zdl.colorspace.bt2020_limited, 1080, 10);
    _ = zdl.colorspace.ycbcr_matrix_for_depth(zdl.colorspace.bt709_limited, 1080, 16);

    // Wide formats and conversion pipeline.
    var word: [16]u8 = undefined;
    try zdl.pixels_wide.Layout.argb2101010.write(word[0..4], .{ .r = 0.5, .g = 0.25, .b = 1.0, .a = 1.0 });
    _ = try zdl.pixels_wide.Layout.rgba64_float.read(&word);
    try zdl.pixels_wide.Layout.rgba128_float.write(&word, .{ .r = 4.0, .g = 2.0, .b = 1.0, .a = 1.0 });
    const pipeline = zdl.pixels_wide.Pipeline.init(zdl.colorspace.hdr10, zdl.colorspace.srgb, .{ .src_headroom = 4.0, .dst_headroom = 1.0 });
    _ = pipeline.apply_color(.{ .r = 255, .g = 128, .b = 0 });
    try zdl.pixels_wide.convert_pixel(pipeline, .rgba128_float, &word, .xbgr2101010, word[0..4]);
    _ = try zdl.pixels_wide.wide_to_color(pipeline, .rgb48, &word);

    var surf = try zdl.surface.Surface.init(gpa, 4, 4, .rgba8, null);
    defer surf.deinit();
    var dst = try zdl.surface.Surface.init(gpa, 4, 4, .rgba8, null);
    defer dst.deinit();
    try zdl.pixels_wide.convert_view(pipeline, surf.view, dst.view);

    // P010 / P016 planes and conversion.
    var image = try zdl.yuv_wide.Image.init(gpa, .p010, 4, 4);
    defer image.deinit();
    const iv = try image.view();
    try iv.convert_into(dst.view, zdl.colorspace.bt2020_limited);
    var wide_bytes: [4 * 4 * 4]u8 = undefined;
    try iv.convert_into_wide(.xbgr2101010, &wide_bytes, 16, zdl.colorspace.bt2020_full);

    // Planar I0FL/I4FL sixteen-bit storage, plus the scalar reference blit that
    // validates the vector kernels.
    var planar = try zdl.yuv_wide.PlanarImage.init(gpa, .i4fl, 4, 4);
    defer planar.deinit();
    const planar_view = try planar.view();
    _ = try planar_view.sample(0, 0);
    _ = try planar_view.read_rgb(3, 3, zdl.colorspace.bt709_full);
    try planar_view.convert_into(dst.view, zdl.colorspace.bt709_limited);
    _ = try dst.view.blit_scalar(gpa, surf.view, .{ .blend = zdl.surface.Blend.ALPHA, .modulation = .{ .r = 128, .g = 128, .b = 128 } });

    // RLE colorkey and per-pixel alpha streams.
    var keyed = try zdl.rle.encode_colorkey(gpa, surf.view, .{ .pixel = 0 });
    defer keyed.deinit();
    try keyed.blit(dst.view, .{ .x = 0, .y = 0, .width = 4, .height = 4 }, .{ .x = 0, .y = 0 });
    const packed_target = zdl.pixels.Packed.from_masks(4, .little, .{ .r = 0xff0000, .g = 0x00ff00, .b = 0x0000ff }) catch return;
    var alpha = try zdl.rle.encode_alpha(gpa, surf.view, packed_target);
    defer alpha.deinit();
    try alpha.blit(dst.view, .{ .x = 0, .y = 0, .width = 4, .height = 4 }, .{ .x = 0, .y = 0 });
    _ = zdl.rle.blend_888(0xff00ff00, 0x00102030);
    _ = zdl.rle.blend_565(0xffff, 0x1234);
    _ = zdl.rle.blend_555(0x3e0, 0x1234);
}
