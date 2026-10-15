//! Wayland adapter for the Linux platform layer. Owns the xkb session (the
//! libxkbcommon library, the compiled keymap, its state and the per-group
//! keyboard layouts built by `input/xkb/sdl_keymap.zig`) and translates typed
//! Wayland window events into platform events.
//!
//! Keys: the evdev code and the xkb keysym of the current state give the
//! scancode (hardware keyboards use the evdev table; virtual keyboards use the
//! keysym). The keyboard layout for the active group supplies keycodes. Key
//! repeat is driven by the platform timer from `wl_keyboard.repeat_info`.
//! Repeat currently repeats every non-modifier key, because the xkb
//! `key_repeats` query is not exposed by `input/xkb` (see the report).
//!
//! Modifiers: depressed, latched and locked masks update the xkb state. Caps and
//! Num Lock come from the xkb locked mask. Sided modifier bits are kept from
//! the key transitions, since wl_keyboard does not report sides.
//!
//! Pointer: wl_pointer scroll frames carry precise wheel ticks (high-resolution
//! value120 deltas, or discrete steps, or continuous deltas divided by 10). The
//! platform gets those ticks; `mouse.zig` derives the integer steps from them.
//!
//! Drag-and-drop: drag enter and motion accept the offer's preferred type (file
//! list, else text); a drop reads the data through a pipe and emits file or text
//! drop events, then a complete event. Positions are in window logical units.
//!
//! Limits: xdg-shell clients cannot choose their size, cannot unmap without
//! recreating the role, and cannot unminimize. Those operations return
//! `UnsupportedOperation` or are documented as no-ops (see `restore` in linux.zig).
//!
const std = @import("std");
const platform = @import("linux.zig");
const wayland = @import("../video/wayland/window.zig");
const protocol = @import("../video/wayland/protocol.zig");
const event = @import("../events/event.zig");
const pen = @import("../events/pen.zig");
const keyboard = @import("../input/keyboard.zig");
const xkb_library = @import("../input/xkb/library.zig");
const xkb_keymap = @import("../input/xkb/keymap.zig");
const xkb_state = @import("../input/xkb/state.zig");
const sdl_keymap = @import("../input/xkb/sdl_keymap.zig");
const dnd = @import("../video/wayland/dnd.zig");

/// xkb-backed keyboard data for the Wayland seat. Heap-allocated: the keymap
/// refers to the library, and the state refers to the keymap, by address.
pub const Session = struct {
    allocator: std.mem.Allocator,
    cursor_theme: ?[:0]u8,
    xkb_library: ?xkb_library.Library = null,
    keymap: ?xkb_keymap.Keymap = null,
    state: ?xkb_state.State = null,
    layouts: ?sdl_keymap.Keymaps = null,

    /// Creates the session. The xkb library is loaded on the first keymap, so
    /// a missing libxkbcommon only costs the layout data.
    pub fn open(allocator: std.mem.Allocator, cursor_theme: ?[]const u8) platform.Error!*Session {
        const self = try allocator.create(Session);
        errdefer allocator.destroy(self);
        self.* = .{ .allocator = allocator, .cursor_theme = null };
        if (cursor_theme) |name| self.cursor_theme = try allocator.dupeSentinel(u8, name, 0);
        return self;
    }

    /// Releases keymaps, state and the xkb library, then the session.
    pub fn close(self: *Session, allocator: std.mem.Allocator) void {
        if (self.state) |*state| state.deinit();
        if (self.layouts) |*layouts| layouts.deinit();
        if (self.keymap) |*map| map.deinit();
        if (self.xkb_library) |*library| library.close();
        if (self.cursor_theme) |name| allocator.free(name);
        allocator.destroy(self);
    }
};

/// Creates a Wayland window. It maps when its first configure is acknowledged.
pub fn create_window(allocator: std.mem.Allocator, session: *Session, options: platform.WindowOptions) platform.Error!wayland.Window {
    const theme: ?[]const u8 = if (session.cursor_theme) |name| name else null;
    return wayland.Window.open(allocator, .{
        .title = options.title,
        .size = .{ .width = options.size.width, .height = options.size.height },
        .server_decorations = !options.borderless,
        .cursor_theme = theme,
    });
}

