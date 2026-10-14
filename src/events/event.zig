//! SDL event model as a tagged union with typed identifiers.
//! Altered native port of the event payloads in SDL_events.h. Each variant
//! carries its own timestamp and ids; `code()` returns the SDL numeric type
//! (the value SDL_EventType assigns) so queues can select ranges as SDL does.
//!
//! Conventions:
//! - Timestamps are caller-supplied nanoseconds. Zero means "unset". Nothing in
//!   this module reads a clock, so event streams are reproducible.
//! - Ids are distinct enum types (`WindowId`, `MouseId`, ...). Non-exhaustive
//!   enums keep arbitrary backend values representable, as SDL's integers do.
//! - Keyboard payloads use `keyboard.Scancode`, `keyboard.Keycode` and
//!   `keyboard.Modifiers` from `../input/keyboard.zig`.
//! - Events that carry text (text input, IME editing, drops, clipboard MIME
//!   types) borrow their slices. Borrowed text must stay valid until the event
//!   has been consumed; the queue never copies it.
//! - Only event families with a native model are present. Joystick, gamepad,
//!   sensor, audio, camera and notification events are not ported yet, and no
//!   variant stands in for them.
const std = @import("std");
const keyboard = @import("../input/keyboard.zig");
const mouse = @import("mouse.zig");
const pen = @import("pen.zig");

/// Window identifier. `none` is SDL's 0 (no window).
pub const WindowId = enum(u32) { none = 0, _ };
/// Display identifier. `none` is SDL's 0 (no display).
pub const DisplayId = enum(u32) { none = 0, _ };
/// Keyboard device instance. `unknown` is 0: unknown or virtual device.
pub const KeyboardId = enum(u32) { unknown = 0, _ };
/// Mouse instance. `global` (0) is the merged view of all mice outside relative
/// mode; `touch` and `pen` mark pointer events synthesized from those devices.
pub const MouseId = enum(u32) {
    global = 0,
    touch = 0xFFFF_FFFF,
    pen = 0xFFFF_FFFE,
    _,
};
/// Touch device instance. Values match SDL_MOUSE_TOUCHID and SDL_PEN_TOUCHID.
pub const TouchId = enum(u64) {
    none = 0,
    mouse = 0xFFFF_FFFF_FFFF_FFFF,
    pen = 0xFFFF_FFFF_FFFF_FFFE,
    _,
};
/// Finger identifier, unique within one touch device while the finger is down.
pub const FingerId = enum(u64) { none = 0, _ };
/// Pen instance. `none` is 0. Unlike SDL, pen ids are issued per `pen.Pens`
/// table rather than from a process-wide counter.
pub const PenId = enum(u32) { none = 0, _ };

/// Payload shared by events that only carry a timestamp.
pub const Common = struct {
    timestamp: u64 = 0,
};

/// SDL_EVENT_TERMINATING through SDL_EVENT_SYSTEM_THEME_CHANGED.
pub const AppKind = enum(u32) {
    terminating = 0x101,
    low_memory,
    will_enter_background,
    did_enter_background,
    will_enter_foreground,
    did_enter_foreground,
    locale_changed = 0x107,
    system_theme_changed,
};

/// Application lifecycle notification.
pub const App = struct {
    kind: AppKind,
    timestamp: u64 = 0,
};

/// Display state change. `data1`/`data2` are kind-dependent, as in SDL.
pub const DisplayKind = enum(u32) {
    orientation = 0x151,
    added,
    removed,
    moved,
    desktop_mode_changed,
    current_mode_changed,
    content_scale_changed,
    usable_bounds_changed,
};

pub const Display = struct {
    kind: DisplayKind,
    timestamp: u64 = 0,
    display_id: DisplayId = .none,
    data1: i32 = 0,
    data2: i32 = 0,
};

/// Window state change. `data1`/`data2` are kind-dependent, for example the new
/// position for `moved` or the new size for `resized`.
pub const WindowKind = enum(u32) {
    shown = 0x202,
    hidden,
    exposed,
    moved,
    resized,
    pixel_size_changed,
    metal_view_resized,
    minimized,
    maximized,
    restored,
    mouse_enter,
    mouse_leave,
    focus_gained,
    focus_lost,
    close_requested,
    hit_test,
    icc_profile_changed,
    display_changed,
    display_scale_changed,
    safe_area_changed,
    occluded,
    enter_fullscreen,
    leave_fullscreen,
    destroyed,
    hdr_state_changed,
    settings_changed,
};

