//! Linux platform layer: backend selection (Wayland or X11), the backend
//! connection, keyboard/mouse/touch state, the event queue, displays, message
//! boxes and a backend-independent window handle.
//!
//! This is the integration layer SDL_video.c and SDL_events.c provide on Linux.
//! It ties together the X11 backend (`video/x11`), the Wayland backend
//! (`video/wayland`, with `input/xkb` keymaps), the shared window model
//! (`video/window_state.zig`), displays, message boxes and the caller-owned
//! event model (`events/`). Backend adapters live in `x11.zig` and `wayland.zig`
//! in this directory.
//!
//! Ownership:
//! - `Platform.open` heap-allocates the platform and returns a stable pointer.
//!   Every window, backend session and text it hands out is owned by it, and
//!   `Platform.close` releases them. Destroy windows before closing the platform.
//! - `Window` is a handle (platform pointer plus id). It stays valid until
//!   `Window.deinit`. Windows are looked up through the platform on each call,
//!   so a stale handle reports `error.WindowClosed` instead of dangling.
//! - Event text (`text_input`, `text_editing`, drop data) is copied into platform
//!   storage that is released by the first `pump` after the queue has been drained.
//!   Consume events before pumping again.
//!
//! Clock: every event timestamp comes from the `std.Io` monotonic clock passed
//! in at `open`, in nanoseconds. Backend timestamps (milliseconds) are not used.
//!
//! Window state: on X11 the window manager is the authority for maximized,
//! minimized and fullscreen. Requests are sent and the change is published when
//! the manager reports it (`window_state_changed`, read back with
//! `Connection.window_state`), as SDL does. Wayland reports the same states in
//! configure events; minimize and restore are published at once there because
//! xdg-shell has no read-back for them.
//!
//! Synchronization: nothing here synchronizes. One thread drives a platform.
//!
//! Deliberate differences from SDL:
//! - Backend selection takes an explicit `Driver` override and an `Environment`
//!   record instead of SDL_VIDEO_DRIVER and getenv calls.
//! - Wayland windows always map on their first configure: `hidden` at creation
//!   is ignored there.
//! - Exclusive fullscreen on X11 switches the RandR mode of the output and
//!   restores the desktop mode when the window leaves fullscreen or the platform
//!   closes. Wayland has no mode switch and uses desktop fullscreen.
//! - Popups use xdg_popup on Wayland and override-redirect windows on X11. The X11
//!   popup ignores the `grab` option (SDL's popup grabs are not reproduced).
//! - Drag-and-drop follows SDL_dropevents.c: the first event of a drop for a
//!   window is preceded by `drop_begin`, position events set the coordinates that
//!   file, text and complete events carry, and `complete` ends the drop. An X11
//!   XdndLeave completes the drop as SDL does.
//! - Pen devices are registered on first sight (X11) or when announced (Wayland),
//!   not from an enumeration at startup. Their device type is `unknown` on both
//!   backends, as SDL reports it. X11 pen down follows pressure, not the tip button.
//! - `Options.signals` takes ownership of a `quit.Signals` value. `Platform.close`
//!   uninstalls it; a pending SIGINT or SIGTERM becomes a quit event on the next pump.
const std = @import("std");
const event = @import("../events/event.zig");
const queue = @import("../events/queue.zig");
const mouse = @import("../events/mouse.zig");
const touch = @import("../events/touch.zig");
const pen = @import("../events/pen.zig");
const quit = @import("../events/quit.zig");
const keyboard = @import("../input/keyboard.zig");
const keyboard_state = @import("../input/keyboard_state.zig");
const display = @import("../video/display.zig");
const geometry = @import("../video/geometry.zig");
const surface = @import("../video/surface.zig");
const window_state = @import("../video/window_state.zig");
const x11 = @import("../video/x11/window.zig");
const x11_displays = @import("../video/x11/displays.zig");
const x11_message_box = @import("../video/x11/message_box.zig");
const xinput = @import("../video/x11/xinput.zig");
const wayland = @import("../video/wayland/window.zig");
const wayland_binding = @import("../video/wayland/binding.zig");
const xkb_library = @import("../input/xkb/library.zig");
const message_box = @import("../messagebox/message_box.zig");
const zenity = @import("../messagebox/zenity.zig");
const x11_backend = @import("x11.zig");
const wayland_backend = @import("wayland.zig");
const graphics = @import("graphics.zig");
const gpu_device = @import("../gpu/vulkan/device.zig");
const vulkan_surface = @import("../video/vulkan_surface/surface.zig");

/// Upper bound on live windows; sizes the poll set in `wait_event`.
pub const max_windows = 64;

/// Every failure the platform layer reports. Backend sets are included so
/// the caller sees the precise cause.
pub const Error = std.mem.Allocator.Error || queue.PushError || display.Error || surface.Error ||
    x11.Error || x11_displays.Error || wayland.Error || xkb_library.Error || zenity.Error ||
    graphics.GraphicsError ||
    error{
        MissingSymbol,
        LibraryUnavailable,
        BackendUnavailable,
        UnsupportedOperation,
        WindowClosed,
        TooManyWindows,
        InvalidSize,
        InvalidConstraint,
        NotResizable,
        ClipboardTimeout,
        PollFailed,
        NoSelection,
    };

/// Video backends the platform can run on.
pub const Backend = enum { x11, wayland };

/// Explicit backend choice. `auto` applies the environment rules; the other
/// values force a backend and fail with `BackendUnavailable` when it cannot connect.
pub const Driver = enum { auto, x11, wayland };

/// Process environment the platform reads. The caller reads it, so the platform
/// never calls getenv and tests can supply any combination.
pub const Environment = struct {
    /// WAYLAND_DISPLAY: names the Wayland socket when a session is Wayland.
    wayland_display: ?[]const u8 = null,
    /// XDG_SESSION_TYPE, for example "wayland" or "x11".
    session_type: ?[]const u8 = null,
    /// DISPLAY, NUL-terminated for Xlib. Null uses the server Xlib picks by default.
    x11_display: ?[:0]const u8 = null,
    /// XCURSOR_THEME for Wayland cursors when the compositor lacks cursor-shape-v1.
    xcursor_theme: ?[]const u8 = null,
};

/// Platform creation options.
pub const Options = struct {
    driver: Driver = .auto,
    environment: Environment = .{},
    mouse: mouse.Options = .{},
    /// Pending-event cap for the queue (see `queue.Options`).
    max_events: usize = queue.default_max_events,
    /// Optional SIGINT/SIGTERM source. The platform owns it from `open` on and
    /// uninstalls it in `close`; its descriptor is waited on by `wait_event`.
    signals: ?quit.Signals = null,
};

/// Drag data offered by `Window.start_drag` (SDL has no X11 drag source; Wayland only).
pub const DragEntry = struct {
    /// MIME type, for example "text/plain;charset=utf-8" or "text/uri-list".
    mime: []const u8,
    /// Bytes served when a target asks for `mime`. Copied by the backend.
    data: []const u8,
};

/// Pixel or logical window extents. Zero is rejected where it cannot be honored.
pub const Size = struct { width: u16, height: u16 };

/// A point in desktop or window coordinates.
pub const Point = geometry.Point(i32);

/// A rectangle in window coordinates (text input areas use it).
pub const Rect = geometry.Rect(i32);

/// Standard cursor shapes (SDL_SystemCursor). Backends map these to their own sets.
/// X11 uses the desktop cursor theme when libXcursor is present and the X font
/// shapes otherwise.
pub const SystemCursor = enum {
    default,
    pointer,
    text,
    crosshair,
    wait,
    progress,
    move,
    not_allowed,
    ew_resize,
    ns_resize,
    nwse_resize,
    nesw_resize,
    /// Edge and corner resize shapes (SDL_SYSTEM_CURSOR_N/NE/E/SE/S/SW/W/NW_RESIZE).
    n_resize,
    ne_resize,
    e_resize,
    se_resize,
    s_resize,
    sw_resize,
    w_resize,
    nw_resize,
    help,
};

/// Options for `Platform.create_window`.
pub const WindowOptions = struct {
    title: []const u8 = "zdl",
    size: Size = .{ .width = 640, .height = 480 },
    min_size: ?Size = null,
    max_size: ?Size = null,
    resizable: bool = true,
    borderless: bool = false,
    /// Created without being shown. Ignored on Wayland, where windows map on creation.
    hidden: bool = false,
    fullscreen: bool = false,
    maximized: bool = false,
    minimized: bool = false,
    /// Always-on-top request (X11 only; Wayland toplevels have no stacking).
    always_on_top: bool = false,
};

/// Kind of a popup window (SDL's popup flags). Both map to xdg_popup on Wayland.
pub const PopupKind = enum { tooltip, menu };

/// Options for `Window.open_popup`. The popup's top-left corner is `offset`,
/// relative to the parent window's top-left corner, as SDL positions popups.
pub const PopupOptions = struct {
    kind: PopupKind = .menu,
    size: Size,
    offset: Point = .{ .x = 0, .y = 0 },
    /// Take an explicit pointer grab with the last input serial (menus).
    grab: bool = false,
};

/// Flash request for the window manager's attention hint (X11).
pub const FlashOperation = enum { cancel, briefly, until_focused };

/// One display as the platform reports it. `name` is owned by the platform.
pub const DisplayEntry = struct {
    display: display.Display,
    name: []u8,

    fn deinit(self: *DisplayEntry, allocator: std.mem.Allocator) void {
        self.display.deinit(allocator);
        allocator.free(self.name);
        self.* = undefined;
    }
};

/// Key identity reported by a backend, used when the backend already translated
/// the key (X11). Wayland keys are translated by the platform's xkb keymaps.
pub const NativeKey = struct {
    keycode: keyboard.Keycode,
    modifiers: keyboard.Modifiers,
};

/// Key-repeat timer for backends that repeat keys themselves (Wayland).
const KeyRepeat = struct {
    window: event.WindowId,
    scancode: keyboard.Scancode,
    raw: u16,
    next_ns: u64,
    interval_ns: u64,
};

/// The desktop mode of an X11 output saved before an exclusive fullscreen switch.
const SavedX11Mode = struct {
    display: u32,
    mode: x11_displays.Mode,
};

/// Backend state of one window. Each variant owns the native window. A popup
/// owns no native window of its own: it names its parent and its popup id.
pub const Native = union(enum) {
    none,
    x11: x11.Window,
    wayland: wayland.Window,
    wayland_popup: struct { parent: event.WindowId, popup: wayland.PopupId },

    fn deinit(self: *Native) void {
        switch (self.*) {
            .none, .wayland_popup => {},
            .x11 => |*window| window.deinit(),
            .wayland => |*window| window.deinit(),
        }
        self.* = .none;
    }
};

