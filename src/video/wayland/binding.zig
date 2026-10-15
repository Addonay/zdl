//! Private libwayland binding for the Wayland backend. This is the only file in
//! the backend that declares C layouts or C-calling-convention functions.
//! `libwayland-client.so.0` is loaded with std.DynLib at explicit request
//! (`Library.open`), and `libwayland-cursor.so.0` on demand (`CursorLibrary.open`),
//! matching the ALSA loader: the application's root module must link libc because
//! std's dynamic loader uses dlopen.
//!
//! Event delivery: libwayland calls our listener functions from inside
//! `dispatch`. Each listener only copies the event into an `Inbox` owned by the
//! window; the window drains the inbox after dispatch returns, so no request is
//! sent and no user code runs inside a C callback. The inbox pointer is passed as
//! the listener's user data; it is private and never exposed.
//!
//! Ownership of copied payloads: text and MIME strings are duplicated into memory
//! from the inbox allocator and file descriptors are kept open. Whoever takes a
//! `Raw` from `Inbox.next` owns those resources; `Inbox.deinit` and a failed push
//! release them, so nothing leaks when the window is torn down with events
//! pending.
//!
//! Layouts: wl_interface, wl_message, wl_argument and wl_array follow the
//! libwayland-client headers (wayland-util.h); the listener is an array of
//! function pointers in event order, which is why every event of an interface
//! with a listener needs a slot, including ignored ones. Interface tables for
//! protocol objects come from the generated `protocol.zig`.

const std = @import("std");
const builtin = @import("builtin");
const Allocator = std.mem.Allocator;

/// Opaque `wl_proxy *` (display, registry, surfaces and all other objects).
pub const Proxy = *anyopaque;

/// struct wl_message { const char *name; const char *signature; const struct wl_interface **types; }
pub const Message = extern struct {
    name: [*:0]const u8,
    signature: [*:0]const u8,
    types: ?[*]const ?*const Interface,
};

/// struct wl_interface (wayland-util.h).
pub const Interface = extern struct {
    name: [*:0]const u8,
    version: c_int,
    method_count: c_int,
    methods: ?[*]const Message,
    event_count: c_int,
    events: ?[*]const Message,
};

/// union wl_argument, 8 bytes on every supported ABI.
pub const Argument = extern union {
    i: i32,
    u: u32,
    f: i32,
    s: ?[*:0]const u8,
    o: ?*anyopaque,
    n: u32,
    a: ?*anyopaque,
    h: i32,
};

pub const Error = std.DynLib.Error || Allocator.Error || error{
    LibraryNotLinked,
    MissingSymbol,
    ConnectFailed,
    RequestFailed,
    DispatchFailed,
    ListenerFailed,
    CursorFailed,
};

/// wl_fixed_t (24.8 signed fixed point) from a double, rounding to nearest and
/// saturating at the representable range.
pub fn fixed(value: f64) i32 {
    const scaled = std.math.clamp(@round(value * 256.0), -2147483648.0, 2147483647.0);
    return @intFromFloat(scaled);
}

/// Fixed-capacity copy of a C string that libwayland owns only during a callback.
pub const Name = struct {
    bytes: [128]u8 = undefined,
    len: u8 = 0,

    pub fn fill(self: *Name, text: []const u8) void {
        self.len = @intCast(@min(text.len, self.bytes.len));
        @memcpy(self.bytes[0..self.len], text[0..self.len]);
    }

    pub fn slice(self: *const Name) []const u8 {
        return self.bytes[0..self.len];
    }
};

/// Up to 16 xdg_toplevel state values copied from a configure array.
pub const StateList = struct {
    values: [16]u32 = undefined,
    len: u8 = 0,
};

/// One event copied from libwayland during dispatch. `proxy` is the object the
/// listener was attached to. Variants that carry `[]u8` or a file descriptor own
/// them (see the module comment).
pub const Event = union(enum) {
    registry_global: struct { name: u32, interface: Name, version: u32 },
    registry_global_remove: u32,
    callback_done: u32,
    wm_ping: u32,
    surface_configure: u32,
    toplevel_configure: struct { width: i32, height: i32, states: StateList },
    toplevel_close,
    buffer_release,
    fractional_preferred: u32,
    decoration_configure: u32,
    output_scale: i32,
    /// wl_output.geometry; `make` and `model` are copied.
    output_geometry: struct { x: i32, y: i32, physical_width: i32, physical_height: i32, transform: i32, make: Name, model: Name },
    /// wl_output.mode; flags bit 0 is current, bit 1 preferred. Refresh is in mHz.
    output_mode: struct { flags: u32, width: i32, height: i32, refresh: i32 },
    output_done,
    output_name: Name,
    output_description: Name,
    /// zxdg_output_v1 logical position and size (compositor coordinates).
    xdg_output_position: struct { x: i32, y: i32 },
    xdg_output_size: struct { width: i32, height: i32 },
    xdg_output_done,
    /// Drag-and-drop entry at surface-local `x`/`y` (wl_fixed raw values); `offer` may be null.
    drag_enter: struct { serial: u32, x: i32, y: i32, offer: ?Proxy },
    drag_motion: struct { time: u32, x: i32, y: i32 },
    drag_leave,
    drag_drop,
    /// xdg_popup.configure: position relative to the parent and size, in surface units.
    popup_configure: struct { x: i32, y: i32, width: i32, height: i32 },
    popup_done,
    /// xdg_popup.repositioned with the token of the reposition request.
    popup_repositioned: u32,
    seat_capabilities: u32,
    pointer_enter: struct { serial: u32, x: i32, y: i32 },
    pointer_leave: u32,
    pointer_motion: struct { time: u32, x: i32, y: i32 },
    pointer_button: struct { serial: u32, time: u32, button: u32, state: u32 },
    pointer_axis: struct { time: u32, axis: u32, value: i32 },
    /// End of one logical pointer frame; axis data is accumulated until here (wl_pointer v5).
    pointer_frame,
    /// wl_pointer.axis_source (0 wheel, 1 finger, 2 continuous, 3 wheel tilt).
    pointer_axis_source: u32,
    pointer_axis_stop: struct { time: u32, axis: u32 },
    /// Discrete wheel steps (wl_pointer v5, axis_discrete).
    pointer_axis_discrete: struct { axis: u32, discrete: i32 },
    /// High-resolution wheel delta in 1/120 step units (wl_pointer v8).
    pointer_axis_value120: struct { axis: u32, value120: i32 },
    /// wl_pointer v9: 0 identical to the physical motion, 1 inverted.
    pointer_axis_direction: struct { axis: u32, direction: u32 },
    keyboard_keymap: struct { format: u32, fd: i32, size: u32 },
    keyboard_enter: u32,
    keyboard_leave: u32,
    keyboard_key: struct { serial: u32, time: u32, key: u32, state: u32 },
    keyboard_modifiers: struct { depressed: u32, latched: u32, locked: u32, group: u32 },
    keyboard_repeat: struct { rate: i32, delay: i32 },
    touch_down: struct { serial: u32, time: u32, id: i32, x: i32, y: i32 },
    touch_up: struct { serial: u32, time: u32, id: i32 },
    touch_motion: struct { time: u32, id: i32, x: i32, y: i32 },
    touch_frame,
    touch_cancel,
    /// New `wl_data_offer` created by a data device (owned by the window).
    data_offer: Proxy,
    /// Current clipboard offer, or null when the selection was cleared.
    data_selection: ?Proxy,
    /// MIME type offered by a `wl_data_offer`. `mime` is owned.
    data_offer_mime: struct { offer: Proxy, mime: []u8 },
    /// Compositor asks us to write the source's data for `mime` into `fd`.
    /// `mime` is owned and `fd` must be closed by the consumer.
    data_source_send: struct { source: Proxy, mime: []u8, fd: i32 },
    data_source_cancelled: Proxy,
    /// Same as the data device variants, for the primary selection protocol.
    primary_offer: Proxy,
    primary_selection: ?Proxy,
    primary_offer_mime: struct { offer: Proxy, mime: []u8 },
    primary_source_send: struct { source: Proxy, mime: []u8, fd: i32 },
    primary_source_cancelled: Proxy,
    /// Text-input preedit; `text` is owned. Cursor offsets are byte positions.
    text_preedit: struct { text: []u8, cursor_begin: i32, cursor_end: i32 },
    /// Committed text; `text` is owned.
    text_commit: []u8,
    text_delete_surrounding: struct { before: u32, after: u32 },
    /// End of a text-input batch; the serial matches the last commit we sent.
    text_done: u32,
    /// Unaccelerated/accelerated relative motion. Times are the 64-bit microsecond
    /// clock split into halves, as the protocol sends them.
    relative_motion: struct { time_hi: u32, time_lo: u32, dx: i32, dy: i32, dx_unaccel: i32, dy_unaccel: i32 },
    locked_pointer: bool,
    confined_pointer: bool,
    /// Activation token returned for `get_activation_token`; `token` is owned.
    activation_token: []u8,
    /// Drag source: a target performed the drop. The source stays alive until
    /// `drag_source_finished`. `proxy` is the `wl_data_source`.
    drag_source_dropped: Proxy,
    /// Drag source finished (dnd_finished, or the drag was cancelled). `proxy` is
    /// the `wl_data_source`; the owner releases it.
    drag_source_finished: Proxy,
    /// `zwp_tablet_seat_v2.tool_added`; `proxy` is the new tool, whose events
    /// follow on its own listener.
    tablet_tool_added: Proxy,
    /// `zwp_tablet_tool_v2` description and state events (see the protocol).
    tablet_tool_type: u32,
    tablet_tool_wacom_id: u32,
    tablet_tool_capability: u32,
    tablet_tool_done,
    tablet_tool_removed,
    tablet_tool_proximity_in: struct { serial: u32, surface: ?Proxy },
    tablet_tool_proximity_out,
    tablet_tool_down: u32,
    tablet_tool_up,
    /// Surface-local motion in wl_fixed units.
    tablet_tool_motion: struct { x: i32, y: i32 },
    tablet_tool_pressure: u32,
    tablet_tool_distance: u32,
    /// Tilt in wl_fixed degrees.
    tablet_tool_tilt: struct { x: i32, y: i32 },
    /// Z rotation in wl_fixed degrees.
    tablet_tool_rotation: i32,
    tablet_tool_slider: i32,
    tablet_tool_button: struct { serial: u32, button: u32, pressed: bool },
    /// End of one tool frame; `time` is the millisecond timestamp.
    tablet_tool_frame: u32,
};

