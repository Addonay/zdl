//! PipeWire playback and capture streams with pull/push byte I/O.
//!
//! Model (SDL_pipewire.c, output_callback/input_callback and format setup):
//!   - A stream is connected with one EnumFormat param listing the acceptable
//!     sample formats (requested first), the requested rate and channel count,
//!     and canonical channel positions. PipeWire answers with a Format param,
//!     which `param_changed` decodes into the negotiated spec. `open` waits for
//!     that answer (or a failure) before returning.
//!   - Between the application and PipeWire sits a byte ring. Playback: `write`
//!     fills it, and the process callback drains it into dequeued buffers,
//!     padding with silence on underrun. Capture: the process callback fills
//!     it from dequeued buffers, and `read` drains it. Whole frames only.
//!   - Ring capacity is fixed at open: `max_buffer_frames` frames at the
//!     requested channel count and 4 bytes per sample. Overflow in capture is
//!     counted and dropped; playback writes accept only what fits.
//!   - Format and rate are PipeWire's choice. Read `spec()` after open; a
//!     stream bound to a device must carry exactly that spec.
//!
//! Synchronization: all `State` fields are touched only under the connection's
//! thread-loop lock. Public methods take it; process and param callbacks run
//! with it held.
//!
//! Ownership: `Stream` owns its PipeWire stream and ring. It borrows the
//! `Connection`, which must outlive it. `deinit` takes the lock itself.
const std = @import("std");
const audio = @import("../processing.zig");
const binding = @import("binding.zig");
const context = @import("context.zig");
const pod = @import("pod.zig");

/// Failures of stream setup and I/O. WouldBlock means "try again after wait".
pub const Error = binding.Error || audio.Error || std.mem.Allocator.Error || pod.Error || error{
    /// The requested direction does not match this operation.
    InvalidDirection,
    /// PipeWire did not report a format within the open timeout.
    NegotiationTimeout,
    /// The stream entered PipeWire's error state.
    StreamFailed,
    /// No data or space is available right now.
    WouldBlock,
    /// Playback was asked to drain while queued audio remains.
    NotDrained,
    /// Requested spec cannot be expressed to PipeWire (zero rate or channels).
    InvalidSpec,
};

/// Which way the stream carries audio.
pub const Direction = enum { playback, capture };

/// Parameters for `Stream.open`. Format and rate are preferences: PipeWire
/// may choose others, reported by `spec`.
pub const Options = struct {
    direction: Direction,
    /// Requested spec. Its sample rate and channel count are offered first.
    spec: audio.Spec,
    /// Canonical SPA positions, one per channel (empty leaves them to PipeWire).
    positions: []const u32 = &.{},
    /// Node name to connect to (see `Connection.devices`). Null lets the
    /// session manager choose the default node.
    target: ?[:0]const u8 = null,
    /// Client-facing stream name shown in PipeWire tools.
    name: [:0]const u8 = "zdl stream",
    /// Ring capacity in frames at the requested channel count. Also sets how
    /// much audio the ring holds before writers or capture drops start.
    buffer_frames: usize = 2048,
};

/// Ring capacity is this many buffer periods (`Options.buffer_frames`).
const ring_multiplier = 4;

/// Formats offered in EnumFormat, after the requested one.
const offered_formats = [_]audio.Format{ .float32_le, .signed32_le, .signed16_le, .signed16_be, .unsigned8, .signed8, .signed32_be, .float32_be };

