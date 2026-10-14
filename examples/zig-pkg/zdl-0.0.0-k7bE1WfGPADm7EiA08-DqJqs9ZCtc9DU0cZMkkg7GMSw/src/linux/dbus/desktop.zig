//! Desktop-service helpers over the libdbus connection. Ports the behavior of
//! SDL's `core/linux/SDL_dbus.c`:
//!
//! - Idle inhibition: `org.freedesktop.portal.Inhibit` (flag 8, idle) when
//!   sandboxed, otherwise `org.freedesktop.ScreenSaver.Inhibit`.
//! - Open URI: `org.freedesktop.portal.OpenURI.OpenURI` for remote URIs, and
//!   `OpenFile` with a read-only descriptor for `file:` URIs and local paths
//!   (the portal rejects OpenURI for files).
//! - Color scheme: `org.freedesktop.portal.Settings.Read` for
//!   `org.freedesktop.appearance` / `color-scheme`.
//!
//! Each helper performs one synchronous exchange on the caller's connection.
//! Nothing is cached globally; `Inhibition` owns the handle it created and is
//! released explicitly.

const std = @import("std");
const linux = std.os.linux;
const Allocator = std.mem.Allocator;
const connection = @import("connection.zig");
const message = @import("message.zig");
const value = @import("value.zig");
const Connection = connection.Connection;
const Message = message.Message;
const Value = value.Value;

/// Errors from desktop helpers.
pub const Error = connection.Error || error{
    /// The service answered with a body that does not match the method's reply type.
    UnexpectedReply,
    /// The URI is neither a `file:` URI nor a local path that can be opened.
    UnsupportedUri,
    /// The local file could not be opened to send to the portal.
    FileOpenFailed,
};

const portal_name: [:0]const u8 = "org.freedesktop.portal.Desktop";
const portal_path: [:0]const u8 = "/org/freedesktop/portal/desktop";
const screensaver_name: [:0]const u8 = "org.freedesktop.ScreenSaver";
const screensaver_path: [:0]const u8 = "/org/freedesktop/ScreenSaver";
/// Portal Inhibit flag bit for idle inhibition (xdg-desktop-portal reference).
const inhibit_idle_flag: u32 = 8;
const default_reason = "Playing a game";
/// Service call timeout in milliseconds.
const call_timeout_ms: i32 = 5_000;

/// Reports whether the process runs in a Flatpak or Snap sandbox, where the
/// portal is the only route to the desktop services. `snap_env` is the caller's
/// `SNAP` environment value. The Flatpak marker file is probed with `access(2)`.
pub fn is_sandboxed(snap_env: ?[]const u8) bool {
    if (snap_env != null) return true;
    const flatpak: [:0]const u8 = "/.flatpak-info";
    return linux.access(flatpak.ptr, 0) == 0;
}

/// Calls `method` on `destination` with `args`, blocking for the reply.
/// Returns the reply; the caller decodes its body and deinits it.
fn call_service(conn: *Connection, gpa: Allocator, destination: [:0]const u8, object_path: [:0]const u8, interface_name: [:0]const u8, member_name: [:0]const u8, args: []const Value) Error!Message {
    var msg = try Message.method_call(conn.lib, destination, object_path, interface_name, member_name);
    defer msg.deinit();
    try msg.append(gpa, args);
    return conn.call(&msg, call_timeout_ms);
}

/// Decodes a reply body into `arena`, requiring at least `min` values.
fn reply_body(reply: *const Message, arena: Allocator, min: usize) Error![]Value {
    if (reply.kind() != .method_return) return error.RemoteError;
    const values = try reply.body(arena);
    if (values.len < min) return error.UnexpectedReply;
    return values;
}

/// An active idle inhibition. Holds the portal request path or the ScreenSaver
/// cookie, whichever service accepted it. Release it with `release`.
pub const Inhibition = union(enum) {
    /// Portal request object path, owned by the allocator used to create it.
    portal: [:0]u8,
    /// Cookie from `org.freedesktop.ScreenSaver.Inhibit`.
    screensaver: u32,

    /// Ends the inhibition and frees the handle. The handle is consumed even if
    /// the service reports an error.
    pub fn release(self: *Inhibition, conn: *Connection, gpa: Allocator) Error!void {
        defer {
            switch (self.*) {
                .portal => |path| gpa.free(path),
                .screensaver => {},
            }
            self.* = undefined;
        }
        switch (self.*) {
            .portal => |path| {
                const args = [_]Value{};
                var reply = try call_service(conn, gpa, portal_name, path, "org.freedesktop.portal.Request", "Close", &args);
                reply.deinit();
            },
            .screensaver => |cookie| {
                const args = [_]Value{.{ .uint32 = cookie }};
                var reply = try call_service(conn, gpa, screensaver_name, screensaver_path, screensaver_name, "UnInhibit", &args);
                reply.deinit();
            },
        }
    }
};

