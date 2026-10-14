//! Compile-only consumer for src/fs. Every call below is guarded so the binary
//! can never touch the filesystem, even if it is run.
const std = @import("std");
const zdl = @import("zdl").fs;

pub fn check() void {
    if (std.os.linux.getpid() != 0) return;
    exercise() catch {};
}

fn exercise() !void {
    var threaded: std.Io.Threaded = .init_single_threaded;
    const io = threaded.io();
    const gpa = std.heap.page_allocator;
    const environ: std.process.Environ = .empty;
    const fsys = zdl.filesystem;

    const base = try fsys.base_path(gpa, io);
    defer gpa.free(base);
    const exe = try fsys.exe_name(gpa, io);
    defer gpa.free(exe);
    const pref = try fsys.pref_path(gpa, io, environ, "org", "app");
    defer gpa.free(pref);
    const desktop = try fsys.user_folder(gpa, io, environ, .desktop);
    defer gpa.free(desktop);
    const cwd = try fsys.current_directory(gpa, io);
    defer gpa.free(cwd);
    const info = try fsys.path_info(io, cwd);
    _ = info;
    try fsys.create_directory(io, "/tmp/zdl-never/a/b");
    try fsys.rename(io, "a", "b");
    try fsys.copy_file(io, "a", "b");
    try fsys.remove(io, "a");

    var dir = try fsys.open_directory(io, cwd);
    defer dir.close(io);
    while (try dir.next(io)) |entry| {
        _ = entry.name;
        _ = entry.kind;
    }

    var matches = try fsys.glob_directory(gpa, io, cwd, "*.zig", .{ .case_insensitive = true });
    defer matches.deinit();

    _ = zdl.glob.match("*/x?.zig", "a/xb.zig");
    _ = zdl.user_dirs.lookup(gpa, "XDG_DESKTOP_DIR=\"$HOME/Desktop\"\n", "DESKTOP", "/home/u") catch {};

    var title = try zdl.storage.Storage.open_title(gpa, io, null);
    defer title.deinit();
    var user = try zdl.storage.Storage.open_user(gpa, io, environ, null, "app");
    defer user.deinit();
    var files = try zdl.storage.Storage.open_file(gpa, io, "/tmp/zdl-never");
    defer files.deinit();

    _ = title.ready();
    _ = files.space_remaining();
    _ = try title.path_info(io, "data/file.bin");
    var buffer: [16]u8 = undefined;
    title.read_file(io, "data/file.bin", &buffer) catch {};
    files.write_file(io, "out.txt", "hello") catch {};
    files.create_directory(io, "sub/dir") catch {};
    files.remove(io, "out.txt") catch {};
    files.rename(io, "a", "b") catch {};
    files.copy_file(io, "a", "b") catch {};
    var storage_dir = try files.open_directory(io, "");
    defer storage_dir.close(io);
    var storage_matches = try files.glob(gpa, io, "", "*", .{});
    defer storage_matches.deinit();
}
