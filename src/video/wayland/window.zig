//! Wayland toplevel window on libwayland-client (loaded privately through
//! `binding.zig`): connection, globals, xdg-shell configure handling, wl_shm
//! presentation of a CPU raster, frame callbacks, outputs/scale, typed input
//! events (pointer, keyboard, touch), cursors, clipboard and primary selection,
//! text input, relative pointer with pointer lock, and activation requests.
//! Public types here contain no C pointers.
//!
//! Flow: `Window.open` connects, binds globals through the registry, creates a
//! surface with an xdg toplevel and waits for the first configure, which it
//! acknowledges. The owner then loops: `dispatch` to read and handle server
//! events, `poll_event` to drain typed `Event`s, and `present` to copy a raster
//! into one of two wl_shm buffers and commit it. A buffer is reused only after
//! its wl_buffer.release arrives; `present` returns `error.NoFreeBuffer` while
//! both are held, so dispatch and retry.
//!
//! Sizes: `logical_size` is the xdg configure size in surface coordinates.
//! `buffer_size` is the pixel size `present` requires. With wp_viewporter and
//! wp_fractional_scale_v1 the buffer is the logical size times the preferred
//! fractional scale (rounded up) and the viewport maps it back to logical size.
//! Otherwise the buffer uses an integer wl_surface buffer scale: the largest
//! scale of any bound output.
//!
//! Event payloads that borrow memory (keymap and text) point into the window's
//! event payload store. They remain valid until the next `dispatch` after its
//! event queue has been drained. Copy them before that boundary if they need to
//! live longer. Events are FIFO; `poll_event` returns null when empty. The window
//! keeps its libwayland state behind heap pointers, so `open`'s return value may
//! be moved freely.
//!
//! Timestamp fields named `time_ms` or `time_us` preserve their Wayland wire
//! units for protocol-specific grouping and animation. The Linux platform
//! replaces those values with its monotonic nanosecond clock when it creates
//! `events.Event`s; they are never copied into public event timestamps.
//!
//! Cursors (wp_cursor_shape_v1 when offered, else the XCursor theme through
//! libwayland-cursor): see `cursor.zig`. Relative mouse mode uses a persistent
//! pointer lock plus zwp_relative_pointer_v1 motion. Clipboard and primary
//! selection: see `clipboard.zig`. Text input: see `text_input.zig`.
//!
//! Outputs: every bound wl_output is tracked with its geometry, modes, scale,
//! name and (when zxdg_output_manager_v1 is offered) its logical position and
//! size. `outputs` returns a snapshot; `output_added`/`output_changed`/
//! `output_removed` events announce changes after the server's `done`.
//!
//! Scroll: wl_pointer axis data is accumulated per frame (wl_pointer.frame) as
//! SDL does: high-resolution `axis_value120` wins over `axis_discrete`, which wins
//! over continuous `axis` values; one `pointer_scroll` per axis is emitted per frame.
//!
//! Drag and drop, receiving: `drag_enter`/`drag_motion`/`drag_leave`/`drag_drop`
//! events carry the offer's MIME types through `drag_mime_types`; the owner calls
//! `accept_drag`, `drag_receive` and `finish_drag`. See `dnd.zig` for file-list and
//! text classification. Sending: see `start_drag` below.
//!
//! Popups: `open_popup` creates an xdg_popup on its own wl_surface, relative to
//! this window's toplevel, with an xdg_positioner built from `PopupOptions`. Each
//! popup surface has a frame callback (`popup_frame_done`) and, when wp_viewporter
//! and wp_fractional_scale_v1 are offered, its own viewport and preferred scale
//! (`popup_scale_changed`, `popup_buffer_size`).
//!
//! Drag source: `start_drag` offers copied MIME entries through wl_data_source and
//! serves them on `send` like the clipboard; `drag_source_ended` reports the end.
//! Pens: tablet tools from zwp_tablet_v2 are announced as `pen_added` once their
//! role is known, and frames of samples arrive as `pen` events (see `tablet.zig`).
//! Text input: `set_content_type` and `set_surrounding_text` forward the content
//! description and surrounding text to zwp_text_input_v3.
//!
//! Deliberate differences from SDL: no EGL/Vulkan. The owner pumps the socket (no
//! event thread). Only the first advertised seat is used. Losing a seat or one of
//! its capabilities releases the objects it created (pointer, keyboard, touch,
//! tablets, data devices, text input, selection offers), as SDL does for one seat.
//! Other seats are not tracked; multi-seat support remains.
//! Server-side decorations are requested when `Options.server_decorations` is set
//! and the compositor offers them. Pointer confinement is not exposed; only the
//! lock used by relative mouse mode. Warping uses wp_pointer_warp_v1 when offered,
//! otherwise a one-shot pointer lock carrying the cursor position hint, as SDL
//! does. Hiding a window destroys its wl_buffers; showing it waits for the next
//! configure, as xdg-shell requires after an unmap.

const std = @import("std");
const linux = std.os.linux;
const Allocator = std.mem.Allocator;
const binding = @import("binding.zig");
const protocol = @import("protocol.zig");
const shm = @import("shm.zig");
const cursor = @import("cursor.zig");
const clipboard = @import("clipboard.zig");
const text_input = @import("text_input.zig");
const surface = @import("../surface.zig");
const geometry = @import("../geometry.zig");
const keyboard = @import("../../input/keyboard.zig");
const linux_keys = @import("../../input/linux_keys.zig");
const dnd = @import("dnd.zig");
const tablet = @import("tablet.zig");

const Proxy = binding.Proxy;
const page_size = std.heap.page_size_min;
const scale_unit = 120;

/// Highest interface versions this implementation handles; globals bind at
/// min(advertised, these).
const max_versions = struct {
    const compositor: u32 = 6;
    const shm: u32 = 1;
    const seat: u32 = 7;
    const output: u32 = 4;
    const wm_base: u32 = 6;
    const decoration_manager: u32 = 1;
    const viewporter: u32 = 1;
    const fractional_manager: u32 = 1;
    const data_device_manager: u32 = 3;
    const primary_manager: u32 = 1;
    const text_input_manager: u32 = 1;
    const relative_manager: u32 = 1;
    const constraints: u32 = 1;
    const activation: u32 = 1;
    const cursor_shape_manager: u32 = 1;
    const xdg_output_manager: u32 = 3;
    const pointer_warp: u32 = 1;
    const wm_base_popups: u32 = 6;
    const tablet_manager: u32 = 1;
};

/// Longest surrounding text the text-input protocol accepts (4 KiB).
const max_surrounding_bytes = 4096;

pub const Error = binding.Error || shm.Error || clipboard.Error || surface.Error || geometry.GeometryError || error{
    MissingGlobal,
    NotConfigured,
    NoFreeBuffer,
    SizeMismatch,
    TooLarge,
    Interrupted,
    /// The compositor lacks the protocol the request needs.
    Unsupported,
    /// The request needs a recent input serial (a pointer, key or touch event).
    NoSerial,
    /// The requested selection has no current offer.
    NoSelection,
    /// No open popup has this id (it was closed or never existed).
    UnknownPopup,
    /// The popup has not been configured by the compositor yet.
    NotMapped,
    /// The request needs a drag-and-drop offer, and none is active.
    NoDrag,
    /// `start_drag` was called while this window's drag source is still active.
    DragInProgress,
    /// The request needs at least one MIME entry to offer.
    NoData,
    /// A text offset lies outside the text it refers to.
    InvalidOffset,
};

/// Integer size in surface or buffer pixels.
pub const Size = struct {
    width: u31,
    height: u31,
};

/// xdg_toplevel state bits (values 1..9 of the configure state array).
pub const State = packed struct(u16) {
    maximized: bool = false,
    fullscreen: bool = false,
    resizing: bool = false,
    activated: bool = false,
    tiled_left: bool = false,
    tiled_right: bool = false,
    tiled_top: bool = false,
    tiled_bottom: bool = false,
    suspended: bool = false,
    _: u7 = 0,
};

/// Creation parameters. Strings are copied; they need not outlive `open`.
pub const Options = struct {
    title: []const u8 = "",
    app_id: []const u8 = "",
    size: Size = .{ .width = 640, .height = 480 },
    min_size: ?Size = null,
    max_size: ?Size = null,
    /// Request server-side decorations when the compositor supports them.
    server_decorations: bool = true,
    /// XCursor theme for system cursors when the compositor lacks cursor-shape-v1.
    /// Null selects libwayland's default theme. Explicit so the owner decides
    /// where the name comes from (for example XCURSOR_THEME).
    cursor_theme: ?[]const u8 = null,
    /// Base cursor size in logical pixels; the theme loads at this times the buffer scale.
    cursor_size: u32 = 24,
};

/// Configure payload after acknowledgement. A zero size from the server keeps the
/// previous logical size.
pub const Configure = struct {
    size: Size,
    state: State,
};

pub const Key = struct {
    /// Physical position from the Linux evdev table (`input/linux_keys.zig`).
    scancode: keyboard.Scancode,
    /// Raw evdev key code as sent by the compositor (no XKB +8 offset).
    evdev_code: u32,
    pressed: bool,
    time_ms: u32,
};

/// Raw XKB modifier masks and layout group; interpret them with the keymap.
pub const XkbModifiers = struct {
    depressed: u32,
    latched: u32,
    locked: u32,
    group: u32,
};

pub const Point = struct { x: f64, y: f64 };

pub const Motion = struct {
    x: f64,
    y: f64,
    time_ms: u32,
};

pub const Button = struct {
    /// Linux BTN_* code (0x110 is the left button).
    code: u32,
    pressed: bool,
    time_ms: u32,
};

/// Source of a scroll frame (wl_pointer.axis_source).
pub const ScrollSource = enum { unknown, wheel, finger, continuous, wheel_tilt };

/// One scroll frame for one axis, emitted at wl_pointer.frame. Positive values
/// are down or right, as the protocol reports them.
pub const Scroll = struct {
    /// True for horizontal scrolling, false for vertical.
    horizontal: bool,
    /// Distance in surface units (continuous deltas as sent; wheel steps as 10 units each).
    value: f64,
    /// Wheel ticks: high-resolution deltas divided by 120, discrete steps as sent,
    /// and continuous deltas divided by 10. Same direction as `value`.
    ticks: f64 = 0,
    /// Whole wheel steps in this frame. High-resolution (value120) deltas accumulate
    /// per axis across frames, so a step is reported once 120 units have arrived.
    /// Zero for continuous (touchpad) scrolling.
    steps: i32 = 0,
    source: ScrollSource = .unknown,
    /// True when the compositor reports the wheel direction as inverted (natural scrolling).
    inverted: bool = false,
    time_ms: u32,
};

/// Drag position in surface units (the offer's pointer, not the window's pointer).
pub const DragPosition = struct {
    x: f64,
    y: f64,
    /// Zero for `drag_enter`.
    time_ms: u32,
};

/// Classification of a dropped offer, from its MIME types (see `dnd.classify`).
pub const DropKind = dnd.Kind;

/// Stable id of an output: its wl_registry global name. Ids are not reused while
/// the output exists; after `output_removed` the id is no longer valid.
pub const OutputId = u32;

/// Fixed-capacity copy of a short compositor string (output name, make, ...).
pub const Text = binding.Name;

/// Output transform (wl_output.transform).
pub const Transform = enum { normal, rotate_90, rotate_180, rotate_270, flipped, flipped_90, flipped_180, flipped_270 };

/// One output mode. Refresh is in millihertz, as wl_output reports it (0 when unknown).
pub const Mode = struct {
    width: i32,
    height: i32,
    refresh_mhz: i32,
    current: bool,
    preferred: bool,
};

/// Logical or physical position in compositor coordinates.
pub const Position = struct { x: i32, y: i32 };

/// Snapshot of one output. `modes` is owned by the caller; release the list with
/// `free_outputs`.
pub const OutputInfo = struct {
    id: OutputId,
    name: Text,
    description: Text,
    make: Text,
    model: Text,
    /// Logical position from zxdg_output, else the wl_output geometry position.
    position: Position,
    /// Logical size: zxdg_output's size, else the current mode divided by the
    /// integer scale (swapped for 90/270 degree transforms). Zero without a mode.
    size: Size,
    /// Physical size in millimetres (zero when the compositor does not know it).
    physical_size: Size,
    scale: i32,
    transform: Transform,
    /// The current mode, or null when the compositor has not sent one.
    mode: ?Mode,
    modes: []Mode,
};

/// Window decoration mode (zxdg_toplevel_decoration_v1).
pub const DecorationMode = enum { client_side, server_side };

/// Anchor rectangle (surface coordinates) a popup is positioned against.
pub const AnchorRect = struct { x: i32, y: i32, width: i32, height: i32 };

pub const PopupAnchor = protocol.XdgPositioner.Anchor;
pub const PopupGravity = protocol.XdgPositioner.Gravity;
pub const PopupId = u32;

/// xdg_positioner constraint adjustment bits (bit order matches the protocol values).
pub const Constraints = packed struct(u32) {
    slide_x: bool = false,
    slide_y: bool = false,
    flip_x: bool = false,
    flip_y: bool = false,
    resize_x: bool = false,
    resize_y: bool = false,
    _: u26 = 0,
};

/// Popup placement and behavior. The popup's position is the anchor rectangle's
/// point selected by `anchor`, moved by `gravity` and `offset`, then adjusted by
/// `constraints` to fit the output.
pub const PopupOptions = struct {
    anchor_rect: AnchorRect,
    size: Size,
    anchor: PopupAnchor = .none,
    gravity: PopupGravity = .none,
    offset: Position = .{ .x = 0, .y = 0 },
    constraints: Constraints = .{},
    /// Ask to be repositioned when the parent moves (xdg_positioner v3).
    reactive: bool = false,
    /// Take an explicit grab with the last input serial (menus, pickers).
    grab: bool = false,
};

/// Popup geometry from the compositor. Position is relative to the parent surface.
pub const PopupConfigure = struct {
    id: PopupId,
    x: i32,
    y: i32,
    size: Size,
};

pub const Repeat = struct {
    /// Repeats per second; 0 disables client-side repeat.
    rate: i32,
    delay_ms: i32,
};

/// Relative pointer motion in unit-less device deltas. `dx`/`dy` are accelerated;
/// `dx_unaccel`/`dy_unaccel` are the raw device deltas.
pub const RelativeMotion = struct {
    dx: f64,
    dy: f64,
    dx_unaccel: f64,
    dy_unaccel: f64,
    /// Compositor timestamp in microseconds.
    time_us: u64,
};

/// One touch point. `x`/`y` are zero for `touch_up`.
pub const Touch = struct {
    id: i32,
    time_ms: u32,
    x: f64 = 0,
    y: f64 = 0,
};

