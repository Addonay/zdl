//! PulseAudio playback streams and the caller-driven logical output.
//! `Stream` ports the playback half of SDL_pulseaudio.c (OpenDevice, PlayDevice,
//! WaitDevice, GetDeviceBuf, CloseDevice). `Output(layout)` mirrors the API of
//! src/audio/device.zig (open, spec, bind, unbind, set_gain, set_paused, pump,
//! wait, drain, drop) over a PulseAudio stream instead of ALSA.
//!
//! Model: no hidden thread. `Output.pump` writes at most one period, and only when
//! the server reports that much writable space, so it never blocks. The server
//! buffers what is written and handles underruns itself, so unlike the ALSA
//! output there is no carry-over of refused frames and no recovery step.
//!
//! Deliberate differences from SDL: the server's sink is chosen by name with
//! `device` (null = default sink, same as SDL's default device); the requested
//! buffer is given in frames; `Output.endpoint_name` is null for the default sink
//! because libpulse does not report its name for a connection that did not ask
//! for one; and drain is polled (`WouldBlock` until finished) rather than blocking.
const std = @import("std");
const audio = @import("../processing.zig");
const binding = @import("binding.zig");
const context = @import("context.zig");
const logical = @import("../logical.zig");

/// Default buffer request in sample frames, matching audio/device.zig.
pub const default_buffer_frames: usize = 2048;

/// Failures of stream setup, binding and pumping. WouldBlock asks the caller to
/// wait and retry; the rest are real failures.
pub const Error = context.Error || logical.Error;

