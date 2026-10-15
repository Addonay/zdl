//! Text input through X input methods (XIM/XIC): one input context per window.
//! Each context first asks for preedit callbacks (XIMPreeditCallbacks |
//! XIMStatusNothing), so composition reaches the program as PreeditStart/Draw/
//! Caret/Done updates that `Manager.take_preedit` reports. An input method that
//! refuses that style gets the older XIMPreeditNothing context, which reports
//! committed text only, as before.
//!
//! Committed text arrives as UTF-8 through Xutf8LookupString in both styles.
//! Key events must pass through `filter` before they are interpreted as keys: an
//! input method that consumes a press (composition in progress) returns true and
//! no text or key event should be produced for it.
//!
//! Ownership: `Manager` owns the contexts (each a heap `Context` holding the
//! XIC and its Preedit state) and closes the input method in `deinit`. It borrows
//! the Xlib function table and display from its Connection. The spot location is
//! in window coordinates; the input method uses it to place its candidate window.
//!
//! Deliberate differences from SDL: the status area stays with the input method
//! (XIMStatusNothing), composition is reported as text plus caret without a
//! selection length, and text-editing events are produced by the Connection
//! from the snapshot this module returns.
const std = @import("std");
const xlib = @import("xlib.zig");

pub const Error = std.mem.Allocator.Error || error{TextInputUnavailable};

/// Maximum UTF-8 bytes reported by one committed-text event. Longer commits are split.
pub const chunk_capacity = 64;

/// Capacity of the larger payloads (composition text, dropped lines). Longer
/// strings are split at character boundaries by `split_chunk`.
pub const extended_capacity = 128;

/// One input context: the XIC and the composition state its callbacks write.
/// Allocated by the Manager so the callbacks' client data stays valid.
pub const Context = struct {
    xic: *xlib.XIC,
    preedit: xlib.Preedit = .{},
};

pub const Manager = struct {
    allocator: std.mem.Allocator,
    method: ?*xlib.XIM = null,
    contexts: std.AutoHashMapUnmanaged(xlib.Window, *Context) = .empty,

    pub fn init(allocator: std.mem.Allocator) Manager {
        return .{ .allocator = allocator };
    }

    /// Destroys every context and closes the input method.
    pub fn deinit(self: *Manager, api: *const xlib.Functions) void {
        var iterator = self.contexts.valueIterator();
        while (iterator.next()) |context| {
            api.XDestroyIC(context.*.xic);
            self.allocator.destroy(context.*);
        }
        self.contexts.deinit(self.allocator);
        if (self.method) |method| _ = api.XCloseIM(method);
        self.* = undefined;
    }

    /// Creates the input context for `window` (opening the input method on
    /// first use). Returns TextInputUnavailable when the server has no input
    /// method or rejects every style. Enabling twice keeps one context.
    pub fn enable(self: *Manager, api: *const xlib.Functions, display: *xlib.Display, window: xlib.Window) Error!void {
        if (self.contexts.contains(window)) return;
        const method = try self.open_method(api, display);
        const context = try self.allocator.create(Context);
        errdefer self.allocator.destroy(context);
        context.* = .{ .xic = undefined };
        context.xic = create_with_callbacks(api, method, window, &context.preedit) orelse
            create_plain(api, method, window) orelse return error.TextInputUnavailable;
        self.contexts.put(self.allocator, window, context) catch |err| {
            api.XDestroyIC(context.xic);
            return err;
        };
    }

    fn open_method(self: *Manager, api: *const xlib.Functions, display: *xlib.Display) Error!*xlib.XIM {
        if (self.method) |method| return method;
        // An empty modifier string selects the locale's input method (XMODIFIERS);
        // "@im=none" falls back to plain compose processing when none is configured.
        if (api.XSetLocaleModifiers("") == null) _ = api.XSetLocaleModifiers("@im=none");
        const method = api.XOpenIM(display, null, null, null) orelse return error.TextInputUnavailable;
        self.method = method;
        return method;
    }

    /// Destroys the context for `window`, if any.
    pub fn disable(self: *Manager, api: *const xlib.Functions, window: xlib.Window) void {
        if (self.contexts.fetchRemove(window)) |entry| {
            api.XDestroyIC(entry.value.xic);
            self.allocator.destroy(entry.value);
        }
    }

    /// Sets the candidate-window location in window coordinates.
    pub fn set_spot(self: *Manager, api: *const xlib.Functions, window: xlib.Window, x: i16, y: i16) Error!void {
        const context = self.contexts.get(window) orelse return error.TextInputUnavailable;
        var spot: xlib.XPoint = .{ .x = x, .y = y };
        const attributes = api.XVaCreateNestedList(0, @as([*:0]const u8, xlib.xn_spot_location), &spot, @as(?*anyopaque, null));
        if (attributes == null) return error.TextInputUnavailable;
        defer _ = api.XFree(attributes);
        _ = api.XSetICValues(context.xic, @as([*:0]const u8, xlib.xn_preedit_attributes), attributes, @as(?*anyopaque, null));
    }

    /// Tells the input method whether `window` has keyboard focus.
    pub fn set_focus(self: *Manager, api: *const xlib.Functions, window: xlib.Window, focused: bool) void {
        const context = self.contexts.get(window) orelse return;
        if (focused) api.XSetICFocus(context.xic) else api.XUnsetICFocus(context.xic);
    }

    /// Passes an event through the input method. True means the method consumed it.
    pub fn filter(self: *const Manager, api: *const xlib.Functions, event: *xlib.Event, window: xlib.Window) bool {
        if (self.method == null) return false;
        return api.XFilterEvent(event, window) != 0;
    }

    /// The composition of `window` if a preedit callback changed it since the
    /// last call. The slice is valid until the next callback or `disable`; copy it first.
    pub fn take_preedit(self: *Manager, window: xlib.Window) ?xlib.Preedit.Snapshot {
        const context = self.contexts.get(window) orelse return null;
        return context.preedit.take();
    }

    /// Committed text of a key press, written into `buffer` as UTF-8. Returns
    /// the number of bytes, zero when the key produced no text or the window has no context.
    pub fn lookup(self: *const Manager, api: *const xlib.Functions, window: xlib.Window, key: *xlib.KeyEvent, buffer: []u8) usize {
        const context = self.contexts.get(window) orelse return 0;
        var status: xlib.Status = 0;
        const length = api.Xutf8LookupString(context.xic, key, buffer.ptr, @intCast(buffer.len), null, &status);
        if (length <= 0) return 0;
        if (status != xlib.lookup_chars and status != xlib.lookup_both) return 0;
        return @intCast(length);
    }
};

