//! File chooser through `org.freedesktop.portal.FileChooser` (ports
//! `SDL_portaldialog.c`).
//!
//! `show` calls OpenFile or SaveFile and returns a `Pending` that holds the
//! portal request path. `Pending.wait` then waits for the matching `Response`
//! signal, decodes its `uris` into local paths, and returns the `Outcome`.
//!
//! Deliberate differences from SDL:
//! - The match rule is added before the call, so the Response cannot be missed
//!   between reply and match registration (SDL has a TODO for this race).
//! - `wait` discards unrelated messages received while it blocks. libdbus has
//!   no way to put a popped message back, and SDL's callback model does not
//!   have this constraint. Use a separate connection if those messages matter.
//! - Response 1 (cancelled) and 2 (other) both map to `Outcome.cancelled`;
//!   other non-zero responses are `error.DialogFailed`.

const std = @import("std");
const linux = std.os.linux;
const Allocator = std.mem.Allocator;
const dialog = @import("dialog.zig");
const connection = @import("../linux/dbus/connection.zig");
const desktop = @import("../linux/dbus/desktop.zig");
const message = @import("../linux/dbus/message.zig");
const value = @import("../linux/dbus/value.zig");
const Connection = connection.Connection;
const Message = message.Message;
const Value = value.Value;

pub const Error = dialog.Error || desktop.Error || error{
    /// The portal answered with a body that does not match the Response signature.
    UnexpectedReply,
    /// The portal reported a failure (Response code other than 0, 1 or 2).
    DialogFailed,
    /// All per-process request identifiers have been consumed.
    RequestIdExhausted,
};

const portal_name: [:0]const u8 = "org.freedesktop.portal.Desktop";
const portal_path: [:0]const u8 = "/org/freedesktop/portal/desktop";
const file_chooser: [:0]const u8 = "org.freedesktop.portal.FileChooser";
const request_interface: [:0]const u8 = "org.freedesktop.portal.Request";
const response_rule: [:0]const u8 = "type='signal',sender='org.freedesktop.portal.Desktop',interface='org.freedesktop.portal.Request',member='Response'";

// Tokens must differ even when several requests are open on the same bus
// connection. PID alone only distinguishes processes; this counter also
// distinguishes requests from independent threads. Never wrap and reuse a token.
var request_sequence = std.atomic.Value(u64).init(0);

fn next_request_id() Error!u64 {
    var current = request_sequence.load(.monotonic);
    while (true) {
        if (current == std.math.maxInt(u64)) return error.RequestIdExhausted;
        if (request_sequence.cmpxchgWeak(current, current + 1, .monotonic, .monotonic)) |actual| {
            current = actual;
        } else return current + 1;
    }
}

fn monotonic_ns() i128 {
    var ts: linux.timespec = undefined;
    _ = linux.clock_gettime(linux.CLOCK.MONOTONIC, &ts);
    return @as(i128, ts.sec) * std.time.ns_per_s + ts.nsec;
}

/// A dialog that was opened and has not produced its response yet. Owns the
/// portal request path. Call `wait` exactly once; it releases the match rule.
pub const Pending = struct {
    gpa: Allocator,
    handle: [:0]u8,

    /// Frees the request path without waiting. The match rule stays registered
    /// until the connection closes; prefer `wait`.
    pub fn deinit(self: *Pending) void {
        self.gpa.free(self.handle);
        self.* = undefined;
    }

    /// Blocks up to `timeout_ms` (negative waits forever) for the Response.
    pub fn wait(self: *Pending, conn: *Connection, timeout_ms: i32) Error!dialog.Outcome {
        const deadline: ?i128 = if (timeout_ms < 0) null else monotonic_ns() + @as(i128, timeout_ms) * std.time.ns_per_ms;
        defer {
            conn.remove_match(response_rule) catch {};
            self.deinit();
        }
        var first = true;
        while (true) {
            const remaining_ms: i32 = if (deadline) |end| blk: {
                const left = end - monotonic_ns();
                // Preserve the zero-timeout queued-message check once, while
                // preventing unrelated queued traffic from extending a wait.
                if (left <= 0) {
                    if (!first) return error.Timeout;
                    break :blk 0;
                }
                break :blk @intCast(@min(@divTrunc(left + std.time.ns_per_ms - 1, std.time.ns_per_ms), std.math.maxInt(i32)));
            } else -1;
            first = false;
            var msg = try conn.receive(remaining_ms);
            defer msg.deinit();
            if (msg.kind() != .signal) continue;
            if (!msg.is_signal(request_interface, "Response")) continue;
            if (!msg.has_path(self.handle)) continue;
            return parse_response(&msg, self.gpa);
        }
    }
};

