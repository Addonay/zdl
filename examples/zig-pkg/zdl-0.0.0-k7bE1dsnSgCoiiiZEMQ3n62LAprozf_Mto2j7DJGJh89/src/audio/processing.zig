//! Audio sample/channel representations, conversion, mixing and resampling.
//! This is allocation-free scalar processing except for the explicit convert
//! helper. Device backends are separate and never open during module import.
// Ported from audio/SDL_audiotypecvt.c, SDL_mixer.c and SDL_audioresample.c.
// SIMD dispatch stays out of the public API.
const std = @import("std");
const Endian = std.lang.Endian;
const builtin = @import("builtin");

/// Borrowed WAVE parsing and explicit owned decoding of supported codecs.
pub const wave = @import("wave.zig");
pub const Wave = @import("wave.zig").Wave;

/// Linux ALSA loading and explicit playback/capture devices.
pub const alsa = @import("alsa/device.zig");
/// ALSA endpoint hotplug and default-change detection by re-enumeration.
pub const alsa_hotplug = @import("alsa/hotplug.zig");

/// Encoded audio ownership, stream boundaries and explicit resampler history.
pub const Queue = @import("queue.zig").Queue;

/// Stateful streaming conversion between two concrete speaker layouts.
pub const Stream = @import("stream.zig").Stream;

/// Logical-device layer shared by every backend: bound streams, gain, pause,
/// mixing and capture distribution (`Mixer`, `Fanout`), plus the common
/// `Unavailable` error.
pub const logical = @import("logical.zig");

/// Logical playback output over the ALSA backend with bound streams and an
/// explicit caller-driven pump.
pub const device = @import("device.zig");

/// PulseAudio backend over runtime-loaded libpulse: server/device
/// enumeration, hotplug events, playback/capture streams and an Output with
/// the same shape as `device.Output`. Requires libc.
pub const pulse = struct {
    pub const context = @import("pulse/context.zig");
    pub const playback = @import("pulse/playback.zig");
    pub const capture = @import("pulse/capture.zig");
};

/// PipeWire backend over runtime-loaded libpipewire-0.3: node enumeration and
/// defaults, hotplug events, SPA pod formats, streams and Output/Input
/// mirroring `device`. `context.Library` is opened by the caller. Requires libc.
pub const pipewire = struct {
    pub const context = @import("pipewire/context.zig");
    pub const stream = @import("pipewire/stream.zig");
    pub const device = @import("pipewire/device.zig");
    pub const pod = @import("pipewire/pod.zig");
};

/// JACK backend over runtime-loaded libjack: physical-port devices, realtime
/// callbacks feeding a lock-free ring, Output/Input mirroring `device`.
/// `device.Library` is opened by the caller. Requires libc.
pub const jack = struct {
    pub const ring = @import("jack/ring.zig");
    pub const device = @import("jack/device.zig");
};

/// Byte-encoded sample formats. The enum expresses actual formats rather than
/// SDL's packed C bit masks; multibyte order is always explicit at a boundary.
pub const Format = enum {
    unsigned8,
    signed8,
    signed16_le,
    signed16_be,
    signed24_le,
    signed24_be,
    /// Signed 24-bit PCM sign-extended in a 32-bit word.
    signed24_32_le,
    signed24_32_be,
    signed32_le,
    signed32_be,
    float32_le,
    float32_be,
    /// G.711 logarithmic PCM encodings.
    alaw,
    mulaw,

    /// Storage needed for one sample, independent of the number of channels.
    pub fn bytes_per_sample(self: Format) usize {
        return switch (self) {
            .unsigned8, .signed8, .alaw, .mulaw => 1,
            .signed16_le, .signed16_be => 2,
            .signed24_le, .signed24_be => 3,
            else => 4,
        };
    }

    /// Endianness of multibyte formats; single-byte formats are order-agnostic.
    pub fn byte_order(self: Format) Endian {
        return switch (self) {
            .signed16_be, .signed24_be, .signed24_32_be, .signed32_be, .float32_be => .big,
            else => .little,
        };
    }

    /// Format-correct byte for silence, including G.711's encoded zero.
    pub fn silence_byte(self: Format) u8 {
        return switch (self) {
            .unsigned8 => 0x80,
            .alaw => 0xd5,
            .mulaw => 0xff,
            else => 0,
        };
    }

    fn encoding(self: Format) enum { unsigned8, signed8, signed16, signed24, signed24_32, signed32, float32, alaw, mulaw } {
        return switch (self) {
            .unsigned8 => .unsigned8,
            .signed8 => .signed8,
            .signed16_le, .signed16_be => .signed16,
            .signed24_le, .signed24_be => .signed24,
            .signed24_32_le, .signed24_32_be => .signed24_32,
            .signed32_le, .signed32_be => .signed32,
            .float32_le, .float32_be => .float32,
            .alaw => .alaw,
            .mulaw => .mulaw,
        };
    }
};

/// Caller-owned capacity for the SDL-style closest-format preference order.
pub const FormatPreferences = struct {
    values: [14]Format = undefined,
    len: usize = 0,

    pub fn slice(self: *const FormatPreferences) []const Format {
        return self.values[0..self.len];
    }

    fn append(self: *FormatPreferences, format: Format) void {
        for (self.values[0..self.len]) |old| if (old == format) return;
        self.values[self.len] = format;
        self.len += 1;
    }
};

/// Returns the preferred representation followed by the closest device-facing
/// fallbacks. The eight legacy formats retain SDL's exact ordering; 24-bit and
/// G.711 representations follow after those choices.
pub fn closest_formats(preferred: Format) FormatPreferences {
    const little = builtin.target.cpu.arch.endian() == .little;
    const native16: Format = if (little) .signed16_le else .signed16_be;
    const swapped16: Format = if (little) .signed16_be else .signed16_le;
    const native32: Format = if (little) .signed32_le else .signed32_be;
    const swapped32: Format = if (little) .signed32_be else .signed32_le;
    const native_float: Format = if (little) .float32_le else .float32_be;
    const swapped_float: Format = if (little) .float32_be else .float32_le;
    var result: FormatPreferences = .{};
    result.append(preferred);
    switch (preferred) {
        .unsigned8 => {
            result.append(native_float);
            result.append(swapped_float);
            result.append(.signed8);
            result.append(native16);
            result.append(swapped16);
            result.append(native32);
            result.append(swapped32);
        },
        .signed8 => {
            result.append(native_float);
            result.append(swapped_float);
            result.append(.unsigned8);
            result.append(native16);
            result.append(swapped16);
            result.append(native32);
            result.append(swapped32);
        },
        .signed16_le, .signed16_be => if (preferred == native16) {
            result.append(native_float);
            result.append(swapped_float);
            result.append(swapped16);
            result.append(native32);
            result.append(swapped32);
            result.append(.unsigned8);
            result.append(.signed8);
        } else {
            result.append(native_float);
            result.append(swapped_float);
            result.append(native16);
            result.append(swapped32);
            result.append(native32);
            result.append(.unsigned8);
            result.append(.signed8);
        },
        .signed32_le, .signed32_be => if (preferred == native32) {
            result.append(native_float);
            result.append(swapped_float);
            result.append(swapped32);
            result.append(native16);
            result.append(swapped16);
            result.append(.unsigned8);
            result.append(.signed8);
        } else {
            result.append(native_float);
            result.append(swapped_float);
            result.append(native32);
            result.append(swapped16);
            result.append(native16);
            result.append(.unsigned8);
            result.append(.signed8);
        },
        .float32_le, .float32_be => if (preferred == native_float) {
            result.append(swapped_float);
            result.append(native32);
            result.append(swapped32);
            result.append(native16);
            result.append(swapped16);
            result.append(.unsigned8);
            result.append(.signed8);
        } else {
            result.append(native_float);
            result.append(swapped32);
            result.append(native32);
            result.append(swapped16);
            result.append(native16);
            result.append(.unsigned8);
            result.append(.signed8);
        },
        else => {
            result.append(native_float);
            result.append(swapped_float);
            result.append(native32);
            result.append(swapped32);
            result.append(native16);
            result.append(swapped16);
            result.append(.unsigned8);
            result.append(.signed8);
        },
    }
    const all = [_]Format{ .unsigned8, .signed8, .signed16_le, .signed16_be, .signed24_le, .signed24_be, .signed24_32_le, .signed24_32_be, .signed32_le, .signed32_be, .float32_le, .float32_be, .alaw, .mulaw };
    for (all) |format| result.append(format);
    return result;
}

