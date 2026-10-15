//! Backend-independent window state machine.
//! Altered native port of the window bookkeeping in SDL_video.c, SDL_sysvideo.h
//! and SDL_windowevents.c (SDL_SendWindowEvent). It stores what SDL keeps for a
//! window regardless of platform: state flags, requested versus applied geometry,
//! constraints, fullscreen intent, pending state while hidden, and the rules that
//! decide whether a state change is reported.
//!
//! Backends (X11, Wayland) own the native window and call into this model with
//! what the platform reported. The model never performs I/O and never queues
//! events. Methods return the typed `event.Window` payload to publish, or null
//! when the change is a duplicate. The caller stamps timestamps, dispatches
//! watchers and pushes the events to its queue in the order returned.
//!
//! Follow-up hooks: SDL runs hooks such as "after shown, apply pending flags"
//! inside SDL_SendWindowEvent. Here the caller runs them after `send`, in the
//! order documented on each method, so that no hidden callbacks exist.
//!
//! Deliberate differences from SDL:
//! - Window parents and popup chains are not modeled. `Flags.tooltip` and
//!   `Flags.popup_menu` only mark popup behavior (no state is inherited).
//! - Opacity, safe areas, HDR state, grabs that depend on focus routing and
//!   window surfaces are outside this slice.
//! - Positions and sizes use i32 rectangles from geometry.zig. Sizes are not
//!   negative in valid requests; `request_size` rejects them.
const std = @import("std");
const event = @import("../events/event.zig");
const geometry = @import("geometry.zig");
const display = @import("display.zig");

/// Integer pixel rectangle. Position is `x,y`; size is `width,height`.
pub const Rect = geometry.Rect(i32);
/// Integer pixel point.
pub const Point = geometry.Point(i32);

/// Window state flags with SDL's bit positions (SDL_WindowFlags). Bits 22..27
/// and 32..63 are reserved and always zero.
pub const Flags = packed struct(u64) {
    fullscreen: bool = false,
    opengl: bool = false,
    occluded: bool = false,
    hidden: bool = false,
    borderless: bool = false,
    resizable: bool = false,
    minimized: bool = false,
    maximized: bool = false,
    mouse_grabbed: bool = false,
    input_focus: bool = false,
    mouse_focus: bool = false,
    external: bool = false,
    modal: bool = false,
    high_pixel_density: bool = false,
    mouse_capture: bool = false,
    mouse_relative_mode: bool = false,
    always_on_top: bool = false,
    utility: bool = false,
    tooltip: bool = false,
    popup_menu: bool = false,
    keyboard_grabbed: bool = false,
    fill_document: bool = false,
    reserved_low: u6 = 0,
    vulkan: bool = false,
    metal: bool = false,
    transparent: bool = false,
    not_focusable: bool = false,
    reserved_high: u32 = 0,

    /// True for tooltip and popup-menu windows, which SDL treats as subordinate.
    pub fn is_popup(self: Flags) bool {
        return self.tooltip or self.popup_menu;
    }
};

/// Direction of a fullscreen transition (SDL_FullscreenOp).
pub const FullscreenOp = enum { leave, enter, update };

/// Platform capabilities that change which fullscreen notifications are sent.
/// `sends_dimensions`: the platform reports fullscreen size itself (SDL_SendsFullscreenDimensions).
/// `has_fullscreen_hook`: the platform implements a fullscreen request (SetWindowFullscreen).
pub const FullscreenBackend = struct {
    sends_dimensions: bool = false,
    has_fullscreen_hook: bool = true,
};

/// Plan for a fullscreen transition. The caller switches the display mode to
/// `mode` (null restores the desktop mode), asks the platform for the transition,
/// then reports the result through `fullscreen_dimensions`.
pub const FullscreenStep = struct {
    op: FullscreenOp,
    mode: ?display.Mode,
};

/// Events from a fullscreen transition's geometry update (SDL's MOVED / RESIZED
/// pair). `check_resize` means the size did not change and the caller should run
/// the resize follow-ups (`check_pixel_size`), as SDL_OnWindowResized does.
pub const Dimensions = struct {
    moved: ?event.Window = null,
    resized: ?event.Window = null,
    check_resize: bool = false,
};

