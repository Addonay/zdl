//! GPU render backend: the `render/renderer.zig` API recorded into zdl.gpu
//! render passes, ported from SDL's GPU renderer (`render/gpu/SDL_render_gpu.c`)
//! and its generic command layer (`render/SDL_render.c`).
//!
//! Frame model, as in SDL:
//! - Each drawing call appends its vertices to a per-frame byte stream and records
//!   a `Command` that captures the complete state it needs (viewport, scissor,
//!   texture, blend, sampling, primitive, color scale). Nothing reaches the GPU yet.
//! - Consecutive commands with identical state and contiguous vertices merge into
//!   one draw, as SDL's command queue does.
//! - `flush` runs the queue: the vertex stream is uploaded once into the persistent
//!   vertex buffer with a cycling copy, then one render pass per target is opened.
//!   A `clear` ends the current pass, and the next draw opens a pass that clears the
//!   target, as SDL's `SDL_RENDERCMD_CLEAR` does.
//! - Flushing happens on `present`, `read_pixels`, target changes, and anything that
//!   touches texture storage (uploads, reads, destruction), so GPU order matches
//!   call order.
//! - `present` flushes, blits the backbuffer into the claimed window's swapchain
//!   texture (linear filter), submits, and recreates the backbuffer when the
//!   swapchain size changed. Without a window the frame is only submitted.
//!
//! Coordinates: render coordinates are multiplied by the render scale times the
//! logical scale (`layout.zig`) and offset by the viewport, which is set as the
//! GPU viewport. Vertices stay floating point; SDL's vertex shaders map viewport
//! pixels to clip space. Viewport and scissor are integer rectangles; the scissor
//! is the viewport intersected with the clip rectangle and the output.
//!
//! Color: the color scale (`set_color_scale`) times the SDR white level of the
//! target or window multiplies the output in the fragment shader, as SDL does.
//! When the output is linear (scRGB) or HDR10, vertex colors are converted from
//! sRGB to linear light (and to BT.2020 for HDR10) on the CPU, and textures whose
//! headroom exceeds the output's are tone mapped in the advanced shader. The
//! swapchain composition follows the output colorspace (`color.zig`).
//!
//! Textures: RGBA8/BGRA8, eight-bit palette indices, and planar or semi-planar
//! YCbCr (IYUV, YV12, NV12, NV21, P010), all with SDL's shader classes. Each draw
//! binds the planes its shader class reads.
//!
//! Cycling (SDL's `cycle` flags): the vertex buffer is cycled on each upload, and
//! the transfer staging buffer is mapped with cycle so an upload never waits for a
//! copy the GPU still reads. Texture planes are written without cycling, as SDL
//! writes them: a cycled texture would lose the contents a partial update keeps.
//!
//! Deliberate differences from SDL and from `render/renderer.zig`:
//! - Points and lines are offset by half a pixel (SDL's GPU backend does this for
//!   points) and are not truncated; the CPU renderer truncates instead.
//! - `read_pixels` returns `rgba8` surfaces; BGRA targets are swizzled on readback.
//! - `set_vsync` is fallible: changing the present mode recreates the swapchain.
//! - Renderer textures retain UNORM storage because their colorspace is mutable.
//!   Explicit sRGB/scRGB/HDR10 conversion uses SDL's advanced shader; unspecified
//!   encoding leaves conversion to the sampler, which is UNORM here. Automatic
//!   sRGB texel decoding needs colorspace-aware image views and remains pending.
//!   Custom fragment shaders and shared per-texture palettes are not ported.
//! - A palette belongs to one texture (`set_palette`); SDL shares palette objects.
//! - Textures are heap-allocated by this renderer. Textures and the renderer must
//!   not move while commands referring to them are pending, which the heap
//!   allocation guarantees.
//!
//! Ownership: `GpuRenderer` is created with `create_offscreen` or `create_for_window`
//! and released with `destroy`. It borrows the `device.Device`, which must outlive
//! it. Textures are created through the renderer and destroyed through it.
const std = @import("std");
const types = @import("../../gpu/types.zig");
const device = @import("../../gpu/vulkan/device.zig");
const pass = @import("../../gpu/vulkan/pass.zig");
const gpu_window = @import("../../gpu/vulkan/window.zig");
const surface = @import("../../video/surface.zig");
const pixels = @import("../../video/pixels.zig");
const geometry = @import("../../video/geometry.zig");
const software = @import("../software.zig");
const cpu = @import("../renderer.zig");
const layout_mod = @import("layout.zig");
const shaders = @import("shaders.zig");
const pipeline_cache = @import("pipeline_cache.zig");
const texture_mod = @import("texture.zig");
const color = @import("color.zig");

/// A render-coordinate point.
pub const FPoint = geometry.Point(f32);
/// A render-coordinate rectangle (boundaries included).
pub const FRect = geometry.Rect(f32);
/// An output-pixel rectangle (right and bottom edges excluded).
pub const IRect = geometry.Rect(i32);
/// Blend equations; see `surface.Blend`.
pub const Blend = surface.Blend;
/// Byte color with straight alpha.
pub const Color = pixels.Color;
/// Mirroring applied before rotation.
pub const Flip = cpu.Flip;
/// Logical presentation modes, shared with the CPU renderer.
pub const LogicalPresentation = cpu.LogicalPresentation;
/// Logical size and presentation mode.
pub const Logical = cpu.Logical;
/// Per-view state: viewport, clip, scale and logical presentation.
pub const ViewState = cpu.ViewState;
/// Textured or untextured vertex with color and texture coordinates.
pub const Vertex = software.Vertex;
/// Texture access modes, scale modes and the texture type.
pub const Texture = texture_mod.Texture;
/// Access mode of a texture (`static`, `streaming` or `target`).
pub const Access = texture_mod.Access;
/// Planar YCbCr layouts for `create_yuv_texture`.
pub const YuvLayout = texture_mod.YuvLayout;
/// YCbCr colorspace (matrix and range) of planar textures.
pub const YuvColorspace = color.YuvColorspace;
/// Colorspace of the output; selects the swapchain composition.
pub const OutputColorspace = color.Output;
/// Encoding of a texture's RGB samples.
pub const TextureColorspace = color.Input;

/// Errors of the GPU renderer: device and allocation failures plus argument checks.
pub const Error = device.Error || std.mem.Allocator.Error || geometry.GeometryError || surface.Error || texture_mod.Error || error{
    /// A coordinate, scale, size or logical size was NaN, infinite, zero or negative where forbidden.
    InvalidArgument,
    /// `set_target` was given a texture that was not created with `Access.target`.
    NotTarget,
    /// A region passed to a read or copy was empty or outside the output.
    InvalidRect,
    /// Tile scale must be positive (SDL: "scale <= 0").
    InvalidTileScale,
    /// A vertex index referred past the end of the vertex list.
    InvalidIndex,
    /// A count or byte size does not fit the device's 32-bit limits.
    Overflow,
};

/// Samplers are indexed by scale (nearest or linear), then address U, then address V.
const sampler_count = 8;

/// Smallest staging and vertex allocation, as SDL's initial 64 KiB vertex buffer.
const min_buffer_size: u32 = 1 << 16;

/// Address policy used by draws that do not ask for another one.
const clamp_address: [2]software.Address = .{ .clamp, .clamp };

/// Where one draw samples from and how it is drawn. Equal states merge.
const DrawState = struct {
    primitive: types.PrimitiveType,
    texture: ?*const Texture,
    blend: Blend,
    scale: surface.ScaleMode,
    address: [2]software.Address,
    viewport: IRect,
    scissor: IRect,
    /// Color scale multiplied into the output (SDL's `cmd->data.draw.color_scale`).
    color_scale: f32,
};

/// A recorded draw: its state and a range of the vertex stream.
const Draw = struct {
    state: DrawState,
    /// Byte offset of the first vertex in the frame's vertex stream.
    first: usize,
    /// Number of vertices.
    count: u32,
};

/// One queued render command.
const Command = union(enum) {
    /// Clears the target before the next draw, as SDL's `SDL_RENDERCMD_CLEAR`.
    /// The color is already in output space and scaled by the color scale.
    clear: types.FColor,
    draw: Draw,
};

/// The rectangles of one draw: viewport-scaled layout and the scissor.
const Frame = struct {
    layout: layout_mod.Layout,
    scissor: IRect,
};

/// Window whose swapchain receives the backbuffer on `present`.
const WindowTarget = struct {
    surface: u64,
    size: gpu_window.WindowSizeFn,
    options: device.SwapchainOptions,
};

/// Pixels read back from a texture region or from the output.
pub const Locked = struct {
    /// Writable pixels starting at the locked region's top-left texel.
    pixels: []u8,
    /// Bytes between rows of `pixels`.
    pitch: usize,
};

/// One plane of an upload: `rect` of `texture` taken from `source`, whose rows are `pitch` bytes apart.
const PlaneUpload = struct {
    texture: *device.Texture,
    rect: IRect,
    texel_bytes: u32,
    source: []const u8,
    pitch: usize,
};

