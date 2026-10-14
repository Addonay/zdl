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
//! Pens (SDL_x11pen.c): a slave pointer or floating device with an "Abs Pressure"
//! valuator is a pen. Pens are enumerated when XInput2 is enabled and tracked
//! through XI_HierarchyChanged (`pen_added`, `pen_removed`); `pens` lists them with
//! their names. A pen is an eraser when its "Wacom Tool Type" property reads
//! "eraser", or failing that when its name contains "eraser". Pressure and tilt
//! come from the labelled valuators and are normalized over each valuator's range.
//! Tilt is scaled to plus or minus 90 degrees, where SDL leaves the normalized
//! value. Proximity follows the "Wacom Serial IDs" property (XI_PropertyEvent);
//! devices without it are reported as always in proximity.
//!
//! Tip and buttons: the tip is button 1 and pen buttons are 2 and up (SDL reports
//! them as button - 1). Button events are selected only on pen devices, so ordinary
//! mice keep delivering core button presses. SDL selects them for every device and
//! handles mice through XI2; this layer keeps the core path for mice.
//!
//! Additions beyond SDL's pressure and tilt axes: "Abs Distance", rotation
//! ("Abs Rotation Z" or "Abs Z", scaled to plus or minus 180 degrees) and slider
//! ("Abs Wheel" or "Abs Throttle"), reported as null when the device lacks them.
//! The rotation and slider labels follow the Wacom and libinput X drivers and are
//! not validated against hardware.
//!
//! Gestures (XI 2.4): pinch begin/update/end with the cumulative scale, as SDL
//! reports them without span or focus. Touch grabs (`grab_touch`) are passive
//! XIGrabTouchBegin grabs, which SDL takes while the mouse is grabbed so a grabbing
//! window keeps touches the window manager would otherwise claim.
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
    /// Pen proximity (XI_PropertyEvent) and, on every pen device, the tip and
    /// buttons (XI_ButtonPress/Release).
    pen: bool = false,
    /// Pinch gestures (XI_GesturePinch*, protocol 2.4).
    gesture: bool = false,
};

/// Phases of a pinch gesture.
pub const PinchPhase = enum { begin, update, end };

/// One step of a pinch gesture. `scale` is relative to the gesture's start (1 at
/// the begin); a cancelled end is reported as an end.
pub const Pinch = struct {
    phase: PinchPhase,
    device: i32,
    scale: f32,
    position: geometry.Point(f32),
    timestamp: u32,
};

/// Tip or button change of a pen. Button 1 is the tip; button n >= 2 is pen
/// button n - 1.
pub const PenButton = struct {
    device: i32,
    button: u8,
    pressed: bool,
    eraser: bool,
    timestamp: u32,
};

/// Which axes a pen reports besides position.
pub const PenAxes = struct {
    pressure: bool = false,
    tilt: bool = false,
    distance: bool = false,
    rotation: bool = false,
    slider: bool = false,
};

/// A pen device. `name` is borrowed from the XInput2 state and stays valid until
/// the pen is removed (`pen_removed`) or the connection closes.
pub const PenInfo = struct {
    device: i32,
    name: []const u8,
    eraser: bool,
    /// Wacom tool type id from "Wacom Serial IDs", or 0.
    wacom_id: u32,
    buttons: u32,
    in_proximity: bool,
    axes: PenAxes,
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
    distance: ?Range = null,
    rotation: ?Range = null,
    slider: ?Range = null,
    eraser: bool = false,
    wacom_id: u32 = 0,
    buttons: u32 = 0,
    /// Owned copy of the device name.
    name: []u8 = &.{},
};

