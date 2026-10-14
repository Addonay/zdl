//! Cursor shapes for the Wayland backend, following SDL's SDL_waylandmouse.c.
//!
//! A cursor is one of three things: a system shape (`SystemCursor`, the names and
//! order of SDL_SystemCursor), a custom image (`CustomCursor`, built by
//! `Window.create_custom_cursor` from a zdl surface view), or hidden. System shapes
//! go through wp_cursor_shape_v1 when the compositor offers it; otherwise they are
//! looked up in the XCursor theme loaded through libwayland-cursor, by the CSS
//! name first, then SDL's fallback name, then `default` and the X11 name `left_ptr`.
//!
//! Numeric conventions: theme images are in device pixels, so the theme is loaded
//! at `size * buffer_scale` and hotspots are divided by the scale to get surface
//! coordinates. Custom images are authored at `scale` device pixels per surface
//! unit; their logical size is the pixel size divided by `scale`.

const std = @import("std");
const shm = @import("shm.zig");

/// SDL_SystemCursor, in SDL's order.
pub const SystemCursor = enum(u8) {
    default,
    text,
    wait,
    crosshair,
    progress,
    nwse_resize,
    nesw_resize,
    ew_resize,
    ns_resize,
    move,
    not_allowed,
    pointer,
    nw_resize,
    n_resize,
    ne_resize,
    e_resize,
    se_resize,
    s_resize,
    sw_resize,
    w_resize,
    context_menu,
    help,
    cell,
    vertical_text,
    alias,
    copy,
    no_drop,
    grab,
    grabbing,
    col_resize,
    row_resize,
    all_scroll,
    zoom_in,
    zoom_out,
};

/// CSS cursor name and the fallback SDL tries when the theme lacks the first.
pub const Names = struct {
    css: [:0]const u8,
    fallback: ?[:0]const u8 = null,
};

/// Theme names for each system cursor (SDL_GetCSSCursorName and its fallbacks).
pub fn names(cursor: SystemCursor) Names {
    return switch (cursor) {
        .default => .{ .css = "default" },
        .text => .{ .css = "text" },
        .wait => .{ .css = "wait" },
        .crosshair => .{ .css = "crosshair" },
        .progress => .{ .css = "progress" },
        .nwse_resize => .{ .css = "nwse-resize", .fallback = "nw-resize" },
        .nesw_resize => .{ .css = "nesw-resize", .fallback = "ne-resize" },
        .ew_resize => .{ .css = "ew-resize", .fallback = "col-resize" },
        .ns_resize => .{ .css = "ns-resize", .fallback = "row-resize" },
        .move => .{ .css = "move", .fallback = "all-scroll" },
        .not_allowed => .{ .css = "not-allowed" },
        .pointer => .{ .css = "pointer" },
        .nw_resize => .{ .css = "nw-resize" },
        .n_resize => .{ .css = "n-resize" },
        .ne_resize => .{ .css = "ne-resize" },
        .e_resize => .{ .css = "e-resize" },
        .se_resize => .{ .css = "se-resize" },
        .s_resize => .{ .css = "s-resize" },
        .sw_resize => .{ .css = "sw-resize" },
        .w_resize => .{ .css = "w-resize" },
        .context_menu => .{ .css = "context-menu" },
        .help => .{ .css = "help" },
        .cell => .{ .css = "cell" },
        .vertical_text => .{ .css = "vertical-text" },
        .alias => .{ .css = "alias" },
        .copy => .{ .css = "copy" },
        .no_drop => .{ .css = "no-drop" },
        .grab => .{ .css = "grab" },
        .grabbing => .{ .css = "grabbing" },
        .col_resize => .{ .css = "col-resize" },
        .row_resize => .{ .css = "row-resize" },
        .all_scroll => .{ .css = "all-scroll", .fallback = "move" },
        .zoom_in => .{ .css = "zoom-in" },
        .zoom_out => .{ .css = "zoom-out" },
    };
}

/// Name of the wp_cursor_shape_device_v1 shape for a system cursor. The protocol
/// uses the same identifiers as SDL's names, so the tag name is the shape name.
pub fn shape_name(cursor: SystemCursor) []const u8 {
    return @tagName(cursor);
}

/// A cursor image owned by the caller and built from a zdl surface view. Fields
/// are private; release it with `Window.release_custom_cursor` before the window
/// is deinitialized. The buffer's pixels are copied at creation, so the source
/// view need not outlive the call.
pub const CustomCursor = struct {
    buffer: shm.Buffer = .{},
    hot_x: u31 = 0,
    hot_y: u31 = 0,
    /// Device pixels per surface unit (the window's buffer scale at creation).
    scale: u31 = 1,
};

/// The cursor a window shows over its surface.
pub const Cursor = union(enum) {
    /// A standard shape from SDL's set.
    system: SystemCursor,
    /// An image created by `Window.create_custom_cursor`. The pointer must stay
    /// valid until the cursor is replaced or the window is deinitialized.
    custom: *const CustomCursor,
    /// No cursor is drawn over the window.
    hidden,
};
