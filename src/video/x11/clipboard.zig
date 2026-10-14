//! X11 selection (clipboard) text as owner and requestor, following
//! SDL_x11clipboard.c: ICCCM targets, plus INCR incremental transfers in both
//! directions for text larger than one protocol request.
//!
//! Owner side: `set_text` copies the text, claims the selection with
//! XSetSelectionOwner and answers SelectionRequest events with ICCCM targets:
//!   TARGETS  list of supported targets (ATOM property)
//!   UTF8_STRING  the UTF-8 text
//!   STRING / TEXT  the text with non-ASCII bytes replaced by '?'
//! Unsupported targets, and requests without a property, are refused with
//! property None. A SelectionClear event drops the owned text.
//!
//! Large answers use INCR (ICCCM 2.7.2): the property is set to the type INCR
//! with the total size, and each chunk is written after the requestor deletes
//! the previous one (PropertyNotify Deleted, delivered through `handle_event`).
//! A zero-length chunk ends the transfer. Only one incremental transfer runs at
//! a time; a request that arrives during one is refused.
//!
//! Requestor side: `request_text` converts the selection to UTF8_STRING into a
//! private property on the requestor window. On the SelectionNotify event,
//! `receive` reads the property. A direct answer is read in one call; an INCR
//! answer is read chunk by chunk, waiting up to `chunk_timeout_ms` for each
//! chunk. Other events that arrive meanwhile are returned to the queue in order.
//!
//! Deliberate differences: SDL sizes INCR chunks by the server's maximum request
//! length; here a fixed `max_chunk_bytes` is used, which is always valid. The
//! requestor timeout is the caller-visible SelectionTimeout error rather than
//! SDL's silent empty result.
const std = @import("std");
const window = @import("window.zig");
const xlib = @import("xlib.zig");

const Connection = window.Connection;
const Event = window.Event;
const Error = window.Error;

/// Largest direct property write, and the INCR chunk size. Chosen well below the
/// common 256 KiB request limit so every chunk is accepted by the server.
pub const max_chunk_bytes = 128 * 1024;
/// How long a requestor waits for each INCR chunk.
pub const chunk_timeout_ms = 5000;

