//! Platform-neutral haptic effect model: tagged effect variants, direction
//! encodings, envelopes, timing and the feature set reported by a device.
//! Altered native port of the data types in SDL_haptic.h and the validation
//! performed by SDL_haptic.c. Backends convert these values; nothing here touches
//! a device, allocates, or keeps global state.
//!
//! Numeric conventions follow SDL: directions are in hundredths of a degree,
//! signed levels span the full i16 range, and unsigned levels use 0..65535.
//! Custom samples are borrowed from the caller and are only read during the call
//! that receives the effect, so a device never retains them.

const std = @import("std");

/// Bit set of effect and capability flags. Bit positions equal SDL_HAPTIC_* so
/// the value can be exchanged with serialized SDL masks via `bits`/`from_bits`.
pub const Features = packed struct(u32) {
    constant: bool = false,
    sine: bool = false,
    square: bool = false,
    triangle: bool = false,
    saw_up: bool = false,
    saw_down: bool = false,
    ramp: bool = false,
    spring: bool = false,
    damper: bool = false,
    inertia: bool = false,
    friction: bool = false,
    /// Two-motor rumble (large and small magnitudes), as on XInput pads.
    left_right: bool = false,
    _reserved: u3 = 0,
    custom: bool = false,
    /// Device-wide gain control, see `Device.set_gain`.
    gain: bool = false,
    autocenter: bool = false,
    status: bool = false,
    pause: bool = false,
    _unused: u12 = 0,

    pub const none: Features = .{};

    pub fn bits(self: Features) u32 {
        return @backingInt(self);
    }

    /// Reserved bits are dropped so unknown future flags are never reported.
    pub fn from_bits(value: u32) Features {
        var result: Features = @fromBackingInt(value);
        result._reserved = 0;
        result._unused = 0;
        return result;
    }

    /// True when every flag in `other` is also set in `self`.
    pub fn contains(self: Features, other: Features) bool {
        return self.bits() & other.bits() == other.bits();
    }

    pub fn either(self: Features, other: Features) Features {
        return from_bits(self.bits() | other.bits());
    }
};

/// Waveform of a periodic effect.
pub const Waveform = enum {
    sine,
    square,
    triangle,
    saw_up,
    saw_down,

    pub fn feature(self: Waveform) Features {
        return switch (self) {
            .sine => .{ .sine = true },
            .square => .{ .square = true },
            .triangle => .{ .triangle = true },
            .saw_up => .{ .saw_up = true },
            .saw_down => .{ .saw_down = true },
        };
    }
};

/// Force model of a condition effect. Each kind reacts to motion on its axes.
pub const ConditionKind = enum {
    spring,
    damper,
    inertia,
    friction,

    pub fn feature(self: ConditionKind) Features {
        return switch (self) {
            .spring => .{ .spring = true },
            .damper => .{ .damper = true },
            .inertia => .{ .inertia = true },
            .friction => .{ .friction = true },
        };
    }
};

/// Direction of an effect. Angles are hundredths of a degree (36000 is a full
/// turn). Vector forms use axis components with the first axis pointing east and
/// the second pointing south, as in SDL.
pub const Direction = union(enum) {
    /// Angle from the device's reference direction.
    polar: i32,
    /// Vector components; the third component is carried for SDL parity only.
    cartesian: [3]i32,
    /// Spherical angles; backends that need only a planar direction read the first.
    spherical: [3]i32,
    /// Steering-wheel axis; the backend chooses the physical axis.
    steering_axis,
};

/// Attack and fade shaping. Times are milliseconds; levels use 0..65535.
pub const Envelope = struct {
    attack_length: u16 = 0,
    attack_level: u16 = 0,
    fade_length: u16 = 0,
    fade_level: u16 = 0,
};

