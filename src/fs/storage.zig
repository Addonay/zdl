//! Storage: a rooted, path-validated view over a directory tree, in three
//! flavors. Ported from SDL's `SDL_storage.c` and the generic driver in
//! `storage/generic/SDL_genericstorage.c`.
//!
//! - title: read-only game data next to the executable (or an override
//!   directory). Writes return `error.ReadOnlyStorage`.
//! - user: a writable per-application directory from `filesystem.pref_path`.
//! - file: a writable storage rooted at any directory the caller names.
//!
//! The three flavors share one implementation. Their only differences are how
//! the root is chosen and whether writes are allowed. SDL's generic driver
//! also has no readiness check and reports unlimited space, and this port
//! keeps both behaviors. SDL's `Storage` vtable and `void *` userdata are not
//! reproduced: `Storage` is a plain struct whose `kind` field selects the
//! root and access rules.
//!
//! Path rules (SDL's ValidateStoragePath): storage paths use `/` only. A
//! backslash, or any segment equal to "." or "..", is rejected with
//! `error.InvalidStoragePath`. An empty path names the root itself. Paths are
//! joined to the root in a caller buffer, so the operations need no allocator.
//!
//! Ownership: `Storage` owns its root string. Call `deinit` once. Storages are
//! not synchronized. Concurrent mutation of the same tree is the caller's job,
//! as with SDL.
const std = @import("std");
const Allocator = std.mem.Allocator;
const Io = std.Io;
const Dir = std.Io.Dir;
const filesystem = @import("filesystem.zig");
const glob_mod = @import("glob.zig");

/// Which flavor of storage a `Storage` is. The kind decides the root and whether
/// writes are allowed.
pub const Kind = enum {
    /// Read-only game data under the executable's directory or an override.
    title,
    /// Writable per-application data from the preference path.
    user,
    /// Writable storage rooted at a caller-chosen directory.
    file,
};

/// Errors from storage path validation.
pub const PathError = error{ InvalidStoragePath, PathTooLong };

/// Errors from storage operations that may write to the tree. Title storage
/// reports `ReadOnlyStorage` for every such call.
pub const WriteError = PathError || error{ReadOnlyStorage} || Dir.CreateDirError || Dir.WriteFileError;

