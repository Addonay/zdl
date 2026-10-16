//! Disposable editor controller. Mutable document access goes through Registry;
//! frame source/layout/image publish together. No native callbacks live here.
const std = @import("std");
const zdl = @import("zdl");
const p = @import("../paragraph/paragraph.zig");
const d = zdl.text.document;
const r = zdl.text.registry;
pub const Error = r.Error || p.Error || error{ PendingPublication, InvalidCaret, UnsupportedParagraph, ProjectionMismatch };
pub const Session = struct {
    allocator: std.mem.Allocator,
    library: *p.Library,
    registry: *r.Registry,
    handle: r.Handle,
    font: [:0]u8,
    desired_width: u16,
    source: ?d.Snapshot = null,
    layout: ?p.Snapshot = null,
    image: ?p.Image = null,
    cursor: p.Cursor = .{ .index = 0 },
    strong: bool = true,
    needs_refresh: bool = true,
    preedit: []const u8 = &.{},
    composition_base: ?d.Revision = null,
    pub fn init(allocator: std.mem.Allocator, library: *p.Library, registry: *r.Registry, handle: r.Handle, width: u16) Error!Session {
        const font = try allocator.dupeSentinel(u8, "Liberation Sans 20", 0);
        var result: Session = .{ .allocator = allocator, .library = library, .registry = registry, .handle = handle, .font = font, .desired_width = width };
        errdefer result.deinit();
        try result.refresh();
        return result;
    }
    pub fn deinit(self: *Session) void {
        if (self.image) |*image| image.deinit();
        if (self.layout) |*layout| layout.deinit();
        if (self.source) |*source| source.deinit();
        self.allocator.free(self.preedit);
        self.allocator.free(self.font);
        self.* = undefined;
    }
    fn paragraph_text(text: []const u8) Error!void {
        if (std.mem.indexOfScalar(u8, text, 0) != null) return error.EmbeddedNul;
        if (std.mem.indexOfAny(u8, text, "\r\n") != null) return error.UnsupportedParagraph;
    }
    fn raw_cursor(layout: *const p.Snapshot, selection: d.Selection) Error!p.Cursor {
        if (!layout.is_stop(selection.active_byte) or !layout.is_stop(selection.anchor_byte)) return error.InvalidCaret;
        if (selection.active_affinity.line == .upstream) if (layout.adjacent_stop(selection.active_byte, false)) |previous| {
            return .{ .index = previous, .trailing = std.unicode.utf8CountCodepoints(layout.text[previous..selection.active_byte]) catch return error.InvalidUtf8 };
        };
        return .{ .index = selection.active_byte };
    }
    fn decoration(selection: d.Selection, cursor: p.Cursor) p.Decoration {
        return .{ .selection = .{ .start = @min(selection.anchor_byte, selection.active_byte), .end = @max(selection.anchor_byte, selection.active_byte) }, .cursor = cursor, .strong = selection.active_affinity.bidi == .strong };
    }
    /// Rebuilds presentation only. Retrying this after a committed operation
    /// never repeats the edit. Failure retains the complete prior frame.
    pub fn refresh(self: *Session) Error!void {
        errdefer self.needs_refresh = true;
        var fresh = try self.registry.snapshot(self.handle);
        errdefer fresh.deinit();
        try paragraph_text(fresh.text());
        const rebuild = self.layout == null or self.layout.?.width != self.desired_width or !std.mem.eql(u8, self.layout.?.text, fresh.text());
        if (rebuild) {
            var layout = try p.Snapshot.init(self.allocator, self.library, fresh.text(), .{ .width_px = self.desired_width, .font = self.font });
            errdefer layout.deinit();
            const cursor = try raw_cursor(&layout, fresh.selection());
            const image = try layout.rasterize_decorated(decoration(fresh.selection(), cursor));
            self.adopt(fresh, layout, image, cursor);
        } else {
            const cursor = try raw_cursor(&self.layout.?, fresh.selection());
            const image = try self.layout.?.rasterize_decorated(decoration(fresh.selection(), cursor));
            self.image.?.deinit();
            self.source.?.deinit();
            self.image = image;
            self.source = fresh;
            self.cursor = cursor;
            self.strong = fresh.selection().active_affinity.bidi == .strong;
            self.needs_refresh = false;
        }
    }
    fn adopt(self: *Session, source: d.Snapshot, layout: p.Snapshot, image: p.Image, cursor: p.Cursor) void {
        if (self.image) |*old| old.deinit();
        if (self.layout) |*old| old.deinit();
        if (self.source) |*old| old.deinit();
        self.source = source;
        self.layout = layout;
        self.image = image;
        self.cursor = cursor;
        self.strong = source.selection().active_affinity.bidi == .strong;
        self.needs_refresh = false;
    }
    pub fn resize(self: *Session, width: u16) Error!void {
        self.desired_width = width;
        try self.refresh();
    }
    fn target(self: *Session) Error!r.Target {
        if (self.needs_refresh) return error.PendingPublication;
        var current = try self.registry.snapshot(self.handle);
        defer current.deinit();
        const expected = self.source.?.revision();
        if (current.revision().document != expected.document or current.revision().value != expected.value) {
            self.needs_refresh = true;
            return error.StaleRevision;
        }
        return .{ .registration = self.handle, .revision = self.source.?.revision() };
    }
    fn replace(self: *Session, range: d.Range, input: []const u8, origin: d.Origin) Error!void {
        var target_value = try self.target();
        if (self.composition_base) |base| {
            if (base.document != target_value.revision.document or base.value != target_value.revision.value) return error.StaleRevision;
            target_value.revision = base;
        }
        try paragraph_text(input);
        const old = self.source.?.text();
        const length = std.math.add(usize, old.len - (range.end_byte - range.start_byte), input.len) catch return error.TextLimit;
        if (length > 1024 * 1024) return error.TextLimit;
        const prospective = try self.allocator.alloc(u8, length);
        defer self.allocator.free(prospective);
        @memcpy(prospective[0..range.start_byte], old[0..range.start_byte]);
        @memcpy(prospective[range.start_byte..][0..input.len], input);
        @memcpy(prospective[range.start_byte + input.len ..], old[range.end_byte..]);
        var layout = try p.Snapshot.init(self.allocator, self.library, prospective, .{ .width_px = self.desired_width, .font = self.font });
        errdefer layout.deinit();
        const requested = range.start_byte + input.len;
        var caret = requested;
        if (!layout.is_stop(caret)) caret = layout.adjacent_stop(caret, true) orelse return error.InvalidCaret;
        const selection = d.Selection.caret(caret);
        const cursor: p.Cursor = .{ .index = caret };
        var image = try layout.rasterize_decorated(decoration(selection, cursor));
        errdefer image.deinit();
        var result = try self.registry.replace(target_value, range, input, .{ .selection_after = selection, .origin = origin });
        self.needs_refresh = true;
        if (!std.mem.eql(u8, result.snapshot.text(), prospective)) {
            result.deinit();
            return error.ProjectionMismatch;
        }
        // Move the owning result snapshot; no fallible presentation work follows.
        self.adopt(result.snapshot, layout, image, cursor);
        self.cancel_composition();
    }
    /// Only committed text_input reaches this path; keydown never synthesizes
    /// printable characters. This prototype deliberately supports one paragraph.
    pub fn commit_text(self: *Session, input: []const u8) Error!void {
        const selection = self.source.?.selection();
        try self.replace(.{ .start_byte = @min(selection.anchor_byte, selection.active_byte), .end_byte = @max(selection.anchor_byte, selection.active_byte) }, input, if (self.composition_base != null) .composition else .typing);
    }
    pub fn erase(self: *Session, forward: bool) Error!void {
        _ = try self.target();
        if (self.preedit.len != 0) return;
        self.cancel_composition();
        const selection = self.source.?.selection();
        var first = @min(selection.anchor_byte, selection.active_byte);
        var end = @max(selection.anchor_byte, selection.active_byte);
        if (first == end) {
            if (forward) end = self.layout.?.adjacent_stop(end, true) orelse return else first = self.layout.?.adjacent_stop(first, false) orelse return;
        }
        try self.replace(.{ .start_byte = first, .end_byte = end }, "", .deletion);
    }
    fn select(self: *Session, selection: d.Selection, cursor: p.Cursor) Error!void {
        const observed = try self.target();
        var image = try self.layout.?.rasterize_decorated(decoration(selection, cursor));
        errdefer image.deinit();
        const source = try self.registry.set_selection(observed, selection);
        self.image.?.deinit();
        self.source.?.deinit();
        self.image = image;
        self.source = source;
        self.cursor = cursor;
        self.strong = selection.active_affinity.bidi == .strong;
    }
    fn affinity(self: *const Session, cursor: p.Cursor, strong: bool) Error!d.Affinity {
        const byte = try self.layout.?.byte_offset(cursor);
        const boxes = try self.layout.?.carets(byte);
        const leading = if (strong) boxes.strong else boxes.weak;
        const actual = try self.layout.?.cursor_rect(cursor, strong);
        return .{ .line = if (actual.y < leading.y) .upstream else .downstream, .bidi = if (strong) .strong else .weak };
    }
    fn selected(self: *Session, cursor: p.Cursor, strong: bool, extend: bool) Error!void {
        var selection = self.source.?.selection();
        selection.active_byte = try self.layout.?.byte_offset(cursor);
        selection.active_affinity = try self.affinity(cursor, strong);
        if (!extend) {
            selection.anchor_byte = selection.active_byte;
            selection.anchor_affinity = selection.active_affinity;
        }
        try self.select(selection, cursor);
    }
    pub fn move(self: *Session, right: bool, extend: bool) Error!void {
        _ = try self.target();
        if (self.preedit.len != 0) return;
        self.cancel_composition();
        const selection = self.source.?.selection();
        if (!extend and selection.anchor_byte != selection.active_byte) {
            var anchor_selection = selection;
            anchor_selection.active_byte = selection.anchor_byte;
            anchor_selection.active_affinity = selection.anchor_affinity;
            const anchor = try raw_cursor(&self.layout.?, anchor_selection);
            const a = try self.layout.?.cursor_rect(anchor, selection.anchor_affinity.bidi == .strong);
            const b = try self.layout.?.cursor_rect(self.cursor, self.strong);
            const anchor_first = a.y < b.y or (a.y == b.y and a.x < b.x);
            if (anchor_first != right) try self.selected(anchor, selection.anchor_affinity.bidi == .strong, false) else try self.selected(self.cursor, self.strong, false);
            return;
        }
        if (try self.layout.?.move(self.cursor, right, self.strong)) |next| try self.selected(next, self.strong, extend);
    }
    pub fn select_all(self: *Session) Error!void {
        _ = try self.target();
        self.cancel_composition();
        try self.select(.{ .anchor_byte = 0, .active_byte = self.source.?.text().len }, .{ .index = self.source.?.text().len });
    }
    pub fn hit(self: *Session, x: f64, y: f64, extend: bool) Error!void {
        _ = try self.target();
        self.cancel_composition();
        const hit_value = try self.layout.?.hit_test(x, y);
        const strong = try self.layout.?.cursor_rect(hit_value.cursor, true);
        const weak = try self.layout.?.cursor_rect(hit_value.cursor, false);
        const a = @abs(strong.x - x) + @abs(strong.y - y);
        const b = @abs(weak.x - x) + @abs(weak.y - y);
        try self.selected(hit_value.cursor, a <= b, extend);
    }
    pub fn history(self: *Session, backwards: bool) Error!void {
        const observed = try self.target();
        self.cancel_composition();
        var source = if (backwards) try self.registry.undo(observed) else try self.registry.redo(observed);
        defer source.deinit();
        self.needs_refresh = true;
        try self.refresh();
    }
    pub fn set_preedit(self: *Session, input: []const u8) Error!void {
        _ = try self.target();
        if (input.len > 4096) return error.TextLimit;
        if (!std.unicode.utf8ValidateSlice(input)) return error.InvalidUtf8;
        try paragraph_text(input);
        const copied = try self.allocator.dupe(u8, input);
        self.allocator.free(self.preedit);
        self.preedit = copied;
        if (input.len != 0 and self.composition_base == null) self.composition_base = self.source.?.revision();
    }
    pub fn cancel_composition(self: *Session) void {
        self.allocator.free(self.preedit);
        self.preedit = &.{};
        self.composition_base = null;
    }
};
