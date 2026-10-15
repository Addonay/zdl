//! Antialiased 2D drawing over a straight-alpha RGBA8 buffer.
//!
//! Shapes are evaluated per pixel from signed distance fields, so rounded
//! corners, hairline borders and soft shadows share one coverage model. Coverage
//! is sampled at pixel centers and clamped to a one-pixel transition band, which
//! keeps edges crisp on whole pixels and smooth on curves.
//!
//! Compositing happens in sRGB, the space browsers blend in, so the reference
//! renders of shadcn/ui match. Colors use the zlay convention: channels in
//! 0..255 and alpha in 0..255.

const std = @import("std");
const zlay = @import("zlay");

pub const Color = zlay.Color;

/// Device-pixel rectangle.
pub const Rect = struct {
    x: f32,
    y: f32,
    w: f32,
    h: f32,

    pub fn right(self: Rect) f32 {
        return self.x + self.w;
    }

    pub fn bottom(self: Rect) f32 {
        return self.y + self.h;
    }

    pub fn inset(self: Rect, amount: f32) Rect {
        return .{ .x = self.x + amount, .y = self.y + amount, .w = self.w - 2 * amount, .h = self.h - 2 * amount };
    }
};

pub const Point = struct { x: f32, y: f32 };

/// Corner radii in device pixels, clockwise from the top left.
pub const Radii = struct {
    tl: f32 = 0,
    tr: f32 = 0,
    br: f32 = 0,
    bl: f32 = 0,

    pub fn all(r: f32) Radii {
        return .{ .tl = r, .tr = r, .br = r, .bl = r };
    }

    pub fn scale(self: Radii, factor: f32) Radii {
        return .{ .tl = self.tl * factor, .tr = self.tr * factor, .br = self.br * factor, .bl = self.bl * factor };
    }

    pub fn shrink(self: Radii, amount: f32) Radii {
        const shrunk = struct {
            fn apply(r: f32, by: f32) f32 {
                return @max(0, r - by);
            }
        }.apply;
        return .{ .tl = shrunk(self.tl, amount), .tr = shrunk(self.tr, amount), .br = shrunk(self.br, amount), .bl = shrunk(self.bl, amount) };
    }

    pub fn grow(self: Radii, amount: f32) Radii {
        return .{ .tl = self.tl + amount, .tr = self.tr + amount, .br = self.br + amount, .bl = self.bl + amount };
    }
};

/// Fill source: a solid color or a vertical two-stop gradient between two y
/// coordinates (CSS `linear-gradient(to top/bottom, ...)`).
pub const Paint = union(enum) {
    solid: Color,
    vertical: struct {
        top_color: Color,
        bottom_color: Color,
        top_y: f32,
        bottom_y: f32,
    },

    pub fn at(self: Paint, y: f32) Color {
        return switch (self) {
            .solid => |color| color,
            .vertical => |gradient| blk: {
                const span = gradient.bottom_y - gradient.top_y;
                const t = if (span == 0) 0 else std.math.clamp((y - gradient.top_y) / span, 0, 1);
                break :blk Color.lerp(gradient.top_color, gradient.bottom_color, t);
            },
        };
    }
};

/// One blurred layer of a box shadow, as in CSS `box-shadow` (blur = 2 sigma).
pub const ShadowLayer = struct {
    offset_y: f32 = 0,
    blur: f32 = 0,
    spread: f32 = 0,
    color: Color,
};

/// Integer clip rectangle, `[x0, x1) x [y0, y1)` in device pixels.
const Clip = struct {
    x0: i32,
    y0: i32,
    x1: i32,
    y1: i32,

    fn intersect(a: Clip, b: Clip) Clip {
        return .{ .x0 = @max(a.x0, b.x0), .y0 = @max(a.y0, b.y0), .x1 = @min(a.x1, b.x1), .y1 = @min(a.y1, b.y1) };
    }

    fn empty(self: Clip) bool {
        return self.x1 <= self.x0 or self.y1 <= self.y0;
    }
};

