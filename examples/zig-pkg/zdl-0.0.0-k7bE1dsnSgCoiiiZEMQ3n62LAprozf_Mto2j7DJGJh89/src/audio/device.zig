//! Logical playback devices over physical endpoints (device layer of SDL_audio.c).
//!
//! Terms:
//!   - A physical endpoint is an `alsa.Endpoint` from `Library.enumerate`
//!     (ALSA hint names such as "default", "hw:0,0", or a plugin name).
//!   - An `Output(layout)` is an opened logical device. It owns one ALSA
//!     playback stream, an owned copy of its endpoint name, mixing scratch
//!     storage, and the set of bound `Stream`s. It owns no streams: callers
//!     create them, keep them alive while bound, and unbind them before deinit.
//!
//! Model and rules:
//!   - No hidden thread. `pump` renders and writes at most one period when the
//!     hardware is ready, and never blocks. `wait` sleeps until the device can
//!     accept audio. Callers drive both from their own loop.
//!   - The channel layout is part of the type. ALSA is asked for exactly
//!     `layout.channels()` channels; a Stream bound to this output must have the
//!     same destination layout, format and sample rate, which is checked at bind
//!     time. Format and rate may differ from the preference: read `spec()`.
//!   - Mixing sums every bound stream into a silence-initialized period. Stream
//!     gain applies inside each stream; the device gain (0 through 1) scales the
//!     mix. Paused outputs still write silence but do not pull from streams.
//!   - Buffer size is an explicit frame count (`Options.buffer_frames`, default
//!     2048). It becomes ALSA's latency request; the frames ALSA actually grants
//!     are available as `Output.buffer_frames`. This replaces SDL's
//!     sample-frame hints with a plain option.
//!   - Silence on idle: an output with no bound streams writes silence on each
//!     successful pump. Call pump until it returns 0 after open to prefill.
//!
//! Ownership: `Output` owns its ALSA device, endpoint name and scratch buffers.
//! It borrows the `alsa.Library`, which must outlive it. Not synchronized; use
//! one owner per output.
const std = @import("std");
const audio = @import("processing.zig");
const logical = @import("logical.zig");
const alsa = @import("alsa/device.zig");

/// Default hardware buffer request in sample frames (about 46 ms at 44.1 kHz).
pub const default_buffer_frames: usize = 2048;

/// Failures of device setup, binding and pumping. Hardware states such as
/// WouldBlock, Underrun and Suspended come from the ALSA layer and are
/// repaired by `pump`; the rest are returned unchanged.
pub const Error = alsa.Error || logical.Error || error{
    /// No playback-capable endpoint was enumerated.
    NoDefaultEndpoint,
    /// ALSA negotiated a channel count different from the typed layout.
    ChannelMismatch,
};

/// Opening parameters. Format and rate are preferences; the driver may choose
/// nearby values, and the committed values are read back through `spec()`.
pub const Options = struct {
    /// Endpoint name from `Library.enumerate`. Null selects `default_endpoint`.
    endpoint: ?[:0]const u8 = null,
    format: audio.Format,
    sample_rate: u32,
    /// Requested hardware buffer size in sample frames. Must be nonzero.
    buffer_frames: usize = default_buffer_frames,
};