/// Invalid buffer/specification errors are explicit; no partial sample is read.
pub const Error = error{ InvalidLength, BufferTooSmall, InvalidChannels, InvalidChannelMap, InvalidSampleRate, InvalidGain, OverlappingBuffers, InsufficientPadding, Overflow };

/// Interleaved audio description. A frame contains one sample for each channel.
/// This carries no device state or guessed defaults from the process environment.
pub const Spec = struct {
    format: Format,
    channels: u16,
    sample_rate: u32,

    /// Rejects empty channel groups and zero rate before buffer calculations.
    pub fn validate(self: Spec) Error!void {
        if (self.channels == 0) return error.InvalidChannels;
        if (self.sample_rate == 0) return error.InvalidSampleRate;
    }

    /// Byte width of a complete interleaved frame, checked for target overflow.
    pub fn frame_size(self: Spec) Error!usize {
        try self.validate();
        return std.math.mul(usize, self.channels, self.format.bytes_per_sample()) catch error.Overflow;
    }

    /// Counts complete frames and rejects a trailing partial frame.
    pub fn frame_count(self: Spec, bytes: []const u8) Error!usize {
        const width = try self.frame_size();
        if (bytes.len % width != 0) return error.InvalidLength;
        return bytes.len / width;
    }
};

/// Decodes samples into caller-owned normalized f32 storage. Integer minimum
/// maps to -1; its maximum lies just below +1. Floating formats are preserved,
/// including values outside [-1, 1] and NaNs. Buffers must not overlap.
pub fn decode_into(format: Format, source: []const u8, destination: []f32) Error![]f32 {
    const count = try sample_count(format, source);
    if (destination.len < count) return error.BufferTooSmall;
    const output = destination[0..count];
    if (overlaps(source, std.mem.sliceAsBytes(output))) return error.OverlappingBuffers;
    const width = format.bytes_per_sample();
    for (output, 0..) |*sample, i| sample.* = decode_sample(format, source[i * width ..][0..width]);
    return output;
}

/// Encodes normalized f32 samples into caller-owned storage. Integer targets
/// saturate at their endpoints; NaN becomes silence. Eight/sixteen-bit targets
/// round ties to even, matching SDL's scalar conversion. Signed32 conversion
/// truncates towards zero. Float targets preserve the supplied bits and range.
pub fn encode_into(format: Format, source: []const f32, destination: []u8) Error![]u8 {
    const width = format.bytes_per_sample();
    const size = std.math.mul(usize, source.len, width) catch return error.Overflow;
    if (destination.len < size) return error.BufferTooSmall;
    const output = destination[0..size];
    if (overlaps(std.mem.sliceAsBytes(source), output)) return error.OverlappingBuffers;
    for (source, 0..) |sample, i| encode_sample(format, sample, output[i * width ..][0..width]);
    return output;
}

/// Allocates an exact-size converted buffer. The caller frees it with the same
/// allocator. Identical encodings copy/swap bits directly, avoiding loss of low
/// signed32 bits or NaN payloads through an unnecessary intermediate float.
pub fn convert(allocator: std.mem.Allocator, source_format: Format, source: []const u8, destination_format: Format) (Error || std.mem.Allocator.Error)![]u8 {
    const count = try sample_count(source_format, source);
    const width = destination_format.bytes_per_sample();
    const size = std.math.mul(usize, count, width) catch return error.Overflow;
    const destination = try allocator.alloc(u8, size);
    errdefer allocator.free(destination);
    if (source_format == destination_format) {
        @memcpy(destination, source);
    } else if (source_format.encoding() == destination_format.encoding()) {
        // The encoding is unchanged, so only byte order can differ.
        for (0..count) |i| {
            const input = source[i * width ..][0..width];
            const output = destination[i * width ..][0..width];
            for (output, 0..) |*byte, j| byte.* = input[width - 1 - j];
        }
    } else {
        const input_width = source_format.bytes_per_sample();
        for (0..count) |i| {
            const sample = decode_sample(source_format, source[i * input_width ..][0..input_width]);
            encode_sample(destination_format, sample, destination[i * width ..][0..width]);
        }
    }
    return destination;
}

/// Adds source into the destination prefix at gain [0, 1], saturating samples.
/// Integer gain uses SDL's 128-step scale; floats retain the supplied gain.
/// Exact in-place mixing is supported, but partially overlapping buffers are
/// rejected. Shape/gain validation occurs before any destination byte changes.
pub fn mix_into(format: Format, destination: []u8, source: []const u8, gain: f32) Error!void {
    const count = try sample_count(format, source);
    if (destination.len < source.len) return error.BufferTooSmall;
    if (!std.math.isFinite(gain) or gain < 0 or gain > 1) return error.InvalidGain;
    const output = destination[0..source.len];
    if (source.ptr != output.ptr and overlaps(source, output)) return error.OverlappingBuffers;
    if (gain == 0) return;
    const volume: i64 = @intFromFloat(@round(gain * 128));
    const width = format.bytes_per_sample();
    for (0..count) |i| {
        const input = source[i * width ..][0..width];
        const target = output[i * width ..][0..width];
        switch (format.encoding()) {
            .float32, .alaw, .mulaw => {
                const sum = decode_sample(format, target) + decode_sample(format, input) * gain;
                // Comparisons preserve NaN rather than std's numeric min/max
                // operators selecting the finite endpoint instead.
                const clipped = if (sum < -1) @as(f32, -1) else if (sum > 1) @as(f32, 1) else sum;
                encode_sample(format, clipped, target);
            },
            else => {
                const value = integer_sample(format, target) + @divTrunc(integer_sample(format, input) * volume, 128);
                write_integer(format, value, target);
            },
        }
    }
}

