//! Owned encoded-audio chunks, explicit stream boundaries and resampler history.
//! Altered native port of SDL_audioqueue.c. Allocation uses std directly; no
//! private pools, void-pointer iterators, release callbacks or implicit locking.
//! This queue supplies encoded input windows. Conversion, resampling and device
//! scheduling remain separate responsibilities rather than hidden queue work.
const std = @import("std");
const audio = @import("processing.zig");

/// IncompleteStream asks a producer for more data; EndOfStream means a flushed
/// boundary cannot supply the requested real frames. Neither consumes input.
pub const Error = audio.Error || std.mem.Allocator.Error || error{ Empty, IncompleteStream, EndOfStream, StreamNotFinished };

/// Borrowed stream metadata. Channel maps select input channels; null elements
/// represent silence. A null map is identity. Borrows expire at queue mutation.
pub const Stream = struct {
    spec: audio.Spec,
    channel_map: ?[]const ?u16,
    bytes: usize,
    flushed: bool,
    /// Number of complete interleaved frames in this stream.
    pub fn frames(self: Stream) usize {
        return self.bytes / (self.spec.format.bytes_per_sample() * self.spec.channels);
    }
};

/// Owns chunks, copied channel maps and history through one allocator. Do not
/// copy after initialization. All mutation requires caller synchronization.
/// Writes are transactional on allocation failure. No method accesses devices.
pub const Queue = struct {
    allocator: std.mem.Allocator,
    first: ?*Chunk = null,
    last: ?*Chunk = null,
    queued: usize = 0,
    history: []u8 = &.{},

    const Chunk = struct {
        next: ?*Chunk = null,
        spec: audio.Spec,
        map: ?[]?u16,
        data: []u8,
        cursor: usize = 0,
        flushed: bool = false,
    };

    /// Creates an empty queue without allocation.
    pub fn init(allocator: std.mem.Allocator) Queue {
        return .{ .allocator = allocator };
    }

    /// Releases every chunk, map and history allocation. Invalidates the owner.
    pub fn deinit(self: *Queue) void {
        self.clear();
        self.* = undefined;
    }

    /// Releases all streams and history, leaving an empty reusable queue.
    pub fn clear(self: *Queue) void {
        while (self.first) |chunk| {
            self.first = chunk.next;
            self.destroy(chunk);
        }
        self.last = null;
        self.queued = 0;
        self.allocator.free(self.history);
        self.history = &.{};
    }

    /// Copies complete frames and an optional map into the queue. Changing spec
    /// or effective map flushes the previous stream. A zero-byte write validates
    /// its shape but does not create or close a stream. Partial frames are errors.
    pub fn write(self: *Queue, spec: audio.Spec, map: ?[]const ?u16, bytes: []const u8) Error!void {
        try validate(spec, map, bytes);
        if (bytes.len == 0) return;
        const data = try self.allocator.dupe(u8, bytes);
        errdefer self.allocator.free(data);
        try self.append_owned(spec, map, data);
    }

    /// Transfers an entire allocation from this queue's allocator on success.
    /// The caller retains it on failure, including an empty allocation. On
    /// success the caller must neither free nor mutate it. Maps are still copied.
    /// The allocation must not already belong to this queue.
    pub fn append_owned(self: *Queue, spec: audio.Spec, map: ?[]const ?u16, data: []u8) Error!void {
        try validate(spec, map, data);
        const total = std.math.add(usize, self.queued, data.len) catch return error.Overflow;
        if (data.len == 0) {
            self.allocator.free(data);
            return;
        }
        const chunk = try self.allocator.create(Chunk);
        errdefer self.allocator.destroy(chunk);
        const copied_map = if (map) |values| try self.allocator.dupe(?u16, values) else null;
        chunk.* = .{ .spec = spec, .map = copied_map, .data = data };
        // Everything fallible finishes before changing the chain or boundary.
        if (self.last) |tail| {
            if (!same_stream(tail, chunk)) tail.flushed = true;
            tail.next = chunk;
        } else self.first = chunk;
        self.last = chunk;
        self.queued = total;
    }

    /// Closes the final stream. A subsequent write begins a new stream even if
    /// its spec/map matches. Flushed lookahead beyond available data is silence.
    pub fn flush(self: *Queue) void {
        if (self.last) |tail| tail.flushed = true;
    }

    /// Total encoded bytes across all streams. Different formats mean this is
    /// not a duration; inspect stream metadata to calculate frame/time totals.
    pub fn queued_bytes(self: *const Queue) usize {
        return self.queued;
    }

    /// Checks whether a byte range aliases owned input/history/map storage.
    /// Conversion layers use this before copying output or growing scratch.
    pub fn overlaps_storage(self: *const Queue, bytes: []const u8) bool {
        if (overlaps(bytes, self.history)) return true;
        var chunk = self.first;
        while (chunk) |item| : (chunk = item.next) {
            if (overlaps(bytes, item.data)) return true;
            if (item.map) |map| if (overlaps(bytes, std.mem.sliceAsBytes(map))) return true;
        }
        return false;
    }

    /// Metadata for the current stream, including a drained flushed boundary.
    pub fn head(self: *const Queue) ?Stream {
        var iterator = self.streams();
        return iterator.next();
    }

    /// Borrows an iterator over format/map/flush-delimited streams. Do not mutate
    /// the queue during iteration. Metadata accumulation cannot exceed the
    /// checked queue byte total.
    pub fn streams(self: *const Queue) Iterator {
        return .{ .chunk = self.first };
    }
    pub const Iterator = struct {
        chunk: ?*const Chunk,
        /// Returns the next stream, or null after the last stream.
        pub fn next(self: *Iterator) ?Stream {
            const first = self.chunk orelse return null;
            var result: Stream = .{ .spec = first.spec, .channel_map = first.map, .bytes = 0, .flushed = false };
            while (self.chunk) |current| {
                result.bytes += current.data.len - current.cursor;
                result.flushed = current.flushed;
                self.chunk = current.next;
                if (current.flushed) break;
            }
            return result;
        }
    };

    /// Sets preceding-frame history to format-correct silence for the current
    /// stream. Call at a discontinuity, not between ordinary processing blocks.
    /// Unsigned eight-bit silence is 128; all other implemented encodings use 0.
    pub fn reset_history(self: *Queue, frames: usize) Error!void {
        const current = self.first orelse return error.Empty;
        const length = try byte_count(current.spec, frames);
        if (self.history.len != length) {
            const replacement = try self.allocator.alloc(u8, length);
            self.allocator.free(self.history);
            self.history = replacement;
        }
        @memset(self.history, silence(current.spec.format));
    }

    /// Copies [past, present, future] into the output and consumes only present.
    /// Past comes from configured history; future never crosses a flushed
    /// boundary. Flushed missing future frames become silence; an incomplete
    /// stream returns IncompleteStream until its producer supplies more data.
    /// Shape/capacity/availability/alias checks precede writes or consumption.
    /// No allocation occurs. Output may not overlap owned chunks or history.
    pub fn read_window(self: *Queue, destination: []u8, past_frames: usize, present_frames: usize, future_frames: usize) Error![]u8 {
        const current = self.first orelse return error.Empty;
        const metadata = self.head().?;
        const past = try byte_count(current.spec, past_frames);
        const present = try byte_count(current.spec, present_frames);
        const future = try byte_count(current.spec, future_frames);
        const upcoming = std.math.add(usize, present, future) catch return error.Overflow;
        const required = std.math.add(usize, past, upcoming) catch return error.Overflow;
        if (past > self.history.len) return error.InsufficientPadding;
        if (destination.len < required) return error.BufferTooSmall;
        if (present > metadata.bytes) return if (metadata.flushed) error.EndOfStream else error.IncompleteStream;
        if (upcoming > metadata.bytes and !metadata.flushed) return error.IncompleteStream;
        const output = destination[0..required];
        if (overlaps(output, self.history)) return error.OverlappingBuffers;
        var chunk = self.first;
        while (chunk) |item| : (chunk = item.next) if (overlaps(output, item.data)) return error.OverlappingBuffers;
        @memcpy(output[0..past], self.history[self.history.len - past ..]);
        const available = @min(upcoming, metadata.bytes);
        self.peek(output[past..][0..available]);
        @memset(output[past + available ..], silence(current.spec.format));
        self.remember(output[past..][0..present]);
        self.consume(present);
        return output;
    }

    /// Advances past a completely consumed flushed stream and clears its
    /// history. An unfinished or nonempty stream returns StreamNotFinished.
    /// Explicit advancement prevents accidental interpolation across boundaries.
    pub fn advance(self: *Queue) Error!void {
        const metadata = self.head() orelse return error.Empty;
        if (!metadata.flushed or metadata.bytes != 0) return error.StreamNotFinished;
        self.discard_stream();
    }

    /// Drops the current stream, including unread frames, through its boundary.
    /// If the stream is incomplete this drops all its currently queued chunks.
    /// The next stream starts with no history; configure it explicitly as needed.
    pub fn discard_stream(self: *Queue) void {
        while (self.first) |chunk| {
            const boundary = chunk.flushed;
            self.queued -= chunk.data.len - chunk.cursor;
            self.first = chunk.next;
            self.destroy(chunk);
            if (boundary) break;
        }
        if (self.first == null) self.last = null;
        self.allocator.free(self.history);
        self.history = &.{};
    }

    fn destroy(self: *Queue, chunk: *Chunk) void {
        self.allocator.free(chunk.data);
        if (chunk.map) |map| self.allocator.free(map);
        self.allocator.destroy(chunk);
    }
    fn peek(self: *const Queue, destination: []u8) void {
        var copied: usize = 0;
        var chunk = self.first;
        while (chunk) |item| : (chunk = item.next) {
            const count = @min(destination.len - copied, item.data.len - item.cursor);
            @memcpy(destination[copied..][0..count], item.data[item.cursor..][0..count]);
            copied += count;
            if (copied == destination.len) break;
        }
    }
    fn remember(self: *Queue, bytes: []const u8) void {
        if (bytes.len >= self.history.len) @memcpy(self.history, bytes[bytes.len - self.history.len ..]) else {
            const retained = self.history.len - bytes.len;
            std.mem.copyForwards(u8, self.history[0..retained], self.history[bytes.len..]);
            @memcpy(self.history[retained..], bytes);
        }
    }
    fn consume(self: *Queue, bytes: usize) void {
        var remaining = bytes;
        self.queued -= bytes;
        while (self.first) |chunk| {
            const count = @min(remaining, chunk.data.len - chunk.cursor);
            chunk.cursor += count;
            remaining -= count;
            // Keep a drained boundary (or incomplete tail) available for head()
            // and advance(). Ordinary exhausted chunks can be reclaimed now.
            if (chunk.cursor == chunk.data.len and !chunk.flushed and chunk.next != null) {
                self.first = chunk.next;
                self.destroy(chunk);
            } else break;
            if (remaining == 0) break;
        }
    }
};

