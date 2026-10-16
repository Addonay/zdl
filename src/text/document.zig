//! Application-owned contiguous UTF-8 documents with revision-checked batches,
//! immutable snapshots and bounded grouped undo/redo. Owner-thread only.
//! Ranges are byte/scalar boundaries, not grapheme/word/visual navigation.
const std = @import("std");
const identity = @import("../core/identity.zig");
pub const Error = std.mem.Allocator.Error || error{
    DomainExhausted,
    Closed,
    ForeignDocument,
    StaleRevision,
    RevisionExhausted,
    GroupExhausted,
    StaleGroup,
    ReferenceLimit,
    InvalidUtf8,
    EmbeddedNul,
    InvalidRange,
    InvalidSelection,
    OverlappingEdits,
    EmptyEdit,
    TextLimit,
    EditLimit,
    HistoryLimit,
    ReadOnly,
    NoUndo,
    NoRedo,
    InvalidOptions,
};
pub const DocumentId = enum(u64) { _ };
/// Expected document and complete state revision, including selection changes.
pub const Revision = struct { document: DocumentId, value: u64 };
pub const Range = struct { start_byte: usize, end_byte: usize };
pub const LineAffinity = enum { upstream, downstream };
pub const BidiAffinity = enum { strong, weak };
/// Layout-independent intent retained across edits/history. Providers resolve
/// it at a specific layout revision; byte offsets alone cannot encode it.
pub const Affinity = struct {
    line: LineAffinity = .downstream,
    bidi: BidiAffinity = .strong,
    /// Exact line/bidi intent equality; no layout resolution is performed.
    pub fn eql(a: Affinity, b: Affinity) bool {
        return a.line == b.line and a.bidi == b.bidi;
    }
};
pub const Selection = struct {
    anchor_byte: usize,
    active_byte: usize,
    anchor_affinity: Affinity = .{},
    active_affinity: Affinity = .{},
    /// Collapsed byte selection; validation occurs against a document version.
    pub fn caret(byte: usize) Selection {
        return .{ .anchor_byte = byte, .active_byte = byte };
    }
    /// Exact endpoint/affinity equality, preserving selection direction.
    pub fn eql(a: Selection, b: Selection) bool {
        return a.anchor_byte == b.anchor_byte and a.active_byte == b.active_byte and
            a.anchor_affinity.eql(b.anchor_affinity) and a.active_affinity.eql(b.active_affinity);
    }
};
pub const Replacement = struct { range: Range, text: []const u8 };
pub const Newlines = enum { preserve, lf };
pub const NulPolicy = enum { reject, preserve };
pub const Origin = enum { typing, paste, cut, deletion, composition, programmatic };
pub const Group = struct { document: DocumentId, serial: u64 };
pub const Options = struct {
    max_bytes: usize = 1024 * 1024,
    max_edits: usize = 4096,
    max_history_entries: usize = 256,
    max_history_bytes: usize = 8 * 1024 * 1024,
    newlines: Newlines = .preserve,
    nul: NulPolicy = .reject,
    read_only: bool = false,
    /// Offsets refer to normalized initial text. Null starts at the end.
    initial_selection: ?Selection = null,
};
pub const EditOptions = struct {
    /// Offsets in the resulting normalized text; null collapses to the end of
    /// the last replacement. Anchor/active direction is preserved explicitly.
    selection_after: ?Selection = null,
    origin: Origin = .programmatic,
    group: ?Group = null,
    /// False explicitly discards history for a text change. Disabled document
    /// history (a zero limit) has the same behavior. Oversized recorded groups
    /// otherwise fail atomically with HistoryLimit; they are not silently lost.
    record_history: bool = true,
};
pub const HistoryStatus = enum { none, recorded, coalesced };

