//! Linux ALSA playback/capture with an explicitly owned dynamic-library handle.
//! Ported from audio/alsa/SDL_alsa_audio.c. These C calling conventions are the
//! real libasound interface, not a compatibility ABI between zdl modules. Public
//! objects, errors, buffers and configuration are native Zig. No device is opened
//! during import, and no global library, device list or callback state is kept.
const std = @import("std");
const builtin = @import("builtin");
const audio = @import("../processing.zig");
const Diagnostic = @import("../../core/diagnostics.zig").Diagnostic;

const binding = @import("binding.zig");

/// ALSA loading, configuration and I/O failures. WouldBlock is normal for a
/// nonblocking device; recover can repair underrun or suspended-stream errors.
pub const Error = audio.Error || std.mem.Allocator.Error || error{
    /// libasound cannot be loaded or lacks a required symbol.
    Unavailable,
    DeviceFailure,
    InvalidConfiguration,
    InvalidDirection,
    WouldBlock,
    Interrupted,
    Underrun,
    Overrun,
    Suspended,
    Disconnected,
};
/// Which end of the PCM stream belongs to the application.
pub const Direction = enum { playback, capture };

/// Owns the libasound loader handle. Load before opening devices and close only
/// after all borrowing Devices are closed. Do not move an initialized Library
/// while Devices borrow it.
pub const Library = struct {
    /// Implementation detail: the private binding. Not part of the stable API.
    native: binding.Library,

    /// Loads system libasound at explicit request; `error.Unavailable` when the
    /// library is missing. System backends require libc in the consuming
    /// application's root module. Core zdl users need neither libc nor
    /// libasound merely to import the library.
    pub fn open() error{Unavailable}!Library {
        return .{ .native = try binding.Library.open() };
    }

    /// Enumerates ALSA's configured PCM endpoints, including system plugins.
    /// Results own copied names/descriptions independently of this Library;
    /// opening a device still requires an explicit Device.open call.
    pub fn enumerate(self: *Library, allocator: std.mem.Allocator) Error!DeviceList {
        var hints: ?[*:null]?*binding.Hint = null;
        try check(self, null, self.native.functions.device_name_hint(-1, "pcm", &hints));
        var endpoints: std.ArrayList(Endpoint) = .empty;
        errdefer {
            for (endpoints.items) |endpoint| free_endpoint(allocator, endpoint);
            endpoints.deinit(allocator);
        }
        if (hints) |list| {
            defer _ = self.native.functions.device_name_free_hint(list);
            var index: usize = 0;
            while (list[index]) |hint| : (index += 1) {
                const name = self.native.functions.device_name_get_hint(hint, "NAME") orelse continue;
                defer std.c.free(@ptrCast(name));
                const description = self.native.functions.device_name_get_hint(hint, "DESC");
                defer if (description) |text| std.c.free(@ptrCast(text));
                const direction = self.native.functions.device_name_get_hint(hint, "IOID");
                defer if (direction) |text| std.c.free(@ptrCast(text));
                const owned_name = try allocator.dupeSentinel(u8, std.mem.span(name), 0);
                errdefer allocator.free(owned_name);
                const owned_description = try allocator.dupe(u8, if (description) |text| std.mem.span(text) else std.mem.span(name));
                errdefer allocator.free(owned_description);
                const kind = if (direction) |text| std.mem.span(text) else "";
                try endpoints.append(allocator, .{
                    .name = owned_name,
                    .description = owned_description,
                    .supports_playback = !std.mem.eql(u8, kind, "Input"),
                    .supports_capture = !std.mem.eql(u8, kind, "Output"),
                });
            }
        }
        return .{ .allocator = allocator, .items = try endpoints.toOwnedSlice(allocator) };
    }

    /// Unloads after all devices close. Existing function pointers become invalid.
    pub fn deinit(self: *Library) void {
        self.native.deinit();
        self.* = undefined;
    }
};

