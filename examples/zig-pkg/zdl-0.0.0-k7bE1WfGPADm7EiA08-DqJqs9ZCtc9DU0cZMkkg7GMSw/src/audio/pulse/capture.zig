//! PulseAudio capture streams. Ported from the recording half of
//! SDL_pulseaudio.c (WaitRecordingDevice, RecordDevice, FlushRecording and
//! OpenDevice with the recording flags).
//!
//! Reads never block. `read` copies from the server's peeked fragment and drops
//! a fragment once it is fully consumed. The borrowed pointer that peek returns
//! is never kept across a call that could drop it, and holes in the recorded
//! stream (a null fragment) are dropped without being returned, as SDL does.
const std = @import("std");
const audio = @import("../processing.zig");
const binding = @import("binding.zig");
const context = @import("context.zig");
const logical = @import("../logical.zig");

/// Default buffer request in sample frames, matching playback.zig.
pub const default_buffer_frames: usize = 2048;

/// Failures of capture setup and reads. WouldBlock is not returned by `read`
/// (an empty result means nothing was recorded yet); it is reserved for callers.
pub const Error = context.Error;

/// Failures of `Input`: stream failures plus the shared logical-device errors.
pub const InputError = Error || logical.Error;

/// Options for `Stream.open`.
pub const Options = struct {
    /// Source name from `Context.capture_devices`. Null selects the default source.
    device: ?[:0]const u8 = null,
    /// Requested format, channels and rate. Format may be committed differently.
    spec: audio.Spec,
    /// Requested server buffer size in sample frames. Must be nonzero.
    buffer_frames: usize = default_buffer_frames,
    /// Name shown in the server's stream list.
    stream_name: [:0]const u8 = "Audio Stream",
};