pub const Raw = struct {
    proxy: ?Proxy,
    event: Event,
};

/// Frees the resources an event owns (fds and copied strings). Called for events
/// that never reach the owner.
fn release_event(allocator: Allocator, event: Event) void {
    switch (event) {
        .keyboard_keymap => |map| _ = std.os.linux.close(map.fd),
        .data_source_send => |send| {
            _ = std.os.linux.close(send.fd);
            allocator.free(send.mime);
        },
        .primary_source_send => |send| {
            _ = std.os.linux.close(send.fd);
            allocator.free(send.mime);
        },
        .data_offer_mime => |offer| allocator.free(offer.mime),
        .primary_offer_mime => |offer| allocator.free(offer.mime),
        .text_preedit => |text| allocator.free(text.text),
        .text_commit => |text| allocator.free(text),
        .activation_token => |token| allocator.free(token),
        else => {},
    }
}

/// Queue filled by listeners and drained by the owner. Pushes never fail
/// visibly: an allocation failure sets `dropped` and releases the event.
pub const Inbox = struct {
    allocator: Allocator,
    items: std.ArrayList(Raw) = .empty,
    head: usize = 0,
    dropped: bool = false,

    pub fn deinit(self: *Inbox) void {
        for (self.items.items[self.head..]) |raw| release_event(self.allocator, raw.event);
        self.items.deinit(self.allocator);
    }

    /// Removes the oldest event. The caller owns the resources it carries.
    pub fn next(self: *Inbox) ?Raw {
        if (self.head >= self.items.items.len) {
            self.items.clearRetainingCapacity();
            self.head = 0;
            return null;
        }
        const raw = self.items.items[self.head];
        self.head += 1;
        return raw;
    }

    fn push(self: *Inbox, raw: Raw) void {
        self.items.append(self.allocator, raw) catch {
            self.dropped = true;
            release_event(self.allocator, raw.event);
        };
    }
};

/// Function pointers resolved from libwayland-client. Field `x` binds symbol
/// `wl_x`; every type matches the C prototype in wayland-client-core.h.
const Functions = struct {
    display_connect: *const fn (?[*:0]const u8) callconv(.c) ?*anyopaque,
    display_disconnect: *const fn (Proxy) callconv(.c) void,
    display_get_fd: *const fn (Proxy) callconv(.c) c_int,
    display_flush: *const fn (Proxy) callconv(.c) c_int,
    display_roundtrip: *const fn (Proxy) callconv(.c) c_int,
    display_dispatch: *const fn (Proxy) callconv(.c) c_int,
    display_dispatch_pending: *const fn (Proxy) callconv(.c) c_int,
    display_prepare_read: *const fn (Proxy) callconv(.c) c_int,
    display_read_events: *const fn (Proxy) callconv(.c) c_int,
    display_cancel_read: *const fn (Proxy) callconv(.c) void,
    display_get_error: *const fn (Proxy) callconv(.c) c_int,
    proxy_marshal_array_flags: *const fn (Proxy, u32, ?*const Interface, u32, u32, ?[*]Argument) callconv(.c) ?*anyopaque,
    proxy_add_listener: *const fn (Proxy, *const anyopaque, ?*anyopaque) callconv(.c) c_int,
    proxy_destroy: *const fn (Proxy) callconv(.c) void,
    proxy_get_version: *const fn (Proxy) callconv(.c) u32,
};

/// Interface symbols exported by libwayland-client (`wl_x_interface`, data).
const Interfaces = struct {
    display: *const Interface,
    registry: *const Interface,
    callback: *const Interface,
    compositor: *const Interface,
    surface: *const Interface,
    region: *const Interface,
    shm: *const Interface,
    shm_pool: *const Interface,
    buffer: *const Interface,
    data_device_manager: *const Interface,
    data_device: *const Interface,
    data_source: *const Interface,
    data_offer: *const Interface,
    seat: *const Interface,
    pointer: *const Interface,
    keyboard: *const Interface,
    touch: *const Interface,
    output: *const Interface,
};