/// An independently owned enumeration entry; a name can be passed to Options.
pub const Endpoint = struct {
    name: [:0]const u8,
    description: []const u8,
    supports_playback: bool,
    supports_capture: bool,
};
/// Owns enumeration entries and their copied text. It may outlive the Library.
pub const DeviceList = struct {
    allocator: std.mem.Allocator,
    items: []Endpoint,
    pub fn deinit(self: *DeviceList) void {
        for (self.items) |endpoint| free_endpoint(self.allocator, endpoint);
        self.allocator.free(self.items);
        self.* = undefined;
    }
};
/// Speaker positions reported by ALSA. Unknown driver positions remain representable.
pub const Speaker = enum(u16) {
    unknown = 0,
    absent = 1,
    mono = 2,
    front_left = 3,
    front_right = 4,
    rear_left = 5,
    rear_right = 6,
    front_center = 7,
    lfe = 8,
    side_left = 9,
    side_right = 10,
    rear_center = 11,
    front_left_center = 12,
    front_right_center = 13,
    rear_left_center = 14,
    rear_right_center = 15,
    front_left_wide = 16,
    front_right_wide = 17,
    front_left_high = 18,
    front_center_high = 19,
    front_right_high = 20,
    top_center = 21,
    top_front_left = 22,
    top_front_right = 23,
    top_front_center = 24,
    top_rear_left = 25,
    top_rear_right = 26,
    top_rear_center = 27,
    _,
};
/// One channel's physical position and flags, without a packed integer API.
pub const Channel = struct { speaker: Speaker, phase_inverse: bool, driver_specific: bool };

/// Explicit device negotiation. `default` follows the system's ALSA policy,
/// including any configured PipeWire/PulseAudio plugin; no device is guessed.
pub const Options = struct {
    direction: Direction = .playback,
    spec: audio.Spec,
    name: [:0]const u8 = "default",
    non_blocking: bool = true,
    soft_resample: bool = false,
    latency_microseconds: u32 = 20_000,
    /// Optional owned text sink, borrowed for the lifetime of the device.
    diagnostic: ?*Diagnostic = null,
};

