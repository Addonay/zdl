//! File dialog requests, results and filter rules (ports `SDL_dialog.c` and
//! `SDL_dialog_utils.c`).
//!
//! A `Request` is plain data: the dialog kind, filters, the initial location
//! and labels. Backends (`portal.zig`, `zenity.zig`) turn it into a desktop
//! dialog and report an `Outcome`. There are no callbacks and no userdata.
//!
//! Filter patterns are `;`-separated extensions made of `[A-Za-z0-9_.-]`, or a
//! single `*`. Matching is case-insensitive: each letter becomes a `[xX]` class
//! so `*.png` also matches `.PNG`. Empty alternatives (`""`, `a;;b`, `a;`) are
//! rejected. SDL reads one byte before the buffer for an empty pattern; this
//! port reports `error.EmptyPattern` instead.

const std = @import("std");
const Allocator = std.mem.Allocator;

/// Errors from request validation and glob construction.
pub const Error = error{
    /// A filter pattern is empty or has an empty alternative.
    EmptyPattern,
    /// A filter pattern contains a character outside `[A-Za-z0-9_.-]` and `;`.
    InvalidPattern,
    OutOfMemory,
};

/// The kind of dialog. `open_folder` is an OpenFile with directory selection.
pub const Kind = enum {
    open_file,
    save_file,
    open_folder,
};

/// A named set of extensions, e.g. `.{ .name = "Images", .pattern = "png;jpg" }`.
pub const Filter = struct {
    name: []const u8,
    pattern: []const u8,
};

/// A window the dialog should be attached to.
pub const ParentWindow = union(enum) {
    /// X11 window id; the portal receives it as `x11:<hex>`, zenity as `--attach`.
    x11: u64,
    /// Wayland xdg-foreign export handle, passed to the portal as `wayland:<handle>`.
    wayland_export: []const u8,
};

/// A request to show a dialog. Borrowed strings must outlive the call that uses them.
pub const Request = struct {
    kind: Kind,
    filters: []const Filter = &.{},
    /// Initial file or folder. For `save_file`, an existing file is pre-selected
    /// and a new name in an existing folder is suggested.
    default_location: ?[]const u8 = null,
    title: ?[]const u8 = null,
    accept_label: ?[]const u8 = null,
    cancel_label: ?[]const u8 = null,
    /// Allow selecting several files (or folders).
    allow_many: bool = false,
    /// Make the dialog modal to `parent`.
    parent: ?ParentWindow = null,
};

/// Result of a dialog. Cancelling is a normal outcome, not an error.
pub const Outcome = union(enum) {
    cancelled,
    /// Local filesystem paths (decoded from `file://` URIs), owned by the allocator
    /// that produced the outcome. Free with `deinit`.
    selected: [][]u8,

    pub fn deinit(self: *Outcome, gpa: Allocator) void {
        switch (self.*) {
            .cancelled => {},
            .selected => |paths| {
                for (paths) |p| gpa.free(p);
                gpa.free(paths);
            },
        }
        self.* = undefined;
    }
};

/// Validates every filter's pattern. Returns the first problem found.
pub fn validate_filters(filters: []const Filter) Error!void {
    for (filters) |f| try validate_pattern(f.pattern);
}

/// Validates one `;`-separated pattern list.
pub fn validate_pattern(pattern: []const u8) Error!void {
    if (std.mem.eql(u8, pattern, "*")) return;
    if (pattern.len == 0) return error.EmptyPattern;
    for (pattern, 0..) |c, i| {
        if (c == ';') {
            if (i == 0 or pattern[i - 1] == ';' or i + 1 == pattern.len) return error.EmptyPattern;
            continue;
        }
        const ok = std.ascii.isAlphanumeric(c) or c == '-' or c == '_' or c == '.';
        if (!ok) return error.InvalidPattern;
    }
}

/// Builds the case-insensitive glob for one extension, e.g. `png` -> `*.[pP][nN][gG]`.
/// `*` alone stays `*`. The result is owned by `gpa`.
pub fn glob_for(gpa: Allocator, extension: []const u8) Error![]u8 {
    if (std.mem.eql(u8, extension, "*")) return gpa.dupe(u8, "*");
    var out: std.ArrayList(u8) = .empty;
    errdefer out.deinit(gpa);
    try out.appendSlice(gpa, "*.");
    for (extension) |c| {
        if (std.ascii.isAlphabetic(c)) {
            try out.appendSlice(gpa, &.{ '[', std.ascii.toLower(c), std.ascii.toUpper(c), ']' });
        } else {
            try out.append(gpa, c);
        }
    }
    return out.toOwnedSlice(gpa);
}

/// Iterates the `;`-separated extensions of a validated pattern.
pub fn extensions(pattern: []const u8) std.mem.SplitIterator(u8, .scalar) {
    return std.mem.splitScalar(u8, pattern, ';');
}

/// Joins the globs of one filter with single spaces, as zenity expects:
/// `*.[pP][nN][gG] *.[jJ][pP][gG]`. Owned by `gpa`.
pub fn glob_list(gpa: Allocator, pattern: []const u8) Error![]u8 {
    var out: std.ArrayList(u8) = .empty;
    errdefer out.deinit(gpa);
    var it = extensions(pattern);
    var first = true;
    while (it.next()) |ext| {
        const glob = try glob_for(gpa, ext);
        defer gpa.free(glob);
        if (!first) try out.append(gpa, ' ');
        first = false;
        try out.appendSlice(gpa, glob);
    }
    return out.toOwnedSlice(gpa);
}

test "pattern validation and globs" {
    const gpa = std.testing.allocator;
    try validate_pattern("png;JPG");
    try validate_pattern("*");
    try std.testing.expectError(error.EmptyPattern, validate_pattern(""));
    try std.testing.expectError(error.EmptyPattern, validate_pattern("a;;b"));
    try std.testing.expectError(error.EmptyPattern, validate_pattern("a;"));
    try std.testing.expectError(error.InvalidPattern, validate_pattern("*.png"));

    const list = try glob_list(gpa, "png;jpg");
    defer gpa.free(list);
    try std.testing.expectEqualStrings("*.[pP][nN][gG] *.[jJ][pP][gG]", list);
}