/// A loaded libwayland-client. Owns the DynLib handle; close after every
/// display, proxy and listener user has been destroyed. Do not copy an open Library.
pub const Library = struct {
    handle: std.DynLib,
    functions: Functions,
    interfaces: Interfaces,

    /// Loads the system library. Requires `root_module.link_libc = true` in the
    /// application because std's dynamic loader uses libc's dlopen.
    pub fn open() Error!Library {
        if (builtin.target.os.tag != .linux) @compileError("Wayland is a Linux backend");
        if (!builtin.link_libc) @compileError("Wayland loading requires application root_module.link_libc = true");
        var handle = try std.DynLib.open("libwayland-client.so.0");
        errdefer handle.close();
        var functions: Functions = undefined;
        const fn_info = @typeInfo(Functions).@"struct";
        inline for (fn_info.field_names, fn_info.field_types) |field_name, FieldType| {
            const symbol: [:0]const u8 = "wl_" ++ field_name;
            @field(functions, field_name) = handle.lookup(FieldType, symbol) orelse return error.MissingSymbol;
        }
        var interfaces: Interfaces = undefined;
        const if_info = @typeInfo(Interfaces).@"struct";
        inline for (if_info.field_names, if_info.field_types) |field_name, FieldType| {
            const symbol: [:0]const u8 = "wl_" ++ field_name ++ "_interface";
            @field(interfaces, field_name) = handle.lookup(FieldType, symbol) orelse return error.MissingSymbol;
        }
        return .{ .handle = handle, .functions = functions, .interfaces = interfaces };
    }

    pub fn close(self: *Library) void {
        self.handle.close();
        self.* = undefined;
    }

    /// Connects to the display named by the environment (WAYLAND_DISPLAY,
    /// WAYLAND_SOCKET, XDG_RUNTIME_DIR), exactly as libwayland does.
    pub fn connect(self: *const Library) Error!Proxy {
        const display = self.functions.display_connect(null) orelse return error.ConnectFailed;
        return display;
    }

    pub fn disconnect(self: *const Library, display: Proxy) void {
        self.functions.display_disconnect(display);
    }

    /// Writes buffered requests. Returns an error when the socket is gone.
    pub fn flush(self: *const Library, display: Proxy) Error!void {
        if (self.functions.display_flush(display) < 0) return error.DispatchFailed;
    }

    /// Blocks in libwayland until a round trip completes; events are queued in the inbox.
    pub fn roundtrip(self: *const Library, display: Proxy) Error!void {
        if (self.functions.display_roundtrip(display) < 0) return error.DispatchFailed;
    }

    /// Dispatches events already read into libwayland's queue.
    pub fn dispatch_pending(self: *const Library, display: Proxy) Error!void {
        if (self.functions.display_dispatch_pending(display) < 0) return error.DispatchFailed;
    }

    /// Reads the socket once if no other thread holds the read lock. `ready`
    /// is false when the socket had nothing to read this time.
    pub fn read(self: *const Library, display: Proxy, ready: bool) Error!void {
        while (self.functions.display_prepare_read(display) != 0) {
            try self.dispatch_pending(display);
        }
        if (!ready) {
            self.functions.display_cancel_read(display);
            return;
        }
        if (self.functions.display_read_events(display) < 0) return error.DispatchFailed;
    }

    pub fn fd(self: *const Library, display: Proxy) i32 {
        return self.functions.display_get_fd(display);
    }

    pub fn display_error(self: *const Library, display: Proxy) i32 {
        return self.functions.display_get_error(display);
    }

    /// Creates an object for a request whose new_id is typed by `interface`. The
    /// new object takes the version of `object`, as wayland-scanner's code does.
    pub fn constructor(self: *const Library, object: Proxy, opcode: u32, interface: *const Interface, args: []const Argument) Error!Proxy {
        const version = self.functions.proxy_get_version(object);
        return self.constructor_version(object, opcode, interface, version, args);
    }

    /// Creates an object with an explicit version (untyped `wl_registry.bind`).
    pub fn constructor_version(self: *const Library, object: Proxy, opcode: u32, interface: *const Interface, version: u32, args: []const Argument) Error!Proxy {
        const created = self.marshal(object, opcode, interface, version, args);
        return created orelse error.RequestFailed;
    }

    /// Sends a request that creates no object.
    pub fn send(self: *const Library, object: Proxy, opcode: u32, args: []const Argument) void {
        _ = self.marshal(object, opcode, null, self.functions.proxy_get_version(object), args);
    }

    // libwayland replaces new_id argument slots with the created proxy. Generated
    // request literals can live in read-only memory in optimized builds, so every
    // call receives its own writable copy. No pointer is retained by libwayland.
    fn marshal(self: *const Library, object: Proxy, opcode: u32, interface: ?*const Interface, version: u32, args: []const Argument) ?Proxy {
        var writable: [32]Argument = undefined;
        std.debug.assert(args.len <= writable.len); // All generated request signatures fit.
        @memcpy(writable[0..args.len], args);
        return self.functions.proxy_marshal_array_flags(object, opcode, interface, version, 0, if (args.len == 0) null else &writable);
    }

    /// Attaches `listener` (one function pointer per event, in event order) with
    /// `inbox` as user data. The listener array must outlive the proxy.
    pub fn listen(self: *const Library, object: Proxy, listener: []const ?*const anyopaque, inbox: *Inbox) Error!void {
        if (self.functions.proxy_add_listener(object, @ptrCast(listener.ptr), inbox) != 0) return error.ListenerFailed;
    }

    pub fn destroy(self: *const Library, object: Proxy) void {
        self.functions.proxy_destroy(object);
    }
};

// ---- libwayland-cursor (loaded separately, on first cursor use) ----

/// struct wl_cursor_image: one frame of a theme cursor.
const CursorImageC = extern struct {
    width: u32,
    height: u32,
    hotspot_x: u32,
    hotspot_y: u32,
    delay: u32,
};

/// struct wl_cursor: all frames of one named cursor.
const CursorC = extern struct {
    image_count: c_uint,
    images: ?[*]*CursorImageC,
    name: ?[*:0]u8,
};

/// One frame of a theme cursor, with the wl_buffer libwayland-cursor created for it.
pub const CursorFrame = struct {
    width: u32,
    height: u32,
    hotspot_x: u32,
    hotspot_y: u32,
    delay_ms: u32,
    buffer: Proxy,
};

/// A named cursor from a loaded theme. Valid until the theme is destroyed.
pub const ThemeCursor = struct {
    ptr: *const CursorC,

    pub fn frame_count(self: ThemeCursor) usize {
        return self.ptr.image_count;
    }
};

/// Handle to a loaded cursor theme (libwayland-cursor's wl_cursor_theme).
pub const CursorTheme = struct {
    handle: *anyopaque,
};

