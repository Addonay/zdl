//! Ported from SDL test/testautomation_surface.c (and the pure-surface parts of
//! testautomation_blit.c / testautomation_images.c).
//!
//! Not applicable, by design (see docs/porting.md "Removed facades"):
//!  - surfaceSetUp/TearDown, SDL_PIXELFORMAT_UNKNOWN, NULL-pointer and negative
//!    dimension checks: dimensions are `u31`, pixel formats are descriptors, and
//!    buffers are slices, so those states cannot be expressed.
//!  - SDL_(Set|Get)SurfaceClipRect, surface blend/color/alpha-mod state, RLE flags
//!    and locking: zdl passes clip, blend and modulation per blit (`BlitOptions`).
//!  - SDL_BlitSurface9Grid / SDL_BlitSurfaceTiled on surfaces: only the renderer
//!    (`render.renderer`) implements copy_tiled/copy_9grid.
//!  - SDL_ScaleSurface / ClearSurface / Premultiply for wide formats go through
//!    `convert.zig`; `Surface.scaled` is byte-format only.
const std = @import("std");
const testing = std.testing;
const pixels = @import("pixels.zig");
const surface = @import("surface.zig");
const convert = @import("convert.zig");
const pixels_wide = @import("pixels_wide.zig");
const pixels_test = @import("pixels_test.zig");
const images = @import("../testdata/images.zig");
const support = @import("../testdata/support.zig");
const bmp = @import("bmp.zig");
const png = @import("../image/png.zig");
const load = @import("../image/load.zig");
const geometry = @import("geometry.zig");

const Color = pixels.Color;
const Format = pixels.Format;
const packed_format = pixels_test.packed_format;

fn indexed(bits: u4, order: pixels.BitOrder) Format {
    return .{ .indexed = pixels.Indexed.init(bits, order) catch unreachable };
}

fn expect_color(expected: Color, actual: Color) !void {
    try testing.expectEqual(expected, actual);
}

// ---------------------------------------------------------------- blend modes

const add_premultiplied: surface.Blend = .{
    .color = .{ .source = .one, .destination = .one },
    .alpha = .{ .source = .zero, .destination = .one },
};

fn unit(v: u8) f32 {
    return @as(f32, @floatFromInt(v)) / 255.0;
}

fn rounded(v: f32) u8 {
    return @intFromFloat(@round(std.math.clamp(v, 0.0, 1.0) * 255.0));
}

const ModeTag = enum { none, blend, premult, add, add_premult, mod, mul, color_mod, alpha_mod };

fn expected_component(mode_tag: ModeTag, s: f32, d: f32, sa: f32, da: f32, alpha_channel: bool) f32 {
    if (alpha_channel) {
        return switch (mode_tag) {
            .none => s,
            .blend, .premult => s + d * (1.0 - s),
            .add, .add_premult, .mod, .mul => d,
            .color_mod => s + d * (1.0 - s),
            .alpha_mod => s * s + d * (1.0 - s * s),
        };
    }
    _ = da;
    return switch (mode_tag) {
        .none => s,
        .blend => s * sa + d * (1.0 - sa),
        .premult => s + d * (1.0 - sa),
        .add => s * sa + d,
        .add_premult => s + d,
        .mod => s * d,
        .mul => s * d + d * (1.0 - sa),
        .color_mod => (s * s) * sa + d * (1.0 - sa),
        .alpha_mod => s * (sa * sa) + d * (1.0 - sa * sa),
    };
}

fn blend_for(tag: ModeTag) surface.Blend {
    return switch (tag) {
        .none => surface.Blend.REPLACE,
        .blend, .color_mod, .alpha_mod => surface.Blend.ALPHA,
        .premult => surface.Blend.PREMULTIPLIED,
        .add => surface.Blend.ADD,
        .add_premult => add_premultiplied,
        .mod => surface.Blend.MODULATE,
        .mul => surface.Blend.MULTIPLY,
    };
}