/// Chooses the endpoint used when the caller names none: the "default" alias if
/// it can play, otherwise the first playback-capable endpoint in enumeration order.
pub fn default_endpoint(endpoints: []const alsa.Endpoint) ?alsa.Endpoint {
    var first: ?alsa.Endpoint = null;
    for (endpoints) |endpoint| {
        if (!endpoint.supports_playback) continue;
        if (std.mem.eql(u8, endpoint.name, "default")) return endpoint;
        if (first == null) first = endpoint;
    }
    return first;
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
        follows_default: bool,
        preferred_spec: audio.Spec,
        requested_buffer_frames: usize,
        device: alsa.Device,
        frame_bytes: usize,
        /// Bound streams, gain, pause and mixing (scratch sized for the largest
        /// chunk ALSA may take).
        mixer: Mixer,
        /// Rendered frames the hardware has not accepted yet (carry-over).
        carry: []u8,
        carry_frames: usize = 0,

        /// Opens a playback stream on `options.endpoint` (or the default endpoint)
        /// with `layout.channels()` channels. The endpoint name is copied, so the
        /// enumeration result may be freed right after this call.
        pub fn open(allocator: std.mem.Allocator, library: *alsa.Library, options: Options) Error!Self {
            const name = if (options.endpoint) |chosen|
                try allocator.dupeSentinel(u8, chosen, 0)
            else
                try default_name(allocator, library);
            errdefer allocator.free(name);

            if (options.buffer_frames == 0 or options.sample_rate == 0) return error.InvalidSampleRate;
            const preferred: audio.Spec = .{ .format = options.format, .channels = channels, .sample_rate = options.sample_rate };
            const latency = try latency_microseconds(options.buffer_frames, options.sample_rate);

            var device = try alsa.Device.open(library, .{
                .direction = .playback,
                .spec = preferred,
                .name = name,
                .non_blocking = true,
                .latency_microseconds = latency,
            });
            errdefer device.deinit();
            if (device.spec.channels != channels) return error.ChannelMismatch;

            const frame_bytes = try device.spec.frame_size();
            const scratch_frames = @max(device.buffer_frames, device.period_frames);
            const scratch_bytes = std.math.mul(usize, scratch_frames, frame_bytes) catch return error.Overflow;
            var mixer = try Mixer.init(allocator, device.spec, scratch_bytes);
            errdefer mixer.deinit();
            const carry = try allocator.alloc(u8, scratch_bytes);
            errdefer allocator.free(carry);

            return .{
                .allocator = allocator,
                .name = name,
                .follows_default = options.endpoint == null,
                .preferred_spec = preferred,
                .requested_buffer_frames = options.buffer_frames,
                .device = device,
                .frame_bytes = frame_bytes,
                .mixer = mixer,
                .carry = carry,
            };
        }

        /// Closes the ALSA stream and frees owned storage. Bound streams are
        /// caller-owned and are not touched. Unbind them or stop using them first.
        pub fn deinit(self: *Self) void {
            self.device.deinit();
            self.mixer.deinit();
            self.allocator.free(self.carry);
            self.allocator.free(self.name);
            self.* = undefined;
        }

        /// Endpoint name this output was opened on (owned by the output).
        pub fn endpoint_name(self: *const Self) []const u8 {
            return self.name;
        }

        /// True when this logical output was opened without an explicit
        /// endpoint and should follow subsequent default-device notifications.
        pub fn opened_as_default(self: *const Self) bool {
            return self.follows_default;
        }

        /// Moves a default-opened output to the new ALSA endpoint reported by
        /// `alsa_hotplug.Watcher`. The replacement is opened before the old
        /// stream is closed. Bound streams retain queued input and convert to
        /// the newly negotiated device spec at the migration boundary.
        /// Returns false for an explicitly opened device or an absent default.
        pub fn migrate_default(self: *Self, new_endpoint: ?[:0]const u8) Error!bool {
            if (!self.follows_default) return false;
            const endpoint = new_endpoint orelse return false;
            if (std.mem.eql(u8, self.name, endpoint)) return false;

            const name = try self.allocator.dupeSentinel(u8, endpoint, 0);
            errdefer self.allocator.free(name);
            var replacement = try alsa.Device.open(self.device.library, .{
                .direction = .playback,
                .spec = self.preferred_spec,
                .name = name,
                .non_blocking = true,
                .latency_microseconds = try latency_microseconds(self.requested_buffer_frames, self.preferred_spec.sample_rate),
            });
            errdefer replacement.deinit();
            if (replacement.spec.channels != channels) return error.ChannelMismatch;

            const frame_bytes = try replacement.spec.frame_size();
            const scratch_frames = @max(replacement.buffer_frames, replacement.period_frames);
            const scratch_bytes = std.math.mul(usize, scratch_frames, frame_bytes) catch return error.Overflow;
            const carry = try self.allocator.alloc(u8, scratch_bytes);
            errdefer self.allocator.free(carry);
            try self.mixer.reconfigure(replacement.spec, scratch_bytes);

            var previous_device = self.device;
            const previous_name = self.name;
            const previous_carry = self.carry;
            self.device = replacement;
            self.name = name;
            self.frame_bytes = frame_bytes;
            self.carry = carry;
            self.carry_frames = 0;
            replacement = undefined;
            previous_device.deinit();
            self.allocator.free(previous_name);
            self.allocator.free(previous_carry);
            return true;
        }

        /// Committed format, channels and rate, as negotiated with the endpoint.
        /// Streams bound to this output must produce exactly this spec.
        pub fn spec(self: *const Self) audio.Spec {
            return self.device.spec;
        }

        /// Number of frames ALSA granted for the buffer and for each period.
        pub fn buffer_frames(self: *const Self) usize {
            return self.device.buffer_frames;
        }

        /// Frames per ALSA period; the largest unit `pump` renders at once.
        pub fn period_frames(self: *const Self) usize {
            return self.device.period_frames;
        }

        /// Adds a stream to the mix. The stream must output this output's spec.
        /// The output stores only the pointer; keep the stream alive while bound.
        pub fn bind(self: *Self, source: Source) Error!void {
            try self.mixer.bind(source);
        }

        /// Removes a bound stream. Mixing is order-independent, so the removal
        /// swaps the last binding into the freed slot.
        pub fn unbind(self: *Self, source: Source) Error!void {
            try self.mixer.unbind(source);
        }

        /// Number of streams currently mixed into this output.
        pub fn bound_count(self: *const Self) usize {
            return self.mixer.bound_count();
        }

        /// Sets the device gain applied to the whole mix. Must be finite and in
        /// [0, 1]; the mixer rejects larger values.
        pub fn set_gain(self: *Self, gain: f32) Error!void {
            try self.mixer.set_gain(gain);
        }

        /// Pausing keeps the stream running but mixes silence and stops pulling
        /// from bound streams, so their queued audio is preserved.
        pub fn set_paused(self: *Self, paused: bool) void {
            self.mixer.set_paused(paused);
        }

        /// Renders and writes one period when the hardware can accept it.
        /// Returns frames accepted in this call (0 when the hardware is full or
        /// not ready). Recoverable hardware states are handled here: underrun
        /// and suspension re-prepare the stream, and frames the hardware refuses
        /// are kept and written first on the next call. Never blocks.
        pub fn pump(self: *Self) Error!usize {
            if (self.carry_frames != 0) {
                return self.write_carry() catch |err| return self.handle(err);
            }
            const ready = self.device.wait(0) catch |err| return self.handle(err);
            if (!ready) return 0;

            const frames = self.device.period_frames;
            const bytes = try self.mixer.render(frames * self.frame_bytes);
            const accepted = self.device.write(bytes) catch |err| {
                self.keep_rendered(bytes, 0, frames);
                return self.handle(err);
            };
            self.keep_rendered(bytes, accepted, frames);
            return accepted;
        }

        /// Waits up to `timeout_milliseconds` (null waits indefinitely) until the
        /// output is ready for `pump`. Returns false on timeout.
        pub fn wait(self: *Self, timeout_milliseconds: ?u31) Error!bool {
            return self.device.wait(timeout_milliseconds);
        }

        /// Plays out queued audio and stops. Carried frames must be pumped first;
        /// returns WouldBlock while they remain or while ALSA is still draining.
        pub fn drain(self: *Self) Error!void {
            if (self.carry_frames != 0) return error.WouldBlock;
            try self.device.drain();
        }

        /// Discards queued audio and carried frames, then prepares the stream again.
        pub fn drop(self: *Self) Error!void {
            self.carry_frames = 0;
            try self.device.stop();
            try self.device.prepare();
        }

        fn write_carry(self: *Self) Error!usize {
            const count = self.carry_frames * self.frame_bytes;
            const accepted = try self.device.write(self.carry[0..count]);
            const remaining = self.carry_frames - accepted;
            std.mem.copyForwards(u8, self.carry[0 .. remaining * self.frame_bytes], self.carry[accepted * self.frame_bytes .. count]);
            self.carry_frames = remaining;
            return accepted;
        }

        /// Stores the part of a rendered period that the hardware did not take.
        fn keep_rendered(self: *Self, rendered: []const u8, accepted: usize, frames: usize) void {
            const remaining = frames - accepted;
            if (remaining == 0) return;
            @memcpy(self.carry[0 .. remaining * self.frame_bytes], rendered[accepted * self.frame_bytes .. frames * self.frame_bytes]);
            self.carry_frames = remaining;
        }

        /// Maps transfer errors to "retry later" (0 frames), repairs underrun or
        /// suspension, and propagates every other failure.
        fn handle(self: *Self, err: Error) Error!usize {
            switch (err) {
                error.WouldBlock, error.Interrupted => return 0,
                error.Underrun, error.Suspended => {
                    self.device.recover() catch |recover_err| switch (recover_err) {
                        error.WouldBlock => return 0,
                        else => return recover_err,
                    };
                    return 0;
                },
                else => return err,
            }
        }
    };
}

