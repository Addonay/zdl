//! Logical playback and capture devices over PipeWire nodes, with the same
//! shape as `audio.device.Output` / `Input` over ALSA.
//!
//! Terms follow src/audio/device.zig:
//!   - `Output(layout)` owns one playback stream, an owned copy of its target
//!     name, mixing scratch and the set of bound destination streams (by
//!     pointer; the caller keeps them alive while bound).
//!   - `Input(layout)` owns one capture stream and fans captured audio out to
//!     bound streams, whose source layout is `layout`.
//!
//! Model and rules:
//!   - No hidden thread of zdl's own. PipeWire's thread loop carries the stream
//!     callbacks; `pump` only moves bytes between the ring and the caller and
//!     never blocks. `wait` blocks only when given a timeout the caller chose.
//!   - The channel layout is part of the type and fixes the channel count and
//!     SPA positions requested from PipeWire. Format and rate are preferences;
//!     read `spec()` after open. Output streams must match that spec at bind.
//!   - `period_frames` is `buffer_frames / 4` (at least 1): the most frames one
//!     `pump` renders. `buffer_frames` is the ring capacity request.
//!   - Output with no bound streams writes silence. Paused output writes
//!     silence and does not pull from streams (queued audio is kept).
//!   - Target: a node name from `Connection.devices`, or the default sink or
//!     source from the session's "default" metadata when `endpoint` is null.
//!     An empty `endpoint_name` means the session manager chooses.
//!
//! Ownership: the device owns its stream, name and scratch. It borrows the
//! `Connection`, which must outlive it. Not synchronized; one owner per device.
const std = @import("std");
const audio = @import("../processing.zig");
const stream_module = @import("../stream.zig");
const pw_stream = @import("stream.zig");
const context = @import("context.zig");
const pod = @import("pod.zig");
const logical = @import("../logical.zig");

/// Failures of opening, binding and pumping. Stream-level WouldBlock is mapped
/// to a 0-frame result by `pump`; the rest propagate.
pub const Error = pw_stream.Error || context.Error || logical.Error || error{
    /// The negotiated stream has a channel count other than the layout's.
    ChannelMismatch,
    /// Requested target node is unknown to the connection.
    UnknownTarget,
};

/// Opening parameters. `endpoint` is a node name, or null for the default.
pub const Options = struct {
    endpoint: ?[:0]const u8 = null,
    format: audio.Format,
    sample_rate: u32,
    /// Ring capacity request in frames. Must be nonzero.
    buffer_frames: usize = 2048,
};

/// Default ring capacity in frames, matching the ALSA backend.
pub const default_buffer_frames: usize = 2048;

/// Owned name for an endpoint: the given node name, the session default, or
/// empty when neither is available (PipeWire then picks).
fn resolve_name(allocator: std.mem.Allocator, connection: *context.Connection, endpoint: ?[:0]const u8, class: context.Class) Error![:0]u8 {
    if (endpoint) |name| return allocator.dupeSentinel(u8, name, 0);
    const default = try connection.default_device(allocator, class);
    const name = default orelse return allocator.dupeSentinel(u8, "", 0);
    defer allocator.free(name);
    return allocator.dupeSentinel(u8, name, 0);
}

