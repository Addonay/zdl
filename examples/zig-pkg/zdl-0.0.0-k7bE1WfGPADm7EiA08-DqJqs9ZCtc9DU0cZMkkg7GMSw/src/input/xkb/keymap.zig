//! Compiled XKB keymap with idiomatic Zig lookups, backed by libxkbcommon.
//!
//! A `Keymap` owns one libxkbcommon keymap object and borrows its `Library`.
//! Keycodes are XKB keycodes: Linux evdev codes plus 8, which is what
//! `wl_keyboard.key` plus 8 gives. Layouts (groups) and levels are zero-based.
//! Slices returned from lookups borrow the keymap and stay valid until
//! `deinit`.

const std = @import("std");
const library_mod = @import("library.zig");
const State = @import("state.zig").State;

/// Modifiers the keymap can name. Virtual modifiers (`Alt`, `NumLock`,
/// `Super`, `LevelThree`, `LevelFive`) resolve to the real mask the keymap
/// binds them to, which is zero when the keymap leaves them unbound.
pub const Modifier = enum {
    shift,
    lock,
    control,
    mod1,
    mod2,
    mod3,
    mod4,
    mod5,
    alt,
    num_lock,
    super,
    level3,
    level5,

    /// Name XKB uses for this modifier in `xkb_keymap_mod_get_mask`.
    pub fn xkb_name(self: Modifier) [:0]const u8 {
        return switch (self) {
            .shift => "Shift",
            .lock => "Lock",
            .control => "Control",
            .mod1 => "Mod1",
            .mod2 => "Mod2",
            .mod3 => "Mod3",
            .mod4 => "Mod4",
            .mod5 => "Mod5",
            .alt => "Alt",
            .num_lock => "NumLock",
            .super => "Super",
            .level3 => "LevelThree",
            .level5 => "LevelFive",
        };
    }
};

pub const Error = library_mod.Error;

pub const Keymap = struct {
    library: *const library_mod.Library,
    handle: *anyopaque,

    /// Compiles keymap text (`XKB_KEYMAP_FORMAT_TEXT_V1`). `library` must
    /// outlive the returned keymap.
    pub fn from_text(library: *const library_mod.Library, text: []const u8) Error!Keymap {
        return .{ .library = library, .handle = try library.compile_keymap(text) };
    }

    pub fn deinit(self: *Keymap) void {
        self.library.release_keymap(self.handle);
        self.* = undefined;
    }

    /// Creates a keyboard state for this keymap, starting with no modifiers
    /// and group zero. The state borrows the keymap.
    pub fn create_state(self: *const Keymap) Error!State {
        return State.init(self);
    }

    /// Smallest and largest keycodes the keymap defines.
    pub fn min_keycode(self: *const Keymap) u32 {
        return self.library.functions.keymap_min_keycode(self.handle);
    }

    pub fn max_keycode(self: *const Keymap) u32 {
        return self.library.functions.keymap_max_keycode(self.handle);
    }

    /// Number of layouts (groups) the keymap defines.
    pub fn layout_count(self: *const Keymap) u32 {
        return self.library.functions.keymap_num_layouts(self.handle);
    }

    /// Name of a layout, or null when it has none (virtual keymaps).
    pub fn layout_name(self: *const Keymap, layout: u32) ?[:0]const u8 {
        const name = self.library.functions.keymap_layout_get_name(self.handle, layout) orelse return null;
        return std.mem.span(name);
    }

    /// Real-modifier bits for a modifier, or zero when the keymap has none.
    pub fn modifier_mask(self: *const Keymap, modifier: Modifier) u32 {
        return self.library.functions.keymap_mod_get_mask(self.handle, modifier.xkb_name().ptr);
    }

    /// Whether `keycode` repeats when held (xkb_keymap_key_repeats). Modifier keys
    /// and keys outside the keymap do not repeat.
    pub fn key_repeats(self: *const Keymap, keycode: u32) bool {
        return self.library.functions.keymap_key_repeats(self.handle, keycode) != 0;
    }

    /// Number of shift levels a key has in a layout; zero when the key does
    /// not exist or the layout is out of range.
    pub fn level_count(self: *const Keymap, keycode: u32, layout: u32) u32 {
        return self.library.functions.keymap_num_levels_for_key(self.handle, keycode, layout);
    }

    /// Keysyms a level produces, borrowed from the keymap. Empty when the level
    /// has no symbols (its keysyms are NoSymbol).
    pub fn level_keysyms(self: *const Keymap, keycode: u32, layout: u32, level: u32) []const u32 {
        var syms: ?[*]const u32 = null;
        const count = self.library.functions.keymap_key_get_syms_by_level(self.handle, keycode, layout, level, &syms);
        if (count <= 0) return &.{};
        return (syms orelse return &.{})[0..@intCast(count)];
    }

    /// Writes each real-modifier mask that selects `level` into `out` and
    /// returns the written prefix. Matches `xkb_keymap_key_get_mods_for_level`.
    pub fn level_masks(self: *const Keymap, keycode: u32, layout: u32, level: u32, out: []u32) []u32 {
        if (out.len == 0) return out[0..0];
        const count = self.library.functions.keymap_key_get_mods_for_level(self.handle, keycode, layout, level, out.ptr, out.len);
        return out[0..@min(count, out.len)];
    }
};