/// One recording stream on a source. Owns the server stream handle; the
/// Context must outlive it and it must be closed before the Context.
pub const Stream = struct {
    shared: *context.Shared,
    handle: *binding.StreamHandle,
    /// Committed format, channels and rate.
    spec: audio.Spec,
    frame_bytes: usize,
    /// Frames per server fragment (fragsize as granted by libpulse).
    buffer_frames: usize,
    /// Fragment peeked from the server and not yet fully consumed. Valid until
    /// the fragment is dropped; only touched with the mainloop lock held.
    fragment: ?[]const u8 = null,
    /// Bytes copied from the held fragment. Pulse's read index does not advance
    /// until drop, so readable_size still includes these already consumed bytes.
    fragment_consumed: usize = 0,

    /// Connects a recording stream and waits until the server is ready.
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
            .direction = .capture,
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
            .buffer_frames = @max(1, granted.fragsize / frame_bytes),
        };
    }

    /// Releases a held fragment, then disconnects and frees the stream.
    pub fn deinit(self: *Stream) void {
        const shared = self.shared;
        const functions = &shared.library.functions;
        shared.lock();
        defer shared.unlock();
        if (self.fragment != null) _ = functions.stream_drop(self.handle);
        _ = functions.stream_disconnect(self.handle);
        functions.stream_unref(self.handle);
        shared.wake();
        self.* = undefined;
    }

    /// Bytes available to `read`, including a partly consumed fragment.
    pub fn readable_bytes(self: *Stream) Error!usize {
        self.shared.lock();
        defer self.shared.unlock();
        return self.readable_locked();
    }

    /// Waits until audio can be read. A null timeout waits until libpulse signals;
    /// a finite timeout polls about once per millisecond. Returns false on timeout.
    pub fn wait_readable(self: *Stream, timeout_milliseconds: ?u31) Error!bool {
        self.shared.lock();
        defer self.shared.unlock();
        return self.shared.wait_until(timeout_milliseconds, self, data_readable);
    }

    /// Copies recorded audio into `destination` in whole frames and returns the
    /// filled prefix. Returns an empty slice when nothing has been recorded yet.
    /// Never blocks. Copies stop at a fragment boundary; call again for the rest.
    pub fn read(self: *Stream, destination: []u8) Error![]u8 {
        const frames = destination.len / self.frame_bytes;
        if (frames == 0) return destination[0..0];
        self.shared.lock();
        defer self.shared.unlock();
        const functions = &self.shared.library.functions;
        _ = try self.queued_bytes_locked();
        if (self.fragment == null) {
            if (!try self.peek_locked()) return destination[0..0];
        }
        const available = self.fragment orelse return destination[0..0];
        const count = @min(available.len, frames * self.frame_bytes);
        @memcpy(destination[0..count], available[0..count]);
        const remaining = available[count..];
        self.fragment = remaining;
        self.fragment_consumed += count;
        if (remaining.len == 0) {
            if (functions.stream_drop(self.handle) < 0) return error.StreamFailed;
            self.fragment = null;
            self.fragment_consumed = 0;
        }
        return destination[0..count];
    }

    /// Discards everything recorded so far, including a partly read fragment.
    pub fn flush(self: *Stream) Error!void {
        self.shared.lock();
        defer self.shared.unlock();
        const functions = &self.shared.library.functions;
        if (self.fragment != null) {
            if (functions.stream_drop(self.handle) < 0) return error.StreamFailed;
            self.fragment = null;
            self.fragment_consumed = 0;
        }
        while (try self.queued_bytes_locked() > 0) {
            var data: ?*const anyopaque = null;
            var length: usize = 0;
            if (functions.stream_peek(self.handle, &data, &length) < 0) return error.StreamFailed;
            if (length == 0) break; // Empty peeks must not be dropped.
            if (functions.stream_drop(self.handle) < 0) return error.StreamFailed;
        }
    }

    /// Pauses (true) or resumes (false) recording on the server.
    pub fn set_corked(self: *Stream, corked: bool) Error!void {
        self.shared.lock();
        defer self.shared.unlock();
        const functions = &self.shared.library.functions;
        const operation = functions.stream_cork(self.handle, if (corked) 1 else 0, null, null) orelse return error.StreamFailed;
        functions.operation_unref(operation);
    }

    /// Caller holds the lock. Includes the held fragment exactly once, excluding
    /// its consumed prefix, which Pulse still counts until the fragment is dropped.
    fn readable_locked(self: *const Stream) Error!usize {
        const queued = try self.queued_bytes_locked();
        if (queued < self.fragment_consumed) return error.StreamFailed;
        return queued - self.fragment_consumed;
    }

    /// Caller holds the lock. Raw server queue size, including any peeked fragment.
    fn queued_bytes_locked(self: *const Stream) Error!usize {
        const functions = &self.shared.library.functions;
        if (functions.stream_get_state(self.handle) != .ready) return error.StreamFailed;
        const bytes = functions.stream_readable_size(self.handle);
        if (bytes == std.math.maxInt(usize)) return error.StreamFailed;
        return bytes;
    }

    /// Caller holds the lock. Peeks at the next non-hole fragment, dropping holes.
    /// Returns false when nothing is queued.
    fn peek_locked(self: *Stream) Error!bool {
        const functions = &self.shared.library.functions;
        while (try self.queued_bytes_locked() > 0) {
            var data: ?*const anyopaque = null;
            var length: usize = 0;
            if (functions.stream_peek(self.handle, &data, &length) < 0) return error.StreamFailed;
            if (length == 0) return false;
            const pointer = data orelse {
                // A hole in the recording: libpulse has no bytes for it, so drop it.
                if (functions.stream_drop(self.handle) < 0) return error.StreamFailed;
                continue;
            };
            const bytes: [*]const u8 = @ptrCast(pointer);
            self.fragment = bytes[0..length];
            self.fragment_consumed = 0;
            return true;
        }
        return false;
    }
};

/// Wait predicate for `wait_readable`: a fragment is held or queued.
fn data_readable(stream: *Stream) Error!bool {
    return try stream.readable_locked() > 0;
}

/// Options for `Input.open`: endpoint, format, rate and buffer size.
pub const InputOptions = struct {
    /// Source name from `Context.capture_devices`. Null selects the default source.
    endpoint: ?[:0]const u8 = null,
    format: audio.Format,
    sample_rate: u32,
    /// Requested server buffer in sample frames. Must be nonzero.
    buffer_frames: usize = default_buffer_frames,
};

