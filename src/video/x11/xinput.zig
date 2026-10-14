//! XInput2 (libXi, loaded at runtime): raw relative motion for relative pointer
//! modes, touch events with their source device ids, and smooth scrolling from
//! per-device scroll valuators. SDL_x11xinput2.c is the reference.
//!
//! Setup: `enable` checks the extension and protocol version (2.0 minimum,
//! 2.2 for touch). Selection is explicit: `select_window` picks motion and touch
//! for one window, `set_raw_motion` picks raw motion on the root window. Nothing
//! is selected until the caller asks, so the core protocol keeps working as before.
//!
//! Ownership: the per-device cache lives in `State`, owned by the Connection
//! that enabled XInput2 and freed by `State.deinit` in `Connection.deinit`.
//!
//! Deliberate differences from SDL:
//! - Touch positions are window pixels relative to the event's window; SDL
//!   normalizes them to 0..1. Divide by the window size for that form.
//! - Raw motion always carries the unaccelerated valuator values. SDL switches
//!   between raw and scaled values by a hint and a mouse transform; this layer
//!   has neither.
//! - Selecting XI_Motion on a window stops core MotionNotify for it, as the X
//!   protocol specifies. Pointer position then comes from the XI2 master device,
//!   as in SDL. Emulated pointer motion from touch is ignored.
//! - A failed device query or allocation leaves that device without scroll axes
//!   (scrolling from it is silently absent) rather than failing the event.
//!
//! Pens (SDL_x11pen.c): a device with an "Abs Pressure" valuator is a pen, and
//! its name containing "eraser" marks an eraser. Pressure and tilt come from the
//! labelled valuators and are normalized over each valuator's range. Tilt is
//! scaled to plus or minus 90 degrees, where SDL leaves the normalized value. The
//! pen is down when pressure is above zero; SDL uses the tip button, which this
//! layer does not select (selecting button events would also replace core button
//! presses for every mouse). Rotation and slider axes are not reported, as in SDL.
const std = @import("std");
const geometry = @import("../geometry.zig");
const window = @import("window.zig");
const xlib = @import("xlib.zig");

/// XIAllDevices (XI2.h). Window selections use it so slave devices (and their
/// scroll valuators) are delivered alongside the master pointer.
const all_devices: c_int = 0;

/// Touch phases (XI_TouchBegin, XI_TouchUpdate, XI_TouchEnd).
pub const TouchPhase = enum { begin, update, end };

/// One touch point. `position` is in window pixels.
pub const Touch = struct {
    phase: TouchPhase,
    /// XI2 source device (sourceid) of the touch.
    device: i32,
    /// Touch id, unique among the touches currently down on that device.
    finger: u32,
    position: geometry.Point(f32),
    timestamp: u32,
};

/// Unaccelerated relative motion from one device, in device units. Only
/// delivered after `set_raw_motion(true)`.
pub const RawMotion = struct {
    device: i32,
    dx: f64,
    dy: f64,
    timestamp: u32,
};

/// Smooth scroll deltas from one device's scroll valuators, in the same
/// direction convention as `Event.wheel`: positive y is up, positive x is right.
pub const SmoothScroll = struct {
    device: i32,
    x: f32,
    y: f32,
    timestamp: u32,
};

/// Events selected on one window by `select_window`.
pub const Events = struct {
    /// XI_Motion: master pointer motion and slave scroll valuators.
    motion: bool = false,
    /// XI_TouchBegin, XI_TouchUpdate and XI_TouchEnd (protocol 2.2).
    touch: bool = false,
    /// XI_ProximityIn and XI_ProximityOut: a pen entering or leaving the tablet.
    pen: bool = false,
};

/// One scroll valuator of a device (XIScrollClassInfo).
const ScrollAxis = struct {
    number: c_int,
    vertical: bool,
    increment: f64,
    previous: f64 = 0,
    previous_valid: bool = false,
};

/// A labelled valuator and the range its values take.
const Range = struct {
    number: c_int,
    min: f64,
    max: f64,
};

/// Pen axes of a device that measures pressure (see the module comment).
const Pen = struct {
    pressure: ?Range = null,
    tilt_x: ?Range = null,
    tilt_y: ?Range = null,
    eraser: bool = false,
};