fn sample_count(format: Format, bytes: []const u8) Error!usize {
    const width = format.bytes_per_sample();
    if (bytes.len % width != 0) return error.InvalidLength;
    return bytes.len / width;
}

fn decode_sample(format: Format, bytes: []const u8) f32 {
    return switch (format.encoding()) {
        .unsigned8 => @as(f32, @floatFromInt(@as(i16, bytes[0]) - 128)) * 0x1p-7,
        .signed8 => @as(f32, @floatFromInt(@as(i8, @bitCast(bytes[0])))) * 0x1p-7,
        .signed16 => @as(f32, @floatFromInt(std.mem.readInt(i16, bytes[0..2], format.byte_order()))) * 0x1p-15,
        .signed24 => @as(f32, @floatFromInt(read_signed24(bytes, format.byte_order()))) * 0x1p-23,
        .signed24_32 => @as(f32, @floatFromInt(read_signed24_32(bytes, format.byte_order()))) * 0x1p-23,
        .signed32 => @as(f32, @floatFromInt(std.mem.readInt(i32, bytes[0..4], format.byte_order()))) * 0x1p-31,
        .float32 => @bitCast(std.mem.readInt(u32, bytes[0..4], format.byte_order())),
        .alaw => @as(f32, @floatFromInt(decode_alaw(bytes[0]))) * 0x1p-15,
        .mulaw => @as(f32, @floatFromInt(decode_mulaw(bytes[0]))) * 0x1p-15,
    };
}

fn encode_sample(format: Format, value: f32, bytes: []u8) void {
    switch (format.encoding()) {
        .unsigned8 => bytes[0] = @intCast(@as(i16, quantize(i8, value)) + 128),
        .signed8 => bytes[0] = @bitCast(quantize(i8, value)),
        .signed16 => std.mem.writeInt(i16, bytes[0..2], quantize(i16, value), format.byte_order()),
        .signed24 => write_signed24(bytes, quantize(i24, value), format.byte_order()),
        .signed24_32 => std.mem.writeInt(i32, bytes[0..4], quantize(i24, value), format.byte_order()),
        .signed32 => std.mem.writeInt(i32, bytes[0..4], quantize(i32, value), format.byte_order()),
        .float32 => std.mem.writeInt(u32, bytes[0..4], @bitCast(value), format.byte_order()),
        .alaw => bytes[0] = encode_alaw(quantize(i16, value)),
        .mulaw => bytes[0] = encode_mulaw(quantize(i16, value)),
    }
}

// Eight/sixteen-bit SDL converters use float-bias tricks for nearest-even
// rounding. Express that numerical rule directly instead of carrying over
// type-punned unions and magic bit masks. Wider float arithmetic is exact for
// the input's f32 significand and these power-of-two scales.
fn quantize(comptime Integer: type, value: f32) Integer {
    if (std.math.isNan(value)) return 0;
    if (value <= -1) return std.math.minInt(Integer);
    if (value >= 1) return std.math.maxInt(Integer);
    const bits = @bitSizeOf(Integer);
    const scale: f64 = @floatFromInt(@as(u64, 1) << (bits - 1));
    const scaled = @as(f64, value) * scale;
    const rounded = if (Integer == i32) @trunc(scaled) else round_even(scaled);
    const minimum: f64 = @floatFromInt(std.math.minInt(Integer));
    const maximum: f64 = @floatFromInt(std.math.maxInt(Integer));
    return @intFromFloat(std.math.clamp(rounded, minimum, maximum));
}

fn round_even(value: f64) f64 {
    const lower = @floor(value);
    const fraction = value - lower;
    if (fraction < 0.5) return lower;
    if (fraction > 0.5) return lower + 1;
    return if (@mod(lower, 2) == 0) lower else lower + 1;
}

fn integer_sample(format: Format, bytes: []const u8) i64 {
    return switch (format.encoding()) {
        .unsigned8 => @as(i16, bytes[0]) - 128,
        .signed8 => @as(i8, @bitCast(bytes[0])),
        .signed16 => std.mem.readInt(i16, bytes[0..2], format.byte_order()),
        .signed24 => read_signed24(bytes, format.byte_order()),
        .signed24_32 => read_signed24_32(bytes, format.byte_order()),
        .signed32 => std.mem.readInt(i32, bytes[0..4], format.byte_order()),
        .float32 => unreachable,
        .alaw, .mulaw => unreachable,
    };
}

fn write_integer(format: Format, value: i64, bytes: []u8) void {
    switch (format.encoding()) {
        .unsigned8 => bytes[0] = @intCast(std.math.clamp(value + 128, 0, 255)),
        .signed8 => bytes[0] = @bitCast(@as(i8, @intCast(std.math.clamp(value, -128, 127)))),
        .signed16 => std.mem.writeInt(i16, bytes[0..2], @intCast(std.math.clamp(value, -32768, 32767)), format.byte_order()),
        .signed24 => write_signed24(bytes, @intCast(std.math.clamp(value, -8388608, 8388607)), format.byte_order()),
        .signed24_32 => std.mem.writeInt(i32, bytes[0..4], @intCast(std.math.clamp(value, -8388608, 8388607)), format.byte_order()),
        .signed32 => std.mem.writeInt(i32, bytes[0..4], @intCast(std.math.clamp(value, std.math.minInt(i32), std.math.maxInt(i32))), format.byte_order()),
        .float32 => unreachable,
        .alaw, .mulaw => unreachable,
    }
}

fn read_signed24(bytes: []const u8, endian: Endian) i32 {
    const value = std.mem.readInt(u24, bytes[0..3], endian);
    return @as(i32, @bitCast(@as(u32, value) << 8)) >> 8;
}

fn write_signed24(bytes: []u8, value: i24, endian: Endian) void {
    std.mem.writeInt(u24, bytes[0..3], @bitCast(value), endian);
}

fn read_signed24_32(bytes: []const u8, endian: Endian) i32 {
    const value = std.mem.readInt(i32, bytes[0..4], endian);
    const low: u32 = @bitCast(value);
    return @as(i32, @bitCast(low << 8)) >> 8;
}

fn decode_alaw(encoded: u8) i16 {
    const value = encoded ^ 0x55;
    var sample: i32 = @as(i32, value & 0x0f) << 4;
    const segment = (value & 0x70) >> 4;
    sample += 8;
    if (segment != 0) sample = (sample + 0x100) << @as(u5, @intCast(segment - 1));
    if ((value & 0x80) == 0) sample = -sample;
    return @intCast(sample);
}

fn decode_mulaw(encoded: u8) i16 {
    const value = ~encoded;
    var sample: i32 = (@as(i32, value & 0x0f) << 3) + 0x84;
    sample <<= @as(u5, @intCast((value & 0x70) >> 4));
    sample = if ((value & 0x80) != 0) 0x84 - sample else sample - 0x84;
    return @intCast(sample);
}

