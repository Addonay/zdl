//! Rotozoom: rotation of a raster about a point, with optional bilinear
//! smoothing and horizontal/vertical mirroring, ported from SDL's
//! `video/SDL_rotate.c` (itself derived from Andreas Schiffler's SDL_gfx
//! rotozoomer, zlib license).
//!
//! Numeric conventions follow the original: the rotation angle is in degrees and
//! clockwise on screen; sine and cosine are stored as the destination-to-source
//! inverse in 16.16 fixed point; the destination bounds are the floor/ceil of the
//! rotated source corners sampled at pixel centers. The rotated bounds are returned
//! so callers can place the result. Destination pixels outside the rotated source
//! are left transparent (`rgba8` zero) so compositors can skip them.
//!
//! Deliberate differences from SDL:
//! - The source is read through `surface.View.read`, so every pixel format works.
//!   SDL's 8-bit/color-keyed and 32-bit-only fast paths collapse into this path.
//! - Multiples of 90 degrees use the same exact sine/cosine sampler instead of
//!   SDL's pointer-walk fast path (with `smooth` ignored, as SDL's fast path does,
//!   so the whole source survives). The pixel mapping matches for the default
//!   center; non-default centers follow the rotation definition, which SDL's fast
//!   path does not.
//! - Integer overflow in the fixed-point increments wraps, as it does in the C
//!   code, instead of being undefined.
const std = @import("std");
const surface = @import("../video/surface.zig");
const pixels = @import("../video/pixels.zig");
const geometry = @import("../video/geometry.zig");

/// Errors from validating coordinates and allocating the destination.
pub const Error = surface.Error || geometry.GeometryError || error{ InvalidAngle, InvalidSize };
/// Floating-point coordinate in source space (pixel units, origin top-left).
pub const Point = geometry.Point(f32);
/// Integer destination bounds relative to the source origin.
pub const Rect = geometry.Rect(i32);

/// Fixed-point scale of the sampler: 16 integer and 16 fractional bits.
const fixed_one: f64 = 65536.0;
/// Half a pixel in 16.16 units, subtracted to sample pixel centers.
const fixed_half: i32 = 1 << 15;

/// Precomputed geometry of a rotation. `cos` and `sin` are the values used by the
/// sampler. They are already negated for SDL's clockwise convention, so the sampler
/// treats them as the inverse transform.
pub const Transform = struct {
    /// Destination bounds in source space, possibly with negative origin.
    bounds: Rect,
    /// Cosine of the (clockwise) angle; exactly 0, 1 or -1 for multiples of 90.
    cos: f64,
    /// Sine of the inverse (clockwise) angle; exactly 0, 1 or -1 for multiples of 90.
    sin: f64,
};

/// Rotates a `width` by `height` rectangle about `center` and returns the bounding
/// box of the result together with the trig values used for sampling. Corners are
/// evaluated at pixel centers (0.5 inside the edges), as SDL does. Multiples of 90
/// degrees snap to exact values so their extents are exact.
pub fn transform_for(width: i32, height: i32, angle_degrees: f64, center: Point) Error!Transform {
    if (width <= 0 or height <= 0) return error.InvalidSize;
    if (!std.math.isFinite(angle_degrees)) return error.InvalidAngle;
    if (!std.math.isFinite(center.x) or !std.math.isFinite(center.y)) return error.NonFinite;

    const radians = angle_degrees * (std.math.pi / 180.0);
    const sin_angle = std.math.sin(radians);
    const cos_angle = std.math.cos(radians);

    const w: f64 = @floatFromInt(width);
    const h: f64 = @floatFromInt(height);
    const corners = [4][2]f64{
        rotate_point(0.5, 0.5, sin_angle, cos_angle, center),
        rotate_point(w - 0.5, 0.5, sin_angle, cos_angle, center),
        rotate_point(0.5, h - 0.5, sin_angle, cos_angle, center),
        rotate_point(w - 0.5, h - 0.5, sin_angle, cos_angle, center),
    };
    var min_x = corners[0][0];
    var max_x = corners[0][0];
    var min_y = corners[0][1];
    var max_y = corners[0][1];
    for (corners[1..]) |corner| {
        min_x = @min(min_x, corner[0]);
        max_x = @max(max_x, corner[0]);
        min_y = @min(min_y, corner[1]);
        max_y = @max(max_y, corner[1]);
    }
    var bounds: Rect = .{
        .x = try checked_i32(@floor(min_x)),
        .y = try checked_i32(@floor(min_y)),
        .width = 0,
        .height = 0,
    };
    bounds.width = (try checked_i32(@ceil(max_x))) - bounds.x;
    bounds.height = (try checked_i32(@ceil(max_y))) - bounds.y;

    // SDL stores the inverse rotation: negate sine because rotations are clockwise.
    var result: Transform = .{ .bounds = bounds, .cos = cos_angle, .sin = -sin_angle };

    // Multiples of 90 degrees have exact extents; the float trig above can be off
    // by one pixel there, so SDL overrides both the extent and the trig values.
    const quarter = angle_degrees / 90.0;
    const quarter_floor = @trunc(quarter);
    if (quarter == quarter_floor and @abs(quarter) < 1e15) {
        var steps: i64 = @intFromFloat(quarter_floor);
        steps = @mod(steps, 4);
        if ((steps & 1) == 1) {
            result.bounds.width = height;
            result.bounds.height = width;
            result.cos = 0;
            result.sin = if (steps == 1) -1 else 1;
        } else {
            result.bounds.width = width;
            result.bounds.height = height;
            result.cos = if (steps == 0) 1 else -1;
            result.sin = 0;
        }
    }
    return result;
}

