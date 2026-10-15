//! Pressure-sensitive pen devices: proximity, tip contact, buttons, position
//! and axes. Altered native port of SDL_pen.c (state machine and event
//! generation). Each call takes timestamps in the shared monotonic nanosecond
//! domain and returns the events it produced; nothing is queued here.
//!
//! Differences from SDL:
//! - Pens live in a `Pens` table owned by the caller and allocated from its
//!   allocator. Ids are issued per table (from 1), not from a process counter.
//! - SDL_HINT_PEN_MOUSE_EVENTS and SDL_HINT_PEN_TOUCH_EVENTS synthetic pointer
//!   events are not generated. Only the native pen events are returned.
//! - "Pending proximity out" (a proximity loss deferred until the next motion)
//!   is returned by `next_pending_proximity`. SDL also checks whether the stored
//!   window still exists; that check belongs to the caller.
const std = @import("std");
const event = @import("event.zig");

/// Kind of pen device (`SDL_PenDeviceType`). Direct pens touch a display;
/// indirect pens touch something else, such as a tablet surface.
pub const DeviceType = enum(i32) {
    invalid = -1,
    unknown = 0,
    direct = 1,
    indirect = 2,
};

/// Number of axes in `Axis`, and the length of each pen's axis array.
pub const axis_count = 7;

/// Pen axes. Pressure and distance are 0..1. Tilt and rotation are angles in
/// degrees with 0 at the centre. Axes a device does not report stay zero.
pub const Axis = enum(u8) {
    pressure,
    xtilt,
    ytilt,
    distance,
    rotation,
    slider,
    tangential_pressure,
};

/// Pen state bits (`SDL_PenInputFlags`). The layout matches SDL: bit 0 is
/// tip down, bits 1 to 5 are buttons 1 to 5, bit 30 is eraser and bit 31 is
/// proximity. Bits 6 to 29 are reserved and always zero.
pub const InputFlags = packed struct(u32) {
    down: bool = false,
    button_1: bool = false,
    button_2: bool = false,
    button_3: bool = false,
    button_4: bool = false,
    button_5: bool = false,
    _reserved: u24 = 0,
    eraser_tip: bool = false,
    in_proximity: bool = false,

    pub const none: InputFlags = .{};

    /// True when one-based pen `button` (1 through 5) is pressed.
    pub fn button_down(self: InputFlags, button: u8) bool {
        if (button < 1 or button > 5) return false;
        return (@backingInt(self) >> @intCast(button)) & 1 != 0;
    }

    /// Returns the flags with one-based pen `button` (1 through 5) set or cleared.
    pub fn with_button(self: InputFlags, button: u8, on: bool) InputFlags {
        std.debug.assert(button >= 1 and button <= 5);
        const bit = @as(u32, 1) << @intCast(button);
        var bits = @backingInt(self);
        if (on) bits |= bit else bits &= ~bit;
        return @fromBackingInt(bits);
    }
};

/// Pen state a caller can read between events.
pub const Status = struct {
    state: InputFlags,
    x: f32,
    y: f32,
    axes: [axis_count]f32,
};

/// One pen device. Owns `name`.
const Pen = struct {
    id: event.PenId,
    name: []u8,
    device_type: DeviceType,
    axes: [axis_count]f32,
    x: f32 = 0,
    y: f32 = 0,
    state: InputFlags = .none,
    /// Set when proximity loss is deferred until the next motion or button
    /// event. `pending_window` is the window that was current at that time.
    pending_out: bool = false,
    pending_window: event.WindowId = .none,
};

