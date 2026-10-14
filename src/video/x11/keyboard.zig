//! X11 keyboard layout: maps X server keycodes to physical scancodes and builds
//! the layout-dependent keyboard.Keymap, following SDL_x11keyboard.c's core
//! (non-XKB) path.
//!
//! Steps mirror X11_InitKeyboard/X11_UpdateKeymap:
//!   1. Load the keysym table (XGetKeyboardMapping) for the server's keycode range.
//!   2. Fingerprint which scancode table the server uses: six keys whose keycodes
//!      are compared against the candidate tables in linux_keys.Table. The table
//!      with the fewest mismatches wins; XF86Documents (keycode 235 on
//!      XFree86-2 servers) breaks ties for remapped XFree86 setups.
//!   3. Assign scancodes from the table, then override non-character keys whose
//!      level-0 keysym implies a different scancode (only when the default keycode
//!      is a scancode, not a character, and the key is not a fixed-position key).
//!   4. Record keysym-derived keycodes at modifier level 0 in keyboard.Keymap, and
//!      find the X modifier masks for Alt, Super, Level 3/5, NumLock and ScrollLock.
//!
//! XKB (libX11's XkbKeycodeToKeysym) refines the core table: `load_xkb_groups`
//! builds one keyboard.Keymap per keyboard group (up to four, from the
//! XkbControls num_groups field) as SDL_x11keyboard.c does when XKB is available.
//! `set_group` follows XkbStateNotify. When the server has no XKB, the single
//! core keymap is used exactly as before.
//!
//! Levels: XKB numbers the levels of a key type 0 to 7. The standard types
//! (TWO_LEVEL, FOUR_LEVEL, EIGHT_LEVEL and their alphabetic forms) give level
//! bit 0 the Shift modifier, bit 1 Level 3 (AltGr, `Modifiers.mode`) and bit 2
//! Level 5 (`Modifiers.level5`). Each level that has a keysym is mapped with
//! those modifiers; levels beyond a key's type return NoSymbol and are skipped.
//!
//! Deliberate difference: SDL walks each key type's map entries and takes the
//! modifier masks from them, which needs the full XkbDesc layout. This layer uses
//! the level-index convention above, which holds for the standard types. Custom
//! types whose level order differs produce the keysyms of their level numbers,
//! with the modifiers of the standard convention.
const std = @import("std");
const keyboard = @import("../../input/keyboard.zig");
const linux_keys = @import("../../input/linux_keys.zig");
const xlib = @import("xlib.zig");

/// XKB keyboard groups supported by the protocol (XkbNumKbdGroups).
pub const max_groups = 4;

/// Levels read per key: the eight XKB levels of the widest standard key type
/// (EIGHT_LEVEL), which carries Level 5 as well as Level 3 and Shift.
pub const xkb_levels = 8;

/// The modifiers that select XKB level `level` under the standard level-index
/// convention: bit 0 Shift, bit 1 Level 3 (AltGr), bit 2 Level 5.
pub fn level_modifiers(level: usize) Modifiers {
    var modifiers: Modifiers = .none;
    if (level & 1 != 0) modifiers.left_shift = true;
    if (level & 2 != 0) modifiers.mode = true;
    if (level & 4 != 0) modifiers.level5 = true;
    return modifiers;
}

const Scancode = keyboard.Scancode;
const Keycode = keyboard.Keycode;
const Modifiers = keyboard.Modifiers;

