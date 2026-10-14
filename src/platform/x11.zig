//! X11 adapter for the Linux platform layer. Owns the Xlib session (library,
//! connection and selection state) and turns X11 events into platform events:
//! window state read back from the window manager (`window_state_changed`),
//! keys with the X11 layout's keycodes, pointer and wheel through `mouse`,
//! XInput2 touch and pens, raw relative motion and smooth scroll, committed text
//! and input-method composition, XDND drops, selections and RandR display changes.
//!
//! Event flow: `pump` drains `Connection.poll`. Selection and property events go
//! to `Clipboard.handle_event` first, so ICCCM transfers are answered without
//! reaching the queue. Root-window events (keymap, RandR, raw motion) are handled
//! before a window record is looked up.
//!
//! XInput2 is optional. When libXi is present, every window selects XI2 pointer
//! motion (for smooth scroll), pens (proximity) and, on servers with XI 2.2, touch.
//! Once a window has delivered smooth scroll, core wheel buttons 4-7 are ignored so
//! one wheel turn is not reported twice; without XI2 the buttons remain the wheel.
//!
//! Drops: XdndEnter/Position/Leave/Drop are answered by `dnd.zig`, which reports
//! the position, the URI or text lines and the completion. A URI line is turned
//! into a local path with the Wayland backend's `dnd.file_paths`, which SDL's
//! SDL_URIToLocal corresponds to. `dnd.zig` cuts a long line into pieces of at most
//! `text_input.extended_capacity` bytes, so pieces are joined here until a short
//! piece ends the line. Limitation: a line of 125 to 128 bytes that is followed by
//! another line of the same kind is joined with it, because the piece boundary is
//! not otherwise visible.
//!
//! Deliberate differences: buttons 8 and 9 map to the X1 and X2 buttons (4 and 5).
//! Exclusive fullscreen mode switches are made by linux.zig through RandR. Pen
//! down follows pressure (SDL uses the tip button, which is not selected here).
const std = @import("std");
const platform = @import("linux.zig");
const event = @import("../events/event.zig");
const x11 = @import("../video/x11/window.zig");
const clipboard = @import("../video/x11/clipboard.zig");
const text_input = @import("../video/x11/text_input.zig");
const dnd = @import("../video/wayland/dnd.zig");

/// A non-final piece of a long drop line is at least `extended_capacity - 3` bytes
/// (a UTF-8 character is at most four bytes), so a piece this short ends its line.
const drop_piece_final_limit = text_input.extended_capacity - 4;

/// The Xlib library, the connection and the selection state for one X server.
/// Heap-allocated because the connection and the window hold pointers into it.
pub const Session = struct {
    allocator: std.mem.Allocator,
    library: x11.Library,
    connection: x11.Connection,
    clipboard: clipboard.Clipboard,
    /// Set once XI2 smooth scroll has arrived; core wheel buttons are then ignored.
    smooth_scroll: bool = false,
    /// The drop line being joined from pieces (see the module comment).
    drop_line: std.ArrayList(u8) = .empty,
    drop_line_is_file: bool = false,
    drop_line_window: event.WindowId = .none,

    /// Loads libX11 and connects to `display_name` (null uses DISPLAY).
    pub fn open(allocator: std.mem.Allocator, display_name: ?[:0]const u8) platform.Error!*Session {
        const self = try allocator.create(Session);
        errdefer allocator.destroy(self);
        self.allocator = allocator;
        self.library = try x11.Library.open(allocator);
        errdefer self.library.deinit();
        self.connection = try x11.Connection.open(&self.library, display_name);
        errdefer self.connection.deinit();
        // XInput2 is optional: without it the core protocol carries pointer and wheel.
        self.connection.enable_xinput() catch {};
        self.clipboard = clipboard.Clipboard.init(allocator);
        self.smooth_scroll = false;
        self.drop_line = .empty;
        self.drop_line_is_file = false;
        self.drop_line_window = .none;
        return self;
    }

    /// Releases the selection, the connection and the library. Windows must be gone.
    pub fn close(self: *Session, allocator: std.mem.Allocator) void {
        self.drop_line.deinit(allocator);
        self.clipboard.deinit();
        self.connection.deinit();
        self.library.deinit();
        allocator.destroy(self);
    }

    /// Whether XInput2 is enabled on this connection.
    pub fn xinput_enabled(self: *const Session) bool {
        return self.connection.xi != null;
    }

    /// Whether the server supports XInput2 touch events (XI 2.2).
    pub fn touch_supported(self: *const Session) bool {
        const state = self.connection.xi orelse return false;
        return state.supports_touch();
    }
};

/// Creates an X11 window. It is not mapped; `Window.show` maps it. When XI2 is
/// enabled the window selects XI2 pointer motion, pen proximity and (on XI 2.2
/// servers) touch.
pub fn create_window(session: *Session, options: platform.WindowOptions) platform.Error!x11.Window {
    var window = try x11.Window.create(&session.connection, .{
        .title = options.title,
        .size = .{ .width = options.size.width, .height = options.size.height },
        .visible = false,
    });
    errdefer window.deinit();
    if (session.xinput_enabled()) {
        try window.select_xinput(.{ .motion = true, .touch = session.touch_supported(), .pen = true });
    }
    return window;
}