// testBlitBlendModeWithFormats
fn blit_blend_with_formats(tag: ModeTag, src_format: Format, dst_format: Format) !void {
    const a = testing.allocator;
    // Allow up to 1 delta from theoretical value to account for rounding error.
    const maximum_error = 1;
    var src_color: Color = .{ .r = 10, .g = 128, .b = 240, .a = 100 };
    var dst_color: Color = .{ .r = 128, .g = 128, .b = 128, .a = 128 };

    var dst = try surface.Surface.init(a, 9, 1, dst_format, null);
    defer dst.deinit();
    try dst.view.fill(dst_color, null);
    dst_color = try dst.view.read(0, 0);

    var palette_storage = [_]Color{src_color};
    const src_palette: ?[]const Color = if (src_format == .indexed) &palette_storage else null;
    var src = try surface.Surface.init(a, 9, 1, src_format, src_palette);
    defer src.deinit();
    try src.view.fill(src_color, null);
    src_color = try src.view.read(0, 0);

    var modulation: Color = .{ .r = 255, .g = 255, .b = 255, .a = 255 };
    if (tag == .color_mod) modulation = .{ .r = src_color.r, .g = src_color.g, .b = src_color.b, .a = 255 };
    if (tag == .alpha_mod) modulation = .{ .r = 255, .g = 255, .b = 255, .a = src_color.a };

    const sa = unit(src_color.a);
    const da = unit(dst_color.a);
    const expected: Color = .{
        .r = rounded(expected_component(tag, unit(src_color.r), unit(dst_color.r), sa, da, false)),
        .g = rounded(expected_component(tag, unit(src_color.g), unit(dst_color.g), sa, da, false)),
        .b = rounded(expected_component(tag, unit(src_color.b), unit(dst_color.b), sa, da, false)),
        .a = switch (tag) {
            // SDL_BLENDMODE_NONE keeps the source alpha only if the destination can store it.
            .none => if (dst_format.masked.channels[3].bits != 0) src_color.a else 255,
            else => rounded(expected_component(tag, sa, da, sa, da, true)),
        },
    };

    const written = try dst.view.blit(a, src.view, .{ .blend = blend_for(tag), .modulation = modulation });
    try testing.expect(written != null);
    const actual = try dst.view.read(0, 0);
    const ok = @abs(@as(i32, actual.r) - expected.r) <= maximum_error and
        @abs(@as(i32, actual.g) - expected.g) <= maximum_error and
        @abs(@as(i32, actual.b) - expected.b) <= maximum_error and
        @abs(@as(i32, actual.a) - expected.a) <= maximum_error;
    if (!ok) std.debug.print("{s}: expected {any} got {any} (src {any} dst {any})\n", .{ @tagName(tag), expected, actual, src_color, dst_color });
    try testing.expect(ok);
}

fn blit_blend_mode(tag: ModeTag) !void {
    const src_formats = [_]Format{ indexed(8, .msb_first), packed_format("XRGB8888"), packed_format("ARGB8888") };
    const dst_formats = [_]Format{ packed_format("XRGB8888"), packed_format("ARGB8888") };
    for (src_formats) |s| for (dst_formats) |d| try blit_blend_with_formats(tag, s, d);
}

test "sdl surface: testBlit (blend none)" {
    try blit_blend_mode(.none);
}
test "sdl surface: testBlitColorMod" {
    try blit_blend_mode(.color_mod);
}
test "sdl surface: testBlitAlphaMod" {
    try blit_blend_mode(.alpha_mod);
}
test "sdl surface: testBlitBlendBlend" {
    try blit_blend_mode(.blend);
}
test "sdl surface: testBlitBlendPremultiplied" {
    try blit_blend_mode(.premult);
}
test "sdl surface: testBlitBlendAdd" {
    try blit_blend_mode(.add);
}
test "sdl surface: testBlitBlendAddPremultiplied" {
    try blit_blend_mode(.add_premult);
}
test "sdl surface: testBlitBlendMod" {
    try blit_blend_mode(.mod);
}
test "sdl surface: testBlitBlendMul" {
    try blit_blend_mode(.mul);
}

// ---------------------------------------------------------------- blit shapes

// surface_testBlitMultiple
test "sdl surface: blit between surfaces sharing a palette and formats" {
    const a = testing.allocator;
    const palette = [_]Color{ .{ .r = 0, .g = 0, .b = 0 }, .{ .r = 0xFF, .g = 0, .b = 0 } };
    const idx8 = indexed(8, .msb_first);
    var source = try surface.Surface.init(a, 1, 1, idx8, &palette);
    defer source.deinit();
    source.view.data[0] = 1;
    // Two destinations with the same palette.
    for (0..2) |_| {
        var dest = try surface.Surface.init(a, 1, 1, idx8, &palette);
        defer dest.deinit();
        _ = try dest.view.blit(a, source.view, .{});
        try testing.expectEqual(1, dest.view.data[0]);
    }
    // Destination with a different format: first byte is red (RGBA32).
    for (0..2) |_| {
        var dest = try surface.Surface.init(a, 1, 1, .rgba8, null);
        defer dest.deinit();
        _ = try dest.view.blit(a, source.view, .{});
        try testing.expectEqual(0xFF, dest.view.data[0]);
    }
}

