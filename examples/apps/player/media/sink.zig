//! Audio output: decoded PCM into zdl's stream conversion, then ALSA playback.
//!
//! Decoders hand over interleaved PCM in one of zdl's device-friendly formats
//! (unsigned 8, signed 16/32, float 32). `Interleave` produces that from the
//! planar and 64-bit/double layouts FFmpeg may decode to. The sink then pushes
//! the bytes into a `zdl.audio.Stream`, which converts format, channel layout
//! and sample rate for the device, and the `Output` mixes that stream into the
//! ALSA period it writes. Nothing here runs on a hidden thread: the player pumps
//! the sink from its update loop, which is what makes the device a clock.
const std = @import("std");
const zdl = @import("zdl");
const ffmpeg = @import("ffmpeg.zig");

const audio = zdl.audio;

/// Stereo ALSA playback. The examples and the player share this device type.
pub const Output = audio.device.Output(.stereo);

const layout_names = @typeInfo(audio.Layout).@"enum".field_names;

/// One zdl stream per supported source layout, all converting to stereo. Only
/// the active member exists; the tag is the layout chosen from the channel count.
const Route = blk: {
    const types: [layout_names.len]type = build_types: {
        var list: [layout_names.len]type = undefined;
        for (layout_names, 0..) |name, index| list[index] = audio.Stream(@field(audio.Layout, name), .stereo);
        break :build_types list;
    };
    const attributes: [layout_names.len]std.lang.Type.Union.FieldAttributes = @splat(.{});
    break :blk @Union(.auto, audio.Layout, layout_names, &types, &attributes);
};

pub const Error = audio.device.Error || audio.Error || error{ Unavailable, UnsupportedChannels, OutOfMemory };

/// Decoded PCM sample format this sink accepts directly.
pub const Format = audio.Format;

/// Owns the ALSA library handle, the output and the active stream route.
/// Heap-allocated so the output's borrowed library and the stream binding keep
/// stable addresses.
pub const Sink = struct {
    allocator: std.mem.Allocator,
    library: audio.alsa.Library,
    output: Output,
    route: Route,
    source_channels: u16,
    bound: bool = false,

    /// Opens the default ALSA playback device for `channels` source channels.
    /// `error.Unavailable` means ALSA is not installed or cannot be reached.
    pub fn open(allocator: std.mem.Allocator, channels: u16) Error!*Sink {
        const layout = layout_for_channels(channels) orelse return error.UnsupportedChannels;
        const self = try allocator.create(Sink);
        errdefer allocator.destroy(self);
        self.library = audio.alsa.Library.open() catch return error.Unavailable;
        errdefer self.library.deinit();
        self.output = try Output.open(allocator, &self.library, .{ .format = .float32_le, .sample_rate = 48_000 });
        errdefer self.output.deinit();
        const spec = self.output.spec();
        self.route = try make_route(allocator, layout, spec.format, spec.sample_rate);
        errdefer self.route_deinit();
        self.allocator = allocator;
        self.source_channels = channels;
        try self.output.bind(route_source(&self.route));
        self.bound = true;
        return self;
    }

    /// Unbinds the stream, closes the device and frees everything.
    pub fn close(self: *Sink) void {
        if (self.bound) self.output.unbind(route_source(&self.route)) catch {};
        self.route_deinit();
        self.output.deinit();
        self.library.deinit();
        const allocator = self.allocator;
        allocator.destroy(self);
    }

    /// Device sample rate; the audio clock counts frames at this rate.
    pub fn rate(self: *const Sink) u32 {
        return self.output.spec().sample_rate;
    }

    /// Frames the device holds in its buffer, as a clock latency estimate.
    pub fn buffer_frames(self: *const Sink) usize {
        return self.output.buffer_frames();
    }

    pub fn period_frames(self: *const Sink) usize {
        return self.output.period_frames();
    }

    /// Queues interleaved PCM with the source format and rate; converted on pump.
    pub fn write(self: *Sink, format: Format, sample_rate: u32, bytes: []const u8) Error!void {
        switch (self.route) {
            inline else => |*stream| try stream.write(.{ .format = format, .sample_rate = sample_rate }, bytes),
        }
    }

    /// Input bytes waiting to be converted; the player keeps this bounded.
    pub fn queued_bytes(self: *Sink) usize {
        switch (self.route) {
            inline else => |*stream| return stream.queued_bytes(),
        }
    }

    /// Marks the end of input so the remaining audio plays out.
    pub fn finish_input(self: *Sink) void {
        switch (self.route) {
            inline else => |*stream| stream.flush(),
        }
    }

    /// True once the stream has flushed and produced all of its output.
    pub fn drained(self: *Sink) bool {
        switch (self.route) {
            inline else => |*stream| return (stream.status() catch return true) == .drained,
        }
    }

    /// Drops queued input and conversion state, and empties the device buffer.
    pub fn clear(self: *Sink) Error!void {
        switch (self.route) {
            inline else => |*stream| stream.clear(),
        }
        try self.output.drop();
    }

    /// Writes at most one period to the device. Returns frames accepted.
    pub fn pump(self: *Sink) Error!usize {
        return self.output.pump();
    }

    /// Returns whether the device retained its samples across the pause.
    pub fn set_paused(self: *Sink, paused: bool) bool {
        self.output.set_paused(paused);
        self.output.device.set_paused(paused) catch {
            self.output.drop() catch {};
            return false;
        };
        return true;
    }

    pub fn set_gain(self: *Sink, gain: f32) Error!void {
        try self.output.set_gain(gain);
    }

    fn route_deinit(self: *Sink) void {
        switch (self.route) {
            inline else => |*stream| stream.deinit(),
        }
    }
};