pub const Window = struct {
    kind: WindowKind,
    timestamp: u64 = 0,
    window_id: WindowId = .none,
    data1: i32 = 0,
    data2: i32 = 0,
};

/// Render target and device status notifications.
pub const RenderKind = enum(u32) {
    targets_reset = 0x2000,
    device_reset,
    device_lost,
};

pub const Render = struct {
    kind: RenderKind,
    timestamp: u64 = 0,
    window_id: WindowId = .none,
};

pub const KeyKind = enum(u32) {
    down = 0x300,
    up,
};

/// Keyboard key transition. `scancode` is the physical key; `keycode` is the
/// layout-dependent key with the event policy already applied (see
/// `keyboard.event_keycode`). `raw` is the platform-specific code.
pub const Key = struct {
    kind: KeyKind,
    timestamp: u64 = 0,
    window_id: WindowId = .none,
    keyboard_id: KeyboardId = .unknown,
    scancode: keyboard.Scancode = .unknown,
    keycode: keyboard.Keycode = .unknown,
    modifiers: keyboard.Modifiers = .none,
    raw: u16 = 0,
    repeat: bool = false,
};

/// IME composition text. A `start` or `length` of -1 means "not set".
pub const TextEditing = struct {
    timestamp: u64 = 0,
    window_id: WindowId = .none,
    text: []const u8 = "",
    start: i32 = -1,
    length: i32 = -1,
};

/// IME candidate list. `selected` is -1 when no candidate is selected.
pub const TextEditingCandidates = struct {
    timestamp: u64 = 0,
    window_id: WindowId = .none,
    candidates: []const []const u8 = &.{},
    selected: i32 = -1,
    horizontal: bool = false,
};

/// Committed UTF-8 text. Delivered only while text input is active.
pub const TextInput = struct {
    timestamp: u64 = 0,
    window_id: WindowId = .none,
    text: []const u8 = "",
};

pub const KeyboardDeviceKind = enum(u32) {
    added = 0x305,
    removed = 0x306,
};

pub const KeyboardDevice = struct {
    kind: KeyboardDeviceKind,
    timestamp: u64 = 0,
    keyboard_id: KeyboardId = .unknown,
};

pub const ScreenKeyboardKind = enum(u32) {
    shown = 0x308,
    hidden,
};

pub const ScreenKeyboard = struct {
    kind: ScreenKeyboardKind,
    timestamp: u64 = 0,
    window_id: WindowId = .none,
};

/// Pointer motion. `x`/`y` are window coordinates (or the accumulated position
/// in relative mode); `xrel`/`yrel` is the motion since the previous event.
pub const MouseMotion = struct {
    timestamp: u64 = 0,
    window_id: WindowId = .none,
    mouse_id: MouseId = .global,
    buttons: mouse.Buttons = .none,
    x: f32 = 0,
    y: f32 = 0,
    xrel: f32 = 0,
    yrel: f32 = 0,
};

pub const MouseButtonKind = enum(u32) {
    down = 0x401,
    up = 0x402,
};

/// Button transition. `clicks` is 1 for a single click, 2 for a double click and
/// so on, counted per button and per mouse.
pub const MouseButton = struct {
    kind: MouseButtonKind,
    timestamp: u64 = 0,
    window_id: WindowId = .none,
    mouse_id: MouseId = .global,
    /// One-based button index (`mouse.button`).
    button: u8,
    clicks: u8 = 1,
    x: f32 = 0,
    y: f32 = 0,
};

/// Whether the scroll direction is the platform's normal or natural (flipped)
/// setting. When flipped, positive values still mean "away from the user" in
/// SDL's convention, so consumers multiply by -1 to recover physical motion.
pub const WheelDirection = enum(u32) {
    normal,
    flipped,
};

pub const MouseWheel = struct {
    timestamp: u64 = 0,
    window_id: WindowId = .none,
    mouse_id: MouseId = .global,
    /// Scroll amounts, or the whole-tick amounts when integer wheel mode is on.
    x: f32 = 0,
    y: f32 = 0,
    direction: WheelDirection = .normal,
    mouse_x: f32 = 0,
    mouse_y: f32 = 0,
    integer_x: i32 = 0,
    integer_y: i32 = 0,
};

pub const MouseDeviceKind = enum(u32) {
    added = 0x404,
    removed = 0x405,
};

pub const MouseDevice = struct {
    kind: MouseDeviceKind,
    timestamp: u64 = 0,
    mouse_id: MouseId = .global,
};

pub const FingerKind = enum(u32) {
    down = 0x700,
    up,
    motion,
    canceled,
};