/// Cached device layout: the valuators that carry relative X and Y, the
/// scroll valuators and, for pens, the pen axes. The first valuator numbers fill
/// in when labels are absent.
const Device = struct {
    relative: [2]?c_int = .{ null, null },
    scroll: []ScrollAxis = &.{},
    pen: ?Pen = null,

    fn deinit(self: *Device, allocator: std.mem.Allocator) void {
        allocator.free(self.scroll);
        if (self.pen) |pen| allocator.free(pen.name);
        self.* = .{};
    }
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
    pen_distance: xlib.Atom,
    pen_rotation_z: xlib.Atom,
    pen_rotation_abs_z: xlib.Atom,
    pen_wheel: xlib.Atom,
    pen_throttle: xlib.Atom,
    wacom_serial_ids: xlib.Atom,
    wacom_tool_type: xlib.Atom,
    devices: std.AutoHashMapUnmanaged(c_int, Device) = .empty,
    /// Device ids of the pens currently known, in discovery order.
    pen_ids: std.ArrayList(c_int) = .empty,
    /// Events selected per window, so a new pen can be added to every selection.
    selections: std.AutoHashMapUnmanaged(xlib.Window, Events) = .empty,

    /// Frees the device cache. Called by Connection.deinit.
    pub fn deinit(self: *State) void {
        var iterator = self.devices.valueIterator();
        while (iterator.next()) |device| device.deinit(self.allocator);
        self.devices.deinit(self.allocator);
        self.pen_ids.deinit(self.allocator);
        self.selections.deinit(self.allocator);
        self.* = undefined;
    }

    /// True when the server speaks XInput 2.2, which touch events need.
    pub fn supports_touch(self: *const State) bool {
        return self.at_least(2, 2);
    }

    /// True when the server speaks XInput 2.4, which pinch gestures need.
    pub fn supports_gesture(self: *const State) bool {
        return self.at_least(2, 4);
    }

    fn at_least(self: *const State, major: c_int, minor: c_int) bool {
        return self.major > major or (self.major == major and self.minor >= minor);
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
    // Ask for 2.4 (gestures); the reply carries the highest version the server supports.
    var major: c_int = 2;
    var minor: c_int = 4;
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
        .pen_distance = api.XInternAtom(connection.display, "Abs Distance", 0),
        .pen_rotation_z = api.XInternAtom(connection.display, "Abs Rotation Z", 0),
        .pen_rotation_abs_z = api.XInternAtom(connection.display, "Abs Z", 0),
        .pen_wheel = api.XInternAtom(connection.display, "Abs Wheel", 0),
        .pen_throttle = api.XInternAtom(connection.display, "Abs Throttle", 0),
        .wacom_serial_ids = api.XInternAtom(connection.display, "Wacom Serial IDs", 0),
        .wacom_tool_type = api.XInternAtom(connection.display, "Wacom Tool Type", 0),
    };
    // Device hierarchy and class changes arrive on the root window. Missing the
    // selection only loses hot-plugged pens, so it is not an error.
    select_root_events(connection) catch {};
    scan_pens(connection) catch {};
}

/// Selects hierarchy and device-changed events on the root window.
fn select_root_events(connection: *window.Connection) window.Error!void {
    const xi = connection.library.xi orelse return error.XInputUnavailable;
    var bits: [4]u8 = @splat(0);
    set_bit(&bits, xlib.xi_hierarchy_changed);
    set_bit(&bits, xlib.xi_device_changed);
    const root: xlib.Window = @intCast(@backingInt(connection.root));
    var masks = [_]xlib.XIEventMask{.{ .deviceid = all_devices, .mask_len = bits.len, .mask = &bits }};
    if (xi.XISelectEvents(connection.display, root, &masks, 1) != 0) return error.WindowFailure;
    try connection.flush();
}

/// Finds the pens that exist now and queues a `pen_added` event for each.
fn scan_pens(connection: *window.Connection) window.Error!void {
    const state = &(connection.xi orelse return);
    const xi = connection.library.xi orelse return;
    var count: c_int = 0;
    const info = xi.XIQueryDevice(connection.display, all_devices, &count) orelse return;
    defer xi.XIFreeDeviceInfo(info);
    for (info[0..@intCast(count)]) |device| {
        if (try add_pen(connection, state, device.deviceid)) {
            try connection.queue.append(state.allocator, .{ .window = connection.root, .payload = .{ .pen_added = device.deviceid } });
        }
    }
}

