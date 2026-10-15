//! Pixel layout of render-view state for the GPU backend.
//!
//! This is the same mapping `render/renderer.zig` computes for the CPU raster
//! (SDL's UpdateLogicalPresentation, UpdatePixelViewport and UpdatePixelClipRect),
//! so both renderers place viewports, clip rectangles and logical letterboxing
//! identically. The only difference is the output: here the render target is a
//! GPU texture of known size instead of a borrowed raster.
//!
//! Numeric convention: viewports and scissors are integer output pixels, as Vulkan
//! requires. Vertices stay floating point: the GPU backend scales them by
//! `Layout.current_scale` and leaves the rest to the viewport transform, which is
//! what SDL's GPU backend does. The software renderer truncates per primitive
//! instead; that is a deliberate difference between the backends.
const std = @import("std");
const geometry = @import("../../video/geometry.zig");
const cpu = @import("../renderer.zig");

/// Floating-point point in render coordinates.
pub const FPoint = geometry.Point(f32);
/// Floating-point rectangle in render coordinates (boundaries included).
pub const FRect = geometry.Rect(f32);
/// Integer pixel rectangle in output pixels (right and bottom edges excluded).
pub const IRect = geometry.Rect(i32);

/// Pixel mapping for one view state and one output size.
pub const Layout = struct {
    /// Destination of the logical area inside the output, in output pixels.
    dst: FRect,
    /// Render scale times logical scale: the factor from render units to output pixels.
    current_scale: [2]f32,
    /// Absolute viewport in output pixels. Origin is floored and extent ceiled.
    viewport: IRect,
    /// Absolute clip rectangle in output pixels, or null when unclipped.
    clip: ?IRect,
    /// Viewport size in render coordinates; the default destination of copies.
    render_size: FPoint,
};

/// Computes the layout of `state` over an output of `output_width` by `output_height` pixels.
pub fn compute(state: cpu.ViewState, output_width: f32, output_height: f32) geometry.GeometryError!Layout {
    var dst: FRect = .{ .x = 0, .y = 0, .width = output_width, .height = output_height };
    var logical_scale: [2]f32 = .{ 1, 1 };
    if (active_logical(state)) |logical| {
        dst = presentation_rect(logical, output_width, output_height);
        logical_scale = .{
            if (logical.width > 0) dst.width / logical.width else 0,
            if (logical.height > 0) dst.height / logical.height else 0,
        };
    }
    const cs: [2]f32 = .{ state.scale[0] * logical_scale[0], state.scale[1] * logical_scale[1] };
    const pixel_w = try int_of(dst.width);
    const pixel_h = try int_of(dst.height);

    // Viewport: origin floored, extent ceiled, both scaled by the current scale.
    const vp_rect = state.viewport;
    const vp = vp_rect orelse FRect{ .x = 0, .y = 0, .width = -1, .height = -1 };
    const vp_x = try floor_i32(vp.x * cs[0] + dst.x);
    const vp_y = try floor_i32(vp.y * cs[1] + dst.y);
    const vp_w = if (vp_rect != null) try ceil_i32(vp.width * cs[0]) else pixel_w;
    const vp_h = if (vp_rect != null) try ceil_i32(vp.height * cs[1]) else pixel_h;

    // Clip rectangle, relative to the viewport origin.
    var clip_pixels: ?IRect = null;
    if (state.clip) |clip_rect| {
        clip_pixels = .{
            .x = try offset(vp_x, try floor_i32(clip_rect.x * cs[0])),
            .y = try offset(vp_y, try floor_i32(clip_rect.y * cs[1])),
            .width = try ceil_i32(clip_rect.width * cs[0]),
            .height = try ceil_i32(clip_rect.height * cs[1]),
        };
    }

    // Without a viewport the render size is the output divided by the scale.
    const render_w: f32 = if (vp_rect) |value| value.width else if (cs[0] > 0) @as(f32, @floatFromInt(pixel_w)) / cs[0] else 0;
    const render_h: f32 = if (vp_rect) |value| value.height else if (cs[1] > 0) @as(f32, @floatFromInt(pixel_h)) / cs[1] else 0;
    return .{
        .dst = dst,
        .current_scale = cs,
        .viewport = .{ .x = vp_x, .y = vp_y, .width = vp_w, .height = vp_h },
        .clip = clip_pixels,
        .render_size = .{ .x = render_w, .y = render_h },
    };
}

/// Maps a window point (output pixels) to render coordinates. Inverse of `render_to_window`.
pub fn window_to_render(state: cpu.ViewState, layout: Layout, point: FPoint) geometry.GeometryError!FPoint {
    var x = point.x;
    var y = point.y;
    if (active_logical(state)) |logical| {
        if (layout.dst.width == 0 or layout.dst.height == 0) return error.NonFinite;
        x = (x - layout.dst.x) * logical.width / layout.dst.width;
        y = (y - layout.dst.y) * logical.height / layout.dst.height;
    }
    if (state.scale[0] == 0 or state.scale[1] == 0) return error.NonFinite;
    const origin_x = if (state.viewport) |value| value.x else 0;
    const origin_y = if (state.viewport) |value| value.y else 0;
    return .{ .x = x / state.scale[0] - origin_x, .y = y / state.scale[1] - origin_y };
}

/// Maps a render-coordinate point to window (output) pixels. Inverse of `window_to_render`.
pub fn render_to_window(state: cpu.ViewState, layout: Layout, point: FPoint) geometry.GeometryError!FPoint {
    const origin_x = if (state.viewport) |value| value.x else 0;
    const origin_y = if (state.viewport) |value| value.y else 0;
    var x = (origin_x + point.x) * state.scale[0];
    var y = (origin_y + point.y) * state.scale[1];
    if (active_logical(state)) |logical| {
        if (logical.width == 0 or logical.height == 0) return error.NonFinite;
        x = layout.dst.x + x * layout.dst.width / logical.width;
        y = layout.dst.y + y * layout.dst.height / logical.height;
    }
    return .{ .x = x, .y = y };
}

/// Logical presentation of a state when it is active (not disabled).
fn active_logical(state: cpu.ViewState) ?cpu.Logical {
    const logical = state.logical orelse return null;
    if (logical.mode == .disabled) return null;
    return logical;
}

/// Presentation of the logical area inside the output, as SDL computes it.
fn presentation_rect(logical: cpu.Logical, output_w: f32, output_h: f32) FRect {
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
