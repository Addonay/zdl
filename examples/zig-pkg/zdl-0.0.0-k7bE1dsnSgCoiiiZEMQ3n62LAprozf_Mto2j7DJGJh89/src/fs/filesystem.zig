//! Host filesystem access for Linux: program locations, per-user writable and
//! well-known folders, path metadata, directory creation, rename, copy, remove
//! and directory iteration.
//!
//! Ported from SDL's `SDL_filesystem.c`, `unix/SDL_sysfilesystem.c` and
//! `posix/SDL_sysfsops.c`. Behavior follows SDL unless noted below.
//!
//! Ownership and state:
//! - Every path-returning function allocates with the caller's allocator and
//!   returns an owned slice the caller frees. SDL caches the base path and user
//!   folders in process globals; this module keeps no global state and
//!   recomputes them on each call.
//! - Paths are never NUL-terminated here. std.Io takes byte slices directly.
//! - All operations use std.Io, which the caller supplies. No libc is used.
//!
//! Environment: functions that consult `HOME`, `XDG_DATA_HOME` or
//! `XDG_CONFIG_HOME` take a `std.process.Environ` explicitly rather than reading
//! a process global.
//!
//! Deliberate differences from SDL:
//! - An empty `XDG_DATA_HOME` or `XDG_CONFIG_HOME` is treated as unset, as the
//!   XDG base directory specification requires. SDL reads the byte before the
//!   empty string's start in that case.
//! - The Ubuntu Touch application-id override needs SDL's global properties,
//!   which do not exist here. It is not implemented.
//! - The base path is read from `/proc/self/exe` only. SDL's `/proc/<pid>/exe`
//!   fallback and the BSD, Solaris and QNX variants are not ported.
//! - `path_info` reports `create_time` from `st_ctime`, as SDL does on Linux. That
//!   is the inode change time, not a true creation time. Linux `statx` birth
//!   time is not used.
//! - Directory entries from `Directory.next` are returned in the order the
//!   kernel lists them, as with SDL. Matching paths from `glob` are not sorted.
const std = @import("std");
const Allocator = std.mem.Allocator;
const Io = std.Io;
const Dir = std.Io.Dir;
const user_dirs = @import("user_dirs.zig");
const glob_mod = @import("glob.zig");

/// Well-known per-user folders. Names mirror SDL_Folder.
pub const Folder = enum {
    home,
    desktop,
    documents,
    downloads,
    music,
    pictures,
    publicshare,
    saved_games,
    screenshots,
    templates,
    videos,
};

/// The kind of object a path names. Symbolic links are followed before the
/// kind is classified, as SDL does. Sockets, devices and FIFOs are `other`.
pub const PathKind = enum { file, directory, other };

/// Metadata for one path. Times are nanoseconds since the Unix epoch, matching
/// SDL_Time. Values beyond the i64 range are clamped to its bounds.
pub const PathInfo = struct {
    kind: PathKind,
    /// Byte size. Directories report 0.
    size: u64,
    /// Inode change time (`st_ctime`), SDL's "create time" on Linux.
    create_time: i64,
    modify_time: i64,
    /// Null when the kernel does not report access times.
    access_time: ?i64,
};

/// Errors from opening or iterating a directory.
pub const DirectoryError = Dir.OpenError || Dir.Iterator.Error;
/// Errors from classifying or measuring a path.
pub const PathInfoError = Dir.StatFileError;

/// The directory handle's directory-listing entry: its name and kind.
/// `name` borrows from the iterator's buffer and is valid only until the next
/// call to `Directory.next`.
pub const Entry = struct {
    name: []const u8,
    kind: std.Io.File.Kind,
};

/// A directory listing opened with `open_directory`. It replaces SDL's
/// callback enumeration. `SDL_ENUM_CONTINUE` corresponds to calling `next` again,
/// `SDL_ENUM_SUCCESS` to stopping and dropping the iterator, and
/// `SDL_ENUM_FAILURE` to returning the error from `next`. `.` and `..` are
/// skipped, as in SDL.
///
/// Must be closed with `close`. Not thread-safe.
pub const Directory = struct {
    dir: Dir,
    iterator: Dir.Iterator,

    /// Returns the next entry, or null when the listing is exhausted.
    pub fn next(self: *Directory, io: Io) DirectoryError!?Entry {
        while (try self.iterator.next(io)) |entry| {
            if (std.mem.eql(u8, entry.name, ".") or std.mem.eql(u8, entry.name, "..")) continue;
            return .{ .name = entry.name, .kind = entry.kind };
        }
        return null;
    }

    /// Releases the directory handle. Entries returned earlier become invalid.
    pub fn close(self: *Directory, io: Io) void {
        self.dir.close(io);
        self.* = undefined;
    }
};

