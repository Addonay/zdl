//! Keyboard and mouse device registries, ported from SDL's device bookkeeping in
//! `events/SDL_keyboard.c` (SDL_AddKeyboard, SDL_RemoveKeyboard, SDL_GetKeyboards,
//! SDL_GetKeyboardNameForID, SDL_IsKeyboard) and `events/SDL_mouse.c` (SDL_AddMouse,
//! SDL_RemoveMouse, SDL_GetMice, SDL_GetMouseNameForID, SDL_IsMouse). Touch device
//! naming follows SDL_GetMouseNameForID's rule for `SDL_TOUCH_MOUSEID`, which names the
//! mouse after the first touch device.
//!
//! Ownership:
//! - A `Registry` is an explicit value owned by the caller (typically one per
//!   platform). It holds the ordered id lists and owned copies of every device name,
//!   allocated with the allocator given to `init`. There is no process-wide list.
//! - Name slices returned by the lookups are borrowed. They stay valid until that
//!   device is removed, the registry is deinitialized, or another add/remove call
//!   reallocates the table; copy them when they must outlive a mutation.
//! - Touch names are borrowed from the caller's `touch.Touches` and follow its lifetime.
//!
//! Events: SDL pushes its added/removed events itself. Here `add_*` and `remove_*`
//! return the device event for the caller to publish, stamped with the caller's
//! timestamp. `deinit` tears the lists down silently, as SDL's quit paths do.
//!
//! Deliberate differences from SDL:
//! - Lists are returned as slices in registration order. SDL returns malloc'd,
//!   null-terminated arrays that the caller must free.
//! - A missing device name is `null`; SDL sets an error string instead.
//! - Keyboard and mouse removal keeps the remaining order (SDL memmoves too). The touch
//!   registry (`touch.Touches`) swap-removes as SDL_DelTouch does, so the touch pseudo
//!   mouse's name can change after a removal; `touch_mouse_name` reads the current order.
//! - Keyboard id 0 (`KeyboardId.unknown`) is SDL's SDL_GLOBAL_KEYBOARD_ID and is named
//!   "Keyboard" but is never listed, as in SDL. Adding a keyboard with id 0 is a
//!   programming error (SDL asserts the same).
//! - Mouse ids `touch` and `pen` are name-only pseudo devices, as in SDL.
const std = @import("std");
const event = @import("../events/event.zig");
const touch = @import("../events/touch.zig");

/// Name used when a keyboard is added without one (SDL's "Keyboard").
pub const default_keyboard_name = "Keyboard";
/// Name used when a mouse is added without one (SDL's "Mouse").
pub const default_mouse_name = "Mouse";
/// Name of the merged mouse (SDL_GLOBAL_MOUSE_ID).
pub const global_mouse_name = "Mouse";
/// Name of the pen pseudo mouse (SDL_PEN_MOUSEID).
pub const pen_mouse_name = "Pen";
/// Fallback name of the touch pseudo mouse when no touch device exists.
pub const touch_mouse_fallback_name = "Touch";

/// Heuristic from SDL_IsKeyboard: a device that reports fewer keys than a real
/// keyboard is not a keyboard. Zero means the count is unknown and the device is
/// accepted. `vendor` and `product` are reserved for a future blocklist, as in SDL.
pub fn is_keyboard(vendor: u16, product: u16, num_keys: usize) bool {
    _ = .{ vendor, product };
    const real_keyboard_key_count = 50;
    if (num_keys > 0 and num_keys < real_keyboard_key_count) return false;
    return true;
}

/// SDL_IsMouse. SDL accepts every device here; the vendor and product are reserved
/// for the same blocklist SDL plans and do not affect the answer yet.
pub fn is_mouse(vendor: u16, product: u16) bool {
    _ = .{ vendor, product };
    return true;
}

/// Ordered list of device ids with owned name copies. Lookups are linear over the
/// list, which is the same complexity as SDL_GetKeyboardIndex and SDL_GetMouseIndex
/// and is fine for the handful of devices a session has.
fn DeviceList(comptime Id: type) type {
    return struct {
        const Self = @This();

        ids: std.ArrayList(Id) = .empty,
        names: std.AutoHashMapUnmanaged(Id, []u8) = .empty,

        fn deinit(self: *Self, allocator: std.mem.Allocator) void {
            var values = self.names.valueIterator();
            while (values.next()) |owned| allocator.free(owned.*);
            self.names.deinit(allocator);
            self.ids.deinit(allocator);
            self.* = undefined;
        }

        fn index_of(self: *const Self, id: Id) ?usize {
            for (self.ids.items, 0..) |item, index| {
                if (item == id) return index;
            }
            return null;
        }

        /// Adds `id` with an owned copy of `name`. Returns false, changing nothing,
        /// when the id is already present.
        fn add(self: *Self, allocator: std.mem.Allocator, id: Id, text: []const u8) error{OutOfMemory}!bool {
            if (self.index_of(id) != null) return false;
            const owned = try allocator.dupe(u8, text);
            errdefer allocator.free(owned);
            try self.names.put(allocator, id, owned);
            errdefer _ = self.names.remove(id);
            try self.ids.append(allocator, id);
            return true;
        }

        /// Removes `id` and frees its name. Returns false when it was not present.
        fn remove(self: *Self, allocator: std.mem.Allocator, id: Id) bool {
            const index = self.index_of(id) orelse return false;
            _ = self.ids.orderedRemove(index);
            if (self.names.fetchRemove(id)) |entry| allocator.free(entry.value);
            return true;
        }

        fn name_of(self: *const Self, id: Id) ?[]const u8 {
            return self.names.get(id);
        }
    };
}