// surface_testBlitBitmap
test "sdl surface: blit 1, 2 and 4 bit bitmaps" {
    const a = testing.allocator;
    const palette = [_]Color{ .{ .r = 0, .g = 0, .b = 0 }, .{ .r = 255, .g = 255, .b = 255 } };
    const argb8888 = packed_format("ARGB8888");
    for ([_]u4{ 1, 2, 4 }) |bpp| {
        for ([_]pixels.BitOrder{ .lsb_first, .msb_first }) |order| {
            const format = indexed(bpp, order);
            const width: u31 = 8 / bpp;
            var pixel: u8 = if (order == .msb_first) switch (bpp) {
                1 => 0x80,
                2 => 0x40,
                else => 0x10,
            } else 0x01;
            for (0..width) |j| {
                var buffer = [_]u8{pixel};
                const source = try surface.View.init(&buffer, width, 1, 1, format, &palette);
                var dest = try surface.Surface.init(a, 1, 1, argb8888, null);
                defer dest.deinit();
                @memset(dest.view.data, 0);
                _ = try dest.view.blit(a, source, .{ .source_region = .{ .x = @intCast(j), .y = 0, .width = 1, .height = 1 } });
                try testing.expectEqual(0xFFFFFFFF, std.mem.readInt(u32, dest.view.data[0..4], .little));
                if (order == .msb_first) pixel >>= @intCast(bpp) else pixel <<= @intCast(bpp);
            }
        }
    }
}

// surface_testBlitInvalid
test "sdl surface: blit with zero-sized surfaces" {
    const a = testing.allocator;
    var valid = try surface.Surface.init(a, 1, 1, packed_format("RGBA8888"), null);
    defer valid.deinit();
    var empty = try surface.Surface.init(a, 0, 0, packed_format("RGBA8888"), null);
    defer empty.deinit();
    // SDL reports failure; zdl reports that nothing was admitted.
    try testing.expectEqual(null, try valid.view.blit(a, empty.view, .{}));
    try testing.expectEqual(null, try empty.view.blit(a, valid.view, .{}));
}

// surface_testBlitsWithBadCoordinates
test "sdl surface: blits with extreme coordinates" {
    const a = testing.allocator;
    const max = std.math.maxInt(i32);
    const min = std.math.minInt(i32);
    const rects = [_]geometry.Rect(i32){
        .{ .x = max, .y = 0, .width = 2, .height = 2 },
        .{ .x = 0, .y = max, .width = 2, .height = 2 },
        .{ .x = 0, .y = 0, .width = max, .height = 2 },
        .{ .x = 0, .y = 0, .width = 2, .height = max },
        .{ .x = min, .y = 0, .width = 2, .height = 2 },
        .{ .x = 0, .y = min, .width = 2, .height = 2 },
        .{ .x = 0, .y = 0, .width = min, .height = 2 },
        .{ .x = 0, .y = 0, .width = 2, .height = min },
    };
    var s = try surface.Surface.init(a, 1, 1, packed_format("RGBA8888"), null);
    defer s.deinit();
    for (rects) |r| {
        _ = try s.view.blit(a, s.view, .{ .destination = .{ .x = r.x, .y = r.y }, .clip = r });
        _ = try s.view.blit(a, s.view, .{ .source_region = r });
        _ = try s.view.blit(a, s.view, .{ .source_region = r, .destination = .{ .x = r.x, .y = r.y }, .clip = r });
    }
}

// ---------------------------------------------------------------- creation / overflow