/// Opens `path` for iteration. A trailing slash is accepted; runs of trailing
/// slashes collapse, and root "/" is kept. An empty path fails with the
/// platform's not-found error, as opendir("") does in SDL.
pub fn open_directory(io: Io, path: []const u8) DirectoryError!Directory {
    const dir = try Dir.cwd().openDir(io, trim_trailing_slashes(path), .{ .iterate = true });
    return .{ .dir = dir, .iterator = dir.iterate() };
}

/// Returns the directory that holds the running executable, with a trailing
/// slash. Reads `/proc/self/exe` and removes the file name.
pub fn base_path(allocator: Allocator, io: Io) (Allocator.Error || Dir.ReadLinkError || error{InvalidExecutablePath})![]u8 {
    var buffer: [Dir.max_path_bytes]u8 = undefined;
    const length = try Dir.readLinkAbsolute(io, "/proc/self/exe", &buffer);
    const exe = buffer[0..length];
    const slash = std.mem.lastIndexOfScalar(u8, exe, '/') orelse return error.InvalidExecutablePath;
    return allocator.dupe(u8, exe[0 .. slash + 1]);
}

/// Returns the file name of the running executable without its directory.
pub fn exe_name(allocator: Allocator, io: Io) (Allocator.Error || Dir.ReadLinkError || error{InvalidExecutablePath})![]u8 {
    var buffer: [Dir.max_path_bytes]u8 = undefined;
    const length = try Dir.readLinkAbsolute(io, "/proc/self/exe", &buffer);
    const exe = buffer[0..length];
    const slash = std.mem.lastIndexOfScalar(u8, exe, '/') orelse return error.InvalidExecutablePath;
    return allocator.dupe(u8, exe[slash + 1 ..]);
}

/// Errors from `pref_path`.
pub const PrefPathError = Allocator.Error || Dir.CreateDirError || error{HomeNotSet};

/// Returns a writable per-application directory, creating it (mode 0700) and
/// any missing parents. The result ends with a slash.
///
/// The directory is `$XDG_DATA_HOME/<org>/<app>/` when `XDG_DATA_HOME` is set,
/// otherwise `$HOME/.local/share/<org>/<app>/`. A null or empty `org` is
/// omitted. Existing components are accepted whatever their type, as in SDL.
/// `app` is used as given; SDL performs no sanitization of either name, so the
/// caller must choose names that are valid path components.
pub fn pref_path(
    allocator: Allocator,
    io: Io,
    environ: std.process.Environ,
    org: ?[]const u8,
    app: []const u8,
) PrefPathError![]u8 {
    var path: std.ArrayList(u8) = .empty;
    errdefer path.deinit(allocator);

    if (non_empty_var(environ, "XDG_DATA_HOME")) |data_home| {
        try path.appendSlice(allocator, data_home);
    } else {
        const home = environ.getPosix("HOME") orelse return error.HomeNotSet;
        try path.appendSlice(allocator, home);
    }
    if (path.items.len == 0 or path.items[path.items.len - 1] != '/') try path.append(allocator, '/');
    if (non_empty_var(environ, "XDG_DATA_HOME") == null) try path.appendSlice(allocator, ".local/share/");
    if (org) |name| if (name.len > 0) {
        try path.appendSlice(allocator, name);
        try path.append(allocator, '/');
    };
    try path.appendSlice(allocator, app);
    try path.append(allocator, '/');

    const owned = try path.toOwnedSlice(allocator);
    errdefer allocator.free(owned);
    try make_parents(io, owned);
    return owned;
}

