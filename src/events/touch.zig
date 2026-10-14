//! Touch devices and finger tracking. Altered native port of SDL_touch.c: device
//! registry, per-device finger tables, finger down/motion/up/cancel events and
//! the touch-to-mouse emulation of SDL_HINT_TOUCH_MOUSE_EVENTS.
//!
//! Differences from SDL:
//! - `Touches` is an explicit table owned by the caller. There is no global
//!   device list and no internal lock; serialize calls across threads.
//! - Input calls take an optional `*mouse.Mouse` to drive touch-to-mouse
//!   emulation. Null disables it, as does `Options.touch_mouse_events == false`.
//! - Events are returned in a `Batch`, not pushed. A down can produce a cancel
//!   for a finger that was never lifted, plus emulated mouse events.
//! - Mouse-to-touch emulation (SDL_HINT_MOUSE_TOUCH_EVENTS) and pen-to-touch
//!   emulation are not implemented.
//! - SDL_AddTouch and SDL_DelTouch send no events: SDL 3 has no touch device
//!   added/removed event type (only keyboard and mouse have them). `add_device` and
//!   `remove_device` therefore return nothing, and the registry is read directly.
//! - Removal order follows SDL_DelTouch (last device moves into the hole); see
//!   `remove_device`.
//! - Coordinates are normalized 0..1 window fractions, as in SDL. Emulated
//!   pointer positions are clamped to `[0, width - 1] x [0, height - 1]`.
const std = @import("std");
const event = @import("event.zig");
const mouse = @import("mouse.zig");

/// Kind of touch device (`SDL_TouchDeviceType`).
pub const DeviceType = enum(i32) {
    invalid = -1,
    /// Touchscreen with window-relative coordinates.
    direct = 0,
    /// Trackpad with absolute device coordinates.
    indirect_absolute = 1,
    /// Trackpad whose contacts move the screen cursor.
    indirect_relative = 2,
};

/// One finger currently in contact. Coordinates are normalized 0..1.
pub const Finger = struct {
    id: event.FingerId,
    x: f32,
    y: f32,
    pressure: f32,
};

/// One finger contact transition or motion. `timestamp` is host monotonic
/// nanoseconds. `viewport` supplies the window
/// the coordinates refer to and its size for emulated pointer events; null
/// means no window (no emulation, and the event reports `WindowId.none`).
pub const Input = struct {
    timestamp: event.Timestamp = 0,
    touch_id: event.TouchId,
    finger_id: event.FingerId,
    viewport: ?mouse.Viewport = null,
    x: f32 = 0,
    y: f32 = 0,
    pressure: f32 = 0,
};

const Device = struct {
    id: event.TouchId,
    kind: DeviceType,
    /// Owned copy of the device name.
    name: []u8,
    /// Fingers in contact, in the order they went down.
    fingers: std.ArrayList(Finger) = .empty,
};