fn encode_alaw(sample: i16) u8 {
    const endpoints = [_]i32{ 0xff, 0x1ff, 0x3ff, 0x7ff, 0xfff, 0x1fff, 0x3fff, 0x7fff };
    var pcm: i32 = sample;
    const mask: u8 = if (pcm >= 0) 0xd5 else 0x55;
    if (pcm < 0) pcm = -pcm - 1;
    var segment: usize = 0;
    while (segment < endpoints.len and pcm > endpoints[segment]) : (segment += 1) {}
    if (segment == endpoints.len) return 0x7f ^ mask;
    const quantized: u8 = @intCast(if (segment == 0) (pcm >> 4) & 0x0f else (pcm >> @intCast(segment + 3)) & 0x0f);
    return (@as(u8, @intCast(segment)) << 4 | quantized) ^ mask;
}

fn encode_mulaw(sample: i16) u8 {
    const endpoints = [_]i32{ 0xff, 0x1ff, 0x3ff, 0x7ff, 0xfff, 0x1fff, 0x3fff, 0x7fff };
    var pcm: i32 = sample;
    const mask: u8 = if (pcm < 0) 0x7f else 0xff;
    if (pcm < 0) pcm = -pcm;
    pcm = @min(pcm, 32635) + 0x84;
    var segment: usize = 0;
    while (segment < endpoints.len and pcm > endpoints[segment]) : (segment += 1) {}
    if (segment == endpoints.len) return 0x7f ^ mask;
    const nibble: u8 = @intCast((pcm >> @intCast(segment + 3)) & 0x0f);
    return (@as(u8, @intCast(segment)) << 4 | nibble) ^ mask;
}

// Compare distances instead of adding lengths to addresses, so overlap checks
// themselves do not wrap at the top of a pointer's integer representation.
fn overlaps(a: []const u8, b: []const u8) bool {
    if (a.len == 0 or b.len == 0) return false;
    const x = @intFromPtr(a.ptr);
    const y = @intFromPtr(b.ptr);
    return if (x <= y) y - x < a.len else x - y < b.len;
}

/// Bandlimited, interleaved f32 resampling with a twelve-tap Kaiser-windowed
/// sinc filter and cubic coefficient interpolation. The caller supplies history
/// and lookahead explicitly, instead of passing a pointer that may be indexed
/// outside its slice. This object allocates nothing and has no global setup.
///
/// A 32:32 fixed-point phase carries between complete input blocks. Rate changes
/// preserve phase; reset explicitly when starting an unrelated stream. Processing
/// is scalar and preserves the filter design, not SDL's CPU-dispatch machinery.
pub const Resampler = struct {
    /// Number of frames required both before and after a processing block.
    pub const PADDING_FRAMES: usize = 7;
    const ZERO_CROSSINGS = 6;
    const PHASES = 8;
    const TAPS = ZERO_CROSSINGS * 2;
    const PHASE_BITS = 29;
    const ONE_FRAME: u64 = 1 << 32;
    const Polynomial = [4]f32;
    const Filter = [PHASES][TAPS]Polynomial;

    channels: u16,
    step: u64,
    phase: u64 = 0,
    filter: Filter,

    /// Complete input plus its padding, in this order: seven history frames,
    /// `frames` real input frames, then at least seven lookahead frames. Each
    /// frame contains `channels` interleaved samples. Beginning/end padding may
    /// be silence; a streaming caller supplies actual adjacent frames otherwise.
    pub const PaddedInput = struct {
        samples: []const f32,
        frames: usize,
    };

    /// Generates a private filter table. It may be called before a realtime
    /// callback begins; generation uses floating math but no heap allocation.
    pub fn init(source_rate: u32, destination_rate: u32, channels: u16) Error!Resampler {
        if (channels == 0) return error.InvalidChannels;
        return .{ .channels = channels, .step = try rate_step(source_rate, destination_rate), .filter = generate_filter() };
    }

    /// Changes the ratio without losing the carried source phase or rebuilding
    /// the filter. Caller synchronization is required during concurrent access.
    pub fn set_rates(self: *Resampler, source_rate: u32, destination_rate: u32) Error!void {
        self.step = try rate_step(source_rate, destination_rate);
    }

    /// Discards phase at a discontinuity. History/lookahead still belong to the
    /// caller and must be changed consistently with the new stream boundary.
    pub fn reset(self: *Resampler) void {
        self.phase = 0;
    }

    /// Minimum real input frames that contain every sampled position for the
    /// requested output count. Padding is additional and always explicit.
    pub fn input_frames_for(self: *const Resampler, output_frames: usize) Error!usize {
        if (output_frames == 0) return 0;
        const final_phase = @as(u128, output_frames - 1) * self.step + self.phase;
        return std.math.cast(usize, (final_phase >> 32) + 1) orelse error.Overflow;
    }

    /// Output frames produced by consuming a complete input block at the current
    /// phase. Rounding the fixed-point step upwards matches SDL's frame-count
    /// convention; ceiling division accounts for the final sampled position.
    pub fn output_frames_for(self: *const Resampler, input_frames: usize) Error!usize {
        const end = @as(u128, input_frames) << 32;
        if (end <= self.phase) return 0;
        const remaining = end - self.phase;
        return std.math.cast(usize, @divTrunc(remaining - 1, self.step) + 1) orelse error.Overflow;
    }

    /// Consumes the complete real block and returns the written output prefix.
    /// Shape, capacity, padding and overlap checks happen before phase or output
    /// changes. The next block begins after `input.frames`, and its history must
    /// contain those preceding samples. Output may be empty while phase skips a
    /// short downsampling block; that block is still consumed.
    pub fn process(self: *Resampler, input: PaddedInput, destination: []f32) Error![]f32 {
        if (self.channels == 0) return error.InvalidChannels;
        if (self.step == 0) return error.InvalidSampleRate;
        const channels: usize = self.channels;
        if (input.samples.len % channels != 0) return error.InvalidLength;
        const padded_frames = std.math.add(usize, input.frames, PADDING_FRAMES * 2) catch return error.Overflow;
        const required_samples = std.math.mul(usize, padded_frames, channels) catch return error.Overflow;
        if (input.samples.len < required_samples) return error.InsufficientPadding;
        const output_frames = try self.output_frames_for(input.frames);
        const output_samples = std.math.mul(usize, output_frames, channels) catch return error.Overflow;
        if (destination.len < output_samples) return error.BufferTooSmall;
        const output = destination[0..output_samples];
        if (overlaps(std.mem.sliceAsBytes(input.samples), std.mem.sliceAsBytes(output))) return error.OverlappingBuffers;
        if (input.frames == 0) return output;

        // Wide arithmetic makes frame accounting safe for very long blocks.
        // The resulting carry must fit its public representation before writes.
        const end_phase = @as(u128, self.phase) + @as(u128, output_frames) * self.step;
        const consumed_phase = @as(u128, input.frames) << 32;
        const carry = std.math.cast(u64, end_phase - consumed_phase) orelse return error.Overflow;
        var position: u128 = self.phase;
        for (0..output_frames) |frame| {
            const index: usize = @intCast(position >> 32);
            const fraction: u32 = @truncate(position);
            const table_index = fraction >> PHASE_BITS;
            const interpolation = @as(f32, @floatFromInt(fraction & ((1 << PHASE_BITS) - 1))) * 0x1p-29;
            const squared = interpolation * interpolation;
            const cubed = interpolation * squared;
            var weights: [TAPS]f32 = undefined;
            for (&weights, self.filter[table_index]) |*weight, coefficient| {
                weight.* = coefficient[0] + coefficient[1] * interpolation + coefficient[2] * squared + coefficient[3] * cubed;
            }
            // The scalar kernel samples indices index-5 through index+6. Seven
            // prefix/suffix frames leave room without negative pointer indexing.
            const start = (PADDING_FRAMES + index - (ZERO_CROSSINGS - 1)) * channels;
            for (0..channels) |channel| {
                var sum: f32 = 0;
                for (weights, 0..) |weight, tap| sum += input.samples[start + tap * channels + channel] * weight;
                output[frame * channels + channel] = sum;
            }
            position += self.step;
        }
        self.phase = carry;
        return output;
    }

    fn rate_step(source_rate: u32, destination_rate: u32) Error!u64 {
        if (source_rate == 0 or destination_rate == 0) return error.InvalidSampleRate;
        const numerator = @as(u64, source_rate) << 32;
        // Round up, so consuming a rational number of output frames also
        // consumes the expected whole input frame rather than ending just short.
        return @divTrunc(numerator - 1, destination_rate) + 1;
    }

    fn polynomial(y: [4]f32) Polynomial {
        // Fit samples at 0, 1/3, 2/3 and 1. Each coefficient evaluates one tap
        // between neighbouring filter phases without a large coefficient table.
        return .{
            y[0],
            -5.5 * y[0] + 9 * y[1] - 4.5 * y[2] + y[3],
            9 * y[0] - 22.5 * y[1] + 18 * y[2] - 4.5 * y[3],
            -4.5 * y[0] + 13.5 * y[1] - 13.5 * y[2] + 4.5 * y[3],
        };
    }

    fn bessel_i0(value: f32) f32 {
        const squared = value * value * 0.25;
        var sum: f32 = 0;
        var term: f32 = 1;
        var index: f32 = 1;
        while (term >= sum * std.math.floatEps(f32)) {
            sum += term;
            term *= squared / (index * index);
            index += 1;
        }
        return sum;
    }

    fn generate_filter() Filter {
        const resolution = PHASES * 3;
        const length = ZERO_CROSSINGS * resolution;
        const decibels: f32 = 80;
        const coefficient: f32 = 0.1102;
        const baseline: f32 = 8.7;
        const beta = coefficient * (decibels - baseline); // 80 dB Kaiser window.
        const normalization = bessel_i0(beta);
        const squared_length: f32 = length * length;
        var sinc: [resolution]f32 = undefined;
        const pi: f32 = std.math.pi;
        const phase_step = pi / @as(f32, resolution);
        for (&sinc, 0..) |*value, i| value.* = @sin(@as(f32, @floatFromInt(i)) * phase_step) / pi;
        var wing: [length + 1]f32 = undefined;
        wing[0] = 1;
        for (1..wing.len) |i| {
            const distance: f32 = @floatFromInt(i);
            const window = bessel_i0(beta * @sqrt((squared_length - distance * distance) / squared_length)) / normalization;
            // Use a periodic half-sine table so sinc's integer crossings are
            // exactly zero, not sin(pi)'s floating-point approximation to zero.
            const sign: f32 = if ((i / resolution) & 1 == 0) 1 else -1;
            const value = sinc[i % resolution] * sign * resolution / distance;
            wing[i] = window * value;
        }
        var table: Filter = undefined;
        for (0..PHASES) |phase| {
            for (0..ZERO_CROSSINGS) |tap| {
                const offset = (tap * PHASES + phase) * 3;
                const y = wing[offset..][0..4].*;
                table[phase][ZERO_CROSSINGS - tap - 1] = polynomial(y);
                table[PHASES - phase - 1][ZERO_CROSSINGS + tap] = polynomial(.{ y[3], y[2], y[1], y[0] });
            }
        }
        return table;
    }
};

