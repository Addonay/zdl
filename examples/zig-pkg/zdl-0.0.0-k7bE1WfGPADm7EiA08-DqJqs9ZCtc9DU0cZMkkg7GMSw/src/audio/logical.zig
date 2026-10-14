//! Logical-device layer shared by every audio backend (the logical half of
//! SDL_audio.c's logical/physical split).
//!
//! A physical endpoint (ALSA PCM, PulseAudio stream, PipeWire stream, JACK
//! client) moves bytes. The logical layer below owns what SDL keeps in
//! SDL_LogicalAudioDevice, independent of transport:
//!   - the list of bound `Stream`s, held by pointer, with the spec check at bind
//!     time, duplicate/unknown detection and swap-removal;
//!   - the device gain (0 through 1) and the paused flag;
//!   - mixing: a silence-initialized period into which every bound stream is
//!     summed with `processing.mix_into`, so a paused or idle device still
//!     produces silence;
//!   - capture distribution: one captured period written to every bound
//!     destination stream with the physical spec as the stream's source.
//!
//! Backends keep transport code only: opening, readiness waits, writes of the
//! rendered bytes, recovery, drain/drop and their own events. Their `Output`
//! and `Input` types embed a `Mixer` / `Fanout` and forward the public API.
//!
//! Ownership: `Mixer` owns its two scratch buffers and the binding list. It never
//! owns bound streams; callers keep them alive while bound and unbind them
//! before `deinit`. Nothing here is synchronized: one owner per device.
//!
//! Time: no backend returns timestamps today. Frame counts are the only
//! position unit. Any timestamp a backend adds must be nanoseconds on
//! CLOCK_MONOTONIC (the same domain as `std.Io` monotonic clocks), never
//! wall-clock time and never a backend-private epoch.
const std = @import("std");
const audio = @import("processing.zig");
const stream_module = @import("stream.zig");

/// Failures of the logical layer, shared by every backend's error set.
pub const Error = audio.Error || stream_module.Error || std.mem.Allocator.Error || error{
    /// The stream's destination spec does not equal the device spec.
    SpecMismatch,
    /// This stream is already bound to the device.
    AlreadyBound,
    /// The stream is not bound to this device.
    NotBound,
};

/// Common failure for "the library or server is not there": the shared object
/// cannot be loaded or lacks a symbol, or the sound server/daemon cannot be
/// reached. Every backend's `Library.open` and server connect return exactly
/// `error.Unavailable` for these cases (the error name is shared, so sets merge).
pub const Unavailable = error{Unavailable};

/// Byte that represents silence for one format: unsigned 8-bit PCM is centered
/// on 0x80; every other supported encoding (signed integer and float) uses zero.
pub fn silence_byte(format: audio.Format) u8 {
    return if (format == .unsigned8) 0x80 else 0;
}

/// Checks a device gain: finite and within [0, 1].
pub fn check_gain(gain: f32) error{InvalidGain}!void {
    if (!std.math.isFinite(gain) or gain < 0 or gain > 1) return error.InvalidGain;
}

fn names_of_layouts() []const [:0]const u8 {
    return @typeInfo(audio.Layout).@"enum".field_names;
}

/// Type-erased handle to a bound playback stream. Its active member fixes the
/// source layout; the destination layout is `destination`.
fn PlaybackSource(comptime destination: audio.Layout) type {
    const names = comptime names_of_layouts();
    const types = comptime blk: {
        var list: [names.len]type = undefined;
        for (names, 0..) |name, index| {
            list[index] = *stream_module.Stream(@field(audio.Layout, name), destination);
        }
        break :blk list;
    };
    const attributes = comptime blk: {
        const attrs: [names.len]std.lang.Type.Union.FieldAttributes = @splat(.{});
        break :blk attrs;
    };
    return @Union(.auto, audio.Layout, names, &types, &attributes);
}

/// Type-erased handle to a bound capture stream. The source layout is `source`;
/// the active member's tag is the stream's destination layout.
fn CaptureSource(comptime source: audio.Layout) type {
    const names = comptime names_of_layouts();
    const types = comptime blk: {
        var list: [names.len]type = undefined;
        for (names, 0..) |name, index| {
            list[index] = *stream_module.Stream(source, @field(audio.Layout, name));
        }
        break :blk list;
    };
    const attributes = comptime blk: {
        const attrs: [names.len]std.lang.Type.Union.FieldAttributes = @splat(.{});
        break :blk attrs;
    };
    return @Union(.auto, audio.Layout, names, &types, &attributes);
}

fn address_of(source: anytype) usize {
    return switch (source) {
        inline else => |stream| @intFromPtr(stream),
    };
}

fn index_of(comptime Source: type, sources: []const Source, source: Source) ?usize {
    const address = address_of(source);
    for (sources, 0..) |bound, index| {
        if (address_of(bound) == address) return index;
    }
    return null;
}