/// Context with preedit callbacks: the composition is reported to `preedit`.
/// Returns null when the input method rejects the style.
fn create_with_callbacks(api: *const xlib.Functions, method: *xlib.XIM, window: xlib.Window, preedit: *xlib.Preedit) ?*xlib.XIC {
    var callbacks = xlib.PreeditCallbacks.for_preedit(preedit);
    const nested = api.XVaCreateNestedList(
        0,
        @as([*:0]const u8, xlib.xn_preedit_start_callback),
        &callbacks.start,
        @as([*:0]const u8, xlib.xn_preedit_done_callback),
        &callbacks.done,
        @as([*:0]const u8, xlib.xn_preedit_draw_callback),
        &callbacks.draw,
        @as([*:0]const u8, xlib.xn_preedit_caret_callback),
        &callbacks.caret,
        @as(?*anyopaque, null),
    ) orelse return null;
    defer _ = api.XFree(nested);
    return api.XCreateIC(
        method,
        @as([*:0]const u8, xlib.xn_input_style),
        @as(c_ulong, xlib.xim_preedit_callbacks | xlib.xim_status_nothing),
        @as([*:0]const u8, xlib.xn_client_window),
        @as(c_ulong, window),
        @as([*:0]const u8, xlib.xn_focus_window),
        @as(c_ulong, window),
        @as([*:0]const u8, xlib.xn_preedit_attributes),
        nested,
        @as(?*anyopaque, null),
    );
}

/// Context with no preedit reporting (the input method draws it), used when the
/// callback style is refused. Only committed text is available from it.
fn create_plain(api: *const xlib.Functions, method: *xlib.XIM, window: xlib.Window) ?*xlib.XIC {
    return api.XCreateIC(
        method,
        @as([*:0]const u8, xlib.xn_input_style),
        @as(c_ulong, xlib.xim_preedit_nothing | xlib.xim_status_nothing),
        @as([*:0]const u8, xlib.xn_client_window),
        @as(c_ulong, window),
        @as([*:0]const u8, xlib.xn_focus_window),
        @as(c_ulong, window),
        @as(?*anyopaque, null),
    );
}

/// Splits UTF-8 text into pieces of at most `capacity` bytes, never cutting a
/// code point. Invalid trailing bytes are kept as-is.
/// The head of a split text and the remainder after it.
pub const Split = struct { chunk: []const u8, rest: []const u8 };

/// Splits UTF-8 text at most `capacity` bytes from its start.
pub fn split_chunk(text: []const u8, capacity: usize) Split {
    if (text.len <= capacity) return .{ .chunk = text, .rest = text[text.len..] };
    var end: usize = capacity;
    while (end > 0 and (text[end] & 0xC0) == 0x80) end -= 1;
    if (end == 0) end = capacity;
    return .{ .chunk = text[0..end], .rest = text[end..] };
}

/// Splits committed UTF-8 text into pieces of at most `chunk_capacity` bytes.
pub fn next_chunk(text: []const u8) Split {
    return split_chunk(text, chunk_capacity);
}