/// libwayland-cursor entry points. Loaded only when the backend first needs a
/// theme cursor, so applications that never set one do not require it.
pub const CursorLibrary = struct {
    handle: std.DynLib,
    theme_load: *const fn (?[*:0]const u8, c_int, Proxy) callconv(.c) ?*anyopaque,
    theme_destroy: *const fn (*anyopaque) callconv(.c) void,
    theme_get_cursor: *const fn (*anyopaque, [*:0]const u8) callconv(.c) ?*CursorC,
    image_get_buffer: *const fn (*CursorImageC) callconv(.c) ?Proxy,
    frame_and_duration: *const fn (*CursorC, u32, ?*u32) callconv(.c) c_int,

    pub fn open() Error!CursorLibrary {
        var handle = std.DynLib.open("libwayland-cursor.so.0") catch return error.LibraryNotLinked;
        errdefer handle.close();
        return .{
            .handle = handle,
            .theme_load = handle.lookup(@FieldType(CursorLibrary, "theme_load"), "wl_cursor_theme_load") orelse return error.MissingSymbol,
            .theme_destroy = handle.lookup(@FieldType(CursorLibrary, "theme_destroy"), "wl_cursor_theme_destroy") orelse return error.MissingSymbol,
            .theme_get_cursor = handle.lookup(@FieldType(CursorLibrary, "theme_get_cursor"), "wl_cursor_theme_get_cursor") orelse return error.MissingSymbol,
            .image_get_buffer = handle.lookup(@FieldType(CursorLibrary, "image_get_buffer"), "wl_cursor_image_get_buffer") orelse return error.MissingSymbol,
            .frame_and_duration = handle.lookup(@FieldType(CursorLibrary, "frame_and_duration"), "wl_cursor_frame_and_duration") orelse return error.MissingSymbol,
        };
    }

    pub fn close(self: *CursorLibrary) void {
        self.handle.close();
        self.* = undefined;
    }

    /// Loads `name` (null selects libwayland's default theme) at `size` pixels,
    /// using `shm` for the cursor buffers. Destroy with `theme_free`.
    pub fn load_theme(self: *const CursorLibrary, name: ?[:0]const u8, size: u32, shm: Proxy) Error!CursorTheme {
        const size_c = std.math.cast(c_int, size) orelse return error.CursorFailed;
        const handle = self.theme_load(if (name) |text| text.ptr else null, size_c, shm) orelse return error.CursorFailed;
        return .{ .handle = handle };
    }

    pub fn free_theme(self: *const CursorLibrary, theme: CursorTheme) void {
        self.theme_destroy(theme.handle);
    }

    /// Finds `name` in the theme; null when the theme lacks it.
    pub fn find(self: *const CursorLibrary, theme: CursorTheme, name: [:0]const u8) ?ThemeCursor {
        const ptr = self.theme_get_cursor(theme.handle, name.ptr) orelse return null;
        return .{ .ptr = ptr };
    }

    /// Frame `index` of a cursor, with the buffer libwayland created for it.
    pub fn frame(self: *const CursorLibrary, cursor: ThemeCursor, index: usize) Error!CursorFrame {
        const images = cursor.ptr.images orelse return error.CursorFailed;
        if (index >= cursor.ptr.image_count) return error.CursorFailed;
        const image = images[index];
        const buffer = self.image_get_buffer(image) orelse return error.CursorFailed;
        return .{
            .width = image.width,
            .height = image.height,
            .hotspot_x = image.hotspot_x,
            .hotspot_y = image.hotspot_y,
            .delay_ms = image.delay,
            .buffer = buffer,
        };
    }

    /// Index of the animation frame showing at `time_ms`, and the time it stays on screen.
    pub fn frame_at(self: *const CursorLibrary, cursor: ThemeCursor, time_ms: u32) struct { index: usize, duration_ms: u32 } {
        var duration: u32 = 0;
        const index = self.frame_and_duration(@constCast(cursor.ptr), time_ms, &duration);
        return .{ .index = @intCast(@max(index, 0)), .duration_ms = duration };
    }
};

// ---- listener callbacks: copy into the inbox, nothing else ----

fn inbox_of(data: ?*anyopaque) *Inbox {
    return @ptrCast(@alignCast(data.?));
}

fn emit(data: ?*anyopaque, proxy: ?*anyopaque, event: Event) void {
    inbox_of(data).push(.{ .proxy = proxy, .event = event });
}

/// Owned copy of a C string (empty for null). Null on allocation failure, which
/// also marks the inbox dropped.
fn copy_text(data: ?*anyopaque, text: ?[*:0]const u8) ?[]u8 {
    const inbox = inbox_of(data);
    const span: []const u8 = if (text) |bytes| std.mem.span(bytes) else "";
    return inbox.allocator.dupe(u8, span) catch {
        inbox.dropped = true;
        return null;
    };
}

fn registry_global(data: ?*anyopaque, registry: ?*anyopaque, name: u32, interface: ?[*:0]const u8, version: u32) callconv(.c) void {
    var copied: Name = .{};
    if (interface) |text| copied.fill(std.mem.span(text));
    emit(data, registry, .{ .registry_global = .{ .name = name, .interface = copied, .version = version } });
}

fn registry_global_remove(data: ?*anyopaque, registry: ?*anyopaque, name: u32) callconv(.c) void {
    emit(data, registry, .{ .registry_global_remove = name });
}

fn callback_done(data: ?*anyopaque, callback: ?*anyopaque, serial: u32) callconv(.c) void {
    emit(data, callback, .{ .callback_done = serial });
}

fn wm_base_ping(data: ?*anyopaque, wm_base: ?*anyopaque, serial: u32) callconv(.c) void {
    emit(data, wm_base, .{ .wm_ping = serial });
}

fn xdg_surface_configure(data: ?*anyopaque, xdg_surface: ?*anyopaque, serial: u32) callconv(.c) void {
    emit(data, xdg_surface, .{ .surface_configure = serial });
}

fn toplevel_configure(data: ?*anyopaque, toplevel: ?*anyopaque, width: i32, height: i32, states: ?*anyopaque) callconv(.c) void {
    var list: StateList = .{};
    if (states) |raw| {
        const array: *const WlArray = @ptrCast(@alignCast(raw));
        if (array.data) |bytes| {
            const words: [*]const u32 = @ptrCast(@alignCast(bytes));
            const count = @min(array.size / @sizeOf(u32), list.values.len);
            @memcpy(list.values[0..count], words[0..count]);
            list.len = @intCast(count);
        }
    }
    emit(data, toplevel, .{ .toplevel_configure = .{ .width = width, .height = height, .states = list } });
}

fn toplevel_close(data: ?*anyopaque, toplevel: ?*anyopaque) callconv(.c) void {
    emit(data, toplevel, .toplevel_close);
}

fn toplevel_configure_bounds(data: ?*anyopaque, toplevel: ?*anyopaque, width: i32, height: i32) callconv(.c) void {
    _ = .{ data, toplevel, width, height };
}

fn toplevel_wm_capabilities(data: ?*anyopaque, toplevel: ?*anyopaque, caps: ?*anyopaque) callconv(.c) void {
    _ = .{ data, toplevel, caps };
}

fn decoration_configure(data: ?*anyopaque, decoration: ?*anyopaque, mode: u32) callconv(.c) void {
    emit(data, decoration, .{ .decoration_configure = mode });
}

fn fractional_preferred(data: ?*anyopaque, fractional: ?*anyopaque, scale: u32) callconv(.c) void {
    emit(data, fractional, .{ .fractional_preferred = scale });
}

/// Copies an optional C string into a `Name` (empty for null).
fn name_of(text: ?[*:0]const u8) Name {
    var copied: Name = .{};
    if (text) |bytes| copied.fill(std.mem.span(bytes));
    return copied;
}

fn output_geometry(data: ?*anyopaque, output: ?*anyopaque, x: i32, y: i32, pw: i32, ph: i32, subpixel: i32, make: ?[*:0]const u8, model: ?[*:0]const u8, transform: i32) callconv(.c) void {
    _ = subpixel;
    emit(data, output, .{ .output_geometry = .{
        .x = x,
        .y = y,
        .physical_width = pw,
        .physical_height = ph,
        .transform = transform,
        .make = name_of(make),
        .model = name_of(model),
    } });
}

fn output_mode(data: ?*anyopaque, output: ?*anyopaque, flags: u32, width: i32, height: i32, refresh: i32) callconv(.c) void {
    emit(data, output, .{ .output_mode = .{ .flags = flags, .width = width, .height = height, .refresh = refresh } });
}

fn output_done(data: ?*anyopaque, output: ?*anyopaque) callconv(.c) void {
    emit(data, output, .output_done);
}