/// Typed window events, produced by `dispatch` and drained with `poll_event`.
pub const Event = union(enum) {
    configure: Configure,
    /// The compositor asked the client to close; the owner decides.
    close_requested,
    /// The frame previously committed by `present` was shown.
    frame_done,
    /// Preferred scale changed; re-query `buffer_size`.
    scale_changed,
    /// Borrowed XKB keymap text (xkb_v1), valid until the next dispatch after
    /// this window's event queue has been drained.
    keyboard_keymap: []const u8,
    keyboard_focus: bool,
    key: Key,
    keyboard_modifiers: XkbModifiers,
    keyboard_repeat: Repeat,
    pointer_enter: Point,
    pointer_leave,
    pointer_motion: Motion,
    pointer_button: Button,
    pointer_scroll: Scroll,
    /// Relative motion while relative mouse mode is on.
    pointer_relative_motion: RelativeMotion,
    /// The pointer lock took effect (true) or was released (false).
    pointer_lock: bool,
    touch_down: Touch,
    touch_up: Touch,
    touch_motion: Touch,
    /// End of a group of touch events for one input frame.
    touch_frame,
    /// The compositor cancelled all active touches (for example after a gesture).
    touch_cancel,
    /// The clipboard or primary selection changed; query `selection_mime_types`.
    selection_changed: clipboard.Selection,
    /// Composition text for the current input method batch.
    text_preedit: text_input.Preedit,
    /// Committed text from the input method.
    text_commit: []const u8,
    /// Bytes to delete around the cursor before the commit that follows.
    text_delete_surrounding: text_input.Delete,
    /// An output appeared (its first complete wl_output `done`).
    output_added: OutputId,
    /// An output's geometry, modes, scale, name or logical layout changed.
    output_changed: OutputId,
    output_removed: OutputId,
    /// Drag entered the window at a position; query `drag_mime_types`.
    drag_enter: DragPosition,
    drag_motion: DragPosition,
    /// The drag left without a drop; any offer was discarded.
    drag_leave,
    /// The user dropped the drag. Use `drag_receive` and then `finish_drag`.
    drag_drop: DropKind,
    popup_configure: PopupConfigure,
    /// The compositor dismissed the popup (for example an outside click); close it.
    popup_done: PopupId,
    popup_repositioned: struct { id: PopupId, token: u32 },
    /// The popup's last committed buffer was shown (its frame callback fired).
    popup_frame_done: PopupId,
    /// The popup's preferred fractional scale changed; re-query `popup_buffer_size`.
    popup_scale_changed: PopupId,
    /// A tablet tool with a known role was announced; later `pen` samples carry `id`.
    pen_added: PenInfo,
    /// The tool was removed (or its seat went away); its id is no longer used.
    pen_removed: PenId,
    /// One sample of a pen frame: proximity, tip, motion, axis or button.
    pen: PenSample,
    /// The drag started by `start_drag` ended. `dropped` is true when a target
    /// accepted the drop, false when the drag was cancelled.
    drag_source_ended: struct { dropped: bool },
};

pub const CustomCursor = cursor.CustomCursor;
pub const Cursor = cursor.Cursor;
pub const SystemCursor = cursor.SystemCursor;
pub const Selection = clipboard.Selection;
pub const SelectionEntry = clipboard.Entry;
pub const Pipe = clipboard.Pipe;
pub const ReadStatus = clipboard.Read;
pub const TextArea = text_input.Area;
pub const Preedit = text_input.Preedit;
pub const ContentType = text_input.ContentType;
pub const InputType = text_input.InputType;
pub const Capitalization = text_input.Capitalization;
/// Identifies a pen tool while it is announced (from `pen_added` to `pen_removed`).
pub const PenId = u32;
pub const PenInfo = tablet.Info;
pub const PenKind = tablet.Kind;
pub const PenAxis = tablet.Axis;
pub const PenCapabilities = tablet.Capabilities;
/// One sample of a pen frame. `time_ms` is the frame's timestamp; positions are surface-local.
pub const PenSample = struct {
    pen: PenId,
    time_ms: u32,
    sample: tablet.Sample,
};

/// Scroll data of one axis accumulated within a pointer frame.
const AxisFrame = struct {
    /// Precedence as SDL: value120 replaces discrete and continuous, discrete replaces continuous.
    kind: enum { none, continuous, discrete, value120 } = .none,
    continuous: f64 = 0,
    discrete: i32 = 0,
    value120: i32 = 0,
    time_ms: u32 = 0,
    source: ScrollSource = .unknown,
    inverted: bool = false,

    /// Adds one axis event of `kind`, replacing data of a lower-precedence kind.
    fn add(self: *AxisFrame, kind: @FieldType(AxisFrame, "kind"), time_ms: u32, amount: f64) void {
        if (self.kind == .value120 and kind != .value120) return;
        if (self.kind == .discrete and kind == .continuous) return;
        if (self.kind != kind) {
            self.kind = kind;
            self.continuous = 0;
            self.discrete = 0;
            self.value120 = 0;
        }
        self.time_ms = time_ms;
        switch (kind) {
            .none => {},
            .continuous => self.continuous += amount,
            .discrete => self.discrete += @intFromFloat(amount),
            .value120 => self.value120 += @intFromFloat(amount),
        }
    }
};

/// Internal per-output record, filled from wl_output and zxdg_output events.
const Output = struct {
    global_name: u32,
    proxy: Proxy,
    xdg: ?Proxy = null,
    scale: i32 = 1,
    /// True once the first wl_output `done` announced the output as an event.
    announced: bool = false,
    geometry_x: i32 = 0,
    geometry_y: i32 = 0,
    physical_width: i32 = 0,
    physical_height: i32 = 0,
    transform: Transform = .normal,
    make: Text = .{},
    model: Text = .{},
    name: Text = .{},
    description: Text = .{},
    modes: std.ArrayList(Mode) = .empty,
    /// Bound wl_output version; wl_output.release exists from version 3.
    version: u32 = 1,
    logical_position: ?Position = null,
    logical_size: ?Size = null,
};

/// One popup: its own wl_surface, xdg_surface and xdg_popup, and two buffers.
const Popup = struct {
    id: PopupId,
    surface: Proxy,
    xdg_surface: Proxy,
    xdg_popup: Proxy,
    buffers: [2]shm.Buffer = .{ .{}, .{} },
    size: Size,
    pending: ?PopupConfigure = null,
    configured: bool = false,
    /// wp_viewport and wp_fractional_scale_v1 of the popup surface, when offered.
    viewport: ?Proxy = null,
    fractional: ?Proxy = null,
    scale_120: u32 = scale_unit,
    frame_callback: ?Proxy = null,
};

