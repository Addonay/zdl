//! Virtual joysticks: software-defined devices whose state the application sets
//! directly, with typed host callbacks for rumble, LEDs and effects.
//!
//! Port of SDL_virtualjoystick.c and SDL_AttachVirtualJoystick. The device is a
//! `joystick.Joystick` with a "virtual" GUID (driver byte 'v'), so the gamepad
//! layer treats it like a hardware device.
//!
//! Callbacks: SDL passes a `void *userdata` with function pointers. Here the
//! host supplies a concrete `Owner` type instead. `Virtual(Owner)` calls the
//! declarations `Owner` provides, when present:
//! - `pub fn update(owner: *Owner, device: anytype) void`
//! - `pub fn rumble(owner: *Owner, low: u16, high: u16) bool`
//! - `pub fn rumble_triggers(owner: *Owner, left: u16, right: u16) bool`
//! - `pub fn set_led(owner: *Owner, red: u8, green: u8, blue: u8) bool`
//! - `pub fn send_effect(owner: *Owner, data: []const u8) bool`
//! - `pub fn set_sensors_enabled(owner: *Owner, enabled: bool) bool`
//! Missing declarations report "not supported" (false), as SDL does for NULL
//! function pointers. The owner pointer is typed and borrowed; the host keeps it
//! alive for the device's lifetime.
//!
//! Ownership: `Virtual` owns its `Joystick` state. `deinit` releases it.
//!
//! Deliberate differences: no touchpad or sensor descriptions (pending), and the
//! player index is not stored here.
const std = @import("std");
const joystick = @import("joystick.zig");

/// Shape of a virtual device. The name is copied into the GUID only, so the
/// caller may free it after `Virtual.init`.
pub const Description = struct {
    name: []const u8,
    vendor: u16 = 0,
    product: u16 = 0,
    axes: usize = 0,
    buttons: usize = 0,
    hats: usize = 0,
    balls: usize = 0,
    /// Stored in the GUID driver-data byte, as SDL stores the joystick type.
    kind: u8 = 0,
};

/// A virtual joystick whose host callbacks are typed by `Owner`.
pub fn Virtual(comptime Owner: type) type {
    return struct {
        const Self = @This();

        allocator: std.mem.Allocator,
        owner: *Owner,
        state: joystick.Joystick,

        /// Creates the device state. Release with `deinit`.
        pub fn init(allocator: std.mem.Allocator, owner: *Owner, desc: Description) std.mem.Allocator.Error!Self {
            const guid = joystick.create_guid(.{
                .bus = joystick.bus.virtual,
                .vendor = desc.vendor,
                .product = desc.product,
                .version = 0,
                .product_name = desc.name,
                .driver_signature = 'v',
                .driver_data = desc.kind,
            });
            return .{
                .allocator = allocator,
                .owner = owner,
                .state = try joystick.Joystick.init(allocator, guid, .{
                    .axes = desc.axes,
                    .buttons = desc.buttons,
                    .hats = desc.hats,
                    .balls = desc.balls,
                }),
            };
        }

        pub fn deinit(self: *Self) void {
            self.state.deinit();
            self.* = undefined;
        }

        /// Read access to the device state for queries and gamepad mapping.
        pub fn joystick_state(self: *const Self) *const joystick.Joystick {
            return &self.state;
        }

        /// Sets an axis value. See `joystick.Joystick.set_axis`.
        pub fn set_axis(self: *Self, out: *std.ArrayList(joystick.Change), timestamp: u64, index: usize, value: i16) std.mem.Allocator.Error!void {
            try self.state.set_axis(self.allocator, out, timestamp, index, value);
        }

        /// Sets a button state. See `joystick.Joystick.set_button`.
        pub fn set_button(self: *Self, out: *std.ArrayList(joystick.Change), timestamp: u64, index: usize, down: bool) std.mem.Allocator.Error!void {
            try self.state.set_button(self.allocator, out, timestamp, index, down);
        }

        /// Sets a hat position. See `joystick.Joystick.set_hat`.
        pub fn set_hat(self: *Self, out: *std.ArrayList(joystick.Change), timestamp: u64, index: usize, value: joystick.Hat) std.mem.Allocator.Error!void {
            try self.state.set_hat(self.allocator, out, timestamp, index, value);
        }

        /// Adds relative ball motion. See `joystick.Joystick.set_ball`.
        pub fn set_ball(self: *Self, out: *std.ArrayList(joystick.Change), timestamp: u64, index: usize, dx: i16, dy: i16) std.mem.Allocator.Error!void {
            try self.state.set_ball(self.allocator, out, timestamp, index, dx, dy);
        }

        /// Asks the owner to refresh its state before the host reads it (SDL's Update).
        pub fn request_update(self: *Self) void {
            if (@hasDecl(Owner, "update")) Owner.update(self.owner, self);
        }

        pub fn rumble(self: *Self, low: u16, high: u16) bool {
            if (@hasDecl(Owner, "rumble")) return Owner.rumble(self.owner, low, high);
            return false;
        }

        pub fn rumble_triggers(self: *Self, left: u16, right: u16) bool {
            if (@hasDecl(Owner, "rumble_triggers")) return Owner.rumble_triggers(self.owner, left, right);
            return false;
        }

        pub fn set_led(self: *Self, red: u8, green: u8, blue: u8) bool {
            if (@hasDecl(Owner, "set_led")) return Owner.set_led(self.owner, red, green, blue);
            return false;
        }

        pub fn send_effect(self: *Self, data: []const u8) bool {
            if (@hasDecl(Owner, "send_effect")) return Owner.send_effect(self.owner, data);
            return false;
        }

        pub fn set_sensors_enabled(self: *Self, enabled: bool) bool {
            if (@hasDecl(Owner, "set_sensors_enabled")) return Owner.set_sensors_enabled(self.owner, enabled);
            return false;
        }
    };
}
