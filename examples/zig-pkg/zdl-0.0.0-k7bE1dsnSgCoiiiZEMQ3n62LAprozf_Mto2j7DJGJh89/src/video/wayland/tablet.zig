//! Pen tablet tools (zwp_tablet_v2) for the Wayland backend: the state each tool
//! accumulates from its protocol events, and the frame rules SDL applies to turn
//! that state into pen samples (SDL_waylandevents.c, `tablet_tool_handle_frame`).
//!
//! Protocol flow: the tablet seat announces a tool; the tool then sends its
//! description (type, hardware id, capabilities) and `done`; afterwards proximity,
//! tip, motion, axis and button state changes, each group closed by `frame`.
//! `Tool` records the events between frames in a `Pending` value and `frame`
//! converts it into `Sample`s in SDL's order: proximity-in, tip and motion (motion
//! before a tip-down, after a tip-up), axes, buttons, then proximity-out.
//!
//! Units: pressure and distance are normalized to 0..1 from the protocol's 16-bit
//! values; tilt and rotation are degrees (rotation folded into -180..180); slider
//! is -1..1. Motion is in surface-local logical coordinates of the surface the
//! tool is over.
//!
//! Deliberate differences from SDL: tools are not registered with a global pen
//! table; the owning `Window` assigns ids. Tool cursors (wp_cursor_shape for tools)
//! and the wheel axis are not implemented. Frames of a tool whose `done` has not
//! arrived yet are discarded instead of accumulating, which SDL does not do.

const binding = @import("binding.zig");

/// Physical tool role, as SDL_PEN_TYPE. Protocol types outside these map to unknown.
pub const Kind = enum { unknown, pen, pencil, airbrush, brush, eraser };

/// Axes reported in `Sample.axis`, in SDL's order.
pub const Axis = enum { pressure, xtilt, ytilt, distance, rotation, slider };

/// Capabilities the tool advertised before `done`.
pub const Capabilities = packed struct(u32) {
    xtilt: bool = false,
    ytilt: bool = false,
    pressure: bool = false,
    distance: bool = false,
    rotation: bool = false,
    slider: bool = false,
    _: u26 = 0,
};

/// Description of a tool that SDL would report as a pen: its id, role and hardware id.
pub const Info = struct {
    id: u32,
    kind: Kind,
    /// Low 32 bits of the Wacom hardware id (0 when none).
    wacom_id: u32,
    capabilities: Capabilities,
};

/// One change reported for a tool in a frame.
pub const Sample = union(enum) {
    /// The tool entered (true) or left (false) proximity.
    proximity: bool,
    /// The tip touched (true) or lifted (false).
    touch: bool,
    /// Surface-local position in logical units.
    motion: struct { x: f64, y: f64 },
    /// A changed axis value, see `Axis` for units.
    axis: struct { axis: Axis, value: f32 },
    /// A stylus button (1 to 3, from BTN_STYLUS, BTN_STYLUS2 and BTN_STYLUS3).
    button: struct { button: u8, pressed: bool },
};

/// The samples of one frame, in emission order. Capacity covers every sample a
/// frame can produce (proximity, touch, motion, six axes, three buttons).
pub const Frame = struct {
    items: [12]Sample = undefined,
    len: u8 = 0,

    pub fn slice(self: *const Frame) []const Sample {
        return self.items[0..self.len];
    }

    fn push(self: *Frame, sample: Sample) void {
        self.items[self.len] = sample;
        self.len += 1;
    }
};

/// Tip state within the current frame.
const Tip = enum { none, down, up };

/// Events accumulated since the last frame. Cleared by `frame`.
const Pending = struct {
    have_proximity: bool = false,
    in_proximity: bool = false,
    have_motion: bool = false,
    x: f64 = 0,
    y: f64 = 0,
    tip: Tip = .none,
    /// Axis values set in this frame, indexed by `Axis`.
    axes: [6]?f32 = @splat(null),
    /// Button state set in this frame: null unchanged, true pressed, false released.
    buttons: [3]?bool = @splat(null),
};