// surface_testOverflow (pitch validation part)
test "sdl surface: CreateSurfaceFrom pitch validation" {
    var buf: [1024]u8 = @splat(0);
    const Case = struct { w: u31, format: Format, pitch: usize, ok: bool };
    const cases = [_]Case{
        .{ .w = 6, .format = indexed(4, .lsb_first), .pitch = 3, .ok = true },
        .{ .w = 6, .format = indexed(4, .msb_first), .pitch = 3, .ok = true },
        .{ .w = 7, .format = indexed(4, .lsb_first), .pitch = 3, .ok = false },
        .{ .w = 7, .format = indexed(4, .msb_first), .pitch = 3, .ok = false },
        .{ .w = 7, .format = indexed(4, .lsb_first), .pitch = 4, .ok = true },
        .{ .w = 7, .format = indexed(4, .msb_first), .pitch = 4, .ok = true },
        .{ .w = 12, .format = indexed(2, .lsb_first), .pitch = 3, .ok = true },
        .{ .w = 12, .format = indexed(2, .msb_first), .pitch = 3, .ok = true },
        .{ .w = 13, .format = indexed(2, .lsb_first), .pitch = 3, .ok = false },
        .{ .w = 13, .format = indexed(2, .msb_first), .pitch = 3, .ok = false },
        .{ .w = 13, .format = indexed(2, .lsb_first), .pitch = 4, .ok = true },
        .{ .w = 13, .format = indexed(2, .msb_first), .pitch = 4, .ok = true },
        .{ .w = 16, .format = indexed(1, .lsb_first), .pitch = 2, .ok = true },
        .{ .w = 16, .format = indexed(1, .msb_first), .pitch = 2, .ok = true },
        .{ .w = 17, .format = indexed(1, .lsb_first), .pitch = 2, .ok = false },
        .{ .w = 17, .format = indexed(1, .msb_first), .pitch = 2, .ok = false },
        .{ .w = 17, .format = indexed(1, .lsb_first), .pitch = 3, .ok = true },
        .{ .w = 17, .format = indexed(1, .msb_first), .pitch = 3, .ok = true },
        .{ .w = 5, .format = packed_format("RGB332"), .pitch = 5, .ok = true },
        .{ .w = 5, .format = indexed(8, .msb_first), .pitch = 5, .ok = true },
        .{ .w = 6, .format = packed_format("RGB332"), .pitch = 5, .ok = false },
        .{ .w = 6, .format = indexed(8, .msb_first), .pitch = 5, .ok = false },
        .{ .w = 3, .format = packed_format("XRGB1555"), .pitch = 6, .ok = true },
        .{ .w = 4, .format = packed_format("XRGB1555"), .pitch = 6, .ok = false },
        .{ .w = 1, .format = packed_format("RGBA8888"), .pitch = 0, .ok = false },
        .{ .w = 1, .format = packed_format("RGBA8888"), .pitch = 4, .ok = true },
    };
    const palette = [_]Color{ .{ .r = 0, .g = 0, .b = 0 }, .{ .r = 1, .g = 1, .b = 1 } };
    for (cases) |c| {
        const result = surface.View.init(&buf, c.w, 1, c.pitch, c.format, &palette);
        if (c.ok) {
            _ = try result;
        } else {
            try testing.expectError(error.InvalidBuffer, result);
        }
    }
    // A buffer too short for the rows is rejected as well.
    try testing.expectError(error.InvalidBuffer, surface.View.init(buf[0..7], 2, 2, 4, packed_format("RGBA8888"), null));
}

// surface_testOverflow (size overflow part; allocation of absurd sizes must fail)
test "sdl surface: overflow in sizes is rejected" {
    const a = testing.allocator;
    const bytes_per: Format = packed_format("ARGB8888");
    if (surface.Surface.init(a, (1 << 29) - 1, (1 << 29) - 1, indexed(8, .msb_first), &.{.{ .r = 0, .g = 0, .b = 0 }})) |_| {
        return error.TestExpectedOverflow;
    } else |_| {}
    if (surface.Surface.init(a, 0x7fffffff, 0x7fffffff, bytes_per, null)) |_| {
        return error.TestExpectedOverflow;
    } else |_| {}
    // Zero-sized surfaces are valid and hold no pixels.
    var empty = try surface.Surface.init(a, 0, 0, bytes_per, null);
    defer empty.deinit();
    try testing.expectEqual(0, empty.view.data.len);
    try testing.expectError(error.OutOfBounds, empty.view.read(0, 0));
}

// ---------------------------------------------------------------- flip / palette / conversion

