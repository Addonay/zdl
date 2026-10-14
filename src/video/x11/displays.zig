//! Displays through RandR (libXrandr): outputs, CRTCs and modes reduced to
//! bounds, refresh rates, the primary output and mode switching for exclusive
//! fullscreen. Follows SDL_x11modes.c: connected outputs are listed with the
//! CRTC that drives them, their current mode gives the bounds in root
//! coordinates, and the refresh rate is dot clock over total pixels per frame.
//!
//! Ownership: `query` returns an OutputList that owns its names and mode lists
//! through the allocator it was given. Output values are copies and stay valid
//! after the server changes its configuration; re-query after a
//! `display_changed` event to see the new layout.
//!
//! Deliberate differences: SDL caches the original mode on every display and
//! restores it through its own video subsystem. Here the caller keeps the
//! `Output` it switched from and passes it back to `set_mode` to restore. Output
//! names are truncated to 63 bytes, since RandR names are not otherwise bounded.
const std = @import("std");
const geometry = @import("../geometry.zig");
const xlib = @import("xlib.zig");

pub const Error = std.mem.Allocator.Error || error{ ExtensionUnavailable, OutputUnavailable, ModeUnavailable, ModeChangeFailed };

/// A display mode: pixel size and refresh rate. `id` is the RandR mode id.
pub const Mode = struct {
    id: u64,
    width: u32,
    height: u32,
    refresh_hz: f64,
};

/// One connected output. `bounds` is the CRTC rectangle in root coordinates, or
/// zero-sized when the output is connected but switched off (crtc == 0).
pub const Output = struct {
    id: u64,
    crtc: u64,
    connected: bool,
    primary: bool,
    bounds: geometry.Rect(i32),
    /// Refresh rate of the current mode, or 0 when the output is off.
    refresh_hz: f64,
    /// Current mode id, or 0 when off.
    mode: u64,
    physical_width_mm: u32,
    physical_height_mm: u32,
    name_buffer: [64]u8 = @splat(0),
    name_length: u8 = 0,
    /// Modes the output supports. Owned by the OutputList.
    modes: []Mode = &.{},

    /// Output name as the server reports it (for example "DP-1").
    pub fn name(self: *const Output) []const u8 {
        return self.name_buffer[0..self.name_length];
    }
};

/// Owns the outputs returned by `query` and each mode list.
pub const OutputList = struct {
    allocator: std.mem.Allocator,
    items: []Output,

    pub fn deinit(self: *OutputList) void {
        for (self.items) |output| self.allocator.free(output.modes);
        self.allocator.free(self.items);
        self.* = undefined;
    }
};

/// Requires RandR 1.2 or newer (GetScreenResourcesCurrent, GetOutputPrimary).
/// Returns ExtensionUnavailable when libXrandr is missing or too old.
fn require_randr(library: *xlib.Library, display: *xlib.Display) Error!xlib.Xrandr {
    const randr = library.xrandr orelse return error.ExtensionUnavailable;
    var base: c_int = 0;
    var error_base: c_int = 0;
    if (randr.XRRQueryExtension(display, &base, &error_base) == 0) return error.ExtensionUnavailable;
    var major: c_int = 0;
    var minor: c_int = 0;
    _ = randr.XRRQueryVersion(display, &major, &minor);
    if (major < 1 or (major == 1 and minor < 2)) return error.ExtensionUnavailable;
    return randr;
}

/// Subscribes `window` (normally the root) to screen-size, output and CRTC
/// changes. Notifications arrive as `Event.Payload.display_changed` once the
/// connection maps the RandR event base.
pub fn select_events(library: *xlib.Library, display: *xlib.Display, window: xlib.Window) Error!void {
    const randr = try require_randr(library, display);
    randr.XRRSelectInput(display, window, xlib.rr_screen_change_notify_mask | xlib.rr_output_change_notify_mask | xlib.rr_crtc_change_notify_mask);
}

/// Returns the RandR event base when the extension is usable, for mapping
/// notifications in the event loop.
pub fn event_base(library: *xlib.Library, display: *xlib.Display) ?c_int {
    const randr = require_randr(library, display) catch return null;
    var base: c_int = 0;
    var error_base: c_int = 0;
    if (randr.XRRQueryExtension(display, &base, &error_base) == 0) return null;
    return base;
}