/// Table of pen devices. Owns every pen name and must be deinitialized. Not
/// synchronized: serialize calls from different threads.
pub const Pens = struct {
    allocator: std.mem.Allocator,
    list: std.ArrayList(Pen) = .empty,
    next_id: u32 = 1,

    /// Creates an empty table without allocation.
    pub fn init(allocator: std.mem.Allocator) Pens {
        return .{ .allocator = allocator };
    }

    /// Frees all names and pens. Invalidates the table.
    pub fn deinit(self: *Pens) void {
        for (self.list.items) |p| self.allocator.free(p.name);
        self.list.deinit(self.allocator);
        self.* = undefined;
    }

    /// Result of `add`: the new id and any proximity events.
    pub const Added = struct {
        id: event.PenId,
        events: event.Batch = .{},
    };

    /// Registers a pen. `name` is copied; null or empty becomes "Unnamed pen".
    /// If `in_proximity` is true the pen is reported entering proximity at once.
    pub fn add(
        self: *Pens,
        timestamp: event.Timestamp,
        window_id: event.WindowId,
        pen_name: ?[]const u8,
        device_type: DeviceType,
        in_proximity: bool,
    ) error{OutOfMemory}!Added {
        const label = if (pen_name) |n| (if (n.len == 0) "Unnamed pen" else n) else "Unnamed pen";
        const owned = try self.allocator.dupe(u8, label);
        errdefer self.allocator.free(owned);
        const axes: [axis_count]f32 = @splat(0);
        const id: event.PenId = @fromBackingInt(@intCast(self.next_id));
        try self.list.append(self.allocator, .{
            .id = id,
            .name = owned,
            .device_type = device_type,
            .axes = axes,
        });
        self.next_id +%= 1;
        var result: Added = .{ .id = id };
        if (in_proximity) {
            // The pen was just appended, so the lookup cannot fail.
            const pen = self.find(id).?;
            set_proximity(pen, timestamp, window_id, true, true, &result.events);
        }
        return result;
    }

    /// Removes a pen, reporting its proximity loss first. Unknown ids are ignored.
    pub fn remove(self: *Pens, timestamp: event.Timestamp, window_id: event.WindowId, id: event.PenId) event.Batch {
        var batch: event.Batch = .{};
        const index = self.index_of(id) orelse return batch;
        set_proximity(&self.list.items[index], timestamp, window_id, false, true, &batch);
        const removed = self.list.orderedRemove(index);
        self.allocator.free(removed.name);
        return batch;
    }

    /// Pen tip contact or eraser end changed. An event is reported only when the
    /// tip or eraser state actually changes. Its kind follows `down`, as in SDL,
    /// so an eraser-only change reports the current tip direction.
    pub fn touch(self: *Pens, timestamp: event.Timestamp, window_id: event.WindowId, id: event.PenId, eraser: bool, down: bool) event.Batch {
        var batch: event.Batch = .{};
        const pen = self.find(id) orelse return batch;
        var state = pen.state;
        var changed = false;
        if (down and !state.down) {
            state.down = true;
            changed = true;
        } else if (!down and state.down) {
            state.down = false;
            changed = true;
        }
        if (eraser and !state.eraser_tip) {
            state.eraser_tip = true;
            changed = true;
        } else if (!eraser and state.eraser_tip) {
            state.eraser_tip = false;
            changed = true;
        }
        pen.state = state;
        if (changed) batch.push(.{ .pen_touch = .{
            .kind = if (down) .down else .up,
            .timestamp = timestamp,
            .window_id = window_id,
            .pen_id = id,
            .state = state,
            .x = pen.x,
            .y = pen.y,
            .eraser = eraser,
            .device_type = pen.device_type,
        } });
        return batch;
    }

    /// Updates one axis. Returns the axis event only when the value changed.
    /// Axis values are stored as given, not clamped or normalized.
    pub fn axis(self: *Pens, timestamp: event.Timestamp, window_id: event.WindowId, id: event.PenId, which: Axis, value: f32) ?event.Event {
        const pen = self.find(id) orelse return null;
        if (pen.axes[@backingInt(which)] == value) return null;
        pen.axes[@backingInt(which)] = value;
        return .{ .pen_axis = .{
            .timestamp = timestamp,
            .window_id = window_id,
            .pen_id = id,
            .state = pen.state,
            .x = pen.x,
            .y = pen.y,
            .axis = which,
            .value = value,
            .device_type = pen.device_type,
        } };
    }

    /// Moves the pen. A pen that is not yet in proximity (or whose deferred
    /// proximity loss is pending) first reports proximity, as SDL does.
    pub fn motion(self: *Pens, timestamp: event.Timestamp, window_id: event.WindowId, id: event.PenId, x: f32, y: f32) event.Batch {
        var batch: event.Batch = .{};
        const pen = self.find(id) orelse return batch;
        ensure_proximity(pen, timestamp, window_id, &batch);
        if (pen.x == x and pen.y == y) return batch;
        pen.x = x;
        pen.y = y;
        batch.push(.{ .pen_motion = .{
            .timestamp = timestamp,
            .window_id = window_id,
            .pen_id = id,
            .state = pen.state,
            .x = x,
            .y = y,
            .device_type = pen.device_type,
        } });
        return batch;
    }

    /// One-based pen button changed. Buttons outside 1 to 5 are ignored, as in SDL.
    pub fn button(self: *Pens, timestamp: event.Timestamp, window_id: event.WindowId, id: event.PenId, button_index: u8, down: bool) event.Batch {
        var batch: event.Batch = .{};
        if (button_index < 1 or button_index > 5) return batch;
        const pen = self.find(id) orelse return batch;
        ensure_proximity(pen, timestamp, window_id, &batch);
        const current = pen.state.button_down(button_index);
        if (down == current) return batch;
        pen.state = pen.state.with_button(button_index, down);
        batch.push(.{ .pen_button = .{
            .kind = if (down) .down else .up,
            .timestamp = timestamp,
            .window_id = window_id,
            .pen_id = id,
            .state = pen.state,
            .x = pen.x,
            .y = pen.y,
            .button = button_index,
            .device_type = pen.device_type,
        } });
        return batch;
    }

    /// Reports a pen entering or leaving proximity. `immediate` false defers a
    /// leave: `next_pending_proximity` reports it later, and any motion or
    /// button event for the pen cancels it.
    pub fn proximity(self: *Pens, timestamp: event.Timestamp, window_id: event.WindowId, id: event.PenId, in: bool, immediate: bool) event.Batch {
        var batch: event.Batch = .{};
        const pen = self.find(id) orelse return batch;
        set_proximity(pen, timestamp, window_id, in, immediate, &batch);
        return batch;
    }

    /// Returns the proximity-out batch for the next pen with a deferred leave,
    /// clearing it, or null when none remain. Timestamp is applied as given.
    pub fn next_pending_proximity(self: *Pens, timestamp: event.Timestamp) ?event.Batch {
        for (self.list.items) |*pen| {
            if (!pen.pending_out) continue;
            pen.pending_out = false;
            var batch: event.Batch = .{};
            const window = pen.pending_window;
            set_proximity(pen, timestamp, window, false, true, &batch);
            return batch;
        }
        return null;
    }

    /// Current state of a pen, or null for an unknown id.
    pub fn status(self: *const Pens, id: event.PenId) ?Status {
        for (self.list.items) |p| {
            if (p.id == id) return .{ .state = p.state, .x = p.x, .y = p.y, .axes = p.axes };
        }
        return null;
    }

    /// Owned name of a pen (valid until the pen is removed).
    pub fn name(self: *const Pens, id: event.PenId) ?[]const u8 {
        for (self.list.items) |p| if (p.id == id) return p.name;
        return null;
    }

    /// Number of registered pens.
    pub fn count(self: *const Pens) usize {
        return self.list.items.len;
    }

    fn index_of(self: *const Pens, id: event.PenId) ?usize {
        for (self.list.items, 0..) |p, i| if (p.id == id) return i;
        return null;
    }

    fn find(self: *Pens, id: event.PenId) ?*Pen {
        const index = self.index_of(id) orelse return null;
        return &self.list.items[index];
    }
};