/// Chooses the capture endpoint used when the caller names none: "default" if
/// it can capture, otherwise the first capture-capable endpoint in enumeration
/// order. Mirrors `default_endpoint` for the input direction.
pub fn default_capture_endpoint(endpoints: []const alsa.Endpoint) ?alsa.Endpoint {
    var first: ?alsa.Endpoint = null;
    for (endpoints) |endpoint| {
        if (!endpoint.supports_capture) continue;
        if (std.mem.eql(u8, endpoint.name, "default")) return endpoint;
        if (first == null) first = endpoint;
    }
    return first;
}

/// Logical capture input with the source layout fixed at compile time. It
/// mirrors `Output`: one ALSA capture stream, owned scratch, and bound streams
/// (by pointer) that receive every captured period through `stream.write`.
pub fn Input(comptime layout: audio.Layout) type {
    const channels: u16 = @intCast(layout.channels());
    return struct {
        const Self = @This();

        /// A bound destination stream, by pointer. Its source layout is `layout`.
        pub const Source = Fanout.Source;
        const Fanout = logical.Fanout(layout);

        allocator: std.mem.Allocator,
        name: [:0]u8,
        follows_default: bool,
        preferred_spec: audio.Spec,
        requested_buffer_frames: usize,
        device: alsa.Device,
        frame_bytes: usize,
        /// Bound destination streams and period scratch.
        fanout: Fanout,

        /// Opens a capture stream with `layout.channels()` channels. The
        /// endpoint name is copied; the library is only borrowed.
        pub fn open(allocator: std.mem.Allocator, library: *alsa.Library, options: Options) Error!Self {
            const name = if (options.endpoint) |chosen|
                try allocator.dupeSentinel(u8, chosen, 0)
            else
                try default_capture_name(allocator, library);
            errdefer allocator.free(name);

            if (options.buffer_frames == 0 or options.sample_rate == 0) return error.InvalidSampleRate;
            const preferred: audio.Spec = .{ .format = options.format, .channels = channels, .sample_rate = options.sample_rate };
            const latency = try latency_microseconds(options.buffer_frames, options.sample_rate);

            var device = try alsa.Device.open(library, .{
                .direction = .capture,
                .spec = preferred,
                .name = name,
                .non_blocking = true,
                .latency_microseconds = latency,
            });
            errdefer device.deinit();
            if (device.spec.channels != channels) return error.ChannelMismatch;

            const frame_bytes = try device.spec.frame_size();
            const scratch_bytes = std.math.mul(usize, @max(device.buffer_frames, device.period_frames), frame_bytes) catch return error.Overflow;
            var fanout = try Fanout.init(allocator, device.spec, scratch_bytes);
            errdefer fanout.deinit();

            return .{
                .allocator = allocator,
                .name = name,
                .follows_default = options.endpoint == null,
                .preferred_spec = preferred,
                .requested_buffer_frames = options.buffer_frames,
                .device = device,
                .frame_bytes = frame_bytes,
                .fanout = fanout,
            };
        }

        /// Closes the ALSA stream and frees owned storage. Unbind streams first.
        pub fn deinit(self: *Self) void {
            self.device.deinit();
            self.fanout.deinit();
            self.allocator.free(self.name);
            self.* = undefined;
        }

        /// Endpoint name this input was opened on (owned by the input).
        pub fn endpoint_name(self: *const Self) []const u8 {
            return self.name;
        }

        /// True when this capture input was opened without an explicit endpoint.
        pub fn opened_as_default(self: *const Self) bool {
            return self.follows_default;
        }

        /// Moves a default-opened input to the new ALSA endpoint reported by
        /// `alsa_hotplug.Watcher`. Captured queues receive a normal source-spec
        /// boundary when the replacement reports a different format or rate.
        pub fn migrate_default(self: *Self, new_endpoint: ?[:0]const u8) Error!bool {
            if (!self.follows_default) return false;
            const endpoint = new_endpoint orelse return false;
            if (std.mem.eql(u8, self.name, endpoint)) return false;

            const name = try self.allocator.dupeSentinel(u8, endpoint, 0);
            errdefer self.allocator.free(name);
            var replacement = try alsa.Device.open(self.device.library, .{
                .direction = .capture,
                .spec = self.preferred_spec,
                .name = name,
                .non_blocking = true,
                .latency_microseconds = try latency_microseconds(self.requested_buffer_frames, self.preferred_spec.sample_rate),
            });
            errdefer replacement.deinit();
            if (replacement.spec.channels != channels) return error.ChannelMismatch;

            const frame_bytes = try replacement.spec.frame_size();
            const scratch_frames = @max(replacement.buffer_frames, replacement.period_frames);
            const scratch_bytes = std.math.mul(usize, scratch_frames, frame_bytes) catch return error.Overflow;
            try self.fanout.reconfigure(replacement.spec, scratch_bytes);

            var previous_device = self.device;
            const previous_name = self.name;
            self.device = replacement;
            self.name = name;
            self.frame_bytes = frame_bytes;
            replacement = undefined;
            previous_device.deinit();
            self.allocator.free(previous_name);
            return true;
        }

        /// Committed format, channels and rate negotiated with ALSA.
        pub fn spec(self: *const Self) audio.Spec {
            return self.device.spec;
        }

        /// Frames ALSA granted for the buffer.
        pub fn buffer_frames(self: *const Self) usize {
            return self.device.buffer_frames;
        }

        /// Frames per ALSA period; the most `pump` reads at once.
        pub fn period_frames(self: *const Self) usize {
            return self.device.period_frames;
        }

        /// Adds a destination stream. Captured audio is written into it with the
        /// input's negotiated format and rate. The output keeps only the pointer.
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

        /// Waits up to `timeout_milliseconds` (null: indefinitely) for capture data.
        pub fn wait(self: *Self, timeout_milliseconds: ?u31) Error!bool {
            return self.device.wait(timeout_milliseconds);
        }

        /// Reads one period when ALSA has it and writes it into every bound
        /// stream. Returns frames captured; 0 when nothing is ready. Overrun
        /// and suspension are recovered here; other failures propagate.
        pub fn pump(self: *Self) Error!usize {
            const count = self.device.period_frames * self.frame_bytes;
            const captured = self.device.read(self.fanout.scratch[0..count]) catch |err| return self.handle(err);
            if (captured.len == 0) return 0;
            try self.fanout.distribute(captured);
            return captured.len / self.frame_bytes;
        }

        /// Discards queued capture data and prepares the stream again.
        pub fn drop(self: *Self) Error!void {
            try self.device.stop();
            try self.device.prepare();
        }

        fn handle(self: *Self, err: Error) Error!usize {
            switch (err) {
                error.WouldBlock, error.Interrupted => return 0,
                error.Overrun, error.Underrun, error.Suspended => {
                    self.device.recover() catch |recover_err| switch (recover_err) {
                        error.WouldBlock => return 0,
                        else => return recover_err,
                    };
                    return 0;
                },
                else => return err,
            }
        }
    };
}

fn latency_microseconds(frames: usize, sample_rate: u32) Error!u32 {
    if (frames == 0 or sample_rate == 0) return error.InvalidSampleRate;
    const frame_count = std.math.cast(u64, frames) orelse return error.Overflow;
    const scaled = std.math.mul(u64, frame_count, 1_000_000) catch return error.Overflow;
    const latency = @max(@as(u64, 1), scaled / sample_rate);
    return std.math.cast(u32, latency) orelse error.Overflow;
}

fn default_capture_name(allocator: std.mem.Allocator, library: *alsa.Library) Error![:0]u8 {
    var list = try library.enumerate(allocator);
    defer list.deinit();
    const endpoint = default_capture_endpoint(list.items) orelse return error.NoDefaultEndpoint;
    return allocator.dupeSentinel(u8, endpoint.name, 0);
}

fn default_name(allocator: std.mem.Allocator, library: *alsa.Library) Error![:0]u8 {
    var list = try library.enumerate(allocator);
    defer list.deinit();
    const endpoint = default_endpoint(list.items) orelse return error.NoDefaultEndpoint;
    return allocator.dupeSentinel(u8, endpoint.name, 0);
}