/// Cached device layout: the valuators that carry relative X and Y, the
/// scroll valuators and, for pens, the pen axes. The first valuator numbers fill
/// in when labels are absent.
const Device = struct {
    relative: [2]?c_int = .{ null, null },
    scroll: []ScrollAxis = &.{},
    pen: ?Pen = null,
};

/// XInput2 state of one connection, held in `Connection.xi` once enabled.
pub const State = struct {
    allocator: std.mem.Allocator,
    /// Major opcode of the XInput extension; GenericEvents carry it in `extension`.
    opcode: c_int,
    major: c_int,
    minor: c_int,
    rel_x: xlib.Atom,
    rel_y: xlib.Atom,
    pen_pressure: xlib.Atom,
    pen_tilt_x: xlib.Atom,
    pen_tilt_y: xlib.Atom,
    devices: std.AutoHashMapUnmanaged(c_int, Device) = .empty,

    /// Frees the device cache. Called by Connection.deinit.
    pub fn deinit(self: *State) void {
        var iterator = self.devices.valueIterator();
        while (iterator.next()) |device| self.allocator.free(device.scroll);
        self.devices.deinit(self.allocator);
        self.* = undefined;
    }

    /// True when the server speaks XInput 2.2, which touch events need.
    pub fn supports_touch(self: *const State) bool {
        return self.major > 2 or (self.major == 2 and self.minor >= 2);
    }
};

/// Largest scroll step accepted as a real delta. Larger jumps are the driver
/// wrapping its valuator (SDL ignores deltas at or above 0.95 * INT32_MAX).
const max_scroll_delta: f64 = @as(f64, @floatFromInt(std.math.maxInt(i32))) * 0.95;

/// Checks that libXi and the XInput extension are present and prepares the
/// XInput2 state for `connection`. Calling it again is a no-op.
pub fn enable(connection: *window.Connection) window.Error!void {
    if (connection.xi != null) return;
    const xi = connection.library.xi orelse return error.XInputUnavailable;
    const api = &connection.library.functions;
    var opcode: c_int = 0;
    var first_event: c_int = 0;
    var first_error: c_int = 0;
    if (api.XQueryExtension(connection.display, "XInputExtension", &opcode, &first_event, &first_error) == 0) return error.XInputUnavailable;
    // Ask for 2.2; the reply carries the highest version the server supports.
    var major: c_int = 2;
    var minor: c_int = 2;
    if (xi.XIQueryVersion(connection.display, &major, &minor) != 0 or major < 2) return error.XInputUnavailable;
    connection.xi = .{
        .allocator = connection.library.allocator,
        .opcode = opcode,
        .major = major,
        .minor = minor,
        .rel_x = api.XInternAtom(connection.display, "Rel X", 0),
        .rel_y = api.XInternAtom(connection.display, "Rel Y", 0),
        .pen_pressure = api.XInternAtom(connection.display, "Abs Pressure", 0),
        .pen_tilt_x = api.XInternAtom(connection.display, "Abs Tilt X", 0),
        .pen_tilt_y = api.XInternAtom(connection.display, "Abs Tilt Y", 0),
    };
}

/// Selects XInput2 events for one window. Passing no events deselects them.
pub fn select_window(connection: *window.Connection, id: xlib.Window, events: Events) window.Error!void {
    const state = &(connection.xi orelse return error.XInputUnavailable);
    const xi = connection.library.xi orelse return error.XInputUnavailable;
    if (events.touch and !state.supports_touch()) return error.TouchUnsupported;
    var bits: [4]u8 = @splat(0);
    if (events.motion) set_bit(&bits, xlib.xi_motion);
    if (events.touch) {
        set_bit(&bits, xlib.xi_touch_begin);
        set_bit(&bits, xlib.xi_touch_update);
        set_bit(&bits, xlib.xi_touch_end);
    }
    if (events.pen) {
        set_bit(&bits, xlib.xi_proximity_in);
        set_bit(&bits, xlib.xi_proximity_out);
    }
    var masks = [_]xlib.XIEventMask{.{ .deviceid = all_devices, .mask_len = bits.len, .mask = &bits }};
    if (xi.XISelectEvents(connection.display, id, &masks, 1) != 0) return error.WindowFailure;
    try connection.flush();
}

