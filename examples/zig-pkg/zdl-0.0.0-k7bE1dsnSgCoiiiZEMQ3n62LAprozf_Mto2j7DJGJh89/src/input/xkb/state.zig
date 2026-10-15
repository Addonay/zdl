//! Keyboard state over a compiled XKB keymap, backed by libxkbcommon.
//!
//! Compositors report modifiers as `wl_keyboard.modifiers` values: depressed,
//! latched and locked real-modifier masks plus one locked group. `update_wayland`
//! applies exactly that, as `xkb_state_update_mask` does with base and latched
//! groups zero. The state borrows its keymap, which must outlive it.

const std = @import("std");
const keymap_mod = @import("keymap.zig");
const library_mod = @import("library.zig");

pub const Error = library_mod.Error;

pub const State = struct {
    keymap: *const keymap_mod.Keymap,
    handle: *anyopaque,

    pub fn init(keymap: *const keymap_mod.Keymap) Error!State {
        return .{
            .keymap = keymap,
            .handle = try keymap.library.create_state(keymap.handle),
        };
    }

    pub fn deinit(self: *State) void {
        self.keymap.library.release_state(self.handle);
        self.* = undefined;
    }

    /// Sets every component, as `xkb_state_update_mask`. Layout arguments are
    /// layout indices, not wrapped; out-of-range layouts follow XKB's rules.
    pub fn update_mask(
        self: *State,
        depressed: u32,
        latched: u32,
        locked: u32,
        depressed_layout: u32,
        latched_layout: u32,
        locked_layout: u32,
    ) void {
        _ = self.keymap.library.functions.state_update_mask(
            self.handle,
            depressed,
            latched,
            locked,
            depressed_layout,
            latched_layout,
            locked_layout,
        );
    }

    /// Applies a `wl_keyboard.modifiers` event. The protocol carries only a
    /// locked group, so latched and depressed groups are zero.
    pub fn update_wayland(self: *State, depressed: u32, latched: u32, locked: u32, group: u32) void {
        self.update_mask(depressed, latched, locked, 0, 0, group);
    }

    /// Keysyms the current modifiers and group produce for an XKB keycode,
    /// borrowed from the keymap. Empty when the key has no symbols.
    pub fn keysyms(self: *const State, keycode: u32) []const u32 {
        var syms: ?[*]const u32 = null;
        const count = self.keymap.library.functions.state_key_get_syms(self.handle, keycode, &syms);
        if (count <= 0) return &.{};
        return (syms orelse return &.{})[0..@intCast(count)];
    }

    /// First keysym from `keysyms`, or NoSymbol (0).
    pub fn keysym(self: *const State, keycode: u32) u32 {
        const syms = self.keysyms(keycode);
        return if (syms.len > 0) syms[0] else 0;
    }
};
