//! Compile-only consumer for the convert area. It instantiates the public
//! conversion entry points. Every call is behind a PID-zero guard, so the
//! binary can never act even if someone runs it.
const std = @import("std");
const zdl = struct {
    const pixels = @import("zdl").pixels;
    const surface = @import("zdl").surface;
    const colorspace = @import("zdl").video.colorspace;
    const pixels_wide = @import("zdl").video.pixels_wide;
    const convert = @import("zdl").video.convert;
    const yuv_more = @import("zdl").video.yuv_more;
};
const convert = zdl.convert;
const surface = zdl.surface;
const pixels = zdl.pixels;
const colorspace = zdl.colorspace;
const yuv_more = zdl.yuv_more;

fn no_plane() yuv_more.Plane {
    var empty: [0]u8 = .{};
    return .{ .data = &empty, .stride = 0 };
}

fn exercise() !void {
    const allocator = std.heap.page_allocator;

    var rgba_data: [8 * 8 * 4]u8 = undefined;
    const rgba = try surface.View.init(&rgba_data, 8, 8, 32, .rgba8, null);

    var wide_data: [8 * 8 * 16]u8 = undefined;
    const wide = try convert.WideTarget.init(.rgba128_float, 8, 8, &wide_data, 8 * 16);
    const wide_src = try convert.WideSource.init(.rgba128_float, 8, 8, &wide_data, 8 * 16);

    var y_data: [8 * 8]u8 = undefined;
    var uv_data: [8 * 4]u8 = undefined;
    const nv12: convert.YuvTarget = try .init(.nv12, 8, 8, .{
        .{ .data = &y_data, .stride = 8 },
        .{ .data = &uv_data, .stride = 8 },
        no_plane(),
    });
    const nv12_src: convert.YuvSource = .{
        .fourcc = .nv12,
        .width = 8,
        .height = 8,
        .planes = .{
            .{ .data = &y_data, .stride = 8 },
            .{ .data = &uv_data, .stride = 8 },
            .{ .data = &.{}, .stride = 0 },
        },
    };

    var yuy2_data: [8 * 8 * 2]u8 = undefined;
    const yuy2: convert.YuvTarget = try .init(.yuy2, 8, 8, .{
        .{ .data = &yuy2_data, .stride = 16 },
        no_plane(),
        no_plane(),
    });

    var p010_y: [8 * 8 * 2]u8 = undefined;
    var p010_uv: [8 * 4 * 2]u8 = undefined;
    const p010: convert.YuvTarget = try .init(.p010, 8, 8, .{
        .{ .data = &p010_y, .stride = 16 },
        .{ .data = &p010_uv, .stride = 16 },
        no_plane(),
    });

    // Byte and wide to YUV, then back, using the default colorspaces.
    try convert.convert_pixels(.{ .bytes = rgba }, null, .{ .yuv = nv12 }, null, .{});
    try convert.convert_pixels(.{ .yuv = nv12_src }, null, .{ .bytes = rgba }, null, .{});
    try convert.convert_pixels(.{ .wide = wide_src }, colorspace.srgb_linear, .{ .yuv = p010 }, colorspace.hdr10, .{ .src_sdr_white = 80.0, .dst_headroom = 4.0 });
    try convert.convert_pixels(.{ .bytes = rgba }, colorspace.srgb, .{ .wide = wide }, colorspace.srgb_linear, .{});

    // Repacks inside the 8-bit family, and same-format copy.
    try convert.convert_pixels(.{ .yuv = nv12_src }, colorspace.bt601_limited, .{ .yuv = yuy2 }, colorspace.bt601_limited, .{});
    try yuv_more.convert(8, 8, .nv12, .{ .{ .data = &y_data, .stride = 8 }, .{ .data = &uv_data, .stride = 8 }, .{ .data = &.{}, .stride = 0 } }, .yv12, .{ no_plane(), no_plane(), no_plane() });

    // Owned results.
    var owned = try convert.convert_owned(allocator, .{ .bytes = rgba }, null, .{ .yuv = .nv21 }, null, .{});
    defer owned.deinit();
    _ = owned.target();
    var owned_wide = try convert.convert_owned(allocator, .{ .bytes = rgba }, null, .{ .wide = .xbgr2101010 }, null, .{});
    defer owned_wide.deinit();

    var surf = try convert.convert_surface(allocator, rgba, null, .argb8, null, null, .{});
    defer surf.deinit();

    // Premultiply in 8-bit and in floats, clear each storage kind, flip, scale.
    try convert.premultiply_alpha(allocator, .{ .bytes = rgba }, null, .{ .bytes = rgba }, null, false, .{});
    try convert.premultiply_alpha(allocator, .{ .bytes = rgba }, null, .{ .wide = wide }, null, true, .{});
    try convert.clear(.{ .bytes = rgba }, .{ 1.0, 0.5, 0.0, 1.0 }, null);
    try convert.clear(.{ .wide = wide }, .{ 1.0, 0.5, 0.0, 1.0 }, colorspace.srgb_linear);
    try convert.clear(.{ .yuv = nv12 }, .{ 0.0, 0.0, 0.0, 1.0 }, null);
    try convert.flip(rgba, .{ .horizontal = true, .vertical = true });
    var scaled = try convert.scale(allocator, rgba, 4, 4, .linear);
    defer scaled.deinit();
    _ = pixels;
}

pub fn check() !void {
    if (std.os.linux.getpid() != 0) return;
    try exercise();
}