/// Playback side: bound streams, gain, pause and mixing for destination
/// `layout`.
pub fn Mixer(comptime layout: audio.Layout) type {
    return struct {
        const Self = @This();

        /// A bound stream, by pointer. Its destination layout equals `layout`.
        pub const Source = PlaybackSource(layout);

        allocator: std.mem.Allocator,
        /// Committed device spec; bound streams must produce exactly this.
        spec: audio.Spec,
        gain: f32 = 1,
        paused: bool = false,
        sources: std.ArrayList(Source) = .empty,
        /// Rendered audio for one write.
        mix: []u8,
        /// One stream's output before it is mixed.
        stage: []u8,

        /// Allocates the scratch buffers (`scratch_bytes` each, the most a single
        /// `render` may produce). `spec` is the physical device's committed spec.
        pub fn init(allocator: std.mem.Allocator, spec: audio.Spec, scratch_bytes: usize) Error!Self {
            try spec.validate();
            const mix = try allocator.alloc(u8, scratch_bytes);
            errdefer allocator.free(mix);
            const stage = try allocator.alloc(u8, scratch_bytes);
            return .{ .allocator = allocator, .spec = spec, .mix = mix, .stage = stage };
        }

        /// Frees owned storage. Bound streams are not touched.
        pub fn deinit(self: *Self) void {
            self.sources.deinit(self.allocator);
            self.allocator.free(self.mix);
            self.allocator.free(self.stage);
            self.* = undefined;
        }

        /// Adds a stream to the mix. Its destination spec must equal `spec`.
        /// Only the pointer is stored; keep the stream alive while bound.
        pub fn bind(self: *Self, source: Source) Error!void {
            const destination = switch (source) {
                inline else => |stream| stream.destination_spec(),
            };
            if (destination.format != self.spec.format or destination.sample_rate != self.spec.sample_rate or destination.channels != self.spec.channels) {
                return error.SpecMismatch;
            }
            if (index_of(Source, self.sources.items, source) != null) return error.AlreadyBound;
            try self.sources.append(self.allocator, source);
        }

        /// Removes a bound stream. Mixing is order-independent, so the last
        /// binding is swapped into the freed slot.
        pub fn unbind(self: *Self, source: Source) Error!void {
            const index = index_of(Source, self.sources.items, source) orelse return error.NotBound;
            _ = self.sources.swapRemove(index);
        }

        /// Number of streams currently mixed.
        pub fn bound_count(self: *const Self) usize {
            return self.sources.items.len;
        }

        /// Sets the gain applied to the whole mix. Finite and within [0, 1].
        pub fn set_gain(self: *Self, gain: f32) error{InvalidGain}!void {
            try check_gain(gain);
            self.gain = gain;
        }

        /// A paused device renders silence and does not pull from bound streams,
        /// so their queued audio is preserved.
        pub fn set_paused(self: *Self, paused: bool) void {
            self.paused = paused;
        }

        /// Fills `mix[0..count]` with silence, then adds every bound stream
        /// scaled by the device gain. Returns the rendered prefix of `mix`.
        /// `count` must be a whole number of frames and at most the scratch size.
        pub fn render(self: *Self, count: usize) Error![]u8 {
            if (count > self.mix.len) return error.BufferTooSmall;
            const output = self.mix[0..count];
            @memset(output, silence_byte(self.spec.format));
            if (self.paused) return output;
            for (self.sources.items) |source| {
                var got: usize = 0;
                while (got < count) {
                    const part = try read_source(source, self.stage[got..count]);
                    if (part.len == 0) break;
                    got += part.len;
                }
                if (got != 0) try audio.mix_into(self.spec.format, output[0..got], self.stage[0..got], self.gain);
            }
            return output;
        }

        fn read_source(source: Source, destination: []u8) stream_module.Error![]u8 {
            return switch (source) {
                inline else => |stream| stream.read_some(destination),
            };
        }
    };
}

/// Capture side: bound destination streams for source `layout`, fed with every
/// captured period.
pub fn Fanout(comptime layout: audio.Layout) type {
    return struct {
        const Self = @This();

        /// A bound destination stream, by pointer. Its source layout is `layout`.
        pub const Source = CaptureSource(layout);

        allocator: std.mem.Allocator,
        /// Committed device spec, used as the source description of each write.
        spec: audio.Spec,
        sources: std.ArrayList(Source) = .empty,
        /// Storage for one captured period.
        scratch: []u8,

        /// Allocates `scratch_bytes` of capture scratch for a device with `spec`.
        pub fn init(allocator: std.mem.Allocator, spec: audio.Spec, scratch_bytes: usize) Error!Self {
            try spec.validate();
            const scratch = try allocator.alloc(u8, scratch_bytes);
            return .{ .allocator = allocator, .spec = spec, .scratch = scratch };
        }

        /// Frees owned storage. Bound streams are not touched.
        pub fn deinit(self: *Self) void {
            self.sources.deinit(self.allocator);
            self.allocator.free(self.scratch);
            self.* = undefined;
        }

        /// Adds a destination stream. Captured audio is written into it with the
        /// device's format and rate. Only the pointer is stored.
        pub fn bind(self: *Self, source: Source) Error!void {
            if (index_of(Source, self.sources.items, source) != null) return error.AlreadyBound;
            try self.sources.append(self.allocator, source);
        }

        /// Removes a bound stream; the last binding moves into the freed slot.
        pub fn unbind(self: *Self, source: Source) Error!void {
            const index = index_of(Source, self.sources.items, source) orelse return error.NotBound;
            _ = self.sources.swapRemove(index);
        }

        /// Number of bound destination streams.
        pub fn bound_count(self: *const Self) usize {
            return self.sources.items.len;
        }

        /// Writes `bytes` (whole frames in the device spec) into every bound stream.
        pub fn distribute(self: *Self, bytes: []const u8) stream_module.Error!void {
            for (self.sources.items) |source| switch (source) {
                inline else => |stream| try stream.write(.{ .format = self.spec.format, .sample_rate = self.spec.sample_rate }, bytes),
            };
        }
    };
}
