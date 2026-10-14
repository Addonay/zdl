//! Opens a URL with the desktop's default handler, as SDL_OpenURL and
//! src/misc/unix/SDL_sysurl.c. The Linux path runs `xdg-open <url>` as a background
//! child with a copy of the caller's environment, minus `LD_PRELOAD` (SDL clears it
//! so browsers launched from Steam start correctly).
//!
//! Deliberate differences from SDL:
//! - The D-Bus `org.freedesktop.portal.OpenURI` route is not ported; it needs a
//!   D-Bus wire-protocol client, which is deferred. `xdg-open` covers the same
//!   desktops by delegating to the portal itself where available.
//! - The Wayland activation token is a parameter instead of being read from the
//!   video driver. Pass it when the caller has one; SDL sets `XDG_ACTIVATION_TOKEN`.
//! - The environment is an explicit argument; there is no implicit copy of global
//!   process state.
const std = @import("std");
const process = @import("process.zig");

/// Errors from `open`.
pub const OpenError = process.SpawnError || std.mem.Allocator.Error || error{InvalidUrl};

/// Optional activation token for focus handoff on Wayland.
pub const Options = struct {
    /// Exported to the launched handler as `XDG_ACTIVATION_TOKEN` when set.
    activation_token: ?[]const u8 = null,
};

/// Opens `url` with `xdg-open`. Returns once the handler has been started; the
/// handler's exit status is not waited for, as with SDL. The launcher is detached
/// from the handle, and a process still running when this returns is not killed.
///
/// `env` supplies the base environment. It is copied, never modified.
pub fn open(
    gpa: std.mem.Allocator,
    io: std.Io,
    env: *const std.process.Environ.Map,
    url: []const u8,
    options: Options,
) OpenError!void {
    if (url.len == 0) return error.InvalidUrl;

    var child_env = std.process.Environ.Map.init(gpa);
    defer child_env.deinit();
    var entries = env.iterator();
    while (entries.next()) |entry| {
        // LD_PRELOAD injected by a launcher such as Steam breaks browsers started here.
        if (std.mem.eql(u8, entry.key_ptr.*, "LD_PRELOAD")) continue;
        try child_env.put(entry.key_ptr.*, entry.value_ptr.*);
    }
    if (options.activation_token) |token| try child_env.put("XDG_ACTIVATION_TOKEN", token);

    const argv = [_][]const u8{ "xdg-open", url };
    var handler = try process.spawn(io, .{
        .argv = &argv,
        .env = &child_env,
        .stdin = .ignore,
        .stdout = .ignore,
        .stderr = .ignore,
        .background = true,
    });
    handler.deinit(io);
}
