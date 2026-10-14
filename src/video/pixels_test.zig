//! Ported from SDL test/testautomation_pixels.c.
//! zdl formats are descriptors (`pixels.Format`, `pixels_wide.Layout`), not SDL's
//! encoded integer enum, so SDL_GetPixelFormatName and the invalid-enum negative
//! cases have no counterpart; `SDL_GetPixelFormatDetails` becomes inspecting the
//! descriptor. SDL_CreatePalette (all-white palette, ncolors > 0) becomes a
//! borrowed `[]const Color` checked by `Format.validate_palette`.
//! SDL's SaveBMP writes BGR24 for formats without alpha; zdl always writes a
//! 32-bit V4 BMP (documented in video/bmp.zig), so the BMP check requires the
//! decoded white pixel instead of SDL's specific surface format.
const std = @import("std");
const testing = std.testing;
const pixels = @import("pixels.zig");
const pixels_wide = @import("pixels_wide.zig");
const surface = @import("surface.zig");
const bmp = @import("bmp.zig");
const png = @import("../image/png.zig");
const load = @import("../image/load.zig");

const Masks = pixels.Packed.Masks;

const Spec = struct { name: []const u8, bytes: u3, masks: Masks };

/// SDL_pixels.h little-endian packed layouts for every non-indexed, non-FOURCC
/// format listed by testautomation_pixels.c (byte-array RGB24/BGR24 are separate).
pub const packed_formats = [_]Spec{
    .{ .name = "RGB332", .bytes = 1, .masks = .{ .r = 0xE0, .g = 0x1C, .b = 0x03 } },
    .{ .name = "XRGB4444", .bytes = 2, .masks = .{ .r = 0x0F00, .g = 0x00F0, .b = 0x000F } },
    .{ .name = "XBGR4444", .bytes = 2, .masks = .{ .r = 0x000F, .g = 0x00F0, .b = 0x0F00 } },
    .{ .name = "XRGB1555", .bytes = 2, .masks = .{ .r = 0x7C00, .g = 0x03E0, .b = 0x001F } },
    .{ .name = "XBGR1555", .bytes = 2, .masks = .{ .r = 0x001F, .g = 0x03E0, .b = 0x7C00 } },
    .{ .name = "ARGB4444", .bytes = 2, .masks = .{ .r = 0x0F00, .g = 0x00F0, .b = 0x000F, .a = 0xF000 } },
    .{ .name = "RGBA4444", .bytes = 2, .masks = .{ .r = 0xF000, .g = 0x0F00, .b = 0x00F0, .a = 0x000F } },
    .{ .name = "ABGR4444", .bytes = 2, .masks = .{ .r = 0x000F, .g = 0x00F0, .b = 0x0F00, .a = 0xF000 } },
    .{ .name = "BGRA4444", .bytes = 2, .masks = .{ .r = 0x00F0, .g = 0x0F00, .b = 0xF000, .a = 0x000F } },
    .{ .name = "ARGB1555", .bytes = 2, .masks = .{ .r = 0x7C00, .g = 0x03E0, .b = 0x001F, .a = 0x8000 } },
    .{ .name = "RGBA5551", .bytes = 2, .masks = .{ .r = 0xF800, .g = 0x07C0, .b = 0x003E, .a = 0x0001 } },
    .{ .name = "ABGR1555", .bytes = 2, .masks = .{ .r = 0x001F, .g = 0x03E0, .b = 0x7C00, .a = 0x8000 } },
    .{ .name = "BGRA5551", .bytes = 2, .masks = .{ .r = 0x003E, .g = 0x07C0, .b = 0xF800, .a = 0x0001 } },
    .{ .name = "RGB565", .bytes = 2, .masks = .{ .r = 0xF800, .g = 0x07E0, .b = 0x001F } },
    .{ .name = "BGR565", .bytes = 2, .masks = .{ .r = 0x001F, .g = 0x07E0, .b = 0xF800 } },
    .{ .name = "XRGB8888", .bytes = 4, .masks = .{ .r = 0x00FF0000, .g = 0x0000FF00, .b = 0x000000FF } },
    .{ .name = "RGBX8888", .bytes = 4, .masks = .{ .r = 0xFF000000, .g = 0x00FF0000, .b = 0x0000FF00 } },
    .{ .name = "XBGR8888", .bytes = 4, .masks = .{ .r = 0x000000FF, .g = 0x0000FF00, .b = 0x00FF0000 } },
    .{ .name = "BGRX8888", .bytes = 4, .masks = .{ .r = 0x0000FF00, .g = 0x00FF0000, .b = 0xFF000000 } },
    .{ .name = "ARGB8888", .bytes = 4, .masks = .{ .r = 0x00FF0000, .g = 0x0000FF00, .b = 0x000000FF, .a = 0xFF000000 } },
    .{ .name = "RGBA8888", .bytes = 4, .masks = .{ .r = 0xFF000000, .g = 0x00FF0000, .b = 0x0000FF00, .a = 0x000000FF } },
    .{ .name = "ABGR8888", .bytes = 4, .masks = .{ .r = 0x000000FF, .g = 0x0000FF00, .b = 0x00FF0000, .a = 0xFF000000 } },
    .{ .name = "BGRA8888", .bytes = 4, .masks = .{ .r = 0x0000FF00, .g = 0x00FF0000, .b = 0xFF000000, .a = 0x000000FF } },
    .{ .name = "XRGB2101010", .bytes = 4, .masks = .{ .r = 0x3FF00000, .g = 0x000FFC00, .b = 0x000003FF } },
    .{ .name = "XBGR2101010", .bytes = 4, .masks = .{ .r = 0x000003FF, .g = 0x000FFC00, .b = 0x3FF00000 } },
    .{ .name = "ARGB2101010", .bytes = 4, .masks = .{ .r = 0x3FF00000, .g = 0x000FFC00, .b = 0x000003FF, .a = 0xC0000000 } },
    .{ .name = "ABGR2101010", .bytes = 4, .masks = .{ .r = 0x000003FF, .g = 0x000FFC00, .b = 0x3FF00000, .a = 0xC0000000 } },
};