// surface_testFlip
test "sdl surface: flip" {
    const a = testing.allocator;
    var s = try surface.Surface.init(a, 3, 3, .rgb8, null);
    defer s.deinit();
    const pixel_bytes = s.view.data;
    pixel_bytes[0] = 0xFF;
    try convert.flip(s.view, .{ .vertical = true });
    try testing.expectEqual(0x00, pixel_bytes[0]);
    var offset = 2 * s.view.stride;
    try testing.expectEqual(0xFF, pixel_bytes[offset]);
    try convert.flip(s.view, .{ .horizontal = true });
    try testing.expectEqual(0x00, pixel_bytes[offset]);
    offset += (s.view.width - 1) * 3;
    try testing.expectEqual(0xFF, pixel_bytes[offset]);
}

// surface_testPalette
test "sdl surface: palette operations" {
    const a = testing.allocator;
    const idx8 = indexed(8, .msb_first);
    var palette = [_]Color{ .{ .r = 0, .g = 0, .b = 0 }, .{ .r = 0xFF, .g = 0, .b = 0 } };
    var source = try surface.Surface.init(a, 1, 1, idx8, &palette);
    defer source.deinit();
    var dest = try surface.Surface.init(a, 1, 1, idx8, &palette);
    defer dest.deinit();
    source.view.data[0] = 1;
    // Identity copy between indexed surfaces sharing a palette.
    dest.view.data[0] = 0;
    _ = try dest.view.blit(a, source.view, .{});
    try testing.expectEqual(1, dest.view.data[0]);
    // Destination without a palette entry for the color: palettized by nearest color.
    var other = [_]Color{ .{ .r = 0xFF, .g = 0, .b = 0 }, .{ .r = 0, .g = 0, .b = 0 } };
    var dest2 = try surface.Surface.init(a, 1, 1, idx8, &other);
    defer dest2.deinit();
    _ = try dest2.view.blit(a, source.view, .{});
    try testing.expectEqual(0, dest2.view.data[0]);

    var output = try surface.Surface.init(a, 1, 1, .rgba8, null);
    defer output.deinit();
    _ = try output.view.blit(a, dest.view, .{});
    try testing.expectEqual(0xFF, output.view.data[0]);
    // Change the palette color and blit again.
    palette[1].r = 0xAA;
    _ = try output.view.blit(a, dest.view, .{});
    try testing.expectEqual(0xAA, output.view.data[0]);
}

// surface_testPalettization
test "sdl surface: palettization chooses the nearest color" {
    const a = testing.allocator;
    const palette_colors = [_]Color{
        .{ .r = 0x80, .g = 0x00, .b = 0x00 }, .{ .r = 0x00, .g = 0x80, .b = 0x00 },
        .{ .r = 0x00, .g = 0x00, .b = 0x80 }, .{ .r = 0x40, .g = 0x00, .b = 0x00 },
        .{ .r = 0x00, .g = 0x40, .b = 0x00 }, .{ .r = 0x00, .g = 0x00, .b = 0x40 },
        .{ .r = 0x00, .g = 0x00, .b = 0x00 }, .{ .r = 0xff, .g = 0x00, .b = 0x00 },
        .{ .r = 0x00, .g = 0xff, .b = 0x00 }, .{ .r = 0x00, .g = 0x00, .b = 0xff },
        .{ .r = 0xff, .g = 0xff, .b = 0x00 }, .{ .r = 0x00, .g = 0xff, .b = 0xff },
        .{ .r = 0xff, .g = 0x00, .b = 0xff },
    };
    const Case = struct { Color, u8 };
    const colors = [_]Case{
        .{ .{ .r = 0xff, .g = 0x00, .b = 0x00, .a = 0xff }, 7 },
        .{ .{ .r = 0xfe, .g = 0x00, .b = 0x00, .a = 0xff }, 7 },
        .{ .{ .r = 0xfd, .g = 0x00, .b = 0x00, .a = 0xff }, 7 },
        .{ .{ .r = 0xf0, .g = 0x00, .b = 0x00, .a = 0xff }, 7 },
        .{ .{ .r = 0xd0, .g = 0x00, .b = 0x00, .a = 0xff }, 7 },
        .{ .{ .r = 0xb0, .g = 0x00, .b = 0x00, .a = 0xff }, 0 },
        .{ .{ .r = 0xa0, .g = 0x00, .b = 0x00, .a = 0xff }, 0 },
        .{ .{ .r = 0xff, .g = 0x00, .b = 0x00, .a = 0x00 }, 7 },
        .{ .{ .r = 0x00, .g = 0x10, .b = 0x21, .a = 0xff }, 5 },
        .{ .{ .r = 0x00, .g = 0x10, .b = 0x19, .a = 0xff }, 6 },
        .{ .{ .r = 0x81, .g = 0x00, .b = 0x41, .a = 0xff }, 0 },
        .{ .{ .r = 0x80, .g = 0xf0, .b = 0xf0, .a = 0x7f }, 11 },
        .{ .{ .r = 0x00, .g = 0x00, .b = 0x00, .a = 0xff }, 6 },
        .{ .{ .r = 0x00, .g = 0x00, .b = 0x00, .a = 0x01 }, 6 },
    };
    const width: u31 = palette_colors.len + colors.len;
    var source = try surface.Surface.init(a, width, 1, packed_format("RGBA8888"), null);
    defer source.deinit();
    for (colors, 0..) |c, i| try source.view.write(i, 0, c[0]);
    for (palette_colors, 0..) |c, i| try source.view.write(colors.len + i, 0, c);
    var output = try surface.Surface.convert(a, source.view, indexed(8, .msb_first), &palette_colors);
    defer output.deinit();
    try testing.expectEqual(source.view.width, output.view.width);
    for (colors, 0..) |c, i| {
        try testing.expect(output.view.data[i] < palette_colors.len);
        try testing.expectEqual(c[1], output.view.data[i]);
    }
    for (0..palette_colors.len) |i| try testing.expectEqual(i, output.view.data[colors.len + i]);
}

