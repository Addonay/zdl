//! Disposable provider-raster capture. No native handles/closures enter packets.
const std = @import("std");
const zdl = @import("zdl");
const p = zdl.paint;
pub const Options = struct {
    max_bytes: usize = 64 * 1024 * 1024,
    /// Native raster/layout pixels per target logical unit. Regenerate layout and
    /// raster when device scale/font policy changes; this is not a text reflow API.
    pixels_per_unit: f64 = 1,
};
pub const Raster = struct {
    image: p.Image,
    origin_px: p.Point,
    pixels_per_unit: f64,
    /// Retains immutable pixels for a cache/state owner, without provider handles.
    pub fn clone(self: *const Raster) !Raster {
        return .{ .image = try self.image.clone(), .origin_px = self.origin_px, .pixels_per_unit = self.pixels_per_unit };
    }
    pub fn deinit(self: *Raster) void {
        self.image.deinit();
        self.* = undefined;
    }
    /// Layout origin in target logical units; includes negative-ink/padding offset.
    /// Recording retains an independent Image lease, not this Raster or provider.
    pub fn draw(self: *const Raster, recorder: *p.Recorder, origin: p.Point, sampling: p.Sampling) !void {
        const view = try self.image.view();
        const width: f64 = @floatFromInt(view.width);
        const height: f64 = @floatFromInt(view.height);
        try recorder.draw_image(&self.image, .{ .x = 0, .y = 0, .width = width, .height = height }, .{ .x = origin.x - self.origin_px.x / self.pixels_per_unit, .y = origin.y - self.origin_px.y / self.pixels_per_unit, .width = width / self.pixels_per_unit, .height = height / self.pixels_per_unit }, sampling);
    }
};
/// Native input must be a stable, flushed, premultiplied native-endian ARGB32
/// bitmap with width/height/stride/pixels and layout origin_x/origin_y. It borrows
/// only for this call. Unpremultiply to the core straight-sRGB resource contract;
/// replay's rounded premultiplication preserves valid original ARGB8 texels.
pub fn capture_argb32(allocator: std.mem.Allocator, native: anytype, options: Options) !Raster {
    if (!std.math.isFinite(options.pixels_per_unit) or options.pixels_per_unit <= 0) return error.InvalidScale;
    const width = std.math.cast(u31, native.width) orelse return error.InvalidSize;
    const height = std.math.cast(u31, native.height) orelse return error.InvalidSize;
    const row = std.math.mul(usize, width, 4) catch return error.ImageLimit;
    const bytes = std.math.mul(usize, row, height) catch return error.ImageLimit;
    if (bytes > options.max_bytes) return error.ImageLimit;
    if (native.stride < row) return error.InvalidBuffer;
    const prefix = if (width == 0 or height == 0) 0 else std.math.mul(usize, native.stride, height - 1) catch return error.InvalidBuffer;
    const required = if (width == 0 or height == 0) 0 else std.math.add(usize, prefix, row) catch return error.InvalidBuffer;
    if (native.pixels.len < required) return error.InvalidBuffer;
    const rgba = try allocator.alloc(u8, bytes);
    defer allocator.free(rgba);
    if (width != 0) {
        for (0..height) |y| for (0..width) |x| {
            const value = std.mem.readInt(u32, native.pixels[y * native.stride + x * 4 ..][0..4], @import("builtin").target.cpu.arch.endian());
            const a: u32 = value >> 24;
            const r: u32 = (value >> 16) & 255;
            const g: u32 = (value >> 8) & 255;
            const b: u32 = value & 255;
            if (r > a or g > a or b > a) return error.InvalidPremultiplication;
            const offset = y * row + x * 4;
            rgba[offset] = if (a == 0) 0 else @intCast((r * 255 + a / 2) / a);
            rgba[offset + 1] = if (a == 0) 0 else @intCast((g * 255 + a / 2) / a);
            rgba[offset + 2] = if (a == 0) 0 else @intCast((b * 255 + a / 2) / a);
            rgba[offset + 3] = @intCast(a);
        };
    }
    return .{ .image = try p.Image.copy(allocator, try zdl.surface.View.init(rgba, width, height, row, .rgba8, null), options.max_bytes), .origin_px = .{ .x = @floatFromInt(native.origin_x), .y = @floatFromInt(native.origin_y) }, .pixels_per_unit = options.pixels_per_unit };
}
