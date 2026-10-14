//! Pull-driven audio conversion with explicit ownership and stream boundaries.
//! Altered port of SDL_audiocvt.c's streaming pipeline. The encoded Queue keeps
//! input ownership/history; Resampler carries phase between processing blocks.
//! There are no hidden threads, device bindings, callback locks or SDL handles.
const std = @import("std");
const audio = @import("processing.zig");
const queue_module = @import("queue.zig");

pub const Error = queue_module.Error || error{InvalidBlockSize};

/// Creates a streaming converter for known speaker layouts. Only those layout
/// transforms instantiate, preserving lazy compilation. Incoming sample format,
/// rate and channel routing may change at queued boundaries. To change speaker
/// layouts or destination format/rate, create another stream explicitly.
pub fn Stream(comptime source_layout: audio.Layout, comptime destination_layout: audio.Layout) type {
    const source_channels = source_layout.channels();
    const destination_channels = destination_layout.channels();
    const downmix_first = destination_channels < source_channels;
    const resample_channels = @min(source_channels, destination_channels);
    const padding = audio.Resampler.PADDING_FRAMES;
    return struct {
        const Self = @This();

        /// Incoming interleaved encoding and rate. Map entries select standard
        /// source-layout channels; null entries synthesize silence.
        pub const Source = struct {
            format: audio.Format,
            sample_rate: u32,
            channel_map: ?[source_channels]?u3 = null,
        };
        /// Fixed destination description and bounded source work per pull.
        /// Gain is finite and nonnegative; integer outputs saturate as usual.
        pub const Options = struct {
            format: audio.Format,
            sample_rate: u32,
            max_block_frames: u31 = 1024,
            gain: f32 = 1,
            channel_map: ?[destination_channels]?u3 = null,
        };
        /// Empty reads can mean producer input is needed or all flushed input
        /// has drained. An empty newly created stream initially needs input.
        pub const Status = enum { ready, needs_input, drained };

        allocator: std.mem.Allocator,
        queue: audio.Queue,
        options: Options,
        resampler: audio.Resampler,
        active: bool = false,
        flushed: bool = false,
        pending_cursor: usize = 0,
        pending_length: usize = 0,
        encoded: std.ArrayList(u8) = .empty,
        decoded: std.ArrayList(f32) = .empty,
        prepared: std.ArrayList(f32) = .empty,
        resampled: std.ArrayList(f32) = .empty,
        converted: std.ArrayList(f32) = .empty,
        pending: std.ArrayList(u8) = .empty,

        /// Initializes without heap allocation. Filter coefficients belong to
        /// this object. Do not copy it after writing or reserving; synchronize
        /// access in the owning application. No audio device is opened.
        pub fn init(allocator: std.mem.Allocator, options: Options) Error!Self {
            if (options.sample_rate == 0) return error.InvalidSampleRate;
            if (options.max_block_frames == 0) return error.InvalidBlockSize;
            try validate_gain(options.gain);
            try validate_map(destination_channels, options.channel_map);
            return .{ .allocator = allocator, .queue = audio.Queue.init(allocator), .options = options, .resampler = try audio.Resampler.init(options.sample_rate, options.sample_rate, resample_channels) };
        }

        /// Releases input, scratch and pending-output allocations.
        pub fn deinit(self: *Self) void {
            self.queue.deinit();
            self.encoded.deinit(self.allocator);
            self.decoded.deinit(self.allocator);
            self.prepared.deinit(self.allocator);
            self.resampled.deinit(self.allocator);
            self.converted.deinit(self.allocator);
            self.pending.deinit(self.allocator);
            self.* = undefined;
        }

        /// Drops queued and converted audio, resetting phase/history. Scratch
        /// capacities are retained for reuse; no stale pending output survives.
        pub fn clear(self: *Self) void {
            self.queue.clear();
            self.resampler.reset();
            self.active = false;
            self.flushed = false;
            self.pending_cursor = 0;
            self.pending_length = 0;
        }

        /// Destination frame description, independent of currently queued input.
        pub fn destination_spec(self: *const Self) audio.Spec {
            return .{ .format = self.options.format, .sample_rate = self.options.sample_rate, .channels = destination_channels };
        }

        /// Copies complete input frames. Rate/format/effective-map changes flush
        /// the previous input stream automatically. Failure appends nothing.
        pub fn write(self: *Self, source: Source, bytes: []const u8) Error!void {
            const map = try source_map(source);
            try self.queue.write(source_spec(source), if (map) |*values| values else null, bytes);
            if (bytes.len != 0) self.flushed = false;
        }

        /// Transfers an entire allocation from this object's allocator on
        /// success; the caller retains ownership on failure. Input must not
        /// already belong to this stream. Channel maps are copied separately.
        pub fn append_owned(self: *Self, source: Source, bytes: []u8) Error!void {
            const map = try source_map(source);
            const nonempty = bytes.len != 0;
            try self.queue.append_owned(source_spec(source), if (map) |*values| values else null, bytes);
            if (nonempty) self.flushed = false;
        }

        /// Supplies silence lookahead at the current end. This drains real
        /// frames, not a separate ringing filter tail. Writes after flush start
        /// a new stream; no filter history crosses that boundary.
        pub fn flush(self: *Self) void {
            self.queue.flush();
            self.flushed = true;
        }

        /// Changes gain for subsequently processed blocks. Already converted
        /// pending output retains its prior gain; clear explicitly to drop it.
        pub fn set_gain(self: *Self, gain: f32) Error!void {
            try validate_gain(gain);
            self.options.gain = gain;
        }

        /// Changes output routing for subsequently processed blocks, preserving
        /// already converted pending output. Null means standard layout order.
        pub fn set_output_map(self: *Self, map: ?[destination_channels]?u3) Error!void {
            try validate_map(destination_channels, map);
            self.options.channel_map = map;
        }

        /// Encoded input bytes still owned by the queue. Pending converted output
        /// is counted separately by available_frames, not by this byte total.
        pub fn queued_bytes(self: *const Self) usize {
            return self.queue.queued_bytes();
        }

        /// Predicts output frames available without additional producer data.
        /// Unflushed resampling withholds real lookahead; flushed boundaries
        /// reset phase. Arithmetic reports overflow instead of clamping counts.
        pub fn available_frames(self: *const Self) Error!usize {
            var total = (self.pending_length - self.pending_cursor) / try self.destination_spec().frame_size();
            var phase: u64 = if (self.active) self.resampler.phase else 0;
            var iterator = self.queue.streams();
            while (iterator.next()) |stream| {
                const step = rate_step(stream.spec.sample_rate, self.options.sample_rate);
                const direct = step == (@as(u64, 1) << 32) and phase == 0;
                const real = stream.frames();
                const admitted = if (direct or stream.flushed) real else real - @min(real, padding);
                const count = try output_count(admitted, step, phase);
                total = std.math.add(usize, total, count) catch return error.Overflow;
                // Streams only continue across a flushed boundary. The final
                // incomplete stream ends iteration; carry cannot cross flush.
                phase = 0;
            }
            return total;
        }

        /// Reports whether a pull can return output, awaits more input, or has
        /// completely drained an explicitly flushed end.
        pub fn status(self: *const Self) Error!Status {
            if (try self.available_frames() != 0) return .ready;
            return if (self.flushed) .drained else .needs_input;
        }

        /// Returns one output prefix containing complete destination frames.
        /// It may be shorter than the buffer. Empty means check status / feed
        /// more input; this method never blocks. Partial frame capacity is an
        /// error. Allocations finish before consuming the next processing block.
        ///
        /// Scratch grows on demand and is retained. This is not a promise of
        /// allocation-free realtime processing. Reserve known specs beforehand
        /// or drive conversion outside a device callback. Output cannot alias
        /// this object's owned scratch/input allocations.
        pub fn read_some(self: *Self, destination: []u8) Error![]u8 {
            const frame_size = try self.destination_spec().frame_size();
            if (destination.len % frame_size != 0) return error.InvalidLength;
            if (destination.len == 0) return destination[0..0];
            try self.check_destination(destination);
            while (self.pending_cursor == self.pending_length) {
                if (!try self.pump(destination.len / frame_size)) return destination[0..0];
            }
            const count = @min(destination.len, self.pending_length - self.pending_cursor);
            @memcpy(destination[0..count], self.pending.items[self.pending_cursor..][0..count]);
            self.pending_cursor += count;
            return destination[0..count];
        }

        /// Preallocates scratch for a known source rate/format and block size.
        /// Does not append/consume audio or reset active history. Higher ratios
        /// or larger future blocks may still require growth. Useful before a
        /// processing loop, with an explicit allocator and known memory budget.
        pub fn reserve(self: *Self, source: Source, input_frames: usize) Error!void {
            _ = try source_map(source);
            const spec = source_spec(source);
            try spec.validate();
            const direct = source.sample_rate == self.options.sample_rate;
            const frames = try output_count(input_frames, rate_step(source.sample_rate, self.options.sample_rate), 0);
            try self.prepare_work(spec, input_frames, frames, direct, false);
        }

        fn pump(self: *Self, wanted: usize) Error!bool {
            while (self.queue.head()) |head| {
                if (head.frames() == 0 and head.flushed) {
                    try self.queue.advance();
                    self.active = false;
                    self.resampler.reset();
                    continue;
                }
                if (!self.active) {
                    try self.resampler.set_rates(head.spec.sample_rate, self.options.sample_rate);
                    self.resampler.reset();
                    if (head.spec.sample_rate != self.options.sample_rate) try self.queue.reset_history(padding);
                    self.active = true;
                }
                const direct = self.resampler.step == (@as(u64, 1) << 32) and self.resampler.phase == 0;
                const real = head.frames();
                const usable = if (direct or head.flushed) real else real - @min(real, padding);
                if (usable == 0) return false;
                const desired = if (direct) wanted else try self.resampler.input_frames_for(wanted);
                const input_frames = @min(usable, self.options.max_block_frames, @max(desired, 1));
                const output_frames = if (direct) input_frames else try self.resampler.output_frames_for(input_frames);
                try self.prepare_work(head.spec, input_frames, output_frames, direct, true);
                // Capture routing before read_window can reclaim the first
                // chunk that owns the borrowed metadata map.
                var input_map: ?[source_channels]?u3 = null;
                if (head.channel_map) |map| {
                    var copied: [source_channels]?u3 = undefined;
                    for (map, &copied) |entry, *value| value.* = if (entry) |index| @intCast(index) else null;
                    input_map = copied;
                }
                const encoded = try self.queue.read_window(self.encoded.items, if (direct) 0 else padding, input_frames, if (direct) 0 else padding);
                if (direct) {
                    _ = try audio.convert_frames_into(source_layout, destination_layout, encoded, self.pending.items, .{ .source_format = head.spec.format, .destination_format = self.options.format, .gain = self.options.gain, .input_map = input_map, .output_map = self.options.channel_map });
                } else {
                    const decoded = try audio.decode_into(head.spec.format, encoded, self.decoded.items);
                    route(source_channels, decoded, input_map, 1);
                    // SDL downmixes before resampling and upmixes afterwards:
                    // the filter only processes the smaller channel group.
                    const prepared = if (downmix_first) try audio.convert_channels(source_layout, destination_layout, decoded, self.prepared.items) else decoded;
                    const resampled = try self.resampler.process(.{ .samples = prepared, .frames = input_frames }, self.resampled.items);
                    const converted = if (downmix_first) resampled else try audio.convert_channels(source_layout, destination_layout, resampled, self.converted.items);
                    route(destination_channels, converted, self.options.channel_map, self.options.gain);
                    _ = try audio.encode_into(self.options.format, converted, self.pending.items);
                }
                self.pending_cursor = 0;
                self.pending_length = try multiply(output_frames, try self.destination_spec().frame_size());
                return true;
            }
            return false;
        }

        fn prepare_work(self: *Self, spec: audio.Spec, input: usize, output: usize, direct: bool, resize: bool) Error!void {
            const padded = std.math.add(usize, input, if (direct) 0 else padding * 2) catch return error.Overflow;
            try prepare(u8, &self.encoded, self.allocator, try multiply(padded, try spec.frame_size()), resize);
            try prepare(u8, &self.pending, self.allocator, try multiply(output, try self.destination_spec().frame_size()), resize);
            if (!direct) {
                try prepare(f32, &self.decoded, self.allocator, try multiply(padded, source_channels), resize);
                if (downmix_first) try prepare(f32, &self.prepared, self.allocator, try multiply(padded, destination_channels), resize);
                try prepare(f32, &self.resampled, self.allocator, try multiply(output, resample_channels), resize);
                if (!downmix_first) try prepare(f32, &self.converted, self.allocator, try multiply(output, destination_channels), resize);
            }
        }

        fn check_destination(self: *const Self, destination: []u8) Error!void {
            // Queue checks its own chunks in read_window, but this output buffer
            // is copied afterwards. Keep the same alias contract at this layer.
            if (self.queue.overlaps_storage(destination)) return error.OverlappingBuffers;
            if (overlaps(destination, self.encoded.allocatedSlice()) or overlaps(destination, self.pending.allocatedSlice()) or overlaps(destination, std.mem.sliceAsBytes(self.decoded.allocatedSlice())) or overlaps(destination, std.mem.sliceAsBytes(self.prepared.allocatedSlice())) or overlaps(destination, std.mem.sliceAsBytes(self.resampled.allocatedSlice())) or overlaps(destination, std.mem.sliceAsBytes(self.converted.allocatedSlice()))) return error.OverlappingBuffers;
        }

        fn source_spec(source: Source) audio.Spec {
            return .{ .format = source.format, .sample_rate = source.sample_rate, .channels = source_channels };
        }
        fn source_map(source: Source) Error!?[source_channels]?u16 {
            try validate_map(source_channels, source.channel_map);
            if (source.channel_map) |map| {
                var result: [source_channels]?u16 = undefined;
                for (map, &result) |entry, *value| value.* = if (entry) |index| index else null;
                return result;
            }
            return null;
        }
    };
}

