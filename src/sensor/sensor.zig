//! Sensor types, sample storage and the state update model.
//!
//! Altered native port of the core of SDL's sensor subsystem (SDL_sensor.c,
//! SDL_sensor.h, SDL_syssensor.h): sensor type identifiers, the standard gravity
//! constant, a 16-value state array per sensor, and the update step that stores
//! a sample and produces the event SDL would push.
//!
//! Linux has no native sensor backend in SDL, so this module provides no device
//! discovery on Linux. Platform code or a game-controller driver feeds samples
//! through `Sensor.update`. The returned `Event` replaces SDL's global event push,
//! and no registry, thread or event queue exists here.

const std = @import("std");

/// Standard gravity in m/s^2, as SDL_STANDARD_GRAVITY. Accelerometers report in
/// multiples of this value, so 1.0 means one g.
pub const standard_gravity: f32 = 9.80665;

/// Values stored per sensor (SDL_syssensor.h uses `float data[16]`).
pub const max_values = 16;

/// Values carried by an update event (SDL_SensorEvent uses `float data[6]`).
/// Callers can read the full state with `Sensor.read`.
pub const event_values = 6;

/// Sensor identifier assigned by the platform or driver that owns the sensor.
/// Identifiers are not allocated here, so they stay local to that owner.
pub const Id = u32;

/// Sensor category, matching SDL_SensorType. Values are stable and may be
/// serialized. The `invalid` value marks lookups that failed.
pub const Type = enum(i8) {
    invalid = -1,
    unknown = 0,
    /// Accelerometer in m/s^2.
    accel = 1,
    /// Gyroscope in radians per second.
    gyro = 2,
    /// Accelerometer for the left Joy-Con and Wii nunchuk.
    accel_l = 3,
    /// Gyroscope for the left Joy-Con.
    gyro_l = 4,
    /// Accelerometer for the right Joy-Con.
    accel_r = 5,
    /// Gyroscope for the right Joy-Con.
    gyro_r = 6,

    /// True for accelerometer types, whose values are measured in `standard_gravity` units.
    pub fn is_accelerometer(self: Type) bool {
        return switch (self) {
            .accel, .accel_l, .accel_r => true,
            else => false,
        };
    }

    /// True for gyroscope types, whose values are angular rates in radians per second.
    pub fn is_gyroscope(self: Type) bool {
        return switch (self) {
            .gyro, .gyro_l, .gyro_r => true,
            else => false,
        };
    }
};

/// One update delivered to the consumer. `values` holds up to `event_values`
/// samples. The full state, up to `max_values` values, is available from the
/// `Sensor` after the update.
pub const Event = struct {
    timestamp_ns: u64,
    sensor_id: Id,
    /// Timestamp from the sensor's own clock, in nanoseconds.
    sensor_timestamp_ns: u64,
    values: [event_values]f32,
    /// Number of meaningful entries in `values`.
    count: usize,
};

/// One sensor's identity and last sample. The `name` slice is borrowed from the
/// owner, who must keep it alive while the sensor exists.
///
/// Mutation is not synchronized. A sensor is updated by the thread that owns its
/// driver. Share it behind the owner's lock if another thread reads it.
pub const Sensor = struct {
    instance_id: Id,
    name: []const u8,
    sensor_type: Type,
    /// Platform-specific sensor type, or -1 when none applies (SDL's non-portable type).
    non_portable_type: i32 = -1,
    /// Latest sample, zero-filled until the first update.
    data: [max_values]f32 = @splat(0),

    /// Creates a sensor with zeroed state. No device is opened.
    pub fn init(instance_id: Id, name: []const u8, sensor_type: Type, non_portable_type: i32) Sensor {
        return .{
            .instance_id = instance_id,
            .name = name,
            .sensor_type = sensor_type,
            .non_portable_type = non_portable_type,
        };
    }

    /// Copies up to `out.len` and `max_values` of the latest sample into `out`
    /// and returns the number copied. Matches SDL_GetSensorData, which clamps the
    /// requested count to the stored array size.
    pub fn read(self: Sensor, out: []f32) usize {
        const count = @min(out.len, max_values);
        @memcpy(out[0..count], self.data[0..count]);
        return count;
    }

    /// Stores a new sample and returns the event describing it.
    ///
    /// Duplicate samples are accepted, since SDL allows repeated step and heartbeat
    /// values. Values beyond `max_values` are dropped from the stored state, and
    /// the event carries at most `event_values` of them.
    pub fn update(self: *Sensor, timestamp_ns: u64, sensor_timestamp_ns: u64, values: []const f32) Event {
        const stored = @min(values.len, max_values);
        @memcpy(self.data[0..stored], values[0..stored]);

        const carried = @min(values.len, event_values);
        var event_data: [event_values]f32 = @splat(0);
        @memcpy(event_data[0..carried], values[0..carried]);
        return .{
            .timestamp_ns = timestamp_ns,
            .sensor_id = self.instance_id,
            .sensor_timestamp_ns = sensor_timestamp_ns,
            .values = event_data,
            .count = carried,
        };
    }
};