/// Selects (or deselects) raw motion on the root window, which delivers it for
/// every pointer regardless of focus or grabs.
pub fn set_raw_motion(connection: *window.Connection, enabled: bool) window.Error!void {
    _ = connection.xi orelse return error.XInputUnavailable;
    const xi = connection.library.xi orelse return error.XInputUnavailable;
    var bits: [4]u8 = @splat(0);
    if (enabled) set_bit(&bits, xlib.xi_raw_motion);
    const root: xlib.Window = @intCast(@backingInt(connection.root));
    var masks = [_]xlib.XIEventMask{.{ .deviceid = xlib.xi_all_master_devices, .mask_len = bits.len, .mask = &bits }};
    if (xi.XISelectEvents(connection.display, root, &masks, 1) != 0) return error.WindowFailure;
    try connection.flush();
}

fn set_bit(bits: []u8, event_type: c_int) void {
    const index: usize = @intCast(event_type);
    bits[index / 8] |= @as(u8, 1) << @intCast(index % 8);
}

/// Translates one XInput2 GenericEvent. The caller has checked the extension
/// opcode. Returns null for events with no public meaning.
pub fn translate(connection: *window.Connection, event: *xlib.Event) window.Error!?window.Event {
    const state = &(connection.xi orelse return null);
    const api = &connection.library.functions;
    const cookie = &event.generic;
    if (api.XGetEventData(connection.display, cookie) == 0) return null;
    defer api.XFreeEventData(connection.display, cookie);
    const data = cookie.data orelse return null;
    switch (cookie.evtype) {
        xlib.xi_raw_motion => {
            const raw: *const xlib.XIRawEvent = @ptrCast(@alignCast(data));
            return raw_motion(connection, state, raw);
        },
        xlib.xi_motion => {
            const device_event: *const xlib.XIDeviceEvent = @ptrCast(@alignCast(data));
            return motion(connection, state, device_event);
        },
        xlib.xi_proximity_in, xlib.xi_proximity_out => {
            const device_event: *const xlib.XIDeviceEvent = @ptrCast(@alignCast(data));
            return proximity(connection, state, device_event, cookie.evtype == xlib.xi_proximity_in);
        },
        xlib.xi_touch_begin, xlib.xi_touch_update, xlib.xi_touch_end => {
            const device_event: *const xlib.XIDeviceEvent = @ptrCast(@alignCast(data));
            const phase: TouchPhase = switch (cookie.evtype) {
                xlib.xi_touch_begin => .begin,
                xlib.xi_touch_update => .update,
                else => .end,
            };
            return touch(device_event, phase);
        },
        else => return null,
    }
}

/// Master pointer motion becomes a motion event; slave devices contribute
/// only their scroll valuators. Emulated pointer motion from touch is ignored.
fn motion(connection: *window.Connection, state: *State, data: *const xlib.XIDeviceEvent) ?window.Event {
    if (data.flags & xlib.xi_pointer_emulated != 0) return null;
    const target = window_id(data.event);
    if (data.deviceid != data.sourceid) {
        return .{ .window = target, .payload = .{ .motion = .{
            .position = .{ .x = @intFromFloat(data.event_x), .y = @intFromFloat(data.event_y) },
            .modifiers = connection.modifiers_for_state(@bitCast(data.mods.effective)),
            .timestamp = @truncate(data.time),
        } } };
    }
    // Pen samples arrive from the tablet's own device (deviceid equal to sourceid).
    if (device_for(connection, state, data.sourceid)) |device| {
        if (device.pen) |pen| return pen_sample(data, pen);
    }
    return scroll(connection, state, data, target);
}

/// A pen sample from a device with pressure: position, pressure and tilt.
fn pen_sample(data: *const xlib.XIDeviceEvent, pen: Pen) window.Event {
    const pressure = if (pen.pressure) |range| normalized(data.valuators, range, 1.0) else 0;
    const tilt_x = if (pen.tilt_x) |range| normalized(data.valuators, range, 90.0) else 0;
    const tilt_y = if (pen.tilt_y) |range| normalized(data.valuators, range, 90.0) else 0;
    return .{ .window = window_id(data.event), .payload = .{ .pen_motion = .{
        .device = data.sourceid,
        .eraser = pen.eraser,
        .down = pressure > 0,
        .position = .{ .x = @floatCast(data.event_x), .y = @floatCast(data.event_y) },
        .pressure = pressure,
        .tilt = .{ .x = tilt_x, .y = tilt_y },
        .timestamp = @truncate(data.time),
    } } };
}