const compare_surfaces = support.compare_surfaces;

// surface_testSurfaceConversion
test "sdl surface: conversion of the face image" {
    const a = testing.allocator;
    var face = try images.face.to_surface(a);
    defer face.deinit();
    var converted = try surface.Surface.convert(a, face.view, packed_format("ABGR8888"), null);
    defer converted.deinit();
    try compare_surfaces(converted.view, face.view, 0);
}

// surface_testCompleteSurfaceConversion
test "sdl surface: conversion round trips across formats" {
    const a = testing.allocator;
    var face = try images.face.to_surface(a);
    defer face.deinit();
    // Formats with an equal byte width and alpha-ness as the face image (RGBA32).
    const names = [_][]const u8{ "ARGB8888", "RGBA8888", "ABGR8888", "BGRA8888" };
    inline for (names) |n1| {
        inline for (names) |n2| {
            var cvt1 = try surface.Surface.convert(a, face.view, packed_format(n1), null);
            defer cvt1.deinit();
            var cvt2 = try surface.Surface.convert(a, cvt1.view, packed_format(n2), null);
            defer cvt2.deinit();
            var final = try surface.Surface.convert(a, cvt2.view, face.view.format, null);
            defer final.deinit();
            try compare_surfaces(face.view, final.view, 0);
        }
    }
    // Lossy formats round-trip within their precision: convert twice, expect a fixed point.
    const lossy = [_][]const u8{ "RGB332", "XRGB4444", "XBGR4444", "XRGB1555", "XBGR1555", "ARGB4444", "RGBA4444", "ABGR4444", "BGRA4444", "ARGB1555", "RGBA5551", "ABGR1555", "BGRA5551", "RGB565", "BGR565" };
    inline for (lossy) |n| {
        var once = try surface.Surface.convert(a, face.view, packed_format(n), null);
        defer once.deinit();
        var wide = try surface.Surface.convert(a, once.view, packed_format("ARGB8888"), null);
        defer wide.deinit();
        var twice = try surface.Surface.convert(a, wide.view, packed_format(n), null);
        defer twice.deinit();
        try testing.expectEqualSlices(u8, once.view.data, twice.view.data);
    }
}

// surface_test16BitTo32Bit
test "sdl surface: RGB565 to 32-bit conversion" {
    const a = testing.allocator;
    var pixels16: [1 << 16]u16 = undefined;
    for (&pixels16, 0..) |*p, i| p.* = @intCast(i);
    const src = try surface.View.init(std.mem.sliceAsBytes(&pixels16), 1 << 16, 1, (1 << 16) * 2, packed_format("RGB565"), null);
    const targets = [_][]const u8{ "ARGB8888", "ABGR8888", "RGBA8888", "BGRA8888" };
    inline for (targets) |name| {
        const format = packed_format(name);
        var converted = try surface.Surface.convert(a, src, format, null);
        defer converted.deinit();
        for (0..1 << 16) |p| {
            const r: u32 = @intCast((p & 0xF800) >> 11);
            const g: u32 = @intCast((p & 0x07E0) >> 5);
            const b: u32 = @intCast(p & 0x001F);
            const r8 = (r << 3) | (r >> 2);
            const g8 = (g << 2) | (g >> 4);
            const b8 = (b << 3) | (b >> 2);
            const color = try converted.view.read(p, 0);
            if (color.r != r8 or color.g != g8 or color.b != b8 or color.a != 255) {
                std.debug.print("{s}: pixel {x}: got {any}\n", .{ name, p, color });
                return error.ConversionMismatch;
            }
        }
    }
}