fn boundary(text: []const u8, offset: usize) bool {
    return offset <= text.len and (offset == text.len or text[offset] & 0xc0 != 0x80);
}
fn valid_selection(text: []const u8, selection: Selection) bool {
    return boundary(text, selection.anchor_byte) and boundary(text, selection.active_byte);
}
fn normalized_length(text: []const u8, policy: Newlines) usize {
    var length = text.len;
    if (policy == .lf) {
        var i: usize = 0;
        while (i < text.len) : (i += 1) if (text[i] == '\r' and i + 1 < text.len and text[i + 1] == '\n') {
            length -= 1;
            i += 1;
        };
    }
    return length;
}
fn write_normalized(destination: []u8, text: []const u8, policy: Newlines) usize {
    if (policy == .preserve) {
        @memcpy(destination[0..text.len], text);
        return text.len;
    }
    var output: usize = 0;
    var i: usize = 0;
    while (i < text.len) : (i += 1) {
        if (text[i] == '\r') {
            destination[output] = '\n';
            if (i + 1 < text.len and text[i + 1] == '\n') i += 1;
        } else destination[output] = text[i];
        output += 1;
    }
    return output;
}
const Data = struct {
    allocator: std.mem.Allocator,
    references: usize = 1,
    bytes: []u8,
    fn create(allocator: std.mem.Allocator, length: usize) Error!*Data {
        const result = try allocator.create(Data);
        errdefer allocator.destroy(result);
        const bytes = try allocator.alloc(u8, length);
        result.* = .{ .allocator = allocator, .bytes = bytes };
        return result;
    }
    fn retain(self: *Data) Error!void {
        if (self.references == std.math.maxInt(usize)) return error.ReferenceLimit;
        self.references += 1;
    }
    fn release(self: *Data) void {
        self.references -= 1;
        if (self.references == 0) {
            const allocator = self.allocator;
            allocator.free(self.bytes);
            allocator.destroy(self);
        }
    }
};
const State = struct { data: *Data, selection: Selection };
const Version = struct {
    allocator: std.mem.Allocator,
    references: usize = 1,
    revision: Revision,
    state: State,
    fn create(allocator: std.mem.Allocator, revision: Revision, state: State) Error!*Version {
        const result = try allocator.create(Version);
        errdefer allocator.destroy(result);
        try state.data.retain();
        result.* = .{ .allocator = allocator, .revision = revision, .state = state };
        return result;
    }
    fn release(self: *Version) void {
        self.references -= 1;
        if (self.references == 0) {
            const allocator = self.allocator;
            self.state.data.release();
            allocator.destroy(self);
        }
    }
};
/// Owning immutable view; text borrows this reference. Retain for another owner.
/// May outlive Document; its allocator must outlive every retained reference.
pub const Snapshot = struct {
    version: *Version,
    /// Creates an independent owning reference on the document owner thread.
    pub fn retain(self: Snapshot) Error!Snapshot {
        if (self.version.references == std.math.maxInt(usize)) return error.ReferenceLimit;
        self.version.references += 1;
        return self;
    }
    /// Releases this reference; do not deinitialize shallow ownership copies.
    pub fn deinit(self: *Snapshot) void {
        self.version.release();
        self.* = undefined;
    }
    /// Historical document/revision token, suitable for optimistic edits.
    pub fn revision(self: Snapshot) Revision {
        return self.version.revision;
    }
    /// UTF-8 bytes borrowing this snapshot, including NUL only if opted in.
    pub fn text(self: Snapshot) []const u8 {
        return self.version.state.data.bytes;
    }
    /// Directional byte selection from the same immutable version.
    pub fn selection(self: Snapshot) Selection {
        return self.version.state.selection;
    }
};
/// Owning result. Unchanged no-op edits return the current revision and history.
pub const EditResult = struct {
    snapshot: Snapshot,
    changed: bool,
    text_changed: bool,
    history: HistoryStatus,
    /// Releases the owning result snapshot.
    pub fn deinit(self: *EditResult) void {
        self.snapshot.deinit();
        self.* = undefined;
    }
};
const Record = struct {
    before: State,
    after: State,
    group: ?u64,
    origin: Origin,
    cost: usize,
    fn create(before: State, after: State, group: ?u64, origin: Origin) Error!Record {
        const cost = std.math.add(usize, before.data.bytes.len, after.data.bytes.len) catch return error.HistoryLimit;
        try before.data.retain();
        errdefer before.data.release();
        try after.data.retain();
        return .{ .before = before, .after = after, .group = group, .origin = origin, .cost = cost };
    }
    fn release(self: Record) void {
        self.before.data.release();
        self.after.data.release();
    }
};
fn release_records(records: *std.ArrayList(Record)) void {
    for (records.items) |record| record.release();
    records.clearRetainingCapacity();
}
/// Owns text/history, not application domain state. Movable when unborrowed;
/// live document registrations require a stable address until they end.
/// No callbacks, clock reads, hidden threads, Unicode normalization or providers.
pub const Document = struct {
    allocator: std.mem.Allocator,
    options: Options,
    id: DocumentId,
    current: ?*Version,
    undo_records: std.ArrayList(Record) = .empty,
    redo_records: std.ArrayList(Record) = .empty,
    history_bytes: usize = 0,
    active_group: ?u64 = null,
    next_group: u64 = 1,

    /// Copies/validates initial text and publishes revision zero.
    pub fn init(allocator: std.mem.Allocator, text: []const u8, options: Options) Error!Document {
        if (options.max_edits == 0) return error.InvalidOptions;
        const raw_limit = if (options.newlines == .lf) options.max_bytes *| 2 else options.max_bytes;
        if (text.len > raw_limit) return error.TextLimit;
        if (!std.unicode.utf8ValidateSlice(text)) return error.InvalidUtf8;
        if (options.nul == .reject and std.mem.indexOfScalar(u8, text, 0) != null) return error.EmbeddedNul;
        const length = normalized_length(text, options.newlines);
        if (length > options.max_bytes) return error.TextLimit;
        const data = try Data.create(allocator, length);
        defer data.release();
        _ = write_normalized(data.bytes, text, options.newlines);
        const selection = options.initial_selection orelse Selection.caret(length);
        if (!valid_selection(data.bytes, selection)) return error.InvalidSelection;
        const id: DocumentId = @fromBackingInt(@backingInt(try identity.issue_domain()));
        const version = try Version.create(allocator, .{ .document = id, .value = 0 }, .{ .data = data, .selection = selection });
        return .{ .allocator = allocator, .options = options, .id = id, .current = version };
    }
    /// Allocation-free/idempotent invalidation; snapshots keep historical text.
    pub fn close(self: *Document) void {
        const current = self.current orelse return;
        self.current = null;
        self.active_group = null;
        release_records(&self.undo_records);
        release_records(&self.redo_records);
        self.history_bytes = 0;
        current.release();
    }
    /// Closes and releases owned text/history. Retained snapshots remain alive.
    pub fn deinit(self: *Document) void {
        self.close();
        self.undo_records.deinit(self.allocator);
        self.redo_records.deinit(self.allocator);
        self.* = undefined;
    }
    /// Retains the current immutable version; caller deinitializes the result.
    pub fn snapshot(self: *const Document) Error!Snapshot {
        return (Snapshot{ .version = self.current orelse return error.Closed }).retain();
    }
    /// Current expected-revision token without creating a snapshot lease.
    pub fn current_revision(self: *const Document) Error!Revision {
        return (self.current orelse return error.Closed).revision;
    }
    /// Copies the current directional byte selection without retaining text.
    pub fn current_selection(self: *const Document) Error!Selection {
        return (self.current orelse return error.Closed).state.selection;
    }
    /// Current edit policy; it is independent of immutable historical text.
    pub fn is_read_only(self: *const Document) Error!bool {
        if (self.current == null) return error.Closed;
        return self.options.read_only;
    }
    fn validate(self: *const Document, revision: Revision) Error!*Version {
        const current = self.current orelse return error.Closed;
        if (revision.document != self.id) return error.ForeignDocument;
        if (revision.value != current.revision.value) return error.StaleRevision;
        return current;
    }
    fn next_revision(self: *const Document, current: *const Version) Error!Revision {
        if (current.revision.value == std.math.maxInt(u64)) return error.RevisionExhausted;
        return .{ .document = self.id, .value = current.revision.value + 1 };
    }
    fn publish(self: *Document, version: *Version) Snapshot {
        const old = self.current.?;
        version.references = 2; // Document and returned owning result.
        self.current = version;
        old.release();
        return .{ .version = version };
    }
    /// Changes edit/undo/redo permission without altering text or selection.
    pub fn set_read_only(self: *Document, read_only: bool) Error!void {
        if (self.current == null) return error.Closed;
        self.options.read_only = read_only;
    }
    /// Explicit semantic grouping; no time-based typing heuristic is hidden here.
    pub fn begin_group(self: *Document) Error!Group {
        if (self.current == null) return error.Closed;
        if (self.next_group == std.math.maxInt(u64)) return error.GroupExhausted;
        const serial = self.next_group;
        self.next_group += 1;
        self.active_group = serial;
        return .{ .document = self.id, .serial = serial };
    }
    /// Ends this active group token; stale/foreign tokens fail.
    pub fn end_group(self: *Document, group: Group) Error!void {
        if (self.current == null) return error.Closed;
        if (group.document != self.id or self.active_group != group.serial) return error.StaleGroup;
        self.active_group = null;
    }
    /// Bounded logical full-buffer accounting for both history stacks.
    pub fn history_usage(self: *const Document) Error!struct { undo_groups: usize, redo_groups: usize, logical_bytes: usize } {
        if (self.current == null) return error.Closed;
        return .{ .undo_groups = self.undo_records.items.len, .redo_groups = self.redo_records.items.len, .logical_bytes = self.history_bytes };
    }
    /// Allocation-free history release; ends grouping without editing text.
    pub fn clear_history(self: *Document) Error!void {
        if (self.current == null) return error.Closed;
        release_records(&self.undo_records);
        release_records(&self.redo_records);
        self.history_bytes = 0;
        self.active_group = null;
    }
    /// Selection-only publication does not create history or clear redo, but
    /// ends grouping and advances revision when anchor/active actually change.
    pub fn set_selection(self: *Document, base: Revision, selection: Selection) Error!Snapshot {
        const old = try self.validate(base);
        if (!valid_selection(old.state.data.bytes, selection)) return error.InvalidSelection;
        if (old.state.selection.eql(selection)) return self.snapshot();
        const version = try Version.create(self.allocator, try self.next_revision(old), .{ .data = old.state.data, .selection = selection });
        self.active_group = null;
        return self.publish(version);
    }
    /// Single-range convenience over the identical batch transaction path.
    pub fn replace(self: *Document, base: Revision, range: Range, inserted: []const u8, options: EditOptions) Error!EditResult {
        return self.apply(base, &.{.{ .range = range, .text = inserted }}, options);
    }
    /// All ranges use the same base text and must be ordered/non-overlapping.
    /// Equal-position empty insertions concatenate in input order. Nothing is
    /// published until text, selection, history and allocations are validated.
    pub fn apply(self: *Document, base: Revision, edits: []const Replacement, options: EditOptions) Error!EditResult {
        const old = try self.validate(base);
        if (self.options.read_only) return error.ReadOnly;
        if (edits.len == 0) return error.EmptyEdit;
        if (edits.len > self.options.max_edits) return error.EditLimit;
        if (options.group) |group| if (group.document != self.id or self.active_group != group.serial) return error.StaleGroup;
        const revision = try self.next_revision(old);
        const source = old.state.data.bytes;
        var length = source.len;
        var end: usize = 0;
        var raw_bytes: usize = 0;
        for (edits) |edit| {
            if (edit.range.start_byte > edit.range.end_byte or !boundary(source, edit.range.start_byte) or !boundary(source, edit.range.end_byte)) return error.InvalidRange;
            if (edit.range.start_byte < end) return error.OverlappingEdits;
            end = edit.range.end_byte;
            raw_bytes = std.math.add(usize, raw_bytes, edit.text.len) catch return error.TextLimit;
            const raw_limit = if (self.options.newlines == .lf) self.options.max_bytes *| 2 else self.options.max_bytes;
            if (raw_bytes > raw_limit) return error.TextLimit;
            if (!std.unicode.utf8ValidateSlice(edit.text)) return error.InvalidUtf8;
            if (self.options.nul == .reject and std.mem.indexOfScalar(u8, edit.text, 0) != null) return error.EmbeddedNul;
            length -= edit.range.end_byte - edit.range.start_byte;
            length = std.math.add(usize, length, normalized_length(edit.text, self.options.newlines)) catch return error.TextLimit;
        }
        if (length > self.options.max_bytes) return error.TextLimit;
        const data = try Data.create(self.allocator, length);
        defer data.release();
        var input: usize = 0;
        var output: usize = 0;
        var caret: usize = 0;
        for (edits) |edit| {
            const gap = source[input..edit.range.start_byte];
            @memcpy(data.bytes[output..][0..gap.len], gap);
            output += gap.len;
            output += write_normalized(data.bytes[output..], edit.text, self.options.newlines);
            caret = output;
            input = edit.range.end_byte;
        }
        @memcpy(data.bytes[output..], source[input..]);
        const selection = options.selection_after orelse Selection.caret(caret);
        if (!valid_selection(data.bytes, selection)) return error.InvalidSelection;
        const text_changed = !std.mem.eql(u8, source, data.bytes);
        if (!text_changed) {
            const same = old.state.selection.eql(selection);
            return .{ .snapshot = try self.set_selection(base, selection), .changed = !same, .text_changed = false, .history = .none };
        }
        const after: State = .{ .data = data, .selection = selection };
        const version = try Version.create(self.allocator, revision, after);
        errdefer version.release();
        const recording = options.record_history and self.options.max_history_entries != 0 and self.options.max_history_bytes != 0;
        var record: ?Record = null;
        errdefer if (record) |owned| owned.release();
        var status: HistoryStatus = .none;
        var first_kept: usize = 0;
        var base_count: usize = 0;
        var kept_bytes: usize = 0;
        if (recording) {
            const group = if (options.group) |g| g.serial else null;
            const last = if (self.undo_records.items.len != 0) self.undo_records.items[self.undo_records.items.len - 1] else null;
            const coalesce = group != null and last != null and last.?.group == group and last.?.origin == options.origin and last.?.after.data == old.state.data;
            base_count = self.undo_records.items.len - @as(usize, @intFromBool(coalesce));
            record = try Record.create(if (coalesce) last.?.before else old.state, after, group, options.origin);
            if (record.?.cost > self.options.max_history_bytes) return error.HistoryLimit;
            for (self.undo_records.items[0..base_count]) |item| kept_bytes += item.cost;
            while (base_count - first_kept + 1 > self.options.max_history_entries or kept_bytes > self.options.max_history_bytes - record.?.cost) {
                kept_bytes -= self.undo_records.items[first_kept].cost;
                first_kept += 1;
            }
            try self.undo_records.ensureTotalCapacity(self.allocator, base_count - first_kept + 1);
            status = if (coalesce) .coalesced else .recorded;
        }
        // No fallible work follows. Old snapshots retain their own version/data.
        release_records(&self.redo_records);
        if (record) |owned| {
            if (status == .coalesced) {
                self.undo_records.items[self.undo_records.items.len - 1].release();
                self.undo_records.items.len -= 1;
            }
            for (self.undo_records.items[0..first_kept]) |item| item.release();
            const kept = base_count - first_kept;
            std.mem.copyForwards(Record, self.undo_records.items[0..kept], self.undo_records.items[first_kept..base_count]);
            self.undo_records.items.len = kept;
            self.undo_records.appendAssumeCapacity(owned);
            self.history_bytes = kept_bytes + owned.cost;
        } else {
            release_records(&self.undo_records);
            self.history_bytes = 0;
        }
        if (options.group == null or !recording) self.active_group = null;
        return .{ .snapshot = self.publish(version), .changed = true, .text_changed = true, .history = status };
    }
    fn travel(self: *Document, base: Revision, backwards: bool) Error!Snapshot {
        const old = try self.validate(base);
        if (self.options.read_only) return error.ReadOnly;
        const from = if (backwards) &self.undo_records else &self.redo_records;
        const to = if (backwards) &self.redo_records else &self.undo_records;
        if (from.items.len == 0) return if (backwards) error.NoUndo else error.NoRedo;
        const record = from.items[from.items.len - 1];
        const target = if (backwards) record.before else record.after;
        const version = try Version.create(self.allocator, try self.next_revision(old), target);
        errdefer version.release();
        try to.ensureUnusedCapacity(self.allocator, 1);
        from.items.len -= 1;
        to.appendAssumeCapacity(record);
        self.active_group = null;
        return self.publish(version);
    }
    /// Restores the previous edit group under a fresh monotonic revision.
    pub fn undo(self: *Document, base: Revision) Error!Snapshot {
        return self.travel(base, true);
    }
    /// Reapplies an undone group under a fresh monotonic revision.
    pub fn redo(self: *Document, base: Revision) Error!Snapshot {
        return self.travel(base, false);
    }
};

