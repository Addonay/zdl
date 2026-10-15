//! Folder-based media library for the player: one directory at a time with
//! back/forward history, folders-first name sorting and a case-insensitive name
//! filter. The library owns its strings and entry list; every directory read
//! goes through the explicit `std.Io` and only opens the requested path.
const std = @import("std");

/// What a library row represents. Files that are neither media nor folders
/// are not listed.
pub const Kind = enum { folder, video, audio };

pub const Entry = struct {
    /// Display name (the final path component), owned by the library.
    name: []u8,
    /// Absolute path, owned by the library.
    path: []u8,
    kind: Kind,
};

/// Most path components shown in the breadcrumb trail.
pub const max_segments = 16;

pub const Library = struct {
    allocator: std.mem.Allocator,
    io: std.Io,
    /// Top of the browsable tree; back/up never leave it.
    root: []u8,
    /// Folder whose entries are listed.
    current: []u8,
    /// Folders first, then media, each sorted by name (reversed when descending).
    entries: []Entry = &.{},
    back_history: std.ArrayList([]u8) = .empty,
    forward_history: std.ArrayList([]u8) = .empty,
    descending: bool = false,

    /// Opens `root` and lists it. The path must be an absolute directory.
    pub fn init(allocator: std.mem.Allocator, io: std.Io, root: []const u8) !Library {
        const owned_root = try allocator.dupe(u8, root);
        const owned_current = allocator.dupe(u8, root) catch |err| {
            allocator.free(owned_root);
            return err;
        };
        var self: Library = .{
            .allocator = allocator,
            .io = io,
            .root = owned_root,
            .current = owned_current,
        };
        errdefer self.deinit();
        try self.reload();
        return self;
    }

    pub fn deinit(self: *Library) void {
        free_entries(self.allocator, self.entries);
        for (self.back_history.items) |path| self.allocator.free(path);
        self.back_history.deinit(self.allocator);
        for (self.forward_history.items) |path| self.allocator.free(path);
        self.forward_history.deinit(self.allocator);
        self.allocator.free(self.current);
        self.allocator.free(self.root);
        self.* = undefined;
    }

    /// Lists `path` and makes it current, remembering the previous folder.
    /// Entries are unchanged if the directory cannot be read.
    pub fn open_folder(self: *Library, path: []const u8) !void {
        const owned_path = try self.allocator.dupe(u8, path);
        errdefer self.allocator.free(owned_path);
        const entries = try scan(self.allocator, self.io, owned_path);
        errdefer free_entries(self.allocator, entries);
        const remembered = try self.allocator.dupe(u8, self.current);
        errdefer self.allocator.free(remembered);
        try self.back_history.append(self.allocator, remembered);
        for (self.forward_history.items) |old| self.allocator.free(old);
        self.forward_history.clearRetainingCapacity();
        self.replace_current(owned_path, entries);
    }

    /// Steps back to the previous folder, if any.
    pub fn back(self: *Library) !void {
        if (self.back_history.items.len == 0) return;
        const target = self.back_history.items[self.back_history.items.len - 1];
        const entries = try scan(self.allocator, self.io, target);
        errdefer free_entries(self.allocator, entries);
        const remembered = try self.allocator.dupe(u8, self.current);
        errdefer self.allocator.free(remembered);
        try self.forward_history.append(self.allocator, remembered);
        self.back_history.items.len -= 1;
        self.replace_current(target, entries);
    }

    /// Steps forward after a `back`, if any.
    pub fn forward(self: *Library) !void {
        if (self.forward_history.items.len == 0) return;
        const target = self.forward_history.items[self.forward_history.items.len - 1];
        const entries = try scan(self.allocator, self.io, target);
        errdefer free_entries(self.allocator, entries);
        const remembered = try self.allocator.dupe(u8, self.current);
        errdefer self.allocator.free(remembered);
        try self.back_history.append(self.allocator, remembered);
        self.forward_history.items.len -= 1;
        self.replace_current(target, entries);
    }

    /// Moves to the parent folder without leaving the library root.
    pub fn up(self: *Library) !void {
        if (self.is_root()) return;
        const parent = std.fs.path.dirname(self.current) orelse return;
        if (parent.len < self.root.len) return;
        try self.open_folder(parent);
    }

    pub fn is_root(self: *const Library) bool {
        return std.mem.eql(u8, self.current, self.root);
    }

    /// Re-reads the current folder, for example after files were added.
    pub fn reload(self: *Library) !void {
        const entries = try scan(self.allocator, self.io, self.current);
        errdefer free_entries(self.allocator, entries);
        const path = try self.allocator.dupe(u8, self.current);
        self.replace_current(path, entries);
    }

    /// Toggles the name order and re-sorts the listing in place.
    pub fn toggle_order(self: *Library) void {
        self.descending = !self.descending;
        sort_entries(self.entries, self.descending);
    }

    /// Breadcrumb components: the root's name, then each folder down to the
    /// current one. Returns a prefix of `storage`.
    pub fn segments(self: *const Library, storage: *[max_segments][]const u8) []const []const u8 {
        var count: usize = 0;
        storage[count] = std.fs.path.basename(self.root);
        count += 1;
        var rest: []const u8 = self.current[self.root.len..];
        while (rest.len > 0 and count < max_segments) {
            const trimmed = std.mem.trimStart(u8, rest, "/");
            if (trimmed.len == 0) break;
            const end = std.mem.indexOfScalar(u8, trimmed, '/') orelse trimmed.len;
            storage[count] = trimmed[0..end];
            count += 1;
            rest = trimmed[end..];
        }
        return storage[0..count];
    }

    /// Replaces the current path and listing; takes ownership of both.
    fn replace_current(self: *Library, path: []u8, entries: []Entry) void {
        free_entries(self.allocator, self.entries);
        self.allocator.free(self.current);
        self.current = path;
        self.entries = entries;
        sort_entries(self.entries, self.descending);
    }
};