/// Touch devices and their fingers. Owns names and finger tables and must be
/// deinitialized.
pub const Touches = struct {
    allocator: std.mem.Allocator,
    devices: std.ArrayList(Device) = .empty,
    /// Finger currently driving touch-to-mouse emulation. Only one emulated
    /// finger exists at a time, as in SDL.
    emulated: ?Track = null,

    const Track = struct {
        touch_id: event.TouchId,
        finger_id: event.FingerId,
    };

    /// Creates an empty table without allocation.
    pub fn init(allocator: std.mem.Allocator) Touches {
        return .{ .allocator = allocator };
    }

    /// Frees all devices, names and finger tables. Invalidates the table.
    pub fn deinit(self: *Touches) void {
        for (self.devices.items) |*device| {
            device.fingers.deinit(self.allocator);
            self.allocator.free(device.name);
        }
        self.devices.deinit(self.allocator);
        self.* = undefined;
    }

    /// Registers a touch device. Re-adding an existing id keeps the original
    /// entry, as SDL_AddTouch does. `id` must not be `.none`.
    pub fn add_device(self: *Touches, id: event.TouchId, kind: DeviceType, name: ?[]const u8) error{OutOfMemory}!void {
        std.debug.assert(@backingInt(id) != 0);
        if (self.index_of(id) != null) return;
        const owned = try self.allocator.dupe(u8, name orelse "");
        errdefer self.allocator.free(owned);
        try self.devices.append(self.allocator, .{ .id = id, .kind = kind, .name = owned });
    }

    /// Removes a device and its fingers (SDL_DelTouch). Unknown ids are ignored.
    /// Emulation tracking is cleared if it belonged to this device.
    ///
    /// Order: SDL moves the last device into the freed slot instead of shifting the
    /// rest, so the registry order is not stable across removals. That order is
    /// observable: the touch pseudo mouse is named after `devices[0]` (see
    /// `app/devices.zig`), so this port swap-removes too.
    pub fn remove_device(self: *Touches, id: event.TouchId) void {
        const index = self.index_of(id) orelse return;
        var removed = self.devices.swapRemove(index);
        removed.fingers.deinit(self.allocator);
        self.allocator.free(removed.name);
        if (self.emulated) |track| {
            if (track.touch_id == id) self.emulated = null;
        }
    }

    pub fn device_type(self: *const Touches, id: event.TouchId) ?DeviceType {
        const index = self.index_of(id) orelse return null;
        return self.devices.items[index].kind;
    }

    /// Owned name of a device (valid until it is removed).
    pub fn device_name(self: *const Touches, id: event.TouchId) ?[]const u8 {
        const index = self.index_of(id) orelse return null;
        return self.devices.items[index].name;
    }

    /// Fingers currently down on a device, in the order they went down. The
    /// slice is invalidated by any call that changes the device.
    pub fn fingers(self: *const Touches, id: event.TouchId) ?[]const Finger {
        const index = self.index_of(id) orelse return null;
        return self.devices.items[index].fingers.items;
    }

    /// Finger went down. A finger that is already down is first reported as
    /// canceled, as SDL does, so a lost lift does not leave a stale contact.
    pub fn down(self: *Touches, mouse_state: ?*mouse.Mouse, input: Input) error{OutOfMemory}!event.Batch {
        var batch: event.Batch = .{};
        try self.send(mouse_state, .down, input, &batch);
        return batch;
    }

    /// Finger moved. Motion from an unknown finger starts a contact instead.
    /// Motion that changes nothing is dropped. The reported `dx`/`dy` are the
    /// deltas from the previous position.
    pub fn motion(self: *Touches, mouse_state: ?*mouse.Mouse, input: Input) error{OutOfMemory}!event.Batch {
        var batch: event.Batch = .{};
        const device_index = self.index_of(input.touch_id) orelse return batch;

        if (mouse_emulation_allowed(input.touch_id)) {
            if (mouse_state) |m| {
                if (m.options.touch_mouse_events) {
                    if (input.viewport) |vp| {
                        if (self.tracks(input)) {
                            const pos = clamped_pixels(input, vp);
                            batch.push(m.motion(input.timestamp, vp, .touch, false, pos.x, pos.y));
                        }
                    }
                }
            }
        }

        const device = &self.devices.items[device_index];
        const finger_index = find_finger(device, input.finger_id) orelse {
            try self.send(mouse_state, .down, input, &batch);
            return batch;
        };
        const finger = &device.fingers.items[finger_index];
        const xrel = input.x - finger.x;
        const yrel = input.y - finger.y;
        const prel = input.pressure - finger.pressure;
        if (xrel == 0 and yrel == 0 and prel == 0) return batch;

        finger.x = input.x;
        finger.y = input.y;
        finger.pressure = input.pressure;
        batch.push(.{ .finger = .{
            .kind = .motion,
            .timestamp = input.timestamp,
            .window_id = window_of(input),
            .touch_id = input.touch_id,
            .finger_id = input.finger_id,
            .x = input.x,
            .y = input.y,
            .dx = xrel,
            .dy = yrel,
            .pressure = input.pressure,
        } });
        return batch;
    }

    /// Finger lifted. The reported position is the last known one, not the
    /// position given here, as SDL does. Unknown fingers produce no event.
    pub fn up(self: *Touches, mouse_state: ?*mouse.Mouse, input: Input) error{OutOfMemory}!event.Batch {
        var batch: event.Batch = .{};
        try self.send(mouse_state, .up, input, &batch);
        return batch;
    }

    /// Contact was aborted by the platform. Same as `up`, reported as canceled.
    pub fn cancel(self: *Touches, mouse_state: ?*mouse.Mouse, input: Input) error{OutOfMemory}!event.Batch {
        var batch: event.Batch = .{};
        try self.send(mouse_state, .canceled, input, &batch);
        return batch;
    }

    fn index_of(self: *const Touches, id: event.TouchId) ?usize {
        for (self.devices.items, 0..) |device, i| if (device.id == id) return i;
        return null;
    }

    fn tracks(self: *const Touches, input: Input) bool {
        const track = self.emulated orelse return false;
        return track.touch_id == input.touch_id and track.finger_id == input.finger_id;
    }

    /// Shared down, up and canceled path. The emulation block runs before the
    /// finger table changes, in the same order as SDL_SendTouch.
    fn send(
        self: *Touches,
        mouse_state: ?*mouse.Mouse,
        kind: event.FingerKind,
        input: Input,
        batch: *event.Batch,
    ) error{OutOfMemory}!void {
        const device_index = self.index_of(input.touch_id) orelse return;
        const down_kind = kind == .down;

        if (mouse_emulation_allowed(input.touch_id)) {
            if (mouse_state) |m| {
                if (m.options.touch_mouse_events) {
                    if (input.viewport) |vp| {
                        if (down_kind) {
                            if (self.emulated == null) {
                                const pos = clamped_pixels(input, vp);
                                batch.push(m.motion(input.timestamp, vp, .touch, false, pos.x, pos.y));
                                batch.push(try press_left(m, input.timestamp, true));
                            }
                        } else if (self.tracks(input)) {
                            batch.push(try press_left(m, input.timestamp, false));
                        }
                    }
                    if (down_kind) {
                        if (self.emulated == null) {
                            self.emulated = .{ .touch_id = input.touch_id, .finger_id = input.finger_id };
                        }
                    } else if (self.tracks(input)) {
                        self.emulated = null;
                    }
                }
            }
        }

        const device = &self.devices.items[device_index];
        const existing = find_finger(device, input.finger_id);
        if (down_kind) {
            if (existing != null) {
                // The previous lift was lost; report it before the new contact.
                try self.send(mouse_state, .canceled, input, batch);
            }
            const device_after = &self.devices.items[device_index];
            try device_after.fingers.append(self.allocator, .{
                .id = input.finger_id,
                .x = input.x,
                .y = input.y,
                .pressure = input.pressure,
            });
            batch.push(.{ .finger = .{
                .kind = .down,
                .timestamp = input.timestamp,
                .window_id = window_of(input),
                .touch_id = input.touch_id,
                .finger_id = input.finger_id,
                .x = input.x,
                .y = input.y,
                .pressure = input.pressure,
            } });
        } else {
            const finger_index = existing orelse return;
            const finger = device.fingers.items[finger_index];
            batch.push(.{ .finger = .{
                .kind = kind,
                .timestamp = input.timestamp,
                .window_id = window_of(input),
                .touch_id = input.touch_id,
                .finger_id = input.finger_id,
                .x = finger.x,
                .y = finger.y,
                .pressure = input.pressure,
            } });
            _ = device.fingers.orderedRemove(finger_index);
        }
    }
};