/// Opens a file dialog and returns the pending request. The request is
/// validated first, so invalid filters never reach the portal.
pub fn show(conn: *Connection, gpa: Allocator, request: dialog.Request) Error!Pending {
    try dialog.validate_filters(request.filters);

    var arena_state = std.heap.ArenaAllocator.init(gpa);
    defer arena_state.deinit();
    const arena = arena_state.allocator();

    try conn.add_match(response_rule);
    errdefer conn.remove_match(response_rule) catch {};

    var options = value.VariantDict.init(gpa);
    defer options.deinit();

    const token = try std.fmt.allocPrint(arena, "zdl{d}_{d}", .{ linux.getpid(), try next_request_id() });
    try options.put_string("handle_token", token);
    try options.put_bool("modal", request.parent != null);
    if (request.allow_many) try options.put_bool("multiple", true);
    if (request.kind == .open_folder) try options.put_bool("directory", true);
    if (request.filters.len != 0) {
        try options.put("filters", "a(sa(us))", try filters_value(arena, request.filters));
    }
    if (request.default_location) |location| {
        if (request.kind == .save_file) {
            try put_save_location(&options, arena, location);
        } else {
            try options.put_path_bytes("current_folder", location);
        }
    }
    if (request.accept_label) |label| try options.put_string("accept_label", label);

    const method: [:0]const u8 = if (request.kind == .save_file) "SaveFile" else "OpenFile";
    const default_title: []const u8 = switch (request.kind) {
        .open_file => "Open File",
        .save_file => "Save File",
        .open_folder => "Open Folder",
    };
    const title = request.title orelse default_title;
    const parent = try parent_handle(arena, request.parent);

    const args = [_]Value{ .{ .string = parent }, .{ .string = title }, options.value_of() };
    var msg = try Message.method_call(conn.lib, portal_name, portal_path, file_chooser, method);
    defer msg.deinit();
    try msg.append(arena, &args);
    var reply = try conn.call(&msg, -1);
    defer reply.deinit();
    if (reply.kind() != .method_return) return error.DialogFailed;

    const values = try reply.body(arena);
    if (values.len != 1 or values[0] != .object_path) return error.UnexpectedReply;
    const handle = try gpa.dupeSentinel(u8, values[0].object_path, 0);
    return .{ .gpa = gpa, .handle = handle };
}

/// Builds the portal's `a(sa(us))` filter list. Each filter has a display name and
/// one `(0, glob)` entry per extension. Allocations come from `arena`.
fn filters_value(arena: Allocator, filters: []const dialog.Filter) Error!Value {
    const items = try arena.alloc(Value, filters.len);
    for (filters, 0..) |f, i| {
        var globs: std.ArrayList(Value) = .empty;
        var it = dialog.extensions(f.pattern);
        while (it.next()) |ext| {
            const glob = try dialog.glob_for(arena, ext);
            const pair = try arena.dupe(Value, &.{ .{ .uint32 = 0 }, .{ .string = glob } });
            try globs.append(arena, .{ .structure = pair });
        }
        const fields = try arena.dupe(Value, &.{
            .{ .string = f.name },
            .{ .array = .{ .element = "(us)", .items = try globs.toOwnedSlice(arena) } },
        });
        items[i] = .{ .structure = fields };
    }
    return .{ .array = .{ .element = "(sa(us))", .items = items } };
}