/// Registers `id` as a pen when it is an enabled physical device that measures
/// pressure. Returns whether a new pen was added.
fn add_pen(connection: *window.Connection, state: *State, id: c_int) window.Error!bool {
    for (state.pen_ids.items) |known| if (known == id) return false;
    const xi = connection.library.xi orelse return false;
    var count: c_int = 0;
    const info = xi.XIQueryDevice(connection.display, id, &count) orelse return false;
    defer xi.XIFreeDeviceInfo(info);
    if (count < 1) return false;
    const device = info[0];
    if ((device.use != xlib.xi_slave_pointer and device.use != xlib.xi_floating_slave) or device.enabled == 0) return false;
    // Rebuild the cached layout so button counts and the tool type are current.
    forget_device(state, id);
    const cached = device_for(connection, state, id) orelse return false;
    if (cached.pen == null) return false;
    try state.pen_ids.append(state.allocator, id);
    return true;
}

/// Drops a device from the cache and from the pen list.
fn forget_device(state: *State, id: c_int) void {
    if (state.devices.fetchRemove(id)) |removed| {
        var device = removed.value;
        device.deinit(state.allocator);
    }
}

fn remove_pen(state: *State, id: c_int) bool {
    for (state.pen_ids.items, 0..) |known, index| {
        if (known != id) continue;
        _ = state.pen_ids.orderedRemove(index);
        return true;
    }
    return false;
}

/// The pens currently known, with their names borrowed from the XInput2 state.
/// Free the result with `allocator`. Empty when XInput2 is disabled.
pub fn pens(connection: *window.Connection, allocator: std.mem.Allocator) std.mem.Allocator.Error![]PenInfo {
    const state = &(connection.xi orelse return allocator.alloc(PenInfo, 0));
    var list: std.ArrayList(PenInfo) = .empty;
    errdefer list.deinit(allocator);
    for (state.pen_ids.items) |id| {
        const info = pen_info(connection, id) orelse continue;
        try list.append(allocator, info);
    }
    return list.toOwnedSlice(allocator);
}

/// Describes one pen by its XInput2 device id, or null when it is not a known pen.
pub fn pen_info(connection: *window.Connection, id: i32) ?PenInfo {
    const state = &(connection.xi orelse return null);
    const device = state.devices.getPtr(id) orelse return null;
    const pen = device.pen orelse return null;
    return .{
        .device = id,
        .name = pen.name,
        .eraser = pen.eraser,
        .wacom_id = pen.wacom_id,
        .buttons = pen.buttons,
        .in_proximity = read_proximity(connection, state, id) orelse true,
        .axes = .{
            .pressure = pen.pressure != null,
            .tilt = pen.tilt_x != null or pen.tilt_y != null,
            .distance = pen.distance != null,
            .rotation = pen.rotation != null,
            .slider = pen.slider != null,
        },
    };
}

