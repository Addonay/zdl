//! Builds SDL-style keyboard layouts (`keyboard.Keymap`) from a compiled XKB
//! keymap, following SDL's Wayland backend (`Wayland_KeymapIterator`,
//! `Wayland_GetScancodeForKey` and `Wayland_SeatSetKeymap` in
//! `video/wayland/SDL_waylandevents.c`).
//!
//! For every XKB keycode and layout, each level with keysyms is mapped under
//! each real-modifier mask that selects it. Only Shift, Alt, Level 3, Level 5
//! and Caps Lock take part, as in SDL; masks using any other modifier are
//! ignored. The scancode comes from the evdev table for hardware keyboards,
//! from the keysym for virtual keyboards, and otherwise from the reserved
//! range 400-499, which SDL allocates in layout 0 and records per evdev code so
//! later key events find it.
//!
//! Deliberate differences from SDL: allocation failures are returned as
//! `error.OutOfMemory` instead of leaving partial layouts; the reserved-key
//! record is a hash map keyed by evdev code rather than an array scanned
//! linearly; the mask list per level is capped at 16 entries as in SDL.

const std = @import("std");
const keyboard = @import("../keyboard.zig");
const linux_keys = @import("../linux_keys.zig");
const keymap_mod = @import("keymap.zig");

pub const Error = std.mem.Allocator.Error;

const Scancode = keyboard.Scancode;
const Keycode = keyboard.Keycode;

/// Real-modifier bits SDL keymaps distinguish, resolved from the keymap.
const Masks = struct {
    shift: u32,
    alt: u32,
    level3: u32,
    level5: u32,
    caps: u32,

    fn load(map: *const keymap_mod.Keymap) Masks {
        return .{
            .shift = map.modifier_mask(.shift),
            .alt = map.modifier_mask(.alt),
            .level3 = map.modifier_mask(.level3),
            .level5 = map.modifier_mask(.level5),
            .caps = map.modifier_mask(.lock),
        };
    }

    /// Every bit SDL considers; masks with other bits are skipped.
    fn valid(self: Masks) u32 {
        return self.shift | self.alt | self.level3 | self.level5 | self.caps;
    }

    /// Converts a real-modifier mask into SDL's keyboard modifiers. Left-hand
    /// variants are used because the keymap does not say which side applies;
    /// `Modifiers.for_keymap` treats either side as the same key.
    fn to_modifiers(self: Masks, mask: u32) keyboard.Modifiers {
        var result: keyboard.Modifiers = .{};
        if (mask & self.shift != 0) result.left_shift = true;
        if (mask & self.alt != 0) result.left_alt = true;
        if (mask & self.level3 != 0) result.mode = true;
        if (mask & self.level5 != 0) result.level5 = true;
        if (mask & self.caps != 0) result.caps = true;
        return result;
    }
};

/// One keyboard layout per XKB group, plus the reserved scancode records.
pub const Keymaps = struct {
    allocator: std.mem.Allocator,
    layouts: []keyboard.Keymap,
    /// Evdev code to reserved scancode for hardware keys with no table entry.
    reserved: std.AutoHashMapUnmanaged(u32, Scancode) = .empty,
    /// Virtual keyboards take scancodes from keysyms, not from evdev codes.
    is_virtual: bool,

    /// Builds one layout per group of `map`. The result owns its memory and
    /// does not reference `map` afterwards.
    pub fn build(allocator: std.mem.Allocator, map: *const keymap_mod.Keymap) Error!Keymaps {
        const count = map.layout_count();
        const layouts = try allocator.alloc(keyboard.Keymap, count);
        for (layouts) |*slot| slot.* = keyboard.Keymap.init(allocator);
        var result: Keymaps = .{
            .allocator = allocator,
            .layouts = layouts,
            .is_virtual = map.layout_name(0) == null,
        };
        errdefer result.deinit();
        if (count == 0) return result;

        const masks = Masks.load(map);
        var keycode = map.min_keycode();
        while (keycode <= map.max_keycode()) : (keycode += 1) {
            try result.add_key(map, masks, keycode);
        }
        return result;
    }

    pub fn deinit(self: *Keymaps) void {
        for (self.layouts) |*slot| slot.deinit();
        self.allocator.free(self.layouts);
        self.reserved.deinit(self.allocator);
        self.* = undefined;
    }

    /// Layout at `index`, or null when the keymap has no such group.
    pub fn layout(self: *const Keymaps, index: u32) ?*const keyboard.Keymap {
        if (index >= self.layouts.len) return null;
        return &self.layouts[index];
    }

    /// Scancode for a key event, as `Wayland_GetScancodeForKey`. `evdev` is the
    /// Linux code from `wl_keyboard.key`. Virtual keyboards need `keysym`, the
    /// first keysym the current state gives for the key, or null when none.
    pub fn scancode_for_key(self: *const Keymaps, evdev: u32, keysym: ?u32) Scancode {
        if (!self.is_virtual) {
            const scancode = linux_keys.evdev_scancode(evdev);
            if (scancode != .unknown) return scancode;
            return self.reserved.get(evdev) orelse .unknown;
        }
        const sym = keysym orelse return .unknown;
        return linux_keys.keysym_scancode(sym, evdev + 8);
    }

    /// Adds every layout entry produced by one XKB keycode, as
    /// `Wayland_KeymapIterator` does for each key.
    fn add_key(self: *Keymaps, map: *const keymap_mod.Keymap, masks: Masks, keycode: u32) Error!void {
        var scancode: Scancode = .unknown;
        if (!self.is_virtual and keycode >= 8) scancode = linux_keys.evdev_scancode(keycode - 8);
        const valid = masks.valid();

        for (0..self.layouts.len) |index| {
            const group: u32 = @intCast(index);
            const levels = map.level_count(keycode, group);
            for (0..levels) |level_index| {
                const level: u32 = @intCast(level_index);
                const syms = map.level_keysyms(keycode, group, level);
                if (syms.len == 0) continue;
                const sym = syms[0];

                // Virtual keyboards have no evdev table entry; take the scancode
                // from the keysym, or skip the level until a reserved one exists.
                if (scancode == .unknown and self.is_virtual) {
                    scancode = linux_keys.keysym_scancode(sym, keycode);
                    if (scancode == .unknown) continue;
                }

                var mask_buffer: [16]u32 = undefined;
                for (map.level_masks(keycode, group, level, &mask_buffer)) |mask| {
                    // Ignore sets that include modifiers SDL does not model.
                    if ((mask | valid) != valid) continue;

                    const modifiers = masks.to_modifiers(mask);
                    var keysym_keycode = linux_keys.keysym_keycode(sym, keycode, modifiers);

                    // Hardware keys with no standard scancode take a reserved one,
                    // allocated from layout 0 so the scancode is unique across layouts.
                    if (keysym_keycode != .unknown and scancode == .unknown) {
                        scancode = self.layouts[0].next_reserved_scancode();
                        // Keep the base level mapped so the reserved key is known
                        // even when only shifted levels carry the keysym.
                        if (level != 0) try self.layouts[index].set(scancode, .{}, .unknown);
                        try self.reserved.put(self.allocator, keycode - 8, scancode);
                    }

                    if (keysym_keycode == .unknown) {
                        keysym_keycode = switch (scancode) {
                            .@"return" => .@"return",
                            .escape => .escape,
                            .backspace => .backspace,
                            .delete => .delete,
                            else => Keycode.from_scancode(scancode),
                        };
                    }
                    try self.layouts[index].set(scancode, modifiers, keysym_keycode);
                }
            }
        }
    }
};