/// An interleaved ALSA PCM device. The Library and optional diagnostic outlive
/// it. Synchronization belongs to the caller; concurrent reads/configuration
/// of the same handle are unsupported. No hidden playback thread is created.
pub const Device = struct {
    library: *Library,
    pcm: *binding.Pcm,
    spec: audio.Spec,
    direction: Direction,
    buffer_frames: usize,
    period_frames: usize,
    diagnostic: ?*Diagnostic,
    last_status: i32 = 0,

    /// Opens and configures the requested representation and rate. libasound
    /// owns its internal allocations; the Device itself is a returned value.
    /// Failed setup always closes any successfully opened handle.
    pub fn open(library: *Library, options: Options) Error!Device {
        try options.spec.validate();
        if (options.name.len == 0 or options.latency_microseconds == 0) return error.InvalidConfiguration;
        const preferences = audio.closest_formats(options.spec.format);
        var last_format_error: i32 = -22;
        for (preferences.slice()) |format| {
            var handle: ?*binding.Pcm = null;
            const opened = library.native.functions.pcm_open(&handle, options.name.ptr, if (options.direction == .playback) 0 else 1, if (options.non_blocking) 1 else 0);
            try check(library, options.diagnostic, opened);
            const pcm = handle orelse return error.DeviceFailure;
            // ALSA's RW_INTERLEAVED is 3. Its C enum values stay private to
            // this boundary; `spec` stores the actual native representation.
            const status = library.native.functions.pcm_set_params(pcm, alsa_format(format), 3, options.spec.channels, options.spec.sample_rate, @intFromBool(options.soft_resample), options.latency_microseconds);
            if (status < 0) {
                _ = library.native.functions.pcm_close(pcm);
                last_format_error = status;
                if (status == -22) continue;
                return failure(library, options.diagnostic, status);
            }
            errdefer _ = library.native.functions.pcm_close(pcm);

            const spec = try negotiated_spec(library, pcm, options.diagnostic);
            var buffer_frames: usize = 0;
            var period_frames: usize = 0;
            try check(library, options.diagnostic, library.native.functions.pcm_get_params(pcm, &buffer_frames, &period_frames));
            if (buffer_frames == 0 or period_frames == 0) return error.DeviceFailure;
            return .{ .library = library, .pcm = pcm, .spec = spec, .direction = options.direction, .buffer_frames = buffer_frames, .period_frames = period_frames, .diagnostic = options.diagnostic };
        }
        return failure(library, options.diagnostic, last_format_error);
    }

    /// Drops/closes the stream without implicitly draining or blocking. Deinit
    /// before the borrowing library; outstanding application buffers remain owned
    /// by the application, not by this object or libasound.
    pub fn deinit(self: *Device) void {
        _ = self.library.native.functions.pcm_drop(self.pcm);
        _ = self.library.native.functions.pcm_close(self.pcm);
        self.* = undefined;
    }

    /// Writes complete interleaved frames. Returns accepted frame count, which
    /// may be smaller than the request. WouldBlock means retry when ready; no
    /// automatic infinite retry loop or hidden buffer allocation is involved.
    pub fn write(self: *Device, samples: []const u8) Error!usize {
        if (self.direction != .playback) return error.InvalidDirection;
        const frames = try self.spec.frame_count(samples);
        if (frames == 0) return 0;
        const result = self.library.native.functions.pcm_writei(self.pcm, samples.ptr, frames);
        if (result < 0) return self.io_failure(result);
        const written: usize = @intCast(result);
        if (written > frames) return error.DeviceFailure;
        self.last_status = 0;
        return written;
    }

    /// Reads complete frames into caller-owned storage and returns its filled
    /// prefix. No capture occurs until this method is explicitly called.
    pub fn read(self: *Device, destination: []u8) Error![]u8 {
        if (self.direction != .capture) return error.InvalidDirection;
        const frames = try self.spec.frame_count(destination);
        if (frames == 0) return destination[0..0];
        const result = self.library.native.functions.pcm_readi(self.pcm, destination.ptr, frames);
        if (result < 0) return self.io_failure(result);
        const captured: usize = @intCast(result);
        if (captured > frames) return error.DeviceFailure;
        return destination[0 .. captured * try self.spec.frame_size()];
    }

    /// Copies the PCM's channel positions into caller-owned storage. Null
    /// means ALSA has no position information. The caller frees a returned slice
    /// with allocator; the OS chmap allocation is released before return.
    pub fn channel_map(self: *Device, allocator: std.mem.Allocator) Error!?[]Channel {
        const mapping = self.library.native.functions.pcm_get_chmap(self.pcm) orelse return null;
        defer std.c.free(@ptrCast(mapping));
        if (mapping.channels != self.spec.channels) return error.InvalidConfiguration;
        const output = try allocator.alloc(Channel, mapping.channels);
        const words: [*]const u32 = @ptrCast(&mapping.positions);
        for (output, words[0..mapping.channels]) |*channel, word| channel.* = .{
            .speaker = @fromBackingInt(@intCast(@as(u16, @truncate(word)))),
            .phase_inverse = word & (1 << 16) != 0,
            .driver_specific = word & (2 << 16) != 0,
        };
        return output;
    }

    /// Attempts recovery from the most recent ALSA I/O failure. The saved status
    /// belongs to this device, not a process/thread last-error registry. A caller
    /// can decide when recovery fits its cancellation/deadline policy.
    pub fn recover(self: *Device) Error!void {
        if (self.last_status >= 0) return;
        try check(self.library, self.diagnostic, self.library.native.functions.pcm_recover(self.pcm, self.last_status, 1));
        self.last_status = 0;
    }

    /// Restarts a prepared PCM stream after an explicit stop/discontinuity.
    pub fn prepare(self: *Device) Error!void {
        try check(self.library, self.diagnostic, self.library.native.functions.pcm_prepare(self.pcm));
        self.last_status = 0;
    }

    /// Discards queued playback/capture frames. Re-prepare before the next I/O.
    pub fn stop(self: *Device) Error!void {
        try check(self.library, self.diagnostic, self.library.native.functions.pcm_drop(self.pcm));
    }

    /// Drains queued playback. In nonblocking mode WouldBlock asks the caller to
    /// wait/retry; blocking mode can block until queued audio finishes.
    pub fn drain(self: *Device) Error!void {
        if (self.direction != .playback) return error.InvalidDirection;
        try check(self.library, self.diagnostic, self.library.native.functions.pcm_drain(self.pcm));
    }

    /// Waits for readiness. Null means ALSA's indefinite wait; zero polls once.
    /// A finite timeout lets an application implement its own deadline policy.
    pub fn wait(self: *Device, timeout_milliseconds: ?u31) Error!bool {
        const result = self.library.native.functions.pcm_wait(self.pcm, if (timeout_milliseconds) |milliseconds| milliseconds else -1);
        if (result < 0) return self.io_failure(result);
        self.last_status = 0;
        return result > 0;
    }

    fn io_failure(self: *Device, result: isize) Error {
        self.last_status = std.math.cast(i32, result) orelse -5;
        const reason = failure(self.library, self.diagnostic, self.last_status);
        return if (self.last_status == -32 and self.direction == .capture) error.Overrun else reason;
    }
};

