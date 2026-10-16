//! Optional disposable Cairo replay. New output is published only on success.
const std = @import("std");
const paint = @import("zdl").paint;
const b = @import("binding.zig");
pub const Library = b.Library;
pub const Image = struct {
    library: *Library,
    surface: *b.Surface,
    width: u31,
    height: u31,
    pub fn deinit(self: *Image) void {
        self.library.f.cairo_surface_destroy(self.surface);
        self.* = undefined;
    }
    /// Native ARGB32, read as a native-endian AARRGGBB word. Channels remain
    /// premultiplied encoded sRGB; no false straight-alpha conversion is implied.
    pub fn premultiplied_pixel(self: *const Image, x: usize, y: usize) !@import("zdl").pixels.Color {
        if (x >= self.width or y >= self.height) return error.OutOfBounds;
        self.library.f.cairo_surface_flush(self.surface);
        const stride: usize = @intCast(self.library.f.cairo_image_surface_get_stride(self.surface));
        const data = self.library.f.cairo_image_surface_get_data(self.surface) orelse return error.NativeFailure;
        const value = std.mem.readInt(u32, data[y * stride + x * 4 ..][0..4], @import("builtin").target.cpu.arch.endian());
        return .{ .a = @truncate(value >> 24), .r = @truncate(value >> 16), .g = @truncate(value >> 8), .b = @truncate(value) };
    }
    pub fn write_png(self: *const Image, destination: [:0]const u8) !void {
        if (self.library.f.cairo_surface_write_to_png(self.surface, destination.ptr) != 0) return error.NativeFailure;
    }
};
fn matrix(value: paint.Affine) b.Matrix {
    return .{ .xx = value.xx, .yx = value.yx, .xy = value.xy, .yy = value.yy, .x0 = value.x0, .y0 = value.y0 };
}
fn color(f: b.Functions, context: *b.Context, value: paint.Color) void {
    f.cairo_set_source_rgba(context, value.r, value.g, value.b, value.a);
}
fn rectangle(f: b.Functions, context: *b.Context, value: paint.Rect) void {
    f.cairo_new_path(context);
    f.cairo_rectangle(context, value.x, value.y, value.width, value.height);
}
fn rounded(f: b.Functions, context: *b.Context, value: paint.RoundedRect) void {
    const r = value.radius;
    const box = value.rect;
    if (r == 0) return rectangle(f, context, box);
    f.cairo_new_path(context);
    f.cairo_arc(context, box.x + box.width - r, box.y + r, r, -std.math.pi / 2.0, 0);
    f.cairo_arc(context, box.x + box.width - r, box.y + box.height - r, r, 0, std.math.pi / 2.0);
    f.cairo_arc(context, box.x + r, box.y + box.height - r, r, std.math.pi / 2.0, std.math.pi);
    f.cairo_arc(context, box.x + r, box.y + r, r, std.math.pi, 3 * std.math.pi / 2.0);
    f.cairo_close_path(context);
}
fn path(f: b.Functions, context: *b.Context, segments: []const paint.Segment) void {
    f.cairo_new_path(context);
    var at: paint.Point = .{ .x = 0, .y = 0 };
    for (segments) |segment| switch (segment) {
        .move => |v| {
            f.cairo_move_to(context, v.x, v.y);
            at = v;
        },
        .line => |v| {
            f.cairo_line_to(context, v.x, v.y);
            at = v;
        },
        .quadratic => |v| {
            f.cairo_curve_to(context, at.x / 3 + v.control.x * (2.0 / 3.0), at.y / 3 + v.control.y * (2.0 / 3.0), v.to.x / 3 + v.control.x * (2.0 / 3.0), v.to.y / 3 + v.control.y * (2.0 / 3.0), v.to.x, v.to.y);
            at = v.to;
        },
        .cubic => |v| {
            f.cairo_curve_to(context, v.first.x, v.first.y, v.second.x, v.second.y, v.to.x, v.to.y);
            at = v.to;
        },
        .close => f.cairo_close_path(context),
    };
}
fn surface(library: *Library, width: u31, height: u31) !*b.Surface {
    const value = library.f.cairo_image_surface_create(0, width, height) orelse return error.NativeFailure;
    if (library.f.cairo_surface_status(value) != 0) {
        library.f.cairo_surface_destroy(value);
        return error.NativeFailure;
    }
    return value;
}
fn raster(library: *Library, view: paint.ImageView) !*b.Surface {
    const value = try surface(library, view.width, view.height);
    errdefer library.f.cairo_surface_destroy(value);
    library.f.cairo_surface_flush(value);
    const data = library.f.cairo_image_surface_get_data(value) orelse return error.NativeFailure;
    const stride: usize = @intCast(library.f.cairo_image_surface_get_stride(value));
    for (0..view.height) |y| for (0..view.width) |x| {
        const offset = y * view.stride + x * 4;
        const a: u32 = view.rgba[offset + 3];
        const r: u32 = (@as(u32, view.rgba[offset]) * a + 127) / 255;
        const g: u32 = (@as(u32, view.rgba[offset + 1]) * a + 127) / 255;
        const blue: u32 = (@as(u32, view.rgba[offset + 2]) * a + 127) / 255;
        std.mem.writeInt(u32, data[y * stride + x * 4 ..][0..4], (a << 24) | (r << 16) | (g << 8) | blue, @import("builtin").target.cpu.arch.endian());
    };
    library.f.cairo_surface_mark_dirty(value);
    return value;
}
const PatternKey = struct { id: @TypeOf(@as(paint.GradientView, undefined).id), matrix: [6]u64 = @splat(0) };
fn gradient_parameter(geometry: paint.GradientGeometry, point: paint.Point) !?f64 {
    switch (geometry) {
        .linear => |v| {
            const dx = v.end.x - v.start.x;
            const dy = v.end.y - v.start.y;
            const norm = dx * dx + dy * dy;
            const value = ((point.x - v.start.x) * dx + (point.y - v.start.y) * dy) / norm;
            if (!std.math.isFinite(value)) return error.UnsupportedGradientGeometry;
            return value;
        },
        .radial => |v| {
            const dx = v.end.center.x - v.start.center.x;
            const dy = v.end.center.y - v.start.center.y;
            const dr = v.end.radius - v.start.radius;
            const px = point.x - v.start.center.x;
            const py = point.y - v.start.center.y;
            const a = dx * dx + dy * dy - dr * dr;
            const bb = -2 * (px * dx + py * dy + v.start.radius * dr);
            const c = px * px + py * py - v.start.radius * v.start.radius;
            if (!std.math.isFinite(a) or !std.math.isFinite(bb) or !std.math.isFinite(c)) return error.UnsupportedGradientGeometry;
            if (a == 0) {
                if (bb == 0) return null;
                const value = -c / bb;
                return if (v.start.radius + value * dr >= 0) value else null;
            }
            const disc = bb * bb - 4 * a * c;
            if (!std.math.isFinite(disc)) return error.UnsupportedGradientGeometry;
            if (disc < 0) return null;
            const root = @sqrt(disc);
            const first = (-bb - root) / (2 * a);
            const second = (-bb + root) / (2 * a);
            var result: ?f64 = null;
            for ([_]f64{ first, second }) |value| if (std.math.isFinite(value) and v.start.radius + value * dr >= 0) {
                if (result == null or value > result.?) result = value;
            };
            return result;
        },
    }
}
fn component(value: f64) u32 {
    return @intFromFloat(@floor(std.math.clamp(value, 0, 1) * 255 + 0.5));
}
fn gradient_raster(library: *Library, view: paint.GradientView, transform: b.Matrix, width: u31, height: u31) !*b.Pattern {
    const det = transform.xx * transform.yy - transform.xy * transform.yx;
    if (!std.math.isFinite(det) or det == 0) return error.UnsupportedGradientTransform;
    const native = try surface(library, width, height);
    defer library.f.cairo_surface_destroy(native);
    library.f.cairo_surface_flush(native);
    const bytes = library.f.cairo_image_surface_get_data(native) orelse return error.NativeFailure;
    const stride: usize = @intCast(library.f.cairo_image_surface_get_stride(native));
    for (0..height) |y| for (0..width) |x| {
        const dx = @as(f64, @floatFromInt(x)) + 0.5 - transform.x0;
        const dy = @as(f64, @floatFromInt(y)) + 0.5 - transform.y0;
        const local: paint.Point = .{ .x = (transform.yy * dx - transform.xy * dy) / det, .y = (transform.xx * dy - transform.yx * dx) / det };
        if (!std.math.isFinite(local.x) or !std.math.isFinite(local.y)) return error.UnsupportedGradientTransform;
        const value = if (try gradient_parameter(view.geometry, local)) |parameter| try view.sample(parameter) else paint.GradientSample{ .r = 0, .g = 0, .b = 0, .a = 0 };
        std.mem.writeInt(u32, bytes[y * stride + x * 4 ..][0..4], (component(value.a) << 24) | (component(value.r) << 16) | (component(value.g) << 8) | component(value.b), @import("builtin").target.cpu.arch.endian());
    };
    library.f.cairo_surface_mark_dirty(native);
    const pattern = library.f.cairo_pattern_create_for_surface(native) orelse return error.NativeFailure;
    errdefer library.f.cairo_pattern_destroy(pattern);
    library.f.cairo_pattern_set_matrix(pattern, &transform);
    library.f.cairo_pattern_set_filter(pattern, 3);
    if (library.f.cairo_pattern_status(pattern) != 0) return error.NativeFailure;
    return pattern;
}
fn gradient_source(library: *Library, allocator: std.mem.Allocator, cache: anytype, packet: *const paint.Packet, context: *b.Context, id: @TypeOf(@as(paint.GradientView, undefined).id), width: u31, height: u31) !void {
    const f = library.f;
    const view = try packet.gradient_view(id);
    var transform: b.Matrix = undefined;
    var key: PatternKey = .{ .id = id };
    if (!view.constant_alpha()) {
        f.cairo_get_matrix(context, &transform);
        key.matrix = .{ @bitCast(transform.xx), @bitCast(transform.yx), @bitCast(transform.xy), @bitCast(transform.yy), @bitCast(transform.x0), @bitCast(transform.y0) };
    }
    const pattern = cache.get(key) orelse blk: {
        const created = if (!view.constant_alpha()) try gradient_raster(library, view, transform, width, height) else (switch (view.geometry) {
            .linear => |v| f.cairo_pattern_create_linear(v.start.x, v.start.y, v.end.x, v.end.y),
            .radial => |v| f.cairo_pattern_create_radial(v.start.center.x, v.start.center.y, v.start.radius, v.end.center.x, v.end.center.y, v.end.radius),
        }) orelse return error.NativeFailure;
        errdefer f.cairo_pattern_destroy(created);
        if (view.constant_alpha()) {
            for (view.stops) |stop| f.cairo_pattern_add_color_stop_rgba(created, stop.offset, stop.color.r, stop.color.g, stop.color.b, stop.color.a);
            f.cairo_pattern_set_extend(created, switch (view.extend) {
                .none => 0,
                .repeat => 1,
                .reflect => 2,
                .pad => 3,
            });
        }
        if (f.cairo_pattern_status(created) != 0) return error.NativeFailure;
        try cache.put(allocator, key, created);
        break :blk created;
    };
    f.cairo_set_source(context, pattern);
}
fn stroke_style(f: b.Functions, context: *b.Context, style: paint.Stroke) void {
    f.cairo_set_line_width(context, style.width);
    f.cairo_set_line_cap(context, switch (style.cap) {
        .butt => 0,
        .round => 1,
        .square => 2,
    });
    f.cairo_set_line_join(context, switch (style.join) {
        .miter => 0,
        .round => 1,
        .bevel => 2,
    });
    f.cairo_set_miter_limit(context, style.miter_limit);
}
fn gradient_active(command: paint.Command) bool {
    return switch (command) {
        .fill_rect_gradient => |v| v.rect.width != 0 and v.rect.height != 0,
        .fill_rounded_rect_gradient => |v| v.shape.rect.width != 0 and v.shape.rect.height != 0,
        .fill_path_gradient => |v| v.segments.len != 0,
        .stroke_path_gradient => |v| v.style.width != 0 and v.segments.len != 0,
        else => true,
    };
}
pub const Options = struct {
    max_output_bytes: usize = 256 * 1024 * 1024,
    /// Conservative logical ARGB buffers: output + peak full-size layers + unique
    /// converted images. Excludes original packet storage and native scratch/RSS.
    max_working_bytes: usize = 512 * 1024 * 1024,
};
fn admission(allocator: std.mem.Allocator, packet: *const paint.Packet, width: u31, height: u31, options: Options) !void {
    const row = std.math.mul(usize, width, 4) catch return error.OutputLimit;
    const bytes = std.math.mul(usize, row, height) catch return error.OutputLimit;
    if (bytes > options.max_output_bytes) return error.OutputLimit;
    var seen: std.AutoHashMapUnmanaged(@TypeOf(@as(paint.ImageView, undefined).id), void) = .empty;
    defer seen.deinit(allocator);
    var depth: usize = 0;
    var peak: usize = 0;
    var images: usize = 0;
    var gradient_rasters: usize = 0;
    for (try packet.commands()) |command| switch (command) {
        .begin_layer => {
            depth += 1;
            peak = @max(peak, depth);
        },
        .end_layer => depth -= 1,
        inline .fill_rect_gradient, .fill_rounded_rect_gradient, .fill_path_gradient, .stroke_path_gradient => |value| {
            if (gradient_active(command) and !(try packet.gradient_view(value.gradient_id)).constant_alpha()) gradient_rasters += 1;
        },
        .image => |value| {
            if (value.source.width == 0 or value.source.height == 0 or value.destination.width == 0 or value.destination.height == 0) continue;
            if (!seen.contains(value.image.id)) {
                images = std.math.add(usize, images, value.image.rgba.len) catch return error.WorkingLimit;
                try seen.put(allocator, value.image.id, {});
            }
        },
        else => {},
    };
    const layers_and_output = std.math.add(usize, peak, 1) catch return error.WorkingLimit;
    const groups = std.math.add(usize, layers_and_output, gradient_rasters) catch return error.WorkingLimit;
    const targets = std.math.mul(usize, groups, bytes) catch return error.WorkingLimit;
    const total = std.math.add(usize, targets, images) catch return error.WorkingLimit;
    if (total > options.max_working_bytes) return error.WorkingLimit;
}
/// Caller holds Packet throughout replay. Only encoded-sRGB compatible policy
/// is supported; native status failures discard the temporary output. Root/stack
/// singular transforms may be rejected by Cairo (never silently changed).
pub fn render(library: *Library, allocator: std.mem.Allocator, packet: *const paint.Packet, width: u31, height: u31, options: Options) !Image {
    const metadata = try packet.metadata();
    if (metadata.color_policy != .srgb_compatible) return error.UnsupportedColorPolicy;
    if (width == 0 or height == 0) return error.InvalidSize;
    try admission(allocator, packet, width, height, options);
    const output = try surface(library, width, height);
    errdefer library.f.cairo_surface_destroy(output);
    const f = library.f;
    const context = f.cairo_create(output) orelse return error.NativeFailure;
    defer f.cairo_destroy(context);
    var cache: std.AutoHashMapUnmanaged(@TypeOf(@as(paint.ImageView, undefined).id), *b.Surface) = .empty;
    defer {
        var it = cache.valueIterator();
        while (it.next()) |value| f.cairo_surface_destroy(value.*);
        cache.deinit(allocator);
    }
    var gradients: std.AutoHashMapUnmanaged(PatternKey, *b.Pattern) = .empty;
    defer {
        var it = gradients.valueIterator();
        while (it.next()) |value| f.cairo_pattern_destroy(value.*);
        gradients.deinit(allocator);
    }
    var layers: std.ArrayList(f64) = .empty;
    defer layers.deinit(allocator);
    var root = matrix(metadata.device_transform);
    f.cairo_set_matrix(context, &root);
    for (try packet.commands()) |command| {
        if (!gradient_active(command)) continue;
        switch (command) {
            .save => f.cairo_save(context),
            .restore => f.cairo_restore(context),
            .transform => |value| {
                var local = matrix(value);
                f.cairo_transform(context, &local);
            },
            .clip_rect => |value| {
                rectangle(f, context, value);
                f.cairo_clip(context);
            },
            .clip_rounded_rect => |value| {
                rounded(f, context, value);
                f.cairo_clip(context);
            },
            .clip_path => |value| {
                path(f, context, value.segments);
                f.cairo_set_fill_rule(context, if (value.rule == .nonzero) 0 else 1);
                f.cairo_clip(context);
            },
            .fill_rect => |value| {
                rectangle(f, context, value.rect);
                color(f, context, value.color);
                f.cairo_fill(context);
            },
            .fill_rounded_rect => |value| {
                rounded(f, context, value.shape);
                color(f, context, value.color);
                f.cairo_fill(context);
            },
            .fill_path => |value| {
                path(f, context, value.segments);
                f.cairo_set_fill_rule(context, if (value.rule == .nonzero) 0 else 1);
                color(f, context, value.color);
                f.cairo_fill(context);
            },
            .stroke_path => |value| {
                if (value.style.width == 0) continue;
                path(f, context, value.segments);
                color(f, context, value.color);
                f.cairo_set_line_width(context, value.style.width);
                f.cairo_set_line_cap(context, switch (value.style.cap) {
                    .butt => 0,
                    .round => 1,
                    .square => 2,
                });
                f.cairo_set_line_join(context, switch (value.style.join) {
                    .miter => 0,
                    .round => 1,
                    .bevel => 2,
                });
                f.cairo_set_miter_limit(context, value.style.miter_limit);
                f.cairo_stroke(context);
            },
            .fill_rect_gradient => |value| {
                rectangle(f, context, value.rect);
                try gradient_source(library, allocator, &gradients, packet, context, value.gradient_id, width, height);
                f.cairo_fill(context);
            },
            .fill_rounded_rect_gradient => |value| {
                rounded(f, context, value.shape);
                try gradient_source(library, allocator, &gradients, packet, context, value.gradient_id, width, height);
                f.cairo_fill(context);
            },
            .fill_path_gradient => |value| {
                path(f, context, value.segments);
                f.cairo_set_fill_rule(context, if (value.rule == .nonzero) 0 else 1);
                try gradient_source(library, allocator, &gradients, packet, context, value.gradient_id, width, height);
                f.cairo_fill(context);
            },
            .stroke_path_gradient => |value| {
                if (value.style.width == 0) continue;
                path(f, context, value.segments);
                stroke_style(f, context, value.style);
                try gradient_source(library, allocator, &gradients, packet, context, value.gradient_id, width, height);
                f.cairo_stroke(context);
            },
            .begin_layer => |opacity| {
                try layers.append(allocator, opacity);
                f.cairo_save(context);
                f.cairo_push_group(context);
            },
            .end_layer => {
                f.cairo_pop_group_to_source(context);
                f.cairo_paint_with_alpha(context, layers.pop().?);
                f.cairo_restore(context);
            },
            .image => |value| {
                if (value.source.width == 0 or value.source.height == 0 or value.destination.width == 0 or value.destination.height == 0) continue;
                const native = cache.get(value.image.id) orelse blk: {
                    const created = try raster(library, value.image);
                    cache.put(allocator, value.image.id, created) catch |err| {
                        f.cairo_surface_destroy(created);
                        return err;
                    };
                    break :blk created;
                };
                f.cairo_save(context);
                rectangle(f, context, value.destination);
                f.cairo_clip(context);
                f.cairo_translate(context, value.destination.x, value.destination.y);
                f.cairo_scale(context, value.destination.width / value.source.width, value.destination.height / value.source.height);
                f.cairo_set_source_surface(context, native, -value.source.x, -value.source.y);
                const pattern = f.cairo_get_source(context);
                f.cairo_pattern_set_filter(pattern, if (value.sampling == .nearest) 3 else 4);
                f.cairo_pattern_set_extend(pattern, 3); // PAD edges; destination clip bounds sampling.
                f.cairo_paint(context);
                f.cairo_restore(context);
            },
        }
        if (f.cairo_status(context) != 0) return error.NativeFailure;
    }
    if (f.cairo_status(context) != 0 or f.cairo_surface_status(output) != 0) return error.NativeFailure;
    return .{ .library = library, .surface = output, .width = width, .height = height };
}