/// A live window: the state model plus its native backend window.
pub const Record = struct {
    id: event.WindowId,
    state: window_state.State,
    native: Native = .none,
    /// X11 cursor currently shown; freed when replaced or the window closes.
    x11_cursor: ?x11.Cursor = null,
    text_input: bool = false,
    /// Between the first drop event and `complete` (SDL's window->is_dropping).
    dropping: bool = false,
    /// Outcome of the drag started by `Window.start_drag`, until taken.
    drag_dropped: ?bool = null,
    /// EGL surface of a window used with OpenGL (see `graphics.zig`).
    gl: ?*graphics.GlWindow = null,
};

/// Links a backend pen source (the XInput2 device id on X11, the tool id on
/// Wayland) to the pen id `pen.Pens` issued for it.
const PenLink = struct {
    source: u32,
    id: event.PenId,
    eraser: bool,
};

/// Platform instance. Owns the backend session, input state, events and windows.
pub const Platform = struct {
    allocator: std.mem.Allocator,
    io: std.Io,
    backend: Backend,
    x11: ?*x11_backend.Session = null,
    wayland: ?*wayland_backend.Session = null,
    keyboard: keyboard_state.KeyboardState = .{},
    mouse: mouse.Mouse,
    touches: touch.Touches,
    pens: pen.Pens,
    pen_links: std.ArrayList(PenLink) = .empty,
    events: queue.Queue(void),
    signals: ?quit.Signals = null,
    /// Last drop position (SDL's last_drop_x/y): carried by later drop events and
    /// reset when a drop completes.
    drop_x: f32 = 0,
    drop_y: f32 = 0,
    /// Event text copied out of backend storage, freed once the queue drains.
    texts: std.ArrayList([]u8) = .empty,
    displays_list: std.ArrayList(DisplayEntry) = .empty,
    primary_display: usize = 0,
    /// The X11 output mode to restore when the exclusive fullscreen ends.
    x11_saved_mode: ?SavedX11Mode = null,
    records: std.ArrayList(*Record) = .empty,
    next_window: u32 = 1,
    key_repeat: ?KeyRepeat = null,
    /// Wayland keyboard_repeat parameters: rate per second (0 disables) and delay.
    repeat_rate: i32 = 0,
    repeat_delay_ms: i32 = 0,
    touch_device_added: bool = false,
    /// OpenGL contexts, the shared X11 EGL display and GPU claims.
    graphics: graphics.State = .{},

    /// Creates a platform on the backend chosen by `options`. With `.auto`,
    /// Wayland is used when the environment names it and a connection succeeds;
    /// otherwise X11. The clock is read from `io` for every event timestamp.
    pub fn open(allocator: std.mem.Allocator, io: std.Io, options: Options) Error!*Platform {
        const self = try allocator.create(Platform);
        errdefer allocator.destroy(self);
        self.* = .{
            .allocator = allocator,
            .io = io,
            .backend = .x11,
            .mouse = mouse.Mouse.init(allocator, options.mouse),
            .touches = touch.Touches.init(allocator),
            .pens = pen.Pens.init(allocator),
            .events = queue.Queue(void).init(allocator, .{ .max_events = options.max_events }),
            .signals = options.signals,
        };
        errdefer self.allocator.destroy(self);
        errdefer self.release_resources();

        const env = options.environment;
        const wants_wayland = (env.wayland_display != null and env.wayland_display.?.len > 0) or
            (env.session_type != null and std.mem.eql(u8, env.session_type.?, "wayland"));
        const use_wayland = switch (options.driver) {
            .wayland => true,
            .x11 => false,
            .auto => wants_wayland and probe_wayland(),
        };
        if (use_wayland) {
            self.backend = .wayland;
            self.wayland = try wayland_backend.Session.open(allocator, env.xcursor_theme);
        } else {
            if (options.driver == .wayland) return error.BackendUnavailable;
            self.backend = .x11;
            self.x11 = try x11_backend.Session.open(allocator, env.x11_display);
            try self.refresh_x11_displays(self.x11.?);
        }
        return self;
    }

    /// Destroys every window, backend session and queued state, then frees the platform.
    pub fn close(self: *Platform) void {
        const allocator = self.allocator;
        self.release_resources();
        allocator.destroy(self);
    }

    fn release_resources(self: *Platform) void {
        while (self.records.pop()) |record| self.discard_record(record);
        self.records.deinit(self.allocator);
        self.graphics.deinit(self.allocator);
        if (self.x11) |session| self.restore_x11_mode(session) catch {};
        for (self.texts.items) |text| self.allocator.free(text);
        self.texts.deinit(self.allocator);
        for (self.displays_list.items) |*entry| entry.deinit(self.allocator);
        self.displays_list.deinit(self.allocator);
        self.touches.deinit();
        self.pens.deinit();
        self.pen_links.deinit(self.allocator);
        self.mouse.deinit();
        self.events.deinit();
        if (self.signals) |*signals| signals.uninstall();
        self.signals = null;
        if (self.x11) |session| session.close(self.allocator);
        if (self.wayland) |session| session.close(self.allocator);
    }

    /// The backend in use.
    pub fn active_backend(self: *const Platform) Backend {
        return self.backend;
    }

    /// Monotonic time in nanoseconds from the clock passed to `open`.
    pub fn now_ns(self: *const Platform) u64 {
        const ns = std.Io.Clock.awake.now(self.io).toNanoseconds();
        return std.math.cast(u64, ns) orelse 0;
    }

    /// Displays as last reported by the backend. Re-read after a display event.
    pub fn displays(self: *const Platform) []const DisplayEntry {
        return self.displays_list.items;
    }

    /// Index into `displays()` of the primary display, or 0 when there is none.
    pub fn primary(self: *const Platform) usize {
        return self.primary_display;
    }

    /// Number of events waiting to be taken with `next_event`.
    pub fn pending_events(self: *const Platform) usize {
        return self.events.len();
    }

    /// Takes the oldest pending event. Text inside it stays valid until the
    /// next `pump` that finds the queue empty.
    pub fn next_event(self: *Platform) ?event.Event {
        var out: [1]event.Event = undefined;
        if (self.events.get(&out, 0, std.math.maxInt(u32)) == 0) return null;
        return out[0];
    }

    /// Creates a window. Options that need a shown window (maximized, minimized,
    /// fullscreen) are applied when the window is shown, as SDL does.
    pub fn create_window(self: *Platform, options: WindowOptions) Error!Window {
        if (self.records.items.len >= max_windows) return error.TooManyWindows;
        if (options.size.width == 0 or options.size.height == 0) return error.InvalidSize;
        const id: event.WindowId = @fromBackingInt(self.next_window);
        self.next_window += 1;

        const flags: window_state.Flags = .{
            .resizable = options.resizable,
            .borderless = options.borderless,
            .hidden = self.backend == .x11,
        };
        const rect: window_state.Rect = .{ .x = 0, .y = 0, .width = options.size.width, .height = options.size.height };
        const record = try self.allocator.create(Record);
        record.* = .{ .id = id, .state = window_state.State.init(id, rect, flags) };
        errdefer self.discard_record(record);
        record.native = try self.open_native(options);
        try self.records.append(self.allocator, record);

        const handle: Window = .{ .platform = self, .id = id };
        if (!options.resizable) try self.apply_limits(record);
        if (options.borderless) try self.apply_bordered(record, false);
        if (options.min_size) |min| try handle.set_minimum_size(min);
        if (options.max_size) |max| try handle.set_maximum_size(max);
        if (options.always_on_top) handle.set_always_on_top(true) catch |err| switch (err) {
            error.UnsupportedOperation => {},
            else => return err,
        };
        if (options.maximized) handle.maximize() catch |err| switch (err) {
            error.NotResizable => {},
            else => return err,
        };
        if (options.minimized) try handle.minimize();
        if (options.fullscreen) try handle.set_fullscreen(true);
        if (!options.hidden) try handle.show();
        return handle;
    }

    fn open_native(self: *Platform, options: WindowOptions) Error!Native {
        return switch (self.backend) {
            .x11 => .{ .x11 = try x11_backend.create_window(self.x11.?, options) },
            .wayland => .{ .wayland = try wayland_backend.create_window(self.allocator, self.wayland.?, options) },
        };
    }

    /// Removes a record from the list (if present), releases its native window
    /// and frees it. Used for both normal close and failed creation. A Wayland
    /// window's popups close before it, and a popup closes through its parent.
    fn discard_record(self: *Platform, record: *Record) void {
        if (std.meta.activeTag(record.native) == .wayland) {
            var index: usize = 0;
            while (index < self.records.items.len) {
                const child = self.records.items[index];
                const hosted = switch (child.native) {
                    .wayland_popup => |popup| popup.parent == record.id,
                    else => false,
                };
                if (hosted) {
                    self.discard_record(child);
                } else {
                    index += 1;
                }
            }
        }
        for (self.records.items, 0..) |item, index| {
            if (item == record) {
                _ = self.records.orderedRemove(index);
                break;
            }
        }
        if (std.meta.activeTag(record.native) == .wayland_popup) {
            const popup = record.native.wayland_popup;
            if (self.find(popup.parent)) |parent| switch (parent.native) {
                .wayland => |*window| window.close_popup(popup.popup) catch {},
                else => {},
            };
        }
        graphics.release_window(self, record);
        if (record.x11_cursor) |*cursor| cursor.deinit();
        record.native.deinit();
        self.allocator.destroy(record);
    }

    pub fn record_for(self: *Platform, id: event.WindowId) Error!*Record {
        for (self.records.items) |record| {
            if (record.id == id) return record;
        }
        return error.WindowClosed;
    }

    /// Finds the record whose X11 window has `native` as its server id.
    pub fn find_x11(self: *Platform, native: x11.WindowId) ?*Record {
        for (self.records.items) |record| switch (record.native) {
            .x11 => |window| if (window.id == native) return record,
            else => {},
        };
        return null;
    }

    /// Finds the record for a public window id, or null when none is live.
    pub fn find(self: *Platform, id: event.WindowId) ?*Record {
        for (self.records.items) |record| {
            if (record.id == id) return record;
        }
        return null;
    }

    /// Finds the record of a Wayland popup by its parent window and popup id.
    pub fn find_wayland_popup(self: *Platform, parent: event.WindowId, popup: wayland.PopupId) ?*Record {
        for (self.records.items) |record| switch (record.native) {
            .wayland_popup => |info| if (info.parent == parent and info.popup == popup) return record,
            else => {},
        };
        return null;
    }

    /// Adds the record of a popup whose native window is already open. On failure
    /// the native popup is released, so the caller must not release it again.
    fn add_popup_record(self: *Platform, native: Native, options: PopupOptions, hidden: bool) Error!Window {
        var owned = native;
        errdefer owned.deinit();
        const id: event.WindowId = @fromBackingInt(self.next_window);
        self.next_window += 1;
        const popup_flags: window_state.Flags = .{
            .tooltip = options.kind == .tooltip,
            .popup_menu = options.kind == .menu,
            .hidden = hidden,
        };
        const rect: window_state.Rect = .{
            .x = options.offset.x,
            .y = options.offset.y,
            .width = options.size.width,
            .height = options.size.height,
        };
        const child = try self.allocator.create(Record);
        errdefer self.allocator.destroy(child);
        child.* = .{
            .id = id,
            .state = window_state.State.init(id, rect, popup_flags),
            .native = owned,
        };
        try self.records.append(self.allocator, child);
        return .{ .platform = self, .id = id };
    }

    /// Reports the pixel size and display scale of `record` for a pixel size
    /// given by its backend (SDL_CheckWindowPixelSizeChanged, then the scale).
    pub fn report_pixels(self: *Platform, record: *Record, width: i32, height: i32) Error!void {
        const notice = record.state.check_pixel_size(width, height, 1, null);
        try self.emit_window(notice.pixel_size);
        try self.emit_window(notice.display_scale);
    }

    /// Reads every event the backends have, translates it and queues it. Never
    /// waits. Frees event text from the previous drain when the queue is empty.
    pub fn pump(self: *Platform) Error!void {
        if (self.events.len() == 0) self.clear_texts();
        if (self.x11) |session| try x11_backend.pump(self, session);
        for (self.records.items) |record| switch (record.native) {
            .wayland => |*window| {
                try window.dispatch(false);
                while (window.poll_event()) |ev| try wayland_backend.handle(self, record, ev);
            },
            else => {},
        };
        try self.advance_key_repeat();
        if (self.signals) |*signals| {
            if (signals.poll(self.now_ns())) |ev| try self.emit(ev);
        }
        // SDL flushes deferred pen proximity-out events at the end of each pump
        // (SDL_SendPendingPenProximity).
        while (self.pens.next_pending_proximity(self.now_ns())) |batch| try self.emit_batch(batch);
    }

    /// Pumps, then waits up to `timeout_ns` (null waits indefinitely) for backend
    /// activity, a quit signal or a key-repeat deadline. Returns true when an event
    /// is queued.
    pub fn wait_event(self: *Platform, timeout_ns: ?u64) Error!bool {
        try self.pump();
        if (self.events.len() > 0) return true;

        var descriptors: [max_windows + 2]std.posix.pollfd = undefined;
        var count: usize = 0;
        if (self.x11) |session| {
            descriptors[count] = .{ .fd = session.connection.file_descriptor() catch return error.PollFailed, .events = std.posix.POLL.IN, .revents = 0 };
            count += 1;
        }
        for (self.records.items) |record| switch (record.native) {
            .wayland => |*window| {
                descriptors[count] = .{ .fd = window.lib.fd(window.display), .events = std.posix.POLL.IN, .revents = 0 };
                count += 1;
            },
            else => {},
        };
        if (self.signals) |signals| {
            descriptors[count] = .{ .fd = signals.fd, .events = std.posix.POLL.IN, .revents = 0 };
            count += 1;
        }

        var timeout_ms: i32 = if (timeout_ns) |ns| @intCast(@min((ns + std.time.ns_per_ms - 1) / std.time.ns_per_ms, std.math.maxInt(i32))) else -1;
        if (self.key_repeat) |repeat| {
            const now = self.now_ns();
            const wait_ms: i32 = if (repeat.next_ns > now) @intCast(@min((repeat.next_ns - now + std.time.ns_per_ms - 1) / std.time.ns_per_ms, std.math.maxInt(i32))) else 0;
            if (timeout_ms < 0 or wait_ms < timeout_ms) timeout_ms = wait_ms;
        }
        _ = std.posix.poll(descriptors[0..count], timeout_ms) catch return error.PollFailed;
        try self.pump();
        return self.events.len() > 0;
    }

    fn clear_texts(self: *Platform) void {
        for (self.texts.items) |text| self.allocator.free(text);
        self.texts.clearRetainingCapacity();
    }

    /// Copies text into platform storage so an event can borrow it.
    pub fn copy_text(self: *Platform, text: []const u8) Error![]const u8 {
        const copy = try self.allocator.dupe(u8, text);
        errdefer self.allocator.free(copy);
        try self.texts.append(self.allocator, copy);
        return copy;
    }

    /// Queues an event, dropping it silently when the queue rejects it by filter
    /// or type enablement (see `queue.Queue.push`).
    pub fn emit(self: *Platform, ev: event.Event) Error!void {
        _ = try self.events.push(ev);
    }

    /// Queues the window event that `window_state` decided to publish, stamped
    /// with the current time. Null (a duplicate) queues nothing.
    pub fn emit_window(self: *Platform, maybe: ?event.Window) Error!void {
        var window_event = maybe orelse return;
        window_event.timestamp = self.now_ns();
        try self.emit(.{ .window = window_event });
    }

    /// Queues a drag-and-drop event for `window_id`, sequenced as SDL_SendDrop
    /// does (SDL_dropevents.c). The first event of a drop for a window is preceded
    /// by a `begin` event at position zero. `position` stores `x` and `y` as the
    /// drop's last position; every other event carries the stored position, and
    /// `complete` clears it. `data` (a file path or text) is copied into platform
    /// storage. An explicit `begin` is ignored: it is always sent automatically.
    pub fn emit_drop(self: *Platform, window_id: event.WindowId, kind: event.DropKind, x: f32, y: f32, data: ?[]const u8) Error!void {
        if (kind == .begin) return;
        const record = self.find(window_id);
        if (record == null or !record.?.dropping) {
            try self.emit(.{ .drop = .{ .kind = .begin, .timestamp = self.now_ns(), .window_id = window_id } });
            if (record) |found| found.dropping = true;
        }
        if (kind == .position) {
            self.drop_x = x;
            self.drop_y = y;
        }
        const copy: ?[]const u8 = if (data) |text| try self.copy_text(text) else null;
        try self.emit(.{ .drop = .{
            .kind = kind,
            .timestamp = self.now_ns(),
            .window_id = window_id,
            .x = self.drop_x,
            .y = self.drop_y,
            .data = copy,
        } });
        if (kind == .complete) {
            if (record) |found| found.dropping = false;
            self.drop_x = 0;
            self.drop_y = 0;
        }
    }

    /// Queues every event of a pen batch.
    pub fn emit_batch(self: *Platform, batch: event.Batch) Error!void {
        for (batch.slice()) |ev| try self.emit(ev);
    }

    /// Registers a backend pen source as a pen. Calls for a known source do
    /// nothing, so the X11 path can register on every sample. `eraser` is fixed
    /// at registration.
    pub fn pen_register(self: *Platform, window_id: event.WindowId, source: u32, eraser: bool) Error!void {
        return self.pen_register_named(window_id, source, eraser, null, .unknown, false);
    }

    /// Like `pen_register`, with the pen's name and device type, and an initial
    /// proximity (reported at once). A known source is left unchanged.
    pub fn pen_register_named(
        self: *Platform,
        window_id: event.WindowId,
        source: u32,
        eraser: bool,
        name: ?[]const u8,
        device_type: pen.DeviceType,
        in_proximity: bool,
    ) Error!void {
        if (self.pen_link(source) != null) return;
        const added = try self.pens.add(self.now_ns(), window_id, name, device_type, in_proximity);
        errdefer _ = self.pens.remove(self.now_ns(), window_id, added.id);
        try self.pen_links.append(self.allocator, .{ .source = source, .id = added.id, .eraser = eraser });
        try self.emit_batch(added.events);
    }

    /// Whether a backend pen source is registered.
    pub fn pen_is_registered(self: *const Platform, source: u32) bool {
        return self.pen_link(source) != null;
    }

    /// The pens currently registered, in registration order. Free with `allocator`.
    /// This is SDL_GetPens.
    pub fn pen_ids(self: *const Platform, allocator: std.mem.Allocator) std.mem.Allocator.Error![]event.PenId {
        const ids = try allocator.alloc(event.PenId, self.pens.list.items.len);
        for (self.pens.list.items, ids) |entry, *id| id.* = entry.id;
        return ids;
    }

    /// Name of a registered pen (SDL_GetPenName), or null for an unknown id. Valid
    /// until the pen is removed.
    pub fn pen_name(self: *const Platform, id: event.PenId) ?[]const u8 {
        return self.pens.name(id);
    }

    /// Removes a registered pen, reporting its proximity loss first.
    pub fn pen_unregister(self: *Platform, window_id: event.WindowId, source: u32) Error!void {
        for (self.pen_links.items, 0..) |link, index| {
            if (link.source != source) continue;
            _ = self.pen_links.swapRemove(index);
            try self.emit_batch(self.pens.remove(self.now_ns(), window_id, link.id));
            return;
        }
    }

    /// Pen proximity change. `immediate` false defers a leave until the end of the
    /// pump, as SDL does for Wayland's tablet frames. Unknown sources are ignored.
    pub fn pen_proximity_input(self: *Platform, window_id: event.WindowId, source: u32, in_proximity: bool, immediate: bool) Error!void {
        const link = self.pen_link(source) orelse return;
        try self.emit_batch(self.pens.proximity(self.now_ns(), window_id, link.id, in_proximity, immediate));
    }

    /// Pen position in window coordinates. A pen out of proximity first reports entering it.
    pub fn pen_motion_input(self: *Platform, window_id: event.WindowId, source: u32, x: f32, y: f32) Error!void {
        const link = self.pen_link(source) orelse return;
        try self.emit_batch(self.pens.motion(self.now_ns(), window_id, link.id, x, y));
    }

    /// Pen tip contact changed. The eraser flag is the one the pen was registered with.
    pub fn pen_touch_input(self: *Platform, window_id: event.WindowId, source: u32, down: bool) Error!void {
        const link = self.pen_link(source) orelse return;
        try self.emit_batch(self.pens.touch(self.now_ns(), window_id, link.id, link.eraser, down));
    }

    /// One pen button (1 to 5) changed.
    pub fn pen_button_input(self: *Platform, window_id: event.WindowId, source: u32, button: u8, down: bool) Error!void {
        const link = self.pen_link(source) orelse return;
        try self.emit_batch(self.pens.button(self.now_ns(), window_id, link.id, button, down));
    }

    /// One axis value. Only changes produce an event.
    pub fn pen_axis_input(self: *Platform, window_id: event.WindowId, source: u32, axis: pen.Axis, value: f32) Error!void {
        const link = self.pen_link(source) orelse return;
        if (self.pens.axis(self.now_ns(), window_id, link.id, axis, value)) |ev| try self.emit(ev);
    }

    fn pen_link(self: *const Platform, source: u32) ?PenLink {
        for (self.pen_links.items) |link| {
            if (link.source == source) return link;
        }
        return null;
    }

    /// Queues a keyboard transition for a window.
    pub fn emit_key(self: *Platform, window_id: event.WindowId, transition: keyboard_state.KeyTransition, native: ?NativeKey) Error!void {
        try self.emit(.{ .key = .{
            .kind = if (transition.down) .down else .up,
            .timestamp = self.now_ns(),
            .window_id = window_id,
            .scancode = transition.scancode,
            .keycode = if (native) |value| value.keycode else transition.keycode,
            .modifiers = if (native) |value| value.modifiers else transition.modifiers,
            .raw = transition.raw,
            .repeat = transition.repeat,
        } });
    }

    /// Applies one hardware key change. Duplicates and releases of unpressed keys
    /// produce no event. `native` supplies backend-translated identity (X11).
    pub fn key_input(self: *Platform, window_id: event.WindowId, input: keyboard_state.KeyInput, native: ?NativeKey) Error!void {
        if (native) |value| self.keyboard.set_modifiers(value.modifiers);
        const transition = self.keyboard.key(input) orelse return;
        try self.emit_key(window_id, transition, native);
    }

    /// Releases every held key, for example when the window loses focus.
    pub fn release_keys(self: *Platform, window_id: event.WindowId) Error!void {
        var releases = self.keyboard.reset(self.now_ns());
        while (releases.next()) |transition| try self.emit_key(window_id, transition, null);
        self.key_repeat = null;
    }

    /// Starts or stops the Wayland key-repeat timer after a key change. `repeats`
    /// is the keymap's answer for the key (xkb_keymap_key_repeats).
    pub fn update_key_repeat(self: *Platform, window_id: event.WindowId, scancode: keyboard.Scancode, raw: u16, pressed: bool, repeats: bool) void {
        if (!pressed) {
            if (self.key_repeat) |repeat| if (repeat.scancode == scancode) {
                self.key_repeat = null;
            };
            return;
        }
        if (self.repeat_rate <= 0 or scancode == .unknown or !repeats) return;
        const now = self.now_ns();
        const delay: u64 = @intCast(@max(self.repeat_delay_ms, 0));
        self.key_repeat = .{
            .window = window_id,
            .scancode = scancode,
            .raw = raw,
            .next_ns = now + delay * std.time.ns_per_ms,
            .interval_ns = std.time.ns_per_s / @as(u64, @intCast(self.repeat_rate)),
        };
    }

    fn advance_key_repeat(self: *Platform) Error!void {
        if (self.key_repeat == null) return;
        const repeat = &self.key_repeat.?;
        const now = self.now_ns();
        if (now < repeat.next_ns) return;
        repeat.next_ns = now + repeat.interval_ns;
        const transition = self.keyboard.key(.{
            .scancode = repeat.scancode,
            .down = true,
            .raw = repeat.raw,
            .source = .hardware,
            .now_ns = now,
        }) orelse return;
        try self.emit_key(repeat.window, transition, null);
    }

    /// Mouse motion from a backend. Relative motion is in device units.
    pub fn mouse_move(self: *Platform, window_id: event.WindowId, x: f32, y: f32, relative: bool) Error!void {
        const record = self.find(window_id) orelse return;
        const size = record.state.current;
        const viewport: mouse.Viewport = .{ .window = window_id, .width = size.width, .height = size.height };
        if (self.mouse.motion(self.now_ns(), viewport, .global, relative, x, y)) |ev| try self.emit(ev);
    }

    /// Raw relative motion (X11 XInput2) for the window that has the pointer.
    /// Only used in relative mouse mode; other motion is reported by `mouse_move`.
    pub fn raw_motion_input(self: *Platform, dx: f32, dy: f32) Error!void {
        if (!self.mouse.relative_mode or self.mouse.focus == .none) return;
        try self.mouse_move(self.mouse.focus, dx, dy, true);
    }

    /// Mouse button transition. Indices outside 1..32 are ignored.
    pub fn mouse_button(self: *Platform, window_id: event.WindowId, index: u8, pressed: bool) Error!void {
        if (index < 1 or index > 32) return;
        self.mouse.set_focus(window_id);
        const ev = self.mouse.button(self.now_ns(), .global, index, pressed, null) catch |err| switch (err) {
            error.InvalidButton => return,
            error.OutOfMemory => return error.OutOfMemory,
        };
        if (ev) |value| try self.emit(value);
    }

    /// Wheel travel in ticks (positive y is up, positive x is right). Fractional
    /// ticks accumulate in the mouse; whole steps are reported as integers.
    pub fn mouse_wheel(self: *Platform, window_id: event.WindowId, x: f32, y: f32) Error!void {
        self.mouse.set_focus(window_id);
        if (self.mouse.wheel(self.now_ns(), .global, x, y, .normal)) |ev| try self.emit(ev);
    }

    /// Committed text input for a window.
    pub fn text_input_event(self: *Platform, window_id: event.WindowId, text: []const u8) Error!void {
        if (text.len == 0) return;
        const copy = try self.copy_text(text);
        try self.emit(.{ .text_input = .{ .timestamp = self.now_ns(), .window_id = window_id, .text = copy } });
    }

    /// Input-method composition for a window: `start` is the caret and `length`
    /// the selected span, both in UTF-8 bytes.
    pub fn text_editing_event(self: *Platform, window_id: event.WindowId, text: []const u8, start: i32, length: i32) Error!void {
        const copy = try self.copy_text(text);
        try self.emit(.{ .text_editing = .{ .timestamp = self.now_ns(), .window_id = window_id, .text = copy, .start = start, .length = length } });
    }

    /// Touch input for a finger on the platform's touch device. Coordinates are
    /// window pixels and are normalized to 0..1 for the touch table.
    pub fn touch_input(self: *Platform, kind: enum { down, motion, up }, window_id: event.WindowId, finger: i32, x: f32, y: f32) Error!void {
        const record = self.find(window_id) orelse return;
        const touch_id: event.TouchId = @fromBackingInt(@as(u64, 1));
        if (!self.touch_device_added) {
            try self.touches.add_device(touch_id, .direct, "wayland touch");
            self.touch_device_added = true;
        }
        const width: f32 = @floatFromInt(@max(record.state.current.width, 1));
        const height: f32 = @floatFromInt(@max(record.state.current.height, 1));
        const input: touch.Input = .{
            .timestamp = self.now_ns(),
            .touch_id = touch_id,
            .finger_id = @fromBackingInt(@as(u64, @intCast(finger))),
            .viewport = .{ .window = window_id, .width = record.state.current.width, .height = record.state.current.height },
            .x = x / width,
            .y = y / height,
            .pressure = 1,
        };
        const batch = switch (kind) {
            .down => try self.touches.down(&self.mouse, input),
            .motion => try self.touches.motion(&self.mouse, input),
            .up => try self.touches.up(&self.mouse, input),
        };
        for (batch.slice()) |ev| try self.emit(ev);
    }

    /// Touch input from an XInput2 device (X11). Each XI2 source device gets its
    /// own touch device id; `x` and `y` are window pixels.
    pub fn x11_touch(self: *Platform, record: *Record, device: i32, finger: u32, phase: xinput.TouchPhase, x: f32, y: f32) Error!void {
        const touch_id: event.TouchId = @fromBackingInt(@as(u64, @intCast(@max(device, 0))));
        if (self.touches.device_type(touch_id) == null) try self.touches.add_device(touch_id, .direct, null);
        const width: f32 = @floatFromInt(@max(record.state.current.width, 1));
        const height: f32 = @floatFromInt(@max(record.state.current.height, 1));
        const input: touch.Input = .{
            .timestamp = self.now_ns(),
            .touch_id = touch_id,
            .finger_id = @fromBackingInt(@as(u64, finger)),
            .viewport = .{ .window = record.id, .width = record.state.current.width, .height = record.state.current.height },
            .x = x / width,
            .y = y / height,
            .pressure = 1,
        };
        const batch = switch (phase) {
            .begin => try self.touches.down(&self.mouse, input),
            .update => try self.touches.motion(&self.mouse, input),
            .end => try self.touches.up(&self.mouse, input),
        };
        for (batch.slice()) |ev| try self.emit(ev);
    }

    /// Pinch gesture step for a window. Span and focus are not available from the
    /// X11 gesture events (SDL passes -1 as well).
    pub fn pinch_input(self: *Platform, record: *Record, kind: event.PinchKind, scale: f32) Error!void {
        try self.emit(touch.pinch(kind, self.now_ns(), .{
            .window = record.id,
            .width = record.state.current.width,
            .height = record.state.current.height,
        }, scale, -1, -1, -1, -1));
    }

    /// Cancels every finger on the platform touch device.
    pub fn touch_cancel(self: *Platform, window_id: event.WindowId) Error!void {
        if (!self.touch_device_added) return;
        const touch_id: event.TouchId = @fromBackingInt(@as(u64, 1));
        const fingers = self.touches.fingers(touch_id) orelse return;
        var snapshot: [16]touch.Finger = undefined;
        const count = @min(fingers.len, snapshot.len);
        @memcpy(snapshot[0..count], fingers[0..count]);
        for (snapshot[0..count]) |finger| {
            const batch = try self.touches.cancel(&self.mouse, .{
                .timestamp = self.now_ns(),
                .touch_id = touch_id,
                .finger_id = finger.id,
                .viewport = .{ .window = window_id, .width = 1, .height = 1 },
            });
            for (batch.slice()) |ev| try self.emit(ev);
        }
    }

    /// Reports a pixel-size change (and display scale) after a window geometry change.
    pub fn check_pixels(self: *Platform, record: *Record) Error!void {
        const pixels: window_state.PixelSize = switch (record.native) {
            .wayland => |*window| .{ .width = window.buffer_size().width, .height = window.buffer_size().height },
            else => .{ .width = record.state.current.width, .height = record.state.current.height },
        };
        const notice = record.state.check_pixel_size(pixels.width, pixels.height, 1, null);
        try self.emit_window(notice.pixel_size);
        try self.emit_window(notice.display_scale);
        try graphics.resize_surface(self, record);
    }

    /// Pixel size of a window as its backend reports it: the Wayland buffer
    /// size (fractional or integer scale applied), a Wayland popup's buffer
    /// size, or the logical size on X11 (density 1). This is the value
    /// `check_pixels` publishes as `pixel_size_changed`.
    pub fn pixel_size_of(self: *Platform, record: *Record) PixelSize {
        switch (record.native) {
            .wayland => |*window| {
                const size = window.buffer_size();
                return .{ .width = size.width, .height = size.height };
            },
            .wayland_popup => |popup| {
                if (self.find(popup.parent)) |parent| switch (parent.native) {
                    .wayland => |*window| if (window.popup_buffer_size(popup.popup)) |size| {
                        return .{ .width = size.width, .height = size.height };
                    },
                    else => {},
                };
            },
            else => {},
        }
        return .{
            .width = @intCast(@max(record.state.current.width, 0)),
            .height = @intCast(@max(record.state.current.height, 0)),
        };
    }

    /// Instance extensions the Vulkan instance must enable to create surfaces
    /// for this platform's windows (SDL_Vulkan_GetInstanceExtensions). Static data.
    pub fn vulkan_instance_extensions(self: *const Platform) []const [:0]const u8 {
        return graphics.instance_extensions(self.backend);
    }

    /// Whether `queue_family` of `physical_device` can present to this
    /// platform's windows (SDL_Vulkan_GetPresentationSupport). The handles are
    /// the caller's VkInstance and VkPhysicalDevice.
    pub fn vulkan_presentation_support(self: *Platform, get_instance_proc_addr: vulkan_surface.ProcAddress, instance: *anyopaque, physical_device: *anyopaque, queue_family: u32) bool {
        return graphics.presentation_support(self, get_instance_proc_addr, instance, physical_device, queue_family);
    }

    /// SDL_GL_MakeCurrent. With both null, releases the current context. A
    /// context without a window needs a driver with surfaceless support
    /// (`error.SurfacelessUnsupported` otherwise). A context only works with
    /// windows on the EGL display it was created on (`error.IncompatibleContext`).
    pub fn gl_make_current(self: *Platform, window: ?Window, context: ?GlContext) Error!void {
        return graphics.make_current(self, window, context);
    }

    /// Destroys a context; a current one is released first (SDL_GL_DestroyContext).
    pub fn gl_destroy_context(self: *Platform, context: GlContext) void {
        graphics.destroy_context(self, context.id);
    }

    /// SDL_GL_SetSwapInterval for the current context: 0 immediate, 1 vsync,
    /// -1 adaptive (needs EGL_EXT_swap_control_tear).
    pub fn gl_set_swap_interval(self: *Platform, interval: i32) Error!void {
        return graphics.set_swap_interval(self, interval);
    }

    /// SDL_GL_GetSwapInterval for the current context.
    pub fn gl_swap_interval(self: *Platform) Error!i32 {
        return graphics.swap_interval(self);
    }

    /// SDL_GL_ExtensionSupported, answered by the current context.
    pub fn gl_extension_supported(self: *Platform, name: []const u8) bool {
        return graphics.extension_supported(self, name);
    }

    /// SDL_GL_GetProcAddress through the current context's EGL display. `Fn` is
    /// the function pointer type; null when no context is current or the symbol is unknown.
    pub fn gl_proc_address(self: *Platform, comptime Fn: type, name: [:0]const u8) ?Fn {
        return graphics.proc_address(self, Fn, name);
    }

    /// The window the current context is bound to, or null (SDL_GL_GetCurrentWindow).
    pub fn gl_current_window(self: *Platform) ?Window {
        if (self.graphics.current_window == .none) return null;
        return .{ .platform = self, .id = self.graphics.current_window };
    }

    /// The context current on this platform, or null (SDL_GL_GetCurrentContext).
    pub fn gl_current_context(self: *Platform) ?GlContext {
        const id = self.graphics.current_context orelse return null;
        return .{ .platform = self, .id = id };
    }

    /// Reads the window manager's state for an X11 window and publishes what
    /// changed: minimized (which also leaves exclusive fullscreen), maximized,
    /// restored, fullscreen and always-on-top. Duplicates publish nothing.
    pub fn sync_x11_window_state(self: *Platform, record: *Record) Error!void {
        const session = self.x11 orelse return;
        const window = switch (record.native) {
            .x11 => |*value| value,
            else => return,
        };
        const state = session.connection.window_state(window) catch return;
        record.state.flags.always_on_top = state.always_on_top;
        if (state.minimized) {
            try self.emit_window(record.state.send(.minimized, 0, 0));
            if (record.state.after_minimized()) |step| try self.apply_fullscreen(record, step);
        } else if (state.maximized) {
            try self.emit_window(record.state.send(.maximized, 0, 0));
        } else {
            try self.emit_window(record.state.send(.restored, 0, 0));
        }
        if (state.fullscreen != record.state.flags.fullscreen) {
            try self.emit_window(record.state.send(if (state.fullscreen) .enter_fullscreen else .leave_fullscreen, 0, 0));
        }
    }

    /// Applies a fullscreen transition planned by `window_state`: the display
    /// mode switch (X11, exclusive modes), the backend request, the enter or leave
    /// event, and the moved and resized reports.
    pub fn apply_fullscreen(self: *Platform, record: *Record, step: window_state.FullscreenStep) Error!void {
        const enter = step.op != .leave;
        switch (step.op) {
            .enter => try self.emit_window(record.state.send(.enter_fullscreen, 0, 0)),
            .leave => try self.emit_window(record.state.send(.leave_fullscreen, 0, 0)),
            .update => {},
        }
        if (step.op == .leave or step.mode != null) try self.apply_display_mode(record, step);
        if (step.op != .update) try self.backend_set_fullscreen(record, enter);
        record.state.finish_fullscreen_update(self.primary_display_id());
        const bounds = self.primary_bounds() orelse record.state.current;
        const dims = record.state.fullscreen_dimensions(step.op, .{ .sends_dimensions = false, .has_fullscreen_hook = true }, bounds, .{ .width = bounds.width, .height = bounds.height });
        try self.emit_window(dims.moved);
        try self.emit_window(dims.resized);
        if (dims.check_resize) try self.check_pixels(record);
    }

    /// Switches the X11 output of `record` to the step's mode (exclusive fullscreen),
    /// or restores the saved desktop mode on leave. Wayland has no mode switch.
    fn apply_display_mode(self: *Platform, record: *Record, step: window_state.FullscreenStep) Error!void {
        if (self.backend != .x11) return;
        const session = self.x11 orelse return;
        if (step.op == .leave) return self.restore_x11_mode(session);
        const target = step.mode orelse return;
        const display_id = self.display_for_record(record) orelse return;
        var outputs = try session.connection.outputs(self.allocator);
        defer outputs.deinit();
        for (outputs.items) |output| {
            if (output.id != @backingInt(display_id)) continue;
            if (self.x11_saved_mode == null) {
                for (output.modes) |mode| {
                    if (mode.id == output.mode) self.x11_saved_mode = .{ .display = @backingInt(display_id), .mode = mode };
                }
            }
            const chosen = best_x11_mode(output.modes, target) orelse return error.ModeUnavailable;
            try session.connection.set_display_mode(output, chosen);
            return;
        }
    }

    /// Restores the desktop mode saved before an exclusive fullscreen switch.
    fn restore_x11_mode(self: *Platform, session: *x11_backend.Session) Error!void {
        const saved = self.x11_saved_mode orelse return;
        self.x11_saved_mode = null;
        var outputs = try session.connection.outputs(self.allocator);
        defer outputs.deinit();
        for (outputs.items) |output| {
            if (output.id != saved.display) continue;
            try session.connection.set_display_mode(output, saved.mode);
            return;
        }
    }

    /// The display that holds a window (its current display, else the primary one).
    fn display_for_record(self: *const Platform, record: *const Record) ?event.DisplayId {
        if (record.state.display_id != .none) return record.state.display_id;
        return self.primary_display_id();
    }

    fn primary_display_id(self: *const Platform) ?event.DisplayId {
        if (self.displays_list.items.len == 0) return null;
        return self.displays_list.items[@min(self.primary_display, self.displays_list.items.len - 1)].display.id;
    }

    fn primary_bounds(self: *const Platform) ?window_state.Rect {
        if (self.displays_list.items.len == 0) return null;
        const entry = self.displays_list.items[@min(self.primary_display, self.displays_list.items.len - 1)];
        return entry.display.bounds;
    }

    /// Requests fullscreen on the backend window.
    fn backend_set_fullscreen(self: *Platform, record: *Record, enabled: bool) Error!void {
        _ = self;
        switch (record.native) {
            .x11 => |*window| try window.set_fullscreen(enabled),
            .wayland => |*window| try window.set_fullscreen(enabled, null),
            .none, .wayland_popup => {},
        }
    }

    fn apply_limits(self: *Platform, record: *Record) Error!void {
        _ = self;
        const state = &record.state;
        const current: Size = .{ .width = @intCast(state.current.width), .height = @intCast(state.current.height) };
        const fixed = !state.flags.resizable;
        const min: ?Size = if (fixed) current else if (state.min_width > 0 and state.min_height > 0)
            Size{ .width = @intCast(state.min_width), .height = @intCast(state.min_height) }
        else
            null;
        const max: ?Size = if (fixed) current else if (state.max_width > 0 and state.max_height > 0)
            Size{ .width = @intCast(state.max_width), .height = @intCast(state.max_height) }
        else
            null;
        switch (record.native) {
            .x11 => |*window| {
                const x_min: ?x11.Size = if (min) |value| x11.Size{ .width = value.width, .height = value.height } else null;
                const x_max: ?x11.Size = if (max) |value| x11.Size{ .width = value.width, .height = value.height } else null;
                try window.set_minimum_size(x_min);
                try window.set_maximum_size(x_max);
            },
            .wayland => |*window| try wayland_backend.set_limits(window, min, max),
            .none, .wayland_popup => {},
        }
    }

    fn apply_bordered(self: *Platform, record: *Record, bordered: bool) Error!void {
        _ = self;
        switch (record.native) {
            .x11 => |*window| try window.set_bordered(bordered),
            .wayland => |*window| try wayland_backend.set_bordered(window, bordered),
            .none, .wayland_popup => {},
        }
    }

    /// Asks the Wayland probe whether a display connection can be made.
    fn probe_wayland() bool {
        var library = wayland_binding.Library.open() catch return false;
        defer library.close();
        const display_proxy = library.connect() catch return false;
        library.disconnect(display_proxy);
        return true;
    }

    /// Re-queries RandR outputs, replaces the display list and reports the
    /// differences as display events.
    pub fn refresh_x11_displays(self: *Platform, session: *x11_backend.Session) Error!void {
        var outputs = try session.connection.outputs(self.allocator);
        defer outputs.deinit();

        var next: std.ArrayList(DisplayEntry) = .empty;
        errdefer deinit_entries(self.allocator, &next);
        var next_primary: usize = 0;
        for (outputs.items) |output| {
            if (!output.connected) continue;
            const id_value = std.math.cast(u32, output.id) orelse continue;
            const id: event.DisplayId = @fromBackingInt(id_value);
            if (output.primary) next_primary = next.items.len;
            const name = try self.allocator.dupe(u8, output.name());
            errdefer self.allocator.free(name);
            var entry: DisplayEntry = .{
                .display = .{
                    .id = id,
                    .name = name,
                    .bounds = output.bounds,
                    .desktop_mode = .{
                        .display_id = id,
                        .width = output.bounds.width,
                        .height = output.bounds.height,
                        .refresh_rate = @floatCast(output.refresh_hz),
                    },
                },
                .name = name,
            };
            entry.display.desktop_mode.finalize();
            for (output.modes) |mode| {
                _ = try entry.display.add_fullscreen_mode(self.allocator, .{
                    .display_id = id,
                    .width = @intCast(mode.width),
                    .height = @intCast(mode.height),
                    .refresh_rate = @floatCast(mode.refresh_hz),
                });
            }
            try next.append(self.allocator, entry);
        }
        try self.commit_displays(&next, next_primary);
    }

    /// Re-queries the Wayland outputs through `record`'s window and replaces the
    /// display list. Each output becomes a display with its logical bounds, scale
    /// and modes; the first output is the primary one.
    pub fn refresh_wayland_displays(self: *Platform, record: *Record) Error!void {
        const window = switch (record.native) {
            .wayland => |*value| value,
            else => return,
        };
        const infos = try window.outputs(self.allocator);
        defer wayland.Window.free_outputs(self.allocator, infos);

        var next: std.ArrayList(DisplayEntry) = .empty;
        errdefer deinit_entries(self.allocator, &next);
        for (infos) |info| {
            const id: event.DisplayId = @fromBackingInt(info.id);
            const scale: f32 = @floatFromInt(info.scale);
            const name = try self.allocator.dupe(u8, info.name.slice());
            errdefer self.allocator.free(name);
            var desktop: display.Mode = .{
                .display_id = id,
                .width = @intCast(info.size.width),
                .height = @intCast(info.size.height),
                .pixel_density = scale,
            };
            if (info.mode) |mode| {
                desktop.width = mode.width;
                desktop.height = mode.height;
                desktop.refresh_rate = @as(f32, @floatFromInt(mode.refresh_mhz)) / 1000.0;
            }
            desktop.finalize();
            var entry: DisplayEntry = .{
                .display = .{
                    .id = id,
                    .name = name,
                    .bounds = .{
                        .x = info.position.x,
                        .y = info.position.y,
                        .width = @intCast(info.size.width),
                        .height = @intCast(info.size.height),
                    },
                    .content_scale = scale,
                    .desktop_mode = desktop,
                },
                .name = name,
            };
            for (info.modes) |mode| {
                _ = try entry.display.add_fullscreen_mode(self.allocator, .{
                    .display_id = id,
                    .width = mode.width,
                    .height = mode.height,
                    .pixel_density = scale,
                    .refresh_rate = @as(f32, @floatFromInt(mode.refresh_mhz)) / 1000.0,
                });
            }
            try next.append(self.allocator, entry);
        }
        try self.commit_displays(&next, 0);
    }

    /// Replaces the display list with `next` (which is emptied on success) and
    /// reports removed, added, moved and scale-changed displays. On failure the
    /// caller still owns `next`.
    fn commit_displays(self: *Platform, next: *std.ArrayList(DisplayEntry), next_primary: usize) Error!void {
        for (self.displays_list.items) |old| {
            if (find_display(next.items, old.display.id) == null) try self.emit_display(.removed, old.display.id);
        }
        for (next.items) |entry| {
            if (find_display(self.displays_list.items, entry.display.id)) |index| {
                const old = self.displays_list.items[index].display;
                if (!std.meta.eql(old.bounds, entry.display.bounds)) {
                    try self.emit_display(.moved, entry.display.id);
                }
                if (old.content_scale != entry.display.content_scale) {
                    try self.emit_display(.content_scale_changed, entry.display.id);
                }
            } else {
                try self.emit_display(.added, entry.display.id);
            }
        }
        deinit_entries(self.allocator, &self.displays_list);
        self.displays_list = next.*;
        next.* = .empty;
        self.primary_display = next_primary;
    }

    fn emit_display(self: *Platform, kind: event.DisplayKind, id: event.DisplayId) Error!void {
        try self.emit(.{ .display = .{ .kind = kind, .timestamp = self.now_ns(), .display_id = id } });
    }

    fn find_display(entries: []const DisplayEntry, id: event.DisplayId) ?usize {
        for (entries, 0..) |entry, index| {
            if (entry.display.id == id) return index;
        }
        return null;
    }

    fn deinit_entries(allocator: std.mem.Allocator, list: *std.ArrayList(DisplayEntry)) void {
        for (list.items) |*entry| entry.deinit(allocator);
        list.deinit(allocator);
    }

    /// Chooses the RandR mode of an output nearest to `target`: equal width and
    /// height, then the closest refresh rate.
    fn best_x11_mode(modes: []const x11_displays.Mode, target: display.Mode) ?x11_displays.Mode {
        var best: ?x11_displays.Mode = null;
        var best_distance: f64 = std.math.inf(f64);
        for (modes) |mode| {
            if (@as(i64, mode.width) != target.width or @as(i64, mode.height) != target.height) continue;
            const distance = @abs(mode.refresh_hz - @as(f64, target.refresh_rate));
            if (distance < best_distance) {
                best = mode;
                best_distance = distance;
            }
        }
        return best;
    }
};