fn validate(spec: audio.Spec, map: ?[]const ?u16, bytes: []const u8) Error!void {
    _ = try spec.frame_count(bytes);
    if (map) |values| {
        if (values.len != spec.channels) return error.InvalidChannelMap;
        for (values) |index| if (index) |channel| {
            if (channel >= spec.channels) return error.InvalidChannelMap;
        };
    }
}
fn same_stream(a: *const Queue.Chunk, b: *const Queue.Chunk) bool {
    if (!std.meta.eql(a.spec, b.spec)) return false;
    for (0..a.spec.channels) |channel| {
        const left = if (a.map) |map| map[channel] else @as(?u16, @intCast(channel));
        const right = if (b.map) |map| map[channel] else @as(?u16, @intCast(channel));
        if (left != right) return false;
    }
    return true;
}
fn byte_count(spec: audio.Spec, frames: usize) Error!usize {
    return std.math.mul(usize, try spec.frame_size(), frames) catch error.Overflow;
}
fn silence(format: audio.Format) u8 {
    return if (format == .unsigned8) 128 else 0;
}
fn overlaps(a: []const u8, b: []const u8) bool {
    if (a.len == 0 or b.len == 0) return false;
    const first = @intFromPtr(a.ptr);
    const second = @intFromPtr(b.ptr);
    return if (first <= second) second - first < a.len else first - second < b.len;
}