/// Heap state shared with PipeWire callbacks. The address must be stable.
pub const State = struct {
    allocator: std.mem.Allocator,
    library: *binding.Library,
    thread: *binding.ThreadLoop,
    direction: Direction,
    requested: audio.Spec,
    negotiated: ?audio.Spec = null,
    failed: bool = false,
    object: ?*binding.Stream = null,
    /// Byte ring. Head is the oldest byte; `count` bytes are valid.
    ring: []u8,
    head: usize = 0,
    count: usize = 0,
    underruns: u64 = 0,
    overruns: u64 = 0,

    /// Recovers state from a callback's `data` argument.
    pub fn from_callback(data: ?*anyopaque) *State {
        return @ptrCast(@alignCast(data.?));
    }

    /// Stream `state_changed`: records errors and wakes waiters.
    pub fn on_state(self: *State, old: c_int, state: c_int) void {
        _ = old;
        if (state == binding.stream_state_error) self.failed = true;
        self.library.signal(self.thread);
    }

    /// Stream `param_changed`: decodes the Format param into a negotiated spec.
    pub fn on_param(self: *State, id: u32, param: ?*const anyopaque) void {
        if (id != pod.param_format) return;
        const start: [*]const u8 = @ptrCast(param orelse return);
        // struct spa_pod { uint32_t size; uint32_t type; } (spa/pod/pod.h).
        const size = std.mem.readInt(u32, start[0..4], @import("builtin").cpu.arch.endian());
        const bytes = start[0 .. 8 + @as(usize, size)];
        const decoded = pod.read_format(bytes) catch {
            self.failed = true;
            self.library.signal(self.thread);
            return;
        };
        self.negotiated = .{ .format = decoded.format, .sample_rate = decoded.sample_rate, .channels = decoded.channels };
        self.library.signal(self.thread);
    }

    /// Stream `process`: moves audio between the ring and one dequeued buffer.
    pub fn on_process(self: *State) void {
        const object = self.object orelse return;
        const buffer = self.library.stream_dequeue(object) orelse return;
        const spec = self.negotiated orelse self.requested;
        const frame_bytes = spec.frame_size() catch 0;
        const plane = binding.buffer_plane(buffer) orelse {
            self.library.stream_queue(object, buffer) catch {};
            return;
        };
        switch (self.direction) {
            .playback => self.fill_playback(buffer, plane, frame_bytes),
            .capture => self.drain_capture(plane, frame_bytes),
        }
        self.library.stream_queue(object, buffer) catch {};
        self.library.signal(self.thread);
    }

    fn fill_playback(self: *State, buffer: *binding.Buffer, plane: binding.DataPlane, frame_bytes: usize) void {
        if (frame_bytes == 0) return;
        const requested = binding.buffer_requested(buffer);
        const wanted_bytes = if (requested != 0)
            @min(plane.storage.len, @as(usize, @intCast(requested)) * frame_bytes)
        else
            plane.storage.len;
        const wanted = wanted_bytes - wanted_bytes % frame_bytes;
        const copied = self.ring_read(plane.storage[0..wanted]);
        if (copied < wanted) {
            const silence: u8 = if ((self.negotiated orelse self.requested).format == .unsigned8) 0x80 else 0;
            @memset(plane.storage[copied..wanted], silence);
            self.underruns += 1;
        }
        plane.chunk.offset = 0;
        plane.chunk.size = @intCast(wanted);
        plane.chunk.stride = @intCast(frame_bytes);
        buffer.size = wanted / frame_bytes;
    }

    fn drain_capture(self: *State, plane: binding.DataPlane, frame_bytes: usize) void {
        if (frame_bytes == 0) return;
        const offset: usize = @min(plane.chunk.offset, plane.storage.len);
        const available: usize = @min(plane.chunk.size, plane.storage.len - offset);
        const bytes = plane.storage[offset..][0..available];
        const whole = available - available % frame_bytes;
        const accepted = self.ring_write(bytes[0..whole]);
        if (accepted < whole) self.overruns += 1;
    }

    /// Appends up to `source.len` bytes; returns the number accepted.
    fn ring_write(self: *State, source: []const u8) usize {
        const free = self.ring.len - self.count;
        const amount = @min(free, source.len);
        var index: usize = 0;
        while (index < amount) {
            const at = (self.head + self.count + index) % self.ring.len;
            const run = @min(amount - index, self.ring.len - at);
            @memcpy(self.ring[at..][0..run], source[index..][0..run]);
            index += run;
        }
        self.count += amount;
        return amount;
    }

    /// Removes up to `destination.len` bytes from the head; returns the number read.
    fn ring_read(self: *State, destination: []u8) usize {
        const amount = @min(self.count, destination.len);
        var index: usize = 0;
        while (index < amount) {
            const run = @min(amount - index, self.ring.len - self.head);
            @memcpy(destination[index..][0..run], self.ring[self.head..][0..run]);
            self.head = (self.head + run) % self.ring.len;
            index += run;
        }
        self.count -= amount;
        return amount;
    }
};