/// Selects XInput2 events for one window. Passing no events deselects them.
/// Pen button events are selected on each pen device individually, and again for
/// every pen that appears later.
pub fn select_window(connection: *window.Connection, id: xlib.Window, events: Events) window.Error!void {
    const state = &(connection.xi orelse return error.XInputUnavailable);
    const xi = connection.library.xi orelse return error.XInputUnavailable;
    if (events.touch and !state.supports_touch()) return error.TouchUnsupported;
    if (events.gesture and !state.supports_gesture()) return error.TouchUnsupported;
    var bits: [4]u8 = @splat(0);
    if (events.motion) set_bit(&bits, xlib.xi_motion);
    if (events.touch) {
        set_bit(&bits, xlib.xi_touch_begin);
        set_bit(&bits, xlib.xi_touch_update);
        set_bit(&bits, xlib.xi_touch_end);
    }
    if (events.pen) set_bit(&bits, xlib.xi_property_event);
    if (events.gesture) {
        set_bit(&bits, xlib.xi_gesture_pinch_begin);
        set_bit(&bits, xlib.xi_gesture_pinch_update);
        set_bit(&bits, xlib.xi_gesture_pinch_end);
    }
    var button_bits: [4]u8 = @splat(0);
    set_bit(&button_bits, xlib.xi_button_press);
    set_bit(&button_bits, xlib.xi_button_release);
    const pen_count = if (events.pen) state.pen_ids.items.len else 0;
    const masks = try state.allocator.alloc(xlib.XIEventMask, 1 + pen_count);
    defer state.allocator.free(masks);
    masks[0] = .{ .deviceid = all_devices, .mask_len = bits.len, .mask = &bits };
    if (events.pen) for (state.pen_ids.items, masks[1..]) |pen_id, *mask| {
        mask.* = .{ .deviceid = pen_id, .mask_len = button_bits.len, .mask = &button_bits };
    };
    if (xi.XISelectEvents(connection.display, id, masks.ptr, @intCast(masks.len)) != 0) return error.WindowFailure;
    const any = events.motion or events.touch or events.pen or events.gesture;
    if (any) {
        try state.selections.put(state.allocator, id, events);
    } else {
        _ = state.selections.remove(id);
    }
    try connection.flush();
}

/// Forgets the selection of a window that is going away.
pub fn forget_window(connection: *window.Connection, id: xlib.Window) void {
    const state = &(connection.xi orelse return);
    _ = state.selections.remove(id);
}

/// Repeats every pen-selecting window's selection so a new pen's buttons arrive.
fn reselect_pen_windows(connection: *window.Connection, state: *State) void {
    var pending: std.ArrayList(struct { id: xlib.Window, events: Events }) = .empty;
    defer pending.deinit(state.allocator);
    var iterator = state.selections.iterator();
    while (iterator.next()) |entry| {
        if (!entry.value_ptr.pen) continue;
        pending.append(state.allocator, .{ .id = entry.key_ptr.*, .events = entry.value_ptr.* }) catch return;
    }
    for (pending.items) |item| select_window(connection, item.id, item.events) catch {};
}

/// Passively grabs touch begin on `id` for every device (SDL's
/// X11_Xinput2GrabTouch, taken while the mouse is grabbed). Touch and motion
/// events keep flowing to the window; the window manager cannot claim them.
/// Without touch support (XI < 2.2) this does nothing.
pub fn grab_touch(connection: *window.Connection, id: xlib.Window) window.Error!void {
    const state = &(connection.xi orelse return);
    if (!state.supports_touch()) return;
    const xi = connection.library.xi orelse return;
    var bits: [4]u8 = @splat(0);
    set_bit(&bits, xlib.xi_touch_begin);
    set_bit(&bits, xlib.xi_touch_update);
    set_bit(&bits, xlib.xi_touch_end);
    set_bit(&bits, xlib.xi_motion);
    var mask: xlib.XIEventMask = .{ .deviceid = all_devices, .mask_len = bits.len, .mask = &bits };
    var modifiers = [_]xlib.XIGrabModifiers{.{ .modifiers = xlib.xi_any_modifier, .status = 0 }};
    _ = xi.XIGrabTouchBegin(connection.display, all_devices, id, 1, &mask, 1, &modifiers);
    try connection.flush();
}