/// Events produced by a pixel-size check (SDL_CheckWindowPixelSizeChanged).
pub const PixelNotice = struct {
    pixel_size: ?event.Window = null,
    display_scale: ?event.Window = null,
};

/// Initial minimize-on-focus-loss policy (SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS).
pub const MinimizeOnFocusLoss = enum {
    /// Minimize exclusive fullscreen windows, unless the mode switch is emulated.
    auto,
    always,
    never,
};

/// A requested window coordinate (SDL_SetWindowPosition's encodings).
pub const Axis = union(enum) {
    /// Explicit coordinate in desktop space.
    value: i32,
    /// Keep the stored windowed coordinate (SDL_WINDOWPOS_UNDEFINED).
    undefined_position,
    /// Center within a display; `none` picks the display of the window.
    centered: event.DisplayId,
};

/// Display context for centering. The caller resolves the target display and its
/// usable area with display.zig before calling `request_position`.
pub const Centering = struct {
    display: event.DisplayId,
    usable: Rect,
    full: Rect,
};

/// Flags a window must apply after showing or creation (SDL's ApplyWindowFlags).
/// Fullscreen is applied through `request_fullscreen`, and the others through
/// the matching requests, in the order given by the fields.
pub const ApplyActions = struct {
    restore: bool = false,
    maximize: bool = false,
    fullscreen: bool = false,
    minimize: bool = false,
    modal: bool = false,
    mouse_grab: bool = false,
    keyboard_grab: bool = false,

    /// Derives the actions for a flag set. Popups apply nothing.
    pub fn from_flags(flags: Flags) ApplyActions {
        if (flags.is_popup()) return .{};
        return .{
            .restore = !(flags.minimized or flags.maximized),
            .maximize = flags.maximized,
            .fullscreen = flags.fullscreen,
            .minimize = flags.minimized,
            .modal = flags.modal,
            .mouse_grab = flags.mouse_grabbed,
            .keyboard_grab = flags.keyboard_grabbed,
        };
    }
};

/// Whether a window request went to the platform now or was deferred until show.
pub const RequestResult = enum { platform, deferred };

/// Errors from geometry and state requests.
pub const Error = error{ InvalidSize, InvalidConstraint, NotResizable };

/// Pixel size of a window at a given pixel density.
pub const PixelSize = struct { width: i32, height: i32 };