/// Every non-indexed, non-FOURCC format of the SDL list as a zdl descriptor.
fn all_rgb_formats(buffer: *[packed_formats.len + 6]pixels.Format) []const pixels.Format {
    var n: usize = 0;
    for (packed_formats) |spec| {
        buffer[n] = .{ .masked = pixels.Packed.from_masks(spec.bytes, .little, spec.masks) catch unreachable };
        n += 1;
    }
    for ([_]pixels.Format{ .rgb8, .bgr8, .rgba8, .bgra8, .argb8, .abgr8 }) |f| {
        buffer[n] = f;
        n += 1;
    }
    return buffer[0..n];
}

// pixels_getPixelFormatDetails
test "sdl pixels: format details" {
    for (packed_formats) |spec| {
        const format = pixels.Packed.from_masks(spec.bytes, .little, spec.masks) catch |err| {
            std.debug.print("{s}: {}\n", .{ spec.name, err });
            return err;
        };
        const f: pixels.Format = .{ .masked = format };
        try testing.expect(f.bits_per_pixel() > 0);
        const combined = spec.masks.r | spec.masks.g | spec.masks.b | spec.masks.a;
        try testing.expect(combined > 0);
        const ten_bit = std.mem.endsWith(u8, spec.name, "2101010");
        if (ten_bit) {
            try testing.expectEqual(10, format.channels[0].bits);
            try testing.expectEqual(10, format.channels[1].bits);
            try testing.expectEqual(10, format.channels[2].bits);
        } else if (spec.bytes == 4) {
            try testing.expectEqual(8, format.channels[0].bits);
            try testing.expectEqual(8, format.channels[1].bits);
            try testing.expectEqual(8, format.channels[2].bits);
        }
        try testing.expectEqual(@as(usize, spec.bytes) * 8, f.bits_per_pixel());
    }
    const rgb8: pixels.Format = .rgb8;
    const bgr8: pixels.Format = .bgr8;
    const rgba8: pixels.Format = .rgba8;
    try testing.expectEqual(24, rgb8.bits_per_pixel());
    try testing.expectEqual(24, bgr8.bits_per_pixel());
    try testing.expectEqual(32, rgba8.bits_per_pixel());
    // Indexed formats: SDL INDEX1/2/4/8 with LSB and MSB bit orders.
    for ([_]u4{ 1, 2, 4, 8 }) |bits| {
        for ([_]pixels.BitOrder{ .lsb_first, .msb_first }) |order| {
            const f: pixels.Format = .{ .indexed = try pixels.Indexed.init(bits, order) };
            try testing.expectEqual(@as(usize, bits), f.bits_per_pixel());
        }
    }
    // Invalid descriptors are rejected (negative cases).
    try testing.expectError(error.InvalidMasks, pixels.Indexed.init(3, .msb_first));
    try testing.expectError(error.InvalidMasks, pixels.Packed.from_masks(2, .little, .{ .r = 0, .g = 1, .b = 2 }));
    try testing.expectError(error.InvalidMasks, pixels.Packed.from_masks(2, .little, .{ .r = 0xF800, .g = 0xF800, .b = 0x1F }));
    try testing.expectError(error.InvalidMasks, pixels.Packed.from_masks(1, .little, .{ .r = 0xF00, .g = 0xF0, .b = 0xF }));
}