/// Owns the keycode-to-scancode table and the scancode/keycode Keymap for one
/// display. Rebuild with `load` after a keyboard MappingNotify. The Keymap
/// allocates from the allocator given to `load`; deinit frees it.
pub const Layout = struct {
    keymap: keyboard.Keymap,
    /// Per-group keymaps built from XKB; valid for indices below `group_count`.
    groups: [max_groups]?keyboard.Keymap = @splat(null),
    group_count: u8 = 0,
    /// Group in effect, from XkbGetState or XkbStateNotify. Always below group_count when XKB is active.
    active_group: u8 = 0,
    /// Indexed by X keycode (0-255); Scancode.unknown for unmapped codes.
    scancodes: [256]Scancode = @splat(.unknown),
    /// X modifier-state masks, as SDL derives them on the core path.
    alt_mask: c_uint = xlib.mod1_mask,
    gui_mask: c_uint = xlib.mod4_mask,
    level3_mask: c_uint = xlib.mod5_mask,
    level5_mask: c_uint = xlib.mod3_mask,
    num_lock_mask: c_uint = 0,
    scroll_lock_mask: c_uint = 0,

    /// Reads the server keyboard tables and builds a complete layout. The Xlib
    /// keysym table is released before returning; the Layout owns only Zig memory.
    pub fn load(allocator: std.mem.Allocator, api: *const xlib.Functions, display: *xlib.Display) (std.mem.Allocator.Error || error{KeymapUnavailable})!Layout {
        var min_keycode: c_int = 0;
        var max_keycode: c_int = 0;
        _ = api.XDisplayKeycodes(display, &min_keycode, &max_keycode);
        if (min_keycode < 8 or max_keycode > 255 or min_keycode > max_keycode) return error.KeymapUnavailable;
        const count = max_keycode - min_keycode + 1;

        var per_key_count: c_int = 0;
        const raw = api.XGetKeyboardMapping(display, @intCast(min_keycode), count, &per_key_count) orelse return error.KeymapUnavailable;
        defer _ = api.XFree(@ptrCast(raw));
        if (per_key_count < 1) return error.KeymapUnavailable;
        const table: KeysymTable = .{
            .min_keycode = @intCast(min_keycode),
            .max_keycode = @intCast(max_keycode),
            .per_key = @intCast(per_key_count),
            .keysyms = raw[0 .. @as(usize, @intCast(count)) * @as(usize, @intCast(per_key_count))],
        };

        var layout: Layout = .{ .keymap = keyboard.Keymap.init(allocator) };
        errdefer layout.keymap.deinit();
        layout.assign_scancodes(api, display, table);
        try layout.build_keymap(table);
        layout.find_modifier_masks(api, display);
        return layout;
    }

    pub fn deinit(self: *Layout) void {
        for (&self.groups) |*group| {
            if (group.*) |*map| map.deinit();
            group.* = null;
        }
        self.keymap.deinit();
        self.* = undefined;
    }

    /// Whether per-group XKB keymaps are active.
    pub fn uses_xkb(self: *const Layout) bool {
        return self.group_count > 0;
    }

    /// Builds one keymap per XKB group from the server's keysyms (levels 0 and 1)
    /// and reads the active group. Returns false, leaving the core layout in
    /// place, when the server reports no XKB keyboard description. A previous
    /// group table is replaced.
    pub fn load_xkb_groups(self: *Layout, allocator: std.mem.Allocator, api: *const xlib.Functions, display: *xlib.Display) (std.mem.Allocator.Error || error{KeymapUnavailable})!bool {
        const description = api.XkbGetKeyboard(display, 0xff, xlib.XkbUseCoreKbd) orelse return false;
        defer api.XkbFreeKeyboard(description, 0xff, 1);
        const controls = description.ctrls orelse return false;
        const count: u8 = @min(@max(controls.num_groups, 1), max_groups);
        const min_keycode = description.min_key_code;
        const max_keycode = description.max_key_code;
        if (min_keycode < 8 or max_keycode < min_keycode) return error.KeymapUnavailable;

        var groups: [max_groups]?keyboard.Keymap = @splat(null);
        errdefer for (&groups) |*group| {
            if (group.*) |*map| map.deinit();
        };
        for (0..count) |group_index| {
            var map = keyboard.Keymap.init(allocator);
            errdefer map.deinit();
            var x_code: usize = min_keycode;
            while (x_code <= max_keycode) : (x_code += 1) {
                const mapped = self.scancodes[x_code];
                if (mapped == .unknown) continue;
                for (0..xkb_levels) |level| {
                    const keysym_raw = api.XkbKeycodeToKeysym(display, @intCast(x_code), @intCast(group_index), @intCast(level));
                    if (keysym_raw == 0) continue;
                    const keysym = std.math.cast(u32, keysym_raw) orelse continue;
                    var key = linux_keys.keysym_keycode(keysym, @intCast(x_code), .none);
                    if (key == .unknown) key = fallback_keycode(mapped);
                    try map.set(mapped, level_modifiers(level), key);
                }
            }
            groups[group_index] = map;
        }

        for (&self.groups) |*group| {
            if (group.*) |*map| map.deinit();
        }
        self.groups = groups;
        self.group_count = count;
        var state: [32]u8 = @splat(0);
        if (api.XkbGetState(display, xlib.XkbUseCoreKbd, &state) == 0) self.set_group(state[0]);
        return true;
    }

    /// Selects the group for later lookups. Groups beyond the table fall back to group 0.
    pub fn set_group(self: *Layout, group: u8) void {
        self.active_group = if (group < self.group_count) group else 0;
    }

    /// Scancode for an X keycode. Out-of-range or unmapped codes are unknown.
    pub fn scancode(self: *const Layout, x_keycode: u8) Scancode {
        return self.scancodes[x_keycode];
    }

    /// Keycode for a scancode under `modifiers`, with the Keymap's default fallback.
    pub fn keycode(self: *const Layout, code: Scancode, modifiers: Modifiers) Keycode {
        if (self.uses_xkb()) if (self.groups[self.active_group]) |*map| return map.keycode(code, modifiers);
        return self.keymap.keycode(code, modifiers);
    }

    /// Converts an X state mask to SDL-style modifiers. X reports no sides, so
    /// Shift, Control, Alt and Super set both sides; callers add the physical side
    /// of the key that changed the state.
    pub fn modifiers_from_state(self: *const Layout, state: c_uint) Modifiers {
        var result: Modifiers = .none;
        if (state & xlib.shift_mask != 0) result = result.either(Modifiers.shift_keys);
        if (state & xlib.control_mask != 0) result = result.either(Modifiers.ctrl_keys);
        if (state & self.alt_mask != 0) result = result.either(Modifiers.alt_keys);
        if (state & self.gui_mask != 0) result = result.either(Modifiers.gui_keys);
        if (state & self.level3_mask != 0) result.mode = true;
        if (state & self.level5_mask != 0) result.level5 = true;
        if (state & xlib.lock_mask != 0) result.caps = true;
        if (self.num_lock_mask != 0 and state & self.num_lock_mask != 0) result.num = true;
        if (self.scroll_lock_mask != 0 and state & self.scroll_lock_mask != 0) result.scroll = true;
        return result;
    }

    /// Keys with fixed physical positions keep their table scancode even when a
    /// keysym suggests another (X11_ScancodeIsRemappable).
    fn is_remappable(code: Scancode) bool {
        return switch (code) {
            .escape, .capslock, .numlockclear, .lshift, .rshift, .lctrl, .rctrl, .lalt, .ralt, .lgui, .rgui => false,
            else => true,
        };
    }

    /// Fingerprint selection and table copy (X11_InitKeyboard). Each candidate
    /// table is compared at six known keys; the closest wins if within two
    /// mismatches. Then non-character keys take their keysym's scancode.
    fn assign_scancodes(self: *Layout, api: *const xlib.Functions, display: *xlib.Display, table: KeysymTable) void {
        const Fingerprint = struct { scancode: Scancode, keysym: xlib.KeySym, value: i32 = 0 };
        var fingerprints = [_]Fingerprint{
            .{ .scancode = .home, .keysym = 0xff50 },
            .{ .scancode = .pageup, .keysym = 0xff55 },
            .{ .scancode = .up, .keysym = 0xff52 },
            .{ .scancode = .left, .keysym = 0xff51 },
            .{ .scancode = .delete, .keysym = 0xffff },
            .{ .scancode = .kp_enter, .keysym = 0xff8d },
        };
        // Keycode minus min_keycode, as SDL stores it; missing keysyms (keycode 0)
        // give a negative value that counts as a mismatch.
        for (&fingerprints) |*print| {
            print.value = @as(i32, api.XKeysymToKeycode(display, print.keysym)) - table.min_keycode;
        }

        const candidates = [_]linux_keys.Table{ .darwin, .xfree86_1, .xfree86_2, .xvnc };
        var best_distance: usize = fingerprints.len + 1;
        var best_table: ?linux_keys.Table = null;
        for (candidates) |candidate| {
            const entries = candidate.entries();
            var distance: usize = 0;
            for (fingerprints) |print| {
                if (print.value < 0 or print.value >= entries.len or entries[@intCast(print.value)] != print.scancode) distance += 1;
            }
            if (distance < best_distance) {
                best_distance = distance;
                best_table = candidate;
            }
        }
        if (best_table == null or best_distance > 2) {
            // Remapped XFree86-2 servers: XF86Documents is keycode 235 there.
            if (@as(i32, api.XKeysymToKeycode(display, 0x1008FF5B)) - table.min_keycode == 235) {
                best_table = .xfree86_2;
                best_distance = 0;
            }
        }

        if (best_distance <= 2) if (best_table) |chosen| {
            for (chosen.entries(), 0..) |code, offset| {
                const index = @as(usize, @intCast(table.min_keycode)) + offset;
                if (index >= self.scancodes.len) break;
                self.scancodes[index] = code;
            }
        };

        var x_code: usize = @intCast(table.min_keycode);
        while (x_code <= table.max_keycode) : (x_code += 1) {
            const keysym = table.level_zero(@intCast(x_code)) orelse continue;
            const from_keysym = linux_keys.keysym_scancode(keysym, @intCast(x_code));
            if (from_keysym == self.scancodes[x_code] or from_keysym == .unknown) continue;
            const default = keyboard.default_keycode(from_keysym, .none);
            const is_character_key = @backingInt(default) & (keyboard.Keycode.scancode_mask | keyboard.Keycode.extended_mask) == 0;
            if (!is_character_key and is_remappable(from_keysym)) self.scancodes[x_code] = from_keysym;
        }
    }

    /// Records the level-0 keysym of each mapped key (X11_UpdateKeymap, legacy path).
    fn build_keymap(self: *Layout, table: KeysymTable) (std.mem.Allocator.Error || error{KeymapUnavailable})!void {
        var x_code: usize = @intCast(table.min_keycode);
        while (x_code <= table.max_keycode) : (x_code += 1) {
            const mapped = self.scancodes[x_code];
            if (mapped == .unknown) continue;
            const keysym = table.level_zero(@intCast(x_code)) orelse continue;
            var key = linux_keys.keysym_keycode(keysym, @intCast(x_code), .none);
            if (key == .unknown) key = fallback_keycode(mapped);
            try self.keymap.set(mapped, .none, key);
        }
    }

    fn find_modifier_masks(self: *Layout, api: *const xlib.Functions, display: *xlib.Display) void {
        self.num_lock_mask = self.modifier_mask_for(api, display, .numlockclear);
        self.scroll_lock_mask = self.modifier_mask_for(api, display, .scrolllock);
    }

    /// Mask bit for the modifier row (Mod1-Mod5 are rows 3-7) containing `target`.
    fn modifier_mask_for(self: *const Layout, api: *const xlib.Functions, display: *xlib.Display, target: Scancode) c_uint {
        const map = api.XGetModifierMapping(display) orelse return 0;
        defer _ = api.XFreeModifiermap(map);
        const per_modifier: usize = @intCast(@max(map.max_keypermod, 0));
        var mask: c_uint = 0;
        for (3..8) |row| {
            for (0..per_modifier) |column| {
                const x_code = map.modifiermap[row * per_modifier + column];
                if (self.scancodes[x_code] == target) mask = @as(c_uint, 1) << @intCast(row);
            }
        }
        return mask;
    }
};

/// The server's keysym rows for [min_keycode, max_keycode]. Borrowed from an
/// Xlib allocation that lives until `load` returns.
const KeysymTable = struct {
    min_keycode: u8,
    max_keycode: u8,
    per_key: usize,
    keysyms: []xlib.KeySym,

    /// Level-0 keysym as a 32-bit value, or null for NoSymbol or values that do
    /// not fit (keysyms are 29-bit in practice).
    fn level_zero(self: KeysymTable, x_code: u8) ?u32 {
        if (x_code < self.min_keycode or x_code > self.max_keycode) return null;
        const row = (@as(usize, x_code) - self.min_keycode) * self.per_key;
        const keysym = self.keysyms[row];
        if (keysym == 0) return null;
        return std.math.cast(u32, keysym);
    }
};

/// Keycode used when a keysym produces no keycode (X11_AddKeymapEntry switch).
fn fallback_keycode(scancode: Scancode) Keycode {
    return switch (scancode) {
        .@"return" => .@"return",
        .escape => .escape,
        .backspace => .backspace,
        .delete => .delete,
        else => Keycode.from_scancode(scancode),
    };
}