/// A connected playback or capture stream. Create with `open`.
pub const Stream = struct {
    allocator: std.mem.Allocator,
    connection: *context.Connection,
    state: *State,

    /// Creates the stream, connects it and waits for its negotiated format.
    /// Connects to `options.target` when given. The connection stays borrowed.
    pub fn open(allocator: std.mem.Allocator, connection: *context.Connection, options: Options) Error!Stream {
        const requested = options.spec;
        try requested.validate();
        if (requested.channels > 255) return error.InvalidSpec;
        const library = connection.library_handle();
        const thread = connection.thread();

        const state = try allocator.create(State);
        errdefer allocator.destroy(state);
        const ring_frames = std.math.mul(usize, options.buffer_frames, ring_multiplier) catch return error.InvalidSpec;
        const ring_bytes = std.math.mul(usize, ring_frames, @as(usize, requested.channels) * 4) catch return error.InvalidSpec;
        const ring = try allocator.alloc(u8, @max(ring_bytes, 1));
        errdefer allocator.free(ring);
        state.* = .{
            .allocator = allocator,
            .library = library,
            .thread = thread,
            .direction = options.direction,
            .requested = requested,
            .ring = ring,
        };

        connection.lock();
        defer connection.unlock();
        const properties = try library.properties();
        try set_properties(library, properties, options, requested.sample_rate);
        const object = try library.stream_new(try library.loop_of(thread), options.name, properties, &binding.stream_events, state);
        state.object = object;
        errdefer {
            library.stream_disconnect(object);
            library.stream_destroy(object);
        }
        // new_simple already installs these callbacks. Adding a second listener
        // would process each buffer twice and duplicate state/format events.

        var format_buffer: [256]u64 align(8) = undefined;
        const bytes = std.mem.sliceAsBytes(&format_buffer);
        var formats: [offered_formats.len + 1]audio.Format = undefined;
        const param = try pod.build_enum_format(bytes, offered_list(&formats, requested.format), requested.sample_rate, requested.channels, options.positions);
        const direction: c_int = if (options.direction == .playback) binding.direction_output else binding.direction_input;
        const flags = binding.stream_flag_autoconnect | binding.stream_flag_map_buffers;
        try library.stream_connect(object, direction, binding.id_any, flags, @ptrCast(param.ptr));

        const deadline = try library.deadline(thread, 5 * std.time.ns_per_s);
        while (state.negotiated == null and !state.failed) {
            if (try library.expired(thread, deadline)) return error.NegotiationTimeout;
            _ = try library.wait_until(thread, deadline);
        }
        if (state.failed) return error.StreamFailed;
        return .{ .allocator = allocator, .connection = connection, .state = state };
    }

    /// Disconnects and frees the stream. Takes the connection lock itself.
    pub fn deinit(self: *Stream) void {
        const state = self.state;
        const library = state.library;
        self.connection.lock();
        if (state.object) |object| {
            library.stream_disconnect(object);
            library.stream_destroy(object);
            state.object = null;
        }
        self.connection.unlock();
        self.allocator.free(state.ring);
        self.allocator.destroy(state);
        self.* = undefined;
    }

    /// Negotiated format, channels and rate. Valid for the stream's lifetime.
    pub fn spec(self: *const Stream) audio.Spec {
        self.connection.lock();
        defer self.connection.unlock();
        return self.state.negotiated orelse self.state.requested;
    }

    /// Free bytes in the ring. Meaningful for playback; capture streams use
    /// `readable_bytes`.
    pub fn writable_bytes(self: *Stream) usize {
        self.connection.lock();
        defer self.connection.unlock();
        return self.state.ring.len - self.state.count;
    }

    /// Bytes ready to read (capture) or still queued (playback).
    pub fn readable_bytes(self: *Stream) usize {
        self.connection.lock();
        defer self.connection.unlock();
        return self.state.count;
    }

    /// Copies whole frames into the playback ring. Returns the accepted byte
    /// count (a multiple of the frame size); the rest is for a later call.
    pub fn write(self: *Stream, bytes: []const u8) Error!usize {
        if (self.state.direction != .playback) return error.InvalidDirection;
        self.connection.lock();
        defer self.connection.unlock();
        const frame_bytes = (self.state.negotiated orelse self.state.requested).frame_size() catch return error.InvalidSpec;
        const whole = bytes.len - bytes.len % frame_bytes;
        const accepted = self.state.ring_write(bytes[0..whole]);
        return accepted - accepted % frame_bytes;
    }

    /// Reads captured frames into `destination`. Returns the filled byte count.
    /// Returns WouldBlock when nothing is buffered yet.
    pub fn read(self: *Stream, destination: []u8) Error!usize {
        if (self.state.direction != .capture) return error.InvalidDirection;
        self.connection.lock();
        defer self.connection.unlock();
        if (self.state.failed) return error.StreamFailed;
        const frame_bytes = (self.state.negotiated orelse self.state.requested).frame_size() catch return error.InvalidSpec;
        const whole = destination.len - destination.len % frame_bytes;
        if (whole == 0) return 0;
        const got = self.state.ring_read(destination[0..whole]);
        if (got == 0) return error.WouldBlock;
        return got;
    }

    /// Waits up to `timeout_milliseconds` for data (capture) or space (playback).
    /// Null waits indefinitely. A finite wait uses one absolute monotonic
    /// deadline, preserved across signals. Returns true when ready.
    pub fn wait(self: *Stream, timeout_milliseconds: ?u31) Error!bool {
        const library = self.state.library;
        const thread = self.connection.thread();
        self.connection.lock();
        defer self.connection.unlock();
        const deadline = if (timeout_milliseconds) |limit|
            try library.deadline(thread, @as(i64, limit) * std.time.ns_per_ms)
        else
            null;
        while (true) {
            if (self.state.failed) return error.StreamFailed;
            const ready = switch (self.state.direction) {
                .playback => self.state.ring.len > self.state.count,
                .capture => self.state.count != 0,
            };
            if (ready) return true;
            if (deadline) |limit| {
                if (try library.expired(thread, limit)) return false;
                _ = try library.wait_until(thread, limit);
            } else {
                library.wait(thread);
            }
        }
    }

    /// Fails with NotDrained while playback audio is still queued.
    pub fn drain(self: *Stream) Error!void {
        if (self.state.direction != .playback) return error.InvalidDirection;
        self.connection.lock();
        defer self.connection.unlock();
        if (self.state.count != 0) return error.NotDrained;
    }

    /// Discards buffered audio without touching the PipeWire stream.
    pub fn flush(self: *Stream) void {
        self.connection.lock();
        defer self.connection.unlock();
        self.state.head = 0;
        self.state.count = 0;
    }

    /// Frames dropped at capture or padded with silence at playback so far.
    pub fn xruns(self: *Stream) struct { underruns: u64, overruns: u64 } {
        self.connection.lock();
        defer self.connection.unlock();
        return .{ .underruns = self.state.underruns, .overruns = self.state.overruns };
    }
};

