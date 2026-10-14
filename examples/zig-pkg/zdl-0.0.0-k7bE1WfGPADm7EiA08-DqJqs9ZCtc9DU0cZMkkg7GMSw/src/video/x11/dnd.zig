//! XDND drag-and-drop receive, following SDL_x11events.c: a window advertises
//! XdndAware, answers XdndEnter/Position/Leave/Drop from another client, fetches
//! the dropped data through a selection conversion, and replies with XdndStatus
//! and XdndFinished. Everything is reported as typed events on the window.
//!
//! Protocol details kept from SDL:
//! - Any XdndAware version is accepted. The version from XdndEnter only decides
//!   the time argument of XdndDrop (version 1 or later) and that the action is
//!   reported as copy, since copying is the only action accepted.
//! - Target choice (`pick_target`): text/uri-list wins outright; otherwise the
//!   first UTF-8 text target (text/plain;charset=utf-8, UTF8_STRING); otherwise
//!   the first plain text target (text/plain, TEXT).
//! - Dropped data is read from the PRIMARY property of the receiving window and
//!   split into lines at CR or LF. text/uri-list lines are `drop_file` events,
//!   every other target is `drop_text`.
//!
//! Deliberate differences: URIs are reported as received (SDL converts file URIs
//! to local paths with SDL_URIToLocal, which is left to the caller here). Long
//! lines are split into pieces of at most `text_input.extended_capacity` bytes.
//! Drop data is read in full and not streamed, so a very large drop waits for its
//! whole transfer before its events are queued.
//!
//! Ownership: the drag state (source window, chosen target, version) lives in the
//! Connection. Reply messages go to the source window; no memory outlives a call
//! except the queued events, which the Connection owns.
const std = @import("std");
const window = @import("window.zig");
const text_input = @import("text_input.zig");
const xlib = @import("xlib.zig");

/// XDND protocol version advertised in XdndAware (SDL advertises 5).
pub const protocol_version: c_long = 5;

/// MIME target atoms that are not identifier-shaped, so they cannot be AtomName tags.
pub const Atoms = struct {
    uri_list: xlib.Atom,
    text_plain: xlib.Atom,
    text_plain_utf8: xlib.Atom,

    /// Interns the MIME target names on a display.
    pub fn intern(api: *const xlib.Functions, display: *xlib.Display) Atoms {
        return .{
            .uri_list = api.XInternAtom(display, "text/uri-list", 0),
            .text_plain = api.XInternAtom(display, "text/plain", 0),
            .text_plain_utf8 = api.XInternAtom(display, "text/plain;charset=utf-8", 0),
        };
    }
};

/// State of the drag in progress on one connection. A zero source means none.
pub const State = struct {
    /// Window that started the drag (the XdndEnter sender).
    source: xlib.Window = 0,
    /// Target chosen at XdndEnter; zero when no offered type is accepted.
    request: xlib.Atom = 0,
    /// Protocol version from XdndEnter.
    version: c_long = 0,

    fn reset(self: *State) void {
        self.* = .{};
    }
};

/// Sets XdndAware on a new window so other clients may send it drags.
pub fn advertise(connection: *window.Connection, id: xlib.Window) void {
    var version = [_]c_long{protocol_version};
    _ = connection.library.functions.XChangeProperty(
        connection.display,
        id,
        connection.atom(.XdndAware),
        xlib.xa_atom,
        32,
        xlib.prop_mode_replace,
        @ptrCast(&version),
        1,
    );
}

