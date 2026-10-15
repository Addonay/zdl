//! Message box through the zenity command (port of SDL_zenitymessagebox.c).
//!
//! The dialog is `zenity --question --switch --no-wrap --no-markup` with
//! `--icon`/`--icon-name` (chosen from the zenity version), `--title`, `--text`
//! and one `--extra-button` per button. Zenity prints the label of the pressed
//! extra button on stdout. As in SDL, any exit status except 255 means the dialog
//! was shown. Status 255 and termination by a signal are failures.
//!
//! Ownership: the argument vector lives in a temporary arena. The caller's
//! strings are passed to the child process by reference only.
//!
//! Deliberate differences from SDL:
//! - The version check is always run before the dialog, as in SDL. It is not
//!   cached, so each call costs one extra process. Calls are rare, and a cache
//!   would be hidden global state.
//! - stdout is always captured, even when the caller does not want a button id.
//!   SDL discards it in that case. The result is simply not used.
//! - kdialog is not supported. SDL does not have a kdialog backend either.
const std = @import("std");
const message_box = @import("message_box.zig");

/// Maximum buttons zenity accepts (MAX_BUTTONS in SDL_zenitymessagebox.c).
pub const max_buttons = 8;

pub const Error = error{
    /// More buttons than `max_buttons`.
    TooManyButtons,
    /// zenity could not be started (not installed or not executable).
    SpawnFailed,
    /// zenity's version output could not be parsed, or the dialog failed with a
    /// signal or an exit status of 255.
    DialogFailed,
    OutOfMemory,
};

/// zenity's version as major and minor numbers. Micro and suffix are ignored.
pub const Version = struct {
    major: u32,
    minor: u32,

    /// Parses "MAJOR[.MINOR][...]" (parse_zenity_version). A missing minor is 0.
    pub fn parse(text: []const u8) ?Version {
        const major = leading_number(text) orelse return null;
        if (major.end == text.len or text[major.end] != '.') {
            return .{ .major = major.value, .minor = 0 };
        }
        const minor = leading_number(text[major.end + 1 ..]) orelse return null;
        return .{ .major = major.value, .minor = minor.value };
    }

    /// zenity 3.90 renamed `--icon-name` to `--icon`. Newer releases accept only
    /// the new spelling.
    fn icon_option(self: Version) []const u8 {
        return if (self.major > 3 or (self.major == 3 and self.minor >= 90)) "--icon" else "--icon-name";
    }
};

const Number = struct { value: u32, end: usize };

/// Decimal digits at the start of `text`. Null when there are none.
fn leading_number(text: []const u8) ?Number {
    var value: u32 = 0;
    var end: usize = 0;
    while (end < text.len and std.ascii.isDigit(text[end])) : (end += 1) {
        value = value *| 10 +| (text[end] - '0');
    }
    if (end == 0) return null;
    return .{ .value = value, .end = end };
}

/// Runs `zenity --version` and parses it (SDL_get_zenity_version).
pub fn version(gpa: std.mem.Allocator, io: std.Io) Error!Version {
    const result = std.process.run(gpa, io, .{
        .argv = &.{ "zenity", "--version" },
        .reserve_amount = 32,
    }) catch return error.SpawnFailed;
    defer gpa.free(result.stdout);
    defer gpa.free(result.stderr);
    return Version.parse(result.stdout) orelse error.DialogFailed;
}

/// Shows `data` through zenity and blocks until it closes. Returns the id of the
/// button whose label zenity printed, or null when no label matched (for example
/// the window was closed). Returns `error.DialogFailed` when zenity exits with
/// status 255 or is killed by a signal.
pub fn show(gpa: std.mem.Allocator, io: std.Io, data: message_box.Data) Error!?i32 {
    if (data.buttons.len > max_buttons) return error.TooManyButtons;
    const zenity_version = try version(gpa, io);

    var arena_state = std.heap.ArenaAllocator.init(gpa);
    defer arena_state.deinit();
    const arena = arena_state.allocator();

    var args: std.ArrayList([]const u8) = .empty;
    try args.appendSlice(arena, &.{ "zenity", "--question", "--switch", "--no-wrap", "--no-markup" });
    try args.append(arena, zenity_version.icon_option());
    try args.append(arena, switch (data.flags.severity()) {
        .@"error" => "dialog-error",
        .warning => "dialog-warning",
        .information => "dialog-information",
    });
    if (data.title.len != 0) {
        try args.appendSlice(arena, &.{ "--title", data.title });
    } else {
        try args.append(arena, "--title=");
    }
    if (data.message.len != 0) {
        try args.appendSlice(arena, &.{ "--text", data.message });
    } else {
        try args.append(arena, "--text=");
    }
    for (data.buttons) |button| {
        if (button.text.len != 0) {
            try args.appendSlice(arena, &.{ "--extra-button", button.text });
        } else {
            try args.append(arena, "--extra-button=");
        }
    }
    // SDL shows a default OK button when the caller gives none.
    if (data.buttons.len == 0) try args.append(arena, "--extra-button=OK");

    const result = std.process.run(gpa, io, .{
        .argv = args.items,
        .reserve_amount = 256,
    }) catch return error.SpawnFailed;
    defer gpa.free(result.stdout);
    defer gpa.free(result.stderr);

    const code: u8 = switch (result.term) {
        .exited => |status| status,
        else => return error.DialogFailed,
    };
    if (code == 255) return error.DialogFailed;

    // zenity appends a newline; SDL keeps the text before the last one.
    var label = result.stdout;
    if (std.mem.lastIndexOfScalar(u8, label, '\n')) |newline| label = label[0..newline];
    for (data.buttons) |button| {
        if (std.mem.eql(u8, label, button.text)) return button.id;
    }
    return null;
}