/// Releases the grab taken by `grab_touch`.
pub fn ungrab_touch(connection: *window.Connection, id: xlib.Window) window.Error!void {
    const state = &(connection.xi orelse return);
    if (!state.supports_touch()) return;
    const xi = connection.library.xi orelse return;
    var modifiers = [_]xlib.XIGrabModifiers{.{ .modifiers = xlib.xi_any_modifier, .status = 0 }};
    _ = xi.XIUngrabTouchBegin(connection.display, all_devices, id, 1, &modifiers);
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
        xlib.xi_property_event => {
            const property_event: *const xlib.XIPropertyEvent = @ptrCast(@alignCast(data));
            return proximity(connection, state, property_event);
        },
        xlib.xi_button_press, xlib.xi_button_release => {
            const device_event: *const xlib.XIDeviceEvent = @ptrCast(@alignCast(data));
            return pen_button(connection, state, device_event, cookie.evtype == xlib.xi_button_press);
        },
        xlib.xi_hierarchy_changed => {
            const hierarchy_event: *const xlib.XIHierarchyEvent = @ptrCast(@alignCast(data));
            try hierarchy(connection, state, hierarchy_event);
            return null;
        },
        xlib.xi_device_changed => {
            const changed: *const xlib.XIDeviceChangedEvent = @ptrCast(@alignCast(data));
            // Only non-pen devices are rebuilt here; a pen keeps its identity and
            // its cache entry is refreshed lazily on the next hierarchy change.
            if (!is_pen(state, changed.deviceid)) forget_device(state, changed.deviceid);
            return null;
        },
        xlib.xi_gesture_pinch_begin, xlib.xi_gesture_pinch_update, xlib.xi_gesture_pinch_end => {
            const pinch_event: *const xlib.XIGesturePinchEvent = @ptrCast(@alignCast(data));
            return .{ .window = window_id(pinch_event.event), .payload = .{ .pinch = .{
                .phase = switch (cookie.evtype) {
                    xlib.xi_gesture_pinch_begin => .begin,
                    xlib.xi_gesture_pinch_update => .update,
                    else => .end,
                },
                .device = pinch_event.sourceid,
                .scale = if (cookie.evtype == xlib.xi_gesture_pinch_update) @floatCast(pinch_event.scale) else 1.0,
                .position = .{ .x = @floatCast(pinch_event.event_x), .y = @floatCast(pinch_event.event_y) },
                .timestamp = @truncate(pinch_event.time),
            } } };
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

/// A pen sample from a device with pressure: position, pressure, tilt and the
/// optional distance, rotation and slider axes.
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
        .distance = if (pen.distance) |range| normalized(data.valuators, range, 1.0) else null,
        .rotation = if (pen.rotation) |range| normalized(data.valuators, range, 180.0) else null,
        .slider = if (pen.slider) |range| normalized(data.valuators, range, 1.0) else null,
        .timestamp = @truncate(data.time),
    } } };
}

fn is_pen(state: *const State, id: c_int) bool {
    for (state.pen_ids.items) |known| if (known == id) return true;
    return false;
}

/// Proximity of a pen from a change of its "Wacom Serial IDs" property. Other
/// properties and other devices produce no event.
fn proximity(connection: *window.Connection, state: *State, data: *const xlib.XIPropertyEvent) ?window.Event {
    if (data.what != xlib.xi_property_modified or data.property != state.wacom_serial_ids) return null;
    if (!is_pen(state, data.deviceid)) return null;
    const device = device_for(connection, state, data.deviceid) orelse return null;
    const pen = device.pen orelse return null;
    const in_proximity = read_proximity(connection, state, data.deviceid) orelse return null;
    return .{ .window = connection.root, .payload = .{ .pen_proximity = .{
        .device = data.deviceid,
        .eraser = pen.eraser,
        .in_proximity = in_proximity,
    } } };
}

/// Reads the pen's proximity from "Wacom Serial IDs" (SDL_x11pen.c): the tool is
/// in range when either of the last two words is nonzero. Null when the device has
/// no such property.
fn read_proximity(connection: *window.Connection, state: *State, id: c_int) ?bool {
    var words: [5]i32 = undefined;
    if (read_int_property(connection, id, state.wacom_serial_ids, &words) != 5) return null;
    return words[4] != 0 or words[3] != 0;
}

