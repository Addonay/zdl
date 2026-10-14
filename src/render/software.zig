//! Immediate scalar drawing into a borrowed raster, with no renderer registry,
//! command queue, texture IDs or implicit allocation. Derived from SDL's software
//! drawing and triangle routines; this is an altered native implementation.
//! Triangle coverage retains half-pixel precision and the top-left fill rule.
//! Lines are crisp Bresenham segments; SDL's format-specific antialiasing remains
//! pending. Color operations use the surface module's eight-bit blend contract.
const std = @import("std");
const surface = @import("../video/surface.zig");
const pixels = @import("../video/pixels.zig");
const geometry = @import("../video/geometry.zig");

pub const Point = geometry.Point(i32);
pub const Rect = geometry.Rect(i32);
/// Invalid geometry is reported before rasterizing a triangle or geometry batch.
pub const Error = surface.Error || geometry.GeometryError || error{InvalidIndex};

/// Triangle positions are quantized toward zero to half-pixel units. Texture
/// coordinates are normalized (0..1 spans the texture); outside values follow
/// the supplied addressing policy. Colors interpolate in encoded byte space.
pub const Vertex = struct {
    position: geometry.Point(f32),
    color: pixels.Color = .{ .r = 255, .g = 255, .b = 255 },
    uv: geometry.Point(f32) = .{ .x = 0, .y = 0 },
};

/// Independent horizontal/vertical texture addressing. Repeat uses mathematical
/// modulo for negative coordinates, without SDL's negative-wrap off-by-one.
pub const Address = enum { clamp, repeat };
/// A borrowed, nearest-sampled texture. Its pixels and palette must stay alive
/// throughout the call; aliasing destination pixels is supported by snapshot.
pub const Texture = struct {
    view: surface.View,
    horizontal: Address = .clamp,
    vertical: Address = .clamp,
};