/// Handles an XDND ClientMessage addressed to `raw.any.window`. Returns null for
/// any other client message.
pub fn translate_client(connection: *window.Connection, raw: *xlib.Event) window.Error!?window.Event {
    const message = raw.client.message_type;
    const target: window.WindowId = @fromBackingInt(@intCast(raw.any.window));
    const words: [5]c_ulong = @bitCast(raw.client.data.longs);
    if (message == connection.atom(.XdndEnter)) {
        const state = &connection.drop;
        state.source = words[0];
        state.version = @intCast(words[1] >> 24);
        const use_list = words[1] & 1 != 0;
        state.request = if (use_list)
            try pick_from_property(connection, state.source)
        else
            pick_target(connection, &.{ words[2], words[3], words[4] });
        return null;
    }
    if (message == connection.atom(.XdndPosition)) {
        const state = &connection.drop;
        const root_x: c_int = @intCast((words[2] >> 16) & 0xffff);
        const root_y: c_int = @intCast(words[2] & 0xffff);
        const api = &connection.library.functions;
        var x: c_int = 0;
        var y: c_int = 0;
        var child: xlib.Window = 0;
        _ = api.XTranslateCoordinates(connection.display, @as(xlib.Window, @intCast(@backingInt(connection.root))), raw.any.window, root_x, root_y, &x, &y, &child);
        // Accept the drag when a target was chosen; the rectangle is empty, so the source keeps sending positions.
        const accepted: c_ulong = if (state.request != 0) 1 else 0;
        try send_message(connection, state.source, connection.atom(.XdndStatus), .{
            @bitCast(@as(c_ulong, raw.any.window)), @bitCast(accepted), 0, 0, @bitCast(connection.atom(.XdndActionCopy)),
        });
        return .{ .window = target, .payload = .{ .drop_position = .{ .x = x, .y = y } } };
    }
    if (message == connection.atom(.XdndLeave)) {
        connection.drop.reset();
        return .{ .window = target, .payload = .drop_left };
    }
    if (message == connection.atom(.XdndDrop)) {
        const state = &connection.drop;
        if (state.request == 0) {
            // Not interested: XdndFinished with the failure marker (None) tells the source.
            try send_message(connection, state.source, connection.atom(.XdndFinished), .{
                @bitCast(@as(c_ulong, raw.any.window)), 0, 0, 0, 0,
            });
            state.reset();
            return null;
        }
        const time: xlib.Time = if (state.version >= 1) @intCast(words[2]) else xlib.current_time;
        _ = connection.library.functions.XConvertSelection(
            connection.display,
            connection.atom(.XdndSelection),
            state.request,
            connection.atom(.PRIMARY),
            raw.any.window,
            time,
        );
        return null;
    }
    return null;
}

/// Handles a SelectionNotify for the drop target: reads and reports the dropped
/// data, then sends XdndFinished. Returns null for other selection notifications.
/// The per-line events are queued first; the returned event is `drop_complete`.
pub fn translate_selection(connection: *window.Connection, raw: *xlib.Event) window.Error!?window.Event {
    const state = &connection.drop;
    if (state.source == 0 or state.request == 0) return null;
    if (raw.selection.target != state.request) return null;
    const target: window.WindowId = @fromBackingInt(@intCast(raw.any.window));
    const api = &connection.library.functions;
    const allocator = connection.library.allocator;
    const xid = raw.any.window;

    const data = try read_property(connection, xid, connection.atom(.PRIMARY), true);
    defer if (data) |reply| allocator.free(reply.bytes);
    if (data) |reply| {
        const is_uri = state.request == connection.drop_atoms.uri_list;
        var lines = std.mem.tokenizeAny(u8, reply.bytes, "\r\n");
        while (lines.next()) |line| {
            var rest: []const u8 = line;
            while (rest.len > 0) {
                const split = text_input.split_chunk(rest, text_input.extended_capacity);
                var chunk: window.Event.Utf8Chunk = .{ .length = @intCast(split.chunk.len), .bytes = undefined };
                @memcpy(chunk.bytes[0..split.chunk.len], split.chunk);
                const payload: window.Event.Payload = if (is_uri) .{ .drop_file = chunk } else .{ .drop_text = chunk };
                try connection.queue.append(allocator, .{ .window = target, .payload = payload });
                rest = split.rest;
            }
        }
    }

    // Reply with acceptance, as SDL does even when the conversion produced no data.
    try send_message(connection, state.source, connection.atom(.XdndFinished), .{
        @bitCast(@as(c_ulong, xid)), 1, @bitCast(connection.atom(.XdndActionCopy)), 0, 0,
    });
    _ = api.XSync(connection.display, 0);
    state.reset();
    return .{ .window = target, .payload = .drop_complete };
}