/// Classifies a directory entry by its name; null means "not shown".
pub fn classify(name: []const u8, is_directory: bool) ?Kind {
    if (name.len == 0 or name[0] == '.') return null;
    if (is_directory) return .folder;
    const dot = std.mem.lastIndexOfScalar(u8, name, '.') orelse return null;
    const extension = name[dot + 1 ..];
    const videos = [_][]const u8{ "mp4", "mkv", "webm", "mov", "avi", "m4v", "ogv", "ts" };
    const audio = [_][]const u8{ "mp3", "flac", "wav", "ogg", "opus", "m4a", "aac" };
    for (videos) |known| if (std.ascii.eqlIgnoreCase(extension, known)) return .video;
    for (audio) |known| if (std.ascii.eqlIgnoreCase(extension, known)) return .audio;
    return null;
}

/// True when `name` contains `filter` ignoring ASCII case. An empty filter
/// matches everything.
pub fn matches(name: []const u8, filter: []const u8) bool {
    if (filter.len == 0) return true;
    if (filter.len > name.len) return false;
    var start: usize = 0;
    while (start + filter.len <= name.len) : (start += 1) {
        if (std.ascii.eqlIgnoreCase(name[start..][0..filter.len], filter)) return true;
    }
    return false;
}

/// Reads one directory into a sorted, owned entry list.
fn scan(allocator: std.mem.Allocator, io: std.Io, path: []const u8) ![]Entry {
    var dir = try std.Io.Dir.cwd().openDir(io, path, .{ .iterate = true });
    defer dir.close(io);
    var entries: std.ArrayList(Entry) = .empty;
    errdefer {
        for (entries.items) |entry| free_entry(allocator, entry);
        entries.deinit(allocator);
    }
    var iterator = dir.iterate();
    while (try iterator.next(io)) |item| {
        const kind = classify(item.name, item.kind == .directory) orelse continue;
        const name = try allocator.dupe(u8, item.name);
        errdefer allocator.free(name);
        const entry_path = try std.fmt.allocPrint(allocator, "{s}/{s}", .{ path, item.name });
        errdefer allocator.free(entry_path);
        try entries.append(allocator, .{ .name = name, .path = entry_path, .kind = kind });
    }
    sort_entries(entries.items, false);
    return entries.toOwnedSlice(allocator);
}

fn sort_entries(entries: []Entry, descending: bool) void {
    const Context = struct {
        descending: bool,
        fn less(context: @This(), a: Entry, b: Entry) bool {
            const a_folder = a.kind == .folder;
            const b_folder = b.kind == .folder;
            if (a_folder != b_folder) return a_folder;
            const ordered = std.ascii.lessThanIgnoreCase(a.name, b.name);
            return if (context.descending) std.ascii.lessThanIgnoreCase(b.name, a.name) else ordered;
        }
    };
    std.mem.sort(Entry, entries, Context{ .descending = descending }, Context.less);
}

fn free_entry(allocator: std.mem.Allocator, entry: Entry) void {
    allocator.free(entry.name);
    allocator.free(entry.path);
}

fn free_entries(allocator: std.mem.Allocator, entries: []Entry) void {
    for (entries) |entry| free_entry(allocator, entry);
    allocator.free(entries);
}

test "classify media, folders and hidden names" {
    try std.testing.expectEqual(Kind.video, classify("Clip.MP4", false).?);
    try std.testing.expectEqual(Kind.audio, classify("song.flac", false).?);
    try std.testing.expectEqual(Kind.folder, classify("Shows", true).?);
    try std.testing.expect(classify("notes.txt", false) == null);
    try std.testing.expect(classify(".hidden.mp4", false) == null);
    try std.testing.expect(classify("noextension", false) == null);
}

test "filter is case-insensitive substring" {
    try std.testing.expect(matches("The_Wand_S01E05.mp4", ""));
    try std.testing.expect(matches("The_Wand_S01E05.mp4", "wand"));
    try std.testing.expect(matches("The_Wand_S01E05.mp4", "E05"));
    try std.testing.expect(!matches("The_Wand_S01E05.mp4", "S02"));
    try std.testing.expect(!matches("ab", "abc"));
}

test "library navigation transfers path ownership and refreshes listings" {
    const a = std.testing.allocator;
    const io = std.testing.io;
    var temp = std.testing.tmpDir(.{});
    defer temp.cleanup();
    try temp.dir.createDir(io, "folder", .default_dir);
    var buffer: [std.fs.max_path_bytes]u8 = undefined;
    const len = try temp.dir.realPath(io, &buffer);
    var library = try Library.init(a, io, buffer[0..len]);
    defer library.deinit();
    const child = try std.fmt.allocPrint(a, "{s}/folder", .{buffer[0..len]});
    defer a.free(child);
    try library.open_folder(child);
    try std.testing.expectEqualStrings(child, library.current);
    try library.back();
    try std.testing.expect(library.is_root());
    try library.forward();
    try std.testing.expectEqualStrings(child, library.current);
    try library.up();
    try std.testing.expect(library.is_root());
    try library.reload();
    library.toggle_order();
    var components: [max_segments][]const u8 = undefined;
    try std.testing.expectEqual(@as(usize, 1), library.segments(&components).len);
}