/// Pinch gesture event. Span and focus are normalized window fractions, or
/// negative when unavailable. Negative values are reported as -1. Without a
/// viewport, span and focus are also reported as -1.
pub fn pinch(
    kind: event.PinchKind,
    timestamp: event.Timestamp,
    viewport: ?mouse.Viewport,
    scale: f32,
    span_x: f32,
    span_y: f32,
    focus_x: f32,
    focus_y: f32,
) event.Event {
    const vp = viewport;
    return .{ .pinch = .{
        .kind = kind,
        .timestamp = timestamp,
        .window_id = if (vp) |v| v.window else .none,
        .scale = scale,
        .span_x = scale_or_missing(span_x, vp, true),
        .span_y = scale_or_missing(span_y, vp, false),
        .focus_x = scale_or_missing(focus_x, vp, true),
        .focus_y = scale_or_missing(focus_y, vp, false),
    } };
}

fn scale_or_missing(value: f32, viewport: ?mouse.Viewport, horizontal: bool) f32 {
    if (value < 0) return -1;
    const vp = viewport orelse return -1;
    const extent: f32 = @floatFromInt(if (horizontal) vp.width else vp.height);
    return value * extent;
}

/// Touch pseudo-devices (SDL_MOUSE_TOUCHID, SDL_PEN_TOUCHID) are not
/// touch-to-mouse emulated, so they never feed back into the pointer.
fn mouse_emulation_allowed(id: event.TouchId) bool {
    return id != .mouse and id != .pen;
}

fn window_of(input: Input) event.WindowId {
    return if (input.viewport) |vp| vp.window else .none;
}

/// Converts normalized coordinates to clamped window pixels for emulation.
fn clamped_pixels(input: Input, vp: mouse.Viewport) struct { x: f32, y: f32 } {
    const max_x: f32 = @floatFromInt(vp.width - 1);
    const max_y: f32 = @floatFromInt(vp.height - 1);
    const px = std.math.clamp(input.x * @as(f32, @floatFromInt(vp.width)), 0, max_x);
    const py = std.math.clamp(input.y * @as(f32, @floatFromInt(vp.height)), 0, max_y);
    return .{ .x = px, .y = py };
}

/// Left-button transition for emulated pointer input. The button index is a
/// constant in range, so `InvalidButton` cannot occur.
fn press_left(m: *mouse.Mouse, timestamp: event.Timestamp, down: bool) error{OutOfMemory}!?event.Event {
    return m.button(timestamp, .touch, mouse.button.left, down, null) catch |err| switch (err) {
        error.OutOfMemory => error.OutOfMemory,
        error.InvalidButton => unreachable,
    };
}

fn find_finger(device: *const Device, id: event.FingerId) ?usize {
    for (device.fingers.items, 0..) |finger, i| if (finger.id == id) return i;
    return null;
}
