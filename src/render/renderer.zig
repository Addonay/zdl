//! Immediate-mode software renderer over a caller-owned raster, ported from SDL's
//! render layer (`render/SDL_render.c`) and its software backend
//! (`render/software/SDL_render_sw.c`).
//!
//! A `Renderer` draws into a borrowed `surface.View`: the output raster, or the
//! raster of a texture with `Access.target` after `set_target`. It owns no pixels,
//! no window and no device; presenting is the caller's job, and `present` is a no-op.
//!
//! Semantics preserved from SDL:
//! - Draw color: stored as float RGBA in [0, 1]; integer colors round-trip exactly.
//! - Blend: any `surface.Blend` equation; `Blend.ALPHA`, `ADD`, `MOD`, `MULTIPLY`
//!   and `PREMULTIPLIED` match SDL's predefined modes. Textures draw with their own
//!   blend and modulation; primitives use the renderer's blend.
//! - Viewport, clip rectangle (relative to the viewport), render scale and
//!   logical presentation (disabled, stretch, letterbox, overscan, integer scale)
//!   with window <-> render coordinate conversion.
//! - Texture addressing of `render_geometry` (`set_texture_address`): clamp, wrap, or
//!   SDL's default auto (wrap on an axis when a vertex coordinate leaves [0, 1]).
//! - Float coordinates are scaled, then truncated toward zero to integers, as the
//!   software backend does for points, lines and rectangles.
//!
//! Deliberate differences from SDL:
//! - Commands are executed immediately. SDL queues render commands and flushes
//!   them on present; that queue exists to batch GPU work and has no meaning for a
//!   CPU raster. Drawing order and results are the same.
//! - View state (viewport, clip, scale, logical presentation) is kept per
//!   renderer (`main_view`) and per target (`target_view`). SDL keeps per-target
//!   state across switches; here each target starts from defaults whenever it
//!   becomes current, and the main state is preserved while a target is active.
//! - `render_scale` also scales the rotation center of `copy_ex`. SDL's software
//!   backend passes the center unscaled, which is only correct at scale one.
//! - `read_pixels` returns `rgba8` surfaces regardless of the target format.
//! - `set_vsync` only records the flag; there is nothing to synchronize.
//! - 9-grid tiling (`SDL_RenderTexture9GridTiled`) and affine textures
//!   (`SDL_RenderTextureAffine`) are not ported yet.
//!
//! Allocation: scaled copies, rotation, geometry batches and point/line lists use
//! the renderer's allocator and free them before returning. Errors leave the
//! target partially drawn only where the underlying raster operation documents it.
const std = @import("std");
const surface = @import("../video/surface.zig");
const pixels = @import("../video/pixels.zig");
const geometry = @import("../video/geometry.zig");
const software = @import("software.zig");
const texture_mod = @import("texture.zig");
const rotate = @import("rotate.zig");
const antialias = @import("antialias.zig");
const debug_font = @import("debug_font_data.zig");

/// Streaming/static/target texture with its own storage, modulation and blend.
pub const Texture = texture_mod.Texture;
/// Byte color with straight (non-premultiplied) alpha.
pub const Color = pixels.Color;
/// Blend equation applied per color/alpha component.
pub const Blend = surface.Blend;
/// Floating-point point in render coordinates.
pub const FPoint = geometry.Point(f32);
/// Floating-point rectangle in render coordinates (boundaries included).
pub const FRect = geometry.Rect(f32);
/// Integer pixel point.
pub const IPoint = geometry.Point(i32);
/// Integer pixel rectangle (right and bottom edges excluded).
pub const IRect = geometry.Rect(i32);
/// Triangle vertex with position, color and normalized texture coordinates.
pub const Vertex = software.Vertex;

/// Every operation returns the first failing layer's error.
pub const Error = surface.Error || geometry.GeometryError || software.Error ||
    rotate.Error || texture_mod.Error || std.mem.Allocator.Error || error{
    /// A coordinate, scale or logical size was NaN, infinite or negative.
    InvalidArgument,
    /// `set_target` was given a texture that was not created with `Access.target`.
    NotTarget,
    /// A region passed to a read or copy was empty or outside the raster.
    InvalidRect,
    /// The debug-text input is not well-formed UTF-8.
    InvalidTextEncoding,
    /// Tile scale must be positive (SDL: "scale <= 0").
    InvalidTileScale,
};

/// SDL's AUTO rule: an axis wraps when any vertex coordinate on it leaves [0, 1].
fn resolve_addressing(requested: [2]TextureAddress, vertices: []const Vertex) [2]software.Address {
    var result: [2]software.Address = undefined;
    for (requested, 0..) |mode, axis| {
        result[axis] = switch (mode) {
            .clamp => .clamp,
            .wrap => .repeat,
            .auto => blk: {
                for (vertices) |vertex| {
                    const coordinate = if (axis == 0) vertex.uv.x else vertex.uv.y;
                    if (coordinate < 0 or coordinate > 1) break :blk .repeat;
                }
                break :blk .clamp;
            },
        };
    }
    return result;
}

/// Mirroring applied before rotation (`copy_ex`).
pub const Flip = struct {
    horizontal: bool = false,
    vertical: bool = false,
};

/// Texture coordinate addressing for `render_geometry` (SDL_TextureAddressMode).
pub const TextureAddress = enum {
    /// Wrap on an axis when any vertex coordinate on it lies outside [0, 1];
    /// otherwise clamp. This is SDL's default.
    auto,
    /// Coordinates are clamped to [0, 1].
    clamp,
    /// The texture repeats (tiles).
    wrap,
};

/// How a logical size is fitted into the output raster (SDL_RendererLogicalPresentation).
pub const LogicalPresentation = enum {
    /// Logical size is ignored; the render coordinate space equals the output pixels.
    disabled,
    /// Fill the output exactly, distorting the aspect ratio when necessary.
    stretch,
    /// Preserve aspect ratio, centering the logical area with bars.
    letterbox,
    /// Preserve aspect ratio, scaling until the output is covered and cropping the rest.
    overscan,
    /// Largest whole-number scale that fits, centered.
    integer_scale,
};

