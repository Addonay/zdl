//! Pixel-level operations applied after a codec has produced its image.
//!
//! Orientation, cropping, background compositing, premultiplication and row
//! flipping all work on four-channel RGBA8, which is the layout every codec can
//! produce and the only one where a byte-wise transform is correct. The facade
//! converts before calling in, so these functions never have to reason about
//! packed or indexed layouts.
const std = @import("std");
const surface = @import("../video/surface.zig");
const pixels = @import("../video/pixels.zig");
const animation = @import("animation.zig");

pub const Error = surface.Error || std.mem.Allocator.Error || error{ InvalidSize, InvalidCrop, NotRgba8, UnsupportedOrientation };

/// EXIF orientation, stored as the orientation tag value.
pub const Orientation = enum(u8) {
    upright = 1,
    mirror_horizontal = 2,
    rotate_180 = 3,
    mirror_vertical = 4,
    transpose = 5,
    rotate_90 = 6,
    transverse = 7,
    rotate_270 = 8,

    /// Tag values outside 1 to 8 fall back to `upright`.
    pub fn fromTag(value: u32) Orientation {
        const tag = std.math.cast(u8, value) orelse return .upright;
        return if (tag >= 1 and tag <= 8) @fromBackingInt(tag) else .upright;
    }

    /// True when applying the orientation exchanges the image axes.
    pub fn swapsAxes(self: Orientation) bool {
        return switch (self) {
            .transpose, .rotate_90, .transverse, .rotate_270 => true,
            else => false,
        };
    }

    /// Maps a destination pixel back to the source pixel it reads from, for an
    /// image of `out_width` by `out_height`.
    pub fn sourcePixel(self: Orientation, x: u32, y: u32, out_width: u32, out_height: u32) struct { x: u32, y: u32 } {
        return switch (self) {
            .upright => .{ .x = x, .y = y },
            .mirror_horizontal => .{ .x = out_width - 1 - x, .y = y },
            .rotate_180 => .{ .x = out_width - 1 - x, .y = out_height - 1 - y },
            .mirror_vertical => .{ .x = x, .y = out_height - 1 - y },
            // Transpose reflects about the main diagonal.
            .transpose => .{ .x = y, .y = x },
            .rotate_90 => .{ .x = y, .y = out_width - 1 - x },
            .transverse => .{ .x = out_height - 1 - y, .y = out_width - 1 - x },
            .rotate_270 => .{ .x = out_height - 1 - y, .y = x },
        };
    }
};

/// Swaps top and bottom rows in place. Rows must have equal length, which the
/// surface guarantees.
pub fn flipRows(view: surface.View) Error!void {
    if (!std.meta.eql(view.format, .rgba8)) return error.NotRgba8;
    for (0..view.height / 2) |y| {
        const top = try view.row(y);
        const bottom = try view.row(view.height - 1 - y);
        for (top, bottom) |*a, *b| std.mem.swap(u8, a, b);
    }
}

/// Rotates, mirrors or transposes into a freshly allocated image. The axes are
/// exchanged for the four orientations that need it.
pub fn orient(allocator: std.mem.Allocator, view: surface.View, orientation: Orientation) Error!surface.Surface {
    if (!std.meta.eql(view.format, .rgba8)) return error.NotRgba8;
    if (orientation == .upright) return surface.Surface.copy(allocator, view);
    const swap = orientation.swapsAxes();
    const out_width: u31 = if (swap) view.height else view.width;
    const out_height: u31 = if (swap) view.width else view.height;
    var result = try surface.Surface.init(allocator, out_width, out_height, .rgba8, null);
    errdefer result.deinit();
    const stride = @as(usize, out_width) * 4;
    for (0..out_height) |y| {
        const row = try result.view.row(y);
        for (0..out_width) |x| {
            const source = orientation.sourcePixel(@intCast(x), @intCast(y), out_width, out_height);
            const src = try view.row(source.y);
            @memcpy(row[x * 4 ..][0..4], src[source.x * 4 ..][0..4]);
        }
    }
    _ = stride;
    return result;
}

/// Copies a rectangle into a new image. A rectangle covering the whole image
/// still copies, because the result is tightly packed.
pub fn crop(
    allocator: std.mem.Allocator,
    view: surface.View,
    region: struct { x: u32, y: u32, width: u32, height: u32 },
) Error!surface.Surface {
    if (!std.meta.eql(view.format, .rgba8)) return error.NotRgba8;
    if (region.width == 0 or region.height == 0) return error.InvalidCrop;
    if (region.x > view.width or region.y > view.height or region.width > view.width - region.x or region.height > view.height - region.y) return error.InvalidCrop;
    var result = try surface.Surface.init(allocator, @intCast(region.width), @intCast(region.height), .rgba8, null);
    errdefer result.deinit();
    for (0..region.height) |y| {
        const src = try view.row(region.y + y);
        const dst = try result.view.row(y);
        const start = @as(usize, region.x) * 4;
        @memcpy(dst[0 .. @as(usize, region.width) * 4], src[start..][0 .. @as(usize, region.width) * 4]);
    }
    return result;
}

/// Composites in place over an opaque background, leaving the result opaque.
pub fn compositeBackground(view: surface.View, background: pixels.Color) Error!void {
    if (!std.meta.eql(view.format, .rgba8)) return error.NotRgba8;
    for (0..view.height) |y| {
        const row = try view.row(y);
        var x: usize = 0;
        while (x + 4 <= row.len) : (x += 4) {
            if (row[x + 3] == 255) continue;
            animation.blendRow(row[x..][0..4], row[x..][0..4], background);
        }
    }
}