fn output_scale(data: ?*anyopaque, output: ?*anyopaque, factor: i32) callconv(.c) void {
    emit(data, output, .{ .output_scale = factor });
}

fn output_name(data: ?*anyopaque, output: ?*anyopaque, name: ?[*:0]const u8) callconv(.c) void {
    emit(data, output, .{ .output_name = name_of(name) });
}

fn output_description(data: ?*anyopaque, output: ?*anyopaque, description: ?[*:0]const u8) callconv(.c) void {
    emit(data, output, .{ .output_description = name_of(description) });
}

fn xdg_output_logical_position(data: ?*anyopaque, xdg_output: ?*anyopaque, x: i32, y: i32) callconv(.c) void {
    emit(data, xdg_output, .{ .xdg_output_position = .{ .x = x, .y = y } });
}

fn xdg_output_logical_size(data: ?*anyopaque, xdg_output: ?*anyopaque, width: i32, height: i32) callconv(.c) void {
    emit(data, xdg_output, .{ .xdg_output_size = .{ .width = width, .height = height } });
}

fn xdg_output_done(data: ?*anyopaque, xdg_output: ?*anyopaque) callconv(.c) void {
    emit(data, xdg_output, .xdg_output_done);
}

/// Names and descriptions from zxdg_output duplicate wl_output's (v4), so they are ignored.
fn xdg_output_name(data: ?*anyopaque, xdg_output: ?*anyopaque, name: ?[*:0]const u8) callconv(.c) void {
    _ = .{ data, xdg_output, name };
}

fn xdg_output_description(data: ?*anyopaque, xdg_output: ?*anyopaque, description: ?[*:0]const u8) callconv(.c) void {
    _ = .{ data, xdg_output, description };
}

fn seat_capabilities(data: ?*anyopaque, seat: ?*anyopaque, caps: u32) callconv(.c) void {
    emit(data, seat, .{ .seat_capabilities = caps });
}

fn seat_name(data: ?*anyopaque, seat: ?*anyopaque, name: ?[*:0]const u8) callconv(.c) void {
    _ = .{ data, seat, name };
}

fn pointer_enter(data: ?*anyopaque, pointer: ?*anyopaque, serial: u32, surface: ?*anyopaque, x: i32, y: i32) callconv(.c) void {
    _ = surface;
    emit(data, pointer, .{ .pointer_enter = .{ .serial = serial, .x = x, .y = y } });
}

fn pointer_leave(data: ?*anyopaque, pointer: ?*anyopaque, serial: u32, surface: ?*anyopaque) callconv(.c) void {
    _ = surface;
    emit(data, pointer, .{ .pointer_leave = serial });
}

fn pointer_motion(data: ?*anyopaque, pointer: ?*anyopaque, time: u32, x: i32, y: i32) callconv(.c) void {
    emit(data, pointer, .{ .pointer_motion = .{ .time = time, .x = x, .y = y } });
}

fn pointer_button(data: ?*anyopaque, pointer: ?*anyopaque, serial: u32, time: u32, button: u32, state: u32) callconv(.c) void {
    emit(data, pointer, .{ .pointer_button = .{ .serial = serial, .time = time, .button = button, .state = state } });
}

fn pointer_axis(data: ?*anyopaque, pointer: ?*anyopaque, time: u32, axis: u32, value: i32) callconv(.c) void {
    emit(data, pointer, .{ .pointer_axis = .{ .time = time, .axis = axis, .value = value } });
}

fn pointer_frame(data: ?*anyopaque, pointer: ?*anyopaque) callconv(.c) void {
    emit(data, pointer, .pointer_frame);
}

fn pointer_axis_source(data: ?*anyopaque, pointer: ?*anyopaque, source: u32) callconv(.c) void {
    emit(data, pointer, .{ .pointer_axis_source = source });
}

fn pointer_axis_stop(data: ?*anyopaque, pointer: ?*anyopaque, time: u32, axis: u32) callconv(.c) void {
    emit(data, pointer, .{ .pointer_axis_stop = .{ .time = time, .axis = axis } });
}

fn pointer_axis_discrete(data: ?*anyopaque, pointer: ?*anyopaque, axis: u32, discrete: i32) callconv(.c) void {
    emit(data, pointer, .{ .pointer_axis_discrete = .{ .axis = axis, .discrete = discrete } });
}

fn pointer_axis_value120(data: ?*anyopaque, pointer: ?*anyopaque, axis: u32, value120: i32) callconv(.c) void {
    emit(data, pointer, .{ .pointer_axis_value120 = .{ .axis = axis, .value120 = value120 } });
}

fn pointer_axis_relative_direction(data: ?*anyopaque, pointer: ?*anyopaque, axis: u32, direction: u32) callconv(.c) void {
    emit(data, pointer, .{ .pointer_axis_direction = .{ .axis = axis, .direction = direction } });
}

fn keyboard_keymap(data: ?*anyopaque, keyboard: ?*anyopaque, format: u32, fd: i32, size: u32) callconv(.c) void {
    emit(data, keyboard, .{ .keyboard_keymap = .{ .format = format, .fd = fd, .size = size } });
}

fn keyboard_enter(data: ?*anyopaque, keyboard: ?*anyopaque, serial: u32, surface: ?*anyopaque, keys: ?*anyopaque) callconv(.c) void {
    _ = .{ surface, keys };
    emit(data, keyboard, .{ .keyboard_enter = serial });
}

fn keyboard_leave(data: ?*anyopaque, keyboard: ?*anyopaque, serial: u32, surface: ?*anyopaque) callconv(.c) void {
    _ = surface;
    emit(data, keyboard, .{ .keyboard_leave = serial });
}

fn keyboard_key(data: ?*anyopaque, keyboard: ?*anyopaque, serial: u32, time: u32, key: u32, state: u32) callconv(.c) void {
    emit(data, keyboard, .{ .keyboard_key = .{ .serial = serial, .time = time, .key = key, .state = state } });
}

fn keyboard_modifiers(data: ?*anyopaque, keyboard: ?*anyopaque, serial: u32, depressed: u32, latched: u32, locked: u32, group: u32) callconv(.c) void {
    _ = serial;
    emit(data, keyboard, .{ .keyboard_modifiers = .{ .depressed = depressed, .latched = latched, .locked = locked, .group = group } });
}

fn keyboard_repeat_info(data: ?*anyopaque, keyboard: ?*anyopaque, rate: i32, delay: i32) callconv(.c) void {
    emit(data, keyboard, .{ .keyboard_repeat = .{ .rate = rate, .delay = delay } });
}

fn touch_down(data: ?*anyopaque, touch: ?*anyopaque, serial: u32, time: u32, surface: ?*anyopaque, id: i32, x: i32, y: i32) callconv(.c) void {
    _ = surface;
    emit(data, touch, .{ .touch_down = .{ .serial = serial, .time = time, .id = id, .x = x, .y = y } });
}

fn touch_up(data: ?*anyopaque, touch: ?*anyopaque, serial: u32, time: u32, id: i32) callconv(.c) void {
    emit(data, touch, .{ .touch_up = .{ .serial = serial, .time = time, .id = id } });
}

fn touch_motion(data: ?*anyopaque, touch: ?*anyopaque, time: u32, id: i32, x: i32, y: i32) callconv(.c) void {
    emit(data, touch, .{ .touch_motion = .{ .time = time, .id = id, .x = x, .y = y } });
}

fn touch_frame(data: ?*anyopaque, touch: ?*anyopaque) callconv(.c) void {
    emit(data, touch, .touch_frame);
}