/// Rotated bounding box convenience wrapper around `transform_for`.
pub fn bounds_for(width: i32, height: i32, angle_degrees: f64, center: Point) Error!Rect {
    return (try transform_for(width, height, angle_degrees, center)).bounds;
}

/// Options for `rotate`. Mirroring is applied in the source's own frame before
/// sampling, so flips and rotation compose as in SDL's sampler.
pub const Options = struct {
    /// Clockwise angle in degrees, as in `transform_for`.
    angle_degrees: f64,
    /// Rotation pivot in source pixel coordinates.
    center: Point,
    /// Mirror horizontally in the source frame before rotation.
    flip_horizontal: bool = false,
    /// Mirror vertically in the source frame before rotation.
    flip_vertical: bool = false,
    /// Bilinear interpolation of the four nearest texels (SDL's smooth mode).
    /// Nearest sampling is used when false.
    smooth: bool = false,
};

/// Rotates `source` into a new `rgba8` surface sized to `transform.bounds`. Pixels
/// with no source coverage are transparent black. The caller owns the result and
/// must `deinit` it. Use `transform_for` first to obtain `transform` and place it.
pub fn rotate(allocator: std.mem.Allocator, source: surface.View, transform: Transform, options: Options) Error!surface.Surface {
    const bounds = transform.bounds;
    if (bounds.width <= 0 or bounds.height <= 0) return error.InvalidSize;
    const out_width = std.math.cast(u31, bounds.width) orelse return error.InvalidSize;
    const out_height = std.math.cast(u31, bounds.height) orelse return error.InvalidSize;
    var result = try surface.Surface.init(allocator, out_width, out_height, .rgba8, null);
    errdefer result.deinit();

    // Inverse transform in 16.16 fixed point: the increments per destination pixel.
    const icos: i32 = @intFromFloat(transform.cos * fixed_one);
    const isin: i32 = @intFromFloat(transform.sin * fixed_one);
    const center_x = options.center.x;
    const center_y = options.center.y;
    const cx = try truncate_fixed(center_x * fixed_one);
    const cy = try truncate_fixed(center_y * fixed_one);

    const src_w: i32 = @intCast(source.width);
    const src_h: i32 = @intCast(source.height);
    const last_x = src_w - 1;
    const last_y = src_h - 1;
    // SDL rotates exact multiples of 90 degrees with a copying fast path that
    // ignores `smooth`. Bilinear sampling would drop the last row and column
    // (its bounds test needs a neighbour), so those angles sample nearest.
    const smooth = options.smooth and transform.cos != 0 and transform.sin != 0;

    var y: usize = 0;
    while (y < out_height) : (y += 1) {
        // Destination pixel centers in source space, relative to the pivot.
        const pixel_x = @as(f64, @floatFromInt(bounds.x)) + 0.5 - @as(f64, center_x);
        const pixel_y = @as(f64, @floatFromInt(bounds.y)) + @as(f64, @floatFromInt(y)) + 0.5 - @as(f64, center_y);
        var sdx: i32 = (try truncate_fixed(@as(f64, @floatFromInt(icos)) * pixel_x - @as(f64, @floatFromInt(isin)) * pixel_y)) +% cx -% fixed_half;
        var sdy: i32 = (try truncate_fixed(@as(f64, @floatFromInt(isin)) * pixel_x + @as(f64, @floatFromInt(icos)) * pixel_y)) +% cy -% fixed_half;
        var x: usize = 0;
        while (x < out_width) : (x += 1) {
            var dx: i32 = sdx >> 16;
            var dy: i32 = sdy >> 16;
            if (smooth) {
                // Mirroring precedes the bounds test here, as in SDL's smooth sampler.
                if (options.flip_horizontal) dx = last_x - dx;
                if (options.flip_vertical) dy = last_y - dy;
                if (dx > -1 and dy > -1 and dx < last_x and dy < last_y) {
                    const ux: usize = @intCast(dx);
                    const uy: usize = @intCast(dy);
                    var c00 = try source.read(ux, uy);
                    var c01 = try source.read(ux + 1, uy);
                    var c11 = try source.read(ux + 1, uy + 1);
                    var c10 = try source.read(ux, uy + 1);
                    if (options.flip_horizontal) {
                        std.mem.swap(pixels.Color, &c00, &c01);
                        std.mem.swap(pixels.Color, &c10, &c11);
                    }
                    if (options.flip_vertical) {
                        std.mem.swap(pixels.Color, &c00, &c10);
                        std.mem.swap(pixels.Color, &c01, &c11);
                    }
                    const ex: i32 = sdx & 0xffff;
                    const ey: i32 = sdy & 0xffff;
                    try result.view.write(x, y, .{
                        .r = interpolate(c00.r, c01.r, c10.r, c11.r, ex, ey),
                        .g = interpolate(c00.g, c01.g, c10.g, c11.g, ex, ey),
                        .b = interpolate(c00.b, c01.b, c10.b, c11.b, ex, ey),
                        .a = interpolate(c00.a, c01.a, c10.a, c11.a, ex, ey),
                    });
                }
            } else {
                // Nearest sampling tests bounds before mirroring, as SDL does.
                if (dx >= 0 and dy >= 0 and dx < src_w and dy < src_h) {
                    const sx = if (options.flip_horizontal) last_x - dx else dx;
                    const sy = if (options.flip_vertical) last_y - dy else dy;
                    try result.view.write(x, y, try source.read(@intCast(sx), @intCast(sy)));
                }
            }
            sdx +%= icos;
            sdy +%= isin;
        }
    }
    return result;
}