/// Returns a well-known user folder with a trailing slash. Folders are
/// resolved through `user-dirs.dirs` (`$XDG_CONFIG_HOME` or `~/.config`),
/// falling back to `$HOME/Desktop` for `desktop`. `home` is `$HOME`.
///
/// `saved_games` and `screenshots` have no XDG equivalent and return
/// `error.Unsupported`, as in SDL.
pub fn user_folder(
    allocator: Allocator,
    io: Io,
    environ: std.process.Environ,
    folder: Folder,
) (Allocator.Error || error{ HomeNotSet, Unsupported, NoUserDirectory })![]u8 {
    const home = environ.getPosix("HOME") orelse return error.HomeNotSet;
    const name = switch (folder) {
        .home => {
            return with_trailing_slash(allocator, home);
        },
        .desktop => "DESKTOP",
        .documents => "DOCUMENTS",
        .downloads => "DOWNLOAD",
        .music => "MUSIC",
        .pictures => "PICTURES",
        .publicshare => "PUBLICSHARE",
        .templates => "TEMPLATES",
        .videos => "VIDEOS",
        .saved_games, .screenshots => return error.Unsupported,
    };

    const dir = (try lookup_user_dir(allocator, io, environ, home, name)) orelse
        return error.NoUserDirectory;
    errdefer allocator.free(dir);
    return with_trailing_slash(allocator, dir);
}

/// Returns the process's current working directory with a trailing slash.
pub fn current_directory(allocator: Allocator, io: Io) (Allocator.Error || std.process.CurrentPathAllocError)![]u8 {
    const raw = try std.process.currentPathAlloc(io, allocator);
    defer allocator.free(raw);
    return with_trailing_slash(allocator, raw);
}

/// Returns metadata for `path`, following symbolic links. Errors from the stat
/// call (for example `error.FileNotFound`) are returned unchanged.
pub fn path_info(io: Io, path: []const u8) PathInfoError!PathInfo {
    const stat = try Dir.cwd().statFile(io, path, .{ .follow_symlinks = true });
    const kind: PathKind = switch (stat.kind) {
        .file => .file,
        .directory => .directory,
        else => .other,
    };
    return .{
        .kind = kind,
        .size = if (kind == .directory) 0 else stat.size,
        .create_time = nanoseconds(stat.ctime),
        .modify_time = nanoseconds(stat.mtime),
        .access_time = if (stat.atime) |atime| nanoseconds(atime) else null,
    };
}

/// Creates `path` and any missing parent directories (mode 0770 before umask).
/// If the final component already exists as a directory, the call succeeds.
///
/// Mirrors SDL_CreateDirectory: try the whole path first. If that fails, create
/// each prefix in turn, stopping at the first failure, and make one last attempt
/// at the full path. The root and a leading drive-free "/" are never created.
/// An empty path fails.
pub fn create_directory(io: Io, path: []const u8) Dir.CreateDirError!void {
    make_one(io, path) catch |first_error| {
        if (path.len == 0) return first_error;
        var parents = path;
        if (parents[parents.len - 1] == '/') {
            parents = parents[0 .. parents.len - 1];
            if (make_one(io, parents)) |_| return else |_| {}
        }
        var index: usize = 1;
        while (index < parents.len) : (index += 1) {
            if (parents[index] != '/') continue;
            make_one(io, parents[0..index]) catch break;
        }
        return make_one(io, parents);
    };
}

/// Renames `old_path` to `new_path`, replacing an existing destination as
/// rename(2) does. Both paths must be on the same filesystem.
pub fn rename(io: Io, old_path: []const u8, new_path: []const u8) Dir.RenameError!void {
    const cwd = Dir.cwd();
    try Dir.rename(cwd, old_path, cwd, new_path, io);
}

/// Copies the contents of `old_path` to `new_path`, truncating an existing
/// destination. The copy's permissions are the default file mode before umask,
/// not the source's mode, which matches SDL's fopen-based copy.
pub fn copy_file(io: Io, old_path: []const u8, new_path: []const u8) Dir.CopyFileError!void {
    const cwd = Dir.cwd();
    try Dir.copyFile(cwd, old_path, cwd, new_path, io, .{ .permissions = .default_file });
}

/// Removes a file, or an empty directory. A missing path counts as success, as
/// SDL does. A non-empty directory is an error.
pub fn remove(io: Io, path: []const u8) (Dir.DeleteFileError || Dir.DeleteDirError)!void {
    const cwd = Dir.cwd();
    cwd.deleteFile(io, path) catch |err| switch (err) {
        error.FileNotFound => return,
        error.IsDir => cwd.deleteDir(io, path) catch |dir_err| switch (dir_err) {
            error.FileNotFound => return,
            else => return dir_err,
        },
        else => return err,
    };
}