/// Chooses the drag target from a list of offered atoms (SDL's X11_PickTarget).
fn pick_target(connection: *window.Connection, offered: []const xlib.Atom) xlib.Atom {
    const atoms = connection.drop_atoms;
    var preferred: xlib.Atom = 0;
    var fallback: xlib.Atom = 0;
    for (offered) |candidate| {
        if (candidate == 0) continue;
        if (candidate == atoms.uri_list) return candidate;
        if (preferred == 0 and (candidate == atoms.text_plain_utf8 or candidate == connection.atom(.UTF8_STRING))) preferred = candidate;
        if (fallback == 0 and (candidate == atoms.text_plain or candidate == connection.atom(.TEXT))) fallback = candidate;
    }
    return if (preferred != 0) preferred else fallback;
}

/// Reads the source's XdndTypeList (used when more than three types are offered).
fn pick_from_property(connection: *window.Connection, source: xlib.Window) window.Error!xlib.Atom {
    const reply = (try read_property(connection, source, connection.atom(.XdndTypeList), false)) orelse return 0;
    defer connection.library.allocator.free(reply.bytes);
    // Format 32 items are longs (8 bytes on LP64), read in native order.
    const count = reply.bytes.len / @sizeOf(c_ulong);
    const offered = try connection.library.allocator.alloc(xlib.Atom, count);
    defer connection.library.allocator.free(offered);
    for (offered, 0..) |*atom, index| {
        atom.* = std.mem.readInt(c_ulong, reply.bytes[index * @sizeOf(c_ulong) ..][0..@sizeOf(c_ulong)], .native);
    }
    return pick_target(connection, offered);
}

/// Owned copy of a window property's bytes, with its type and format.
const Reply = struct {
    bytes: []u8,
    kind: xlib.Atom,
    format: c_int,
};

/// Reads a whole property (all chunks) into an owned buffer. Returns null when
/// the property is absent or the server refuses the request. `delete` removes
/// the property once read, as the INCR-free drop path requires.
fn read_property(connection: *window.Connection, id: xlib.Window, property: xlib.Atom, delete: bool) window.Error!?Reply {
    const allocator = connection.library.allocator;
    const api = &connection.library.functions;
    var bytes: std.ArrayList(u8) = .empty;
    errdefer bytes.deinit(allocator);
    var kind: xlib.Atom = 0;
    var format: c_int = 0;
    var offset: c_long = 0;
    // 1 MiB per request (length counts 32-bit units); longer properties take more requests.
    const chunk_units: c_long = 256 * 1024;
    while (true) {
        var actual_type: xlib.Atom = 0;
        var actual_format: c_int = 0;
        var count: c_ulong = 0;
        var after: c_ulong = 0;
        var data: ?[*]u8 = null;
        const status = api.XGetWindowProperty(
            connection.display,
            id,
            property,
            offset,
            chunk_units,
            @as(c_int, @intFromBool(delete)),
            xlib.any_property_type,
            &actual_type,
            &actual_format,
            &count,
            &after,
            &data,
        );
        const raw = data orelse return null;
        defer _ = api.XFree(raw);
        if (status != 0 or actual_type == 0) return null;
        kind = actual_type;
        format = actual_format;
        const item_bytes: usize = if (actual_format == 32) @sizeOf(c_long) else @intCast(@divExact(actual_format, 8));
        const size = @as(usize, @intCast(count)) * item_bytes;
        try bytes.appendSlice(allocator, raw[0..size]);
        if (after == 0) break;
        offset += @intCast((size + 3) / 4);
    }
    return .{ .bytes = try bytes.toOwnedSlice(allocator), .kind = kind, .format = format };
}

/// Sends a 32-bit ClientMessage to `target`, with NoEventMask as the XDND spec uses.
fn send_message(connection: *window.Connection, target: xlib.Window, message: xlib.Atom, data: [5]c_long) window.Error!void {
    var event: xlib.Event = undefined;
    @memset(std.mem.asBytes(&event), 0);
    event.client.header.kind = xlib.client_message;
    event.client.header.display = connection.display;
    event.client.header.window = target;
    event.client.message_type = message;
    event.client.format = xlib.client_message_format;
    event.client.data.longs = data;
    const api = &connection.library.functions;
    _ = api.XSendEvent(connection.display, target, 0, 0, &event);
    _ = api.XFlush(connection.display);
}