/// Options for frame conversion between two known speaker layouts. Channel maps
/// select an input channel for each output position; null entries mean silence.
/// The input map selects standard source order, and the output map selects from
/// standard destination order. The arrays are copied values, not borrowed C maps.
pub fn Conversion(comptime source_layout: Layout, comptime destination_layout: Layout) type {
    return struct {
        source_format: Format,
        destination_format: Format,
        gain: f32 = 1,
        input_map: ?[source_layout.channels()]?u3 = null,
        output_map: ?[destination_layout.channels()]?u3 = null,
    };
}

/// Converts complete interleaved frames, applying optional routing and gain.
/// Sample rate is unchanged; use Resampler when rates differ. Output is owned by
/// the supplied allocator. Maps/shapes/gain are validated before allocation.
///
/// Frame-sized stack arrays replace SDL's externally supplied typeless scratch
/// buffer. A same-layout, unity-gain path preserves integer bits and float NaN
/// payloads when only byte order or routing changes. Other paths use normalized
/// f32 just as SDL's conversion pipeline does; integer targets saturate.
pub fn convert_frames(comptime source_layout: Layout, comptime destination_layout: Layout, allocator: std.mem.Allocator, source: []const u8, options: Conversion(source_layout, destination_layout)) (Error || std.mem.Allocator.Error)![]u8 {
    const size = try conversion_bytes(source_layout, destination_layout, source, options);
    const destination = try allocator.alloc(u8, size);
    errdefer allocator.free(destination);
    return convert_frames_into(source_layout, destination_layout, source, destination, options);
}