/// A logical render size and how it maps onto the output.
pub const Logical = struct {
    width: f32,
    height: f32,
    mode: LogicalPresentation,
};

/// Per-view state. The main output and each render target have one.
pub const ViewState = struct {
    /// Viewport in render coordinates; null covers the whole output.
    viewport: ?FRect = null,
    /// Clip rectangle in render coordinates, relative to the viewport origin.
    clip: ?FRect = null,
    /// Render scale multiplied into every coordinate.
    scale: [2]f32 = .{ 1, 1 },
    /// Optional logical size fitted onto the output.
    logical: ?Logical = null,
};

/// Derived pixel-space geometry for the current view state and output.
const Layout = struct {
    /// Destination of the logical area inside the output, in output pixels.
    dst: FRect,
    /// Render scale times logical scale: the factor from render to output pixels.
    current_scale: [2]f32,
    /// Absolute output-pixel viewport.
    viewport: IRect,
    /// Absolute output-pixel clip rectangle, or null when unclipped.
    clip: ?IRect,
    /// Viewport size in render coordinates, used as the default destination.
    render_size: FPoint,
};

/// A prepared drawing context: clipped rasterizer plus layout for coordinate mapping.
const Frame = struct {
    layout: Layout,
    raster: software.Rasterizer,
};

