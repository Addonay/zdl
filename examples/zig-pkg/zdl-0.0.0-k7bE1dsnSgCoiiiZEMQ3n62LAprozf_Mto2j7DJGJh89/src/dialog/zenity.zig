//! Fallback file dialog that runs `zenity --file-selection` (ports
//! `SDL_zenitydialog.c`). Used when the portal is unavailable.
//!
//! The argument vector follows SDL's format:
//!   zenity --file-selection --separator=\n [--multiple] [--directory |
//!          --save --confirm-overwrite] [--filename F] [--modal --attach W]
//!          [--title T] [--ok-label L] [--cancel-label C] [--file-filter=N | G ...]...
//!
//! Exit codes: 0 selected, 1 cancelled. Any other status is `error.DialogFailed`,
//! and so is a missing zenity binary.
//!
//! Deliberate differences from SDL:
//! - SDL sets ZENITY_OK/CANCEL/ESC/... overrides in a new environment. Replacing
//!   the environment here would drop the inherited one (DISPLAY, PATH), so the
//!   default exit codes are used.
//! - `--attach` is passed whenever the parent is an X11 window. SDL first runs
//!   `zenity --version` and requires 3.6 or later.
//! - The `*` filter becomes `*` rather than SDL's `*.*`, which hides files
//!   without an extension.
//! - An empty selection with exit code 0 or 1 is `Outcome.cancelled`; SDL reports
//!   one empty path.

const std = @import("std");
const Allocator = std.mem.Allocator;
const dialog = @import("dialog.zig");

pub const Error = dialog.Error || error{
    /// zenity could not be started (not installed or not executable).
    SpawnFailed,
    /// zenity exited with a status other than 0 or 1.
    DialogFailed,
    OutOfMemory,
};

/// Shows the dialog through zenity. `io` is the caller's `std.Io` used to run
/// the child. Blocks until zenity exits. Paths in the outcome are owned by `gpa`.
pub fn run(gpa: Allocator, io: std.Io, request: dialog.Request) Error!dialog.Outcome {
    try dialog.validate_filters(request.filters);

    var arena_state = std.heap.ArenaAllocator.init(gpa);
    defer arena_state.deinit();
    const arena = arena_state.allocator();

    const argv = try build_argv(arena, request);
    const result = std.process.run(gpa, io, .{
        .argv = argv,
        .reserve_amount = 256,
    }) catch return error.SpawnFailed;
    defer gpa.free(result.stdout);
    defer gpa.free(result.stderr);

    const code: u8 = switch (result.term) {
        .exited => |c| c,
        else => return error.DialogFailed,
    };
    if (code != 0 and code != 1) return error.DialogFailed;
    if (code == 1) return .cancelled;
    return parse_selection(gpa, result.stdout);
}

/// Splits zenity's newline-separated output into owned paths. An empty output
/// means nothing was chosen.
fn parse_selection(gpa: Allocator, stdout: []const u8) Error!dialog.Outcome {
    const text = std.mem.trimEnd(u8, stdout, "\n");
    if (text.len == 0) return .cancelled;
    var paths: std.ArrayList([]u8) = .empty;
    errdefer {
        for (paths.items) |p| gpa.free(p);
        paths.deinit(gpa);
    }
    var it = std.mem.splitScalar(u8, text, '\n');
    while (it.next()) |line| try paths.append(gpa, try gpa.dupe(u8, line));
    return .{ .selected = try paths.toOwnedSlice(gpa) };
}

/// Builds the argument vector. All strings live in `arena`.
fn build_argv(arena: Allocator, request: dialog.Request) Error![]const []const u8 {
    var args: std.ArrayList([]const u8) = .empty;
    try args.appendSlice(arena, &.{ "zenity", "--file-selection", "--separator=\n" });
    if (request.allow_many) try args.append(arena, "--multiple");
    switch (request.kind) {
        .open_file => {},
        .save_file => try args.appendSlice(arena, &.{ "--save", "--confirm-overwrite" }),
        .open_folder => try args.append(arena, "--directory"),
    }
    if (request.default_location) |location| {
        try args.appendSlice(arena, &.{ "--filename", location });
    }
    if (request.parent) |parent| switch (parent) {
        .x11 => |id| {
            const handle = try std.fmt.allocPrint(arena, "0x{x}", .{id});
            try args.appendSlice(arena, &.{ "--modal", "--attach", handle });
        },
        .wayland_export => {},
    };
    if (request.title) |title| try args.appendSlice(arena, &.{ "--title", title });
    if (request.accept_label) |label| try args.appendSlice(arena, &.{ "--ok-label", label });
    if (request.cancel_label) |label| try args.appendSlice(arena, &.{ "--cancel-label", label });
    for (request.filters) |f| {
        // zenity separates the filter name from its globs with `|`, which must
        // therefore not appear inside the name.
        const name = try arena.dupe(u8, f.name);
        for (name) |*c| {
            if (c.* == '|') c.* = '/';
        }
        const globs = try dialog.glob_list(arena, f.pattern);
        const filter = try std.fmt.allocPrint(arena, "--file-filter={s} | {s}", .{ name, globs });
        try args.append(arena, filter);
    }
    return args.toOwnedSlice(arena);
}

test "zenity argument construction" {
    var arena_state = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena_state.deinit();
    const argv = try build_argv(arena_state.allocator(), .{
        .kind = .save_file,
        .filters = &.{.{ .name = "Images|x", .pattern = "png" }},
        .title = "Save",
    });
    try std.testing.expectEqualStrings("--save", argv[3]);
    try std.testing.expectEqualStrings("--file-filter=Images/x | *.[pP][nN][gG]", argv[argv.len - 1]);
}