/// Sets the xdg-toplevel min and max sizes (zero means none).
pub fn set_limits(window: *wayland.Window, min: ?platform.Size, max: ?platform.Size) platform.Error!void {
    const toplevel = window.toplevel orelse return error.UnsupportedOperation;
    const minimum = min orelse platform.Size{ .width = 0, .height = 0 };
    const maximum = max orelse platform.Size{ .width = 0, .height = 0 };
    protocol.XdgToplevel.set_min_size(window.lib, toplevel, minimum.width, minimum.height);
    protocol.XdgToplevel.set_max_size(window.lib, toplevel, maximum.width, maximum.height);
    try window.lib.flush(window.display);
}

/// Switches between server-side (bordered) and client-side (no) decorations.
pub fn set_bordered(window: *wayland.Window, bordered: bool) platform.Error!void {
    const decoration = window.decoration orelse return error.UnsupportedOperation;
    protocol.ZxdgToplevelDecorationV1.set_mode(window.lib, decoration, if (bordered) .server_side else .client_side);
    try window.lib.flush(window.display);
}

/// Asks the compositor to minimize the toplevel.
pub fn minimize(window: *wayland.Window) platform.Error!void {
    const toplevel = window.toplevel orelse return error.UnsupportedOperation;
    protocol.XdgToplevel.set_minimized(window.lib, toplevel);
    try window.lib.flush(window.display);
}