pub const Window = struct {
    allocator: Allocator,
    /// Heap-stable so that listeners and proxies never see a moved library.
    lib: *binding.Library,
    display: Proxy,
    inbox: *binding.Inbox,

    registry: ?Proxy = null,
    compositor: ?Proxy = null,
    shm: ?Proxy = null,
    seat: ?Proxy = null,
    /// Registry name of the bound seat (0 when none). Used to detect its removal.
    seat_global: u32 = 0,
    pointer: ?Proxy = null,
    keyboard: ?Proxy = null,
    touch: ?Proxy = null,
    tablet_manager: ?Proxy = null,
    tablet_seat: ?Proxy = null,
    wm_base: ?Proxy = null,
    decoration_manager: ?Proxy = null,
    viewporter: ?Proxy = null,
    fractional_manager: ?Proxy = null,
    data_device_manager: ?Proxy = null,
    primary_manager: ?Proxy = null,
    xdg_output_manager: ?Proxy = null,
    pointer_warp: ?Proxy = null,
    text_input_manager: ?Proxy = null,
    relative_manager: ?Proxy = null,
    constraints: ?Proxy = null,
    activation: ?Proxy = null,
    cursor_shape_manager: ?Proxy = null,

    surface: ?Proxy = null,
    xdg_surface: ?Proxy = null,
    toplevel: ?Proxy = null,
    decoration: ?Proxy = null,
    /// Versions bound for the globals whose request signatures depend on them.
    wm_base_version: u32 = 1,
    data_device_version: u32 = 1,
    seat_version: u32 = 1,
    viewport: ?Proxy = null,
    fractional: ?Proxy = null,

    frame_callback: ?Proxy = null,

    data_device: ?Proxy = null,
    primary_device: ?Proxy = null,
    text_input: ?Proxy = null,
    relative_pointer: ?Proxy = null,
    locked_pointer: ?Proxy = null,
    cursor_shape: ?Proxy = null,
    cursor_surface: ?Proxy = null,
    /// Tablet tools of the seat, in the order they were announced.
    pens: std.ArrayList(tablet.Tool) = .empty,
    next_pen_id: PenId = 1,

    output_records: std.ArrayList(Output) = .empty,
    popups: std.ArrayList(Popup) = .empty,
    next_popup_id: PopupId = 1,
    next_reposition_token: u32 = 1,
    /// Decoration mode from the last zxdg_toplevel_decoration_v1.configure.
    decoration_mode_state: ?DecorationMode = null,
    /// False while the window is hidden (its buffers were released; see `hide`).
    mapped: bool = true,
    /// Wheel accumulation for the current pointer frame, one slot per axis (0 vertical, 1 horizontal).
    axis_frame: [2]AxisFrame = .{ .{}, .{} },
    /// Leftover high-resolution units per axis, below one wheel step.
    wheel_remainder: [2]i32 = .{ 0, 0 },
    /// False when the seat's pointer has no wl_pointer.frame (seat version < 5):
    /// each axis event is then emitted at once.
    pointer_frames: bool = true,
    /// Drag-and-drop offer of the current drag, and its enter serial.
    drag_offer: ?Proxy = null,
    drag_serial: u32 = 0,
    drag_dropped: bool = false,
    /// The drag started by `start_drag` and whether it was dropped.
    drag_source: ?clipboard.Source = null,
    drag_source_dropped: bool = false,
    /// Keyboard focus and active touch count, to report leave/cancel when objects are released.
    keyboard_focused: bool = false,
    touch_active: u32 = 0,
    /// Whether zwp_text_input_v3 is enabled, and the content type last set.
    text_enabled: bool = false,
    content_type: text_input.ContentType = .{},
    buffers: [2]shm.Buffer = .{ .{}, .{} },
    /// Read-only keymap mapping; null until the keyboard sends one.
    keymap: ?[]align(page_size) u8 = null,

    events: std.ArrayList(Event) = .empty,
    event_head: usize = 0,
    /// Owned strings referenced by queued events; reclaimed when the queue empties.
    texts: std.ArrayList([]u8) = .empty,

    /// Configure payload waiting for its xdg_surface.configure serial.
    pending: ?Configure = null,
    logical: Size,
    state: State = .{},
    configured: bool = false,
    /// Preferred fractional scale in 1/120 units; 120 when unknown.
    scale_120: u32 = scale_unit,
    /// Integer buffer scale: the maximum of bound output scales.
    buffer_scale: i32 = 1,

    /// Last input serials, needed by set_cursor, selections and activation.
    pointer_serial: u32 = 0,
    keyboard_serial: u32 = 0,
    input_serial: u32 = 0,
    pointer_focused: bool = false,

    cursor: Cursor = .{ .system = .default },
    cursor_lib: ?binding.CursorLibrary = null,
    cursor_theme: ?binding.CursorTheme = null,
    cursor_theme_size: u32 = 0,
    cursor_theme_name: ?[:0]u8 = null,
    cursor_size: u32 = 24,
    /// Named cursor of the loaded theme; valid until the theme is replaced.
    theme_cursor: ?binding.ThemeCursor = null,

    offers: std.ArrayList(clipboard.Offer) = .empty,
    clipboard_offer: ?Proxy = null,
    primary_offer: ?Proxy = null,
    clipboard_source: ?clipboard.Source = null,
    primary_source: ?clipboard.Source = null,
    text_batch: text_input.Batch = .{},
    app_id: ?[:0]u8 = null,

    /// True while relative mouse mode holds the pointer lock.
    relative_mode: bool = false,

    /// Connects, creates the toplevel and blocks until the first configure has
    /// been acknowledged. Loads libwayland-client; the application must link libc.
    pub fn open(allocator: Allocator, options: Options) Error!Window {
        const lib = try allocator.create(binding.Library);
        errdefer allocator.destroy(lib);
        lib.* = try binding.Library.open();
        errdefer lib.close();

        const display = try lib.connect();
        errdefer lib.disconnect(display);
        const inbox = try allocator.create(binding.Inbox);
        inbox.* = .{ .allocator = allocator };
        errdefer allocator.destroy(inbox);

        var self: Window = .{
            .allocator = allocator,
            .lib = lib,
            .display = display,
            .inbox = inbox,
            .logical = options.size,
            .cursor_size = options.cursor_size,
        };
        errdefer self.deinit();
        if (options.cursor_theme) |name| self.cursor_theme_name = try allocator.dupeSentinel(u8, name, 0);
        if (options.app_id.len > 0) self.app_id = try allocator.dupeSentinel(u8, options.app_id, 0);

        const registry = try protocol.Display.get_registry(lib, display);
        self.registry = registry;
        try lib.listen(registry, &binding.registry_listener, inbox);
        try self.roundtrip();
        try self.roundtrip();
        if (self.compositor == null or self.shm == null or self.wm_base == null) return error.MissingGlobal;

        const surface_proxy = try protocol.Compositor.create_surface(lib, self.compositor.?);
        self.surface = surface_proxy;
        const xdg = try protocol.XdgWmBase.get_xdg_surface(lib, self.wm_base.?, surface_proxy);
        self.xdg_surface = xdg;
        try lib.listen(xdg, &binding.xdg_surface_listener, inbox);
        const toplevel = try protocol.XdgSurface.get_toplevel(lib, xdg);
        self.toplevel = toplevel;
        try lib.listen(toplevel, &binding.toplevel_listener, inbox);

        if (options.title.len > 0) {
            const title = try allocator.dupeSentinel(u8, options.title, 0);
            defer allocator.free(title);
            protocol.XdgToplevel.set_title(lib, toplevel, title);
        }
        if (self.app_id) |app_id| protocol.XdgToplevel.set_app_id(lib, toplevel, app_id);
        if (options.min_size) |min| protocol.XdgToplevel.set_min_size(lib, toplevel, min.width, min.height);
        if (options.max_size) |max| protocol.XdgToplevel.set_max_size(lib, toplevel, max.width, max.height);

        if (self.decoration_manager) |manager| {
            const decoration_proxy = try protocol.ZxdgDecorationManagerV1.get_toplevel_decoration(lib, manager, toplevel);
            self.decoration = decoration_proxy;
            try lib.listen(decoration_proxy, &binding.decoration_listener, inbox);
            const mode: protocol.ZxdgToplevelDecorationV1.Mode = if (options.server_decorations) .server_side else .client_side;
            protocol.ZxdgToplevelDecorationV1.set_mode(lib, decoration_proxy, mode);
        }
        if (self.viewporter) |viewporter| self.viewport = try protocol.WpViewporter.get_viewport(lib, viewporter, surface_proxy);
        if (self.fractional_manager) |manager| {
            const fractional_proxy = try protocol.WpFractionalScaleManagerV1.get_fractional_scale(lib, manager, surface_proxy);
            self.fractional = fractional_proxy;
            try lib.listen(fractional_proxy, &binding.fractional_listener, inbox);
        }

        // An empty commit asks the compositor for the first configure.
        protocol.Surface.commit(lib, surface_proxy);
        try self.flush();
        while (!self.configured) try self.pump(true);
        return self;
    }

    /// Frees buffers, mappings, queues and the connection. Borrowed keymap
    /// slices become invalid. Server-side objects are reclaimed on disconnect.
    /// Custom cursors must be released with `release_custom_cursor` first.
    pub fn deinit(self: *Window) void {
        for (self.popups.items) |*popup| release_popup(self.lib, popup);
        self.popups.deinit(self.allocator);
        for (&self.buffers) |*buffer| buffer.release(self.lib);
        if (self.keymap) |map| _ = linux.munmap(map.ptr, map.len);
        self.free_theme();
        if (self.cursor_lib) |*lib| lib.close();
        if (self.cursor_theme_name) |name| self.allocator.free(name);
        if (self.app_id) |app_id| self.allocator.free(app_id);
        if (self.clipboard_source) |*source| source.deinit(self.allocator);
        if (self.primary_source) |*source| source.deinit(self.allocator);
        for (self.offers.items) |*offer| offer.deinit(self.allocator);
        self.offers.deinit(self.allocator);
        self.text_batch.deinit(self.allocator);
        if (self.drag_source) |*source| source.deinit(self.allocator);
        self.pens.deinit(self.allocator);
        self.reclaim_texts();
        self.texts.deinit(self.allocator);
        for (self.output_records.items) |*output| output.modes.deinit(self.allocator);
        self.output_records.deinit(self.allocator);
        self.events.deinit(self.allocator);
        self.inbox.deinit();
        self.allocator.destroy(self.inbox);
        self.lib.disconnect(self.display);
        self.lib.close();
        self.allocator.destroy(self.lib);
        self.* = undefined;
    }

    /// Returns the next queued event, or null when empty. FIFO order.
    pub fn poll_event(self: *Window) ?Event {
        if (self.event_head >= self.events.items.len) return null;
        const event = self.events.items[self.event_head];
        self.event_head += 1;
        if (self.event_head == self.events.items.len) {
            self.events.clearRetainingCapacity();
            self.event_head = 0;
        }
        return event;
    }

    /// Writes queued requests, reads the socket (blocking when `wait`), dispatches
    /// server events and queues typed `Event`s.
    pub fn dispatch(self: *Window, wait: bool) Error!void {
        try self.pump(wait);
    }

    /// Returns after every request sent before this call has been answered and
    /// the resulting events are queued.
    pub fn roundtrip(self: *Window) Error!void {
        try self.flush();
        try self.lib.roundtrip(self.display);
        try self.drain();
    }

    /// Logical size from the last configure (or the requested size).
    pub fn logical_size(self: *const Window) Size {
        return self.logical;
    }

    /// Pixel size `present` requires. Re-query after `scale_changed`.
    pub fn buffer_size(self: *const Window) Size {
        if (self.viewport != null and self.fractional != null) {
            return .{
                .width = scale_up(self.logical.width, self.scale_120),
                .height = scale_up(self.logical.height, self.scale_120),
            };
        }
        const factor: u31 = @intCast(self.buffer_scale);
        return .{ .width = self.logical.width * factor, .height = self.logical.height * factor };
    }

    /// Current xdg state bits from the last acknowledged configure.
    pub fn window_state(self: *const Window) State {
        return self.state;
    }

    /// Asks the compositor to set or clear maximized. The effective state
    /// arrives in a later configure event.
    pub fn set_maximized(self: *Window, maximized: bool) Error!void {
        const toplevel = self.toplevel orelse return error.NotConfigured;
        if (maximized) {
            protocol.XdgToplevel.set_maximized(self.lib, toplevel);
        } else {
            protocol.XdgToplevel.unset_maximized(self.lib, toplevel);
        }
        try self.flush();
    }

    /// Asks for fullscreen on `output` (null lets the compositor choose).
    pub fn set_fullscreen(self: *Window, fullscreen: bool, output: ?Proxy) Error!void {
        const toplevel = self.toplevel orelse return error.NotConfigured;
        if (fullscreen) {
            protocol.XdgToplevel.set_fullscreen(self.lib, toplevel, output);
        } else {
            protocol.XdgToplevel.unset_fullscreen(self.lib, toplevel);
        }
        try self.flush();
    }

    pub fn set_title(self: *Window, title: []const u8) Error!void {
        const toplevel = self.toplevel orelse return error.NotConfigured;
        const copy = try self.allocator.dupeSentinel(u8, title, 0);
        defer self.allocator.free(copy);
        protocol.XdgToplevel.set_title(self.lib, toplevel, copy);
        try self.flush();
    }

    /// Copies `raster` into the next free shared-memory buffer and commits it.
    /// `raster` must have exactly `buffer_size()` pixels; it is converted to
    /// XRGB8888 during the copy. Requires an acknowledged configure.
    pub fn present(self: *Window, raster: surface.View) Error!void {
        if (!self.configured) return error.NotConfigured;
        const wanted = self.buffer_size();
        if (raster.width != wanted.width or raster.height != wanted.height) return error.SizeMismatch;
        try self.ensure_buffers(wanted);

        const index = for (&self.buffers, 0..) |*buffer, i| {
            if (!buffer.busy) break i;
        } else return error.NoFreeBuffer;
        const buffer = &self.buffers[index];
        const memory = buffer.memory orelse return error.ShmFailed;
        const stride = @as(usize, wanted.width) * 4;
        // wl_shm XRGB8888 is little-endian B,G,R,X bytes, which is pixels' `.bgra8` layout.
        const destination = try surface.View.init(memory, wanted.width, wanted.height, stride, .bgra8, null);
        _ = try destination.blit(self.allocator, raster, .{});

        const surface_proxy = self.surface orelse return error.NotConfigured;
        if (self.viewport) |viewport| {
            protocol.WpViewport.set_destination(self.lib, viewport, self.logical.width, self.logical.height);
        } else {
            protocol.Surface.set_buffer_scale(self.lib, surface_proxy, self.buffer_scale);
        }
        protocol.Surface.attach(self.lib, surface_proxy, buffer.wl_buffer, 0, 0);
        protocol.Surface.damage_buffer(self.lib, surface_proxy, 0, 0, @intCast(wanted.width), @intCast(wanted.height));
        buffer.busy = true;
        if (self.frame_callback == null) {
            const callback = try protocol.Surface.frame(self.lib, surface_proxy);
            self.frame_callback = callback;
            try self.lib.listen(callback, &binding.callback_listener, self.inbox);
        }
        protocol.Surface.commit(self.lib, surface_proxy);
        try self.flush();
    }

    // ---- cursors ----

    /// Shows `new_cursor` over the window. System shapes use wp_cursor_shape_v1
    /// when offered, otherwise the XCursor theme. Takes effect immediately when
    /// the pointer is over the window, and on the next pointer enter otherwise.
    pub fn set_cursor(self: *Window, new_cursor: Cursor) Error!void {
        self.cursor = new_cursor;
        self.theme_cursor = null;
        try self.apply_cursor();
        try self.flush();
    }

    /// Advances an animated theme cursor to the frame showing at `time_ms`.
    /// Returns the milliseconds until the next frame (0 for a static cursor);
    /// call it from the owner's loop, passing a monotonic millisecond clock.
    pub fn update_cursor_animation(self: *Window, time_ms: u32) Error!u32 {
        const theme_cursor = self.theme_cursor orelse return 0;
        if (!self.pointer_focused or theme_cursor.frame_count() < 2) return 0;
        const lib = &self.cursor_lib.?;
        const frame = lib.frame_at(theme_cursor, time_ms);
        _ = try self.show_theme_frame(frame.index);
        try self.flush();
        return frame.duration_ms;
    }

    /// Creates a cursor image from `raster`, which is copied. `hot_x`/`hot_y` are
    /// the hotspot in surface units; `scale` is device pixels per surface unit
    /// (the raster width and height must be multiples of it). Release it with
    /// `release_custom_cursor`.
    pub fn create_custom_cursor(self: *Window, raster: surface.View, hot_x: u31, hot_y: u31, scale: u31) Error!CustomCursor {
        if (scale == 0) return error.SizeMismatch;
        const shm_proxy = self.shm orelse return error.MissingGlobal;
        var buffer = try shm.Buffer.create(self.lib, shm_proxy, self.inbox, raster.width, raster.height);
        errdefer buffer.release(self.lib);
        const stride = @as(usize, raster.width) * 4;
        const destination = try surface.View.init(buffer.memory.?, raster.width, raster.height, stride, .bgra8, null);
        _ = try destination.blit(self.allocator, raster, .{});
        return .{ .buffer = buffer, .hot_x = hot_x, .hot_y = hot_y, .scale = scale };
    }

    /// Frees a custom cursor's buffer. If it is the current cursor, the window
    /// falls back to the default system cursor.
    pub fn release_custom_cursor(self: *Window, custom: *CustomCursor) Error!void {
        switch (self.cursor) {
            .custom => |current| if (current == custom) {
                self.cursor = .{ .system = .default };
                try self.apply_cursor();
                try self.flush();
            },
            else => {},
        }
        custom.buffer.release(self.lib);
    }

    // ---- relative mouse and pointer lock ----

    /// Enables or disables relative mouse mode: the pointer is locked in place and
    /// its motion arrives as `pointer_relative_motion`. Needs the pointer and the
    /// relative-pointer and pointer-constraints globals. `pointer_lock` reports the
    /// lock when the compositor applies it.
    pub fn set_relative_mouse_mode(self: *Window, enabled: bool) Error!void {
        if (enabled == self.relative_mode) return;
        if (!enabled) {
            if (self.relative_pointer) |relative| {
                protocol.ZwpRelativePointerV1.destroy(self.lib, relative);
                self.lib.destroy(relative);
                self.relative_pointer = null;
            }
            if (self.locked_pointer) |locked| {
                protocol.ZwpLockedPointerV1.destroy(self.lib, locked);
                self.lib.destroy(locked);
                self.locked_pointer = null;
            }
            self.relative_mode = false;
            try self.push(.{ .pointer_lock = false });
            try self.flush();
            return;
        }
        const pointer = self.pointer orelse return error.Unsupported;
        const relative_manager = self.relative_manager orelse return error.Unsupported;
        const constraints = self.constraints orelse return error.Unsupported;
        const relative = try protocol.ZwpRelativePointerManagerV1.get_relative_pointer(self.lib, relative_manager, pointer);
        self.relative_pointer = relative;
        try self.lib.listen(relative, &binding.relative_pointer_listener, self.inbox);
        const locked = try protocol.ZwpPointerConstraintsV1.lock_pointer(self.lib, constraints, self.surface.?, pointer, null, .persistent);
        self.locked_pointer = locked;
        try self.lib.listen(locked, &binding.locked_pointer_listener, self.inbox);
        self.relative_mode = true;
        try self.flush();
    }

    // ---- clipboard and primary selection ----

    /// Offers `entries` as the clipboard (or primary selection) with the last
    /// keyboard serial; the compositor requests the data when another client
    /// pastes. Entries are copied. Requires keyboard focus and the data-device
    /// (or primary-selection) globals.
    pub fn set_selection(self: *Window, which: Selection, entries: []const SelectionEntry) Error!void {
        const serial = self.keyboard_serial;
        if (serial == 0) return error.NoSerial;
        const primary = which == .primary;
        const device = (if (primary) self.primary_device else self.data_device) orelse return error.Unsupported;
        const source_proxy = if (primary) blk: {
            const manager = self.primary_manager orelse return error.Unsupported;
            const created = try protocol.ZwpPrimarySelectionDeviceManagerV1.create_source(self.lib, manager);
            try self.lib.listen(created, &binding.primary_source_listener, self.inbox);
            break :blk created;
        } else blk: {
            const manager = self.data_device_manager orelse return error.Unsupported;
            const created = try protocol.DataDeviceManager.create_data_source(self.lib, manager);
            try self.lib.listen(created, &binding.data_source_listener, self.inbox);
            break :blk created;
        };
        var source = try clipboard.Source.create(self.allocator, source_proxy, primary, entries);
        errdefer source.deinit(self.allocator);
        for (source.entries) |entry| {
            const mime = try self.allocator.dupeSentinel(u8, entry.mime, 0);
            defer self.allocator.free(mime);
            if (primary) {
                protocol.ZwpPrimarySelectionSourceV1.offer(self.lib, source_proxy, mime);
            } else {
                protocol.DataSource.offer(self.lib, source_proxy, mime);
            }
        }
        if (primary) {
            protocol.ZwpPrimarySelectionDeviceV1.set_selection(self.lib, device, source_proxy, serial);
        } else {
            protocol.DataDevice.set_selection(self.lib, device, source_proxy, serial);
        }
        self.retire_source(which);
        if (primary) {
            self.primary_source = source;
        } else {
            self.clipboard_source = source;
        }
        try self.flush();
    }

    /// Clears the clipboard or primary selection this client owns.
    pub fn clear_selection(self: *Window, which: Selection) Error!void {
        const serial = self.keyboard_serial;
        if (serial == 0) return error.NoSerial;
        const primary = which == .primary;
        const device = (if (primary) self.primary_device else self.data_device) orelse return error.Unsupported;
        if (primary) {
            protocol.ZwpPrimarySelectionDeviceV1.set_selection(self.lib, device, null, serial);
        } else {
            protocol.DataDevice.set_selection(self.lib, device, null, serial);
        }
        self.retire_source(which);
        try self.flush();
    }

    /// MIME types of the current offer for `which`. Borrowed until that offer is
    /// replaced (a later `selection_changed`) or the window is deinitialized.
    pub fn selection_mime_types(self: *const Window, which: Selection) []const []u8 {
        const current = if (which == .primary) self.primary_offer else self.clipboard_offer;
        const target = current orelse return &.{};
        for (self.offers.items) |offer| {
            if (offer.proxy == target) return offer.mimes.items;
        }
        return &.{};
    }

    /// Starts reading the current offer for `which` as `mime`. The returned pipe is
    /// non-blocking: poll its fd and call `Pipe.read` until `end_of_stream`, then
    /// `close` it.
    pub fn receive_selection(self: *Window, which: Selection, mime: []const u8) Error!Pipe {
        const primary = which == .primary;
        const offer = (if (primary) self.primary_offer else self.clipboard_offer) orelse return error.NoSelection;
        return self.receive_offer(offer, primary, mime);
    }

    /// Requests `mime` from `offer` through a pipe (shared by selections and drags).
    fn receive_offer(self: *Window, offer: Proxy, primary: bool, mime: []const u8) Error!Pipe {
        const mime_z = try self.allocator.dupeSentinel(u8, mime, 0);
        defer self.allocator.free(mime_z);
        const fds = try clipboard.make_pipe();
        errdefer _ = linux.close(fds[0]);
        errdefer _ = linux.close(fds[1]);
        if (primary) {
            protocol.ZwpPrimarySelectionOfferV1.receive(self.lib, offer, mime_z, fds[1]);
        } else {
            protocol.DataOffer.receive(self.lib, offer, mime_z, fds[1]);
        }
        try clipboard.set_nonblocking(fds[0]);
        // libwayland sends the descriptor with the next flush, so flush before the
        // local write end is closed. Nothing after the close can fail.
        try self.flush();
        _ = linux.close(fds[1]);
        return .{ .fd = fds[0] };
    }

    // ---- text input ----

    /// Enables text input for the focused surface (composition events follow).
    pub fn start_text_input(self: *Window) Error!void {
        const input = self.text_input orelse return error.Unsupported;
        protocol.ZwpTextInputV3.enable(self.lib, input);
        self.text_enabled = true;
        self.send_content_type(input);
        protocol.ZwpTextInputV3.commit(self.lib, input);
        try self.flush();
    }

    /// Disables text input.
    pub fn stop_text_input(self: *Window) Error!void {
        const input = self.text_input orelse return error.Unsupported;
        protocol.ZwpTextInputV3.disable(self.lib, input);
        self.text_enabled = false;
        protocol.ZwpTextInputV3.commit(self.lib, input);
        try self.flush();
    }

    /// Describes the kind of text the focused field takes (purpose and hints, see
    /// `text_input.wire`). Applied immediately while input is enabled, and on the
    /// next `start_text_input` otherwise.
    pub fn set_content_type(self: *Window, content: ContentType) Error!void {
        self.content_type = content;
        const input = self.text_input orelse return error.Unsupported;
        if (!self.text_enabled) return;
        self.send_content_type(input);
        protocol.ZwpTextInputV3.commit(self.lib, input);
        try self.flush();
    }

    /// Sends the text around the caret to the input method. `caret` and `anchor`
    /// are byte offsets into `text` (equal when nothing is selected). The text is
    /// copied and limited to 4 KiB by the protocol.
    pub fn set_surrounding_text(self: *Window, text: []const u8, caret: u32, anchor: u32) Error!void {
        const input = self.text_input orelse return error.Unsupported;
        if (text.len > max_surrounding_bytes) return error.TooLarge;
        if (caret > text.len or anchor > text.len) return error.InvalidOffset;
        const copy = try self.allocator.dupeSentinel(u8, text, 0);
        defer self.allocator.free(copy);
        protocol.ZwpTextInputV3.set_surrounding_text(self.lib, input, copy, @intCast(caret), @intCast(anchor));
        protocol.ZwpTextInputV3.commit(self.lib, input);
        try self.flush();
    }

    fn send_content_type(self: *Window, input: Proxy) void {
        const wire = text_input.wire(self.content_type);
        protocol.ZwpTextInputV3.set_content_type(self.lib, input, wire.hint, wire.purpose);
    }

    /// Tells the input method where the caret is, in surface coordinates.
    pub fn set_text_input_area(self: *Window, area: TextArea) Error!void {
        const input = self.text_input orelse return error.Unsupported;
        protocol.ZwpTextInputV3.set_cursor_rectangle(self.lib, input, area.x, area.y, area.width, area.height);
        protocol.ZwpTextInputV3.commit(self.lib, input);
        try self.flush();
    }

    // ---- activation ----

    /// Asks the compositor to focus the window, using the most recent input serial
    /// as proof of user intent. The request completes asynchronously through the
    /// xdg-activation token exchange.
    pub fn request_focus(self: *Window) Error!void {
        const activation = self.activation orelse return error.Unsupported;
        const seat = self.seat orelse return error.Unsupported;
        if (self.input_serial == 0) return error.NoSerial;
        const token = try protocol.XdgActivationV1.get_activation_token(self.lib, activation);
        try self.lib.listen(token, &binding.activation_token_listener, self.inbox);
        protocol.XdgActivationTokenV1.set_serial(self.lib, token, self.input_serial, seat);
        if (self.app_id) |app_id| protocol.XdgActivationTokenV1.set_app_id(self.lib, token, app_id);
        protocol.XdgActivationTokenV1.set_surface(self.lib, token, self.surface.?);
        protocol.XdgActivationTokenV1.commit(self.lib, token);
        try self.flush();
    }

    // ---- window state, geometry and placement ----

    /// Minimizes the toplevel. xdg-shell has no unminimize request; the window
    /// comes back through the compositor (taskbar or activation).
    pub fn set_minimized(self: *Window) Error!void {
        const toplevel = self.toplevel orelse return error.NotConfigured;
        protocol.XdgToplevel.set_minimized(self.lib, toplevel);
        try self.flush();
    }

    /// Sets the minimum size in logical units; zero in a dimension means no limit.
    /// Applied at the next surface commit, which this method performs.
    pub fn set_min_size(self: *Window, size: Size) Error!void {
        const toplevel = self.toplevel orelse return error.NotConfigured;
        protocol.XdgToplevel.set_min_size(self.lib, toplevel, size.width, size.height);
        try self.commit();
    }

    /// Sets the maximum size in logical units; zero in a dimension means no limit.
    /// Applied at the next surface commit, which this method performs.
    pub fn set_max_size(self: *Window, size: Size) Error!void {
        const toplevel = self.toplevel orelse return error.NotConfigured;
        protocol.XdgToplevel.set_max_size(self.lib, toplevel, size.width, size.height);
        try self.commit();
    }

    /// Declares the window geometry: the rectangle of the surface that is the
    /// window itself, excluding shadows and invisible borders, in logical units.
    /// Without it the compositor uses the whole surface.
    pub fn set_window_geometry(self: *Window, x: i32, y: i32, width: u31, height: u31) Error!void {
        const xdg = self.xdg_surface orelse return error.NotConfigured;
        if (width == 0 or height == 0) return error.SizeMismatch;
        protocol.XdgSurface.set_window_geometry(self.lib, xdg, x, y, width, height);
        try self.commit();
    }

    /// Makes this window a transient child of `parent` (xdg_toplevel.set_parent);
    /// null makes it independent again.
    pub fn set_parent(self: *Window, parent: ?*const Window) Error!void {
        const toplevel = self.toplevel orelse return error.NotConfigured;
        const parent_proxy: ?Proxy = if (parent) |window| window.toplevel orelse return error.NotConfigured else null;
        protocol.XdgToplevel.set_parent(self.lib, toplevel, parent_proxy);
        try self.commit();
    }

    /// Decoration mode the compositor last reported; null before the first report
    /// or when zxdg_decoration_manager_v1 is not offered.
    pub fn decoration_mode(self: *const Window) ?DecorationMode {
        return self.decoration_mode_state;
    }

    /// Requests server-side or client-side decorations. The mode in effect arrives
    /// as a later configure and is then reported by `decoration_mode`.
    pub fn set_decoration_mode(self: *Window, mode: DecorationMode) Error!void {
        const decoration = self.decoration orelse return error.Unsupported;
        const wire: protocol.ZxdgToplevelDecorationV1.Mode = switch (mode) {
            .client_side => .client_side,
            .server_side => .server_side,
        };
        protocol.ZxdgToplevelDecorationV1.set_mode(self.lib, decoration, wire);
        try self.flush();
    }

    /// Whether the window is mapped (not hidden).
    pub fn visible(self: *const Window) bool {
        return self.mapped;
    }

    /// Unmaps the window: attaches a null buffer and commits, which is how
    /// xdg-shell hides a surface. The wl_buffers are released (so `show` starts
    /// with fresh ones) and pending frame callbacks are dropped.
    pub fn hide(self: *Window) Error!void {
        if (!self.mapped) return;
        const surface_proxy = self.surface orelse return error.NotConfigured;
        protocol.Surface.attach(self.lib, surface_proxy, null, 0, 0);
        protocol.Surface.commit(self.lib, surface_proxy);
        if (self.frame_callback) |callback| {
            self.lib.destroy(callback);
            self.frame_callback = null;
        }
        for (&self.buffers) |*buffer| buffer.release(self.lib);
        self.mapped = false;
        self.configured = false;
        try self.flush();
    }

    /// Maps a hidden window again. An unmapped xdg surface gets a new configure
    /// before its next buffer, so this blocks until that configure is acknowledged.
    /// The owner presents a frame afterwards.
    pub fn show(self: *Window) Error!void {
        if (self.mapped) return;
        const surface_proxy = self.surface orelse return error.NotConfigured;
        self.configured = false;
        protocol.Surface.commit(self.lib, surface_proxy);
        try self.flush();
        while (!self.configured) try self.pump(true);
        self.mapped = true;
    }

    /// Moves the pointer to a surface-local position. Uses wp_pointer_warp_v1 when
    /// the compositor offers it (needs the pointer and a recent pointer serial).
    /// Otherwise, as SDL does, it creates a one-shot pointer lock on the surface,
    /// sets its cursor position hint, commits and destroys the lock. While relative
    /// mouse mode holds the lock, the hint goes to that lock instead (a second
    /// lock on the same pointer is a protocol error). The compositor may ignore
    /// either request.
    pub fn warp_pointer(self: *Window, x: f64, y: f64) Error!void {
        const surface_proxy = self.surface orelse return error.NotConfigured;
        const pointer = self.pointer orelse return error.Unsupported;
        // Warping outside the surface is a protocol error, so clamp to its logical extent.
        const px = std.math.clamp(x, 0, @as(f64, @floatFromInt(self.logical.width)));
        const py = std.math.clamp(y, 0, @as(f64, @floatFromInt(self.logical.height)));
        if (self.pointer_warp) |manager| {
            if (self.pointer_serial == 0) return error.NoSerial;
            protocol.WpPointerWarpV1.warp_pointer(self.lib, manager, surface_proxy, pointer, px, py, self.pointer_serial);
        } else if (self.locked_pointer) |locked| {
            protocol.ZwpLockedPointerV1.set_cursor_position_hint(self.lib, locked, px, py);
        } else {
            const constraints = self.constraints orelse return error.Unsupported;
            const lock = try protocol.ZwpPointerConstraintsV1.lock_pointer(self.lib, constraints, surface_proxy, pointer, null, .oneshot);
            protocol.ZwpLockedPointerV1.set_cursor_position_hint(self.lib, lock, px, py);
            protocol.Surface.commit(self.lib, surface_proxy);
            protocol.ZwpLockedPointerV1.destroy(self.lib, lock);
            self.lib.destroy(lock);
        }
        try self.flush();
    }

    // ---- outputs ----

    /// Snapshot of every known output, in the order they were announced. The
    /// caller owns the result; release it with `free_outputs`.
    pub fn outputs(self: *const Window, allocator: Allocator) Error![]OutputInfo {
        const list = try allocator.alloc(OutputInfo, self.output_records.items.len);
        var built: usize = 0;
        errdefer {
            for (list[0..built]) |info| allocator.free(info.modes);
            allocator.free(list);
        }
        for (self.output_records.items, 0..) |output, i| {
            list[i] = try output_info(allocator, output);
            built = i + 1;
        }
        return list;
    }

    /// Frees a list returned by `outputs`.
    pub fn free_outputs(allocator: Allocator, list: []OutputInfo) void {
        for (list) |info| allocator.free(info.modes);
        allocator.free(list);
    }

    // ---- popups ----

    /// Creates a popup positioned against this window's toplevel and returns its id.
    /// The popup is unmapped until the compositor configures it (`popup_configure`);
    /// then `present_popup` shows a frame. `grab` takes an explicit grab with the
    /// last input serial and needs the seat (`error.NoSerial` otherwise).
    pub fn open_popup(self: *Window, options: PopupOptions) Error!PopupId {
        const wm_base = self.wm_base orelse return error.MissingGlobal;
        const compositor = self.compositor orelse return error.MissingGlobal;
        const parent = self.xdg_surface orelse return error.NotConfigured;
        if (options.size.width == 0 or options.size.height == 0) return error.SizeMismatch;
        if (options.grab and (self.seat == null or self.input_serial == 0)) return error.NoSerial;
        const lib = self.lib;

        const positioner = try protocol.XdgWmBase.create_positioner(lib, wm_base);
        defer {
            protocol.XdgPositioner.destroy(lib, positioner);
            lib.destroy(positioner);
        }
        configure_positioner(lib, positioner, options, self.wm_base_version >= 3);

        const surface_proxy = try protocol.Compositor.create_surface(lib, compositor);
        errdefer {
            protocol.Surface.destroy(lib, surface_proxy);
            lib.destroy(surface_proxy);
        }
        var viewport: ?Proxy = null;
        if (self.viewporter) |manager| viewport = try protocol.WpViewporter.get_viewport(lib, manager, surface_proxy);
        errdefer if (viewport) |object| {
            protocol.WpViewport.destroy(lib, object);
            lib.destroy(object);
        };
        var fractional: ?Proxy = null;
        errdefer if (fractional) |object| {
            protocol.WpFractionalScaleV1.destroy(lib, object);
            lib.destroy(object);
        };
        if (self.fractional_manager) |manager| {
            fractional = try protocol.WpFractionalScaleManagerV1.get_fractional_scale(lib, manager, surface_proxy);
            try lib.listen(fractional.?, &binding.fractional_listener, self.inbox);
        }
        const xdg = try protocol.XdgWmBase.get_xdg_surface(lib, wm_base, surface_proxy);
        errdefer {
            protocol.XdgSurface.destroy(lib, xdg);
            lib.destroy(xdg);
        }
        try lib.listen(xdg, &binding.xdg_surface_listener, self.inbox);
        const popup_proxy = try protocol.XdgSurface.get_popup(lib, xdg, parent, positioner);
        errdefer {
            protocol.XdgPopup.destroy(lib, popup_proxy);
            lib.destroy(popup_proxy);
        }
        try lib.listen(popup_proxy, &binding.popup_listener, self.inbox);
        if (options.grab) protocol.XdgPopup.grab(lib, popup_proxy, self.seat.?, self.input_serial);

        const id = self.next_popup_id;
        try self.popups.append(self.allocator, .{
            .id = id,
            .surface = surface_proxy,
            .xdg_surface = xdg,
            .xdg_popup = popup_proxy,
            .size = options.size,
            .viewport = viewport,
            .fractional = fractional,
        });
        self.next_popup_id +%= 1;
        // An empty commit asks the compositor for the popup's first configure.
        protocol.Surface.commit(lib, surface_proxy);
        try self.flush();
        return id;
    }

    /// Repositions an open popup (xdg_popup.reposition, xdg-shell v3). The new
    /// placement arrives as `popup_repositioned` and then `popup_configure`.
    pub fn reposition_popup(self: *Window, id: PopupId, options: PopupOptions) Error!void {
        const index = self.popup_index(id) orelse return error.UnknownPopup;
        if (self.wm_base_version < 3) return error.Unsupported;
        const wm_base = self.wm_base orelse return error.MissingGlobal;
        const lib = self.lib;
        const positioner = try protocol.XdgWmBase.create_positioner(lib, wm_base);
        defer {
            protocol.XdgPositioner.destroy(lib, positioner);
            lib.destroy(positioner);
        }
        configure_positioner(lib, positioner, options, true);
        const token = self.next_reposition_token;
        self.next_reposition_token +%= 1;
        protocol.XdgPopup.reposition(lib, self.popups.items[index].xdg_popup, positioner, token);
        try self.flush();
    }

    /// Copies `raster` into a popup buffer and commits it. `raster` must match
    /// `popup_buffer_size(id)`. Requires a configure (`error.NotMapped` before it).
    /// Buffers are reused on wl_buffer.release, not on frame callbacks; the callback
    /// is only reported as `popup_frame_done`.
    pub fn present_popup(self: *Window, id: PopupId, raster: surface.View) Error!void {
        const index = self.popup_index(id) orelse return error.UnknownPopup;
        const popup = &self.popups.items[index];
        if (!popup.configured) return error.NotMapped;
        const wanted = self.popup_pixels(popup);
        if (raster.width != wanted.width or raster.height != wanted.height) return error.SizeMismatch;

        const first = popup.buffers[0];
        if (first.memory == null or first.width != wanted.width or first.height != wanted.height) {
            const shm_proxy = self.shm orelse return error.MissingGlobal;
            for (&popup.buffers) |*buffer| buffer.release(self.lib);
            for (&popup.buffers) |*buffer| buffer.* = try shm.Buffer.create(self.lib, shm_proxy, self.inbox, wanted.width, wanted.height);
        }
        const free_index = for (&popup.buffers, 0..) |*buffer, i| {
            if (!buffer.busy) break i;
        } else return error.NoFreeBuffer;
        const buffer = &popup.buffers[free_index];
        const memory = buffer.memory orelse return error.ShmFailed;
        const destination = try surface.View.init(memory, wanted.width, wanted.height, @as(usize, wanted.width) * 4, .bgra8, null);
        _ = try destination.blit(self.allocator, raster, .{});

        if (popup.viewport) |viewport| {
            protocol.WpViewport.set_destination(self.lib, viewport, popup.size.width, popup.size.height);
        } else {
            protocol.Surface.set_buffer_scale(self.lib, popup.surface, self.buffer_scale);
        }
        protocol.Surface.attach(self.lib, popup.surface, buffer.wl_buffer, 0, 0);
        protocol.Surface.damage_buffer(self.lib, popup.surface, 0, 0, @intCast(wanted.width), @intCast(wanted.height));
        buffer.busy = true;
        if (popup.frame_callback == null) {
            const callback = try protocol.Surface.frame(self.lib, popup.surface);
            popup.frame_callback = callback;
            try self.lib.listen(callback, &binding.callback_listener, self.inbox);
        }
        protocol.Surface.commit(self.lib, popup.surface);
        try self.flush();
    }

    /// Pixel size `present_popup` requires for popup `id`, or null for an unknown
    /// id: the logical size times the popup's preferred fractional scale when it has
    /// a viewport and fractional scale, else times the window's integer buffer scale.
    /// Re-query after `popup_scale_changed`.
    pub fn popup_buffer_size(self: *const Window, id: PopupId) ?Size {
        const index = self.popup_index(id) orelse return null;
        return self.popup_pixels(&self.popups.items[index]);
    }

    /// Destroys a popup and its buffers. The id is invalid afterwards.
    pub fn close_popup(self: *Window, id: PopupId) Error!void {
        const index = self.popup_index(id) orelse return error.UnknownPopup;
        var popup = self.popups.orderedRemove(index);
        release_popup(self.lib, &popup);
        try self.flush();
    }

    /// Logical size of an open popup, or null for an unknown id.
    pub fn popup_size(self: *const Window, id: PopupId) ?Size {
        for (self.popups.items) |popup| {
            if (popup.id == id) return popup.size;
        }
        return null;
    }

    // ---- drag and drop (receiving) ----

    /// MIME types offered by the current drag, borrowed until the drag ends.
    pub fn drag_mime_types(self: *const Window) []const []u8 {
        const offer = self.drag_offer orelse return &.{};
        return self.offer_mimes(offer);
    }

    /// Accepts the drag for the MIME type `mime`, or rejects it with null, using the
    /// serial of the last drag enter. Call it from the enter or motion handler.
    /// Accepting selects the copy action.
    pub fn accept_drag(self: *Window, mime: ?[]const u8) Error!void {
        const offer = self.drag_offer orelse return error.NoDrag;
        const wire_actions: u32 = if (mime != null) dnd_action_copy else 0;
        if (self.data_device_version >= 3) protocol.DataOffer.set_actions(self.lib, offer, wire_actions, wire_actions);
        if (mime) |text| {
            const text_z = try self.allocator.dupeSentinel(u8, text, 0);
            defer self.allocator.free(text_z);
            protocol.DataOffer.accept(self.lib, offer, self.drag_serial, text_z);
        } else {
            protocol.DataOffer.accept(self.lib, offer, self.drag_serial, null);
        }
        try self.flush();
    }

    /// Starts reading the drag's data as `mime`. Valid during the drag and after a
    /// drop, until `finish_drag`. The pipe works as in `receive_selection`.
    pub fn drag_receive(self: *Window, mime: []const u8) Error!Pipe {
        const offer = self.drag_offer orelse return error.NoDrag;
        return self.receive_offer(offer, false, mime);
    }

    /// Ends the drag: after a drop it sends wl_data_offer.finish, then destroys the
    /// offer, so its data can no longer be received.
    pub fn finish_drag(self: *Window) Error!void {
        const offer = self.drag_offer orelse return error.NoDrag;
        if (self.drag_dropped) protocol.DataOffer.finish(self.lib, offer);
        self.drop_drag_offer();
        try self.flush();
    }

    // ---- drag and drop (sending) ----

    /// Starts a drag from this window that offers `entries` (copied). Each MIME
    /// type's bytes are written when a target asks for it. The drag starts with the
    /// most recent input serial, so call this from a pointer or touch press. Its end
    /// is reported as `drag_source_ended`. Requires the data-device manager and a
    /// seat with a data device.
    pub fn start_drag(self: *Window, entries: []const SelectionEntry) Error!void {
        if (self.drag_source != null) return error.DragInProgress;
        if (entries.len == 0) return error.NoData;
        if (self.input_serial == 0) return error.NoSerial;
        const device = self.data_device orelse return error.Unsupported;
        const manager = self.data_device_manager orelse return error.Unsupported;
        const origin = self.surface orelse return error.NotConfigured;
        const lib = self.lib;

        const source_proxy = try protocol.DataDeviceManager.create_data_source(lib, manager);
        errdefer {
            protocol.DataSource.destroy(lib, source_proxy);
            lib.destroy(source_proxy);
        }
        try lib.listen(source_proxy, &binding.data_source_listener, self.inbox);
        var source = try clipboard.Source.create(self.allocator, source_proxy, false, entries);
        errdefer source.deinit(self.allocator);
        for (source.entries) |entry| {
            const mime = try self.allocator.dupeSentinel(u8, entry.mime, 0);
            defer self.allocator.free(mime);
            protocol.DataSource.offer(lib, source_proxy, mime);
        }
        if (self.data_device_version >= 3) protocol.DataSource.set_actions(lib, source_proxy, dnd_action_copy);
        protocol.DataDevice.start_drag(lib, device, source_proxy, origin, null, self.input_serial);
        self.drag_source = source;
        self.drag_source_dropped = false;
        try self.flush();
    }

    /// Whether `proxy` is the source of the drag started by `start_drag`.
    fn is_drag_source(self: *const Window, proxy: ?Proxy) bool {
        const target = proxy orelse return false;
        const source = self.drag_source orelse return false;
        return source.proxy == target;
    }

    /// Writes the drag source's bytes for `mime` to `fd` (consumes `mime`, always closes `fd`).
    fn serve_drag(self: *Window, mime: []u8, fd: i32) void {
        defer self.allocator.free(mime);
        const source = if (self.drag_source) |*owned| owned else {
            _ = linux.close(fd);
            return;
        };
        const data = source.find(mime) orelse {
            _ = linux.close(fd);
            return;
        };
        clipboard.write_all(fd, data) catch {};
    }

    /// Releases the drag source and reports the end of the drag.
    fn end_drag_source(self: *Window) Error!void {
        const dropped = self.drag_source_dropped;
        if (self.drag_source) |*source| {
            protocol.DataSource.destroy(self.lib, source.proxy);
            self.lib.destroy(source.proxy);
            source.deinit(self.allocator);
            self.drag_source = null;
        }
        self.drag_source_dropped = false;
        try self.push(.{ .drag_source_ended = .{ .dropped = dropped } });
    }

    fn commit(self: *Window) Error!void {
        const surface_proxy = self.surface orelse return error.NotConfigured;
        protocol.Surface.commit(self.lib, surface_proxy);
        try self.flush();
    }

    fn flush(self: *Window) Error!void {
        try self.lib.flush(self.display);
    }

    fn pump(self: *Window, wait: bool) Error!void {
        if (!self.events_pending()) self.reclaim_texts();
        try self.flush();
        const ready = try self.wait_readable(wait);
        try self.lib.read(self.display, ready);
        try self.lib.dispatch_pending(self.display);
        try self.drain();
        try self.flush();
    }

    fn events_pending(self: *const Window) bool {
        return self.event_head < self.events.items.len;
    }

    /// Frees the owned strings behind queued text events. Only called when no
    /// event that could reference them remains unpolled.
    fn reclaim_texts(self: *Window) void {
        for (self.texts.items) |text| self.allocator.free(text);
        self.texts.clearRetainingCapacity();
    }

    /// Polls the display socket: blocks when `wait`, otherwise checks once.
    fn wait_readable(self: *Window, wait: bool) Error!bool {
        var poll_fd = [1]linux.pollfd{.{ .fd = self.lib.fd(self.display), .events = linux.POLL.IN, .revents = 0 }};
        while (true) {
            const rc = linux.poll(&poll_fd, 1, if (wait) -1 else 0);
            switch (linux.errno(rc)) {
                .SUCCESS => return rc > 0 and poll_fd[0].revents & linux.POLL.IN != 0,
                .INTR => continue,
                else => return error.Interrupted,
            }
        }
    }

    fn drain(self: *Window) Error!void {
        while (self.inbox.next()) |raw| try self.handle(raw);
        if (self.inbox.dropped) return error.OutOfMemory;
    }

    fn handle(self: *Window, raw: binding.Raw) Error!void {
        const proxy = raw.proxy;
        switch (raw.event) {
            .registry_global => |global| try self.bind_global(global.name, global.interface.slice(), global.version),
            .registry_global_remove => |name| try self.remove_global(name),
            .callback_done => {
                if (proxy != null and proxy == self.frame_callback) {
                    self.lib.destroy(proxy.?);
                    self.frame_callback = null;
                    try self.push(.frame_done);
                } else if (self.popup_by_frame(proxy)) |index| {
                    const popup = &self.popups.items[index];
                    self.lib.destroy(proxy.?);
                    popup.frame_callback = null;
                    try self.push(.{ .popup_frame_done = popup.id });
                }
            },
            .wm_ping => |serial| protocol.XdgWmBase.pong(self.lib, self.wm_base.?, serial),
            .surface_configure => |serial| if (self.popup_by_xdg(proxy)) |index| {
                try self.apply_popup_configure(index, serial);
            } else {
                try self.apply_configure(serial);
            },
            .toplevel_configure => |configure| {
                var state: State = .{};
                for (configure.states.values[0..configure.states.len]) |value| {
                    switch (value) {
                        1 => state.maximized = true,
                        2 => state.fullscreen = true,
                        3 => state.resizing = true,
                        4 => state.activated = true,
                        5 => state.tiled_left = true,
                        6 => state.tiled_right = true,
                        7 => state.tiled_top = true,
                        8 => state.tiled_bottom = true,
                        9 => state.suspended = true,
                        else => {},
                    }
                }
                self.pending = .{
                    .size = .{ .width = clamp_size(configure.width), .height = clamp_size(configure.height) },
                    .state = state,
                };
            },
            .toplevel_close => try self.push(.close_requested),
            .buffer_release => if (self.find_buffer(proxy)) |buffer| {
                buffer.busy = false;
            },
            .fractional_preferred => |scale| {
                if (proxy != null and proxy == self.fractional) {
                    self.scale_120 = scale;
                    try self.push(.scale_changed);
                } else if (self.popup_by_fractional(proxy)) |index| {
                    self.popups.items[index].scale_120 = scale;
                    try self.push(.{ .popup_scale_changed = self.popups.items[index].id });
                }
            },
            .decoration_configure => |mode| self.decoration_mode_state = switch (mode) {
                1 => .client_side,
                2 => .server_side,
                else => null,
            },
            .output_scale => |factor| {
                if (self.output_index(proxy)) |index| {
                    self.output_records.items[index].scale = factor;
                    self.recompute_buffer_scale();
                    try self.push(.scale_changed);
                }
            },
            .seat_capabilities => |caps| try self.update_capabilities(caps),
            .tablet_tool_added => |tool| try self.pens.append(self.allocator, .{ .proxy = tool }),
            .tablet_tool_type => |value| if (self.tool_index(proxy)) |i| self.pens.items[i].set_type(value),
            .tablet_tool_wacom_id => |value| if (self.tool_index(proxy)) |i| {
                self.pens.items[i].wacom_id = value;
            },
            .tablet_tool_capability => |value| if (self.tool_index(proxy)) |i| self.pens.items[i].add_capability(value),
            .tablet_tool_done => if (self.tool_index(proxy)) |i| try self.announce_pen(i),
            .tablet_tool_removed => if (self.tool_index(proxy)) |i| try self.remove_pen(i),
            .tablet_tool_proximity_in => |enter| if (self.tool_index(proxy)) |i| {
                self.pens.items[i].proximity_in(self.owns_surface(enter.surface));
            },
            .tablet_tool_proximity_out => if (self.tool_index(proxy)) |i| self.pens.items[i].proximity_out(),
            .tablet_tool_down => if (self.tool_index(proxy)) |i| self.pens.items[i].down(),
            .tablet_tool_up => if (self.tool_index(proxy)) |i| self.pens.items[i].up(),
            .tablet_tool_motion => |motion| if (self.tool_index(proxy)) |i| {
                self.pens.items[i].motion(fixed_to_float(motion.x), fixed_to_float(motion.y));
            },
            .tablet_tool_pressure => |value| if (self.tool_index(proxy)) |i| self.pens.items[i].pressure(value),
            .tablet_tool_distance => |value| if (self.tool_index(proxy)) |i| self.pens.items[i].distance(value),
            .tablet_tool_tilt => |tilt| if (self.tool_index(proxy)) |i| {
                self.pens.items[i].tilt(fixed_to_float(tilt.x), fixed_to_float(tilt.y));
            },
            .tablet_tool_rotation => |degrees| if (self.tool_index(proxy)) |i| {
                self.pens.items[i].rotation(fixed_to_float(degrees));
            },
            .tablet_tool_slider => |position| if (self.tool_index(proxy)) |i| self.pens.items[i].slider(position),
            .tablet_tool_button => |button| if (self.tool_index(proxy)) |i| {
                self.pens.items[i].button(button.button, button.pressed);
            },
            .tablet_tool_frame => |time| if (self.tool_index(proxy)) |i| try self.emit_pen_frame(i, time),
            .pointer_enter => |enter| {
                self.pointer_focused = true;
                self.pointer_serial = enter.serial;
                self.input_serial = enter.serial;
                try self.push(.{ .pointer_enter = .{ .x = fixed_to_float(enter.x), .y = fixed_to_float(enter.y) } });
                try self.apply_cursor_on_enter();
            },
            .pointer_leave => |serial| {
                self.pointer_focused = false;
                self.pointer_serial = serial;
                try self.push(.pointer_leave);
            },
            .pointer_motion => |motion| try self.push(.{ .pointer_motion = .{
                .x = fixed_to_float(motion.x),
                .y = fixed_to_float(motion.y),
                .time_ms = motion.time,
            } }),
            .pointer_button => |button| {
                self.pointer_serial = button.serial;
                self.input_serial = button.serial;
                try self.push(.{ .pointer_button = .{
                    .code = button.button,
                    .pressed = button.state == 1,
                    .time_ms = button.time,
                } });
            },
            .pointer_axis => |axis| {
                const index = axis_index(axis.axis) orelse return;
                const frame = &self.axis_frame[index];
                frame.add(.continuous, axis.time, fixed_to_float(axis.value));
                if (!self.pointer_frames) try self.flush_axis(index);
            },
            .pointer_axis_discrete => |axis| {
                const index = axis_index(axis.axis) orelse return;
                self.axis_frame[index].add(.discrete, self.axis_frame[index].time_ms, @floatFromInt(axis.discrete));
                if (!self.pointer_frames) try self.flush_axis(index);
            },
            .pointer_axis_value120 => |axis| {
                const index = axis_index(axis.axis) orelse return;
                self.axis_frame[index].add(.value120, self.axis_frame[index].time_ms, @floatFromInt(axis.value120));
                if (!self.pointer_frames) try self.flush_axis(index);
            },
            .pointer_axis_source => |source| {
                for (&self.axis_frame) |*frame| frame.source = scroll_source(source);
            },
            .pointer_axis_direction => |direction| {
                const index = axis_index(direction.axis) orelse return;
                self.axis_frame[index].inverted = direction.direction == 1;
            },
            .pointer_axis_stop => |stop| {
                const index = axis_index(stop.axis) orelse return;
                self.axis_frame[index].time_ms = stop.time;
            },
            .pointer_frame => try self.flush_axes(),
            .output_geometry => |geometry_event| if (self.output_index(proxy)) |index| {
                const output = &self.output_records.items[index];
                output.geometry_x = geometry_event.x;
                output.geometry_y = geometry_event.y;
                output.physical_width = geometry_event.physical_width;
                output.physical_height = geometry_event.physical_height;
                output.transform = transform_from(geometry_event.transform);
                output.make = geometry_event.make;
                output.model = geometry_event.model;
            },
            .output_mode => |mode| if (self.output_index(proxy)) |index| {
                try self.record_mode(index, mode.flags, mode.width, mode.height, mode.refresh);
            },
            .output_done => if (self.output_index(proxy)) |index| {
                try self.announce_output(index);
            },
            .output_name => |name| if (self.output_index(proxy)) |index| {
                self.output_records.items[index].name = name;
            },
            .output_description => |description| if (self.output_index(proxy)) |index| {
                self.output_records.items[index].description = description;
            },
            .xdg_output_position => |position| if (self.output_for_xdg(proxy)) |index| {
                self.output_records.items[index].logical_position = .{ .x = position.x, .y = position.y };
            },
            .xdg_output_size => |size| if (self.output_for_xdg(proxy)) |index| {
                self.output_records.items[index].logical_size = .{ .width = clamp_size(size.width), .height = clamp_size(size.height) };
            },
            .xdg_output_done => if (self.output_for_xdg(proxy)) |index| {
                const output = &self.output_records.items[index];
                if (output.announced) try self.push(.{ .output_changed = output.global_name });
            },
            .drag_enter => |enter| {
                self.drop_drag_offer();
                self.drag_offer = enter.offer;
                self.drag_serial = enter.serial;
                try self.push(.{ .drag_enter = .{ .x = fixed_to_float(enter.x), .y = fixed_to_float(enter.y), .time_ms = 0 } });
            },
            .drag_motion => |motion| try self.push(.{ .drag_motion = .{
                .x = fixed_to_float(motion.x),
                .y = fixed_to_float(motion.y),
                .time_ms = motion.time,
            } }),
            .drag_leave => {
                if (!self.drag_dropped) self.drop_drag_offer();
                try self.push(.drag_leave);
            },
            .drag_drop => {
                self.drag_dropped = true;
                const kind: DropKind = if (self.drag_offer) |offer| dnd.classify(self.offer_mimes(offer)) else .none;
                try self.push(.{ .drag_drop = kind });
            },
            .popup_configure => |geometry_event| if (self.popup_by_popup(proxy)) |index| {
                self.popups.items[index].pending = .{
                    .id = self.popups.items[index].id,
                    .x = geometry_event.x,
                    .y = geometry_event.y,
                    .size = .{ .width = clamp_size(geometry_event.width), .height = clamp_size(geometry_event.height) },
                };
            },
            .popup_done => if (self.popup_by_popup(proxy)) |index| {
                try self.push(.{ .popup_done = self.popups.items[index].id });
            },
            .popup_repositioned => |token| if (self.popup_by_popup(proxy)) |index| {
                try self.push(.{ .popup_repositioned = .{ .id = self.popups.items[index].id, .token = token } });
            },
            .keyboard_keymap => |map| {
                if (map.format == 1) {
                    self.replace_keymap(map.fd, map.size);
                } else {
                    _ = linux.close(map.fd);
                }
                if (self.keymap) |bytes| {
                    const copy = try self.allocator.dupe(u8, bytes);
                    try self.push(.{ .keyboard_keymap = try self.adopt_text(copy) });
                }
            },
            .keyboard_enter => |serial| {
                self.keyboard_serial = serial;
                self.input_serial = serial;
                self.keyboard_focused = true;
                try self.push(.{ .keyboard_focus = true });
            },
            .keyboard_leave => |serial| {
                self.keyboard_serial = serial;
                self.keyboard_focused = false;
                try self.push(.{ .keyboard_focus = false });
            },
            .keyboard_key => |key| {
                self.keyboard_serial = key.serial;
                self.input_serial = key.serial;
                try self.push(.{ .key = .{
                    .scancode = linux_keys.evdev_scancode(key.key),
                    .evdev_code = key.key,
                    .pressed = key.state == 1,
                    .time_ms = key.time,
                } });
            },
            .keyboard_modifiers => |mods| try self.push(.{ .keyboard_modifiers = .{
                .depressed = mods.depressed,
                .latched = mods.latched,
                .locked = mods.locked,
                .group = mods.group,
            } }),
            .keyboard_repeat => |info| try self.push(.{ .keyboard_repeat = .{ .rate = info.rate, .delay_ms = info.delay } }),
            .touch_down => |touch| {
                self.input_serial = touch.serial;
                self.touch_active +|= 1;
                try self.push(.{ .touch_down = .{ .id = touch.id, .time_ms = touch.time, .x = fixed_to_float(touch.x), .y = fixed_to_float(touch.y) } });
            },
            .touch_up => |touch| {
                self.input_serial = touch.serial;
                self.touch_active -|= 1;
                try self.push(.{ .touch_up = .{ .id = touch.id, .time_ms = touch.time } });
            },
            .touch_motion => |touch| try self.push(.{ .touch_motion = .{
                .id = touch.id,
                .time_ms = touch.time,
                .x = fixed_to_float(touch.x),
                .y = fixed_to_float(touch.y),
            } }),
            .touch_frame => try self.push(.touch_frame),
            .touch_cancel => {
                self.touch_active = 0;
                try self.push(.touch_cancel);
            },
            .data_offer => |offer| try self.offers.append(self.allocator, .{ .proxy = offer, .primary = false }),
            .primary_offer => |offer| try self.offers.append(self.allocator, .{ .proxy = offer, .primary = true }),
            .data_selection => |offer| try self.set_current_offer(.clipboard, offer),
            .drag_source_dropped => if (self.is_drag_source(proxy)) {
                self.drag_source_dropped = true;
            },
            .drag_source_finished => if (self.is_drag_source(proxy)) try self.end_drag_source(),
            .primary_selection => |offer| try self.set_current_offer(.primary, offer),
            .data_offer_mime => |offer| try self.add_mime(offer.offer, offer.mime),
            .primary_offer_mime => |offer| try self.add_mime(offer.offer, offer.mime),
            .data_source_send => |send| if (self.is_drag_source(send.source)) {
                self.serve_drag(send.mime, send.fd);
            } else {
                try self.serve(.clipboard, send.source, send.mime, send.fd);
            },
            .primary_source_send => |send| try self.serve(.primary, send.source, send.mime, send.fd),
            .data_source_cancelled => |source| if (self.is_drag_source(source)) {
                self.drag_source_dropped = false;
                try self.end_drag_source();
            } else {
                self.cancel_source(.clipboard, source);
            },
            .primary_source_cancelled => |source| self.cancel_source(.primary, source),
            .text_preedit => |preedit| self.text_batch.set_preedit(self.allocator, .{
                .text = preedit.text,
                .cursor_begin = preedit.cursor_begin,
                .cursor_end = preedit.cursor_end,
            }),
            .text_commit => |text| self.text_batch.set_commit(self.allocator, text),
            .text_delete_surrounding => |delete| self.text_batch.delete = .{ .before = delete.before, .after = delete.after },
            .text_done => try self.flush_text_batch(),
            .relative_motion => |motion| try self.push(.{ .pointer_relative_motion = .{
                .dx = fixed_to_float(motion.dx),
                .dy = fixed_to_float(motion.dy),
                .dx_unaccel = fixed_to_float(motion.dx_unaccel),
                .dy_unaccel = fixed_to_float(motion.dy_unaccel),
                .time_us = (@as(u64, motion.time_hi) << 32) | motion.time_lo,
            } }),
            .locked_pointer => |locked| try self.push(.{ .pointer_lock = locked }),
            .confined_pointer => {},
            .activation_token => |token| try self.finish_activation(proxy, token),
        }
    }

    fn bind_global(self: *Window, name: u32, interface: []const u8, advertised: u32) Error!void {
        const lib = self.lib;
        const registry = self.registry.?;
        if (std.mem.eql(u8, interface, "wl_compositor")) {
            if (self.compositor == null) self.compositor = try protocol.Registry.bind(lib, registry, name, lib.interfaces.compositor, @min(advertised, max_versions.compositor));
        } else if (std.mem.eql(u8, interface, "wl_shm")) {
            if (self.shm == null) self.shm = try protocol.Registry.bind(lib, registry, name, lib.interfaces.shm, @min(advertised, max_versions.shm));
        } else if (std.mem.eql(u8, interface, "xdg_wm_base")) {
            if (self.wm_base == null) {
                const version = @min(advertised, max_versions.wm_base);
                const proxy = try protocol.Registry.bind(lib, registry, name, &protocol.xdg_wm_base_interface, version);
                self.wm_base = proxy;
                self.wm_base_version = version;
                try lib.listen(proxy, &binding.wm_base_listener, self.inbox);
            }
        } else if (std.mem.eql(u8, interface, "wl_seat")) {
            if (self.seat == null) {
                const version = @min(advertised, max_versions.seat);
                const proxy = try protocol.Registry.bind(lib, registry, name, lib.interfaces.seat, version);
                self.seat = proxy;
                self.seat_global = name;
                self.seat_version = version;
                self.pointer_frames = version >= 5;
                try lib.listen(proxy, &binding.seat_listener, self.inbox);
                try self.create_seat_objects();
            }
        } else if (std.mem.eql(u8, interface, "wl_output")) {
            const version = @min(advertised, max_versions.output);
            const proxy = try protocol.Registry.bind(lib, registry, name, lib.interfaces.output, version);
            try lib.listen(proxy, &binding.output_listener, self.inbox);
            try self.output_records.append(self.allocator, .{ .global_name = name, .proxy = proxy, .version = version });
            try self.attach_xdg_output(self.output_records.items.len - 1);
        } else if (std.mem.eql(u8, interface, "zxdg_output_manager_v1")) {
            if (self.xdg_output_manager == null) {
                self.xdg_output_manager = try protocol.Registry.bind(lib, registry, name, &protocol.zxdg_output_manager_v1_interface, @min(advertised, max_versions.xdg_output_manager));
                for (0..self.output_records.items.len) |index| try self.attach_xdg_output(index);
            }
        } else if (std.mem.eql(u8, interface, "wp_pointer_warp_v1")) {
            if (self.pointer_warp == null) self.pointer_warp = try protocol.Registry.bind(lib, registry, name, &protocol.wp_pointer_warp_v1_interface, @min(advertised, max_versions.pointer_warp));
        } else if (std.mem.eql(u8, interface, "zxdg_decoration_manager_v1")) {
            if (self.decoration_manager == null) self.decoration_manager = try protocol.Registry.bind(lib, registry, name, &protocol.zxdg_decoration_manager_v1_interface, @min(advertised, max_versions.decoration_manager));
        } else if (std.mem.eql(u8, interface, "wp_viewporter")) {
            if (self.viewporter == null) self.viewporter = try protocol.Registry.bind(lib, registry, name, &protocol.wp_viewporter_interface, @min(advertised, max_versions.viewporter));
        } else if (std.mem.eql(u8, interface, "wp_fractional_scale_manager_v1")) {
            if (self.fractional_manager == null) self.fractional_manager = try protocol.Registry.bind(lib, registry, name, &protocol.wp_fractional_scale_manager_v1_interface, @min(advertised, max_versions.fractional_manager));
        } else if (std.mem.eql(u8, interface, "wl_data_device_manager")) {
            if (self.data_device_manager == null) {
                self.data_device_version = @min(advertised, max_versions.data_device_manager);
                self.data_device_manager = try protocol.Registry.bind(lib, registry, name, lib.interfaces.data_device_manager, self.data_device_version);
                try self.create_seat_objects();
            }
        } else if (std.mem.eql(u8, interface, "zwp_primary_selection_device_manager_v1")) {
            if (self.primary_manager == null) {
                self.primary_manager = try protocol.Registry.bind(lib, registry, name, &protocol.zwp_primary_selection_device_manager_v1_interface, @min(advertised, max_versions.primary_manager));
                try self.create_seat_objects();
            }
        } else if (std.mem.eql(u8, interface, "zwp_text_input_manager_v3")) {
            if (self.text_input_manager == null) {
                self.text_input_manager = try protocol.Registry.bind(lib, registry, name, &protocol.zwp_text_input_manager_v3_interface, @min(advertised, max_versions.text_input_manager));
                try self.create_seat_objects();
            }
        } else if (std.mem.eql(u8, interface, "zwp_relative_pointer_manager_v1")) {
            if (self.relative_manager == null) self.relative_manager = try protocol.Registry.bind(lib, registry, name, &protocol.zwp_relative_pointer_manager_v1_interface, @min(advertised, max_versions.relative_manager));
        } else if (std.mem.eql(u8, interface, "zwp_pointer_constraints_v1")) {
            if (self.constraints == null) self.constraints = try protocol.Registry.bind(lib, registry, name, &protocol.zwp_pointer_constraints_v1_interface, @min(advertised, max_versions.constraints));
        } else if (std.mem.eql(u8, interface, "xdg_activation_v1")) {
            if (self.activation == null) self.activation = try protocol.Registry.bind(lib, registry, name, &protocol.xdg_activation_v1_interface, @min(advertised, max_versions.activation));
        } else if (std.mem.eql(u8, interface, "zwp_tablet_manager_v2")) {
            if (self.tablet_manager == null) {
                self.tablet_manager = try protocol.Registry.bind(lib, registry, name, &protocol.zwp_tablet_manager_v2_interface, @min(advertised, max_versions.tablet_manager));
                try self.create_seat_objects();
            }
        } else if (std.mem.eql(u8, interface, "wp_cursor_shape_manager_v1")) {
            if (self.cursor_shape_manager == null) self.cursor_shape_manager = try protocol.Registry.bind(lib, registry, name, &protocol.wp_cursor_shape_manager_v1_interface, @min(advertised, max_versions.cursor_shape_manager));
        }
    }

    fn remove_global(self: *Window, name: u32) Error!void {
        if (self.seat != null and name == self.seat_global) return self.release_seat();
        for (self.output_records.items, 0..) |output, i| {
            if (output.global_name == name) {
                var removed = self.output_records.orderedRemove(i);
                self.recompute_buffer_scale();
                if (removed.xdg) |xdg| {
                    protocol.ZxdgOutputV1.destroy(self.lib, xdg);
                    self.lib.destroy(xdg);
                }
                if (removed.version >= 3) {
                    protocol.Output.release(self.lib, removed.proxy);
                } else {
                    self.lib.destroy(removed.proxy);
                }
                removed.modes.deinit(self.allocator);
                if (removed.announced) try self.push(.{ .output_removed = name });
                return;
            }
        }
    }

    /// Creates the zxdg_output_v1 of the output at `index` once the manager is bound.
    fn attach_xdg_output(self: *Window, index: usize) Error!void {
        const manager = self.xdg_output_manager orelse return;
        const output = &self.output_records.items[index];
        if (output.xdg != null) return;
        const xdg = try protocol.ZxdgOutputManagerV1.get_xdg_output(self.lib, manager, output.proxy);
        output.xdg = xdg;
        try self.lib.listen(xdg, &binding.xdg_output_listener, self.inbox);
    }

    fn output_for_xdg(self: *const Window, proxy: ?Proxy) ?usize {
        const target = proxy orelse return null;
        for (self.output_records.items, 0..) |output, i| {
            if (output.xdg == target) return i;
        }
        return null;
    }

    /// Creates the per-seat objects whose globals and seat are both present: the
    /// data device, primary-selection device and text input. Idempotent.
    fn create_seat_objects(self: *Window) Error!void {
        const seat = self.seat orelse return;
        if (self.data_device == null) if (self.data_device_manager) |manager| {
            const device = try protocol.DataDeviceManager.get_data_device(self.lib, manager, seat);
            try self.lib.listen(device, &binding.data_device_listener, self.inbox);
            self.data_device = device;
        };
        if (self.primary_device == null) if (self.primary_manager) |manager| {
            const device = try protocol.ZwpPrimarySelectionDeviceManagerV1.get_device(self.lib, manager, seat);
            try self.lib.listen(device, &binding.primary_device_listener, self.inbox);
            self.primary_device = device;
        };
        if (self.text_input == null) if (self.text_input_manager) |manager| {
            const input = try protocol.ZwpTextInputManagerV3.get_text_input(self.lib, manager, seat);
            try self.lib.listen(input, &binding.text_input_listener, self.inbox);
            self.text_input = input;
        };
        if (self.tablet_seat == null) if (self.tablet_manager) |manager| {
            const tablet_seat = try protocol.ZwpTabletManagerV2.get_tablet_seat(self.lib, manager, seat);
            try self.lib.listen(tablet_seat, &binding.tablet_seat_listener, self.inbox);
            self.tablet_seat = tablet_seat;
        };
    }

    /// Releases the seat's objects in SDL's order (Wayland_SeatDestroy): pointer,
    /// keyboard, touch and tablets; then selection offers and sources, the data and
    /// primary-selection devices, text input and the seat. Pending events that refer
    /// to these objects are sent first (leave, cancel, pen removal). A later seat
    /// global is bound again by `bind_global`.
    fn release_seat(self: *Window) Error!void {
        const lib = self.lib;
        try self.release_pointer();
        try self.release_keyboard();
        try self.release_touch();
        while (self.pens.items.len > 0) try self.remove_pen(self.pens.items.len - 1);
        if (self.tablet_seat) |tablet_seat| {
            protocol.ZwpTabletSeatV2.destroy(lib, tablet_seat);
            lib.destroy(tablet_seat);
            self.tablet_seat = null;
        }
        self.drop_drag_offer();
        while (self.offers.items.len > 0) self.destroy_offer_at(self.offers.items.len - 1);
        self.clipboard_offer = null;
        self.primary_offer = null;
        self.retire_source(.clipboard);
        self.retire_source(.primary);
        if (self.data_device) |device| {
            if (self.data_device_version >= 2) protocol.DataDevice.release(lib, device);
            lib.destroy(device);
            self.data_device = null;
        }
        if (self.primary_device) |device| {
            protocol.ZwpPrimarySelectionDeviceV1.destroy(lib, device);
            lib.destroy(device);
            self.primary_device = null;
        }
        if (self.text_input) |input| {
            protocol.ZwpTextInputV3.destroy(lib, input);
            lib.destroy(input);
            self.text_input = null;
        }
        self.text_enabled = false;
        if (self.seat) |seat| {
            if (self.seat_version >= 5) protocol.Seat.release(lib, seat);
            lib.destroy(seat);
        }
        self.seat = null;
        self.seat_global = 0;
        self.seat_version = 1;
        self.pointer_serial = 0;
        self.keyboard_serial = 0;
        try self.flush();
    }

    /// Releases the pointer (and its lock, relative pointer and cursor shape device)
    /// after a seat capability went away. Reports leave and the end of a lock.
    fn release_pointer(self: *Window) Error!void {
        const lib = self.lib;
        const pointer = self.pointer orelse return;
        if (self.pointer_focused) {
            self.pointer_focused = false;
            try self.push(.pointer_leave);
        }
        if (self.relative_mode) {
            self.relative_mode = false;
            try self.push(.{ .pointer_lock = false });
        }
        if (self.locked_pointer) |locked| {
            protocol.ZwpLockedPointerV1.destroy(lib, locked);
            lib.destroy(locked);
            self.locked_pointer = null;
        }
        if (self.relative_pointer) |relative| {
            protocol.ZwpRelativePointerV1.destroy(lib, relative);
            lib.destroy(relative);
            self.relative_pointer = null;
        }
        if (self.cursor_shape) |shape| {
            protocol.WpCursorShapeDeviceV1.destroy(lib, shape);
            lib.destroy(shape);
            self.cursor_shape = null;
        }
        if (self.seat_version >= 3) protocol.Pointer.release(lib, pointer);
        lib.destroy(pointer);
        self.pointer = null;
        self.axis_frame = .{ .{}, .{} };
        self.pointer_serial = 0;
    }

    /// Releases the keyboard after its capability went away; reports focus loss first.
    fn release_keyboard(self: *Window) Error!void {
        const object = self.keyboard orelse return;
        if (self.keyboard_focused) {
            self.keyboard_focused = false;
            try self.push(.{ .keyboard_focus = false });
        }
        if (self.seat_version >= 3) protocol.Keyboard.release(self.lib, object);
        self.lib.destroy(object);
        self.keyboard = null;
        self.keyboard_serial = 0;
    }

    /// Releases the touch device after its capability went away; cancels live touches first.
    fn release_touch(self: *Window) Error!void {
        const touch = self.touch orelse return;
        if (self.touch_active > 0) {
            self.touch_active = 0;
            try self.push(.touch_cancel);
        }
        if (self.seat_version >= 3) protocol.Touch.release(self.lib, touch);
        self.lib.destroy(touch);
        self.touch = null;
    }

    /// Index of the tool behind `proxy` in `pens`.
    fn tool_index(self: *const Window, proxy: ?Proxy) ?usize {
        const target = proxy orelse return null;
        for (self.pens.items, 0..) |tool, i| {
            if (tool.proxy == target) return i;
        }
        return null;
    }

    /// Whether `surface_proxy` is this window's surface or one of its popups.
    fn owns_surface(self: *const Window, surface_proxy: ?Proxy) bool {
        const target = surface_proxy orelse return false;
        if (self.surface == target) return true;
        for (self.popups.items) |popup| {
            if (popup.surface == target) return true;
        }
        return false;
    }

    /// Announces a tool once its `done` arrives with a known role (SDL's
    /// tablet_tool_handle_done). Each tool gets an id on its first announcement.
    fn announce_pen(self: *Window, index: usize) Error!void {
        const tool = &self.pens.items[index];
        if (!tool.announceable()) return;
        if (tool.id == 0) {
            tool.id = self.next_pen_id;
            self.next_pen_id +%= 1;
            if (self.next_pen_id == 0) self.next_pen_id = 1;
        }
        try self.push(.{ .pen_added = tool.info() });
    }

    /// Converts the tool's frame into `pen` samples (SDL's tablet_tool_handle_frame).
    /// Frames of tools that are not announced yet produce no samples.
    fn emit_pen_frame(self: *Window, index: usize, time_ms: u32) Error!void {
        var frame: tablet.Frame = .{};
        const tool = &self.pens.items[index];
        tool.frame(&frame);
        const pen_id = tool.id;
        if (pen_id == 0) return;
        for (frame.slice()) |sample| {
            try self.push(.{ .pen = .{ .pen = pen_id, .time_ms = time_ms, .sample = sample } });
        }
    }

    /// Removes a tool (its `removed` event): reports it if it was announced, then
    /// destroys the protocol object.
    fn remove_pen(self: *Window, index: usize) Error!void {
        const removed = self.pens.swapRemove(index);
        protocol.ZwpTabletToolV2.destroy(self.lib, removed.proxy);
        self.lib.destroy(removed.proxy);
        if (removed.id != 0) try self.push(.{ .pen_removed = removed.id });
    }

    /// MIME types of the offer behind `proxy` (empty when unknown).
    fn offer_mimes(self: *const Window, proxy: Proxy) []const []u8 {
        for (self.offers.items) |offer| {
            if (offer.proxy == proxy) return offer.mimes.items;
        }
        return &.{};
    }

    /// Destroys the drag offer (if any) and forgets the drag.
    fn drop_drag_offer(self: *Window) void {
        const offer = self.drag_offer orelse return;
        self.drag_offer = null;
        self.drag_dropped = false;
        for (self.offers.items, 0..) |entry, index| {
            if (entry.proxy == offer) {
                self.destroy_offer_at(index);
                return;
            }
        }
    }

    fn announce_output(self: *Window, index: usize) Error!void {
        const output = &self.output_records.items[index];
        const id = output.global_name;
        if (output.announced) return self.push(.{ .output_changed = id });
        output.announced = true;
        try self.push(.{ .output_added = id });
    }

    fn record_mode(self: *Window, index: usize, flags: u32, width: i32, height: i32, refresh: i32) Error!void {
        const output = &self.output_records.items[index];
        const current = flags & 1 != 0;
        const preferred = flags & 2 != 0;
        if (current) {
            for (output.modes.items) |*mode| mode.current = false;
        }
        for (output.modes.items) |*mode| {
            if (mode.width == width and mode.height == height and mode.refresh_mhz == refresh) {
                mode.current = current;
                mode.preferred = preferred;
                return;
            }
        }
        try output.modes.append(self.allocator, .{
            .width = width,
            .height = height,
            .refresh_mhz = refresh,
            .current = current,
            .preferred = preferred,
        });
    }

    fn flush_axes(self: *Window) Error!void {
        for (0..self.axis_frame.len) |index| try self.flush_axis(index);
    }

    /// Emits the accumulated scroll of axis `index` (0 vertical, 1 horizontal) and clears it.
    fn flush_axis(self: *Window, index: usize) Error!void {
        const frame = &self.axis_frame[index];
        defer frame.* = .{};
        if (frame.kind == .none) return;
        var scroll: Scroll = .{
            .horizontal = index == 1,
            .value = 0,
            .time_ms = frame.time_ms,
            .source = frame.source,
            .inverted = frame.inverted,
        };
        switch (frame.kind) {
            .none => unreachable,
            .continuous => {
                scroll.value = frame.continuous;
                scroll.ticks = frame.continuous / wheel_unit;
            },
            .discrete => {
                scroll.steps = frame.discrete;
                scroll.ticks = @floatFromInt(frame.discrete);
                scroll.value = scroll.ticks * wheel_unit;
            },
            .value120 => {
                const total = self.wheel_remainder[index] + frame.value120;
                const steps = @divTrunc(total, high_res_steps);
                self.wheel_remainder[index] = total - steps * high_res_steps;
                scroll.steps = steps;
                scroll.ticks = @as(f64, @floatFromInt(frame.value120)) / high_res_steps;
                scroll.value = scroll.ticks * wheel_unit;
            },
        }
        try self.push(.{ .pointer_scroll = scroll });
    }

    /// Pixel size of a popup's buffers (see `popup_buffer_size`).
    fn popup_pixels(self: *const Window, popup: *const Popup) Size {
        if (popup.viewport != null and popup.fractional != null) {
            return .{
                .width = scale_up(popup.size.width, popup.scale_120),
                .height = scale_up(popup.size.height, popup.scale_120),
            };
        }
        const factor: u31 = @intCast(self.buffer_scale);
        return .{ .width = popup.size.width * factor, .height = popup.size.height * factor };
    }

    fn popup_by_frame(self: *const Window, proxy: ?Proxy) ?usize {
        const target = proxy orelse return null;
        for (self.popups.items, 0..) |popup, i| {
            if (popup.frame_callback == target) return i;
        }
        return null;
    }

    fn popup_by_fractional(self: *const Window, proxy: ?Proxy) ?usize {
        const target = proxy orelse return null;
        for (self.popups.items, 0..) |popup, i| {
            if (popup.fractional == target) return i;
        }
        return null;
    }

    fn popup_index(self: *const Window, id: PopupId) ?usize {
        for (self.popups.items, 0..) |popup, i| {
            if (popup.id == id) return i;
        }
        return null;
    }

    fn popup_by_xdg(self: *const Window, proxy: ?Proxy) ?usize {
        const target = proxy orelse return null;
        for (self.popups.items, 0..) |popup, i| {
            if (popup.xdg_surface == target) return i;
        }
        return null;
    }

    fn popup_by_popup(self: *const Window, proxy: ?Proxy) ?usize {
        const target = proxy orelse return null;
        for (self.popups.items, 0..) |popup, i| {
            if (popup.xdg_popup == target) return i;
        }
        return null;
    }

    /// Acknowledges a popup configure and applies the geometry sent before it.
    fn apply_popup_configure(self: *Window, index: usize, serial: u32) Error!void {
        const popup = &self.popups.items[index];
        protocol.XdgSurface.ack_configure(self.lib, popup.xdg_surface, serial);
        var configure: PopupConfigure = popup.pending orelse .{ .id = popup.id, .x = 0, .y = 0, .size = popup.size };
        popup.pending = null;
        if (configure.size.width == 0) configure.size.width = popup.size.width;
        if (configure.size.height == 0) configure.size.height = popup.size.height;
        popup.size = configure.size;
        popup.configured = true;
        try self.push(.{ .popup_configure = configure });
    }

    /// Writes one output's logical view from its record.
    fn output_info(allocator: Allocator, output: Output) Allocator.Error!OutputInfo {
        const modes = try allocator.dupe(Mode, output.modes.items);
        errdefer allocator.free(modes);
        var current: ?Mode = null;
        for (output.modes.items) |mode| {
            if (mode.current) {
                current = mode;
                break;
            }
        }
        const scale: i32 = @max(output.scale, 1);
        const size: Size = if (output.logical_size) |logical| logical else if (current) |mode| blk: {
            const swapped = switch (output.transform) {
                .rotate_90, .rotate_270, .flipped_90, .flipped_270 => true,
                else => false,
            };
            const width = @divTrunc(mode.width, scale);
            const height = @divTrunc(mode.height, scale);
            break :blk .{
                .width = clamp_size(if (swapped) height else width),
                .height = clamp_size(if (swapped) width else height),
            };
        } else .{ .width = 0, .height = 0 };
        return .{
            .id = output.global_name,
            .name = output.name,
            .description = output.description,
            .make = output.make,
            .model = output.model,
            .position = output.logical_position orelse .{ .x = output.geometry_x, .y = output.geometry_y },
            .size = size,
            .physical_size = .{ .width = clamp_size(output.physical_width), .height = clamp_size(output.physical_height) },
            .scale = output.scale,
            .transform = output.transform,
            .mode = current,
            .modes = modes,
        };
    }
    fn output_index(self: *const Window, proxy: ?Proxy) ?usize {
        const target = proxy orelse return null;
        for (self.output_records.items, 0..) |output, i| {
            if (output.proxy == target) return i;
        }
        return null;
    }

    fn find_buffer(self: *Window, proxy: ?Proxy) ?*shm.Buffer {
        const target = proxy orelse return null;
        for (&self.buffers) |*buffer| {
            if (buffer.wl_buffer == target) return buffer;
        }
        for (self.popups.items) |*popup| {
            for (&popup.buffers) |*buffer| {
                if (buffer.wl_buffer == target) return buffer;
            }
        }
        return null;
    }

    fn recompute_buffer_scale(self: *Window) void {
        var scale: i32 = 1;
        for (self.output_records.items) |output| scale = @max(scale, output.scale);
        self.buffer_scale = scale;
    }

    fn apply_configure(self: *Window, serial: u32) Error!void {
        if (self.pending) |pending| {
            if (pending.size.width != 0) self.logical.width = pending.size.width;
            if (pending.size.height != 0) self.logical.height = pending.size.height;
            self.state = pending.state;
            self.pending = null;
        }
        protocol.XdgSurface.ack_configure(self.lib, self.xdg_surface.?, serial);
        self.configured = true;
        try self.push(.{ .configure = .{ .size = self.logical, .state = self.state } });
    }

    /// Creates the input objects the seat now offers and releases those it dropped.
    fn update_capabilities(self: *Window, caps: u32) Error!void {
        const lib = self.lib;
        if (caps & protocol.Seat.Capability.pointer != 0) {
            if (self.pointer == null) {
                const proxy = try protocol.Seat.get_pointer(lib, self.seat.?);
                self.pointer = proxy;
                try lib.listen(proxy, &binding.pointer_listener, self.inbox);
            }
        } else {
            try self.release_pointer();
        }
        if (caps & protocol.Seat.Capability.keyboard != 0) {
            if (self.keyboard == null) {
                const proxy = try protocol.Seat.get_keyboard(lib, self.seat.?);
                self.keyboard = proxy;
                try lib.listen(proxy, &binding.keyboard_listener, self.inbox);
            }
        } else {
            try self.release_keyboard();
        }
        if (caps & protocol.Seat.Capability.touch != 0) {
            if (self.touch == null) {
                const proxy = try protocol.Seat.get_touch(lib, self.seat.?);
                self.touch = proxy;
                try lib.listen(proxy, &binding.touch_listener, self.inbox);
            }
        } else {
            try self.release_touch();
        }
    }

    /// Maps a received xkb_v1 keymap read-only, replacing the previous one. The
    /// fd is closed after mapping; a failed map leaves no keymap.
    fn replace_keymap(self: *Window, fd: i32, size: u32) void {
        defer _ = linux.close(fd);
        if (self.keymap) |old| {
            _ = linux.munmap(old.ptr, old.len);
            self.keymap = null;
        }
        if (size == 0) return;
        const rc = linux.mmap(null, size, .{ .READ = true }, .{ .TYPE = .PRIVATE }, fd, 0);
        if (linux.errno(rc) != .SUCCESS) return;
        const ptr: [*]align(page_size) u8 = @ptrFromInt(rc);
        self.keymap = ptr[0..size];
    }

    fn push(self: *Window, event: Event) Error!void {
        try self.events.append(self.allocator, event);
    }

    /// Moves an owned string into the event text store and returns it borrowed.
    fn adopt_text(self: *Window, text: []u8) Error![]const u8 {
        self.texts.append(self.allocator, text) catch |err| {
            self.allocator.free(text);
            return err;
        };
        return text;
    }

    /// Emits the pending text-input batch in protocol order: delete, commit, preedit.
    fn flush_text_batch(self: *Window) Error!void {
        const batch = &self.text_batch;
        if (batch.delete) |delete| {
            batch.delete = null;
            try self.push(.{ .text_delete_surrounding = .{ .before = delete.before, .after = delete.after } });
        }
        if (batch.commit) |text| {
            batch.commit = null;
            try self.push(.{ .text_commit = try self.adopt_text(text) });
        }
        if (batch.preedit) |preedit| {
            batch.preedit = null;
            batch.preedit_active = preedit.text.len > 0;
            try self.push(.{ .text_preedit = .{
                .text = try self.adopt_text(preedit.text),
                .cursor_begin = preedit.cursor_begin,
                .cursor_end = preedit.cursor_end,
            } });
        } else if (batch.preedit_active) {
            batch.preedit_active = false;
            try self.push(.{ .text_preedit = .{ .text = "", .cursor_begin = 0, .cursor_end = 0 } });
        }
    }

    /// Makes `offer` the current selection of its kind and retires the others of that
    /// kind. Offers are announced before the selection that names them, so every
    /// other offer of the kind is stale, including offers announced for a drag this
    /// backend does not track.
    fn set_current_offer(self: *Window, which: Selection, offer: ?Proxy) Error!void {
        const primary = which == .primary;
        const slot = if (primary) &self.primary_offer else &self.clipboard_offer;
        slot.* = offer;
        var index = self.offers.items.len;
        while (index > 0) {
            index -= 1;
            const entry = self.offers.items[index];
            if (entry.primary != primary) continue;
            if (offer != null and entry.proxy == offer.?) continue;
            if (self.drag_offer) |drag| if (entry.proxy == drag) continue;
            self.destroy_offer_at(index);
        }
        try self.push(.{ .selection_changed = which });
    }

    /// Sends the destroy request for the offer at `index`, frees its MIME list and
    /// removes it from the list.
    fn destroy_offer_at(self: *Window, index: usize) void {
        const offer = self.offers.items[index];
        if (offer.primary) {
            protocol.ZwpPrimarySelectionOfferV1.destroy(self.lib, offer.proxy);
        } else {
            protocol.DataOffer.destroy(self.lib, offer.proxy);
        }
        self.lib.destroy(offer.proxy);
        var removed = self.offers.swapRemove(index);
        removed.deinit(self.allocator);
    }

    /// Records a MIME type for an offer. `mime` is owned: stored, or freed when the
    /// offer is unknown.
    fn add_mime(self: *Window, proxy: Proxy, mime: []u8) Error!void {
        for (self.offers.items) |*offer| {
            if (offer.proxy != proxy) continue;
            offer.mimes.append(self.allocator, mime) catch |err| {
                self.allocator.free(mime);
                return err;
            };
            return;
        }
        self.allocator.free(mime);
    }

    /// Writes the data for `mime` to `fd` if this client still owns `which` as
    /// `source`. Consumes `mime` and always closes `fd`.
    fn serve(self: *Window, which: Selection, source_proxy: Proxy, mime: []u8, fd: i32) Error!void {
        defer self.allocator.free(mime);
        const current = if (which == .primary) &self.primary_source else &self.clipboard_source;
        const source = if (current.*) |*owned| owned else {
            _ = linux.close(fd);
            return;
        };
        if (source.proxy != source_proxy) {
            _ = linux.close(fd);
            return;
        }
        const data = source.find(mime) orelse {
            _ = linux.close(fd);
            return;
        };
        clipboard.write_all(fd, data) catch {};
    }

    /// The compositor replaced our source: forget it and destroy its object.
    fn cancel_source(self: *Window, which: Selection, source_proxy: Proxy) void {
        const current = if (which == .primary) &self.primary_source else &self.clipboard_source;
        if (current.*) |*owned| {
            if (owned.proxy == source_proxy) self.retire_source(which);
        }
    }

    /// Destroys the current source for `which` (if any) and frees it.
    fn retire_source(self: *Window, which: Selection) void {
        const current = if (which == .primary) &self.primary_source else &self.clipboard_source;
        if (current.*) |*owned| {
            if (which == .primary) {
                protocol.ZwpPrimarySelectionSourceV1.destroy(self.lib, owned.proxy);
            } else {
                protocol.DataSource.destroy(self.lib, owned.proxy);
            }
            self.lib.destroy(owned.proxy);
            owned.deinit(self.allocator);
            current.* = null;
        }
    }

    /// Finishes a `request_focus`: exports the token to xdg-activation and destroys
    /// the token object. Consumes `token`.
    fn finish_activation(self: *Window, token_proxy: ?Proxy, token: []u8) Error!void {
        defer self.allocator.free(token);
        const activation = self.activation orelse return;
        const surface_proxy = self.surface orelse return;
        if (token_proxy) |proxy| {
            protocol.XdgActivationTokenV1.destroy(self.lib, proxy);
            self.lib.destroy(proxy);
        }
        const token_z = try self.allocator.dupeSentinel(u8, token, 0);
        defer self.allocator.free(token_z);
        protocol.XdgActivationV1.activate(self.lib, activation, token_z, surface_proxy);
        try self.flush();
    }

    /// Creates or resizes the two buffers to `size`. Old buffers are destroyed
    /// first; the compositor keeps showing its last copy.
    fn ensure_buffers(self: *Window, size: Size) Error!void {
        const first = self.buffers[0];
        if (first.memory != null and first.width == size.width and first.height == size.height) return;
        for (&self.buffers) |*buffer| buffer.release(self.lib);
        for (&self.buffers) |*buffer| {
            buffer.* = try shm.Buffer.create(self.lib, self.shm.?, self.inbox, size.width, size.height);
        }
    }

    // ---- cursor helpers ----

    /// Pointer enter must not fail the dispatch when the cursor cannot be shown (no
    /// theme installed, for example): the pointer keeps the compositor's default cursor.
    fn apply_cursor_on_enter(self: *Window) Error!void {
        self.apply_cursor() catch |err| switch (err) {
            error.CursorFailed, error.LibraryNotLinked, error.MissingSymbol, error.Unsupported => {},
            else => return err,
        };
    }

    /// Applies `self.cursor` to the pointer, if the pointer is over the window.
    fn apply_cursor(self: *Window) Error!void {
        if (!self.pointer_focused) return;
        const pointer = self.pointer orelse return;
        switch (self.cursor) {
            .hidden => protocol.Pointer.set_cursor(self.lib, pointer, self.pointer_serial, null, 0, 0),
            .system => |shape| {
                if (try self.use_shape_protocol(shape)) return;
                _ = try self.show_theme_cursor(shape);
            },
            .custom => |custom| try self.show_custom(pointer, custom),
        }
    }

    /// Uses wp_cursor_shape_v1 for `shape` when the global is bound. Returns false
    /// when the theme must be used instead.
    fn use_shape_protocol(self: *Window, shape: SystemCursor) Error!bool {
        const manager = self.cursor_shape_manager orelse return false;
        const pointer = self.pointer orelse return false;
        const shape_enum = std.meta.stringToEnum(protocol.WpCursorShapeDeviceV1.Shape, cursor.shape_name(shape)) orelse return false;
        if (self.cursor_shape == null) {
            self.cursor_shape = try protocol.WpCursorShapeManagerV1.get_pointer(self.lib, manager, pointer);
        }
        protocol.WpCursorShapeDeviceV1.set_shape(self.lib, self.cursor_shape.?, self.pointer_serial, shape_enum);
        return true;
    }

    /// Shows a named theme cursor at frame 0. Records it for animation.
    fn show_theme_cursor(self: *Window, shape: SystemCursor) Error!u32 {
        const scale = self.buffer_scale;
        const pixels = self.cursor_size * @as(u32, @intCast(scale));
        try self.ensure_theme(pixels);
        const lib = &self.cursor_lib.?;
        const theme = self.cursor_theme.?;
        const names = cursor.names(shape);
        const found = lib.find(theme, names.css) orelse
            (if (names.fallback) |fallback| lib.find(theme, fallback) else null) orelse
            lib.find(theme, "default") orelse
            lib.find(theme, "left_ptr") orelse return error.CursorFailed;
        self.theme_cursor = found;
        return self.show_theme_frame(0);
    }

    /// Shows frame `index` of the current theme cursor and returns its duration.
    fn show_theme_frame(self: *Window, index: usize) Error!u32 {
        const theme_cursor = self.theme_cursor orelse return error.CursorFailed;
        const pointer = self.pointer orelse return error.Unsupported;
        const lib = &self.cursor_lib.?;
        const frame = try lib.frame(theme_cursor, index);
        const scale: u31 = @intCast(self.buffer_scale);
        const surface_proxy = try self.ensure_cursor_surface();
        protocol.Surface.set_buffer_scale(self.lib, surface_proxy, self.buffer_scale);
        protocol.Surface.attach(self.lib, surface_proxy, frame.buffer, 0, 0);
        protocol.Surface.damage_buffer(self.lib, surface_proxy, 0, 0, @intCast(frame.width), @intCast(frame.height));
        protocol.Surface.commit(self.lib, surface_proxy);
        protocol.Pointer.set_cursor(self.lib, pointer, self.pointer_serial, surface_proxy, @intCast(frame.hotspot_x / scale), @intCast(frame.hotspot_y / scale));
        return frame.delay_ms;
    }

    /// Shows a custom cursor image through the shared cursor surface.
    fn show_custom(self: *Window, pointer: Proxy, custom: *const CustomCursor) Error!void {
        const surface_proxy = try self.ensure_cursor_surface();
        const wl_buffer = custom.buffer.wl_buffer orelse return error.CursorFailed;
        protocol.Surface.set_buffer_scale(self.lib, surface_proxy, custom.scale);
        protocol.Surface.attach(self.lib, surface_proxy, wl_buffer, 0, 0);
        protocol.Surface.damage_buffer(self.lib, surface_proxy, 0, 0, @intCast(custom.buffer.width), @intCast(custom.buffer.height));
        protocol.Surface.commit(self.lib, surface_proxy);
        protocol.Pointer.set_cursor(self.lib, pointer, self.pointer_serial, surface_proxy, @intCast(custom.hot_x), @intCast(custom.hot_y));
    }

    fn ensure_cursor_surface(self: *Window) Error!Proxy {
        if (self.cursor_surface == null) {
            self.cursor_surface = try protocol.Compositor.create_surface(self.lib, self.compositor.?);
        }
        return self.cursor_surface.?;
    }

    /// Loads (or reloads, when the pixel size changes) the cursor theme.
    fn ensure_theme(self: *Window, pixels: u32) Error!void {
        if (self.cursor_lib == null) self.cursor_lib = try binding.CursorLibrary.open();
        if (self.cursor_theme != null and self.cursor_theme_size == pixels) return;
        self.free_theme();
        const name: ?[:0]const u8 = if (self.cursor_theme_name) |owned| owned else null;
        const lib = &self.cursor_lib.?;
        self.cursor_theme = try lib.load_theme(name, pixels, self.shm orelse return error.MissingGlobal);
        self.cursor_theme_size = pixels;
    }

    fn free_theme(self: *Window) void {
        self.theme_cursor = null;
        if (self.cursor_theme) |theme| {
            if (self.cursor_lib) |*lib| lib.free_theme(theme);
            self.cursor_theme = null;
        }
    }
};