// ---------------------------------------------------------------- clear / premultiply / scale

const colorspace = @import("colorspace.zig");

fn one_pixel_owned(a: std.mem.Allocator, layout: pixels_wide.Layout) !convert.Owned {
    var seed = try surface.Surface.init(a, 1, 1, .rgba8, null);
    defer seed.deinit();
    return convert.convert_owned(a, .{ .bytes = seed.view }, null, .{ .wide = layout }, null, .{});
}

// surface_testClearSurface
test "sdl surface: clear surface" {
    const a = testing.allocator;
    const color = [4]f32{ 10.0 / 255.0, 128.0 / 255.0, 240.0 / 255.0, 1.0 };
    inline for ([_][]const u8{ "ARGB8888", "RGBA8888" }) |name| {
        var s = try surface.Surface.init(a, 1, 1, packed_format(name), null);
        defer s.deinit();
        try convert.clear(.{ .bytes = s.view }, color, null);
        try expect_color(.{ .r = 10, .g = 128, .b = 240, .a = 255 }, try s.view.read(0, 0));
    }
    // Wide formats with alpha. SDL sets the surface colorspace to sRGB for the 10-bit
    // formats before clearing/reading; zdl wide rasters have no per-surface colorspace,
    // so the color is stored as given (source colorspace null = the raster's own).
    for (std.enums.values(pixels_wide.Layout)) |layout| {
        if (!layout.has_alpha()) continue;
        var owned = try one_pixel_owned(a, layout);
        defer owned.deinit();
        try convert.clear(owned.target(), color, null);
        const got = try owned.target().wide.read(0, 0);
        // SDL's test only lists ARGB/ABGR2101010, RGBA64 and the 128-bit float
        // formats; half floats (not in SDL's list) have a 11-bit significand.
        const tolerance: f32 = if (layout.is_packed_2101010() or layout == .rgba64_float) 0.0015 else 0.0001;
        try testing.expectApproxEqAbs(color[0], got.r, tolerance);
        try testing.expectApproxEqAbs(color[1], got.g, tolerance);
        try testing.expectApproxEqAbs(color[2], got.b, tolerance);
        try testing.expectApproxEqAbs(color[3], got.a, tolerance);
    }
}

// surface_testPremultiplyAlpha
test "sdl surface: premultiply alpha" {
    const a = testing.allocator;
    const src = [4]f32{ 10.0 / 255.0, 128.0 / 255.0, 240.0 / 255.0, 170.0 / 255.0 };
    const expected = [3]f32{ src[0] * src[3], src[1] * src[3], src[2] * src[3] };
    inline for ([_][]const u8{ "ARGB8888", "RGBA8888" }) |name| {
        var s = try surface.Surface.init(a, 1, 1, packed_format(name), null);
        defer s.deinit();
        try convert.clear(.{ .bytes = s.view }, src, null);
        try convert.premultiply_alpha(a, .{ .bytes = s.view }, colorspace.srgb, .{ .bytes = s.view }, colorspace.srgb, false, .{});
        const got = try s.view.read(0, 0);
        const limit = 1.0 / 255.0;
        try testing.expectApproxEqAbs(expected[0], unit(got.r), limit);
        try testing.expectApproxEqAbs(expected[1], unit(got.g), limit);
        try testing.expectApproxEqAbs(expected[2], unit(got.b), limit);
    }
    for (std.enums.values(pixels_wide.Layout)) |layout| {
        if (!layout.has_alpha() or layout == .rgba64_float) continue;
        var owned = try one_pixel_owned(a, layout);
        defer owned.deinit();
        try convert.clear(owned.target(), src, null);
        const wide = owned.target().wide;
        const as_source: convert.WideSource = .{ .layout = wide.layout, .width = 1, .height = 1, .data = wide.data, .stride = wide.stride };
        try convert.premultiply_alpha(a, .{ .wide = as_source }, colorspace.srgb, owned.target(), colorspace.srgb, false, .{});
        // Compare in the colorspace the data was written in (sRGB).
        var back = try convert.convert_owned(a, .{ .wide = as_source }, colorspace.srgb, .{ .wide = .rgba128_float }, colorspace.srgb, .{});
        defer back.deinit();
        const linear = try back.target().wide.read(0, 0);
        const limit: f32 = if (layout.is_packed_2101010()) 0.002 else 0.0001;
        try testing.expectApproxEqAbs(expected[0], linear.r, limit);
        try testing.expectApproxEqAbs(expected[1], linear.g, limit);
        try testing.expectApproxEqAbs(expected[2], linear.b, limit);
    }
}