test "document revision group and reference exhaustion never wrap or publish" {
    const t = std.testing;
    var doc = try Document.init(t.allocator, "x", .{});
    defer doc.deinit();
    const version = doc.current.?;
    version.revision.value = std.math.maxInt(u64);
    try t.expectError(error.RevisionExhausted, doc.replace(try doc.current_revision(), .{ .start_byte = 0, .end_byte = 1 }, "y", .{}));
    try t.expectError(error.RevisionExhausted, doc.set_selection(try doc.current_revision(), Selection.caret(0)));
    version.revision.value = 0;
    doc.next_group = std.math.maxInt(u64);
    try t.expectError(error.GroupExhausted, doc.begin_group());
    version.references = std.math.maxInt(usize);
    try t.expectError(error.ReferenceLimit, doc.snapshot());
    version.references = 1;
    version.state.data.references = std.math.maxInt(usize);
    try t.expectError(error.ReferenceLimit, doc.set_selection(try doc.current_revision(), Selection.caret(0)));
    try t.expectError(error.ReferenceLimit, doc.replace(try doc.current_revision(), .{ .start_byte = 0, .end_byte = 1 }, "y", .{}));
    version.state.data.references = 1;
    try t.expectEqual(@as(u64, 0), (try doc.current_revision()).value);
    try t.expectEqual(@as(usize, 0), (try doc.history_usage()).undo_groups);
}