/// Touch contact event. Coordinates are normalized to 0..1 of the window;
/// `dx`/`dy` are normalized deltas and are zero for down, up and canceled.
pub const Finger = struct {
    kind: FingerKind,
    timestamp: u64 = 0,
    window_id: WindowId = .none,
    touch_id: TouchId = .none,
    finger_id: FingerId = .none,
    x: f32 = 0,
    y: f32 = 0,
    dx: f32 = 0,
    dy: f32 = 0,
    pressure: f32 = 0,
};

pub const PinchKind = enum(u32) {
    begin = 0x710,
    update,
    end,
};

/// Multi-finger pinch. `span_*` and `focus_*` are window coordinates, or -1 when
/// the platform does not provide them.
pub const Pinch = struct {
    kind: PinchKind,
    timestamp: u64 = 0,
    window_id: WindowId = .none,
    scale: f32 = 1,
    span_x: f32 = -1,
    span_y: f32 = -1,
    focus_x: f32 = -1,
    focus_y: f32 = -1,
};

/// Clipboard change. `mime_types` is borrowed.
pub const Clipboard = struct {
    timestamp: u64 = 0,
    owner: bool = false,
    mime_types: []const []const u8 = &.{},
};

pub const DropKind = enum(u32) {
    file = 0x1000,
    text,
    begin,
    complete,
    position,
};

/// Drag-and-drop event. `source` and `data` are borrowed; `data` carries the
/// file name or dropped text and is null for begin, complete and position.
pub const Drop = struct {
    kind: DropKind,
    timestamp: u64 = 0,
    window_id: WindowId = .none,
    x: f32 = 0,
    y: f32 = 0,
    source: ?[]const u8 = null,
    data: ?[]const u8 = null,
};

pub const PenProximityKind = enum(u32) {
    entered = 0x1300,
    left,
};

/// A pen entering or leaving sensing range (SDL_EVENT_PEN_PROXIMITY_IN/OUT).
pub const PenProximity = struct {
    kind: PenProximityKind,
    timestamp: u64 = 0,
    window_id: WindowId = .none,
    pen_id: PenId = .none,
    state: pen.InputFlags = .{},
    device_type: pen.DeviceType = .unknown,
};

pub const PenMotion = struct {
    timestamp: u64 = 0,
    window_id: WindowId = .none,
    pen_id: PenId = .none,
    state: pen.InputFlags = .{},
    x: f32 = 0,
    y: f32 = 0,
    device_type: pen.DeviceType = .unknown,
};

pub const PenTouchKind = enum(u32) {
    down = 0x1302,
    up,
};

/// Pen tip contact changes. `eraser` is true when the eraser end is in use.
pub const PenTouch = struct {
    kind: PenTouchKind,
    timestamp: u64 = 0,
    window_id: WindowId = .none,
    pen_id: PenId = .none,
    state: pen.InputFlags = .{},
    x: f32 = 0,
    y: f32 = 0,
    eraser: bool = false,
    device_type: pen.DeviceType = .unknown,
};

pub const PenButtonKind = enum(u32) {
    down = 0x1304,
    up,
};

/// Barrel or side button on the pen. Buttons are numbered from 1.
pub const PenButton = struct {
    kind: PenButtonKind,
    timestamp: u64 = 0,
    window_id: WindowId = .none,
    pen_id: PenId = .none,
    state: pen.InputFlags = .{},
    x: f32 = 0,
    y: f32 = 0,
    button: u8,
    device_type: pen.DeviceType = .unknown,
};

pub const PenAxisEvent = struct {
    timestamp: u64 = 0,
    window_id: WindowId = .none,
    pen_id: PenId = .none,
    state: pen.InputFlags = .{},
    x: f32 = 0,
    y: f32 = 0,
    axis: pen.Axis,
    value: f32 = 0,
    device_type: pen.DeviceType = .unknown,
};

/// Application-defined event. `code` must lie in the user range
/// (`user_code_first` through `user_code_last`) and is chosen by the
/// application, typically via `Queue.registerUserEvents`.
pub const User = struct {
    code: u32,
    timestamp: u64 = 0,
    window_id: WindowId = .none,
    value: i32 = 0,
    /// Opaque application tokens, for example indices into the application's own
    /// tables. They are not pointers and the library never dereferences them.
    data1: usize = 0,
    data2: usize = 0,
};

/// First and last SDL_EVENT_USER-range codes.
pub const user_code_first: u32 = 0x8000;
pub const user_code_last: u32 = 0xFFFF;