/// Logical playback output with the destination layout fixed at compile time.
pub fn Output(comptime layout: audio.Layout) type {
    const channels: u16 = @intCast(layout.channels());
    return struct {
        const Self = @This();

        /// A bound stream, by pointer. Its destination layout equals `layout`.
        pub const Source = Mixer.Source;
        const Mixer = logical.Mixer(layout);

        allocator: std.mem.Allocator,
        name: [:0]u8,
        stream: pw_stream.Stream,
        frame_bytes: usize,
        period_size: usize,
        buffer_size: usize,
        mixer: Mixer,

        /// Opens a playback stream with `layout.channels()` channels on the
        /// requested node. The name is copied; the connection is only borrowed.
        pub fn open(allocator: std.mem.Allocator, connection: *context.Connection, options: Options) Error!Self {
            if (options.buffer_frames == 0 or options.sample_rate == 0) return error.InvalidSampleRate;
            const name = try resolve_name(allocator, connection, options.endpoint, .sink);
            errdefer allocator.free(name);

            var stream = try pw_stream.Stream.open(allocator, connection, .{
                .direction = .playback,
                .spec = .{ .format = options.format, .channels = channels, .sample_rate = options.sample_rate },
                .positions = pod.layout_positions(layout),
                .target = if (name.len != 0) name else null,
                .name = "zdl playback",
                .buffer_frames = options.buffer_frames,
            });
            errdefer stream.deinit();

            const negotiated = stream.spec();
            if (negotiated.channels != channels) return error.ChannelMismatch;
            const frame_bytes = try negotiated.frame_size();
            const period = @max(@as(usize, 1), options.buffer_frames / 4);
            const scratch = std.math.mul(usize, period, frame_bytes) catch return error.Overflow;
            var mixer = try Mixer.init(allocator, negotiated, scratch);
            errdefer mixer.deinit();

            return .{
                .allocator = allocator,
                .name = name,
                .stream = stream,
                .frame_bytes = frame_bytes,
                .period_size = period,
                .buffer_size = options.buffer_frames,
                .mixer = mixer,
            };
        }

        /// Closes the stream and frees owned storage. Bound streams are not
        /// touched; unbind them before this call.
        pub fn deinit(self: *Self) void {
            self.stream.deinit();
            self.mixer.deinit();
            self.allocator.free(self.name);
            self.* = undefined;
        }

        /// Node name this output targets; empty when PipeWire chooses.
        pub fn endpoint_name(self: *const Self) []const u8 {
            return self.name;
        }

        /// Committed format, channels and rate negotiated with PipeWire.
        pub fn spec(self: *const Self) audio.Spec {
            return self.stream.spec();
        }

        /// Ring capacity requested for this device, in frames.
        pub fn buffer_frames(self: *const Self) usize {
            return self.buffer_size;
        }

        /// Frames rendered per `pump` at most.
        pub fn period_frames(self: *const Self) usize {
            return self.period_size;
        }

        /// Adds a stream to the mix. Its spec must equal the output spec.
        pub fn bind(self: *Self, source: Source) Error!void {
            try self.mixer.bind(source);
        }

        /// Removes a bound stream; the last binding is moved into its slot.
        pub fn unbind(self: *Self, source: Source) Error!void {
            try self.mixer.unbind(source);
        }

        /// Number of streams currently mixed into this output.
        pub fn bound_count(self: *const Self) usize {
            return self.mixer.bound_count();
        }

        /// Sets the device gain applied to the mix. Must be in [0, 1].
        pub fn set_gain(self: *Self, gain: f32) Error!void {
            try self.mixer.set_gain(gain);
        }

        /// Paused outputs write silence and do not pull from bound streams.
        pub fn set_paused(self: *Self, paused: bool) void {
            self.mixer.set_paused(paused);
        }

        /// Renders and writes as many frames as the ring can take, up to one
        /// period. Returns frames accepted; 0 when the ring is full.
        pub fn pump(self: *Self) Error!usize {
            const free_frames = self.stream.writable_bytes() / self.frame_bytes;
            const frames = @min(self.period_size, free_frames);
            if (frames == 0) return 0;
            const count = frames * self.frame_bytes;
            const accepted = try self.stream.write(try self.mixer.render(count));
            return accepted / self.frame_bytes;
        }

        /// Waits until the ring has space (see `stream_module.Stream.wait`).
        pub fn wait(self: *Self, timeout_milliseconds: ?u31) Error!bool {
            return self.stream.wait(timeout_milliseconds);
        }

        /// Fails with WouldBlock while queued audio remains in the ring.
        pub fn drain(self: *Self) Error!void {
            self.stream.drain() catch |err| return switch (err) {
                error.NotDrained => error.WouldBlock,
                else => err,
            };
        }

        /// Discards queued audio without disconnecting the stream.
        pub fn drop(self: *Self) Error!void {
            self.stream.flush();
        }
    };
}

