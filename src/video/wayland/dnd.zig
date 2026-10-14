//! Drag-and-drop payload helpers for the Wayland backend: classification of the
//! MIME types an offer carries and decoding of `text/uri-list` (RFC 2483) file
//! lists. Pure Zig, no protocol state; `Window` calls these with the offer data
//! it received.
//!
//! Ownership: `file_paths` returns owned slices (free with `free_paths`).
//! `decode_percent` returns an owned slice. Neither borrows its input.

const std = @import("std");
const Allocator = std.mem.Allocator;

/// What a dropped offer carries. `files` takes precedence over `text` when both
/// are offered, as file managers offer `text/uri-list` next to plain text.
pub const Kind = enum { none, files, text };

pub const uri_list_mime = "text/uri-list";

/// Text MIME types in SDL's preference order (UTF-8 first).
pub const text_mimes = [_][]const u8{ "text/plain;charset=utf-8", "text/plain", "UTF8_STRING", "TEXT", "STRING" };

/// Classifies the MIME types of an offer.
pub fn classify(mimes: []const []u8) Kind {
    var text = false;
    for (mimes) |mime| {
        if (std.mem.eql(u8, mime, uri_list_mime)) return .files;
        for (text_mimes) |wanted| {
            if (std.mem.eql(u8, mime, wanted)) text = true;
        }
    }
    return if (text) .text else .none;
}

/// The most preferred text MIME type offered, or null when none is offered.
/// Returns a static string from `text_mimes`.
pub fn preferred_text(mimes: []const []u8) ?[]const u8 {
    for (text_mimes) |wanted| {
        for (mimes) |mime| {
            if (std.mem.eql(u8, mime, wanted)) return wanted;
        }
    }
    return null;
}

/// Decodes a `text/uri-list` payload into local file paths. Lines end with CRLF
/// or LF; lines starting with `#` are comments and blank lines are skipped. Only
/// `file:` URIs with an empty or `localhost` host are kept; other URIs are
/// skipped. Percent escapes are decoded. Each path is owned by the caller.
pub fn file_paths(allocator: Allocator, data: []const u8) Allocator.Error![][]u8 {
    var list: std.ArrayList([]u8) = .empty;
    errdefer {
        for (list.items) |path| allocator.free(path);
        list.deinit(allocator);
    }
    var lines = std.mem.splitAny(u8, data, "\r\n");
    while (lines.next()) |raw| {
        const line = std.mem.trim(u8, raw, " \t");
        if (line.len == 0 or line[0] == '#') continue;
        const encoded = local_path_of(line) orelse continue;
        const path = try decode_percent(allocator, encoded);
        list.append(allocator, path) catch |err| {
            allocator.free(path);
            return err;
        };
    }
    return list.toOwnedSlice(allocator);
}

/// Frees a list returned by `file_paths`.
pub fn free_paths(allocator: Allocator, paths: [][]u8) void {
    for (paths) |path| allocator.free(path);
    allocator.free(paths);
}

/// The still percent-encoded path of a `file:` URI for this host, or null.
fn local_path_of(line: []const u8) ?[]const u8 {
    const prefix = "file://";
    if (!std.mem.startsWith(u8, line, prefix)) return null;
    const rest = line[prefix.len..];
    if (rest.len == 0) return null;
    if (rest[0] == '/') return rest;
    const slash = std.mem.indexOfScalar(u8, rest, '/') orelse return null;
    if (!std.mem.eql(u8, rest[0..slash], "localhost")) return null;
    return rest[slash..];
}

/// Decodes `%XX` escapes. Malformed escapes are kept as written.
pub fn decode_percent(allocator: Allocator, text: []const u8) Allocator.Error![]u8 {
    var out: std.ArrayList(u8) = .empty;
    errdefer out.deinit(allocator);
    try out.ensureTotalCapacity(allocator, text.len);
    var index: usize = 0;
    while (index < text.len) {
        if (text[index] == '%' and index + 2 < text.len) {
            if (hex_value(text[index + 1])) |high| {
                if (hex_value(text[index + 2])) |low| {
                    out.appendAssumeCapacity(high * 16 + low);
                    index += 3;
                    continue;
                }
            }
        }
        out.appendAssumeCapacity(text[index]);
        index += 1;
    }
    return out.toOwnedSlice(allocator);
}

fn hex_value(c: u8) ?u8 {
    return switch (c) {
        '0'...'9' => c - '0',
        'a'...'f' => c - 'a' + 10,
        'A'...'F' => c - 'A' + 10,
        else => null,
    };
}
