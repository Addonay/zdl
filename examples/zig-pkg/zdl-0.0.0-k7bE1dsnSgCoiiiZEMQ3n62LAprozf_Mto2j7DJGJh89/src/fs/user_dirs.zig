//! Parser for the freedesktop `user-dirs.dirs` file used to locate well-known
//! user folders (Desktop, Documents, Downloads, ...).
//!
//! Ported from the `xdg_user_dir_lookup_with_fallback` routine in SDL's
//! `unix/SDL_sysfilesystem.c`, which was copied from xdg-user-dir-lookup.c
//! (Copyright (c) 2007 Red Hat, Inc., MIT licensed). The file format is:
//!
//!     XDG_DOWNLOAD_DIR="$HOME/Downloads"
//!
//! Matching rules preserved from upstream:
//! - Leading spaces and tabs are ignored; the line must begin with `XDG_`,
//!   then the requested name, then `_DIR`, then `=` and a double-quoted value.
//! - The value must be an absolute path or start with `$HOME/`, which is
//!   expanded to the caller's home directory plus `/`.
//! - Inside the quotes a backslash escapes the following byte, and the value
//!   ends at the first unescaped double quote. A trailing backslash at the end
//!   of a line is kept literally.
//! - When several lines match, the last valid one wins.
//!
//! Deliberate difference: SDL reads with a 512-byte `fgets` buffer and so
//! mis-parses lines longer than that; this parser splits on every newline and
//! has no line length limit.
const std = @import("std");

/// Looks up `name` (for example "DOWNLOAD" for `XDG_DOWNLOAD_DIR`) in the
/// contents of a `user-dirs.dirs` file. Returns an owned path without a
/// trailing slash, or null when no valid line matches.
///
/// `contents` and `home` are borrowed for the call only. The caller frees the
/// result with `allocator`.
pub fn lookup(
    allocator: std.mem.Allocator,
    contents: []const u8,
    name: []const u8,
    home: []const u8,
) std.mem.Allocator.Error!?[]u8 {
    var result: ?[]u8 = null;
    errdefer if (result) |owned| allocator.free(owned);

    var lines = std.mem.splitScalar(u8, contents, '\n');
    while (lines.next()) |line| {
        const value = parse_line(line, name) orelse continue;
        var out: std.ArrayList(u8) = .empty;
        errdefer out.deinit(allocator);
        if (value.home_relative) {
            try out.appendSlice(allocator, home);
            try out.append(allocator, '/');
        }
        try unescape_into(allocator, &out, value.raw);
        // The previous match is superseded only after its replacement exists.
        const replacement = try out.toOwnedSlice(allocator);
        if (result) |previous| allocator.free(previous);
        result = replacement;
    }
    return result;
}

/// A matched value: `raw` is the quoted body after an optional `$HOME/`
/// prefix, still containing backslash escapes.
const Value = struct {
    home_relative: bool,
    raw: []const u8,
};

/// Recognizes one `XDG_<name>_DIR="value"` line.
fn parse_line(line: []const u8, name: []const u8) ?Value {
    var p = skip_blanks(line, 0);
    if (!std.mem.startsWith(u8, line[p..], "XDG_")) return null;
    p += 4;
    if (!std.mem.startsWith(u8, line[p..], name)) return null;
    p += name.len;
    if (!std.mem.startsWith(u8, line[p..], "_DIR")) return null;
    p += 4;
    p = skip_blanks(line, p);
    if (p >= line.len or line[p] != '=') return null;
    p += 1;
    p = skip_blanks(line, p);
    if (p >= line.len or line[p] != '"') return null;
    p += 1;

    var home_relative = false;
    if (std.mem.startsWith(u8, line[p..], "$HOME/")) {
        p += 6;
        home_relative = true;
    } else if (p >= line.len or line[p] != '/') {
        return null;
    }
    return .{ .home_relative = home_relative, .raw = quoted_body(line, p) };
}

/// Skips spaces and tabs starting at `index`.
fn skip_blanks(line: []const u8, index: usize) usize {
    var i = index;
    while (i < line.len and (line[i] == ' ' or line[i] == '\t')) i += 1;
    return i;
}

/// Returns the bytes from `start` up to the first unescaped closing quote, or
/// to the end of the line. Escaped bytes are skipped so an escaped quote does
/// not terminate the value.
fn quoted_body(line: []const u8, start: usize) []const u8 {
    var end = start;
    while (end < line.len and line[end] != '"') {
        if (line[end] == '\\' and end + 1 < line.len) end += 1;
        end += 1;
    }
    return line[start..end];
}

/// Appends `raw` with each backslash-escaped byte copied literally and the
/// backslash dropped. A backslash with no following byte is copied as-is.
fn unescape_into(allocator: std.mem.Allocator, out: *std.ArrayList(u8), raw: []const u8) std.mem.Allocator.Error!void {
    var i: usize = 0;
    while (i < raw.len) {
        if (raw[i] == '\\' and i + 1 < raw.len) i += 1;
        try out.append(allocator, raw[i]);
        i += 1;
    }
}
