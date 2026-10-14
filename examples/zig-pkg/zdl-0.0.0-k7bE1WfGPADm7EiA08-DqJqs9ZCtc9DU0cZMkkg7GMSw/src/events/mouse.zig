//! Mouse pointer state: per-source button masks, click counting, absolute and
//! relative motion, relative-mode speed scaling, integer-mode residuals and
//! wheel accumulation. Altered native port of SDL_mouse.c (state and event
//! logic only). Each call returns the event it produced; nothing is queued here.
//!
//! Differences from SDL:
//! - No cursors, windows, global mouse list or hint callbacks. The caller passes
//!   `Options` at init and a `Viewport` per motion call (window size and an
//!   optional confine rectangle). Focus is set explicitly with `set_focus`.
//! - Click counting uses the caller's event timestamps (nanoseconds) rather than
//!   SDL_GetTicks, so sequences replay identically.
//! - Buttons are one-based indices 1 to 32, the range of SDL_BUTTON_MASK.
//!   Other indices are rejected with `error.InvalidButton`.
//! - SDL's mouse-to-touch and touch-to-mouse emulation, pen emulation, warp
//!   emulation and system speed-scale callback are not part of this module.
const std = @import("std");
const event = @import("event.zig");

/// One-based button indices for the common buttons (SDL_BUTTON_*).
pub const button = struct {
    pub const left: u8 = 1;
    pub const middle: u8 = 2;
    pub const right: u8 = 3;
    pub const x1: u8 = 4;
    pub const x2: u8 = 5;
};

/// Pressed-button set. Bit `n - 1` is button `n`, matching SDL_BUTTON_MASK,
/// so the named fields are the first five buttons.
pub const Buttons = packed struct(u32) {
    left: bool = false,
    middle: bool = false,
    right: bool = false,
    x1: bool = false,
    x2: bool = false,
    _more: u27 = 0,

    pub const none: Buttons = .{};

    /// Bit mask for one-based `index`, or null when outside 1 to 32.
    pub fn mask(index: u8) ?u32 {
        if (index < 1 or index > 32) return null;
        return @as(u32, 1) << @intCast(index - 1);
    }

    pub fn contains(self: Buttons, index: u8) bool {
        const bit = mask(index) orelse return false;
        return @backingInt(self) & bit != 0;
    }

    pub fn bits(self: Buttons) u32 {
        return @backingInt(self);
    }

    pub fn from_bits(value: u32) Buttons {
        return @fromBackingInt(value);
    }

    pub fn is_empty(self: Buttons) bool {
        return @backingInt(self) == 0;
    }
};

/// Axis-aligned rectangle in window coordinates.
pub const Rect = struct {
    x: i32,
    y: i32,
    w: i32,
    h: i32,
};

/// The window a motion event is constrained to. Pointer positions clamp to
/// `[0, width) x [0, height)`, intersected with `confine` when set, unless the
/// mouse is `captured`.
pub const Viewport = struct {
    window: event.WindowId,
    width: i32,
    height: i32,
    confine: ?Rect = null,
    captured: bool = false,
};

/// Explicit replacement for the SDL_HINT_MOUSE_* and SDL_HINT_TOUCH_MOUSE_EVENTS
/// settings. Defaults match SDL's defaults.
pub const Options = struct {
    /// Maximum time between clicks of a double click, in milliseconds
    /// (SDL_HINT_MOUSE_DOUBLE_CLICK_TIME; SDL's platform default is 500).
    double_click_time_ms: u32 = 500,
    /// Maximum pointer travel between clicks of a double click, in pixels
    /// (SDL_HINT_MOUSE_DOUBLE_CLICK_RADIUS).
    double_click_radius: f32 = 32,
    /// Motion scale outside relative mode (SDL_HINT_MOUSE_NORMAL_SPEED_SCALE).
    normal_speed_scale: f32 = 1,
    /// Motion scale in relative mode (SDL_HINT_MOUSE_RELATIVE_SPEED_SCALE).
    relative_speed_scale: f32 = 1,
    /// Integer motion mode (bit 0 of SDL_MOUSE_INTEGER_MODE). Relative motion
    /// accumulates fractional residuals; absolute positions truncate.
    integer_motion: bool = false,
    /// Integer wheel mode (bit 1 of SDL_MOUSE_INTEGER_MODE). When set, the
    /// wheel event's `x`/`y` carry the whole-tick amounts.
    integer_wheel: bool = false,
    /// Report absolute motion while relative mode is on
    /// (SDL_HINT_MOUSE_RELATIVE_WARP_MOTION).
    relative_warp_motion: bool = false,
    /// Accept touch-derived pointer events from touch devices
    /// (SDL_HINT_TOUCH_MOUSE_EVENTS). When false, events from the touch
    /// pseudo-mouse are dropped.
    touch_mouse_events: bool = true,
};