pub const Canvas = struct {
    pixels: []u8,
    width: u32,
    height: u32,
    /// Bytes between the starts of consecutive rows.
    stride: usize,
    clip: Clip,
    clip_stack: [16]Clip = undefined,
    clip_depth: usize = 0,

    pub fn init(pixels: []u8, width: u32, height: u32, stride: usize) Canvas {
        const full: Clip = .{ .x0 = 0, .y0 = 0, .x1 = @intCast(width), .y1 = @intCast(height) };
        return .{ .pixels = pixels, .width = width, .height = height, .stride = stride, .clip = full };
    }

    /// Fills the whole buffer with an opaque color. Uses 16-byte vector stores.
    pub fn clear(self: *Canvas, color: Color) void {
        const pattern: [16]u8 = @bitCast(pixel_pattern(color));
        const row_bytes = @as(usize, self.width) * 4;
        for (0..self.height) |y| {
            const row = self.pixels[y * self.stride ..][0..row_bytes];
            var x: usize = 0;
            while (x + 16 <= row_bytes) : (x += 16) {
                row[x..][0..16].* = pattern;
            }
            while (x < row_bytes) : (x += 1) row[x] = pattern[x % 4];
        }
    }

    /// Restricts drawing to `rect` (rounded to whole pixels, outward) until the
    /// matching `pop_clip`. Nesting intersects, and a deep stack is an error.
    pub fn push_clip(self: *Canvas, rect: Rect) void {
        std.debug.assert(self.clip_depth < self.clip_stack.len);
        self.clip_stack[self.clip_depth] = self.clip;
        self.clip_depth += 1;
        self.clip = self.clip.intersect(bounds_of(rect, 0));
    }

    pub fn pop_clip(self: *Canvas) void {
        std.debug.assert(self.clip_depth > 0);
        self.clip_depth -= 1;
        self.clip = self.clip_stack[self.clip_depth];
    }

    /// Axis-aligned fill with no antialiasing beyond the rectangle's own edges.
    pub fn fill_rect(self: *Canvas, rect: Rect, paint: Paint) void {
        self.fill_rounded(rect, .{}, paint);
    }

    /// Fills a rounded rectangle with per-corner radii.
    pub fn fill_rounded(self: *Canvas, rect: Rect, radii: Radii, paint: Paint) void {
        if (rect.w <= 0 or rect.h <= 0) return;
        const region = self.clip.intersect(bounds_of(rect, 1));
        if (region.empty()) return;
        const center_x = rect.x + rect.w / 2;
        const center_y = rect.y + rect.h / 2;
        const half_w = rect.w / 2;
        const half_h = rect.h / 2;
        const clamped = clamp_radii(radii, half_w, half_h);

        var y = region.y0;
        while (y < region.y1) : (y += 1) {
            const py = @as(f32, @floatFromInt(y)) + 0.5 - center_y;
            const color = paint.at(@as(f32, @floatFromInt(y)) + 0.5);
            var x = region.x0;
            while (x < region.x1) : (x += 1) {
                const px = @as(f32, @floatFromInt(x)) + 0.5 - center_x;
                const distance = rounded_distance(px, py, half_w, half_h, clamped);
                const coverage = std.math.clamp(0.5 - distance, 0, 1);
                if (coverage > 0) self.blend(x, y, color, coverage);
            }
        }
    }

    /// Paints the ring between a rounded rectangle's outer edge and an edge
    /// `width` pixels inside it: a border.
    pub fn stroke_rounded(self: *Canvas, rect: Rect, radii: Radii, width: f32, color: Color) void {
        if (rect.w <= 0 or rect.h <= 0 or width <= 0) return;
        const region = self.clip.intersect(bounds_of(rect, 1));
        if (region.empty()) return;
        const outer_half_w = rect.w / 2;
        const outer_half_h = rect.h / 2;
        const outer_radii = clamp_radii(radii, outer_half_w, outer_half_h);
        const inner_rect = rect.inset(width);
        const inner_half_w = @max(0, inner_rect.w / 2);
        const inner_half_h = @max(0, inner_rect.h / 2);
        const inner_radii = clamp_radii(radii.shrink(width), inner_half_w, inner_half_h);
        const center_x = rect.x + outer_half_w;
        const center_y = rect.y + outer_half_h;
        const inner_center_x = inner_rect.x + inner_half_w;
        const inner_center_y = inner_rect.y + inner_half_h;

        var y = region.y0;
        while (y < region.y1) : (y += 1) {
            const fy = @as(f32, @floatFromInt(y)) + 0.5;
            var x = region.x0;
            while (x < region.x1) : (x += 1) {
                const fx = @as(f32, @floatFromInt(x)) + 0.5;
                const outer = std.math.clamp(0.5 - rounded_distance(fx - center_x, fy - center_y, outer_half_w, outer_half_h, outer_radii), 0, 1);
                if (outer <= 0) continue;
                const inner = std.math.clamp(0.5 - rounded_distance(fx - inner_center_x, fy - inner_center_y, inner_half_w, inner_half_h, inner_radii), 0, 1);
                const coverage = outer - inner;
                if (coverage > 0) self.blend(x, y, color, coverage);
            }
        }
    }

    /// Draws a soft shadow beneath `rect` by evaluating a Gaussian-blurred
    /// rounded-rectangle coverage, the way CSS box-shadow does.
    pub fn shadow(self: *Canvas, rect: Rect, radii: Radii, layer: ShadowLayer) void {
        const sigma = @max(layer.blur / 2, 0.01);
        const shape: Rect = .{
            .x = rect.x - layer.spread,
            .y = rect.y + layer.offset_y - layer.spread,
            .w = rect.w + 2 * layer.spread,
            .h = rect.h + 2 * layer.spread,
        };
        const reach = 3 * sigma;
        const region = self.clip.intersect(bounds_of(.{ .x = shape.x - reach, .y = shape.y - reach, .w = shape.w + 2 * reach, .h = shape.h + 2 * reach }, 1));
        if (region.empty()) return;
        const half_w = shape.w / 2;
        const half_h = shape.h / 2;
        const center_x = shape.x + half_w;
        const center_y = shape.y + half_h;
        const shape_radii = clamp_radii(radii.grow(layer.spread), half_w, half_h);

        var y = region.y0;
        while (y < region.y1) : (y += 1) {
            const fy = @as(f32, @floatFromInt(y)) + 0.5 - center_y;
            var x = region.x0;
            while (x < region.x1) : (x += 1) {
                const fx = @as(f32, @floatFromInt(x)) + 0.5 - center_x;
                const distance = rounded_distance(fx, fy, half_w, half_h, shape_radii);
                const coverage = 0.5 * erfc(distance / (sigma * std.math.sqrt2));
                if (coverage > 0.001) self.blend(x, y, layer.color, coverage);
            }
        }
    }

    /// Strokes a polyline of straight segments with round ends. Each segment is
    /// evaluated against its own distance field and blended, which is exact for
    /// opaque colors (overlaps at joints are the same color).
    pub fn stroke_polyline(self: *Canvas, points: []const Point, width: f32, color: Color) void {
        if (points.len < 2 or width <= 0) return;
        const radius = width / 2;
        for (points[0 .. points.len - 1], points[1..]) |a, b| {
            const min_x = @min(a.x, b.x) - radius - 1;
            const min_y = @min(a.y, b.y) - radius - 1;
            const max_x = @max(a.x, b.x) + radius + 1;
            const max_y = @max(a.y, b.y) + radius + 1;
            const region = self.clip.intersect(bounds_of(.{ .x = min_x, .y = min_y, .w = max_x - min_x, .h = max_y - min_y }, 0));
            if (region.empty()) continue;
            const dx = b.x - a.x;
            const dy = b.y - a.y;
            const length_squared = dx * dx + dy * dy;
            var y = region.y0;
            while (y < region.y1) : (y += 1) {
                const fy = @as(f32, @floatFromInt(y)) + 0.5;
                var x = region.x0;
                while (x < region.x1) : (x += 1) {
                    const fx = @as(f32, @floatFromInt(x)) + 0.5;
                    const t = if (length_squared == 0) 0 else std.math.clamp(((fx - a.x) * dx + (fy - a.y) * dy) / length_squared, 0, 1);
                    const ex = fx - (a.x + dx * t);
                    const ey = fy - (a.y + dy * t);
                    const distance = @sqrt(ex * ex + ey * ey);
                    const coverage = std.math.clamp(radius - distance + 0.5, 0, 1);
                    if (coverage > 0) self.blend(x, y, color, coverage);
                }
            }
        }
    }

    /// Blends an 8-bit coverage mask (row-major, `width` x `height`) at integer
    /// device coordinates. Used for glyphs and rasterized icons. `lut` maps
    /// coverage through a gamma curve when provided.
    pub fn blend_coverage(self: *Canvas, coverage: []const u8, width: u32, height: u32, x: i32, y: i32, color: Color, lut: ?*const [256]u8) void {
        const region = self.clip.intersect(.{ .x0 = x, .y0 = y, .x1 = x + @as(i32, @intCast(width)), .y1 = y + @as(i32, @intCast(height)) });
        if (region.empty()) return;
        var py = region.y0;
        while (py < region.y1) : (py += 1) {
            const row = coverage[@as(usize, @intCast(py - y)) * width ..];
            var px = region.x0;
            while (px < region.x1) : (px += 1) {
                var value = row[@as(usize, @intCast(px - x))];
                if (lut) |table| value = table[value];
                if (value != 0) self.blend(px, py, color, @as(f32, @floatFromInt(value)) / 255);
            }
        }
    }

    /// Blends one pixel. `coverage` is 0..1 and multiplies the color alpha.
    pub fn blend(self: *Canvas, x: i32, y: i32, color: Color, coverage: f32) void {
        const px: usize = @intCast(x);
        const py: usize = @intCast(y);
        const alpha = std.math.clamp(color.a / 255 * coverage, 0, 1);
        if (alpha <= 0) return;
        const index = py * self.stride + px * 4;
        const pixel = self.pixels[index..][0..4];
        if (alpha >= 1) {
            pixel[0] = to_byte(color.r);
            pixel[1] = to_byte(color.g);
            pixel[2] = to_byte(color.b);
            pixel[3] = 255;
            return;
        }
        pixel[0] = mix_channel(pixel[0], color.r, alpha);
        pixel[1] = mix_channel(pixel[1], color.g, alpha);
        pixel[2] = mix_channel(pixel[2], color.b, alpha);
        pixel[3] = 255;
    }
};