// surface_testScale (byte formats; Surface.scaled is not implemented for wide rasters)
test "sdl surface: scale uniform color" {
    const a = testing.allocator;
    const color: Color = .{ .r = 10, .g = 128, .b = 240, .a = 170 };
    inline for ([_][]const u8{ "ARGB8888", "RGBA8888" }) |name| {
        for ([_]surface.ScaleMode{ .nearest, .linear, .pixel_art }) |mode| {
            var s = try surface.Surface.init(a, 1, 1, packed_format(name), null);
            defer s.deinit();
            try s.view.write(0, 0, color);
            var result = try surface.Surface.scaled(a, s.view, 2, 2, mode);
            defer result.deinit();
            try expect_color(color, try result.view.read(1, 1));
        }
    }
}

// surface_testSaveLoad
test "sdl surface: save and load BMP and PNG" {
    const a = testing.allocator;
    var face = try images.face.to_surface(a);
    defer face.deinit();

    // Indexed surfaces cannot exist without a palette (SDL: saving them fails).
    try testing.expectError(error.InvalidPalette, surface.Surface.init(a, 32, 32, indexed(8, .msb_first), null));

    const bmp_bytes = try bmp.encode(a, face.view);
    defer a.free(bmp_bytes);
    var from_bmp = try bmp.decode(a, bmp_bytes, .{});
    defer from_bmp.deinit();
    try testing.expectEqual(face.view.width, from_bmp.surface.view.width);
    try testing.expectEqual(face.view.height, from_bmp.surface.view.height);
    try compare_surfaces(face.view, from_bmp.surface.view, 0);

    const png_bytes = try png.encode(a, face.view);
    defer a.free(png_bytes);
    var from_png = try load.load_png(a, png_bytes);
    defer from_png.deinit();
    try testing.expectEqual(face.view.width, from_png.surface.view.width);
    try testing.expectEqual(face.view.height, from_png.surface.view.height);
    try compare_surfaces(face.view, from_png.surface.view, 0);

    // 8-bit palette image: one green pixel (palette index 1).
    const colors = [_]Color{ .{ .r = 255, .g = 0, .b = 0 }, .{ .r = 0, .g = 255, .b = 0 } };
    var paletted = try surface.Surface.init(a, 1, 1, indexed(8, .msb_first), &colors);
    defer paletted.deinit();
    paletted.view.data[0] = 1;

    const png8 = try png.encode(a, paletted.view);
    defer a.free(png8);
    var loaded8 = try load.load_png(a, png8);
    defer loaded8.deinit();
    try testing.expect(loaded8.surface.view.format == .indexed);
    try expect_color(.{ .r = 0, .g = 255, .b = 0, .a = 255 }, try loaded8.surface.view.read(0, 0));

    // Deliberate divergence: zdl's BMP encoder always writes 32-bit V4 (bmp.zig),
    // so an indexed surface is loaded back as RGB rather than INDEX8; the color
    // is preserved.
    const bmp8 = try bmp.encode(a, paletted.view);
    defer a.free(bmp8);
    var bmp_loaded8 = try bmp.decode(a, bmp8, .{});
    defer bmp_loaded8.deinit();
    try expect_color(.{ .r = 0, .g = 255, .b = 0, .a = 255 }, try bmp_loaded8.surface.view.read(0, 0));
}

// surface_testLoadFailure
test "sdl surface: load failure" {
    try testing.expectError(error.InvalidContainer, bmp.decode(testing.allocator, "not a bitmap", .{}));
    try testing.expectError(error.NotPng, load.load_png(testing.allocator, "not a png"));
}