/// Maps a standard cursor onto SDL's cursor-shape names (cursor-shape-v1 or the XCursor theme).
pub fn cursor_shape(shape: platform.SystemCursor) wayland.SystemCursor {
    return switch (shape) {
        .default => .default,
        .pointer => .pointer,
        .text => .text,
        .crosshair => .crosshair,
        .wait => .wait,
        .progress => .progress,
        .move => .move,
        .not_allowed => .not_allowed,
        .ew_resize => .ew_resize,
        .ns_resize => .ns_resize,
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

/// Offers `text` as the clipboard in the UTF-8 and plain-text MIME types.
pub fn set_clipboard(window: *wayland.Window, text: []const u8) platform.Error!void {
    const entries = [_]wayland.SelectionEntry{
        .{ .mime = "text/plain;charset=utf-8", .data = text },
        .{ .mime = "text/plain", .data = text },
        .{ .mime = "UTF8_STRING", .data = text },
        .{ .mime = "TEXT", .data = text },
        .{ .mime = "STRING", .data = text },
    };
    try window.set_selection(.clipboard, &entries);
}

/// Reads the clipboard as text, preferring UTF-8. Waits up to five seconds for
/// each read. The caller owns the result.
pub fn clipboard_text(allocator: std.mem.Allocator, window: *wayland.Window) platform.Error![]u8 {
    const offered = window.selection_mime_types(.clipboard);
    const preferred = [_][]const u8{ "text/plain;charset=utf-8", "text/plain", "UTF8_STRING", "TEXT", "STRING" };
    const mime: []const u8 = blk: {
        for (preferred) |wanted| {
            for (offered) |candidate| {
                if (std.mem.eql(u8, candidate, wanted)) break :blk wanted;
            }
        }
        return error.NoSelection;
    };
    var pipe = try window.receive_selection(.clipboard, mime);
    defer pipe.close();
    return read_pipe(allocator, &pipe);
}

/// Reads a pipe to its end. Each wait for data is bounded by five seconds.
fn read_pipe(allocator: std.mem.Allocator, pipe: *wayland.Pipe) platform.Error![]u8 {
    var out: std.ArrayList(u8) = .empty;
    errdefer out.deinit(allocator);
    var buffer: [4096]u8 = undefined;
    var descriptors = [1]std.posix.pollfd{.{ .fd = pipe.fd, .events = std.posix.POLL.IN, .revents = 0 }};
    while (true) {
        const ready = std.posix.poll(&descriptors, 5000) catch return error.PollFailed;
        if (ready == 0) return error.ClipboardTimeout;
        switch (try pipe.read(&buffer)) {
            .bytes => |count| try out.appendSlice(allocator, buffer[0..count]),
            .would_block => {},
            .end_of_stream => break,
        }
    }
    return out.toOwnedSlice(allocator);
}

/// Translates one Wayland event for `record` and queues the platform events.
pub fn handle(p: *platform.Platform, record: *platform.Record, ev: wayland.Event) platform.Error!void {
    const id = record.id;
    switch (ev) {
        .configure => |configure| {
            try p.emit_window(record.state.send(.resized, configure.size.width, configure.size.height));
            if (configure.state.maximized != record.state.flags.maximized) {
                try p.emit_window(record.state.send(if (configure.state.maximized) .maximized else .restored, 0, 0));
            }
            if (configure.state.fullscreen != record.state.flags.fullscreen) {
                try p.emit_window(record.state.send(if (configure.state.fullscreen) .enter_fullscreen else .leave_fullscreen, 0, 0));
            }
            try p.check_pixels(record);
        },
        .close_requested => try p.emit_window(record.state.send(.close_requested, 0, 0)),
        .frame_done => {},
        .scale_changed => try p.check_pixels(record),
        .keyboard_keymap => |text| try replace_keymap(p, text),
        .keyboard_focus => |focused| {
            try p.emit_window(record.state.send(if (focused) .focus_gained else .focus_lost, 0, 0));
            if (!focused) try p.release_keys(id);
        },
        .key => |key| try key_event(p, record, key),
        .keyboard_modifiers => |mods| try apply_modifiers(p, mods),
        .keyboard_repeat => |repeat| {
            p.repeat_rate = repeat.rate;
            p.repeat_delay_ms = repeat.delay_ms;
        },
        .pointer_enter => |point| {
            p.mouse.set_focus(id);
            try p.emit_window(record.state.send(.mouse_enter, 0, 0));
            try p.mouse_move(id, @floatCast(point.x), @floatCast(point.y), false);
        },
        .pointer_leave => try p.emit_window(record.state.send(.mouse_leave, 0, 0)),
        .pointer_motion => |motion| try p.mouse_move(id, @floatCast(motion.x), @floatCast(motion.y), false),
        .pointer_button => |button| {
            const index = button_index(button.code) orelse return;
            try p.mouse_button(id, index, button.pressed);
        },
        .pointer_scroll => |scroll| {
            // `ticks` is already in wheel steps with Wayland's sign (down and right
            // are positive); the platform's wheel has positive y up.
            if (scroll.horizontal) {
                try p.mouse_wheel(id, @floatCast(scroll.ticks), 0);
            } else {
                try p.mouse_wheel(id, 0, @floatCast(-scroll.ticks));
            }
        },
        .pointer_relative_motion => |motion| try p.mouse_move(id, @floatCast(motion.dx), @floatCast(motion.dy), true),
        .pointer_lock => |locked| p.mouse.set_relative_mode(locked),
        .touch_down => |touch| try p.touch_input(.down, id, touch.id, @floatCast(touch.x), @floatCast(touch.y)),
        .touch_up => |touch| try p.touch_input(.up, id, touch.id, 0, 0),
        .touch_motion => |touch| try p.touch_input(.motion, id, touch.id, @floatCast(touch.x), @floatCast(touch.y)),
        .touch_frame => {},
        .touch_cancel => try p.touch_cancel(id),
        .selection_changed => try p.emit(.{ .clipboard = .{ .timestamp = p.now_ns(), .owner = false } }),
        .text_preedit => |preedit| try p.text_editing_event(id, preedit.text, preedit.cursor_begin, @max(preedit.cursor_end - preedit.cursor_begin, 0)),
        .text_commit => |text| try p.text_input_event(id, text),
        .text_delete_surrounding => {},
        .output_added, .output_changed, .output_removed => try p.refresh_wayland_displays(record),
        .drag_enter => |position| try drag_position(p, record, position),
        .drag_motion => |position| try drag_position(p, record, position),
        // The offer left without a drop: SDL completes the drop (data_device_handle_leave).
        .drag_leave => try p.emit_drop(id, .complete, 0, 0, null),
        .drag_drop => |kind| try drag_drop(p, record, kind),
        .popup_configure => |popup| {
            const child = p.find_wayland_popup(id, popup.id) orelse return;
            try p.emit_window(child.state.send(.shown, 0, 0));
            try p.emit_window(child.state.send(.moved, popup.x, popup.y));
            try p.emit_window(child.state.send(.resized, popup.size.width, popup.size.height));
        },
        .popup_done => |popup_id| {
            const child = p.find_wayland_popup(id, popup_id) orelse return;
            try p.emit_window(child.state.send(.close_requested, 0, 0));
        },
        // The preferred scale of a popup changed: its pixel size and display scale
        // are reported as the main window's are (SDL's scale change path).
        .popup_scale_changed => |popup_id| {
            const child = p.find_wayland_popup(id, popup_id) orelse return;
            const window = switch (record.native) {
                .wayland => |*value| value,
                else => return,
            };
            const size = window.popup_buffer_size(popup_id) orelse return;
            try p.report_pixels(child, size.width, size.height);
        },
        .drag_source_ended => |ended| record.drag_dropped = ended.dropped,
        .pen_added => |info| try p.pen_register(id, info.id, info.kind == .eraser),
        .pen_removed => |pen_id| try p.pen_unregister(id, pen_id),
        .pen => |sample| try pen_sample(p, id, sample),
        // Frame callbacks (frame_done, popup_frame_done) only pace presentation, and
        // touch_frame, text_delete_surrounding and popup_repositioned carry nothing
        // this layer publishes. The set is exhaustive except for these.
        else => {},
    }
}

/// Maps one pen sample of an announced tool to its platform pen calls. Samples
/// come in SDL's order (proximity, tip, motion, axes, buttons). A proximity-out is
/// deferred to the end of the pump, as SDL defers Wayland tablet frames.
fn pen_sample(p: *platform.Platform, window_id: event.WindowId, sample: wayland.PenSample) platform.Error!void {
    switch (sample.sample) {
        .proximity => |in| try p.pen_proximity_input(window_id, sample.pen, in, in),
        .touch => |down| try p.pen_touch_input(window_id, sample.pen, down),
        .motion => |point| try p.pen_motion_input(window_id, sample.pen, @floatCast(point.x), @floatCast(point.y)),
        .axis => |value| try p.pen_axis_input(window_id, sample.pen, pen_axis(value.axis), value.value),
        .button => |button| try p.pen_button_input(window_id, sample.pen, button.button, button.pressed),
    }
}

/// Tablet axis to pen axis. The protocol's axes are the same set as SDL's.
fn pen_axis(axis: wayland.PenAxis) pen.Axis {
    return switch (axis) {
        .pressure => .pressure,
        .xtilt => .xtilt,
        .ytilt => .ytilt,
        .distance => .distance,
        .rotation => .rotation,
        .slider => .slider,
    };
}

/// Accepts the drag at `position` for the preferred type the offer carries and
/// reports the position (SDL's DROP_POSITION).
fn drag_position(p: *platform.Platform, record: *platform.Record, position: wayland.DragPosition) platform.Error!void {
    const window = switch (record.native) {
        .wayland => |*value| value,
        else => return,
    };
    const mimes = window.drag_mime_types();
    const accept: ?[]const u8 = switch (dnd.classify(mimes)) {
        .files => dnd.uri_list_mime,
        .text => dnd.preferred_text(mimes),
        .none => null,
    };
    try window.accept_drag(accept);
    try p.emit_drop(record.id, .position, @floatCast(position.x), @floatCast(position.y), null);
}

/// Reads the dropped data (file list or text), reports each item and completes the drop.
fn drag_drop(p: *platform.Platform, record: *platform.Record, kind: wayland.DropKind) platform.Error!void {
    const window = switch (record.native) {
        .wayland => |*value| value,
        else => return,
    };
    const mimes = window.drag_mime_types();
    switch (kind) {
        .files => {
            const data = try read_drag(p.allocator, window, dnd.uri_list_mime);
            defer p.allocator.free(data);
            const paths = try dnd.file_paths(p.allocator, data);
            defer dnd.free_paths(p.allocator, paths);
            for (paths) |path| try p.emit_drop(record.id, .file, 0, 0, path);
        },
        .text => {
            const mime = dnd.preferred_text(mimes) orelse return error.NoSelection;
            const data = try read_drag(p.allocator, window, mime);
            defer p.allocator.free(data);
            try p.emit_drop(record.id, .text, 0, 0, data);
        },
        .none => {},
    }
    try p.emit_drop(record.id, .complete, 0, 0, null);
    try window.finish_drag();
}

fn read_drag(allocator: std.mem.Allocator, window: *wayland.Window, mime: []const u8) platform.Error![]u8 {
    var pipe = try window.drag_receive(mime);
    defer pipe.close();
    return read_pipe(allocator, &pipe);
}

/// Wayland button codes (linux/input-event-codes.h) to SDL's one-based buttons.
fn button_index(code: u32) ?u8 {
    return switch (code) {
        0x110 => 1, // BTN_LEFT
        0x111 => 3, // BTN_RIGHT
        0x112 => 2, // BTN_MIDDLE
        0x113 => 4, // BTN_SIDE
        0x114 => 5, // BTN_EXTRA
        else => null,
    };
}

fn key_event(p: *platform.Platform, record: *platform.Record, key: wayland.Key) platform.Error!void {
    const session = p.wayland.?;
    const id = record.id;
    var scancode = key.scancode;
    var keysym: ?u32 = null;
    if (session.state) |*state| {
        const symbol = state.keysym(key.evdev_code + 8);
        if (symbol != 0) keysym = symbol;
    }
    if (session.layouts) |*layouts| scancode = layouts.scancode_for_key(key.evdev_code, keysym);
    // xkb decides repeat per key (modifiers and non-repeating keys do not repeat).
    const repeats = if (session.keymap) |*map| map.key_repeats(key.evdev_code + 8) else true;
    const raw: u16 = @truncate(key.evdev_code);
    p.update_key_repeat(id, scancode, raw, key.pressed, repeats);
    try p.key_input(id, .{
        .scancode = scancode,
        .down = key.pressed,
        .raw = raw,
        .source = .hardware,
        .now_ns = p.now_ns(),
    }, null);
    // Without a text-input session the key's own text is the input (SDL's
    // behavior); control characters are not text.
    if (key.pressed and !record.text_input) {
        if (session.state) |*state| {
            var buffer: [32]u8 = undefined;
            const text = state.keymap.library.state_key_utf8(state.handle, key.evdev_code + 8, &buffer);
            if (text.len > 0 and text[0] >= 0x20 and text[0] != 0x7f) try p.text_input_event(id, text);
        }
    }
}

/// Updates xkb with the compositor's modifier masks, the lock modifiers and the active group.
fn apply_modifiers(p: *platform.Platform, mods: wayland.XkbModifiers) platform.Error!void {
    const session = p.wayland.?;
    if (session.state) |*state| state.update_wayland(mods.depressed, mods.latched, mods.locked, mods.group);
    if (session.keymap) |*map| {
        const active = mods.depressed | mods.latched | mods.locked;
        var current = p.keyboard.modifiers;
        current.caps = active & map.modifier_mask(.lock) != 0;
        current.num = active & map.modifier_mask(.num_lock) != 0;
        p.keyboard.set_modifiers(current);
    }
    if (session.layouts) |*layouts| {
        if (layouts.layouts.len > 0) {
            const index = @min(@as(usize, mods.group), layouts.layouts.len - 1);
            p.keyboard.set_keymap(&layouts.layouts[index]);
        }
    }
}

/// Compiles a new keymap from the compositor and rebuilds the per-group layouts.
/// Failures leave the platform on the built-in layout (no error is reported).
fn replace_keymap(p: *platform.Platform, text: []const u8) platform.Error!void {
    const session = p.wayland.?;
    p.keyboard.set_keymap(null);
    if (session.state) |*state| state.deinit();
    session.state = null;
    if (session.layouts) |*layouts| layouts.deinit();
    session.layouts = null;
    if (session.keymap) |*map| map.deinit();
    session.keymap = null;

    if (session.xkb_library == null) session.xkb_library = xkb_library.Library.open() catch return;
    session.keymap = xkb_keymap.Keymap.from_text(&session.xkb_library.?, text) catch return;
    session.state = session.keymap.?.create_state() catch null;
    session.layouts = try sdl_keymap.Keymaps.build(session.allocator, &session.keymap.?);
    if (session.layouts.?.layouts.len > 0) p.keyboard.set_keymap(&session.layouts.?.layouts[0]);
}
