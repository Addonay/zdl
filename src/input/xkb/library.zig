//! Loader and private C binding for the system libxkbcommon.
//!
//! Every C declaration in the XKB layer lives in this file. The library is
//! opened at runtime with `std.DynLib` ("libxkbcommon.so.0"), following the
//! ALSA loader in `audio/alsa/device.zig`, and each entry point is resolved by
//! name into a typed function pointer. Those pointers, and every raw handle,
//! stay private to `input/xkb`; the public keymap and state types take and
//! return Zig slices, enums and optionals.
//!
//! libxkbcommon is the reference implementation of XKB keymap compilation, so
//! the results match what compositors and SDL see. Loading requires libc in the
//! application's root module, because `std.DynLib` uses the system dynamic
//! loader in that configuration.
//!
//! Lifetimes: a `Library` must outlive every `Keymap` and `State` created from
//! it, because they hold pointers into the loaded code and function table.

const std = @import("std");
const builtin = @import("builtin");

pub const Error = std.DynLib.Error || error{
    UnsupportedTarget,
    LibcRequired,
    MissingSymbol,
    ContextFailed,
    KeymapFailed,
    StateFailed,
};

/// Context flags: skip XKB's default include directories and environment
/// variables (`XKB_DEFAULT_*`), so compilation reads only the given text.
pub const xkb_context_no_default_includes: u32 = 1 << 0;
pub const xkb_context_no_environment_names: u32 = 1 << 1;
pub const xkb_keymap_format_text_v1: u32 = 1;

const Functions = struct {
    context_new: *const fn (u32) callconv(.c) ?*anyopaque,
    context_unref: *const fn (*anyopaque) callconv(.c) void,
    keymap_new_from_buffer: *const fn (*anyopaque, [*]const u8, usize, u32, u32) callconv(.c) ?*anyopaque,
    keymap_unref: *const fn (*anyopaque) callconv(.c) void,
    keymap_min_keycode: *const fn (*anyopaque) callconv(.c) u32,
    keymap_max_keycode: *const fn (*anyopaque) callconv(.c) u32,
    keymap_num_layouts: *const fn (*anyopaque) callconv(.c) u32,
    keymap_layout_get_name: *const fn (*anyopaque, u32) callconv(.c) ?[*:0]const u8,
    keymap_num_levels_for_key: *const fn (*anyopaque, u32, u32) callconv(.c) u32,
    keymap_key_get_syms_by_level: *const fn (*anyopaque, u32, u32, u32, *?[*]const u32) callconv(.c) i32,
    keymap_key_get_mods_for_level: *const fn (*anyopaque, u32, u32, u32, [*]u32, usize) callconv(.c) usize,
    keymap_mod_get_mask: *const fn (*anyopaque, [*:0]const u8) callconv(.c) u32,
    /// `int xkb_keymap_key_repeats(struct xkb_keymap *, xkb_keycode_t)`: nonzero when the key repeats.
    keymap_key_repeats: *const fn (*anyopaque, u32) callconv(.c) c_int,
    state_new: *const fn (*anyopaque) callconv(.c) ?*anyopaque,
    state_unref: *const fn (*anyopaque) callconv(.c) void,
    state_update_mask: *const fn (*anyopaque, u32, u32, u32, u32, u32, u32) callconv(.c) u32,
    state_key_get_syms: *const fn (*anyopaque, u32, *?[*]const u32) callconv(.c) i32,
    /// `int xkb_state_key_get_utf8(state, key, char *buffer, size_t size)`: writes a NUL-terminated string.
    state_key_get_utf8: *const fn (*anyopaque, u32, [*]u8, usize) callconv(.c) c_int,
};

/// Owns the dynamic library handle and its resolved entry points. Not
/// copyable once opened: keymaps and states keep `*const Library`.
pub const Library = struct {
    handle: std.DynLib,
    functions: Functions,

    /// Opens the system libxkbcommon at runtime. No package or header is needed
    /// at build time.
    pub fn open() Error!Library {
        if (builtin.target.os.tag != .linux) return error.UnsupportedTarget;
        if (!builtin.link_libc) return error.LibcRequired;
        var handle = try std.DynLib.open("libxkbcommon.so.0");
        errdefer handle.close();
        var functions: Functions = undefined;
        const info = @typeInfo(Functions).@"struct";
        inline for (info.field_names, info.field_types) |field_name, FieldType| {
            const name: [:0]const u8 = "xkb_" ++ field_name;
            @field(functions, field_name) = handle.lookup(FieldType, name) orelse return error.MissingSymbol;
        }
        return .{ .handle = handle, .functions = functions };
    }

    /// Unloads the library. Every keymap and state created from it must
    /// already be released.
    pub fn close(self: *Library) void {
        self.handle.close();
        self.* = undefined;
    }

    /// Compiles keymap text (XKB_KEYMAP_FORMAT_TEXT_V1, as in
    /// `wl_keyboard.keymap`) and returns the handle. The context used for
    /// compilation is released immediately; the keymap keeps its own reference.
    /// Includes and environment-derived names are disabled, so the text must be
    /// fully resolved.
    pub fn compile_keymap(self: *const Library, bytes: []const u8) Error!*anyopaque {
        const functions = &self.functions;
        const context = functions.context_new(xkb_context_no_default_includes | xkb_context_no_environment_names) orelse return error.ContextFailed;
        defer functions.context_unref(context);
        return functions.keymap_new_from_buffer(context, bytes.ptr, bytes.len, xkb_keymap_format_text_v1, 0) orelse error.KeymapFailed;
    }

    pub fn release_keymap(self: *const Library, keymap: *anyopaque) void {
        self.functions.keymap_unref(keymap);
    }

    pub fn create_state(self: *const Library, keymap: *anyopaque) Error!*anyopaque {
        return self.functions.state_new(keymap) orelse error.StateFailed;
    }

    pub fn release_state(self: *const Library, state: *anyopaque) void {
        self.functions.state_unref(state);
    }

    /// Whether the keymap's key `keycode` repeats (xkb_keymap_key_repeats). Keys
    /// outside the keymap, and modifiers, do not repeat.
    pub fn keymap_key_repeats(self: *const Library, keymap: *anyopaque, keycode: u32) bool {
        return self.functions.keymap_key_repeats(keymap, keycode) != 0;
    }

    /// UTF-8 text the key produces under the state's current modifiers and group
    /// (xkb_state_key_get_utf8). Written into `buffer` and returned as a slice of
    /// it; empty when the key produces no text. Text longer than `buffer` is
    /// truncated at the last whole byte that fits.
    pub fn state_key_utf8(self: *const Library, state: *anyopaque, keycode: u32, buffer: []u8) []const u8 {
        if (buffer.len == 0) return buffer[0..0];
        const needed = self.functions.state_key_get_utf8(state, keycode, buffer.ptr, buffer.len);
        if (needed <= 0) return buffer[0..0];
        // libxkbcommon returns the length it wanted and always NUL-terminates a
        // truncated result, so the usable text is at most `buffer.len - 1` bytes.
        const wanted: usize = @intCast(needed);
        return buffer[0..@min(wanted, buffer.len - 1)];
    }
};