fn touch_cancel(data: ?*anyopaque, touch: ?*anyopaque) callconv(.c) void {
    emit(data, touch, .touch_cancel);
}

fn touch_shape(data: ?*anyopaque, touch: ?*anyopaque, id: i32, major: i32, minor: i32) callconv(.c) void {
    _ = .{ data, touch, id, major, minor };
}

fn touch_orientation(data: ?*anyopaque, touch: ?*anyopaque, id: i32, orientation: i32) callconv(.c) void {
    _ = .{ data, touch, id, orientation };
}

fn buffer_release(data: ?*anyopaque, buffer: ?*anyopaque) callconv(.c) void {
    emit(data, buffer, .buffer_release);
}

fn data_device_data_offer(data: ?*anyopaque, device: ?*anyopaque, offer: ?*anyopaque) callconv(.c) void {
    emit(data, device, .{ .data_offer = offer orelse return });
}

fn data_device_enter(data: ?*anyopaque, device: ?*anyopaque, serial: u32, surface: ?*anyopaque, x: i32, y: i32, offer: ?*anyopaque) callconv(.c) void {
    _ = surface;
    emit(data, device, .{ .drag_enter = .{ .serial = serial, .x = x, .y = y, .offer = offer } });
}

fn data_device_leave(data: ?*anyopaque, device: ?*anyopaque) callconv(.c) void {
    emit(data, device, .drag_leave);
}

fn data_device_motion(data: ?*anyopaque, device: ?*anyopaque, time: u32, x: i32, y: i32) callconv(.c) void {
    emit(data, device, .{ .drag_motion = .{ .time = time, .x = x, .y = y } });
}

fn data_device_drop(data: ?*anyopaque, device: ?*anyopaque) callconv(.c) void {
    emit(data, device, .drag_drop);
}

fn data_device_selection(data: ?*anyopaque, device: ?*anyopaque, offer: ?*anyopaque) callconv(.c) void {
    emit(data, device, .{ .data_selection = offer });
}

fn data_source_target(data: ?*anyopaque, source: ?*anyopaque, mime: ?[*:0]const u8) callconv(.c) void {
    _ = .{ data, source, mime };
}

fn data_source_send(data: ?*anyopaque, source: ?*anyopaque, mime: ?[*:0]const u8, fd: i32) callconv(.c) void {
    const copy = copy_text(data, mime) orelse return discard_fd(fd);
    emit(data, source, .{ .data_source_send = .{ .source = source orelse return discard_fd_owned(data, copy, fd), .mime = copy, .fd = fd } });
}

fn data_source_cancelled(data: ?*anyopaque, source: ?*anyopaque) callconv(.c) void {
    emit(data, source, .{ .data_source_cancelled = source orelse return });
}

fn data_source_dnd_drop_performed(data: ?*anyopaque, source: ?*anyopaque) callconv(.c) void {
    emit(data, source, .{ .drag_source_dropped = source orelse return });
}

fn data_source_dnd_finished(data: ?*anyopaque, source: ?*anyopaque) callconv(.c) void {
    emit(data, source, .{ .drag_source_finished = source orelse return });
}

fn data_source_action(data: ?*anyopaque, source: ?*anyopaque, action: u32) callconv(.c) void {
    _ = .{ data, source, action };
}

fn data_offer_offer(data: ?*anyopaque, offer: ?*anyopaque, mime: ?[*:0]const u8) callconv(.c) void {
    const copy = copy_text(data, mime) orelse return;
    emit(data, offer, .{ .data_offer_mime = .{ .offer = offer orelse return inbox_of(data).allocator.free(copy), .mime = copy } });
}

fn data_offer_source_actions(data: ?*anyopaque, offer: ?*anyopaque, actions: u32) callconv(.c) void {
    _ = .{ data, offer, actions };
}

fn data_offer_action(data: ?*anyopaque, offer: ?*anyopaque, action: u32) callconv(.c) void {
    _ = .{ data, offer, action };
}

fn primary_device_data_offer(data: ?*anyopaque, device: ?*anyopaque, offer: ?*anyopaque) callconv(.c) void {
    emit(data, device, .{ .primary_offer = offer orelse return });
}

fn primary_device_selection(data: ?*anyopaque, device: ?*anyopaque, offer: ?*anyopaque) callconv(.c) void {
    emit(data, device, .{ .primary_selection = offer });
}

fn primary_source_send(data: ?*anyopaque, source: ?*anyopaque, mime: ?[*:0]const u8, fd: i32) callconv(.c) void {
    const copy = copy_text(data, mime) orelse return discard_fd(fd);
    emit(data, source, .{ .primary_source_send = .{ .source = source orelse return discard_fd_owned(data, copy, fd), .mime = copy, .fd = fd } });
}

fn primary_source_cancelled(data: ?*anyopaque, source: ?*anyopaque) callconv(.c) void {
    emit(data, source, .{ .primary_source_cancelled = source orelse return });
}

fn primary_offer_offer(data: ?*anyopaque, offer: ?*anyopaque, mime: ?[*:0]const u8) callconv(.c) void {
    const copy = copy_text(data, mime) orelse return;
    emit(data, offer, .{ .primary_offer_mime = .{ .offer = offer orelse return inbox_of(data).allocator.free(copy), .mime = copy } });
}

/// Closes a descriptor the event will not carry (allocation failed).
fn discard_fd(fd: i32) void {
    _ = std.os.linux.close(fd);
}

fn discard_fd_owned(data: ?*anyopaque, copy: []u8, fd: i32) void {
    inbox_of(data).allocator.free(copy);
    discard_fd(fd);
}

fn text_input_enter(data: ?*anyopaque, text_input: ?*anyopaque, surface: ?*anyopaque) callconv(.c) void {
    _ = .{ data, text_input, surface };
}

fn text_input_leave(data: ?*anyopaque, text_input: ?*anyopaque, surface: ?*anyopaque) callconv(.c) void {
    _ = .{ data, text_input, surface };
}

fn text_input_preedit_string(data: ?*anyopaque, text_input: ?*anyopaque, text: ?[*:0]const u8, cursor_begin: i32, cursor_end: i32) callconv(.c) void {
    const copy = copy_text(data, text) orelse return;
    emit(data, text_input, .{ .text_preedit = .{ .text = copy, .cursor_begin = cursor_begin, .cursor_end = cursor_end } });
}

fn text_input_commit_string(data: ?*anyopaque, text_input: ?*anyopaque, text: ?[*:0]const u8) callconv(.c) void {
    const copy = copy_text(data, text) orelse return;
    emit(data, text_input, .{ .text_commit = copy });
}

fn text_input_delete_surrounding_text(data: ?*anyopaque, text_input: ?*anyopaque, before: u32, after: u32) callconv(.c) void {
    emit(data, text_input, .{ .text_delete_surrounding = .{ .before = before, .after = after } });
}

fn text_input_done(data: ?*anyopaque, text_input: ?*anyopaque, serial: u32) callconv(.c) void {
    emit(data, text_input, .{ .text_done = serial });
}

fn text_input_action(data: ?*anyopaque, text_input: ?*anyopaque, action: u32, serial: u32) callconv(.c) void {
    _ = .{ data, text_input, action, serial };
}

fn text_input_language(data: ?*anyopaque, text_input: ?*anyopaque, language: ?[*:0]const u8) callconv(.c) void {
    _ = .{ data, text_input, language };
}