/// Motion accumulated since the last `take_relative_motion`, or a position.
pub const Motion = struct {
    x: f32,
    y: f32,
};

const Click = struct {
    /// Milliseconds of the last press of this button.
    last_ms: u64 = 0,
    /// Accumulated pointer travel at that press.
    motion_x: f32 = 0,
    motion_y: f32 = 0,
    count: u8 = 0,
};

/// Button state of one input source (one MouseId), with per-button click
/// tracking. Sources are created on first use.
const Source = struct {
    mouse_id: event.MouseId,
    buttons: Buttons = .none,
    clicks: [32]Click = @splat(Click{}),
};

/// Mouse state. Owns its source table and must be deinitialized. Not
/// synchronized: serialize calls from different threads.
pub const Mouse = struct {
    allocator: std.mem.Allocator,
    options: Options,
    sources: std.AutoArrayHashMapUnmanaged(event.MouseId, Source) = .empty,
    focus: event.WindowId = .none,
    relative_mode: bool = false,

    x: f32 = 0,
    y: f32 = 0,
    last_x: f32 = 0,
    last_y: f32 = 0,
    has_position: bool = false,
    /// Motion since the last `take_relative_motion`, unscaled by integer mode.
    x_accu: f32 = 0,
    y_accu: f32 = 0,
    /// Fractional motion carried between events in integer motion mode.
    residual_x: f32 = 0,
    residual_y: f32 = 0,
    /// Fractional wheel travel carried between events.
    residual_scroll_x: f32 = 0,
    residual_scroll_y: f32 = 0,
    /// Pointer travel since the last press, used to decide whether a press
    /// continues a double click.
    click_motion_x: f32 = 0,
    click_motion_y: f32 = 0,

    /// Creates a mouse with no pressed buttons and no position.
    pub fn init(allocator: std.mem.Allocator, options: Options) Mouse {
        return .{ .allocator = allocator, .options = options };
    }

    pub fn deinit(self: *Mouse) void {
        self.sources.deinit(self.allocator);
        self.* = undefined;
    }

    /// Sets the window that subsequent events report as their `window_id`.
    pub fn set_focus(self: *Mouse, window: event.WindowId) void {
        self.focus = window;
    }

    /// Enables or disables relative mode. Relative motion then uses
    /// `relative_speed_scale`, and absolute motion is reported only with
    /// `relative_warp_motion`.
    pub fn set_relative_mode(self: *Mouse, enabled: bool) void {
        self.relative_mode = enabled;
    }

    /// Pressed buttons across all sources, optionally excluding touch-derived
    /// sources (SDL_GetMouseState / SDL_GetGlobalMouseState semantics).
    pub fn button_state(self: *const Mouse, include_touch: bool) Buttons {
        var merged: u32 = 0;
        var it = self.sources.iterator();
        while (it.next()) |entry| {
            if (!include_touch and entry.key_ptr.* == .touch) continue;
            merged |= entry.value_ptr.buttons.bits();
        }
        return Buttons.from_bits(merged);
    }

    /// Position of the pointer, clamped to its last known window.
    pub fn position(self: *const Mouse) Motion {
        return .{ .x = self.x, .y = self.y };
    }

    /// Returns the motion accumulated since the previous call and resets the
    /// accumulator (SDL_GetRelativeMouseState).
    pub fn take_relative_motion(self: *Mouse) Motion {
        const result: Motion = .{ .x = self.x_accu, .y = self.y_accu };
        self.x_accu = 0;
        self.y_accu = 0;
        return result;
    }

    /// Pointer motion from a device. In relative mode `x`/`y` are deltas, which
    /// are scaled and added to the position. Otherwise they are absolute window
    /// coordinates. Returns null when the motion changes nothing or is hidden by
    /// the current mode.
    pub fn motion(
        self: *Mouse,
        timestamp: u64,
        viewport: ?Viewport,
        mouse_id: event.MouseId,
        relative: bool,
        input_x: f32,
        input_y: f32,
    ) ?event.Event {
        if (!self.options.touch_mouse_events and mouse_id == .touch) return null;

        var x = input_x;
        var y = input_y;
        var xrel: f32 = 0;
        var yrel: f32 = 0;

        if (relative) {
            const scale = if (self.relative_mode) self.options.relative_speed_scale else self.options.normal_speed_scale;
            x *= scale;
            y *= scale;
            if (self.options.integer_motion) {
                x = accumulate_whole(&self.residual_x, x);
                y = accumulate_whole(&self.residual_y, y);
            }
            xrel = x;
            yrel = y;
            x = self.last_x + xrel;
            y = self.last_y + yrel;
            self.constrain(viewport, &x, &y);
        } else {
            if (self.options.integer_motion) {
                x = @trunc(x);
                y = @trunc(y);
            }
            self.constrain(viewport, &x, &y);
            if (self.has_position) {
                xrel = x - self.last_x;
                yrel = y - self.last_y;
            }
        }

        if (self.has_position and xrel == 0 and yrel == 0) return null;

        // The first touch of a touch device does not move the pointer relatively.
        if (mouse_id == .touch and self.button_state(true).is_empty()) {
            xrel = 0;
            yrel = 0;
        }

        self.x_accu += xrel;
        self.y_accu += yrel;
        if (relative and self.has_position) {
            self.x += xrel;
            self.y += yrel;
            self.constrain(viewport, &self.x, &self.y);
        } else {
            self.x = x;
            self.y = y;
        }
        self.has_position = true;
        // Keep the unclamped value for absolute motion so a pointer outside
        // the window is reported where it is.
        self.last_x = if (relative) self.x else x;
        self.last_y = if (relative) self.y else y;
        self.click_motion_x += xrel;
        self.click_motion_y += yrel;

        var id = mouse_id;
        if (!self.relative_mode and mouse_id != .touch and mouse_id != .pen) id = .global;

        if (!relative and self.relative_mode) {
            if (!self.options.relative_warp_motion) return null;
            xrel = 0;
            yrel = 0;
        }

        return .{ .mouse_motion = .{
            .timestamp = timestamp,
            .window_id = self.focus,
            .mouse_id = id,
            .buttons = self.button_state(true),
            .x = self.x,
            .y = self.y,
            .xrel = xrel,
            .yrel = yrel,
        } };
    }

    /// Button transition. `clicks` null counts clicks automatically (the normal
    /// case). A value sets the count explicitly and skips counting. Returns null
    /// for ignored or unchanged transitions.
    ///
    /// Error: `InvalidButton` for indices outside 1 to 32, and `OutOfMemory` when
    /// a new source cannot be recorded.
    pub fn button(
        self: *Mouse,
        timestamp: u64,
        mouse_id: event.MouseId,
        button_index: u8,
        down: bool,
        clicks: ?u8,
    ) error{ InvalidButton, OutOfMemory }!?event.Event {
        const bit = Buttons.mask(button_index) orelse return error.InvalidButton;
        if (!self.options.touch_mouse_events and mouse_id == .touch) return null;

        const source = try self.source_for(mouse_id, down, bit);
        const before = source.buttons.bits();
        const after = if (down) before | bit else before & ~bit;
        if (after == before) return null;
        source.buttons = Buttons.from_bits(after);

        const resolved = clicks orelse self.count_click(source, button_index, down, timestamp);

        const id: event.MouseId = if (!self.relative_mode and mouse_id != .touch and mouse_id != .pen)
            .global
        else
            source.mouse_id;

        return .{ .mouse_button = .{
            .kind = if (down) .down else .up,
            .timestamp = timestamp,
            .window_id = self.focus,
            .mouse_id = id,
            .button = button_index,
            .clicks = resolved,
            .x = self.x,
            .y = self.y,
        } };
    }

    /// Wheel scroll. Fractional amounts accumulate across calls; each call
    /// reports whole ticks in `integer_x`/`integer_y`. Zero scrolls are dropped.
    pub fn wheel(
        self: *Mouse,
        timestamp: u64,
        mouse_id: event.MouseId,
        input_x: f32,
        input_y: f32,
        direction: event.WheelDirection,
    ) ?event.Event {
        if (input_x == 0 and input_y == 0) return null;

        const whole_x = accumulate_whole(&self.residual_scroll_x, input_x);
        const whole_y = accumulate_whole(&self.residual_scroll_y, input_y);
        const id: event.MouseId = if (self.relative_mode) mouse_id else .global;

        return .{ .mouse_wheel = .{
            .timestamp = timestamp,
            .window_id = self.focus,
            .mouse_id = id,
            .x = if (self.options.integer_wheel) whole_x else input_x,
            .y = if (self.options.integer_wheel) whole_y else input_y,
            .direction = direction,
            .mouse_x = self.x,
            .mouse_y = self.y,
            .integer_x = std.math.lossyCast(i32, whole_x),
            .integer_y = std.math.lossyCast(i32, whole_y),
        } };
    }

    /// Forgets a source's button state and click history, for example when its
    /// device is removed. Buttons it held are no longer reported as pressed.
    pub fn forget_source(self: *Mouse, mouse_id: event.MouseId) void {
        _ = self.sources.swapRemove(mouse_id);
    }

    /// Confines the position to the viewport, as SDL's ConstrainMousePosition.
    /// Positions past the far edge stay on the last valid side (`last_x`/`last_y`)
    /// so that a pointer leaving the window does not jump to its edge.
    fn constrain(self: *const Mouse, viewport: ?Viewport, x: *f32, y: *f32) void {
        const vp = viewport orelse return;
        if (vp.captured) return;

        var x_min: i32 = 0;
        var x_max: i32 = vp.width - 1;
        var y_min: i32 = 0;
        var y_max: i32 = vp.height - 1;
        if (vp.confine) |c| {
            const left = @max(c.x, 0);
            const top = @max(c.y, 0);
            const right = @min(c.x + c.w, vp.width);
            const bottom = @min(c.y + c.h, vp.height);
            if (right > left and bottom > top) {
                x_min = left;
                x_max = right - 1;
                y_min = top;
                y_max = bottom - 1;
            }
        }

        if (x.* >= @as(f32, @floatFromInt(x_max + 1))) {
            x.* = @max(@as(f32, @floatFromInt(x_max)), self.last_x);
        }
        if (x.* < @as(f32, @floatFromInt(x_min))) {
            x.* = @floatFromInt(x_min);
        }
        if (y.* >= @as(f32, @floatFromInt(y_max + 1))) {
            y.* = @max(@as(f32, @floatFromInt(y_max)), self.last_y);
        }
        if (y.* < @as(f32, @floatFromInt(y_min))) {
            y.* = @floatFromInt(y_min);
        }
    }

    /// Source to record a transition on. A release from a source that does not
    /// hold the button is attributed to any source that does, which covers
    /// transitions between raw input and platform messages (SDL behavior).
    fn source_for(self: *Mouse, mouse_id: event.MouseId, down: bool, bit: u32) error{OutOfMemory}!*Source {
        var match = self.sources.getPtr(mouse_id);
        if (!down and (match == null or @backingInt(match.?.buttons) & bit == 0)) {
            for (self.sources.values()) |*candidate| {
                if (candidate.buttons.bits() & bit != 0) {
                    match = candidate;
                    break;
                }
            }
        }
        if (match) |existing| return existing;

        const gop = try self.sources.getOrPut(self.allocator, mouse_id);
        gop.value_ptr.* = .{ .mouse_id = mouse_id };
        return gop.value_ptr;
    }

    /// Click count for a button transition. A press continues the sequence when
    /// it follows the previous press of the same button within the configured
    /// time and travel radius, and otherwise starts a new sequence at one. Releases
    /// report the current count.
    fn count_click(self: *Mouse, source: *Source, button_index: u8, down: bool, timestamp: u64) u8 {
        const click = &source.clicks[button_index - 1];
        if (down) {
            const now_ms = timestamp / std.time.ns_per_ms;
            const radius = self.options.double_click_radius;
            const too_late = now_ms >= click.last_ms + self.options.double_click_time_ms;
            const too_far = @abs(self.click_motion_x - click.motion_x) > radius or
                @abs(self.click_motion_y - click.motion_y) > radius;
            if (too_late or too_far) click.count = 0;
            click.last_ms = now_ms;
            click.motion_x = self.click_motion_x;
            click.motion_y = self.click_motion_y;
            if (click.count < 255) click.count += 1;
        }
        return click.count;
    }
};

/// Adds `delta` to `residual` and returns the whole part, leaving the fraction in
/// `residual`. This matches SDL_modff, which keeps the sign of the sum.
fn accumulate_whole(residual: *f32, delta: f32) f32 {
    const sum = residual.* + delta;
    const whole = @trunc(sum);
    residual.* = sum - whole;
    return whole;
}