/// Whether a scancode is a modifier key (these never auto-repeat).
fn is_modifier(scancode: keyboard.Scancode) bool {
    return switch (scancode) {
        .lctrl, .lshift, .lalt, .lgui, .rctrl, .rshift, .ralt, .rgui => true,
        else => false,
    };
}

/// Window size in pixels (SDL_GetWindowSizeInPixels).
pub const PixelSize = struct { width: u32, height: u32 };

pub const GlOptions = graphics.GlOptions;
pub const GlAttributes = graphics.GlAttributes;
pub const GlShare = graphics.GlShare;
pub const GlContext = graphics.GlContext;
/// VkSurfaceKHR of a window claimed for a GPU device.
pub const GpuSurface = graphics.GpuSurface;
/// `vkGetInstanceProcAddr` as an opaque address.
pub const VulkanProcAddress = vulkan_surface.ProcAddress;
/// VkSurfaceKHR handle (0 is VK_NULL_HANDLE).
pub const VulkanSurface = vulkan_surface.Surface;
/// Privately loaded libvulkan.so.1 providing `vkGetInstanceProcAddr`.
pub const VulkanLoader = vulkan_surface.Loader;

/// Public handle to a window. Methods look the window up on each call, so a
/// handle used after `deinit` reports `error.WindowClosed`.
pub const Window = struct {
    platform: *Platform,
    id: event.WindowId,

    /// Destroys the window and releases its backend resources. A Wayland
    /// window's popups are destroyed with it.
    pub fn deinit(self: *Window) void {
        if (self.platform.find(self.id)) |found| self.platform.discard_record(found);
        self.* = undefined;
    }

    fn record(self: Window) Error!*Record {
        return self.platform.record_for(self.id);
    }

    /// Current logical size as the backend last reported it.
    pub fn size(self: Window) Error!Size {
        const r = try self.record();
        return .{ .width = @intCast(r.state.current.width), .height = @intCast(r.state.current.height) };
    }

    /// Size in pixels (SDL_GetWindowSizeInPixels, SDL_GL_GetDrawableSize,
    /// SDL_Vulkan_GetDrawableSize): the Wayland buffer size with the output scale
    /// applied, or the logical size on X11. Equals what `pixel_size_changed` reports.
    pub fn size_in_pixels(self: Window) Error!PixelSize {
        return self.platform.pixel_size_of(try self.record());
    }

    /// Pixels per logical unit (SDL_GetWindowPixelDensity); 1 when the window has no size.
    pub fn pixel_density(self: Window) Error!f32 {
        const r = try self.record();
        const pixels = self.platform.pixel_size_of(r);
        if (r.state.current.width <= 0) return 1;
        return @as(f32, @floatFromInt(pixels.width)) / @as(f32, @floatFromInt(r.state.current.width));
    }

    /// Current flags (visibility, focus, maximized, fullscreen, and so on).
    pub fn flags(self: Window) Error!window_state.Flags {
        return (try self.record()).state.flags;
    }

    /// Top-left corner in desktop coordinates. X11 asks the server; Wayland
    /// cannot know its global position, so the last reported value is returned.
    pub fn position(self: Window) Error!Point {
        const r = try self.record();
        const last: Point = .{ .x = r.state.current.x, .y = r.state.current.y };
        return switch (r.native) {
            .x11 => |*window| window.query_position() catch last,
            else => last,
        };
    }

    /// Moves the window to desktop coordinates. Wayland clients cannot position
    /// their toplevels, so it reports `UnsupportedOperation` there.
    pub fn set_position(self: Window, x: i32, y: i32) Error!void {
        const r = try self.record();
        switch (r.native) {
            .x11 => |*window| {
                const point = try r.state.request_position(.{ .value = x }, .{ .value = y }, null, null, false);
                try window.move(.{ .x = point.x, .y = point.y });
            },
            .wayland, .wayland_popup => return error.UnsupportedOperation,
            .none => return error.WindowClosed,
        }
    }

    pub fn set_title(self: Window, title: []const u8) Error!void {
        const r = try self.record();
        switch (r.native) {
            .x11 => |*window| try window.set_title(title),
            .wayland => |*window| try window.set_title(title),
            .none, .wayland_popup => {},
        }
    }

    /// Maps the window and applies the flags that were pending while hidden.
    pub fn show(self: Window) Error!void {
        const r = try self.record();
        if (!r.state.begin_show()) return;
        switch (r.native) {
            .x11 => |*window| try window.show(),
            .wayland => |*window| try window.show(),
            .none, .wayland_popup => {},
        }
        try self.platform.emit_window(r.state.send(.shown, 0, 0));
        const actions = r.state.take_shown_actions();
        if (actions.maximize) try self.apply_maximized(r, true);
        if (actions.minimize) try self.apply_minimized(r);
        if (actions.fullscreen) {
            if (r.state.request_fullscreen(true)) |step| try self.platform.apply_fullscreen(r, step);
        }
    }

    /// Unmaps the window. Wayland unmaps by detaching its buffer; `show` maps it again.
    pub fn hide(self: Window) Error!void {
        const r = try self.record();
        switch (r.native) {
            .x11 => |*window| {
                if (!r.state.begin_hide()) return;
                try window.hide();
            },
            .wayland => |*window| {
                if (!r.state.begin_hide()) return;
                try window.hide();
            },
            .wayland_popup => return error.UnsupportedOperation,
            .none => return error.WindowClosed,
        }
        const finished = r.state.finish_hide();
        try self.platform.emit_window(finished.event);
        if (r.state.flags.fullscreen) try self.platform.apply_fullscreen(r, finished.step);
    }

    /// Requests a new size. The result arrives later as a resized event.
    /// Wayland clients cannot choose their size, so it reports `UnsupportedOperation`.
    pub fn resize(self: Window, new_size: Size) Error!void {
        const r = try self.record();
        if (new_size.width == 0 or new_size.height == 0) return error.InvalidSize;
        if (std.meta.activeTag(r.native) == .wayland) return error.UnsupportedOperation;
        const pending = try r.state.request_size(new_size.width, new_size.height);
        switch (r.native) {
            .x11 => |*window| try window.resize(.{ .width = @intCast(pending.width), .height = @intCast(pending.height) }),
            else => {},
        }
    }

    /// Sets the minimum size. Null removes the limit.
    pub fn set_minimum_size(self: Window, min: ?Size) Error!void {
        const r = try self.record();
        const value = min orelse Size{ .width = 0, .height = 0 };
        _ = r.state.set_minimum_size(value.width, value.height) catch return error.InvalidConstraint;
        try self.platform.apply_limits(r);
    }

    /// Sets the maximum size. Null removes the limit.
    pub fn set_maximum_size(self: Window, max: ?Size) Error!void {
        const r = try self.record();
        const value = max orelse Size{ .width = 0, .height = 0 };
        _ = r.state.set_maximum_size(value.width, value.height) catch return error.InvalidConstraint;
        try self.platform.apply_limits(r);
    }

    /// Enters or leaves desktop fullscreen (the window's current display).
    pub fn set_fullscreen(self: Window, enabled: bool) Error!void {
        const r = try self.record();
        if (r.state.request_fullscreen(enabled)) |step| try self.platform.apply_fullscreen(r, step);
    }

    /// Sets the exclusive fullscreen mode: `mode` switches the display to that
    /// mode (X11 RandR), and null returns to desktop fullscreen. The mode applies
    /// at once when the window is fullscreen, otherwise on the next entry.
    /// Wayland has no mode switch and reports `UnsupportedOperation`.
    pub fn set_fullscreen_mode(self: Window, mode: ?display.Mode) Error!void {
        const r = try self.record();
        if (self.platform.backend != .x11) return error.UnsupportedOperation;
        const requested: display.FullscreenMode = if (mode) |value| .{ .exclusive = value } else .desktop;
        if (r.state.set_fullscreen_mode(requested)) {
            const step = r.state.begin_fullscreen_update(.update);
            try self.platform.apply_fullscreen(r, step);
        }
    }

    /// Maximizes (true) or restores from maximized (false). Requires a resizable window.
    pub fn set_maximized(self: Window, enabled: bool) Error!void {
        const r = try self.record();
        if (enabled) return self.maximize();
        _ = r.state.restore();
        try self.apply_maximized(r, false);
    }

    pub fn maximize(self: Window) Error!void {
        const r = try self.record();
        const result = try r.state.maximize();
        if (result == .platform) try self.apply_maximized(r, true);
    }

    pub fn minimize(self: Window) Error!void {
        const r = try self.record();
        if (r.state.minimize() == .platform) try self.apply_minimized(r);
    }

    /// Leaves maximized, minimized and fullscreen states. X11 also maps and
    /// raises the window; Wayland cannot unminimize, so it only unmaximizes.
    /// Hidden windows keep the request as pending state until shown.
    pub fn restore(self: Window) Error!void {
        const r = try self.record();
        if (r.state.restore() == .deferred) return;
        switch (r.native) {
            .x11 => |*window| try window.restore(),
            .wayland => |*window| {
                try window.set_maximized(false);
                try self.platform.emit_window(r.state.send(.restored, 0, 0));
            },
            .none, .wayland_popup => {},
        }
        if (r.state.flags.fullscreen) {
            if (r.state.request_fullscreen(false)) |step| try self.platform.apply_fullscreen(r, step);
        }
    }

    /// Sends the maximize request. X11 publishes the change when the window
    /// manager reports it (`sync_x11_window_state`); Wayland publishes it at once
    /// and the configure that follows is then a duplicate.
    fn apply_maximized(self: Window, r: *Record, enabled: bool) Error!void {
        switch (r.native) {
            .x11 => |*window| try window.set_maximized(enabled),
            .wayland => |*window| {
                try window.set_maximized(enabled);
                const kind: event.WindowKind = if (enabled) .maximized else .restored;
                try self.platform.emit_window(r.state.send(kind, 0, 0));
            },
            .none, .wayland_popup => {},
        }
    }

    /// Sends the minimize request. X11 publishes `minimized` when the window
    /// manager reports it. Wayland publishes at once, with the fullscreen step.
    fn apply_minimized(self: Window, r: *Record) Error!void {
        switch (r.native) {
            .x11 => |*window| try window.minimize(),
            .wayland => |*window| {
                try wayland_backend.minimize(window);
                try self.platform.emit_window(r.state.send(.minimized, 0, 0));
                if (r.state.after_minimized()) |step| try self.platform.apply_fullscreen(r, step);
            },
            .none, .wayland_popup => {},
        }
    }

    /// Shows or hides window decorations. Removing them makes the window borderless.
    pub fn set_bordered(self: Window, bordered: bool) Error!void {
        const r = try self.record();
        if (r.state.set_bordered(bordered)) try self.platform.apply_bordered(r, bordered);
    }

    pub fn set_resizable(self: Window, resizable: bool) Error!void {
        const r = try self.record();
        if (r.state.set_resizable(resizable)) try self.platform.apply_limits(r);
    }

    /// Keeps the window above ordinary windows. X11 only: Wayland toplevels have no
    /// stacking control, so it reports `UnsupportedOperation` there.
    pub fn set_always_on_top(self: Window, enabled: bool) Error!void {
        const r = try self.record();
        switch (r.native) {
            .x11 => |*window| try window.set_always_on_top(enabled),
            .wayland, .wayland_popup => return error.UnsupportedOperation,
            .none => return error.WindowClosed,
        }
        r.state.flags.always_on_top = enabled;
    }

    /// Sets opacity from 0 (transparent) to 1 (opaque). X11 honors it through the
    /// compositor (_NET_WM_WINDOW_OPACITY). Wayland has no client opacity: `UnsupportedOperation`.
    pub fn set_opacity(self: Window, opacity: f32) Error!void {
        const r = try self.record();
        switch (r.native) {
            .x11 => |*window| try window.set_opacity(opacity),
            .wayland, .wayland_popup => return error.UnsupportedOperation,
            .none => return error.WindowClosed,
        }
    }

    /// Sets the window icon from a raster (X11 `_NET_WM_ICON`). Wayland's icon
    /// protocol is not wrapped, so it reports `UnsupportedOperation`.
    pub fn set_icon(self: Window, view: surface.View) Error!void {
        const r = try self.record();
        switch (r.native) {
            .x11 => |*window| try window.set_icon(self.platform.allocator, view),
            .wayland, .wayland_popup => return error.UnsupportedOperation,
            .none => return error.WindowClosed,
        }
    }

    /// Asks the window manager to draw attention to the window (X11 urgency hint).
    /// Wayland has no urgency request, so it reports `UnsupportedOperation`.
    pub fn flash(self: Window, operation: FlashOperation) Error!void {
        const r = try self.record();
        const native_operation: x11.Window.FlashOperation = switch (operation) {
            .cancel => .cancel,
            .briefly => .briefly,
            .until_focused => .until_focused,
        };
        switch (r.native) {
            .x11 => |*window| try window.flash(native_operation),
            .wayland, .wayland_popup => return error.UnsupportedOperation,
            .none => return error.WindowClosed,
        }
    }

    /// Grabs the pointer to this window (true) or releases the grab (false). X11
    /// confines the pointer and reports `GrabFailed` when the server refuses.
    /// Wayland does not let clients grab globally: `UnsupportedOperation`.
    pub fn set_mouse_grab(self: Window, grabbed: bool) Error!void {
        const r = try self.record();
        switch (r.native) {
            .x11 => |*window| try window.set_mouse_grab(grabbed),
            .wayland, .wayland_popup => return error.UnsupportedOperation,
            .none => return error.WindowClosed,
        }
        r.state.flags.mouse_grabbed = grabbed;
    }

    /// Grabs the keyboard to this window (true) or releases it (false). X11 only;
    /// Wayland's shortcut inhibition is not wrapped, so it reports `UnsupportedOperation`.
    pub fn set_keyboard_grab(self: Window, grabbed: bool) Error!void {
        const r = try self.record();
        switch (r.native) {
            .x11 => |*window| try window.set_keyboard_grab(grabbed),
            .wayland, .wayland_popup => return error.UnsupportedOperation,
            .none => return error.WindowClosed,
        }
        r.state.flags.keyboard_grabbed = grabbed;
    }

    /// Moves the pointer to `x`, `y` in window coordinates. The compositor or
    /// server then reports the motion like any user movement.
    pub fn warp_mouse(self: Window, x: f32, y: f32) Error!void {
        const r = try self.record();
        switch (r.native) {
            .x11 => |*window| try window.warp_mouse(.{ .x = @intFromFloat(x), .y = @intFromFloat(y) }),
            .wayland => |*window| try window.warp_pointer(x, y),
            .wayland_popup => return error.UnsupportedOperation,
            .none => return error.WindowClosed,
        }
    }

    /// Enables (true) or disables relative mouse mode. X11 reads relative motion
    /// from XInput2 raw events, so it needs XInput2 (`UnsupportedOperation` without
    /// it). Wayland locks the pointer; the lock's events switch the mode.
    pub fn set_relative_mouse_mode(self: Window, enabled: bool) Error!void {
        const r = try self.record();
        switch (r.native) {
            .x11 => {
                const session = self.platform.x11 orelse return error.UnsupportedOperation;
                if (!session.xinput_enabled()) return error.UnsupportedOperation;
                try session.connection.set_raw_motion(enabled);
                self.platform.mouse.set_relative_mode(enabled);
            },
            .wayland => |*window| try window.set_relative_mouse_mode(enabled),
            .wayland_popup => return error.UnsupportedOperation,
            .none => return error.WindowClosed,
        }
    }

    /// Tells the input method where the text caret is: `area` is the caret
    /// rectangle in window coordinates. X11 places the candidate window at the
    /// bottom-left corner of the area.
    pub fn set_text_input_area(self: Window, area: Rect) Error!void {
        const r = try self.record();
        switch (r.native) {
            .x11 => |*window| {
                const session = self.platform.x11 orelse return error.UnsupportedOperation;
                try session.connection.set_text_input_spot(window, .{ .x = area.x, .y = area.y + area.height });
            },
            .wayland => |*window| try window.set_text_input_area(.{ .x = area.x, .y = area.y, .width = area.width, .height = area.height }),
            .wayland_popup => return error.UnsupportedOperation,
            .none => return error.WindowClosed,
        }
    }

    /// Creates an OpenGL or OpenGL ES context for this window through EGL and
    /// makes it current (SDL_GL_CreateContext). The window's EGL surface is
    /// created on the first call with `options.attributes`; see `graphics.zig`.
    pub fn gl_create_context(self: Window, options: GlOptions) Error!GlContext {
        return graphics.create_context(self.platform, try self.record(), options);
    }

    /// Makes `context` (or none) current with this window (SDL_GL_MakeCurrent).
    pub fn gl_make_current(self: Window, context: ?GlContext) Error!void {
        return graphics.make_current(self.platform, if (context == null) null else self, context);
    }

    /// Presents the back buffer (SDL_GL_SwapWindow). The window must be current.
    pub fn gl_swap(self: Window) Error!void {
        return graphics.swap(self.platform, try self.record());
    }

    /// Drawable size for GL viewports (SDL_GL_GetDrawableSize).
    pub fn gl_drawable_size(self: Window) Error!PixelSize {
        return self.size_in_pixels();
    }

    /// Instance-level surface creation (SDL_Vulkan_CreateSurface). `instance` is
    /// the caller's VkInstance created with `Platform.vulkan_instance_extensions`.
    /// Destroy the surface with `destroy_vulkan_surface` before the instance and
    /// this window.
    pub fn create_vulkan_surface(self: Window, instance: *anyopaque, get_instance_proc_addr: VulkanProcAddress) Error!VulkanSurface {
        return graphics.create_vulkan_surface(self.platform, try self.record(), instance, get_instance_proc_addr);
    }

    /// Destroys a surface made by `create_vulkan_surface` (SDL_Vulkan_DestroySurface).
    pub fn destroy_vulkan_surface(instance: *anyopaque, get_instance_proc_addr: VulkanProcAddress, surface_handle: VulkanSurface) void {
        vulkan_surface.destroy_surface(get_instance_proc_addr, instance, surface_handle);
    }

    /// Creates a surface on `device`'s Vulkan instance and claims it for swapchain
    /// rendering (SDL_ClaimWindowForGPUDevice). The returned handle is what
    /// `gpu.window.acquire_window_texture` takes. Resizes need no further
    /// code: each acquire reads `size_in_pixels` and recreates the swapchain. The
    /// device must have enabled `Platform.vulkan_instance_extensions` and must
    /// outlive the claim.
    pub fn claim_for_gpu(self: Window, device: *gpu_device.Device, options: gpu_device.SwapchainOptions) Error!GpuSurface {
        return graphics.claim_for_gpu(self.platform, try self.record(), device, options);
    }

    /// Releases the claim made by `claim_for_gpu` (SDL_ReleaseWindowFromGPUDevice).
    pub fn release_from_gpu(self: Window, device: *gpu_device.Device) Error!void {
        return graphics.release_from_gpu(self.platform, try self.record(), device);
    }

    /// Presents a raster the size of the window (X11) or of its buffer (Wayland).
    /// A popup presents its own raster at the popup's size.
    pub fn present(self: Window, view: surface.View) Error!void {
        const r = try self.record();
        switch (r.native) {
            .x11 => |*window| try window.present(self.platform.allocator, view),
            .wayland => |*window| try window.present(view),
            .wayland_popup => |popup| {
                const parent = self.platform.find(popup.parent) orelse return error.WindowClosed;
                switch (parent.native) {
                    .wayland => |*window| try window.present_popup(popup.popup, view),
                    else => return error.WindowClosed,
                }
            },
            .none => return error.WindowClosed,
        }
    }

    /// Opens a popup (tooltip or menu) positioned relative to this window. The
    /// popup is a Window in its own right and is destroyed with `deinit`.
    /// Wayland: an xdg_popup that can be presented once the compositor configures
    /// it (the popup's `shown` window event follows a pump). X11: an
    /// override-redirect window, mapped at once. A popup cannot be a parent.
    pub fn open_popup(self: Window, options: PopupOptions) Error!Window {
        const parent = try self.record();
        if (options.size.width == 0 or options.size.height == 0) return error.InvalidSize;
        const owner = self.platform;
        if (owner.records.items.len >= max_windows) return error.TooManyWindows;
        switch (parent.native) {
            .x11 => |*window| {
                const popup_window = try x11_backend.create_popup(window, options);
                return owner.add_popup_record(.{ .x11 = popup_window }, options, false);
            },
            .wayland => |*window| {
                const popup_id = try window.open_popup(.{
                    .anchor_rect = .{ .x = options.offset.x, .y = options.offset.y, .width = 1, .height = 1 },
                    .size = .{ .width = options.size.width, .height = options.size.height },
                    .anchor = .top_left,
                    .gravity = .bottom_right,
                    .constraints = .{ .slide_x = true, .slide_y = true, .flip_x = true, .flip_y = true },
                    .grab = options.grab,
                });
                errdefer window.close_popup(popup_id) catch {};
                return owner.add_popup_record(.{ .wayland_popup = .{ .parent = self.id, .popup = popup_id } }, options, true);
            },
            .wayland_popup => return error.UnsupportedOperation,
            .none => return error.WindowClosed,
        }
    }

    /// Sets the input shape from a view's alpha channel: pixels with zero alpha
    /// let pointer input pass through (X11 XShape). `null` clears the shape. Wayland
    /// has no input-region request in this layer, so it reports `UnsupportedOperation`.
    pub fn set_shape(self: Window, view: ?surface.View) Error!void {
        const r = try self.record();
        switch (r.native) {
            .x11 => |*window| try window.set_shape(self.platform.allocator, view),
            .wayland, .wayland_popup => return error.UnsupportedOperation,
            .none => return error.WindowClosed,
        }
    }

    /// Starts a drag from this window offering `entries` (each MIME type's bytes
    /// are served when a target asks for them). Wayland only: X11 has no drag source
    /// in SDL either, so it reports `UnsupportedOperation`. Call from a pointer or
    /// touch press. The outcome arrives through `take_drag_result`.
    pub fn start_drag(self: Window, entries: []const DragEntry) Error!void {
        const r = try self.record();
        switch (r.native) {
            .wayland => |*window| {
                const converted = try self.platform.allocator.alloc(wayland.SelectionEntry, entries.len);
                defer self.platform.allocator.free(converted);
                for (entries, converted) |entry, *out| out.* = .{ .mime = entry.mime, .data = entry.data };
                r.drag_dropped = null;
                try window.start_drag(converted);
            },
            .x11, .wayland_popup => return error.UnsupportedOperation,
            .none => return error.WindowClosed,
        }
    }

    /// How the drag started by `start_drag` ended, reported once: true when a
    /// target accepted it, false when it was cancelled. Null while the drag runs,
    /// before any drag, or after the result was taken.
    pub fn take_drag_result(self: Window) Error!?bool {
        const r = try self.record();
        const result = r.drag_dropped;
        r.drag_dropped = null;
        return result;
    }

    /// Shows a standard cursor over the window. X11 uses the desktop cursor
    /// theme when libXcursor is present, the X font shape otherwise.
    pub fn set_cursor(self: Window, cursor: SystemCursor) Error!void {
        const r = try self.record();
        switch (r.native) {
            .x11 => |*window| {
                var next = try x11.Cursor.system(&self.platform.x11.?.connection, x11_backend.cursor_shape(cursor));
                errdefer next.deinit();
                if (r.x11_cursor) |*old| old.deinit();
                r.x11_cursor = next;
                try window.set_cursor(&r.x11_cursor.?);
            },
            .wayland => |*window| try window.set_cursor(.{ .system = wayland_backend.cursor_shape(cursor) }),
            .none, .wayland_popup => {},
        }
    }

    /// Enables text input (input-method composition events follow).
    pub fn start_text_input(self: Window) Error!void {
        const r = try self.record();
        switch (r.native) {
            .x11 => |*window| try self.platform.x11.?.connection.enable_text_input(window),
            .wayland => |*window| try window.start_text_input(),
            .none, .wayland_popup => {},
        }
        r.text_input = true;
    }

    pub fn stop_text_input(self: Window) Error!void {
        const r = try self.record();
        switch (r.native) {
            .x11 => |*window| self.platform.x11.?.connection.disable_text_input(window),
            .wayland => |*window| try window.stop_text_input(),
            .none, .wayland_popup => {},
        }
        r.text_input = false;
    }

    /// Makes `text` the clipboard contents. The platform keeps its own copy.
    pub fn set_clipboard_text(self: Window, text: []const u8) Error!void {
        const r = try self.record();
        switch (r.native) {
            .x11 => |*window| {
                const session = self.platform.x11.?;
                try session.clipboard.set_text(&session.connection, window, .clipboard, text);
            },
            .wayland => |*window| try wayland_backend.set_clipboard(window, text),
            .none, .wayland_popup => {},
        }
    }

    /// Reads the clipboard as UTF-8 text. The caller owns the result. The read
    /// may wait for the owning client (up to five seconds per step).
    pub fn clipboard_text(self: Window, allocator: std.mem.Allocator) Error![]u8 {
        const r = try self.record();
        return switch (r.native) {
            .x11 => |*window| try x11_backend.clipboard_text(self.platform, allocator, window),
            .wayland => |*window| try wayland_backend.clipboard_text(allocator, window),
            .wayland_popup => error.UnsupportedOperation,
            .none => error.WindowClosed,
        };
    }

    /// Shows a message box over this window and returns the pressed button's id,
    /// or null when the box was dismissed without a choice. See `show_message_box`.
    pub fn show_message_box(self: Window, data: message_box.Data) Error!?i32 {
        return show_message_box_for(self.platform, self, data);
    }
};

/// Shows a message box, optionally over `parent`, and returns the pressed
/// button's id. X11 draws the box itself (`messagebox` X11 backend); other
/// sessions run zenity. The box is modal: the call returns when it closes.
pub fn show_message_box(platform_ref: *Platform, data: message_box.Data) Error!?i32 {
    return show_message_box_for(platform_ref, null, data);
}

fn show_message_box_for(platform_ref: *Platform, parent: ?Window, data: message_box.Data) Error!?i32 {
    switch (platform_ref.backend) {
        .x11 => {
            const session = platform_ref.x11.?;
            var x_parent: ?*const x11.Window = null;
            if (parent) |handle| switch ((try handle.record()).native) {
                .x11 => |*window| x_parent = window,
                else => {},
            };
            return x11_message_box.show(platform_ref.allocator, &session.connection, x_parent, data);
        },
        .wayland => return zenity.show(platform_ref.allocator, platform_ref.io, data),
    }
}