/// Allocation-free frame conversion into caller storage. The returned prefix
/// contains complete frames; excess capacity is untouched. Input/output storage
/// must not overlap. Shape, routing, gain and capacity checks precede mutation.
pub fn convert_frames_into(comptime source_layout: Layout, comptime destination_layout: Layout, source: []const u8, buffer: []u8, options: Conversion(source_layout, destination_layout)) Error![]u8 {
    const source_channels = comptime source_layout.channels();
    const destination_channels = comptime destination_layout.channels();
    const size = try conversion_bytes(source_layout, destination_layout, source, options);
    if (buffer.len < size) return error.BufferTooSmall;
    const destination = buffer[0..size];
    if (overlaps(source, destination)) return error.OverlappingBuffers;
    const input_width = options.source_format.bytes_per_sample();
    const output_width = options.destination_format.bytes_per_sample();
    const input_frame_size = input_width * source_channels;
    const output_frame_size = output_width * destination_channels;
    const frames = source.len / input_frame_size;

    if (source_layout == destination_layout and options.gain == 1 and options.source_format.encoding() == options.destination_format.encoding()) {
        for (0..frames) |frame| {
            for (0..destination_channels) |channel| {
                const standard_index: ?u3 = if (options.output_map) |map| map[channel] else @intCast(channel);
                const input_index: ?u3 = if (standard_index) |index|
                    (if (options.input_map) |map| map[index] else index)
                else
                    null;
                const output = destination[frame * output_frame_size + channel * output_width ..][0..output_width];
                if (input_index) |index| {
                    const input = source[frame * input_frame_size + @as(usize, index) * input_width ..][0..input_width];
                    if (options.source_format.byte_order() == options.destination_format.byte_order()) @memcpy(output, input) else for (output, 0..) |*byte, i| byte.* = input[output_width - i - 1];
                } else {
                    // Unsigned eight-bit silence is centered on 128; every
                    // other supported representation uses zero-valued bytes.
                    @memset(output, options.destination_format.silence_byte());
                }
            }
        }
        return destination;
    }

    for (0..frames) |frame| {
        var input_frame: [source_channels]f32 = undefined;
        for (&input_frame, 0..) |*sample, channel| {
            const selection: ?u3 = if (options.input_map) |map| map[channel] else @intCast(channel);
            sample.* = if (selection) |index|
                decode_sample(options.source_format, source[frame * input_frame_size + @as(usize, index) * input_width ..][0..input_width]) * options.gain
            else
                0;
        }
        var standard_frame: [destination_channels]f32 = undefined;
        _ = try convert_channels(source_layout, destination_layout, &input_frame, &standard_frame);
        for (0..destination_channels) |channel| {
            const selection: ?u3 = if (options.output_map) |map| map[channel] else @intCast(channel);
            const sample = if (selection) |index| standard_frame[index] else 0;
            encode_sample(options.destination_format, sample, destination[frame * output_frame_size + channel * output_width ..][0..output_width]);
        }
    }
    return destination;
}

fn conversion_bytes(comptime source_layout: Layout, comptime destination_layout: Layout, source: []const u8, options: Conversion(source_layout, destination_layout)) Error!usize {
    const source_channels = comptime source_layout.channels();
    const destination_channels = comptime destination_layout.channels();
    if (!std.math.isFinite(options.gain) or options.gain < 0) return error.InvalidGain;
    if (options.input_map) |map| for (map) |entry| {
        if (entry) |index| if (index >= source_channels) return error.InvalidChannelMap;
    };
    if (options.output_map) |map| for (map) |entry| {
        if (entry) |index| if (index >= destination_channels) return error.InvalidChannelMap;
    };
    const input_frame_size = options.source_format.bytes_per_sample() * source_channels;
    if (source.len % input_frame_size != 0) return error.InvalidLength;
    return std.math.mul(usize, source.len / input_frame_size, options.destination_format.bytes_per_sample() * destination_channels) catch error.Overflow;
}

// Speaker conversions from SDL_audio_channel_converters.h. The expressions
// retain their original grouping to avoid changing floating-point rounding.
/// Speaker order for each supported layout. The enum's ordinal is only an
/// implementation detail; callers use descriptive variants rather than counts.
pub const Layout = enum {
    /// One front-center channel.
    mono,
    /// Front-left, front-right.
    stereo,
    /// Front-left, front-right, low-frequency effects.
    stereo_lfe,
    /// Front-left, front-right, back-left, back-right.
    quad,
    /// Front-left, front-right, LFE, back-left, back-right.
    quad_lfe,
    /// Front-left, front-right, front-center, LFE, back-left, back-right.
    surround_5_1,
    /// Front-left, front-right, front-center, LFE, back-center, side-left, side-right.
    surround_6_1,
    /// Front-left, front-right, front-center, LFE, back-left, back-right, side-left, side-right.
    surround_7_1,

    /// Samples per complete interleaved frame.
    pub fn channels(self: Layout) usize {
        return @as(usize, @backingInt(self)) + 1;
    }
};

/// Converts complete f32 frames into a caller-owned output prefix, without
/// allocating or changing their sample rate. Equal-layout copies are overlap
/// safe. Different layouts support exact in-place expansion/contraction, but
/// reject partial overlap. Every source frame is captured before its outputs
/// are written, so speaker rearrangement cannot overwrite an unread channel.
pub fn convert_channels(comptime source_layout: Layout, comptime destination_layout: Layout, source: []const f32, destination: []f32) Error![]f32 {
    const input_channels = comptime source_layout.channels();
    const output_channels = comptime destination_layout.channels();
    if (source.len % input_channels != 0) return error.InvalidLength;
    const frames = source.len / input_channels;
    const needed = std.math.mul(usize, frames, output_channels) catch return error.Overflow;
    if (destination.len < needed) return error.BufferTooSmall;
    const output = destination[0..needed];
    const input_address = @intFromPtr(source.ptr);
    const output_address = @intFromPtr(output.ptr);
    if (source_layout == destination_layout) {
        if (output_address <= input_address) std.mem.copyForwards(f32, output, source) else std.mem.copyBackwards(f32, output, source);
        return output;
    }
    const in_place = input_address == output_address;
    if (!in_place and source.len != 0 and output.len != 0) {
        const input_bytes = std.mem.sliceAsBytes(source).len;
        const output_bytes = std.mem.sliceAsBytes(output).len;
        const overlap = if (input_address <= output_address)
            output_address - input_address < input_bytes
        else
            input_address - output_address < output_bytes;
        if (overlap) return error.OverlappingBuffers;
    }
    // Expansion traverses backwards so writing a longer frame cannot destroy
    // the next unread frame. Contraction traverses forwards for the same reason.
    var remaining = frames;
    while (remaining != 0) {
        const frame = if (in_place and output_channels > input_channels) remaining - 1 else frames - remaining;
        const captured = source[frame * input_channels ..][0..input_channels].*;
        const converted = transform_channels(source_layout, destination_layout, captured);
        @memcpy(output[frame * output_channels ..][0..output_channels], &converted);
        remaining -= 1;
    }
    return output;
}