/// Chooses the portal's save-dialog location options, as SDL does:
/// an existing regular file is preselected by `current_file`; a new name in an
/// existing folder becomes `current_folder` plus `current_name`; anything else
/// is taken as the folder.
fn put_save_location(options: *value.VariantDict, arena: Allocator, location: []const u8) Error!void {
    switch (path_kind(arena, location)) {
        .regular => {
            try options.put_path_bytes("current_file", location);
            try options.put_string("current_name", std.fs.path.basename(location));
        },
        .missing => {
            const dir = std.fs.path.dirname(location) orelse ".";
            if (path_kind(arena, dir) == .directory) {
                try options.put_path_bytes("current_folder", dir);
                try options.put_string("current_name", std.fs.path.basename(location));
            } else {
                try options.put_path_bytes("current_folder", location);
            }
        },
        else => try options.put_path_bytes("current_folder", location),
    }
}

const PathKind = enum { missing, regular, directory, other };

/// Classifies a path with statx(2). Errors other than ENOENT are reported as `other`.
fn path_kind(arena: Allocator, path: []const u8) PathKind {
    const z = arena.dupeSentinel(u8, path, 0) catch return .other;
    var buf: linux.Statx = undefined;
    const rc = linux.statx(linux.AT.FDCWD, z.ptr, 0, .{ .TYPE = true }, &buf);
    switch (linux.errno(rc)) {
        .SUCCESS => {},
        .NOENT => return .missing,
        else => return .other,
    }
    const mode: u32 = buf.mode;
    if (linux.S.ISREG(mode)) return .regular;
    if (linux.S.ISDIR(mode)) return .directory;
    return .other;
}

/// The `parent_window` string: `x11:<hex>`, `wayland:<handle>`, or empty.
fn parent_handle(arena: Allocator, parent: ?dialog.ParentWindow) Allocator.Error![]const u8 {
    const window = parent orelse return "";
    return switch (window) {
        .x11 => |id| std.fmt.allocPrint(arena, "x11:{x}", .{id}),
        .wayland_export => |handle| std.fmt.allocPrint(arena, "wayland:{s}", .{handle}),
    };
}

/// Decodes a Response body `(u a{sv})` into an outcome.
fn parse_response(msg: *const Message, gpa: Allocator) Error!dialog.Outcome {
    var arena_state = std.heap.ArenaAllocator.init(gpa);
    defer arena_state.deinit();
    const arena = arena_state.allocator();
    const values = try msg.body(arena);
    if (values.len != 2 or values[0] != .uint32) return error.UnexpectedReply;
    switch (values[0].uint32) {
        0 => {},
        1, 2 => return .cancelled,
        else => return error.DialogFailed,
    }
    if (values[1] != .array) return error.UnexpectedReply;
    for (values[1].array.items) |entry| {
        if (entry != .dict_entry) return error.UnexpectedReply;
        if (entry.dict_entry.key.* != .string) return error.UnexpectedReply;
        if (!std.mem.eql(u8, entry.dict_entry.key.string, "uris")) continue;
        return selected_paths(gpa, entry.dict_entry.value.*);
    }
    return .cancelled;
}

/// Converts the `uris` variant (`as`) into local paths.
fn selected_paths(gpa: Allocator, variant: Value) Error!dialog.Outcome {
    if (variant != .variant) return error.UnexpectedReply;
    const array = variant.variant.value.*;
    if (array != .array) return error.UnexpectedReply;
    var paths: std.ArrayList([]u8) = .empty;
    errdefer {
        for (paths.items) |p| gpa.free(p);
        paths.deinit(gpa);
    }
    for (array.array.items) |item| {
        if (item != .string) return error.UnexpectedReply;
        const path = try desktop.file_uri_to_path(gpa, item.string);
        try paths.append(gpa, path);
    }
    return .{ .selected = try paths.toOwnedSlice(gpa) };
}