/// Logical capture input with the source layout fixed at compile time.
pub fn Input(comptime layout: audio.Layout) type {
    const channels: u16 = @intCast(layout.channels());
    return struct {
        const Self = @This();

        /// A bound destination stream, by pointer. Its source layout is `layout`.
        pub const Source = Fanout.Source;
        const Fanout = logical.Fanout(layout);

        allocator: std.mem.Allocator,
        name: [:0]u8,
        stream: pw_stream.Stream,
        frame_bytes: usize,
        period_size: usize,
        buffer_size: usize,
        fanout: Fanout,

        /// Opens a capture stream with `layout.channels()` channels on the
        /// requested node (or the default source when `endpoint` is null).
        pub fn open(allocator: std.mem.Allocator, connection: *context.Connection, options: Options) Error!Self {
            if (options.buffer_frames == 0 or options.sample_rate == 0) return error.InvalidSampleRate;
            const name = try resolve_name(allocator, connection, options.endpoint, .source);
            errdefer allocator.free(name);

            var stream = try pw_stream.Stream.open(allocator, connection, .{
                .direction = .capture,
                .spec = .{ .format = options.format, .channels = channels, .sample_rate = options.sample_rate },
                .positions = pod.layout_positions(layout),
                .target = if (name.len != 0) name else null,
                .name = "zdl capture",
                .buffer_frames = options.buffer_frames,
            });
            errdefer stream.deinit();

            const negotiated = stream.spec();
            if (negotiated.channels != channels) return error.ChannelMismatch;
            const frame_bytes = try negotiated.frame_size();
            const period = @max(@as(usize, 1), options.buffer_frames / 4);
            const scratch = std.math.mul(usize, period, frame_bytes) catch return error.Overflow;
            var fanout = try Fanout.init(allocator, negotiated, scratch);
            errdefer fanout.deinit();

            return .{
                .allocator = allocator,
                .name = name,
                .stream = stream,
                .frame_bytes = frame_bytes,
                .period_size = period,
                .buffer_size = options.buffer_frames,
                .fanout = fanout,
            };
        }

        /// Closes the stream and frees owned storage. Unbind streams first.
        pub fn deinit(self: *Self) void {
            self.stream.deinit();
            self.fanout.deinit();
            self.allocator.free(self.name);
            self.* = undefined;
        }

        /// Node name this input captures from; empty when PipeWire chooses.
        pub fn endpoint_name(self: *const Self) []const u8 {
            return self.name;
        }

        /// Committed format, channels and rate negotiated with PipeWire.
        pub fn spec(self: *const Self) audio.Spec {
            return self.stream.spec();
        }

        /// Ring capacity requested for this device, in frames.
        pub fn buffer_frames(self: *const Self) usize {
            return self.buffer_size;
        }

        /// Frames read per `pump` at most.
        pub fn period_frames(self: *const Self) usize {
            return self.period_size;
        }

        /// Adds a destination stream. Captured audio is written into it with the
        /// negotiated format and rate on each pump.
        pub fn bind(self: *Self, source: Source) Error!void {
            try self.fanout.bind(source);
        }

        /// Removes a bound stream; the last binding moves into the freed slot.
        pub fn unbind(self: *Self, source: Source) Error!void {
            try self.fanout.unbind(source);
        }

        /// Number of bound destination streams.
        pub fn bound_count(self: *const Self) usize {
            return self.fanout.bound_count();
        }

        /// Reads one period of captured frames and writes them into every bound
        /// stream. Returns frames read; 0 when nothing is buffered yet.
        pub fn pump(self: *Self) Error!usize {
            const count = self.period_size * self.frame_bytes;
            const got = self.stream.read(self.fanout.scratch[0..count]) catch |err| return switch (err) {
                error.WouldBlock => 0,
                else => err,
            };
            if (got == 0) return 0;
            try self.fanout.distribute(self.fanout.scratch[0..got]);
            return got / self.frame_bytes;
        }

        /// Waits until captured data is available (see `Stream.wait`).
        pub fn wait(self: *Self, timeout_milliseconds: ?u31) Error!bool {
            return self.stream.wait(timeout_milliseconds);
        }

        /// Discards buffered audio without disconnecting the stream.
        pub fn drop(self: *Self) Error!void {
            self.stream.flush();
        }
    };
}