fn text_input_preedit_hint(data: ?*anyopaque, text_input: ?*anyopaque, start: u32, end: u32, hint: u32) callconv(.c) void {
    _ = .{ data, text_input, start, end, hint };
}

fn relative_pointer_motion(data: ?*anyopaque, relative: ?*anyopaque, time_hi: u32, time_lo: u32, dx: i32, dy: i32, dx_unaccel: i32, dy_unaccel: i32) callconv(.c) void {
    emit(data, relative, .{ .relative_motion = .{
        .time_hi = time_hi,
        .time_lo = time_lo,
        .dx = dx,
        .dy = dy,
        .dx_unaccel = dx_unaccel,
        .dy_unaccel = dy_unaccel,
    } });
}

fn locked_pointer_locked(data: ?*anyopaque, locked: ?*anyopaque) callconv(.c) void {
    emit(data, locked, .{ .locked_pointer = true });
}

fn locked_pointer_unlocked(data: ?*anyopaque, locked: ?*anyopaque) callconv(.c) void {
    emit(data, locked, .{ .locked_pointer = false });
}

fn confined_pointer_confined(data: ?*anyopaque, confined: ?*anyopaque) callconv(.c) void {
    emit(data, confined, .{ .confined_pointer = true });
}

fn confined_pointer_unconfined(data: ?*anyopaque, confined: ?*anyopaque) callconv(.c) void {
    emit(data, confined, .{ .confined_pointer = false });
}

fn activation_token_done(data: ?*anyopaque, token_object: ?*anyopaque, token: ?[*:0]const u8) callconv(.c) void {
    const copy = copy_text(data, token) orelse return;
    emit(data, token_object, .{ .activation_token = copy });
}

fn popup_configure(data: ?*anyopaque, popup: ?*anyopaque, x: i32, y: i32, width: i32, height: i32) callconv(.c) void {
    emit(data, popup, .{ .popup_configure = .{ .x = x, .y = y, .width = width, .height = height } });
}

fn popup_done(data: ?*anyopaque, popup: ?*anyopaque) callconv(.c) void {
    emit(data, popup, .popup_done);
}

fn popup_repositioned(data: ?*anyopaque, popup: ?*anyopaque, token: u32) callconv(.c) void {
    emit(data, popup, .{ .popup_repositioned = token });
}

fn tablet_seat_tablet_added(data: ?*anyopaque, tablet_seat: ?*anyopaque, tablet: ?*anyopaque) callconv(.c) void {
    // Tablets and pads are not tracked, as in SDL: their events are never listened to.
    _ = .{ data, tablet_seat, tablet };
}

fn tablet_seat_tool_added(data: ?*anyopaque, tablet_seat: ?*anyopaque, tool: ?*anyopaque) callconv(.c) void {
    _ = tablet_seat;
    emit(data, tool, .{ .tablet_tool_added = tool orelse return });
}

fn tablet_seat_pad_added(data: ?*anyopaque, tablet_seat: ?*anyopaque, pad: ?*anyopaque) callconv(.c) void {
    _ = .{ data, tablet_seat, pad };
}

fn tablet_tool_type(data: ?*anyopaque, tool: ?*anyopaque, tool_type: u32) callconv(.c) void {
    emit(data, tool, .{ .tablet_tool_type = tool_type });
}

fn tablet_tool_hardware_serial(data: ?*anyopaque, tool: ?*anyopaque, serial_hi: u32, serial_lo: u32) callconv(.c) void {
    _ = .{ data, tool, serial_hi, serial_lo };
}

fn tablet_tool_hardware_id_wacom(data: ?*anyopaque, tool: ?*anyopaque, id_hi: u32, id_lo: u32) callconv(.c) void {
    _ = id_hi;
    emit(data, tool, .{ .tablet_tool_wacom_id = id_lo });
}

fn tablet_tool_capability(data: ?*anyopaque, tool: ?*anyopaque, capability: u32) callconv(.c) void {
    emit(data, tool, .{ .tablet_tool_capability = capability });
}

fn tablet_tool_done(data: ?*anyopaque, tool: ?*anyopaque) callconv(.c) void {
    emit(data, tool, .tablet_tool_done);
}

fn tablet_tool_removed(data: ?*anyopaque, tool: ?*anyopaque) callconv(.c) void {
    emit(data, tool, .tablet_tool_removed);
}

fn tablet_tool_proximity_in(data: ?*anyopaque, tool: ?*anyopaque, serial: u32, tablet: ?*anyopaque, surface: ?*anyopaque) callconv(.c) void {
    _ = tablet;
    emit(data, tool, .{ .tablet_tool_proximity_in = .{ .serial = serial, .surface = surface } });
}

fn tablet_tool_proximity_out(data: ?*anyopaque, tool: ?*anyopaque) callconv(.c) void {
    emit(data, tool, .tablet_tool_proximity_out);
}

fn tablet_tool_down(data: ?*anyopaque, tool: ?*anyopaque, serial: u32) callconv(.c) void {
    emit(data, tool, .{ .tablet_tool_down = serial });
}

fn tablet_tool_up(data: ?*anyopaque, tool: ?*anyopaque) callconv(.c) void {
    emit(data, tool, .tablet_tool_up);
}

fn tablet_tool_motion(data: ?*anyopaque, tool: ?*anyopaque, x: i32, y: i32) callconv(.c) void {
    emit(data, tool, .{ .tablet_tool_motion = .{ .x = x, .y = y } });
}

fn tablet_tool_pressure(data: ?*anyopaque, tool: ?*anyopaque, pressure: u32) callconv(.c) void {
    emit(data, tool, .{ .tablet_tool_pressure = pressure });
}

fn tablet_tool_distance(data: ?*anyopaque, tool: ?*anyopaque, distance: u32) callconv(.c) void {
    emit(data, tool, .{ .tablet_tool_distance = distance });
}

fn tablet_tool_tilt(data: ?*anyopaque, tool: ?*anyopaque, x: i32, y: i32) callconv(.c) void {
    emit(data, tool, .{ .tablet_tool_tilt = .{ .x = x, .y = y } });
}

fn tablet_tool_rotation(data: ?*anyopaque, tool: ?*anyopaque, degrees: i32) callconv(.c) void {
    emit(data, tool, .{ .tablet_tool_rotation = degrees });
}

fn tablet_tool_slider(data: ?*anyopaque, tool: ?*anyopaque, position: i32) callconv(.c) void {
    emit(data, tool, .{ .tablet_tool_slider = position });
}

fn tablet_tool_wheel(data: ?*anyopaque, tool: ?*anyopaque, degrees: i32, clicks: i32) callconv(.c) void {
    // Wheel tool axes are not reported, as in SDL.
    _ = .{ data, tool, degrees, clicks };
}

fn tablet_tool_button(data: ?*anyopaque, tool: ?*anyopaque, serial: u32, button: u32, state: u32) callconv(.c) void {
    emit(data, tool, .{ .tablet_tool_button = .{ .serial = serial, .button = button, .pressed = state == 1 } });
}

fn tablet_tool_frame(data: ?*anyopaque, tool: ?*anyopaque, time: u32) callconv(.c) void {
    emit(data, tool, .{ .tablet_tool_frame = time });
}

/// struct wl_array (wayland-util.h); the C layout used by configure states.
const WlArray = extern struct {
    size: usize,
    alloc: usize,
    data: ?*anyopaque,
};

