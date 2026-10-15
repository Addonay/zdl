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
//! Levels follow SDL_x11keyboard.c's key-type walk. For every key and group the
//! key's XkbKeyType gives the number of levels and a map of modifier masks to
//! levels. Each active map entry whose mask only uses Shift, Lock, Alt, Level 3
//! or Level 5 (the modifiers SDL keymaps distinguish) records the level's keysym
//! under the matching modifier set, so custom key types (CTRL+ALT levels,
//! KEYPAD, SHIFT+LOCK, EIGHT_LEVEL with Level 5) get their real modifiers. A level
//! with no usable map entry is recorded as unmodified only for level 0. Groups a
//! key does not define are redirected, clamped or wrapped by its group info
//! (`effective_group`). Virtual modifier masks (Alt, Meta, Super, LevelThree,
//! LevelFive, NumLock, ScrollLock) come from the server map's bindings.
//!
//! Deliberate differences: SDL's loop stops before the last keycode (a defect);
//! this one includes it. A virtual modifier the keymap does not define keeps the
//! core default mask (Mod1 Alt, Mod4 Super, Mod5 Level 3, Mod3 Level 5) where SDL
//! would use an empty mask, so modifier state still decodes on partial keymaps.
const std = @import("std");
const keyboard = @import("../../input/keyboard.zig");
const linux_keys = @import("../../input/linux_keys.zig");
const xlib = @import("xlib.zig");

/// XKB keyboard groups supported by the protocol (XkbNumKbdGroups).
pub const max_groups = 4;

/// X modifier masks that decide which key-type map entries SDL keymaps keep.
pub const ModifierMasks = struct {
    alt: c_uint,
    level3: c_uint,
    level5: c_uint,

    /// Shift, Lock, Alt, Level 3 and Level 5: the only modifiers a keymap entry can name.
    pub fn valid(self: ModifierMasks) c_uint {
        return xlib.shift_mask | xlib.lock_mask | self.alt | self.level3 | self.level5;
    }
};

/// SDL modifiers for an XKB key-type map entry mask, or null when the mask uses
/// a modifier outside `ModifierMasks.valid` (the entry is then not recorded).
pub fn entry_modifiers(mask: c_uint, masks: ModifierMasks) ?Modifiers {
    if ((mask | masks.valid()) != masks.valid()) return null;
    var modifiers: Modifiers = .none;
    if (mask & xlib.shift_mask != 0) modifiers = modifiers.either(Modifiers.shift_keys);
    if (mask & xlib.lock_mask != 0) modifiers.caps = true;
    if (mask & masks.alt != 0) modifiers = modifiers.either(Modifiers.alt_keys);
    if (mask & masks.level3 != 0) modifiers.mode = true;
    if (mask & masks.level5 != 0) modifiers.level5 = true;
    return modifiers;
}

/// XkbOutOfRangeGroupAction values (XKB.h) held in a key's group info.
const group_wrap: u8 = 0x00;
const group_clamp: u8 = 0x40;
const group_redirect: u8 = 0x80;