/// Expands a glob `pattern` against the directory tree under `path`.
/// Returns the matching relative paths (see `glob.Matches`).
///
/// `pattern` null matches everything and descends into every directory.
/// Supported syntax: `*` matches any run of bytes except `/`, and `?` matches a
/// single byte except `/`. A `*` may cross `/` only when the pattern itself
/// spans directories. See `glob.zig` for the exact algorithm.
pub fn glob_directory(
    allocator: Allocator,
    io: Io,
    path: []const u8,
    pattern: ?[]const u8,
    options: glob_mod.Options,
) glob_mod.Error!glob_mod.Matches {
    return glob_mod.run(allocator, io, "", path, pattern, options);
}

/// Converts a std timestamp to nanoseconds, clamping values outside i64.
fn nanoseconds(timestamp: Io.Timestamp) i64 {
    const raw = timestamp.toNanoseconds();
    return @intCast(std.math.clamp(raw, std.math.minInt(i64), std.math.maxInt(i64)));
}

/// Returns `value` with a trailing slash, allocating a copy with one appended
/// when it lacks one.
fn with_trailing_slash(allocator: Allocator, value: []const u8) Allocator.Error![]u8 {
    if (value.len > 0 and value[value.len - 1] == '/') return allocator.dupe(u8, value);
    const result = try allocator.alloc(u8, value.len + 1);
    @memcpy(result[0..value.len], value);
    result[value.len] = '/';
    return result;
}

/// Removes all trailing slashes except when the path is the root "/".
/// Shared with glob and storage path handling.
pub fn trim_trailing_slashes(path: []const u8) []const u8 {
    var end = path.len;
    while (end > 1 and path[end - 1] == '/') end -= 1;
    return path[0..end];
}

/// Returns an environment variable's value when it is set and non-empty.
fn non_empty_var(environ: std.process.Environ, name: []const u8) ?[]const u8 {
    const value = environ.getPosix(name) orelse return null;
    if (value.len == 0) return null;
    return value;
}

/// Looks up a folder in `user-dirs.dirs`, then applies SDL's fallback.
/// Returns null when there is no entry and no fallback. The caller frees
/// non-null results.
fn lookup_user_dir(
    allocator: Allocator,
    io: Io,
    environ: std.process.Environ,
    home: []const u8,
    name: []const u8,
) Allocator.Error!?[]u8 {
    const config_file = blk: {
        if (non_empty_var(environ, "XDG_CONFIG_HOME")) |config_home| {
            break :blk try std.fmt.allocPrint(allocator, "{s}/user-dirs.dirs", .{config_home});
        }
        break :blk try std.fmt.allocPrint(allocator, "{s}/.config/user-dirs.dirs", .{home});
    };
    defer allocator.free(config_file);

    // An unreadable or missing file is not an error: SDL falls back silently.
    // Allocation failure is still reported.
    const contents = Dir.cwd().readFileAlloc(io, config_file, allocator, .limited(1 << 20)) catch |err| switch (err) {
        error.OutOfMemory => return error.OutOfMemory,
        else => null,
    };
    if (contents) |bytes| {
        defer allocator.free(bytes);
        if (try user_dirs.lookup(allocator, bytes, name, home)) |found| return found;
    }

    if (std.mem.eql(u8, name, "DESKTOP")) {
        return try std.fmt.allocPrint(allocator, "{s}/Desktop", .{home});
    }
    return null;
}

/// Creates one directory with mode 0770. An existing directory counts as
/// success. An existing non-directory is reported as `error.PathAlreadyExists`.
fn make_one(io: Io, path: []const u8) Dir.CreateDirError!void {
    const cwd = Dir.cwd();
    cwd.createDir(io, path, .fromMode(0o770)) catch |err| switch (err) {
        error.PathAlreadyExists => {
            const stat = cwd.statFile(io, path, .{}) catch return err;
            if (stat.kind == .directory) return;
            return err;
        },
        else => return err,
    };
}

/// Creates every directory component of `path` with mode 0700. Used by
/// `pref_path`. Existing components are accepted regardless of type, as in SDL.
fn make_parents(io: Io, path: []const u8) Dir.CreateDirError!void {
    const cwd = Dir.cwd();
    var index: usize = 1;
    while (index < path.len) : (index += 1) {
        if (path[index] != '/') continue;
        cwd.createDir(io, path[0..index], .fromMode(0o700)) catch |err| switch (err) {
            error.PathAlreadyExists => {},
            else => return err,
        };
    }
    const full = trim_trailing_slashes(path);
    cwd.createDir(io, full, .fromMode(0o700)) catch |err| switch (err) {
        error.PathAlreadyExists => {},
        else => return err,
    };
}