fn prepare(comptime T: type, list: *std.ArrayList(T), allocator: std.mem.Allocator, length: usize, resize: bool) Error!void {
    try list.ensureTotalCapacity(allocator, length);
    if (resize) list.items.len = length;
}

fn route(comptime channels: usize, samples: []f32, map: ?[channels]?u3, gain: f32) void {
    if (map == null and gain == 1) return;
    var offset: usize = 0;
    while (offset < samples.len) : (offset += channels) {
        const frame: [channels]f32 = samples[offset..][0..channels].*;
        for (0..channels) |channel| {
            const selection: ?u3 = if (map) |values| values[channel] else @intCast(channel);
            samples[offset + channel] = if (selection) |index| frame[index] * gain else 0;
        }
    }
}
fn validate_gain(gain: f32) Error!void {
    if (!std.math.isFinite(gain) or gain < 0) return error.InvalidGain;
}
fn validate_map(comptime channels: usize, map: ?[channels]?u3) Error!void {
    if (map) |values| for (values) |entry| {
        if (entry) |index| if (index >= channels) return error.InvalidChannelMap;
    };
}
fn multiply(a: usize, b: usize) Error!usize {
    return std.math.mul(usize, a, b) catch error.Overflow;
}
fn rate_step(source: u32, destination: u32) u64 {
    return ((@as(u64, source) << 32) - 1) / destination + 1;
}
fn output_count(input: usize, step: u64, phase: u64) Error!usize {
    const end = @as(u128, input) << 32;
    if (end <= phase) return 0;
    return std.math.cast(usize, (end - phase - 1) / step + 1) orelse error.Overflow;
}
fn overlaps(a: []const u8, b: []const u8) bool {
    if (a.len == 0 or b.len == 0) return false;
    const first = @intFromPtr(a.ptr);
    const second = @intFromPtr(b.ptr);
    return if (first <= second) second - first < a.len else first - second < b.len;
}