/// Raster renderer. Not thread-safe; the caller synchronizes access to the output
/// view and to any textures used as targets or sources.
pub const Renderer = struct {
    allocator: std.mem.Allocator,
    /// Output raster, borrowed for the renderer's lifetime.
    output: surface.View,
    /// Active render target; null draws to `output`.
    target: ?*Texture = null,
    /// Draw color as float RGBA in [0, 1].
    draw_rgba: [4]f32 = .{ 0, 0, 0, 1 },
    /// Blend for points, lines, rectangles and geometry without a texture.
    blend: Blend = Blend.REPLACE,
    /// View state of the output raster.
    main_view: ViewState = .{},
    /// View state of the active target; reset whenever a target becomes current.
    target_view: ViewState = .{},
    /// Horizontal and vertical addressing of textured geometry (not of `copy`).
    texture_address: [2]TextureAddress = .{ .auto, .auto },
    /// Recorded for API compatibility; rendering has no vertical sync to control.
    vsync: bool = false,

    /// Creates a renderer drawing into `output`. The allocator is captured for
    /// temporary buffers (scaling, rotation, batches) and never stored elsewhere.
    pub fn init(allocator: std.mem.Allocator, output: surface.View) Renderer {
        return .{ .allocator = allocator, .output = output };
    }

    /// Replaces the output raster. The main view state is kept.
    pub fn set_output(self: *Renderer, output: surface.View) void {
        self.output = output;
    }

    /// Sets the draw color from eight-bit components.
    pub fn set_draw_color(self: *Renderer, color: Color) void {
        self.draw_rgba = .{
            @as(f32, @floatFromInt(color.r)) / 255.0,
            @as(f32, @floatFromInt(color.g)) / 255.0,
            @as(f32, @floatFromInt(color.b)) / 255.0,
            @as(f32, @floatFromInt(color.a)) / 255.0,
        };
    }

    /// Sets the draw color from float components; values are clamped to [0, 1].
    pub fn set_draw_color_float(self: *Renderer, red: f32, green: f32, blue: f32, alpha: f32) Error!void {
        if (!std.math.isFinite(red) or !std.math.isFinite(green) or !std.math.isFinite(blue) or !std.math.isFinite(alpha)) return error.InvalidArgument;
        self.draw_rgba = .{ clamp_unit(red), clamp_unit(green), clamp_unit(blue), clamp_unit(alpha) };
    }

    /// Current draw color rounded to eight bits.
    pub fn draw_color(self: Renderer) Color {
        return .{
            .r = to_byte(self.draw_rgba[0]),
            .g = to_byte(self.draw_rgba[1]),
            .b = to_byte(self.draw_rgba[2]),
            .a = to_byte(self.draw_rgba[3]),
        };
    }

    /// Current draw color as float components.
    pub fn draw_color_float(self: Renderer) [4]f32 {
        return self.draw_rgba;
    }

    /// Sets the blend used by primitives. Use `surface.Blend.ALPHA` for SDL's BLEND.
    pub fn set_blend(self: *Renderer, blend: Blend) void {
        self.blend = blend;
    }

    /// Sets how `render_geometry` addresses texture coordinates outside [0, 1].
    pub fn set_texture_address(self: *Renderer, horizontal: TextureAddress, vertical: TextureAddress) void {
        self.texture_address = .{ horizontal, vertical };
    }

    /// Current horizontal and vertical texture addressing.
    pub fn texture_addressing(self: Renderer) [2]TextureAddress {
        return self.texture_address;
    }

    /// Sets the viewport in render coordinates, or null for the full output.
    pub fn set_viewport(self: *Renderer, rect: ?FRect) Error!void {
        if (rect) |requested| try requested.validate();
        self.state_ptr().viewport = rect;
    }

    /// Current viewport in render coordinates.
    pub fn viewport_rect(self: Renderer) ?FRect {
        return self.current_state().viewport;
    }

    /// Sets the clip rectangle, relative to the viewport origin, or null to disable.
    pub fn set_clip(self: *Renderer, rect: ?FRect) Error!void {
        if (rect) |requested| try requested.validate();
        self.state_ptr().clip = rect;
    }

    /// Current clip rectangle relative to the viewport.
    pub fn clip_region(self: Renderer) ?FRect {
        return self.current_state().clip;
    }

    /// Sets the render scale applied to all coordinates. Scales must be finite and
    /// non-negative.
    pub fn set_scale(self: *Renderer, scale_x: f32, scale_y: f32) Error!void {
        if (!std.math.isFinite(scale_x) or !std.math.isFinite(scale_y) or scale_x < 0 or scale_y < 0) return error.InvalidArgument;
        self.state_ptr().scale = .{ scale_x, scale_y };
    }

    /// Current render scale.
    pub fn render_scale(self: Renderer) [2]f32 {
        return self.current_state().scale;
    }

    /// Sets logical presentation. A null value, or mode `disabled`, uses output pixels.
    pub fn set_logical_presentation(self: *Renderer, logical: ?Logical) Error!void {
        if (logical) |requested| {
            if (!std.math.isFinite(requested.width) or !std.math.isFinite(requested.height) or requested.width < 0 or requested.height < 0) return error.InvalidArgument;
        }
        self.state_ptr().logical = logical;
    }

    /// Makes `texture` the render target, or restores the output when null.
    /// The target's view state starts from defaults every time it becomes current.
    pub fn set_target(self: *Renderer, next: ?*Texture) Error!void {
        if (next) |requested| {
            if (requested.access != .target) return error.NotTarget;
        }
        self.target = next;
        self.target_view = .{};
    }

    /// Currently active render target, or null when drawing to the output.
    pub fn render_target(self: Renderer) ?*Texture {
        return self.target;
    }

    /// Records the vsync request. Rendering is immediate and has no present queue.
    pub fn set_vsync(self: *Renderer, enabled: bool) void {
        self.vsync = enabled;
    }

    /// No-op: the caller owns the output raster and presents it however it likes.
    pub fn present(self: Renderer) void {
        _ = self;
    }

    /// Fills the active raster (or the clip-free output region) with the draw
    /// color. Like SDL_RenderClear, it ignores viewport and clip rectangle.
    pub fn clear(self: *Renderer) Error!void {
        try self.active_view().fill(self.draw_color(), null);
    }

    /// Draws one point at the scaled, truncated position.
    pub fn draw_point(self: *Renderer, point: FPoint) Error!void {
        try self.draw_points(&.{point});
    }

    /// Draws points. With a render scale other than one, each point becomes a
    /// scaled one-pixel rectangle, as SDL's `RenderPointsWithRects` does.
    pub fn draw_points(self: *Renderer, points: []const FPoint) Error!void {
        const frame = (try self.prepare_frame(self.draw_color(), self.blend)) orelse return;
        if (frame.layout.current_scale[0] != 1 or frame.layout.current_scale[1] != 1) {
            for (points) |point| try frame.raster.fill_rect(try device_rect(frame.layout, .{ .x = point.x, .y = point.y, .width = 1, .height = 1 }));
            return;
        }
        var list: std.ArrayList(IPoint) = .empty;
        defer list.deinit(self.allocator);
        for (points) |point| try list.append(self.allocator, try device_point(frame.layout, point));
        try frame.raster.points(list.items);
    }

    /// Draws one line segment with inclusive endpoints.
    pub fn draw_line(self: *Renderer, start: FPoint, end: FPoint) Error!void {
        try self.draw_lines(&.{ start, end });
    }

    /// Draws connected segments through `points`. Shared vertices are blended once.
    pub fn draw_lines(self: *Renderer, points: []const FPoint) Error!void {
        const frame = (try self.prepare_frame(self.draw_color(), self.blend)) orelse return;
        try self.polyline_device(frame, points, false);
    }

    /// Draws the outline of `rect`. The inclusive corners are `(x, y)` and
    /// `(x + w - 1, y + h - 1)` in render coordinates, matching SDL_RenderRect.
    pub fn draw_rect(self: *Renderer, rect: FRect) Error!void {
        try self.draw_rects(&.{rect});
    }

    /// Draws outlines of several rectangles.
    pub fn draw_rects(self: *Renderer, rects: []const FRect) Error!void {
        const frame = (try self.prepare_frame(self.draw_color(), self.blend)) orelse return;
        for (rects) |rect| try self.polyline_device(frame, &outline_corners(rect), true);
    }

    /// Fills one rectangle with the draw color and renderer blend.
    pub fn fill_rect(self: *Renderer, rect: FRect) Error!void {
        try self.fill_rects(&.{rect});
    }

    /// Fills several rectangles. Float edges are scaled then truncated per the
    /// software backend; negative widths or heights extend to the left or up.
    pub fn fill_rects(self: *Renderer, rects: []const FRect) Error!void {
        const frame = (try self.prepare_frame(self.draw_color(), self.blend)) orelse return;
        for (rects) |rect| try frame.raster.fill_rect(try device_rect(frame.layout, rect));
    }

    /// Draws SDL's public-domain 8x8 debug font at the current draw color.
    /// Unsupported Unicode codepoints use the font's final replacement glyph;
    /// spaces and control separators advance the pen without drawing. Text uses
    /// the current render scale and viewport just like ordinary points.
    pub fn debug_text(self: *Renderer, x: f32, y: f32, text: []const u8) Error!void {
        const utf8 = std.unicode.Utf8View.init(text) catch return error.InvalidTextEncoding;
        var points: std.ArrayList(FPoint) = .empty;
        defer points.deinit(self.allocator);

        var cursor_x = x;
        var iterator = utf8.iterator();
        while (iterator.nextCodepoint()) |codepoint| : (cursor_x += 8) {
            const glyph = debug_glyph(codepoint) orelse continue;
            for (0..8) |row| {
                const bits = debug_font.glyphs[glyph * 8 + row];
                for (0..8) |column| {
                    if (bits & (@as(u8, 1) << @intCast(column)) != 0) {
                        try points.append(self.allocator, .{ .x = cursor_x + @as(f32, @floatFromInt(column)), .y = y + @as(f32, @floatFromInt(row)) });
                    }
                }
            }
        }

        const previous_blend = self.blend;
        self.blend = Blend.ALPHA;
        defer self.blend = previous_blend;
        try self.draw_points(points.items);
    }

    /// Formats a message with Zig's compile-time checked format string, then
    /// draws it with `debug_text`. The temporary formatted bytes are freed here.
    pub fn debug_text_format(self: *Renderer, x: f32, y: f32, comptime format: []const u8, arguments: anytype) Error!void {
        const message = try std.fmt.allocPrint(self.allocator, format, arguments);
        defer self.allocator.free(message);
        try self.debug_text(x, y, message);
    }

    /// Draws a line with Wu antialiasing (opt-in; SDL's default line is crisp).
    /// Coordinates are scaled and truncated like `draw_line`.
    pub fn draw_line_antialiased(self: *Renderer, start: FPoint, end: FPoint) Error!void {
        const frame = (try self.prepare_frame(self.draw_color(), self.blend)) orelse return;
        const a = try device_point(frame.layout, start);
        const b = try device_point(frame.layout, end);
        try antialias.line(self.active_view(), frame.raster.clip, a, b, self.draw_color(), self.blend);
    }

    /// Copies `source` (texture pixels, default: all) into `destination` (render
    /// coordinates, default: the viewport), using the texture's blend, color/alpha
    /// modulation and scale mode. The source is clipped to the texture; the
    /// destination is not adjusted, as in SDL_RenderTexture.
    pub fn copy(self: *Renderer, tex: *Texture, source: ?FRect, destination: ?FRect) Error!void {
        const src = (try self.resolve_source(tex, source)) orelse return;
        const dst = destination orelse self.default_destination(try self.compute_layout());
        const layout = try self.compute_layout();
        const clip = (try self.draw_clip(layout)) orelse return;
        const device = try device_rect(layout, dst);
        if (device.is_empty()) return;
        const src_pixels = try source_pixels(src);
        if (src_pixels.is_empty()) return;

        const modulation: Color = .{ .r = tex.color_mod.r, .g = tex.color_mod.g, .b = tex.color_mod.b, .a = tex.alpha_mod };
        const target_view = self.active_view();
        if (src_pixels.width == device.width and src_pixels.height == device.height) {
            _ = try target_view.blit(self.allocator, tex.view(), .{
                .source_region = src_pixels,
                .destination = .{ .x = device.x, .y = device.y },
                .clip = clip,
                .blend = tex.blend,
                .modulation = modulation,
            });
            return;
        }
        // Scale to the destination size, then blit as an ordinary raster.
        const sub = try tex.sub_view(src_pixels);
        var scaled = try surface.Surface.scaled(self.allocator, sub, try to_u31(device.width), try to_u31(device.height), tex.scale_mode);
        defer scaled.deinit();
        _ = try target_view.blit(self.allocator, scaled.view, .{
            .destination = .{ .x = device.x, .y = device.y },
            .clip = clip,
            .blend = tex.blend,
            .modulation = modulation,
        });
    }

    /// Copies `source` rotated clockwise by `angle_degrees` around `center`
    /// (default: the destination center), optionally mirrored first. The source is
    /// scaled to the destination size, rotated by `rotate.rotate` (SDL's rotozoomer),
    /// and composited with the texture's blend. Transparent pixels are never blended,
    /// so the rotated bounds leave their surroundings untouched.
    pub fn copy_ex(self: *Renderer, tex: *Texture, source: ?FRect, destination: ?FRect, angle_degrees: f64, center: ?FPoint, flip: Flip) Error!void {
        if (!flip.horizontal and !flip.vertical and @mod(angle_degrees, 360.0) == 0) {
            return self.copy(tex, source, destination);
        }
        const src = (try self.resolve_source(tex, source)) orelse return;
        const layout = try self.compute_layout();
        const dst = destination orelse self.default_destination(layout);
        const clip = (try self.draw_clip(layout)) orelse return;
        const device = try device_rect(layout, dst);
        if (device.is_empty()) return;
        const src_pixels = try source_pixels(src);
        if (src_pixels.is_empty()) return;

        // Rotation center in destination pixels. Default: the destination center.
        const pivot: rotate.Point = if (center) |c| .{
            .x = c.x * layout.current_scale[0],
            .y = c.y * layout.current_scale[1],
        } else .{
            .x = @as(f32, @floatFromInt(device.width)) / 2,
            .y = @as(f32, @floatFromInt(device.height)) / 2,
        };
        const transform = try rotate.transform_for(device.width, device.height, angle_degrees, pivot);

        const sub = try tex.sub_view(src_pixels);
        var scaled: ?surface.Surface = null;
        defer if (scaled) |*owned| owned.deinit();
        const sampled: surface.View = if (src_pixels.width == device.width and src_pixels.height == device.height) sub else blk: {
            scaled = try surface.Surface.scaled(self.allocator, sub, try to_u31(device.width), try to_u31(device.height), tex.scale_mode);
            break :blk scaled.?.view;
        };
        const smooth = tex.scale_mode == .linear;
        var rotated = try rotate.rotate(self.allocator, sampled, transform, .{
            .angle_degrees = angle_degrees,
            .center = pivot,
            .flip_horizontal = flip.horizontal,
            .flip_vertical = flip.vertical,
            .smooth = smooth,
        });
        defer rotated.deinit();

        const modulation: Color = .{ .r = tex.color_mod.r, .g = tex.color_mod.g, .b = tex.color_mod.b, .a = tex.alpha_mod };
        const origin: IPoint = .{
            .x = try offset(device.x, transform.bounds.x),
            .y = try offset(device.y, transform.bounds.y),
        };
        try composite(self.active_view(), rotated.view, origin, clip, tex.blend, modulation);
    }

    /// Maps a texture region onto a parallelogram. `origin`, `right` and `down`
    /// are its top-left, top-right and bottom-left destination corners, matching
    /// SDL_RenderTextureAffine; the fourth corner is derived from those three.
    pub fn copy_affine(self: *Renderer, tex: *Texture, source: ?FRect, origin: FPoint, right: FPoint, down: FPoint) Error!void {
        const src = (try self.resolve_source(tex, source)) orelse return;
        if (tex.width() == 0 or tex.height() == 0) return error.InvalidRect;
        const left_u = src.x / @as(f32, @floatFromInt(tex.width()));
        const right_u = (src.x + src.width) / @as(f32, @floatFromInt(tex.width()));
        const top_v = src.y / @as(f32, @floatFromInt(tex.height()));
        const bottom_v = (src.y + src.height) / @as(f32, @floatFromInt(tex.height()));
        const fourth = FPoint{ .x = right.x + down.x - origin.x, .y = right.y + down.y - origin.y };
        const white = Color{ .r = 255, .g = 255, .b = 255, .a = 255 };
        const vertices = [_]Vertex{
            .{ .position = origin, .color = white, .uv = .{ .x = left_u, .y = top_v } },
            .{ .position = right, .color = white, .uv = .{ .x = right_u, .y = top_v } },
            .{ .position = down, .color = white, .uv = .{ .x = left_u, .y = bottom_v } },
            .{ .position = fourth, .color = white, .uv = .{ .x = right_u, .y = bottom_v } },
        };
        const indices = [_]u32{ 0, 1, 2, 1, 3, 2 };
        try self.render_geometry(tex, &vertices, &indices);
    }

    /// Repeats `source` across `destination` in tiles of `source size * scale`,
    /// with clipped partial tiles on the right and bottom edges. Implements SDL's
    /// iterated (non-wrapping) tiling, which is what the software backend uses.
    pub fn copy_tiled(self: *Renderer, tex: *Texture, source: ?FRect, tile_scale: f32, destination: ?FRect) Error!void {
        if (!(tile_scale > 0)) return error.InvalidTileScale;
        const src = (try self.resolve_source(tex, source)) orelse return;
        const dst = destination orelse self.default_destination(try self.compute_layout());

        const tile_width = src.width * tile_scale;
        const tile_height = src.height * tile_scale;
        const cols_float = @floor(dst.width / tile_width);
        const rows_float = @floor(dst.height / tile_height);
        const remaining_w = dst.width / tile_width - cols_float;
        const remaining_h = dst.height / tile_height - rows_float;
        const remaining_src_w = remaining_w * src.width;
        const remaining_src_h = remaining_h * src.height;
        const remaining_dst_w = remaining_w * tile_width;
        const remaining_dst_h = remaining_h * tile_height;
        const rows: usize = @intFromFloat(rows_float);
        const cols: usize = @intFromFloat(cols_float);

        var curr_src = src;
        var curr_dst: FRect = .{ .x = dst.x, .y = dst.y, .width = tile_width, .height = tile_height };
        var row: usize = 0;
        while (row < rows) : (row += 1) {
            curr_dst.x = dst.x;
            var col: usize = 0;
            while (col < cols) : (col += 1) {
                try self.copy(tex, curr_src, curr_dst);
                curr_dst.x += curr_dst.width;
            }
            if (remaining_dst_w > 0) {
                curr_src.width = remaining_src_w;
                curr_dst.width = remaining_dst_w;
                try self.copy(tex, curr_src, curr_dst);
                curr_src.width = src.width;
                curr_dst.width = tile_width;
            }
            curr_dst.y += curr_dst.height;
        }
        if (remaining_dst_h > 0) {
            curr_src.height = remaining_src_h;
            curr_dst.height = remaining_dst_h;
            curr_dst.x = dst.x;
            var col: usize = 0;
            while (col < cols) : (col += 1) {
                try self.copy(tex, curr_src, curr_dst);
                curr_dst.x += curr_dst.width;
            }
            if (remaining_dst_w > 0) {
                curr_src.width = remaining_src_w;
                curr_dst.width = remaining_dst_w;
                try self.copy(tex, curr_src, curr_dst);
            }
        }
    }

    /// Draws `source` as a nine-slice: corners stay at their (scaled) sizes while
    /// edges and the center stretch. Widths are in source pixels and are ceiled
    /// after scaling, as SDL_RenderTexture9Grid does. The source is not clipped to
    /// the texture here; it is clipped per piece by `copy`.
    pub fn copy_9grid(self: *Renderer, tex: *Texture, source: ?FRect, left_width: f32, right_width: f32, top_height: f32, bottom_height: f32, grid_scale: f32, destination: ?FRect) Error!void {
        const full: FRect = .{ .x = 0, .y = 0, .width = @floatFromInt(tex.width()), .height = @floatFromInt(tex.height()) };
        const src = source orelse full;
        const dst = destination orelse self.default_destination(try self.compute_layout());

        const scaled = grid_scale > 0 and grid_scale != 1;
        const dst_left = @ceil(if (scaled) left_width * grid_scale else left_width);
        const dst_right = @ceil(if (scaled) right_width * grid_scale else right_width);
        const dst_top = @ceil(if (scaled) top_height * grid_scale else top_height);
        const dst_bottom = @ceil(if (scaled) bottom_height * grid_scale else bottom_height);

        // Center.
        try self.copy(tex, .{
            .x = src.x + left_width,
            .y = src.y + top_height,
            .width = src.width - left_width - right_width,
            .height = src.height - top_height - bottom_height,
        }, .{
            .x = dst.x + dst_left,
            .y = dst.y + dst_top,
            .width = dst.width - dst_left - dst_right,
            .height = dst.height - dst_top - dst_bottom,
        });
        // Top-left corner.
        try self.copy(tex, .{ .x = src.x, .y = src.y, .width = left_width, .height = top_height }, .{ .x = dst.x, .y = dst.y, .width = dst_left, .height = dst_top });
        // Top-right corner.
        try self.copy(tex, .{ .x = src.x + src.width - right_width, .y = src.y, .width = right_width, .height = top_height }, .{ .x = dst.x + dst.width - dst_right, .y = dst.y, .width = dst_right, .height = dst_top });
        // Bottom-left corner.
        try self.copy(tex, .{ .x = src.x, .y = src.y + src.height - bottom_height, .width = left_width, .height = bottom_height }, .{ .x = dst.x, .y = dst.y + dst.height - dst_bottom, .width = dst_left, .height = dst_bottom });
        // Bottom-right corner.
        try self.copy(tex, .{ .x = src.x + src.width - right_width, .y = src.y + src.height - bottom_height, .width = right_width, .height = bottom_height }, .{ .x = dst.x + dst.width - dst_right, .y = dst.y + dst.height - dst_bottom, .width = dst_right, .height = dst_bottom });
        // Left edge.
        try self.copy(tex, .{ .x = src.x, .y = src.y + top_height, .width = left_width, .height = src.height - top_height - bottom_height }, .{ .x = dst.x, .y = dst.y + dst_top, .width = dst_left, .height = dst.height - dst_top - dst_bottom });
        // Right edge.
        try self.copy(tex, .{ .x = src.x + src.width - right_width, .y = src.y + top_height, .width = right_width, .height = src.height - top_height - bottom_height }, .{ .x = dst.x + dst.width - dst_right, .y = dst.y + dst_top, .width = dst_right, .height = dst.height - dst_top - dst_bottom });
        // Top edge.
        try self.copy(tex, .{ .x = src.x + left_width, .y = src.y, .width = src.width - left_width - right_width, .height = top_height }, .{ .x = dst.x + dst_left, .y = dst.y, .width = dst.width - dst_left - dst_right, .height = dst_top });
        // Bottom edge.
        try self.copy(tex, .{ .x = src.x + left_width, .y = src.y + src.height - bottom_height, .width = src.width - left_width - right_width, .height = bottom_height }, .{ .x = dst.x + dst_left, .y = dst.y + dst.height - dst_bottom, .width = dst.width - dst_left - dst_right, .height = dst_bottom });
    }

    /// Draws triangles with per-vertex color and texture coordinates. Positions are
    /// render coordinates: they are scaled, offset by the viewport and rasterized
    /// with `software.Rasterizer.mesh`. With a texture, its color/alpha modulation
    /// scales the vertex colors and its blend is used; without one, vertex colors
    /// are used as given and the renderer blend applies (the draw color is ignored).
    pub fn render_geometry(self: *Renderer, tex: ?*Texture, vertices: []const Vertex, indices: ?[]const u32) Error!void {
        const layout = try self.compute_layout();
        const clip = (try self.draw_clip(layout)) orelse return;
        const origin_x: f32 = @floatFromInt(layout.viewport.x);
        const origin_y: f32 = @floatFromInt(layout.viewport.y);

        var list: std.ArrayList(Vertex) = .empty;
        defer list.deinit(self.allocator);
        for (vertices) |vertex| {
            var out = vertex;
            out.position = .{
                .x = vertex.position.x * layout.current_scale[0] + origin_x,
                .y = vertex.position.y * layout.current_scale[1] + origin_y,
            };
            if (tex) |texture| {
                out.color = modulate(out.color, .{ .r = texture.color_mod.r, .g = texture.color_mod.g, .b = texture.color_mod.b, .a = texture.alpha_mod });
            }
            try list.append(self.allocator, out);
        }

        const blend = if (tex) |texture| texture.blend else self.blend;
        const sampler: ?software.Texture = if (tex) |texture| blk: {
            const modes = resolve_addressing(self.texture_address, vertices);
            break :blk .{ .view = texture.view(), .horizontal = modes[0], .vertical = modes[1] };
        } else null;
        const raster: software.Rasterizer = .{
            .target = self.active_view(),
            .clip = clip,
            .color = self.draw_color(),
            .blend = blend,
        };
        try raster.mesh(self.allocator, list.items, indices, sampler);
    }

    /// Copies pixels of the active raster into a new `rgba8` surface. `region` is in
    /// output or target pixels; null reads the whole raster. The caller owns the result.
    pub fn read_pixels(self: Renderer, region: ?IRect) Error!surface.Surface {
        const view = self.active_view();
        const selected = if (region) |requested| (try view.bounds().intersection(requested)) orelse return error.InvalidRect else view.bounds();
        if (selected.is_empty()) return error.InvalidRect;
        var result = try surface.Surface.init(self.allocator, try to_u31(selected.width), try to_u31(selected.height), .rgba8, null);
        errdefer result.deinit();
        const left: usize = @intCast(selected.x);
        const top: usize = @intCast(selected.y);
        for (0..result.view.height) |y| {
            for (0..result.view.width) |x| try result.view.write(x, y, try view.read(left + x, top + y));
        }
        return result;
    }

    /// Converts a window point (output pixels) into render coordinates using the
    /// current view state. Inverse of `render_to_window` for point input.
    pub fn window_to_render(self: Renderer, point: FPoint) Error!FPoint {
        const layout = try self.compute_layout();
        const state = self.current_state();
        var x = point.x;
        var y = point.y;
        if (active_logical(state)) |logical| {
            if (layout.dst.width == 0 or layout.dst.height == 0) return error.InvalidArgument;
            x = (x - layout.dst.x) * logical.width / layout.dst.width;
            y = (y - layout.dst.y) * logical.height / layout.dst.height;
        }
        if (state.scale[0] == 0 or state.scale[1] == 0) return error.InvalidArgument;
        const origin_x = if (state.viewport) |vp_value| vp_value.x else 0;
        const origin_y = if (state.viewport) |vp_value| vp_value.y else 0;
        return .{ .x = x / state.scale[0] - origin_x, .y = y / state.scale[1] - origin_y };
    }

    /// Converts a render-coordinate point to window (output) pixels.
    pub fn render_to_window(self: Renderer, point: FPoint) Error!FPoint {
        const layout = try self.compute_layout();
        const state = self.current_state();
        const origin_x = if (state.viewport) |vp_value| vp_value.x else 0;
        const origin_y = if (state.viewport) |vp_value| vp_value.y else 0;
        var x = (origin_x + point.x) * state.scale[0];
        var y = (origin_y + point.y) * state.scale[1];
        if (active_logical(state)) |logical| {
            if (logical.width == 0 or logical.height == 0) return error.InvalidArgument;
            x = layout.dst.x + x * layout.dst.width / logical.width;
            y = layout.dst.y + y * layout.dst.height / logical.height;
        }
        return .{ .x = x, .y = y };
    }

    // ---- internal helpers -------------------------------------------------

    fn current_state(self: Renderer) ViewState {
        return if (self.target != null) self.target_view else self.main_view;
    }

    fn state_ptr(self: *Renderer) *ViewState {
        return if (self.target != null) &self.target_view else &self.main_view;
    }

    fn active_view(self: Renderer) surface.View {
        if (self.target) |texture| return texture.view();
        return self.output;
    }

    /// Computes the pixel mapping for the current state and output. Mirrors
    /// SDL's `UpdateLogicalPresentation`, `UpdatePixelViewport` and
    /// `UpdatePixelClipRect`, recomputed on demand rather than cached.
    fn compute_layout(self: Renderer) Error!Layout {
        const current = self.current_state();
        const view = self.active_view();
        const output_w: f32 = @floatFromInt(view.width);
        const output_h: f32 = @floatFromInt(view.height);

        var dst: FRect = .{ .x = 0, .y = 0, .width = output_w, .height = output_h };
        var logical_scale: [2]f32 = .{ 1, 1 };
        if (active_logical(current)) |logical| {
            dst = presentation_rect(logical, output_w, output_h);
            logical_scale = .{
                if (logical.width > 0) dst.width / logical.width else 0,
                if (logical.height > 0) dst.height / logical.height else 0,
            };
        }
        const cs: [2]f32 = .{ current.scale[0] * logical_scale[0], current.scale[1] * logical_scale[1] };
        const pixel_w = try int_of(dst.width);
        const pixel_h = try int_of(dst.height);

        // Viewport: origin floored, extent ceiled, both scaled by the current scale.
        const vp_rect = current.viewport;
        const vp = vp_rect orelse FRect{ .x = 0, .y = 0, .width = -1, .height = -1 };
        const vp_x = try floor_i32(vp.x * cs[0] + dst.x);
        const vp_y = try floor_i32(vp.y * cs[1] + dst.y);
        const vp_w = if (vp_rect != null) try ceil_i32(vp.width * cs[0]) else pixel_w;
        const vp_h = if (vp_rect != null) try ceil_i32(vp.height * cs[1]) else pixel_h;
        const viewport_pixels: IRect = .{ .x = vp_x, .y = vp_y, .width = vp_w, .height = vp_h };

        // Clip rectangle, relative to the viewport origin.
        var clip_pixels: ?IRect = null;
        if (current.clip) |clip_rect| {
            clip_pixels = .{
                .x = try offset(vp_x, try floor_i32(clip_rect.x * cs[0])),
                .y = try offset(vp_y, try floor_i32(clip_rect.y * cs[1])),
                .width = try ceil_i32(clip_rect.width * cs[0]),
                .height = try ceil_i32(clip_rect.height * cs[1]),
            };
        }

        const render_w: f32 = if (vp_rect) |vp_value| vp_value.width else if (cs[0] > 0) @as(f32, @floatFromInt(pixel_w)) / cs[0] else 0;
        const render_h: f32 = if (vp_rect) |vp_value| vp_value.height else if (cs[1] > 0) @as(f32, @floatFromInt(pixel_h)) / cs[1] else 0;
        return .{
            .dst = dst,
            .current_scale = cs,
            .viewport = viewport_pixels,
            .clip = clip_pixels,
            .render_size = .{ .x = render_w, .y = render_h },
        };
    }

    /// Output-pixel rectangle that draws may touch: viewport, clipped, inside output.
    fn draw_clip(self: Renderer, layout_value: Layout) Error!?IRect {
        var bounds = (try self.active_view().bounds().intersection(layout_value.viewport)) orelse return null;
        if (layout_value.clip) |clip_rect| bounds = (try bounds.intersection(clip_rect)) orelse return null;
        if (bounds.is_empty()) return null;
        return bounds;
    }

    fn prepare_frame(self: Renderer, color: Color, blend: Blend) Error!?Frame {
        const layout_value = try self.compute_layout();
        const clip_rect = (try self.draw_clip(layout_value)) orelse return null;
        return .{
            .layout = layout_value,
            .raster = .{ .target = self.active_view(), .clip = clip_rect, .color = color, .blend = blend },
        };
    }

    fn polyline_device(self: Renderer, frame_value: Frame, points: []const FPoint, closed: bool) Error!void {
        var list: std.ArrayList(IPoint) = .empty;
        defer list.deinit(self.allocator);
        for (points) |point| try list.append(self.allocator, try device_point(frame_value.layout, point));
        try frame_value.raster.polyline(list.items, closed);
    }

    /// Source rectangle clipped to the texture; null when empty.
    fn resolve_source(self: Renderer, tex: *Texture, requested: ?FRect) Error!?FRect {
        _ = self;
        const full: FRect = .{ .x = 0, .y = 0, .width = @floatFromInt(tex.width()), .height = @floatFromInt(tex.height()) };
        const selected = if (requested) |rect| (try full.intersection(rect)) orelse return null else full;
        if (selected.width <= 0 or selected.height <= 0) return null;
        return selected;
    }

    fn default_destination(self: Renderer, layout_value: Layout) FRect {
        _ = self;
        return .{ .x = 0, .y = 0, .width = layout_value.render_size.x, .height = layout_value.render_size.y };
    }
};

