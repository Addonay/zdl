//! SDL's embedded automation test images (test/testautomation_images.c), extracted
//! by tools/gen/test_images.py. Used only by test code; never referenced by the
//! library, so it adds nothing to consumers' binaries.
const std = @import("std");
const pixels = @import("../video/pixels.zig");
const surface = @import("../video/surface.zig");

pub const Image = struct {
    width: u31,
    height: u31,
    /// Memory byte order of each pixel in `data`.
    format: pixels.Format,
    data: []const u8,

    /// Copies the image into an owned, writable surface.
    pub fn to_surface(self: Image, allocator: std.mem.Allocator) !surface.Surface {
        var result = try surface.Surface.init(allocator, self.width, self.height, self.format, null);
        errdefer result.deinit();
        const bytes = self.format.bits_per_pixel() / 8;
        for (0..self.height) |y| @memcpy(try result.view.row(y), self.data[y * self.width * bytes ..][0 .. self.width * bytes]);
        return result;
    }
};

pub const blit: Image = .{ .width = 80, .height = 60, .format = .rgb8, .data = @embedFile("images/Blit.3") };
pub const blit_tiled: Image = .{ .width = 80, .height = 60, .format = .rgb8, .data = @embedFile("images/BlitTiled.3") };
pub const blit_color: Image = .{ .width = 80, .height = 60, .format = .rgb8, .data = @embedFile("images/BlitColor.3") };
pub const clamped_sprite: Image = .{ .width = 80, .height = 60, .format = .rgb8, .data = @embedFile("images/ClampedSprite.3") };
pub const face: Image = .{ .width = 32, .height = 32, .format = .rgba8, .data = @embedFile("images/Face.4") };
pub const primitives: Image = .{ .width = 80, .height = 60, .format = .rgb8, .data = @embedFile("images/Primitives.3") };
/// SDLTest_ImageBlendingBackground (BGRA32 in SDL's enum: bytes B,G,R,A).
pub const blending_background: Image = .{ .width = 32, .height = 32, .format = .bgra8, .data = @embedFile("images/RainbowBackground.4") };
pub const blending_sprite: Image = .{ .width = 32, .height = 32, .format = .bgra8, .data = @embedFile("images/TransparentSprite.4") };
pub const wrapping_sprite: Image = .{ .width = 80, .height = 60, .format = .rgb8, .data = @embedFile("images/WrappingSprite.3") };
