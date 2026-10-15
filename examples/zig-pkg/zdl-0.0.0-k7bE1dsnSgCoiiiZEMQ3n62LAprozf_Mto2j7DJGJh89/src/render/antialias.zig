//! Xiaolin Wu antialiased line drawing for raster targets, ported from SDL's
//! `render/software/SDL_draw.h` (`WULINE`, selected by SDL's `AA_LINES` switch)
//! and `render/software/SDL_blendline.c`.
//!
//! SDL only uses this algorithm when a build defines `AA_LINES`, which upstream
//! never does. Its default line path is the crisp walk in `render/software.zig`.
//! Here antialiasing is an explicit opt-in (`Renderer.draw_line_antialiased`)
//! rather than a hidden build flag.
//!
//! Numeric conventions: coverage is an 8-bit weight. The minor-axis error
//! accumulator is 16.16 fixed point truncated to 16 bits, and the weight is its
//! top byte. The two pixels straddling the ideal line receive `alpha * (255 - w)`
//! and `alpha * w`, each rounded down as SDL's `DRAW_MUL` does. Endpoints are
//! painted at full coverage. Horizontal, vertical and exactly diagonal segments
//! have no fractional coverage and are walked crisply.
//!
//! Deliberate differences from SDL:
//! - Clipping uses `geometry.Rect.clip_line`, which keeps the original slope.
//!   SDL's `FIXME` in `SDL_BlendLine` asks for exactly this.
//! - Weighted pixels with the `REPLACE` blend are composited with `ALPHA`, as
//!   SDL's `NONE` case uses its blend-op for antialiased pixels.
const std = @import("std");
const surface = @import("../video/surface.zig");
const pixels = @import("../video/pixels.zig");
const geometry = @import("../video/geometry.zig");

/// Pixel-coordinate point.
pub const Point = geometry.Point(i32);
/// Pixel-coordinate clip region (right and bottom edges excluded).
pub const Rect = geometry.Rect(i32);
/// Errors from clipping and raster access.
pub const Error = surface.Error || geometry.GeometryError;

/// Draws an antialiased segment between `start` and `end` into `target`, clipped
/// to `clip` (or the whole target when null). Both endpoints are painted, as
/// `SDL_BlendLine` does.
pub fn line(target: surface.View, clip: ?Rect, start: Point, end: Point, color: pixels.Color, blend: surface.Blend) Error!void {
    const bounds = target.bounds();
    const region = if (clip) |requested| (try bounds.intersection(requested)) orelse return else bounds;
    if (region.is_empty()) return;

    const clipped = (try region.clip_line(.{ .start = start, .end = end })) orelse return;
    const x1: i64 = clipped.start.x;
    const y1: i64 = clipped.start.y;
    const x2: i64 = clipped.end.x;
    const y2: i64 = clipped.end.y;

    const delta_x = x2 - x1;
    const delta_y = y2 - y1;
    if (delta_x == 0 or delta_y == 0 or @abs(delta_x) == @abs(delta_y)) {
        // No fractional coverage: step along the major axis, exact in integers.
        return crisp(target, region, .{ .x = @intCast(x1), .y = @intCast(y1) }, .{ .x = @intCast(x2), .y = @intCast(y2) }, color, blend);
    }
    try wu(target, region, x1, y1, x2, y2, color, blend);
}

/// Crisp walk for lines without fractional coverage. Each step is exact because
/// one delta equals the step count or is zero.
fn crisp(target: surface.View, region: Rect, start: Point, end: Point, color: pixels.Color, blend: surface.Blend) Error!void {
    const dx = @as(i64, end.x) - start.x;
    const dy = @as(i64, end.y) - start.y;
    const steps: i64 = @intCast(@max(@abs(dx), @abs(dy)));
    if (steps == 0) return paint(target, region, start.x, start.y, color, blend, 255);
    var index: i64 = 0;
    while (index <= steps) : (index += 1) {
        const x = @as(i64, start.x) + @divExact(dx * index, steps);
        const y = @as(i64, start.y) + @divExact(dy * index, steps);
        try paint(target, region, x, y, color, blend, 255);
    }
}

/// Wu's walk. Endpoints are painted first (before the reordering), then each
/// interior step paints the pair of pixels whose weights sum to 255.
fn wu(target: surface.View, region: Rect, start_x: i64, start_y: i64, end_x: i64, end_y: i64, color: pixels.Color, blend: surface.Blend) Error!void {
    try paint(target, region, start_x, start_y, color, blend, 255);
    try paint(target, region, end_x, end_y, color, blend, 255);

    // Run top to bottom, as the C macro does after plotting the endpoints.
    var x1 = start_x;
    var y1 = start_y;
    var x2 = end_x;
    var y2 = end_y;
    if (y1 > y2) {
        std.mem.swap(i64, &x1, &x2);
        std.mem.swap(i64, &y1, &y2);
    }
    const delta_y = y2 - y1;
    var delta_x = x2 - x1;
    var x_dir: i64 = 1;
    if (delta_x < 0) {
        x_dir = -1;
        delta_x = -delta_x;
    }

    var error_accumulator: u16 = 0;
    if (delta_y > delta_x) {
        // Y-major: X advances by a fraction of a pixel per Y step; truncate so the
        // accumulated X never overruns the endpoint.
        const error_adjust: u16 = @intCast((@as(u64, @intCast(delta_x)) << 16) / @as(u64, @intCast(delta_y)));
        var remaining = delta_y - 1;
        while (remaining > 0) : (remaining -= 1) {
            const previous = error_accumulator;
            error_accumulator +%= error_adjust;
            if (error_accumulator <= previous) x1 += x_dir;
            y1 += 1;
            const weight: u8 = @intCast(error_accumulator >> 8);
            try paint(target, region, x1, y1, color, blend, 255 - weight);
            try paint(target, region, x1 + x_dir, y1, color, blend, weight);
        }
    } else {
        // X-major: Y advances by a fraction of a pixel per X step.
        const error_adjust: u16 = @intCast((@as(u64, @intCast(delta_y)) << 16) / @as(u64, @intCast(delta_x)));
        var remaining = delta_x - 1;
        while (remaining > 0) : (remaining -= 1) {
            const previous = error_accumulator;
            error_accumulator +%= error_adjust;
            if (error_accumulator <= previous) y1 += 1;
            x1 += x_dir;
            const weight: u8 = @intCast(error_accumulator >> 8);
            try paint(target, region, x1, y1, color, blend, 255 - weight);
            try paint(target, region, x1, y1 + 1, color, blend, weight);
        }
    }
}

/// Composites one weighted pixel. The effective alpha is `color.a * weight / 255`,
/// truncated as in SDL. Pixels outside `region` are skipped without access.
fn paint(target: surface.View, region: Rect, x: i64, y: i64, color: pixels.Color, blend: surface.Blend, weight: u8) Error!void {
    if (x < region.x or y < region.y) return;
    if (x >= @as(i64, region.x) + region.width or y >= @as(i64, region.y) + region.height) return;
    const alpha: u8 = @intCast((@as(u32, color.a) * weight) / 255);
    var source = color;
    source.a = alpha;
    const ux: usize = @intCast(x);
    const uy: usize = @intCast(y);
    if (std.meta.eql(blend, surface.Blend.REPLACE) and alpha != 255) {
        // Partial coverage must blend even under the replace mode; see module docs.
        const destination = try target.read(ux, uy);
        try target.write(ux, uy, surface.Blend.ALPHA.apply(source, destination));
        return;
    }
    const destination = try target.read(ux, uy);
    try target.write(ux, uy, blend.apply(source, destination));
}