/// Keyboard and mouse registries with the events they produce.
pub const Registry = struct {
    allocator: std.mem.Allocator,
    keyboards: DeviceList(event.KeyboardId) = .{},
    mice: DeviceList(event.MouseId) = .{},

    /// Creates empty registries. Nothing is allocated until a device is added.
    pub fn init(allocator: std.mem.Allocator) Registry {
        return .{ .allocator = allocator };
    }

    /// Frees all lists and names silently (no removal events), as SDL's quit paths do.
    /// Invalidates every borrowed name.
    pub fn deinit(self: *Registry) void {
        self.keyboards.deinit(self.allocator);
        self.mice.deinit(self.allocator);
        self.* = undefined;
    }

    /// SDL_AddKeyboard. A null name uses "Keyboard". Returns the added event, or null
    /// when the keyboard was already registered (SDL then pushes nothing).
    pub fn add_keyboard(
        self: *Registry,
        timestamp: u64,
        id: event.KeyboardId,
        name: ?[]const u8,
    ) error{OutOfMemory}!?event.Event {
        std.debug.assert(id != .unknown);
        if (!try self.keyboards.add(self.allocator, id, name orelse default_keyboard_name)) return null;
        return .{ .keyboard_device = .{ .kind = .added, .timestamp = timestamp, .keyboard_id = id } };
    }

    /// SDL_RemoveKeyboard. Returns the removed event, or null for an unknown id.
    pub fn remove_keyboard(self: *Registry, timestamp: u64, id: event.KeyboardId) ?event.Event {
        if (!self.keyboards.remove(self.allocator, id)) return null;
        return .{ .keyboard_device = .{ .kind = .removed, .timestamp = timestamp, .keyboard_id = id } };
    }

    /// Registered keyboards in the order they were added (SDL_GetKeyboards without the
    /// trailing zero). Invalidated by any add or remove.
    pub fn keyboard_ids(self: *const Registry) []const event.KeyboardId {
        return self.keyboards.ids.items;
    }

    /// SDL_GetKeyboardNameForID. Id 0 names the merged keyboard; unknown ids are null.
    pub fn keyboard_name(self: *const Registry, id: event.KeyboardId) ?[]const u8 {
        if (id == .unknown) return default_keyboard_name;
        return self.keyboards.name_of(id);
    }

    /// SDL_AddMouse. A null name uses "Mouse". Returns the added event, or null when
    /// the mouse was already registered. The merged id `global` cannot be added.
    pub fn add_mouse(
        self: *Registry,
        timestamp: u64,
        id: event.MouseId,
        name: ?[]const u8,
    ) error{OutOfMemory}!?event.Event {
        std.debug.assert(id != .global);
        if (!try self.mice.add(self.allocator, id, name orelse default_mouse_name)) return null;
        return .{ .mouse_device = .{ .kind = .added, .timestamp = timestamp, .mouse_id = id } };
    }

    /// SDL_RemoveMouse. Returns the removed event, or null for an unknown id.
    pub fn remove_mouse(self: *Registry, timestamp: u64, id: event.MouseId) ?event.Event {
        if (!self.mice.remove(self.allocator, id)) return null;
        return .{ .mouse_device = .{ .kind = .removed, .timestamp = timestamp, .mouse_id = id } };
    }

    /// Registered mice in registration order (SDL_GetMice without the trailing zero).
    pub fn mouse_ids(self: *const Registry) []const event.MouseId {
        return self.mice.ids.items;
    }

    /// SDL_GetMouseNameForID. `touches` supplies the name of the touch pseudo mouse
    /// (the first touch device, as SDL uses); pass null when there is no touch
    /// registry. Null means the id is unknown.
    pub fn mouse_name(self: *const Registry, id: event.MouseId, touches: ?*const touch.Touches) ?[]const u8 {
        return switch (id) {
            .global => global_mouse_name,
            .touch => if (touches) |table| touch_mouse_name(table) else touch_mouse_fallback_name,
            .pen => pen_mouse_name,
            _ => self.mice.name_of(id),
        };
    }
};

/// Name of the touch pseudo mouse: the first touch device's name, or the fallback when
/// there is none. An unnamed touch device has an empty name, which SDL also returns
/// (its touch name is an empty string, not null).
pub fn touch_mouse_name(touches: *const touch.Touches) []const u8 {
    if (touches.devices.items.len == 0) return touch_mouse_fallback_name;
    return touches.devices.items[0].name;
}