fn scale_up(logical: u31, scale_120: u32) u31 {
    const scaled = (@as(u64, logical) * scale_120 + scale_unit - 1) / scale_unit;
    return @intCast(scaled);
}

fn clamp_size(value: i32) u31 {
    return @intCast(std.math.clamp(value, 0, std.math.maxInt(u31)));
}

/// Wheel step in surface units (SDL's WAYLAND_WHEEL_AXIS_UNIT).
const wheel_unit = 10.0;
/// High-resolution wheel units per step (axis_value120).
const high_res_steps = 120;
/// wl_data_device_manager.dnd_action.copy.
const dnd_action_copy: u32 = 1;

fn transform_from(value: i32) Transform {
    return switch (value) {
        1 => .rotate_90,
        2 => .rotate_180,
        3 => .rotate_270,
        4 => .flipped,
        5 => .flipped_90,
        6 => .flipped_180,
        7 => .flipped_270,
        else => .normal,
    };
}

fn scroll_source(value: u32) ScrollSource {
    return switch (value) {
        0 => .wheel,
        1 => .finger,
        2 => .continuous,
        3 => .wheel_tilt,
        else => .unknown,
    };
}

/// Index into `Window.axis_frame` for a wl_pointer axis (0 vertical, 1 horizontal).
fn axis_index(axis: u32) ?usize {
    return switch (axis) {
        0 => 0,
        1 => 1,
        else => null,
    };
}

