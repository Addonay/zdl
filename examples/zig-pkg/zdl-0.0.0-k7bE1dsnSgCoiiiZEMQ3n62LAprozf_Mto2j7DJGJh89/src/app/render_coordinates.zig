//! Window-to-render coordinate conversion for input events, ported from SDL's
//! `SDL_ConvertEventToRenderCoordinates` and the helpers it uses in
//! `render/SDL_render.c` (`SDL_RenderCoordinatesFromWindow`,
//! `SDL_RenderCoordinatesToWindow`, `SDL_RenderVectorFromWindow`).
//!
//! The math lives in `render/renderer.zig` (`window_to_render`, `render_to_window`).
//! This module adds the event side: which fields of which event kind carry window
//! coordinates, which are normalized touch coordinates and which are vectors.
//!
//! Conventions:
//! - Window coordinates are output pixels of the renderer's raster. SDL multiplies by
//!   a `dpi_scale` first; this port has no such factor, so a caller with a window
//!   whose point-to-pixel scale is `s` multiplies event coordinates by `s` before
//!   converting, and divides render-to-window results by `s`.
//! - The conversion always uses the renderer's main output view, never a render
//!   target, as SDL reads `renderer->main_view`. A `Renderer` value is copied and its
//!   `target` cleared, so the caller's renderer is not modified.
//! - Vectors (relative motion) are scaled but not translated. They are computed as the
//!   difference of two point conversions at the origin, so they match SDL up to float
//!   rounding. Deliberate: the renderer does not expose its logical destination rect.
//! - Finger coordinates are normalized to the window (0..1). They are scaled by the
//!   window size given by the caller and converted from there, as SDL does. Unlike
//!   pointer events, they are converted whatever window id they carry (SDL's FIXME).
//!
//! Errors: a logical size or scale that is zero makes the conversion undefined, so the
//! renderer reports `InvalidArgument` where SDL would divide by zero.
const std = @import("std");
const event = @import("../events/event.zig");
const renderer = @import("../render/renderer.zig");

/// Renderer whose view state the conversion reads.
pub const Renderer = renderer.Renderer;
/// Identifier of the window a renderer draws into.
pub const WindowId = event.WindowId;
/// Input event type converted by `convert_event`.
pub const Event = event.Event;

/// Errors from the renderer's conversion (`InvalidArgument` for zero scale or size).
pub const Error = renderer.Error;

/// Point in window or render coordinates.
pub const FPoint = renderer.FPoint;

/// Window size in output pixels, used to scale normalized touch coordinates.
pub const Size = struct {
    width: u32,
    height: u32,
};

/// The renderer with its target cleared, so the conversions below see the main view.
fn main_view(rend: renderer.Renderer) renderer.Renderer {
    var view = rend;
    view.target = null;
    return view;
}

/// Converts an output-pixel point to render coordinates (SDL_RenderCoordinatesFromWindow).
pub fn from_window(rend: renderer.Renderer, point: FPoint) Error!FPoint {
    return main_view(rend).window_to_render(point);
}

/// Converts a render-coordinate point to output pixels (SDL_RenderCoordinatesToWindow).
pub fn to_window(rend: renderer.Renderer, point: FPoint) Error!FPoint {
    return main_view(rend).render_to_window(point);
}

/// Scales a window-space vector into render space, without translation
/// (SDL_RenderVectorFromWindow). See the module notes for how it is computed.
pub fn vector_from_window(rend: renderer.Renderer, delta: FPoint) Error!FPoint {
    const origin = try from_window(rend, .{ .x = 0, .y = 0 });
    const moved = try from_window(rend, delta);
    return .{ .x = moved.x - origin.x, .y = moved.y - origin.y };
}

/// Converts the window-space fields of `ev` in place of a copy and returns it.
///
/// `window` is the window the renderer draws into. Pointer events (mouse motion,
/// buttons, wheel, pen, drop) are converted only when they carry that id; other events
/// come back unchanged. Touch fingers are converted regardless of id, using
/// `window_size`. Events without coordinates (keys, device, window and app events)
/// are returned unchanged.
///
/// Converted fields, as in SDL:
/// - mouse_motion: `x`, `y` (point) and `xrel`, `yrel` (vector);
/// - mouse_button: `x`, `y`; mouse_wheel: `mouse_x`, `mouse_y` (the wheel amounts
///   `x`, `y` are not positions and are untouched);
/// - finger: `x`, `y` (normalized point) and `dx`, `dy` (normalized vector);
/// - pen_motion, pen_touch, pen_button, pen_axis: `x`, `y`;
/// - drop (all kinds): `x`, `y`.
pub fn convert_event(
    rend: renderer.Renderer,
    window: event.WindowId,
    window_size: Size,
    ev: event.Event,
) Error!event.Event {
    var out = ev;
    switch (out) {
        .mouse_motion => |*motion| {
            if (motion.window_id != window) return out;
            const point = try from_window(rend, .{ .x = motion.x, .y = motion.y });
            motion.x = point.x;
            motion.y = point.y;
            const delta = try vector_from_window(rend, .{ .x = motion.xrel, .y = motion.yrel });
            motion.xrel = delta.x;
            motion.yrel = delta.y;
        },
        .mouse_button => |*button| {
            if (button.window_id != window) return out;
            const point = try from_window(rend, .{ .x = button.x, .y = button.y });
            button.x = point.x;
            button.y = point.y;
        },
        .mouse_wheel => |*wheel| {
            if (wheel.window_id != window) return out;
            const point = try from_window(rend, .{ .x = wheel.mouse_x, .y = wheel.mouse_y });
            wheel.mouse_x = point.x;
            wheel.mouse_y = point.y;
        },
        .finger => |*contact| {
            // Normalized touch coordinates are scaled to the window first. SDL does this
            // for every finger event without checking the window id.
            const width: f32 = @floatFromInt(window_size.width);
            const height: f32 = @floatFromInt(window_size.height);
            const point = try from_window(rend, .{ .x = contact.x * width, .y = contact.y * height });
            contact.x = point.x;
            contact.y = point.y;
            const delta = try vector_from_window(rend, .{ .x = contact.dx * width, .y = contact.dy * height });
            contact.dx = delta.x;
            contact.dy = delta.y;
        },
        .pen_motion => |*pen| {
            if (pen.window_id != window) return out;
            const point = try from_window(rend, .{ .x = pen.x, .y = pen.y });
            pen.x = point.x;
            pen.y = point.y;
        },
        .pen_touch => |*pen| {
            if (pen.window_id != window) return out;
            const point = try from_window(rend, .{ .x = pen.x, .y = pen.y });
            pen.x = point.x;
            pen.y = point.y;
        },
        .pen_button => |*pen| {
            if (pen.window_id != window) return out;
            const point = try from_window(rend, .{ .x = pen.x, .y = pen.y });
            pen.x = point.x;
            pen.y = point.y;
        },
        .pen_axis => |*pen| {
            if (pen.window_id != window) return out;
            const point = try from_window(rend, .{ .x = pen.x, .y = pen.y });
            pen.x = point.x;
            pen.y = point.y;
        },
        .drop => |*drop| {
            if (drop.window_id != window) return out;
            const point = try from_window(rend, .{ .x = drop.x, .y = drop.y });
            drop.x = point.x;
            drop.y = point.y;
        },
        else => {},
    }
    return out;
}