/// SDL's per-channel bilinear step in 16.16 fixed point. `& 0xff` replicates the
/// C code's byte wrap of intermediate row values.
fn interpolate(c00: u8, c01: u8, c10: u8, c11: u8, ex: i32, ey: i32) u8 {
    const top: i32 = ((((@as(i32, c01) - @as(i32, c00)) * ex) >> 16) + @as(i32, c00)) & 0xff;
    const bottom: i32 = ((((@as(i32, c11) - @as(i32, c10)) * ex) >> 16) + @as(i32, c10)) & 0xff;
    const value: i32 = ((bottom - top) * ey >> 16) + top;
    return @truncate(@as(u32, @bitCast(value)));
}

fn rotate_point(x: f64, y: f64, sin_angle: f64, cos_angle: f64, center: Point) [2]f64 {
    const dx0 = x - @as(f64, center.x);
    const dy0 = y - @as(f64, center.y);
    return .{
        cos_angle * dx0 - sin_angle * dy0 + @as(f64, center.x),
        sin_angle * dx0 + cos_angle * dy0 + @as(f64, center.y),
    };
}

/// Converts a finite float to i32 by truncation, rejecting out-of-range input.
fn checked_i32(value: f64) Error!i32 {
    if (!std.math.isFinite(value)) return error.NonFinite;
    if (value < -2147483648.0 or value >= 2147483648.0) return error.Overflow;
    return @intFromFloat(value);
}

/// The C sampler converts to int with undefined behaviour on overflow; saturate
/// instead so extreme centers produce a clamped, in-bounds sample.
fn truncate_fixed(value: f64) Error!i32 {
    if (!std.math.isFinite(value)) return error.NonFinite;
    const limit: f64 = 2147483647.0;
    return @intFromFloat(std.math.clamp(value, -limit, limit));
}