fn alsa_format(format: audio.Format) i32 {
    return switch (format) {
        .signed8 => 0,
        .unsigned8 => 1,
        .signed16_le => 2,
        .signed16_be => 3,
        .signed24_32_le => 6,
        .signed24_32_be => 7,
        .signed32_le => 10,
        .signed32_be => 11,
        .float32_le => 14,
        .float32_be => 15,
        .mulaw => 20,
        .alaw => 21,
        .signed24_le => 32,
        .signed24_be => 33,
    };
}

fn format_from_alsa(format: i32) ?audio.Format {
    return switch (format) {
        0 => .signed8,
        1 => .unsigned8,
        2 => .signed16_le,
        3 => .signed16_be,
        6 => .signed24_32_le,
        7 => .signed24_32_be,
        10 => .signed32_le,
        11 => .signed32_be,
        14 => .float32_le,
        15 => .float32_be,
        20 => .mulaw,
        21 => .alaw,
        32 => .signed24_le,
        33 => .signed24_be,
        else => null,
    };
}

fn negotiated_spec(library: *Library, pcm: *binding.Pcm, diagnostic: ?*Diagnostic) Error!audio.Spec {
    var maybe_params: ?*binding.HwParams = null;
    try check(library, diagnostic, library.native.functions.pcm_hw_params_malloc(&maybe_params));
    const params = maybe_params orelse return error.DeviceFailure;
    defer library.native.functions.hw_params_free(params);
    try check(library, diagnostic, library.native.functions.pcm_hw_params_current(pcm, params));
    var raw_format: i32 = 0;
    var channels: u32 = 0;
    var rate: u32 = 0;
    var direction: i32 = 0;
    try check(library, diagnostic, library.native.functions.hw_params_get_format(params, &raw_format));
    try check(library, diagnostic, library.native.functions.hw_params_get_channels(params, &channels));
    try check(library, diagnostic, library.native.functions.hw_params_get_rate(params, &rate, &direction));
    if (direction < -1 or direction > 1) return error.InvalidConfiguration;
    const spec: audio.Spec = .{
        .format = format_from_alsa(raw_format) orelse return error.InvalidConfiguration,
        .channels = std.math.cast(u16, channels) orelse return error.InvalidChannels,
        .sample_rate = rate,
    };
    try spec.validate();
    return spec;
}

test "ALSA format identifiers round trip every native sample representation" {
    const formats = [_]audio.Format{ .unsigned8, .signed8, .signed16_le, .signed16_be, .signed24_le, .signed24_be, .signed24_32_le, .signed24_32_be, .signed32_le, .signed32_be, .float32_le, .float32_be, .alaw, .mulaw };
    for (formats) |format| try std.testing.expectEqual(format, format_from_alsa(alsa_format(format)).?);
}

fn check(library: *Library, diagnostic: ?*Diagnostic, result: i32) Error!void {
    if (result < 0) return failure(library, diagnostic, result);
}
fn failure(library: *Library, diagnostic: ?*Diagnostic, result: i32) Error {
    if (diagnostic) |message| message.set("{s}", .{std.mem.span(library.native.functions.strerror(result))}) catch {};
    return switch (result) {
        -11 => error.WouldBlock,
        -4 => error.Interrupted,
        -32 => error.Underrun,
        -86 => error.Suspended,
        -19 => error.Disconnected,
        -22 => error.InvalidConfiguration,
        else => error.DeviceFailure,
    };
}

fn free_endpoint(allocator: std.mem.Allocator, endpoint: Endpoint) void {
    allocator.free(endpoint.name);
    allocator.free(endpoint.description);
}