/// Integer pixel rectangle covering a float source region, truncated like SDL's
/// software backend.
fn source_pixels(source: FRect) Error!IRect {
    return .{
        .x = try int_of(source.x),
        .y = try int_of(source.y),
        .width = try int_of(source.width),
        .height = try int_of(source.height),
    };
}

/// Maps a render-space point to output pixels: scaled, truncated, viewport-offset.
fn device_point(layout_value: Layout, point: FPoint) Error!IPoint {
    return .{
        .x = try offset(try int_of(point.x * layout_value.current_scale[0]), layout_value.viewport.x),
        .y = try offset(try int_of(point.y * layout_value.current_scale[1]), layout_value.viewport.y),
    };
}

/// Maps a render-space rectangle to output pixels. Like SDL's software backend,
/// each float component is truncated after scaling; a negative width or height
/// is made positive and moves the origin toward the negative side.
fn device_rect(layout_value: Layout, rect: FRect) Error!IRect {
    var x = try int_of(rect.x * layout_value.current_scale[0]);
    var w = try int_of(rect.width * layout_value.current_scale[0]);
    var y = try int_of(rect.y * layout_value.current_scale[1]);
    var h = try int_of(rect.height * layout_value.current_scale[1]);
    if (w < 0) {
        w = -w;
        x -= w;
    }
    if (h < 0) {
        h = -h;
        y -= h;
    }
    return .{
        .x = try offset(x, layout_value.viewport.x),
        .y = try offset(y, layout_value.viewport.y),
        .width = w,
        .height = h,
    };
}