/// The group whose symbols a key shows for keyboard group `group`: a key with
/// fewer groups wraps, clamps or redirects by its group info (low nibble: group
/// count; bits 6-7: action; bits 4-5: redirect target). A key with no groups
/// keeps `group`.
pub fn effective_group(group: u8, group_info: u8) u8 {
    const count = group_info & 0x0f;
    if (count == 0 or group < count) return group;
    return switch (group_info & 0xc0) {
        group_clamp => count - 1,
        group_redirect => blk: {
            const target = (group_info & 0x30) >> 4;
            break :blk if (target >= count) 0 else target;
        },
        else => group % count,
    };
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

    /// Builds one keymap per XKB group by walking each key's key type, and reads
    /// the active group and the virtual modifier masks. Returns false, leaving the
    /// core layout in place, when the server reports no XKB keyboard description.
    /// A previous group table is replaced.
    pub fn load_xkb_groups(self: *Layout, allocator: std.mem.Allocator, api: *const xlib.Functions, display: *xlib.Display) (std.mem.Allocator.Error || error{KeymapUnavailable})!bool {
        const description = api.XkbGetKeyboard(display, 0xff, xlib.XkbUseCoreKbd) orelse return false;
        defer api.XkbFreeKeyboard(description, 0xff, 1);
        _ = api.XkbGetNames(display, xlib.XkbVirtualModNamesMask, description);
        _ = api.XkbGetUpdatedMap(display, xlib.XkbClientInfoAndVirtualMods, description);
        const controls = description.ctrls orelse return false;
        const client = description.map orelse return false;
        const types = (client.types orelse return false)[0..client.num_types];
        const symbol_maps = client.key_sym_map orelse return false;
        const count: u8 = @min(@max(controls.num_groups, 1), max_groups);
        const min_keycode = description.min_key_code;
        const max_keycode = description.max_key_code;
        if (min_keycode < 8 or max_keycode < min_keycode) return error.KeymapUnavailable;

        self.read_virtual_modifiers(api, display, description);
        const masks: ModifierMasks = .{ .alt = self.alt_mask, .level3 = self.level3_mask, .level5 = self.level5_mask };

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
                const symbol_map = symbol_maps[x_code];
                const key_group = effective_group(@intCast(group_index), symbol_map.group_info);
                const type_index = symbol_map.kt_index[key_group & 3];
                if (type_index >= types.len) continue;
                const key_type = types[type_index];
                const entries: []const xlib.XkbKeyTypeEntry = if (key_type.map) |entries_ptr| entries_ptr[0..key_type.map_count] else &.{};
                for (0..key_type.num_levels) |level| {
                    const keysym_raw = api.XkbKeycodeToKeysym(display, @intCast(x_code), key_group, @intCast(level));
                    if (keysym_raw == 0) continue;
                    const keysym = std.math.cast(u32, keysym_raw) orelse continue;
                    var key = linux_keys.keysym_keycode(keysym, @intCast(x_code), .none);
                    if (key == .unknown) key = fallback_keycode(mapped);
                    var added = false;
                    for (entries) |entry| {
                        if (entry.active == 0 or entry.level != level) continue;
                        const modifiers = entry_modifiers(entry.mods.mask, masks) orelse continue;
                        try map.set(mapped, modifiers, key);
                        added = true;
                    }
                    if (level == 0 and !added) try map.set(mapped, .none, key);
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

    /// Reads the masks of the named virtual modifiers (X11_GetXkbVirtualModifierMask).
    /// Names the keymap does not define keep their previous mask.
    fn read_virtual_modifiers(self: *Layout, api: *const xlib.Functions, display: *xlib.Display, description: *const xlib.XkbDesc) void {
        const server = description.server orelse return;
        const names = description.names orelse return;
        const lookup = struct {
            fn mask(vapi: *const xlib.Functions, vdisplay: *xlib.Display, vserver: *const xlib.XkbServerMap, vnames: *const xlib.XkbNames, name: [*:0]const u8) c_uint {
                const atom = vapi.XInternAtom(vdisplay, name, 1);
                if (atom == 0) return 0;
                for (vnames.vmods, 0..) |candidate, index| {
                    if (candidate == atom) return vserver.vmods[index];
                }
                return 0;
            }
        }.mask;
        var alt = lookup(api, display, server, names, "Alt");
        if (alt == 0) alt = lookup(api, display, server, names, "Meta");
        if (alt != 0) self.alt_mask = alt;
        const gui = lookup(api, display, server, names, "Super");
        if (gui != 0) self.gui_mask = gui;
        const level3 = lookup(api, display, server, names, "LevelThree");
        if (level3 != 0) self.level3_mask = level3;
        const level5 = lookup(api, display, server, names, "LevelFive");
        if (level5 != 0) self.level5_mask = level5;
        const num = lookup(api, display, server, names, "NumLock");
        if (num != 0) self.num_lock_mask = num;
        const scroll = lookup(api, display, server, names, "ScrollLock");
        if (scroll != 0) self.scroll_lock_mask = scroll;
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

test "entry modifiers keep only the modifiers a keymap can name" {
    const masks: ModifierMasks = .{ .alt = xlib.mod1_mask, .level3 = xlib.mod5_mask, .level5 = xlib.mod3_mask };
    try std.testing.expectEqual(Modifiers.none, entry_modifiers(0, masks).?);
    const shift = entry_modifiers(xlib.shift_mask, masks).?;
    try std.testing.expect(shift.left_shift and shift.right_shift);
    const level3_shift = entry_modifiers(xlib.shift_mask | xlib.mod5_mask, masks).?;
    try std.testing.expect(level3_shift.left_shift and level3_shift.mode and !level3_shift.level5);
    try std.testing.expect(entry_modifiers(xlib.mod3_mask, masks).?.level5);
    try std.testing.expect(entry_modifiers(xlib.lock_mask, masks).?.caps);
    // Control and Mod4 (Super) are not keymap modifiers: the entry is skipped.
    try std.testing.expect(entry_modifiers(xlib.control_mask, masks) == null);
    try std.testing.expect(entry_modifiers(xlib.shift_mask | xlib.mod4_mask, masks) == null);
}

test "keys with fewer groups wrap, clamp or redirect" {
    // Three groups, wrap (default): group 3 shows group 0.
    try std.testing.expectEqual(@as(u8, 1), effective_group(1, 3));
    try std.testing.expectEqual(@as(u8, 0), effective_group(3, 3));
    // Clamp into range: the last defined group.
    try std.testing.expectEqual(@as(u8, 2), effective_group(3, 0x40 | 3));
    // Redirect to group 1, or to 0 when the target is itself out of range.
    try std.testing.expectEqual(@as(u8, 1), effective_group(3, 0x80 | (1 << 4) | 2));
    try std.testing.expectEqual(@as(u8, 0), effective_group(3, 0x80 | (3 << 4) | 2));
    // No group information leaves the request alone.
    try std.testing.expectEqual(@as(u8, 2), effective_group(2, 0));
}