/// Small, copyable drawing state. Copying retains the same raster borrow, so
/// synchronization belongs to its buffer owner. Clip coordinates are absolute
/// destination pixels; a null clip admits the complete destination.
pub const Rasterizer = struct {
    target: surface.View,
    clip: ?Rect = null,
    color: pixels.Color = .{ .r = 255, .g = 255, .b = 255 },
    blend: surface.Blend = .REPLACE,

    /// Draws one admitted pixel, applying the current blend exactly once.
    pub fn point(self: Rasterizer, position: Point) Error!void {
        const bounds = (try self.clipping_bounds()) orelse return;
        if (bounds.contains(position)) try self.paint(position, self.color);
    }

    /// Draws independent points. Duplicate positions blend repeatedly.
    pub fn points(self: Rasterizer, positions: []const Point) Error!void {
        const bounds = (try self.clipping_bounds()) orelse return;
        for (positions) |position| if (bounds.contains(position)) try self.paint(position, self.color);
    }

    /// Draws a clipped, inclusive segment. Widened integer error accumulation
    /// avoids overflow for extreme input endpoints. Diagonal lines are crisp.
    pub fn line(self: Rasterizer, start: Point, end: Point) Error!void {
        try self.segment(start, end, true);
    }

    /// Draws connected segments, avoiding repeated blending at shared vertices.
    /// Open paths include their last point; closed paths visit each join once.
    /// Repeated adjacent positions are ignored. A single point is drawn once.
    pub fn polyline(self: Rasterizer, positions: []const Point, closed: bool) Error!void {
        if (positions.len == 0) return;
        if (positions.len == 1) return self.point(positions[0]);
        for (0..positions.len - 1) |i| try self.segment(positions[i], positions[i + 1], !closed and i == positions.len - 2);
        if (closed) try self.segment(positions[positions.len - 1], positions[0], false);
    }

    /// Fills an integer pixel rectangle with the current color/blend.
    pub fn fill_rect(self: Rasterizer, requested: Rect) Error!void {
        const bounds = (try self.clipping_bounds()) orelse return;
        const region = (try bounds.intersection(requested)) orelse return;
        const end_x: usize = @intCast(@as(i64, region.x) + region.width);
        const end_y: usize = @intCast(@as(i64, region.y) + region.height);
        for (@as(usize, @intCast(region.y))..end_y) |y| {
            for (@as(usize, @intCast(region.x))..end_x) |x| try self.paint(.{ .x = @intCast(x), .y = @intCast(y) }, self.color);
        }
    }

    /// Strokes inside the rectangle's inclusive outermost pixel boundary.
    /// Thin rectangles are one line; corners are blended only once.
    pub fn stroke_rect(self: Rasterizer, rectangle: Rect) Error!void {
        if (rectangle.is_empty()) return;
        const right = std.math.cast(i32, @as(i64, rectangle.x) + rectangle.width - 1) orelse return error.Overflow;
        const bottom = std.math.cast(i32, @as(i64, rectangle.y) + rectangle.height - 1) orelse return error.Overflow;
        if (rectangle.width == 1 or rectangle.height == 1) return self.line(.{ .x = rectangle.x, .y = rectangle.y }, .{ .x = right, .y = bottom });
        try self.polyline(&.{ .{ .x = rectangle.x, .y = rectangle.y }, .{ .x = right, .y = rectangle.y }, .{ .x = right, .y = bottom }, .{ .x = rectangle.x, .y = bottom } }, true);
    }

    /// Rasterizes a colored or nearest-textured triangle. Both windings work;
    /// quantized zero-area triangles draw nothing. Adjacent triangles share the
    /// top-left coverage convention, so their common edge is shaded once.
    /// Only an aliased texture requires allocation; snapshot failure occurs
    /// before destination mutation. Vertex colors modulate sampled texture color.
    pub fn triangle(self: Rasterizer, allocator: std.mem.Allocator, vertices: [3]Vertex, texture: ?Texture) Error!void {
        try self.mesh(allocator, &vertices, null, texture);
    }

    /// Draws triangles in order. Null indices consume consecutive vertex triples;
    /// otherwise indices must form triples and refer to valid vertices. All
    /// vertices/indices and texture size are checked before drawing starts. A
    /// texture overlapping the target is snapshotted once for the whole batch.
    /// Pixel/palette errors during drawing can leave a partially drawn batch.
    pub fn mesh(self: Rasterizer, allocator: std.mem.Allocator, vertices: []const Vertex, indices: ?[]const u32, texture: ?Texture) Error!void {
        const count = if (indices) |list| list.len else vertices.len;
        if (count % 3 != 0) return error.InvalidIndex;
        if (indices) |list| for (list) |index| {
            if (index >= vertices.len) return error.InvalidIndex;
        };
        for (vertices) |vertex| _ = try fixed(vertex);
        var input = texture;
        if (input) |sample| if (sample.view.width == 0 or sample.view.height == 0) return error.InvalidSize;
        const clip = (try self.clipping_bounds()) orelse return;
        if (count == 0) return;
        var snapshot: ?surface.Surface = null;
        defer if (snapshot) |*saved| saved.deinit();
        if (input) |*sample| if (overlaps(self.target.data, sample.view.data)) {
            snapshot = try surface.Surface.copy(allocator, sample.view);
            sample.view = snapshot.?.view;
        };
        var i: usize = 0;
        while (i < count) : (i += 3) {
            var triangle_vertices: [3]Vertex = undefined;
            for (0..3) |j| triangle_vertices[j] = vertices[if (indices) |list| list[i + j] else i + j];
            try self.raster_triangle(triangle_vertices, input, clip);
        }
    }

    fn clipping_bounds(self: Rasterizer) Error!?Rect {
        return if (self.clip) |clip| try self.target.bounds().intersection(clip) else if (self.target.bounds().is_empty()) null else self.target.bounds();
    }

    fn paint(self: Rasterizer, position: Point, color: pixels.Color) Error!void {
        const x: usize = @intCast(position.x);
        const y: usize = @intCast(position.y);
        // Replacement does not depend on the existing pixel. In particular an
        // indexed target can be initialized even if its old index has no color.
        const result = if (std.meta.eql(self.blend, surface.Blend.REPLACE)) color else self.blend.apply(color, try self.target.read(x, y));
        try self.target.write(x, y, result);
    }

    fn segment(self: Rasterizer, start: Point, end: Point, include_end: bool) Error!void {
        if (!include_end and std.meta.eql(start, end)) return;
        const bounds = (try self.clipping_bounds()) orelse return;
        const clipped = (try bounds.clip_line(.{ .start = start, .end = end })) orelse return;
        var x: i64 = clipped.start.x;
        var y: i64 = clipped.start.y;
        const dx: i64 = @intCast(@abs(@as(i64, clipped.end.x) - x));
        const dy: i64 = -@as(i64, @intCast(@abs(@as(i64, clipped.end.y) - y)));
        const sx: i64 = if (x < clipped.end.x) 1 else -1;
        const sy: i64 = if (y < clipped.end.y) 1 else -1;
        var accumulated = dx + dy;
        while (true) {
            const last = x == clipped.end.x and y == clipped.end.y;
            // A clipped endpoint is still visible even when the original shared
            // endpoint should be omitted: the following segment cannot own it.
            if (!last or include_end or !std.meta.eql(clipped.end, end)) try self.paint(.{ .x = @intCast(x), .y = @intCast(y) }, self.color);
            if (last) break;
            const twice = accumulated * 2;
            if (twice >= dy) {
                accumulated += dy;
                x += sx;
            }
            if (twice <= dx) {
                accumulated += dx;
                y += sy;
            }
        }
    }

    fn raster_triangle(self: Rasterizer, input: [3]Vertex, texture: ?Texture, clip: Rect) Error!void {
        var vertices = input;
        var positions: [3]Fixed = .{ try fixed(input[0]), try fixed(input[1]), try fixed(input[2]) };
        var area = edge(positions[0], positions[1], positions[2]);
        if (area == 0) return;
        if (area < 0) {
            std.mem.swap(Fixed, &positions[1], &positions[2]);
            std.mem.swap(Vertex, &vertices[1], &vertices[2]);
            area = -area;
        }
        const left = @max(@as(i64, clip.x), @divFloor(@min(positions[0].x, positions[1].x, positions[2].x), 2));
        const top = @max(@as(i64, clip.y), @divFloor(@min(positions[0].y, positions[1].y, positions[2].y), 2));
        const right = @min(@as(i64, clip.x) + clip.width, @divFloor(@max(positions[0].x, positions[1].x, positions[2].x) + 1, 2));
        const bottom = @min(@as(i64, clip.y) + clip.height, @divFloor(@max(positions[0].y, positions[1].y, positions[2].y) + 1, 2));
        if (left >= right or top >= bottom) return;
        const inclusive = [3]bool{ top_left(positions[1], positions[2]), top_left(positions[2], positions[0]), top_left(positions[0], positions[1]) };
        var y = top;
        while (y < bottom) : (y += 1) {
            const center: Fixed = .{ .x = left * 2 + 1, .y = y * 2 + 1 };
            var weights = [3]i128{ edge(positions[1], positions[2], center), edge(positions[2], positions[0], center), edge(positions[0], positions[1], center) };
            var x = left;
            while (x < right) : (x += 1) {
                if (admitted(weights[0], inclusive[0]) and admitted(weights[1], inclusive[1]) and admitted(weights[2], inclusive[2])) {
                    var color: pixels.Color = undefined;
                    inline for (.{ "r", "g", "b", "a" }) |name| @field(color, name) = @intCast(@divTrunc(weights[0] * @field(vertices[0].color, name) + weights[1] * @field(vertices[1].color, name) + weights[2] * @field(vertices[2].color, name), area));
                    if (texture) |sample| {
                        var u: f64 = 0;
                        var v: f64 = 0;
                        for (0..3) |j| {
                            const fraction = @as(f64, @floatFromInt(weights[j])) / @as(f64, @floatFromInt(area));
                            u += fraction * vertices[j].uv.x;
                            v += fraction * vertices[j].uv.y;
                        }
                        const texel = try sample.view.read(texel_index(u, sample.view.width, sample.horizontal), texel_index(v, sample.view.height, sample.vertical));
                        inline for (.{ "r", "g", "b", "a" }) |name| @field(color, name) = @intCast(@as(u16, @field(color, name)) * @field(texel, name) / 255);
                    }
                    try self.paint(.{ .x = @intCast(x), .y = @intCast(y) }, color);
                }
                // Advance three edge equations instead of three cross-products.
                weights[0] -= @as(i128, positions[2].y - positions[1].y) * 2;
                weights[1] -= @as(i128, positions[0].y - positions[2].y) * 2;
                weights[2] -= @as(i128, positions[1].y - positions[0].y) * 2;
            }
        }
    }
};