fn layout_for_channels(channels: u16) ?audio.Layout {
    return switch (channels) {
        1 => .mono,
        2 => .stereo,
        3 => .stereo_lfe,
        4 => .quad,
        5 => .quad_lfe,
        6 => .surround_5_1,
        7 => .surround_6_1,
        8 => .surround_7_1,
        else => null,
    };
}

fn make_route(allocator: std.mem.Allocator, layout: audio.Layout, format: audio.Format, sample_rate: u32) Error!Route {
    switch (layout) {
        inline else => |tag| {
            const Stream = audio.Stream(tag, .stereo);
            const stream = try Stream.init(allocator, .{ .format = format, .sample_rate = sample_rate });
            return @unionInit(Route, @tagName(tag), stream);
        },
    }
}

/// Type-erased pointer to the active route, as the output binds it.
fn route_source(route: *Route) Output.Source {
    switch (route.*) {
        inline else => |*stream, tag| return @unionInit(Output.Source, @tagName(tag), stream),
    }
}

/// Converts one decoded frame's samples to interleaved bytes in a device format.
/// The byte count is `nb_samples * channels * bytes_per_sample(target)`.
pub fn interleave(frame: *const ffmpeg.Frame, channels: usize, out: []u8) !audio.Format {
    const sample_format: ffmpeg.SampleFormat = @fromBackingInt(@intCast(frame.format));
    const planar = switch (sample_format) {
        .u8p, .s16p, .s32p, .fltp, .dblp, .s64p => true,
        else => false,
    };
    const frames: usize = @intCast(frame.nb_samples);
    const planes = frame.extended_data orelse return error.InvalidFrame;
    switch (sample_format) {
        .u8, .u8p => return copy_as(u8, u8, planes, planar, frames, channels, out),
        .s16, .s16p => return copy_as(i16, i16, planes, planar, frames, channels, out),
        .s32, .s32p => return copy_as(i32, i32, planes, planar, frames, channels, out),
        .flt, .fltp => return copy_as(f32, f32, planes, planar, frames, channels, out),
        .dbl, .dblp => return copy_as(f64, f32, planes, planar, frames, channels, out),
        .s64, .s64p => return copy_as(i64, f32, planes, planar, frames, channels, out),
        else => return error.UnsupportedFormat,
    }
}

/// Bytes per interleaved frame in the format `interleave` produces.
pub fn target_format(frame: *const ffmpeg.Frame) !audio.Format {
    const sample_format: ffmpeg.SampleFormat = @fromBackingInt(@intCast(frame.format));
    return switch (sample_format) {
        .u8, .u8p => .unsigned8,
        .s16, .s16p => .signed16_le,
        .s32, .s32p => .signed32_le,
        .flt, .fltp, .dbl, .dblp, .s64, .s64p => .float32_le,
        else => error.UnsupportedFormat,
    };
}

/// Byte count of `frames` interleaved frames of `channels` samples in `format`.
pub fn byte_count(format: audio.Format, frames: usize, channels: usize) usize {
    return frames * channels * format.bytes_per_sample();
}

fn copy_as(comptime From: type, comptime To: type, planes: [*][*]u8, planar: bool, frames: usize, channels: usize, out: []u8) !audio.Format {
    const size = @sizeOf(To);
    if (out.len < frames * channels * size) return error.BufferTooSmall;
    const destination = out[0 .. frames * channels * size];
    for (0..channels) |channel| {
        const plane: [*]const From = @ptrCast(@alignCast(planes[if (planar) channel else 0]));
        for (0..frames) |index| {
            const source_index = if (planar) index else index * channels + channel;
            const value = convert(From, To, plane[source_index]);
            const at = (index * channels + channel) * size;
            write_value(To, destination[at..][0..size], value);
        }
    }
    return format_of(To);
}

fn convert(comptime From: type, comptime To: type, value: From) To {
    if (From == To) return value;
    return switch (@typeInfo(From)) {
        .float => @floatCast(value),
        .int => @as(To, @floatFromInt(value)) / @as(To, @floatFromInt(std.math.maxInt(From) + 1)),
        else => @compileError("unsupported sample conversion"),
    };
}

fn write_value(comptime T: type, bytes: []u8, value: T) void {
    switch (T) {
        u8 => bytes[0] = value,
        f32 => std.mem.writeInt(u32, bytes[0..4], @bitCast(value), .little),
        else => std.mem.writeInt(T, bytes[0..@sizeOf(T)], value, .little),
    }
}

fn format_of(comptime T: type) audio.Format {
    return switch (T) {
        u8 => .unsigned8,
        i16 => .signed16_le,
        i32 => .signed32_le,
        f32 => .float32_le,
        else => @compileError("no device format for this sample type"),
    };
}