/// Fills an xdg_positioner from popup options. `reactive` needs version 3.
fn configure_positioner(lib: *const binding.Library, positioner: Proxy, options: PopupOptions, reactive: bool) void {
    protocol.XdgPositioner.set_size(lib, positioner, options.size.width, options.size.height);
    const rect = options.anchor_rect;
    protocol.XdgPositioner.set_anchor_rect(lib, positioner, rect.x, rect.y, rect.width, rect.height);
    protocol.XdgPositioner.set_anchor(lib, positioner, options.anchor);
    protocol.XdgPositioner.set_gravity(lib, positioner, options.gravity);
    protocol.XdgPositioner.set_constraint_adjustment(lib, positioner, @bitCast(options.constraints));
    protocol.XdgPositioner.set_offset(lib, positioner, options.offset.x, options.offset.y);
    if (options.reactive and reactive) protocol.XdgPositioner.set_reactive(lib, positioner);
}

/// Destroys a popup's xdg_popup, xdg_surface and wl_surface and releases its buffers.
fn release_popup(lib: *const binding.Library, popup: *Popup) void {
    for (&popup.buffers) |*buffer| buffer.release(lib);
    if (popup.frame_callback) |callback| lib.destroy(callback);
    if (popup.fractional) |fractional| {
        protocol.WpFractionalScaleV1.destroy(lib, fractional);
        lib.destroy(fractional);
    }
    if (popup.viewport) |viewport| {
        protocol.WpViewport.destroy(lib, viewport);
        lib.destroy(viewport);
    }
    protocol.XdgPopup.destroy(lib, popup.xdg_popup);
    lib.destroy(popup.xdg_popup);
    protocol.XdgSurface.destroy(lib, popup.xdg_surface);
    lib.destroy(popup.xdg_surface);
    protocol.Surface.destroy(lib, popup.surface);
    lib.destroy(popup.surface);
}

/// wl_fixed_t (24.8 signed) to f64, exact.
fn fixed_to_float(raw: i32) f64 {
    return @as(f64, @floatFromInt(raw)) / 256.0;
}