/// Proximity of a pen. Only pen devices produce events.
fn proximity(connection: *window.Connection, state: *State, data: *const xlib.XIDeviceEvent, entering: bool) ?window.Event {
    const device = device_for(connection, state, data.sourceid) orelse return null;
    const pen = device.pen orelse return null;
    return .{ .window = window_id(data.event), .payload = .{ .pen_proximity = .{
        .device = data.sourceid,
        .eraser = pen.eraser,
        .in_proximity = entering,
    } } };
}

/// Value of one valuator in a device event, or null when it is not reported.
fn valuator_value(valuators: xlib.XIValuatorState, number: c_int) ?f64 {
    const mask = valuators.mask orelse return null;
    const values = valuators.values orelse return null;
    if (number < 0 or number >= valuators.mask_len * 8) return null;
    if (!is_set(mask, number)) return null;
    var index: usize = 0;
    var bit: c_int = 0;
    while (bit < number) : (bit += 1) {
        if (is_set(mask, bit)) index += 1;
    }
    return values[index];
}

/// Normalizes an axis value over its range (SDL_x11pen.c's rule): ranges that
/// start below zero map the negative side by its minimum and the positive side by
/// its maximum; other ranges map [min, max] to [0, 1]. The result is multiplied by
/// `scale`. Unreported axes give zero.
fn normalized(valuators: xlib.XIValuatorState, range: Range, scale: f32) f32 {
    const raw = valuator_value(valuators, range.number) orelse return 0;
    var value: f64 = undefined;
    if (range.min < 0) {
        if (raw < 0) {
            value = if (range.min == 0) 0 else raw / -range.min;
        } else {
            value = if (range.max == 0) 0 else raw / range.max;
        }
    } else {
        value = if (range.max - range.min <= 0) 0 else (raw - range.min) / (range.max - range.min);
    }
    const result: f32 = @floatCast(value * scale);
    return std.math.clamp(result, -scale, scale);
}

fn touch(data: *const xlib.XIDeviceEvent, phase: TouchPhase) window.Event {
    return .{ .window = window_id(data.event), .payload = .{ .touch = .{
        .phase = phase,
        .device = data.sourceid,
        .finger = @bitCast(data.detail),
        .position = .{ .x = @floatCast(data.event_x), .y = @floatCast(data.event_y) },
        .timestamp = @truncate(data.time),
    } } };
}

/// Relative axes come from the device's cached valuator numbers. Each set bit
/// of the mask owns the next raw value, so the walk counts every set bit.
fn raw_motion(connection: *window.Connection, state: *State, data: *const xlib.XIRawEvent) ?window.Event {
    const device = device_for(connection, state, data.deviceid) orelse return null;
    const mask = data.valuators.mask orelse return null;
    const values = data.raw_values orelse return null;
    var deltas = [2]f64{ 0, 0 };
    var found = [2]bool{ false, false };
    var value_index: usize = 0;
    var bit: c_int = 0;
    while (bit < data.valuators.mask_len * 8) : (bit += 1) {
        if (!is_set(mask, bit)) continue;
        for (device.relative, 0..) |maybe_number, axis| {
            if (maybe_number) |number| {
                if (number == bit) {
                    deltas[axis] = values[value_index];
                    found[axis] = true;
                }
            }
        }
        value_index += 1;
    }
    if (!found[0] and !found[1]) return null;
    return .{ .window = connection.root, .payload = .{ .raw_motion = .{
        .device = data.sourceid,
        .dx = deltas[0],
        .dy = deltas[1],
        .timestamp = @truncate(data.time),
    } } };
}

/// Converts scroll valuator changes into a smooth scroll event. The first value
/// from an axis only sets the baseline. Horizontal deltas are negated, as in SDL,
/// because the X valuator grows in the opposite direction to Event.wheel.x.
fn scroll(connection: *window.Connection, state: *State, data: *const xlib.XIDeviceEvent, target: window.WindowId) ?window.Event {
    const device = device_for(connection, state, data.deviceid) orelse return null;
    if (device.scroll.len == 0) return null;
    const mask = data.valuators.mask orelse return null;
    const values = data.valuators.values orelse return null;
    var x: f64 = 0;
    var y: f64 = 0;
    var value_index: usize = 0;
    var bit: c_int = 0;
    while (bit < data.valuators.mask_len * 8) : (bit += 1) {
        if (!is_set(mask, bit)) continue;
        for (device.scroll) |*axis| {
            if (axis.number != bit or axis.increment == 0) continue;
            const current = values[value_index];
            const delta = (axis.previous - current) / axis.increment;
            if (axis.previous_valid and @abs(delta) < max_scroll_delta) {
                if (axis.vertical) y += delta else x -= delta;
            }
            axis.previous = current;
            axis.previous_valid = true;
        }
        value_index += 1;
    }
    if (x == 0 and y == 0) return null;
    return .{ .window = target, .payload = .{ .smooth_scroll = .{
        .device = data.sourceid,
        .x = @floatCast(x),
        .y = @floatCast(y),
        .timestamp = @truncate(data.time),
    } } };
}