/// Reads all connected outputs of the root window's screen. The primary output
/// is the one the server reports through XRRGetOutputPrimary (none when unset).
pub fn query(allocator: std.mem.Allocator, library: *xlib.Library, display: *xlib.Display, root: xlib.Window) Error!OutputList {
    const randr = try require_randr(library, display);
    const resources = randr.XRRGetScreenResourcesCurrent(display, root) orelse return error.OutputUnavailable;
    defer randr.XRRFreeScreenResources(resources);
    const primary_output = randr.XRRGetOutputPrimary(display, root);

    var items: std.ArrayList(Output) = .empty;
    errdefer {
        for (items.items) |output| allocator.free(output.modes);
        items.deinit(allocator);
    }
    const output_count: usize = @intCast(@max(resources.noutput, 0));
    for (0..output_count) |index| {
        const output_id = resources.outputs.?[index];
        const info = randr.XRRGetOutputInfo(display, resources, output_id) orelse continue;
        defer randr.XRRFreeOutputInfo(info);
        if (info.connection != xlib.rr_connected) continue;

        var output: Output = .{
            .id = output_id,
            .crtc = info.crtc,
            .connected = true,
            .primary = output_id == primary_output,
            .bounds = .{ .x = 0, .y = 0, .width = 0, .height = 0 },
            .refresh_hz = 0,
            .mode = 0,
            .physical_width_mm = @intCast(info.mm_width),
            .physical_height_mm = @intCast(info.mm_height),
        };
        if (info.name) |text| {
            const length = @min(@as(usize, @intCast(@max(info.name_len, 0))), output.name_buffer.len - 1);
            @memcpy(output.name_buffer[0..length], text[0..length]);
            output.name_length = @intCast(length);
        }

        output.modes = try list_modes(allocator, resources, info);
        errdefer allocator.free(output.modes);
        if (info.crtc != 0) {
            const crtc = randr.XRRGetCrtcInfo(display, resources, info.crtc) orelse return error.OutputUnavailable;
            defer randr.XRRFreeCrtcInfo(crtc);
            output.bounds = .{ .x = crtc.x, .y = crtc.y, .width = @intCast(crtc.width), .height = @intCast(crtc.height) };
            output.mode = crtc.mode;
            if (find_mode(resources, crtc.mode)) |mode| output.refresh_hz = refresh_of(mode);
        }
        try items.append(allocator, output);
    }
    return .{ .allocator = allocator, .items = try items.toOwnedSlice(allocator) };
}

/// Modes listed by the output, resolved against the screen's mode table.
fn list_modes(allocator: std.mem.Allocator, resources: *xlib.XRRScreenResources, info: *xlib.XRROutputInfo) std.mem.Allocator.Error![]Mode {
    var modes: std.ArrayList(Mode) = .empty;
    errdefer modes.deinit(allocator);
    const count: usize = @intCast(@max(info.nmode, 0));
    for (0..count) |index| {
        const id = info.modes.?[index];
        const mode = find_mode(resources, id) orelse continue;
        try modes.append(allocator, .{
            .id = id,
            .width = mode.width,
            .height = mode.height,
            .refresh_hz = refresh_of(mode),
        });
    }
    return modes.toOwnedSlice(allocator);
}

fn find_mode(resources: *xlib.XRRScreenResources, id: u64) ?*xlib.XRRModeInfo {
    const count: usize = @intCast(@max(resources.nmode, 0));
    for (0..count) |index| {
        const mode = &resources.modes.?[index];
        if (mode.id == id) return mode;
    }
    return null;
}

/// Refresh rate in hertz: dot clock divided by total pixels per frame (SDL_x11modes.c).
fn refresh_of(mode: *const xlib.XRRModeInfo) f64 {
    const total = @as(f64, @floatFromInt(mode.h_total)) * @as(f64, @floatFromInt(mode.v_total));
    if (total == 0) return 0;
    return @as(f64, @floatFromInt(mode.dot_clock)) / total;
}

/// Switches `output` to `mode` at its current position (exclusive fullscreen).
/// The screen size is set to the mode size, as SDL does when it changes a mode.
/// Pass the Output from before the switch to restore its previous mode.
pub fn set_mode(library: *xlib.Library, display: *xlib.Display, root: xlib.Window, output: Output, mode: Mode) Error!void {
    const randr = try require_randr(library, display);
    if (output.crtc == 0) return error.OutputUnavailable;
    const resources = randr.XRRGetScreenResourcesCurrent(display, root) orelse return error.OutputUnavailable;
    defer randr.XRRFreeScreenResources(resources);
    const crtc = randr.XRRGetCrtcInfo(display, resources, output.crtc) orelse return error.OutputUnavailable;
    defer randr.XRRFreeCrtcInfo(crtc);

    // The screen is sized to the mode before the CRTC is switched, so the CRTC always fits.
    randr.XRRSetScreenSize(display, root, @intCast(mode.width), @intCast(mode.height), @intCast(output.physical_width_mm), @intCast(output.physical_height_mm));
    var outputs = [_]xlib.RROutput{output.id};
    const status = randr.XRRSetCrtcConfig(display, resources, output.crtc, 0, crtc.x, crtc.y, mode.id, 1, &outputs, 1);
    if (status != 0) return error.ModeChangeFailed;
}