/// One tool. `proxy` is the `zwp_tablet_tool_v2` object; the window destroys it.
pub const Tool = struct {
    proxy: binding.Proxy,
    /// Assigned by the window when the tool is announced; 0 while it is not.
    id: u32 = 0,
    kind: Kind = .unknown,
    wacom_id: u32 = 0,
    capabilities: Capabilities = .{},
    /// True while the tool is over one of the window's surfaces. Motion is only
    /// reported then, as SDL reports motion only for its focus window.
    focused: bool = false,
    pending: Pending = .{},

    /// Maps the protocol `type` enum (`zwp_tablet_tool_v2.type`).
    pub fn set_type(self: *Tool, protocol_type: u32) void {
        self.kind = switch (protocol_type) {
            0x140 => .pen,
            0x141 => .eraser,
            0x142 => .brush,
            0x143 => .pencil,
            0x144 => .airbrush,
            else => .unknown,
        };
    }

    /// Adds one `zwp_tablet_tool_v2.capability` value. Tilt sets both tilt axes.
    pub fn add_capability(self: *Tool, protocol_capability: u32) void {
        switch (protocol_capability) {
            1 => {
                self.capabilities.xtilt = true;
                self.capabilities.ytilt = true;
            },
            2 => self.capabilities.pressure = true,
            3 => self.capabilities.distance = true,
            4 => self.capabilities.rotation = true,
            5 => self.capabilities.slider = true,
            else => {},
        }
    }

    /// Whether `done` should announce the tool: SDL only reports tools whose
    /// role it knows.
    pub fn announceable(self: *const Tool) bool {
        return self.kind != .unknown;
    }

    pub fn info(self: *const Tool) Info {
        return .{ .id = self.id, .kind = self.kind, .wacom_id = self.wacom_id, .capabilities = self.capabilities };
    }

    /// Proximity change. `focused` tells whether the entered surface belongs to
    /// the window.
    pub fn proximity_in(self: *Tool, focused: bool) void {
        self.focused = focused;
        self.pending.have_proximity = true;
        self.pending.in_proximity = true;
    }

    pub fn proximity_out(self: *Tool) void {
        self.pending.have_proximity = true;
        self.pending.in_proximity = false;
    }

    pub fn down(self: *Tool) void {
        self.pending.tip = .down;
    }

    pub fn up(self: *Tool) void {
        self.pending.tip = .up;
    }

    /// Surface-local position in logical units (the protocol's fixed values are
    /// converted by the caller). Ignored while the tool is not over the window.
    pub fn motion(self: *Tool, x: f64, y: f64) void {
        if (!self.focused) return;
        self.pending.x = x;
        self.pending.y = y;
        self.pending.have_motion = true;
    }

    /// Pressure from the 16-bit protocol value. A non-zero pressure means the tip
    /// is on the surface, so distance is cleared, as SDL does.
    pub fn pressure(self: *Tool, raw: u32) void {
        self.pending.axes[@backingInt(Axis.pressure)] = normalize16(raw);
        if (raw != 0) self.pending.axes[@backingInt(Axis.distance)] = 0;
    }

    /// Hover distance from the 16-bit protocol value. Non-zero distance clears pressure.
    pub fn distance(self: *Tool, raw: u32) void {
        self.pending.axes[@backingInt(Axis.distance)] = normalize16(raw);
        if (raw != 0) self.pending.axes[@backingInt(Axis.pressure)] = 0;
    }

    /// Tilt in degrees.
    pub fn tilt(self: *Tool, x_degrees: f64, y_degrees: f64) void {
        self.pending.axes[@backingInt(Axis.xtilt)] = @floatCast(x_degrees);
        self.pending.axes[@backingInt(Axis.ytilt)] = @floatCast(y_degrees);
    }

    /// Z rotation in degrees, mapped to -180..180.
    pub fn rotation(self: *Tool, degrees: f64) void {
        const folded = if (degrees > 180.0) degrees - 360.0 else degrees;
        self.pending.axes[@backingInt(Axis.rotation)] = @floatCast(folded);
    }

    /// Slider position from the protocol's signed value (-65535..65535).
    pub fn slider(self: *Tool, position: i32) void {
        self.pending.axes[@backingInt(Axis.slider)] = @as(f32, @floatFromInt(position)) / 65535.0;
    }

    /// Stylus button by evdev code. Other buttons are ignored, as in SDL.
    pub fn button(self: *Tool, code: u32, pressed: bool) void {
        const index: usize = switch (code) {
            0x14b => 0, // BTN_STYLUS
            0x14c => 1, // BTN_STYLUS2
            0x149 => 2, // BTN_STYLUS3
            else => return,
        };
        self.pending.buttons[index] = pressed;
    }

    /// Converts the accumulated state into samples in `out` and clears it. Order
    /// follows SDL: proximity-in; when the tip changed while moving, motion is
    /// sent before a tip-down and after a tip-up; then axes, buttons and proximity-out.
    pub fn frame(self: *Tool, out: *Frame) void {
        out.* = .{};
        const pending = self.pending;
        self.pending = .{};
        if (pending.have_proximity and pending.in_proximity) out.push(.{ .proximity = true });
        if (pending.have_motion and pending.tip != .none) {
            const sample_motion: Sample = .{ .motion = .{ .x = pending.x, .y = pending.y } };
            if (pending.tip == .down) {
                out.push(sample_motion);
                out.push(.{ .touch = true });
            } else {
                out.push(.{ .touch = false });
                out.push(sample_motion);
            }
        } else {
            switch (pending.tip) {
                .none => {},
                .down => out.push(.{ .touch = true }),
                .up => out.push(.{ .touch = false }),
            }
            if (pending.have_motion) out.push(.{ .motion = .{ .x = pending.x, .y = pending.y } });
        }
        for (pending.axes, 0..) |value, index| {
            if (value) |amount| out.push(.{ .axis = .{ .axis = @fromBackingInt(@intCast(index)), .value = amount } });
        }
        for (pending.buttons, 0..) |state, index| {
            if (state) |pressed| out.push(.{ .button = .{ .button = @intCast(index + 1), .pressed = pressed } });
        }
        if (pending.have_proximity and !pending.in_proximity) {
            out.push(.{ .proximity = false });
            self.focused = false;
        }
    }
};

/// Divides a 16-bit protocol value by 65535 (SDL's normalization for pressure and distance).
fn normalize16(raw: u32) f32 {
    return @as(f32, @floatFromInt(raw)) / 65535.0;
}