/// Creates an override-redirect popup over `parent` (X11 has no xdg_popup). The
/// popup is mapped at once; its position is relative to the parent. `grab` is not
/// honored on X11.
pub fn create_popup(parent: *const x11.Window, options: platform.PopupOptions) platform.Error!x11.Window {
    return x11.Window.create_popup(parent, .{
        .position = options.offset,
        .size = .{ .width = options.size.width, .height = options.size.height },
        .kind = switch (options.kind) {
            .menu => .menu,
            .tooltip => .tooltip,
        },
        .visible = true,
    });
}

/// Maps a standard cursor onto the X11 cursor shapes. Themed cursors (libXcursor)
/// are preferred by `x11.Cursor.system`, with these shapes as the fallback.
pub fn cursor_shape(shape: platform.SystemCursor) x11.CursorShape {
    return switch (shape) {
        .default => .arrow,
        .pointer => .pointer,
        .text => .text,
        .crosshair => .crosshair,
        .wait => .wait,
        .progress => .progress,
        .move => .move,
        .not_allowed => .not_allowed,
        .ew_resize => .horizontal_resize,
        .ns_resize => .vertical_resize,
        .nwse_resize => .nwse_resize,
        .nesw_resize => .nesw_resize,
        .n_resize => .n_resize,
        .ne_resize => .ne_resize,
        .e_resize => .e_resize,
        .se_resize => .se_resize,
        .s_resize => .s_resize,
        .sw_resize => .sw_resize,
        .w_resize => .w_resize,
        .nw_resize => .nw_resize,
        .help => .help,
    };
}

/// Drains every event the X server has delivered and queues its platform events.
pub fn pump(p: *platform.Platform, session: *Session) platform.Error!void {
    while (try session.connection.poll()) |ev| try handle(p, session, ev);
}

/// The platform's pen source for an XInput2 device id.
fn pen_source(device: i32) u32 {
    return @bitCast(device);
}

/// Translates one X11 event into platform events.
fn handle(p: *platform.Platform, session: *Session, ev: x11.Event) platform.Error!void {
    switch (ev.payload) {
        .selection_cleared => try p.emit(.{ .clipboard = .{ .timestamp = p.now_ns(), .owner = false } }),
        .keymap_changed => return p.emit(.{ .keymap_changed = .{ .timestamp = p.now_ns() } }),
        .display_changed => return p.refresh_x11_displays(session),
        .keyboard_group => return,
        .raw_motion => |raw| return p.raw_motion_input(@floatCast(raw.dx), @floatCast(raw.dy)),
        else => {},
    }
    if (try session.clipboard.handle_event(&session.connection, ev)) return;

    const record = p.find_x11(ev.window) orelse return;
    const id = record.id;
    switch (ev.payload) {
        .close => try p.emit_window(record.state.send(.close_requested, 0, 0)),
        .destroyed => {
            switch (record.native) {
                .x11 => |*window| window.apply(ev),
                else => {},
            }
            try p.emit_window(record.state.send(.destroyed, 0, 0));
        },
        .shown => try p.emit_window(record.state.send(.shown, 0, 0)),
        .hidden => try p.emit_window(record.state.send(.hidden, 0, 0)),
        .exposed => try p.emit_window(record.state.send(.exposed, 0, 0)),
        .configured => |change| {
            switch (record.native) {
                .x11 => |*window| window.apply(ev),
                else => {},
            }
            try p.emit_window(record.state.send(.moved, change.position.x, change.position.y));
            try p.emit_window(record.state.send(.resized, change.size.width, change.size.height));
            try p.check_pixels(record);
        },
        .window_state_changed => try p.sync_x11_window_state(record),
        .focused => |focused| {
            try p.emit_window(record.state.send(if (focused) .focus_gained else .focus_lost, 0, 0));
            if (!focused) try p.release_keys(id);
        },
        .pointer_crossed => |inside| {
            try p.emit_window(record.state.send(if (inside) .mouse_enter else .mouse_leave, 0, 0));
            if (inside) p.mouse.set_focus(id);
        },
        .key => |key| try p.key_input(id, .{
            .scancode = key.scancode,
            .down = key.pressed,
            .raw = key.x_keycode,
            .source = .hardware,
            .ignore_modifiers = true,
            .now_ns = p.now_ns(),
        }, .{ .keycode = key.keycode, .modifiers = key.modifiers }),
        .motion => |motion| try p.mouse_move(id, @floatFromInt(motion.position.x), @floatFromInt(motion.position.y), false),
        .button => |button| {
            // Buttons 4-7 are wheel ticks and arrive as `.wheel` on press only.
            if (button.button >= 4 and button.button <= 7) return;
            try p.mouse_move(id, @floatFromInt(button.position.x), @floatFromInt(button.position.y), false);
            const index: u8 = if (button.button >= 8) button.button - 4 else button.button;
            try p.mouse_button(id, index, button.pressed);
        },
        .wheel => |wheel| {
            // XI2 smooth scroll carries the same turns once it is in use.
            if (session.smooth_scroll) return;
            try p.mouse_wheel(id, @floatFromInt(wheel.x), @floatFromInt(wheel.y));
        },
        .smooth_scroll => |scroll| {
            session.smooth_scroll = true;
            try p.mouse_wheel(id, scroll.x, scroll.y);
        },
        .touch => |touch| try p.x11_touch(record, touch.device, touch.finger, touch.phase, touch.position.x, touch.position.y),
        .text => |text| try p.text_input_event(id, text.text()),
        .text_editing => |editing| try p.text_editing_event(id, editing.text(), @intCast(editing.caret), 0),
        .drop_position => |point| try p.emit_drop(id, .position, @floatFromInt(point.x), @floatFromInt(point.y), null),
        .drop_left => {
            // XdndLeave completes the drop, as SDL does (SDL_x11events.c).
            try flush_drop_line(p, session);
            try p.emit_drop(id, .complete, 0, 0, null);
        },
        .drop_text => |chunk| try drop_piece(p, session, id, false, chunk.text()),
        .drop_file => |chunk| try drop_piece(p, session, id, true, chunk.text()),
        .drop_complete => {
            try flush_drop_line(p, session);
            try p.emit_drop(id, .complete, 0, 0, null);
        },
        .pen_proximity => |pen_event| {
            const source = pen_source(pen_event.device);
            try p.pen_register(id, source, pen_event.eraser);
            try p.pen_proximity_input(id, source, pen_event.in_proximity, true);
        },
        .pen_motion => |pen_event| {
            // SDL reports motion, then the axes; pen down is pressure above zero here.
            const source = pen_source(pen_event.device);
            try p.pen_register(id, source, pen_event.eraser);
            try p.pen_motion_input(id, source, pen_event.position.x, pen_event.position.y);
            try p.pen_touch_input(id, source, pen_event.down);
            try p.pen_axis_input(id, source, .pressure, pen_event.pressure);
            try p.pen_axis_input(id, source, .xtilt, pen_event.tilt.x);
            try p.pen_axis_input(id, source, .ytilt, pen_event.tilt.y);
        },
        // Keymap and group events were handled above; selection requests are
        // answered by the clipboard. Property, XKB and RandR notices need no event.
        else => {},
    }
}