/// Owns the clipboard text this client serves and the buffers it allocates.
/// One Clipboard may serve either selection; `set_text` records which.
pub const Clipboard = struct {
    allocator: std.mem.Allocator,
    text_storage: ?[]u8 = null,
    selection: window.Selection = .clipboard,
    /// The INCR transfer in progress, when the last answer was too large for one request.
    outgoing: ?Outgoing = null,

    const Outgoing = struct {
        requestor: xlib.Window,
        property: xlib.Atom,
        target: xlib.Atom,
        /// Copy of the bytes being sent, owned by the Clipboard's allocator.
        data: []u8,
        offset: usize,
    };

    pub fn init(allocator: std.mem.Allocator) Clipboard {
        return .{ .allocator = allocator };
    }

    /// Releases the text and any transfer in progress.
    pub fn deinit(self: *Clipboard) void {
        if (self.text_storage) |old| self.allocator.free(old);
        if (self.outgoing) |transfer| self.allocator.free(transfer.data);
        self.* = undefined;
    }

    /// Text this client currently owns, or null when another client (or none) does.
    pub fn text(self: *const Clipboard) ?[]const u8 {
        return self.text_storage;
    }

    /// Copies `text` and claims `selection` for `owner`. Fails with
    /// SelectionUnavailable when the server does not confirm the ownership.
    pub fn set_text(self: *Clipboard, connection: *Connection, owner: *const window.Window, selection: window.Selection, text_value: []const u8) Error!void {
        const copy = try self.allocator.dupe(u8, text_value);
        errdefer self.allocator.free(copy);
        const api = &connection.library.functions;
        const selection_atom = atom_for(connection, selection);
        _ = api.XSetSelectionOwner(connection.display, selection_atom, @backingInt(owner.id), xlib.current_time);
        const confirmed = api.XGetSelectionOwner(connection.display, selection_atom);
        if (confirmed != @backingInt(owner.id)) return error.SelectionUnavailable;
        if (self.text_storage) |old| self.allocator.free(old);
        self.text_storage = copy;
        self.selection = selection;
        try connection.flush();
    }

    /// Releases the owned text. The server keeps the selection until another client claims it.
    pub fn clear(self: *Clipboard) void {
        if (self.text_storage) |old| self.allocator.free(old);
        self.text_storage = null;
    }

    /// Asks the selection owner for UTF-8 text. The answer arrives as a
    /// selection_notified event; pass that event to `receive`.
    pub fn request_text(connection: *Connection, requestor: *const window.Window, selection: window.Selection) Error!void {
        const api = &connection.library.functions;
        _ = api.XConvertSelection(
            connection.display,
            atom_for(connection, selection),
            connection.atom(.UTF8_STRING),
            connection.atom(.ZDL_SELECTION_DATA),
            @backingInt(requestor.id),
            xlib.current_time,
        );
        try connection.flush();
    }

    /// Reads the converted text named by a selection_notified event. Returns
    /// null when the owner refused (property none) or sent a non-text type. An
    /// INCR answer is read to its end, waiting for each chunk. The caller owns
    /// the returned bytes and frees them with this allocator.
    pub fn receive(self: *Clipboard, connection: *Connection, requestor: *const window.Window, notified: Event.SelectionNotify) Error!?[]u8 {
        if (notified.property == .none) return null;
        const api = &connection.library.functions;
        const property: xlib.Atom = @intCast(@backingInt(notified.property));
        const target_window: xlib.Window = @intCast(@backingInt(requestor.id));
        var result: std.ArrayList(u8) = .empty;
        errdefer result.deinit(self.allocator);

        var actual_type: xlib.Atom = 0;
        var actual_format: c_int = 0;
        var item_count: c_ulong = 0;
        var bytes_after: c_ulong = 0;
        var data: ?[*]u8 = null;
        const status = api.XGetWindowProperty(connection.display, target_window, property, 0, 0, 0, xlib.any_property_type, &actual_type, &actual_format, &item_count, &bytes_after, &data);
        if (data) |pointer| _ = api.XFree(pointer);
        if (status != 0) return null;
        if (actual_type == connection.atom(.INCR)) {
            _ = api.XDeleteProperty(connection.display, target_window, property);
            try self.receive_incremental(connection, target_window, property, &result);
            return try result.toOwnedSlice(self.allocator);
        }

        var offset: c_long = 0;
        const chunk_units: c_long = 1 << 20;
        while (true) {
            actual_type = 0;
            actual_format = 0;
            item_count = 0;
            bytes_after = 0;
            data = null;
            const read = api.XGetWindowProperty(connection.display, target_window, property, offset, chunk_units, 0, xlib.any_property_type, &actual_type, &actual_format, &item_count, &bytes_after, &data);
            defer if (data) |pointer| {
                _ = api.XFree(pointer);
            };
            if (read != 0 or data == null) break;
            if (actual_type != connection.atom(.UTF8_STRING) and actual_type != xlib.xa_string) {
                _ = api.XDeleteProperty(connection.display, target_window, property);
                return null;
            }
            if (actual_format != 8) return error.SelectionDataUnsupported;
            try result.appendSlice(self.allocator, data.?[0..item_count]);
            if (bytes_after == 0) break;
            offset += @divExact(@as(c_long, @intCast(item_count)), 4);
        }
        _ = api.XDeleteProperty(connection.display, target_window, property);
        return try result.toOwnedSlice(self.allocator);
    }

    /// Reads INCR chunks until the zero-length chunk, appending them to `result`.
    /// Each chunk is announced by PropertyNotify NewValue on `property`; reading
    /// with delete set tells the owner to send the next one. Events that are not
    /// that notification are returned to the queue in their original order.
    fn receive_incremental(self: *Clipboard, connection: *Connection, target_window: xlib.Window, property: xlib.Atom, result: *std.ArrayList(u8)) Error!void {
        const api = &connection.library.functions;
        var deferred: std.ArrayList(Event) = .empty;
        defer {
            connection.restore_events(deferred.items) catch {};
            deferred.deinit(self.allocator);
        }
        while (true) {
            const event = (try connection.next_event_within(chunk_timeout_ms)) orelse return error.SelectionTimeout;
            const is_chunk = switch (event.payload) {
                .property_changed => |atom| @as(xlib.Atom, @intCast(@backingInt(atom))) == property and @as(xlib.Window, @intCast(@backingInt(event.window))) == target_window,
                else => false,
            };
            if (!is_chunk) {
                try deferred.append(self.allocator, event);
                continue;
            }
            var actual_type: xlib.Atom = 0;
            var actual_format: c_int = 0;
            var item_count: c_ulong = 0;
            var bytes_after: c_ulong = 0;
            var data: ?[*]u8 = null;
            const status = api.XGetWindowProperty(connection.display, target_window, property, 0, 1 << 20, 1, xlib.any_property_type, &actual_type, &actual_format, &item_count, &bytes_after, &data);
            defer if (data) |pointer| {
                _ = api.XFree(pointer);
            };
            if (status != 0) return error.SelectionDataUnsupported;
            if (item_count == 0) return;
            if (actual_format != 8) return error.SelectionDataUnsupported;
            try result.appendSlice(self.allocator, data.?[0..item_count]);
        }
    }

    /// Handles selection events for the owner side: drops text when the selection
    /// is taken away, answers conversion requests and sends the next INCR chunk
    /// when the requestor deletes the previous one. Returns true when the event
    /// was a selection event that this clipboard consumed.
    pub fn handle_event(self: *Clipboard, connection: *Connection, event: Event) Error!bool {
        switch (event.payload) {
            .selection_cleared => |selection| {
                if (@backingInt(selection) == atom_for(connection, self.selection)) self.clear();
                return true;
            },
            .selection_requested => |request| {
                try self.answer(connection, request);
                return true;
            },
            .property_deleted => |deleted| {
                const transfer = self.outgoing orelse return false;
                if (@as(xlib.Window, @intCast(@backingInt(event.window))) != transfer.requestor or
                    @as(xlib.Atom, @intCast(@backingInt(deleted))) != transfer.property) return false;
                try self.send_chunk(connection);
                return true;
            },
            else => return false,
        }
    }

    /// Writes the next INCR chunk; a zero-length chunk ends the transfer.
    fn send_chunk(self: *Clipboard, connection: *Connection) Error!void {
        var transfer = &self.outgoing.?;
        const api = &connection.library.functions;
        const remaining = transfer.data.len - transfer.offset;
        const count = @min(remaining, max_chunk_bytes);
        _ = api.XChangeProperty(connection.display, transfer.requestor, transfer.property, transfer.target, 8, xlib.prop_mode_replace, transfer.data.ptr + transfer.offset, @intCast(count));
        transfer.offset += count;
        if (count == 0) {
            self.allocator.free(transfer.data);
            self.outgoing = null;
        }
        try connection.flush();
    }

    /// Answers one SelectionRequest per ICCCM section 2.2 and sends SelectionNotify.
    fn answer(self: *Clipboard, connection: *Connection, request: Event.SelectionRequest) Error!void {
        const api = &connection.library.functions;
        const requestor: xlib.Window = @intCast(@backingInt(request.requestor));
        const selection_atom = @as(xlib.Atom, @intCast(@backingInt(request.selection)));
        const target = @as(xlib.Atom, @intCast(@backingInt(request.target)));
        // Obsolete clients send property None and expect the target name used as the property.
        var property = @as(xlib.Atom, @intCast(@backingInt(request.property)));
        if (property == 0) property = target;

        const owns = self.text_storage != null and selection_atom == atom_for(connection, self.selection);
        var answered: xlib.Atom = 0;
        if (owns and self.outgoing == null) {
            const content = self.text_storage.?;
            if (target == connection.atom(.TARGETS)) {
                var supported = [_]c_ulong{ connection.atom(.TARGETS), connection.atom(.UTF8_STRING), xlib.xa_string, connection.atom(.TEXT) };
                _ = api.XChangeProperty(connection.display, requestor, property, xlib.xa_atom, 32, xlib.prop_mode_replace, @ptrCast(&supported), supported.len);
                answered = property;
            } else if (target == connection.atom(.UTF8_STRING)) {
                answered = try self.offer(connection, requestor, property, target, content, false);
            } else if (target == xlib.xa_string or target == connection.atom(.TEXT)) {
                answered = try self.offer(connection, requestor, property, target, content, true);
            }
        }

        var event: xlib.Event = undefined;
        @memset(std.mem.asBytes(&event), 0);
        event.selection.header.kind = xlib.selection_notify;
        event.selection.header.display = connection.display;
        event.selection.header.window = requestor;
        event.selection.selection = selection_atom;
        event.selection.target = target;
        event.selection.property = answered;
        event.selection.time = @intCast(request.timestamp);
        _ = api.XSendEvent(connection.display, requestor, 0, 0, &event);
        try connection.flush();
    }

    /// Stores `content` on the requestor's property, directly or as an INCR
    /// transfer, and returns the property name (none when the write failed).
    /// `ascii` replaces bytes at or above 0x80 with '?', as STRING requires.
    fn offer(self: *Clipboard, connection: *Connection, requestor: xlib.Window, property: xlib.Atom, target: xlib.Atom, content: []const u8, ascii: bool) Error!xlib.Atom {
        const api = &connection.library.functions;
        const bytes = try self.allocator.alloc(u8, content.len);
        errdefer self.allocator.free(bytes);
        for (content, bytes) |byte, *out| out.* = if (ascii and byte >= 0x80) '?' else byte;

        if (bytes.len <= max_chunk_bytes) {
            defer self.allocator.free(bytes);
            _ = api.XChangeProperty(connection.display, requestor, property, target, 8, xlib.prop_mode_replace, bytes.ptr, @intCast(bytes.len));
            return property;
        }
        // INCR: announce the total size, then stream chunks as the requestor deletes each one.
        var total = [_]c_long{@intCast(bytes.len)};
        _ = api.XSelectInput(connection.display, requestor, xlib.property_change_mask);
        _ = api.XChangeProperty(connection.display, requestor, property, connection.atom(.INCR), 32, xlib.prop_mode_replace, @ptrCast(&total), 1);
        self.outgoing = .{ .requestor = requestor, .property = property, .target = target, .data = bytes, .offset = 0 };
        return property;
    }
};

fn atom_for(connection: *const Connection, selection: window.Selection) xlib.Atom {
    return switch (selection) {
        .clipboard => connection.atom(.CLIPBOARD),
        .primary => connection.atom(.PRIMARY),
    };
}