/// A rooted storage. `root` is an owned absolute or cwd-relative prefix that
/// ends with `/`, or is empty for a relative title override of "".
pub const Storage = struct {
    allocator: Allocator,
    kind: Kind,
    root: []u8,

    /// Opens title storage. `override` null uses the directory that holds the
    /// executable. An empty override means the current directory's relative
    /// paths, as in SDL. Any other override gets a trailing slash if missing.
    pub fn open_title(allocator: Allocator, io: Io, override: ?[]const u8) (Allocator.Error || Dir.ReadLinkError || error{InvalidExecutablePath})!Storage {
        const root = if (override) |path|
            if (path.len == 0) try allocator.dupe(u8, "") else try with_trailing_slash(allocator, path)
        else
            try filesystem.base_path(allocator, io);
        return .{ .allocator = allocator, .kind = .title, .root = root };
    }

    /// Opens a writable user storage at `filesystem.pref_path(org, app)`,
    /// creating the directory if needed.
    pub fn open_user(
        allocator: Allocator,
        io: Io,
        environ: std.process.Environ,
        org: ?[]const u8,
        app: []const u8,
    ) filesystem.PrefPathError!Storage {
        return .{
            .allocator = allocator,
            .kind = .user,
            .root = try filesystem.pref_path(allocator, io, environ, org, app),
        };
    }

    /// Opens a writable storage rooted at `path`. Empty means "/". A relative
    /// path is resolved against the current directory when the storage is
    /// opened, and the resolved root is stored. The root gets a trailing slash.
    pub fn open_file(allocator: Allocator, io: Io, path: []const u8) (Allocator.Error || std.process.CurrentPathAllocError)!Storage {
        const absolute = if (path.len == 0)
            try allocator.dupe(u8, "/")
        else if (path[0] == '/')
            try with_trailing_slash(allocator, path)
        else blk: {
            const cwd = try filesystem.current_directory(allocator, io);
            defer allocator.free(cwd);
            break :blk try std.fmt.allocPrint(allocator, "{s}{s}/", .{ cwd, path });
        };
        return .{ .allocator = allocator, .kind = .file, .root = absolute };
    }

    /// Frees the root string. Storage values are not reusable afterward.
    pub fn deinit(self: *Storage) void {
        self.allocator.free(self.root);
        self.* = undefined;
    }

    /// True for storages that accept writes. Title storage is read-only.
    pub fn is_writable(self: Storage) bool {
        return self.kind != .title;
    }

    /// Always true, as in SDL's generic driver. Storage has no separate
    /// readiness state.
    pub fn ready(self: Storage) bool {
        _ = self;
        return true;
    }

    /// Reports unlimited free space, as SDL's generic driver does. Quota
    /// queries are not implemented.
    pub fn space_remaining(self: Storage) u64 {
        _ = self;
        return std.math.maxInt(u64);
    }

    /// Returns metadata for a storage path. Errors match `filesystem.path_info`.
    pub fn path_info(self: Storage, io: Io, path: []const u8) (PathError || filesystem.PathInfoError)!filesystem.PathInfo {
        var buffer: [Dir.max_path_bytes]u8 = undefined;
        const full = try self.full_path(&buffer, path);
        return filesystem.path_info(io, full);
    }

    /// Reads exactly `destination.len` bytes from the file at `path`. A file
    /// shorter than the destination fails with `error.LengthMismatch`. A longer
    /// file succeeds with the leading bytes, as SDL does.
    pub fn read_file(self: Storage, io: Io, path: []const u8, destination: []u8) (PathError || Io.File.OpenError || Io.File.ReadPositionalError || error{LengthMismatch})!void {
        var buffer: [Dir.max_path_bytes]u8 = undefined;
        const full = try self.full_path(&buffer, path);
        const cwd = Dir.cwd();
        const file = try cwd.openFile(io, full, .{});
        defer file.close(io);
        const count = try file.readPositionalAll(io, destination, 0);
        if (count != destination.len) return error.LengthMismatch;
    }

    /// Creates or truncates the file at `path` and writes all of `data`.
    /// Parent directories are not created. Title storage returns
    /// `error.ReadOnlyStorage`.
    pub fn write_file(self: Storage, io: Io, path: []const u8, data: []const u8) WriteError!void {
        if (!self.is_writable()) return error.ReadOnlyStorage;
        var buffer: [Dir.max_path_bytes]u8 = undefined;
        const full = try self.full_path(&buffer, path);
        try Dir.cwd().writeFile(io, .{ .sub_path = full, .data = data });
    }

    /// Creates a directory and its missing parents, as SDL_CreateDirectory does.
    /// Title storage returns `error.ReadOnlyStorage`.
    pub fn create_directory(self: Storage, io: Io, path: []const u8) WriteError!void {
        if (!self.is_writable()) return error.ReadOnlyStorage;
        var buffer: [Dir.max_path_bytes]u8 = undefined;
        const full = try self.full_path(&buffer, path);
        try filesystem.create_directory(io, full);
    }

    /// Removes a file or an empty directory. A missing path is success.
    pub fn remove(self: Storage, io: Io, path: []const u8) (WriteError || Dir.DeleteFileError || Dir.DeleteDirError)!void {
        if (!self.is_writable()) return error.ReadOnlyStorage;
        var buffer: [Dir.max_path_bytes]u8 = undefined;
        const full = try self.full_path(&buffer, path);
        try filesystem.remove(io, full);
    }

    /// Renames within the storage. Both paths are validated first.
    pub fn rename(self: Storage, io: Io, old_path: []const u8, new_path: []const u8) (WriteError || Dir.RenameError)!void {
        if (!self.is_writable()) return error.ReadOnlyStorage;
        var old_buffer: [Dir.max_path_bytes]u8 = undefined;
        var new_buffer: [Dir.max_path_bytes]u8 = undefined;
        const old_full = try self.full_path(&old_buffer, old_path);
        const new_full = try self.full_path(&new_buffer, new_path);
        try filesystem.rename(io, old_full, new_full);
    }

    /// Copies a file within the storage. Both paths are validated first.
    pub fn copy_file(self: Storage, io: Io, old_path: []const u8, new_path: []const u8) (WriteError || Dir.CopyFileError)!void {
        if (!self.is_writable()) return error.ReadOnlyStorage;
        var old_buffer: [Dir.max_path_bytes]u8 = undefined;
        var new_buffer: [Dir.max_path_bytes]u8 = undefined;
        const old_full = try self.full_path(&old_buffer, old_path);
        const new_full = try self.full_path(&new_buffer, new_path);
        try filesystem.copy_file(io, old_full, new_full);
    }

    /// Opens a directory listing for `path` inside the storage. The entries are
    /// relative to the storage root, so the caller joins them with `path`.
    pub fn open_directory(self: Storage, io: Io, path: []const u8) (PathError || filesystem.DirectoryError)!filesystem.Directory {
        var buffer: [Dir.max_path_bytes]u8 = undefined;
        const full = try self.full_path(&buffer, path);
        return filesystem.open_directory(io, full);
    }

    /// Matches a pattern against the storage tree under `path`. Results are
    /// relative to `path`. The caller frees them with `Matches.deinit`.
    pub fn glob(
        self: Storage,
        allocator: Allocator,
        io: Io,
        path: []const u8,
        pattern: ?[]const u8,
        options: glob_mod.Options,
    ) (PathError || glob_mod.Error)!glob_mod.Matches {
        try validate_path(path);
        return glob_mod.run(allocator, io, self.root, path, pattern, options);
    }

    /// Joins the root and a validated storage path into `buffer`.
    fn full_path(self: Storage, buffer: []u8, path: []const u8) PathError![]u8 {
        try validate_path(path);
        const length = self.root.len + path.len;
        if (length > buffer.len) return error.PathTooLong;
        @memcpy(buffer[0..self.root.len], self.root);
        @memcpy(buffer[self.root.len..length], path);
        return buffer[0..length];
    }
};

/// Rejects backslashes and any "." or ".." segment. SDL checks the same
/// conditions, including a trailing "." or "..", so both rules apply here.
pub fn validate_path(path: []const u8) PathError!void {
    if (std.mem.indexOfScalar(u8, path, '\\') != null) return error.InvalidStoragePath;
    var segments = std.mem.splitScalar(u8, path, '/');
    while (segments.next()) |segment| {
        if (std.mem.eql(u8, segment, ".") or std.mem.eql(u8, segment, "..")) return error.InvalidStoragePath;
    }
}

/// Returns `value` with a trailing slash, copying it.
fn with_trailing_slash(allocator: Allocator, value: []const u8) Allocator.Error![]u8 {
    if (value.len > 0 and value[value.len - 1] == '/') return allocator.dupe(u8, value);
    return std.fmt.allocPrint(allocator, "{s}/", .{value});
}