/// Joins one piece of a drop line to the line in progress. A different kind (text
/// or URI) or window ends the line first. A short piece ends the line as well.
fn drop_piece(p: *platform.Platform, session: *Session, window_id: event.WindowId, is_file: bool, piece: []const u8) platform.Error!void {
    if (session.drop_line.items.len > 0 and (session.drop_line_is_file != is_file or session.drop_line_window != window_id)) {
        try flush_drop_line(p, session);
    }
    try session.drop_line.appendSlice(session.allocator, piece);
    session.drop_line_is_file = is_file;
    session.drop_line_window = window_id;
    if (piece.len <= drop_piece_final_limit) try flush_drop_line(p, session);
}

/// Queues the drop line in progress: a file event per local path for a URI line
/// (other URIs are skipped, as SDL does), or one text event for text.
fn flush_drop_line(p: *platform.Platform, session: *Session) platform.Error!void {
    const line = session.drop_line.items;
    if (line.len == 0) return;
    defer session.drop_line.clearRetainingCapacity();
    if (session.drop_line_is_file) {
        const paths = try dnd.file_paths(session.allocator, line);
        defer dnd.free_paths(session.allocator, paths);
        for (paths) |path| try p.emit_drop(session.drop_line_window, .file, 0, 0, path);
    } else {
        try p.emit_drop(session.drop_line_window, .text, 0, 0, line);
    }
}

/// Reads the UTF-8 text of the CLIPBOARD selection. Waits for the owner's
/// answer, handling other events meanwhile. The caller owns the result.
pub fn clipboard_text(p: *platform.Platform, allocator: std.mem.Allocator, window: *x11.Window) platform.Error![]u8 {
    const session = p.x11.?;
    try clipboard.Clipboard.request_text(&session.connection, window, .clipboard);
    while (true) {
        const ev = (try session.connection.next_event_within(5000)) orelse return error.ClipboardTimeout;
        switch (ev.payload) {
            .selection_notified => |notified| {
                // `receive` allocates with the clipboard's allocator; copy into the caller's.
                const received = (try session.clipboard.receive(&session.connection, window, notified)) orelse
                    return try allocator.alloc(u8, 0);
                defer session.clipboard.allocator.free(received);
                return try allocator.dupe(u8, received);
            },
            else => try handle(p, session, ev),
        }
    }
}
