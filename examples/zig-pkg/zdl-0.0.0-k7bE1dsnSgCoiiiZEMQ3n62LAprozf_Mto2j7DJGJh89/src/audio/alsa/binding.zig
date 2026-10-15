//! Private libasound binding for the ALSA backend.
//!
//! This is the only ALSA file that declares C-shaped items: opaque libasound
//! handles, the `snd_pcm_chmap_t` record and the function-pointer table.
//! libasound.so.2 is opened with std.DynLib and every symbol is resolved by name
//! in `Library.open`, so importing zdl never requires ALSA. `device.zig` wraps
//! this in the public, idiomatic `Library` / `Device` API.
const std = @import("std");
const builtin = @import("builtin");

/// Opaque `snd_pcm_t`, owned by libasound.
pub const Pcm = opaque {};
/// Opaque `snd_pcm_hw_params_t`, allocated and released by libasound.
pub const HwParams = opaque {};
/// Opaque device-name hint, owned by libasound until `device_name_free_hint`.
pub const Hint = opaque {};
/// Genuine `snd_pcm_chmap_t` layout; its trailing words are supplied by libasound.
pub const ChannelMap = extern struct { channels: u32, positions: [0]u32 };

pub const Functions = struct {
    pcm_open: *const fn (*?*Pcm, [*:0]const u8, i32, i32) callconv(.c) i32,
    pcm_close: *const fn (*Pcm) callconv(.c) i32,
    pcm_set_params: *const fn (*Pcm, i32, i32, u32, u32, i32, u32) callconv(.c) i32,
    pcm_hw_params_malloc: *const fn (*?*HwParams) callconv(.c) i32,
    pcm_hw_params_free: *const fn (*HwParams) callconv(.c) void,
    pcm_hw_params_current: *const fn (*Pcm, *HwParams) callconv(.c) i32,
    pcm_hw_params_get_format: *const fn (*const HwParams, *i32) callconv(.c) i32,
    pcm_hw_params_get_channels: *const fn (*const HwParams, *u32) callconv(.c) i32,
    pcm_hw_params_get_rate: *const fn (*const HwParams, *u32, *i32) callconv(.c) i32,
    pcm_get_params: *const fn (*Pcm, *usize, *usize) callconv(.c) i32,
    pcm_writei: *const fn (*Pcm, [*]const u8, usize) callconv(.c) isize,
    pcm_readi: *const fn (*Pcm, [*]u8, usize) callconv(.c) isize,
    pcm_recover: *const fn (*Pcm, i32, i32) callconv(.c) i32,
    pcm_pause: *const fn (*Pcm, i32) callconv(.c) i32,
    pcm_prepare: *const fn (*Pcm) callconv(.c) i32,
    pcm_drain: *const fn (*Pcm) callconv(.c) i32,
    pcm_drop: *const fn (*Pcm) callconv(.c) i32,
    pcm_wait: *const fn (*Pcm, i32) callconv(.c) i32,
    device_name_hint: *const fn (i32, [*:0]const u8, *?[*:null]?*Hint) callconv(.c) i32,
    device_name_free_hint: *const fn ([*:null]?*Hint) callconv(.c) i32,
    device_name_get_hint: *const fn (*const Hint, [*:0]const u8) callconv(.c) ?[*:0]u8,
    pcm_get_chmap: *const fn (*Pcm) callconv(.c) ?*ChannelMap,
    strerror: *const fn (i32) callconv(.c) [*:0]const u8,
};

/// Loaded libasound with every symbol resolved.
pub const Library = struct {
    handle: std.DynLib,
    functions: Functions,

    /// Loads libasound.so.2. Needs libc in the consuming root module for std's
    /// dynamic loader. Any loader or symbol failure is `error.Unavailable`.
    pub fn open() error{Unavailable}!Library {
        if (builtin.target.os.tag != .linux) @compileError("ALSA is a Linux backend");
        if (!builtin.link_libc) @compileError("ALSA loading requires application root_module.link_libc = true");
        var handle = std.DynLib.open("libasound.so.2") catch return error.Unavailable;
        errdefer handle.close();
        var functions: Functions = undefined;
        const info = @typeInfo(Functions).@"struct";
        inline for (info.field_names, info.field_types) |field_name, FieldType| {
            const name: [:0]const u8 = "snd_" ++ field_name;
            @field(functions, field_name) = handle.lookup(FieldType, name) orelse return error.Unavailable;
        }
        return .{ .handle = handle, .functions = functions };
    }

    /// Unloads libasound; function pointers become invalid.
    pub fn deinit(self: *Library) void {
        self.handle.close();
        self.* = undefined;
    }
};