/// Four inclusive corners of an outline, in SDL_RenderRect order (closed).
fn outline_corners(rect: FRect) [4]FPoint {
    const right = rect.x + rect.width - 1;
    const bottom = rect.y + rect.height - 1;
    return .{
        .{ .x = rect.x, .y = rect.y },
        .{ .x = right, .y = rect.y },
        .{ .x = right, .y = bottom },
        .{ .x = rect.x, .y = bottom },
    };
}

/// Presentation of the logical area inside the output, as SDL computes it.
fn presentation_rect(logical: Logical, output_w: f32, output_h: f32) FRect {
    const full: FRect = .{ .x = 0, .y = 0, .width = output_w, .height = output_h };
    if (logical.width <= 0 or logical.height <= 0 or output_w <= 0 or output_h <= 0) return full;
    const want_aspect = logical.width / logical.height;
    const real_aspect = output_w / output_h;

    switch (logical.mode) {
        .disabled, .stretch => return full,
        .integer_scale => {
            // Integer division on truncated sizes, as SDL does; the divisor is clamped to one.
            const out_w_int: i64 = @intFromFloat(output_w);
            const out_h_int: i64 = @intFromFloat(output_h);
            const log_w_int: i64 = @max(1, @as(i64, @intFromFloat(logical.width)));
            const log_h_int: i64 = @max(1, @as(i64, @intFromFloat(logical.height)));
            var scale_int: i64 = if (want_aspect > real_aspect) @divTrunc(out_w_int, log_w_int) else @divTrunc(out_h_int, log_h_int);
            if (scale_int < 1) scale_int = 1;
            const scale_f: f32 = @floatFromInt(scale_int);
            const w = @floor(logical.width * scale_f);
            const h = @floor(logical.height * scale_f);
            return .{ .x = (output_w - w) / 2, .y = (output_h - h) / 2, .width = w, .height = h };
        },
        .letterbox, .overscan => {},
    }
    if (@abs(want_aspect - real_aspect) < 0.0001) return full;

    const letterbox = logical.mode == .letterbox;
    if (want_aspect > real_aspect) {
        if (letterbox) {
            // Wider logical area than output: bars above and below.
            const scale_f = output_w / logical.width;
            const h = @floor(logical.height * scale_f);
            return .{ .x = 0, .y = (output_h - h) / 2, .width = output_w, .height = h };
        }
        // Overscan: cover the height and crop the sides.
        const scale_f = output_h / logical.height;
        const w = @floor(logical.width * scale_f);
        return .{ .x = (output_w - w) / 2, .y = 0, .width = w, .height = output_h };
    }
    if (letterbox) {
        // Narrower logical area: side bars.
        const scale_f = output_h / logical.height;
        const w = @floor(logical.width * scale_f);
        return .{ .x = (output_w - w) / 2, .y = 0, .width = w, .height = output_h };
    }
    // Overscan: cover the width and crop top and bottom.
    const scale_f = output_w / logical.width;
    const h = @floor(logical.height * scale_f);
    return .{ .x = 0, .y = (output_h - h) / 2, .width = output_w, .height = h };
}