fn to_byte(value: f32) u8 {
    return @intFromFloat(std.math.clamp(@round(value), 0, 255));
}

fn mix_channel(destination: u8, source: f32, alpha: f32) u8 {
    const d: f32 = @floatFromInt(destination);
    return to_byte(d + (source - d) * alpha);
}

fn pixel_pattern(color: Color) @Vector(16, u8) {
    const bytes = [4]u8{ to_byte(color.r), to_byte(color.g), to_byte(color.b), 255 };
    var pattern: [16]u8 = undefined;
    for (&pattern, 0..) |*byte, index| byte.* = bytes[index % 4];
    return pattern;
}

/// Pixel-aligned integer bounds of `rect`, grown by `margin` on every side.
fn bounds_of(rect: Rect, margin: f32) Clip {
    return .{
        .x0 = @intFromFloat(@floor(rect.x - margin)),
        .y0 = @intFromFloat(@floor(rect.y - margin)),
        .x1 = @intFromFloat(@ceil(rect.right() + margin)),
        .y1 = @intFromFloat(@ceil(rect.bottom() + margin)),
    };
}

fn clamp_radii(radii: Radii, half_w: f32, half_h: f32) Radii {
    const limit = @max(0, @min(half_w, half_h));
    return .{
        .tl = std.math.clamp(radii.tl, 0, limit),
        .tr = std.math.clamp(radii.tr, 0, limit),
        .br = std.math.clamp(radii.br, 0, limit),
        .bl = std.math.clamp(radii.bl, 0, limit),
    };
}