/// Requests idle inhibition with `reason` (SDL's default text when empty).
/// `snap_env` is used for sandbox detection, see `is_sandboxed`. Returned
/// `Inhibition` must be released with `Inhibition.release`.
pub fn inhibit_screensaver(conn: *Connection, gpa: Allocator, reason: []const u8, snap_env: ?[]const u8) Error!Inhibition {
    const text = if (reason.len == 0) default_reason else reason;
    if (is_sandboxed(snap_env)) {
        var options = value.VariantDict.init(gpa);
        defer options.deinit();
        try options.put_string("reason", text);
        const args = [_]Value{ .{ .string = "" }, .{ .uint32 = inhibit_idle_flag }, options.value_of() };
        var reply = try call_service(conn, gpa, portal_name, portal_path, "org.freedesktop.portal.Inhibit", "Inhibit", &args);
        defer reply.deinit();
        var arena_state = std.heap.ArenaAllocator.init(gpa);
        defer arena_state.deinit();
        const values = try reply_body(&reply, arena_state.allocator(), 1);
        if (values[0] != .object_path) return error.UnexpectedReply;
        return .{ .portal = try gpa.dupeSentinel(u8, values[0].object_path, 0) };
    }
    const args = [_]Value{ .{ .string = "zdl" }, .{ .string = text } };
    var reply = try call_service(conn, gpa, screensaver_name, screensaver_path, screensaver_name, "Inhibit", &args);
    defer reply.deinit();
    var arena_state = std.heap.ArenaAllocator.init(gpa);
    defer arena_state.deinit();
    const values = try reply_body(&reply, arena_state.allocator(), 1);
    if (values[0] != .uint32) return error.UnexpectedReply;
    return .{ .screensaver = values[0].uint32 };
}

/// Resets the desktop idle timer through the ScreenSaver service.
pub fn simulate_user_activity(conn: *Connection, gpa: Allocator) Error!void {
    const args = [_]Value{};
    var reply = try call_service(conn, gpa, screensaver_name, screensaver_path, screensaver_name, "SimulateUserActivity", &args);
    defer reply.deinit();
    if (reply.kind() != .method_return) return error.RemoteError;
}

/// Opens a URI with the desktop's default handler. `file:` URIs and plain
/// local paths go through `OpenFile` with a read-only descriptor, which is
/// closed once the call has returned. Other URIs go through `OpenURI`.
pub fn open_uri(conn: *Connection, gpa: Allocator, uri: []const u8) Error!void {
    const is_file = std.ascii.startsWithIgnoreCase(uri, "file:/");
    if (is_file or !is_uri(uri)) {
        const local = if (is_file) try file_uri_to_path(gpa, uri) else try gpa.dupe(u8, uri);
        defer gpa.free(local);
        const fd = try open_read_only(gpa, local);
        defer _ = linux.close(fd);
        var options = value.VariantDict.init(gpa);
        defer options.deinit();
        // libdbus duplicates the descriptor into the message on append.
        const args = [_]Value{ .{ .string = "" }, .{ .unix_fd = fd }, options.value_of() };
        var reply = try call_service(conn, gpa, portal_name, portal_path, "org.freedesktop.portal.OpenURI", "OpenFile", &args);
        defer reply.deinit();
        if (reply.kind() != .method_return) return error.RemoteError;
        return;
    }
    var options = value.VariantDict.init(gpa);
    defer options.deinit();
    const uri_z = try gpa.dupeSentinel(u8, uri, 0);
    defer gpa.free(uri_z);
    const args = [_]Value{ .{ .string = "" }, .{ .string = uri_z }, options.value_of() };
    var reply = try call_service(conn, gpa, portal_name, portal_path, "org.freedesktop.portal.OpenURI", "OpenURI", &args);
    defer reply.deinit();
    if (reply.kind() != .method_return) return error.RemoteError;
}