/// Reads up to `out.len` integers of an integer property of a device. Returns how
/// many were read (0 when the property is absent or has another type). Format 32
/// items arrive as C longs.
fn read_int_property(connection: *window.Connection, id: c_int, property: xlib.Atom, out: []i32) usize {
    const xi = connection.library.xi orelse return 0;
    const api = &connection.library.functions;
    var actual_type: xlib.Atom = 0;
    var format: c_int = 0;
    var count: c_ulong = 0;
    var after: c_ulong = 0;
    var data: ?[*]u8 = null;
    if (xi.XIGetProperty(connection.display, id, property, 0, @intCast(out.len), 0, xlib.xa_integer, &actual_type, &format, &count, &after, &data) != 0) return 0;
    const bytes = data orelse return 0;
    defer _ = api.XFree(bytes);
    if (actual_type != xlib.xa_integer or count == 0) return 0;
    const n = @min(out.len, @as(usize, @intCast(count)));
    for (out[0..n], 0..) |*item, index| {
        item.* = switch (format) {
            8 => @as(i8, @bitCast(bytes[index])),
            16 => std.mem.readInt(i16, bytes[index * 2 ..][0..2], .native),
            // XIGetProperty hands 32-bit items back as C longs, as XGetWindowProperty does.
            else => @truncate(std.mem.readInt(i64, bytes[index * 8 ..][0..8], .native)),
        };
    }
    return n;
}

/// Whether the device is an eraser: its "Wacom Tool Type" property (an atom or a
/// string) reads "eraser", else the name contains "eraser" (SDL_x11pen.c).
fn is_eraser(connection: *window.Connection, state: *const State, id: c_int, name: []const u8) bool {
    if (state.wacom_tool_type != 0) if (read_tool_type(connection, state, id)) |is_eraser_tool| return is_eraser_tool;
    return contains_eraser(name);
}

fn read_tool_type(connection: *window.Connection, state: *const State, id: c_int) ?bool {
    const xi = connection.library.xi orelse return null;
    const api = &connection.library.functions;
    var actual_type: xlib.Atom = 0;
    var format: c_int = 0;
    var count: c_ulong = 0;
    var after: c_ulong = 0;
    var data: ?[*]u8 = null;
    if (xi.XIGetProperty(connection.display, id, state.wacom_tool_type, 0, 32, 0, xlib.any_property_type, &actual_type, &format, &count, &after, &data) != 0) return null;
    const bytes = data orelse return null;
    defer _ = api.XFree(bytes);
    if (count == 0) return null;
    if (actual_type == xlib.xa_atom) {
        const atom: xlib.Atom = std.mem.readInt(c_ulong, bytes[0..@sizeOf(c_ulong)], .native);
        if (atom == 0) return null;
        const name_ptr = api.XGetAtomName(connection.display, atom) orelse return null;
        defer _ = api.XFree(@ptrCast(name_ptr));
        return std.ascii.eqlIgnoreCase(std.mem.span(name_ptr), "eraser");
    }
    if (actual_type == xlib.xa_string and format == 8) {
        return std.ascii.eqlIgnoreCase(bytes[0..@intCast(count)], "eraser");
    }
    return null;
}

/// Pen tip and button events. Events copied to master devices are dropped so each
/// press is reported once.
fn pen_button(connection: *window.Connection, state: *State, data: *const xlib.XIDeviceEvent, pressed: bool) ?window.Event {
    if (data.deviceid != data.sourceid) return null;
    if (!is_pen(state, data.sourceid)) return null;
    const device = device_for(connection, state, data.sourceid) orelse return null;
    const pen = device.pen orelse return null;
    return .{ .window = window_id(data.event), .payload = .{ .pen_button = .{
        .device = data.sourceid,
        .button = std.math.cast(u8, data.detail) orelse return null,
        .pressed = pressed,
        .eraser = pen.eraser,
        .timestamp = @truncate(data.time),
    } } };
}