// These coefficients are semantic data from SDL's channel-conversion source,
// not a new mixing policy. A compile-time selection emits only the requested
// speaker transformation, with no global function table or C calling convention.
fn transform_channels(comptime source_layout: Layout, comptime destination_layout: Layout, input: [source_layout.channels()]f32) [destination_layout.channels()]f32 {
    return switch (comptime (@as(usize, @backingInt(source_layout)) * 8 + @backingInt(destination_layout))) {
        // Mono -> Stereo.
        1 => .{ input[0], input[0] },
        // Mono -> 21.
        2 => .{ input[0], input[0], 0.0 },
        // Mono -> Quad.
        3 => .{ input[0], input[0], 0.0, 0.0 },
        // Mono -> 41.
        4 => .{ input[0], input[0], 0.0, 0.0, 0.0 },
        // Mono -> 51.
        5 => .{ input[0], input[0], 0.0, 0.0, 0.0, 0.0 },
        // Mono -> 61.
        6 => .{ input[0], input[0], 0.0, 0.0, 0.0, 0.0, 0.0 },
        // Mono -> 71.
        7 => .{ input[0], input[0], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 },
        // Stereo -> Mono.
        8 => .{(input[0] * 0.500000000) + (input[1] * 0.500000000)},
        // Stereo -> 21.
        10 => .{ input[0], input[1], 0.0 },
        // Stereo -> Quad.
        11 => .{ input[0], input[1], 0.0, 0.0 },
        // Stereo -> 41.
        12 => .{ input[0], input[1], 0.0, 0.0, 0.0 },
        // Stereo -> 51.
        13 => .{ input[0], input[1], 0.0, 0.0, 0.0, 0.0 },
        // Stereo -> 61.
        14 => .{ input[0], input[1], 0.0, 0.0, 0.0, 0.0, 0.0 },
        // Stereo -> 71.
        15 => .{ input[0], input[1], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 },
        // 21 -> Mono.
        16 => .{(input[0] * 0.333333343) + (input[1] * 0.333333343) + (input[2] * 0.333333343)},
        // 21 -> Stereo.
        17 => .{ (input[0] * 0.800000012) + (input[2] * 0.200000003), (input[1] * 0.800000012) + (input[2] * 0.200000003) },
        // 21 -> Quad.
        19 => .{ (input[2] * 0.111111112) + (input[0] * 0.888888896), (input[2] * 0.111111112) + (input[1] * 0.888888896), (input[2] * 0.111111112), (input[2] * 0.111111112) },
        // 21 -> 41.
        20 => .{ input[0], input[1], input[2], 0.0, 0.0 },
        // 21 -> 51.
        21 => .{ input[0], input[1], 0.0, input[2], 0.0, 0.0 },
        // 21 -> 61.
        22 => .{ input[0], input[1], 0.0, input[2], 0.0, 0.0, 0.0 },
        // 21 -> 71.
        23 => .{ input[0], input[1], 0.0, input[2], 0.0, 0.0, 0.0, 0.0 },
        // Quad -> Mono.
        24 => .{(input[0] * 0.250000000) + (input[1] * 0.250000000) + (input[2] * 0.250000000) + (input[3] * 0.250000000)},
        // Quad -> Stereo.
        25 => .{ (input[0] * 0.421000004) + (input[2] * 0.358999997) + (input[3] * 0.219999999), (input[1] * 0.421000004) + (input[2] * 0.219999999) + (input[3] * 0.358999997) },
        // Quad -> 21.
        26 => .{ (input[0] * 0.421000004) + (input[2] * 0.358999997) + (input[3] * 0.219999999), (input[1] * 0.421000004) + (input[2] * 0.219999999) + (input[3] * 0.358999997), 0.0 },
        // Quad -> 41.
        28 => .{ input[0], input[1], 0.0, input[2], input[3] },
        // Quad -> 51.
        29 => .{ input[0], input[1], 0.0, 0.0, input[2], input[3] },
        // Quad -> 61.
        30 => .{ (input[0] * 0.939999998), (input[1] * 0.939999998), 0.0, 0.0, (input[3] * 0.500000000) + (input[2] * 0.500000000), (input[2] * 0.796000004), (input[3] * 0.796000004) },
        // Quad -> 71.
        31 => .{ input[0], input[1], 0.0, 0.0, input[2], input[3], 0.0, 0.0 },
        // 41 -> Mono.
        32 => .{(input[0] * 0.200000003) + (input[1] * 0.200000003) + (input[2] * 0.200000003) + (input[3] * 0.200000003) + (input[4] * 0.200000003)},
        // 41 -> Stereo.
        33 => .{ (input[0] * 0.374222219) + (input[2] * 0.111111112) + (input[3] * 0.319111109) + (input[4] * 0.195555553), (input[1] * 0.374222219) + (input[2] * 0.111111112) + (input[3] * 0.195555553) + (input[4] * 0.319111109) },
        // 41 -> 21.
        34 => .{ (input[0] * 0.421000004) + (input[3] * 0.358999997) + (input[4] * 0.219999999), (input[1] * 0.421000004) + (input[3] * 0.219999999) + (input[4] * 0.358999997), input[2] },
        // 41 -> Quad.
        35 => .{ (input[0] * 0.941176474) + (input[2] * 0.058823530), (input[1] * 0.941176474) + (input[2] * 0.058823530), (input[2] * 0.058823530) + (input[3] * 0.941176474), (input[2] * 0.058823530) + (input[4] * 0.941176474) },
        // 41 -> 51.
        37 => .{ input[0], input[1], 0.0, input[2], input[3], input[4] },
        // 41 -> 61.
        38 => .{ (input[0] * 0.939999998), (input[1] * 0.939999998), 0.0, input[2], (input[4] * 0.500000000) + (input[3] * 0.500000000), (input[3] * 0.796000004), (input[4] * 0.796000004) },
        // 41 -> 71.
        39 => .{ input[0], input[1], 0.0, input[2], input[3], input[4], 0.0, 0.0 },
        // 51 -> Mono.
        40 => .{(input[0] * 0.166666672) + (input[1] * 0.166666672) + (input[2] * 0.166666672) + (input[3] * 0.166666672) + (input[4] * 0.166666672) + (input[5] * 0.166666672)},
        // 51 -> Stereo.
        41 => .{ (input[0] * 0.294545442) + (input[2] * 0.208181813) + (input[3] * 0.090909094) + (input[4] * 0.251818180) + (input[5] * 0.154545456), (input[1] * 0.294545442) + (input[2] * 0.208181813) + (input[3] * 0.090909094) + (input[4] * 0.154545456) + (input[5] * 0.251818180) },
        // 51 -> 21.
        42 => .{ (input[0] * 0.324000001) + (input[2] * 0.229000002) + (input[4] * 0.277000010) + (input[5] * 0.170000002), (input[1] * 0.324000001) + (input[2] * 0.229000002) + (input[4] * 0.170000002) + (input[5] * 0.277000010), input[3] },
        // 51 -> Quad.
        43 => .{ (input[0] * 0.558095276) + (input[2] * 0.394285709) + (input[3] * 0.047619049), (input[1] * 0.558095276) + (input[2] * 0.394285709) + (input[3] * 0.047619049), (input[3] * 0.047619049) + (input[4] * 0.558095276), (input[3] * 0.047619049) + (input[5] * 0.558095276) },
        // 51 -> 41.
        44 => .{ (input[0] * 0.586000025) + (input[2] * 0.414000005), (input[1] * 0.586000025) + (input[2] * 0.414000005), input[3], (input[4] * 0.586000025), (input[5] * 0.586000025) },
        // 51 -> 61.
        46 => .{ (input[0] * 0.939999998), (input[1] * 0.939999998), (input[2] * 0.939999998), input[3], (input[5] * 0.500000000) + (input[4] * 0.500000000), (input[4] * 0.796000004), (input[5] * 0.796000004) },
        // 51 -> 71.
        47 => .{ input[0], input[1], input[2], input[3], input[4], input[5], 0.0, 0.0 },
        // 61 -> Mono.
        48 => .{(input[0] * 0.143142849) + (input[1] * 0.143142849) + (input[2] * 0.143142849) + (input[3] * 0.142857149) + (input[4] * 0.143142849) + (input[5] * 0.143142849) + (input[6] * 0.143142849)},
        // 61 -> Stereo.
        49 => .{ (input[0] * 0.247384623) + (input[2] * 0.174461529) + (input[3] * 0.076923080) + (input[4] * 0.174461529) + (input[5] * 0.226153851) + (input[6] * 0.100615382), (input[1] * 0.247384623) + (input[2] * 0.174461529) + (input[3] * 0.076923080) + (input[4] * 0.174461529) + (input[5] * 0.100615382) + (input[6] * 0.226153851) },
        // 61 -> 21.
        50 => .{ (input[0] * 0.268000007) + (input[2] * 0.188999996) + (input[4] * 0.188999996) + (input[5] * 0.245000005) + (input[6] * 0.108999997), (input[1] * 0.268000007) + (input[2] * 0.188999996) + (input[4] * 0.188999996) + (input[5] * 0.108999997) + (input[6] * 0.245000005), input[3] },
        // 61 -> Quad.
        51 => .{ (input[0] * 0.463679999) + (input[2] * 0.327360004) + (input[3] * 0.040000003) + (input[5] * 0.168960005), (input[1] * 0.463679999) + (input[2] * 0.327360004) + (input[3] * 0.040000003) + (input[6] * 0.168960005), (input[3] * 0.040000003) + (input[4] * 0.327360004) + (input[5] * 0.431039989), (input[3] * 0.040000003) + (input[4] * 0.327360004) + (input[6] * 0.431039989) },
        // 61 -> 41.
        52 => .{ (input[0] * 0.483000010) + (input[2] * 0.340999991) + (input[5] * 0.175999999), (input[1] * 0.483000010) + (input[2] * 0.340999991) + (input[6] * 0.175999999), input[3], (input[4] * 0.340999991) + (input[5] * 0.449000001), (input[4] * 0.340999991) + (input[6] * 0.449000001) },
        // 61 -> 51.
        53 => .{ (input[0] * 0.611000001) + (input[5] * 0.223000005), (input[1] * 0.611000001) + (input[6] * 0.223000005), (input[2] * 0.611000001), input[3], (input[4] * 0.432000011) + (input[5] * 0.568000019), (input[4] * 0.432000011) + (input[6] * 0.568000019) },
        // 61 -> 71.
        55 => .{ input[0], input[1], input[2], input[3], (input[4] * 0.707000017), (input[4] * 0.707000017), input[5], input[6] },
        // 71 -> Mono.
        56 => .{(input[0] * 0.125125006) + (input[1] * 0.125125006) + (input[2] * 0.125125006) + (input[3] * 0.125000000) + (input[4] * 0.125125006) + (input[5] * 0.125125006) + (input[6] * 0.125125006) + (input[7] * 0.125125006)},
        // 71 -> Stereo.
        57 => .{ (input[0] * 0.211866662) + (input[2] * 0.150266662) + (input[3] * 0.066666670) + (input[4] * 0.181066677) + (input[5] * 0.111066669) + (input[6] * 0.194133341) + (input[7] * 0.085866667), (input[1] * 0.211866662) + (input[2] * 0.150266662) + (input[3] * 0.066666670) + (input[4] * 0.111066669) + (input[5] * 0.181066677) + (input[6] * 0.085866667) + (input[7] * 0.194133341) },
        // 71 -> 21.
        58 => .{ (input[0] * 0.226999998) + (input[2] * 0.160999998) + (input[4] * 0.194000006) + (input[5] * 0.119000003) + (input[6] * 0.208000004) + (input[7] * 0.092000000), (input[1] * 0.226999998) + (input[2] * 0.160999998) + (input[4] * 0.119000003) + (input[5] * 0.194000006) + (input[6] * 0.092000000) + (input[7] * 0.208000004), input[3] },
        // 71 -> Quad.
        59 => .{ (input[0] * 0.466344833) + (input[2] * 0.329241365) + (input[3] * 0.034482758) + (input[6] * 0.169931039), (input[1] * 0.466344833) + (input[2] * 0.329241365) + (input[3] * 0.034482758) + (input[7] * 0.169931039), (input[3] * 0.034482758) + (input[4] * 0.466344833) + (input[6] * 0.433517247), (input[3] * 0.034482758) + (input[5] * 0.466344833) + (input[7] * 0.433517247) },
        // 71 -> 41.
        60 => .{ (input[0] * 0.483000010) + (input[2] * 0.340999991) + (input[6] * 0.175999999), (input[1] * 0.483000010) + (input[2] * 0.340999991) + (input[7] * 0.175999999), input[3], (input[4] * 0.483000010) + (input[6] * 0.449000001), (input[5] * 0.483000010) + (input[7] * 0.449000001) },
        // 71 -> 51.
        61 => .{ (input[0] * 0.518000007) + (input[6] * 0.188999996), (input[1] * 0.518000007) + (input[7] * 0.188999996), (input[2] * 0.518000007), input[3], (input[4] * 0.518000007) + (input[6] * 0.481999993), (input[5] * 0.518000007) + (input[7] * 0.481999993) },
        // 71 -> 61.
        62 => .{ (input[0] * 0.541000009), (input[1] * 0.541000009), (input[2] * 0.541000009), input[3], (input[4] * 0.287999988) + (input[5] * 0.287999988), (input[4] * 0.458999991) + (input[6] * 0.541000009), (input[5] * 0.458999991) + (input[7] * 0.541000009) },
        else => unreachable, // Equal layouts are copied by the caller.
    };
}