/// Renderer over a zdl.gpu device. See the module documentation for the frame model.
pub const GpuRenderer = struct {
    allocator: std.mem.Allocator,
    /// Borrowed device; outlives the renderer.
    dev: *device.Device,
    programs: shaders.Shaders,
    pipelines: pipeline_cache.Cache,
    samplers: [sampler_count]?device.Sampler,
    /// Output of draws when no target is set; blitted to the swapchain on `present`.
    backbuffer: device.Texture,
    window: ?WindowTarget,
    /// Colorspace of the output, which selects the swapchain composition.
    output: color.Output,
    /// Persistent vertex buffer, cycled on each upload (SDL's `vertices.buffer`).
    vertex_buffer: ?device.Buffer = null,
    vertex_capacity: u32 = 0,
    /// Persistent upload staging buffer, mapped with cycling (SDL's `vertices.transfer_buf`).
    staging: ?device.TransferBuffer = null,
    staging_capacity: u32 = 0,
    /// Command buffer of the frame being recorded, acquired on demand.
    command_buffer: ?device.CommandBuffer = null,
    commands: std.ArrayList(Command) = .empty,
    /// Vertex stream of the pending commands: 24-byte line vertices or 32-byte
    /// triangle vertices, as `pipeline_cache.vertex_stride` gives.
    vertices: std.ArrayList(u8) = .empty,
    /// Draw color as float RGBA in [0, 1].
    draw_rgba: [4]f32 = .{ 0, 0, 0, 1 },
    /// Blend for points, lines, rectangles and untextured geometry.
    blend: Blend = Blend.REPLACE,
    /// Color scale set by the application (SDL's `desired_color_scale`).
    desired_color_scale: f32 = 1.0,
    /// SDR white level and HDR headroom of the window. Both are 1 unless the output
    /// is linear or HDR10 (SDL's `UpdateHDRProperties`).
    sdr_white_point: f32 = 1.0,
    hdr_headroom: f32 = 1.0,
    /// View state of the output.
    main_view: ViewState = .{},
    /// View state of the active target; reset whenever a target becomes current.
    target_view: ViewState = .{},
    /// Active render target; null draws to the backbuffer.
    target: ?*Texture = null,

    /// Creates a renderer over an offscreen backbuffer of `width` by `height`
    /// pixels in `format` (a color-target format). Presenting only submits the frame.
    pub fn create_offscreen(allocator: std.mem.Allocator, dev: *device.Device, width: u31, height: u31, format: types.TextureFormat) Error!*GpuRenderer {
        if (width == 0 or height == 0) return error.InvalidArgument;
        return allocate(allocator, dev, format, width, height, null, .srgb);
    }

    /// Creates a renderer that presents to `surface_handle` (a `VkSurfaceKHR`).
    /// Claims the window for `dev` with the swapchain options and the size
    /// callback; `destroy` releases the claim. The backbuffer takes the swapchain
    /// format, and the output colorspace follows the composition in `options`
    /// (SDR: sRGB, extended linear: scRGB, HDR10: HDR10).
    pub fn create_for_window(allocator: std.mem.Allocator, dev: *device.Device, surface_handle: u64, options: device.SwapchainOptions, size: gpu_window.WindowSizeFn) Error!*GpuRenderer {
        try gpu_window.claim_window(dev, surface_handle, options, size);
        errdefer gpu_window.unclaim_window(dev, surface_handle);
        const format = try gpu_window.get_swapchain_texture_format(dev, surface_handle);
        const extent = size();
        return allocate(allocator, dev, format, extent.width, extent.height, .{
            .surface = surface_handle,
            .size = size,
            .options = options,
        }, color.output_for_composition(options.composition));
    }

    /// Releases pending commands, pipelines, samplers, shaders, buffers and the
    /// backbuffer, and releases the window claim. Device resources retire once the GPU is done with them.
    pub fn destroy(self: *GpuRenderer) void {
        if (self.command_buffer) |*cb| {
            // Teardown has no caller to report to. abort only fails when a swapchain
            // acquired in this buffer was never submitted, which `present` rules out.
            cb.abort() catch {};
        }
        self.command_buffer = null;
        self.commands.deinit(self.allocator);
        self.vertices.deinit(self.allocator);
        if (self.vertex_buffer) |*buffer| buffer.deinit();
        if (self.staging) |*transfer| transfer.deinit();
        for (&self.samplers) |*slot| {
            if (slot.*) |*entry| entry.deinit();
        }
        self.pipelines.deinit();
        self.programs.deinit();
        self.backbuffer.deinit();
        if (self.window) |target| gpu_window.unclaim_window(self.dev, target.surface);
        const allocator = self.allocator;
        allocator.destroy(self);
    }

    // -----------------------------------------------------------------------
    // State
    // -----------------------------------------------------------------------

    /// Sets the draw color from eight-bit components.
    pub fn set_draw_color(self: *GpuRenderer, value: Color) void {
        self.draw_rgba = color_floats(value);
    }

    /// Sets the draw color from float components; values are clamped to [0, 1].
    pub fn set_draw_color_float(self: *GpuRenderer, red: f32, green: f32, blue: f32, alpha: f32) Error!void {
        if (!std.math.isFinite(red) or !std.math.isFinite(green) or !std.math.isFinite(blue) or !std.math.isFinite(alpha)) return error.InvalidArgument;
        self.draw_rgba = .{ clamp_unit(red), clamp_unit(green), clamp_unit(blue), clamp_unit(alpha) };
    }

    /// Current draw color rounded to eight bits.
    pub fn draw_color(self: *const GpuRenderer) Color {
        return .{
            .r = to_byte(self.draw_rgba[0]),
            .g = to_byte(self.draw_rgba[1]),
            .b = to_byte(self.draw_rgba[2]),
            .a = to_byte(self.draw_rgba[3]),
        };
    }

    /// Current draw color as float components.
    pub fn draw_color_float(self: *const GpuRenderer) [4]f32 {
        return self.draw_rgba;
    }

    /// Sets the color scale (SDL_SetRenderColorScale). The effective scale is this
    /// value times the SDR white level of the target or window, as SDL computes it.
    pub fn set_color_scale(self: *GpuRenderer, scale: f32) Error!void {
        if (!std.math.isFinite(scale) or scale < 0) return error.InvalidArgument;
        self.desired_color_scale = scale;
    }

    /// The color scale the application set (SDL_GetRenderColorScale), without the white level.
    pub fn color_scale(self: *const GpuRenderer) f32 {
        return self.desired_color_scale;
    }

    /// Colorspace of the output (SDL_PROP_RENDERER_OUTPUT_COLORSPACE).
    pub fn output_colorspace(self: *const GpuRenderer) OutputColorspace {
        return self.output;
    }

    /// Sets the window's SDR white level and HDR headroom (SDL_PROP_WINDOW_SDR_WHITE_LEVEL_FLOAT
    /// and SDL_PROP_WINDOW_HDR_HEADROOM_FLOAT). They apply only to linear and HDR10
    /// outputs; SDR output keeps both at one, as SDL does.
    pub fn set_hdr_properties(self: *GpuRenderer, sdr_white_point: f32, hdr_headroom: f32) Error!void {
        if (!std.math.isFinite(sdr_white_point) or !std.math.isFinite(hdr_headroom) or sdr_white_point <= 0 or hdr_headroom <= 0) return error.InvalidArgument;
        if (color.is_linear(self.output)) {
            self.sdr_white_point = sdr_white_point;
            self.hdr_headroom = hdr_headroom;
        } else {
            self.sdr_white_point = 1.0;
            self.hdr_headroom = 1.0;
        }
    }

    /// Sets the blend used by primitives and untextured geometry.
    pub fn set_blend(self: *GpuRenderer, blend: Blend) void {
        self.blend = blend;
    }

    /// Sets the viewport in render coordinates, or null for the full output.
    pub fn set_viewport(self: *GpuRenderer, rect: ?FRect) Error!void {
        if (rect) |requested| try requested.validate();
        self.state_ptr().viewport = rect;
    }

    /// Current viewport in render coordinates.
    pub fn viewport_rect(self: *const GpuRenderer) ?FRect {
        return self.current_state().viewport;
    }

    /// Sets the clip rectangle, relative to the viewport origin, or null to disable.
    pub fn set_clip(self: *GpuRenderer, rect: ?FRect) Error!void {
        if (rect) |requested| try requested.validate();
        self.state_ptr().clip = rect;
    }

    /// Current clip rectangle relative to the viewport.
    pub fn clip_region(self: *const GpuRenderer) ?FRect {
        return self.current_state().clip;
    }

    /// Sets the render scale applied to all coordinates. Scales must be finite and non-negative.
    pub fn set_scale(self: *GpuRenderer, scale_x: f32, scale_y: f32) Error!void {
        if (!std.math.isFinite(scale_x) or !std.math.isFinite(scale_y) or scale_x < 0 or scale_y < 0) return error.InvalidArgument;
        self.state_ptr().scale = .{ scale_x, scale_y };
    }

    /// Current render scale.
    pub fn render_scale(self: *const GpuRenderer) [2]f32 {
        return self.current_state().scale;
    }

    /// Sets logical presentation. A null value, or mode `disabled`, uses output pixels.
    pub fn set_logical_presentation(self: *GpuRenderer, logical: ?Logical) Error!void {
        if (logical) |requested| {
            if (!std.math.isFinite(requested.width) or !std.math.isFinite(requested.height) or requested.width < 0 or requested.height < 0) return error.InvalidArgument;
        }
        self.state_ptr().logical = logical;
    }

    /// Makes `next` the render target, or restores the backbuffer when null. Pending
    /// commands for the previous target are run first. The new target's view state
    /// starts from defaults.
    pub fn set_target(self: *GpuRenderer, next: ?*Texture) Error!void {
        if (next) |requested| {
            if (requested.access != .target) return error.NotTarget;
        }
        if (next != self.target) try self.flush();
        self.target = next;
        self.target_view = .{};
    }

    /// Currently active render target, or null when drawing to the backbuffer.
    pub fn render_target(self: *const GpuRenderer) ?*Texture {
        return self.target;
    }

    /// Sets the present mode of the window: vsync when enabled; otherwise mailbox,
    /// immediate, or vsync when neither is supported (SDL's `ChoosePresentMode`).
    /// Changing the mode recreates the swapchain after the pending frame is submitted.
    /// Offscreen renderers ignore it.
    pub fn set_vsync(self: *GpuRenderer, enabled: bool) Error!void {
        if (self.window == null) return;
        var target = self.window.?;
        const mode = try self.present_mode_for(target.surface, enabled);
        if (mode == target.options.present_mode) return;
        try self.flush();
        try self.submit();
        gpu_window.unclaim_window(self.dev, target.surface);
        self.window = null;
        target.options.present_mode = mode;
        try gpu_window.claim_window(self.dev, target.surface, target.options, target.size);
        self.window = target;
    }

    // -----------------------------------------------------------------------
    // Drawing
    // -----------------------------------------------------------------------

    /// Clears the active target to the draw color. Like SDL_RenderClear, the clear
    /// covers the whole target, ignoring viewport and clip. The color is converted
    /// to the output space and scaled by the color scale, as SDL does.
    pub fn clear(self: *GpuRenderer) Error!void {
        var rgba = self.output_color(self.draw_rgba);
        const scale = self.effective_color_scale();
        rgba[0] *= scale;
        rgba[1] *= scale;
        rgba[2] *= scale;
        try self.commands.append(self.allocator, .{ .clear = .{
            .r = rgba[0],
            .g = rgba[1],
            .b = rgba[2],
            .a = rgba[3],
        } });
    }

    /// Draws one point.
    pub fn draw_point(self: *GpuRenderer, point: FPoint) Error!void {
        try self.draw_points(&.{point});
    }

    /// Draws points as one-pixel point primitives at their scaled positions.
    pub fn draw_points(self: *GpuRenderer, points: []const FPoint) Error!void {
        if (points.len == 0) return;
        const frame_value = (try self.draw_frame()) orelse return;
        const cs = frame_value.layout.current_scale;
        const first = self.vertices.items.len;
        const rgba = self.output_color(self.draw_rgba);
        for (points) |point| try self.put_line_vertex(point.x * cs[0] + 0.5, point.y * cs[1] + 0.5, rgba);
        try self.record(frame_value, .point_list, null, self.blend, .nearest, clamp_address, first, try count_of(points.len));
    }

    /// Draws one line segment.
    pub fn draw_line(self: *GpuRenderer, start: FPoint, end: FPoint) Error!void {
        try self.draw_lines(&.{ start, end });
    }

    /// Draws connected segments through `points`. Two points form a line list;
    /// more form one line strip, as SDL's DRAW_LINES does.
    pub fn draw_lines(self: *GpuRenderer, points: []const FPoint) Error!void {
        if (points.len < 2) return;
        const frame_value = (try self.draw_frame()) orelse return;
        const first = self.vertices.items.len;
        try self.emit_line_strip(frame_value, points, first);
    }

    /// Draws the outline of `rect`. The inclusive corners are `(x, y)` and
    /// `(x + w - 1, y + h - 1)` in render coordinates, matching SDL_RenderRect.
    pub fn draw_rect(self: *GpuRenderer, rect: FRect) Error!void {
        try self.draw_rects(&.{rect});
    }

    /// Draws outlines of several rectangles, one closed line strip each.
    pub fn draw_rects(self: *GpuRenderer, rects: []const FRect) Error!void {
        if (rects.len == 0) return;
        const frame_value = (try self.draw_frame()) orelse return;
        for (rects) |rect| {
            const corners = outline_corners(rect);
            const first = self.vertices.items.len;
            try self.emit_line_strip(frame_value, &corners, first);
        }
    }

    /// Fills one rectangle with the draw color and renderer blend.
    pub fn fill_rect(self: *GpuRenderer, rect: FRect) Error!void {
        try self.fill_rects(&.{rect});
    }

    /// Fills several rectangles as triangle pairs in one batch.
    pub fn fill_rects(self: *GpuRenderer, rects: []const FRect) Error!void {
        if (rects.len == 0) return;
        const frame_value = (try self.draw_frame()) orelse return;
        const first = self.vertices.items.len;
        const rgba = self.output_color(self.draw_rgba);
        for (rects) |rect| {
            const corners = [4]FPoint{
                .{ .x = rect.x, .y = rect.y },
                .{ .x = rect.x + rect.width, .y = rect.y },
                .{ .x = rect.x + rect.width, .y = rect.y + rect.height },
                .{ .x = rect.x, .y = rect.y + rect.height },
            };
            try self.emit_quad(frame_value, corners, zero_uv, rgba);
        }
        try self.record(frame_value, .triangle_list, null, self.blend, .nearest, clamp_address, first, try count_of(rects.len * 6));
    }

    /// Copies `source` (texture pixels, default: all) into `destination` (render
    /// coordinates, default: the viewport), using the texture's blend, color/alpha
    /// modulation and scale mode. The source is clipped to the texture; the
    /// destination is not, as in SDL_RenderTexture.
    pub fn copy(self: *GpuRenderer, tex: *Texture, source: ?FRect, destination: ?FRect) Error!void {
        const frame_value = (try self.draw_frame()) orelse return;
        const src = (try resolve_source(tex, source)) orelse return;
        const dst = destination orelse default_destination(frame_value.layout);
        try self.emit_textured(frame_value, tex, src, rect_corners(dst), .{});
    }

    /// Copies `source` rotated clockwise by `angle_degrees` around `center`
    /// (relative to the destination origin; default: the destination center),
    /// optionally mirrored before rotation. Plain copies are used when the angle
    /// is a multiple of 360 and nothing is flipped.
    pub fn copy_ex(self: *GpuRenderer, tex: *Texture, source: ?FRect, destination: ?FRect, angle_degrees: f64, center: ?FPoint, flip: Flip) Error!void {
        if (!flip.horizontal and !flip.vertical and @mod(angle_degrees, 360.0) == 0) {
            return self.copy(tex, source, destination);
        }
        const frame_value = (try self.draw_frame()) orelse return;
        const src = (try resolve_source(tex, source)) orelse return;
        const dst = destination orelse default_destination(frame_value.layout);
        const pivot: FPoint = if (center) |c| .{ .x = dst.x + c.x, .y = dst.y + c.y } else .{ .x = dst.x + dst.width / 2, .y = dst.y + dst.height / 2 };
        const radians = angle_degrees * std.math.pi / 180.0;
        const cos_a: f32 = @floatCast(@cos(radians));
        const sin_a: f32 = @floatCast(@sin(radians));
        const raw = rect_corners(dst);
        var corners: [4]FPoint = undefined;
        for (raw, 0..) |point, index| {
            const dx = point.x - pivot.x;
            const dy = point.y - pivot.y;
            corners[index] = .{
                .x = pivot.x + dx * cos_a - dy * sin_a,
                .y = pivot.y + dx * sin_a + dy * cos_a,
            };
        }
        try self.emit_textured(frame_value, tex, src, corners, flip);
    }

    /// Repeats `source` across `destination` in tiles of `source size * scale`,
    /// with clipped partial tiles on the right and bottom edges (SDL's iterated tiling).
    pub fn copy_tiled(self: *GpuRenderer, tex: *Texture, source: ?FRect, tile_scale: f32, destination: ?FRect) Error!void {
        if (!(tile_scale > 0)) return error.InvalidTileScale;
        const src = (try resolve_source(tex, source)) orelse return;
        const dst = destination orelse try self.default_destination_rect();

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

    /// Draws `source` as a nine-slice: corners keep their (scaled) sizes while
    /// edges and the center stretch. Widths are in source pixels and are ceiled
    /// after scaling, as SDL_RenderTexture9Grid does.
    pub fn copy_9grid(self: *GpuRenderer, tex: *Texture, source: ?FRect, left_width: f32, right_width: f32, top_height: f32, bottom_height: f32, grid_scale: f32, destination: ?FRect) Error!void {
        const full: FRect = .{ .x = 0, .y = 0, .width = @floatFromInt(tex.width()), .height = @floatFromInt(tex.height()) };
        const src = source orelse full;
        const dst = destination orelse try self.default_destination_rect();

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

    /// Draws triangles with per-vertex color and texture coordinates, with
    /// clamped texture addressing. Positions are render coordinates. With a
    /// texture, its color/alpha modulation scales the vertex colors and its
    /// blend is used; without one, vertex colors are used as given.
    pub fn render_geometry(self: *GpuRenderer, tex: ?*Texture, vertices: []const Vertex, indices: ?[]const u32) Error!void {
        return self.render_geometry_addressed(tex, vertices, indices, clamp_address);
    }

    /// Like `render_geometry`, with explicit U and V addressing for the texture
    /// (`software.Address.repeat` wraps texture coordinates).
    pub fn render_geometry_addressed(self: *GpuRenderer, tex: ?*Texture, vertices: []const Vertex, indices: ?[]const u32, address: [2]software.Address) Error!void {
        const count = if (indices) |list| list.len else vertices.len;
        if (count == 0) return;
        if (indices) |list| {
            for (list) |index| {
                if (index >= vertices.len) return error.InvalidIndex;
            }
        }
        const frame_value = (try self.draw_frame()) orelse return;
        const cs = frame_value.layout.current_scale;
        const tint: [4]f32 = if (tex) |texture| self.output_color(texture_tint(texture)) else .{ 1, 1, 1, 1 };
        const first = self.vertices.items.len;
        for (0..count) |position| {
            const vertex = vertices[if (indices) |list| list[position] else position];
            const vertex_color = self.output_color(color_floats(vertex.color));
            try self.put_triangle_vertex(
                vertex.position.x * cs[0],
                vertex.position.y * cs[1],
                .{ vertex_color[0] * tint[0], vertex_color[1] * tint[1], vertex_color[2] * tint[2], vertex_color[3] * tint[3] },
                .{ vertex.uv.x, vertex.uv.y },
            );
        }
        const texture_ptr: ?*const Texture = if (tex) |texture| texture else null;
        const blend = if (tex) |texture| texture.blend else self.blend;
        const scale: surface.ScaleMode = if (tex) |texture| texture.scale_mode else .nearest;
        try self.record(frame_value, .triangle_list, texture_ptr, blend, scale, address, first, try count_of(count));
    }

    /// Copies the pixels of the active target (or the backbuffer) into a new
    /// `rgba8` surface. `region` is in output pixels; null reads the whole output.
    /// Pending commands run first, and the call waits for the GPU. The caller owns the result.
    pub fn read_pixels(self: *GpuRenderer, region: ?IRect) Error!surface.Surface {
        try self.flush();
        const extent = self.output_extent();
        const full: IRect = .{ .x = 0, .y = 0, .width = try count_i32(extent[0]), .height = try count_i32(extent[1]) };
        const selected = if (region) |requested| (try full.intersection(requested)) orelse return error.InvalidRect else full;
        if (selected.is_empty()) return error.InvalidRect;
        const width: u32 = @intCast(selected.width);
        const height: u32 = @intCast(selected.height);
        const row_bytes = @as(usize, width) * texture_mod.bytes_per_texel;
        const total = try count_of(row_bytes * height);

        try self.ensure_command_buffer();
        const cb = &self.command_buffer.?;
        var staging = try self.dev.create_transfer_buffer(.{ .usage = .download, .size = total });
        defer staging.deinit();
        try cb.download_texture(self.destination_texture(), .{
            .x = @intCast(selected.x),
            .y = @intCast(selected.y),
            .w = width,
            .h = height,
            .d = 1,
        }, &staging, .{ .pixels_per_row = width, .rows_per_layer = height });
        const fence = try cb.submit_with_fence();
        self.command_buffer = null;
        try self.dev.wait_fence(fence);

        const mapped = try staging.map();
        var result = try surface.Surface.init(self.allocator, @intCast(width), @intCast(height), .rgba8, null);
        errdefer result.deinit();
        const swap_red_blue = self.destination_format() == .b8g8r8a8_unorm;
        for (0..height) |y| {
            const source_row = mapped[y * row_bytes ..][0..row_bytes];
            const target_row = result.view.data[y * result.view.stride ..][0..row_bytes];
            if (swap_red_blue) {
                var x: usize = 0;
                while (x < row_bytes) : (x += texture_mod.bytes_per_texel) {
                    target_row[x] = source_row[x + 2];
                    target_row[x + 1] = source_row[x + 1];
                    target_row[x + 2] = source_row[x];
                    target_row[x + 3] = source_row[x + 3];
                }
            } else {
                @memcpy(target_row, source_row);
            }
        }
        return result;
    }

    /// Converts a window point (output pixels) into render coordinates.
    pub fn window_to_render(self: *const GpuRenderer, point: FPoint) Error!FPoint {
        return layout_mod.window_to_render(self.current_state(), try self.current_layout(), point);
    }

    /// Converts a render-coordinate point to window (output) pixels.
    pub fn render_to_window(self: *const GpuRenderer, point: FPoint) Error!FPoint {
        return layout_mod.render_to_window(self.current_state(), try self.current_layout(), point);
    }

    /// Runs the pending commands and presents: the backbuffer is blitted to the
    /// window's swapchain texture (when the window has one) and the frame is
    /// submitted. Then the backbuffer is recreated if the swapchain size changed.
    pub fn present(self: *GpuRenderer) Error!void {
        try self.flush();
        const target = self.window orelse {
            try self.submit();
            return;
        };
        try self.ensure_command_buffer();
        const cb = &self.command_buffer.?;
        const swapchain_texture = (try gpu_window.acquire_window_texture(cb, target.surface)) orelse {
            // Minimized windows have no drawable area; the frame is dropped.
            try self.submit();
            return;
        };
        const destination_width = swapchain_texture.width();
        const destination_height = swapchain_texture.height();
        const swap_format = swapchain_texture.info.format;
        try cb.blit_texture(.{
            .source = &self.backbuffer,
            .source_region = .{ .w = self.backbuffer.width(), .h = self.backbuffer.height() },
            .destination = swapchain_texture,
            .destination_region = .{ .w = destination_width, .h = destination_height },
            .filter = .linear,
        });
        try self.submit();
        if (self.backbuffer.width() != destination_width or self.backbuffer.height() != destination_height) {
            try self.replace_backbuffer(destination_width, destination_height, swap_format);
        }
    }

    // -----------------------------------------------------------------------
    // Textures
    // -----------------------------------------------------------------------

    /// Creates a texture of `width` by `height` pixels in an RGBA8 or BGRA8 layout,
    /// or eight-bit palette indices (`pixels.Format.indexed` with 8 bits; set the
    /// lookup with `set_palette`). Target textures can be drawn into; streaming
    /// textures keep a CPU shadow for `lock`. Destroy with `destroy_texture`.
    pub fn create_texture(self: *GpuRenderer, width: u31, height: u31, format: pixels.Format, access: Access) Error!*Texture {
        if (width == 0 or height == 0) return error.InvalidArgument;
        // Colorspace can change after creation. An sRGB image would always
        // decode, even when callers identify its samples as scRGB or HDR10.
        const texel_format = try texture_mod.gpu_format(format, false);
        const texel_bytes: u32 = if (texel_format == .r8_unorm) 1 else texture_mod.bytes_per_texel;
        const usage: types.TextureUsage = if (access == .target) .{ .sampler = true, .color_target = true } else .{ .sampler = true };
        var gpu = try self.dev.create_texture(.{ .format = texel_format, .usage = usage, .width = width, .height = height });
        errdefer gpu.deinit();
        const shadow: ?[]u8 = if (access == .streaming) try self.allocator.alloc(u8, try texture_mod.shadow_size(width, height, texel_bytes)) else null;
        errdefer if (shadow) |bytes| self.allocator.free(bytes);
        const created = try self.allocator.create(Texture);
        created.* = .{
            .gpu = gpu,
            .access = access,
            .format = .{ .pixels = format },
            .pixel_width = width,
            .pixel_height = height,
            .texel_bytes = texel_bytes,
            .shadow = shadow,
        };
        return created;
    }

    /// Creates a planar or semi-planar YCbCr texture (SDL's YUV texture formats).
    /// The chroma planes are half size, rounded up. `colorspace` selects the
    /// YCbCr matrix and range (SDL's default is BT.601 limited). P010 samples are
    /// always HDR10 input, as in SDL; the other layouts are sRGB input. Planar
    /// textures are static or streaming, cannot be targets, and have no CPU shadow,
    /// so `lock` does not apply.
    pub fn create_yuv_texture(self: *GpuRenderer, width: u31, height: u31, layout: YuvLayout, colorspace: YuvColorspace, access: Access) Error!*Texture {
        if (width == 0 or height == 0) return error.InvalidArgument;
        if (access == .target) return error.WrongAccess;
        const formats = texture_mod.yuv_formats(layout);
        var luma = try self.dev.create_texture(.{ .format = formats[0], .usage = .{ .sampler = true }, .width = width, .height = height });
        errdefer luma.deinit();
        const chroma_width: u32 = (@as(u32, width) + 1) / 2;
        const chroma_height: u32 = (@as(u32, height) + 1) / 2;
        var chroma_u = try self.dev.create_texture(.{ .format = formats[1], .usage = .{ .sampler = true }, .width = chroma_width, .height = chroma_height });
        errdefer chroma_u.deinit();
        var chroma_v: ?device.Texture = null;
        errdefer if (chroma_v) |*plane| plane.deinit();
        if (!layout.semi_planar()) {
            chroma_v = try self.dev.create_texture(.{ .format = formats[1], .usage = .{ .sampler = true }, .width = chroma_width, .height = chroma_height });
        }
        const created = try self.allocator.create(Texture);
        errdefer self.allocator.destroy(created);
        created.* = .{
            .gpu = luma,
            .chroma_u = chroma_u,
            .chroma_v = chroma_v,
            .access = access,
            .format = .{ .yuv = layout },
            .pixel_width = width,
            .pixel_height = height,
            .texel_bytes = layout.luma_bytes(),
            .ycbcr = color.ycbcr_matrix(colorspace, height, layout.bits()),
            .colorspace = if (layout == .p010) .hdr10 else .srgb,
        };
        return created;
    }

    /// Sets the palette of an indexed texture: up to 256 colors, looked up by its
    /// eight-bit indices (SDL_SetTexturePalette). Entries past `colors.len` are left
    /// as they were. Pending commands run first.
    pub fn set_palette(self: *GpuRenderer, tex: *Texture, colors: []const Color) Error!void {
        if (!tex.is_indexed()) return error.WrongFormat;
        if (colors.len == 0 or colors.len > texture_mod.palette_entries) return error.InvalidArgument;
        if (tex.palette == null) {
            tex.palette = try self.dev.create_texture(.{
                .format = .r8g8b8a8_unorm,
                .usage = .{ .sampler = true },
                .width = texture_mod.palette_entries,
                .height = 1,
            });
        }
        var bytes: [texture_mod.palette_entries * texture_mod.bytes_per_texel]u8 = undefined;
        for (colors, 0..) |entry, index| {
            bytes[index * 4 + 0] = entry.r;
            bytes[index * 4 + 1] = entry.g;
            bytes[index * 4 + 2] = entry.b;
            bytes[index * 4 + 3] = entry.a;
        }
        try self.flush();
        try self.upload_planes(&.{.{
            .texture = &tex.palette.?,
            .rect = .{ .x = 0, .y = 0, .width = @intCast(colors.len), .height = 1 },
            .texel_bytes = texture_mod.bytes_per_texel,
            .source = bytes[0 .. colors.len * texture_mod.bytes_per_texel],
            .pitch = colors.len * texture_mod.bytes_per_texel,
        }});
    }

    /// Destroys a texture created by this renderer. Pending commands run first, and
    /// the texture is unbound as the render target if it was the active one.
    pub fn destroy_texture(self: *GpuRenderer, tex: *Texture) Error!void {
        if (self.target == tex) try self.set_target(null);
        try self.flush();
        tex.release(self.allocator);
        self.allocator.destroy(tex);
    }

    /// Uploads `source` into `region` (default: the whole texture) of a static or
    /// streaming texture. `source` holds rows `pitch` bytes apart, one layout texel
    /// (`texel_bytes`) per pixel: four for RGBA/BGRA, one for palette indices.
    /// Pending commands run first. Planar textures use `update_yuv` or `update_nv`.
    pub fn update(self: *GpuRenderer, tex: *Texture, region: ?IRect, source: []const u8, pitch: usize) Error!void {
        if (tex.access == .target) return error.WrongAccess;
        if (tex.is_yuv()) return error.WrongFormat;
        const rect = try checked_rect(tex, region);
        const row_bytes = @as(usize, @intCast(rect.width)) * tex.texel_bytes;
        const rows: usize = @intCast(rect.height);
        if (pitch < row_bytes or source.len < (rows - 1) * pitch + row_bytes) return error.InvalidRect;
        try self.flush();
        try self.upload_planes(&.{.{
            .texture = &tex.gpu,
            .rect = rect,
            .texel_bytes = tex.texel_bytes,
            .source = source,
            .pitch = pitch,
        }});
    }

    /// Uploads planar IYUV or YV12 data (`Y`, `U` and `V` planes) into `region` of
    /// `tex`, in luma coordinates; chroma covers the matching half-size area
    /// (SDL_UpdateYUVTexture). Each plane has its own pitch in bytes.
    pub fn update_yuv(self: *GpuRenderer, tex: *Texture, region: ?IRect, y: []const u8, y_pitch: usize, u: []const u8, u_pitch: usize, v: []const u8, v_pitch: usize) Error!void {
        if (tex.access == .target) return error.WrongAccess;
        const layout = switch (tex.format) {
            .yuv => |value| value,
            .pixels => return error.WrongFormat,
        };
        if (layout.semi_planar()) return error.WrongFormat;
        const rect = try checked_rect(tex, region);
        const chroma = chroma_rect(rect);
        try self.flush();
        try self.upload_planes(&.{
            plane_upload(&tex.gpu, rect, layout.luma_bytes(), y, y_pitch) catch return error.InvalidRect,
            plane_upload(&tex.chroma_u.?, chroma, layout.chroma_bytes(), u, u_pitch) catch return error.InvalidRect,
            plane_upload(&tex.chroma_v.?, chroma, layout.chroma_bytes(), v, v_pitch) catch return error.InvalidRect,
        });
    }

    /// Uploads semi-planar NV12, NV21 or P010 data: luma `y` and interleaved
    /// chroma `uv` (SDL_UpdateNVTexture). Chroma covers the half-size area.
    pub fn update_nv(self: *GpuRenderer, tex: *Texture, region: ?IRect, y: []const u8, y_pitch: usize, uv: []const u8, uv_pitch: usize) Error!void {
        if (tex.access == .target) return error.WrongAccess;
        const layout = switch (tex.format) {
            .yuv => |value| value,
            .pixels => return error.WrongFormat,
        };
        if (!layout.semi_planar()) return error.WrongFormat;
        const rect = try checked_rect(tex, region);
        const chroma = chroma_rect(rect);
        try self.flush();
        try self.upload_planes(&.{
            plane_upload(&tex.gpu, rect, layout.luma_bytes(), y, y_pitch) catch return error.InvalidRect,
            plane_upload(&tex.chroma_u.?, chroma, layout.chroma_bytes(), uv, uv_pitch) catch return error.InvalidRect,
        });
    }

    /// Returns writable pixels of a streaming texture's region. `unlock` uploads them.
    /// Planar textures have no CPU shadow and are rejected with `WrongFormat`.
    pub fn lock(self: *GpuRenderer, tex: *Texture, region: ?IRect) Error!Locked {
        _ = self;
        if (tex.access != .streaming) return error.WrongAccess;
        if (tex.is_yuv()) return error.WrongFormat;
        if (tex.locked != null) return error.AlreadyLocked;
        const rect = try checked_rect(tex, region);
        const shadow = tex.shadow orelse return error.WrongAccess;
        const pitch = @as(usize, tex.width()) * tex.texel_bytes;
        tex.locked = rect;
        return .{ .pixels = shadow[shadow_offset(rect, pitch, tex.texel_bytes)..], .pitch = pitch };
    }

    /// Uploads the region returned by the last `lock` of `tex`.
    pub fn unlock(self: *GpuRenderer, tex: *Texture) Error!void {
        const rect = tex.locked orelse return error.NotLocked;
        tex.locked = null;
        const shadow = tex.shadow orelse return error.WrongAccess;
        const pitch = @as(usize, tex.width()) * tex.texel_bytes;
        try self.flush();
        try self.upload_planes(&.{.{
            .texture = &tex.gpu,
            .rect = rect,
            .texel_bytes = tex.texel_bytes,
            .source = shadow[shadow_offset(rect, pitch, tex.texel_bytes)..],
            .pitch = pitch,
        }});
    }

    // -----------------------------------------------------------------------
    // Internal: state and layout
    // -----------------------------------------------------------------------

    fn current_state(self: *const GpuRenderer) ViewState {
        return if (self.target != null) self.target_view else self.main_view;
    }

    fn state_ptr(self: *GpuRenderer) *ViewState {
        return if (self.target != null) &self.target_view else &self.main_view;
    }

    /// Pixel extent of the active target, or of the backbuffer.
    fn output_extent(self: *const GpuRenderer) [2]u32 {
        if (self.target) |tex| return .{ tex.width(), tex.height() };
        return .{ self.backbuffer.width(), self.backbuffer.height() };
    }

    fn current_layout(self: *const GpuRenderer) Error!layout_mod.Layout {
        const extent = self.output_extent();
        return layout_mod.compute(self.current_state(), @floatFromInt(extent[0]), @floatFromInt(extent[1]));
    }

    /// Layout and scissor for a draw, or null when nothing can be visible.
    fn draw_frame(self: *const GpuRenderer) Error!?Frame {
        const layout = try self.current_layout();
        const extent = self.output_extent();
        const bounds: IRect = .{ .x = 0, .y = 0, .width = try count_i32(extent[0]), .height = try count_i32(extent[1]) };
        var scissor = (try bounds.intersection(layout.viewport)) orelse return null;
        if (layout.clip) |clip_rect| scissor = (try scissor.intersection(clip_rect)) orelse return null;
        if (scissor.is_empty()) return null;
        return .{ .layout = layout, .scissor = scissor };
    }

    fn default_destination_rect(self: *const GpuRenderer) Error!FRect {
        return default_destination(try self.current_layout());
    }

    fn destination_texture(self: *GpuRenderer) *device.Texture {
        if (self.target) |tex| return &tex.gpu;
        return &self.backbuffer;
    }

    fn destination_format(self: *const GpuRenderer) types.TextureFormat {
        if (self.target) |tex| return tex.gpu.info.format;
        return self.backbuffer.info.format;
    }

    fn present_mode_for(self: *const GpuRenderer, surface_handle: u64, vsync: bool) device.Error!types.PresentMode {
        if (vsync) return .vsync;
        for ([_]types.PresentMode{ .mailbox, .immediate }) |candidate| {
            if (try self.dev.supports_present_mode(surface_handle, candidate)) return candidate;
        }
        return .vsync;
    }

    /// The scale multiplied into output colors: the color scale times the SDR white
    /// level of the target (or of the window), as SDL's `UpdateColorScale`.
    fn effective_color_scale(self: *const GpuRenderer) f32 {
        const white = if (self.target) |tex| tex.sdr_white_point else self.sdr_white_point;
        return self.desired_color_scale * white;
    }

    /// Headroom of the active output: the target's or the window's (SDL's `CalculateAdvancedShaderConstants`).
    fn output_headroom(self: *const GpuRenderer) f32 {
        if (self.target) |tex| return tex.hdr_headroom;
        return self.hdr_headroom;
    }

    /// Converts a color to output space: sRGB to linear light for linear outputs,
    /// and additionally BT.709 to BT.2020 for HDR10 (SDL's `SDL_ConvertToLinear`).
    /// Alpha is unchanged. SDR output returns the color as given.
    fn output_color(self: *const GpuRenderer, rgba: [4]f32) [4]f32 {
        if (!color.is_linear(self.output)) return rgba;
        var rgb: [3]f32 = .{ color.srgb_to_linear(rgba[0]), color.srgb_to_linear(rgba[1]), color.srgb_to_linear(rgba[2]) };
        if (self.output == .hdr10) rgb = color.bt709_to_bt2020(rgb);
        return .{ rgb[0], rgb[1], rgb[2], rgba[3] };
    }

    // -----------------------------------------------------------------------
    // Internal: recording
    // -----------------------------------------------------------------------

    /// Appends a draw of `count` vertices starting at byte `first`, merging it
    /// into the previous command when the state matches and the vertices are contiguous.
    fn record(self: *GpuRenderer, frame_value: Frame, primitive: types.PrimitiveType, texture: ?*const Texture, blend: Blend, scale: surface.ScaleMode, address: [2]software.Address, first: usize, count: u32) Error!void {
        const state: DrawState = .{
            .primitive = primitive,
            .texture = texture,
            .blend = blend,
            .scale = scale,
            .address = address,
            .viewport = frame_value.layout.viewport,
            .scissor = frame_value.scissor,
            .color_scale = self.effective_color_scale(),
        };
        // Line strips are never merged: joining two strips would connect their ends.
        if (self.commands.items.len > 0 and primitive != .line_strip) {
            const last = &self.commands.items[self.commands.items.len - 1];
            switch (last.*) {
                .draw => |*previous| {
                    const stride = pipeline_cache.vertex_stride(previous.state.primitive);
                    if (std.meta.eql(previous.state, state) and previous.first + @as(usize, previous.count) * stride == first) {
                        previous.count += count;
                        return;
                    }
                },
                .clear => {},
            }
        }
        try self.commands.append(self.allocator, .{ .draw = .{ .state = state, .first = first, .count = count } });
    }

    /// Appends a point or line vertex: position and color.
    fn put_line_vertex(self: *GpuRenderer, x: f32, y: f32, rgba: [4]f32) Error!void {
        const data = [_]f32{ x, y, rgba[0], rgba[1], rgba[2], rgba[3] };
        try self.vertices.appendSlice(self.allocator, std.mem.sliceAsBytes(&data));
    }

    /// Appends a triangle vertex: position, color and texture coordinate.
    fn put_triangle_vertex(self: *GpuRenderer, x: f32, y: f32, rgba: [4]f32, uv: [2]f32) Error!void {
        const data = [_]f32{ x, y, rgba[0], rgba[1], rgba[2], rgba[3], uv[0], uv[1] };
        try self.vertices.appendSlice(self.allocator, std.mem.sliceAsBytes(&data));
    }

    /// Appends one line strip through `points` and records it. Points are scaled and
    /// offset by half a pixel; `first` is the byte offset where they start.
    fn emit_line_strip(self: *GpuRenderer, frame_value: Frame, points: []const FPoint, first: usize) Error!void {
        const cs = frame_value.layout.current_scale;
        const rgba = self.output_color(self.draw_rgba);
        for (points) |point| try self.put_line_vertex(point.x * cs[0] + 0.5, point.y * cs[1] + 0.5, rgba);
        const primitive: types.PrimitiveType = if (points.len == 2) .line_list else .line_strip;
        try self.record(frame_value, primitive, null, self.blend, .nearest, clamp_address, first, try count_of(points.len));
    }

    /// Appends two triangles covering `corners` (in TL, TR, BR, BL order) with the
    /// given texture coordinates. Vertices are scaled by the render scale; the
    /// caller records the batch.
    fn emit_quad(self: *GpuRenderer, frame_value: Frame, corners: [4]FPoint, uv: [4][2]f32, rgba: [4]f32) Error!void {
        const cs = frame_value.layout.current_scale;
        for (quad_order) |index| {
            try self.put_triangle_vertex(corners[index].x * cs[0], corners[index].y * cs[1], rgba, uv[index]);
        }
    }

    /// Appends a textured quad and records it with the texture's state.
    fn emit_textured(self: *GpuRenderer, frame_value: Frame, tex: *Texture, src: FRect, corners: [4]FPoint, flip: Flip) Error!void {
        const texture_width: f32 = @floatFromInt(tex.width());
        const texture_height: f32 = @floatFromInt(tex.height());
        var minu = src.x / texture_width;
        var maxu = (src.x + src.width) / texture_width;
        var minv = src.y / texture_height;
        var maxv = (src.y + src.height) / texture_height;
        if (flip.horizontal) std.mem.swap(f32, &minu, &maxu);
        if (flip.vertical) std.mem.swap(f32, &minv, &maxv);
        const uv = [4][2]f32{ .{ minu, minv }, .{ maxu, minv }, .{ maxu, maxv }, .{ minu, maxv } };
        const first = self.vertices.items.len;
        try self.emit_quad(frame_value, corners, uv, self.output_color(texture_tint(tex)));
        try self.record(frame_value, .triangle_list, tex, tex.blend, tex.scale_mode, clamp_address, first, 6);
    }

    // -----------------------------------------------------------------------
    // Internal: texture transfers
    // -----------------------------------------------------------------------

    /// Copies each plane's rows into one staging region and records the copies
    /// into the frame's command buffer. The staging buffer is mapped with cycling,
    /// so an upload that the GPU still reads from the previous mapping gets a fresh
    /// backing instead of waiting. Rows are taken `pitch` bytes apart and written
    /// `row_bytes` at a time (SDL's `GPU_UpdateTextureInternal`).
    fn upload_planes(self: *GpuRenderer, planes: []const PlaneUpload) Error!void {
        var total: usize = 0;
        for (planes) |plane| {
            const row_bytes = @as(usize, @intCast(plane.rect.width)) * plane.texel_bytes;
            const rows: usize = @intCast(plane.rect.height);
            total = std.mem.alignForward(usize, total, 4) + try bytes_of(row_bytes, rows);
        }
        const size = try count_of(total);
        try self.ensure_command_buffer();
        const cb = &self.command_buffer.?;
        const staging = try self.reserve_staging(size);
        const mapped = try staging.map_cycled(true);
        var offset: usize = 0;
        for (planes) |plane| {
            offset = std.mem.alignForward(usize, offset, 4);
            const row_bytes = @as(usize, @intCast(plane.rect.width)) * plane.texel_bytes;
            const rows: usize = @intCast(plane.rect.height);
            for (0..rows) |row| {
                @memcpy(mapped[offset + row * row_bytes ..][0..row_bytes], plane.source[row * plane.pitch ..][0..row_bytes]);
            }
            offset += row_bytes * rows;
        }
        staging.unmap();

        offset = 0;
        for (planes) |plane| {
            offset = std.mem.alignForward(usize, offset, 4);
            const width: u32 = @intCast(plane.rect.width);
            const height: u32 = @intCast(plane.rect.height);
            try cb.upload_texture(staging, .{
                .offset = try count_of(offset),
                .pixels_per_row = width,
                .rows_per_layer = height,
            }, plane.texture, .{
                .x = @intCast(plane.rect.x),
                .y = @intCast(plane.rect.y),
                .w = width,
                .h = height,
                .d = 1,
            });
            offset += @as(usize, width) * plane.texel_bytes * height;
        }
    }

    /// The persistent staging buffer, grown to at least `size` bytes. A replaced
    /// buffer is retired by the device, so commands already recorded still read it.
    fn reserve_staging(self: *GpuRenderer, size: u32) Error!*device.TransferBuffer {
        if (self.staging == null or self.staging_capacity < size) {
            const capacity = @max(size, min_buffer_size);
            const fresh = try self.dev.create_transfer_buffer(.{ .usage = .upload, .size = capacity });
            if (self.staging) |*old| old.deinit();
            self.staging = fresh;
            self.staging_capacity = capacity;
        }
        return &self.staging.?;
    }

    /// The persistent vertex buffer, grown to at least `size` bytes.
    fn reserve_vertex_buffer(self: *GpuRenderer, size: u32) Error!void {
        if (self.vertex_buffer == null or self.vertex_capacity < size) {
            const capacity = @max(size, min_buffer_size);
            const fresh = try self.dev.create_buffer(.{ .usage = .{ .vertex = true }, .size = capacity });
            if (self.vertex_buffer) |*old| old.deinit();
            self.vertex_buffer = fresh;
            self.vertex_capacity = capacity;
        }
    }

    /// Replaces the backbuffer with one of `width` by `height`, releasing the old one.
    fn replace_backbuffer(self: *GpuRenderer, width: u32, height: u32, format: types.TextureFormat) device.Error!void {
        const fresh = try make_backbuffer(self.dev, width, height, format);
        self.backbuffer.deinit();
        self.backbuffer = fresh;
    }

    /// Samplers for a scale mode and addressing: created on first use.
    fn sampler(self: *GpuRenderer, scale: surface.ScaleMode, address: [2]software.Address) device.Error!*const device.Sampler {
        const linear: usize = if (scale == .nearest) 0 else 1;
        const index = (linear * 2 + @as(usize, @backingInt(address[0]))) * 2 + @as(usize, @backingInt(address[1]));
        if (self.samplers[index] == null) {
            const filter: types.Filter = if (scale == .nearest) .nearest else .linear;
            const mipmap: types.SamplerMipmapMode = if (scale == .nearest) .nearest else .linear;
            self.samplers[index] = try self.dev.create_sampler(.{
                .min_filter = filter,
                .mag_filter = filter,
                .mipmap_mode = mipmap,
                .address_mode_u = address_mode(address[0]),
                .address_mode_v = address_mode(address[1]),
                .address_mode_w = .clamp_to_edge,
            });
        }
        return &self.samplers[index].?;
    }

    // -----------------------------------------------------------------------
    // Internal: command buffers and passes
    // -----------------------------------------------------------------------

    fn ensure_command_buffer(self: *GpuRenderer) device.Error!void {
        if (self.command_buffer == null) self.command_buffer = try self.dev.acquire_command_buffer();
    }

    /// Submits the frame's command buffer, if one is open.
    fn submit(self: *GpuRenderer) device.Error!void {
        if (self.command_buffer == null) return;
        const cb = &self.command_buffer.?;
        try cb.submit();
        self.command_buffer = null;
    }

    /// Runs the command queue into the command buffer (SDL's `GPU_RunCommandQueue`).
    /// The vertex stream is uploaded once, before any pass, so passes read it after the copy.
    fn flush(self: *GpuRenderer) Error!void {
        if (self.commands.items.len == 0) return;
        try self.ensure_command_buffer();
        const cb = &self.command_buffer.?;

        if (self.vertices.items.len > 0) {
            const size = try count_of(self.vertices.items.len);
            try self.reserve_vertex_buffer(size);
            const staging = try self.reserve_staging(size);
            const mapped = try staging.map_cycled(true);
            @memcpy(mapped[0..size], self.vertices.items);
            staging.unmap();
            var copy_pass = try cb.begin_copy_pass();
            try copy_pass.upload_to_buffer(.{ .transfer = staging }, .{ .buffer = &self.vertex_buffer.?, .size = size }, true);
            copy_pass.end();
        }

        var open: ?pass.RenderPass = null;
        var pending_clear: ?types.FColor = null;
        for (self.commands.items) |command| {
            switch (command) {
                .clear => |color_value| pending_clear = color_value,
                .draw => |draw_call| {
                    if (open == null or pending_clear != null) {
                        if (open) |*active| active.end();
                        open = try self.begin_pass(cb, pending_clear);
                        pending_clear = null;
                    }
                    try self.draw(&open.?, &self.vertex_buffer.?, draw_call);
                },
            }
        }
        if (open) |*active| active.end();
        if (pending_clear) |color_value| {
            var clearing = try self.begin_pass(cb, color_value);
            clearing.end();
        }
        self.commands.clearRetainingCapacity();
        self.vertices.clearRetainingCapacity();
    }

    /// Opens a render pass on the active destination; `clear` clears it on load.
    fn begin_pass(self: *GpuRenderer, cb: *device.CommandBuffer, clear_color: ?types.FColor) device.Error!pass.RenderPass {
        var targets = [_]pass.ColorTarget{.{
            .texture = self.destination_texture(),
            .load_op = if (clear_color != null) .clear else .load,
            .clear_color = clear_color orelse .{},
        }};
        return cb.begin_render_pass(&targets, null);
    }

    /// Binds the pipeline, samplers, uniforms, vertices and viewport, then draws (SDL's `Draw`).
    fn draw(self: *GpuRenderer, render_pass: *pass.RenderPass, vertex_buffer: *const device.Buffer, draw_call: Draw) Error!void {
        const state = draw_call.state;
        const choice: ?shaders.TextureChoice = if (state.texture) |tex| texture_choice(tex, state.scale, self.output_headroom()) else null;
        const selection = shaders.select(state.primitive, choice);
        const pipe = try self.pipelines.get(self.dev, &self.programs, .{
            .blend = state.blend,
            .vertex = selection.vertex,
            .fragment = selection.fragment,
            .primitive = state.primitive,
            .format = self.destination_format(),
        });
        try render_pass.bind_graphics_pipeline(pipe);

        if (state.texture) |tex| {
            try self.bind_textures(render_pass, tex, state.scale, state.address, selection.fragment == .texture_advanced);
        }

        const viewport = state.viewport;
        const viewport_width: f32 = @floatFromInt(viewport.width);
        const viewport_height: f32 = @floatFromInt(viewport.height);
        const mvp = shaders.vertex_uniforms(viewport_width, viewport_height);
        try render_pass.push_vertex_uniform_data(0, std.mem.sliceAsBytes(&mvp));
        if (selection.fragment == .texture_advanced) {
            const tex = state.texture orelse unreachable;
            const constants = shaders.advanced_uniforms(self.advanced_params(tex, state, selection.texture_kind orelse unreachable));
            try render_pass.push_fragment_uniform_data(0, std.mem.sliceAsBytes(&constants));
        } else {
            const constants = shaders.simple_uniforms(state.color_scale);
            try render_pass.push_fragment_uniform_data(0, std.mem.sliceAsBytes(&constants));
        }

        try render_pass.bind_vertex_buffers(0, &[_]pass.BufferBinding{.{
            .buffer = vertex_buffer,
            .offset = @intCast(draw_call.first),
        }});
        render_pass.set_viewport(.{
            .x = @floatFromInt(viewport.x),
            .y = @floatFromInt(viewport.y),
            .w = viewport_width,
            .h = viewport_height,
        });
        render_pass.set_scissor(.{
            .x = state.scissor.x,
            .y = state.scissor.y,
            .w = @intCast(state.scissor.width),
            .h = @intCast(state.scissor.height),
        });
        try render_pass.draw_primitives(draw_call.count, 1, 0, 0);
    }

    /// Binds the samplers a texture's shader class reads. The advanced program
    /// reads three slots: the texture's own plane (Y, texels or indices), then
    /// either the U and V planes, the interleaved chroma, or the palette.
    fn bind_textures(self: *GpuRenderer, render_pass: *pass.RenderPass, tex: *const Texture, scale: surface.ScaleMode, address: [2]software.Address, advanced: bool) Error!void {
        // Palette indices are always sampled with nearest filtering, as SDL's GetSampler does.
        const sampling: surface.ScaleMode = if (tex.is_indexed()) .nearest else scale;
        const primary = pass.SamplerBinding{ .texture = &tex.gpu, .sampler = try self.sampler(sampling, address) };
        if (!advanced) {
            try render_pass.bind_fragment_samplers(0, &[_]pass.SamplerBinding{primary});
            return;
        }
        var bindings = [_]pass.SamplerBinding{ primary, primary, primary };
        if (tex.chroma_u) |*plane| bindings[1] = .{ .texture = plane, .sampler = primary.sampler };
        if (tex.chroma_v) |*plane| bindings[2] = .{ .texture = plane, .sampler = primary.sampler };
        if (tex.palette) |*palette| bindings[1] = .{ .texture = palette, .sampler = try self.sampler(.nearest, clamp_address) };
        try render_pass.bind_fragment_samplers(0, &bindings);
    }

    /// Constants of the advanced program for one draw (SDL's `CalculateAdvancedShaderConstants`).
    fn advanced_params(self: *const GpuRenderer, tex: *const Texture, state: DrawState, kind: shaders.TextureKind) shaders.AdvancedParams {
        return .{
            .kind = kind,
            .input = texture_input(tex),
            .linear_output = color.is_linear(self.output),
            .color_scale = state.color_scale,
            .texture_width = tex.width(),
            .texture_height = tex.height(),
            .sdr_white_point = tex.sdr_white_point,
            .tonemap = shaders.tonemap_for(tex.hdr_headroom, self.output_headroom()),
            .ycbcr = tex.ycbcr,
        };
    }
};

/// Index order of the two triangles of a quad given as TL, TR, BR, BL corners.
const quad_order = [_]usize{ 0, 1, 2, 0, 2, 3 };

/// Zero texture coordinates for untextured quads.
const zero_uv = [4][2]f32{ .{ 0, 0 }, .{ 0, 0 }, .{ 0, 0 }, .{ 0, 0 } };

fn allocate(allocator: std.mem.Allocator, dev: *device.Device, format: types.TextureFormat, width: u32, height: u32, window_target: ?WindowTarget, output: color.Output) Error!*GpuRenderer {
    const self = try allocator.create(GpuRenderer);
    errdefer allocator.destroy(self);
    var programs = try shaders.Shaders.create(dev);
    errdefer programs.deinit();
    var backbuffer = try make_backbuffer(dev, width, height, format);
    errdefer backbuffer.deinit();
    self.* = .{
        .allocator = allocator,
        .dev = dev,
        .programs = programs,
        .pipelines = pipeline_cache.Cache.init(allocator),
        .samplers = @splat(null),
        .backbuffer = backbuffer,
        .window = window_target,
        .output = output,
    };
    return self;
}

fn make_backbuffer(dev: *device.Device, width: u32, height: u32, format: types.TextureFormat) device.Error!device.Texture {
    return dev.create_texture(.{
        .format = format,
        .usage = .{ .color_target = true, .sampler = true },
        .width = width,
        .height = height,
    });
}

/// Texture class of a textured draw (SDL's `CalculateAdvancedShaderConstants` texture_type).
fn texture_kind(tex: *const Texture, scale: surface.ScaleMode) shaders.TextureKind {
    return switch (tex.format) {
        .yuv => |layout| switch (layout) {
            .nv12, .p010 => .nv12,
            .nv21 => .nv21,
            .iyuv, .yv12 => .yuv,
        },
        .pixels => |format| switch (format) {
            .indexed => switch (scale) {
                .nearest => .palette_nearest,
                .linear => .palette_linear,
                .pixel_art => .palette_pixel_art,
            },
            .rgba8, .bgra8 => if (scale == .pixel_art) .rgba_pixel_art else .rgba,
            else => if (scale == .pixel_art) .rgb_pixel_art else .rgb,
        },
    };
}

/// Input encoding of a texture's samples: YCbCr input is sRGB except P010 (HDR10).
fn texture_input(tex: *const Texture) color.Input {
    return switch (tex.format) {
        .yuv => |layout| if (layout == .p010) .hdr10 else .srgb,
        .pixels => tex.colorspace,
    };
}

/// Shader choice inputs of a textured draw.
fn texture_choice(tex: *const Texture, scale: surface.ScaleMode, output_headroom: f32) shaders.TextureChoice {
    const tonemap = shaders.tonemap_for(tex.hdr_headroom, output_headroom) != null;
    return shaders.texture_choice(texture_kind(tex, scale), texture_input(tex), tonemap);
}

fn address_mode(address: software.Address) types.SamplerAddressMode {
    return switch (address) {
        .clamp => .clamp_to_edge,
        .repeat => .repeat,
    };
}

/// Byte offset of the top-left texel of `rect` in a shadow with rows `pitch` apart.
fn shadow_offset(rect: IRect, pitch: usize, texel_bytes: u32) usize {
    return @as(usize, @intCast(rect.y)) * pitch + @as(usize, @intCast(rect.x)) * texel_bytes;
}

/// Region of `tex` to act on: `region` or the whole texture, which must be non-empty and inside it.
fn checked_rect(tex: *const Texture, region: ?IRect) Error!IRect {
    const full: IRect = .{ .x = 0, .y = 0, .width = @intCast(tex.width()), .height = @intCast(tex.height()) };
    const rect = region orelse full;
    if (rect.width <= 0 or rect.height <= 0) return error.InvalidRect;
    const right = @as(i64, rect.x) + rect.width;
    const bottom = @as(i64, rect.y) + rect.height;
    if (rect.x < 0 or rect.y < 0 or right > full.width or bottom > full.height) return error.InvalidRect;
    return rect;
}

test "scRGB sRGB textures use sampler decoding instead of shader decoding" {
    var tex: Texture = .{
        .gpu = undefined,
        .access = .static,
        .format = .{ .pixels = .rgba8 },
        .pixel_width = 1,
        .pixel_height = 1,
        .texel_bytes = 4,
        .colorspace = .srgb,
        .hardware_srgb = true,
    };
    try std.testing.expectEqual(color.Input.unspecified, texture_input(&tex));
    tex.hardware_srgb = false;
    try std.testing.expectEqual(color.Input.srgb, texture_input(&tex));
}

/// The half-size chroma area of a luma rectangle (SDL's `rect->x / 2`, `(w + 1) / 2`).
fn chroma_rect(luma: IRect) IRect {
    return .{
        .x = @divTrunc(luma.x, 2),
        .y = @divTrunc(luma.y, 2),
        .width = @divTrunc(luma.width + 1, 2),
        .height = @divTrunc(luma.height + 1, 2),
    };
}

/// Builds an upload of `rect` from `source`, checking that the rows fit.
fn plane_upload(texture: *device.Texture, rect: IRect, texel_bytes: u32, source: []const u8, pitch: usize) error{InvalidRect}!PlaneUpload {
    const row_bytes = @as(usize, @intCast(rect.width)) * texel_bytes;
    const rows: usize = @intCast(rect.height);
    if (pitch < row_bytes or source.len < (rows - 1) * pitch + row_bytes) return error.InvalidRect;
    return .{ .texture = texture, .rect = rect, .texel_bytes = texel_bytes, .source = source, .pitch = pitch };
}

/// Source rectangle clipped to the texture; null when empty.
fn resolve_source(tex: *const Texture, requested: ?FRect) Error!?FRect {
    const full: FRect = .{ .x = 0, .y = 0, .width = @floatFromInt(tex.width()), .height = @floatFromInt(tex.height()) };
    const selected = if (requested) |rect| (try full.intersection(rect)) orelse return null else full;
    if (selected.width <= 0 or selected.height <= 0) return null;
    return selected;
}

/// Default destination of copies: the viewport in render coordinates, at the origin.
fn default_destination(layout: layout_mod.Layout) FRect {
    return .{ .x = 0, .y = 0, .width = layout.render_size.x, .height = layout.render_size.y };
}

/// Corners of `rect` in TL, TR, BR, BL order.
fn rect_corners(rect: FRect) [4]FPoint {
    return .{
        .{ .x = rect.x, .y = rect.y },
        .{ .x = rect.x + rect.width, .y = rect.y },
        .{ .x = rect.x + rect.width, .y = rect.y + rect.height },
        .{ .x = rect.x, .y = rect.y + rect.height },
    };
}

/// Four inclusive corners of an outline, closed back to the first, as SDL_RenderRect.
fn outline_corners(rect: FRect) [5]FPoint {
    const right = rect.x + rect.width - 1;
    const bottom = rect.y + rect.height - 1;
    return .{
        .{ .x = rect.x, .y = rect.y },
        .{ .x = right, .y = rect.y },
        .{ .x = right, .y = bottom },
        .{ .x = rect.x, .y = bottom },
        .{ .x = rect.x, .y = rect.y },
    };
}

/// Vertex tint of a texture: its color and alpha modulation as floats, sRGB encoded.
fn texture_tint(tex: *const Texture) [4]f32 {
    return .{
        @as(f32, @floatFromInt(tex.color_mod.r)) / 255.0,
        @as(f32, @floatFromInt(tex.color_mod.g)) / 255.0,
        @as(f32, @floatFromInt(tex.color_mod.b)) / 255.0,
        @as(f32, @floatFromInt(tex.alpha_mod)) / 255.0,
    };
}

fn color_floats(value: Color) [4]f32 {
    return .{
        @as(f32, @floatFromInt(value.r)) / 255.0,
        @as(f32, @floatFromInt(value.g)) / 255.0,
        @as(f32, @floatFromInt(value.b)) / 255.0,
        @as(f32, @floatFromInt(value.a)) / 255.0,
    };
}

fn clamp_unit(value: f32) f32 {
    return std.math.clamp(value, 0, 1);
}

fn to_byte(unit: f32) u8 {
    return @intFromFloat(@round(clamp_unit(unit) * 255));
}

fn count_of(value: usize) Error!u32 {
    return std.math.cast(u32, value) orelse error.Overflow;
}

fn count_i32(value: u32) Error!i32 {
    return std.math.cast(i32, value) orelse error.Overflow;
}

/// `row_bytes * rows` as a size, rejecting overflow.
fn bytes_of(row_bytes: usize, rows: usize) Error!usize {
    return std.math.mul(usize, row_bytes, rows) catch error.Overflow;
}