/// Adds and removes pens as the device hierarchy changes, queueing `pen_added`
/// and `pen_removed` events (SDL's XI_HierarchyChanged handling).
fn hierarchy(connection: *window.Connection, state: *State, data: *const xlib.XIHierarchyEvent) window.Error!void {
    const infos = (data.info orelse return)[0..@intCast(data.num_info)];
    var added = false;
    for (infos) |info| {
        if (info.flags & (xlib.xi_slave_removed | xlib.xi_device_disabled) != 0) {
            const removed = remove_pen(state, info.deviceid);
            forget_device(state, info.deviceid);
            if (removed) try connection.queue.append(state.allocator, .{ .window = connection.root, .payload = .{ .pen_removed = info.deviceid } });
        } else if (info.flags & (xlib.xi_slave_added | xlib.xi_device_enabled) != 0) {
            if (try add_pen(connection, state, info.deviceid)) {
                added = true;
                try connection.queue.append(state.allocator, .{ .window = connection.root, .payload = .{ .pen_added = info.deviceid } });
            }
        }
    }
    if (added) reselect_pen_windows(connection, state);
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
    entry.value_ptr.* = parse_device(connection, state, id, name, classes[0..@intCast(info[0].num_classes)]) catch return entry.value_ptr;
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

fn parse_device(connection: *window.Connection, state: *State, id: c_int, name: []const u8, classes: []const ?*xlib.XIAnyClassInfo) std.mem.Allocator.Error!Device {
    var device: Device = .{};
    var pen: Pen = .{};
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
                if (valuator.label == state.pen_distance) pen.distance = range;
                if (valuator.label == state.pen_rotation_z or valuator.label == state.pen_rotation_abs_z) pen.rotation = range;
                if (valuator.label == state.pen_wheel or valuator.label == state.pen_throttle) pen.slider = range;
            },
            xlib.xi_class_button => {
                const button_class: *const xlib.XIButtonClassInfo = @ptrCast(@alignCast(class));
                pen.buttons += @intCast(@max(button_class.num_buttons, 0));
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
    // Only devices that measure pressure are pens (SDL_x11pen.c).
    if (pen.pressure != null) {
        pen.eraser = is_eraser(connection, state, id, name);
        var serial: [3]i32 = undefined;
        if (read_int_property(connection, id, state.wacom_serial_ids, &serial) == 3) pen.wacom_id = @bitCast(serial[2]);
        pen.name = try state.allocator.dupe(u8, name);
        device.pen = pen;
    }
    errdefer if (device.pen) |owned| state.allocator.free(owned.name);
    device.scroll = try axes.toOwnedSlice(state.allocator);
    return device;
}

test "eraser names match in any letter case" {
    try std.testing.expect(contains_eraser("Wacom Intuos Pro M Pen eraser"));
    try std.testing.expect(contains_eraser("ERASER"));
    try std.testing.expect(!contains_eraser("Wacom Intuos Pro M Pen stylus"));
    try std.testing.expect(!contains_eraser("era"));
}

test "axis values normalize over their range" {
    // Valuators 0 and 2 are present; their values are 5 and -45 (bit 1 is unset).
    var mask = [_]u8{0b101};
    var values = [_]f64{ 5, -45 };
    const state: xlib.XIValuatorState = .{ .mask_len = 1, .mask = &mask, .values = &values };
    // Pressure 0..10 gives one half.
    try std.testing.expectEqual(@as(f32, 0.5), normalized(state, .{ .number = 0, .min = 0, .max = 10 }, 1.0));
    // A symmetric tilt range maps the negative side by its minimum: -45 / 90 of 90 degrees.
    try std.testing.expectEqual(@as(f32, -45), normalized(state, .{ .number = 2, .min = -90, .max = 90 }, 90.0));
    // An unreported valuator reads as zero.
    try std.testing.expectEqual(@as(f32, 0), normalized(state, .{ .number = 1, .min = 0, .max = 10 }, 1.0));
}