/// Scheduling shared by most effects.
pub const Timing = struct {
    /// Duration in milliseconds. Null means the effect runs until stopped.
    length: ?u32 = null,
    /// Milliseconds before the effect starts.
    delay: u16 = 0,
    /// Button that triggers the effect, zero for none.
    button: u16 = 0,
    /// Minimum milliseconds before a button can retrigger the effect.
    interval: u16 = 0,
};

/// A constant force.
pub const Constant = struct {
    timing: Timing = .{},
    direction: Direction,
    level: i16,
    envelope: Envelope = .{},
};

/// A periodic wave. `magnitude` may be negative, which adds 180 degrees of phase.
pub const Periodic = struct {
    timing: Timing = .{},
    direction: Direction,
    waveform: Waveform,
    /// Wave period in milliseconds.
    period: u16,
    magnitude: i16,
    offset: i16 = 0,
    /// Phase shift in hundredths of a degree.
    phase: u16 = 0,
    envelope: Envelope = .{},
};

/// Per-axis response of a condition effect.
pub const ConditionAxis = struct {
    right_saturation: u16 = 0,
    left_saturation: u16 = 0,
    right_coeff: i16 = 0,
    left_coeff: i16 = 0,
    deadband: u16 = 0,
    center: i16 = 0,
};

/// A spring, damper, inertia or friction effect. Linux uses the first two axes.
pub const Condition = struct {
    timing: Timing = .{},
    direction: Direction,
    kind: ConditionKind,
    axes: [3]ConditionAxis = .{ .{}, .{}, .{} },
};

/// A force that moves linearly from `start` to `end`.
pub const Ramp = struct {
    timing: Timing = .{},
    direction: Direction,
    start: i16,
    end: i16,
    envelope: Envelope = .{},
};

/// Two motors of a rumble device. Rumble has no direction, delay or trigger.
pub const LeftRight = struct {
    /// Duration in milliseconds, null for an unlimited effect.
    length: ?u32 = null,
    large_magnitude: u16,
    small_magnitude: u16,
};

/// Sampled waveform. `data` holds `channels * samples` values, interleaved by
/// sample: sample 0 for every channel, then sample 1, and so on.
pub const Custom = struct {
    timing: Timing = .{},
    direction: Direction,
    channels: u8,
    /// Sample period in milliseconds.
    period: u16,
    samples: u16,
    data: []const u16,
    envelope: Envelope = .{},

    pub const Error = error{InvalidCustomData};

    /// Confirms that `data` matches the declared channel and sample counts.
    pub fn validate(self: Custom) Error!void {
        if (self.channels == 0) return error.InvalidCustomData;
        const expected = @as(usize, self.channels) * self.samples;
        if (self.data.len != expected) return error.InvalidCustomData;
    }
};

/// Tag of an `Effect`, used to check that an update keeps the effect type.
pub const Kind = std.meta.Tag(Effect);

/// One force-feedback effect. Each variant carries only the parameters its
/// hardware format uses, so unrelated fields cannot be set by mistake.
pub const Effect = union(enum) {
    constant: Constant,
    periodic: Periodic,
    condition: Condition,
    ramp: Ramp,
    left_right: LeftRight,
    custom: Custom,

    /// Capability bit an effect requires. Periodic and condition effects map to
    /// their specific waveform or force kind.
    pub fn feature(self: Effect) Features {
        return switch (self) {
            .constant => .{ .constant = true },
            .periodic => |p| p.waveform.feature(),
            .condition => |c| c.kind.feature(),
            .ramp => .{ .ramp = true },
            .left_right => .{ .left_right = true },
            .custom => .{ .custom = true },
        };
    }

    pub fn kind(self: Effect) Kind {
        return std.meta.activeTag(self);
    }

    /// Checks parameters that cannot be expressed by the type system alone.
    pub fn validate(self: Effect) Custom.Error!void {
        switch (self) {
            .custom => |c| try c.validate(),
            else => {},
        }
    }
};

/// Largest gain or autocenter percentage accepted by `Device.set_gain` and
/// `Device.set_autocenter`.
pub const max_percent: u8 = 100;