test "24-bit PCM and G.711 formats round trip at their defined limits" {
    var bytes24: [3]u8 = undefined;
    encode_sample(.signed24_le, 1, &bytes24);
    try std.testing.expectEqualSlices(u8, &.{ 0xff, 0xff, 0x7f }, &bytes24);
    try std.testing.expectEqual(@as(i32, 8388607), read_signed24(&bytes24, .little));

    var alaw: [1]u8 = undefined;
    var mulaw: [1]u8 = undefined;
    encode_sample(.alaw, 0, &alaw);
    encode_sample(.mulaw, 0, &mulaw);
    try std.testing.expectEqual(@as(u8, 0xd5), alaw[0]);
    try std.testing.expectEqual(@as(u8, 0xff), mulaw[0]);
    try std.testing.expectEqual(@as(f32, 0), decode_sample(.mulaw, &mulaw));
}

test "closest format order begins with the request and native float fallback" {
    const preferences = closest_formats(.unsigned8);
    const ordered = preferences.slice();
    try std.testing.expectEqual(Format.unsigned8, ordered[0]);
    try std.testing.expectEqual(if (builtin.target.cpu.arch.endian() == .little) Format.float32_le else Format.float32_be, ordered[1]);
    try std.testing.expectEqual(@as(usize, 14), ordered.len);
}