// Listener arrays: one slot per event in the interface's XML order.
pub const registry_listener = [_]?*const anyopaque{ @ptrCast(&registry_global), @ptrCast(&registry_global_remove) };
pub const callback_listener = [_]?*const anyopaque{@ptrCast(&callback_done)};
pub const wm_base_listener = [_]?*const anyopaque{@ptrCast(&wm_base_ping)};
pub const xdg_surface_listener = [_]?*const anyopaque{@ptrCast(&xdg_surface_configure)};
pub const toplevel_listener = [_]?*const anyopaque{
    @ptrCast(&toplevel_configure),
    @ptrCast(&toplevel_close),
    @ptrCast(&toplevel_configure_bounds),
    @ptrCast(&toplevel_wm_capabilities),
};
pub const decoration_listener = [_]?*const anyopaque{@ptrCast(&decoration_configure)};
pub const fractional_listener = [_]?*const anyopaque{@ptrCast(&fractional_preferred)};
pub const output_listener = [_]?*const anyopaque{
    @ptrCast(&output_geometry),
    @ptrCast(&output_mode),
    @ptrCast(&output_done),
    @ptrCast(&output_scale),
    @ptrCast(&output_name),
    @ptrCast(&output_description),
};
pub const xdg_output_listener = [_]?*const anyopaque{
    @ptrCast(&xdg_output_logical_position),
    @ptrCast(&xdg_output_logical_size),
    @ptrCast(&xdg_output_done),
    @ptrCast(&xdg_output_name),
    @ptrCast(&xdg_output_description),
};
pub const popup_listener = [_]?*const anyopaque{ @ptrCast(&popup_configure), @ptrCast(&popup_done), @ptrCast(&popup_repositioned) };
pub const seat_listener = [_]?*const anyopaque{ @ptrCast(&seat_capabilities), @ptrCast(&seat_name) };
pub const pointer_listener = [_]?*const anyopaque{
    @ptrCast(&pointer_enter),
    @ptrCast(&pointer_leave),
    @ptrCast(&pointer_motion),
    @ptrCast(&pointer_button),
    @ptrCast(&pointer_axis),
    @ptrCast(&pointer_frame),
    @ptrCast(&pointer_axis_source),
    @ptrCast(&pointer_axis_stop),
    @ptrCast(&pointer_axis_discrete),
    @ptrCast(&pointer_axis_value120),
    @ptrCast(&pointer_axis_relative_direction),
};
pub const keyboard_listener = [_]?*const anyopaque{
    @ptrCast(&keyboard_keymap),
    @ptrCast(&keyboard_enter),
    @ptrCast(&keyboard_leave),
    @ptrCast(&keyboard_key),
    @ptrCast(&keyboard_modifiers),
    @ptrCast(&keyboard_repeat_info),
};
pub const touch_listener = [_]?*const anyopaque{
    @ptrCast(&touch_down),
    @ptrCast(&touch_up),
    @ptrCast(&touch_motion),
    @ptrCast(&touch_frame),
    @ptrCast(&touch_cancel),
    @ptrCast(&touch_shape),
    @ptrCast(&touch_orientation),
};
pub const buffer_listener = [_]?*const anyopaque{@ptrCast(&buffer_release)};
pub const data_device_listener = [_]?*const anyopaque{
    @ptrCast(&data_device_data_offer),
    @ptrCast(&data_device_enter),
    @ptrCast(&data_device_leave),
    @ptrCast(&data_device_motion),
    @ptrCast(&data_device_drop),
    @ptrCast(&data_device_selection),
};
pub const data_source_listener = [_]?*const anyopaque{
    @ptrCast(&data_source_target),
    @ptrCast(&data_source_send),
    @ptrCast(&data_source_cancelled),
    @ptrCast(&data_source_dnd_drop_performed),
    @ptrCast(&data_source_dnd_finished),
    @ptrCast(&data_source_action),
};
pub const data_offer_listener = [_]?*const anyopaque{
    @ptrCast(&data_offer_offer),
    @ptrCast(&data_offer_source_actions),
    @ptrCast(&data_offer_action),
};
pub const primary_device_listener = [_]?*const anyopaque{
    @ptrCast(&primary_device_data_offer),
    @ptrCast(&primary_device_selection),
};
pub const primary_source_listener = [_]?*const anyopaque{
    @ptrCast(&primary_source_send),
    @ptrCast(&primary_source_cancelled),
};
pub const primary_offer_listener = [_]?*const anyopaque{@ptrCast(&primary_offer_offer)};
pub const text_input_listener = [_]?*const anyopaque{
    @ptrCast(&text_input_enter),
    @ptrCast(&text_input_leave),
    @ptrCast(&text_input_preedit_string),
    @ptrCast(&text_input_commit_string),
    @ptrCast(&text_input_delete_surrounding_text),
    @ptrCast(&text_input_done),
    @ptrCast(&text_input_action),
    @ptrCast(&text_input_language),
    @ptrCast(&text_input_preedit_hint),
};
pub const relative_pointer_listener = [_]?*const anyopaque{@ptrCast(&relative_pointer_motion)};
pub const locked_pointer_listener = [_]?*const anyopaque{ @ptrCast(&locked_pointer_locked), @ptrCast(&locked_pointer_unlocked) };
pub const confined_pointer_listener = [_]?*const anyopaque{ @ptrCast(&confined_pointer_confined), @ptrCast(&confined_pointer_unconfined) };
pub const activation_token_listener = [_]?*const anyopaque{@ptrCast(&activation_token_done)};
pub const tablet_seat_listener = [_]?*const anyopaque{ @ptrCast(&tablet_seat_tablet_added), @ptrCast(&tablet_seat_tool_added), @ptrCast(&tablet_seat_pad_added) };
/// zwp_tablet_tool_v2 events in XML order (19 slots).
pub const tablet_tool_listener = [_]?*const anyopaque{
    @ptrCast(&tablet_tool_type),
    @ptrCast(&tablet_tool_hardware_serial),
    @ptrCast(&tablet_tool_hardware_id_wacom),
    @ptrCast(&tablet_tool_capability),
    @ptrCast(&tablet_tool_done),
    @ptrCast(&tablet_tool_removed),
    @ptrCast(&tablet_tool_proximity_in),
    @ptrCast(&tablet_tool_proximity_out),
    @ptrCast(&tablet_tool_down),
    @ptrCast(&tablet_tool_up),
    @ptrCast(&tablet_tool_motion),
    @ptrCast(&tablet_tool_pressure),
    @ptrCast(&tablet_tool_distance),
    @ptrCast(&tablet_tool_tilt),
    @ptrCast(&tablet_tool_rotation),
    @ptrCast(&tablet_tool_slider),
    @ptrCast(&tablet_tool_wheel),
    @ptrCast(&tablet_tool_button),
    @ptrCast(&tablet_tool_frame),
};

test "constructor gives libwayland writable new-id arguments without mutating the caller" {
    const Fake = struct {
        fn marshal(_: Proxy, _: u32, _: ?*const Interface, _: u32, _: u32, args: ?[*]Argument) callconv(.c) ?Proxy {
            std.debug.assert(args.?[0].u == 42);
            args.?[1].o = @ptrFromInt(0x2000);
            return args.?[1].o;
        }
    };
    var lib: Library = undefined;
    lib.functions.proxy_marshal_array_flags = Fake.marshal;
    const arguments = [_]Argument{ .{ .u = 42 }, .{ .o = null } };
    const interface: Interface = undefined;
    const proxy = try lib.constructor_version(@ptrFromInt(0x1000), 0, &interface, 1, &arguments);
    try std.testing.expectEqual(@as(Proxy, @ptrFromInt(0x2000)), proxy);
    try std.testing.expect(arguments[1].o == null);
}
