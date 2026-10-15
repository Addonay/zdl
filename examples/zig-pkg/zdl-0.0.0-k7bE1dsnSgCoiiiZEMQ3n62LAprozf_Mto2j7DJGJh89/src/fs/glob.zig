//! Glob matching over a directory tree, shared by host and storage paths.
//!
//! Ported from SDL's `SDL_GlobDirectory` and `WildcardMatch` in
//! `SDL_filesystem.c`, and the storage variant in `SDL_storage.c`. The
//! recursive walk is written natively instead of through SDL's callback
//! pointers and userdata.
//!
//! Pattern language: `*` matches any run of bytes that contains no `/`, `?`
//! matches one byte that is not `/`, and everything else matches itself. A
//! pattern that consumes a `/` descends into that directory during the walk.
//! Trailing `*` characters match nothing extra. A null pattern matches every
//! entry and descends into every directory.
//!
//! Each path is tested relative to the glob base (`prefix ++ name`), so `/`
//! is the only separator the matcher knows about. Case-insensitive matching
//! folds the pattern and each relative path with Unicode full case folding
//! (`core/casefold.zig`). Folding happens on relative paths only, not on the
//! full path as SDL does (see `Options`).
const std = @import("std");
const Allocator = std.mem.Allocator;
const Io = std.Io;
const filesystem = @import("filesystem.zig");
const casefold = @import("../core/casefold.zig");

/// Options for a glob walk.
pub const Options = struct {
    /// Compare pattern and paths after Unicode full case folding.
    ///
    /// SDL folds the complete path, including the base directory, and then
    /// slices it at the unfolded base's byte length. Case folding can change a
    /// string's byte length (for example U+00DF to "ss"), so that slice can start
    /// inside the wrong byte. This port folds only the path relative to the base,
    /// which avoids that defect.
    case_insensitive: bool = false,
};

/// Errors from a glob walk. Any directory that cannot be opened aborts the whole
/// walk, as SDL's enumeration failure does. Invalid UTF-8 in a name also aborts
/// the walk when case folding is requested. SDL folds such bytes as U+FFFD.
pub const Error = Allocator.Error || filesystem.DirectoryError || filesystem.PathInfoError || error{InvalidUtf8};

/// Owned glob results. Each path is relative to the glob base, uses `/` as its
/// separator, and has no leading slash, as SDL returns them. Matches appear in
/// the order directory listings produce them.
pub const Matches = struct {
    allocator: Allocator,
    paths: [][]u8,

    /// Frees every path and the path list.
    pub fn deinit(self: *Matches) void {
        for (self.paths) |path| self.allocator.free(path);
        self.allocator.free(self.paths);
        self.* = undefined;
    }
};

/// Walks the tree under `root_prefix ++ base` and returns entries matching
/// `pattern`. `root_prefix` is "" for host paths and the storage root for
/// storage paths. `base` has its trailing slashes trimmed first.
///
/// Errors from subdirectories propagate, as SDL aborts the whole glob. Symbolic
/// links to directories are descended into, because path info follows links.
/// Cycles through links are therefore not detected, as in SDL.
pub fn run(
    allocator: Allocator,
    io: Io,
    root_prefix: []const u8,
    base: []const u8,
    pattern: ?[]const u8,
    options: Options,
) Error!Matches {
    const trimmed_base = filesystem.trim_trailing_slashes(base);

    var folded_pattern: ?[]u8 = null;
    defer if (folded_pattern) |owned| allocator.free(owned);
    var effective_pattern = pattern;
    if (pattern) |text| if (options.case_insensitive) {
        folded_pattern = try fold_alloc(allocator, text);
        effective_pattern = folded_pattern;
    };

    var walk: Walk = .{
        .allocator = allocator,
        .io = io,
        .root_prefix = root_prefix,
        .base = trimmed_base,
        .pattern = effective_pattern,
        .case_insensitive = options.case_insensitive and pattern != null,
        .matches = .empty,
    };
    errdefer walk.clear();
    try walk.visit("");
    return .{ .allocator = allocator, .paths = try walk.matches.toOwnedSlice(allocator) };
}

/// The outcome of matching one relative path against a pattern.
pub const Match = struct {
    /// The whole pattern matched the whole path.
    matched: bool,
    /// The pattern ended at a `/`, so the path names a directory that the walk
    /// should descend into even if `matched` is false.
    matched_to_dir: bool,
};