/// Every event the library models. Use `code()` for the SDL numeric type and
/// `timestamp()` for the caller-supplied time.
pub const Event = union(enum) {
    quit: Common,
    app: App,
    display: Display,
    window: Window,
    render: Render,
    key: Key,
    text_editing: TextEditing,
    text_editing_candidates: TextEditingCandidates,
    text_input: TextInput,
    keyboard_device: KeyboardDevice,
    keymap_changed: Common,
    screen_keyboard: ScreenKeyboard,
    mouse_motion: MouseMotion,
    mouse_button: MouseButton,
    mouse_wheel: MouseWheel,
    mouse_device: MouseDevice,
    finger: Finger,
    pinch: Pinch,
    clipboard: Clipboard,
    drop: Drop,
    pen_proximity: PenProximity,
    pen_motion: PenMotion,
    pen_touch: PenTouch,
    pen_button: PenButton,
    pen_axis: PenAxisEvent,
    user: User,

    /// SDL numeric event type. Equal for every event of one kind; user events
    /// return their application code.
    pub fn code(self: Event) u32 {
        return switch (self) {
            .quit => 0x100,
            .app => |e| @backingInt(e.kind),
            .display => |e| @backingInt(e.kind),
            .window => |e| @backingInt(e.kind),
            .render => |e| @backingInt(e.kind),
            .key => |e| @backingInt(e.kind),
            .text_editing => 0x302,
            .text_editing_candidates => 0x307,
            .text_input => 0x303,
            .keyboard_device => |e| @backingInt(e.kind),
            .keymap_changed => 0x304,
            .screen_keyboard => |e| @backingInt(e.kind),
            .mouse_motion => 0x400,
            .mouse_button => |e| @backingInt(e.kind),
            .mouse_wheel => 0x403,
            .mouse_device => |e| @backingInt(e.kind),
            .finger => |e| @backingInt(e.kind),
            .pinch => |e| @backingInt(e.kind),
            .clipboard => 0x900,
            .drop => |e| @backingInt(e.kind),
            .pen_proximity => |e| @backingInt(e.kind),
            .pen_motion => 0x1306,
            .pen_touch => |e| @backingInt(e.kind),
            .pen_button => |e| @backingInt(e.kind),
            .pen_axis => 0x1307,
            .user => |e| e.code,
        };
    }

    /// Caller-supplied timestamp in nanoseconds (zero when unset).
    pub fn timestamp(self: Event) u64 {
        return switch (self) {
            inline else => |payload| payload.timestamp,
        };
    }

    /// True for application-defined event types.
    pub fn is_user(self: Event) bool {
        return self.code() >= user_code_first;
    }

    /// True for the lifecycle kinds SDL never queues: `terminating`, `low_memory`
    /// and the background/foreground transitions. SDL_SendAppEvent hands these to
    /// event watchers inside the call (see `queue.Queue.send_app_event`), and
    /// `locale_changed` and `system_theme_changed` are queued like any other event.
    pub fn is_app_lifecycle(self: Event) bool {
        return switch (self) {
            .app => |e| switch (e.kind) {
                .terminating,
                .low_memory,
                .will_enter_background,
                .did_enter_background,
                .will_enter_foreground,
                .did_enter_foreground,
                => true,
                .locale_changed, .system_theme_changed => false,
            },
            else => false,
        };
    }
};

/// Up to `capacity` events produced by one input call. Touch and pen calls can
/// emit several events (for example a cancel followed by a down, plus synthetic
/// mouse events); the inline buffer keeps producers allocation-free.
pub const Batch = struct {
    pub const capacity = 8;

    items: [capacity]Event = undefined,
    len: usize = 0,

    /// Appends an event, or does nothing for null. Overflow is a programming
    /// error, not a runtime condition.
    pub fn push(self: *Batch, maybe_event: ?Event) void {
        const ev = maybe_event orelse return;
        std.debug.assert(self.len < capacity);
        self.items[self.len] = ev;
        self.len += 1;
    }

    pub fn slice(self: *const Batch) []const Event {
        return self.items[0..self.len];
    }
};

comptime {
    // Spot checks against SDL_events.h values; a change there must change here.
    std.debug.assert(@backingInt(WindowKind.settings_changed) == 0x21B);
    std.debug.assert(@backingInt(DisplayKind.usable_bounds_changed) == 0x158);
    std.debug.assert(@backingInt(PinchKind.end) == 0x712);
    std.debug.assert(@backingInt(PenTouchKind.up) == 0x1303);
    std.debug.assert(@backingInt(DropKind.position) == 0x1004);
}