/// The desktop's light/dark preference (`org.freedesktop.appearance` `color-scheme`).
pub const ColorScheme = enum(u32) {
    no_preference = 0,
    dark = 1,
    light = 2,
    _,
};

/// Reads the color scheme from the portal Settings interface. The portal
/// wraps the result in variants (one or two levels), so unwrap until the uint32.
pub fn color_scheme(conn: *Connection, gpa: Allocator) Error!ColorScheme {
    const args = [_]Value{ .{ .string = "org.freedesktop.appearance" }, .{ .string = "color-scheme" } };
    var reply = try call_service(conn, gpa, portal_name, portal_path, "org.freedesktop.portal.Settings", "Read", &args);
    defer reply.deinit();
    var arena_state = std.heap.ArenaAllocator.init(gpa);
    defer arena_state.deinit();
    const values = try reply_body(&reply, arena_state.allocator(), 1);
    var current = values[0];
    while (current == .variant) current = current.variant.value.*;
    if (current != .uint32) return error.UnexpectedReply;
    return @fromBackingInt(current.uint32);
}

/// True for `scheme:` URIs (scheme = ALPHA *( ALPHA / DIGIT / "+" / "-" / "." )).
pub fn is_uri(text: []const u8) bool {
    const colon = std.mem.indexOfScalar(u8, text, ':') orelse return false;
    if (colon == 0 or !std.ascii.isAlphabetic(text[0])) return false;
    for (text[1..colon]) |c| {
        if (!(std.ascii.isAlphanumeric(c) or c == '+' or c == '-' or c == '.')) return false;
    }
    return true;
}

/// Converts a `file:` URI to a filesystem path, decoding `%XX` escapes. The
/// authority must be empty or `localhost`. The result is owned by `gpa`.
pub fn file_uri_to_path(gpa: Allocator, uri: []const u8) Error![]u8 {
    if (!std.ascii.startsWithIgnoreCase(uri, "file:")) return error.UnsupportedUri;
    var rest = uri["file:".len..];
    if (std.mem.startsWith(u8, rest, "//")) {
        rest = rest[2..];
        const slash = std.mem.indexOfScalar(u8, rest, '/') orelse return error.UnsupportedUri;
        const host = rest[0..slash];
        if (host.len != 0 and !std.ascii.eqlIgnoreCase(host, "localhost")) return error.UnsupportedUri;
        rest = rest[slash..];
    }
    return percent_decode(gpa, rest);
}

/// Decodes `%XX` escapes. Malformed escapes are an error, not passed through.
pub fn percent_decode(gpa: Allocator, text: []const u8) Error![]u8 {
    var out = try gpa.alloc(u8, text.len);
    errdefer gpa.free(out);
    var n: usize = 0;
    var i: usize = 0;
    while (i < text.len) : (i += 1) {
        if (text[i] != '%') {
            out[n] = text[i];
            n += 1;
            continue;
        }
        if (i + 2 >= text.len) return error.UnsupportedUri;
        const hi = std.fmt.charToDigit(text[i + 1], 16) catch return error.UnsupportedUri;
        const lo = std.fmt.charToDigit(text[i + 2], 16) catch return error.UnsupportedUri;
        out[n] = hi * 16 + lo;
        n += 1;
        i += 2;
    }
    return gpa.realloc(out, n);
}

/// Opens an existing path read-only with close-on-exec. The caller closes it.
fn open_read_only(gpa: Allocator, path: []const u8) Error!i32 {
    const z = try gpa.dupeSentinel(u8, path, 0);
    defer gpa.free(z);
    const rc = linux.open(z.ptr, .{ .CLOEXEC = true }, 0);
    if (linux.errno(rc) != .SUCCESS) return error.FileOpenFailed;
    return @intCast(rc);
}

test "file uri decoding" {
    const gpa = std.testing.allocator;
    const path = try file_uri_to_path(gpa, "file:///tmp/a%20b.png");
    defer gpa.free(path);
    try std.testing.expectEqualStrings("/tmp/a b.png", path);
    try std.testing.expect(is_uri("https://example.org"));
    try std.testing.expect(!is_uri("/tmp/x:y"));
}