// pixels_allocFreePalette
test "sdl pixels: palette validation" {
    const indexed8: pixels.Format = .{ .indexed = try pixels.Indexed.init(8, .msb_first) };
    var white: [16]pixels.Color = undefined;
    @memset(&white, .{ .r = 255, .g = 255, .b = 255 });
    for ([_]usize{ 1, 2, 8, 16 }) |count| {
        try indexed8.validate_palette(white[0..count]);
        for (white[0..count]) |c| {
            try testing.expectEqual(pixels.Color{ .r = 255, .g = 255, .b = 255, .a = 255 }, c);
        }
    }
    // ncolors <= 0 is invalid (SDL: "Parameter 'ncolors' is invalid").
    try testing.expectError(error.InvalidPalette, indexed8.validate_palette(white[0..0]));
    try testing.expectError(error.InvalidPalette, indexed8.validate_palette(null));
    // More colors than the index width can address.
    const indexed1: pixels.Format = .{ .indexed = try pixels.Indexed.init(1, .lsb_first) };
    try testing.expectError(error.InvalidPalette, indexed1.validate_palette(white[0..3]));
}

fn expect_white(color: pixels.Color) !void {
    try testing.expectEqual(pixels.Color{ .r = 255, .g = 255, .b = 255, .a = 255 }, color);
}

// pixels_saveLoadBMP
test "sdl pixels: save and load BMP" {
    var buffer: [packed_formats.len + 6]pixels.Format = undefined;
    for (all_rgb_formats(&buffer)) |format| {
        var s = try surface.Surface.init(testing.allocator, 1, 1, format, null);
        defer s.deinit();
        try s.view.fill(.{ .r = 255, .g = 255, .b = 255, .a = 255 }, null);
        const bytes = try bmp.encode(testing.allocator, s.view);
        defer testing.allocator.free(bytes);
        var image = try bmp.decode(testing.allocator, bytes, .{});
        defer image.deinit();
        try testing.expectEqual(1, image.surface.view.width);
        try expect_white(try image.surface.view.read(0, 0));
    }
}

// pixels_saveLoadPNG
test "sdl pixels: save and load PNG" {
    var buffer: [packed_formats.len + 6]pixels.Format = undefined;
    for (all_rgb_formats(&buffer)) |format| {
        var s = try surface.Surface.init(testing.allocator, 1, 1, format, null);
        defer s.deinit();
        try s.view.fill(.{ .r = 255, .g = 255, .b = 255, .a = 255 }, null);
        const bytes = try png.encode(testing.allocator, s.view);
        defer testing.allocator.free(bytes);
        var image = try load.load_png(testing.allocator, bytes);
        defer image.deinit();
        // SDL expects RGBA32 (bytes 255/255/255/255).
        try expect_white(try image.surface.view.read(0, 0));
        try testing.expectEqualSlices(u8, &.{ 255, 255, 255, 255 }, image.surface.view.data[0..4]);
    }
}

// The "large formats" half of both save/load tests: wide layouts filled white
// read back as white after conversion to eight-bit color.
test "sdl pixels: wide formats clear to white" {
    for (std.enums.values(pixels_wide.Layout)) |layout| {
        var bytes: [16]u8 = @splat(0);
        const pixel = bytes[0..layout.bytes_per_pixel()];
        try layout.write(pixel, .{ .r = 1, .g = 1, .b = 1, .a = 1 });
        const back = try layout.read(pixel);
        try expect_white(back.to_color());
    }
}

// Format round-trip: white (and a mid grey) survive pack/unpack through every format.
test "sdl pixels: packed formats round trip" {
    var buffer: [packed_formats.len + 6]pixels.Format = undefined;
    for (all_rgb_formats(&buffer)) |format| {
        var row: [8]u8 = @splat(0);
        try format.write(&row, 0, .{ .r = 255, .g = 255, .b = 255, .a = 255 }, null);
        try expect_white(try format.read(&row, 0, null));
        try format.write(&row, 0, .{ .r = 0, .g = 0, .b = 0, .a = 255 }, null);
        const black = try format.read(&row, 0, null);
        try testing.expectEqual(pixels.Color{ .r = 0, .g = 0, .b = 0, .a = 255 }, black);
    }
}