const Fixed = struct { x: i64, y: i64 };
fn fixed(vertex: Vertex) Error!Fixed {
    if (!std.math.isFinite(vertex.position.x) or !std.math.isFinite(vertex.position.y) or !std.math.isFinite(vertex.uv.x) or !std.math.isFinite(vertex.uv.y)) return error.NonFinite;
    const x = @as(f64, vertex.position.x) * 2;
    const y = @as(f64, vertex.position.y) * 2;
    // Bound fixed coordinates to doubled i32 pixels. Products and weighted
    // colors are then comfortably inside i128 even at opposite extremes.
    if (x < -4294967296 or x > 4294967294 or y < -4294967296 or y > 4294967294) return error.Overflow;
    return .{ .x = @intFromFloat(x), .y = @intFromFloat(y) };
}
fn edge(a: Fixed, b: Fixed, p: Fixed) i128 {
    return @as(i128, b.x - a.x) * (p.y - a.y) - @as(i128, b.y - a.y) * (p.x - a.x);
}
fn top_left(a: Fixed, b: Fixed) bool {
    return (a.y == b.y and a.x < b.x) or b.y < a.y;
}
fn admitted(weight: i128, inclusive: bool) bool {
    return weight > 0 or (weight == 0 and inclusive);
}
fn texel_index(coordinate: f64, size: u31, address: Address) usize {
    const normalized = switch (address) {
        .clamp => std.math.clamp(coordinate, 0, 1),
        .repeat => @mod(coordinate, 1),
    };
    return @intFromFloat(@min(@floor(normalized * @as(f64, @floatFromInt(size))), @as(f64, @floatFromInt(size - 1))));
}
fn overlaps(a: []const u8, b: []const u8) bool {
    if (a.len == 0 or b.len == 0) return false;
    const start_a = @intFromPtr(a.ptr);
    const start_b = @intFromPtr(b.ptr);
    return if (start_a <= start_b) start_b - start_a < a.len else start_a - start_b < b.len;
}