/// One playback stream on a sink, with an explicit buffer size.
pub const Stream = struct {
    shared: *context.Shared,
    handle: *binding.StreamHandle,
    /// Committed format, channels and rate. Signed 8-bit requests come back as
    /// native float32 (see context.committed_format).
    spec: audio.Spec,
    frame_bytes: usize,
    /// Frames the server buffers (tlength), as granted by libpulse.
    buffer_frames: usize,
    /// Frames per server request (minreq); `wait_writable` and `Output.pump` use it.
    period_frames: usize,
    /// Drain operation in flight, if `drain` started one.
    drain_operation: ?*binding.Operation = null,

    pub const Options = struct {
        /// Sink name from `Context.playback_devices`. Null selects the default sink.
        device: ?[:0]const u8 = null,
        /// Requested format, channels and rate. Format may be committed differently.
        spec: audio.Spec,
        /// Requested server buffer size in sample frames. Must be nonzero.
        buffer_frames: usize = default_buffer_frames,
        /// Name shown in the server's stream list.
        stream_name: [:0]const u8 = "Audio Stream",
    };

    /// Connects a playback stream and waits until the server is ready. The
    /// Context must outlive the stream; close the stream before the Context.
    pub fn open(ctx: *context.Context, options: Options) Error!Stream {
        try options.spec.validate();
        if (options.buffer_frames == 0) return error.InvalidConfiguration;
        const spec = audio.Spec{
            .format = context.committed_format(options.spec.format),
            .channels = options.spec.channels,
            .sample_rate = options.spec.sample_rate,
        };
        const frame_bytes = try spec.frame_size();
        const opened = try ctx.shared.open_stream(.{
            .direction = .playback,
            .spec = spec,
            .name = options.stream_name,
            .device = options.device,
            .attributes = try context.buffer_attributes(spec, options.buffer_frames),
        });
        const granted = opened.attributes;
        return .{
            .shared = ctx.shared,
            .handle = opened.handle,
            .spec = spec,
            .frame_bytes = frame_bytes,
            .buffer_frames = granted.tlength / frame_bytes,
            .period_frames = @max(1, granted.minreq / frame_bytes),
        };
    }

    /// Cancels a pending drain, then disconnects and releases the stream. The
    /// caller must not use the stream afterwards.
    pub fn deinit(self: *Stream) void {
        const shared = self.shared;
        const functions = &shared.library.functions;
        shared.lock();
        defer shared.unlock();
        if (self.drain_operation) |operation| {
            functions.operation_cancel(operation);
            functions.operation_unref(operation);
        }
        _ = functions.stream_disconnect(self.handle);
        functions.stream_unref(self.handle);
        shared.wake();
        self.* = undefined;
    }

    /// Frames the server will accept without blocking. Never negative.
    pub fn writable_frames(self: *Stream) Error!usize {
        self.shared.lock();
        defer self.shared.unlock();
        return (try self.writable_bytes()) / self.frame_bytes;
    }

    /// Waits until at least one period can be written. A null timeout waits
    /// until libpulse signals; a finite timeout polls about once per millisecond
    /// (see Shared.wait_until). Returns false on timeout.
    pub fn wait_writable(self: *Stream, timeout_milliseconds: ?u31) Error!bool {
        self.shared.lock();
        defer self.shared.unlock();
        return self.shared.wait_until(timeout_milliseconds, self, period_writable);
    }

    /// Queues as many whole frames from `bytes` as the server can take now. Never
    /// blocks. Returns the number of frames accepted, which is zero when full.
    /// `bytes` must hold whole frames.
    pub fn write(self: *Stream, bytes: []const u8) Error!usize {
        if (bytes.len % self.frame_bytes != 0) return error.InvalidLength;
        const requested = bytes.len / self.frame_bytes;
        if (requested == 0) return 0;
        self.shared.lock();
        defer self.shared.unlock();
        const frames = @min(requested, (try self.writable_bytes()) / self.frame_bytes);
        if (frames == 0) return 0;
        const functions = &self.shared.library.functions;
        const code = functions.stream_write(self.handle, bytes.ptr, frames * self.frame_bytes, null, 0, binding.seek_relative);
        if (code < 0) {
            self.shared.report_code("Could not write to PulseAudio stream", code);
            return error.StreamFailed;
        }
        return frames;
    }

    /// Starts draining the queued audio, or polls a drain already started. Returns
    /// `error.WouldBlock` while the server still plays; returns successfully once
    /// everything has been played. Call again after a WouldBlock.
    pub fn drain(self: *Stream) Error!void {
        self.shared.lock();
        defer self.shared.unlock();
        const functions = &self.shared.library.functions;
        if (self.drain_operation) |operation| {
            switch (functions.operation_get_state(operation)) {
                .running => return error.WouldBlock,
                .cancelled => {
                    functions.operation_unref(operation);
                    self.drain_operation = null;
                    return error.Disconnected;
                },
                else => {
                    functions.operation_unref(operation);
                    self.drain_operation = null;
                    return;
                },
            }
        }
        const operation = functions.stream_drain(self.handle, null, null) orelse return error.StreamFailed;
        if (functions.operation_get_state(operation) == .running) {
            self.drain_operation = operation;
            return error.WouldBlock;
        }
        functions.operation_unref(operation);
    }

    /// Discards everything the server has queued and any drain in progress.
    pub fn flush(self: *Stream) Error!void {
        self.shared.lock();
        defer self.shared.unlock();
        const functions = &self.shared.library.functions;
        if (self.drain_operation) |operation| {
            functions.operation_cancel(operation);
            functions.operation_unref(operation);
            self.drain_operation = null;
        }
        const operation = functions.stream_flush(self.handle, null, null) orelse return error.StreamFailed;
        functions.operation_unref(operation);
    }

    /// Pauses (true) or resumes (false) playback on the server. Written audio is
    /// kept; the server does not consume it while corked.
    pub fn set_corked(self: *Stream, corked: bool) Error!void {
        self.shared.lock();
        defer self.shared.unlock();
        const functions = &self.shared.library.functions;
        const operation = functions.stream_cork(self.handle, if (corked) 1 else 0, null, null) orelse return error.StreamFailed;
        functions.operation_unref(operation);
    }

    /// Caller holds the lock. Bytes the server can take now.
    fn writable_bytes(self: *const Stream) context.Error!usize {
        const functions = &self.shared.library.functions;
        if (functions.stream_get_state(self.handle) != .ready) return error.StreamFailed;
        const bytes = functions.stream_writable_size(self.handle);
        if (bytes == std.math.maxInt(usize)) return error.StreamFailed;
        return bytes;
    }
};

fn period_writable(stream: *Stream) context.Error!bool {
    return (try stream.writable_bytes()) / stream.frame_bytes >= stream.period_frames;
}