/// Full state of one window. Create with `init`; it owns no resources.
pub const State = struct {
    id: event.WindowId,
    /// Geometry as the platform last reported it.
    current: Rect,
    /// Geometry to return to when leaving fullscreen (updated outside fullscreen).
    windowed: Rect,
    /// Geometry of the base state: not fullscreen, maximized or tiled.
    floating: Rect,
    /// Last requested geometry, valid while `last_size_pending` or
    /// `last_position_pending` is set.
    pending: Rect,
    /// Size constraints. Zero means "no limit".
    min_width: i32 = 0,
    min_height: i32 = 0,
    max_width: i32 = 0,
    max_height: i32 = 0,
    /// Width / height limits. Zero means "no constraint".
    min_aspect: f32 = 0,
    max_aspect: f32 = 0,
    last_pixel_width: i32 = 0,
    last_pixel_height: i32 = 0,
    flags: Flags = .{},
    /// Flags to apply once the window is shown again.
    pending_flags: Flags = .{},
    display_scale: f32 = 1,
    display_id: event.DisplayId = .none,
    pending_display_id: event.DisplayId = .none,
    /// Exclusive fullscreen is in use (a mode switch, not a desktop fullscreen).
    fullscreen_exclusive: bool = false,
    last_fullscreen_exclusive_display: event.DisplayId = .none,
    requested_fullscreen: display.FullscreenMode = .desktop,
    current_fullscreen: display.FullscreenMode = .desktop,
    /// The platform marked this window as tiled; size changes are not cached.
    tiled: bool = false,
    /// Position was never requested, so the platform's value is authoritative.
    undefined_x: bool = true,
    undefined_y: bool = true,
    last_position_pending: bool = false,
    last_size_pending: bool = false,
    update_fullscreen_on_display_changed: bool = false,
    is_hiding: bool = false,
    is_destroying: bool = false,
    /// Set when a parent hide hid this window and it should reappear with it.
    restore_on_show: bool = false,

    /// Creates a window at `rect` with the given initial flags. Geometry starts
    /// in every slot so the first report compares against a known value.
    pub fn init(id: event.WindowId, rect: Rect, flags: Flags) State {
        return .{
            .id = id,
            .current = rect,
            .windowed = rect,
            .floating = rect,
            .pending = rect,
            .flags = flags,
        };
    }

    /// Whether a fullscreen window is on screen (SDL_WINDOW_FULLSCREEN_VISIBLE).
    /// A hidden or minimized fullscreen window must not hold a display mode.
    pub fn fullscreen_visible(self: State) bool {
        return self.flags.fullscreen and !self.flags.hidden and !self.flags.minimized;
    }

    /// Applies one platform event to the state and decides whether to publish it.
    /// Returns null when the event repeats the current state, so duplicate
    /// reports never reach a consumer. A window being destroyed publishes only
    /// `destroyed`. The state update itself is applied before that check, as
    /// SDL does.
    ///
    /// Callers must call `check_pixel_size` after a `resized` report, even when
    /// `send` returns null, because SDL runs that check unconditionally.
    pub fn send(self: *State, kind: event.WindowKind, data1: i32, data2: i32) ?event.Window {
        const changed = self.apply(kind, data1, data2);
        if (!changed) return null;
        if (self.is_destroying and kind != .destroyed) return null;
        return .{ .kind = kind, .window_id = self.id, .data1 = data1, .data2 = data2 };
    }

    /// State update for each event kind. Returns false when nothing changed,
    /// which suppresses publication. Kinds without modeled state always return
    /// true.
    fn apply(self: *State, kind: event.WindowKind, data1: i32, data2: i32) bool {
        switch (kind) {
            .shown => {
                if (!self.flags.hidden) return false;
                self.flags.hidden = false;
                self.flags.minimized = false;
            },
            .hidden => {
                if (self.flags.hidden) return false;
                self.flags.hidden = true;
            },
            .exposed => self.flags.occluded = false,
            .moved => {
                self.undefined_x = false;
                self.undefined_y = false;
                // A move that was not requested clears the pending display, unless the
                // window is about to become fullscreen when shown.
                if (!self.last_position_pending and !self.pending_flags.fullscreen) self.pending_display_id = .none;
                self.last_position_pending = false;
                if (!self.flags.fullscreen) {
                    self.windowed.x = data1;
                    self.windowed.y = data2;
                    if (!self.flags.maximized and !self.tiled) {
                        self.floating.x = data1;
                        self.floating.y = data2;
                    }
                }
                if (data1 == self.current.x and data2 == self.current.y) return false;
                self.current.x = data1;
                self.current.y = data2;
            },
            .resized => {
                self.last_size_pending = false;
                if (!self.flags.fullscreen) {
                    self.windowed.width = data1;
                    self.windowed.height = data2;
                    if (!self.flags.maximized and !self.tiled) {
                        self.floating.width = data1;
                        self.floating.height = data2;
                    }
                }
                if (data1 == self.current.width and data2 == self.current.height) return false;
                self.current.width = data1;
                self.current.height = data2;
            },
            .pixel_size_changed => {
                if (data1 == self.last_pixel_width and data2 == self.last_pixel_height) return false;
                self.last_pixel_width = data1;
                self.last_pixel_height = data2;
            },
            .minimized => {
                if (self.flags.minimized) return false;
                self.flags.maximized = false;
                self.flags.minimized = true;
            },
            .maximized => {
                if (self.flags.maximized) return false;
                self.flags.minimized = false;
                self.flags.maximized = true;
            },
            .restored => {
                if (!(self.flags.minimized or self.flags.maximized)) return false;
                self.flags.minimized = false;
                self.flags.maximized = false;
            },
            .mouse_enter => {
                if (self.flags.mouse_focus) return false;
                self.flags.mouse_focus = true;
            },
            .mouse_leave => {
                if (!self.flags.mouse_focus) return false;
                self.flags.mouse_focus = false;
            },
            .focus_gained => {
                if (self.flags.input_focus) return false;
                self.flags.input_focus = true;
            },
            .focus_lost => {
                if (!self.flags.input_focus) return false;
                self.flags.input_focus = false;
            },
            .display_changed => {
                const id = display_from_data(data1);
                if (id == .none or id == self.display_id) return false;
                self.update_fullscreen_on_display_changed = true;
                self.display_id = id;
            },
            .occluded => {
                if (self.flags.occluded) return false;
                self.flags.occluded = true;
            },
            .enter_fullscreen => {
                if (self.flags.fullscreen) return false;
                self.flags.fullscreen = true;
            },
            .leave_fullscreen => {
                if (!self.flags.fullscreen) return false;
                self.flags.fullscreen = false;
            },
            else => {},
        }
        return true;
    }

    /// Publishes a display change reported by the platform. Equivalent to
    /// `send(.display_changed, ...)` with the id carried in `data1`.
    pub fn display_changed(self: *State, id: event.DisplayId) ?event.Window {
        return self.send(.display_changed, display_to_data(id), 0);
    }

    /// Continuation after a `shown` event: the flags that must be applied now,
    /// with pending flags cleared (SDL_OnWindowShown → ApplyWindowFlags).
    /// The caller performs the returned actions in order: restore, maximize,
    /// fullscreen (via `request_fullscreen`), minimize, modal, grabs.
    pub fn take_shown_actions(self: *State) ApplyActions {
        const actions = ApplyActions.from_flags(self.pending_flags);
        self.pending_flags = .{};
        return actions;
    }

    /// Continuation after a `hidden` report: fullscreen and maximized state are
    /// remembered for restoration, and the fullscreen transition must be left.
    /// Returns the transition plan (always `leave`), for the caller to run.
    pub fn after_hidden(self: *State) FullscreenStep {
        self.pending_flags.fullscreen = self.pending_flags.fullscreen or self.flags.fullscreen;
        self.pending_flags.maximized = self.pending_flags.maximized or self.flags.maximized;
        return self.begin_fullscreen_update(.leave);
    }

    /// Starts hiding a window. Returns false when it is already hidden, in which
    /// case the caller skips the platform call. While hiding, fullscreen updates
    /// are forced to `leave`. The caller calls the platform, then `finish_hide`.
    pub fn begin_hide(self: *State) bool {
        if (self.flags.hidden) {
            self.restore_on_show = false;
            return false;
        }
        const mask: Flags = .{ .maximized = true, .minimized = true, .fullscreen = true, .keyboard_grabbed = true, .mouse_grabbed = true };
        self.pending_flags = @bitCast(@as(u64, @bitCast(self.flags)) & @as(u64, @bitCast(mask)));
        self.is_hiding = true;
        return true;
    }

    /// Completes hiding after the platform call. Publishes `hidden` and runs
    /// `after_hidden`; the returned step is the fullscreen leave to perform.
    pub fn finish_hide(self: *State) struct { event: ?event.Window, step: FullscreenStep } {
        self.is_hiding = false;
        const published = self.send(.hidden, 0, 0);
        return .{ .event = published, .step = self.after_hidden() };
    }

    /// Requests a show. Returns false when the window is already visible. The
    /// caller then calls the platform, and afterwards reports `shown` and calls
    /// `take_shown_actions`.
    pub fn begin_show(self: *State) bool {
        return self.flags.hidden;
    }

    /// Requests maximization. While hidden, the request is stored in pending
    /// flags. A window that is not resizable cannot be maximized.
    pub fn maximize(self: *State) Error!RequestResult {
        if (!self.flags.resizable) return error.NotResizable;
        if (self.flags.hidden) {
            self.pending_flags.maximized = true;
            return .deferred;
        }
        return .platform;
    }

    /// Requests minimization. While hidden, the request is stored in pending flags.
    pub fn minimize(self: *State) RequestResult {
        if (self.flags.hidden) {
            self.pending_flags.minimized = true;
            return .deferred;
        }
        return .platform;
    }

    /// Requests restoration from maximized or minimized. While hidden, the
    /// request clears the stored pending flags.
    pub fn restore(self: *State) RequestResult {
        if (self.flags.hidden) {
            self.pending_flags.maximized = false;
            self.pending_flags.minimized = false;
            return .deferred;
        }
        return .platform;
    }

    /// Continuation after a `minimized` report. Leaves fullscreen when the window
    /// was fullscreen, because a minimized fullscreen window must release its mode.
    pub fn after_minimized(self: *State) ?FullscreenStep {
        if (!self.flags.fullscreen) return null;
        return self.begin_fullscreen_update(.leave);
    }

    /// Continuation after a `restored` report. Re-enters fullscreen when the window
    /// is fullscreen again.
    pub fn after_restored(self: *State) ?FullscreenStep {
        if (!self.flags.fullscreen) return null;
        return self.begin_fullscreen_update(.enter);
    }

    /// Continuation after a `focus_lost` report: returns true when the window
    /// should be minimized. Only fullscreen windows are minimized, so their mode
    /// is restored. Under `auto`, exclusive fullscreen qualifies, unless the mode
    /// switch is emulated by the platform.
    pub fn should_minimize_on_focus_loss(self: State, policy: MinimizeOnFocusLoss, mode_switch_emulated: bool) bool {
        if (!self.flags.fullscreen or self.is_destroying) return false;
        return switch (policy) {
            .auto => self.fullscreen_exclusive and !mode_switch_emulated,
            .always => true,
            .never => false,
        };
    }

    /// Requests a fullscreen change (SDL_SetWindowFullscreen). Entering copies the
    /// requested mode to the current one. While hidden, the request is stored in
    /// pending flags and no platform work runs. Otherwise returns the transition
    /// to perform. Failed platform transitions must call `fail_fullscreen`.
    pub fn request_fullscreen(self: *State, fullscreen: bool) ?FullscreenStep {
        if (self.flags.hidden) {
            self.pending_flags.fullscreen = fullscreen;
            return null;
        }
        if (fullscreen) {
            self.current_fullscreen = self.requested_fullscreen;
        } else {
            self.current_fullscreen = .desktop;
        }
        return self.begin_fullscreen_update(if (fullscreen) .enter else .leave);
    }

    /// Sets the requested fullscreen mode and copies it to the current mode
    /// (SDL_SetWindowFullscreenMode). Validate `mode` against the display's list
    /// with `ModeList.match` first. Returns true when the fullscreen update must run
    /// now, which the caller does with `begin_fullscreen_update(.update)`.
    pub fn set_fullscreen_mode(self: *State, mode: display.FullscreenMode) bool {
        self.requested_fullscreen = mode;
        self.current_fullscreen = mode;
        return self.fullscreen_visible();
    }

    /// Clears the current fullscreen mode after a failed enter (SDL_SetWindowFullscreen).
    pub fn fail_fullscreen(self: *State) void {
        self.current_fullscreen = .desktop;
    }

    /// Starts a fullscreen update (SDL_UpdateFullscreenMode, bookkeeping part).
    /// Clears `fullscreen_exclusive`, and forces `leave` while the window is being
    /// destroyed or hidden. For enter and update, an exclusive current mode selects
    /// the display mode to switch to. The caller performs the mode switch and the
    /// platform transition, then calls `finish_fullscreen_update`.
    pub fn begin_fullscreen_update(self: *State, requested: FullscreenOp) FullscreenStep {
        self.fullscreen_exclusive = false;
        self.update_fullscreen_on_display_changed = false;
        const op: FullscreenOp = if (self.is_destroying or self.is_hiding) .leave else requested;
        if (op == .leave) return .{ .op = op, .mode = null };
        return switch (self.current_fullscreen) {
            .exclusive => |mode| blk: {
                self.fullscreen_exclusive = true;
                break :blk .{ .op = op, .mode = mode };
            },
            .desktop => .{ .op = op, .mode = null },
        };
    }

    /// Finishes a fullscreen update after the platform call. Records the display
    /// used for an exclusive mode (`last_fullscreen_exclusive_display`), so a
    /// later move can restore it. The caller then reports dimensions through
    /// `fullscreen_dimensions`.
    pub fn finish_fullscreen_update(self: *State, display_id: ?event.DisplayId) void {
        const exclusive = self.flags.fullscreen and self.fullscreen_exclusive;
        self.last_fullscreen_exclusive_display = if (display_id != null and exclusive) display_id.? else .none;
    }

    /// Dimension reports after a fullscreen transition (the MOVED and RESIZED tail
    /// of SDL_UpdateFullscreenMode).
    ///
    /// On enter, `bounds` is the display's bounds and `size` is the mode size or
    /// the desktop size. On leave, both are ignored and the windowed geometry is
    /// used. Nothing is sent for a leave while the window is still fullscreen,
    /// or for an enter that did not reach fullscreen. Platforms that report
    /// dimensions themselves get no events here.
    pub fn fullscreen_dimensions(self: *State, op: FullscreenOp, backend: FullscreenBackend, bounds: Rect, size: PixelSize) Dimensions {
        if (backend.sends_dimensions) return .{};
        switch (op) {
            .leave => {
                if (self.flags.fullscreen) return .{};
                const moved = self.send(.moved, self.windowed.x, self.windowed.y);
                if (!backend.has_fullscreen_hook) {
                    return .{ .moved = moved, .resized = self.send(.resized, self.windowed.width, self.windowed.height) };
                }
                return .{ .moved = moved, .check_resize = true };
            },
            .enter, .update => {
                if (!self.flags.fullscreen) return .{};
                const resized = !backend.has_fullscreen_hook or size.width != self.current.width or size.height != self.current.height;
                const moved = self.send(.moved, bounds.x, bounds.y);
                if (resized) return .{ .moved = moved, .resized = self.send(.resized, size.width, size.height) };
                return .{ .moved = moved, .check_resize = true };
            },
        }
    }

    /// Re-targets an exclusive fullscreen window after it moved to another display
    /// (SDL_OnWindowDisplayChanged). `closest` is the display's closest mode for
    /// the requested size (see `Display.closest_fullscreen_mode`). It is adopted only
    /// when `match_on_move` is set and its size equals the requested size; otherwise
    /// the window falls back to borderless desktop fullscreen. Returns true when the
    /// fullscreen update must run again (`begin_fullscreen_update(.update)`).
    pub fn retarget_fullscreen(self: *State, closest: ?display.Mode, match_on_move: bool) bool {
        if (!self.update_fullscreen_on_display_changed or !self.flags.fullscreen) return false;
        self.current_fullscreen = .desktop;
        if (match_on_move) switch (self.requested_fullscreen) {
            .exclusive => |requested| if (closest) |found| {
                if (found.width == requested.width and found.height == requested.height) {
                    self.current_fullscreen = .{ .exclusive = found };
                }
            },
            .desktop => {},
        };
        return self.fullscreen_visible();
    }

    /// Records a new size request (SDL_SetWindowSize). The request is constrained
    /// by aspect ratio first, then by the minimum and maximum sizes, which take
    /// precedence over the aspect ratio. Returns the constrained pending size.
    pub fn request_size(self: *State, width: i32, height: i32) Error!Rect {
        if (width <= 0 or height <= 0) return error.InvalidSize;
        const constrained = self.constrain(width, height);
        self.last_size_pending = true;
        self.pending.width = constrained.width;
        self.pending.height = constrained.height;
        return self.pending;
    }

    /// Size after aspect ratio, then minimum and maximum limits (SDL_SetWindowSize
    /// math). The aspect step uses f32 arithmetic and rounds to the nearest
    /// integer, matching SDL_roundf.
    pub fn constrain(self: State, width: i32, height: i32) PixelSize {
        var w = width;
        var h = height;
        const new_aspect = @as(f32, @floatFromInt(w)) / @as(f32, @floatFromInt(h));
        if (self.max_aspect > 0 and new_aspect > self.max_aspect) {
            w = std.math.lossyCast(i32, @round(@as(f32, @floatFromInt(h)) * self.max_aspect));
        } else if (self.min_aspect > 0 and new_aspect < self.min_aspect) {
            h = std.math.lossyCast(i32, @round(@as(f32, @floatFromInt(w)) / self.min_aspect));
        }
        if (self.min_width != 0 and w < self.min_width) w = self.min_width;
        if (self.max_width != 0 and w > self.max_width) w = self.max_width;
        if (self.min_height != 0 and h < self.min_height) h = self.min_height;
        if (self.max_height != 0 and h > self.max_height) h = self.max_height;
        return .{ .width = w, .height = h };
    }

    /// Sets the aspect ratio limits as width/height (SDL_SetWindowAspectRatio). Zero
    /// disables a limit. Then re-applies the size constraints to the base size, the
    /// pending size when one is requested, and the floating size otherwise.
    pub fn set_aspect_ratio(self: *State, min_aspect: f32, max_aspect: f32) Error!Rect {
        self.min_aspect = min_aspect;
        self.max_aspect = max_aspect;
        return self.reconstrain();
    }

    /// Sets the minimum size (SDL_SetWindowMinimumSize). Zero means no minimum.
    pub fn set_minimum_size(self: *State, width: i32, height: i32) Error!Rect {
        if (width < 0 or height < 0) return error.InvalidConstraint;
        if ((self.max_width != 0 and width > self.max_width) or (self.max_height != 0 and height > self.max_height)) return error.InvalidConstraint;
        self.min_width = width;
        self.min_height = height;
        return self.reconstrain();
    }

    /// Sets the maximum size (SDL_SetWindowMaximumSize). Zero means no maximum.
    pub fn set_maximum_size(self: *State, width: i32, height: i32) Error!Rect {
        if (width < 0 or height < 0) return error.InvalidConstraint;
        if ((self.min_width != 0 and width < self.min_width) or (self.min_height != 0 and height < self.min_height)) return error.InvalidConstraint;
        self.max_width = width;
        self.max_height = height;
        return self.reconstrain();
    }

    /// Re-applies constraints to the most recent size that was requested or
    /// reported. Used when a limit changes.
    fn reconstrain(self: *State) Error!Rect {
        const base = if (self.last_size_pending) self.pending else self.floating;
        return self.request_size(base.width, base.height);
    }

    /// Records a position request (SDL_SetWindowPosition). Undefined axes keep the
    /// windowed coordinate. A centered axis places the window in `centering.usable`
    /// when it fits there, and in `centering.full` otherwise; integer division
    /// truncates toward zero as in C. `origin_display` is the display whose origin
    /// matches an absolute request, if any, and it becomes the pending display.
    /// Asynchronous platforms also update the windowed and floating
    /// positions in fullscreen, as SDL does without SyncWindow.
    pub fn request_position(self: *State, x: Axis, y: Axis, centering: ?Centering, origin_display: ?event.DisplayId, asynchronous: bool) Error!Point {
        const size_w = if (self.last_size_pending) self.pending.width else self.windowed.width;
        const size_h = if (self.last_size_pending) self.pending.height else self.windowed.height;
        const centered_axis = x == .centered or y == .centered;
        var target: Rect = .{ .x = 0, .y = 0, .width = 0, .height = 0 };
        if (centered_axis) {
            const centering_target = centering orelse return error.InvalidConstraint;
            target = if (size_w > centering_target.usable.width or size_h > centering_target.usable.height) centering_target.full else centering_target.usable;
            self.pending_display_id = centering_target.display;
        } else {
            self.pending_display_id = origin_display orelse .none;
        }
        const result: Point = .{
            .x = resolve_axis(x, self.windowed.x, target.x, target.width, size_w),
            .y = resolve_axis(y, self.windowed.y, target.y, target.height, size_h),
        };
        self.pending.x = result.x;
        self.pending.y = result.y;
        if (asynchronous and self.flags.fullscreen) {
            self.floating.x = result.x;
            self.floating.y = result.y;
            self.windowed.x = result.x;
            self.windowed.y = result.y;
        }
        self.undefined_x = false;
        self.undefined_y = false;
        self.last_position_pending = true;
        return result;
    }

    /// Sets the window's requested bordered state. Returns true when the platform
    /// must be told (SDL_SetWindowBordered).
    pub fn set_bordered(self: *State, bordered: bool) bool {
        const have = !self.flags.borderless;
        if (bordered == have) return false;
        self.flags.borderless = !bordered;
        return true;
    }

    /// Sets resizability (SDL_SetWindowResizable). Making a window non-resizable
    /// resets the windowed geometry to the floating geometry, as SDL does. Returns
    /// true when the platform must be told.
    pub fn set_resizable(self: *State, resizable: bool) bool {
        if (resizable == self.flags.resizable) return false;
        self.flags.resizable = resizable;
        if (!resizable) self.windowed = self.floating;
        return true;
    }

    /// Pixel size of the window: each dimension multiplied by `density` and rounded
    /// up, as SDL_GetWindowSizeInPixels does with the density of the mode in use.
    pub fn pixel_size(self: State, density: f32) PixelSize {
        return .{
            .width = std.math.lossyCast(i32, @ceil(@as(f32, @floatFromInt(self.current.width)) * density)),
            .height = std.math.lossyCast(i32, @ceil(@as(f32, @floatFromInt(self.current.height)) * density)),
        };
    }

    /// Reports the pixel size after a resize or display change
    /// (SDL_CheckWindowPixelSizeChanged), then the display scale
    /// (SDL_CheckWindowDisplayScaleChanged). The density is the pixel width divided
    /// by the window width. `backend_scale`, when given, replaces the
    /// `density * content_scale` estimate. Display scale is published only on change.
    pub fn check_pixel_size(self: *State, pixel_width: i32, pixel_height: i32, content_scale: f32, backend_scale: ?f32) PixelNotice {
        const size_event = self.send(.pixel_size_changed, pixel_width, pixel_height);
        const scale = backend_scale orelse density_of(pixel_width, self.current.width) * content_scale;
        if (scale == self.display_scale) return .{ .pixel_size = size_event };
        self.display_scale = scale;
        return .{ .pixel_size = size_event, .display_scale = self.send(.display_scale_changed, 0, 0) };
    }

    /// The mode whose size applies to pixel calculations: the current exclusive
    /// mode while fullscreen with a mode switch, otherwise the desktop mode
    /// (SDL_GetWindowSizeInPixels).
    pub fn pixel_mode_is_current(self: State) bool {
        return self.flags.fullscreen and self.current_fullscreen.is_exclusive();
    }
};

/// One axis of a position request. A centered axis uses the target extent and
/// the window size, with truncating division as in C.
fn resolve_axis(axis: Axis, stored: i32, origin: i32, extent: i32, size: i32) i32 {
    return switch (axis) {
        .value => |value| value,
        .undefined_position => stored,
        .centered => origin + @divTrunc(extent - size, 2),
    };
}

/// Stored data word for an event payload carrying a display id (`data1`).
/// Display ids are small, so the u32 to i32 reinterpretation is exact.
fn display_to_data(id: event.DisplayId) i32 {
    return @bitCast(@backingInt(id));
}

/// Inverse of `display_to_data`.
fn display_from_data(data: i32) event.DisplayId {
    return @fromBackingInt(@as(u32, @bitCast(data)));
}

/// Pixel density from a pixel width and a window width (SDL_GetWindowPixelDensity).
fn density_of(pixel_width: i32, window_width: i32) f32 {
    return @as(f32, @floatFromInt(pixel_width)) / @as(f32, @floatFromInt(window_width));
}