fn offered_list(storage: *[offered_formats.len + 1]audio.Format, requested: audio.Format) []const audio.Format {
    storage[0] = requested;
    var count: usize = 1;
    for (offered_formats) |format| {
        if (format == requested) continue;
        storage[count] = format;
        count += 1;
    }
    return storage[0..count];
}

fn set_properties(library: *binding.Library, properties: *binding.Properties, options: Options, rate: u32) Error!void {
    var buffer: [32]u8 = undefined;
    try library.properties_set(properties, "media.type", "Audio");
    try library.properties_set(properties, "media.category", if (options.direction == .playback) "Playback" else "Capture");
    try library.properties_set(properties, "media.role", "Music");
    try library.properties_set(properties, "node.name", options.name);
    const latency = try std.fmt.bufPrint(&buffer, "{d}/{d}", .{ options.buffer_frames, rate });
    buffer[latency.len] = 0;
    try library.properties_set(properties, "node.latency", buffer[0..latency.len :0]);
    if (options.target) |target| try library.properties_set(properties, "target.object", target);
}

test "offered formats keep the requested one first" {
    var storage: [offered_formats.len + 1]audio.Format = undefined;
    const list = offered_list(&storage, .signed16_be);
    try std.testing.expectEqual(audio.Format.signed16_be, list[0]);
    try std.testing.expectEqual(offered_formats.len, list.len);
}