/// Signed distance from a point (relative to the box center, y down) to a
/// rounded rectangle with the given half extents and per-corner radii.
/// Negative inside.
fn rounded_distance(px: f32, py: f32, half_w: f32, half_h: f32, radii: Radii) f32 {
    const r = if (py < 0)
        (if (px < 0) radii.tl else radii.tr)
    else
        (if (px < 0) radii.bl else radii.br);
    const qx = @abs(px) - (half_w - r);
    const qy = @abs(py) - (half_h - r);
    const outside = @sqrt(@max(qx, 0) * @max(qx, 0) + @max(qy, 0) * @max(qy, 0));
    return outside + @min(@max(qx, qy), 0) - r;
}

/// Complementary error function (Numerical Recipes erfcc, fractional error
/// below 1.2e-7), used for the Gaussian edge of shadows.
fn erfc(x: f32) f32 {
    const z = @abs(x);
    const t = 1 / (1 + 0.5 * z);
    const poly = -z * z - 1.26551223 + t * (1.00002368 + t * (0.37409196 + t * (0.09678418 +
        t * (-0.18628806 + t * (0.27886807 + t * (-1.13520398 + t * (1.48851587 +
            t * (-0.82215223 + t * 0.17087277))))))));
    const result = t * @exp(poly);
    return if (x >= 0) result else 2 - result;
}

test "rounded distance is negative inside and zero on the edge" {
    const square: Radii = .{};
    try std.testing.expect(rounded_distance(0, 0, 10, 10, square) < 0);
    try std.testing.expectApproxEqAbs(@as(f32, 0), rounded_distance(10, 0, 10, 10, square), 1e-5);
    // With radius equal to the half extents, the box is a circle centered at zero.
    const round: Radii = Radii.all(10);
    try std.testing.expectApproxEqAbs(@as(f32, 0), rounded_distance(10.0 / @sqrt(@as(f32, 2)), 10.0 / @sqrt(@as(f32, 2)), 10, 10, round), 1e-4);
}

test "erfc matches known values" {
    try std.testing.expectApproxEqAbs(@as(f32, 1), erfc(0), 1e-5);
    try std.testing.expectApproxEqAbs(@as(f32, 0.157299), erfc(1), 1e-4);
    try std.testing.expectApproxEqAbs(@as(f32, 1.842701), erfc(-1), 1e-4);
}