/// Matches `path` against `pattern` with the `*`, `?` and `/` rules above. This
/// is SDL's WildcardMatch, which uses one-level backtracking for `*`.
pub fn match(pattern: []const u8, path: []const u8) Match {
    var str_index: usize = 0;
    var pat_index: usize = 0;
    var str_backtrack: ?usize = null;
    var pattern_backtrack: ?usize = null;
    var sch_backtrack: u8 = 0;
    var sch = char_at(path, str_index);
    var pch = char_at(pattern, pat_index);

    while (sch != 0) {
        if (pch == '*') {
            str_backtrack = str_index;
            pat_index += 1;
            pattern_backtrack = pat_index;
            sch_backtrack = sch;
            pch = char_at(pattern, pat_index);
        } else if (pch == sch) {
            if (pch == '/') {
                str_backtrack = null;
                pattern_backtrack = null;
            }
            str_index += 1;
            pat_index += 1;
            sch = char_at(path, str_index);
            pch = char_at(pattern, pat_index);
        } else if (pch == '?' and sch != '/') {
            str_index += 1;
            pat_index += 1;
            sch = char_at(path, str_index);
            pch = char_at(pattern, pat_index);
        } else if (pattern_backtrack == null or sch_backtrack == '/') {
            // No `*` to retry, or the retry would have to cross a separator.
            return .{ .matched = false, .matched_to_dir = false };
        } else {
            // Let the last `*` absorb one more byte and retry from its end.
            // SDL stores the current byte as the backtrack byte here, and the
            // separator check above depends on that.
            str_backtrack = str_backtrack.? + 1;
            str_index = str_backtrack.?;
            pat_index = pattern_backtrack.?;
            sch_backtrack = sch;
            sch = char_at(path, str_index);
            pch = char_at(pattern, pat_index);
        }
    }

    // Trailing `*` characters may match nothing.
    while (pch == '*') {
        pat_index += 1;
        pch = char_at(pattern, pat_index);
    }
    return .{ .matched = pch == 0, .matched_to_dir = pch == '/' };
}

/// Returns the byte at `index`, or 0 past the end. This matches SDL's
/// NUL-terminated string reads without storing sentinels.
fn char_at(text: []const u8, index: usize) u8 {
    return if (index < text.len) text[index] else 0;
}

/// Recursive walk state. `visit` lists one directory and recurses into
/// matching subdirectories. `prefix` is the relative directory path with a
/// trailing slash, or "" at the base.
const Walk = struct {
    allocator: Allocator,
    io: Io,
    root_prefix: []const u8,
    base: []const u8,
    pattern: ?[]const u8,
    case_insensitive: bool,
    matches: std.ArrayList([]u8),

    /// Frees any matches collected so far. Called on error paths.
    fn clear(self: *Walk) void {
        for (self.matches.items) |path| self.allocator.free(path);
        self.matches.deinit(self.allocator);
    }

    fn visit(self: *Walk, prefix: []const u8) Error!void {
        const dir_path = try join_path(self.allocator, self.root_prefix, self.base, prefix);
        defer self.allocator.free(dir_path);

        var directory = try filesystem.open_directory(self.io, dir_path);
        defer directory.close(self.io);

        while (try directory.next(self.io)) |entry| {
            const relative = try std.fmt.allocPrint(self.allocator, "{s}{s}", .{ prefix, entry.name });
            defer self.allocator.free(relative);

            const subject = if (self.case_insensitive) try fold_alloc(self.allocator, relative) else relative;
            defer if (self.case_insensitive) self.allocator.free(subject);

            const result: Match = if (self.pattern) |pattern|
                match(pattern, subject)
            else
                .{ .matched = true, .matched_to_dir = true };

            if (result.matched) {
                try self.matches.ensureUnusedCapacity(self.allocator, 1);
                self.matches.appendAssumeCapacity(try self.allocator.dupe(u8, relative));
            }
            if (result.matched_to_dir) try self.descend(relative);
        }
    }

    /// Recurses into `relative` if it names a directory. Info errors (for
    /// example a dangling link) skip the entry, as SDL does.
    fn descend(self: *Walk, relative: []const u8) Error!void {
        const full = try join_path(self.allocator, self.root_prefix, self.base, relative);
        defer self.allocator.free(full);
        const info = filesystem.path_info(self.io, full) catch return;
        if (info.kind != .directory) return;

        const child_prefix = try std.fmt.allocPrint(self.allocator, "{s}/", .{relative});
        defer self.allocator.free(child_prefix);
        try self.visit(child_prefix);
    }
};

/// Joins `root_prefix`, `base` and a relative prefix into one path. A slash is
/// inserted between `base` and `relative` when needed. An empty base yields the
/// relative part alone, matching SDL's `basedirlen` rules.
fn join_path(allocator: Allocator, root_prefix: []const u8, base: []const u8, relative: []const u8) Allocator.Error![]u8 {
    if (base.len == 0) return std.fmt.allocPrint(allocator, "{s}{s}", .{ root_prefix, relative });
    if (base[base.len - 1] == '/') return std.fmt.allocPrint(allocator, "{s}{s}{s}", .{ root_prefix, base, relative });
    return std.fmt.allocPrint(allocator, "{s}{s}/{s}", .{ root_prefix, base, relative });
}

/// Returns a new owned string with each code point replaced by its full case
/// folding. Invalid UTF-8 is an error here.
fn fold_alloc(allocator: Allocator, text: []const u8) (Allocator.Error || error{InvalidUtf8})![]u8 {
    var view = std.unicode.Utf8View.init(text) catch return error.InvalidUtf8;
    var iterator = view.iterator();
    var out: std.ArrayList(u8) = .empty;
    errdefer out.deinit(allocator);
    var encoded: [4]u8 = undefined;
    while (iterator.nextCodepoint()) |codepoint| {
        const folded = casefold.fold(codepoint);
        for (folded.slice()) |folded_point| {
            const length = std.unicode.utf8Encode(folded_point, &encoded) catch unreachable;
            try out.appendSlice(allocator, encoded[0..length]);
        }
    }
    return out.toOwnedSlice(allocator);
}