/// Before pen input, a pen that is not in proximity reports entering it. A
/// deferred leave that is still pending is simply cancelled.
fn ensure_proximity(pen: *Pen, timestamp: event.Timestamp, window_id: event.WindowId, batch: *event.Batch) void {
    if (pen.pending_out) {
        pen.pending_out = false;
    } else if (!pen.state.in_proximity) {
        set_proximity(pen, timestamp, window_id, true, true, batch);
    }
}

/// Proximity transition. Entering sets the proximity bit. Leaving clears the
/// proximity bit and all buttons, and first reports each button that was
/// pressed as released, as SDL does. A deferred leave (`immediate` false) only
/// marks the pen pending.
fn set_proximity(pen: *Pen, timestamp: event.Timestamp, window_id: event.WindowId, in: bool, immediate: bool, batch: *event.Batch) void {
    if (!(in or immediate)) {
        pen.pending_out = true;
        pen.pending_window = window_id;
        return;
    }
    const original = pen.state;
    pen.pending_out = false;
    if (original.in_proximity == in) return;

    var state = original;
    if (in) {
        state.in_proximity = true;
    } else {
        state.in_proximity = false;
        inline for (1..6) |b| state = state.with_button(b, false);
    }
    pen.state = state;

    if (!in) {
        // Release each button that was held. The reported state keeps proximity
        // (the leave is not yet reported) and drops buttons already released.
        var remaining = original;
        var button: u8 = 1;
        while (button <= 5) : (button += 1) {
            if (!original.button_down(button)) continue;
            remaining = remaining.with_button(button, false);
            batch.push(.{ .pen_button = .{
                .kind = .up,
                .timestamp = timestamp,
                .window_id = window_id,
                .pen_id = pen.id,
                .state = remaining,
                .x = pen.x,
                .y = pen.y,
                .button = button,
                .device_type = pen.device_type,
            } });
        }
    }
    batch.push(.{ .pen_proximity = .{
        .kind = if (in) .entered else .left,
        .timestamp = timestamp,
        .window_id = window_id,
        .pen_id = pen.id,
        .state = state,
        .device_type = pen.device_type,
    } });
}