/// Blits a rotated surface onto `target`. Pixels with zero alpha are skipped so
/// the rotation's transparent surroundings never affect the destination.
fn composite(target: surface.View, source: surface.View, origin: IPoint, clip_rect: IRect, blend: Blend, modulation: Color) Error!void {
    const clip_right = @as(i64, clip_rect.x) + clip_rect.width;
    const clip_bottom = @as(i64, clip_rect.y) + clip_rect.height;
    for (0..source.height) |sy| {
        for (0..source.width) |sx| {
            const tx = @as(i64, origin.x) + @as(i64, @intCast(sx));
            const ty = @as(i64, origin.y) + @as(i64, @intCast(sy));
            if (tx < clip_rect.x or ty < clip_rect.y or tx >= clip_right or ty >= clip_bottom) continue;
            var color = try source.read(sx, sy);
            if (color.a == 0) continue;
            color = modulate(color, modulation);
            const ux: usize = @intCast(tx);
            const uy: usize = @intCast(ty);
            const destination = try target.read(ux, uy);
            try target.write(ux, uy, blend.apply(color, destination));
        }
    }
}

/// Component-wise `c * m / 255`, the modulation used throughout the raster layer.
fn modulate(color: Color, multiplier: Color) Color {
    return .{
        .r = @intCast((@as(u32, color.r) * multiplier.r) / 255),
        .g = @intCast((@as(u32, color.g) * multiplier.g) / 255),
        .b = @intCast((@as(u32, color.b) * multiplier.b) / 255),
        .a = @intCast((@as(u32, color.a) * multiplier.a) / 255),
    };
}