/// Logical capture input with the source layout fixed at compile time. Mirrors
/// the other backends' `Input`: one recording stream, and bound destination
/// streams (by pointer) that receive every captured period through
/// `stream.write` with the committed format and rate.
pub fn Input(comptime layout: audio.Layout) type {
    const channels: u16 = @intCast(layout.channels());
    return struct {
        const Self = @This();

        /// A bound destination stream, by pointer. Its source layout is `layout`.
        pub const Source = Fanout.Source;
        const Fanout = logical.Fanout(layout);

        allocator: std.mem.Allocator,
        endpoint: ?[:0]u8,
        stream: Stream,
        frame_bytes: usize,
        fanout: Fanout,

        /// Opens a recording stream with `layout.channels()` channels on
        /// `options.endpoint` (null for the default source). The endpoint name is
        /// copied, so the caller's slice may be freed right after this call.
        pub fn open(allocator: std.mem.Allocator, ctx: *context.Context, options: InputOptions) InputError!Self {
            const endpoint: ?[:0]u8 = if (options.endpoint) |name| try allocator.dupeSentinel(u8, name, 0) else null;
            errdefer if (endpoint) |name| allocator.free(name);

            var stream = try Stream.open(ctx, .{
                .device = endpoint,
                .spec = .{ .format = options.format, .channels = channels, .sample_rate = options.sample_rate },
                .buffer_frames = options.buffer_frames,
            });
            errdefer stream.deinit();

            const frame_bytes = stream.frame_bytes;
            const scratch_bytes = std.math.mul(usize, stream.buffer_frames, frame_bytes) catch return error.Overflow;
            var fanout = try Fanout.init(allocator, stream.spec, scratch_bytes);
            errdefer fanout.deinit();

            return .{
                .allocator = allocator,
                .endpoint = endpoint,
                .stream = stream,
                .frame_bytes = frame_bytes,
                .fanout = fanout,
            };
        }

        /// Closes the stream and frees owned storage. Unbind streams first.
        pub fn deinit(self: *Self) void {
            self.stream.deinit();
            self.fanout.deinit();
            if (self.endpoint) |name| self.allocator.free(name);
            self.* = undefined;
        }

        /// Source name this input was opened on, or null for the default source.
        pub fn endpoint_name(self: *const Self) ?[]const u8 {
            return self.endpoint;
        }

        /// Committed format, channels and rate negotiated with the server.
        pub fn spec(self: *const Self) audio.Spec {
            return self.stream.spec;
        }

        /// Frames per server fragment.
        pub fn buffer_frames(self: *const Self) usize {
            return self.stream.buffer_frames;
        }

        /// Frames per server fragment; the most `pump` reads at once.
        pub fn period_frames(self: *const Self) usize {
            return self.stream.buffer_frames;
        }

        /// Adds a destination stream; the input keeps only the pointer.
        pub fn bind(self: *Self, source: Source) InputError!void {
            try self.fanout.bind(source);
        }

        /// Removes a bound stream; the last binding moves into the freed slot.
        pub fn unbind(self: *Self, source: Source) InputError!void {
            try self.fanout.unbind(source);
        }

        /// Number of bound destination streams.
        pub fn bound_count(self: *const Self) usize {
            return self.fanout.bound_count();
        }

        /// Waits until audio can be read. Null waits indefinitely; false on timeout.
        pub fn wait(self: *Self, timeout_milliseconds: ?u31) InputError!bool {
            return self.stream.wait_readable(timeout_milliseconds);
        }

        /// Reads what the server has (up to one fragment) and writes it into every
        /// bound stream. Returns frames captured; 0 when nothing is ready. Never blocks.
        pub fn pump(self: *Self) InputError!usize {
            const captured = try self.stream.read(self.fanout.scratch);
            if (captured.len == 0) return 0;
            try self.fanout.distribute(captured);
            return captured.len / self.frame_bytes;
        }

        /// Discards everything recorded so far.
        pub fn drop(self: *Self) InputError!void {
            try self.stream.flush();
        }
    };
}