/// Logical playback output with the destination layout fixed at compile time.
/// Mirrors audio/device.zig's `Output`: bound streams are mixed into one period
/// per `pump`, the device gain scales the mix, and paused outputs write silence.
pub fn Output(comptime layout: audio.Layout) type {
    const channels: u16 = @intCast(layout.channels());
    return struct {
        const Self = @This();

        /// A bound stream, by pointer. Its destination layout equals `layout`.
        pub const Source = Mixer.Source;
        const Mixer = logical.Mixer(layout);

        allocator: std.mem.Allocator,
        endpoint: ?[:0]u8,
        stream: Stream,
        frame_bytes: usize,
        /// Bound streams, gain, pause and mixing (scratch sized for the largest request).
        mixer: Mixer,

        /// Opens a playback stream with `layout.channels()` channels on
        /// `options.endpoint` (null for the default sink). The endpoint name is
        /// copied, so the caller's slice may be freed right after this call.
        pub fn open(allocator: std.mem.Allocator, ctx: *context.Context, options: OutputOptions) Error!Self {
            const endpoint: ?[:0]u8 = if (options.endpoint) |name| try allocator.dupeSentinel(u8, name, 0) else null;
            errdefer if (endpoint) |name| allocator.free(name);

            var stream = try Stream.open(ctx, .{
                .device = endpoint,
                .spec = .{ .format = options.format, .channels = channels, .sample_rate = options.sample_rate },
                .buffer_frames = options.buffer_frames,
            });
            errdefer stream.deinit();

            const frame_bytes = stream.frame_bytes;
            const scratch_frames = @max(stream.buffer_frames, stream.period_frames);
            const scratch_bytes = std.math.mul(usize, scratch_frames, frame_bytes) catch return error.Overflow;
            var mixer = try Mixer.init(allocator, stream.spec, scratch_bytes);
            errdefer mixer.deinit();

            return .{
                .allocator = allocator,
                .endpoint = endpoint,
                .stream = stream,
                .frame_bytes = frame_bytes,
                .mixer = mixer,
            };
        }

        /// Closes the stream and frees owned storage. Bound streams are caller-owned
        /// and untouched; unbind them or stop using them first.
        pub fn deinit(self: *Self) void {
            self.stream.deinit();
            self.mixer.deinit();
            if (self.endpoint) |name| self.allocator.free(name);
            self.* = undefined;
        }

        /// Sink name this output was opened on, or null for the default sink.
        pub fn endpoint_name(self: *const Self) ?[]const u8 {
            return self.endpoint;
        }

        /// Committed format, channels and rate. Bound streams must produce exactly this.
        pub fn spec(self: *const Self) audio.Spec {
            return self.stream.spec;
        }

        /// Frames the server buffers for this output.
        pub fn buffer_frames(self: *const Self) usize {
            return self.stream.buffer_frames;
        }

        /// Frames per server request; the largest unit `pump` writes at once.
        pub fn period_frames(self: *const Self) usize {
            return self.stream.period_frames;
        }

        /// Adds a stream to the mix. The stream must produce this output's spec.
        /// The output keeps only the pointer; keep the stream alive while bound.
        pub fn bind(self: *Self, source: Source) Error!void {
            try self.mixer.bind(source);
        }

        /// Removes a bound stream by swapping the last binding into its slot.
        pub fn unbind(self: *Self, source: Source) Error!void {
            try self.mixer.unbind(source);
        }

        /// Number of streams currently mixed into this output.
        pub fn bound_count(self: *const Self) usize {
            return self.mixer.bound_count();
        }

        /// Sets the device gain applied to the whole mix. Must be finite and in [0, 1].
        pub fn set_gain(self: *Self, gain: f32) Error!void {
            try self.mixer.set_gain(gain);
        }

        /// Paused outputs still write silence but do not pull from bound streams,
        /// so their queued audio is preserved.
        pub fn set_paused(self: *Self, paused: bool) void {
            self.mixer.set_paused(paused);
        }

        /// Renders and writes one period if the server has room for it. Returns the
        /// frames accepted (zero when the server is still full). Never blocks.
        pub fn pump(self: *Self) Error!usize {
            const frames = self.stream.period_frames;
            if ((try self.stream.writable_frames()) < frames) return 0;
            return self.stream.write(try self.mixer.render(frames * self.frame_bytes));
        }

        /// Waits until `pump` can write a period. Null waits indefinitely; returns
        /// false on timeout.
        pub fn wait(self: *Self, timeout_milliseconds: ?u31) Error!bool {
            return self.stream.wait_writable(timeout_milliseconds);
        }

        /// Plays out the queued audio. Returns WouldBlock while the server plays.
        pub fn drain(self: *Self) Error!void {
            try self.stream.drain();
        }

        /// Discards queued audio on the server.
        pub fn drop(self: *Self) Error!void {
            try self.stream.flush();
        }
    };
}

/// Options for `Output.open`: endpoint, format, rate and buffer size.
pub const OutputOptions = struct {
    /// Sink name from `Context.playback_devices`. Null selects the default sink.
    endpoint: ?[:0]const u8 = null,
    format: audio.Format,
    sample_rate: u32,
    /// Requested server buffer in sample frames. Must be nonzero.
    buffer_frames: usize = default_buffer_frames,
};