/// Multiplies color by alpha in place with round-to-nearest scaling.
pub fn premultiply(view: surface.View) Error!void {
    if (!std.meta.eql(view.format, .rgba8)) return error.NotRgba8;
    for (0..view.height) |y| {
        const row = try view.row(y);
        var x: usize = 0;
        while (x + 4 <= row.len) : (x += 4) {
            const a = row[x + 3];
            if (a == 255) continue;
            if (a == 0) {
                @memset(row[x..][0..3], 0);
                continue;
            }
            row[x + 0] = @intCast((@as(u16, row[x + 0]) * a + 127) / 255);
            row[x + 1] = @intCast((@as(u16, row[x + 1]) * a + 127) / 255);
            row[x + 2] = @intCast((@as(u16, row[x + 2]) * a + 127) / 255);
        }
    }
}

/// Reads the EXIF orientation tag from a TIFF-header block, as stored in a JPEG
/// APP1 segment, a PNG `eXIf` chunk or an ISOBMFF `Exif` item.
pub fn exifOrientation(exif: []const u8) ?Orientation {
    if (exif.len < 8) return null;
    const order: std.builtin.Endian = if (std.mem.eql(u8, exif[0..2], "II")) .little else if (std.mem.eql(u8, exif[0..2], "MM")) .big else return null;
    if (std.mem.readInt(u16, exif[2..4], order) != 42) return null;
    const ifd: usize = std.mem.readInt(u32, exif[4..8], order);
    if (ifd < 8 or ifd + 2 > exif.len) return null;
    const count = std.mem.readInt(u16, exif[ifd..][0..2], order);
    var i: usize = 0;
    while (i < count) : (i += 1) {
        const entry = ifd + 2 + i * 12;
        if (entry + 12 > exif.len) return null;
        if (std.mem.readInt(u16, exif[entry..][0..2], order) != 0x0112) continue;
        const value = std.mem.readInt(u16, exif[entry + 8 ..][0..2], order);
        return Orientation.fromTag(value);
    }
    return null;
}

test "orientation maps destination pixels to their source" {
    // A 3x2 image, so width and height are distinguishable.
    var source = try surface.Surface.init(std.testing.allocator, 3, 2, .rgba8, null);
    defer source.deinit();
    for (0..2) |y| for (0..3) |x| {
        try source.view.write(x, y, .{ .r = @intCast(x * 10), .g = @intCast(y * 10), .b = 0, .a = 255 });
    };
    var rotated = try orient(std.testing.allocator, source.view, .rotate_90);
    defer rotated.deinit();
    try std.testing.expectEqual(@as(u31, 2), rotated.view.width);
    try std.testing.expectEqual(@as(u31, 3), rotated.view.height);
    // Rotating 90 degrees clockwise sends the top-left pixel to the top-right.
    try std.testing.expectEqual(@as(u8, 0), (try rotated.view.read(1, 0)).r);
    try std.testing.expectEqual(@as(u8, 0), (try rotated.view.read(1, 0)).g);
    try std.testing.expectEqual(@as(u8, 10), (try rotated.view.read(0, 1)).r);

    var mirrored = try orient(std.testing.allocator, source.view, .mirror_horizontal);
    defer mirrored.deinit();
    try std.testing.expectEqual(@as(u8, 20), (try mirrored.view.read(0, 0)).r);

    var transposed = try orient(std.testing.allocator, source.view, .transpose);
    defer transposed.deinit();
    try std.testing.expectEqual(@as(u8, 10), (try transposed.view.read(0, 1)).r);
}

test "crop, background, premultiply and flip" {
    var source = try surface.Surface.init(std.testing.allocator, 4, 4, .rgba8, null);
    defer source.deinit();
    for (0..4) |y| for (0..4) |x| {
        try source.view.write(x, y, .{ .r = 200, .g = 100, .b = 0, .a = if (x == 0) 0 else 255 });
    };
    var cropped = try crop(std.testing.allocator, source.view, .{ .x = 1, .y = 1, .width = 2, .height = 2 });
    defer cropped.deinit();
    try std.testing.expectEqual(@as(u31, 2), cropped.view.width);
    try std.testing.expectEqual(@as(u8, 200), (try cropped.view.read(0, 0)).r);
    try std.testing.expectError(error.InvalidCrop, crop(std.testing.allocator, source.view, .{ .x = 3, .y = 0, .width = 2, .height = 1 }));

    try compositeBackground(cropped.view, .{ .r = 0, .g = 0, .b = 255, .a = 255 });
    for (0..2) |y| for (0..2) |x| {
        try std.testing.expectEqual(@as(u8, 255), (try cropped.view.read(x, y)).a);
    };

    try premultiply(source.view);
    try std.testing.expectEqual(@as(u8, 200), (try source.view.read(1, 0)).r);
    try flipRows(source.view);
    try std.testing.expectEqual(@as(u8, 0), (try source.view.read(0, 0)).r);
}

test "EXIF orientation is read from either byte order" {
    const little = [_]u8{ 'I', 'I', 42, 0, 8, 0, 0, 0, 1, 0, 0x12, 0x01, 3, 0, 1, 0, 0, 0, 6, 0, 0, 0, 0, 0 };
    try std.testing.expectEqual(Orientation.rotate_90, exifOrientation(&little).?);
    const big = [_]u8{ 'M', 'M', 0, 42, 0, 0, 0, 8, 0, 1, 0x01, 0x12, 0, 3, 0, 0, 0, 1, 0, 6, 0, 0, 0, 0 };
    try std.testing.expectEqual(Orientation.rotate_90, exifOrientation(&big).?);
    try std.testing.expectEqual(@as(?Orientation, null), exifOrientation("nope"));
}
