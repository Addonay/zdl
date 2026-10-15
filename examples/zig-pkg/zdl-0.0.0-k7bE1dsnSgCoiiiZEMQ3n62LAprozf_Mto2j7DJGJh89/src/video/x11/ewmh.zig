//! Window state as the window manager and server report it: _NET_WM_STATE
//! (EWMH), WM_STATE (ICCCM) and the map state. SDL's X11_GetNetWMState and the
//! PropertyNotify handling in SDL_x11events.c are the reference.
//!
//! Reading is a snapshot: each call asks the server, so it reflects WM-initiated
//! changes (maximize, minimize, fullscreen from a keyboard shortcut or a
//! compositor) once the server has processed them. Callers learn that something
//! changed from the `window_state_changed` event and then call again.
//!
//! Deliberate differences from SDL: SDL keeps the window's previous flags and
//! uses them to decide fullscreen-versus-maximized and whether an unmanaged
//! window's own report counts. This layer keeps no cached flags, so each field
//! here is the raw server report. A fullscreen window the WM also maximizes
//! therefore reports both `fullscreen` and `maximized`.
const std = @import("std");
const window = @import("window.zig");
const xlib = @import("xlib.zig");

/// Typed snapshot of a window's manager-visible state.
pub const WindowState = struct {
    /// Both _NET_WM_STATE_MAXIMIZED_VERT and _NET_WM_STATE_MAXIMIZED_HORZ are set.
    maximized: bool = false,
    fullscreen: bool = false,
    /// _NET_WM_STATE_HIDDEN, or WM_STATE is IconicState (3).
    minimized: bool = false,
    /// The window is not mapped (map_state is not viewable), or WM_STATE is
    /// WithdrawnState (0). Compositors may hide a mapped window without
    /// unmapping it, so `minimized` can be set with this clear.
    hidden: bool = false,
    /// _NET_WM_STATE_ABOVE: kept above normal windows.
    always_on_top: bool = false,
    /// _NET_WM_STATE_FOCUSED: the window manager gives this window the focus.
    focused: bool = false,
    /// _NET_WM_STATE_DEMANDS_ATTENTION: the WM is flagging the window (urgency).
    demands_attention: bool = false,
    /// _NET_WM_STATE_MODAL.
    modal: bool = false,
    /// _NET_WM_STATE_SKIP_TASKBAR and _NET_WM_STATE_SKIP_PAGER (utility windows).
    skip_taskbar: bool = false,
    skip_pager: bool = false,
};

/// WM_STATE values (ICCCM 4.1.3.1).
const wm_state_withdrawn: c_long = 0;
const wm_state_iconic: c_long = 3;

/// Reads the window's state. Properties that are missing or malformed read as
/// absent. The caller checks that the window is alive first.
pub fn read(connection: *const window.Connection, id: xlib.Window) WindowState {
    const api = &connection.library.functions;
    const display = connection.display;
    var state: WindowState = .{};

    var attributes: xlib.XWindowAttributes = undefined;
    if (api.XGetWindowAttributes(display, id, &attributes) != 0) {
        state.hidden = attributes.map_state != xlib.map_state_viewable;
    }

    if (read_atoms(api, display, id, connection.atom(._NET_WM_STATE))) |atoms| {
        defer _ = api.XFree(@ptrCast(atoms.data));
        var maximized_vertical = false;
        var maximized_horizontal = false;
        for (atoms.items) |atom| {
            if (atom == connection.atom(._NET_WM_STATE_HIDDEN)) {
                state.minimized = true;
            } else if (atom == connection.atom(._NET_WM_STATE_FOCUSED)) {
                state.focused = true;
            } else if (atom == connection.atom(._NET_WM_STATE_MAXIMIZED_VERT)) {
                maximized_vertical = true;
            } else if (atom == connection.atom(._NET_WM_STATE_MAXIMIZED_HORZ)) {
                maximized_horizontal = true;
            } else if (atom == connection.atom(._NET_WM_STATE_FULLSCREEN)) {
                state.fullscreen = true;
            } else if (atom == connection.atom(._NET_WM_STATE_ABOVE)) {
                state.always_on_top = true;
            } else if (atom == connection.atom(._NET_WM_STATE_DEMANDS_ATTENTION)) {
                state.demands_attention = true;
            } else if (atom == connection.atom(._NET_WM_STATE_MODAL)) {
                state.modal = true;
            } else if (atom == connection.atom(._NET_WM_STATE_SKIP_TASKBAR)) {
                state.skip_taskbar = true;
            } else if (atom == connection.atom(._NET_WM_STATE_SKIP_PAGER)) {
                state.skip_pager = true;
            }
        }
        state.maximized = maximized_vertical and maximized_horizontal;
    }

    if (read_wm_state(api, display, id, connection.atom(.WM_STATE))) |value| {
        if (value == wm_state_iconic) state.minimized = true;
        if (value == wm_state_withdrawn) state.hidden = true;
    }
    return state;
}

/// True when a PropertyNotify for `atom` means the state must be read again.
/// Both _NET_WM_STATE and WM_STATE qualify.
pub fn is_state_property(connection: *const window.Connection, atom: xlib.Atom) bool {
    return atom == connection.atom(._NET_WM_STATE) or atom == connection.atom(.WM_STATE);
}

/// Property values of format 32 read as native longs or atoms.
const Atoms = struct {
    data: [*]u8,
    items: []const xlib.Atom,
};

/// Reads an array of atoms (format 32, type ATOM) up to 1024 entries. Caller frees
/// `data` with XFree.
fn read_atoms(api: *const xlib.Functions, display: *xlib.Display, id: xlib.Window, property: xlib.Atom) ?Atoms {
    var actual_type: xlib.Atom = 0;
    var format: c_int = 0;
    var count: c_ulong = 0;
    var after: c_ulong = 0;
    var data: ?[*]u8 = null;
    const status = api.XGetWindowProperty(display, id, property, 0, 1024, 0, xlib.xa_atom, &actual_type, &format, &count, &after, &data);
    if (status != 0 or format != 32 or actual_type != xlib.xa_atom) {
        if (data) |pointer| _ = api.XFree(@ptrCast(pointer));
        return null;
    }
    const pointer = data orelse return null;
    const values: [*]const xlib.Atom = @ptrCast(@alignCast(pointer));
    return .{ .data = pointer, .items = values[0..@intCast(count)] };
}

/// Reads the first item of WM_STATE (format 32). Returns null when absent.
fn read_wm_state(api: *const xlib.Functions, display: *xlib.Display, id: xlib.Window, property: xlib.Atom) ?c_long {
    var actual_type: xlib.Atom = 0;
    var format: c_int = 0;
    var count: c_ulong = 0;
    var after: c_ulong = 0;
    var data: ?[*]u8 = null;
    const status = api.XGetWindowProperty(display, id, property, 0, 2, 0, property, &actual_type, &format, &count, &after, &data);
    defer if (data) |pointer| {
        _ = api.XFree(@ptrCast(pointer));
    };
    if (status != 0 or format != 32 or count == 0) return null;
    const pointer = data orelse return null;
    const values: [*]const c_long = @ptrCast(@alignCast(pointer));
    return values[0];
}