fn is_set(mask: [*]const u8, bit: c_int) bool {
    const index: usize = @intCast(bit);
    return mask[index / 8] & (@as(u8, 1) << @intCast(index % 8)) != 0;
}

fn window_id(id: xlib.Window) window.WindowId {
    return @fromBackingInt(@intCast(id));
}

/// The cached layout of one device, queried on first use. Returns null only if the
/// cache itself cannot grow.
fn device_for(connection: *window.Connection, state: *State, id: c_int) ?*Device {
    const entry = state.devices.getOrPut(state.allocator, id) catch return null;
    if (entry.found_existing) return entry.value_ptr;
    entry.value_ptr.* = .{};
    const xi = connection.library.xi orelse return entry.value_ptr;
    var count: c_int = 0;
    const info = xi.XIQueryDevice(connection.display, id, &count) orelse return entry.value_ptr;
    defer xi.XIFreeDeviceInfo(info);
    if (count < 1) return entry.value_ptr;
    const classes = info[0].classes orelse return entry.value_ptr;
    const name: []const u8 = if (info[0].name) |text| std.mem.span(text) else "";
    entry.value_ptr.* = parse_device(state, name, classes[0..@intCast(info[0].num_classes)]) catch return entry.value_ptr;
    return entry.value_ptr;
}

/// Whether a device name contains "eraser" in any letter case (SDL_x11pen.c).
fn contains_eraser(name: []const u8) bool {
    const tag = "eraser";
    if (name.len < tag.len) return false;
    for (0..name.len - tag.len + 1) |start| {
        if (std.ascii.eqlIgnoreCase(name[start..][0..tag.len], tag)) return true;
    }
    return false;
}

fn parse_device(state: *State, name: []const u8, classes: []const ?*xlib.XIAnyClassInfo) std.mem.Allocator.Error!Device {
    var device: Device = .{};
    var pen: Pen = .{ .eraser = contains_eraser(name) };
    var first_numbers: [2]?c_int = .{ null, null };
    var valuator_count: usize = 0;
    var axes: std.ArrayList(ScrollAxis) = .empty;
    errdefer axes.deinit(state.allocator);
    for (classes) |maybe_class| {
        const class = maybe_class orelse continue;
        switch (class.type) {
            xlib.xi_class_valuator => {
                const valuator: *const xlib.XIValuatorClassInfo = @ptrCast(@alignCast(class));
                if (valuator.label == state.rel_x) device.relative[0] = valuator.number;
                if (valuator.label == state.rel_y) device.relative[1] = valuator.number;
                if (valuator_count < 2) first_numbers[valuator_count] = valuator.number;
                valuator_count += 1;
                const range: Range = .{ .number = valuator.number, .min = valuator.min, .max = valuator.max };
                if (valuator.label == state.pen_pressure) pen.pressure = range;
                if (valuator.label == state.pen_tilt_x) pen.tilt_x = range;
                if (valuator.label == state.pen_tilt_y) pen.tilt_y = range;
            },
            xlib.xi_class_scroll => {
                const scroll_class: *const xlib.XIScrollClassInfo = @ptrCast(@alignCast(class));
                try axes.append(state.allocator, .{
                    .number = scroll_class.number,
                    .vertical = scroll_class.scroll_type == xlib.xi_scroll_type_vertical,
                    .increment = scroll_class.increment,
                });
            },
            else => {},
        }
    }
    // Unlabelled devices: the first two valuators are relative X and Y (SDL's fallback).
    for (&device.relative, first_numbers) |*relative, first| {
        if (relative.* == null) relative.* = first;
    }
    device.scroll = try axes.toOwnedSlice(state.allocator);
    // Only devices that measure pressure are pens (SDL_x11pen.c).
    if (pen.pressure != null) device.pen = pen;
    return device;
}