/// Maps SDL's byte/codepoint rules onto its 190 glyph slots.
fn debug_glyph(codepoint: u21) ?usize {
    if (codepoint <= 32 or (127 <= codepoint and codepoint <= 160)) return null;
    if (codepoint >= 190) return 189;
    if (codepoint < 127) return codepoint - 33;
    return codepoint - 67;
}

/// Logical presentation of a state when it is active (not disabled).
fn active_logical(current: ViewState) ?Logical {
    const logical = current.logical orelse return null;
    if (logical.mode == .disabled) return null;
    return logical;
}

fn clamp_unit(value: f32) f32 {
    return std.math.clamp(value, 0, 1);
}

fn to_byte(unit: f32) u8 {
    return @intFromFloat(@round(clamp_unit(unit) * 255));
}

/// Truncates toward zero, rejecting values that do not fit an i32.
fn int_of(value: f32) geometry.GeometryError!i32 {
    if (!std.math.isFinite(value)) return error.NonFinite;
    if (value < -2147483648.0 or value >= 2147483648.0) return error.Overflow;
    return @intFromFloat(value);
}

fn floor_i32(value: f32) geometry.GeometryError!i32 {
    return int_of(@floor(value));
}

fn ceil_i32(value: f32) geometry.GeometryError!i32 {
    return int_of(@ceil(value));
}

fn offset(a: i32, b: i32) geometry.GeometryError!i32 {
    return std.math.add(i32, a, b) catch error.Overflow;
}

fn to_u31(value: i32) geometry.GeometryError!u31 {
    return std.math.cast(u31, value) orelse error.Overflow;
}
